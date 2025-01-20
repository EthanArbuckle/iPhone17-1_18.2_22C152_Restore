@interface BRCFSReader
- (BOOL)_createSharedZoneIfNecessaryWithLookup:(id)a3;
- (BOOL)_fetchNextLostItemID:(id *)a3 parentID:(id *)a4 appLibraryRowID:(id *)a5 tooManyScans:(BOOL *)a6 stamp:(int64_t *)a7;
- (BOOL)_slowScanDirectoryAtPath:(id)a3;
- (BOOL)canRetryJobWithID:(id)a3;
- (BOOL)canScheduleMoreJobs;
- (BOOL)readUnderCoordinationWithLookup:(id)a3;
- (BOOL)startReadCoordinationInAppLibrary:(id)a3;
- (BOOL)thumbnailChangedForItem:(id)a3 relpath:(id)a4 url:(id)a5 error:(id *)a6;
- (BOOL)updateLookupAfterHandlingPathMatchWithFSRoot:(id *)a3 relpath:(id *)a4;
- (BRCFSReader)initWithAccountSession:(id)a3;
- (OS_dispatch_group)lostScanGroup;
- (brc_task_tracker)taskTracker;
- (char)needsLookupReloadAfterHandlingCrossZoneMoveWithItem:(id)a3 relpath:(id)a4;
- (id)_nextLostItemIDWithBackoff:(int64_t *)a3 appLibrary:(id *)a4 now:(int64_t)a5;
- (id)itemForCreatedDocumentsDirectory:(id)a3 appLibrary:(id)a4 path:(id)a5;
- (id)lookupAndReadItemUnderCoordinationAtURL:(id)a3;
- (unint64_t)_backoffBeforeProcessingLostItemWithStamp:(unint64_t)a3 appLibrary:(id)a4;
- (unint64_t)_readCoordinationCount;
- (unint64_t)recoverAndReportMissingJobs;
- (void)_attemptSchedulingCoordinatedReadForItem:(id)a3 path:(id)a4;
- (void)_cancelScan;
- (void)_close;
- (void)_delayJobID:(id)a3 by:(double)a4;
- (void)_didResolvedDocumentID:(unsigned int)a3 fileID:(unint64_t)a4 zone:(id)a5;
- (void)_finishCurrentRelpathScan;
- (void)_finishedScanWithError:(int)a3;
- (void)_fseventOnDocument:(id)a3 flags:(unsigned int)a4 options:(unint64_t)a5 item:(id)a6 lookup:(id)a7 unresolvedLastPathComponent:(id)a8;
- (void)_lostScanSchedule;
- (void)_processDeadItem:(id)a3;
- (void)_processLostItem:(id)a3;
- (void)_processLostItem:(id)a3 resolvedToPath:(id)a4;
- (void)_recoverFromUnknownParentLoopAtPath:(id)a3;
- (void)_refaultItem:(id)a3 withFaultPath:(id)a4;
- (void)_resolveDocumentID:(unsigned int)a3 zone:(id)a4;
- (void)_scanDirectory:(id)a3 atPath:(id)a4 lookup:(id)a5;
- (void)_scanDone:(id)a3 atPath:(id)a4 lookup:(id)a5;
- (void)_scheduleCoordinatedReadForItem:(id)a3 path:(id)a4;
- (void)_scheduleReadJobWithID:(id)a3;
- (void)_startScanOfRegularAppLibrary:(id)a3;
- (void)_startScanOfRelpath:(id)a3;
- (void)cancel;
- (void)createReadingJobForItem:(id)a3 state:(int)a4;
- (void)dealloc;
- (void)endReadCoordinationInAppLibrary:(id)a3;
- (void)fseventAtPath:(id)a3 flags:(unsigned int)a4;
- (void)fseventAtPath:(id)a3 flags:(unsigned int)a4 options:(unint64_t)a5 unresolvedLastPathComponent:(id)a6;
- (void)fseventAtPath:(id)a3 flags:(unsigned int)a4 unresolvedLastPathComponent:(id)a5;
- (void)fseventOnAlias:(id)a3 flags:(unsigned int)a4 lookup:(id)a5;
- (void)fseventOnContainer:(id)a3 flags:(unsigned int)a4;
- (void)fseventOnDeadPath:(id)a3 item:(id)a4;
- (void)fseventOnDirectory:(id)a3 flags:(unsigned int)a4 lookup:(id)a5;
- (void)fseventOnDocument:(id)a3 flags:(unsigned int)a4 lookup:(id)a5;
- (void)fseventOnDocument:(id)a3 flags:(unsigned int)a4 options:(unint64_t)a5 lookup:(id)a6;
- (void)fseventOnDocument:(id)a3 flags:(unsigned int)a4 options:(unint64_t)a5 lookup:(id)a6 unresolvedLastPathComponent:(id)a7;
- (void)fseventOnRoot:(id)a3 flags:(unsigned int)a4;
- (void)fseventOnSymlink:(id)a3 flags:(unsigned int)a4 lookup:(id)a5;
- (void)fseventOnURL:(id)a3 dbFlags:(unsigned int)a4;
- (void)fseventRecursiveAtRoot:(id)a3 withReason:(id)a4;
- (void)readUnderCoordinationAtURL:(id)a3;
- (void)recoverAndReportMissingJobs;
- (void)reset;
- (void)resume;
- (void)scanContainerDocumentsIfNeeded:(id)a3;
- (void)schedule;
- (void)scheduleAppLibraryForLostScan:(id)a3;
- (void)setState:(int)a3 forItem:(id)a4;
- (void)suspend;
- (void)unscheduleAppLibraryForLostScan:(id)a3;
@end

@implementation BRCFSReader

- (void)createReadingJobForItem:(id)a3 state:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  v7 = [v6 serverZone];
  id v15 = [v7 metadataSyncContext];

  uint64_t v8 = [v6 dbRowID];
  v9 = [v6 serverZone];

  v10 = [v9 dbRowID];
  v11 = [[BRCItemDBRowIDAndZoneJobIdentifier alloc] initWithItemDBRowID:v8 zoneRowID:v10];
  v12 = [v15 readerThrottle];
  [(BRCFSSchedulerBase *)self insertOrUpdateJobID:v11 throttle:v12 withState:v4 insertedSQLColumn:0 insertedSQLValues:0 updatedSQLValues:0 error:0];
  uint64_t v14 = v13;

  if (v4 == 1) {
    [(BRCFSSchedulerBase *)self signalWithDeadline:v14];
  }
}

- (void)setState:(int)a3 forItem:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [v6 dbRowID];
  id v10 = [v6 serverZone];

  uint64_t v8 = [v10 dbRowID];
  v9 = [[BRCItemDBRowIDAndZoneJobIdentifier alloc] initWithItemDBRowID:v7 zoneRowID:v8];
  [(BRCFSSchedulerBase *)self setState:v4 forJobID:v9];
}

- (unint64_t)_readCoordinationCount
{
  v2 = +[BRCUserDefaults defaultsForMangledID:0];
  unint64_t v3 = (int)[v2 readerMaxConcurrentIOs];

  return v3;
}

- (BOOL)canRetryJobWithID:(id)a3
{
  id v4 = a3;
  if (self->_readerCountReachedMax
    && (unint64_t v5 = [(BRCCountedSet *)self->_coordinatedReaders totalCount],
        v5 >= [(BRCFSReader *)self _readCoordinationCount] >> 1))
  {
    BOOL v6 = 0;
  }
  else
  {
    v8.receiver = self;
    v8.super_class = (Class)BRCFSReader;
    BOOL v6 = [(BRCFSSchedulerBase *)&v8 canRetryJobWithID:v4];
  }

  return v6;
}

- (void)_delayJobID:(id)a3 by:(double)a4
{
  id v5 = a3;
  if (!v5)
  {
    id v10 = brc_bread_crumbs();
    v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCFSSchedulerBase canRetryJobWithID:]();
    }
  }
  uint64_t v6 = brc_current_date_nsec();
  uint64_t v7 = brc_interval_to_nsec() + v6;
  objc_super v8 = [(BRCAccountSession *)self->super._session clientDB];
  v9 = [v5 matchingJobsWhereSQLClause];
  [v8 execute:@"UPDATE client_reader_throttle    SET next_retry_stamp = MAX(next_retry_stamp, %lld)  WHERE %@", v7, v9];

  [(BRCFSSchedulerBase *)self signalWithDeadline:v7];
}

- (void)_attemptSchedulingCoordinatedReadForItem:(id)a3 path:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  objc_super v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSReader _attemptSchedulingCoordinatedReadForItem:path:]();
  }

  id v10 = [v6 serverZone];
  uint64_t v11 = [v6 dbRowID];
  v12 = [v6 serverZone];
  uint64_t v13 = [v12 dbRowID];
  uint64_t v14 = [[BRCItemDBRowIDAndZoneJobIdentifier alloc] initWithItemDBRowID:v11 zoneRowID:v13];

  if ([(BRCFSReader *)self canRetryJobWithID:v14])
  {
    [(BRCFSReader *)self _scheduleCoordinatedReadForItem:v6 path:v7];
    id v15 = [v10 metadataSyncContext];
    v16 = [v15 readerThrottle];
    [(BRCFSSchedulerBase *)self postponeJobID:v14 withThrottle:v16];
  }
}

- (void)_scheduleCoordinatedReadForItem:(id)a3 path:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_super v8 = [v6 appLibrary];
  v9 = [v8 coordinatorForItem:v7 forRead:1];

  id v10 = [v7 st];

  uint64_t v11 = [v10 logicalName];
  v12 = [v6 logicalURLWithLogicalName:v11];

  uint64_t v13 = [(BRCAccountSession *)self->super._session clientTruthWorkloop];
  taskTracker = self->_taskTracker;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = __52__BRCFSReader__scheduleCoordinatedReadForItem_path___block_invoke;
  v15[3] = &unk_1E6999CF0;
  v15[4] = self;
  [v9 scheduleReadOfItemAtURL:v12 queue:v13 taskTracker:taskTracker accessor:v15];
}

void __52__BRCFSReader__scheduleCoordinatedReadForItem_path___block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(*(void *)(a1 + 32) + 8);
  id v3 = a2;
  id v4 = [v2 fsReader];
  [v4 readUnderCoordinationAtURL:v3];
}

- (BOOL)canScheduleMoreJobs
{
  return !self->_readerCountReachedMax;
}

- (void)schedule
{
  id v3 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v4 = [v3 readerScanBatchSize];

  id v5 = objc_msgSend(MEMORY[0x1E4FBA908], "rawInjection:length:", "throttle_id, zone_rowid", 23);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __23__BRCFSReader_schedule__block_invoke;
  v6[3] = &unk_1E6996268;
  v6[4] = self;
  [(BRCFSSchedulerBase *)self scheduleWithBatchSize:v4 whereSQLClause:0 columns:v5 actionHandler:v6];
}

void __23__BRCFSReader_schedule__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  uint64_t v6 = [v5 longLongAtIndex:a3];
  id v8 = [v5 numberAtIndex:(a3 + 1)];

  id v7 = [[BRCItemDBRowIDAndZoneJobIdentifier alloc] initWithItemDBRowID:v6 zoneRowID:v8];
  [*(id *)(a1 + 32) _scheduleReadJobWithID:v7];
}

- (void)_scheduleReadJobWithID:(id)a3
{
  id v4 = a3;
  session = self->super._session;
  uint64_t v6 = [v4 zoneRowID];
  id v7 = [(BRCAccountSession *)session serverZoneByRowID:v6];

  id v8 = [v7 clientZone];
  v9 = objc_msgSend(v8, "itemByRowID:", objc_msgSend(v4, "itemDBRowID"));
  id v10 = v9;
  if (v9)
  {
    if ([v9 needsReading])
    {
      if (![v10 isLost])
      {
        v17 = [(BRCAccountSession *)self->super._session clientDB];
        v18[0] = MEMORY[0x1E4F143A8];
        v18[1] = 3221225472;
        v18[2] = __38__BRCFSReader__scheduleReadJobWithID___block_invoke;
        v18[3] = &unk_1E6998B80;
        id v19 = v10;
        v20 = self;
        id v21 = v4;
        id v22 = v7;
        id v23 = v8;
        [v17 groupInBatch:v18];

        goto LABEL_13;
      }
      uint64_t v11 = brc_bread_crumbs();
      v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSReader _scheduleReadJobWithID:]();
      }

      uint64_t v13 = self;
      uint64_t v14 = 10;
    }
    else
    {
      id v15 = brc_bread_crumbs();
      v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BRCFSReader _scheduleReadJobWithID:]();
      }

      uint64_t v13 = self;
      uint64_t v14 = 0;
    }
    [(BRCFSSchedulerBase *)v13 setState:v14 forJobID:v4];
  }
  else
  {
    [(BRCFSSchedulerBase *)self deleteJobsMatching:v4];
  }
LABEL_13:
}

void __38__BRCFSReader__scheduleReadJobWithID___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  v2 = [[BRCItemToPathLookup alloc] initWithItem:*(void *)(a1 + 32)];
  id v3 = [(BRCItemToPathLookup *)v2 byFileSystemID];
  id v4 = *(void **)(a1 + 40);
  uint64_t v5 = *(void *)(a1 + 48);
  uint64_t v6 = [*(id *)(a1 + 56) metadataSyncContext];
  id v7 = [v6 readerThrottle];
  [v4 postponeJobID:v5 withThrottle:v7];

  if ([*(id *)(a1 + 32) isDocument])
  {
    if (!v3) {
      goto LABEL_8;
    }
  }
  else
  {
    id v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      __38__BRCFSReader__scheduleReadJobWithID___block_invoke_cold_1();
    }

    if (!v3) {
      goto LABEL_8;
    }
  }
  if ([v3 exists])
  {
    [*(id *)(a1 + 40) _scheduleCoordinatedReadForItem:*(void *)(a1 + 32) path:v3];
    goto LABEL_11;
  }
LABEL_8:
  id v10 = brc_bread_crumbs();
  uint64_t v11 = brc_default_log();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = *(void *)(a1 + 64);
    uint64_t v13 = *(void *)(a1 + 32);
    int v14 = 138412802;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    uint64_t v17 = v13;
    __int16 v18 = 2112;
    id v19 = v10;
    _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] Reader: %@: marking unresolvable item as lost: %@%@", (uint8_t *)&v14, 0x20u);
  }

  [*(id *)(a1 + 32) markLostClearGenerationID:0 backoffMode:0];
  [*(id *)(a1 + 32) saveToDB];
LABEL_11:
  [(BRCItemToPathLookup *)v2 closePaths];
}

- (BOOL)startReadCoordinationInAppLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSession *)self->super._session clientDB];
  [v5 assertOnQueue];

  if (self->_readerCountReachedMax)
  {
LABEL_7:
    BOOL v7 = 0;
    goto LABEL_8;
  }
  unint64_t v6 = [(BRCCountedSet *)self->_coordinatedReaders totalCount];
  if (v6 >= [(BRCFSReader *)self _readCoordinationCount])
  {
    id v8 = brc_bread_crumbs();
    v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSReader startReadCoordinationInAppLibrary:]();
    }

    self->_readerCountReachedMax = 1;
    [(BRCFSReader *)self suspend];
    goto LABEL_7;
  }
  [(BRCCountedSet *)self->_coordinatedReaders addObject:v4];
  BOOL v7 = 1;
LABEL_8:

  return v7;
}

- (void)endReadCoordinationInAppLibrary:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSession *)self->super._session clientDB];
  [v5 assertOnQueue];

  p_coordinatedReaders = &self->_coordinatedReaders;
  if (([(BRCCountedSet *)self->_coordinatedReaders containsObject:v4] & 1) == 0)
  {
    id v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader endReadCoordinationInAppLibrary:]();
    }
  }
  [(BRCCountedSet *)*p_coordinatedReaders removeObject:v4];
  if (self->_readerCountReachedMax)
  {
    unint64_t v7 = [(BRCCountedSet *)*p_coordinatedReaders totalCount];
    if (v7 < [(BRCFSReader *)self _readCoordinationCount] >> 1)
    {
      id v8 = brc_bread_crumbs();
      v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSReader endReadCoordinationInAppLibrary:]();
      }

      self->_readerCountReachedMax = 0;
      [(BRCFSReader *)self resume];
    }
  }
}

- (BOOL)readUnderCoordinationWithLookup:(id)a3
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 matchLookupItemsWithDisk];
  uint64_t v5 = [v4 byPathRelpath];
  int v6 = [v5 exists];
  if ((v6 & 1) == 0)
  {
    uint64_t v7 = [v4 faultedRelpath];

    uint64_t v5 = (void *)v7;
  }
  if (![v5 exists] || (objc_msgSend(v5, "isDocument") & 1) == 0)
  {
    id v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
      [(BRCFSReader *)v4 readUnderCoordinationWithLookup:v11];
    }

    uint64_t v12 = [v4 faultedLocalItem];
    if ([v12 needsReading])
    {
      uint64_t v13 = brc_bread_crumbs();
      int v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v41 = (uint64_t)v13;
        _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Fault is marked needs-read, odd, let fix it up%@", buf, 0xCu);
      }

      [v12 markNeedsUploadOrSyncingUp];
      [v12 saveToDB];
    }
    uint64_t v15 = [v4 byPathLocalItem];

    if (([v5 exists] & 1) == 0 && objc_msgSend(v15, "isLive"))
    {
      __int16 v16 = brc_bread_crumbs();
      uint64_t v17 = brc_default_log();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSReader readUnderCoordinationWithLookup:].cold.8();
      }

      [v15 markLostWhenReplacedByItem:0];
      [v15 saveToDB];
    }
    goto LABEL_37;
  }
  if (![v5 isInPackage])
  {
    if (v6) {
      [v4 byPathLocalItem];
    }
    else {
    __int16 v18 = [v4 faultedLocalItem];
    }
    uint64_t v15 = v18;
    if (!v18)
    {
      id v8 = brc_bread_crumbs();
      v9 = brc_default_log();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSReader readUnderCoordinationWithLookup:]();
      }
      goto LABEL_36;
    }
    if (([v18 isLive] & 1) == 0)
    {
      v27 = brc_bread_crumbs();
      v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSReader readUnderCoordinationWithLookup:].cold.7();
      }

      goto LABEL_37;
    }
    if (([v15 isDocument] & 1) == 0)
    {
      v29 = brc_bread_crumbs();
      v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v41 = (uint64_t)v5;
        __int16 v42 = 2112;
        v43 = v15;
        __int16 v44 = 2112;
        v45 = v29;
        _os_log_debug_impl(&dword_1D353B000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] alias/directory <-> document conflict:\n  path: %@\n  item: %@%@", buf, 0x20u);
      }

      [v15 markLostClearGenerationID:0 backoffMode:1];
      [v15 saveToDB];
      goto LABEL_37;
    }
    memset(v39, 0, sizeof(v39));
    __brc_create_section(0, (uint64_t)"-[BRCFSReader readUnderCoordinationWithLookup:]", 553, v39);
    id v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218754;
      uint64_t v41 = v39[0];
      __int16 v42 = 2112;
      v43 = v15;
      __int16 v44 = 2112;
      v45 = v5;
      __int16 v46 = 2112;
      v47 = v19;
      _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx reading %@ at %@%@", buf, 0x2Au);
    }

    if ([v15 changedAtRelativePath:v5 scanPackage:1])
    {
      id v21 = brc_bread_crumbs();
      id v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSReader readUnderCoordinationWithLookup:].cold.4();
      }

      if (![v5 isBusy])
      {
        id v23 = [v5 appLibrary];
        v24 = [v23 db];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __47__BRCFSReader_readUnderCoordinationWithLookup___block_invoke;
        v36[3] = &unk_1E6993A88;
        id v37 = v5;
        id v38 = v15;
        char v25 = [v24 groupInTransaction:v36];

LABEL_54:
        goto LABEL_55;
      }
      [(BRCFSReader *)self setState:11 forItem:v15];
      id v23 = brc_bread_crumbs();
      v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSReader readUnderCoordinationWithLookup:]();
      }
    }
    else
    {
      v31 = brc_bread_crumbs();
      v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSReader readUnderCoordinationWithLookup:].cold.6();
      }

      v33 = [v4 parentItem];
      v34 = [v33 itemGlobalID];
      char v35 = [v15 updateLocationAndMetaFromFSAtPath:v5 parentGlobalID:v34];

      if (v35)
      {
        [v15 markNeedsUploadOrSyncingUp];
        char v25 = [v15 saveToDB];
LABEL_55:
        __brc_leave_section(v39);
        goto LABEL_38;
      }
      if (![v15 isDocument])
      {
        char v25 = 0;
        goto LABEL_55;
      }
      id v23 = brc_bread_crumbs();
      v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_FAULT)) {
        -[BRCFSReader readUnderCoordinationWithLookup:].cold.5();
      }
    }
    char v25 = 0;
    goto LABEL_54;
  }
  id v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
    -[BRCFSReader readUnderCoordinationWithLookup:]();
  }
LABEL_36:

  uint64_t v15 = 0;
LABEL_37:
  char v25 = 1;
LABEL_38:

  return v25;
}

uint64_t __47__BRCFSReader_readUnderCoordinationWithLookup___block_invoke(uint64_t a1)
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (([*(id *)(a1 + 32) isPackageRoot] & 1) == 0)
  {
    v2 = [*(id *)(a1 + 40) asDocument];
    id v3 = [v2 currentVersion];
    int v4 = [v3 isPackage];

    if (!v4)
    {
      id v7 = 0;
      goto LABEL_8;
    }
  }
  uint64_t v5 = *(void *)(a1 + 32);
  id v13 = 0;
  BOOL v6 = +[BRCPackageItem updateSnapshotAtPath:v5 error:&v13];
  id v7 = v13;
  if (v6)
  {
LABEL_8:
    [*(id *)(a1 + 40) updateFromFSAtPath:*(void *)(a1 + 32)];
    [*(id *)(a1 + 40) markNeedsUploadOrSyncingUp];
    uint64_t v10 = [*(id *)(a1 + 40) saveToDB];
    goto LABEL_9;
  }
  id v8 = brc_bread_crumbs();
  v9 = brc_default_log();
  if (os_log_type_enabled(v9, (os_log_type_t)0x90u))
  {
    uint64_t v12 = *(void *)(a1 + 32);
    *(_DWORD *)buf = 138412802;
    uint64_t v15 = v12;
    __int16 v16 = 2112;
    id v17 = v7;
    __int16 v18 = 2112;
    id v19 = v8;
    _os_log_error_impl(&dword_1D353B000, v9, (os_log_type_t)0x90u, "[ERROR] could not update package at %@: %@%@", buf, 0x20u);
  }

  uint64_t v10 = 0;
LABEL_9:

  return v10;
}

- (id)lookupAndReadItemUnderCoordinationAtURL:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(BRCAccountSession *)self->super._session clientDB];
  char v6 = [v5 isBatchSuspended];

  if ((v6 & 1) == 0)
  {
    uint64_t v15 = brc_bread_crumbs();
    __int16 v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader lookupAndReadItemUnderCoordinationAtURL:]();
    }
  }
  id v7 = [[BRCURLToItemLookup alloc] initWithURL:v4 allowAppLibraryRoot:1 session:self->super._session];
  id v17 = 0;
  BOOL v8 = [(BRCURLToItemLookup *)v7 resolveAndKeepOpenWithError:&v17];
  id v9 = v17;
  if (v8)
  {
    if ([(BRCFSReader *)self readUnderCoordinationWithLookup:v7])
    {
      [(BRCURLToItemLookup *)v7 refreshByPathDiffs];
      [(BRCURLToItemLookup *)v7 refreshFaultedDiffs];
      uint64_t v10 = v7;
      goto LABEL_10;
    }
    [(BRCURLToItemLookup *)v7 closePaths];
  }
  else
  {
    uint64_t v11 = brc_bread_crumbs();
    uint64_t v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v4 path];
      *(_DWORD *)buf = 138412802;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v11;
      _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] can't resolve parent of '%@': %@%@", buf, 0x20u);
    }
  }
  uint64_t v10 = 0;
