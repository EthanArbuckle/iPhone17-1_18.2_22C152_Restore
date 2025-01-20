@interface CPLCloudKitTransport
+ (BOOL)allowsSyncOverCellular;
+ (BOOL)allowsSyncOverExpensiveNetwork;
+ (BOOL)allowsUserInitiatedOperationsOverExpensiveNetwork;
+ (NSArray)involvedProcesses;
+ (id)_betterErrorForRecordId:(id)a3 recordError:(id)a4;
+ (id)_errorsByTaskForTasksByRecordId:(id)a3 fromUnderlyingError:(id)a4;
- (BOOL)_isAppLibrary;
- (BOOL)canBoostBackgroundOperations;
- (BOOL)canBoostOperations;
- (BOOL)getProposedStagingScopeIdentifier:(id *)a3 stagingTransportScope:(id *)a4 forScope:(id)a5 transportScope:(id)a6 transportUserIdentifier:(id)a7;
- (BOOL)isAppLibrary;
- (BOOL)isForeground;
- (BOOL)isInterestedInZoneID:(id)a3 forCoordinator:(id)a4;
- (BOOL)isNetworkConnected;
- (BOOL)isNewTransportScope:(id)a3 compatibleWithOldTransportScope:(id)a4;
- (BOOL)isResourceDynamic:(id)a3;
- (BOOL)isSystemLibrary;
- (BOOL)opened;
- (BOOL)shouldIgnoreScopeWithIdentifier:(id)a3;
- (BOOL)shouldIgnoreZoneWithZoneID:(id)a3;
- (BOOL)shouldRunOperationsWithError:(id *)a3;
- (BOOL)supportsSharedDatabase;
- (CPLCloudKitCoordinator)coordinator;
- (CPLCloudKitOperationGroupMapper)operationGroupMapper;
- (CPLCloudKitOperationsTracker)operationTracker;
- (CPLCloudKitReschedulerManager)reschedulerManager;
- (CPLCloudKitTransport)initWithAbstractObject:(id)a3;
- (CPLCloudKitZoneManager)zoneManager;
- (CPLDuetTicketProvider)duetTicketProvider;
- (CPLFingerprintContext)fingerprintContext;
- (CPLSharedRecordPropertyMapping)propertyMapping;
- (Class)transportGroupClass;
- (Class)userIdentifierClass;
- (NSArray)involvedProcesses;
- (NSDate)significantWorkBeginDate;
- (NSError)errorForAllOperations;
- (NSString)cloudKitClientIdentifier;
- (NSString)defaultSourceBundleIdentifier;
- (NSString)mainScopeIdentifier;
- (OS_dispatch_queue)workQueue;
- (id)_tempDestinationURLForRecoveredDataWithTempFolderURL:(id)a3;
- (id)acceptTaskForSharedScope:(id)a3 completionHandler:(id)a4;
- (id)acquireReschedulerTaskWithCompletionHandler:(id)a3;
- (id)bestErrorForUnderlyingError:(id)a3;
- (id)cleanupStagedScope:(id)a3 stagingScope:(id)a4 destinationScope:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8;
- (id)cloudKitScopeForScopeIdentifier:(id)a3;
- (id)componentName;
- (id)concreteScopeFromTransportScope:(id)a3;
- (id)createGroupAllowsCellular:(BOOL)a3 allowsExpensiveNetwork:(BOOL)a4 foreground:(BOOL)a5 upload:(BOOL)a6 metadata:(BOOL)a7;
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
- (id)createGroupForPropagateChanges;
- (id)createGroupForPruningCheck;
- (id)createGroupForPublishingLibraryShare;
- (id)createGroupForPublishingMomentShare;
- (id)createGroupForQueryUserIdentities;
- (id)createGroupForRecoveryDownload;
- (id)createGroupForResetSync;
- (id)createGroupForReshare;
- (id)createGroupForResourcesDownload;
- (id)createGroupForSendExitStatus;
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
- (id)createReschedulerForSession:(id)a3;
- (id)createScopeTaskForScope:(id)a3 completionHandler:(id)a4;
- (id)databaseForOperationType:(int64_t)a3 relativeToOperationType:(int64_t)a4;
- (id)deleteTransportScope:(id)a3 scope:(id)a4 completionHandler:(id)a5;
- (id)descriptionForTransportScope:(id)a3;
- (id)downloadBatchTaskForSyncAnchor:(id)a3 scope:(id)a4 transportScopeMapping:(id)a5 currentScopeChange:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8;
- (id)downloadComputeStatesWithScopedIdentifiers:(id)a3 scope:(id)a4 sharedScope:(id)a5 targetStorageURL:(id)a6 transportScopeMapping:(id)a7 completionHandler:(id)a8;
- (id)engineLibrary;
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
- (id)interestingZoneIDsForCoordinator:(id)a3;
- (id)newOperationConfiguration;
- (id)queryTaskForCursor:(id)a3 class:(Class)a4 scope:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8;
- (id)queryUserDetailsTaskForParticipants:(id)a3 completionHandler:(id)a4;
- (id)rampingRequestTaskForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5;
- (id)recordsToFetchToIdentifyCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5;
- (id)removeParticipantInSharedLibraryTaskFromSharedScope:(id)a3 transportScope:(id)a4 share:(id)a5 retentionPolicy:(int64_t)a6 exitSource:(int64_t)a7 userIdentifiersToRemove:(id)a8 participantIDsToRemove:(id)a9 completionHandler:(id)a10;
- (id)reshareRecordsTaskWithRecords:(id)a3 sourceScope:(id)a4 destinationScope:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7;
- (id)resourceCheckTaskForResources:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6;
- (id)resourcesDownloadTaskWithCompletionHandler:(id)a3;
- (id)scopeIdentifierFromZoneID:(id)a3;
- (id)scopeNameForTransportScope:(id)a3;
- (id)scopedIdentifierForCKRecordID:(id)a3;
- (id)sendFeedbackTaskForMessages:(id)a3 completionHandler:(id)a4;
- (id)setupTaskUpdateDisabledFeatures:(BOOL)a3 completionHandler:(id)a4;
- (id)sharedLibraryServerRampTaskWithCompletionHandler:(id)a3;
- (id)shouldIgnoreZoneWithZoneID;
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
- (id)zoneIDFromScopeIdentifier:(id)a3;
- (id)zoneIdentificationForCloudKitScope:(id)a3 engineScope:(id)a4;
- (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6;
- (void)_cleanTempRecoveredDataURL:(id)a3;
- (void)_coordinator:(id)a3 provideCKAssetWithRecordID:(id)a4 fieldName:(id)a5 recordType:(id)a6 signature:(id)a7 tempFolderURL:(id)a8 completionHandler:(id)a9;
- (void)_disableSchedulerBecauseAccountIsUnavailableWithReason:(id)a3;
- (void)_enableSchedulerBecauseAccountIsAvailable;
- (void)_failAllFutureOperationsWithContainerHasBeenWipedError;
- (void)_forceUpdateAccountInfoWithReason:(id)a3;
- (void)_forceUpdateAccountInfoWithReason:(id)a3 completionHandler:(id)a4;
- (void)_noteContainerHasBeenWiped;
- (void)_startWatchingAccountInfoChangesWithCompletionHandler:(id)a3;
- (void)_stopWatchingAccountInfoChanges;
- (void)_updateAccountInfoWithCompletionHandler:(id)a3;
- (void)_updateBudgets;
- (void)_updateStateWithAccountInfo:(id)a3 walrusEnabledDefault:(id)a4;
- (void)_updateStateWithAccountStatus:(int64_t)a3;
- (void)_updateWalrusTo:(BOOL)a3;
- (void)_withTempCKAssetForData:(id)a3 tempFolderURL:(id)a4 block:(id)a5;
- (void)acquireHelperWithIdentifier:(id)a3 completionHandler:(id)a4;
- (void)associateMetric:(id)a3;
- (void)cancelBlockedTasksIncludingBackground:(BOOL)a3;
- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4;
- (void)coordinator:(id)a3 provideCKAssetWithRecordID:(id)a4 fieldName:(id)a5 recordType:(id)a6 signature:(id)a7 completionHandler:(id)a8;
- (void)coordinatorDidReceiveAPushNotification:(id)a3;
- (void)dropPersistedInitialSyncSession;
- (void)duetTicketProviderBlockedStatusDidChange;
- (void)findPersistedInitialSyncSession:(id)a3 completionHandler:(id)a4;
- (void)getStatusDictionaryWithCompletionHandler:(id)a3;
- (void)getStatusWithCompletionHandler:(id)a3;
- (void)getSystemBudgetsWithCompletionHandler:(id)a3;
- (void)getTemporaryFolderWithName:(id)a3 completionHandler:(id)a4;
- (void)launchOperation:(id)a3 type:(int64_t)a4;
- (void)noteClientIsBeginningSignificantWork;
- (void)noteClientIsEndingSignificantWork;
- (void)noteClientIsInBackground;
- (void)noteClientIsInForeground;
- (void)noteZoneIDChangeWasIgnored:(id)a3;
- (void)openWithCompletionHandler:(id)a3;
- (void)processTaskErrorIfNeeded:(id)a3 forTask:(id)a4;
- (void)registerHelper:(id)a3 withIdentifier:(id)a4;
- (void)setErrorForAllOperations:(id)a3;
- (void)setFingerprintContext:(id)a3;
- (void)setIsSignificantWorkPending:(BOOL)a3;
- (void)setOpened:(BOOL)a3;
- (void)setOperationGroupMapper:(id)a3;
- (void)setReschedulerManager:(id)a3;
- (void)setShouldIgnoreZoneWithZoneID:(id)a3;
- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4;
- (void)setSignificantWorkBeginDate:(id)a3;
- (void)setZoneManager:(id)a3;
- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5;
- (void)upgradeFlags:(id)a3 fromTransportScope:(id)a4;
@end

@implementation CPLCloudKitTransport

- (BOOL)isSystemLibrary
{
  v2 = [(CPLCloudKitTransport *)self abstractObject];
  v3 = [v2 engineLibrary];
  unsigned __int8 v4 = [v3 isSystemLibrary];

  return v4;
}

- (BOOL)isAppLibrary
{
  v2 = [(CPLCloudKitTransport *)self abstractObject];
  v3 = [v2 engineLibrary];
  unsigned __int8 v4 = [v3 isAppLibrary];

  return v4;
}

- (NSString)mainScopeIdentifier
{
  v2 = [(CPLCloudKitTransport *)self abstractObject];
  v3 = [v2 engineLibrary];
  unsigned __int8 v4 = [v3 mainScopeIdentifier];

  return (NSString *)v4;
}

- (CPLCloudKitTransport)initWithAbstractObject:(id)a3
{
  v25.receiver = self;
  v25.super_class = (Class)CPLCloudKitTransport;
  v3 = [(CPLCloudKitTransport *)&v25 initWithAbstractObject:a3];
  unsigned __int8 v4 = v3;
  if (v3)
  {
    if ([(CPLCloudKitTransport *)v3 isSystemLibrary])
    {
      uint64_t v5 = +[CPLDuetTicketProvider sharedDuetTicketProvider];
      duetTicketProvider = v4->_duetTicketProvider;
      v4->_duetTicketProvider = (CPLDuetTicketProvider *)v5;
    }
    v7 = CPLCopyDefaultSerialQueueAttributes();
    dispatch_queue_t v8 = dispatch_queue_create("com.apple.cpl.cloudkit", v7);
    workQueue = v4->_workQueue;
    v4->_workQueue = (OS_dispatch_queue *)v8;

    v10 = (NSOperationQueue *)objc_alloc_init((Class)NSOperationQueue);
    workOperationQueue = v4->_workOperationQueue;
    v4->_workOperationQueue = v10;

    [(NSOperationQueue *)v4->_workOperationQueue setUnderlyingQueue:v4->_workQueue];
    v12 = objc_alloc_init(CPLCloudKitOperationsTracker);
    operationTracker = v4->_operationTracker;
    v4->_operationTracker = v12;

    uint64_t v14 = +[CPLCloudKitCoordinator sharedCoordinator];
    coordinator = v4->_coordinator;
    v4->_coordinator = (CPLCloudKitCoordinator *)v14;

    v16 = [[CPLCloudKitSimpleCache alloc] initWithLeewayInterval:100 maximumCapacity:900.0];
    streamingContentItemCache = v4->_streamingContentItemCache;
    v4->_streamingContentItemCache = v16;

    v18 = objc_alloc_init(CPLCloudKitTaskGroupThrottler);
    streamingGate = v4->_streamingGate;
    v4->_streamingGate = v18;

    v20 = objc_alloc_init(CPLCloudKitTaskGroupThrottler);
    resourceDownloadGate = v4->_resourceDownloadGate;
    v4->_resourceDownloadGate = v20;

    v22 = objc_alloc_init(CPLCloudKitTaskGroupThrottler);
    computeStateOperationsGate = v4->_computeStateOperationsGate;
    v4->_computeStateOperationsGate = v22;

    [(CPLCloudKitTaskGroupThrottler *)v4->_computeStateOperationsGate setMinimumThrottlingInterval:86400.0];
    v4->_accountStatus = 0;
  }
  return v4;
}

- (id)engineLibrary
{
  v2 = [(CPLCloudKitTransport *)self abstractObject];
  v3 = [v2 engineLibrary];

  return v3;
}

- (void)_updateBudgets
{
  v3 = [(CPLCloudKitTransport *)self duetTicketProvider];

  if (v3)
  {
    v4[0] = _NSConcreteStackBlock;
    v4[1] = 3221225472;
    v4[2] = sub_100085A20;
    v4[3] = &unk_1002797F8;
    v4[4] = self;
    [(CPLCloudKitTransport *)self getSystemBudgetsWithCompletionHandler:v4];
  }
}

- (void)duetTicketProviderBlockedStatusDidChange
{
  workQueue = self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100085E4C;
  v6[3] = &unk_100275EA0;
  v6[4] = self;
  v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091BB8;
  block[3] = &unk_100275DF8;
  id v8 = v3;
  unsigned __int8 v4 = workQueue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)openWithCompletionHandler:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_100085FBC;
  v10[3] = &unk_100276288;
  v10[4] = self;
  id v11 = v4;
  v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091BB8;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  v7 = workQueue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)closeAndDeactivate:(BOOL)a3 completionHandler:(id)a4
{
  id v6 = a4;
  workQueue = self->_workQueue;
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100086E44;
  v12[3] = &unk_100279870;
  BOOL v14 = a3;
  v12[4] = self;
  id v13 = v6;
  id v8 = v12;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091BB8;
  block[3] = &unk_100275DF8;
  id v16 = v8;
  dispatch_block_t v9 = workQueue;
  id v10 = v6;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v9, v11);
}

