@interface CPLPrequeliteScopeStorage
+ (BOOL)_scopeType:(int64_t)a3 supportsClientSyncWithOptions:(unint64_t)a4;
+ (id)_supportedScopeTypesWithOptions:(unint64_t)a3;
- (BOOL)_addScope:(id)a3 error:(id *)a4;
- (BOOL)_createInitialPrimarySyncScope;
- (BOOL)_scopeTypeSupportsClientSync:(int64_t)a3 scopeIdentifier:(id)a4;
- (BOOL)_setScope:(id)a3 hasCompletedTaskItem:(int64_t)a4 task:(id)a5 error:(id *)a6;
- (BOOL)_setScope:(id)a3 hasTaskTodo:(id)a4 error:(id *)a5;
- (BOOL)_storeLibraryInfo:(id)a3 forScope:(id)a4 libraryInfoHasBeenUpdated:(BOOL *)a5 error:(id *)a6;
- (BOOL)_storeTransportGroup:(id)a3 inColumnVariable:(id)a4 forScope:(id)a5 error:(id *)a6;
- (BOOL)_storeValue:(id)a3 forColumnVariable:(id)a4 scope:(id)a5 error:(id *)a6;
- (BOOL)_transferValueFromVariable:(id)a3 type:(id)a4 ofStorage:(id)a5 toColumnVariable:(id)a6 transformer:(id)a7;
- (BOOL)allActiveScopesHasFinishedSyncs;
- (BOOL)bumpCloudIndexForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)bumpLocalIndexForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)bumpPullFromTransportExpirationIntervalWithError:(id *)a3;
- (BOOL)bumpStableIndexForScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)commitSyncAnchorForScope:(id)a3 error:(id *)a4;
- (BOOL)deleteScopeWithIdentifier:(id)a3 error:(id *)a4;
- (BOOL)didDropSomeRecordsForScope:(id)a3;
- (BOOL)discardStagedSyncAnchorForScope:(id)a3 error:(id *)a4;
- (BOOL)discardStagedSyncAnchorWithScopeFilter:(id)a3 error:(id *)a4;
- (BOOL)doScopesNeedMetadataSync:(id)a3;
- (BOOL)doesScopeNeedToBePulledByClient:(id)a3;
- (BOOL)doesScopeNeedToPullChangesFromTransport:(id)a3;
- (BOOL)doesScopeNeedToPushChangesToTransport:(id)a3;
- (BOOL)doesScopeNeedToUpdateTransport:(id)a3;
- (BOOL)doesScopeNeedToUploadComputeState:(id)a3;
- (BOOL)doesScopeSupportToBePulledByClient:(id)a3;
- (BOOL)fixStorageAfterAnyVersionChange;
- (BOOL)forceIdentifyUknownScopesWithError:(id *)a3;
- (BOOL)forcePushToTransportForActiveScopesWithError:(id *)a3;
- (BOOL)hasFinishedAFullSyncForScope:(id)a3;
- (BOOL)hasScopeFetchedInitialSyncAnchor:(id)a3;
- (BOOL)hasScopesNeedingToPullChangesFromTransport;
- (BOOL)hasScopesNeedingToPushChangesToTransport;
- (BOOL)hasScopesNeedingToPushHighPriorityChangesToTransport;
- (BOOL)hasScopesNeedingToUpdateTransport;
- (BOOL)hasScopesNeedingToUploadComputeState;
- (BOOL)hasStagedSyncAnchorForScope:(id)a3;
- (BOOL)hasStagedSyncAnchors;
- (BOOL)initializeStorage;
- (BOOL)openWithError:(id *)a3;
- (BOOL)resetSyncAnchorForScope:(id)a3 error:(id *)a4;
- (BOOL)resetSyncStateForScope:(id)a3 error:(id *)a4;
- (BOOL)setAllScopesHasChangesToPullFromTransportWithError:(id *)a3;
- (BOOL)setClassNameOfRecordsForInitialQuery:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setDeleteDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setDidDropSomeRecordsForScope:(id)a3 error:(id *)a4;
- (BOOL)setDisabledDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setHasFetchedInitialSyncAnchor:(BOOL)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setInitialDownloadDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setInitialSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setPullFromTransportExpirationInterval:(double)a3 scope:(id)a4 error:(id *)a5;
- (BOOL)setScope:(id)a3 hasCompletedClientNeedsToPullTask:(int64_t)a4 error:(id *)a5;
- (BOOL)setScope:(id)a3 hasCompletedPullFromTransportTask:(int64_t)a4 error:(id *)a5;
- (BOOL)setScope:(id)a3 hasCompletedPushToTransportTask:(int64_t)a4 error:(id *)a5;
- (BOOL)setScope:(id)a3 hasCompletedTransportUpdate:(int64_t)a4 error:(id *)a5;
- (BOOL)setScope:(id)a3 hasCompletedUploadComputeStateTask:(int64_t)a4 error:(id *)a5;
- (BOOL)setScopeHasChangesToPullFromTransport:(id)a3 error:(id *)a4;
- (BOOL)setScopeHasChangesToPushToTransport:(id)a3 error:(id *)a4;
- (BOOL)setScopeNeedsToBePulledByClient:(id)a3 error:(id *)a4;
- (BOOL)setScopeNeedsToUpdateTransport:(id)a3 error:(id *)a4;
- (BOOL)setScopeNeedsToUploadComputeState:(id)a3 error:(id *)a4;
- (BOOL)setScopeNeedsUpdateFromTransport:(id)a3 error:(id *)a4;
- (BOOL)setScopeType:(int64_t)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)setTransportScope:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeActivationDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeBusyState:(int64_t)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeDownloadTransportGroup:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeEstimatedSize:(unint64_t)a3 estimatedAssetCount:(unint64_t)a4 forScope:(id)a5 error:(id *)a6;
- (BOOL)storeInitialMetadataDownloadDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeInitialMetadataQueriesDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeInitialMingleDate:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeLastDateOfClearedPushRepository:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeRewindSyncAnchors:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeScopeChange:(id)a3 forScope:(id)a4 scopeChangeHasBeenUpdated:(BOOL *)a5 error:(id *)a6;
- (BOOL)storeScopeListSyncAnchor:(id)a3 error:(id *)a4;
- (BOOL)storeSupervisorInfo:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeSupportedFeatureVersionInLastSync:(unint64_t)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeTransientSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)storeUploadTransportGroup:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)updateFlags:(id)a3 forScope:(id)a4 error:(id *)a5;
- (BOOL)upgradeScopesWithNewLibraryOptions:(unint64_t)a3 error:(id *)a4;
- (BOOL)upgradeStorageToVersion:(int64_t)a3;
- (CPLPrequeliteScopeStorage)initWithAbstractObject:(id)a3;
- (Class)_transportGroupClass;
- (double)_minimalPullFromTranportExpirationInterval;
- (id)_injectionForFilter:(id)a3;
- (id)_injectionForScopesAllowingPullFromTransport;
- (id)_libraryInfoForScope:(id)a3;
- (id)_librarySateForScope:(id)a3;
- (id)_scopeWithQuery:(id)a3;
- (id)_taskItemCompletionDateForScope:(id)a3 task:(id)a4;
- (id)_transportGroupForColumnVariable:(id)a3 forScope:(id)a4;
- (id)_valueForColumnVariable:(id)a3 scope:(id)a4;
- (id)activationDateForScope:(id)a3;
- (id)addScopeWithIdentifier:(id)a3 scopeType:(int64_t)a4 error:(id *)a5;
- (id)classNameOfRecordsForInitialQueryForScope:(id)a3;
- (id)creationDateForScope:(id)a3;
- (id)deleteDateForScope:(id)a3;
- (id)disabledDateForScope:(id)a3;
- (id)downloadTransportGroupForScope:(id)a3;
- (id)enumeratorForDeletedStagedScopes;
- (id)enumeratorForScopesIncludeInactive:(BOOL)a3;
- (id)enumeratorForScopesNeedingToBePulledByClientWithMaximumCount:(unint64_t)a3;
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
- (id)initialDownloadDateForScope:(id)a3;
- (id)initialMetadataDownloadDateForScope:(id)a3;
- (id)initialMetadataQueriesDateForScope:(id)a3;
- (id)initialMingleDateForScope:(id)a3;
- (id)initialSyncAnchorForScope:(id)a3;
- (id)initialSyncDateForScope:(id)a3;
- (id)lastDateOfClearedPushRepositoryForScope:(id)a3;
- (id)lastDateOfCompletedPullFromTransportForScope:(id)a3;
- (id)lastScopeChangeUpdateDateForScope:(id)a3;
- (id)primaryScope;
- (id)recordsDesignation;
- (id)rewindSyncAnchorsForScope:(id)a3;
- (id)scopeChangeForScope:(id)a3;
- (id)scopeListSyncAnchor;
- (id)scopeWithCloudIndex:(int64_t)a3;
- (id)scopeWithIdentifier:(id)a3;
- (id)scopeWithLocalIndex:(int64_t)a3;
- (id)scopeWithStableIndex:(int64_t)a3;
- (id)stagingScopeForScope:(id)a3;
- (id)statusDictionary;
- (id)supervisorInfoForScope:(id)a3;
- (id)syncAnchorForScope:(id)a3 isCommitted:(BOOL *)a4;
- (id)transientSyncAnchorForScope:(id)a3;
- (id)transportScopeForScope:(id)a3;
- (id)uploadTransportGroupForScope:(id)a3;
- (id)validCloudIndexes;
- (id)validLocalIndexes;
- (int64_t)_bumpIndexWithError:(id *)a3;
- (int64_t)_taskItemForScope:(id)a3 task:(id)a4;
- (int64_t)busyStateForScope:(id)a3;
- (int64_t)clientNeedsToPullTaskForScope:(id)a3;
- (int64_t)pullFromTransportTaskForScope:(id)a3;
- (int64_t)pushToTransportTaskForScope:(id)a3;
- (int64_t)transportUpdateTaskForScope:(id)a3;
- (int64_t)uploadComputeStateTaskForScope:(id)a3;
- (unint64_t)estimatedAssetCountForScope:(id)a3;
- (unint64_t)estimatedSizeForScope:(id)a3;
- (unint64_t)supportedFeatureVersionInLastSyncForScope:(id)a3;
- (void)_cacheValue:(id)a3 forColumnVariable:(id)a4 scope:(id)a5;
- (void)_discardCachedValuesForGroup:(id)a3;
- (void)_fillScopeTypeOrder:(int64_t)a3[7] withOrderOfScopeTypes:(id)a4 name:(id)a5;
- (void)_getLocalIndexes:(id *)a3 cloudIndexes:(id *)a4 forScopeIdentifiers:(id)a5;
- (void)_markFirstSyncOfPrimaryAsSuccessfulWithScope:(id)a3;
- (void)_noteEndOfResetIfNecessary;
- (void)_updateStatusForMainScopeChange:(id)a3;
- (void)writeTransactionDidFail;
- (void)writeTransactionDidSucceed;
@end

@implementation CPLPrequeliteScopeStorage

+ (BOOL)_scopeType:(int64_t)a3 supportsClientSyncWithOptions:(unint64_t)a4
{
  uint64_t v9 = 0;
  v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v6 = sub_1001732D0();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_100173324;
  v8[3] = &unk_10027EC80;
  v8[5] = a3;
  v8[6] = a4;
  v8[4] = &v9;
  [v6 enumerateKeysAndObjectsUsingBlock:v8];

  LOBYTE(v6) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(&v9, 8);
  return (char)v6;
}

+ (id)_supportedScopeTypesWithOptions:(unint64_t)a3
{
  id v4 = objc_alloc_init((Class)NSMutableIndexSet);
  v5 = sub_1001732D0();
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10017347C;
  v8[3] = &unk_10027ECA8;
  unint64_t v10 = a3;
  id v6 = v4;
  id v9 = v6;
  [v5 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

- (CPLPrequeliteScopeStorage)initWithAbstractObject:(id)a3
{
  v87.receiver = self;
  v87.super_class = (Class)CPLPrequeliteScopeStorage;
  v3 = [(CPLPrequeliteStorage *)&v87 initWithAbstractObject:a3];
  if (v3)
  {
    id v4 = +[CPLPrequeliteType integerType];
    uint64_t v5 = [v3 variableWithName:@"nextIndex" defaultValue:&off_100291F80 type:v4];
    id v6 = *(void **)(v3 + 36);
    *(void *)(v3 + 36) = v5;

    v7 = +[CPLPrequeliteType dataType];
    uint64_t v8 = [v3 variableWithName:@"scopeListSyncAnchor" type:v7];
    id v9 = *(void **)(v3 + 44);
    *(void *)(v3 + 44) = v8;

    unint64_t v10 = objc_alloc_init(_CPLPrequeliteScopeBase);
    uint64_t v11 = *(void **)(v3 + 60);
    *(void *)(v3 + 60) = v10;

    char v12 = +[CPLPrequeliteType integerType];
    uint64_t v13 = +[CPLPrequeliteVariable variableWithName:@"flags" defaultValue:&off_100291F80 type:v12];
    v14 = *(void **)(v3 + 68);
    *(void *)(v3 + 68) = v13;

    v15 = +[CPLPrequeliteType dateType];
    uint64_t v16 = +[CPLPrequeliteVariable variableWithName:@"disabledDate" defaultValue:0 type:v15];
    v17 = *(void **)(v3 + 76);
    *(void *)(v3 + 76) = v16;

    v18 = +[CPLPrequeliteType dateType];
    uint64_t v19 = +[CPLPrequeliteVariable variableWithName:@"deleteDate" defaultValue:0 type:v18];
    v20 = *(void **)(v3 + 84);
    *(void *)(v3 + 84) = v19;

    v21 = +[CPLPrequeliteType dataType];
    uint64_t v22 = +[CPLPrequeliteVariable variableWithName:@"libraryInfo" defaultValue:0 type:v21];
    v23 = *(void **)(v3 + 92);
    *(void *)(v3 + 92) = v22;

    v24 = +[CPLPrequeliteType dataType];
    uint64_t v25 = +[CPLPrequeliteVariable variableWithName:@"scopeChange" defaultValue:0 type:v24];
    v26 = *(void **)(v3 + 100);
    *(void *)(v3 + 100) = v25;

    v27 = +[CPLPrequeliteType dateType];
    uint64_t v28 = +[CPLPrequeliteVariable variableWithName:@"lastLibraryInfoUpdate" defaultValue:0 type:v27];
    v29 = *(void **)(v3 + 108);
    *(void *)(v3 + 108) = v28;

    v30 = +[CPLPrequeliteType dataType];
    uint64_t v31 = +[CPLPrequeliteVariable variableWithName:@"transportScope" defaultValue:0 type:v30];
    v32 = *(void **)(v3 + 116);
    *(void *)(v3 + 116) = v31;

    v33 = objc_alloc_init(_CPLPrequeliteScopeSyncState);
    v34 = *(void **)(v3 + 124);
    *(void *)(v3 + 124) = v33;

    v35 = +[CPLPrequeliteType integerType];
    uint64_t v36 = +[CPLPrequeliteVariable variableWithName:@"estimatedSize" defaultValue:0 type:v35];
    v37 = *(void **)(v3 + 132);
    *(void *)(v3 + 132) = v36;

    v38 = +[CPLPrequeliteType integerType];
    uint64_t v39 = +[CPLPrequeliteVariable variableWithName:@"estimatedAssetCount" defaultValue:0 type:v38];
    v40 = *(void **)(v3 + 140);
    *(void *)(v3 + 140) = v39;

    v41 = +[CPLPrequeliteType dateType];
    uint64_t v42 = +[CPLPrequeliteVariable variableWithName:@"initialSyncDate" defaultValue:0 type:v41];
    v43 = *(void **)(v3 + 148);
    *(void *)(v3 + 148) = v42;

    v44 = +[CPLPrequeliteType dateType];
    uint64_t v45 = +[CPLPrequeliteVariable variableWithName:@"initialDownloadDate" defaultValue:0 type:v44];
    v46 = *(void **)(v3 + 156);
    *(void *)(v3 + 156) = v45;

    v47 = +[CPLPrequeliteType dateType];
    uint64_t v48 = +[CPLPrequeliteVariable variableWithName:@"activationDate" defaultValue:0 type:v47];
    v49 = *(void **)(v3 + 164);
    *(void *)(v3 + 164) = v48;

    v50 = +[CPLPrequeliteType dateType];
    uint64_t v51 = +[CPLPrequeliteVariable variableWithName:@"initialMetadataQueriesDate" defaultValue:0 type:v50];
    v52 = *(void **)(v3 + 180);
    *(void *)(v3 + 180) = v51;

    v53 = +[CPLPrequeliteType dateType];
    uint64_t v54 = +[CPLPrequeliteVariable variableWithName:@"initialMetadataDownloadDate" defaultValue:0 type:v53];
    v55 = *(void **)(v3 + 172);
    *(void *)(v3 + 172) = v54;

    v56 = +[CPLPrequeliteType dateType];
    uint64_t v57 = +[CPLPrequeliteVariable variableWithName:@"initialMingleDate" defaultValue:0 type:v56];
    v58 = *(void **)(v3 + 188);
    *(void *)(v3 + 188) = v57;

    v59 = +[CPLPrequeliteType dataType];
    uint64_t v60 = +[CPLPrequeliteVariable variableWithName:@"supervisorInfo" defaultValue:0 type:v59];
    v61 = *(void **)(v3 + 196);
    *(void *)(v3 + 196) = v60;

    [*(id *)(v3 + 196) setShouldNotCacheValue:1];
    v62 = +[CPLPrequeliteType stringType];
    uint64_t v63 = +[CPLPrequeliteVariable variableWithName:@"stagedScopeIdentifier" defaultValue:0 type:v62];
    v64 = *(void **)(v3 + 244);
    *(void *)(v3 + 244) = v63;

    uint64_t v65 = +[CPLPrequeliteTodoVar todoVariableWithName:@"pushToTransport"];
    v66 = *(void **)(v3 + 204);
    *(void *)(v3 + 204) = v65;

    uint64_t v67 = +[CPLPrequeliteTodoVar todoVariableWithName:@"pullFromTransport" defaultExpirationInterval:600.0];
    v68 = *(void **)(v3 + 212);
    *(void *)(v3 + 212) = v67;

    uint64_t v69 = +[CPLPrequeliteTodoVar todoVariableWithName:@"clientNeedsToPull"];
    v70 = *(void **)(v3 + 220);
    *(void *)(v3 + 220) = v69;

    uint64_t v71 = +[CPLPrequeliteTodoVar todoVariableWithName:@"updateTransport"];
    v72 = *(void **)(v3 + 228);
    *(void *)(v3 + 228) = v71;

    uint64_t v73 = +[CPLPrequeliteTodoVar todoVariableWithName:@"computeState"];
    v74 = *(void **)(v3 + 236);
    *(void *)(v3 + 236) = v73;

    v89[0] = *(void *)(v3 + 60);
    v89[1] = *(void *)(v3 + 68);
    v89[2] = *(void *)(v3 + 76);
    v89[3] = *(void *)(v3 + 84);
    v89[4] = *(void *)(v3 + 92);
    v89[5] = *(void *)(v3 + 100);
    v89[6] = *(void *)(v3 + 108);
    v89[7] = *(void *)(v3 + 116);
    v89[8] = *(void *)(v3 + 124);
    v89[9] = *(void *)(v3 + 132);
    v89[10] = *(void *)(v3 + 140);
    v89[11] = *(void *)(v3 + 148);
    v89[12] = *(void *)(v3 + 156);
    v89[13] = *(void *)(v3 + 164);
    v89[14] = *(void *)(v3 + 180);
    v89[15] = *(void *)(v3 + 172);
    v89[16] = *(void *)(v3 + 188);
    v89[17] = *(void *)(v3 + 196);
    v89[18] = *(void *)(v3 + 204);
    v89[19] = *(void *)(v3 + 212);
    v89[20] = *(void *)(v3 + 220);
    v89[21] = *(void *)(v3 + 228);
    v89[22] = *(void *)(v3 + 236);
    v89[23] = *(void *)(v3 + 244);
    v75 = +[NSArray arrayWithObjects:v89 count:24];
    uint64_t v76 = +[CPLPrequeliteVariableGroup variableGroupWithVariablesAndGroups:v75];
    v77 = *(void **)(v3 + 252);
    *(void *)(v3 + 252) = v76;

    v88[0] = *(void *)(v3 + 68);
    v88[1] = *(void *)(v3 + 76);
    v88[2] = *(void *)(v3 + 84);
    v78 = +[NSArray arrayWithObjects:v88 count:3];
    uint64_t v79 = +[CPLPrequeliteVariableGroup variableGroupWithVariables:v78];
    v80 = *(void **)(v3 + 260);
    *(void *)(v3 + 260) = v79;

    v81 = +[CPLPrequeliteType integerType];
    uint64_t v82 = +[CPLPrequeliteVariable variableWithName:@"hasStagedSyncAnchors" type:v81];
    v83 = *(void **)(v3 + 292);
    *(void *)(v3 + 292) = v82;

    id v84 = objc_alloc_init((Class)NSMutableSet);
    v85 = *(void **)(v3 + 52);
    *(void *)(v3 + 52) = v84;
  }
  return (CPLPrequeliteScopeStorage *)v3;
}

- (BOOL)_scopeTypeSupportsClientSync:(int64_t)a3 scopeIdentifier:(id)a4
{
  id v7 = a4;
  uint64_t v8 = [(CPLPrequeliteStorage *)self pqStore];
  id v9 = [v8 libraryOptions];

  unsigned int v10 = [(id)objc_opt_class() _scopeType:a3 supportsClientSyncWithOptions:v9];
  if (v10)
  {
    if ((v9 & 2) == 0)
    {
      LOBYTE(v10) = 1;
      if ((unint64_t)a3 <= 7)
      {
        if (((1 << a3) & 0x30) != 0)
        {
          uint64_t v11 = [(CPLPrequeliteScopeStorage *)self abstractObject];
          char v12 = [v11 mainScopeIdentifier];
          uint64_t v13 = CPLSharingScopePrefixForScopeWithIdentifier();
          LOBYTE(v10) = [v7 hasPrefix:v13];

LABEL_8:
          goto LABEL_9;
        }
        if (a3 == 1)
        {
          uint64_t v11 = [(CPLPrequeliteScopeStorage *)self abstractObject];
          char v12 = [v11 mainScopeIdentifier];
          LOBYTE(v10) = [v7 isEqualToString:v12];
          goto LABEL_8;
        }
        if (((1 << a3) & 0xC1) != 0) {
          sub_1001D042C(a3, (uint64_t)a2, (uint64_t)self);
        }
      }
    }
  }
LABEL_9:

  return v10;
}

- (double)_minimalPullFromTranportExpirationInterval
{
  v2 = [(CPLPrequeliteStorage *)self pqStore];
  BOOL v3 = [v2 libraryOptions] == 0;

  return dbl_1002516F0[v3];
}

- (BOOL)_addScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [(CPLPrequeliteStorage *)self pqStore];
  v35 = [v7 pqlConnection];

  id v8 = [v6 scopeType];
  id v9 = [v6 scopeIdentifier];
  if ([(CPLPrequeliteScopeStorage *)self _scopeTypeSupportsClientSync:v8 scopeIdentifier:v9])
  {
    uint64_t v10 = 0x10000;
  }
  else
  {
    uint64_t v10 = 0;
  }

  [(CPLPrequeliteScopeStorage *)self _minimalPullFromTranportExpirationInterval];
  double v12 = v11;
  if (!_CPLSilentLogging)
  {
    uint64_t v13 = sub_10017319C();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      v14 = +[CPLEngineScopeFlagsUpdate descriptionForFlags:v10];
      *(_DWORD *)buf = 138412546;
      id v42 = v6;
      __int16 v43 = 2114;
      v44 = v14;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Creating record for %@ with flags %{public}@", buf, 0x16u);
    }
  }
  v33 = a4;
  v15 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v16 = [*(id *)((char *)&self->_modifiedVariables + 4) namesInjection];
  v17 = [*(id *)((char *)&self->_transportScopeVar + 4) featureVersionVar];
  uint64_t v18 = *(uint64_t *)((char *)&self->_base + 4);
  uint64_t v19 = [*(id *)((char *)&self->_pushToTransportTodoVar + 4) expirationIntervalVar];
  [*(id *)((char *)&self->_modifiedVariables + 4) injectionForValues:v6];
  v20 = v34 = v6;
  v21 = [*(id *)((char *)&self->_transportScopeVar + 4) featureVersionVar];
  uint64_t v22 = [v21 bindableValueForDefaultValue];
  unsigned __int8 v23 = [v35 cplExecute:@"INSERT INTO %@ (%@, %@, %@, %@) VALUES (%@, %@, %ld, %lu)", v15, v16, v17, v18, v19, v20, v22, v10, (unint64_t)v12];

  if (v23)
  {
    v24 = v34;
    uint64_t v25 = [v34 scopeIdentifier];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    v26 = [*(id *)((char *)&self->_stagedScopeIdentifierVar + 4) variables];
    id v27 = [v26 countByEnumeratingWithState:&v36 objects:v40 count:16];
    if (v27)
    {
      id v28 = v27;
      uint64_t v29 = *(void *)v37;
      do
      {
        for (i = 0; i != v28; i = (char *)i + 1)
        {
          if (*(void *)v37 != v29) {
            objc_enumerationMutation(v26);
          }
          uint64_t v31 = *(void **)(*((void *)&v36 + 1) + 8 * i);
          if ([v31 hasCachedValueForIdentifier:v25]) {
            [v31 discardCachedValue];
          }
        }
        id v28 = [v26 countByEnumeratingWithState:&v36 objects:v40 count:16];
      }
      while (v28);
    }
  }
  else
  {
    v24 = v34;
    if (v33)
    {
      id *v33 = [v35 lastError];
    }
  }

  return v23;
}