LABEL_10:

  return v10;
}

- (void)readUnderCoordinationAtURL:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v13, 0, sizeof(v13));
  __brc_create_section(0, (uint64_t)"-[BRCFSReader readUnderCoordinationAtURL:]", 631, v13);
  uint64_t v5 = brc_bread_crumbs();
  char v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v9 = v13[0];
    uint64_t v10 = [v4 path];
    *(_DWORD *)buf = 134218498;
    uint64_t v15 = v9;
    __int16 v16 = 2112;
    id v17 = v10;
    __int16 v18 = 2112;
    id v19 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx acquired coordination for (reading)\n  at '%@'%@", buf, 0x20u);
  }
  id v7 = [(BRCAccountSession *)self->super._session clientDB];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__BRCFSReader_readUnderCoordinationAtURL___block_invoke;
  v11[3] = &unk_1E6995AD0;
  v11[4] = self;
  id v8 = v4;
  id v12 = v8;
  [v7 groupInBatch:v11];

  __brc_leave_section(v13);
}

void __42__BRCFSReader_readUnderCoordinationAtURL___block_invoke(uint64_t a1)
{
  id v1 = [*(id *)(a1 + 32) lookupAndReadItemUnderCoordinationAtURL:*(void *)(a1 + 40)];
  [v1 closePaths];
}

- (char)needsLookupReloadAfterHandlingCrossZoneMoveWithItem:(id)a3 relpath:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!v5)
  {
    char v7 = 1;
    goto LABEL_23;
  }
  if (([v5 isAlmostDead] & 1) == 0)
  {
    id v8 = [v5 clientZone];
    uint64_t v9 = +[BRCPathToItemLookup lookupForRelativePath:v6];
    uint64_t v10 = [v9 clientZone];
    if ([v5 isSharedToMeTopLevelItem])
    {
      uint64_t v11 = [v9 parentItem];
      id v12 = [v11 clientZone];
      char v13 = [v12 isSharedZone];

      if ((v13 & 1) == 0)
      {
LABEL_7:
        if (![v5 isSharedToMeChildItem])
        {
LABEL_20:
          char v7 = 1;
          goto LABEL_22;
        }
        v28 = v8;
        int v14 = [v9 parentItem];
        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v5);
        __int16 v16 = objc_msgSend(MEMORY[0x1E4F1A2F8], "brc_fetchShareIDWithSharedItem:", v14);
        if (v16)
        {
          id v17 = [v15 recordName];
          __int16 v18 = [v16 recordName];
          char v19 = [v17 isEqualToString:v18];

          if (v19)
          {

            char v7 = 1;
            id v8 = v28;
LABEL_22:

            goto LABEL_23;
          }
        }
        uint64_t v20 = brc_bread_crumbs();
        id v21 = brc_default_log();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412802;
          v30 = v15;
          __int16 v31 = 2112;
          v32 = v16;
          __int16 v33 = 2112;
          v34 = v20;
          _os_log_impl(&dword_1D353B000, v21, OS_LOG_TYPE_DEFAULT, "[WARNING] This is a cross share move from %@ to %@%@", buf, 0x20u);
        }

        id v8 = v28;
LABEL_17:

        if (![v5 isDocument]
          || ([v5 asDocument],
              __int16 v22 = objc_claimAutoreleasedReturnValue(),
              int v23 = [v22 supportsServerSideAssetCopies],
              v22,
              !v23))
        {
          v26 = [v5 clientZone];
          [v26 itemCrossZoneMoved:v5 withLookup:v9];

          [v5 markLostWhenReplacedByItem:0];
          [v5 saveToDB];
          char v7 = 4;
          goto LABEL_22;
        }
        uint64_t v24 = [v5 asDocument];
        char v25 = [v9 parentItem];
        [v24 markCrossZoneMovedForServerAssetCopyWithParentItem:v25 path:v6];

        goto LABEL_20;
      }
    }
    else if (v8 == v10)
    {
      goto LABEL_7;
    }
    int v14 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412802;
      v30 = v8;
      __int16 v31 = 2112;
      v32 = v10;
      __int16 v33 = 2112;
      v34 = v14;
      _os_log_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEFAULT, "[WARNING] This is a cross zone move from %@ to %@%@", buf, 0x20u);
    }
    goto LABEL_17;
  }
  char v7 = 2;
LABEL_23:

  return v7;
}

- (BOOL)updateLookupAfterHandlingPathMatchWithFSRoot:(id *)a3 relpath:(id *)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = *a3;
  id v8 = [v7 byPath];
  uint64_t v9 = [v7 relpathOfItem];
  if (([v8 isFSRoot] & 1) == 0 && objc_msgSend(v9, "type") != 4
    || [v9 type] == 3)
  {
    goto LABEL_4;
  }
  uint64_t v11 = [v7 relpathOfItem];
  int v12 = [v11 isDocument];

  if (v12)
  {
    char v13 = brc_bread_crumbs();
    int v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSReader updateLookupAfterHandlingPathMatchWithFSRoot:relpath:]();
    }
    goto LABEL_11;
  }
  uint64_t v15 = [v7 byFileID];

  if (v15 != v8)
  {
    char v13 = brc_bread_crumbs();
    int v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSReader updateLookupAfterHandlingPathMatchWithFSRoot:relpath:]();
    }
LABEL_11:

    *a3 = 0;
    *a4 = 0;
    __int16 v16 = [v7 relpathOfItem];
    int v30 = 0;
    id v17 = brc_bread_crumbs();
    __int16 v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      char v19 = [v7 relpathOfItem];
      *(_DWORD *)buf = 138412546;
      v32 = v19;
      __int16 v33 = 2112;
      v34 = v17;
      _os_log_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEFAULT, "[WARNING] we need to bounce path at %@ because there is a FS root clashing%@", buf, 0x16u);
    }
    uint64_t v20 = [(BRCAccountSession(LegacyAdditions) *)self->super._session fsWriter];
    id v21 = [v20 bouncePath:v16 forItemConflictingWithAnFSRoot:v8];

    if (![v21 resolveAndKeepOpenMustExist:1 error:&v30])
    {
      uint64_t v24 = brc_bread_crumbs();
      char v25 = brc_default_log();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        v32 = v16;
        __int16 v33 = 2112;
        v34 = v8;
        __int16 v35 = 1024;
        int v36 = v30;
        __int16 v37 = 2112;
        id v38 = v24;
        _os_log_debug_impl(&dword_1D353B000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] can't bounce %@ to avoid clash with fs-root %@ %{errno}d%@", buf, 0x26u);
      }

      id v22 = v7;
      goto LABEL_23;
    }
    id v22 = +[BRCPathToItemLookup lookupForRelativePath:v21];

    [v21 close];
    int v23 = [v22 byFileID];
    if (v23)
    {
    }
    else
    {
      v26 = [v22 byPath];

      if (!v26)
      {
        [(BRCAccountSession *)self->super._session recreateDesktopSymlinksIfNecessary];
        id v22 = v22;
        *a3 = v22;
        *a4 = v21;
LABEL_23:

        BOOL v10 = 1;
        id v7 = v22;
        goto LABEL_24;
      }
    }
    v27 = brc_bread_crumbs();
    v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader updateLookupAfterHandlingPathMatchWithFSRoot:relpath:]();
    }

    goto LABEL_23;
  }
LABEL_4:
  BOOL v10 = 0;
LABEL_24:

  return v10;
}

- (void)fseventAtPath:(id)a3 flags:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  id v7 = [v6 filename];
  [(BRCFSReader *)self fseventAtPath:v6 flags:v4 unresolvedLastPathComponent:v7];
}

- (void)fseventAtPath:(id)a3 flags:(unsigned int)a4 unresolvedLastPathComponent:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  if (!v8)
  {
    BOOL v10 = brc_bread_crumbs();
    uint64_t v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader fseventAtPath:flags:unresolvedLastPathComponent:]();
    }
  }
  [(BRCFSReader *)self fseventAtPath:v8 flags:v6 options:0 unresolvedLastPathComponent:v9];
}

- (void)fseventAtPath:(id)a3 flags:(unsigned int)a4 options:(unint64_t)a5 unresolvedLastPathComponent:(id)a6
{
  uint64_t v8 = *(void *)&a4;
  id v10 = a3;
  id v11 = a6;
  if (!v10)
  {
    __int16 v35 = brc_bread_crumbs();
    int v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader fseventAtPath:flags:unresolvedLastPathComponent:]();
    }
  }
  int v12 = [v10 appLibrary];
  int v13 = [v10 type];
  int v14 = [(BRCAccountSession *)self->super._session clientDB];
  char v15 = [v14 isBatchSuspended];

  if ((v15 & 1) == 0)
  {
    __int16 v37 = brc_bread_crumbs();
    id v38 = brc_default_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader lookupAndReadItemUnderCoordinationAtURL:]();
    }
  }
  if (v13 == 1)
  {
    [(BRCFSReader *)self fseventOnRoot:v10 flags:v8];
    goto LABEL_40;
  }
  if (!v12)
  {
    __int16 v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSReader fseventAtPath:flags:options:unresolvedLastPathComponent:]();
    }
    goto LABEL_15;
  }
  if (v13 != 2)
  {
    uint64_t v18 = [v12 deepScanStamp];
    if (v18)
    {
      char v19 = (void *)v18;
      uint64_t v20 = [(BRCAsyncDirectoryEnumerator *)self->_currentScan rootPath];
      id v21 = [v20 appLibrary];

      if (v12 != v21)
      {
        __int16 v16 = brc_bread_crumbs();
        id v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSReader fseventAtPath:flags:options:unresolvedLastPathComponent:].cold.5();
        }
LABEL_15:

        goto LABEL_40;
      }
    }
    id v22 = +[BRCPathToItemLookup lookupForRelativePath:v10];
    int v23 = [v22 relpathOfItem];
    if ([v23 exists])
    {
      uint64_t v24 = [v22 parentItem];

      if (v24)
      {
        state.opaque[0] = 0;
        state.opaque[1] = 0;
        uint64_t v41 = _os_activity_create(&dword_1D353B000, "fsevent", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
        os_activity_scope_enter(v41, &state);
        if (!((a5 >> 1) & 1 | ([v23 isDocument] ^ 1) & 1))
        {
          char v25 = [(BRCAccountSession *)self->super._session analyticsReporter];
          objc_msgSend(v25, "createFSEventToSyncUpEventForFileID:genID:", objc_msgSend(v23, "fileID"), objc_msgSend(v23, "fsGenerationID"));
        }
        id v42 = v23;
        id v43 = v22;
        BOOL v26 = [(BRCFSReader *)self updateLookupAfterHandlingPathMatchWithFSRoot:&v43 relpath:&v42];
        id v27 = v43;

        id v28 = v42;
        if (v26)
        {
          id v29 = v28;

          uint64_t v30 = [v29 filename];

          id v10 = v29;
          id v11 = (id)v30;
        }
        if (v27)
        {
          if ([v28 isSymLink])
          {
            [(BRCFSReader *)self fseventOnSymlink:v28 flags:v8 lookup:v27];
          }
          else if ([v28 isBRAlias])
          {
            [(BRCFSReader *)self fseventOnAlias:v28 flags:v8 lookup:v27];
          }
          else if ([v28 isDocument])
          {
            [(BRCFSReader *)self fseventOnDocument:v10 flags:v8 options:a5 lookup:v27 unresolvedLastPathComponent:v11];
          }
          else
          {
            [(BRCFSReader *)self fseventOnDirectory:v28 flags:v8 lookup:v27];
          }
        }
        else
        {
          __int16 v33 = brc_bread_crumbs();
          v34 = brc_default_log();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG)) {
            -[BRCFSReader fseventAtPath:flags:options:unresolvedLastPathComponent:].cold.4();
          }
        }
        os_activity_scope_leave(&state);
        __int16 v31 = v41;
        goto LABEL_39;
      }
      __int16 v31 = brc_bread_crumbs();
      v32 = brc_default_log();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSReader fseventAtPath:flags:options:unresolvedLastPathComponent:]();
      }
    }
    else
    {
      __int16 v31 = [v22 byPath];
      [(BRCFSReader *)self fseventOnDeadPath:v23 item:v31];
    }
    id v27 = v22;
    id v28 = v23;
LABEL_39:

    id v10 = v28;
    goto LABEL_40;
  }
  if ([v12 isiCloudDesktopAppLibrary])
  {
    uint64_t v39 = brc_bread_crumbs();
    v40 = brc_default_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader fseventAtPath:flags:options:unresolvedLastPathComponent:]();
    }
  }
  [(BRCFSReader *)self fseventOnContainer:v10 flags:v8];
LABEL_40:
}

- (void)fseventRecursiveAtRoot:(id)a3 withReason:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 type] != 1 && objc_msgSend(v6, "type") != 3)
  {
    id v11 = brc_bread_crumbs();
    int v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader fseventRecursiveAtRoot:withReason:]();
    }
  }
  if ([v6 exists])
  {
    if (self->_currentScan) {
      [(BRCFSReader *)self _cancelScan];
    }
    session = self->super._session;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = __49__BRCFSReader_fseventRecursiveAtRoot_withReason___block_invoke;
    uint64_t v13[3] = &unk_1E6994388;
    id v14 = v7;
    [(BRCAccountSession *)session enumerateAppLibraries:v13];
    id v9 = v14;
  }
  else
  {
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader fseventRecursiveAtRoot:withReason:]();
    }
  }
}

uint64_t __49__BRCFSReader_fseventRecursiveAtRoot_withReason___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (void)fseventOnRoot:(id)a3 flags:(unsigned int)a4
{
  if ((a4 & 0xB01) != 0) {
    [(BRCFSReader *)self fseventRecursiveAtRoot:a3 withReason:@"fsevent on root"];
  }
}

- (void)fseventOnContainer:(id)a3 flags:(unsigned int)a4
{
  __int16 v4 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [v6 appLibrary];
  if ([v6 exists])
  {
    uint64_t v8 = [v6 fileID];
    id v9 = [v7 fileID];
    uint64_t v10 = [v9 unsignedIntegerValue];

    if ((v4 & 0xB01) != 0 || v8 != v10)
    {
      currentScan = self->_currentScan;
      if (currentScan)
      {
        int v12 = [(BRCAsyncDirectoryEnumerator *)currentScan rootPath];
        int v13 = [v12 appLibrary];

        if (v13 == v7) {
          [(BRCFSReader *)self _cancelScan];
        }
      }
      id v14 = brc_bread_crumbs();
      char v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSReader fseventOnContainer:flags:]();
      }

      [v7 scheduleDeepScanWithReason:@"fs-event on container"];
    }
  }
  else
  {
    __int16 v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT))
    {
      char v19 = prettyprintFSEventFlags();
      int v20 = 138412802;
      id v21 = v7;
      __int16 v22 = 2112;
      int v23 = v19;
      __int16 v24 = 2112;
      char v25 = v16;
      _os_log_fault_impl(&dword_1D353B000, v17, OS_LOG_TYPE_FAULT, "[CRIT] reset needed for %@ because it was deleted on disk %@%@", (uint8_t *)&v20, 0x20u);
    }
    uint64_t v18 = [v7 defaultClientZone];
    [v18 scheduleResetServerAndClientTruthsForReason:@"fsevent.no-root"];
  }
}

- (void)fseventOnDeadPath:(id)a3 item:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v7 isLive])
  {
    [v7 markLostWhenReplacedByItem:0];
    [v7 saveToDB];
  }
  else if (self->_currentScan)
  {
    if ([v7 isDirectory])
    {
      uint64_t v8 = [(BRCAsyncDirectoryEnumerator *)self->_currentScan rootPath];
      uint64_t v9 = [v8 fileID];
      uint64_t v10 = [v7 st];
      id v11 = [v10 fileID];
      uint64_t v12 = [v11 longLongValue];

      if (v9 == v12)
      {
        int v13 = brc_bread_crumbs();
        id v14 = brc_default_log();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
        {
          int v15 = 138412546;
          id v16 = v7;
          __int16 v17 = 2112;
          uint64_t v18 = v13;
          _os_log_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEFAULT, "[WARNING] Cancelling scan of %@ because it was removed while we were scanning%@", (uint8_t *)&v15, 0x16u);
        }

        [(BRCFSReader *)self _cancelScan];
      }
    }
  }
  if ([(BRCAccountSession *)self->super._session shouldPathBeDesktopSymlink:v6]) {
    [(BRCAccountSession *)self->super._session recreateDesktopSymlinksIfNecessary];
  }
}

- (BOOL)_createSharedZoneIfNecessaryWithLookup:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 relpathOfItem];
  id v6 = [v5 sharedItemBookmark];
  id v20 = 0;
  id v7 = [v5 session];
  int v8 = [v6 parseBookmarkDataWithAccountSession:v7 docID:0 itemID:0 mangledID:&v20 unsaltedBookmarkData:0 error:0];

  if (v8)
  {
    uint64_t v9 = [(BRCAccountSession *)self->super._session clientZoneByMangledID:v20];
    if (v9)
    {
      BOOL v10 = 0;
    }
    else
    {
      id v11 = brc_bread_crumbs();
      uint64_t v12 = brc_default_log();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        id v22 = v20;
        __int16 v23 = 2112;
        __int16 v24 = v11;
        _os_log_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEFAULT, "[WARNING] Can't find client zone for %@. Asynchronously creating it%@", buf, 0x16u);
      }

      int v13 = [(BRCAccountSession *)self->super._session resetQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = __54__BRCFSReader__createSharedZoneIfNecessaryWithLookup___block_invoke;
      block[3] = &unk_1E6993628;
      id v18 = v5;
      id v19 = v20;
      dispatch_async(v13, block);

      id v14 = [v4 parentItem];
      if ([v14 isFSRoot])
      {
        int v15 = [v14 appLibrary];
        [v15 scheduleDeepScanWithReason:@"needs lost parent"];
      }
      else
      {
        [v14 markLostClearGenerationID:1 backoffMode:2];
        [v14 saveToDB];
      }
      if (self->_currentScan) {
        [(BRCFSReader *)self _cancelScan];
      }

      BOOL v10 = 1;
      uint64_t v9 = v18;
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

void __54__BRCFSReader__createSharedZoneIfNecessaryWithLookup___block_invoke(uint64_t a1)
{
  id v3 = [*(id *)(a1 + 32) session];
  id v2 = (id)[v3 getOrCreateSharedZones:*(void *)(a1 + 40)];
}

- (void)fseventOnSymlink:(id)a3 flags:(unsigned int)a4 lookup:(id)a5
{
  v44[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = [v8 byFileIDGlobally];
  int v10 = [(BRCFSReader *)self needsLookupReloadAfterHandlingCrossZoneMoveWithItem:v9 relpath:v7];
  if (v10 != 4)
  {
    if (v10 == 2)
    {

      id v11 = [v8 byFileID];

      if (!v11)
      {
        id v9 = 0;
        goto LABEL_7;
      }
      __int16 v35 = brc_bread_crumbs();
      int v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
        -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.5();
      }
      id v9 = 0;
    }
    else
    {
      if (!v9 || ([v9 isOnDisk] & 1) != 0) {
        goto LABEL_7;
      }
      __int16 v35 = brc_bread_crumbs();
      int v36 = brc_default_log();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
        -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.4();
      }
    }

LABEL_7:
    int v12 = [v9 isSymLink];
    if (v12) {
      id v13 = 0;
    }
    else {
      id v13 = v9;
    }
    if (!v12) {
      id v9 = 0;
    }
    id v14 = [v8 byPath];
    id v15 = v14;
    if (v9 || !v14)
    {
LABEL_22:
      session = self->super._session;
      __int16 v24 = [v8 relpathOfItem];
      LODWORD(session) = [(BRCAccountSession *)session shouldPathBeDesktopSymlink:v24];

      if (session)
      {
        uint64_t v25 = brc_bread_crumbs();
        uint64_t v26 = brc_default_log();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSReader fseventOnSymlink:flags:lookup:]();
        }
      }
      else
      {
        if (v9)
        {
          id v27 = [v8 parentItem];
          id v28 = [v27 itemGlobalID];
          char v29 = [v9 updateFromFSAtPath:v7 parentGlobalID:v28];

          if ((v29 & 1) == 0)
          {
            [(BRCFSReader *)self reset];
LABEL_40:

            goto LABEL_41;
          }
        }
        else
        {
          uint64_t v30 = [v8 relpathOfItem];
          __int16 v31 = [v8 parentItem];
          v32 = [v31 itemGlobalID];
          id v9 = +[BRCLocalItem newItemWithPath:v30 parentGlobalID:v32];

          __int16 v33 = brc_bread_crumbs();
          v34 = brc_default_log();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
          {
            int v39 = 138412802;
            id v40 = v9;
            __int16 v41 = 2112;
            id v42 = v7;
            __int16 v43 = 2112;
            v44[0] = v33;
            _os_log_debug_impl(&dword_1D353B000, v34, OS_LOG_TYPE_DEBUG, "[DEBUG] creating new symlink %@ at %@%@", (uint8_t *)&v39, 0x20u);
          }
        }
        uint64_t v25 = [v9 asSymlink];
        if (v15 && v15 != v9)
        {
          [v15 markLostWhenReplacedByItem:v9];
          [v15 saveToDB];
        }
        if (v13)
        {
          if (v13 == v9)
          {
            __int16 v37 = brc_bread_crumbs();
            id v38 = brc_default_log();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
              -[BRCFSReader fseventOnSymlink:flags:lookup:]();
            }
          }
          [v13 markLostWhenReplacedByItem:v9];
          [v13 saveToDB];
        }
        [v25 readTargetFromRelativePathAndSyncUp:v7];
        [v25 markNeedsUploadOrSyncingUp];
        [v9 saveToDB];
      }

      goto LABEL_40;
    }
    if (![v14 isSymLink])
    {
      id v9 = 0;
      goto LABEL_22;
    }
    id v16 = [v15 st];
    __int16 v17 = [v16 fileID];
    uint64_t v18 = [v17 unsignedLongLongValue];

    if ([v15 isAlmostDead])
    {
      int v19 = 2;
    }
    else
    {
      id v20 = [v7 session];
      int v19 = +[BRCRelativePath locateByFileID:v18 session:v20];

      if (!v19)
      {
        id v21 = brc_bread_crumbs();
        id v22 = brc_default_log();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSReader fseventOnSymlink:flags:lookup:]();
        }
        id v9 = 0;
        goto LABEL_21;
      }
    }
    id v9 = v15;
    id v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      int v39 = 138413058;
      id v40 = v9;
      __int16 v41 = 2112;
      id v42 = v7;
      __int16 v43 = 1024;
      LODWORD(v44[0]) = v19;
      WORD2(v44[0]) = 2112;
      *(void *)((char *)v44 + 6) = v21;
      _os_log_debug_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] Symlink %@ changed fileID at %@ %{errno}d%@", (uint8_t *)&v39, 0x26u);
    }
LABEL_21:

    goto LABEL_22;
  }
LABEL_41:
}