- (Class)transportGroupClass
{
  return (Class)objc_opt_class();
}

- (Class)userIdentifierClass
{
  return (Class)objc_opt_class();
}

- (CPLSharedRecordPropertyMapping)propertyMapping
{
  return (CPLSharedRecordPropertyMapping *)+[CPLCKRecordPropertyMapping sharedInstance];
}

- (id)acquireReschedulerTaskWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = [[CPLCloudKitAcquireReschedulerTask alloc] initWithController:self completionHandler:v4];

  return v5;
}

- (id)setupTaskUpdateDisabledFeatures:(BOOL)a3 completionHandler:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  v7 = [[CPLCloudKitSetupTask alloc] initWithController:self updateDisabledFeatures:v4 completionHandler:v6];

  id v8 = [(CPLCloudKitTransport *)self createGroupForSetup];
  [(CPLCloudKitTransportTask *)v7 setTransportGroup:v8];

  return v7;
}

- (id)fetchRecordsTaskForRecordsWithScopedIdentifiers:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  BOOL v14 = [[CPLCloudKitFetchRecordsTask alloc] initWithController:self scopedIdentifiers:v13 targetMapping:v12 transportScopeMapping:v11 completionHandler:v10];

  return v14;
}

- (id)uploadBatchTaskForBatch:(id)a3 scope:(id)a4 targetMapping:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [[CPLCloudKitUploadBatchTask alloc] initWithController:self scope:v18 targetMapping:v17 transportScopeMapping:v16 progressHandler:v15 completionHandler:v14];

  [(CPLCloudKitUploadBatchTask *)v20 setBatch:v19];
  v21 = [(CPLCloudKitTransport *)self abstractObject];
  v22 = [v21 engineLibrary];
  v23 = [v22 store];
  v24 = [v23 libraryCreationDate];
  [(CPLCloudKitUploadBatchTask *)v20 setCplEnabledDate:v24];

  return v20;
}

- (id)reshareRecordsTaskWithRecords:(id)a3 sourceScope:(id)a4 destinationScope:(id)a5 transportScopeMapping:(id)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = [[CPLCloudKitReshareRecordsTask alloc] initWithController:self records:v16 sourceScope:v15 destinationScope:v14 transportScopeMapping:v13 completionHandler:v12];

  return v17;
}

- (id)deleteTransportScope:(id)a3 scope:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [CPLCloudKitDeleteTransportScopeTask alloc];
  id v12 = v11;
  if (v8)
  {
    id v13 = +[CPLCloudKitScope scopeFromTransportScope:v8];
    id v14 = [(CPLCloudKitDeleteTransportScopeTask *)v12 initWithController:self cloudKitScope:v13 scope:v9 completionHandler:v10];
  }
  else
  {
    id v14 = [(CPLCloudKitDeleteTransportScopeTask *)v11 initWithController:self cloudKitScope:0 scope:v9 completionHandler:v10];
  }

  return v14;
}

- (id)updateTransportScope:(id)a3 scope:(id)a4 scopeChange:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = [CPLCloudKitUpdateTransportScopeTask alloc];
  id v15 = v14;
  if (v10)
  {
    id v16 = +[CPLCloudKitScope scopeFromTransportScope:v10];
    id v17 = [(CPLCloudKitUpdateTransportScopeTask *)v15 initWithController:self cloudKitScope:v16 scope:v11 scopeChange:v12 completionHandler:v13];
  }
  else
  {
    id v17 = [(CPLCloudKitUpdateTransportScopeTask *)v14 initWithController:self cloudKitScope:0 scope:v11 scopeChange:v12 completionHandler:v13];
  }

  return v17;
}

- (id)getScopeInfoWithTransportScope:(id)a3 scope:(id)a4 previousScopeChange:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [CPLCloudKitGetScopeInfoTask alloc];
  id v15 = +[CPLCloudKitScope scopeFromTransportScope:v13];

  id v16 = [(CPLCloudKitGetScopeInfoTask *)v14 initWithController:self cloudKitScope:v15 scope:v12 previousScopeChange:v11 completionHandler:v10];
  return v16;
}

- (id)getCurrentSyncAnchorWithTransportScope:(id)a3 scope:(id)a4 previousScopeChange:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [CPLCloudKitGetCurrentSyncAnchorTask alloc];
  id v15 = +[CPLCloudKitScope scopeFromTransportScope:v13];

  id v16 = [(CPLCloudKitGetCurrentSyncAnchorTask *)v14 initWithController:self cloudKitScope:v15 scope:v12 previousScopeChange:v11 completionHandler:v10];
  return v16;
}

- (id)fetchTransportScopeForScope:(id)a3 transportScope:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [CPLCloudKitFetchTransportScopeTask alloc];
  id v12 = v11;
  if (v9)
  {
    id v13 = +[CPLCloudKitScope scopeFromTransportScope:v9];
    id v14 = [(CPLCloudKitFetchTransportScopeTask *)v12 initWithController:self scope:v8 cloudKitScope:v13 completionHandler:v10];
  }
  else
  {
    id v14 = [(CPLCloudKitFetchTransportScopeTask *)v11 initWithController:self scope:v8 cloudKitScope:0 completionHandler:v10];
  }

  return v14;
}

- (id)queryTaskForCursor:(id)a3 class:(Class)a4 scope:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a3;
  id v19 = [[CPLCloudKitQueryTask alloc] initWithController:self cursor:v18 class:a4 scope:v17 transportScopeMapping:v16 progressHandler:v15 completionHandler:v14];

  return v19;
}

- (id)downloadBatchTaskForSyncAnchor:(id)a3 scope:(id)a4 transportScopeMapping:(id)a5 currentScopeChange:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  v20 = [[CPLCloudKitDownloadBatchTask alloc] initWithController:self syncAnchor:v19 scope:v18 transportScopeMapping:v17 currentScopeChange:v16 progressHandler:v15 completionHandler:v14];

  return v20;
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
  v23 = [[CPLCloudKitUploadComputeStatesTask alloc] initWithController:self computeStates:v22 scope:v21 sharedScope:v20 targetMapping:v19 transportScopeMapping:v18 knownRecords:v17 completionHandler:v16];

  [(CPLCloudKitTransportTask *)v23 setGate:self->_computeStateOperationsGate];
  return v23;
}

- (id)downloadComputeStatesWithScopedIdentifiers:(id)a3 scope:(id)a4 sharedScope:(id)a5 targetStorageURL:(id)a6 transportScopeMapping:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [[CPLCloudKitDownloadComputeStatesTask alloc] initWithController:self scopedIdentifiers:v19 scope:v18 sharedScope:v17 targetStorageURL:v16 transportScopeMapping:v15 completionHandler:v14];

  [(CPLCloudKitTransportTask *)v20 setGate:self->_computeStateOperationsGate];
  return v20;
}

- (id)fetchScopeListChangesForScopeListSyncAnchor:(id)a3 progressHandler:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[CPLCloudKitFetchScopeListChangesTask alloc] initWithController:self scopeListSyncAnchor:v10 progressHandler:v9 completionHandler:v8];

  return v11;
}

- (id)getStreamingURLTaskForResource:(id)a3 intent:(unint64_t)a4 hints:(id)a5 timeRange:(id *)a6 target:(id)a7 transportScopeMapping:(id)a8 clientBundleID:(id)a9 completionHandler:(id)a10
{
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a5;
  id v22 = a3;
  v23 = [CPLCloudKitGetStreamingURLTask alloc];
  streamingContentItemCache = self->_streamingContentItemCache;
  long long v25 = *(_OWORD *)&a6->var0.var3;
  v29[0] = *(_OWORD *)&a6->var0.var0;
  v29[1] = v25;
  v29[2] = *(_OWORD *)&a6->var1.var1;
  v26 = [(CPLCloudKitGetStreamingURLTask *)v23 initWithController:self resource:v22 hints:v21 timeRange:v29 target:v20 transportScopeMapping:v19 cache:streamingContentItemCache completionHandler:v17];

  v27 = [(CPLCloudKitTransport *)self createGroupForMovieStreamingWithIntent:a4];
  [(CPLCloudKitTransportTask *)v26 setTransportGroup:v27];

  [(CPLCloudKitTransportTask *)v26 setGate:self->_streamingGate];
  [(CPLCloudKitTransportTask *)v26 setSourceBundleIdentifier:v18];

  return v26;
}

