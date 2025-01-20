@interface BRCUserDefaults
+ (id)_userDefaultsManager;
+ (id)cachedServerConfigurationPath;
+ (id)defaultsForMangledID:(id)a3;
+ (id)defaultsForMetadataContainer;
+ (id)defaultsForSharedZone;
+ (id)defaultsForSideCar;
+ (int)rampNumberWithSession:(id)a3;
+ (void)loadCachedServerConfiguration;
+ (void)reset;
+ (void)setServerConfigurationURL:(id)a3 whenLoaded:(id)a4;
- (BOOL)BOOLForKey:(id)a3 byDefault:(BOOL)a4;
- (BOOL)BOOLForKey:(id)a3 inheritFromGlobal:(BOOL)a4 byDefault:(BOOL)a5;
- (BOOL)_isSharedDefaults;
- (BOOL)_shouldRampForKey:(id)a3 session:(id)a4;
- (BOOL)aggressivelyPCSChainWithSession:(id)a3;
- (BOOL)allowForceTelemetryDequeue;
- (BOOL)allowReadOnlyDBInIPC;
- (BOOL)allowsDirectoryListBeforeInitialChangeToken;
- (BOOL)blockApplyUntilList;
- (BOOL)canSaveRecordsDirectlyForDeltaSync;
- (BOOL)canSaveRecordsDirectlyForList;
- (BOOL)canSaveRecordsDirectlyWithDeletes;
- (BOOL)changeItemIDOnUnknownItem;
- (BOOL)checkBRCTLTCCAccessOnInternalBuild;
- (BOOL)checkTombstoneEmbargoReparents;
- (BOOL)considerSyncUpBatchFailuresAsSuccessForThrottling;
- (BOOL)dbIntegrityCheckApplyJobs;
- (BOOL)dbIntegrityCheckBasehashSalting;
- (BOOL)dbIntegrityCheckDownloadJobs;
- (BOOL)dbIntegrityCheckMissingShareOptions;
- (BOOL)dbIntegrityCheckReaderJobs;
- (BOOL)dbIntegrityCheckSyncUpJobs;
- (BOOL)dbIntegrityCheckUploadJobs;
- (BOOL)dbProfiled;
- (BOOL)dbTraced;
- (BOOL)dbVerboseProfiled;
- (BOOL)deleteShareOnEmptySave;
- (BOOL)destroyiWorkShares;
- (BOOL)enhancedDrivePrivacyForced;
- (BOOL)fetchContentRecordsInline;
- (BOOL)fetchFullAppLibraryContents;
- (BOOL)fetchShareRecordsInline;
- (BOOL)finishSaltingPartiallySaltedDirectories;
- (BOOL)forceBatchFailureWhenReceivingAssetTokenExpiration;
- (BOOL)forceDeltaInitialSync;
- (BOOL)forceFailIfExistOnRevival;
- (BOOL)fpfsOptimizeStorageAndSpeculativeDownload;
- (BOOL)fpfsSpeculativeSetDownload;
- (BOOL)fpfsUploadV2;
- (BOOL)handleUnloadedZones;
- (BOOL)ignoreCKCZMigrationAlreadyDoneErrorForABC;
- (BOOL)ignoreCKMMCSItemNotAvailableErrorForABC;
- (BOOL)ignoreFaultingErrorsDuringDirectoryProviding;
- (BOOL)integrityCheckBoosting;
- (BOOL)integrityCheckContentPolicy;
- (BOOL)isBlacklistedFromFolderSharing;
- (BOOL)nsurlsessiondEnabled;
- (BOOL)onlyTreatCaughtUpAsConsistent;
- (BOOL)optimisticallyPCSChainDuringResetWithSession:(id)a3;
- (BOOL)optimisticallyPCSChainWithSession:(id)a3;
- (BOOL)pcsChainShareAliases;
- (BOOL)preventConcurrentModifyRecordsOperations;
- (BOOL)preventRecordSyncWithoutDiffs;
- (BOOL)preventSharingFolderWithPendingDelete;
- (BOOL)recoverDamagedDocumentOnDisk;
- (BOOL)rejectDeletionsBasedOnEtag;
- (BOOL)reportXPCErrorOnPCSChain;
- (BOOL)reviveDeadDirsOnNewDirCreations;
- (BOOL)scheduleDeepScanOnFSEventsReset;
- (BOOL)sessionZombiesEnabled;
- (BOOL)should2PhasePCSChain;
- (BOOL)shouldAppLibraryBeGreedy;
- (BOOL)shouldAutoMigrateToCloudDocs;
- (BOOL)shouldBoostDefaultZone;
- (BOOL)shouldDisplayUploadNotification;
- (BOOL)shouldFetchAllChanges;
- (BOOL)shouldFixupBundleBitOnPackages;
- (BOOL)shouldFixupTargetCZMAliases;
- (BOOL)shouldMigrateFetchShareAliases;
- (BOOL)shouldPreparePCSMigration;
- (BOOL)shouldPurgeUploadsOnDeviceIDChange;
- (BOOL)shouldReportAllPerItemFailures;
- (BOOL)shouldReportTelemetryEvents;
- (BOOL)shouldSendRoundedTimestamps;
- (BOOL)shouldSendTelemetryOnCollaborationAPIs;
- (BOOL)shouldSessionBeGreedy;
- (BOOL)showNotificatioForRadarURL;
- (BOOL)showNotificatioForTapToRadar;
- (BOOL)skipContainerRecordsWithMissingAssets;
- (BOOL)skipPerItemSyncUpThrottling;
- (BOOL)skipServerSideThrottling;
- (BOOL)spotlightIndexingEnabled;
- (BOOL)stripBirthtimeFromSyncUpMaskOnDocuments;
- (BOOL)supportsEnhancedDrivePrivacy;
- (BOOL)supportsServerSideAssetCopies;
- (BOOL)syncConsistencyCheckerEnabled;
- (BOOL)syncConsistencyCheckerSnapshotting;
- (BOOL)testDevice;
- (BOOL)treatPerItemThrottleAsOperationSuccess;
- (BOOL)useFailIfOutdatedForResets;
- (BOOL)useShareReferenceOnSideCar;
- (BOOL)useTrialToGateFPFSMigration;
- (BRCSyncOperationThrottleParams)syncDownThrottle;
- (BRCSyncOperationThrottleParams)syncUpThrottle;
- (BRCUserDefaults)initWithServerConfiguration:(id)a3 globalUserDefaults:(id)a4 clientZoneIdentifier:(id)a5;
- (NSArray)carryPartitions;
- (NSArray)syncThrottles;
- (NSArray)telemetryRTCAllowedZoneNamePrefixes;
- (NSDateFormatter)dumpDateFormatter;
- (NSDictionary)appLibraryAliasRemovalThrottleParams;
- (NSDictionary)appLibraryResetThrottleParams;
- (NSDictionary)appLibraryScanThrottleParams;
- (NSDictionary)applyThrottleParams;
- (NSDictionary)downloadThrottleParams;
- (NSDictionary)locateRecordsThrottleParams;
- (NSDictionary)lostItemThrottleParams;
- (NSDictionary)migrationThrottleParams;
- (NSDictionary)operationFailureThrottleParams;
- (NSDictionary)perItemSyncUpThrottleParams;
- (NSDictionary)readerThrottleParams;
- (NSDictionary)recentsEnumeratorFailureThrottleParams;
- (NSDictionary)serverStitchingThrottleParams;
- (NSDictionary)sharedAppLibraryResetThrottleParams;
- (NSDictionary)syncClientZoneErrorThrottleParams;
- (NSDictionary)syncClientZoneThrottleParams;
- (NSDictionary)uploadFileModifiedThrottleParams;
- (NSDictionary)uploadThrottleParams;
- (NSIndexSet)telemetryEventDisabledMessages;
- (NSSet)autoEvictableUTIs;
- (NSSet)benignTelemetryErrorDescriptions;
- (NSSet)blacklistPCSPrep;
- (NSSet)blacklistedPackageExtensions;
- (NSSet)blacklistedThumbnailExtensions;
- (NSSet)excludedExtensionsWorthPreserving;
- (NSSet)excludedFilenamesWorthPreserving;
- (NSSet)excludedFilenamesWorthWarningAtLogout;
- (NSSet)extensionsSkippingBundleBitFixup;
- (NSSet)healthErrorsForReset;
- (NSSet)healthErrorsToReport;
- (NSSet)ignoredCKErrorsForABC;
- (NSSet)iworkShareableExtensions;
- (NSSet)nonAutoEvictableExtensions;
- (NSSet)nonAutoEvictableUTIs;
- (NSSet)nonEvictableExtensions;
- (NSSet)nonEvictablePathComponents;
- (NSSet)packageExtensions;
- (NSSet)recordsToIgnoreOnSyncDown;
- (NSSet)resetReasonsToTriggerTTR;
- (NSSet)shouldBeGreedyExtensions;
- (NSSet)telemetryHeaderSupportedClasses;
- (NSString)dumpDateFormat;
- (NSString)fakeEtagForFailIfOutdated;
- (NSString)serverConfigurationURL;
- (OS_xpc_object)aggressivePCSChainActivity;
- (OS_xpc_object)analyticsReportXPCActivity;
- (OS_xpc_object)appTelemetryGatherXPCActivity;
- (OS_xpc_object)cacheDeletePushXPCActivity;
- (OS_xpc_object)configurationUpdateXPCActivity;
- (OS_xpc_object)dbIntegrityCheckXPCActivity;
- (OS_xpc_object)finishSaltingPartiallySaltedDirectoriesActivity;
- (OS_xpc_object)fpfsMigrationSchedulerXPCActivity;
- (OS_xpc_object)fpfsMigrationTrialRefreshXPCActivity;
- (OS_xpc_object)stageGCXPCActivity;
- (OS_xpc_object)syncConsistencyCheckerXPCActivity;
- (OS_xpc_object)transmogrifyXPCActivity;
- (char)forceSyncOverride;
- (double)accessTimeDeltaInHighUrgency;
- (double)accessTimeDeltaInLowUrgency;
- (double)accessTimeDeltaInMedUrgency;
- (double)accessTimeDeltaInVeryHighUrgency;
- (double)accountWaiterErrorRetryBackoff;
- (double)accountWaiterRefreshPacerDelay;
- (double)activeDownloadSizeRefreshInterval;
- (double)appsFetchPacerDelay;
- (double)autoBugCaptureReporterThrottlePeriod;
- (double)bounceFileReportInterval;
- (double)buddyFlowObserverRefreshTimerInterval;
- (double)cacheDeleteRecomputeInterval;
- (double)dbBatchDelay;
- (double)dbFixupContentPolicyRecoverAfterTimeInterval;
- (double)defaultOnDiskAccessTimeDefaultForEviction;
- (double)defaultTimeDeltaForEviction;
- (double)diskSpaceCheckInterval;
- (double)documentAccessHighPriorityInterval;
- (double)doubleForKey:(id)a3 min:(double)a4 max:(double)a5 byDefault:(double)a6;
- (double)downloadSizeRefreshInterval;
- (double)eventMetricTimeout;
- (double)forceForegroundGracePeriod;
- (double)foregroundGracePeriod;
- (double)fseventsLatency;
- (double)fseventsResetBackoff;
- (double)graveyardAgeDeltaInLowUrgency;
- (double)graveyardAgeDeltaInMedUrgency;
- (double)healthZoneTimeIntervalForMaxNumberOfResets;
- (double)intervalToWaitBeforeShowingAdditionalDescription;
- (double)markChildLostBackoff;
- (double)maxPauseFileTimeout;
- (double)maximumDocumentAgeToBeGreedy;
- (double)minFetchQuotaInterval;
- (double)minForceTelemetrySyncInterval;
- (double)onDiskAccessTimeDeltaInHighUrgency;
- (double)onDiskAccessTimeDeltaInLowUrgency;
- (double)onDiskAccessTimeDeltaInMedUrgency;
- (double)onDiskAccessTimeDeltaInVeryHighUrgency;
- (double)operationTimeout;
- (double)packageExtensionPlistWriteInterval;
- (double)periodicSyncAppLibraryLastBoostMinThreshold;
- (double)periodicSyncAutoTriggerTimeInterval;
- (double)periodicSyncNetworkStableMinThreshold;
- (double)periodicSyncNetworkUnreachableMinThreshold;
- (double)periodicSyncScreenUnlockedMinThreshold;
- (double)periodicSyncTimeInterval;
- (double)powerLogReportInterval;
- (double)purgePacerInterval;
- (double)qbsExpectedItemsFetchedCheckInterval;
- (double)quotaFetchPacerDelay;
- (double)readerIOsCancelDelay;
- (double)readerLostItemBackoff;
- (double)readerPackageProcessingDelay;
- (double)recentsEnumeratorPacerInterval;
- (double)refreshRevisionMaxBackoff;
- (double)secondsToWaitBeforeSendingReimportDomainFailureTTR;
- (double)syncConsistencyTimeout;
- (double)syncConsistencyXPCActivityCheckLeeway;
- (double)syncConsistencyXPCActivityDeferralCheckInterval;
- (double)syncDownDelayForFailure;
- (double)syncUpDelayForFailure;
- (double)systemLowDiskLatency;
- (double)systemPowerLatency;
- (double)systemReachabilityMaxDelay;
- (double)systemReachabilityMinDelay;
- (double)systemReachabilityStableStateMinThreshold;
- (double)telemetryApplySchedulerTimeout;
- (double)telemetryRTCPacerMinFireInterval;
- (double)throttleThresholdBeforeImmediatelyFailingNonDiscretionaryOp;
- (double)throttleThresholdToBlockExistingOpOnNewOp;
- (double)thumbnailGenerationForCollaborationUploadTimeout;
- (double)thumbnailGenerationOperationTimeout;
- (double)transferQueueTransferBudget;
- (double)writerIOsCancelDelay;
- (double)xattrAgeDelta;
- (double)zoneAutoResetDelayInSecAfterAppUninstall;
- (float)_defaultSyncUpDailyBudget;
- (float)_defaultSyncUpHourlyBudget;
- (float)_defaultSyncUpMinutelyBudget;
- (float)dbAutovacuumRatio;
- (float)floatForKey:(id)a3 inheritFromGlobal:(BOOL)a4 min:(float)a5 max:(float)a6 byDefault:(float)a7;
- (float)floatForKey:(id)a3 min:(float)a4 max:(float)a5 byDefault:(float)a6;
- (float)modifyRecordsCountAdditiveIncreaseFraction;
- (float)modifyRecordsCountMultiplicativeDecrease;
- (float)relativeDiskSpaceRequiredToReturnToGreedyState;
- (float)syncUpBackoffDelayForFailure;
- (float)syncUpBackoffRatioForFailure;
- (float)syncUpDailyBudget;
- (float)syncUpDataCreateCost;
- (float)syncUpDataDeleteCost;
- (float)syncUpDataEditCost;
- (float)syncUpDocumentCreateCost;
- (float)syncUpDocumentDeleteCost;
- (float)syncUpDocumentEditCost;
- (float)syncUpHourlyBudget;
- (float)syncUpInitialItemCost;
- (float)syncUpMinimalBudget;
- (float)syncUpMinutelyBudget;
- (float)syncUpStructureCreateCost;
- (float)syncUpStructureDeleteCost;
- (float)syncUpStructureEditCost;
- (id)_UTISetFor:(id)a3 startingWithExtensions:(id)a4;
- (id)_brErrorSetForKey:(id)a3 byDefault:(id)a4;
- (id)_extensionSetForKey:(id)a3 startingWithExtensions:(id)a4;
- (id)_healthErrorSetForKey:(id)a3 byDefault:(id)a4;
- (id)_loadObjectForKey:(id)a3 inheritFromGlobal:(BOOL)a4 suiteName:(id)a5 validateWithBlock:(id)a6;
- (id)_serverDefaultForKey:(id)a3;
- (id)indexSetForKey:(id)a3 byDefault:(id)a4;
- (id)indexSetForKey:(id)a3 inheritFromGlobal:(BOOL)a4 byDefault:(id)a5;
- (id)initAsGlobalWithServerConfiguration:(id)a3;
- (id)objectForKey:(id)a3 inheritFromGlobal:(BOOL)a4 suiteName:(id)a5 validateWithBlock:(id)a6;
- (id)objectForKey:(id)a3 inheritFromGlobal:(BOOL)a4 validateWithBlock:(id)a5;
- (id)stringForKey:(id)a3 byDefault:(id)a4;
- (id)stringForKey:(id)a3 inheritFromGlobal:(BOOL)a4 byDefault:(id)a5;
- (id)xpcActivityDictionaryForKey:(id)a3 byDefault:(id)a4;
- (int)dbBatchSize;
- (int)discretionaryRecursiveListMaxOperationCount;
- (int)fpfsMigrationCleanupBatchSize;
- (int)intForKey:(id)a3 min:(int)a4 max:(int)a5 byDefault:(int)a6;
- (int)nonDiscretionaryRecursiveListMaxOperationCount;
- (int)readerMaxConcurrentIOs;
- (int)readerScanBatchSize;
- (int)setupAssistantReadyMaxWaitTimeInSec;
- (int)transferQueueMaxConcurrentOperations;
- (int)transferQueueMinBatchSize;
- (int)transferQueueMinConcurrentOperations;
- (int)writerApplyBatchSize;
- (int)writerMaxConcurrentIOs;
- (int64_t)dbAutovacuumBatchSize;
- (int64_t)dbMigrationBatchSize;
- (int64_t)dbReclaimableSpaceThreshold;
- (int64_t)delayForStuckThrottle;
- (int64_t)minAutomaticallyEvictableFilesize;
- (int64_t)minFileSizeForGraveyard;
- (int64_t)minFileSizeForThumbnailTransfer;
- (int64_t)minimalSizeToShowAdditionalDescription;
- (int64_t)recursiveListFetchDirFaultBatchSize;
- (int64_t)telemetryEventQueueSize;
- (int64_t)telemetryEventReportBatchSize;
- (int64_t)telemetryRetryCountForPermenentFailure;
- (int64_t)timeoutForCZMProcessing;
- (int64_t)uploadMaxFileSize;
- (int64_t)uploadMaxInPkgFileSize;
- (int64_t)uploadMaxPkgFileSize;
- (unint64_t)aliasDeletionBatchSize;
- (unint64_t)applyCountToSignalFaultsLive;
- (unint64_t)applyRetryCountForFailure;
- (unint64_t)autoBugCaptureReporterThrottleCapacity;
- (unint64_t)availableQuotaComfortSize;
- (unint64_t)computeEvictableBatchSize;
- (unint64_t)copyShareIDsBatchSize;
- (unint64_t)deleteShareIDBatchCount;
- (unint64_t)diskSpaceRequiredToReturnToGreedyState;
- (unint64_t)downloadBatchCount;
- (unint64_t)downloadBatchRecordsCount;
- (unint64_t)downloadRetryCountForFailure;
- (unint64_t)downloadWillRetryProgressMaxCount;
- (unint64_t)enhancedDrivePrivacyBasehashSaltingBatchSize;
- (unint64_t)fieldsToMoveOutOfTrashMask;
- (unint64_t)fseventProcessBatchSize;
- (unint64_t)fseventQueueBufferSize;
- (unint64_t)healthZoneMaxNumberOfResets;
- (unint64_t)listDirChangesCancelDelay;
- (unint64_t)lostItemUnderUnknownParentBeforeDeepScan;
- (unint64_t)lostScanDeepScanFirstThreshold;
- (unint64_t)maxBackoffToRetryUserInitiated;
- (unint64_t)maxFolderEnumerationCount;
- (unint64_t)maxFolderEnumerationDepth;
- (unint64_t)maxNumberOfFilesInAFolder;
- (unint64_t)maxPreservedXattrBlobSize;
- (unint64_t)maxTotalFilesCount;
- (unint64_t)maxXattrBlobSize;
- (unint64_t)maximumAccountSizeToBeAlwaysGreedy;
- (unint64_t)minimumDiskSpaceRequiredToBeFunctional;
- (unint64_t)minimumDiskSpaceRequiredToBeGreedy;
- (unint64_t)minimumDiskSpaceRequiredToDownload;
- (unint64_t)minimumDiskSpaceRequiredToDownloadUserInitiated;
- (unint64_t)minimumNumberOfFailuresBeforeReportingSyncBackoffRatio;
- (unint64_t)notifBatchSize;
- (unint64_t)notifGatherUpTo;
- (unint64_t)notifOverflowLimit;
- (unint64_t)numberOfGreedyRecentlyUsedItems;
- (unint64_t)pcsChainingBatchSize;
- (unint64_t)pcsChainingMaxPathDepth;
- (unint64_t)pendingChangesStreamCloseDelay;
- (unint64_t)pendingChangesStreamHardOpenCount;
- (unint64_t)pendingChangesStreamSoftOpenCount;
- (unint64_t)qbsExpectedItemsFetchedPerInterval;
- (unint64_t)readerMarkChildrenLostBatchSize;
- (unint64_t)readerRetryCountForFailure;
- (unint64_t)recentsEnumeratorBatchSize;
- (unint64_t)recentsEnumeratorMaxHierarchyDepth;
- (unint64_t)rescheduleItemsRecursivelyBatchSize;
- (unint64_t)resumeProgressBatchSize;
- (unint64_t)sharedDBSyncDownBatchRecordsCount;
- (unint64_t)sharedDbSyncDownCoalesceNanoseconds;
- (unint64_t)sqliteCacheSize;
- (unint64_t)sqliteCacheSpill;
- (unint64_t)statementCacheMaxCountForClientTruth;
- (unint64_t)statementCacheMaxCountForServerTruth;
- (unint64_t)syncUpRetryCountForFailure;
- (unint64_t)telemetryErrorDescriptionMaxLength;
- (unint64_t)unsignedLongLongForKey:(id)a3 min:(unint64_t)a4 max:(unint64_t)a5 byDefault:(unint64_t)a6;
- (unint64_t)uploadBatchCount;
- (unint64_t)uploadBatchRecordsCount;
- (unint64_t)uploadRetryCountForAssetNotFoundFailure;
- (unint64_t)uploadRetryCountForFailure;
- (unint64_t)utiCacheSize;
- (unint64_t)xpcConnectionFailureRetries;
- (unint64_t)zoneHealthReportedRecordNamesCount;
- (unint64_t)zoneHealthSyncDownBatchRecordsCount;
- (unsigned)_umaskForKey:(id)a3;
- (unsigned)applySchedulerJobMaxRetriesBeforeAssert;
- (unsigned)autoResumeSyncBatchSize;
- (unsigned)bounceFileMaxRetries;
- (unsigned)contentPolicyPropogationTimeInSec;
- (unsigned)forceTelemetryDequeuePercentage;
- (unsigned)fpReadyForXpcCheckMaxWaitTimeInSec;
- (unsigned)highPriorityTelemetryEventsPercentage;
- (unsigned)iWorkFetchPausedFilesBatchSize;
- (unsigned)ignoredQuarantineMask;
- (unsigned)listFilesIngestedBatchSize;
- (unsigned)logoutTimeout;
- (unsigned)maxRecordCountInClientZoneModifyRecordsOperation;
- (unsigned)maxRecordCountInFetchRecordsOperation;
- (unsigned)maxRecordCountInModifyRecordsOperation;
- (unsigned)maxRecordCountInQuerySharedRecordsOperation;
- (unsigned)maxRecordCountWhenListingDirChanges;
- (unsigned)maxRelativePathDepth;
- (unsigned)maxSyncPathDepth;
- (unsigned)publishURLTimeout;
- (unsigned)stageDirectoryUmask;
- (unsigned)stageFSRootUmask;
- (unsigned)stageFileUmask;
- (unsigned)stageInPackageDirectoryUmask;
- (unsigned)stageInPackageFileUmask;
- (unsigned)subResourceFetchLoopCacheSize;
- (unsigned)syncConsistencyFileChecksumRate;
- (unsigned)syncConsistencyMaxEventsCount;
- (unsigned)syncConsistencyPackageChecksumRate;
- (unsigned)telemetryEventQueueReductionAmount;
- (unsigned)thumbnailTransferQueueWidth;
- (unsigned)timestampRoundingAmount;
- (unsigned)treeEnumeratorBatchSize;
- (unsigned)ubiquitousMigrationMaxBouncingAttempts;
- (unsigned)unsignedIntForKey:(id)a3 inheritFromGlobal:(BOOL)a4 min:(unsigned int)a5 max:(unsigned int)a6 byDefault:(unsigned int)a7;
- (unsigned)unsignedIntForKey:(id)a3 min:(unsigned int)a4 max:(unsigned int)a5 byDefault:(unsigned int)a6;
- (unsigned)validationKeyTruncationLength;
@end

