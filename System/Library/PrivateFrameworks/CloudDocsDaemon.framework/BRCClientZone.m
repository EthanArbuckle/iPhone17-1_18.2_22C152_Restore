@interface BRCClientZone
- (BOOL)_checkIfEnumeratorContainsNonDiscretionaryOp:(id)a3;
- (BOOL)_crossZoneMoveDocumentsToZone:(id)a3;
- (BOOL)_deleteRelevantPackageItemsWithDB:(id)a3 error:(id *)a4;
- (BOOL)_dumpItemsToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5;
- (BOOL)_hasAllItemsDidUploadHandlers;
- (BOOL)_hasNonDiscretionaryServerStitchingOperation;
- (BOOL)_isIdle;
- (BOOL)_isSideSyncOperationBlockedWithName:(id)a3;
- (BOOL)_isSideSyncOperationBlockedWithName:(id)a3 isWaitingOnShareAccept:(BOOL)a4;
- (BOOL)_performHardResetOnClientItemsAndWantsUnlink:(BOOL)a3 db:(id)a4 error:(id *)a5;
- (BOOL)_postHardResetHandlingWithDB:(id)a3 completionBlock:(id)a4 error:(id *)a5;
- (BOOL)_resetItemsTable;
- (BOOL)_shouldFailSyncDownWaitImmediately;
- (BOOL)activated;
- (BOOL)containsNonRejectedChildWithParentID:(id)a3 db:(id)a4;
- (BOOL)dumpActivityToContext:(id)a3 includeExpensiveActivity:(BOOL)a4 error:(id *)a5;
- (BOOL)dumpStatusToContext:(id)a3 error:(id *)a4;
- (BOOL)dumpTablesToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5;
- (BOOL)enhancedDrivePrivacyEnabled;
- (BOOL)existsByItemID:(id)a3;
- (BOOL)existsByItemID:(id)a3 db:(id)a4;
- (BOOL)existsByParentID:(id)a3 andCaseInsensitiveLogicalName:(id)a4;
- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4;
- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5;
- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4 excludingItemID:(id)a5;
- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4 excludingItemID:(id)a5 db:(id)a6;
- (BOOL)handleSaltingErrorIfNeeded:(id)a3 record:(id)a4;
- (BOOL)handleZoneLevelErrorIfNeeded:(id)a3 forItemCreation:(BOOL)a4;
- (BOOL)hasCompletedInitialSyncDownOnce;
- (BOOL)hasHighPriorityWatchers;
- (BOOL)hasItems;
- (BOOL)hasItemsWithInFlightDiffs;
- (BOOL)isBusy;
- (BOOL)isCloudDocsZone;
- (BOOL)isEqual:(id)a3;
- (BOOL)isEqualToClientZone:(id)a3;
- (BOOL)isForeground;
- (BOOL)isPrivateZone;
- (BOOL)isSharedZone;
- (BOOL)isSyncBlocked;
- (BOOL)isSyncBlockedBecauseAppNotInstalled;
- (BOOL)isSyncBlockedBecauseOSNeedsUpgrade;
- (BOOL)needsSave;
- (BOOL)removeItemIsDownloadedBlock:(id)a3;
- (BOOL)removeItemOnDiskBlock:(id)a3;
- (BOOL)removeSyncDownForItemIDBlock:(id)a3;
- (BOOL)setStateBits:(unsigned int)a3;
- (BOOL)shouldSyncMangledID:(id)a3;
- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4;
- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4;
- (BRCAccountSession)session;
- (BRCClientZone)init;
- (BRCClientZone)initWithMangledID:(id)a3 dbRowID:(id)a4 plist:(id)a5 session:(id)a6 initialCreation:(BOOL)a7;
- (BRCClientZoneDelegate)delegate;
- (BRCDeadlineSource)syncDeadlineSource;
- (BRCItemID)rootItemID;
- (BRCPQLConnection)db;
- (BRCServerZone)serverZone;
- (BRCZoneRowID)dbRowID;
- (BRMangledID)mangledID;
- (NSArray)syncThrottles;
- (NSDate)lastAttemptedSyncDownDate;
- (NSDictionary)parentsOfCZMFaults;
- (NSMutableDictionary)plist;
- (NSSet)itemIDsBlockedFromSyncForCZMProcessing;
- (NSString)description;
- (NSString)osNameRequiredToSync;
- (NSString)zoneName;
- (brc_task_tracker)taskTracker;
- (char)itemTypeByItemID:(id)a3 db:(id)a4;
- (char)serverItemTypeByItemID:(id)a3 db:(id)a4;
- (float)syncUpBackoffDelay;
- (float)syncUpBackoffRatio;
- (id)_cancelAllOperationsForReset;
- (id)_faultsEnumeratorFromRow:(unint64_t)a3 batchSize:(unint64_t)a4;
- (id)_refreshItemFromDB:(id)a3;
- (id)allItems;
- (id)allItemsSortedByDepthDescending:(BOOL)a3;
- (id)asPrivateClientZone;
- (id)asSharedClientZone;
- (id)cancelFetchParentChainOperationAndReschedule:(id)a3;
- (id)cancelListOperationAndReschedule:(id)a3;
- (id)cancelLocateRecordOperationAndReschedule:(id)a3;
- (id)childBaseSaltForItemID:(id)a3;
- (id)clientChildCountWithParentID:(id)a3 db:(id)a4;
- (id)descriptionWithContext:(id)a3;
- (id)directUnsaltedNonAliasItemsInServerTruthEnumeratorParentedTo:(id)a3;
- (id)directoryItemIDsCreatedLastSyncUp;
- (id)directoryOrRootItemIDByFileID:(unint64_t)a3;
- (id)directoryOrRootItemIDByFileID:(unint64_t)a3 db:(id)a4;
- (id)documentItemByItemID:(id)a3;
- (id)documentItemByItemID:(id)a3 db:(id)a4;
- (id)documentsNotIdleEnumeratorWithStartingRowID:(unint64_t)a3 batchSize:(unint64_t)a4;
- (id)faultByParentID:(id)a3 andLogicalName:(id)a4;
- (id)faultByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5;
- (id)faultByParentID:(id)a3 andPhysicalName:(id)a4;
- (id)faultByParentID:(id)a3 andPhysicalName:(id)a4 db:(id)a5;
- (id)fetchDirectoryContentsIfNecessary:(id)a3 isUserWaiting:(BOOL)a4 rescheduleApplyScheduler:(BOOL)a5;
- (id)fetchParentChainIfNecessaryWithParentItemID:(id)a3 isUserWaiting:(BOOL)a4;
- (id)fetchRecursiveDirectoryContentsIfNecessary:(id)a3 isUserWaiting:(BOOL)a4 rescheduleApply:(BOOL)a5;
- (id)itemByDocumentID:(unsigned int)a3;
- (id)itemByDocumentID:(unsigned int)a3 db:(id)a4;
- (id)itemByFileID:(unint64_t)a3;
- (id)itemByFileID:(unint64_t)a3 db:(id)a4;
- (id)itemByItemID:(id)a3;
- (id)itemByItemID:(id)a3 db:(id)a4;
- (id)itemByParentID:(id)a3 andLogicalName:(id)a4;
- (id)itemByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5;
- (id)itemByParentID:(id)a3 andPhysicalName:(id)a4;
- (id)itemByParentID:(id)a3 andPhysicalName:(id)a4 db:(id)a5;
- (id)itemByRowID:(unint64_t)a3;
- (id)itemByRowID:(unint64_t)a3 db:(id)a4;
- (id)itemCountPendingUploadOrSyncUpAndReturnError:(id *)a3;
- (id)itemsEnumeratorWithDB:(id)a3;
- (id)itemsParentedToThisZoneButLivingInAnOtherZone;
- (id)itemsWithInFlightDiffsEnumerator;
- (id)locateRecordIfNecessaryForRecordID:(id)a3 isUserWaiting:(BOOL)a4;
- (id)locateRecordIfNecessaryForRecordID:(id)a3 isUserWaiting:(BOOL)a4 maxOperationBackoff:(double)a5;
- (id)ownerName;
- (id)popDownloadedBlockForItemID:(id)a3;
- (id)popOnDiskBlockForItemID:(id)a3;
- (id)reservedItemByParentID:(id)a3 andLogicalName:(id)a4;
- (id)reservedItemByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5;
- (id)serverChildCountWithParentID:(id)a3 db:(id)a4;
- (id)serverHiddenChildCountWithParentID:(id)a3 db:(id)a4;
- (id)serverItemByItemID:(id)a3;
- (id)serverItemByItemID:(id)a3 db:(id)a4;
- (id)serverItemByParentID:(id)a3 andLogicalName:(id)a4;
- (id)serverItemByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5;
- (id)serverItemByRank:(int64_t)a3;
- (id)serverItemByRowID:(unint64_t)a3;
- (id)serverItemByRowID:(unint64_t)a3 db:(id)a4;
- (id)serverQuotaUsageWithParentID:(id)a3 db:(id)a4;
- (id)sizeOfItemsNeedingSyncUpOrUploadAndReturnError:(id *)a3;
- (id)syncDownAnalyticsError;
- (id)syncDownImmediately;
- (id)syncUpAnalyticsError;
- (int64_t)lastInsertedRank;
- (int64_t)serverRankByItemID:(id)a3;
- (int64_t)serverRankByItemID:(id)a3 db:(id)a4;
- (int64_t)throttleHashWithItemID:(id)a3;
- (unint64_t)allocateSyncUpRequestID;
- (unint64_t)currentRequestID;
- (unint64_t)hash;
- (unsigned)_activateState:(unsigned int)a3 origState:(unsigned int)a4;
- (unsigned)_appLibrariesState;
- (unsigned)saltingStateForItemID:(id)a3;
- (unsigned)state;
- (unsigned)syncState;
- (unsigned)syncUpBatchSize;
- (void)_allItemsDidUploadWithError:(id)a3;
- (void)_appendToString:(id)a3 descriptionOfFieldNamed:(id)a4 inResultSet:(id)a5 pos:(int *)a6 containsSize:(BOOL)a7 context:(id)a8;
- (void)_blockSyncDownOnStitchingOperations;
- (void)_bumpNotificationRankOnTopLevelFolderSharesInZone;
- (void)_bumpNotificationRankOnTopLevelFolderSharesParentedToZone;
- (void)_cancelOutOfBandOperations;
- (void)_decreaseSyncUpBatchSizeAfterError;
- (void)_deleteJobsMatchingServerZone;
- (void)_dumpRecursivePropertiesOfItemByRowID:(unint64_t)a3 context:(id)a4 depth:(int)a5;
- (void)_enumerateAndClearLocateBlocksForRecordID:(id)a3 exists:(BOOL)a4;
- (void)_enumerateFaultsWithBlock:(id)a3 rowID:(unint64_t)a4 batchSize:(unint64_t)a5;
- (void)_finishedProcessingItemThatMovedToThisZone:(id)a3;
- (void)_finishedReset:(unint64_t)a3 completionHandler:(id)a4;
- (void)_fixupEnhancedDrivePrivacyState;
- (void)_fixupMissingCrossMovedItems;
- (void)_flushIdleBlocksIfNeeded;
- (void)_forDBUpgrade_setStateBits:(unsigned int)a3 clearStateBits:(unsigned int)a4;
- (void)_handleSoftResetOfLocalItem:(id)a3 wantsUnlink:(BOOL)a4;
- (void)_increaseSyncUpBatchSizeAfterSuccess;
- (void)_isIdle;
- (void)_markLatestSyncRequestFailed;
- (void)_markRequestIDAcked;
- (void)_mkdirAppLibraryIfNeeded:(id)a3;
- (void)_performAfterResetServerAndClientPrivateTruthsAndUnlinkData:(id)a3;
- (void)_performAfterResetServerAndClientSharedTruthsAndUnlinkData:(id)a3;
- (void)_performAfterResetServerAndClientTruthsAndUnlinkData:(id)a3;
- (void)_performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone:(id)a3;
- (void)_performResetAndWantsUnlink:(BOOL)a3 clientTruthBlock:(id)a4 completionBlock:(id)a5;
- (void)_performSoftResetOnItems:(id)a3 wantsUnlink:(BOOL)a4;
- (void)_postSoftResetHandlingAndWantsUnlink:(BOOL)a3 completionBlock:(id)a4;
- (void)_prepareForForegroundSyncDown;
- (void)_recreateSyncBudgetsAndThrottlesIfNeeded;
- (void)_registerFetchParentChainOperation:(id)a3;
- (void)_registerListOperation:(id)a3 shareAcceptOperation:(id)a4;
- (void)_registerLocateRecordOperation:(id)a3;
- (void)_registerOperation:(id)a3 throttler:(id)a4;
- (void)_registerServerStitchingOperation:(id)a3;
- (void)_removeAllShareAcceptanceBlocks;
- (void)_removeDownloadedBlockToPerformForItemID:(id)a3;
- (void)_removeItemAndProcessForCrossZoneMove:(id)a3;
- (void)_removeItemFromCZMProcessingIfNotAssociated:(id)a3;
- (void)_removeOnDiskBlockToPerformForItemID:(id)a3;
- (void)_removeTargetedAliasesWithCompletionBlock:(id)a3;
- (void)_reset:(unint64_t)a3 completionHandler:(id)a4;
- (void)_resetAndDeleteServerTruthData;
- (void)_scheduleZoneResetForUninstalledAppIfNecessary;
- (void)_shouldFailSyncDownWaitImmediately;
- (void)_startDownloadingItemForCrossZoneMoveIfNecessary:(id)a3;
- (void)_startSync;
- (void)_syncUpOfRecords:(id)a3 createdAppLibraryNames:(id)a4 didFinishWithError:(id)a5 errorWasOnPCSChainedItem:(BOOL)a6 throttledItemInBatch:(BOOL)a7;
- (void)addOutOfBandOperation:(id)a3;
- (void)addSyncDownDependency:(id)a3;
- (void)asPrivateClientZone;
- (void)asSharedClientZone;
- (void)associateWithServerZone:(id)a3;
- (void)associateWithServerZone:(id)a3 offline:(BOOL)a4;
- (void)beginSyncBubbleActivityIfNecessary;
- (void)cancelReset;
- (void)clearAndRefetchRecentAndFavoriteDocuments;
- (void)clearStateBits:(unsigned int)a3;
- (void)clearSyncStateBits:(unsigned int)a3;
- (void)clearSyncUpError;
- (void)close;
- (void)dealloc;
- (void)didApplyTombstoneForRank:(int64_t)a3;
- (void)didClearOutOfQuota;
- (void)didGCTombstoneRanks:(id)a3;
- (void)didSyncDownRequestID:(unint64_t)a3 maxApplyRank:(int64_t)a4 caughtUpWithServer:(BOOL)a5 syncDownDate:(id)a6;
- (void)disconnectNSMDQListenerAsync;
- (void)enumerateFaultsAsyncWithBlock:(id)a3 batchSize:(unint64_t)a4;
- (void)fetchRecentAndFavoriteDocuments;
- (void)fetchRecentAndFavoriteDocuments:(BOOL)a3;
- (void)flushAppliedTombstones;
- (void)handleRootRecordDeletion;
- (void)itemCrossZoneMoved:(id)a3 withLookup:(id)a4;
- (void)itemMovedIntoShareInThisZone:(id)a3 associatedItemID:(id)a4;
- (void)learnCKInfosFromSavedRecords:(id)a3 isOutOfBandModifyRecords:(BOOL)a4;
- (void)listedUpToRank:(int64_t)a3;
- (void)networkReachabilityChanged:(BOOL)a3;
- (void)notifyClient:(id)a3 afterNextSyncDown:(id)a4;
- (void)notifyClient:(id)a3 whenIdle:(id)a4;
- (void)performBlock:(id)a3 whenItemWithIDIsDownloaded:(id)a4;
- (void)performBlock:(id)a3 whenItemWithRecordIDIsOnDisk:(id)a4;
- (void)performBlock:(id)a3 whenLocatingCompletesForItemWithRecordID:(id)a4;
- (void)performBlock:(id)a3 whenSyncDownCompletesLookingForItemID:(id)a4;
- (void)prepareDirectoryForSyncUp:(id)a3;
- (void)recomputeAllItemsDidUploadState;
- (void)registerAllItemsDidUploadTracker:(id)a3;
- (void)removeOutOfBandOperation:(id)a3;
- (void)removeSyncDownDependency:(id)a3;
- (void)resetSyncBudgetAndThrottle;
- (void)resetSyncUpBackoffRatio;
- (void)resume;
- (void)rootItemID;
- (void)scheduleReset:(unint64_t)a3;
- (void)scheduleReset:(unint64_t)a3 completionHandler:(id)a4;
- (void)scheduleResetServerAndClientTruthsForReason:(id)a3;
- (void)scheduleResetServerAndClientTruthsForReason:(id)a3 completionHandler:(id)a4;
- (void)scheduleSyncDown;
- (void)scheduleSyncDownFirst;
- (void)scheduleSyncDownForOOBModifyRecordsAck;
- (void)scheduleSyncDownWithGroup:(id)a3;
- (void)scheduleSyncUp;
- (void)setDbRowID:(id)a3;
- (void)setDelegate:(id)a3;
- (void)setLastAttemptedSyncDownDate:(id)a3;
- (void)setNeedsSave:(BOOL)a3;
- (void)setServerZone:(id)a3;
- (void)setSession:(id)a3;
- (void)setSyncStateBits:(unsigned int)a3;
- (void)syncDownImmediately;
- (void)syncDownOperation:(id)a3 didFinishWithError:(id)a4 status:(int64_t)a5;
- (void)unregisterAllItemsDidUploadTracker:(id)a3;
- (void)updateWithPlist:(id)a3;
- (void)waitForCrossZoneMoveProcessingWithCompletion:(id)a3;
@end

@implementation BRCClientZone

- (id)directUnsaltedNonAliasItemsInServerTruthEnumeratorParentedTo:(id)a3
{
  id v4 = a3;
  v5 = [(BRCClientZone *)self db];
  v6 = [(BRCClientZone *)self dbRowID];
  v7 = (void *)[v5 fetch:@"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_parent_id = %@ AND basehash_salt_validation_key IS NULL AND item_type != 3 and zone_rowid = %@", v4, v6];

  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __104__BRCClientZone_BRCBaseHashSaltAdditions__directUnsaltedNonAliasItemsInServerTruthEnumeratorParentedTo___block_invoke;
  v10[3] = &unk_1E6994120;
  v10[4] = self;
  v8 = [v7 enumerateObjects:v10];

  return v8;
}

id __104__BRCClientZone_BRCBaseHashSaltAdditions__directUnsaltedNonAliasItemsInServerTruthEnumeratorParentedTo___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  v6 = [v4 session];
  v7 = (void *)[v6 newServerItemFromPQLResultSet:v5 error:a3];

  return v7;
}

- (unsigned)saltingStateForItemID:(id)a3
{
  id v4 = a3;
  if ([v4 isNonDesktopRoot])
  {
    if (![(BRCClientZone *)self isPrivateZone])
    {
      v13 = brc_bread_crumbs();
      v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        -[BRCClientZone(BRCBaseHashSaltAdditions) saltingStateForItemID:]((uint64_t)v13, v14);
      }
    }
    id v5 = [(BRCClientZone *)self session];
    v6 = [v4 appLibraryRowID];

    v7 = [v5 appLibraryByRowID:v6];

    if (![v7 rootRecordCreated])
    {
      unsigned int v11 = -1;
      goto LABEL_9;
    }
    unsigned int v8 = [v7 saltingState];
  }
  else
  {
    v9 = [(BRCClientZone *)self db];
    v10 = [(BRCClientZone *)self dbRowID];
    v7 = (void *)[v9 numberWithSQL:@"SELECT salting_state FROM server_items WHERE item_id = %@ AND zone_rowid = %@ LIMIT 1", v4, v10];

    if (!v7) {
      return -1;
    }
    unsigned int v8 = [v7 intValue];
  }
  unsigned int v11 = v8;
LABEL_9:

  return v11;
}

- (id)childBaseSaltForItemID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isNonDesktopRoot])
  {
    if (![(BRCClientZone *)self isPrivateZone])
    {
      v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BRCClientZone(BRCBaseHashSaltAdditions) saltingStateForItemID:]((uint64_t)v15, v16);
      }
    }
    id v5 = [(BRCClientZone *)self session];
    v6 = [v4 appLibraryRowID];
    v7 = [v5 appLibraryByRowID:v6];
    unsigned int v8 = [v7 childBasehashSalt];
  }
  else
  {
    id v5 = [(BRCClientZone *)self db];
    v6 = [(BRCClientZone *)self dbRowID];
    unsigned int v8 = (void *)[v5 dataWithSQL:@"SELECT child_basehash_salt FROM server_items WHERE item_id = %@ AND zone_rowid = %@ LIMIT 1", v4, v6];
  }

  v9 = brc_bread_crumbs();
  v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    v12 = objc_msgSend(v8, "brc_truncatedSHA256");
    v13 = objc_msgSend(v12, "brc_hexadecimalString");
    v14 = [v4 debugDescription];
    *(_DWORD *)buf = 138412802;
    v18 = v13;
    __int16 v19 = 2112;
    v20 = v14;
    __int16 v21 = 2112;
    v22 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Found child basehash salt %@ from database for %@%@", buf, 0x20u);
  }
  return v8;
}

- (void)cancelReset
{
  if (self->_resetTimer)
  {
    v3 = [(BRCAccountSession *)self->_session resetQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __42__BRCClientZone_BRCZoneReset__cancelReset__block_invoke;
    block[3] = &unk_1E6993698;
    block[4] = self;
    dispatch_sync(v3, block);
  }
}

void __42__BRCClientZone_BRCZoneReset__cancelReset__block_invoke(uint64_t a1)
{
  v2 = *(NSObject **)(*(void *)(a1 + 32) + 304);
  if (v2)
  {
    dispatch_source_cancel(v2);
    uint64_t v3 = *(void *)(a1 + 32);
    id v4 = *(void **)(v3 + 304);
    *(void *)(v3 + 304) = 0;
  }
}

- (void)scheduleReset:(unint64_t)a3
{
}

- (void)scheduleReset:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  v7 = [(BRCAccountSession *)self->_session resetQueue];
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone(BRCZoneReset) scheduleReset:completionHandler:]", 104, v18);
  unsigned int v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = v18[0];
    uint64_t v13 = BRCPrettyPrintEnum();
    *(_DWORD *)buf = 134218754;
    uint64_t v20 = v12;
    __int16 v21 = 2080;
    uint64_t v22 = v13;
    __int16 v23 = 2112;
    v24 = self;
    __int16 v25 = 2112;
    v26 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx scheduling reset %s of %@%@", buf, 0x2Au);
  }

  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke;
  v14[3] = &unk_1E6995BA8;
  v14[4] = self;
  unint64_t v17 = a3;
  id v10 = v6;
  id v16 = v10;
  id v11 = v7;
  id v15 = v11;
  dispatch_async_with_logs_5(v11, v14);

  __brc_leave_section(v18);
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke(uint64_t a1)
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  uint64_t v62 = 0;
  v63 = &v62;
  uint64_t v64 = 0x2020000000;
  uint64_t v65 = 0;
  uint64_t v56 = 0;
  v57 = &v56;
  uint64_t v58 = 0x3032000000;
  v59 = __Block_byref_object_copy__15;
  v60 = __Block_byref_object_dispose__15;
  id v61 = 0;
  v2 = [*(id *)(*(void *)(a1 + 32) + 64) serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_1;
  block[3] = &unk_1E6996528;
  block[4] = *(void *)(a1 + 32);
  void block[5] = &v62;
  uint64_t v3 = *(void *)(a1 + 56);
  block[6] = &v56;
  block[7] = v3;
  dispatch_sync(v2, block);

  if (v63[3])
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_cold_2([(id)v57[5] count], (uint64_t)v4, v75, v5);
    }

    long long v53 = 0u;
    long long v54 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    id v6 = (id)v57[5];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v51 objects:v74 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v52;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v52 != v8) {
            objc_enumerationMutation(v6);
          }
          [*(id *)(*((void *)&v51 + 1) + 8 * i) waitUntilFinished];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v51 objects:v74 count:16];
      }
      while (v7);
    }

    int v10 = [*(id *)(a1 + 32) isSharedZone];
    id v11 = *(void **)(*(void *)(a1 + 32) + 8);
    if (v10) {
      [v11 sharedAppLibraryResetThrottle];
    }
    else {
    uint64_t v13 = [v11 appLibraryResetThrottle];
    }
    v14 = [*(id *)(a1 + 32) zoneName];
    int64_t v15 = +[BRCThrottle throttleHashFormat:@"%@~%d", v14, v63[3]];

    unint64_t v16 = [v13 nsecsToNextRetry:v15 now:brc_current_date_nsec() increment:0];
    [v13 incrementRetryCount:v15];
    if (v16)
    {
      if (v16 < 0x7FFFFFFFFFFFFFFFLL)
      {
        long long v47 = 0uLL;
        uint64_t v48 = 0;
        __brc_create_section(0, (uint64_t)"-[BRCClientZone(BRCZoneReset) scheduleReset:completionHandler:]_block_invoke", 202, &v47);
        __int16 v21 = brc_bread_crumbs();
        uint64_t v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v37 = v47;
          brc_interval_from_nsec();
          uint64_t v38 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 134218754;
          uint64_t v67 = v37;
          __int16 v68 = 2048;
          v69 = v39;
          __int16 v70 = 2112;
          uint64_t v71 = v38;
          __int16 v72 = 2112;
          v73 = v21;
          _os_log_debug_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting %.3f secs to reset %@%@", buf, 0x2Au);
        }

        long long v49 = v47;
        uint64_t v50 = v48;
        if (*(void *)(*(void *)(a1 + 32) + 304))
        {
          v40 = brc_bread_crumbs();
          v41 = brc_default_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_FAULT)) {
            __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_cold_1();
          }
        }
        dispatch_source_t v23 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 40));
        uint64_t v24 = *(void *)(a1 + 32);
        __int16 v25 = *(void **)(v24 + 304);
        *(void *)(v24 + 304) = v23;

        v26 = *(NSObject **)(*(void *)(a1 + 32) + 304);
        dispatch_time_t v27 = dispatch_time(0, v16);
        dispatch_source_set_timer(v26, v27, 0xFFFFFFFFFFFFFFFFLL, 0);
        uint64_t v28 = *(void *)(a1 + 32);
        v29 = *(void **)(v28 + 304);
        v42[0] = MEMORY[0x1E4F143A8];
        v42[1] = 3221225472;
        v42[2] = __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_5;
        v42[3] = &unk_1E6996550;
        long long v45 = v49;
        uint64_t v46 = v50;
        v42[4] = v28;
        v44 = &v62;
        id v43 = *(id *)(a1 + 48);
        id v30 = v29;
        v31 = v42;
        v32 = v30;
        v33 = v31;
        v34 = v33;
        v35 = v33;
        if (*MEMORY[0x1E4F59658])
        {
          v35 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v33);
        }
        dispatch_block_t v36 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v35);
        dispatch_source_set_event_handler(v32, v36);

        dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 32) + 304));
      }
      else
      {
        unint64_t v17 = brc_bread_crumbs();
        v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v19 = *(void *)(a1 + 32);
          *(_DWORD *)buf = 138412546;
          uint64_t v67 = v19;
          __int16 v68 = 2112;
          v69 = v17;
          _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] giving up on resetting %@%@", buf, 0x16u);
        }

        uint64_t v20 = *(void *)(a1 + 48);
        if (v20) {
          (*(void (**)(void))(v20 + 16))();
        }
      }
    }
    else
    {
      [*(id *)(a1 + 32) _reset:v63[3] completionHandler:*(void *)(a1 + 48)];
    }
  }
  else
  {
    uint64_t v12 = *(void *)(a1 + 48);
    if (v12) {
      (*(void (**)(void))(v12 + 16))();
    }
  }
  _Block_object_dispose(&v56, 8);

  _Block_object_dispose(&v62, 8);
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_1(uint64_t a1)
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  unsigned int v2 = [*(id *)(a1 + 32) state];
  if ((v2 & 0x20000) != 0) {
    uint64_t v3 = 3;
  }
  else {
    uint64_t v3 = *(void *)(a1 + 56);
  }
  *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = v3;
  if ([*(id *)(a1 + 32) isPrivateZone])
  {
    id v4 = [*(id *)(a1 + 32) asPrivateClientZone];
    id v5 = [v4 defaultAppLibrary];
    unsigned int v6 = [v5 state];
  }
  else
  {
    unsigned int v6 = 0;
  }
  if (*(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) <= 2uLL) {
    uint64_t v7 = 256;
  }
  else {
    uint64_t v7 = 131328;
  }
  if ([*(id *)(a1 + 32) isPrivateZone])
  {
    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    uint64_t v8 = [*(id *)(a1 + 32) asPrivateClientZone];
    v9 = [v8 appLibraries];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v31;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v31 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
          if ((v2 & 0x100) == 0) {
            [*(id *)(*((void *)&v30 + 1) + 8 * i) cancelFileCoordinators];
          }
          [v13 setStateBits:8];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v30 objects:v42 count:16];
      }
      while (v10);
    }
  }
  memset(v29, 0, sizeof(v29));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone(BRCZoneReset) scheduleReset:completionHandler:]_block_invoke", 138, v29);
  v14 = brc_bread_crumbs();
  int64_t v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v21 = v29[0];
    uint64_t v22 = BRCPrettyPrintEnum();
    dispatch_source_t v23 = *(void **)(a1 + 32);
    *(_DWORD *)buf = 134218754;
    uint64_t v35 = v21;
    __int16 v36 = 2080;
    uint64_t v37 = v22;
    __int16 v38 = 2112;
    v39 = v23;
    __int16 v40 = 2112;
    v41 = v14;
    _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx reset %s of %@%@", buf, 0x2Au);
  }

  if ((v2 & 0x100) != 0)
  {
    uint64_t v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      BRCClientZoneStatePrettyPrint(v2);
      id v24 = (id)objc_claimAutoreleasedReturnValue();
      BRCAppLibraryStatePrettyPrint(v6);
      id v25 = (id)objc_claimAutoreleasedReturnValue();
      v26 = BRCClientZoneStatePrettyPrint(v7 & ~v2);
      *(_DWORD *)buf = 138413058;
      uint64_t v35 = (uint64_t)v24;
      __int16 v36 = 2112;
      uint64_t v37 = (uint64_t)v25;
      __int16 v38 = 2112;
      v39 = v26;
      __int16 v40 = 2112;
      v41 = v19;
      _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] zone is already resetting (zone:%@,appLibrary:%@) but adding (%@) for the next reset%@", buf, 0x2Au);
    }
    [*(id *)(a1 + 32) setStateBits:v7];
    *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
  }
  else
  {
    uint64_t v16 = *(void *)(a1 + 32);
    unint64_t v17 = *(void **)(v16 + 64);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_2;
    v27[3] = &unk_1E6996500;
    int v28 = v7;
    uint64_t v18 = *(void *)(a1 + 48);
    v27[4] = v16;
    v27[5] = v18;
    [v17 performWithFlags:16 action:v27];
  }
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "saveClientZoneToDB:");
  __brc_leave_section(v29);
}

uint64_t __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_2(uint64_t a1)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  [*(id *)(a1 + 32) setStateBits:*(unsigned int *)(a1 + 48)];
  [*(id *)(a1 + 32) clearSyncStateBits:15];
  uint64_t v2 = [*(id *)(a1 + 32) _cancelAllOperationsForReset];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  if ([*(id *)(a1 + 32) isPrivateZone])
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = objc_msgSend(*(id *)(a1 + 32), "asPrivateClientZone", 0);
    unsigned int v6 = [v5 appLibraries];

    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v19;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v6);
          }
          uint64_t v11 = *(void *)(*((void *)&v18 + 1) + 8 * v10);
          uint64_t v12 = [*(id *)(*(void *)(a1 + 32) + 8) stageRegistry];
          [v12 forgetWatchedLockedFileIDsForAppLibrary:v11];

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v28 count:16];
      }
      while (v8);
    }
  }
  uint64_t v13 = brc_bread_crumbs();
  v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = BRCClientZoneStatePrettyPrint(*(_DWORD *)(a1 + 48));
    uint64_t v17 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    dispatch_source_t v23 = v16;
    __int16 v24 = 2112;
    uint64_t v25 = v17;
    __int16 v26 = 2112;
    dispatch_time_t v27 = v13;
    _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] flushing reset state (%@) for container %@%@", buf, 0x20u);
  }
  return 1;
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_5(uint64_t a1)
{
  long long v6 = *(_OWORD *)(a1 + 56);
  uint64_t v7 = *(void *)(a1 + 72);
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_5_cold_1();
  }

  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 304);
  *(void *)(v4 + 304) = 0;

  objc_msgSend(*(id *)(a1 + 32), "_reset:completionHandler:", *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24), *(void *)(a1 + 40), v6, v7);
  __brc_leave_section((uint64_t *)&v6);
}

- (void)_reset:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  long long v6 = (void (**)(void))a4;
  uint64_t v7 = [(BRCAccountSession *)self->_session resetQueue];
  dispatch_assert_queue_V2(v7);

  if (self->_activated)
  {
    uint64_t v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v10 = [(BRCClientZone *)self mangledID];
      *(_DWORD *)buf = 138412802;
      dispatch_source_t v23 = v10;
      __int16 v24 = 2080;
      uint64_t v25 = BRCPrettyPrintEnum();
      __int16 v26 = 2112;
      dispatch_time_t v27 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[NOTICE] resetting %@: %s%@", buf, 0x20u);
    }
    switch(a3)
    {
      case 4uLL:
        v16[0] = MEMORY[0x1E4F143A8];
        v16[1] = 3221225472;
        v16[2] = __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke_3;
        v16[3] = &unk_1E6994600;
        v16[4] = self;
        uint64_t v17 = v6;
        [(BRCClientZone *)self _performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone:v16];
        uint64_t v11 = v17;
        goto LABEL_14;
      case 3uLL:
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke_2;
        uint64_t v18[3] = &unk_1E6994600;
        v18[4] = self;
        long long v19 = v6;
        [(BRCClientZone *)self _performAfterResetServerAndClientTruthsAndUnlinkData:v18];
        uint64_t v11 = v19;
        goto LABEL_14;
      case 2uLL:
        v20[0] = MEMORY[0x1E4F143A8];
        v20[1] = 3221225472;
        v20[2] = __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke;
        v20[3] = &unk_1E6994600;
        v20[4] = self;
        long long v21 = v6;
        [(BRCClientZone *)self _performResetAndWantsUnlink:0 clientTruthBlock:0 completionBlock:v20];
        uint64_t v11 = v21;
LABEL_14:

        goto LABEL_18;
    }
    v14 = brc_bread_crumbs();
    int64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone(BRCZoneReset) _reset:completionHandler:]();
    }
  }
  else
  {
    uint64_t v12 = brc_bread_crumbs();
    uint64_t v13 = brc_notifications_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone(BRCZoneReset) _reset:completionHandler:]();
    }

    if (v6) {
      v6[2](v6);
    }
  }
LABEL_18:
}

uint64_t __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedReset:2 completionHandler:*(void *)(a1 + 40)];
}

uint64_t __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedReset:3 completionHandler:*(void *)(a1 + 40)];
}

uint64_t __56__BRCClientZone_BRCZoneReset___reset_completionHandler___block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedReset:4 completionHandler:*(void *)(a1 + 40)];
}

- (void)_removeTargetedAliasesWithCompletionBlock:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAccountSession *)self->_session resetQueue];
  dispatch_assert_queue_V2(v5);
  long long v6 = objc_opt_new();
  uint64_t v7 = [(BRCClientZone *)self mangledID];
  uint64_t v8 = +[BRCUserDefaults defaultsForMangledID:v7];
  uint64_t v9 = [v8 aliasDeletionBatchSize];

  db = self->_db;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke;
  v20[3] = &unk_1E6994AB0;
  v20[4] = self;
  id v21 = v6;
  uint64_t v22 = v9;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke_8;
  v14[3] = &unk_1E6996578;
  id v15 = v21;
  uint64_t v16 = self;
  id v18 = v4;
  uint64_t v19 = v9;
  uint64_t v17 = v5;
  uint64_t v11 = v5;
  id v12 = v4;
  id v13 = v21;
  [(BRCPQLConnection *)db performWithFlags:25 action:v20 whenFlushed:v14];
}

uint64_t __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if ([*(id *)(a1 + 32) isPrivateZone])
  {
    id v29 = v3;
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v4 = [*(id *)(a1 + 32) asPrivateClientZone];
    id v5 = [v4 appLibraries];

    id obj = v5;
    uint64_t v32 = [v5 countByEnumeratingWithState:&v39 objects:v50 count:16];
    if (v32)
    {
      uint64_t v31 = *(void *)v40;
      do
      {
        uint64_t v6 = 0;
        do
        {
          if (*(void *)v40 != v31) {
            objc_enumerationMutation(obj);
          }
          uint64_t v33 = v6;
          uint64_t v7 = *(void **)(*((void *)&v39 + 1) + 8 * v6);
          long long v35 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          long long v38 = 0u;
          id v34 = [v7 liveAliasesEnumeratorTargetingThisAppLibrary];
          uint64_t v8 = [v34 countByEnumeratingWithState:&v35 objects:v49 count:16];
          if (v8)
          {
            uint64_t v9 = v8;
            uint64_t v10 = *(void *)v36;
            do
            {
              uint64_t v11 = 0;
              do
              {
                if (*(void *)v36 != v10) {
                  objc_enumerationMutation(v34);
                }
                id v12 = *(void **)(*((void *)&v35 + 1) + 8 * v11);
                id v13 = (void *)MEMORY[0x1D9438760]();
                v14 = [v12 clientZone];
                id v15 = [v12 itemID];
                uint64_t v16 = [v14 serverItemByItemID:v15];

                uint64_t v17 = [v12 st];
                id v18 = [v17 fileID];

                if (v18)
                {
                  uint64_t v19 = brc_bread_crumbs();
                  long long v20 = brc_default_log();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v44 = (uint64_t)v12;
                    __int16 v45 = 2112;
                    uint64_t v46 = v19;
                    _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] scheduling unlink of %@%@", buf, 0x16u);
                  }

                  id v21 = *(void **)(a1 + 40);
                  uint64_t v22 = [v12 st];
                  dispatch_source_t v23 = [v22 fileID];
                  [v21 addObject:v23];
                }
                else
                {
                  uint64_t v22 = brc_bread_crumbs();
                  dispatch_source_t v23 = brc_default_log();
                  if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v44 = (uint64_t)v12;
                    __int16 v45 = 2112;
                    uint64_t v46 = v22;
                    _os_log_fault_impl(&dword_1D353B000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: live doc with no fileid: %@%@", buf, 0x16u);
                  }
                }

                [v12 markNeedsDeleteForRescheduleOfItem:v16];
                [v12 saveToDB];

                ++v11;
              }
              while (v9 != v11);
              uint64_t v9 = [v34 countByEnumeratingWithState:&v35 objects:v49 count:16];
            }
            while (v9);
          }

          __int16 v24 = brc_bread_crumbs();
          uint64_t v25 = brc_default_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v26 = [*(id *)(a1 + 40) count];
            dispatch_time_t v27 = *(void **)(a1 + 48);
            *(_DWORD *)buf = 134218498;
            uint64_t v44 = v26;
            __int16 v45 = 2048;
            uint64_t v46 = v27;
            __int16 v47 = 2112;
            uint64_t v48 = v24;
            _os_log_debug_impl(&dword_1D353B000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] deleted %lu aliases for reschedule for container reset (batch size %llu)%@", buf, 0x20u);
          }

          uint64_t v6 = v33 + 1;
        }
        while (v33 + 1 != v32);
        uint64_t v32 = [obj countByEnumeratingWithState:&v39 objects:v50 count:16];
      }
      while (v32);
    }

    id v3 = v29;
  }

  return 1;
}

void __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke_8(uint64_t a1)
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v2 = *(id *)(a1 + 32);
  uint64_t v3 = [v2 countByEnumeratingWithState:&v40 objects:v48 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v41 != v5) {
          objc_enumerationMutation(v2);
        }
        uint64_t v7 = [*(id *)(*((void *)&v40 + 1) + 8 * i) longLongValue];
        uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 8) volume];
        int32_t v9 = [v8 deviceID];

        if ((BRCUnlinkFileID(v9, v7) & 0x80000000) != 0)
        {
          uint64_t v10 = brc_bread_crumbs();
          uint64_t v11 = brc_default_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
          {
            id v12 = __error();
            id v13 = strerror(*v12);
            *(_DWORD *)buf = 67109890;
            *(_DWORD *)__int16 v45 = v9;
            *(_WORD *)&v45[4] = 2048;
            *(void *)&v45[6] = v7;
            *(_WORD *)&v45[14] = 2080;
            *(void *)&v45[16] = v13;
            __int16 v46 = 2112;
            __int16 v47 = v10;
            _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to unlink dev:%d fileID:%llu: %s%@", buf, 0x26u);
          }
        }
      }
      uint64_t v4 = [v2 countByEnumeratingWithState:&v40 objects:v48 count:16];
    }
    while (v4);
  }

  if ((unint64_t)[*(id *)(a1 + 32) count] >= *(void *)(a1 + 64))
  {
    uint64_t v14 = *(void *)(a1 + 40);
    if (*(void *)(v14 + 304))
    {
      id v34 = brc_bread_crumbs();
      long long v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
        __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke_8_cold_2();
      }

      uint64_t v14 = *(void *)(a1 + 40);
    }
    id v15 = [*(id *)(v14 + 8) appLibraryAliasRemovalThrottle];
    uint64_t v16 = [*(id *)(a1 + 40) zoneName];
    int64_t v17 = +[BRCThrottle throttleHashFormat:@"%@", v16];

    unint64_t v18 = [v15 nsecsToNextRetry:v17 now:brc_current_date_nsec() increment:1];
    [v15 incrementRetryCount:v17];
    if (v18 >= 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v31 = brc_bread_crumbs();
      uint64_t v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v33 = *(void *)(a1 + 40);
        *(_DWORD *)buf = 138412546;
        *(void *)__int16 v45 = v33;
        *(_WORD *)&v45[8] = 2112;
        *(void *)&v45[10] = v31;
        _os_log_impl(&dword_1D353B000, v32, OS_LOG_TYPE_DEFAULT, "[WARNING] giving up on resetting %@%@", buf, 0x16u);
      }
    }
    else
    {
      if (v18 <= 0xF4240) {
        unint64_t v18 = 1000000;
      }
      if (*(void *)(*(void *)(a1 + 40) + 304))
      {
        long long v36 = brc_bread_crumbs();
        long long v37 = brc_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_FAULT)) {
          __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_cold_1();
        }
      }
      dispatch_source_t v19 = dispatch_source_create(MEMORY[0x1E4F14490], 0, 0, *(dispatch_queue_t *)(a1 + 48));
      uint64_t v20 = *(void *)(a1 + 40);
      id v21 = *(void **)(v20 + 304);
      *(void *)(v20 + 304) = v19;

      uint64_t v22 = *(NSObject **)(*(void *)(a1 + 40) + 304);
      dispatch_time_t v23 = dispatch_time(0, v18);
      dispatch_source_set_timer(v22, v23, 0xFFFFFFFFFFFFFFFFLL, 0);
      uint64_t v24 = *(void *)(a1 + 40);
      uint64_t v25 = *(void **)(v24 + 304);
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke_12;
      v38[3] = &unk_1E6994600;
      v38[4] = v24;
      id v39 = *(id *)(a1 + 56);
      uint64_t v26 = v25;
      dispatch_time_t v27 = v38;
      uint64_t v28 = v27;
      id v29 = v27;
      if (*MEMORY[0x1E4F59658])
      {
        id v29 = ((void (*)(void *))*MEMORY[0x1E4F59658])(v27);
      }
      dispatch_block_t v30 = dispatch_block_create_with_qos_class(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, QOS_CLASS_UTILITY, 0, v29);
      dispatch_source_set_event_handler(v26, v30);

      dispatch_resume(*(dispatch_object_t *)(*(void *)(a1 + 40) + 304));
    }
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

uint64_t __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke_12(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  uint64_t v3 = *(void **)(v2 + 304);
  *(void *)(v2 + 304) = 0;

  uint64_t v4 = *(void **)(a1 + 32);
  uint64_t v5 = *(void *)(a1 + 40);
  return [v4 _removeTargetedAliasesWithCompletionBlock:v5];
}

- (void)_resetAndDeleteServerTruthData
{
  uint64_t v3 = self->_session;
  uint64_t v4 = [(BRCServerZone *)self->_serverZone db];
  uint64_t v5 = [v4 serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __61__BRCClientZone_BRCZoneReset___resetAndDeleteServerTruthData__block_invoke;
  v7[3] = &unk_1E6993628;
  v7[4] = self;
  uint64_t v8 = v3;
  uint64_t v6 = v3;
  dispatch_sync(v5, v7);
}

void __61__BRCClientZone_BRCZoneReset___resetAndDeleteServerTruthData__block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __61__BRCClientZone_BRCZoneReset___resetAndDeleteServerTruthData__block_invoke_cold_1();
  }

  [*(id *)(*(void *)(a1 + 32) + 16) resetServerTruth];
  uint64_t v4 = [*(id *)(a1 + 40) stageRegistry];
  [v4 removeDatabaseObjectsForZone:*(void *)(*(void *)(a1 + 32) + 16)];
}

- (void)_deleteJobsMatchingServerZone
{
  uint64_t v3 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsReader];
  [v3 deleteJobsMatching:self->_serverZone];

  uint64_t v4 = [(BRCAccountSession *)self->_session applyScheduler];
  [v4 deleteNonRejectionJobsForZone:self->_serverZone];

  uint64_t v5 = [(BRCAccountSession *)self->_session fsUploader];
  [v5 deleteJobsMatching:self->_serverZone];

  uint64_t v6 = [(BRCAccountSession *)self->_session fsDownloader];
  [v6 deleteJobsMatching:self->_serverZone];

  id v7 = [(BRCAccountSession *)self->_session syncUpScheduler];
  [v7 deleteJobsMatching:self->_serverZone];
}

- (void)_handleSoftResetOfLocalItem:(id)a3 wantsUnlink:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [v5 resetWhileKeepingClientItemsAndWantsUnlink:v4];
  int v6 = [v5 isFault];
  if ((v4 || v6)
    && ([v5 itemID],
        id v7 = objc_claimAutoreleasedReturnValue(),
        char v8 = [v7 isDocumentsFolder],
        v7,
        (v8 & 1) == 0))
  {
    [v5 markForceRejected];
    if ([v5 isSharedToMeTopLevelItem]
      && [v5 isDead]
      && ([v5 localDiffs] & 8) != 0)
    {
      int32_t v9 = brc_bread_crumbs();
      uint64_t v10 = brc_default_log();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412546;
        id v13 = v5;
        __int16 v14 = 2112;
        id v15 = v9;
        _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Found a top level item that still needs to delete its alias %@.  Inserting a tombstone%@", (uint8_t *)&v12, 0x16u);
      }

      uint64_t v11 = [v5 asSharedToMeTopLevelItem];
      [v11 insertTombstoneAliasRecordInZone:0];
    }
  }
  else
  {
    if ([v5 isLive]) {
      [v5 markLostClearGenerationID:0 backoffMode:0];
    }
    [v5 markForceNeedsSyncUp];
  }
  [v5 saveToDB];
}

- (void)_performSoftResetOnItems:(id)a3 wantsUnlink:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_opt_new();
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v16;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v15 + 1) + 8 * v12);
        __int16 v14 = (void *)MEMORY[0x1D9438760](v9);
        if ((objc_msgSend(v7, "containsIndex:", objc_msgSend(v13, "dbRowID", (void)v15)) & 1) == 0)
        {
          objc_msgSend(v7, "addIndex:", objc_msgSend(v13, "dbRowID"));
          [(BRCClientZone *)self _handleSoftResetOfLocalItem:v13 wantsUnlink:v4];
        }
        ++v12;
      }
      while (v10 != v12);
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      uint64_t v10 = v9;
    }
    while (v9);
  }
}

- (void)_postSoftResetHandlingAndWantsUnlink:(BOOL)a3 completionBlock:(id)a4
{
  BOOL v4 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = [(BRCAccountSession *)self->_session resetQueue];
  if (v4)
  {
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = __84__BRCClientZone_BRCZoneReset___postSoftResetHandlingAndWantsUnlink_completionBlock___block_invoke;
    v8[3] = &unk_1E6994600;
    v8[4] = self;
    uint64_t v9 = v6;
    dispatch_async_with_logs_5(v7, v8);
  }
  else
  {
    v6[2](v6);
  }
}

uint64_t __84__BRCClientZone_BRCZoneReset___postSoftResetHandlingAndWantsUnlink_completionBlock___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeTargetedAliasesWithCompletionBlock:*(void *)(a1 + 40)];
}

- (BOOL)_deleteRelevantPackageItemsWithDB:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  char v7 = [v6 executeWithSlowStatementRadar:@"<rdar://problem/23829401>", @"DELETE FROM client_pkg_items WHERE item_doc_id IN (SELECT item_doc_id FROM client_items WHERE zone_rowid = %@ AND +item_type = 1 AND  HEX(SUBSTR(version_content_signature, 1, 1)) = '1B')", self->_dbRowID sql];
  if ((v7 & 1) == 0)
  {
    id v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, (os_log_type_t)0x90u)) {
      -[BRCClientZone(BRCZoneReset) _deleteRelevantPackageItemsWithDB:error:]();
    }

    uint64_t v10 = [v6 lastError];
    if (v10)
    {
      uint64_t v11 = brc_bread_crumbs();
      uint64_t v12 = brc_default_log();
      if (os_log_type_enabled(v12, (os_log_type_t)0x90u))
      {
        __int16 v14 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        long long v16 = "-[BRCClientZone(BRCZoneReset) _deleteRelevantPackageItemsWithDB:error:]";
        __int16 v17 = 2080;
        if (!a4) {
          __int16 v14 = "(ignored by caller)";
        }
        long long v18 = v14;
        __int16 v19 = 2112;
        uint64_t v20 = v10;
        __int16 v21 = 2112;
        uint64_t v22 = v11;
        _os_log_error_impl(&dword_1D353B000, v12, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a4) {
      *a4 = v10;
    }
  }
  return v7;
}

- (BOOL)_performHardResetOnClientItemsAndWantsUnlink:(BOOL)a3 db:(id)a4 error:(id *)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  if (![(BRCClientZone *)self _deleteRelevantPackageItemsWithDB:v7 error:a5])
  {
LABEL_20:
    BOOL v8 = 0;
    goto LABEL_21;
  }
  if (([v7 execute:@"DELETE FROM client_items WHERE zone_rowid = %@", self->_dbRowID] & 1) == 0)
  {
    uint64_t v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, (os_log_type_t)0x90u)) {
      -[BRCClientZone(BRCZoneReset) _performHardResetOnClientItemsAndWantsUnlink:db:error:]();
    }

    id v11 = [v7 lastError];
    if (!v11) {
      goto LABEL_17;
    }
    uint64_t v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (!os_log_type_enabled(v13, (os_log_type_t)0x90u)) {
      goto LABEL_16;
    }
    __int16 v14 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    __int16 v19 = "-[BRCClientZone(BRCZoneReset) _performHardResetOnClientItemsAndWantsUnlink:db:error:]";
    __int16 v20 = 2080;
    if (!a5) {
      __int16 v14 = "(ignored by caller)";
    }
    goto LABEL_24;
  }
  if (([v7 executeWithSlowStatementRadar:@"<rdar://problem//26848061>", @"DELETE FROM client_document_access WHERE item_rowid in (SELECT rowid FROM client_items WHERE zone_rowid = %@)", self->_dbRowID sql] & 1) == 0)
  {
    long long v15 = brc_bread_crumbs();
    long long v16 = brc_default_log();
    if (os_log_type_enabled(v16, (os_log_type_t)0x90u)) {
      -[BRCClientZone(BRCZoneReset) _performHardResetOnClientItemsAndWantsUnlink:db:error:]();
    }

    id v11 = [v7 lastError];
    if (!v11) {
      goto LABEL_17;
    }
    uint64_t v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (!os_log_type_enabled(v13, (os_log_type_t)0x90u))
    {
LABEL_16:

LABEL_17:
      if (a5)
      {
        id v11 = v11;
        *a5 = v11;
      }

      goto LABEL_20;
    }
    __int16 v14 = "(passed to caller)";
    *(_DWORD *)buf = 136315906;
    __int16 v19 = "-[BRCClientZone(BRCZoneReset) _performHardResetOnClientItemsAndWantsUnlink:db:error:]";
    __int16 v20 = 2080;
    if (!a5) {
      __int16 v14 = "(ignored by caller)";
    }
LABEL_24:
    __int16 v21 = v14;
    __int16 v22 = 2112;
    id v23 = v11;
    __int16 v24 = 2112;
    uint64_t v25 = v12;
    _os_log_error_impl(&dword_1D353B000, v13, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    goto LABEL_16;
  }
  BOOL v8 = 1;
LABEL_21:

  return v8;
}

- (BOOL)_postHardResetHandlingWithDB:(id)a3 completionBlock:(id)a4 error:(id *)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (![(BRCClientZone *)self isPrivateZone])
  {
LABEL_14:
    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    __int16 v21 = [(BRCClientZone *)self itemsParentedToThisZoneButLivingInAnOtherZone];
    uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v40 != v24) {
            objc_enumerationMutation(v21);
          }
          uint64_t v26 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          dispatch_time_t v27 = (void *)MEMORY[0x1D9438760]();
          uint64_t v28 = [v26 appLibrary];
          [v28 clearStateBits:0x40000];

          if ([v26 isLive])
          {
            [v26 markLostClearGenerationID:0 backoffMode:0];
            [v26 saveToDB];
          }
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v39 objects:v47 count:16];
      }
      while (v23);
    }

    id v29 = [(BRCAccountSession *)self->_session resetQueue];
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __82__BRCClientZone_BRCZoneReset___postHardResetHandlingWithDB_completionBlock_error___block_invoke;
    v37[3] = &unk_1E6994600;
    v37[4] = self;
    id v38 = v9;
    dispatch_async_with_logs_5(v29, v37);

    if ([(BRCClientZone *)self isPrivateZone])
    {
      dispatch_block_t v30 = [(BRCClientZone *)self asPrivateClientZone];
      [v30 clearProblemReport];
    }
    BOOL v31 = 1;
    goto LABEL_32;
  }
  uint64_t v10 = [(BRCClientZone *)self asPrivateClientZone];
  id v11 = [v10 defaultAppLibrary];
  uint64_t v12 = [v11 documentsFolderItemID];
  id v13 = [(BRCClientZone *)self dbRowID];
  char v14 = [v8 executeWithSlowStatementRadar:@"<rdar://problem//26848061>", @"UPDATE client_items SET item_parent_id = %@ WHERE item_parent_zone_rowid != zone_rowid AND item_parent_zone_rowid = %@", v12, v13 sql];

  if (v14)
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    long long v15 = [v10 appLibraries];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v43 objects:v48 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v44;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v44 != v18) {
            objc_enumerationMutation(v15);
          }
          __int16 v20 = *(void **)(*((void *)&v43 + 1) + 8 * j);
          [v20 setStateBits:1310720];
          [v20 clearStateBits:4];
          [(BRCAccountSession *)self->_session saveAppLibraryToDB:v20];
          if ([v20 includesDataScope]) {
            [v20 recreateDocumentsFolderIfNeededOnDisk];
          }
          else {
            [(BRCClientZone *)self _mkdirAppLibraryIfNeeded:v20];
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v43 objects:v48 count:16];
      }
      while (v17);
    }

    goto LABEL_14;
  }
  uint64_t v32 = [v8 lastError];
  if (v32)
  {
    uint64_t v33 = brc_bread_crumbs();
    id v34 = brc_default_log();
    if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
    {
      long long v36 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      uint64_t v50 = "-[BRCClientZone(BRCZoneReset) _postHardResetHandlingWithDB:completionBlock:error:]";
      __int16 v51 = 2080;
      if (!a5) {
        long long v36 = "(ignored by caller)";
      }
      long long v52 = v36;
      __int16 v53 = 2112;
      long long v54 = v32;
      __int16 v55 = 2112;
      uint64_t v56 = v33;
      _os_log_error_impl(&dword_1D353B000, v34, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (a5) {
    *a5 = v32;
  }

  BOOL v31 = 0;
LABEL_32:

  return v31;
}

uint64_t __82__BRCClientZone_BRCZoneReset___postHardResetHandlingWithDB_completionBlock_error___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _removeTargetedAliasesWithCompletionBlock:*(void *)(a1 + 40)];
}

- (void)_performResetAndWantsUnlink:(BOOL)a3 clientTruthBlock:(id)a4 completionBlock:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = self->_session;
  id v11 = [(BRCAccountSession *)v10 resetQueue];
  dispatch_assert_queue_V2(v11);
  if (v6 && ![(BRCClientZone *)self isSharedZone])
  {
    long long v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone(BRCZoneReset) _performResetAndWantsUnlink:clientTruthBlock:completionBlock:]();
    }
  }
  [(BRCClientZone *)self _resetAndDeleteServerTruthData];
  uint64_t v12 = [(BRCPQLConnection *)self->_db serialQueue];
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke;
  v17[3] = &unk_1E69965C8;
  v17[4] = self;
  id v18 = v8;
  BOOL v20 = v6;
  id v19 = v9;
  id v13 = v9;
  id v14 = v8;
  dispatch_sync(v12, v17);
}

void __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void **)(*(void *)(a1 + 32) + 64);
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2;
  v4[3] = &unk_1E69965A0;
  id v3 = *(id *)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  char v7 = *(unsigned char *)(a1 + 56);
  id v6 = *(id *)(a1 + 48);
  [v2 performWithFlags:46 action:v4];
}

uint64_t __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 40);
  if (v4) {
    (*(void (**)(void))(v4 + 16))();
  }
  [*(id *)(a1 + 32) _deleteJobsMatchingServerZone];
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_4();
  }

  if ([*(id *)(a1 + 32) supportsKeepingClientItemsDuringReset])
  {
    char v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_1();
    }

    id v9 = *(void **)(a1 + 32);
    uint64_t v10 = [v9 _getRelevantClientTruthItemEnumerator];
    [v9 _performSoftResetOnItems:v10 wantsUnlink:*(unsigned __int8 *)(a1 + 56)];

    [*(id *)(a1 + 32) _postSoftResetHandlingAndWantsUnlink:*(unsigned __int8 *)(a1 + 56) completionBlock:*(void *)(a1 + 48)];
    goto LABEL_12;
  }
  id v11 = *(void **)(a1 + 32);
  uint64_t v12 = *(unsigned __int8 *)(a1 + 56);
  id v24 = 0;
  char v13 = [v11 _performHardResetOnClientItemsAndWantsUnlink:v12 db:v3 error:&v24];
  id v14 = v24;
  if ((v13 & 1) == 0)
  {
    BOOL v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
      __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_3((uint64_t)v14);
    }
    goto LABEL_18;
  }
  long long v15 = *(void **)(a1 + 32);
  uint64_t v16 = *(void *)(a1 + 48);
  id v23 = v14;
  char v17 = [v15 _postHardResetHandlingWithDB:v3 completionBlock:v16 error:&v23];
  id v18 = v23;

  if ((v17 & 1) == 0)
  {
    BOOL v20 = brc_bread_crumbs();
    __int16 v21 = brc_default_log();
    if (os_log_type_enabled(v21, (os_log_type_t)0x90u)) {
      __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_2((uint64_t)v18);
    }
    id v14 = v18;
LABEL_18:

    uint64_t v19 = 0;
    goto LABEL_19;
  }

LABEL_12:
  uint64_t v19 = 1;
LABEL_19:

  return v19;
}

- (void)_performAfterResetServerAndClientPrivateTruthsAndUnlinkData:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  uint64_t v4 = [(BRCAccountSession *)self->_session resetQueue];
  dispatch_assert_queue_V2(v4);
  id v5 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
  id v32 = objc_alloc_init(MEMORY[0x1E4F28F08]);
  uint64_t v33 = v4;
  [v32 setUnderlyingQueue:v4];
  id v29 = v5;
  [v5 setPurposeIdentifier:@"com.apple.bird"];
  id v34 = objc_opt_new();
  if ([(BRCClientZone *)self isPrivateZone])
  {
    id v6 = [(BRCClientZone *)self asPrivateClientZone];
    char v7 = [v6 appLibraries];
    id v8 = [v7 allObjects];
  }
  else
  {
    id v8 = (void *)MEMORY[0x1E4F1CBF0];
  }
  BOOL v31 = self;
  if ([(BRCClientZone *)self isPrivateZone])
  {
    id v9 = [(BRCClientZone *)self asPrivateClientZone];
    uint64_t v28 = [v9 appLibraryIDs];
  }
  else
  {
    uint64_t v28 = [MEMORY[0x1E4F1CAD0] set];
  }
  long long v47 = 0u;
  long long v48 = 0u;
  long long v46 = 0u;
  long long v45 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
  uint64_t v12 = v34;
  if (v11)
  {
    uint64_t v13 = v11;
    uint64_t v14 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v46 != v14) {
          objc_enumerationMutation(v10);
        }
        uint64_t v16 = *(void **)(*((void *)&v45 + 1) + 8 * i);
        char v17 = [v16 url];
        if (v17)
        {
          id v18 = [MEMORY[0x1E4F28C98] writingIntentWithURL:v17 options:1];
          [v12 addObject:v18];
          uint64_t v19 = brc_bread_crumbs();
          BOOL v20 = brc_default_log();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
          {
            __int16 v21 = [v17 path];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v21;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v19;
            _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] requesting coordinated deletion at '%@'%@", buf, 0x16u);

            uint64_t v12 = v34;
          }
        }
        else
        {
          id v18 = brc_bread_crumbs();
          uint64_t v19 = brc_default_log();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v16;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v18;
            _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] Ignoring delete of app library with no URL %@%@", buf, 0x16u);
          }
        }
      }
      uint64_t v13 = [v10 countByEnumeratingWithState:&v45 objects:v50 count:16];
    }
    while (v13);
  }

  long long v43 = 0uLL;
  uint64_t v44 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCClientZone(BRCZoneReset) _performAfterResetServerAndClientPrivateTruthsAndUnlinkData:]", 629, &v43);
  uint64_t v22 = brc_bread_crumbs();
  id v23 = brc_default_log();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
    -[BRCClientZone(BRCZoneReset) _performAfterResetServerAndClientPrivateTruthsAndUnlinkData:]();
  }

  *(void *)&buf[16] = v44;
  *(_OWORD *)buf = v43;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke;
  v35[3] = &unk_1E6996640;
  long long v41 = v43;
  uint64_t v42 = v44;
  id v36 = v29;
  long long v37 = v31;
  id v38 = v34;
  id v39 = v28;
  id v40 = v30;
  id v24 = v30;
  id v25 = v28;
  id v26 = v34;
  id v27 = v29;
  [v27 coordinateAccessWithIntents:v26 queue:v32 byAccessor:v35];
}

void __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v19 = *(_OWORD *)(a1 + 72);
  uint64_t v20 = *(void *)(a1 + 88);
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_cold_2();
  }

  if (v3)
  {
    brc_bread_crumbs();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    char v7 = brc_default_log();
    if (os_log_type_enabled(v7, (os_log_type_t)0x90u)) {
      __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_cold_1((uint64_t)v3);
    }
  }
  else
  {
    id v8 = [*(id *)(a1 + 32) retainAccess];
    id v9 = *(id *)(*(void *)(a1 + 40) + 8);
    id v10 = *(void **)(a1 + 40);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_45;
    v11[3] = &unk_1E6996618;
    v11[4] = v10;
    id v12 = *(id *)(a1 + 48);
    char v7 = v9;
    uint64_t v13 = v7;
    id v14 = *(id *)(a1 + 56);
    long long v17 = *(_OWORD *)(a1 + 72);
    uint64_t v18 = *(void *)(a1 + 88);
    id v15 = *(id *)(a1 + 32);
    id v6 = v8;
    id v16 = v6;
    [v10 _performResetAndWantsUnlink:0 clientTruthBlock:v11 completionBlock:*(void *)(a1 + 64)];
  }
  __brc_leave_section((uint64_t *)&v19);
}

void __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_45(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_45_cold_1();
  }

  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v4 = *(id *)(a1 + 40);
  uint64_t v5 = [v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v32;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v32 != v7) {
          objc_enumerationMutation(v4);
        }
        id v9 = *(void **)(*((void *)&v31 + 1) + 8 * v8);
        id v10 = [*(id *)(a1 + 48) diskReclaimer];
        uint64_t v11 = [v9 URL];
        id v12 = [v11 path];
        [v10 renameAndUnlinkInBackgroundItemAt:0xFFFFFFFFLL path:v12];

        ++v8;
      }
      while (v6 != v8);
      uint64_t v6 = [v4 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v6);
  }

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v13 = *(id *)(a1 + 40);
  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v28;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = (void *)MEMORY[0x1E4F28CA0];
        long long v19 = [*(id *)(*((void *)&v27 + 1) + 8 * v17) URL];
        objc_msgSend(v18, "__itemAtURL:didDisappearWithPurposeID:", v19, @"com.apple.bird");

        ++v17;
      }
      while (v15 != v17);
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v15);
  }

  uint64_t v20 = [*(id *)(a1 + 48) notificationManager];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_46;
  v22[3] = &unk_1E69965F0;
  long long v25 = *(_OWORD *)(a1 + 80);
  uint64_t v26 = *(void *)(a1 + 96);
  v22[4] = *(void *)(a1 + 32);
  uint64_t v21 = *(void *)(a1 + 56);
  id v23 = *(id *)(a1 + 64);
  id v24 = *(id *)(a1 + 72);
  [v20 invalidatePipeReceiversWatchingAppLibraryIDs:v21 completionBlock:v22];
}

void __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_46(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)(a1 + 56);
  uint64_t v6 = *(void *)(a1 + 72);
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    id v12 = v2;
    _os_log_debug_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx disconnected NSMDQ listeners for %@%@", buf, 0x20u);
  }

  [*(id *)(a1 + 40) releaseAccess:*(void *)(a1 + 48)];
  __brc_leave_section((uint64_t *)&v5);
}

- (void)_performAfterResetServerAndClientSharedTruthsAndUnlinkData:(id)a3
{
  id v4 = a3;
  if (![(BRCClientZone *)self isSharedZone])
  {
    long long v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone(BRCZoneReset) _performResetAndWantsUnlink:clientTruthBlock:completionBlock:]();
    }
  }
  [(BRCClientZone *)self _performResetAndWantsUnlink:1 clientTruthBlock:0 completionBlock:v4];
}

- (void)_performAfterResetServerAndClientTruthsAndUnlinkData:(id)a3
{
  id v4 = a3;
  if ([(BRCClientZone *)self isSharedZone]) {
    [(BRCClientZone *)self _performAfterResetServerAndClientSharedTruthsAndUnlinkData:v4];
  }
  else {
    [(BRCClientZone *)self _performAfterResetServerAndClientPrivateTruthsAndUnlinkData:v4];
  }
}

- (void)_performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke;
  v6[3] = &unk_1E6994600;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(BRCClientZone *)self _performAfterResetServerAndClientTruthsAndUnlinkData:v6];
}

void __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 64) assertOnQueue];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) resetQueue];
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_2;
  v4[3] = &unk_1E6994600;
  id v3 = *(void **)(a1 + 40);
  v4[4] = *(void *)(a1 + 32);
  id v5 = v3;
  dispatch_async_with_logs_5(v2, v4);
}

void __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_2(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  uint64_t v2 = *(void **)(v1 + 16);
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_3;
  v3[3] = &unk_1E6994600;
  v3[4] = v1;
  id v4 = *(id *)(a1 + 40);
  [v2 deleteAllContentsOnServerWithCompletionBlock:v3];
}

void __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_3(uint64_t a1)
{
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 64) serialQueue];
  dispatch_assert_queue_not_V2(v2);

  id v3 = [*(id *)(*(void *)(a1 + 32) + 64) serialQueue];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_4;
  v5[3] = &unk_1E6994600;
  id v4 = *(void **)(a1 + 40);
  v5[4] = *(void *)(a1 + 32);
  id v6 = v4;
  dispatch_async_with_logs_5(v3, v5);
}

void __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_4(uint64_t a1)
{
  uint64_t v1 = *(void **)(*(void *)(a1 + 32) + 64);
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_5;
  v2[3] = &unk_1E6996668;
  id v3 = *(id *)(a1 + 40);
  [v1 performWithFlags:8 action:v2];
}

uint64_t __99__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientTruthsAndUnlinkDataAndPurgeTheZone___block_invoke_5(uint64_t a1)
{
  return 1;
}

- (id)_cancelAllOperationsForReset
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v3 = objc_opt_new();
  v87 = self;
  if ([(BRCClientZone *)self isSharedZone])
  {
    id v4 = [(BRCClientZone *)self serverZone];
    id v5 = [v4 asSharedZone];
    id v6 = [v5 transferSyncContext];

    id v7 = [v6 uploadStream];
    uint64_t v8 = [v7 operations];
    [v3 addObjectsFromArray:v8];

    __int16 v9 = [v6 downloadStream];
    uint64_t v10 = [v9 operations];
    [v3 addObjectsFromArray:v10];
  }
  else
  {
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    __int16 v11 = [(BRCClientZone *)self asPrivateClientZone];
    id v6 = [v11 appLibraries];

    uint64_t v12 = [v6 countByEnumeratingWithState:&v112 objects:v126 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v113;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v113 != v14) {
            objc_enumerationMutation(v6);
          }
          uint64_t v16 = [*(id *)(*((void *)&v112 + 1) + 8 * i) transferSyncContext];
          uint64_t v17 = [v16 uploadStream];
          uint64_t v18 = [v17 operations];
          [v3 addObjectsFromArray:v18];

          long long v19 = [v16 downloadStream];
          uint64_t v20 = [v19 operations];
          [v3 addObjectsFromArray:v20];
        }
        uint64_t v13 = [v6 countByEnumeratingWithState:&v112 objects:v126 count:16];
      }
      while (v13);
    }
  }

  long long v110 = 0u;
  long long v111 = 0u;
  long long v108 = 0u;
  long long v109 = 0u;
  id v21 = v3;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v108 objects:v125 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v109;
    do
    {
      for (uint64_t j = 0; j != v23; ++j)
      {
        if (*(void *)v109 != v24) {
          objc_enumerationMutation(v21);
        }
        uint64_t v26 = *(BRCFetchRecentAndFavoriteDocumentsOperation **)(*((void *)&v108 + 1) + 8 * j);
        long long v27 = brc_bread_crumbs();
        long long v28 = brc_default_log();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v26;
          __int16 v123 = 2112;
          v124 = v27;
          _os_log_debug_impl(&dword_1D353B000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling operation %@%@", buf, 0x16u);
        }

        [(_BRCOperation *)v26 cancel];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v108 objects:v125 count:16];
    }
    while (v23);
  }

  long long v29 = v87->_syncUpOperation;
  if (v29)
  {
    long long v30 = brc_bread_crumbs();
    long long v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone(BRCZoneReset) _cancelAllOperationsForReset]((uint64_t)v29);
    }

    [v21 addObject:v29];
    [(_BRCOperation *)v29 cancel];
  }
  syncUpOperation = v87->_syncUpOperation;
  v87->_syncUpOperation = 0;

  lastSyncUpError = v87->_lastSyncUpError;
  v87->_lastSyncUpError = 0;

  long long v34 = v87->_syncDownOperation;
  if (v34)
  {
    long long v35 = brc_bread_crumbs();
    id v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone(BRCZoneReset) _cancelAllOperationsForReset]((uint64_t)v34);
    }

    [v21 addObject:v34];
    [(_BRCOperation *)v34 cancel];
  }
  syncDownOperation = v87->_syncDownOperation;
  v87->_syncDownOperation = 0;

  lastSyncDownError = v87->_lastSyncDownError;
  v87->_lastSyncDownError = 0;

  id v39 = v87->_fetchRecentsOperation;
  if (v39)
  {
    id v40 = brc_bread_crumbs();
    long long v41 = brc_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone(BRCZoneReset) _cancelAllOperationsForReset]((uint64_t)v39);
    }

    [v21 addObject:v39];
    [(_BRCOperation *)v39 cancel];
  }
  fetchRecentsOperation = v87->_fetchRecentsOperation;
  v87->_fetchRecentsOperation = 0;

  long long v106 = 0u;
  long long v107 = 0u;
  long long v104 = 0u;
  long long v105 = 0u;
  long long v43 = [(NSMutableDictionary *)v87->_locateRecordOperations allValues];
  uint64_t v44 = [v43 countByEnumeratingWithState:&v104 objects:v120 count:16];
  if (v44)
  {
    uint64_t v45 = v44;
    uint64_t v46 = *(void *)v105;
    do
    {
      uint64_t v47 = 0;
      long long v48 = v39;
      do
      {
        if (*(void *)v105 != v46) {
          objc_enumerationMutation(v43);
        }
        id v39 = (BRCFetchRecentAndFavoriteDocumentsOperation *)*(id *)(*((void *)&v104 + 1) + 8 * v47);

        uint64_t v49 = brc_bread_crumbs();
        uint64_t v50 = brc_default_log();
        if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v39;
          __int16 v123 = 2112;
          v124 = v49;
          _os_log_debug_impl(&dword_1D353B000, v50, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling operation %@%@", buf, 0x16u);
        }

        [v21 addObject:v39];
        [(_BRCOperation *)v39 cancel];
        ++v47;
        long long v48 = v39;
      }
      while (v45 != v47);
      uint64_t v45 = [v43 countByEnumeratingWithState:&v104 objects:v120 count:16];
    }
    while (v45);
  }

  p_isa = (id *)&v87->super.isa;
  [(NSMutableDictionary *)v87->_locateRecordOperations removeAllObjects];
  long long v102 = 0u;
  long long v103 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  long long v52 = [(NSMutableDictionary *)v87->_fetchParentOperations allValues];
  uint64_t v53 = [v52 countByEnumeratingWithState:&v100 objects:v119 count:16];
  if (v53)
  {
    uint64_t v54 = v53;
    __int16 v55 = 0;
    uint64_t v56 = *(void *)v101;
    do
    {
      uint64_t v57 = 0;
      uint64_t v58 = v55;
      do
      {
        if (*(void *)v101 != v56) {
          objc_enumerationMutation(v52);
        }
        __int16 v55 = (BRCFetchRecentAndFavoriteDocumentsOperation *)*(id *)(*((void *)&v100 + 1) + 8 * v57);

        v59 = brc_bread_crumbs();
        v60 = brc_default_log();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v55;
          __int16 v123 = 2112;
          v124 = v59;
          _os_log_debug_impl(&dword_1D353B000, v60, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling operation %@%@", buf, 0x16u);
        }

        [v21 addObject:v55];
        [(_BRCOperation *)v55 cancel];
        ++v57;
        uint64_t v58 = v55;
      }
      while (v54 != v57);
      uint64_t v54 = [v52 countByEnumeratingWithState:&v100 objects:v119 count:16];
    }
    while (v54);

    p_isa = (id *)&v87->super.isa;
  }

  [p_isa[27] removeAllObjects];
  long long v98 = 0u;
  long long v99 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id v61 = [p_isa[26] allValues];
  uint64_t v62 = [v61 countByEnumeratingWithState:&v96 objects:v118 count:16];
  if (v62)
  {
    uint64_t v63 = v62;
    uint64_t v64 = 0;
    uint64_t v65 = *(void *)v97;
    do
    {
      uint64_t v66 = 0;
      uint64_t v67 = v64;
      do
      {
        if (*(void *)v97 != v65) {
          objc_enumerationMutation(v61);
        }
        uint64_t v64 = (BRCFetchRecentAndFavoriteDocumentsOperation *)*(id *)(*((void *)&v96 + 1) + 8 * v66);

        __int16 v68 = brc_bread_crumbs();
        v69 = brc_default_log();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v64;
          __int16 v123 = 2112;
          v124 = v68;
          _os_log_debug_impl(&dword_1D353B000, v69, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling operation %@%@", buf, 0x16u);
        }

        [v21 addObject:v64];
        [(_BRCOperation *)v64 cancel];
        ++v66;
        uint64_t v67 = v64;
      }
      while (v63 != v66);
      uint64_t v63 = [v61 countByEnumeratingWithState:&v96 objects:v118 count:16];
    }
    while (v63);

    p_isa = (id *)&v87->super.isa;
  }

  [p_isa[26] removeAllObjects];
  long long v94 = 0u;
  long long v95 = 0u;
  long long v92 = 0u;
  long long v93 = 0u;
  __int16 v70 = [p_isa[25] allValues];
  uint64_t v71 = [v70 countByEnumeratingWithState:&v92 objects:v117 count:16];
  if (v71)
  {
    uint64_t v72 = v71;
    v73 = 0;
    uint64_t v74 = *(void *)v93;
    do
    {
      uint64_t v75 = 0;
      uint64_t v76 = v73;
      do
      {
        if (*(void *)v93 != v74) {
          objc_enumerationMutation(v70);
        }
        v73 = (BRCFetchRecentAndFavoriteDocumentsOperation *)*(id *)(*((void *)&v92 + 1) + 8 * v75);

        v77 = brc_bread_crumbs();
        v78 = brc_default_log();
        if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          v122 = v73;
          __int16 v123 = 2112;
          v124 = v77;
          _os_log_debug_impl(&dword_1D353B000, v78, OS_LOG_TYPE_DEBUG, "[DEBUG] Cancelling operation %@%@", buf, 0x16u);
        }

        [v21 addObject:v73];
        [(_BRCOperation *)v73 cancel];
        ++v75;
        uint64_t v76 = v73;
      }
      while (v72 != v75);
      uint64_t v72 = [v70 countByEnumeratingWithState:&v92 objects:v117 count:16];
    }
    while (v72);

    p_isa = (id *)&v87->super.isa;
  }

  [p_isa[25] removeAllObjects];
  long long v90 = 0u;
  long long v91 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  id v79 = p_isa[24];
  uint64_t v80 = [v79 countByEnumeratingWithState:&v88 objects:v116 count:16];
  if (v80)
  {
    uint64_t v81 = v80;
    id v82 = 0;
    uint64_t v83 = *(void *)v89;
    do
    {
      uint64_t v84 = 0;
      v85 = v82;
      do
      {
        if (*(void *)v89 != v83) {
          objc_enumerationMutation(v79);
        }
        id v82 = *(id *)(*((void *)&v88 + 1) + 8 * v84);

        [v82 schedule];
        ++v84;
        v85 = v82;
      }
      while (v81 != v84);
      uint64_t v81 = [v79 countByEnumeratingWithState:&v88 objects:v116 count:16];
    }
    while (v81);
  }
  [p_isa[24] removeAllObjects];
  [p_isa _removeAllShareAcceptanceBlocks];
  return v21;
}

- (void)_mkdirAppLibraryIfNeeded:(id)a3
{
  uint64_t v6 = 0;
  session = self->_session;
  id v4 = a3;
  id v5 = [v4 mangledID];
  [(BRCAccountSession *)session createAppLibraryOnDisk:v5 createdRoot:0 createdDocuments:0 rootFileID:&v6];

  [v4 setRootFileID:v6];
}

- (void)_finishedReset:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  objc_msgSend(NSString, "stringWithFormat:", @"reset %s", BRCPrettyPrintEnum());
  id v7 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
  memset(v42, 0, sizeof(v42));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone(BRCZoneReset) _finishedReset:completionHandler:]", 824, v42);
  uint64_t v8 = brc_bread_crumbs();
  __int16 v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    uint64_t v46 = v42[0];
    __int16 v47 = 2112;
    long long v48 = v7;
    __int16 v49 = 2112;
    uint64_t v50 = self;
    __int16 v51 = 2112;
    long long v52 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx finishing %@ of %@%@", buf, 0x2Au);
  }

  int v10 = ![(BRCClientZone *)self isSharedZone];
  if (a3 < 3) {
    LOBYTE(v10) = 1;
  }
  if ((v10 & 1) == 0) {
    [(BRCClientZone *)self _flushIdleBlocksIfNeeded];
  }
  __int16 v11 = [(BRCAccountSession *)self->_session recentsEnumerator];
  [v11 dropIndexForClientZone:self];

  if (a3 <= 2) {
    uint64_t v12 = 256;
  }
  else {
    uint64_t v12 = 131328;
  }
  [(BRCClientZone *)self clearStateBits:v12];
  if ([(BRCClientZone *)self isPrivateZone])
  {
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    uint64_t v13 = [(BRCClientZone *)self asPrivateClientZone];
    uint64_t v14 = [v13 appLibraries];

    uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v39 != v16) {
            objc_enumerationMutation(v14);
          }
          uint64_t v18 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          [v18 clearStateBits:503316482];
          [v18 scheduleDeepScanWithReason:v7];
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v38 objects:v44 count:16];
      }
      while (v15);
    }
  }
  if (([(BRCClientZone *)self state] & 0x20000) != 0)
  {
    brc_bread_crumbs();
    long long v28 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
    long long v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v46 = (uint64_t)v7;
      __int16 v47 = 2112;
      long long v48 = self;
      __int16 v49 = 2112;
      uint64_t v50 = v28;
      _os_log_debug_impl(&dword_1D353B000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] finished %@ of %@ but we still need to delete data%@", buf, 0x20u);
    }

    [(BRCClientZone *)self scheduleResetServerAndClientTruthsForReason:@"still-wants-data-unlinked"];
  }
  else
  {
    lastSyncDownDate = self->_lastSyncDownDate;
    self->_lastSyncDownDate = 0;

    [(BRCClientZone *)self clearSyncStateBits:63];
    [(BRCClientZone *)self setStateBits:16];
    [(BRCClientZone *)self scheduleSyncDown];
    if ([(BRCClientZone *)self isPrivateZone])
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      uint64_t v20 = [(BRCClientZone *)self asPrivateClientZone];
      id v21 = [v20 appLibraries];

      uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v43 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v22; ++j)
          {
            if (*(void *)v35 != v23) {
              objc_enumerationMutation(v21);
            }
            long long v25 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            [v25 setStateBits:2048];
            [v25 clearStateBits:134217730];
            [(BRCAccountSession *)self->_session saveAppLibraryToDB:v25];
          }
          uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v43 count:16];
        }
        while (v22);
      }
    }
    brc_bread_crumbs();
    uint64_t v26 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
    long long v27 = brc_default_log();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v46 = (uint64_t)v7;
      __int16 v47 = 2112;
      long long v48 = self;
      __int16 v49 = 2112;
      uint64_t v50 = v26;
      _os_log_debug_impl(&dword_1D353B000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] finished %@ of %@%@", buf, 0x20u);
    }
  }
  [(BRCAccountSession *)self->_session saveClientZoneToDB:self];
  long long v30 = dispatch_group_create();
  if (v6)
  {
    long long v31 = [(BRCPQLConnection *)self->_db serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __64__BRCClientZone_BRCZoneReset___finishedReset_completionHandler___block_invoke;
    block[3] = &unk_1E6995800;
    id v33 = v6;
    dispatch_group_notify(v30, v31, block);
  }
  __brc_leave_section(v42);
}

uint64_t __64__BRCClientZone_BRCZoneReset___finishedReset_completionHandler___block_invoke(uint64_t a1)
{
  return (*(uint64_t (**)(void))(*(void *)(a1 + 32) + 16))();
}

- (id)ownerName
{
  return (id)*MEMORY[0x1E4F19C08];
}

- (id)asPrivateClientZone
{
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCClientZone asPrivateClientZone]();
  }

  return 0;
}

- (id)asSharedClientZone
{
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCClientZone asSharedClientZone]();
  }

  return 0;
}

- (BRCItemID)rootItemID
{
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT)) {
    -[BRCClientZone rootItemID]();
  }

  return 0;
}

- (BRMangledID)mangledID
{
  return self->_mangledID;
}

- (BOOL)isPrivateZone
{
  return 0;
}

- (BOOL)isSharedZone
{
  return 0;
}

- (unsigned)syncUpBatchSize
{
  id v3 = [(BRCClientZone *)self mangledID];
  id v4 = +[BRCUserDefaults defaultsForMangledID:v3];
  unsigned int v5 = [v4 maxRecordCountInModifyRecordsOperation];

  float syncUpBatchSizeMultiplier = self->_syncUpBatchSizeMultiplier;
  unsigned int v7 = (float)(syncUpBatchSizeMultiplier * (float)v5);
  if (syncUpBatchSizeMultiplier >= 1.0) {
    unsigned int v7 = v5;
  }
  if (v7 <= 2) {
    return 2;
  }
  else {
    return v7;
  }
}

- (void)_decreaseSyncUpBatchSizeAfterError
{
  id v3 = [(BRCClientZone *)self mangledID];
  id v4 = +[BRCUserDefaults defaultsForMangledID:v3];
  [v4 modifyRecordsCountMultiplicativeDecrease];
  float v6 = v5;

  self->_float syncUpBatchSizeMultiplier = v6 * self->_syncUpBatchSizeMultiplier;
}

- (void)_increaseSyncUpBatchSizeAfterSuccess
{
  if (self->_syncUpBatchSizeMultiplier < 1.0)
  {
    id v3 = [(BRCClientZone *)self mangledID];
    id v4 = +[BRCUserDefaults defaultsForMangledID:v3];
    [v4 modifyRecordsCountAdditiveIncreaseFraction];
    float v6 = v5;

    float v7 = v6 + self->_syncUpBatchSizeMultiplier;
    if (v7 > 1.0) {
      float v7 = 1.0;
    }
    self->_float syncUpBatchSizeMultiplier = v7;
  }
}

- (void)setNeedsSave:(BOOL)a3
{
  if (self->_needsSave != a3)
  {
    if (a3)
    {
      [(BRCPQLConnection *)self->_db forceBatchStart];
      float v5 = brc_bread_crumbs();
      float v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone setNeedsSave:]((uint64_t)self);
      }
    }
    self->_needsSave = a3;
  }
}

- (BOOL)enhancedDrivePrivacyEnabled
{
  id v3 = [(BRCClientZone *)self mangledID];
  id v4 = +[BRCUserDefaults defaultsForMangledID:v3];
  int v5 = [v4 supportsEnhancedDrivePrivacy];

  if (v5)
  {
    float v6 = [(BRCClientZone *)self mangledID];
    float v7 = +[BRCUserDefaults defaultsForMangledID:v6];
    char v8 = [v7 enhancedDrivePrivacyForced];

    if (v8) {
      LOBYTE(v9) = 1;
    }
    else {
      return ([(BRCClientZone *)self state] >> 22) & 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
  return v9;
}

- (BRCClientZone)init
{
  id v3 = (void *)MEMORY[0x1E4F1CA00];
  uint64_t v4 = *MEMORY[0x1E4F1C3C8];
  int v5 = [NSString stringWithUTF8String:"-[BRCClientZone init]"];
  [v3 raise:v4, @"Don't call %@.", v5 format];

  return 0;
}

- (BRCClientZone)initWithMangledID:(id)a3 dbRowID:(id)a4 plist:(id)a5 session:(id)a6 initialCreation:(BOOL)a7
{
  BOOL v7 = a7;
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  v54.receiver = self;
  v54.super_class = (Class)BRCClientZone;
  uint64_t v17 = [(BRCClientZone *)&v54 init];
  uint64_t v18 = v17;
  if (v17)
  {
    v17->_isInitialCreation = v7;
    uint64_t v19 = [v16 clientDB];
    db = v18->_db;
    v18->_db = (BRCPQLConnection *)v19;

    objc_storeStrong((id *)&v18->_dbRowID, a4);
    objc_storeStrong((id *)&v18->_session, a6);
    objc_storeStrong((id *)&v18->_mangledID, a3);
    uint64_t v21 = [v13 appLibraryOrZoneName];
    zoneName = v18->_zoneName;
    v18->_zoneName = (NSString *)v21;

    uint64_t v23 = [v13 ownerName];
    ownerName = v18->_ownerName;
    v18->_ownerName = (NSString *)v23;

    uint64_t v25 = brc_task_tracker_create("zone-tracker");
    taskTracker = v18->_taskTracker;
    v18->_taskTracker = (brc_task_tracker *)v25;

    long long v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    syncDownDependencies = v18->_syncDownDependencies;
    v18->_syncDownDependencies = v27;

    v18->_shouldShowiCloudDriveAppInstallationNotification = 1;
    v18->_float syncUpBatchSizeMultiplier = 1.0;
    long long v29 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    currentSyncDownBarriers = v18->_currentSyncDownBarriers;
    v18->_currentSyncDownBarriers = v29;

    uint64_t v31 = objc_opt_new();
    blockedOperationsOnInitialSync = v18->_blockedOperationsOnInitialSync;
    v18->_blockedOperationsOnInitialSync = (NSMutableArray *)v31;

    uint64_t v33 = objc_opt_new();
    runningListOperations = v18->_runningListOperations;
    v18->_runningListOperations = (NSMutableDictionary *)v33;

    uint64_t v35 = objc_opt_new();
    recursiveListOperations = v18->_recursiveListOperations;
    v18->_recursiveListOperations = (NSMutableDictionary *)v35;

    uint64_t v37 = objc_opt_new();
    fetchParentOperations = v18->_fetchParentOperations;
    v18->_fetchParentOperations = (NSMutableDictionary *)v37;

    uint64_t v39 = objc_opt_new();
    locateRecordOperations = v18->_locateRecordOperations;
    v18->_locateRecordOperations = (NSMutableDictionary *)v39;

    uint64_t v41 = objc_opt_new();
    directoriesCreatedLastSyncUp = v18->_directoriesCreatedLastSyncUp;
    v18->_directoriesCreatedLastSyncUp = (NSMutableArray *)v41;

    long long v43 = +[BRCUserDefaults defaultsForMangledID:v13];
    uint64_t v44 = [v43 serverStitchingThrottleParams];

    uint64_t v45 = [[BRCThrottle alloc] initWithName:@"server-stitching-throttle" andParameters:v44];
    serverStitchingOperationThrottle = v18->_serverStitchingOperationThrottle;
    v18->_serverStitchingOperationThrottle = v45;

    __int16 v47 = +[BRCUserDefaults defaultsForMangledID:v13];
    long long v48 = [v47 locateRecordsThrottleParams];

    __int16 v49 = [[BRCThrottle alloc] initWithName:@"locate-records-throttle" andParameters:v48];
    locateRecordsOperationThrottle = v18->_locateRecordsOperationThrottle;
    v18->_locateRecordsOperationThrottle = v49;

    if (v7)
    {
      uint64_t v51 = objc_msgSend(MEMORY[0x1E4F1A218], "br_syncDownInitial");
      syncDownGroup = v18->_syncDownGroup;
      v18->_syncDownGroup = (CKOperationGroup *)v51;

      [(BRCClientZone *)v18 setNeedsSave:1];
    }
    else
    {
      [(BRCClientZone *)v18 updateWithPlist:v15];
    }
    [(BRCClientZone *)v18 _recreateSyncBudgetsAndThrottlesIfNeeded];
  }
  return v18;
}

- (void)dealloc
{
  if (self->_hasWorkDidUpdateObserver)
  {
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self->_hasWorkDidUpdateObserver];
  }
  v4.receiver = self;
  v4.super_class = (Class)BRCClientZone;
  [(BRCClientZone *)&v4 dealloc];
}

- (NSMutableDictionary)plist
{
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:12];
  objc_super v4 = [NSNumber numberWithUnsignedInt:self->_state];
  [v3 setObject:v4 forKeyedSubscript:@"state"];

  int v5 = [NSNumber numberWithUnsignedLongLong:self->_requestID];
  [v3 setObject:v5 forKeyedSubscript:@"requestID"];

  float v6 = [NSNumber numberWithLongLong:self->_lastInsertedRank];
  [v3 setObject:v6 forKeyedSubscript:@"lastApplyRank"];

  appliedTombstoneRanks = self->_appliedTombstoneRanks;
  if (appliedTombstoneRanks) {
    [v3 setObject:appliedTombstoneRanks forKeyedSubscript:@"appliedTombstoneRanks"];
  }
  syncUpThrottle = self->_syncUpThrottle;
  if (syncUpThrottle) {
    [v3 setObject:syncUpThrottle forKeyedSubscript:@"syncUpThrottle"];
  }
  syncUpBudget = self->_syncUpBudget;
  if (syncUpBudget) {
    [v3 setObject:syncUpBudget forKeyedSubscript:@"syncUpBudget"];
  }
  syncUpBackoffRatio = self->_syncUpBackoffRatio;
  if (syncUpBackoffRatio) {
    [v3 setObject:syncUpBackoffRatio forKeyedSubscript:@"syncUpBackoffRatio"];
  }
  syncDownThrottle = self->_syncDownThrottle;
  if (syncDownThrottle) {
    [v3 setObject:syncDownThrottle forKeyedSubscript:@"syncDownThrottle"];
  }
  lastSyncDownDate = self->_lastSyncDownDate;
  if (lastSyncDownDate) {
    [v3 setObject:lastSyncDownDate forKeyedSubscript:@"lastSyncDownDate"];
  }
  osNameRequiredToSync = self->_osNameRequiredToSync;
  if (osNameRequiredToSync) {
    [v3 setObject:osNameRequiredToSync forKeyedSubscript:@"osNameRequiredToSync"];
  }
  syncDownGroup = self->_syncDownGroup;
  if (syncDownGroup) {
    [v3 setObject:syncDownGroup forKeyedSubscript:@"syncDownGroup"];
  }
  appUninstalledDate = self->_appUninstalledDate;
  if (appUninstalledDate) {
    [v3 setObject:appUninstalledDate forKeyedSubscript:@"appUninstalledDate"];
  }
  return (NSMutableDictionary *)v3;
}

- (void)_recreateSyncBudgetsAndThrottlesIfNeeded
{
  if (!self->_syncUpThrottle)
  {
    id v3 = [[BRCSyncOperationThrottle alloc] initWithMangledID:self->_mangledID isSyncDown:0];
    syncUpThrottle = self->_syncUpThrottle;
    self->_syncUpThrottle = v3;

    [(BRCClientZone *)self setNeedsSave:1];
  }
  if (!self->_syncDownThrottle)
  {
    int v5 = [[BRCSyncOperationThrottle alloc] initWithMangledID:self->_mangledID isSyncDown:1];
    syncDownThrottle = self->_syncDownThrottle;
    self->_syncDownThrottle = v5;

    [(BRCClientZone *)self setNeedsSave:1];
  }
  if (!self->_syncUpBudget)
  {
    BOOL v7 = objc_alloc_init(BRCSyncBudgetThrottle);
    syncUpBudget = self->_syncUpBudget;
    self->_syncUpBudget = v7;

    [(BRCClientZone *)self setNeedsSave:1];
  }
  if (!self->_syncUpBackoffRatio)
  {
    BOOL v9 = objc_alloc_init(BRCSyncOperationBackoffRatio);
    syncUpBackoffRatio = self->_syncUpBackoffRatio;
    self->_syncUpBackoffRatio = v9;

    [(BRCClientZone *)self setNeedsSave:1];
  }
}

- (void)updateWithPlist:(id)a3
{
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"state"];
  self->_state = [v5 unsignedIntValue];

  float v6 = [v4 objectForKeyedSubscript:@"requestID"];
  self->_requestID = [v6 unsignedLongLongValue];

  BOOL v7 = [v4 objectForKeyedSubscript:@"lastApplyRank"];
  self->_lastInsertedRank = [v7 longLongValue];

  char v8 = [v4 objectForKeyedSubscript:@"appliedTombstoneRanks"];
  BOOL v9 = (NSMutableIndexSet *)[v8 mutableCopy];
  appliedTombstoneRanks = self->_appliedTombstoneRanks;
  self->_appliedTombstoneRanks = v9;

  __int16 v11 = [v4 objectForKeyedSubscript:@"syncUpThrottle"];
  syncUpThrottle = self->_syncUpThrottle;
  self->_syncUpThrottle = v11;

  id v13 = [v4 objectForKeyedSubscript:@"syncUpBudget"];
  syncUpBudget = self->_syncUpBudget;
  self->_syncUpBudget = v13;

  id v15 = [v4 objectForKeyedSubscript:@"syncUpBackoffRatio"];
  syncUpBackoffRatio = self->_syncUpBackoffRatio;
  self->_syncUpBackoffRatio = v15;

  uint64_t v17 = [v4 objectForKeyedSubscript:@"syncDownThrottle"];
  syncDownThrottle = self->_syncDownThrottle;
  self->_syncDownThrottle = v17;

  uint64_t v19 = [v4 objectForKeyedSubscript:@"lastSyncDownDate"];
  lastSyncDownDate = self->_lastSyncDownDate;
  self->_lastSyncDownDate = v19;

  uint64_t v21 = [v4 objectForKeyedSubscript:@"osNameRequiredToSync"];
  osNameRequiredToSync = self->_osNameRequiredToSync;
  self->_osNameRequiredToSync = v21;

  uint64_t v23 = [v4 objectForKeyedSubscript:@"syncDownGroup"];
  syncDownGroup = self->_syncDownGroup;
  self->_syncDownGroup = v23;

  uint64_t v25 = [v4 objectForKeyedSubscript:@"appUninstalledDate"];

  appUninstalledDate = self->_appUninstalledDate;
  self->_appUninstalledDate = v25;

  if (!self->_syncUpBudget || (long long v27 = self->_syncUpThrottle) == 0 || !self->_syncDownThrottle)
  {
    long long v28 = brc_bread_crumbs();
    long long v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone updateWithPlist:]();
    }

    long long v27 = self->_syncUpThrottle;
  }
  [(BRCSyncOperationThrottle *)v27 setMangledID:self->_mangledID];
  [(BRCSyncOperationThrottle *)self->_syncDownThrottle setMangledID:self->_mangledID];
}

- (void)associateWithServerZone:(id)a3
{
}

- (void)associateWithServerZone:(id)a3 offline:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  float v6 = (BRCServerZone *)a3;
  BOOL v7 = brc_bread_crumbs();
  char v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    int v11 = 138412802;
    uint64_t v12 = self;
    __int16 v13 = 2112;
    id v14 = v6;
    __int16 v15 = 2112;
    id v16 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] associating %@ with %@%@", (uint8_t *)&v11, 0x20u);
  }

  serverZone = self->_serverZone;
  self->_serverZone = v6;
  int v10 = v6;

  [(BRCServerZone *)v10 activateWithClientZone:self offline:v4];
  if (v4) {
    self->_activated = 1;
  }
}

- (void)resume
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_activated%@", v2, v3, v4, v5, v6);
}

void __23__BRCClientZone_resume__block_invoke(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1D9438760]();
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _startSync];
}

uint64_t __23__BRCClientZone_resume__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchRecentAndFavoriteDocuments];
}

uint64_t __23__BRCClientZone_resume__block_invoke_3(uint64_t a1)
{
  return [*(id *)(a1 + 32) _scheduleZoneResetForUninstalledAppIfNecessary];
}

- (void)close
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _activated%@", v2, v3, v4, v5, v6);
}

uint64_t __22__BRCClientZone_close__block_invoke(uint64_t a1)
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 104));
  [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) cancel];
  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 128));
  [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) cancel];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 16) deleteAllContentsOperation];
  uint64_t v3 = *(void *)(*(void *)(a1 + 64) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;

  [*(id *)(*(void *)(*(void *)(a1 + 64) + 8) + 40) cancel];
  if ([*(id *)(a1 + 32) isPrivateZone])
  {
    uint64_t v5 = [*(id *)(*(void *)(a1 + 32) + 8) applyScheduler];
    uint8_t v6 = [*(id *)(a1 + 32) asPrivateClientZone];
    [v5 stopMonitoringFaultingForZone:v6];
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  BOOL v7 = [*(id *)(*(void *)(a1 + 32) + 208) allValues];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v54 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        [v12 cancel];
        [*(id *)(a1 + 40) addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v9);
  }

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  __int16 v13 = [*(id *)(*(void *)(a1 + 32) + 200) allValues];
  uint64_t v14 = [v13 countByEnumeratingWithState:&v49 objects:v60 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v50;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v50 != v16) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v49 + 1) + 8 * j);
        [v18 cancel];
        [*(id *)(a1 + 40) addObject:v18];
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v49 objects:v60 count:16];
    }
    while (v15);
  }

  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  uint64_t v19 = [*(id *)(*(void *)(a1 + 32) + 216) allValues];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v45 objects:v59 count:16];
  if (v20)
  {
    uint64_t v21 = v20;
    uint64_t v22 = *(void *)v46;
    do
    {
      for (uint64_t k = 0; k != v21; ++k)
      {
        if (*(void *)v46 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v45 + 1) + 8 * k);
        [v24 cancel];
        [*(id *)(a1 + 40) addObject:v24];
      }
      uint64_t v21 = [v19 countByEnumeratingWithState:&v45 objects:v59 count:16];
    }
    while (v21);
  }

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v25 = [*(id *)(*(void *)(a1 + 32) + 224) allValues];
  uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v58 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v42;
    do
    {
      for (uint64_t m = 0; m != v27; ++m)
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v30 = *(void **)(*((void *)&v41 + 1) + 8 * m);
        [v30 cancel];
        [*(id *)(a1 + 40) addObject:v30];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v58 count:16];
    }
    while (v27);
  }

  objc_storeStrong((id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40), *(id *)(*(void *)(a1 + 32) + 232));
  [*(id *)(*(void *)(*(void *)(a1 + 72) + 8) + 40) cancel];
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v31 = *(id *)(*(void *)(a1 + 32) + 192);
  uint64_t v32 = [v31 countByEnumeratingWithState:&v37 objects:v57 count:16];
  if (v32)
  {
    uint64_t v33 = v32;
    uint64_t v34 = *(void *)v38;
    do
    {
      for (uint64_t n = 0; n != v33; ++n)
      {
        if (*(void *)v38 != v34) {
          objc_enumerationMutation(v31);
        }
        objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * n), "schedule", (void)v37);
      }
      uint64_t v33 = [v31 countByEnumeratingWithState:&v37 objects:v57 count:16];
    }
    while (v33);
  }

  return [*(id *)(*(void *)(a1 + 32) + 192) removeAllObjects];
}

void __22__BRCClientZone_close__block_invoke_68(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  uint64_t v1 = objc_msgSend(*(id *)(a1 + 32), "asPrivateClientZone", 0);
  uint64_t v2 = [v1 appLibraries];

  uint64_t v3 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        [*(id *)(*((void *)&v7 + 1) + 8 * v6++) close];
      }
      while (v4 != v6);
      uint64_t v4 = [v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

- (void)scheduleResetServerAndClientTruthsForReason:(id)a3
{
}

- (void)scheduleResetServerAndClientTruthsForReason:(id)a3 completionHandler:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (scheduleResetServerAndClientTruthsForReason_completionHandler__onceToken != -1) {
    dispatch_once(&scheduleResetServerAndClientTruthsForReason_completionHandler__onceToken, &__block_literal_global_27);
  }
  long long v8 = +[BRCUserDefaults defaultsForMangledID:self->_mangledID];
  long long v9 = [v8 resetReasonsToTriggerTTR];

  if ([v9 containsObject:v6])
  {
    long long v10 = [NSString stringWithFormat:@"Zone Reset: %@", v6];
    int v11 = [(BRCAccountSession *)self->_session tapToRadarManager];
    uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorZoneReset");
    [v11 requestTapToRadarWithTitle:v10 description:v10 keywords:MEMORY[0x1E4F1CBF0] attachments:MEMORY[0x1E4F1CBF0] sendFullLog:0 displayReason:@"it got to an invalid state" triggerRootCause:v12];
  }
  if (([(id)scheduleResetServerAndClientTruthsForReason_completionHandler__reasonsToIgnoreForABC containsObject:v6] & 1) == 0)
  {
    __int16 v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone scheduleResetServerAndClientTruthsForReason:completionHandler:]((uint64_t)v6);
    }
  }
  uint64_t v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    id v21 = v6;
    __int16 v22 = 2112;
    uint64_t v23 = v15;
    _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] Container needs server and client truths reset: %@%@", buf, 0x16u);
  }

  uint64_t v17 = +[BRCEventsAnalytics sharedAnalytics];
  [v17 registerAndSendNewContainerResetWithOutcome:v6];

  id v18 = +[AppTelemetryTimeSeriesEvent newZoneResetEventWithZoneMangledID:self->_mangledID enhancedDrivePrivacyEnabled:[(BRCClientZone *)self enhancedDrivePrivacyEnabled] lastSyncDate:self->_lastSyncDownDate error:0 errorDescription:v6];
  uint64_t v19 = [(BRCAccountSession *)self->_session analyticsReporter];
  [v19 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v18];

  [(BRCClientZone *)self scheduleReset:2 completionHandler:v7];
}

void __79__BRCClientZone_scheduleResetServerAndClientTruthsForReason_completionHandler___block_invoke()
{
  uint64_t v0 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithObjects:", @"crash-recovery", @"ipc-com.apple.finder", @"CKErrorInternalContainerReset", @"CKErrorUserDeleteZone", @"CKErrorZoneNotFound", @"CKErrorSharedZoneNotFound", @"still-wants-data-unlinked", @"zone became healthy", @"start-scan", @"testing", 0);
  uint64_t v1 = (void *)scheduleResetServerAndClientTruthsForReason_completionHandler__reasonsToIgnoreForABC;
  scheduleResetServerAndClientTruthsForReason_completionHandler__reasonsToIgnoreForABC = v0;
}

- (BOOL)handleZoneLevelErrorIfNeeded:(id)a3 forItemCreation:(BOOL)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  id v25 = 0;
  id v26 = 0;
  int v6 = objc_msgSend(v5, "brc_isCloudKitErrorUnsupportedOSForZoneAndGetMinimumSupported:", &v25);
  id v7 = v25;
  id v8 = v25;
  if (v6)
  {
    objc_storeStrong((id *)&self->_osNameRequiredToSync, v7);
    [(BRCClientZone *)self setStateBits:0x200000];
  }
  uint64_t v9 = objc_msgSend(v5, "brc_containerResetErrorForSharedZone:resetReason:", -[BRCClientZone isSharedZone](self, "isSharedZone"), &v26);
  if (v9)
  {
    uint64_t v10 = v9;
    int v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v29 = v10;
      __int16 v30 = 2112;
      id v31 = v11;
      _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Container needs reset - %lu%@", buf, 0x16u);
    }

    __int16 v13 = +[BRCEventsAnalytics sharedAnalytics];
    [v13 registerAndSendNewContainerResetWithOutcome:v26];

    mangledID = self->_mangledID;
    BOOL v15 = [(BRCClientZone *)self enhancedDrivePrivacyEnabled];
    id v16 = +[AppTelemetryTimeSeriesEvent newZoneResetEventWithZoneMangledID:mangledID enhancedDrivePrivacyEnabled:v15 lastSyncDate:self->_lastSyncDownDate error:v5 errorDescription:v26];
    uint64_t v17 = [(BRCAccountSession *)self->_session analyticsReporter];
    [v17 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v16];

    [(BRCClientZone *)self scheduleReset:v10];
    BOOL v18 = 1;
  }
  else if (objc_msgSend(v5, "brc_isCloudKitErrorZoneMigrated"))
  {
    uint64_t v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = (uint64_t)v19;
      _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] Server zone has been moved to cloud docs%@", buf, 0xCu);
    }

    sessiouint64_t n = self->_session;
    serverZone = self->_serverZone;
    BOOL v18 = 1;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&serverZone count:1];
    [(BRCAccountSession *)session scheduleZoneMovesToCloudDocs:v16];
  }
  else
  {
    if (!objc_msgSend(v5, "brc_isCloudKitErrorNeedsPCSPrep"))
    {
      BOOL v18 = 0;
      goto LABEL_16;
    }
    __int16 v22 = brc_bread_crumbs();
    uint64_t v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v29 = (uint64_t)v22;
      _os_log_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEFAULT, "[WARNING] Server tells us we need to redo PCS prep%@", buf, 0xCu);
    }

    id v16 = [(BRCAccountSession *)self->_session containerScheduler];
    [v16 redoZonePCSPreperation];
    BOOL v18 = 0;
  }

LABEL_16:
  return v18;
}

- (BOOL)handleSaltingErrorIfNeeded:(id)a3 record:(id)a4
{
  return 0;
}

- (void)_bumpNotificationRankOnTopLevelFolderSharesInZone
{
  [(BRCPQLConnection *)self->_db execute:@"UPDATE client_items SET item_notifs_ranuint64_t k = bump_notifs_rank() WHERE (item_sharing_options & 4) != 0 AND zone_rowid = %@ AND item_type IN (0, 9, 10)", self->_dbRowID];
}

- (void)_bumpNotificationRankOnTopLevelFolderSharesParentedToZone
{
  [(BRCPQLConnection *)self->_db execute:@"UPDATE client_items SET item_notifs_ranuint64_t k = bump_notifs_rank() WHERE (item_sharing_options & 4) != 0 AND item_parent_zone_rowid = %@ AND zone_rowid != item_parent_zone_rowid AND item_type IN (0, 9, 10)", self->_dbRowID];
}

- (id)itemCountPendingUploadOrSyncUpAndReturnError:(id *)a3
{
  if (a3)
  {
    id v5 = *a3;
    *a3 = 0;
  }
  int v6 = [(BRCClientZone *)self db];
  id v7 = [(BRCServerZone *)self->_serverZone dbRowID];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __62__BRCClientZone_itemCountPendingUploadOrSyncUpAndReturnError___block_invoke;
  v11[3] = &__block_descriptor_40_e48_v28__0__sqlite3_context__8i16___sqlite3_value_20l;
  v11[4] = a3;
  id v8 = (void *)MEMORY[0x1D94389C0](v11);
  uint64_t v9 = (void *)[v6 numberWithSQL:@"SELECT COUNT(1) FROM client_items WHERE item_localsyncupstate IN (2, 3, 4) AND zone_rowid = %@  AND call_block(%p, version_upload_error, item_id)", v7, v8];

  return v9;
}

void __62__BRCClientZone_itemCountPendingUploadOrSyncUpAndReturnError___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, uint64_t a4)
{
  if (+[BRCItemID isDocumentsItemIDWithSQLiteValue:*(void *)(a4 + 8)])
  {
    sqlite3_result_int(a2, 0);
  }
  else
  {
    id v7 = *(id **)(a1 + 32);
    checkErrorIsRetriable(a2, (sqlite3_value **)a4, v7);
  }
}

- (id)sizeOfItemsNeedingSyncUpOrUploadAndReturnError:(id *)a3
{
  if ([(BRCClientZone *)self isSyncBlocked])
  {
    id v5 = brc_bread_crumbs();
    int v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone sizeOfItemsNeedingSyncUpOrUploadAndReturnError:]((uint64_t)self);
    }
    id v7 = 0;
    goto LABEL_7;
  }
  id v5 = [(BRCClientZone *)self itemCountPendingUploadOrSyncUpAndReturnError:a3];
  if ([v5 intValue])
  {
    id v8 = [(BRCClientZone *)self db];
    uint64_t v9 = [(BRCServerZone *)self->_serverZone dbRowID];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __64__BRCClientZone_sizeOfItemsNeedingSyncUpOrUploadAndReturnError___block_invoke;
    v14[3] = &__block_descriptor_40_e48_v28__0__sqlite3_context__8i16___sqlite3_value_20l;
    void v14[4] = a3;
    uint64_t v10 = (void *)MEMORY[0x1D94389C0](v14);
    int v6 = [v8 numberWithSQL:@"SELECT SUM(version_size) FROM client_items WHERE item_localsyncupstate IN (2, 3, 4)   AND zone_rowid = %@   AND call_block(%p, version_upload_error)", v9, v10];

    uint64_t v11 = [v6 integerValue];
    uint64_t v12 = [v5 integerValue];
    id v7 = [NSNumber numberWithInteger:v11 + 100 * v12];
LABEL_7:

    goto LABEL_8;
  }
  id v7 = 0;
LABEL_8:

  return v7;
}

void __64__BRCClientZone_sizeOfItemsNeedingSyncUpOrUploadAndReturnError___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
}

- (void)beginSyncBubbleActivityIfNecessary
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if (self->_bubbleSyncTask)
  {
    uint64_t v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      bubbleSyncTasuint64_t k = self->_bubbleSyncTask;
      *(_DWORD *)buf = 138412802;
      uint64_t v12 = self;
      __int16 v13 = 2112;
      uint64_t v14 = (uint64_t)bubbleSyncTask;
      __int16 v15 = 2112;
      id v16 = v3;
      _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ - We already have a bubble sync task %@%@", buf, 0x20u);
    }
LABEL_8:

    goto LABEL_9;
  }
  uint64_t v3 = [(BRCClientZone *)self sizeOfItemsNeedingSyncUpOrUploadAndReturnError:0];
  if (v3)
  {
    int v6 = (void *)MEMORY[0x1E4FB3728];
    id v7 = [NSString stringWithFormat:@"Still %@ bytes need to sync to the server", v3];
    id v8 = [v6 taskWithName:@"com.apple.bird.uploads" reason:v7 forBundleID:self->_zoneName];

    uint64_t v9 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v12 = self;
      __int16 v13 = 2048;
      uint64_t v14 = [v3 unsignedLongLongValue];
      __int16 v15 = 2112;
      id v16 = v9;
      _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEFAULT, "[NOTICE] %@ - shared iPad: needs to sync items in the sync bubble (sz:%llu)%@", buf, 0x20u);
    }

    objc_msgSend(v8, "setContentSize:", objc_msgSend(v3, "unsignedIntegerValue"));
    [v8 begin];
    uint64_t v4 = self->_bubbleSyncTask;
    self->_bubbleSyncTasuint64_t k = (UMUserSyncTask *)v8;
    goto LABEL_8;
  }
LABEL_9:
}

- (void)registerAllItemsDidUploadTracker:(id)a3
{
  id v4 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  id v9 = 0;
  id v5 = [(BRCClientZone *)self sizeOfItemsNeedingSyncUpOrUploadAndReturnError:&v9];
  if (v5)
  {
    allItemsDidUploadTrackers = self->_allItemsDidUploadTrackers;
    if (!allItemsDidUploadTrackers)
    {
      id v7 = (NSMutableArray *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      id v8 = self->_allItemsDidUploadTrackers;
      self->_allItemsDidUploadTrackers = v7;

      allItemsDidUploadTrackers = self->_allItemsDidUploadTrackers;
    }
    [(NSMutableArray *)allItemsDidUploadTrackers addObject:v4];
  }
  else
  {
    [v4 clientZone:self didFinishUploadingAllItemsWithError:v9];
  }
}

- (void)unregisterAllItemsDidUploadTracker:(id)a3
{
  db = self->_db;
  id v5 = a3;
  [(BRCPQLConnection *)db assertOnQueue];
  [(NSMutableArray *)self->_allItemsDidUploadTrackers removeObject:v5];

  if (![(NSMutableArray *)self->_allItemsDidUploadTrackers count])
  {
    allItemsDidUploadTrackers = self->_allItemsDidUploadTrackers;
    self->_allItemsDidUploadTrackers = 0;
  }
}

- (BOOL)isCloudDocsZone
{
  BOOL v3 = [(BRCClientZone *)self isPrivateZone];
  if (v3)
  {
    zoneName = self->_zoneName;
    uint64_t v5 = *MEMORY[0x1E4F59418];
    LOBYTE(v3) = [(NSString *)zoneName isEqualToString:v5];
  }
  return v3;
}

- (void)disconnectNSMDQListenerAsync
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┣%llx disconnecting listener so that they gather again%@", (void)v3, DWORD2(v3));
}

void __45__BRCClientZone_disconnectNSMDQListenerAsync__block_invoke(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v5 = *(_OWORD *)(a1 + 40);
  uint64_t v6 = *(void *)(a1 + 56);
  os_log_t v2 = brc_bread_crumbs();
  long long v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v4 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 134218498;
    uint64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v4;
    __int16 v11 = 2112;
    uint64_t v12 = v2;
    _os_log_debug_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx disconnected NSMDQ listeners for %@%@", buf, 0x20u);
  }

  __brc_leave_section((uint64_t *)&v5);
}

- (BOOL)isForeground
{
  os_log_t v2 = [(BRCClientZone *)self serverZone];
  long long v3 = [v2 metadataSyncContextIfExists];
  char v4 = [v3 isForeground];

  return v4;
}

- (void)_forDBUpgrade_setStateBits:(unsigned int)a3 clearStateBits:(unsigned int)a4
{
  unsigned int state = self->_state;
  unsigned int v5 = (state | a3) & ~a4;
  if (state != v5)
  {
    [(BRCClientZone *)self setNeedsSave:1];
    self->_unsigned int state = v5;
  }
}

- (void)_fixupEnhancedDrivePrivacyState
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v3 = [(BRCClientZone *)self mangledID];
  char v4 = +[BRCUserDefaults defaultsForMangledID:v3];
  unsigned int v5 = v4;
  unsigned int state = self->_state;
  if ((state & 0x400000) != 0)
  {
    if (![v4 supportsEnhancedDrivePrivacy])
    {
      uint64_t v10 = brc_bread_crumbs();
      __int16 v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
      {
        int v12 = 138412546;
        uint64_t v13 = v3;
        __int16 v14 = 2112;
        __int16 v15 = v10;
        _os_log_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEFAULT, "[WARNING] Stripping enhanced drive privacy bit because it's not supported on %@%@", (uint8_t *)&v12, 0x16u);
      }

      unsigned int v9 = self->_state & 0xFFBFFFFF;
      goto LABEL_13;
    }
    unsigned int state = self->_state;
  }
  if ((state & 0x400000) == 0
    && [v5 supportsEnhancedDrivePrivacy]
    && [v5 enhancedDrivePrivacyForced])
  {
    id v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      int v12 = 138412546;
      uint64_t v13 = v3;
      __int16 v14 = 2112;
      __int16 v15 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] Adding enhanced drive privacy bit because it's forced on %@%@", (uint8_t *)&v12, 0x16u);
    }

    unsigned int v9 = self->_state | 0x400000;
LABEL_13:
    self->_unsigned int state = v9;
    [(BRCClientZone *)self setNeedsSave:1];
  }
}

- (void)_scheduleZoneResetForUninstalledAppIfNecessary
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (!self->_resetAfterAppUninstallTimer && (self->_state & 0x1000) != 0)
  {
    if ([(BRCClientZone *)self isPrivateZone])
    {
      long long v3 = [(BRCClientZone *)self db];
      char v4 = [(BRCClientZone *)self dbRowID];
      unsigned int v5 = (void *)[v3 numberWithSQL:@"SELECT 1 FROM client_items ci WHERE ci.zone_rowid = %@ AND NOT item_id_is_documents(ci.item_id)", v4];

      if (v5)
      {
        if (!self->_appUninstalledDate)
        {
          uint64_t v6 = [MEMORY[0x1E4F1C9C8] now];
          appUninstalledDate = self->_appUninstalledDate;
          self->_appUninstalledDate = v6;

          [(BRCClientZone *)self setNeedsSave:1];
        }
        uint64_t v8 = +[BRCUserDefaults defaultsForMangledID:0];
        [v8 zoneAutoResetDelayInSecAfterAppUninstall];
        double v10 = v9;
        __int16 v11 = [MEMORY[0x1E4F1C9C8] now];
        [v11 timeIntervalSinceDate:self->_appUninstalledDate];
        double v13 = v10 - v12;

        if (v13 <= 0.0)
        {
          [(BRCClientZone *)self scheduleReset:3];
        }
        else
        {
          __int16 v14 = brc_bread_crumbs();
          __int16 v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v20 = [(BRCClientZone *)self zoneName];
            *(_DWORD *)locatiouint64_t n = 134218498;
            *(double *)&location[4] = v13;
            __int16 v24 = 2112;
            id v25 = v20;
            __int16 v26 = 2112;
            uint64_t v27 = v14;
            _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] schedule zone reset timer to run after %f sec for %@%@", location, 0x20u);
          }
          objc_initWeak((id *)location, self);
          id v16 = objc_alloc(MEMORY[0x1E4F59570]);
          uint64_t v17 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          v21[2] = __63__BRCClientZone__scheduleZoneResetForUninstalledAppIfNecessary__block_invoke;
          v21[3] = &unk_1E69949E8;
          objc_copyWeak(&v22, (id *)location);
          BOOL v18 = (BRTimer *)[v16 initWithName:@"zone-auto-reset" interval:v17 callbackQueue:v21 block:v13];
          resetAfterAppUninstallTimer = self->_resetAfterAppUninstallTimer;
          self->_resetAfterAppUninstallTimer = v18;

          [(BRTimer *)self->_resetAfterAppUninstallTimer start];
          objc_destroyWeak(&v22);
          objc_destroyWeak((id *)location);
        }
      }
    }
  }
}

uint64_t __63__BRCClientZone__scheduleZoneResetForUninstalledAppIfNecessary__block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  os_log_t v2 = WeakRetained;
  if (WeakRetained)
  {
    if ((*((unsigned char *)WeakRetained + 73) & 0x10) != 0)
    {
      long long v3 = brc_bread_crumbs();
      char v4 = brc_default_log();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
        __63__BRCClientZone__scheduleZoneResetForUninstalledAppIfNecessary__block_invoke_cold_2();
      }

      [v2 scheduleReset:3];
    }
    unsigned int v5 = (void *)v2[61];
    v2[61] = 0;
  }
  else
  {
    unsigned int v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      __63__BRCClientZone__scheduleZoneResetForUninstalledAppIfNecessary__block_invoke_cold_1();
    }
  }
  return 0;
}

- (unsigned)_activateState:(unsigned int)a3 origState:(unsigned int)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  [(BRCClientZone *)self _fixupEnhancedDrivePrivacyState];
  if (self->_state != a3)
  {
    [(BRCClientZone *)self setNeedsSave:1];
    self->_unsigned int state = a3;
  }
  if ((a3 & 0x100) != 0)
  {
    a3 &= ~0x10u;
    self->_unsigned int state = a3;
  }
  unsigned int v7 = a3 ^ a4;
  if (v7)
  {
    if (self->_needsSave)
    {
      uint64_t v8 = brc_bread_crumbs();
      double v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v27 = BRCPrettyPrintBitmapWithContext(a4, (uint64_t)&local_container_state_entries, 0);
        *(_DWORD *)buf = 138412802;
        id v31 = self;
        __int16 v32 = 2112;
        uint64_t v33 = v27;
        __int16 v34 = 2112;
        uint64_t v35 = v8;
        _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ state changed, was %@%@", buf, 0x20u);
      }
    }
    if ((v7 & 0x200000) != 0)
    {
      if ((self->_state & 0x200000) != 0)
      {
        [(BRCClientZone *)self disconnectNSMDQListenerAsync];
      }
      else
      {
        osNameRequiredToSync = self->_osNameRequiredToSync;
        self->_osNameRequiredToSync = 0;
      }
    }
    unsigned int v11 = self->_state & 0x201000;
    if ((a4 & 0x201000) != v11)
    {
      if (v11)
      {
        double v12 = [(BRCAccountSession *)self->_session applyScheduler];
        [v12 deleteJobsMatching:self->_serverZone];

        if ((a4 & 0x1000) == 0 && (self->_state & 0x1000) != 0 && [(BRCClientZone *)self isPrivateZone])
        {
          double v13 = [MEMORY[0x1E4F1C9C8] now];
          appUninstalledDate = self->_appUninstalledDate;
          self->_appUninstalledDate = v13;

          [(BRCClientZone *)self setNeedsSave:1];
          [(BRCClientZone *)self _scheduleZoneResetForUninstalledAppIfNecessary];
        }
      }
      else
      {
        if (self->_resetAfterAppUninstallTimer)
        {
          __int16 v15 = brc_bread_crumbs();
          id v16 = brc_default_log();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
            -[BRCClientZone _activateState:origState:]();
          }

          [(BRTimer *)self->_resetAfterAppUninstallTimer stop];
          resetAfterAppUninstallTimer = self->_resetAfterAppUninstallTimer;
          self->_resetAfterAppUninstallTimer = 0;
        }
        BOOL v18 = self->_appUninstalledDate;
        self->_appUninstalledDate = 0;

        [(BRCClientZone *)self setNeedsSave:1];
        uint64_t v19 = [(BRCAccountSession *)self->_session applyScheduler];
        [v19 repopulateJobsForZone:self->_serverZone];

        [(BRCClientZone *)self scheduleSyncDown];
        [(BRCClientZone *)self scheduleSyncUp];
      }
    }
    if ((v7 & 0x400000) != 0)
    {
      uint64_t v20 = self->_session;
      if ([(BRCClientZone *)self isCloudDocsZone])
      {
        sessiouint64_t n = self->_session;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = __42__BRCClientZone__activateState_origState___block_invoke;
        v28[3] = &unk_1E6994878;
        uint64_t v29 = v20;
        [(BRCAccountSession *)session enumeratePrivateClientZones:v28];
        id v22 = v29;
      }
      else
      {
        if (![(BRCClientZone *)self isPrivateZone])
        {
LABEL_31:
          if ([(BRCClientZone *)self isPrivateZone]) {
            [(BRCClientZone *)self _bumpNotificationRankOnTopLevelFolderSharesParentedToZone];
          }
          else {
            [(BRCClientZone *)self _bumpNotificationRankOnTopLevelFolderSharesInZone];
          }

          goto LABEL_35;
        }
        uint64_t v23 = [(BRCClientZone *)self asPrivateClientZone];
        __int16 v24 = [v23 defaultAppLibrary];
        id v22 = [v24 documentsFolderItemID];

        id v25 = [[BRCItemGlobalID alloc] initWithZoneRowID:self->_dbRowID itemID:v22];
        [(BRCAccountSession *)v20 bumpNotificationRankOnItemGlobalID:v25];
      }
      goto LABEL_31;
    }
  }
LABEL_35:
  [(BRCClientZone *)self _flushIdleBlocksIfNeeded];
  return v7;
}

uint64_t __42__BRCClientZone__activateState_origState___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  char v4 = [v3 defaultAppLibrary];
  unsigned int v5 = [v4 documentsFolderItemID];

  uint64_t v6 = [BRCItemGlobalID alloc];
  unsigned int v7 = [v3 dbRowID];

  uint64_t v8 = [(BRCItemGlobalID *)v6 initWithZoneRowID:v7 itemID:v5];
  [*(id *)(a1 + 32) bumpNotificationRankOnItemGlobalID:v8];

  return 1;
}

- (BOOL)setStateBits:(unsigned int)a3
{
  unsigned int state = self->_state;
  BOOL v4 = (a3 & ~state) != 0;
  -[BRCClientZone _activateState:origState:](self, "_activateState:origState:", state | a3);
  return v4;
}

- (void)clearStateBits:(unsigned int)a3
{
}

- (BOOL)isSyncBlocked
{
  if (([(BRCClientZone *)self state] & 0x201000) != 0) {
    LOBYTE(v3) = 1;
  }
  else {
    return ([(BRCServerZone *)self->_serverZone state] >> 1) & 1;
  }
  return v3;
}

- (BOOL)isSyncBlockedBecauseAppNotInstalled
{
  return ([(BRCClientZone *)self state] >> 12) & 1;
}

- (BOOL)isSyncBlockedBecauseOSNeedsUpgrade
{
  return ([(BRCClientZone *)self state] >> 21) & 1;
}

- (BOOL)isEqualToClientZone:(id)a3
{
  BOOL v4 = a3;
  unsigned int v5 = [v4 mangledID];
  if (v5) {
    char v6 = [(BRMangledID *)self->_mangledID isEqualToMangledID:v4[7]];
  }
  else {
    char v6 = 0;
  }

  return v6;
}

- (unint64_t)hash
{
  return [(BRMangledID *)self->_mangledID hash];
}

- (BOOL)isEqual:(id)a3
{
  BOOL v4 = (BRCClientZone *)a3;
  if (self == v4)
  {
    BOOL v5 = 1;
  }
  else
  {
    objc_opt_class();
    BOOL v5 = (objc_opt_isKindOfClass() & 1) != 0 && [(BRCClientZone *)self isEqualToClientZone:v4];
  }

  return v5;
}

- (NSString)description
{
  return (NSString *)[(BRCClientZone *)self descriptionWithContext:0];
}

- (id)descriptionWithContext:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(BRCServerZone *)self->_serverZone changeState];
  if ([(BRCClientZone *)self isForeground])
  {
    char v6 = @"foreground";
    uint64_t v7 = 7;
  }
  else
  {
    char v6 = @"background";
    uint64_t v7 = 2;
  }
  uint64_t v8 = +[BRCDumpContext highlightedString:v6 type:v7 context:v4];
  id v17 = [NSString alloc];
  mangledID = self->_mangledID;
  dbRowID = self->_dbRowID;
  unsigned int v11 = BRCPrettyPrintBitmapWithContext(self->_state, (uint64_t)&local_container_state_entries, v4);
  double v12 = BRCServerZoneStatePrettyPrintWithContext([(BRCServerZone *)self->_serverZone state], v4);
  if ([(BRCClientZone *)self syncState])
  {
    BRCPrettyPrintBitmap();
    double v13 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    double v13 = @"idle";
  }
  __int16 v14 = [v5 descriptionWithContext:v4];
  __int16 v15 = (void *)[v17 initWithFormat:@"<%@[%@] %@ {client:%@ server:%@ sync:%@ %@ rid:%llu appuninstalled:%@}>", mangledID, dbRowID, v8, v11, v12, v13, v14, self->_requestID, self->_appUninstalledDate];

  return v15;
}

- (id)itemByDocumentID:(unsigned int)a3
{
  return [(BRCClientZone *)self itemByDocumentID:*(void *)&a3 db:self->_db];
}

- (id)itemByDocumentID:(unsigned int)a3 db:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __37__BRCClientZone_itemByDocumentID_db___block_invoke;
  v11[3] = &unk_1E6994148;
  v11[4] = self;
  id v12 = v6;
  dbRowID = self->_dbRowID;
  id v8 = v6;
  double v9 = (void *)[v8 fetchObject:v11, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE (item_parent_zone_rowid = %@ OR zone_rowid = %@) AND item_doc_id = %u   AND +item_state IN (0, -1)   AND +item_type IN (1, 2, 8, 6, 7)", dbRowID, dbRowID, v4 sql];

  return v9;
}

id __37__BRCClientZone_itemByDocumentID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)itemByFileID:(unint64_t)a3
{
  return [(BRCClientZone *)self itemByFileID:a3 db:self->_db];
}

- (id)itemByFileID:(unint64_t)a3 db:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __33__BRCClientZone_itemByFileID_db___block_invoke;
  v11[3] = &unk_1E6994148;
  v11[4] = self;
  id v12 = v6;
  dbRowID = self->_dbRowID;
  id v8 = v6;
  double v9 = (void *)[v8 fetchObject:v11, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items  WHERE (item_parent_zone_rowid = %@ OR zone_rowid = %@)     AND item_file_id = %lld    AND item_state IN (0, -1)", dbRowID, dbRowID, a3 sql];

  return v9;
}

id __33__BRCClientZone_itemByFileID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  BOOL v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)serverItemByParentID:(id)a3 andLogicalName:(id)a4
{
  return [(BRCClientZone *)self serverItemByParentID:a3 andLogicalName:a4 db:self->_db];
}

- (id)serverItemByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5
{
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __56__BRCClientZone_serverItemByParentID_andLogicalName_db___block_invoke;
  v7[3] = &unk_1E6994120;
  v7[4] = self;
  BOOL v5 = (void *)[a5 fetchObject:v7, @"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_parent_id = %@ AND item_filename = %@ AND +zone_rowid = %@", a3, a4, self->_dbRowID sql];
  return v5;
}

id __56__BRCClientZone_serverItemByParentID_andLogicalName_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 session];
  uint64_t v7 = (void *)[v6 newServerItemFromPQLResultSet:v5 error:a3];

  return v7;
}

- (id)itemByParentID:(id)a3 andLogicalName:(id)a4
{
  return [(BRCClientZone *)self itemByParentID:a3 andLogicalName:a4 db:self->_db];
}

- (id)itemByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (void *)[v10 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE (item_parent_id = %@ AND item_filename = %@  AND item_state != -2 AND item_parent_zone_rowid = %@        AND item_bouncedname IS NULL)   OR  (item_parent_id = %@ AND item_bouncedname = %@ AND item_state != -2 AND item_parent_zone_rowid = %@)", v8, v9, self->_dbRowID, v8, v9, self->_dbRowID];
  if ([v11 next])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __50__BRCClientZone_itemByParentID_andLogicalName_db___block_invoke;
    v19[3] = &unk_1E6994148;
    v19[4] = self;
    id v20 = v10;
    id v12 = [v11 object:v19];
    if ([v11 next])
    {
      double v13 = brc_bread_crumbs();
      __int16 v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        dbRowID = self->_dbRowID;
        *(_DWORD *)buf = 138413058;
        id v22 = v8;
        __int16 v23 = 2112;
        id v24 = v9;
        __int16 v25 = 2112;
        __int16 v26 = dbRowID;
        __int16 v27 = 2112;
        uint64_t v28 = v13;
        _os_log_fault_impl(&dword_1D353B000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there should never be more than one match for that query (parentID: %@, name: %@, parentZoneID: %@)%@", buf, 0x2Au);
      }
    }
    [v11 close];
    id v15 = v12;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:12 andMessage:@"item not found"];
    [v10 setLastError:v16];

    id v15 = 0;
  }

  return v15;
}

id __50__BRCClientZone_itemByParentID_andLogicalName_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)itemByParentID:(id)a3 andPhysicalName:(id)a4 db:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = (void *)[v10 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE (item_parent_id = %@ AND item_filename = %@ AND item_state != -2 AND item_parent_zone_rowid = %@        AND item_localname IS NULL)   OR  (item_parent_id = %@ AND item_localname = %@ AND item_state != -2 AND item_parent_zone_rowid = %@)", v8, v9, self->_dbRowID, v8, v9, self->_dbRowID];
  if ([v11 next])
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __51__BRCClientZone_itemByParentID_andPhysicalName_db___block_invoke;
    v19[3] = &unk_1E6994148;
    v19[4] = self;
    id v20 = v10;
    id v12 = [v11 object:v19];
    if ([v11 next])
    {
      double v13 = brc_bread_crumbs();
      __int16 v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        dbRowID = self->_dbRowID;
        *(_DWORD *)buf = 138413058;
        id v22 = v8;
        __int16 v23 = 2112;
        id v24 = v9;
        __int16 v25 = 2112;
        __int16 v26 = dbRowID;
        __int16 v27 = 2112;
        uint64_t v28 = v13;
        _os_log_fault_impl(&dword_1D353B000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there should never be more than one match for that query (parentID: %@, name: %@, parentZoneID: %@)%@", buf, 0x2Au);
      }
    }
    [v11 close];
    id v15 = v12;
  }
  else
  {
    id v16 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:12 andMessage:@"item not found"];
    [v10 setLastError:v16];

    id v15 = 0;
  }

  return v15;
}

id __51__BRCClientZone_itemByParentID_andPhysicalName_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  uint64_t v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)itemByParentID:(id)a3 andPhysicalName:(id)a4
{
  return [(BRCClientZone *)self itemByParentID:a3 andPhysicalName:a4 db:self->_db];
}

- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4
{
  return [(BRCClientZone *)self existsByParentID:a3 andLogicalName:a4 db:self->_db];
}

- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4 excludingItemID:(id)a5
{
  return [(BRCClientZone *)self existsByParentID:a3 andLogicalName:a4 excludingItemID:a5 db:self->_db];
}

- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5
{
  return [(BRCClientZone *)self existsByParentID:a3 andLogicalName:a4 excludingItemID:0 db:a5];
}

- (BOOL)existsByParentID:(id)a3 andLogicalName:(id)a4 excludingItemID:(id)a5 db:(id)a6
{
  if (a5)
  {
    unsigned int v11 = (void *)MEMORY[0x1E4FBA8F8];
    id v12 = a6;
    id v13 = a4;
    id v14 = a3;
    [v11 formatInjection:@"AND item_id != %@", a5];
  }
  else
  {
    id v15 = (void *)MEMORY[0x1E4FBA908];
    id v16 = a6;
    id v17 = a4;
    id v18 = a3;
    [v15 rawInjection:"" length:0];
  uint64_t v19 = };
  id v20 = (void *)[a6 numberWithSQL:@"SELECT 1 FROM client_items WHERE ((item_parent_id = %@ AND item_filename = %@ AND item_parent_zone_rowid = %@ AND item_bouncedname IS NULL) OR (item_parent_id = %@ AND item_bouncedname = %@ AND item_parent_zone_rowid = %@)) AND item_state != 1 %@ LIMIT 1", a3, a4, self->_dbRowID, a3, a4, self->_dbRowID, v19];

  char v21 = [v20 BOOLValue];
  return v21;
}

- (BOOL)existsByParentID:(id)a3 andCaseInsensitiveLogicalName:(id)a4
{
  id v4 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT 1 FROM client_items WHERE ((item_parent_id = %@ AND item_filename = %@ COLLATE NOCASE AND item_parent_zone_rowid = %@ AND item_bouncedname IS NULL) OR (item_parent_id = %@ AND item_bouncedname = %@ COLLATE NOCASE AND item_parent_zone_rowid = %@)) AND item_state != 1 LIMIT 1", a3, a4, self->_dbRowID, a3, a4, self->_dbRowID];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (char)serverItemTypeByItemID:(id)a3 db:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isSharedZoneRoot])
  {
    char v8 = 4;
  }
  else if ([v6 isNonDesktopRoot])
  {
    sessiouint64_t n = self->_session;
    id v10 = [v6 appLibraryRowID];
    unsigned int v11 = [(BRCAccountSession *)session appLibraryByRowID:v10];
    int v12 = [v11 state];

    if ((v12 & 0x2000000) != 0) {
      char v8 = 4;
    }
    else {
      char v8 = 9;
    }
  }
  else
  {
    id v13 = [(BRCClientZone *)self dbRowID];
    id v14 = (void *)[v7 numberWithSQL:@"SELECT item_type FROM server_items WHERE item_id = %@ AND zone_rowid = %@", v6, v13];

    if (v14)
    {
      char v8 = [v14 integerValue];
    }
    else if ([v6 isDocumentsFolder])
    {
      id v15 = self->_session;
      id v16 = [v6 appLibraryRowID];
      id v17 = [(BRCAccountSession *)v15 appLibraryByRowID:v16];
      int v18 = [v17 state];

      if ((v18 & 0x4000000) != 0) {
        char v8 = 0;
      }
      else {
        char v8 = 9;
      }
    }
    else
    {
      char v8 = -1;
    }
  }
  return v8;
}

- (id)itemsEnumeratorWithDB:(id)a3
{
  id v4 = a3;
  char v5 = (void *)[v4 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE zone_rowid = %@", self->_dbRowID];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __39__BRCClientZone_itemsEnumeratorWithDB___block_invoke;
  v9[3] = &unk_1E6994148;
  v9[4] = self;
  id v10 = v4;
  id v6 = v4;
  id v7 = [v5 enumerateObjects:v9];

  return v7;
}

id __39__BRCClientZone_itemsEnumeratorWithDB___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  char v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (BOOL)hasItems
{
  id v2 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT 1 FROM client_items WHERE zone_rowid = %@ LIMIT 1", self->_dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)itemsWithInFlightDiffsEnumerator
{
  id v3 = [(BRCPQLConnection *)self->_db fetch:@"SELECT li.rowid, li.zone_rowid, li.item_id, li.item_creator_id, li.item_sharing_options, li.item_side_car_ckinfo, li.item_parent_zone_rowid, li.item_localsyncupstate, li.item_local_diffs, li.item_notifs_rank, li.app_library_rowid, li.item_min_supported_os_rowid, li.item_user_visible, li.item_stat_ckinfo, li.item_state, li.item_type, li.item_mode, li.item_birthtime, li.item_lastusedtime, li.item_favoriterank,li.item_parent_id, li.item_filename, li.item_hidden_ext, li.item_finder_tags, li.item_xattr_signature, li.item_trash_put_back_path, li.item_trash_put_back_parent_id, li.item_alias_target, li.item_creator, li.item_doc_id, li.item_file_id, li.item_generation, li.item_localname, li.item_processing_stamp, li.item_staged_file_id, li.item_staged_generation, li.item_bouncedname, li.item_scope, li.item_tmpbounceno, li.version_name, li.version_ckinfo, li.version_mtime, li.version_size, li.version_thumb_size, li.version_thumb_signature, li.version_content_signature, li.version_xattr_signature, li.version_edited_since_shared, li.version_device, li.version_conflict_loser_etags, li.version_quarantine_info, li.version_uploaded_assets, li.version_upload_error, li.version_old_zone_item_id, li.version_old_zone_rowid, li.desired_version, li.item_live_conflict_loser_etags, li.item_thumb_live_signature, li.item_thumb_greedy, li.version_block_sync_until_bundle_id, li.version_block_sync_until_timestamp FROM client_items AS li INNER JOIN client_sync_up AS su ON su.throttle_id = li.rowid WHERE su.zone_rowid = %@   AND (su.in_flight_diffs BETWEEN -9223372036854775808 AND 9223372036854775807)   AND su.throttle_state != 0", self->_dbRowID];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __49__BRCClientZone_itemsWithInFlightDiffsEnumerator__block_invoke;
  v6[3] = &unk_1E6994120;
  v6[4] = self;
  id v4 = [v3 enumerateObjects:v6];

  return v4;
}

id __49__BRCClientZone_itemsWithInFlightDiffsEnumerator__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  char v8 = [*(id *)(a1 + 32) session];
  id v9 = [v8 clientDB];
  id v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (BOOL)hasItemsWithInFlightDiffs
{
  id v2 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT 1 FROM client_items AS li INNER JOIN client_sync_up AS su ON su.throttle_id = li.rowid WHERE su.zone_rowid = %@   AND (su.in_flight_diffs BETWEEN -9223372036854775808 AND 9223372036854775807)   AND su.throttle_state != 0 LIMIT 1", self->_dbRowID];
  char v3 = [v2 BOOLValue];

  return v3;
}

- (id)documentsNotIdleEnumeratorWithStartingRowID:(unint64_t)a3 batchSize:(unint64_t)a4
{
  id v5 = [(BRCPQLConnection *)self->_db fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE zone_rowid = %@    AND item_type IN (1, 6)    AND (item_localsyncupstate IN(      2,        3,        4))   AND item_scope = 2   AND rowid > %lld ORDER BY rowid ASC LIMIT %lld", self->_dbRowID, a3, a4];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __71__BRCClientZone_documentsNotIdleEnumeratorWithStartingRowID_batchSize___block_invoke;
  v8[3] = &unk_1E6994120;
  v8[4] = self;
  id v6 = [v5 enumerateObjects:v8];

  return v6;
}

id __71__BRCClientZone_documentsNotIdleEnumeratorWithStartingRowID_batchSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  char v8 = [*(id *)(a1 + 32) session];
  id v9 = [v8 clientDB];
  id v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (void)enumerateFaultsAsyncWithBlock:(id)a3 batchSize:(unint64_t)a4
{
  id v6 = a3;
  id v7 = [(BRCClientZone *)self taskTracker];
  char v8 = [(BRCClientZone *)self db];
  id v9 = [v8 serialQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __57__BRCClientZone_enumerateFaultsAsyncWithBlock_batchSize___block_invoke;
  v11[3] = &unk_1E6997628;
  v11[4] = self;
  id v12 = v6;
  unint64_t v13 = a4;
  id v10 = v6;
  brc_task_tracker_async_with_logs(v7, v9, v11, &__block_literal_global_200);
}

uint64_t __57__BRCClientZone_enumerateFaultsAsyncWithBlock_batchSize___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateFaultsWithBlock:*(void *)(a1 + 40) rowID:0 batchSize:*(void *)(a1 + 48)];
}

- (void)_enumerateFaultsWithBlock:(id)a3 rowID:(unint64_t)a4 batchSize:(unint64_t)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  char v8 = (unsigned int (**)(id, void *))a3;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v20 = self;
  unint64_t v21 = a5;
  id v9 = [(BRCClientZone *)self _faultsEnumeratorFromRow:a4 batchSize:a5];
  uint64_t v10 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v27;
    while (2)
    {
      uint64_t v14 = 0;
      uint64_t v15 = v12 + v11;
      do
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v9);
        }
        id v16 = *(void **)(*((void *)&v26 + 1) + 8 * v14);
        if (!v8[2](v8, v16))
        {
          uint64_t v15 = v12 + v14;
          goto LABEL_12;
        }
        a4 = [v16 dbRowID];
        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v26 objects:v30 count:16];
      uint64_t v12 = v15;
      if (v11) {
        continue;
      }
      break;
    }
  }
  else
  {
    uint64_t v15 = 0;
  }
LABEL_12:

  if (v15 == v21)
  {
    id v17 = [(BRCClientZone *)v20 taskTracker];
    int v18 = [(BRCClientZone *)v20 db];
    uint64_t v19 = [v18 serialQueue];
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __59__BRCClientZone__enumerateFaultsWithBlock_rowID_batchSize___block_invoke;
    v22[3] = &unk_1E6997650;
    v22[4] = v20;
    __int16 v23 = v8;
    unint64_t v24 = a4;
    unint64_t v25 = v21;
    brc_task_tracker_async_with_logs(v17, v19, v22, &__block_literal_global_202);
  }
}

uint64_t __59__BRCClientZone__enumerateFaultsWithBlock_rowID_batchSize___block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _enumerateFaultsWithBlock:*(void *)(a1 + 40) rowID:*(void *)(a1 + 48) batchSize:*(void *)(a1 + 56)];
}

- (id)_faultsEnumeratorFromRow:(unint64_t)a3 batchSize:(unint64_t)a4
{
  dbRowID = self->_dbRowID;
  char v8 = self->_db;
  id v9 = [(BRCPQLConnection *)v8 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE zone_rowid = %@    AND rowid > %llu   AND item_type = 2 ORDER BY rowid LIMIT %lu", dbRowID, a3, a4];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __52__BRCClientZone__faultsEnumeratorFromRow_batchSize___block_invoke;
  v12[3] = &unk_1E6994120;
  v12[4] = self;
  uint64_t v10 = [v9 enumerateObjects:v12];

  return v10;
}

id __52__BRCClientZone__faultsEnumeratorFromRow_batchSize___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  char v8 = [*(id *)(a1 + 32) session];
  id v9 = [v8 clientDB];
  uint64_t v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (void)didClearOutOfQuota
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Sync: updated sync-up throttle: %@%@", (void)v3, DWORD2(v3));
}

- (unsigned)syncState
{
  return atomic_load_explicit((atomic_uint *volatile)&self->_syncState, memory_order_acquire);
}

- (void)setSyncStateBits:(unsigned int)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  BOOL v5 = [(BRCClientZone *)self isSyncBlocked];
  if ((a3 & 3) != 0 && v5)
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone setSyncStateBits:]();
    }

    [(BRCClientZone *)self clearSyncStateBits:3];
    a3 &= 0xFFFFFFFC;
  }
  unsigned int v8 = atomic_fetch_or((atomic_uint *volatile)&self->_syncState, a3);
  char v9 = v8 | a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if (v8 != (v8 | a3))
  {
    uint64_t v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      if (v8)
      {
        BRCPrettyPrintBitmap();
        unint64_t v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unint64_t v21 = @"idle";
      }
      int v22 = 138412802;
      __int16 v23 = self;
      __int16 v24 = 2112;
      unint64_t v25 = v21;
      __int16 v26 = 2112;
      long long v27 = v10;
      _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] sync state changed: %@, was %@%@", (uint8_t *)&v22, 0x20u);
    }
    uint64_t v12 = (void *)MEMORY[0x1E4F594A8];
    mangledID = self->_mangledID;
    uint64_t v14 = *MEMORY[0x1E4F592C0];
    if (((v8 | a3) & 0xA) != 0) {
      unsigned int v15 = (2 * ((v9 & 5) != 0)) | 4;
    }
    else {
      unsigned int v15 = 2 * ((v9 & 5) != 0);
    }
    if (v15 <= 1) {
      uint64_t v16 = 1;
    }
    else {
      uint64_t v16 = v15;
    }
    id v17 = [NSNumber numberWithUnsignedInt:v16];
    [v12 postContainerStatusChangeNotificationWithID:mangledID key:v14 value:v17];
  }
  if ((v8 & 0xF) == 0 && (v9 & 0xF) != 0) {
    [(BRCClientZone *)self setStateBits:16];
  }
  if ((v8 & 0x20) != 0 || ((v8 | a3) & 0x20) == 0)
  {
    if ((v9 & 0x23) == 1)
    {
      uint64_t v19 = brc_bread_crumbs();
      id v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone setSyncStateBits:]();
      }

      [(BRCClientZone *)self setSyncStateBits:2];
    }
  }
  else
  {
    [(BRCClientZoneDelegate *)self->_delegate didInitialSyncDownForClientZone:self];
  }
  if ((a3 & ~v8 & 3) != 0) {
    [(BRCDeadlineSource *)self->_syncDeadlineSource signal];
  }
  [(BRCClientZone *)self _flushIdleBlocksIfNeeded];
}

- (void)clearSyncStateBits:(unsigned int)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  unsigned int v4 = atomic_fetch_and((atomic_uint *volatile)&self->_syncState, ~a3);
  unsigned int v5 = v4 & ~a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if (v4 != v5)
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      if (v4)
      {
        BRCPrettyPrintBitmap();
        unsigned int v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        unsigned int v15 = @"idle";
      }
      int v16 = 138412802;
      id v17 = self;
      __int16 v18 = 2112;
      uint64_t v19 = v15;
      __int16 v20 = 2112;
      unint64_t v21 = v6;
      _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ sync state changed, was %@%@", (uint8_t *)&v16, 0x20u);
    }
    unsigned int v8 = (void *)MEMORY[0x1E4F594A8];
    mangledID = self->_mangledID;
    uint64_t v10 = *MEMORY[0x1E4F592C0];
    if ((v5 & 0xA) != 0) {
      unsigned int v11 = (2 * ((v5 & 5) != 0)) | 4;
    }
    else {
      unsigned int v11 = 2 * ((v5 & 5) != 0);
    }
    if (v11 <= 1) {
      uint64_t v12 = 1;
    }
    else {
      uint64_t v12 = v11;
    }
    uint64_t v13 = [NSNumber numberWithUnsignedInt:v12];
    [v8 postContainerStatusChangeNotificationWithID:mangledID key:v10 value:v13];
  }
  if ((v4 & 0xF) != 0 && (v5 & 0xF) == 0) {
    [(BRCClientZone *)self clearStateBits:16];
  }
}

- (void)addSyncDownDependency:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 completionBlock];
  objc_initWeak(&location, v4);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__BRCClientZone_addSyncDownDependency___block_invoke;
  v12[3] = &unk_1E6997678;
  id v6 = v5;
  v12[4] = self;
  id v13 = v6;
  objc_copyWeak(&v14, &location);
  [v4 setCompletionBlock:v12];
  id v7 = [(BRCAccountSession *)self->_session clientDB];
  unsigned int v8 = [v7 serialQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__BRCClientZone_addSyncDownDependency___block_invoke_2;
  v10[3] = &unk_1E6993628;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __39__BRCClientZone_addSyncDownDependency___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  long long v3 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 removeSyncDownDependency:WeakRetained];
}

void __39__BRCClientZone_addSyncDownDependency___block_invoke_2(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 440) addObject:*(void *)(a1 + 40)];
  uint64_t v2 = brc_bread_crumbs();
  long long v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    id v11 = v2;
    _os_log_debug_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] added %@ as a sync-down dependency of %@%@", (uint8_t *)&v6, 0x20u);
  }
}

- (void)addOutOfBandOperation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 completionBlock];
  objc_initWeak(&location, v4);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __39__BRCClientZone_addOutOfBandOperation___block_invoke;
  v12[3] = &unk_1E6997678;
  id v6 = v5;
  v12[4] = self;
  id v13 = v6;
  objc_copyWeak(&v14, &location);
  [v4 setCompletionBlock:v12];
  uint64_t v7 = [(BRCAccountSession *)self->_session clientDB];
  __int16 v8 = [v7 serialQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __39__BRCClientZone_addOutOfBandOperation___block_invoke_2;
  v10[3] = &unk_1E6993628;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_async(v8, v10);

  objc_destroyWeak(&v14);
  objc_destroyWeak(&location);
}

void __39__BRCClientZone_addOutOfBandOperation___block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 40);
  if (v2) {
    (*(void (**)(void))(v2 + 16))();
  }
  long long v3 = *(void **)(a1 + 32);
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  [v3 removeOutOfBandOperation:WeakRetained];
}

void __39__BRCClientZone_addOutOfBandOperation___block_invoke_2(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 456) addObject:*(void *)(a1 + 40)];
  uint64_t v1 = brc_bread_crumbs();
  uint64_t v2 = brc_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __39__BRCClientZone_addOutOfBandOperation___block_invoke_2_cold_1();
  }
}

- (void)removeOutOfBandOperation:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSession *)self->_session clientDB];
  id v6 = [v5 serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__BRCClientZone_removeOutOfBandOperation___block_invoke;
  v8[3] = &unk_1E6993628;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __42__BRCClientZone_removeOutOfBandOperation___block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 456) removeObject:*(void *)(a1 + 40)];
  uint64_t v1 = brc_bread_crumbs();
  uint64_t v2 = brc_default_log();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEBUG)) {
    __42__BRCClientZone_removeOutOfBandOperation___block_invoke_cold_1();
  }
}

- (void)_cancelOutOfBandOperations
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v3 = self->_outOfBandSyncOperations;
  uint64_t v4 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "cancel", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [(NSMutableArray *)v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)removeSyncDownDependency:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSession *)self->_session clientDB];
  uint64_t v6 = [v5 serialQueue];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __42__BRCClientZone_removeSyncDownDependency___block_invoke;
  v8[3] = &unk_1E6993628;
  v8[4] = self;
  id v9 = v4;
  id v7 = v4;
  dispatch_async(v6, v8);
}

void __42__BRCClientZone_removeSyncDownDependency___block_invoke(uint64_t a1)
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)(a1 + 32) + 440) removeObject:*(void *)(a1 + 40)];
  uint64_t v2 = brc_bread_crumbs();
  long long v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v5 = *(void *)(a1 + 32);
    uint64_t v4 = *(void *)(a1 + 40);
    int v6 = 138412802;
    uint64_t v7 = v4;
    __int16 v8 = 2112;
    uint64_t v9 = v5;
    __int16 v10 = 2112;
    long long v11 = v2;
    _os_log_debug_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] removed %@ as a sync-down dependency of %@%@", (uint8_t *)&v6, 0x20u);
  }
}

- (id)syncDownImmediately
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  memset(v34, 0, sizeof(v34));
  __brc_create_section(1, (uint64_t)"-[BRCClientZone syncDownImmediately]", 1740, v34);
  long long v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    uint64_t v5 = v34[0];
    int v6 = [(BRCClientZone *)self mangledID];
    *(_DWORD *)buf = 134218498;
    uint64_t v37 = v5;
    __int16 v38 = 2112;
    long long v39 = v6;
    __int16 v40 = 2112;
    long long v41 = v3;
    _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_INFO, "[INFO] ┏%llx %@: starting sync down%@", buf, 0x20u);
  }
  if (self->_activated)
  {
    uint64_t v7 = [(BRCAccountSession *)self->_session serverState];
    mangledID = self->_mangledID;
    id v33 = 0;
    uint64_t v28 = [v7 migrationQueryKeyForMangledID:mangledID continuationCursor:&v33];
    id v27 = v33;

    uint64_t v9 = self;
    objc_sync_enter(v9);
    if (v28) {
      __int16 v10 = [[BRCMigrationQueryOperation alloc] initWithServerZone:v9->_serverZone migrationKey:v28 continuationCursor:v27 sessionContext:self->_session];
    }
    else {
      __int16 v10 = [[BRCSyncDownOperation alloc] initDeltaSyncWithServerZone:v9->_serverZone sessionContext:self->_session];
    }
    syncDownOperatiouint64_t n = v9->_syncDownOperation;
    v9->_syncDownOperatiouint64_t n = &v10->super;

    [(BRCClientZone *)v9 _blockSyncDownOnStitchingOperations];
    objc_sync_exit(v9);

    if (v9->_syncDownGroup)
    {
      -[_BRCOperation setGroup:](v9->_syncDownOperation, "setGroup:");
    }
    else
    {
      if ([(BRCServerZone *)v9->_serverZone hasFetchedServerZoneState]) {
        objc_msgSend(MEMORY[0x1E4F1A218], "br_syncDown");
      }
      else {
      id v14 = objc_msgSend(MEMORY[0x1E4F1A218], "br_syncDownInitial");
      }
      -[_BRCOperation setGroup:](v9->_syncDownOperation, "setGroup:", v14, v27);
    }
    if (v28)
    {
      syncDownGroup = v9->_syncDownGroup;
      v9->_syncDownGroup = 0;
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    int v16 = v9->_syncDownDependencies;
    uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v29 objects:v35 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v30;
      do
      {
        uint64_t v19 = 0;
        do
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v29 + 1) + 8 * v19);
          unint64_t v21 = brc_bread_crumbs();
          uint64_t v22 = brc_default_log();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v37 = v20;
            __int16 v38 = 2112;
            long long v39 = v21;
            _os_log_debug_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] adding sync down dependency: %@%@", buf, 0x16u);
          }

          [(_BRCOperation *)v9->_syncDownOperation addDependency:v20];
          ++v19;
        }
        while (v17 != v19);
        uint64_t v17 = [(NSMutableArray *)v16 countByEnumeratingWithState:&v29 objects:v35 count:16];
      }
      while (v17);
    }

    [(NSMutableArray *)v9->_currentSyncDownBarriers addObjectsFromArray:v9->_nextSyncDownBarriers];
    [(NSMutableArray *)v9->_nextSyncDownBarriers removeAllObjects];
    [(BRCClientZone *)v9 setSyncStateBits:8];
    [(BRCClientZone *)v9 clearSyncStateBits:2];
    [(BRCSyncOperationThrottle *)v9->_syncDownThrottle updateAfterSchedulingTask];
    __int16 v23 = brc_bread_crumbs();
    __int16 v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone syncDownImmediately]();
    }

    [(BRCClientZone *)v9 _cancelOutOfBandOperations];
    [(_BRCOperation *)v9->_syncDownOperation schedule];
    unint64_t v25 = v9->_syncDownOperation;
    v9->_syncDeadlineSourceResumer = v25;
    uint64_t v12 = v25;
    long long v11 = v28;
  }
  else
  {
    brc_bread_crumbs();
    id v27 = (id)objc_claimAutoreleasedReturnValue();
    long long v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone syncDownImmediately]();
    }
    uint64_t v12 = 0;
  }

  __brc_leave_section(v34);
  return v12;
}

- (unsigned)_appLibrariesState
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (![(BRCClientZone *)self isPrivateZone]) {
    return 0;
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v3 = [(BRCClientZone *)self asPrivateClientZone];
  uint64_t v4 = [v3 appLibraries];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    unsigned int v7 = 0;
    uint64_t v8 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v4);
        }
        v7 |= [*(id *)(*((void *)&v11 + 1) + 8 * i) state];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v6);
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

- (void)_startSync
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _syncDownOperation == nil%@", v2, v3, v4, v5, v6);
}

BOOL __27__BRCClientZone__startSync__block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  brc_current_date_nsec();
  unint64_t v29 = 0;
  uint64_t v4 = *(void *)(a1 + 32);
  uint8_t v6 = *(void **)(v4 + 8);
  uint64_t v5 = *(void *)(v4 + 16);
  unsigned int v7 = [v6 syncUpScheduler];
  LODWORD(v8) = *(_DWORD *)(a1 + 64);
  uint64_t v9 = +[BRCSyncUpOperation syncUpOperationForZone:v5 sessionContext:v6 syncUpCallback:v7 maxCost:&v29 retryAfter:v8];
  uint64_t v10 = *(void *)(*(void *)(a1 + 40) + 8);
  long long v11 = *(void **)(v10 + 40);
  *(void *)(v10 + 40) = v9;

  long long v12 = objc_msgSend(MEMORY[0x1E4F1A218], "br_syncUp");
  [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setGroup:v12];

  objc_storeStrong((id *)(*(void *)(a1 + 32) + 104), *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
  brc_current_date_nsec();
  uint64_t v13 = *(void *)(*(void *)(a1 + 32) + 104);
  if (v13)
  {
    long long v14 = brc_bread_crumbs();
    unsigned int v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __27__BRCClientZone__startSync__block_invoke_cold_1();
    }

    [*(id *)(a1 + 32) setSyncStateBits:4];
    objc_initWeak(&location, *(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40));
    v25[0] = MEMORY[0x1E4F143A8];
    v25[1] = 3221225472;
    v25[2] = __27__BRCClientZone__startSync__block_invoke_210;
    v25[3] = &unk_1E69976C8;
    objc_copyWeak(&v27, &location);
    v25[4] = *(void *)(a1 + 32);
    id v16 = v3;
    id v26 = v16;
    [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) setSyncUpCompletionBlock:v25];
    [v16 forceBatchStart];
    [v16 makeNextFlushFullSync];

    objc_destroyWeak(&v27);
    objc_destroyWeak(&location);
  }
  else
  {
    if (v29 < 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v20 = brc_bread_crumbs();
      unint64_t v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        __27__BRCClientZone__startSync__block_invoke_cold_3();
      }

      uint64_t v19 = v29 + *(void *)(a1 + 56);
    }
    else
    {
      uint64_t v17 = brc_bread_crumbs();
      uint64_t v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
        __27__BRCClientZone__startSync__block_invoke_cold_2();
      }

      [*(id *)(a1 + 32) clearSyncStateBits:1];
      uint64_t v19 = 0x7FFFFFFFFFFFFFFFLL;
    }
    *(void *)(*(void *)(a1 + 32) + 88) = v19;
    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = *(void *)(*(void *)(a1 + 32) + 88);
    uint64_t v22 = *(void **)(*(void *)(a1 + 32) + 152);
    brc_interval_from_nsec();
    [v22 updateAfterSchedulingTaskWithMinimumDelay:v23 * 10.0];
  }

  return v13 != 0;
}

void __27__BRCClientZone__startSync__block_invoke_210(uint64_t a1, void *a2, void *a3, void *a4)
{
  id v7 = a2;
  id v8 = a3;
  id v9 = a4;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 48));
  long long v11 = WeakRetained;
  if (WeakRetained)
  {
    id v25 = v7;
    long long v12 = [WeakRetained createdAppLibraryNames];
    char v24 = [v11 encounteredErrorOnPCSChainedItem];
    char v13 = [v11 throttledItemInBatch];
    int v14 = objc_msgSend(v9, "brc_isCloudKitOutOfQuota");
    unsigned int v15 = [*(id *)(*(void *)(a1 + 32) + 8) fsUploader];
    id v16 = [*(id *)(a1 + 32) serverZone];
    uint64_t v17 = [v16 ownerName];
    if (v14) {
      [v15 ownerDidReceiveOutOfQuotaError:v17];
    }
    else {
      [v15 scheduleQuotaFetchIfNeededForOwner:v17];
    }

    id v7 = v25;
    char v18 = v24;
  }
  else
  {
    char v18 = 0;
    char v13 = 0;
    long long v12 = 0;
  }
  uint64_t v19 = *(void **)(a1 + 40);
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = __27__BRCClientZone__startSync__block_invoke_2;
  v26[3] = &unk_1E69976A0;
  id v27 = v7;
  id v28 = v8;
  id v29 = v12;
  id v30 = v9;
  char v31 = v18;
  char v32 = v13;
  id v20 = v9;
  id v21 = v12;
  id v22 = v8;
  id v23 = v7;
  [v19 performWithFlags:4 action:v26];
}

uint64_t __27__BRCClientZone__startSync__block_invoke_2(uint64_t a1)
{
  return 1;
}

uint64_t __27__BRCClientZone__startSync__block_invoke_214(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  if (*(void *)(v2 + 104))
  {
    [*(id *)(v2 + 152) updateAfterSchedulingTask];
  }
  else
  {
    id v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __27__BRCClientZone__startSync__block_invoke_214_cold_2(a1);
    }

    if (([*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) isCancelled] & 1) == 0)
    {
      uint64_t v5 = brc_bread_crumbs();
      uint8_t v6 = brc_default_log();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
        __27__BRCClientZone__startSync__block_invoke_214_cold_1();
      }

      [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) cancel];
    }
  }
  [*(id *)(a1 + 32) _cancelOutOfBandOperations];
  return [*(id *)(*(void *)(*(void *)(a1 + 40) + 8) + 40) schedule];
}

- (void)scheduleSyncUp
{
  self->_syncUpRetryAfter = 0;
}

- (void)scheduleSyncDownWithGroup:(id)a3
{
  id v5 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if (!self->_syncDownGroup) {
    objc_storeStrong((id *)&self->_syncDownGroup, a3);
  }
  [(BRCClientZone *)self setSyncStateBits:2];
}

- (void)scheduleSyncDown
{
}

- (void)scheduleSyncDownFirst
{
  [(BRCPQLConnection *)self->_db assertOnQueue];
  [(BRCClientZone *)self setSyncStateBits:66];
}

- (void)scheduleSyncDownForOOBModifyRecordsAck
{
  [(BRCPQLConnection *)self->_db assertOnQueue];
  [(BRCClientZone *)self setSyncStateBits:194];
}

- (void)resetSyncBudgetAndThrottle
{
  [(BRCPQLConnection *)self->_db assertOnQueue];
  lastSyncDownError = self->_lastSyncDownError;
  self->_lastSyncDownError = 0;

  lastSyncUpError = self->_lastSyncUpError;
  self->_lastSyncUpError = 0;

  [(BRCSyncBudgetThrottle *)self->_syncUpBudget clear];
  [(BRCSyncOperationThrottle *)self->_syncUpThrottle clear];
  [(BRCSyncOperationBackoffRatio *)self->_syncUpBackoffRatio clear];
  [(BRCSyncOperationThrottle *)self->_syncDownThrottle clear];
  syncDeadlineSource = self->_syncDeadlineSource;
  [(BRCDeadlineSource *)syncDeadlineSource signal];
}

- (void)clearSyncUpError
{
  lastSyncUpError = self->_lastSyncUpError;
  self->_lastSyncUpError = 0;
}

- (void)prepareDirectoryForSyncUp:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (([v4 isKnownByServer] & 1) == 0
    && ([v4 localDiffs] & 0x400000000000000) == 0
    && ([(BRCServerZone *)self->_serverZone state] & 4) == 0)
  {
    id v5 = brc_bread_crumbs();
    uint8_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v4;
      __int16 v12 = 2112;
      char v13 = v5;
      _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[NOTICE] Item %@ isn't known by the server so marking it as created by the current device%@", (uint8_t *)&v10, 0x16u);
    }

    id v7 = self->_directoriesCreatedLastSyncUp;
    objc_sync_enter(v7);
    directoriesCreatedLastSyncUp = self->_directoriesCreatedLastSyncUp;
    id v9 = [v4 itemID];
    [(NSMutableArray *)directoriesCreatedLastSyncUp addObject:v9];

    objc_sync_exit(v7);
  }
}

- (id)directoryItemIDsCreatedLastSyncUp
{
  id v3 = self->_directoriesCreatedLastSyncUp;
  objc_sync_enter(v3);
  if ([(NSMutableArray *)self->_directoriesCreatedLastSyncUp count])
  {
    id v4 = (void *)[(NSMutableArray *)self->_directoriesCreatedLastSyncUp copy];
    [(NSMutableArray *)self->_directoriesCreatedLastSyncUp removeAllObjects];
  }
  else
  {
    id v4 = 0;
  }
  objc_sync_exit(v3);

  return v4;
}

- (void)_markLatestSyncRequestFailed
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(BRCClientZone *)self itemsWithInFlightDiffsEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v11;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v10 + 1) + 8 * v7);
        id v9 = [(BRCServerZone *)self->_serverZone dbRowID];
        [v8 markLatestSyncRequestFailedInZone:v9];

        [v8 saveToDB];
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v5);
  }

  [(BRCClientZone *)self _markRequestIDAcked];
}

- (void)_markRequestIDAcked
{
  self->_requestID |= 1uLL;
}

- (unint64_t)allocateSyncUpRequestID
{
  self->_requestID = (self->_requestID | 1) + 1;
  [(BRCClientZone *)self setSyncStateBits:256];
  return self->_requestID;
}

- (void)learnCKInfosFromSavedRecords:(id)a3 isOutOfBandModifyRecords:(BOOL)a4
{
  BOOL v74 = a4;
  uint64_t v100 = *MEMORY[0x1E4F143B8];
  long long v87 = 0u;
  long long v88 = 0u;
  long long v89 = 0u;
  long long v90 = 0u;
  id obj = a3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v87 objects:v99 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v82 = *(void *)v88;
    uint64_t v81 = self;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v88 != v82) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v87 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1D9438760]();
        long long v10 = [[BRFieldCKInfo alloc] initWithRecord:v8];
        long long v11 = [v8 recordID];
        long long v12 = objc_msgSend(v11, "brc_itemIDWithSession:", self->_session);

        long long v13 = objc_msgSend(v8, "brc_updateDroppedReason");
        uint64_t v14 = objc_msgSend(v8, "brc_oplockMergeEtag");
        uint64_t v15 = (void *)v14;
        if (v13)
        {
          id v16 = brc_bread_crumbs();
          uint64_t v17 = brc_default_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            char v18 = [v8 recordID];
            *(_DWORD *)buf = 138412802;
            long long v92 = v18;
            __int16 v93 = 2112;
            long long v94 = v13;
            __int16 v95 = 2112;
            long long v96 = v16;
            _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Not learning anything about %@ because the update was dropped: %@%@", buf, 0x20u);
          }
LABEL_12:

          self = v81;
          goto LABEL_13;
        }
        if (v14)
        {
          id v16 = brc_bread_crumbs();
          uint64_t v17 = brc_default_log();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
          {
            [v8 recordID];
            id v28 = v79 = v6;
            id v29 = [v8 etag];
            *(_DWORD *)buf = 138413058;
            long long v92 = v28;
            __int16 v93 = 2112;
            long long v94 = v15;
            __int16 v95 = 2112;
            long long v96 = v29;
            __int16 v97 = 2112;
            long long v98 = v16;
            _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Not learning anything about %@ because the server merged ETag %@ to produce %@%@", buf, 0x2Au);

            uint64_t v6 = v79;
          }
          goto LABEL_12;
        }
        if (v12)
        {
          if (([v12 isNonDesktopRoot] & 1) == 0)
          {
            uint64_t v19 = [(BRFieldCKInfo *)v10 etag];
            uint64_t v20 = [v19 length];

            self = v81;
            if (v20)
            {
              v85[0] = MEMORY[0x1E4F143A8];
              v85[1] = 3221225472;
              v85[2] = __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke;
              v85[3] = &unk_1E6994080;
              id v21 = v10;
              v86 = v21;
              v78 = (void *)MEMORY[0x1D94389C0](v85);
              v83[0] = MEMORY[0x1E4F143A8];
              v83[1] = 3221225472;
              v83[2] = __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke_217;
              v83[3] = &unk_1E6994080;
              uint64_t v75 = v21;
              uint64_t v84 = v75;
              v77 = (void *)MEMORY[0x1D94389C0](v83);
              id v22 = [v8 recordType];
              int v23 = [v22 isEqualToString:@"structure"];

              if (v23)
              {
                id v24 = [(PQLConnection *)v81->_db numberWithSQL:@"SELECT item_stat_ckinfo IS NULL FROM client_items  WHERE zone_rowid = %@ AND item_id = %@    AND item_type IN (1, 2, 8, 5, 6, 7)", v81->_dbRowID, v12];
                uint64_t v71 = brc_bread_crumbs();
                id v25 = brc_default_log();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
                {
                  __int16 v70 = [(BRFieldCKInfo *)v75 etag];
                  *(_DWORD *)buf = 138412802;
                  long long v92 = v12;
                  __int16 v93 = 2112;
                  long long v94 = v70;
                  __int16 v95 = 2112;
                  long long v96 = v71;
                  _os_log_debug_impl(&dword_1D353B000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] Learn structural ETag for %@: %@%@", buf, 0x20u);
                }
                uint64_t v72 = v24;
                if ([v24 BOOLValue])
                {
                  id v26 = [(BRCClientZone *)v81 itemByItemID:v12];
                  id v27 = [v26 st];
                  [v27 setCkInfo:v75];

                  [v26 saveToDB];
                  goto LABEL_24;
                }
                self = v81;
                db = v81->_db;
                __int16 v34 = (void *)MEMORY[0x1D94389C0](v78);
                [(BRCPQLConnection *)db execute:@"UPDATE client_items SET item_stat_ckinfo = call_block(%p, item_stat_ckinfo, version_old_zone_item_id IS NOT NULL) WHERE zone_rowid = %@ AND item_id = %@", v34, v81->_dbRowID, v12];

                if (![(BRCPQLConnection *)v81->_db changes])
                {
                  uint64_t v35 = [v8 recordID];
                  uint64_t v36 = [v35 recordName];
                  int v37 = [v36 hasPrefix:@"documentStructure/"];

                  self = v81;
                  if (v37)
                  {
                    __int16 v38 = brc_bread_crumbs();
                    long long v39 = brc_default_log();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      long long v92 = v12;
                      __int16 v93 = 2112;
                      long long v94 = v38;
                      _os_log_impl(&dword_1D353B000, v39, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't locate the item to learn stat info for %@, checking to see if it has undergone a CZM%@", buf, 0x16u);
                    }

                    __int16 v40 = v81->_db;
                    id v26 = (void *)MEMORY[0x1D94389C0](v77);
                    [(BRCPQLConnection *)v40 execute:@"UPDATE client_items SET item_stat_ckinfo = call_block(%p, item_stat_ckinfo) WHERE version_old_zone_rowid = %@ AND version_old_zone_item_id = %@", v26, v81->_dbRowID, v12];
LABEL_24:

                    self = v81;
                  }
                }
LABEL_48:
              }
              else
              {
                id v30 = [v8 recordType];
                int v31 = [v30 isEqualToString:@"content"];

                if (v31)
                {
                  char v32 = v81;
                  int v67 = objc_msgSend(v8, "brc_currentUserOwnsLastEditorDeviceWithSessionContext:", v81->_session);
                  if (v67)
                  {
                    v73 = objc_msgSend(v8, "brc_lastEditorDeviceName");
                    uint64_t v33 = -[BRCAccountSession deviceKeyForName:db:](v81->_session, "deviceKeyForName:db:");
                  }
                  else
                  {
                    long long v45 = [(BRCAccountSession *)v81->_session cachedCurrentUserRecordName];
                    uint64_t v46 = objc_msgSend(v8, "brc_lastModifiedUserRecordNameWithCurrentUserRecordName:personNameComponents:", v45, 0);

                    __int16 v68 = NSNumber;
                    v73 = (void *)v46;
                    long long v47 = [(BRCAccountSession *)v81->_session userKeyForOwnerName:v46 db:v81->_db];
                    uint64_t v33 = objc_msgSend(v68, "numberWithLongLong:", -objc_msgSend(v47, "longLongValue"));

                    char v32 = v81;
                  }

                  uint64_t v72 = (void *)v33;
                  if (v33)
                  {
                    v69 = brc_bread_crumbs();
                    long long v48 = brc_default_log();
                    if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
                    {
                      id v61 = [(BRFieldCKInfo *)v75 etag];
                      if (v67) {
                        objc_msgSend(v8, "brc_lastEditorDeviceName");
                      }
                      else {
                      uint64_t v64 = [v8 modifiedByDevice];
                      }
                      *(_DWORD *)buf = 138413058;
                      long long v92 = v12;
                      __int16 v93 = 2112;
                      long long v94 = v61;
                      __int16 v95 = 2112;
                      long long v96 = v64;
                      __int16 v97 = 2112;
                      long long v98 = v69;
                      _os_log_debug_impl(&dword_1D353B000, v48, OS_LOG_TYPE_DEBUG, "[DEBUG] Learn content ETag and Last Editor for %@: %@, %@%@", buf, 0x2Au);

                      char v32 = v81;
                    }

                    long long v49 = v32->_db;
                    long long v50 = v32;
                    long long v51 = (void *)MEMORY[0x1D94389C0](v78);
                    [(BRCPQLConnection *)v49 execute:@"UPDATE client_items SET version_ckinfo = call_block(%p, version_ckinfo, version_old_zone_item_id IS NOT NULL), version_device = %@ WHERE zone_rowid = %@ AND item_id = %@", v51, v72, v50->_dbRowID, v12];
                  }
                  else
                  {
                    long long v52 = brc_bread_crumbs();
                    long long v53 = brc_default_log();
                    if (os_log_type_enabled(v53, OS_LOG_TYPE_DEBUG))
                    {
                      uint64_t v63 = [(BRFieldCKInfo *)v75 etag];
                      *(_DWORD *)buf = 138412802;
                      long long v92 = v12;
                      __int16 v93 = 2112;
                      long long v94 = v63;
                      __int16 v95 = 2112;
                      long long v96 = v52;
                      _os_log_debug_impl(&dword_1D353B000, v53, OS_LOG_TYPE_DEBUG, "[DEBUG] Learn content ETag for %@: %@%@", buf, 0x20u);
                    }
                    long long v50 = v81;
                    long long v54 = v81->_db;
                    long long v51 = (void *)MEMORY[0x1D94389C0](v78);
                    [(BRCPQLConnection *)v54 execute:@"UPDATE client_items SET version_ckinfo = call_block(%p, version_ckinfo, version_old_zone_item_id IS NOT NULL) WHERE zone_rowid = %@ AND item_id = %@", v51, v81->_dbRowID, v12, v66];
                  }

                  self = v50;
                  if (![(BRCPQLConnection *)v50->_db changes])
                  {
                    long long v55 = brc_bread_crumbs();
                    long long v56 = brc_default_log();
                    if (os_log_type_enabled(v56, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)buf = 138412546;
                      long long v92 = v12;
                      __int16 v93 = 2112;
                      long long v94 = v55;
                      _os_log_impl(&dword_1D353B000, v56, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't locate the item to learn version info for %@, checking to see if it has undergone a CZM%@", buf, 0x16u);
                    }

                    uint64_t v57 = v81->_db;
                    uint64_t v58 = (void *)MEMORY[0x1D94389C0](v77);
                    v59 = v57;
                    self = v81;
                    [(BRCPQLConnection *)v59 execute:@"UPDATE client_items SET version_ckinfo = call_block(%p, version_ckinfo) WHERE version_old_zone_rowid = %@ AND version_old_zone_item_id = %@", v58, v81->_dbRowID, v12];
                  }
                  goto LABEL_48;
                }
                long long v41 = [v8 recordType];
                int v42 = [v41 isEqualToString:@"perParticipantMetadata"];

                self = v81;
                if (v42)
                {
                  long long v43 = brc_bread_crumbs();
                  long long v44 = brc_default_log();
                  if (os_log_type_enabled(v44, OS_LOG_TYPE_DEBUG))
                  {
                    uint64_t v62 = [(BRFieldCKInfo *)v75 etag];
                    *(_DWORD *)buf = 138412802;
                    long long v92 = v12;
                    __int16 v93 = 2112;
                    long long v94 = v62;
                    __int16 v95 = 2112;
                    long long v96 = v43;
                    _os_log_debug_impl(&dword_1D353B000, v44, OS_LOG_TYPE_DEBUG, "[DEBUG] Learn side-car ETag for %@: %@%@", buf, 0x20u);
                  }
                  self = v81;
                  [(BRCPQLConnection *)v81->_db execute:@"UPDATE client_items SET item_side_car_ckinfo = %@ WHERE zone_rowid = %@ AND item_id = %@", v75, v81->_dbRowID, v12];
                }
              }
              if (v74)
              {
                v60 = [(BRCClientZone *)self itemByItemID:v12];
                [v60 scheduleSyncDownForOOBModifyRecordsAck];
                [v60 saveToDB];

                self = v81;
              }

              id v16 = v86;
LABEL_13:
            }
          }
        }

        ++v7;
      }
      while (v6 != v7);
      uint64_t v65 = [obj countByEnumeratingWithState:&v87 objects:v99 count:16];
      uint64_t v6 = v65;
    }
    while (v65);
  }
}

void __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke(uint64_t a1, sqlite3_context *a2, int a3, uint64_t a4)
{
  if (a3 != 2)
  {
    long long v10 = brc_bread_crumbs();
    long long v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke_cold_1();
    }
  }
  if (sqlite3_value_int(*(sqlite3_value **)(a4 + 8)))
  {
    id v7 = +[BRFieldCKInfo newFromSqliteValue:*(void *)a4];
    id v8 = [v7 etagBeforeCrossZoneMove];
    [*(id *)(a1 + 32) setEtagBeforeCrossZoneMove:v8];
  }
  id v9 = [*(id *)(a1 + 32) data];
  sqlite3_result_blob(a2, (const void *)[v9 bytes], objc_msgSend(v9, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

void __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke_217(uint64_t a1, sqlite3_context *a2, int a3, void *a4)
{
  if (a3 != 1)
  {
    long long v12 = brc_bread_crumbs();
    long long v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      __recursive_table_recreate_schema_block_invoke_cold_1();
    }
  }
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke_217_cold_1();
  }

  id v9 = +[BRFieldCKInfo newFromSqliteValue:*a4];
  long long v10 = [*(id *)(a1 + 32) etag];
  [v9 setEtagBeforeCrossZoneMove:v10];

  id v11 = [v9 data];
  sqlite3_result_blob(a2, (const void *)[v11 bytes], objc_msgSend(v11, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (void)_syncUpOfRecords:(id)a3 createdAppLibraryNames:(id)a4 didFinishWithError:(id)a5 errorWasOnPCSChainedItem:(BOOL)a6 throttledItemInBatch:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  uint64_t v14 = (__CFString *)a5;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  memset(v59, 0, sizeof(v59));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone _syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:]", 2363, v59);
  uint64_t v15 = brc_bread_crumbs();
  id v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v47 = v59[0];
    [(BRCSyncUpOperation *)self->_syncUpOperation cost];
    float v49 = v48;
    uint64_t v50 = [v12 count];
    *(_DWORD *)buf = 134219266;
    long long v51 = @"(successful)";
    unint64_t v62 = v47;
    if (v14) {
      long long v51 = v14;
    }
    __int16 v63 = 2112;
    uint64_t v64 = self;
    __int16 v65 = 2048;
    double v66 = v49;
    __int16 v67 = 2048;
    uint64_t v68 = v50;
    __int16 v69 = 2112;
    __int16 v70 = v51;
    __int16 v71 = 2112;
    uint64_t v72 = v15;
    _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Sync: completed sync up for %@, cost:%.1f, itemCount:%llu %@%@", buf, 0x3Eu);
  }

  if (!v14)
  {
    uint64_t v17 = [(BRCAccountSession *)self->_session containerScheduler];
    char v18 = [v17 syncUpBudget];
    [(BRCSyncUpOperation *)self->_syncUpOperation cost];
    objc_msgSend(v18, "consume:");

    syncUpBudget = self->_syncUpBudget;
    [(BRCSyncUpOperation *)self->_syncUpOperation cost];
    -[BRCSyncBudgetThrottle consume:](syncUpBudget, "consume:");
    [(BRCClientZone *)self _increaseSyncUpBatchSizeAfterSuccess];
  }
  syncUpOperatiouint64_t n = self->_syncUpOperation;
  self->_syncUpOperatiouint64_t n = 0;

  objc_storeStrong((id *)&self->_lastSyncUpError, a5);
  self->_lastSyncUpErrorWasOnChainedIteuint64_t m = a6;
  [(BRCSyncOperationBackoffRatio *)self->_syncUpBackoffRatio newSyncOperationWithError:v14];
  if ([(__CFString *)v14 brc_containsCloudKitErrorCode:27])
  {
    id v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:]();
    }

    [(BRCClientZone *)self _decreaseSyncUpBatchSizeAfterError];
  }
  if (v14)
  {
    if ([(__CFString *)v14 brc_isResetError])
    {
      brc_bread_crumbs();
      double v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      id v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone _syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:]((uint64_t)self);
      }
    }
    else if ([(__CFString *)v14 brc_isCloudKitErrorRequiringAssetRescan])
    {
      brc_bread_crumbs();
      double v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      id v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        unint64_t requestID = self->_requestID;
        *(_DWORD *)buf = 134218498;
        unint64_t v62 = requestID;
        __int16 v63 = 2112;
        uint64_t v64 = (BRCClientZone *)v14;
        __int16 v65 = 2112;
        double v66 = v23;
        _os_log_debug_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: requestID:%llu failed sending: %@%@", buf, 0x20u);
      }
    }
    else
    {
      brc_bread_crumbs();
      double v23 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      id v24 = brc_default_log();
      if (os_log_type_enabled(v24, (os_log_type_t)0x90u))
      {
        unint64_t v53 = self->_requestID;
        *(_DWORD *)buf = 134218498;
        unint64_t v62 = v53;
        __int16 v63 = 2112;
        uint64_t v64 = (BRCClientZone *)v14;
        __int16 v65 = 2112;
        double v66 = v23;
        _os_log_error_impl(&dword_1D353B000, v24, (os_log_type_t)0x90u, "[ERROR] Sync: requestID:%llu failed sending: %@%@", buf, 0x20u);
      }
    }

    uint64_t v36 = +[BRCAccountsManager sharedManager];
    [v36 retrySyncBubbleLaterIfNeededWithError:v14];

    if (([(__CFString *)v14 brc_isEverRetriable] & 1) == 0) {
      [(BRCClientZone *)self recomputeAllItemsDidUploadState];
    }
    if (([(__CFString *)v14 brc_isResetError] & 1) != 0
      || ![(__CFString *)v14 brc_isCloudKitErrorSafeToSyncUpWithoutSyncDown])
    {
      uint64_t v34 = 19;
    }
    else
    {
      [(BRCClientZone *)self _markLatestSyncRequestFailed];
      int v37 = [(__CFString *)v14 userInfo];
      __int16 v38 = [v37 objectForKeyedSubscript:*MEMORY[0x1E4F19CD8]];

      v58[0] = MEMORY[0x1E4F143A8];
      v58[1] = 3221225472;
      v58[2] = __122__BRCClientZone__syncUpOfRecords_createdAppLibraryNames_didFinishWithError_errorWasOnPCSChainedItem_throttledItemInBatch___block_invoke;
      v58[3] = &unk_1E6997740;
      v58[4] = self;
      [v38 enumerateKeysAndObjectsUsingBlock:v58];

      uint64_t v34 = 1;
    }
    long long v39 = +[BRCAutoBugCaptureReporter sharedABCReporter];
    [v39 captureLogsForOperationType:@"SyncHealth" ofSubtype:@"SyncUp" forError:v14];
  }
  else
  {
    id v25 = brc_bread_crumbs();
    id v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:]((uint64_t)self);
    }

    if ([(BRCClientZone *)self isPrivateZone])
    {
      id v27 = [(BRCClientZone *)self asPrivateClientZone];
      id v28 = [v27 defaultAppLibrary];
      [v28 setStateBits:2];
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v29 = v13;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v54 objects:v60 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v55;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v55 != v31) {
            objc_enumerationMutation(v29);
          }
          uint64_t v33 = -[BRCAccountSession appLibraryByID:](self->_session, "appLibraryByID:", *(void *)(*((void *)&v54 + 1) + 8 * v32), (void)v54);
          [v33 setStateBits:2];

          ++v32;
        }
        while (v30 != v32);
        uint64_t v30 = [v29 countByEnumeratingWithState:&v54 objects:v60 count:16];
      }
      while (v30);
    }

    [(BRCClientZone *)self learnCKInfosFromSavedRecords:v12 isOutOfBandModifyRecords:0];
    uint64_t v34 = 18;
  }
  -[BRCClientZone setSyncStateBits:](self, "setSyncStateBits:", v34, (void)v54);
  [(BRCClientZone *)self clearSyncStateBits:4];
  if (v7
    && ([(BRCClientZone *)self mangledID],
        __int16 v40 = objc_claimAutoreleasedReturnValue(),
        +[BRCUserDefaults defaultsForMangledID:v40],
        long long v41 = objc_claimAutoreleasedReturnValue(),
        char v42 = [v41 treatPerItemThrottleAsOperationSuccess],
        v41,
        v40,
        (v42 & 1) != 0))
  {
    long long v43 = 0;
  }
  else
  {
    long long v43 = v14;
  }
  [(BRCSyncOperationThrottle *)self->_syncUpThrottle updateForError:v43];
  if (v14
    || ([(BRCClientZone *)self syncDownImmediately],
        long long v44 = objc_claimAutoreleasedReturnValue(),
        v44,
        !v44))
  {
    [(BRCDeadlineSource *)self->_syncDeadlineSource resume];
    [(BRCDeadlineSource *)self->_syncDeadlineSource signal];
  }
  [(BRCClientZone *)self handleZoneLevelErrorIfNeeded:v14 forItemCreation:1];
  brc_bread_crumbs();
  double v45 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
  uint64_t v46 = brc_default_log();
  if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
  {
    syncUpThrottle = self->_syncUpThrottle;
    *(_DWORD *)buf = 138412802;
    unint64_t v62 = (unint64_t)syncUpThrottle;
    __int16 v63 = 2112;
    uint64_t v64 = self;
    __int16 v65 = 2112;
    double v66 = v45;
    _os_log_debug_impl(&dword_1D353B000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: updated sync-up throttle: %@\n      and container state: %@%@", buf, 0x20u);
  }

  __brc_leave_section(v59);
}

void __122__BRCClientZone__syncUpOfRecords_createdAppLibraryNames_didFinishWithError_errorWasOnPCSChainedItem_throttledItemInBatch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v11 = a2;
  id v5 = a3;
  if (objc_msgSend(v5, "brc_isCloudKitOutOfQuota"))
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v6 = *(void **)(a1 + 32);
      BOOL v7 = objc_msgSend(v11, "brc_itemIDWithSession:", v6[1]);
      id v8 = [v6 itemByItemID:v7];

      if (([v8 isDead] & 1) == 0
        && [v8 needsSyncUp]
        && [v8 isDocument])
      {
        id v9 = [*(id *)(*(void *)(a1 + 32) + 8) fsUploader];
        long long v10 = [v8 asDocument];
        [v9 finishedSyncingUpItem:v10 withOutOfQuotaError:v5];
      }
    }
  }
}

- (NSArray)syncThrottles
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  syncThrottles = self->_syncThrottles;
  if (syncThrottles)
  {
    uint64_t v4 = syncThrottles;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F1CA48] array];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v6 = [(BRCClientZone *)self mangledID];
    BOOL v7 = +[BRCUserDefaults defaultsForMangledID:v6];
    id v8 = [v7 syncThrottles];

    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = [[BRCSyncThrottle alloc] initWithName:@"defaultSyncThrottle" andParameters:*(void *)(*((void *)&v17 + 1) + 8 * i)];
          if (v13) {
            [v5 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v10);
    }

    uint64_t v14 = (NSArray *)[v5 copy];
    uint64_t v15 = self->_syncThrottles;
    self->_syncThrottles = v14;

    uint64_t v4 = self->_syncThrottles;
  }
  return v4;
}

- (BOOL)_isIdle
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if ([(BRCClientZone *)self isPrivateZone])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v3 = [(BRCClientZone *)self asPrivateClientZone];
    uint64_t v4 = [v3 appLibraries];

    uint64_t v5 = [v4 countByEnumeratingWithState:&v23 objects:v33 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v24;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          if (([v9 state] & 4) != 0)
          {
            uint64_t v10 = brc_bread_crumbs();
            uint64_t v11 = brc_default_log();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              id v28 = self;
              __int16 v29 = 2112;
              uint64_t v30 = v9;
              __int16 v31 = 2112;
              uint64_t v32 = v10;
              _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ isn't idle because %@ needs lost%@", buf, 0x20u);
            }

            goto LABEL_32;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v23 objects:v33 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
  }
  if ((self->_state & 0x110) != 0)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isIdle].cold.6((uint64_t)self);
    }
LABEL_32:

    return 0;
  }
  char v12 = atomic_load(&self->_syncState);
  if ((v12 & 0xF) != 0)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isIdle].cold.5((uint64_t)self);
    }
    goto LABEL_32;
  }
  id v13 = [(BRCAccountSession *)self->_session fsDownloader];
  int v14 = [v13 haveActiveJobsMatching:self->_serverZone];

  if (v14)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isIdle]((uint64_t)self);
    }
    goto LABEL_32;
  }
  uint64_t v15 = [(BRCAccountSession *)self->_session fsUploader];
  int v16 = [v15 haveActiveJobsMatching:self->_serverZone];

  if (v16)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isIdle]((uint64_t)self);
    }
    goto LABEL_32;
  }
  long long v17 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsReader];
  int v18 = [v17 haveActiveJobsMatching:self->_serverZone];

  if (v18)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isIdle]((uint64_t)self);
    }
    goto LABEL_32;
  }
  long long v19 = [(BRCAccountSession *)self->_session applyScheduler];
  [v19 deleteExpiredJobs];

  long long v20 = [(BRCAccountSession *)self->_session applyScheduler];
  int v21 = [v20 haveActiveJobsMatching:self->_serverZone];

  if (v21)
  {
    uint64_t v4 = brc_bread_crumbs();
    uint64_t v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isIdle].cold.4((uint64_t)self);
    }
    goto LABEL_32;
  }
  return 1;
}

- (void)_flushIdleBlocksIfNeeded
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 mangledID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] %@ is still not idle%@", v4);
}

- (void)notifyClient:(id)a3 afterNextSyncDown:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BRCPQLConnection *)self->_db serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __48__BRCClientZone_notifyClient_afterNextSyncDown___block_invoke;
  block[3] = &unk_1E69946C8;
  id v12 = v6;
  id v13 = self;
  id v14 = v7;
  id v9 = v7;
  id v10 = v6;
  dispatch_async(v8, block);
}

void __48__BRCClientZone_notifyClient_afterNextSyncDown___block_invoke(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __48__BRCClientZone_notifyClient_afterNextSyncDown___block_invoke_cold_1(a1);
  }

  uint64_t v4 = *(unsigned char **)(a1 + 40);
  if (v4[76])
  {
    uint64_t v5 = 0;
  }
  else
  {
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
    uint64_t v4 = *(unsigned char **)(a1 + 40);
  }
  if ([v4 isSyncBlocked])
  {
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorSyncBlocked");

    uint64_t v5 = (void *)v6;
  }
  if (v5)
  {
    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    id v7 = *(void **)(*(void *)(a1 + 40) + 392);
    if (!v7)
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v9 = *(void *)(a1 + 40);
      id v10 = *(void **)(v9 + 392);
      *(void *)(v9 + 392) = v8;

      id v7 = *(void **)(*(void *)(a1 + 40) + 392);
    }
    uint64_t v11 = (void *)MEMORY[0x1D94389C0](*(void *)(a1 + 48));
    [v7 addObject:v11];
  }
}

- (void)notifyClient:(id)a3 whenIdle:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BRCPQLConnection *)self->_db serialQueue];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __39__BRCClientZone_notifyClient_whenIdle___block_invoke;
  v11[3] = &unk_1E69977B8;
  id v12 = v6;
  id v13 = v7;
  v11[4] = self;
  id v9 = v6;
  id v10 = v7;
  dispatch_async_with_logs_7(v8, v11);
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke(id *a1)
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = a1 + 4;
  uint64_t v3 = [a1[4] mangledID];
  if (!*((unsigned char *)*v2 + 76))
  {
    uint64_t v4 = (void (**)(id, void, uint64_t))a1[6];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorLoggedOut");
    goto LABEL_5;
  }
  if ([*v2 isSyncBlocked])
  {
    uint64_t v4 = (void (**)(id, void, uint64_t))a1[6];
    uint64_t v5 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorSyncBlocked");
LABEL_5:
    id v6 = (void *)v5;
    v4[2](v4, 0, v5);

    goto LABEL_6;
  }
  if ([a1[4] _isIdle])
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __39__BRCClientZone_notifyClient_whenIdle___block_invoke_cold_1();
    }

    (*((void (**)(void))a1[6] + 2))();
  }
  else
  {
    long long v29 = 0uLL;
    uint64_t v30 = 0;
    __brc_create_section(0, (uint64_t)"-[BRCClientZone notifyClient:whenIdle:]_block_invoke", 2584, &v29);
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      id v20 = a1[5];
      *(_DWORD *)locatiouint64_t n = 134218754;
      *(void *)&location[4] = v29;
      __int16 v34 = 2112;
      uint64_t v35 = v3;
      __int16 v36 = 2112;
      id v37 = v20;
      __int16 v38 = 2112;
      long long v39 = v9;
      _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting for %@ to be idle for %@ because it is busy%@", location, 0x2Au);
    }

    long long v31 = v29;
    uint64_t v32 = v30;
    uint64_t v11 = (void *)*((void *)a1[4] + 52);
    if (!v11)
    {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v13 = a1[4];
      id v14 = (void *)v13[52];
      v13[52] = v12;

      uint64_t v11 = (void *)*((void *)a1[4] + 52);
    }
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __39__BRCClientZone_notifyClient_whenIdle___block_invoke_256;
    v23[3] = &unk_1E6997768;
    long long v27 = v31;
    uint64_t v28 = v32;
    id v24 = v3;
    id v25 = a1[5];
    id v26 = a1[6];
    uint64_t v15 = (void *)MEMORY[0x1D94389C0](v23);
    [v11 addObject:v15];

    int v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
    objc_initWeak((id *)location, a1[4]);
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __39__BRCClientZone_notifyClient_whenIdle___block_invoke_258;
    v21[3] = &unk_1E6997790;
    objc_copyWeak(&v22, (id *)location);
    uint64_t v17 = [v16 addObserverForName:@"BRCFSSchedulerBaseDidUpdateHasWorkNotification" object:0 queue:0 usingBlock:v21];
    int v18 = a1[4];
    long long v19 = (void *)v18[51];
    v18[51] = v17;

    objc_destroyWeak(&v22);
    objc_destroyWeak((id *)location);
  }
LABEL_6:
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_256(uint64_t a1, void *a2)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  long long v8 = *(_OWORD *)(a1 + 56);
  uint64_t v9 = *(void *)(a1 + 72);
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v6 = *(void *)(a1 + 32);
    uint64_t v7 = *(void *)(a1 + 40);
    *(_DWORD *)buf = 134218754;
    uint64_t v11 = v8;
    __int16 v12 = 2112;
    uint64_t v13 = v6;
    __int16 v14 = 2112;
    uint64_t v15 = v7;
    __int16 v16 = 2112;
    uint64_t v17 = v4;
    _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx %@ is now idle, notifying %@%@", buf, 0x2Au);
  }

  (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  __brc_leave_section((uint64_t *)&v8);
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_258(uint64_t a1, void *a2)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  uint64_t v5 = WeakRetained;
  if (WeakRetained)
  {
    uint64_t v6 = [WeakRetained[1] personaIdentifier];
    if ([v6 isEqualToString:@"__defaultPersonaID__"])
    {
    }
    else
    {
      id v7 = [v5[1] personaIdentifier];

      if (v7)
      {
        int v8 = 0;
        goto LABEL_9;
      }
    }
    if (_block_invoke___personaOnceToken_0 != -1) {
      dispatch_once(&_block_invoke___personaOnceToken_0, &__block_literal_global_263);
    }
    id v7 = (id)_block_invoke___personalPersona_0;
    int v8 = 1;
LABEL_9:
    uint64_t v9 = [MEMORY[0x1E4FB36F8] sharedManager];
    id v10 = [v9 currentPersona];

    id v27 = 0;
    id v11 = [v10 userPersonaUniqueString];
    __int16 v12 = v11;
    if (v11 == v7 || ([v11 isEqualToString:v7] & 1) != 0)
    {
      uint64_t v13 = 0;
    }
    else
    {
      if (voucher_process_can_use_arbitrary_personas())
      {
        id v26 = 0;
        uint64_t v15 = (void *)[v10 copyCurrentPersonaContextWithError:&v26];
        id v16 = v26;
        id v17 = v27;
        id v27 = v15;

        if (v16)
        {
          uint64_t v18 = brc_bread_crumbs();
          long long v19 = brc_default_log();
          if (os_log_type_enabled(v19, (os_log_type_t)0x90u)) {
            __39__BRCClientZone_notifyClient_whenIdle___block_invoke_258_cold_1((uint64_t)v16);
          }
        }
        uint64_t v13 = [v10 generateAndRestorePersonaContextWithPersonaUniqueString:v7];

        if (!v13) {
          goto LABEL_12;
        }
        id v20 = brc_bread_crumbs();
        int v21 = brc_default_log();
        if (os_log_type_enabled(v21, (os_log_type_t)0x90u))
        {
          id v22 = [v5[1] personaIdentifier];
          *(_DWORD *)buf = 138412802;
          long long v29 = v22;
          __int16 v30 = 2112;
          long long v31 = v13;
          __int16 v32 = 2112;
          uint64_t v33 = v20;
          _os_log_error_impl(&dword_1D353B000, v21, (os_log_type_t)0x90u, "[ERROR] Can't adopt persona %@: %@%@", buf, 0x20u);
        }
      }
      else
      {
        if (!v8 || ([v10 isDataSeparatedPersona] & 1) != 0)
        {
          long long v23 = brc_bread_crumbs();
          id v24 = brc_default_log();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
            __br_notify_register_dispatch_block_invoke_cold_3();
          }

          uint64_t v13 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:0];
          goto LABEL_12;
        }
        id v20 = brc_bread_crumbs();
        int v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
          __br_notify_register_dispatch_block_invoke_cold_4();
        }
        uint64_t v13 = 0;
      }
    }
LABEL_12:
    __int16 v14 = [v5[8] serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __39__BRCClientZone_notifyClient_whenIdle___block_invoke_266;
    block[3] = &unk_1E6993698;
    void block[4] = v5;
    dispatch_async(v14, block);

    _BRRestorePersona();
  }
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_2()
{
  id v2 = [MEMORY[0x1E4FB3710] personaAttributesForPersonaType:0];
  uint64_t v0 = [v2 userPersonaUniqueString];
  id v1 = (void *)_block_invoke___personalPersona_0;
  _block_invoke___personalPersona_0 = v0;
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_266(uint64_t a1)
{
  memset(v4, 0, sizeof(v4));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone notifyClient:whenIdle:]_block_invoke", 2611, v4);
  id v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __39__BRCClientZone_notifyClient_whenIdle___block_invoke_266_cold_1();
  }

  [*(id *)(a1 + 32) _flushIdleBlocksIfNeeded];
  __brc_leave_section(v4);
}

- (void)syncDownOperation:(id)a3 didFinishWithError:(id)a4 status:(int64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [(BRCAccountSession *)self->_session fsUploader];
  id v11 = [(BRCServerZone *)self->_serverZone ownerName];
  [v10 scheduleQuotaFetchIfNeededForOwner:v11];

  db = self->_db;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke;
  v15[3] = &unk_1E6994A88;
  v15[4] = self;
  id v16 = v8;
  id v17 = v9;
  int64_t v18 = a5;
  id v13 = v9;
  id v14 = v8;
  [(BRCPQLConnection *)db performWithFlags:9 action:v15];
}

uint64_t __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  uint64_t v5 = (id *)(a1 + 32);
  if (*(void *)(v4 + 136) == *(void *)(a1 + 40))
  {
    id v8 = *(void **)(v4 + 128);
    *(void *)(v4 + 128) = 0;

    *((void *)*v5 + 17) = 0;
    [*((id *)*v5 + 23) resume];
  }
  else
  {
    uint64_t v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_cold_2();
    }
  }
  objc_storeStrong((id *)(*(void *)(a1 + 32) + 144), *(id *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 32) + 176) updateForError:*(void *)(a1 + 48)];
  [*(id *)(a1 + 32) handleZoneLevelErrorIfNeeded:*(void *)(a1 + 48) forItemCreation:0];
  uint64_t v9 = *(void *)(a1 + 56);
  id v10 = [*(id *)(a1 + 32) mangledID];
  id v11 = +[BRCUserDefaults defaultsForMangledID:v10];
  int v12 = [v11 onlyTreatCaughtUpAsConsistent];

  if (v12) {
    uint64_t v13 = 2;
  }
  else {
    uint64_t v13 = 1;
  }
  if (v9 > 2) {
    goto LABEL_10;
  }
  long long v31 = *(void **)(a1 + 48);
  if (v31)
  {
    if ((objc_msgSend(v31, "brc_isCloudKitCancellationError") & 1) == 0
      && (objc_msgSend(*(id *)(a1 + 48), "brc_isUserInitiatedRetriable") & 1) == 0)
    {
LABEL_10:
      id v14 = *v5;
      uint64_t v15 = (void *)*((void *)*v5 + 47);
      v66[0] = MEMORY[0x1E4F143A8];
      v66[1] = 3221225472;
      v66[2] = __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_268;
      v66[3] = &unk_1E69977E0;
      v66[4] = v14;
      [v15 enumerateKeysAndObjectsUsingBlock:v66];
      id v16 = (void *)*((void *)*v5 + 47);
      *((void *)*v5 + 47) = 0;

      if (([*v5 isSharedZone] & 1) == 0)
      {
        id v17 = [*v5 asPrivateClientZone];
        int64_t v18 = (void *)*((void *)*v5 + 39);
        v64[0] = MEMORY[0x1E4F143A8];
        v64[1] = 3221225472;
        v64[2] = __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_2;
        v64[3] = &unk_1E6997808;
        id v65 = v17;
        id v19 = v17;
        [v18 enumerateKeysAndObjectsUsingBlock:v64];
      }
      uint64_t v20 = *(void *)(a1 + 32);
      int v21 = *(void **)(v20 + 312);
      *(void *)(v20 + 312) = 0;

      if (*(void *)(a1 + 48))
      {
        uint64_t v52 = v13;
        uint64_t v53 = v9;
        id v22 = objc_opt_new();
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        long long v63 = 0u;
        id v23 = *((id *)*v5 + 24);
        uint64_t v24 = [v23 countByEnumeratingWithState:&v60 objects:v72 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v61;
          do
          {
            for (uint64_t i = 0; i != v25; ++i)
            {
              if (*(void *)v61 != v26) {
                objc_enumerationMutation(v23);
              }
              uint64_t v28 = *(void **)(*((void *)&v60 + 1) + 8 * i);
              if (objc_msgSend(v28, "nonDiscretionary", v52, v53))
              {
                long long v29 = brc_bread_crumbs();
                __int16 v30 = brc_default_log();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  __int16 v69 = v28;
                  __int16 v70 = 2112;
                  __int16 v71 = v29;
                  _os_log_debug_impl(&dword_1D353B000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] Failing op %@ because the sync down failed%@", buf, 0x16u);
                }

                [v28 completedWithResult:0 error:*(void *)(a1 + 48)];
                [v28 cancel];
                [v28 schedule];
                [v22 addObject:v28];
              }
            }
            uint64_t v25 = [v23 countByEnumeratingWithState:&v60 objects:v72 count:16];
          }
          while (v25);
        }

        uint64_t v5 = (id *)(a1 + 32);
        [*(id *)(*(void *)(a1 + 32) + 192) removeObjectsInArray:v22];

        uint64_t v13 = v52;
        uint64_t v9 = v53;
      }
      goto LABEL_31;
    }
    if (*(void *)(a1 + 48)) {
      goto LABEL_31;
    }
  }
  if ([*((id *)*v5 + 47) count])
  {
    __int16 v32 = objc_opt_new();
    id v33 = *v5;
    uint64_t v34 = (void *)*((void *)*v5 + 47);
    v58[0] = MEMORY[0x1E4F143A8];
    v58[1] = 3221225472;
    v58[2] = __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_272;
    v58[3] = &unk_1E6997830;
    v58[4] = v33;
    id v59 = v32;
    id v35 = v32;
    [v34 enumerateKeysAndObjectsUsingBlock:v58];
    [*((id *)*v5 + 47) removeObjectsForKeys:v35];
  }
LABEL_31:
  if (v9 <= v13)
  {
    LODWORD(v38) = 0;
    uint64_t v37 = 8;
LABEL_39:
    uint64_t v38 = v38 | 2;
    goto LABEL_40;
  }
  uint64_t v36 = *(void *)(a1 + 48);
  if (!v36 && v9 <= 2)
  {
    if ([*v5 hasHighPriorityWatchers]) {
      uint64_t v37 = 8;
    }
    else {
      uint64_t v37 = 344;
    }
    LODWORD(v38) = 32;
    goto LABEL_39;
  }
  uint64_t v38 = 32 * (v36 == 0);
  if (v36) {
    uint64_t v37 = 8;
  }
  else {
    uint64_t v37 = 344;
  }
  if (v9 < 3 || v36) {
    goto LABEL_39;
  }
LABEL_40:
  objc_msgSend(*v5, "clearSyncStateBits:", v37, v52, v53);
  [*v5 setSyncStateBits:v38];
  [*((id *)*v5 + 23) signal];
  if (v9 > 2 || *(void *)(a1 + 48))
  {
    if ([*((id *)*v5 + 50) count])
    {
      long long v39 = brc_bread_crumbs();
      uint64_t v40 = brc_default_log();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v69 = v39;
        _os_log_impl(&dword_1D353B000, v40, OS_LOG_TYPE_DEFAULT, "[NOTICE] signaling sync down waiters%@", buf, 0xCu);
      }
    }
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v41 = *((id *)*v5 + 50);
    uint64_t v42 = [v41 countByEnumeratingWithState:&v54 objects:v67 count:16];
    if (v42)
    {
      uint64_t v43 = v42;
      uint64_t v44 = *(void *)v55;
      do
      {
        for (uint64_t j = 0; j != v43; ++j)
        {
          if (*(void *)v55 != v44) {
            objc_enumerationMutation(v41);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v54 + 1) + 8 * j) + 16))();
        }
        uint64_t v43 = [v41 countByEnumeratingWithState:&v54 objects:v67 count:16];
      }
      while (v43);
    }

    [*((id *)*v5 + 50) removeAllObjects];
  }
  uint64_t v46 = +[BRCAccountsManager sharedManager];
  [v46 retrySyncBubbleLaterIfNeededWithError:*(void *)(a1 + 48)];

  uint64_t v47 = *(void **)(a1 + 48);
  if (v47)
  {
    if ((objc_msgSend(v47, "brc_isEverRetriable") & 1) == 0) {
      [*v5 recomputeAllItemsDidUploadState];
    }
    if (*(void *)(a1 + 48))
    {
      float v48 = +[BRCAutoBugCaptureReporter sharedABCReporter];
      [v48 captureLogsForOperationType:@"SyncHealth" ofSubtype:@"SyncDown" forError:*(void *)(a1 + 48)];
    }
  }
  float v49 = brc_bread_crumbs();
  uint64_t v50 = brc_default_log();
  if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
    __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_cold_1();
  }

  return 1;
}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_268(uint64_t a1, void *a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
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
        uint64_t v11 = *(void *)(*((void *)&v13 + 1) + 8 * v10);
        int v12 = [*(id *)(a1 + 32) serverItemByItemID:v5];
        (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, [v12 isLive]);

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_2(uint64_t a1, uint64_t a2, void (**a3)(void, void))
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a3;
  id v8 = [v5 serverAliasByUnsaltedBookmarkData:a2];
  uint64_t v7 = [v8 itemID];
  ((void (**)(void, void *))a3)[2](v6, v7);
}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_272(uint64_t a1, void *a2, void *a3)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void *)(*((void *)&v14 + 1) + 8 * v10);
        int v12 = [*(id *)(a1 + 32) serverItemByItemID:v5];
        int v13 = [v12 isLive];

        if (v13) {
          (*(void (**)(uint64_t, uint64_t))(v11 + 16))(v11, 1);
        }
        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  [*(id *)(a1 + 40) addObject:v5];
}

- (void)_fixupMissingCrossMovedItems
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  [(BRCPQLConnection *)self->_db executeWithSlowStatementRadar:@"<rdar://problem/26073809> _fixupMissingCrossMovedItems causes slow SQL assertions", @"UPDATE client_items SET item_localsyncupunsigned int state = 1 WHERE zone_rowid = %@   AND item_localsyncupunsigned int state = 0   AND (item_local_diffs & 0x2000000000000000) != 0   AND NOT EXISTS (SELECT * FROM server_items WHERE server_items.item_id = client_items.item_id AND zone_rowid = %@)", self->_dbRowID, self->_dbRowID sql];
  id v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    int64_t v5 = [(BRCPQLConnection *)self->_db changes];
    *(_DWORD *)buf = 134218242;
    int64_t v8 = v5;
    __int16 v9 = 2112;
    uint64_t v10 = v3;
    _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] marked %lld items rejected after cross zone move%@", buf, 0x16u);
  }

  if ([(BRCPQLConnection *)self->_db changes])
  {
    id v6 = [(BRCAccountSession *)self->_session applyScheduler];
    [v6 repopulateJobsForZone:self->_serverZone];
  }
}

- (void)listedUpToRank:(int64_t)a3
{
  self->_lastInsertedRanuint64_t k = a3;
  [(BRCClientZone *)self setNeedsSave:1];
}

- (void)didSyncDownRequestID:(unint64_t)a3 maxApplyRank:(int64_t)a4 caughtUpWithServer:(BOOL)a5 syncDownDate:(id)a6
{
  BOOL v120 = a5;
  uint64_t v162 = *MEMORY[0x1E4F143B8];
  id v116 = a6;
  v119 = [(BRCAccountSession *)self->_session applyScheduler];
  unint64_t requestID = self->_requestID;
  if (requestID) {
    BOOL v9 = requestID >= a3;
  }
  else {
    BOOL v9 = 1;
  }
  if (!v9)
  {
    long long v113 = brc_bread_crumbs();
    long long v114 = brc_default_log();
    if (os_log_type_enabled(v114, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:].cold.4();
    }
  }
  if (!self->_lastSyncDownDate) {
    [(BRCClientZone *)self scheduleSyncUp];
  }
  if ([(NSMutableArray *)self->_blockedOperationsOnInitialSync count])
  {
    uint64_t v10 = [(BRCServerZone *)self->_serverZone changeState];
    uint64_t v11 = [v10 changeToken];

    if (v11)
    {
      [(NSMutableArray *)self->_blockedOperationsOnInitialSync sortWithOptions:16 usingComparator:&__block_literal_global_285];
    }
    else
    {
      int v12 = brc_bread_crumbs();
      int v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        unint64_t v145 = (unint64_t)v12;
        _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] The zone wasn't found on sync down so failing all blocked operations right away%@", buf, 0xCu);
      }

      long long v142 = 0u;
      long long v143 = 0u;
      long long v140 = 0u;
      long long v141 = 0u;
      long long v14 = self->_blockedOperationsOnInitialSync;
      uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v140 objects:v161 count:16];
      if (v15)
      {
        uint64_t v16 = *(void *)v141;
        do
        {
          for (uint64_t i = 0; i != v15; ++i)
          {
            if (*(void *)v141 != v16) {
              objc_enumerationMutation(v14);
            }
            uint64_t v18 = *(void **)(*((void *)&v140 + 1) + 8 * i);
            uint64_t v19 = (void *)MEMORY[0x1E4F28C58];
            uint64_t v20 = [(BRMangledID *)self->_mangledID appLibraryOrZoneName];
            int v21 = objc_msgSend(v19, "brc_errorClientZoneNotFound:", v20);
            [v18 completedWithResult:0 error:v21];

            [v18 cancel];
          }
          uint64_t v15 = [(NSMutableArray *)v14 countByEnumeratingWithState:&v140 objects:v161 count:16];
        }
        while (v15);
      }
    }
    long long v138 = 0u;
    long long v139 = 0u;
    long long v136 = 0u;
    long long v137 = 0u;
    id v22 = self->_blockedOperationsOnInitialSync;
    uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v136 objects:v160 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v137;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v137 != v24) {
            objc_enumerationMutation(v22);
          }
          [*(id *)(*((void *)&v136 + 1) + 8 * j) schedule];
        }
        uint64_t v23 = [(NSMutableArray *)v22 countByEnumeratingWithState:&v136 objects:v160 count:16];
      }
      while (v23);
    }

    [(NSMutableArray *)self->_blockedOperationsOnInitialSync removeAllObjects];
  }
  self->_lastInsertedRanuint64_t k = a4;
  objc_storeStrong((id *)&self->_lastSyncDownDate, a6);
  [(BRCClientZone *)self setNeedsSave:1];
  if (v120)
  {
    if ([(BRCClientZone *)self isPrivateZone])
    {
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      uint64_t v26 = [(BRCClientZone *)self asPrivateClientZone];
      id v27 = [v26 appLibraries];

      uint64_t v28 = [v27 countByEnumeratingWithState:&v132 objects:v159 count:16];
      if (v28)
      {
        char v29 = 0;
        uint64_t v30 = *(void *)v133;
        do
        {
          for (uint64_t k = 0; k != v28; ++k)
          {
            if (*(void *)v133 != v30) {
              objc_enumerationMutation(v27);
            }
            __int16 v32 = *(void **)(*((void *)&v132 + 1) + 8 * k);
            if (([v32 state] & 0x80000) != 0)
            {
              id v33 = brc_bread_crumbs();
              uint64_t v34 = brc_default_log();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)buf = 138412546;
                unint64_t v145 = (unint64_t)v32;
                __int16 v146 = 2112;
                unint64_t v147 = (unint64_t)v33;
                _os_log_debug_impl(&dword_1D353B000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] Server Zone has caught up, so we can now re-scan to scrub for turds on %@%@", buf, 0x16u);
              }

              [v32 scheduleDeepScanWithReason:@"Server zone has caught up"];
            }
            if (([v32 state] & 0x400000) != 0)
            {
              [v32 clearStateBits:0x400000];
              char v29 = 1;
            }
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v132 objects:v159 count:16];
        }
        while (v28);

        if (v29) {
          [(BRCClientZone *)self _fixupMissingCrossMovedItems];
        }
      }
      else
      {
      }
    }
    if (([(BRCClientZone *)self syncState] & 0x82) == 0x80)
    {
      [(BRCPQLConnection *)self->_db execute:@"UPDATE client_items SET item_local_diffs = (item_local_diffs & (~%lld)) WHERE zone_rowid = %@ AND (item_local_diffs & %lld) != 0", 0x1000000000000000, self->_dbRowID, 0x1000000000000000];
      int64_t v37 = [(BRCPQLConnection *)self->_db changes];
      uint64_t v38 = brc_bread_crumbs();
      long long v39 = brc_default_log();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:]();
      }

      [(BRCClientZone *)self clearSyncStateBits:128];
      if (v37)
      {
        uint64_t v40 = [(BRCAccountSession *)self->_session applyScheduler];
        [v40 rescheduleSuspendedJobsMatching:self->_serverZone inState:22];
      }
    }
    unint64_t v41 = self->_requestID;
    if (v41 != a3 && v41)
    {
      if ((a3 | 1) == v41)
      {
        uint64_t v42 = brc_bread_crumbs();
        uint64_t v43 = brc_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
          -[BRCClientZone didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:]();
        }
      }
      else
      {
        long long v108 = brc_bread_crumbs();
        long long v109 = brc_default_log();
        if (os_log_type_enabled(v109, OS_LOG_TYPE_DEFAULT))
        {
          unint64_t v110 = self->_requestID;
          *(_DWORD *)buf = 134218754;
          unint64_t v145 = a3;
          __int16 v146 = 2048;
          unint64_t v147 = v110;
          __int16 v148 = 2112;
          v149 = self;
          __int16 v150 = 2112;
          uint64_t v151 = (uint64_t)v108;
          _os_log_impl(&dword_1D353B000, v109, OS_LOG_TYPE_DEFAULT, "[WARNING] Marking latest sync request failed because the requestIDs differ %llu vs %llu for %@\n%@", buf, 0x2Au);
        }

        if (self->_requestID < a3) {
          self->_unint64_t requestID = a3;
        }
        [(BRCClientZone *)self _markLatestSyncRequestFailed];
        __int16 v111 = atomic_load(&self->_syncState);
        if ((v111 & 0x100) != 0 && !self->_lastSyncUpError)
        {
          long long v112 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F592A8] code:32 userInfo:0];
          [(BRCSyncOperationBackoffRatio *)self->_syncUpBackoffRatio newSyncOperationWithError:v112];
          [(BRCSyncOperationThrottle *)self->_syncUpThrottle updateForError:v112];
        }
      }
      goto LABEL_162;
    }
    if (!v41) {
      self->_unint64_t requestID = a3;
    }
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    id obj = [(BRCClientZone *)self itemsWithInFlightDiffsEnumerator];
    uint64_t v123 = [obj countByEnumeratingWithState:&v128 objects:v158 count:16];
    if (v123)
    {
      uint64_t v121 = *(void *)v129;
      do
      {
        uint64_t v44 = 0;
        do
        {
          if (*(void *)v129 != v121) {
            objc_enumerationMutation(obj);
          }
          double v45 = *(void **)(*((void *)&v128 + 1) + 8 * v44);
          uint64_t v46 = (void *)MEMORY[0x1D9438760]();
          uint64_t v47 = [v45 itemID];
          float v48 = [(BRCClientZone *)self serverItemByItemID:v47];

          int v49 = [v45 isSharedToMeTopLevelItem];
          if (v48) {
            int v50 = 0;
          }
          else {
            int v50 = v49;
          }
          if (v50 == 1)
          {
            sessiouint64_t n = self->_session;
            uint64_t v52 = [(BRCClientZone *)self serverZone];
            float v48 = [(BRCAccountSession *)session serverAliasItemForSharedItem:v45 inZone:v52];
          }
          uint64_t v53 = brc_bread_crumbs();
          long long v54 = brc_default_log();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 134218754;
            unint64_t v145 = a3;
            __int16 v146 = 2112;
            unint64_t v147 = (unint64_t)v45;
            __int16 v148 = 2112;
            v149 = v48;
            __int16 v150 = 2112;
            uint64_t v151 = (uint64_t)v53;
            _os_log_debug_impl(&dword_1D353B000, v54, OS_LOG_TYPE_DEBUG, "[DEBUG] received item in request:%llu\n   local:  %@\n   server: %@\n%@", buf, 0x2Au);
          }

          if ([v45 isBRAlias])
          {
            if (v48)
            {
              BOOL v55 = ([v45 diffAgainstServerItem:v48] & 0x63) == 1;
              [v119 createApplyJobFromServerItem:v48 localItem:0 state:1 kind:2];
              if (v55) {
                [v45 updateStructuralCKInfoFromServerItem:v48];
              }
              goto LABEL_109;
            }
            goto LABEL_114;
          }
          int v56 = [v45 isSharedToMeTopLevelItem];
          if (v48)
          {
            if (v56 && [(BRCClientZone *)v48 isBRAlias])
            {
              long long v57 = [v45 asSharedToMeTopLevelItem];
              int v58 = [v57 diffAgainstServerAliasItem:v48];
            }
            else
            {
              int v58 = [v45 diffAgainstServerItem:v48];
            }
            if (([v45 localDiffs] & 0x1000000000000000) != 0)
            {
              int v59 = 0;
            }
            else
            {
              if ((v58 & 0x7FFF) == 1) {
                int v59 = [v45 physicalNameNeedsRename] ^ 1;
              }
              else {
                int v59 = 0;
              }
              if ((v58 & 0x3FF0000) == 0x10000)
              {
                int v72 = [v45 isDocument];
                goto LABEL_103;
              }
            }
            int v72 = 0;
LABEL_103:
            uint64_t v73 = brc_bread_crumbs();
            BOOL v74 = brc_default_log();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v88 = BRCItemFieldsPrettyPrint();
              long long v89 = (void *)v88;
              *(_DWORD *)buf = 134219522;
              if (v59) {
                long long v90 = "YES";
              }
              else {
                long long v90 = "NO";
              }
              unint64_t v145 = a3;
              if (v72) {
                long long v91 = "YES";
              }
              else {
                long long v91 = "NO";
              }
              __int16 v146 = 2112;
              unint64_t v147 = (unint64_t)v45;
              __int16 v148 = 2112;
              v149 = v48;
              __int16 v150 = 2112;
              uint64_t v151 = v88;
              __int16 v152 = 2080;
              v153 = v90;
              __int16 v154 = 2080;
              v155 = v91;
              __int16 v156 = 2112;
              v157 = v73;
              _os_log_debug_impl(&dword_1D353B000, v74, OS_LOG_TYPE_DEBUG, "[DEBUG] item acknowledged in requestID:%llu\n   local:  %@\n   server: %@\n   diffs:  %@\n learning etag: structural:%s content:%s%@", buf, 0x48u);
            }
            [v119 createApplyJobFromServerItem:v48 localItem:0 state:1 kind:2];
            if (v59)
            {
              [v45 updateStructuralCKInfoFromServerItem:v48];
              if ((v72 & 1) == 0) {
                goto LABEL_109;
              }
            }
            else if (!v72)
            {
              goto LABEL_109;
            }
            uint64_t v75 = [v45 asDocument];
            [v75 updateContentsCKInfoAndDeviceIDFromServerItem:v48];

            goto LABEL_109;
          }
          if (!v56 || ![(BRCClientZone *)self isPrivateZone])
          {
            memset(v127, 0, sizeof(v127));
            __brc_create_section(0, (uint64_t)"-[BRCClientZone didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:]", 2959, v127);
            brc_bread_crumbs();
            double v66 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
            __int16 v67 = brc_default_log();
            if (os_log_type_enabled(v67, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 134218498;
              unint64_t v145 = v127[0];
              __int16 v146 = 2112;
              unint64_t v147 = (unint64_t)v45;
              __int16 v148 = 2112;
              v149 = v66;
              _os_log_debug_impl(&dword_1D353B000, v67, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Resolving server-side folded path-match for: %@%@", buf, 0x20u);
            }

            uint64_t v68 = [v45 st];
            __int16 v69 = [v68 parentID];
            __int16 v70 = [v45 st];
            __int16 v71 = [v70 logicalNameWithoutLocalBounce];
            float v48 = [(BRCClientZone *)self serverItemByParentID:v69 andLogicalName:v71];

            if (v48)
            {
              if ([(BRCClientZone *)v48 canPathMatchMergeWithLocalItem:v45])
              {
                if ([v45 isDead])
                {
                  __brc_leave_section(v127);
LABEL_148:
                  [v119 createApplyJobFromServerItem:v48 localItem:0 state:1 kind:2];
LABEL_109:
                  uint64_t v76 = [(BRCServerZone *)self->_serverZone dbRowID];
                  [v45 markLatestSyncRequestAcknowledgedInZone:v76];

                  [v45 saveToDBForServerEdit:1 keepAliases:0];
                  goto LABEL_117;
                }
                uint64_t v82 = [(BRCClientZone *)v48 itemID];
                uint64_t v83 = [(BRCClientZone *)self itemByItemID:v82];
                uint64_t v84 = brc_bread_crumbs();
                v85 = brc_default_log();
                if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412546;
                  unint64_t v145 = (unint64_t)v48;
                  __int16 v146 = 2112;
                  unint64_t v147 = (unint64_t)v84;
                  _os_log_debug_impl(&dword_1D353B000, v85, OS_LOG_TYPE_DEBUG, "[DEBUG] Found a path-match in the server truth: %@%@", buf, 0x16u);
                }

                if ([(BRCItemToPathLookup *)v83 isReserved])
                {
                  v86 = brc_bread_crumbs();
                  long long v87 = brc_default_log();
                  if (os_log_type_enabled(v87, OS_LOG_TYPE_DEBUG))
                  {
                    *(_DWORD *)buf = 138412546;
                    unint64_t v145 = (unint64_t)v83;
                    __int16 v146 = 2112;
                    unint64_t v147 = (unint64_t)v86;
                    _os_log_debug_impl(&dword_1D353B000, v87, OS_LOG_TYPE_DEBUG, "[DEBUG] killing local reserved item for the path-match: %@%@", buf, 0x16u);
                  }

                  [(BRCItemToPathLookup *)v83 markDead];
                  [(BRCItemToPathLookup *)v83 saveToDBForServerEdit:1 keepAliases:1];
                  goto LABEL_140;
                }
                if (v83)
                {
                  if ([(BRCItemToPathLookup *)v83 isFault])
                  {
                    long long v92 = [[BRCItemToPathLookup alloc] initWithItem:v83];
                    int v126 = 0;
                    __int16 v93 = [(BRCItemToPathLookup *)v92 byPath];
                    v124[0] = MEMORY[0x1E4F143A8];
                    v124[1] = 3221225472;
                    v124[2] = __83__BRCClientZone_didSyncDownRequestID_maxApplyRank_caughtUpWithServer_syncDownDate___block_invoke_295;
                    v124[3] = &unk_1E6994A60;
                    long long v94 = v83;
                    v125 = v94;
                    int v95 = [v93 performOnOpenParentFileDescriptor:v124 error:&v126];

                    if (v95)
                    {
                      long long v96 = brc_bread_crumbs();
                      __int16 v97 = brc_default_log();
                      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412546;
                        unint64_t v145 = (unint64_t)v94;
                        __int16 v146 = 2112;
                        unint64_t v147 = (unint64_t)v96;
                        long long v98 = v97;
                        long long v99 = "[DEBUG] path-match is known and is an unmodified fault on the file-system: %@%@";
                        goto LABEL_150;
                      }
                    }
                    else
                    {
                      long long v96 = brc_bread_crumbs();
                      __int16 v97 = brc_default_log();
                      if (os_log_type_enabled(v97, OS_LOG_TYPE_DEBUG))
                      {
                        *(_DWORD *)buf = 138412546;
                        unint64_t v145 = (unint64_t)v94;
                        __int16 v146 = 2112;
                        unint64_t v147 = (unint64_t)v96;
                        long long v98 = v97;
                        long long v99 = "[DEBUG] path-match is known and is a fault on the file-system that moved, but still treati"
                              "ng it as if it were there: %@%@";
LABEL_150:
                        _os_log_debug_impl(&dword_1D353B000, v98, OS_LOG_TYPE_DEBUG, v99, buf, 0x16u);
                      }
                    }

                    [(BRCItemToPathLookup *)v94 markNeedsDeleteForRescheduleOfItem:0];
                    [(BRCItemToPathLookup *)v94 saveToDBForServerEdit:1 keepAliases:1];

                    long long v103 = [(BRCItemToPathLookup *)v92 byFileSystemID];
                    [v45 learnItemID:v82 serverItem:v48 path:v103 markLost:1];

                    [(BRCItemToPathLookup *)v92 closePaths];
                  }
                  else
                  {
                    long long v101 = brc_bread_crumbs();
                    long long v102 = brc_default_log();
                    if (os_log_type_enabled(v102, OS_LOG_TYPE_DEBUG))
                    {
                      *(_DWORD *)buf = 138412546;
                      unint64_t v145 = (unint64_t)v83;
                      __int16 v146 = 2112;
                      unint64_t v147 = (unint64_t)v101;
                      _os_log_debug_impl(&dword_1D353B000, v102, OS_LOG_TYPE_DEBUG, "[DEBUG] path-match is known but live on the file-system: %@%@", buf, 0x16u);
                    }

                    float v48 = 0;
                    long long v92 = v83;
                  }
                }
                else
                {
                  brc_bread_crumbs();
                  uint64_t v83 = (BRCItemToPathLookup *)objc_claimAutoreleasedReturnValue();
                  uint64_t v100 = brc_default_log();
                  if (os_log_type_enabled(v100, OS_LOG_TYPE_DEBUG))
                  {
                    long long v104 = [v45 itemID];
                    *(_DWORD *)buf = 138412802;
                    unint64_t v145 = (unint64_t)v82;
                    __int16 v146 = 2112;
                    unint64_t v147 = (unint64_t)v104;
                    __int16 v148 = 2112;
                    v149 = (BRCClientZone *)v83;
                    _os_log_debug_impl(&dword_1D353B000, v100, OS_LOG_TYPE_DEBUG, "[DEBUG] path-match is new, learn new item ID %@ instead of %@%@", buf, 0x20u);
                  }
LABEL_140:

                  [v45 learnItemID:v82 serverItem:v48 path:0 markLost:1];
                }

                __brc_leave_section(v127);
                if (v48) {
                  goto LABEL_148;
                }
LABEL_114:
                uint64_t v79 = brc_bread_crumbs();
                uint64_t v80 = brc_default_log();
                if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG))
                {
                  *(_DWORD *)buf = 138412290;
                  unint64_t v145 = (unint64_t)v79;
                  _os_log_debug_impl(&dword_1D353B000, v80, OS_LOG_TYPE_DEBUG, "[DEBUG] we couldn't find a suitable path-match, mark the item as rejected%@", buf, 0xCu);
                }

                uint64_t v81 = [(BRCServerZone *)self->_serverZone dbRowID];
                [v45 markLatestSyncRequestRejectedInZone:v81];

                [v45 saveToDBForServerEdit:1 keepAliases:0];
                goto LABEL_117;
              }
              brc_bread_crumbs();
              v77 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
              v78 = brc_default_log();
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412802;
                unint64_t v145 = (unint64_t)v48;
                __int16 v146 = 2112;
                unint64_t v147 = (unint64_t)v45;
                __int16 v148 = 2112;
                v149 = v77;
                _os_log_impl(&dword_1D353B000, v78, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't merge %@ with %@%@", buf, 0x20u);
              }
            }
            __brc_leave_section(v127);
            goto LABEL_114;
          }
          long long v60 = brc_bread_crumbs();
          long long v61 = brc_default_log();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            unint64_t v145 = (unint64_t)v45;
            __int16 v146 = 2112;
            unint64_t v147 = (unint64_t)v60;
            _os_log_debug_impl(&dword_1D353B000, v61, OS_LOG_TYPE_DEBUG, "[DEBUG] Alias was rejected when syncing up in private zone %@%@", buf, 0x16u);
          }

          long long v62 = [(BRCServerZone *)self->_serverZone dbRowID];
          [v45 markLatestSyncRequestAcknowledgedInZone:v62];

          [v45 saveToDBForServerEdit:1 keepAliases:0];
          long long v63 = [v45 clientZone];
          uint64_t v64 = [v45 itemID];
          id v65 = [v63 serverItemByItemID:v64];

          [v119 createApplyJobFromServerItem:v65 localItem:v45 state:1 kind:2];
LABEL_117:
          ++v44;
        }
        while (v123 != v44);
        uint64_t v105 = [obj countByEnumeratingWithState:&v128 objects:v158 count:16];
        uint64_t v123 = v105;
      }
      while (v105);
    }

    long long v106 = brc_bread_crumbs();
    long long v107 = brc_default_log();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:]();
    }

    [(BRCClientZone *)self scheduleSyncUp];
    [(BRCClientZone *)self _markRequestIDAcked];
    [(BRCClientZone *)self recomputeAllItemsDidUploadState];
  }
  else
  {
    id v35 = brc_bread_crumbs();
    uint64_t v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      unint64_t v145 = (unint64_t)v35;
      _os_log_impl(&dword_1D353B000, v36, OS_LOG_TYPE_DEFAULT, "[WARNING] not enumerating in-flight items until we are caught up.%@", buf, 0xCu);
    }
  }
LABEL_162:
}

uint64_t __83__BRCClientZone_didSyncDownRequestID_maxApplyRank_caughtUpWithServer_syncDownDate___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a2;
  id v5 = a3;
  int v6 = [v4 nonDiscretionary];
  int v7 = [v5 nonDiscretionary];
  if (!v6 || v7)
  {
    int v9 = [v5 nonDiscretionary];
    uint64_t v8 = v9 & ([v4 nonDiscretionary] ^ 1);
  }
  else
  {
    uint64_t v8 = -1;
  }

  return v8;
}

uint64_t __83__BRCClientZone_didSyncDownRequestID_maxApplyRank_caughtUpWithServer_syncDownDate___block_invoke_295(uint64_t a1, int a2)
{
  id v3 = [*(id *)(a1 + 32) st];
  id v4 = [v3 filename];
  int v5 = BRCUnlinkAt(a2, v4, 0);

  uint64_t result = 0;
  if (v5 < 0) {
    return *__error();
  }
  return result;
}

- (BOOL)_crossZoneMoveDocumentsToZone:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(BRCClientZone *)self isEqualToClientZone:v4])
  {
    int v5 = brc_bread_crumbs();
    int v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone _crossZoneMoveDocumentsToZone:]();
    }

    char v7 = 0;
  }
  else
  {
    memset(v23, 0, sizeof(v23));
    __brc_create_section(0, (uint64_t)"-[BRCClientZone _crossZoneMoveDocumentsToZone:]", 3101, v23);
    uint64_t v8 = brc_bread_crumbs();
    int v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v25 = v23[0];
      __int16 v26 = 2112;
      id v27 = self;
      __int16 v28 = 2112;
      id v29 = v4;
      __int16 v30 = 2112;
      long long v31 = v8;
      _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx cross zone move documents from %@ to %@%@", buf, 0x2Au);
    }

    uint64_t v10 = self->_session;
    uint64_t v11 = [(BRCClientZone *)self db];
    int v12 = [(BRCClientZone *)self asPrivateClientZone];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke;
    v17[3] = &unk_1E6997878;
    id v13 = v12;
    id v18 = v13;
    id v14 = v11;
    id v19 = v14;
    uint64_t v20 = self;
    uint64_t v15 = v10;
    int v21 = v15;
    id v22 = v4;
    char v7 = [v14 performWithFlags:24 action:v17];

    __brc_leave_section(v23);
  }

  return v7;
}

uint64_t __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v116 = a2;
  long long v140 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  long long v143 = 0u;
  id v3 = [*(id *)(a1 + 32) itemsWithInFlightDiffsEnumerator];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v140 objects:v156 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v141;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v141 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v140 + 1) + 8 * i);
        int v9 = (void *)MEMORY[0x1D9438760]();
        uint64_t v10 = [*(id *)(a1 + 32) serverZone];
        uint64_t v11 = [v10 dbRowID];
        [v8 markLatestSyncRequestFailedInZone:v11];

        [v8 saveToDB];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v140 objects:v156 count:16];
    }
    while (v5);
  }

  int v12 = *(void **)(a1 + 40);
  id v13 = [*(id *)(a1 + 32) dbRowID];
  id v14 = (void *)[v12 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE zone_rowid = %@ AND item_type = 3 AND item_state IN (0, -1)", v13];

  long long v138 = 0u;
  long long v139 = 0u;
  long long v136 = 0u;
  long long v137 = 0u;
  v135[0] = MEMORY[0x1E4F143A8];
  v135[1] = 3221225472;
  v135[2] = __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_2;
  v135[3] = &unk_1E6994120;
  v117 = (id *)(a1 + 40);
  id obj = v14;
  v135[4] = *(void *)(a1 + 48);
  uint64_t v15 = [v14 enumerateObjects:v135];
  uint64_t v16 = [v15 countByEnumeratingWithState:&v136 objects:v155 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v137;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v137 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v136 + 1) + 8 * j);
        int v21 = (void *)MEMORY[0x1D9438760]();
        id v22 = [v20 asBRAlias];
        if ([v22 isKnownByServer])
        {
          uint64_t v23 = [[BRCItemToPathLookup alloc] initWithItem:v22];
          *(_DWORD *)buf = 0;
          uint64_t v24 = [(BRCItemToPathLookup *)v23 parentPath];
          v133[0] = MEMORY[0x1E4F143A8];
          v133[1] = 3221225472;
          v133[2] = __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_3;
          v133[3] = &unk_1E6993E30;
          v133[4] = *(void *)(a1 + 48);
          id v134 = v22;
          [v24 performOnOpenFileDescriptor:v133 error:buf];

          [(BRCItemToPathLookup *)v23 closePaths];
        }
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v136 objects:v155 count:16];
    }
    while (v17);
  }

  uint64_t v25 = *(void **)(a1 + 40);
  __int16 v26 = [*(id *)(a1 + 32) dbRowID];
  id v27 = (void *)[v25 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE zone_rowid = %@ AND item_type in (1, 2, 6, 7)", v26];

  long long v131 = 0u;
  long long v132 = 0u;
  long long v129 = 0u;
  long long v130 = 0u;
  v128[0] = MEMORY[0x1E4F143A8];
  v128[1] = 3221225472;
  v128[2] = __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_4;
  v128[3] = &unk_1E6994120;
  v128[4] = *(void *)(a1 + 48);
  long long v115 = v27;
  id obja = [v27 enumerateObjects:v128];
  uint64_t v28 = [obja countByEnumeratingWithState:&v129 objects:v154 count:16];
  if (v28)
  {
    uint64_t v29 = v28;
    uint64_t v30 = *(void *)v130;
    do
    {
      uint64_t v31 = 0;
      do
      {
        if (*(void *)v130 != v30) {
          objc_enumerationMutation(obja);
        }
        uint64_t v32 = *(void **)(*((void *)&v129 + 1) + 8 * v31);
        id v33 = (void *)MEMORY[0x1D9438760]();
        uint64_t v34 = brc_bread_crumbs();
        id v35 = brc_default_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v147 = (uint64_t)v32;
          __int16 v148 = 2112;
          v149 = v34;
          _os_log_debug_impl(&dword_1D353B000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] cleaning up %@%@", buf, 0x16u);
        }

        uint64_t v36 = [v32 asDocument];
        int64_t v37 = [*(id *)(a1 + 56) fsUploader];
        [v37 cancelAndCleanupItemUpload:v36];

        uint64_t v38 = [*(id *)(a1 + 56) fsDownloader];
        [v38 cancelAndCleanupItemDownloads:v36];

        long long v39 = [v36 currentVersion];
        uint64_t v40 = [v39 uploadedAssets];

        if (v40 || [v36 needsUpload])
        {
          [v36 markNeedsReading];
          [v36 saveToDB];
        }
        unint64_t v41 = *(void **)(a1 + 40);
        uint64_t v42 = [*(id *)(a1 + 64) dbRowID];
        [v41 execute:@"UPDATE client_uploads SET zone_rowid = %@ WHERE throttle_id = %lld", v42, objc_msgSend(v36, "dbRowID")];

        uint64_t v43 = *(void **)(a1 + 40);
        uint64_t v44 = [*(id *)(a1 + 64) dbRowID];
        [v43 execute:@"UPDATE client_downloads SET zone_rowid = %@ WHERE throttle_id = %lld", v44, objc_msgSend(v36, "dbRowID")];

        double v45 = *(void **)(a1 + 40);
        uint64_t v46 = [*(id *)(a1 + 64) dbRowID];
        [v45 execute:@"UPDATE client_reader_throttle SET zone_rowid = %@ WHERE throttle_id = %lld", v46, objc_msgSend(v36, "dbRowID")];

        if ([v36 needsReading] && objc_msgSend(*v117, "changes") <= 0)
        {
          uint64_t v47 = brc_bread_crumbs();
          float v48 = brc_default_log();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v147 = (uint64_t)v47;
            _os_log_fault_impl(&dword_1D353B000, v48, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: !document.needsReading || db.changes > 0%@", buf, 0xCu);
          }
        }
        ++v31;
      }
      while (v29 != v31);
      uint64_t v49 = [obja countByEnumeratingWithState:&v129 objects:v154 count:16];
      uint64_t v29 = v49;
    }
    while (v49);
  }

  int v50 = [v115 error];

  if (v50)
  {
    long long v51 = brc_bread_crumbs();
    uint64_t v52 = brc_default_log();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
      __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_7();
    }
LABEL_101:
    uint64_t v103 = 0;
    goto LABEL_102;
  }
  uint64_t v53 = *(void **)(a1 + 40);
  long long v54 = [*(id *)(a1 + 32) dbRowID];
  int v55 = [v53 execute:@"DELETE FROM client_unapplied_table WHERE zone_rowid = %@", v54];

  if (v55)
  {
    int v56 = *(void **)(a1 + 40);
    long long v57 = [*(id *)(a1 + 64) dbRowID];
    int v58 = [*(id *)(a1 + 32) dbRowID];
    int v55 = [v56 execute:@"UPDATE client_sync_up SET zone_rowid = %@ WHERE zone_rowid = %@   AND throttle_state != 0", v57, v58];

    if (v55)
    {
      int v59 = *(void **)(a1 + 40);
      long long v60 = [*(id *)(a1 + 32) dbRowID];
      int v55 = [v59 execute:@"DELETE FROM client_sync_up WHERE zone_rowid = %@   AND throttle_state = 0", v60];

      if (v55)
      {
        long long v61 = *(void **)(a1 + 40);
        long long v62 = [*(id *)(a1 + 32) dbRowID];
        int v55 = [v61 execute:@"DELETE FROM client_uploads WHERE zone_rowid = %@", v62];
      }
    }
  }
  if (![*v117 changes])
  {
    if (!v55) {
      goto LABEL_45;
    }
    goto LABEL_44;
  }
  long long v107 = brc_bread_crumbs();
  long long v108 = brc_default_log();
  if (os_log_type_enabled(v108, OS_LOG_TYPE_FAULT)) {
    __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_4();
  }

  if (v55)
  {
LABEL_44:
    long long v63 = *(void **)(a1 + 40);
    uint64_t v64 = [*(id *)(a1 + 32) dbRowID];
    int v55 = [v63 execute:@"DELETE FROM client_downloads WHERE zone_rowid = %@", v64];
  }
LABEL_45:
  if (![*v117 changes])
  {
    if (!v55) {
      goto LABEL_48;
    }
    goto LABEL_47;
  }
  long long v109 = brc_bread_crumbs();
  unint64_t v110 = brc_default_log();
  if (os_log_type_enabled(v110, OS_LOG_TYPE_FAULT)) {
    __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_4();
  }

  if (v55)
  {
LABEL_47:
    id v65 = *(void **)(a1 + 40);
    double v66 = [*(id *)(a1 + 32) dbRowID];
    int v55 = [v65 execute:@"DELETE FROM client_reader_throttle WHERE zone_rowid = %@", v66];
  }
LABEL_48:
  if ([*v117 changes])
  {
    __int16 v111 = brc_bread_crumbs();
    long long v112 = brc_default_log();
    if (os_log_type_enabled(v112, OS_LOG_TYPE_FAULT)) {
      __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_4();
    }

    if (!v55) {
      goto LABEL_99;
    }
  }
  else if (!v55)
  {
    goto LABEL_99;
  }
  __int16 v67 = *(void **)(a1 + 40);
  uint64_t v68 = [*(id *)(a1 + 32) dbRowID];
  LODWORD(v67) = [v67 execute:@"DELETE FROM client_items WHERE zone_rowid = %@ AND item_type = 3", v68];

  if (!v67) {
    goto LABEL_99;
  }
  __int16 v69 = *(void **)(a1 + 40);
  __int16 v70 = [*(id *)(a1 + 64) dbRowID];
  __int16 v71 = [*(id *)(a1 + 32) dbRowID];
  LODWORD(v69) = [v69 execute:@"UPDATE client_items SET zone_rowid = %@, item_stat_ckinfo = call_block(%p, item_stat_ckinfo), version_ckinfo   = call_block(%p, version_ckinfo), item_local_diffs = (item_local_diffs | %lld)  WHERE zone_rowid = %@", v70, &__block_literal_global_335, &__block_literal_global_335, 0x2000000000000000, v71];

  if (!v69) {
    goto LABEL_99;
  }
  int v72 = *(void **)(a1 + 40);
  uint64_t v73 = [*(id *)(a1 + 64) dbRowID];
  BOOL v74 = [*(id *)(a1 + 32) dbRowID];
  LODWORD(v72) = [v72 execute:@"UPDATE client_items SET item_parent_zone_rowid = %@ WHERE item_parent_zone_rowid = %@", v73, v74];

  if (!v72) {
    goto LABEL_99;
  }
  uint64_t v75 = *(void **)(a1 + 40);
  uint64_t v76 = [*(id *)(a1 + 32) dbRowID];
  LODWORD(v75) = [v75 execute:@"UPDATE client_items SET version_old_zone_rowid = NULL, version_old_zone_item_id = NULL WHERE version_old_zone_rowid = %@", v76];

  if (!v75) {
    goto LABEL_99;
  }
  v77 = *(void **)(a1 + 40);
  v78 = [*(id *)(a1 + 64) dbRowID];
  uint64_t v79 = [*(id *)(a1 + 32) dbRowID];
  LODWORD(v77) = [v77 execute:@"UPDATE client_items SET version_old_zone_rowid = %@ WHERE version_old_zone_rowid = %@", v78, v79];

  if (!v77
    || (uint64_t v80 = *(void **)(a1 + 40),
        [*(id *)(a1 + 32) dbRowID],
        uint64_t v81 = objc_claimAutoreleasedReturnValue(),
        LOBYTE(v80) = [v80 execute:@"DELETE FROM client_zones WHERE rowid = %@", v81],
        v81,
        (v80 & 1) == 0))
  {
LABEL_99:
    long long v51 = brc_bread_crumbs();
    uint64_t v52 = brc_default_log();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_FAULT)) {
      __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_3();
    }
    goto LABEL_101;
  }
  uint64_t v82 = brc_bread_crumbs();
  uint64_t v83 = brc_default_log();
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v84 = [*(id *)(a1 + 40) changes];
    v85 = *(void **)(a1 + 32);
    v86 = *(NSObject **)(a1 + 64);
    *(_DWORD *)buf = 134218754;
    uint64_t v147 = v84;
    __int16 v148 = 2112;
    v149 = v85;
    __int16 v150 = 2112;
    uint64_t v151 = v86;
    __int16 v152 = 2112;
    v153 = v82;
    _os_log_impl(&dword_1D353B000, v83, OS_LOG_TYPE_DEFAULT, "[NOTICE] cross zone moved %lld items from %@ to %@!%@", buf, 0x2Au);
  }

  [*(id *)(a1 + 64) scheduleSyncUp];
  [*(id *)(a1 + 64) scheduleSyncDownFirst];
  long long v87 = [*(id *)(a1 + 32) appLibraries];
  uint64_t v88 = (void *)[v87 copy];

  long long v126 = 0u;
  long long v127 = 0u;
  long long v124 = 0u;
  long long v125 = 0u;
  long long v51 = v88;
  uint64_t v89 = [v51 countByEnumeratingWithState:&v124 objects:v145 count:16];
  if (v89)
  {
    uint64_t v90 = v89;
    uint64_t v91 = *(void *)v125;
    while (2)
    {
      for (uint64_t k = 0; k != v90; ++k)
      {
        if (*(void *)v125 != v91) {
          objc_enumerationMutation(v51);
        }
        __int16 v93 = *(void **)(*((void *)&v124 + 1) + 8 * k);
        [*(id *)(a1 + 32) removeAppLibrary:v93];
        [v93 associateWithClientZone:*(void *)(a1 + 64)];
        [v93 setStateBits:6291456];
        long long v94 = [*(id *)(a1 + 64) serverZone];
        char v95 = [v94 state];

        if ((v95 & 0x20) != 0) {
          [v93 setStateBits:369098752];
        }
        else {
          [v93 clearStateBits:369098752];
        }
        [v93 scheduleDeepScanWithReason:@"cross-zone move"];
        if (([*(id *)(*(void *)(a1 + 48) + 8) saveAppLibraryToDB:v93] & 1) == 0)
        {
          long long v104 = brc_bread_crumbs();
          uint64_t v105 = brc_default_log();
          if (os_log_type_enabled(v105, (os_log_type_t)0x90u)) {
            __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_2();
          }
          uint64_t v52 = v51;
          goto LABEL_87;
        }
      }
      uint64_t v90 = [v51 countByEnumeratingWithState:&v124 objects:v145 count:16];
      if (v90) {
        continue;
      }
      break;
    }
  }

  long long v96 = [MEMORY[0x1E4F1CA48] array];
  __int16 v97 = [*(id *)(a1 + 64) defaultAppLibrary];
  [v96 addObject:v97];

  long long v122 = 0u;
  long long v123 = 0u;
  long long v120 = 0u;
  long long v121 = 0u;
  uint64_t v52 = v96;
  uint64_t v98 = [v52 countByEnumeratingWithState:&v120 objects:v144 count:16];
  if (v98)
  {
    uint64_t v99 = v98;
    uint64_t v100 = *(void *)v121;
    while (2)
    {
      for (uint64_t m = 0; m != v99; ++m)
      {
        if (*(void *)v121 != v100) {
          objc_enumerationMutation(v52);
        }
        long long v102 = *(void **)(*((void *)&v120 + 1) + 8 * m);
        [v102 setStateBits:0x200000];
        if (([*(id *)(*(void *)(a1 + 48) + 8) saveAppLibraryToDB:v102] & 1) == 0)
        {
          uint64_t v105 = brc_bread_crumbs();
          long long v106 = brc_default_log();
          if (os_log_type_enabled(v106, (os_log_type_t)0x90u))
          {
            long long v114 = [*v117 lastError];
            *(_DWORD *)buf = 138412802;
            uint64_t v147 = (uint64_t)v102;
            __int16 v148 = 2112;
            v149 = v114;
            __int16 v150 = 2112;
            uint64_t v151 = v105;
            _os_log_error_impl(&dword_1D353B000, v106, (os_log_type_t)0x90u, "[ERROR] can't save cross zone move state for appLibrary %@: %@%@", buf, 0x20u);
          }
          long long v104 = v52;
          goto LABEL_87;
        }
      }
      uint64_t v99 = [v52 countByEnumeratingWithState:&v120 objects:v144 count:16];
      if (v99) {
        continue;
      }
      break;
    }
  }

  if (([*(id *)(*(void *)(a1 + 48) + 8) saveClientZoneToDB:*(void *)(a1 + 64)] & 1) == 0)
  {
    long long v104 = brc_bread_crumbs();
    uint64_t v105 = brc_default_log();
    if (os_log_type_enabled(v105, (os_log_type_t)0x90u)) {
      __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_1();
    }
LABEL_87:

    goto LABEL_101;
  }
  uint64_t v103 = 1;
LABEL_102:

  return v103;
}

id __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  char v7 = [v5 session];
  uint64_t v8 = [*(id *)(a1 + 32) session];
  int v9 = [v8 clientDB];
  uint64_t v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

uint64_t __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_3(uint64_t a1, uint64_t a2)
{
  uint64_t v4 = [*(id *)(*(void *)(a1 + 32) + 8) fileUnlinker];
  uint64_t v5 = [*(id *)(a1 + 40) st];
  id v6 = [v5 filename];
  LODWORD(a2) = [v4 renameAndUnlinkInBackgroundItemAt:a2 path:v6];

  return (a2 - 1);
}

id __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_4(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  char v7 = [v5 session];
  uint64_t v8 = [*(id *)(a1 + 32) session];
  int v9 = [v8 clientDB];
  uint64_t v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_333(uint64_t a1, sqlite3_context *a2, uint64_t a3, void *a4)
{
  id v6 = +[BRFieldCKInfo newFromSqliteValue:*a4];
  [v6 markCrossZoneMoved];
  id v5 = [v6 data];
  sqlite3_result_blob(a2, (const void *)[v5 bytes], objc_msgSend(v5, "length"), (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
}

- (BOOL)_hasAllItemsDidUploadHandlers
{
  return self->_bubbleSyncTask || self->_allItemsDidUploadTrackers != 0;
}

- (void)_allItemsDidUploadWithError:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if (![(BRCClientZone *)self _hasAllItemsDidUploadHandlers])
  {
    uint64_t v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone _allItemsDidUploadWithError:]();
    }
  }
  if (v4)
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v4;
      __int16 v25 = 2112;
      __int16 v26 = v5;
      _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] shared iPad: calling the upload handler because sync is failing: %@%@", buf, 0x16u);
    }
  }
  else
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _allItemsDidUploadWithError:]((uint64_t)self);
    }
  }

  bubbleSyncTasuint64_t k = self->_bubbleSyncTask;
  if (bubbleSyncTask)
  {
    [(UMUserSyncTask *)bubbleSyncTask end];
    uint64_t v8 = self->_bubbleSyncTask;
    self->_bubbleSyncTasuint64_t k = 0;
  }
  allItemsDidUploadTrackers = self->_allItemsDidUploadTrackers;
  if (allItemsDidUploadTrackers)
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    uint64_t v10 = allItemsDidUploadTrackers;
    uint64_t v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * v14++), "clientZone:didFinishUploadingAllItemsWithError:", self, v4, (void)v18);
        }
        while (v12 != v14);
        uint64_t v12 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    uint64_t v15 = self->_allItemsDidUploadTrackers;
    self->_allItemsDidUploadTrackers = 0;
  }
}

- (void)recomputeAllItemsDidUploadState
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if ([(BRCClientZone *)self _hasAllItemsDidUploadHandlers])
  {
    p_lastSyncDownError = &self->_lastSyncDownError;
    lastSyncDownError = self->_lastSyncDownError;
    if ((lastSyncDownError && ![(NSError *)lastSyncDownError brc_isEverRetriable]
       || (p_lastSyncDownError = &self->_lastSyncUpError, (lastSyncUpError = self->_lastSyncUpError) != 0)
       && ![(NSError *)lastSyncUpError brc_isEverRetriable])
      && (id v6 = *p_lastSyncDownError) != 0)
    {
      uint64_t v10 = v6;
      [(BRCClientZone *)self _allItemsDidUploadWithError:v6];
    }
    else
    {
      id v11 = 0;
      char v7 = [(BRCClientZone *)self itemCountPendingUploadOrSyncUpAndReturnError:&v11];
      if ([v7 intValue])
      {
        uint64_t v8 = brc_bread_crumbs();
        int v9 = brc_default_log();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v13 = v7;
          __int16 v14 = 2112;
          uint64_t v15 = self;
          __int16 v16 = 2112;
          uint64_t v17 = v8;
          _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] shared iPad: Still need to sync up %@ more items for sync bubble for %@%@", buf, 0x20u);
        }
      }
      else
      {
        [(BRCClientZone *)self _allItemsDidUploadWithError:v11];
      }
    }
  }
}

- (void)handleRootRecordDeletion
{
  db = self->_db;
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __41__BRCClientZone_handleRootRecordDeletion__block_invoke;
  v3[3] = &unk_1E6993A60;
  v3[4] = self;
  [(BRCPQLConnection *)db performWithFlags:17 action:v3];
}

uint64_t __41__BRCClientZone_handleRootRecordDeletion__block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) isPrivateZone])
  {
    id v2 = [*(id *)(a1 + 32) asPrivateClientZone];
    id v3 = [v2 defaultAppLibrary];
    [v3 clearStateBits:2];
  }
  if (([*(id *)(a1 + 32) isCloudDocsZone] & 1) == 0)
  {
    id v4 = *(void **)(a1 + 32);
    id v5 = [v4 asPrivateClientZone];
    id v6 = [v5 defaultAppLibrary];
    char v7 = [v6 dbRowID];
    uint64_t v8 = +[BRCItemID documentsItemIDWithAppLibraryRowID:v7];
    int v9 = [v4 itemByItemID:v8];

    [v9 markForceNeedsSyncUp];
    [v9 saveToDB];
  }
  return 1;
}

- (void)didGCTombstoneRanks:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCPQLConnection *)self->_db serialQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __37__BRCClientZone_didGCTombstoneRanks___block_invoke;
  v7[3] = &unk_1E6993628;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

uint64_t __37__BRCClientZone_didGCTombstoneRanks___block_invoke(uint64_t a1)
{
  uint64_t result = [*(id *)(a1 + 32) activated];
  if (result)
  {
    id v3 = brc_bread_crumbs();
    id v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __37__BRCClientZone_didGCTombstoneRanks___block_invoke_cold_1(a1);
    }

    [*(id *)(*(void *)(a1 + 32) + 264) removeIndexes:*(void *)(a1 + 40)];
    if (![*(id *)(*(void *)(a1 + 32) + 264) count])
    {
      uint64_t v5 = *(void *)(a1 + 32);
      id v6 = *(void **)(v5 + 264);
      *(void *)(v5 + 264) = 0;
    }
    return [*(id *)(a1 + 32) setNeedsSave:1];
  }
  return result;
}

- (void)didApplyTombstoneForRank:(int64_t)a3
{
  if (a3 >= 1)
  {
    appliedTombstoneRanks = self->_appliedTombstoneRanks;
    if (appliedTombstoneRanks)
    {
      [(NSMutableIndexSet *)appliedTombstoneRanks addIndex:a3];
    }
    else
    {
      uint64_t v5 = (NSMutableIndexSet *)[objc_alloc(MEMORY[0x1E4F28E60]) initWithIndex:a3];
      id v6 = self->_appliedTombstoneRanks;
      self->_appliedTombstoneRanks = v5;
    }
    char v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone didApplyTombstoneForRank:]();
    }

    [(BRCClientZone *)self setNeedsSave:1];
  }
}

- (void)flushAppliedTombstones
{
  OUTLINED_FUNCTION_11_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Signaling that tombstones can be collected in %@%@", (void)v3, DWORD2(v3));
}

- (BOOL)hasCompletedInitialSyncDownOnce
{
  return self->_lastSyncDownDate != 0;
}

- (BOOL)_checkIfEnumeratorContainsNonDiscretionaryOp:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v9;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v9 != v5) {
          objc_enumerationMutation(v3);
        }
        if (objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * i), "nonDiscretionary", (void)v8))
        {
          LOBYTE(v4) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (BOOL)_hasNonDiscretionaryServerStitchingOperation
{
  id v3 = [(NSMutableDictionary *)self->_runningListOperations objectEnumerator];
  if ([(BRCClientZone *)self _checkIfEnumeratorContainsNonDiscretionaryOp:v3])
  {
    BOOL v4 = 1;
  }
  else
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_recursiveListOperations objectEnumerator];
    if ([(BRCClientZone *)self _checkIfEnumeratorContainsNonDiscretionaryOp:v5])
    {
      BOOL v4 = 1;
    }
    else
    {
      id v6 = [(NSMutableDictionary *)self->_fetchParentOperations objectEnumerator];
      if ([(BRCClientZone *)self _checkIfEnumeratorContainsNonDiscretionaryOp:v6])
      {
        BOOL v4 = 1;
      }
      else
      {
        char v7 = [(NSMutableDictionary *)self->_locateRecordOperations objectEnumerator];
        BOOL v4 = [(BRCClientZone *)self _checkIfEnumeratorContainsNonDiscretionaryOp:v7];
      }
    }
  }
  return v4;
}

- (void)_registerOperation:(id)a3 throttler:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = (BRCServerZone *)a3;
  db = self->_db;
  id v8 = a4;
  [(BRCPQLConnection *)db assertOnQueue];
  [(BRCServerZone *)v6 setOperationThrottle:v8];

  long long v9 = [(BRCServerZone *)self->_serverZone mangledID];
  long long v10 = +[BRCUserDefaults defaultsForMangledID:v9];

  long long v11 = [(BRCServerZone *)self->_serverZone clientZone];
  if ([v11 isSyncBlockedBecauseAppNotInstalled])
  {
    int v12 = [(BRCServerZone *)v6 nonDiscretionary];

    if (v12)
    {
      brc_bread_crumbs();
      uint64_t v13 = (NSError *)objc_claimAutoreleasedReturnValue();
      __int16 v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        serverZone = self->_serverZone;
        int v41 = 138412802;
        uint64_t v42 = serverZone;
        __int16 v43 = 2112;
        uint64_t v44 = v6;
        __int16 v45 = 2112;
        uint64_t v46 = v13;
        _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] The zone %@ is blocked because the app isn't installed but we have a non-discretionary op %@. Unblocking the zone%@", (uint8_t *)&v41, 0x20u);
      }

      [(BRCClientZone *)self clearStateBits:4096];
    }
  }
  else
  {
  }
  if (self->_syncDownOperation)
  {
    int v16 = [(BRCServerZone *)v6 nonDiscretionary];
    BOOL v17 = [(_BRCOperation *)self->_syncDownOperation nonDiscretionary];
    if (v16 && !v17)
    {
      uint64_t v18 = brc_bread_crumbs();
      long long v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone _registerOperation:throttler:]();
      }

      [(BRCSyncOperationThrottle *)self->_syncDownThrottle graceNextRequest];
      [(_BRCOperation *)self->_syncDownOperation cancel];
      [(BRCClientZone *)self scheduleSyncDown];
    }
    [(BRCServerZone *)v6 addDependency:self->_syncDownOperation];
  }
  if (![(BRCClientZone *)self isSharedZone]
    && [(BRCServerZone *)self->_serverZone zoneCreationState] == 2)
  {
    long long v20 = brc_bread_crumbs();
    long long v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _registerOperation:throttler:]();
    }

    id v22 = (void *)MEMORY[0x1E4F28C58];
    uint64_t v23 = [(BRMangledID *)self->_mangledID appLibraryOrZoneName];
    id v24 = objc_msgSend(v22, "brc_errorClientZoneNotFound:", v23);
    [(BRCServerZone *)v6 completedWithResult:0 error:v24];

    [(BRCServerZone *)v6 cancel];
    goto LABEL_22;
  }
  __int16 v25 = [(BRCServerZone *)self->_serverZone clientZone];
  if ([v25 hasCompletedInitialSyncDownOnce])
  {

LABEL_22:
    [(BRCServerZone *)v6 schedule];
    goto LABEL_23;
  }
  char v26 = [v10 allowsDirectoryListBeforeInitialChangeToken];

  if (v26) {
    goto LABEL_22;
  }
  [v10 throttleThresholdBeforeImmediatelyFailingNonDiscretionaryOp];
  double v28 = v27;
  [(BRCSyncOperationThrottle *)self->_syncDownThrottle nextTry];
  double v30 = v29;
  brc_current_date_nsec();
  brc_interval_from_nsec();
  double v32 = v31;
  if ([(BRCServerZone *)v6 nonDiscretionary]
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && !self->_syncDownOperation
    && v30 > v28 + v32)
  {
    lastSyncDownError = self->_lastSyncDownError;
    if (lastSyncDownError)
    {
      uint64_t v34 = lastSyncDownError;
    }
    else
    {
      objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
      uint64_t v34 = (NSError *)objc_claimAutoreleasedReturnValue();
    }
    int64_t v37 = v34;
    uint64_t v38 = brc_bread_crumbs();
    long long v39 = brc_default_log();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v40 = +[BRCDumpContext stringFromInterval:0 context:v30 - v32];
      int v41 = 138413058;
      uint64_t v42 = v6;
      __int16 v43 = 2112;
      uint64_t v44 = v40;
      __int16 v45 = 2112;
      uint64_t v46 = v37;
      __int16 v47 = 2112;
      float v48 = v38;
      _os_log_impl(&dword_1D353B000, v39, OS_LOG_TYPE_DEFAULT, "[WARNING] Failing non-discretionary list operation %@ right away because we are heavily throttled (next try %@) %@%@", (uint8_t *)&v41, 0x2Au);
    }
    [(BRCServerZone *)v6 completedWithResult:0 error:v37];
    [(BRCServerZone *)v6 cancel];
    [(BRCServerZone *)v6 schedule];
  }
  else
  {
    id v35 = brc_bread_crumbs();
    uint64_t v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _registerOperation:throttler:]((uint64_t)v6);
    }

    [(NSMutableArray *)self->_blockedOperationsOnInitialSync addObject:v6];
    [(BRCClientZone *)self scheduleSyncDownFirst];
  }
LABEL_23:
}

- (void)_registerServerStitchingOperation:(id)a3
{
}

- (void)_registerListOperation:(id)a3 shareAcceptOperation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  id v8 = brc_bread_crumbs();
  long long v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRCClientZone _registerListOperation:shareAcceptOperation:]();
  }

  [(BRCClientZone *)self _registerServerStitchingOperation:v6];
  if (v7)
  {
    long long v10 = brc_bread_crumbs();
    long long v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _registerListOperation:shareAcceptOperation:]((uint64_t)v7);
    }

    [v6 addDependency:v7];
  }
  int v12 = [(BRCServerZone *)self->_serverZone changeState];
  uint64_t v13 = [v12 changeToken];
  if (v13)
  {
  }
  else
  {
    BOOL v14 = [(BRCClientZone *)self isSyncBlockedBecauseAppNotInstalled];

    if (!v14)
    {
      BOOL v17 = [(BRCServerZone *)self->_serverZone clientZone];
      [v17 scheduleSyncDownFirst];

      goto LABEL_11;
    }
  }
  [(BRCClientZone *)self _blockLowPriorityStitchingOperationsForOperation:v6];
LABEL_11:
  runningListOperations = self->_runningListOperations;
  int v16 = [v6 folderToList];
  [(NSMutableDictionary *)runningListOperations setObject:v6 forKeyedSubscript:v16];
}

- (id)cancelListOperationAndReschedule:(id)a3
{
  db = self->_db;
  id v5 = a3;
  [(BRCPQLConnection *)db assertOnQueue];
  runningListOperations = self->_runningListOperations;
  id v7 = [v5 folderToList];
  [(NSMutableDictionary *)runningListOperations removeObjectForKey:v7];

  id v8 = [v5 folderToList];
  long long v9 = -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:](self, "fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:", v8, [v5 nonDiscretionary], objc_msgSend(v5, "rescheduleApply"));

  [v5 cancelToBeReplacedByOperation:v9];
  return v9;
}

- (void)_registerFetchParentChainOperation:(id)a3
{
  id v4 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  id v5 = [v4 parentIDToList];
  if (v5)
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _registerFetchParentChainOperation:]((uint64_t)v5);
    }

    [(BRCClientZone *)self _registerServerStitchingOperation:v4];
    [(BRCClientZone *)self _blockLowPriorityStitchingOperationsForOperation:v4];
    [(NSMutableDictionary *)self->_fetchParentOperations setObject:v4 forKeyedSubscript:v5];
  }
  else
  {
    id v8 = brc_bread_crumbs();
    long long v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone _registerFetchParentChainOperation:]((uint64_t)v4);
    }
  }
}

- (id)cancelFetchParentChainOperationAndReschedule:(id)a3
{
  db = self->_db;
  id v5 = a3;
  [(BRCPQLConnection *)db assertOnQueue];
  id v6 = [v5 parentIDToList];
  [(NSMutableDictionary *)self->_fetchParentOperations removeObjectForKey:v6];
  id v7 = -[BRCClientZone fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:](self, "fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:", v6, [v5 nonDiscretionary]);
  [v5 cancelToBeReplacedByOperation:v7];

  return v7;
}

- (void)_registerLocateRecordOperation:(id)a3
{
  id v4 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  id v5 = [v4 recordID];
  id v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    -[BRCClientZone _registerLocateRecordOperation:]((uint64_t)v5);
  }

  [(BRCClientZone *)self _registerOperation:v4 throttler:self->_locateRecordsOperationThrottle];
  [(BRCClientZone *)self _blockLowPriorityStitchingOperationsForOperation:v4];
  [(NSMutableDictionary *)self->_locateRecordOperations setObject:v4 forKeyedSubscript:v5];
}

- (id)cancelLocateRecordOperationAndReschedule:(id)a3
{
  db = self->_db;
  id v5 = a3;
  [(BRCPQLConnection *)db assertOnQueue];
  id v6 = [v5 recordID];
  [(NSMutableDictionary *)self->_locateRecordOperations removeObjectForKey:v6];
  id v7 = -[BRCClientZone locateRecordIfNecessaryForRecordID:isUserWaiting:](self, "locateRecordIfNecessaryForRecordID:isUserWaiting:", v6, [v5 nonDiscretionary]);
  [v5 cancelToBeReplacedByOperation:v7];

  return v7;
}

- (BOOL)_isSideSyncOperationBlockedWithName:(id)a3
{
  return [(BRCClientZone *)self _isSideSyncOperationBlockedWithName:a3 isWaitingOnShareAccept:0];
}

- (BOOL)_isSideSyncOperationBlockedWithName:(id)a3 isWaitingOnShareAccept:(BOOL)a4
{
  id v5 = a3;
  if (self->_activated)
  {
    if ([(BRCClientZone *)self isSyncBlockedBecauseOSNeedsUpgrade])
    {
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone _isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:]((uint64_t)v5);
      }
    }
    else if ((self->_state & 0x100) != 0)
    {
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone _isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:].cold.4((uint64_t)v5);
      }
    }
    else
    {
      if ([(BRCServerZone *)self->_serverZone zoneCreationState] != 2)
      {
        BOOL v8 = 0;
        goto LABEL_14;
      }
      id v6 = brc_bread_crumbs();
      id v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone _isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:]((uint64_t)v5);
      }
    }
  }
  else
  {
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _isSideSyncOperationBlockedWithName:isWaitingOnShareAccept:]((uint64_t)v5);
    }
  }

  BOOL v8 = 1;
LABEL_14:

  return v8;
}

- (id)fetchDirectoryContentsIfNecessary:(id)a3 isUserWaiting:(BOOL)a4 rescheduleApplyScheduler:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if ([(BRCClientZone *)self isSharedZone])
  {
    long long v9 = [(BRCClientZone *)self asSharedClientZone];
    long long v10 = [v9 shareAcceptOperationForItemID:v8];
  }
  else
  {
    long long v10 = 0;
  }
  if ([(BRCClientZone *)self _isSideSyncOperationBlockedWithName:@"list" isWaitingOnShareAccept:v10 != 0])
  {
    long long v11 = 0;
    goto LABEL_24;
  }
  if (!v8)
  {
    brc_bread_crumbs();
    int v12 = (BRCItemGlobalID *)objc_claimAutoreleasedReturnValue();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:]();
    }

    goto LABEL_22;
  }
  int v12 = [[BRCItemGlobalID alloc] initWithZoneRowID:self->_dbRowID itemID:v8];
  if (([(BRCServerZone *)self->_serverZone state] & 4) != 0)
  {
    if (v5)
    {
      id v16 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT item_type FROM client_items WHERE item_id = %@ AND zone_rowid = %@", v8, self->_dbRowID];
      if ([v16 intValue] == 9)
      {
        BOOL v17 = [(BRCAccountSession *)self->_session applyScheduler];
        [v17 rescheduleItemsParentedToItemGlobalID:v12];
      }
    }
    uint64_t v18 = brc_bread_crumbs();
    long long v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:].cold.4();
    }

    goto LABEL_22;
  }
  uint64_t v13 = [(NSMutableDictionary *)self->_runningListOperations objectForKeyedSubscript:v8];
  long long v11 = v13;
  if (v6 && v13)
  {
    if (![(_BRCOperation *)v13 nonDiscretionary])
    {
      BOOL v14 = v11;
      goto LABEL_31;
    }
LABEL_28:
    if (v5) {
      [(BRCListDirectoryContentsOperation *)v11 setRescheduleApply:1];
    }
    goto LABEL_23;
  }
  if (v13) {
    goto LABEL_28;
  }
  BOOL v14 = 0;
LABEL_31:
  long long v21 = [(BRCServerZone *)self->_serverZone failedListItemIDs];
  int v22 = [v21 containsObject:v8];

  if (!v22)
  {
    int v25 = [(BRCClientZone *)self serverItemTypeByItemID:v8 db:self->_db];
    if (v25 == -1) {
      int v25 = [(BRCClientZone *)self itemTypeByItemID:v8 db:self->_db];
    }
    if (v25 - 9 >= 2 && v25 != 255)
    {
      if (v5)
      {
        id v32 = [(PQLConnection *)self->_db numberWithSQL:@"SELECT item_type FROM client_items WHERE item_id = %@ AND zone_rowid = %@", v8, self->_dbRowID];
        if ([v32 intValue] == 9)
        {
          id v33 = [(BRCAccountSession *)self->_session applyScheduler];
          [v33 rescheduleItemsParentedToItemGlobalID:v12];
        }
      }
      uint64_t v34 = brc_bread_crumbs();
      id v35 = brc_default_log();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v40 = [v8 debugItemIDString];
        *(_DWORD *)locatiouint64_t n = 138413058;
        *(void *)&location[4] = v40;
        __int16 v47 = 2112;
        float v48 = self;
        __int16 v49 = 1024;
        int v50 = v25;
        __int16 v51 = 2112;
        uint64_t v52 = v34;
        _os_log_debug_impl(&dword_1D353B000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] Can't list item %@ in zone %@ which isn't a directory fault %d%@", location, 0x26u);
      }
      goto LABEL_22;
    }
    if ([v8 isDocumentsFolder])
    {
      sessiouint64_t n = self->_session;
      double v27 = [v8 appLibraryRowID];
      double v28 = [(BRCAccountSession *)session appLibraryByRowID:v27];

      if (([v28 includesDataScope] & 1) == 0)
      {
        brc_bread_crumbs();
        uint64_t v36 = (BRCClientZone *)objc_claimAutoreleasedReturnValue();
        int64_t v37 = brc_default_log();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          uint64_t v38 = [v28 mangledID];
          long long v39 = [v38 debugDescription];
          *(_DWORD *)locatiouint64_t n = 138412546;
          *(void *)&location[4] = v39;
          __int16 v47 = 2112;
          float v48 = v36;
          _os_log_impl(&dword_1D353B000, v37, OS_LOG_TYPE_DEFAULT, "[WARNING] Got request to list documents directory of app library that don't have data scope. AppLibrary [%@].%@", location, 0x16u);
        }
        goto LABEL_22;
      }
    }
    double v29 = [[BRCListDirectoryContentsOperation alloc] initWithItemID:v8 sessionContext:self->_session zone:self->_serverZone isUserWaiting:v6];
    [(BRCListDirectoryContentsOperation *)v29 setRescheduleApply:[(BRCListDirectoryContentsOperation *)v14 rescheduleApply] | v5];
    objc_initWeak((id *)location, self);
    if (v14)
    {
      double v30 = brc_bread_crumbs();
      double v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:]((uint64_t)v14);
      }

      [(BRCListDirectoryContentsOperation *)v14 cancelToBeReplacedByOperation:v29];
    }
    else
    {
      objc_initWeak(&from, v29);
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = __90__BRCClientZone_fetchDirectoryContentsIfNecessary_isUserWaiting_rescheduleApplyScheduler___block_invoke;
      v41[3] = &unk_1E69978A0;
      objc_copyWeak(&v43, (id *)location);
      objc_copyWeak(&v44, &from);
      id v42 = v8;
      [(BRCListDirectoryContentsOperation *)v29 addDirectoryListCompletionBlock:v41];

      objc_destroyWeak(&v44);
      objc_destroyWeak(&v43);
      objc_destroyWeak(&from);
    }
    [(BRCClientZone *)self _registerListOperation:v29 shareAcceptOperation:v10];
    long long v11 = v29;
    objc_destroyWeak((id *)location);

    goto LABEL_23;
  }
  uint64_t v23 = brc_bread_crumbs();
  id v24 = brc_default_log();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
    -[BRCClientZone fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:]();
  }

LABEL_22:
  long long v11 = 0;
LABEL_23:

LABEL_24:
  return v11;
}

void __90__BRCClientZone_fetchDirectoryContentsIfNecessary_isUserWaiting_rescheduleApplyScheduler___block_invoke(id *a1, void *a2)
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id WeakRetained = objc_loadWeakRetained(a1 + 5);
  id v5 = objc_loadWeakRetained(a1 + 6);
  if (WeakRetained)
  {
    BOOL v6 = [WeakRetained db];
    id v7 = [v6 serialQueue];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __90__BRCClientZone_fetchDirectoryContentsIfNecessary_isUserWaiting_rescheduleApplyScheduler___block_invoke_2;
    v14[3] = &unk_1E6993628;
    void v14[4] = WeakRetained;
    id v15 = a1[4];
    dispatch_async(v7, v14);
  }
  if (v3)
  {
    id v8 = brc_bread_crumbs();
    long long v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      long long v10 = [a1[4] debugItemIDString];
      *(_DWORD *)buf = 138413058;
      BOOL v17 = v10;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v3;
      __int16 v22 = 2112;
      uint64_t v23 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed listing directory %@ in %@ - %@%@", buf, 0x2Au);
    }
    [WeakRetained handleZoneLevelErrorIfNeeded:v3 forItemCreation:0];
  }
  else
  {
    long long v11 = brc_bread_crumbs();
    int v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = [a1[4] debugItemIDString];
      *(_DWORD *)buf = 138412802;
      BOOL v17 = v13;
      __int16 v18 = 2112;
      id v19 = v5;
      __int16 v20 = 2112;
      id v21 = v11;
      _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished listing contents of %@ in %@%@", buf, 0x20u);
    }
  }
}

uint64_t __90__BRCClientZone_fetchDirectoryContentsIfNecessary_isUserWaiting_rescheduleApplyScheduler___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 200) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)fetchRecursiveDirectoryContentsIfNecessary:(id)a3 isUserWaiting:(BOOL)a4 rescheduleApply:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if ([(BRCClientZone *)self _isSideSyncOperationBlockedWithName:@"list recursively"])
  {
    goto LABEL_2;
  }
  if (!v8)
  {
    brc_bread_crumbs();
    long long v11 = (BRCItemGlobalID *)objc_claimAutoreleasedReturnValue();
    p_super = brc_default_log();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:]();
    }
    goto LABEL_15;
  }
  if (([(BRCServerZone *)self->_serverZone state] & 4) != 0)
  {
    if (!v5)
    {
LABEL_2:
      long long v9 = 0;
      goto LABEL_17;
    }
    long long v11 = [[BRCItemGlobalID alloc] initWithZoneRowID:self->_dbRowID itemID:v8];
    uint64_t v13 = brc_bread_crumbs();
    BOOL v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:].cold.5((uint64_t)v11);
    }

    p_super = [(BRCAccountSession *)self->_session applyScheduler];
    [p_super rescheduleItemsRecursivelyUnderFolder:v11];
    goto LABEL_15;
  }
  long long v10 = [(NSMutableDictionary *)self->_recursiveListOperations objectForKeyedSubscript:v8];
  long long v9 = v10;
  if (!v6 || !v10)
  {
    if (!v10) {
      goto LABEL_26;
    }
LABEL_21:
    if (v5 && ([(BRCItemGlobalID *)v9 rescheduleApply] & 1) == 0)
    {
      [(BRCItemGlobalID *)v9 setRescheduleApply:1];
      id v16 = [[BRCItemGlobalID alloc] initWithZoneRowID:self->_dbRowID itemID:v8];
      BOOL v17 = [(BRCAccountSession *)self->_session applyScheduler];
      [v17 rescheduleItemsRecursivelyUnderFolder:v16];
    }
    brc_bread_crumbs();
    long long v11 = (BRCItemGlobalID *)objc_claimAutoreleasedReturnValue();
    p_super = brc_default_log();
    if (os_log_type_enabled(p_super, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:]();
    }
    goto LABEL_16;
  }
  if ([(BRCItemGlobalID *)v10 nonDiscretionary]) {
    goto LABEL_21;
  }
  [(BRCItemGlobalID *)v9 cancel];
LABEL_26:
  if (![v8 isDocumentsFolder])
  {
LABEL_29:
    __int16 v20 = [[BRCRecursiveListDirectoryContentsOperation alloc] initWithItemID:v8 sessionContext:self->_session zone:self->_serverZone isUserWaiting:v6];
    [(BRCRecursiveListDirectoryContentsOperation *)v20 setRescheduleApply:v5];
    objc_initWeak(&location, self);
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = __90__BRCClientZone_fetchRecursiveDirectoryContentsIfNecessary_isUserWaiting_rescheduleApply___block_invoke;
    v40[3] = &unk_1E69978C8;
    objc_copyWeak(&v42, &location);
    id v21 = v8;
    id v41 = v21;
    [(_BRCOperation *)v20 setFinishBlock:v40];
    [(NSMutableDictionary *)self->_recursiveListOperations setObject:v20 forKeyedSubscript:v21];
    if (v9)
    {
      __int16 v22 = brc_bread_crumbs();
      uint64_t v23 = brc_default_log();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v24 = [v21 debugItemIDString];
        -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:].cold.4(v24, (uint64_t)v22, (uint64_t)buf);
      }

      long long v38 = 0u;
      long long v39 = 0u;
      long long v36 = 0u;
      long long v37 = 0u;
      int v25 = [(BRCItemGlobalID *)v9 dependencies];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v37;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v37 != v27) {
              objc_enumerationMutation(v25);
            }
            [(_BRCOperation *)v20 addDependency:*(void *)(*((void *)&v36 + 1) + 8 * i)];
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v36 objects:v44 count:16];
        }
        while (v26);
      }

      [(BRCAutoCancelOperation *)v20 beginObservingChanges];
      if ([(BRCItemGlobalID *)v9 isExecuting]) {
        [(_BRCOperation *)v20 addDependency:v9];
      }
    }
    else
    {
      double v29 = brc_bread_crumbs();
      double v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        double v31 = [v21 debugItemIDString];
        -[BRCClientZone fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:](v31, (uint64_t)v29, (uint64_t)buf);
      }
    }
    [(_BRCOperation *)v20 schedule];
    long long v11 = v20;

    objc_destroyWeak(&v42);
    objc_destroyWeak(&location);
    p_super = &v9->super;
    long long v9 = v11;
    goto LABEL_16;
  }
  sessiouint64_t n = self->_session;
  id v19 = [v8 appLibraryRowID];
  p_super = [(BRCAccountSession *)session appLibraryByRowID:v19];

  if ([p_super includesDataScope])
  {

    goto LABEL_29;
  }
  id v32 = brc_bread_crumbs();
  id v33 = brc_default_log();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v34 = [p_super mangledID];
    id v35 = [v34 debugDescription];
    *(_DWORD *)buf = 138412546;
    uint64_t v46 = v35;
    __int16 v47 = 2112;
    float v48 = v32;
    _os_log_impl(&dword_1D353B000, v33, OS_LOG_TYPE_DEFAULT, "[WARNING] Got request to rec-list documents directory of app library that don't have data scope. AppLibrary [%@].%@", buf, 0x16u);
  }
  long long v11 = v9;
LABEL_15:
  long long v9 = 0;
LABEL_16:

LABEL_17:
  return v9;
}

void __90__BRCClientZone_fetchRecursiveDirectoryContentsIfNecessary_isUserWaiting_rescheduleApply___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  BOOL v6 = WeakRetained;
  if (WeakRetained)
  {
    id v7 = [WeakRetained db];
    id v8 = [v7 serialQueue];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __90__BRCClientZone_fetchRecursiveDirectoryContentsIfNecessary_isUserWaiting_rescheduleApply___block_invoke_2;
    v12[3] = &unk_1E6993628;
    v12[4] = v6;
    id v13 = *(id *)(a1 + 32);
    dispatch_async(v8, v12);
  }
  long long v9 = brc_bread_crumbs();
  long long v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    long long v11 = [*(id *)(a1 + 32) debugItemIDString];
    *(_DWORD *)buf = 138412802;
    id v15 = v11;
    __int16 v16 = 2112;
    id v17 = v4;
    __int16 v18 = 2112;
    id v19 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished listing contents of %@ with error %@%@", buf, 0x20u);
  }
}

uint64_t __90__BRCClientZone_fetchRecursiveDirectoryContentsIfNecessary_isUserWaiting_rescheduleApply___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 208) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)fetchParentChainIfNecessaryWithParentItemID:(id)a3 isUserWaiting:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if ([(BRCClientZone *)self _isSideSyncOperationBlockedWithName:@"fetch parent chain"])
  {
    id v7 = 0;
    goto LABEL_22;
  }
  if (!v6)
  {
    brc_bread_crumbs();
    id v8 = (BRCFetchParentChainOperation *)objc_claimAutoreleasedReturnValue();
    long long v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:]();
    }

    goto LABEL_11;
  }
  if (![v6 isNonDesktopRoot])
  {
    long long v11 = [(NSMutableDictionary *)self->_fetchParentOperations objectForKeyedSubscript:v6];
    int v12 = v11;
    if (v4 && v11)
    {
      if (([v11 nonDiscretionary] & 1) == 0)
      {
LABEL_15:
        id v13 = [[BRCFetchParentChainOperation alloc] initWithParentID:v6 sessionContext:self->_session zone:self->_serverZone isUserWaiting:v4];
        objc_initWeak((id *)buf, self);
        if (v12)
        {
          [v12 cancelToBeReplacedByOperation:v13];
        }
        else
        {
          uint64_t v15 = MEMORY[0x1E4F143A8];
          uint64_t v16 = 3221225472;
          id v17 = __75__BRCClientZone_fetchParentChainIfNecessaryWithParentItemID_isUserWaiting___block_invoke;
          __int16 v18 = &unk_1E69944E8;
          objc_copyWeak(&v20, (id *)buf);
          id v19 = v6;
          [(BRCFetchParentChainOperation *)v13 addFetchParentChainCompletionBlock:&v15];

          objc_destroyWeak(&v20);
        }
        -[BRCClientZone _registerFetchParentChainOperation:](self, "_registerFetchParentChainOperation:", v13, v15, v16, v17, v18);
        id v8 = v13;
        objc_destroyWeak((id *)buf);

        id v7 = v8;
        goto LABEL_21;
      }
    }
    else if (!v11)
    {
      goto LABEL_15;
    }
    id v8 = v12;
    id v7 = v8;
    goto LABEL_21;
  }
  brc_bread_crumbs();
  id v8 = (BRCFetchParentChainOperation *)objc_claimAutoreleasedReturnValue();
  long long v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    __int16 v22 = v8;
    _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't fetch parent chain of a root item%@", buf, 0xCu);
  }

LABEL_11:
  id v7 = 0;
LABEL_21:

LABEL_22:
  return v7;
}

void __75__BRCClientZone_fetchParentChainIfNecessaryWithParentItemID_isUserWaiting___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = [WeakRetained db];
    BOOL v5 = [v4 serialQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __75__BRCClientZone_fetchParentChainIfNecessaryWithParentItemID_isUserWaiting___block_invoke_2;
    v6[3] = &unk_1E6993628;
    v6[4] = v3;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(v5, v6);
  }
}

uint64_t __75__BRCClientZone_fetchParentChainIfNecessaryWithParentItemID_isUserWaiting___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 216) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)locateRecordIfNecessaryForRecordID:(id)a3 isUserWaiting:(BOOL)a4 maxOperationBackoff:(double)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if ([(BRCClientZone *)self _isSideSyncOperationBlockedWithName:@"locate record"])
  {
    long long v9 = 0;
    goto LABEL_22;
  }
  if (!v8)
  {
    brc_bread_crumbs();
    int v12 = (BRCLocateRecordOperation *)objc_claimAutoreleasedReturnValue();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone locateRecordIfNecessaryForRecordID:isUserWaiting:maxOperationBackoff:]();
    }
    goto LABEL_10;
  }
  long long v10 = [v8 recordName];
  if (![v10 hasPrefix:@"shareAlias/"])
  {

    goto LABEL_12;
  }
  BOOL v11 = [(BRCClientZone *)self isPrivateZone];

  if (v11)
  {
LABEL_12:
    BOOL v14 = [(NSMutableDictionary *)self->_locateRecordOperations objectForKeyedSubscript:v8];
    uint64_t v15 = v14;
    if (v6 && v14)
    {
      if (([v14 nonDiscretionary] & 1) == 0)
      {
LABEL_15:
        uint64_t v16 = [[BRCLocateRecordOperation alloc] initWithRecordID:v8 serverZone:self->_serverZone isUserWaiting:v6 maxBackoff:self->_session sessionContext:a5];
        objc_initWeak(&location, self);
        if (v15)
        {
          [v15 cancelToBeReplacedByOperation:v16];
        }
        else
        {
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = __86__BRCClientZone_locateRecordIfNecessaryForRecordID_isUserWaiting_maxOperationBackoff___block_invoke;
          uint64_t v18[3] = &unk_1E69978F0;
          objc_copyWeak(&v20, &location);
          id v19 = v8;
          [(BRCLocateRecordOperation *)v16 addLocateRecordCompletionBlock:v18];

          objc_destroyWeak(&v20);
        }
        [(BRCClientZone *)self _registerLocateRecordOperation:v16];
        int v12 = v16;
        objc_destroyWeak(&location);

        long long v9 = v12;
        goto LABEL_21;
      }
    }
    else if (!v14)
    {
      goto LABEL_15;
    }
    int v12 = v15;
    long long v9 = v12;
    goto LABEL_21;
  }
  brc_bread_crumbs();
  int v12 = (BRCLocateRecordOperation *)objc_claimAutoreleasedReturnValue();
  id v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
    -[BRCClientZone locateRecordIfNecessaryForRecordID:isUserWaiting:maxOperationBackoff:]();
  }
LABEL_10:

  long long v9 = 0;
LABEL_21:

LABEL_22:
  return v9;
}

void __86__BRCClientZone_locateRecordIfNecessaryForRecordID_isUserWaiting_maxOperationBackoff___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 40));
  id v3 = WeakRetained;
  if (WeakRetained)
  {
    BOOL v4 = [WeakRetained db];
    BOOL v5 = [v4 serialQueue];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __86__BRCClientZone_locateRecordIfNecessaryForRecordID_isUserWaiting_maxOperationBackoff___block_invoke_2;
    v6[3] = &unk_1E6993628;
    v6[4] = v3;
    id v7 = *(id *)(a1 + 32);
    dispatch_async(v5, v6);
  }
}

uint64_t __86__BRCClientZone_locateRecordIfNecessaryForRecordID_isUserWaiting_maxOperationBackoff___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 224) removeObjectForKey:*(void *)(a1 + 40)];
}

- (id)locateRecordIfNecessaryForRecordID:(id)a3 isUserWaiting:(BOOL)a4
{
  return [(BRCClientZone *)self locateRecordIfNecessaryForRecordID:a3 isUserWaiting:a4 maxOperationBackoff:1.79769313e308];
}

- (void)clearAndRefetchRecentAndFavoriteDocuments
{
  id v3 = [(BRCServerZone *)self->_serverZone db];
  BOOL v4 = [v3 serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__BRCClientZone_clearAndRefetchRecentAndFavoriteDocuments__block_invoke;
  block[3] = &unk_1E6993698;
  void block[4] = self;
  dispatch_async(v4, block);
}

void __58__BRCClientZone_clearAndRefetchRecentAndFavoriteDocuments__block_invoke(uint64_t a1)
{
  [*(id *)(*(void *)(a1 + 32) + 16) clearStateBits:24];
  os_log_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) clientTruthWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __58__BRCClientZone_clearAndRefetchRecentAndFavoriteDocuments__block_invoke_2;
  block[3] = &unk_1E6993698;
  void block[4] = *(void *)(a1 + 32);
  dispatch_async(v2, block);
}

uint64_t __58__BRCClientZone_clearAndRefetchRecentAndFavoriteDocuments__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) fetchRecentAndFavoriteDocuments:1];
}

- (void)fetchRecentAndFavoriteDocuments
{
}

- (void)fetchRecentAndFavoriteDocuments:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  BOOL v5 = [(BRCServerZone *)self->_serverZone db];
  BOOL v6 = [v5 serialQueue];

  if (v6)
  {
    id v7 = [(BRCServerZone *)self->_serverZone changeState];
    id v8 = [v7 changeToken];
    if (v8)
    {
    }
    else
    {
      BOOL v12 = [(BRCClientZone *)self hasCompletedInitialSyncDownOnce];

      if (!v12)
      {
        uint64_t v24 = brc_bread_crumbs();
        int v25 = brc_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
          -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.9();
        }
        goto LABEL_24;
      }
    }
    id v13 = [(BRCServerZone *)self->_serverZone changeState];
    BOOL v14 = [v13 changeToken];
    if (v14)
    {
    }
    else
    {
      BOOL v15 = [(BRCClientZone *)self hasCompletedInitialSyncDownOnce];

      if (v15)
      {
        uint64_t v16 = brc_bread_crumbs();
        id v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[BRCClientZone fetchRecentAndFavoriteDocuments:]();
        }

        __int16 v18 = [(BRCServerZone *)self->_serverZone db];
        id v19 = [v18 serialQueue];
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke;
        block[3] = &unk_1E6993698;
        void block[4] = self;
        dispatch_async(v19, block);

        return;
      }
    }
    if (self->_fetchRecentsOperation)
    {
      id v20 = brc_bread_crumbs();
      id v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.8();
      }

      if (v3)
      {
        __int16 v22 = brc_bread_crumbs();
        uint64_t v23 = brc_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG)) {
          -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.7((uint64_t)self);
        }

        self->_invokeFetchRecentsOperatiouint64_t n = 1;
      }
      return;
    }
    if ([(BRCServerZone *)self->_serverZone hasFetchedRecentsAndFavorites])
    {
      uint64_t v24 = brc_bread_crumbs();
      int v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone fetchRecentAndFavoriteDocuments:]();
      }
LABEL_24:

      return;
    }
    if (([(BRCServerZone *)self->_serverZone state] & 4) != 0)
    {
      double v30 = brc_bread_crumbs();
      double v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.6();
      }

      id v32 = [(BRCServerZone *)self->_serverZone db];
      id v33 = [v32 serialQueue];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_379;
      v50[3] = &unk_1E6993698;
      v50[4] = self;
      dispatch_async(v33, v50);
    }
    else if ([(BRCClientZone *)self isSharedZone])
    {
      uint64_t v26 = brc_bread_crumbs();
      uint64_t v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone fetchRecentAndFavoriteDocuments:]();
      }

      double v28 = [(BRCServerZone *)self->_serverZone db];
      double v29 = [v28 serialQueue];
      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_380;
      v49[3] = &unk_1E6993698;
      v49[4] = self;
      dispatch_async(v29, v49);
    }
    else
    {
      uint64_t v34 = [(BRCClientZone *)self asPrivateClientZone];
      id v35 = [v34 defaultAppLibrary];
      long long v36 = [v35 containerMetadata];
      char v37 = [v36 isDocumentScopePublic];

      if (v37)
      {
        if (![(BRCClientZone *)self _isSideSyncOperationBlockedWithName:@"fetch recents and favorites"])
        {
          long long v38 = [[BRCFetchRecentAndFavoriteDocumentsOperation alloc] initWithServerZone:self->_serverZone sessionContext:self->_session];
          fetchRecentsOperatiouint64_t n = self->_fetchRecentsOperation;
          self->_fetchRecentsOperatiouint64_t n = v38;

          objc_initWeak((id *)buf, self);
          v46[0] = MEMORY[0x1E4F143A8];
          v46[1] = 3221225472;
          v46[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_2;
          v46[3] = &unk_1E6997918;
          objc_copyWeak(&v47, (id *)buf);
          [(_BRCOperation *)self->_fetchRecentsOperation setFinishBlock:v46];
          uint64_t v40 = brc_bread_crumbs();
          id v41 = brc_default_log();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG)) {
            -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.4();
          }

          [(BRCClientZone *)self _registerServerStitchingOperation:self->_fetchRecentsOperation];
          objc_destroyWeak(&v47);
          objc_destroyWeak((id *)buf);
        }
      }
      else
      {
        id v42 = brc_bread_crumbs();
        id v43 = brc_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
          -[BRCClientZone fetchRecentAndFavoriteDocuments:].cold.5();
        }

        id v44 = [(BRCServerZone *)self->_serverZone db];
        __int16 v45 = [v44 serialQueue];
        v48[0] = MEMORY[0x1E4F143A8];
        v48[1] = 3221225472;
        v48[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_381;
        v48[3] = &unk_1E6993698;
        v48[4] = self;
        dispatch_async(v45, v48);
      }
    }
  }
  else
  {
    long long v9 = brc_bread_crumbs();
    long long v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      serverZone = self->_serverZone;
      *(_DWORD *)buf = 138412546;
      uint64_t v53 = serverZone;
      __int16 v54 = 2112;
      int v55 = v9;
      _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] Zone doesn't have a serial queue anymore %@%@", buf, 0x16u);
    }
  }
}

uint64_t __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setStateBits:24];
}

uint64_t __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_379(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setStateBits:24];
}

uint64_t __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_380(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setStateBits:24];
}

uint64_t __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_381(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) setStateBits:24];
}

void __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_2(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  BOOL v6 = [WeakRetained db];
  id v7 = [v6 serialQueue];

  if (v7)
  {
    id v8 = brc_bread_crumbs();
    long long v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v12 = WeakRetained[29];
      *(_DWORD *)buf = 138413058;
      uint64_t v16 = v12;
      __int16 v17 = 2112;
      __int16 v18 = WeakRetained;
      __int16 v19 = 2112;
      id v20 = v4;
      __int16 v21 = 2112;
      __int16 v22 = v8;
      _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Finished fetching recent documents (operation %@) for %@ - %@%@", buf, 0x2Au);
    }

    long long v10 = [WeakRetained db];
    BOOL v11 = [v10 serialQueue];
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_386;
    v13[3] = &unk_1E6993628;
    v13[4] = WeakRetained;
    id v14 = v4;
    dispatch_async(v11, v13);
  }
}

uint64_t __49__BRCClientZone_fetchRecentAndFavoriteDocuments___block_invoke_386(uint64_t a1)
{
  uint64_t v2 = *(void *)(a1 + 32);
  BOOL v3 = *(void **)(v2 + 232);
  *(void *)(v2 + 232) = 0;

  if ((objc_msgSend(*(id *)(a1 + 40), "brc_isCloudKitCancellationError") & 1) != 0
    || (uint64_t result = objc_msgSend(*(id *)(a1 + 40), "brc_isRetriable"), result))
  {
    uint64_t result = [*(id *)(a1 + 32) state];
    if ((result & 0x100) == 0)
    {
      uint64_t result = [*(id *)(a1 + 32) activated];
      if (result) {
        *(unsigned char *)(*(void *)(a1 + 32) + 240) = 1;
      }
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v5 + 240))
  {
    *(unsigned char *)(v5 + 240) = 0;
    BOOL v6 = *(void **)(a1 + 32);
    return [v6 fetchRecentAndFavoriteDocuments];
  }
  return result;
}

- (BOOL)dumpStatusToContext:(id)a3 error:(id *)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  id v8 = self->_session;
  v37[0] = 0;
  v37[1] = v37;
  v37[2] = 0x2020000000;
  char v38 = 1;
  uint64_t v33 = 0;
  uint64_t v34 = &v33;
  uint64_t v35 = 0x2050000000;
  uint64_t v36 = 0;
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = __43__BRCClientZone_dumpStatusToContext_error___block_invoke;
  v25[3] = &unk_1E6997940;
  double v31 = v37;
  id v20 = v6;
  id v26 = v20;
  id v9 = v7;
  id v27 = v9;
  double v28 = self;
  long long v10 = v8;
  double v29 = v10;
  id v30 = 0;
  id v32 = &v33;
  uint64_t v34[3] = (uint64_t)v25;
  if ([(BRCClientZone *)self isPrivateZone])
  {
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    BOOL v11 = [(BRCClientZone *)self asPrivateClientZone];
    uint64_t v12 = [v11 appLibraries];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v39 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = v34[3];
          __int16 v17 = [*(id *)(*((void *)&v21 + 1) + 8 * i) rootItemID];
          LOBYTE(v16) = (*(uint64_t (**)(uint64_t, void *, void, __CFString *, id *))(v16 + 16))(v16, v17, 0, @"/", a4);

          if ((v16 & 1) == 0)
          {
            BOOL v18 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v21 objects:v39 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }
    BOOL v18 = 1;
LABEL_13:
  }
  else
  {
    BOOL v18 = 1;
  }

  _Block_object_dispose(&v33, 8);
  _Block_object_dispose(v37, 8);

  return v18;
}

uint64_t __43__BRCClientZone_dumpStatusToContext_error___block_invoke(uint64_t a1, void *a2, int a3, void *a4, uint64_t a5)
{
  id v7 = a2;
  id v8 = a4;
  v70[0] = 0;
  v70[1] = v70;
  v70[2] = 0x2020000000;
  char v71 = 1;
  v65[0] = MEMORY[0x1E4F143A8];
  v65[1] = 3221225472;
  v65[2] = __43__BRCClientZone_dumpStatusToContext_error___block_invoke_2;
  v65[3] = &unk_1E6996D70;
  uint64_t v68 = *(void *)(a1 + 72);
  id v66 = *(id *)(a1 + 32);
  __int16 v69 = v70;
  id v56 = v8;
  id v67 = v56;
  id v9 = (void (**)(void))MEMORY[0x1D94389C0](v65);
  long long v10 = [*(id *)(a1 + 32) db];
  BOOL v11 = (void *)[v10 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp     FROM client_items    WHERE item_parent_id = %@ ORDER BY item_filename", v7];
  int v55 = v7;

  int v58 = v9;
  do
  {
    int v12 = [v11 next];
    if (!v12) {
      break;
    }
    uint64_t v13 = (void *)MEMORY[0x1D9438760]();
    uint64_t v14 = [v11 integerAtIndex:0];
    if ([*(id *)(a1 + 32) isCancelled])
    {
      int v15 = 1;
    }
    else if ([*(id *)(a1 + 40) containsIndex:v14])
    {
      v9[2](v9);
      [*(id *)(a1 + 32) pushIndentation];
      uint64_t v16 = *(void **)(a1 + 32);
      __int16 v17 = [v11 objectOfClass:objc_opt_class() atIndex:2];
      BOOL v18 = +[BRCDumpContext stringFromItemID:v17 context:*(void *)(a1 + 32)];
      [v16 writeLineWithFormat:@"ERROR: item ID %@ seen twice", v18];

      [*(id *)(a1 + 32) popIndentation];
      int v15 = 2;
    }
    else
    {
      [*(id *)(a1 + 40) addIndex:v14];
      __int16 v19 = [*(id *)(a1 + 48) session];
      id v20 = [*(id *)(a1 + 32) db];
      long long v21 = (void *)[v19 newLocalItemFromPQLResultSet:v11 db:v20 error:a5];

      if (v21)
      {
        long long v22 = [*(id *)(a1 + 56) fsReader];
        uint64_t v23 = [v22 descriptionForItem:v21 context:*(void *)(a1 + 32)];

        long long v24 = [*(id *)(a1 + 56) fsUploader];
        uint64_t v25 = [v24 descriptionForItem:v21 context:*(void *)(a1 + 32)];

        id v26 = [*(id *)(a1 + 56) applyScheduler];
        uint64_t v27 = [v26 descriptionForRejectedItem:v21 context:*(void *)(a1 + 32)];

        double v28 = [*(id *)(a1 + 56) fsDownloader];
        uint64_t v64 = [v28 descriptionForItem:v21 context:*(void *)(a1 + 32)];

        double v29 = [*(id *)(a1 + 56) syncUpScheduler];
        uint64_t v30 = [v29 descriptionForItem:v21 context:*(void *)(a1 + 32)];

        long long v62 = (void *)v25;
        long long v63 = (void *)v23;
        long long v60 = (void *)v30;
        long long v61 = (void *)v27;
        BOOL v31 = (v23 | v25 | v27 | v64 | v30) != 0;
        if ([v21 syncUpState])
        {
          id v32 = [v21 appLibrary];
          if (([v32 state] & 0x40000) != 0)
          {
            uint64_t v34 = [v21 itemID];
            int v33 = [v34 isDocumentsFolder] ^ 1;
          }
          else
          {
            int v33 = 1;
          }
        }
        else
        {
          int v33 = 0;
        }
        int v35 = v33 | v31;
        if ((v33 | v31) == 1)
        {
          ((void (*)(void))v58[2])();
          [*(id *)(a1 + 32) pushIndentation];
          uint64_t v36 = [v21 clientZone];
          char v37 = *(void **)(a1 + 48);

          if (v36 == v37)
          {
            id v41 = &stru_1F2AC7720;
          }
          else
          {
            id v38 = [NSString alloc];
            long long v39 = [v21 clientZone];
            uint64_t v40 = [v39 mangledID];
            id v41 = (__CFString *)[v38 initWithFormat:@"zone:%@ ", v40];
          }
          id v42 = *(void **)(a1 + 32);
          id v43 = [v21 descriptionWithContext:v42];
          [v42 writeLineWithFormat:@"%@%@", v41, v43];

          int v35 = 1;
        }
        if (v31)
        {
          id v44 = objc_alloc_init(MEMORY[0x1E4F28E78]);
          __int16 v45 = v44;
          if (v63) {
            [v44 appendFormat:@" reader{%@}", v63];
          }
          if (v62) {
            [v45 appendFormat:@" upload{%@}", v62];
          }
          if (v61) {
            [v45 appendFormat:@" rejected{%@}", v61];
          }
          if (v64) {
            [v45 appendFormat:@" downloader{%@}", v64];
          }
          if (v60) {
            [v45 appendFormat:@" sync-up{%@}", v60];
          }
          [*(id *)(a1 + 32) writeLineWithFormat:@">%@", v45];
        }
        if (v35) {
          [*(id *)(a1 + 32) popIndentation];
        }
        int v46 = [v21 isDirectory] ^ 1;
        if (a3 > 99) {
          LOBYTE(v46) = 1;
        }
        if (v46) {
          goto LABEL_39;
        }
        id v47 = *(void **)(a1 + 64);
        float v48 = [v21 itemID];
        LOBYTE(v47) = [v47 containsObject:v48];

        if (v47) {
          goto LABEL_39;
        }
        uint64_t v49 = *(void *)(*(void *)(*(void *)(a1 + 80) + 8) + 24);
        int v50 = [v21 itemID];
        __int16 v51 = [v21 st];
        uint64_t v52 = [v51 filename];
        uint64_t v53 = [v56 stringByAppendingPathComponent:v52];
        LODWORD(v49) = (*(uint64_t (**)(uint64_t, void *, void, void *, uint64_t))(v49 + 16))(v49, v50, (a3 + 1), v53, a5);

        if (v49) {
LABEL_39:
        }
          int v15 = 0;
        else {
          int v15 = 1;
        }

        id v9 = v58;
      }
      else
      {
        int v15 = 1;
      }
    }
  }
  while ((v15 | 2) == 2);

  _Block_object_dispose(v70, 8);
  return v12 ^ 1u;
}

uint64_t __43__BRCClientZone_dumpStatusToContext_error___block_invoke_2(uint64_t result)
{
  uint64_t v1 = result;
  if (*(unsigned char *)(*(void *)(*(void *)(result + 48) + 8) + 24))
  {
    [*(id *)(result + 32) writeLineWithFormat:@"Client Truth Unclean Items:"];
    uint64_t result = [*(id *)(v1 + 32) writeLineWithFormat:@"--------------------------"];
    *(unsigned char *)(*(void *)(*(void *)(v1 + 48) + 8) + 24) = 0;
  }
  if (*(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24))
  {
    uint64_t result = [*(id *)(v1 + 32) writeLineWithFormat:@"Under %@", *(void *)(v1 + 40)];
    *(unsigned char *)(*(void *)(*(void *)(v1 + 56) + 8) + 24) = 0;
  }
  return result;
}

- (BOOL)dumpTablesToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5
{
  BOOL v6 = a4;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  [v8 writeLineWithFormat:@"client items"];
  [v8 writeLineWithFormat:@"============"];
  [(BRCClientZone *)self _dumpItemsToContext:v8 includeAllItems:v6 error:a5];
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v10 = [(BRCClientZone *)self serverZone];
  BOOL v11 = [v10 metadataSyncContextIfExists];
  if (v11) {
    [v9 addObject:v11];
  }
  if ([(BRCClientZone *)self isPrivateZone])
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    int v12 = [(BRCClientZone *)self asPrivateClientZone];
    uint64_t v13 = [v12 appLibraries];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v41 objects:v54 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v42 != v16) {
            objc_enumerationMutation(v13);
          }
          BOOL v18 = [*(id *)(*((void *)&v41 + 1) + 8 * i) transferSyncContextIfExists];
          if (v18) {
            [v9 addObject:v18];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v41 objects:v54 count:16];
      }
      while (v15);
    }
  }
  else
  {
    __int16 v19 = [v10 asSharedZone];
    uint64_t v13 = [v19 transferSyncContextIfExists];

    if (v13) {
      [v9 addObject:v13];
    }
  }

  if ((unint64_t)[v9 count] > 1)
  {
    int v35 = v10;
    uint64_t v36 = a5;
    [v8 writeLineWithFormat:@"scheduling sync contexts"];
    [v8 writeLineWithFormat:@"========================"];
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v21 = v9;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v37 objects:v53 count:16];
    if (v22)
    {
      uint64_t v23 = v22;
      uint64_t v24 = *(void *)v38;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v38 != v24) {
            objc_enumerationMutation(v21);
          }
          id v26 = *(void **)(*((void *)&v37 + 1) + 8 * j);
          uint64_t v27 = [v26 contextIdentifier];
          [v8 writeLineWithFormat:@"+ %@", v27];

          [v8 pushIndentation];
          [v26 dumpToContext:v8];
          [v8 popIndentation];
        }
        uint64_t v23 = [v21 countByEnumeratingWithState:&v37 objects:v53 count:16];
      }
      while (v23);
    }

    [v8 writeLineWithFormat:&stru_1F2AC7720];
    long long v10 = v35;
    a5 = v36;
  }
  else
  {
    id v20 = [v9 anyObject];
    [v20 dumpToContext:v8];
  }
  double v28 = [0 error];

  if (v28)
  {
    double v29 = [0 error];
    if (v29)
    {
      uint64_t v30 = a5;
      BOOL v31 = brc_bread_crumbs();
      id v32 = brc_default_log();
      if (os_log_type_enabled(v32, (os_log_type_t)0x90u))
      {
        uint64_t v34 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        int v46 = "-[BRCClientZone dumpTablesToContext:includeAllItems:error:]";
        __int16 v47 = 2080;
        if (!v30) {
          uint64_t v34 = "(ignored by caller)";
        }
        float v48 = v34;
        __int16 v49 = 2112;
        int v50 = v29;
        __int16 v51 = 2112;
        uint64_t v52 = v31;
        _os_log_error_impl(&dword_1D353B000, v32, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      a5 = v30;
    }
    if (a5) {
      *a5 = v29;
    }
  }
  return v28 == 0;
}

- (BOOL)_resetItemsTable
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  abc_report_panic_with_signature();
  [NSString stringWithFormat:@"implement this in subclass"];
  objc_claimAutoreleasedReturnValue();
  uint64_t v2 = brc_bread_crumbs();
  BOOL v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_FAULT))
  {
    id v4 = brc_append_system_info_to_message();
    int v6 = 138412546;
    id v7 = v4;
    __int16 v8 = 2112;
    id v9 = v2;
    _os_log_fault_impl(&dword_1D353B000, v3, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v6, 0x16u);
  }
  brc_append_system_info_to_message();
  uint64_t v5 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("-[BRCClientZone _resetItemsTable]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/containers/BRCClientZone.m", 4293, v5);
}

- (id)allItems
{
  id v3 = [(BRCPQLConnection *)self->_db fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE zone_rowid = %@", self->_dbRowID];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__BRCClientZone_allItems__block_invoke;
  v6[3] = &unk_1E6994120;
  v6[4] = self;
  id v4 = [v3 enumerateObjects:v6];

  return v4;
}

id __25__BRCClientZone_allItems__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  __int16 v8 = [*(id *)(a1 + 32) session];
  id v9 = [v8 clientDB];
  uint64_t v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (id)allItemsSortedByDepthDescending:(BOOL)a3
{
  if (a3)
  {
    id v4 = "item_level DESC";
    uint64_t v5 = 15;
  }
  else
  {
    id v4 = "item_level ASC";
    uint64_t v5 = 14;
  }
  id v6 = [MEMORY[0x1E4FBA908] rawInjection:v4 length:v5];
  if ([(BRCClientZone *)self isSharedZone])
  {
    id v7 = [MEMORY[0x1E4FBA908] rawInjection:"(item_sharing_options & 4) != 0" length:31];
  }
  else
  {
    __int16 v8 = (void *)MEMORY[0x1E4FBA8F8];
    id v9 = [(BRCClientZone *)self rootItemID];
    id v7 = [v8 formatInjection:@"item_parent_id = %@", v9];
  }
  id v10 = -[BRCPQLConnection fetch:](self->_db, "fetch:", &cfstr_WithRecursiveI_5, self->_dbRowID, v7, v6);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = __49__BRCClientZone_allItemsSortedByDepthDescending___block_invoke;
  v13[3] = &unk_1E6994120;
  v13[4] = self;
  BOOL v11 = [v10 enumerateObjects:v13];

  return v11;
}

id __49__BRCClientZone_allItemsSortedByDepthDescending___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  __int16 v8 = [*(id *)(a1 + 32) session];
  id v9 = [v8 clientDB];
  id v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (id)itemsParentedToThisZoneButLivingInAnOtherZone
{
  id v3 = [(BRCPQLConnection *)self->_db fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE item_parent_zone_rowid = %@ AND item_parent_zone_rowid != zone_rowid", self->_dbRowID];
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __62__BRCClientZone_itemsParentedToThisZoneButLivingInAnOtherZone__block_invoke;
  v6[3] = &unk_1E6994120;
  v6[4] = self;
  id v4 = [v3 enumerateObjects:v6];

  return v4;
}

id __62__BRCClientZone_itemsParentedToThisZoneButLivingInAnOtherZone__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  __int16 v8 = [*(id *)(a1 + 32) session];
  id v9 = [v8 clientDB];
  id v10 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:v9 error:a3];

  return v10;
}

- (int64_t)serverRankByItemID:(id)a3
{
  return [(BRCClientZone *)self serverRankByItemID:a3 db:self->_db];
}

- (id)serverItemByRank:(int64_t)a3
{
  db = self->_db;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __34__BRCClientZone_serverItemByRank___block_invoke;
  v6[3] = &unk_1E6994120;
  v6[4] = self;
  id v4 = [(BRCPQLConnection *)db fetchObject:v6, @"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_rank = %lld AND zone_rowid = %@", a3, self->_dbRowID sql];
  return v4;
}

id __34__BRCClientZone_serverItemByRank___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 session];
  id v7 = (void *)[v6 newServerItemFromPQLResultSet:v5 error:a3];

  return v7;
}

- (int64_t)serverRankByItemID:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 fetch:@"SELECT item_rank FROM server_items WHERE item_id = %@ AND zone_rowid = %@", a3, self->_dbRowID];
  if ([v4 next])
  {
    int64_t v5 = [v4 longLongAtIndex:0];
    [v4 close];
  }
  else
  {
    int64_t v5 = 0;
  }

  return v5;
}

- (id)serverItemByItemID:(id)a3
{
  return [(BRCClientZone *)self serverItemByItemID:a3 db:self->_db];
}

- (id)serverItemByItemID:(id)a3 db:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __39__BRCClientZone_serverItemByItemID_db___block_invoke;
  v6[3] = &unk_1E6994120;
  v6[4] = self;
  id v4 = (void *)[a4 fetchObject:v6, @"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@", a3, self->_dbRowID sql];
  return v4;
}

id __39__BRCClientZone_serverItemByItemID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 session];
  id v7 = (void *)[v6 newServerItemFromPQLResultSet:v5 error:a3];

  return v7;
}

- (id)serverItemByRowID:(unint64_t)a3
{
  return [(BRCClientZone *)self serverItemByRowID:a3 db:self->_db];
}

- (id)serverItemByRowID:(unint64_t)a3 db:(id)a4
{
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __38__BRCClientZone_serverItemByRowID_db___block_invoke;
  v6[3] = &unk_1E6994120;
  v6[4] = self;
  id v4 = (void *)[a4 fetchObject:v6, @"SELECT zone_rowid, item_rank, item_origname, pcs_state, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, quota_used, recursive_child_count, shared_children_count, shared_alias_count, child_count FROM server_items WHERE rowid = %lld", a3 sql];
  return v4;
}

id __38__BRCClientZone_serverItemByRowID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(a1 + 32);
  id v5 = a2;
  id v6 = [v4 session];
  id v7 = (void *)[v6 newServerItemFromPQLResultSet:v5 error:a3];

  return v7;
}

- (id)serverChildCountWithParentID:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 numberWithSQL:@"SELECT child_count FROM server_items WHERE item_id = %@ AND zone_rowid = %@", a3, self->_dbRowID];
  return v4;
}

- (id)clientChildCountWithParentID:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 numberWithSQL:@"SELECT visible_child_count FROM client_items WHERE item_id = %@ AND zone_rowid = %@", a3, self->_dbRowID];
  return v4;
}

- (BOOL)containsNonRejectedChildWithParentID:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 numberWithSQL:@"SELECT 1 FROM client_items WHERE item_parent_id = %@ AND item_parent_zone_rowid = %@ AND item_user_visible = 1 AND item_localsyncupstate != 1 LIMIT 1", a3, self->_dbRowID];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (id)serverQuotaUsageWithParentID:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 numberWithSQL:@"SELECT quota_used FROM server_items WHERE item_id = %@ AND zone_rowid = %@", a3, self->_dbRowID];
  return v4;
}

- (id)serverHiddenChildCountWithParentID:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 numberWithSQL:@"SELECT COUNT(si.item_id) FROM server_items AS si LEFT JOIN client_unapplied_table AS cu ON si.item_rank = cu.throttle_id WHERE si.item_parent_id = %@ AND si.zone_rowid = %@ AND ((si.item_filename LIKE '.%%') OR (si.item_type = 3 AND cu.throttle_state = 24))", a3, self->_dbRowID];
  return v4;
}

- (id)itemByItemID:(id)a3
{
  return [(BRCClientZone *)self itemByItemID:a3 db:self->_db];
}

- (id)itemByItemID:(id)a3 db:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  __int16 v8 = [[BRCItemGlobalID alloc] initWithZoneRowID:self->_dbRowID itemID:v7];

  id v9 = [(BRCAccountSession *)self->_session itemByItemGlobalID:v8 db:v6];

  return v9;
}

- (id)documentItemByItemID:(id)a3
{
  return [(BRCClientZone *)self documentItemByItemID:a3 db:self->_db];
}

- (id)documentItemByItemID:(id)a3 db:(id)a4
{
  id v4 = -[BRCClientZone itemByItemID:](self, "itemByItemID:", a3, a4);
  if ([v4 isDocument])
  {
    char v5 = [v4 asDocument];
  }
  else
  {
    char v5 = 0;
  }

  return v5;
}

- (id)itemByRowID:(unint64_t)a3
{
  return [(BRCClientZone *)self itemByRowID:a3 db:self->_db];
}

- (id)itemByRowID:(unint64_t)a3 db:(id)a4
{
  id v6 = a4;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __32__BRCClientZone_itemByRowID_db___block_invoke;
  v11[3] = &unk_1E6994148;
  v11[4] = self;
  id v12 = v6;
  dbRowID = self->_dbRowID;
  id v8 = v6;
  id v9 = (void *)[v8 fetchObject:v11, @"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE rowid = %lld AND zone_rowid = %@", a3, dbRowID sql];

  return v9;
}

id __32__BRCClientZone_itemByRowID_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  char v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)directoryOrRootItemIDByFileID:(unint64_t)a3
{
  return [(BRCClientZone *)self directoryOrRootItemIDByFileID:a3 db:self->_db];
}

- (id)directoryOrRootItemIDByFileID:(unint64_t)a3 db:(id)a4
{
  id v4 = (void *)[a4 itemIDWithSQL:@"SELECT item_id FROM client_items  WHERE item_file_id = %lld    AND +item_type IN (0, 9, 10, 4)    AND item_state IN (0, -1)    AND zone_rowid = %@", a3, self->_dbRowID];
  return v4;
}

- (BOOL)existsByItemID:(id)a3
{
  return [(BRCClientZone *)self existsByItemID:a3 db:self->_db];
}

- (BOOL)existsByItemID:(id)a3 db:(id)a4
{
  return [(BRCClientZone *)self itemTypeByItemID:a3 db:a4] != -1;
}

- (char)itemTypeByItemID:(id)a3 db:(id)a4
{
  id v4 = (void *)[a4 numberWithSQL:@"SELECT item_type FROM client_items WHERE item_id = %@ AND zone_rowid = %@ LIMIT 1", a3, self->_dbRowID];
  char v5 = v4;
  if (v4) {
    char v6 = [v4 intValue];
  }
  else {
    char v6 = -1;
  }

  return v6;
}

- (BOOL)validateItemsLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  abc_report_panic_with_signature();
  [NSString stringWithFormat:@"must implement in subclass"];
  objc_claimAutoreleasedReturnValue();
  char v5 = brc_bread_crumbs();
  char v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    id v7 = brc_append_system_info_to_message();
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_fault_impl(&dword_1D353B000, v6, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v9, 0x16u);
  }
  brc_append_system_info_to_message();
  id v8 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("-[BRCClientZone validateItemsLoggingToFile:db:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/containers/BRCClientZone.m", 4490, v8);
}

- (BOOL)validateStructureLoggingToFile:(__sFILE *)a3 db:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a4;
  abc_report_panic_with_signature();
  [NSString stringWithFormat:@"must implement in subclass"];
  objc_claimAutoreleasedReturnValue();
  char v5 = brc_bread_crumbs();
  char v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    id v7 = brc_append_system_info_to_message();
    int v9 = 138412546;
    id v10 = v7;
    __int16 v11 = 2112;
    id v12 = v5;
    _os_log_fault_impl(&dword_1D353B000, v6, OS_LOG_TYPE_FAULT, "[CRIT] %@%@", (uint8_t *)&v9, 0x16u);
  }
  brc_append_system_info_to_message();
  id v8 = (const char *)[ objc_claimAutoreleasedReturnValue() UTF8String];
  __assert_rtn("-[BRCClientZone validateStructureLoggingToFile:db:]", "/Library/Caches/com.apple.xbs/Sources/CloudDocs_plugins/core/shared/containers/BRCClientZone.m", 4495, v8);
}

- (void)_removeAllShareAcceptanceBlocks
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  [(BRCPQLConnection *)self->_db assertOnQueue];
  id v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v83 = v3;
    _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] calling and removing all share acceptance blocks%@", buf, 0xCu);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  char v5 = [(NSMutableDictionary *)self->_downloadedBlockToPerformForItemID objectEnumerator];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v71 objects:v81 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v72;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v72 != v8) {
          objc_enumerationMutation(v5);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v71 + 1) + 8 * v9++) + 16))();
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v71 objects:v81 count:16];
    }
    while (v7);
  }

  downloadedBlockToPerformForItemID = self->_downloadedBlockToPerformForItemID;
  self->_downloadedBlockToPerformForItemID = 0;

  long long v69 = 0u;
  long long v70 = 0u;
  long long v67 = 0u;
  long long v68 = 0u;
  __int16 v11 = [(NSMutableDictionary *)self->_onDiskBlockToPerformForItemID objectEnumerator];
  uint64_t v12 = [v11 countByEnumeratingWithState:&v67 objects:v80 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v68;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v68 != v14) {
          objc_enumerationMutation(v11);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v67 + 1) + 8 * v15++) + 16))();
      }
      while (v13 != v15);
      uint64_t v13 = [v11 countByEnumeratingWithState:&v67 objects:v80 count:16];
    }
    while (v13);
  }

  onDiskBlockToPerformForItemID = self->_onDiskBlockToPerformForItemID;
  self->_onDiskBlockToPerformForItemID = 0;

  long long v65 = 0u;
  long long v66 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  __int16 v17 = [(NSMutableDictionary *)self->_syncDownBlockToPerformForItemID objectEnumerator];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v63 objects:v79 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v64;
    do
    {
      uint64_t v21 = 0;
      do
      {
        if (*(void *)v64 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = *(void **)(*((void *)&v63 + 1) + 8 * v21);
        long long v59 = 0u;
        long long v60 = 0u;
        long long v61 = 0u;
        long long v62 = 0u;
        id v23 = v22;
        uint64_t v24 = [v23 countByEnumeratingWithState:&v59 objects:v78 count:16];
        if (v24)
        {
          uint64_t v25 = v24;
          uint64_t v26 = *(void *)v60;
          do
          {
            uint64_t v27 = 0;
            do
            {
              if (*(void *)v60 != v26) {
                objc_enumerationMutation(v23);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v59 + 1) + 8 * v27++) + 16))();
            }
            while (v25 != v27);
            uint64_t v25 = [v23 countByEnumeratingWithState:&v59 objects:v78 count:16];
          }
          while (v25);
        }

        ++v21;
      }
      while (v21 != v19);
      uint64_t v19 = [v17 countByEnumeratingWithState:&v63 objects:v79 count:16];
    }
    while (v19);
  }

  syncDownBlockToPerformForItemID = self->_syncDownBlockToPerformForItemID;
  self->_syncDownBlockToPerformForItemID = 0;

  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  double v29 = [(NSMutableDictionary *)self->_locateBlocksToPerformForRecordID objectEnumerator];
  uint64_t v30 = [v29 countByEnumeratingWithState:&v55 objects:v77 count:16];
  if (v30)
  {
    uint64_t v31 = v30;
    uint64_t v32 = *(void *)v56;
    do
    {
      uint64_t v33 = 0;
      do
      {
        if (*(void *)v56 != v32) {
          objc_enumerationMutation(v29);
        }
        uint64_t v34 = *(void **)(*((void *)&v55 + 1) + 8 * v33);
        long long v51 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v35 = v34;
        uint64_t v36 = [v35 countByEnumeratingWithState:&v51 objects:v76 count:16];
        if (v36)
        {
          uint64_t v37 = v36;
          uint64_t v38 = *(void *)v52;
          do
          {
            uint64_t v39 = 0;
            do
            {
              if (*(void *)v52 != v38) {
                objc_enumerationMutation(v35);
              }
              (*(void (**)(void))(*(void *)(*((void *)&v51 + 1) + 8 * v39++) + 16))();
            }
            while (v37 != v39);
            uint64_t v37 = [v35 countByEnumeratingWithState:&v51 objects:v76 count:16];
          }
          while (v37);
        }

        ++v33;
      }
      while (v33 != v31);
      uint64_t v31 = [v29 countByEnumeratingWithState:&v55 objects:v77 count:16];
    }
    while (v31);
  }

  locateBlocksToPerformForRecordID = self->_locateBlocksToPerformForRecordID;
  self->_locateBlocksToPerformForRecordID = 0;

  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v41 = [(NSMutableDictionary *)self->_syncDownBlockToPerformForBookmarkData objectEnumerator];
  uint64_t v42 = [v41 countByEnumeratingWithState:&v47 objects:v75 count:16];
  if (v42)
  {
    uint64_t v43 = v42;
    uint64_t v44 = *(void *)v48;
    do
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v48 != v44) {
          objc_enumerationMutation(v41);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v47 + 1) + 8 * v45++) + 16))();
      }
      while (v43 != v45);
      uint64_t v43 = [v41 countByEnumeratingWithState:&v47 objects:v75 count:16];
    }
    while (v43);
  }

  syncDownBlockToPerformForBookmarkData = self->_syncDownBlockToPerformForBookmarkData;
  self->_syncDownBlockToPerformForBookmarkData = 0;
}

- (void)_removeOnDiskBlockToPerformForItemID:(id)a3
{
  db = self->_db;
  id v5 = a3;
  [(BRCPQLConnection *)db assertOnQueue];
  [(NSMutableDictionary *)self->_onDiskBlockToPerformForItemID removeObjectForKey:v5];

  if (![(NSMutableDictionary *)self->_onDiskBlockToPerformForItemID count])
  {
    onDiskBlockToPerformForItemID = self->_onDiskBlockToPerformForItemID;
    self->_onDiskBlockToPerformForItemID = 0;
  }
}

- (void)_removeDownloadedBlockToPerformForItemID:(id)a3
{
  db = self->_db;
  id v5 = a3;
  [(BRCPQLConnection *)db assertOnQueue];
  [(NSMutableDictionary *)self->_downloadedBlockToPerformForItemID removeObjectForKey:v5];

  if (![(NSMutableDictionary *)self->_downloadedBlockToPerformForItemID count])
  {
    downloadedBlockToPerformForItemID = self->_downloadedBlockToPerformForItemID;
    self->_downloadedBlockToPerformForItemID = 0;
  }
}

- (id)popOnDiskBlockForItemID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v10 = 138412546;
    id v11 = v4;
    __int16 v12 = 2112;
    uint64_t v13 = v5;
    _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_INFO, "[INFO] popOnDiskBlockForItemID [%@]%@", (uint8_t *)&v10, 0x16u);
  }

  if (v4)
  {
    [(BRCPQLConnection *)self->_db assertOnQueue];
    uint64_t v7 = [(NSMutableDictionary *)self->_onDiskBlockToPerformForItemID objectForKeyedSubscript:v4];
    [(BRCClientZone *)self _removeOnDiskBlockToPerformForItemID:v4];
    uint64_t v8 = (void *)MEMORY[0x1D94389C0](v7);
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)popDownloadedBlockForItemID:(id)a3
{
  if (a3)
  {
    db = self->_db;
    id v5 = a3;
    [(BRCPQLConnection *)db assertOnQueue];
    uint64_t v6 = [(NSMutableDictionary *)self->_downloadedBlockToPerformForItemID objectForKeyedSubscript:v5];
    [(BRCClientZone *)self _removeDownloadedBlockToPerformForItemID:v5];

    uint64_t v7 = (void *)MEMORY[0x1D94389C0](v6);
  }
  else
  {
    uint64_t v7 = 0;
  }
  return v7;
}

- (void)performBlock:(id)a3 whenItemWithRecordIDIsOnDisk:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v7, "brc_itemIDWithSession:", self->_session);
  long long v25 = 0uLL;
  uint64_t v26 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCClientZone performBlock:whenItemWithRecordIDIsOnDisk:]", 4577, &v25);
  uint64_t v9 = brc_bread_crumbs();
  int v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v30 = (void *)v25;
    __int16 v31 = 2112;
    uint64_t v32 = v8;
    __int16 v33 = 2112;
    uint64_t v34 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting for item %@ to be on disk%@", buf, 0x20u);
  }

  long long v27 = v25;
  uint64_t v28 = v26;
  if (v6 && v8)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke;
    v21[3] = &unk_1E6997968;
    long long v23 = v27;
    uint64_t v24 = v28;
    id v22 = v6;
    id v11 = (void *)MEMORY[0x1D94389C0](v21);
    __int16 v12 = [(BRCAccountSession *)self->_session clientDB];
    uint64_t v13 = [v12 serialQueue];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_508;
    v17[3] = &unk_1E69958F0;
    void v17[4] = self;
    id v18 = v8;
    id v6 = v11;
    id v20 = v6;
    id v19 = v7;
    dispatch_async_with_logs_7(v13, v17);

    uint64_t v14 = v22;
  }
  else
  {
    uint64_t v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = (void *)MEMORY[0x1D94389C0](v6);
      *(_DWORD *)buf = 138412802;
      uint64_t v30 = v16;
      __int16 v31 = 2112;
      uint64_t v32 = v8;
      __int16 v33 = 2112;
      uint64_t v34 = v14;
      _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ and %@ must be non nil to register action%@", buf, 0x20u);
    }
  }
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke(uint64_t a1, uint64_t a2)
{
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_cold_1();
  }

  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, v6);
  __brc_leave_section((uint64_t *)&v7);
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_508(uint64_t a1)
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) itemByItemID:*(void *)(a1 + 40)];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_2;
  v27[3] = &unk_1E6997990;
  id v3 = *(id *)(a1 + 40);
  uint64_t v4 = *(void *)(a1 + 32);
  id v28 = v3;
  uint64_t v29 = v4;
  id v30 = *(id *)(a1 + 56);
  id v5 = (void (**)(void, void))MEMORY[0x1D94389C0](v27);
  if (([*(id *)(a1 + 32) state] & 0x100) != 0)
  {
    uint64_t v6 = brc_bread_crumbs();
    long long v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      id v11 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      uint64_t v32 = v11;
      __int16 v33 = 2112;
      uint64_t v34 = v2;
      __int16 v35 = 2112;
      uint64_t v36 = v6;
      uint64_t v8 = "[WARNING] %@ is resetting. Not waiting on faulting of %@%@";
      uint64_t v9 = v7;
      uint32_t v10 = 32;
      goto LABEL_7;
    }
LABEL_8:

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    goto LABEL_9;
  }
  if ([v2 isAlmostDead])
  {
    uint64_t v6 = brc_bread_crumbs();
    long long v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = v2;
      __int16 v33 = 2112;
      uint64_t v34 = v6;
      uint64_t v8 = "[WARNING] %@ is dead, not waiting on faulting.%@";
      uint64_t v9 = v7;
      uint32_t v10 = 22;
LABEL_7:
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, v8, buf, v10);
      goto LABEL_8;
    }
    goto LABEL_8;
  }
  if (v2)
  {
    if (([v2 isOnDisk] & 1) == 0)
    {
      ((void (**)(void, void *))v5)[2](v5, v2);
      goto LABEL_9;
    }
    if (![v2 isLost])
    {
      uint64_t v6 = brc_bread_crumbs();
      long long v7 = brc_default_log();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
        __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_508_cold_3((uint64_t)v2);
      }
      goto LABEL_8;
    }
    __int16 v12 = [[BRCItemToPathLookup alloc] initWithItem:v2];
    uint64_t v13 = [(BRCItemToPathLookup *)v12 byFileSystemID];

    if (v13)
    {
      uint64_t v14 = brc_bread_crumbs();
      uint64_t v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_508_cold_2((uint64_t)v2);
      }
    }
    else
    {
      uint64_t v14 = brc_bread_crumbs();
      uint64_t v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_508_cold_1((uint64_t)v2);
      }
    }

    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    [(BRCItemToPathLookup *)v12 closePaths];
  }
  else
  {
    uint64_t v16 = brc_bread_crumbs();
    __int16 v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = *(void **)(a1 + 40);
      *(_DWORD *)buf = 138412546;
      uint64_t v32 = v18;
      __int16 v33 = 2112;
      uint64_t v34 = v16;
      _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_INFO, "[INFO] Local item not found. Wait for the item [%@] to be on disk.%@", buf, 0x16u);
    }

    id v19 = *(void **)(a1 + 32);
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_510;
    uint64_t v23[3] = &unk_1E69979E0;
    id v20 = *(id *)(a1 + 56);
    uint64_t v21 = *(void *)(a1 + 32);
    id v22 = *(void **)(a1 + 40);
    id v25 = v20;
    void v23[4] = v21;
    id v24 = v22;
    uint64_t v26 = v5;
    [v19 performBlock:v23 whenLocatingCompletesForItemWithRecordID:*(void *)(a1 + 48)];
  }
LABEL_9:
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_2(void *a1, void *a2)
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  uint64_t v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    id v10 = v3;
    if (!v3) {
      id v10 = (id)a1[4];
    }
    int v11 = 138412546;
    id v12 = v10;
    __int16 v13 = 2112;
    uint64_t v14 = v4;
    _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] Waiting for %@ to be available%@", (uint8_t *)&v11, 0x16u);
  }

  if (!*(void *)(a1[5] + 360))
  {
    uint64_t v6 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v7 = a1[5];
    uint64_t v8 = *(void **)(v7 + 360);
    *(void *)(v7 + 360) = v6;
  }
  uint64_t v9 = (void *)MEMORY[0x1D94389C0](a1[6]);
  [*(id *)(a1[5] + 360) setObject:v9 forKeyedSubscript:a1[4]];
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_510(uint64_t a1, char a2)
{
  if (a2)
  {
    id v3 = [*(id *)(*(void *)(a1 + 32) + 8) clientTruthWorkloop];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_2_511;
    v6[3] = &unk_1E69979B8;
    uint64_t v4 = *(void **)(a1 + 40);
    v6[4] = *(void *)(a1 + 32);
    id v7 = v4;
    id v8 = *(id *)(a1 + 48);
    id v9 = *(id *)(a1 + 56);
    dispatch_async_with_logs_7(v3, v6);
  }
  else
  {
    id v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    v5();
  }
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_2_511(uint64_t a1)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) itemByItemID:*(void *)(a1 + 40)];
  if ([v2 isOnDisk])
  {
    id v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v5 = 138412546;
      uint64_t v6 = v2;
      __int16 v7 = 2112;
      id v8 = v3;
      _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ is on disk after syncing down and refreshing%@", (uint8_t *)&v5, 0x16u);
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
  }
  else
  {
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
  }
}

- (void)performBlock:(id)a3 whenItemWithIDIsDownloaded:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v23 = 0uLL;
  uint64_t v24 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCClientZone performBlock:whenItemWithIDIsDownloaded:]", 4657, &v23);
  id v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    id v28 = (void *)v23;
    __int16 v29 = 2112;
    id v30 = v7;
    __int16 v31 = 2112;
    uint64_t v32 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting for item %@ to be downloaded%@", buf, 0x20u);
  }

  long long v25 = v23;
  uint64_t v26 = v24;
  if (v6 && v7)
  {
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke;
    v19[3] = &unk_1E6997A08;
    long long v21 = v25;
    uint64_t v22 = v26;
    id v20 = v6;
    id v10 = (void *)MEMORY[0x1D94389C0](v19);
    int v11 = [(BRCAccountSession *)self->_session clientDB];
    id v12 = [v11 serialQueue];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_512;
    v16[3] = &unk_1E69946C8;
    v16[4] = self;
    id v17 = v7;
    id v6 = v10;
    id v18 = v6;
    dispatch_async_with_logs_7(v12, v16);

    __int16 v13 = v20;
  }
  else
  {
    __int16 v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v15 = (void *)MEMORY[0x1D94389C0](v6);
      *(_DWORD *)buf = 138412802;
      id v28 = v15;
      __int16 v29 = 2112;
      id v30 = v7;
      __int16 v31 = 2112;
      uint64_t v32 = v13;
      _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ and %@ must be non nil to register action%@", buf, 0x20u);
    }
  }
}

void __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v4 = brc_bread_crumbs();
  int v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_cold_1();
  }

  (*(void (**)(void, id, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), v3, v6);
  __brc_leave_section((uint64_t *)&v7);
}

void __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_512(uint64_t a1)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) itemByItemID:*(void *)(a1 + 40)];
  id v3 = [v2 asDocument];

  if (([*(id *)(a1 + 32) state] & 0x100) != 0)
  {
    long long v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v9 = *(void **)(a1 + 32);
      *(_DWORD *)buf = 138412802;
      long long v23 = v9;
      __int16 v24 = 2112;
      long long v25 = v3;
      __int16 v26 = 2112;
      long long v27 = v7;
      _os_log_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ is resetting. Not waiting on download of %@%@", buf, 0x20u);
    }
    goto LABEL_16;
  }
  if ([v3 hasLocalContent])
  {
    uint64_t v4 = brc_bread_crumbs();
    int v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_512_cold_1((uint64_t)v3);
    }

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_17;
  }
  id v10 = +[BRCSystemResourcesManager manager];
  char v11 = [v10 isNetworkReachable];

  if ((v11 & 1) == 0)
  {
    long long v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_512_cold_2((uint64_t)v3);
    }
LABEL_16:

    uint64_t v6 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_17:
    v6();
    goto LABEL_18;
  }
  id v12 = brc_bread_crumbs();
  __int16 v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    id v20 = v3;
    if (!v3) {
      id v20 = *(void **)(a1 + 40);
    }
    *(_DWORD *)buf = 138412546;
    long long v23 = v20;
    __int16 v24 = 2112;
    long long v25 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] Waiting for %@ to be downloaded%@", buf, 0x16u);
  }

  if (!*(void *)(*(void *)(a1 + 32) + 368))
  {
    uint64_t v14 = [MEMORY[0x1E4F1CA60] dictionary];
    uint64_t v15 = *(void *)(a1 + 32);
    uint64_t v16 = *(void **)(v15 + 368);
    *(void *)(v15 + 368) = v14;
  }
  id v17 = (void *)MEMORY[0x1D94389C0](*(void *)(a1 + 48));
  [*(id *)(*(void *)(a1 + 32) + 368) setObject:v17 forKeyedSubscript:*(void *)(a1 + 40)];

  if (!v3)
  {
    id v18 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
    id v19 = [v18 serialQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_513;
    block[3] = &unk_1E6993698;
    void block[4] = *(void *)(a1 + 32);
    dispatch_async(v19, block);
  }
LABEL_18:
}

uint64_t __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_513(uint64_t a1)
{
  return [*(id *)(a1 + 32) scheduleSyncDown];
}

- (void)_prepareForForegroundSyncDown
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(_BRCOperation *)self->_syncDownOperation usesBackgroundSession])
  {
    id v3 = brc_bread_crumbs();
    uint64_t v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = v3;
      _os_log_impl(&dword_1D353B000, v4, OS_LOG_TYPE_DEFAULT, "[WARNING] Cancelling sync down operation that uses a background session%@", (uint8_t *)&v7, 0xCu);
    }

    [(_BRCOperation *)self->_syncDownOperation cancel];
  }
  if (self->_syncUpOperation)
  {
    int v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEFAULT, "[WARNING] Cancelling sync up operation because we need to sync down now%@", (uint8_t *)&v7, 0xCu);
    }

    [(_BRCOperation *)self->_syncUpOperation cancel];
  }
  [(BRCClientZone *)self scheduleSyncDownFirst];
  [(BRCDeadlineSource *)self->_syncDeadlineSource signal];
}

- (BOOL)_shouldFailSyncDownWaitImmediately
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (([(BRCClientZone *)self state] & 0x100) != 0)
  {
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      int v8 = 138412546;
      uint64_t v9 = self;
      __int16 v10 = 2112;
      char v11 = v6;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ is resetting. Not waiting on sync down%@", (uint8_t *)&v8, 0x16u);
    }
  }
  else
  {
    id v3 = +[BRCSystemResourcesManager manager];
    char v4 = [v3 isNetworkReachable];

    if (v4) {
      return 0;
    }
    uint64_t v6 = brc_bread_crumbs();
    int v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone _shouldFailSyncDownWaitImmediately]((uint64_t)self);
    }
  }

  return 1;
}

- (void)performBlock:(id)a3 whenSyncDownCompletesLookingForItemID:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v27 = 0uLL;
  uint64_t v28 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCClientZone performBlock:whenSyncDownCompletesLookingForItemID:]", 4730, &v27);
  int v8 = brc_bread_crumbs();
  uint64_t v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v32 = (void *)v27;
    __int16 v33 = 2112;
    id v34 = v7;
    __int16 v35 = 2112;
    uint64_t v36 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting sync down to complete for item %@%@", buf, 0x20u);
  }

  long long v29 = v27;
  uint64_t v30 = v28;
  if (v6 && v7)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke;
    v22[3] = &unk_1E6997A58;
    long long v25 = v29;
    uint64_t v26 = v30;
    id v10 = v6;
    id v24 = v10;
    v22[4] = self;
    id v11 = v7;
    id v23 = v11;
    uint64_t v12 = (void *)MEMORY[0x1D94389C0](v22);
    __int16 v13 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_515;
    uint64_t v18[3] = &unk_1E69979B8;
    void v18[4] = self;
    id v19 = v11;
    id v20 = v12;
    id v21 = v10;
    id v14 = v12;
    dispatch_async_with_logs_7(v13, v18);

    uint64_t v15 = v24;
  }
  else
  {
    uint64_t v15 = brc_bread_crumbs();
    uint64_t v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      id v17 = (void *)MEMORY[0x1D94389C0](v6);
      *(_DWORD *)buf = 138412802;
      uint64_t v32 = v17;
      __int16 v33 = 2112;
      id v34 = v7;
      __int16 v35 = 2112;
      uint64_t v36 = v15;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ and %@ must be non nil to register action%@", buf, 0x20u);
    }
  }
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke(uint64_t a1, int a2)
{
  if (a2)
  {
    long long v17 = *(_OWORD *)(a1 + 56);
    uint64_t v18 = *(void *)(a1 + 72);
    id v3 = brc_bread_crumbs();
    char v4 = brc_default_log();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
      __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_cold_1();
    }

    (*(void (**)(void))(*(void *)(a1 + 48) + 16))();
LABEL_12:
    __brc_leave_section((uint64_t *)&v17);
    return;
  }
  if (![*(id *)(a1 + 32) _shouldFailSyncDownWaitImmediately])
  {
    long long v17 = *(_OWORD *)(a1 + 56);
    uint64_t v18 = *(void *)(a1 + 72);
    id v6 = brc_bread_crumbs();
    id v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_cold_2();
    }

    int v8 = [*(id *)(*(void *)(a1 + 32) + 8) clientTruthWorkloop];
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_514;
    v12[3] = &unk_1E6997A30;
    long long v15 = *(_OWORD *)(a1 + 56);
    uint64_t v16 = *(void *)(a1 + 72);
    id v9 = *(id *)(a1 + 48);
    uint64_t v10 = *(void *)(a1 + 32);
    id v11 = *(void **)(a1 + 40);
    id v14 = v9;
    v12[4] = v10;
    id v13 = v11;
    dispatch_async_with_logs_7(v8, v12);

    goto LABEL_12;
  }
  int v5 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
  v5();
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_514(uint64_t a1)
{
  uint64_t v9 = MEMORY[0x1E4F143A8];
  uint64_t v10 = 3221225472;
  id v11 = __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_2;
  uint64_t v12 = &unk_1E6997968;
  long long v14 = *(_OWORD *)(a1 + 56);
  uint64_t v15 = *(void *)(a1 + 72);
  id v13 = *(id *)(a1 + 48);
  uint64_t v2 = (void *)MEMORY[0x1D94389C0](&v9);
  id v3 = *(void **)(*(void *)(a1 + 32) + 376);
  if (!v3)
  {
    uint64_t v4 = objc_opt_new();
    uint64_t v5 = *(void *)(a1 + 32);
    id v6 = *(void **)(v5 + 376);
    *(void *)(v5 + 376) = v4;

    id v3 = *(void **)(*(void *)(a1 + 32) + 376);
  }
  id v7 = objc_msgSend(v3, "objectForKeyedSubscript:", *(void *)(a1 + 40), v9, v10, v11, v12);
  if (!v7)
  {
    id v7 = objc_opt_new();
    [*(id *)(*(void *)(a1 + 32) + 376) setObject:v7 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  int v8 = (void *)MEMORY[0x1D94389C0](v2);
  [v7 addObject:v8];

  [*(id *)(a1 + 32) _prepareForForegroundSyncDown];
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_2(uint64_t a1, uint64_t a2)
{
  long long v7 = *(_OWORD *)(a1 + 40);
  uint64_t v8 = *(void *)(a1 + 56);
  uint64_t v4 = brc_bread_crumbs();
  uint64_t v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
    __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_2_cold_1();
  }

  (*(void (**)(void, uint64_t, uint64_t))(*(void *)(a1 + 32) + 16))(*(void *)(a1 + 32), a2, v6);
  __brc_leave_section((uint64_t *)&v7);
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_515(uint64_t a1)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) serverItemByItemID:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2 && [v2 isLive])
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_6:
    v4();
    goto LABEL_14;
  }
  if ([*(id *)(a1 + 32) _shouldFailSyncDownWaitImmediately])
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 56) + 16);
    goto LABEL_6;
  }
  uint64_t v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v14 = *(void *)(a1 + 32);
    uint64_t v13 = *(void *)(a1 + 40);
    int v15 = 138412802;
    uint64_t v16 = v13;
    __int16 v17 = 2112;
    uint64_t v18 = v14;
    __int16 v19 = 2112;
    id v20 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] Waiting for sync down for %@ in %@%@", (uint8_t *)&v15, 0x20u);
  }

  long long v7 = *(void **)(*(void *)(a1 + 32) + 376);
  if (!v7)
  {
    uint64_t v8 = objc_opt_new();
    uint64_t v9 = *(void *)(a1 + 32);
    uint64_t v10 = *(void **)(v9 + 376);
    *(void *)(v9 + 376) = v8;

    long long v7 = *(void **)(*(void *)(a1 + 32) + 376);
  }
  id v11 = [v7 objectForKeyedSubscript:*(void *)(a1 + 40)];
  if (!v11)
  {
    id v11 = objc_opt_new();
    [*(id *)(*(void *)(a1 + 32) + 376) setObject:v11 forKeyedSubscript:*(void *)(a1 + 40)];
  }
  uint64_t v12 = (void *)MEMORY[0x1D94389C0](*(void *)(a1 + 48));
  [v11 addObject:v12];

  [*(id *)(a1 + 32) _prepareForForegroundSyncDown];
LABEL_14:
}

- (void)_enumerateAndClearLocateBlocksForRecordID:(id)a3 exists:(BOOL)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v6 = [(NSMutableDictionary *)self->_locateBlocksToPerformForRecordID objectForKeyedSubscript:v5];
  [(NSMutableDictionary *)self->_locateBlocksToPerformForRecordID removeObjectForKey:v5];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v13;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v13 != v10) {
          objc_enumerationMutation(v7);
        }
        (*(void (**)(void))(*(void *)(*((void *)&v12 + 1) + 8 * v11) + 16))(*(void *)(*((void *)&v12 + 1) + 8 * v11));
        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [v7 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v9);
  }
}

- (void)performBlock:(id)a3 whenLocatingCompletesForItemWithRecordID:(id)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = objc_msgSend(v7, "brc_itemIDWithSession:", self->_session);
  long long v30 = 0uLL;
  uint64_t v31 = 0;
  __brc_create_section(0, (uint64_t)"-[BRCClientZone performBlock:whenLocatingCompletesForItemWithRecordID:]", 4873, &v30);
  uint64_t v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    __int16 v35 = (void *)v30;
    __int16 v36 = 2112;
    uint64_t v37 = v8;
    __int16 v38 = 2112;
    id v39 = v7;
    __int16 v40 = 2112;
    long long v41 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┣%llx waiting to locate item [%@] with record ID [%@]%@", buf, 0x2Au);
  }

  long long v32 = v30;
  uint64_t v33 = v31;
  if (v7 && v6 && v8)
  {
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke;
    uint64_t v23[3] = &unk_1E6997AA8;
    long long v28 = v32;
    uint64_t v29 = v33;
    id v11 = v8;
    id v24 = v11;
    id v12 = v6;
    id v27 = v12;
    long long v25 = self;
    id v26 = v7;
    long long v13 = (void *)MEMORY[0x1D94389C0](v23);
    long long v14 = [(BRCAccountSession *)self->_session clientTruthWorkloop];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_528;
    v19[3] = &unk_1E69979B8;
    void v19[4] = self;
    id v20 = v11;
    id v21 = v13;
    id v22 = v12;
    id v15 = v13;
    dispatch_async_with_logs_7(v14, v19);

    uint64_t v16 = v24;
  }
  else
  {
    uint64_t v16 = brc_bread_crumbs();
    uint64_t v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v18 = (void *)MEMORY[0x1D94389C0](v6);
      *(_DWORD *)buf = 138413058;
      __int16 v35 = v18;
      __int16 v36 = 2112;
      uint64_t v37 = v8;
      __int16 v38 = 2112;
      id v39 = v7;
      __int16 v40 = 2112;
      long long v41 = v16;
      _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] %@, %@ and %@ must be non nil to register action%@", buf, 0x2Au);
    }
  }
}

void __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke(uint64_t a1, int a2, int a3)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  if (a2 && (a3 & 1) == 0)
  {
    long long v42 = *(_OWORD *)(a1 + 64);
    uint64_t v43 = *(void *)(a1 + 80);
    uint64_t v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v29 = [*(id *)(a1 + 32) debugItemIDString];
      *(_DWORD *)buf = 134218498;
      uint64_t v45 = (void *)v42;
      __int16 v46 = 2112;
      long long v47 = v29;
      __int16 v48 = 2112;
      long long v49 = v4;
      _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Item [%@] already located. Execute block directly.%@", buf, 0x20u);
    }
    (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
    __brc_leave_section((uint64_t *)&v42);
    return;
  }
  if (a2 && a3)
  {
    id v6 = +[BRCUserDefaults defaultsForMangledID:0];
    uint64_t v7 = [v6 maxSyncPathDepth];

    uint64_t v8 = [*(id *)(*(void *)(a1 + 40) + 8) clientDB];
    uint64_t v9 = (void *)[v8 fetch:@" WITH RECURSIVE item_parents (item_parent_id, zone_rowid, height) AS(    SELECT item_parent_id, zone_rowid, 0 FROM server_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT si.item_parent_id, si.zone_rowid, p.height + 1 FROM server_items AS si  INNER JOIN item_parents AS p where (si.item_id = p.item_parent_id)  LIMIT %u) SELECT item_parent_id FROM item_parents ORDER BY height DESC", *(void *)(a1 + 32), *(void *)(*(void *)(a1 + 40) + 32), v7];

    if ([v9 next])
    {
      uint64_t v10 = [v9 objectOfClass:objc_opt_class() atIndex:0];
      if (([v10 isNonDesktopRoot] & 1) != 0 || objc_msgSend(v10, "isDocumentsFolder"))
      {
        long long v42 = *(_OWORD *)(a1 + 64);
        uint64_t v43 = *(void *)(a1 + 80);
        id v11 = brc_bread_crumbs();
        id v12 = brc_default_log();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v33 = [*(id *)(a1 + 32) debugItemIDString];
          *(_DWORD *)buf = 134218498;
          uint64_t v45 = (void *)v42;
          __int16 v46 = 2112;
          long long v47 = v33;
          __int16 v48 = 2112;
          long long v49 = v11;
          _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Item [%@] already located. Parent chain confirmed. Execute block directly.%@", buf, 0x20u);
        }
        (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
        __brc_leave_section((uint64_t *)&v42);

        return;
      }
    }
    else
    {
      long long v13 = brc_bread_crumbs();
      long long v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
        __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_cold_1();
      }
    }
  }
  long long v42 = *(_OWORD *)(a1 + 64);
  uint64_t v43 = *(void *)(a1 + 80);
  id v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    long long v30 = [*(id *)(a1 + 32) debugItemIDString];
    *(_DWORD *)buf = 134218498;
    uint64_t v45 = (void *)v42;
    __int16 v46 = 2112;
    long long v47 = v30;
    __int16 v48 = 2112;
    long long v49 = v15;
    _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Need to locate item [%@]%@", buf, 0x20u);
  }
  v37[0] = MEMORY[0x1E4F143A8];
  v37[1] = 3221225472;
  v37[2] = __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_519;
  void v37[3] = &unk_1E6997A80;
  long long v40 = *(_OWORD *)(a1 + 64);
  uint64_t v41 = *(void *)(a1 + 80);
  id v38 = *(id *)(a1 + 32);
  id v39 = *(id *)(a1 + 56);
  uint64_t v17 = (void *)MEMORY[0x1D94389C0](v37);
  uint64_t v18 = *(void **)(*(void *)(a1 + 40) + 384);
  if (!v18)
  {
    uint64_t v19 = objc_opt_new();
    uint64_t v20 = *(void *)(a1 + 40);
    id v21 = *(void **)(v20 + 384);
    *(void *)(v20 + 384) = v19;

    uint64_t v18 = *(void **)(*(void *)(a1 + 40) + 384);
  }
  id v22 = [v18 objectForKeyedSubscript:*(void *)(a1 + 48)];
  if (!v22)
  {
    id v22 = objc_opt_new();
    [*(id *)(*(void *)(a1 + 40) + 384) setObject:v22 forKeyedSubscript:*(void *)(a1 + 48)];
  }
  id v23 = (void *)MEMORY[0x1D94389C0](v17);
  [v22 addObject:v23];

  id v24 = [*(id *)(a1 + 40) locateRecordIfNecessaryForRecordID:*(void *)(a1 + 48) isUserWaiting:1];
  if (v24)
  {
    v34[0] = MEMORY[0x1E4F143A8];
    v34[1] = 3221225472;
    v34[2] = __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_520;
    uint64_t v34[3] = &unk_1E6994400;
    id v25 = *(id *)(a1 + 48);
    uint64_t v26 = *(void *)(a1 + 40);
    id v35 = v25;
    uint64_t v36 = v26;
    [v24 addLocateRecordCompletionBlock:v34];
  }
  else
  {
    id v27 = brc_bread_crumbs();
    long long v28 = brc_default_log();
    if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
    {
      uint64_t v31 = [*(id *)(a1 + 32) debugItemIDString];
      long long v32 = *(void **)(a1 + 48);
      *(_DWORD *)buf = 138412802;
      uint64_t v45 = v31;
      __int16 v46 = 2112;
      long long v47 = v32;
      __int16 v48 = 2112;
      long long v49 = v27;
      _os_log_error_impl(&dword_1D353B000, v28, (os_log_type_t)0x90u, "[ERROR] Fail to create LocateRecordOperation for item [%@] with record ID [%@] --> Fail all waiting blocks.%@", buf, 0x20u);
    }
    [*(id *)(a1 + 40) _enumerateAndClearLocateBlocksForRecordID:*(void *)(a1 + 48) exists:0];
  }

  __brc_leave_section((uint64_t *)&v42);
}

uint64_t __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_519(uint64_t a1, int a2)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = (long long *)(a1 + 48);
  if (a2)
  {
    long long v9 = *v3;
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v7 = [*(id *)(a1 + 32) debugItemIDString];
      *(_DWORD *)buf = 134218498;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      long long v14 = v7;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Item [%@] located successfully%@", buf, 0x20u);
    }
  }
  else
  {
    long long v9 = *v3;
    uint64_t v10 = *(void *)(a1 + 64);
    uint64_t v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v8 = [*(id *)(a1 + 32) debugItemIDString];
      *(_DWORD *)buf = 134218498;
      uint64_t v12 = v9;
      __int16 v13 = 2112;
      long long v14 = v8;
      __int16 v15 = 2112;
      uint64_t v16 = v4;
      _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┳%llx Item [%@] was not located%@", buf, 0x20u);
    }
  }

  __brc_leave_section((uint64_t *)&v9);
  return (*(uint64_t (**)(void))(*(void *)(a1 + 40) + 16))();
}

void __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_520(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = brc_bread_crumbs();
  uint64_t v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = @"fail";
    uint64_t v9 = *(void *)(a1 + 32);
    int v10 = 138413058;
    if (a2) {
      uint64_t v8 = @"success";
    }
    uint64_t v11 = v9;
    __int16 v12 = 2112;
    __int16 v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    __int16 v16 = 2112;
    uint64_t v17 = v6;
    _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_INFO, "[INFO] Locate record ID [%@]: %@ with error %@%@", (uint8_t *)&v10, 0x2Au);
  }

  [*(id *)(a1 + 40) _enumerateAndClearLocateBlocksForRecordID:*(void *)(a1 + 32) exists:a2];
}

void __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_528(uint64_t a1)
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) serverItemByItemID:*(void *)(a1 + 40)];
  id v3 = v2;
  if (v2 && [v2 isLive])
  {
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
LABEL_13:
    v4();
    goto LABEL_14;
  }
  if (([*(id *)(a1 + 32) state] & 0x100) != 0)
  {
    uint64_t v9 = brc_bread_crumbs();
    int v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v11 = *(void *)(a1 + 32);
      __int16 v12 = [*(id *)(a1 + 40) debugItemIDString];
      int v13 = 138412802;
      uint64_t v14 = v11;
      __int16 v15 = 2112;
      __int16 v16 = v12;
      __int16 v17 = 2112;
      uint64_t v18 = v9;
      _os_log_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEFAULT, "[WARNING] %@ is resetting. Not waiting to locate item [%@]%@", (uint8_t *)&v13, 0x20u);
    }
    goto LABEL_12;
  }
  id v5 = +[BRCSystemResourcesManager manager];
  char v6 = [v5 isNetworkReachable];

  if (v6)
  {
LABEL_12:
    uint64_t v4 = *(void (**)(void))(*(void *)(a1 + 48) + 16);
    goto LABEL_13;
  }
  uint64_t v7 = brc_bread_crumbs();
  uint64_t v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_528_cold_1();
  }

  (*(void (**)(void))(*(void *)(a1 + 56) + 16))();
LABEL_14:
}

- (BOOL)hasHighPriorityWatchers
{
  uint64_t v3 = [(NSMutableDictionary *)self->_syncDownBlockToPerformForItemID count];
  uint64_t v4 = [(NSMutableDictionary *)self->_locateBlocksToPerformForRecordID count] + v3;
  uint64_t v5 = [(NSMutableDictionary *)self->_syncDownBlockToPerformForBookmarkData count];
  uint64_t v6 = v4 + v5 + [(NSMutableDictionary *)self->_downloadedBlockToPerformForItemID count];
  uint64_t v7 = v6 + [(NSMutableDictionary *)self->_onDiskBlockToPerformForItemID count];
  return v7 + [(NSMutableArray *)self->_blockedOperationsOnInitialSync count] != 0;
}

- (BOOL)removeItemOnDiskBlock:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = [(BRCAccountSession *)self->_session clientDB];
  uint64_t v6 = [v5 serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __39__BRCClientZone_removeItemOnDiskBlock___block_invoke;
  block[3] = &unk_1E69936C0;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

void __39__BRCClientZone_removeItemOnDiskBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) popOnDiskBlockForItemID:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 != 0;
}

- (BOOL)removeItemIsDownloadedBlock:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = [(BRCAccountSession *)self->_session clientDB];
  uint64_t v6 = [v5 serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __45__BRCClientZone_removeItemIsDownloadedBlock___block_invoke;
  block[3] = &unk_1E69936C0;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

void __45__BRCClientZone_removeItemIsDownloadedBlock___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) popDownloadedBlockForItemID:*(void *)(a1 + 40)];
  *(unsigned char *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = v2 != 0;
}

- (BOOL)removeSyncDownForItemIDBlock:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x2020000000;
  char v15 = 0;
  uint64_t v5 = [(BRCAccountSession *)self->_session clientDB];
  uint64_t v6 = [v5 serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __46__BRCClientZone_removeSyncDownForItemIDBlock___block_invoke;
  block[3] = &unk_1E69936C0;
  id v10 = v4;
  uint64_t v11 = &v12;
  void block[4] = self;
  id v7 = v4;
  dispatch_sync(v6, block);

  LOBYTE(v4) = *((unsigned char *)v13 + 24);
  _Block_object_dispose(&v12, 8);
  return (char)v4;
}

uint64_t __46__BRCClientZone_removeSyncDownForItemIDBlock___block_invoke(void *a1)
{
  uint64_t v2 = [*(id *)(a1[4] + 376) objectForKeyedSubscript:a1[5]];
  *(unsigned char *)(*(void *)(a1[6] + 8) + 24) = v2 != 0;

  uint64_t v3 = a1[5];
  id v4 = *(void **)(a1[4] + 376);
  return [v4 removeObjectForKey:v3];
}

- (id)syncDownAnalyticsError
{
  uint64_t v3 = +[BRCUserDefaults defaultsForMangledID:self->_mangledID];
  [v3 syncDownDelayForFailure];
  double v5 = v4;

  char v6 = atomic_load(&self->_syncState);
  if ((v6 & 2) != 0
    && self->_lastSyncDownError
    && ([(BRCSyncOperationThrottle *)self->_syncDownThrottle delay], v7 > v5)
    && (lastSyncDownError = self->_lastSyncDownError,
        uint64_t v13 = 0,
        [(NSError *)lastSyncDownError brc_telemetryReportableErrorWithRecordName:&v13], v9 = objc_claimAutoreleasedReturnValue(), BOOL v10 = [(BRCClientZone *)self enhancedDrivePrivacyEnabled], v9))
  {
    uint64_t v11 = [[BRCErrorGrouping alloc] initWithError:v9 pcsChained:0 enhancedDrivePrivacyEnabled:v10];
  }
  else
  {
    uint64_t v11 = 0;
  }
  return v11;
}

- (id)syncUpAnalyticsError
{
  uint64_t v3 = +[BRCUserDefaults defaultsForMangledID:self->_mangledID];
  [v3 syncUpDelayForFailure];
  double v5 = v4;

  char v6 = atomic_load(&self->_syncState);
  if ((v6 & 1) != 0
    && self->_lastSyncUpError
    && ([(BRCSyncOperationThrottle *)self->_syncUpThrottle delay], v7 > v5)
    && (lastSyncUpError = self->_lastSyncUpError,
        uint64_t v14 = 0,
        [(NSError *)lastSyncUpError brc_telemetryReportableErrorWithRecordName:&v14], v9 = objc_claimAutoreleasedReturnValue(), lastSyncUpErrorWasOnChainedItem = self->_lastSyncUpErrorWasOnChainedItem, BOOL v11 = [(BRCClientZone *)self enhancedDrivePrivacyEnabled], v9))
  {
    uint64_t v12 = [[BRCErrorGrouping alloc] initWithError:v9 pcsChained:lastSyncUpErrorWasOnChainedItem enhancedDrivePrivacyEnabled:v11];
  }
  else
  {
    uint64_t v12 = 0;
  }
  return v12;
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  if (!a3)
  {
    if ([(BRCClientZone *)self hasHighPriorityWatchers])
    {
      double v4 = [(BRCPQLConnection *)self->_db serialQueue];
      v5[0] = MEMORY[0x1E4F143A8];
      v5[1] = 3221225472;
      v5[2] = __44__BRCClientZone_networkReachabilityChanged___block_invoke;
      v5[3] = &unk_1E6993698;
      v5[4] = self;
      dispatch_async_with_logs_7(v4, v5);
    }
  }
}

void __44__BRCClientZone_networkReachabilityChanged___block_invoke(uint64_t a1)
{
  memset(v4, 0, sizeof(v4));
  __brc_create_section(0, (uint64_t)"-[BRCClientZone networkReachabilityChanged:]_block_invoke", 5085, v4);
  uint64_t v2 = brc_bread_crumbs();
  uint64_t v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __44__BRCClientZone_networkReachabilityChanged___block_invoke_cold_1();
  }

  [*(id *)(a1 + 32) _removeAllShareAcceptanceBlocks];
  __brc_leave_section(v4);
}

- (int64_t)throttleHashWithItemID:(id)a3
{
  id v4 = a3;
  double v5 = [(BRCClientZone *)self mangledID];
  uint64_t v6 = [v5 hash];
  uint64_t v7 = [v4 hash];

  return v7 ^ v6;
}

- (void)_appendToString:(id)a3 descriptionOfFieldNamed:(id)a4 inResultSet:(id)a5 pos:(int *)a6 containsSize:(BOOL)a7 context:(id)a8
{
  BOOL v9 = a7;
  id v23 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  if (v9)
  {
    ++*a6;
    uint64_t v16 = objc_msgSend(v14, "unsignedLongLongAtIndex:");
    ++*a6;
    uint64_t v17 = objc_msgSend(v14, "unsignedLongLongAtIndex:");
  }
  else
  {
    uint64_t v17 = 0;
    uint64_t v16 = 0;
  }
  ++*a6;
  uint64_t v18 = objc_msgSend(v14, "unsignedLongLongAtIndex:");
  ++*a6;
  uint64_t v19 = objc_msgSend(v14, "unsignedLongLongAtIndex:");
  uint64_t v20 = v19;
  if (v16 || v17 || v18 || v19)
  {
    if (v9)
    {
      id v21 = +[BRCDumpContext stringFromByteCount:v17 context:v15];
      id v22 = +[BRCDumpContext stringFromByteCount:v16 context:v15];
      [v23 appendFormat:@"%@{needs:(count:%lld, size:%@) done:(count:%lld, size:%@)} ", v13, v20, v21, v18, v22];
    }
    else
    {
      [v23 appendFormat:@"%@{needs:%lld done:%lld} ", v13, v19, v18];
    }
  }
}

- (void)_dumpRecursivePropertiesOfItemByRowID:(unint64_t)a3 context:(id)a4 depth:(int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a4;
  BOOL v9 = [v8 db];
  BOOL v10 = (void *)[v9 fetch:@"SELECT dir_faults_count, faults_count,needs_faulting_count, uploaded_size,needs_upload_size, uploaded_count,needs_upload_count, downloaded_size,needs_download_size, downloaded_count,needs_download_count, dl_unstaged_count,needs_dl_unstage_count, synced_up_count,needs_sync_up_count, over_quota_count, shared_by_me_count, shared_to_me_count, needs_delete_doc_count FROM item_recursive_properties  WHERE item_rowid = %llu", a3];

  if ([v10 next])
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F28E78]);
    uint64_t v12 = [v10 unsignedLongLongAtIndex:0];
    if (v12) {
      objc_msgSend(v11, "appendFormat:", @"dir-faults:%lld ", v12);
    }
    uint64_t v13 = [v10 unsignedLongLongAtIndex:1];
    if (v13) {
      objc_msgSend(v11, "appendFormat:", @"faults:%lld ", v13);
    }
    int v21 = 3;
    uint64_t v14 = [v10 unsignedLongLongAtIndex:2];
    if (v14) {
      objc_msgSend(v11, "appendFormat:", @"needs-faulting:%lld ", v14);
    }
    [(BRCClientZone *)self _appendToString:v11 descriptionOfFieldNamed:@"upload" inResultSet:v10 pos:&v21 containsSize:1 context:v8];
    [(BRCClientZone *)self _appendToString:v11 descriptionOfFieldNamed:@"download" inResultSet:v10 pos:&v21 containsSize:1 context:v8];
    [(BRCClientZone *)self _appendToString:v11 descriptionOfFieldNamed:@"unstage" inResultSet:v10 pos:&v21 containsSize:0 context:v8];
    [(BRCClientZone *)self _appendToString:v11 descriptionOfFieldNamed:@"sync-up" inResultSet:v10 pos:&v21 containsSize:0 context:v8];
    ++v21;
    uint64_t v15 = objc_msgSend(v10, "unsignedLongLongAtIndex:");
    if (v15) {
      objc_msgSend(v11, "appendFormat:", @"quota:%lld ", v15);
    }
    ++v21;
    uint64_t v16 = objc_msgSend(v10, "unsignedLongLongAtIndex:");
    if (v16) {
      objc_msgSend(v11, "appendFormat:", @"sbmc:%lld ", v16);
    }
    ++v21;
    uint64_t v17 = objc_msgSend(v10, "unsignedLongLongAtIndex:");
    if (v17) {
      objc_msgSend(v11, "appendFormat:", @"stmc:%lld ", v17);
    }
    ++v21;
    uint64_t v18 = objc_msgSend(v10, "unsignedLongLongAtIndex:");
    if (v18) {
      objc_msgSend(v11, "appendFormat:", @"nd:%lld ", v18);
    }
    if (v21 != 19)
    {
      uint64_t v19 = brc_bread_crumbs();
      uint64_t v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
        -[BRCClientZone _dumpRecursivePropertiesOfItemByRowID:context:depth:]();
      }
    }
    if ([v11 length]) {
      [v8 writeLineWithFormat:@"%*s> %@", v5, "", v11];
    }
  }
}

- (BOOL)_dumpItemsToContext:(id)a3 includeAllItems:(BOOL)a4 error:(id *)a5
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  BOOL v10 = self->_session;
  uint64_t v66 = 0;
  long long v67 = &v66;
  uint64_t v68 = 0x2050000000;
  uint64_t v69 = 0;
  uint64_t v62 = 0;
  long long v63 = &v62;
  uint64_t v64 = 0x2020000000;
  int v65 = 0;
  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = __59__BRCClientZone__dumpItemsToContext_includeAllItems_error___block_invoke;
  v54[3] = &unk_1E6997AD0;
  id v11 = v8;
  id v55 = v11;
  long long v59 = &v62;
  BOOL v61 = a4;
  id v41 = v9;
  id v56 = v41;
  long long v57 = self;
  long long v40 = v10;
  long long v58 = v40;
  long long v60 = &v66;
  v67[3] = (uint64_t)v54;
  long long v42 = self;
  if ([(BRCClientZone *)self isPrivateZone])
  {
    uint64_t v12 = [(BRCClientZone *)self asPrivateClientZone];
    uint64_t v13 = [v12 appLibraries];
    unint64_t v14 = [v13 count];

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    uint64_t v15 = [(BRCClientZone *)self asPrivateClientZone];
    id obj = [v15 appLibraries];

    uint64_t v16 = [obj countByEnumeratingWithState:&v50 objects:v71 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v51;
      char v18 = 1;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v51 != v17) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v50 + 1) + 8 * i);
          if (v14 >= 2)
          {
            if ((v18 & 1) == 0) {
              [v11 writeLineWithFormat:&stru_1F2AC7720];
            }
            int v21 = [v20 logName];
            id v22 = [v20 dbRowID];
            [v11 writeLineWithFormat:@"----------------------%@[%@]----------------------", v21, v22];

            char v18 = 0;
          }
          id v23 = [v20 fetchRootItem];
          id v24 = [v23 descriptionWithContext:v11];
          [v11 writeLineWithFormat:@"%@", v24];

          *((_DWORD *)v63 + 6) = 0;
          uint64_t v25 = v67[3];
          uint64_t v26 = [v23 itemGlobalID];
          (*(void (**)(uint64_t, void *, void, id *))(v25 + 16))(v25, v26, 0, a5);

          LOBYTE(v25) = [v11 isCancelled];
          if (v25)
          {
            BOOL v38 = 0;
            goto LABEL_31;
          }
        }
        uint64_t v16 = [obj countByEnumeratingWithState:&v50 objects:v71 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }
  }
  [v11 writeLineWithFormat:&stru_1F2AC7720];
  id v27 = [v11 db];
  id obj = (id)[v27 numberWithSQL:@"SELECT COUNT(*) FROM client_items WHERE zone_rowid = %@", v42->_dbRowID];

  unint64_t v28 = [obj unsignedIntegerValue];
  if (v28 > [v41 count])
  {
    if (![(BRCClientZone *)v42 isSharedZone]) {
      [v11 writeLineWithFormat:@"ORPHANED ITEMS:"];
    }
    uint64_t v29 = [v11 db];
    long long v30 = (void *)[v29 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE zone_rowid = %@ AND NOT indexset_contains(%p, rowid)", v42->_dbRowID, v41];
    *((_DWORD *)v63 + 6) = 0;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    v44[0] = MEMORY[0x1E4F143A8];
    v44[1] = 3221225472;
    v44[2] = __59__BRCClientZone__dumpItemsToContext_includeAllItems_error___block_invoke_2;
    v44[3] = &unk_1E6994148;
    v44[4] = v42;
    id v31 = v29;
    id v45 = v31;
    long long v32 = [v30 enumerateObjects:v44];
    uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v70 count:16];
    if (v33)
    {
      uint64_t v34 = *(void *)v47;
      while (2)
      {
        for (uint64_t j = 0; j != v33; ++j)
        {
          if (*(void *)v47 != v34) {
            objc_enumerationMutation(v32);
          }
          uint64_t v36 = *(void **)(*((void *)&v46 + 1) + 8 * j);
          ++*((_DWORD *)v63 + 6);
          if ((objc_msgSend(v11, "shouldKeepDumpingWithItemCount:includeAllItems:") & 1) == 0)
          {

            BOOL v38 = 0;
            goto LABEL_30;
          }
          uint64_t v37 = [v36 descriptionWithContext:v11];
          [v11 writeLineWithFormat:@"%@", v37];
        }
        uint64_t v33 = [v32 countByEnumeratingWithState:&v46 objects:v70 count:16];
        if (v33) {
          continue;
        }
        break;
      }
    }

    [v11 writeLineWithFormat:&stru_1F2AC7720];
    BOOL v38 = 1;
LABEL_30:
  }
  else
  {
    BOOL v38 = 1;
  }
LABEL_31:

  _Block_object_dispose(&v62, 8);
  _Block_object_dispose(&v66, 8);

  return v38;
}

uint64_t __59__BRCClientZone__dumpItemsToContext_includeAllItems_error___block_invoke(uint64_t a1, void *a2, uint64_t a3, uint64_t a4)
{
  id v7 = a2;
  id v8 = [*(id *)(a1 + 32) db];
  id v9 = [v7 itemID];
  BOOL v10 = [v7 zoneRowID];
  id v11 = (void *)[v8 fetch:@"SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_doc_id, ci.item_file_id, ci.item_generation, ci.item_localname, ci.item_processing_stamp, ci.item_staged_file_id, ci.item_staged_generation, ci.item_bouncedname, ci.item_scope, ci.item_tmpbounceno, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.desired_version, ci.item_live_conflict_loser_etags, ci.item_thumb_live_signature, ci.item_thumb_greedy, ci.version_block_sync_until_bundle_id, ci.version_block_sync_until_timestamp     FROM client_items AS ci     LEFT JOIN item_recursive_properties AS rp      ON ci.rowid = rp.item_rowid    WHERE ci.item_parent_id = %@ AND ci.item_parent_zone_rowid = %@ ORDER BY (rp.needs_sync_up_count + rp.needs_upload_count + rp.needs_delete_doc_count + rp.needs_download_count + rp.needs_faulting_count) DESC", v9, v10];

  if ([v11 next])
  {
    unsigned int v49 = a3 + 1;
    uint64_t v52 = a3;
    id v47 = v7;
    uint64_t v48 = a3;
    uint64_t v12 = a3;
    uint64_t v54 = a3;
    uint64_t v50 = a4;
    while (1)
    {
      uint64_t v13 = (void *)MEMORY[0x1D9438760]();
      unint64_t v14 = *(void **)(a1 + 32);
      ++*(_DWORD *)(*(void *)(*(void *)(a1 + 64) + 8) + 24);
      if (!objc_msgSend(v14, "shouldKeepDumpingWithItemCount:includeAllItems:")) {
        break;
      }
      uint64_t v15 = [v11 integerAtIndex:0];
      if ([*(id *)(a1 + 40) containsIndex:v15])
      {
        uint64_t v16 = *(void **)(a1 + 32);
        uint64_t v17 = [v11 objectOfClass:objc_opt_class() atIndex:2];
        char v18 = +[BRCDumpContext stringFromItemID:v17 context:*(void *)(a1 + 32)];
        [v16 writeLineWithFormat:@"%*sERROR: item ID %@ seen twice", v12, "", v18];
      }
      else
      {
        [*(id *)(a1 + 40) addIndex:v15];
        uint64_t v19 = [*(id *)(a1 + 48) session];
        uint64_t v20 = [*(id *)(a1 + 32) db];
        uint64_t v17 = (void *)[v19 newLocalItemFromPQLResultSet:v11 db:v20 error:a4];

        if (!v17) {
          goto LABEL_38;
        }
        int v21 = [v17 clientZone];
        id v22 = *(void **)(a1 + 48);

        if (v21 == v22)
        {
          char v18 = &stru_1F2AC7720;
        }
        else
        {
          id v23 = [NSString alloc];
          id v24 = [v17 clientZone];
          uint64_t v25 = [v24 mangledID];
          char v18 = (__CFString *)[v23 initWithFormat:@"zone:%@ ", v25];

          uint64_t v12 = v54;
        }
        uint64_t v26 = *(void **)(a1 + 32);
        id v27 = [v17 descriptionWithContext:v26];
        [v26 writeLineWithFormat:@"%*s%@%@", v52, "", v18, v27];

        [*(id *)(a1 + 48) _dumpRecursivePropertiesOfItemByRowID:v15 context:*(void *)(a1 + 32) depth:v12];
        if ([*(id *)(a1 + 32) liveDaemon])
        {
          unint64_t v28 = [*(id *)(a1 + 56) diskReclaimer];
          uint64_t v53 = [v28 descriptionForItem:v17 context:*(void *)(a1 + 32)];

          uint64_t v29 = [*(id *)(a1 + 56) fsReader];
          uint64_t v30 = [v29 descriptionForItem:v17 context:*(void *)(a1 + 32)];

          id v31 = (void *)v30;
          long long v32 = [*(id *)(a1 + 56) fsUploader];
          id v55 = [v32 descriptionForItem:v17 context:*(void *)(a1 + 32)];

          uint64_t v33 = [*(id *)(a1 + 56) applyScheduler];
          uint64_t v34 = [v33 descriptionForRejectedItem:v17 context:*(void *)(a1 + 32)];

          id v35 = [*(id *)(a1 + 56) fsDownloader];
          uint64_t v36 = [v35 descriptionForItem:v17 context:*(void *)(a1 + 32)];

          uint64_t v37 = [*(id *)(a1 + 56) syncUpScheduler];
          BOOL v38 = [v37 descriptionForItem:v17 context:*(void *)(a1 + 32)];

          id v39 = (void *)v53;
          if (v53 || v31 || v55 || v34 || v36 || v38)
          {
            long long v51 = v31;
            id v40 = objc_alloc_init(MEMORY[0x1E4F28E78]);
            id v41 = v40;
            if (v53) {
              [v40 appendFormat:@" reclaimer{%@}", v53];
            }
            if (v51) {
              [v41 appendFormat:@" reader{%@}", v51];
            }
            if (v55) {
              [v41 appendFormat:@" upload{%@}", v55];
            }
            if (v34) {
              [v41 appendFormat:@" rejected{%@}", v34];
            }
            if (v36) {
              [v41 appendFormat:@" downloader{%@}", v36];
            }
            if (v38) {
              [v41 appendFormat:@" sync-up{%@}", v38];
            }
            [*(id *)(a1 + 32) writeLineWithFormat:@"%*s>%@", v48, "", v41];

            id v39 = (void *)v53;
            id v31 = v51;
          }

          a4 = v50;
          uint64_t v12 = v54;
        }
        int v42 = [v17 isDirectory];
        if ((int)v12 <= 99)
        {
          if (v42)
          {
            uint64_t v43 = *(void *)(*(void *)(*(void *)(a1 + 72) + 8) + 24);
            uint64_t v44 = [v17 itemGlobalID];
            LOBYTE(v43) = (*(uint64_t (**)(uint64_t, void *, void, uint64_t))(v43 + 16))(v43, v44, v49, a4);

            if ((v43 & 1) == 0)
            {

LABEL_38:
              break;
            }
          }
        }
      }

      if (([v11 next] & 1) == 0)
      {
        uint64_t v45 = 1;
        goto LABEL_40;
      }
    }
    uint64_t v45 = 0;
LABEL_40:
    id v7 = v47;
  }
  else
  {
    uint64_t v45 = 1;
  }

  return v45;
}

id __59__BRCClientZone__dumpItemsToContext_includeAllItems_error___block_invoke_2(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (BOOL)dumpActivityToContext:(id)a3 includeExpensiveActivity:(BOOL)a4 error:(id *)a5
{
  BOOL v5 = a4;
  uint64_t v135 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (!self->_activated) {
    goto LABEL_93;
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  char v97 = [(BRCClientZone *)self syncState];
  brc_current_date_nsec();
  uint64_t v100 = +[BRCUserDefaults defaultsForMangledID:self->_mangledID];
  if ([(BRCClientZone *)self isPrivateZone])
  {
    id v9 = [(BRCClientZone *)self asPrivateClientZone];
    BOOL v10 = [v9 defaultAppLibrary];
    int v11 = [v10 isGreedy];
    uint64_t v12 = @"(greedy)";
    if (!v11) {
      uint64_t v12 = &stru_1F2AC7720;
    }
    [v7 writeLineWithFormat:@"pending activity %@", v12];
  }
  else
  {
    [v7 writeLineWithFormat:@"pending activity %@", &stru_1F2AC7720];
  }
  [v7 writeLineWithFormat:@"================"];
  if (v5)
  {
    uint64_t v13 = [(BRCAccountSession *)self->_session fsDownloader];
    unint64_t v14 = [v13 aggregateDescriptionForJobsMatching:self->_serverZone context:v7];
    [v7 writeLineWithFormat:@"+ downloads:%@", v14];
  }
  else
  {
    [v7 writeLineWithFormat:@"+ downloads: not dumping"];
  }
  [v7 pushIndentation];
  uint64_t v99 = self;
  BOOL v98 = v5;
  if ([(BRCClientZone *)self isPrivateZone])
  {
    long long v129 = 0u;
    long long v130 = 0u;
    long long v127 = 0u;
    long long v128 = 0u;
    uint64_t v15 = [(BRCClientZone *)self asPrivateClientZone];
    uint64_t v16 = [v15 appLibraries];

    id obj = v16;
    uint64_t v105 = [v16 countByEnumeratingWithState:&v127 objects:v134 count:16];
    if (v105)
    {
      uint64_t v103 = *(void *)v128;
      do
      {
        for (uint64_t i = 0; i != v105; ++i)
        {
          if (*(void *)v128 != v103) {
            objc_enumerationMutation(obj);
          }
          char v18 = *(void **)(*((void *)&v127 + 1) + 8 * i);
          long long v123 = 0u;
          long long v124 = 0u;
          long long v125 = 0u;
          long long v126 = 0u;
          uint64_t v19 = [v18 transferSyncContextIfExists];
          uint64_t v20 = [v19 downloadStream];
          int v21 = [v20 operations];

          uint64_t v22 = [v21 countByEnumeratingWithState:&v123 objects:v133 count:16];
          if (v22)
          {
            uint64_t v23 = v22;
            uint64_t v24 = *(void *)v124;
            do
            {
              for (uint64_t j = 0; j != v23; ++j)
              {
                if (*(void *)v124 != v24) {
                  objc_enumerationMutation(v21);
                }
                uint64_t v26 = *(void **)(*((void *)&v123 + 1) + 8 * j);
                id v27 = [v18 logName];
                unint64_t v28 = [v26 descriptionWithContext:v7];
                [v7 writeLineWithFormat:@"%@: %@", v27, v28];
              }
              uint64_t v23 = [v21 countByEnumeratingWithState:&v123 objects:v133 count:16];
            }
            while (v23);
          }
        }
        uint64_t v105 = [obj countByEnumeratingWithState:&v127 objects:v134 count:16];
      }
      while (v105);
    }

    self = v99;
    BOOL v5 = v98;
  }
  [v7 popIndentation];
  if (v5)
  {
    uint64_t v29 = [(BRCAccountSession *)self->_session fsUploader];
    uint64_t v30 = [v29 aggregateDescriptionForJobsMatching:self->_serverZone context:v7];
    [v7 writeLineWithFormat:@"+ uploads:  %@", v30];
  }
  else
  {
    [v7 writeLineWithFormat:@"+ uploads:  not dumping"];
  }
  [v7 pushIndentation];
  id v31 = [(BRCAccountSession *)self->_session fsUploader];
  long long v32 = [v31 thumbnailGenerationManager];
  [v7 writeLineWithFormat:@"%@", v32];

  if ([(BRCClientZone *)self isPrivateZone])
  {
    long long v121 = 0u;
    long long v122 = 0u;
    long long v119 = 0u;
    long long v120 = 0u;
    uint64_t v33 = [(BRCClientZone *)self asPrivateClientZone];
    uint64_t v34 = [v33 appLibraries];

    id obja = v34;
    uint64_t v106 = [v34 countByEnumeratingWithState:&v119 objects:v132 count:16];
    if (v106)
    {
      uint64_t v104 = *(void *)v120;
      do
      {
        for (uint64_t k = 0; k != v106; ++k)
        {
          if (*(void *)v120 != v104) {
            objc_enumerationMutation(obja);
          }
          uint64_t v36 = *(void **)(*((void *)&v119 + 1) + 8 * k);
          long long v115 = 0u;
          long long v116 = 0u;
          long long v117 = 0u;
          long long v118 = 0u;
          uint64_t v37 = [v36 transferSyncContextIfExists];
          BOOL v38 = [v37 uploadStream];
          id v39 = [v38 operations];

          uint64_t v40 = [v39 countByEnumeratingWithState:&v115 objects:v131 count:16];
          if (v40)
          {
            uint64_t v41 = v40;
            uint64_t v42 = *(void *)v116;
            do
            {
              for (uint64_t m = 0; m != v41; ++m)
              {
                if (*(void *)v116 != v42) {
                  objc_enumerationMutation(v39);
                }
                uint64_t v44 = *(void **)(*((void *)&v115 + 1) + 8 * m);
                uint64_t v45 = [v36 logName];
                long long v46 = [v44 descriptionWithContext:v7];
                [v7 writeLineWithFormat:@"%@: %@", v45, v46];
              }
              uint64_t v41 = [v39 countByEnumeratingWithState:&v115 objects:v131 count:16];
            }
            while (v41);
          }
        }
        uint64_t v106 = [obja countByEnumeratingWithState:&v119 objects:v132 count:16];
      }
      while (v106);
    }

    self = v99;
    BOOL v5 = v98;
  }
  if (self->_allItemsDidUploadTrackers) {
    [v7 writeLineWithFormat:@"sync bubble waiting"];
  }
  [v7 popIndentation];
  if (v5)
  {
    id v47 = [(BRCAccountSession(LegacyAdditions) *)self->_session fsReader];
    uint64_t v48 = [v47 aggregateDescriptionForJobsMatching:self->_serverZone context:v7];
    [v7 writeLineWithFormat:@"+ reader:   %@", v48];

    unsigned int v49 = [(BRCAccountSession *)self->_session applyScheduler];
    uint64_t v50 = [v49 aggregateDescriptionForJobsMatching:self->_serverZone context:v7];
    [v7 writeLineWithFormat:@"+ apply:    %@", v50];
  }
  else
  {
    [v7 writeLineWithFormat:@"+ reader:   not dumping"];
    [v7 writeLineWithFormat:@"+ apply:    not dumping"];
  }
  if ([(NSMutableDictionary *)self->_runningListOperations count])
  {
    [v7 writeLineWithFormat:@"+ list:"];
    [v7 pushIndentation];
    long long v51 = (void *)[(NSMutableDictionary *)self->_runningListOperations copy];
    v113[0] = MEMORY[0x1E4F143A8];
    v113[1] = 3221225472;
    v113[2] = __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke;
    v113[3] = &unk_1E6997AF8;
    id v52 = v7;
    id v114 = v52;
    [v51 enumerateKeysAndObjectsUsingBlock:v113];

    [v52 popIndentation];
  }
  if ([(NSMutableDictionary *)self->_recursiveListOperations count])
  {
    [v7 writeLineWithFormat:@"+ rec-list:"];
    [v7 pushIndentation];
    uint64_t v53 = (void *)[(NSMutableDictionary *)self->_recursiveListOperations copy];
    v111[0] = MEMORY[0x1E4F143A8];
    v111[1] = 3221225472;
    v111[2] = __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_2;
    v111[3] = &unk_1E6997B20;
    id v54 = v7;
    id v112 = v54;
    [v53 enumerateKeysAndObjectsUsingBlock:v111];

    [v54 popIndentation];
  }
  if ([(NSMutableDictionary *)self->_fetchParentOperations count])
  {
    [v7 writeLineWithFormat:@"+ fetch-parent:"];
    [v7 pushIndentation];
    id v55 = (void *)[(NSMutableDictionary *)self->_fetchParentOperations copy];
    v109[0] = MEMORY[0x1E4F143A8];
    v109[1] = 3221225472;
    v109[2] = __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_3;
    v109[3] = &unk_1E6997B48;
    id v56 = v7;
    id v110 = v56;
    [v55 enumerateKeysAndObjectsUsingBlock:v109];

    [v56 popIndentation];
  }
  if ([(NSMutableDictionary *)self->_locateRecordOperations count])
  {
    [v7 writeLineWithFormat:@"+ locate-record:"];
    [v7 pushIndentation];
    long long v57 = (void *)[(NSMutableDictionary *)self->_locateRecordOperations copy];
    v107[0] = MEMORY[0x1E4F143A8];
    v107[1] = 3221225472;
    v107[2] = __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_4;
    v107[3] = &unk_1E6997B70;
    id v58 = v7;
    id v108 = v58;
    [v57 enumerateKeysAndObjectsUsingBlock:v107];

    [v58 popIndentation];
  }
  if (self->_fetchRecentsOperation)
  {
    [v7 writeLineWithFormat:@"+ fetch-recents:"];
    [v7 pushIndentation];
    [v7 writeLineWithFormat:@"%@", self->_fetchRecentsOperation];
    [v7 popIndentation];
  }
  unsigned int v59 = [(BRCClientZone *)self _appLibrariesState];
  if ([v7 liveDaemon])
  {
    if (self->_syncUpOperation)
    {
      long long v60 = @" [sync-up running]";
      char v61 = v97;
    }
    else
    {
      char v61 = v97;
      if (!(self->_state & 0x100 | v59 & 0x80000) && (v97 & 0x71) == 0x21)
      {
        brc_interval_from_nsec();
        double v63 = v62;
        [(BRCSyncOperationThrottle *)self->_syncUpThrottle nextTry];
        if (v64 <= v63)
        {
          uint64_t v66 = @"because of item ";
        }
        else
        {
          [(BRCSyncOperationThrottle *)self->_syncUpThrottle nextTry];
          double v63 = v65;
          uint64_t v66 = &stru_1F2AC7720;
        }
        [(BRCSyncBudgetThrottle *)self->_syncUpBudget nextDateWithBudgetWithDefaults:v100];
        if (v92 > v63)
        {
          [(BRCSyncBudgetThrottle *)self->_syncUpBudget nextDateWithBudgetWithDefaults:v100];
          double v63 = v93;
          uint64_t v66 = @"for budget ";
        }
        brc_interval_from_nsec();
        if (v63 <= v94)
        {
          long long v67 = @" [sync-up waiting to be scheduled]";
          uint64_t v68 = 7;
        }
        else
        {
          id v95 = [NSString alloc];
          brc_interval_from_nsec();
          long long v67 = (__CFString *)[v95 initWithFormat:@" [sync-up throttled %@(next-try:in %.01fs)]", v66, v63 - v96];
          uint64_t v68 = 3;
        }
        char v61 = v97;
        goto LABEL_74;
      }
      long long v60 = @" [sync-up waiting for sync down]";
    }
    if (v61) {
      long long v67 = v60;
    }
    else {
      long long v67 = 0;
    }
    if (v61) {
      uint64_t v68 = 7;
    }
    else {
      uint64_t v68 = 0;
    }
LABEL_74:
    if (self->_syncDownOperation)
    {
      uint64_t v69 = 0;
      uint64_t v70 = 0;
    }
    else
    {
      uint64_t v69 = 0;
      if ((self->_state & 0x100) != 0)
      {
        uint64_t v70 = 0;
      }
      else
      {
        uint64_t v70 = 0;
        if ((v61 & 2) != 0)
        {
          [(BRCSyncOperationThrottle *)self->_syncDownThrottle nextTry];
          double v88 = v87;
          brc_interval_from_nsec();
          if (v88 <= v89)
          {
            uint64_t v69 = @" [sync-down waiting to be scheduled]";
            uint64_t v70 = 7;
          }
          else
          {
            uint64_t v90 = NSString;
            brc_interval_from_nsec();
            objc_msgSend(v90, "stringWithFormat:", @" [sync-down throttled (next-try:in %.01fs)]", v88 - v91);
            uint64_t v69 = (__CFString *)objc_claimAutoreleasedReturnValue();
            uint64_t v70 = 3;
          }
        }
      }
    }
    if (v67)
    {
      long long v71 = +[BRCDumpContext highlightedString:v67 type:v68 context:v7];
      [v8 appendString:v71];
    }
    if (v69)
    {
      uint64_t v72 = +[BRCDumpContext highlightedString:v69 type:v70 context:v7];
      [v8 appendString:v72];
    }
    [v8 appendFormat:@" [scheduling: %@]", self->_syncDeadlineSource];
    [v7 writeLineWithFormat:@"+ sync:      %@", v8];
    long long v73 = [(BRCAccountSession *)self->_session syncUpScheduler];
    long long v74 = [v73 aggregateDescriptionForJobsMatching:self->_serverZone context:v7];
    [v7 writeLineWithFormat:@"  up:        %@", v74];

    uint64_t v75 = [(BRCSyncBudgetThrottle *)self->_syncUpBudget debugDescriptionWithDefaults:v100];
    [v7 writeLineWithFormat:@"  up-budget: %@", v75];

    lastSyncUpError = self->_lastSyncUpError;
    if (lastSyncUpError)
    {
      v77 = +[BRCDumpContext stringFromError:lastSyncUpError context:v7];
      [v7 writeLineWithFormat:@"  up-error:  %@", v77];
    }
    lastSyncDownError = self->_lastSyncDownError;
    if (lastSyncDownError)
    {
      uint64_t v79 = +[BRCDumpContext stringFromError:lastSyncDownError context:v7];
      [v7 writeLineWithFormat:@"  dn-error   %@", v79];
    }
    syncUpOperatiouint64_t n = self->_syncUpOperation;
    if (syncUpOperation || (syncUpOperatiouint64_t n = self->_syncDownOperation) != 0)
    {
      uint64_t v81 = [syncUpOperation descriptionWithContext:v7];
      [v7 writeLineWithFormat:@"  operation: %@", v81];
    }
    uint64_t v82 = [(BRCClientZone *)self session];
    uint64_t v83 = [v82 serverState];
    uint64_t v84 = [(BRCClientZone *)self mangledID];
    v85 = [v83 dumpMigrationQueriesForMangledID:v84];

    if (v85) {
      [v7 writeLineWithFormat:@"+ migration: %@", v85];
    }
  }
  if ([(NSMutableSet *)self->_itemIDsBlockedFromSyncForCZMProcessing count]) {
    [v7 writeLineWithFormat:@"+ process-removal: %@", self->_itemIDsBlockedFromSyncForCZMProcessing];
  }

LABEL_93:
  return 1;
}

uint64_t __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) writeLineWithFormat:@"%@:%@", a2, a3];
}

uint64_t __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_2(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) writeLineWithFormat:@"%@:%@", a2, a3];
}

uint64_t __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_3(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) writeLineWithFormat:@"%@:%@", a2, a3];
}

uint64_t __70__BRCClientZone_dumpActivityToContext_includeExpensiveActivity_error___block_invoke_4(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) writeLineWithFormat:@"%@:%@", a2, a3];
}

- (BOOL)shouldSyncMangledID:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[BRCUserDefaults defaultsForMangledID:v4];
  int v6 = [v5 forceSyncOverride];

  if (v6 == 1) {
    goto LABEL_7;
  }
  if (v6 == 255)
  {
    char v7 = 0;
    goto LABEL_8;
  }
  if ([(BRCClientZone *)self isSharedZone]
    || ([(BRCAccountSession *)self->_session appLibraryByMangledID:v4],
        id v8 = objc_claimAutoreleasedReturnValue(),
        char v9 = [v8 hasLocalChanges],
        v8,
        (v9 & 1) != 0)
    || [(BRCClientZone *)self _hasNonDiscretionaryServerStitchingOperation])
  {
LABEL_7:
    char v7 = 1;
    goto LABEL_8;
  }
  int v11 = [v4 appLibraryOrZoneName];
  uint64_t v12 = [(BRCClientZone *)self session];
  uint64_t v13 = [v12 appLibraryByMangledID:v4];
  unint64_t v14 = [v13 containerMetadata];
  char v15 = [v14 isDocumentScopePublic];

  char v16 = [v11 isEqualToString:*MEMORY[0x1E4F59418]];
  char v7 = 1;
  if ((v15 & 1) == 0 && (v16 & 1) == 0)
  {
    uint64_t v17 = +[BRCCloudDocsAppsMonitor cloudDocsAppsMonitor];
    char v7 = [v17 isApplicationInstalledForContainerID:v11];
  }
LABEL_8:

  return v7;
}

- (float)syncUpBackoffDelay
{
  [(BRCSyncOperationThrottle *)self->_syncUpThrottle delay];
  return v2;
}

- (float)syncUpBackoffRatio
{
  [(BRCSyncOperationBackoffRatio *)self->_syncUpBackoffRatio backoffRatio];
  return result;
}

- (void)resetSyncUpBackoffRatio
{
}

- (BOOL)isBusy
{
  return (self->_state & 0x100) != 0
      || ([(BRCClientZone *)self _appLibrariesState] & 0x80000) != 0
      || ([(BRCClientZone *)self syncState] & 0xF) != 0;
}

- (BOOL)activated
{
  return self->_activated;
}

- (BRCClientZoneDelegate)delegate
{
  return self->_delegate;
}

- (void)setDelegate:(id)a3
{
}

- (BRCPQLConnection)db
{
  return self->_db;
}

- (BOOL)needsSave
{
  return self->_needsSave;
}

- (unsigned)state
{
  return self->_state;
}

- (BRCZoneRowID)dbRowID
{
  return self->_dbRowID;
}

- (void)setDbRowID:(id)a3
{
}

- (NSString)zoneName
{
  return self->_zoneName;
}

- (unint64_t)currentRequestID
{
  return self->_requestID;
}

- (int64_t)lastInsertedRank
{
  return self->_lastInsertedRank;
}

- (BRCAccountSession)session
{
  return self->_session;
}

- (void)setSession:(id)a3
{
}

- (BRCDeadlineSource)syncDeadlineSource
{
  return self->_syncDeadlineSource;
}

- (BRCServerZone)serverZone
{
  return self->_serverZone;
}

- (void)setServerZone:(id)a3
{
}

- (NSString)osNameRequiredToSync
{
  return self->_osNameRequiredToSync;
}

- (brc_task_tracker)taskTracker
{
  return self->_taskTracker;
}

- (NSDate)lastAttemptedSyncDownDate
{
  return self->_lastAttemptedSyncDownDate;
}

- (void)setLastAttemptedSyncDownDate:(id)a3
{
}

- (NSSet)itemIDsBlockedFromSyncForCZMProcessing
{
  return &self->_itemIDsBlockedFromSyncForCZMProcessing->super;
}

- (NSDictionary)parentsOfCZMFaults
{
  return &self->_parentsOfCZMFaults->super;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_osNameRequiredToSync, 0);
  objc_storeStrong((id *)&self->_syncThrottles, 0);
  objc_storeStrong((id *)&self->_resetAfterAppUninstallTimer, 0);
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_bubbleSyncTask, 0);
  objc_storeStrong((id *)&self->_outOfBandSyncOperations, 0);
  objc_storeStrong((id *)&self->_allItemsDidUploadTrackers, 0);
  objc_storeStrong((id *)&self->_syncDownDependencies, 0);
  objc_storeStrong((id *)&self->_syncDownGroup, 0);
  objc_storeStrong((id *)&self->_directoriesCreatedLastSyncUp, 0);
  objc_storeStrong((id *)&self->_nextIdleHandlers, 0);
  objc_storeStrong((id *)&self->_hasWorkDidUpdateObserver, 0);
  objc_storeStrong((id *)&self->_currentSyncDownBarriers, 0);
  objc_storeStrong((id *)&self->_nextSyncDownBarriers, 0);
  objc_storeStrong((id *)&self->_locateBlocksToPerformForRecordID, 0);
  objc_storeStrong((id *)&self->_syncDownBlockToPerformForItemID, 0);
  objc_storeStrong((id *)&self->_downloadedBlockToPerformForItemID, 0);
  objc_storeStrong((id *)&self->_onDiskBlockToPerformForItemID, 0);
  objc_storeStrong((id *)&self->_parentsOfCZMFaults, 0);
  objc_storeStrong((id *)&self->_blocksWaitingOnCrossZoneMoveProcessing, 0);
  objc_storeStrong((id *)&self->_itemsBlockedByAssociationForCZMProcessing, 0);
  objc_storeStrong((id *)&self->_itemIDsBlockedFromSyncForCZMProcessing, 0);
  objc_storeStrong((id *)&self->_syncDownBlockToPerformForBookmarkData, 0);
  objc_storeStrong((id *)&self->_resetTimer, 0);
  objc_storeStrong((id *)&self->_appUninstalledDate, 0);
  objc_storeStrong((id *)&self->_lastAttemptedSyncDownDate, 0);
  objc_storeStrong((id *)&self->_lastSyncDownDate, 0);
  objc_storeStrong((id *)&self->_appliedTombstoneRanks, 0);
  objc_storeStrong((id *)&self->_locateRecordsOperationThrottle, 0);
  objc_storeStrong((id *)&self->_serverStitchingOperationThrottle, 0);
  objc_storeStrong((id *)&self->_fetchRecentsOperation, 0);
  objc_storeStrong((id *)&self->_locateRecordOperations, 0);
  objc_storeStrong((id *)&self->_fetchParentOperations, 0);
  objc_storeStrong((id *)&self->_recursiveListOperations, 0);
  objc_storeStrong((id *)&self->_runningListOperations, 0);
  objc_storeStrong((id *)&self->_blockedOperationsOnInitialSync, 0);
  objc_storeStrong((id *)&self->_syncDeadlineSource, 0);
  objc_storeStrong((id *)&self->_syncDownThrottle, 0);
  objc_storeStrong((id *)&self->_syncUpBackoffRatio, 0);
  objc_storeStrong((id *)&self->_syncUpBudget, 0);
  objc_storeStrong((id *)&self->_syncUpThrottle, 0);
  objc_storeStrong((id *)&self->_lastSyncDownError, 0);
  objc_storeStrong((id *)&self->_syncDownOperation, 0);
  objc_storeStrong((id *)&self->_lastSyncUpError, 0);
  objc_storeStrong((id *)&self->_syncUpOperation, 0);
  objc_storeStrong((id *)&self->_readerThrottle, 0);
  objc_storeStrong((id *)&self->_db, 0);
  objc_storeStrong((id *)&self->_mangledID, 0);
  objc_storeStrong((id *)&self->_ownerName, 0);
  objc_storeStrong((id *)&self->_zoneName, 0);
  objc_storeStrong((id *)&self->_dbRowID, 0);
  objc_storeStrong((id *)&self->_delegate, 0);
  objc_storeStrong((id *)&self->_serverZone, 0);
  objc_storeStrong((id *)&self->_session, 0);
}

- (id)_refreshItemFromDB:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  sessiouint64_t n = self->_session;
  int v6 = [v4 zoneRowID];
  char v7 = [(BRCAccountSession *)session serverZoneByRowID:v6];
  id v8 = [v7 clientZone];

  char v9 = [v4 itemID];
  BOOL v10 = [v8 itemByItemID:v9];

  if ([v10 isOnDisk])
  {
    id v11 = v10;
  }
  else
  {
    uint64_t v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      int v15 = 138412546;
      id v16 = v4;
      __int16 v17 = 2112;
      char v18 = v12;
      _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Couldn't find refreshed item for %@%@", (uint8_t *)&v15, 0x16u);
    }

    [(BRCClientZone *)self _finishedProcessingItemThatMovedToThisZone:v4];
    id v11 = 0;
  }

  return v11;
}

- (void)_removeItemFromCZMProcessingIfNotAssociated:(id)a3
{
  id v4 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  BOOL v5 = [(NSMutableDictionary *)self->_itemsBlockedByAssociationForCZMProcessing allValues];
  char v6 = [v5 containsObject:v4];

  if ((v6 & 1) == 0)
  {
    char v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone(LegacyAdditions) _removeItemFromCZMProcessingIfNotAssociated:]();
    }

    [(NSMutableSet *)self->_itemIDsBlockedFromSyncForCZMProcessing removeObject:v4];
  }
}

- (void)_finishedProcessingItemThatMovedToThisZone:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  BOOL v5 = [(NSMutableDictionary *)self->_itemsBlockedByAssociationForCZMProcessing objectForKeyedSubscript:v4];
  [(NSMutableDictionary *)self->_itemsBlockedByAssociationForCZMProcessing removeObjectForKey:v4];
  parentsOfCZMFaults = self->_parentsOfCZMFaults;
  char v7 = [v4 itemID];
  [(NSMutableDictionary *)parentsOfCZMFaults removeObjectForKey:v7];

  if (v5) {
    [(BRCClientZone *)self _removeItemFromCZMProcessingIfNotAssociated:v5];
  }
  [(BRCClientZone *)self _removeItemFromCZMProcessingIfNotAssociated:v4];
  if (![(NSMutableSet *)self->_itemIDsBlockedFromSyncForCZMProcessing count])
  {
    [(BRCClientZone *)self scheduleSyncUp];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v8 = self->_blocksWaitingOnCrossZoneMoveProcessing;
    uint64_t v9 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v17;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v17 != v11) {
            objc_enumerationMutation(v8);
          }
          (*(void (**)(void))(*(void *)(*((void *)&v16 + 1) + 8 * v12) + 16))(*(void *)(*((void *)&v16 + 1) + 8 * v12));
          ++v12;
        }
        while (v10 != v12);
        uint64_t v10 = [(NSMutableArray *)v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v10);
    }

    blocksWaitingOnCrossZoneMoveProcessing = self->_blocksWaitingOnCrossZoneMoveProcessing;
    self->_blocksWaitingOnCrossZoneMoveProcessing = 0;

    itemIDsBlockedFromSyncForCZMProcessing = self->_itemIDsBlockedFromSyncForCZMProcessing;
    self->_itemIDsBlockedFromSyncForCZMProcessing = 0;

    itemsBlockedByAssociationForCZMProcessing = self->_itemsBlockedByAssociationForCZMProcessing;
    self->_itemsBlockedByAssociationForCZMProcessing = 0;
  }
}

- (void)_removeItemAndProcessForCrossZoneMove:(id)a3
{
  id v4 = a3;
  if ([v4 isAlmostDead])
  {
    BOOL v5 = brc_bread_crumbs();
    char v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCClientZone(LegacyAdditions) _removeItemAndProcessForCrossZoneMove:]();
    }

    char v7 = [v4 itemGlobalID];
    [(BRCClientZone *)self _finishedProcessingItemThatMovedToThisZone:v7];
  }
  else
  {
    id v8 = [(BRCClientZone *)self db];
    uint64_t v11 = MEMORY[0x1E4F143A8];
    uint64_t v12 = 3221225472;
    uint64_t v13 = __72__BRCClientZone_LegacyAdditions___removeItemAndProcessForCrossZoneMove___block_invoke;
    unint64_t v14 = &unk_1E6995AD0;
    id v9 = v4;
    id v15 = v9;
    long long v16 = self;
    [v8 groupInBatch:&v11];

    uint64_t v10 = objc_msgSend(v9, "itemGlobalID", v11, v12, v13, v14);
    [(BRCClientZone *)self _finishedProcessingItemThatMovedToThisZone:v10];

    char v7 = v15;
  }
}

void __72__BRCClientZone_LegacyAdditions___removeItemAndProcessForCrossZoneMove___block_invoke(uint64_t a1)
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  double v2 = [[BRCItemToPathLookup alloc] initWithItem:*(void *)(a1 + 32)];
  uint64_t v3 = [(BRCItemToPathLookup *)v2 byFileSystemID];
  id v4 = [*(id *)(a1 + 32) appLibrary];
  BOOL v5 = [v4 mangledID];
  char v6 = +[BRCUserDefaults defaultsForMangledID:v5];

  uint64_t v7 = [v6 timeoutForCZMProcessing];
  int v8 = [v6 supportsServerSideAssetCopies];
  if (!v3)
  {
    if ([*(id *)(a1 + 32) isDocument])
    {
      uint64_t v9 = brc_current_date_nsec() / 1000000000;
      uint64_t v10 = [*(id *)(a1 + 32) asDocument];
      uint64_t v11 = [v10 currentVersion];
      uint64_t v12 = v9 - [v11 mtime];

      if (v12 < v7) {
        goto LABEL_10;
      }
    }
  }
  int v13 = [*(id *)(a1 + 32) isDirectory];
  unint64_t v14 = *(void **)(a1 + 32);
  if (v13)
  {
    id v15 = [v14 asDirectory];
    if (([v15 containsFault] ^ 1 | v8) != 1
      || ([*(id *)(a1 + 32) isFault] & 1) != 0)
    {

LABEL_10:
      [(BRCItemToPathLookup *)v2 closePaths];
      long long v16 = brc_bread_crumbs();
      long long v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v18 = *(void *)(a1 + 32);
        int v32 = 138412546;
        uint64_t v33 = v18;
        __int16 v34 = 2112;
        id v35 = v16;
        _os_log_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEFAULT, "[WARNING] State changed before we could remove %@. Aborting removal%@", (uint8_t *)&v32, 0x16u);
      }

      [*(id *)(a1 + 32) markLostWhenReplacedByItem:0];
      [*(id *)(a1 + 32) saveToDB];
      goto LABEL_13;
    }
    char v19 = [v3 isFault];

    if (v19) {
      goto LABEL_10;
    }
  }
  else if (([v14 isFault] & 1) != 0 || objc_msgSend(v3, "isFault"))
  {
    goto LABEL_10;
  }
  uint64_t v20 = brc_bread_crumbs();
  uint64_t v21 = brc_default_log();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v22 = *(void *)(a1 + 32);
    int v32 = 138412546;
    uint64_t v33 = v22;
    __int16 v34 = 2112;
    id v35 = v20;
    _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] Proceeding with removal of item which moved into a share %@%@", (uint8_t *)&v32, 0x16u);
  }

  if ([*(id *)(a1 + 32) isSharedToMeTopLevelItem]) {
    [v3 performOnOpenFileDescriptor:&__block_literal_global_28 error:0];
  }
  [*(id *)(a1 + 32) markRemovedFromFilesystemForServerEdit:0];
  [*(id *)(a1 + 32) moveAsideLocally];
  uint64_t v23 = [*(id *)(a1 + 32) clientZone];
  int v24 = [v23 isPrivateZone];

  if (v24)
  {
    uint64_t v25 = *(void **)(a1 + 32);
    uint64_t v26 = [v25 clientZone];
    id v27 = [v26 asPrivateClientZone];
    unint64_t v28 = [v27 defaultAppLibrary];
    [v25 setAppLibrary:v28];
  }
  [*(id *)(a1 + 32) markNeedsUploadOrSyncingUp];
  [*(id *)(a1 + 32) saveToDB];
  if (v3)
  {
    uint64_t v29 = [*(id *)(*(void *)(a1 + 40) + 8) fsReader];
    [v29 fseventAtPath:v3 flags:1];
  }
  else
  {
    uint64_t v30 = brc_bread_crumbs();
    id v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      __72__BRCClientZone_LegacyAdditions___removeItemAndProcessForCrossZoneMove___block_invoke_cold_1();
    }

    uint64_t v29 = [*(id *)(a1 + 32) appLibrary];
    [v29 scheduleDeepScanWithReason:@"No path to process fsevent on"];
  }

LABEL_13:
  [(BRCItemToPathLookup *)v2 closePaths];
}

uint64_t __72__BRCClientZone_LegacyAdditions___removeItemAndProcessForCrossZoneMove___block_invoke_2(int a1, int fd)
{
  uint64_t result = fremovexattr(fd, "com.apple.clouddocs.private.share-bookmark#B", 0);
  if (result) {
    return *__error();
  }
  return result;
}

- (void)_startDownloadingItemForCrossZoneMoveIfNecessary:(id)a3
{
  id v4 = a3;
  uint64_t v39 = 0;
  v40[0] = &v39;
  v40[1] = 0x3032000000;
  v40[2] = __Block_byref_object_copy__27;
  v40[3] = __Block_byref_object_dispose__27;
  id v41 = 0;
  BOOL v5 = [v4 itemGlobalID];
  if ([v4 isDirectory])
  {
    char v6 = [v4 asDirectory];
    int v7 = [v6 containsFault];

    if (v7)
    {
      int v8 = brc_bread_crumbs();
      uint64_t v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone(LegacyAdditions) _startDownloadingItemForCrossZoneMoveIfNecessary:]();
      }

      dispatch_group_t v10 = dispatch_group_create();
      uint64_t v11 = self->_session;
      uint64_t v12 = [v4 asDirectory];
      int v13 = [v4 db];
      v33[0] = MEMORY[0x1E4F143A8];
      v33[1] = 3221225472;
      v33[2] = __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke;
      v33[3] = &unk_1E6997C30;
      unint64_t v14 = v11;
      __int16 v34 = v14;
      id v35 = v4;
      BOOL v38 = &v39;
      id v15 = v10;
      uint64_t v36 = v15;
      id v16 = v5;
      id v37 = v16;
      [(BRCAccountSession *)v14 enumerateSideFaultsUnderParent:v12 db:v13 block:v33];

      long long v17 = [(BRCAccountSession *)v14 clientTruthWorkloop];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_11;
      block[3] = &unk_1E6993628;
      id v31 = v16;
      int v32 = self;
      dispatch_group_notify(v15, v17, block);

LABEL_15:
      goto LABEL_16;
    }
  }
  if ([v4 isFault])
  {
    uint64_t v18 = v40[0];
    id obj = *(id *)(v40[0] + 40);
    char v19 = [v4 startDownloadInTask:0 options:0 etagIfLoser:0 stageFileName:0 error:&obj];
    objc_storeStrong((id *)(v18 + 40), obj);
    if (v19)
    {
      uint64_t v20 = brc_bread_crumbs();
      uint64_t v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
        -[BRCClientZone(LegacyAdditions) _startDownloadingItemForCrossZoneMoveIfNecessary:]();
      }

      uint64_t v22 = [v4 clientZone];
      uint64_t v26 = MEMORY[0x1E4F143A8];
      id v27 = v5;
      unint64_t v28 = self;
      uint64_t v23 = objc_msgSend(v4, "itemID", v26, 3221225472, __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_13, &unk_1E6997C58);
      [v22 performBlock:&v26 whenItemWithIDIsDownloaded:v23];

      id v15 = v27;
    }
    else
    {
      int v24 = brc_bread_crumbs();
      uint64_t v25 = brc_default_log();
      if (os_log_type_enabled(v25, (os_log_type_t)0x90u)) {
        -[BRCClientZone(LegacyAdditions) _startDownloadingItemForCrossZoneMoveIfNecessary:]((uint64_t)v40);
      }

      id v15 = [v4 itemGlobalID];
      [(BRCClientZone *)self _finishedProcessingItemThatMovedToThisZone:v15];
    }
    goto LABEL_15;
  }
  [(BRCClientZone *)self _removeItemAndProcessForCrossZoneMove:v4];
LABEL_16:

  _Block_object_dispose(&v39, 8);
}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = *(void **)(a1 + 32);
  BOOL v5 = [v3 zoneRowID];
  char v6 = [v4 serverZoneByRowID:v5];
  int v7 = [v6 clientZone];

  int v8 = [*(id *)(a1 + 40) clientZone];
  if (![v8 isPrivateZone])
  {

    goto LABEL_6;
  }
  int v9 = [v7 isSharedZone];

  if (!v9)
  {
LABEL_6:
    uint64_t v12 = [v7 mangledID];
    dispatch_group_t v10 = +[BRCUserDefaults defaultsForMangledID:v12];

    int v13 = [v3 itemID];
    uint64_t v11 = [v7 itemByItemID:v13];

    if ([v11 isFault]
      && ([v10 supportsServerSideAssetCopies] & 1) == 0)
    {
      uint64_t v16 = *(void *)(*(void *)(a1 + 64) + 8);
      id obj = *(id *)(v16 + 40);
      int v17 = [v11 startDownloadInTask:0 options:0 etagIfLoser:0 stageFileName:0 error:&obj];
      objc_storeStrong((id *)(v16 + 40), obj);
      if (v17)
      {
        dispatch_group_enter(*(dispatch_group_t *)(a1 + 48));
        uint64_t v18 = [v11 clientZone];
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_7;
        v22[3] = &unk_1E6997C08;
        id v23 = *(id *)(a1 + 48);
        char v19 = [v11 itemID];
        [v18 performBlock:v22 whenItemWithIDIsDownloaded:v19];

        unint64_t v14 = v23;
      }
      else
      {
        unint64_t v14 = brc_bread_crumbs();
        uint64_t v20 = brc_default_log();
        if (os_log_type_enabled(v20, (os_log_type_t)0x90u))
        {
          uint64_t v21 = *(void *)(a1 + 56);
          *(_DWORD *)buf = 138412802;
          uint64_t v26 = v11;
          __int16 v27 = 2112;
          uint64_t v28 = v21;
          __int16 v29 = 2112;
          uint64_t v30 = v14;
          _os_log_error_impl(&dword_1D353B000, v20, (os_log_type_t)0x90u, "[ERROR] Failed to start downloading item %@ under %@%@", buf, 0x20u);
        }
      }
    }
    else
    {
      if ([v11 isFault]) {
        goto LABEL_18;
      }
      unint64_t v14 = brc_bread_crumbs();
      id v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
        __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_cold_2();
      }
    }
    goto LABEL_18;
  }
  dispatch_group_t v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
    __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_cold_1();
  }
LABEL_18:
}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_7(uint64_t a1)
{
}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_11(uint64_t a1)
{
  double v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_11_cold_1(a1);
  }

  id v4 = [*(id *)(a1 + 40) _refreshItemFromDB:*(void *)(a1 + 32)];
  if (v4) {
    [*(id *)(a1 + 40) _removeItemAndProcessForCrossZoneMove:v4];
  }
}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_13(uint64_t a1)
{
  double v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_13_cold_1(a1);
  }

  id v4 = [*(id *)(*(void *)(a1 + 40) + 8) clientTruthWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_14;
  block[3] = &unk_1E6993628;
  int8x16_t v6 = *(int8x16_t *)(a1 + 32);
  id v5 = (id)v6.i64[0];
  int8x16_t v8 = vextq_s8(v6, v6, 8uLL);
  dispatch_async(v4, block);
}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_14(uint64_t a1)
{
  double v2 = [*(id *)(a1 + 32) _refreshItemFromDB:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = v2;
    [*(id *)(a1 + 32) _removeItemAndProcessForCrossZoneMove:v2];
    double v2 = v3;
  }
}

- (void)itemCrossZoneMoved:(id)a3 withLookup:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  int8x16_t v8 = [v7 parentItem];
  int v9 = [v8 itemGlobalID];

  if (!v9)
  {
    uint64_t v20 = brc_bread_crumbs();
    uint64_t v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone(LegacyAdditions) itemCrossZoneMoved:withLookup:]();
    }
  }
  if (!self->_parentsOfCZMFaults)
  {
    dispatch_group_t v10 = (NSMutableDictionary *)objc_opt_new();
    parentsOfCZMFaults = self->_parentsOfCZMFaults;
    self->_parentsOfCZMFaults = v10;
  }
  uint64_t v12 = [v6 clientZone];
  char v13 = [v12 isEqualToClientZone:self];

  if ((v13 & 1) == 0)
  {
    uint64_t v22 = brc_bread_crumbs();
    id v23 = brc_default_log();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone(LegacyAdditions) itemCrossZoneMoved:withLookup:]();
    }
  }
  unint64_t v14 = brc_bread_crumbs();
  id v15 = brc_default_log();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v24 = 138412802;
    uint64_t v25 = v9;
    __int16 v26 = 2112;
    id v27 = v6;
    __int16 v28 = 2112;
    __int16 v29 = v14;
    _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] An item moved into %@ and needs to be downloaded for czm %@.%@", (uint8_t *)&v24, 0x20u);
  }

  uint64_t v16 = self->_parentsOfCZMFaults;
  int v17 = [v6 itemID];
  [(NSMutableDictionary *)v16 setObject:v9 forKeyedSubscript:v17];

  uint64_t v18 = [v6 st];
  char v19 = [v7 relpathOfFSEvent];
  [v18 updateFilenameFromPath:v19];

  [(BRCClientZone *)self _startDownloadingItemForCrossZoneMoveIfNecessary:v6];
}

- (void)itemMovedIntoShareInThisZone:(id)a3 associatedItemID:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if ([v6 isDocument])
  {
    int8x16_t v8 = [v6 asDocument];
  }
  else
  {
    int8x16_t v8 = 0;
  }
  if ([v8 supportsServerSideAssetCopies])
  {
    int v9 = [v6 parentItemOnFS];
    [v8 markCrossZoneMovedForServerAssetCopyWithParentItem:v9 path:0];

    [v8 saveToDB];
  }
  else
  {
    if (!self->_itemIDsBlockedFromSyncForCZMProcessing)
    {
      dispatch_group_t v10 = (NSMutableSet *)objc_opt_new();
      itemIDsBlockedFromSyncForCZMProcessing = self->_itemIDsBlockedFromSyncForCZMProcessing;
      self->_itemIDsBlockedFromSyncForCZMProcessing = v10;
    }
    uint64_t v12 = [v6 itemGlobalID];
    if (v7)
    {
      itemsBlockedByAssociationForCZMProcessing = self->_itemsBlockedByAssociationForCZMProcessing;
      if (!itemsBlockedByAssociationForCZMProcessing)
      {
        unint64_t v14 = (NSMutableDictionary *)objc_opt_new();
        id v15 = self->_itemsBlockedByAssociationForCZMProcessing;
        self->_itemsBlockedByAssociationForCZMProcessing = v14;

        itemsBlockedByAssociationForCZMProcessing = self->_itemsBlockedByAssociationForCZMProcessing;
      }
      uint64_t v16 = [(NSMutableDictionary *)itemsBlockedByAssociationForCZMProcessing objectForKeyedSubscript:v12];
      [(NSMutableDictionary *)self->_itemsBlockedByAssociationForCZMProcessing setObject:v7 forKeyedSubscript:v12];
      [(NSMutableSet *)self->_itemIDsBlockedFromSyncForCZMProcessing addObject:v7];
      if (v16 && ([v16 isEqualToItemGlobalID:v7] & 1) == 0)
      {
        int v17 = brc_bread_crumbs();
        uint64_t v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
        {
          int v21 = 138413058;
          id v22 = v6;
          __int16 v23 = 2112;
          id v24 = v16;
          __int16 v25 = 2112;
          id v26 = v7;
          __int16 v27 = 2112;
          __int16 v28 = v17;
          _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] Strange... We have multiple levels of associated item IDs for %@ - (%@ vs %@)%@", (uint8_t *)&v21, 0x2Au);
        }

        [(BRCClientZone *)self _removeItemFromCZMProcessingIfNotAssociated:v16];
      }
    }
    if (([(NSMutableSet *)self->_itemIDsBlockedFromSyncForCZMProcessing containsObject:v12] & 1) == 0)
    {
      char v19 = brc_bread_crumbs();
      uint64_t v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        int v21 = 138412802;
        id v22 = v6;
        __int16 v23 = 2112;
        id v24 = v7;
        __int16 v25 = 2112;
        id v26 = v19;
        _os_log_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEFAULT, "[WARNING] An item moved into this zone and needs to be downloaded for czm %@. (reparented root item %@)%@", (uint8_t *)&v21, 0x20u);
      }

      [(NSMutableSet *)self->_itemIDsBlockedFromSyncForCZMProcessing addObject:v12];
      [(BRCClientZone *)self _startDownloadingItemForCrossZoneMoveIfNecessary:v6];
    }
  }
}

- (void)waitForCrossZoneMoveProcessingWithCompletion:(id)a3
{
  int8x16_t v8 = (void (**)(void))a3;
  [(BRCPQLConnection *)self->_db assertOnQueue];
  if ([(NSMutableSet *)self->_itemIDsBlockedFromSyncForCZMProcessing count])
  {
    blocksWaitingOnCrossZoneMoveProcessing = self->_blocksWaitingOnCrossZoneMoveProcessing;
    if (!blocksWaitingOnCrossZoneMoveProcessing)
    {
      id v5 = (NSMutableArray *)objc_opt_new();
      id v6 = self->_blocksWaitingOnCrossZoneMoveProcessing;
      self->_blocksWaitingOnCrossZoneMoveProcessing = v5;

      blocksWaitingOnCrossZoneMoveProcessing = self->_blocksWaitingOnCrossZoneMoveProcessing;
    }
    id v7 = (void *)MEMORY[0x1D94389C0](v8);
    [(NSMutableArray *)blocksWaitingOnCrossZoneMoveProcessing addObject:v7];
  }
  else
  {
    v8[2]();
  }
}

- (id)reservedItemByParentID:(id)a3 andLogicalName:(id)a4
{
  return [(BRCClientZone *)self reservedItemByParentID:a3 andLogicalName:a4 db:self->_db];
}

- (id)reservedItemByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_CFURLIsPromiseName())
  {
    char v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone(LegacyAdditions) reservedItemByParentID:andLogicalName:db:]();
    }
  }
  uint64_t v11 = (void *)[v10 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE(item_parent_id = %@ AND item_filename = %@ AND +item_state = -2 AND item_parent_zone_rowid = %@ AND item_bouncedname IS NULL) OR(item_parent_id = %@ AND item_bouncedname = %@ AND +item_state = -2 AND item_parent_zone_rowid = %@)", v8, v9, self->_dbRowID, v8, v9, self->_dbRowID];
  if ([v11 next])
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = __75__BRCClientZone_LegacyAdditions__reservedItemByParentID_andLogicalName_db___block_invoke;
    v21[3] = &unk_1E6994148;
    void v21[4] = self;
    id v22 = v10;
    uint64_t v12 = [v11 object:v21];
    if ([v11 next])
    {
      char v13 = brc_bread_crumbs();
      unint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        dbRowID = self->_dbRowID;
        *(_DWORD *)buf = 138413058;
        id v24 = v8;
        __int16 v25 = 2112;
        id v26 = v9;
        __int16 v27 = 2112;
        __int16 v28 = dbRowID;
        __int16 v29 = 2112;
        uint64_t v30 = v13;
        _os_log_fault_impl(&dword_1D353B000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there should never be more than one match for that query (parentID: %@, name: %@, parentZoneID: %@)%@", buf, 0x2Au);
      }
    }
    [v11 close];
    id v15 = v12;

    uint64_t v16 = v15;
  }
  else
  {
    id v15 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:12 andMessage:@"item not found"];
    [(BRCPQLConnection *)self->_db setLastError:v15];
    uint64_t v16 = 0;
  }

  return v16;
}

id __75__BRCClientZone_LegacyAdditions__reservedItemByParentID_andLogicalName_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)faultByParentID:(id)a3 andLogicalName:(id)a4
{
  return [(BRCClientZone *)self faultByParentID:a3 andLogicalName:a4 db:self->_db];
}

- (id)faultByParentID:(id)a3 andLogicalName:(id)a4 db:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_CFURLIsPromiseName())
  {
    uint64_t v18 = brc_bread_crumbs();
    char v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone(LegacyAdditions) reservedItemByParentID:andLogicalName:db:]();
    }
  }
  uint64_t v11 = (void *)[v10 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE(item_parent_id = %@ AND item_filename = %@ AND +item_state != -2 AND +item_type IN (2, 7, 8) AND item_parent_zone_rowid = %@ AND item_bouncedname IS NULL) OR(item_parent_id = %@ AND item_bouncedname = %@ AND +item_state != -2 AND +item_type IN (2, 7, 8) AND item_parent_zone_rowid = %@)", v8, v9, self->_dbRowID, v8, v9, self->_dbRowID];
  if ([v11 next])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __68__BRCClientZone_LegacyAdditions__faultByParentID_andLogicalName_db___block_invoke;
    v20[3] = &unk_1E6994148;
    v20[4] = self;
    id v21 = v10;
    uint64_t v12 = [v11 object:v20];
    if ([v11 next])
    {
      char v13 = brc_bread_crumbs();
      unint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        dbRowID = self->_dbRowID;
        *(_DWORD *)buf = 138413058;
        id v23 = v8;
        __int16 v24 = 2112;
        id v25 = v9;
        __int16 v26 = 2112;
        __int16 v27 = dbRowID;
        __int16 v28 = 2112;
        __int16 v29 = v13;
        _os_log_fault_impl(&dword_1D353B000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there should never be more than one match for that query (parentID: %@, name: %@, parentZoneID: %@)%@", buf, 0x2Au);
      }
    }
    [v11 close];
    id v15 = [v12 asDocument];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:12 andMessage:@"item not found"];
    [v10 setLastError:v12];
    id v15 = 0;
  }

  return v15;
}

id __68__BRCClientZone_LegacyAdditions__faultByParentID_andLogicalName_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

- (id)faultByParentID:(id)a3 andPhysicalName:(id)a4
{
  return [(BRCClientZone *)self faultByParentID:a3 andPhysicalName:a4 db:self->_db];
}

- (id)faultByParentID:(id)a3 andPhysicalName:(id)a4 db:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!_CFURLIsPromiseName())
  {
    uint64_t v18 = brc_bread_crumbs();
    char v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
      -[BRCClientZone(LegacyAdditions) faultByParentID:andPhysicalName:db:]();
    }
  }
  uint64_t v11 = (void *)[v10 fetch:@"SELECT rowid, zone_rowid, item_id, item_creator_id, item_sharing_options, item_side_car_ckinfo, item_parent_zone_rowid, item_localsyncupstate, item_local_diffs, item_notifs_rank, app_library_rowid, item_min_supported_os_rowid, item_user_visible, item_stat_ckinfo, item_state, item_type, item_mode, item_birthtime, item_lastusedtime, item_favoriterank,item_parent_id, item_filename, item_hidden_ext, item_finder_tags, item_xattr_signature, item_trash_put_back_path, item_trash_put_back_parent_id, item_alias_target, item_creator, item_doc_id, item_file_id, item_generation, item_localname, item_processing_stamp, item_staged_file_id, item_staged_generation, item_bouncedname, item_scope, item_tmpbounceno, version_name, version_ckinfo, version_mtime, version_size, version_thumb_size, version_thumb_signature, version_content_signature, version_xattr_signature, version_edited_since_shared, version_device, version_conflict_loser_etags, version_quarantine_info, version_uploaded_assets, version_upload_error, version_old_zone_item_id, version_old_zone_rowid, desired_version, item_live_conflict_loser_etags, item_thumb_live_signature, item_thumb_greedy, version_block_sync_until_bundle_id, version_block_sync_until_timestamp FROM client_items WHERE(item_parent_id = %@ AND item_localname = %@ AND +item_state != -2 AND +item_type IN (2, 7, 8) AND item_parent_zone_rowid = %@)", v8, v9, self->_dbRowID];
  if ([v11 next])
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = __69__BRCClientZone_LegacyAdditions__faultByParentID_andPhysicalName_db___block_invoke;
    v20[3] = &unk_1E6994148;
    v20[4] = self;
    id v21 = v10;
    uint64_t v12 = [v11 object:v20];
    if ([v11 next])
    {
      char v13 = brc_bread_crumbs();
      unint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT))
      {
        dbRowID = self->_dbRowID;
        *(_DWORD *)buf = 138413058;
        id v23 = v8;
        __int16 v24 = 2112;
        id v25 = v9;
        __int16 v26 = 2112;
        __int16 v27 = dbRowID;
        __int16 v28 = 2112;
        __int16 v29 = v13;
        _os_log_fault_impl(&dword_1D353B000, v14, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: there should never be more than one match for that query (parentID: %@, name: %@, parentZoneID: %@)%@", buf, 0x2Au);
      }
    }
    [v11 close];
    id v15 = [v12 asDocument];
  }
  else
  {
    uint64_t v12 = [MEMORY[0x1E4F28C58] errorWithSqliteCode:12 andMessage:@"item not found"];
    [v10 setLastError:v12];
    id v15 = 0;
  }

  return v15;
}

id __69__BRCClientZone_LegacyAdditions__faultByParentID_andPhysicalName_db___block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = *(void **)(a1 + 32);
  id v6 = a2;
  id v7 = [v5 session];
  id v8 = (void *)[v7 newLocalItemFromPQLResultSet:v6 db:*(void *)(a1 + 40) error:a3];

  return v8;
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !self->_resetTimer%@", v2, v3, v4, v5, v6);
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_cold_2(int a1, uint64_t a2, uint8_t *buf, os_log_t log)
{
  *(_DWORD *)buf = 67109378;
  *((_DWORD *)buf + 1) = a1;
  *((_WORD *)buf + 4) = 2112;
  *(void *)(buf + 10) = a2;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] waiting for %u cancelled operations to finish%@", buf, 0x12u);
}

void __63__BRCClientZone_BRCZoneReset__scheduleReset_completionHandler___block_invoke_5_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┳%llx continuing reset%@");
}

void __73__BRCClientZone_BRCZoneReset___removeTargetedAliasesWithCompletionBlock___block_invoke_8_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self->_resetTimer == nil%@", v2, v3, v4, v5, v6);
}

void __61__BRCClientZone_BRCZoneReset___resetAndDeleteServerTruthData__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] deleting from server truth for %@%@");
}

void __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Keeping client items during reset%s%@");
}

void __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] Received the following error while doing the post hard reset phase - %@%@", (void)v3, DWORD2(v3));
}

void __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] Received the following error while doing the hard reset phase - %@%@", (void)v3, DWORD2(v3));
}

void __92__BRCClientZone_BRCZoneReset___performResetAndWantsUnlink_clientTruthBlock_completionBlock___block_invoke_2_cold_4()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] deleting from client truth for %@%@");
}

void __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] Failed acquiring coordinated deletions - %@%@", (void)v3, DWORD2(v3));
}

void __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ┳%llx acquired coordinated disconnects%@");
}

void __91__BRCClientZone_BRCZoneReset___performAfterResetServerAndClientPrivateTruthsAndUnlinkData___block_invoke_45_cold_1()
{
  OUTLINED_FUNCTION_0_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] disconnecting %@ on disk%@");
}

- (void)asPrivateClientZone
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: -asPrivateClientZone called on a shared zone%@", v2, v3, v4, v5, v6);
}

- (void)asSharedClientZone
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: -asSharedClientZone called on a private zone%@", v2, v3, v4, v5, v6);
}

- (void)rootItemID
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: must be implemented in subclass%@", v2, v3, v4, v5, v6);
}

- (void)setNeedsSave:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] container state now needs flush: %@%@", (void)v3, DWORD2(v3));
}

- (void)updateWithPlist:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _syncUpBudget && _syncUpThrottle && _syncDownThrottle%@", v2, v3, v4, v5, v6);
}

- (void)scheduleResetServerAndClientTruthsForReason:(uint64_t)a1 completionHandler:.cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_0(&dword_1D353B000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: Container needs server and client truths reset: %@%@", (uint8_t *)&v2);
}

- (void)sizeOfItemsNeedingSyncUpOrUploadAndReturnError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] shared iPad: Not considering %@ for sync bubble tasks because sync is blocked%@", (void)v3, DWORD2(v3));
}

void __63__BRCClientZone__scheduleZoneResetForUninstalledAppIfNecessary__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] client zone deallocated%@", v2, v3, v4, v5, v6);
}

void __63__BRCClientZone__scheduleZoneResetForUninstalledAppIfNecessary__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 zoneName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] execute zone reset for %@%@", v4);
}

- (void)_activateState:origState:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 zoneName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] cancel zone reset timer for %@%@", v4);
}

- (void)setSyncStateBits:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Asking for sync up but we never synced down, do that first%@", v2, v3, v4, v5, v6);
}

- (void)setSyncStateBits:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Ignoring sync state change because sync is disabled for this container%@", v2, v3, v4, v5, v6);
}

void __39__BRCClientZone_addOutOfBandOperation___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] added %@ as out of band sync operation%@", (void)v3, DWORD2(v3));
}

void __42__BRCClientZone_removeOutOfBandOperation___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] removed %@ out of band sync operation%@", (void)v3, DWORD2(v3));
}

- (void)_blockSyncDownOnStitchingOperations
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Sync down has greater priority than %@%@", (void)v3, DWORD2(v3));
}

- (void)syncDownImmediately
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Sync: updated sync-down throttle: %@%@", (void)v3, DWORD2(v3));
}

void __27__BRCClientZone__startSync__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [*(id *)(*(void *)v1 + 104) cost];
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v2, "[DEBUG] Sync: starting sync up with cost:%.1f%@", v3);
}

void __27__BRCClientZone__startSync__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Sync: nothing to sync up%@", v2, v3, v4, v5, v6);
}

void __27__BRCClientZone__startSync__block_invoke_cold_3()
{
  OUTLINED_FUNCTION_8();
  OUTLINED_FUNCTION_13_0(v1);
  brc_interval_from_nsec();
  OUTLINED_FUNCTION_15_1();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v2, "[DEBUG] Sync: items to sync-up are throttled for another %.1fs%@", v3);
}

void __27__BRCClientZone__startSync__block_invoke_214_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Forcing cancel on sync op%@", v2, v3, v4, v5, v6);
}

void __27__BRCClientZone__startSync__block_invoke_214_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(*(void *)(*(void *)(a1 + 40) + 8) + 40);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Executing cancelled op %@ so operations waiting on it can proceed%@", (void)v3, DWORD2(v3));
}

void __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: argc == 2%@", v2, v3, v4, v5, v6);
}

void __71__BRCClientZone_learnCKInfosFromSavedRecords_isOutOfBandModifyRecords___block_invoke_217_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Located ckinfo in previous zone%@", v2, v3, v4, v5, v6);
}

- (void)_syncUpOfRecords:(uint64_t)a1 createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 504);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Sync: requestID:%llu succeeded%@", (void)v3, DWORD2(v3));
}

- (void)_syncUpOfRecords:(uint64_t)a1 createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 504);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Sync: requestID:%llu cancelled%@", (void)v3, DWORD2(v3));
}

- (void)_syncUpOfRecords:createdAppLibraryNames:didFinishWithError:errorWasOnPCSChainedItem:throttledItemInBatch:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] decreasing sync-up batch size since server says we exceeded limits%@", v2, v3, v4, v5, v6);
}

- (void)_isIdle
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] %@ isn't idle because it's busy%@", (void)v3, DWORD2(v3));
}

void __48__BRCClientZone_notifyClient_afterNextSyncDown___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Queueing sync barrier sync down for %@%@", (void)v3, DWORD2(v3));
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Client zone is already idle%@", v2, v3, v4, v5, v6);
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_258_cold_1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_3_1();
  _os_log_error_impl(&dword_1D353B000, v1, (os_log_type_t)0x90u, "[ERROR] won't restore persona: %@%@", (uint8_t *)&v2, 0x16u);
}

void __39__BRCClientZone_notifyClient_whenIdle___block_invoke_266_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┏%llx received did-update-has-work notification%@", (void)v3, DWORD2(v3));
}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  uint64_t v1 = *(void *)(v0 + 176);
  int v4 = 138412802;
  uint64_t v5 = v1;
  __int16 v6 = 2112;
  uint64_t v7 = v0;
  __int16 v8 = 2112;
  uint64_t v9 = v2;
  _os_log_debug_impl(&dword_1D353B000, v3, OS_LOG_TYPE_DEBUG, "[DEBUG] Sync: updated sync-down throttle: %@\n      and container state: %@%@", (uint8_t *)&v4, 0x20u);
}

void __61__BRCClientZone_syncDownOperation_didFinishWithError_status___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = *(void *)(v0 + 136);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Not resuming sync token because %p is still in flight%@", (void)v3, DWORD2(v3));
}

- (void)didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:.cold.1()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Sync: requestID:%llu acknowledged%@");
}

- (void)didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:.cold.2()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Sync: just a new sync down without new sync up since requestID:%llu%@");
}

- (void)didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:.cold.3()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Updated %llu items to strip the oob-sync-ack bit%@");
}

- (void)didSyncDownRequestID:maxApplyRank:caughtUpWithServer:syncDownDate:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _requestID == 0 || requestID <= _requestID%@", v2, v3, v4, v5, v6);
}

- (void)_crossZoneMoveDocumentsToZone:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Not cross zone moving a zone to itself%@", v2, v3, v4, v5, v6);
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_13_0(v0) lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] can't save destination zone: %@%@", v4, v5, v6, v7, v8);
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = [(id)OUTLINED_FUNCTION_13_0(v0) lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_4(&dword_1D353B000, v2, v3, "[ERROR] can't save cross zone move state: %@%@", v4, v5, v6, v7, v8);
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_8();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_13_0(v1) lastError];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8_0(&dword_1D353B000, v0, v3, "[CRIT] UNREACHABLE: can't cross move items! %@%@", v4);
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: db.changes == 0%@", v2, v3, v4, v5, v6);
}

void __47__BRCClientZone__crossZoneMoveDocumentsToZone___block_invoke_cold_7()
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 error];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_8_0(&dword_1D353B000, v0, v3, "[CRIT] UNREACHABLE: can't prepare cross move items! %@%@", v4);
}

- (void)_allItemsDidUploadWithError:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] shared iPad: Completed upload for all items for %@%@", (void)v3, DWORD2(v3));
}

- (void)_allItemsDidUploadWithError:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: self._hasAllItemsDidUploadHandlers%@", v2, v3, v4, v5, v6);
}

void __37__BRCClientZone_didGCTombstoneRanks___block_invoke_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 40);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Tombstones with ranks are gone: %@%@", (void)v3, DWORD2(v3));
}

- (void)didApplyTombstoneForRank:.cold.1()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Marking tombstone rank %llu as applied%@");
}

- (void)_registerOperation:(uint64_t)a1 throttler:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Blocking server stitching op %@ until we fetch the initial change token%@", (void)v3, DWORD2(v3));
}

- (void)_registerOperation:throttler:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] The server zone hasn't been created yet so failing the operation right away%@", v2, v3, v4, v5, v6);
}

- (void)_registerOperation:throttler:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] op has priority over the sync down op so cancelling sync down and rescheduling%@", v2, v3, v4, v5, v6);
}

- (void)_registerListOperation:(uint64_t)a1 shareAcceptOperation:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Blocking list on share accept %@%@", (void)v3, DWORD2(v3));
}

- (void)_registerListOperation:shareAcceptOperation:.cold.2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v1 = v0;
  os_log_t v2 = [v0 folderToList];
  long long v3 = [v2 debugItemIDString];
  [v1 nonDiscretionary];
  OUTLINED_FUNCTION_11_0(&dword_1D353B000, v4, v5, "[DEBUG] Starting to list the contents of %@ (%sdiscretionary)%@", v6, v7, v8, v9, 2u);
}

- (void)_registerFetchParentChainOperation:(uint64_t)a1 .cold.1(uint64_t a1)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412546;
  uint64_t v3 = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_8_0(&dword_1D353B000, v1, (uint64_t)v1, "[CRIT] UNREACHABLE: unexpected nil parent itemID from operation %@%@", (uint8_t *)&v2);
}

- (void)_registerFetchParentChainOperation:(uint64_t)a1 .cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Starting to fetch parent chain of %@%@", (void)v3, DWORD2(v3));
}

- (void)_registerLocateRecordOperation:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Starting to locate record for %@%@", (void)v3, DWORD2(v3));
}

- (void)_isSideSyncOperationBlockedWithName:(uint64_t)a1 isWaitingOnShareAccept:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Can't %@ when not activated%@", (void)v3, DWORD2(v3));
}

- (void)_isSideSyncOperationBlockedWithName:(uint64_t)a1 isWaitingOnShareAccept:.cold.2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Can't %@ when sync needs os upgrade%@", (void)v3, DWORD2(v3));
}

- (void)_isSideSyncOperationBlockedWithName:(uint64_t)a1 isWaitingOnShareAccept:.cold.3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Can't %@ when the zone doesn't exist%@", (void)v3, DWORD2(v3));
}

- (void)_isSideSyncOperationBlockedWithName:(uint64_t)a1 isWaitingOnShareAccept:.cold.4(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Can't %@ when resetting%@", (void)v3, DWORD2(v3));
}

- (void)fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: no itemID passed to this list operation%@", v2, v3, v4, v5, v6);
}

- (void)fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:.cold.2()
{
  OUTLINED_FUNCTION_10();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 debugItemIDString];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] Can't list %@ because it had failed previously%@", v4);
}

- (void)fetchDirectoryContentsIfNecessary:(uint64_t)a1 isUserWaiting:rescheduleApplyScheduler:.cold.3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Cancelling operation %@ because it is discretionary and we have non-discretionary work%@", (void)v3, DWORD2(v3));
}

- (void)fetchDirectoryContentsIfNecessary:isUserWaiting:rescheduleApplyScheduler:.cold.4()
{
  OUTLINED_FUNCTION_10();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  os_log_t v2 = [v1 debugItemIDString];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] Can't list changes on %@ when we have already completed full sync%@", v4);
}

- (void)fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: no itemID passed to this recursive list operation%@", v2, v3, v4, v5, v6);
}

- (void)fetchRecursiveDirectoryContentsIfNecessary:isUserWaiting:rescheduleApply:.cold.2()
{
  OUTLINED_FUNCTION_10();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 debugItemIDString];
  OUTLINED_FUNCTION_4_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] Continue to recursive list the contents of %@%@", v4);
}

- (void)fetchRecursiveDirectoryContentsIfNecessary:(void *)a1 isUserWaiting:(uint64_t)a2 rescheduleApply:(uint64_t)a3 .cold.3(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v6, v4, "[DEBUG] Starting to recursive list the contents of %@%@", v5);
}

- (void)fetchRecursiveDirectoryContentsIfNecessary:(void *)a1 isUserWaiting:(uint64_t)a2 rescheduleApply:(uint64_t)a3 .cold.4(void *a1, uint64_t a2, uint64_t a3)
{
  OUTLINED_FUNCTION_7((uint64_t)a1, a2, a3, 5.778e-34);
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v6, v4, "[DEBUG] Forcing %@ to list all changes because we cancelled an old version%@", v5);
}

- (void)fetchRecursiveDirectoryContentsIfNecessary:(uint64_t)a1 isUserWaiting:rescheduleApply:.cold.5(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] We've completed full sync so just recursively rescheduling items under %@%@", (void)v3, DWORD2(v3));
}

- (void)fetchParentChainIfNecessaryWithParentItemID:isUserWaiting:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: no itemID passed to this parent chain%@", v2, v3, v4, v5, v6);
}

- (void)locateRecordIfNecessaryForRecordID:isUserWaiting:maxOperationBackoff:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: no recordID passed to this locate operation%@", v2, v3, v4, v5, v6);
}

- (void)locateRecordIfNecessaryForRecordID:isUserWaiting:maxOperationBackoff:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Can't locate share alias record in a shared zone%@", v2, v3, v4, v5, v6);
}

- (void)fetchRecentAndFavoriteDocuments:.cold.1()
{
  OUTLINED_FUNCTION_11_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Zone doesn't exist so already have recent documents in %@%@", (void)v3, DWORD2(v3));
}

- (void)fetchRecentAndFavoriteDocuments:.cold.2()
{
  OUTLINED_FUNCTION_11_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Already fetched recent and favorite documents in %@%@", (void)v3, DWORD2(v3));
}

- (void)fetchRecentAndFavoriteDocuments:.cold.3()
{
  OUTLINED_FUNCTION_11_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Not fetching recents on a shared zone %@%@", (void)v3, DWORD2(v3));
}

- (void)fetchRecentAndFavoriteDocuments:.cold.4()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Staring to fetch recent documents %@%@", (void)v3, DWORD2(v3));
}

- (void)fetchRecentAndFavoriteDocuments:.cold.5()
{
  OUTLINED_FUNCTION_11_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Not fetching recents on a non-public zone %@%@", (void)v3, DWORD2(v3));
}

- (void)fetchRecentAndFavoriteDocuments:.cold.6()
{
  OUTLINED_FUNCTION_11_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Completed full sync so already have recent documents in %@%@", (void)v3, DWORD2(v3));
}

- (void)fetchRecentAndFavoriteDocuments:(uint64_t)a1 .cold.7(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 216);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] _fetchRecentsOperation %@ is already running, will invoke the operation again after it finishes%@", (void)v3, DWORD2(v3));
}

- (void)fetchRecentAndFavoriteDocuments:.cold.8()
{
  OUTLINED_FUNCTION_11_1(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Already fetching recent documents in %@%@", (void)v3, DWORD2(v3));
}

- (void)fetchRecentAndFavoriteDocuments:.cold.9()
{
  OUTLINED_FUNCTION_10();
  uint8_t v6 = [MEMORY[0x1E4F29060] callStackSymbols];
  OUTLINED_FUNCTION_11_0(&dword_1D353B000, v0, v1, "[DEBUG] Don't fetch recents and favorites before initial sync-down of %@.\n%@%@", v2, v3, v4, v5, 2u);
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┳%llx done waiting for item to be on disk%@", (void)v3, DWORD2(v3));
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_508_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Could not locate lost item %@%@", (void)v3, DWORD2(v3));
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_508_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Lost item %@ is available%@", (void)v3, DWORD2(v3));
}

void __59__BRCClientZone_performBlock_whenItemWithRecordIDIsOnDisk___block_invoke_508_cold_3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Item %@ already available%@", (void)v3, DWORD2(v3));
}

void __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┳%llx done waiting for item to be downloaded%@", (void)v3, DWORD2(v3));
}

void __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_512_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Item %@ already downloaded%@", (void)v3, DWORD2(v3));
}

void __57__BRCClientZone_performBlock_whenItemWithIDIsDownloaded___block_invoke_512_cold_2(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] network is unreachable. Not waiting on download of %@%@", (void)v3, DWORD2(v3));
}

- (void)_shouldFailSyncDownWaitImmediately
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] network is unreachable. Not waiting on sync down of %@%@", (void)v3, DWORD2(v3));
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┳%llx done waiting for sync down to complete on first try%@", (void)v3, DWORD2(v3));
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┳%llx Item failed first try waiting for sync down to complete... Retrying once...%@", (void)v3, DWORD2(v3));
}

void __68__BRCClientZone_performBlock_whenSyncDownCompletesLookingForItemID___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┳%llx done waiting for sync down to complete after retry%@", (void)v3, DWORD2(v3));
}

void __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Item in server items table. We should get at least that item parent id%@", v2, v3, v4, v5, v6);
}

void __71__BRCClientZone_performBlock_whenLocatingCompletesForItemWithRecordID___block_invoke_528_cold_1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v2 = [(id)OUTLINED_FUNCTION_13_0(v1) debugItemIDString];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] network is unreachable, don't try to locate item [%@]%@", v4);
}

void __44__BRCClientZone_networkReachabilityChanged___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┏%llx Cancelling all share acceptance callbacks due to unreachable network%@", (void)v3, DWORD2(v3));
}

- (void)_dumpRecursivePropertiesOfItemByRowID:context:depth:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: pos == ITEM_RECURSIVE_PROPERTIES_FIELDS_COUNT%@", v2, v3, v4, v5, v6);
}

void __72__BRCClientZone_LegacyAdditions___removeItemAndProcessForCrossZoneMove___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: No path to process fsevent on%@", v2, v3, v4, v5, v6);
}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Not downloading item which is shared to me in a CZM'd folder - %@%@");
}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_cold_2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Couldn't find fault which we should have %@%@", v1, 0x16u);
}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_11_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Sync: Finished waiting for download of children under %@%@", (void)v3, DWORD2(v3));
}

void __83__BRCClientZone_LegacyAdditions___startDownloadingItemForCrossZoneMoveIfNecessary___block_invoke_13_cold_1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Sync: Finished waiting for download of %@%@", (void)v3, DWORD2(v3));
}

@end