- (id)resourceCheckTaskForResources:(id)a3 targetMapping:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[CPLCloudKitResourcesCheckTask alloc] initWithController:self resources:v13 targetMapping:v12 transportScopeMapping:v11 completionHandler:v10];

  id v15 = [(CPLCloudKitTransport *)self createGroupForPruningCheck];
  [(CPLCloudKitTransportTask *)v14 setTransportGroup:v15];

  return v14;
}

- (id)rampingRequestTaskForResourceType:(unint64_t)a3 numRequested:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = [[CPLCloudKitRampingRequestTask alloc] initWithController:self resourceType:a3 numRequested:a4 completionHandler:v8];

  id v10 = [(CPLCloudKitTransport *)self createGroupForAnalysisDownload];
  [(CPLCloudKitTransportTask *)v9 setTransportGroup:v10];

  return v9;
}

- (id)resourcesDownloadTaskWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = [[CPLCloudKitResourcesDownloadTask alloc] initWithController:self completionHandler:v4];

  [(CPLCloudKitTransportTask *)v5 setGate:self->_resourceDownloadGate];
  return v5;
}

- (id)inMemoryDownloadTaskForResource:(id)a3 record:(id)a4 target:(id)a5 transportScopeMapping:(id)a6 clientBundleID:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [[CPLCloudKitInMemoryResourceDownloadTask alloc] initWithController:self resource:v19 record:v18 target:v17 transportScopeMapping:v16 completionHandler:v14];

  id v21 = [(CPLCloudKitTransport *)self createGroupForAnalysisDownload];
  [(CPLCloudKitTransportTask *)v20 setTransportGroup:v21];

  [(CPLCloudKitTransportTask *)v20 setGate:self->_resourceDownloadGate];
  [(CPLCloudKitTransportTask *)v20 setSourceBundleIdentifier:v15];

  return v20;
}

- (id)createScopeTaskForScope:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CPLCloudKitCreateScopeTask alloc] initWithController:self scope:v7 completionHandler:v6];

  unint64_t v9 = (unint64_t)[v7 scopeType];
  if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    [(CPLCloudKitTransport *)self createGroupForPublishingLibraryShare];
  }
  else {
  id v10 = [(CPLCloudKitTransport *)self createGroupForPublishingMomentShare];
  }
  [(CPLCloudKitTransportTask *)v8 setTransportGroup:v10];

  return v8;
}

- (id)updateShareTaskForScope:(id)a3 transportScope:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[CPLCloudKitUpdateShareTask alloc] initWithController:self scope:v10 transportScope:v9 completionHandler:v8];

  unint64_t v12 = (unint64_t)[v10 scopeType];
  if ((v12 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    [(CPLCloudKitTransport *)self createGroupForPublishingLibraryShare];
  }
  else {
  id v13 = [(CPLCloudKitTransport *)self createGroupForPublishingMomentShare];
  }
  [(CPLCloudKitTransportTask *)v11 setTransportGroup:v13];

  return v11;
}

- (id)fetchTaskForScopeWithShareURL:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CPLCloudKitFetchSharedScopeTask alloc] initWithController:self shareURL:v7 completionHandler:v6];

  id v9 = [v7 pathComponents];

  if ((unint64_t)[v9 count] < 2)
  {
    id v11 = &stru_10027FEB8;
  }
  else
  {
    id v10 = [v9 objectAtIndexedSubscript:1];
    id v11 = [v10 lowercaseString];
  }
  if (([(__CFString *)v11 isEqualToString:@"shared_library"] & 1) != 0
    || [(__CFString *)v11 isEqualToString:@"photos_sharing"])
  {
    uint64_t v12 = [(CPLCloudKitTransport *)self createGroupForFetchingLibraryShare];
  }
  else
  {
    uint64_t v12 = [(CPLCloudKitTransport *)self createGroupForFetchingMomentShare];
  }
  id v13 = (void *)v12;
  [(CPLCloudKitTransportTask *)v8 setTransportGroup:v12];

  return v8;
}

- (id)acceptTaskForSharedScope:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CPLCloudKitAcceptSharedScopeTask alloc] initWithController:self scope:v7 completionHandler:v6];

  unint64_t v9 = (unint64_t)[v7 scopeType];
  if ((v9 & 0xFFFFFFFFFFFFFFFELL) == 4) {
    [(CPLCloudKitTransport *)self createGroupForAcceptingLibraryShare];
  }
  else {
  id v10 = [(CPLCloudKitTransport *)self createGroupForAcceptingMomentShare];
  }
  [(CPLCloudKitTransportTask *)v8 setTransportGroup:v10];

  return v8;
}

- (id)fetchExistingSharedLibraryScopeTaskWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = [[CPLCloudKitFetchExistingSharedScopeTask alloc] initWithController:self completionHandler:v4];

  id v6 = [(CPLCloudKitTransport *)self createGroupForFetchingExistingSharedScope];
  [(CPLCloudKitTransportTask *)v5 setTransportGroup:v6];

  return v5;
}

- (id)startExitTaskFromSharedScope:(id)a3 transportScope:(id)a4 share:(id)a5 retentionPolicy:(int64_t)a6 exitSource:(int64_t)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  id v18 = [CPLCloudKitExitSharedLibraryTask alloc];
  id v19 = +[CPLCloudKitScope scopeFromTransportScope:v16];

  id v20 = [(CPLCloudKitExitSharedLibraryTask *)v18 initSelfExitWithController:self cloudKitScope:v19 scope:v17 share:v15 retentionPolicy:a6 exitSource:a7 completionHandler:v14];
  return v20;
}

- (id)removeParticipantInSharedLibraryTaskFromSharedScope:(id)a3 transportScope:(id)a4 share:(id)a5 retentionPolicy:(int64_t)a6 exitSource:(int64_t)a7 userIdentifiersToRemove:(id)a8 participantIDsToRemove:(id)a9 completionHandler:(id)a10
{
  id v16 = a10;
  id v17 = a9;
  id v18 = a8;
  id v19 = a5;
  id v20 = a4;
  id v21 = a3;
  id v22 = [CPLCloudKitExitSharedLibraryTask alloc];
  v23 = +[CPLCloudKitScope scopeFromTransportScope:v20];

  id v24 = [(CPLCloudKitExitSharedLibraryTask *)v22 initRemoveParticipantsWithController:self cloudKitScope:v23 scope:v21 share:v19 userIdentifiersToRemove:v18 participantIDsToRemove:v17 retentionPolicy:a6 exitSource:a7 completionHandler:v16];
  return v24;
}

- (id)fixUpSparseRecordsTaskWithTasks:(id)a3 transportScopeMapping:(id)a4 completionHandler:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v11 = [[CPLCloudKitFixUpSparseRecordTask alloc] initWithController:self tasks:v10 transportScopeMapping:v9 completionHandler:v8];

  return v11;
}

- (id)sharedLibraryServerRampTaskWithCompletionHandler:(id)a3
{
  id v4 = a3;
  dispatch_block_t v5 = [[CPLCloudKitSharedLibraryServerRampTask alloc] initWithController:self completionHandler:v4];

  id v6 = [(CPLCloudKitTransport *)self createGroupForSharedLibraryRampCheck];
  [(CPLCloudKitTransportTask *)v5 setTransportGroup:v6];

  return v5;
}

- (id)updateContributorsTaskWithSharedScope:(id)a3 contributorsUpdates:(id)a4 transportScopeMapping:(id)a5 completionHandler:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a4;
  id v13 = a3;
  id v14 = [[CPLCloudKitUpdateContributorsTask alloc] initWithController:self sharedScope:v13 contributorsUpdates:v12 transportScopeMapping:v11 completionHandler:v10];

  return v14;
}

- (id)cleanupStagedScope:(id)a3 stagingScope:(id)a4 destinationScope:(id)a5 transportScopeMapping:(id)a6 progressHandler:(id)a7 completionHandler:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [[CPLCloudKitCleanupStagedScopeTask alloc] initWithController:self stagedScope:v19 stagingScope:v18 destinationScope:v17 transportScopeMapping:v16 progressHandler:v15 completionHandler:v14];

  return v20;
}

- (id)queryUserDetailsTaskForParticipants:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CPLCloudKitQueryUserDetailsTask alloc] initWithController:self participants:v7 completionHandler:v6];

  id v9 = [(CPLCloudKitTransport *)self createGroupForQueryUserIdentities];
  [(CPLCloudKitTransportTask *)v8 setTransportGroup:v9];

  return v8;
}

- (id)sendFeedbackTaskForMessages:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [[CPLCloudKitSendFeedbackTask alloc] initWithController:self messages:v7 completionHandler:v6];

  id v9 = [(CPLCloudKitTransport *)self createGroupForFeedback];
  [(CPLCloudKitTransportTask *)v8 setTransportGroup:v9];

  return v8;
}

- (BOOL)isResourceDynamic:(id)a3
{
  id v3 = a3;
  if (CPLIsDynamicResource(v3)) {
    BOOL v4 = 1;
  }
  else {
    BOOL v4 = +[CPLCloudKitFakeDynamicDerivatives isFakeDerivative:v3];
  }

  return v4;
}

- (id)bestErrorForUnderlyingError:(id)a3
{
  return +[CPLCloudKitErrors bestErrorForUnderlyingError:a3];
}

- (id)simpleDescriptionForSyncAnchor:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    if (qword_1002CE888 != -1) {
      dispatch_once(&qword_1002CE888, &stru_100279890);
    }
    BOOL v4 = +[NSKeyedUnarchiver cpl_safeUnarchiveObjectWithData:v3 classes:qword_1002CE890];
    if (v4)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v5 = objc_alloc((Class)NSString);
        id v6 = [v4 data];
        id v7 = [v6 base64EncodedStringWithOptions:0];
        id v8 = (__CFString *)[v5 initWithFormat:@"Cursor-%@", v7];
      }
      else
      {
        id v6 = [v4 data];
        id v8 = [v6 base64EncodedStringWithOptions:0];
      }
    }
    else
    {
      id v8 = @"InvalidAnchor";
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (BOOL)getProposedStagingScopeIdentifier:(id *)a3 stagingTransportScope:(id *)a4 forScope:(id)a5 transportScope:(id)a6 transportUserIdentifier:(id)a7
{
  id v12 = a5;
  id v13 = a7;
  uint64_t v14 = +[CPLCloudKitScope scopeFromTransportScope:a6];
  id v15 = (void *)v14;
  BOOL v16 = 0;
  if (v13 && v14)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v17 = [(CPLCloudKitTransport *)self zoneIdentificationForCloudKitScope:v15 engineScope:v12];
      id v18 = [v17 proposedStagingZoneIdentificationWithCurrentUserID:v13];
      id v19 = v18;
      BOOL v16 = v18 != 0;
      if (v18)
      {
        *a3 = [v18 scopeIdentifier];
        id v20 = [v19 cloudKitScope];
        *a4 = [v20 transportScope];
      }
    }
    else
    {
      BOOL v16 = 0;
    }
  }

  return v16;
}