@implementation BRCUserDefaults

- (id)objectForKey:(id)a3 inheritFromGlobal:(BOOL)a4 validateWithBlock:(id)a5
{
  return [(BRCUserDefaults *)self objectForKey:a3 inheritFromGlobal:a4 suiteName:0 validateWithBlock:a5];
}

+ (id)defaultsForMangledID:(id)a3
{
  id v4 = a3;
  if ([v4 isShared])
  {
    v5 = [a1 defaultsForSharedZone];
  }
  else
  {
    v6 = [a1 _userDefaultsManager];
    v7 = [v4 appLibraryOrZoneName];
    v5 = [v6 defaultsForIdentifier:v7];
  }
  return v5;
}

- (id)initAsGlobalWithServerConfiguration:(id)a3
{
  return [(BRCUserDefaults *)self initWithServerConfiguration:a3 globalUserDefaults:0 clientZoneIdentifier:0];
}

- (BRCUserDefaults)initWithServerConfiguration:(id)a3 globalUserDefaults:(id)a4 clientZoneIdentifier:(id)a5
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  v16.receiver = self;
  v16.super_class = (Class)BRCUserDefaults;
  v12 = [(BRCUserDefaults *)&v16 init];
  if (v12)
  {
    v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    cache = v12->_cache;
    v12->_cache = v13;

    objc_storeStrong((id *)&v12->_serverContainerConfigurationDict, a3);
    objc_storeStrong((id *)&v12->_globalUserDefault, a4);
    objc_storeStrong((id *)&v12->_clientZoneIdentifier, a5);
  }

  return v12;
}

+ (id)_userDefaultsManager
{
  if (_userDefaultsManager_once != -1) {
    dispatch_once(&_userDefaultsManager_once, &__block_literal_global_396);
  }
  v2 = [MEMORY[0x1E4FB36F8] sharedManager];
  v3 = objc_msgSend(v2, "br_currentPersonaID");

  id v4 = (id)_userDefaultsManager_userDefaultsManagers;
  objc_sync_enter(v4);
  v5 = [(id)_userDefaultsManager_userDefaultsManagers objectForKeyedSubscript:v3];
  if (!v5)
  {
    v5 = [[BRCUserDefaultsManager alloc] initWithPersonaID:v3];
    [(id)_userDefaultsManager_userDefaultsManagers setObject:v5 forKeyedSubscript:v3];
  }
  objc_sync_exit(v4);

  return v5;
}

- (double)systemPowerLatency
{
  [(BRCUserDefaults *)self doubleForKey:@"system.power" min:0.001 max:172800.0 byDefault:10.0];
  return result;
}

- (double)doubleForKey:(id)a3 min:(double)a4 max:(double)a5 byDefault:(double)a6
{
  id v10 = a3;
  if (a4 >= a5)
  {
    objc_super v16 = brc_bread_crumbs();
    v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaults intForKey:min:max:byDefault:]();
    }
  }
  if (a4 > a6)
  {
    v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaults intForKey:min:max:byDefault:]();
    }
  }
  if (a6 > a5)
  {
    v20 = brc_bread_crumbs();
    v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaults intForKey:min:max:byDefault:]();
    }
  }
  uint64_t v22 = MEMORY[0x1E4F143A8];
  uint64_t v23 = 3221225472;
  v24 = __50__BRCUserDefaults_doubleForKey_min_max_byDefault___block_invoke;
  v25 = &unk_1E699B248;
  double v27 = a6;
  double v28 = a4;
  double v29 = a5;
  id v26 = v10;
  id v11 = v10;
  v12 = [(BRCUserDefaults *)self objectForKey:v11 inheritFromGlobal:1 validateWithBlock:&v22];
  objc_msgSend(v12, "doubleValue", v22, v23, v24, v25);
  double v14 = v13;

  return v14;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_clientZoneIdentifier, 0);
  objc_storeStrong((id *)&self->_cache, 0);
  objc_storeStrong((id *)&self->_serverContainerConfigurationDict, 0);
  objc_storeStrong((id *)&self->_globalUserDefault, 0);
}

- (id)_serverDefaultForKey:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  double v28 = BRVersion();
  if (!v28) {
    goto LABEL_27;
  }
  id v26 = v4;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  double v27 = self;
  v6 = self->_serverContainerConfigurationDict;
  uint64_t v7 = [(NSDictionary *)v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v30 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        if ([v11 hasPrefix:@"defaults.clouddocs."])
        {
          v12 = [v11 substringFromIndex:objc_msgSend(@"defaults.clouddocs.", "length")];
          if ([v12 length])
          {
            [v5 addObject:v12];
          }
          else
          {
            double v13 = brc_bread_crumbs();
            double v14 = brc_default_log();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = 138412546;
              v34 = v11;
              __int16 v35 = 2112;
              v36 = v13;
              _os_log_fault_impl(&dword_1D353B000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: no version for key: %@%@", buf, 0x16u);
            }
          }
        }
      }
      uint64_t v8 = [(NSDictionary *)v6 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v8);
  }

  [v5 sortUsingComparator:&__block_literal_global_415];
  uint64_t v15 = [v5 count];
  id v4 = v26;
  if (v15 - 1 < 0)
  {
LABEL_26:

    self = v27;
LABEL_27:
    v21 = [(NSDictionary *)self->_serverContainerConfigurationDict valueForKey:v4];
    goto LABEL_28;
  }
  uint64_t v16 = v15;
  v17 = &dword_1D353B000;
  while (1)
  {
    v18 = [v5 objectAtIndexedSubscript:--v16];
    if ([v28 compare:v18 options:64] != -1)
    {
      v19 = [@"defaults.clouddocs." stringByAppendingString:v18];
      v20 = [(NSDictionary *)v27->_serverContainerConfigurationDict objectForKeyedSubscript:v19];
      if (!v20)
      {
        uint64_t v22 = v17;
        uint64_t v23 = brc_bread_crumbs();
        v24 = brc_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412290;
          v34 = v23;
          _os_log_fault_impl(v22, v24, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: perVersionDict%@", buf, 0xCu);
        }

        v17 = v22;
      }
      v21 = [v20 valueForKey:v26];

      if (v21) {
        break;
      }
    }

    if (v16 < 1) {
      goto LABEL_26;
    }
  }

LABEL_28:
  return v21;
}

void __39__BRCUserDefaults__userDefaultsManager__block_invoke()
{
  uint64_t v0 = objc_opt_new();
  v1 = (void *)_userDefaultsManager_userDefaultsManagers;
  _userDefaultsManager_userDefaultsManagers = v0;
}

+ (id)defaultsForMetadataContainer
{
  v2 = [a1 _userDefaultsManager];
  v3 = [v2 defaultsForIdentifier:@"container-metadata"];

  return v3;
}

+ (id)defaultsForSharedZone
{
  v2 = [a1 _userDefaultsManager];
  v3 = [v2 defaultsForIdentifier:*MEMORY[0x1E4F59458]];

  return v3;
}

+ (id)defaultsForSideCar
{
  v2 = [a1 _userDefaultsManager];
  v3 = [v2 defaultsForIdentifier:*MEMORY[0x1E4F596D8]];

  return v3;
}

+ (void)setServerConfigurationURL:(id)a3 whenLoaded:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [a1 _userDefaultsManager];
  [v8 setServerConfigurationURL:v7 whenLoaded:v6];
}

+ (id)cachedServerConfigurationPath
{
  v2 = NSSearchPathForDirectoriesInDomains(NSApplicationSupportDirectory, 1uLL, 1);
  v3 = [v2 firstObject];
  id v4 = [v3 stringByAppendingPathComponent:@"CloudDocs"];

  id v5 = [v4 stringByAppendingPathComponent:@"server-conflig.plist"];

  return v5;
}

+ (void)loadCachedServerConfiguration
{
  id v2 = [a1 _userDefaultsManager];
  [v2 loadCachedServerConfiguration];
}

+ (void)reset
{
  id v2 = [a1 _userDefaultsManager];
  [v2 reset];
}

- (BOOL)_isSharedDefaults
{
  return [(NSString *)self->_clientZoneIdentifier isEqualToString:*MEMORY[0x1E4F59458]];
}

- (id)_loadObjectForKey:(id)a3 inheritFromGlobal:(BOOL)a4 suiteName:(id)a5 validateWithBlock:(id)a6
{
  BOOL v8 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  v12 = (void (**)(id, id))a6;
  double v13 = [(BRCUserDefaults *)self _serverDefaultForKey:v10];
  if (v13)
  {
    double v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      int v26 = 138412802;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v13;
      __int16 v30 = 2112;
      long long v31 = v14;
      _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] server default for %@: %@%@", (uint8_t *)&v26, 0x20u);
    }
  }
  if (v11)
  {
    uint64_t v16 = (void *)[objc_alloc(MEMORY[0x1E4F1CB18]) initWithSuiteName:v11];
  }
  else
  {
    uint64_t v16 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  }
  v17 = v16;
  if (self->_clientZoneIdentifier)
  {
    v18 = objc_msgSend(v16, "dictionaryForKey:");
    id v19 = [v18 objectForKey:v10];

    if (!v19) {
      goto LABEL_18;
    }
LABEL_13:
    v20 = brc_bread_crumbs();
    v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      int v26 = 138412802;
      id v27 = v10;
      __int16 v28 = 2112;
      id v29 = v19;
      __int16 v30 = 2112;
      long long v31 = v20;
      _os_log_debug_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEBUG, "[DEBUG] user default for %@: %@%@", (uint8_t *)&v26, 0x20u);
    }

    goto LABEL_16;
  }
  if (([v10 containsString:@"server-only"] & 1) == 0)
  {
    id v19 = [v17 valueForKey:v10];
    if (v19) {
      goto LABEL_13;
    }
  }
LABEL_18:
  id v19 = v13;
  if (!v13 && v8)
  {
    globalUserDefault = self->_globalUserDefault;
    if (globalUserDefault)
    {
      id v19 = [(BRCUserDefaults *)globalUserDefault objectForKey:v10 inheritFromGlobal:1 validateWithBlock:v12];
      if (v19) {
        goto LABEL_22;
      }
    }
    else
    {
      id v19 = 0;
    }
  }
LABEL_16:
  if (v12)
  {
    uint64_t v22 = v12[2](v12, v19);

    id v19 = (id)v22;
  }
LABEL_22:
  id v24 = v19;

  return v24;
}

uint64_t __40__BRCUserDefaults__serverDefaultForKey___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  return [a2 compare:a3 options:64];
}

- (id)objectForKey:(id)a3 inheritFromGlobal:(BOOL)a4 suiteName:(id)a5 validateWithBlock:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  double v13 = self->_cache;
  objc_sync_enter(v13);
  id v14 = [(NSMutableDictionary *)self->_cache objectForKeyedSubscript:v10];
  if (v14)
  {
    id v15 = [MEMORY[0x1E4F1CA98] null];

    if (v14 == v15) {
      id v16 = 0;
    }
    else {
      id v16 = v14;
    }
    objc_sync_exit(v13);
  }
  else
  {
    v18 = [(BRCUserDefaults *)self _loadObjectForKey:v10 inheritFromGlobal:v8 suiteName:v11 validateWithBlock:v12];
    id v19 = v18;
    if (!v18)
    {
      id v19 = [MEMORY[0x1E4F1CA98] null];
    }
    [(NSMutableDictionary *)self->_cache setObject:v19 forKeyedSubscript:v10];
    if (!v18) {

    }
    objc_sync_exit(v13);
    id v14 = v18;
    id v16 = v14;
  }

  return v16;
}

- (int)intForKey:(id)a3 min:(int)a4 max:(int)a5 byDefault:(int)a6
{
  id v10 = a3;
  if (a4 >= a5)
  {
    id v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaults intForKey:min:max:byDefault:]();
    }
  }
  if (a4 > a6)
  {
    v17 = brc_bread_crumbs();
    v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaults intForKey:min:max:byDefault:]();
    }
  }
  if (a6 > a5)
  {
    id v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaults intForKey:min:max:byDefault:]();
    }
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __47__BRCUserDefaults_intForKey_min_max_byDefault___block_invoke;
  v21[3] = &unk_1E699B220;
  int v23 = a6;
  int v24 = a4;
  int v25 = a5;
  id v22 = v10;
  id v11 = v10;
  id v12 = [(BRCUserDefaults *)self objectForKey:v11 inheritFromGlobal:1 validateWithBlock:v21];
  int v13 = [v12 intValue];

  return v13;
}

id __47__BRCUserDefaults_intForKey_min_max_byDefault___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(unsigned int *)(a1 + 40);
  id v5 = v3;
  unint64_t v6 = 0x1E4F28000uLL;
  if (!v5)
  {
    uint64_t v7 = v4;
LABEL_3:

    uint64_t v4 = v7;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v10 = [v5 intValue];
    if ((int)v10 >= *(_DWORD *)(a1 + 44))
    {
      uint64_t v7 = v10;
      if ((int)v10 <= *(_DWORD *)(a1 + 48)) {
        goto LABEL_3;
      }
    }
  }

  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v15 = *(_DWORD *)(a1 + 44);
    int v14 = *(_DWORD *)(a1 + 48);
    int v16 = *(_DWORD *)(a1 + 40);
    int v17 = 138413570;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    id v20 = v5;
    __int16 v21 = 1024;
    int v22 = v15;
    __int16 v23 = 1024;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = v16;
    __int16 v27 = 2112;
    __int16 v28 = v11;
    _os_log_error_impl(&dword_1D353B000, v12, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@: %@ range:[%d,%d]; using default:%d%@",
      (uint8_t *)&v17,
      0x32u);
  }

  unint64_t v6 = 0x1E4F28000;
LABEL_4:
  BOOL v8 = [*(id *)(v6 + 3792) numberWithInt:v4];

  return v8;
}

- (unsigned)unsignedIntForKey:(id)a3 min:(unsigned int)a4 max:(unsigned int)a5 byDefault:(unsigned int)a6
{
  return [(BRCUserDefaults *)self unsignedIntForKey:a3 inheritFromGlobal:1 min:*(void *)&a4 max:*(void *)&a5 byDefault:*(void *)&a6];
}

- (unsigned)unsignedIntForKey:(id)a3 inheritFromGlobal:(BOOL)a4 min:(unsigned int)a5 max:(unsigned int)a6 byDefault:(unsigned int)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  if (a5 >= a6)
  {
    int v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaults intForKey:min:max:byDefault:]();
    }
  }
  if (a5 > a7)
  {
    __int16 v19 = brc_bread_crumbs();
    id v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaults intForKey:min:max:byDefault:]();
    }
  }
  if (a7 > a6)
  {
    __int16 v21 = brc_bread_crumbs();
    int v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaults intForKey:min:max:byDefault:]();
    }
  }
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = __73__BRCUserDefaults_unsignedIntForKey_inheritFromGlobal_min_max_byDefault___block_invoke;
  v23[3] = &unk_1E699B220;
  unsigned int v25 = a7;
  unsigned int v26 = a5;
  unsigned int v27 = a6;
  id v24 = v12;
  id v13 = v12;
  int v14 = [(BRCUserDefaults *)self objectForKey:v13 inheritFromGlobal:v10 validateWithBlock:v23];
  unsigned int v15 = [v14 unsignedIntValue];

  return v15;
}