- (BOOL)_createInitialPrimarySyncScope
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [v3 libraryCreationDate];
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = v4;
  }
  else
  {
    id v6 = +[NSDate date];
  }
  id v7 = v6;

  id v8 = objc_alloc((Class)CPLEngineScope);
  id v9 = [(CPLPrequeliteStorage *)self mainScopeIdentifier];
  id v10 = [v8 initWithScopeIdentifier:v9 scopeType:1];

  [v10 setCreationDate:v7];
  [v10 setLocalIndex:1];
  [v10 setCloudIndex:2];
  [v10 setStableIndex:3];
  if ([(CPLPrequeliteScopeStorage *)self _addScope:v10 error:0]) {
    BOOL v11 = [(CPLPrequeliteStorage *)self setValue:&off_100291F98 forVariable:*(void *)(&self->super._shouldUpgradeSchema + 1) error:0];
  }
  else {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)initializeStorage
{
  v12.receiver = self;
  v12.super_class = (Class)CPLPrequeliteScopeStorage;
  if ([(CPLPrequeliteStorage *)&v12 initializeStorage]
    && -[CPLPrequeliteStorage createMainTableWithColumnVariables:error:](self, "createMainTableWithColumnVariables:error:", *(CPLPrequeliteVariable **)((char *)&self->_stagedScopeIdentifierVar + 4), 0)&& -[CPLPrequeliteStorage createVariable:defaultValue:error:](self, "createVariable:defaultValue:error:", *(void *)(&self->super._shouldUpgradeSchema + 1), &off_100291F80, 0)&& -[CPLPrequeliteStorage createVariable:defaultValue:error:](self, "createVariable:defaultValue:error:", *(CPLPrequeliteVariable **)((char *)&self->_nextIndexVar + 4), 0, 0)&& ([*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar], v3 = objc_claimAutoreleasedReturnValue(), unsigned int v4 = -[CPLPrequeliteStorage createIndexOnColumnVariable:error:](
               self,
               "createIndexOnColumnVariable:error:",
               v3,
               0),
        v3,
        v4))
  {
    BOOL v5 = [(CPLPrequeliteStorage *)self createIndexOnColumnVariable:*(CPLPrequeliteTodoVar **)((char *)&self->_uploadComputeStateTodoVar + 4) error:0];
  }
  else
  {
    BOOL v5 = 0;
  }
  id v6 = [(CPLPrequeliteScopeStorage *)self abstractObject];
  id v7 = [v6 engineStore];
  unsigned __int8 v8 = [v7 libraryOptions];

  if ((v8 & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      id v9 = sub_10017319C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)BOOL v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Automatically creating PrimarySync scope", v11, 2u);
      }
    }
    return [(CPLPrequeliteScopeStorage *)self _createInitialPrimarySyncScope];
  }
  return v5;
}

- (BOOL)_transferValueFromVariable:(id)a3 type:(id)a4 ofStorage:(id)a5 toColumnVariable:(id)a6 transformer:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  uint64_t v16 = (void (**)(id, void *))a7;
  uint64_t v18 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned int v19 = [(CPLPrequeliteStorage *)self shouldUpgradeSchema];
  v20 = [v18 pqlConnection];
  if (!v19 || [(CPLPrequeliteStorage *)self addColumnVariable:v15 error:0])
  {
    if (v14)
    {
      v21 = [v14 variableWithName:v12 type:v13];
      [v14 valueForVariable:v21];
    }
    else
    {
      v21 = +[CPLPrequeliteVariable variableWithName:v12 type:v13];
      [v18 valueForGlobalVariable:v21];
    uint64_t v22 = };
    v53 = v22;
    if (v16)
    {
      v16[2](v16, v22);
      id v23 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      id v23 = v22;
    }
    id v52 = v23;
    if (v23)
    {
      v49 = v17;
      v50 = v21;
      v24 = v16;
      id v48 = v14;
      uint64_t v25 = v18;
      id v26 = v13;
      id v27 = v12;
      id v28 = v23;
      [(CPLPrequeliteStorage *)self mainTable];
      v30 = uint64_t v29 = v20;
      uint64_t v31 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar];
      v32 = [(CPLPrequeliteStorage *)self mainScopeIdentifier];
      id v47 = v28;
      v33 = v15;
      unsigned int v34 = [v29 cplExecute:@"UPDATE %@ SET %@ = %@ WHERE %@ = %@", v30, v15, v47, v31, v32];

      if (v34)
      {
        id v12 = v27;
        v20 = v29;
        id v13 = v26;
        if ((uint64_t)[v29 changes] < 1)
        {
          id v15 = v33;
          uint64_t v16 = v24;
          if (!_CPLSilentLogging)
          {
            v35 = sub_10017319C();
            v17 = v49;
            v21 = v50;
            uint64_t v18 = v25;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              [v50 variableName];
              uint64_t v45 = v44 = v20;
              *(_DWORD *)buf = 138412546;
              v55 = v45;
              __int16 v56 = 2112;
              uint64_t v57 = v53;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Discarded value of global %@ (%@) - no changes were applied", buf, 0x16u);

              v20 = v44;
            }
            goto LABEL_30;
          }
        }
        else
        {
          id v15 = v33;
          uint64_t v16 = v24;
          if (!_CPLSilentLogging)
          {
            v35 = sub_10017319C();
            uint64_t v18 = v25;
            v21 = v50;
            if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
            {
              [v50 variableName];
              v37 = long long v36 = v20;
              long long v38 = [v33 variableName];
              *(_DWORD *)buf = 138413058;
              v55 = v37;
              __int16 v56 = 2112;
              uint64_t v57 = v53;
              __int16 v58 = 2112;
              id v59 = v52;
              __int16 v60 = 2112;
              v61 = v38;
              _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Transferred value of global %@ (%@) to column %@ (%@) in scope storage", buf, 0x2Au);

              id v15 = v33;
              v20 = v36;
            }
            v17 = v49;
LABEL_30:
            id v14 = v48;
            goto LABEL_31;
          }
        }
        BOOL v43 = 1;
        uint64_t v18 = v25;
        id v14 = v48;
        v17 = v49;
      }
      else
      {
        BOOL v43 = 0;
        id v12 = v27;
        id v13 = v26;
        id v15 = v33;
        uint64_t v18 = v25;
        id v14 = v48;
        v17 = v49;
        v20 = v29;
        uint64_t v16 = v24;
      }
      v21 = v50;
LABEL_33:
      id v23 = v52;
LABEL_34:

      goto LABEL_35;
    }
    if (v53)
    {
      if (_CPLSilentLogging)
      {
        BOOL v43 = 1;
        goto LABEL_34;
      }
      v35 = sub_10017319C();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_31;
      }
      [v21 variableName];
      uint64_t v51 = v21;
      long long v39 = v16;
      v41 = v40 = v20;
      *(_DWORD *)buf = 138412546;
      v55 = v41;
      __int16 v56 = 2112;
      uint64_t v57 = v53;
      id v42 = "Discarded value of global %@ (%@)";
    }
    else
    {
      if (_CPLSilentLogging)
      {
LABEL_32:
        BOOL v43 = 1;
        goto LABEL_33;
      }
      v35 = sub_10017319C();
      if (!os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
LABEL_31:

        goto LABEL_32;
      }
      [v21 variableName];
      uint64_t v51 = v21;
      long long v39 = v16;
      v41 = v40 = v20;
      *(_DWORD *)buf = 138412546;
      v55 = v41;
      __int16 v56 = 2112;
      uint64_t v57 = 0;
      id v42 = "No value for global %@ (%@)";
    }
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, v42, buf, 0x16u);

    v20 = v40;
    uint64_t v16 = v39;
    v21 = v51;
    goto LABEL_31;
  }
  BOOL v43 = 0;
LABEL_35:

  return v43;
}

- (BOOL)upgradeStorageToVersion:(int64_t)a3
{
  LOBYTE(v6) = 1;
  switch(a3)
  {
    case '(':
      return [(CPLPrequeliteStorage *)self createStorage];
    case ')':
      id v14 = [(CPLPrequeliteStorage *)self pqStore];
      id v15 = [v14 pqlConnection];
      uint64_t v16 = [v14 abstractObject];
      v17 = +[CPLPrequeliteType dataType];
      uint64_t v18 = [v14 transientPullRepository];
      unsigned int v19 = [*(id *)((char *)&self->_transportScopeVar + 4) transientSyncAnchorVar];
      unsigned int v20 = [(CPLPrequeliteScopeStorage *)self _transferValueFromVariable:@"syncAnchor" type:v17 ofStorage:v18 toColumnVariable:v19 transformer:&stru_10027ECE8];

      if (!v20) {
        goto LABEL_143;
      }
      v21 = +[CPLPrequeliteType dataType];
      uint64_t v22 = [v14 cloudCache];
      id v23 = [*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar];
      unsigned int v24 = [(CPLPrequeliteScopeStorage *)self _transferValueFromVariable:@"syncAnchor" type:v21 ofStorage:v22 toColumnVariable:v23 transformer:&stru_10027ED08];

      if (!v24) {
        goto LABEL_143;
      }
      uint64_t v25 = +[CPLPrequeliteType dataType];
      id v26 = [v14 cloudCache];
      id v27 = [*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar];
      unsigned int v28 = [(CPLPrequeliteScopeStorage *)self _transferValueFromVariable:@"stagedSyncAnchor" type:v25 ofStorage:v26 toColumnVariable:v27 transformer:&stru_10027ED28];

      if (!v28) {
        goto LABEL_143;
      }
      uint64_t v29 = +[CPLPrequeliteType dataType];
      v30 = [v14 cloudCache];
      uint64_t v31 = [*(id *)((char *)&self->_transportScopeVar + 4) initialSyncAnchorVar];
      unsigned int v32 = [(CPLPrequeliteScopeStorage *)self _transferValueFromVariable:@"initialSyncAnchor" type:v29 ofStorage:v30 toColumnVariable:v31 transformer:&stru_10027ED48];

      if (!v32) {
        goto LABEL_143;
      }
      v33 = +[CPLPrequeliteType stringType];
      unsigned int v34 = [v14 cloudCache];
      v35 = [*(id *)((char *)&self->_transportScopeVar + 4) classForInitialQueryVar];
      unsigned int v36 = [(CPLPrequeliteScopeStorage *)self _transferValueFromVariable:@"classForInitialQuery" type:v33 ofStorage:v34 toColumnVariable:v35 transformer:&stru_10027ED68];

      if (!v36) {
        goto LABEL_143;
      }
      long long v37 = +[CPLPrequeliteType dataType];
      long long v38 = [v14 cloudCache];
      long long v39 = [*(id *)((char *)&self->_transportScopeVar + 4) uploadTransportGroupVar];
      unsigned int v40 = [(CPLPrequeliteScopeStorage *)self _transferValueFromVariable:@"uploadTransportGroup" type:v37 ofStorage:v38 toColumnVariable:v39 transformer:&stru_10027ED88];

      if (!v40) {
        goto LABEL_143;
      }
      v41 = +[CPLPrequeliteType dataType];
      id v42 = [v14 cloudCache];
      BOOL v43 = [*(id *)((char *)&self->_transportScopeVar + 4) downloadTransportGroupVar];
      unsigned int v44 = [(CPLPrequeliteScopeStorage *)self _transferValueFromVariable:@"downloadTransportGroup" type:v41 ofStorage:v42 toColumnVariable:v43 transformer:&stru_10027EDA8];

      if (!v44) {
        goto LABEL_143;
      }
      uint64_t v45 = +[CPLPrequeliteType integerType];
      v46 = [v14 clientCache];
      unsigned int v47 = [(CPLPrequeliteScopeStorage *)self _transferValueFromVariable:@"estimatedLocalLibrarySize" type:v45 ofStorage:v46 toColumnVariable:*(_CPLPrequeliteScopeSyncState **)((char *)&self->_syncState + 4) transformer:&stru_10027EDC8];

      if (!v47) {
        goto LABEL_143;
      }
      id v48 = +[CPLPrequeliteType integerType];
      v49 = [v14 clientCache];
      unsigned int v50 = [(CPLPrequeliteScopeStorage *)self _transferValueFromVariable:@"estimatedLocalLibraryAssetCount" type:v48 ofStorage:v49 toColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_estimatedSizeVar + 4) transformer:&stru_10027EDE8];

      if (!v50) {
        goto LABEL_143;
      }
      if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
      {
        uint64_t v51 = [(CPLPrequeliteStorage *)self mainTable];
        id v52 = *(CPLPrequeliteVariable **)((char *)&self->_estimatedAssetCountVar + 4);
        v53 = [v52 columnDefinition];
        LODWORD(v52) = [v15 cplExecute:@"ALTER TABLE %@ ADD COLUMN %@ %@ DEFAULT NULL", v51, v52, v53];

        if (!v52) {
          goto LABEL_143;
        }
      }
      uint64_t v54 = [(CPLPrequeliteStorage *)self engineLibrary];
      v55 = [v54 initialSyncDate];

      if (!v55) {
        goto LABEL_141;
      }
      __int16 v56 = [(CPLPrequeliteStorage *)self mainTable];
      uint64_t v57 = *(uint64_t *)((char *)&self->_estimatedAssetCountVar + 4);
      v119 = v55;
      [v55 timeIntervalSinceReferenceDate];
      uint64_t v59 = v58;
      __int16 v60 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar];
      v61 = [(CPLPrequeliteStorage *)self mainScopeIdentifier];
      unsigned int v6 = [v15 cplExecute:@"UPDATE %@ SET %@ = %f WHERE %@ = %@", v56, v57, v59, v60, v61];

      if (!v6)
      {

        goto LABEL_144;
      }
      if ((uint64_t)[v15 changes] < 1)
      {
        v55 = v119;
        if (_CPLSilentLogging) {
          goto LABEL_141;
        }
        v62 = sub_10017319C();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Discarded initial sync date - no changes were applied", buf, 2u);
        }
      }
      else
      {
        v55 = v119;
        if (_CPLSilentLogging) {
          goto LABEL_141;
        }
        v62 = sub_10017319C();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v63 = +[CPLDateFormatter stringFromDate:v119];
          *(_DWORD *)buf = 138412290;
          v128 = v63;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Set initial sync date to %@ in scope storage", buf, 0xCu);
        }
      }

      v55 = v119;