- (id)simpleDescriptionForScopeListSyncAnchor:(id)a3
{
  return +[CPLCloudKitFetchScopeListChangesTask descriptionForScopeListSyncAnchor:a3];
}

- (void)setIsSignificantWorkPending:(BOOL)a3
{
  id v5 = [(CPLCloudKitTransport *)self duetTicketProvider];
  id v6 = v5;
  if (v5)
  {
    workQueue = self->_workQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_10008919C;
    v11[3] = &unk_100277780;
    BOOL v13 = a3;
    v11[4] = self;
    id v12 = v5;
    id v8 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100091BB8;
    block[3] = &unk_100275DF8;
    id v15 = v8;
    id v9 = workQueue;
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v9, v10);
  }
}

- (void)getSystemBudgetsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v5 = [(CPLCloudKitTransport *)self duetTicketProvider];
  id v6 = v5;
  if (v5)
  {
    [v5 getSystemBudgetsWithCompletionHandler:v4];
  }
  else
  {
    workQueue = self->_workQueue;
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_1000894D4;
    v11[3] = &unk_100275DF8;
    id v12 = v4;
    id v8 = v11;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100091BB8;
    block[3] = &unk_100275DF8;
    id v14 = v8;
    id v9 = workQueue;
    dispatch_block_t v10 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v9, v10);
  }
}

- (void)setShouldOverride:(BOOL)a3 forSystemBudgets:(unint64_t)a4
{
  BOOL v5 = a3;
  id v6 = [(CPLCloudKitTransport *)self duetTicketProvider];
  [v6 setShouldOverride:v5 forSystemBudgets:a4];
}

- (void)noteClientIsBeginningSignificantWork
{
}

- (void)noteClientIsEndingSignificantWork
{
}

- (void)noteClientIsInForeground
{
}

- (void)noteClientIsInBackground
{
}

- (void)cancelBlockedTasksIncludingBackground:(BOOL)a3
{
}

- (id)tentativeConcreteScopeForScope:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 scopeIdentifier];
  id v6 = [(CPLCloudKitTransport *)self mainScopeIdentifier];
  if (![v5 isEqualToString:v6])
  {
    dispatch_block_t v10 = 0;
    goto LABEL_5;
  }
  id v7 = [v4 scopeType];

  if (v7 == (id)1)
  {
    id v6 = [objc_alloc((Class)CKRecordZoneID) initWithCPLScopeIdentifier:v5];
    id v8 = [[CPLCloudKitScope alloc] initWithZoneID:v6];
    id v9 = [(CPLCloudKitTransport *)self zoneIdentificationForCloudKitScope:v8 engineScope:v4];
    dispatch_block_t v10 = [v9 cloudKitScope];

LABEL_5:
    goto LABEL_7;
  }
  dispatch_block_t v10 = 0;
LABEL_7:

  return v10;
}

- (id)descriptionForTransportScope:(id)a3
{
  id v3 = +[CPLCloudKitScope scopeFromTransportScope:a3];
  id v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 zoneID];
    objc_msgSend(v5, "cpl_zoneName");
    id v6 = (__CFString *)objc_claimAutoreleasedReturnValue();

    if ([v4 isShared])
    {
      id v7 = (__CFString *)[objc_alloc((Class)NSString) initWithFormat:@"%@ shared", v6];

      id v6 = v7;
    }
  }
  else
  {
    id v6 = @"Invalid";
  }

  return v6;
}

- (id)scopeNameForTransportScope:(id)a3
{
  id v3 = +[CPLCloudKitScope scopeFromTransportScope:a3];
  id v4 = [v3 zoneID];
  BOOL v5 = objc_msgSend(v4, "cpl_zoneName");

  return v5;
}

- (id)transportScopeForUpgradeFromScopeName:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)CKRecordZone) initWithZoneName:v3];

  BOOL v5 = [[CPLCloudKitScope alloc] initWithZone:v4 options:0];
  id v6 = [(CPLCloudKitScope *)v5 transportScope];

  return v6;
}

- (void)upgradeFlags:(id)a3 fromTransportScope:(id)a4
{
  id v7 = a3;
  BOOL v5 = +[CPLCloudKitScope scopeFromTransportScope:a4];
  id v6 = v5;
  if (v5 && ([v5 options] & 2) != 0) {
    [v7 setValue:1 forFlag:1];
  }
}

- (BOOL)isNewTransportScope:(id)a3 compatibleWithOldTransportScope:(id)a4
{
  id v5 = a4;
  id v6 = +[CPLCloudKitScope scopeFromTransportScope:a3];
  if (v6)
  {
    id v7 = +[CPLCloudKitScope scopeFromTransportScope:v5];
    if (v7)
    {
      id v8 = +[CPLCloudKitDefaultZoneManager sharedInstance];
      unsigned __int8 v9 = [v8 isNewCloudKitScope:v6 compatibleWithOldCloudKitScope:v7];
    }
    else
    {
      unsigned __int8 v9 = 0;
    }
  }
  else
  {
    unsigned __int8 v9 = 0;
  }

  return v9;
}

- (id)createGroupAllowsCellular:(BOOL)a3 allowsExpensiveNetwork:(BOOL)a4 foreground:(BOOL)a5 upload:(BOOL)a6 metadata:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v8 = a6;
  BOOL v9 = a5;
  uint64_t v10 = a4;
  BOOL v11 = a3;
  if (a5 && !a3) {
    uint64_t v10 = [(id)objc_opt_class() allowsUserInitiatedOperationsOverExpensiveNetwork] | a4;
  }
  coordinator = self->_coordinator;
  return [(CPLCloudKitCoordinator *)coordinator createGroupAllowsCellular:v11 allowsExpensiveNetwork:v10 foreground:v9 upload:v8 metadata:v7 forClient:self];
}

- (id)createGroupForSendExitStatus
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Exit Status Feedback");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Exit Status Feedback"];
  }
  return v5;
}

- (id)createGroupForInitialUpload
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 1, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Initial Upload");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Initial Upload"];
  }
  return v5;
}

- (id)createGroupForResetSync
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 1, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Reset sync");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Reset sync"];
  }
  return v5;
}

- (id)createGroupForInitialDownload
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Initial Download");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Initial Download"];
  }
  return v5;
}

- (id)createGroupForPrefetch
{
  return [(CPLCloudKitTransport *)self createGroupForDownloadWithIntent:1 priority:2];
}

- (id)createGroupForThumbnailPrefetch
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 0, 0);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Thumbnails Prefetch");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Thumbnails Prefetch"];
  }
  return v5;
}

- (id)createGroupForNonDerivativePrefetch
{
  return [(CPLCloudKitTransport *)self createGroupForDownloadWithIntent:1 priority:2];
}

- (id)createGroupForKeepOriginalsPrefetch
{
  return [(CPLCloudKitTransport *)self createGroupForDownloadWithIntent:2 priority:2];
}

- (id)createGroupForMemoriesPrefetch
{
  return [(CPLCloudKitTransport *)self createGroupForDownloadWithIntent:3 priority:2];
}

- (id)createGroupForRecoveryDownload
{
  return [(CPLCloudKitTransport *)self createGroupForDownloadWithIntent:4 priority:2];
}

- (id)createGroupForWidgetPrefetch
{
  return [(CPLCloudKitTransport *)self createGroupForDownloadWithIntent:6 priority:2];
}

- (id)createGroupForSetup
{
  id v3 = [(CPLCloudKitTransport *)self createGroupAllowsCellular:1 allowsExpensiveNetwork:1 foreground:0 upload:0 metadata:1];
  id v4 = v3;
  if (self->_operationGroupMapper)
  {
    id v5 = sub_100085608(self, @"Setting Up Library");
    [v4 setName:v5];
  }
  else
  {
    [v3 setName:@"Setting Up Library"];
  }
  return v4;
}

- (id)createGroupForFeedback
{
  id v3 = [(CPLCloudKitTransport *)self createGroupAllowsCellular:1 allowsExpensiveNetwork:1 foreground:1 upload:0 metadata:0];
  id v4 = v3;
  if (self->_operationGroupMapper)
  {
    id v5 = sub_100085608(self, @"Sending Feedback");
    [v4 setName:v5];
  }
  else
  {
    [v3 setName:@"Sending Feedback"];
  }
  return v4;
}

- (id)createGroupForTransportScopeDelete
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Deleting Zone");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Deleting Zone"];
  }
  return v5;
}

- (id)createGroupForTransportScopeUpdate
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Updating Zone");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Updating Zone"];
  }
  return v5;
}

- (id)createGroupForTransportScopeRefresh
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Refreshing Zone");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Refreshing Zone"];
  }
  return v5;
}

- (id)createGroupForFetchScopeListChanges
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Fetching Zone Changes");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Fetching Zone Changes"];
  }
  return v5;
}

- (id)createGroupForLibraryStateCheck
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Checking Library State");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Checking Library State"];
  }
  return v5;
}

- (id)createGroupForChangeUpload
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 1, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Changes Upload");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Changes Upload"];
  }
  return v5;
}

- (id)createGroupForChangeDownload
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Changes Download");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Changes Download"];
  }
  return v5;
}

- (id)createGroupForComputeStateUpload
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 1, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Compute State Upload");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Compute State Upload"];
  }
  return v5;
}

- (id)createGroupForComputeStateDownloadOnDemand
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Compute State Download");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Compute State Download"];
  }
  return v5;
}

- (id)createGroupForComputeStateDownloadPrefetch
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Compute State Download Prefetch");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Compute State Download Prefetch"];
  }
  return v5;
}

- (id)createGroupForFixUpTasks
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Sparse Records Fix-Up");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Sparse Records Fix-Up"];
  }
  return v5;
}

- (id)createGroupForReshare
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Reshare shadowing records");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Reshare shadowing records"];
  }
  return v5;
}

- (id)createGroupForStagedScopeCleanup
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Clean-up Staged Zone");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Clean-up Staged Zone"];
  }
  return v5;
}

- (id)createGroupForThumbnailsDownload
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 0, 0);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Thumbnails Download");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Thumbnails Download"];
  }
  return v5;
}

- (id)createGroupForResourcesDownload
{
  return [(CPLCloudKitTransport *)self createGroupForDownloadWithIntent:0 priority:0];
}

- (id)createGroupForWidgetResourcesDownload
{
  return [(CPLCloudKitTransport *)self createGroupForDownloadWithIntent:6 priority:0];
}

