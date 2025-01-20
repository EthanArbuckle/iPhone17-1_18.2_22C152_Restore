@interface BRCAccountSession
+ (BOOL)_checkIntegrity:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 skipControlFiles:(BOOL)a6 deviceIDChanged:(BOOL *)a7 error:(id *)a8;
+ (BOOL)_openConnection:(id)a3 databaseName:(id)a4 baseURL:(id)a5 readonly:(BOOL)a6 error:(id *)a7;
+ (BOOL)_openConnection:(id)a3 serverTruth:(BOOL)a4 databaseName:(id)a5 baseURL:(id)a6 initialVersion:(unsigned int *)a7 lastCurrentVersion:(unsigned int *)a8 error:(id *)a9;
+ (BOOL)_registerStaticDBFunctions:(id)a3 error:(id *)a4;
+ (BOOL)_validateDatabase:(id)a3 baseURL:(id)a4 session:(id)a5 serverTruth:(BOOL)a6 initialVersion:(unsigned int)a7 lastCurrentVersion:(unsigned int)a8 error:(id *)a9;
+ (BOOL)openAndValidateDatabase:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 baseURL:(id)a6 skipControlFiles:(BOOL)a7 initialVersion:(unsigned int *)a8 lastCurrentVersion:(unsigned int *)a9 deviceIDChanged:(BOOL *)a10 error:(id *)a11;
+ (BOOL)upgradeOfflineDB:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 error:(id *)a6;
+ (id)_classesForClientState;
+ (id)nameComponentsForKey:(id)a3 db:(id)a4;
+ (id)nameComponentsForName:(id)a3 db:(id)a4;
+ (id)sessionForBackingUpDatabasesAtURL:(id)a3;
+ (id)sessionForCheckingInconsistencies;
+ (id)sessionForDumpingDatabasesAtURL:(id)a3;
+ (id)sessionForDumpingDatabasesAtURL:(id)a3 with:(id)a4;
+ (id)sessionForSendingTelemetryAtURL:(id)a3;
+ (id)userIdentityForKey:(id)a3 db:(id)a4;
+ (id)userIdentityForName:(id)a3 db:(id)a4;
+ (void)_registerLastBootIfNeeded:(id)a3 table:(id)a4 skipControlFiles:(BOOL)a5 deviceIDChanged:(BOOL *)a6;
- (BOOL)PCSMigrationComplete;
- (BOOL)_createAppLibrary:(id)a3;
- (BOOL)_createAppLibraryRootIfNeededAtPath:(id)a3 error:(id *)a4;
- (BOOL)_createAppLibraryRootsIfNeededWithError:(id *)a3;
- (BOOL)_createClientZone:(id)a3;
- (BOOL)_deleteAppLibrary:(id)a3;
- (BOOL)_deleteClientZone:(id)a3;
- (BOOL)_dumpClientZone:(id)a3 toContext:(id)a4 includeAllItems:(BOOL)a5 error:(id *)a6;
- (BOOL)_dumpClientZoneStatus:(id)a3 toContext:(id)a4 error:(id *)a5;
- (BOOL)_finishClientTruthConnectionSetupWithError:(id *)a3;
- (BOOL)_finishServerTruthConnectionSetupWithError:(id *)a3;
- (BOOL)_getRootPathXattrValue:(id *)a3 forRootPath:(id)a4 error:(id *)a5;
- (BOOL)_openConnection:(id)a3 databaseName:(id)a4 readonly:(BOOL)a5 error:(id *)a6;
- (BOOL)_recursivelyPrepareFolderForLogOutAtURL:(id)a3 pruneEmptyFolders:(BOOL)a4 pruneEmptyTopLevelFolder:(BOOL)a5 maxDepth:(unint64_t)a6;
- (BOOL)_registerDynamicDBFunctions:(id)a3 error:(id *)a4;
- (BOOL)_setupBackupDetector:(backup_detector *)a3 error:(id *)a4;
- (BOOL)_setupConnection:(id)a3 readonly:(BOOL)a4 forChecker:(BOOL)a5 error:(id *)a6;
- (BOOL)_shouldPrivateAppLibraryBeCZMMoved:(id)a3;
- (BOOL)_stepBackupDetector:(backup_detector *)a3 newState:(backup_detector *)a4 error:(id *)a5;
- (BOOL)applySyncPolicy:(int64_t)a3 forSyncedFolderType:(unint64_t)a4 isInitialCreation:(BOOL)a5 error:(id *)a6;
- (BOOL)backupDatabaseToURL:(id)a3 error:(id *)a4;
- (BOOL)backupDatabaseToURL:(id)a3 includeServer:(BOOL)a4 doNotObfuscate:(BOOL)a5 error:(id *)a6;
- (BOOL)createAppLibrariesIfNeededWithError:(id *)a3;
- (BOOL)createAppLibraryOnDisk:(id)a3 createdRoot:(BOOL *)a4 createdDocuments:(BOOL *)a5 rootFileID:(unint64_t *)a6;
- (BOOL)createServerZone:(id)a3;
- (BOOL)deleteServerZone:(id)a3;
- (BOOL)dumpDatabaseToFileHandle:(id)a3 zoneName:(id)a4 includeAllItems:(BOOL)a5 verbose:(BOOL)a6 tracker:(id)a7 error:(id *)a8;
- (BOOL)dumpFPFSMigrationStatusToFileHandle:(id)a3 tracker:(id)a4 includeNonMigratedItems:(BOOL)a5 error:(id *)a6;
- (BOOL)dumpFileCoordinationInfoToFileHandle:(id)a3 error:(id *)a4;
- (BOOL)dumpItemsToHandle:(id)a3 itemType:(id)a4 tracker:(id)a5 error:(id *)a6;
- (BOOL)dumpItemsURLsToHandle:(id)a3 itemRowIDs:(id)a4 error:(id *)a5;
- (BOOL)dumpStatusToFileHandle:(id)a3 zoneName:(id)a4 tracker:(id)a5 error:(id *)a6;
- (BOOL)enableSyncforSyncedFolderType:(unint64_t)a3 isInitialCreation:(BOOL)a4 error:(id *)a5;
- (BOOL)enumerateItemsWithType:(id)a3 itemRowIDs:(id)a4 db:(id)a5 withBlock:(id)a6;
- (BOOL)enumerateSharedToMeItemsWithBlock:(id)a3 error:(id *)a4;
- (BOOL)globalID:(id)a3 isStrictChildOfGlobalID:(id)a4;
- (BOOL)hasFSEventsMonitorForSyncedFolderType:(unint64_t)a3;
- (BOOL)hasOptimizeStorageEnabled;
- (BOOL)hasRootForSyncedFolderType:(unint64_t)a3;
- (BOOL)icloudAccountIsInCarry;
- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 error:(id *)a4;
- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 loadClientState:(BOOL)a4 error:(id *)a5;
- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 loadClientState:(BOOL)a4 forDBDump:(BOOL)a5 error:(id *)a6;
- (BOOL)isCancelled;
- (BOOL)isDataSeparated;
- (BOOL)isGreedy;
- (BOOL)isOpen;
- (BOOL)offline;
- (BOOL)openAndValidateDatabase:(id)a3 serverTruth:(BOOL)a4 initialVersion:(unsigned int *)a5 lastCurrentVersion:(unsigned int *)a6 deviceIDChanged:(BOOL *)a7 error:(id *)a8;
- (BOOL)openDBWithError:(id *)a3;
- (BOOL)openWithError:(id *)a3 pushWorkloop:(id)a4;
- (BOOL)registerClient:(id)a3;
- (BOOL)saveAppLibrary:(id)a3 toDB:(id)a4;
- (BOOL)saveAppLibrary:(id)a3 toDB:(id)a4 supportsEnhancedDrivePrivacy:(BOOL)a5;
- (BOOL)saveAppLibraryToDB:(id)a3;
- (BOOL)saveClientZoneToDB:(id)a3;
- (BOOL)saveServerZone:(id)a3 toDB:(id)a4;
- (BOOL)saveServerZoneToDB:(id)a3;
- (BOOL)shouldPathBeDesktopSymlink:(id)a3;
- (BOOL)shouldPerformPCSMigration;
- (BRCAccountHandler)accountHandler;
- (BRCAccountSession)init;
- (BRCAccountSession)initWithACAccountID:(id)a3 dbAccountDSID:(id)a4 salt:(id)a5 accountHandler:(id)a6;
- (BRCAccountWaitOperation)accountWaitOperation;
- (BRCAnalyticsReporter)analyticsReporter;
- (BRCApplyScheduler)applyScheduler;
- (BRCBarrier)dbLoadingBarrier;
- (BRCClientState)clientState;
- (BRCContainerScheduler)containerScheduler;
- (BRCDeadlineScheduler)defaultScheduler;
- (BRCDiskSpaceReclaimer)diskReclaimer;
- (BRCDownloadStagingProtocol)downloadStager;
- (BRCDownloadTrackers)downloadTrackers;
- (BRCFSDownloader)fsDownloader;
- (BRCFSReader)fsReader;
- (BRCFSUploader)fsUploader;
- (BRCFSWriter)fsWriter;
- (BRCFairScheduler)fairClientDBScheduler;
- (BRCFileUnlinker)fileUnlinker;
- (BRCGlobalProgress)globalProgress;
- (BRCItemTransmogrifier)itemTransmogrifier;
- (BRCNotificationManager)notificationManager;
- (BRCPQLConnection)clientDB;
- (BRCPQLConnection)expensiveReadOnlyDB;
- (BRCPQLConnection)readOnlyDB;
- (BRCPQLConnection)serverDB;
- (BRCRecentsEnumerator)recentsEnumerator;
- (BRCServerPersistedState)serverState;
- (BRCStageRegistry)stageRegistry;
- (BRCSyncContextProvider)syncContextProvider;
- (BRCSyncUpScheduler)syncUpScheduler;
- (BRCSyncUpStagingProtocol)syncUpStager;
- (BRCTapToRadarManager)tapToRadarManager;
- (BRCThrottle)appLibraryAliasRemovalThrottle;
- (BRCThrottle)appLibraryResetThrottle;
- (BRCThrottle)appLibraryScanThrottle;
- (BRCThrottle)lostItemThrottle;
- (BRCThrottle)operationFailureThrottle;
- (BRCThrottle)sharedAppLibraryResetThrottle;
- (BRCThrottle)syncClientZoneErrorThrottle;
- (BRCThrottle)syncClientZoneThrottle;
- (BRCTimerScheduler)autoResumeSyncTimerScheduler;
- (BRCUserNotification)userNotification;
- (BRCVolume)volume;
- (BRDSIDString)accountDSID;
- (NSFileProviderDomain)fpDomain;
- (NSString)cacheDirPath;
- (NSString)databaseID;
- (NSString)description;
- (NSString)personaIdentifier;
- (NSString)sessionDirPath;
- (NSString)ubiquityTokenSalt;
- (OS_dispatch_queue)dbFixupQueue;
- (OS_dispatch_queue)resetQueue;
- (OS_dispatch_workloop)clientTruthWorkloop;
- (OS_dispatch_workloop)readOnlyWorkloop;
- (OS_dispatch_workloop)serverTruthWorkloop;
- (id)__getOrCreateAppLibrary:(id)a3 rowID:(id)a4 createOnDisk:(BOOL)a5 alreadyExists:(BOOL *)a6 withClientZone:(id)a7 createCZMMoved:(BOOL)a8;
- (id)__getOrCreateClientZone:(id)a3 withServerZone:(id)a4 alreadyExists:(BOOL *)a5;
- (id)__getOrCreateServerZone:(id)a3;
- (id)_appLibrariesEnumerator:(id)a3;
- (id)_appLibrariesEnumerator:(id)a3 version:(int)a4;
- (id)_appLibrariesMatchingSearchString:(id)a3;
- (id)_appLibraryByName:(id)a3 db:(id)a4;
- (id)_clientZonesMatchingSearchString:(id)a3;
- (id)_computePathOfItemWithName:(id)a3 appLibrary:(id)a4 parentClientZoneRowID:(id)a5 parentID:(id)a6 type:(char)a7 needsLocalName:(BOOL)a8 db:(id)a9;
- (id)_containerMetadataRecordsToSaveWithBatchSize:(unint64_t)a3 requestID:(unint64_t)a4;
- (id)_getFPFSMigrationStatus:(id)a3 withError:(id *)a4;
- (id)_getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3 creationFlags:(unsigned int *)a4;
- (id)_getPartiallySaltedItemWithAppLibrary:(id)a3;
- (id)_old_privateAppLibraryByZoneName:(id)a3 db:(id)a4;
- (id)_prepareXPCActivityIdentifierWithName:(id)a3;
- (id)_privateClientZoneByID:(id)a3 db:(id)a4;
- (id)_privateClientZoneByName:(id)a3 db:(id)a4;
- (id)_privateClientZonesEnumerator;
- (id)_privateServerZoneByName:(id)a3 db:(id)a4;
- (id)_privateServerZonesEnumerator:(id)a3;
- (id)_reserveRowIDForLibrary:(id)a3;
- (id)_sharedClientZonesEnumerator;
- (id)_sharedServerZoneByName:(id)a3 ownerName:(id)a4 db:(id)a5;
- (id)_sharedServerZonesEnumerator:(id)a3;
- (id)_unloadClientZones;
- (id)accountStatisticsWithDB:(id)a3;
- (id)appLibraries;
- (id)appLibrariesMatchingSearchString:(id)a3 error:(id *)a4;
- (id)appLibraryByID:(id)a3;
- (id)appLibraryByMangledID:(id)a3;
- (id)appLibraryByRowID:(id)a3;
- (id)bouncedItemsEnumerator;
- (id)cachedCurrentUserRecordName;
- (id)cachedCurrentUserRecordNameIfExists;
- (id)clientZoneByMangledID:(id)a3;
- (id)clientZones;
- (id)clientZonesMatchingSearchString:(id)a3 error:(id *)a4;
- (id)cloudDocsClientZone;
- (id)createDeviceKeyForNameInServerDB:(id)a3;
- (id)createFSEventsMonitorForSyncedFolderType:(unint64_t)a3;
- (id)createRootForSyncedFolderType:(unint64_t)a3;
- (id)createUserKeyForOwnerName:(id)a3;
- (id)deviceKeyForName:(id)a3 db:(id)a4;
- (id)dirPathForSyncedFolderType:(unint64_t)a3;
- (id)fallbackAppLibraryForClientZone:(id)a3 extension:(id)a4;
- (id)fetchAccountWaitOperationWithAccountReady:(BOOL *)a3;
- (id)fixObfuscatedMangledID:(id)a3;
- (id)foldersNeedingTransmogrifyEnumerator;
- (id)fsEventsMonitorForAppLibraryID:(id)a3;
- (id)fsEventsMonitorForSyncedFolderType:(unint64_t)a3;
- (id)fsEventsMonitors;
- (id)getFPFSNonMigratedItemsWithDB:(id)a3;
- (id)getMiscOperations;
- (id)getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3;
- (id)getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3 appLibraryExists:(BOOL *)a4;
- (id)getOrCreateSharedZones:(id)a3;
- (id)getOrCreateSharedZones:(id)a3 shareAcceptOp:(id)a4;
- (id)getOrReserveLibraryRowIDForLibrary:(id)a3;
- (id)globalItemByDocumentID:(unsigned int)a3;
- (id)globalItemByDocumentID:(unsigned int)a3 db:(id)a4;
- (id)globalItemByFileID:(unint64_t)a3;
- (id)globalItemByFileID:(unint64_t)a3 db:(id)a4;
- (id)itemByFileObjectID:(id)a3;
- (id)itemByFileObjectID:(id)a3 db:(id)a4;
- (id)itemByItemGlobalID:(id)a3;
- (id)itemByItemGlobalID:(id)a3 db:(id)a4;
- (id)itemByRowID:(unint64_t)a3;
- (id)itemByRowID:(unint64_t)a3 db:(id)a4;
- (id)itemIDByRowID:(unint64_t)a3;
- (id)itemIDByRowID:(unint64_t)a3 db:(id)a4;
- (id)itemsNeedingIndexingEnumeratorFromNotifRank:(unint64_t)a3 batchSize:(unint64_t)a4 db:(id)a5;
- (id)itemsWithSideCarInFlightDiffsEnumerator;
- (id)localAliasForSharedItem:(id)a3 inZone:(id)a4;
- (id)newAppLibraryFromPQLResultSet:(id)a3 version:(int)a4;
- (id)newConnection:(id)a3;
- (id)newConnectionWithLabel:(id)a3 readonly:(BOOL)a4 error:(id *)a5;
- (id)newLocalItemFromPQLResultSet:(id)a3 db:(id)a4 error:(id *)a5;
- (id)newPrivateClientZoneFromPQLResultSet:(id)a3 error:(id *)a4;
- (id)newPrivateServerZoneFromPQLResultSet:(id)a3 error:(id *)a4;
- (id)newServerItemFromPQLResultSet:(id)a3 error:(id *)a4;
- (id)newSharedClientZoneFromPQLResultSet:(id)a3 error:(id *)a4;
- (id)newSharedServerZoneFromPQLResultSet:(id)a3 error:(id *)a4;
- (id)privateClientZoneByID:(id)a3;
- (id)privateServerZoneByID:(id)a3;
- (id)resolvedOpenRelpathForPath:(id)a3 mustExist:(BOOL)a4 allowResolveInPkg:(BOOL)a5 errcode:(int *)a6;
- (id)resolvedOpenRelpathForPath:(id)a3 mustExist:(BOOL)a4 errcode:(int *)a5;
- (id)rootForSyncedFolderType:(unint64_t)a3;
- (id)roots;
- (id)serverAliasItemForSharedItem:(id)a3;
- (id)serverAliasItemForSharedItem:(id)a3 db:(id)a4;
- (id)serverAliasItemForSharedItem:(id)a3 inZone:(id)a4;
- (id)serverAliasItemForSharedItem:(id)a3 inZone:(id)a4 db:(id)a5;
- (id)serverZoneByCKZoneID:(id)a3;
- (id)serverZoneByMangledID:(id)a3;
- (id)serverZoneByName:(id)a3 ownerName:(id)a4;
- (id)serverZoneByRowID:(id)a3;
- (id)sharedClientZoneByMangledID:(id)a3;
- (id)sharedServerZoneByMangledID:(id)a3;
- (id)sharedServerZoneRowIDsByOwnerNamePrefix:(id)a3;
- (id)singleAppLibraryMatchingSearchString:(id)a3 error:(id *)a4;
- (id)singleClientZoneMatchingSearchString:(id)a3 error:(id *)a4;
- (id)stagedItemsEnumerator;
- (id)userIdentityForKey:(id)a3;
- (id)userKeyForOwnerName:(id)a3 db:(id)a4;
- (id)userNameForKey:(id)a3 db:(id)a4;
- (int)_resolveDeviceID;
- (int)resolvePathAdditionalMetadata:(id)a3 appLibrary:(id *)a4;
- (int64_t)lastBootHistoryTime;
- (unint64_t)accountSize;
- (unint64_t)availableDiskSpace;
- (unint64_t)availableDiskSpaceUsingCache:(BOOL)a3;
- (unint64_t)availableDiskSpaceUsingCache:(BOOL)a3 schedulingPendingDiskItemsIfNeeded:(BOOL)a4;
- (unint64_t)computeTotalLiveDocumentSizeWithDb:(id)a3;
- (unint64_t)databaseIDHash;
- (unint64_t)syncedFolderTypeForURL:(id)a3;
- (unsigned)_recoverAndReportBoosting;
- (unsigned)_recoverAndReportBrokenShareOptions;
- (unsigned)_reportBasehashSalting;
- (void)__registerServerZone:(id)a3 clientZone:(id)a4 appLibrary:(id)a5 isShared:(BOOL)a6;
- (void)_cleanupOldCiconiaLocations;
- (void)_clearNeedsUpgradeErrorsWithBrVersion:(id)a3;
- (void)_closeSharedPackageExtensionsPlist;
- (void)_cloudDocsAppsListDidChange:(id)a3;
- (void)_createAccountSupportPathIfNeeded:(id)a3 protectParent:(BOOL)a4;
- (void)_destroyLocalDataWaitingForFilesToBeUnlinked:(BOOL)a3 pristineContainerIDs:(id)a4 completionBlock:(id)a5;
- (void)_dumpClientZoneBlockedState:(id)a3 toContext:(id)a4;
- (void)_enumerateAccountHandlerSupportedFolderTypes:(id)a3;
- (void)_enumerateAppLibraryRowIDs:(id)a3 usingBlock:(id)a4;
- (void)_fixupItemsAtStartup;
- (void)_handleUnloadedZones:(id)a3;
- (void)_loadClientStateFromDB:(id)a3;
- (void)_loadClientZonesFromDisk;
- (void)_markDBOpened;
- (void)_mutexZonesLock;
- (void)_pcsChainAllItemsWithActivity:(id)a3;
- (void)_recoverAndReportStateIntegrityWithCompletion:(id)a3;
- (void)_recreateSymlinkIfNecessaryForDocumentsPath:(id)a3 folderName:(id)a4 destinationPath:(id)a5;
- (void)_refreshRootsCache;
- (void)_registerBackgroundXPCActivities;
- (void)_registerObfuscationFunction:(id)a3;
- (void)_resolvePathInMobileDocsRoot:(id)a3 appLibrary:(id *)a4;
- (void)_saltPartiallySaltedItemsWithActivity:(id)a3;
- (void)_setDatabaseProfilingForDB:(id)a3 enabled:(BOOL)a4 verbose:(BOOL)a5;
- (void)_setUserIdentity:(id)a3 forName:(id)a4;
- (void)_setupSharedPackageExtensionsPlist;
- (void)_setupThrottles;
- (void)_startWatcher;
- (void)_submitDBCorruptionTelemetryEventIfNeeded;
- (void)_submitDelayedTelemetryEventIfNeeded:(id)a3 wait:(double)a4 withBlock:(id)a5;
- (void)_submitReimportDomainFailedTelemetryEventIfNeeded;
- (void)_submitSessionOpenFailedTelemetryEventIfNeeded;
- (void)_unlinkContainersWithRootURL:(id)a3;
- (void)_validatePersona;
- (void)accountWaitOperation;
- (void)addMiscOperation:(id)a3;
- (void)addOfflineAppLibrary:(id)a3;
- (void)addOfflineClientZone:(id)a3;
- (void)addOfflineServerZone:(id)a3;
- (void)applyScheduler;
- (void)assertNotOnZoneMutex;
- (void)autoResumeSyncTimerScheduler;
- (void)availableDiskSpaceDidChange;
- (void)bumpNotificationRankOnItemGlobalID:(id)a3;
- (void)cacheDirPath;
- (void)cachedCurrentUserRecordName;
- (void)captureDBCorruptionInfoWithDescription:(id)a3 error:(id)a4;
- (void)captureSessionOpenFailedInfoWithError:(id)a3;
- (void)close;
- (void)closeAndResetLocalStateWithDescription:(id)a3 error:(id)a4;
- (void)closeDBs;
- (void)closeXPCClientsSync;
- (void)cloudDocsAppsListDidChange:(id)a3;
- (void)computeDocumentEvictableSizesForLowTime:(unint64_t)a3 medTime:(unint64_t)a4 highTime:(unint64_t)a5 lowSize:(unint64_t)a6 medSize:(unint64_t)a7 highSize:(unint64_t)a8 minRowID:(unint64_t)a9 minSize:(unint64_t)a10 batchSize:(unint64_t)a11 injection:(id)a12 db:(id)a13 reply:(id)a14;
- (void)computeTotalEvictableSizeWithAccessLowTimeDelta:(double)a3 medTimeDelta:(double)a4 highTimeDelta:(double)a5 db:(id)a6 reply:(id)a7;
- (void)containerScheduler;
- (void)dbBecameCorruptedWithDescription:(id)a3 error:(id)a4;
- (void)dealloc;
- (void)destroyLocalData;
- (void)destroyLocalDataWaitingForFilesToBeUnlinked:(BOOL)a3 completionBlock:(id)a4;
- (void)destroyLocalDataWithPristineContainerIDs:(id)a3;
- (void)destroySharedClientZone:(id)a3;
- (void)disableDatabaseProfilingForDB:(id)a3;
- (void)dumpMiscOperationsToContext:(id)a3;
- (void)dumpXPCClientsToContext:(id)a3;
- (void)enableDatabaseProfilingForDB:(id)a3;
- (void)enumerateAppLibraries:(id)a3;
- (void)enumerateClientZones:(id)a3;
- (void)enumerateContainersWithDB:(id)a3 handler:(id)a4;
- (void)enumerateFileTypesWithFilterBlock:(id)a3 enumerationBlock:(id)a4;
- (void)enumerateItemsWithShareIDUnderParent:(id)a3 block:(id)a4;
- (void)enumeratePrivateClientZones:(id)a3;
- (void)enumeratePrivateServerZones:(id)a3;
- (void)enumerateServerZones:(id)a3;
- (void)enumerateSharedClientZones:(id)a3;
- (void)enumerateSideFaultsUnderParent:(id)a3 db:(id)a4 block:(id)a5;
- (void)enumerateSupportedFolderTypes:(id)a3;
- (void)fetchUserRecordIDWithCompletionHandler:(id)a3;
- (void)fsReader;
- (void)fsWriter;
- (void)invalidateAccountStatus;
- (void)isGreedy;
- (void)learnParticipantIdentitiesForShare:(id)a3 forceUpdate:(BOOL)a4;
- (void)markAccountMigrationComplete;
- (void)notificationManager;
- (void)openForDumping;
- (void)openForSendingTelemetry;
- (void)performBlock:(id)a3 whileRemovingPrivateClientZone:(id)a4;
- (void)preventDatabaseFromBeingReused;
- (void)recomputeAppSyncBlockStateForPrivateClientZone:(id)a3;
- (void)removeDesktopSymlink:(BOOL)a3 andDocumentsSymlink:(BOOL)a4;
- (void)removeFSEventsMonitorForSyncedFolderType:(unint64_t)a3;
- (void)removeRootForSyncedFolderType:(unint64_t)a3;
- (void)resetThrottles;
- (void)resumeIfNecessary;
- (void)scheduleZoneMovesToCloudDocs:(id)a3;
- (void)sessionDirPath;
- (void)setCacheDirPath:(id)a3;
- (void)setFSEventsMonitor:(id)a3 forSyncedFolderType:(unint64_t)a4;
- (void)setFpDomain:(id)a3;
- (void)setNeedsPCSMigration:(BOOL)a3;
- (void)setOptimizeStorageEnabled:(BOOL)a3 forKey:(id)a4 synchronous:(BOOL)a5;
- (void)setOptimizeStorageEnabled:(BOOL)a3 synchronous:(BOOL)a4;
- (void)setRoot:(id)a3 forSyncedFolderType:(unint64_t)a4;
- (void)setSessionDirPath:(id)a3;
- (void)setupDatabase;
- (void)stageRegistry;
- (void)startDownloadsForGreediness;
- (void)stopDBWatcher;
- (void)unregisterClient:(id)a3;
@end

@implementation BRCAccountSession

- (void)addOfflineServerZone:(id)a3
{
  id v18 = a3;
  p_zonesLock = &self->_zonesLock;
  brc_mutex_lock(&self->_zonesLock.pthread);
  if (!self->_serverZonesByZoneRowID)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
    self->_serverZonesByZoneRowID = v5;
  }
  v7 = v18;
  if (!self->_sharedServerZonesByMangledID)
  {
    v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
    self->_sharedServerZonesByMangledID = v8;

    v7 = v18;
  }
  if (!self->_privateServerZonesByID)
  {
    v10 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    privateServerZonesByID = self->_privateServerZonesByID;
    self->_privateServerZonesByID = v10;

    v7 = v18;
  }
  [v7 setSession:self];
  v12 = self->_serverZonesByZoneRowID;
  v13 = [v18 dbRowID];
  [(NSMutableDictionary *)v12 setObject:v18 forKeyedSubscript:v13];

  if ([v18 isSharedZone])
  {
    v14 = self->_sharedServerZonesByMangledID;
    v15 = [v18 asSharedZone];
    v16 = [v15 mangledID];
    [(NSMutableDictionary *)v14 setObject:v18 forKeyedSubscript:v16];
  }
  else
  {
    v17 = self->_privateServerZonesByID;
    v15 = [v18 zoneName];
    [(NSMutableDictionary *)v17 setObject:v18 forKeyedSubscript:v15];
  }

  brc_mutex_unlock(&p_zonesLock->pthread);
}

- (void)addOfflineClientZone:(id)a3
{
  id v14 = a3;
  p_zonesLock = &self->_zonesLock;
  brc_mutex_lock(&self->_zonesLock.pthread);
  if (!self->_privateClientZonesByID)
  {
    v5 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    privateClientZonesByID = self->_privateClientZonesByID;
    self->_privateClientZonesByID = v5;
  }
  if (!self->_sharedClientZonesByMangledID)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
    self->_sharedClientZonesByMangledID = v7;
  }
  [v14 setSession:self];
  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  v10 = [v14 dbRowID];
  v11 = [(NSMutableDictionary *)serverZonesByZoneRowID objectForKeyedSubscript:v10];

  if (v11) {
    [v14 associateWithServerZone:v11 offline:1];
  }
  if ([v14 isSharedZone])
  {
    v12 = self->_sharedClientZonesByMangledID;
    [v14 mangledID];
  }
  else
  {
    v12 = self->_privateClientZonesByID;
    [v14 zoneName];
  v13 = };
  [(NSMutableDictionary *)v12 setObject:v14 forKeyedSubscript:v13];

  brc_mutex_unlock(&p_zonesLock->pthread);
}

- (void)addOfflineAppLibrary:(id)a3
{
  p_zonesLock = &self->_zonesLock;
  id v5 = a3;
  brc_mutex_lock(&p_zonesLock->pthread);
  appLibrariesByRowID = self->_appLibrariesByRowID;
  if (!appLibrariesByRowID)
  {
    v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    v8 = self->_appLibrariesByRowID;
    self->_appLibrariesByRowID = v7;

    appLibrariesByRowID = self->_appLibrariesByRowID;
  }
  v9 = [v5 dbRowID];
  [(NSMutableDictionary *)appLibrariesByRowID setObject:v5 forKeyedSubscript:v9];

  brc_mutex_unlock(&p_zonesLock->pthread);
}

- (OS_dispatch_workloop)clientTruthWorkloop
{
  return self->_clientTruthWorkloop;
}

- (OS_dispatch_workloop)readOnlyWorkloop
{
  return self->_readOnlyWorkloop;
}

- (OS_dispatch_workloop)serverTruthWorkloop
{
  return self->_serverTruthWorkloop;
}

- (unint64_t)databaseIDHash
{
  return [(NSString *)self->_databaseID hash];
}

- (BRCClientState)clientState
{
  return self->_clientState;
}

- (BRCServerPersistedState)serverState
{
  return self->_serverState;
}

- (BRCPQLConnection)clientDB
{
  return self->_clientDB;
}

- (BRCPQLConnection)serverDB
{
  return self->_serverDB;
}

- (BRCPQLConnection)readOnlyDB
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_readOnlyDB;
  if (v3)
  {
    v4 = v3;
    id v5 = v4;
  }
  else
  {
    id v12 = 0;
    v4 = [(BRCAccountSession *)v2 newConnectionWithLabel:@"readonly-interactive-db" readonly:1 error:&v12];
    id v6 = v12;
    if (v4)
    {
      v7 = [(BRCAccountSession *)v2 readOnlyWorkloop];
      [(BRCPQLConnection *)v4 useSerialQueueWithTarget:v7];

      objc_storeStrong((id *)&v2->_readOnlyDB, v4);
      clientDB = v4;
    }
    else
    {
      v9 = brc_bread_crumbs();
      v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSession(BRCDatabaseManager) readOnlyDB]();
      }

      clientDB = v2->_clientDB;
    }
    id v5 = clientDB;
  }
  objc_sync_exit(v2);

  return v5;
}

- (BRCPQLConnection)expensiveReadOnlyDB
{
  v2 = self;
  objc_sync_enter(v2);
  v3 = v2->_expensiveReadOnlyDB;
  if (v3)
  {
    v4 = v3;
    id v5 = v4;
  }
  else
  {
    id v12 = 0;
    v4 = [(BRCAccountSession *)v2 newConnectionWithLabel:@"readonly-expensive-db" readonly:1 error:&v12];
    id v6 = v12;
    if (v4)
    {
      v7 = [(BRCAccountSession *)v2 readOnlyWorkloop];
      [(BRCPQLConnection *)v4 useSerialQueueWithTarget:v7];

      objc_storeStrong((id *)&v2->_expensiveReadOnlyDB, v4);
      clientDB = v4;
    }
    else
    {
      v9 = brc_bread_crumbs();
      v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSession(BRCDatabaseManager) expensiveReadOnlyDB]();
      }

      clientDB = v2->_clientDB;
    }
    id v5 = clientDB;
  }
  objc_sync_exit(v2);

  return v5;
}

- (void)dbBecameCorruptedWithDescription:(id)a3 error:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = self;
  objc_sync_enter(v8);
  if (!v8->_dbCorruptionQueue)
  {
    v11 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
    id v12 = dispatch_queue_attr_make_with_autorelease_frequency(v11, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v13 = dispatch_queue_create("db-corrupting-handler-queue", v12);

    dbCorruptionQueue = v8->_dbCorruptionQueue;
    v8->_dbCorruptionQueue = (OS_dispatch_queue *)v13;

    [(BRCAccountSession *)v8 captureDBCorruptionInfoWithDescription:v6 error:v7];
    objc_sync_exit(v8);

    v15 = [(BRCAccountSession *)v8 fileUnlinker];
    v16 = [(NSURL *)v8->_dbURL path];
    [v15 renameAndUnlinkInBackgroundItemAtPath:v16];

    v17 = [(BRCAccountSession *)v8 fileUnlinker];
    id v18 = [(BRCAccountSession *)v8 sessionDirPath];
    [v17 renameAndUnlinkInBackgroundItemAtPath:v18];

    abc_report_panic_with_signature();
    [NSString stringWithFormat:@"db was corrupted with description - '%@' and due to - %@", v6, v7];
    objc_claimAutoreleasedReturnValue();
    v19 = brc_bread_crumbs();
    v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
    {
      v21 = brc_append_system_info_to_message();
      *(_DWORD *)buf = 138412546;
      v24 = v21;
      __int16 v25 = 2112;
      v26 = v19;
      _os_log_fault_impl(&dword_1D353B000, v20, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", buf, 0x16u);
    }
    brc_append_system_info_to_message();
    v22 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
    __assert_rtn("-[BRCAccountSession(BRCDatabaseManager) dbBecameCorruptedWithDescription:error:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 299, v22);
  }
  v9 = brc_bread_crumbs();
  v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v24 = v9;
    _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Corrupting handling is already in-flight%@", buf, 0xCu);
  }

  objc_sync_exit(v8);
}

- (id)newConnection:(id)a3
{
  id v4 = a3;
  objc_initWeak(&location, self);
  id v5 = [BRCPQLConnection alloc];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  v10 = __55__BRCAccountSession_BRCDatabaseManager__newConnection___block_invoke;
  v11 = &unk_1E6993A10;
  objc_copyWeak(&v12, &location);
  id v6 = [(BRCPQLConnection *)v5 initWithLabel:v4 dbCorruptionHandler:&v8];
  -[BRCPQLConnection setAssertionPersonaIdentifier:](v6, "setAssertionPersonaIdentifier:", self->_personaIdentifier, v8, v9, v10, v11);
  [(BRCPQLConnection *)v6 setStatementCacheMaxCount:10];
  objc_destroyWeak(&v12);
  objc_destroyWeak(&location);

  return v6;
}

void __55__BRCAccountSession_BRCDatabaseManager__newConnection___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  v3 = (id *)(a1 + 32);
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained(v3);
  [WeakRetained dbBecameCorruptedWithDescription:@"Invoked from DB Corruption Handler" error:v4];
}

+ (id)sessionForBackingUpDatabasesAtURL:(id)a3
{
  v3 = (NSURL *)a3;
  id v4 = objc_alloc_init(BRCAccountSession);
  dbURL = v4->_dbURL;
  v4->_dbURL = v3;

  return v4;
}

+ (id)sessionForDumpingDatabasesAtURL:(id)a3 with:(id)a4
{
  id v5 = (NSURL *)a3;
  id v6 = (BRDSIDString *)a4;
  id v7 = objc_alloc_init(BRCAccountSession);
  [(BRCAccountSession *)v7 setupDatabase];
  dbURL = v7->_dbURL;
  v7->_dbURL = v5;
  uint64_t v9 = v5;

  accountDSID = v7->_accountDSID;
  v7->_accountDSID = v6;
  v11 = v6;

  serverDB = v7->_serverDB;
  dispatch_queue_t v13 = [(BRCAccountSession *)v7 serverTruthWorkloop];
  [(BRCPQLConnection *)serverDB useSerialQueueWithTarget:v13];

  clientDB = v7->_clientDB;
  v15 = [(BRCAccountSession *)v7 clientTruthWorkloop];
  [(BRCPQLConnection *)clientDB useSerialQueueWithTarget:v15];

  [(BRCAccountSession *)v7 openForDumping];
  return v7;
}

+ (id)sessionForDumpingDatabasesAtURL:(id)a3
{
  id v3 = a3;
  id v4 = [(id)objc_opt_class() sessionForDumpingDatabasesAtURL:v3 with:0];

  return v4;
}

+ (id)sessionForSendingTelemetryAtURL:(id)a3
{
  id v3 = (NSURL *)a3;
  id v4 = objc_alloc_init(BRCAccountSession);
  [(BRCAccountSession *)v4 setupDatabase];
  dbURL = v4->_dbURL;
  v4->_dbURL = v3;
  id v6 = v3;

  serverDB = v4->_serverDB;
  uint64_t v8 = [(BRCAccountSession *)v4 serverTruthWorkloop];
  [(BRCPQLConnection *)serverDB useSerialQueueWithTarget:v8];

  clientDB = v4->_clientDB;
  v10 = [(BRCAccountSession *)v4 clientTruthWorkloop];
  [(BRCPQLConnection *)clientDB useSerialQueueWithTarget:v10];

  [(BRCAccountSession *)v4 openForSendingTelemetry];
  v11 = +[BRCDaemon daemon];
  uint64_t v12 = objc_opt_class();

  [v11 setContainerClass:v12];
  return v4;
}

+ (id)sessionForCheckingInconsistencies
{
  v2 = objc_alloc_init(BRCAccountSession);
  serverDB = v2->_serverDB;
  id v4 = [(BRCAccountSession *)v2 serverTruthWorkloop];
  [(BRCPQLConnection *)serverDB useSerialQueueWithTarget:v4];

  clientDB = v2->_clientDB;
  id v6 = [(BRCAccountSession *)v2 clientTruthWorkloop];
  [(BRCPQLConnection *)clientDB useSerialQueueWithTarget:v6];

  return v2;
}

- (void)setupDatabase
{
  id v7 = +[BRCUserDefaults defaultsForMangledID:0];
  id v3 = [(BRCAccountSession *)self newConnection:@"serverTruth"];
  serverDB = self->_serverDB;
  self->_serverDB = v3;

  id v5 = [(BRCAccountSession *)self newConnection:@"clientTruth"];
  clientDB = self->_clientDB;
  self->_clientDB = v5;

  -[BRCPQLConnection setStatementCacheMaxCount:](self->_serverDB, "setStatementCacheMaxCount:", [v7 statementCacheMaxCountForServerTruth]);
  -[BRCPQLConnection setStatementCacheMaxCount:](self->_clientDB, "setStatementCacheMaxCount:", [v7 statementCacheMaxCountForClientTruth]);
}

- (void)_startWatcher
{
  id v3 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:@"client.db"];
  id v4 = (const char *)[v3 fileSystemRepresentation];

  unsigned int v5 = open(v4, 33028);
  if ((v5 & 0x80000000) != 0)
  {
    abc_report_panic_with_signature();
    objc_msgSend(NSString, "stringWithFormat:", @"can't open the client db we've just created %{errno}d", *__error());
    objc_claimAutoreleasedReturnValue();
    id v18 = brc_bread_crumbs();
    v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) _startWatcher]();
    }

    brc_append_system_info_to_message();
    v20 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
    __assert_rtn("-[BRCAccountSession(BRCDatabaseManager) _startWatcher]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 391, v20);
  }
  unsigned int v6 = v5;
  id v7 = (OS_dispatch_source *)dispatch_source_create(MEMORY[0x1E4F144A8], v5, 1uLL, (dispatch_queue_t)self->_dbWatcherQueue);
  dbWatcher = self->_dbWatcher;
  self->_dbWatcher = v7;

  uint64_t v9 = self->_dbWatcher;
  v10 = (void (**)(void *))MEMORY[0x1E4F59658];
  if (*MEMORY[0x1E4F59658])
  {
    v11 = ((void (*)(void *))*MEMORY[0x1E4F59658])(&__block_literal_global_6);
  }
  else
  {
    v11 = &__block_literal_global_6;
  }
  dispatch_block_t v12 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v11);
  dispatch_source_set_event_handler((dispatch_source_t)v9, v12);

  dispatch_queue_t v13 = self->_dbWatcher;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __54__BRCAccountSession_BRCDatabaseManager___startWatcher__block_invoke_2;
  v21[3] = &__block_descriptor_36_e5_v8__0l;
  unsigned int v22 = v6;
  id v14 = v13;
  v15 = v21;
  v16 = v15;
  if (*v10)
  {
    uint64_t v17 = (*v10)(v15);

    v16 = (void *)v17;
  }
  dispatch_source_set_cancel_handler(v14, v16);

  dispatch_resume((dispatch_object_t)self->_dbWatcher);
}

void __54__BRCAccountSession_BRCDatabaseManager___startWatcher__block_invoke()
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  abc_report_panic_with_signature();
  [NSString stringWithFormat:@"someone ripped the database from under our feet"];
  objc_claimAutoreleasedReturnValue();
  v0 = brc_bread_crumbs();
  v1 = brc_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_FAULT))
  {
    v2 = brc_append_system_info_to_message();
    int v4 = 138412546;
    unsigned int v5 = v2;
    __int16 v6 = 2112;
    id v7 = v0;
    _os_log_fault_impl(&dword_1D353B000, v1, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v4, 0x16u);
  }
  brc_append_system_info_to_message();
  id v3 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("-[BRCAccountSession(BRCDatabaseManager) _startWatcher]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 396, v3);
}

uint64_t __54__BRCAccountSession_BRCDatabaseManager___startWatcher__block_invoke_2(uint64_t a1)
{
  return close(*(_DWORD *)(a1 + 32));
}

- (void)stopDBWatcher
{
  dbWatcherQueue = self->_dbWatcherQueue;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __54__BRCAccountSession_BRCDatabaseManager__stopDBWatcher__block_invoke;
  block[3] = &unk_1E6993698;
  block[4] = self;
  dispatch_sync(dbWatcherQueue, block);
}

void __54__BRCAccountSession_BRCDatabaseManager__stopDBWatcher__block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 24);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    int v4 = *(void **)(v3 + 24);
    *(void *)(v3 + 24) = 0;
  }
}

- (BOOL)_openConnection:(id)a3 databaseName:(id)a4 readonly:(BOOL)a5 error:(id *)a6
{
  uint64_t v7 = a5;
  id v10 = a3;
  id v11 = a4;
  LODWORD(v7) = [(id)objc_opt_class() _openConnection:v10 databaseName:v11 baseURL:self->_dbURL readonly:v7 error:a6];

  if (v7) {
    BOOL v12 = [(BRCAccountSession *)self _registerDynamicDBFunctions:v10 error:a6];
  }
  else {
    BOOL v12 = 0;
  }

  return v12;
}

+ (BOOL)_openConnection:(id)a3 databaseName:(id)a4 baseURL:(id)a5 readonly:(BOOL)a6 error:(id *)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  if (v8) {
    uint64_t v13 = 3145729;
  }
  else {
    uint64_t v13 = 3145734;
  }
  id v14 = [a5 URLByAppendingPathComponent:v12];
  int v15 = [v11 openAtURL:v14 withFlags:v13 error:a7];

  if (!v15) {
    goto LABEL_9;
  }
  if (!v8) {
    objc_msgSend(v11, "setSynchronousMode:", objc_msgSend(v12, "isEqualToString:", @"checker.db") ^ 1);
  }
  if (+[BRCAccountSession _registerStaticDBFunctions:v11 error:a7])
  {
    v16 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v17 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v16, "sqliteCacheSize"));
    id v18 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v16, "sqliteCacheSpill"));
    v19 = (void *)MEMORY[0x1E4FBA908];
    id v20 = v17;
    v21 = objc_msgSend(v19, "rawInjection:length:", objc_msgSend(v20, "UTF8String"), objc_msgSend(v20, "length"));
    [v11 execute:@"PRAGMA cache_size = %@", v21];

    unsigned int v22 = (void *)MEMORY[0x1E4FBA908];
    id v23 = v18;
    v24 = objc_msgSend(v22, "rawInjection:length:", objc_msgSend(v23, "UTF8String"), objc_msgSend(v23, "length"));
    [v11 execute:@"PRAGMA cache_spill = %@", v24];

    BOOL v25 = 1;
  }
  else
  {
LABEL_9:
    BOOL v25 = 0;
  }

  return v25;
}

+ (BOOL)_registerStaticDBFunctions:(id)a3 error:(id *)a4
{
  id v5 = a3;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke;
  v9[3] = &unk_1E6994080;
  id v6 = v5;
  id v10 = v6;
  if ([v6 registerFunction:@"migration_is_parented_or_equal_to_old_doc_id" nArgs:2 handler:v9 error:a4]&& objc_msgSend(v6, "registerFunction:nArgs:handler:error:", @"document_is_evictable", 1, &__block_literal_global_76_0, a4)&& objc_msgSend(v6, "registerFunction:nArgs:handler:error:", @"document_is_indexable", 1, &__block_literal_global_81,
                       a4))
  {
    char v7 = [v6 registerFunction:@"ckinfo_etags_are_equal" nArgs:2 handler:&__block_literal_global_86];
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

void __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, uint64_t a4)
{
  char v7 = pql_sqlite3_value_object();
  if (!v7 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v17 = brc_bread_crumbs();
    id v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_1();
    }

    sqlite3_result_null(a2);
    goto LABEL_23;
  }
  unsigned int v22 = a2;
  BOOL v8 = (void *)[MEMORY[0x1E4F1C9B8] newFromSqliteValue:*(void *)(a4 + 8)];
  uint64_t v9 = -1000;
  while (1)
  {
    id v10 = (void *)MEMORY[0x1D9438760]();
    if (!v8) {
      goto LABEL_18;
    }
    id v11 = (void *)[[NSString alloc] initWithData:v8 encoding:4];
    if ([v11 isEqualToString:@"root"])
    {
      int v19 = 0;
LABEL_16:
      sqlite3_result_int(v22, v19);

      goto LABEL_22;
    }
    if ([v11 isEqualToString:@"documents"])
    {
      int v19 = 1;
      goto LABEL_16;
    }

    id v12 = *(void **)(a1 + 32);
    uint64_t v13 = [v7 dbRowID];
    id v14 = (void *)[v12 fetch:@"SELECT item_parent_id FROM client_items WHERE zone_rowid = %@ AND item_id = %@", v13, v8];

    if (([v14 next] & 1) == 0) {
      break;
    }
    uint64_t v15 = [v14 dataAtIndex:0];

    BOOL v8 = (void *)v15;
    if (__CFADD__(v9++, 1)) {
      goto LABEL_19;
    }
  }

LABEL_18:
  uint64_t v15 = (uint64_t)v8;
LABEL_19:
  id v20 = brc_bread_crumbs();
  v21 = brc_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
    __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_2();
  }

  sqlite3_result_null(v22);
  BOOL v8 = (void *)v15;
LABEL_22:

LABEL_23:
}

void __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_74(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  int v5 = sqlite3_value_int64(*a4) & 1;
  sqlite3_result_int(a2, v5);
}

void __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_2(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  unsigned int v5 = (sqlite3_value_int64(*a4) >> 1) & 1;
  sqlite3_result_int(a2, v5);
}

void __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_3(uint64_t a1, sqlite3_context *a2, uint64_t a3, void *a4)
{
  id v11 = +[BRFieldCKInfo newFromSqliteValue:*a4];
  id v7 = +[BRFieldCKInfo newFromSqliteValue:a4[1]];
  BOOL v8 = [v11 etag];
  if (v8 || ([v7 etag], (int v4 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v9 = [v11 etag];
    id v10 = [v7 etag];
    sqlite3_result_int(a2, [v9 isEqualToString:v10]);

    if (v8) {
      goto LABEL_7;
    }
  }
  else
  {
    sqlite3_result_int(a2, 1);
  }

LABEL_7:
}

- (BOOL)_registerDynamicDBFunctions:(id)a3 error:(id *)a4
{
  id v6 = a3;
  objc_initWeak(&location, self);
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke;
  v16[3] = &unk_1E69940A8;
  objc_copyWeak(&v17, &location);
  id v7 = (void *)MEMORY[0x1D94389C0](v16);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_88;
  v14[3] = &unk_1E69940A8;
  objc_copyWeak(&v15, &location);
  BOOL v8 = (void *)MEMORY[0x1D94389C0](v14);
  if ([v6 registerFunction:@"trigger_notification" nArgs:1 handler:v7 error:a4]&& objc_msgSend(v6, "registerFunction:nArgs:handler:error:", @"bump_notifs_rank", 0, v8, a4))
  {
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_2;
    v11[3] = &unk_1E69940D0;
    id v12 = v7;
    id v13 = v8;
    char v9 = [v6 registerFunction:@"bump_notifs_rank_and_trigger_notifs" nArgs:1 handler:v11 error:a4];
  }
  else
  {
    char v9 = 0;
  }

  objc_destroyWeak(&v15);
  objc_destroyWeak(&v17);
  objc_destroyWeak(&location);

  return v9;
}

void __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3, sqlite3_value **a4)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  sqlite3_int64 v6 = sqlite3_value_int64(*a4);
  id v7 = brc_bread_crumbs();
  BOOL v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_cold_1((uint64_t)v7, v6, v8);
  }

  char v9 = [WeakRetained notificationManager];
  [v9 queueUpdateForItemAtRowID:v6];
}

void __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_88(uint64_t a1, sqlite3_context *a2)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v3 = +[BRCPersistedState loadFromClientStateInSession:WeakRetained];
  sqlite3_int64 v4 = [v3 allocateNotifRank];

  sqlite3_result_int64(a2, v4);
}

uint64_t __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_2(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (BOOL)_setupConnection:(id)a3 readonly:(BOOL)a4 forChecker:(BOOL)a5 error:(id *)a6
{
  BOOL v6 = a5;
  BOOL v22 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  if (v6) {
    BOOL v8 = &unk_1F2B27738;
  }
  else {
    BOOL v8 = &unk_1F2B27750;
  }
  id obj = v8;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    BOOL v11 = 0;
    uint64_t v12 = *(void *)v27;
    unint64_t v13 = 0x1E4F29000uLL;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void *)(*((void *)&v26 + 1) + 8 * i);
        v16 = [*(id *)(v13 + 24) stringWithFormat:@"%@.db", v15];
        if (v11)
        {
          id v17 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:v16];
          [v17 path];
          v19 = unint64_t v18 = v13;
          char v20 = [v25 attachDBAtPath:v19 as:v15 error:a6];

          unint64_t v13 = v18;
          if ((v20 & 1) == 0) {
            goto LABEL_16;
          }
        }
        else if (![(BRCAccountSession *)self _openConnection:v25 databaseName:v16 readonly:v22 error:a6])
        {
LABEL_16:

          BOOL v11 = 0;
          goto LABEL_18;
        }

        BOOL v11 = 1;
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
  else
  {
    BOOL v11 = 1;
  }
LABEL_18:

  return v11;
}

- (id)newConnectionWithLabel:(id)a3 readonly:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = [(BRCAccountSession *)self newConnection:v8];
  uint64_t v10 = [v8 isEqualToString:@"checker"];

  if ([(BRCAccountSession *)self _setupConnection:v9 readonly:v6 forChecker:v10 error:a5])
  {
    BOOL v11 = v9;
  }
  else
  {
    BOOL v11 = 0;
  }
  id v12 = v11;

  return v12;
}

- (BOOL)_setupBackupDetector:(backup_detector *)a3 error:(id *)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:@"control-odd"];
  id v8 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:@"control-even"];
  __darwin_ino64_t v23 = 0;
  a3->unint64_t var2 = 0;
  id v9 = v7;
  if (create_control_file((char *)[v9 fileSystemRepresentation], &v23, 1))
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    if (v10)
    {
      BOOL v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        v21 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        id v25 = "-[BRCAccountSession(BRCDatabaseManager) _setupBackupDetector:error:]";
        __int16 v26 = 2080;
        if (!a4) {
          v21 = "(ignored by caller)";
        }
        unint64_t v27 = (unint64_t)v21;
        __int16 v28 = 2112;
        unint64_t v29 = (unint64_t)v10;
        __int16 v30 = 2112;
        id v31 = v11;
        _os_log_error_impl(&dword_1D353B000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      goto LABEL_6;
    }
LABEL_13:
    BOOL v13 = 0;
    goto LABEL_14;
  }
  a3->unint64_t var0 = v23;
  if (!create_control_file((char *)[v8 fileSystemRepresentation], &v23, 1))
  {
    a3->unint64_t var1 = v23;
    brc_bread_crumbs();
    id v10 = (id)objc_claimAutoreleasedReturnValue();
    BOOL v13 = 1;
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      unint64_t var0 = a3->var0;
      unint64_t var1 = a3->var1;
      unint64_t var2 = a3->var2;
      *(_DWORD *)buf = 134218754;
      id v25 = (const char *)var0;
      __int16 v26 = 2048;
      unint64_t v27 = var1;
      __int16 v28 = 2048;
      unint64_t v29 = var2;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] database backup detector initialized {old:%llu; new:%llu; c:%llu}%@",
        buf,
        0x2Au);
    }
    goto LABEL_7;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  if (v10)
  {
    uint64_t v15 = brc_bread_crumbs();
    v16 = brc_default_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      BOOL v22 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      id v25 = "-[BRCAccountSession(BRCDatabaseManager) _setupBackupDetector:error:]";
      __int16 v26 = 2080;
      if (!a4) {
        BOOL v22 = "(ignored by caller)";
      }
      unint64_t v27 = (unint64_t)v22;
      __int16 v28 = 2112;
      unint64_t v29 = (unint64_t)v10;
      __int16 v30 = 2112;
      id v31 = v15;
      _os_log_error_impl(&dword_1D353B000, v16, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (!a4) {
    goto LABEL_13;
  }
LABEL_6:
  id v10 = v10;
  BOOL v13 = 0;
  id v14 = *a4;
  *a4 = v10;
LABEL_7:

LABEL_14:
  return v13;
}

- (BOOL)_stepBackupDetector:(backup_detector *)a3 newState:(backup_detector *)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v9 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:@"control-odd"];
  id v10 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:@"control-even"];
  BOOL v11 = v10;
  memset(&v44, 0, sizeof(v44));
  if (a3->var2) {
    id v10 = v9;
  }
  id v12 = (const char *)objc_msgSend(v10, "fileSystemRepresentation", *(void *)&v44.st_dev);
  if (lstat(v12, &v44))
  {
    int v13 = *__error();
    id v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 136315650;
      st_ino = v12;
      __int16 v47 = 1024;
      *(_DWORD *)v48 = v13;
      *(_WORD *)&v48[4] = 2112;
      *(void *)&v48[6] = v14;
      _os_log_error_impl(&dword_1D353B000, v15, (os_log_type_t)0x90u, "[ERROR] failed stating '%s' %{errno}d%@", buf, 0x1Cu);
    }

    *__error() = v13;
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (v16)
    {
      id v17 = brc_bread_crumbs();
      unint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
      {
        v35 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        st_ino = "-[BRCAccountSession(BRCDatabaseManager) _stepBackupDetector:newState:error:]";
        __int16 v47 = 2080;
        if (!a5) {
          v35 = "(ignored by caller)";
        }
        *(void *)v48 = v35;
        *(_WORD *)&v48[8] = 2112;
        *(void *)&v48[10] = v16;
        __int16 v49 = 2112;
        unint64_t v50 = (unint64_t)v17;
        _os_log_error_impl(&dword_1D353B000, v18, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      goto LABEL_10;
    }
    goto LABEL_33;
  }
  if (v44.st_ino != a3->var1)
  {
    v24 = brc_bread_crumbs();
    id v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      unint64_t var1 = a3->var1;
      *(_DWORD *)buf = 134218754;
      st_ino = (const char *)v44.st_ino;
      __int16 v47 = 2048;
      *(void *)v48 = var1;
      *(_WORD *)&v48[8] = 2080;
      *(void *)&v48[10] = v12;
      __int16 v49 = 2112;
      unint64_t v50 = (unint64_t)v24;
      _os_log_impl(&dword_1D353B000, v25, OS_LOG_TYPE_DEFAULT, "[WARNING] backup detected: ino %llu instead of %llu at '%s'\n%@", buf, 0x2Au);
    }

    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 70);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16)
    {
LABEL_32:
      if (a5)
      {
LABEL_10:
        id v16 = v16;
        BOOL v19 = 0;
        *a5 = v16;
        goto LABEL_41;
      }
LABEL_33:
      BOOL v19 = 0;
      goto LABEL_41;
    }
    unint64_t v27 = brc_bread_crumbs();
    __int16 v28 = brc_default_log();
    if (!os_log_type_enabled(v28, (os_log_type_t)0x90u))
    {
LABEL_31:

      goto LABEL_32;
    }
    unint64_t v29 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    st_ino = "-[BRCAccountSession(BRCDatabaseManager) _stepBackupDetector:newState:error:]";
    __int16 v47 = 2080;
    if (!a5) {
      unint64_t v29 = "(ignored by caller)";
    }
LABEL_48:
    *(void *)v48 = v29;
    *(_WORD *)&v48[8] = 2112;
    *(void *)&v48[10] = v16;
    __int16 v49 = 2112;
    unint64_t v50 = (unint64_t)v27;
    _os_log_error_impl(&dword_1D353B000, v28, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_31;
  }
  if (a3->var2) {
    char v20 = v11;
  }
  else {
    char v20 = v9;
  }
  v21 = (char *)[v20 fileSystemRepresentation];
  if (!lstat(v21, &v44))
  {
    if (v44.st_ino != a3->var0)
    {
      __int16 v30 = brc_bread_crumbs();
      id v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
      {
        unint64_t var0 = a3->var0;
        *(_DWORD *)buf = 136315906;
        st_ino = v21;
        __int16 v47 = 2048;
        *(void *)v48 = v44.st_ino;
        *(_WORD *)&v48[8] = 2048;
        *(void *)&v48[10] = var0;
        __int16 v49 = 2112;
        unint64_t v50 = (unint64_t)v30;
        _os_log_debug_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] mismatch on new control file '%s': %llu != %llu\n%@", buf, 0x2Au);
      }

      goto LABEL_37;
    }
    if (!create_control_file(v21, &v44.st_ino, 1))
    {
      __darwin_ino64_t v36 = v44.st_ino;
      a4->unint64_t var0 = a3->var1;
      a4->unint64_t var1 = v36;
      a4->unint64_t var2 = a3->var2 + 1;
      goto LABEL_38;
    }
    goto LABEL_29;
  }
  BOOL v22 = brc_bread_crumbs();
  __darwin_ino64_t v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSession(BRCDatabaseManager) _stepBackupDetector:newState:error:]();
  }

  if (create_control_file(v21, &v44.st_ino, 1))
  {
LABEL_29:
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    if (!v16) {
      goto LABEL_32;
    }
    unint64_t v27 = brc_bread_crumbs();
    __int16 v28 = brc_default_log();
    if (!os_log_type_enabled(v28, (os_log_type_t)0x90u)) {
      goto LABEL_31;
    }
    unint64_t v29 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    st_ino = "-[BRCAccountSession(BRCDatabaseManager) _stepBackupDetector:newState:error:]";
    __int16 v47 = 2080;
    if (!a5) {
      unint64_t v29 = "(ignored by caller)";
    }
    goto LABEL_48;
  }
LABEL_37:
  unint64_t var2 = a3->var2;
  *(_OWORD *)&a4->unint64_t var0 = *(_OWORD *)&a3->var0;
  a4->unint64_t var2 = var2;
  a4->unint64_t var0 = v44.st_ino;
LABEL_38:
  brc_bread_crumbs();
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  v33 = brc_default_log();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    unint64_t v37 = a3->var0;
    unint64_t v38 = a3->var1;
    unint64_t v39 = a4->var0;
    unint64_t v40 = a4->var1;
    unint64_t v41 = a3->var2;
    unint64_t v42 = a4->var2;
    *(_DWORD *)buf = 134219522;
    st_ino = (const char *)v37;
    __int16 v47 = 2048;
    *(void *)v48 = v39;
    *(_WORD *)&v48[8] = 2048;
    *(void *)&v48[10] = v38;
    __int16 v49 = 2048;
    unint64_t v50 = v40;
    __int16 v51 = 2048;
    unint64_t v52 = v41;
    __int16 v53 = 2048;
    unint64_t v54 = v42;
    __int16 v55 = 2112;
    id v56 = v16;
    _os_log_debug_impl(&dword_1D353B000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] database backup detector updated {old:%llu -> %llu; new:%llu -> %llu; c:%llu -> %llu}%@",
      buf,
      0x48u);
  }

  BOOL v19 = 1;
LABEL_41:

  return v19;
}

- (void)preventDatabaseFromBeingReused
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:@"control-odd"];
  sqlite3_int64 v4 = [(NSURL *)self->_dbURL URLByAppendingPathComponent:@"control-even"];
  unsigned int v5 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v15 = 0;
  char v6 = [v5 removeItemAtURL:v3 error:&v15];
  id v7 = v15;
  if ((v6 & 1) == 0)
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v3;
      __int16 v18 = 2112;
      id v19 = v7;
      __int16 v20 = 2112;
      v21 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] can't remove %@: %@%@", buf, 0x20u);
    }
  }
  id v14 = v7;
  char v10 = [v5 removeItemAtURL:v4 error:&v14];
  id v11 = v14;

  if ((v10 & 1) == 0)
  {
    id v12 = brc_bread_crumbs();
    int v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v11;
      __int16 v20 = 2112;
      v21 = v12;
      _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] can't remove %@: %@%@", buf, 0x20u);
    }
  }
}

- (id)fixObfuscatedMangledID:(id)a3
{
  id v4 = a3;
  if (!self->_forDBDump) {
    goto LABEL_6;
  }
  if (fixObfuscatedMangledID__onceToken != -1) {
    dispatch_once(&fixObfuscatedMangledID__onceToken, &__block_literal_global_125);
  }
  uint64_t v5 = [v4 length];
  uint64_t v7 = objc_msgSend((id)fixObfuscatedMangledID____regex, "rangeOfFirstMatchInString:options:range:", v4, 0, 0, v5);
  if (v7 || v6 != v5)
  {
    objc_msgSend(v4, "substringWithRange:", v7, v6);
    id v8 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
LABEL_6:
    id v8 = v4;
  }
  id v9 = v8;

  return v9;
}

void __64__BRCAccountSession_BRCDatabaseManager__fixObfuscatedMangledID___block_invoke()
{
  uint64_t v0 = [objc_alloc(MEMORY[0x1E4F28FD8]) initWithPattern:@"[a-zA-Z0-9\\-]+\\.[a-zA-Z0-9\\-\\.]+" options:0 error:0];
  v1 = (void *)fixObfuscatedMangledID____regex;
  fixObfuscatedMangledID____regex = v0;
}

- (BOOL)saveServerZone:(id)a3 toDB:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 dbRowID];

  if (!v7)
  {
    id v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) saveServerZone:toDB:]();
    }
  }
  id v8 = [v5 plist];
  id v9 = [v5 dbRowID];
  int v10 = [v6 execute:@"UPDATE server_zones SET zone_plist = %@ WHERE rowid = %@", v8, v9];

  if (v10)
  {
    [v5 setNeedsSave:0];
  }
  else
  {
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) saveServerZone:toDB:]();
    }
  }
  return v10;
}

- (BOOL)saveServerZoneToDB:(id)a3
{
  return [(BRCAccountSession *)self saveServerZone:a3 toDB:self->_serverDB];
}

- (BOOL)saveClientZoneToDB:(id)a3
{
  id v4 = a3;
  id v5 = [v4 dbRowID];

  if (!v5)
  {
    int v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) saveClientZoneToDB:]();
    }
  }
  clientDB = self->_clientDB;
  uint64_t v7 = [v4 plist];
  id v8 = [v4 dbRowID];
  BOOL v9 = [(BRCPQLConnection *)clientDB execute:@"UPDATE client_zones SET zone_plist = %@ WHERE rowid = %@", v7, v8];

  if (v9)
  {
    [v4 setNeedsSave:0];
  }
  else
  {
    int v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) saveClientZoneToDB:]();
    }
  }
  return v9;
}

- (BOOL)createServerZone:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  serverDB = self->_serverDB;
  id v6 = [v4 ownerName];
  uint64_t v7 = [v4 zoneName];
  id v8 = [v4 plist];
  LOBYTE(serverDB) = [(BRCPQLConnection *)serverDB execute:@"INSERT OR IGNORE INTO server_zones (zone_owner, zone_name, zone_plist) VALUES (%@, %@, %@)", v6, v7, v8];

  if (serverDB)
  {
    if ([(BRCPQLConnection *)self->_serverDB changes] < 1)
    {
      id v17 = brc_bread_crumbs();
      __int16 v18 = brc_default_log();
      if (os_log_type_enabled(v18, (os_log_type_t)0x90u)) {
        -[BRCAccountSession(BRCDatabaseManager) createServerZone:]();
      }

      id v19 = self->_serverDB;
      __int16 v20 = [v4 ownerName];
      v21 = [v4 zoneName];
      int v10 = [(PQLConnection *)v19 numberWithSQL:@"SELECT rowid from server_zones WHERE zone_owner = %@ and zone_name = %@", v20, v21];

      if (!v10)
      {
        v33 = brc_bread_crumbs();
        v34 = brc_default_log();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
          -[BRCAccountSession(BRCDatabaseManager) createServerZone:]();
        }
      }
      uint64_t v22 = [v4 dbRowID];

      if (v22)
      {
        __darwin_ino64_t v23 = brc_bread_crumbs();
        v24 = brc_default_log();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
        {
          id v31 = [v4 dbRowID];
          *(_DWORD *)buf = 138412802;
          __darwin_ino64_t v36 = v31;
          __int16 v37 = 2112;
          uint64_t v38 = (uint64_t)v10;
          __int16 v39 = 2112;
          unint64_t v40 = v23;
          _os_log_fault_impl(&dword_1D353B000, v24, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: got a new rowid for already existing zone (sct.dbRowID=%@ rowID=%@)%@", buf, 0x20u);
        }
      }
      else
      {
        [v4 setDbRowID:v10];
      }
      unint64_t v27 = self->_serverDB;
      __int16 v28 = [v4 plist];
      LOBYTE(v27) = [(BRCPQLConnection *)v27 execute:@"UPDATE server_zones SET zone_plist = %@ WHERE rowid = %@", v28, v10];

      if (v27) {
        goto LABEL_25;
      }
      id v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT))
      {
        uint64_t v32 = [(BRCPQLConnection *)self->_serverDB lastError];
        *(_DWORD *)buf = 138412802;
        __darwin_ino64_t v36 = v4;
        __int16 v37 = 2112;
        uint64_t v38 = (uint64_t)v32;
        __int16 v39 = 2112;
        unint64_t v40 = v11;
        _os_log_fault_impl(&dword_1D353B000, v12, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to update plist for zone %@: %@%@", buf, 0x20u);
      }
    }
    else
    {
      BOOL v9 = [v4 dbRowID];

      if (!v9)
      {
        id v25 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
        [v4 setDbRowID:v25];

        __int16 v26 = [v4 dbRowID];

        if (v26)
        {
LABEL_26:
          id v14 = [v4 ownerName];
          id v15 = [(BRCAccountSession *)self createUserKeyForOwnerName:v14];
          BOOL v16 = v15 != 0;
          goto LABEL_27;
        }
        int v10 = brc_bread_crumbs();
        id v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          -[BRCAccountSession(BRCDatabaseManager) saveServerZone:toDB:]();
        }
        goto LABEL_24;
      }
      int v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (!os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
LABEL_24:

LABEL_25:
        goto LABEL_26;
      }
      id v12 = [v4 dbRowID];
      uint64_t v13 = [(BRCPQLConnection *)self->_serverDB lastInsertedRowID];
      *(_DWORD *)buf = 138412802;
      __darwin_ino64_t v36 = v12;
      __int16 v37 = 2048;
      uint64_t v38 = v13;
      __int16 v39 = 2112;
      unint64_t v40 = v10;
      _os_log_fault_impl(&dword_1D353B000, v11, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: sct.dbRowID is %@ lastInsertedRow is %lld%@", buf, 0x20u);
    }

    goto LABEL_24;
  }
  id v14 = brc_bread_crumbs();
  id v15 = brc_default_log();
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
  {
    __int16 v30 = [(BRCPQLConnection *)self->_serverDB lastError];
    *(_DWORD *)buf = 138412802;
    __darwin_ino64_t v36 = v4;
    __int16 v37 = 2112;
    uint64_t v38 = (uint64_t)v30;
    __int16 v39 = 2112;
    unint64_t v40 = v14;
    _os_log_error_impl(&dword_1D353B000, v15, (os_log_type_t)0x90u, "[ERROR] Failed to create server zone %@:  %@%@", buf, 0x20u);
  }
  BOOL v16 = 0;
LABEL_27:

  return v16;
}

- (BOOL)deleteServerZone:(id)a3
{
  serverDB = self->_serverDB;
  id v4 = [a3 dbRowID];
  LOBYTE(serverDB) = [(BRCPQLConnection *)serverDB execute:@"DELETE FROM server_zones WHERE rowid = %@", v4];

  return (char)serverDB;
}

- (void)_enumerateAppLibraryRowIDs:(id)a3 usingBlock:(id)a4
{
  id v10 = a3;
  id v5 = (void (**)(id, void *, void *))a4;
  id v6 = (void *)[v10 fetch:@"SELECT container_id, rowid FROM rowid_reservations"];
  if ([v6 next])
  {
    do
    {
      uint64_t v7 = (void *)MEMORY[0x1D9438760]();
      id v8 = [v6 stringAtIndex:0];
      BOOL v9 = [v6 numberAtIndex:1];
      v5[2](v5, v8, v9);
    }
    while (([v6 next] & 1) != 0);
  }
  [v6 close];
}

- (id)_reserveRowIDForLibrary:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(BRCPQLConnection *)self->_serverDB assertOnQueue];
  if ([(BRCPQLConnection *)self->_serverDB execute:@"INSERT INTO rowid_reservations (container_id) VALUES (%@)", v4])
  {
    id v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
    if (v5) {
      goto LABEL_9;
    }
    id v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) createServerZone:]();
    }
  }
  else
  {
    id v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT))
    {
      BOOL v9 = [(BRCPQLConnection *)self->_serverDB lastError];
      *(_DWORD *)buf = 138412802;
      id v11 = v4;
      __int16 v12 = 2112;
      uint64_t v13 = v9;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_fault_impl(&dword_1D353B000, v7, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: couldn't allocate a rowid. libraryID %@ error %@%@", buf, 0x20u);
    }
    id v5 = 0;
  }

LABEL_9:
  return v5;
}

- (BOOL)saveAppLibrary:(id)a3 toDB:(id)a4 supportsEnhancedDrivePrivacy:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = [v7 zoneRowID];

  if (!v9)
  {
    uint64_t v22 = brc_bread_crumbs();
    __darwin_ino64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:]();
    }
  }
  id v10 = [v7 plist];
  id v11 = [v7 zoneRowID];
  if (v5)
  {
    __int16 v12 = [v7 childBasehashSalt];
    uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v7, "saltingState"));
    __int16 v14 = [v7 dbRowID];
    int v15 = [v8 execute:@"UPDATE app_libraries SET app_library_plist = %@, zone_rowid = %@, child_basehash_salt = %@, salting_state = %@ WHERE rowid = %@", v10, v11, v12, v13, v14];

    if (v15)
    {
LABEL_4:
      [v7 setNeedsSave:0];
      BOOL v16 = 1;
      goto LABEL_9;
    }
  }
  else
  {
    id v17 = [v7 dbRowID];
    int v18 = [v8 execute:@"UPDATE app_libraries SET app_library_plist = %@, zone_rowid = %@ WHERE rowid = %@", v10, v11, v17];

    if (v18) {
      goto LABEL_4;
    }
  }
  id v19 = brc_bread_crumbs();
  __int16 v20 = brc_default_log();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
    -[BRCAccountSession(BRCDatabaseManager) saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:]();
  }

  BOOL v16 = 0;
LABEL_9:

  return v16;
}

- (BOOL)saveAppLibrary:(id)a3 toDB:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = +[BRCUserDefaults defaultsForMangledID:0];
  LOBYTE(self) = -[BRCAccountSession saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:](self, "saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:", v7, v6, [v8 supportsEnhancedDrivePrivacy]);

  return (char)self;
}

- (BOOL)saveAppLibraryToDB:(id)a3
{
  return [(BRCAccountSession *)self saveAppLibrary:a3 toDB:self->_clientDB];
}

- (id)newAppLibraryFromPQLResultSet:(id)a3 version:(int)a4
{
  id v6 = a3;
  uint64_t v22 = [v6 numberAtIndex:0];
  int v7 = 1;
  id v8 = [v6 stringAtIndex:1];
  BOOL v9 = [(BRCAccountSession *)self fixObfuscatedMangledID:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v9];
  id v11 = _BRCClassesForContainerState();
  __int16 v12 = [v6 unarchivedObjectOfClasses:v11 atIndex:2];

  uint64_t v13 = [v6 numberAtIndex:3];
  if (a4 < 3)
  {
    __int16 v14 = 0;
  }
  else
  {
    __int16 v14 = [v6 objectOfClass:objc_opt_class() atIndex:4];
    int v15 = [v6 numberAtIndex:5];
    int v7 = [v15 intValue];
  }
  BOOL v16 = [BRCAppLibrary alloc];
  id v17 = [v6 db];
  LODWORD(v21) = v7;
  BYTE2(v20) = 0;
  LOWORD(v20) = 0;
  int v18 = -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:](v16, "initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:", v10, v22, v13, v17, v12, self, v20, 0, v14, v21);

  return v18;
}

- (BOOL)_createAppLibrary:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 dbRowID];

  if (!v5)
  {
    id v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) _createAppLibrary:]();
    }
  }
  id v6 = [v4 zoneRowID];

  if (!v6)
  {
    uint64_t v21 = brc_bread_crumbs();
    uint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) saveAppLibrary:toDB:supportsEnhancedDrivePrivacy:]();
    }
  }
  int v7 = +[BRCUserDefaults defaultsForMangledID:0];
  int v8 = [v7 supportsEnhancedDrivePrivacy];

  clientDB = self->_clientDB;
  id v10 = [v4 dbRowID];
  id v11 = [v4 appLibraryID];
  __int16 v12 = [v4 plist];
  uint64_t v13 = [v4 zoneRowID];
  __int16 v14 = (void *)v13;
  if (v8)
  {
    int v15 = [v4 childBasehashSalt];
    BOOL v16 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v4, "saltingState"));
    BOOL v17 = [(BRCPQLConnection *)clientDB execute:@"INSERT OR REPLACE INTO app_libraries (rowid, app_library_name, app_library_plist, zone_rowid, child_basehash_salt, salting_state)  VALUES (%@, %@, %@, %@, %@, %@)", v10, v11, v12, v14, v15, v16];
  }
  else
  {
    BOOL v17 = [(BRCPQLConnection *)clientDB execute:@"INSERT OR REPLACE INTO app_libraries (rowid, app_library_name, app_library_plist, zone_rowid)  VALUES (%@, %@, %@, %@)", v10, v11, v12, v13];
  }

  return v17;
}

- (BOOL)_deleteAppLibrary:(id)a3
{
  clientDB = self->_clientDB;
  id v4 = [a3 dbRowID];
  LOBYTE(clientDB) = [(BRCPQLConnection *)clientDB execute:@"DELETE FROM app_libraries WHERE rowid = %@", v4];

  return (char)clientDB;
}

- (id)_appLibrariesEnumerator:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[BRCUserDefaults defaultsForMangledID:0];
  int v6 = [v5 supportsEnhancedDrivePrivacy];

  if (v6) {
    uint64_t v7 = 3;
  }
  else {
    uint64_t v7 = 2;
  }
  if (self->_forDBDump)
  {
    int v8 = [v4 userVersion];
    unint64_t v9 = [v8 unsignedLongValue];

    if (v9 >= 0x7544) {
      uint64_t v7 = v7;
    }
    else {
      uint64_t v7 = 2;
    }
  }
  id v10 = [(BRCAccountSession *)self _appLibrariesEnumerator:v4 version:v7];

  return v10;
}

- (id)_appLibrariesEnumerator:(id)a3 version:(int)a4
{
  if (a4 <= 2) {
    uint64_t v7 = @"SELECT rowid, app_library_name, app_library_plist, zone_rowid FROM app_libraries";
  }
  else {
    uint64_t v7 = @"SELECT rowid, app_library_name, app_library_plist, zone_rowid, child_basehash_salt, salting_state FROM app_libraries";
  }
  int v8 = (void *)[a3 fetch:v7];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __73__BRCAccountSession_BRCDatabaseManager___appLibrariesEnumerator_version___block_invoke;
  v11[3] = &unk_1E69940F8;
  void v11[4] = self;
  int v12 = a4;
  unint64_t v9 = [v8 enumerateObjects:v11];

  return v9;
}

id __73__BRCAccountSession_BRCDatabaseManager___appLibrariesEnumerator_version___block_invoke(uint64_t a1, uint64_t a2)
{
  v2 = (void *)[*(id *)(a1 + 32) newAppLibraryFromPQLResultSet:a2 version:*(unsigned int *)(a1 + 40)];
  return v2;
}

- (id)_appLibraryByName:(id)a3 db:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  int v8 = +[BRCUserDefaults defaultsForMangledID:0];
  int v9 = [v8 supportsEnhancedDrivePrivacy];

  if (v9) {
    id v10 = @"SELECT rowid, app_library_name, app_library_plist, zone_rowid, child_basehash_salt, salting_state FROM app_libraries WHERE app_library_name = %@";
  }
  else {
    id v10 = @"SELECT rowid, app_library_name, app_library_plist, zone_rowid FROM app_libraries WHERE app_library_name = %@";
  }
  id v11 = objc_msgSend(v6, "fetch:", v10, v7);

  id v12 = 0;
  if ([v11 next])
  {
    if (v9) {
      uint64_t v13 = 3;
    }
    else {
      uint64_t v13 = 2;
    }
    id v12 = [(BRCAccountSession *)self newAppLibraryFromPQLResultSet:v11 version:v13];
  }

  return v12;
}

- (BOOL)_createClientZone:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 dbRowID];

  if (!v5)
  {
    BOOL v17 = brc_bread_crumbs();
    int v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) saveClientZoneToDB:]();
    }
  }
  id v6 = [v4 mangledID];
  uint64_t v7 = [v6 ownerName];
  int v8 = (void *)v7;
  int v9 = (void *)*MEMORY[0x1E4F19C08];
  if (v7) {
    int v9 = (void *)v7;
  }
  id v10 = v9;

  clientDB = self->_clientDB;
  id v12 = [v4 dbRowID];
  uint64_t v13 = [v4 zoneName];
  __int16 v14 = [v4 plist];

  BOOL v15 = [(BRCPQLConnection *)clientDB execute:@"INSERT OR REPLACE INTO client_zones (rowid, zone_owner, zone_name, zone_plist) VALUES (%@, %@, %@, %@)", v12, v10, v13, v14];
  return v15;
}

- (BOOL)_deleteClientZone:(id)a3
{
  clientDB = self->_clientDB;
  id v4 = [a3 dbRowID];
  LOBYTE(clientDB) = [(BRCPQLConnection *)clientDB execute:@"DELETE FROM client_zones where rowid = %@", v4];

  return (char)clientDB;
}

- (id)newSharedClientZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 numberAtIndex:0];
  uint64_t v7 = [v5 stringAtIndex:1];
  int v8 = [v5 stringAtIndex:2];
  int v9 = [(BRCAccountSession *)self fixObfuscatedMangledID:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithZoneName:v9 ownerName:v7];
  id v11 = _BRCClassesForContainerState();
  id v12 = [v5 unarchivedObjectOfClasses:v11 atIndex:3];

  if (!v12)
  {
    BOOL v15 = brc_bread_crumbs();
    BOOL v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) newSharedClientZoneFromPQLResultSet:error:]();
    }
  }
  uint64_t v13 = [(BRCClientZone *)[BRCSharedClientZone alloc] initWithMangledID:v10 dbRowID:v6 plist:v12 session:self initialCreation:0];

  return v13;
}

- (id)_sharedClientZonesEnumerator
{
  uint64_t v3 = [(BRCAccountSession *)self clientDB];
  id v4 = (void *)[v3 fetch:@"SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner != %@", *MEMORY[0x1E4F19C08]];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __69__BRCAccountSession_BRCDatabaseManager___sharedClientZonesEnumerator__block_invoke;
  v7[3] = &unk_1E6994120;
  v7[4] = self;
  id v5 = [v4 enumerateObjects:v7];

  return v5;
}

id __69__BRCAccountSession_BRCDatabaseManager___sharedClientZonesEnumerator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newSharedClientZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)newSharedServerZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 numberAtIndex:0];
  uint64_t v7 = [v5 stringAtIndex:1];
  int v8 = [v5 stringAtIndex:2];
  int v9 = [(BRCAccountSession *)self fixObfuscatedMangledID:v8];

  id v10 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithZoneName:v9 ownerName:v7];
  id v11 = _BRCClassesForContainerState();
  id v12 = [v5 unarchivedObjectOfClasses:v11 atIndex:3];

  if (!v12)
  {
    BOOL v15 = brc_bread_crumbs();
    BOOL v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) newSharedServerZoneFromPQLResultSet:error:]();
    }
  }
  uint64_t v13 = [[BRCSharedServerZone alloc] initWithMangledID:v10 dbRowID:v6 plist:v12 session:self];

  return v13;
}

- (id)_sharedServerZonesEnumerator:(id)a3
{
  id v4 = (void *)[a3 fetch:@"SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner != %@", *MEMORY[0x1E4F19C08]];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__BRCAccountSession_BRCDatabaseManager___sharedServerZonesEnumerator___block_invoke;
  v7[3] = &unk_1E6994120;
  v7[4] = self;
  id v5 = [v4 enumerateObjects:v7];

  return v5;
}

id __70__BRCAccountSession_BRCDatabaseManager___sharedServerZonesEnumerator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newSharedServerZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)_sharedServerZoneByName:(id)a3 ownerName:(id)a4 db:(id)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __78__BRCAccountSession_BRCDatabaseManager___sharedServerZoneByName_ownerName_db___block_invoke;
  v7[3] = &unk_1E6994120;
  v7[4] = self;
  id v5 = (void *)[a5 fetchObject:v7, @"SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner = %@ AND zone_name = %@", a4, a3 sql];
  return v5;
}

id __78__BRCAccountSession_BRCDatabaseManager___sharedServerZoneByName_ownerName_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newSharedServerZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)newPrivateClientZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 numberAtIndex:0];
  uint64_t v7 = [v5 stringAtIndex:2];
  int v8 = [(BRCAccountSession *)self fixObfuscatedMangledID:v7];

  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithZoneName:v8 ownerName:0];
  id v10 = _BRCClassesForContainerState();
  id v11 = [v5 unarchivedObjectOfClasses:v10 atIndex:3];

  if (!v11)
  {
    __int16 v14 = brc_bread_crumbs();
    BOOL v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) newSharedServerZoneFromPQLResultSet:error:]();
    }
  }
  id v12 = [[BRCPrivateClientZone alloc] initWithMangledID:v9 dbRowID:v6 plist:v11 session:self initialCreation:0];

  return v12;
}

- (id)_privateClientZonesEnumerator
{
  uint64_t v3 = [(BRCAccountSession *)self clientDB];
  id v4 = (void *)[v3 fetch:@"SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner = %@", *MEMORY[0x1E4F19C08]];

  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __70__BRCAccountSession_BRCDatabaseManager___privateClientZonesEnumerator__block_invoke;
  v7[3] = &unk_1E6994120;
  v7[4] = self;
  id v5 = [v4 enumerateObjects:v7];

  return v5;
}

id __70__BRCAccountSession_BRCDatabaseManager___privateClientZonesEnumerator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newPrivateClientZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)_privateClientZoneByName:(id)a3 db:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__BRCAccountSession_BRCDatabaseManager___privateClientZoneByName_db___block_invoke;
  v6[3] = &unk_1E6994120;
  v6[4] = self;
  id v4 = (void *)[a4 fetchObject:v6, @"SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner = %@ AND zone_name = %@ AND zone_plist IS NOT NULL", *MEMORY[0x1E4F19C08], a3 sql];
  return v4;
}

id __69__BRCAccountSession_BRCDatabaseManager___privateClientZoneByName_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newPrivateClientZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)_privateClientZoneByID:(id)a3 db:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __67__BRCAccountSession_BRCDatabaseManager___privateClientZoneByID_db___block_invoke;
  v6[3] = &unk_1E6994120;
  v6[4] = self;
  id v4 = (void *)[a4 fetchObject:v6, @"SELECT rowid, zone_owner, zone_name, zone_plist FROM client_zones WHERE zone_owner = %@ AND rowid = %@", *MEMORY[0x1E4F19C08], a3 sql];
  return v4;
}

id __67__BRCAccountSession_BRCDatabaseManager___privateClientZoneByID_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newPrivateClientZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)newPrivateServerZoneFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 numberAtIndex:0];
  uint64_t v7 = [v5 stringAtIndex:2];
  int v8 = [(BRCAccountSession *)self fixObfuscatedMangledID:v7];

  int v9 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithZoneName:v8 ownerName:0];
  id v10 = _BRCClassesForContainerState();
  id v11 = [v5 unarchivedObjectOfClasses:v10 atIndex:3];

  if (v11)
  {
    if (v9) {
      goto LABEL_3;
    }
    goto LABEL_7;
  }
  __int16 v14 = brc_bread_crumbs();
  BOOL v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
    -[BRCAccountSession(BRCDatabaseManager) newSharedClientZoneFromPQLResultSet:error:]();
  }

  if (!v9)
  {
LABEL_7:
    BOOL v16 = brc_bread_crumbs();
    BOOL v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) newPrivateServerZoneFromPQLResultSet:error:]();
    }
  }
LABEL_3:
  id v12 = [(BRCServerZone *)[BRCPrivateServerZone alloc] initWithMangledID:v9 dbRowID:v6 plist:v11 session:self];

  return v12;
}

- (id)_privateServerZoneByName:(id)a3 db:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __69__BRCAccountSession_BRCDatabaseManager___privateServerZoneByName_db___block_invoke;
  v6[3] = &unk_1E6994120;
  v6[4] = self;
  id v4 = (void *)[a4 fetchObject:v6, @"SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner = %@ AND zone_name = %@", *MEMORY[0x1E4F19C08], a3 sql];
  return v4;
}

id __69__BRCAccountSession_BRCDatabaseManager___privateServerZoneByName_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newPrivateServerZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)_privateServerZonesEnumerator:(id)a3
{
  id v4 = (void *)[a3 fetch:@"SELECT rowid, zone_owner, zone_name, zone_plist FROM server_zones WHERE zone_owner = %@", *MEMORY[0x1E4F19C08]];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __71__BRCAccountSession_BRCDatabaseManager___privateServerZonesEnumerator___block_invoke;
  v7[3] = &unk_1E6994120;
  v7[4] = self;
  id v5 = [v4 enumerateObjects:v7];

  return v5;
}

id __71__BRCAccountSession_BRCDatabaseManager___privateServerZonesEnumerator___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newPrivateServerZoneFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)itemsNeedingIndexingEnumeratorFromNotifRank:(unint64_t)a3 batchSize:(unint64_t)a4 db:(id)a5
{
  id v8 = a5;
  int v9 = (void *)[v8 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items AS li      WHERE li.item_type  in (1, 2, 8, 0, 9, 10)        AND li.item_state in (0, -1)        AND (li.item_scope in (2, 3)        OR call_block(%p, li.item_id))        AND li.item_notifs_rank >= %lld        AND li.item_user_visible = 1   ORDER BY li.item_notifs_rank ASC LIMIT %lld", &__block_literal_global_217, a3, a4];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __98__BRCAccountSession_BRCDatabaseManager__itemsNeedingIndexingEnumeratorFromNotifRank_batchSize_db___block_invoke_2;
  v13[3] = &unk_1E6994148;
  v13[4] = self;
  id v14 = v8;
  id v10 = v8;
  id v11 = [v9 enumerateObjects:v13];

  return v11;
}

void __98__BRCAccountSession_BRCDatabaseManager__itemsNeedingIndexingEnumeratorFromNotifRank_batchSize_db___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, void *a4)
{
  int v5 = +[BRCItemID isDocumentsItemIDWithSQLiteValue:*a4];
  sqlite3_result_int(a2, v5);
}

id __98__BRCAccountSession_BRCDatabaseManager__itemsNeedingIndexingEnumeratorFromNotifRank_batchSize_db___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  uint64_t v3 = (void *)[*(id *)(a1 + 32) newLocalItemFromPQLResultSet:a2 db:*(void *)(a1 + 40) error:a3];
  return v3;
}

- (id)itemsWithSideCarInFlightDiffsEnumerator
{
  id v3 = [(BRCPQLConnection *)self->_clientDB fetch:@"SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_doc_id, li.item_file_id, li.item_generation, li.item_localname, li.item_processing_stamp, li.item_staged_file_id, li.item_staged_generation, li.item_bouncedname, li.item_scope, li.item_tmpbounceno, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.desired_version, li.item_live_conflict_loser_etags, li.item_thumb_live_signature, li.item_thumb_greedy, li.version_block_sync_until_bundle_id, li.version_block_sync_until_timestamp FROM client_items AS li INNER JOIN client_sync_up AS su ON su.throttle_id = li.rowid WHERE su.zone_rowid = %@   AND (su.in_flight_diffs BETWEEN -9223372036854775808 AND 9223372036854775807)   AND su.throttle_state != 0", &unk_1F2B26D78];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __80__BRCAccountSession_BRCDatabaseManager__itemsWithSideCarInFlightDiffsEnumerator__block_invoke;
  v6[3] = &unk_1E6994120;
  v6[4] = self;
  id v4 = [v3 enumerateObjects:v6];

  return v4;
}

id __80__BRCAccountSession_BRCDatabaseManager__itemsWithSideCarInFlightDiffsEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (id)deviceKeyForName:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 numberWithSQL:@"SELECT key FROM devices WHERE name = %@", a3];
  return v4;
}

- (id)createDeviceKeyForNameInServerDB:(id)a3
{
  id v4 = a3;
  if (!v4)
  {
LABEL_10:
    id v5 = 0;
    goto LABEL_11;
  }
  id v5 = [(BRCAccountSession *)self deviceKeyForName:v4 db:self->_serverDB];
  if (v5) {
    goto LABEL_11;
  }
  if (![(BRCPQLConnection *)self->_serverDB execute:@"INSERT INTO devices (name) VALUES (%@)", v4])
  {
    id v8 = brc_bread_crumbs();
    int v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) createDeviceKeyForNameInServerDB:]();
    }

    goto LABEL_10;
  }
  id v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSession(BRCDatabaseManager) createDeviceKeyForNameInServerDB:]();
  }

  id v5 = objc_msgSend(NSNumber, "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
LABEL_11:

  return v5;
}

+ (id)userIdentityForKey:(id)a3 db:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[v5 fetchObjectOfClass:objc_opt_class(), @"SELECT user_plist FROM users WHERE user_key = %@", v6 sql];

  return v7;
}

- (id)userIdentityForKey:(id)a3
{
  id v4 = a3;
  id v5 = [(id)objc_opt_class() userIdentityForKey:v4 db:self->_clientDB];

  return v5;
}

+ (id)userIdentityForName:(id)a3 db:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = (void *)[v5 fetchObjectOfClass:objc_opt_class(), @"SELECT user_plist FROM users WHERE user_name = %@", v6 sql];

  return v7;
}

- (void)_setUserIdentity:(id)a3 forName:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(BRCPQLConnection *)self->_serverDB assertOnQueue];
  id v8 = [v6 nameComponents];
  int v9 = objc_msgSend(v8, "br_formattedName");

  if (!v9)
  {
    int v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) _setUserIdentity:forName:]();
    }
  }
  id v10 = brc_bread_crumbs();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v23 = v9;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    unint64_t v27 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] learning name '%@' for user %@%@", buf, 0x20u);
  }

  if (!v6)
  {
    uint64_t v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) _setUserIdentity:forName:]();
    }
  }
  id v12 = [(BRCAccountSession *)self createUserKeyForOwnerName:v7];
  if (![(BRCPQLConnection *)self->_serverDB execute:@"UPDATE users SET user_plist = %@ WHERE user_name = %@", v6, v7])
  {
    uint64_t v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
    {
      BOOL v17 = [(BRCPQLConnection *)self->_serverDB lastError];
      *(_DWORD *)buf = 138412802;
      id v23 = v7;
      __int16 v24 = 2112;
      id v25 = v17;
      __int16 v26 = 2112;
      unint64_t v27 = v13;
      _os_log_fault_impl(&dword_1D353B000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't insert user identity for name '%@': %@%@", buf, 0x20u);
    }
  }
  if ([(BRCPQLConnection *)self->_serverDB changes] != 1)
  {
    BOOL v15 = brc_bread_crumbs();
    BOOL v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) _setUserIdentity:forName:]();
    }
  }
}

- (void)learnParticipantIdentitiesForShare:(id)a3 forceUpdate:(BOOL)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v33 = self;
  [(BRCPQLConnection *)self->_serverDB assertOnQueue];
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v31 = v6;
  id v7 = [v6 participants];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v35 objects:v45 count:16];
  if (v8)
  {
    uint64_t v10 = v8;
    uint64_t v11 = *(void *)v36;
    uint64_t v34 = *MEMORY[0x1E4F19C08];
    *(void *)&long long v9 = 138412290;
    long long v28 = v9;
    BOOL v32 = a4;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v36 != v11) {
          objc_enumerationMutation(v7);
        }
        uint64_t v13 = *(void **)(*((void *)&v35 + 1) + 8 * v12);
        if ((objc_msgSend(v13, "isCurrentUser", v28) & 1) == 0 && objc_msgSend(v13, "acceptanceStatus") == 2)
        {
          id v14 = [v13 userIdentity];
          BOOL v15 = v14;
          if (v14)
          {
            BOOL v16 = [v14 userRecordID];
            if (v16)
            {
              brc_bread_crumbs();
              BOOL v17 = (BRFieldUserIdentity *)objc_claimAutoreleasedReturnValue();
              int v18 = brc_default_log();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412802;
                unint64_t v40 = v13;
                __int16 v41 = 2112;
                unint64_t v42 = v15;
                __int16 v43 = 2112;
                stat v44 = v17;
                _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] user %@ has identity %@%@", buf, 0x20u);
              }

              id v19 = [v15 userRecordID];
              uint64_t v20 = [v19 recordName];

              if (([v20 isEqualToString:v34] & 1) == 0)
              {
                if (a4
                  || ([(id)objc_opt_class() userIdentityForName:v20 db:v33->_serverDB],
                      uint64_t v21 = objc_claimAutoreleasedReturnValue(),
                      v21,
                      !v21))
                {
                  uint64_t v22 = [v15 nameComponents];

                  if (v22)
                  {
                    id v23 = [[BRFieldUserIdentity alloc] initWithCKUserIdentity:v15];
                    __int16 v24 = [(BRFieldUserIdentity *)v23 nameComponents];
                    id v25 = objc_msgSend(v24, "br_formattedName");

                    if (!v25)
                    {
                      __int16 v30 = brc_bread_crumbs();
                      __int16 v26 = brc_default_log();
                      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
                      {
                        *(_DWORD *)buf = v28;
                        unint64_t v40 = v30;
                        _os_log_fault_impl(&dword_1D353B000, v26, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: userFormattedName != nil%@", buf, 0xCu);
                      }
                    }
                    [(BRCAccountSession *)v33 _setUserIdentity:v23 forName:v20];
                    a4 = v32;
                  }
                  else
                  {
                    brc_bread_crumbs();
                    id v23 = (BRFieldUserIdentity *)objc_claimAutoreleasedReturnValue();
                    id v25 = brc_default_log();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT))
                    {
                      unint64_t v29 = [v15 debugDescription];
                      *(_DWORD *)buf = 138412802;
                      unint64_t v40 = v29;
                      __int16 v41 = 2112;
                      unint64_t v42 = v20;
                      __int16 v43 = 2112;
                      stat v44 = v23;
                      _os_log_fault_impl(&dword_1D353B000, v25, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: nameless identity: %@ (user %@)%@", buf, 0x20u);
                    }
                  }
                }
              }
              goto LABEL_26;
            }
          }
          else
          {
            if ([v13 role] == 1)
            {
              BOOL v16 = brc_bread_crumbs();
              uint64_t v20 = brc_default_log();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412546;
                unint64_t v40 = v13;
                __int16 v41 = 2112;
                unint64_t v42 = v16;
                _os_log_fault_impl(&dword_1D353B000, v20, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: owner %@ with no user identity%@", buf, 0x16u);
              }
            }
            else
            {
              BOOL v16 = brc_bread_crumbs();
              uint64_t v20 = brc_default_log();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                unint64_t v40 = v13;
                __int16 v41 = 2112;
                unint64_t v42 = v16;
                _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Participant %@ has no user identity%@", buf, 0x16u);
              }
            }
LABEL_26:
          }
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v27 = [v7 countByEnumeratingWithState:&v35 objects:v45 count:16];
      uint64_t v10 = v27;
    }
    while (v27);
  }
}

- (id)userKeyForOwnerName:(id)a3 db:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 isEqualToString:*MEMORY[0x1E4F19C08]]) {
    id v7 = &unk_1F2B26D90;
  }
  else {
    id v7 = (void *)[v6 numberWithSQL:@"SELECT user_key FROM users WHERE user_name = %@", v5];
  }

  return v7;
}

- (id)userNameForKey:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 stringWithSQL:@"SELECT user_name FROM users WHERE user_key = %@", a3];
  return v4;
}

- (id)createUserKeyForOwnerName:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [(BRCAccountSession *)self userKeyForOwnerName:v4 db:self->_serverDB];
    id v6 = v5;
    if (v5)
    {
      id v7 = v5;
      id v6 = v7;
LABEL_11:
      uint64_t v11 = v7;
      goto LABEL_16;
    }
    if ([(BRCPQLConnection *)self->_serverDB execute:@"INSERT INTO users (user_name) VALUES (%@)", v4])
    {
      long long v9 = brc_bread_crumbs();
      uint64_t v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountSession(BRCDatabaseManager) createUserKeyForOwnerName:]();
      }

      objc_msgSend(NSNumber, "numberWithLongLong:", -[BRCPQLConnection lastInsertedRowID](self->_serverDB, "lastInsertedRowID"));
      id v7 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_11;
    }
    uint64_t v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT))
    {
      BOOL v15 = [(BRCPQLConnection *)self->_serverDB lastError];
      *(_DWORD *)buf = 138412802;
      id v17 = v4;
      __int16 v18 = 2112;
      id v19 = v15;
      __int16 v20 = 2112;
      uint64_t v21 = v12;
      _os_log_fault_impl(&dword_1D353B000, v13, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: can't insert user name: '%@': %@%@", buf, 0x20u);
    }
  }
  else
  {
    id v6 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) createUserKeyForOwnerName:]();
    }
  }
  uint64_t v11 = 0;
LABEL_16:

  return v11;
}

+ (id)nameComponentsForKey:(id)a3 db:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6 && (objc_msgSend(v6, "br_isEqualToNumber:", &unk_1F2B26D90) & 1) == 0)
  {
    long long v9 = [a1 userIdentityForKey:v6 db:v7];
    uint64_t v10 = v9;
    if (v9) {
      [v9 nameComponents];
    }
    else {
    uint64_t v8 = +[BRFieldUserIdentity unknownPersonNameComponents];
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

+ (id)nameComponentsForName:(id)a3 db:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isEqualToString:*MEMORY[0x1E4F19C08]])
  {
    uint64_t v8 = 0;
  }
  else
  {
    long long v9 = [a1 userIdentityForName:v6 db:v7];
    uint64_t v10 = v9;
    if (v9) {
      [v9 nameComponents];
    }
    else {
    uint64_t v8 = +[BRFieldUserIdentity unknownPersonNameComponents];
    }
  }
  return v8;
}

- (void)_clearNeedsUpgradeErrorsWithBrVersion:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSession(BRCDatabaseManager) _clearNeedsUpgradeErrorsWithBrVersion:]();
  }

  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v6 = [(BRCAccountSession *)self _privateClientZonesEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v24 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (([v11 state] & 0x200000) != 0)
        {
          objc_msgSend(v11, "_forDBUpgrade_setStateBits:clearStateBits:", 16, 0x200000);
          [(BRCAccountSession *)self saveClientZoneToDB:v11];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v8);
  }

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v12 = [(BRCAccountSession *)self _sharedClientZonesEnumerator];
  uint64_t v13 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v20;
    do
    {
      for (uint64_t j = 0; j != v14; ++j)
      {
        if (*(void *)v20 != v15) {
          objc_enumerationMutation(v12);
        }
        id v17 = *(void **)(*((void *)&v19 + 1) + 8 * j);
        if (([v17 state] & 0x200000) != 0)
        {
          objc_msgSend(v17, "_forDBUpgrade_setStateBits:clearStateBits:", 16, 0x200000);
          [(BRCAccountSession *)self saveClientZoneToDB:v17];
        }
      }
      uint64_t v14 = [v12 countByEnumeratingWithState:&v19 objects:v27 count:16];
    }
    while (v14);
  }

  __int16 v18 = [(BRCAccountSession *)self clientDB];
  [v18 execute:@"UPDATE client_items SET item_min_supported_os_rowid = NULL"];
}

+ (void)_registerLastBootIfNeeded:(id)a3 table:(id)a4 skipControlFiles:(BOOL)a5 deviceIDChanged:(BOOL *)a6
{
  BOOL v6 = a5;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = OSVersion();
  uint64_t v11 = BRVersion();
  uint64_t v12 = [v8 userVersion];
  uint64_t v13 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v14 = objc_msgSend(NSString, "br_currentSupportDir");
  uint64_t v15 = [v14 stringByAppendingPathComponent:@"device-tracking"];
  BOOL v16 = [v13 fileURLWithPath:v15 isDirectory:0];

  __darwin_ino64_t v26 = 0;
  id v17 = v16;
  if (file_id_from_control_file((const char *)[v17 fileSystemRepresentation], &v26, v6)
    || ([NSNumber numberWithUnsignedLongLong:v26],
        (long long v20 = objc_claimAutoreleasedReturnValue()) == 0))
  {
    __int16 v18 = brc_bread_crumbs();
    long long v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      +[BRCAccountSession(BRCDatabaseManager) _registerLastBootIfNeeded:table:skipControlFiles:deviceIDChanged:]();
    }

    long long v20 = 0;
  }
  long long v21 = (void *)[v8 fetch:@"SELECT os, br, bird_schema, db_schema FROM %@ ORDER BY rowid DESC LIMIT 1", v9];
  if ([v21 next])
  {
    long long v22 = [v21 stringAtIndex:1];
    long long v23 = [v21 stringAtIndex:0];
    if ([v10 isEqualToString:v23]
      && [v11 isEqualToString:v22]
      && [v21 unsignedIntAtIndex:2] == 21007)
    {
      long long v24 = [v21 numberAtIndex:3];
      char v25 = objc_msgSend(v12, "br_isEqualToNumber:", v24);

      [v21 close];
      if (v25) {
        goto LABEL_15;
      }
      goto LABEL_14;
    }
  }
  [v21 close];
LABEL_14:
  [v8 execute:@"INSERT INTO %@ (date,os,br,bird_schema,db_schema) VALUES (%lu,%@,%@,%u,%@)", v9, time(0), v10, v11, 21007, v12];
LABEL_15:
}

- (int64_t)lastBootHistoryTime
{
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v3 = [(PQLConnection *)self->_clientDB numberWithSQL:@"SELECT date FROM boot_history ORDER BY rowid DESC LIMIT 1"];
  int64_t v4 = [v3 longValue];

  return v4;
}

+ (BOOL)_checkIntegrity:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 skipControlFiles:(BOOL)a6 deviceIDChanged:(BOOL *)a7 error:(id *)a8
{
  BOOL v10 = a6;
  BOOL v12 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a5;
  long long v45 = 0uLL;
  uint64_t v46 = 0;
  BOOL v16 = brc_bread_crumbs();
  id v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
    +[BRCAccountSession(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControlFiles:deviceIDChanged:error:](v12);
  }

  if (v12)
  {
    __int16 v18 = (void *)[v14 numberWithSQL:@"SELECT count(*) FROM server_state"];
    if (objc_msgSend(v18, "br_isEqualToNumber:", &unk_1F2B26DA8))
    {
      long long v19 = [MEMORY[0x1E4FBA900] nameWithString:@"server_boot_history"];
      [a1 _registerLastBootIfNeeded:v14 table:v19 skipControlFiles:v10 deviceIDChanged:a7];

      long long v20 = 0;
      long long v21 = 0;
      long long v22 = 0;
      long long v23 = 0;
      long long v24 = 0;
LABEL_44:
      BOOL v28 = 1;
      goto LABEL_47;
    }
    char v25 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 22, @"missing entry in the server_state table");
    if (v25)
    {
      __darwin_ino64_t v26 = brc_bread_crumbs();
      uint64_t v27 = brc_default_log();
      if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
      {
        __int16 v39 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "+[BRCAccountSession(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControlFile"
                             "s:deviceIDChanged:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a8) {
          __int16 v39 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v39;
        *(_WORD *)&buf[22] = 2112;
        v48 = v25;
        __int16 v49 = 2112;
        unint64_t v50 = v26;
        _os_log_error_impl(&dword_1D353B000, v27, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a8) {
      *a8 = v25;
    }

    long long v20 = 0;
    long long v21 = 0;
    long long v22 = 0;
    long long v23 = 0;
    long long v24 = 0;
    BOOL v28 = 0;
    goto LABEL_47;
  }
  if (v15)
  {
    long long v24 = (void *)[v14 fetch:@"SELECT old, new, counter, os, br FROM backup_detector"];
    if ([v24 next])
    {
      *(void *)&long long v45 = [v24 unsignedLongLongAtIndex:0];
      *((void *)&v45 + 1) = [v24 unsignedLongLongAtIndex:1];
      uint64_t v46 = [v24 unsignedLongLongAtIndex:2];
      stat v44 = [v24 stringAtIndex:3];
      long long v22 = [v24 stringAtIndex:4];
    }
    else
    {
      long long v22 = 0;
      stat v44 = 0;
    }
    [v24 close];
    if (!v10)
    {
      *(_OWORD *)buf = v45;
      *(void *)&buf[16] = v46;
      if (![v15 _stepBackupDetector:buf newState:&v45 error:a8])
      {
        __int16 v18 = 0;
        long long v20 = 0;
        long long v21 = 0;
LABEL_46:
        BOOL v28 = 0;
        long long v23 = v44;
        goto LABEL_47;
      }
    }
    unint64_t v42 = a8;
  }
  else
  {
    unint64_t v42 = a8;
    stat v44 = 0;
    long long v22 = 0;
    long long v24 = 0;
  }
  long long v21 = OSVersion();
  long long v20 = BRVersion();
  if (([v22 isEqualToString:v20] & 1) == 0) {
    [v15 _clearNeedsUpgradeErrorsWithBrVersion:v20];
  }
  if (v15
    && ([v14 execute:@"UPDATE backup_detector set old = %llu, new = %llu, counter = %llu, br = %@", v45, v46, v20] & 1) == 0)
  {
    v33 = [v14 lastError];
    if (v33)
    {
      uint64_t v34 = brc_bread_crumbs();
      long long v35 = brc_default_log();
      if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
      {
        __int16 v41 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "+[BRCAccountSession(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControlFile"
                             "s:deviceIDChanged:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!v42) {
          __int16 v41 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v41;
        *(_WORD *)&buf[22] = 2112;
        v48 = v33;
        __int16 v49 = 2112;
        unint64_t v50 = v34;
        _os_log_error_impl(&dword_1D353B000, v35, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (v42) {
      *unint64_t v42 = v33;
    }

    __int16 v18 = 0;
    goto LABEL_46;
  }
  __int16 v18 = (void *)[v14 numberWithSQL:@"SELECT count(*) FROM client_state"];
  if ((objc_msgSend(v18, "br_isEqualToNumber:", &unk_1F2B26DA8) & 1) == 0)
  {
    __int16 v30 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 22, @"missing entry in the client_state table");
    if (v30)
    {
      id v31 = brc_bread_crumbs();
      BOOL v32 = brc_default_log();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
      {
        unint64_t v40 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "+[BRCAccountSession(BRCDatabaseManager) _checkIntegrity:serverTruth:session:skipControlFile"
                             "s:deviceIDChanged:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!v42) {
          unint64_t v40 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v40;
        *(_WORD *)&buf[22] = 2112;
        v48 = v30;
        __int16 v49 = 2112;
        unint64_t v50 = v31;
        _os_log_error_impl(&dword_1D353B000, v32, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (v42) {
      *unint64_t v42 = v30;
    }

    goto LABEL_46;
  }
  id v43 = v15;
  uint64_t v29 = [MEMORY[0x1E4FBA900] nameWithString:@"boot_history"];
  [a1 _registerLastBootIfNeeded:v14 table:v29 skipControlFiles:v10 deviceIDChanged:a7];

  long long v23 = v44;
  if (![v44 isEqualToString:v21]
    || ([v22 isEqualToString:v20] & 1) == 0)
  {
    long long v36 = brc_bread_crumbs();
    long long v37 = brc_default_log();
    id v15 = v43;
    if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138413314;
      *(void *)&uint8_t buf[4] = v22;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v44;
      *(_WORD *)&buf[22] = 2112;
      v48 = v20;
      __int16 v49 = 2112;
      unint64_t v50 = v21;
      __int16 v51 = 2112;
      unint64_t v52 = v36;
      _os_log_impl(&dword_1D353B000, v37, OS_LOG_TYPE_DEFAULT, "[NOTICE] CloudDocs was upgraded from [%@ on %@] to [%@ on %@]%@", buf, 0x34u);
    }

    if (v43) {
      [v14 execute:@"UPDATE backup_detector SET os = %@", v21];
    }
    goto LABEL_44;
  }
  BOOL v28 = 1;
  id v15 = v43;
LABEL_47:

  return v28;
}

+ (id)_classesForClientState
{
  id v18 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v17 = objc_opt_class();
  uint64_t v16 = objc_opt_class();
  uint64_t v15 = objc_opt_class();
  uint64_t v14 = objc_opt_class();
  uint64_t v2 = objc_opt_class();
  uint64_t v3 = objc_opt_class();
  uint64_t v4 = objc_opt_class();
  uint64_t v5 = objc_opt_class();
  uint64_t v6 = objc_opt_class();
  uint64_t v7 = objc_opt_class();
  uint64_t v8 = objc_opt_class();
  uint64_t v9 = objc_opt_class();
  uint64_t v10 = objc_opt_class();
  uint64_t v11 = objc_opt_class();
  BOOL v12 = objc_msgSend(v18, "initWithObjects:", v17, v16, v15, v14, v2, v3, v4, v5, v6, v7, v8, v9, v10, v11, objc_opt_class(), 0);
  return v12;
}

- (void)_loadClientStateFromDB:(id)a3
{
  id v4 = a3;
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSession(BRCDatabaseManager) _loadClientStateFromDB:].cold.5();
  }

  uint64_t v7 = (void *)[v4 fetch:@"SELECT * FROM client_state"];
  uint64_t v8 = +[BRCAccountSession _classesForClientState];
  if (![v7 next])
  {
    abc_report_panic_with_signature();
    long long v21 = NSString;
    long long v22 = [v4 lastError];
    [v21 stringWithFormat:@"there should always be one row in client_state {%@}", v22];
    objc_claimAutoreleasedReturnValue();

    long long v23 = brc_bread_crumbs();
    long long v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) _startWatcher]();
    }

    brc_append_system_info_to_message();
    char v25 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
    __assert_rtn("-[BRCAccountSession(BRCDatabaseManager) _loadClientStateFromDB:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1615, v25);
  }
  uint64_t v9 = [v7 dataAtIndex:0];
  if (v9)
  {
    id v26 = 0;
    uint64_t v10 = [MEMORY[0x1E4F28DC0] unarchivedObjectOfClasses:v8 fromData:v9 error:&v26];
    id v11 = v26;
    if (v11)
    {
      id v12 = v11;
      abc_report_panic_with_signature();
      [NSString stringWithFormat:@"Error while unarchiving client state %@", v12];
      objc_claimAutoreleasedReturnValue();
      uint64_t v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSession(BRCDatabaseManager) _startWatcher]();
      }

      brc_append_system_info_to_message();
      uint64_t v15 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCAccountSession(BRCDatabaseManager) _loadClientStateFromDB:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1610, v15);
    }
  }
  else
  {
    uint64_t v10 = 0;
  }
  [v7 close];
  uint64_t v16 = [[BRCClientState alloc] initWithDictionary:v10 clientStateData:v9];
  p_clientState = &self->_clientState;
  clientState = self->_clientState;
  self->_clientState = v16;

  if (v10)
  {
    long long v19 = brc_bread_crumbs();
    long long v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSession(BRCDatabaseManager) _loadClientStateFromDB:](p_clientState);
    }
  }
  else
  {
    long long v19 = brc_bread_crumbs();
    long long v20 = brc_default_log();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
      -[BRCAccountSession(BRCDatabaseManager) _loadClientStateFromDB:](p_clientState);
    }
  }
}

- (BOOL)_finishClientTruthConnectionSetupWithError:(id *)a3
{
  id v4 = self->_clientDB;
  [(BRCAccountSession *)self _loadClientStateFromDB:v4];
  uint64_t v5 = [(PQLConnection *)v4 stringWithSQL:@"SELECT uuid FROM backup_detector"];
  databaseID = self->_databaseID;
  self->_databaseID = v5;

  if (!self->_databaseID)
  {
    id v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:]();
    }
  }
  objc_initWeak(&location, self);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke;
  v21[3] = &unk_1E69941C0;
  objc_copyWeak(&v22, &location);
  [(BRCPQLConnection *)v4 setPreFlushHook:v21];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2;
  v19[3] = &unk_1E69941C0;
  objc_copyWeak(&v20, &location);
  [(BRCPQLConnection *)v4 setPostFlushHook:v19];
  uint64_t v7 = [(BRCPQLConnection *)v4 autoRollbackHandler];
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  uint64_t v16 = __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_339;
  uint64_t v17 = &unk_1E6994208;
  id v8 = v7;
  id v18 = v8;
  [(BRCPQLConnection *)v4 setAutoRollbackHandler:&v14];
  -[BRCPQLConnection execute:](v4, "execute:", @"CREATE TEMP TRIGGER child_item_count_notifs  AFTER UPDATE OF visible_child_count ON main.client_items  BEGIN  UPDATE client_items SET item_notifs_rank = bump_notifs_rank_and_trigger_notifs(old.rowid)   WHERE old.visible_child_count != new.visible_child_count     AND rowid = old.rowid     AND item_type = 0 ; END",
    v14,
    v15,
    v16,
    v17);
  uint64_t v9 = +[BRCUserDefaults defaultsForMangledID:0];
  [v9 dbBatchDelay];
  -[BRCPQLConnection usePacedBatchingOnTargetQueue:withInterval:changeCount:](v4, "usePacedBatchingOnTargetQueue:withInterval:changeCount:", self->_clientTruthWorkloop, [v9 dbBatchSize], v10);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&v22);
  objc_destroyWeak(&location);

  return 1;
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    uint64_t v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_3();
    }
  }
  if (([WeakRetained isCancelled] & 1) == 0)
  {
    id v6 = WeakRetained[22];
    memset(v25, 0, sizeof(v25));
    __brc_create_section(0, (uint64_t)"-[BRCAccountSession(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:]_block_invoke", 1646, v25);
    uint64_t v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v27 = v25[0];
      __int16 v28 = 2112;
      id v29 = v6;
      __int16 v30 = 2112;
      id v31 = v7;
      _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx db pre-flush: flushing client-state %@%@", buf, 0x20u);
    }

    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_324;
    v23[3] = &unk_1E6994170;
    objc_copyWeak(&v24, v4);
    [WeakRetained enumerateServerZones:v23];
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_326;
    v21[3] = &unk_1E6994198;
    objc_copyWeak(&v22, v4);
    [WeakRetained enumerateAppLibraries:v21];
    id v20 = 0;
    int v9 = [v6 hasStateChangesAndClearSaveStatusWithResultingState:&v20];
    id v10 = v20;
    if (v9)
    {
      id v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_2();
      }

      if (([v3 execute:@"UPDATE client_state SET v = %@", v10] & 1) == 0)
      {
        abc_report_panic_with_signature();
        [NSString stringWithFormat:@"unable to flush client state, crash to maintain consistency"];
        objc_claimAutoreleasedReturnValue();
        uint64_t v16 = brc_bread_crumbs();
        uint64_t v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
        {
          id v18 = brc_append_system_info_to_message();
          __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_1(v18, (uint64_t)v16, (uint64_t)buf, v17);
        }

        brc_append_system_info_to_message();
        long long v19 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
        __assert_rtn("-[BRCAccountSession(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1668, v19);
      }
    }
    uint64_t v13 = [WeakRetained stageRegistry];
    [v13 willFlushAllStagedFileIDs];

    objc_destroyWeak(&v22);
    objc_destroyWeak(&v24);
    __brc_leave_section(v25);
  }
}

uint64_t __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_324(uint64_t a1, void *a2)
{
  id v3 = [a2 clientZone];
  if ([v3 needsSave])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained saveClientZoneToDB:v3];

    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_324_cold_1();
    }
  }
  return 1;
}

uint64_t __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_326(uint64_t a1, void *a2)
{
  id v3 = a2;
  if ([v3 needsSave])
  {
    id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
    [WeakRetained saveAppLibraryToDB:v3];

    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_326_cold_1();
    }
  }
  return 1;
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (!WeakRetained)
  {
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_3();
    }
  }
  if (([WeakRetained isCancelled] & 1) == 0)
  {
    memset(v13, 0, sizeof(v13));
    __brc_create_section(0, (uint64_t)"-[BRCAccountSession(BRCDatabaseManager) _finishClientTruthConnectionSetupWithError:]_block_invoke", 1682, v13);
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_cold_1(v13);
    }

    uint64_t v7 = +[BRCPersistedState loadFromClientStateInSession:WeakRetained];
    uint64_t v8 = [v7 nextNotifRank];

    int v9 = [WeakRetained notificationManager];
    [v9 flushUpdatesWithRank:v8];

    [WeakRetained enumerateClientZones:&__block_literal_global_338];
    id v10 = [WeakRetained recentsEnumerator];
    [v10 maxNotifRankWasFlushed];

    __brc_leave_section(v13);
  }
}

uint64_t __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_335(uint64_t a1, void *a2)
{
  return 1;
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_339(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 domain];
  if (v10 == (void *)*MEMORY[0x1E4FBA910])
  {
    uint64_t v11 = [v9 code];

    if (v11 != 13) {
      goto LABEL_7;
    }
    id v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_339_cold_2();
    }

    id v10 = +[BRCDaemon daemon];
    [v10 restart];
  }

LABEL_7:
  if (objc_msgSend(v9, "brc_isDatabaseRemovalError"))
  {
    uint64_t v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
      __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_339_cold_1();
    }

    uint64_t v16 = +[BRCDaemon daemon];
    [v16 restart];
  }
  (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (BOOL)_finishServerTruthConnectionSetupWithError:(id *)a3
{
  serverDB = self->_serverDB;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __84__BRCAccountSession_BRCDatabaseManager___finishServerTruthConnectionSetupWithError___block_invoke;
  v5[3] = &unk_1E6993A60;
  v5[4] = self;
  return [(BRCPQLConnection *)serverDB performWithFlags:1 action:v5];
}

uint64_t __84__BRCAccountSession_BRCDatabaseManager___finishServerTruthConnectionSetupWithError___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = (void *)[v3 fetch:@"SELECT state FROM server_state"];
  if (([v4 next] & 1) == 0)
  {
    uint64_t v6 = [v3 lastError];
    if (v6)
    {
      uint64_t v10 = v6;
      abc_report_panic_with_signature();
      [NSString stringWithFormat:@"there should always be one row in server_state: %@", v10];
      objc_claimAutoreleasedReturnValue();
      uint64_t v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSession(BRCDatabaseManager) _startWatcher]();
      }

      brc_append_system_info_to_message();
      uint64_t v13 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCAccountSession(BRCDatabaseManager) _finishServerTruthConnectionSetupWithError:]_block_invoke", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1770, v13);
    }
    [v4 close];
    goto LABEL_6;
  }
  uint64_t v5 = [v4 unarchivedObjectOfClass:objc_opt_class() atIndex:0];
  [v4 close];
  if (!v5)
  {
LABEL_6:
    uint64_t v5 = objc_alloc_init(BRCServerPersistedState);
    [(BRCServerPersistedState *)v5 saveToDB:v3];
  }
  uint64_t v7 = *(void *)(a1 + 32);
  id v8 = *(void **)(v7 + 184);
  *(void *)(v7 + 184) = v5;

  return 1;
}

- (BOOL)openAndValidateDatabase:(id)a3 serverTruth:(BOOL)a4 initialVersion:(unsigned int *)a5 lastCurrentVersion:(unsigned int *)a6 deviceIDChanged:(BOOL *)a7 error:(id *)a8
{
  BOOL v12 = a4;
  id v14 = a3;
  LOBYTE(a8) = [(id)objc_opt_class() openAndValidateDatabase:v14 serverTruth:v12 session:self baseURL:self->_dbURL skipControlFiles:0 initialVersion:a5 lastCurrentVersion:a6 deviceIDChanged:a7 error:a8];

  return (char)a8;
}

+ (BOOL)openAndValidateDatabase:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 baseURL:(id)a6 skipControlFiles:(BOOL)a7 initialVersion:(unsigned int *)a8 lastCurrentVersion:(unsigned int *)a9 deviceIDChanged:(BOOL *)a10 error:(id *)a11
{
  BOOL v15 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v18 = a5;
  id v19 = a6;
  id v20 = @"client.db";
  if (v15) {
    id v20 = @"server.db";
  }
  id v31 = v20;
  uint64_t v43 = 0;
  brc_bread_crumbs();
  long long v21 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  id v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v31;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v19;
    *(_WORD *)&buf[22] = 2112;
    __int16 v51 = v21;
    _os_log_debug_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Opening DB %@ in base URL: %@%@", buf, 0x20u);
  }

  if ([a1 _openConnection:v17 serverTruth:v15 databaseName:v31 baseURL:v19 initialVersion:(char *)&v43 + 4 lastCurrentVersion:&v43 error:a11])
  {
    if (a8) {
      *a8 = HIDWORD(v43);
    }
    if (a9) {
      *a9 = v43;
    }
    if (HIDWORD(v43) >> 4 >= 0x753)
    {
      long long v23 = brc_bread_crumbs();
      id v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        +[BRCAccountSession(BRCDatabaseManager) openAndValidateDatabase:serverTruth:session:baseURL:skipControlFiles:initialVersion:lastCurrentVersion:deviceIDChanged:error:]();
      }

      a7 = 1;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    __int16 v51 = __Block_byref_object_copy__3;
    unint64_t v52 = __Block_byref_object_dispose__3;
    id v53 = 0;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __166__BRCAccountSession_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke;
    v32[3] = &unk_1E6994230;
    id v33 = v17;
    id v37 = a1;
    id v34 = v19;
    id v25 = v18;
    BOOL v41 = v15;
    int v39 = HIDWORD(v43);
    int v40 = v43;
    id v35 = v25;
    long long v36 = buf;
    BOOL v42 = a7;
    long long v38 = a10;
    char v26 = [v33 performWithFlags:10 action:v32];
    uint64_t v27 = brc_bread_crumbs();
    __int16 v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v30 = *(void *)(*(void *)&buf[8] + 40);
      *(_DWORD *)stat v44 = 138412802;
      long long v45 = v31;
      __int16 v46 = 2112;
      uint64_t v47 = v30;
      __int16 v48 = 2112;
      __int16 v49 = v27;
      _os_log_debug_impl(&dword_1D353B000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] Done with %@ DB: error: %@%@", v44, 0x20u);
    }

    if (a11) {
      *a11 = *(id *)(*(void *)&buf[8] + 40);
    }

    _Block_object_dispose(buf, 8);
  }
  else
  {
    char v26 = 0;
  }

  return v26;
}

uint64_t __166__BRCAccountSession_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke(uint64_t a1)
{
  if (([*(id *)(a1 + 32) execute:@"PRAGMA recursive_triggers = true"] & 1) == 0)
  {
    uint64_t v2 = brc_bread_crumbs();
    id v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __166__BRCAccountSession_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke_cold_1();
    }
  }
  id v4 = *(void **)(a1 + 64);
  uint64_t v5 = *(void *)(a1 + 32);
  uint64_t v6 = *(void *)(a1 + 40);
  uint64_t v7 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v8 = *(unsigned int *)(a1 + 80);
  uint64_t v9 = *(unsigned int *)(a1 + 84);
  uint64_t v10 = *(void *)(a1 + 48);
  uint64_t v11 = *(void *)(*(void *)(a1 + 56) + 8);
  id obj = *(id *)(v11 + 40);
  int v12 = [v4 _validateDatabase:v5 baseURL:v6 session:v10 serverTruth:v7 initialVersion:v8 lastCurrentVersion:v9 error:&obj];
  objc_storeStrong((id *)(v11 + 40), obj);
  if (!v12) {
    return 0;
  }
  uint64_t v13 = *(void *)(a1 + 32);
  uint64_t v14 = *(unsigned __int8 *)(a1 + 88);
  uint64_t v15 = *(unsigned __int8 *)(a1 + 89);
  uint64_t v16 = *(void **)(a1 + 64);
  uint64_t v17 = *(void *)(a1 + 72);
  uint64_t v18 = *(void *)(a1 + 48);
  uint64_t v19 = *(void *)(*(void *)(a1 + 56) + 8);
  id v27 = *(id *)(v19 + 40);
  int v20 = [v16 _checkIntegrity:v13 serverTruth:v14 session:v18 skipControlFiles:v15 deviceIDChanged:v17 error:&v27];
  objc_storeStrong((id *)(v19 + 40), v27);
  if (!v20) {
    return 0;
  }
  long long v21 = *(void **)(a1 + 48);
  if (!v21) {
    return 1;
  }
  uint64_t v22 = *(void *)(a1 + 32);
  uint64_t v23 = *(void *)(*(void *)(a1 + 56) + 8);
  id v26 = *(id *)(v23 + 40);
  uint64_t v24 = [v21 _registerDynamicDBFunctions:v22 error:&v26];
  objc_storeStrong((id *)(v23 + 40), v26);
  return v24;
}

+ (BOOL)_openConnection:(id)a3 serverTruth:(BOOL)a4 databaseName:(id)a5 baseURL:(id)a6 initialVersion:(unsigned int *)a7 lastCurrentVersion:(unsigned int *)a8 error:(id *)a9
{
  uint64_t v14 = a9;
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  uint64_t v18 = brc_bread_crumbs();
  uint64_t v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    +[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.8();
  }

  id v96 = 0;
  BOOL v20 = +[BRCAccountSession _openConnection:v15 databaseName:v16 baseURL:v17 readonly:0 error:&v96];
  id v21 = v96;
  if (v20)
  {
    uint64_t v22 = [v15 userVersion];
    uint64_t v23 = [v22 unsignedIntValue];

    if (!v23)
    {
      unsigned int v36 = 0;
      unsigned int v37 = 0;
      if (a4)
      {
LABEL_64:
        if (!a7)
        {
LABEL_66:
          if (a8) {
            *a8 = v37;
          }
          BOOL v35 = 1;
          goto LABEL_69;
        }
LABEL_65:
        *a7 = v36;
        goto LABEL_66;
      }
      goto LABEL_60;
    }
    v92 = a7;
    v93 = a8;
    uint64_t v24 = +[BRCEventsAnalytics sharedAnalytics];
    id v25 = v24;
    if ((v23 - 3000) > 0x3EA)
    {
      if (v23 <= 0x75)
      {
        BOOL v91 = a4;
        long long v38 = brc_bread_crumbs();
        int v39 = brc_default_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_FAULT)) {
          +[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:]();
        }

        int v40 = objc_msgSend(NSString, "stringWithFormat:", @"old-db-%d.%03d", 0, v23);
        [v25 registerAndSendNewContainerResetWithOutcome:v40];

        goto LABEL_21;
      }
      id v26 = a9;
      unsigned int v60 = v23 >> 4;
      if (v23 >> 4 < 0x521 || (v23 - 21000) < 0x3E8)
      {

        uint64_t v14 = a9;
        goto LABEL_57;
      }
      BOOL v91 = a4;
      unint64_t v75 = v23 / 0x3E8uLL;
      v76 = brc_bread_crumbs();
      v77 = brc_default_log();
      if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
        +[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:]();
      }

      if (v60 < 0x753) {
        +[BRCDatabaseFromTheFutureException raise:@"DatabaseFromTheFuture", @"database has a major version from the future: %d (want at most %d)", v75, 21 format];
      }
      else {
        +[BRCDatabaseFromFPFSException raise:@"DatabaseFromFPFS", @"database version (%d) is from FPFS but we are in Legacy", v75, v89 format];
      }
    }
    else
    {
      BOOL v91 = a4;
      id v26 = a9;
      id v27 = brc_bread_crumbs();
      __int16 v28 = brc_default_log();
      uint64_t v29 = (unsigned __int16)v23 / 0x3E8u;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v98 = (unsigned __int16)v23 / 0x3E8u;
        uint64_t v30 = (unsigned __int16)v23 % 0x3E8u;
        *(_WORD *)&v98[4] = 1024;
        *(_DWORD *)&v98[6] = v30;
        *(_WORD *)&v98[10] = 2112;
        *(void *)&v98[12] = v27;
        _os_log_fault_impl(&dword_1D353B000, v28, OS_LOG_TYPE_FAULT, "[CRIT] Internal users only version %d.%03d has seen an ulterior change and needs to be reset%@", buf, 0x18u);
      }
      else
      {
        uint64_t v30 = (unsigned __int16)v23 % 0x3E8u;
      }

      id v31 = objc_msgSend(NSString, "stringWithFormat:", @"internal-db-%d.%03d", v29, v30);
      [v25 registerAndSendNewContainerResetWithOutcome:v31];
    }
    uint64_t v14 = v26;
LABEL_21:

    int v95 = 61;
    int v41 = sqlite3_file_control((sqlite3 *)[v15 dbHandle], 0, 101, &v95);
    if (v41)
    {
      int v42 = v41;
      uint64_t v43 = brc_bread_crumbs();
      stat v44 = brc_default_log();
      if (os_log_type_enabled(v44, (os_log_type_t)0x90u))
      {
        v78 = sqlite3_errmsg((sqlite3 *)[v15 dbHandle]);
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)v98 = v42;
        *(_WORD *)&v98[4] = 2080;
        *(void *)&v98[6] = v78;
        *(_WORD *)&v98[14] = 2112;
        *(void *)&v98[16] = v43;
        _os_log_error_impl(&dword_1D353B000, v44, (os_log_type_t)0x90u, "[ERROR] unable to truncate database: %d; %s%@",
          buf,
          0x1Cu);
      }

      objc_msgSend(v15, "brc_close");
      id v45 = [v15 url];
      int v46 = unlink((const char *)[v45 fileSystemRepresentation]);

      if (v46 < 0)
      {
        int v47 = *__error();
        __int16 v48 = brc_bread_crumbs();
        __int16 v49 = brc_default_log();
        if (os_log_type_enabled(v49, (os_log_type_t)0x90u))
        {
          v82 = [v15 url];
          *(_DWORD *)buf = 138412802;
          *(void *)v98 = v82;
          *(_WORD *)&v98[8] = 1024;
          *(_DWORD *)&v98[10] = v47;
          *(_WORD *)&v98[14] = 2112;
          *(void *)&v98[16] = v48;
          _os_log_error_impl(&dword_1D353B000, v49, (os_log_type_t)0x90u, "[ERROR] can't unlink '%@' %{errno}d%@", buf, 0x1Cu);
        }
        *__error() = v47;
      }
    }
    else
    {
      objc_msgSend(v15, "brc_close");
    }
    id v94 = v21;
    BOOL v50 = +[BRCAccountSession _openConnection:v15 databaseName:v16 baseURL:v17 readonly:0 error:&v94];
    id v34 = v94;

    if (!v50)
    {
      v58 = brc_bread_crumbs();
      v59 = brc_default_log();
      if (os_log_type_enabled(v59, (os_log_type_t)0x90u)) {
        +[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.4();
      }

      if (v14) {
        id *v14 = v34;
      }
      goto LABEL_52;
    }
    __int16 v51 = [v15 userVersion];
    uint64_t v23 = [v51 unsignedIntValue];

    a4 = v91;
    if (v23)
    {
      unint64_t v52 = +[BRCEventsAnalytics sharedAnalytics];
      id v53 = v52;
      if ((v23 - 3000) <= 0x3EA)
      {
        uint64_t v54 = brc_bread_crumbs();
        __int16 v55 = brc_default_log();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v98 = (unsigned __int16)v23 / 0x3E8u;
          uint64_t v56 = (unsigned __int16)v23 % 0x3E8u;
          *(_WORD *)&v98[4] = 1024;
          *(_DWORD *)&v98[6] = (unsigned __int16)v23 % 0x3E8u;
          *(_WORD *)&v98[10] = 2112;
          *(void *)&v98[12] = v54;
          _os_log_fault_impl(&dword_1D353B000, v55, OS_LOG_TYPE_FAULT, "[CRIT] Internal users only version %d.%03d has seen an ulterior change and needs to be reset%@", buf, 0x18u);
        }
        else
        {
          uint64_t v56 = (unsigned __int16)v23 % 0x3E8u;
        }

        uint64_t v57 = objc_msgSend(NSString, "stringWithFormat:", @"internal-db-%d.%03d", (unsigned __int16)v23 / 0x3E8u, v56);
        [v53 registerAndSendNewContainerResetWithOutcome:v57];

LABEL_46:
        v64 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:description:", 70, @"db is stale even after recreating");
        if (v64)
        {
          v65 = brc_bread_crumbs();
          v66 = brc_default_log();
          if (os_log_type_enabled(v66, (os_log_type_t)0x90u))
          {
            v83 = "(passed to caller)";
            *(_DWORD *)buf = 136315906;
            *(void *)v98 = "+[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:in"
                             "itialVersion:lastCurrentVersion:error:]";
            *(_WORD *)&v98[8] = 2080;
            if (!v14) {
              v83 = "(ignored by caller)";
            }
            *(void *)&v98[10] = v83;
            *(_WORD *)&v98[18] = 2112;
            *(void *)&v98[20] = v64;
            __int16 v99 = 2112;
            v100 = v65;
            _os_log_error_impl(&dword_1D353B000, v66, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
          }
        }
        if (v14) {
          id *v14 = v64;
        }

LABEL_52:
        BOOL v35 = 0;
        goto LABEL_70;
      }
      if (v23 <= 0x75)
      {
        v61 = brc_bread_crumbs();
        v62 = brc_default_log();
        if (os_log_type_enabled(v62, OS_LOG_TYPE_FAULT)) {
          +[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:]();
        }

        v63 = objc_msgSend(NSString, "stringWithFormat:", @"old-db-%d.%03d", 0, v23);
        [v53 registerAndSendNewContainerResetWithOutcome:v63];

        goto LABEL_46;
      }
      v67 = v14;
      unsigned int v68 = v23 >> 4;
      if (v23 >> 4 >= 0x521 && (v23 - 21000) >= 0x3E8)
      {
        unint64_t v79 = v23 / 0x3E8uLL;
        v80 = brc_bread_crumbs();
        v81 = brc_default_log();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_FAULT)) {
          +[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:]();
        }

        if (v68 < 0x753) {
          +[BRCDatabaseFromTheFutureException raise:@"DatabaseFromTheFuture", @"database has a major version from the future: %d (want at most %d)", v79, 21 format];
        }
        else {
          +[BRCDatabaseFromFPFSException raise:@"DatabaseFromFPFS", @"database version (%d) is from FPFS but we are in Legacy", v79, v90 format];
        }
        uint64_t v14 = v67;
        goto LABEL_46;
      }

      uint64_t v14 = v67;
    }
    id v21 = v34;
LABEL_57:
    a7 = v92;
    a8 = v93;
    if (a4)
    {
      if (v23)
      {
        v69 = @"SELECT bird_schema FROM server_boot_history ORDER BY rowid DESC LIMIT 1";
LABEL_63:
        v73 = (void *)[v15 numberWithSQL:v69];
        unsigned int v37 = [v73 unsignedIntValue];

        unsigned int v36 = v23;
        goto LABEL_64;
      }
      goto LABEL_71;
    }
LABEL_60:
    v70 = [v17 URLByAppendingPathComponent:@"server.db"];
    v71 = [v70 path];
    char v72 = [v15 attachDBAtPath:v71 as:@"server" error:v14];

    if ((v72 & 1) == 0)
    {
      abc_report_panic_with_signature();
      v84 = NSString;
      v85 = [v15 lastError];
      [v84 stringWithFormat:@"we should be able to attach the server db {%@}", v85];
      objc_claimAutoreleasedReturnValue();

      v86 = brc_bread_crumbs();
      v87 = brc_default_log();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSession(BRCDatabaseManager) _startWatcher]();
      }

      brc_append_system_info_to_message();
      v88 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("+[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/database/BRCDatabaseManager.m", 1887, v88);
    }
    if (v23)
    {
      v69 = @"SELECT bird_schema FROM boot_history ORDER BY rowid DESC LIMIT 1";
      goto LABEL_63;
    }
LABEL_71:
    unsigned int v36 = 0;
    unsigned int v37 = 0;
    if (!a7) {
      goto LABEL_66;
    }
    goto LABEL_65;
  }
  uint64_t v32 = brc_bread_crumbs();
  id v33 = brc_default_log();
  if (os_log_type_enabled(v33, (os_log_type_t)0x90u)) {
    +[BRCAccountSession(BRCDatabaseManager) _openConnection:serverTruth:databaseName:baseURL:initialVersion:lastCurrentVersion:error:].cold.7();
  }

  if (!a9)
  {
    BOOL v35 = 0;
LABEL_69:
    id v34 = v21;
    goto LABEL_70;
  }
  id v34 = v21;
  BOOL v35 = 0;
  *a9 = v34;
LABEL_70:

  return v35;
}

+ (BOOL)_validateDatabase:(id)a3 baseURL:(id)a4 session:(id)a5 serverTruth:(BOOL)a6 initialVersion:(unsigned int)a7 lastCurrentVersion:(unsigned int)a8 error:(id *)a9
{
  BOOL v11 = a6;
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v65 = a3;
  id v64 = a4;
  id v66 = a5;
  uint64_t v14 = brc_bread_crumbs();
  id v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    +[BRCAccountSession(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:](v11);
  }

  uint64_t v63 = os_transaction_create();
  id v16 = off_1F2AC5B50;
  if (off_1F2AC5B50)
  {
    uint64_t v17 = 0;
    unsigned int v18 = 1;
    do
    {
      unsigned int v19 = *((_DWORD *)&internal_fixups + 4 * v17);
      if (v19 > a7) {
        break;
      }
      if (v19 == a7)
      {
        BOOL v20 = brc_bread_crumbs();
        id v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v69 = a8;
          *(_WORD *)&v69[4] = 1024;
          *(_DWORD *)&v69[6] = a7;
          *(_WORD *)&v69[10] = 2112;
          *(void *)&v69[12] = v20;
          _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEFAULT, "[NOTICE] doing an internal fixup from %d to %d%@", buf, 0x18u);
        }

        id v67 = 0;
        uint64_t v22 = (void *)MEMORY[0x1D9438760]();
        char v23 = ((uint64_t (*)(id, id, BOOL, id *))v16)(v66, v65, v11, &v67);
        if ((v23 & 1) == 0)
        {
          int v47 = brc_bread_crumbs();
          __int16 v48 = brc_default_log();
          __int16 v49 = a9;
          if (os_log_type_enabled(v48, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v69 = a8;
            *(_WORD *)&v69[4] = 1024;
            *(_DWORD *)&v69[6] = a7;
            *(_WORD *)&v69[10] = 2112;
            *(void *)&v69[12] = v67;
            *(_WORD *)&v69[20] = 2112;
            *(void *)&v69[22] = v47;
            _os_log_error_impl(&dword_1D353B000, v48, (os_log_type_t)0x90u, "[ERROR] can't internal fixup from version %d to %d: %@%@", buf, 0x22u);
          }

LABEL_50:
          id v34 = v65;
LABEL_51:
          unint64_t v52 = v64;
          if (v49) {
LABEL_52:
          }
            *__int16 v49 = v67;
LABEL_53:

          BOOL v53 = 0;
          uint64_t v54 = (void *)v63;
          goto LABEL_59;
        }
      }
      uint64_t v17 = v18;
      id v16 = (uint64_t (*)())*((void *)&internal_fixups + 2 * v18++ + 1);
    }
    while (v16);
  }
  uint64_t v24 = off_1F2AC5B80;
  if (off_1F2AC5B80)
  {
    uint64_t v25 = 0;
    unsigned int v26 = 1;
    do
    {
      unsigned int v27 = *((_DWORD *)&schema_fixups + 4 * v25);
      if (v27 > a7) {
        break;
      }
      if (v27 > a8)
      {
        __int16 v28 = brc_bread_crumbs();
        uint64_t v29 = brc_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 67109634;
          *(_DWORD *)v69 = a8;
          *(_WORD *)&v69[4] = 1024;
          *(_DWORD *)&v69[6] = v27;
          *(_WORD *)&v69[10] = 2112;
          *(void *)&v69[12] = v28;
          _os_log_impl(&dword_1D353B000, v29, OS_LOG_TYPE_DEFAULT, "[NOTICE] fixuping database from version %d to %d%@", buf, 0x18u);
        }

        id v67 = 0;
        uint64_t v30 = (void *)MEMORY[0x1D9438760]();
        char v31 = ((uint64_t (*)(id, id, BOOL, id *))v24)(v66, v65, v11, &v67);
        if ((v31 & 1) == 0)
        {
          BOOL v50 = brc_bread_crumbs();
          __int16 v51 = brc_default_log();
          __int16 v49 = a9;
          if (os_log_type_enabled(v51, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)v69 = a8;
            *(_WORD *)&v69[4] = 1024;
            *(_DWORD *)&v69[6] = v27;
            *(_WORD *)&v69[10] = 2112;
            *(void *)&v69[12] = v67;
            *(_WORD *)&v69[20] = 2112;
            *(void *)&v69[22] = v50;
            _os_log_error_impl(&dword_1D353B000, v51, (os_log_type_t)0x90u, "[ERROR] can't fixup from version %d to %d: %@%@", buf, 0x22u);
          }

          goto LABEL_50;
        }
      }
      uint64_t v25 = v26;
      uint64_t v24 = (uint64_t (*)())*((void *)&schema_fixups + 2 * v26++ + 1);
    }
    while (v24);
  }
  if (a7 >> 4 < 0x521)
  {
    id v34 = v65;
    if (a7 == 21007)
    {
      uint64_t v32 = brc_bread_crumbs();
      id v33 = brc_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG)) {
        +[BRCAccountSession(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:]();
      }
    }
    else
    {
      BOOL v35 = off_1F2AC52E0;
      if (off_1F2AC52E0)
      {
        uint64_t v36 = 0;
        if (v11) {
          unsigned int v37 = "server";
        }
        else {
          unsigned int v37 = "client";
        }
        unsigned int v38 = 1;
        while (1)
        {
          uint64_t v39 = *((unsigned int *)&schema_upgrades + 4 * v36);
          if (v39 > a7)
          {
            int v40 = brc_bread_crumbs();
            int v41 = brc_default_log();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 136315906;
              *(void *)v69 = v37;
              *(_WORD *)&v69[8] = 1024;
              *(_DWORD *)&v69[10] = a7;
              *(_WORD *)&v69[14] = 1024;
              *(_DWORD *)&v69[16] = v39;
              *(_WORD *)&v69[20] = 2112;
              *(void *)&v69[22] = v40;
              _os_log_impl(&dword_1D353B000, v41, OS_LOG_TYPE_DEFAULT, "[NOTICE] migrating %s database from version %d to %d%@", buf, 0x22u);
            }

            id v67 = 0;
            int v42 = (void *)MEMORY[0x1D9438760]();
            char v43 = ((uint64_t (*)(id, id, BOOL, id *))v35)(v66, v65, v11, &v67);
            if ((v43 & 1) == 0)
            {
              uint64_t v57 = brc_bread_crumbs();
              v58 = brc_default_log();
              __int16 v49 = a9;
              if (os_log_type_enabled(v58, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 67109890;
                *(_DWORD *)v69 = a7;
                *(_WORD *)&v69[4] = 1024;
                *(_DWORD *)&v69[6] = v39;
                *(_WORD *)&v69[10] = 2112;
                *(void *)&v69[12] = v67;
                *(_WORD *)&v69[20] = 2112;
                *(void *)&v69[22] = v57;
                _os_log_error_impl(&dword_1D353B000, v58, (os_log_type_t)0x90u, "[ERROR] can't migrate from version %d to %d: %@%@", buf, 0x22u);
              }

              goto LABEL_51;
            }
            if (([v65 setUserVersion:v39] & 1) == 0)
            {
              v59 = [v65 lastError];
              id v60 = v67;
              id v67 = v59;

              v61 = brc_bread_crumbs();
              v62 = brc_default_log();
              unint64_t v52 = v64;
              if (os_log_type_enabled(v62, (os_log_type_t)0x90u))
              {
                *(_DWORD *)buf = 67109634;
                *(_DWORD *)v69 = v39;
                *(_WORD *)&v69[4] = 2112;
                *(void *)&v69[6] = v67;
                *(_WORD *)&v69[14] = 2112;
                *(void *)&v69[16] = v61;
                _os_log_error_impl(&dword_1D353B000, v62, (os_log_type_t)0x90u, "[ERROR] can't set user version to %u: %@%@", buf, 0x1Cu);
              }

              __int16 v49 = a9;
              if (a9) {
                goto LABEL_52;
              }
              goto LABEL_53;
            }
            stat v44 = [v65 userVersion];
            a7 = [v44 unsignedIntValue];

            if (a7 != v39)
            {
              id v45 = brc_bread_crumbs();
              int v46 = brc_default_log();
              if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)v69 = v45;
                _os_log_fault_impl(&dword_1D353B000, v46, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: db_version == schema_upgrades[i].version%@", buf, 0xCu);
              }
            }
          }
          uint64_t v36 = v38;
          BOOL v35 = (uint64_t (*)())*((void *)&schema_upgrades + 2 * v38++ + 1);
          if (!v35)
          {
            if (a7 == 21007) {
              goto LABEL_58;
            }
            break;
          }
        }
      }
      uint64_t v32 = brc_bread_crumbs();
      id v33 = brc_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        +[BRCAccountSession(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:]();
      }
    }
  }
  else
  {
    uint64_t v32 = brc_bread_crumbs();
    id v33 = brc_default_log();
    id v34 = v65;
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)v69 = a7;
      *(_WORD *)&v69[4] = 1024;
      *(_DWORD *)&v69[6] = 21007;
      *(_WORD *)&v69[10] = 2112;
      *(void *)&v69[12] = v32;
      _os_log_impl(&dword_1D353B000, v33, OS_LOG_TYPE_DEFAULT, "[WARNING] your database comes from a compatible future (db at version %d, current is %d)%@", buf, 0x18u);
    }
  }

LABEL_58:
  uint64_t v54 = (void *)v63;
  id v55 = self;
  BOOL v53 = 1;
  unint64_t v52 = v64;
LABEL_59:

  return v53;
}

+ (BOOL)upgradeOfflineDB:(id)a3 serverTruth:(BOOL)a4 session:(id)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a5;
  BOOL v11 = [v9 userVersion];
  int v12 = [v11 unsignedIntValue];

  if (v12 >= 21008)
  {
    uint64_t v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)unsigned int v38 = v12;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = 21007;
      *(_WORD *)&v38[10] = 2112;
      *(void *)&v38[12] = v13;
      _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] your database comes from a compatible future (db at version %d, current is %d)%@", buf, 0x18u);
    }

    goto LABEL_12;
  }
  if (v12 == 21007)
  {
    uint64_t v13 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      +[BRCAccountSession(BRCDatabaseManager) _validateDatabase:baseURL:session:serverTruth:initialVersion:lastCurrentVersion:error:]();
    }
LABEL_11:

LABEL_12:
LABEL_13:
    BOOL v16 = 1;
    goto LABEL_14;
  }
  if ((v12 - 21000) < 0x3E8)
  {
    uint64_t v13 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      +[BRCAccountSession(BRCDatabaseManager) upgradeOfflineDB:serverTruth:session:error:]();
    }
    goto LABEL_11;
  }
  unsigned int v18 = off_1F2AC52E0;
  if (!off_1F2AC52E0) {
    goto LABEL_13;
  }
  id v34 = a6;
  uint64_t v19 = 0;
  BOOL v20 = "client";
  if (v8) {
    BOOL v20 = "server";
  }
  BOOL v35 = v20;
  unsigned int v21 = 1;
  while (1)
  {
    uint64_t v22 = *((unsigned int *)&schema_upgrades + 4 * v19);
    if (v22 <= v12) {
      goto LABEL_25;
    }
    char v23 = brc_bread_crumbs();
    uint64_t v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315906;
      *(void *)unsigned int v38 = v35;
      *(_WORD *)&v38[8] = 1024;
      *(_DWORD *)&v38[10] = v12;
      *(_WORD *)&v38[14] = 1024;
      *(_DWORD *)&v38[16] = v22;
      *(_WORD *)&v38[20] = 2112;
      *(void *)&v38[22] = v23;
      _os_log_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEFAULT, "[NOTICE] migrating %s database from version %d to %d%@", buf, 0x22u);
    }

    id v36 = 0;
    uint64_t v25 = (void *)MEMORY[0x1D9438760]();
    char v26 = ((uint64_t (*)(id, id, BOOL, id *))v18)(v10, v9, v8, &v36);
    if ((v26 & 1) == 0) {
      break;
    }
    if (([v9 setUserVersion:v22] & 1) == 0)
    {
      uint64_t v30 = [v9 lastError];
      id v31 = v36;
      id v36 = v30;

      uint64_t v32 = brc_bread_crumbs();
      id v33 = brc_default_log();
      if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 67109634;
        *(_DWORD *)unsigned int v38 = v22;
        *(_WORD *)&v38[4] = 2112;
        *(void *)&v38[6] = v36;
        *(_WORD *)&v38[14] = 2112;
        *(void *)&v38[16] = v32;
        _os_log_error_impl(&dword_1D353B000, v33, (os_log_type_t)0x90u, "[ERROR] can't set user version to %u: %@%@", buf, 0x1Cu);
      }

      goto LABEL_33;
    }
    unsigned int v27 = [v9 userVersion];
    int v12 = [v27 unsignedIntValue];

LABEL_25:
    uint64_t v19 = v21;
    unsigned int v18 = (uint64_t (*)())*((void *)&schema_upgrades + 2 * v21++ + 1);
    if (!v18) {
      goto LABEL_13;
    }
  }
  __int16 v28 = brc_bread_crumbs();
  uint64_t v29 = brc_default_log();
  if (os_log_type_enabled(v29, (os_log_type_t)0x90u))
  {
    *(_DWORD *)buf = 67109890;
    *(_DWORD *)unsigned int v38 = v12;
    *(_WORD *)&v38[4] = 1024;
    *(_DWORD *)&v38[6] = v22;
    *(_WORD *)&v38[10] = 2112;
    *(void *)&v38[12] = v36;
    *(_WORD *)&v38[20] = 2112;
    *(void *)&v38[22] = v28;
    _os_log_error_impl(&dword_1D353B000, v29, (os_log_type_t)0x90u, "[ERROR] can't migrate from version %d to %d: %@%@", buf, 0x22u);
  }

LABEL_33:
  if (v34) {
    id *v34 = v36;
  }

  BOOL v16 = 0;
LABEL_14:

  return v16;
}

- (BOOL)openDBWithError:(id *)a3
{
  if (!self->_offline) {
    [(BRCAccountSession *)self setupDatabase];
  }
  [(BRCPQLConnection *)self->_clientDB setCrashIfUsedAfterClose:0];
  [(BRCPQLConnection *)self->_serverDB setCrashIfUsedAfterClose:0];
  uint64_t v18 = 0;
  char v17 = 0;
  if (!self->_offline
    && (![(BRCAccountSession *)self openAndValidateDatabase:self->_serverDB serverTruth:1 initialVersion:0 lastCurrentVersion:&v18 deviceIDChanged:0 error:a3]|| ![(BRCAccountSession *)self openAndValidateDatabase:self->_clientDB serverTruth:0 initialVersion:0 lastCurrentVersion:(char *)&v18 + 4 deviceIDChanged:&v17 error:a3]))
  {
    [(BRCPQLConnection *)self->_serverDB brc_close];
    serverDB = self->_serverDB;
    self->_serverDB = 0;

    goto LABEL_12;
  }
  [(BRCAccountSession *)self _startWatcher];
  [(BRCPQLConnection *)self->_serverDB useSerialQueueWithTarget:self->_serverTruthWorkloop];
  BOOL v5 = [(BRCAccountSession *)self _finishClientTruthConnectionSetupWithError:a3];
  if (!v5
    || ![(BRCAccountSession *)self _finishServerTruthConnectionSetupWithError:a3])
  {
    BOOL v8 = self->_serverDB;
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__BRCAccountSession_BRCDatabaseManager__openDBWithError___block_invoke;
    v16[3] = &unk_1E6993A60;
    void v16[4] = self;
    [(BRCPQLConnection *)v8 performWithFlags:1 action:v16];
    id v9 = self->_serverDB;
    self->_serverDB = 0;

    if (v5)
    {
      clientDB = self->_clientDB;
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __57__BRCAccountSession_BRCDatabaseManager__openDBWithError___block_invoke_2;
      v15[3] = &unk_1E6993A60;
      v15[4] = self;
      [(BRCPQLConnection *)clientDB performWithFlags:1 action:v15];
LABEL_13:
      int v12 = self->_clientDB;
      self->_clientDB = 0;

      databaseID = self->_databaseID;
      self->_databaseID = 0;

      return 0;
    }
LABEL_12:
    [(BRCPQLConnection *)self->_clientDB brc_close];
    goto LABEL_13;
  }
  uint64_t v6 = [(BRCAccountSession *)self dbLoadingBarrier];
  [v6 signalBarrier];

  [(BRCAccountSession *)self enableDatabaseProfilingForDB:self->_clientDB];
  [(BRCAccountSession *)self enableDatabaseProfilingForDB:self->_serverDB];
  BOOL v7 = 1;
  [(BRCPQLConnection *)self->_clientDB setCrashIfUsedAfterClose:1];
  [(BRCPQLConnection *)self->_serverDB setCrashIfUsedAfterClose:1];
  return v7;
}

uint64_t __57__BRCAccountSession_BRCDatabaseManager__openDBWithError___block_invoke(uint64_t a1)
{
  return 1;
}

uint64_t __57__BRCAccountSession_BRCDatabaseManager__openDBWithError___block_invoke_2(uint64_t a1)
{
  return 1;
}

- (void)closeDBs
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:4];
  id v4 = self;
  objc_sync_enter(v4);
  if (v4->_clientDB)
  {
    objc_msgSend(v3, "addObject:");
    clientDB = v4->_clientDB;
    v4->_clientDB = 0;
  }
  if (v4->_serverDB)
  {
    objc_msgSend(v3, "addObject:");
    serverDB = v4->_serverDB;
    v4->_serverDB = 0;
  }
  if (v4->_readOnlyDB)
  {
    objc_msgSend(v3, "addObject:");
    readOnlyDB = v4->_readOnlyDB;
    v4->_readOnlyDB = 0;
  }
  if (v4->_expensiveReadOnlyDB)
  {
    objc_msgSend(v3, "addObject:");
    expensiveReadOnlyDB = v4->_expensiveReadOnlyDB;
    v4->_expensiveReadOnlyDB = 0;
  }
  objc_sync_exit(v4);
  uint64_t v24 = v4;

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v9 = v3;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v27;
    *(void *)&long long v11 = 138412290;
    long long v22 = v11;
    uint64_t v13 = MEMORY[0x1E4F143A8];
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(v9);
        }
        id v15 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
        BOOL v16 = objc_msgSend(v15, "serialQueue", v22);
        BOOL v17 = v16 == 0;

        if (v17)
        {
          char v23 = brc_bread_crumbs();
          uint64_t v19 = brc_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v22;
            id v31 = v23;
            _os_log_fault_impl(&dword_1D353B000, v19, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: db.serialQueue%@", buf, 0xCu);
          }
        }
        uint64_t v18 = [v15 serialQueue];
        block[0] = v13;
        block[1] = 3221225472;
        block[2] = __49__BRCAccountSession_BRCDatabaseManager__closeDBs__block_invoke;
        block[3] = &unk_1E6993698;
        block[4] = v15;
        dispatch_sync(v18, block);

        ++v14;
      }
      while (v10 != v14);
      uint64_t v20 = [v9 countByEnumeratingWithState:&v26 objects:v32 count:16];
      uint64_t v10 = v20;
    }
    while (v20);
  }

  [(BRCAccountSession *)v24 stopDBWatcher];
  clientState = v24->_clientState;
  v24->_clientState = 0;
}

uint64_t __49__BRCAccountSession_BRCDatabaseManager__closeDBs__block_invoke(uint64_t a1)
{
  return objc_msgSend(*(id *)(a1 + 32), "brc_close");
}

- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 error:(id *)a4
{
  return [(BRCAccountSession *)self initializeOfflineDatabaseWhileUpgrading:a3 loadClientState:0 error:a4];
}

- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 loadClientState:(BOOL)a4 error:(id *)a5
{
  return [(BRCAccountSession *)self initializeOfflineDatabaseWhileUpgrading:a3 loadClientState:a4 forDBDump:0 error:a5];
}

- (BOOL)initializeOfflineDatabaseWhileUpgrading:(BOOL)a3 loadClientState:(BOOL)a4 forDBDump:(BOOL)a5 error:(id *)a6
{
  BOOL v8 = a3;
  uint64_t v31 = 0;
  uint64_t v32 = &v31;
  uint64_t v33 = 0x2020000000;
  char v34 = 0;
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = __Block_byref_object_copy__3;
  self->_offline = 1;
  long long v29 = __Block_byref_object_dispose__3;
  id v30 = 0;
  self->_forDBDump = a5;
  uint64_t v10 = [(BRCAccountSession *)self clientDB];
  long long v11 = [v10 serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __113__BRCAccountSession_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke;
  block[3] = &unk_1E6994278;
  block[4] = self;
  void block[5] = &v31;
  BOOL v24 = v8;
  block[6] = &v25;
  dispatch_sync(v11, block);

  uint64_t v12 = v32;
  int v13 = *((unsigned __int8 *)v32 + 24);
  if (*((unsigned char *)v32 + 24) && v8)
  {
    uint64_t v14 = [(BRCAccountSession *)self serverDB];
    id v15 = [v14 serialQueue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __113__BRCAccountSession_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_374;
    v22[3] = &unk_1E69942A0;
    v22[4] = self;
    v22[5] = &v31;
    v22[6] = &v25;
    dispatch_sync(v15, v22);

    uint64_t v12 = v32;
    int v13 = *((unsigned __int8 *)v32 + 24);
  }
  if (!v13)
  {
    *((unsigned char *)v12 + 24) = 0;
    if (!a6) {
      goto LABEL_7;
    }
    goto LABEL_6;
  }
  BOOL v16 = [(BRCAccountSession *)self clientDB];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __113__BRCAccountSession_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_2_375;
  v20[3] = &unk_1E6993C00;
  v20[4] = self;
  BOOL v21 = a4;
  char v17 = [v16 performWithFlags:1 action:v20];
  *((unsigned char *)v32 + 24) = v17;

  if (a6) {
LABEL_6:
  }
    *a6 = (id) v26[5];
LABEL_7:
  BOOL v18 = *((unsigned char *)v32 + 24) != 0;
  _Block_object_dispose(&v25, 8);

  _Block_object_dispose(&v31, 8);
  return v18;
}

void __113__BRCAccountSession_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(a1 + 32);
  id v3 = [v2 clientDB];
  BOOL v4 = *(unsigned char *)(a1 + 56) == 0;
  uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
  id obj = *(id *)(v5 + 40);
  LOBYTE(v2) = [v2 _setupConnection:v3 readonly:v4 forChecker:0 error:&obj];
  objc_storeStrong((id *)(v5 + 40), obj);
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v2;

  uint64_t v6 = *(void **)(a1 + 32);
  BOOL v7 = [v6 clientDB];
  [v6 disableDatabaseProfilingForDB:v7];

  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) && *(unsigned char *)(a1 + 56))
  {
    BOOL v8 = [*(id *)(a1 + 32) clientDB];
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void *)(*(void *)(a1 + 48) + 8);
    id v13 = *(id *)(v10 + 40);
    BOOL v11 = +[BRCAccountSession upgradeOfflineDB:v8 serverTruth:0 session:v9 error:&v13];
    objc_storeStrong((id *)(v10 + 40), v13);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v11;
  }
  uint64_t v12 = [*(id *)(a1 + 32) clientDB];
  [v12 setSqliteErrorHandler:&__block_literal_global_373];
}

void __113__BRCAccountSession_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_2(uint64_t a1, uint64_t a2, void *a3, void *a4)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = brc_bread_crumbs();
  BOOL v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v9 = 138412802;
    id v10 = v6;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Encountered an error %@ running stmt %@%@", (uint8_t *)&v9, 0x20u);
  }
}

void __113__BRCAccountSession_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_374(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v2 + 24))
  {
    id v3 = *(void **)(a1 + 32);
    BOOL v4 = [v3 serverDB];
    uint64_t v5 = *(void *)(*(void *)(a1 + 48) + 8);
    id obj = *(id *)(v5 + 40);
    LOBYTE(v3) = [v3 _openConnection:v4 databaseName:@"server.db" readonly:0 error:&obj];
    objc_storeStrong((id *)(v5 + 40), obj);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (_BYTE)v3;
  }
  else
  {
    *(unsigned char *)(v2 + 24) = 0;
  }
  uint64_t v6 = *(void *)(*(void *)(a1 + 40) + 8);
  if (*(unsigned char *)(v6 + 24))
  {
    BOOL v7 = [*(id *)(a1 + 32) serverDB];
    uint64_t v8 = *(void *)(a1 + 32);
    uint64_t v9 = *(void *)(*(void *)(a1 + 48) + 8);
    id v11 = *(id *)(v9 + 40);
    BOOL v10 = +[BRCAccountSession upgradeOfflineDB:v7 serverTruth:1 session:v8 error:&v11];
    objc_storeStrong((id *)(v9 + 40), v11);
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v10;
  }
  else
  {
    *(unsigned char *)(v6 + 24) = 0;
  }
}

uint64_t __113__BRCAccountSession_BRCDatabaseManager__initializeOfflineDatabaseWhileUpgrading_loadClientState_forDBDump_error___block_invoke_2_375(uint64_t a1, void *a2)
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  BOOL v4 = [*(id *)(a1 + 32) _sharedServerZonesEnumerator:v3];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v56 objects:v64 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v57 != v7) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(a1 + 32) addOfflineServerZone:*(void *)(*((void *)&v56 + 1) + 8 * i)];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v56 objects:v64 count:16];
    }
    while (v6);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  uint64_t v9 = [*(id *)(a1 + 32) _privateServerZonesEnumerator:v3];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v52 objects:v63 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v11; ++j)
      {
        if (*(void *)v53 != v12) {
          objc_enumerationMutation(v9);
        }
        [*(id *)(a1 + 32) addOfflineServerZone:*(void *)(*((void *)&v52 + 1) + 8 * j)];
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v52 objects:v63 count:16];
    }
    while (v11);
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  uint64_t v15 = [*(id *)(a1 + 32) _sharedClientZonesEnumerator];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v48 objects:v62 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v49;
    do
    {
      for (uint64_t k = 0; k != v17; ++k)
      {
        if (*(void *)v49 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v48 + 1) + 8 * k);
        [*(id *)(a1 + 32) addOfflineClientZone:v20];
        BOOL v21 = [v20 dbRowID];
        [v14 setObject:v20 forKeyedSubscript:v21];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v48 objects:v62 count:16];
    }
    while (v17);
  }

  long long v46 = 0u;
  long long v47 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v22 = [*(id *)(a1 + 32) _privateClientZonesEnumerator];
  uint64_t v23 = [v22 countByEnumeratingWithState:&v44 objects:v61 count:16];
  if (v23)
  {
    uint64_t v24 = v23;
    uint64_t v25 = *(void *)v45;
    do
    {
      for (uint64_t m = 0; m != v24; ++m)
      {
        if (*(void *)v45 != v25) {
          objc_enumerationMutation(v22);
        }
        uint64_t v27 = *(void **)(*((void *)&v44 + 1) + 8 * m);
        [*(id *)(a1 + 32) addOfflineClientZone:v27];
        long long v28 = [v27 dbRowID];
        [v14 setObject:v27 forKeyedSubscript:v28];
      }
      uint64_t v24 = [v22 countByEnumeratingWithState:&v44 objects:v61 count:16];
    }
    while (v24);
  }

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  uint64_t v39 = v3;
  long long v29 = [*(id *)(a1 + 32) _appLibrariesEnumerator:v3];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v40 objects:v60 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v41;
    do
    {
      for (uint64_t n = 0; n != v31; ++n)
      {
        if (*(void *)v41 != v32) {
          objc_enumerationMutation(v29);
        }
        char v34 = *(void **)(*((void *)&v40 + 1) + 8 * n);
        [*(id *)(a1 + 32) addOfflineAppLibrary:v34];
        BOOL v35 = [v34 zoneRowID];
        id v36 = [v14 objectForKeyedSubscript:v35];
        unsigned int v37 = [v36 asPrivateClientZone];

        if (v37) {
          [v34 associateWithClientZone:v37];
        }
      }
      uint64_t v31 = [v29 countByEnumeratingWithState:&v40 objects:v60 count:16];
    }
    while (v31);
  }

  if (*(unsigned char *)(a1 + 40)) {
    [*(id *)(a1 + 32) _loadClientStateFromDB:v39];
  }

  return 1;
}

- (BOOL)dumpFileCoordinationInfoToFileHandle:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  int v6 = dup([a3 fileDescriptor]);
  uint64_t v7 = fdopen(v6, "a");
  if (v7)
  {
    uint64_t v8 = [[BRCDumpContext alloc] initWithFile:v7 db:self->_clientDB];
    [(BRCDumpContext *)v8 setDumpTrackedPendingDownloads:1];
    fclose(v7);
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    if (v9)
    {
      uint64_t v10 = brc_bread_crumbs();
      uint64_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
      {
        __int16 v13 = "(passed to caller)";
        int v14 = 136315906;
        uint64_t v15 = "-[BRCAccountSession(BRCDatabaseManager) dumpFileCoordinationInfoToFileHandle:error:]";
        __int16 v16 = 2080;
        if (!a4) {
          __int16 v13 = "(ignored by caller)";
        }
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        uint64_t v19 = v9;
        __int16 v20 = 2112;
        BOOL v21 = v10;
        _os_log_error_impl(&dword_1D353B000, v11, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v14, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v9;
    }
  }
  return v7 != 0;
}

- (void)_registerObfuscationFunction:(id)a3
{
  id v3 = a3;
  [v3 registerFunction:@"OBFUSCATE" nArgs:1 handler:&__block_literal_global_383];
  [v3 registerFunction:@"OBFUSCATE_APPLIBRARY" nArgs:1 handler:&__block_literal_global_388];
  [v3 registerFunction:@"OBFUSCATE_PATH" nArgs:1 handler:&__block_literal_global_405];
}

void __70__BRCAccountSession_BRCDatabaseManager___registerObfuscationFunction___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  int v6 = (void *)MEMORY[0x1D9438760]();
  uint64_t v7 = sqlite3_value_text(*a4);
  if (v7 && *v7)
  {
    uint64_t v8 = [NSString stringWithUTF8String:v7];
    objc_msgSend(v8, "fp_obfuscatedFilename");
    id v9 = objc_claimAutoreleasedReturnValue();
    uint64_t v10 = (const char *)[v9 fileSystemRepresentation];

    int v11 = strlen(v10);
    sqlite3_result_text(a2, v10, v11, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

void __70__BRCAccountSession_BRCDatabaseManager___registerObfuscationFunction___block_invoke_2(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  int v6 = (void *)MEMORY[0x1D9438760]();
  uint64_t v7 = sqlite3_value_text(*a4);
  if (v7 && (uint64_t v8 = (const char *)v7, *v7))
  {
    id v9 = [NSString stringWithUTF8String:v7];
    if ([v9 isEqualToString:@"com.apple.CloudDocs"])
    {
      int v10 = strlen(v8);
      sqlite3_result_text(a2, v8, v10, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
    else
    {
      int v11 = objc_msgSend(v9, "fp_obfuscatedDotSeparatedComponents");
      uint64_t v12 = [v11 stringByReplacingOccurrencesOfString:@"{" withString:@"-"];

      __int16 v13 = [v12 stringByReplacingOccurrencesOfString:@"}" withString:@"-"];

      id v14 = v13;
      uint64_t v15 = (const char *)[v14 fileSystemRepresentation];
      int v16 = strlen(v15);
      sqlite3_result_text(a2, v15, v16, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
    }
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

void __70__BRCAccountSession_BRCDatabaseManager___registerObfuscationFunction___block_invoke_3(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  int v6 = (void *)MEMORY[0x1D9438760]();
  uint64_t v7 = sqlite3_value_text(*a4);
  if (v7 && *v7)
  {
    uint64_t v8 = [NSString stringWithUTF8String:v7];
    objc_msgSend(v8, "fp_obfuscatedPath");
    id v9 = objc_claimAutoreleasedReturnValue();
    int v10 = (const char *)[v9 fileSystemRepresentation];

    int v11 = strlen(v10);
    sqlite3_result_text(a2, v10, v11, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  }
  else
  {
    sqlite3_result_null(a2);
  }
}

- (BOOL)backupDatabaseToURL:(id)a3 includeServer:(BOOL)a4 doNotObfuscate:(BOOL)a5 error:(id *)a6
{
  BOOL v8 = a4;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v52 = a3;
  long long v57 = 0u;
  long long v58 = 0u;
  if (v8) {
    id v9 = &unk_1F2B27768;
  }
  else {
    id v9 = &unk_1F2B27780;
  }
  long long v59 = 0uLL;
  long long v60 = 0uLL;
  id obj = v9;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v57 objects:v61 count:16];
  long long v50 = a6;
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v49 = *(void *)v58;
    BOOL v46 = a5;
    BOOL v47 = v8;
    while (2)
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v58 != v49) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void *)(*((void *)&v57 + 1) + 8 * i);
        id v14 = [(BRCAccountSession *)self newConnection:@"backup"];
        uint64_t v15 = [v52 URLByAppendingPathComponent:v13];
        int v16 = [v14 sqliteErrorHandler];
        v55[0] = MEMORY[0x1E4F143A8];
        v55[1] = 3221225472;
        v55[2] = __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke;
        v55[3] = &unk_1E6994208;
        id v17 = v16;
        id v56 = v17;
        [v14 setSqliteErrorHandler:v55];
        __int16 v18 = [v14 autoRollbackHandler];
        v53[0] = MEMORY[0x1E4F143A8];
        v53[1] = 3221225472;
        v53[2] = __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_415;
        v53[3] = &unk_1E6994208;
        id v19 = v18;
        id v54 = v19;
        [v14 setAutoRollbackHandler:v53];
        a6 = v50;
        if (![(BRCAccountSession *)self _openConnection:v14 databaseName:v13 readonly:1 error:v50])goto LABEL_19; {
        if (([v14 backupToURL:v15 progress:0] & 1) == 0)
        }
        {
          if (v50)
          {
            *long long v50 = [v14 lastError];
          }
          objc_msgSend(v14, "brc_close");
LABEL_19:

          goto LABEL_20;
        }
        objc_msgSend(v14, "brc_close");
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
      a5 = v46;
      BOOL v8 = v47;
      if (v11) {
        continue;
      }
      break;
    }
  }
  if (a5)
  {
    int shouldObfuscateFilenames = 0;
    if (!v8) {
      goto LABEL_27;
    }
  }
  else
  {
    int shouldObfuscateFilenames = fp_shouldObfuscateFilenames();
    if (!v8) {
      goto LABEL_27;
    }
  }
  id v14 = [(BRCAccountSession *)self newConnection:@"privacy"];
  if (![(id)objc_opt_class() _openConnection:v14 databaseName:@"server.db" baseURL:v52 readonly:0 error:a6])
  {
LABEL_20:
    LOBYTE(v21) = 0;
    goto LABEL_21;
  }
  if (shouldObfuscateFilenames)
  {
    uint64_t v23 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v24 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v23, "sqliteCacheSize"));
    uint64_t v25 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v23, "sqliteCacheSpill"));
    long long v26 = (void *)MEMORY[0x1E4FBA908];
    id v27 = v24;
    long long v28 = objc_msgSend(v26, "rawInjection:length:", objc_msgSend(v27, "UTF8String"), objc_msgSend(v27, "length"));
    [v14 execute:@"PRAGMA cache_size = %@", v28];

    long long v29 = (void *)MEMORY[0x1E4FBA908];
    id v30 = v25;
    uint64_t v31 = [v30 UTF8String];
    uint64_t v32 = [v30 length];
    uint64_t v33 = v29;
    a6 = v50;
    char v34 = [v33 rawInjection:v31 length:v32];
    [v14 execute:@"PRAGMA cache_spill = %@", v34];

    [(BRCAccountSession *)self _registerObfuscationFunction:v14];
    [v14 groupInTransaction:&__block_literal_global_421];
    [v14 groupInTransaction:&__block_literal_global_426];
    [v14 groupInTransaction:&__block_literal_global_431];
    [v14 groupInTransaction:&__block_literal_global_436];
    [v14 groupInTransaction:&__block_literal_global_441];
  }
  [v14 groupInTransaction:&__block_literal_global_446];
  [v14 flush];
  objc_msgSend(v14, "brc_close");

LABEL_27:
  id v14 = [(BRCAccountSession *)self newConnection:@"privacy"];
  int v21 = [(id)objc_opt_class() _openConnection:v14 databaseName:@"client.db" baseURL:v52 readonly:0 error:a6];
  if (v21)
  {
    if (shouldObfuscateFilenames)
    {
      BOOL v35 = +[BRCUserDefaults defaultsForMangledID:0];
      id v36 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v35, "sqliteCacheSize"));
      unsigned int v37 = objc_msgSend(NSString, "stringWithFormat:", @"%lld", objc_msgSend(v35, "sqliteCacheSpill"));
      unsigned int v38 = (void *)MEMORY[0x1E4FBA908];
      id v39 = v36;
      long long v40 = objc_msgSend(v38, "rawInjection:length:", objc_msgSend(v39, "UTF8String"), objc_msgSend(v39, "length"));
      [v14 execute:@"PRAGMA cache_size = %@", v40];

      long long v41 = (void *)MEMORY[0x1E4FBA908];
      id v42 = v37;
      long long v43 = objc_msgSend(v41, "rawInjection:length:", objc_msgSend(v42, "UTF8String"), objc_msgSend(v42, "length"));
      [v14 execute:@"PRAGMA cache_spill = %@", v43];

      [(BRCAccountSession *)self _registerObfuscationFunction:v14];
      [v14 groupInTransaction:&__block_literal_global_451];
      [v14 groupInTransaction:&__block_literal_global_456];
      long long v44 = (void *)[v14 numberWithSQL:@"SELECT 1 FROM sqlite_master where type = 'table' AND name = 'client_pkg_items'"];
      int v45 = [v44 BOOLValue];

      if (v45) {
        [v14 groupInTransaction:&__block_literal_global_464];
      }
      [v14 groupInTransaction:&__block_literal_global_469];
    }
    [v14 groupInTransaction:&__block_literal_global_474];
    [v14 flush];
    objc_msgSend(v14, "brc_close");
  }
LABEL_21:

  return v21;
}

void __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    int v16 = 138412802;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    int v21 = v10;
    _os_log_error_impl(&dword_1D353B000, v11, (os_log_type_t)0x90u, "[ERROR] sqlite error handler called on DB backup - %@ (%@)%@", (uint8_t *)&v16, 0x20u);
  }

  uint64_t v12 = [v9 domain];
  if (![v12 isEqualToString:*MEMORY[0x1E4FBA910]])
  {

    goto LABEL_9;
  }
  uint64_t v13 = [v9 code];

  if (v13 != 13)
  {
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_10;
  }
  id v14 = brc_bread_crumbs();
  uint64_t v15 = brc_default_log();
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
    __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_cold_1();
  }

LABEL_10:
}

void __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_415(uint64_t a1, void *a2, void *a3, void *a4)
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, (os_log_type_t)0x90u))
  {
    int v16 = 138412802;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v9;
    __int16 v20 = 2112;
    int v21 = v10;
    _os_log_error_impl(&dword_1D353B000, v11, (os_log_type_t)0x90u, "[ERROR] Auto rollback handler called on DB backup - %@ (%@)%@", (uint8_t *)&v16, 0x20u);
  }

  uint64_t v12 = [v9 domain];
  if (![v12 isEqualToString:*MEMORY[0x1E4FBA910]])
  {

    goto LABEL_9;
  }
  uint64_t v13 = [v9 code];

  if (v13 != 13)
  {
LABEL_9:
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
    goto LABEL_10;
  }
  id v14 = brc_bread_crumbs();
  uint64_t v15 = brc_default_log();
  if (os_log_type_enabled(v15, (os_log_type_t)0x90u)) {
    __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_cold_1();
  }

LABEL_10:
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_419(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE devices SET name = printf(\"%%u - %%s\", key, OBFUSCATE(name)) WHERE name IS NOT NULL"];
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_2(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE server_zones SET zone_name = printf(\"%%u - %%s\", rowid, OBFUSCATE_APPLIBRARY(zone_name)) WHERE zone_name IS NOT NULL"];
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_3(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE server_items SET item_filename = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_filename)), item_origname = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_origname)), item_trash_put_back_path = printf(\"%%u - %%s\", rowid, OBFUSCATE_PATH(item_trash_put_back_path)), version_name = printf(\"%%u - %%s\", rowid, OBFUSCATE(version_name))"];
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_4(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE rowid_reservations SET container_id = printf(\"%%u - %%s\", rowid, OBFUSCATE_APPLIBRARY(container_id)) WHERE container_id IS NOT NULL"];
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_5(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE users SET user_plist = NULL"];
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_6(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE server_items SET child_basehash_salt = validation_key(child_basehash_salt), content_boundary_key = validation_key(content_boundary_key)"];
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_7(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE client_zones SET zone_name = printf(\"%%u - %%s\", rowid, OBFUSCATE_APPLIBRARY(zone_name)) WHERE zone_name IS NOT NULL"];
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_8(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE client_items SET item_localname = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_localname)), item_bouncedname = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_bouncedname)), item_filename = printf(\"%%u - %%s\", rowid, OBFUSCATE(item_filename)), item_trash_put_back_path = printf(\"%%u - %%s\", rowid, OBFUSCATE_PATH(item_trash_put_back_path)), version_name = printf(\"%%u - %%s\", rowid, OBFUSCATE(version_name)), version_block_sync_until_bundle_id = NULL"];
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_9(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE client_pkg_items SET rel_path = printf(\"%%u - %%s\", rowid, OBFUSCATE_PATH(rel_path)) WHERE rel_path IS NOT NULL"];
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_10(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE app_libraries SET app_library_name = printf(\"%%u - %%s\", rowid, OBFUSCATE_APPLIBRARY(app_library_name)) WHERE app_library_name IS NOT NULL"];
  return 1;
}

uint64_t __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_11(uint64_t a1, void *a2)
{
  [a2 execute:@"UPDATE app_libraries SET child_basehash_salt = validation_key(child_basehash_salt)"];
  return 1;
}

- (BOOL)backupDatabaseToURL:(id)a3 error:(id *)a4
{
  return [(BRCAccountSession *)self backupDatabaseToURL:a3 includeServer:1 doNotObfuscate:0 error:a4];
}

- (id)accountStatisticsWithDB:(id)a3
{
  id v3 = a3;
  BOOL v4 = objc_opt_new();
  uint64_t v5 = (void *)[v3 fetchWithSlowStatementRadar:@"<rdar://problem/29182551>" objectOfClass:objc_opt_class() sql:@"SELECT COUNT(1) FROM client_items"];
  [v4 setObject:v5 forKeyedSubscript:@"totalNumberOfItems"];

  int v6 = (void *)[v3 fetchWithSlowStatementRadar:@"<rdar://problem/29182551>" objectOfClass:objc_opt_class() sql:@"SELECT COUNT(1) FROM client_items WHERE item_type = 2"];
  [v4 setObject:v6 forKeyedSubscript:@"totalNumberOfFaults"];

  id v7 = (void *)[v3 fetchWithSlowStatementRadar:@"<rdar://problem/29182551>" objectOfClass:objc_opt_class() sql:@"SELECT COUNT(1) FROM client_items WHERE item_type = 1"];
  [v4 setObject:v7 forKeyedSubscript:@"totalNumberOfDocuments"];

  id v8 = (void *)[v3 fetchWithSlowStatementRadar:@"<rdar://problem/29182551>" objectOfClass:objc_opt_class() sql:@"SELECT COUNT(1) FROM client_items WHERE item_type = 0"];
  [v4 setObject:v8 forKeyedSubscript:@"totalNumberOfDirectories"];

  return v4;
}

- (void)bumpNotificationRankOnItemGlobalID:(id)a3
{
  clientDB = self->_clientDB;
  id v4 = a3;
  id v6 = [v4 itemID];
  uint64_t v5 = [v4 zoneRowID];

  [(BRCPQLConnection *)clientDB execute:@"UPDATE client_items SET item_notifs_ranuint64_t k = bump_notifs_rank() WHERE item_id = %@ AND zone_rowid = %@", v6, v5];
}

- (void)disableDatabaseProfilingForDB:(id)a3
{
}

- (void)enableDatabaseProfilingForDB:(id)a3
{
  id v5 = a3;
  id v4 = +[BRCUserDefaults defaultsForMangledID:0];
  if ([v4 dbProfiled]) {
    -[BRCAccountSession _setDatabaseProfilingForDB:enabled:verbose:](self, "_setDatabaseProfilingForDB:enabled:verbose:", v5, 1, [v4 dbVerboseProfiled]);
  }
}

- (void)_setDatabaseProfilingForDB:(id)a3 enabled:(BOOL)a4 verbose:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v7 = a3;
  [v7 setVerboseProfilingEnabled:v5];
  [v7 setProfilingEnabled:v6];
}

- (id)getFPFSNonMigratedItemsWithDB:(id)a3
{
  id v3 = (void *)[a3 numberWithSQL:@"SELECT count(*) FROM client_items WHERE item_localsyncupstate IN (5, 6)"];
  return v3;
}

- (id)_getFPFSMigrationStatus:(id)a3 withError:(id *)a4
{
  id v5 = a3;
  if (!self->_clientState)
  {
    uint64_t v15 = brc_bread_crumbs();
    int v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(DatabaseAdditions) _getFPFSMigrationStatus:withError:]((uint64_t)v15, v16);
    }
  }
  BOOL v6 = [MEMORY[0x1E4F1CA60] dictionary];
  id v7 = [(BRCClientState *)self->_clientState objectForKeyedSubscript:@"kBRCFPFSMigrationStateKey"];
  if (!v7)
  {
    id v8 = (void *)[v5 numberWithSQL:@"SELECT MIN(db_schema) FROM boot_history"];
    unint64_t v9 = [v8 unsignedLongValue];

    if (v9 >> 4 > 0x752)
    {
      id v13 = 0;
      goto LABEL_8;
    }
    id v7 = &unk_1F2B26E68;
  }
  [v6 setObject:v7 forKey:@"MigrationStatus"];
  uint64_t v10 = [(BRCAccountSession *)self getFPFSNonMigratedItemsWithDB:v5];
  if (v10) {
    [v6 setObject:v10 forKey:@"NonMigratedItems"];
  }
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __74__BRCAccountSession_DatabaseAdditions___getFPFSMigrationStatus_withError___block_invoke;
  v17[3] = &unk_1E6996358;
  v17[4] = self;
  id v11 = v6;
  id v18 = v11;
  uint64_t v12 = (void (**)(void, void, void))MEMORY[0x1D94389C0](v17);
  ((void (**)(void, __CFString *, __CFString *))v12)[2](v12, @"kBRCFPFSMigrationUUIDKey", @"MigrationID");
  ((void (**)(void, __CFString *, __CFString *))v12)[2](v12, @"kBRCFPFSMigrationStartTimeKey", @"MigrationStarted");
  ((void (**)(void, __CFString *, __CFString *))v12)[2](v12, @"kBRCFPFSMigrationInitialItemsNeedMigratingCountKey", @"InitialItemsNeedMigratingCount");
  ((void (**)(void, __CFString *, __CFString *))v12)[2](v12, @"kBRCFPFSMigrationInitialItemCountKey", @"InitialItemsCount");
  ((void (**)(void, __CFString *, __CFString *))v12)[2](v12, @"kBRCFPFSMigrationNewItemsInDBStatKey", @"NewItemsInDB");
  ((void (**)(void, __CFString *, __CFString *))v12)[2](v12, @"kBRCFPFSMigrationLostItemCountKey", @"MigrationLostItemCount");
  id v13 = v11;

LABEL_8:
  return v13;
}

void __74__BRCAccountSession_DatabaseAdditions___getFPFSMigrationStatus_withError___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  BOOL v6 = [*(id *)(a1 + 32) clientState];
  id v7 = [v6 objectForKeyedSubscript:v11];

  if (v7)
  {
    id v8 = *(void **)(a1 + 40);
    unint64_t v9 = [*(id *)(a1 + 32) clientState];
    uint64_t v10 = [v9 objectForKeyedSubscript:v11];
    [v8 setObject:v10 forKey:v5];
  }
}

- (BOOL)dumpFPFSMigrationStatusToFileHandle:(id)a3 tracker:(id)a4 includeNonMigratedItems:(BOOL)a5 error:(id *)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v30 = a4;
  memset(v47, 0, sizeof(v47));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:includeNonMigratedItems:error:]", 133, v47);
  unint64_t v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSession(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:includeNonMigratedItems:error:]();
  }

  id v11 = self->_readOnlyDB;
  uint64_t v12 = v11;
  uint64_t v43 = 0;
  long long v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  uint64_t v37 = 0;
  unsigned int v38 = &v37;
  uint64_t v39 = 0x3032000000;
  long long v40 = __Block_byref_object_copy__14;
  long long v41 = __Block_byref_object_dispose__14;
  id v42 = 0;
  int cloudDocsFD = self->_cloudDocsFD;
  if (cloudDocsFD < 0)
  {
    id v14 = 0;
    if (!v11)
    {
LABEL_22:
      BOOL v21 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    id v14 = [(BRCAccountSession *)self containerScheduler];
    if (!v12) {
      goto LABEL_22;
    }
  }
  int v15 = dup(objc_msgSend(v8, "fileDescriptor", a6));
  int v16 = fdopen(v15, "a");
  if (!v16)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    uint64_t v22 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v22)
    {
      uint64_t v23 = brc_bread_crumbs();
      uint64_t v24 = brc_default_log();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        id v27 = "(passed to caller)";
        *(_DWORD *)id v56 = 136315906;
        *(void *)&v56[4] = "-[BRCAccountSession(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:includeN"
                             "onMigratedItems:error:]";
        *(_WORD *)&v56[12] = 2080;
        if (!v29) {
          id v27 = "(ignored by caller)";
        }
        *(void *)&v56[14] = v27;
        *(_WORD *)&v56[22] = 2112;
        long long v57 = v22;
        LOWORD(v58) = 2112;
        *(void *)((char *)&v58 + 2) = v23;
        _os_log_error_impl(&dword_1D353B000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v56, 0x2Au);
      }
    }
    if (v29) {
      *long long v29 = v22;
    }

    goto LABEL_22;
  }
  *(void *)id v56 = 0;
  *(void *)&v56[8] = v56;
  *(void *)&v56[16] = 0x3032000000;
  long long v57 = __Block_byref_object_copy__14;
  *(void *)&long long v58 = __Block_byref_object_dispose__14;
  *((void *)&v58 + 1) = [[BRCDumpContext alloc] initWithFile:v16 db:v12];
  [*(id *)(*(void *)&v56[8] + 40) setLiveDaemon:cloudDocsFD >= 0];
  [*(id *)(*(void *)&v56[8] + 40) setTaskTracker:v30];
  [(BRCAccountSession *)self disableDatabaseProfilingForDB:v12];
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = __114__BRCAccountSession_DatabaseAdditions__dumpFPFSMigrationStatusToFileHandle_tracker_includeNonMigratedItems_error___block_invoke;
  v31[3] = &unk_1E6996380;
  id v17 = v12;
  uint64_t v32 = v17;
  uint64_t v33 = self;
  char v34 = &v37;
  BOOL v35 = v56;
  id v36 = &v43;
  [(BRCPQLConnection *)v17 performWithFlags:1 action:v31];
  id v18 = (id)v38[5];
  if (v18)
  {
    id v19 = brc_bread_crumbs();
    __int16 v20 = brc_default_log();
    if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
    {
      long long v26 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      uint64_t v49 = "-[BRCAccountSession(DatabaseAdditions) dumpFPFSMigrationStatusToFileHandle:tracker:includeNonMigratedItems:error:]";
      __int16 v50 = 2080;
      if (!v29) {
        long long v26 = "(ignored by caller)";
      }
      long long v51 = v26;
      __int16 v52 = 2112;
      id v53 = v18;
      __int16 v54 = 2112;
      long long v55 = v19;
      _os_log_error_impl(&dword_1D353B000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (v29) {
    *long long v29 = v18;
  }

  fclose(v16);
  if (cloudDocsFD >= 0) {
    [(BRCAccountSession *)self enableDatabaseProfilingForDB:v17];
  }
  BOOL v21 = *((unsigned char *)v44 + 24) != 0;

  _Block_object_dispose(v56, 8);
LABEL_23:
  _Block_object_dispose(&v37, 8);

  _Block_object_dispose(&v43, 8);
  __brc_leave_section(v47);

  return v21;
}

uint64_t __114__BRCAccountSession_DatabaseAdditions__dumpFPFSMigrationStatusToFileHandle_tracker_includeNonMigratedItems_error___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [*(id *)(a1 + 32) userVersion];
  unint64_t v5 = [v4 unsignedLongValue];

  if (v5 >> 4 >= 0x753)
  {
    BOOL v6 = *(void **)(a1 + 40);
    if (v6[22])
    {
      id v7 = [v6 _getFPFSMigrationStatus:v3 withError:0];
      if (v7)
      {
        uint64_t v8 = *(void *)(*(void *)(a1 + 48) + 8);
        id obj = *(id *)(v8 + 40);
        unint64_t v9 = [MEMORY[0x1E4F28D90] jsonStringFromDictionary:v7 options:1 error:&obj];
        objc_storeStrong((id *)(v8 + 40), obj);
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) writeLineWithFormat:@"%@", v9];
      }
      else
      {
        uint64_t v10 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:userInfo:description:", *MEMORY[0x1E4F592A8], 15, MEMORY[0x1E4F1CC08], @"Domain was not migrated");
        uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
        uint64_t v12 = *(void **)(v11 + 40);
        *(void *)(v11 + 40) = v10;
      }
    }
  }
  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  }

  return 0;
}

- (id)_computePathOfItemWithName:(id)a3 appLibrary:(id)a4 parentClientZoneRowID:(id)a5 parentID:(id)a6 type:(char)a7 needsLocalName:(BOOL)a8 db:(id)a9
{
  BOOL v9 = a8;
  int v10 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a9;
  id v19 = objc_opt_new();
  if (v10 == 4)
  {
    __int16 v20 = @"/";
  }
  else
  {
    id v31 = v14;
    BOOL v21 = (void *)[v18 fetch:@" WITH RECURSIVE item_parents (item_id, zone_rowid, item_filename, item_localname) AS(    SELECT item_parent_id, item_parent_zone_rowid, item_filename, item_localname FROM client_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid, li.item_filename, li.item_localname FROM client_items AS li     INNER JOIN item_parents AS p USING (item_id, zone_rowid)) SELECT item_localname, item_filename FROM item_parents", v17, v16];
    id v22 = objc_alloc(MEMORY[0x1E4F594E8]);
    uint64_t v23 = [v15 appLibraryID];
    uint64_t v24 = (void *)[v22 initWithAppLibraryName:v23];

    uint64_t v25 = [v24 mangledIDString];
    [v19 insertObject:v25 atIndex:0];

    if ([v21 next])
    {
      do
      {
        long long v26 = [v21 stringAtIndex:0];
        id v27 = [v21 stringAtIndex:1];
        if (!v9 || (uint64_t v28 = [v26 length], v29 = v26, !v28)) {
          long long v29 = v27;
        }
        [v19 insertObject:v29 atIndex:1];
      }
      while (([v21 next] & 1) != 0);
    }
    id v14 = v31;
    [v19 addObject:v31];
    __int16 v20 = [NSString pathWithComponents:v19];
  }
  return v20;
}

- (BOOL)enumerateItemsWithType:(id)a3 itemRowIDs:(id)a4 db:(id)a5 withBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v40 = 0;
  long long v41 = &v40;
  uint64_t v42 = 0x2020000000;
  char v43 = 0;
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __87__BRCAccountSession_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke;
  v37[3] = &unk_1E69963A8;
  uint64_t v39 = &v40;
  id v14 = v12;
  id v38 = v14;
  [v14 performWithFlags:1 action:v37];
  long long v29 = v11;
  int cloudDocsFD = self->_cloudDocsFD;
  [(BRCAccountSession *)self disableDatabaseProfilingForDB:v14];
  char v16 = *((unsigned char *)v41 + 24);
  id v17 = [MEMORY[0x1E4FBA908] rawInjection:"1" length:1];
  if ([v10 isEqualToString:@"reserved"])
  {
    id v18 = "(+item_state = -2)";
    uint64_t v19 = 18;
LABEL_8:
    uint64_t v20 = [MEMORY[0x1E4FBA908] rawInjection:v18 length:v19];
    BOOL v21 = v13;

    id v17 = (void *)v20;
    goto LABEL_9;
  }
  if ([v10 isEqualToString:@"br-alias"])
  {
    id v18 = "item_type = 3";
LABEL_7:
    uint64_t v19 = 13;
    goto LABEL_8;
  }
  if ([v10 isEqualToString:@"br-bookmark-fault"])
  {
    id v18 = "item_type = 7";
    goto LABEL_7;
  }
  if ([v10 isEqualToString:@"pkg"])
  {
    id v18 = "(item_type IN (1, 2, 8) AND HEX(SUBSTR(version_content_signature, 1, 1)) = '1B')";
    uint64_t v19 = 80;
    goto LABEL_8;
  }
  if ([v10 isEqualToString:@"br-non-uploaded"])
  {
    id v18 = "item_localsyncupstate = 3";
    uint64_t v19 = 25;
    goto LABEL_8;
  }
  if ([v10 isEqualToString:@"busy"])
  {
    id v18 = "item_birthtime IN (443779200, -2082844800)";
    uint64_t v19 = 42;
    goto LABEL_8;
  }
  BOOL v21 = v13;
LABEL_9:
  id v22 = [MEMORY[0x1E4FBA908] rawInjection:"1" length:1];
  if (v29)
  {
    uint64_t v23 = [MEMORY[0x1E4FBA8F8] formatInjection:@"indexset_contains(%p, rowid)", v29];

    id v22 = (void *)v23;
  }
  uint64_t v24 = [MEMORY[0x1E4FBA8F8] formatInjection:@" WHERE %@ AND %@", v17, v22];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = __87__BRCAccountSession_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke_2;
  v30[3] = &unk_1E69963D0;
  BOOL v35 = &v40;
  id v25 = v24;
  char v36 = v16 ^ 1;
  id v31 = v25;
  uint64_t v32 = self;
  id v26 = v14;
  id v33 = v26;
  id v27 = v21;
  id v34 = v27;
  [v26 performWithFlags:1 action:v30];
  if ((cloudDocsFD & 0x80000000) == 0) {
    [(BRCAccountSession *)self enableDatabaseProfilingForDB:v26];
  }

  _Block_object_dispose(&v40, 8);
  return 1;
}

uint64_t __87__BRCAccountSession_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) userVersion];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (unint64_t)[v2 unsignedLongValue] >> 4 > 0x752;

  return 0;
}

uint64_t __87__BRCAccountSession_DatabaseAdditions__enumerateItemsWithType_itemRowIDs_db_withBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
    id v4 = @"SELECT item_filename, item_parent_id, item_parent_zone_rowid, app_library_rowid, item_type, item_file_id, item_doc_id, item_generation FROM client_items %@";
  }
  else {
    id v4 = @"SELECT item_filename, item_parent_id, item_parent_zone_rowid, app_library_rowid, item_type, item_localname, item_file_id, item_doc_id, item_generation FROM client_items %@";
  }
  uint64_t v24 = v3;
  unint64_t v5 = objc_msgSend(v3, "fetch:", v4, *(void *)(a1 + 32));
  while ([v5 next])
  {
    BOOL v6 = [v5 stringAtIndex:0];
    uint64_t v7 = [v5 objectOfClass:objc_opt_class() atIndex:1];
    uint64_t v8 = [v5 numberAtIndex:2];
    uint64_t v9 = [v5 numberAtIndex:3];
    char v10 = [v5 intAtIndex:4];
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24))
    {
      id v11 = v6;
    }
    else
    {
      id v11 = [v5 stringAtIndex:5];
    }
    id v12 = v11;
    if (!*(unsigned char *)(a1 + 72) || (v13 = [v11 length], id v14 = v12, !v13)) {
      id v14 = v6;
    }
    id v15 = *(void **)(a1 + 40);
    uint64_t v28 = v12;
    id v16 = v14;
    id v17 = [v15 appLibraryByRowID:v9];
    id v18 = [*(id *)(a1 + 40) _computePathOfItemWithName:v16 appLibrary:v17 parentClientZoneRowID:v8 parentID:v7 type:v10 needsLocalName:*(unsigned __int8 *)(a1 + 72) db:*(void *)(a1 + 48)];
    id v27 = (void *)v8;
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24)) {
      uint64_t v19 = 5;
    }
    else {
      uint64_t v19 = 6;
    }
    id v25 = (void *)v9;
    [v5 numberAtIndex:v19];
    uint64_t v20 = v26 = (void *)v7;
    BOOL v21 = [v5 numberAtIndex:(v19 + 1)];
    id v22 = [v5 numberAtIndex:(v19 + 2)];
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
  [v5 close];

  return 0;
}

- (BOOL)dumpItemsURLsToHandle:(id)a3 itemRowIDs:(id)a4 error:(id *)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  char v10 = self->_clientDB;
  if (!v10)
  {
LABEL_10:
    BOOL v14 = 0;
    goto LABEL_11;
  }
  int v11 = dup([v8 fileDescriptor]);
  id v12 = fdopen(v11, "a");
  if (!v12)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    id v15 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      id v16 = brc_bread_crumbs();
      id v17 = brc_default_log();
      if (os_log_type_enabled(v17, (os_log_type_t)0x90u))
      {
        uint64_t v19 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[BRCAccountSession(DatabaseAdditions) dumpItemsURLsToHandle:itemRowIDs:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a5) {
          uint64_t v19 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v19;
        *(_WORD *)&buf[22] = 2112;
        id v22 = v15;
        LOWORD(v23) = 2112;
        *(void *)((char *)&v23 + 2) = v16;
        _os_log_error_impl(&dword_1D353B000, v17, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a5) {
      *a5 = v15;
    }

    goto LABEL_10;
  }
  uint64_t v13 = v12;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v22 = __Block_byref_object_copy__14;
  *(void *)&long long v23 = __Block_byref_object_dispose__14;
  *((void *)&v23 + 1) = [[BRCDumpContext alloc] initWithFile:v12 db:v10];
  [*(id *)(*(void *)&buf[8] + 40) setTaskTracker:0];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __79__BRCAccountSession_DatabaseAdditions__dumpItemsURLsToHandle_itemRowIDs_error___block_invoke;
  v20[3] = &unk_1E69963F8;
  v20[4] = buf;
  [(BRCAccountSession *)self enumerateItemsWithType:0 itemRowIDs:v9 db:v10 withBlock:v20];
  fclose(v13);
  _Block_object_dispose(buf, 8);

  BOOL v14 = 1;
LABEL_11:

  return v14;
}

uint64_t __79__BRCAccountSession_DatabaseAdditions__dumpItemsURLsToHandle_itemRowIDs_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) writeLineWithFormat:@"%@", a3];
}

- (BOOL)dumpItemsToHandle:(id)a3 itemType:(id)a4 tracker:(id)a5 error:(id *)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  memset(v33, 0, sizeof(v33));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession(DatabaseAdditions) dumpItemsToHandle:itemType:tracker:error:]", 360, v33);
  brc_bread_crumbs();
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  BOOL v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v33[0];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    BOOL v35 = v13;
    _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx dumping all %@ items%@", buf, 0x20u);
  }

  id v15 = self->_clientDB;
  if (!v15) {
    goto LABEL_13;
  }
  int v16 = dup([v10 fileDescriptor]);
  id v17 = fdopen(v16, "a");
  if (!v17)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    uint64_t v19 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v19)
    {
      uint64_t v20 = brc_bread_crumbs();
      BOOL v21 = brc_default_log();
      if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
      {
        uint64_t v24 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        *(void *)&uint8_t buf[4] = "-[BRCAccountSession(DatabaseAdditions) dumpItemsToHandle:itemType:tracker:error:]";
        *(_WORD *)&buf[12] = 2080;
        if (!a6) {
          uint64_t v24 = "(ignored by caller)";
        }
        *(void *)&buf[14] = v24;
        *(_WORD *)&buf[22] = 2112;
        BOOL v35 = v19;
        LOWORD(v36) = 2112;
        *(void *)((char *)&v36 + 2) = v20;
        _os_log_error_impl(&dword_1D353B000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a6) {
      *a6 = v19;
    }

LABEL_13:
    BOOL v22 = 0;
    goto LABEL_18;
  }
  int v18 = [v11 isEqualToString:@"all"];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  BOOL v35 = __Block_byref_object_copy__14;
  *(void *)&long long v36 = __Block_byref_object_dispose__14;
  *((void *)&v36 + 1) = [[BRCDumpContext alloc] initWithFile:v17 db:v15];
  [*(id *)(*(void *)&buf[8] + 40) setTaskTracker:v12];
  if (v18)
  {
    [*(id *)(*(void *)&buf[8] + 40) setNewLineAfterWrite:0];
    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x2020000000;
    int v32 = 0;
    [*(id *)(*(void *)&buf[8] + 40) writeLineWithFormat:@"{"];
    [*(id *)(*(void *)&buf[8] + 40) writeEmptyLine];
  }
  else
  {
    uint64_t v29 = 0;
    id v30 = &v29;
    uint64_t v31 = 0x2020000000;
    int v32 = 0;
  }
  v27[0] = 0;
  v27[1] = v27;
  v27[2] = 0x2020000000;
  char v28 = 1;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __81__BRCAccountSession_DatabaseAdditions__dumpItemsToHandle_itemType_tracker_error___block_invoke;
  uint64_t v25[3] = &unk_1E6996420;
  v25[4] = buf;
  v25[5] = &v29;
  char v26 = v18;
  v25[6] = v27;
  [(BRCAccountSession *)self enumerateItemsWithType:v11 itemRowIDs:0 db:v15 withBlock:v25];
  if (v18)
  {
    [*(id *)(*(void *)&buf[8] + 40) writeEmptyLine];
    [*(id *)(*(void *)&buf[8] + 40) writeLineWithFormat:@"}"];
  }
  fclose(v17);
  _Block_object_dispose(v27, 8);
  _Block_object_dispose(&v29, 8);
  _Block_object_dispose(buf, 8);

  BOOL v22 = 1;
LABEL_18:

  __brc_leave_section(v33);
  return v22;
}

void __81__BRCAccountSession_DatabaseAdditions__dumpItemsToHandle_itemType_tracker_error___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, uint64_t a5, uint64_t a6, uint64_t a7, unsigned char *a8)
{
  id v16 = a2;
  id v11 = a3;
  id v12 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
  ++*(_DWORD *)(*(void *)(*(void *)(a1 + 40) + 8) + 24);
  if ((objc_msgSend(v12, "shouldKeepDumpingWithItemCount:includeAllItems:") & 1) == 0) {
    *a8 = 1;
  }
  if (*(unsigned char *)(a1 + 56))
  {
    uint64_t v13 = objc_msgSend(v11, "br_stringByJSONEscaping");
    BOOL v14 = objc_msgSend(v16, "br_stringByJSONEscaping");
    id v15 = *(void **)(*(void *)(*(void *)(a1 + 32) + 8) + 40);
    if (*(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24))
    {
      [v15 writeLineWithFormat:@"\t\"%@\": \"%@\"", v13, v14];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 0;
    }
    else
    {
      [v15 writeLineWithFormat:@","];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) writeEmptyLine];
      [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) writeLineWithFormat:@"\t\"%@\": \"%@\"", v13, v14];
    }
  }
  else
  {
    [*(id *)(*(void *)(*(void *)(a1 + 32) + 8) + 40) writeLineWithFormat:@"%@", v11];
  }
}

- (int)_resolveDeviceID
{
  NSHomeDirectory();
  long long v6 = xmmword_1D38875FC;
  uint64_t v7 = 0;
  uint64_t v5 = 0;
  id v2 = objc_claimAutoreleasedReturnValue();
  if (getattrlist((const char *)[v2 fileSystemRepresentation], &v6, &v5, 8uLL, 0x20u) < 0) {
    int v3 = 0x80000000;
  }
  else {
    int v3 = HIDWORD(v5);
  }

  return v3;
}

- (BOOL)enumerateSharedToMeItemsWithBlock:(id)a3 error:(id *)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  long long v6 = self->_clientDB;
  char v28 = v6;
  if (v6)
  {
    uint64_t v45 = 0;
    char v46 = &v45;
    uint64_t v47 = 0x2020000000;
    char v48 = 0;
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = __80__BRCAccountSession_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke;
    v42[3] = &unk_1E69963A8;
    long long v44 = &v45;
    uint64_t v7 = v6;
    char v43 = v7;
    [(BRCPQLConnection *)v7 performWithFlags:1 action:v42];
    if (*((unsigned char *)v46 + 24))
    {
      id v8 = brc_bread_crumbs();
      id v9 = brc_default_log();
      if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
        -[BRCAccountSession(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:]((uint64_t)v8, v9);
      }

      id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorMethodNotImplemented:", sel_enumerateSharedToMeItemsWithBlock_error_);
      if (v10)
      {
        id v11 = brc_bread_crumbs();
        id v12 = brc_default_log();
        if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
        {
          id v25 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "-[BRCAccountSession(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:]";
          *(_WORD *)&buf[12] = 2080;
          if (!a4) {
            id v25 = "(ignored by caller)";
          }
          *(void *)&buf[14] = v25;
          *(_WORD *)&buf[22] = 2112;
          __int16 v50 = v10;
          __int16 v51 = 2112;
          __int16 v52 = v11;
          _os_log_error_impl(&dword_1D353B000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a4) {
        *a4 = v10;
      }
    }
    else
    {
      int v17 = [(BRCAccountSession *)self _resolveDeviceID];
      if (v17 != 0x80000000)
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x2020000000;
        __int16 v50 = 0;
        BOOL v21 = +[BRCUserDefaults defaultsForMangledID:0];
        int v22 = [v21 readerScanBatchSize];

        uint64_t v38 = 0;
        uint64_t v39 = &v38;
        uint64_t v40 = 0x2020000000;
        char v41 = 0;
        uint64_t v23 = MEMORY[0x1E4F143A8];
        do
        {
          v30[0] = v23;
          v30[1] = 3221225472;
          v30[2] = __80__BRCAccountSession_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke_136;
          v30[3] = &unk_1E6996448;
          uint64_t v24 = v7;
          BOOL v35 = &v38;
          uint64_t v36 = v22;
          id v34 = buf;
          uint64_t v31 = v24;
          int v32 = self;
          int v37 = v17;
          id v33 = v29;
          [(BRCPQLConnection *)v24 performWithFlags:1 action:v30];
        }
        while (!*((unsigned char *)v39 + 24));
        _Block_object_dispose(&v38, 8);
        _Block_object_dispose(buf, 8);
        BOOL v16 = 1;
        goto LABEL_24;
      }
      id v10 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_unkownErrorWithDescription:", @"Can't resolve device ID");
      if (v10)
      {
        int v18 = brc_bread_crumbs();
        uint64_t v19 = brc_default_log();
        if (os_log_type_enabled(v19, (os_log_type_t)0x90u))
        {
          id v27 = "(passed to caller)";
          *(_DWORD *)buf = 136315906;
          *(void *)&uint8_t buf[4] = "-[BRCAccountSession(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:]";
          *(_WORD *)&buf[12] = 2080;
          if (!a4) {
            id v27 = "(ignored by caller)";
          }
          *(void *)&buf[14] = v27;
          *(_WORD *)&buf[22] = 2112;
          __int16 v50 = v10;
          __int16 v51 = 2112;
          __int16 v52 = v18;
          _os_log_error_impl(&dword_1D353B000, v19, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
        }
      }
      if (a4) {
        *a4 = v10;
      }
    }

    BOOL v16 = 0;
LABEL_24:

    _Block_object_dispose(&v45, 8);
    goto LABEL_25;
  }
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F592A8], 25, @"The session has a nil DB");
  if (v13)
  {
    BOOL v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, (os_log_type_t)0x90u))
    {
      char v26 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      *(void *)&uint8_t buf[4] = "-[BRCAccountSession(DatabaseAdditions) enumerateSharedToMeItemsWithBlock:error:]";
      *(_WORD *)&buf[12] = 2080;
      if (!a4) {
        char v26 = "(ignored by caller)";
      }
      *(void *)&buf[14] = v26;
      *(_WORD *)&buf[22] = 2112;
      __int16 v50 = v13;
      __int16 v51 = 2112;
      __int16 v52 = v14;
      _os_log_error_impl(&dword_1D353B000, v15, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a4) {
    *a4 = v13;
  }

  BOOL v16 = 0;
LABEL_25:

  return v16;
}

uint64_t __80__BRCAccountSession_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) userVersion];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = (unint64_t)[v2 unsignedLongValue] >> 4 > 0x752;

  return 0;
}

uint64_t __80__BRCAccountSession_DatabaseAdditions__enumerateSharedToMeItemsWithBlock_error___block_invoke_136(uint64_t a1)
{
  id v2 = (void *)[*(id *)(a1 + 32) fetchWithSlowStatementRadar:@"none", @"SELECT item_file_id, zone_rowid    FROM client_items   WHERE item_sharing_options != 0    ORDER BY rowid    LIMIT %lld    OFFSET %lld", *(void *)(a1 + 72), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24) sql];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 1;
  if ([v2 next])
  {
    do
    {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 64) + 8) + 24) = 0;
      ++*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 24);
      uint64_t v3 = [v2 integerAtIndex:0];
      id v4 = *(void **)(a1 + 40);
      uint64_t v5 = [v2 numberAtIndex:1];
      long long v6 = [v4 serverZoneByRowID:v5];

      uint64_t v7 = [v6 clientZone];
      int v8 = [v7 isSharedZone];

      if (v8)
      {
        id v9 = objc_msgSend(NSString, "br_pathWithDeviceID:fileID:", *(unsigned int *)(a1 + 80), v3);
        (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      }
    }
    while (([v2 next] & 1) != 0);
  }

  return 0;
}

- (BOOL)dumpDatabaseToFileHandle:(id)a3 zoneName:(id)a4 includeAllItems:(BOOL)a5 verbose:(BOOL)a6 tracker:(id)a7 error:(id *)a8
{
  BOOL v9 = a6;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  id v39 = a4;
  id v40 = a7;
  memset(v63, 0, sizeof(v63));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItems:verbose:tracker:error:]", 515, v63);
  uint64_t v13 = brc_bread_crumbs();
  BOOL v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSession(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItems:verbose:tracker:error:]();
  }

  id v15 = self->_clientDB;
  BOOL v16 = v15;
  uint64_t v59 = 0;
  long long v60 = &v59;
  uint64_t v61 = 0x2020000000;
  char v62 = 0;
  uint64_t v53 = 0;
  __int16 v54 = &v53;
  uint64_t v55 = 0x3032000000;
  id v56 = __Block_byref_object_copy__14;
  long long v57 = __Block_byref_object_dispose__14;
  id v58 = 0;
  int cloudDocsFD = self->_cloudDocsFD;
  if (cloudDocsFD < 0)
  {
    int v18 = 0;
    if (!v15)
    {
LABEL_22:
      BOOL v31 = 0;
      goto LABEL_23;
    }
  }
  else
  {
    int v18 = [(BRCAccountSession *)self containerScheduler];
    if (!v16) {
      goto LABEL_22;
    }
  }
  int v19 = dup([v41 fileDescriptor]);
  uint64_t v20 = fdopen(v19, "a");
  if (!v20)
  {
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    int v32 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (v32)
    {
      id v33 = brc_bread_crumbs();
      id v34 = brc_default_log();
      if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
      {
        int v37 = "(passed to caller)";
        *(_DWORD *)char v72 = 136315906;
        *(void *)&v72[4] = "-[BRCAccountSession(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItems:ve"
                             "rbose:tracker:error:]";
        *(_WORD *)&v72[12] = 2080;
        if (!a8) {
          int v37 = "(ignored by caller)";
        }
        *(void *)&v72[14] = v37;
        *(_WORD *)&v72[22] = 2112;
        v73 = v32;
        LOWORD(v74) = 2112;
        *(void *)((char *)&v74 + 2) = v33;
        _os_log_error_impl(&dword_1D353B000, v34, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v72, 0x2Au);
      }
    }
    if (a8) {
      *a8 = v32;
    }

    goto LABEL_22;
  }
  *(void *)char v72 = 0;
  *(void *)&v72[8] = v72;
  *(void *)&v72[16] = 0x3032000000;
  v73 = __Block_byref_object_copy__14;
  *(void *)&long long v74 = __Block_byref_object_dispose__14;
  *((void *)&v74 + 1) = [[BRCDumpContext alloc] initWithFile:v20 db:v16];
  [*(id *)(*(void *)&v72[8] + 40) setLiveDaemon:cloudDocsFD >= 0];
  [*(id *)(*(void *)&v72[8] + 40) setTaskTracker:v40];
  [*(id *)(*(void *)&v72[8] + 40) setVerbose:v9];
  [(BRCAccountSession *)self disableDatabaseProfilingForDB:v16];
  v45[0] = MEMORY[0x1E4F143A8];
  v45[1] = 3221225472;
  v45[2] = __112__BRCAccountSession_DatabaseAdditions__dumpDatabaseToFileHandle_zoneName_includeAllItems_verbose_tracker_error___block_invoke;
  v45[3] = &unk_1E69964B0;
  uint64_t v49 = v72;
  v45[4] = self;
  BOOL v21 = v16;
  char v46 = v21;
  id v47 = v18;
  BOOL v52 = a5;
  id v48 = v39;
  __int16 v50 = &v53;
  __int16 v51 = &v59;
  [(BRCPQLConnection *)v21 performWithFlags:1 action:v45];
  int v22 = +[BRCAccountsManager sharedManager];
  v42[0] = MEMORY[0x1E4F143A8];
  v42[1] = 3221225472;
  v42[2] = __112__BRCAccountSession_DatabaseAdditions__dumpDatabaseToFileHandle_zoneName_includeAllItems_verbose_tracker_error___block_invoke_260;
  v42[3] = &unk_1E69964D8;
  id v23 = v22;
  id v43 = v23;
  long long v44 = v72;
  [v23 enumerateAccountHandlers:v42];
  uint64_t v24 = [(BRCAccountSession *)self analyticsReporter];
  [v24 dumpToContext:*(void *)(*(void *)&v72[8] + 40)];

  id v25 = [(BRCAccountSession *)self globalProgress];
  [v25 dumpToContext:*(void *)(*(void *)&v72[8] + 40)];

  char v26 = +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor];
  [v26 dumpToContext:*(void *)(*(void *)&v72[8] + 40)];

  id v27 = +[BRCDaemon daemon];
  [v27 dumpToContext:*(void *)(*(void *)&v72[8] + 40)];

  id v28 = (id)v54[5];
  if (v28)
  {
    id v29 = brc_bread_crumbs();
    id v30 = brc_default_log();
    if (os_log_type_enabled(v30, (os_log_type_t)0x90u))
    {
      uint64_t v36 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      uint64_t v65 = "-[BRCAccountSession(DatabaseAdditions) dumpDatabaseToFileHandle:zoneName:includeAllItems:verbose:tracker:error:]";
      __int16 v66 = 2080;
      if (!a8) {
        uint64_t v36 = "(ignored by caller)";
      }
      id v67 = v36;
      __int16 v68 = 2112;
      id v69 = v28;
      __int16 v70 = 2112;
      v71 = v29;
      _os_log_error_impl(&dword_1D353B000, v30, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a8) {
    *a8 = v28;
  }

  fclose(v20);
  if (cloudDocsFD >= 0) {
    [(BRCAccountSession *)self enableDatabaseProfilingForDB:v21];
  }
  BOOL v31 = *((unsigned char *)v60 + 24) != 0;

  _Block_object_dispose(v72, 8);
LABEL_23:
  _Block_object_dispose(&v53, 8);

  _Block_object_dispose(&v59, 8);
  __brc_leave_section(v63);

  return v31;
}

uint64_t __112__BRCAccountSession_DatabaseAdditions__dumpDatabaseToFileHandle_zoneName_includeAllItems_verbose_tracker_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = objc_alloc_init(MEMORY[0x1E4F28C10]);
  [v4 setDateFormat:@"yyyy-MM-dd HH:mm:ss.SSSZ"];
  v112 = (void *)[v3 fetch:@"SELECT count(*) FROM boot_history"];
  [v112 next];
  int v5 = [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) liveDaemon];
  long long v6 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  uint64_t v7 = [MEMORY[0x1E4F1C9C8] date];
  v115 = v4;
  uint64_t v8 = [v4 stringFromDate:v7];
  BOOL v9 = (void *)v8;
  if (v5)
  {
    id v10 = [*(id *)(a1 + 32) accountDSID];
    if ([*(id *)(a1 + 32) icloudAccountIsInCarry]) {
      id v11 = "Yes";
    }
    else {
      id v11 = "No";
    }
    id v12 = objc_msgSend(NSString, "br_currentHomeDir");
    uint64_t v13 = objc_msgSend(v12, "br_realpath");
    [v6 writeLineWithFormat:@"dump taken at %@ [account=%@] [inCarry=%s] [home=%@]", v9, v10, v11, v13];
  }
  else
  {
    [v6 writeLineWithFormat:@"dump taken at %@", v8];
  }

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:&stru_1F2AC7720];
  BOOL v14 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v15 = [*(id *)(a1 + 40) userVersion];
  [v14 writeLineWithFormat:@"database version: %@", v15];

  if (*(void *)(*(void *)(a1 + 32) + 88)) {
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"database ID: %@", *(void *)(*(void *)(a1 + 32) + 88)];
  }
  BOOL v16 = [*(id *)(a1 + 40) userVersion];
  unint64_t v17 = [v16 unsignedLongValue];

  int v18 = @"FPFS";
  if (v17 >> 4 <= 0x752) {
    int v18 = @"Legacy";
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"fsType: %@", v18];
  if (v17 >> 4 >= 0x753)
  {
    int v19 = *(void **)(a1 + 32);
    if (v19[22])
    {
      uint64_t v20 = [v19 _getFPFSMigrationStatus:v3 withError:0];
      BOOL v21 = [v20 objectForKeyedSubscript:@"MigrationStatus"];
      int v22 = v21;
      if (v21)
      {
        id v23 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        [v21 unsignedIntValue];
        objc_msgSend(v23, "writeLineWithFormat:", @"FPFS import state: %s", BRCPrettyPrintEnum());
      }
      uint64_t v24 = [v20 objectForKeyedSubscript:@"kBRCFPFSMigrationUUIDKey"];
      if (v24) {
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"FPFS import UUID: %@", v24];
      }
      id v25 = [v20 objectForKeyedSubscript:@"NonMigratedItems"];
      if (v25) {
        [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"FPFS import pending items: %@", v25];
      }
    }
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:&stru_1F2AC7720];
  char v26 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  id v27 = +[BRCDaemon daemon];
  id v28 = [v27 startupDate];
  [v28 timeIntervalSinceNow];
  objc_msgSend(v26, "writeLineWithFormat:", @"boot_history (startup %.1fs ago)", -v29);

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"-----------------------------------------------------"];
  id v30 = +[BRCUserDefaults defaultsForMangledID:0];
  BOOL v31 = [v30 dumpDateFormat];
  [v115 setDateFormat:v31];

  int v32 = [v3 userVersion];
  unint64_t v33 = [v32 unsignedLongValue];

  if (v33 <= 0x7533)
  {
    id v34 = "";
    uint64_t v35 = 0;
  }
  else
  {
    id v34 = ",device_id";
    uint64_t v35 = 10;
  }
  uint64_t v36 = [MEMORY[0x1E4FBA908] rawInjection:v34 length:v35];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"server_truth"];
  v113 = (void *)v36;
  v114 = v3;
  int v37 = (void *)[v3 fetch:@"SELECT date,os,br,bird_schema,db_schema%@ FROM server_boot_history ORDER BY rowid DESC LIMIT 10", v36];
  if ([v37 next])
  {
    do
    {
      uint64_t v38 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v37, "intAtIndex:", 0));
      id v39 = [v115 stringFromDate:v38];
      id v40 = [v37 stringAtIndex:1];
      id v41 = [v37 stringAtIndex:2];
      uint64_t v42 = [v37 numberAtIndex:3];
      id v43 = [v37 numberAtIndex:4];
      if (v33 < 0x7534)
      {
        long long v44 = 0;
      }
      else
      {
        long long v44 = [v37 numberAtIndex:5];
      }
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"  [%@] OS:%@ CloudDocs:%@ BirdSchema:%@ DBSchema:%@ DeviceID:%@", v39, v40, v41, v42, v43, v44];
    }
    while (([v37 next] & 1) != 0);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"client_truth"];
  uint64_t v45 = (void *)[v114 fetch:@"SELECT date,os,br,bird_schema,db_schema%@ FROM boot_history ORDER BY rowid DESC LIMIT 10", v113];

  if ([v45 next])
  {
    do
    {
      char v46 = objc_msgSend(MEMORY[0x1E4F1C9C8], "dateWithTimeIntervalSince1970:", (double)(int)objc_msgSend(v45, "intAtIndex:", 0));
      id v47 = [v115 stringFromDate:v46];
      id v48 = [v45 stringAtIndex:1];
      uint64_t v49 = [v45 stringAtIndex:2];
      __int16 v50 = [v45 numberAtIndex:3];
      __int16 v51 = [v45 numberAtIndex:4];
      if (v33 < 0x7534)
      {
        BOOL v52 = 0;
      }
      else
      {
        BOOL v52 = [v45 numberAtIndex:5];
      }
      [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"  [%@] OS:%@ CloudDocs:%@ BirdSchema:%@ DBSchema:%@ DeviceID:%@", v47, v48, v49, v50, v51, v52];
    }
    while (([v45 next] & 1) != 0);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"backup_detector"];
  uint64_t v53 = v114;
  __int16 v54 = (void *)[v114 fetch:@"SELECT old,new,counter,os,br FROM backup_detector"];

  if ([v54 next])
  {
    v110 = [v54 numberAtIndex:0];
    uint64_t v55 = [v54 numberAtIndex:1];
    id v56 = [v54 numberAtIndex:2];
    long long v57 = [v54 stringAtIndex:3];
    id v58 = [v54 stringAtIndex:4];
    uint64_t v59 = [v114 userVersion];
    long long v60 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    id v61 = v57;
    uint64_t v62 = [v61 UTF8String];
    id v63 = v58;
    uint64_t v64 = [v63 UTF8String];
    if (v59) {
      uint64_t v65 = [v59 longValue];
    }
    else {
      uint64_t v65 = -1;
    }
    [v60 writeLineWithFormat:@"  [%@|%@|%@] OS:%s CloudDocs:%s DBSchema:%ld", v110, v55, v56, v62, v64, v65];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeEmptyLine];
    [v54 close];

    uint64_t v53 = v114;
  }
  __int16 v66 = (void *)[v53 fetch:@"SELECT * FROM server_state"];

  if ([v66 next])
  {
    id v67 = [v66 unarchivedObjectOfClass:objc_opt_class() atIndex:0];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"server_state"];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"-----------------------------------------------------"];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"%@", v67];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeEmptyLine];
    [v66 close];
  }
  else
  {
    id v67 = 0;
  }
  __int16 v68 = (void *)[v53 fetch:@"SELECT * FROM client_state"];

  if ([v68 next])
  {
    id v69 = +[BRCAccountSession _classesForClientState];
    uint64_t v70 = [v68 unarchivedObjectOfClasses:v69 atIndex:0];

    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"client_state"];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"-----------------------------------------------------"];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"%@", v70];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeEmptyLine];
    [v68 close];

    v111 = (void *)v70;
  }
  else
  {
    v111 = v67;
  }
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"devices:"];
  v71 = (void *)[v53 fetch:@"SELECT key, name FROM devices"];

  if ([v71 next])
  {
    do
    {
      uint64_t v72 = [v71 longAtIndex:0];
      v73 = [v71 stringAtIndex:1];
      long long v74 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      uint64_t v75 = objc_msgSend(v73, "fp_obfuscatedFilename");
      [v74 writeLineWithFormat:@"    o \"%@\" (%ld)", v75, v72];
    }
    while (([v71 next] & 1) != 0);
  }
  [v71 close];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeEmptyLine];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"users:"];
  v76 = (void *)[v53 fetch:@"SELECT user_key, user_name, user_plist FROM users"];

  if ([v76 next])
  {
    do
    {
      uint64_t v77 = [v76 longAtIndex:0];
      v78 = [v76 stringAtIndex:1];
      unint64_t v79 = [v76 objectOfClass:objc_opt_class() atIndex:2];
      v80 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
      v81 = [v79 nameComponents];
      v82 = objc_msgSend(v81, "br_formattedName");
      v83 = objc_msgSend(v82, "fp_obfuscatedFilename");
      [v80 writeLineWithFormat:@"    o \"%@\" %@ (%ld)", v78, v83, v77];
    }
    while (([v76 next] & 1) != 0);
  }
  [v76 close];
  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeEmptyLine];
  [*(id *)(a1 + 48) dumpToContext:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) includeAllItems:*(unsigned __int8 *)(a1 + 88) db:*(void *)(a1 + 40)];
  v84 = *(void **)(a1 + 32);
  uint64_t v85 = *(void *)(a1 + 56);
  id v121 = 0;
  v86 = [v84 clientZonesMatchingSearchString:v85 error:&v121];
  id v87 = v121;
  v88 = v87;
  uint64_t v89 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
  if (v86)
  {
    id v108 = v87;
    uint64_t v90 = [v86 count];
    BOOL v91 = *(__CFString **)(a1 + 56);
    if (!v91) {
      BOOL v91 = @"*";
    }
    [v89 writeLineWithFormat:@"%u containers matching '%@'", v90, v91];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeLineWithFormat:@"-----------------------------------------------------"];
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    v109 = v86;
    id v92 = v86;
    uint64_t v93 = [v92 countByEnumeratingWithState:&v117 objects:v126 count:16];
    if (v93)
    {
      uint64_t v94 = v93;
      uint64_t v95 = *(void *)v118;
      while (2)
      {
        for (uint64_t i = 0; i != v94; ++i)
        {
          if (*(void *)v118 != v95) {
            objc_enumerationMutation(v92);
          }
          uint64_t v97 = *(void *)(*((void *)&v117 + 1) + 8 * i);
          v98 = (void *)MEMORY[0x1D9438760]();
          __int16 v99 = brc_bread_crumbs();
          v100 = brc_default_log();
          if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v123 = v97;
            __int16 v124 = 2112;
            v125 = v99;
            _os_log_debug_impl(&dword_1D353B000, v100, OS_LOG_TYPE_DEBUG, "[DEBUG] dumping client zone %@%@", buf, 0x16u);
          }

          if ([*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) isCancelled])
          {
            goto LABEL_63;
          }
          uint64_t v101 = *(void **)(a1 + 32);
          uint64_t v102 = *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
          uint64_t v103 = *(unsigned __int8 *)(a1 + 88);
          uint64_t v104 = *(void *)(*(void *)(a1 + 72) + 8);
          id obj = *(id *)(v104 + 40);
          [v101 _dumpClientZone:v97 toContext:v102 includeAllItems:v103 error:&obj];
          objc_storeStrong((id *)(v104 + 40), obj);
        }
        uint64_t v94 = [v92 countByEnumeratingWithState:&v117 objects:v126 count:16];
        if (v94) {
          continue;
        }
        break;
      }
    }
LABEL_63:

    v105 = v114;
    v88 = v108;
    v86 = v109;
  }
  else
  {
    [v89 writeLineWithFormat:@"%@", v87];
    [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) writeEmptyLine];
    v105 = v114;
  }

  if (*(unsigned char *)(a1 + 88)) {
    +[BRCPackageItem dumpSession:*(void *)(a1 + 32) toContext:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) db:v105 error:0];
  }
  [*(id *)(a1 + 32) dumpXPCClientsToContext:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  [*(id *)(a1 + 32) dumpMiscOperationsToContext:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
  v106 = [*(id *)(a1 + 32) analyticsReporter];
  [v106 dumpDatabaseInfoToContext:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];

  if (!*(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40)) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 80) + 8) + 24) = 1;
  }
  [v112 close];

  return 0;
}

void __112__BRCAccountSession_DatabaseAdditions__dumpDatabaseToFileHandle_zoneName_includeAllItems_verbose_tracker_error___block_invoke_260(uint64_t a1, void *a2)
{
  id v3 = *(void **)(a1 + 32);
  id v4 = NSNumber;
  id v8 = [a2 session];
  int v5 = [v8 volume];
  long long v6 = objc_msgSend(v4, "numberWithInt:", objc_msgSend(v5, "deviceID"));
  uint64_t v7 = [v3 versionsProviderForVolume:v6];
  [v7 dumpToContext:*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40)];
}

- (void)_dumpClientZoneBlockedState:(id)a3 toContext:(id)a4
{
  id v9 = a3;
  id v5 = a4;
  if (([v9 state] & 0x10000) != 0)
  {
    long long v6 = [v5 highlightedString:@">>> BROKEN STRUCTURE" type:3];
    [v5 writeLineWithFormat:@"%@", v6];
  }
  if ([v9 isSyncBlockedBecauseAppNotInstalled])
  {
    uint64_t v7 = [v5 highlightedString:@">>> SYNC DISABLED (app not installed)" type:6];
    [v5 writeLineWithFormat:@"%@", v7];
  }
  if ([v9 isSyncBlockedBecauseOSNeedsUpgrade])
  {
    id v8 = [v5 highlightedString:@">>> NEEDS UPGRADE" type:3];
    [v5 writeLineWithFormat:@"%@", v8];
  }
}

- (BOOL)_dumpClientZoneStatus:(id)a3 toContext:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [v8 descriptionWithContext:v9];
  [v9 writeLineWithFormat:@"%@", v10];

  [(BRCAccountSession *)self _dumpClientZoneBlockedState:v8 toContext:v9];
  [v9 pushIndentation];
  id v11 = [v8 serverZone];
  LODWORD(v10) = [v11 dumpStatusToContext:v9 error:a5];

  BOOL v12 = v10 && ([v8 dumpStatusToContext:v9 error:a5] & 1) != 0;
  [v9 popIndentation];

  return v12;
}

- (BOOL)_dumpClientZone:(id)a3 toContext:(id)a4 includeAllItems:(BOOL)a5 error:(id *)a6
{
  BOOL v7 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  BOOL v12 = [v10 descriptionWithContext:v11];
  [v11 writeLineWithFormat:@"- %@", v12];

  [(BRCAccountSession *)self _dumpClientZoneBlockedState:v10 toContext:v11];
  [v11 writeLineWithFormat:@"-----------------------------------------------------"];
  if ([v10 isPrivateZone])
  {
    [v11 pushIndentation];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    uint64_t v13 = [v10 asPrivateClientZone];
    BOOL v14 = [v13 appLibraries];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v15)
    {
      uint64_t v16 = v15;
      uint64_t v17 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v29 != v17) {
            objc_enumerationMutation(v14);
          }
          [*(id *)(*((void *)&v28 + 1) + 8 * i) dumpToContext:v11];
        }
        uint64_t v16 = [v14 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v16);
    }

    [v11 popIndentation];
  }
  [v11 writeLineWithFormat:&stru_1F2AC7720];
  [v11 pushIndentation];
  int v19 = [v10 serverZone];
  if (!v19)
  {
    if ([v10 isSharedZone])
    {
      uint64_t v20 = [v10 asSharedClientZone];
      BOOL v21 = [v20 zoneName];
      int v22 = [v20 ownerName];
      id v23 = [v11 db];
      int v19 = [(BRCAccountSession *)self _sharedServerZoneByName:v21 ownerName:v22 db:v23];
    }
    else
    {
      uint64_t v20 = [v10 zoneName];
      BOOL v21 = [v11 db];
      int v19 = [(BRCAccountSession *)self _privateServerZoneByName:v20 db:v21];
    }

    [v10 associateWithServerZone:v19];
  }
  int v24 = [v10 dumpActivityToContext:v11 includeExpensiveActivity:v7 error:a6];
  if (v24)
  {
    [v11 writeLineWithFormat:&stru_1F2AC7720];
    int v25 = [v19 dumpTablesToContext:v11 includeAllItems:v7 error:a6];
    int v26 = [v10 dumpTablesToContext:v11 includeAllItems:v7 error:a6];
    if (v25 && v26) {
      [v11 writeLineWithFormat:@" - not done dumping items -"];
    }
    [v11 popIndentation];
    [v11 writeLineWithFormat:@"-----------------------------------------------------"];
  }
  else
  {
    [v11 popIndentation];
  }

  return v24;
}

- (BOOL)dumpStatusToFileHandle:(id)a3 zoneName:(id)a4 tracker:(id)a5 error:(id *)a6
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  memset(v34, 0, sizeof(v34));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession(DatabaseAdditions) dumpStatusToFileHandle:zoneName:tracker:error:]", 855, v34);
  brc_bread_crumbs();
  uint64_t v13 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  BOOL v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v34[0];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 2112;
    long long v44 = v13;
    _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx dumping status for zone: %@%@", buf, 0x20u);
  }

  uint64_t v15 = self->_clientDB;
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v44 = __Block_byref_object_copy__14;
  uint64_t v45 = __Block_byref_object_dispose__14;
  id v46 = 0;
  [(BRCAccountSession *)self disableDatabaseProfilingForDB:v15];
  uint64_t v25 = MEMORY[0x1E4F143A8];
  uint64_t v26 = 3221225472;
  id v27 = __86__BRCAccountSession_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke;
  long long v28 = &unk_1E6996000;
  id v16 = v10;
  id v29 = v16;
  uint64_t v33 = buf;
  id v17 = v12;
  id v30 = v17;
  long long v31 = self;
  id v18 = v11;
  id v32 = v18;
  [(BRCPQLConnection *)v15 performWithFlags:1 action:&v25];
  id v19 = *(id *)(*(void *)&buf[8] + 40);
  if (v19)
  {
    uint64_t v20 = brc_bread_crumbs();
    BOOL v21 = brc_default_log();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
    {
      int v24 = "(passed to caller)";
      *(_DWORD *)uint64_t v35 = 136315906;
      uint64_t v36 = "-[BRCAccountSession(DatabaseAdditions) dumpStatusToFileHandle:zoneName:tracker:error:]";
      __int16 v37 = 2080;
      if (!a6) {
        int v24 = "(ignored by caller)";
      }
      uint64_t v38 = v24;
      __int16 v39 = 2112;
      id v40 = v19;
      __int16 v41 = 2112;
      uint64_t v42 = v20;
      _os_log_error_impl(&dword_1D353B000, v21, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", v35, 0x2Au);
    }
  }
  if (a6) {
    *a6 = v19;
  }

  -[BRCAccountSession enableDatabaseProfilingForDB:](self, "enableDatabaseProfilingForDB:", v15, v25, v26, v27, v28);
  BOOL v22 = *(void *)(*(void *)&buf[8] + 40) == 0;

  _Block_object_dispose(buf, 8);
  __brc_leave_section(v34);

  return v22;
}

uint64_t __86__BRCAccountSession_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  int v4 = dup([*(id *)(a1 + 32) fileDescriptor]);
  id v5 = fdopen(v4, "a");
  if (v5)
  {
    long long v6 = v5;
    id v7 = objc_alloc_init(MEMORY[0x1E4F28C10]);
    [v7 setDateStyle:1];
    [v7 setTimeStyle:2];
    id v8 = [[BRCDumpContext alloc] initWithFile:v6 db:v3];
    [(BRCDumpContext *)v8 setLiveDaemon:1];
    [(BRCDumpContext *)v8 setOnlyActiveStuff:1];
    [(BRCDumpContext *)v8 setTaskTracker:*(void *)(a1 + 40)];
    id v9 = (void *)[v3 fetch:@"SELECT count(*) FROM boot_history"];
    [v9 next];
    id v10 = *(void **)(a1 + 48);
    uint64_t v11 = *(void *)(a1 + 56);
    id v46 = 0;
    id v12 = [v10 clientZonesMatchingSearchString:v11 error:&v46];
    id v13 = v46;
    BOOL v14 = v13;
    if (v12)
    {
      __int16 v39 = v6;
      uint64_t v15 = [v12 count];
      id v16 = *(void **)(a1 + 56);
      id v40 = v3;
      __int16 v37 = v9;
      id v38 = v7;
      uint64_t v35 = v14;
      if (v16) {
        id v17 = (const char *)[v16 UTF8String];
      }
      else {
        id v17 = "*";
      }
      [(BRCDumpContext *)v8 writeLineWithFormat:@"%u containers matching '%s'", v15, v17];
      long long v44 = 0u;
      long long v45 = 0u;
      long long v42 = 0u;
      long long v43 = 0u;
      uint64_t v36 = v12;
      id v23 = v12;
      uint64_t v24 = [v23 countByEnumeratingWithState:&v42 objects:v51 count:16];
      if (v24)
      {
        uint64_t v25 = v24;
        uint64_t v26 = *(void *)v43;
        while (2)
        {
          for (uint64_t i = 0; i != v25; ++i)
          {
            if (*(void *)v43 != v26) {
              objc_enumerationMutation(v23);
            }
            uint64_t v28 = *(void *)(*((void *)&v42 + 1) + 8 * i);
            id v29 = (void *)MEMORY[0x1D9438760]();
            id v30 = brc_bread_crumbs();
            long long v31 = brc_default_log();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              id v48 = v23;
              __int16 v49 = 2112;
              __int16 v50 = v30;
              _os_log_debug_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] dumping container %@%@", buf, 0x16u);
            }

            if ([(BRCDumpContext *)v8 isCancelled])
            {
              goto LABEL_22;
            }
            id v32 = *(void **)(a1 + 48);
            uint64_t v33 = *(void *)(*(void *)(a1 + 64) + 8);
            id obj = *(id *)(v33 + 40);
            [v32 _dumpClientZoneStatus:v28 toContext:v8 error:&obj];
            objc_storeStrong((id *)(v33 + 40), obj);
          }
          uint64_t v25 = [v23 countByEnumeratingWithState:&v42 objects:v51 count:16];
          if (v25) {
            continue;
          }
          break;
        }
      }
LABEL_22:

      long long v6 = v39;
      id v3 = v40;
      id v9 = v37;
      id v7 = v38;
      BOOL v14 = v35;
      id v12 = v36;
    }
    else
    {
      [(BRCDumpContext *)v8 writeLineWithFormat:@"%@", v13];
      [(BRCDumpContext *)v8 writeEmptyLine];
    }

    [v9 close];
    fclose(v6);
  }
  else
  {
    id v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, (os_log_type_t)0x90u)) {
      __86__BRCAccountSession_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke_cold_1((uint64_t)v18, v19);
    }

    uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
    uint64_t v21 = *(void *)(*(void *)(a1 + 64) + 8);
    BOOL v22 = *(void **)(v21 + 40);
    *(void *)(v21 + 40) = v20;

    [0 close];
  }

  return 0;
}

- (void)scheduleZoneMovesToCloudDocs:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BRCAccountSession *)self cloudDocsClientZone];
  long long v6 = [v5 defaultAppLibrary];
  char v7 = [v6 wasMovedToCloudDocs];

  if ((v7 & 1) == 0)
  {
    id v8 = (void *)[v4 mutableCopy];
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __68__BRCAccountSession_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke;
    uint64_t v25[3] = &unk_1E6994010;
    id v26 = v8;
    id v27 = self;
    id v9 = v8;
    [(BRCAccountSession *)self enumerateAppLibraries:v25];
    uint64_t v10 = [v9 allObjects];

    id v4 = (id)v10;
  }
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v11 = v4;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v30 count:16];
  if (v12)
  {
    uint64_t v14 = v12;
    uint64_t v15 = *(void *)v22;
    *(void *)&long long v13 = 138412290;
    long long v20 = v13;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v22 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        if (objc_msgSend(v17, "isCloudDocsZone", v20, (void)v21))
        {
          id v18 = brc_bread_crumbs();
          id v19 = brc_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = v20;
            id v29 = v18;
            _os_log_fault_impl(&dword_1D353B000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Can't CZM the clouddocs zone%@", buf, 0xCu);
          }
        }
        else
        {
          [v17 scheduleMoveToCloudDocs];
        }
      }
      uint64_t v14 = [v11 countByEnumeratingWithState:&v21 objects:v30 count:16];
    }
    while (v14);
  }
}

uint64_t __68__BRCAccountSession_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 wasMovedToCloudDocs] & 1) == 0)
  {
    id v4 = [v3 defaultClientZone];
    if ([v4 isCloudDocsZone]) {
      goto LABEL_7;
    }
    id v5 = [v3 mangledID];
    long long v6 = +[BRCUserDefaults defaultsForMangledID:v5];
    int v7 = [v6 shouldAutoMigrateToCloudDocs];

    if (v7)
    {
      id v8 = [v3 defaultClientZone];
      id v9 = [v8 serverZone];
      char v10 = [v9 hasFetchedServerZoneState];

      if (v10)
      {
        id v11 = [*(id *)(*(void *)(a1 + 40) + 144) serialQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __68__BRCAccountSession_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke_2;
        block[3] = &unk_1E6993698;
        id v16 = v3;
        dispatch_async(v11, block);

        goto LABEL_8;
      }
      uint64_t v12 = *(void **)(a1 + 32);
      id v4 = [v3 defaultClientZone];
      long long v13 = [v4 serverZone];
      [v12 addObject:v13];

LABEL_7:
    }
  }
LABEL_8:

  return 1;
}

void __68__BRCAccountSession_BRCZoneMigration__scheduleZoneMovesToCloudDocs___block_invoke_2(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) defaultClientZone];
  [v1 scheduleSyncDown];
}

- (id)resolvedOpenRelpathForPath:(id)a3 mustExist:(BOOL)a4 errcode:(int *)a5
{
  return [(BRCAccountSession *)self resolvedOpenRelpathForPath:a3 mustExist:a4 allowResolveInPkg:0 errcode:a5];
}

- (id)resolvedOpenRelpathForPath:(id)a3 mustExist:(BOOL)a4 allowResolveInPkg:(BOOL)a5 errcode:(int *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  int v15 = 0;
  id v10 = a3;
  id v11 = [[BRCRelativePath alloc] initWithAbsolutePath:v10 session:self];

  if ([(BRCRelativePath *)v11 resolveAndKeepOpenMustExist:v8 allowResolveInPkg:v7 error:&v15])
  {
    uint64_t v12 = [(BRCRelativePath *)v11 appLibrary];

    if (v12)
    {
      long long v13 = v11;
      goto LABEL_8;
    }
    [(BRCRelativePath *)v11 close];
  }
  else if (a6)
  {
    long long v13 = 0;
    *a6 = v15;
    goto LABEL_8;
  }
  long long v13 = 0;
LABEL_8:

  return v13;
}

- (void)_resolvePathInMobileDocsRoot:(id)a3 appLibrary:(id *)a4
{
  id v6 = a3;
  BOOL v7 = [v6 pathRelativeToRoot];
  if (!v7)
  {
    uint64_t v31 = brc_bread_crumbs();
    id v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(PathResolution) _resolvePathInMobileDocsRoot:appLibrary:]((uint64_t)v31, v32);
    }
  }
  BOOL v8 = [v7 pathComponents];
  uint64_t v9 = [v8 count];
  if (!v9)
  {
    [v6 setType:1];
    [v6 setItemScope:1];
    uint64_t v14 = 0;
    if (!a4) {
      goto LABEL_38;
    }
    goto LABEL_37;
  }
  unint64_t v10 = v9;
  id v11 = (void *)MEMORY[0x1E4F594E8];
  uint64_t v12 = [v8 objectAtIndexedSubscript:0];
  int v13 = [v11 validateMangledIDString:v12];

  uint64_t v14 = 0;
  int v15 = 0;
  if (v13)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F594E8]);
    id v17 = [v8 objectAtIndexedSubscript:0];
    int v15 = (void *)[v16 initWithMangledString:v17];

    uint64_t v14 = [(BRCAccountSession *)self appLibraryByMangledID:v15];
  }
  if (v10 < 2)
  {
    BOOL v19 = 0;
  }
  else
  {
    id v18 = [v8 objectAtIndexedSubscript:1];
    BOOL v19 = [v18 compare:*MEMORY[0x1E4F59400] options:2] == 0;
  }
  BOOL v20 = v10 != 2 && v19;
  int v21 = [v14 includesDataScope];
  int v22 = v21 ^ 1 | v20;
  if (v21) {
    unint64_t v23 = 3;
  }
  else {
    unint64_t v23 = 2;
  }
  if (v22 == 1 && v10 >= v23)
  {
    long long v24 = [v8 objectAtIndexedSubscript:v23 - 1];
    uint64_t v25 = [v24 compare:*MEMORY[0x1E4F59468] options:2];

    if (v10 == 2) {
      unsigned int v26 = 5;
    }
    else {
      unsigned int v26 = 6;
    }
    if (v10 == 1) {
      uint64_t v27 = 2;
    }
    else {
      uint64_t v27 = v26;
    }
    [v6 setType:v27];
    if (!v25)
    {
      unsigned __int8 v28 = 3;
      goto LABEL_36;
    }
  }
  else
  {
    if (v10 == 2) {
      unsigned int v29 = 5;
    }
    else {
      unsigned int v29 = 6;
    }
    if (v10 == 1) {
      uint64_t v30 = 2;
    }
    else {
      uint64_t v30 = v29;
    }
    [v6 setType:v30];
  }
  if (v22) {
    unsigned __int8 v28 = 2;
  }
  else {
    unsigned __int8 v28 = 1;
  }
LABEL_36:
  [v6 setItemScope:v28];

  if (a4) {
LABEL_37:
  }
    objc_storeStrong(a4, v14);
LABEL_38:
}

- (int)resolvePathAdditionalMetadata:(id)a3 appLibrary:(id *)a4
{
  id v6 = a3;
  id obj = 0;
  BOOL v7 = [v6 root];
  if ([(BRCAccountSession *)self hasRootForSyncedFolderType:1])
  {
    BOOL v8 = [(BRCAccountSession *)self rootForSyncedFolderType:1];

    if (v7 == v8)
    {
      [(BRCAccountSession *)self _resolvePathInMobileDocsRoot:v6 appLibrary:&obj];
      if (!a4) {
        goto LABEL_5;
      }
      goto LABEL_4;
    }
  }
  if (a4) {
LABEL_4:
  }
    objc_storeStrong(a4, obj);
LABEL_5:

  return 0;
}

- (id)_old_privateAppLibraryByZoneName:(id)a3 db:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __83__BRCAccountSession_DatabaseMigrationHelpers___old_privateAppLibraryByZoneName_db___block_invoke;
  v6[3] = &unk_1E6994120;
  v6[4] = self;
  id v4 = (void *)[a4 fetchObject:v6, @"SELECT rowid, app_library_name, app_library_plist, zone_rowid FROM app_libraries WHERE app_library_name = %@ AND (app_library_owner = %@ OR app_library_owner IS NULL)", a3, *MEMORY[0x1E4F19C08] sql];
  return v4;
}

id __83__BRCAccountSession_DatabaseMigrationHelpers___old_privateAppLibraryByZoneName_db___block_invoke(uint64_t a1, uint64_t a2)
{
  id v2 = (void *)[*(id *)(a1 + 32) newAppLibraryFromPQLResultSet:a2 version:2];
  return v2;
}

- (id)_clientZonesMatchingSearchString:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 lowercaseString];
  if ([v5 isEqualToString:v4])
  {
    char v6 = 0;
  }
  else
  {
    BOOL v7 = [v4 uppercaseString];
    char v6 = [v7 isEqualToString:v4] ^ 1;
  }
  uint64_t v8 = [v4 rangeOfString:@":"];
  if (v8 == 0x7FFFFFFFFFFFFFFFLL)
  {
    id v10 = v4;
    id v11 = (id)*MEMORY[0x1E4F19C08];
  }
  else
  {
    uint64_t v12 = v8;
    uint64_t v13 = v9;
    id v10 = [v4 substringToIndex:v8];
    id v11 = [v4 substringFromIndex:v12 + v13];
  }
  uint64_t v14 = v11;
  int v15 = [v10 stringByReplacingOccurrencesOfString:@"~" withString:@"."];

  if ([MEMORY[0x1E4F594E8] validateContainerID:v15])
  {
    id v16 = (id)[objc_alloc(MEMORY[0x1E4F594E8]) initWithZoneName:v15 ownerName:v14];
    uint64_t v17 = [(BRCAccountSession *)self clientZoneByMangledID:v16];
    if (v17)
    {
      id v18 = (id)v17;
      id v19 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v60[0] = MEMORY[0x1E4F143A8];
      v60[1] = 3221225472;
      v60[2] = __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke;
      v60[3] = &unk_1E6997F10;
      id v61 = v15;
      id v20 = v19;
      id v62 = v20;
      [(BRCAccountSession *)self enumerateSharedClientZones:v60];
      [v20 addObject:v18];
      int v21 = v62;
      id v22 = v20;

      id v23 = v61;
      long long v24 = v22;
      goto LABEL_22;
    }
  }
  id v48 = self;
  v58[0] = MEMORY[0x1E4F143A8];
  v58[1] = 3221225472;
  v58[2] = __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_2;
  v58[3] = &__block_descriptor_33_e28___NSString_16__0__NSString_8l;
  char v59 = v6;
  uint64_t v25 = (void (**)(void, void))MEMORY[0x1D94389C0](v58);
  id v26 = objc_alloc(MEMORY[0x1E4F28FD8]);
  uint64_t v27 = ((void (**)(void, void *))v25)[2](v25, v15);
  unsigned __int8 v28 = (void *)v27;
  if (v27) {
    unsigned int v29 = (__CFString *)v27;
  }
  else {
    unsigned int v29 = @"*";
  }
  uint64_t v30 = (void *)[v26 initWithPattern:v29 options:0 error:0];

  id v31 = objc_alloc(MEMORY[0x1E4F28FD8]);
  uint64_t v32 = [v14 lowercaseString];
  uint64_t v33 = (void *)v32;
  if (v32) {
    id v34 = (__CFString *)v32;
  }
  else {
    id v34 = @"*";
  }
  uint64_t v35 = (void *)[v31 initWithPattern:v34 options:0 error:0];

  uint64_t v36 = [MEMORY[0x1E4F1CA48] array];
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_3;
  v54[3] = &unk_1E6997F58;
  __int16 v37 = v14;
  id v38 = v25;
  id v57 = v38;
  id v39 = v30;
  id v55 = v39;
  id v40 = v36;
  id v56 = v40;
  __int16 v41 = (void *)MEMORY[0x1D94389C0](v54);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_4;
  v49[3] = &unk_1E6997F80;
  id v53 = v38;
  id v50 = v39;
  id v51 = v35;
  id v42 = v40;
  id v52 = v42;
  id v22 = v35;
  id v16 = v39;
  id v18 = v38;
  long long v43 = (void *)MEMORY[0x1D94389C0](v49);
  if (!v37) {
    [(BRCAccountSession *)v48 enumeratePrivateClientZones:v41];
  }
  -[BRCAccountSession enumerateSharedClientZones:](v48, "enumerateSharedClientZones:", v43, v37);
  [v42 sortUsingComparator:&__block_literal_global_32];
  long long v44 = brc_bread_crumbs();
  long long v45 = brc_default_log();
  if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v64 = v4;
    __int16 v65 = 2112;
    id v66 = v42;
    __int16 v67 = 2112;
    __int16 v68 = v44;
    _os_log_debug_impl(&dword_1D353B000, v45, OS_LOG_TYPE_DEBUG, "[DEBUG] containers matching '%@': %@%@", buf, 0x20u);
  }

  id v23 = v42;
  long long v24 = v23;
  uint64_t v14 = v47;
LABEL_22:

  return v24;
}

uint64_t __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 zoneName];
  int v5 = [v4 isEqualToString:*(void *)(a1 + 32)];

  if (v5) {
    [*(id *)(a1 + 40) addObject:v3];
  }

  return 1;
}

id __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 32))
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v3 lowercaseString];
  }
  char v6 = v5;

  return v6;
}

uint64_t __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_3(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v3 zoneName];
  char v6 = (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (objc_msgSend(*(id *)(a1 + 32), "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL)objc_msgSend(*(id *)(a1 + 40), "addObject:", v3); {
  return 1;
  }
}

uint64_t __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_4(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 56);
  id v5 = [v3 zoneName];
  char v6 = (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  BOOL v7 = [v3 ownerName];
  uint64_t v8 = [v7 lowercaseString];

  if (objc_msgSend(*(id *)(a1 + 32), "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL&& objc_msgSend(*(id *)(a1 + 40), "rangeOfFirstMatchInString:options:range:", v8, 0, 0, objc_msgSend(v8, "length")) != 0x7FFFFFFFFFFFFFFFLL)
  {
    [*(id *)(a1 + 48) addObject:v3];
  }

  return 1;
}

uint64_t __78__BRCAccountSession_BRCContainerFindByName___clientZonesMatchingSearchString___block_invoke_5(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 zoneName];
  char v6 = [v4 zoneName];

  uint64_t v7 = [v5 compare:v6 options:129];
  return v7;
}

- (id)clientZonesMatchingSearchString:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(BRCAccountSession *)self _clientZonesMatchingSearchString:v6];
  if ([v7 count])
  {
    id v8 = v7;
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorClientZoneNotFound:", v6);
    if (v9)
    {
      id v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v13 = "(passed to caller)";
        int v14 = 136315906;
        int v15 = "-[BRCAccountSession(BRCContainerFindByName) clientZonesMatchingSearchString:error:]";
        __int16 v16 = 2080;
        if (!a4) {
          uint64_t v13 = "(ignored by caller)";
        }
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        id v19 = v9;
        __int16 v20 = 2112;
        int v21 = v10;
        _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v14, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v9;
    }

    id v8 = 0;
  }

  return v8;
}

- (id)singleClientZoneMatchingSearchString:(id)a3 error:(id *)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(BRCAccountSession *)self _clientZonesMatchingSearchString:v6];
  if (![v7 count])
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", v6);
    if (v8)
    {
      id v23 = brc_bread_crumbs();
      long long v24 = brc_default_log();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        uint64_t v27 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v35 = "-[BRCAccountSession(BRCContainerFindByName) singleClientZoneMatchingSearchString:error:]";
        __int16 v36 = 2080;
        if (!a4) {
          uint64_t v27 = "(ignored by caller)";
        }
        __int16 v37 = v27;
        __int16 v38 = 2112;
        id v39 = v8;
        __int16 v40 = 2112;
        __int16 v41 = v23;
        _os_log_error_impl(&dword_1D353B000, v24, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v8;
    }
    goto LABEL_24;
  }
  if ((unint64_t)[v7 count] >= 2)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v30;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v30 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          if ([v14 isPrivateZone])
          {
            int v15 = [v14 zoneName];
            [v8 addObject:v15];
          }
          else
          {
            int v15 = [v14 mangledID];
            __int16 v16 = [v15 mangledIDString];
            [v8 addObject:v16];
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v29 objects:v33 count:16];
      }
      while (v11);
    }

    uint64_t v17 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v18 = *MEMORY[0x1E4F592A8];
    id v19 = [v8 componentsJoinedByString:@", "];
    __int16 v20 = objc_msgSend(v17, "br_errorWithDomain:code:description:", v18, 12, @"Too many containers matching '%@': {%@}", v6, v19, (void)v29);

    if (v20)
    {
      int v21 = brc_bread_crumbs();
      uint64_t v22 = brc_default_log();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        unsigned __int8 v28 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        uint64_t v35 = "-[BRCAccountSession(BRCContainerFindByName) singleClientZoneMatchingSearchString:error:]";
        __int16 v36 = 2080;
        if (!a4) {
          unsigned __int8 v28 = "(ignored by caller)";
        }
        __int16 v37 = v28;
        __int16 v38 = 2112;
        id v39 = v20;
        __int16 v40 = 2112;
        __int16 v41 = v21;
        _os_log_error_impl(&dword_1D353B000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v20;
    }

LABEL_24:
    uint64_t v25 = 0;
    goto LABEL_26;
  }
  uint64_t v25 = [v7 firstObject];
LABEL_26:

  return v25;
}

- (id)_appLibrariesMatchingSearchString:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 lowercaseString];
  if ([v5 isEqualToString:v4])
  {
    char v6 = 0;
  }
  else
  {
    uint64_t v7 = [v4 uppercaseString];
    char v6 = [v7 isEqualToString:v4] ^ 1;
  }
  id v8 = [v4 stringByReplacingOccurrencesOfString:@"~" withString:@"."];
  if (v8
    && ([(BRCAccountSession *)self appLibraryByID:v8],
        (uint64_t v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v10 = (void (**)(void, void))v9;
    v40[0] = v9;
    id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:1];
  }
  else
  {
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __79__BRCAccountSession_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke;
    v32[3] = &__block_descriptor_33_e28___NSString_16__0__NSString_8l;
    char v33 = v6;
    uint64_t v12 = (void (**)(void, void))MEMORY[0x1D94389C0](v32);
    id v13 = objc_alloc(MEMORY[0x1E4F28FD8]);
    uint64_t v14 = ((void (**)(void, void *))v12)[2](v12, v8);
    int v15 = (void *)v14;
    if (v14) {
      __int16 v16 = (__CFString *)v14;
    }
    else {
      __int16 v16 = @"*";
    }
    uint64_t v17 = (void *)[v13 initWithPattern:v16 options:0 error:0];

    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = __79__BRCAccountSession_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke_2;
    unsigned __int8 v28 = &unk_1E6997FC8;
    id v31 = v12;
    id v29 = v17;
    id v19 = v18;
    id v30 = v19;
    id v20 = v17;
    uint64_t v10 = v12;
    int v21 = (void *)MEMORY[0x1D94389C0](&v25);
    -[BRCAccountSession enumerateAppLibraries:](self, "enumerateAppLibraries:", v21, v25, v26, v27, v28);
    [v19 sortUsingComparator:&__block_literal_global_28];
    uint64_t v22 = brc_bread_crumbs();
    id v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v35 = v4;
      __int16 v36 = 2112;
      id v37 = v19;
      __int16 v38 = 2112;
      id v39 = v22;
      _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] containers matching '%@': %@%@", buf, 0x20u);
    }

    id v11 = v19;
  }

  return v11;
}

id __79__BRCAccountSession_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = v3;
  if (*(unsigned char *)(a1 + 32))
  {
    id v5 = v3;
  }
  else
  {
    id v5 = [v3 lowercaseString];
  }
  char v6 = v5;

  return v6;
}

uint64_t __79__BRCAccountSession_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 48);
  id v5 = [v3 appLibraryID];
  char v6 = (*(void (**)(uint64_t, void *))(v4 + 16))(v4, v5);

  if (objc_msgSend(*(id *)(a1 + 32), "rangeOfFirstMatchInString:options:range:", v6, 0, 0, objc_msgSend(v6, "length")) != 0x7FFFFFFFFFFFFFFFLL)objc_msgSend(*(id *)(a1 + 40), "addObject:", v3); {
  return 1;
  }
}

uint64_t __79__BRCAccountSession_BRCContainerFindByName___appLibrariesMatchingSearchString___block_invoke_3(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = [a2 appLibraryID];
  char v6 = [v4 appLibraryID];

  uint64_t v7 = [v5 compare:v6 options:129];
  return v7;
}

- (id)appLibrariesMatchingSearchString:(id)a3 error:(id *)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(BRCAccountSession *)self _appLibrariesMatchingSearchString:v6];
  if ([v7 count])
  {
    id v8 = v7;
  }
  else
  {
    uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorClientZoneNotFound:", v6);
    if (v9)
    {
      uint64_t v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        id v13 = "(passed to caller)";
        int v14 = 136315906;
        int v15 = "-[BRCAccountSession(BRCContainerFindByName) appLibrariesMatchingSearchString:error:]";
        __int16 v16 = 2080;
        if (!a4) {
          id v13 = "(ignored by caller)";
        }
        uint64_t v17 = v13;
        __int16 v18 = 2112;
        id v19 = v9;
        __int16 v20 = 2112;
        int v21 = v10;
        _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", (uint8_t *)&v14, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v9;
    }

    id v8 = 0;
  }

  return v8;
}

- (id)singleAppLibraryMatchingSearchString:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [(BRCAccountSession *)self _appLibrariesMatchingSearchString:v6];
  if (![v7 count])
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAppLibraryNotFound:", v6);
    if (v8)
    {
      int v21 = brc_bread_crumbs();
      uint64_t v22 = brc_default_log();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        uint64_t v25 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        char v33 = "-[BRCAccountSession(BRCContainerFindByName) singleAppLibraryMatchingSearchString:error:]";
        __int16 v34 = 2080;
        if (!a4) {
          uint64_t v25 = "(ignored by caller)";
        }
        id v35 = v25;
        __int16 v36 = 2112;
        id v37 = v8;
        __int16 v38 = 2112;
        id v39 = v21;
        _os_log_error_impl(&dword_1D353B000, v22, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v8;
    }
    goto LABEL_21;
  }
  if ((unint64_t)[v7 count] >= 2)
  {
    id v8 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v7, "count"));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v28 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = [*(id *)(*((void *)&v27 + 1) + 8 * i) appLibraryID];
          [v8 addObject:v14];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v11);
    }

    int v15 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v16 = *MEMORY[0x1E4F592A8];
    uint64_t v17 = [v8 componentsJoinedByString:@", "];
    __int16 v18 = objc_msgSend(v15, "br_errorWithDomain:code:description:", v16, 12, @"Too many containers matching '%@': {%@}", v6, v17, (void)v27);

    if (v18)
    {
      id v19 = brc_bread_crumbs();
      __int16 v20 = brc_default_log();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
      {
        uint64_t v26 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        char v33 = "-[BRCAccountSession(BRCContainerFindByName) singleAppLibraryMatchingSearchString:error:]";
        __int16 v34 = 2080;
        if (!a4) {
          uint64_t v26 = "(ignored by caller)";
        }
        id v35 = v26;
        __int16 v36 = 2112;
        id v37 = v18;
        __int16 v38 = 2112;
        id v39 = v19;
        _os_log_error_impl(&dword_1D353B000, v20, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v18;
    }

LABEL_21:
    id v23 = 0;
    goto LABEL_23;
  }
  id v23 = [v7 firstObject];
LABEL_23:

  return v23;
}

- (BOOL)shouldPerformPCSMigration
{
  if ([(BRCAccountSession *)self PCSMigrationComplete]) {
    return 0;
  }
  id v3 = +[BRCUserDefaults defaultsForMangledID:0];
  char v4 = [v3 shouldPreparePCSMigration];

  return v4;
}

- (BOOL)PCSMigrationComplete
{
  id v2 = [(BRCAccountSession *)self clientState];
  id v3 = [v2 objectForKeyedSubscript:@"hasCompletedPCSMigration"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (void)setNeedsPCSMigration:(BOOL)a3
{
  BOOL v3 = a3;
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v5 = [NSNumber numberWithInt:!v3];
  id v6 = [(BRCAccountSession *)self clientState];
  [v6 setObject:v5 forKeyedSubscript:@"hasCompletedPCSMigration"];

  clientDB = self->_clientDB;
  [(BRCPQLConnection *)clientDB forceBatchStart];
}

- (BRCAccountSession)init
{
  v28.receiver = self;
  v28.super_class = (Class)BRCAccountSession;
  id v2 = [(BRCAccountSession *)&v28 init];
  BOOL v3 = v2;
  if (v2)
  {
    brc_mutex_init_recursive(&v2->_zonesLock.pthread);
    brc_mutex_init(&v3->_zonesCreationLock.pthread);
    v3->_int cloudDocsFD = -1;
    char v4 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v5 = objc_msgSend(v4, "br_currentPersonaID");

    BRPersonaSpecificName();
    id v6 = objc_claimAutoreleasedReturnValue();
    uint64_t v7 = (const char *)[v6 UTF8String];
    id v8 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_USER_INTERACTIVE, 0);
    id v9 = dispatch_queue_attr_make_with_autorelease_frequency(v8, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    dispatch_queue_t v10 = dispatch_queue_create(v7, v9);

    dbWatcherQueue = v3->_dbWatcherQueue;
    v3->_dbWatcherQueue = (OS_dispatch_queue *)v10;

    BRPersonaSpecificName();
    id v12 = objc_claimAutoreleasedReturnValue();
    dispatch_workloop_t v13 = dispatch_workloop_create((const char *)[v12 UTF8String]);
    clientTruthWorkloop = v3->_clientTruthWorkloop;
    v3->_clientTruthWorkloop = (OS_dispatch_workloop *)v13;

    BRPersonaSpecificName();
    id v15 = objc_claimAutoreleasedReturnValue();
    dispatch_workloop_t v16 = dispatch_workloop_create((const char *)[v15 UTF8String]);
    serverTruthWorkloop = v3->_serverTruthWorkloop;
    v3->_serverTruthWorkloop = (OS_dispatch_workloop *)v16;

    BRPersonaSpecificName();
    id v18 = objc_claimAutoreleasedReturnValue();
    dispatch_workloop_t v19 = dispatch_workloop_create((const char *)[v18 UTF8String]);
    readOnlyWorkloop = v3->_readOnlyWorkloop;
    v3->_readOnlyWorkloop = (OS_dispatch_workloop *)v19;

    uint64_t v21 = [MEMORY[0x1E4F28D30] weakObjectsHashTable];
    miscOperations = v3->_miscOperations;
    v3->_miscOperations = (NSHashTable *)v21;

    uint64_t v23 = objc_msgSend(NSString, "br_currentPersonaIDWithIsDataSeparated:", &v3->_isDataSeparated);
    personaIdentifier = v3->_personaIdentifier;
    v3->_personaIdentifier = (NSString *)v23;

    uint64_t v25 = objc_alloc_init(BRCBarrier);
    dbLoadingBarrier = v3->_dbLoadingBarrier;
    v3->_dbLoadingBarrier = v25;

    v3->_isOpeuint64_t n = 0;
  }
  return v3;
}

- (BRCAccountSession)initWithACAccountID:(id)a3 dbAccountDSID:(id)a4 salt:(id)a5 accountHandler:(id)a6
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = [(BRCAccountSession *)self init];
  dispatch_workloop_t v16 = v15;
  if (v15)
  {
    objc_storeStrong((id *)&v15->_acAccountID, a3);
    objc_storeStrong((id *)&v16->_accountDSID, a4);
    objc_storeStrong((id *)&v16->_ubiquityTokenSalt, a5);
    objc_storeStrong((id *)&v16->_accountHandler, a6);
    uint64_t v17 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    xpcClients = v16->_xpcClients;
    v16->_xpcClients = v17;

    dispatch_workloop_t v19 = objc_msgSend(NSString, "br_currentSupportDir");
    uint64_t v20 = *MEMORY[0x1E4F593A0];
    uint64_t v21 = [v19 stringByAppendingPathComponent:*MEMORY[0x1E4F593A0]];
    [(BRCAccountSession *)v16 setSessionDirPath:v21];

    uint64_t v22 = objc_msgSend(NSString, "brc_currentCachesDir");
    uint64_t v23 = [v22 stringByAppendingPathComponent:v20];
    [(BRCAccountSession *)v16 setCacheDirPath:v23];

    long long v24 = [[BRCFileUnlinker alloc] initWithCacheDirPath:v22];
    fileUnlinker = v16->_fileUnlinker;
    v16->_fileUnlinker = v24;

    uint64_t v26 = [(NSString *)v16->_sessionDirPath stringByAppendingPathComponent:@"db"];
    uint64_t v27 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v26 isDirectory:1];
    dbURL = v16->_dbURL;
    v16->_dbURL = (NSURL *)v27;
  }
  return v16;
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: session wasn't properly closed%@", v2, v3, v4, v5, v6);
}

- (NSString)description
{
  return (NSString *)[NSString stringWithFormat:@"session{account:%@}", self->_accountDSID];
}

- (BRCTapToRadarManager)tapToRadarManager
{
  return self->_tapToRadarManager;
}

- (BRCSyncUpStagingProtocol)syncUpStager
{
  return (BRCSyncUpStagingProtocol *)self->_stageRegistry;
}

- (BRCDownloadStagingProtocol)downloadStager
{
  return (BRCDownloadStagingProtocol *)self->_stageRegistry;
}

- (BOOL)registerClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if ([(NSMutableSet *)v5->_xpcClients containsObject:v4])
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession registerClient:]();
    }
  }
  BOOL isCancelled = v5->_isCancelled;
  if (!v5->_isCancelled) {
    [(NSMutableSet *)v5->_xpcClients addObject:v4];
  }
  objc_sync_exit(v5);

  return !isCancelled;
}

- (void)unregisterClient:(id)a3
{
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  if (([(NSMutableSet *)v5->_xpcClients containsObject:v4] & 1) == 0)
  {
    uint8_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession unregisterClient:]();
    }
  }
  [(NSMutableSet *)v5->_xpcClients removeObject:v4];
  objc_sync_exit(v5);
}

- (void)addMiscOperation:(id)a3
{
}

- (id)getMiscOperations
{
  uint64_t v2 = (void *)[(NSHashTable *)self->_miscOperations copy];
  return v2;
}

- (void)closeXPCClientsSync
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx closing XPC connections%@");
}

- (BOOL)icloudAccountIsInCarry
{
  isInCarry = self->_isInCarry;
  if (isInCarry)
  {
    return [(NSNumber *)isInCarry BOOLValue];
  }
  else
  {
    uint64_t v5 = +[BRCAccountHandler currentiCloudAccount];
    if (objc_msgSend(v5, "br_isEnabledForCloudDocs"))
    {
      uint8_t v6 = [(BRCAccountSession *)self accountDSID];
      uint64_t v7 = objc_msgSend(v5, "br_dsid");
      int v8 = [v6 isEqualToString:v7];

      if (v8)
      {
        id v9 = [v5 propertiesForDataclass:*MEMORY[0x1E4F17B38]];
        dispatch_queue_t v10 = [v9 objectForKeyedSubscript:@"url"];
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = [MEMORY[0x1E4F1CB10] URLWithString:v10];
          id v12 = [v11 host];
          id v13 = [v12 componentsSeparatedByString:@"-"];
          id v14 = [v13 firstObject];

          id v15 = +[BRCUserDefaults defaultsForMangledID:0];
          dispatch_workloop_t v16 = [v15 carryPartitions];

          if (v14 && ([v16 containsObject:v14] & 1) != 0) {
            uint64_t v17 = (NSNumber *)MEMORY[0x1E4F1CC38];
          }
          else {
            uint64_t v17 = (NSNumber *)MEMORY[0x1E4F1CC28];
          }
          id v18 = self->_isInCarry;
          self->_isInCarry = v17;
        }
      }
    }
    BOOL v19 = [(NSNumber *)self->_isInCarry BOOLValue];

    return v19;
  }
}

- (void)_setupSharedPackageExtensionsPlist
{
}

- (void)_closeSharedPackageExtensionsPlist
{
}

- (void)_createAccountSupportPathIfNeeded:(id)a3 protectParent:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v66 = a3;
  memset(v72, 0, sizeof(v72));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _createAccountSupportPathIfNeeded:protectParent:]", 493, v72);
  uint64_t v5 = brc_bread_crumbs();
  uint8_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)v78 = v72[0];
    *(_WORD *)&v78[8] = 2112;
    id v79 = v66;
    *(_WORD *)v80 = 2112;
    *(void *)&v80[2] = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx creating '%@'%@", buf, 0x20u);
  }

  uint64_t v7 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v71 = 0;
  char v8 = [v7 createDirectoryAtPath:v66 withIntermediateDirectories:1 attributes:0 error:&v71];
  id v9 = v71;
  dispatch_queue_t v10 = v9;
  if ((v8 & 1) == 0)
  {
    if ((objc_msgSend(v9, "br_isCocoaErrorCode:", 516) & 1) == 0)
    {
      char v59 = brc_bread_crumbs();
      long long v60 = brc_default_log();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v78 = v66;
        *(_WORD *)&v78[8] = 2112;
        id v79 = v10;
        *(_WORD *)v80 = 2112;
        *(void *)&v80[2] = v59;
        _os_log_fault_impl(&dword_1D353B000, v60, OS_LOG_TYPE_FAULT, "[CRIT] can't create directory at '%@': %@%@", buf, 0x20u);
      }

LABEL_69:
      exit(1);
    }
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSession _createAccountSupportPathIfNeeded:protectParent:]((uint64_t)v66);
    }
  }
  id v70 = v10;
  id v13 = [v7 attributesOfItemAtPath:v66 error:&v70];
  id v14 = v70;

  BOOL v15 = v14 == 0;
  if (v14)
  {
    dispatch_workloop_t v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      uint64_t v45 = [v66 fileSystemRepresentation];
      *(_DWORD *)buf = 136315650;
      *(void *)v78 = v45;
      *(_WORD *)&v78[8] = 2112;
      id v79 = v14;
      *(_WORD *)v80 = 2112;
      *(void *)&v80[2] = v16;
      _os_log_fault_impl(&dword_1D353B000, v17, OS_LOG_TYPE_FAULT, "[CRIT] can't retrieve attributes of item at '%s': %@%@", buf, 0x20u);
    }
  }
  id v18 = [v13 fileOwnerAccountName];
  BOOL v19 = NSUserName();
  char v20 = [v18 isEqual:v19];

  if ((v20 & 1) == 0)
  {
    uint64_t v21 = brc_bread_crumbs();
    uint64_t v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT))
    {
      id v46 = [v13 fileOwnerAccountName];
      uint64_t v47 = NSUserName();
      *(_DWORD *)buf = 138412802;
      *(void *)v78 = v46;
      *(_WORD *)&v78[8] = 2112;
      id v79 = v47;
      *(_WORD *)v80 = 2112;
      *(void *)&v80[2] = v21;
      _os_log_fault_impl(&dword_1D353B000, v22, OS_LOG_TYPE_FAULT, "[CRIT] created directory has a wrong owner (value: %@, expected: %@)%@", buf, 0x20u);
    }
    BOOL v15 = 0;
  }
  if (([v13 filePosixPermissions] & 0x180) == 0)
  {
    uint64_t v23 = brc_bread_crumbs();
    long long v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT))
    {
      int v65 = aPcDBLSW[(unsigned __int16)[v13 filePosixPermissions] >> 12];
      if (([v13 filePosixPermissions] & 0x100) != 0) {
        int v48 = 114;
      }
      else {
        int v48 = 45;
      }
      int v64 = v48;
      if (([v13 filePosixPermissions] & 0x80) != 0) {
        int v49 = 119;
      }
      else {
        int v49 = 45;
      }
      int v63 = v49;
      if (([v13 filePosixPermissions] & 0x40) != 0) {
        int v50 = 120;
      }
      else {
        int v50 = 45;
      }
      int v62 = v50;
      if (([v13 filePosixPermissions] & 0x20) != 0) {
        int v51 = 114;
      }
      else {
        int v51 = 45;
      }
      int v61 = v51;
      if (([v13 filePosixPermissions] & 0x10) != 0) {
        int v52 = 119;
      }
      else {
        int v52 = 45;
      }
      if (([v13 filePosixPermissions] & 8) != 0) {
        int v53 = 120;
      }
      else {
        int v53 = 45;
      }
      if (([v13 filePosixPermissions] & 4) != 0) {
        int v54 = 114;
      }
      else {
        int v54 = 45;
      }
      char v55 = [v13 filePosixPermissions];
      char v56 = [v13 filePosixPermissions];
      *(_DWORD *)buf = 67111682;
      *(_DWORD *)v78 = v65;
      if ((v55 & 2) != 0) {
        int v57 = 119;
      }
      else {
        int v57 = 45;
      }
      *(_WORD *)&v78[4] = 1024;
      *(_DWORD *)&v78[6] = v64;
      if (v56) {
        int v58 = 120;
      }
      else {
        int v58 = 45;
      }
      LOWORD(v79) = 1024;
      *(_DWORD *)((char *)&v79 + 2) = v63;
      HIWORD(v79) = 1024;
      *(_DWORD *)v80 = v62;
      *(_WORD *)&v80[4] = 1024;
      *(_DWORD *)&v80[6] = v61;
      __int16 v81 = 1024;
      int v82 = v52;
      __int16 v83 = 1024;
      int v84 = v53;
      __int16 v85 = 1024;
      int v86 = v54;
      __int16 v87 = 1024;
      int v88 = v57;
      __int16 v89 = 1024;
      int v90 = v58;
      __int16 v91 = 2112;
      id v92 = v23;
      _os_log_fault_impl(&dword_1D353B000, v24, OS_LOG_TYPE_FAULT, "[CRIT] created directory doesn't have read/write access for owner (permission: %c%c%c%c%c%c%c%c%c%c)%@", buf, 0x48u);
    }

    BOOL v15 = 0;
  }
  uint64_t v25 = *MEMORY[0x1E4F28370];
  uint64_t v26 = [v13 objectForKeyedSubscript:*MEMORY[0x1E4F28370]];
  uint64_t v27 = *MEMORY[0x1E4F28358];
  char v28 = [v26 isEqualToString:*MEMORY[0x1E4F28358]];

  if (v28)
  {
    id v29 = v14;
  }
  else
  {
    uint64_t v75 = v25;
    uint64_t v76 = v27;
    long long v30 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v76 forKeys:&v75 count:1];
    id v69 = v14;
    char v31 = [v7 setAttributes:v30 ofItemAtPath:v66 error:&v69];
    id v29 = v69;

    if ((v31 & 1) == 0)
    {
      long long v32 = brc_bread_crumbs();
      char v33 = brc_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)v78 = v66;
        *(_WORD *)&v78[8] = 2112;
        id v79 = v29;
        *(_WORD *)v80 = 2112;
        *(void *)&v80[2] = v32;
        _os_log_fault_impl(&dword_1D353B000, v33, OS_LOG_TYPE_FAULT, "[CRIT] can't protect directory at '%@': %@%@", buf, 0x20u);
      }
    }
  }
  if (v4)
  {
    __int16 v34 = [v66 stringByDeletingLastPathComponent];
    id v68 = v29;
    id v35 = [v7 attributesOfItemAtPath:v34 error:&v68];
    id v36 = v68;

    id v37 = [v35 objectForKeyedSubscript:v25];
    char v38 = [v37 isEqualToString:v27];

    if (v38)
    {
      id v29 = v36;
    }
    else
    {
      uint64_t v73 = v25;
      uint64_t v74 = v27;
      id v39 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v74 forKeys:&v73 count:1];
      id v67 = v36;
      char v40 = [v7 setAttributes:v39 ofItemAtPath:v34 error:&v67];
      id v29 = v67;

      if ((v40 & 1) == 0)
      {
        __int16 v41 = brc_bread_crumbs();
        uint64_t v42 = brc_default_log();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          *(void *)v78 = v34;
          *(_WORD *)&v78[8] = 2112;
          id v79 = v29;
          *(_WORD *)v80 = 2112;
          *(void *)&v80[2] = v41;
          _os_log_fault_impl(&dword_1D353B000, v42, OS_LOG_TYPE_FAULT, "[CRIT] can't protect directory at '%@': %@%@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    id v35 = v13;
  }

  if (!v15) {
    goto LABEL_69;
  }
  long long v43 = brc_bread_crumbs();
  long long v44 = brc_default_log();
  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSession _createAccountSupportPathIfNeeded:protectParent:]();
  }

  __brc_leave_section(v72);
}

- (void)markAccountMigrationComplete
{
}

- (void)_setupThrottles
{
  uint64_t v3 = +[BRCUserDefaults defaultsForMangledID:0];
  BOOL v4 = [v3 appLibraryScanThrottleParams];
  uint64_t v5 = [[BRCThrottle alloc] initWithName:@"fsreader.container.throttle" andParameters:v4];
  appLibraryScanThrottle = self->_appLibraryScanThrottle;
  self->_appLibraryScanThrottle = v5;

  uint64_t v7 = [v3 appLibraryResetThrottleParams];

  char v8 = [[BRCThrottle alloc] initWithName:@"container.reset.throttle" andParameters:v7];
  appLibraryResetThrottle = self->_appLibraryResetThrottle;
  self->_appLibraryResetThrottle = v8;

  dispatch_queue_t v10 = [v3 sharedAppLibraryResetThrottleParams];

  id v11 = [[BRCThrottle alloc] initWithName:@"shared-container.reset.throttle" andParameters:v10];
  sharedAppLibraryResetThrottle = self->_sharedAppLibraryResetThrottle;
  self->_sharedAppLibraryResetThrottle = v11;

  id v13 = [v3 appLibraryAliasRemovalThrottleParams];

  id v14 = [[BRCThrottle alloc] initWithName:@"container.reset.alias-removal.throttle" andParameters:v13];
  appLibraryAliasRemovalThrottle = self->_appLibraryAliasRemovalThrottle;
  self->_appLibraryAliasRemovalThrottle = v14;

  dispatch_workloop_t v16 = [v3 lostItemThrottleParams];

  uint64_t v17 = [[BRCThrottle alloc] initWithName:@"fsreader.lost.throttle" andParameters:v16];
  lostItemThrottle = self->_lostItemThrottle;
  self->_lostItemThrottle = v17;

  BOOL v19 = [v3 operationFailureThrottleParams];

  char v20 = [[BRCThrottle alloc] initWithName:@"operation.failure.throttle" andParameters:v19];
  operationFailureThrottle = self->_operationFailureThrottle;
  self->_operationFailureThrottle = v20;

  uint64_t v22 = [v3 syncClientZoneThrottleParams];

  uint64_t v23 = [[BRCThrottle alloc] initWithName:@"sync.container.throttle" andParameters:v22];
  syncClientZoneThrottle = self->_syncClientZoneThrottle;
  self->_syncClientZoneThrottle = v23;

  id v27 = [v3 syncClientZoneErrorThrottleParams];

  uint64_t v25 = [[BRCThrottle alloc] initWithName:@"sync.container.error.throttle" andParameters:v27];
  syncClientZoneErrorThrottle = self->_syncClientZoneErrorThrottle;
  self->_syncClientZoneErrorThrottle = v25;
}

- (void)resetThrottles
{
  [(BRCThrottle *)self->_appLibraryScanThrottle reset];
  [(BRCThrottle *)self->_appLibraryResetThrottle reset];
  [(BRCThrottle *)self->_appLibraryAliasRemovalThrottle reset];
  [(BRCThrottle *)self->_sharedAppLibraryResetThrottle reset];
  [(BRCThrottle *)self->_lostItemThrottle reset];
  [(BRCThrottle *)self->_operationFailureThrottle reset];
  [(BRCThrottle *)self->_syncClientZoneThrottle reset];
  syncClientZoneErrorThrottle = self->_syncClientZoneErrorThrottle;
  [(BRCThrottle *)syncClientZoneErrorThrottle reset];
}

- (void)_refreshRootsCache
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] New mobile documents dir = %@%@", (void)v3, DWORD2(v3));
}

- (void)_submitDelayedTelemetryEventIfNeeded:(id)a3 wait:(double)a4 withBlock:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  dispatch_queue_t v10 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v8];
  if (v10)
  {
    id v11 = (void *)MEMORY[0x1E4F28DC0];
    id v12 = (void *)MEMORY[0x1E4F1CAD0];
    uint64_t v13 = objc_opt_class();
    uint64_t v14 = objc_opt_class();
    uint64_t v15 = objc_opt_class();
    dispatch_workloop_t v16 = objc_msgSend(v12, "setWithObjects:", v13, v14, v15, objc_opt_class(), 0);
    id v30 = 0;
    uint64_t v17 = [v11 unarchivedObjectOfClasses:v16 fromData:v10 error:&v30];
    id v18 = v30;

    if (v18)
    {
      BOOL v19 = brc_bread_crumbs();
      char v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)id location = 138412802;
        *(void *)&location[4] = v8;
        __int16 v32 = 2112;
        id v33 = v18;
        __int16 v34 = 2112;
        id v35 = v19;
        _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] Error Unarchiving %@ - %@%@", location, 0x20u);
      }
    }
    else
    {
      objc_initWeak((id *)location, self);
      v25[0] = MEMORY[0x1E4F143A8];
      v25[1] = 3221225472;
      v25[2] = __73__BRCAccountSession__submitDelayedTelemetryEventIfNeeded_wait_withBlock___block_invoke;
      uint64_t v25[3] = &unk_1E6998F08;
      objc_copyWeak(&v29, (id *)location);
      id v28 = v9;
      id v26 = v17;
      id v27 = v8;
      uint64_t v21 = MEMORY[0x1D94389C0](v25);
      uint64_t v22 = (void *)v21;
      if (a4 <= 0.0)
      {
        (*(void (**)(uint64_t))(v21 + 16))(v21);
      }
      else
      {
        dispatch_time_t v23 = dispatch_time(0, (uint64_t)(a4 * 1000000000.0));
        long long v24 = dispatch_get_global_queue(0, 0);
        dispatch_after(v23, v24, v22);
      }
      objc_destroyWeak(&v29);
      objc_destroyWeak((id *)location);
    }
  }
}

void __73__BRCAccountSession__submitDelayedTelemetryEventIfNeeded_wait_withBlock___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 56));
  long long v3 = WeakRetained;
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    objc_sync_enter(v4);
    if (*((unsigned char *)v4 + 560) && !*((unsigned char *)v4 + 561))
    {
      objc_sync_exit(v4);

      if (!*((void *)v4 + 97))
      {
        id v12 = brc_bread_crumbs();
        uint64_t v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          __73__BRCAccountSession__submitDelayedTelemetryEventIfNeeded_wait_withBlock___block_invoke_cold_2();
        }
      }
      (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
      uint64_t v5 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v7 = *(void *)(a1 + 40);
      uint8_t v6 = (uint64_t *)(a1 + 40);
      id v14 = 0;
      char v8 = [v5 removeItemAtPath:v7 error:&v14];
      id v4 = v14;

      if (v8)
      {
        id v9 = brc_bread_crumbs();
        dispatch_queue_t v10 = brc_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          __73__BRCAccountSession__submitDelayedTelemetryEventIfNeeded_wait_withBlock___block_invoke_cold_1();
        }
      }
      else
      {
        id v9 = brc_bread_crumbs();
        dispatch_queue_t v10 = brc_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v11 = *v6;
          *(_DWORD *)buf = 138412802;
          uint64_t v16 = v11;
          __int16 v17 = 2112;
          id v18 = v4;
          __int16 v19 = 2112;
          char v20 = v9;
          _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Error while deleting %@ - %@%@", buf, 0x20u);
        }
      }
    }
    else
    {
      objc_sync_exit(v4);
    }
  }
}

- (void)_submitSessionOpenFailedTelemetryEventIfNeeded
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Checking if there is a need to submit ACCOUNT_SESSION_OPEN_ERROR telemetry%@", v2, v3, v4, v5, v6);
}

void __67__BRCAccountSession__submitSessionOpenFailedTelemetryEventIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  uint64_t v5 = a2;
  if ([v4 count] != 1)
  {
    id v9 = brc_bread_crumbs();
    dispatch_queue_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      __67__BRCAccountSession__submitSessionOpenFailedTelemetryEventIfNeeded__block_invoke_cold_1();
    }
  }
  uint8_t v6 = [v4 objectForKey:@"Error"];
  id v7 = +[AppTelemetryTimeSeriesEvent newNSErrorEvent:33 eventGroupUUID:v5[62] value:v6];
  char v8 = [v5 analyticsReporter];

  [v8 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v7];
}

- (void)_submitDBCorruptionTelemetryEventIfNeeded
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Checking if there is a need to submit DB_RESET telemetry%@", v2, v3, v4, v5, v6);
}

void __62__BRCAccountSession__submitDBCorruptionTelemetryEventIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  if ([v4 count] != 2)
  {
    dispatch_queue_t v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __62__BRCAccountSession__submitDBCorruptionTelemetryEventIfNeeded__block_invoke_cold_1();
    }
  }
  uint8_t v6 = [v4 objectForKey:@"Description"];
  id v7 = [v4 objectForKey:@"Error"];

  id v8 = +[AppTelemetryTimeSeriesEvent newDBResetEventWithError:v7 description:v6];
  id v9 = [v5 analyticsReporter];

  [v9 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v8];
}

- (void)_submitReimportDomainFailedTelemetryEventIfNeeded
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Checking if there is a need to submit reimport failed telemetry%@", v2, v3, v4, v5, v6);
}

void __70__BRCAccountSession__submitReimportDomainFailedTelemetryEventIfNeeded__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  id v5 = a2;
  if ([v4 count] != 2)
  {
    uint64_t v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      __62__BRCAccountSession__submitDBCorruptionTelemetryEventIfNeeded__block_invoke_cold_1();
    }
  }
  uint8_t v6 = [v4 objectForKey:@"Description"];
  id v7 = [v4 objectForKey:@"Error"];

  id v8 = +[AppTelemetryTimeSeriesEvent newReimportDomainFailureEventWithError:v7 description:v6];
  id v9 = [v5 analyticsReporter];
  [v9 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v8];

  dispatch_queue_t v10 = [v5 tapToRadarManager];

  [v10 requestTapToRadarWithTitle:@"Reimport domain on startup failed", @"Reimport domain on startup failed, need to verify that things got recovered correctly", MEMORY[0x1E4F1CBF0], MEMORY[0x1E4F1CBF0], 1, @"it reset the database", v7 description keywords attachments sendFullLog displayReason triggerRootCause];
}

- (BOOL)openWithError:(id *)a3 pushWorkloop:(id)a4
{
  uint64_t v130 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_isOpen)
  {
    uint64_t v102 = brc_bread_crumbs();
    uint64_t v103 = brc_default_log();
    if (os_log_type_enabled(v103, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession openWithError:pushWorkloop:].cold.5();
    }
  }
  memset(v123, 0, sizeof(v123));
  __brc_create_section(1, (uint64_t)"-[BRCAccountSession openWithError:pushWorkloop:]", 1059, v123);
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v125 = v123[0];
    __int16 v126 = 2112;
    uint64_t v127 = self;
    __int16 v128 = 2112;
    v129 = v7;
    _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ - Opening session%@", buf, 0x20u);
  }

  id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
  self->_libraryRowIDsByMangledID = v9;

  uint64_t v11 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  appLibrariesByRowID = self->_appLibrariesByRowID;
  self->_appLibrariesByRowID = v11;

  uint64_t v13 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  self->_serverZonesByZoneRowID = v13;

  uint64_t v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
  self->_sharedServerZonesByMangledID = v15;

  __int16 v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
  self->_sharedClientZonesByMangledID = v17;

  __int16 v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  privateServerZonesByID = self->_privateServerZonesByID;
  self->_privateServerZonesByID = v19;

  uint64_t v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  privateClientZonesByID = self->_privateClientZonesByID;
  self->_privateClientZonesByID = v21;

  dispatch_time_t v23 = [MEMORY[0x1E4F1CA60] dictionary];
  rootsByFolderType = self->_rootsByFolderType;
  self->_rootsByFolderType = v23;

  uint64_t v25 = [MEMORY[0x1E4F1CA60] dictionary];
  fsEventsMonitors = self->_fsEventsMonitors;
  self->_fsEventsMonitors = v25;

  [(BRCAccountSession *)self _createAccountSupportPathIfNeeded:self->_sessionDirPath protectParent:1];
  [(BRCAccountSession *)self _createAccountSupportPathIfNeeded:self->_cacheDirPath protectParent:1];
  if (self->_cloudDocsFD == -1)
  {
    id v27 = [(NSString *)self->_sessionDirPath stringByDeletingLastPathComponent];
    int v28 = open((const char *)[v27 fileSystemRepresentation], 33028);
    self->_int cloudDocsFD = v28;
    if (v28 < 0)
    {
      abc_report_panic_with_signature();
      [NSString stringWithFormat:@"Unable to open file at path '%@' %{errno}d", v27, *__error()];
      objc_claimAutoreleasedReturnValue();
      v106 = brc_bread_crumbs();
      v107 = brc_default_log();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_FAULT))
      {
        id v108 = brc_append_system_info_to_message();
        -[BRCAccountSession openWithError:pushWorkloop:](v108, (uint64_t)v106, (uint64_t)buf);
      }

      brc_append_system_info_to_message();
      v109 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCAccountSession openWithError:pushWorkloop:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/account/BRCAccountSession.m", 1084, v109);
    }
    id v29 = brc_bread_crumbs();
    id v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSession openWithError:pushWorkloop:].cold.4((uint64_t)v27);
    }

    if (flock(self->_cloudDocsFD, 2) < 0)
    {
      abc_report_panic_with_signature();
      [NSString stringWithFormat:@"Unable to lock file at path '%@' %{errno}d", v27, *__error()];
      objc_claimAutoreleasedReturnValue();
      v110 = brc_bread_crumbs();
      v111 = brc_default_log();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_FAULT))
      {
        v112 = brc_append_system_info_to_message();
        -[BRCAccountSession openWithError:pushWorkloop:](v112, (uint64_t)v110, (uint64_t)buf);
      }

      brc_append_system_info_to_message();
      v113 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
      __assert_rtn("-[BRCAccountSession openWithError:pushWorkloop:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/account/BRCAccountSession.m", 1088, v113);
    }
  }
  char v31 = [(BRCAccountSession *)self dirPathForSyncedFolderType:1];
  accountDSID = self->_accountDSID;
  id v33 = [v31 stringByDeletingLastPathComponent];
  LOBYTE(accountDSID) = BRCMigrateLegacyUbiquityRoot(accountDSID, v31, v33);

  if (accountDSID)
  {
    __int16 v34 = [(NSURL *)self->_dbURL path];
    [(BRCAccountSession *)self _createAccountSupportPathIfNeeded:v34 protectParent:0];

    id v35 = self->_dbURL;
    uint64_t v36 = dispatch_get_global_queue(0, 0);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke;
    block[3] = &unk_1E6993698;
    id v37 = v35;
    v122 = v37;
    dispatch_async(v36, block);

    [(BRCAccountSession *)self _setupSharedPackageExtensionsPlist];
    [(BRCAccountSession *)self _setupThrottles];
    char v38 = objc_alloc_init(BRCVolume);
    volume = self->_volume;
    self->_volume = v38;

    [MEMORY[0x1E4F59490] clearAccountDescriptorCache];
    v120[0] = MEMORY[0x1E4F143A8];
    v120[1] = 3221225472;
    v120[2] = __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_79;
    v120[3] = &unk_1E6998F50;
    v120[4] = self;
    [(BRCAccountSession *)self _enumerateAccountHandlerSupportedFolderTypes:v120];
    char v40 = self->_volume;
    __int16 v41 = [(BRCAccountSession *)self rootForSyncedFolderType:1];
    LOBYTE(v40) = [(BRCVolume *)v40 setUpForRelPath:v41 error:a3];

    if ((v40 & 1) == 0) {
      goto LABEL_22;
    }
    uint64_t v42 = [[BRCStageRegistry alloc] initWithAccountSession:self];
    stageRegistry = self->_stageRegistry;
    self->_stageRegistry = v42;

    [(BRCStageRegistry *)self->_stageRegistry open];
    if (![(BRCAccountSession *)self openDBWithError:a3]) {
      goto LABEL_22;
    }
    [(BRCAccountSession *)self _markDBOpened];
    long long v44 = [[BRCFairScheduler alloc] initWithWorkloop:self->_clientTruthWorkloop name:@"client-db"];
    fairClientDBScheduler = self->_fairClientDBScheduler;
    self->_fairClientDBScheduler = v44;

    id v46 = [[BRCDeadlineScheduler alloc] initWithName:@"com.apple.bird.main-scheduler" fairScheduler:self->_fairClientDBScheduler];
    defaultScheduler = self->_defaultScheduler;
    self->_defaultScheduler = v46;

    int v48 = [[BRCContainerScheduler alloc] initWithAccountSession:self pushWorkloop:v6];
    containerScheduler = self->_containerScheduler;
    self->_containerScheduler = v48;

    int v50 = [[BRCApplyScheduler alloc] initWithAccountSession:self];
    applyScheduler = self->_applyScheduler;
    self->_applyScheduler = v50;

    int v52 = [[BRCFSReader alloc] initWithAccountSession:self];
    fsReader = self->_fsReader;
    self->_fsReader = v52;

    int v54 = [[BRCFSWriter alloc] initWithAccountSession:self];
    fsWriter = self->_fsWriter;
    self->_fsWriter = v54;

    char v56 = [[BRCFSUploader alloc] initWithAccountSession:self];
    fsUploader = self->_fsUploader;
    self->_fsUploader = v56;

    int v58 = [[BRCFSDownloader alloc] initWithAccountSession:self];
    fsDownloader = self->_fsDownloader;
    self->_fsDownloader = v58;

    long long v60 = [[BRCSyncUpScheduler alloc] initWithAccountSession:self];
    syncUpScheduler = self->_syncUpScheduler;
    self->_syncUpScheduler = v60;

    int v62 = [[BRCNotificationManager alloc] initWithAccountSession:self];
    notificationManager = self->_notificationManager;
    self->_notificationManager = v62;

    int v64 = [[BRCSyncContextProvider alloc] initWithAccountSession:self];
    syncContextProvider = self->_syncContextProvider;
    self->_syncContextProvider = v64;

    id v66 = [[BRCTimerScheduler alloc] initWithAccountSession:self timerName:@"autoResumeSyncTimer" sqlTable:@"client_items" field:@"version_block_sync_until_timestamp" timerHandler:&__block_literal_global_111_0];
    autoResumeSyncTimerScheduler = self->_autoResumeSyncTimerScheduler;
    self->_autoResumeSyncTimerScheduler = v66;

    id v68 = objc_alloc_init(BRCTapToRadarManager);
    tapToRadarManager = self->_tapToRadarManager;
    self->_tapToRadarManager = v68;

    id v70 = [[BRCDownloadTrackers alloc] initWithSession:self];
    downloadTrackers = self->_downloadTrackers;
    self->_downloadTrackers = v70;

    uint64_t v72 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v73 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bird.reset", v72);

    resetQueue = self->_resetQueue;
    self->_resetQueue = v73;

    uint64_t v75 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
    uint64_t v76 = (OS_dispatch_queue *)dispatch_queue_create("com.apple.bird.db.fixup", v75);

    dbFixupQueue = self->_dbFixupQueue;
    self->_dbFixupQueue = v76;

    dispatch_suspend((dispatch_object_t)self->_resetQueue);
    v119[0] = MEMORY[0x1E4F143A8];
    v119[1] = 3221225472;
    v119[2] = __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_3;
    v119[3] = &unk_1E6998F50;
    v119[4] = self;
    [(BRCAccountSession *)self _enumerateAccountHandlerSupportedFolderTypes:v119];
    v78 = +[BRCUserDefaults defaultsForMangledID:0];
    LODWORD(v75) = [v78 spotlightIndexingEnabled];

    if (v75)
    {
      id v79 = [[BRCRecentsEnumerator alloc] initWithAccountSession:self];
      recentsEnumerator = self->_recentsEnumerator;
      self->_recentsEnumerator = v79;
    }
    __int16 v81 = objc_alloc_init(BRCUserNotification);
    userNotificatiouint64_t n = self->_userNotification;
    self->_userNotificatiouint64_t n = v81;

    if ([(BRCAccountSession *)self _createAppLibraryRootsIfNeededWithError:a3]&& [(BRCAccountSession *)self createAppLibrariesIfNeededWithError:a3])
    {
      __int16 v83 = [[BRCDiskSpaceReclaimer alloc] initWithAccountSession:self];
      diskReclaimer = self->_diskReclaimer;
      self->_diskReclaimer = v83;

      [(BRCContainerScheduler *)self->_containerScheduler setup];
      v115 = [MEMORY[0x1E4F594E8] cloudDocsMangledID];
      __int16 v85 = [(BRCAccountSession *)self getOrCreateAppLibraryAndPrivateZonesIfNecessary:v115];
      int v86 = [v85 defaultClientZone];

      BOOL v87 = v86 != 0;
      if (v86)
      {
        v114 = [v86 defaultAppLibrary];
        if (!v114)
        {
          uint64_t v104 = brc_bread_crumbs();
          v105 = brc_default_log();
          if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
            -[BRCAccountSession openWithError:pushWorkloop:]();
          }
        }
        int v88 = +[BRCUserDefaults defaultsForMangledID:0];
        [v88 diskSpaceCheckInterval];

        __int16 v89 = [(BRCPQLConnection *)self->_clientDB serialQueue];
        br_pacer_create();
        int v90 = (br_pacer *)objc_claimAutoreleasedReturnValue();
        reschedulePendingDiskItemsPacer = self->_reschedulePendingDiskItemsPacer;
        self->_reschedulePendingDiskItemsPacer = v90;

        objc_initWeak((id *)buf, self);
        v117[1] = (id)MEMORY[0x1E4F143A8];
        v117[2] = (id)3221225472;
        v117[3] = __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_122;
        v117[4] = &unk_1E6993C50;
        objc_copyWeak(&v118, (id *)buf);
        br_pacer_set_event_handler();
        id v92 = [(BRCPQLConnection *)self->_clientDB serialQueue];
        br_pacer_create();
        uint64_t v93 = (br_pacer *)objc_claimAutoreleasedReturnValue();
        updateDiskSpacePacer = self->_updateDiskSpacePacer;
        self->_updateDiskSpacePacer = v93;

        v116[5] = MEMORY[0x1E4F143A8];
        v116[6] = 3221225472;
        v116[7] = __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_124;
        v116[8] = &unk_1E6993C50;
        objc_copyWeak(v117, (id *)buf);
        br_pacer_set_event_handler();
        uint64_t v95 = [[BRCGlobalProgress alloc] initWithSession:self];
        globalProgress = self->_globalProgress;
        self->_globalProgress = v95;

        uint64_t v97 = [[BRCItemTransmogrifier alloc] initWithSession:self];
        itemTransmogrifier = self->_itemTransmogrifier;
        self->_itemTransmogrifier = v97;

        __int16 v99 = [[BRCAnalyticsReporter alloc] initWithSession:self];
        analyticsReporter = self->_analyticsReporter;
        self->_analyticsReporter = v99;

        [(BRCAccountSession *)self _submitDBCorruptionTelemetryEventIfNeeded];
        [(BRCAccountSession *)self _submitSessionOpenFailedTelemetryEventIfNeeded];
        [(BRCAccountSession *)self _submitReimportDomainFailedTelemetryEventIfNeeded];
        v116[0] = MEMORY[0x1E4F143A8];
        v116[1] = 3221225472;
        v116[2] = __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_128;
        v116[3] = &unk_1E6998F98;
        v116[4] = self;
        [(BRCAccountSession *)self fetchUserRecordIDWithCompletionHandler:v116];
        +[BRCSQLBackedSet clearTempDatabases];
        self->_isOpeuint64_t n = 1;
        objc_destroyWeak(v117);
        objc_destroyWeak(&v118);
        objc_destroyWeak((id *)buf);
      }
      else if (a3)
      {
        objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 4);
        *a3 = (id)objc_claimAutoreleasedReturnValue();
      }
    }
    else
    {
LABEL_22:
      BOOL v87 = 0;
    }
  }
  else if (a3)
  {
    [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F592A8] code:18 userInfo:0];
    BOOL v87 = 0;
    *a3 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    BOOL v87 = 0;
  }

  __brc_leave_section(v123);
  return v87;
}

void __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)MEMORY[0x1D9438760]();
  memset(v14, 0, sizeof(v14));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession openWithError:pushWorkloop:]_block_invoke", 1114, v14);
  uint64_t v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v11 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v16 = v14[0];
    __int16 v17 = 2112;
    id v18 = v11;
    __int16 v19 = 2112;
    char v20 = v3;
    _os_log_debug_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx including %@ in backup%@", buf, 0x20u);
  }

  id v5 = *(void **)(a1 + 32);
  uint64_t v6 = *MEMORY[0x1E4F1C630];
  id v13 = 0;
  char v7 = [v5 setResourceValue:MEMORY[0x1E4F1CC28] forKey:v6 error:&v13];
  id v8 = v13;
  if ((v7 & 1) == 0)
  {
    id v9 = brc_bread_crumbs();
    dispatch_queue_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u))
    {
      id v12 = [*(id *)(a1 + 32) path];
      *(_DWORD *)buf = 138412802;
      uint64_t v16 = (uint64_t)v12;
      __int16 v17 = 2112;
      id v18 = v8;
      __int16 v19 = 2112;
      char v20 = v9;
      _os_log_error_impl(&dword_1D353B000, v10, (os_log_type_t)0x90u, "[ERROR] Unable to include '%@' from backups: %@%@", buf, 0x20u);
    }
  }
  __brc_leave_section(v14);
}

uint64_t __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_79(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) createRootForSyncedFolderType:a2];
  if (v4) {
    [*(id *)(a1 + 32) setRoot:v4 forSyncedFolderType:a2];
  }

  return 1;
}

uint64_t __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_2(uint64_t a1, uint64_t a2)
{
  return +[BRCDocumentItem autoResumeSyncPausedDocumentsOnTimeoutWithSession:a2];
}

uint64_t __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_3(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) rootForSyncedFolderType:a2];
  if (v4)
  {
    id v5 = [*(id *)(a1 + 32) createFSEventsMonitorForSyncedFolderType:a2];
    [*(id *)(a1 + 32) setFSEventsMonitor:v5 forSyncedFolderType:a2];
  }
  return 1;
}

void __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_122(uint64_t a1)
{
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    memset(v4, 0, sizeof(v4));
    __brc_create_section(0, (uint64_t)"-[BRCAccountSession openWithError:pushWorkloop:]_block_invoke", 1299, v4);
    uint64_t v2 = brc_bread_crumbs();
    uint64_t v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
      __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_122_cold_1();
    }

    objc_msgSend(WeakRetained[79], "rescheduleJobsForPendingDiskSpaceWithAvailableSpace:", objc_msgSend(WeakRetained, "availableDiskSpaceUsingCache:schedulingPendingDiskItemsIfNeeded:", 0, 0));
    __brc_leave_section(v4);
  }
}

void __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_124(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  memset(v4, 0, sizeof(v4));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession openWithError:pushWorkloop:]_block_invoke", 1307, v4);
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_124_cold_1();
  }

  [WeakRetained availableDiskSpaceUsingCache:0 schedulingPendingDiskItemsIfNeeded:1];
  __brc_leave_section(v4);
}

uint64_t __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_128(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 600) enablePushNotifications];
}

- (void)_markDBOpened
{
  self->_isDBOpened = 1;
}

- (void)_pcsChainAllItemsWithActivity:(id)a3
{
  id v4 = a3;
  clientTruthWorkloop = self->_clientTruthWorkloop;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke;
  v7[3] = &unk_1E6993628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientTruthWorkloop, v7);
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_cold_2();
  }

  uint64_t v10 = 0;
  uint64_t v11 = &v10;
  uint64_t v12 = 0x2020000000;
  char v13 = 0;
  id v4 = *(void **)(a1 + 32);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_131;
  v7[3] = &unk_1E6998FE8;
  v7[4] = v4;
  id v8 = *(id *)(a1 + 40);
  id v9 = &v10;
  [v4 enumerateAppLibraries:v7];
  if (!*((unsigned char *)v11 + 24) && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, (os_log_type_t)0x90u)) {
      __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_cold_1();
    }
  }
  _Block_object_dispose(&v10, 8);
}

BOOL __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_131(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 containerMetadata];
  if (([v4 isDocumentScopePublic] & 1) == 0)
  {

LABEL_11:
    BOOL v12 = 1;
    goto LABEL_12;
  }
  id v5 = [v3 defaultClientZone];
  char v6 = [v5 isSyncBlocked];

  if (v6) {
    goto LABEL_11;
  }
  char v7 = [v3 mangledID];
  id v8 = +[BRCUserDefaults defaultsForMangledID:v7];
  int v9 = [v8 aggressivelyPCSChainWithSession:*(void *)(a1 + 32)];

  if (!v9) {
    goto LABEL_11;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 40)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3))
    {
      uint64_t v10 = brc_bread_crumbs();
      uint64_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_131_cold_1();
      }
    }
    BOOL v12 = 0;
  }
  else
  {
    id v14 = [v3 db];
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    void v40[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_132;
    v40[3] = &unk_1E6994120;
    v40[4] = *(void *)(a1 + 32);
    uint64_t v15 = [v3 documentsFolderItemID];
    uint64_t v16 = [v3 defaultClientZone];
    __int16 v17 = [v16 dbRowID];
    id v18 = (void *)[v14 fetchObject:v40, @"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_parent_id = %@ AND zone_rowid = %@ AND item_filename != '.Trash' AND pcs_state NOT IN (2, 3) LIMIT 1", v15, v17 sql];

    BOOL v12 = v18 == 0;
    if (v18)
    {
      __int16 v19 = [[BRCPCSChainingOperation alloc] initWithRootItem:v18 appLibrary:v3 sessionContext:*(void *)(a1 + 32) syncUpCallback:*(void *)(*(void *)(a1 + 32) + 640)];
      char v20 = objc_msgSend(MEMORY[0x1E4F1A218], "br_aggressiveChaining");
      [(_BRCOperation *)v19 setGroup:v20];

      [(BRCPCSChainingOperation *)v19 setQualityOfService:9];
      objc_initWeak(&location, *(id *)(a1 + 32));
      uint64_t v21 = [*(id *)(*(void *)(a1 + 32) + 144) serialQueue];
      uint64_t v22 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, v21);

      dispatch_source_set_timer(v22, 0, 0x2540BE400uLL, 0xB2D05E00uLL);
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_2;
      v36[3] = &unk_1E6993628;
      id v37 = *(id *)(a1 + 40);
      dispatch_time_t v23 = v19;
      char v38 = v23;
      long long v24 = v22;
      uint64_t v25 = v36;
      id v26 = v24;
      id v27 = v25;
      int v28 = v27;
      id v29 = v27;
      if (*MEMORY[0x1E4F59658])
      {
        id v29 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v27);
      }
      dispatch_block_t v30 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v29);
      dispatch_source_set_event_handler(v26, v30);

      dispatch_resume(v26);
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_139;
      v32[3] = &unk_1E6998FC0;
      char v31 = v26;
      id v33 = v31;
      objc_copyWeak(&v35, &location);
      id v34 = *(id *)(a1 + 40);
      [(BRCPCSChainingOperation *)v23 setPcsChainCompletionBlock:v32];
      [(_BRCOperation *)v23 schedule];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;

      objc_destroyWeak(&v35);
      objc_destroyWeak(&location);
    }
  }
LABEL_12:

  return v12;
}

id __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_132(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[*(id *)(a1 + 32) newServerItemFromPQLResultSet:a2 error:a3];
  return v3;
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_2(uint64_t a1)
{
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    [*(id *)(a1 + 40) cancel];
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3))
    {
      uint64_t v2 = brc_bread_crumbs();
      id v3 = brc_default_log();
      if (os_log_type_enabled(v3, (os_log_type_t)0x90u)) {
        __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_2_cold_1();
      }
    }
  }
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_139(uint64_t a1, uint64_t a2, void *a3, uint64_t a4, void *a5)
{
  id v7 = a3;
  id v8 = a5;
  dispatch_source_cancel(*(dispatch_source_t *)(a1 + 32));
  id WeakRetained = (NSObject **)objc_loadWeakRetained((id *)(a1 + 48));
  uint64_t v10 = WeakRetained;
  if (v8 || !WeakRetained)
  {
    if ((objc_msgSend(v8, "brc_isCloudKitCancellationError") & 1) == 0
      && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 3))
    {
      BOOL v12 = brc_bread_crumbs();
      char v13 = brc_default_log();
      if (os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
        __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_139_cold_1();
      }
    }
  }
  else
  {
    if (v7)
    {
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_140;
      v17[3] = &unk_1E69944C0;
      v17[4] = WeakRetained;
      id v18 = *(id *)(a1 + 40);
      [v7 addPreFlushDirectoryListCompletionBlock:v17];
      [v7 beginObservingChangesWithDelegate:0];
      uint64_t v11 = v18;
    }
    else
    {
      id v14 = WeakRetained[6];
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_3;
      v15[3] = &unk_1E6993628;
      v15[4] = WeakRetained;
      id v16 = *(id *)(a1 + 40);
      dispatch_async(v14, v15);
      uint64_t v11 = v16;
    }
  }
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_140(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(NSObject **)(v1 + 48);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_2_141;
  v3[3] = &unk_1E6993628;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  dispatch_async(v2, v3);
}

uint64_t __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_2_141(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pcsChainAllItemsWithActivity:*(void *)(a1 + 40)];
}

uint64_t __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _pcsChainAllItemsWithActivity:*(void *)(a1 + 40)];
}

- (id)_getPartiallySaltedItemWithAppLibrary:(id)a3
{
  id v4 = a3;
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  id v5 = [v4 defaultClientZone];
  if (!v4) {
    goto LABEL_4;
  }
  if ([v4 saltingState] != 2) {
    goto LABEL_4;
  }
  char v6 = [v4 rootItemID];
  id v7 = [v5 itemByItemID:v6];
  id v8 = [v7 asDirectory];

  if (!v8)
  {
LABEL_4:
    int v9 = [v5 db];
    uint64_t v10 = [v5 dbRowID];
    uint64_t v11 = (void *)[v9 fetch:@"SELECT item_id FROM server_items WHERE salting_state = 2 AND item_type IN (0, 9, 10) AND zone_rowid = %@ LIMIT 1", v10];

    if ([v11 next]
      && ([v11 objectOfClass:objc_opt_class() atIndex:0],
          (uint64_t v12 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      char v13 = (void *)v12;
      id v14 = [v5 itemByItemID:v12];
      id v8 = [v14 asDirectory];
    }
    else
    {
      id v8 = 0;
    }
  }
  return v8;
}

- (void)_saltPartiallySaltedItemsWithActivity:(id)a3
{
  id v4 = a3;
  clientTruthWorkloop = self->_clientTruthWorkloop;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke;
  v7[3] = &unk_1E6993628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(clientTruthWorkloop, v7);
}

void __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_cold_2();
  }

  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_150;
  v9[3] = &unk_1E6999038;
  id v4 = *(void **)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 32);
  id v10 = v5;
  uint64_t v11 = v6;
  uint64_t v12 = &v13;
  [v4 enumerateAppLibraries:v9];
  if (!*((unsigned char *)v14 + 24) && !xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 5))
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
      __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_cold_1();
    }
  }
  _Block_object_dispose(&v13, 8);
}

BOOL __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_150(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 defaultClientZone];
  if ([v4 isSyncBlocked]) {
    goto LABEL_12;
  }
  id v5 = [v3 mangledID];
  uint64_t v6 = +[BRCUserDefaults defaultsForMangledID:v5];
  if (![v6 finishSaltingPartiallySaltedDirectories]
    || ([v4 enhancedDrivePrivacyEnabled] & 1) == 0)
  {

    goto LABEL_12;
  }
  char v7 = [v4 isBusy];

  if (v7)
  {
LABEL_12:
    BOOL v10 = 1;
    goto LABEL_13;
  }
  if (xpc_activity_should_defer(*(xpc_activity_t *)(a1 + 32)))
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 3))
    {
      id v8 = brc_bread_crumbs();
      int v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_150_cold_1();
      }
    }
    BOOL v10 = 0;
  }
  else
  {
    uint64_t v12 = [*(id *)(a1 + 40) _getPartiallySaltedItemWithAppLibrary:v3];
    objc_initWeak(&location, *(id *)(a1 + 40));
    BOOL v10 = v12 == 0;
    if (v12)
    {
      uint64_t v13 = [BRCSaltingBatchOperation alloc];
      id v14 = objc_loadWeakRetained(&location);
      uint64_t v15 = [(BRCSaltingBatchOperation *)v13 initWithParentItem:v12 sessionContext:v14];

      char v16 = objc_msgSend(MEMORY[0x1E4F1A218], "br_partialSaltingCompletion");
      [(_BRCOperation *)v15 setGroup:v16];

      [(_BRCOperation *)v15 setNonDiscretionary:1];
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_152;
      v18[3] = &unk_1E6999010;
      objc_copyWeak(&v22, &location);
      id v19 = v12;
      id v17 = v4;
      id v20 = v17;
      id v21 = *(id *)(a1 + 32);
      [(BRCSaltingBatchOperation *)v15 setMetadataCompletionBlock:v18];
      [v17 addOutOfBandOperation:v15];
      [(_BRCOperation *)v15 schedule];
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;

      objc_destroyWeak(&v22);
    }
    objc_destroyWeak(&location);
  }
LABEL_13:

  return v10;
}

void __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_152(id *a1, int a2, int a3, void *a4)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id WeakRetained = objc_loadWeakRetained(a1 + 7);
  int v9 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v10 = [WeakRetained analyticsReporter];
    uint64_t v11 = [a1[4] itemID];
    uint64_t v12 = [v11 debugItemIDString];
    uint64_t v13 = [a1[5] mangledID];
    id v14 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(a1[5], "enhancedDrivePrivacyEnabled"));
    [v10 aggregateReportForAppTelemetryIdentifier:42 itemID:v12 zoneMangledID:v13 enhancedDrivePrivacyEnabled:v14 error:v7];

    uint64_t v15 = brc_bread_crumbs();
    char v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      id v18 = a1[4];
      *(_DWORD *)buf = 138413314;
      id v25 = v18;
      __int16 v26 = 1024;
      int v27 = a2;
      __int16 v28 = 1024;
      int v29 = a3;
      __int16 v30 = 2112;
      id v31 = v7;
      __int16 v32 = 2112;
      id v33 = v15;
      _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished metadata salting a batch for item %@ when completed: %d validation: %d error: %@%@", buf, 0x2Cu);
    }

    if (!v7
      || (objc_msgSend(v7, "brc_isSaltingError") & 1) != 0
      || (a3 & 1) != 0
      || objc_msgSend(v7, "brc_isCloudKitCancellationError"))
    {
      id v17 = v9[6];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_154;
      v19[3] = &unk_1E6993CC8;
      id v20 = v7;
      id v21 = a1[5];
      id v22 = v9;
      id v23 = a1[6];
      dispatch_async(v17, v19);
    }
  }
}

uint64_t __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_154(uint64_t a1)
{
  if ((objc_msgSend(*(id *)(a1 + 32), "brc_isCloudKitCancellationError") & 1) == 0) {
    [*(id *)(a1 + 40) scheduleSyncDown];
  }
  uint64_t v2 = *(void **)(a1 + 48);
  uint64_t v3 = *(void *)(a1 + 56);
  return [v2 _saltPartiallySaltedItemsWithActivity:v3];
}

- (unsigned)_recoverAndReportBoosting
{
  uint64_t v2 = self;
  uint64_t v6 = 0;
  id v7 = &v6;
  uint64_t v8 = 0x2020000000;
  int v9 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __46__BRCAccountSession__recoverAndReportBoosting__block_invoke;
  v5[3] = &unk_1E6999060;
  v5[4] = &v6;
  [(BRCAccountSession *)self enumerateAppLibraries:v5];
  id v3 = +[AppTelemetryTimeSeriesEvent newSyncBoostingProblemCountWithProblemCount:*((unsigned int *)v7 + 6)];
  [(BRCAnalyticsReporter *)v2->_analyticsReporter postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v3];
  LODWORD(v2) = *((_DWORD *)v7 + 6);

  _Block_object_dispose(&v6, 8);
  return v2;
}

uint64_t __46__BRCAccountSession__recoverAndReportBoosting__block_invoke(uint64_t a1, void *a2)
{
  if (([a2 integrityCheckBoosting] & 1) == 0) {
    ++*(_DWORD *)(*(void *)(*(void *)(a1 + 32) + 8) + 24);
  }
  return 1;
}

- (unsigned)_recoverAndReportBrokenShareOptions
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = [(BRCPQLConnection *)self->_clientDB fetch:@"SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_doc_id, ci.item_file_id, ci.item_generation, ci.item_localname, ci.item_processing_stamp, ci.item_staged_file_id, ci.item_staged_generation, ci.item_bouncedname, ci.item_scope, ci.item_tmpbounceno, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.desired_version, ci.item_live_conflict_loser_etags, ci.item_thumb_live_signature, ci.item_thumb_greedy, ci.version_block_sync_until_bundle_id, ci.version_block_sync_until_timestamp FROM client_items AS ci LEFT JOIN server_items AS si ON ci.item_id = si.item_id AND ci.zone_rowid = si.zone_rowid WHERE ci.zone_rowid != ci.item_parent_zone_rowid AND (ci.item_sharing_options & 4) = 0 AND (si.item_id IS NULL OR item_id_is_root(si.item_parent_id))"];
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __56__BRCAccountSession__recoverAndReportBrokenShareOptions__block_invoke;
  v20[3] = &unk_1E6994120;
  id v18 = self;
  id v19 = v3;
  v20[4] = self;
  id v4 = [v3 enumerateObjects:v20];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = 0;
    uint64_t v8 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v8) {
          objc_enumerationMutation(v4);
        }
        BOOL v10 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        uint64_t v11 = (void *)MEMORY[0x1D9438760]();
        uint64_t v12 = [v10 clientZone];
        int v13 = [v12 isSharedZone];

        if (v13)
        {
          id v14 = brc_bread_crumbs();
          uint64_t v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v26 = v10;
            __int16 v27 = 2112;
            __int16 v28 = v14;
            _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] Item %@ is missing a shareID%@", buf, 0x16u);
          }

          objc_msgSend(v10, "setSharingOptions:", objc_msgSend(v10, "sharingOptions") | 4);
          [v10 markForceNeedsSyncUp];
          [v10 saveToDB];
          uint64_t v7 = (v7 + 1);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v29 count:16];
    }
    while (v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  id v16 = +[AppTelemetryTimeSeriesEvent newCorruptSharingOptionsProblemWithProblemCount:v7];
  [(BRCAnalyticsReporter *)v18->_analyticsReporter postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v16];

  return v7;
}

id __56__BRCAccountSession__recoverAndReportBrokenShareOptions__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (unsigned)_reportBasehashSalting
{
  return 0;
}

- (void)_recoverAndReportStateIntegrityWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSession _recoverAndReportStateIntegrityWithCompletion:]();
  }

  v20[0] = 0;
  v20[1] = v20;
  v20[2] = 0x2020000000;
  v20[3] = 0;
  uint64_t v7 = dispatch_group_create();
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  uint64_t v8 = +[BRCUserDefaults defaultsForMangledID:0];
  clientDB = self->_clientDB;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __67__BRCAccountSession__recoverAndReportStateIntegrityWithCompletion___block_invoke;
  v16[3] = &unk_1E6999088;
  id v10 = v8;
  id v18 = self;
  id v19 = v20;
  id v17 = v10;
  [(BRCPQLConnection *)clientDB performWithFlags:8 action:v16];
  clientTruthWorkloop = self->_clientTruthWorkloop;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __67__BRCAccountSession__recoverAndReportStateIntegrityWithCompletion___block_invoke_2;
  block[3] = &unk_1E69990B0;
  id v14 = v4;
  uint64_t v15 = v20;
  id v12 = v4;
  dispatch_group_notify(v7, clientTruthWorkloop, block);

  _Block_object_dispose(v20, 8);
}

uint64_t __67__BRCAccountSession__recoverAndReportStateIntegrityWithCompletion___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) dbIntegrityCheckMissingShareOptions]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(a1 + 40) _recoverAndReportBrokenShareOptions];
  }
  if ([*(id *)(a1 + 32) dbIntegrityCheckApplyJobs]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(*(void *)(a1 + 40) + 608) recoverAndReportMissingJobs];
  }
  if ([*(id *)(a1 + 32) dbIntegrityCheckSyncUpJobs]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(*(void *)(a1 + 40) + 640) recoverAndReportMissingJobs];
  }
  if ([*(id *)(a1 + 32) dbIntegrityCheckDownloadJobs]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(*(void *)(a1 + 40) + 632) recoverAndReportMissingJobs];
  }
  if ([*(id *)(a1 + 32) dbIntegrityCheckUploadJobs]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(*(void *)(a1 + 40) + 624) recoverAndReportMissingJobs];
  }
  if ([*(id *)(a1 + 32) dbIntegrityCheckReaderJobs]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(*(void *)(a1 + 40) + 432) recoverAndReportMissingJobs];
  }
  if ([*(id *)(a1 + 32) integrityCheckBoosting]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(a1 + 40) _recoverAndReportBoosting];
  }
  if ([*(id *)(a1 + 32) dbIntegrityCheckBasehashSalting]) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) += [*(id *)(a1 + 40) _reportBasehashSalting];
  }
  return 1;
}

uint64_t __67__BRCAccountSession__recoverAndReportStateIntegrityWithCompletion___block_invoke_2(uint64_t a1)
{
  return (*(uint64_t (**)(void, void))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24));
}

- (void)_cleanupOldCiconiaLocations
{
  if (self->_isDataSeparated)
  {
    id v6 = [MEMORY[0x1E4F594C0] cloudDocsAppSupportURL];
    id v3 = [v6 URLByAppendingPathComponent:@"ciconia"];
    if (!access((const char *)[v3 fileSystemRepresentation], 0))
    {
      fileUnlinker = self->_fileUnlinker;
      id v5 = [v3 path];
      [(BRCFileUnlinker *)fileUnlinker renameAndUnlinkInBackgroundItemAtPath:v5];
    }
  }
}

- (id)_prepareXPCActivityIdentifierWithName:(id)a3
{
  id v4 = a3;
  id v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v6 = [v5 currentPersona];
  int v7 = [v6 isDataSeparatedPersona];

  if (v7)
  {
    uint64_t v8 = NSString;
    int v9 = [(BRCAccountSession *)self volume];
    id v10 = [v8 stringWithFormat:@"%@-%d", v4, objc_msgSend(v9, "deviceID")];
  }
  else
  {
    id v10 = v4;
  }

  return v10;
}

- (void)_registerBackgroundXPCActivities
{
  id v3 = +[BRCUserDefaults defaultsForMangledID:0];
  objc_initWeak(location, self);
  id v39 = [(BRCAccountSession *)self _prepareXPCActivityIdentifierWithName:@"com.apple.bird.transmogrify"];
  id v4 = (const char *)[v39 UTF8String];
  id v5 = [v3 transmogrifyXPCActivity];
  v47[0] = MEMORY[0x1E4F143A8];
  v47[1] = 3221225472;
  v47[2] = __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke;
  uint64_t v47[3] = &unk_1E6994588;
  objc_copyWeak(&v48, location);
  id v6 = v5;
  int v7 = v47;
  uint64_t v8 = v7;
  int v9 = (void (**)(void *))MEMORY[0x1E4F59650];
  if (*MEMORY[0x1E4F59650])
  {
    uint64_t v10 = ((void (*)(void *))*MEMORY[0x1E4F59650])(v7);

    uint64_t v8 = (void *)v10;
  }
  xpc_activity_unregister(v4);
  xpc_activity_register(v4, v6, v8);

  uint64_t v11 = [(BRCAccountSession *)self _prepareXPCActivityIdentifierWithName:@"com.apple.bird.aggressive-pcs-chain"];
  int v12 = [v3 aggressivelyPCSChainWithSession:self];
  id v13 = v11;
  id v14 = v13;
  if (v12)
  {
    uint64_t v15 = (const char *)[v13 UTF8String];
    id v16 = [v3 aggressivePCSChainActivity];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_181;
    v45[3] = &unk_1E6994588;
    objc_copyWeak(&v46, location);
    id v17 = v16;
    id v18 = v45;
    id v19 = v18;
    if (*v9)
    {
      uint64_t v20 = (*v9)(v18);

      id v19 = (void *)v20;
    }
    xpc_activity_unregister(v15);
    xpc_activity_register(v15, v17, v19);

    objc_destroyWeak(&v46);
  }
  else
  {
    long long v21 = (const char *)[v13 UTF8String];
    id v22 = (id)*MEMORY[0x1E4F14158];
    if (*v9)
    {
      long long v23 = (*v9)(__block_literal_global_840);
    }
    else
    {
      long long v23 = __block_literal_global_840;
    }
    xpc_activity_unregister(v21);
    xpc_activity_register(v21, v22, v23);
  }
  id v24 = [(BRCAccountSession *)self _prepareXPCActivityIdentifierWithName:@"com.apple.bird.db-integrity-check"];
  id v25 = (const char *)[v24 UTF8String];
  __int16 v26 = [v3 dbIntegrityCheckXPCActivity];
  v43[0] = MEMORY[0x1E4F143A8];
  v43[1] = 3221225472;
  v43[2] = __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_188;
  v43[3] = &unk_1E6994588;
  objc_copyWeak(&v44, location);
  id v27 = v26;
  __int16 v28 = v43;
  int v29 = v28;
  if (*MEMORY[0x1E4F59650])
  {
    uint64_t v30 = ((void (*)(void *))*MEMORY[0x1E4F59650])(v28);

    int v29 = (void *)v30;
  }
  xpc_activity_unregister(v25);
  xpc_activity_register(v25, v27, v29);

  id v31 = [(BRCAccountSession *)self _prepareXPCActivityIdentifierWithName:@"com.apple.bird.finish-salting-partially-salted-directories"];
  __int16 v32 = (const char *)[v31 UTF8String];
  id v33 = [v3 finishSaltingPartiallySaltedDirectoriesActivity];
  v40[0] = MEMORY[0x1E4F143A8];
  v40[1] = 3221225472;
  void v40[2] = __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_197;
  v40[3] = &unk_1E6999100;
  id v34 = v3;
  id v41 = v34;
  objc_copyWeak(&v42, location);
  id v35 = v33;
  uint64_t v36 = v40;
  id v37 = v36;
  if (*MEMORY[0x1E4F59650])
  {
    uint64_t v38 = ((void (*)(void *))*MEMORY[0x1E4F59650])(v36);

    id v37 = (void *)v38;
  }
  xpc_activity_unregister(v32);
  xpc_activity_register(v32, v35, v37);

  objc_destroyWeak(&v42);
  objc_destroyWeak(&v44);

  objc_destroyWeak(&v48);
  objc_destroyWeak(location);
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (xpc_activity_should_defer(v3))
    {
      if (xpc_activity_set_state(v3, 3)) {
        goto LABEL_14;
      }
      id v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v13 = v5;
        _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", buf, 0xCu);
      }
    }
    int v7 = [WeakRetained clientDB];
    uint64_t v8 = [v7 serialQueue];

    if (v8)
    {
      if (xpc_activity_get_state(v3) == 2)
      {
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_170;
        block[3] = &unk_1E6993698;
        void block[4] = WeakRetained;
        dispatch_sync(v8, block);
        if (!xpc_activity_set_state(v3, 5))
        {
          int v9 = brc_bread_crumbs();
          uint64_t v10 = brc_default_log();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412290;
            id v13 = v9;
            _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to set the xpc state to done%@", buf, 0xCu);
          }
        }
      }
    }
  }
LABEL_14:
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_170(uint64_t a1)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = +[BRCAccountsManager sharedManager];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 104) acAccountID];
  id v31 = [v2 personaIdentifierForACAccountID:v3];

  if ([v31 isEqualToString:@"__defaultPersonaID__"]) {
    id v4 = 0;
  }
  else {
    id v4 = v31;
  }
  id v5 = v4;
  id v33 = v31;
  if (!v5)
  {
    if (_block_invoke___personaOnceToken_3 != -1) {
      dispatch_once(&_block_invoke___personaOnceToken_3, &__block_literal_global_175_0);
    }
    id v33 = (id)_block_invoke___personalPersona_3;
  }
  id v6 = [MEMORY[0x1E4FB36F8] sharedManager];
  __int16 v32 = [v6 currentPersona];

  id v39 = 0;
  id v7 = [v32 userPersonaUniqueString];
  uint64_t v30 = v7;
  if (v7 == v33 || (objc_msgSend(v7, "isEqualToString:") & 1) != 0) {
    goto LABEL_10;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v38 = 0;
    uint64_t v20 = (void *)[v32 copyCurrentPersonaContextWithError:&v38];
    id v21 = v38;
    id v22 = v39;
    id v39 = v20;

    if (v21)
    {
      long long v23 = brc_bread_crumbs();
      id v24 = brc_default_log();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
        -[BRCContainerScheduler syncContextDidBecomeForeground:]((uint64_t)v21);
      }
    }
    int v29 = [v32 generateAndRestorePersonaContextWithPersonaUniqueString:v33];

    if (!v29)
    {
LABEL_10:
      int v29 = 0;
      goto LABEL_11;
    }
    id v25 = brc_bread_crumbs();
    __int16 v26 = brc_default_log();
    if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v42 = v31;
      __int16 v43 = 2112;
      id v44 = v29;
      __int16 v45 = 2112;
      id v46 = v25;
      _os_log_error_impl(&dword_1D353B000, v26, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
    }
    goto LABEL_39;
  }
  if (!v5 && ([v32 isDataSeparatedPersona] & 1) == 0)
  {
    id v25 = brc_bread_crumbs();
    __int16 v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      __br_notify_register_dispatch_block_invoke_cold_4();
    }
    int v29 = 0;
LABEL_39:

    goto LABEL_11;
  }
  id v27 = brc_bread_crumbs();
  __int16 v28 = brc_default_log();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
    __br_notify_register_dispatch_block_invoke_cold_3();
  }

  int v29 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
LABEL_11:
  uint64_t v8 = brc_bread_crumbs();
  int v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_170_cold_1();
  }

  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  uint64_t v10 = [*(id *)(a1 + 32) foldersNeedingTransmogrifyEnumerator];
  uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v35 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        uint64_t v15 = (void *)MEMORY[0x1D9438760]();
        id v16 = brc_bread_crumbs();
        id v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v42 = v14;
          __int16 v43 = 2112;
          id v44 = v16;
          _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Scheduling directory transmogrify at startup for %@%@", buf, 0x16u);
        }

        id v18 = [*(id *)(a1 + 32) itemTransmogrifier];
        id v19 = [v14 asDirectory];
        [v18 scheduleBouncedDirectoryRename:v19];
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v34 objects:v40 count:16];
    }
    while (v11);
  }

  _BRRestorePersona();
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_2()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)_block_invoke___personalPersona_3;
  _block_invoke___personalPersona_3 = v0;
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_181(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    if (xpc_activity_should_defer(v3))
    {
      if (xpc_activity_set_state(v3, 3)) {
        goto LABEL_23;
      }
      id v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v32 = v5;
        _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", buf, 0xCu);
      }
    }
    if (xpc_activity_get_state(v3) == 2)
    {
      if (!xpc_activity_set_state(v3, 4))
      {
        id v7 = brc_bread_crumbs();
        uint64_t v8 = brc_default_log();
        if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
          __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_181_cold_4();
        }
      }
      int v9 = +[BRCAccountsManager sharedManager];
      uint64_t v10 = [WeakRetained[13] acAccountID];
      uint64_t v11 = [v9 personaIdentifierForACAccountID:v10];

      if ([v11 isEqualToString:@"__defaultPersonaID__"]) {
        uint64_t v12 = 0;
      }
      else {
        uint64_t v12 = v11;
      }
      id v13 = v12;
      id v14 = v11;
      if (!v13)
      {
        if (_block_invoke_2___personaOnceToken_0 != -1) {
          dispatch_once(&_block_invoke_2___personaOnceToken_0, &__block_literal_global_184);
        }
        id v14 = (id)_block_invoke_2___personalPersona_0;
      }
      uint64_t v15 = [MEMORY[0x1E4FB36F8] sharedManager];
      id v16 = [v15 currentPersona];

      id v30 = 0;
      id v17 = [v16 userPersonaUniqueString];
      id v18 = v17;
      if (v17 == v14 || ([v17 isEqualToString:v14] & 1) != 0)
      {
        id v19 = 0;
      }
      else
      {
        if (voucher_process_can_use_arbitrary_personas())
        {
          id v29 = 0;
          uint64_t v20 = (void *)[v16 copyCurrentPersonaContextWithError:&v29];
          id v21 = v29;
          id v22 = v30;
          id v30 = v20;

          if (v21)
          {
            long long v23 = brc_bread_crumbs();
            id v24 = brc_default_log();
            if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
              -[BRCContainerScheduler syncContextDidBecomeForeground:]((uint64_t)v21);
            }
          }
          id v19 = [v16 generateAndRestorePersonaContextWithPersonaUniqueString:v14];

          if (!v19) {
            goto LABEL_22;
          }
          id v25 = brc_bread_crumbs();
          __int16 v26 = brc_default_log();
          if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            __int16 v32 = v11;
            __int16 v33 = 2112;
            long long v34 = v19;
            __int16 v35 = 2112;
            long long v36 = v25;
            _os_log_error_impl(&dword_1D353B000, v26, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
          }
        }
        else
        {
          if (v13 || ([v16 isDataSeparatedPersona] & 1) != 0)
          {
            id v27 = brc_bread_crumbs();
            __int16 v28 = brc_default_log();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
              __br_notify_register_dispatch_block_invoke_cold_3();
            }

            id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
            goto LABEL_22;
          }
          id v25 = brc_bread_crumbs();
          __int16 v26 = brc_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
            __br_notify_register_dispatch_block_invoke_cold_4();
          }
          id v19 = 0;
        }
      }
LABEL_22:
      [WeakRetained _pcsChainAllItemsWithActivity:v3];

      _BRRestorePersona();
    }
  }
LABEL_23:
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_182()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)_block_invoke_2___personalPersona_0;
  _block_invoke_2___personalPersona_0 = v0;
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_188(uint64_t a1, void *a2)
{
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained && xpc_activity_get_state((xpc_activity_t)v3) == 2)
  {
    id v5 = WeakRetained[6];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_2_189;
    v6[3] = &unk_1E6993628;
    v6[4] = WeakRetained;
    id v7 = v3;
    dispatch_async_and_wait(v5, v6);
  }
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_2_189(uint64_t a1)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v2 = +[BRCAccountsManager sharedManager];
  id v3 = [*(id *)(*(void *)(a1 + 32) + 104) acAccountID];
  id v4 = [v2 personaIdentifierForACAccountID:v3];

  if ([v4 isEqualToString:@"__defaultPersonaID__"]) {
    id v5 = 0;
  }
  else {
    id v5 = v4;
  }
  id v6 = v5;
  id v7 = v4;
  if (!v6)
  {
    if (_block_invoke_3___personaOnceToken_0 != -1) {
      dispatch_once(&_block_invoke_3___personaOnceToken_0, &__block_literal_global_191);
    }
    id v7 = (id)_block_invoke_3___personalPersona_0;
  }
  uint64_t v8 = [MEMORY[0x1E4FB36F8] sharedManager];
  int v9 = [v8 currentPersona];

  id v28 = 0;
  id v10 = [v9 userPersonaUniqueString];
  uint64_t v11 = v10;
  if (v10 == v7 || ([v10 isEqualToString:v7] & 1) != 0)
  {
    uint64_t v12 = 0;
    goto LABEL_11;
  }
  if (voucher_process_can_use_arbitrary_personas())
  {
    id v27 = 0;
    id v16 = (void *)[v9 copyCurrentPersonaContextWithError:&v27];
    id v17 = v27;
    id v18 = v28;
    id v28 = v16;

    if (v17)
    {
      id v19 = brc_bread_crumbs();
      uint64_t v20 = brc_default_log();
      if (os_log_type_enabled(v20, (os_log_type_t)0x90u)) {
        -[BRCContainerScheduler syncContextDidBecomeForeground:]((uint64_t)v17);
      }
    }
    uint64_t v12 = [v9 generateAndRestorePersonaContextWithPersonaUniqueString:v7];

    if (v12)
    {
      id v21 = brc_bread_crumbs();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
      {
        *(_DWORD *)buf = 138412802;
        id v30 = v4;
        __int16 v31 = 2112;
        __int16 v32 = v12;
        __int16 v33 = 2112;
        long long v34 = v21;
        _os_log_error_impl(&dword_1D353B000, v22, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
      }
LABEL_32:
    }
  }
  else
  {
    if (!v6 && ([v9 isDataSeparatedPersona] & 1) == 0)
    {
      id v21 = brc_bread_crumbs();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        __br_notify_register_dispatch_block_invoke_cold_4();
      }
      uint64_t v12 = 0;
      goto LABEL_32;
    }
    long long v23 = brc_bread_crumbs();
    id v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      __br_notify_register_dispatch_block_invoke_cold_3();
    }

    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
  }
LABEL_11:
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 40), 4))
  {
    id v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v13;
      _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't continue activity%@", buf, 0xCu);
    }
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_192;
  uint64_t v25[3] = &unk_1E69990D8;
  uint64_t v15 = *(void **)(a1 + 32);
  id v26 = *(id *)(a1 + 40);
  [v15 _recoverAndReportStateIntegrityWithCompletion:v25];

  _BRRestorePersona();
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_3()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)_block_invoke_3___personalPersona_0;
  _block_invoke_3___personalPersona_0 = v0;
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_192(uint64_t a1)
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  if (!xpc_activity_set_state(*(xpc_activity_t *)(a1 + 32), 5))
  {
    uint64_t v1 = brc_bread_crumbs();
    id v2 = brc_default_log();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
    {
      int v3 = 138412290;
      id v4 = v1;
      _os_log_impl(&dword_1D353B000, v2, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't finish activity%@", (uint8_t *)&v3, 0xCu);
    }
  }
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_197(uint64_t a1, void *a2)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int v3 = a2;
  if ([*(id *)(a1 + 32) finishSaltingPartiallySaltedDirectories])
  {
    id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 40));
    if (WeakRetained)
    {
      if (xpc_activity_should_defer(v3))
      {
        if (xpc_activity_set_state(v3, 3)) {
          goto LABEL_24;
        }
        uint64_t v5 = brc_bread_crumbs();
        id v6 = brc_default_log();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v32 = v5;
          _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to defer the state%@", buf, 0xCu);
        }
      }
      if (xpc_activity_get_state(v3) == 2)
      {
        if (!xpc_activity_set_state(v3, 4))
        {
          id v7 = brc_bread_crumbs();
          uint64_t v8 = brc_default_log();
          if (os_log_type_enabled(v8, (os_log_type_t)0x90u)) {
            __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_197_cold_4();
          }
        }
        int v9 = +[BRCAccountsManager sharedManager];
        id v10 = [WeakRetained[13] acAccountID];
        uint64_t v11 = [v9 personaIdentifierForACAccountID:v10];

        if ([v11 isEqualToString:@"__defaultPersonaID__"]) {
          uint64_t v12 = 0;
        }
        else {
          uint64_t v12 = v11;
        }
        id v13 = v12;
        id v14 = v11;
        if (!v13)
        {
          if (_block_invoke_4___personaOnceToken != -1) {
            dispatch_once(&_block_invoke_4___personaOnceToken, &__block_literal_global_200_0);
          }
          id v14 = (id)_block_invoke_4___personalPersona;
        }
        uint64_t v15 = [MEMORY[0x1E4FB36F8] sharedManager];
        id v16 = [v15 currentPersona];

        id v30 = 0;
        id v17 = [v16 userPersonaUniqueString];
        id v18 = v17;
        if (v17 == v14 || ([v17 isEqualToString:v14] & 1) != 0)
        {
          id v19 = 0;
        }
        else
        {
          if (voucher_process_can_use_arbitrary_personas())
          {
            id v29 = 0;
            uint64_t v20 = (void *)[v16 copyCurrentPersonaContextWithError:&v29];
            id v21 = v29;
            id v22 = v30;
            id v30 = v20;

            if (v21)
            {
              long long v23 = brc_bread_crumbs();
              id v24 = brc_default_log();
              if (os_log_type_enabled(v24, (os_log_type_t)0x90u)) {
                -[BRCContainerScheduler syncContextDidBecomeForeground:]((uint64_t)v21);
              }
            }
            id v19 = [v16 generateAndRestorePersonaContextWithPersonaUniqueString:v14];

            if (!v19) {
              goto LABEL_23;
            }
            id v25 = brc_bread_crumbs();
            id v26 = brc_default_log();
            if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              __int16 v32 = v11;
              __int16 v33 = 2112;
              long long v34 = v19;
              __int16 v35 = 2112;
              long long v36 = v25;
              _os_log_error_impl(&dword_1D353B000, v26, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
            }
          }
          else
          {
            if (v13 || ([v16 isDataSeparatedPersona] & 1) != 0)
            {
              id v27 = brc_bread_crumbs();
              id v28 = brc_default_log();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
                __br_notify_register_dispatch_block_invoke_cold_3();
              }

              id v19 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
              goto LABEL_23;
            }
            id v25 = brc_bread_crumbs();
            id v26 = brc_default_log();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
              __br_notify_register_dispatch_block_invoke_cold_4();
            }
            id v19 = 0;
          }
        }
LABEL_23:
        [WeakRetained _saltPartiallySaltedItemsWithActivity:v3];

        _BRRestorePersona();
      }
    }
LABEL_24:
  }
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_198()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  uint64_t v1 = (void *)_block_invoke_4___personalPersona;
  _block_invoke_4___personalPersona = v0;
}

- (void)_fixupItemsAtStartup
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx fixing up items%@");
}

uint64_t __41__BRCAccountSession__fixupItemsAtStartup__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = [v3 clientZone];
  uint64_t v5 = [v3 changeState];
  char v6 = [v5 hasNeverSyncedDown];

  if ((v6 & 1) == 0)
  {
    id v7 = [v3 changeState];
    unint64_t v8 = [v7 clientRequestID];

    unint64_t v9 = [v4 currentRequestID];
    if (v8 >= v9)
    {
      unint64_t v10 = v9;
      uint64_t v11 = brc_bread_crumbs();
      uint64_t v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        id v16 = [v4 mangledID];
        int v17 = 138413058;
        id v18 = v16;
        __int16 v19 = 2048;
        unint64_t v20 = v8;
        __int16 v21 = 2048;
        unint64_t v22 = v10;
        __int16 v23 = 2112;
        id v24 = v11;
        _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Will acknowledge the last sync down again for %@ (server:%lld, client:%lld)%@", (uint8_t *)&v17, 0x2Au);
      }
      [*(id *)(a1 + 32) addObject:v3];
    }
  }
  id v13 = *(void **)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  id v14 = [v4 mangledID];
  LODWORD(v13) = [v13 mangledIDIsPendingMigration:v14];

  if (v13)
  {
    [*(id *)(a1 + 32) addObject:v3];
    [*(id *)(a1 + 40) addObject:v4];
  }

  return 1;
}

uint64_t __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_203(uint64_t a1, void *a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * v8);
        v11[0] = MEMORY[0x1E4F143A8];
        v11[1] = 3221225472;
        v11[2] = __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2;
        v11[3] = &unk_1E6993A60;
        void v11[4] = v9;
        [v3 performWithFlags:8 action:v11];
        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [*(id *)(*(void *)(a1 + 40) + 184) nextRank];
  return 1;
}

uint64_t __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) allocateRanksWhenCaughtUp:1];
}

uint64_t __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_3(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v16;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v16 != v5) {
          objc_enumerationMutation(v3);
        }
        uint64_t v7 = *(void **)(*((void *)&v15 + 1) + 8 * v6);
        memset(v14, 0, sizeof(v14));
        __brc_create_section(0, (uint64_t)"-[BRCAccountSession _fixupItemsAtStartup]_block_invoke_3", 2012, v14);
        uint64_t v8 = brc_bread_crumbs();
        uint64_t v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 134218498;
          uint64_t v20 = v14[0];
          __int16 v21 = 2112;
          unint64_t v22 = v7;
          __int16 v23 = 2112;
          id v24 = v8;
          _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Acknowledge the last sync down again for %@%@", buf, 0x20u);
        }

        unint64_t v10 = *(void **)(*(void *)(a1 + 40) + 608);
        uint64_t v11 = [v7 changeState];
        objc_msgSend(v10, "didSyncDownZone:requestID:upToRank:caughtUpWithServer:", v7, objc_msgSend(v11, "clientRequestID"), *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), 0);

        __brc_leave_section(v14);
        ++v6;
      }
      while (v4 != v6);
      uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v25 count:16];
    }
    while (v4);
  }

  return 1;
}

uint64_t __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_204(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 state] & 2) != 0) {
    [*(id *)(a1 + 32) addObject:v3];
  }

  return 1;
}

void __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2_206(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _fixupItemsAtStartup]_block_invoke_2", 2037, v17);
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2_206_cold_1();
  }

  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = *(id *)(a1 + 32);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v7++) scheduleSyncDown];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v5);
  }

  uint64_t v8 = *(void **)(a1 + 40);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_207;
  v12[3] = &unk_1E6999178;
  uint64_t v9 = *(void *)(a1 + 56);
  v12[4] = v8;
  v12[5] = v9;
  [v8 enumerateServerZones:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2_208;
  v11[3] = &unk_1E6996308;
  unint64_t v10 = *(void **)(a1 + 48);
  void v11[4] = *(void *)(a1 + 40);
  [v10 groupInBatch:v11];
  __brc_leave_section(v17);
}

uint64_t __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_207(uint64_t a1, void *a2)
{
  id v3 = a2;
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) rescheduleSuspendedJobsMatching:v3 inState:26];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) rescheduleSuspendedJobsMatching:v3 inState:29];
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) rescheduleSuspendedJobsMatching:v3 inState:16];
  if ([v3 hasFetchedRecentsAndFavorites])
  {
    [*(id *)(*(void *)(a1 + 32) + 624) rescheduleJobsPendingRecentsAndFavoritesFetchInZone:v3];
    [*(id *)(*(void *)(a1 + 32) + 632) rescheduleJobsPendingRecentsAndFavoritesFetchInZone:v3];
  }
  if ([v3 isSharedZone])
  {
    id v4 = [v3 clientZone];
    uint64_t v5 = [v4 asSharedClientZone];
    [v5 removeAllShareAcceptationSidefaults];
  }
  return 1;
}

void __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2_208(uint64_t a1, void *a2)
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v56 = a2;
  long long v75 = 0u;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  uint64_t v59 = a1;
  id obj = [*(id *)(a1 + 32) bouncedItemsEnumerator];
  uint64_t v3 = [obj countByEnumeratingWithState:&v75 objects:v86 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v76;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v76 != v5) {
          objc_enumerationMutation(obj);
        }
        uint64_t v7 = *(void **)(*((void *)&v75 + 1) + 8 * i);
        uint64_t v8 = (void *)MEMORY[0x1D9438760]();
        uint64_t v9 = [[BRCItemToPathLookup alloc] initWithItem:v7];
        unint64_t v10 = [(BRCItemToPathLookup *)v9 byPath];
        uint64_t v11 = [(BRCItemToPathLookup *)v9 byFileSystemID];
        long long v12 = (void *)v11;
        if (v10) {
          BOOL v13 = v10 == (void *)v11;
        }
        else {
          BOOL v13 = 0;
        }
        if (v13)
        {
          long long v16 = brc_bread_crumbs();
          long long v17 = brc_default_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v83 = v7;
            __int16 v84 = 2112;
            __int16 v85 = v16;
            _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] fixing up %@ by marking bounce finished%@", buf, 0x16u);
          }

          [v7 markBounceFinished];
        }
        else
        {
          long long v14 = brc_bread_crumbs();
          long long v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            __int16 v83 = v7;
            __int16 v84 = 2112;
            __int16 v85 = v14;
            _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] fixing up %@ by marking bounce failed%@", buf, 0x16u);
          }

          [v7 markBounceFailed];
        }
        [v7 saveToDB];
        [(BRCItemToPathLookup *)v9 closePaths];
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v75 objects:v86 count:16];
    }
    while (v4);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  long long v18 = [*(id *)(v59 + 32) stagedItemsEnumerator];
  uint64_t v19 = [v18 countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v72;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v72 != v21) {
          objc_enumerationMutation(v18);
        }
        __int16 v23 = *(void **)(*((void *)&v71 + 1) + 8 * j);
        id v24 = (void *)MEMORY[0x1D9438760]();
        [v23 fixupStagedItemAtStartup];
      }
      uint64_t v20 = [v18 countByEnumeratingWithState:&v71 objects:v81 count:16];
    }
    while (v20);
  }

  uint64_t v25 = (void *)[*(id *)(*(void *)(v59 + 32) + 144) fetch:@"SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_doc_id, ci.item_file_id, ci.item_generation, ci.item_localname, ci.item_processing_stamp, ci.item_staged_file_id, ci.item_staged_generation, ci.item_bouncedname, ci.item_scope, ci.item_tmpbounceno, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.desired_version, ci.item_live_conflict_loser_etags, ci.item_thumb_live_signature, ci.item_thumb_greedy, ci.version_block_sync_until_bundle_id, ci.version_block_sync_until_timestamp FROM client_items AS ci WHERE ci.item_localsyncupstate = 4 AND item_min_supported_os_rowid IS NULL AND NOT EXISTS (SELECT 1 FROM client_sync_up AS su WHERE su.throttle_id = ci.rowid AND su.throttle_state != 0)"];
  long long v67 = 0u;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_213;
  v66[3] = &unk_1E6994120;
  v66[4] = *(void *)(v59 + 32);
  int v57 = v25;
  uint64_t v26 = [v25 enumerateObjects:v66];
  uint64_t v27 = [v26 countByEnumeratingWithState:&v67 objects:v80 count:16];
  if (v27)
  {
    uint64_t v28 = v27;
    char v29 = 0;
    uint64_t v30 = *(void *)v68;
    do
    {
      for (uint64_t k = 0; k != v28; ++k)
      {
        if (*(void *)v68 != v30) {
          objc_enumerationMutation(v26);
        }
        __int16 v32 = *(void **)(*((void *)&v67 + 1) + 8 * k);
        __int16 v33 = (void *)MEMORY[0x1D9438760]();
        long long v34 = brc_bread_crumbs();
        __int16 v35 = brc_default_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v83 = v32;
          __int16 v84 = 2112;
          __int16 v85 = v34;
          _os_log_fault_impl(&dword_1D353B000, v35, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ is missing a sync up throttle%@", buf, 0x16u);
        }

        long long v36 = [v32 clientZone];
        uint64_t v37 = [v36 dbRowID];
        [v32 markLatestSyncRequestFailedInZone:v37];

        if ([v32 isSharedToMeChildItem])
        {
          [v32 markLatestSyncRequestFailedInZone:&unk_1F2B27108];
          [*(id *)(*(void *)(v59 + 32) + 600) scheduleSyncUpForSideCar];
          char v29 = 1;
        }
        if ([v32 isSharedToMeTopLevelItem])
        {
          id v38 = [v32 parentClientZone];
          id v39 = [v38 dbRowID];
          [v32 markLatestSyncRequestFailedInZone:v39];
        }
        [v32 saveToDB];
      }
      uint64_t v28 = [v26 countByEnumeratingWithState:&v67 objects:v80 count:16];
    }
    while (v28);
  }
  else
  {
    char v29 = 0;
  }

  char v40 = (void *)[*(id *)(*(void *)(v59 + 32) + 144) fetch:@"SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_doc_id, ci.item_file_id, ci.item_generation, ci.item_localname, ci.item_processing_stamp, ci.item_staged_file_id, ci.item_staged_generation, ci.item_bouncedname, ci.item_scope, ci.item_tmpbounceno, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.desired_version, ci.item_live_conflict_loser_etags, ci.item_thumb_live_signature, ci.item_thumb_greedy, ci.version_block_sync_until_bundle_id, ci.version_block_sync_until_timestamp FROM client_items AS ci LEFT JOIN client_sync_up AS su ON su.throttle_id = ci.rowid AND su.zone_rowid = ci.zone_rowid LEFT JOIN client_uploads AS cu ON cu.throttle_id = ci.rowid AND cu.zone_rowid = ci.zone_rowid WHERE ci.item_localsyncupstate = 3 AND ci.item_type IN (1, 6) AND (IFNULL(cu.throttle_state, 0) = 0 OR (cu.throttle_state = 31 AND IFNULL(su.throttle_state, 0) = 0))"];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  v61[0] = MEMORY[0x1E4F143A8];
  v61[1] = 3221225472;
  v61[2] = __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_218;
  v61[3] = &unk_1E6994120;
  v61[4] = *(void *)(v59 + 32);
  int v58 = v40;
  id v41 = [v40 enumerateObjects:v61];
  uint64_t v42 = [v41 countByEnumeratingWithState:&v62 objects:v79 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v63;
    do
    {
      for (uint64_t m = 0; m != v43; ++m)
      {
        if (*(void *)v63 != v44) {
          objc_enumerationMutation(v41);
        }
        id v46 = *(void **)(*((void *)&v62 + 1) + 8 * m);
        uint64_t v47 = (void *)MEMORY[0x1D9438760]();
        id v48 = brc_bread_crumbs();
        int v49 = brc_default_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v83 = v46;
          __int16 v84 = 2112;
          __int16 v85 = v48;
          _os_log_fault_impl(&dword_1D353B000, v49, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ has a corrupt upload throttle%@", buf, 0x16u);
        }

        int v50 = [v46 asDocument];
        [v50 markNeedsReading];

        [v46 saveToDB];
      }
      uint64_t v43 = [v41 countByEnumeratingWithState:&v62 objects:v79 count:16];
    }
    while (v43);
  }

  if ((v29 & 1) == 0)
  {
    int v51 = [*(id *)(*(void *)(v59 + 32) + 600) sideCarSyncPersistedState];
    char v52 = [v51 needsSync];

    if ((v52 & 1) == 0)
    {
      int v53 = (void *)[*(id *)(*(void *)(v59 + 32) + 144) numberWithSQL:@"SELECT throttle_id FROM client_sync_up WHERE zone_rowid = %@ AND throttle_state != 0", &unk_1F2B27108];
      if ([v53 BOOLValue])
      {
        int v54 = brc_bread_crumbs();
        char v55 = brc_default_log();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_FAULT)) {
          __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2_208_cold_1((uint64_t)v53);
        }

        [*(id *)(*(void *)(v59 + 32) + 600) scheduleSyncUpForSideCar];
      }
    }
  }
}

id __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_213(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

id __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_218(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  uint64_t v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (void)resumeIfNecessary
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: qos_class_self() == QOS_CLASS_UTILITY%@", v2, v3, v4, v5, v6);
}

uint64_t __38__BRCAccountSession_resumeIfNecessary__block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 672) maxNotifRankWasFlushed];
}

- (void)invalidateAccountStatus
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_accountIsReady = 0;
  objc_sync_exit(obj);
}

- (BRCAccountWaitOperation)accountWaitOperation
{
  uint64_t v2 = self;
  objc_sync_enter(v2);
  if (v2->_accountIsReady)
  {
    uint64_t v3 = 0;
  }
  else
  {
    accountWaitOperatiouint64_t n = v2->_accountWaitOperation;
    if (!accountWaitOperation)
    {
      uint64_t v5 = [(BRCAccountSession *)v2 syncContextProvider];
      uint8_t v6 = [v5 defaultSyncContext];
      uint64_t v7 = [v6 ckContainer];

      uint64_t v8 = [[BRCAccountWaitOperation alloc] initWithCKContainer:v7];
      uint64_t v9 = v2->_accountWaitOperation;
      v2->_accountWaitOperatiouint64_t n = v8;

      objc_initWeak(&location, v2);
      unint64_t v10 = [(BRCAccountSession *)v2 syncClientZoneErrorThrottle];
      [(_BRCOperation *)v2->_accountWaitOperation setOperationFailureThrottle:v10];

      uint64_t v11 = [(_BRCOperation *)v2->_accountWaitOperation operationFailureThrottle];

      if (!v11)
      {
        long long v15 = brc_bread_crumbs();
        long long v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
          -[BRCAccountSession accountWaitOperation]();
        }
      }
      uint64_t v17 = MEMORY[0x1E4F143A8];
      uint64_t v18 = 3221225472;
      uint64_t v19 = __41__BRCAccountSession_accountWaitOperation__block_invoke;
      uint64_t v20 = &unk_1E6997918;
      objc_copyWeak(&v21, &location);
      [(_BRCOperation *)v2->_accountWaitOperation setFinishBlock:&v17];
      long long v12 = objc_msgSend(v7, "privateCloudDatabase", v17, v18, v19, v20);
      BOOL v13 = [v12 operationQueue];
      [v13 addOperation:v2->_accountWaitOperation];

      objc_destroyWeak(&v21);
      objc_destroyWeak(&location);

      accountWaitOperatiouint64_t n = v2->_accountWaitOperation;
    }
    uint64_t v3 = accountWaitOperation;
  }
  objc_sync_exit(v2);

  return v3;
}

void __41__BRCAccountSession_accountWaitOperation__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  if (WeakRetained)
  {
    id v4 = WeakRetained;
    id v2 = WeakRetained;
    objc_sync_enter(v2);
    *((unsigned char *)v2 + 521) = 1;
    uint64_t v3 = (void *)*((void *)v2 + 66);
    *((void *)v2 + 66) = 0;

    objc_sync_exit(v2);
    id WeakRetained = v4;
  }
}

- (id)fetchAccountWaitOperationWithAccountReady:(BOOL *)a3
{
  id v4 = self;
  objc_sync_enter(v4);
  if (a3) {
    *a3 = v4->_accountIsReady;
  }
  if (v4->_accountIsReady) {
    uint64_t v5 = 0;
  }
  else {
    uint64_t v5 = v4->_accountWaitOperation;
  }
  objc_sync_exit(v4);

  return v5;
}

- (void)captureSessionOpenFailedInfoWithError:(id)a3
{
  v23[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(NSString, "br_accountSessionOpenErrorInfoPath");
  unint64_t v22 = @"Error";
  uint64_t v5 = v3;
  if (!v3)
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorAccountSessionOpenFailed");
  }
  v23[0] = v5;
  uint8_t v6 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:1];
  if (!v3) {

  }
  id v15 = 0;
  uint64_t v7 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v6 requiringSecureCoding:1 error:&v15];
  id v8 = v15;
  if (!v7)
  {
    uint64_t v9 = brc_bread_crumbs();
    unint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v6;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      _os_log_fault_impl(&dword_1D353B000, v10, OS_LOG_TYPE_FAULT, "[CRIT] Failed to encode session open failed info %@: %@%@", buf, 0x20u);
    }
  }
  uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
  int v12 = [v11 createFileAtPath:v4 contents:v7 attributes:0];

  if (v12)
  {
    BOOL v13 = brc_bread_crumbs();
    long long v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v17 = v4;
      __int16 v18 = 2112;
      id v19 = v6;
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] Successfully created %@ - with data - %@%@", buf, 0x20u);
    }
  }
  else
  {
    BOOL v13 = brc_bread_crumbs();
    long long v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSession captureSessionOpenFailedInfoWithError:]((uint64_t)v4);
    }
  }
}

- (void)captureDBCorruptionInfoWithDescription:(id)a3 error:(id)a4
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ((objc_msgSend(v6, "br_isCloudDocsErrorCode:", 99) & 1) == 0)
  {
    uint64_t v7 = objc_msgSend(NSString, "br_corruptedDBInfoPath");
    if (objc_msgSend(v6, "br_isCloudDocsErrorCode:", 100))
    {
      uint64_t v8 = objc_msgSend(NSString, "br_reimportDomainErrorInfoPath");

      uint64_t v7 = (void *)v8;
    }
    v26[0] = @"Description";
    v26[1] = @"Error";
    v27[0] = v5;
    uint64_t v9 = v6;
    if (!v6)
    {
      uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorCorruptedDB");
    }
    v27[1] = v9;
    unint64_t v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v27 forKeys:v26 count:2];
    if (!v6) {

    }
    id v19 = 0;
    uint64_t v11 = [MEMORY[0x1E4F28DB0] archivedDataWithRootObject:v10 requiringSecureCoding:1 error:&v19];
    id v12 = v19;
    if (!v11)
    {
      BOOL v13 = brc_bread_crumbs();
      long long v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v21 = v10;
        __int16 v22 = 2112;
        id v23 = v12;
        __int16 v24 = 2112;
        uint64_t v25 = v13;
        _os_log_fault_impl(&dword_1D353B000, v14, OS_LOG_TYPE_FAULT, "[CRIT] Failed to encode corruption info %@: %@%@", buf, 0x20u);
      }
    }
    id v15 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v16 = [v15 createFileAtPath:v7 contents:v11 attributes:0];

    if (v16)
    {
      uint64_t v17 = brc_bread_crumbs();
      __int16 v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        id v21 = v7;
        __int16 v22 = 2112;
        id v23 = v10;
        __int16 v24 = 2112;
        uint64_t v25 = v17;
        _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Successfully created %@ - with data - %@%@", buf, 0x20u);
      }
    }
    else
    {
      uint64_t v17 = brc_bread_crumbs();
      __int16 v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountSession captureSessionOpenFailedInfoWithError:]((uint64_t)v7);
      }
    }
  }
}

- (void)close
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx cancelling _defaultScheduler...%@");
}

uint64_t __26__BRCAccountSession_close__block_invoke(uint64_t a1, uint64_t a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  memset(v10, 0, sizeof(v10));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession close]_block_invoke", 2467, v10);
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v12 = v10[0];
    __int16 v13 = 2048;
    uint64_t v14 = a2;
    __int16 v15 = 2112;
    int v16 = v4;
    _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cancelling fs-events monitor of type: %lu%@", buf, 0x20u);
  }

  id v6 = *(void **)(*(void *)(a1 + 32) + 448);
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a2];
  uint64_t v8 = [v6 objectForKeyedSubscript:v7];
  [v8 cancel];

  __brc_leave_section(v10);
  return 1;
}

uint64_t __26__BRCAccountSession_close__block_invoke_232(uint64_t a1)
{
  return [*(id *)(a1 + 32) close];
}

uint64_t __26__BRCAccountSession_close__block_invoke_2(uint64_t a1, uint64_t a2)
{
  if (([*(id *)(a1 + 32) hasRootForSyncedFolderType:a2] & 1) == 0)
  {
    id v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __26__BRCAccountSession_close__block_invoke_2_cold_1();
    }
  }
  id v4 = [*(id *)(a1 + 32) rootForSyncedFolderType:a2];
  [v4 close];

  return 1;
}

uint64_t __26__BRCAccountSession_close__block_invoke_234(uint64_t a1, void *a2)
{
  return 1;
}

- (void)closeAndResetLocalStateWithDescription:(id)a3 error:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  memset(v17, 0, sizeof(v17));
  __brc_create_section(1, (uint64_t)"-[BRCAccountSession closeAndResetLocalStateWithDescription:error:]", 2671, v17);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v19 = v17[0];
    __int16 v20 = 2112;
    id v21 = self;
    __int16 v22 = 2112;
    id v23 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@ - Resetting local state%@", buf, 0x20u);
  }

  clientDB = self->_clientDB;
  uint64_t v11 = self->_accountHandler;
  if (!self->_resumed)
  {
    resetQueue = self->_resetQueue;
    if (resetQueue)
    {
      dispatch_resume(resetQueue);
      __int16 v15 = self->_resetQueue;
    }
    else
    {
      __int16 v15 = 0;
    }
    self->_resetQueue = 0;

    if (!clientDB) {
      goto LABEL_13;
    }
    goto LABEL_12;
  }
  if (clientDB)
  {
LABEL_12:
    [(BRCAccountSession *)self close];
    goto LABEL_13;
  }
  uint64_t v12 = brc_bread_crumbs();
  __int16 v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    -[BRCAccountSession closeAndResetLocalStateWithDescription:error:]();
  }

LABEL_13:
  [(BRCAccountSession *)self stopDBWatcher];
  [(BRCAccountSession *)self captureDBCorruptionInfoWithDescription:v6 error:v7];
  BRCRecursiveRemove(self->_cacheDirPath);
  BRCRecursiveRemoveBelow(self->_sessionDirPath);
  if (!clientDB) {
    [(BRCAccountSession *)self close];
  }
  self->_BOOL isCancelled = 0;
  accountHandler = self->_accountHandler;
  self->_accountHandler = v11;

  __brc_leave_section(v17);
}

- (void)_validatePersona
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v4 = brc_append_system_info_to_message();
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8_0(&dword_1D353B000, a3, v5, "[CRIT] %@%@", v6);
}

- (BOOL)_recursivelyPrepareFolderForLogOutAtURL:(id)a3 pruneEmptyFolders:(BOOL)a4 pruneEmptyTopLevelFolder:(BOOL)a5 maxDepth:(unint64_t)a6
{
  BOOL v7 = a5;
  BOOL v96 = a4;
  v117[4] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  unint64_t v10 = v9;
  if (a6)
  {
    if (v9)
    {
      BOOL v82 = v7;
      uint64_t v11 = [MEMORY[0x1E4F28CB8] defaultManager];
      uint64_t v12 = +[BRCUserDefaults defaultsForMangledID:0];
      int v13 = [v12 maxRelativePathDepth];

      uint64_t v14 = *MEMORY[0x1E4F1C670];
      uint64_t v86 = *MEMORY[0x1E4F1C628];
      v117[0] = *MEMORY[0x1E4F1C628];
      v117[1] = v14;
      uint64_t v97 = v14;
      uint64_t v15 = *MEMORY[0x1E4F1C680];
      uint64_t v95 = *MEMORY[0x1E4F1C658];
      v117[2] = *MEMORY[0x1E4F1C658];
      v117[3] = v15;
      uint64_t v98 = v15;
      int v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v117 count:4];
      __int16 v83 = v11;
      __int16 v84 = v10;
      uint64_t v17 = [v11 enumeratorAtURL:v10 includingPropertiesForKeys:v16 options:1 errorHandler:&__block_literal_global_243];

      __int16 v18 = +[BRCUserDefaults defaultsForMangledID:0];
      uint64_t v94 = [v18 uploadMaxFileSize];
      __int16 v81 = v18;
      uint64_t v93 = [v18 uploadMaxPkgFileSize];
      long long v108 = 0u;
      long long v109 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      id obj = v17;
      uint64_t v102 = [obj countByEnumeratingWithState:&v108 objects:v116 count:16];
      if (!v102)
      {
        uint64_t v99 = 0;
        goto LABEL_71;
      }
      uint64_t v99 = 0;
      unsigned int v91 = 2 * v13;
      uint64_t v101 = *(void *)v109;
      unint64_t v85 = a6 - 1;
      id v92 = self;
      while (1)
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v109 != v101) {
            objc_enumerationMutation(obj);
          }
          __int16 v20 = *(void **)(*((void *)&v108 + 1) + 8 * v19);
          id v21 = (void *)MEMORY[0x1D9438760]();
          __int16 v22 = +[BRCUserDefaults defaultsForMangledID:0];
          uint64_t v23 = [v22 excludedFilenamesWorthPreserving];

          uint64_t v24 = +[BRCUserDefaults defaultsForMangledID:0];
          uint64_t v25 = [v24 excludedExtensionsWorthPreserving];

          uint64_t v26 = brc_bread_crumbs();
          uint64_t v27 = brc_default_log();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            v113 = v20;
            __int16 v114 = 2112;
            v115 = v26;
            _os_log_debug_impl(&dword_1D353B000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] enumerate URL [%@]%@", buf, 0x16u);
          }

          uint64_t v103 = (void *)v23;
          if (_CFURLIsItemPromiseAtURL())
          {
            uint64_t v28 = brc_bread_crumbs();
            char v29 = brc_default_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v30 = [v20 path];
              *(_DWORD *)buf = 138412546;
              v113 = v30;
              __int16 v114 = 2112;
              v115 = v28;
              __int16 v31 = v29;
              __int16 v32 = "[DEBUG] unlinking %@%@";
              goto LABEL_16;
            }
            goto LABEL_17;
          }
          if (objc_msgSend(v20, "br_isExternalDocumentReference"))
          {
            uint64_t v28 = brc_bread_crumbs();
            char v29 = brc_default_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v30 = [v20 path];
              *(_DWORD *)buf = 138412546;
              v113 = v30;
              __int16 v114 = 2112;
              v115 = v28;
              __int16 v31 = v29;
              __int16 v32 = "[DEBUG] unlinking br security bookmark %@%@";
LABEL_16:
              _os_log_debug_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEBUG, v32, buf, 0x16u);
            }
LABEL_17:

            fileUnlinker = self->_fileUnlinker;
            long long v34 = [v20 path];
            [(BRCFileUnlinker *)fileUnlinker renameAndUnlinkInBackgroundItemAtPath:v34];

            __int16 v35 = 0;
            long long v36 = 0;
            uint64_t v37 = 0;
            id v38 = 0;
            goto LABEL_18;
          }
          id v107 = 0;
          int v39 = [v20 getResourceValue:&v107 forKey:v98 error:0];
          id v40 = v107;
          id v38 = v40;
          if (v39 && [v40 BOOLValue])
          {
            id v41 = brc_bread_crumbs();
            uint64_t v42 = brc_default_log();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
            {
              long long v74 = [v20 path];
              *(_DWORD *)buf = 138412546;
              v113 = v74;
              __int16 v114 = 2112;
              v115 = v41;
              _os_log_debug_impl(&dword_1D353B000, v42, OS_LOG_TYPE_DEBUG, "[DEBUG] unlinking symlink %@%@", buf, 0x16u);
            }
            uint64_t v43 = self->_fileUnlinker;
            uint64_t v44 = [v20 path];
            [(BRCFileUnlinker *)v43 renameAndUnlinkInBackgroundItemAtPath:v44];

            __int16 v35 = 0;
            long long v36 = 0;
            uint64_t v37 = 0;
            goto LABEL_18;
          }
          __int16 v45 = [v20 path];
          int v46 = objc_msgSend(v45, "br_isExcludedButPreservedAtLogOutWithFilenames:extensions:", v23, v25);

          if (v46)
          {
            uint64_t v47 = brc_bread_crumbs();
            id v48 = brc_default_log();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              long long v73 = [v20 path];
              *(_DWORD *)buf = 138412546;
              v113 = v73;
              __int16 v114 = 2112;
              v115 = v47;
              _os_log_debug_impl(&dword_1D353B000, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] keeping preserved item %@%@", buf, 0x16u);
            }
            __int16 v35 = 0;
            long long v36 = 0;
LABEL_29:

            uint64_t v37 = 0;
            goto LABEL_62;
          }
          id v106 = 0;
          int v49 = [v20 getResourceValue:&v106 forKey:v97 error:0];
          id v50 = v106;
          __int16 v35 = v50;
          if (v49 && ([v50 BOOLValue] & 1) != 0)
          {
            long long v36 = 0;
          }
          else
          {
            id v105 = 0;
            int v51 = [v20 getResourceValue:&v105 forKey:v95 error:0];
            id v52 = v105;
            long long v36 = v52;
            if (!v51 || ![v52 BOOLValue]) {
              goto LABEL_41;
            }
          }
          int v53 = [v20 path];
          uint64_t v54 = [v36 BOOLValue];
          if ([v36 BOOLValue]) {
            uint64_t v55 = v93;
          }
          else {
            uint64_t v55 = v94;
          }
          int v56 = objc_msgSend(v53, "br_isDocumentTooLargeForUpload:maxUploadDocumentSize:", v54, v55);

          if (v56)
          {
            uint64_t v47 = brc_bread_crumbs();
            id v48 = brc_default_log();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v87 = [v20 path];
              *(_DWORD *)buf = 138412546;
              v113 = v87;
              __int16 v114 = 2112;
              v115 = v47;
              _os_log_debug_impl(&dword_1D353B000, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] keeping item too large to upload %@%@", buf, 0x16u);
            }
            goto LABEL_29;
          }
LABEL_41:
          if ([v35 BOOLValue] & 1) != 0 || (objc_msgSend(v36, "BOOLValue"))
          {
            uint64_t v37 = 0;
LABEL_44:
            if (v96)
            {
              int v57 = [v20 path];
              int v58 = objc_msgSend(v57, "br_isExcludedWithMaximumDepth:", v91);

              if (v58)
              {
                uint64_t v59 = brc_bread_crumbs();
                long long v60 = brc_default_log();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                {
                  [v20 path];
                  int v61 = v88 = v59;
                  *(_DWORD *)buf = 138412546;
                  v113 = v61;
                  __int16 v114 = 2112;
                  v115 = v88;
                  long long v62 = v60;
                  long long v63 = "[DEBUG] unlinking excluded item %@%@";
                  goto LABEL_59;
                }
                goto LABEL_60;
              }
              id v66 = [v20 lastPathComponent];
              int v67 = [v66 isEqualToString:@".localized"];

              if (v67)
              {
                uint64_t v59 = brc_bread_crumbs();
                long long v60 = brc_default_log();
                if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                {
                  [v20 path];
                  int v61 = v88 = v59;
                  *(_DWORD *)buf = 138412546;
                  v113 = v61;
                  __int16 v114 = 2112;
                  v115 = v88;
                  long long v62 = v60;
                  long long v63 = "[DEBUG] unlinking .localized file %@%@";
                  goto LABEL_59;
                }
                goto LABEL_60;
              }
              long long v68 = [v20 lastPathComponent];
              long long v69 = objc_msgSend(v68, "br_pathExtension");
              int v89 = [v69 isEqualToString:@"app"];

              if (v89)
              {
                long long v70 = [v20 path];
                long long v71 = BRCGetXattrValueForKeyOnPath(v70, @"com.apple.clouddocs.app-uploaded");

                if (v71)
                {
                  uint64_t v59 = brc_bread_crumbs();
                  long long v60 = brc_default_log();
                  if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
                  {
                    [v20 path];
                    int v61 = v88 = v59;
                    *(_DWORD *)buf = 138412546;
                    v113 = v61;
                    __int16 v114 = 2112;
                    v115 = v88;
                    long long v62 = v60;
                    long long v63 = "[DEBUG] unlinking uploaded .app file %@%@";
LABEL_59:
                    _os_log_debug_impl(&dword_1D353B000, v62, OS_LOG_TYPE_DEBUG, v63, buf, 0x16u);

                    uint64_t v59 = v88;
                  }
LABEL_60:

                  int v90 = v92->_fileUnlinker;
                  long long v72 = [v20 path];
                  [(BRCFileUnlinker *)v90 renameAndUnlinkInBackgroundItemAtPath:v72];

                  self = v92;
                  goto LABEL_18;
                }
              }
              self = v92;
            }
            goto LABEL_62;
          }
          id v104 = 0;
          int v64 = [v20 getResourceValue:&v104 forKey:v86 error:0];
          id v65 = v104;
          uint64_t v37 = v65;
          if (!v64 || ([v65 BOOLValue] & 1) == 0) {
            goto LABEL_44;
          }
          if ([(BRCAccountSession *)self _recursivelyPrepareFolderForLogOutAtURL:v20 pruneEmptyFolders:v96 pruneEmptyTopLevelFolder:0 maxDepth:v85])
          {
            goto LABEL_18;
          }
LABEL_62:
          ++v99;
          if (BRCSetSharedSpotlightAttributeAtURL()) {
            BRCSetSharedSpotlightAttributeAtURL();
          }
LABEL_18:

          ++v19;
        }
        while (v102 != v19);
        uint64_t v75 = [obj countByEnumeratingWithState:&v108 objects:v116 count:16];
        uint64_t v102 = v75;
        if (!v75)
        {
LABEL_71:

          BOOL v76 = v99 == 0;
          unint64_t v10 = v84;
          if ((v96 || v82) && !v99)
          {
            long long v78 = self->_fileUnlinker;
            id v79 = [v84 path];
            [(BRCFileUnlinker *)v78 renameAndUnlinkInBackgroundItemAtPath:v79];
          }
          long long v77 = v83;
          goto LABEL_75;
        }
      }
    }
    brc_bread_crumbs();
    id obj = (id)objc_claimAutoreleasedReturnValue();
    long long v77 = brc_default_log();
    if (os_log_type_enabled(v77, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession _recursivelyPrepareFolderForLogOutAtURL:pruneEmptyFolders:pruneEmptyTopLevelFolder:maxDepth:]();
    }
    BOOL v76 = 0;
LABEL_75:
  }
  else
  {
    BOOL v76 = 0;
  }

  return v76;
}

uint64_t __113__BRCAccountSession__recursivelyPrepareFolderForLogOutAtURL_pruneEmptyFolders_pruneEmptyTopLevelFolder_maxDepth___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  id v6 = brc_bread_crumbs();
  BOOL v7 = brc_default_log();
  if (os_log_type_enabled(v7, (os_log_type_t)0x90u))
  {
    int v9 = 138412802;
    id v10 = v4;
    __int16 v11 = 2112;
    id v12 = v5;
    __int16 v13 = 2112;
    uint64_t v14 = v6;
    _os_log_error_impl(&dword_1D353B000, v7, (os_log_type_t)0x90u, "[ERROR] Unable to enumerate URL [%@] with Error [%@]%@", (uint8_t *)&v9, 0x20u);
  }

  return 1;
}

- (void)_unlinkContainersWithRootURL:(id)a3
{
  id v4 = a3;
  if (![(BRCAccountSession *)self isOpen])
  {
    int v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession _unlinkContainersWithRootURL:]();
    }
  }
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSession _unlinkContainersWithRootURL:]();
  }

  BOOL v7 = [MEMORY[0x1E4F1CA48] array];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __50__BRCAccountSession__unlinkContainersWithRootURL___block_invoke;
  v11[3] = &unk_1E6994388;
  id v12 = v7;
  id v8 = v7;
  [(BRCAccountSession *)self enumerateAppLibraries:v11];
  [(BRCAccountSession *)self _unlinkContainersWithPristineContainerIDs:v8 containersActualRoot:v4];
}

uint64_t __50__BRCAccountSession__unlinkContainersWithRootURL___block_invoke(uint64_t a1, void *a2)
{
  id v3 = [a2 containerMetadata];
  if ([v3 isInInitialState])
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v3 identifier];
    [v4 addObject:v5];
  }
  return 1;
}

- (void)destroyLocalData
{
}

- (void)destroyLocalDataWithPristineContainerIDs:(id)a3
{
}

- (void)destroyLocalDataWaitingForFilesToBeUnlinked:(BOOL)a3 completionBlock:(id)a4
{
}

- (void)_destroyLocalDataWaitingForFilesToBeUnlinked:(BOOL)a3 pristineContainerIDs:(id)a4 completionBlock:(id)a5
{
  BOOL v6 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  memset(v36, 0, sizeof(v36));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _destroyLocalDataWaitingForFilesToBeUnlinked:pristineContainerIDs:completionBlock:]", 2958, v36);
  id v10 = brc_bread_crumbs();
  __int16 v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v38 = v36[0];
    __int16 v39 = 2112;
    id v40 = self;
    __int16 v41 = 2112;
    uint64_t v42 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx destroying local account data for %@%@", buf, 0x20u);
  }

  id v12 = dispatch_group_create();
  __int16 v13 = dispatch_queue_attr_make_with_qos_class(MEMORY[0x1E4F14430], QOS_CLASS_USER_INTERACTIVE, 0);
  uint64_t v14 = dispatch_queue_attr_make_with_autorelease_frequency(v13, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v15 = dispatch_queue_create("com.apple.bird.destroy-account-data", v14);

  int v16 = (void *)os_transaction_create();
  [(BRCAccountSession *)self _validatePersona];
  [(BRCAccountSession *)self _unlinkContainersWithPristineContainerIDs:v8 containersActualRoot:0];
  uint64_t v17 = self->_fileUnlinker;
  BRCRecursiveRemove(self->_cacheDirPath);
  cacheDirPath = self->_cacheDirPath;
  self->_cacheDirPath = 0;

  BRCRecursiveRemoveBelow(self->_sessionDirPath);
  sessionDirPath = self->_sessionDirPath;
  self->_sessionDirPath = 0;

  __int16 v20 = [(BRCAccountSession *)self dirPathForSyncedFolderType:1];
  [(BRCFileUnlinker *)v17 renameAndUnlinkInBackgroundItemAtPath:v20];
  if (v6) {
    dispatch_group_enter(v12);
  }
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke;
  v32[3] = &unk_1E69970B8;
  id v21 = v16;
  id v33 = v21;
  BOOL v35 = v6;
  __int16 v22 = v12;
  long long v34 = v22;
  [(BRCFileUnlinker *)v17 forcePurgeWithCompletionBlock:v32];
  dispatch_group_async(v22, v15, &__block_literal_global_256);
  uint64_t v23 = +[BRCUserDefaults defaultsForMangledID:0];
  int v24 = [v23 spotlightIndexingEnabled];

  if (v24)
  {
    dispatch_group_enter(v22);
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_257;
    v30[3] = &unk_1E69939E8;
    __int16 v31 = v22;
    +[BRCRecentsEnumerator dropRecentsForSession:self completionHandler:v30];
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_2;
  block[3] = &unk_1E6994600;
  id v28 = v21;
  id v29 = v9;
  id v25 = v9;
  id v26 = v21;
  dispatch_group_notify(v22, v15, block);

  __brc_leave_section(v36);
}

void __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke(uint64_t a1)
{
  if (*(unsigned char *)(a1 + 48)) {
    dispatch_group_leave(*(dispatch_group_t *)(a1 + 40));
  }
  os_log_t v1 = brc_bread_crumbs();
  id v2 = brc_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_cold_1();
  }
}

void __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_254()
{
  TCCAccessReset();
  uint64_t v0 = brc_bread_crumbs();
  os_log_t v1 = brc_default_log();
  if (os_log_type_enabled(v1, OS_LOG_TYPE_DEBUG)) {
    __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_254_cold_1();
  }
}

void __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_257(uint64_t a1)
{
}

uint64_t __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_2(uint64_t a1)
{
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_2_cold_1();
  }

  uint64_t result = *(void *)(a1 + 40);
  if (result) {
    return (*(uint64_t (**)(void))(result + 16))();
  }
  return result;
}

- (void)_loadClientZonesFromDisk
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx loading app libraries%@");
}

uint64_t __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke(uint64_t a1, void *a2)
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v34 = a2;
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _loadClientZonesFromDisk]_block_invoke", 3035, &v43);
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_cold_2();
  }

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v5 = [*(id *)(a1 + 32) _privateServerZonesEnumerator:v34];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v51 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v40;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v40 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v39 + 1) + 8 * v8);
        id v10 = brc_bread_crumbs();
        __int16 v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v48 = v9;
          __int16 v49 = 2112;
          id v50 = v10;
          _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded server zone: %@%@", buf, 0x16u);
        }

        [v9 setSession:*(void *)(a1 + 32)];
        id v12 = *(void **)(a1 + 40);
        __int16 v13 = [v9 mangledID];
        [v12 setObject:v9 forKeyedSubscript:v13];

        uint64_t v14 = *(void **)(a1 + 48);
        uint64_t v15 = [v9 dbRowID];
        [v14 setObject:v9 forKeyedSubscript:v15];

        int v16 = *(void **)(a1 + 56);
        uint64_t v17 = [v9 dbRowID];
        [v16 addZoneRowID:v17];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v5 countByEnumeratingWithState:&v39 objects:v51 count:16];
    }
    while (v6);
  }

  __brc_leave_section(&v43);
  uint64_t v43 = 0;
  uint64_t v44 = 0;
  uint64_t v45 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _loadClientZonesFromDisk]_block_invoke", 3046, &v43);
  __int16 v18 = brc_bread_crumbs();
  uint64_t v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
    __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_cold_1();
  }

  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  __int16 v20 = [*(id *)(a1 + 32) _sharedServerZonesEnumerator:v34];
  uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v46 count:16];
  if (v21)
  {
    uint64_t v22 = *(void *)v36;
    do
    {
      uint64_t v23 = 0;
      do
      {
        if (*(void *)v36 != v22) {
          objc_enumerationMutation(v20);
        }
        int v24 = *(void **)(*((void *)&v35 + 1) + 8 * v23);
        id v25 = brc_bread_crumbs();
        id v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          id v48 = v24;
          __int16 v49 = 2112;
          id v50 = v25;
          _os_log_debug_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded server zone: %@%@", buf, 0x16u);
        }

        [v24 setSession:*(void *)(a1 + 32)];
        uint64_t v27 = *(void **)(a1 + 40);
        id v28 = [v24 mangledID];
        [v27 setObject:v24 forKeyedSubscript:v28];

        id v29 = *(void **)(a1 + 48);
        uint64_t v30 = [v24 dbRowID];
        [v29 setObject:v24 forKeyedSubscript:v30];

        __int16 v31 = *(void **)(a1 + 56);
        __int16 v32 = [v24 dbRowID];
        [v31 addZoneRowID:v32];

        ++v23;
      }
      while (v21 != v23);
      uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v46 count:16];
    }
    while (v21);
  }

  __brc_leave_section(&v43);
  return 1;
}

uint64_t __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_259(uint64_t a1, void *a2)
{
  uint64_t v144 = *MEMORY[0x1E4F143B8];
  id v102 = a2;
  memset(v143, 0, sizeof(v143));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _loadClientZonesFromDisk]_block_invoke", 3064, v143);
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_259_cold_4();
  }

  long long v134 = 0u;
  long long v135 = 0u;
  long long v132 = 0u;
  long long v133 = 0u;
  id v5 = [*(id *)(a1 + 32) _privateClientZonesEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v132 objects:v142 count:16];
  if (v6)
  {
    id context = *(id *)v133;
    uint64_t v105 = *MEMORY[0x1E4F592A8];
    id obj = v5;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(id *)v133 != context) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v132 + 1) + 8 * i);
        id v9 = (void *)MEMORY[0x1D9438760]();
        id v10 = brc_bread_crumbs();
        __int16 v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v8;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v10;
          _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded client zone: %@%@", buf, 0x16u);
        }

        [v8 setSession:*(void *)(a1 + 32)];
        [v8 setDelegate:*(void *)(*(void *)(a1 + 32) + 600)];
        id v12 = *(void **)(a1 + 40);
        __int16 v13 = [v8 dbRowID];
        uint64_t v14 = [v12 objectForKeyedSubscript:v13];

        if (v14)
        {
          if ([v14 isPrivateZone])
          {
            uint64_t v15 = [v14 zoneName];
            int v16 = [v8 zoneName];
            char v17 = [v15 isEqual:v16];

            if (v17)
            {
              [v8 associateWithServerZone:v14 offline:*(unsigned __int8 *)(*(void *)(a1 + 32) + 121)];
              goto LABEL_20;
            }
          }
          __int16 v18 = brc_bread_crumbs();
          uint64_t v19 = brc_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v8;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v14;
            *(_WORD *)&buf[22] = 2112;
            v141 = v18;
            _os_log_fault_impl(&dword_1D353B000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: [client|server]zoneNames mismatch:  %@ does not match with %@%@", buf, 0x20u);
          }

          __int16 v20 = [MEMORY[0x1E4F28C58] errorWithDomain:v105 code:77 userInfo:0];
          [*(id *)(a1 + 32) dbBecameCorruptedWithDescription:@"Zone names mistmatch" error:v20];
        }
        uint64_t v21 = brc_bread_crumbs();
        uint64_t v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v21;
          _os_log_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring client zone because it's missing a server zone%@", buf, 0xCu);
        }

        uint64_t v23 = *(void **)(a1 + 48);
        int v24 = [v8 dbRowID];
        [v23 addZoneRowID:v24];

        uint64_t v14 = 0;
LABEL_20:
      }
      id v5 = obj;
      uint64_t v6 = [obj countByEnumeratingWithState:&v132 objects:v142 count:16];
    }
    while (v6);
  }

  __brc_leave_section((uint64_t *)v143);
  memset(v143, 0, sizeof(v143));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _loadClientZonesFromDisk]_block_invoke", 3090, v143);
  id v25 = brc_bread_crumbs();
  id v26 = brc_default_log();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
    __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_259_cold_3();
  }

  long long v130 = 0u;
  long long v131 = 0u;
  long long v128 = 0u;
  long long v129 = 0u;
  uint64_t v27 = [*(id *)(a1 + 32) _sharedClientZonesEnumerator];
  uint64_t v28 = [v27 countByEnumeratingWithState:&v128 objects:v139 count:16];
  if (v28)
  {
    uint64_t obja = *(void *)v129;
    uint64_t v106 = *MEMORY[0x1E4F592A8];
    uint64_t v103 = v27;
    do
    {
      id v29 = 0;
      id contexta = (id)v28;
      do
      {
        if (*(void *)v129 != obja) {
          objc_enumerationMutation(v103);
        }
        uint64_t v30 = *(void **)(*((void *)&v128 + 1) + 8 * (void)v29);
        __int16 v31 = (void *)MEMORY[0x1D9438760]();
        __int16 v32 = brc_bread_crumbs();
        id v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          *(void *)&uint8_t buf[4] = v30;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v32;
          _os_log_debug_impl(&dword_1D353B000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded shared client zone: %@%@", buf, 0x16u);
        }

        [v30 setSession:*(void *)(a1 + 32)];
        [v30 setDelegate:*(void *)(*(void *)(a1 + 32) + 600)];
        id v34 = *(void **)(a1 + 40);
        long long v35 = [v30 dbRowID];
        long long v36 = [v34 objectForKeyedSubscript:v35];

        if (v36)
        {
          if ([v36 isSharedZone])
          {
            long long v37 = [v36 zoneName];
            long long v38 = [v30 zoneName];
            if ([v37 isEqual:v38])
            {
              long long v39 = [v36 ownerName];
              long long v40 = [v30 ownerName];
              char v41 = [v39 isEqual:v40];

              if (v41)
              {
                [v30 associateWithServerZone:v36 offline:*(unsigned __int8 *)(*(void *)(a1 + 32) + 121)];
                goto LABEL_43;
              }
            }
            else
            {
            }
          }
          long long v42 = brc_bread_crumbs();
          uint64_t v43 = brc_default_log();
          if (os_log_type_enabled(v43, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412802;
            *(void *)&uint8_t buf[4] = v30;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v36;
            *(_WORD *)&buf[22] = 2112;
            v141 = v42;
            _os_log_fault_impl(&dword_1D353B000, v43, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: [client|server]zoneName or ownerss mismatch:  %@ does not match with %@%@", buf, 0x20u);
          }

          uint64_t v44 = [MEMORY[0x1E4F28C58] errorWithDomain:v106 code:78 userInfo:0];
          [*(id *)(a1 + 32) dbBecameCorruptedWithDescription:@"Zone names or owners mismatch" error:v44];
        }
        uint64_t v45 = brc_bread_crumbs();
        int v46 = brc_default_log();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v45;
          _os_log_impl(&dword_1D353B000, v46, OS_LOG_TYPE_DEFAULT, "[WARNING] ignoring shared client zone because it's missing a server zone%@", buf, 0xCu);
        }

        uint64_t v47 = *(void **)(a1 + 48);
        id v48 = [v30 dbRowID];
        [v47 addZoneRowID:v48];

        long long v36 = 0;
LABEL_43:

        id v29 = (char *)v29 + 1;
      }
      while (contexta != v29);
      uint64_t v27 = v103;
      uint64_t v28 = [v103 countByEnumeratingWithState:&v128 objects:v139 count:16];
    }
    while (v28);
  }

  __brc_leave_section((uint64_t *)v143);
  memset(buf, 0, sizeof(buf));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _loadClientZonesFromDisk]_block_invoke", 3118, buf);
  __int16 v49 = brc_bread_crumbs();
  id v50 = brc_default_log();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSession _loadClientZonesFromDisk]();
  }

  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  int v51 = [*(id *)(a1 + 32) _appLibrariesEnumerator:v102];
  uint64_t v52 = [v51 countByEnumeratingWithState:&v124 objects:v138 count:16];
  if (v52)
  {
    uint64_t v53 = *(void *)v125;
    id contextb = v51;
    do
    {
      for (uint64_t j = 0; j != v52; ++j)
      {
        if (*(void *)v125 != v53) {
          objc_enumerationMutation(contextb);
        }
        uint64_t v55 = *(void **)(*((void *)&v124 + 1) + 8 * j);
        int v56 = (void *)MEMORY[0x1D9438760]();
        int v57 = brc_bread_crumbs();
        int v58 = brc_default_log();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v143 = 138412546;
          *(void *)&v143[4] = v55;
          *(_WORD *)&v143[12] = 2112;
          *(void *)&v143[14] = v57;
          _os_log_debug_impl(&dword_1D353B000, v58, OS_LOG_TYPE_DEBUG, "[DEBUG] loaded app library: %@%@", v143, 0x16u);
        }

        uint64_t v59 = *(void **)(a1 + 40);
        long long v60 = [v55 zoneRowID];
        int v61 = [v59 objectForKeyedSubscript:v60];
        long long v62 = [v61 clientZone];
        long long v63 = [v62 asPrivateClientZone];

        if (v63)
        {
          [v55 associateWithClientZone:v63 offline:*(unsigned __int8 *)(*(void *)(a1 + 32) + 121)];
          int v64 = [v55 appLibraryID];
          if ([v55 wasMovedToCloudDocs])
          {
            if ([v63 isCloudDocsZone])
            {
LABEL_64:
              if (!*(unsigned char *)(*(void *)(a1 + 32) + 121)
                && [v55 containerMetadataNeedsSyncUp])
              {
                [v55 scheduleContainerMetadataSyncUp];
              }
              long long v70 = *(void **)(a1 + 56);
              id v65 = [v55 dbRowID];
              [v70 setObject:v55 forKeyedSubscript:v65];
              goto LABEL_68;
            }
          }
          else
          {
            id v66 = [v63 zoneName];
            char v67 = [v66 isEqualToString:v64];

            if (v67) {
              goto LABEL_64;
            }
          }
          long long v68 = brc_bread_crumbs();
          long long v69 = brc_default_log();
          if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)v143 = 138412290;
            *(void *)&v143[4] = v68;
            _os_log_fault_impl(&dword_1D353B000, v69, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: appLibrary.wasMovedToCloudDocs ? clientZone.isCloudDocsZone : [clientZone.zoneName isEqualToString:appLibraryID]%@", v143, 0xCu);
          }

          goto LABEL_64;
        }
        int v64 = brc_bread_crumbs();
        id v65 = brc_default_log();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)v143 = 138412290;
          *(void *)&v143[4] = v64;
          _os_log_debug_impl(&dword_1D353B000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring app library because it's missing a client zone%@", v143, 0xCu);
        }
LABEL_68:
      }
      int v51 = contextb;
      uint64_t v52 = [contextb countByEnumeratingWithState:&v124 objects:v138 count:16];
    }
    while (v52);
  }

  __brc_leave_section((uint64_t *)buf);
  brc_mutex_lock((pthread_mutex_t *)(*(void *)(a1 + 32) + 200));
  memset(buf, 0, sizeof(buf));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _loadClientZonesFromDisk]_block_invoke", 3152, buf);
  long long v71 = brc_bread_crumbs();
  long long v72 = brc_default_log();
  if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG)) {
    __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_259_cold_1();
  }

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  long long v73 = [*(id *)(a1 + 64) allValues];
  uint64_t v74 = [v73 countByEnumeratingWithState:&v120 objects:v137 count:16];
  if (v74)
  {
    uint64_t v107 = *(void *)v121;
    id v104 = v73;
    do
    {
      uint64_t objb = v74;
      for (uint64_t k = 0; k != objb; ++k)
      {
        if (*(void *)v121 != v107) {
          objc_enumerationMutation(v104);
        }
        BOOL v76 = *(void **)(*((void *)&v120 + 1) + 8 * k);
        id contextc = (id)MEMORY[0x1D9438760]();
        long long v77 = [v76 clientZone];
        if (!v77)
        {
LABEL_80:
          __int16 v81 = brc_bread_crumbs();
          BOOL v82 = brc_default_log();
          if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)v143 = 138412546;
            *(void *)&v143[4] = v76;
            *(_WORD *)&v143[12] = 2112;
            *(void *)&v143[14] = v81;
            _os_log_impl(&dword_1D353B000, v82, OS_LOG_TYPE_DEFAULT, "[WARNING] dropping %@ because it's missing its client zone or app library%@", v143, 0x16u);
          }
          goto LABEL_96;
        }
        if ([v76 isPrivateZone])
        {
          long long v78 = [v76 clientZone];
          id v79 = [v78 asPrivateClientZone];
          char v80 = [v79 hasDefaultAppLibrary];

          if ((v80 & 1) == 0) {
            goto LABEL_80;
          }
        }
        else
        {
        }
        __int16 v81 = [v76 clientZone];
        if (!*(unsigned char *)(*(void *)(a1 + 32) + 121))
        {
          __int16 v83 = brc_bread_crumbs();
          __int16 v84 = brc_default_log();
          if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)v143 = 138412546;
            *(void *)&v143[4] = v81;
            *(_WORD *)&v143[12] = 2112;
            *(void *)&v143[14] = v83;
            _os_log_debug_impl(&dword_1D353B000, v84, OS_LOG_TYPE_DEBUG, "[DEBUG] activating %@%@", v143, 0x16u);
          }

          [v81 resume];
        }
        unint64_t v85 = *(void **)(a1 + 48);
        uint64_t v86 = [v76 dbRowID];
        [v85 removeZoneRowID:v86];

        uint64_t v87 = *(void **)(*(void *)(a1 + 32) + 352);
        int v88 = [v76 dbRowID];
        [v87 setObject:v76 forKeyedSubscript:v88];

        if ([v76 isSharedZone])
        {
          BOOL v82 = [v76 mangledID];
          [*(id *)(*(void *)(a1 + 32) + 360) setObject:v76 forKeyedSubscript:v82];
          [*(id *)(*(void *)(a1 + 32) + 368) setObject:v81 forKeyedSubscript:v82];
        }
        else
        {
          int v89 = *(void **)(*(void *)(a1 + 32) + 376);
          int v90 = [v76 zoneName];
          [v89 setObject:v76 forKeyedSubscript:v90];

          unsigned int v91 = *(void **)(*(void *)(a1 + 32) + 384);
          id v92 = [v81 zoneName];
          [v91 setObject:v81 forKeyedSubscript:v92];

          long long v118 = 0u;
          long long v119 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          uint64_t v93 = [v81 asPrivateClientZone];
          BOOL v82 = [v93 appLibraries];

          uint64_t v94 = [v82 countByEnumeratingWithState:&v116 objects:v136 count:16];
          if (v94)
          {
            uint64_t v95 = *(void *)v117;
            do
            {
              for (uint64_t m = 0; m != v94; ++m)
              {
                if (*(void *)v117 != v95) {
                  objc_enumerationMutation(v82);
                }
                uint64_t v97 = *(void **)(*((void *)&v116 + 1) + 8 * m);
                uint64_t v98 = *(void **)(*(void *)(a1 + 32) + 344);
                uint64_t v99 = [v97 dbRowID];
                [v98 setObject:v97 forKeyedSubscript:v99];
              }
              uint64_t v94 = [v82 countByEnumeratingWithState:&v116 objects:v136 count:16];
            }
            while (v94);
          }
        }
LABEL_96:
      }
      long long v73 = v104;
      uint64_t v74 = [v104 countByEnumeratingWithState:&v120 objects:v137 count:16];
    }
    while (v74);
  }

  __brc_leave_section((uint64_t *)buf);
  v100 = *(unsigned char **)(a1 + 32);
  if (!v100[121])
  {
    [v100 enumerateAppLibraries:&__block_literal_global_268];
    v100 = *(unsigned char **)(a1 + 32);
  }
  v115[0] = MEMORY[0x1E4F143A8];
  v115[1] = 3221225472;
  v115[2] = __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_269;
  v115[3] = &unk_1E69991C8;
  v115[4] = v100;
  [v100 _enumerateAppLibraryRowIDs:v102 usingBlock:v115];
  brc_mutex_unlock((pthread_mutex_t *)(*(void *)(a1 + 32) + 200));

  return 1;
}

uint64_t __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_266(uint64_t a1, void *a2)
{
  id v2 = a2;
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_266_cold_1((uint64_t)v2);
  }

  [v2 activate];
  return 1;
}

void __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_269(uint64_t a1, void *a2, void *a3)
{
  id v5 = (objc_class *)MEMORY[0x1E4F594E8];
  id v6 = a3;
  id v7 = a2;
  id v8 = (id)[[v5 alloc] initWithAppLibraryName:v7];

  [*(id *)(*(void *)(a1 + 32) + 336) setObject:v6 forKeyedSubscript:v8];
}

- (void)_handleUnloadedZones:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    id v5 = +[BRCUserDefaults defaultsForMangledID:0];
    char v6 = [v5 handleUnloadedZones];

    if (v6)
    {
      clientTruthWorkloop = self->_clientTruthWorkloop;
      v10[0] = MEMORY[0x1E4F143A8];
      v10[1] = 3221225472;
      v10[2] = __42__BRCAccountSession__handleUnloadedZones___block_invoke;
      uint64_t v10[3] = &unk_1E6993628;
      id v11 = v4;
      id v12 = self;
      dispatch_async(clientTruthWorkloop, v10);
      id v8 = v11;
    }
    else
    {
      id v8 = brc_bread_crumbs();
      id v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v4;
        __int16 v15 = 2112;
        int v16 = v8;
        _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] We found %@ unloaded zones, but handling logic is disabled by user defaults%@", buf, 0x16u);
      }
    }
  }
}

uint64_t __42__BRCAccountSession__handleUnloadedZones___block_invoke(uint64_t a1)
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __42__BRCAccountSession__handleUnloadedZones___block_invoke_2;
  v3[3] = &unk_1E6996CD0;
  os_log_t v1 = *(void **)(a1 + 32);
  v3[4] = *(void *)(a1 + 40);
  return [v1 enumerateIndexesUsingBlock:v3];
}

void __42__BRCAccountSession__handleUnloadedZones___block_invoke_2(uint64_t a1, uint64_t a2, unsigned char *a3)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134218242;
    uint64_t v14 = a2;
    __int16 v15 = 2112;
    int v16 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Checking if unloaded zone %lu is being referenced by a client item%@", buf, 0x16u);
  }

  id v8 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 144), "numberWithSQL:", @"SELECT 1 FROM client_items WHERE zone_rowid = %lu LIMIT 1", a2);
  int v9 = [v8 BOOLValue];

  if (v9)
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __42__BRCAccountSession__handleUnloadedZones___block_invoke_2_cold_1((uint64_t)v10, a2, v11);
    }

    id v12 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F592A8] code:142 userInfo:0];
    [*(id *)(a1 + 32) dbBecameCorruptedWithDescription:@"Unloaded zone is referenced by item" error:v12];
    *a3 = 1;
  }
}

- (id)_unloadClientZones
{
  id v3 = self->_clientDB;
  id v4 = [(BRCPQLConnection *)v3 serialQueue];

  if (v4)
  {
    id v5 = [(BRCPQLConnection *)v3 serialQueue];
    dispatch_assert_queue_not_V2(v5);
  }
  char v6 = self->_serverDB;
  id v7 = [(BRCPQLConnection *)v6 serialQueue];

  if (v7)
  {
    id v8 = [(BRCPQLConnection *)v6 serialQueue];
    dispatch_assert_queue_not_V2(v8);
  }
  brc_mutex_lock(&self->_zonesCreationLock.pthread);
  brc_mutex_lock(&self->_zonesLock.pthread);
  int v9 = [(NSMutableDictionary *)self->_privateClientZonesByID allValues];
  id v10 = (void *)[v9 copy];

  id v11 = [(NSMutableDictionary *)self->_sharedClientZonesByMangledID allValues];
  id v12 = [v10 arrayByAddingObjectsFromArray:v11];

  libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
  self->_libraryRowIDsByMangledID = 0;

  appLibrariesByRowID = self->_appLibrariesByRowID;
  self->_appLibrariesByRowID = 0;

  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  self->_serverZonesByZoneRowID = 0;

  sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
  self->_sharedServerZonesByMangledID = 0;

  privateServerZonesByID = self->_privateServerZonesByID;
  self->_privateServerZonesByID = 0;

  sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
  self->_sharedClientZonesByMangledID = 0;

  privateClientZonesByID = self->_privateClientZonesByID;
  self->_privateClientZonesByID = 0;

  brc_mutex_unlock(&self->_zonesLock.pthread);
  brc_mutex_unlock(&self->_zonesCreationLock.pthread);
  return v12;
}

- (void)_mutexZonesLock
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: BRCurrentPersonaMatchesID(self.personaIdentifier)%@", v2, v3, v4, v5, v6);
}

- (id)sharedServerZoneRowIDsByOwnerNamePrefix:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = objc_opt_new();
  [(BRCAccountSession *)self _mutexZonesLock];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint8_t v6 = [(NSMutableDictionary *)self->_sharedServerZonesByMangledID objectEnumerator];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = [v11 ownerName];
        int v13 = [v12 hasPrefix:v4];

        if (v13)
        {
          uint64_t v14 = [v11 dbRowID];
          [v5 addObject:v14];
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v8);
  }

  brc_mutex_unlock(&self->_zonesLock.pthread);
  return v5;
}

- (id)serverZoneByMangledID:(id)a3
{
  id v4 = a3;
  [(BRCAccountSession *)self _mutexZonesLock];
  if ([v4 isShared])
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_sharedClientZonesByMangledID objectForKeyedSubscript:v4];
  }
  else
  {
    privateClientZonesByID = self->_privateClientZonesByID;
    uint64_t v7 = [v4 appLibraryOrZoneName];

    uint64_t v5 = [(NSMutableDictionary *)privateClientZonesByID objectForKeyedSubscript:v7];
    id v4 = (id)v7;
  }

  brc_mutex_unlock(&self->_zonesLock.pthread);
  uint64_t v8 = [v5 serverZone];

  return v8;
}

- (id)serverZoneByCKZoneID:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F594E8];
  id v5 = a3;
  uint8_t v6 = (void *)[[v4 alloc] initWithRecordZoneID:v5];

  uint64_t v7 = [(BRCAccountSession *)self serverZoneByMangledID:v6];

  return v7;
}

- (id)serverZoneByName:(id)a3 ownerName:(id)a4
{
  uint8_t v6 = (objc_class *)MEMORY[0x1E4F594E8];
  id v7 = a4;
  id v8 = a3;
  uint64_t v9 = (void *)[[v6 alloc] initWithZoneName:v8 ownerName:v7];

  id v10 = [(BRCAccountSession *)self serverZoneByMangledID:v9];

  return v10;
}

- (id)serverZoneByRowID:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    [(BRCAccountSession *)self _mutexZonesLock];
    id v5 = [(NSMutableDictionary *)self->_serverZonesByZoneRowID objectForKeyedSubscript:v4];

    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v5)
    {
      id v11 = brc_bread_crumbs();
      id v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSession serverZoneByRowID:]();
      }
    }
    uint8_t v6 = [v5 clientZone];

    if (!v6)
    {
      int v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSession serverZoneByRowID:]();
      }
    }
    id v7 = [v5 clientZone];
    if (v7) {
      id v8 = v5;
    }
    else {
      id v8 = 0;
    }
    id v9 = v8;
  }
  else
  {
    id v9 = 0;
  }
  return v9;
}

- (id)clientZoneByMangledID:(id)a3
{
  id v4 = a3;
  if ([v4 isShared])
  {
    id v5 = [(BRCAccountSession *)self sharedClientZoneByMangledID:v4];
  }
  else
  {
    uint8_t v6 = [(BRCAccountSession *)self appLibraryByMangledID:v4];

    id v5 = [v6 defaultClientZone];
    id v4 = v6;
  }

  return v5;
}

- (void)enumerateServerZones:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void *))a3;
  [(BRCAccountSession *)self _mutexZonesLock];
  id v5 = [(NSMutableDictionary *)self->_serverZonesByZoneRowID allValues];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v17;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        id v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        id v12 = (void *)MEMORY[0x1D9438760](v7);
        uint64_t v13 = objc_msgSend(v11, "clientZone", (void)v16);
        if (v13)
        {
          uint64_t v14 = (void *)v13;
          char v15 = v4[2](v4, v11);

          if ((v15 & 1) == 0)
          {
            goto LABEL_12;
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v20 count:16];
      uint64_t v8 = v7;
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_12:
}

- (void)enumerateAppLibraries:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void))a3;
  [(BRCAccountSession *)self _mutexZonesLock];
  id v5 = [(NSMutableDictionary *)self->_appLibrariesByRowID allValues];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v14 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
      id v12 = (void *)MEMORY[0x1D9438760](v7);
      LODWORD(v11) = v4[2](v4, v11);
      if (!v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        uint64_t v8 = v7;
        if (v7) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (id)appLibraries
{
  [(BRCAccountSession *)self _mutexZonesLock];
  uint64_t v3 = [(NSMutableDictionary *)self->_appLibrariesByRowID allValues];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  return v3;
}

- (id)fallbackAppLibraryForClientZone:(id)a3 extension:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 zoneName];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F59268]];

  if (v9)
  {
    uint64_t v10 = [MEMORY[0x1E4FB36F8] sharedManager];
    uint64_t v11 = [v10 currentPersona];
    int v12 = [v11 isEnterprisePersona];

    if (v12)
    {
      long long v13 = [(BRCAccountSession *)self appLibraryByID:*MEMORY[0x1E4F59418]];
    }
    else
    {
      long long v14 = [v6 zoneName];
      long long v13 = [(BRCAccountSession *)self appLibraryByID:v14];
    }
  }
  else
  {
    long long v13 = 0;
  }
  long long v15 = [v6 zoneName];
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F59288]];

  if (v16)
  {
    long long v17 = [v6 zoneName];
    uint64_t v18 = [(BRCAccountSession *)self appLibraryByID:v17];

    long long v13 = (void *)v18;
  }
  if (v13)
  {
    id v19 = v13;
    __int16 v20 = v19;
    goto LABEL_21;
  }
  uint64_t v21 = [v6 mangledID];
  uint64_t v22 = +[BRCUserDefaults defaultsForMangledID:v21];
  uint64_t v23 = [v22 iworkShareableExtensions];

  if (![v23 containsObject:v7]) {
    goto LABEL_19;
  }
  if ([v7 containsString:@"pages"])
  {
    int v24 = (void *)MEMORY[0x1E4F59280];
  }
  else if ([v7 containsString:@"key"])
  {
    int v24 = (void *)MEMORY[0x1E4F59270];
  }
  else
  {
    if (![v7 containsString:@"numbers"])
    {
LABEL_19:
      __int16 v20 = [(BRCAccountSession *)self appLibraryByID:*MEMORY[0x1E4F59418]];
      id v19 = 0;
      goto LABEL_20;
    }
    int v24 = (void *)MEMORY[0x1E4F59278];
  }
  id v25 = [(BRCAccountSession *)self appLibraryByID:*v24];
  if (!v25) {
    goto LABEL_19;
  }
  id v19 = v25;
  __int16 v20 = v19;
LABEL_20:

LABEL_21:
  return v20;
}

- (id)privateServerZoneByID:(id)a3
{
  id v4 = a3;
  [(BRCAccountSession *)self _mutexZonesLock];
  id v5 = [(NSMutableDictionary *)self->_privateServerZonesByID objectForKeyedSubscript:v4];

  brc_mutex_unlock(&self->_zonesLock.pthread);
  id v6 = [v5 clientZone];
  if (v6) {
    id v7 = v5;
  }
  else {
    id v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)enumeratePrivateServerZones:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void))a3;
  if (!v4)
  {
    long long v13 = brc_bread_crumbs();
    long long v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession enumeratePrivateServerZones:]();
    }
  }
  [(BRCAccountSession *)self _mutexZonesLock];
  id v5 = [(NSMutableDictionary *)self->_privateServerZonesByID allValues];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
      int v12 = (void *)MEMORY[0x1D9438760](v7);
      LODWORD(v11) = v4[2](v4, v11);
      if (!v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v8 = v7;
        if (v7) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
}

- (id)cloudDocsClientZone
{
  return [(BRCAccountSession *)self privateClientZoneByID:*MEMORY[0x1E4F59418]];
}

- (id)privateClientZoneByID:(id)a3
{
  id v4 = a3;
  [(BRCAccountSession *)self _mutexZonesLock];
  id v5 = [(NSMutableDictionary *)self->_privateClientZonesByID objectForKeyedSubscript:v4];

  brc_mutex_unlock(&self->_zonesLock.pthread);
  id v6 = [v5 serverZone];
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)enumerateClientZones:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void *))a3;
  if (!v4)
  {
    long long v16 = brc_bread_crumbs();
    long long v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession enumeratePrivateServerZones:]();
    }
  }
  [(BRCAccountSession *)self _mutexZonesLock];
  id v5 = [(NSMutableDictionary *)self->_serverZonesByZoneRowID allValues];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = v5;
  uint64_t v6 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v20;
LABEL_4:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v20 != v8) {
        objc_enumerationMutation(obj);
      }
      uint64_t v10 = *(void **)(*((void *)&v19 + 1) + 8 * v9);
      uint64_t v11 = (void *)MEMORY[0x1D9438760]();
      int v12 = [v10 clientZone];
      if (!v12)
      {
        long long v13 = brc_bread_crumbs();
        long long v14 = brc_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412546;
          int v24 = v10;
          __int16 v25 = 2112;
          id v26 = v13;
          _os_log_fault_impl(&dword_1D353B000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: missing client zone for %@%@", buf, 0x16u);
        }
      }
      int v15 = v4[2](v4, v12);

      if (!v15) {
        break;
      }
      if (v7 == ++v9)
      {
        uint64_t v7 = [obj countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v7) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
}

- (id)clientZones
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(BRCAccountSession *)self _mutexZonesLock];
  uint64_t v3 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", -[NSMutableDictionary count](self->_serverZonesByZoneRowID, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v4 = [(NSMutableDictionary *)self->_serverZonesByZoneRowID objectEnumerator];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        uint64_t v10 = (void *)MEMORY[0x1D9438760]();
        uint64_t v11 = [v9 clientZone];
        [v3 addObject:v11];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }

  brc_mutex_unlock(&self->_zonesLock.pthread);
  return v3;
}

- (void)enumeratePrivateClientZones:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void))a3;
  if (!v4)
  {
    long long v13 = brc_bread_crumbs();
    long long v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession enumeratePrivateServerZones:]();
    }
  }
  [(BRCAccountSession *)self _mutexZonesLock];
  uint64_t v5 = [(NSMutableDictionary *)self->_privateClientZonesByID allValues];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v16;
LABEL_4:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v16 != v9) {
        objc_enumerationMutation(v6);
      }
      uint64_t v11 = *(void *)(*((void *)&v15 + 1) + 8 * v10);
      int v12 = (void *)MEMORY[0x1D9438760](v7);
      LODWORD(v11) = v4[2](v4, v11);
      if (!v11) {
        break;
      }
      if (v8 == ++v10)
      {
        uint64_t v7 = [v6 countByEnumeratingWithState:&v15 objects:v19 count:16];
        uint64_t v8 = v7;
        if (v7) {
          goto LABEL_4;
        }
        break;
      }
    }
  }
}

- (id)sharedServerZoneByMangledID:(id)a3
{
  id v4 = a3;
  [(BRCAccountSession *)self _mutexZonesLock];
  uint64_t v5 = [(NSMutableDictionary *)self->_sharedServerZonesByMangledID objectForKeyedSubscript:v4];

  brc_mutex_unlock(&self->_zonesLock.pthread);
  id v6 = [v5 clientZone];
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (id)sharedClientZoneByMangledID:(id)a3
{
  id v4 = a3;
  [(BRCAccountSession *)self _mutexZonesLock];
  uint64_t v5 = [(NSMutableDictionary *)self->_sharedClientZonesByMangledID objectForKeyedSubscript:v4];

  brc_mutex_unlock(&self->_zonesLock.pthread);
  id v6 = [v5 serverZone];
  if (v6) {
    uint64_t v7 = v5;
  }
  else {
    uint64_t v7 = 0;
  }
  id v8 = v7;

  return v8;
}

- (void)enumerateSharedClientZones:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = (uint64_t (**)(id, void *))a3;
  if (!v4)
  {
    long long v16 = brc_bread_crumbs();
    long long v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession enumeratePrivateServerZones:]();
    }
  }
  [(BRCAccountSession *)self _mutexZonesLock];
  uint64_t v5 = [(NSMutableDictionary *)self->_sharedClientZonesByMangledID allValues];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * v10);
        int v12 = (void *)MEMORY[0x1D9438760](v7);
        uint64_t v13 = objc_msgSend(v11, "serverZone", (void)v18);
        if (v13)
        {
          long long v14 = (void *)v13;
          char v15 = v4[2](v4, v11);

          if ((v15 & 1) == 0)
          {
            goto LABEL_13;
          }
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      uint64_t v8 = v7;
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_13:
}

- (void)performBlock:(id)a3 whileRemovingPrivateClientZone:(id)a4
{
  id v6 = (void (**)(void))a3;
  id v7 = a4;
  if (!self->_isCancelled)
  {
    uint64_t v8 = [(BRCPQLConnection *)self->_clientDB serialQueue];
    dispatch_assert_queue_not_V2(v8);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_clientTruthWorkloop);
    uint64_t v9 = [(BRCPQLConnection *)self->_serverDB serialQueue];
    dispatch_assert_queue_not_V2(v9);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serverTruthWorkloop);
    uint64_t v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSession performBlock:whileRemovingPrivateClientZone:](v7, (uint64_t)v10, v11);
    }

    brc_mutex_lock(&self->_zonesCreationLock.pthread);
    if (v6) {
      v6[2](v6);
    }
    [(BRCAccountSession *)self _mutexZonesLock];
    privateClientZonesByID = self->_privateClientZonesByID;
    uint64_t v13 = [v7 zoneName];
    [(NSMutableDictionary *)privateClientZonesByID removeObjectForKey:v13];

    serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
    char v15 = [v7 dbRowID];
    [(NSMutableDictionary *)serverZonesByZoneRowID removeObjectForKey:v15];

    brc_mutex_unlock(&self->_zonesLock.pthread);
    brc_mutex_unlock(&self->_zonesCreationLock.pthread);
    [v7 close];
  }
}

- (void)destroySharedClientZone:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (!self->_isCancelled)
  {
    if (([v4 state] & 0x100) == 0)
    {
      long long v22 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSession destroySharedClientZone:]();
      }
    }
    if (([v5 state] & 0x20000) == 0)
    {
      int v24 = brc_bread_crumbs();
      __int16 v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSession destroySharedClientZone:]();
      }
    }
    id v6 = [(BRCPQLConnection *)self->_clientDB serialQueue];
    dispatch_assert_queue_not_V2(v6);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_clientTruthWorkloop);
    id v7 = [(BRCPQLConnection *)self->_serverDB serialQueue];
    dispatch_assert_queue_not_V2(v7);

    dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serverTruthWorkloop);
    uint64_t v8 = [v5 serverZone];
    uint64_t v9 = [v5 mangledID];
    uint64_t v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSession destroySharedClientZone:]((uint64_t)v9);
    }

    p_zonesCreationLocuint64_t k = &self->_zonesCreationLock;
    brc_mutex_lock(&self->_zonesCreationLock.pthread);
    [(BRCAccountSession *)self _mutexZonesLock];
    [(NSMutableDictionary *)self->_sharedClientZonesByMangledID removeObjectForKey:v9];
    [(NSMutableDictionary *)self->_sharedServerZonesByMangledID removeObjectForKey:v9];
    serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
    long long v14 = [v5 dbRowID];
    [(NSMutableDictionary *)serverZonesByZoneRowID removeObjectForKey:v14];

    brc_mutex_unlock(&self->_zonesLock.pthread);
    clientDB = self->_clientDB;
    v33[0] = MEMORY[0x1E4F143A8];
    v33[1] = 3221225472;
    v33[2] = __45__BRCAccountSession_destroySharedClientZone___block_invoke;
    uint64_t v33[3] = &unk_1E6997478;
    id v16 = v9;
    id v34 = v16;
    long long v35 = self;
    id v17 = v5;
    id v36 = v17;
    [(BRCPQLConnection *)clientDB performWithFlags:27 action:v33];
    serverDB = self->_serverDB;
    uint64_t v26 = MEMORY[0x1E4F143A8];
    uint64_t v27 = 3221225472;
    uint64_t v28 = __45__BRCAccountSession_destroySharedClientZone___block_invoke_289;
    id v29 = &unk_1E6997478;
    id v19 = v16;
    id v30 = v19;
    __int16 v31 = self;
    id v20 = v8;
    id v32 = v20;
    [(BRCPQLConnection *)serverDB performWithFlags:11 action:&v26];

    brc_mutex_unlock(&p_zonesCreationLock->pthread);
    objc_msgSend(v17, "close", v26, v27, v28, v29);
    long long v21 = +[BRCUserDefaults defaultsForMangledID:0];
    LODWORD(p_zonesCreationLock) = [v21 sessionZombiesEnabled];

    if (p_zonesCreationLock)
    {
      [MEMORY[0x1E4F59588] turnObjectIntoZombie:v20];
      [MEMORY[0x1E4F59588] turnObjectIntoZombie:v17];
    }
  }
}

uint64_t __45__BRCAccountSession_destroySharedClientZone___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __45__BRCAccountSession_destroySharedClientZone___block_invoke_cold_1();
  }

  return [*(id *)(a1 + 40) _deleteClientZone:*(void *)(a1 + 48)];
}

uint64_t __45__BRCAccountSession_destroySharedClientZone___block_invoke_289(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __45__BRCAccountSession_destroySharedClientZone___block_invoke_289_cold_1();
  }

  return [*(id *)(a1 + 40) deleteServerZone:*(void *)(a1 + 48)];
}

- (id)appLibraryByRowID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!v4)
  {
    uint64_t v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:]();
    }
  }
  [(BRCAccountSession *)self _mutexZonesLock];
  uint64_t v5 = [(NSMutableDictionary *)self->_appLibrariesByRowID objectForKeyedSubscript:v4];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  if (!v5)
  {
    if ([(BRCAccountSession *)self isCancelled])
    {
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        int v11 = 138412290;
        int v12 = v6;
        _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find app library in the middle of closing%@", (uint8_t *)&v11, 0xCu);
      }
    }
    else
    {
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
        [(BRCAccountSession *)v4 appLibraryByRowID:v7];
      }
    }
  }
  return v5;
}

- (id)appLibraryByMangledID:(id)a3
{
  id v4 = a3;
  [(BRCAccountSession *)self _mutexZonesLock];
  uint64_t v5 = [(NSMutableDictionary *)self->_libraryRowIDsByMangledID objectForKeyedSubscript:v4];

  id v6 = [(NSMutableDictionary *)self->_appLibrariesByRowID objectForKeyedSubscript:v5];
  brc_mutex_unlock(&self->_zonesLock.pthread);

  return v6;
}

- (id)appLibraryByID:(id)a3
{
  id v4 = (objc_class *)MEMORY[0x1E4F594E8];
  id v5 = a3;
  id v6 = (void *)[[v4 alloc] initWithAppLibraryName:v5];

  id v7 = [(BRCAccountSession *)self appLibraryByMangledID:v6];

  return v7;
}

- (void)assertNotOnZoneMutex
{
}

- (id)__getOrCreateServerZone:(id)a3
{
  id v4 = a3;
  [(BRCPQLConnection *)self->_serverDB assertOnQueue];
  int v5 = [v4 isShared];
  id v6 = [v4 appLibraryOrZoneName];
  [(BRCAccountSession *)self _mutexZonesLock];
  if (v5)
  {
    id v7 = [(NSMutableDictionary *)self->_sharedServerZonesByMangledID objectForKeyedSubscript:v4];
    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v7)
    {
      uint64_t v8 = off_1E6992A90;
      goto LABEL_9;
    }
LABEL_5:
    uint64_t v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSession __getOrCreateServerZone:]();
    }
    goto LABEL_7;
  }
  id v7 = [(NSMutableDictionary *)self->_privateServerZonesByID objectForKeyedSubscript:v6];
  brc_mutex_unlock(&self->_zonesLock.pthread);
  if (v7) {
    goto LABEL_5;
  }
  uint64_t v8 = off_1E6992A30;
LABEL_9:
  id v7 = (id)[objc_alloc(*v8) initWithMangledID:v4 dbRowID:0 plist:0 session:self];
  if ([(BRCAccountSession *)self createServerZone:v7])
  {
    int v11 = brc_bread_crumbs();
    int v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSession __getOrCreateServerZone:]((uint64_t)v7);
    }

    uint64_t v13 = [v7 dbRowID];

    if (v13) {
      goto LABEL_13;
    }
    uint64_t v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession __getOrCreateServerZone:]();
    }
LABEL_7:

LABEL_13:
    id v7 = v7;
    long long v14 = v7;
    goto LABEL_14;
  }
  long long v14 = 0;
LABEL_14:

  return v14;
}

- (id)__getOrCreateClientZone:(id)a3 withServerZone:(id)a4 alreadyExists:(BOOL *)a5
{
  id v8 = a3;
  id v9 = a4;
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  int v10 = [v8 isShared];
  int v11 = [v8 appLibraryOrZoneName];
  if (a5) {
    *a5 = 0;
  }
  [(BRCAccountSession *)self _mutexZonesLock];
  if (v10)
  {
    int v12 = [(NSMutableDictionary *)self->_sharedClientZonesByMangledID objectForKeyedSubscript:v8];
    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v12)
    {
      uint64_t v13 = BRCSharedClientZone;
LABEL_12:
      id v16 = [v13 alloc];
      id v17 = [v9 dbRowID];
      int v12 = (void *)[v16 initWithMangledID:v8 dbRowID:v17 plist:0 session:self initialCreation:1];

      if (![(BRCAccountSession *)self _createClientZone:v12])
      {

        int v12 = 0;
      }
      long long v18 = brc_bread_crumbs();
      id v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountSession __getOrCreateClientZone:withServerZone:alreadyExists:]((uint64_t)v12);
      }

      if (v12)
      {
        [v12 setDelegate:self->_containerScheduler];
        [v12 associateWithServerZone:v9];
        id v20 = [v12 dbRowID];
        long long v21 = [v9 dbRowID];
        char v22 = objc_msgSend(v20, "br_isEqualToNumber:", v21);

        if ((v22 & 1) == 0)
        {
          __int16 v25 = brc_bread_crumbs();
          uint64_t v26 = brc_default_log();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
            -[BRCAccountSession __getOrCreateClientZone:withServerZone:alreadyExists:]();
          }
        }
      }
      goto LABEL_18;
    }
  }
  else
  {
    int v12 = [(NSMutableDictionary *)self->_privateClientZonesByID objectForKeyedSubscript:v11];
    brc_mutex_unlock(&self->_zonesLock.pthread);
    if (!v12)
    {
      uint64_t v13 = BRCPrivateClientZone;
      goto LABEL_12;
    }
  }
  long long v14 = brc_bread_crumbs();
  char v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSession __getOrCreateClientZone:withServerZone:alreadyExists:]();
  }

  if (a5) {
    *a5 = 1;
  }
LABEL_18:
  id v23 = v12;

  return v23;
}

- (id)__getOrCreateAppLibrary:(id)a3 rowID:(id)a4 createOnDisk:(BOOL)a5 alreadyExists:(BOOL *)a6 withClientZone:(id)a7 createCZMMoved:(BOOL)a8
{
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  [(BRCPQLConnection *)self->_clientDB assertOnQueue];
  if (!v15)
  {
    long long v35 = brc_bread_crumbs();
    id v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(BRCDatabaseManager) createServerZone:]();
    }
  }
  __int16 v41 = 0;
  uint64_t v40 = 0;
  if (v11
    && ![(BRCAccountSession *)self createAppLibraryOnDisk:v14 createdRoot:(char *)&v41 + 1 createdDocuments:&v41 rootFileID:&v40])
  {
    uint64_t v28 = 0;
  }
  else
  {
    id v17 = [v14 appLibraryOrZoneName];
    long long v18 = [(BRCAccountSession *)self appLibraryByID:v17];

    if (v18)
    {
      if (HIBYTE(v41))
      {
        id v19 = brc_bread_crumbs();
        id v20 = brc_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
          -[BRCAccountSession __getOrCreateAppLibrary:rowID:createOnDisk:alreadyExists:withClientZone:createCZMMoved:]((uint64_t)v16);
        }

        [v16 scheduleResetServerAndClientTruthsForReason:@"no-root"];
      }
      else if ((_BYTE)v41)
      {
        [(BRCFSReader *)self->_fsReader scanContainerDocumentsIfNeeded:v18];
      }
      id v29 = brc_bread_crumbs();
      id v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountSession __getOrCreateAppLibrary:rowID:createOnDisk:alreadyExists:withClientZone:createCZMMoved:]();
      }

      if (a6) {
        *a6 = 1;
      }
      __int16 v31 = v18;
LABEL_24:
      uint64_t v28 = v31;
      id v33 = v31;
      goto LABEL_26;
    }
    long long v21 = [BRCAppLibrary alloc];
    char v22 = [v16 dbRowID];
    clientDB = self->_clientDB;
    if (v40)
    {
      long long v39 = v21;
      id v24 = v16;
      __int16 v25 = a6;
      BOOL v26 = HIBYTE(v41) != 0;
      uint64_t v27 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:");
      LODWORD(v38) = 1;
      BYTE2(v37) = a8;
      BYTE1(v37) = v26;
      a6 = v25;
      id v16 = v24;
      LOBYTE(v37) = 1;
      uint64_t v28 = -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:](v39, "initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:", v14, v15, v22, clientDB, 0, self, v37, v27, 0, v38);
    }
    else
    {
      LODWORD(v38) = 1;
      BYTE2(v37) = a8;
      LOBYTE(v37) = 1;
      BYTE1(v37) = HIBYTE(v41) != 0;
      uint64_t v28 = -[BRCAppLibrary initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:](v21, "initWithMangledID:dbRowID:zoneRowID:db:plist:session:initialCreation:createdRootOnDisk:createdCZMMoved:rootFileID:childBasehashSalt:saltingState:", v14, v15, v22, clientDB, 0, self, v37, 0, 0, v38);
    }

    if ([(BRCAccountSession *)self _createPrivateAppLibrary:v28])
    {
      [(BRCAppLibrary *)v28 associateWithClientZone:v16];
      [(BRCAppLibrary *)v28 setDelegate:self->_containerScheduler];
      id v32 = [v16 serverZone];
      [(BRCAccountSession *)self __registerServerZone:v32 clientZone:v16 appLibrary:v28 isShared:0];

      if (a6) {
        *a6 = 0;
      }
      __int16 v31 = v28;
      goto LABEL_24;
    }
  }
  id v33 = 0;
LABEL_26:

  return v33;
}

- (void)__registerServerZone:(id)a3 clientZone:(id)a4 appLibrary:(id)a5 isShared:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ((v12 == 0) != v6)
  {
    id v33 = brc_bread_crumbs();
    id v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession __registerServerZone:clientZone:appLibrary:isShared:].cold.4();
    }
  }
  uint64_t v13 = [v10 dbRowID];
  id v14 = v13;
  if (!v13 || v6)
  {

    if (!v14) {
      goto LABEL_5;
    }
LABEL_9:
    [(BRCAccountSession *)self _mutexZonesLock];
    if (v10 && v11)
    {
      if (v6)
      {
        uint64_t v18 = [v10 mangledID];
        if (!v18)
        {
          id v30 = brc_bread_crumbs();
          id v32 = brc_default_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
            -[BRCAccountSession __registerServerZone:clientZone:appLibrary:isShared:]();
          }
          goto LABEL_19;
        }
        id v19 = (void *)v18;
        [(NSMutableDictionary *)self->_sharedClientZonesByMangledID setObject:v11 forKeyedSubscript:v18];
        sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
        id v21 = v10;
      }
      else
      {
        char v22 = [v10 zoneName];

        if (!v22)
        {
          id v30 = brc_bread_crumbs();
          id v32 = brc_default_log();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
            -[BRCAccountSession __registerServerZone:clientZone:appLibrary:isShared:]();
          }
          goto LABEL_19;
        }
        privateServerZonesByID = self->_privateServerZonesByID;
        id v24 = [v10 zoneName];
        [(NSMutableDictionary *)privateServerZonesByID setObject:v10 forKeyedSubscript:v24];

        privateClientZonesByID = self->_privateClientZonesByID;
        id v19 = [v10 zoneName];
        sharedServerZonesByMangledID = privateClientZonesByID;
        id v21 = v11;
      }
      [(NSMutableDictionary *)sharedServerZonesByMangledID setObject:v21 forKeyedSubscript:v19];

      serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
      uint64_t v27 = [v10 dbRowID];
      [(NSMutableDictionary *)serverZonesByZoneRowID setObject:v10 forKeyedSubscript:v27];
    }
    if (!v12)
    {
LABEL_20:
      brc_mutex_unlock(&self->_zonesLock.pthread);
      goto LABEL_21;
    }
    appLibrariesByRowID = self->_appLibrariesByRowID;
    id v29 = [v12 dbRowID];
    [(NSMutableDictionary *)appLibrariesByRowID setObject:v12 forKeyedSubscript:v29];

    id v30 = [v12 dbRowID];
    libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
    id v32 = [v12 mangledID];
    [(NSMutableDictionary *)libraryRowIDsByMangledID setObject:v30 forKeyedSubscript:v32];
LABEL_19:

    goto LABEL_20;
  }
  id v15 = [v12 dbRowID];

  if (v15) {
    goto LABEL_9;
  }
LABEL_5:
  id v16 = brc_bread_crumbs();
  id v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[BRCAccountSession __registerServerZone:clientZone:appLibrary:isShared:]();
  }

LABEL_21:
}

- (BOOL)_shouldPrivateAppLibraryBeCZMMoved:(id)a3
{
  id v4 = a3;
  if ([v4 isCloudDocsMangledID])
  {
    char v5 = 0;
  }
  else
  {
    BOOL v6 = [(BRCAccountSession *)self appLibraryByID:*MEMORY[0x1E4F59418]];
    if ([v6 wasMovedToCloudDocs])
    {
      id v7 = +[BRCUserDefaults defaultsForMangledID:v4];
      char v5 = [v7 shouldAutoMigrateToCloudDocs];
    }
    else
    {
      char v5 = 0;
    }
  }
  return v5;
}

- (id)_getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3 creationFlags:(unsigned int *)a4
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v63 = 0;
  int v64 = &v63;
  uint64_t v65 = 0x3032000000;
  id v66 = __Block_byref_object_copy__40;
  char v67 = __Block_byref_object_dispose__40;
  id v68 = 0;
  uint64_t v57 = 0;
  int v58 = &v57;
  uint64_t v59 = 0x3032000000;
  long long v60 = __Block_byref_object_copy__40;
  int v61 = __Block_byref_object_dispose__40;
  id v62 = 0;
  uint64_t v51 = 0;
  uint64_t v52 = &v51;
  uint64_t v53 = 0x3032000000;
  uint64_t v54 = __Block_byref_object_copy__40;
  uint64_t v55 = __Block_byref_object_dispose__40;
  id v56 = 0;
  id v7 = [(BRCPQLConnection *)self->_clientDB serialQueue];
  dispatch_assert_queue_not_V2(v7);

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_clientTruthWorkloop);
  id v8 = [(BRCPQLConnection *)self->_serverDB serialQueue];
  dispatch_assert_queue_not_V2(v8);

  dispatch_assert_queue_not_V2((dispatch_queue_t)self->_serverTruthWorkloop);
  if (a4) {
    *a4 = 0;
  }
  BOOL v9 = [(BRCAccountSession *)self _shouldPrivateAppLibraryBeCZMMoved:v6];
  memset(v50, 0, sizeof(v50));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession _getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:]", 3952, v50);
  brc_bread_crumbs();
  id v10 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
  id v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    *(void *)&uint8_t buf[4] = v50[0];
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    *(_WORD *)&buf[22] = 2112;
    long long v70 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Creating app library and zones: %@ if needed%@", buf, 0x20u);
  }

  if (v6 && ![v6 isShared])
  {
    brc_mutex_lock(&self->_zonesCreationLock.pthread);
    uint64_t v15 = [(BRCAccountSession *)self appLibraryByMangledID:v6];
    id v16 = (void *)v64[5];
    v64[5] = v15;

    uint64_t v17 = [(id)v64[5] defaultClientZone];
    uint64_t v18 = (void *)v58[5];
    v58[5] = v17;

    uint64_t v19 = [(id)v58[5] privateServerZone];
    id v20 = (void *)v52[5];
    v52[5] = v19;

    if (v52[5])
    {
      brc_mutex_unlock(&self->_zonesCreationLock.pthread);
      id v21 = brc_bread_crumbs();
      char v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v32 = v52[5];
        uint64_t v33 = v58[5];
        id v34 = (uint64_t (*)(uint64_t, uint64_t))v64[5];
        *(_DWORD *)buf = 138413058;
        *(void *)&uint8_t buf[4] = v32;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v33;
        *(_WORD *)&buf[22] = 2112;
        long long v70 = v34;
        LOWORD(v71) = 2112;
        *(void *)((char *)&v71 + 2) = v21;
        _os_log_debug_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] returning early server zone: %@\nclient zone: %@\napp library: %@%@", buf, 0x2Au);
      }

      if (a4) {
        *a4 = 1;
      }
    }
    else
    {
      if (![(BRCAccountSession *)self isCancelled])
      {
        *(void *)buf = 0;
        *(void *)&buf[8] = buf;
        *(void *)&buf[16] = 0x3032000000;
        long long v70 = __Block_byref_object_copy__40;
        *(void *)&long long v71 = __Block_byref_object_dispose__40;
        *((void *)&v71 + 1) = 0;
        serverDB = self->_serverDB;
        v45[0] = MEMORY[0x1E4F143A8];
        v45[1] = 3221225472;
        v45[2] = __84__BRCAccountSession__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke;
        v45[3] = &unk_1E69991F0;
        BOOL v49 = v9;
        uint64_t v47 = &v51;
        void v45[4] = self;
        id v24 = v6;
        id v46 = v24;
        id v48 = buf;
        [(BRCPQLConnection *)serverDB performWithFlags:19 action:v45];
        if (v52[5])
        {
          clientDB = self->_clientDB;
          v37[0] = MEMORY[0x1E4F143A8];
          v37[1] = 3221225472;
          v37[2] = __84__BRCAccountSession__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_298;
          v37[3] = &unk_1E6999218;
          BOOL v44 = v9;
          long long v39 = &v57;
          void v37[4] = self;
          id v38 = v24;
          uint64_t v40 = &v51;
          __int16 v41 = &v63;
          long long v42 = buf;
          uint64_t v43 = a4;
          [(BRCPQLConnection *)clientDB performWithFlags:23 action:v37];
        }
        _Block_object_dispose(buf, 8);
      }
      brc_mutex_unlock(&self->_zonesCreationLock.pthread);
      if (v64[5])
      {
        BOOL v26 = brc_bread_crumbs();
        uint64_t v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v28 = v64[5];
          uint64_t v29 = v52[5];
          id v30 = (uint64_t (*)(uint64_t, uint64_t))v58[5];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v28;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v29;
          *(_WORD *)&buf[22] = 2112;
          long long v70 = v30;
          LOWORD(v71) = 2112;
          *(void *)((char *)&v71 + 2) = v26;
          _os_log_debug_impl(&dword_1D353B000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] returning app library %@\nserver zone:%@\n, client zone: %@%@", buf, 0x2Au);
        }
      }
      else
      {
        BOOL v26 = brc_bread_crumbs();
        uint64_t v27 = brc_default_log();
        if (os_log_type_enabled(v27, (os_log_type_t)0x90u))
        {
          uint64_t v35 = v52[5];
          id v36 = (uint64_t (*)(uint64_t, uint64_t))v58[5];
          *(_DWORD *)buf = 138413058;
          *(void *)&uint8_t buf[4] = v6;
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v35;
          *(_WORD *)&buf[22] = 2112;
          long long v70 = v36;
          LOWORD(v71) = 2112;
          *(void *)((char *)&v71 + 2) = v26;
          _os_log_error_impl(&dword_1D353B000, v27, (os_log_type_t)0x90u, "[ERROR] couldn't create app library\n appID: %@\nserverZone: %@\nclientZone: %@%@", buf, 0x2Au);
        }
      }
    }
    id v14 = (id)v64[5];
  }
  else
  {
    id v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession _getOrCreateAppLibraryAndPrivateZonesIfNecessary:creationFlags:]((uint64_t)v6);
    }

    id v14 = 0;
  }
  __brc_leave_section(v50);
  _Block_object_dispose(&v51, 8);

  _Block_object_dispose(&v57, 8);
  _Block_object_dispose(&v63, 8);

  return v14;
}

uint64_t __84__BRCAccountSession__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (*(unsigned char *)(a1 + 64))
  {
    uint64_t v5 = [v4 privateServerZoneByID:*MEMORY[0x1E4F59418]];
    uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
    id v7 = *(void **)(v6 + 40);
    *(void *)(v6 + 40) = v5;

    if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40)) {
      goto LABEL_8;
    }
    id v8 = brc_bread_crumbs();
    BOOL v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession serverZoneByRowID:]();
    }
  }
  else
  {
    id v8 = objc_msgSend(v4, "__getOrCreateServerZone:", *(void *)(a1 + 40));
    uint64_t v10 = [v8 asPrivateZone];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;
  }
LABEL_8:
  if (*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    uint64_t v13 = [*(id *)(a1 + 32) getOrReserveLibraryRowIDForLibrary:*(void *)(a1 + 40)];
    uint64_t v14 = *(void *)(*(void *)(a1 + 56) + 8);
    uint64_t v15 = *(void **)(v14 + 40);
    *(void *)(v14 + 40) = v13;
  }
  return 1;
}

uint64_t __84__BRCAccountSession__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_298(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  if (!*(unsigned char *)(a1 + 88))
  {
    id v8 = objc_msgSend(v4, "__getOrCreateClientZone:withServerZone:alreadyExists:", *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), 0);
    uint64_t v10 = [v8 asPrivateClientZone];
    uint64_t v11 = *(void *)(*(void *)(a1 + 48) + 8);
    id v12 = *(void **)(v11 + 40);
    *(void *)(v11 + 40) = v10;

LABEL_7:
    goto LABEL_8;
  }
  uint64_t v5 = [v4 privateClientZoneByID:*MEMORY[0x1E4F59418]];
  uint64_t v6 = *(void *)(*(void *)(a1 + 48) + 8);
  id v7 = *(void **)(v6 + 40);
  *(void *)(v6 + 40) = v5;

  if (!*(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40))
  {
    id v8 = brc_bread_crumbs();
    BOOL v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __84__BRCAccountSession__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_298_cold_1();
    }

    goto LABEL_7;
  }
LABEL_8:
  uint64_t v13 = *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 40);
  if (v13)
  {
    char v21 = 0;
    uint64_t v14 = objc_msgSend(*(id *)(a1 + 32), "__getOrCreateAppLibrary:rowID:createOnDisk:alreadyExists:withClientZone:createCZMMoved:", *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), 1, &v21, v13, *(unsigned __int8 *)(a1 + 88));
    uint64_t v15 = *(void *)(*(void *)(a1 + 64) + 8);
    id v16 = *(void **)(v15 + 40);
    *(void *)(v15 + 40) = v14;

    uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    if (v17)
    {
      uint64_t v18 = *(int **)(a1 + 80);
      if (v21)
      {
        if (v18)
        {
          int v19 = 1;
LABEL_15:
          *uint64_t v18 = v19;
        }
      }
      else
      {
        if (v18)
        {
          int v19 = 2 * (*(unsigned char *)(a1 + 88) != 0);
          goto LABEL_15;
        }
        if (!*(unsigned char *)(a1 + 88) && !*(unsigned char *)(*(void *)(a1 + 32) + 121))
        {
          [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) resume];
          uint64_t v17 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
        }
        [v17 activate];
        [*(id *)(*(void *)(a1 + 32) + 432) scanContainerDocumentsIfNeeded:*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40)];
      }
    }
  }

  return 1;
}

- (id)getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3
{
  return [(BRCAccountSession *)self _getOrCreateAppLibraryAndPrivateZonesIfNecessary:a3 creationFlags:0];
}

- (id)getOrCreateAppLibraryAndPrivateZonesIfNecessary:(id)a3 appLibraryExists:(BOOL *)a4
{
  int v13 = 0;
  uint64_t v6 = [(BRCAccountSession *)self _getOrCreateAppLibraryAndPrivateZonesIfNecessary:a3 creationFlags:&v13];
  if (v6 && v13 != 1)
  {
    id v7 = [(BRCAccountSession *)self clientDB];
    id v8 = [v7 serialQueue];
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __86__BRCAccountSession_getOrCreateAppLibraryAndPrivateZonesIfNecessary_appLibraryExists___block_invoke;
    uint64_t v10[3] = &unk_1E6999240;
    int v12 = v13;
    id v11 = v6;
    dispatch_sync(v8, v10);
  }
  if (a4) {
    *a4 = v13 == 1;
  }
  return v6;
}

uint64_t __86__BRCAccountSession_getOrCreateAppLibraryAndPrivateZonesIfNecessary_appLibraryExists___block_invoke(uint64_t a1)
{
  if (!*(_DWORD *)(a1 + 40))
  {
    uint64_t v2 = [*(id *)(a1 + 32) defaultClientZone];
    [v2 resume];
  }
  id v3 = *(void **)(a1 + 32);
  return [v3 activate];
}

- (id)getOrCreateSharedZones:(id)a3
{
  return [(BRCAccountSession *)self getOrCreateSharedZones:a3 shareAcceptOp:0];
}

- (id)getOrCreateSharedZones:(id)a3 shareAcceptOp:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isShared] & 1) == 0)
  {
    char v21 = brc_bread_crumbs();
    char v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession getOrCreateSharedZones:shareAcceptOp:]();
    }
  }
  id v8 = self->_serverDB;
  BOOL v9 = [(BRCPQLConnection *)v8 serialQueue];

  if (v9)
  {
    uint64_t v10 = [(BRCPQLConnection *)v8 serialQueue];
    dispatch_assert_queue_not_V2(v10);
  }
  id v11 = self->_clientDB;
  int v12 = [(BRCPQLConnection *)v11 serialQueue];

  if (v12)
  {
    int v13 = [(BRCPQLConnection *)v11 serialQueue];
    dispatch_assert_queue_not_V2(v13);
  }
  p_zonesCreationLocuint64_t k = &self->_zonesCreationLock;
  brc_mutex_lock(&self->_zonesCreationLock.pthread);
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = __Block_byref_object_copy__40;
  id v48 = __Block_byref_object_dispose__40;
  id v49 = [(BRCAccountSession *)self clientZoneByMangledID:v6];
  uint64_t v38 = 0;
  long long v39 = &v38;
  uint64_t v40 = 0x3032000000;
  __int16 v41 = __Block_byref_object_copy__40;
  long long v42 = __Block_byref_object_dispose__40;
  id v43 = [(id)v45[5] serverZone];
  if (v39[5])
  {
    if (v7)
    {
      clientTruthWorkloop = self->_clientTruthWorkloop;
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __58__BRCAccountSession_getOrCreateSharedZones_shareAcceptOp___block_invoke;
      block[3] = &unk_1E6996218;
      uint64_t v37 = &v44;
      id v36 = v7;
      dispatch_async_and_wait(clientTruthWorkloop, block);
    }
    brc_mutex_unlock(&p_zonesCreationLock->pthread);
    id v16 = [(id)v45[5] asSharedClientZone];
  }
  else
  {
    serverDB = self->_serverDB;
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = __58__BRCAccountSession_getOrCreateSharedZones_shareAcceptOp___block_invoke_2;
    v32[3] = &unk_1E6998510;
    id v34 = &v38;
    void v32[4] = self;
    id v18 = v6;
    id v33 = v18;
    [(BRCPQLConnection *)serverDB performWithFlags:19 action:v32];
    clientDB = self->_clientDB;
    uint64_t v23 = MEMORY[0x1E4F143A8];
    uint64_t v24 = 3221225472;
    __int16 v25 = __58__BRCAccountSession_getOrCreateSharedZones_shareAcceptOp___block_invoke_3;
    BOOL v26 = &unk_1E6999268;
    id v30 = &v44;
    uint64_t v27 = self;
    id v28 = v18;
    __int16 v31 = &v38;
    id v29 = v7;
    [(BRCPQLConnection *)clientDB performWithFlags:19 action:&v23];
    brc_mutex_unlock(&self->_zonesCreationLock.pthread);
    id v16 = objc_msgSend((id)v45[5], "asSharedClientZone", v23, v24, v25, v26, v27);
  }
  _Block_object_dispose(&v38, 8);

  _Block_object_dispose(&v44, 8);
  return v16;
}

uint64_t __58__BRCAccountSession_getOrCreateSharedZones_shareAcceptOp___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) addSyncDownDependency:*(void *)(a1 + 32)];
}

uint64_t __58__BRCAccountSession_getOrCreateSharedZones_shareAcceptOp___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__getOrCreateServerZone:", *(void *)(a1 + 40));
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  return 1;
}

uint64_t __58__BRCAccountSession_getOrCreateSharedZones_shareAcceptOp___block_invoke_3(uint64_t a1)
{
  char v7 = 0;
  uint64_t v2 = objc_msgSend(*(id *)(a1 + 32), "__getOrCreateClientZone:withServerZone:alreadyExists:", *(void *)(a1 + 40), *(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), &v7);
  uint64_t v3 = *(void *)(*(void *)(a1 + 56) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if (*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) && v7 == 0)
    {
      objc_msgSend(*(id *)(a1 + 32), "__registerServerZone:clientZone:appLibrary:isShared:");
      [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) resume];
    }
  }
  if (*(void *)(a1 + 48)) {
    objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), "addSyncDownDependency:");
  }
  return 1;
}

- (id)getOrReserveLibraryRowIDForLibrary:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(BRCPQLConnection *)self->_serverDB assertOnQueue];
  if ([v4 isShared])
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession getOrReserveLibraryRowIDForLibrary:]();
    }

    char v7 = 0;
  }
  else
  {
    brc_mutex_lock(&self->_zonesLock.pthread);
    char v7 = [(NSMutableDictionary *)self->_libraryRowIDsByMangledID objectForKeyedSubscript:v4];
    if (!v7)
    {
      id v8 = [v4 appLibraryOrZoneName];
      char v7 = [(BRCAccountSession *)self _reserveRowIDForLibrary:v8];

      BOOL v9 = brc_bread_crumbs();
      uint64_t v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        int v12 = 138412802;
        int v13 = v7;
        __int16 v14 = 2112;
        id v15 = v4;
        __int16 v16 = 2112;
        uint64_t v17 = v9;
        _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] reserved rowid %@ for %@%@", (uint8_t *)&v12, 0x20u);
      }

      if (v7) {
        [(NSMutableDictionary *)self->_libraryRowIDsByMangledID setObject:v7 forKeyedSubscript:v4];
      }
    }
    brc_mutex_unlock(&self->_zonesLock.pthread);
  }

  return v7;
}

- (void)fetchUserRecordIDWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (fetchUserRecordIDWithCompletionHandler__onceToken != -1) {
    dispatch_once(&fetchUserRecordIDWithCompletionHandler__onceToken, &__block_literal_global_303);
  }
  uint64_t v5 = fetchUserRecordIDWithCompletionHandler__fetchUserRecordIDQueue;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_2;
  v7[3] = &unk_1E6994600;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

void __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke()
{
  uint64_t v3 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  uint64_t v0 = dispatch_queue_attr_make_with_autorelease_frequency(v3, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  dispatch_queue_t v1 = dispatch_queue_create("fetch-user-recordID", v0);

  uint64_t v2 = (void *)fetchUserRecordIDWithCompletionHandler__fetchUserRecordIDQueue;
  fetchUserRecordIDWithCompletionHandler__fetchUserRecordIDQueue = (uint64_t)v1;
}

void __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = *(id *)(*(void *)(a1 + 32) + 176);
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  char v22 = __Block_byref_object_copy__40;
  uint64_t v23 = __Block_byref_object_dispose__40;
  id v24 = 0;
  v17[0] = 0;
  v17[1] = v17;
  v17[2] = 0x3032000000;
  uint64_t v17[3] = __Block_byref_object_copy__40;
  v17[4] = __Block_byref_object_dispose__40;
  id v18 = 0;
  objc_sync_enter(@"currentUserRecordID");
  uint64_t v3 = [v2 objectForKeyedSubscript:@"currentUserRecordID"];
  id v4 = (void *)v20[5];
  void v20[5] = v3;

  objc_sync_exit(@"currentUserRecordID");
  if (!v20[5])
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_2_cold_1();
    }

    dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
    id v8 = [*(id *)(a1 + 32) syncContextProvider];
    BOOL v9 = [v8 defaultSyncContext];
    uint64_t v10 = [v9 ckContainer];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_305;
    v12[3] = &unk_1E69992B8;
    id v15 = v17;
    __int16 v16 = &v19;
    v12[4] = *(void *)(a1 + 32);
    id v13 = v2;
    id v11 = v7;
    __int16 v14 = v11;
    [v10 fetchUserRecordIDWithCompletionHandler:v12];

    dispatch_semaphore_wait(v11, 0xFFFFFFFFFFFFFFFFLL);
  }
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  _Block_object_dispose(v17, 8);

  _Block_object_dispose(&v19, 8);
}

void __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_305(uint64_t a1, void *a2, void *a3)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a2;
  id v7 = a3;
  id v8 = brc_bread_crumbs();
  BOOL v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v19 = v6;
    __int16 v20 = 2112;
    id v21 = v7;
    __int16 v22 = 2112;
    uint64_t v23 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] fetched user record id %@ with error %@%@", buf, 0x20u);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), a3);
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), a2);
  if (*(void *)(*(void *)(*(void *)(a1 + 64) + 8) + 40))
  {
    uint64_t v10 = *(NSObject **)(*(void *)(a1 + 32) + 48);
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_306;
    uint64_t v13[3] = &unk_1E6999290;
    id v11 = *(id *)(a1 + 40);
    uint64_t v17 = *(void *)(a1 + 64);
    uint64_t v12 = *(void *)(a1 + 32);
    id v14 = v11;
    uint64_t v15 = v12;
    id v16 = *(id *)(a1 + 48);
    dispatch_async(v10, v13);
  }
  else
  {
    dispatch_semaphore_signal(*(dispatch_semaphore_t *)(a1 + 48));
  }
}

intptr_t __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_306(uint64_t a1)
{
  objc_sync_enter(@"currentUserRecordID");
  [*(id *)(a1 + 32) setObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) forKeyedSubscript:@"currentUserRecordID"];
  [*(id *)(*(void *)(a1 + 40) + 144) forceBatchStart];
  objc_sync_exit(@"currentUserRecordID");
  id v2 = *(NSObject **)(a1 + 48);
  return dispatch_semaphore_signal(v2);
}

- (id)cachedCurrentUserRecordName
{
  id v2 = [(BRCAccountSession *)self cachedCurrentUserRecordNameIfExists];
  if (!v2)
  {
    id v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession cachedCurrentUserRecordName]();
    }
  }
  return v2;
}

- (id)cachedCurrentUserRecordNameIfExists
{
  id v2 = self->_clientState;
  objc_sync_enter(@"currentUserRecordID");
  uint64_t v3 = [(BRCClientState *)v2 objectForKeyedSubscript:@"currentUserRecordID"];
  id v4 = [v3 recordName];

  objc_sync_exit(@"currentUserRecordID");
  return v4;
}

- (void)_cloudDocsAppsListDidChange:(id)a3
{
  id v4 = a3;
  if (!self->_isCancelled)
  {
    if (objc_msgSend(MEMORY[0x1E4FB36F8], "br_isInSyncBubble"))
    {
      uint64_t v5 = brc_bread_crumbs();
      id v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountSession _cloudDocsAppsListDidChange:]();
      }
    }
    else
    {
      uint64_t v16 = 0;
      uint64_t v17 = &v16;
      uint64_t v18 = 0x3032000000;
      id v19 = __Block_byref_object_copy__40;
      __int16 v20 = __Block_byref_object_dispose__40;
      id v21 = 0;
      v14[0] = 0;
      v14[1] = v14;
      v14[2] = 0x3032000000;
      uint64_t v14[3] = __Block_byref_object_copy__40;
      void v14[4] = __Block_byref_object_dispose__40;
      id v15 = 0;
      memset(v13, 0, sizeof(v13));
      __brc_create_section(0, (uint64_t)"-[BRCAccountSession _cloudDocsAppsListDidChange:]", 4261, v13);
      id v7 = brc_bread_crumbs();
      id v8 = brc_default_log();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
        -[BRCAccountSession _cloudDocsAppsListDidChange:]();
      }

      v12[0] = MEMORY[0x1E4F143A8];
      v12[1] = 3221225472;
      v12[2] = __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke;
      v12[3] = &unk_1E6999330;
      v12[4] = self;
      void v12[5] = &v16;
      void v12[6] = v14;
      [v4 enumerateKeysAndObjectsUsingBlock:v12];
      [(id)v17[5] invalidate];
      BOOL v9 = [(BRCAccountSession *)self clientDB];
      uint64_t v10 = [v9 serialQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_6;
      block[3] = &unk_1E6993698;
      void block[4] = self;
      dispatch_sync(v10, block);

      __brc_leave_section(v13);
      _Block_object_dispose(v14, 8);

      _Block_object_dispose(&v16, 8);
    }
  }
}

void __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke(uint64_t a1, void *a2, void *a3, unsigned char *a4)
{
  id v7 = a2;
  id v8 = a3;
  BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4F594E8]) initWithAppLibraryName:v7];
  uint64_t v10 = [*(id *)(a1 + 32) getOrCreateAppLibraryAndPrivateZonesIfNecessary:v9];
  uint64_t v26 = 0;
  uint64_t v27 = &v26;
  uint64_t v28 = 0x2020000000;
  char v29 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_2;
  v20[3] = &unk_1E6999308;
  uint64_t v11 = *(void *)(a1 + 32);
  uint64_t v23 = *(void *)(a1 + 40);
  void v20[4] = v11;
  id v12 = v10;
  uint64_t v13 = *(void *)(a1 + 48);
  id v21 = v12;
  uint64_t v24 = v13;
  id v14 = v7;
  id v22 = v14;
  __int16 v25 = &v26;
  [v8 enumerateObjectsUsingBlock:v20];
  id v15 = *(unsigned char **)(a1 + 32);
  if (v15[561])
  {
    *a4 = 1;
  }
  else if (*((unsigned char *)v27 + 24))
  {
    uint64_t v16 = [v15 clientDB];
    uint64_t v17 = [v16 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_5;
    block[3] = &unk_1E6993698;
    id v19 = v12;
    dispatch_sync(v17, block);
  }
  _Block_object_dispose(&v26, 8);
}

void __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_2(uint64_t a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (!*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40))
  {
    uint64_t v6 = BRCBundleServiceConnection();
    uint64_t v7 = *(void *)(*(void *)(a1 + 56) + 8);
    id v8 = *(void **)(v7 + 40);
    *(void *)(v7 + 40) = v6;
  }
  if (*(unsigned char *)(*(void *)(a1 + 32) + 561))
  {
    *a3 = 1;
  }
  else
  {
    BOOL v9 = [*(id *)(a1 + 40) containerMetadata];
    uint64_t v10 = [v9 versionNumberForBundleIdentifier:v5];

    uint64_t v11 = [objc_alloc(MEMORY[0x1E4F59580]) initWithXPCObject:*(void *)(*(void *)(*(void *)(a1 + 56) + 8) + 40)];
    uint64_t v12 = *(void *)(*(void *)(a1 + 64) + 8);
    uint64_t v13 = *(void **)(v12 + 40);
    *(void *)(v12 + 40) = v11;

    id v14 = *(void **)(*(void *)(*(void *)(a1 + 64) + 8) + 40);
    uint64_t v17 = MEMORY[0x1E4F143A8];
    uint64_t v18 = 3221225472;
    id v19 = __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_3;
    __int16 v20 = &unk_1E69992E0;
    uint64_t v15 = *(void *)(a1 + 48);
    id v21 = *(id *)(a1 + 40);
    id v22 = v5;
    int8x16_t v23 = vextq_s8(*(int8x16_t *)(a1 + 64), *(int8x16_t *)(a1 + 64), 8uLL);
    [v14 extractMetadataForContainerID:v15 bundleID:v22 minimumBundleVersion:v10 reply:&v17];
    id v16 = (id)objc_msgSend(*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40), "result", v17, v18, v19, v20);
  }
}

void __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_3(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = [*(id *)(a1 + 32) containerMetadata];
  int v11 = [v10 isDocumentScopePublic];

  if (v7)
  {
    uint64_t v12 = [*(id *)(a1 + 32) containerMetadata];
    int v13 = [v12 updateMetadataWithExtractorProperties:v7 iconPaths:v8 bundleID:*(void *)(a1 + 40)];

    if (v13) {
      *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = 1;
    }
  }
  id v14 = [*(id *)(a1 + 32) containerMetadata];
  int v15 = [v14 isDocumentScopePublic];

  if (v11 != v15)
  {
    id v16 = brc_task_tracker_create("apps-list-did-change");
    uint64_t v17 = [*(id *)(a1 + 32) db];
    uint64_t v18 = [v17 serialQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_4;
    v19[3] = &unk_1E6993698;
    id v20 = *(id *)(a1 + 32);
    brc_task_tracker_async_with_logs(v16, v18, v19, 0);
  }
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) setBoolResult:v9 == 0 error:v9];
}

uint64_t __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_4(uint64_t a1)
{
  return [*(id *)(a1 + 32) didUpdateDocumentScopePublic];
}

uint64_t __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_5(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleContainerMetadataSyncUp];
}

void __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_6(uint64_t a1)
{
  uint64_t v4 = 0;
  id v5 = &v4;
  uint64_t v6 = 0x2020000000;
  char v7 = 0;
  id v2 = *(void **)(a1 + 32);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_7;
  v3[3] = &unk_1E6999358;
  v3[4] = &v4;
  [v2 enumeratePrivateClientZones:v3];
  if (*((unsigned char *)v5 + 24)) {
    [*(id *)(*(void *)(a1 + 32) + 600) refreshPushRegistrationAfterAppsListChanged];
  }
  _Block_object_dispose(&v4, 8);
}

uint64_t __49__BRCAccountSession__cloudDocsAppsListDidChange___block_invoke_7(uint64_t a1, void *a2)
{
  if ([a2 recomputeAppSyncBlockState]) {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 32) + 8) + 24) = 1;
  }
  return 1;
}

- (void)cloudDocsAppsListDidChange:(id)a3
{
  id v4 = a3;
  id v3 = v4;
  BRPerformWithPersonaAndError();
}

void __48__BRCAccountSession_cloudDocsAppsListDidChange___block_invoke(uint64_t a1, uint64_t a2)
{
  if (a2)
  {
    id v2 = brc_bread_crumbs();
    id v3 = brc_default_log();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
      __48__BRCAccountSession_cloudDocsAppsListDidChange___block_invoke_cold_1();
    }
  }
  else
  {
    uint64_t v4 = *(void *)(a1 + 40);
    id v5 = *(void **)(a1 + 32);
    [v5 _cloudDocsAppsListDidChange:v4];
  }
}

- (void)recomputeAppSyncBlockStateForPrivateClientZone:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAccountSession *)self clientDB];
  [v5 assertOnQueue];

  LODWORD(v5) = [v4 recomputeAppSyncBlockState];
  if (v5)
  {
    containerScheduler = self->_containerScheduler;
    [(BRCContainerScheduler *)containerScheduler refreshPushRegistrationAfterAppsListChanged];
  }
}

- (BOOL)hasOptimizeStorageEnabled
{
  id v3 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  id v4 = (id)*MEMORY[0x1E4F59478];
  id v5 = [MEMORY[0x1E4FB36F8] sharedManager];
  uint64_t v6 = [v5 currentPersona];
  int v7 = [v6 isEnterprisePersona];

  if (v7)
  {
    uint64_t v8 = [NSString stringWithFormat:@"%@-%@", *MEMORY[0x1E4F59470], self->_accountDSID];

    id v4 = (id)v8;
  }
  id v9 = [v3 objectForKey:v4];
  if (!v9)
  {
    [(BRCAccountSession *)self setOptimizeStorageEnabled:1 forKey:v4 synchronous:0];
    id v9 = (void *)MEMORY[0x1E4F1CC38];
  }
  char v10 = [v9 BOOLValue];

  return v10;
}

- (void)setOptimizeStorageEnabled:(BOOL)a3 forKey:(id)a4 synchronous:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a3;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = [MEMORY[0x1E4F1CB18] standardUserDefaults];
  memset(v20, 0, sizeof(v20));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession setOptimizeStorageEnabled:forKey:synchronous:]", 4377, v20);
  char v10 = brc_bread_crumbs();
  int v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    id v16 = "disabling";
    *(_DWORD *)buf = 134219010;
    if (v6) {
      id v16 = "enabling";
    }
    uint64_t v22 = v20[0];
    uint64_t v17 = "NO";
    __int16 v23 = 2080;
    uint64_t v24 = v16;
    __int16 v25 = 2112;
    if (v5) {
      uint64_t v17 = "YES";
    }
    id v26 = v8;
    __int16 v27 = 2080;
    uint64_t v28 = v17;
    __int16 v29 = 2112;
    id v30 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx %s storage optimization for %@ synchronous %s%@", buf, 0x34u);
  }

  uint64_t v12 = [NSNumber numberWithBool:v6];
  [v9 setObject:v12 forKey:v8];

  [v9 synchronize];
  if (!v6)
  {
    int v13 = brc_task_tracker_create("download-all-tracker");
    id v14 = [(BRCPQLConnection *)self->_clientDB serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __66__BRCAccountSession_setOptimizeStorageEnabled_forKey_synchronous___block_invoke;
    block[3] = &unk_1E6993628;
    void block[4] = self;
    id v15 = v13;
    id v19 = v15;
    dispatch_sync(v14, block);

    brc_task_tracker_wait((uint64_t)v15);
  }
  BRPostAccountTokenChangedNotification();
  __brc_leave_section(v20);
}

void __66__BRCAccountSession_setOptimizeStorageEnabled_forKey_synchronous___block_invoke(uint64_t a1)
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __66__BRCAccountSession_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_2;
  v2[3] = &unk_1E6994388;
  dispatch_queue_t v1 = *(void **)(a1 + 32);
  id v3 = *(id *)(a1 + 40);
  [v1 enumerateAppLibraries:v2];
}

uint64_t __66__BRCAccountSession_setOptimizeStorageEnabled_forKey_synchronous___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 fetchRootItem];
  [v3 startDownloadInTask:*(void *)(a1 + 32) options:1 etagIfLoser:0 stageFileName:0 error:0];

  return 1;
}

- (void)setOptimizeStorageEnabled:(BOOL)a3 synchronous:(BOOL)a4
{
}

- (void)startDownloadsForGreediness
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _isGreedy%@", v2, v3, v4, v5, v6);
}

uint64_t __48__BRCAccountSession_startDownloadsForGreediness__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __48__BRCAccountSession_startDownloadsForGreediness__block_invoke_2;
  v5[3] = &unk_1E6999380;
  id v6 = v2;
  id v3 = v2;
  [v3 enumerateFaultsAsyncWithBlock:v5 batchSize:200];

  return 1;
}

uint64_t __48__BRCAccountSession_startDownloadsForGreediness__block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = [a2 asDocument];
  if ([v3 shouldBeGreedy])
  {
    uint64_t v4 = [*(id *)(a1 + 32) taskTracker];
    [v3 startDownloadInTask:v4 options:1 etagIfLoser:0 stageFileName:0 error:0];
  }
  return 1;
}

- (BOOL)isGreedy
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  if ([(BRCAccountSession *)self hasOptimizeStorageEnabled])
  {
    id v3 = +[BRCUserDefaults defaultsForMangledID:0];
    if (([v3 shouldSessionBeGreedy] & 1) == 0)
    {
      BOOL v16 = 0;
      self->_BOOL isGreedy = 0;
      goto LABEL_32;
    }
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      -[BRCAccountSession isGreedy]();
    }

    BOOL isGreedy = self->_isGreedy;
    unint64_t v7 = [(BRCFSDownloader *)self->_fsDownloader sizeOfActiveDownloads];
    unint64_t v8 = [(BRCAccountSession *)self availableDiskSpace];
    unint64_t v9 = [v3 maximumAccountSizeToBeAlwaysGreedy];
    if (v9 && (unint64_t v10 = v9, [(BRCAccountSession *)self accountSize] < v9))
    {
      if (self->_isGreedy) {
        goto LABEL_28;
      }
      int v11 = brc_bread_crumbs();
      BOOL v12 = 1;
      int v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v14 = +[BRCDumpContext stringFromByteCount:v10 showActualByteCount:0 suffix:0 context:0];
        int v32 = 138412546;
        id v33 = v14;
        __int16 v34 = 2112;
        uint64_t v35 = v11;
        _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] we will now download new documents automatically because the account contains less than %@%@", (uint8_t *)&v32, 0x16u);
      }
    }
    else if (self->_isGreedy)
    {
      unint64_t v17 = [v3 minimumDiskSpaceRequiredToBeGreedy];
      unint64_t v18 = v17;
      if (v8 >= v7 && v8 - v7 >= v17) {
        goto LABEL_28;
      }
      int v11 = brc_bread_crumbs();
      int v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        id v19 = +[BRCDumpContext stringFromByteCount:v8 showActualByteCount:0 suffix:0 context:0];
        id v20 = +[BRCDumpContext stringFromByteCount:v7 showActualByteCount:0 suffix:0 context:0];
        id v21 = +[BRCDumpContext stringFromByteCount:v18 showActualByteCount:0 suffix:0 context:0];
        int v32 = 138413058;
        id v33 = v19;
        __int16 v34 = 2112;
        uint64_t v35 = v20;
        __int16 v36 = 2112;
        uint64_t v37 = v21;
        __int16 v38 = 2112;
        long long v39 = v11;
        _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] we will not download new documents automatically anymore because there is not enough disk space (%@ - %@) < %@%@", (uint8_t *)&v32, 0x2Au);
      }
      BOOL v12 = 0;
    }
    else
    {
      unint64_t v22 = [v3 diskSpaceRequiredToReturnToGreedyState];
      float totalDiskSpace = (float)self->_totalDiskSpace;
      [v3 relativeDiskSpaceRequiredToReturnToGreedyState];
      float v25 = v24 * totalDiskSpace;
      if (v22 <= (unint64_t)v25) {
        unint64_t v26 = (unint64_t)v25;
      }
      else {
        unint64_t v26 = v22;
      }
      if (v8 <= v7 || v8 - v7 <= v26)
      {
LABEL_28:
        BOOL v30 = self->_isGreedy;
        if (!isGreedy && self->_isGreedy)
        {
          [(BRCAccountSession *)self startDownloadsForGreediness];
          BOOL v30 = self->_isGreedy;
        }
        BOOL v16 = v30;
        goto LABEL_32;
      }
      int v11 = brc_bread_crumbs();
      BOOL v12 = 1;
      int v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v27 = +[BRCDumpContext stringFromByteCount:v8 showActualByteCount:0 suffix:0 context:0];
        uint64_t v28 = +[BRCDumpContext stringFromByteCount:v7 showActualByteCount:0 suffix:0 context:0];
        __int16 v29 = +[BRCDumpContext stringFromByteCount:v26 showActualByteCount:0 suffix:0 context:0];
        int v32 = 138413058;
        id v33 = v27;
        __int16 v34 = 2112;
        uint64_t v35 = v28;
        __int16 v36 = 2112;
        uint64_t v37 = v29;
        __int16 v38 = 2112;
        long long v39 = v11;
        _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[NOTICE] we will now download new documents automatically because there is enough disk space (%@ - %@) > %@%@", (uint8_t *)&v32, 0x2Au);

        BOOL v12 = 1;
      }
    }

    self->_BOOL isGreedy = v12;
    goto LABEL_28;
  }
  id v3 = brc_bread_crumbs();
  id v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSession isGreedy]();
  }

  BOOL v16 = 1;
LABEL_32:

  return v16;
}

- (void)dumpXPCClientsToContext:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = self;
  objc_sync_enter(v5);
  id v6 = (void *)[(NSMutableSet *)v5->_xpcClients copy];
  objc_sync_exit(v5);

  [v4 writeLineWithFormat:&stru_1F2AC7720];
  objc_msgSend(v4, "writeLineWithFormat:", @"%ld xpc clients:", objc_msgSend(v6, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v12;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v12 != v9) {
          objc_enumerationMutation(v7);
        }
        [*(id *)(*((void *)&v11 + 1) + 8 * v10++) dumpToContext:v4];
      }
      while (v8 != v10);
      uint64_t v8 = [v7 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v8);
  }

  [v4 writeLineWithFormat:&stru_1F2AC7720];
}

- (void)dumpMiscOperationsToContext:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(NSHashTable *)self->_miscOperations allObjects];
  [v4 writeLineWithFormat:&stru_1F2AC7720];
  objc_msgSend(v4, "writeLineWithFormat:", @"%ld misc operations:", objc_msgSend(v5, "count"));
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        long long v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v12 = [v11 descriptionWithContext:v4];
          [v4 writeLineWithFormat:@"%@", v12];
        }
        else
        {
          [v4 writeLineWithFormat:@"%@", v11];
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)openForDumping
{
  id v3 = [[BRCFairScheduler alloc] initWithWorkloop:self->_clientTruthWorkloop name:@"client-db"];
  fairClientDBScheduler = self->_fairClientDBScheduler;
  self->_fairClientDBScheduler = v3;

  uint64_t v5 = [[BRCDeadlineScheduler alloc] initWithName:@"com.apple.bird.main-scheduler" fairScheduler:self->_fairClientDBScheduler];
  defaultScheduler = self->_defaultScheduler;
  self->_defaultScheduler = v5;

  uint64_t v7 = [[BRCApplyScheduler alloc] initWithAccountSession:self];
  applyScheduler = self->_applyScheduler;
  self->_applyScheduler = v7;

  uint64_t v9 = [[BRCFSReader alloc] initWithAccountSession:self];
  fsReader = self->_fsReader;
  self->_fsReader = v9;

  long long v11 = [[BRCFSWriter alloc] initWithAccountSession:self];
  fsWriter = self->_fsWriter;
  self->_fsWriter = v11;

  long long v13 = [[BRCFSUploader alloc] initWithAccountSession:self];
  fsUploader = self->_fsUploader;
  self->_fsUploader = v13;

  long long v15 = [[BRCFSDownloader alloc] initWithAccountSession:self];
  fsDownloader = self->_fsDownloader;
  self->_fsDownloader = v15;

  unint64_t v17 = [[BRCStageRegistry alloc] initWithAccountSession:self];
  stageRegistry = self->_stageRegistry;
  self->_stageRegistry = v17;

  id v19 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  libraryRowIDsByMangledID = self->_libraryRowIDsByMangledID;
  self->_libraryRowIDsByMangledID = v19;

  id v21 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  appLibrariesByRowID = self->_appLibrariesByRowID;
  self->_appLibrariesByRowID = v21;

  __int16 v23 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  serverZonesByZoneRowID = self->_serverZonesByZoneRowID;
  self->_serverZonesByZoneRowID = v23;

  float v25 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sharedServerZonesByMangledID = self->_sharedServerZonesByMangledID;
  self->_sharedServerZonesByMangledID = v25;

  __int16 v27 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  sharedClientZonesByMangledID = self->_sharedClientZonesByMangledID;
  self->_sharedClientZonesByMangledID = v27;

  __int16 v29 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  privateServerZonesByID = self->_privateServerZonesByID;
  self->_privateServerZonesByID = v29;

  uint64_t v31 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  privateClientZonesByID = self->_privateClientZonesByID;
  self->_privateClientZonesByID = v31;

  __int16 v36 = dispatch_queue_attr_make_with_qos_class(0, QOS_CLASS_UNSPECIFIED, 0);
  id v33 = dispatch_queue_attr_make_with_autorelease_frequency(v36, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  __int16 v34 = (OS_dispatch_queue *)dispatch_queue_create("reset-queue", v33);

  resetQueue = self->_resetQueue;
  self->_resetQueue = v34;
}

- (void)openForSendingTelemetry
{
  [(BRCAccountSession *)self openForDumping];
  id v3 = [[BRCAnalyticsReporter alloc] initWithSession:self];
  analyticsReporter = self->_analyticsReporter;
  self->_analyticsReporter = v3;

  uint64_t v5 = [[BRCSyncContextProvider alloc] initWithAccountSession:self];
  syncContextProvider = self->_syncContextProvider;
  self->_syncContextProvider = v5;

  [(BRCAccountSession *)self _setupThrottles];
}

- (NSString)sessionDirPath
{
  sessionDirPath = self->_sessionDirPath;
  if (!sessionDirPath)
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession sessionDirPath]();
    }

    sessionDirPath = self->_sessionDirPath;
  }
  return sessionDirPath;
}

- (NSString)cacheDirPath
{
  cacheDirPath = self->_cacheDirPath;
  if (!cacheDirPath)
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession cacheDirPath]();
    }

    cacheDirPath = self->_cacheDirPath;
  }
  return cacheDirPath;
}

- (BRCApplyScheduler)applyScheduler
{
  applyScheduler = self->_applyScheduler;
  if (!applyScheduler)
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession applyScheduler]();
    }

    applyScheduler = self->_applyScheduler;
  }
  return applyScheduler;
}

- (BRCContainerScheduler)containerScheduler
{
  containerScheduler = self->_containerScheduler;
  if (!containerScheduler)
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession containerScheduler]();
    }

    containerScheduler = self->_containerScheduler;
  }
  return containerScheduler;
}

- (BRCTimerScheduler)autoResumeSyncTimerScheduler
{
  autoResumeSyncTimerScheduler = self->_autoResumeSyncTimerScheduler;
  if (!autoResumeSyncTimerScheduler)
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession autoResumeSyncTimerScheduler]();
    }

    autoResumeSyncTimerScheduler = self->_autoResumeSyncTimerScheduler;
  }
  return autoResumeSyncTimerScheduler;
}

- (BRCFSReader)fsReader
{
  fsReader = self->_fsReader;
  if (!fsReader)
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession fsReader]();
    }

    fsReader = self->_fsReader;
  }
  return fsReader;
}

- (BRCFSWriter)fsWriter
{
  fsWriter = self->_fsWriter;
  if (!fsWriter)
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession fsWriter]();
    }

    fsWriter = self->_fsWriter;
  }
  return fsWriter;
}

- (BRCNotificationManager)notificationManager
{
  notificationManager = self->_notificationManager;
  if (!notificationManager)
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession notificationManager]();
    }

    notificationManager = self->_notificationManager;
  }
  return notificationManager;
}

- (BRCStageRegistry)stageRegistry
{
  stageRegistry = self->_stageRegistry;
  if (!stageRegistry)
  {
    uint64_t v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession stageRegistry]();
    }

    stageRegistry = self->_stageRegistry;
  }
  return stageRegistry;
}

- (BOOL)isOpen
{
  return self->_isOpen;
}

- (NSString)databaseID
{
  return self->_databaseID;
}

- (BRCBarrier)dbLoadingBarrier
{
  return self->_dbLoadingBarrier;
}

- (void)setSessionDirPath:(id)a3
{
}

- (void)setCacheDirPath:(id)a3
{
}

- (BRDSIDString)accountDSID
{
  return self->_accountDSID;
}

- (NSString)ubiquityTokenSalt
{
  return self->_ubiquityTokenSalt;
}

- (BRCDeadlineScheduler)defaultScheduler
{
  return self->_defaultScheduler;
}

- (BRCFairScheduler)fairClientDBScheduler
{
  return self->_fairClientDBScheduler;
}

- (BRCVolume)volume
{
  return self->_volume;
}

- (BRCFSUploader)fsUploader
{
  return self->_fsUploader;
}

- (BRCFSDownloader)fsDownloader
{
  return self->_fsDownloader;
}

- (BRCSyncUpScheduler)syncUpScheduler
{
  return self->_syncUpScheduler;
}

- (BRCDownloadTrackers)downloadTrackers
{
  return self->_downloadTrackers;
}

- (BRCAccountHandler)accountHandler
{
  return self->_accountHandler;
}

- (BRCUserNotification)userNotification
{
  return self->_userNotification;
}

- (BRCDiskSpaceReclaimer)diskReclaimer
{
  return self->_diskReclaimer;
}

- (BRCFileUnlinker)fileUnlinker
{
  return self->_fileUnlinker;
}

- (BRCRecentsEnumerator)recentsEnumerator
{
  return self->_recentsEnumerator;
}

- (BOOL)isCancelled
{
  return self->_isCancelled;
}

- (BRCThrottle)appLibraryScanThrottle
{
  return self->_appLibraryScanThrottle;
}

- (BRCThrottle)appLibraryResetThrottle
{
  return self->_appLibraryResetThrottle;
}

- (BRCThrottle)sharedAppLibraryResetThrottle
{
  return self->_sharedAppLibraryResetThrottle;
}

- (BRCThrottle)appLibraryAliasRemovalThrottle
{
  return self->_appLibraryAliasRemovalThrottle;
}

- (BRCThrottle)lostItemThrottle
{
  return self->_lostItemThrottle;
}

- (BRCThrottle)operationFailureThrottle
{
  return self->_operationFailureThrottle;
}

- (BRCThrottle)syncClientZoneThrottle
{
  return self->_syncClientZoneThrottle;
}

- (BRCThrottle)syncClientZoneErrorThrottle
{
  return self->_syncClientZoneErrorThrottle;
}

- (BRCGlobalProgress)globalProgress
{
  return self->_globalProgress;
}

- (OS_dispatch_queue)resetQueue
{
  return self->_resetQueue;
}

- (OS_dispatch_queue)dbFixupQueue
{
  return self->_dbFixupQueue;
}

- (BRCItemTransmogrifier)itemTransmogrifier
{
  return self->_itemTransmogrifier;
}

- (BRCAnalyticsReporter)analyticsReporter
{
  return self->_analyticsReporter;
}

- (BRCSyncContextProvider)syncContextProvider
{
  return self->_syncContextProvider;
}

- (NSString)personaIdentifier
{
  return self->_personaIdentifier;
}

- (BOOL)isDataSeparated
{
  return self->_isDataSeparated;
}

- (BOOL)offline
{
  return self->_offline;
}

- (NSFileProviderDomain)fpDomain
{
  return self->_fpDomain;
}

- (void)setFpDomain:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_analyticsReporter, 0);
  objc_storeStrong((id *)&self->_autoResumeSyncTimerScheduler, 0);
  objc_storeStrong((id *)&self->_itemTransmogrifier, 0);
  objc_storeStrong((id *)&self->_dbFixupQueue, 0);
  objc_storeStrong((id *)&self->_resetQueue, 0);
  objc_storeStrong((id *)&self->_syncClientZoneErrorThrottle, 0);
  objc_storeStrong((id *)&self->_syncClientZoneThrottle, 0);
  objc_storeStrong((id *)&self->_operationFailureThrottle, 0);
  objc_storeStrong((id *)&self->_lostItemThrottle, 0);
  objc_storeStrong((id *)&self->_appLibraryAliasRemovalThrottle, 0);
  objc_storeStrong((id *)&self->_sharedAppLibraryResetThrottle, 0);
  objc_storeStrong((id *)&self->_appLibraryResetThrottle, 0);
  objc_storeStrong((id *)&self->_appLibraryScanThrottle, 0);
  objc_storeStrong((id *)&self->_recentsEnumerator, 0);
  objc_storeStrong((id *)&self->_diskReclaimer, 0);
  objc_storeStrong((id *)&self->_userNotification, 0);
  objc_storeStrong((id *)&self->_downloadTrackers, 0);
  objc_storeStrong((id *)&self->_syncUpScheduler, 0);
  objc_storeStrong((id *)&self->_fsDownloader, 0);
  objc_storeStrong((id *)&self->_fsUploader, 0);
  objc_storeStrong((id *)&self->_fairClientDBScheduler, 0);
  objc_storeStrong((id *)&self->_applyScheduler, 0);
  objc_storeStrong((id *)&self->_containerScheduler, 0);
  objc_storeStrong((id *)&self->_ubiquityTokenSalt, 0);
  objc_storeStrong((id *)&self->_cacheDirPath, 0);
  objc_storeStrong((id *)&self->_sessionDirPath, 0);
  objc_storeStrong((id *)&self->_dbLoadingBarrier, 0);
  objc_storeStrong((id *)&self->_syncContextProvider, 0);
  objc_storeStrong((id *)&self->_isInCarry, 0);
  objc_storeStrong((id *)&self->_accountWaitOperation, 0);
  objc_storeStrong((id *)&self->_globalProgress, 0);
  objc_storeStrong((id *)&self->_xpcClients, 0);
  objc_storeStrong((id *)&self->_acAccountID, 0);
  objc_storeStrong((id *)&self->_updateDiskSpacePacer, 0);
  objc_storeStrong((id *)&self->_reschedulePendingDiskItemsPacer, 0);
  objc_storeStrong((id *)&self->_fsEventsMonitors, 0);
  objc_storeStrong((id *)&self->_fsWriter, 0);
  objc_storeStrong((id *)&self->_fsReader, 0);
  objc_storeStrong((id *)&self->_rootsByFolderType, 0);
  objc_storeStrong((id *)&self->_volume, 0);
  objc_storeStrong((id *)&self->_fileUnlinker, 0);
  objc_storeStrong((id *)&self->_stageRegistry, 0);
  objc_storeStrong((id *)&self->_notificationManager, 0);
  objc_storeStrong((id *)&self->_privateClientZonesByID, 0);
  objc_storeStrong((id *)&self->_privateServerZonesByID, 0);
  objc_storeStrong((id *)&self->_sharedClientZonesByMangledID, 0);
  objc_storeStrong((id *)&self->_sharedServerZonesByMangledID, 0);
  objc_storeStrong((id *)&self->_serverZonesByZoneRowID, 0);
  objc_storeStrong((id *)&self->_appLibrariesByRowID, 0);
  objc_storeStrong((id *)&self->_libraryRowIDsByMangledID, 0);
  objc_storeStrong((id *)&self->_accountDSID, 0);
  objc_storeStrong((id *)&self->_serverState, 0);
  objc_storeStrong((id *)&self->_clientState, 0);
  objc_storeStrong((id *)&self->_expensiveReadOnlyDB, 0);
  objc_storeStrong((id *)&self->_readOnlyDB, 0);
  objc_storeStrong((id *)&self->_serverDB, 0);
  objc_storeStrong((id *)&self->_clientDB, 0);
  objc_storeStrong((id *)&self->_tapToRadarManager, 0);
  objc_storeStrong((id *)&self->_fpDomain, 0);
  objc_storeStrong((id *)&self->_personaIdentifier, 0);
  objc_storeStrong((id *)&self->_accountHandler, 0);
  objc_storeStrong((id *)&self->_miscOperations, 0);
  objc_storeStrong((id *)&self->_databaseID, 0);
  objc_storeStrong(&self->_dbProfilingHook, 0);
  objc_storeStrong((id *)&self->_readOnlyWorkloop, 0);
  objc_storeStrong((id *)&self->_serverTruthWorkloop, 0);
  objc_storeStrong((id *)&self->_clientTruthWorkloop, 0);
  objc_storeStrong((id *)&self->_dbCorruptionQueue, 0);
  objc_storeStrong((id *)&self->_dbWatcherQueue, 0);
  objc_storeStrong((id *)&self->_dbWatcher, 0);
  objc_storeStrong((id *)&self->_dbURL, 0);
  objc_storeStrong((id *)&self->_defaultScheduler, 0);
}

- (id)newLocalItemFromPQLResultSet:(id)a3 db:(id)a4 error:(id *)a5
{
  id v8 = a3;
  id v9 = a4;
  switch([v8 intAtIndex:15])
  {
    case 0u:
    case 4u:
    case 9u:
      uint64_t v10 = BRCDirectoryItem;
      goto LABEL_12;
    case 1u:
    case 2u:
      uint64_t v10 = BRCDocumentItem;
      goto LABEL_12;
    case 3u:
      uint64_t v10 = BRCAliasItem;
      goto LABEL_12;
    case 5u:
      uint64_t v10 = BRCSymlinkItem;
      goto LABEL_12;
    case 6u:
    case 7u:
      uint64_t v10 = BRCFinderBookmarkItem;
      goto LABEL_12;
    case 8u:
      uint64_t v10 = BRCShareAcceptationDocumentFault;
      goto LABEL_12;
    case 0xAu:
      uint64_t v10 = BRCShareAcceptationDirectoryFault;
LABEL_12:
      long long v13 = (void *)[[v10 alloc] initFromPQLResultSet:v8 session:self db:v9 error:a5];
      break;
    default:
      long long v11 = brc_bread_crumbs();
      long long v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSession(ItemFetching) newLocalItemFromPQLResultSet:db:error:]();
      }

      long long v13 = 0;
      break;
  }

  return v13;
}

- (id)newServerItemFromPQLResultSet:(id)a3 error:(id *)a4
{
  id v6 = a3;
  uint64_t v7 = [v6 numberAtIndex:0];
  id v8 = [(BRCAccountSession *)self serverZoneByRowID:v7];

  int v9 = [v8 isSharedZone];
  uint64_t v10 = off_1E6992A88;
  if (!v9) {
    uint64_t v10 = off_1E6992A70;
  }
  long long v11 = (void *)[objc_alloc(*v10) initFromPQLResultSet:v6 serverZone:v8 error:a4];

  return v11;
}

- (id)itemIDByRowID:(unint64_t)a3
{
  return [(BRCAccountSession *)self itemIDByRowID:a3 db:self->_clientDB];
}

- (id)itemIDByRowID:(unint64_t)a3 db:(id)a4
{
  id v4 = objc_msgSend(a4, "itemIDWithSQL:", @"SELECT item_id FROM client_items   WHERE rowid = %lld", a3);
  return v4;
}

- (id)itemByRowID:(unint64_t)a3
{
  return [(BRCAccountSession *)self itemByRowID:a3 db:self->_clientDB];
}

- (id)itemByRowID:(unint64_t)a3 db:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __50__BRCAccountSession_ItemFetching__itemByRowID_db___block_invoke;
  uint64_t v10[3] = &unk_1E6994148;
  void v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = (void *)[v7 fetchObject:v10, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE rowid = %lld", a3 sql];

  return v8;
}

id __50__BRCAccountSession_ItemFetching__itemByRowID_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[*(id *)(a1 + 32) newLocalItemFromPQLResultSet:a2 db:*(void *)(a1 + 40) error:a3];
  return v3;
}

- (id)itemByFileObjectID:(id)a3 db:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    int v8 = [v6 type];
    uint64_t v9 = [v6 rawID];
    switch(v8)
    {
      case 0:
        uint64_t v10 = brc_bread_crumbs();
        id v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          -[BRCAccountSession(ItemFetching) itemByFileObjectID:db:].cold.4();
        }
        goto LABEL_7;
      case 1:
        long long v14 = [NSNumber numberWithUnsignedLongLong:v9];
        long long v15 = [(BRCAccountSession *)self appLibraryByRowID:v14];

        uint64_t v16 = [v15 fetchRootItemInDB:v7];
        goto LABEL_18;
      case 2:
        uint64_t v17 = [(BRCAccountSession *)self globalItemByDocumentID:v9 db:v7];
        goto LABEL_15;
      case 3:
        uint64_t v17 = [(BRCAccountSession *)self globalItemByFileID:v9 db:v7];
LABEL_15:
        long long v12 = (void *)v17;
        break;
      case 4:
        uint64_t v18 = [NSNumber numberWithUnsignedLongLong:v9];
        long long v15 = [(BRCAccountSession *)self appLibraryByRowID:v18];

        if (([v15 includesDataScope] & 1) == 0)
        {
          id v20 = brc_bread_crumbs();
          id v21 = brc_default_log();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
            -[BRCAccountSession(ItemFetching) itemByFileObjectID:db:].cold.5();
          }
        }
        uint64_t v16 = [v15 fetchDocumentsDirectoryItem:v7];
LABEL_18:
        long long v12 = (void *)v16;

        break;
      case 5:
        uint64_t v10 = brc_bread_crumbs();
        id v11 = brc_default_log();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
          -[BRCAccountSession(ItemFetching) itemByFileObjectID:db:]();
        }
        goto LABEL_7;
      default:
        uint64_t v10 = brc_bread_crumbs();
        long long v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
          -[BRCAccountSession(ItemFetching) itemByFileObjectID:db:]();
        }

        goto LABEL_8;
    }
  }
  else
  {
    uint64_t v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(ItemFetching) itemByFileObjectID:db:]();
    }
LABEL_7:

LABEL_8:
    long long v12 = 0;
  }

  return v12;
}

- (id)itemByFileObjectID:(id)a3
{
  return [(BRCAccountSession *)self itemByFileObjectID:a3 db:self->_clientDB];
}

- (id)serverAliasItemForSharedItem:(id)a3
{
  return [(BRCAccountSession *)self serverAliasItemForSharedItem:a3 db:self->_clientDB];
}

- (id)serverAliasItemForSharedItem:(id)a3 db:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = [v6 clientZone];
  uint64_t v9 = [v8 zoneName];
  uint64_t v10 = [(BRCAccountSession *)self privateClientZoneByID:v9];

  if (!v10
    || ([v10 serverZone],
        id v11 = objc_claimAutoreleasedReturnValue(),
        [(BRCAccountSession *)self serverAliasItemForSharedItem:v6 inZone:v11 db:v7], long long v12 = objc_claimAutoreleasedReturnValue(), v11, !v12))
  {
    long long v12 = [(BRCAccountSession *)self serverAliasItemForSharedItem:v6 inZone:0 db:v7];
  }

  return v12;
}

- (id)serverAliasItemForSharedItem:(id)a3 inZone:(id)a4
{
  return [(BRCAccountSession *)self serverAliasItemForSharedItem:a3 inZone:a4 db:self->_clientDB];
}

- (id)serverAliasItemForSharedItem:(id)a3 inZone:(id)a4 db:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = [v10 serverZone];
  char v12 = [v11 isSharedZone];

  if ((v12 & 1) == 0)
  {
    float v24 = brc_bread_crumbs();
    float v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(ItemFetching) serverAliasItemForSharedItem:inZone:db:]();
    }
  }
  long long v13 = NSString;
  long long v14 = [v10 itemID];
  long long v15 = [v14 itemIDString];
  uint64_t v16 = [v10 serverZone];

  uint64_t v17 = [v16 mangledID];
  uint64_t v18 = [v13 unsaltedBookmarkDataWithItemResolutionString:v15 serverZoneMangledID:v17];

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  void v26[2] = __74__BRCAccountSession_ItemFetching__serverAliasItemForSharedItem_inZone_db___block_invoke;
  v26[3] = &unk_1E6994120;
  v26[4] = self;
  if (v8)
  {
    id v19 = (void *)MEMORY[0x1E4FBA8F8];
    id v20 = [v8 dbRowID];
    id v21 = [v19 formatInjection:@"AND +si.zone_rowid = %@", v20];
    unint64_t v22 = (void *)[v9 fetchObject:v26, @"SELECT si.zone_rowid, si.item_rank, si.item_origname, si.pcs_state, si.item_id, si.item_creator_id, si.item_sharing_options, si.item_side_car_ckinfo, si.item_stat_ckinfo, si.item_state, si.item_type, si.item_mode, si.item_birthtime, si.item_lastusedtime, si.item_favoriterank,si.item_parent_id, si.item_filename, si.item_hidden_ext, si.item_finder_tags, si.item_xattr_signature, si.item_trash_put_back_path, si.item_trash_put_back_parent_id, si.item_alias_target, si.item_creator, si.version_name, si.version_ckinfo, si.version_mtime, si.version_size, si.version_thumb_size, si.version_thumb_signature, si.version_content_signature, si.version_xattr_signature, si.version_edited_since_shared, si.version_device, si.version_conflict_loser_etags, si.version_quarantine_info, si.quota_used, si.recursive_child_count, si.shared_children_count, si.shared_alias_count, si.child_count, ci.item_id FROM server_items AS si LEFT JOIN client_items AS ci ON si.item_id = ci.item_id AND si.zone_rowid = ci.zone_rowid WHERE si.item_alias_target = %@ AND si.item_type = 3 AND si.item_state = 0 AND (ci.item_id IS NULL OR ci.item_state != 1) %@ ORDER BY si.item_id", v18, v21 sql];
  }
  else
  {
    id v20 = [MEMORY[0x1E4FBA908] rawInjection:"" length:0];
    unint64_t v22 = (void *)[v9 fetchObject:v26, @"SELECT si.zone_rowid, si.item_rank, si.item_origname, si.pcs_state, si.item_id, si.item_creator_id, si.item_sharing_options, si.item_side_car_ckinfo, si.item_stat_ckinfo, si.item_state, si.item_type, si.item_mode, si.item_birthtime, si.item_lastusedtime, si.item_favoriterank,si.item_parent_id, si.item_filename, si.item_hidden_ext, si.item_finder_tags, si.item_xattr_signature, si.item_trash_put_back_path, si.item_trash_put_back_parent_id, si.item_alias_target, si.item_creator, si.version_name, si.version_ckinfo, si.version_mtime, si.version_size, si.version_thumb_size, si.version_thumb_signature, si.version_content_signature, si.version_xattr_signature, si.version_edited_since_shared, si.version_device, si.version_conflict_loser_etags, si.version_quarantine_info, si.quota_used, si.recursive_child_count, si.shared_children_count, si.shared_alias_count, si.child_count, ci.item_id FROM server_items AS si LEFT JOIN client_items AS ci ON si.item_id = ci.item_id AND si.zone_rowid = ci.zone_rowid WHERE si.item_alias_target = %@ AND si.item_type = 3 AND si.item_state = 0 AND (ci.item_id IS NULL OR ci.item_state != 1) %@ ORDER BY si.item_id", v18, v20 sql];
  }

  return v22;
}

id __74__BRCAccountSession_ItemFetching__serverAliasItemForSharedItem_inZone_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[*(id *)(a1 + 32) newServerItemFromPQLResultSet:a2 error:a3];
  return v3;
}

- (id)localAliasForSharedItem:(id)a3 inZone:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 serverZone];
  char v9 = [v8 isSharedZone];

  if ((v9 & 1) == 0)
  {
    id v20 = brc_bread_crumbs();
    id v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(ItemFetching) serverAliasItemForSharedItem:inZone:db:]();
    }
  }
  id v10 = NSString;
  id v11 = [v7 itemID];
  char v12 = [v11 itemIDString];
  long long v13 = [v7 serverZone];

  long long v14 = [v13 mangledID];
  long long v15 = [v10 unsaltedBookmarkDataWithItemResolutionString:v12 serverZoneMangledID:v14];

  clientDB = self->_clientDB;
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __66__BRCAccountSession_ItemFetching__localAliasForSharedItem_inZone___block_invoke;
  v22[3] = &unk_1E6994120;
  v22[4] = self;
  uint64_t v17 = [v6 dbRowID];

  id v18 = [(BRCPQLConnection *)clientDB fetchObject:v22, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_alias_target = %@ AND item_type = 3 AND +zone_rowid = %@ ORDER BY item_id", v15, v17 sql];
  return v18;
}

id __66__BRCAccountSession_ItemFetching__localAliasForSharedItem_inZone___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 clientDB];
  id v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (id)itemByItemGlobalID:(id)a3 db:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 itemID];
  int v9 = [v8 isNonDesktopRoot];

  if (v9)
  {
    id v10 = [BRCZoneRootItem alloc];
    id v11 = [v7 itemID];

    char v12 = [(BRCZoneRootItem *)v10 initWithZoneRootItemID:v11 session:self];
  }
  else
  {
    long long v13 = [v7 zoneRowID];
    long long v14 = [(BRCAccountSession *)self serverZoneByRowID:v13];
    long long v15 = [v14 clientZone];

    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __57__BRCAccountSession_ItemFetching__itemByItemGlobalID_db___block_invoke;
    uint64_t v20[3] = &unk_1E6994148;
    id v21 = v15;
    id v22 = v6;
    id v16 = v15;
    uint64_t v17 = [v7 itemID];
    id v18 = [v7 zoneRowID];

    char v12 = (BRCZoneRootItem *)[v22 fetchObject:v20, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_id = %@ AND zone_rowid = %@", v17, v18 sql];
  }

  return v12;
}

id __57__BRCAccountSession_ItemFetching__itemByItemGlobalID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)itemByItemGlobalID:(id)a3
{
  return [(BRCAccountSession *)self itemByItemGlobalID:a3 db:self->_clientDB];
}

- (BOOL)globalID:(id)a3 isStrictChildOfGlobalID:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v9 = [v8 maxSyncPathDepth];

  if (([v6 isEqualToItemGlobalID:v7] & 1) != 0
    || ([v6 itemID],
        id v10 = objc_claimAutoreleasedReturnValue(),
        char v11 = [v10 isNonDesktopRoot],
        v10,
        (v11 & 1) != 0))
  {
    BOOL v12 = 0;
  }
  else
  {
    clientDB = self->_clientDB;
    long long v14 = [v6 zoneRowID];
    long long v15 = [v6 itemID];
    id v16 = [v7 itemID];
    uint64_t v17 = [v7 zoneRowID];
    id v18 = [(BRCPQLConnection *)clientDB fetch:@"WITH RECURSIVE item_parents (item_id, zone_rowid) AS(    SELECT item_parent_id, item_parent_zone_rowid FROM client_items      WHERE zone_rowid = %@ AND item_id = %@  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid FROM client_items AS li INNER JOIN item_parents AS p USING (item_id, zone_rowid)      LIMIT %u) SELECT item_id, zone_rowid FROM item_parents WHERE item_id_is_root(item_id) OR (item_id = %@ AND zone_rowid = %@) LIMIT 1", v14, v15, v9, v16, v17];

    if ([v18 next])
    {
      id v19 = [v18 objectOfClass:objc_opt_class() atIndex:0];
      id v20 = [v18 numberAtIndex:1];
      id v21 = [[BRCItemGlobalID alloc] initWithZoneRowID:v20 itemID:v19];
      BOOL v12 = [(BRCItemGlobalID *)v21 isEqualToItemGlobalID:v7];
    }
    else
    {
      id v22 = brc_bread_crumbs();
      __int16 v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138413314;
        __int16 v29 = self;
        __int16 v30 = 1024;
        int v31 = v9;
        __int16 v32 = 2112;
        id v33 = v7;
        __int16 v34 = 2112;
        id v35 = v6;
        __int16 v36 = 2112;
        uint64_t v37 = v22;
        _os_log_fault_impl(&dword_1D353B000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: reset needed for %@ because the hierarchy is deeper than %u under %@ when looking for %@%@", buf, 0x30u);
      }

      float v24 = [v6 zoneRowID];
      float v25 = [(BRCAccountSession *)self serverZoneByRowID:v24];
      unint64_t v26 = [v25 clientZone];
      [v26 scheduleResetServerAndClientTruthsForReason:@"hierarchy-too-deep"];

      BOOL v12 = 0;
    }
  }
  return v12;
}

- (void)enumerateItemsWithShareIDUnderParent:(id)a3 block:(id)a4
{
  void v40[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *, uint64_t, unsigned char *))a4;
  id v7 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v8 = [v7 maxFolderEnumerationCount];

  LODWORD(v7) = [v5 isZoneRoot];
  uint64_t v9 = (void *)MEMORY[0x1E4FBA8F8];
  id v10 = [v5 clientZone];
  char v11 = [v10 dbRowID];
  uint64_t v12 = [v5 itemID];
  long long v13 = (void *)v12;
  if (v7) {
    long long v14 = @"item_parent_zone_rowid = %@ AND item_parent_id = %@";
  }
  else {
    long long v14 = @"zone_rowid = %@ AND item_id = %@";
  }
  long long v15 = objc_msgSend(v9, "formatInjection:", v14, v11, v12);

  char v38 = 0;
  id v33 = v5;
  id v16 = [v5 db];
  uint64_t v17 = (void *)[v16 fetch:@"WITH RECURSIVE item_children_with_shared_items (item_id, zone_rowid, shared_items_count) AS(    SELECT item_id, zone_rowid, (shared_by_me_count | shared_to_me_count) FROM item_recursive_properties      WHERE %@ AND (shared_by_me_count | shared_to_me_count) != 0  UNION ALL     SELECT ip.item_id, ip.zone_rowid, (ip.shared_by_me_count | ip.shared_to_me_count) FROM item_recursive_properties AS ip INNER JOIN item_children_with_shared_items AS p WHERE ip.item_parent_id = p.item_id AND ip.item_parent_zone_rowid = p.zone_rowid AND (ip.shared_by_me_count | ip.shared_to_me_count) != 0      LIMIT %llu) SELECT ic.item_id, ic.zone_rowid, li.item_sharing_options FROM item_children_with_shared_items AS ic INNER JOIN client_items AS li WHERE ic.shared_items_count = 1 AND li.item_id = ic.item_id AND li.zone_rowid = ic.zone_rowid AND (li.item_sharing_options & 4) != 0", v15, v8];

  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v17 next])
  {
    do
    {
      id v19 = [v17 objectOfClass:objc_opt_class() atIndex:0];
      id v20 = [v17 objectOfClass:objc_opt_class() atIndex:1];
      uint64_t v21 = (int)[v17 intAtIndex:2];
      id v22 = [[BRCItemGlobalID alloc] initWithZoneRowID:v20 itemID:v19];
      v40[0] = v22;
      __int16 v23 = [NSNumber numberWithUnsignedInteger:v21];
      v40[1] = v23;
      float v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:v40 count:2];
      [v18 addObject:v24];
    }
    while (([v17 next] & 1) != 0);
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v25 = v18;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v35;
LABEL_8:
    uint64_t v29 = 0;
    while (1)
    {
      if (*(void *)v35 != v28) {
        objc_enumerationMutation(v25);
      }
      if (v38) {
        break;
      }
      __int16 v30 = *(void **)(*((void *)&v34 + 1) + 8 * v29);
      int v31 = [v30 objectAtIndex:0];
      __int16 v32 = [v30 objectAtIndex:1];
      v6[2](v6, v31, [v32 unsignedLongValue], &v38);

      if (v27 == ++v29)
      {
        uint64_t v27 = [v25 countByEnumeratingWithState:&v34 objects:v39 count:16];
        if (v27) {
          goto LABEL_8;
        }
        break;
      }
    }
  }
}

- (void)enumerateContainersWithDB:(id)a3 handler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  memset(v15, 0, sizeof(v15));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession(ItemFetching) enumerateContainersWithDB:handler:]", 320, v15);
  uint64_t v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRCAccountSession(ItemFetching) enumerateContainersWithDB:handler:](v15, (uint64_t)v8, v9);
  }

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __69__BRCAccountSession_ItemFetching__enumerateContainersWithDB_handler___block_invoke;
  v12[3] = &unk_1E699B7B8;
  id v10 = v6;
  id v13 = v10;
  id v11 = v7;
  id v14 = v11;
  [(BRCAccountSession *)self enumerateAppLibraries:v12];

  __brc_leave_section(v15);
}

uint64_t __69__BRCAccountSession_ItemFetching__enumerateContainersWithDB_handler___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  id v4 = [v3 containerMetadata];
  if ([v4 isDocumentScopePublic]
    && ([v4 isInInitialState] & 1) == 0
    && ([v3 isCloudDocsAppLibrary] & 1) == 0)
  {
    id v5 = [v3 fetchDocumentsDirectoryItem:*(void *)(a1 + 32)];
    uint64_t v6 = +[BRCNotification notificationFromItem:v5];
    if (v6)
    {
      id v7 = (void *)v6;
      uint64_t v8 = [MEMORY[0x1E4F59518] containerItemForContainer:v4 withRepresentativeItem:v6];
    }
    else
    {
      uint64_t v9 = brc_bread_crumbs();
      id v10 = brc_default_log();
      if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
        __69__BRCAccountSession_ItemFetching__enumerateContainersWithDB_handler___block_invoke_cold_1();
      }

      uint64_t v8 = 0;
    }
    (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  }
  return 1;
}

- (BOOL)createAppLibrariesIfNeededWithError:(id *)a3
{
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 1;
  uint64_t v7 = 0;
  uint64_t v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__59;
  id v11 = __Block_byref_object_dispose__59;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke;
  v6[3] = &unk_1E699C160;
  v6[4] = self;
  void v6[5] = &v7;
  v6[6] = &v13;
  brc_enumerate_all_folder_types((uint64_t)v6);
  if (a3) {
    *a3 = (id) v8[5];
  }
  char v4 = *((unsigned char *)v14 + 24);
  _Block_object_dispose(&v7, 8);

  _Block_object_dispose(&v13, 8);
  return v4;
}

uint64_t __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke(void *a1, uint64_t a2)
{
  id v4 = *(id *)(a1[4] + 104);
  if (a2 == 1)
  {
    uint64_t v5 = -1;
  }
  else
  {
    uint64_t v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_FAULT)) {
      __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke_cold_2();
    }

    uint64_t v5 = 1;
  }

  uint64_t v8 = (void *)a1[4];
  uint64_t v9 = *(void *)(a1[5] + 8);
  id obj = *(id *)(v9 + 40);
  uint64_t v10 = 1;
  char v11 = [v8 applySyncPolicy:v5 forSyncedFolderType:a2 isInitialCreation:1 error:&obj];
  objc_storeStrong((id *)(v9 + 40), obj);
  if ((v11 & 1) == 0)
  {
    if (a2 == 1)
    {
      uint64_t v10 = 0;
      *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = 0;
    }
    else
    {
      id v12 = brc_bread_crumbs();
      uint64_t v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
        __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke_cold_1();
      }
    }
  }
  return v10;
}

- (void)enumerateFileTypesWithFilterBlock:(id)a3 enumerationBlock:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __89__BRCAccountSession_LegacyAdditions__enumerateFileTypesWithFilterBlock_enumerationBlock___block_invoke;
  v9[3] = &unk_1E699C188;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  brc_enumerate_all_folder_types((uint64_t)v9);
}

uint64_t __89__BRCAccountSession_LegacyAdditions__enumerateFileTypesWithFilterBlock_enumerationBlock___block_invoke(uint64_t a1)
{
  if (!(*(unsigned int (**)(void))(*(void *)(a1 + 32) + 16))()) {
    return 1;
  }
  id v2 = *(uint64_t (**)(void))(*(void *)(a1 + 40) + 16);
  return v2();
}

- (void)enumerateSupportedFolderTypes:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __68__BRCAccountSession_LegacyAdditions__enumerateSupportedFolderTypes___block_invoke;
  v3[3] = &unk_1E6998F50;
  v3[4] = self;
  [(BRCAccountSession *)self enumerateFileTypesWithFilterBlock:v3 enumerationBlock:a3];
}

uint64_t __68__BRCAccountSession_LegacyAdditions__enumerateSupportedFolderTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = *(id *)(*(void *)(a1 + 32) + 104);
  id v5 = v4;
  if (a2 != 1)
  {
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke_cold_2();
    }

    return 0;
  }

  if (![*(id *)(a1 + 32) hasRootForSyncedFolderType:1]) {
    return 0;
  }
  id v6 = *(void **)(a1 + 32);
  return [v6 hasFSEventsMonitorForSyncedFolderType:1];
}

- (void)_enumerateAccountHandlerSupportedFolderTypes:(id)a3
{
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __83__BRCAccountSession_LegacyAdditions___enumerateAccountHandlerSupportedFolderTypes___block_invoke;
  v3[3] = &unk_1E6998F50;
  v3[4] = self;
  [(BRCAccountSession *)self enumerateFileTypesWithFilterBlock:v3 enumerationBlock:a3];
}

BOOL __83__BRCAccountSession_LegacyAdditions___enumerateAccountHandlerSupportedFolderTypes___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = *(id *)(*(void *)(a1 + 32) + 104);
  if (a2 != 1)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke_cold_2();
    }
  }
  return a2 == 1;
}

- (void)computeDocumentEvictableSizesForLowTime:(unint64_t)a3 medTime:(unint64_t)a4 highTime:(unint64_t)a5 lowSize:(unint64_t)a6 medSize:(unint64_t)a7 highSize:(unint64_t)a8 minRowID:(unint64_t)a9 minSize:(unint64_t)a10 batchSize:(unint64_t)a11 injection:(id)a12 db:(id)a13 reply:(id)a14
{
  id v19 = a12;
  id v20 = a13;
  uint64_t v21 = (void (**)(id, unint64_t, unint64_t, unint64_t, void))a14;
  id v22 = v20;
  __int16 v23 = (void *)[v20 numberWithSQL:@"SELECT MAX(rowid) FROM client_items WHERE rowid > %lld %@ ORDER BY rowid LIMIT %lld", a9, v19, a11];
  if (!v23)
  {
    v21[2](v21, a6, a7, a8, 0);
    id v25 = v21;
    goto LABEL_5;
  }
  char v38 = self;
  if ([(BRCAccountSession *)self isCancelled])
  {
    float v24 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
    id v25 = v21;
    ((void (**)(id, unint64_t, unint64_t, unint64_t, void *))v21)[2](v21, 0, 0, 0, v24);

LABEL_5:
    uint64_t v26 = v19;
    goto LABEL_20;
  }
  long long v37 = v23;
  id v25 = v21;
  if (a3 <= a4 && !a5)
  {
    long long v36 = brc_bread_crumbs();
    long long v35 = brc_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(LegacyAdditions) computeDocumentEvictableSizesForLowTime:medTime:highTime:lowSize:medSize:highSize:minRowID:minSize:batchSize:injection:db:reply:]();
    }
  }
  uint64_t v27 = (void *)[v22 fetchWithSlowStatementRadar:@"<rdar://problem/27491735>", @"SELECT li.version_size, MAX(IFNULL(da.access_time, 0), li.version_mtime)      FROM (SELECT version_size, rowid, item_type, item_localsyncupstate, item_state, version_mtime FROM client_items                   WHERE rowid > %lld                   %@                   ORDER BY rowid LIMIT %lld) AS li LEFT JOIN client_document_access AS da ON (da.item_rowid = li.rowid)     WHERE li.item_type = 1       AND li.item_localsyncupstate = 0       AND li.item_state != 1       AND li.version_size >= %lld       AND document_is_evictable(da.properties)       AND MAX(IFNULL(da.access_time, 0), li.version_mtime) <= %lld", a9, v19, a11, a10, a5 sql];
  if ([v27 next])
  {
    do
    {
      uint64_t v28 = [v27 unsignedLongLongAtIndex:0];
      unint64_t v29 = [v27 unsignedLongLongAtIndex:1];
      a8 += v28;
      if (v29 <= a4) {
        uint64_t v30 = v28;
      }
      else {
        uint64_t v30 = 0;
      }
      BOOL v31 = v29 > a3 || v29 > a4;
      a7 += v30;
      if (v31) {
        uint64_t v32 = 0;
      }
      else {
        uint64_t v32 = v28;
      }
      a6 += v32;
    }
    while (([v27 next] & 1) != 0);
  }
  uint64_t v33 = [v37 unsignedLongLongValue];
  long long v34 = [v22 serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __166__BRCAccountSession_LegacyAdditions__computeDocumentEvictableSizesForLowTime_medTime_highTime_lowSize_medSize_highSize_minRowID_minSize_batchSize_injection_db_reply___block_invoke;
  block[3] = &unk_1E699C1B0;
  void block[4] = v38;
  unint64_t v45 = a3;
  unint64_t v46 = a4;
  unint64_t v47 = a5;
  unint64_t v48 = a6;
  unint64_t v49 = a7;
  unint64_t v50 = a8;
  uint64_t v51 = v33;
  unint64_t v52 = a10;
  unint64_t v53 = a11;
  uint64_t v26 = v19;
  id v42 = v19;
  id v43 = v22;
  id v44 = v25;
  dispatch_async(v34, block);

  __int16 v23 = v37;
LABEL_20:
}

uint64_t __166__BRCAccountSession_LegacyAdditions__computeDocumentEvictableSizesForLowTime_medTime_highTime_lowSize_medSize_highSize_minRowID_minSize_batchSize_injection_db_reply___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) computeDocumentEvictableSizesForLowTime:*(void *)(a1 + 64) medTime:*(void *)(a1 + 72) highTime:*(void *)(a1 + 80) lowSize:*(void *)(a1 + 88) medSize:*(void *)(a1 + 96) highSize:*(void *)(a1 + 104) minRowID:*(void *)(a1 + 112) minSize:*(void *)(a1 + 120) batchSize:*(void *)(a1 + 128) injection:*(void *)(a1 + 40) db:*(void *)(a1 + 48) reply:*(void *)(a1 + 56)];
}

- (void)computeTotalEvictableSizeWithAccessLowTimeDelta:(double)a3 medTimeDelta:(double)a4 highTimeDelta:(double)a5 db:(id)a6 reply:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  [v13 assertOnQueue];
  id v14 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-a3];
  [v14 timeIntervalSince1970];
  unint64_t v16 = (unint64_t)v15;

  uint64_t v17 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-a4];
  [v17 timeIntervalSince1970];
  unint64_t v19 = (unint64_t)v18;

  id v20 = [MEMORY[0x1E4F1C9C8] dateWithTimeIntervalSinceNow:-a5];
  [v20 timeIntervalSince1970];
  unint64_t v22 = (unint64_t)v21;

  id v26 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v23 = [v26 minAutomaticallyEvictableFilesize];
  uint64_t v24 = [v26 computeEvictableBatchSize];
  id v25 = [MEMORY[0x1E4FBA908] rawInjection:"" length:0];
  [(BRCAccountSession *)self computeDocumentEvictableSizesForLowTime:v16 medTime:v19 highTime:v22 lowSize:0 medSize:0 highSize:0 minRowID:0 minSize:v23 batchSize:v24 injection:v25 db:v13 reply:v12];
}

- (id)createFSEventsMonitorForSyncedFolderType:(unint64_t)a3
{
  id v5 = [BRCFSEventsMonitor alloc];
  id v6 = brc_folder_type_name(a3);
  id v7 = [(BRCFSEventsMonitor *)v5 initWithAccountSession:self name:v6];

  [(BRCFSEventsMonitor *)v7 setDelegate:self->_fsReader];
  [(BRCFSEventsMonitor *)v7 setDB:self->_clientDB];
  return v7;
}

- (id)fsEventsMonitorForAppLibraryID:(id)a3
{
  return [(BRCAccountSession *)self fsEventsMonitorForSyncedFolderType:1];
}

- (id)fsEventsMonitorForSyncedFolderType:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = self->_fsEventsMonitors;
  id v5 = v4;
  if (a3 == 1)
  {
    if (v4) {
      goto LABEL_3;
    }
    goto LABEL_13;
  }
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[BRCAccountHandler syncPolicyforSyncedFolderType:]();
  }

  if (!v5)
  {
LABEL_13:
    id v13 = brc_bread_crumbs();
    id v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(LegacyAdditions) fsEventsMonitorForSyncedFolderType:]();
    }
  }
LABEL_3:
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  id v7 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v15 = 134218498;
      unint64_t v16 = a3;
      __int16 v17 = 2112;
      double v18 = v5;
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_fault_impl(&dword_1D353B000, v9, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: getting nil entry for folderType: %lu, dictionary: %@%@", (uint8_t *)&v15, 0x20u);
    }
  }
  return v7;
}

- (BOOL)hasFSEventsMonitorForSyncedFolderType:(unint64_t)a3
{
  if (a3 != 1)
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler syncPolicyforSyncedFolderType:]();
    }
  }
  fsEventsMonitors = self->_fsEventsMonitors;
  if (!fsEventsMonitors)
  {
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(LegacyAdditions) hasFSEventsMonitorForSyncedFolderType:]();
    }

    fsEventsMonitors = self->_fsEventsMonitors;
  }
  id v6 = [NSNumber numberWithUnsignedInteger:a3];
  id v7 = [(NSMutableDictionary *)fsEventsMonitors objectForKeyedSubscript:v6];
  BOOL v8 = v7 != 0;

  return v8;
}

- (void)setFSEventsMonitor:(id)a3 forSyncedFolderType:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = self->_fsEventsMonitors;
  id v8 = v6;
  if (a4 == 1)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    id v14 = brc_bread_crumbs();
    int v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler syncPolicyforSyncedFolderType:]();
    }

    if (v7)
    {
LABEL_3:
      if (v8) {
        goto LABEL_7;
      }
      goto LABEL_4;
    }
  }
  unint64_t v16 = brc_bread_crumbs();
  __int16 v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[BRCAccountSession(LegacyAdditions) fsEventsMonitorForSyncedFolderType:]();
  }

  if (!v8)
  {
LABEL_4:
    uint64_t v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v20 = 134218498;
      unint64_t v21 = a4;
      __int16 v22 = 2112;
      uint64_t v23 = v7;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_fault_impl(&dword_1D353B000, v10, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: setting nil entry for folderType: %lu, dictionary: %@%@", (uint8_t *)&v20, 0x20u);
    }
  }
LABEL_7:
  id v11 = [NSNumber numberWithUnsignedInteger:a4];
  id v12 = [(NSMutableDictionary *)v7 objectForKeyedSubscript:v11];

  if (v12)
  {
    double v18 = brc_bread_crumbs();
    __int16 v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(LegacyAdditions) setFSEventsMonitor:forSyncedFolderType:]();
    }
  }
  id v13 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)v7 setObject:v8 forKeyedSubscript:v13];
}

- (void)removeFSEventsMonitorForSyncedFolderType:(unint64_t)a3
{
  id v4 = self->_fsEventsMonitors;
  if (a3 != 1)
  {
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler syncPolicyforSyncedFolderType:]();
    }
  }
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v10 = brc_bread_crumbs();
    id v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(LegacyAdditions) removeFSEventsMonitorForSyncedFolderType:]();
    }
  }
  id v7 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)v4 removeObjectForKey:v7];
}

- (id)fsEventsMonitors
{
  id v2 = (void *)MEMORY[0x1E4F1CAD0];
  id v3 = [(NSMutableDictionary *)self->_fsEventsMonitors allValues];
  id v4 = [v2 setWithArray:v3];

  return v4;
}

- (BOOL)_createAppLibraryRootIfNeededAtPath:(id)a3 error:(id *)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = [MEMORY[0x1E4F28CB8] defaultManager];
  id v14 = 0;
  BOOL v7 = 1;
  char v8 = [v6 createDirectoryAtPath:v5 withIntermediateDirectories:1 attributes:0 error:&v14];
  id v9 = v14;
  id v10 = v14;

  if ((v8 & 1) == 0 && (objc_msgSend(v10, "br_isCocoaErrorCode:", 516) & 1) == 0)
  {
    id v11 = brc_bread_crumbs();
    id v12 = brc_default_log();
    if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v16 = v5;
      __int16 v17 = 2112;
      id v18 = v10;
      __int16 v19 = 2112;
      int v20 = v11;
      _os_log_error_impl(&dword_1D353B000, v12, (os_log_type_t)0x90u, "[ERROR] failed to create root:'%@': %@%@", buf, 0x20u);
    }

    if (a4) {
      objc_storeStrong(a4, v9);
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_createAppLibraryRootsIfNeededWithError:(id *)a3
{
  uint64_t v7 = 0;
  char v8 = &v7;
  uint64_t v9 = 0x3032000000;
  id v10 = __Block_byref_object_copy__59;
  id v11 = __Block_byref_object_dispose__59;
  id v12 = 0;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __78__BRCAccountSession_LegacyAdditions___createAppLibraryRootsIfNeededWithError___block_invoke;
  v6[3] = &unk_1E699C1D8;
  v6[4] = self;
  void v6[5] = &v7;
  [(BRCAccountSession *)self _enumerateAccountHandlerSupportedFolderTypes:v6];
  if (a3) {
    *a3 = (id) v8[5];
  }
  BOOL v4 = v8[5] == 0;
  _Block_object_dispose(&v7, 8);

  return v4;
}

uint64_t __78__BRCAccountSession_LegacyAdditions___createAppLibraryRootsIfNeededWithError___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = [*(id *)(a1 + 32) dirPathForSyncedFolderType:a2];
  uint64_t v4 = [*(id *)(a1 + 32) _createAppLibraryRootIfNeededAtPath:v3 error:*(void *)(*(void *)(a1 + 40) + 8) + 40];
  if ((v4 & 1) == 0 && !*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40))
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      __78__BRCAccountSession_LegacyAdditions___createAppLibraryRootsIfNeededWithError___block_invoke_cold_1();
    }

    uint64_t v7 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithDomain:code:description:", *MEMORY[0x1E4F59368], 15, @"unreachable: createAppLibaryRoot failed but error is nil");
    uint64_t v8 = *(void *)(*(void *)(a1 + 40) + 8);
    uint64_t v9 = *(void **)(v8 + 40);
    *(void *)(v8 + 40) = v7;
  }
  return v4;
}

- (id)dirPathForSyncedFolderType:(unint64_t)a3
{
  uint64_t v4 = [MEMORY[0x1E4FB36F8] sharedManager];
  id v5 = [v4 currentPersona];
  [v5 isDataSeparatedPersona];

  if (a3 == 1)
  {
    id v6 = objc_msgSend(NSString, "br_currentMobileDocumentsDir");
  }
  else
  {
    id v6 = 0;
  }
  return v6;
}

- (unint64_t)syncedFolderTypeForURL:(id)a3
{
  id v4 = a3;
  uint64_t v11 = 0;
  id v12 = &v11;
  uint64_t v13 = 0x2020000000;
  uint64_t v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __61__BRCAccountSession_LegacyAdditions__syncedFolderTypeForURL___block_invoke;
  v8[3] = &unk_1E699C200;
  v8[4] = self;
  id v5 = v4;
  id v9 = v5;
  id v10 = &v11;
  [(BRCAccountSession *)self enumerateSupportedFolderTypes:v8];
  unint64_t v6 = v12[3];

  _Block_object_dispose(&v11, 8);
  return v6;
}

BOOL __61__BRCAccountSession_LegacyAdditions__syncedFolderTypeForURL___block_invoke(uint64_t a1, uint64_t a2)
{
  id v4 = [*(id *)(a1 + 32) rootForSyncedFolderType:a2];
  id v5 = [*(id *)(a1 + 40) path];
  unint64_t v6 = objc_msgSend(v5, "br_realpath");
  uint64_t v7 = [v4 absolutePath];
  uint64_t v8 = objc_msgSend(v7, "br_realpath");
  id v9 = objc_msgSend(v6, "br_pathRelativeToPath:", v8);

  if (v9) {
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = a2;
  }

  return v9 == 0;
}

- (id)createRootForSyncedFolderType:(unint64_t)a3
{
  if (-[BRCAccountSession hasRootForSyncedFolderType:](self, "hasRootForSyncedFolderType:"))
  {
    uint64_t v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(LegacyAdditions) createRootForSyncedFolderType:]();
    }
  }
  id v5 = [(BRCAccountSession *)self dirPathForSyncedFolderType:a3];
  unint64_t v6 = [[BRCRelativePath alloc] initWithRootPath:v5 session:self];

  return v6;
}

- (BOOL)hasRootForSyncedFolderType:(unint64_t)a3
{
  if (a3 != 1)
  {
    id v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler syncPolicyforSyncedFolderType:]();
    }
  }
  rootsByFolderType = self->_rootsByFolderType;
  if (!rootsByFolderType)
  {
    id v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(LegacyAdditions) hasRootForSyncedFolderType:]();
    }

    rootsByFolderType = self->_rootsByFolderType;
  }
  unint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = [(NSMutableDictionary *)rootsByFolderType objectForKeyedSubscript:v6];
  BOOL v8 = v7 != 0;

  return v8;
}

- (id)rootForSyncedFolderType:(unint64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = self->_rootsByFolderType;
  id v5 = v4;
  if (a3 == 1)
  {
    if (v4) {
      goto LABEL_3;
    }
    goto LABEL_13;
  }
  uint64_t v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
    -[BRCAccountHandler syncPolicyforSyncedFolderType:]();
  }

  if (!v5)
  {
LABEL_13:
    uint64_t v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(LegacyAdditions) fsEventsMonitorForSyncedFolderType:]();
    }
  }
LABEL_3:
  unint64_t v6 = [NSNumber numberWithUnsignedInteger:a3];
  uint64_t v7 = [(NSMutableDictionary *)v5 objectForKeyedSubscript:v6];

  if (!v7)
  {
    BOOL v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT))
    {
      int v15 = 134218498;
      unint64_t v16 = a3;
      __int16 v17 = 2112;
      id v18 = v5;
      __int16 v19 = 2112;
      int v20 = v8;
      _os_log_fault_impl(&dword_1D353B000, v9, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: getting nil entry for folderType: %lu, dictionary: %@%@", (uint8_t *)&v15, 0x20u);
    }
  }
  return v7;
}

- (void)setRoot:(id)a3 forSyncedFolderType:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = self->_rootsByFolderType;
  id v8 = v6;
  if (a4 == 1)
  {
    if (v7) {
      goto LABEL_3;
    }
  }
  else
  {
    uint64_t v14 = brc_bread_crumbs();
    int v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler syncPolicyforSyncedFolderType:]();
    }

    if (v7)
    {
LABEL_3:
      if (v8) {
        goto LABEL_7;
      }
      goto LABEL_4;
    }
  }
  unint64_t v16 = brc_bread_crumbs();
  __int16 v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
    -[BRCAccountSession(LegacyAdditions) fsEventsMonitorForSyncedFolderType:]();
  }

  if (!v8)
  {
LABEL_4:
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT))
    {
      int v20 = 134218498;
      unint64_t v21 = a4;
      __int16 v22 = 2112;
      uint64_t v23 = v7;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_fault_impl(&dword_1D353B000, v10, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: setting nil entry for folderType: %lu, dictionary: %@%@", (uint8_t *)&v20, 0x20u);
    }
  }
LABEL_7:
  uint64_t v11 = [NSNumber numberWithUnsignedInteger:a4];
  id v12 = [(NSMutableDictionary *)v7 objectForKeyedSubscript:v11];

  if (v12)
  {
    id v18 = brc_bread_crumbs();
    __int16 v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(LegacyAdditions) setFSEventsMonitor:forSyncedFolderType:]();
    }
  }
  uint64_t v13 = [NSNumber numberWithUnsignedInteger:a4];
  [(NSMutableDictionary *)v7 setObject:v8 forKeyedSubscript:v13];
}

- (void)removeRootForSyncedFolderType:(unint64_t)a3
{
  id v4 = self->_rootsByFolderType;
  if (a3 != 1)
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler syncPolicyforSyncedFolderType:]();
    }
  }
  id v5 = [NSNumber numberWithUnsignedInteger:a3];
  id v6 = [(NSMutableDictionary *)v4 objectForKeyedSubscript:v5];

  if (!v6)
  {
    id v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(LegacyAdditions) removeFSEventsMonitorForSyncedFolderType:]();
    }
  }
  uint64_t v7 = [NSNumber numberWithUnsignedInteger:a3];
  [(NSMutableDictionary *)v4 removeObjectForKey:v7];
}

- (id)roots
{
  rootsByFolderType = self->_rootsByFolderType;
  if (rootsByFolderType)
  {
    id v3 = (void *)MEMORY[0x1E4F1CAD0];
    id v4 = [(NSMutableDictionary *)rootsByFolderType allValues];
    id v5 = [v3 setWithArray:v4];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (id)stagedItemsEnumerator
{
  id v3 = self->_clientDB;
  id v4 = [(BRCPQLConnection *)v3 fetchWithSlowStatementRadar:@"<rdar://problem/23820733>" sql:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE (item_staged_file_id BETWEEN -9223372036854775808 AND 9223372036854775807)   AND (item_staged_file_id != item_file_id OR item_file_id IS NULL)"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __59__BRCAccountSession_LegacyAdditions__stagedItemsEnumerator__block_invoke;
  v8[3] = &unk_1E6994148;
  v8[4] = self;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 enumerateObjects:v8];

  return v6;
}

id __59__BRCAccountSession_LegacyAdditions__stagedItemsEnumerator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[*(id *)(a1 + 32) newLocalItemFromPQLResultSet:a2 db:*(void *)(a1 + 40) error:a3];
  return v3;
}

- (id)foldersNeedingTransmogrifyEnumerator
{
  id v3 = self->_clientDB;
  id v4 = [(BRCPQLConnection *)v3 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_bouncedname LIKE '%%.folder'   AND item_filename NOT LIKE '%%.folder'   AND item_type = 0   AND item_state IN (0, -1)"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __74__BRCAccountSession_LegacyAdditions__foldersNeedingTransmogrifyEnumerator__block_invoke;
  v8[3] = &unk_1E6994148;
  v8[4] = self;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 enumerateObjects:v8];

  return v6;
}

id __74__BRCAccountSession_LegacyAdditions__foldersNeedingTransmogrifyEnumerator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[*(id *)(a1 + 32) newLocalItemFromPQLResultSet:a2 db:*(void *)(a1 + 40) error:a3];
  return v3;
}

- (id)bouncedItemsEnumerator
{
  id v3 = self->_clientDB;
  id v4 = [(BRCPQLConnection *)v3 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_tmpbounceno IS NOT NULL"];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __60__BRCAccountSession_LegacyAdditions__bouncedItemsEnumerator__block_invoke;
  v8[3] = &unk_1E6994148;
  v8[4] = self;
  id v9 = v3;
  id v5 = v3;
  id v6 = [v4 enumerateObjects:v8];

  return v6;
}

id __60__BRCAccountSession_LegacyAdditions__bouncedItemsEnumerator__block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[*(id *)(a1 + 32) newLocalItemFromPQLResultSet:a2 db:*(void *)(a1 + 40) error:a3];
  return v3;
}

- (id)globalItemByFileID:(unint64_t)a3
{
  return [(BRCAccountSession *)self globalItemByFileID:a3 db:self->_clientDB];
}

- (id)globalItemByFileID:(unint64_t)a3 db:(id)a4
{
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __60__BRCAccountSession_LegacyAdditions__globalItemByFileID_db___block_invoke;
  uint64_t v10[3] = &unk_1E6994148;
  void v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = (void *)[v7 fetchObject:v10, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items  WHERE item_file_id = %lld    AND item_state IN (0, -1)", a3 sql];

  return v8;
}

id __60__BRCAccountSession_LegacyAdditions__globalItemByFileID_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[*(id *)(a1 + 32) newLocalItemFromPQLResultSet:a2 db:*(void *)(a1 + 40) error:a3];
  return v3;
}

- (id)globalItemByDocumentID:(unsigned int)a3
{
  return [(BRCAccountSession *)self globalItemByDocumentID:*(void *)&a3 db:self->_clientDB];
}

- (id)globalItemByDocumentID:(unsigned int)a3 db:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __64__BRCAccountSession_LegacyAdditions__globalItemByDocumentID_db___block_invoke;
  uint64_t v10[3] = &unk_1E6994148;
  void v10[4] = self;
  id v11 = v6;
  id v7 = v6;
  id v8 = (void *)[v7 fetchObject:v10, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_doc_id = %u   AND +item_state IN (0, -1)   AND +item_type IN (1, 2, 8, 6, 7)", v4 sql];

  return v8;
}

id __64__BRCAccountSession_LegacyAdditions__globalItemByDocumentID_db___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  id v3 = (void *)[*(id *)(a1 + 32) newLocalItemFromPQLResultSet:a2 db:*(void *)(a1 + 40) error:a3];
  return v3;
}

- (BOOL)_getRootPathXattrValue:(id *)a3 forRootPath:(id)a4 error:(id *)a5
{
  id v7 = a4;
  id v8 = (const char *)[v7 fileSystemRepresentation];
  int v14 = BRCOpenAt(0xFFFFFFFFLL, v8, 33028, v9, v10, v11, v12, v13, v18);
  int v15 = v14;
  if (v14 < 0)
  {
    if (a5)
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "br_errorFromErrno");
      *a5 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  else
  {
    unint64_t v16 = BRCGetXattrValueForKeyOnFD(v14, v7, (void *)*MEMORY[0x1E4F59488]);
    close(v15);
    if (a3) {
      *a3 = v16;
    }
  }
  return v15 >= 0;
}

- (BOOL)applySyncPolicy:(int64_t)a3 forSyncedFolderType:(unint64_t)a4 isInitialCreation:(BOOL)a5 error:(id *)a6
{
  if (a3 == -1)
  {
    return [(BRCAccountSession *)self enableSyncforSyncedFolderType:a4 isInitialCreation:a5 error:a6];
  }
  else
  {
    if (a3 == 1) {
      goto LABEL_6;
    }
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(LegacyAdditions) applySyncPolicy:forSyncedFolderType:isInitialCreation:error:]();
    }

    if (a3 == 1)
    {
LABEL_6:
      uint64_t v10 = brc_bread_crumbs();
      uint64_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[BRCAccountSession(LegacyAdditions) applySyncPolicy:forSyncedFolderType:isInitialCreation:error:]();
      }

      return 1;
    }
    else
    {
      return 0;
    }
  }
}

- (BOOL)enableSyncforSyncedFolderType:(unint64_t)a3 isInitialCreation:(BOOL)a4 error:(id *)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (a3 != 1)
  {
    id v25 = brc_bread_crumbs();
    uint64_t v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountHandler syncPolicyforSyncedFolderType:]();
    }
  }
  id v8 = [(BRCPQLConnection *)self->_clientDB serialQueue];
  dispatch_assert_queue_not_V2(v8);

  uint64_t v9 = [(BRCPQLConnection *)self->_serverDB serialQueue];
  dispatch_assert_queue_not_V2(v9);

  memset(v27, 0, sizeof(v27));
  __brc_create_section(0, (uint64_t)"-[BRCAccountSession(LegacyAdditions) enableSyncforSyncedFolderType:isInitialCreation:error:]", 584, v27);
  uint64_t v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = v27[0];
    uint64_t v22 = brc_folder_type_name(a3);
    uint64_t v23 = (void *)v22;
    __int16 v24 = @"Mobile Docs";
    *(_DWORD *)buf = 134218498;
    if (v22) {
      __int16 v24 = (__CFString *)v22;
    }
    uint64_t v29 = v21;
    __int16 v30 = 2112;
    BOOL v31 = v24;
    __int16 v32 = 2112;
    uint64_t v33 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx enabling sync for %@%@", buf, 0x20u);
  }
  if (a3 == 1)
  {
    [(BRCAccountSession *)self _loadClientZonesFromDisk];
    uint64_t v12 = [MEMORY[0x1E4F594E8] cloudDocsMangledID];
    id v13 = [(BRCAccountSession *)self getOrCreateAppLibraryAndPrivateZonesIfNecessary:v12];

    int v14 = [(BRCAccountSession *)self rootForSyncedFolderType:1];
    int v15 = [(BRCAccountSession *)self fsEventsMonitorForSyncedFolderType:1];
    unint64_t v16 = [(BRCAccountSession *)self volume];
    char v17 = [v15 openWithRoot:v14 isImmutableRoot:1 volume:v16 error:a5];

    if ((v17 & 1) == 0)
    {
      unsigned __int16 v18 = brc_bread_crumbs();
      __int16 v19 = brc_default_log();
      if (os_log_type_enabled(v19, (os_log_type_t)0x90u)) {
        -[BRCAccountSession(LegacyAdditions) enableSyncforSyncedFolderType:isInitialCreation:error:]();
      }

      [v15 close];
      [v14 close];
      [(BRCAccountSession *)self removeRootForSyncedFolderType:1];
      [(BRCAccountSession *)self removeFSEventsMonitorForSyncedFolderType:1];
    }
  }
  else
  {
    int v14 = brc_bread_crumbs();
    int v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCAccountSession(LegacyAdditions) enableSyncforSyncedFolderType:isInitialCreation:error:]();
    }
    char v17 = 0;
  }

  __brc_leave_section(v27);
  return v17;
}

- (void)_recreateSymlinkIfNecessaryForDocumentsPath:(id)a3 folderName:(id)a4 destinationPath:(id)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v38 = 0;
  __errnuuint64_t m = 0;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __109__BRCAccountSession_LegacyAdditions___recreateSymlinkIfNecessaryForDocumentsPath_folderName_destinationPath___block_invoke;
  v35[3] = &unk_1E6994A60;
  id v11 = v9;
  id v36 = v11;
  int v12 = [v8 performOnOpenFileDescriptor:v35 error:0];

  if (v12)
  {
    stageRegistry = self->_stageRegistry;
    id v34 = 0;
    BOOL v14 = [(BRCStageRegistry *)stageRegistry makeSymlinkWithTarget:v10 inStageGatherFileID:&v38 generationID:0 error:&v34];
    int v15 = (char *)v34;
    if (v14)
    {
      int32_t v16 = [(BRCStageRegistry *)self->_stageRegistry deviceID];
      int v17 = BRCOpenByID(v16, v38, 2097158);
      if ((v17 & 0x80000000) == 0)
      {
        int v18 = v17;
        memset(value, 0, sizeof(value));
        fgetxattr(v17, "com.apple.FinderInfo", value, 0x20uLL, 0, 0);
        BYTE8(value[0]) |= 0x40u;
        if (fsetxattr(v18, "com.apple.FinderInfo", value, 0x20uLL, 0, 0))
        {
          __int16 v19 = brc_bread_crumbs();
          int v20 = brc_default_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v21 = __error();
            uint64_t v22 = strerror(*v21);
            *(_DWORD *)buf = 136315394;
            uint64_t v40 = v22;
            __int16 v41 = 2112;
            id v42 = v19;
            _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't set the hidden finderinfo bit on the staged symlink - %s%@", buf, 0x16u);
          }

          close(v18);
          goto LABEL_24;
        }
        close(v18);
        uint64_t v23 = [v8 pathWithChildAtPath:v11];
        if ([v23 resolveMustExist:0 error:&__errnum])
        {
          uint64_t v28 = self->_stageRegistry;
          uint64_t v33 = v15;
          BOOL v29 = [(BRCStageRegistry *)v28 moveFromStage:v38 toPath:v23 fileName:v11 error:&v33];
          __int16 v30 = v33;

          if (v29)
          {
            __int16 v24 = brc_bread_crumbs();
            BOOL v31 = brc_default_log();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
              -[BRCAccountSession(LegacyAdditions) _recreateSymlinkIfNecessaryForDocumentsPath:folderName:destinationPath:]();
            }
          }
          else
          {
            __int16 v24 = brc_bread_crumbs();
            BOOL v31 = brc_default_log();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v40 = v30;
              __int16 v41 = 2112;
              id v42 = v24;
              _os_log_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't make the symlink live from stage - %@%@", buf, 0x16u);
            }
          }
          int v15 = v30;
        }
        else
        {
          __int16 v24 = brc_bread_crumbs();
          BOOL v31 = brc_default_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v32 = strerror(__errnum);
            *(_DWORD *)buf = 136315394;
            uint64_t v40 = v32;
            __int16 v41 = 2112;
            id v42 = v24;
            _os_log_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't resolve the dest path - %s%@", buf, 0x16u);
          }
        }

LABEL_23:
LABEL_24:

        goto LABEL_25;
      }
      uint64_t v23 = brc_bread_crumbs();
      __int16 v24 = brc_default_log();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      LODWORD(value[0]) = 138412290;
      *(void *)((char *)value + 4) = v23;
      id v25 = "[WARNING] Can't open symlink in the stage%@";
      uint64_t v26 = v24;
      uint32_t v27 = 12;
    }
    else
    {
      uint64_t v23 = brc_bread_crumbs();
      __int16 v24 = brc_default_log();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_23;
      }
      LODWORD(value[0]) = 138412546;
      *(void *)((char *)value + 4) = v15;
      WORD6(value[0]) = 2112;
      *(void *)((char *)value + 14) = v23;
      id v25 = "[WARNING] Can't make symlink in stage - %@%@";
      uint64_t v26 = v24;
      uint32_t v27 = 22;
    }
    _os_log_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEFAULT, v25, (uint8_t *)value, v27);
    goto LABEL_23;
  }
LABEL_25:
}

uint64_t __109__BRCAccountSession_LegacyAdditions___recreateSymlinkIfNecessaryForDocumentsPath_folderName_destinationPath___block_invoke(uint64_t a1, uint64_t a2)
{
  id v3 = (const char *)[*(id *)(a1 + 32) fileSystemRepresentation];
  int v9 = BRCOpenAt(a2, v3, 6, v4, v5, v6, v7, v8, v11);
  if (v9 < 0) {
    return 0;
  }
  close(v9);
  return 0xFFFFFFFFLL;
}

- (void)removeDesktopSymlink:(BOOL)a3 andDocumentsSymlink:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v6 = [(BRCAccountSession *)self cloudDocsClientZone];
  id v10 = [v6 defaultAppLibrary];

  uint64_t v7 = [v10 documentsPath];
  if ([v7 resolveMustExist:1 error:0])
  {
    if (v5)
    {
      uint64_t v8 = [v7 pathWithChildAtPath:*MEMORY[0x1E4F59430]];
      if ([v8 resolveMustExist:1 error:0]
        && [v8 isSymLink])
      {
        BRCUnlinkFileID([v8 deviceID], objc_msgSend(v8, "fileID"));
      }
    }
    if (v4)
    {
      int v9 = [v7 pathWithChildAtPath:*MEMORY[0x1E4F59440]];
      if ([v9 resolveMustExist:1 error:0]
        && [v9 isSymLink])
      {
        BRCUnlinkFileID([v9 deviceID], objc_msgSend(v9, "fileID"));
      }
    }
  }
}

- (BOOL)shouldPathBeDesktopSymlink:(id)a3
{
  return 0;
}

- (BOOL)createAppLibraryOnDisk:(id)a3 createdRoot:(BOOL *)a4 createdDocuments:(BOOL *)a5 rootFileID:(unint64_t *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  char v11 = [v10 isCloudDocsMangledID] ^ 1;
  int v12 = [(BRCAccountSession *)self rootForSyncedFolderType:1];
  int v25 = 0;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __101__BRCAccountSession_LegacyAdditions__createAppLibraryOnDisk_createdRoot_createdDocuments_rootFileID___block_invoke;
  v18[3] = &unk_1E699C228;
  id v13 = v10;
  char v23 = 1;
  id v19 = v13;
  int v20 = a4;
  char v24 = v11;
  uint64_t v21 = a6;
  uint64_t v22 = a5;
  [v12 performOnOpenFileDescriptor:v18 error:&v25];
  int v14 = v25;
  if (v25)
  {
    int v15 = brc_bread_crumbs();
    int32_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v27 = v13;
      __int16 v28 = 2112;
      BOOL v29 = v12;
      __int16 v30 = 2112;
      BOOL v31 = v15;
      _os_log_error_impl(&dword_1D353B000, v16, (os_log_type_t)0x90u, "[ERROR] failed creating container %@ under root %@%@", buf, 0x20u);
    }
  }
  return v14 == 0;
}

uint64_t __101__BRCAccountSession_LegacyAdditions__createAppLibraryOnDisk_createdRoot_createdDocuments_rootFileID___block_invoke(uint64_t a1, int a2)
{
  BOOL v4 = [*(id *)(a1 + 32) mangledIDString];
  if (*(unsigned char *)(a1 + 64) && (BRCMkContainerComponent(a2, v4, *(unsigned char **)(a1 + 40)) & 0x80000000) != 0) {
    goto LABEL_10;
  }
  if (*(void *)(a1 + 48))
  {
    memset(&v8, 0, sizeof(v8));
    if ((fstatat(a2, (const char *)objc_msgSend(v4, "fileSystemRepresentation", 0), &v8, 32) & 0x80000000) == 0)
    {
      **(void **)(a1 + 48) = v8.st_ino;
      goto LABEL_6;
    }
LABEL_10:
    uint64_t v6 = *__error();
    goto LABEL_12;
  }
LABEL_6:
  if (*(unsigned char *)(a1 + 65))
  {
    BOOL v5 = [v4 stringByAppendingPathComponent:*MEMORY[0x1E4F59400]];
    if ((BRCMkContainerComponent(a2, v5, *(unsigned char **)(a1 + 56)) & 0x80000000) != 0)
    {
      uint64_t v6 = *__error();

      goto LABEL_12;
    }
  }
  uint64_t v6 = 0;
LABEL_12:

  return v6;
}

- (void)enumerateSideFaultsUnderParent:(id)a3 db:(id)a4 block:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  int v9 = (void (**)(id, BRCItemGlobalID *, unsigned char *))a5;
  id v10 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v11 = [v10 maxFolderEnumerationCount];

  char v19 = 0;
  int v12 = [v7 clientZone];
  id v13 = [v12 dbRowID];
  int v14 = [v7 itemID];
  int v15 = (void *)[v8 fetch:@"WITH RECURSIVE item_children_with_side_faults (item_id, zone_rowid, faults_count) AS(    SELECT item_id, zone_rowid, faults_count FROM item_recursive_properties      WHERE zone_rowid = %@ AND item_id = %@ AND faults_count != 0  UNION ALL     SELECT ip.item_id, ip.zone_rowid, ip.faults_count FROM item_recursive_properties AS ip INNER JOIN item_children_with_side_faults AS p WHERE ip.item_parent_id = p.item_id AND ip.item_parent_zone_rowid = p.zone_rowid AND ip.faults_count != 0      LIMIT %llu) SELECT ic.item_id, ic.zone_rowid FROM item_children_with_side_faults AS ic WHERE ic.faults_count = 1 AND EXISTS (SELECT 1 FROM client_items AS li WHERE li.item_id = ic.item_id AND li.zone_rowid = ic.zone_rowid AND li.item_type in (2, 7, 8))", v13, v14, v11];

  do
  {
    if (![v15 next]) {
      break;
    }
    int32_t v16 = [v15 objectOfClass:objc_opt_class() atIndex:0];
    int v17 = [v15 objectOfClass:objc_opt_class() atIndex:1];
    int v18 = [[BRCItemGlobalID alloc] initWithZoneRowID:v17 itemID:v16];
    v9[2](v9, v18, &v19);
  }
  while (!v19);
}

- (unint64_t)availableDiskSpace
{
  return [(BRCAccountSession *)self availableDiskSpaceUsingCache:1 schedulingPendingDiskItemsIfNeeded:1];
}

- (unint64_t)availableDiskSpaceUsingCache:(BOOL)a3
{
  return [(BRCAccountSession *)self availableDiskSpaceUsingCache:a3 schedulingPendingDiskItemsIfNeeded:1];
}

- (unint64_t)availableDiskSpaceUsingCache:(BOOL)a3 schedulingPendingDiskItemsIfNeeded:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = self;
  objc_sync_enter(v6);
  mach_absolute_time();
  brc_monotonic_time_diff_to_interval();
  double v8 = v7;
  int v9 = +[BRCUserDefaults defaultsForMangledID:0];
  [v9 diskSpaceCheckInterval];
  double v11 = v10;

  if (v5 && v8 <= v11)
  {
    if (v6->_updateDiskSpacePacer) {
      br_pacer_signal();
    }
  }
  else
  {
    int v12 = [(BRCVolume *)v6->_volume freeSize];
    unint64_t v13 = [v12 unsignedLongLongValue];
    unint64_t v14 = v13;
    if (a4 && v6->_lastDiskSpaceCheckTime && v6->_availableDiskSpace < v13)
    {
      int v15 = brc_bread_crumbs();
      int32_t v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        int v17 = +[BRCDumpContext stringFromByteCount:v14 showActualByteCount:0 suffix:0 context:0];
        [(BRCAccountSession(LegacyAdditions) *)v17 availableDiskSpaceUsingCache:v21 schedulingPendingDiskItemsIfNeeded:v16];
      }

      if (v6->_reschedulePendingDiskItemsPacer) {
        br_pacer_signal();
      }
    }
    v6->_unint64_t availableDiskSpace = v14;
    int v18 = [(BRCVolume *)v6->_volume totalSize];
    v6->_float totalDiskSpace = [v18 unsignedLongLongValue];

    if (v6->_availableDiskSpace > v6->_totalDiskSpace) {
      v6->_unint64_t availableDiskSpace = v6->_totalDiskSpace;
    }
    v6->_lastDiskSpaceCheckTime = mach_absolute_time();
  }
  unint64_t availableDiskSpace = v6->_availableDiskSpace;
  objc_sync_exit(v6);

  return availableDiskSpace;
}

- (void)availableDiskSpaceDidChange
{
  id obj = self;
  objc_sync_enter(obj);
  obj->_lastDiskSpaceCheckTime = 1;
  objc_sync_exit(obj);
}

- (unint64_t)accountSize
{
  id v2 = [(BRCAccountSession *)self clientDB];
  id v3 = (void *)[v2 numberWithSQL:@"SELECT value FROM aggregates WHERE key = 'version_size_sum'"];
  unint64_t v4 = [v3 unsignedLongLongValue];

  return v4;
}

- (unint64_t)computeTotalLiveDocumentSizeWithDb:(id)a3
{
  id v3 = a3;
  [v3 assertOnQueue];
  unint64_t v4 = (void *)[v3 fetchObjectOfClass:objc_opt_class() sql:@"SELECT SUM(li.version_size) FROM client_items as li WHERE li.item_type = 1   AND li.item_state = 0"];

  unint64_t v5 = [v4 unsignedIntegerValue];
  return v5;
}

- (id)_containerMetadataRecordsToSaveWithBatchSize:(unint64_t)a3 requestID:(unint64_t)a4
{
  double v7 = [MEMORY[0x1E4F1CA48] array];
  double v8 = [(BRCPQLConnection *)self->_clientDB serialQueue];
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  int v15 = __113__BRCAccountSession_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke;
  int32_t v16 = &unk_1E699C340;
  int v17 = self;
  id v18 = v7;
  unint64_t v19 = a4;
  unint64_t v20 = a3;
  id v9 = v7;
  dispatch_sync(v8, &v13);

  if (objc_msgSend(v9, "count", v13, v14, v15, v16, v17)) {
    double v10 = v9;
  }
  else {
    double v10 = 0;
  }
  id v11 = v10;

  return v11;
}

void __113__BRCAccountSession_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke(void *a1)
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __113__BRCAccountSession_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2;
  v6[3] = &unk_1E699C318;
  id v3 = (void *)a1[4];
  id v2 = (void *)a1[5];
  uint64_t v8 = a1[6];
  id v4 = v2;
  uint64_t v5 = a1[7];
  id v7 = v4;
  uint64_t v9 = v5;
  [v3 enumerateAppLibraries:v6];
}

uint64_t __113__BRCAccountSession_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (([v3 shouldSaveContainerMetadataServerside] & 1) == 0)
  {
    [v3 setContainerMetadataNeedsSyncUp:0];
LABEL_10:
    uint64_t v9 = 1;
    goto LABEL_11;
  }
  if (![v3 containerMetadataNeedsSyncUp]) {
    goto LABEL_10;
  }
  id v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __113__BRCAccountSession_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2_cold_1(v3);
  }

  [v3 setContainerMetadataSyncRequestID:*(void *)(a1 + 40)];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F1A2D8], "brc_containerMetadataRecordWithContainer:", v3);
  if (v6) {
    [*(id *)(a1 + 32) addObject:v6];
  }
  unint64_t v7 = [*(id *)(a1 + 32) count];
  unint64_t v8 = *(void *)(a1 + 48);

  if (v7 < v8) {
    goto LABEL_10;
  }
  uint64_t v9 = 0;
LABEL_11:

  return v9;
}

void __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] API MISUSE: is_parented_or_equal_to(Container, parent_id, parentId_or_Set)%@", v2, v3, v4, v5, v6);
}

void __74__BRCAccountSession_BRCDatabaseManager___registerStaticDBFunctions_error___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: we have a cycle%@", v2, v3, v4, v5, v6);
}

void __75__BRCAccountSession_BRCDatabaseManager___registerDynamicDBFunctions_error___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)uint64_t v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_1(&dword_1D353B000, a2, a3, "[DEBUG] recursive update of %lld%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_1(void *a1, uint64_t a2, uint64_t a3, NSObject *a4)
{
  *(_DWORD *)a3 = 138412546;
  *(void *)(a3 + 4) = a1;
  *(_WORD *)(a3 + 12) = 2112;
  *(void *)(a3 + 14) = a2;
  OUTLINED_FUNCTION_8_0(&dword_1D353B000, a4, a3, "[CRIT] %@%@", (uint8_t *)a3);
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Saving client state data%@", v2, v3, v4, v5, v6);
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: sself%@", v2, v3, v4, v5, v6);
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_324_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Saved zone state for %@%@");
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_326_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Saved app library state for %@%@");
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_cold_1(void *a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┏%llx db post flush%@", (void)v3, DWORD2(v3));
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_339_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_1D353B000, v0, v1, "[ERROR] Ciconia DB was likely dropped - domain removal will happen on next start%@", v2, v3, v4, v5, v6);
}

void __84__BRCAccountSession_BRCDatabaseManager___finishClientTruthConnectionSetupWithError___block_invoke_2_339_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_8_0(&dword_1D353B000, v0, (uint64_t)v0, "[CRIT] disk is full, restarting: %@%@", v1);
}

void __166__BRCAccountSession_BRCDatabaseManager__openAndValidateDatabase_serverTruth_session_baseURL_skipControlFiles_initialVersion_lastCurrentVersion_deviceIDChanged_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [*v0 lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5(&dword_1D353B000, v2, v3, "[CRIT] UNREACHABLE: Failed to enable recursive triggers - %@%@", v4, v5, v6, v7, v8);
}

void __96__BRCAccountSession_BRCDatabaseManager__backupDatabaseToURL_includeServer_doNotObfuscate_error___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_1D353B000, v0, v1, "[ERROR] disk is full - will fail%@", v2, v3, v4, v5, v6);
}

void __86__BRCAccountSession_DatabaseAdditions__dumpStatusToFileHandle_zoneName_tracker_error___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_1D353B000, a2, (os_log_type_t)0x90u, "[ERROR] Failed opening file handle%@", (uint8_t *)&v2, 0xCu);
}

- (void)registerClient:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: ![_xpcClients containsObject:client]%@", v2, v3, v4, v5, v6);
}

- (void)unregisterClient:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [_xpcClients containsObject:client]%@", v2, v3, v4, v5, v6);
}

- (void)_createAccountSupportPathIfNeeded:protectParent:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] permissions checked%@", v2, v3, v4, v5, v6);
}

- (void)_createAccountSupportPathIfNeeded:(uint64_t)a1 protectParent:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] '%@' already exists%@", (void)v3, DWORD2(v3));
}

void __73__BRCAccountSession__submitDelayedTelemetryEventIfNeeded_wait_withBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Successfully deleted %@%@");
}

void __73__BRCAccountSession__submitDelayedTelemetryEventIfNeeded_wait_withBlock___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: sself->_analyticsReporter%@", v2, v3, v4, v5, v6);
}

void __67__BRCAccountSession__submitSessionOpenFailedTelemetryEventIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: decodedData.count == 1%@", v2, v3, v4, v5, v6);
}

void __62__BRCAccountSession__submitDBCorruptionTelemetryEventIfNeeded__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: decodedData.count == 2%@", v2, v3, v4, v5, v6);
}

- (void)openWithError:(uint64_t)a3 pushWorkloop:.cold.1(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_8_0(&dword_1D353B000, v6, v4, "[CRIT] %@%@", v5);
}

- (void)openWithError:pushWorkloop:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: defaultAppLibrary%@", v2, v3, v4, v5, v6);
}

- (void)openWithError:(uint64_t)a1 pushWorkloop:.cold.4(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] flocking '%@'%@", (void)v3, DWORD2(v3));
}

- (void)openWithError:pushWorkloop:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_isOpen%@", v2, v3, v4, v5, v6);
}

void __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_122_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx rescheduling pending disk throttles%@");
}

void __48__BRCAccountSession_openWithError_pushWorkloop___block_invoke_124_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx recomputing disk space%@");
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_1D353B000, v0, v1, "[ERROR] Failed to set the xpc activity state to done%@", v2, v3, v4, v5, v6);
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Checking for items that need pcs chaining%@", v2, v3, v4, v5, v6);
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_131_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Failed to defer the pcs chain state%@", v2, v3, v4, v5, v6);
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_1D353B000, v0, v1, "[ERROR] Failed to defer the activity state%@", v2, v3, v4, v5, v6);
}

void __51__BRCAccountSession__pcsChainAllItemsWithActivity___block_invoke_139_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_1D353B000, v0, v1, "[ERROR] failed to defer the activity state%@", v2, v3, v4, v5, v6);
}

void __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Checking for items that need salting%@", v2, v3, v4, v5, v6);
}

void __59__BRCAccountSession__saltPartiallySaltedItemsWithActivity___block_invoke_150_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Failed to defer the salting state%@", v2, v3, v4, v5, v6);
}

- (void)_recoverAndReportStateIntegrityWithCompletion:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Starting _recoverAndReportStateIntegrity%@", v2, v3, v4, v5, v6);
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_170_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Checking for folders that need transmogrify%@", v2, v3, v4, v5, v6);
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_181_cold_4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_1D353B000, v0, v1, "[ERROR] failed to continue the pcs chain state%@", v2, v3, v4, v5, v6);
}

void __53__BRCAccountSession__registerBackgroundXPCActivities__block_invoke_197_cold_4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_13(&dword_1D353B000, v0, v1, "[ERROR] failed to continue the salting state%@", v2, v3, v4, v5, v6);
}

void __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2_206_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx Fixing up bounced and staged items%@");
}

void __41__BRCAccountSession__fixupItemsAtStartup__block_invoke_2_208_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: side car forgot to schedule sync up throttle %@!%@", (void)v3, DWORD2(v3));
}

- (void)accountWaitOperation
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _accountWaitOperation.operationFailureThrottle%@", v2, v3, v4, v5, v6);
}

- (void)captureSessionOpenFailedInfoWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Failed to create %@%@", (void)v3, DWORD2(v3));
}

void __26__BRCAccountSession_close__block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [self hasRootForSyncedFolderType:folderType]%@", v2, v3, v4, v5, v6);
}

- (void)closeAndResetLocalStateWithDescription:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: hasDB%@", v2, v3, v4, v5, v6);
}

- (void)_recursivelyPrepareFolderForLogOutAtURL:pruneEmptyFolders:pruneEmptyTopLevelFolder:maxDepth:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: directoryURL is nil%@", v2, v3, v4, v5, v6);
}

- (void)_unlinkContainersWithRootURL:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Calculating pristineContainerIDs before logout.%@", v2, v3, v4, v5, v6);
}

- (void)_unlinkContainersWithRootURL:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self.isOpen The session must be open in order to calculate pristine containers%@", v2, v3, v4, v5, v6);
}

void __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] done deleting local files%@", v2, v3, v4, v5, v6);
}

void __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_254_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] did reset TCC access%@", v2, v3, v4, v5, v6);
}

void __103__BRCAccountSession__destroyLocalDataWaitingForFilesToBeUnlinked_pristineContainerIDs_completionBlock___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] done deleting local account data%@", v2, v3, v4, v5, v6);
}

void __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx loading shared server zones%@");
}

void __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx loading server zones%@");
}

void __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_259_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx registering and activating zones%@");
}

void __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_259_cold_3()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx loading shared client zones%@");
}

void __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_259_cold_4()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx loading client zones%@");
}

void __45__BRCAccountSession__loadClientZonesFromDisk__block_invoke_266_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] activating %@%@", (void)v3, DWORD2(v3));
}

void __42__BRCAccountSession__handleUnloadedZones___block_invoke_2_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  *(_DWORD *)long long v3 = 134218242;
  *(void *)&v3[4] = a2;
  *(_WORD *)&v3[12] = 2112;
  *(void *)&v3[14] = a1;
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, a2, a3, "[CRIT] UNREACHABLE: Found zoneRowID %lu which was skipped on load but is referenced by an item on DB%@", *(void *)v3, *(void *)&v3[8], *(void *)&v3[16], *MEMORY[0x1E4F143B8]);
}

- (void)serverZoneByRowID:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: serverZone.clientZone%@", v2, v3, v4, v5, v6);
}

- (void)serverZoneByRowID:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: serverZone%@", v2, v3, v4, v5, v6);
}

- (void)enumeratePrivateServerZones:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: block%@", v2, v3, v4, v5, v6);
}

- (void)performBlock:(NSObject *)a3 whileRemovingPrivateClientZone:.cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a1 zoneName];
  OUTLINED_FUNCTION_0_0();
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Deactivating private client zone %@%@", v5, 0x16u);
}

- (void)destroySharedClientZone:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Destroying shared client zone %@%@", (void)v3, DWORD2(v3));
}

- (void)destroySharedClientZone:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: sharedClientZone.state & BRCClientZoneStateWantsDataUnlinked%@", v2, v3, v4, v5, v6);
}

- (void)destroySharedClientZone:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: sharedClientZone.state & BRCClientZoneStateIsResetting%@", v2, v3, v4, v5, v6);
}

void __45__BRCAccountSession_destroySharedClientZone___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] deleting shared zone and library for %@ from local db%@");
}

void __45__BRCAccountSession_destroySharedClientZone___block_invoke_289_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] deleting shared container %@ from server db%@");
}

- (void)appLibraryByRowID:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  [a1 unsignedLongLongValue];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8_0(&dword_1D353B000, a3, v4, "[CRIT] UNREACHABLE: can't find app library for %lld%@", v5);
}

- (void)__getOrCreateServerZone:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: serverZone.dbRowID%@", v2, v3, v4, v5, v6);
}

- (void)__getOrCreateServerZone:(uint64_t)a1 .cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Created server zone: %@%@", (void)v3, DWORD2(v3));
}

- (void)__getOrCreateServerZone:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] server zone already exists%@", v2, v3, v4, v5, v6);
}

- (void)__getOrCreateClientZone:withServerZone:alreadyExists:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [clientZone.dbRowID br_isEqualToNumber:serverZone.dbRowID]%@", v2, v3, v4, v5, v6);
}

- (void)__getOrCreateClientZone:(uint64_t)a1 withServerZone:alreadyExists:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Created client zone: %@%@", (void)v3, DWORD2(v3));
}

- (void)__getOrCreateClientZone:withServerZone:alreadyExists:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] client zone already exists%@", v2, v3, v4, v5, v6);
}

- (void)__getOrCreateAppLibrary:rowID:createOnDisk:alreadyExists:withClientZone:createCZMMoved:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] app library already exists%@", v2, v3, v4, v5, v6);
}

- (void)__getOrCreateAppLibrary:(uint64_t)a1 rowID:createOnDisk:alreadyExists:withClientZone:createCZMMoved:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v1, v2, "[CRIT] reset needed for %@ because we had to recreate its root%@", (void)v3, DWORD2(v3));
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: No db rowID on an app library or server zone%@", v2, v3, v4, v5, v6);
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: No mangledID on a server zone%@", v2, v3, v4, v5, v6);
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: no zone name on a server zone%@", v2, v3, v4, v5, v6);
}

- (void)__registerServerZone:clientZone:appLibrary:isShared:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: isShared == (appLibrary == nil)%@", v2, v3, v4, v5, v6);
}

- (void)_getOrCreateAppLibraryAndPrivateZonesIfNecessary:(uint64_t)a1 creationFlags:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: invalid containerID: %@%@", (void)v3, DWORD2(v3));
}

void __84__BRCAccountSession__getOrCreateAppLibraryAndPrivateZonesIfNecessary_creationFlags___block_invoke_298_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: can't find the default client zone%@", v2, v3, v4, v5, v6);
}

- (void)getOrCreateSharedZones:shareAcceptOp:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: mangledID.isShared%@", v2, v3, v4, v5, v6);
}

- (void)getOrReserveLibraryRowIDForLibrary:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: can't reserve library rowID for a shared zone%@", v2, v3, v4, v5, v6);
}

void __60__BRCAccountSession_fetchUserRecordIDWithCompletionHandler___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] fetching the user record id because it wasn't set in the client state%@", v2, v3, v4, v5, v6);
}

- (void)cachedCurrentUserRecordName
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: userRecordName != nil%@", v2, v3, v4, v5, v6);
}

- (void)_cloudDocsAppsListDidChange:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Running in sync bubble. Ignoring app list did change event%@", v2, v3, v4, v5, v6);
}

- (void)_cloudDocsAppsListDidChange:.cold.2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┏%llx CloudDocs apps list did change%@");
}

void __48__BRCAccountSession_cloudDocsAppsListDidChange___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Couldn't change personas during app list refresh%@", v2, v3, v4, v5, v6);
}

- (void)isGreedy
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] greediness enforced because optimize storage is disabled%@", v2, v3, v4, v5, v6);
}

- (void)sessionDirPath
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: sessionDirPath was accessed after being closed%@", v2, v3, v4, v5, v6);
}

- (void)cacheDirPath
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: cacheDirPath was accessed after being closed%@", v2, v3, v4, v5, v6);
}

- (void)applyScheduler
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: applyScheduler was accessed after being closed%@", v2, v3, v4, v5, v6);
}

- (void)containerScheduler
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: containerScheduler was accessed after being closed%@", v2, v3, v4, v5, v6);
}

- (void)autoResumeSyncTimerScheduler
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: autoResumeSyncTimerScheduler was accessed after being closed%@", v2, v3, v4, v5, v6);
}

- (void)fsReader
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: fsReader was accessed after being closed%@", v2, v3, v4, v5, v6);
}

- (void)fsWriter
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: fsWriter was accessed after being closed%@", v2, v3, v4, v5, v6);
}

- (void)notificationManager
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: notificationManager was accessed after being closed%@", v2, v3, v4, v5, v6);
}

- (void)stageRegistry
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: stageRegistry was accessed after being closed%@", v2, v3, v4, v5, v6);
}

void __69__BRCAccountSession_ItemFetching__enumerateContainersWithDB_handler___block_invoke_cold_1()
{
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  __int16 v3 = 2112;
  uint64_t v4 = v0;
  _os_log_error_impl(&dword_1D353B000, v1, (os_log_type_t)0x90u, "[ERROR] failed to create container query item from %@%@", v2, 0x16u);
}

void __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] ignoring failure to enable synced folder type%@", v1, 0xCu);
}

void __74__BRCAccountSession_LegacyAdditions__createAppLibrariesIfNeededWithError___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_2_5();
  OUTLINED_FUNCTION_15_0(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Bad folder type %u%@");
}

void __78__BRCAccountSession_LegacyAdditions___createAppLibraryRootsIfNeededWithError___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: createAppLibaryRoot failed but error is nil%@", v2, v3, v4, v5, v6);
}

void __113__BRCAccountSession_BRCContainerMetadataSyncUpAdditions___containerMetadataRecordsToSaveWithBatchSize_requestID___block_invoke_2_cold_1(void *a1)
{
  uint64_t v1 = [a1 containerMetadata];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v2, v3, "[DEBUG] preparing to sync up %@%@", v4, v5, v6, v7, v8);
}

@end