id __73__BRCUserDefaults_unsignedIntForKey_inheritFromGlobal_min_max_byDefault___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(unsigned int *)(a1 + 40);
  id v5 = v3;
  unint64_t v6 = 0x1E4F28000uLL;
  if (!v5)
  {
    uint64_t v7 = v4;
LABEL_3:

    uint64_t v4 = v7;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    uint64_t v10 = [v5 intValue];
    if (v10 >= *(_DWORD *)(a1 + 44))
    {
      uint64_t v7 = v10;
      if (v10 <= *(_DWORD *)(a1 + 48)) {
        goto LABEL_3;
      }
    }
  }

  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
  {
    uint64_t v13 = *(void *)(a1 + 32);
    int v15 = *(_DWORD *)(a1 + 44);
    int v14 = *(_DWORD *)(a1 + 48);
    int v16 = *(_DWORD *)(a1 + 40);
    int v17 = 138413570;
    uint64_t v18 = v13;
    __int16 v19 = 2112;
    id v20 = v5;
    __int16 v21 = 1024;
    int v22 = v15;
    __int16 v23 = 1024;
    int v24 = v14;
    __int16 v25 = 1024;
    int v26 = v16;
    __int16 v27 = 2112;
    __int16 v28 = v11;
    _os_log_error_impl(&dword_1D353B000, v12, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@: %@ range:[%d,%d]; using default:%d%@",
      (uint8_t *)&v17,
      0x32u);
  }

  unint64_t v6 = 0x1E4F28000;
LABEL_4:
  BOOL v8 = [*(id *)(v6 + 3792) numberWithUnsignedInt:v4];

  return v8;
}

- (unint64_t)unsignedLongLongForKey:(id)a3 min:(unint64_t)a4 max:(unint64_t)a5 byDefault:(unint64_t)a6
{
  id v10 = a3;
  if (a4 >= a5)
  {
    int v15 = brc_bread_crumbs();
    int v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaults intForKey:min:max:byDefault:]();
    }
  }
  if (a4 > a6)
  {
    int v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaults intForKey:min:max:byDefault:]();
    }
  }
  if (a6 > a5)
  {
    __int16 v19 = brc_bread_crumbs();
    id v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaults intForKey:min:max:byDefault:]();
    }
  }
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  __int16 v23 = __60__BRCUserDefaults_unsignedLongLongForKey_min_max_byDefault___block_invoke;
  int v24 = &unk_1E699B248;
  unint64_t v27 = a4;
  unint64_t v28 = a5;
  id v25 = v10;
  unint64_t v26 = a6;
  id v11 = v10;
  id v12 = [(BRCUserDefaults *)self objectForKey:v11 inheritFromGlobal:1 validateWithBlock:&v21];
  unint64_t v13 = objc_msgSend(v12, "unsignedLongLongValue", v21, v22, v23, v24);

  return v13;
}

id __60__BRCUserDefaults_unsignedLongLongForKey_min_max_byDefault___block_invoke(void *a1, void *a2)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unint64_t v4 = a1[5];
  id v5 = v3;
  unint64_t v6 = 0x1E4F28000uLL;
  if (!v5)
  {
    unint64_t v7 = v4;
LABEL_3:

    unint64_t v4 = v7;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    unint64_t v10 = [v5 longLongValue];
    if (v10 >= a1[6])
    {
      unint64_t v7 = v10;
      if (v10 <= a1[7]) {
        goto LABEL_3;
      }
    }
  }

  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
  {
    uint64_t v13 = a1[6];
    uint64_t v14 = a1[7];
    uint64_t v15 = a1[4];
    uint64_t v16 = a1[5];
    int v17 = 138413570;
    uint64_t v18 = v15;
    __int16 v19 = 2112;
    id v20 = v5;
    __int16 v21 = 2048;
    uint64_t v22 = v13;
    __int16 v23 = 2048;
    uint64_t v24 = v14;
    __int16 v25 = 2048;
    uint64_t v26 = v16;
    __int16 v27 = 2112;
    unint64_t v28 = v11;
    _os_log_error_impl(&dword_1D353B000, v12, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@: %@ range:[%lld,%lld]; using default:%lld%@",
      (uint8_t *)&v17,
      0x3Eu);
  }

  unint64_t v6 = 0x1E4F28000;
LABEL_4:
  BOOL v8 = [*(id *)(v6 + 3792) numberWithUnsignedLongLong:v4];

  return v8;
}

- (float)floatForKey:(id)a3 inheritFromGlobal:(BOOL)a4 min:(float)a5 max:(float)a6 byDefault:(float)a7
{
  BOOL v10 = a4;
  id v12 = a3;
  if (a5 >= a6)
  {
    uint64_t v18 = brc_bread_crumbs();
    __int16 v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaults intForKey:min:max:byDefault:]();
    }
  }
  if (a5 > a7)
  {
    id v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaults intForKey:min:max:byDefault:]();
    }
  }
  if (a7 > a6)
  {
    uint64_t v22 = brc_bread_crumbs();
    __int16 v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[BRCUserDefaults intForKey:min:max:byDefault:]();
    }
  }
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = __67__BRCUserDefaults_floatForKey_inheritFromGlobal_min_max_byDefault___block_invoke;
  v24[3] = &unk_1E699B220;
  float v26 = a7;
  float v27 = a5;
  float v28 = a6;
  id v25 = v12;
  id v13 = v12;
  uint64_t v14 = [(BRCUserDefaults *)self objectForKey:v13 inheritFromGlobal:v10 validateWithBlock:v24];
  [v14 floatValue];
  float v16 = v15;

  return v16;
}

id __67__BRCUserDefaults_floatForKey_inheritFromGlobal_min_max_byDefault___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  float v4 = *(float *)(a1 + 40);
  id v5 = v3;
  unint64_t v6 = 0x1E4F28000uLL;
  if (!v5)
  {
    float v7 = v4;
LABEL_3:

    float v4 = v7;
    goto LABEL_4;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass()))
  {
    [v5 doubleValue];
    float v7 = v11;
    if (*(float *)(a1 + 44) <= v7 && *(float *)(a1 + 48) >= v7) {
      goto LABEL_3;
    }
  }

  id v12 = brc_bread_crumbs();
  id v13 = brc_default_log();
  if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    double v15 = *(float *)(a1 + 44);
    double v16 = *(float *)(a1 + 48);
    double v17 = *(float *)(a1 + 40);
    int v18 = 138413570;
    uint64_t v19 = v14;
    __int16 v20 = 2112;
    id v21 = v5;
    __int16 v22 = 2048;
    double v23 = v15;
    __int16 v24 = 2048;
    double v25 = v16;
    __int16 v26 = 2048;
    double v27 = v17;
    __int16 v28 = 2112;
    uint64_t v29 = v12;
    _os_log_error_impl(&dword_1D353B000, v13, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@: %@ range:[%f,%f]; using default:%f%@",
      (uint8_t *)&v18,
      0x3Eu);
  }

  unint64_t v6 = 0x1E4F28000;
LABEL_4:
  *(float *)&double v8 = v4;
  uint64_t v9 = [*(id *)(v6 + 3792) numberWithFloat:v8];

  return v9;
}

- (float)floatForKey:(id)a3 min:(float)a4 max:(float)a5 byDefault:(float)a6
{
  -[BRCUserDefaults floatForKey:inheritFromGlobal:min:max:byDefault:](self, "floatForKey:inheritFromGlobal:min:max:byDefault:", a3, 1);
  return result;
}

- (id)stringForKey:(id)a3 inheritFromGlobal:(BOOL)a4 byDefault:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __60__BRCUserDefaults_stringForKey_inheritFromGlobal_byDefault___block_invoke;
  v12[3] = &unk_1E699B270;
  id v13 = v8;
  id v9 = v8;
  BOOL v10 = [(BRCUserDefaults *)self objectForKey:a3 inheritFromGlobal:v5 validateWithBlock:v12];

  return v10;
}

id __60__BRCUserDefaults_stringForKey_inheritFromGlobal_byDefault___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  BOOL v5 = v3;
  if ((isKindOfClass & 1) == 0) {
    BOOL v5 = *(void **)(a1 + 32);
  }
  id v6 = v5;

  return v6;
}

- (id)stringForKey:(id)a3 byDefault:(id)a4
{
  return [(BRCUserDefaults *)self stringForKey:a3 inheritFromGlobal:1 byDefault:a4];
}

id __50__BRCUserDefaults_doubleForKey_min_max_byDefault___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  double v12 = *(double *)(a1 + 40);
  if (validateUserDouble(v3, (double *)(a1 + 48), (double *)(a1 + 56), &v12) == 2)
  {
    float v4 = brc_bread_crumbs();
    BOOL v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      uint64_t v8 = *(void *)(a1 + 48);
      uint64_t v9 = *(void *)(a1 + 56);
      uint64_t v10 = *(void *)(a1 + 32);
      uint64_t v11 = *(void *)(a1 + 40);
      *(_DWORD *)buf = 138413570;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v3;
      __int16 v17 = 2048;
      uint64_t v18 = v8;
      __int16 v19 = 2048;
      uint64_t v20 = v9;
      __int16 v21 = 2048;
      uint64_t v22 = v11;
      __int16 v23 = 2112;
      __int16 v24 = v4;
      _os_log_error_impl(&dword_1D353B000, v5, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@: %@ range:[%f,%f]; using default:%f%@",
        buf,
        0x3Eu);
    }
  }
  id v6 = [NSNumber numberWithDouble:v12];

  return v6;
}

- (BOOL)BOOLForKey:(id)a3 byDefault:(BOOL)a4
{
  return [(BRCUserDefaults *)self BOOLForKey:a3 inheritFromGlobal:1 byDefault:a4];
}

- (BOOL)BOOLForKey:(id)a3 inheritFromGlobal:(BOOL)a4 byDefault:(BOOL)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v12 = MEMORY[0x1E4F143A8];
  uint64_t v13 = 3221225472;
  uint64_t v14 = __58__BRCUserDefaults_BOOLForKey_inheritFromGlobal_byDefault___block_invoke;
  __int16 v15 = &unk_1E699B298;
  BOOL v17 = a5;
  id v16 = v8;
  id v9 = v8;
  uint64_t v10 = [(BRCUserDefaults *)self objectForKey:v9 inheritFromGlobal:v6 validateWithBlock:&v12];
  LOBYTE(self) = objc_msgSend(v10, "BOOLValue", v12, v13, v14, v15);

  return (char)self;
}

id __58__BRCUserDefaults_BOOLForKey_inheritFromGlobal_byDefault___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  unsigned __int8 v10 = *(unsigned char *)(a1 + 40);
  if (validateUserBool(v3, &v10) == 2)
  {
    float v4 = brc_bread_crumbs();
    BOOL v5 = brc_default_log();
    if (os_log_type_enabled(v5, (os_log_type_t)0x90u))
    {
      uint64_t v8 = *(void *)(a1 + 32);
      if (*(unsigned char *)(a1 + 40)) {
        id v9 = "YES";
      }
      else {
        id v9 = "NO";
      }
      *(_DWORD *)buf = 138413058;
      uint64_t v12 = v8;
      __int16 v13 = 2112;
      id v14 = v3;
      __int16 v15 = 2080;
      id v16 = v9;
      __int16 v17 = 2112;
      uint64_t v18 = v4;
      _os_log_error_impl(&dword_1D353B000, v5, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@: %@; using default:%s%@",
        buf,
        0x2Au);
    }
  }
  BOOL v6 = [NSNumber numberWithBool:v10];

  return v6;
}

- (id)indexSetForKey:(id)a3 byDefault:(id)a4
{
  return [(BRCUserDefaults *)self indexSetForKey:a3 inheritFromGlobal:1 byDefault:a4];
}

- (id)indexSetForKey:(id)a3 inheritFromGlobal:(BOOL)a4 byDefault:(id)a5
{
  BOOL v5 = a4;
  id v8 = a5;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __62__BRCUserDefaults_indexSetForKey_inheritFromGlobal_byDefault___block_invoke;
  v12[3] = &unk_1E699B270;
  id v13 = v8;
  id v9 = v8;
  unsigned __int8 v10 = [(BRCUserDefaults *)self objectForKey:a3 inheritFromGlobal:v5 validateWithBlock:v12];

  return v10;
}

id __62__BRCUserDefaults_indexSetForKey_inheritFromGlobal_byDefault___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0
    || (objc_msgSend(v3, "br_decodeIndexStringToIndexSet"), (id v4 = (id)objc_claimAutoreleasedReturnValue()) == 0))
  {
    id v4 = *(id *)(a1 + 32);
  }

  return v4;
}

- (id)xpcActivityDictionaryForKey:(id)a3 byDefault:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __57__BRCUserDefaults_xpcActivityDictionaryForKey_byDefault___block_invoke;
  v12[3] = &unk_1E699B2C0;
  id v13 = v7;
  id v14 = v6;
  id v8 = v6;
  id v9 = v7;
  unsigned __int8 v10 = [(BRCUserDefaults *)self objectForKey:v8 inheritFromGlobal:1 validateWithBlock:v12];

  return v10;
}

id __57__BRCUserDefaults_xpcActivityDictionaryForKey_byDefault___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(a1 + 32)];
  BOOL v5 = (void *)v4;
  if (!v3)
  {
    id v9 = 0;
    goto LABEL_38;
  }
  uint64_t v51 = a1;
  v52 = (void *)v4;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  v73[0] = @"interval";
  v73[1] = @"delay";
  v73[2] = @"grace";
  id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v73 count:3];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v58 objects:v74 count:16];
  if (!v7)
  {
    id v9 = 0;
    goto LABEL_17;
  }
  uint64_t v8 = v7;
  id v9 = 0;
  uint64_t v10 = *(void *)v59;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v59 != v10) {
        objc_enumerationMutation(v6);
      }
      uint64_t v12 = *(void **)(*((void *)&v58 + 1) + 8 * i);
      *(void *)buf = 0;
      uint64_t v57 = 0x403E000000000000;
      id v13 = [v3 objectForKeyedSubscript:v12];
      int v14 = validateUserDouble(v13, (double *)&v57, 0, (double *)buf);

      if (v14 == 2)
      {
        __int16 v15 = v9;
        id v9 = v12;
      }
      else
      {
        if (v14 != 1) {
          continue;
        }
        __int16 v15 = [NSNumber numberWithDouble:*(double *)buf];
        [v52 setObject:v15 forKeyedSubscript:v12];
      }
    }
    uint64_t v8 = [v6 countByEnumeratingWithState:&v58 objects:v74 count:16];
  }
  while (v8);
LABEL_17:

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  v71[0] = @"repeat";
  v71[1] = @"powernap";
  v71[2] = @"battery";
  v71[3] = @"screen.sleep";
  v71[4] = @"disk-intensive";
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v71 count:5];
  uint64_t v17 = [v16 countByEnumeratingWithState:&v53 objects:v72 count:16];
  if (!v17)
  {
    BOOL v5 = v52;
    goto LABEL_31;
  }
  uint64_t v18 = v17;
  uint64_t v19 = *(void *)v54;
  BOOL v5 = v52;
  while (2)
  {
    uint64_t v20 = 0;
    while (2)
    {
      if (*(void *)v54 != v19) {
        objc_enumerationMutation(v16);
      }
      __int16 v21 = *(void **)(*((void *)&v53 + 1) + 8 * v20);
      buf[0] = 0;
      uint64_t v22 = [v3 objectForKeyedSubscript:v21];
      int v23 = validateUserBool(v22, buf);

      if (v23 == 2)
      {
        __int16 v24 = v9;
        id v9 = v21;
LABEL_26:
      }
      else if (v23 == 1)
      {
        __int16 v24 = [NSNumber numberWithBool:buf[0]];
        [v52 setObject:v24 forKeyedSubscript:v21];
        goto LABEL_26;
      }
      if (v18 != ++v20) {
        continue;
      }
      break;
    }
    uint64_t v18 = [v16 countByEnumeratingWithState:&v53 objects:v72 count:16];
    if (v18) {
      continue;
    }
    break;
  }
LABEL_31:

  uint64_t v25 = (void *)MEMORY[0x1E4F1CAD0];
  __int16 v26 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142D0]];
  double v27 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142E0]];
  __int16 v28 = objc_msgSend(v25, "setWithObjects:", v26, v27, 0);

  id v29 = [v3 objectForKeyedSubscript:@"priority"];
  id v30 = v28;
  long long v31 = v30;
  if (!v29)
  {

    goto LABEL_33;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || v31 && ![v31 containsObject:v29])
  {

    id v29 = 0;
    id v9 = @"priority";
    goto LABEL_34;
  }
  id v50 = v29;

  [v5 setObject:v50 forKeyedSubscript:@"priority"];
LABEL_33:
  if (v9)
  {
LABEL_34:
    uint64_t v32 = brc_bread_crumbs();
    v33 = brc_default_log();
    if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
    {
      uint64_t v49 = *(void *)(v51 + 32);
      uint64_t v48 = *(void *)(v51 + 40);
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v48;
      __int16 v63 = 2112;
      v64 = v9;
      __int16 v65 = 2112;
      id v66 = v3;
      __int16 v67 = 2112;
      uint64_t v68 = v49;
      __int16 v69 = 2112;
      v70 = v32;
      _os_log_error_impl(&dword_1D353B000, v33, (os_log_type_t)0x90u, "[ERROR] invalid user default for %@.%@: %@; using default:%@%@",
        buf,
        0x34u);
    }

    uint64_t v34 = [MEMORY[0x1E4F1CA60] dictionaryWithDictionary:*(void *)(v51 + 32)];

    BOOL v5 = (void *)v34;
  }

LABEL_38:
  xpc_object_t v35 = xpc_dictionary_create(0, 0, 0);
  v36 = [v5 objectForKeyedSubscript:@"interval"];
  v37 = v36;
  if (v36) {
    xpc_dictionary_set_int64(v35, (const char *)*MEMORY[0x1E4F141C8], [v36 longLongValue]);
  }
  uint64_t v38 = [v5 objectForKeyedSubscript:@"delay"];

  if (v38) {
    xpc_dictionary_set_int64(v35, (const char *)*MEMORY[0x1E4F14170], [v38 longLongValue]);
  }
  v39 = [v5 objectForKeyedSubscript:@"grace"];

  if (v39) {
    xpc_dictionary_set_int64(v35, (const char *)*MEMORY[0x1E4F141A8], [v39 longLongValue]);
  }
  v40 = [v5 objectForKeyedSubscript:@"repeat"];

  if (v40) {
    xpc_dictionary_set_BOOL(v35, (const char *)*MEMORY[0x1E4F142F8], [v40 BOOLValue]);
  }
  v41 = [v5 objectForKeyedSubscript:@"priority"];

  if (v41) {
    xpc_dictionary_set_string(v35, (const char *)*MEMORY[0x1E4F142C8], (const char *)[v41 UTF8String]);
  }
  v42 = [v5 objectForKeyedSubscript:@"battery"];

  if (v42) {
    xpc_dictionary_set_BOOL(v35, (const char *)*MEMORY[0x1E4F14138], [v42 BOOLValue]);
  }
  v43 = [v5 objectForKeyedSubscript:@"powernap"];

  if (v43) {
    xpc_dictionary_set_BOOL(v35, (const char *)*MEMORY[0x1E4F142B0], [v43 BOOLValue]);
  }
  v44 = [v5 objectForKeyedSubscript:@"screen.sleep"];

  if (v44) {
    xpc_dictionary_set_BOOL(v35, (const char *)*MEMORY[0x1E4F14340], [v44 BOOLValue]);
  }
  v45 = [v5 objectForKeyedSubscript:@"disk-intensive"];

  if (v45) {
    xpc_dictionary_set_BOOL(v35, (const char *)*MEMORY[0x1E4F14188], [v45 BOOLValue]);
  }
  v46 = [v5 objectForKeyedSubscript:@"may.reboot"];

  if (v46) {
    xpc_dictionary_set_BOOL(v35, (const char *)*MEMORY[0x1E4F14248], [v46 BOOLValue]);
  }

  return v35;
}

- (unint64_t)maxXattrBlobSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"fs.xattr-max-size" min:0 max:-1 byDefault:0x8000];
}

- (unint64_t)maxPreservedXattrBlobSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"fs.preserved-xattr-max-size" min:0 max:-1 byDefault:0x8000];
}

- (BOOL)shouldFetchAllChanges
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.down.fetch-all-changes" byDefault:1];
}

- (unsigned)maxRecordCountInFetchRecordsOperation
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"sync.down.batchsize" min:1 max:1000000 byDefault:200];
}

- (unsigned)maxRecordCountInModifyRecordsOperation
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"sync.up.batchsize" min:1 max:1000000 byDefault:200];
}

- (unsigned)maxRecordCountWhenListingDirChanges
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"list-dir.batchsize" min:1 max:1000000 byDefault:64];
}