LABEL_141:

      v112 = +[CPLPrequeliteType stringType];
      uint64_t v113 = *(uint64_t *)((char *)&self->_lastLibraryInfoUpdateVar + 4);
      v125[0] = _NSConcreteStackBlock;
      v125[1] = 3221225472;
      v125[2] = sub_100176164;
      v125[3] = &unk_10027EE10;
      id v126 = v16;
      LODWORD(v113) = [(CPLPrequeliteScopeStorage *)self _transferValueFromVariable:@"zoneName" type:v112 ofStorage:0 toColumnVariable:v113 transformer:v125];

      if (v113)
      {
        v114 = +[CPLPrequeliteType integerType];
        v115 = [*(id *)((char *)&self->_transportScopeVar + 4) featureVersionVar];
        LOBYTE(v6) = [(CPLPrequeliteScopeStorage *)self _transferValueFromVariable:@"featureVersion" type:v114 ofStorage:0 toColumnVariable:v115 transformer:&stru_10027EE30];

        goto LABEL_144;
      }
LABEL_143:
      LOBYTE(v6) = 0;
      goto LABEL_144;
    case '*':
      if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
        return v6;
      }
      v64 = +[CPLPrequeliteType integerType];
      id v14 = +[CPLPrequeliteVariable variableWithName:@"nextIndex" defaultValue:&off_100291F80 type:v64];

      uint64_t v65 = [(CPLPrequeliteStorage *)self pqStore];
      id v15 = [v65 valueForGlobalVariable:v14];

      if ([(CPLPrequeliteStorage *)self createVariable:*(void *)(&self->super._shouldUpgradeSchema + 1) defaultValue:v15 error:0])
      {
        uint64_t v16 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar];
        unsigned __int8 v66 = [(CPLPrequeliteStorage *)self createIndexOnColumnVariable:v16 error:0];
        goto LABEL_131;
      }
      LOBYTE(v6) = 0;
      goto LABEL_145;
    case '+':
      if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
      {
        if (![(CPLPrequeliteStorage *)self addColumnVariable:*(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4) error:0])goto LABEL_124; {
        if (![(CPLPrequeliteStorage *)self addColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_flagsVar + 4) error:0])goto LABEL_124;
        }
        if (![(CPLPrequeliteStorage *)self addColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_disabledDateVar + 4) error:0])goto LABEL_124; {
        if (![(CPLPrequeliteStorage *)self addColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_deleteDateVar + 4) error:0])goto LABEL_124;
        }
        if (![(CPLPrequeliteStorage *)self addColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_scopeChangeVar + 4) error:0])goto LABEL_124; {
        uint64_t v67 = [*(id *)((char *)&self->_transportScopeVar + 4) droppedSomeRecordsVar];
        }
        unsigned int v68 = [(CPLPrequeliteStorage *)self addColumnVariable:v67 error:0];

        if (!v68) {
          goto LABEL_124;
        }
      }
      uint64_t v69 = [(CPLPrequeliteScopeStorage *)self abstractObject];
      v70 = [v69 engineStore];
      uint64_t v71 = [v70 engineLibrary];

      v116 = [v71 transport];
      long long v121 = 0u;
      long long v122 = 0u;
      long long v123 = 0u;
      long long v124 = 0u;
      id obj = [(CPLPrequeliteScopeStorage *)self enumeratorForScopesIncludeInactive:0];
      id v120 = [obj countByEnumeratingWithState:&v121 objects:v131 count:16];
      if (!v120)
      {
        unsigned __int8 v72 = 1;
        goto LABEL_135;
      }
      uint64_t v118 = *(void *)v122;
      unsigned __int8 v72 = 1;
      while (2)
      {
        uint64_t v73 = 0;
LABEL_51:
        if (*(void *)v122 != v118) {
          objc_enumerationMutation(obj);
        }
        v74 = *(void **)(*((void *)&v121 + 1) + 8 * v73);
        v75 = [v74 scopeIdentifier];
        uint64_t v76 = [(CPLPrequeliteScopeStorage *)self flagsForScope:v74];
        v77 = [(CPLPrequeliteStorage *)self mainScopeIdentifier];
        unsigned int v78 = [v75 isEqualToString:v77];

        if (v78)
        {
          unsigned int v79 = [v71 isExceedingQuota];
          unsigned int v80 = [v71 iCloudLibraryHasBeenWiped];
          v81 = [v71 exitDeleteTime];
          if (v80)
          {
            [v76 setValue:1 forFlag:4];
            if (!v79)
            {
LABEL_56:
              if (!v81) {
                goto LABEL_57;
              }
              goto LABEL_63;
            }
          }
          else if (!v79)
          {
            goto LABEL_56;
          }
          [v76 setValue:1 forFlag:2];
          if (!v81)
          {
LABEL_57:
            if ((v72 & 1) == 0) {
              goto LABEL_72;
            }
LABEL_69:
            if ([v76 valueForFlag:12]) {
              unsigned __int8 v72 = [(CPLPrequeliteScopeStorage *)self setDidDropSomeRecordsForScope:v74 error:0];
            }
            goto LABEL_72;
          }
LABEL_63:
          if (!_CPLSilentLogging)
          {
            uint64_t v82 = sub_10017319C();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
            {
              v83 = [v74 scopeIdentifier];
              id v84 = +[CPLDateFormatter stringFromDateAgo:v81 now:0];
              *(_DWORD *)buf = 138412546;
              v128 = v83;
              __int16 v129 = 2112;
              v130 = v84;
              _os_log_impl((void *)&_mh_execute_header, v82, OS_LOG_TYPE_DEFAULT, "Setting delete date for %@ to %@", buf, 0x16u);
            }
          }
          [v76 setValue:1 forFlag:8];
          if (![(CPLPrequeliteScopeStorage *)self setDeleteDate:v81 forScope:v74 error:0])
          {
            unsigned __int8 v72 = 0;
            goto LABEL_72;
          }
          v85 = [v81 dateByAddingTimeInterval:-2592000.0];
          unsigned __int8 v72 = [(CPLPrequeliteScopeStorage *)self setDisabledDate:v85 forScope:v74 error:0];

          if ((v72 & 1) == 0) {
            goto LABEL_72;
          }
          goto LABEL_69;
        }
        v81 = [(CPLPrequeliteScopeStorage *)self transportScopeForScope:v74];
        if (v81) {
          [v116 upgradeFlags:v76 fromTransportScope:v81];
        }
LABEL_72:

        if ((v72 & 1) != 0 && [v76 updatedFlagsMask])
        {
          if (!_CPLSilentLogging)
          {
            v86 = sub_10017319C();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              objc_super v87 = [v74 scopeIdentifier];
              *(_DWORD *)buf = 138412546;
              v128 = v87;
              __int16 v129 = 2112;
              v130 = v76;
              _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "Upgrading flags for %@ with %@", buf, 0x16u);
            }
          }
          unsigned __int8 v72 = [(CPLPrequeliteScopeStorage *)self updateFlags:v76 forScope:v74 error:0];
        }

        if (v72)
        {
          if (v120 == (id)++v73)
          {
            id v120 = [obj countByEnumeratingWithState:&v121 objects:v131 count:16];
            if (!v120) {
              break;
            }
            continue;
          }
          goto LABEL_51;
        }
        break;
      }
LABEL_135:

      LOBYTE(v6) = v72 & 1;
      return v6;
    case ',':
    case '-':
    case '0':
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '7':
    case '8':
    case '9':
    case ':':
    case ';':
    case '=':
    case '?':
      return v6;
    case '.':
      if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema])
      {
        if (![(CPLPrequeliteStorage *)self addColumnVariableGroup:*(CPLPrequeliteVariable **)((char *)&self->_supervisorInfoVar + 4) error:0]|| ![(CPLPrequeliteStorage *)self addColumnVariableGroup:*(CPLPrequeliteTodoVar **)((char *)&self->_pushToTransportTodoVar + 4) error:0])
        {
          goto LABEL_126;
        }
        v88 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeTypeVar];
        unsigned int v89 = [(CPLPrequeliteStorage *)self addColumnVariable:v88 error:0];

        if (!v89) {
          goto LABEL_127;
        }
        if ([(CPLPrequeliteStorage *)self addColumnVariableGroup:*(CPLPrequeliteTodoVar **)((char *)&self->_pullFromTransportTodoVar + 4) error:0])
        {
          unsigned int v89 = [(CPLPrequeliteStorage *)self addColumnVariableGroup:*(CPLPrequeliteTodoVar **)((char *)&self->_clientNeedsToPullTodoVar + 4) error:0];
        }
        else
        {
LABEL_126:
          unsigned int v89 = 0;
        }
      }
      else
      {
        unsigned int v89 = 1;
      }
LABEL_127:
      v103 = [(CPLPrequeliteStorage *)self pqStore];
      id v14 = [v103 pqlConnection];

      if (!v89) {
        goto LABEL_132;
      }
      v104 = [(CPLPrequeliteStorage *)self mainTable];
      v105 = [*(id *)((char *)&self->_supervisorInfoVar + 4) setHasSomethingTodo];
      unsigned int v6 = [v14 cplExecute:@"UPDATE %@ SET %@", v104, v105];

      if (v6)
      {
        v106 = [(CPLPrequeliteStorage *)self mainTable];
        v107 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeTypeVar];
        v108 = [_CPLPrequeliteScopeIsEqual alloc];
        v109 = [(CPLPrequeliteStorage *)self mainScopeIdentifier];
        v110 = [(_CPLPrequeliteScopeIsEqual *)v108 initWithIdentifier:v109];
        unsigned int v111 = [v14 cplExecute:@"UPDATE %@ SET %@ = %ld WHERE %@", v106, v107, 1, v110];

        if (v111)
        {
          id v15 = [(CPLPrequeliteStorage *)self mainTable];
          uint64_t v16 = [*(id *)((char *)&self->_pullFromTransportTodoVar + 4) setHasSomethingTodo];
          unsigned __int8 v66 = [v14 cplExecute:@"UPDATE %@ SET %@ WHERE %@ & %ld = %ld", v15, v16, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 4, 4];
LABEL_131:
          LOBYTE(v6) = v66;
LABEL_144:

LABEL_145:
        }
        else
        {
LABEL_132:
          LOBYTE(v6) = 0;
        }
      }
      goto LABEL_146;
    case '/':
      if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
        return v6;
      }
      uint64_t v90 = *(uint64_t *)((char *)&self->_nextIndexVar + 4);
      return [(CPLPrequeliteStorage *)self createVariable:v90 defaultValue:0 error:0];
    case '6':
      if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
        return v6;
      }
      return [(CPLPrequeliteScopeStorage *)self bumpPullFromTransportExpirationIntervalWithError:0];
    case '<':
      if ([(CPLPrequeliteStorage *)self shouldUpgradeSchema]
        && ([*(id *)((char *)&self->_transportScopeVar + 4) hasFetchedInitialSyncAnchorVar],
            v91 = objc_claimAutoreleasedReturnValue(),
            unsigned int v92 = [(CPLPrequeliteStorage *)self addColumnVariable:v91 error:0],
            v91,
            !v92))
      {
LABEL_124:
        LOBYTE(v6) = 0;
      }
      else
      {
        v93 = [(CPLPrequeliteStorage *)self pqStore];
        id v14 = [v93 pqlConnection];

        v94 = [(CPLPrequeliteStorage *)self mainTable];
        v95 = [*(id *)((char *)&self->_transportScopeVar + 4) hasFetchedInitialSyncAnchorVar];
        unsigned int v6 = [v14 cplExecute:@"UPDATE %@ SET %@ = %d", v94, v95, 1];

        if (v6)
        {
          id v96 = [v14 changes];
          if (v96)
          {
            if (!_CPLSilentLogging)
            {
              id v97 = v96;
              v98 = sub_10017319C();
              if (os_log_type_enabled(v98, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 134217984;
                v128 = v97;
                _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_DEFAULT, "On upgrade, automatically marked %ld scopes have already fetched their initial sync anchor", buf, 0xCu);
              }
            }
          }
        }
LABEL_146:
      }
      return v6;
    case '>':
      if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
        return v6;
      }
      uint64_t v12 = [*(id *)((char *)&self->_transportScopeVar + 4) lastClearedPushVar];
LABEL_107:
      v99 = (void *)v12;
      BOOL v100 = [(CPLPrequeliteStorage *)self addColumnVariable:v12 error:0];

      return v100;
    case '@':
      if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
        return v6;
      }
      uint64_t v13 = 100;
      goto LABEL_116;
    default:
      if (!v4 & v3)
      {
        switch(a3)
        {
          case 'U':
            unsigned __int8 v8 = [(CPLPrequeliteScopeStorage *)self abstractObject];
            id v9 = [v8 engineStore];
            id v10 = [v9 engineLibrary];

            [v10 setUpgradeSuggestedToAccessAllPhotos:0];
            return v6;
          case 'X':
            if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
              return v6;
            }
            uint64_t v101 = *(uint64_t *)((char *)&self->_updateTransportTodoVar + 4);
            return [(CPLPrequeliteStorage *)self addColumnVariableGroup:v101 error:0];
          case 'Z':
            if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
              return v6;
            }
            uint64_t v13 = 156;
            break;
          case '\\':
            if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
              return v6;
            }
            if (![(CPLPrequeliteStorage *)self addColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_initialDownloadDateVar + 4) error:0]|| ![(CPLPrequeliteStorage *)self addColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_initialMetadataDownloadDateVar + 4) error:0]|| ![(CPLPrequeliteStorage *)self addColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_activationDateVar + 4) error:0])
            {
              goto LABEL_124;
            }
            uint64_t v13 = 188;
            break;
          default:
            return v6;
        }
LABEL_116:
        uint64_t v102 = *(void *)&self->super.CPLPlatformObject_opaque[v13];
        return [(CPLPrequeliteStorage *)self addColumnVariable:v102 error:0];
      }
      else
      {
        switch(a3)
        {
          case 'F':
            if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
              return v6;
            }
            if (![(CPLPrequeliteStorage *)self addColumnVariable:*(CPLPrequeliteTodoVar **)((char *)&self->_uploadComputeStateTodoVar + 4) error:0])goto LABEL_124; {
            uint64_t v11 = *(uint64_t *)((char *)&self->_uploadComputeStateTodoVar + 4);
            }
            BOOL result = [(CPLPrequeliteStorage *)self createIndexOnColumnVariable:v11 error:0];
            break;
          case 'G':
            if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
              return v6;
            }
            uint64_t v12 = [*(id *)((char *)&self->_transportScopeVar + 4) rewindSyncAnchorsVar];
            goto LABEL_107;
          case 'H':
          case 'I':
          case 'J':
          case 'K':
          case 'L':
          case 'N':
            return v6;
          case 'M':
            if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
              return v6;
            }
            uint64_t v12 = [*(id *)((char *)&self->_transportScopeVar + 4) busyStateVar];
            goto LABEL_107;
          case 'O':
            if (![(CPLPrequeliteStorage *)self shouldUpgradeSchema]) {
              return v6;
            }
            uint64_t v13 = 196;
            goto LABEL_116;
          default:
            JUMPOUT(0);
        }
      }
      return result;
  }
}

- (BOOL)upgradeScopesWithNewLibraryOptions:(unint64_t)a3 error:(id *)a4
{
  uint64_t v48 = 0;
  v49 = &v48;
  uint64_t v50 = 0x2020000000;
  BOOL v4 = 1;
  char v51 = 1;
  if (a3)
  {
    __int16 v6 = a3;
    unsigned __int8 v8 = [(id)objc_opt_class() _supportedScopeTypesWithOptions:a3];
    id v9 = [(CPLPrequeliteStorage *)self pqStore];
    id v10 = [v9 pqlConnection];

    [*(id *)((char *)&self->_base + 4) discardCachedValue];
    uint64_t v44 = 0;
    uint64_t v45 = &v44;
    uint64_t v46 = 0x2020000000;
    uint64_t v47 = 0;
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_100176718;
    v39[3] = &unk_10027EE58;
    id v42 = &v48;
    id v11 = v10;
    id v40 = v11;
    v41 = self;
    BOOL v43 = &v44;
    [v8 enumerateIndexesUsingBlock:v39];
    if (*((unsigned char *)v49 + 24))
    {
      if (v45[3] >= 1 && !_CPLSilentLogging)
      {
        uint64_t v12 = sub_10017319C();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v13 = v45[3];
          *(_DWORD *)buf = 134217984;
          uint64_t v54 = v13;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Automatically set %lld scopes to sync with client", buf, 0xCu);
        }
      }
    }
    else if (a4)
    {
      *a4 = [v11 lastCPLError];
    }
    if (*((unsigned char *)v49 + 24))
    {
      unsigned __int8 v14 = [(CPLPrequeliteScopeStorage *)self bumpPullFromTransportExpirationIntervalWithError:a4];
      *((unsigned char *)v49 + 24) = v14;
      char v15 = (v6 & 0x400) != 0 ? v14 ^ 1 : 1;
      if ((v15 & 1) == 0)
      {
        uint64_t v16 = [(CPLPrequeliteStorage *)self pqStore];
        v17 = [v16 pqlConnection];

        uint64_t v18 = [*(id *)((char *)&self->_modifiedVariables + 4) namesInjection];
        unsigned int v19 = [(CPLPrequeliteStorage *)self mainTable];
        id v20 = [v17 cplFetch:@"SELECT %@ FROM %@ WHERE (%@ & %ld) = %ld", v18, v19, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 65552, 65552];
        v38[0] = _NSConcreteStackBlock;
        v38[1] = 3221225472;
        v38[2] = sub_100176804;
        v38[3] = &unk_10027EE80;
        v38[4] = self;
        v21 = [v20 enumerateObjects:v38];

        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v22 = v21;
        id v23 = [v22 countByEnumeratingWithState:&v34 objects:v52 count:16];
        v33 = v8;
        if (v23)
        {
          uint64_t v24 = 0;
          uint64_t v25 = *(void *)v35;
          while (2)
          {
            id v26 = v17;
            id v27 = 0;
            uint64_t v28 = (uint64_t)v23 + v24;
            do
            {
              if (*(void *)v35 != v25) {
                objc_enumerationMutation(v22);
              }
              unsigned __int8 v29 = [(CPLPrequeliteScopeStorage *)self setScopeNeedsUpdateFromTransport:*(void *)(*((void *)&v34 + 1) + 8 * (void)v27) error:a4];
              *((unsigned char *)v49 + 24) = v29;
              if ((v29 & 1) == 0)
              {
                uint64_t v28 = (uint64_t)v27 + v24 + 1;
                v17 = v26;
                goto LABEL_26;
              }
              id v27 = (char *)v27 + 1;
            }
            while (v23 != v27);
            id v23 = [v22 countByEnumeratingWithState:&v34 objects:v52 count:16];
            uint64_t v24 = v28;
            v17 = v26;
            if (v23) {
              continue;
            }
            break;
          }
        }
        else
        {
          uint64_t v28 = 0;
        }
LABEL_26:

        unsigned __int8 v8 = v33;
        if (*((unsigned char *)v49 + 24)) {
          BOOL v30 = _CPLSilentLogging == 0;
        }
        else {
          BOOL v30 = 0;
        }
        if (v30)
        {
          uint64_t v31 = sub_10017319C();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v54 = v28;
            _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "Upgrading to support inactive scope sync will force updating scope info for %lu inactive scopes", buf, 0xCu);
          }
        }
      }
    }

    _Block_object_dispose(&v44, 8);
    BOOL v4 = *((unsigned char *)v49 + 24) != 0;
  }
  _Block_object_dispose(&v48, 8);
  return v4;
}