- (void)fseventOnAlias:(id)a3 flags:(unsigned int)a4 lookup:(id)a5
{
  uint64_t v105 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  id v9 = [v7 bookmark];
  int v10 = [v9 resolveWithError:0];
  id v11 = 0;
  if (v10)
  {
    int v12 = [v9 target];
    int v13 = [v12 isDocument];

    if (v13)
    {
      id v14 = [v9 target];
      id v11 = [v14 asDocument];
    }
    else
    {
      id v11 = 0;
    }
  }
  id v15 = [v11 aliasItemID];
  id v16 = [v8 byFileIDGlobally];
  int v17 = [(BRCFSReader *)self needsLookupReloadAfterHandlingCrossZoneMoveWithItem:v16 relpath:v7];
  if (v17 != 4)
  {
    v86 = self;
    if (v17 == 2)
    {

      uint64_t v18 = [v8 byFileID];

      if (!v18)
      {
        id v16 = 0;
        goto LABEL_11;
      }
      v80 = v11;
      v81 = brc_bread_crumbs();
      v82 = brc_default_log();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT)) {
        -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.5();
      }
      id v16 = 0;
    }
    else
    {
      if (!v16 || ([v16 isOnDisk] & 1) != 0)
      {
LABEL_11:
        int v19 = [v8 byPath];
        id v20 = v19;
        char v96 = v10;
        if (!v15)
        {
          id v24 = 0;
          goto LABEL_26;
        }
        id v21 = [v19 itemID];
        int v22 = [v21 isEqualToItemID:v15];

        if (v22)
        {
          id v23 = v20;
        }
        else
        {
          uint64_t v25 = [v16 itemID];
          int v26 = [v25 isEqualToItemID:v15];

          if (!v26)
          {
            id v27 = +[BRCPathToItemLookup lookupForRelativePath:v7];
            id v28 = [v27 clientZone];

            id v24 = [v28 itemByItemID:v15];

            goto LABEL_19;
          }
          id v23 = v16;
        }
        id v24 = v23;
LABEL_19:
        if ([v24 isBRAlias])
        {
          char v29 = brc_bread_crumbs();
          uint64_t v30 = brc_default_log();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138413314;
            id v98 = v24;
            __int16 v99 = 2112;
            id v100 = v20;
            __int16 v101 = 2112;
            *(void *)v102 = v16;
            *(_WORD *)&v102[8] = 2112;
            *(void *)&v102[10] = v15;
            __int16 v103 = 2112;
            v104 = v29;
            _os_log_debug_impl(&dword_1D353B000, v30, OS_LOG_TYPE_DEBUG, "[DEBUG] using byItemID:%@ byPath:%@ byFileID:%@ aliasItemID:%@%@", buf, 0x34u);
          }
        }
        else
        {
          char v29 = v24;
          uint64_t v30 = brc_bread_crumbs();
          __int16 v31 = brc_default_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
            -[BRCFSReader fseventOnAlias:flags:lookup:].cold.7();
          }

          id v24 = 0;
        }

LABEL_26:
        int v32 = [v16 isBRAlias];
        if (v32) {
          id v33 = 0;
        }
        else {
          id v33 = v16;
        }
        if (!v32) {
          id v16 = 0;
        }
        if (!v16 && v20)
        {
          if ([v20 isBRAlias])
          {
            v90 = v9;
            v87 = v24;
            v34 = [v20 st];
            __int16 v35 = [v34 fileID];
            uint64_t v36 = [v35 unsignedLongLongValue];

            v93 = v33;
            if ([v20 isAlmostDead])
            {
              int v37 = 2;
            }
            else
            {
              v52 = [v7 session];
              int v37 = +[BRCRelativePath locateByFileID:v36 session:v52];

              if (!v37)
              {
                v53 = brc_bread_crumbs();
                v54 = brc_default_log();
                id v9 = v90;
                if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG)) {
                  -[BRCFSReader fseventOnSymlink:flags:lookup:]();
                }
                id v16 = 0;
LABEL_48:
                id v24 = v87;

                id v33 = v93;
                if (!v87) {
                  goto LABEL_49;
                }
                goto LABEL_38;
              }
            }
            id v16 = v20;
            v53 = brc_bread_crumbs();
            v54 = brc_default_log();
            id v9 = v90;
            if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138413058;
              id v98 = v16;
              __int16 v99 = 2112;
              id v100 = v7;
              __int16 v101 = 1024;
              *(_DWORD *)v102 = v37;
              *(_WORD *)&v102[4] = 2112;
              *(void *)&v102[6] = v53;
              _os_log_debug_impl(&dword_1D353B000, v54, OS_LOG_TYPE_DEBUG, "[DEBUG] Alias %@ changed fileID at %@ %{errno}d%@", buf, 0x26u);
            }
            goto LABEL_48;
          }
          id v16 = 0;
        }
        if (!v24)
        {
LABEL_49:
          v89 = 0;
          goto LABEL_50;
        }
LABEL_38:
        if (v16 == v24)
        {
          v89 = v24;
          id v16 = v24;
        }
        else
        {
          id v91 = v8;
          v94 = v33;
          id v38 = v11;
          int v39 = v9;
          id v40 = [v24 st];
          __int16 v41 = [v40 fileID];
          id v42 = v24;
          __int16 v43 = (BRCRelativePath *)[v41 unsignedLongLongValue];

          v88 = v42;
          __int16 v44 = [v42 clientZone];
          v45 = [v44 asPrivateClientZone];

          if (v43)
          {
            __int16 v46 = [BRCRelativePath alloc];
            [v7 session];
            v47 = v15;
            v49 = uint64_t v48 = v38;
            __int16 v43 = [(BRCRelativePath *)v46 initWithFileID:v43 session:v49];

            id v38 = v48;
            id v15 = v47;
          }
          id v50 = [v45 resolveClashOfAlias:v16 atPath:v7 withAlias:v88 atPath:v43];

          if (v50 != v7)
          {

            v51 = v88;
            id v9 = v39;
            id v11 = v38;
            id v8 = v91;
            id v33 = v94;
LABEL_86:

            goto LABEL_87;
          }

          v89 = 0;
          id v16 = v88;
          id v9 = v39;
          id v11 = v38;
          id v8 = v91;
          id v33 = v94;
        }
LABEL_50:
        if (v96)
        {
          if (!v16)
          {
            if ([v11 isSharedToMeTopLevelItem])
            {
              v55 = brc_bread_crumbs();
              v56 = brc_default_log();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
                -[BRCFSReader fseventOnAlias:flags:lookup:]();
              }
LABEL_84:

              +[BRCBookmark unlinkAliasAtPath:v7];
              id v16 = 0;
              goto LABEL_85;
            }
            v85 = v20;
            v67 = [v8 relpathOfItem];
            id v92 = v8;
            v68 = [v8 parentItem];
            v69 = [v68 itemGlobalID];
            id v16 = +[BRCLocalItem newItemWithPath:v67 parentGlobalID:v69];

            if (v15) {
              [v16 learnItemID:v15 serverItem:0 path:v7 markLost:0];
            }
            if (v11)
            {
              v70 = [v16 asBRAlias];
              [v70 learnTarget:v11];
            }
            v71 = brc_bread_crumbs();
            v72 = brc_default_log();
            id v20 = v85;
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412802;
              id v98 = v16;
              __int16 v99 = 2112;
              id v100 = v7;
              __int16 v101 = 2112;
              *(void *)v102 = v71;
              _os_log_debug_impl(&dword_1D353B000, v72, OS_LOG_TYPE_DEBUG, "[DEBUG] creating new alias %@ at %@%@", buf, 0x20u);
            }

            [v16 saveToDB];
            v73 = [v11 session];
            v74 = [v73 fsUploader];
            v75 = [v16 asBRAlias];
            [v74 addAliasItem:v75 toUploadingItem:v11];

            goto LABEL_69;
          }
        }
        else
        {
          if ([v16 isLost])
          {
            v95 = v33;
            v57 = v20;
            id v58 = v8;
            v59 = brc_bread_crumbs();
            v60 = brc_default_log();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
              -[BRCFSReader fseventOnAlias:flags:lookup:].cold.4();
            }

            v61 = [v16 clientZone];
            v62 = [v16 itemID];
            v63 = [v61 serverItemByItemID:v62];

            +[BRCBookmark unlinkAliasAtPath:v7];
            [v16 markNeedsDeleteForRescheduleOfItem:v63];
            [v16 saveToDB];

            id v8 = v58;
            id v20 = v57;
            id v33 = v95;
            goto LABEL_85;
          }
          if (!v16)
          {
            v55 = brc_bread_crumbs();
            v56 = brc_default_log();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG)) {
              -[BRCFSReader fseventOnAlias:flags:lookup:].cold.5();
            }
            goto LABEL_84;
          }
        }
        id v92 = v8;
        v64 = [v8 parentItem];
        v65 = [v64 itemGlobalID];
        char v66 = [v16 updateFromFSAtPath:v7 parentGlobalID:v65];

        if ((v66 & 1) == 0)
        {
          [(BRCFSReader *)v86 reset];
LABEL_81:
          id v8 = v92;
LABEL_85:
          v51 = v89;
          goto LABEL_86;
        }
LABEL_69:
        if (v11)
        {
          v76 = [v16 asBRAlias];
          [v76 updateOnDiskWithAliasTarget:v11 forServerEdit:0];

          if (!v20)
          {
LABEL_77:
            if (v33)
            {
              if (v33 == v16)
              {
                v83 = brc_bread_crumbs();
                v84 = brc_default_log();
                if (os_log_type_enabled(v84, OS_LOG_TYPE_FAULT)) {
                  -[BRCFSReader fseventOnSymlink:flags:lookup:]();
                }
              }
              [v33 markLostWhenReplacedByItem:v16];
              [v33 saveToDB];
            }
            v79 = [v16 asBRAlias];
            [v79 markNeedsUploadOrSyncingUpWithAliasTarget:v11];

            [v16 saveToDB];
            goto LABEL_81;
          }
        }
        else
        {
          v77 = brc_bread_crumbs();
          v78 = brc_default_log();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG)) {
            -[BRCFSReader fseventOnAlias:flags:lookup:]();
          }

          [v16 markLostClearGenerationID:0 backoffMode:2];
          if (!v20) {
            goto LABEL_77;
          }
        }
        if (v20 != v16)
        {
          [v20 markLostWhenReplacedByItem:v16];
          [v20 saveToDB];
        }
        goto LABEL_77;
      }
      v80 = v11;
      v81 = brc_bread_crumbs();
      v82 = brc_default_log();
      if (os_log_type_enabled(v82, OS_LOG_TYPE_FAULT)) {
        -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.4();
      }
    }

    id v11 = v80;
    goto LABEL_11;
  }
LABEL_87:
}

- (id)itemForCreatedDocumentsDirectory:(id)a3 appLibrary:(id)a4 path:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [v8 defaultClientZone];
  id v11 = [v8 dbRowID];
  int v12 = +[BRCItemID documentsItemIDWithAppLibraryRowID:v11];
  int v13 = [v10 itemByItemID:v12];

  if (!v13)
  {
    id v20 = brc_bread_crumbs();
    id v21 = brc_default_log();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSReader itemForCreatedDocumentsDirectory:appLibrary:path:]();
    }

    uint64_t v18 = [v8 documentsFolderItemID];
    [v7 learnItemID:v18 serverItem:0 path:v9 markLost:0];
    int v17 = v7;
    goto LABEL_10;
  }
  if (![v13 isOnDisk]) {
    goto LABEL_4;
  }
  id v14 = [[BRCItemToPathLookup alloc] initWithItem:v13];
  id v15 = [(BRCItemToPathLookup *)v14 byFileSystemID];
  char v16 = [v15 exists];

  [(BRCItemToPathLookup *)v14 closePaths];
  int v17 = v7;
  if ((v16 & 1) == 0)
  {
LABEL_4:
    uint64_t v18 = brc_bread_crumbs();
    int v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSReader itemForCreatedDocumentsDirectory:appLibrary:path:]();
    }

    int v17 = v13;
LABEL_10:
  }
  id v22 = v17;

  return v22;
}

- (void)fseventOnDirectory:(id)a3 flags:(unsigned int)a4 lookup:(id)a5
{
  __int16 v6 = a4;
  v88[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  int v10 = [v9 byFileIDGlobally];
  int v11 = [(BRCFSReader *)self needsLookupReloadAfterHandlingCrossZoneMoveWithItem:v10 relpath:v8];
  if (v11 == 4)
  {
    id v14 = 0;
    id v15 = 0;
    goto LABEL_86;
  }
  if (v11 == 2)
  {

    int v10 = [v9 byFileID];

    if (v10)
    {
      int v12 = brc_bread_crumbs();
      int v13 = brc_default_log();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
        -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.5();
      }
      int v10 = 0;
LABEL_96:
    }
  }
  else if (v10 && ([v10 isOnDisk] & 1) == 0)
  {
    int v12 = brc_bread_crumbs();
    int v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.4();
    }
    goto LABEL_96;
  }
  id v15 = [v9 byPath];
  char v16 = [v10 isDirectory];
  if (v10 && (v16 & 1) != 0)
  {
    id v14 = 0;
    goto LABEL_52;
  }
  if (v15 && [v15 isDirectory])
  {
    int v17 = [v15 st];
    uint64_t v18 = [v17 fileID];
    uint64_t v19 = [v18 unsignedLongLongValue];

    if ([v15 isAlmostDead])
    {
      int v20 = 2;
      goto LABEL_18;
    }
    id v21 = [v8 session];
    int v20 = +[BRCRelativePath locateByFileID:v19 session:v21];

    if (v20)
    {
LABEL_18:
      id v22 = v15;
      id v23 = brc_bread_crumbs();
      id v24 = brc_default_log();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138413058;
        id v84 = v22;
        __int16 v85 = 2112;
        id v86 = v8;
        __int16 v87 = 1024;
        LODWORD(v88[0]) = v20;
        WORD2(v88[0]) = 2112;
        *(void *)((char *)v88 + 6) = v23;
        _os_log_debug_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] directory %@ changed fileID at %@ %{errno}d%@", buf, 0x26u);
      }
LABEL_50:

      goto LABEL_51;
    }
    uint64_t v25 = brc_bread_crumbs();
    int v26 = brc_default_log();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSReader fseventOnDirectory:flags:lookup:].cold.5();
    }
  }
  if ([(BRCFSReader *)self _createSharedZoneIfNecessaryWithLookup:v9])
  {
    id v14 = v10;
    int v10 = 0;
    goto LABEL_86;
  }
  __int16 v79 = v6;
  id v27 = [v8 appLibrary];
  id v28 = [v9 relpathOfItem];
  char v29 = [v9 parentItem];
  uint64_t v30 = [v29 itemGlobalID];
  id v31 = +[BRCLocalItem newItemWithPath:v28 parentGlobalID:v30];

  v81 = v27;
  if ([v8 type] == 5 && objc_msgSend(v27, "includesDataScope"))
  {
    int v32 = [v8 filename];
    int v33 = [v32 isEqualToString:*MEMORY[0x1E4F59400]];

    id v22 = v31;
    if (v33)
    {
      uint64_t v34 = [(BRCFSReader *)self itemForCreatedDocumentsDirectory:v31 appLibrary:v81 path:v8];

      id v22 = (id)v34;
    }
  }
  else
  {
    id v22 = v31;
  }
  __int16 v35 = [v22 itemID];
  char v36 = [v35 isDocumentsFolder];

  if ((v36 & 1) == 0)
  {
    id v24 = [v9 serverByPath];
    if ([v24 isDirectory])
    {
      int v37 = [v22 clientZone];
      id v38 = [v24 itemID];
      char v39 = [v37 existsByItemID:v38];

      if ((v39 & 1) == 0)
      {
        __int16 v46 = brc_bread_crumbs();
        v47 = brc_default_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSReader fseventOnDirectory:flags:lookup:].cold.4();
        }

        id v40 = [v24 itemID];
        [v22 learnItemID:v40 serverItem:v24 path:v8 markLost:0];
        goto LABEL_45;
      }
      if ([v22 isFromInitialScan])
      {
        id v40 = [v22 clientZone];
        __int16 v41 = [v24 itemID];
        id v42 = [v40 itemByItemID:v41];
        if (v42)
        {
          v77 = v42;
          int v43 = [v42 isReserved];

          if (v43)
          {
            __int16 v44 = brc_bread_crumbs();
            v45 = brc_default_log();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
              -[BRCFSReader fseventOnDirectory:flags:lookup:]();
            }

            [v77 markNeedsDeleteForRescheduleOfItem:0];
            [v77 saveToDB];
            id v40 = [v24 itemID];
            [v22 learnItemID:v40 serverItem:v24 path:v8 markLost:0];
            goto LABEL_46;
          }
LABEL_41:
          __int16 v6 = v79;
LABEL_47:
          uint64_t v48 = brc_bread_crumbs();
          v49 = brc_default_log();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            id v84 = v22;
            __int16 v85 = 2112;
            id v86 = v8;
            __int16 v87 = 2112;
            v88[0] = v48;
            _os_log_debug_impl(&dword_1D353B000, v49, OS_LOG_TYPE_DEBUG, "[DEBUG] creating new directory %@ at %@%@", buf, 0x20u);
          }

          id v23 = v81;
          goto LABEL_50;
        }

LABEL_45:
        v77 = 0;
LABEL_46:
        __int16 v6 = v79;

        goto LABEL_47;
      }
    }
    v77 = 0;
    goto LABEL_41;
  }
  __int16 v6 = v79;
  id v23 = v81;
LABEL_51:

  id v14 = v10;
  int v10 = v22;
LABEL_52:
  int v50 = [v10 needsInsert];
  if (!v50)
  {
    __int16 v62 = v6;
    v63 = [v9 parentItem];
    v64 = [v63 itemGlobalID];
    int v65 = [v10 updateFromFSAtPath:v8 parentGlobalID:v64];

    if (!v65)
    {
      [(BRCFSReader *)self reset];
      goto LABEL_86;
    }
    uint64_t v66 = [v10 diffAgainstOriginalItem];
    if ((v66 & 0xC00000000) == 0)
    {
      uint64_t v68 = v66;
      v61 = [v10 orig];
      char v69 = [v61 isLost];
      BOOL v67 = 1;
      if ((v62 & 0xB01) == 0) {
        BOOL v67 = (v69 & 1) != 0 || (v68 & 0x1000000060) != 0;
      }
      int v50 = 0;
      goto LABEL_71;
    }
LABEL_60:
    BOOL v67 = 1;
    int v50 = 1;
    goto LABEL_72;
  }
  if (![v8 isBundle]) {
    goto LABEL_60;
  }
  v78 = self;
  v80 = [v8 appLibrary];
  v51 = +[BRCPathToItemLookup lookupForRelativePath:v8];
  v52 = [v51 clientZone];

  v53 = [v8 filename];
  v54 = objc_msgSend(v53, "br_pathExtension");
  uint64_t v55 = [v54 length];

  v82 = v52;
  if (!v55)
  {
    v59 = brc_bread_crumbs();
    v60 = brc_default_log();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v84 = v8;
      __int16 v85 = 2112;
      id v86 = v59;
      _os_log_impl(&dword_1D353B000, v60, OS_LOG_TYPE_DEFAULT, "[WARNING] Scanning an extensionless directory with a kBundle bit set as a directory at '%@'%@", buf, 0x16u);
    }
    v61 = v80;
    goto LABEL_65;
  }
  v56 = [v52 serverZone];
  v57 = [v56 changeState];
  id v58 = [v57 changeToken];

  if (v58)
  {
    v59 = brc_bread_crumbs();
    v60 = brc_default_log();
    v61 = v80;
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412546;
      id v84 = v8;
      __int16 v85 = 2112;
      id v86 = v59;
      _os_log_impl(&dword_1D353B000, v60, OS_LOG_TYPE_DEFAULT, "[WARNING] Scanning directory with a kBundle bit set as a directory at '%@'%@", buf, 0x16u);
    }
LABEL_65:
    self = v78;

    BOOL v67 = 1;
LABEL_71:

LABEL_72:
    [v10 markNeedsUploadOrSyncingUp];
    if (v15 && v15 != v10)
    {
      [v15 markLostWhenReplacedByItem:v10];
      [v15 saveToDB];
    }
    if (v14)
    {
      if (v14 == v10)
      {
        v75 = brc_bread_crumbs();
        v76 = brc_default_log();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_FAULT)) {
          -[BRCFSReader fseventOnSymlink:flags:lookup:]();
        }
      }
      [v14 markLostWhenReplacedByItem:v10];
      [v14 saveToDB];
    }
    if (v67)
    {
      if (self->_currentScan)
      {
        uint64_t v70 = [v8 fileID];
        v71 = [(BRCAsyncDirectoryEnumerator *)self->_currentScan rootPath];
        uint64_t v72 = [v71 fileID];

        if (v70 == v72) {
          [(BRCFSReader *)self _cancelScan];
        }
      }
      if (v50) {
        [v10 markLostClearGenerationID:1 backoffMode:0];
      }
      else {
        [v10 markLostWhenReplacedByItem:0];
      }
    }
    [v10 saveToDB];
    goto LABEL_86;
  }
  v73 = brc_bread_crumbs();
  v74 = brc_default_log();
  if (os_log_type_enabled(v74, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSReader fseventOnDirectory:flags:lookup:]();
  }

  [v80 setStateBits:0x80000];
LABEL_86:
}

- (void)scanContainerDocumentsIfNeeded:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(BRCAccountSession *)self->super._session clientDB];
  [v5 assertOnQueue];

  __int16 v6 = [v4 documentsPath];
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCFSReader scanContainerDocumentsIfNeeded:]", 1440, v18);
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v12 = v18[0];
    int v13 = [v4 appLibraryID];
    *(_DWORD *)buf = 134218498;
    uint64_t v20 = v12;
    __int16 v21 = 2112;
    id v22 = v13;
    __int16 v23 = 2112;
    id v24 = v7;
    _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx scanning documents folder for %@%@", buf, 0x20u);
  }
  id v9 = [(BRCAccountSession *)self->super._session clientDB];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__BRCFSReader_scanContainerDocumentsIfNeeded___block_invoke;
  v14[3] = &unk_1E6997478;
  id v10 = v6;
  id v15 = v10;
  id v11 = v4;
  id v16 = v11;
  int v17 = self;
  [v9 performWithFlags:4 action:v14];

  __brc_leave_section(v18);
}

uint64_t __46__BRCFSReader_scanContainerDocumentsIfNeeded___block_invoke(uint64_t a1)
{
  if ([*(id *)(a1 + 32) resolveAndKeepOpenMustExist:1 error:0])
  {
    id v2 = [[BRCPathToItemLookup alloc] initWithRelativePath:*(void *)(a1 + 32)];
    if (([*(id *)(a1 + 40) isCloudDocsAppLibrary] & 1) != 0
      || [*(id *)(a1 + 40) isiCloudDesktopAppLibrary])
    {
      id v3 = *(void **)(a1 + 48);
      id v4 = [(BRCPathToItemLookup *)v2 relpathOfItem];
      [v3 fseventOnContainer:v4 flags:131073];
    }
    else
    {
      id v5 = *(void **)(a1 + 48);
      id v4 = [(BRCPathToItemLookup *)v2 relpathOfItem];
      [v5 fseventOnDirectory:v4 flags:131073 lookup:v2];
    }

    [*(id *)(a1 + 32) close];
  }
  return 1;
}

- (void)_refaultItem:(id)a3 withFaultPath:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 fileID];
  id v8 = [v6 clientZone];
  id v9 = [v8 db];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __42__BRCFSReader__refaultItem_withFaultPath___block_invoke;
  v12[3] = &unk_1E6993A60;
  id v13 = v6;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __42__BRCFSReader__refaultItem_withFaultPath___block_invoke_2;
  v11[3] = &unk_1E6999D18;
  v11[4] = self;
  void v11[5] = v7;
  id v10 = v6;
  [v9 performWithFlags:4 action:v12 whenFlushed:v11];
}