- (id)createGroupForDownloadWithIntent:(unint64_t)a3 priority:(unint64_t)a4
{
  id v7 = [(id)objc_opt_class() allowsSyncOverCellular];
  BOOL v8 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v7, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], +[CPLResourceTransferTaskOptions isForegroundOperationForIntent:priority:](CPLResourceTransferTaskOptions, "isForegroundOperationForIntent:priority:", a3, a4), 0, 0);
  BOOL v9 = @"Non-Derivatives Prefetch";
  switch(a3)
  {
    case 0uLL:
      CFStringRef v10 = @"Resources Download";
      CFStringRef v11 = @"Resources Prefetch";
      goto LABEL_15;
    case 1uLL:
      break;
    case 2uLL:
      BOOL v9 = @"Keep-Originals Prefetch";
      break;
    case 3uLL:
      CFStringRef v10 = @"Memory Playback Resources Download";
      if (a4 == 1) {
        CFStringRef v10 = @"Memory Playback Resources Preload";
      }
      CFStringRef v11 = @"Memories Prefetch";
      goto LABEL_15;
    case 4uLL:
      BOOL v9 = @"Recovery Download";
      break;
    case 5uLL:
      BOOL v9 = @"Optimize-Originals Prefetch";
      break;
    case 6uLL:
      CFStringRef v10 = @"Widget Resources Download";
      CFStringRef v11 = @"Widget Prefetch";
LABEL_15:
      BOOL v13 = a4 == 2;
      goto LABEL_26;
    case 7uLL:
      BOOL v9 = @"Grid Resources Download";
      break;
    case 8uLL:
      BOOL v9 = @"1Up Resources Download";
      break;
    case 9uLL:
      BOOL v9 = @"Edit Resources Download";
      break;
    case 0xAuLL:
      BOOL v9 = @"Media Analysis Download";
      break;
    case 0xBuLL:
      BOOL v9 = @"Watch Sync Download";
      break;
    case 0xCuLL:
      BOOL v9 = @"Wallpaper Suggestion";
      break;
    case 0xDuLL:
      BOOL v9 = @"Wallpaper Shuffle";
      break;
    case 0xEuLL:
      BOOL v9 = @"Wallpaper Live Photo";
      break;
    case 0xFuLL:
      BOOL v9 = @"Background Edit Suggestion";
      break;
    case 0x10uLL:
      CFStringRef v10 = @"Memory Inline Playback Resources Download";
      CFStringRef v11 = @"Memory Inline Playback Resources Preload";
      BOOL v13 = a4 == 1;
LABEL_26:
      if (v13) {
        BOOL v9 = (__CFString *)v11;
      }
      else {
        BOOL v9 = (__CFString *)v10;
      }
      break;
    default:
      if (!_CPLSilentLogging)
      {
        id v12 = sub_1000867F8();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
        {
          int v16 = 134217984;
          unint64_t v17 = a3;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "Invalid download intent: %lu", (uint8_t *)&v16, 0xCu);
        }
      }
      BOOL v9 = @"Resources Download";
      break;
  }
  if (self->_operationGroupMapper)
  {
    id v14 = sub_100085608(self, v9);
    [v8 setName:v14];
  }
  else
  {
    [v8 setName:v9];
  }
  return v8;
}

- (id)createGroupForMovieStreamingWithIntent:(unint64_t)a3
{
  id v5 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v6 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v5, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 0, 1);
  if (a3 - 1 > 5) {
    id v7 = @"Fetching Movie Stream";
  }
  else {
    id v7 = off_100279B70[a3 - 1];
  }
  if (!self->_mightRejectVideoStreaming
    || ![(NSIndexSet *)self->_rejectedVideoStreamingIntents containsIndex:a3])
  {
    goto LABEL_17;
  }
  if (self->_rejectVideoStreamingAtContentLevel)
  {
    if (_CPLSilentLogging)
    {
      BOOL v9 = @"Content Rejected ";
      goto LABEL_16;
    }
    BOOL v8 = sub_1000867F8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      BOOL v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asking server to reject %@ at content level", (uint8_t *)&v12, 0xCu);
    }
    BOOL v9 = @"Content Rejected ";
  }
  else
  {
    if (_CPLSilentLogging)
    {
      BOOL v9 = @"Rejected ";
      goto LABEL_16;
    }
    BOOL v8 = sub_1000867F8();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412290;
      BOOL v13 = v7;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Asking server to reject %@", (uint8_t *)&v12, 0xCu);
    }
    BOOL v9 = @"Rejected ";
  }

LABEL_16:
  id v7 = [(__CFString *)v9 stringByAppendingString:v7];
LABEL_17:
  if (self->_operationGroupMapper)
  {
    CFStringRef v10 = sub_100085608(self, v7);
    [v6 setName:v10];
  }
  else
  {
    [v6 setName:v7];
  }

  return v6;
}

- (id)createGroupForAnalysisDownload
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 0, 0);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Photo Analysis");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Photo Analysis"];
  }
  return v5;
}

- (id)createGroupForPruningCheck
{
  id v3 = [(CPLCloudKitTransport *)self createGroupAllowsCellular:1 allowsExpensiveNetwork:1 foreground:1 upload:0 metadata:1];
  id v4 = v3;
  if (self->_operationGroupMapper)
  {
    id v5 = sub_100085608(self, @"Checking Resources For Pruning");
    [v4 setName:v5];
  }
  else
  {
    [v3 setName:@"Checking Resources For Pruning"];
  }
  return v4;
}

- (id)createGroupForPublishingMomentShare
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 1, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Publishing Moment Share");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Publishing Moment Share"];
  }
  return v5;
}

- (id)createGroupForFetchingMomentShare
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 1, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Fetching Moment Share");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Fetching Moment Share"];
  }
  return v5;
}

- (id)createGroupForAcceptingMomentShare
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 1, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Accepting Moment Share");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Accepting Moment Share"];
  }
  return v5;
}

- (id)createGroupForPublishingLibraryShare
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 1, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Publishing Library Share");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Publishing Library Share"];
  }
  return v5;
}

- (id)createGroupForFetchingLibraryShare
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 1, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Fetching Library Share");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Fetching Library Share"];
  }
  return v5;
}

- (id)createGroupForAcceptingLibraryShare
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 1, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Accepting Library Share");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Accepting Library Share"];
  }
  return v5;
}

- (id)createGroupForFetchingExistingSharedScope
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 1, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Looking For Shared Library Zone");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Looking For Shared Library Zone"];
  }
  return v5;
}

- (id)createGroupForCleanupLibrary
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Cleaning Shared Library");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Cleaning Shared Library"];
  }
  return v5;
}

- (id)createGroupForExitSharedLibrary
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Exit Shared Library");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Exit Shared Library"];
  }
  return v5;
}

- (id)createGroupForSharedLibraryRampCheck
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Shared Library Ramp Check");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Shared Library Ramp Check"];
  }
  return v5;
}

- (id)createGroupForQueryUserIdentities
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 1, 1, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Querying User Identities");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Querying User Identities"];
  }
  return v5;
}

- (id)createGroupForPropagateChanges
{
  id v3 = [(id)objc_opt_class() allowsSyncOverCellular];
  id v4 = -[CPLCloudKitTransport createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:](self, "createGroupAllowsCellular:allowsExpensiveNetwork:foreground:upload:metadata:", v3, [(id)objc_opt_class() allowsSyncOverExpensiveNetwork], 0, 0, 1);
  id v5 = v4;
  if (self->_operationGroupMapper)
  {
    id v6 = sub_100085608(self, @"Propagating Changes Between Zones");
    [v5 setName:v6];
  }
  else
  {
    [v4 setName:@"Propagating Changes Between Zones"];
  }
  return v5;
}

- (void)findPersistedInitialSyncSession:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  reschedulerManager = self->_reschedulerManager;
  if (reschedulerManager)
  {
    CFStringRef v10 = [(CPLCloudKitTransport *)self abstractObject];
    CFStringRef v11 = [v10 engineLibrary];
    int v12 = [v11 scheduler];
    [(CPLCloudKitReschedulerManager *)reschedulerManager findPersistedSyncSession:v6 forScheduler:v12 completionHandler:v8];
  }
  else
  {
    workQueue = self->_workQueue;
    v17[0] = _NSConcreteStackBlock;
    v17[1] = 3221225472;
    v17[2] = sub_10008BAEC;
    v17[3] = &unk_100275DF8;
    id v18 = v7;
    id v14 = v17;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100091BB8;
    block[3] = &unk_100275DF8;
    id v20 = v14;
    id v15 = workQueue;
    dispatch_block_t v16 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
    dispatch_async(v15, v16);
  }
}

- (void)dropPersistedInitialSyncSession
{
}

- (id)createReschedulerForSession:(id)a3
{
  id v4 = a3;
  reschedulerManager = self->_reschedulerManager;
  if (reschedulerManager)
  {
    if (!_CPLSilentLogging)
    {
      id v6 = sub_1000867F8();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        id v7 = self->_reschedulerManager;
        int v10 = 138412546;
        CFStringRef v11 = self;
        __int16 v12 = 2112;
        BOOL v13 = v7;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Creating CloudKit rescheduler for %@ with %@", (uint8_t *)&v10, 0x16u);
      }

      reschedulerManager = self->_reschedulerManager;
    }
    id v8 = [(CPLCloudKitReschedulerManager *)reschedulerManager newCloudKitReschedulerForSession:v4];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

+ (NSArray)involvedProcesses
{
  if (qword_1002CE8A0 != -1) {
    dispatch_once(&qword_1002CE8A0, &stru_1002798B0);
  }
  v2 = (void *)qword_1002CE898;
  return (NSArray *)v2;
}

- (NSArray)involvedProcesses
{
  v2 = objc_opt_class();
  return (NSArray *)[v2 involvedProcesses];
}

+ (BOOL)allowsSyncOverCellular
{
  if (qword_1002CE8A8 != -1) {
    dispatch_once(&qword_1002CE8A8, &stru_1002798D0);
  }
  return byte_1002C91F0;
}

+ (BOOL)allowsSyncOverExpensiveNetwork
{
  if (qword_1002CE8B0 != -1) {
    dispatch_once(&qword_1002CE8B0, &stru_1002798F0);
  }
  return byte_1002C91F1;
}

+ (BOOL)allowsUserInitiatedOperationsOverExpensiveNetwork
{
  if (qword_1002CE8B8 != -1) {
    dispatch_once(&qword_1002CE8B8, &stru_100279910);
  }
  return byte_1002C91F2;
}

- (void)_startWatchingAccountInfoChangesWithCompletionHandler:(id)a3
{
  id v5 = a3;
  if (self->_accountInfoWatcher) {
    sub_1001CCBE8(a2, (uint64_t)self);
  }
  id v6 = v5;
  id v7 = +[NSNotificationCenter defaultCenter];
  workOperationQueue = self->_workOperationQueue;
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10008C050;
  v11[3] = &unk_100279820;
  void v11[4] = self;
  BOOL v9 = [v7 addObserverForName:CKAccountChangedNotification object:0 queue:workOperationQueue usingBlock:v11];
  accountInfoWatcher = self->_accountInfoWatcher;
  self->_accountInfoWatcher = v9;

  [(CPLCloudKitTransport *)self _forceUpdateAccountInfoWithReason:0 completionHandler:v6];
}

- (void)_stopWatchingAccountInfoChanges
{
  self->_accountInfoWatcher = 0;
  _objc_release_x1();
}

- (void)_forceUpdateAccountInfoWithReason:(id)a3
{
}

- (void)_forceUpdateAccountInfoWithReason:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(void))a4;
  lastAccountInfoUpdateDate = self->_lastAccountInfoUpdateDate;
  if (lastAccountInfoUpdateDate
    && ([(NSDate *)lastAccountInfoUpdateDate timeIntervalSinceNow], v9 > -600.0))
  {
    if (!_CPLSilentLogging)
    {
      int v10 = sub_1000867F8();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        LOWORD(v14) = 0;
        _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Not updating account info as it has been updated recently", (uint8_t *)&v14, 2u);
      }
    }
    v7[2](v7);
  }
  else
  {
    if (v6 && !_CPLSilentLogging)
    {
      CFStringRef v11 = sub_1000867F8();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v14 = 138412290;
        id v15 = v6;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Force updating status of Walrus. Reason: %@", (uint8_t *)&v14, 0xCu);
      }
    }
    __int16 v12 = +[NSDate date];
    BOOL v13 = self->_lastAccountInfoUpdateDate;
    self->_lastAccountInfoUpdateDate = v12;

    [(CPLCloudKitTransport *)self _updateAccountInfoWithCompletionHandler:v7];
  }
}