- (unint64_t)listDirChangesCancelDelay
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"list-dir.cancel-delay" min:0 max:-1 byDefault:10000000000];
}

- (unint64_t)rescheduleItemsRecursivelyBatchSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"applyscheduler.rescheduleItemsRecursively.batchsize" min:0 max:-1 byDefault:200];
}

- (float)modifyRecordsCountMultiplicativeDecrease
{
  LODWORD(v2) = 1.0;
  LODWORD(v3) = 0.5;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.batchsize.decrease.factor" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (float)modifyRecordsCountAdditiveIncreaseFraction
{
  unsigned int v3 = [(BRCUserDefaults *)self maxRecordCountInModifyRecordsOperation];
  unsigned int v4 = [(BRCUserDefaults *)self unsignedIntForKey:@"sync.up.batchsize.increase" min:1 max:100 byDefault:10];
  if (v3) {
    return (float)v4 / (float)v3;
  }
  else {
    return 0.000001;
  }
}

- (unsigned)maxRecordCountInClientZoneModifyRecordsOperation
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"sync.appcontainers.batchsize" min:1 max:1000000 byDefault:10];
}

- (unsigned)maxRecordCountInQuerySharedRecordsOperation
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"sync.down.sharequerysize" min:1 max:1000000 byDefault:200];
}

- (unsigned)maxRelativePathDepth
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"fs.maxdepth" min:1 max:10000 byDefault:80];
}

- (unsigned)maxSyncPathDepth
{
  [(BRCUserDefaults *)self maxRelativePathDepth];
  return -[BRCUserDefaults unsignedIntForKey:min:max:byDefault:](self, "unsignedIntForKey:min:max:byDefault:", @"sync.maxdepth");
}

- (unsigned)treeEnumeratorBatchSize
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"container.local.treeEnumerator" min:4 max:0x7FFFFFFFLL byDefault:100];
}

- (id)_extensionSetForKey:(id)a3 startingWithExtensions:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __62__BRCUserDefaults__extensionSetForKey_startingWithExtensions___block_invoke;
  v10[3] = &unk_1E699B270;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [(BRCUserDefaults *)self objectForKey:a3 inheritFromGlobal:1 validateWithBlock:v10];

  return v8;
}

id __62__BRCUserDefaults__extensionSetForKey_startingWithExtensions___block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3 = _stringSetFromDefaultValue(a2, 1);
  [v3 addObjectsFromArray:*(void *)(a1 + 32)];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA80] setWithArray:*(void *)(a1 + 32)];
  }
  BOOL v5 = v4;

  return v5;
}

- (id)_UTISetFor:(id)a3 startingWithExtensions:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __53__BRCUserDefaults__UTISetFor_startingWithExtensions___block_invoke;
  v10[3] = &unk_1E699B270;
  id v11 = v6;
  id v7 = v6;
  uint64_t v8 = [(BRCUserDefaults *)self objectForKey:a3 inheritFromGlobal:1 validateWithBlock:v10];

  return v8;
}

id __53__BRCUserDefaults__UTISetFor_startingWithExtensions___block_invoke(uint64_t a1, void *a2)
{
  unsigned int v3 = _stringSetFromDefaultValue(a2, 0);
  [v3 addObjectsFromArray:*(void *)(a1 + 32)];
  if (v3)
  {
    id v4 = v3;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F1CA80] setWithArray:*(void *)(a1 + 32)];
  }
  BOOL v5 = v4;

  return v5;
}

- (NSSet)packageExtensions
{
  return (NSSet *)[(BRCUserDefaults *)self _extensionSetForKey:@"fs.pkg.extensions" startingWithExtensions:&unk_1F2B277F8];
}

- (NSSet)blacklistedPackageExtensions
{
  return (NSSet *)[(BRCUserDefaults *)self _extensionSetForKey:@"fs.pkg.blacklist.extensions" startingWithExtensions:&unk_1F2B27810];
}

- (NSSet)iworkShareableExtensions
{
  unsigned int v3 = [MEMORY[0x1E4F59560] iWorkShareableExtensions];
  id v4 = [(BRCUserDefaults *)self _extensionSetForKey:@"fs.shareable.iwork.extensions" startingWithExtensions:v3];

  return (NSSet *)v4;
}

- (BOOL)shouldFixupBundleBitOnPackages
{
  return [(BRCUserDefaults *)self BOOLForKey:@"fs.bundle-bit.should-fixup.ios" byDefault:1];
}

- (NSSet)extensionsSkippingBundleBitFixup
{
  return (NSSet *)[(BRCUserDefaults *)self _extensionSetForKey:@"fs.bundle-bit.fixup.backlist.ios" startingWithExtensions:MEMORY[0x1E4F1CBF0]];
}

- (NSSet)shouldBeGreedyExtensions
{
  return (NSSet *)[(BRCUserDefaults *)self _extensionSetForKey:@"fs.greedy.extensions.ios" startingWithExtensions:MEMORY[0x1E4F1CBF0]];
}

- (NSSet)nonAutoEvictableExtensions
{
  return (NSSet *)[(BRCUserDefaults *)self _extensionSetForKey:@"fs.non-auto-evictable.extensions.ios" startingWithExtensions:MEMORY[0x1E4F1CBF0]];
}

- (NSSet)nonEvictableExtensions
{
  return (NSSet *)[(BRCUserDefaults *)self _extensionSetForKey:@"fs.non-evictable.extensions.ios" startingWithExtensions:MEMORY[0x1E4F1CBF0]];
}

- (NSSet)nonEvictablePathComponents
{
  return (NSSet *)[(BRCUserDefaults *)self _extensionSetForKey:@"fs.non-evictable.path-components.ios" startingWithExtensions:MEMORY[0x1E4F1CBF0]];
}

- (NSSet)nonAutoEvictableUTIs
{
  return (NSSet *)[(BRCUserDefaults *)self _UTISetFor:@"fs.non-auto-evictable.utis.ios" startingWithExtensions:MEMORY[0x1E4F1CBF0]];
}

- (NSSet)autoEvictableUTIs
{
  return (NSSet *)[(BRCUserDefaults *)self _UTISetFor:@"fs.auto-evictable.utis.ios" startingWithExtensions:MEMORY[0x1E4F1CBF0]];
}

- (NSSet)blacklistedThumbnailExtensions
{
  return (NSSet *)[(BRCUserDefaults *)self _extensionSetForKey:@"doc.thumbnail-blacklist.extensions" startingWithExtensions:&unk_1F2B27828];
}

- (unsigned)_umaskForKey:(id)a3
{
  return [(BRCUserDefaults *)self intForKey:a3 min:0 max:63 byDefault:18];
}

- (unsigned)stageFileUmask
{
  return [(BRCUserDefaults *)self _umaskForKey:@"stage.umask.file"];
}

- (unsigned)stageFSRootUmask
{
  return [(BRCUserDefaults *)self intForKey:@"stage.umask.fsroot" min:0 max:63 byDefault:63];
}

- (unsigned)stageDirectoryUmask
{
  return [(BRCUserDefaults *)self _umaskForKey:@"stage.umask.directory"];
}

- (unsigned)stageInPackageDirectoryUmask
{
  return [(BRCUserDefaults *)self _umaskForKey:@"stage.umask.package.directory"];
}

- (unsigned)stageInPackageFileUmask
{
  return [(BRCUserDefaults *)self _umaskForKey:@"stage.umask.package.file"];
}

- (OS_xpc_object)configurationUpdateXPCActivity
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v11[0] = @"interval";
  uint64_t v3 = *MEMORY[0x1E4F141E8];
  id v4 = [NSNumber numberWithLongLong:2 * *MEMORY[0x1E4F141E8]];
  v12[0] = v4;
  v11[1] = @"delay";
  BOOL v5 = [NSNumber numberWithLongLong:v3];
  v12[1] = v5;
  v11[2] = @"grace";
  id v6 = [NSNumber numberWithLongLong:v3];
  v12[2] = v6;
  v12[3] = MEMORY[0x1E4F1CC38];
  v11[3] = @"repeat";
  v11[4] = @"priority";
  id v7 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142D0]];
  v11[5] = @"battery";
  void v12[4] = v7;
  v12[5] = MEMORY[0x1E4F1CC28];
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];
  id v9 = [(BRCUserDefaults *)self xpcActivityDictionaryForKey:@"configuration.automatic.xpc" byDefault:v8];

  return (OS_xpc_object *)v9;
}

- (OS_xpc_object)transmogrifyXPCActivity
{
  v12[6] = *MEMORY[0x1E4F143B8];
  v11[0] = @"interval";
  uint64_t v3 = *MEMORY[0x1E4F141E8];
  id v4 = [NSNumber numberWithLongLong:3 * *MEMORY[0x1E4F141E8]];
  v12[0] = v4;
  v11[1] = @"delay";
  BOOL v5 = [NSNumber numberWithLongLong:v3];
  v12[1] = v5;
  v11[2] = @"grace";
  id v6 = [NSNumber numberWithLongLong:v3];
  v12[2] = v6;
  v12[3] = MEMORY[0x1E4F1CC38];
  v11[3] = @"repeat";
  v11[4] = @"priority";
  id v7 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142D0]];
  v11[5] = @"battery";
  void v12[4] = v7;
  v12[5] = MEMORY[0x1E4F1CC28];
  uint64_t v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:6];
  id v9 = [(BRCUserDefaults *)self xpcActivityDictionaryForKey:@"transmogrify.xpc" byDefault:v8];

  return (OS_xpc_object *)v9;
}

- (NSArray)syncThrottles
{
  return (NSArray *)[(BRCUserDefaults *)self objectForKey:@"sync-throttles" inheritFromGlobal:1 validateWithBlock:&__block_literal_global_1610];
}

id __32__BRCUserDefaults_syncThrottles__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    id v3 = v2;
  }
  else {
    id v3 = 0;
  }

  return v3;
}

- (NSDictionary)appLibraryScanThrottleParams
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B27168;
  v10[1] = &unk_1F2B27180;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B27168;
  v10[3] = &unk_1F2B27198;
  v9[4] = @"forget-after";
  v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B271B0;
  v10[5] = &unk_1F2B271C8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__BRCUserDefaults_appLibraryScanThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(BRCUserDefaults *)self objectForKey:@"fsreader.container.throttle" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __47__BRCUserDefaults_appLibraryScanThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)lostItemThrottleParams
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B271E0;
  v10[1] = &unk_1F2B271F8;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B278A0;
  v10[3] = &unk_1F2B27210;
  v9[4] = @"forget-after";
  v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B271B0;
  v10[5] = &unk_1F2B271C8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__BRCUserDefaults_lostItemThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(BRCUserDefaults *)self objectForKey:@"fsreader.lost.throttle" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __41__BRCUserDefaults_lostItemThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)applyThrottleParams
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B27228;
  v10[1] = &unk_1F2B27240;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B278B0;
  v10[3] = &unk_1F2B27258;
  v9[4] = @"forget-after";
  v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B271B0;
  v10[5] = &unk_1F2B271C8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __38__BRCUserDefaults_applyThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(BRCUserDefaults *)self objectForKey:@"fswriter.apply.throttle" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __38__BRCUserDefaults_applyThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)downloadThrottleParams
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B27228;
  v10[1] = &unk_1F2B27240;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B278B0;
  v10[3] = &unk_1F2B27258;
  v9[4] = @"forget-after";
  v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B271C8;
  v10[5] = &unk_1F2B271C8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __41__BRCUserDefaults_downloadThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(BRCUserDefaults *)self objectForKey:@"transfer.download.throttle" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __41__BRCUserDefaults_downloadThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)uploadThrottleParams
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B27270;
  v10[1] = &unk_1F2B27240;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B278B0;
  v10[3] = &unk_1F2B27288;
  v9[4] = @"forget-after";
  v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B271B0;
  v10[5] = &unk_1F2B271C8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__BRCUserDefaults_uploadThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(BRCUserDefaults *)self objectForKey:@"transfer.upload.throttle" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __39__BRCUserDefaults_uploadThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)uploadFileModifiedThrottleParams
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B27168;
  v10[1] = &unk_1F2B271B0;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B272A0;
  v10[3] = &unk_1F2B272B8;
  v9[4] = @"forget-after";
  v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B271B0;
  v10[5] = &unk_1F2B271C8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__BRCUserDefaults_uploadFileModifiedThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(BRCUserDefaults *)self objectForKey:@"transfer.upload.file-modified.throttle" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __51__BRCUserDefaults_uploadFileModifiedThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)perItemSyncUpThrottleParams
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B272D0;
  v10[1] = &unk_1F2B272E8;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B27210;
  v10[3] = &unk_1F2B27300;
  v9[4] = @"forget-after";
  v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B27318;
  v10[5] = &unk_1F2B271C8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__BRCUserDefaults_perItemSyncUpThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(BRCUserDefaults *)self objectForKey:@"sync-up.error.per-item.throttle" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __46__BRCUserDefaults_perItemSyncUpThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (unint64_t)availableQuotaComfortSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"quota.available.comfort-size" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:0x40000000];
}

- (double)quotaFetchPacerDelay
{
  [(BRCUserDefaults *)self doubleForKey:@"sync.quota.fetch-delay" min:0.0 max:1.79769313e308 byDefault:30.0];
  return result;
}

- (double)appsFetchPacerDelay
{
  [(BRCUserDefaults *)self doubleForKey:@"apps-fetch-delay" min:0.0 max:1.79769313e308 byDefault:20.0];
  return result;
}

- (double)accountWaiterRefreshPacerDelay
{
  [(BRCUserDefaults *)self doubleForKey:@"account-waiter-refresh-delay" min:0.0 max:1.79769313e308 byDefault:1800.0];
  return result;
}

- (double)accountWaiterErrorRetryBackoff
{
  [(BRCUserDefaults *)self doubleForKey:@"account-waiter-error-retry-backoff" min:0.0 max:1.79769313e308 byDefault:5.0];
  return result;
}

- (BOOL)skipPerItemSyncUpThrottling
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync-up.per-item.throttling.skip" byDefault:0];
}

- (BOOL)considerSyncUpBatchFailuresAsSuccessForThrottling
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync-up.batch-failures.throttling.skip" byDefault:1];
}

- (NSDictionary)operationFailureThrottleParams
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B27168;
  v10[1] = &unk_1F2B272E8;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B27330;
  v10[3] = &unk_1F2B27300;
  v9[4] = @"forget-after";
  v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B27318;
  v10[5] = &unk_1F2B271C8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __49__BRCUserDefaults_operationFailureThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(BRCUserDefaults *)self objectForKey:@"operation.failure.throttle" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __49__BRCUserDefaults_operationFailureThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)appLibraryResetThrottleParams
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B27348;
  v10[1] = &unk_1F2B27360;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B27330;
  v10[3] = &unk_1F2B271B0;
  v9[4] = @"forget-after";
  v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B27300;
  v10[5] = &unk_1F2B271C8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__BRCUserDefaults_appLibraryResetThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(BRCUserDefaults *)self objectForKey:@"container.reset.throttle" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __48__BRCUserDefaults_appLibraryResetThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)sharedAppLibraryResetThrottleParams
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B272E8;
  v10[1] = &unk_1F2B27378;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B278C0;
  v10[3] = &unk_1F2B27258;
  v9[4] = @"forget-after";
  v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B27300;
  v10[5] = &unk_1F2B271C8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __54__BRCUserDefaults_sharedAppLibraryResetThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(BRCUserDefaults *)self objectForKey:@"shared-container.reset.throttle" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __54__BRCUserDefaults_sharedAppLibraryResetThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSArray)telemetryRTCAllowedZoneNamePrefixes
{
  id v2 = [(BRCUserDefaults *)self stringForKey:@"telemetry.rtc.allowed-zone-name-prefixes" byDefault:@"com.apple.,iCloud.com.apple."];
  id v3 = [v2 componentsSeparatedByString:@","];

  return (NSArray *)v3;
}

- (double)telemetryRTCPacerMinFireInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"telemetry.rtc.min-fire-interval" min:1.0 max:1.79769313e308 byDefault:5.0];
  return result;
}

- (NSDictionary)appLibraryAliasRemovalThrottleParams
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B27168;
  v10[1] = &unk_1F2B272E8;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B27330;
  v10[3] = &unk_1F2B27300;
  v9[4] = @"forget-after";
  v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B27318;
  v10[5] = &unk_1F2B271C8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __55__BRCUserDefaults_appLibraryAliasRemovalThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(BRCUserDefaults *)self objectForKey:@"container.reset.alias-removal.throttle" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __55__BRCUserDefaults_appLibraryAliasRemovalThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (BRCSyncOperationThrottleParams)syncDownThrottle
{
  return (BRCSyncOperationThrottleParams *)[(BRCUserDefaults *)self objectForKey:@"sync.down.throttle" inheritFromGlobal:1 validateWithBlock:&__block_literal_global_1697];
}

BRCSyncOperationThrottleParams *__35__BRCUserDefaults_syncDownThrottle__block_invoke(uint64_t a1, void *a2)
{
  v8[7] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [BRCSyncOperationThrottleParams alloc];
  v7[0] = @"wait-at-least";
  v7[1] = @"wait-at-most";
  v8[0] = &unk_1F2B278D0;
  v8[1] = &unk_1F2B271B0;
  v7[2] = @"success-ratio";
  v7[3] = @"quota-clear-ratio";
  v8[2] = &unk_1F2B278E0;
  v8[3] = &unk_1F2B278F0;
  void v7[4] = @"error-ratio";
  v7[5] = @"kickback-delay";
  v8[4] = &unk_1F2B27168;
  v8[5] = &unk_1F2B272B8;
  v7[6] = @"kickback-ratio";
  v8[6] = &unk_1F2B278C0;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:7];
  BOOL v5 = [(BRCSyncOperationThrottleParams *)v3 initWithParams:v2 defaults:v4];

  return v5;
}

- (BRCSyncOperationThrottleParams)syncUpThrottle
{
  return (BRCSyncOperationThrottleParams *)[(BRCUserDefaults *)self objectForKey:@"sync.up.throttle" inheritFromGlobal:1 validateWithBlock:&__block_literal_global_1709];
}

BRCSyncOperationThrottleParams *__33__BRCUserDefaults_syncUpThrottle__block_invoke(uint64_t a1, void *a2)
{
  v8[7] = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  id v3 = [BRCSyncOperationThrottleParams alloc];
  v7[0] = @"wait-at-least";
  v7[1] = @"wait-at-most";
  v8[0] = &unk_1F2B278D0;
  v8[1] = &unk_1F2B271B0;
  v7[2] = @"success-ratio";
  v7[3] = @"quota-clear-ratio";
  v8[2] = &unk_1F2B278E0;
  v8[3] = &unk_1F2B278F0;
  void v7[4] = @"error-ratio";
  v7[5] = @"kickback-delay";
  v8[4] = &unk_1F2B27168;
  v8[5] = &unk_1F2B272B8;
  v7[6] = @"kickback-ratio";
  v8[6] = &unk_1F2B278C0;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:v7 count:7];
  BOOL v5 = [(BRCSyncOperationThrottleParams *)v3 initWithParams:v2 defaults:v4];

  return v5;
}

- (NSDictionary)syncClientZoneThrottleParams
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B27390;
  v10[1] = &unk_1F2B27240;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B278C0;
  v10[3] = &unk_1F2B27258;
  v9[4] = @"forget-after";
  v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B271B0;
  v10[5] = &unk_1F2B273A8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __47__BRCUserDefaults_syncClientZoneThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(BRCUserDefaults *)self objectForKey:@"sync.container.throttle" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __47__BRCUserDefaults_syncClientZoneThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)syncClientZoneErrorThrottleParams
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B27168;
  v10[1] = &unk_1F2B27240;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B278C0;
  v10[3] = &unk_1F2B27258;
  v9[4] = @"forget-after";
  v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B271B0;
  v10[5] = &unk_1F2B273A8;
  id v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __52__BRCUserDefaults_syncClientZoneErrorThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  BOOL v5 = [(BRCUserDefaults *)self objectForKey:@"sync.container.error.throttle" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __52__BRCUserDefaults_syncClientZoneErrorThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (BOOL)treatPerItemThrottleAsOperationSuccess
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.treat-per-item-throttle-as-success" byDefault:1];
}