uint64_t __42__BRCFSReader__refaultItem_withFaultPath___block_invoke(uint64_t a1)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [v2 clientZone];
  id v4 = [*(id *)(a1 + 32) itemID];
  id v5 = [v3 serverItemByItemID:v4];
  [v2 markNeedsDeleteForRescheduleOfItem:v5];

  [*(id *)(a1 + 32) saveToDBForServerEdit:0 keepAliases:1];
  return 1;
}

void __42__BRCFSReader__refaultItem_withFaultPath___block_invoke_2(uint64_t a1)
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v2 = [*(id *)(*(void *)(a1 + 32) + 8) volume];
  int32_t v3 = [v2 deviceID];

  if ((BRCUnlinkFileID(v3, *(void *)(a1 + 40)) & 0x80000000) != 0)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v6 = *(void *)(a1 + 40);
      uint64_t v7 = __error();
      id v8 = strerror(*v7);
      v9[0] = 67109890;
      v9[1] = v3;
      __int16 v10 = 2048;
      uint64_t v11 = v6;
      __int16 v12 = 2080;
      id v13 = v8;
      __int16 v14 = 2112;
      id v15 = v4;
      _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] failed to unlink dev:%d fileID:%llu: %s%@", (uint8_t *)v9, 0x26u);
    }
  }
}

- (void)_fseventOnDocument:(id)a3 flags:(unsigned int)a4 options:(unint64_t)a5 item:(id)a6 lookup:(id)a7 unresolvedLastPathComponent:(id)a8
{
  char v11 = a5;
  uint64_t v173 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  __int16 v14 = a6;
  id v15 = a7;
  id v16 = a8;
  int v17 = [v13 appLibrary];
  id v18 = v13;
  if ([v18 isInPackage])
  {
    uint64_t v19 = [v18 pathOfPackageRoot];
  }
  else
  {
    uint64_t v19 = v18;
  }
  uint64_t v20 = v19;
  int v21 = [(BRCFSReader *)self needsLookupReloadAfterHandlingCrossZoneMoveWithItem:v14 relpath:v18];
  if (!v20)
  {
    char v158 = v11;
    v145 = v17;
    v146 = self;
    v147 = brc_bread_crumbs();
    v148 = brc_default_log();
    if (os_log_type_enabled(v148, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:]3();
    }

    self = v146;
    int v17 = v145;
    char v11 = v158;
  }
  if (v21 == 4)
  {
    id v24 = 0;
    uint64_t v25 = 0;
    goto LABEL_147;
  }
  v163 = self;
  id v161 = v18;
  char v156 = v11;
  if (v21 == 2)
  {

    id v22 = [v15 byDocumentID];

    __int16 v23 = v17;
    if (!v22)
    {
      __int16 v14 = 0;
LABEL_14:
      char v26 = 1;
      goto LABEL_15;
    }
    v149 = brc_bread_crumbs();
    v150 = brc_default_log();
    if (os_log_type_enabled(v150, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:]2();
    }
    __int16 v14 = 0;
    char v26 = 1;
  }
  else
  {
    if (!v14)
    {
      __int16 v23 = v17;
      goto LABEL_14;
    }
    __int16 v23 = v17;
    if ([v14 isOnDisk])
    {
      char v26 = 0;
      goto LABEL_15;
    }
    v149 = brc_bread_crumbs();
    v150 = brc_default_log();
    if (os_log_type_enabled(v150, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.4();
    }
    char v26 = 0;
  }

LABEL_15:
  uint64_t v27 = [v15 byPath];
  if (!v27)
  {
    id v28 = [v15 relpathOfItem];
    char v29 = [v28 filename];
    char v30 = [v29 isEqualToString:v16];

    if (v30)
    {
      uint64_t v27 = 0;
    }
    else
    {
      uint64_t v27 = [v15 byPathWithLastPathComponent:v16];
    }
  }
  id v31 = (void *)v27;
  int v32 = [v15 byFileID];
  if ([v14 isReserved])
  {
    int v33 = brc_bread_crumbs();
    uint64_t v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      v168 = v33;
      _os_log_impl(&dword_1D353B000, v34, OS_LOG_TYPE_DEFAULT, "[WARNING] We shouldn't go through that path, but learn the new state of the item anyway%@", buf, 0xCu);
    }
  }
  v164 = v15;
  id v162 = v16;
  if ([v14 isFault])
  {
    __int16 v35 = [v14 st];
    char v36 = [v35 fileID];
    uint64_t v37 = [v36 unsignedLongLongValue];
    uint64_t v38 = [v20 fileID];

    if (v37 == v38)
    {
      char v39 = [v20 filename];
      id v40 = [v14 st];
      __int16 v41 = [v40 filename];
      char v42 = [v39 isEqualToString:v41];

      id v16 = v162;
      if ((v42 & 1) == 0)
      {
        int v43 = brc_bread_crumbs();
        __int16 v44 = brc_default_log();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412290;
          v168 = v43;
          _os_log_impl(&dword_1D353B000, v44, OS_LOG_TYPE_DEFAULT, "[WARNING] Someone changed the filename of a fault, we don't support that, delete the fault, and schedule it being recreated%@", buf, 0xCu);
        }

        [(BRCFSReader *)v163 _refaultItem:v14 withFaultPath:v20];
        v45 = v23;
        id v15 = v164;
        id v18 = v161;
        uint64_t v25 = v31;
        id v24 = v32;
        int v17 = v45;
        goto LABEL_147;
      }
    }
    else
    {
      id v16 = v162;
      if (([v20 isFault] & 1) == 0)
      {
        __int16 v46 = brc_bread_crumbs();
        v47 = brc_default_log();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:]0();
        }

        [v14 forceVersionConflictByClearkingCKInfo];
      }
    }
  }
  if (v26)
  {
    v160 = v23;
    id v15 = v164;
    if ([v20 isFault])
    {
      uint64_t v48 = brc_bread_crumbs();
      v49 = brc_default_log();
      id v18 = v161;
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412546;
        v168 = v20;
        __int16 v169 = 2112;
        v170 = v48;
        _os_log_impl(&dword_1D353B000, v49, OS_LOG_TYPE_DEFAULT, "[WARNING] unlinking side-fault because we don't know its documentID at %@%@", buf, 0x16u);
      }

      int v50 = [(BRCAccountSession *)v163->super._session fileUnlinker];
      v51 = [v20 absolutePath];
      [v50 renameAndUnlinkInBackgroundItemAtPath:v51];

      __int16 v14 = 0;
      uint64_t v25 = v31;
      id v24 = v32;
      goto LABEL_81;
    }
    int v65 = v32;
    id v18 = v161;
    if ([v20 isDocument]
      && [v32 isDirectory])
    {
      uint64_t v66 = [v20 birthTime];
      BOOL v67 = [v32 st];
      uint64_t v68 = [v67 birthtime];

      if (v66 != v68)
      {
        v151 = brc_bread_crumbs();
        v152 = brc_default_log();
        if (os_log_type_enabled(v152, OS_LOG_TYPE_FAULT)) {
          -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:]();
        }

        id v15 = v164;
        int v65 = v32;
      }
      char v69 = [v65 st];
      uint64_t v70 = [v69 filename];
      if (v70)
      {
        v71 = (void *)v70;
        uint64_t v72 = [v20 filename];
        v73 = v65;
        v74 = [v65 st];
        v75 = [v74 filename];
        char v157 = [v72 isEqualToString:v75];

        id v15 = v164;
        v76 = v31;
        if (v157)
        {
          v77 = brc_bread_crumbs();
          v78 = brc_default_log();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            id v24 = v73;
            v168 = v73;
            __int16 v169 = 2112;
            v170 = v77;
            __int16 v79 = "[WARNING] Folder %@ became a package%@";
            v80 = v78;
            uint32_t v81 = 22;
LABEL_85:
            _os_log_impl(&dword_1D353B000, v80, OS_LOG_TYPE_DEFAULT, v79, buf, v81);
LABEL_87:

            v102 = [v15 parentItem];
            __int16 v103 = [v102 itemGlobalID];
            char v104 = [v24 updateFromFSAtPath:v20 parentGlobalID:v103];

            int v17 = v160;
            if ((v104 & 1) == 0)
            {
              uint64_t v105 = brc_bread_crumbs();
              v106 = brc_default_log();
              if (os_log_type_enabled(v106, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412802;
                v168 = v24;
                __int16 v169 = 2112;
                v170 = v20;
                __int16 v171 = 2112;
                v172 = v105;
                _os_log_fault_impl(&dword_1D353B000, v106, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Failed to update item %@ from %@ during transmogirifcation%@", buf, 0x20u);
              }
            }
            [v24 markLostClearGenerationID:0 backoffMode:2];
            [v24 saveToDB];
            v107 = [(BRCAccountSession *)v163->super._session itemTransmogrifier];
            v108 = [v24 asDirectory];
            v109 = [v20 absolutePath];
            [v107 scheduleDirectoryToPackageTransmogrification:v108 absolutePath:v109];

            __int16 v14 = 0;
            id v16 = v162;
            uint64_t v25 = v76;
            goto LABEL_147;
          }
          goto LABEL_86;
        }
      }
      else
      {
        v73 = v65;

        v76 = v31;
      }
      v77 = brc_bread_crumbs();
      v78 = brc_default_log();
      if (os_log_type_enabled(v78, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v24 = v73;
        v168 = v73;
        __int16 v169 = 2112;
        v170 = v20;
        __int16 v171 = 2112;
        v172 = v77;
        __int16 v79 = "[WARNING] Folder %@ was renamed to package %@%@";
        v80 = v78;
        uint32_t v81 = 32;
        goto LABEL_85;
      }
LABEL_86:
      id v24 = v73;
      goto LABEL_87;
    }
    if ([(BRCFSReader *)v163 _createSharedZoneIfNecessaryWithLookup:v164])
    {
      __int16 v14 = 0;
      uint64_t v25 = v31;
LABEL_80:
      id v24 = v32;
LABEL_81:
      int v17 = v160;
      goto LABEL_147;
    }
    v82 = [v164 relpathOfItem];
    v83 = [v164 parentItem];
    id v84 = [v83 itemGlobalID];
    id v85 = +[BRCLocalItem newItemWithPath:v82 parentGlobalID:v84];
    __int16 v14 = [v85 asDocument];

    uint64_t v25 = v31;
    if (!v14)
    {
      id v16 = v162;
      id v15 = v164;
      goto LABEL_80;
    }
    v155 = v31;
    id v15 = v164;
    id v24 = v32;
    if (([v160 state] & 0x800) == 0) {
      goto LABEL_100;
    }
    id v86 = [v164 serverByPath];
    if (![v86 isDocument])
    {
      v93 = 0;
LABEL_99:

LABEL_100:
      p_super = brc_bread_crumbs();
      v64 = brc_default_log();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        v168 = v14;
        __int16 v169 = 2112;
        v170 = v20;
        __int16 v171 = 2112;
        v172 = p_super;
        _os_log_debug_impl(&dword_1D353B000, v64, OS_LOG_TYPE_DEBUG, "[DEBUG] creating new document %@ at %@%@", buf, 0x20u);
      }
      int v17 = v160;
      goto LABEL_103;
    }
    __int16 v87 = [v14 clientZone];
    v88 = [v86 itemID];
    char v89 = [v87 existsByItemID:v88];

    if (v89)
    {
      v90 = [v14 clientZone];
      id v91 = [v86 itemID];
      id v92 = [v90 itemByItemID:v91];
      v93 = v92;
      if (v92)
      {
        int v94 = [v92 isReserved];

        if (!v94)
        {
LABEL_98:
          id v15 = v164;
          goto LABEL_99;
        }
        v95 = brc_bread_crumbs();
        char v96 = brc_default_log();
        if (os_log_type_enabled(v96, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSReader fseventOnDirectory:flags:lookup:]();
        }

        [v93 markNeedsDeleteForRescheduleOfItem:0];
        [v93 saveToDB];
        v90 = [v86 itemID];
        [v14 learnItemID:v90 serverItem:v86 path:v20 markLost:0];
      }
      else
      {
      }
    }
    else
    {
      v110 = brc_bread_crumbs();
      v111 = brc_default_log();
      if (os_log_type_enabled(v111, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:].cold.7();
      }

      v90 = [v86 itemID];
      [v14 learnItemID:v90 serverItem:v86 path:v20 markLost:0];
      v93 = 0;
    }

    goto LABEL_98;
  }
  v52 = v23;
  if (([v14 isFault] & 1) == 0 && [v20 isFault])
  {
    [(BRCFSReader *)v163 _refaultItem:v14 withFaultPath:v20];
    v53 = brc_bread_crumbs();
    v54 = brc_default_log();
    id v15 = v164;
    id v18 = v161;
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138412802;
      v168 = v14;
      __int16 v169 = 2112;
      v170 = v20;
      __int16 v171 = 2112;
      v172 = v53;
      _os_log_fault_impl(&dword_1D353B000, v54, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item was turned into a fault on disk:\nitem %@\nrelpath %@%@", buf, 0x20u);
    }

    uint64_t v25 = v31;
    id v24 = v32;
    int v17 = v52;
    goto LABEL_147;
  }
  id v15 = v164;
  id v18 = v161;
  if ([v20 hardlinkCount] < 2)
  {
    v57 = v31;
    goto LABEL_57;
  }
  uint64_t v55 = [v14 clientZone];
  int v56 = [v55 isPrivateZone];

  v57 = v31;
  if (!v56)
  {
LABEL_57:
    id v24 = v32;
    int v17 = v52;
    goto LABEL_104;
  }
  v155 = v31;
  uint64_t v58 = [v20 parentFileID];
  v59 = [v14 parentFileID];
  id v24 = v32;
  if (v58 == [v59 unsignedLongLongValue])
  {
    v60 = [v20 filename];
    v61 = [v14 st];
    __int16 v62 = [v61 filename];
    int v153 = [v60 isEqualToString:v62];

    id v16 = v162;
    int v17 = v52;
    if (v153)
    {
      p_super = brc_bread_crumbs();
      v64 = brc_default_log();
      if (os_log_type_enabled(v64, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:].cold.8();
      }
LABEL_78:
      id v15 = v164;
LABEL_103:

      v57 = v155;
LABEL_104:
      v112 = v57;
      if (([v20 isBusy] & 1) != 0
        || ([v14 needsInsert] & 1) != 0
        || [v14 changedAtRelativePath:v18 scanPackage:1])
      {
        if ([v20 isFault])
        {
          v113 = brc_bread_crumbs();
          v114 = brc_default_log();
          if (os_log_type_enabled(v114, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412802;
            v168 = v20;
            __int16 v169 = 2112;
            v170 = v14;
            __int16 v171 = 2112;
            v172 = v113;
            _os_log_impl(&dword_1D353B000, v114, OS_LOG_TYPE_DEFAULT, "[WARNING] Ignoring read on edited fault at %@ for %@%@", buf, 0x20u);
          }
        }
        else
        {
          [v14 markNeedsReading];
        }
      }
      v115 = [v15 parentItem];
      v116 = [v115 itemGlobalID];
      char v117 = [v14 updateLocationAndMetaFromFSAtPath:v20 parentGlobalID:v116];

      if ((v117 & 1) == 0)
      {
        v118 = brc_bread_crumbs();
        v119 = brc_default_log();
        if (os_log_type_enabled(v119, OS_LOG_TYPE_FAULT)) {
          -[BRCFSReader readUnderCoordinationWithLookup:].cold.5();
        }
      }
      if ([v14 needsInsert]
        && [v20 isFile]
        && ![v20 size])
      {
        v120 = brc_bread_crumbs();
        v121 = brc_default_log();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:].cold.4();
        }

        [v14 markLostClearGenerationID:0 backoffMode:1];
      }
      v122 = [(BRCAccountSession *)v163->super._session analyticsReporter];
      uint64_t v123 = [v20 fileID];
      uint64_t v124 = [v20 fsGenerationID];
      v165[0] = MEMORY[0x1E4F143A8];
      v165[1] = 3221225472;
      v165[2] = __88__BRCFSReader__fseventOnDocument_flags_options_item_lookup_unresolvedLastPathComponent___block_invoke;
      v165[3] = &unk_1E6996B40;
      __int16 v14 = v14;
      v166 = v14;
      [v122 lookupFSEventToSyncUpEventByFileID:v123 genID:v124 accessor:v165];

      uint64_t v25 = v112;
      if (v112)
      {
        v125 = [v112 itemID];
        v126 = [v14 itemID];
        char v127 = [v125 isEqualToItemID:v126];

        uint64_t v25 = v112;
        if ((v127 & 1) == 0)
        {
          if ([v112 isDead]) {
            [v112 moveAsideLocally];
          }
          else {
            [v112 markLostWhenReplacedByItem:v14];
          }
          [v112 saveToDB];
        }
      }
      if (v24)
      {
        if (v24 != v14)
        {
          v128 = [v24 itemID];
          v129 = [v14 itemID];
          char v130 = [v128 isEqualToItemID:v129];

          uint64_t v25 = v112;
          if ((v130 & 1) == 0)
          {
            [v24 markLostWhenReplacedByItem:v14];
            [v24 saveToDB];
          }
        }
      }
      if ([v14 needsReading])
      {
        [v14 saveToDB];
        id v16 = v162;
        if ([v20 isPackageRoot])
        {
          if (v156)
          {
            v143 = brc_bread_crumbs();
            v144 = brc_default_log();
            if (os_log_type_enabled(v144, OS_LOG_TYPE_DEBUG)) {
              -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:]();
            }

            [(BRCFSReader *)v163 _scheduleCoordinatedReadForItem:v14 path:v20];
          }
          else
          {
            v131 = [v14 serverZone];
            v132 = [v131 metadataSyncContext];
            v133 = [v132 defaults];
            [v133 readerPackageProcessingDelay];
            double v135 = v134;

            v136 = brc_bread_crumbs();
            v137 = brc_default_log();
            if (os_log_type_enabled(v137, OS_LOG_TYPE_DEBUG)) {
              -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:]((uint64_t)v136, v137, v138, v135);
            }

            uint64_t v139 = [v14 dbRowID];
            v140 = [v14 serverZone];
            v141 = [v140 dbRowID];
            v142 = [[BRCItemDBRowIDAndZoneJobIdentifier alloc] initWithItemDBRowID:v139 zoneRowID:v141];
            [(BRCFSReader *)v163 _delayJobID:v142 by:v135];

            id v16 = v162;
            id v15 = v164;
          }
          uint64_t v25 = v112;
        }
        else if (([v14 isLost] & 1) == 0 && ([v20 isBusy] & 1) == 0)
        {
          [(BRCFSReader *)v163 _attemptSchedulingCoordinatedReadForItem:v14 path:v20];
        }
      }
      else
      {
        [v14 markNeedsUploadOrSyncingUp];
        [v14 saveToDB];
        id v16 = v162;
      }

      goto LABEL_147;
    }
  }
  else
  {

    int v17 = v52;
  }
  v154 = [[BRCItemToPathLookup alloc] initWithItem:v14];
  v64 = [(BRCItemToPathLookup *)v154 byPath];
  if (![v64 exists]
    || (int v97 = [v64 documentID], v97 != [v20 documentID]))
  {
    id v100 = brc_bread_crumbs();
    __int16 v101 = brc_default_log();
    if (os_log_type_enabled(v101, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSReader _fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:].cold.9();
    }

    p_super = &v154->super;
    [(BRCItemToPathLookup *)v154 closePaths];
    goto LABEL_78;
  }
  id v98 = brc_bread_crumbs();
  __int16 v99 = brc_default_log();
  if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    v168 = v20;
    __int16 v169 = 2112;
    v170 = v64;
    __int16 v171 = 2112;
    v172 = v98;
    _os_log_debug_impl(&dword_1D353B000, v99, OS_LOG_TYPE_DEBUG, "[DEBUG] [hardlink] we got an event at %@\nbut it's still live where we track it, redirect the event to %@%@", buf, 0x20u);
  }

  [(BRCFSReader *)v163 fseventAtPath:v64 flags:a4];
  [(BRCItemToPathLookup *)v154 closePaths];

  id v15 = v164;
  uint64_t v25 = v155;
LABEL_147:
}

void __88__BRCFSReader__fseventOnDocument_flags_options_item_lookup_unresolvedLastPathComponent___block_invoke(uint64_t a1, void *a2)
{
  id v5 = a2;
  int32_t v3 = [*(id *)(a1 + 32) itemID];
  [v5 setItemID:v3];

  objc_msgSend(v5, "setIsPackage:", objc_msgSend(*(id *)(a1 + 32), "isPackage"));
  if ([*(id *)(a1 + 32) isFault])
  {
    [v5 setContentSize:0];
  }
  else
  {
    id v4 = [*(id *)(a1 + 32) currentVersion];
    objc_msgSend(v5, "setContentSize:", objc_msgSend(v4, "size"));
  }
}

- (void)fseventOnDocument:(id)a3 flags:(unsigned int)a4 lookup:(id)a5
{
}

- (void)fseventOnDocument:(id)a3 flags:(unsigned int)a4 options:(unint64_t)a5 lookup:(id)a6
{
  uint64_t v7 = *(void *)&a4;
  id v10 = a6;
  id v11 = a3;
  id v12 = [v11 filename];
  [(BRCFSReader *)self fseventOnDocument:v11 flags:v7 options:a5 lookup:v10 unresolvedLastPathComponent:v12];
}

- (void)fseventOnDocument:(id)a3 flags:(unsigned int)a4 options:(unint64_t)a5 lookup:(id)a6 unresolvedLastPathComponent:(id)a7
{
  uint64_t v9 = *(void *)&a4;
  id v12 = a7;
  id v13 = a6;
  id v14 = a3;
  id v15 = [v13 byDocumentIDGlobally];
  [(BRCFSReader *)self _fseventOnDocument:v14 flags:v9 options:a5 item:v15 lookup:v13 unresolvedLastPathComponent:v12];
}

- (void)fseventOnURL:(id)a3 dbFlags:(unsigned int)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = self->super._session;
  id v7 = a3;
  id v8 = [[BRCURLToItemLookup alloc] initWithURL:v7 session:v6];

  id v17 = 0;
  LOBYTE(v7) = [(BRCURLToItemLookup *)v8 resolveAndKeepOpenWithError:&v17];
  id v9 = v17;
  if (v7)
  {
    id v10 = [(BRCAccountSession *)v6 clientDB];
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = __36__BRCFSReader_fseventOnURL_dbFlags___block_invoke;
    v14[3] = &unk_1E6993A88;
    id v15 = v6;
    id v11 = v8;
    id v16 = v11;
    [v10 performWithFlags:a4 | 4 action:v14];

    [(BRCURLToItemLookup *)v11 closePaths];
    id v12 = v15;
  }
  else
  {
    id v12 = brc_bread_crumbs();
    id v13 = brc_default_log();
    if (os_log_type_enabled(v13, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v19 = v8;
      __int16 v20 = 2112;
      id v21 = v9;
      __int16 v22 = 2112;
      __int16 v23 = v12;
      _os_log_error_impl(&dword_1D353B000, v13, (os_log_type_t)0x90u, "[ERROR] can't open %@: %@%@", buf, 0x20u);
    }
  }
}

uint64_t __36__BRCFSReader_fseventOnURL_dbFlags___block_invoke(uint64_t a1)
{
  id v2 = [*(id *)(a1 + 32) fsReader];
  int32_t v3 = [*(id *)(a1 + 40) relpath];
  [v2 fseventAtPath:v3 flags:0];

  return 1;
}

- (unint64_t)_backoffBeforeProcessingLostItemWithStamp:(unint64_t)a3 appLibrary:(id)a4
{
  id v5 = [a4 mangledID];
  uint64_t v6 = +[BRCUserDefaults defaultsForMangledID:v5];

  [v6 readerLostItemBackoff];
  unint64_t v7 = brc_interval_to_nsec();

  uint64_t v8 = brc_current_date_nsec();
  if (v8 - a3 + 10000000 >= v7) {
    return 0;
  }
  else {
    return v7 - (v8 - a3);
  }
}