- (void)_updateAccountInfoWithCompletionHandler:(id)a3
{
  id v4 = a3;
  unint64_t v5 = self->_accountInfoFetchGeneration + 1;
  self->_accountInfoFetchGeneration = v5;
  coordinator = self->_coordinator;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_10008C374;
  v8[3] = &unk_100279980;
  id v9 = v4;
  unint64_t v10 = v5;
  v8[4] = self;
  id v7 = v4;
  [(CPLCloudKitCoordinator *)coordinator fetchAccountInfoWithCompletionHandler:v8];
}

- (void)_updateStateWithAccountInfo:(id)a3 walrusEnabledDefault:(id)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4)
  {
    id v8 = [a4 BOOLValue];
    if (!_CPLSilentLogging)
    {
      id v9 = sub_1000867F8();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v10 = @"OFF";
        if (v8) {
          CFStringRef v10 = @"ON";
        }
        int v23 = 138412290;
        CFStringRef v24 = v10;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Forcing walrus to %@", (uint8_t *)&v23, 0xCu);
      }
    }
    CFStringRef v11 = self;
    uint64_t v12 = (uint64_t)v8;
LABEL_9:
    [(CPLCloudKitTransport *)v11 _updateWalrusTo:v12];
    goto LABEL_10;
  }
  id v13 = [v6 supportsDeviceToDeviceEncryption];
  int v14 = [(CPLCloudKitTransport *)self abstractObject];
  uint64_t v15 = [v14 engineLibrary];
  [(id)v15 setKeychainCDPEnabled:v13];

  dispatch_block_t v16 = [(CPLCloudKitTransport *)self abstractObject];
  unint64_t v17 = [v16 engineLibrary];
  LOBYTE(v15) = [v17 isKeychainCDPEnabled];

  if ((v15 & 1) == 0 && !_CPLSilentLogging)
  {
    id v18 = sub_1000867F8();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "[CCSS] CK Account Info reports DeviceToDeviceEncryption is disabled, ComputeSync disabled on this device", (uint8_t *)&v23, 2u);
    }
  }
  id v19 = [v7 walrusStatus];
  if (v19 == (id)2)
  {
    if (!_CPLSilentLogging)
    {
      id v21 = sub_1000867F8();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Walrus is disabled", (uint8_t *)&v23, 2u);
      }
    }
    CFStringRef v11 = self;
    uint64_t v12 = 0;
    goto LABEL_9;
  }
  if (v19 == (id)1)
  {
    if (!_CPLSilentLogging)
    {
      id v22 = sub_1000867F8();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(v23) = 0;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Walrus is enabled", (uint8_t *)&v23, 2u);
      }
    }
    CFStringRef v11 = self;
    uint64_t v12 = 1;
    goto LABEL_9;
  }
  if (!v19 && !_CPLSilentLogging)
  {
    id v20 = sub_1000867F8();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      LOWORD(v23) = 0;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "Could not determine walrus status", (uint8_t *)&v23, 2u);
    }
  }
LABEL_10:
}

- (void)_updateStateWithAccountStatus:(int64_t)a3
{
  if (!_CPLSilentLogging)
  {
    unint64_t v5 = sub_1000867F8();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = CKStringFromAccountStatus();
      int v8 = 138543362;
      id v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Account status is %{public}@", (uint8_t *)&v8, 0xCu);
    }
  }
  switch(a3)
  {
    case 1:
      [(CPLCloudKitTransport *)self _enableSchedulerBecauseAccountIsAvailable];
      return;
    case 2:
      CFStringRef v7 = @"account is restricted";
      goto LABEL_10;
    case 3:
      CFStringRef v7 = @"there is no Apple Account";
      goto LABEL_10;
    case 4:
      CFStringRef v7 = @"Apple Account is not ready";
LABEL_10:
      [(CPLCloudKitTransport *)self _disableSchedulerBecauseAccountIsUnavailableWithReason:v7];
      break;
    default:
      return;
  }
}

- (void)_enableSchedulerBecauseAccountIsAvailable
{
  if (self->_lastDisablingReasonBecauseOfAccountStatus)
  {
    if (!_CPLSilentLogging)
    {
      id v3 = sub_1000867F8();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)CFStringRef v11 = 0;
        _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Re-enabling synchronization because account is now available", v11, 2u);
      }
    }
    id v4 = [(CPLCloudKitTransport *)self abstractObject];
    unint64_t v5 = [v4 engineLibrary];
    id v6 = [v5 scheduler];

    [v6 enableSynchronizationWithReason:self->_lastDisablingReasonBecauseOfAccountStatus];
    lastDisablingReasonBecauseOfAccountStatus = self->_lastDisablingReasonBecauseOfAccountStatus;
    self->_lastDisablingReasonBecauseOfAccountStatus = 0;
  }
  int v8 = [(CPLCloudKitTransport *)self abstractObject];
  id v9 = [v8 engineLibrary];
  unsigned __int8 v10 = [v9 containerHasBeenWiped];

  if ((v10 & 1) == 0) {
    [(CPLCloudKitTransport *)self setErrorForAllOperations:0];
  }
}

- (void)_disableSchedulerBecauseAccountIsUnavailableWithReason:(id)a3
{
  id v5 = a3;
  id v6 = [(CPLCloudKitTransport *)self abstractObject];
  CFStringRef v7 = [v6 engineLibrary];
  int v8 = [v7 scheduler];

  p_lastDisablingReasonBecauseOfAccountStatus = &self->_lastDisablingReasonBecauseOfAccountStatus;
  lastDisablingReasonBecauseOfAccountStatus = self->_lastDisablingReasonBecauseOfAccountStatus;
  if (lastDisablingReasonBecauseOfAccountStatus)
  {
    if ([(NSString *)lastDisablingReasonBecauseOfAccountStatus isEqualToString:v5]) {
      goto LABEL_14;
    }
    [v8 disableSynchronizationWithReason:v5];
    [v8 enableSynchronizationWithReason:*p_lastDisablingReasonBecauseOfAccountStatus];
    if (!_CPLSilentLogging)
    {
      CFStringRef v11 = sub_1000867F8();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v12 = *p_lastDisablingReasonBecauseOfAccountStatus;
        *(_DWORD *)buf = 138412546;
        id v22 = v12;
        __int16 v23 = 2112;
        id v24 = v5;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Switching reason to disable sync sessions from %@ to %@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (!_CPLSilentLogging)
    {
      id v13 = sub_1000867F8();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = (NSString *)v5;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Disabling sync sessions. Reason: %@", buf, 0xCu);
      }
    }
    [v8 disableSynchronizationWithReason:v5];
  }
  objc_storeStrong((id *)&self->_lastDisablingReasonBecauseOfAccountStatus, a3);
  int v14 = [(CPLCloudKitTransport *)self abstractObject];
  uint64_t v15 = [v14 engineLibrary];
  unsigned __int8 v16 = [v15 containerHasBeenWiped];

  if ((v16 & 1) == 0)
  {
    uint64_t v19 = CPLErrorRetryAfterReasonKey;
    id v20 = v5;
    unint64_t v17 = +[NSDictionary dictionaryWithObjects:&v20 forKeys:&v19 count:1];
    id v18 = +[CPLErrors cplErrorWithCode:1000, 0, v17, @"%@", v5 underlyingError userInfo description];

    [(CPLCloudKitTransport *)self setErrorForAllOperations:v18];
  }
LABEL_14:
}

- (void)_updateWalrusTo:(BOOL)a3
{
  BOOL v3 = a3;
  id v5 = [(CPLCloudKitTransport *)self abstractObject];
  id v4 = [v5 engineLibrary];
  [v4 setWalrusEnabled:v3];
}

+ (id)_betterErrorForRecordId:(id)a3 recordError:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  if (!v7 || (id v9 = v8) == 0) {
    sub_1001CCCF4((uint64_t)a2, (uint64_t)a1);
  }
  unsigned __int8 v10 = [v8 localizedDescription];
  if (v10)
  {
    CFStringRef v11 = +[NSString stringWithFormat:@"%@ (for record %@)", v10, v7];
  }
  else
  {
    CFStringRef v11 = +[NSString stringWithFormat:@"record %@", v7];
  }
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  id v13 = [v9 userInfo];

  if (v13)
  {
    int v14 = [v9 userInfo];
    [v12 setDictionary:v14];

    [v12 setObject:v11 forKey:NSLocalizedDescriptionKey];
  }
  uint64_t v15 = [v9 domain];
  unsigned __int8 v16 = +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", v15, [v9 code], v12);

  return v16;
}

+ (id)_errorsByTaskForTasksByRecordId:(id)a3 fromUnderlyingError:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 domain];
  if ([v8 isEqual:CKErrorDomain])
  {
    id v9 = [v7 code];

    if (v9 == (id)2)
    {
      unsigned __int8 v10 = +[NSMapTable strongToStrongObjectsMapTable];
      CFStringRef v11 = [v7 userInfo];
      id v12 = [v11 objectForKey:CKPartialErrorsByItemIDKey];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_10008D234;
      v15[3] = &unk_1002799A8;
      id v16 = v6;
      id v18 = a1;
      id v13 = v10;
      id v17 = v13;
      [v12 enumerateKeysAndObjectsUsingBlock:v15];

      goto LABEL_6;
    }
  }
  else
  {
  }
  id v13 = 0;
LABEL_6:

  return v13;
}

- (id)componentName
{
  return @"transport.cloudkit";
}

- (void)getStatusWithCompletionHandler:(id)a3
{
  id v4 = a3;
  coordinator = self->_coordinator;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008D390;
  v7[3] = &unk_100276238;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  [(CPLCloudKitCoordinator *)coordinator getStatusForClient:self completionHandler:v7];
}

- (void)getStatusDictionaryWithCompletionHandler:(id)a3
{
  id v4 = a3;
  workQueue = self->_workQueue;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_10008DDA4;
  v10[3] = &unk_100276288;
  v10[4] = self;
  id v11 = v4;
  id v6 = v10;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091BB8;
  block[3] = &unk_100275DF8;
  id v13 = v6;
  id v7 = workQueue;
  id v8 = v4;
  dispatch_block_t v9 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v7, v9);
}

- (void)testKey:(id)a3 value:(id)a4 completionHandler:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  if ([v7 isEqual:@"reset-container"])
  {
    [(CPLCloudKitTransport *)self _noteContainerHasBeenWiped];
LABEL_5:
    (*((void (**)(id, uint64_t, void, void))v8 + 2))(v8, 1, 0, 0);
    goto LABEL_6;
  }
  if ([v7 isEqual:@"unreset-container"])
  {
    dispatch_block_t v9 = [(CPLCloudKitTransport *)self abstractObject];
    unsigned __int8 v10 = [v9 engineLibrary];
    [v10 setContainerHasBeenWiped:0];

    goto LABEL_5;
  }
  if ([v7 isEqual:@"refresh-cloudkit"])
  {
    if (!_CPLSilentLogging)
    {
      id v11 = sub_1000867F8();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Refreshing account info", buf, 2u);
      }
    }
    workQueue = self->_workQueue;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_10008E0A0;
    v16[3] = &unk_100276288;
    v16[4] = self;
    id v17 = v8;
    id v13 = v16;
    *(void *)buf = _NSConcreteStackBlock;
    uint64_t v19 = 3221225472;
    id v20 = sub_100091BB8;
    id v21 = &unk_100275DF8;
    id v22 = v13;
    int v14 = workQueue;
    dispatch_block_t v15 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, buf);
    dispatch_async(v14, v15);
  }
  else
  {
    (*((void (**)(id, void, void, void))v8 + 2))(v8, 0, 0, 0);
  }