- (unint64_t)autoBugCaptureReporterThrottleCapacity
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"auto-bug-capture-reporter.throttle.capacity" min:1 max:0xFFFFFFFFLL byDefault:16];
}

- (double)autoBugCaptureReporterThrottlePeriod
{
  [(BRCUserDefaults *)self doubleForKey:@"auto-bug-capture-reporter.throttle.period" min:1.0 max:1.79769313e308 byDefault:3600.0];
  return result;
}

- (float)syncUpMinimalBudget
{
  LODWORD(v2) = 2139095039;
  LODWORD(v3) = 10.0;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.budget.minimal" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (float)_defaultSyncUpDailyBudget
{
  LODWORD(v2) = 2139095039;
  LODWORD(v3) = 1315859240;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.budget.daily.default" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (float)syncUpDailyBudget
{
  clientZoneIdentifier = self->_clientZoneIdentifier;
  int v6 = 1343554297;
  if (clientZoneIdentifier
    && ![(NSString *)clientZoneIdentifier isEqualToString:*MEMORY[0x1E4F59418]])
  {
    [(BRCUserDefaults *)self _defaultSyncUpDailyBudget];
    int v6 = v7;
  }
  LODWORD(v2) = 2139095039;
  LODWORD(v3) = v6;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.budget.daily" inheritFromGlobal:0 min:0.0 max:v2 byDefault:v3];
  return result;
}

- (float)_defaultSyncUpHourlyBudget
{
  [(BRCUserDefaults *)self _defaultSyncUpDailyBudget];
  LODWORD(v5) = 2139095039;
  *(float *)&double v4 = v3 / 6.0;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.budget.hourly.default" min:0.0 max:v5 byDefault:v4];
  return result;
}

- (float)syncUpHourlyBudget
{
  clientZoneIdentifier = self->_clientZoneIdentifier;
  if (clientZoneIdentifier
    && ![(NSString *)clientZoneIdentifier isEqualToString:*MEMORY[0x1E4F59418]])
  {
    [(BRCUserDefaults *)self _defaultSyncUpHourlyBudget];
    LODWORD(v6) = v7;
  }
  else
  {
    [(BRCUserDefaults *)self syncUpDailyBudget];
    *(float *)&double v6 = v5 / 6.0;
  }
  LODWORD(v4) = 2139095039;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.budget.hourly" inheritFromGlobal:0 min:0.0 max:v4 byDefault:v6];
  return result;
}

- (float)_defaultSyncUpMinutelyBudget
{
  [(BRCUserDefaults *)self _defaultSyncUpHourlyBudget];
  LODWORD(v5) = 2139095039;
  *(float *)&double v4 = v3 / 5.0;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.budget.minutely.default" min:0.0 max:v5 byDefault:v4];
  return result;
}

- (float)syncUpMinutelyBudget
{
  clientZoneIdentifier = self->_clientZoneIdentifier;
  if (clientZoneIdentifier
    && ![(NSString *)clientZoneIdentifier isEqualToString:*MEMORY[0x1E4F59418]])
  {
    [(BRCUserDefaults *)self _defaultSyncUpMinutelyBudget];
    LODWORD(v6) = v7;
  }
  else
  {
    [(BRCUserDefaults *)self syncUpHourlyBudget];
    *(float *)&double v6 = v5 / 6.0;
  }
  LODWORD(v4) = 2139095039;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.budget.minutely" inheritFromGlobal:0 min:0.0 max:v4 byDefault:v6];
  return result;
}

- (float)syncUpInitialItemCost
{
  LODWORD(v2) = 2139095039;
  LODWORD(v3) = 1036831949;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.cost.initial-item" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (float)syncUpStructureCreateCost
{
  LODWORD(v2) = 2139095039;
  LODWORD(v3) = 1.0;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.cost.structure.create" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (float)syncUpStructureEditCost
{
  LODWORD(v2) = 2139095039;
  LODWORD(v3) = 1.0;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.cost.structure.edit" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (float)syncUpStructureDeleteCost
{
  LODWORD(v2) = 2139095039;
  LODWORD(v3) = 1.0;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.cost.structure.delete" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (float)syncUpDataCreateCost
{
  LODWORD(v2) = 2139095039;
  LODWORD(v3) = 2.0;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.cost.data.create" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (float)syncUpDataEditCost
{
  LODWORD(v2) = 2139095039;
  LODWORD(v3) = 2.0;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.cost.data.edit" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (float)syncUpDataDeleteCost
{
  LODWORD(v2) = 2139095039;
  LODWORD(v3) = 2.0;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.cost.data.delete" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (float)syncUpDocumentCreateCost
{
  LODWORD(v2) = 2139095039;
  LODWORD(v3) = 0.5;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.cost.document.create" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (float)syncUpDocumentEditCost
{
  LODWORD(v2) = 2139095039;
  LODWORD(v3) = 2.0;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.cost.document.edit" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (float)syncUpDocumentDeleteCost
{
  LODWORD(v2) = 2139095039;
  LODWORD(v3) = 1.0;
  [(BRCUserDefaults *)self floatForKey:@"sync.up.cost.document.delete" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (unint64_t)sharedDbSyncDownCoalesceNanoseconds
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"sync.down.shared.coalesce.nanoseconds" min:0 max:-1 byDefault:30000000000];
}

- (NSDictionary)readerThrottleParams
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B273C0;
  v10[1] = &unk_1F2B27180;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B272A0;
  v10[3] = &unk_1F2B273D8;
  v9[4] = @"forget-after";
  v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B27210;
  v10[5] = &unk_1F2B273A8;
  double v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __39__BRCUserDefaults_readerThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  float v5 = [(BRCUserDefaults *)self objectForKey:@"fsreader.coordination.throttle" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __39__BRCUserDefaults_readerThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (BOOL)dbTraced
{
  return [(BRCUserDefaults *)self BOOLForKey:@"db.trace" byDefault:1];
}

- (BOOL)dbProfiled
{
  return [(BRCUserDefaults *)self BOOLForKey:@"db.profile" byDefault:0];
}

- (BOOL)dbVerboseProfiled
{
  return [(BRCUserDefaults *)self BOOLForKey:@"db.verbose.profile" byDefault:0];
}

- (int)dbBatchSize
{
  return [(BRCUserDefaults *)self intForKey:@"db.batch-size" min:1 max:1000000000 byDefault:10000];
}

- (double)dbBatchDelay
{
  [(BRCUserDefaults *)self doubleForKey:@"db.batch-delay" min:0.01 max:30.0 byDefault:0.5];
  return result;
}

- (BOOL)allowReadOnlyDBInIPC
{
  return [(BRCUserDefaults *)self BOOLForKey:@"db.allow-read-only-in-ipc" byDefault:1];
}

- (int64_t)dbAutovacuumBatchSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"db.autovacuum-batch-size" min:0x40000 max:0x7FFFFFFFFFFFFFFFLL byDefault:10485760];
}

- (float)dbAutovacuumRatio
{
  LODWORD(v2) = 1120403456;
  LODWORD(v3) = 20.0;
  [(BRCUserDefaults *)self floatForKey:@"db.autovacuum-ratio" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (BOOL)skipServerSideThrottling
{
  return [(BRCUserDefaults *)self BOOLForKey:@"server.throttling.disable" inheritFromGlobal:1 byDefault:0];
}

- (BOOL)shouldAppLibraryBeGreedy
{
  BOOL v3 = [(NSString *)self->_clientZoneIdentifier isEqualToString:*MEMORY[0x1E4F59398]];
  return [(BRCUserDefaults *)self BOOLForKey:@"container.greedy" inheritFromGlobal:v3 ^ 1 byDefault:v3];
}

- (BOOL)shouldSessionBeGreedy
{
  return [(BRCUserDefaults *)self BOOLForKey:@"session.should-be-greedy.ios" byDefault:0];
}

- (unint64_t)maxTotalFilesCount
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"max-file-count" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:500000];
}

- (unint64_t)maxNumberOfFilesInAFolder
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"max-file-count.per-folder" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:500000];
}

- (int64_t)uploadMaxFileSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"upload.max-file-size" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:0x1900000000];
}

- (int64_t)uploadMaxInPkgFileSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"upload.max-in-pkg-file-size" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:0x1900000000];
}

- (int64_t)uploadMaxPkgFileSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"upload.max-pkg-file-size" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:0x3200000000];
}

- (unint64_t)uploadBatchRecordsCount
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"upload.batch.records.count" min:0 max:0xFFFFFFFFLL byDefault:200];
}

- (unint64_t)uploadBatchCount
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"upload.batch.count" min:0 max:0xFFFFFFFFLL byDefault:2];
}

- (unint64_t)downloadBatchRecordsCount
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"download.batch.records.count" min:0 max:0xFFFFFFFFLL byDefault:200];
}

- (unint64_t)downloadBatchCount
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"download.batch.count" min:0 max:0xFFFFFFFFLL byDefault:2];
}

- (unint64_t)downloadWillRetryProgressMaxCount
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"download.will-retry-progress.max-count" min:0 max:0xFFFFFFFFLL byDefault:200];
}

- (unint64_t)zoneHealthSyncDownBatchRecordsCount
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"zone-health.sync-down.batch.count" min:0 max:0xFFFFFFFFLL byDefault:200];
}

- (unint64_t)sharedDBSyncDownBatchRecordsCount
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"shared-db.sync-down.batch.count" min:0 max:0xFFFFFFFFLL byDefault:200];
}

- (double)systemReachabilityStableStateMinThreshold
{
  [(BRCUserDefaults *)self doubleForKey:@"system.reachability.stable-state-min-threshold" min:0.001 max:300.0 byDefault:60.0];
  return result;
}

- (double)systemReachabilityMinDelay
{
  [(BRCUserDefaults *)self doubleForKey:@"system.reachability.min-delay" min:0.001 max:172800.0 byDefault:1.0];
  return result;
}

- (double)systemReachabilityMaxDelay
{
  [(BRCUserDefaults *)self doubleForKey:@"system.reachability.max-delay" min:0.001 max:172800.0 byDefault:5.0];
  return result;
}

- (double)systemLowDiskLatency
{
  [(BRCUserDefaults *)self doubleForKey:@"system.lowdisk" min:0.001 max:172800.0 byDefault:5.0];
  return result;
}

- (double)readerIOsCancelDelay
{
  [(BRCUserDefaults *)self doubleForKey:@"fsreader.coordination.delay" min:0.0 max:600.0 byDefault:10.0];
  return result;
}

- (double)writerIOsCancelDelay
{
  [(BRCUserDefaults *)self doubleForKey:@"fswriter.coordination.delay" min:0.0 max:600.0 byDefault:10.0];
  return result;
}

- (int)readerMaxConcurrentIOs
{
  return [(BRCUserDefaults *)self intForKey:@"fsreader.coordination.count" min:32 max:100000 byDefault:128];
}

- (int)writerMaxConcurrentIOs
{
  return [(BRCUserDefaults *)self intForKey:@"fswriter.coordination.count" min:32 max:100000 byDefault:128];
}

- (int)readerScanBatchSize
{
  return [(BRCUserDefaults *)self intForKey:@"fsreader.scan.batch-size" min:1 max:100000 byDefault:20];
}

- (int)fpfsMigrationCleanupBatchSize
{
  return [(BRCUserDefaults *)self intForKey:@"fpfs-migration-cleanup-batch-size" min:1 max:100000 byDefault:20];
}

- (double)readerPackageProcessingDelay
{
  [(BRCUserDefaults *)self doubleForKey:@"fsreader.scan.package-delay" min:0.0 max:86400.0 byDefault:1.0];
  return result;
}

- (unsigned)applySchedulerJobMaxRetriesBeforeAssert
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"applyscheduler.job-max-retries-before-assert" min:0 max:0xFFFFFFFFLL byDefault:20];
}

- (int)writerApplyBatchSize
{
  return [(BRCUserDefaults *)self intForKey:@"fswriter.apply.batch-size" min:1 max:100000 byDefault:20];
}

- (double)readerLostItemBackoff
{
  [(BRCUserDefaults *)self doubleForKey:@"fsreader.lost.backoff" min:0.001 max:432000.0 byDefault:3.0];
  return result;
}

- (double)markChildLostBackoff
{
  [(BRCUserDefaults *)self doubleForKey:@"fsreader.lost-child.backoff" min:0.001 max:432000.0 byDefault:0.001];
  return result;
}

- (double)fseventsLatency
{
  [(BRCUserDefaults *)self doubleForKey:@"fsevents.latency" min:0.01 max:60.0 byDefault:0.5];
  return result;
}

- (double)fseventsResetBackoff
{
  [(BRCUserDefaults *)self doubleForKey:@"fsevents.reset-backoff" min:0.02 max:600.0 byDefault:10.0];
  return result;
}

- (unint64_t)fseventQueueBufferSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"fsevents.queue-buffer-size" min:1 max:-1 byDefault:200];
}

- (unint64_t)fseventProcessBatchSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"fsevents.process-batch-size" min:1 max:-1 byDefault:50];
}

- (int)transferQueueMinBatchSize
{
  return [(BRCUserDefaults *)self intForKey:@"transfer.batch-size.min" min:0 max:1000000 byDefault:16];
}

- (int)transferQueueMinConcurrentOperations
{
  return [(BRCUserDefaults *)self intForKey:@"transfer.width.min" min:0 max:1000000 byDefault:16];
}

- (int)transferQueueMaxConcurrentOperations
{
  return [(BRCUserDefaults *)self intForKey:@"transfer.width.max" min:0 max:1000000 byDefault:200];
}

- (double)transferQueueTransferBudget
{
  [(BRCUserDefaults *)self doubleForKey:@"transfer.budget" min:0.0 max:INFINITY byDefault:33554432.0];
  return result;
}

- (BOOL)sessionZombiesEnabled
{
  return [(BRCUserDefaults *)self BOOLForKey:@"account.debug.zombie.enable" byDefault:0];
}

- (BOOL)nsurlsessiondEnabled
{
  return [(BRCUserDefaults *)self BOOLForKey:@"nsurlsessiond" byDefault:1];
}

- (OS_xpc_object)stageGCXPCActivity
{
  v12[5] = *MEMORY[0x1E4F143B8];
  v11[0] = @"interval";
  uint64_t v3 = *MEMORY[0x1E4F141F8];
  id v4 = [NSNumber numberWithLongLong:*MEMORY[0x1E4F141F8]];
  v12[0] = v4;
  v11[1] = @"delay";
  float v5 = [NSNumber numberWithLongLong:*MEMORY[0x1E4F14210]];
  v12[1] = v5;
  v11[2] = @"grace";
  double v6 = [NSNumber numberWithLongLong:v3];
  v12[2] = v6;
  v12[3] = MEMORY[0x1E4F1CC38];
  v11[3] = @"repeat";
  v11[4] = @"priority";
  int v7 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142D0]];
  void v12[4] = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v12 forKeys:v11 count:5];
  id v9 = [(BRCUserDefaults *)self xpcActivityDictionaryForKey:@"stage.gc.xpc" byDefault:v8];

  return (OS_xpc_object *)v9;
}

- (OS_xpc_object)cacheDeletePushXPCActivity
{
  v11[7] = *MEMORY[0x1E4F143B8];
  v10[0] = @"delay";
  uint64_t v3 = *MEMORY[0x1E4F14218];
  id v4 = [NSNumber numberWithLongLong:*MEMORY[0x1E4F14218]];
  v11[0] = v4;
  v10[1] = @"grace";
  float v5 = [NSNumber numberWithLongLong:v3];
  v10[2] = @"repeat";
  v10[3] = @"screen.sleep";
  v11[1] = v5;
  v11[2] = MEMORY[0x1E4F1CC38];
  v11[3] = MEMORY[0x1E4F1CC38];
  v11[4] = MEMORY[0x1E4F1CC38];
  void v10[4] = @"powernap";
  v10[5] = @"battery";
  void v11[5] = MEMORY[0x1E4F1CC28];
  v10[6] = @"priority";
  double v6 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142D0]];
  void v11[6] = v6;
  int v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v11 forKeys:v10 count:7];
  id v8 = [(BRCUserDefaults *)self xpcActivityDictionaryForKey:@"cachedelete-push.xpc" byDefault:v7];

  return (OS_xpc_object *)v8;
}

- (NSString)serverConfigurationURL
{
  return (NSString *)[(BRCUserDefaults *)self objectForKey:@"server-config-url" inheritFromGlobal:1 validateWithBlock:&__block_literal_global_1875];
}

__CFString *__41__BRCUserDefaults_serverConfigurationURL__block_invoke(uint64_t a1, void *a2)
{
  double v2 = a2;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {

    double v2 = @"https://configuration.apple.com/configurations/internetservices/cloudkit/clouddocs/clouddocs-1.0.plist";
  }
  return v2;
}

- (unsigned)publishURLTimeout
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"url.publish-timeout" min:0 max:0xFFFFFFFFLL byDefault:2592000];
}

- (int64_t)minFileSizeForGraveyard
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"min-file-size-graveyard" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:4096];
}

- (int64_t)minAutomaticallyEvictableFilesize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"min-evictable-size.auto.ios" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:4096];
}

- (unsigned)logoutTimeout
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"logout-timeout" min:0 max:0xFFFFFFFFLL byDefault:60];
}

- (double)foregroundGracePeriod
{
  [(BRCUserDefaults *)self doubleForKey:@"foreground-grace-period" min:0.0 max:1.79769313e308 byDefault:120.0];
  return result;
}

- (double)forceForegroundGracePeriod
{
  [(BRCUserDefaults *)self doubleForKey:@"force-foreground-grace-period" min:0.0 max:1.79769313e308 byDefault:300.0];
  return result;
}

- (BOOL)forceBatchFailureWhenReceivingAssetTokenExpiration
{
  return [(BRCUserDefaults *)self BOOLForKey:@"force-batch-failure-when-token-expires" byDefault:1];
}

- (double)accessTimeDeltaInLowUrgency
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-space-reclaimer.max-access-time.low-urgency" min:0.0 max:1.79769313e308 byDefault:1209600.0];
  return result;
}

- (double)accessTimeDeltaInMedUrgency
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-space-reclaimer.max-access-time.med-urgency" min:0.0 max:1.79769313e308 byDefault:604800.0];
  return result;
}

- (double)accessTimeDeltaInHighUrgency
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-space-reclaimer.max-access-time.high-urgency" min:0.0 max:1.79769313e308 byDefault:600.0];
  return result;
}

- (double)accessTimeDeltaInVeryHighUrgency
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-space-reclaimer.max-access-time.very-high-urgency" min:0.0 max:1.79769313e308 byDefault:0.0];
  return result;
}

- (double)defaultTimeDeltaForEviction
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-space-reclaimer.eviction.default-access-time" min:0.0 max:1.79769313e308 byDefault:1209600.0];
  return result;
}

- (double)onDiskAccessTimeDeltaInLowUrgency
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-space-reclaimer.max-ondisk-access-time.low-urgency" min:0.0 max:1.79769313e308 byDefault:172800.0];
  return result;
}

- (double)onDiskAccessTimeDeltaInMedUrgency
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-space-reclaimer.max-ondisk-access-time.med-urgency" min:0.0 max:1.79769313e308 byDefault:28800.0];
  return result;
}

- (double)onDiskAccessTimeDeltaInHighUrgency
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-space-reclaimer.max-ondisk-access-time.high-urgency" min:0.0 max:1.79769313e308 byDefault:600.0];
  return result;
}

- (double)onDiskAccessTimeDeltaInVeryHighUrgency
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-space-reclaimer.max-ondisk-access-time.very-high-urgency" min:0.0 max:1.79769313e308 byDefault:0.0];
  return result;
}

- (double)defaultOnDiskAccessTimeDefaultForEviction
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-space-reclaimer.eviction.default-ondisk-access-time" min:0.0 max:1.79769313e308 byDefault:1209600.0];
  return result;
}

- (double)graveyardAgeDeltaInLowUrgency
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-space-reclaimer.max-graveyard-time.low-urgency" min:0.0 max:1.79769313e308 byDefault:259200.0];
  return result;
}

- (double)graveyardAgeDeltaInMedUrgency
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-space-reclaimer.max-graveyard-time.med-urgency" min:0.0 max:1.79769313e308 byDefault:86400.0];
  return result;
}