- (BOOL)_fetchNextLostItemID:(id *)a3 parentID:(id *)a4 appLibraryRowID:(id *)a5 tooManyScans:(BOOL *)a6 stamp:(int64_t *)a7
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  uint64_t v76 = 0;
  v77 = &v76;
  uint64_t v78 = 0x2020000000;
  uint64_t v79 = 0x7FFFFFFFFFFFFFFFLL;
  id v9 = objc_opt_new();
  long long v74 = 0u;
  long long v75 = 0u;
  long long v72 = 0u;
  long long v73 = 0u;
  uint64_t v55 = self;
  id v10 = self->_lostSet;
  uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v72 objects:v82 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v73;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v73 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v72 + 1) + 8 * i);
        id v15 = [v14 deepScanStamp];

        if (v15) {
          [v9 addObject:v14];
        }
      }
      uint64_t v11 = [(NSMutableSet *)v10 countByEnumeratingWithState:&v72 objects:v82 count:16];
    }
    while (v11);
  }

  unint64_t v16 = [v9 count];
  id v17 = +[BRCUserDefaults defaultsForMangledID:0];
  unint64_t v18 = [v17 lostScanDeepScanFirstThreshold];

  *a6 = v16 > v18;
  long long v68 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v19 = [(BRCAccountSession *)v55->super._session appLibraries];
  uint64_t v20 = [v19 countByEnumeratingWithState:&v68 objects:v81 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v69;
    do
    {
      for (uint64_t j = 0; j != v20; ++j)
      {
        if (*(void *)v69 != v21) {
          objc_enumerationMutation(v19);
        }
        __int16 v23 = *(void **)(*((void *)&v68 + 1) + 8 * j);
        if (([v23 state] & 8) != 0) {
          [v9 addObject:v23];
        }
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v68 objects:v81 count:16];
    }
    while (v20);
  }

  if ([v9 count])
  {
    uint64_t v24 = brc_bread_crumbs();
    uint64_t v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSReader _fetchNextLostItemID:parentID:appLibraryRowID:tooManyScans:stamp:]();
    }
  }
  if (![v9 count])
  {
    id v31 = [MEMORY[0x1E4FBA908] rawInjection:"1" length:1];
    uint64_t v32 = 0;
LABEL_45:
    uint64_t v48 = [(BRCAccountSession *)v55->super._session clientDB];
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke;
    v57[3] = &unk_1E6999D40;
    uint64_t v34 = v31;
    v60 = &v76;
    v61 = a5;
    __int16 v62 = a3;
    v63 = a4;
    uint64_t v58 = v34;
    v59 = v55;
    [v48 performWithFlags:v32 action:v57];

    v49 = v77;
    *a7 = v77[3];
    BOOL v33 = v49[3] != 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v27 = v58;
    goto LABEL_46;
  }
  lostSet = v55->_lostSet;
  uint64_t v27 = v9;
  id v28 = lostSet;
  if (v27 == v28)
  {
    BOOL v33 = 0;
    uint64_t v34 = v27;
LABEL_46:

    goto LABEL_47;
  }
  char v29 = v28;
  if (v28) {
    char v30 = [(NSMutableSet *)v27 isEqual:v28];
  }
  else {
    char v30 = 0;
  }

  if (!(v30 & 1 | (v16 > v18)))
  {
    if ([(NSMutableSet *)v27 count] == 1)
    {
      __int16 v35 = (void *)MEMORY[0x1E4FBA8F8];
      id v36 = [(NSMutableSet *)v27 anyObject];
      uint64_t v37 = [v36 dbRowID];
      id v31 = [v35 formatInjection:@"app_library_rowid != %@", v37];

      uint64_t v32 = 0;
    }
    else
    {
      uint64_t v38 = objc_msgSend(MEMORY[0x1E4F28E78], "stringWithFormat:", @"app_library_rowid NOT IN (");
      long long v66 = 0u;
      long long v67 = 0u;
      long long v64 = 0u;
      long long v65 = 0u;
      char v39 = v27;
      uint64_t v40 = [(NSMutableSet *)v39 countByEnumeratingWithState:&v64 objects:v80 count:16];
      if (v40)
      {
        uint64_t v41 = 0;
        uint64_t v42 = *(void *)v65;
        do
        {
          uint64_t v43 = 0;
          uint64_t v44 = -v41;
          uint64_t v56 = v41 + v40;
          do
          {
            if (*(void *)v65 != v42) {
              objc_enumerationMutation(v39);
            }
            v45 = *(void **)(*((void *)&v64 + 1) + 8 * v43);
            if (v44 != v43) {
              [v38 appendString:@", "];
            }
            __int16 v46 = [v45 dbRowID];
            [v38 appendFormat:@"%@", v46];

            ++v43;
          }
          while (v40 != v43);
          uint64_t v40 = [(NSMutableSet *)v39 countByEnumeratingWithState:&v64 objects:v80 count:16];
          uint64_t v41 = v56;
        }
        while (v40);
      }

      [v38 appendString:@""]);
      v47 = (void *)MEMORY[0x1E4FBA908];
      id v36 = v38;
      id v31 = objc_msgSend(v47, "rawInjection:length:", objc_msgSend(v36, "UTF8String"), objc_msgSend(v36, "length"));
      uint64_t v32 = 2;
    }

    goto LABEL_45;
  }
  BOOL v33 = 0;
LABEL_47:

  _Block_object_dispose(&v76, 8);
  return v33;
}

uint64_t __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  int32_t v3 = (void *)[a2 fetch:@"SELECT zone_rowid, item_id, item_parent_zone_rowid, item_parent_id, app_library_rowid, item_processing_stamp FROM client_items WHERE item_state IN (-1,-3)  AND %@ ORDER BY item_processing_stamp LIMIT 1", *(void *)(a1 + 32)];
  if ([v3 next])
  {
    id v4 = [v3 numberAtIndex:0];
    id v5 = [v3 objectOfClass:objc_opt_class() atIndex:1];
    uint64_t v6 = [v3 numberAtIndex:2];
    unint64_t v7 = [v3 objectOfClass:objc_opt_class() atIndex:3];
    uint64_t v8 = [v3 numberAtIndex:4];
    id v9 = *(void ***)(a1 + 56);
    id v10 = *v9;
    void *v9 = (void *)v8;

    *(void *)(*(void *)(*(void *)(a1 + 48) + 8) + 24) = [v3 longLongAtIndex:5];
    uint64_t v11 = [[BRCItemGlobalID alloc] initWithZoneRowID:v4 itemID:v5];
    uint64_t v12 = *(void ***)(a1 + 64);
    id v13 = *v12;
    void *v12 = v11;

    id v14 = [[BRCItemGlobalID alloc] initWithZoneRowID:v6 itemID:v7];
    id v15 = *(void ***)(a1 + 72);
    unint64_t v16 = *v15;
    *id v15 = v14;

    [v3 close];
    id v17 = [*(id *)(*(void *)(a1 + 40) + 8) appLibraryByRowID:**(void **)(a1 + 56)];
    unint64_t v18 = v17;
    if (v17)
    {
      if (([v17 state] & 4) != 0)
      {
        if (([*(id *)(*(void *)(a1 + 40) + 96) containsObject:v18] & 1) == 0)
        {
          uint64_t v24 = brc_bread_crumbs();
          uint64_t v25 = brc_default_log();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_FAULT)) {
            __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke_cold_3();
          }

          [*(id *)(a1 + 40) scheduleAppLibraryForLostScan:v18];
        }
      }
      else
      {
        __int16 v22 = brc_bread_crumbs();
        __int16 v23 = brc_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          char v26 = [**(id **)(a1 + 64) itemID];
          *(_DWORD *)buf = 138412802;
          char v30 = v18;
          __int16 v31 = 2112;
          uint64_t v32 = v26;
          __int16 v33 = 2112;
          uint64_t v34 = v22;
          _os_log_fault_impl(&dword_1D353B000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: App library %@ is not marked as needs lost, but its item %@ is!%@", buf, 0x20u);
        }
        if ([*(id *)(*(void *)(a1 + 40) + 96) containsObject:v18])
        {
          uint64_t v27 = brc_bread_crumbs();
          id v28 = brc_default_log();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
            __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke_cold_2();
          }
        }
        [v18 setStateBits:4];
      }
    }
    else
    {
      uint64_t v20 = brc_bread_crumbs();
      uint64_t v21 = brc_default_log();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke_cold_1();
      }
    }
  }

  return 1;
}

- (id)_nextLostItemIDWithBackoff:(int64_t *)a3 appLibrary:(id *)a4 now:(int64_t)a5
{
  uint64_t v156 = *MEMORY[0x1E4F143B8];
  id location = 0;
  uint64_t v144 = 0;
  char v142 = 1;
  if (a3) {
    *a3 = 0;
  }
  if (a4)
  {
    id v7 = *a4;
    *a4 = 0;
  }
  long long v140 = 0u;
  long long v141 = 0u;
  long long v138 = 0u;
  long long v139 = 0u;
  uint64_t v8 = self->_lostSet;
  uint64_t v9 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v138 objects:v155 count:16];
  v120 = self;
  v114 = a4;
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = 0;
    uint64_t v12 = 0;
    uint64_t v13 = *(void *)v139;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
    context = v8;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v139 != v13) {
          objc_enumerationMutation(v8);
        }
        unint64_t v16 = *(void **)(*((void *)&v138 + 1) + 8 * i);
        id v17 = [v16 deepScanStamp];
        unint64_t v18 = v17;
        if (v17)
        {
          uint64_t v19 = [v17 longLongValue];
          if (v19 < v14)
          {
            uint64_t v20 = v19;
            uint64_t v124 = [v16 dbRowID];

            uint64_t v21 = [BRCItemGlobalID alloc];
            __int16 v22 = [v16 defaultClientZone];
            [v22 dbRowID];
            uint64_t v23 = v10;
            uint64_t v24 = v13;
            v26 = uint64_t v25 = v11;
            uint64_t v27 = [v16 rootItemID];
            uint64_t v28 = [(BRCItemGlobalID *)v21 initWithZoneRowID:v26 itemID:v27];

            uint64_t v13 = v24;
            uint64_t v10 = v23;

            uint64_t v11 = (BRCItemGlobalID *)v28;
            uint64_t v8 = context;
            uint64_t v12 = (void *)v124;
            uint64_t v14 = v20;
          }
        }
      }
      uint64_t v10 = [(NSMutableSet *)v8 countByEnumeratingWithState:&v138 objects:v155 count:16];
    }
    while (v10);

    if (v12)
    {
      char v29 = [(BRCAccountSession *)v120->super._session appLibraryByRowID:v12];
      uint64_t v30 = [(BRCFSReader *)v120 _backoffBeforeProcessingLostItemWithStamp:v14 appLibrary:v29];

      char v31 = 0;
      goto LABEL_21;
    }
    self = v120;
  }
  else
  {

    uint64_t v11 = 0;
    uint64_t v14 = 0x7FFFFFFFFFFFFFFFLL;
  }
  uint64_t v12 = 0;
  char v31 = 1;
  if (![(NSMutableSet *)self->_lostSet count])
  {
    v115 = v11;
    goto LABEL_28;
  }
  uint64_t v30 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_21:
  uint64_t v32 = brc_bread_crumbs();
  __int16 v33 = brc_default_log();
  if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
  {
    lostSet = v120->_lostSet;
    *(_DWORD *)buf = 138413058;
    v148 = v12;
    __int16 v149 = 2048;
    uint64_t v150 = v30;
    __int16 v151 = 2112;
    uint64_t v152 = (uint64_t)lostSet;
    __int16 v153 = 2112;
    v154 = v32;
    _os_log_debug_impl(&dword_1D353B000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] next deep scan item is %@ backoff: %lld from %@%@", buf, 0x2Au);
  }

  if (v30 < 1)
  {
    contexta = 0;
    uint64_t v34 = 0;
    self = v120;
LABEL_26:
    uint64_t v35 = 0;
    uint64_t v144 = v14;
LABEL_79:
    uint64_t v11 = v11;

    objc_storeStrong(&location, v12);
    uint64_t v35 = v11;
    uint64_t v37 = v14;
    goto LABEL_80;
  }
  v115 = v11;
  self = v120;
LABEL_28:
  v136 = 0;
  v137 = 0;
  BOOL v36 = [(BRCFSReader *)self _fetchNextLostItemID:&v137 parentID:&v136 appLibraryRowID:&location tooManyScans:&v142 stamp:&v144];
  uint64_t v37 = v144;
  uint64_t v38 = v137;
  char v39 = v38;
  if (v36)
  {
    if (v37 >= v14)
    {
      uint64_t v35 = 0;
      contexta = 0;
      uint64_t v34 = 0;
    }
    else
    {
      uint64_t v117 = v37;
      uint64_t v40 = v38;
      uint64_t v41 = [(BRCAccountSession *)self->super._session clientDB];
      uint64_t v42 = [(BRCItemGlobalID *)v136 itemID];
      uint64_t v43 = [(BRCItemGlobalID *)v136 zoneRowID];
      uint64_t v34 = (void *)[v41 fetch:@"WITH RECURSIVE item_parents  (item_id, zone_rowid, item_state, item_processing_stamp, item_type) AS( SELECT item_parent_id, item_parent_zone_rowid, item_state, item_processing_stamp, item_type FROM client_items      WHERE item_id = %@ AND zone_rowid = %@  UNION ALL     SELECT li.item_parent_id, li.item_parent_zone_rowid, li.item_state, li.item_processing_stamp, li.item_type FROM client_items AS li  INNER JOIN item_parents AS p USING (item_id, zone_rowid)      WHERE +app_library_rowid = %@      LIMIT %u) SELECT item_id, zone_rowid, item_state, item_processing_stamp, item_type FROM item_parents", v42, v43, location, 1000];

      uint64_t v44 = 0;
      if ([v34 next])
      {
        v45 = v40;
        char v39 = v40;
        while (1)
        {
          contextb = (void *)MEMORY[0x1D9438760]();
          v125 = v136;

          __int16 v46 = [v34 objectOfClass:objc_opt_class() atIndex:0];
          v47 = [v34 numberAtIndex:1];
          uint64_t v48 = [[BRCItemGlobalID alloc] initWithZoneRowID:v47 itemID:v46];
          v49 = v136;
          v136 = v48;

          char v50 = [v34 unsignedIntAtIndex:2];
          v51 = [v34 numberAtIndex:3];

          v52 = v34;
          if ([v34 unsignedIntAtIndex:4] == 4)
          {
            [v34 close];

            uint64_t v35 = v45;
            uint64_t v44 = v51;
            char v39 = v125;
            goto LABEL_62;
          }
          if (v50 == -1)
          {
            v53 = v125;

            if (!v51)
            {
              v57 = brc_bread_crumbs();
              uint64_t v58 = brc_default_log();
              uint64_t v55 = contextb;
              if (os_log_type_enabled(v58, OS_LOG_TYPE_FAULT))
              {
                *(_DWORD *)buf = 138412290;
                v148 = v57;
                _os_log_fault_impl(&dword_1D353B000, v58, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Lost item should have a lostStamp%@", buf, 0xCu);
              }

              uint64_t v44 = 0;
              v54 = v53;
              goto LABEL_38;
            }
            uint64_t v44 = v51;
            uint64_t v117 = [v51 unsignedLongLongValue];
            v54 = v53;
          }
          else
          {
            v54 = v45;
            uint64_t v44 = v51;
          }
          uint64_t v55 = contextb;
LABEL_38:

          uint64_t v34 = v52;
          char v56 = [v52 next];
          v45 = v54;
          uint64_t v35 = v54;
          char v39 = v125;
          if ((v56 & 1) == 0) {
            goto LABEL_62;
          }
        }
      }
      char v39 = v40;
      uint64_t v35 = v40;
LABEL_62:
      contexta = v44;
      if (v35 == v137)
      {
        uint64_t v37 = v117;
        self = v120;
      }
      else
      {
        uint64_t v37 = v117;
        self = v120;
        if (v117 > v144)
        {
          v126 = v39;
          long long v70 = v35;
          v110 = v34;
          if (v117 == 0x7FFFFFFFFFFFFFFFLL) {
            uint64_t v71 = 0x7FFFFFFFFFFFFFFFLL;
          }
          else {
            uint64_t v71 = v117 + 1;
          }
          long long v72 = [(BRCAccountSession *)v120->super._session clientDB];
          long long v73 = [(BRCItemGlobalID *)v137 itemID];
          long long v74 = [(BRCItemGlobalID *)v137 zoneRowID];
          [v72 execute:@"UPDATE client_items SET item_processing_stamp = %lld WHERE item_id = %@ AND zone_rowid = %@", v71, v73, v74];

          long long v75 = brc_bread_crumbs();
          uint64_t v76 = brc_default_log();
          if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
            -[BRCFSReader _nextLostItemIDWithBackoff:appLibrary:now:].cold.4();
          }

          v77 = [(BRCAccountSession *)v120->super._session clientDB];
          uint64_t v78 = [v77 changes];

          self = v120;
          if (v78 != 1)
          {
            v108 = brc_bread_crumbs();
            v109 = brc_default_log();
            if (os_log_type_enabled(v109, OS_LOG_TYPE_FAULT)) {
              -[BRCFSReader _nextLostItemIDWithBackoff:appLibrary:now:]();
            }

            uint64_t v37 = v117;
            self = v120;
          }
          uint64_t v79 = [(BRCAccountSession *)self->super._session appLibraryByRowID:location];
          uint64_t v35 = v70;
          if ([v79 maxLostStamp] < v71)
          {
            [v79 setMaxLostStamp:v71];
            [v79 setNeedsSave:1];
          }

          uint64_t v34 = v110;
          char v39 = v126;
        }
      }
    }
  }
  else
  {
    v59 = brc_bread_crumbs();
    v60 = brc_default_log();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSReader _nextLostItemIDWithBackoff:appLibrary:now:].cold.5(&v142);
    }

    if (!v142)
    {
      uint64_t v118 = v37;
      long long v134 = 0u;
      long long v135 = 0u;
      long long v132 = 0u;
      long long v133 = 0u;
      v61 = [(NSMutableSet *)self->_lostSet allObjects];
      uint64_t v62 = [v61 countByEnumeratingWithState:&v132 objects:v146 count:16];
      if (v62)
      {
        uint64_t v63 = v62;
        uint64_t v64 = *(void *)v133;
        do
        {
          for (uint64_t j = 0; j != v63; ++j)
          {
            if (*(void *)v133 != v64) {
              objc_enumerationMutation(v61);
            }
            long long v66 = *(void **)(*((void *)&v132 + 1) + 8 * j);
            long long v67 = [v66 deepScanStamp];

            if (!v67) {
              [v66 clearStateBits:2052];
            }
          }
          uint64_t v63 = [v61 countByEnumeratingWithState:&v132 objects:v146 count:16];
        }
        while (v63);
      }

      uint64_t v37 = v118;
      self = v120;
    }
    uint64_t v35 = 0;
    if (v31)
    {
      int v68 = 0;
      contexta = 0;
      uint64_t v34 = 0;
      goto LABEL_75;
    }
    contexta = 0;
    uint64_t v34 = 0;
  }
  int v68 = 1;
LABEL_75:

  if (!v68)
  {
    v102 = 0;
    uint64_t v11 = v115;
    goto LABEL_110;
  }
  uint64_t v11 = v115;
  if (!v35 || v14 < v37)
  {
    if (v35) {
      goto LABEL_79;
    }
    goto LABEL_26;
  }
LABEL_80:
  char v127 = v35;
  if (!location)
  {
    char v104 = brc_bread_crumbs();
    uint64_t v105 = brc_default_log();
    if (os_log_type_enabled(v105, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _nextLostItemIDWithBackoff:appLibrary:now:]();
    }
  }
  v80 = -[BRCAccountSession appLibraryByRowID:](self->super._session, "appLibraryByRowID:");
  int64_t v81 = [(BRCFSReader *)self _backoffBeforeProcessingLostItemWithStamp:v37 appLibrary:v80];
  if (!v81)
  {
    v82 = [(BRCAccountSession *)self->super._session lostItemThrottle];
    uint64_t v83 = [(BRCItemGlobalID *)v127 itemID];
    int64_t v81 = objc_msgSend(v82, "nsecsToNextRetry:now:increment:", objc_msgSend(v80, "throttleHashWithItemID:", v83), a5, 0);

    if (v81 == 0x7FFFFFFFFFFFFFFFLL)
    {
      v106 = brc_bread_crumbs();
      v107 = brc_default_log();
      if (os_log_type_enabled(v107, OS_LOG_TYPE_FAULT)) {
        -[BRCFSReader _nextLostItemIDWithBackoff:appLibrary:now:]();
      }
    }
    self = v120;
  }
  if (a3) {
    *a3 = v81;
  }
  if (v114) {
    objc_storeStrong(v114, v80);
  }
  id v84 = v127;
  if (!v142)
  {
    v111 = v34;
    v119 = (void *)v37;
    v116 = v11;
    long long v130 = 0u;
    long long v131 = 0u;
    long long v128 = 0u;
    long long v129 = 0u;
    id v85 = [(NSMutableSet *)self->_lostSet allObjects];
    uint64_t v86 = [v85 countByEnumeratingWithState:&v128 objects:v145 count:16];
    if (v86)
    {
      uint64_t v87 = v86;
      uint64_t v88 = *(void *)v129;
      do
      {
        for (uint64_t k = 0; k != v87; ++k)
        {
          if (*(void *)v129 != v88) {
            objc_enumerationMutation(v85);
          }
          v90 = *(void **)(*((void *)&v128 + 1) + 8 * k);
          id v91 = [v90 deepScanStamp];
          if (v91)
          {
          }
          else
          {
            uint64_t v92 = [v90 maxLostStamp];
            if (v92 < v144)
            {
              uint64_t v93 = [v80 dbRowID];
              if (v93
                && (int v94 = (void *)v93, v95 = [v90 isEqualToAppLibrary:v80], v94, v95))
              {
                char v96 = brc_bread_crumbs();
                int v97 = brc_default_log();
                if (os_log_type_enabled(v97, OS_LOG_TYPE_FAULT))
                {
                  uint64_t v101 = [v90 maxLostStamp];
                  *(_DWORD *)buf = 138413058;
                  v148 = v90;
                  __int16 v149 = 2048;
                  uint64_t v150 = v101;
                  __int16 v151 = 2048;
                  uint64_t v152 = v144;
                  __int16 v153 = 2112;
                  v154 = v96;
                  _os_log_fault_impl(&dword_1D353B000, v97, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@: maxLostStamp(%lld) must be greater than the shallowestLostStamp(%lld)!%@", buf, 0x2Au);
                }

                [v90 setMaxLostStamp:v144];
                [v90 setNeedsSave:1];
              }
              else
              {
                id v98 = brc_bread_crumbs();
                __int16 v99 = brc_default_log();
                if (os_log_type_enabled(v99, OS_LOG_TYPE_DEBUG))
                {
                  uint64_t v100 = [v90 maxLostStamp];
                  *(_DWORD *)buf = 134218754;
                  v148 = v119;
                  __int16 v149 = 2048;
                  uint64_t v150 = v100;
                  __int16 v151 = 2112;
                  uint64_t v152 = (uint64_t)v90;
                  __int16 v153 = 2112;
                  v154 = v98;
                  _os_log_debug_impl(&dword_1D353B000, v99, OS_LOG_TYPE_DEBUG, "[DEBUG] shallowestLostStamp %lld > max lost stamp %lld for %@%@", buf, 0x2Au);
                }

                [v90 clearStateBits:2052];
              }
            }
          }
        }
        uint64_t v87 = [v85 countByEnumeratingWithState:&v128 objects:v145 count:16];
      }
      while (v87);
    }

    uint64_t v11 = v116;
    uint64_t v34 = v111;
    id v84 = v127;
  }
  uint64_t v35 = v84;

  v102 = v35;
LABEL_110:

  return v102;
}