- (BOOL)openWithError:(id *)a3
{
  v8.receiver = self;
  v8.super_class = (Class)CPLPrequeliteScopeStorage;
  BOOL v4 = [(CPLPrequeliteStorage *)&v8 openWithError:a3];
  if (v4)
  {
    BOOL v5 = [(CPLPrequeliteStorage *)self pqStore];
    __int16 v6 = [v5 pqlConnection];

    [v6 cplRegisterDeterministicFunction:@"scopeTypeOrder" nArgs:2 handler:&stru_10027EEC0];
    BYTE4(self->_transportGroupClass) = 1;
  }
  return v4;
}

- (void)_fillScopeTypeOrder:(int64_t)a3[7] withOrderOfScopeTypes:(id)a4 name:(id)a5
{
  id v13 = a4;
  id v9 = a5;
  if ([v13 count] != (id)7) {
    sub_1001D04D0((uint64_t)v9, (uint64_t)a2, (uint64_t)self);
  }
  for (int64_t i = 0; i != 7; ++i)
  {
    id v11 = [v13 objectAtIndexedSubscript:i];
    id v12 = [v11 integerValue];

    a3[(void)v12] = i;
  }
}

- (id)recordsDesignation
{
  return @"scopes";
}

- (id)statusDictionary
{
  return &__NSDictionary0__struct;
}

- (void)_updateStatusForMainScopeChange:(id)a3
{
  BOOL v4 = [a3 libraryInfo];
  id v9 = [v4 featureCompatibleVersion];

  BOOL v5 = [(CPLPrequeliteScopeStorage *)self abstractObject];
  __int16 v6 = [v5 engineStore];
  id v7 = [v6 engineLibrary];

  if (v9) {
    id v8 = [v9 integerValue];
  }
  else {
    id v8 = 0;
  }
  [v7 setServerFeatureCompatibleVersion:v8];
}

- (BOOL)fixStorageAfterAnyVersionChange
{
  v9.receiver = self;
  v9.super_class = (Class)CPLPrequeliteScopeStorage;
  BOOL v3 = [(CPLPrequeliteStorage *)&v9 fixStorageAfterAnyVersionChange];
  if (v3)
  {
    BOOL v4 = [(CPLPrequeliteStorage *)self mainScopeIdentifier];
    BOOL v5 = [(CPLPrequeliteScopeStorage *)self scopeWithIdentifier:v4];

    if (v5)
    {
      uint64_t v6 = [(CPLPrequeliteScopeStorage *)self scopeChangeForScope:v5];
      if (v6)
      {
        id v7 = (void *)v6;
        [(CPLPrequeliteScopeStorage *)self _updateStatusForMainScopeChange:v6];
      }
    }
  }
  return v3;
}

- (BOOL)_setScope:(id)a3 hasTaskTodo:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = [(CPLPrequeliteStorage *)self pqStore];
  id v11 = [v10 pqlConnection];

  id v12 = [(CPLPrequeliteStorage *)self mainTable];
  id v13 = [v8 setHasSomethingTodo];

  unsigned __int8 v14 = [_CPLPrequeliteScopeIsEqual alloc];
  char v15 = [v9 scopeIdentifier];

  uint64_t v16 = [(_CPLPrequeliteScopeIsEqual *)v14 initWithIdentifier:v15];
  unsigned __int8 v17 = [v11 cplExecute:@"UPDATE %@ SET %@ WHERE %@", v12, v13, v16];

  if (a5 && (v17 & 1) == 0)
  {
    *a5 = [v11 lastCPLError];
  }

  return v17;
}

- (int64_t)_taskItemForScope:(id)a3 task:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(CPLPrequeliteStorage *)self pqStore];
  id v9 = [v8 pqlConnection];

  uint64_t v10 = objc_opt_class();
  id v11 = [v6 targetGenerationVar];

  id v12 = [(CPLPrequeliteStorage *)self mainTable];
  id v13 = [*(id *)((char *)&self->_modifiedVariables + 4) localIndexVar];
  id v14 = [v7 localIndex];

  id v15 = [v9 cplFetchObjectOfClass:v10, @"SELECT %@ FROM %@ WHERE %@ = %ld", v11, v12, v13, v14 sql];
  id v16 = [v15 integerValue];

  return (int64_t)v16;
}

- (id)_taskItemCompletionDateForScope:(id)a3 task:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 lastCompletionDateVar];

  if (v8)
  {
    id v9 = [v7 lastCompletionDateVar];
    uint64_t v10 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v9 scope:v6];
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)_setScope:(id)a3 hasCompletedTaskItem:(int64_t)a4 task:(id)a5 error:(id *)a6
{
  id v10 = a5;
  id v11 = a3;
  id v12 = [(CPLPrequeliteStorage *)self pqStore];
  id v13 = [v12 pqlConnection];

  id v14 = [(CPLPrequeliteStorage *)self mainTable];
  id v15 = [v10 setHasCompletedGeneration:a4];

  id v16 = [*(id *)((char *)&self->_modifiedVariables + 4) localIndexVar];
  id v17 = [v11 localIndex];

  unsigned __int8 v18 = [v13 cplExecute:@"UPDATE %@ SET %@ WHERE %@ = %ld", v14, v15, v16, v17];
  if (a6 && (v18 & 1) == 0)
  {
    *a6 = [v13 lastCPLError];
  }

  return v18;
}

- (id)enumeratorForScopesIncludeInactive:(BOOL)a3
{
  BOOL v3 = a3;
  BOOL v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [v5 pqlConnection];

  id v7 = [*(id *)((char *)&self->_modifiedVariables + 4) namesInjection];
  uint64_t v8 = [(CPLPrequeliteStorage *)self mainTable];
  id v9 = (void *)v8;
  if (v3)
  {
    id v10 = [v6 cplFetch:@"SELECT %@ FROM %@", v7, v8];
    id v11 = v10;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100177190;
    v16[3] = &unk_10027EE80;
    v16[4] = self;
    id v12 = v16;
  }
  else
  {
    id v10 = [v6 cplFetch:@"SELECT %@ FROM %@ WHERE (%@ & %ld) = 0", v7, v8, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 16];
    id v11 = v10;
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_100177230;
    v15[3] = &unk_10027EE80;
    v15[4] = self;
    id v12 = v15;
  }
  id v13 = [v10 enumerateObjects:v12];

  return v13;
}

- (id)enumeratorForScopesNeedingUpdateFromTransport
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v18 = [v3 pqlConnection];

  BOOL v4 = +[NSDate date];
  BOOL v5 = [*(id *)((char *)&self->_scopeChangeVar + 4) bindableValueForValue:v4];
  id v6 = *(CPLPrequeliteVariable **)((char *)&self->_scopeChangeVar + 4);
  id v7 = [v4 dateByAddingTimeInterval:-86400.0];
  uint64_t v8 = [v6 bindableValueForValue:v7];

  id v9 = [*(id *)((char *)&self->_modifiedVariables + 4) namesInjection];
  id v10 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v11 = *(uint64_t *)((char *)&self->_base + 4);
  uint64_t v12 = *(uint64_t *)((char *)&self->_lastLibraryInfoUpdateVar + 4);
  uint64_t v13 = *(uint64_t *)((char *)&self->_scopeChangeVar + 4);
  id v14 = [*(id *)((char *)&self->_transportScopeVar + 4) busyStateVar];
  id v15 = [v18 cplFetch:@"SELECT %@ FROM %@ WHERE ((%@ & %ld) = 0) AND ((%@ IS NULL) OR (%@ IS NULL) OR (%@ > %@) OR (%@ < %@) OR (%@ != 0))", v9, v10, v11, 4, v12, v13, v13, v5, v13, v8, v14];

  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_1001774B8;
  v19[3] = &unk_10027EE80;
  v19[4] = self;
  id v16 = [v15 enumerateObjects:v19];

  return v16;
}

- (id)enumeratorForDeletedStagedScopes
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  BOOL v4 = [v3 pqlConnection];

  BOOL v5 = [*(id *)((char *)&self->_modifiedVariables + 4) namesInjection];
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  id v7 = [v4 cplFetch:@"SELECT %@ FROM %@ WHERE (%@ & %ld) = %ld", v5, v6, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 68, 68];
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100177680;
  v10[3] = &unk_10027EE80;
  v10[4] = self;
  uint64_t v8 = [v7 enumerateObjects:v10];

  return v8;
}

- (BOOL)forceIdentifyUknownScopesWithError:(id *)a3
{
  BOOL v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [v5 pqlConnection];

  [*(id *)((char *)&self->_scopeChangeVar + 4) discardCachedValue];
  id v7 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v8 = *(uint64_t *)((char *)&self->_scopeChangeVar + 4);
  id v9 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeTypeVar];
  unsigned int v10 = [v6 cplExecute:@"UPDATE %@ SET %@ = NULL WHERE %@ = %ld", v7, v8, v9, 0];

  if (v10)
  {
    id v11 = [v6 changes];
    if (!_CPLSilentLogging)
    {
      id v12 = v11;
      uint64_t v13 = sub_10017319C();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v16 = v12;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Will try to identify %lld yet unidentified scopes", buf, 0xCu);
      }
    }
  }
  else if (a3)
  {
    *a3 = [v6 lastCPLError];
  }

  return v10;
}

- (BOOL)forcePushToTransportForActiveScopesWithError:(id *)a3
{
  BOOL v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [v5 pqlConnection];

  id v7 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v8 = [*(id *)((char *)&self->_supervisorInfoVar + 4) setHasSomethingTodo];
  unsigned int v9 = [v6 cplExecute:@"UPDATE %@ SET %@ WHERE %@ & %ld = 0", v7, v8, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 16];

  if (v9)
  {
    id v10 = [v6 changes];
    if (!_CPLSilentLogging)
    {
      id v11 = v10;
      id v12 = sub_10017319C();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 134217984;
        id v15 = v11;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Marked %lld scopes as need to push to transport", buf, 0xCu);
      }
    }
  }
  else if (a3)
  {
    *a3 = [v6 lastCPLError];
  }

  return v9;
}

- (id)enumeratorForScopesNeedingToPushHighPriorityChangesToTransport
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100177C2C;
  block[3] = &unk_100275EA0;
  block[4] = self;
  if (qword_1002DBD68 != -1) {
    dispatch_once(&qword_1002DBD68, block);
  }
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  BOOL v4 = [v3 pqlConnection];

  BOOL v5 = [*(id *)((char *)&self->_modifiedVariables + 4) namesInjection];
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v7 = *(uint64_t *)((char *)&self->_base + 4);
  uint64_t v8 = [*(id *)((char *)&self->_supervisorInfoVar + 4) hasSomethingTodo];
  uint64_t v9 = *(uint64_t *)((char *)&self->_lastLibraryInfoUpdateVar + 4);
  uint64_t v10 = *(uint64_t *)((char *)&self->_base + 4);
  id v11 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeTypeVar];
  id v12 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar];
  id v13 = [v4 cplFetch:@"SELECT %@ FROM %@ WHERE (%@ & %ld) = %ld AND %@ AND (%@ IS NOT NULL OR (%@ & %ld) != 0) ORDER BY scopeTypeOrder(%@, %p), %@ ASC", v5, v6, v7, 131088, 0x20000, v8, v9, v10, 4, v11, &unk_1002DBD30, v12];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100177C4C;
  v16[3] = &unk_10027EE80;
  v16[4] = self;
  id v14 = [v13 enumerateObjects:v16];

  return v14;
}

- (BOOL)hasScopesNeedingToPushHighPriorityChangesToTransport
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  BOOL v4 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v5 = *(uint64_t *)((char *)&self->_base + 4);
  id v6 = [*(id *)((char *)&self->_supervisorInfoVar + 4) hasSomethingTodo];
  uint64_t v7 = +[PQLFormatInjection formatInjection:@"(%@ & %ld) = %ld AND %@", v5, 131088, 0x20000, v6];
  LOBYTE(v5) = [v3 table:v4 hasRecordsMatchingQuery:v7];

  return v5;
}

- (id)enumeratorForScopesNeedingToPushChangesToTransport
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100177FDC;
  block[3] = &unk_100275EA0;
  block[4] = self;
  if (qword_1002DBDA8 != -1) {
    dispatch_once(&qword_1002DBDA8, block);
  }
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  BOOL v4 = [v3 pqlConnection];

  uint64_t v5 = [*(id *)((char *)&self->_modifiedVariables + 4) namesInjection];
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v7 = *(uint64_t *)((char *)&self->_base + 4);
  uint64_t v8 = [*(id *)((char *)&self->_supervisorInfoVar + 4) hasSomethingTodo];
  uint64_t v9 = *(uint64_t *)((char *)&self->_lastLibraryInfoUpdateVar + 4);
  uint64_t v10 = *(uint64_t *)((char *)&self->_base + 4);
  id v11 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeTypeVar];
  id v12 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar];
  id v13 = [v4 cplFetch:@"SELECT %@ FROM %@ WHERE (%@ & %ld) = 0 AND %@ AND (%@ IS NOT NULL OR (%@ & %ld) != 0) ORDER BY scopeTypeOrder(%@, %p), %@ ASC", v5, v6, v7, 131088, v8, v9, v10, 4, v11, &unk_1002DBD70, v12];

  v16[0] = _NSConcreteStackBlock;
  v16[1] = 3221225472;
  v16[2] = sub_100177FFC;
  v16[3] = &unk_10027EE80;
  v16[4] = self;
  id v14 = [v13 enumerateObjects:v16];

  return v14;
}

- (BOOL)hasScopesNeedingToPushChangesToTransport
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  BOOL v4 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v5 = *(uint64_t *)((char *)&self->_base + 4);
  id v6 = [*(id *)((char *)&self->_supervisorInfoVar + 4) hasSomethingTodo];
  uint64_t v7 = +[PQLFormatInjection formatInjection:@"(%@ & %ld) = 0 AND %@", v5, 131088, v6];
  LOBYTE(v5) = [v3 table:v4 hasRecordsMatchingQuery:v7];

  return v5;
}

- (BOOL)setScopeHasChangesToPushToTransport:(id)a3 error:(id *)a4
{
  return [(CPLPrequeliteScopeStorage *)self _setScope:a3 hasTaskTodo:*(CPLPrequeliteVariable **)((char *)&self->_supervisorInfoVar + 4) error:a4];
}

- (int64_t)pushToTransportTaskForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _taskItemForScope:a3 task:*(CPLPrequeliteVariable **)((char *)&self->_supervisorInfoVar + 4)];
}

- (BOOL)setScope:(id)a3 hasCompletedPushToTransportTask:(int64_t)a4 error:(id *)a5
{
  return [(CPLPrequeliteScopeStorage *)self _setScope:a3 hasCompletedTaskItem:a4 task:*(CPLPrequeliteVariable **)((char *)&self->_supervisorInfoVar + 4) error:a5];
}

- (BOOL)doesScopeNeedToPushChangesToTransport:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v7 = [_CPLPrequeliteScopeIsEqual alloc];
  uint64_t v8 = [v4 scopeIdentifier];

  uint64_t v9 = [(_CPLPrequeliteScopeIsEqual *)v7 initWithIdentifier:v8];
  uint64_t v10 = *(uint64_t *)((char *)&self->_base + 4);
  id v11 = [*(id *)((char *)&self->_supervisorInfoVar + 4) hasSomethingTodo];
  id v12 = +[PQLFormatInjection formatInjection:@"%@ AND (%@ & %ld) = 0 AND %@", v9, v10, 16, v11];
  LOBYTE(v10) = [v5 table:v6 hasRecordsMatchingQuery:v12];

  return v10;
}

- (id)_injectionForScopesAllowingPullFromTransport
{
  BOOL v3 = *(CPLPrequeliteVariableGroup **)((char *)&self->_libraryStateGroup + 4);
  if (!v3)
  {
    +[PQLFormatInjection formatInjection:@"((%@ & %ld) = 0 OR (%@ & %ld) = %ld)", *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 262164, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 262228, 68];
    id v4 = (CPLPrequeliteVariableGroup *)objc_claimAutoreleasedReturnValue();
    uint64_t v5 = *(CPLPrequeliteVariableGroup **)((char *)&self->_libraryStateGroup + 4);
    *(CPLPrequeliteVariableGroup **)((char *)&self->_libraryStateGroup + 4) = v4;

    BOOL v3 = *(CPLPrequeliteVariableGroup **)((char *)&self->_libraryStateGroup + 4);
  }
  return v3;
}

- (id)enumeratorForScopesNeedingToPullChangesFromTransport
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100178558;
  block[3] = &unk_100275EA0;
  block[4] = self;
  if (qword_1002DBDE8 != -1) {
    dispatch_once(&qword_1002DBDE8, block);
  }
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [v3 pqlConnection];

  uint64_t v5 = [*(id *)((char *)&self->_modifiedVariables + 4) namesInjection];
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v7 = [(CPLPrequeliteScopeStorage *)self _injectionForScopesAllowingPullFromTransport];
  uint64_t v8 = [*(id *)((char *)&self->_pushToTransportTodoVar + 4) hasSomethingTodo];
  uint64_t v9 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeTypeVar];
  uint64_t v10 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar];
  id v11 = [v4 cplFetch:@"SELECT %@ FROM %@ WHERE (%@) AND %@ ORDER BY scopeTypeOrder(%@, %p), %@ ASC", v5, v6, v7, v8, v9, &unk_1002DBDB0, v10];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_100178578;
  v14[3] = &unk_10027EE80;
  v14[4] = self;
  id v12 = [v11 enumerateObjects:v14];

  return v12;
}

- (BOOL)hasScopesNeedingToPullChangesFromTransport
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v5 = [(CPLPrequeliteScopeStorage *)self _injectionForScopesAllowingPullFromTransport];
  id v6 = [*(id *)((char *)&self->_pushToTransportTodoVar + 4) hasSomethingTodo];
  uint64_t v7 = +[PQLFormatInjection formatInjection:@"(%@) = 0 AND %@", v5, v6];
  unsigned __int8 v8 = [v3 table:v4 hasRecordsMatchingQuery:v7];

  return v8;
}

- (BOOL)setScopeHasChangesToPullFromTransport:(id)a3 error:(id *)a4
{
  return [(CPLPrequeliteScopeStorage *)self _setScope:a3 hasTaskTodo:*(CPLPrequeliteTodoVar **)((char *)&self->_pushToTransportTodoVar + 4) error:a4];
}

- (BOOL)setAllScopesHasChangesToPullFromTransportWithError:(id *)a3
{
  uint64_t v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [v5 pqlConnection];

  uint64_t v7 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v8 = [*(id *)((char *)&self->_pushToTransportTodoVar + 4) setHasSomethingTodo];
  unsigned __int8 v9 = [v6 cplExecute:@"UPDATE %@ SET %@", v7, v8];

  if (a3 && (v9 & 1) == 0)
  {
    *a3 = [v6 lastCPLError];
  }

  return v9;
}

- (int64_t)pullFromTransportTaskForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _taskItemForScope:a3 task:*(CPLPrequeliteTodoVar **)((char *)&self->_pushToTransportTodoVar + 4)];
}

- (BOOL)setScope:(id)a3 hasCompletedPullFromTransportTask:(int64_t)a4 error:(id *)a5
{
  return [(CPLPrequeliteScopeStorage *)self _setScope:a3 hasCompletedTaskItem:a4 task:*(CPLPrequeliteTodoVar **)((char *)&self->_pushToTransportTodoVar + 4) error:a5];
}