- (double)xattrAgeDelta
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-space-reclaimer.xattr-age-time" min:0.0 max:1.79769313e308 byDefault:86400.0];
  return result;
}

- (double)minFetchQuotaInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"fetch-quota-interval" min:0.0 max:1.79769313e308 byDefault:3600.0];
  return result;
}

- (double)minForceTelemetrySyncInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"fetch-force-telemetry-sync-interval" min:0.0 max:1.79769313e308 byDefault:86400.0];
  return result;
}

- (double)purgePacerInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-reclaimer.purge-pacer-interval" min:0.0 max:1.79769313e308 byDefault:10.0];
  return result;
}

- (int64_t)dbReclaimableSpaceThreshold
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"disk-reclaimer.db-reclaimable-space-threshold" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:0x100000];
}

- (double)cacheDeleteRecomputeInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-reclaimer.cache-delete-recompute-interval" min:0.0 max:1.79769313e308 byDefault:3600.0];
  return result;
}

- (double)maximumDocumentAgeToBeGreedy
{
  [(BRCUserDefaults *)self doubleForKey:@"maximum-document-age-to-be-greedy" min:0.0 max:1.79769313e308 byDefault:7776000.0];
  return result;
}

- (unint64_t)statementCacheMaxCountForServerTruth
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"statement-cache-max-count-server-truth" min:0 max:0xFFFFFFFFLL byDefault:30];
}

- (unint64_t)statementCacheMaxCountForClientTruth
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"statement-cache-max-count-client-truth" min:0 max:0xFFFFFFFFLL byDefault:300];
}

- (unint64_t)copyShareIDsBatchSize
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"copy-share-ids-batch-size" min:1 max:0xFFFFFFFFLL byDefault:20];
}

- (unint64_t)aliasDeletionBatchSize
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"alias-deletion-batch-size" min:1 max:0xFFFFFFFFLL byDefault:20];
}

- (unint64_t)minimumDiskSpaceRequiredToDownload
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"disk-space.minimum-required-to-download.ios" min:1 max:0x7FFFFFFFFFFFFFFFLL byDefault:419430400];
}

- (unint64_t)minimumDiskSpaceRequiredToDownloadUserInitiated
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"disk-space.minimum-required-to-download-user-initiated" min:1 max:0x7FFFFFFFFFFFFFFFLL byDefault:20971520];
}

- (unint64_t)minimumDiskSpaceRequiredToBeGreedy
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"disk-space.minimum-required-to-be-greedy.ios" min:1 max:0x7FFFFFFFFFFFFFFFLL byDefault:0x80000000];
}

- (unint64_t)diskSpaceRequiredToReturnToGreedyState
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"disk-space.required-to-return-to-greedy-state.ios" min:1 max:0x7FFFFFFFFFFFFFFFLL byDefault:0x200000000];
}

- (float)relativeDiskSpaceRequiredToReturnToGreedyState
{
  LODWORD(v2) = 1.0;
  [(BRCUserDefaults *)self floatForKey:@"disk-space.required-to-return-to-greedy-state.relative.ios" min:0.0 max:v2 byDefault:0.0];
  return result;
}

- (unint64_t)maximumAccountSizeToBeAlwaysGreedy
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"account-size.maximum-to-be-always-greedy" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:0x140000000];
}

- (unint64_t)minimumDiskSpaceRequiredToBeFunctional
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"disk-space.minimum-required-to-be-functional" min:1 max:0x7FFFFFFFFFFFFFFFLL byDefault:20971520];
}

- (double)diskSpaceCheckInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-space.check-interval" min:0.0 max:1.79769313e308 byDefault:30.0];
  return result;
}

- (double)activeDownloadSizeRefreshInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"disk-space.active-download-refresh-interval" min:0.0 max:1.79769313e308 byDefault:10.0];
  return result;
}

- (BOOL)shouldDisplayUploadNotification
{
  return [(BRCUserDefaults *)self BOOLForKey:@"user-notification.upload" byDefault:0];
}

- (BOOL)spotlightIndexingEnabled
{
  return [(BRCUserDefaults *)self BOOLForKey:@"spotlight-indexer.enabled" byDefault:1];
}

- (double)recentsEnumeratorPacerInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"spotlight-indexer.pacer-interval" min:0.0 max:1.79769313e308 byDefault:0.1];
  return result;
}

- (unint64_t)recentsEnumeratorBatchSize
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"spotlight-indexer.batch-size" min:1 max:0x7FFFFFFFLL byDefault:32];
}

- (unint64_t)recentsEnumeratorMaxHierarchyDepth
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"spotlight-indexer.max-depth" min:0 max:0x7FFFFFFFLL byDefault:16];
}

- (NSDictionary)recentsEnumeratorFailureThrottleParams
{
  v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B273F0;
  v10[1] = &unk_1F2B271F8;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B278B0;
  v10[3] = &unk_1F2B27258;
  v9[4] = @"forget-after";
  v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B271B0;
  v10[5] = &unk_1F2B271C8;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __57__BRCUserDefaults_recentsEnumeratorFailureThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  float v5 = [(BRCUserDefaults *)self objectForKey:@"spotlight-indexer.failure-throttle-params" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __57__BRCUserDefaults_recentsEnumeratorFailureThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)migrationThrottleParams
{
  v10[5] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B27330;
  v10[1] = &unk_1F2B27240;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B273F0;
  v10[3] = &unk_1F2B27408;
  v9[4] = @"forget-after";
  void v10[4] = &unk_1F2B27300;
  uint64_t v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __42__BRCUserDefaults_migrationThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  float v5 = [(BRCUserDefaults *)self objectForKey:@"migration.failure-throttle-params" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __42__BRCUserDefaults_migrationThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (double)intervalToWaitBeforeShowingAdditionalDescription
{
  [(BRCUserDefaults *)self doubleForKey:@"global-progress.additional.wait-trigger" min:1.0 max:1.79769313e308 byDefault:10.0];
  return result;
}

- (int64_t)minimalSizeToShowAdditionalDescription
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"global-progress.additional.size-trigger" min:1 max:0x7FFFFFFFFFFFFFFFLL byDefault:52428800];
}

- (double)documentAccessHighPriorityInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"document-access.high-priority-download-interval" min:1.0 max:1.79769313e308 byDefault:259200.0];
  return result;
}

- (double)packageExtensionPlistWriteInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"pkg-extension-plist.write-interval" min:0.0 max:1.79769313e308 byDefault:5.0];
  return result;
}

- (int64_t)minFileSizeForThumbnailTransfer
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"doc.min-size-for-thumbnail" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:0x100000];
}

- (unsigned)thumbnailTransferQueueWidth
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"doc.thumbnail-transfer-queue-width.ios" min:1 max:0x7FFFFFFFLL byDefault:4];
}

- (unint64_t)notifOverflowLimit
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"notif.overflow-limit" min:1 max:0x7FFFFFFFLL byDefault:2048];
}

- (unint64_t)notifGatherUpTo
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"notif.gather-up-to" min:1 max:0x7FFFFFFFLL byDefault:256];
}

- (unint64_t)notifBatchSize
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"notif.batch-size" min:1 max:0x7FFFFFFFLL byDefault:64];
}

- (unint64_t)zoneHealthReportedRecordNamesCount
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"zone-health.reported-record-names-count" min:0 max:0x7FFFFFFFLL byDefault:10];
}

- (BOOL)onlyTreatCaughtUpAsConsistent
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.only-treat-caught-up-as-consistent" byDefault:0];
}

- (NSSet)blacklistPCSPrep
{
  return (NSSet *)[(BRCUserDefaults *)self objectForKey:@"zone-pcs-migration.blacklist-pcs-prep" inheritFromGlobal:1 validateWithBlock:&__block_literal_global_2055];
}

id __35__BRCUserDefaults_blacklistPCSPrep__block_invoke(uint64_t a1, void *a2)
{
  double v2 = _stringSetFromDefaultValue(a2, 0);
  uint64_t v3 = *MEMORY[0x1E4F59418];
  [v2 addObject:*MEMORY[0x1E4F59418]];
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    objc_msgSend(MEMORY[0x1E4F1CA80], "setWithObjects:", v3, *MEMORY[0x1E4F59408], *MEMORY[0x1E4F59480], @"_defaultZone", 0);
    id v4 = (id)objc_claimAutoreleasedReturnValue();
  }
  float v5 = v4;

  return v5;
}

- (BOOL)shouldPreparePCSMigration
{
  return [(BRCUserDefaults *)self BOOLForKey:@"zone-pcs-migration.should-prepare" byDefault:1];
}

- (unint64_t)pcsChainingMaxPathDepth
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"pcs-chaining.max-path-depth" min:1 max:0xFFFFFFFFLL byDefault:512];
}

- (unint64_t)pcsChainingBatchSize
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"pcs-chaining.batch-size" min:0 max:0xFFFFFFFFLL byDefault:200];
}

- (unint64_t)enhancedDrivePrivacyBasehashSaltingBatchSize
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"enhanced-drive-privacy.basehash-salting.batch-size" min:0 max:0xFFFFFFFFLL byDefault:200];
}

- (BOOL)destroyiWorkShares
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sharing.destroy-iwork-shares" byDefault:1];
}

- (unint64_t)readerMarkChildrenLostBatchSize
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"fsreader.lost.marklost.batchSize" min:10 max:0xFFFFFFFFLL byDefault:300];
}

- (unint64_t)lostScanDeepScanFirstThreshold
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"fsreader.lost.deep-first-threshold" min:0 max:0xFFFFFFFFLL byDefault:5];
}

- (unsigned)bounceFileMaxRetries
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"fswrite.bounce-file-max-retries" min:1 max:0xFFFFFFFFLL byDefault:1000];
}

- (double)bounceFileReportInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"fswrite.bounce-file-report-interval" min:1.0 max:1.79769313e308 byDefault:43200.0];
  return result;
}

- (NSSet)excludedFilenamesWorthWarningAtLogout
{
  return (NSSet *)[(BRCUserDefaults *)self objectForKey:@"excluded-filenames-worth-warning-at-logout" inheritFromGlobal:1 validateWithBlock:&__block_literal_global_2090];
}

id __56__BRCUserDefaults_excludedFilenamesWorthWarningAtLogout__block_invoke(uint64_t a1, void *a2)
{
  double v2 = _stringSetFromDefaultValue(a2, 0);
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F59528] defaultExcludedFilenamesWorthWarningAtLogout];
  }
  float v5 = v4;

  return v5;
}

- (NSSet)excludedFilenamesWorthPreserving
{
  return (NSSet *)[(BRCUserDefaults *)self objectForKey:@"excluded-filenames-worth-preservering" inheritFromGlobal:1 validateWithBlock:&__block_literal_global_2096];
}

id __51__BRCUserDefaults_excludedFilenamesWorthPreserving__block_invoke(uint64_t a1, void *a2)
{
  double v2 = _stringSetFromDefaultValue(a2, 0);
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F59528] defaultExcludedFilenamesWorthPreserving];
  }
  float v5 = v4;

  return v5;
}

- (NSSet)excludedExtensionsWorthPreserving
{
  return (NSSet *)[(BRCUserDefaults *)self objectForKey:@"excluded-extensions-worth-preservering" inheritFromGlobal:1 validateWithBlock:&__block_literal_global_2101];
}

id __52__BRCUserDefaults_excludedExtensionsWorthPreserving__block_invoke(uint64_t a1, void *a2)
{
  double v2 = _stringSetFromDefaultValue(a2, 0);
  uint64_t v3 = v2;
  if (v2)
  {
    id v4 = v2;
  }
  else
  {
    id v4 = [MEMORY[0x1E4F59528] defaultExcludedExtensionsWorthPreserving];
  }
  float v5 = v4;

  return v5;
}

- (unsigned)ignoredQuarantineMask
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"ignored-quarantine-mask" min:0 max:0x7FFFFFFFLL byDefault:896];
}

- (BOOL)shouldAutoMigrateToCloudDocs
{
  if ([(NSString *)self->_clientZoneIdentifier isEqualToString:*MEMORY[0x1E4F59268]])
  {
    return [(BRCUserDefaults *)self BOOLForKey:@"should-auto-migrate" inheritFromGlobal:0 byDefault:0];
  }
  else
  {
    return [(BRCUserDefaults *)self BOOLForKey:@"should-auto-migrate" byDefault:1];
  }
}

+ (int)rampNumberWithSession:(id)a3
{
  uint64_t v3 = [a3 accountDSID];
  id v4 = objc_msgSend(v3, "brc_SHA256");

  if ((unint64_t)[v4 length] < 9) {
    int v5 = -1;
  }
  else {
    int v5 = *(void *)[v4 bytes] % 0x64uLL;
  }

  return v5;
}

- (BOOL)_shouldRampForKey:(id)a3 session:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(BRCUserDefaults *)self intForKey:v6 min:0 max:100 byDefault:0];
  id v9 = [v6 stringByAppendingString:@".carry"];
  int v10 = [(BRCUserDefaults *)self intForKey:v9 min:0 max:100 byDefault:0];

  id v11 = [v6 stringByAppendingString:@".internal"];
  int v12 = [(BRCUserDefaults *)self intForKey:v11 min:0 max:100 byDefault:0];

  id v13 = [v6 stringByAppendingString:@".internal+carry"];
  int v14 = [(BRCUserDefaults *)self intForKey:v13 min:0 max:100 byDefault:0];

  if (v8 > 0 || v10 > 0 || v12 > 0 || (BOOL v15 = 0, v14 >= 1))
  {
    int v16 = +[BRCUserDefaults rampNumberWithSession:v7];
    if (v16 >= v8)
    {
      int v19 = v16;
      if ([v7 icloudAccountIsInCarry] && v19 < v10)
      {
        uint64_t v17 = brc_bread_crumbs();
        BOOL v15 = 1;
        uint64_t v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[BRCUserDefaults _shouldRampForKey:session:]();
        }
      }
      else if (os_variant_has_internal_content() && v19 < v12)
      {
        uint64_t v17 = brc_bread_crumbs();
        BOOL v15 = 1;
        uint64_t v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[BRCUserDefaults _shouldRampForKey:session:]();
        }
      }
      else if ([v7 icloudAccountIsInCarry] {
             && os_variant_has_internal_content()
      }
             && v19 < v14)
      {
        uint64_t v17 = brc_bread_crumbs();
        BOOL v15 = 1;
        uint64_t v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
          -[BRCUserDefaults _shouldRampForKey:session:].cold.4();
        }
      }
      else
      {
        uint64_t v17 = brc_bread_crumbs();
        uint64_t v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
        {
          int v21 = 138413314;
          id v22 = v6;
          __int16 v23 = 1024;
          int v24 = v19;
          __int16 v25 = 1024;
          int v26 = v8;
          __int16 v27 = 1024;
          int v28 = v10;
          __int16 v29 = 2112;
          id v30 = v17;
          _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] We are denylisted from %@ because %d < %d and %d%@", (uint8_t *)&v21, 0x28u);
        }
        BOOL v15 = 0;
      }
    }
    else
    {
      uint64_t v17 = brc_bread_crumbs();
      BOOL v15 = 1;
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[BRCUserDefaults _shouldRampForKey:session:]();
      }
    }
  }
  return v15;
}

- (BOOL)optimisticallyPCSChainWithSession:(id)a3
{
  BOOL v4 = [(BRCUserDefaults *)self _shouldRampForKey:@"sync.optimistic-chain-ramp" session:a3];
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.optimistic-pcs-chaining" byDefault:v4];
}

- (BOOL)optimisticallyPCSChainDuringResetWithSession:(id)a3
{
  BOOL v4 = [(BRCUserDefaults *)self _shouldRampForKey:@"sync.reset.optimistic-chain-ramp" session:a3];
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.reset.optimistic-chain" byDefault:v4];
}

- (BOOL)aggressivelyPCSChainWithSession:(id)a3
{
  BOOL v4 = [(BRCUserDefaults *)self _shouldRampForKey:@"sync.aggressive-chain-ramp" session:a3];
  return [(BRCUserDefaults *)self BOOLForKey:@"aggressive-pcs-chaining" byDefault:v4];
}

- (OS_xpc_object)aggressivePCSChainActivity
{
  void v10[6] = *MEMORY[0x1E4F143B8];
  v10[0] = &unk_1F2B272D0;
  v9[0] = @"delay";
  v9[1] = @"grace";
  uint64_t v3 = [NSNumber numberWithLongLong:*MEMORY[0x1E4F14228]];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  v10[1] = v3;
  v10[2] = MEMORY[0x1E4F1CC28];
  v9[2] = @"repeat";
  v9[3] = @"priority";
  int v5 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142D0]];
  v10[3] = v5;
  void v10[4] = v4;
  v9[4] = @"battery";
  void v9[5] = @"screen.sleep";
  v10[5] = MEMORY[0x1E4F1CC38];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  id v7 = [(BRCUserDefaults *)self xpcActivityDictionaryForKey:@"agressive-pcs-activity" byDefault:v6];

  return (OS_xpc_object *)v7;
}

- (OS_xpc_object)finishSaltingPartiallySaltedDirectoriesActivity
{
  void v10[6] = *MEMORY[0x1E4F143B8];
  v10[0] = &unk_1F2B272D0;
  v9[0] = @"delay";
  v9[1] = @"grace";
  uint64_t v3 = [NSNumber numberWithLongLong:*MEMORY[0x1E4F141E8]];
  uint64_t v4 = MEMORY[0x1E4F1CC28];
  v10[1] = v3;
  v10[2] = MEMORY[0x1E4F1CC28];
  v9[2] = @"repeat";
  v9[3] = @"priority";
  int v5 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142D0]];
  v10[3] = v5;
  void v10[4] = v4;
  v9[4] = @"battery";
  void v9[5] = @"screen.sleep";
  v10[5] = MEMORY[0x1E4F1CC38];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  id v7 = [(BRCUserDefaults *)self xpcActivityDictionaryForKey:@"salt-partially-salted" byDefault:v6];

  return (OS_xpc_object *)v7;
}

- (BOOL)shouldFixupTargetCZMAliases
{
  return [(BRCUserDefaults *)self BOOLForKey:@"should-fixup-czm-aliases" byDefault:1];
}

- (unint64_t)deleteShareIDBatchCount
{
  return [(BRCUserDefaults *)self intForKey:@"delete-shareid-batch-count" min:0 max:0x7FFFFFFFLL byDefault:200];
}

- (unint64_t)maxFolderEnumerationCount
{
  return [(BRCUserDefaults *)self intForKey:@"max-folder-enumeration-count" min:0 max:0x7FFFFFFFLL byDefault:200000];
}

- (unint64_t)maxFolderEnumerationDepth
{
  return [(BRCUserDefaults *)self intForKey:@"max-folder-enumeration-depth" min:0 max:0x7FFFFFFFLL byDefault:20];
}

- (double)powerLogReportInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"power-log-report-interval" min:60.0 max:1.79769313e308 byDefault:86400.0];
  return result;
}

- (unint64_t)sqliteCacheSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"sqlite-cache-size.ios" min:0 max:0x7FFFFFFFLL byDefault:128];
}

- (unint64_t)sqliteCacheSpill
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"sqlite-cache-spill.ios" min:0 max:0x7FFFFFFFLL byDefault:512];
}

- (double)downloadSizeRefreshInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"downloader.size-refresh-interval" min:0.0 max:1.79769313e308 byDefault:10.0];
  return result;
}

- (char)forceSyncOverride
{
  return [(BRCUserDefaults *)self intForKey:@"force-sync-override" min:0xFFFFFFFFLL max:1 byDefault:0];
}

- (unint64_t)utiCacheSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"uti-cache-size" min:0 max:0x7FFFFFFFLL byDefault:200];
}

- (unint64_t)fieldsToMoveOutOfTrashMask
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"fields-to-move-out-of-trash-mask" min:0 max:-1 byDefault:0x20000];
}

- (unint64_t)applyCountToSignalFaultsLive
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"apply-count-to-signal-faults-live" min:0 max:-1 byDefault:10];
}

- (unint64_t)numberOfGreedyRecentlyUsedItems
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"greedy-recently-used-item-count" min:0 max:-1 byDefault:64];
}