- (void)_processLostItem:(id)a3
{
  id v10 = a3;
  id v4 = +[BRCItemToPathLookup lookupForItem:](BRCItemToPathLookup, "lookupForItem:");
  id v5 = [v4 byFileSystemID];
  if (v5)
  {
    [(BRCFSReader *)self _processLostItem:v10 resolvedToPath:v5];
  }
  else if ([v10 isDocument] && objc_msgSend(v4, "fileSystemIDMayStillExist"))
  {
    uint64_t v6 = [v10 st];
    id v7 = [v6 documentID];
    uint64_t v8 = [v7 unsignedIntValue];
    uint64_t v9 = [v10 serverZone];
    [(BRCFSReader *)self _resolveDocumentID:v8 zone:v9];
  }
  else
  {
    [(BRCFSReader *)self _processDeadItem:v10];
  }
  [v4 closePaths];
}

- (void)_recoverFromUnknownParentLoopAtPath:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 type] == 6)
  {
    id v5 = [BRCRelativePath alloc];
    uint64_t v6 = [v4 parentFileID];
    id v7 = [v4 session];
    uint64_t v8 = [(BRCRelativePath *)v5 initWithFileID:v6 session:v7];

    int v16 = 0;
    if ([(BRCRelativePath *)v8 resolveAndKeepOpenMustExist:1 error:&v16])
    {
      uint64_t v9 = +[BRCPathToItemLookup lookupForRelativePath:v8];
      id v10 = [v9 byFileIDGlobally];
      uint64_t v11 = [v10 asDirectory];

      [(BRCRelativePath *)v8 close];
      if (v11)
      {
        uint64_t v12 = brc_bread_crumbs();
        uint64_t v13 = brc_default_log();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          unint64_t v18 = v11;
          __int16 v19 = 2112;
          uint64_t v20 = v12;
          _os_log_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEFAULT, "[WARNING] Found parent item which clearly needs to be scanned %@%@", buf, 0x16u);
        }

        [v11 markLostClearGenerationID:1 backoffMode:0];
        [v11 saveToDB];
      }
      else
      {
        uint64_t v14 = brc_bread_crumbs();
        id v15 = brc_default_log();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSReader _recoverFromUnknownParentLoopAtPath:]();
        }

        [(BRCFSReader *)self _recoverFromUnknownParentLoopAtPath:v8];
      }
    }
    else
    {
      uint64_t v9 = brc_bread_crumbs();
      uint64_t v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT)) {
        -[BRCFSReader _recoverFromUnknownParentLoopAtPath:]();
      }
    }
  }
  else
  {
    uint64_t v8 = [v4 appLibrary];
    [(BRCRelativePath *)v8 scheduleDeepScanWithReason:@"unknown parent loop"];
  }
}

- (void)_processLostItem:(id)a3 resolvedToPath:(id)a4
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._schedulerWorkloop);
  if (self->_currentScan)
  {
    uint64_t v32 = brc_bread_crumbs();
    __int16 v33 = brc_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _processLostItem:resolvedToPath:].cold.4();
    }
  }
  if (([v7 exists] & 1) == 0)
  {
    uint64_t v34 = brc_bread_crumbs();
    uint64_t v35 = brc_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _processLostItem:resolvedToPath:]();
    }
  }
  uint64_t v8 = +[BRCPathToItemLookup lookupForRelativePath:v7];
  if ([v6 isDocument])
  {
    uint64_t v9 = [v6 asDocument];
    [v8 setByDocumentID:v9];
  }
  else
  {
    [v8 setByFileID:v6];
  }
  id v10 = [v8 parentItem];
  uint64_t v11 = [v10 itemID];

  if (v11)
  {
    uint64_t v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      char v29 = [v8 parentItem];
      uint64_t v30 = [v29 itemID];
      *(_DWORD *)buf = 138413058;
      id v39 = v6;
      __int16 v40 = 2112;
      id v41 = v7;
      __int16 v42 = 2112;
      uint64_t v43 = v30;
      __int16 v44 = 2112;
      v45 = v12;
      _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] located lost item %@ at %@ under parent %@%@", buf, 0x2Au);
    }
    if ([v6 needsSyncUp])
    {
      uint64_t v14 = [v6 clientZone];
      [v14 scheduleSyncUp];
    }
    id v36 = v7;
    id v37 = v8;
    [(BRCFSReader *)self updateLookupAfterHandlingPathMatchWithFSRoot:&v37 relpath:&v36];
    id v15 = v37;

    id v16 = v36;
    unint64_t lostItemCountUnderUnknownParent = self->_lostItemCountUnderUnknownParent;
    if (lostItemCountUnderUnknownParent) {
      self->_unint64_t lostItemCountUnderUnknownParent = lostItemCountUnderUnknownParent - 1;
    }
    if (v15)
    {
      if ([v16 isSymLink])
      {
        [(BRCFSReader *)self fseventOnSymlink:v16 flags:0 lookup:v15];
      }
      else if ([v16 isBRAlias])
      {
        [(BRCFSReader *)self fseventOnAlias:v16 flags:0 lookup:v15];
      }
      else if (([v16 isDocument] & 1) != 0 || objc_msgSend(v6, "isDocument"))
      {
        [(BRCFSReader *)self fseventOnDocument:v16 flags:0 options:2 lookup:v15];
      }
      else
      {
        char v31 = [v6 asDirectory];
        [(BRCFSReader *)self _scanDirectory:v31 atPath:v16 lookup:v15];
      }
    }
    else
    {
      uint64_t v27 = brc_bread_crumbs();
      uint64_t v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSReader _processLostItem:resolvedToPath:]();
      }

      id v15 = 0;
    }
  }
  else
  {
    unint64_t v18 = brc_bread_crumbs();
    __int16 v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v39 = v6;
      __int16 v40 = 2112;
      id v41 = v7;
      __int16 v42 = 2112;
      uint64_t v43 = v18;
      _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] located lost item %@ at %@ under unknown parent%@", buf, 0x20u);
    }

    [v6 markLostClearGenerationID:0 backoffMode:2];
    [v6 saveToDB];
    unint64_t v20 = self->_lostItemCountUnderUnknownParent + 1;
    self->_unint64_t lostItemCountUnderUnknownParent = v20;
    uint64_t v21 = [v6 appLibrary];
    __int16 v22 = [v21 mangledID];
    uint64_t v23 = +[BRCUserDefaults defaultsForMangledID:v22];
    unint64_t v24 = [v23 lostItemUnderUnknownParentBeforeDeepScan];

    if (v20 > v24)
    {
      uint64_t v25 = brc_bread_crumbs();
      char v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        -[BRCFSReader _processLostItem:resolvedToPath:]();
      }

      self->_unint64_t lostItemCountUnderUnknownParent = 0;
      [(BRCFSReader *)self _recoverFromUnknownParentLoopAtPath:v7];
    }
    id v15 = v8;
    id v16 = v7;
  }
}

- (void)_resolveDocumentID:(unsigned int)a3 zone:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = v6;
  if (v4)
  {
    uint64_t v8 = [v6 session];
    uint64_t v9 = [v8 volume];
    [v9 deviceID];
    uint64_t v10 = GSLibraryResolveDocumentId2();

    uint64_t v11 = __error();
    if (v10)
    {
LABEL_12:
      [(BRCFSReader *)self _didResolvedDocumentID:v4 fileID:v10 zone:v7];
      goto LABEL_22;
    }
  }
  else
  {
    uint64_t v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _resolveDocumentID:zone:]();
    }

    *__error() = 2;
    uint64_t v11 = __error();
  }
  int v14 = *v11;
  if (*v11 == 70 || v14 == 2)
  {
    id v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      int v23 = 67109634;
      int v24 = v4;
      __int16 v25 = 1024;
      int v26 = v14;
      __int16 v27 = 2112;
      uint64_t v28 = v15;
      _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] GSLibraryResolveDocumentId(%u) %{errno}d%@", (uint8_t *)&v23, 0x18u);
    }

    uint64_t v10 = 0;
    goto LABEL_12;
  }
  id v17 = brc_bread_crumbs();
  unint64_t v18 = brc_default_log();
  if (os_log_type_enabled(v18, (os_log_type_t)0x90u))
  {
    int v23 = 67109634;
    int v24 = v4;
    __int16 v25 = 1024;
    int v26 = v14;
    __int16 v27 = 2112;
    uint64_t v28 = v17;
    _os_log_error_impl(&dword_1D353B000, v18, (os_log_type_t)0x90u, "[ERROR] GSLibraryResolveDocumentId(%u) %{errno}d%@", (uint8_t *)&v23, 0x18u);
  }

  if (v14 != 4 && v14 != 16 && v14 != 78)
  {
    __int16 v19 = brc_bread_crumbs();
    unint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _resolveDocumentID:zone:]();
    }
  }
  uint64_t v21 = [v7 clientZone];
  __int16 v22 = [v21 itemByDocumentID:v4];

  [v22 markLostClearGenerationID:0 backoffMode:2];
  [v22 saveToDB];

LABEL_22:
}

- (void)_didResolvedDocumentID:(unsigned int)a3 fileID:(unint64_t)a4 zone:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  memset(v31, 0, sizeof(v31));
  __brc_create_section(0, (uint64_t)"-[BRCFSReader _didResolvedDocumentID:fileID:zone:]", 2242, v31);
  uint64_t v9 = brc_bread_crumbs();
  uint64_t v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    int v26 = "YES";
    *(_DWORD *)buf = 134219010;
    if (!a4) {
      int v26 = "NO";
    }
    *(void *)__int16 v33 = v31[0];
    *(_WORD *)&v33[8] = 1024;
    *(_DWORD *)&v33[10] = v6;
    *(_WORD *)&v33[14] = 2048;
    *(void *)&v33[16] = a4;
    *(_WORD *)&v33[24] = 2080;
    *(void *)&v33[26] = v26;
    __int16 v34 = 2112;
    uint64_t v35 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx resolved documentID:%u to fileID:%llu exists:%s%@", buf, 0x30u);
  }

  int v30 = 0;
  uint64_t v11 = [v8 clientZone];
  uint64_t v12 = [v11 itemByDocumentID:v6];

  if (!v12)
  {
    brc_bread_crumbs();
    id v15 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();
    unint64_t v18 = brc_default_log();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
LABEL_15:

LABEL_16:
LABEL_36:
      id v15 = 0;
      goto LABEL_37;
    }
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)__int16 v33 = v6;
    *(_WORD *)&v33[4] = 2048;
    *(void *)&v33[6] = a4;
    *(_WORD *)&v33[14] = 2112;
    *(void *)&v33[16] = v15;
    __int16 v19 = "[DEBUG] located documentID:%u at fileID:%llu but can't find item%@";
    unint64_t v20 = v18;
    uint32_t v21 = 28;
LABEL_41:
    _os_log_debug_impl(&dword_1D353B000, v20, OS_LOG_TYPE_DEBUG, v19, buf, v21);
    goto LABEL_15;
  }
  if (([v12 isLost] & 1) == 0)
  {
    brc_bread_crumbs();
    id v15 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();
    unint64_t v18 = brc_default_log();
    if (!os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_15;
    }
    *(_DWORD *)buf = 138412802;
    *(void *)__int16 v33 = v12;
    *(_WORD *)&v33[8] = 2048;
    *(void *)&v33[10] = a4;
    *(_WORD *)&v33[18] = 2112;
    *(void *)&v33[20] = v15;
    __int16 v19 = "[DEBUG] located %@ at fileID:%llu but item isn't lost%@";
    unint64_t v20 = v18;
    uint32_t v21 = 32;
    goto LABEL_41;
  }
  if (!a4)
  {
    brc_bread_crumbs();
    id v15 = (BRCRelativePath *)objc_claimAutoreleasedReturnValue();
    __int16 v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSReader _didResolvedDocumentID:fileID:zone:]();
    }
LABEL_33:

LABEL_34:
LABEL_35:
    [(BRCFSReader *)self _processDeadItem:v12];
    goto LABEL_36;
  }
  uint64_t v13 = [BRCRelativePath alloc];
  int v14 = [v8 session];
  id v15 = [(BRCRelativePath *)v13 initWithFileID:a4 session:v14];

  if (![(BRCRelativePath *)v15 resolveAndKeepOpenMustExist:1 error:&v30])
  {
    if ([(BRCRelativePath *)v15 isUnresolvableDueToProtection]
      || v30 == 2 && ![(BRCRelativePath *)v15 isExcluded])
    {
      int v23 = brc_bread_crumbs();
      int v24 = brc_default_log();
      if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
      {
LABEL_39:

        [v12 markLostClearGenerationID:0 backoffMode:2];
        [v12 saveToDB];
        [(BRCRelativePath *)v15 close];
        goto LABEL_16;
      }
      *(_DWORD *)buf = 138412802;
      *(void *)__int16 v33 = v12;
      *(_WORD *)&v33[8] = 2048;
      *(void *)&v33[10] = a4;
      *(_WORD *)&v33[18] = 2112;
      *(void *)&v33[20] = v23;
      __int16 v25 = "[DEBUG] resolved %@ to a stale fileID (%lld), retrying later%@";
LABEL_43:
      _os_log_debug_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEBUG, v25, buf, 0x20u);
      goto LABEL_39;
    }
    __int16 v22 = brc_bread_crumbs();
    uint64_t v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)__int16 v33 = self;
      *(_WORD *)&v33[8] = 2048;
      *(void *)&v33[10] = a4;
      *(_WORD *)&v33[18] = 1024;
      *(_DWORD *)&v33[20] = v30;
      *(_WORD *)&v33[24] = 2112;
      *(void *)&v33[26] = v22;
      _os_log_debug_impl(&dword_1D353B000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] resolved %@ to an inaccessible fileID (%lld) %{errno}d%@", buf, 0x26u);
    }

    goto LABEL_33;
  }
  if (![(BRCRelativePath *)v15 isDocument])
  {
    __int16 v27 = brc_bread_crumbs();
    uint64_t v28 = brc_default_log();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)__int16 v33 = v12;
      *(_WORD *)&v33[8] = 2112;
      *(void *)&v33[10] = v15;
      *(_WORD *)&v33[18] = 2112;
      *(void *)&v33[20] = v27;
      _os_log_debug_impl(&dword_1D353B000, v28, OS_LOG_TYPE_DEBUG, "[DEBUG] relocated %@ to %@ which isn't a document%@", buf, 0x20u);
    }

    [v12 scanParentDirectory];
    [(BRCRelativePath *)v15 close];
    goto LABEL_34;
  }
  if ([(BRCRelativePath *)v15 documentID] != v6)
  {
    int v23 = brc_bread_crumbs();
    int v24 = brc_default_log();
    if (!os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG)) {
      goto LABEL_39;
    }
    *(_DWORD *)buf = 138412802;
    *(void *)__int16 v33 = v12;
    *(_WORD *)&v33[8] = 2112;
    *(void *)&v33[10] = v15;
    *(_WORD *)&v33[18] = 2112;
    *(void *)&v33[20] = v23;
    __int16 v25 = "[DEBUG] relocated %@ to %@ which just changed documentID%@";
    goto LABEL_43;
  }
  id v16 = brc_bread_crumbs();
  id v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)__int16 v33 = v12;
    *(_WORD *)&v33[8] = 2112;
    *(void *)&v33[10] = v15;
    *(_WORD *)&v33[18] = 2112;
    *(void *)&v33[20] = v16;
    _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] relocated %@ to %@%@", buf, 0x20u);
  }

  if (!v15) {
    goto LABEL_35;
  }
  [(BRCFSReader *)self _processLostItem:v12 resolvedToPath:v15];
  [(BRCRelativePath *)v15 close];
LABEL_37:

  __brc_leave_section(v31);
}

- (void)_processDeadItem:(id)a3
{
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._schedulerWorkloop);
  id v5 = brc_bread_crumbs();
  uint64_t v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSReader _processDeadItem:]();
  }

  [v4 markRemovedFromFilesystemForServerEdit:0];
  [v4 saveToDB];
}

- (void)_scanDone:(id)a3 atPath:(id)a4 lookup:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 byPath];
  int v12 = [(BRCFSReader *)self needsLookupReloadAfterHandlingCrossZoneMoveWithItem:v8 relpath:v9];
  if (v12 != 4)
  {
    if (v12 == 2)
    {

      uint64_t v13 = [v10 byFileID];

      if (v13)
      {
        __int16 v22 = brc_bread_crumbs();
        int v23 = brc_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT)) {
          -[BRCFSReader fseventOnSymlink:flags:lookup:].cold.5();
        }
      }
      [(BRCFSReader *)self fseventOnDirectory:v9 flags:131073 lookup:v10];
      id v8 = 0;
    }
    else
    {
      int v14 = [v10 parentItem];
      id v15 = [v14 itemGlobalID];
      char v16 = [v8 updateFromFSAtPath:v9 parentGlobalID:v15];

      if (v16)
      {
        if (v11 && v11 != v8)
        {
          [v11 markLostWhenReplacedByItem:v8];
          [v11 saveToDB];
        }
        [v8 markFound];
        [v8 markNeedsUploadOrSyncingUp];
        long long v26 = 0u;
        long long v27 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        id v17 = objc_msgSend(v8, "clientZonesChildrenNeedingSyncUpAreIn", 0);
        uint64_t v18 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
        if (v18)
        {
          uint64_t v19 = v18;
          uint64_t v20 = *(void *)v25;
          do
          {
            uint64_t v21 = 0;
            do
            {
              if (*(void *)v25 != v20) {
                objc_enumerationMutation(v17);
              }
              [*(id *)(*((void *)&v24 + 1) + 8 * v21++) scheduleSyncUp];
            }
            while (v19 != v21);
            uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
          }
          while (v19);
        }

        [v8 saveToDB];
      }
      else
      {
        [(BRCFSReader *)self reset];
      }
    }
  }
}

- (void)_scanDirectory:(id)a3 atPath:(id)a4 lookup:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._schedulerWorkloop);
  if (self->_currentScan)
  {
    uint64_t v13 = brc_bread_crumbs();
    int v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _scanDirectory:atPath:lookup:].cold.4();
    }
  }
  if (([v9 isUnixDir] & 1) == 0)
  {
    id v15 = brc_bread_crumbs();
    char v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _scanDirectory:atPath:lookup:]();
    }
  }
  if (([v9 exists] & 1) == 0)
  {
    id v17 = brc_bread_crumbs();
    uint64_t v18 = brc_default_log();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _processLostItem:resolvedToPath:]();
    }
  }
  if (([v8 isDirectory] & 1) == 0)
  {
    uint64_t v19 = brc_bread_crumbs();
    uint64_t v20 = brc_default_log();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _scanDirectory:atPath:lookup:]();
    }
  }
  [v8 _updatePropagatedInfoFromFSAtPath:v9];
  if ([v8 diffAgainstOriginalItem]) {
    [v8 saveToDB];
  }
  [v8 markChildrenLost];
  if ([v8 changedAtRelativePath:v9 scanPackage:1])
  {
    [v8 markLostClearGenerationID:0 backoffMode:0];
    [v8 saveToDB];
    if (![(BRCFSReader *)self _slowScanDirectoryAtPath:v9]) {
      [v8 markLostClearGenerationID:0 backoffMode:2];
    }
  }
  else
  {
    id v11 = brc_bread_crumbs();
    int v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      int v21 = 138412802;
      id v22 = v8;
      __int16 v23 = 2112;
      id v24 = v9;
      __int16 v25 = 2112;
      long long v26 = v11;
      _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] %@ hasn't changed at %@%@", (uint8_t *)&v21, 0x20u);
    }

    [(BRCFSReader *)self _scanDone:v8 atPath:v9 lookup:v10];
  }
}

- (BOOL)_slowScanDirectoryAtPath:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._schedulerWorkloop);
  if (self->_currentScan)
  {
    int v12 = brc_bread_crumbs();
    uint64_t v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _scanDirectory:atPath:lookup:].cold.4();
    }
  }
  if (([v4 isUnixDir] & 1) == 0)
  {
    int v14 = brc_bread_crumbs();
    id v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _scanDirectory:atPath:lookup:]();
    }
  }
  if (([v4 exists] & 1) == 0)
  {
    char v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _processLostItem:resolvedToPath:]();
    }
  }
  int v18 = 0;
  if (([v4 resolveAndKeepOpenMustExist:1 error:&v18] & 1) == 0)
  {
    id v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = v4;
      __int16 v21 = 1024;
      int v22 = v18;
      __int16 v23 = 2112;
      id v24 = v7;
      _os_log_error_impl(&dword_1D353B000, v8, (os_log_type_t)0x90u, "[ERROR] failed opening %@ %{errno}d%@", buf, 0x1Cu);
    }

    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _slowScanDirectoryAtPath:]();
    }
    goto LABEL_13;
  }
  id v5 = [v4 appLibrary];

  if (!v5)
  {
    [v4 close];
    id v9 = brc_bread_crumbs();
    id v10 = brc_default_log();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _slowScanDirectoryAtPath:]();
    }
LABEL_13:

    BOOL v6 = 0;
    goto LABEL_14;
  }
  [(BRCFSReader *)self _startScanOfRelpath:v4];
  [v4 close];
  BOOL v6 = 1;
LABEL_14:

  return v6;
}

- (void)_startScanOfRegularAppLibrary:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._schedulerWorkloop);
  if (!self->_currentScan)
  {
    if (v4) {
      goto LABEL_3;
    }
    goto LABEL_27;
  }
  char v31 = brc_bread_crumbs();
  uint64_t v32 = brc_default_log();
  if (os_log_type_enabled(v32, OS_LOG_TYPE_FAULT)) {
    -[BRCFSReader _scanDirectory:atPath:lookup:].cold.4();
  }

  if (!v4)
  {
LABEL_27:
    __int16 v33 = brc_bread_crumbs();
    __int16 v34 = brc_default_log();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_FAULT)) {
      -[BRCItemID(CKConversions) structureRecordIDForItemType:zone:aliasTargetZoneIsShared:]();
    }
  }