- (BOOL)doesScopeNeedToPullChangesFromTransport:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v7 = [_CPLPrequeliteScopeIsEqual alloc];
  unsigned __int8 v8 = [v4 scopeIdentifier];

  unsigned __int8 v9 = [(_CPLPrequeliteScopeIsEqual *)v7 initWithIdentifier:v8];
  uint64_t v10 = *(uint64_t *)((char *)&self->_base + 4);
  id v11 = [*(id *)((char *)&self->_pushToTransportTodoVar + 4) hasSomethingTodo];
  id v12 = +[PQLFormatInjection formatInjection:@"%@ AND (%@ & %ld) = 0 AND %@", v9, v10, 262164, v11];
  LOBYTE(v10) = [v5 table:v6 hasRecordsMatchingQuery:v12];

  return v10;
}

- (BOOL)setPullFromTransportExpirationInterval:(double)a3 scope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  unsigned __int8 v9 = +[NSNumber numberWithDouble:a3];
  uint64_t v10 = [*(id *)((char *)&self->_pushToTransportTodoVar + 4) expirationIntervalVar];
  LOBYTE(a5) = [(CPLPrequeliteScopeStorage *)self _storeValue:v9 forColumnVariable:v10 scope:v8 error:a5];

  return (char)a5;
}

- (id)enumeratorForScopesWithMingling
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100178B80;
  block[3] = &unk_100275EA0;
  block[4] = self;
  if (qword_1002DBE28 != -1) {
    dispatch_once(&qword_1002DBE28, block);
  }
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [v3 pqlConnection];

  uint64_t v5 = [*(id *)((char *)&self->_modifiedVariables + 4) namesInjection];
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v7 = [(CPLPrequeliteScopeStorage *)self _injectionForScopesAllowingPullFromTransport];
  id v8 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeTypeVar];
  unsigned __int8 v9 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar];
  id v10 = [v4 cplFetch:@"SELECT %@ FROM %@ WHERE (%@) ORDER BY scopeTypeOrder(%@, %p), %@ ASC", v5, v6, v7, v8, &unk_1002DBDF0, v9];

  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100178BA0;
  v13[3] = &unk_10027EE80;
  v13[4] = self;
  id v11 = [v10 enumerateObjects:v13];

  return v11;
}

- (BOOL)doScopesNeedMetadataSync:(id)a3
{
  id v4 = [(CPLPrequeliteScopeStorage *)self _injectionForFilter:a3];
  if (v4)
  {
    uint64_t v5 = [(CPLPrequeliteStorage *)self pqStore];
    id v6 = [(CPLPrequeliteStorage *)self mainTable];
    uint64_t v7 = *(uint64_t *)((char *)&self->_base + 4);
    id v8 = [*(id *)((char *)&self->_supervisorInfoVar + 4) hasSomethingTodo];
    unsigned __int8 v9 = +[PQLFormatInjection formatInjection:@"%@ AND (%@ & %ld) = 0 AND %@", v4, v7, 16, v8];
    LOBYTE(v7) = [v5 table:v6 hasRecordsMatchingQuery:v9];

    if (v7)
    {
      unsigned __int8 v10 = 1;
    }
    else
    {
      uint64_t v11 = *(uint64_t *)((char *)&self->_base + 4);
      id v12 = [*(id *)((char *)&self->_pushToTransportTodoVar + 4) hasSomethingTodo];
      id v13 = +[PQLFormatInjection formatInjection:@"%@ AND (%@ & %ld) = 0 AND %@", v4, v11, 262164, v12];
      unsigned __int8 v10 = [v5 table:v6 hasRecordsMatchingQuery:v13];
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  return v10;
}

- (id)enumeratorForScopesNeedingToBePulledByClientWithMaximumCount:(unint64_t)a3
{
  uint64_t v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [v5 pqlConnection];

  uint64_t v7 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int16 v8 = (unsigned __int16)[v7 libraryOptions];

  unsigned __int8 v9 = [*(id *)((char *)&self->_modifiedVariables + 4) namesInjection];
  unsigned __int8 v10 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v11 = *(uint64_t *)((char *)&self->_base + 4);
  uint64_t v12 = [*(id *)((char *)&self->_pullFromTransportTodoVar + 4) hasSomethingTodo];
  id v13 = (void *)v12;
  uint64_t v14 = 65552;
  if ((v8 & 0x400) != 0) {
    uint64_t v14 = 0x10000;
  }
  id v15 = [v6 cplFetch:@"SELECT %@ FROM %@ WHERE (%@ & %ld) = %ld AND %@ LIMIT %lu", v9, v10, v11, v14, 0x10000, v12, a3];

  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_100178F30;
  v18[3] = &unk_10027EE80;
  v18[4] = self;
  id v16 = [v15 enumerateObjects:v18];

  return v16;
}

- (int64_t)clientNeedsToPullTaskForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _taskItemForScope:a3 task:*(CPLPrequeliteTodoVar **)((char *)&self->_pullFromTransportTodoVar + 4)];
}

- (BOOL)setScope:(id)a3 hasCompletedClientNeedsToPullTask:(int64_t)a4 error:(id *)a5
{
  return [(CPLPrequeliteScopeStorage *)self _setScope:a3 hasCompletedTaskItem:a4 task:*(CPLPrequeliteTodoVar **)((char *)&self->_pullFromTransportTodoVar + 4) error:a5];
}

- (BOOL)setScopeNeedsToBePulledByClient:(id)a3 error:(id *)a4
{
  return [(CPLPrequeliteScopeStorage *)self _setScope:a3 hasTaskTodo:*(CPLPrequeliteTodoVar **)((char *)&self->_pullFromTransportTodoVar + 4) error:a4];
}

- (BOOL)doesScopeNeedToBePulledByClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int16 v6 = (unsigned __int16)[v5 libraryOptions];

  uint64_t v7 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int16 v8 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v9 = [_CPLPrequeliteScopeIsEqual alloc];
  unsigned __int8 v10 = [v4 scopeIdentifier];

  uint64_t v11 = [(_CPLPrequeliteScopeIsEqual *)v9 initWithIdentifier:v10];
  uint64_t v12 = *(uint64_t *)((char *)&self->_base + 4);
  uint64_t v13 = [*(id *)((char *)&self->_pullFromTransportTodoVar + 4) hasSomethingTodo];
  uint64_t v14 = (void *)v13;
  uint64_t v15 = 65552;
  if ((v6 & 0x400) != 0) {
    uint64_t v15 = 0x10000;
  }
  id v16 = +[PQLFormatInjection formatInjection:@"%@ AND (%@ & %ld) = %ld AND %@", v11, v12, v15, 0x10000, v13];
  unsigned __int8 v17 = [v7 table:v8 hasRecordsMatchingQuery:v16];

  return v17;
}

- (BOOL)doesScopeSupportToBePulledByClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int16 v6 = (unsigned __int16)[v5 libraryOptions];

  id v7 = [v4 scopeType];
  if (v7)
  {
    unsigned __int16 v8 = [v4 scopeIdentifier];
    LODWORD(v7) = [(CPLPrequeliteScopeStorage *)self _scopeTypeSupportsClientSync:v7 scopeIdentifier:v8];

    if (v7)
    {
      if ((v6 & 0x400) == 0)
      {
        unsigned __int8 v9 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4) scope:v4];
        LOBYTE(v7) = ((unint64_t)[v9 integerValue] & 0x10) == 0;
      }
    }
  }

  return (char)v7;
}

- (id)enumeratorForScopesNeedingToUpdateTransport
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [v3 pqlConnection];

  uint64_t v5 = [*(id *)((char *)&self->_modifiedVariables + 4) namesInjection];
  unsigned __int16 v6 = [(CPLPrequeliteStorage *)self mainTable];
  id v7 = [*(id *)((char *)&self->_clientNeedsToPullTodoVar + 4) hasSomethingTodo];
  id v8 = [v4 cplFetch:@"SELECT %@ FROM %@ WHERE %@", v5, v6, v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100179354;
  v11[3] = &unk_10027EE80;
  v11[4] = self;
  unsigned __int8 v9 = [v8 enumerateObjects:v11];

  return v9;
}

- (BOOL)hasScopesNeedingToUpdateTransport
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v5 = [*(id *)((char *)&self->_clientNeedsToPullTodoVar + 4) hasSomethingTodo];
  unsigned __int16 v6 = +[PQLFormatInjection formatInjection:@"%@", v5];
  unsigned __int8 v7 = [v3 table:v4 hasRecordsMatchingQuery:v6];

  return v7;
}

- (BOOL)setScopeNeedsToUpdateTransport:(id)a3 error:(id *)a4
{
  return [(CPLPrequeliteScopeStorage *)self _setScope:a3 hasTaskTodo:*(CPLPrequeliteTodoVar **)((char *)&self->_clientNeedsToPullTodoVar + 4) error:a4];
}

- (int64_t)transportUpdateTaskForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _taskItemForScope:a3 task:*(CPLPrequeliteTodoVar **)((char *)&self->_clientNeedsToPullTodoVar + 4)];
}

- (BOOL)setScope:(id)a3 hasCompletedTransportUpdate:(int64_t)a4 error:(id *)a5
{
  return [(CPLPrequeliteScopeStorage *)self _setScope:a3 hasCompletedTaskItem:a4 task:*(CPLPrequeliteTodoVar **)((char *)&self->_clientNeedsToPullTodoVar + 4) error:a5];
}

- (BOOL)doesScopeNeedToUpdateTransport:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int16 v6 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v7 = [_CPLPrequeliteScopeIsEqual alloc];
  id v8 = [v4 scopeIdentifier];

  unsigned __int8 v9 = [(_CPLPrequeliteScopeIsEqual *)v7 initWithIdentifier:v8];
  unsigned __int8 v10 = [*(id *)((char *)&self->_clientNeedsToPullTodoVar + 4) hasSomethingTodo];
  uint64_t v11 = +[PQLFormatInjection formatInjection:@"%@ AND %@", v9, v10];
  LOBYTE(v7) = [v5 table:v6 hasRecordsMatchingQuery:v11];

  return (char)v7;
}

- (id)enumeratorForScopesNeedingToUploadComputeState
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [v3 pqlConnection];

  uint64_t v5 = [*(id *)((char *)&self->_modifiedVariables + 4) namesInjection];
  unsigned __int16 v6 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v7 = [*(id *)((char *)&self->_updateTransportTodoVar + 4) hasSomethingTodo];
  id v8 = [v4 cplFetch:@"SELECT %@ FROM %@ WHERE %@", v5, v6, v7];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100179720;
  v11[3] = &unk_10027EE80;
  v11[4] = self;
  unsigned __int8 v9 = [v8 enumerateObjects:v11];

  return v9;
}

- (BOOL)hasScopesNeedingToUploadComputeState
{
  BOOL v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v5 = [*(id *)((char *)&self->_updateTransportTodoVar + 4) hasSomethingTodo];
  unsigned __int16 v6 = +[PQLFormatInjection formatInjection:@"%@", v5];
  unsigned __int8 v7 = [v3 table:v4 hasRecordsMatchingQuery:v6];

  return v7;
}

- (BOOL)setScopeNeedsToUploadComputeState:(id)a3 error:(id *)a4
{
  return [(CPLPrequeliteScopeStorage *)self _setScope:a3 hasTaskTodo:*(CPLPrequeliteTodoVar **)((char *)&self->_updateTransportTodoVar + 4) error:a4];
}

- (int64_t)uploadComputeStateTaskForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _taskItemForScope:a3 task:*(CPLPrequeliteTodoVar **)((char *)&self->_updateTransportTodoVar + 4)];
}

- (BOOL)setScope:(id)a3 hasCompletedUploadComputeStateTask:(int64_t)a4 error:(id *)a5
{
  return [(CPLPrequeliteScopeStorage *)self _setScope:a3 hasCompletedTaskItem:a4 task:*(CPLPrequeliteTodoVar **)((char *)&self->_updateTransportTodoVar + 4) error:a5];
}

- (BOOL)doesScopeNeedToUploadComputeState:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int16 v6 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v7 = [_CPLPrequeliteScopeIsEqual alloc];
  id v8 = [v4 scopeIdentifier];

  unsigned __int8 v9 = [(_CPLPrequeliteScopeIsEqual *)v7 initWithIdentifier:v8];
  unsigned __int8 v10 = [*(id *)((char *)&self->_updateTransportTodoVar + 4) hasSomethingTodo];
  uint64_t v11 = +[PQLFormatInjection formatInjection:@"%@ AND %@", v9, v10];
  LOBYTE(v7) = [v5 table:v6 hasRecordsMatchingQuery:v11];

  return (char)v7;
}

- (id)addScopeWithIdentifier:(id)a3 scopeType:(int64_t)a4 error:(id *)a5
{
  id v8 = a3;
  unsigned __int8 v9 = [(CPLPrequeliteStorage *)self valueForVariable:*(void *)(&self->super._shouldUpgradeSchema + 1)];
  unsigned __int8 v10 = (char *)[v9 integerValue];

  uint64_t v11 = +[NSNumber numberWithInteger:v10 + 3];
  unsigned int v12 = [(CPLPrequeliteStorage *)self setValue:v11 forVariable:*(void *)(&self->super._shouldUpgradeSchema + 1) error:a5];

  if (v12)
  {
    id v13 = [objc_alloc((Class)CPLEngineScope) initWithScopeIdentifier:v8 scopeType:a4];
    [v13 setLocalIndex:v10 + 1];
    [v13 setCloudIndex:v10 + 2];
    [v13 setStableIndex:v10 + 3];
    if ([(CPLPrequeliteScopeStorage *)self _addScope:v13 error:a5]) {
      id v14 = v13;
    }
    else {
      id v14 = 0;
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (BOOL)deleteScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  unsigned __int8 v7 = [(CPLPrequeliteStorage *)self pqStore];
  id v8 = [v7 pqlConnection];

  unsigned __int8 v9 = [(CPLPrequeliteStorage *)self mainTable];
  unsigned __int8 v10 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar];
  unsigned __int8 v11 = [v8 cplExecute:@"DELETE FROM %@ WHERE %@ = %@", v9, v10, v6];

  if (a4 && (v11 & 1) == 0)
  {
    *a4 = [v8 lastCPLError];
  }
  [(CPLPrequeliteScopeStorage *)self _discardCachedValuesForGroup:*(CPLPrequeliteVariable **)((char *)&self->_stagedScopeIdentifierVar + 4)];
  [*(id *)(&self->_noteEndOfResetIfNecessary + 4) discardCachedValue];
  [(CPLPrequeliteScopeStorage *)self _discardCachedValuesForGroup:*(CPLPrequeliteVariable **)((char *)&self->_stagedScopeIdentifierVar + 4)];

  return v11;
}

- (BOOL)setScopeType:(int64_t)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  unsigned __int8 v9 = +[NSNumber numberWithInteger:a3];
  unsigned __int8 v10 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeTypeVar];
  unsigned int v11 = [(CPLPrequeliteScopeStorage *)self _storeValue:v9 forColumnVariable:v10 scope:v8 error:a5];

  if (v11)
  {
    unsigned int v12 = [(CPLPrequeliteStorage *)self pqStore];
    id v13 = [v12 pqlConnection];

    [*(id *)((char *)&self->_base + 4) discardCachedValue];
    id v14 = [v8 scopeIdentifier];
    unsigned int v15 = [(CPLPrequeliteScopeStorage *)self _scopeTypeSupportsClientSync:a3 scopeIdentifier:v14];

    id v16 = [(CPLPrequeliteStorage *)self mainTable];
    uint64_t v17 = *(uint64_t *)((char *)&self->_base + 4);
    unsigned __int8 v18 = [_CPLPrequeliteScopeIsEqual alloc];
    unsigned int v19 = [v8 scopeIdentifier];
    id v20 = [(_CPLPrequeliteScopeIsEqual *)v18 initWithIdentifier:v19];
    v21 = v20;
    if (v15)
    {
      unsigned int v22 = [v13 cplExecute:@"UPDATE %@ SET %@ = (%@ | %ld) WHERE %@", v16, v17, v17, 0x10000, v20];

      if (v22)
      {
        BOOL v23 = 1;
        if ((uint64_t)[v13 changes] < 1 || _CPLSilentLogging) {
          goto LABEL_19;
        }
        uint64_t v24 = sub_10017319C();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
LABEL_15:

LABEL_19:
          goto LABEL_20;
        }
        *(_DWORD *)buf = 138412290;
        id v29 = v8;
        uint64_t v25 = "Enabled client sync for %@";
LABEL_14:
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, v25, buf, 0xCu);
        goto LABEL_15;
      }
    }
    else
    {
      unsigned int v26 = [v13 cplExecute:@"UPDATE %@ SET %@ = (%@ & %ld) WHERE %@", v16, v17, v17, -65537, v20];

      if (v26)
      {
        BOOL v23 = 1;
        if ((uint64_t)[v13 changes] < 1 || _CPLSilentLogging) {
          goto LABEL_19;
        }
        uint64_t v24 = sub_10017319C();
        if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
          goto LABEL_15;
        }
        *(_DWORD *)buf = 138412290;
        id v29 = v8;
        uint64_t v25 = "Disabled client sync for %@";
        goto LABEL_14;
      }
    }
    if (a5)
    {
      [v13 lastError];
      BOOL v23 = 0;
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
    else
    {
      BOOL v23 = 0;
    }
    goto LABEL_19;
  }
  BOOL v23 = 0;
LABEL_20:

  return v23;
}

- (int64_t)_bumpIndexWithError:(id *)a3
{
  uint64_t v5 = [(CPLPrequeliteStorage *)self valueForVariable:*(void *)(&self->super._shouldUpgradeSchema + 1)];
  id v6 = (char *)[v5 integerValue];

  unsigned __int8 v7 = +[NSNumber numberWithInteger:v6 + 1];
  LODWORD(a3) = [(CPLPrequeliteStorage *)self setValue:v7 forVariable:*(void *)(&self->super._shouldUpgradeSchema + 1) error:a3];

  if (a3) {
    return (int64_t)(v6 + 1);
  }
  else {
    return 0x7FFFFFFFFFFFFFFFLL;
  }
}

- (BOOL)bumpLocalIndexForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteScopeStorage *)self _bumpIndexWithError:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    unsigned __int8 v10 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned int v11 = [v10 pqlConnection];

    unsigned int v12 = [(CPLPrequeliteStorage *)self mainTable];
    id v13 = [[_CPLPrequeliteScopeIsEqual alloc] initWithIdentifier:v6];
    unsigned __int8 v8 = [v11 cplExecute:@"UPDATE %@ SET localIndex = %ld WHERE %@", v12, v9, v13];

    if (a4 && (v8 & 1) == 0)
    {
      *a4 = [v11 lastError];
    }
  }
  return v8;
}

- (BOOL)bumpCloudIndexForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteScopeStorage *)self _bumpIndexWithError:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    unsigned __int8 v10 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned int v11 = [v10 pqlConnection];

    unsigned int v12 = [(CPLPrequeliteStorage *)self mainTable];
    id v13 = [[_CPLPrequeliteScopeIsEqual alloc] initWithIdentifier:v6];
    unsigned __int8 v8 = [v11 cplExecute:@"UPDATE %@ SET cloudIndex = %ld WHERE %@", v12, v9, v13];

    if (a4 && (v8 & 1) == 0)
    {
      *a4 = [v11 lastError];
    }
  }
  return v8;
}

- (BOOL)bumpStableIndexForScopeWithIdentifier:(id)a3 error:(id *)a4
{
  id v6 = a3;
  int64_t v7 = [(CPLPrequeliteScopeStorage *)self _bumpIndexWithError:a4];
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    unsigned __int8 v8 = 0;
  }
  else
  {
    int64_t v9 = v7;
    unsigned __int8 v10 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned int v11 = [v10 pqlConnection];

    unsigned int v12 = [(CPLPrequeliteStorage *)self mainTable];
    id v13 = [[_CPLPrequeliteScopeIsEqual alloc] initWithIdentifier:v6];
    unsigned __int8 v8 = [v11 cplExecute:@"UPDATE %@ SET stableIndex = %ld WHERE %@", v12, v9, v13];

    if (a4 && (v8 & 1) == 0)
    {
      *a4 = [v11 lastError];
    }
  }
  return v8;
}