LABEL_6:
}

- (void)_cleanTempRecoveredDataURL:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
    if (qword_1002CE8C8 != -1) {
      dispatch_once(&qword_1002CE8C8, &stru_1002799C8);
    }
    if (byte_1002CE8C0)
    {
      dispatch_assert_queue_V2((dispatch_queue_t)self->_workQueue);
      dispatch_time_t v5 = dispatch_time(0, 10000000000);
      workQueue = self->_workQueue;
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10008E318;
      block[3] = &unk_100275EA0;
      id v9 = v4;
      dispatch_after(v5, (dispatch_queue_t)workQueue, block);
    }
    else
    {
      id v7 = +[NSFileManager defaultManager];
      [v7 removeItemAtURL:v4 error:0];
    }
  }
}

- (id)_tempDestinationURLForRecoveredDataWithTempFolderURL:(id)a3
{
  workQueue = self->_workQueue;
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)workQueue);
  dispatch_time_t v5 = +[NSUUID UUID];
  id v6 = [v5 UUIDString];

  id v7 = [v4 URLByAppendingPathComponent:v6 isDirectory:0];

  return v7;
}

- (void)_withTempCKAssetForData:(id)a3 tempFolderURL:(id)a4 block:(id)a5
{
  id v8 = (void (**)(id, id, void))a5;
  workQueue = self->_workQueue;
  id v10 = a4;
  id v11 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)workQueue);
  id v12 = [(CPLCloudKitTransport *)self _tempDestinationURLForRecoveredDataWithTempFolderURL:v10];

  id v15 = 0;
  LODWORD(workQueue) = [v11 writeToURL:v12 options:1 error:&v15];

  id v13 = v15;
  if (workQueue)
  {
    id v14 = [objc_alloc((Class)CKAsset) initWithFileURL:v12];
    [v14 setItemTypeHint:@"fxd"];
    v8[2](v8, v14, 0);
  }
  else
  {
    ((void (**)(id, id, id))v8)[2](v8, 0, v13);
  }
  [(CPLCloudKitTransport *)self _cleanTempRecoveredDataURL:v12];
}

- (NSString)cloudKitClientIdentifier
{
  v2 = [(CPLCloudKitTransport *)self engineLibrary];
  BOOL v3 = [v2 libraryIdentifier];

  return (NSString *)v3;
}

- (NSString)defaultSourceBundleIdentifier
{
  v2 = [(CPLCloudKitTransport *)self abstractObject];
  BOOL v3 = [v2 engineLibrary];
  id v4 = [v3 clientAppBundleIdentifier];

  return (NSString *)v4;
}

- (void)_coordinator:(id)a3 provideCKAssetWithRecordID:(id)a4 fieldName:(id)a5 recordType:(id)a6 signature:(id)a7 tempFolderURL:(id)a8 completionHandler:(id)a9
{
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  workQueue = self->_workQueue;
  v31[0] = _NSConcreteStackBlock;
  v31[1] = 3221225472;
  v31[2] = sub_10008E7CC;
  v31[3] = &unk_100279B08;
  v31[4] = self;
  id v32 = v15;
  id v33 = v16;
  id v34 = v17;
  id v37 = v20;
  SEL v38 = a2;
  id v35 = v19;
  id v36 = v18;
  id v22 = v31;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091BB8;
  block[3] = &unk_100275DF8;
  id v40 = v22;
  __int16 v23 = workQueue;
  id v24 = v18;
  id v25 = v19;
  id v26 = v17;
  id v27 = v20;
  id v28 = v16;
  id v29 = v15;
  dispatch_block_t v30 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v23, v30);
}

- (void)coordinator:(id)a3 provideCKAssetWithRecordID:(id)a4 fieldName:(id)a5 recordType:(id)a6 signature:(id)a7 completionHandler:(id)a8
{
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_10008FDA0;
  v19[3] = &unk_100279B30;
  id v20 = self;
  id v21 = a3;
  id v22 = a4;
  id v23 = a5;
  id v24 = a6;
  id v25 = a7;
  id v26 = a8;
  id v13 = v26;
  id v14 = v25;
  id v15 = v24;
  id v16 = v23;
  id v17 = v22;
  id v18 = v21;
  [(CPLCloudKitTransport *)v20 getTemporaryFolderWithName:@"DataRepair" completionHandler:v19];
}

- (void)coordinatorDidReceiveAPushNotification:(id)a3
{
  workQueue = self->_workQueue;
  v7[0] = _NSConcreteStackBlock;
  v7[1] = 3221225472;
  v7[2] = sub_10008FFB0;
  v7[3] = &unk_100275EA0;
  v7[4] = self;
  id v4 = v7;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091BB8;
  block[3] = &unk_100275DF8;
  id v9 = v4;
  dispatch_time_t v5 = workQueue;
  dispatch_block_t v6 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v5, v6);
}

- (id)interestingZoneIDsForCoordinator:(id)a3
{
  if ([(CPLCloudKitTransport *)self _isAppLibrary])
  {
    id v4 = objc_alloc((Class)CKRecordZoneID);
    dispatch_time_t v5 = [(CPLCloudKitTransport *)self mainScopeIdentifier];
    id v6 = [v4 initWithCPLScopeIdentifier:v5];
    id v9 = v6;
    id v7 = +[NSArray arrayWithObjects:&v9 count:1];
  }
  else
  {
    id v7 = 0;
  }
  return v7;
}

- (BOOL)isInterestedInZoneID:(id)a3 forCoordinator:(id)a4
{
  return !-[CPLCloudKitTransport shouldIgnoreZoneWithZoneID:](self, "shouldIgnoreZoneWithZoneID:", a3, a4);
}

- (id)transportScopeFromConcreteScope:(id)a3
{
  return [a3 transportScope];
}

- (id)concreteScopeFromTransportScope:(id)a3
{
  return +[CPLCloudKitScope scopeFromTransportScope:a3];
}

- (id)cloudKitScopeForScopeIdentifier:(id)a3
{
  return [(CPLCloudKitZoneManager *)self->_zoneManager cloudKitScopeForScopeIdentifier:a3];
}

- (id)zoneIDFromScopeIdentifier:(id)a3
{
  return [(CPLCloudKitZoneManager *)self->_zoneManager zoneIDFromScopeIdentifier:a3];
}

- (id)scopeIdentifierFromZoneID:(id)a3
{
  return [(CPLCloudKitZoneManager *)self->_zoneManager scopeIdentifierFromZoneID:a3];
}

- (id)scopedIdentifierForCKRecordID:(id)a3
{
  id v4 = a3;
  dispatch_time_t v5 = [v4 zoneID];
  id v6 = [(CPLCloudKitTransport *)self scopeIdentifierFromZoneID:v5];
  id v7 = objc_msgSend(v4, "cpl_scopedIdentifierWithScopeIdentifier:", v6);

  return v7;
}

- (id)recordsToFetchToIdentifyCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 currentUserID:(id)a5
{
  return [(CPLCloudKitZoneManager *)self->_zoneManager recordsToFetchToIdentifyCloudKitScope:a3 proposedScopeType:a4 currentUserID:a5];
}

- (int64_t)scopeTypeForCloudKitScope:(id)a3 proposedScopeType:(int64_t)a4 fetchedRecords:(id)a5 currentUserID:(id)a6
{
  return (int64_t)[(CPLCloudKitZoneManager *)self->_zoneManager scopeTypeForCloudKitScope:a3 proposedScopeType:a4 fetchedRecords:a5 currentUserID:a6];
}

- (id)zoneIdentificationForCloudKitScope:(id)a3 engineScope:(id)a4
{
  return [(CPLCloudKitZoneManager *)self->_zoneManager zoneIdentificationForCloudKitScope:a3 engineScope:a4];
}

- (id)newOperationConfiguration
{
  return [(CPLCloudKitCoordinator *)self->_coordinator newOperationConfiguration];
}

- (void)launchOperation:(id)a3 type:(int64_t)a4
{
  id v6 = a3;
  [(CPLCloudKitCoordinator *)self->_coordinator launchOperation:v6 type:a4 forClient:self];
  if (![(CPLCloudKitTransport *)self opened])
  {
    if (!_CPLSilentLogging)
    {
      id v7 = sub_1000867F8();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        id v8 = [v6 cplOperationClassDescription];
        int v9 = 138412290;
        id v10 = v8;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Trying to launch %@ but engine is closed. Cancelling immediately", (uint8_t *)&v9, 0xCu);
      }
    }
    [v6 cancel];
  }
}

- (void)associateMetric:(id)a3
{
}

- (BOOL)isNetworkConnected
{
  v2 = [(CPLCloudKitTransport *)self engineLibrary];
  BOOL v3 = [v2 systemMonitor];
  unsigned __int8 v4 = [v3 isNetworkConnected];

  return v4;
}

- (BOOL)isForeground
{
  v2 = [(CPLCloudKitTransport *)self engineLibrary];
  BOOL v3 = [v2 scheduler];
  unsigned __int8 v4 = [v3 isClientInForeground];

  return v4;
}

- (BOOL)canBoostOperations
{
  v2 = [(CPLCloudKitTransport *)self engineLibrary];
  BOOL v3 = [v2 systemMonitor];
  unsigned __int8 v4 = [v3 canBoostOperations];

  return v4;
}

- (BOOL)canBoostBackgroundOperations
{
  v2 = [(CPLCloudKitTransport *)self engineLibrary];
  BOOL v3 = [v2 systemMonitor];
  unsigned __int8 v4 = [v3 canBoostBackgroundOperations];

  return v4;
}

- (void)_failAllFutureOperationsWithContainerHasBeenWipedError
{
  BOOL v3 = [(CPLCloudKitTransport *)self errorForAllOperations];
  unsigned __int8 v4 = v3;
  if (!v3 || ([v3 isCPLErrorWithCode:1011] & 1) == 0)
  {
    if (!_CPLSilentLogging)
    {
      dispatch_time_t v5 = sub_1000867F8();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)int v9 = 0;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "CloudKit has wiped the container (or the encryption keys have been reset) - will fail all future CK operations until engine is totally reset", v9, 2u);
      }
    }
    uint64_t v10 = CPLErrorRetryAfterDateKey;
    id v6 = +[NSDate dateWithTimeIntervalSinceNow:86400.0];
    id v11 = v6;
    id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
    id v8 = +[CPLErrors cplErrorWithCode:1011 underlyingError:0 userInfo:v7 description:@"Container has been reset - engine will need to wiped"];
    [(CPLCloudKitTransport *)self setErrorForAllOperations:v8];
  }
}

- (void)_noteContainerHasBeenWiped
{
  workQueue = self->_workQueue;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100090740;
  v6[3] = &unk_100275EA0;
  v6[4] = self;
  BOOL v3 = v6;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091BB8;
  block[3] = &unk_100275DF8;
  id v8 = v3;
  unsigned __int8 v4 = workQueue;
  dispatch_block_t v5 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v4, v5);
}