LABEL_3:
  id v5 = [v4 deepScanStamp];

  if (!v5)
  {
    uint64_t v35 = brc_bread_crumbs();
    uint64_t v36 = brc_default_log();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _startScanOfRegularAppLibrary:]();
    }
  }
  if ([v4 isiCloudDesktopAppLibrary])
  {
    id v37 = brc_bread_crumbs();
    uint64_t v38 = brc_default_log();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _startScanOfRegularAppLibrary:]();
    }
  }
  BOOL v6 = [v4 root];
  id v7 = [v4 pathRelativeToRoot];
  id v8 = [v6 pathWithChildAtPath:v7];

  int v41 = 0;
  id v9 = [v4 fetchRootItem];
  id v10 = [v9 itemID];
  if (([v10 isNonDesktopRoot] & 1) == 0)
  {
    id v39 = brc_bread_crumbs();
    __int16 v40 = brc_default_log();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _startScanOfRegularAppLibrary:]();
    }
  }
  id v11 = [v9 clientZone];
  int v12 = [v4 fileID];
  [v4 markChildrenLostForItemID:v10 inZone:v11 fileID:v12];

  if ([v8 resolveAndKeepOpenMustExist:0 error:&v41])
  {
    if ([v8 exists])
    {
      uint64_t v13 = [v8 appLibrary];
      int v14 = [v13 isEqualToAppLibrary:v4];

      if (v14)
      {
        [(BRCFSReader *)self _slowScanDirectoryAtPath:v8];
LABEL_19:
        [v8 close];
        goto LABEL_20;
      }
      __int16 v21 = [v8 appLibrary];
      int v22 = [v21 appLibraryID];
      __int16 v23 = [v4 appLibraryID];
      uint64_t v24 = [v22 caseInsensitiveCompare:v23];

      if (!v24)
      {
        uint64_t v27 = brc_bread_crumbs();
        uint64_t v28 = brc_default_log();
        if (os_log_type_enabled(v28, (os_log_type_t)0x90u))
        {
          int v30 = [v8 appLibrary];
          *(_DWORD *)buf = 138412802;
          *(void *)uint64_t v43 = v4;
          *(_WORD *)&v43[8] = 2112;
          *(void *)&v43[10] = v30;
          *(_WORD *)&v43[18] = 2112;
          *(void *)&v43[20] = v27;
          _os_log_error_impl(&dword_1D353B000, v28, (os_log_type_t)0x90u, "[ERROR] Not slow scanning an app library %@ which differs only in case from %@%@", buf, 0x20u);
        }
        [v4 updateFromFSAtPath:v8];
        goto LABEL_19;
      }
      uint64_t v25 = brc_bread_crumbs();
      long long v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT))
      {
        uint64_t v29 = [v8 appLibrary];
        *(_DWORD *)buf = 138412802;
        *(void *)uint64_t v43 = v29;
        *(_WORD *)&v43[8] = 2112;
        *(void *)&v43[10] = v4;
        *(_WORD *)&v43[18] = 2112;
        *(void *)&v43[20] = v25;
        _os_log_fault_impl(&dword_1D353B000, v26, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: app libraries differ in db row id %@ vs %@%@", buf, 0x20u);
      }
      int v18 = [v4 defaultClientZone];
      uint64_t v19 = v18;
      id v20 = @"different-libraries";
    }
    else
    {
      int v18 = [v4 defaultClientZone];
      uint64_t v19 = v18;
      id v20 = @"start-scan";
    }
    [v18 scheduleResetServerAndClientTruthsForReason:v20];

    goto LABEL_19;
  }
  id v15 = brc_bread_crumbs();
  char v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT))
  {
    *(_DWORD *)buf = 67109634;
    *(_DWORD *)uint64_t v43 = v41;
    *(_WORD *)&v43[4] = 2112;
    *(void *)&v43[6] = v8;
    *(_WORD *)&v43[14] = 2112;
    *(void *)&v43[16] = v15;
    _os_log_fault_impl(&dword_1D353B000, v16, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: we should always be able to resolve under the root, since it's kept open %{errno}d\n   path: %@%@", buf, 0x1Cu);
  }

  id v17 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F592A8] code:76 userInfo:0];
  [(BRCAccountSession *)self->super._session dbBecameCorruptedWithDescription:@"Couldn't resolve app library under root" error:v17];

LABEL_20:
}

- (void)_finishedScanWithError:(int)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = [(BRCAsyncDirectoryEnumerator *)self->_currentScan rootPath];
  BOOL v6 = [(BRCAsyncDirectoryEnumerator *)self->_currentScan rootPath];
  id v7 = [v6 appLibrary];

  if (a3)
  {
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v23 = 138412802;
      uint64_t v24 = v5;
      __int16 v25 = 1024;
      int v26 = a3;
      __int16 v27 = 2112;
      uint64_t v28 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed scan at %@ %{errno}d%@", (uint8_t *)&v23, 0x1Cu);
    }

    id v10 = +[BRCPathToItemLookup lookupForRelativePath:v5];
    id v11 = [v10 byFileIDGlobally];
    int v12 = [v11 asDirectory];

    [v12 markLostClearGenerationID:0 backoffMode:2];
    [v12 saveToDB];
    [(BRCFSReader *)self _finishCurrentRelpathScan];
  }
  else if (v5)
  {
    if ([v5 type] == 2 || objc_msgSend(v5, "type") == 3)
    {
      uint64_t v13 = [v7 fetchRootItem];
      [v7 updateFromFSAtPath:v5];
      int v14 = [v13 itemID];
      char v15 = [v14 isNonDesktopRoot];

      if ((v15 & 1) == 0) {
        [(BRCFSReader *)self _scanDone:v13 atPath:v5 lookup:0];
      }
    }
    else
    {
      uint64_t v13 = +[BRCPathToItemLookup lookupForRelativePath:v5];
      char v16 = [v13 byFileIDGlobally];
      id v17 = [v16 asDirectory];

      if (v17)
      {
        int v18 = [v13 parentItem];
        uint64_t v19 = [v18 itemID];

        if (v19) {
          [(BRCFSReader *)self _scanDone:v17 atPath:v5 lookup:v13];
        }
      }
    }
    id v20 = [(BRCAsyncDirectoryEnumerator *)self->_currentScan rootPath];

    if (v20)
    {
      __int16 v21 = brc_bread_crumbs();
      int v22 = brc_default_log();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSReader _finishedScanWithError:]();
      }

      [(BRCFSReader *)self _finishCurrentRelpathScan];
    }
  }
}

- (void)_startScanOfRelpath:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAccountSession *)self->super._session clientDB];
  [v5 assertOnQueue];

  BOOL v6 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v7 = (int)[v6 readerScanBatchSize];

  if (self->_currentScan)
  {
    char v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_FAULT)) {
      -[BRCFSReader _processLostItem:resolvedToPath:].cold.4();
    }
  }
  id v8 = [BRCAsyncDirectoryEnumerator alloc];
  id v9 = [(BRCAccountSession *)self->super._session clientDB];
  id v10 = [v9 serialQueue];
  id v11 = [(BRCAsyncDirectoryEnumerator *)v8 initForEnumeratingBelow:v4 recursive:0 batchSize:v7 targetQueue:v10];
  currentScan = self->_currentScan;
  self->_currentScan = v11;

  uint64_t v13 = brc_bread_crumbs();
  int v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSReader _startScanOfRelpath:]();
  }

  [(BRCFairSource *)self->_lostScanSource suspend];
  char v15 = self->_currentScan;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = __35__BRCFSReader__startScanOfRelpath___block_invoke;
  v19[3] = &unk_1E6999D68;
  v19[4] = self;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __35__BRCFSReader__startScanOfRelpath___block_invoke_88;
  uint64_t v18[3] = &unk_1E6999D90;
  void v18[4] = self;
  [(BRCAsyncDirectoryEnumerator *)v15 scheduleWithProcessBlock:v19 completion:v18];
}

uint64_t __35__BRCFSReader__startScanOfRelpath___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  uint64_t v7 = *(void **)(a1 + 32);
  if ((id)v7[11] == v5 && ([v7 isCancelled] & 1) == 0)
  {
    id v10 = [v5 rootPath];
    id v11 = [v10 appLibrary];

    if (([*(id *)(a1 + 32) isCancelled] & 1) == 0
      && v11
      && ([*(id *)(*(void *)(a1 + 32) + 96) containsObject:v11] & 1) != 0)
    {
      int v12 = [v11 db];
      v17[0] = MEMORY[0x1E4F143A8];
      v17[1] = 3221225472;
      v17[2] = __35__BRCFSReader__startScanOfRelpath___block_invoke_86;
      v17[3] = &unk_1E6995AD0;
      id v13 = v6;
      uint64_t v14 = *(void *)(a1 + 32);
      id v18 = v13;
      uint64_t v19 = v14;
      [v12 groupInBatch:v17];

      uint64_t v8 = 1;
    }
    else
    {
      char v15 = brc_bread_crumbs();
      char v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        __35__BRCFSReader__startScanOfRelpath___block_invoke_cold_1();
      }

      [*(id *)(a1 + 32) _cancelScan];
      uint64_t v8 = 0;
    }
  }
  else
  {
    uint64_t v8 = 0;
  }

  return v8;
}

void __35__BRCFSReader__startScanOfRelpath___block_invoke_86(uint64_t a1, void *a2)
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v13 = a2;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v3 = *(id *)(a1 + 32);
  uint64_t v4 = [v3 countByEnumeratingWithState:&v15 objects:v27 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v16;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v16 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(void **)(*((void *)&v15 + 1) + 8 * v7);
        id v9 = (void *)MEMORY[0x1D9438760]();
        int v14 = 0;
        if ([v8 resolveAndKeepOpenMustExist:1 error:&v14])
        {
          [*(id *)(a1 + 40) fseventAtPath:v8 flags:0];
          [v8 close];
        }
        else
        {
          id v10 = brc_bread_crumbs();
          id v11 = brc_default_log();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
          {
            int v12 = [*(id *)(*(void *)(a1 + 40) + 88) rootPath];
            *(_DWORD *)buf = 138413058;
            id v20 = v8;
            __int16 v21 = 2112;
            int v22 = v12;
            __int16 v23 = 1024;
            int v24 = v14;
            __int16 v25 = 2112;
            int v26 = v10;
            _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] can't resolve child %@ of %@ %{errno}d%@", buf, 0x26u);
          }
        }
        ++v7;
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v15 objects:v27 count:16];
    }
    while (v5);
  }
}

void __35__BRCFSReader__startScanOfRelpath___block_invoke_88(uint64_t a1, uint64_t a2, int a3)
{
  uint64_t v4 = *(void **)(a1 + 32);
  if (v4[11] == a2 && ([v4 isCancelled] & 1) == 0)
  {
    uint64_t v6 = [*(id *)(*(void *)(a1 + 32) + 88) rootPath];
    uint64_t v7 = [v6 appLibrary];

    uint64_t v8 = [v7 db];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    _DWORD v9[2] = __35__BRCFSReader__startScanOfRelpath___block_invoke_2;
    v9[3] = &unk_1E6997EE8;
    v9[4] = *(void *)(a1 + 32);
    int v10 = a3;
    [v8 groupInBatch:v9];
  }
}

uint64_t __35__BRCFSReader__startScanOfRelpath___block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) _finishedScanWithError:*(unsigned int *)(a1 + 40)];
}

- (void)_finishCurrentRelpathScan
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _currentScan%@", v2, v3, v4, v5, v6);
}

- (void)_cancelScan
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(v1 + 88) rootPath];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] cancelling scan of %@%@", v4);
}

- (void)_lostScanSchedule
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┳%llx cancelling lost scan delay%@", (void)v3, DWORD2(v3));
}

void __32__BRCFSReader__lostScanSchedule__block_invoke(uint64_t a1)
{
  uint64_t v2 = *(void *)(*(void *)(a1 + 32) + 136);
  long long v5 = *(_OWORD *)(*(void *)(a1 + 32) + 120);
  uint64_t v6 = v2;
  long long v3 = brc_bread_crumbs();
  uint64_t v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __32__BRCFSReader__lostScanSchedule__block_invoke_cold_1();
  }

  *(void *)(*(void *)(a1 + 32) + 120) = 0;
  objc_msgSend(*(id *)(*(void *)(a1 + 32) + 104), "signal", v5, v6);
  __brc_leave_section((uint64_t *)&v5);
}

void __32__BRCFSReader__lostScanSchedule__block_invoke_90(id *a1)
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = (void *)*((void *)a1[4] + 1);
  long long v3 = [a1[5] zoneRowID];
  uint64_t v4 = [v2 serverZoneByRowID:v3];
  long long v5 = [v4 clientZone];

  uint64_t v6 = [a1[5] itemID];
  uint64_t v7 = [v5 itemByItemID:v6];

  uint64_t v8 = brc_bread_crumbs();
  id v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    id v36 = v7;
    if (!v7) {
      id v36 = a1[6];
    }
    int v42 = 138412546;
    uint64_t v43 = v36;
    __int16 v44 = 2112;
    id v45 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] lost scanning %@%@", (uint8_t *)&v42, 0x16u);
  }

  if (([v7 isFSRoot] & 1) != 0
    || ([a1[5] itemID], int v10 = objc_claimAutoreleasedReturnValue(), v10, !v10))
  {
    int v14 = [*((id *)a1[4] + 1) appLibraryScanThrottle];
    objc_msgSend(v14, "incrementRetryCount:", objc_msgSend(a1[6], "hash"));

    long long v15 = [a1[5] itemID];

    if (v15)
    {
      long long v16 = [*((id *)a1[4] + 1) lostItemThrottle];
      id v17 = a1[6];
      long long v18 = [a1[5] itemID];
      objc_msgSend(v16, "incrementRetryCount:", objc_msgSend(v17, "throttleHashWithItemID:", v18));

      uint64_t v19 = [v7 asFSRoot];
      id v20 = [v19 appLibrary];
      id v21 = a1[6];

      if (v20 == v21)
      {
        int v30 = [v7 itemID];
        char v31 = [a1[6] rootItemID];
        char v32 = [v30 isEqualToItemID:v31];

        if (v32)
        {
          if (![a1[6] isiCloudDesktopAppLibrary])
          {
            [a1[4] _startScanOfRegularAppLibrary:a1[6]];
            goto LABEL_28;
          }
          if (([v7 isLost] & 1) == 0) {
            [v7 markLostClearGenerationID:0 backoffMode:1];
          }
          goto LABEL_6;
        }
        __int16 v34 = brc_bread_crumbs();
        uint64_t v35 = brc_default_log();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT))
        {
          id v40 = a1[6];
          int v41 = [v40 fetchRootItem];
          int v42 = 138413058;
          uint64_t v43 = v7;
          __int16 v44 = 2112;
          id v45 = v40;
          __int16 v46 = 2112;
          v47 = v41;
          __int16 v48 = 2112;
          v49 = v34;
          _os_log_fault_impl(&dword_1D353B000, v35, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: we got an fsroot %@ that's not a root of its applibrary %@ - %@%@", (uint8_t *)&v42, 0x2Au);
        }
        int v24 = [a1[6] defaultClientZone];
        __int16 v25 = v24;
        int v26 = @"fsroot doesn't match app library root";
      }
      else
      {
        int v22 = brc_bread_crumbs();
        __int16 v23 = brc_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_FAULT))
        {
          id v37 = [v7 asFSRoot];
          uint64_t v38 = [v37 appLibrary];
          id v39 = a1[6];
          int v42 = 138412802;
          uint64_t v43 = v38;
          __int16 v44 = 2112;
          id v45 = v39;
          __int16 v46 = 2112;
          v47 = v22;
          _os_log_fault_impl(&dword_1D353B000, v23, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: wrong applibrary for fsroot %@ vs %@%@", (uint8_t *)&v42, 0x20u);
        }
        int v24 = [a1[6] defaultClientZone];
        __int16 v25 = v24;
        int v26 = @"wrong applibrary for fsroot";
      }
      [v24 scheduleResetServerAndClientTruthsForReason:v26];
    }
    else
    {
      if (![a1[6] isiCloudDesktopAppLibrary])
      {
        __int16 v25 = brc_bread_crumbs();
        __int16 v33 = brc_default_log();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
          __32__BRCFSReader__lostScanSchedule__block_invoke_90_cold_1();
        }
        goto LABEL_22;
      }
      id v27 = a1[6];
      uint64_t v28 = [v27 root];
      [v27 updateFromFSAtPath:v28];

      id v29 = a1[4];
      __int16 v25 = [a1[6] root];
      [v29 fseventAtPath:v25 flags:0];
    }
LABEL_27:

    goto LABEL_28;
  }
  if (!v7)
  {
    __int16 v25 = brc_bread_crumbs();
    __int16 v33 = brc_default_log();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
      __32__BRCFSReader__lostScanSchedule__block_invoke_90_cold_2();
    }
LABEL_22:

    goto LABEL_27;
  }
  id v11 = [*((id *)a1[4] + 1) lostItemThrottle];
  id v12 = a1[6];
  id v13 = [a1[5] itemID];
  objc_msgSend(v11, "incrementRetryCount:", objc_msgSend(v12, "throttleHashWithItemID:", v13));

LABEL_6:
  [a1[4] _processLostItem:v7];
LABEL_28:
}

- (void)unscheduleAppLibraryForLostScan:(id)a3
{
  id v4 = a3;
  if ([(NSMutableSet *)self->_lostSet containsObject:v4])
  {
    [(NSMutableSet *)self->_lostSet removeObject:v4];
    long long v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSReader unscheduleAppLibraryForLostScan:]();
    }

    uint64_t v7 = [(BRCAsyncDirectoryEnumerator *)self->_currentScan rootPath];
    uint64_t v8 = [v7 appLibrary];
    int v9 = [v8 isEqualToAppLibrary:v4];

    if (v9) {
      [(BRCFSReader *)self _cancelScan];
    }
    if (![(NSMutableSet *)self->_lostSet count])
    {
      int v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSReader unscheduleAppLibraryForLostScan:]();
      }

      dispatch_group_leave((dispatch_group_t)self->_lostScanGroup);
    }
  }
}

- (void)scheduleAppLibraryForLostScan:(id)a3
{
  id v4 = a3;
  if (![(NSMutableSet *)self->_lostSet count])
  {
    dispatch_group_enter((dispatch_group_t)self->_lostScanGroup);
    long long v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSReader scheduleAppLibraryForLostScan:]();
    }
  }
  if (([(NSMutableSet *)self->_lostSet containsObject:v4] & 1) == 0)
  {
    [(NSMutableSet *)self->_lostSet addObject:v4];
    uint64_t v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSReader scheduleAppLibraryForLostScan:]();
    }
  }
  int v9 = brc_bread_crumbs();
  int v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSReader scheduleAppLibraryForLostScan:]();
  }

  [(BRCFairSource *)self->_lostScanSource signal];
}

- (BOOL)thumbnailChangedForItem:(id)a3 relpath:(id)a4 url:(id)a5 error:(id *)a6
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  int v10 = (char *)a3;
  id v11 = a4;
  id v12 = a5;
  objc_msgSend(MEMORY[0x1E4F28CA0], "__itemAtURL:didChangeWithPurposeID:", v12, @"com.apple.bird");
  memset(v46, 0, sizeof(v46));
  __brc_create_section(0, (uint64_t)"-[BRCFSReader thumbnailChangedForItem:relpath:url:error:]", 2783, v46);
  id v13 = brc_bread_crumbs();
  int v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    __int16 v48 = (const char *)v46[0];
    __int16 v49 = 2112;
    uint64_t v50 = v10;
    __int16 v51 = 2112;
    id v52 = v13;
    _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx thumbnail changed for %@%@", buf, 0x20u);
  }

  int v15 = [v11 exists] ^ 1;
  if (!v10) {
    LOBYTE(v15) = 1;
  }
  if ((v15 & 1) == 0)
  {
    if ([v10 isDocument])
    {
      long long v16 = [v10 clientZone];
      id v17 = [v10 itemID];
      id v18 = [v16 serverItemByItemID:v17];

      uint64_t v19 = [v10 asDocument];
      id v20 = [v19 currentVersion];
      id v21 = [v20 ckInfo];
      int v22 = [v21 etag];

      __int16 v23 = [v18 latestVersion];
      int v24 = [v23 ckInfo];
      __int16 v25 = [v24 etag];

      [v10 triggerNotificationIfNeeded];
      int v26 = [v10 asDocument];
      id v27 = [v26 desiredVersion];
      LODWORD(v24) = [v27 wantsThumbnail];

      if (v24)
      {
        uint64_t v28 = brc_bread_crumbs();
        id v29 = brc_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSReader thumbnailChangedForItem:relpath:url:error:]();
        }
      }
      else
      {
        uint64_t v35 = [v10 asDocument];
        int v36 = [v35 shouldTransferThumbnail];

        if (v36)
        {
          if (v22 && [v25 isEqualToString:v22])
          {
            id v37 = [v10 clientZone];
            uint64_t v38 = [v37 db];
            v42[0] = MEMORY[0x1E4F143A8];
            v42[1] = 3221225472;
            v42[2] = __57__BRCFSReader_thumbnailChangedForItem_relpath_url_error___block_invoke;
            v42[3] = &unk_1E6993FC0;
            uint64_t v43 = v10;
            __int16 v44 = self;
            id v45 = v11;
            [v38 groupInBatch:v42];

            uint64_t v28 = v43;
LABEL_32:

            BOOL v34 = 1;
            goto LABEL_33;
          }
          uint64_t v28 = brc_bread_crumbs();
          id v29 = brc_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            __int16 v48 = (const char *)v22;
            __int16 v49 = 2112;
            uint64_t v50 = (const char *)v25;
            __int16 v51 = 2112;
            id v52 = v28;
            _os_log_debug_impl(&dword_1D353B000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] Not clearing thumbnail signature when we don't have the most up-to-date version %@ vs %@%@", buf, 0x20u);
          }
        }
        else
        {
          uint64_t v28 = brc_bread_crumbs();
          id v29 = brc_default_log();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
            -[BRCFSReader thumbnailChangedForItem:relpath:url:error:]();
          }
        }
      }

      goto LABEL_32;
    }
    objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 21);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (v18)
    {
      char v32 = brc_bread_crumbs();
      __int16 v33 = brc_default_log();
      if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
      {
        int v41 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        __int16 v48 = "-[BRCFSReader thumbnailChangedForItem:relpath:url:error:]";
        __int16 v49 = 2080;
        if (!a6) {
          int v41 = "(ignored by caller)";
        }
        uint64_t v50 = v41;
        __int16 v51 = 2112;
        id v52 = v18;
        __int16 v53 = 2112;
        v54 = v32;
        _os_log_error_impl(&dword_1D353B000, v33, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }
    }
    if (a6) {
      goto LABEL_20;
    }
LABEL_21:
    BOOL v34 = 0;
    goto LABEL_33;
  }
  objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", 2);
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  if (v18)
  {
    int v30 = brc_bread_crumbs();
    char v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      id v40 = "(passed to caller)";
      *(_DWORD *)buf = 136315906;
      __int16 v48 = "-[BRCFSReader thumbnailChangedForItem:relpath:url:error:]";
      __int16 v49 = 2080;
      if (!a6) {
        id v40 = "(ignored by caller)";
      }
      uint64_t v50 = v40;
      __int16 v51 = 2112;
      id v52 = v18;
      __int16 v53 = 2112;
      v54 = v30;
      _os_log_debug_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] %s: %s error: %@%@", buf, 0x2Au);
    }
  }
  if (!a6) {
    goto LABEL_21;
  }
LABEL_20:
  id v18 = v18;
  BOOL v34 = 0;
  *a6 = v18;
LABEL_33:

  __brc_leave_section(v46);
  return v34;
}

void __57__BRCFSReader_thumbnailChangedForItem_relpath_url_error___block_invoke(uint64_t a1)
{
  id v4 = [*(id *)(a1 + 32) asDocument];
  [v4 clearVersionSignatures:2 isPackage:0];
  uint64_t v2 = objc_msgSend(MEMORY[0x1E4F1C9B8], "brc_pendingPlaceholderForPackage:", 0);
  [v4 setLiveThumbnailSignature:v2];

  if ([v4 needsUpload])
  {
    long long v3 = [*(id *)(*(void *)(a1 + 40) + 8) fsUploader];
    [v3 uploadItem:v4];
  }
  [v4 saveToDB];
  [*(id *)(a1 + 40) fseventAtPath:*(void *)(a1 + 48) flags:0];
}