- (id)_scopeWithQuery:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [v5 pqlConnection];

  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10017A38C;
  v11[3] = &unk_10027EE80;
  v11[4] = self;
  int64_t v7 = [*(id *)((char *)&self->_modifiedVariables + 4) namesInjection];
  unsigned __int8 v8 = [(CPLPrequeliteStorage *)self mainTable];
  id v9 = [v6 cplFetchObject:v11, @"SELECT %@ FROM %@ WHERE %@", v7, v8, v4 sql];

  return v9;
}

- (id)scopeWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [[_CPLPrequeliteScopeIsEqual alloc] initWithIdentifier:v4];

  id v6 = [(CPLPrequeliteScopeStorage *)self _scopeWithQuery:v5];

  return v6;
}

- (id)scopeWithLocalIndex:(int64_t)a3
{
  id v4 = +[PQLFormatInjection formatInjection:@"localIndex = %ld", a3];
  uint64_t v5 = [(CPLPrequeliteScopeStorage *)self _scopeWithQuery:v4];

  return v5;
}

- (id)scopeWithCloudIndex:(int64_t)a3
{
  id v4 = +[PQLFormatInjection formatInjection:@"cloudIndex = %ld", a3];
  uint64_t v5 = [(CPLPrequeliteScopeStorage *)self _scopeWithQuery:v4];

  return v5;
}

- (id)scopeWithStableIndex:(int64_t)a3
{
  id v4 = +[PQLFormatInjection formatInjection:@"stableIndex = %ld", a3];
  uint64_t v5 = [(CPLPrequeliteScopeStorage *)self _scopeWithQuery:v4];

  return v5;
}

- (id)validLocalIndexes
{
  id v3 = objc_alloc_init((Class)NSMutableIndexSet);
  id v4 = [(CPLPrequeliteStorage *)self pqStore];
  uint64_t v5 = [v4 pqlConnection];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  id v7 = [v5 cplFetch:@"SELECT localIndex FROM %@ WHERE (%@ & %ld) = 0", v6, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 16];
  unsigned __int8 v8 = [v7 enumerateObjectsOfClass:objc_opt_class()];

  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (int64_t i = 0; i != v10; int64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v3, "addIndex:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "integerValue"));
      }
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v3;
}

- (id)validCloudIndexes
{
  id v3 = objc_alloc_init((Class)NSMutableIndexSet);
  id v4 = [(CPLPrequeliteStorage *)self pqStore];
  uint64_t v5 = [v4 pqlConnection];

  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v6 = [(CPLPrequeliteStorage *)self mainTable];
  id v7 = [v5 cplFetch:@"SELECT cloudIndex FROM %@ WHERE (%@ & %ld) = 0", v6, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 16];
  unsigned __int8 v8 = [v7 enumerateObjectsOfClass:objc_opt_class()];

  id v9 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v15;
    do
    {
      for (int64_t i = 0; i != v10; int64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v8);
        }
        objc_msgSend(v3, "addIndex:", objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "integerValue"));
      }
      id v10 = [v8 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  return v3;
}

- (id)primaryScope
{
  id v3 = [_CPLPrequeliteScopeIsEqual alloc];
  id v4 = [(CPLPrequeliteStorage *)self mainScopeIdentifier];
  uint64_t v5 = [(_CPLPrequeliteScopeIsEqual *)v3 initWithIdentifier:v4];
  id v6 = [(CPLPrequeliteScopeStorage *)self _scopeWithQuery:v5];

  return v6;
}

- (id)stagingScopeForScope:(id)a3
{
  uint64_t v4 = *(uint64_t *)((char *)&self->_uploadComputeStateTodoVar + 4);
  uint64_t v5 = [a3 scopeIdentifier];
  id v6 = +[PQLFormatInjection formatInjection:@"%@ = %@", v4, v5];
  id v7 = [(CPLPrequeliteScopeStorage *)self _scopeWithQuery:v6];

  return v7;
}

- (id)rewindSyncAnchorsForScope:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [*(id *)((char *)&self->_transportScopeVar + 4) rewindSyncAnchorsVar];
  id v6 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v5 scope:v4];

  if (v6)
  {
    if (qword_1002DBE38 != -1) {
      dispatch_once(&qword_1002DBE38, &stru_10027EEE0);
    }
    id v7 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:v6 classes:qword_1002DBE30];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v8 = v7;
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        id v9 = sub_10017319C();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
        {
          int v11 = 138412290;
          id v12 = v4;
          _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Rewind sync anchors for %@ is invalid", (uint8_t *)&v11, 0xCu);
        }
      }
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)storeRewindSyncAnchors:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if (a3)
  {
    a3 = +[NSKeyedArchiver cpl_archivedDataWithRootObject:a3];
  }
  id v9 = [*(id *)((char *)&self->_transportScopeVar + 4) rewindSyncAnchorsVar];
  BOOL v10 = [(CPLPrequeliteScopeStorage *)self _storeValue:a3 forColumnVariable:v9 scope:v8 error:a5];

  return v10;
}

- (BOOL)storeBusyState:(int64_t)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = +[NSNumber numberWithInteger:a3];
  BOOL v10 = [*(id *)((char *)&self->_transportScopeVar + 4) busyStateVar];
  LOBYTE(a5) = [(CPLPrequeliteScopeStorage *)self _storeValue:v9 forColumnVariable:v10 scope:v8 error:a5];

  return (char)a5;
}

- (int64_t)busyStateForScope:(id)a3
{
  id v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  id v6 = [v4 busyStateVar];
  id v7 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v6 scope:v5];

  id v8 = [v7 integerValue];
  return (int64_t)v8;
}

- (BOOL)storeSupervisorInfo:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (!v8)
  {
    BOOL v10 = 0;
    goto LABEL_5;
  }
  BOOL v10 = +[NSPropertyListSerialization dataWithPropertyList:v8 format:200 options:0 error:a5];
  if (v10)
  {
LABEL_5:
    BOOL v11 = [(CPLPrequeliteScopeStorage *)self _storeValue:v10 forColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_initialMingleDateVar + 4) scope:v9 error:a5];

    goto LABEL_6;
  }
  BOOL v11 = 0;
LABEL_6:

  return v11;
}

- (id)supervisorInfoForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_initialMingleDateVar + 4) scope:v4];
  if (v5)
  {
    id v11 = 0;
    id v6 = +[NSPropertyListSerialization propertyListWithData:v5 options:0 format:0 error:&v11];
    id v7 = v11;
    if (v6) {
      BOOL v8 = 0;
    }
    else {
      BOOL v8 = _CPLSilentLogging == 0;
    }
    if (v8)
    {
      id v9 = sub_10017319C();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        id v13 = v4;
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_ERROR, "Failed to deserialize supervisor info for %@: %@", buf, 0x16u);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)scopeListSyncAnchor
{
  return [(CPLPrequeliteStorage *)self valueForVariable:*(CPLPrequeliteVariable **)((char *)&self->_nextIndexVar + 4)];
}

- (BOOL)storeScopeListSyncAnchor:(id)a3 error:(id *)a4
{
  unsigned int v7 = [(CPLPrequeliteStorage *)self setValue:a3 forVariable:*(CPLPrequeliteVariable **)((char *)&self->_nextIndexVar + 4) error:a4];
  BOOL v8 = v7;
  if (!a3 && v7)
  {
    id v9 = [(CPLPrequeliteStorage *)self pqStore];
    BOOL v10 = [v9 pqlConnection];

    id v11 = [(CPLPrequeliteStorage *)self mainTable];
    id v12 = [*(id *)((char *)&self->_pullFromTransportTodoVar + 4) setHasSomethingTodo];
    unsigned __int8 v13 = [v10 cplExecute:@"UPDATE %@ SET %@ WHERE %@ & %lu != 0", v11, v12, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 0x10000];

    if (v13)
    {
      if (!_CPLSilentLogging)
      {
        __int16 v14 = sub_10017319C();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 134217984;
          id v17 = [v10 changes];
          _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Marking %lu scopes to be pulled by client", buf, 0xCu);
        }
      }
    }
    else if (a4)
    {
      *a4 = [v10 lastCPLError];
    }
  }
  return v8;
}

- (void)_cacheValue:(id)a3 forColumnVariable:(id)a4 scope:(id)a5
{
  unsigned int v7 = *(CPLPrequeliteVariable **)((char *)&self->_scopeListSyncAnchorVar + 4);
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  [v7 addObject:v9];
  id v11 = [v8 scopeIdentifier];

  [v9 setCachedValue:v10 forIdentifier:v11];
}

- (BOOL)_storeValue:(id)a3 forColumnVariable:(id)a4 scope:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v13 = [v12 pqlConnection];

  __int16 v14 = [(CPLPrequeliteStorage *)self mainTable];
  id v15 = [v10 bindableValueForValue:v9];
  long long v16 = [_CPLPrequeliteScopeIsEqual alloc];
  id v17 = [v11 scopeIdentifier];
  unsigned __int8 v18 = [(_CPLPrequeliteScopeIsEqual *)v16 initWithIdentifier:v17];
  unsigned __int8 v19 = [v13 cplExecute:@"UPDATE %@ SET %@ = %@ WHERE %@", v14, v10, v15, v18];

  if (v19)
  {
    [(CPLPrequeliteScopeStorage *)self _cacheValue:v9 forColumnVariable:v10 scope:v11];
  }
  else if (a6)
  {
    *a6 = [v13 lastCPLError];
  }

  return v19;
}

- (id)_valueForColumnVariable:(id)a3 scope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 scopeIdentifier];
  unsigned int v9 = [v6 hasCachedValueForIdentifier:v8];

  if (v9)
  {
    id v10 = [v7 scopeIdentifier];
    id v11 = [v6 cachedValueForIdentifier:v10];
  }
  else
  {
    id v12 = [(CPLPrequeliteStorage *)self pqStore];
    unsigned __int8 v13 = [v12 pqlConnection];

    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_10017B5C8;
    v20[3] = &unk_10027EE80;
    id v14 = v6;
    id v21 = v14;
    id v15 = [(CPLPrequeliteStorage *)self mainTable];
    long long v16 = [_CPLPrequeliteScopeIsEqual alloc];
    id v17 = [v7 scopeIdentifier];
    unsigned __int8 v18 = [(_CPLPrequeliteScopeIsEqual *)v16 initWithIdentifier:v17];
    id v11 = [v13 cplFetchObject:v20, @"SELECT %@ FROM %@ WHERE %@", v14, v15, v18 sql];

    [(CPLPrequeliteScopeStorage *)self _cacheValue:v11 forColumnVariable:v14 scope:v7];
  }

  return v11;
}

- (id)creationDateForScope:(id)a3
{
  id v4 = *(NSMutableSet **)((char *)&self->_modifiedVariables + 4);
  id v5 = a3;
  id v6 = [v4 creationDateVar];
  id v7 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v6 scope:v5];

  return v7;
}

- (id)flagsForScope:(id)a3
{
  id v3 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4) scope:a3];
  id v4 = v3;
  if (v3) {
    id v5 = objc_msgSend(objc_alloc((Class)CPLEngineScopeFlagsUpdate), "initWithFlags:", objc_msgSend(v3, "integerValue"));
  }
  else {
    id v5 = 0;
  }

  return v5;
}

- (BOOL)updateFlags:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if ([v8 updatedFlagsMask])
  {
    id v10 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4) scope:v9];
    id v11 = v10;
    if (v10)
    {
      id v12 = [v10 integerValue];
      id v13 = [v8 updatedFlagsFromFlags:v12];
      if (v12 == v13)
      {
        LOBYTE(a5) = 1;
      }
      else
      {
        id v15 = v13;
        if (!_CPLSilentLogging)
        {
          long long v16 = sub_10017319C();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
          {
            int v19 = 138412546;
            id v20 = v9;
            __int16 v21 = 2112;
            id v22 = v8;
            _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Updating flags for %@: %@", (uint8_t *)&v19, 0x16u);
          }
        }
        id v17 = +[NSNumber numberWithInteger:v15];
        LOBYTE(a5) = [(CPLPrequeliteScopeStorage *)self _storeValue:v17 forColumnVariable:*(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4) scope:v9 error:a5];
      }
    }
    else if (a5)
    {
      id v14 = [v9 scopeIdentifier];
      *a5 = +[CPLErrors invalidScopeErrorWithScopeIdentifier:v14];

      LOBYTE(a5) = 0;
    }
  }
  else
  {
    LOBYTE(a5) = 1;
  }

  return (char)a5;
}

- (id)disabledDateForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_flagsVar + 4) scope:a3];
}

- (BOOL)setDisabledDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  return [(CPLPrequeliteScopeStorage *)self _storeValue:a3 forColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_flagsVar + 4) scope:a4 error:a5];
}

- (id)deleteDateForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_disabledDateVar + 4) scope:a3];
}

- (BOOL)setDeleteDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  return [(CPLPrequeliteScopeStorage *)self _storeValue:a3 forColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_disabledDateVar + 4) scope:a4 error:a5];
}

- (id)_librarySateForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [v5 pqlConnection];

  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10017BA58;
  v14[3] = &unk_10027EE80;
  v14[4] = self;
  id v7 = [*(id *)((char *)&self->_all + 4) namesInjection];
  id v8 = [(CPLPrequeliteStorage *)self mainTable];
  id v9 = [_CPLPrequeliteScopeIsEqual alloc];
  id v10 = [v4 scopeIdentifier];

  id v11 = [(_CPLPrequeliteScopeIsEqual *)v9 initWithIdentifier:v10];
  id v12 = [v6 cplFetchObject:v14, @"SELECT %@ FROM %@ WHERE %@", v7, v8, v11 sql];

  return v12;
}

- (BOOL)setScopeNeedsUpdateFromTransport:(id)a3 error:(id *)a4
{
  return [(CPLPrequeliteScopeStorage *)self _storeValue:0 forColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_scopeChangeVar + 4) scope:a3 error:a4];
}

- (id)transportScopeForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_lastLibraryInfoUpdateVar + 4) scope:a3];
}

- (BOOL)setTransportScope:(id)a3 forScope:(id)a4 error:(id *)a5
{
  return [(CPLPrequeliteScopeStorage *)self _storeValue:a3 forColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_lastLibraryInfoUpdateVar + 4) scope:a4 error:a5];
}

- (id)_libraryInfoForScope:(id)a3
{
  id v3 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_deleteDateVar + 4) scope:a3];
  if (v3)
  {
    id v4 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:v3 class:objc_opt_class()];
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)scopeChangeForScope:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_libraryInfoVar + 4) scope:v4];
  if (!v5)
  {
LABEL_8:
    id v6 = 0;
    goto LABEL_9;
  }
  id v6 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:v5 class:objc_opt_class()];
  id v7 = [v6 scopeType];
  if (v7 != [v4 scopeType])
  {
    if (!_CPLSilentLogging)
    {
      id v8 = sub_10017319C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
      {
        int v21 = 138412546;
        id v22 = v6;
        __int16 v23 = 2112;
        id v24 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "Invalid stored scope change %@ for %@", (uint8_t *)&v21, 0x16u);
      }
    }
    goto LABEL_8;
  }
LABEL_9:
  id v9 = [(CPLPrequeliteScopeStorage *)self _libraryInfoForScope:v4];
  if (v6) {
    goto LABEL_14;
  }
  id v10 = [v4 scopeIdentifier];
  id v6 = +[CPLScopeChange newScopeChangeInferClassWithScopeIdentifier:type:](CPLScopeChange, "newScopeChangeInferClassWithScopeIdentifier:type:", v10, [v4 scopeType]);

  if (v9)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v11 = [v9 momentShare];
      [v6 setMomentShare:v11];

      [v9 setMomentShare:0];
    }
  }
  id v12 = [(CPLPrequeliteScopeStorage *)self _librarySateForScope:v4];
  [v6 setLibraryState:v12];

  if (v6)
  {
LABEL_14:
    [v6 setLibraryInfo:v9];
    id v13 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4) scope:v4];
    objc_msgSend(v6, "setActivated:", ((unint64_t)objc_msgSend(v13, "integerValue") & 0x10) == 0);
    if ([v6 isActivated]
      && +[CPLScopeChange supportsStagingScopeForScopeWithType:](CPLScopeChange, "supportsStagingScopeForScopeWithType:", [v6 scopeType]))
    {
      id v14 = [(CPLPrequeliteScopeStorage *)self stagingScopeForScope:v4];
      id v15 = [v14 scopeIdentifier];
      [v6 setStagingScopeIdentifier:v15];
    }
    long long v16 = [*(id *)((char *)&self->_transportScopeVar + 4) busyStateVar];
    id v17 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v16 scope:v4];
    id v18 = [v17 integerValue];

    [v6 setBusyState:v18];
    id v19 = v6;
  }
  else
  {
    id v19 = 0;
  }

  return v19;
}

- (BOOL)_storeLibraryInfo:(id)a3 forScope:(id)a4 libraryInfoHasBeenUpdated:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  *a5 = 0;
  if (!v10)
  {
    id v19 = 0;
LABEL_27:
    uint64_t v31 = +[NSDate date];
    BOOL v30 = [(CPLPrequeliteScopeStorage *)self _storeValue:v31 forColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_scopeChangeVar + 4) scope:v11 error:0];

    goto LABEL_28;
  }
  unint64_t v13 = [(CPLPrequeliteScopeStorage *)self supportedFeatureVersionInLastSyncForScope:v11];
  long long v38 = a5;
  if (v13 > 0x13) {
    goto LABEL_14;
  }
  unint64_t v14 = v13;
  id v15 = [v10 featureVersionHistory];
  long long v16 = v15;
  if (!v15)
  {
    if (!_CPLSilentLogging)
    {
      id v18 = sub_10017319C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        id v20 = [v11 scopeIdentifier];
        *(_DWORD *)buf = 138412546;
        id v42 = v20;
        __int16 v43 = 2048;
        unint64_t v44 = v14;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Last supported feature version for %@ was %lu but no feature version history was found on server", buf, 0x16u);
      }
      goto LABEL_12;
    }
LABEL_13:

LABEL_14:
    id v19 = 0;
    goto LABEL_15;
  }
  id v17 = [v15 currentFeatureVersion];
  if ((unint64_t)v17 > v14)
  {
    if (!_CPLSilentLogging)
    {
      id v18 = sub_10017319C();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        long long v35 = [v11 scopeIdentifier];
        *(_DWORD *)buf = 138413314;
        id v42 = v35;
        __int16 v43 = 2048;
        unint64_t v44 = v14;
        __int16 v45 = 2048;
        id v46 = v17;
        __int16 v47 = 2048;
        unint64_t v48 = v14;
        __int16 v49 = 2048;
        id v50 = v17;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Last supported feature version for %@ was %lu and current server version is %lu - will definitely have to catch up with changes from %lu to %lu", buf, 0x34u);
      }
LABEL_12:

      goto LABEL_13;
    }
    goto LABEL_13;
  }
  if (!_CPLSilentLogging)
  {
    v33 = sub_10017319C();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      long long v35 = [v11 scopeIdentifier];
      *(_DWORD *)buf = 138412802;
      id v42 = v35;
      __int16 v43 = 2048;
      unint64_t v44 = v14;
      __int16 v45 = 2048;
      id v46 = v17;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Last supported feature version for %@ was %lu and current server version is %lu - no changes were missed", buf, 0x20u);
    }
  }
  id v40 = 0;
  unsigned __int8 v34 = -[CPLPrequeliteScopeStorage storeSupportedFeatureVersionInLastSync:forScope:error:](self, "storeSupportedFeatureVersionInLastSync:forScope:error:", 20, v11, &v40, v35);
  id v19 = v40;

  if ((v34 & 1) == 0)
  {
    if (a6) {
      goto LABEL_26;
    }
LABEL_35:
    BOOL v30 = 0;
    goto LABEL_28;
  }