- (unint64_t)computeEvictableBatchSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"compute-evictable-batch-size" min:0 max:-1 byDefault:4096];
}

- (double)eventMetricTimeout
{
  [(BRCUserDefaults *)self doubleForKey:@"ck-event-metric-timeout" min:0.0 max:1.79769313e308 byDefault:300.0];
  return result;
}

- (BOOL)shouldReportAllPerItemFailures
{
  return [(BRCUserDefaults *)self BOOLForKey:@"report-all-per-item-failures" byDefault:1];
}

- (BOOL)should2PhasePCSChain
{
  return [(BRCUserDefaults *)self BOOLForKey:@"pcs-chain-2-phase" byDefault:0];
}

- (unint64_t)pendingChangesStreamSoftOpenCount
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"pending-changes-soft-open" min:0 max:-1 byDefault:4];
}

- (unint64_t)pendingChangesStreamHardOpenCount
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"pending-changes-hard-open" min:0 max:-1 byDefault:8];
}

- (unint64_t)pendingChangesStreamCloseDelay
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"pending-changes-close-delay" min:0 max:-1 byDefault:2000000000];
}

- (int)discretionaryRecursiveListMaxOperationCount
{
  return [(BRCUserDefaults *)self intForKey:@"recursive-list.discretionary.concurrent-operation-count" min:0xFFFFFFFFLL max:0x7FFFFFFFLL byDefault:1];
}

- (int)nonDiscretionaryRecursiveListMaxOperationCount
{
  return [(BRCUserDefaults *)self intForKey:@"recursive-list.non-discretionary.concurrent-operation-count" min:0xFFFFFFFFLL max:0x7FFFFFFFLL byDefault:2];
}

- (int64_t)recursiveListFetchDirFaultBatchSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"recursive-list.fetch-dir-fault.batch-size" min:1 max:-1 byDefault:200];
}

- (int64_t)dbMigrationBatchSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"db-migration-batch-size" min:1 max:0x7FFFFFFFFFFFFFFFLL byDefault:0x4000];
}

- (BOOL)forceDeltaInitialSync
{
  return [(BRCUserDefaults *)self BOOLForKey:@"force-delta-initial-sync" byDefault:0];
}

- (BOOL)blockApplyUntilList
{
  return [(BRCUserDefaults *)self BOOLForKey:@"block-apply-until-list" byDefault:1];
}

- (BOOL)allowsDirectoryListBeforeInitialChangeToken
{
  if ([(BRCUserDefaults *)self _isSharedDefaults])
  {
    uint64_t v3 = @"allows-shared-directory-list-before-initial-change";
    uint64_t v4 = self;
    uint64_t v5 = 1;
  }
  else
  {
    uint64_t v3 = @"allows-private-directory-list-before-initial-change";
    uint64_t v4 = self;
    uint64_t v5 = 0;
  }
  return [(BRCUserDefaults *)v4 BOOLForKey:v3 byDefault:v5];
}

- (BOOL)canSaveRecordsDirectlyForList
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.save-records-directly-for-list" byDefault:1];
}

- (BOOL)canSaveRecordsDirectlyForDeltaSync
{
  BOOL v3 = [(NSString *)self->_clientZoneIdentifier isEqualToString:*MEMORY[0x1E4F59458]];
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.save-records-directly-for-delta-sync" inheritFromGlobal:v3 ^ 1 byDefault:v3];
}

- (BOOL)canSaveRecordsDirectlyWithDeletes
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.save-records-directly-with-deletes" byDefault:1];
}

- (BOOL)isBlacklistedFromFolderSharing
{
  BOOL v3 = [(NSString *)self->_clientZoneIdentifier isEqualToString:*MEMORY[0x1E4F59288]];
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.server-only.folder-sharing-blacklisted" inheritFromGlobal:v3 ^ 1 byDefault:v3];
}

- (BOOL)fetchContentRecordsInline
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.fetch-content-records-inline" byDefault:1];
}

- (BOOL)fetchShareRecordsInline
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.fetch-share-records-inline" byDefault:1];
}

- (unint64_t)qbsExpectedItemsFetchedPerInterval
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"qbs-telemetry.items-fetched-per-interval" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:25000];
}

- (double)qbsExpectedItemsFetchedCheckInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"qbs-telemetry.items-fetched-check-interval" min:0.0 max:1.79769313e308 byDefault:86400.0];
  return result;
}

- (double)syncUpDelayForFailure
{
  [(BRCUserDefaults *)self doubleForKey:@"sync-up.delay-for-failure" min:0.0 max:1.79769313e308 byDefault:540.0];
  return result;
}

- (double)syncDownDelayForFailure
{
  [(BRCUserDefaults *)self doubleForKey:@"sync-down.delay-for-failure" min:0.0 max:1.79769313e308 byDefault:540.0];
  return result;
}

- (float)syncUpBackoffDelayForFailure
{
  LODWORD(v2) = 2139095039;
  LODWORD(v3) = 1142292480;
  [(BRCUserDefaults *)self floatForKey:@"sync-up.backoff.delay-for-failure" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (float)syncUpBackoffRatioForFailure
{
  LODWORD(v2) = 2139095039;
  LODWORD(v3) = 0.75;
  [(BRCUserDefaults *)self floatForKey:@"sync-up.backoff.ratio-for-failure" min:0.0 max:v2 byDefault:v3];
  return result;
}

- (unint64_t)minimumNumberOfFailuresBeforeReportingSyncBackoffRatio
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"sync-up.backoff.min-failures-before-reporting-ratio" min:1 max:-1 byDefault:3];
}

- (unint64_t)syncUpRetryCountForFailure
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"sync-up.retry-for-failure" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:10];
}

- (unint64_t)uploadRetryCountForFailure
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"uploader.retry-for-failure" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:20];
}

- (unint64_t)uploadRetryCountForAssetNotFoundFailure
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"uploader.retry-for-asset-not-foundfailure" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:7];
}

- (unint64_t)downloadRetryCountForFailure
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"downloader.retry-for-failure" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:12];
}

- (unint64_t)applyRetryCountForFailure
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"apply.retry-for-failure" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:12];
}

- (unint64_t)readerRetryCountForFailure
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"reader.retry-for-failure" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:100];
}

- (OS_xpc_object)fpfsMigrationTrialRefreshXPCActivity
{
  void v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"interval";
  double v3 = [NSNumber numberWithLongLong:6 * *MEMORY[0x1E4F141F8]];
  v9[0] = v3;
  v8[1] = @"priority";
  uint64_t v4 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142D0]];
  v9[1] = v4;
  v9[2] = MEMORY[0x1E4F1CC38];
  v8[2] = @"battery";
  v8[3] = @"screen.sleep";
  v8[4] = @"repeat";
  v9[3] = MEMORY[0x1E4F1CC28];
  v9[4] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
  id v6 = [(BRCUserDefaults *)self xpcActivityDictionaryForKey:@"fpfs.migrator.scheduler.trial.refresh.xpc" byDefault:v5];

  return (OS_xpc_object *)v6;
}

- (OS_xpc_object)fpfsMigrationSchedulerXPCActivity
{
  v10[5] = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F59530] isInternalBuild]) {
    uint64_t v3 = *MEMORY[0x1E4F141E8];
  }
  else {
    uint64_t v3 = 3 * *MEMORY[0x1E4F141E8];
  }
  uint64_t v4 = [NSNumber numberWithLongLong:v3];
  v10[0] = v4;
  v9[0] = @"interval";
  v9[1] = @"priority";
  uint64_t v5 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142D0]];
  v10[1] = v5;
  v10[2] = MEMORY[0x1E4F1CC28];
  v9[2] = @"battery";
  v9[3] = @"screen.sleep";
  v9[4] = @"may.reboot";
  v10[3] = MEMORY[0x1E4F1CC38];
  void v10[4] = MEMORY[0x1E4F1CC38];
  id v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:5];
  id v7 = [(BRCUserDefaults *)self xpcActivityDictionaryForKey:@"fpfs.migrator.scheduler.reboot.xpc" byDefault:v6];

  return (OS_xpc_object *)v7;
}

- (OS_xpc_object)analyticsReportXPCActivity
{
  void v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"interval";
  uint64_t v3 = [NSNumber numberWithLongLong:*MEMORY[0x1E4F141E8]];
  v9[0] = v3;
  v8[1] = @"priority";
  uint64_t v4 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142D0]];
  v9[1] = v4;
  v9[2] = MEMORY[0x1E4F1CC28];
  v8[2] = @"battery";
  v8[3] = @"screen.sleep";
  v8[4] = @"repeat";
  v9[3] = MEMORY[0x1E4F1CC38];
  v9[4] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
  id v6 = [(BRCUserDefaults *)self xpcActivityDictionaryForKey:@"analytics.report.xpc" byDefault:v5];

  return (OS_xpc_object *)v6;
}

- (OS_xpc_object)appTelemetryGatherXPCActivity
{
  void v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"interval";
  uint64_t v3 = [NSNumber numberWithLongLong:2 * *MEMORY[0x1E4F141E8]];
  v9[0] = v3;
  v8[1] = @"priority";
  uint64_t v4 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142D0]];
  v9[1] = v4;
  v9[2] = MEMORY[0x1E4F1CC28];
  v8[2] = @"battery";
  v8[3] = @"screen.sleep";
  v8[4] = @"repeat";
  v9[3] = MEMORY[0x1E4F1CC38];
  v9[4] = MEMORY[0x1E4F1CC38];
  uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
  id v6 = [(BRCUserDefaults *)self xpcActivityDictionaryForKey:@"analytics.report.app-telemetry-gather.xpc" byDefault:v5];

  return (OS_xpc_object *)v6;
}

- (BOOL)useFailIfOutdatedForResets
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.reset.fail-if-outdated" byDefault:0];
}

- (NSString)fakeEtagForFailIfOutdated
{
  double v2 = [(BRCUserDefaults *)self stringForKey:@"sync.reset.fake-etag-for-fail-if-outdated" byDefault:@"0"];
  if ([v2 isEqualToString:@"nil"])
  {

    double v2 = 0;
  }
  return (NSString *)v2;
}

- (BOOL)useShareReferenceOnSideCar
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.side-car.use-share-reference" byDefault:1];
}

- (BOOL)shouldMigrateFetchShareAliases
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.should-migrate-fetch-share-aliases" byDefault:1];
}

- (NSArray)carryPartitions
{
  double v2 = [(BRCUserDefaults *)self stringForKey:@"sync.server-only.carry-partitions" byDefault:@"p97,p98"];
  uint64_t v3 = [v2 componentsSeparatedByString:@","];

  return (NSArray *)v3;
}

- (unint64_t)maxBackoffToRetryUserInitiated
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"user-initiated-max-backoff" min:0 max:-1 byDefault:60000000000];
}

- (BOOL)pcsChainShareAliases
{
  return [(BRCUserDefaults *)self BOOLForKey:@"should-pcs-chain-share-aliases" byDefault:1];
}

- (int64_t)delayForStuckThrottle
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"sync.stuck-throttle-delay" min:0 max:-1 byDefault:86400000000000];
}

- (BOOL)forceFailIfExistOnRevival
{
  return [(BRCUserDefaults *)self BOOLForKey:@"force-fail-if-exists-on-revival" byDefault:1];
}

- (BOOL)changeItemIDOnUnknownItem
{
  return [(BRCUserDefaults *)self BOOLForKey:@"change-item-id-on-unknown-item" byDefault:1];
}

- (unint64_t)healthZoneMaxNumberOfResets
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"zone-health.max-number-of-resets" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:5];
}

- (double)healthZoneTimeIntervalForMaxNumberOfResets
{
  [(BRCUserDefaults *)self doubleForKey:@"zone-health.max-number-of-resets-for-time-interval" min:0.0 max:1.79769313e308 byDefault:3600.0];
  return result;
}

- (BOOL)reportXPCErrorOnPCSChain
{
  return [(BRCUserDefaults *)self BOOLForKey:@"report-xpc-error-on-pcs-chain" byDefault:1];
}

- (int64_t)timeoutForCZMProcessing
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"czm-processing.timeout" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:60];
}

- (BOOL)shouldReportTelemetryEvents
{
  return [(BRCUserDefaults *)self BOOLForKey:@"telemetry.should-report" byDefault:1];
}

- (int64_t)telemetryEventQueueSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"telemetry.event-queue-size" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:500];
}

- (unsigned)telemetryEventQueueReductionAmount
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"telemetry.event-queue-reduction" min:2 max:0xFFFFFFFFLL byDefault:250];
}

- (int64_t)telemetryEventReportBatchSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"telemetry.report-batch-size" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:10];
}

- (NSIndexSet)telemetryEventDisabledMessages
{
  return (NSIndexSet *)[(BRCUserDefaults *)self indexSetForKey:@"telemetry.disabled-messages" byDefault:0];
}

- (int64_t)telemetryRetryCountForPermenentFailure
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"telemetry.retry-count-for-failure" min:0 max:0x7FFFFFFFFFFFFFFFLL byDefault:5];
}

- (double)telemetryApplySchedulerTimeout
{
  [(BRCUserDefaults *)self doubleForKey:@"telemetry.apply-scheduler-timeout" min:0.0 max:1.79769313e308 byDefault:30.0];
  return result;
}

- (NSSet)telemetryHeaderSupportedClasses
{
  return (NSSet *)[(BRCUserDefaults *)self objectForKey:@"telemetry.header-send-supported-classes" inheritFromGlobal:1 validateWithBlock:&__block_literal_global_2372];
}

id __50__BRCUserDefaults_telemetryHeaderSupportedClasses__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  double v2 = _stringSetFromDefaultValue(a2, 1);
  if (v2)
  {
    uint64_t v3 = objc_opt_new();
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v4 = v2;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v19 != v7) {
            objc_enumerationMutation(v4);
          }
          Class v9 = NSClassFromString(*(NSString **)(*((void *)&v18 + 1) + 8 * i));
          if (v9) {
            [v3 addObject:v9];
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v6);
    }
  }
  else
  {
    int v10 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v11 = objc_opt_class();
    uint64_t v12 = objc_opt_class();
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    uint64_t v16 = objc_opt_class();
    uint64_t v3 = objc_msgSend(v10, "setWithObjects:", v11, v12, v13, v14, v15, v16, objc_opt_class(), 0);
  }

  return v3;
}

- (unint64_t)telemetryErrorDescriptionMaxLength
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"telemetry.error-description-length" min:0 max:0xFFFFFFFFLL byDefault:100];
}

- (NSSet)benignTelemetryErrorDescriptions
{
  return (NSSet *)[(BRCUserDefaults *)self objectForKey:@"telemetry.benign-error-descriptions" inheritFromGlobal:1 validateWithBlock:&__block_literal_global_2387];
}

id __51__BRCUserDefaults_benignTelemetryErrorDescriptions__block_invoke(uint64_t a1, void *a2)
{
  double v2 = _stringSetFromDefaultValue(a2, 0);
  if (!v2)
  {
    double v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"CKErrorZoneNotFound", @"CKErrorSharedZoneNotFound", @"CKErrorUserDeletedZone", @"zone became healthy", @"testing", 0);
  }
  return v2;
}

- (BOOL)deleteShareOnEmptySave
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sharing.delete-share-on-empty-save" byDefault:1];
}

- (BOOL)preventRecordSyncWithoutDiffs
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync-up.prevent-record-sync-without-diffs" byDefault:1];
}

- (BOOL)stripBirthtimeFromSyncUpMaskOnDocuments
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync-up.strip-birthtime-on-documents" byDefault:1];
}

- (BOOL)preventSharingFolderWithPendingDelete
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync-up.sharing.prevent-sharing-with-pending-delete" byDefault:1];
}

- (unsigned)ubiquitousMigrationMaxBouncingAttempts
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"ubiquitous-migration-max-bouncing-attempts" min:0 max:0xFFFFFFFFLL byDefault:100];
}

- (id)_healthErrorSetForKey:(id)a3 byDefault:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __51__BRCUserDefaults__healthErrorSetForKey_byDefault___block_invoke;
  v10[3] = &unk_1E699B270;
  id v11 = v6;
  id v7 = v6;
  int v8 = [(BRCUserDefaults *)self objectForKey:a3 inheritFromGlobal:1 validateWithBlock:v10];

  return v8;
}

id __51__BRCUserDefaults__healthErrorSetForKey_byDefault___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = _numberSetFromDefaultValue(a2);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v5 = 138412290;
    long long v15 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        if ((int)objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v8), "intValue", v15) >= 20)
        {
          Class v9 = brc_bread_crumbs();
          int v10 = brc_default_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v15;
            long long v21 = v9;
            _os_log_fault_impl(&dword_1D353B000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: [error intValue] < BRCProblemTypeMaxValue%@", buf, 0xCu);
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v11 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
      uint64_t v6 = v11;
    }
    while (v11);
  }
  if (v3)
  {
    id v12 = v3;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CA80] setWithArray:*(void *)(a1 + 32)];
  }
  uint64_t v13 = v12;

  return v13;
}

- (NSSet)healthErrorsForReset
{
  return (NSSet *)[(BRCUserDefaults *)self _healthErrorSetForKey:@"zone-health.errors-for-reset" byDefault:&unk_1F2B27840];
}

- (NSSet)healthErrorsToReport
{
  return (NSSet *)[(BRCUserDefaults *)self _healthErrorSetForKey:@"zone-health.errors-to-report" byDefault:&unk_1F2B27858];
}

- (NSSet)recordsToIgnoreOnSyncDown
{
  return (NSSet *)[(BRCUserDefaults *)self objectForKey:@"sync.ignored-record-names" inheritFromGlobal:1 validateWithBlock:&__block_literal_global_2472];
}

id __44__BRCUserDefaults_recordsToIgnoreOnSyncDown__block_invoke(uint64_t a1, void *a2)
{
  double v2 = _stringSetFromDefaultValue(a2, 1);
  if (!v2)
  {
    double v2 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"directory/appData_com.apple.Desktop", @"directory/appDocuments_com.apple.Desktop", @"directory/appData_com.apple.Documents", @"directory/appDocuments_com.apple.Documents", 0);
  }
  return v2;
}

- (BOOL)preventConcurrentModifyRecordsOperations
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.prevent-concurrent-modify-records-operations" byDefault:1];
}

- (OS_xpc_object)dbIntegrityCheckXPCActivity
{
  void v9[5] = *MEMORY[0x1E4F143B8];
  v8[0] = @"interval";
  uint64_t v3 = [NSNumber numberWithLongLong:2 * *MEMORY[0x1E4F141E8]];
  v9[0] = v3;
  v8[1] = @"priority";
  uint64_t v4 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142D0]];
  v9[1] = v4;
  v9[2] = MEMORY[0x1E4F1CC28];
  v8[2] = @"battery";
  v8[3] = @"screen.sleep";
  v8[4] = @"repeat";
  v9[3] = MEMORY[0x1E4F1CC38];
  v9[4] = MEMORY[0x1E4F1CC38];
  long long v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:5];
  uint64_t v6 = [(BRCUserDefaults *)self xpcActivityDictionaryForKey:@"db.integrity-check.xpc" byDefault:v5];

  return (OS_xpc_object *)v6;
}

- (BOOL)integrityCheckContentPolicy
{
  return [(BRCUserDefaults *)self BOOLForKey:@"db.integrity-check-content-policy" byDefault:1];
}

- (BOOL)integrityCheckBoosting
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.integrity-check.boosting" byDefault:1];
}

- (BOOL)dbIntegrityCheckApplyJobs
{
  return [(BRCUserDefaults *)self BOOLForKey:@"db.integrity-check.apply" byDefault:1];
}

- (BOOL)dbIntegrityCheckDownloadJobs
{
  return [(BRCUserDefaults *)self BOOLForKey:@"db.integrity-check.download" byDefault:1];
}

- (BOOL)dbIntegrityCheckUploadJobs
{
  return [(BRCUserDefaults *)self BOOLForKey:@"db.integrity-check.upload" byDefault:1];
}

- (BOOL)dbIntegrityCheckReaderJobs
{
  return [(BRCUserDefaults *)self BOOLForKey:@"db.integrity-check.reader" byDefault:1];
}

- (BOOL)dbIntegrityCheckSyncUpJobs
{
  return [(BRCUserDefaults *)self BOOLForKey:@"db.integrity-check.sync-up" byDefault:1];
}