- (unint64_t)recoverAndReportMissingJobs
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v3 = [(BRCAccountSession *)self->super._session clientDB];
  id v4 = (void *)[v3 fetch:@"SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_doc_id, ci.item_file_id, ci.item_generation, ci.item_localname, ci.item_processing_stamp, ci.item_staged_file_id, ci.item_staged_generation, ci.item_bouncedname, ci.item_scope, ci.item_tmpbounceno, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.desired_version, ci.item_live_conflict_loser_etags, ci.item_thumb_live_signature, ci.item_thumb_greedy, ci.version_block_sync_until_bundle_id, ci.version_block_sync_until_timestamp FROM client_items AS ci WHERE ci.item_localsyncupstate = 2 AND ci.item_localsyncupstate != 0 AND NOT EXISTS (SELECT 1 FROM client_reader_throttle AS reader WHERE ci.rowid = reader.throttle_id AND reader.throttle_state != 0)"];

  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __42__BRCFSReader_recoverAndReportMissingJobs__block_invoke;
  uint64_t v18[3] = &unk_1E6994120;
  void v18[4] = self;
  long long v5 = [v4 enumerateObjects:v18];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    LODWORD(v8) = 0;
    uint64_t v9 = *(void *)v20;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v20 != v9) {
          objc_enumerationMutation(v5);
        }
        uint64_t v11 = *(void *)(*((void *)&v19 + 1) + 8 * v10);
        id v12 = (void *)MEMORY[0x1D9438760]();
        [(BRCFSReader *)self createReadingJobForItem:v11 state:1];
        ++v10;
      }
      while (v7 != v10);
      uint64_t v8 = (v8 + v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v7);

    id v13 = brc_bread_crumbs();
    int v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
      [(BRCFSReader *)(uint64_t)v13 recoverAndReportMissingJobs];
    }

    [(BRCFSReader *)self schedule];
  }
  else
  {

    uint64_t v8 = 0;
  }
  id v15 = +[AppTelemetryTimeSeriesEvent newMissingReaderJobEventWithNumberMissing:v8];
  long long v16 = [(BRCAccountSession *)self->super._session analyticsReporter];
  [v16 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v15];

  return (int)v8;
}

id __42__BRCFSReader_recoverAndReportMissingJobs__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a2;
  uint64_t v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (BRCFSReader)initWithAccountSession:(id)a3
{
  id v4 = a3;
  v22.receiver = self;
  v22.super_class = (Class)BRCFSReader;
  id v5 = [(BRCFSSchedulerBase *)&v22 initWithSession:v4 name:@"Reader" tableName:@"client_reader_throttle"];
  if (v5)
  {
    uint64_t v6 = objc_alloc_init(BRCCountedSet);
    coordinatedReaders = v5->_coordinatedReaders;
    v5->_coordinatedReaders = v6;

    uint64_t v8 = objc_opt_new();
    lostSet = v5->_lostSet;
    v5->_lostSet = (NSMutableSet *)v8;

    dispatch_group_t v10 = dispatch_group_create();
    lostScanGroup = v5->_lostScanGroup;
    v5->_lostScanGroup = (OS_dispatch_group *)v10;

    objc_initWeak(&location, v5);
    id v12 = [BRCFairSource alloc];
    id v13 = [(BRCAccountSession *)v5->super._session fairClientDBScheduler];
    uint64_t v14 = [(BRCFairSource *)v12 initWithName:@"lost-scan" scheduler:v13];
    lostScanSource = v5->_lostScanSource;
    v5->_lostScanSource = (BRCFairSource *)v14;

    [(BRCFairSource *)v5->_lostScanSource setWorkloop:v5->super._schedulerWorkloop];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = __38__BRCFSReader_initWithAccountSession___block_invoke;
    v19[3] = &unk_1E6993C50;
    objc_copyWeak(&v20, &location);
    [(BRCFairSource *)v5->_lostScanSource setEventHandler:v19];
    uint64_t v16 = brc_task_tracker_create("com.apple.brc.fs.reader");
    taskTracker = v5->_taskTracker;
    v5->_taskTracker = (brc_task_tracker *)v16;

    objc_destroyWeak(&v20);
    objc_destroyWeak(&location);
  }

  return v5;
}

void __38__BRCFSReader_initWithAccountSession___block_invoke(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _lostScanSchedule];
}

- (void)reset
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  long long v3 = [(BRCAccountSession *)self->super._session clientDB];
  [v3 assertOnQueue];

  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCFSReader reset]", 2881, v17);
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v10 = v17[0];
    uint64_t v11 = objc_opt_class();
    *(_DWORD *)buf = 134218498;
    uint64_t v20 = v10;
    __int16 v21 = 2112;
    objc_super v22 = v11;
    __int16 v23 = 2112;
    uint64_t v24 = v4;
    id v12 = v11;
    _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx resetting the %@%@", buf, 0x20u);
  }
  if (self->_currentScan) {
    [(BRCFSReader *)self _cancelScan];
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v6 = [(BRCAccountSession *)self->super._session fsEventsMonitors];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        [*(id *)(*((void *)&v13 + 1) + 8 * v9++) resetWithReason:@"reader reset"];
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v18 count:16];
    }
    while (v7);
  }

  __brc_leave_section(v17);
}

- (void)cancel
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  OUTLINED_FUNCTION_0_0();
  id v2 = v1;
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] cancelling the %@%@", v4);
}

- (void)_close
{
  if (![(BRCFSSchedulerBase *)self isCancelled])
  {
    uint64_t v7 = brc_bread_crumbs();
    uint64_t v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_FAULT)) {
      -[BRCTransferStream close]();
    }
  }
  dispatch_assert_queue_V2((dispatch_queue_t)self->super._schedulerWorkloop);
  if (self->_currentScan) {
    [(BRCFSReader *)self _cancelScan];
  }
  lostScanDelay = self->_lostScanDelay;
  if (lostScanDelay)
  {
    dispatch_source_cancel(lostScanDelay);
    id v4 = self->_lostScanDelay;
    self->_lostScanDelay = 0;
  }
  lostScanSource = self->_lostScanSource;
  if (lostScanSource)
  {
    if (!self->_resumed)
    {
      [(BRCFairSource *)lostScanSource resume];
      lostScanSource = self->_lostScanSource;
    }
    self->_lostScanSource = 0;
  }
  brc_task_tracker_wait((uint64_t)self->_taskTracker);
  if (self->_readerCountReachedMax)
  {
    coordinatedReaders = self->_coordinatedReaders;
    self->_coordinatedReaders = 0;

    self->_readerCountReachedMax = 0;
    [(BRCFSReader *)self resume];
  }
  v9.receiver = self;
  v9.super_class = (Class)BRCFSReader;
  [(BRCFSSchedulerBase *)&v9 _close];
}

- (void)suspend
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] suspending reader%@", v2, v3, v4, v5, v6);
}

- (void)resume
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] resuming reader%@", v2, v3, v4, v5, v6);
}

void __21__BRCFSReader_resume__block_invoke(uint64_t a1)
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) clientDB];
  uint64_t v3 = (void *)[v2 fetch:@"SELECT zone_rowid, app_library_rowid FROM mark_children_lost_progress GROUP BY zone_rowid, app_library_rowid"];

  if ([v3 next])
  {
    uint64_t v20 = v22;
    *(void *)&long long v4 = 138412290;
    long long v19 = v4;
    do
    {
      uint64_t v5 = (void *)MEMORY[0x1D9438760]();
      uint8_t v6 = [v3 objectOfClass:objc_opt_class() atIndex:0];
      uint64_t v7 = [v3 objectOfClass:objc_opt_class() atIndex:1];
      uint64_t v8 = [*(id *)(*(void *)(a1 + 32) + 8) serverZoneByRowID:v6];
      objc_super v9 = [v8 clientZone];

      uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 8) appLibraryByRowID:v7];
      if (v10) {
        BOOL v11 = v9 == 0;
      }
      else {
        BOOL v11 = 1;
      }
      if (v11)
      {
        id v17 = brc_bread_crumbs();
        id v18 = brc_default_log();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = v19;
          int v26 = v17;
          _os_log_fault_impl(&dword_1D353B000, v18, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: appLibrary && zone%@", buf, 0xCu);
        }
      }
      id v12 = *(void **)(*(void *)(a1 + 32) + 144);
      long long v13 = objc_msgSend(v10, "db", v19, v20);
      long long v14 = [v13 serialQueue];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v22[0] = __21__BRCFSReader_resume__block_invoke_139;
      v22[1] = &unk_1E6993628;
      id v23 = v10;
      id v24 = v9;
      id v15 = v9;
      id v16 = v10;
      brc_task_tracker_async_with_logs(v12, v14, v21, &__block_literal_global_50);
    }
    while (([v3 next] & 1) != 0);
  }
}

void __21__BRCFSReader_resume__block_invoke_139(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) db];
  v3[0] = MEMORY[0x1E4F143A8];
  v3[1] = 3221225472;
  v3[2] = __21__BRCFSReader_resume__block_invoke_2;
  v3[3] = &unk_1E6995AD0;
  id v4 = *(id *)(a1 + 32);
  id v5 = *(id *)(a1 + 40);
  [v2 groupInBatch:v3];
}

uint64_t __21__BRCFSReader_resume__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) continueMarkingChildrenLostInZone:*(void *)(a1 + 40)];
}

- (void)dealloc
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Reader dealloced with containers still in the lost heap%@", v2, v3, v4, v5, v6);
}

- (OS_dispatch_group)lostScanGroup
{
  return self->_lostScanGroup;
}

- (brc_task_tracker)taskTracker
{
  return self->_taskTracker;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_lostScanGroup, 0);
  objc_storeStrong((id *)&self->_taskTracker, 0);
  objc_storeStrong((id *)&self->_lostScanDelay, 0);
  objc_storeStrong((id *)&self->_lostScanSource, 0);
  objc_storeStrong((id *)&self->_lostSet, 0);
  objc_storeStrong((id *)&self->_currentScan, 0);
  objc_storeStrong((id *)&self->_coordinatedReaders, 0);
}

- (void)_attemptSchedulingCoordinatedReadForItem:path:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] attempting to schedule a coordinated read on item: %@%@");
}

- (void)_scheduleReadJobWithID:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 itemID];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] %@ is lost and isn't pending-lost in the reader queue%@", v4);
}

- (void)_scheduleReadJobWithID:.cold.2()
{
  OUTLINED_FUNCTION_8();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 itemID];
  OUTLINED_FUNCTION_0_0();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ isn't needs reading, and is in the reader queue%@", v3, 0x16u);
}

void __38__BRCFSReader__scheduleReadJobWithID___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: item.isDocument%@", v2, v3, v4, v5, v6);
}

- (void)startReadCoordinationInAppLibrary:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [*v1 totalCount];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v2, "[DEBUG] Reader: reached maximum allowed number of coordinations (%ld)%@", v3);
}

- (void)endReadCoordinationInAppLibrary:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  [*v1 totalCount];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v2, "[DEBUG] Reader: below half maximum allowed number of coordinations (%ld)%@", v3);
}

- (void)endReadCoordinationInAppLibrary:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: [_coordinatedReaders containsObject:appLibrary]%@", v2, v3, v4, v5, v6);
}

- (void)readUnderCoordinationWithLookup:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: something is wrong, we got a coordinated inside a package%@", v2, v3, v4, v5, v6);
}

- (void)readUnderCoordinationWithLookup:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] ignoring coordinated read without any corresponding items%@", v2, v3, v4, v5, v6);
}

- (void)readUnderCoordinationWithLookup:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] item is busy on disk, we must give up reading the file for now%@", v2, v3, v4, v5, v6);
}

- (void)readUnderCoordinationWithLookup:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] item has unscanned changes on disk, reading the file%@", v2, v3, v4, v5, v6);
}

- (void)readUnderCoordinationWithLookup:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: -updateLocationAndMetaFromFSAtPath should always work on documents%@", v2, v3, v4, v5, v6);
}

- (void)readUnderCoordinationWithLookup:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] nothing to read%@", v2, v3, v4, v5, v6);
}

- (void)readUnderCoordinationWithLookup:.cold.7()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] ignoring coordinated read without a live item%@", v2, v3, v4, v5, v6);
}

- (void)readUnderCoordinationWithLookup:.cold.8()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] item is missing, let's mark it lost%@", v2, v3, v4, v5, v6);
}

- (void)readUnderCoordinationWithLookup:(NSObject *)a3 .cold.9(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [a1 byPathRelpath];
  int v7 = 138412546;
  uint64_t v8 = v5;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, a3, v6, "[DEBUG] there is nothing to read at %@%@", (uint8_t *)&v7);
}

- (void)lookupAndReadItemUnderCoordinationAtURL:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _session.clientDB.isBatchSuspended%@", v2, v3, v4, v5, v6);
}

- (void)updateLookupAfterHandlingPathMatchWithFSRoot:relpath:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: after bouncing to a unique path, we still have match!%@", v2, v3, v4, v5, v6);
}

- (void)updateLookupAfterHandlingPathMatchWithFSRoot:relpath:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] We need to bounce a document clashing with our FS root%@", v2, v3, v4, v5, v6);
}

- (void)updateLookupAfterHandlingPathMatchWithFSRoot:relpath:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] We need to bounce a directory clashing with our FS root%@", v2, v3, v4, v5, v6);
}

- (void)fseventAtPath:flags:unresolvedLastPathComponent:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: relpath%@", v2, v3, v4, v5, v6);
}

- (void)fseventAtPath:flags:options:unresolvedLastPathComponent:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Ignoring FSEvent in unknown container%@", v2, v3, v4, v5, v6);
}

- (void)fseventAtPath:flags:options:unresolvedLastPathComponent:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: appLibrary.isiCloudDesktopAppLibrary == NO%@", v2, v3, v4, v5, v6);
}

- (void)fseventAtPath:flags:options:unresolvedLastPathComponent:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] ignoring fsevent on %@ until the parent arrives%@");
}

- (void)fseventAtPath:flags:options:unresolvedLastPathComponent:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] can't update lookup for fs-root match on %@, ignoring fsevent%@");
}

- (void)fseventAtPath:flags:options:unresolvedLastPathComponent:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Ignoring FSEvent in container pending needs-scan: %@%@");
}

- (void)fseventRecursiveAtRoot:withReason:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: root should exist%@", v2, v3, v4, v5, v6);
}

- (void)fseventRecursiveAtRoot:withReason:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: root.type == BRCRelativePathTypeRoot || root.type == BRCRelativePathTypeDesktopOrDocuments%@", v2, v3, v4, v5, v6);
}

- (void)fseventOnContainer:flags:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 logName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] Marking container %@ as needs-scan%@", v4);
}

- (void)fseventOnSymlink:flags:lookup:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 relpathOfItem];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] Ignoring fsevent on desktop symlink path %@%@", v4);
}

- (void)fseventOnSymlink:flags:lookup:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: lookupByFileID != item%@", v2, v3, v4, v5, v6);
}

- (void)fseventOnSymlink:flags:lookup:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] byPath:%@ moved elsewhere%@");
}

- (void)fseventOnSymlink:flags:lookup:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !item || item.isOnDisk%@", v2, v3, v4, v5, v6);
}

- (void)fseventOnSymlink:flags:lookup:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: lookup.byFileID == nil%@", v2, v3, v4, v5, v6);
}

- (void)fseventOnAlias:flags:lookup:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] deleting the alias because it can't reference an item in a shared zone%@", v2, v3, v4, v5, v6);
}

- (void)fseventOnAlias:flags:lookup:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] marking alias lost because its target exists on disk but we haven't scanned it yet%@", v2, v3, v4, v5, v6);
}

- (void)fseventOnAlias:flags:lookup:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] deleting the alias because it can't be resolved%@", v2, v3, v4, v5, v6);
}

- (void)fseventOnAlias:flags:lookup:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] deleting the alias on-disk because it can't be resolved and isn't in our database%@", v2, v3, v4, v5, v6);
}

- (void)fseventOnAlias:flags:lookup:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Ignoring non-alias lookup-by-itemID %@%@");
}

- (void)itemForCreatedDocumentsDirectory:appLibrary:path:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Found the Documents folder%@", v2, v3, v4, v5, v6);
}

- (void)itemForCreatedDocumentsDirectory:appLibrary:path:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Reviving %@ because it is dead%@");
}

- (void)fseventOnDirectory:flags:lookup:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Dropping fsevent on a directory with kBundle bit set at '%@'%@");
}

- (void)fseventOnDirectory:flags:lookup:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Found reserved item clashing %@. Marking that item live.%@");
}

- (void)fseventOnDirectory:flags:lookup:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] we got a path-match with a server item: %@%@");
}

- (void)fseventOnDirectory:flags:lookup:.cold.5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] directory %@ moved elsewhere%@");
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: relpathOfItem.birthTime == lookupByFileID.st.birthtime%@", v2, v3, v4, v5, v6);
}

- (void)_fseventOnDocument:(uint64_t)a3 flags:(double)a4 options:item:lookup:unresolvedLastPathComponent:.cold.2(uint64_t a1, NSObject *a2, uint64_t a3, double a4)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  int v4 = 134218242;
  double v5 = a4;
  __int16 v6 = 2112;
  uint64_t v7 = a1;
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, a2, a3, "[DEBUG] Delaying reading item by %.03fs because it's a package%@", (uint8_t *)&v4);
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] scheduling unthrottled package item read%@", v2, v3, v4, v5, v6);
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] inserting a zero-byte file, let's mark it lost%@", v2, v3, v4, v5, v6);
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.7()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] we got a path-match with a server item during initial scan: %@%@");
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.8()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] [hardlink] this is an event about the path we knew for this item, go on%@", v2, v3, v4, v5, v6);
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.9()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] [hardlink] unable to find this hardlink at its previous path, go on%@", v2, v3, v4, v5, v6);
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.10()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Someone replaced a fault with content, clearing ETag for the version%@", v2, v3, v4, v5, v6);
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.12()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: lookup.byDocumentID == nil%@", v2, v3, v4, v5, v6);
}

- (void)_fseventOnDocument:flags:options:item:lookup:unresolvedLastPathComponent:.cold.13()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: relpathOfItem%@", v2, v3, v4, v5, v6);
}

- (void)_fetchNextLostItemID:parentID:appLibraryRowID:tooManyScans:stamp:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] app library being skipped for per-item lost scan %@%@");
}

void __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: nil app library for rowID %@%@", (void)v3, DWORD2(v3));
}

void __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: ![self->_lostSet containsObject:appLibrary]%@", v2, v3, v4, v5, v6);
}

void __80__BRCFSReader__fetchNextLostItemID_parentID_appLibraryRowID_tooManyScans_stamp___block_invoke_cold_3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: App library %@ is in needs-lost state, but missing from the lost set!%@");
}

- (void)_nextLostItemIDWithBackoff:appLibrary:now:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: backoff < BRC_TIMESTAMP_FAR_FUTURE%@", v2, v3, v4, v5, v6);
}

- (void)_nextLostItemIDWithBackoff:appLibrary:now:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: shallowestALRowID%@", v2, v3, v4, v5, v6);
}

- (void)_nextLostItemIDWithBackoff:appLibrary:now:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _session.clientDB.changes == 1%@", v2, v3, v4, v5, v6);
}

- (void)_nextLostItemIDWithBackoff:appLibrary:now:.cold.4()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Updating lost stamp for item %@%@", (void)v3, DWORD2(v3));
}

- (void)_nextLostItemIDWithBackoff:(unsigned char *)a1 appLibrary:now:.cold.5(unsigned char *a1)
{
  uint64_t v1 = @" because too many deep scans";
  if (!*a1) {
    uint64_t v1 = &stru_1F2AC7720;
  }
  LODWORD(v4) = 138412546;
  *(void *)((char *)&v4 + 4) = v1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v2, v3, "[DEBUG] Done with all normal lost scanning for now%@%@", (void)v4, DWORD2(v4));
}

- (void)_recoverFromUnknownParentLoopAtPath:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] No parent item found for path, checking parent's parent recursively %@%@");
}

- (void)_recoverFromUnknownParentLoopAtPath:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Can't resolve parent path by fileID, bailing out%@", v2, v3, v4, v5, v6);
}

- (void)_processLostItem:resolvedToPath:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: We seem to be stuck lost scanning because we are repeatedly scanning items under an unknown parent. Scheduling scan of first parent%@", v2, v3, v4, v5, v6);
}

- (void)_processLostItem:resolvedToPath:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] can't update lookup for fs-root match on %@, can't lost scan%@");
}

- (void)_processLostItem:resolvedToPath:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: relpath.exists%@", v2, v3, v4, v5, v6);
}

- (void)_processLostItem:resolvedToPath:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _currentScan == nil%@", v2, v3, v4, v5, v6);
}

- (void)_resolveDocumentID:zone:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: err == ENOSYS || err == EINTR || err == EBUSY%@", v2, v3, v4, v5, v6);
}

- (void)_resolveDocumentID:zone:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: documentID%@", v2, v3, v4, v5, v6);
}

- (void)_didResolvedDocumentID:fileID:zone:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] couldn't locate %@ per documentID: it's gone%@");
}

- (void)_processDeadItem:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] lost item %@ can't be located, it's gone%@");
}

- (void)_scanDirectory:atPath:lookup:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: item.isDirectory%@", v2, v3, v4, v5, v6);
}

- (void)_scanDirectory:atPath:lookup:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: relpath.isUnixDir%@", v2, v3, v4, v5, v6);
}

- (void)_scanDirectory:atPath:lookup:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !_currentScan%@", v2, v3, v4, v5, v6);
}

- (void)_slowScanDirectoryAtPath:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Can't scan a path with no container: %@%@");
}

- (void)_slowScanDirectoryAtPath:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: the relpath is already open, so -resolveAndKeepOpen should work%@", v2, v3, v4, v5, v6);
}

- (void)_startScanOfRegularAppLibrary:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: rootItemID.isNonDesktopRoot%@", v2, v3, v4, v5, v6);
}

- (void)_startScanOfRegularAppLibrary:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !appLibrary.isiCloudDesktopAppLibrary%@", v2, v3, v4, v5, v6);
}

- (void)_startScanOfRegularAppLibrary:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: appLibrary.deepScanStamp%@", v2, v3, v4, v5, v6);
}

- (void)_finishedScanWithError:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] finishing scan of %@%@");
}

- (void)_startScanOfRelpath:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] beginning scan of %@%@");
}

void __35__BRCFSReader__startScanOfRelpath___block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: The scan should already be cancelled%@", v2, v3, v4, v5, v6);
}

void __32__BRCFSReader__lostScanSchedule__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┳%llx scheduling lost scan after backoff%@", (void)v3, DWORD2(v3));
}

void __32__BRCFSReader__lostScanSchedule__block_invoke_90_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: no itemID for a non-iCloud Desktop all library%@", v2, v3, v4, v5, v6);
}

void __32__BRCFSReader__lostScanSchedule__block_invoke_90_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: we just got the itemID from the db, we should be able to get the item as well%@", v2, v3, v4, v5, v6);
}

- (void)unscheduleAppLibraryForLostScan:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Lost Scan: done scanning lost items in %@%@");
}

- (void)unscheduleAppLibraryForLostScan:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Lost Scan: no lost items anymore in %@%@");
}

- (void)scheduleAppLibraryForLostScan:.cold.1()
{
  OUTLINED_FUNCTION_8();
  uint64_t v5 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [v1 logName];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_5_0(&dword_1D353B000, v0, v3, "[DEBUG] %@: signaling lost scan%@", v4);
}

- (void)scheduleAppLibraryForLostScan:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Lost Scan: lost items in %@%@");
}

- (void)scheduleAppLibraryForLostScan:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Lost Scan: starting to scan lost items in %@%@");
}

- (void)thumbnailChangedForItem:relpath:url:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Not clearing the thumbnail signature, because we're still waiting for thumbnail download%@", v2, v3, v4, v5, v6);
}

- (void)thumbnailChangedForItem:relpath:url:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Not clearing the thumbnail signature, because this is a thumbnail we can regenerate%@", v2, v3, v4, v5, v6);
}

- (void)recoverAndReportMissingJobs
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Reader: Recovered from %u missing reader jobs%@", (uint8_t *)v3, 0x12u);
}

@end