LABEL_15:
  uint64_t v21 = +[NSKeyedArchiver cpl_archivedDataWithRootObject:](NSKeyedArchiver, "cpl_archivedDataWithRootObject:", v10, v35);
  uint64_t v22 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_deleteDateVar + 4) scope:v11];
  __int16 v23 = (void *)v22;
  if (!v21 || !v22)
  {
    if (v21 | v22) {
      goto LABEL_18;
    }
LABEL_21:
    char v29 = 0;
    goto LABEL_24;
  }
  if ([(id)v21 isEqual:v22]) {
    goto LABEL_21;
  }
LABEL_18:
  id v36 = v10;
  id v24 = v12;
  uint64_t v25 = a6;
  uint64_t v26 = *(uint64_t *)((char *)&self->_deleteDateVar + 4);
  id v39 = v19;
  unsigned int v27 = -[CPLPrequeliteScopeStorage _storeValue:forColumnVariable:scope:error:](self, "_storeValue:forColumnVariable:scope:error:", v21, v26, v11, &v39, v36);
  id v28 = v39;

  char v29 = 1;
  if (v27)
  {
    BOOL *v38 = 1;
    id v19 = v28;
    char v29 = 0;
  }
  else
  {
    id v19 = v28;
  }
  a6 = v25;
  id v12 = v24;
  id v10 = v37;
LABEL_24:

  if ((v29 & 1) == 0) {
    goto LABEL_27;
  }
  if (!a6) {
    goto LABEL_35;
  }
LABEL_26:
  id v19 = v19;
  BOOL v30 = 0;
  *a6 = v19;
LABEL_28:

  return v30;
}

- (BOOL)storeScopeChange:(id)a3 forScope:(id)a4 scopeChangeHasBeenUpdated:(BOOL *)a5 error:(id *)a6
{
  id v10 = a3;
  id v11 = a4;
  unint64_t v13 = [v10 libraryInfo];
  id v41 = 0;
  unsigned int v14 = [(CPLPrequeliteScopeStorage *)self _storeLibraryInfo:v13 forScope:v11 libraryInfoHasBeenUpdated:a5 error:&v41];
  id v15 = v41;

  if (v14)
  {
    long long v16 = [v10 scopeIdentifier];
    id v17 = [(CPLPrequeliteStorage *)self mainScopeIdentifier];
    unsigned int v18 = [v16 isEqualToString:v17];

    if (v18) {
      [(CPLPrequeliteScopeStorage *)self _updateStatusForMainScopeChange:v10];
    }
    [v10 setLibraryInfo:0];
    [v10 setStagingScopeIdentifier:0];
    if ([v10 scopeType])
    {
      uint64_t v19 = +[NSKeyedArchiver cpl_archivedDataWithRootObject:v10];
      uint64_t v20 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_libraryInfoVar + 4) scope:v11];
      uint64_t v21 = (void *)v20;
      if (v19 && v20)
      {
        if (([(id)v19 isEqual:v20] & 1) == 0)
        {
LABEL_8:
          long long v37 = v21;
          uint64_t v22 = v12;
          uint64_t v23 = *(uint64_t *)((char *)&self->_libraryInfoVar + 4);
          id v40 = v15;
          unsigned int v24 = [(CPLPrequeliteScopeStorage *)self _storeValue:v19 forColumnVariable:v23 scope:v11 error:&v40];
          id v25 = v40;

          if (v24)
          {
            *a5 = 1;
            uint64_t v26 = v25;
            id v12 = v22;
            uint64_t v21 = v37;
            goto LABEL_18;
          }
          BOOL v27 = 0;
          uint64_t v26 = v25;
          id v12 = v22;
          uint64_t v21 = v37;
          goto LABEL_32;
        }
      }
      else if (v19 | v20)
      {
        goto LABEL_8;
      }
      if (*a5)
      {
        uint64_t v26 = v15;
LABEL_18:
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v31 = [v10 stagedScopeChange];
          unsigned int v32 = [v31 scopeIdentifier];

          if (v32)
          {
            if (!_CPLSilentLogging)
            {
              v33 = sub_10017319C();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                id v43 = v11;
                __int16 v44 = 2114;
                __int16 v45 = v32;
                _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Setting staged scope for %@ to %{public}@", buf, 0x16u);
              }
            }
            uint64_t v34 = *(uint64_t *)((char *)&self->_uploadComputeStateTodoVar + 4);
            id v39 = v26;
            BOOL v27 = [(CPLPrequeliteScopeStorage *)self _storeValue:v32 forColumnVariable:v34 scope:v11 error:&v39];
            id v35 = v39;

            uint64_t v26 = v35;
          }
          else
          {
            BOOL v27 = 1;
          }
        }
        else
        {
          BOOL v27 = 1;
        }
        goto LABEL_32;
      }
      BOOL v27 = 1;
      uint64_t v26 = v15;
LABEL_32:

      LOBYTE(v27) = v27;
      id v15 = v26;
      goto LABEL_33;
    }
    id v28 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_libraryInfoVar + 4) scope:v11];
    if (v28)
    {
      uint64_t v29 = *(uint64_t *)((char *)&self->_libraryInfoVar + 4);
      id v38 = v15;
      BOOL v27 = [(CPLPrequeliteScopeStorage *)self _storeValue:0 forColumnVariable:v29 scope:v11 error:&v38];
      id v30 = v38;

      if (v27)
      {
        LOBYTE(v27) = 1;
        *a5 = 1;
      }
      id v15 = v30;
    }
    else
    {
      LOBYTE(v27) = 1;
    }
  }
  else
  {
    LOBYTE(v27) = 0;
  }
LABEL_33:
  if (a6 && !v27) {
    *a6 = v15;
  }

  return v27;
}

- (id)lastScopeChangeUpdateDateForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_scopeChangeVar + 4) scope:a3];
}

- (Class)_transportGroupClass
{
  id v3 = *(PQLInjecting **)((char *)&self->_injectionForScopesAllowingPullFromTransport + 4);
  if (!v3)
  {
    id v5 = [(CPLPrequeliteScopeStorage *)self abstractObject];
    id v6 = [v5 engineStore];
    id v7 = [v6 engineLibrary];
    id v8 = [v7 transport];
    *(PQLInjecting **)((char *)&self->_injectionForScopesAllowingPullFromTransport + 4) = (PQLInjecting *)[v8 transportGroupClass];

    id v3 = *(PQLInjecting **)((char *)&self->_injectionForScopesAllowingPullFromTransport + 4);
    if (!v3) {
      sub_1001D05B8((uint64_t)a2, (uint64_t)self);
    }
  }
  return (Class)v3;
}

- (id)_transportGroupForColumnVariable:(id)a3 forScope:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v6 scope:v7];
  if (v8)
  {
    id v9 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:v8 class:[(CPLPrequeliteScopeStorage *)self _transportGroupClass]];
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)_storeTransportGroup:(id)a3 inColumnVariable:(id)a4 forScope:(id)a5 error:(id *)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  if (v11)
  {
    unsigned int v14 = +[NSKeyedArchiver cpl_archivedDataWithRootObject:v11];
    if (!v14) {
      sub_1001D0744((uint64_t)v11, (uint64_t)a2, (uint64_t)self);
    }
  }
  else
  {
    unsigned int v14 = 0;
  }
  BOOL v15 = [(CPLPrequeliteScopeStorage *)self _storeValue:v14 forColumnVariable:v12 scope:v13 error:a6];
  if (!v15)
  {
    if (!_CPLSilentLogging)
    {
      long long v16 = sub_10017319C();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        int v18 = 138412546;
        id v19 = v11;
        __int16 v20 = 2112;
        uint64_t v21 = 0;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "Can't save group %@: %@", (uint8_t *)&v18, 0x16u);
      }
    }
    if (a6) {
      *a6 = 0;
    }
  }

  return v15;
}

- (void)_discardCachedValuesForGroup:(id)a3
{
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = objc_msgSend(a3, "variables", 0);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * (void)v7) discardCachedValue];
        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (BOOL)resetSyncStateForScope:(id)a3 error:(id *)a4
{
  uint64_t v6 = *(uint64_t *)((char *)&self->_transportScopeVar + 4);
  id v7 = a3;
  [(CPLPrequeliteScopeStorage *)self _discardCachedValuesForGroup:v6];
  [(CPLPrequeliteScopeStorage *)self _discardCachedValuesForGroup:*(CPLPrequeliteVariable **)((char *)&self->_supervisorInfoVar + 4)];
  [(CPLPrequeliteScopeStorage *)self _discardCachedValuesForGroup:*(CPLPrequeliteTodoVar **)((char *)&self->_pushToTransportTodoVar + 4)];
  [*(id *)(&self->_noteEndOfResetIfNecessary + 4) discardCachedValue];
  long long v8 = [(CPLPrequeliteStorage *)self pqStore];
  long long v9 = [v8 pqlConnection];

  long long v10 = [(CPLPrequeliteStorage *)self mainTable];
  long long v11 = [*(id *)((char *)&self->_transportScopeVar + 4) injectionForDefaultValuesUpdate];
  id v12 = [*(id *)((char *)&self->_supervisorInfoVar + 4) injectionForDefaultValuesUpdate];
  id v13 = [*(id *)((char *)&self->_pushToTransportTodoVar + 4) lastCompletionDateVar];
  unsigned int v14 = [*(id *)((char *)&self->_modifiedVariables + 4) scopeIdentifierVar];
  BOOL v15 = [v7 scopeIdentifier];

  unsigned __int8 v16 = [v9 cplExecute:@"UPDATE %@ SET %@, %@, %@ = NULL WHERE %@ = %@", v10, v11, v12, v13, v14, v15];
  if (a4 && (v16 & 1) == 0)
  {
    *a4 = [v9 lastError];
  }

  return v16;
}

- (id)uploadTransportGroupForScope:(id)a3
{
  id v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  uint64_t v6 = [v4 uploadTransportGroupVar];
  id v7 = [(CPLPrequeliteScopeStorage *)self _transportGroupForColumnVariable:v6 forScope:v5];

  return v7;
}

- (BOOL)storeUploadTransportGroup:(id)a3 forScope:(id)a4 error:(id *)a5
{
  long long v8 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v9 = a4;
  id v10 = a3;
  long long v11 = [v8 uploadTransportGroupVar];
  LOBYTE(a5) = [(CPLPrequeliteScopeStorage *)self _storeTransportGroup:v10 inColumnVariable:v11 forScope:v9 error:a5];

  return (char)a5;
}

- (id)downloadTransportGroupForScope:(id)a3
{
  id v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  uint64_t v6 = [v4 downloadTransportGroupVar];
  id v7 = [(CPLPrequeliteScopeStorage *)self _transportGroupForColumnVariable:v6 forScope:v5];

  return v7;
}

- (BOOL)storeDownloadTransportGroup:(id)a3 forScope:(id)a4 error:(id *)a5
{
  long long v8 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v9 = a4;
  id v10 = a3;
  long long v11 = [v8 downloadTransportGroupVar];
  LOBYTE(a5) = [(CPLPrequeliteScopeStorage *)self _storeTransportGroup:v10 inColumnVariable:v11 forScope:v9 error:a5];

  return (char)a5;
}

- (BOOL)didDropSomeRecordsForScope:(id)a3
{
  id v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  uint64_t v6 = [v4 droppedSomeRecordsVar];
  id v7 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v6 scope:v5];

  LOBYTE(v5) = [v7 BOOLValue];
  return (char)v5;
}

- (BOOL)setDidDropSomeRecordsForScope:(id)a3 error:(id *)a4
{
  id v4 = self;
  id v5 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v6 = a3;
  id v7 = [v5 droppedSomeRecordsVar];
  LOBYTE(v4) = [(CPLPrequeliteScopeStorage *)v4 _storeValue:&__kCFBooleanTrue forColumnVariable:v7 scope:v6 error:0];

  return (char)v4;
}

- (id)syncAnchorForScope:(id)a3 isCommitted:(BOOL *)a4
{
  id v6 = a3;
  id v7 = [*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar];
  long long v8 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v7 scope:v6];

  if (v8)
  {
    BOOL v9 = 0;
  }
  else
  {
    id v10 = [*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar];
    long long v8 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v10 scope:v6];

    BOOL v9 = 1;
  }
  *a4 = v9;

  return v8;
}

- (BOOL)setSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = [*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar];
    long long v11 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v10 scope:v9];

    if (!v11)
    {
      id v12 = [*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar];
      id v13 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v12 scope:v9];

      if (v13 && [v8 isEqual:v13])
      {
        if (!_CPLSilentLogging)
        {
          unsigned int v14 = sub_10017319C();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
          {
            BOOL v15 = [v9 scopeIdentifier];
            int v27 = 138412290;
            id v28 = v15;
            _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "New sync anchor for %@ is identical to the stored one - there were no changes for this scope", (uint8_t *)&v27, 0xCu);
          }
        }

        goto LABEL_25;
      }
    }
  }
  if (!_CPLSilentLogging)
  {
    unsigned __int8 v16 = sub_10017319C();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v17 = [v8 cplSyncAnchorDescription];
      int v18 = [v9 scopeIdentifier];
      int v27 = 138412546;
      id v28 = v17;
      __int16 v29 = 2112;
      id v30 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Storing staged sync anchor %@ for %@", (uint8_t *)&v27, 0x16u);
    }
  }
  id v19 = [*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar];
  unsigned int v20 = [(CPLPrequeliteScopeStorage *)self _storeValue:v8 forColumnVariable:v19 scope:v9 error:a5];

  if (v20)
  {
    uint64_t v21 = *(void **)(&self->_noteEndOfResetIfNecessary + 4);
    if (v8) {
      [v21 setValue:&__kCFBooleanTrue];
    }
    else {
      [v21 discardCachedValue];
    }
LABEL_25:
    BOOL v25 = 1;
    goto LABEL_26;
  }
  if (!_CPLSilentLogging)
  {
    uint64_t v22 = sub_10017319C();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = [v8 cplSyncAnchorDescription];
      id v24 = *a5;
      int v27 = 138412802;
      id v28 = v23;
      __int16 v29 = 2112;
      id v30 = v9;
      __int16 v31 = 2112;
      id v32 = v24;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Unable to store sync anchor %@ for %@: %@", (uint8_t *)&v27, 0x20u);
    }
  }
  BOOL v25 = 0;
LABEL_26:

  return v25;
}

- (BOOL)resetSyncAnchorForScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  if (!_CPLSilentLogging)
  {
    id v7 = sub_10017319C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v13 = 138412290;
      id v14 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEBUG, "Resetting sync anchor for %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v8 = [*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar];
  unsigned int v9 = [(CPLPrequeliteScopeStorage *)self _storeValue:0 forColumnVariable:v8 scope:v6 error:a4];

  if (v9)
  {
    id v10 = [*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar];
    BOOL v11 = [(CPLPrequeliteScopeStorage *)self _storeValue:0 forColumnVariable:v10 scope:v6 error:a4];
  }
  else
  {
    BOOL v11 = 0;
  }
  [*(id *)(&self->_noteEndOfResetIfNecessary + 4) discardCachedValue];

  return v11;
}

- (void)_markFirstSyncOfPrimaryAsSuccessfulWithScope:(id)a3
{
  id v4 = a3;
  id v5 = [*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar];
  id v6 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v5 scope:v4];

  if (v6)
  {
    id v7 = [(CPLPrequeliteScopeStorage *)self initialSyncDateForScope:v4];
    if (!v7)
    {
      if (_CPLSilentLogging)
      {
LABEL_21:

        goto LABEL_22;
      }
      id v8 = sub_10017319C();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v14 = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Failed to set initial sync date for status (no initial sync date)", v14, 2u);
      }
LABEL_20:

      goto LABEL_21;
    }
    id v8 = [(CPLPrequeliteStorage *)self engineLibrary];
    unsigned int v9 = [v8 initialSyncDate];
    if (v9)
    {
      if (_CPLSilentLogging)
      {
LABEL_19:

        goto LABEL_20;
      }
      id v10 = sub_10017319C();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Failed to set initial sync date for status (initial sync date has already been set)", buf, 2u);
      }
    }
    else
    {
      if (!_CPLSilentLogging)
      {
        BOOL v11 = sub_10017319C();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)unsigned __int8 v16 = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Updating initial sync date in global status now", v16, 2u);
        }
      }
      id v10 = [(CPLPrequeliteStorage *)self engineLibrary];
      id v12 = +[NSDate date];
      [v10 updateInitialSyncDate:v12];
    }
    goto LABEL_19;
  }
  if (!_CPLSilentLogging)
  {
    id v7 = sub_10017319C();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)int v13 = 0;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Failed to set initial sync date for status (no committed sync anchor)", v13, 2u);
    }
    goto LABEL_21;
  }
LABEL_22:
}

- (BOOL)commitSyncAnchorForScope:(id)a3 error:(id *)a4
{
  id v6 = a3;
  id v7 = [*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar];
  id v8 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v7 scope:v6];

  unsigned int v9 = [v6 scopeIdentifier];
  id v10 = [(CPLPrequeliteStorage *)self mainScopeIdentifier];
  unsigned int v11 = [v9 isEqualToString:v10];

  if (v8)
  {
    id v12 = [(CPLPrequeliteScopeStorage *)self initialSyncDateForScope:v6];
    int v13 = [*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar];
    id v14 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v13 scope:v6];

    if (!v14) {
      BYTE4(self->_transportGroupClass) = 1;
    }
    BOOL v15 = [*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar];
    unsigned int v16 = [(CPLPrequeliteScopeStorage *)self _storeValue:v8 forColumnVariable:v15 scope:v6 error:a4];

    if (v16)
    {
      id v17 = [*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar];
      BOOL v18 = [(CPLPrequeliteScopeStorage *)self _storeValue:0 forColumnVariable:v17 scope:v6 error:a4];

      [*(id *)(&self->_noteEndOfResetIfNecessary + 4) discardCachedValue];
      if (v18 && !v12)
      {
        id v19 = +[NSDate date];
        BOOL v18 = [(CPLPrequeliteScopeStorage *)self _storeValue:v19 forColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_estimatedAssetCountVar + 4) scope:v6 error:a4];

        if ((v18 & v11) == 1)
        {
          if (!_CPLSilentLogging)
          {
            unsigned int v20 = sub_10017319C();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
            {
              uint64_t v21 = [v6 scopeIdentifier];
              int v29 = 138412290;
              id v30 = v21;
              _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Committing initial sync date for %@ and updating initial sync date in global status", (uint8_t *)&v29, 0xCu);
            }
          }
          [(CPLPrequeliteScopeStorage *)self _markFirstSyncOfPrimaryAsSuccessfulWithScope:v6];
        }
        else
        {
          if (_CPLSilentLogging) {
            BOOL v25 = 0;
          }
          else {
            BOOL v25 = v18;
          }
          if (!v25) {
            goto LABEL_31;
          }
          uint64_t v26 = sub_10017319C();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
          {
            int v27 = [v6 scopeIdentifier];
            int v29 = 138412290;
            id v30 = v27;
            _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Committing initial sync date for %@", (uint8_t *)&v29, 0xCu);
          }
        }
        goto LABEL_30;
      }
      if ((v18 & v11) == 1)
      {
        uint64_t v22 = [(CPLPrequeliteStorage *)self engineLibrary];
        uint64_t v23 = [v22 initialSyncDate];
        if (!v23)
        {
          if (!_CPLSilentLogging)
          {
            id v24 = sub_10017319C();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
            {
              LOWORD(v29) = 0;
              _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Force updating missing initial sync date in global status", (uint8_t *)&v29, 2u);
            }
          }
          [(CPLPrequeliteScopeStorage *)self _markFirstSyncOfPrimaryAsSuccessfulWithScope:v6];
        }

LABEL_30:
        LOBYTE(v18) = 1;
      }
    }
    else
    {
      LOBYTE(v18) = 0;
    }