- (BOOL)dbIntegrityCheckMissingShareOptions
{
  return [(BRCUserDefaults *)self BOOLForKey:@"db.integrity-check.share-options" byDefault:1];
}

- (BOOL)dbIntegrityCheckBasehashSalting
{
  BOOL v3 = [(BRCUserDefaults *)self supportsEnhancedDrivePrivacy];
  if (v3)
  {
    LOBYTE(v3) = [(BRCUserDefaults *)self BOOLForKey:@"db.integrity-check.basehash-salting" byDefault:1];
  }
  return v3;
}

- (BOOL)supportsServerSideAssetCopies
{
  return [(BRCUserDefaults *)self BOOLForKey:@"uploads.supports-server-side-asset-copies" byDefault:1];
}

- (BOOL)fpfsOptimizeStorageAndSpeculativeDownload
{
  return [(BRCUserDefaults *)self BOOLForKey:@"fpfs.optimize-storage-and-speculative-download" byDefault:1];
}

- (BOOL)supportsEnhancedDrivePrivacy
{
  return 0;
}

- (BOOL)enhancedDrivePrivacyForced
{
  return 0;
}

- (unsigned)validationKeyTruncationLength
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"sync.enhanced-drive-privacy.validation-key-length" min:1 max:64 byDefault:4];
}

- (unsigned)timestampRoundingAmount
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"sync.enhanced-drive-privacy.timestamp-rounding-amount" min:60 max:0x7FFFFFFFLL byDefault:60];
}

- (BOOL)shouldSendRoundedTimestamps
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.enhanced-drive-privacy.send-rounded-timestamps" byDefault:1];
}

- (unsigned)contentPolicyPropogationTimeInSec
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"content-policy-propogation-time-in-sec" min:0 max:0xFFFFFFFFLL byDefault:5];
}

- (double)operationTimeout
{
  [(BRCUserDefaults *)self doubleForKey:@"operation-timeout" min:60.0 max:1.79769313e308 byDefault:86400.0];
  return result;
}

- (double)thumbnailGenerationOperationTimeout
{
  [(BRCUserDefaults *)self doubleForKey:@"thumbnail-generation-operation-timeout" min:0.0 max:1.79769313e308 byDefault:300.0];
  return result;
}

- (double)refreshRevisionMaxBackoff
{
  [(BRCUserDefaults *)self doubleForKey:@"refresh-revision-max-backoff" min:0.0 max:1.79769313e308 byDefault:60.0];
  return result;
}

- (double)thumbnailGenerationForCollaborationUploadTimeout
{
  [(BRCUserDefaults *)self doubleForKey:@"thumbnail-generation-for-collaboration-timeout" min:0.0 max:1.79769313e308 byDefault:20.0];
  return result;
}

- (unsigned)syncConsistencyFileChecksumRate
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"sync-consistency.file-checksum-rate" inheritFromGlobal:1 min:0 max:1000 byDefault:50];
}

- (unsigned)syncConsistencyPackageChecksumRate
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"sync-consistency.package-checksum-rate" min:0 max:1000 byDefault:10];
}

- (unsigned)syncConsistencyMaxEventsCount
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"sync-consistency.max-events-count" min:0 max:0xFFFFFFFFLL byDefault:250];
}

- (BOOL)syncConsistencyCheckerEnabled
{
  return 0;
}

- (BOOL)syncConsistencyCheckerSnapshotting
{
  return 0;
}

- (OS_xpc_object)syncConsistencyCheckerXPCActivity
{
  void v9[6] = *MEMORY[0x1E4F143B8];
  v8[0] = @"interval";
  BOOL v3 = [NSNumber numberWithLongLong:*MEMORY[0x1E4F14228]];
  v9[0] = v3;
  v8[1] = @"priority";
  uint64_t v4 = [NSString stringWithUTF8String:*MEMORY[0x1E4F142D0]];
  v9[1] = v4;
  v9[2] = MEMORY[0x1E4F1CC28];
  v8[2] = @"battery";
  v8[3] = @"screen.sleep";
  v9[3] = MEMORY[0x1E4F1CC38];
  v9[4] = MEMORY[0x1E4F1CC38];
  v8[4] = @"disk-intensive";
  void v8[5] = @"repeat";
  void v9[5] = MEMORY[0x1E4F1CC38];
  long long v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v9 forKeys:v8 count:6];
  uint64_t v6 = [(BRCUserDefaults *)self xpcActivityDictionaryForKey:@"sync.consistency-check.xpc" byDefault:v5];

  return (OS_xpc_object *)v6;
}

- (double)syncConsistencyXPCActivityDeferralCheckInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"sync.consistency-check.deferral-check-interval" min:0.0 max:1.79769313e308 byDefault:5.0];
  return result;
}

- (double)syncConsistencyXPCActivityCheckLeeway
{
  [(BRCUserDefaults *)self doubleForKey:@"sync.consistency-check.deferral-check-leeway" min:0.0 max:1.79769313e308 byDefault:3.0];
  return result;
}

- (double)syncConsistencyTimeout
{
  [(BRCUserDefaults *)self doubleForKey:@"sync.consistency-check.timeout" min:0.0 max:1.79769313e308 byDefault:3600.0];
  return result;
}

- (BOOL)skipContainerRecordsWithMissingAssets
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.container-metadata.skip-records-with-missing-assets" byDefault:1];
}

- (int)setupAssistantReadyMaxWaitTimeInSec
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"daemon-start.setup-assistant-ready.max-wait-time-in-sec" min:1 max:0x7FFFFFFFLL byDefault:10];
}

- (unsigned)fpReadyForXpcCheckMaxWaitTimeInSec
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"daemon-start.FP-ready-for-xpc-check.max-wait-time-in-sec" min:1 max:0xFFFFFFFFLL byDefault:300];
}

- (double)maxPauseFileTimeout
{
  [(BRCUserDefaults *)self doubleForKey:@"iwork-collaboration.max-pause-file-timeout" min:0.0 max:1.79769313e308 byDefault:2592000.0];
  return result;
}

- (unsigned)autoResumeSyncBatchSize
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"iwork-collaboration.auto-resume-sync-batch-size" min:1 max:0xFFFFFFFFLL byDefault:200];
}

- (unsigned)iWorkFetchPausedFilesBatchSize
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"iwork-collaboration.fetch-paused-files-batch-size" min:1 max:0xFFFFFFFFLL byDefault:200];
}

- (unint64_t)lostItemUnderUnknownParentBeforeDeepScan
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"lost-scan.unknown-parent-before-deep-scan" min:0 max:-1 byDefault:1000];
}

- (NSDictionary)serverStitchingThrottleParams
{
  void v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B273C0;
  v10[1] = &unk_1F2B27240;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B278C0;
  v10[3] = &unk_1F2B27258;
  v9[4] = @"forget-after";
  void v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B271B0;
  v10[5] = &unk_1F2B273A8;
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __48__BRCUserDefaults_serverStitchingThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  long long v5 = [(BRCUserDefaults *)self objectForKey:@"sync.server-stitching.throttle-params" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __48__BRCUserDefaults_serverStitchingThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (NSDictionary)locateRecordsThrottleParams
{
  void v10[6] = *MEMORY[0x1E4F143B8];
  v9[0] = @"start-after";
  v9[1] = @"give-up-after";
  v10[0] = &unk_1F2B272A0;
  v10[1] = &unk_1F2B27240;
  v9[2] = @"wait-at-least";
  v9[3] = @"wait-at-most";
  v10[2] = &unk_1F2B278C0;
  v10[3] = &unk_1F2B272B8;
  v9[4] = @"forget-after";
  void v9[5] = @"max-elemnt-count";
  void v10[4] = &unk_1F2B27288;
  v10[5] = &unk_1F2B273A8;
  BOOL v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v10 forKeys:v9 count:6];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __46__BRCUserDefaults_locateRecordsThrottleParams__block_invoke;
  v7[3] = &unk_1E699B270;
  id v8 = v3;
  id v4 = v3;
  long long v5 = [(BRCUserDefaults *)self objectForKey:@"sync.locate-records.throttle-params" inheritFromGlobal:1 validateWithBlock:v7];

  return (NSDictionary *)v5;
}

id __46__BRCUserDefaults_locateRecordsThrottleParams__block_invoke(uint64_t a1, void *a2)
{
  return _validateThrottleDefaults(a2, *(void **)(a1 + 32));
}

- (unsigned)subResourceFetchLoopCacheSize
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"sync.subresources.fetch-loop-cache-size" min:1 max:0x7FFFFFFFLL byDefault:20];
}

- (BOOL)fetchFullAppLibraryContents
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.fetch-full-contents" byDefault:1];
}

- (BOOL)allowForceTelemetryDequeue
{
  return [(BRCUserDefaults *)self BOOLForKey:@"telemetry.allow-force-dequeue" byDefault:1];
}

- (unsigned)forceTelemetryDequeuePercentage
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"telemetry.force-dequeue-percentage" min:0 max:100 byDefault:75];
}

- (unsigned)highPriorityTelemetryEventsPercentage
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"telemetry.high-priority-event-percentage" min:0 max:100 byDefault:50];
}

- (BOOL)rejectDeletionsBasedOnEtag
{
  return [(BRCUserDefaults *)self BOOLForKey:@"fpfs.reject-delete-items-based-on-etag" byDefault:0];
}

- (BOOL)testDevice
{
  return [(BRCUserDefaults *)self BOOLForKey:@"test-device" byDefault:0];
}

- (BOOL)scheduleDeepScanOnFSEventsReset
{
  if (![(BRCUserDefaults *)self testDevice]) {
    return 1;
  }
  return [(BRCUserDefaults *)self BOOLForKey:@"test.schedule-deep-scan-on-fsevents-reset" byDefault:1];
}

- (unint64_t)resumeProgressBatchSize
{
  return [(BRCUserDefaults *)self unsignedLongLongForKey:@"progress.resume-batch-size" min:1 max:-1 byDefault:200];
}

- (BOOL)checkTombstoneEmbargoReparents
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.check-tombstone-embargo-reparents" byDefault:1];
}

- (BOOL)reviveDeadDirsOnNewDirCreations
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.revive-dead-dirs-on-new-dir-creationss" byDefault:1];
}

- (BOOL)recoverDamagedDocumentOnDisk
{
  return [(BRCUserDefaults *)self BOOLForKey:@"sync.recover-damaged-document-on-dir-disk" byDefault:1];
}

- (id)_brErrorSetForKey:(id)a3 byDefault:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __47__BRCUserDefaults__brErrorSetForKey_byDefault___block_invoke;
  v10[3] = &unk_1E699B270;
  id v11 = v6;
  id v7 = v6;
  id v8 = [(BRCUserDefaults *)self objectForKey:a3 inheritFromGlobal:1 suiteName:@"com.apple.bird" validateWithBlock:v10];

  return v8;
}

id __47__BRCUserDefaults__brErrorSetForKey_byDefault___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  BOOL v3 = _numberSetFromDefaultValue(a2);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v4)
  {
    uint64_t v6 = v4;
    uint64_t v7 = *(void *)v17;
    *(void *)&long long v5 = 138412290;
    long long v15 = v5;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v3);
        }
        if ((int)objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v8), "intValue", v15) <= 0)
        {
          Class v9 = brc_bread_crumbs();
          int v10 = brc_default_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v15;
            long long v21 = v9;
            _os_log_fault_impl(&dword_1D353B000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: [errorID intValue] > 0%@", buf, 0xCu);
          }
        }
        ++v8;
      }
      while (v6 != v8);
      uint64_t v11 = [v3 countByEnumeratingWithState:&v16 objects:v22 count:16];
      uint64_t v6 = v11;
    }
    while (v11);
  }
  if (v3)
  {
    id v12 = v3;
  }
  else
  {
    id v12 = [MEMORY[0x1E4F1CA80] setWithArray:*(void *)(a1 + 32)];
  }
  uint64_t v13 = v12;

  return v13;
}

- (BOOL)useTrialToGateFPFSMigration
{
  return [(BRCUserDefaults *)self BOOLForKey:@"fpfs.use-trial-to-gate-fpfs-migration" byDefault:1];
}

- (unsigned)listFilesIngestedBatchSize
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"list-files-ingested.batch-size" min:1 max:0xFFFFFFFFLL byDefault:200];
}

- (BOOL)ignoreFaultingErrorsDuringDirectoryProviding
{
  return [(BRCUserDefaults *)self BOOLForKey:@"ignore-faulting-errors-for-directory-provide" byDefault:1];
}

- (BOOL)fpfsUploadV2
{
  return 0;
}

- (BOOL)showNotificatioForTapToRadar
{
  return [(BRCUserDefaults *)self BOOLForKey:@"fpfs.show-notification-for-tap-to-radar" byDefault:1];
}

- (BOOL)showNotificatioForRadarURL
{
  return [(BRCUserDefaults *)self BOOLForKey:@"fpfs.show-notification-for-radar-url" byDefault:1];
}

- (double)throttleThresholdBeforeImmediatelyFailingNonDiscretionaryOp
{
  [(BRCUserDefaults *)self doubleForKey:@"sync.throttle-threshold-before-immediately-failing-non-discretionary-op" min:0.0 max:1.79769313e308 byDefault:10.0];
  return result;
}

- (double)throttleThresholdToBlockExistingOpOnNewOp
{
  [(BRCUserDefaults *)self doubleForKey:@"sync.throttle-threshold-to-block-existing-op-on-new-op" min:0.0 max:1.79769313e308 byDefault:0.0];
  return result;
}

- (NSSet)ignoredCKErrorsForABC
{
  return (NSSet *)[(BRCUserDefaults *)self _brErrorSetForKey:@"abc.ignored-ck-errors" byDefault:&unk_1F2B27870];
}

- (BOOL)ignoreCKCZMigrationAlreadyDoneErrorForABC
{
  return [(BRCUserDefaults *)self BOOLForKey:@"abc.ignore-ck-cz-migration-already-done-error" byDefault:1];
}

- (BOOL)ignoreCKMMCSItemNotAvailableErrorForABC
{
  return [(BRCUserDefaults *)self BOOLForKey:@"abc.ignore-ck-mmcs-item-not-available-error" byDefault:1];
}

- (BOOL)shouldBoostDefaultZone
{
  if ([(NSString *)self->_clientZoneIdentifier isEqualToString:*MEMORY[0x1E4F59398]])
  {
    return [(BRCUserDefaults *)self BOOLForKey:@"should-boost-defaultZone" inheritFromGlobal:0 byDefault:0];
  }
  else
  {
    return [(BRCUserDefaults *)self BOOLForKey:@"should-boost-defaultZone" byDefault:1];
  }
}

- (unint64_t)xpcConnectionFailureRetries
{
  return [(BRCUserDefaults *)self unsignedIntForKey:@"xpc-connection-failure-retries" min:1 max:100 byDefault:5];
}

- (BOOL)shouldPurgeUploadsOnDeviceIDChange
{
  return [(BRCUserDefaults *)self BOOLForKey:@"account-session.should.purge.uploads.on.deviceid.change" byDefault:1];
}

- (NSString)dumpDateFormat
{
  return (NSString *)[(BRCUserDefaults *)self stringForKey:@"dump.date.format" byDefault:@"yyyy-MM-dd HH:mm:ss.SSS"];
}

- (NSDateFormatter)dumpDateFormatter
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __36__BRCUserDefaults_dumpDateFormatter__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  if (dumpDateFormatter_onceToken != -1) {
    dispatch_once(&dumpDateFormatter_onceToken, block);
  }
  return (NSDateFormatter *)(id)dumpDateFormatter_df;
}

void __36__BRCUserDefaults_dumpDateFormatter__block_invoke(uint64_t a1)
{
  id v2 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  BOOL v3 = (void *)dumpDateFormatter_df;
  dumpDateFormatter_df = (uint64_t)v2;

  uint64_t v4 = (void *)dumpDateFormatter_df;
  id v5 = [*(id *)(a1 + 32) dumpDateFormat];
  [v4 setDateFormat:v5];
}

- (BOOL)shouldSendTelemetryOnCollaborationAPIs
{
  return [(BRCUserDefaults *)self BOOLForKey:@"collaboration-api-send-telemetry" byDefault:1];
}

- (NSSet)resetReasonsToTriggerTTR
{
  return (NSSet *)[(BRCUserDefaults *)self _extensionSetForKey:@"reset.reasons.to.trigger.ttr" startingWithExtensions:&unk_1F2B27888];
}

- (BOOL)fpfsSpeculativeSetDownload
{
  return [(BRCUserDefaults *)self BOOLForKey:@"fpfs.speculative-set-download" byDefault:1];
}

- (double)periodicSyncNetworkUnreachableMinThreshold
{
  [(BRCUserDefaults *)self doubleForKey:@"periodic-sync.net-unreachable-min-threshold" min:0.0 max:1.79769313e308 byDefault:3600.0];
  return result;
}

- (double)periodicSyncNetworkStableMinThreshold
{
  [(BRCUserDefaults *)self doubleForKey:@"periodic-sync.net-stable-min-threshold" min:0.0 max:1.79769313e308 byDefault:60.0];
  return result;
}

- (double)periodicSyncAppLibraryLastBoostMinThreshold
{
  [(BRCUserDefaults *)self doubleForKey:@"periodic-sync.applibrary-last-boost-min-threshold" min:0.0 max:1.79769313e308 byDefault:10800.0];
  return result;
}

- (double)periodicSyncScreenUnlockedMinThreshold
{
  [(BRCUserDefaults *)self doubleForKey:@"periodic-sync.screen-unlocked-min-threshold" min:0.0 max:1.79769313e308 byDefault:120.0];
  return result;
}

- (double)periodicSyncTimeInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"periodic-sync.time-interval" min:0.0 max:1.79769313e308 byDefault:21600.0];
  return result;
}

- (double)periodicSyncAutoTriggerTimeInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"periodic-sync.auto-trigger-time-interval" min:0.0 max:1.79769313e308 byDefault:86400.0];
  return result;
}

- (double)dbFixupContentPolicyRecoverAfterTimeInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"db-fixup.content-policy-recover" min:0.0 max:1.79769313e308 byDefault:60.0];
  return result;
}

- (BOOL)checkBRCTLTCCAccessOnInternalBuild
{
  return [(BRCUserDefaults *)self BOOLForKey:@"tcc-check-brctl-access-on-internal" byDefault:0];
}

- (BOOL)handleUnloadedZones
{
  return [(BRCUserDefaults *)self BOOLForKey:@"account-session.should.handle.unloaded.zones" byDefault:1];
}

- (BOOL)finishSaltingPartiallySaltedDirectories
{
  return [(BRCUserDefaults *)self BOOLForKey:@"edp.aggressive-salting" byDefault:1];
}

- (double)buddyFlowObserverRefreshTimerInterval
{
  [(BRCUserDefaults *)self doubleForKey:@"buddy-flow-observer-refresh-delay" min:5.0 max:1.79769313e308 byDefault:60.0];
  return result;
}

- (double)secondsToWaitBeforeSendingReimportDomainFailureTTR
{
  [(BRCUserDefaults *)self doubleForKey:@"seconds-to-wait-before-sending-reimport-domain-failure-TTR" min:10.0 max:3600.0 byDefault:60.0];
  return result;
}

- (double)zoneAutoResetDelayInSecAfterAppUninstall
{
  [(BRCUserDefaults *)self doubleForKey:@"zone-auto-reset-delay-after-app-uninstall" min:600.0 max:86400.0 byDefault:3600.0];
  return result;
}

- (void)intForKey:min:max:byDefault:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: def <= max%@", v2, v3, v4, v5, v6);
}

- (void)intForKey:min:max:byDefault:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: min <= def%@", v2, v3, v4, v5, v6);
}

- (void)intForKey:min:max:byDefault:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: min < max%@", v2, v3, v4, v5, v6);
}

- (void)_shouldRampForKey:session:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] We are not denylisted from %@%@");
}

- (void)_shouldRampForKey:session:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] We are not denylisted from %@ chaining because we are in carry%@");
}

- (void)_shouldRampForKey:session:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] We are not denylisted from %@ because we are on an internal build%@");
}

- (void)_shouldRampForKey:session:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] We are not denylisted from %@ because we are on an internal build and in carry%@");
}

@end