- (void)processTaskErrorIfNeeded:(id)a3 forTask:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (!v6) {
    goto LABEL_18;
  }
  uint64_t v29 = 0;
  uint64_t v30 = 0;
  if (!+[CPLCloudKitErrors getCloudKitErrorCode:&v30 internalCode:&v29 fromError:v6])goto LABEL_18; {
  if (v30 == 18 || v29 == 2039)
  }
  {
    if (!_CPLSilentLogging)
    {
      int v9 = sub_1000867F8();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Client is unsupported by server - marking engine as too old", (uint8_t *)&buf, 2u);
      }
    }
    workQueue = self->_workQueue;
    id v11 = v28;
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_100090C18;
    v28[3] = &unk_100275EA0;
    v28[4] = self;
    goto LABEL_16;
  }
  if (+[CPLCloudKitErrors isContainerHasBeenWipedError:v6])
  {
    if (!_CPLSilentLogging)
    {
      id v8 = sub_1000867F8();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        LOWORD(buf) = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Container have been wiped - informing engine", (uint8_t *)&buf, 2u);
      }
    }
    [(CPLCloudKitTransport *)self _noteContainerHasBeenWiped];
    goto LABEL_18;
  }
  if (v30 == 114)
  {
    id v15 = [(CPLCloudKitTransport *)self abstractObject];
    id v16 = [v15 engineLibrary];
    unsigned int v17 = [v16 isWalrusEnabled];

    if (v17)
    {
      if (_CPLSilentLogging) {
        goto LABEL_18;
      }
      id v13 = sub_1000867F8();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "Task %@ failed because Walrus is enabled - this might be a bug", (uint8_t *)&buf, 0xCu);
      }
      goto LABEL_17;
    }
    if (!_CPLSilentLogging)
    {
      id v26 = sub_1000867F8();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v7;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Task %@ failed because Walrus is enabled", (uint8_t *)&buf, 0xCu);
      }
    }
    workQueue = self->_workQueue;
    id v11 = v27;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_100090C78;
    v27[3] = &unk_100275EA0;
    v27[4] = self;
LABEL_16:
    id v12 = v11;
    *(void *)&long long buf = _NSConcreteStackBlock;
    *((void *)&buf + 1) = 3221225472;
    id v32 = sub_100091BB8;
    id v33 = &unk_100275DF8;
    id v34 = v12;
    id v13 = workQueue;
    dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, &buf);
    dispatch_async(v13, v14);

LABEL_17:
    goto LABEL_18;
  }
  if (v29 == 6000)
  {
    id v18 = +[CPLCloudKitErrors realErrorForError:v6];
    id v19 = [v18 userInfo];
    id v20 = [v19 objectForKey:NSUnderlyingErrorKey];

    id v21 = [v20 userInfo];
    id v22 = [v21 objectForKey:NSUnderlyingErrorKey];

    if ([v22 code] == (id)11)
    {
      id v23 = [(CPLCloudKitTransport *)self abstractObject];
      id v24 = [v23 engineLibrary];
      id v25 = [v24 scheduler];
      [v25 noteStoreNeedsToUpdateDisabledFeatures];
    }
  }
LABEL_18:
}

- (BOOL)shouldRunOperationsWithError:(id *)a3
{
  unsigned __int8 v4 = [(CPLCloudKitTransport *)self errorForAllOperations];
  dispatch_block_t v5 = v4;
  if (a3 && v4) {
    *a3 = v4;
  }

  return v5 == 0;
}

- (BOOL)_isAppLibrary
{
  v2 = [(CPLCloudKitTransport *)self mainScopeIdentifier];
  unsigned __int8 v3 = [v2 hasPrefix:CPLMainScopeIdentifierForAppPrefix];

  return v3;
}

- (BOOL)supportsSharedDatabase
{
  return ![(CPLCloudKitTransport *)self _isAppLibrary];
}

- (id)databaseForOperationType:(int64_t)a3 relativeToOperationType:(int64_t)a4
{
  return [(CPLCloudKitCoordinator *)self->_coordinator databaseForOperationType:a3 relativeToOperationType:a4 forClient:self];
}

- (BOOL)shouldIgnoreZoneWithZoneID:(id)a3
{
  id v4 = a3;
  if (![(CPLCloudKitTransport *)self _isAppLibrary])
  {
    if ([(CPLCloudKitTransport *)self supportsSharedDatabase]
      || ([v4 ownerName],
          int v9 = objc_claimAutoreleasedReturnValue(),
          unsigned int v10 = [v9 isEqualToString:CKCurrentUserDefaultName],
          v9,
          v10))
    {
      if ([(CPLCloudKitTransport *)self isSystemLibrary])
      {
        id v11 = [v4 zoneName];
        unsigned __int8 v12 = [v11 hasPrefix:CPLMainScopeIdentifierForAppPrefix];

        if (v12)
        {
          char v8 = 1;
          goto LABEL_16;
        }
      }
      shouldIgnoreZoneWithZoneID = (uint64_t (**)(id, id))self->_shouldIgnoreZoneWithZoneID;
      if (shouldIgnoreZoneWithZoneID)
      {
        char v8 = shouldIgnoreZoneWithZoneID[2](shouldIgnoreZoneWithZoneID, v4);
        goto LABEL_16;
      }
    }
    char v8 = 0;
    goto LABEL_16;
  }
  uint64_t v5 = objc_msgSend(v4, "cpl_zoneName");
  uint64_t v6 = [(CPLCloudKitTransport *)self mainScopeIdentifier];
  uint64_t v7 = v6;
  char v8 = (!v5 || !v6 || ([(id)v5 isEqual:v6] & 1) == 0) && (v5 | v7) != 0;

LABEL_16:
  return v8;
}

- (BOOL)shouldIgnoreScopeWithIdentifier:(id)a3
{
  unsigned __int8 v3 = self;
  id v4 = [(CPLCloudKitTransport *)self zoneIDFromScopeIdentifier:a3];
  LOBYTE(v3) = [(CPLCloudKitTransport *)v3 shouldIgnoreZoneWithZoneID:v4];

  return (char)v3;
}

- (void)noteZoneIDChangeWasIgnored:(id)a3
{
}

- (void)registerHelper:(id)a3 withIdentifier:(id)a4
{
  id v7 = a3;
  id v8 = a4;
  workQueue = self->_workQueue;
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10009104C;
  v15[3] = &unk_100275CC8;
  void v15[4] = self;
  id v16 = v8;
  id v17 = v7;
  SEL v18 = a2;
  unsigned int v10 = v15;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091BB8;
  block[3] = &unk_100275DF8;
  id v20 = v10;
  id v11 = workQueue;
  id v12 = v7;
  id v13 = v8;
  dispatch_block_t v14 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v11, v14);
}

- (void)acquireHelperWithIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_10009123C;
  v14[3] = &unk_100276AC8;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  int v9 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091BB8;
  block[3] = &unk_100275DF8;
  id v18 = v9;
  unsigned int v10 = workQueue;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

- (void)getTemporaryFolderWithName:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  workQueue = self->_workQueue;
  v14[0] = _NSConcreteStackBlock;
  v14[1] = 3221225472;
  v14[2] = sub_1000914C8;
  v14[3] = &unk_100276AC8;
  id v15 = v6;
  id v16 = v7;
  v14[4] = self;
  int v9 = v14;
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100091BB8;
  block[3] = &unk_100275DF8;
  id v18 = v9;
  unsigned int v10 = workQueue;
  id v11 = v6;
  id v12 = v7;
  dispatch_block_t v13 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v10, v13);
}

- (CPLCloudKitOperationsTracker)operationTracker
{
  return self->_operationTracker;
}

- (CPLCloudKitReschedulerManager)reschedulerManager
{
  return self->_reschedulerManager;
}

- (void)setReschedulerManager:(id)a3
{
}

- (CPLCloudKitOperationGroupMapper)operationGroupMapper
{
  return self->_operationGroupMapper;
}

- (void)setOperationGroupMapper:(id)a3
{
}

- (BOOL)opened
{
  return self->_opened;
}

- (void)setOpened:(BOOL)a3
{
  self->_opened = a3;
}

- (id)shouldIgnoreZoneWithZoneID
{
  return self->_shouldIgnoreZoneWithZoneID;
}

- (void)setShouldIgnoreZoneWithZoneID:(id)a3
{
}

- (CPLFingerprintContext)fingerprintContext
{
  return (CPLFingerprintContext *)objc_getProperty(self, a2, 224, 1);
}

- (void)setFingerprintContext:(id)a3
{
}

- (CPLCloudKitZoneManager)zoneManager
{
  return self->_zoneManager;
}

- (void)setZoneManager:(id)a3
{
}

- (CPLCloudKitCoordinator)coordinator
{
  return (CPLCloudKitCoordinator *)objc_getProperty(self, a2, 240, 1);
}

- (CPLDuetTicketProvider)duetTicketProvider
{
  return (CPLDuetTicketProvider *)objc_getProperty(self, a2, 248, 1);
}

- (OS_dispatch_queue)workQueue
{
  return self->_workQueue;
}

- (NSDate)significantWorkBeginDate
{
  return self->_significantWorkBeginDate;
}

- (void)setSignificantWorkBeginDate:(id)a3
{
}

- (NSError)errorForAllOperations
{
  return (NSError *)objc_getProperty(self, a2, 264, 1);
}

- (void)setErrorForAllOperations:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_errorForAllOperations, 0);
  objc_storeStrong((id *)&self->_significantWorkBeginDate, 0);
  objc_storeStrong((id *)&self->_duetTicketProvider, 0);
  objc_storeStrong((id *)&self->_coordinator, 0);
  objc_storeStrong((id *)&self->_zoneManager, 0);
  objc_storeStrong((id *)&self->_fingerprintContext, 0);
  objc_storeStrong(&self->_shouldIgnoreZoneWithZoneID, 0);
  objc_storeStrong((id *)&self->_reschedulerManager, 0);
  objc_storeStrong((id *)&self->_tempFolderURL, 0);
  objc_storeStrong((id *)&self->_startedHelperIdentifiers, 0);
  objc_storeStrong((id *)&self->_helpers, 0);
  objc_storeStrong((id *)&self->_quotaNotificationToken, 0);
  objc_storeStrong((id *)&self->_lastAccountInfoUpdateRequestDate, 0);
  objc_storeStrong((id *)&self->_accountInfo, 0);
  objc_storeStrong((id *)&self->_lastDisablingReasonBecauseOfAccountStatus, 0);
  objc_storeStrong((id *)&self->_lastAccountInfoUpdateDate, 0);
  objc_storeStrong((id *)&self->_accountInfoWatcher, 0);
  objc_storeStrong((id *)&self->_identityChangeWatcher, 0);
  objc_storeStrong((id *)&self->_computeStateOperationsGate, 0);
  objc_storeStrong((id *)&self->_streamingGate, 0);
  objc_storeStrong((id *)&self->_resourceDownloadGate, 0);
  objc_storeStrong((id *)&self->_streamingContentItemCache, 0);
  objc_storeStrong((id *)&self->_operationGroupMapper, 0);
  objc_storeStrong((id *)&self->_rejectedVideoStreamingIntentNames, 0);
  objc_storeStrong((id *)&self->_rejectedVideoStreamingIntents, 0);
  objc_storeStrong((id *)&self->_operationTracker, 0);
  objc_storeStrong((id *)&self->_workOperationQueue, 0);
  objc_storeStrong((id *)&self->_workQueue, 0);
}

@end