LABEL_31:

    goto LABEL_32;
  }
  LOBYTE(v18) = 1;
LABEL_32:

  return v18;
}

- (BOOL)hasStagedSyncAnchorForScope:(id)a3
{
  id v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  id v6 = [v4 stagedSyncAnchorVar];
  id v7 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v6 scope:v5];

  return v7 != 0;
}

- (BOOL)hasStagedSyncAnchors
{
  v2 = *(void **)(&self->_noteEndOfResetIfNecessary + 4);
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_10017DC3C;
  v6[3] = &unk_10027EF08;
  v6[4] = self;
  id v3 = [v2 valueWithConstructor:v6];
  unsigned __int8 v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)discardStagedSyncAnchorForScope:(id)a3 error:(id *)a4
{
  id v6 = *(void **)(&self->_noteEndOfResetIfNecessary + 4);
  id v7 = a3;
  [v6 discardCachedValue];
  id v8 = [*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar];
  LOBYTE(a4) = [(CPLPrequeliteScopeStorage *)self _storeValue:0 forColumnVariable:v8 scope:v7 error:a4];

  return (char)a4;
}

- (BOOL)discardStagedSyncAnchorWithScopeFilter:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [(CPLPrequeliteStorage *)self pqStore];
  id v7 = [v6 pqlConnection];

  id v8 = [(CPLPrequeliteScopeStorage *)self _injectionForFilter:v5];

  if (v8)
  {
    unsigned int v9 = [(CPLPrequeliteStorage *)self mainTable];
    id v10 = [*(id *)((char *)&self->_transportScopeVar + 4) stagedSyncAnchorVar];
    unsigned __int8 v11 = [v7 cplExecute:@"UPDATE %@ SET %@ = NULL WHERE %@", v9, v10, v8];

    [*(id *)(&self->_noteEndOfResetIfNecessary + 4) discardCachedValue];
  }
  else
  {
    unsigned __int8 v11 = 1;
  }

  return v11;
}

- (id)transientSyncAnchorForScope:(id)a3
{
  unsigned __int8 v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  id v6 = [v4 transientSyncAnchorVar];
  id v7 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v6 scope:v5];

  return v7;
}

- (BOOL)storeTransientSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v9 = a4;
  id v10 = a3;
  unsigned __int8 v11 = [v8 transientSyncAnchorVar];
  LOBYTE(a5) = [(CPLPrequeliteScopeStorage *)self _storeValue:v10 forColumnVariable:v11 scope:v9 error:a5];

  return (char)a5;
}

- (id)classNameOfRecordsForInitialQueryForScope:(id)a3
{
  unsigned __int8 v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  id v6 = [v4 classForInitialQueryVar];
  id v7 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v6 scope:v5];

  return v7;
}

- (BOOL)setClassNameOfRecordsForInitialQuery:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v9 = a4;
  id v10 = a3;
  unsigned __int8 v11 = [v8 classForInitialQueryVar];
  LOBYTE(a5) = [(CPLPrequeliteScopeStorage *)self _storeValue:v10 forColumnVariable:v11 scope:v9 error:a5];

  return (char)a5;
}

- (BOOL)hasScopeFetchedInitialSyncAnchor:(id)a3
{
  unsigned __int8 v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  id v6 = [v4 hasFetchedInitialSyncAnchorVar];
  id v7 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v6 scope:v5];

  LOBYTE(v5) = [v7 BOOLValue];
  return (char)v5;
}

- (BOOL)setHasFetchedInitialSyncAnchor:(BOOL)a3 forScope:(id)a4 error:(id *)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = +[NSNumber numberWithBool:v6];
  id v10 = [*(id *)((char *)&self->_transportScopeVar + 4) hasFetchedInitialSyncAnchorVar];
  LOBYTE(a5) = [(CPLPrequeliteScopeStorage *)self _storeValue:v9 forColumnVariable:v10 scope:v8 error:a5];

  return (char)a5;
}

- (BOOL)setInitialSyncAnchor:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v9 = a4;
  id v10 = a3;
  unsigned __int8 v11 = [v8 initialSyncAnchorVar];
  LOBYTE(a5) = [(CPLPrequeliteScopeStorage *)self _storeValue:v10 forColumnVariable:v11 scope:v9 error:a5];

  return (char)a5;
}

- (id)initialSyncAnchorForScope:(id)a3
{
  unsigned __int8 v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  BOOL v6 = [v4 initialSyncAnchorVar];
  id v7 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v6 scope:v5];

  return v7;
}

- (id)initialSyncDateForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_estimatedAssetCountVar + 4) scope:a3];
}

- (BOOL)setInitialDownloadDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [(CPLPrequeliteScopeStorage *)self _storeValue:v8 forColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_initialSyncDateVar + 4) scope:v9 error:a5];
  if (v10)
  {
    unsigned __int8 v11 = [v9 scopeIdentifier];
    id v12 = [(CPLPrequeliteStorage *)self mainScopeIdentifier];
    unsigned int v13 = [v11 isEqualToString:v12];

    if (v13)
    {
      id v14 = [(CPLPrequeliteStorage *)self engineLibrary];
      BOOL v15 = [v14 initialDownloadDate];
      if (!v15) {
        [v14 updateInitialDownloadDate:v8];
      }
    }
  }

  return v10;
}

- (id)initialDownloadDateForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_initialSyncDateVar + 4) scope:a3];
}

- (BOOL)hasFinishedAFullSyncForScope:(id)a3
{
  unsigned __int8 v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  BOOL v6 = [v4 syncAnchorVar];
  id v7 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v6 scope:v5];

  return v7 != 0;
}

- (BOOL)allActiveScopesHasFinishedSyncs
{
  id v3 = [(CPLPrequeliteStorage *)self pqStore];
  unsigned __int8 v4 = [(CPLPrequeliteStorage *)self mainTable];
  uint64_t v5 = *(uint64_t *)((char *)&self->_base + 4);
  BOOL v6 = [*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar];
  id v7 = +[PQLFormatInjection formatInjection:@"(%@ & %ld) = 0 AND %@ IS NULL", v5, 262164, v6];
  LOBYTE(v5) = [v3 table:v4 hasRecordsMatchingQuery:v7] ^ 1;

  return v5;
}

- (id)lastDateOfClearedPushRepositoryForScope:(id)a3
{
  unsigned __int8 v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  BOOL v6 = [v4 lastClearedPushVar];
  id v7 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v6 scope:v5];

  return v7;
}

- (BOOL)storeLastDateOfClearedPushRepository:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v9 = a4;
  id v10 = a3;
  unsigned __int8 v11 = [v8 lastClearedPushVar];
  LOBYTE(a5) = [(CPLPrequeliteScopeStorage *)self _storeValue:v10 forColumnVariable:v11 scope:v9 error:a5];

  return (char)a5;
}

- (id)lastDateOfCompletedPullFromTransportForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _taskItemCompletionDateForScope:a3 task:*(CPLPrequeliteTodoVar **)((char *)&self->_pushToTransportTodoVar + 4)];
}

- (unint64_t)supportedFeatureVersionInLastSyncForScope:(id)a3
{
  unsigned __int8 v4 = *(CPLPrequeliteVariable **)((char *)&self->_transportScopeVar + 4);
  id v5 = a3;
  BOOL v6 = [v4 featureVersionVar];
  id v7 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:v6 scope:v5];

  id v8 = [v7 unsignedIntegerValue];
  return (unint64_t)v8;
}

- (BOOL)storeSupportedFeatureVersionInLastSync:(unint64_t)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  id v9 = +[NSNumber numberWithUnsignedInteger:a3];
  id v10 = [*(id *)((char *)&self->_transportScopeVar + 4) featureVersionVar];
  LOBYTE(a5) = [(CPLPrequeliteScopeStorage *)self _storeValue:v9 forColumnVariable:v10 scope:v8 error:a5];

  return (char)a5;
}

- (BOOL)storeEstimatedSize:(unint64_t)a3 estimatedAssetCount:(unint64_t)a4 forScope:(id)a5 error:(id *)a6
{
  id v10 = a5;
  unsigned __int8 v11 = +[NSNumber numberWithUnsignedLongLong:a3];
  unsigned int v12 = [(CPLPrequeliteScopeStorage *)self _storeValue:v11 forColumnVariable:*(_CPLPrequeliteScopeSyncState **)((char *)&self->_syncState + 4) scope:v10 error:a6];

  if (v12)
  {
    unsigned int v13 = +[NSNumber numberWithUnsignedInteger:a4];
    BOOL v14 = [(CPLPrequeliteScopeStorage *)self _storeValue:v13 forColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_estimatedSizeVar + 4) scope:v10 error:a6];
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (unint64_t)estimatedSizeForScope:(id)a3
{
  id v3 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(_CPLPrequeliteScopeSyncState **)((char *)&self->_syncState + 4) scope:a3];
  id v4 = [v3 unsignedLongLongValue];

  return (unint64_t)v4;
}

- (unint64_t)estimatedAssetCountForScope:(id)a3
{
  id v3 = [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_estimatedSizeVar + 4) scope:a3];
  id v4 = [v3 integerValue];

  return (unint64_t)v4;
}

- (void)_noteEndOfResetIfNecessary
{
  id v3 = [(CPLPrequeliteStorage *)self pqStore];
  id v4 = [(CPLPrequeliteStorage *)self mainTable];
  id v5 = [*(id *)((char *)&self->_transportScopeVar + 4) syncAnchorVar];
  BOOL v6 = +[PQLFormatInjection formatInjection:@"%@ IS NULL AND (%@ & %ld) = 0", v5, *(_CPLPrequeliteScopeBase **)((char *)&self->_base + 4), 28];
  unsigned __int8 v7 = [v3 table:v4 hasRecordsMatchingQuery:v6];

  if ((v7 & 1) == 0)
  {
    id v9 = [(CPLPrequeliteScopeStorage *)self abstractObject];
    id v8 = [v9 engineStore];
    [v8 noteResetSyncFinished];
  }
}

- (void)_getLocalIndexes:(id *)a3 cloudIndexes:(id *)a4 forScopeIdentifiers:(id)a5
{
  id v7 = a5;
  id v8 = objc_alloc_init((Class)NSMutableIndexSet);
  id v9 = objc_alloc_init((Class)NSMutableIndexSet);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v10 = v7;
  id v11 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = *(void *)v22;
    do
    {
      for (int64_t i = 0; i != v12; int64_t i = (char *)i + 1)
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v10);
        }
        uint64_t v15 = *(void *)(*((void *)&v21 + 1) + 8 * i);
        int64_t v16 = [(CPLPrequeliteStorage *)self localScopeIndexForScopeIdentifier:v15];
        if (v16 != 0x7FFFFFFFFFFFFFFFLL) {
          [v8 addIndex:v16];
        }
        int64_t v17 = [(CPLPrequeliteStorage *)self cloudScopeIndexForScopeIdentifier:v15];
        if (v17 != 0x7FFFFFFFFFFFFFFFLL) {
          [v9 addIndex:v17];
        }
      }
      id v12 = [v10 countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v12);
  }

  id v18 = v8;
  *a3 = v18;
  id v19 = v9;
  *a4 = v19;
}

- (id)_injectionForFilter:(id)a3
{
  id v4 = a3;
  id v5 = [v4 localIndexes];
  BOOL v6 = [v4 includedScopeIdentifiers];

  if (v6)
  {
    id v7 = [*(id *)((char *)&self->_modifiedVariables + 4) localIndexVar];
    uint64_t v8 = +[PQLConnection cplInjectionFor:v7 isInIndexSet:v5];
  }
  else
  {
    id v9 = [v4 excludedScopeIdentifiers];

    if (!v9) {
      goto LABEL_6;
    }
    id v7 = [*(id *)((char *)&self->_modifiedVariables + 4) localIndexVar];
    uint64_t v8 = +[PQLConnection cplInjectionFor:v7 isNotInIndexSet:v5];
  }
  id v9 = (void *)v8;

LABEL_6:
  return v9;
}

- (id)filterForIncludedScopeIdentifiers:(id)a3
{
  id v13 = 0;
  id v14 = 0;
  id v4 = a3;
  [(CPLPrequeliteScopeStorage *)self _getLocalIndexes:&v14 cloudIndexes:&v13 forScopeIdentifiers:v4];
  id v5 = v14;
  id v6 = v13;
  id v7 = sub_10017EDC4();
  uint64_t v8 = +[PQLConnection cplInjectionFor:v7 isInIndexSet:v5];

  id v9 = sub_10017EDC4();
  id v10 = +[PQLConnection cplInjectionFor:v9 isInIndexSet:v6];

  id v11 = [[CPLPrequeliteScopeFilter alloc] initWithIncludedScopeIdentifiers:v4 localIndexesInjection:v8 localIndexes:v5 cloudIndexesInjection:v10 cloudIndexes:v6];
  return v11;
}

- (id)filterForExcludedScopeIdentifiers:(id)a3
{
  id v13 = 0;
  id v14 = 0;
  id v4 = a3;
  [(CPLPrequeliteScopeStorage *)self _getLocalIndexes:&v14 cloudIndexes:&v13 forScopeIdentifiers:v4];
  id v5 = v14;
  id v6 = v13;
  id v7 = sub_10017EDC4();
  uint64_t v8 = +[PQLConnection cplInjectionFor:v7 isNotInIndexSet:v5];

  id v9 = sub_10017EDC4();
  id v10 = +[PQLConnection cplInjectionFor:v9 isInIndexSet:v6];

  id v11 = [[CPLPrequeliteScopeFilter alloc] initWithExcludedScopeIdentifiers:v4 localIndexesInjection:v8 localIndexes:v5 cloudIndexesInjection:v10 cloudIndexes:v6];
  return v11;
}

- (BOOL)bumpPullFromTransportExpirationIntervalWithError:(id *)a3
{
  id v5 = [(CPLPrequeliteStorage *)self pqStore];
  id v6 = [v5 pqlConnection];

  [(CPLPrequeliteScopeStorage *)self _minimalPullFromTranportExpirationInterval];
  double v8 = v7;
  id v9 = [(CPLPrequeliteStorage *)self mainTable];
  id v10 = [*(id *)((char *)&self->_pushToTransportTodoVar + 4) expirationIntervalVar];
  id v11 = [*(id *)((char *)&self->_pushToTransportTodoVar + 4) expirationIntervalVar];
  unsigned int v12 = [v6 cplExecute:@"UPDATE %@ SET %@ = %lu WHERE %@ < %lu", v9, v10, (unint64_t)v8, v11, (unint64_t)v8];

  if (v12)
  {
    uint64_t v13 = (uint64_t)[v6 changes];
    if (v13 >= 1 && !_CPLSilentLogging)
    {
      uint64_t v14 = v13;
      uint64_t v15 = sub_10017319C();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        int64_t v16 = +[CPLDateFormatter stringForTimeInterval:v8];
        *(_DWORD *)buf = 138412546;
        id v19 = v16;
        __int16 v20 = 2048;
        uint64_t v21 = v14;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Bumped pull-from-transport expiration interval to %@ for %lld scopes", buf, 0x16u);
      }
    }
  }
  else if (a3)
  {
    *a3 = [v6 lastCPLError];
  }

  return v12;
}

- (id)activationDateForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_initialDownloadDateVar + 4) scope:a3];
}

- (BOOL)storeActivationDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  id v8 = a4;
  if ([(CPLPrequeliteScopeStorage *)self _storeValue:a3 forColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_initialDownloadDateVar + 4) scope:v8 error:a5]&& [(CPLPrequeliteScopeStorage *)self storeInitialMetadataQueriesDate:0 forScope:v8 error:a5]&& [(CPLPrequeliteScopeStorage *)self storeInitialMetadataDownloadDate:0 forScope:v8 error:a5])
  {
    BOOL v9 = [(CPLPrequeliteScopeStorage *)self storeInitialMingleDate:0 forScope:v8 error:a5];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (id)initialMetadataQueriesDateForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_initialMetadataDownloadDateVar + 4) scope:a3];
}

- (BOOL)storeInitialMetadataQueriesDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  return [(CPLPrequeliteScopeStorage *)self _storeValue:a3 forColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_initialMetadataDownloadDateVar + 4) scope:a4 error:a5];
}

- (id)initialMetadataDownloadDateForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_activationDateVar + 4) scope:a3];
}

- (BOOL)storeInitialMetadataDownloadDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  return [(CPLPrequeliteScopeStorage *)self _storeValue:a3 forColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_activationDateVar + 4) scope:a4 error:a5];
}

- (id)initialMingleDateForScope:(id)a3
{
  return [(CPLPrequeliteScopeStorage *)self _valueForColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_initialMetadataQueriesDateVar + 4) scope:a3];
}

- (BOOL)storeInitialMingleDate:(id)a3 forScope:(id)a4 error:(id *)a5
{
  return [(CPLPrequeliteScopeStorage *)self _storeValue:a3 forColumnVariable:*(CPLPrequeliteVariable **)((char *)&self->_initialMetadataQueriesDateVar + 4) scope:a4 error:a5];
}

- (void)writeTransactionDidSucceed
{
  v3.receiver = self;
  v3.super_class = (Class)CPLPrequeliteScopeStorage;
  [(CPLPrequeliteStorage *)&v3 writeTransactionDidSucceed];
  if (BYTE4(self->_transportGroupClass))
  {
    [(CPLPrequeliteScopeStorage *)self _noteEndOfResetIfNecessary];
    BYTE4(self->_transportGroupClass) = 0;
  }
  [*(id *)((char *)&self->_scopeListSyncAnchorVar + 4) removeAllObjects];
}

- (void)writeTransactionDidFail
{
  v12.receiver = self;
  v12.super_class = (Class)CPLPrequeliteScopeStorage;
  [(CPLPrequeliteStorage *)&v12 writeTransactionDidFail];
  BYTE4(self->_transportGroupClass) = 0;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = *(id *)((char *)&self->_scopeListSyncAnchorVar + 4);
  id v4 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      double v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * (void)v7), "discardCachedValue", (void)v8);
        double v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }

  [*(id *)(&self->_noteEndOfResetIfNecessary + 4) discardCachedValue];
  [*(id *)((char *)&self->_scopeListSyncAnchorVar + 4) removeAllObjects];
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)(&self->_noteEndOfResetIfNecessary + 4), 0);
  objc_storeStrong((id *)((char *)&self->_libraryStateGroup + 4), 0);
  objc_storeStrong((id *)((char *)&self->_all + 4), 0);
  objc_storeStrong((id *)((char *)&self->_stagedScopeIdentifierVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_uploadComputeStateTodoVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_updateTransportTodoVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_clientNeedsToPullTodoVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_pullFromTransportTodoVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_pushToTransportTodoVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_supervisorInfoVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_initialMingleDateVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_initialMetadataQueriesDateVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_initialMetadataDownloadDateVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_activationDateVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_initialDownloadDateVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_initialSyncDateVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_estimatedAssetCountVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_estimatedSizeVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_syncState + 4), 0);
  objc_storeStrong((id *)((char *)&self->_transportScopeVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_lastLibraryInfoUpdateVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_scopeChangeVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_libraryInfoVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_deleteDateVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_disabledDateVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_flagsVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_base + 4), 0);
  objc_storeStrong((id *)((char *)&self->_modifiedVariables + 4), 0);
  objc_storeStrong((id *)((char *)&self->_scopeListSyncAnchorVar + 4), 0);
  objc_storeStrong((id *)((char *)&self->_nextIndexVar + 4), 0);
  objc_storeStrong((id *)(&self->super._shouldUpgradeSchema + 1), 0);
}

@end