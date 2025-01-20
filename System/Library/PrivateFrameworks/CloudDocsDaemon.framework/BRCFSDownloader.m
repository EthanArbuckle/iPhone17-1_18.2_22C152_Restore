@interface BRCFSDownloader
- (BOOL)_createDownloadingJobForItem:(id)a3 state:(int)a4 kind:(int)a5 etag:(id)a6 userInitiated:(BOOL)a7 stageFileName:(id)a8 error:(id *)a9;
- (BOOL)_hasLosersToDelete:(id)a3 serverItem:(id)a4;
- (BOOL)applyLosersToItem:(id)a3 serverItem:(id)a4 atURL:(id)a5 applySchedulerState:(int *)a6 addedLosers:(id)a7 removedLosers:(id)a8;
- (BOOL)applyThumbnailToItem:(id)a3 serverItem:(id)a4 atURL:(id)a5 applySchedulerState:(int *)a6;
- (BOOL)hasAdditionsToApplyForItem:(id)a3 serverItem:(id)a4;
- (BOOL)hasThumbnailToApplyForItem:(id)a3;
- (BOOL)isDownloadingItem:(id)a3;
- (BOOL)makeContentLive:(id)a3;
- (BOOL)scheduleContentDownloadForItem:(id)a3 serverItem:(id)a4 options:(unint64_t)a5 etagIfLoser:(id)a6 stageFileName:(id)a7 error:(id *)a8;
- (BOOL)shouldScheduleLosersEvictionForItem:(id)a3;
- (BRCDeadlineScheduler)downloadsDeadlineScheduler;
- (BRCFSDownloader)initWithAccountSession:(id)a3;
- (id)_getCancelErrorFromCancelReason:(int)a3;
- (id)_sanitizeRecord:(id)a3;
- (id)descriptionForItem:(id)a3 context:(id)a4;
- (id)generateContentStageFileNameForItem:(id)a3 etag:(id)a4;
- (id)generateThumbnailStageFileNameForItem:(id)a3 etag:(id)a4;
- (unint64_t)_bumpThrottleForDownload:(id)a3 throttle:(id)a4;
- (unint64_t)inFlightSize;
- (unint64_t)recoverAndReportMissingJobs;
- (unint64_t)sizeOfActiveDownloads;
- (void)_cancelJobs:(id)a3 state:(int)a4;
- (void)_clearDownloadErrorForDocument:(id)a3;
- (void)_close;
- (void)_finishDownloadCleanup:(id)a3;
- (void)_finishedDownload:(id)a3 syncContext:(id)a4 operationID:(id)a5 error:(id)a6;
- (void)_postponeLoserForWinner:(int64_t)a3 etag:(id)a4;
- (void)_reportDownloadErrorForDocument:(id)a3 error:(id)a4;
- (void)_sendContentsBatch:(id)a3 sizeHint:(int64_t)a4 maxRecordsCount:(unint64_t)a5 isLoserDownload:(BOOL)a6;
- (void)_sendLosersBatch:(id)a3 sizeHint:(int64_t)a4 maxRecordsCount:(unint64_t)a5;
- (void)_sendThumbnailsBatch:(id)a3 sizeHint:(int64_t)a4 maxRecordsCount:(unint64_t)a5;
- (void)_transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6;
- (void)_willDownload:(id)a3 operationID:(id)a4;
- (void)addAliasItem:(id)a3 toDownloadingItem:(id)a4;
- (void)cancel;
- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4;
- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5;
- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5 andNotifyDownloadTrackers:(BOOL)a6;
- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5 andNotifyDownloadTrackers:(BOOL)a6 cancelReason:(int)a7;
- (void)cancelAndCleanupItemDownloads:(id)a3;
- (void)close;
- (void)deleteJobsMatching:(id)a3;
- (void)evictLosersOnItem:(id)a3 atURL:(id)a4 applySchedulerState:(int *)a5;
- (void)performFirstSchedulingAfterStartupInDB:(id)a3;
- (void)recoverAndReportMissingJobs;
- (void)rescheduleJobsForPendingDiskSpaceWithAvailableSpace:(unint64_t)a3;
- (void)rescheduleJobsPendingRecentsAndFavoritesFetchInZone:(id)a3;
- (void)rescheduleJobsPendingWinnerForItem:(id)a3;
- (void)resume;
- (void)schedule;
- (void)scheduleLosersDownloadForItem:(id)a3 serverItem:(id)a4 purgeStaleEntries:(BOOL)a5 applySchedulerState:(int *)a6;
- (void)scheduleThumbnailDownloadForItem:(id)a3 serverItem:(id)a4 applySchedulerState:(int *)a5;
- (void)suspend;
- (void)transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6 completionBlock:(id)a7;
- (void)updateContentDownloadForMetaOnlyChange:(id)a3 fromEtag:(id)a4 toEtag:(id)a5;
@end

@implementation BRCFSDownloader

- (BOOL)isDownloadingItem:(id)a3
{
  id v3 = a3;
  v4 = [v3 desiredVersion];
  if ([v4 wantsContent])
  {
    v5 = [v3 db];
    uint64_t v6 = [v3 dbRowID];
    v7 = [v4 ckInfo];
    v8 = [v7 etag];
    v9 = (void *)[v5 numberWithSQL:@"SELECT transfer_operation IS NOT NULL FROM client_downloads WHERE throttle_id = %llu AND download_kind = %u AND download_etag = %@", v6, 0, v8];
  }
  else
  {
    v9 = 0;
  }
  char v10 = [v9 BOOLValue];

  return v10;
}

- (BOOL)hasAdditionsToApplyForItem:(id)a3 serverItem:(id)a4
{
  id v6 = a3;
  if ([(BRCFSDownloader *)self _hasLosersToDelete:v6 serverItem:a4])
  {
    char v7 = 1;
  }
  else
  {
    v8 = [(BRCAccountSession *)self->super.super._session clientDB];
    v9 = (void *)[v8 numberWithSQL:@"SELECT 1 FROM client_downloads WHERE throttle_id = %llu AND download_kind != %u AND transfer_queue = %@ LIMIT 1", objc_msgSend(v6, "dbRowID"), 0, @"_done"];

    char v7 = [v9 BOOLValue];
  }

  return v7;
}

- (void)rescheduleJobsForPendingDiskSpaceWithAvailableSpace:(unint64_t)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v52 = 0;
  v53 = &v52;
  uint64_t v54 = 0x2020000000;
  unint64_t v55 = a3;
  id v3 = self->super.super._session;
  v38 = [(BRCAccountSession *)v3 clientDB];
  v4 = +[BRCUserDefaults defaultsForMangledID:0];
  unint64_t v36 = [v4 diskSpaceRequiredToReturnToGreedyState];

  unint64_t v5 = v53[3];
  BOOL v6 = v5 >= v36;
  unint64_t v7 = v5 - v36;
  if (v6)
  {
    v53[3] = v7;
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    v13 = [(BRCAccountSession *)v3 clientDB];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = __88__BRCFSDownloader_LegacyAdditions__rescheduleJobsForPendingDiskSpaceWithAvailableSpace___block_invoke;
    v47[3] = &unk_1E6994510;
    v51 = &v52;
    v14 = v3;
    v48 = v14;
    v8 = v12;
    v49 = v8;
    id v37 = v11;
    id v50 = v37;
    v15 = (void *)MEMORY[0x1D94389C0](v47);
    [v13 execute:@"UPDATE client_downloads SET throttle_state = 1 WHERE throttle_state = 43   AND call_block(%@, transfer_size, app_library_rowid, zone_rowid)", v15];

    uint64_t v16 = [v38 changes];
    if (v16)
    {
      uint64_t v35 = v16;
      long long v45 = 0u;
      long long v46 = 0u;
      long long v43 = 0u;
      long long v44 = 0u;
      id v17 = v37;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v57 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v44;
        do
        {
          uint64_t v20 = 0;
          do
          {
            if (*(void *)v44 != v19) {
              objc_enumerationMutation(v17);
            }
            v21 = [(BRCAccountSession *)v14 appLibraryByRowID:*(void *)(*((void *)&v43 + 1) + 8 * v20)];
            v22 = [v21 transferSyncContext];
            v23 = [v22 downloadStream];
            [v23 signal];

            ++v20;
          }
          while (v18 != v20);
          uint64_t v18 = [v17 countByEnumeratingWithState:&v43 objects:v57 count:16];
        }
        while (v18);
      }

      long long v41 = 0u;
      long long v42 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      v24 = v8;
      uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v56 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v40;
        do
        {
          uint64_t v27 = 0;
          do
          {
            if (*(void *)v40 != v26) {
              objc_enumerationMutation(v24);
            }
            v28 = [(BRCAccountSession *)v14 serverZoneByRowID:*(void *)(*((void *)&v39 + 1) + 8 * v27)];
            v29 = [v28 asSharedZone];

            v30 = [v29 transferSyncContext];
            v31 = [v30 downloadStream];
            [v31 signal];

            ++v27;
          }
          while (v25 != v27);
          uint64_t v25 = [v24 countByEnumeratingWithState:&v39 objects:v56 count:16];
        }
        while (v25);
      }

      v32 = brc_bread_crumbs();
      v33 = brc_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        v34 = +[BRCDumpContext stringFromByteCount:v53[3] + v36 showActualByteCount:0 suffix:0 context:0];
        *(_DWORD *)buf = 134218498;
        uint64_t v59 = v35;
        __int16 v60 = 2112;
        v61 = v34;
        __int16 v62 = 2112;
        id v63 = v32;
        _os_log_debug_impl(&dword_1D353B000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader: scheduled %lld pending-disk throttles, which will still leave %@ of free disk space%@", buf, 0x20u);
      }
    }
  }
  else
  {
    brc_bread_crumbs();
    id v37 = (id)objc_claimAutoreleasedReturnValue();
    v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      id v9 = +[BRCDumpContext stringFromByteCount:v53[3] showActualByteCount:0 suffix:0 context:0];
      char v10 = +[BRCDumpContext stringFromByteCount:v36 showActualByteCount:0 suffix:0 context:0];
      *(_DWORD *)buf = 138412802;
      uint64_t v59 = (uint64_t)v9;
      __int16 v60 = 2112;
      v61 = v10;
      __int16 v62 = 2112;
      id v63 = v37;
      _os_log_debug_impl(&dword_1D353B000, v8, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader: not enough space to download anything (%@ < %@)%@", buf, 0x20u);
    }
  }

  _Block_object_dispose(&v52, 8);
}

void __88__BRCFSDownloader_LegacyAdditions__rescheduleJobsForPendingDiskSpaceWithAvailableSpace___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, uint64_t a4)
{
  unint64_t v7 = sqlite3_value_int64(*(sqlite3_value **)a4);
  uint64_t v8 = *(void *)(*(void *)(a1 + 56) + 8);
  unint64_t v9 = *(void *)(v8 + 24);
  BOOL v10 = v9 > v7;
  unint64_t v11 = v9 - v7;
  if (v10)
  {
    *(void *)(v8 + 24) = v11;
    id v17 = (id)[NSNumber newFromSqliteValue:*(void *)(a4 + 8)];
    id v12 = (void *)[NSNumber newFromSqliteValue:*(void *)(a4 + 16)];
    v13 = [*(id *)(a1 + 32) serverZoneByRowID:v12];
    int v14 = [v13 isSharedZone];

    uint64_t v15 = 48;
    if (v14)
    {
      uint64_t v15 = 40;
      id v16 = v12;
    }
    else
    {
      id v16 = v17;
    }
    [*(id *)(a1 + v15) addObject:v16];
    sqlite3_result_int(a2, 1);
  }
  else
  {
    sqlite3_result_int(a2, 0);
  }
}

- (BOOL)shouldScheduleLosersEvictionForItem:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [v4 liveConflictLoserEtags];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    char v7 = 1;
  }
  else
  {
    uint64_t v8 = [(BRCAccountSession *)self->super.super._session clientDB];
    unint64_t v9 = objc_msgSend(v8, "numberWithSQL:", @"SELECT 1 FROM client_downloads  WHERE throttle_id = %lld AND download_kind = %d  LIMIT 1", objc_msgSend(v4, "dbRowID"), 2);
    char v7 = [v9 BOOLValue];
  }
  return v7;
}

- (void)evictLosersOnItem:(id)a3 atURL:(id)a4 applySchedulerState:(int *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([(BRCFSDownloader *)self shouldScheduleLosersEvictionForItem:v8])
  {
    BOOL v10 = [MEMORY[0x1E4F63BE8] manager];
    id v23 = 0;
    unint64_t v11 = [v10 permanentStorageForItemAtURL:v9 allocateIfNone:0 error:&v23];
    id v12 = v23;

    if (!v11)
    {
      v13 = brc_bread_crumbs();
      int v14 = brc_default_log();
      if (os_log_type_enabled(v14, (os_log_type_t)0x90u))
      {
        id v17 = [v9 path];
        *(_DWORD *)buf = 138412802;
        uint64_t v26 = v17;
        __int16 v27 = 2112;
        id v28 = v12;
        __int16 v29 = 2112;
        v30 = v13;
        _os_log_error_impl(&dword_1D353B000, v14, (os_log_type_t)0x90u, "[ERROR] can't get permanent storage of %@: %@%@", buf, 0x20u);
      }
      if (a5) {
        *a5 = 1;
      }
    }
    uint64_t v15 = *MEMORY[0x1E4F63BB8];
    v24[0] = *MEMORY[0x1E4F63BD0];
    v24[1] = v15;
    id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = __80__BRCFSDownloader_LegacyAdditions__evictLosersOnItem_atURL_applySchedulerState___block_invoke;
    v21 = &unk_1E69939E8;
    id v22 = v9;
    [v11 removeAllAdditionsForNamespaces:v16 completionHandler:&v18];
    objc_msgSend(v8, "setLiveConflictLoserEtags:", 0, v18, v19, v20, v21);
    [(BRCFSDownloader *)self cancelAndCleanupItemDownload:v8 kind:2];
  }
  if (a5) {
    *a5 = 0;
  }
}

void __80__BRCFSDownloader_LegacyAdditions__evictLosersOnItem_atURL_applySchedulerState___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    unint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      int v6 = 138412546;
      id v7 = v3;
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to remove additions : %@%@", (uint8_t *)&v6, 0x16u);
    }
  }
  else
  {
    id v4 = brc_bread_crumbs();
    unint64_t v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG)) {
      __80__BRCFSDownloader_LegacyAdditions__evictLosersOnItem_atURL_applySchedulerState___block_invoke_cold_1(a1, (uint64_t)v4, v5);
    }
  }
}

- (BOOL)_hasLosersToDelete:(id)a3 serverItem:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  int v6 = [a4 latestVersion];
  id v7 = [v6 conflictLoserEtags];

  __int16 v8 = [v5 liveConflictLoserEtags];
  if (![v8 count] || (objc_msgSend(v8, "isSubsetOfSet:", v7) & 1) != 0) {
    goto LABEL_3;
  }
  uint64_t v10 = [v5 resolvedConflictLoserEtags];
  int v11 = [v8 intersectsSet:v10];

  if (v11)
  {
    id v12 = brc_bread_crumbs();
    v13 = brc_default_log();
    if (!os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
LABEL_12:

      BOOL v9 = 1;
      goto LABEL_13;
    }
    int v14 = [v8 allObjects];
    uint64_t v15 = [v14 componentsJoinedByString:@", "];
    id v16 = [v5 resolvedConflictLoserEtags];
    id v17 = [v16 allObjects];
    uint64_t v18 = [v17 componentsJoinedByString:@", "];
    *(_DWORD *)buf = 138412802;
    v30 = v15;
    __int16 v31 = 2112;
    v32 = v18;
    __int16 v33 = 2112;
    v34 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] resolved losers needing deletion: {%@}⋂{%@}%@", buf, 0x20u);

LABEL_11:
    goto LABEL_12;
  }
  id v12 = [v8 mutableCopy];
  [v12 minusSet:v7];
  uint64_t v19 = [v5 currentVersion];
  uint64_t v20 = [v19 conflictLoserEtags];
  char v21 = [v12 isSubsetOfSet:v20];

  if ((v21 & 1) == 0)
  {
    v13 = brc_bread_crumbs();
    uint64_t v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      id v28 = [v12 allObjects];
      id v23 = [v28 componentsJoinedByString:@", "];
      __int16 v27 = [v5 currentVersion];
      v24 = [v27 conflictLoserEtags];
      uint64_t v25 = [v24 allObjects];
      uint64_t v26 = [v25 componentsJoinedByString:@", "];
      *(_DWORD *)buf = 138412802;
      v30 = v23;
      __int16 v31 = 2112;
      v32 = v26;
      __int16 v33 = 2112;
      v34 = v13;
      _os_log_debug_impl(&dword_1D353B000, v15, OS_LOG_TYPE_DEBUG, "[DEBUG] losers needing deletion: {%@}-{%@}%@", buf, 0x20u);
    }
    goto LABEL_11;
  }

LABEL_3:
  BOOL v9 = 0;
LABEL_13:

  return v9;
}

- (void)scheduleLosersDownloadForItem:(id)a3 serverItem:(id)a4 purgeStaleEntries:(BOOL)a5 applySchedulerState:(int *)a6
{
  BOOL v51 = a5;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v48 = a4;
  BOOL v9 = [v48 latestVersion];
  v49 = [v9 conflictLoserEtags];

  uint64_t v52 = (void *)[v49 mutableCopy];
  uint64_t v10 = [v8 liveConflictLoserEtags];
  [v52 minusSet:v10];

  int v11 = [v8 resolvedConflictLoserEtags];
  [v52 minusSet:v11];

  memset(v58, 0, sizeof(v58));
  __brc_create_section(0, (uint64_t)"-[BRCFSDownloader(LegacyAdditions) scheduleLosersDownloadForItem:serverItem:purgeStaleEntries:applySchedulerState:]", 205, v58);
  id v12 = brc_bread_crumbs();
  v13 = brc_default_log();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v44 = v58[0];
    long long v45 = [v8 itemID];
    *(_DWORD *)buf = 134218754;
    uint64_t v61 = v44;
    __int16 v62 = 2112;
    id v63 = v52;
    __int16 v64 = 2112;
    v65 = v45;
    __int16 v66 = 2112;
    v67 = v12;
    _os_log_debug_impl(&dword_1D353B000, v13, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx scheduling download of losers %@ for item %@%@", buf, 0x2Au);
  }
  int v14 = [(BRCAccountSession *)self->super.super._session clientDB];
  uint64_t v15 = (void *)[v14 fetch:@"SELECT transfer_queue, download_etag, throttle_state   FROM client_downloads  WHERE throttle_id = %lld AND download_kind = %d", objc_msgSend(v8, "dbRowID"), 2];

  int v50 = 0;
  char v47 = 0;
  while ([v15 next])
  {
    id v16 = (void *)MEMORY[0x1D9438760]();
    id v17 = [v15 stringAtIndex:0];
    uint64_t v18 = [v15 stringAtIndex:1];
    int v19 = [v15 intAtIndex:2];
    int v20 = [v17 isEqualToString:@"_done"];
    memset(v57, 0, sizeof(v57));
    __brc_create_section(0, (uint64_t)"-[BRCFSDownloader(LegacyAdditions) scheduleLosersDownloadForItem:serverItem:purgeStaleEntries:applySchedulerState:]", 218, v57);
    char v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 134218498;
      uint64_t v61 = v57[0];
      __int16 v62 = 2112;
      id v63 = v18;
      __int16 v64 = 2112;
      v65 = v21;
      _os_log_debug_impl(&dword_1D353B000, v22, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx download etag: %@%@", buf, 0x20u);
    }

    if (![v52 containsObject:v18])
    {
      uint64_t v25 = brc_bread_crumbs();
      uint64_t v26 = brc_default_log();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v61 = (uint64_t)v25;
        _os_log_debug_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEBUG, "[DEBUG] not interested in this download%@", buf, 0xCu);
      }

      if (v20 && !v51) {
        goto LABEL_17;
      }
LABEL_23:
      [(BRCFSDownloader *)self cancelAndCleanupItemDownload:v8 kind:2 etag:v18];
      goto LABEL_24;
    }
    if (!v19) {
      goto LABEL_24;
    }
    if (v19 != 41)
    {
      if ((v20 & v51) != 1)
      {
        if (v20)
        {
          v30 = brc_bread_crumbs();
          __int16 v31 = brc_default_log();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v61 = (uint64_t)v18;
            __int16 v62 = 2112;
            id v63 = v30;
            _os_log_debug_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEBUG, "[DEBUG] we're done downloading %@%@", buf, 0x16u);
          }

          [v52 removeObject:v18];
LABEL_17:
          int v27 = 1;
        }
        else
        {
          [v52 removeObject:v18];
          if (v19 == 42)
          {
            v32 = brc_bread_crumbs();
            __int16 v33 = brc_default_log();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v61 = (uint64_t)v32;
              _os_log_debug_impl(&dword_1D353B000, v33, OS_LOG_TYPE_DEBUG, "[DEBUG] rescheduling winner%@", buf, 0xCu);
            }

            char v47 = 1;
          }
          v34 = brc_bread_crumbs();
          uint64_t v35 = brc_default_log();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v61 = (uint64_t)v34;
            _os_log_debug_impl(&dword_1D353B000, v35, OS_LOG_TYPE_DEBUG, "[DEBUG] suspending apply for download%@", buf, 0xCu);
          }

          int v27 = v50;
          if (!v50) {
            int v27 = 23;
          }
        }
        int v50 = v27;
        goto LABEL_24;
      }
      id v28 = brc_bread_crumbs();
      __int16 v29 = brc_default_log();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
      {
        unint64_t v36 = [v8 itemID];
        *(_DWORD *)buf = 138412802;
        uint64_t v61 = (uint64_t)v18;
        __int16 v62 = 2112;
        id v63 = v36;
        __int16 v64 = 2112;
        v65 = v28;
        _os_log_fault_impl(&dword_1D353B000, v29, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: We thought we finished downloading loser etag %@ for %@ but it wasn't found, so rescheduling%@", buf, 0x20u);
      }
      goto LABEL_23;
    }
    id v23 = brc_bread_crumbs();
    v24 = brc_default_log();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v61 = (uint64_t)v18;
      __int16 v62 = 2112;
      id v63 = v23;
      _os_log_debug_impl(&dword_1D353B000, v24, OS_LOG_TYPE_DEBUG, "[DEBUG] Not rescheduling download %@ which hit a permanent failure%@", buf, 0x16u);
    }

    [v52 removeObject:v18];
LABEL_24:
    __brc_leave_section(v57);
  }
  if (v47) {
    [(BRCFSDownloader *)self rescheduleJobsPendingWinnerForItem:v8];
  }
  if ([v52 count])
  {
    int v37 = v50;
    long long v55 = 0u;
    long long v56 = 0u;
    if (!v50) {
      int v37 = 23;
    }
    int v50 = v37;
    long long v53 = 0uLL;
    long long v54 = 0uLL;
    id v38 = v52;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v53 objects:v59 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v54;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v54 != v40) {
            objc_enumerationMutation(v38);
          }
          [(BRCFSDownloader *)self _createDownloadingJobForItem:v8 state:1 kind:2 etag:*(void *)(*((void *)&v53 + 1) + 8 * i) userInitiated:0 stageFileName:0 error:0];
        }
        uint64_t v39 = [v38 countByEnumeratingWithState:&v53 objects:v59 count:16];
      }
      while (v39);
    }
  }
  BOOL v42 = [(BRCFSDownloader *)self _hasLosersToDelete:v8 serverItem:v48];
  if (a6)
  {
    int v43 = v50;
    if (v42) {
      int v43 = 1;
    }
    *a6 = v43;
  }
  __brc_leave_section(v58);
}

- (BOOL)applyLosersToItem:(id)a3 serverItem:(id)a4 atURL:(id)a5 applySchedulerState:(int *)a6 addedLosers:(id)a7 removedLosers:(id)a8
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v76 = a3;
  id v67 = a4;
  id v66 = a5;
  id v12 = a7;
  id v13 = a8;
  v65 = v12;
  if (!v12)
  {
    id v59 = v13;
    __int16 v60 = brc_bread_crumbs();
    uint64_t v61 = brc_default_log();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_FAULT)) {
      -[BRCFSDownloader(LegacyAdditions) applyLosersToItem:serverItem:atURL:applySchedulerState:addedLosers:removedLosers:]();
    }

    id v13 = v59;
  }
  v74 = v13;
  if (!v13)
  {
    __int16 v62 = brc_bread_crumbs();
    id v63 = brc_default_log();
    if (os_log_type_enabled(v63, OS_LOG_TYPE_FAULT)) {
      -[BRCFSDownloader(LegacyAdditions) applyLosersToItem:serverItem:atURL:applySchedulerState:addedLosers:removedLosers:]();
    }
  }
  int v14 = [MEMORY[0x1E4F63BE8] manager];
  id v97 = 0;
  uint64_t v68 = [v14 permanentStorageForItemAtURL:v66 allocateIfNone:0 error:&v97];
  id v15 = v97;

  if (v68)
  {
    memset(v96, 0, sizeof(v96));
    __brc_create_section(0, (uint64_t)"-[BRCFSDownloader(LegacyAdditions) applyLosersToItem:serverItem:atURL:applySchedulerState:addedLosers:removedLosers:]", 299, v96);
    id v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v56 = v96[0];
      v57 = [v66 path];
      *(_DWORD *)buf = 134218498;
      uint64_t v101 = v56;
      __int16 v102 = 2112;
      id v103 = v57;
      __int16 v104 = 2112;
      id v105 = v16;
      _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx discovering conflict losers which are live at %@%@", buf, 0x20u);
    }
    uint64_t v18 = [MEMORY[0x1E4F1CA48] array];
    int v19 = (void *)MEMORY[0x1E4F1CA80];
    int v20 = [v76 currentVersion];
    char v21 = [v20 conflictLoserEtags];
    v73 = [v19 setWithSet:v21];

    id v72 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    id v71 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v22 = [v68 enumeratorForAdditionsInNameSpace:*MEMORY[0x1E4F63BD0] withOptions:0 withoutOptions:0 ordering:0];
    id v23 = [v67 latestVersion];
    v24 = [v23 conflictLoserEtags];
    [v73 unionSet:v24];

    uint64_t v25 = [v76 resolvedConflictLoserEtags];
    [v73 minusSet:v25];

    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    obuint64_t j = v22;
    uint64_t v26 = [obj countByEnumeratingWithState:&v92 objects:v108 count:16];
    if (v26)
    {
      uint64_t v27 = *(void *)v93;
      do
      {
        for (uint64_t i = 0; i != v26; ++i)
        {
          if (*(void *)v93 != v27) {
            objc_enumerationMutation(obj);
          }
          __int16 v29 = *(void **)(*((void *)&v92 + 1) + 8 * i);
          id v90 = 0;
          id v91 = 0;
          if ((objc_msgSend(v29, "brc_parseMangledID:itemID:etag:session:", 0, &v91, &v90, self->super.super._session) & 1) == 0)
          {
            v32 = brc_bread_crumbs();
            __int16 v33 = brc_default_log();
            if (os_log_type_enabled(v33, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v101 = (uint64_t)v29;
              __int16 v102 = 2112;
              id v103 = v32;
              _os_log_error_impl(&dword_1D353B000, v33, (os_log_type_t)0x90u, "[ERROR] invalid addition name for %@%@", buf, 0x16u);
            }
            goto LABEL_22;
          }
          id v30 = v91;
          __int16 v31 = [v76 itemID];
          LOBYTE(v30) = [v30 isEqualToItemID:v31];

          if (v30)
          {
            if ([v73 containsObject:v90])
            {
              [v72 addObject:v90];
              [v71 setObject:v29 forKeyedSubscript:v90];
              goto LABEL_23;
            }
            v32 = brc_bread_crumbs();
            __int16 v33 = brc_default_log();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v101 = (uint64_t)v90;
              __int16 v102 = 2112;
              id v103 = v32;
              v34 = v33;
              uint64_t v35 = "[WARNING] ETag %@ is no longer a loser%@";
              uint32_t v36 = 22;
              goto LABEL_21;
            }
          }
          else
          {
            v32 = brc_bread_crumbs();
            __int16 v33 = brc_default_log();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138413058;
              uint64_t v101 = (uint64_t)v91;
              __int16 v102 = 2112;
              id v103 = v29;
              __int16 v104 = 2112;
              id v105 = v76;
              __int16 v106 = 2112;
              v107 = v32;
              v34 = v33;
              uint64_t v35 = "[WARNING] invalid itemID %@ (for %@ in %@)%@";
              uint32_t v36 = 42;
LABEL_21:
              _os_log_impl(&dword_1D353B000, v34, OS_LOG_TYPE_DEFAULT, v35, buf, v36);
            }
          }
LABEL_22:

          [v18 addObject:v29];
LABEL_23:
        }
        uint64_t v26 = [obj countByEnumeratingWithState:&v92 objects:v108 count:16];
      }
      while (v26);
    }

    v70 = [v76 liveConflictLoserEtags];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v87 = 0u;
    long long v86 = 0u;
    id v69 = v71;
    uint64_t v37 = [v69 countByEnumeratingWithState:&v86 objects:v99 count:16];
    if (v37)
    {
      uint64_t v38 = *(void *)v87;
      while (2)
      {
        for (uint64_t j = 0; j != v37; ++j)
        {
          if (*(void *)v87 != v38) {
            objc_enumerationMutation(v69);
          }
          if (([v70 containsObject:*(void *)(*((void *)&v86 + 1) + 8 * j)] & 1) == 0)
          {

            v83[0] = MEMORY[0x1E4F143A8];
            v83[1] = 3221225472;
            v83[2] = __117__BRCFSDownloader_LegacyAdditions__applyLosersToItem_serverItem_atURL_applySchedulerState_addedLosers_removedLosers___block_invoke;
            v83[3] = &unk_1E6994538;
            id v84 = v70;
            id v85 = v65;
            [v69 enumerateKeysAndObjectsUsingBlock:v83];

            char v40 = 1;
            long long v41 = v84;
            goto LABEL_35;
          }
        }
        uint64_t v37 = [v69 countByEnumeratingWithState:&v86 objects:v99 count:16];
        if (v37) {
          continue;
        }
        break;
      }
    }
    char v40 = 0;
    long long v41 = v69;
LABEL_35:

    BOOL v42 = brc_bread_crumbs();
    int v43 = brc_default_log();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSDownloader(LegacyAdditions) applyLosersToItem:serverItem:atURL:applySchedulerState:addedLosers:removedLosers:]();
    }

    [v76 setLiveConflictLoserEtags:v72];
    long long v81 = 0u;
    long long v82 = 0u;
    long long v79 = 0u;
    long long v80 = 0u;
    id v44 = v18;
    uint64_t v45 = [v44 countByEnumeratingWithState:&v79 objects:v98 count:16];
    if (v45)
    {
      uint64_t v46 = *(void *)v80;
      do
      {
        for (uint64_t k = 0; k != v45; ++k)
        {
          if (*(void *)v80 != v46) {
            objc_enumerationMutation(v44);
          }
          id v48 = *(void **)(*((void *)&v79 + 1) + 8 * k);
          id v78 = v15;
          char v49 = objc_msgSend(v48, "_br_markResolvedWithError:", &v78);
          id v50 = v78;

          id v15 = v50;
          if (v49)
          {
            [v74 addObject:v48];
            char v40 = 1;
          }
          else
          {
            BOOL v51 = brc_bread_crumbs();
            uint64_t v52 = brc_default_log();
            if (os_log_type_enabled(v52, (os_log_type_t)0x90u))
            {
              *(_DWORD *)buf = 138412802;
              uint64_t v101 = (uint64_t)v48;
              __int16 v102 = 2112;
              id v103 = v15;
              __int16 v104 = 2112;
              id v105 = v51;
              _os_log_error_impl(&dword_1D353B000, v52, (os_log_type_t)0x90u, "[ERROR] can't remove conflict loser for %@: %@%@", buf, 0x20u);
            }
          }
        }
        uint64_t v45 = [v44 countByEnumeratingWithState:&v79 objects:v98 count:16];
      }
      while (v45);
    }

    [(BRCFSDownloader *)self scheduleLosersDownloadForItem:v76 serverItem:v67 purgeStaleEntries:1 applySchedulerState:a6];
    __brc_leave_section(v96);
  }
  else
  {
    long long v53 = brc_bread_crumbs();
    long long v54 = brc_default_log();
    if (os_log_type_enabled(v54, (os_log_type_t)0x90u))
    {
      v58 = [v66 path];
      *(_DWORD *)buf = 138412802;
      uint64_t v101 = (uint64_t)v58;
      __int16 v102 = 2112;
      id v103 = v15;
      __int16 v104 = 2112;
      id v105 = v53;
      _os_log_error_impl(&dword_1D353B000, v54, (os_log_type_t)0x90u, "[ERROR] can't get permanent storage of %@: %@%@", buf, 0x20u);
    }
    char v40 = 0;
    if (a6) {
      *a6 = 1;
    }
  }

  return v40 & 1;
}

void __117__BRCFSDownloader_LegacyAdditions__applyLosersToItem_serverItem_atURL_applySchedulerState_addedLosers_removedLosers___block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  id v5 = a3;
  if (([*(id *)(a1 + 32) containsObject:a2] & 1) == 0) {
    [*(id *)(a1 + 40) addObject:v5];
  }
}

- (id)generateThumbnailStageFileNameForItem:(id)a3 etag:(id)a4
{
  id v5 = NSString;
  id v6 = a4;
  uint64_t v7 = [a3 dbRowID];
  id v8 = [MEMORY[0x1E4F29128] UUID];
  BOOL v9 = [v8 UUIDString];
  uint64_t v10 = [v5 stringWithFormat:@"thumbnail-%lld-%@-%@", v7, v6, v9];

  return v10;
}

- (void)_sendThumbnailsBatch:(id)a3 sizeHint:(int64_t)a4 maxRecordsCount:(unint64_t)a5
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = +[BRCAccountsManager sharedManager];
  int v9 = [v8 isInSyncBubble];

  if (v9)
  {
    id v30 = brc_bread_crumbs();
    __int16 v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      -[BRCFSDownloader(LegacyAdditions) _sendThumbnailsBatch:sizeHint:maxRecordsCount:]();
    }
  }
  uint64_t v10 = [v7 syncContext];
  int v11 = 0;
  id v12 = 0;
  id v13 = 0;
  int v14 = 0;
  id v15 = 0;
  if ([0 itemsCount] >= a5) {
    goto LABEL_17;
  }
  v34 = self;
  id v12 = 0;
  int v11 = 0;
  id v16 = 0;
  int v14 = 0;
  id v15 = 0;
  v32 = v10;
  id v33 = v7;
  while (1)
  {
    id v17 = v11;
    uint64_t v18 = (void *)MEMORY[0x1D9438760]();
    int v11 = [v7 nextDocumentItem];

    if (!v11) {
      break;
    }
    uint64_t v19 = [v7 stageID];

    id v13 = [v7 etag];

    uint64_t v20 = v19;
    if (v19)
    {
      if (!v12) {
        goto LABEL_9;
      }
    }
    else
    {
      uint64_t v20 = [(BRCFSDownloader *)v34 generateThumbnailStageFileNameForItem:v11 etag:v13];
      if (!v12)
      {
LABEL_9:
        id v12 = [[BRCDownloadThumbnailsBatchOperation alloc] initWithSyncContext:v32];
        id v22 = [(_BRCOperation *)v12 operationID];

        v35[0] = MEMORY[0x1E4F143A8];
        v35[1] = 3221225472;
        v35[2] = __82__BRCFSDownloader_LegacyAdditions___sendThumbnailsBatch_sizeHint_maxRecordsCount___block_invoke;
        v35[3] = &unk_1E6994560;
        char v21 = v34;
        v35[4] = v34;
        id v36 = v32;
        id v15 = v22;
        id v37 = v15;
        [(BRCDownloadThumbnailsBatchOperation *)v12 setPerDownloadCompletionBlock:v35];

        goto LABEL_10;
      }
    }
    char v21 = v34;
LABEL_10:
    int v14 = (void *)v20;
    id v23 = [[BRCDownloadThumbnail alloc] initWithDocument:v11 stageID:v20 etag:v13];
    v24 = objc_msgSend(MEMORY[0x1E4F1A218], "br_downloadThumbnails");
    [(_BRCOperation *)v12 setGroup:v24];

    [(BRCDownloadThumbnailsBatchOperation *)v12 addDownload:v23];
    [(BRCFSDownloader *)v21 _willDownload:v23 operationID:v15];

    id v16 = v13;
    id v7 = v33;
    if ([(BRCTransferBatchOperation *)v12 itemsCount] >= a5)
    {
      if (v12) {
        goto LABEL_12;
      }
LABEL_16:
      uint64_t v10 = v32;
      goto LABEL_17;
    }
  }
  id v13 = v16;
  if (!v12) {
    goto LABEL_16;
  }
LABEL_12:
  uint64_t v25 = brc_bread_crumbs();
  uint64_t v26 = brc_default_log();
  uint64_t v10 = v32;
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v27 = [(BRCTransferBatchOperation *)v12 itemsCount];
    id v28 = [v32 contextIdentifier];
    *(_DWORD *)buf = 134218498;
    uint64_t v39 = v27;
    __int16 v40 = 2112;
    long long v41 = v28;
    __int16 v42 = 2112;
    int v43 = v25;
    _os_log_impl(&dword_1D353B000, v26, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloading %ld thumbnails in %@%@", buf, 0x20u);

    uint64_t v10 = v32;
  }

  __int16 v29 = [v10 downloadStream];
  [v29 addBatchOperation:v12];

LABEL_17:
}

uint64_t __82__BRCFSDownloader_LegacyAdditions___sendThumbnailsBatch_sizeHint_maxRecordsCount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishedDownload:a2 syncContext:*(void *)(a1 + 40) operationID:*(void *)(a1 + 48) error:a3];
}

- (BOOL)hasThumbnailToApplyForItem:(id)a3
{
  session = self->super.super._session;
  id v4 = a3;
  id v5 = [(BRCAccountSession *)session clientDB];
  uint64_t v6 = [v4 dbRowID];

  id v7 = (void *)[v5 numberWithSQL:@"SELECT 1 FROM client_downloads WHERE throttle_id = %llu AND download_kind = %u AND transfer_queue = %@ LIMIT 1", v6, 1, @"_done"];
  LOBYTE(v5) = [v7 BOOLValue];

  return (char)v5;
}

- (void)scheduleThumbnailDownloadForItem:(id)a3 serverItem:(id)a4 applySchedulerState:(int *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v35 = a4;
  memset(v36, 0, sizeof(v36));
  __brc_create_section(0, (uint64_t)"-[BRCFSDownloader(LegacyAdditions) scheduleThumbnailDownloadForItem:serverItem:applySchedulerState:]", 450, v36);
  id v8 = brc_bread_crumbs();
  int v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v32 = v36[0];
    id v33 = [v7 itemID];
    *(_DWORD *)buf = 134219010;
    uint64_t v38 = v32;
    __int16 v39 = 2112;
    __int16 v40 = v33;
    __int16 v41 = 2112;
    id v42 = v7;
    __int16 v43 = 2112;
    id v44 = v35;
    __int16 v45 = 2112;
    uint64_t v46 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx scheduling thumbnail download for %@\nlocal: %@\nserver: %@%@", buf, 0x34u);
  }
  uint64_t v10 = [v7 dbRowID];
  int v11 = [v35 latestVersion];
  char v12 = [v11 hasThumbnail];

  if (v12)
  {
    id v13 = [v35 latestVersion];
    int v14 = [v13 ckInfo];
    id v15 = [v14 etag];

    id v16 = [(BRCAccountSession *)self->super.super._session clientDB];
    id v17 = (void *)[v16 fetch:@"SELECT transfer_queue, download_etag, throttle_state FROM client_downloads  WHERE throttle_id = %lld AND download_kind = %u AND throttle_state != 0", v10, 1];

    int v18 = 23;
    while ([v17 next])
    {
      uint64_t v19 = [v17 stringAtIndex:0];
      uint64_t v20 = [v17 stringAtIndex:1];
      int v21 = [v17 intAtIndex:2];
      int v22 = [v15 isEqualToString:v20];
      if (v21 == 1) {
        int v23 = v22;
      }
      else {
        int v23 = 0;
      }
      if (v23 == 1)
      {
        int v24 = [v19 isEqualToString:@"_done"];
        if (v18 == 1) {
          int v25 = 1;
        }
        else {
          int v25 = v24;
        }
        if (v25) {
          int v18 = 1;
        }

        uint64_t v26 = brc_bread_crumbs();
        uint64_t v27 = brc_default_log();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v38 = (uint64_t)v20;
          __int16 v39 = 2112;
          __int16 v40 = v26;
          _os_log_debug_impl(&dword_1D353B000, v27, OS_LOG_TYPE_DEBUG, "[DEBUG] existing throttle thumbnail with etag:%@%@", buf, 0x16u);
        }

        id v15 = 0;
      }
      else
      {
        id v28 = brc_bread_crumbs();
        __int16 v29 = brc_default_log();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v38 = (uint64_t)v20;
          __int16 v39 = 2112;
          __int16 v40 = v28;
          _os_log_debug_impl(&dword_1D353B000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] cancelling thumbnail throttle with etag:%@%@", buf, 0x16u);
        }

        [(BRCFSDownloader *)self cancelAndCleanupItemDownload:v7 kind:1 etag:v20];
      }
    }
    if (v15) {
      [(BRCFSDownloader *)self _createDownloadingJobForItem:v7 state:1 kind:1 etag:v15 userInitiated:0 stageFileName:0 error:0];
    }
  }
  else
  {
    id v30 = brc_bread_crumbs();
    __int16 v31 = brc_default_log();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSDownloader(LegacyAdditions) scheduleThumbnailDownloadForItem:serverItem:applySchedulerState:]();
    }

    [(BRCFSDownloader *)self cancelAndCleanupItemDownload:v7 kind:1];
    int v18 = 0;
  }
  if (a5) {
    *a5 = v18;
  }
  __brc_leave_section(v36);
}

- (BOOL)applyThumbnailToItem:(id)a3 serverItem:(id)a4 atURL:(id)a5 applySchedulerState:(int *)a6
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [v11 latestVersion];
  int v14 = [v13 ckInfo];
  id v15 = [v14 etag];

  id v16 = [v11 latestVersion];
  LODWORD(v14) = [v16 hasThumbnail];

  if (v14)
  {
    id v17 = [(BRCAccountSession *)self->super.super._session clientDB];
    int v18 = (void *)[v17 fetch:@"SELECT throttle_state, transfer_queue, transfer_stage, transfer_record   FROM client_downloads  WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@", -[NSObject dbRowID](v10, "dbRowID"), 1, v15];

    id v19 = 0;
  }
  else
  {
    uint64_t v20 = [v10 liveThumbnailSignature];
    if (v20)
    {
      int v21 = (void *)v20;
      id v63 = 0;
      int v22 = [MEMORY[0x1E4F3A6A8] removeAdditionsOnURL:v12 error:&v63];
      id v19 = v63;

      if (v22)
      {
        int v23 = [v11 latestVersion];
        [v10 learnThumbnailSignatureFromLiveVersion:v23];

        int v18 = 0;
        LOBYTE(v24) = 1;
        goto LABEL_13;
      }
      if (v19)
      {
        int v25 = brc_bread_crumbs();
        uint64_t v26 = brc_default_log();
        if (os_log_type_enabled(v26, (os_log_type_t)0x90u))
        {
          *(_DWORD *)buf = 138412802;
          os_log_t v67 = v10;
          __int16 v68 = 2112;
          id v69 = v19;
          __int16 v70 = 2112;
          uint64_t v71 = (uint64_t)v25;
          _os_log_error_impl(&dword_1D353B000, v26, (os_log_type_t)0x90u, "[ERROR] Failed removing thumbnail from %@ - %@%@", buf, 0x20u);
        }
      }
    }
    else
    {
      id v19 = 0;
    }
    int v18 = 0;
  }
  LOBYTE(v24) = 0;
LABEL_13:
  if (![v18 next])
  {
    int v27 = 0;
    if (!a6) {
      goto LABEL_37;
    }
    goto LABEL_36;
  }
  v58 = self;
  id v61 = v12;
  int v27 = [v18 intAtIndex:0];
  id v28 = brc_bread_crumbs();
  __int16 v29 = brc_default_log();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    os_log_t loga = [v10 itemID];
    uint64_t v49 = BRCPrettyPrintEnum();
    *(_DWORD *)buf = 138413058;
    os_log_t v67 = loga;
    __int16 v68 = 2112;
    id v69 = v15;
    __int16 v70 = 2080;
    uint64_t v71 = v49;
    __int16 v72 = 2112;
    v73 = v28;
    _os_log_debug_impl(&dword_1D353B000, v29, OS_LOG_TYPE_DEBUG, "[DEBUG] existing thumbnail for %@_%@ has state %s%@", buf, 0x2Au);
  }
  if (v27)
  {
    if (v27 == 1)
    {
      id v30 = [v18 stringAtIndex:1];
      int v31 = [v30 isEqualToString:@"_done"];

      if (v31)
      {
        long long v54 = a6;
        uint64_t v32 = [v18 stringAtIndex:2];
        id v33 = [v18 unarchivedObjectOfClass:objc_opt_class() atIndex:3];
        v34 = [(BRCAccountSession *)v58->super.super._session stageRegistry];
        uint64_t v56 = (void *)v32;
        uint64_t v35 = [v34 createURLForDownloadWithStageID:v32 name:@"thumbnail"];

        uint64_t v64 = *MEMORY[0x1E4F1C500];
        uint64_t v65 = v35;
        v57 = (void *)v35;
        uint64_t v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v65 forKeys:&v64 count:1];
        id v37 = (void *)MEMORY[0x1E4F3A6A8];
        log = v33;
        uint64_t v38 = [v33 objectForKeyedSubscript:@"thumbQLMetadata"];
        id v62 = v19;
        long long v55 = (void *)v36;
        int v24 = [v37 associateThumbnailImagesDictionary:v36 serializedQuickLookMetadata:v38 withDocumentAtURL:v61 error:&v62];
        id v39 = v62;

        if (v24)
        {
          __int16 v40 = brc_bread_crumbs();
          __int16 v41 = brc_default_log();
          a6 = v54;
          if (os_log_type_enabled(v41, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v52 = [v10 itemID];
            *(_DWORD *)buf = 138412802;
            os_log_t v67 = v52;
            __int16 v68 = 2112;
            id v69 = v15;
            __int16 v70 = 2112;
            uint64_t v71 = (uint64_t)v40;
            _os_log_debug_impl(&dword_1D353B000, v41, OS_LOG_TYPE_DEBUG, "[DEBUG] thumbnail for %@_%@ associated, notifying file coordinator%@", buf, 0x20u);
          }
          objc_msgSend(MEMORY[0x1E4F28CA0], "__itemAtURL:didChangeWithPurposeID:", v61, @"com.apple.bird");
          id v42 = [v11 latestVersion];
          [v10 learnThumbnailSignatureFromLiveVersion:v42];
        }
        else
        {
          id v42 = brc_bread_crumbs();
          uint64_t v47 = brc_default_log();
          a6 = v54;
          if (os_log_type_enabled(v47, (os_log_type_t)0x90u))
          {
            long long v53 = [v57 path];
            *(_DWORD *)buf = 138412802;
            os_log_t v67 = v53;
            __int16 v68 = 2112;
            id v69 = v39;
            __int16 v70 = 2112;
            uint64_t v71 = (uint64_t)v42;
            _os_log_error_impl(&dword_1D353B000, v47, (os_log_type_t)0x90u, "[ERROR] Failed to save thumbnail from %@: %@%@", buf, 0x20u);
          }
        }

        [(BRCFSDownloader *)v58 cancelAndCleanupItemDownload:v10 kind:1 etag:v15];
        int v27 = 0;
        __int16 v43 = v56;
        goto LABEL_34;
      }
      __int16 v43 = brc_bread_crumbs();
      log = brc_default_log();
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        [v10 itemID];
        v51 = id v50 = v43;
        *(_DWORD *)buf = 138412802;
        os_log_t v67 = v51;
        __int16 v68 = 2112;
        id v69 = v15;
        __int16 v70 = 2112;
        uint64_t v71 = (uint64_t)v50;
        _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] thumbnail for %@_%@ still pending download%@", buf, 0x20u);

        __int16 v43 = v50;
      }
    }
    else
    {
      __int16 v43 = brc_bread_crumbs();
      log = brc_default_log();
      if (os_log_type_enabled(log, OS_LOG_TYPE_DEBUG))
      {
        [v10 itemID];
        v45 = id v44 = v43;
        uint64_t v46 = BRCPrettyPrintEnum();
        *(_DWORD *)buf = 138413058;
        os_log_t v67 = v45;
        __int16 v68 = 2112;
        id v69 = v15;
        __int16 v70 = 2080;
        uint64_t v71 = v46;
        __int16 v72 = 2112;
        v73 = v44;
        _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] thumbnail for %@_%@ has state %s%@", buf, 0x2Au);

        __int16 v43 = v44;
      }
    }
    int v27 = 23;
    id v39 = v19;
LABEL_34:

    id v19 = v39;
  }
  id v12 = v61;
  if (a6) {
LABEL_36:
  }
    *a6 = v27;
LABEL_37:

  return v24;
}

- (BRCFSDownloader)initWithAccountSession:(id)a3
{
  id v4 = a3;
  v21.receiver = self;
  v21.super_class = (Class)BRCFSDownloader;
  id v5 = [(BRCFSSchedulerBase *)&v21 initWithSession:v4 name:@"Downloader" tableName:@"client_downloads"];
  if (v5)
  {
    uint64_t v6 = [v4 personaIdentifier];
    id v7 = BRPersonaSpecificName();

    id v8 = v7;
    dispatch_workloop_t v9 = dispatch_workloop_create((const char *)[v8 UTF8String]);
    uint64_t v10 = [[BRCFairScheduler alloc] initWithWorkloop:v9 name:v8];
    fairScheduler = v5->_fairScheduler;
    v5->_fairScheduler = v10;

    id v12 = [[BRCDeadlineScheduler alloc] initWithName:@"com.apple.bird.downloader" fairScheduler:v5->_fairScheduler];
    downloadsDeadlineScheduler = v5->_downloadsDeadlineScheduler;
    v5->_downloadsDeadlineScheduler = v12;

    [(BRCDeadlineScheduler *)v5->_downloadsDeadlineScheduler setCoalescingLeeway:10000000];
    uint64_t v14 = brc_task_tracker_create("com.apple.bird.download-tracker");
    tracker = v5->_tracker;
    v5->_tracker = (brc_task_tracker *)v14;

    id v16 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    willRetryOperationProgress = v5->_willRetryOperationProgress;
    v5->_willRetryOperationProgress = v16;

    int v18 = +[BRCUserDefaults defaultsForMangledID:0];
    [v18 downloadSizeRefreshInterval];
    v5->_activeDownloadSizeRefreshInterval = v19;
  }
  return v5;
}

- (void)resume
{
  id v3 = [(BRCAccountSession *)self->super.super._session expensiveReadOnlyDB];
  id v4 = [v3 serialQueue];

  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = __25__BRCFSDownloader_resume__block_invoke;
  v6[3] = &unk_1E6993698;
  v6[4] = self;
  dispatch_async_with_logs_4(v4, v6);
  [(BRCDeadlineScheduler *)self->_downloadsDeadlineScheduler resume];
  [(BRCFairScheduler *)self->_fairScheduler resume];
  v5.receiver = self;
  v5.super_class = (Class)BRCFSDownloader;
  [(BRCFSSchedulerBase *)&v5 resume];
}

void __25__BRCFSDownloader_resume__block_invoke(uint64_t a1)
{
  v2 = [*(id *)(*(void *)(a1 + 32) + 8) expensiveReadOnlyDB];
  id v12 = (id)objc_msgSend(v2, "fetch:", @"SELECT throttle_id   FROM client_downloads  WHERE throttle_state =1    AND download_kind = %d", 0);

  if ([v12 next])
  {
    do
    {
      id v3 = (void *)MEMORY[0x1D9438760]();
      uint64_t v4 = [v12 longLongAtIndex:0];
      objc_super v5 = *(void **)(*(void *)(a1 + 32) + 8);
      uint64_t v6 = [v5 expensiveReadOnlyDB];
      id v7 = [v5 itemByRowID:v4 db:v6];

      if ([v7 isDocument])
      {
        id v8 = [v7 st];
        dispatch_workloop_t v9 = [v8 stagedFileID];

        if (!v9)
        {
          uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 8) globalProgress];
          id v11 = [v7 asDocument];
          [v10 willScheduleDocumentForDownload:v11];
        }
      }
    }
    while (([v12 next] & 1) != 0);
  }
}

- (void)suspend
{
  [(BRCFairScheduler *)self->_fairScheduler suspend];
  [(BRCDeadlineScheduler *)self->_downloadsDeadlineScheduler suspend];
  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  [(BRCFSSchedulerBase *)&v3 suspend];
}

- (void)close
{
  [(BRCDeadlineScheduler *)self->_downloadsDeadlineScheduler close];
  [(BRCFairScheduler *)self->_fairScheduler close];
  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  [(BRCFSSchedulerBase *)&v3 close];
}

- (void)_close
{
  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  [(BRCFSSchedulerBase *)&v3 _close];
  brc_task_tracker_wait((uint64_t)self->_tracker);
}

- (void)cancel
{
  [(BRCDeadlineScheduler *)self->_downloadsDeadlineScheduler cancel];
  v3.receiver = self;
  v3.super_class = (Class)BRCFSDownloader;
  [(BRCFSSchedulerBase *)&v3 cancel];
  brc_task_tracker_cancel(self->_tracker);
}

- (void)_willDownload:(id)a3 operationID:(id)a4
{
  session = self->super.super._session;
  id v6 = a4;
  id v7 = a3;
  id v12 = [(BRCAccountSession *)session clientDB];
  id v8 = [v7 stageID];
  dispatch_workloop_t v9 = [v7 transferID];
  uint64_t v10 = [v7 kind];
  id v11 = [v7 etag];

  [v12 execute:@"UPDATE client_downloads SET  transfer_stage = %@, transfer_operation = %@ WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@", v8, v6, v9, v10, v11];
}

- (unint64_t)_bumpThrottleForDownload:(id)a3 throttle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [BRCDownloadJobIdentifier alloc];
  dispatch_workloop_t v9 = [v7 transferID];
  uint64_t v10 = [v9 unsignedLongLongValue];
  id v11 = [v7 etag];
  uint64_t v12 = [v7 kind];

  id v13 = [(BRCDownloadJobIdentifier *)v8 initWithDBRowID:v10 etag:v11 kind:v12];
  v16.receiver = self;
  v16.super_class = (Class)BRCFSDownloader;
  id v14 = [(BRCFSSchedulerBase *)&v16 postponeJobID:v13 withThrottle:v6];

  return (unint64_t)v14;
}

- (id)descriptionForItem:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_msgSend(MEMORY[0x1E4FBA908], "rawInjection:length:", "ORDER BY download_kind, download_etag", 37);
  dispatch_workloop_t v9 = objc_msgSend(MEMORY[0x1E4FBA908], "rawInjection:length:", "download_kind, download_etag, transfer_operation, transfer_queue, download_error, app_library_rowid", 99);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __46__BRCFSDownloader_descriptionForItem_context___block_invoke;
  v14[3] = &unk_1E6996178;
  id v15 = v7;
  objc_super v16 = self;
  id v17 = v6;
  id v10 = v6;
  id v11 = v7;
  uint64_t v12 = [(BRCFSSchedulerBase *)self descriptionForJobsMatching:v10 ordering:v8 additionalColumns:v9 additionalValuesHandler:v14 context:v11];

  return v12;
}

void __46__BRCFSDownloader_descriptionForItem_context___block_invoke(uint64_t a1, void *a2, void *a3, uint64_t a4, int a5)
{
  id v26 = a2;
  id v9 = a3;
  [v9 intAtIndex:a4];
  id v10 = [v9 stringAtIndex:(a4 + 1)];
  id v11 = [v9 uuidAtIndex:(a4 + 2)];
  uint64_t v12 = [v9 stringAtIndex:(a4 + 3)];
  id v13 = [v9 stringAtIndex:(a4 + 4)];
  id v14 = [v9 numberAtIndex:(a4 + 5)];

  uint64_t v15 = BRCPrettyPrintEnum();
  objc_super v16 = +[BRCDumpContext highlightedString:v10 type:2 context:*(void *)(a1 + 32)];
  [v26 appendFormat:@"%s:%@", v15, v16];

  if (!a5) {
    goto LABEL_13;
  }
  if (([v12 isEqualToString:@"_retry"] & 1) == 0)
  {
    if (!v11) {
      goto LABEL_11;
    }
    id v17 = [*(id *)(*(void *)(a1 + 40) + 8) appLibraryByRowID:v14];
    int v18 = [*(id *)(a1 + 48) serverZone];
    double v19 = +[BRCSyncContext transferContextForServerZone:v18 appLibrary:v17];

    uint64_t v20 = [v19 downloadStream];
    objc_super v21 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(*(id *)(a1 + 48), "dbRowID"));
    [v20 progressForTransferID:v21 operationID:v11];
    double v23 = v22;

    if (v23 >= 0.0) {
      objc_msgSend(v26, "appendFormat:", @" downloading:%.1f%%", v23 * 100.0);
    }
    else {
      [v26 appendString:@" download:done/cancelled"];
    }

    goto LABEL_10;
  }
  [v26 appendString:@" pending-retry"];
  if (v11)
  {
LABEL_10:
    int v24 = [v11 UUIDString];
    [v26 appendFormat:@" op:%@", v24];
  }
LABEL_11:
  if (v13)
  {
    int v25 = +[BRCDumpContext highlightedString:v13 type:3 context:*(void *)(a1 + 32)];
    [v26 appendFormat:@" last-error:%@", v25];
  }
LABEL_13:
}

- (BOOL)_createDownloadingJobForItem:(id)a3 state:(int)a4 kind:(int)a5 etag:(id)a6 userInitiated:(BOOL)a7 stageFileName:(id)a8 error:(id *)a9
{
  uint64_t v12 = *(void *)&a5;
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a6;
  id v74 = a8;
  id v17 = [v15 serverZone];
  long long v81 = [v15 appLibrary];
  id v84 = [v15 syncContextUsedForTransfers];
  id v82 = v16;
  v83 = -[BRCDownloadJobIdentifier initWithDBRowID:etag:kind:]([BRCDownloadJobIdentifier alloc], "initWithDBRowID:etag:kind:", [v15 dbRowID], v16, v12);
  long long v80 = self;
  int v18 = [(BRCAccountSession *)self->super.super._session diskReclaimer];
  double v19 = [v18 accessTimestampForDocument:v15];
  uint64_t v20 = [v19 longLongValue];

  objc_super v21 = [v15 currentVersion];
  uint64_t v22 = [v21 mtime];

  if (v20 <= v22) {
    uint64_t v23 = v22;
  }
  else {
    uint64_t v23 = v20;
  }
  uint64_t v72 = v23;
  uint64_t v85 = v12;
  BOOL v64 = v12 == 0 && a7;
  uint64_t v24 = 17;
  if (v64) {
    uint64_t v24 = 25;
  }
  uint64_t v70 = v24;
  if (!a7 && ![v17 hasFetchedRecentsAndFavorites]) {
    a4 = 40;
  }
  unsigned int v79 = a4;
  int v25 = [v15 currentVersion];
  id v26 = v25;
  id v78 = v15;
  if (v12 == 1) {
    uint64_t v27 = [v25 thumbnailSize];
  }
  else {
    uint64_t v27 = [v25 size];
  }
  uint64_t v28 = v27;

  __int16 v68 = [v84 downloadThrottle];
  uint64_t v65 = objc_msgSend(MEMORY[0x1E4FBA908], "rawInjection:length:", "app_library_rowid, transfer_queue, transfer_size, transfer_record, transfer_stage, transfer_operation, download_kind, download_etag, download_priority, download_request_stamp, download_error, zone_rowid", 202);
  __int16 v29 = (void *)MEMORY[0x1E4FBA8F8];
  os_log_t v67 = [v81 dbRowID];
  id v66 = [v84 contextIdentifier];
  id v69 = [v17 dbRowID];
  id v30 = [v29 formatInjection:@"%@, %@, %lld, %@, %@, %@, %u, %@, %ld, %lld, %@, %@", v67, v66, v28, 0, v74, 0, v12, v82, v70, v72, 0, v69];
  int v31 = (void *)MEMORY[0x1E4FBA8F8];
  uint64_t v32 = [v81 dbRowID];
  id v33 = [v84 contextIdentifier];
  v77 = v17;
  v34 = [v17 dbRowID];
  uint64_t v35 = [v31 formatInjection:@"app_library_rowid = %@, transfer_queue = %@, download_priority = %ld, download_request_stamp = %lld, transfer_stage = %@, zone_rowid = %@", v32, v33, v70, v72, v74, v34];

  id v86 = 0;
  unsigned int v36 = v79;
  int v37 = [(BRCFSSchedulerBase *)v80 insertOrUpdateJobID:v83 throttle:v68 withState:v79 insertedSQLColumn:v65 insertedSQLValues:v30 updatedSQLValues:v35 error:&v86];
  uint64_t v75 = v38;
  id v39 = v86;

  __int16 v40 = v39;
  if (a9) {
    BOOL v41 = v39 == 0;
  }
  else {
    BOOL v41 = 1;
  }
  BOOL v42 = v41;
  if (!v41)
  {
    id v51 = v39;
    uint64_t v52 = brc_bread_crumbs();
    long long v53 = brc_default_log();
    BOOL v54 = os_log_type_enabled(v53, (os_log_type_t)0x90u);
    __int16 v43 = v78;
    if (v54) {
      -[BRCFSDownloader _createDownloadingJobForItem:state:kind:etag:userInitiated:stageFileName:error:]((uint64_t)v51, (uint64_t)v52, v53);
    }

    id v55 = v51;
    *a9 = v55;
    __int16 v45 = v81;
    id v44 = v82;
LABEL_39:

    goto LABEL_40;
  }
  __int16 v43 = v78;
  __int16 v45 = v81;
  id v44 = v82;
  int v46 = v37;
  if (v79 != v37)
  {
    BOOL v76 = v42;
    id v73 = v39;
    unint64_t activeDownloadsSize = v80->_activeDownloadsSize;
    id v48 = [(BRCAccountSession *)v80->super.super._session clientDB];
    uint64_t v49 = (void *)[v48 numberWithSQL:@"SELECT transfer_size FROM client_downloads WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@", objc_msgSend(v78, "dbRowID"), v85, v82];

    if (v79 == 1)
    {
      uint64_t v50 = v80->_activeDownloadsSize + [v49 longLongValue];
      BOOL v42 = v76;
    }
    else
    {
      BOOL v42 = v76;
      if (v37 != 1)
      {
LABEL_29:
        int v71 = v37;
        uint64_t v56 = brc_bread_crumbs();
        v57 = brc_default_log();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        {
          id v62 = [v78 itemID];
          unint64_t v63 = v80->_activeDownloadsSize;
          *(_DWORD *)buf = 138413314;
          long long v88 = v83;
          __int16 v89 = 2112;
          id v90 = v62;
          __int16 v91 = 2048;
          unint64_t v92 = activeDownloadsSize;
          __int16 v93 = 2048;
          unint64_t v94 = v63;
          __int16 v95 = 2112;
          v96 = v56;
          _os_log_debug_impl(&dword_1D353B000, v57, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@]: %@ (%llu -> %llu)%@", buf, 0x34u);

          BOOL v42 = v76;
        }

        unsigned int v36 = v79;
        int v46 = v71;
        __int16 v40 = v73;
        goto LABEL_32;
      }
      uint64_t v50 = v80->_activeDownloadsSize - [v49 longLongValue];
    }
    v80->_unint64_t activeDownloadsSize = v50;
    goto LABEL_29;
  }
LABEL_32:
  if (v36 == 1)
  {
    if (!v85 && v46 != 1)
    {
      [(BRCAccountSession *)v80->super.super._session globalProgress];
      id v59 = v58 = v42;
      [v59 willScheduleDocumentForDownload:v78];

      BOOL v42 = v58;
    }
    __int16 v60 = [v84 downloadStream];
    id v55 = v60;
    if (v64) {
      [v60 forceSchedulingPendingInteractiveTransfers];
    }
    else {
      [v60 signalWithDeadline:v75];
    }
    goto LABEL_39;
  }
LABEL_40:

  return v42;
}

- (id)_sanitizeRecord:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = (void *)[v3 copy];
  [v4 setTrackChanges:0];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  objc_super v5 = objc_msgSend(v3, "allKeys", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void *)(*((void *)&v13 + 1) + 8 * i);
        id v11 = [v3 objectForKeyedSubscript:v10];
        objc_opt_class();
        if (objc_opt_isKindOfClass() & 1) != 0 || (objc_opt_class(), (objc_opt_isKindOfClass())) {
          [v4 setObject:0 forKeyedSubscript:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  [v4 setTrackChanges:1];

  return v4;
}

- (void)_finishedDownload:(id)a3 syncContext:(id)a4 operationID:(id)a5 error:(id)a6
{
  uint64_t v112 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v75 = a4;
  id v73 = a5;
  id v11 = a6;
  uint64_t v12 = +[BRCAccountsManager sharedManager];
  LODWORD(a5) = [v12 isInSyncBubble];

  if (a5)
  {
    int v71 = brc_bread_crumbs();
    uint64_t v72 = brc_default_log();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_FAULT)) {
      -[BRCFSDownloader _finishedDownload:syncContext:operationID:error:]();
    }
  }
  v77 = [v10 clientZone];
  BOOL v76 = [v10 stageID];
  uint64_t v74 = [v10 kind];
  memset(v99, 0, sizeof(v99));
  __brc_create_section(0, (uint64_t)"-[BRCFSDownloader _finishedDownload:syncContext:operationID:error:]", 613, v99);
  long long v13 = brc_bread_crumbs();
  long long v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v22 = v99[0];
    uint64_t v23 = [v10 transferID];
    [v10 kind];
    uint64_t v24 = BRCPrettyPrintEnum();
    uint64_t v25 = [v10 etag];
    id v26 = (void *)v25;
    uint64_t v27 = @"failed";
    *(_DWORD *)buf = 134219266;
    uint64_t v101 = v22;
    __int16 v102 = 2112;
    if (!v11) {
      uint64_t v27 = @"done";
    }
    id v103 = v23;
    __int16 v104 = 2080;
    uint64_t v105 = v24;
    __int16 v106 = 2112;
    uint64_t v107 = v25;
    __int16 v108 = 2112;
    uint64_t v109 = v27;
    __int16 v110 = 2112;
    v111 = v13;
    _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Downloader[%@-%s-%@]: download %@%@", buf, 0x3Eu);
  }
  if (v76)
  {
    if (!v11 && v77) {
      goto LABEL_8;
    }
    long long v15 = [(BRCAccountSession *)self->super.super._session stageRegistry];
    long long v16 = [v10 itemID];
    [v15 cleanupStagedDownloadWithID:v76 forItemID:v16];
  }
  if (!v77)
  {
    id v18 = 0;
    goto LABEL_46;
  }
LABEL_8:
  if (v74)
  {
    char v17 = 0;
    id v18 = 0;
    goto LABEL_20;
  }
  session = self->super.super._session;
  uint64_t v20 = [v10 transferID];
  objc_super v21 = -[BRCAccountSession itemByRowID:](session, "itemByRowID:", [v20 longLongValue]);
  id v18 = [v21 asDocument];

  if (v11) {
    goto LABEL_18;
  }
  if (([v10 requiresTwoPhase] & 1) == 0)
  {
    id v98 = 0;
    [v18 learnStagedInfoFromDownloadStageID:v76 error:&v98];
    id v11 = v98;
LABEL_18:
    char v17 = 0;
    goto LABEL_19;
  }
  id v11 = 0;
  char v17 = 1;
LABEL_19:
  uint64_t v28 = [v18 desiredVersion];
  [v28 setDownloadError:v11];

LABEL_20:
  if (!v11)
  {
    [(BRCFSDownloader *)self _clearDownloadErrorForDocument:v18];
    v34 = [(BRCAccountSession *)self->super.super._session applyScheduler];
    uint64_t v35 = [v10 itemID];
    uint64_t v36 = [v77 serverRankByItemID:v35];

    int v37 = [(BRCAccountSession *)self->super.super._session clientDB];
    if (v74) {
      int v38 = 1;
    }
    else {
      int v38 = 20;
    }
    v78[0] = MEMORY[0x1E4F143A8];
    v78[1] = 3221225472;
    v78[2] = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_215;
    v78[3] = &unk_1E69961F0;
    v78[4] = self;
    id v79 = v10;
    char v88 = v17;
    id v80 = v75;
    id v81 = v76;
    int v86 = v74;
    id v18 = v18;
    id v82 = v18;
    uint64_t v85 = v36;
    int v87 = v38;
    id v39 = v34;
    id v83 = v39;
    id v84 = v77;
    [v37 groupInBatch:v78];

    id v11 = 0;
    goto LABEL_46;
  }
  if ([v77 handleZoneLevelErrorIfNeeded:v11 forItemCreation:0]) {
    goto LABEL_46;
  }
  if (objc_msgSend(v11, "brc_isOutOfSpaceError"))
  {
    __int16 v29 = brc_bread_crumbs();
    id v30 = brc_default_log();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSDownloader _finishedDownload:syncContext:operationID:error:]((uint64_t)v11);
    }

    int v31 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorWithDomain:code:underlyingError:", *MEMORY[0x1E4F281F8], 640, v11);
    uint64_t v32 = [v18 desiredVersion];
    [v32 setDownloadError:v31];

    [v18 saveToDB];
    uint64_t v33 = 43;
  }
  else
  {
    uint64_t v33 = 41;
  }
  if (objc_msgSend(v11, "brc_isCloudKitCancellationError")) {
    goto LABEL_34;
  }
  __int16 v40 = [v75 downloadThrottle];
  unint64_t v41 = [(BRCFSDownloader *)self _bumpThrottleForDownload:v10 throttle:v40];

  BOOL v42 = [v18 appLibrary];
  __int16 v43 = [v42 mangledID];
  id v44 = +[BRCUserDefaults defaultsForMangledID:v43];
  LODWORD(v41) = v41 > [v44 downloadRetryCountForFailure];

  if (!v41)
  {
LABEL_34:
    char v45 = 0;
  }
  else
  {
    [(BRCFSDownloader *)self _reportDownloadErrorForDocument:v18 error:v11];
    char v45 = 1;
  }
  if ((objc_msgSend(v11, "brc_isCloudKitCancellationError") & 1) != 0
    || (objc_msgSend(v11, "brc_isRetriable") & 1) != 0
    || objc_msgSend(v11, "brc_isCloudKitAssetFileModified"))
  {
    int v46 = [v10 progress];
    if ([v46 completedUnitCount])
    {
      uint64_t v47 = [v10 progress];
      char v48 = [v47 isFinished];

      if (v48)
      {
LABEL_43:
        id v55 = brc_bread_crumbs();
        uint64_t v56 = brc_default_log();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413058;
          uint64_t v101 = (uint64_t)v10;
          __int16 v102 = 2112;
          id v103 = v73;
          __int16 v104 = 2112;
          uint64_t v105 = (uint64_t)v11;
          __int16 v106 = 2112;
          uint64_t v107 = (uint64_t)v55;
          _os_log_debug_impl(&dword_1D353B000, v56, OS_LOG_TYPE_DEBUG, "[DEBUG] Rescheduling %@ (%@) for retriable error: %@%@", buf, 0x2Au);
        }

        v57 = [(BRCAccountSession *)self->super.super._session globalProgress];
        [v57 updateDownloadThrottleForDocument:v18 toState:1];

        BOOL v58 = [(BRCAccountSession *)self->super.super._session clientDB];
        v96[0] = MEMORY[0x1E4F143A8];
        v96[1] = 3221225472;
        v96[2] = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke;
        uint64_t v96[3] = &unk_1E6994080;
        id v97 = v75;
        id v59 = (void *)MEMORY[0x1D94389C0](v96);
        __int16 v60 = [v11 description];
        id v61 = [v10 progress];
        uint64_t v62 = [v61 completedUnitCount];
        unint64_t v63 = [v10 transferID];
        BOOL v64 = [v10 etag];
        [v58 execute:@"UPDATE client_downloads SET  transfer_operation = call_block(%@, next_retry_stamp), download_error = %@, unit_count_completed = %lld WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@", v59, v60, v62, v63, v74, v64];

        goto LABEL_46;
      }
      uint64_t v49 = [v77 mangledID];
      int v46 = +[BRCUserDefaults defaultsForMangledID:v49];

      unint64_t v50 = [(NSMutableDictionary *)self->_willRetryOperationProgress count];
      if (v50 < [v46 downloadWillRetryProgressMaxCount])
      {
        id v51 = [(BRCAccountSession *)self->super.super._session clientDB];
        [v51 assertOnQueue];

        uint64_t v52 = [v10 progress];
        willRetryOperationProgress = self->_willRetryOperationProgress;
        BOOL v54 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v18, "dbRowID"));
        [(NSMutableDictionary *)willRetryOperationProgress setObject:v52 forKeyedSubscript:v54];

        [v10 setProgressPublished:0];
      }
    }

    goto LABEL_43;
  }
  uint64_t v65 = brc_bread_crumbs();
  id v66 = brc_default_log();
  if (os_log_type_enabled(v66, (os_log_type_t)0x90u))
  {
    id v69 = [v18 st];
    uint64_t v70 = [v69 displayName];
    *(_DWORD *)buf = 138412802;
    uint64_t v101 = (uint64_t)v70;
    __int16 v102 = 2112;
    id v103 = v11;
    __int16 v104 = 2112;
    uint64_t v105 = (uint64_t)v65;
    _os_log_error_impl(&dword_1D353B000, v66, (os_log_type_t)0x90u, "[ERROR] Got non recoverable error when downloading %@: %@%@", buf, 0x20u);
  }
  os_log_t v67 = [(BRCAccountSession *)self->super.super._session globalProgress];
  [v67 updateDownloadThrottleForDocument:v18 toState:v33];

  if ((v45 & 1) == 0) {
    [(BRCFSDownloader *)self _reportDownloadErrorForDocument:v18 error:v11];
  }
  __int16 v68 = [(BRCAccountSession *)self->super.super._session clientDB];
  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_210;
  v89[3] = &unk_1E69961C8;
  int v94 = v33;
  v89[4] = self;
  id v90 = v10;
  id v11 = v11;
  id v91 = v11;
  int v95 = v74;
  id v18 = v18;
  id v92 = v18;
  id v93 = v77;
  [v68 groupInBatch:v89];

LABEL_46:
  __brc_leave_section(v99);
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  sqlite3_int64 v6 = sqlite3_value_int64(*a4);
  uint64_t v7 = [*(id *)(a1 + 32) downloadStream];
  [v7 signalWithDeadline:v6];

  sqlite3_result_null(a2);
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_210(uint64_t a1, void *a2)
{
  uint64_t v21 = MEMORY[0x1E4F143A8];
  uint64_t v22 = 3221225472;
  uint64_t v23 = __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_2;
  uint64_t v24 = &unk_1E69961A0;
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v25 = *(void *)(a1 + 32);
  uint64_t v5 = *(unsigned int *)(a1 + 72);
  id v26 = v4;
  id v6 = a2;
  uint64_t v7 = (void *)MEMORY[0x1D94389C0](&v21);
  uint64_t v8 = [*(id *)(a1 + 48) description];
  id v9 = [*(id *)(a1 + 40) transferID];
  uint64_t v10 = *(unsigned int *)(a1 + 76);
  id v11 = [*(id *)(a1 + 40) etag];
  [v6 execute:@"UPDATE client_downloads SET  throttle_state = %d, transfer_record = NULL, transfer_stage = call_block(%@, transfer_stage), transfer_operation = NULL, download_error = %@ WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@", v5, v7, v8, v9, v10, v11, v21, v22, v23, v24, v25];

  if (objc_msgSend(*(id *)(a1 + 48), "brc_isCloudKitUnknownItemError")
    && (![*(id *)(a1 + 40) kind]
     || [*(id *)(a1 + 40) kind] == 3))
  {
    uint64_t v12 = brc_bread_crumbs();
    long long v13 = brc_default_log();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG)) {
      __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_210_cold_2();
    }

    [*(id *)(a1 + 56) handleUnknownItemError];
  }
  if (*(_DWORD *)(a1 + 72) == 41 && [*(id *)(a1 + 40) kind] == 2)
  {
    long long v14 = brc_bread_crumbs();
    long long v15 = brc_default_log();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
      __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_210_cold_1();
    }

    long long v16 = *(void **)(a1 + 64);
    char v17 = [*(id *)(a1 + 40) itemID];
    uint64_t v18 = [v16 serverRankByItemID:v17];

    double v19 = [*(id *)(*(void *)(a1 + 32) + 8) applyScheduler];
    uint64_t v20 = [*(id *)(a1 + 64) dbRowID];
    [v19 setState:1 andApplyKind:2 forRank:v18 zoneRowID:v20];
  }
  [*(id *)(a1 + 56) saveToDB];
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_2(uint64_t a1, sqlite3_context *a2, uint64_t a3, void *a4)
{
  id v8 = (id)[NSString newFromSqliteValue:*a4];
  if (v8)
  {
    id v6 = [*(id *)(*(void *)(a1 + 32) + 8) stageRegistry];
    uint64_t v7 = [*(id *)(a1 + 40) itemID];
    [v6 cleanupStagedDownloadWithID:v8 forItemID:v7];
  }
  sqlite3_result_null(a2);
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_215(uint64_t a1, void *a2)
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = *(void **)(a1 + 32);
  uint64_t v4 = *(void **)(a1 + 40);
  id v5 = a2;
  id v6 = [v4 record];
  uint64_t v7 = [v3 _sanitizeRecord:v6];

  int v8 = *(unsigned __int8 *)(a1 + 104);
  if (*(unsigned char *)(a1 + 104))
  {
    id v9 = [*(id *)(a1 + 48) contextIdentifier];
  }
  else
  {
    id v9 = @"_done";
  }
  uint64_t v10 = *(void *)(a1 + 56);
  id v11 = [*(id *)(a1 + 40) transferID];
  uint64_t v12 = *(unsigned int *)(a1 + 96);
  long long v13 = [*(id *)(a1 + 40) etag];
  [v5 execute:@"UPDATE client_downloads SET  throttle_state = %d, transfer_queue = %@, transfer_record = %@, transfer_stage = %@, transfer_operation = NULL, download_error = NULL WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@", 1, v9, v7, v10, v11, v12, v13];

  if (v8) {
  [*(id *)(a1 + 64) saveToDB];
  }
  if (*(unsigned char *)(a1 + 104))
  {
    long long v14 = [*(id *)(a1 + 48) downloadStream];
    [v14 signal];
LABEL_12:

    goto LABEL_13;
  }
  if (*(void *)(a1 + 88))
  {
    long long v15 = brc_bread_crumbs();
    long long v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v20 = *(void *)(a1 + 88);
      uint64_t v21 = [*(id *)(a1 + 40) itemID];
      *(_DWORD *)buf = 134218754;
      uint64_t v23 = v20;
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      __int16 v26 = 2080;
      uint64_t v27 = BRCPrettyPrintEnum();
      __int16 v28 = 2112;
      __int16 v29 = v15;
      _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Apply Changes[%lld]: %@ state is %s%@", buf, 0x2Au);
    }
    uint64_t v17 = *(unsigned int *)(a1 + 100);
    uint64_t v18 = *(void *)(a1 + 88);
    double v19 = *(void **)(a1 + 72);
    long long v14 = [*(id *)(a1 + 80) dbRowID];
    [v19 setState:v17 andApplyKind:2 forRank:v18 zoneRowID:v14];
    goto LABEL_12;
  }
LABEL_13:
}

- (void)rescheduleJobsPendingWinnerForItem:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAccountSession *)self->super.super._session clientDB];
  objc_msgSend(v5, "execute:", @"UPDATE client_downloads SET throttle_state = 1 WHERE throttle_state = %u AND throttle_id = %lld", 42, objc_msgSend(v4, "dbRowID"));
  if ([v5 changes])
  {
    id v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSDownloader rescheduleJobsPendingWinnerForItem:]();
    }

    int v8 = [v4 syncContextUsedForTransfers];
    id v9 = [v8 downloadStream];
    [v9 signal];
  }
}

- (void)rescheduleJobsPendingRecentsAndFavoritesFetchInZone:(id)a3
{
  id v4 = a3;
  id v5 = [(BRCAccountSession *)self->super.super._session clientDB];
  id v6 = [v4 dbRowID];
  [v5 execute:@"UPDATE client_downloads SET throttle_state = 1 WHERE throttle_state = 40   AND throttle_state != 0   AND zone_rowid = %@", v6];

  if ([v5 changes])
  {
    uint64_t v7 = brc_bread_crumbs();
    int v8 = brc_default_log();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSDownloader rescheduleJobsPendingWinnerForItem:]();
    }

    if ([v4 isSharedZone])
    {
      id v9 = [v4 metadataSyncContext];
      uint64_t v10 = [v9 downloadStream];
      [v10 signal];
    }
    else
    {
      id v11 = [v4 dbRowID];
      id v9 = (void *)[v5 fetch:@"SELECT distinct app_library_rowid FROM client_downloads WHERE throttle_state = 1   AND throttle_state != 0   AND zone_rowid = %@", v11];

      if ([v9 next])
      {
        do
        {
          uint64_t v12 = [v9 numberAtIndex:0];
          long long v13 = [(BRCAccountSession *)self->super.super._session appLibraryByRowID:v12];
          long long v14 = [v13 transferSyncContext];
          long long v15 = [v14 downloadStream];
          [v15 signal];
        }
        while (([v9 next] & 1) != 0);
      }
    }
  }
}

- (void)_cancelJobs:(id)a3 state:(int)a4
{
  uint64_t v29 = *(void *)&a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 next])
  {
    while (1)
    {
      context = (void *)MEMORY[0x1D9438760]();
      id v6 = [v5 numberAtIndex:0];
      uint64_t v36 = [v5 intAtIndex:1];
      uint64_t v35 = [v5 stringAtIndex:2];
      uint64_t v7 = [v5 uuidAtIndex:3];
      int v8 = [v5 stringAtIndex:4];
      uint64_t v9 = [v5 numberAtIndex:5];
      uint64_t v10 = [v5 numberAtIndex:6];
      int v11 = [v5 intAtIndex:7];
      uint64_t v12 = [v5 longLongAtIndex:8];
      uint64_t v33 = (void *)v9;
      uint64_t v13 = [(BRCAccountSession *)self->super.super._session appLibraryByRowID:v9];
      uint64_t v32 = (void *)v10;
      uint64_t v30 = [(BRCAccountSession *)self->super.super._session serverZoneByRowID:v10];
      int v31 = (void *)v13;
      long long v14 = +[BRCSyncContext transferContextForServerZone:appLibrary:](BRCSyncContext, "transferContextForServerZone:appLibrary:");
      if (v11 == 1)
      {
        long long v15 = brc_bread_crumbs();
        long long v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v28 = BRCPrettyPrintEnum();
          *(_DWORD *)buf = 138413058;
          int v38 = v6;
          __int16 v39 = 2080;
          uint64_t v40 = v28;
          __int16 v41 = 2112;
          BOOL v42 = v35;
          __int16 v43 = 2112;
          id v44 = v15;
          _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@-%s-%@]: Cancelling download%@", buf, 0x2Au);
        }

        self->_activeDownloadsSize -= v12;
        if (v36 == 3 || !v36) {
          break;
        }
      }
      double v19 = 0;
      if (v7) {
        goto LABEL_10;
      }
LABEL_11:
      if (v8)
      {
        if (!v19)
        {
          double v19 = -[BRCAccountSession itemIDByRowID:](self->super.super._session, "itemIDByRowID:", [v6 unsignedIntegerValue]);
        }
        uint64_t v22 = brc_bread_crumbs();
        uint64_t v23 = brc_default_log();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v27 = BRCPrettyPrintEnum();
          *(_DWORD *)buf = 138413314;
          int v38 = v6;
          __int16 v39 = 2080;
          uint64_t v40 = v27;
          __int16 v41 = 2112;
          BOOL v42 = v35;
          __int16 v43 = 2112;
          id v44 = v8;
          __int16 v45 = 2112;
          int v46 = v22;
          _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@-%s-%@]: Cleaning up download stage: %@%@", buf, 0x34u);
        }

        __int16 v24 = [(BRCAccountSession *)self->super.super._session stageRegistry];
        [v24 cleanupStagedDownloadWithID:v8 forItemID:v19];
      }
      if (v14)
      {
        uint64_t v25 = [v5 db];
        __int16 v26 = [v14 contextIdentifier];
        [v25 execute:@"UPDATE client_downloads SET  throttle_state = %d, transfer_queue = %@, transfer_record = NULL, transfer_stage = NULL, transfer_operation = NULL, unit_count_completed = 0 WHERE throttle_id = %@ AND download_kind = %u AND download_etag = %@", v29, v26, v6, v36, v35];
      }
      if (([v5 next] & 1) == 0) {
        goto LABEL_20;
      }
    }
    uint64_t v17 = -[BRCAccountSession itemByRowID:](self->super.super._session, "itemByRowID:", [v6 unsignedIntegerValue]);
    uint64_t v18 = [v17 asDocument];

    double v19 = [v18 itemID];
    uint64_t v20 = [(BRCAccountSession *)self->super.super._session globalProgress];
    [v20 updateDownloadThrottleForDocument:v18 toState:v29];

    if (!v7) {
      goto LABEL_11;
    }
LABEL_10:
    uint64_t v21 = [v14 downloadStream];
    [v21 cancelTransferID:v6 operationID:v7];

    goto LABEL_11;
  }
LABEL_20:
  [v5 close];
}

- (void)_finishDownloadCleanup:(id)a3
{
  id v6 = a3;
  id v3 = [v6 clientZone];
  id v4 = [v6 itemID];
  id v5 = [v3 popDownloadedBlockForItemID:v4];

  if (v5) {
    ((void (**)(void, id))v5)[2](v5, v6);
  }
}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5
{
}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5 andNotifyDownloadTrackers:(BOOL)a6
{
}

- (id)_getCancelErrorFromCancelReason:(int)a3
{
  if (a3 == 1)
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorRescheduleDownloadForMoreRecentServerVersion");
  }
  else if (a3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      -[BRCFSDownloader _getCancelErrorFromCancelReason:]();
    }

    id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorDownloadCancelled");
  }
  else
  {
    id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorOperationCancelled");
  }

  return v3;
}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4 etag:(id)a5 andNotifyDownloadTrackers:(BOOL)a6 cancelReason:(int)a7
{
  uint64_t v7 = *(void *)&a7;
  BOOL v8 = a6;
  uint64_t v10 = *(void *)&a4;
  id v12 = a3;
  id v13 = a5;
  long long v14 = v13;
  if (v7 != 1) {
    goto LABEL_8;
  }
  if (!v13)
  {
    if (!v10) {
      goto LABEL_8;
    }
    goto LABEL_4;
  }
  uint64_t v21 = brc_bread_crumbs();
  uint64_t v22 = brc_default_log();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
    -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:]();
  }

  if (v10)
  {
LABEL_4:
    if (v10 != 3)
    {
      long long v15 = brc_bread_crumbs();
      long long v16 = brc_default_log();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
        -[BRCFSDownloader cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:]();
      }
    }
  }
LABEL_8:
  uint64_t v17 = [(BRCAccountSession *)self->super.super._session clientDB];
  uint64_t v18 = (void *)[v17 fetch:@"SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@   AND throttle_state != 0", objc_msgSend(v12, "dbRowID"), v10, v14];

  double v19 = [(BRCFSDownloader *)self _getCancelErrorFromCancelReason:v7];
  [(BRCFSDownloader *)self _cancelJobs:v18 state:0];
  if (v10 == 3 || !v10)
  {
    [(BRCFSDownloader *)self _finishDownloadCleanup:v12];
    if (v8)
    {
      uint64_t v20 = [(BRCAccountSession *)self->super.super._session downloadTrackers];
      [v20 document:v12 didCompleteDownloadWithError:v19];
    }
  }
}

- (void)cancelAndCleanupItemDownload:(id)a3 kind:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v8 = a3;
  id v6 = [(BRCAccountSession *)self->super.super._session clientDB];
  uint64_t v7 = (void *)[v6 fetch:@"SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE throttle_id = %lld AND download_kind = %u   AND throttle_state != 0", objc_msgSend(v8, "dbRowID"), v4];

  [(BRCFSDownloader *)self _cancelJobs:v7 state:0];
  if (v4 == 3 || !v4) {
    [(BRCFSDownloader *)self _finishDownloadCleanup:v8];
  }
}

- (void)cancelAndCleanupItemDownloads:(id)a3
{
  session = self->super.super._session;
  id v5 = a3;
  id v6 = [(BRCAccountSession *)session clientDB];
  id v7 = (id)[v6 fetch:@"SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE throttle_id = %lld AND throttle_state != 0", objc_msgSend(v5, "dbRowID")];

  [(BRCFSDownloader *)self _cancelJobs:v7 state:0];
  [(BRCFSDownloader *)self _finishDownloadCleanup:v5];
}

- (void)addAliasItem:(id)a3 toDownloadingItem:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BRCAccountSession *)self->super.super._session clientDB];
  uint64_t v9 = objc_msgSend(v8, "fetchObjectOfClass:sql:", objc_opt_class(), @"SELECT transfer_operation    FROM client_downloads  WHERE throttle_id = %lld AND throttle_state == 1", objc_msgSend(v7, "dbRowID"));

  if (v9)
  {
    uint64_t v10 = brc_bread_crumbs();
    int v11 = brc_default_log();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      __int16 v19 = 2112;
      uint64_t v20 = v10;
      _os_log_debug_impl(&dword_1D353B000, v11, OS_LOG_TYPE_DEBUG, "[DEBUG] adding alias item %@ to currently transfering %@%@", buf, 0x20u);
    }

    id v12 = [v7 syncContextUsedForTransfers];
    id v13 = [v12 downloadStream];
    long long v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "dbRowID"));
    [v13 addAliasItem:v6 toTransferWithID:v14 operationID:v9];
  }
}

- (void)deleteJobsMatching:(id)a3
{
  session = self->super.super._session;
  id v5 = a3;
  id v6 = [(BRCAccountSession *)session clientDB];
  id v7 = [v5 matchingJobsWhereSQLClause];
  id v8 = (void *)[v6 fetch:@"SELECT throttle_id, download_kind, download_etag, transfer_operation, transfer_stage, app_library_rowid, zone_rowid, throttle_state, transfer_size FROM client_downloads WHERE %@ AND throttle_state > %d", v7, 0];

  [(BRCFSDownloader *)self _cancelJobs:v8 state:0];
  v9.receiver = self;
  v9.super_class = (Class)BRCFSDownloader;
  [(BRCFSSchedulerBase *)&v9 deleteJobsMatching:v5];
}

- (void)updateContentDownloadForMetaOnlyChange:(id)a3 fromEtag:(id)a4 toEtag:(id)a5
{
  session = self->super.super._session;
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v12 = [(BRCAccountSession *)session clientDB];
  uint64_t v11 = [v10 dbRowID];

  [v12 execute:@"UPDATE client_downloads SET download_etag = %@ WHERE throttle_id = %lld AND download_etag = %@ AND download_kind = %d", v8, v11, v9, 0];
}

- (unint64_t)sizeOfActiveDownloads
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = v3;
  if (!self->_lastDownloadRefresh
    || (objc_msgSend(v3, "timeIntervalSinceDate:"), v5 > self->_activeDownloadSizeRefreshInterval))
  {
    id v6 = [(BRCAccountSession *)self->super.super._session clientDB];
    uint64_t v20 = 0;
    uint64_t v21 = &v20;
    uint64_t v22 = 0x3032000000;
    uint64_t v23 = __Block_byref_object_copy__13;
    __int16 v24 = __Block_byref_object_dispose__13;
    id v25 = 0;
    uint64_t v14 = MEMORY[0x1E4F143A8];
    uint64_t v15 = 3221225472;
    id v16 = __40__BRCFSDownloader_sizeOfActiveDownloads__block_invoke;
    __int16 v17 = &unk_1E6996218;
    __int16 v19 = &v20;
    id v7 = v6;
    id v18 = v7;
    [v7 disableProfilingForQueriesInBlock:&v14];
    objc_storeStrong((id *)&self->_lastDownloadRefresh, v4);
    id v8 = brc_bread_crumbs();
    id v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      unint64_t activeDownloadsSize = self->_activeDownloadsSize;
      uint64_t v13 = objc_msgSend((id)v21[5], "longLongValue", v14, v15, v16, v17);
      *(_DWORD *)buf = 134218498;
      unint64_t v27 = activeDownloadsSize;
      __int16 v28 = 2048;
      uint64_t v29 = v13;
      __int16 v30 = 2112;
      int v31 = v8;
      _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Refreshed active download size %llu -> %llu%@", buf, 0x20u);
    }

    self->_unint64_t activeDownloadsSize = [(id)v21[5] longLongValue];
    _Block_object_dispose(&v20, 8);
  }
  unint64_t v10 = self->_activeDownloadsSize;

  return v10;
}

void __40__BRCFSDownloader_sizeOfActiveDownloads__block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) numberWithSQL:@"SELECT SUM(transfer_size) FROM client_downloads WHERE throttle_state = 1"];
  uint64_t v3 = *(void *)(*(void *)(a1 + 40) + 8);
  uint64_t v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)makeContentLive:(id)a3
{
  id v4 = a3;
  if ([v4 isFault])
  {
    char v5 = 1;
  }
  else
  {
    if ([v4 shouldHaveThumbnail])
    {
      if (([v4 shouldTransferThumbnail] & 1) == 0)
      {
        id v6 = [v4 currentVersion];
        char v7 = [v6 hasThumbnail];

        if ((v7 & 1) == 0)
        {
          id v8 = [[BRCItemToPathLookup alloc] initWithItem:v4];
          id v9 = [(BRCItemToPathLookup *)v8 coordinatedReadURL];
          unint64_t v10 = [v4 itemID];
          uint64_t v11 = [v4 clientZone];
          if (v9)
          {
            id v12 = (void *)MEMORY[0x1E4F3A6A8];
            v20[0] = MEMORY[0x1E4F143A8];
            v20[1] = 3221225472;
            v20[2] = __35__BRCFSDownloader_makeContentLive___block_invoke;
            v20[3] = &unk_1E6996240;
            id v21 = v9;
            uint64_t v22 = self;
            id v23 = v11;
            id v24 = v10;
            [v12 noteCloudDocsDownloadedFileAtURL:v21 completionHandler:v20];

            uint64_t v13 = v21;
          }
          else
          {
            uint64_t v13 = brc_bread_crumbs();
            uint64_t v14 = brc_default_log();
            if (os_log_type_enabled(v14, (os_log_type_t)0x90u)) {
              -[BRCFSDownloader makeContentLive:]((uint64_t)v4);
            }
          }
          [(BRCItemToPathLookup *)v8 closePaths];
        }
      }
    }
    uint64_t v15 = [(BRCAccountSession *)self->super.super._session clientDB];
    v17[0] = MEMORY[0x1E4F143A8];
    v17[1] = 3221225472;
    v17[2] = __35__BRCFSDownloader_makeContentLive___block_invoke_263;
    v17[3] = &unk_1E6993A88;
    id v18 = v4;
    __int16 v19 = self;
    char v5 = [v15 groupInTransaction:v17];
  }
  return v5;
}

void __35__BRCFSDownloader_makeContentLive___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = v3;
  if (v3)
  {
    char v5 = [v3 domain];
    if ([v5 isEqualToString:*MEMORY[0x1E4F3A738]])
    {
      uint64_t v6 = [v4 code];

      if (v6 == 104)
      {
        char v7 = brc_bread_crumbs();
        id v8 = brc_default_log();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
          __35__BRCFSDownloader_makeContentLive___block_invoke_cold_1(a1);
        }
LABEL_10:

        goto LABEL_11;
      }
    }
    else
    {
    }
    char v7 = brc_bread_crumbs();
    id v8 = brc_default_log();
    if (os_log_type_enabled(v8, (os_log_type_t)0x90u))
    {
      uint64_t v15 = [*(id *)(a1 + 32) path];
      *(_DWORD *)buf = 138412802;
      id v21 = v15;
      __int16 v22 = 2112;
      id v23 = v4;
      __int16 v24 = 2112;
      id v25 = v7;
      _os_log_error_impl(&dword_1D353B000, v8, (os_log_type_t)0x90u, "[ERROR] failed asking QL to generate a thumbnail at '%@': %@%@", buf, 0x20u);
    }
    goto LABEL_10;
  }
  uint64_t v9 = *(void *)(a1 + 40);
  unint64_t v10 = *(void **)(v9 + 72);
  uint64_t v11 = [*(id *)(v9 + 8) clientDB];
  id v12 = [v11 serialQueue];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = __35__BRCFSDownloader_makeContentLive___block_invoke_261;
  v16[3] = &unk_1E6993600;
  id v17 = *(id *)(a1 + 48);
  id v13 = *(id *)(a1 + 56);
  uint64_t v14 = *(void *)(a1 + 40);
  id v18 = v13;
  uint64_t v19 = v14;
  brc_task_tracker_async_with_logs(v10, v12, v16, 0);

  char v7 = v17;
LABEL_11:
}

void __35__BRCFSDownloader_makeContentLive___block_invoke_261(uint64_t a1)
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) itemByItemID:*(void *)(a1 + 40)];
  if (v2)
  {
    id v3 = +[BRCItemToPathLookup lookupForItem:v2];
    id v4 = [*(id *)(*(void *)(a1 + 48) + 8) fsReader];
    char v5 = [v3 byFileSystemID];
    uint64_t v6 = [v3 coordinatedReadURL];
    [v4 thumbnailChangedForItem:v2 relpath:v5 url:v6 error:0];

    [v3 closePaths];
  }
  else
  {
    id v3 = brc_bread_crumbs();
    char v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v8 = *(void *)(a1 + 40);
      int v9 = 138412546;
      uint64_t v10 = v8;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEFAULT, "[WARNING] li %@ disappeared while waiting for thumbnail generation%@", (uint8_t *)&v9, 0x16u);
    }
  }
}

uint64_t __35__BRCFSDownloader_makeContentLive___block_invoke_263(uint64_t a1, void *a2)
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v3 = a2;
  id v4 = (id *)(a1 + 32);
  char v5 = [*(id *)(a1 + 32) st];
  uint64_t v6 = [v5 documentID];
  int v7 = [v3 execute:@"DELETE FROM client_pkg_items WHERE item_doc_id = %@", v6];

  if (!v7)
  {
    id v16 = 0;
    uint64_t v27 = 0;
    goto LABEL_21;
  }
  uint64_t v8 = brc_bread_crumbs();
  int v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = [v3 changes];
    uint64_t v32 = [*v4 fileObjectID];
    *(_DWORD *)buf = 134218498;
    uint64_t v42 = v31;
    __int16 v43 = 2112;
    id v44 = v32;
    __int16 v45 = 2112;
    int v46 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] removed %lld items in pkg:%@%@", buf, 0x20u);
  }
  uint64_t v10 = [*v4 desiredVersion];
  int v11 = [v10 isPackage];

  if (!v11) {
    goto LABEL_19;
  }
  uint64_t v12 = [*v4 dbRowID];
  uint64_t v13 = [*v4 desiredVersion];
  uint64_t v14 = [v13 ckInfo];
  uint64_t v15 = [v14 etag];
  id v16 = (void *)[v3 stringWithSQL:@"SELECT transfer_stage FROM client_downloads  WHERE throttle_id = %lld AND download_kind = %d AND download_etag = %@    AND transfer_queue = '_done'", v12, 0, v15];

  if (!v16)
  {
    __int16 v28 = brc_bread_crumbs();
    uint64_t v29 = brc_default_log();
    if (os_log_type_enabled(v29, (os_log_type_t)0x90u)) {
      __35__BRCFSDownloader_makeContentLive___block_invoke_263_cold_1((void *)(a1 + 32));
    }

LABEL_19:
    id v16 = 0;
LABEL_20:
    [*(id *)(a1 + 40) cancelAndCleanupItemDownload:*(void *)(a1 + 32) kind:0];
    uint64_t v27 = 1;
    goto LABEL_21;
  }
  id v35 = v3;
  v34 = [*(id *)(*(void *)(a1 + 40) + 8) stageRegistry];
  uint64_t v33 = [v34 createURLForDownloadWithStageID:v16 name:@"brpackage-extended"];
  id v17 = [[BRCPackageManifestReader alloc] initWithURL:v33];
  [(BRCPackageManifestReader *)v17 setItemClass:objc_opt_class()];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v18 = v17;
  uint64_t v19 = [(BRCPackageManifestReader *)v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v19)
  {
    uint64_t v20 = v19;
    uint64_t v21 = *(void *)v37;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v37 != v21) {
          objc_enumerationMutation(v18);
        }
        uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * v22);
        __int16 v24 = (void *)MEMORY[0x1D9438760]();
        id v25 = [[BRCPackageItem alloc] initWithPBItem:v23 forLocalItem:*(void *)(a1 + 32)];
        [(BRCPackageItem *)v25 saveToDBWithSession:*(void *)(*(void *)(a1 + 40) + 8)];

        ++v22;
      }
      while (v20 != v22);
      uint64_t v20 = [(BRCPackageManifestReader *)v18 countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v20);
  }

  uint64_t v26 = [(BRCPackageManifestReader *)v18 error];

  if (!v26)
  {
    id v3 = v35;
    goto LABEL_20;
  }
  uint64_t v27 = 0;
  id v3 = v35;
LABEL_21:

  return v27;
}

- (BOOL)scheduleContentDownloadForItem:(id)a3 serverItem:(id)a4 options:(unint64_t)a5 etagIfLoser:(id)a6 stageFileName:(id)a7 error:(id *)a8
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  memset(v32, 0, sizeof(v32));
  __brc_create_section(0, (uint64_t)"-[BRCFSDownloader scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:]", 1192, v32);
  id v18 = brc_bread_crumbs();
  uint64_t v19 = brc_default_log();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v31 = v32[0];
    __int16 v30 = [v14 itemID];
    *(_DWORD *)buf = 134219010;
    uint64_t v34 = v31;
    __int16 v35 = 2112;
    long long v36 = v30;
    __int16 v37 = 2112;
    id v38 = v14;
    __int16 v39 = 2112;
    id v40 = v15;
    __int16 v41 = 2112;
    uint64_t v42 = v18;
    _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx scheduling content download for %@\nlocal: %@\nserver: %@%@", buf, 0x34u);
  }
  uint64_t v20 = [v15 latestVersion];
  uint64_t v21 = [v20 ckInfo];
  uint64_t v22 = [v21 etag];

  uint64_t v23 = +[BRCFSDownloaderUtil downloadKindWithEtagIfLoser:v16 options:a5];
  __int16 v24 = -[BRCDownloadJobIdentifier initWithDBRowID:etag:kind:]([BRCDownloadJobIdentifier alloc], "initWithDBRowID:etag:kind:", [v14 dbRowID], v22, v23);
  int v25 = [(BRCFSSchedulerBase *)self jobStateFor:v24];
  if (v25)
  {
    if (v25 == 1)
    {
      uint64_t v26 = brc_bread_crumbs();
      uint64_t v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSDownloader scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:]();
      }
LABEL_11:

      BOOL v28 = 1;
      goto LABEL_12;
    }
    if ((a5 & 8) == 0)
    {
      uint64_t v26 = brc_bread_crumbs();
      uint64_t v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSDownloader scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:]();
      }
      goto LABEL_11;
    }
  }
  BOOL v28 = [(BRCFSDownloader *)self _createDownloadingJobForItem:v14 state:1 kind:v23 etag:v22 userInitiated:(a5 >> 3) & 1 stageFileName:v17 error:a8];
LABEL_12:

  __brc_leave_section(v32);
  return v28;
}

- (void)performFirstSchedulingAfterStartupInDB:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 execute:@"UPDATE client_downloads SET transfer_operation = NULL WHERE (transfer_operation >= '')"];
  if ([v4 changes])
  {
    char v5 = brc_bread_crumbs();
    uint64_t v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSDownloader performFirstSchedulingAfterStartupInDB:](v4);
    }
  }
  int v7 = (void *)[v4 fetch:@"SELECT app_library_rowid, zone_rowid, transfer_queue   FROM client_downloads  WHERE throttle_state = 1 GROUP BY app_library_rowid, zone_rowid, transfer_queue"];
  if ([v7 next])
  {
    do
    {
      uint64_t v8 = (void *)MEMORY[0x1D9438760]();
      session = self->super.super._session;
      uint64_t v10 = [v7 numberAtIndex:0];
      int v11 = [(BRCAccountSession *)session appLibraryByRowID:v10];

      uint64_t v12 = self->super.super._session;
      uint64_t v13 = [v7 numberAtIndex:1];
      id v14 = [(BRCAccountSession *)v12 serverZoneByRowID:v13];

      id v15 = [v7 stringAtIndex:2];
      if (([v15 isEqualToString:@"_prepare"] & 1) == 0
        && ([v15 isEqualToString:@"_retry"] & 1) == 0)
      {
        id v16 = brc_bread_crumbs();
        id v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          uint64_t v20 = [v7 stringAtIndex:2];
          *(_DWORD *)buf = 138412546;
          uint64_t v22 = v20;
          __int16 v23 = 2112;
          __int16 v24 = v16;
          _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Kicking downloads for %@%@", buf, 0x16u);
        }
        id v18 = +[BRCSyncContext transferContextForServerZone:v14 appLibrary:v11];
        uint64_t v19 = [v18 downloadStream];
        [v19 signal];
      }
    }
    while (([v7 next] & 1) != 0);
  }
}

- (void)schedule
{
  id v3 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v4 = [v3 readerScanBatchSize];

  char v5 = [MEMORY[0x1E4FBA8F8] formatInjection:@"transfer_queue = '_retry' AND transfer_operation IS NULL"];
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4FBA908], "rawInjection:length:", "rowid, throttle_id, app_library_rowid, zone_rowid", 49);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __27__BRCFSDownloader_schedule__block_invoke;
  v7[3] = &unk_1E6996268;
  v7[4] = self;
  [(BRCFSSchedulerBase *)self scheduleWithBatchSize:v4 whereSQLClause:v5 columns:v6 actionHandler:v7];
}

void __27__BRCFSDownloader_schedule__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  uint64_t v6 = [v5 numberAtIndex:a3];
  uint64_t v20 = [v5 numberAtIndex:(a3 + 1)];
  int v7 = [v5 numberAtIndex:(a3 + 2)];
  uint64_t v8 = [v5 numberAtIndex:(a3 + 3)];
  int v9 = [*(id *)(*(void *)(a1 + 32) + 8) appLibraryByRowID:v7];
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 8) serverZoneByRowID:v8];
  int v11 = +[BRCSyncContext transferContextForServerZone:v10 appLibrary:v9];
  uint64_t v12 = [v11 contextIdentifier];
  if (v9)
  {
    uint64_t v13 = [v5 db];
    id v14 = [v11 contextIdentifier];
    [v13 execute:@"UPDATE client_downloads SET transfer_queue = %@ WHERE rowid = %@", v14, v6];

    id v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v22 = v20;
      __int16 v23 = 2112;
      __int16 v24 = v12;
      __int16 v25 = 2112;
      uint64_t v26 = v15;
      _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@]: job has been put back in queue %@%@", buf, 0x20u);
    }

    id v17 = [v11 downloadStream];
    [v17 signal];
  }
  else
  {
    id v18 = brc_bread_crumbs();
    uint64_t v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT))
    {
      *(_DWORD *)buf = 138413058;
      uint64_t v22 = v20;
      __int16 v23 = 2112;
      __int16 v24 = v7;
      __int16 v25 = 2112;
      uint64_t v26 = v6;
      __int16 v27 = 2112;
      BOOL v28 = v18;
      _os_log_fault_impl(&dword_1D353B000, v19, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Downloader[%@]: failed to find app library with id %@, dropping the download %@%@", buf, 0x2Au);
    }

    id v17 = [v5 db];
    [v17 execute:@"DELETE FROM client_downloads WHERE rowid = %@", v6];
  }
}

- (unint64_t)inFlightSize
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  uint64_t v2 = [(BRCAccountSession *)self->super.super._session syncContextProvider];
  id v3 = [v2 allSyncContexts];

  uint64_t v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    unint64_t v6 = 0;
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v3);
        }
        int v9 = [*(id *)(*((void *)&v11 + 1) + 8 * i) downloadStream];
        v6 += [v9 inFlightSize];
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
  else
  {
    unint64_t v6 = 0;
  }

  return v6;
}

- (id)generateContentStageFileNameForItem:(id)a3 etag:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  uint64_t v7 = [v6 st];
  uint64_t v8 = [v7 logicalName];
  int v9 = objc_msgSend(v8, "br_pathExtension");

  uint64_t v10 = [v9 length];
  long long v11 = NSString;
  uint64_t v12 = [v6 dbRowID];

  long long v13 = [MEMORY[0x1E4F29128] UUID];
  uint64_t v14 = [v13 UUIDString];
  id v15 = (void *)v14;
  if (v10) {
    [v11 stringWithFormat:@"content-%lld-%@-%@.%@", v12, v5, v14, v9];
  }
  else {
  uint64_t v16 = [v11 stringWithFormat:@"content-%lld-%@-%@", v12, v5, v14, v18];
  }

  return v16;
}

- (void)_sendContentsBatch:(id)a3 sizeHint:(int64_t)a4 maxRecordsCount:(unint64_t)a5 isLoserDownload:(BOOL)a6
{
  BOOL v91 = a6;
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = +[BRCAccountsManager sharedManager];
  int v10 = [v9 isInSyncBubble];

  if (v10)
  {
    int v86 = brc_bread_crumbs();
    int v87 = brc_default_log();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_FAULT)) {
      -[BRCFSDownloader _finishedDownload:syncContext:operationID:error:]();
    }
  }
  long long v11 = [v8 syncContext];
  uint64_t v12 = [v11 defaults];
  uint64_t v89 = [v12 minimumDiskSpaceRequiredToDownload];

  long long v13 = [v11 defaults];
  uint64_t v94 = [v13 minimumDiskSpaceRequiredToDownloadUserInitiated];

  uint64_t v14 = 0;
  id v15 = 0;
  uint64_t v16 = 0;
  id v17 = 0;
  uint64_t v18 = 0;
  if ([0 itemsCount] >= a5) {
    goto LABEL_69;
  }
  id v92 = v11;
  uint64_t v93 = 0;
  unint64_t v97 = a5;
  uint64_t v19 = 0;
  uint64_t v14 = 0;
  id v95 = 0;
  uint64_t v20 = 0;
  uint64_t v18 = 0;
  int v90 = 0;
  uint64_t v88 = *MEMORY[0x1E4F281F8];
  v99 = self;
  v96 = v8;
  while (1)
  {
    uint64_t v21 = v14;
    uint64_t v22 = (void *)MEMORY[0x1D9438760]();
    uint64_t v14 = [v8 nextDocumentItem];

    if (!v14) {
      break;
    }
    context = v22;
    uint64_t v104 = [v8 stageID];

    uint64_t v103 = [v8 etag];

    uint64_t v98 = [v8 completedUnitCount];
    unint64_t v23 = [(BRCAccountSession *)self->super.super._session availableDiskSpace];
    __int16 v24 = [v14 desiredVersion];
    uint64_t v25 = [v24 size];

    uint64_t v26 = self;
    unint64_t v27 = [(BRCFSDownloader *)self inFlightSize];
    uint64_t v101 = v19;
    uint64_t v28 = [(BRCTransferBatchOperation *)v19 totalSize];
    uint64_t v29 = [v14 desiredVersion];
    if (([v29 options] & 8) != 0)
    {

LABEL_9:
      int v33 = 0;
      BYTE4(v93) = 1;
      unint64_t v34 = v94;
      goto LABEL_10;
    }
    __int16 v30 = [(BRCAccountSession *)v26->super.super._session downloadTrackers];
    uint64_t v31 = [v14 fileObjectID];
    char v32 = [v30 hasPendingTrackerForFileObjectID:v31];

    if (v32) {
      goto LABEL_9;
    }
    v90 |= [v14 isFault];
    int v33 = 1;
    unint64_t v34 = v89;
LABEL_10:
    unint64_t v35 = v27 + v28 + v25;
    if (v23 >= v35 && v23 - v35 >= v34)
    {
      __int16 v45 = brc_bread_crumbs();
      int v46 = brc_default_log();
      uint64_t v47 = v104;
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v76 = [v14 dbRowID];
        uint64_t v77 = BRCPrettyPrintEnum();
        *(_DWORD *)buf = 134219522;
        uint64_t v111 = v76;
        __int16 v112 = 2080;
        unint64_t v113 = v77;
        __int16 v114 = 2112;
        unint64_t v115 = v103;
        __int16 v116 = 2048;
        unint64_t v117 = v23;
        __int16 v118 = 2048;
        unint64_t v119 = v35;
        __int16 v120 = 2048;
        unint64_t v121 = v34;
        __int16 v122 = 2112;
        v123 = v45;
        _os_log_debug_impl(&dword_1D353B000, v46, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%lld-%s-%@]: enough disk space to download (%llu available, %llu needed, %llu minimum)%@", buf, 0x48u);
      }

      id v8 = v96;
      uint64_t v19 = v101;
      uint64_t v18 = (void *)v103;
      if (!v104)
      {
        char v48 = brc_bread_crumbs();
        uint64_t v49 = brc_default_log();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v111 = (uint64_t)v48;
          _os_log_debug_impl(&dword_1D353B000, v49, OS_LOG_TYPE_DEBUG, "[DEBUG] No stage ID, createing a new one%@", buf, 0xCu);
        }

        uint64_t v47 = [(BRCFSDownloader *)v99 generateContentStageFileNameForItem:v14 etag:v103];
      }
      self = v99;
      if (!v101)
      {
        uint64_t v19 = [[BRCDownloadContentsBatchOperation alloc] initWithSyncContext:v92 sessionContext:v99->super.super._session];
        unint64_t v50 = [(_BRCOperation *)v19 operationID];

        v105[0] = MEMORY[0x1E4F143A8];
        v105[1] = 3221225472;
        v105[2] = __79__BRCFSDownloader__sendContentsBatch_sizeHint_maxRecordsCount_isLoserDownload___block_invoke;
        v105[3] = &unk_1E6996290;
        v105[4] = v99;
        id v106 = v92;
        id v95 = v50;
        id v107 = v95;
        [(BRCDownloadContentsBatchOperation *)v19 setPerDownloadCompletionBlock:v105];
      }
      id v51 = [BRCDownloadContent alloc];
      if (v91) {
        uint64_t v52 = v103;
      }
      else {
        uint64_t v52 = 0;
      }
      uint64_t v104 = v47;
      long long v53 = -[BRCDownloadContent initWithDocument:stageID:etagIfLoser:downloadKind:](v51, "initWithDocument:stageID:etagIfLoser:downloadKind:", v14, v47, v52, [v96 kind]);
      __int16 v37 = (BRCDownloadJobIdentifier *)v53;
      if (v91
        || ([(BRCDownload *)v53 etag],
            BOOL v54 = objc_claimAutoreleasedReturnValue(),
            char v55 = [v54 isEqualToString:v103],
            v54,
            (v55 & 1) != 0))
      {
        if (([(BRCDownloadJobIdentifier *)v37 requiresTwoPhase] & 1) == 0)
        {
          willRetryOperationProgress = v99->_willRetryOperationProgress;
          v57 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "dbRowID"));
          BOOL v58 = [(NSMutableDictionary *)willRetryOperationProgress objectForKeyedSubscript:v57];

          if (v58)
          {
            __int16 v102 = v19;
            id v59 = v99->_willRetryOperationProgress;
            __int16 v60 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v14, "dbRowID"));
            [(NSMutableDictionary *)v59 removeObjectForKey:v60];

            id v61 = [(BRCAccountSession *)v99->super.super._session globalProgress];
            [v61 addProgress:v58 forDocument:v14 inGroup:2];

            [(BRCDownloadJobIdentifier *)v37 setProgressPublished:1];
            uint64_t v62 = [[BRCItemToPathLookup alloc] initWithItem:v14];
            unint64_t v63 = [(BRCItemToPathLookup *)v62 coordinatedWriteURL];
            BOOL v64 = brc_bread_crumbs();
            uint64_t v65 = brc_default_log();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_DEBUG))
            {
              id v78 = [v63 path];
              *(_DWORD *)buf = 138412802;
              uint64_t v111 = (uint64_t)v58;
              __int16 v112 = 2112;
              unint64_t v113 = (unint64_t)v78;
              __int16 v114 = 2112;
              unint64_t v115 = (unint64_t)v64;
              _os_log_debug_impl(&dword_1D353B000, v65, OS_LOG_TYPE_DEBUG, "[DEBUG] Re-use progress %@ for %@%@", buf, 0x20u);
            }
            uint64_t v19 = v102;
          }
          else
          {
            __int16 v68 = [v14 desiredVersion];
            uint64_t v69 = [v68 size];

            uint64_t v70 = v98;
            if (v98 > v69)
            {
              int v71 = v19;
              uint64_t v72 = brc_bread_crumbs();
              id v73 = brc_default_log();
              if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v111 = (uint64_t)v72;
                _os_log_impl(&dword_1D353B000, v73, OS_LOG_TYPE_DEFAULT, "[WARNING] Completed unit count is greater than version size; ignoring value%@",
                  buf,
                  0xCu);
              }

              uint64_t v70 = 0;
              uint64_t v19 = v71;
            }
            v108[0] = @"BRCSizeInfoCompletedUnitCountKey";
            uint64_t v74 = [NSNumber numberWithLongLong:v70];
            v108[1] = @"BRCSizeInfoTotalUnitCountKey";
            v109[0] = v74;
            id v75 = [NSNumber numberWithLongLong:v69];
            v109[1] = v75;
            uint64_t v62 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v109 forKeys:v108 count:2];

            BOOL v58 = +[BRCProgress downloadProgressForDocument:v14 sizeInfo:v62];
          }

          [(BRCDownloadJobIdentifier *)v37 setProgress:v58];
          uint64_t v18 = (void *)v103;
          self = v99;
        }
        [(BRCDownloadContentsBatchOperation *)v19 addDownload:v37];
        [(BRCFSDownloader *)self _willDownload:v37 operationID:v95];
        [v14 triggerNotificationIfNeeded];
      }
      else
      {
        id v66 = brc_bread_crumbs();
        os_log_t v67 = brc_default_log();
        if (os_log_type_enabled(v67, OS_LOG_TYPE_FAULT))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v111 = (uint64_t)v37;
          __int16 v112 = 2112;
          unint64_t v113 = v103;
          __int16 v114 = 2112;
          unint64_t v115 = (unint64_t)v66;
          _os_log_fault_impl(&dword_1D353B000, v67, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: item download %@ etag changed from %@%@", buf, 0x20u);
        }

        self = v99;
        [(BRCFSDownloader *)v99 cancelAndCleanupItemDownload:v14 kind:0 etag:v103];
      }
    }
    else
    {
      if ((v33 | v93))
      {
        __int16 v37 = -[BRCDownloadJobIdentifier initWithDBRowID:etag:kind:]([BRCDownloadJobIdentifier alloc], "initWithDBRowID:etag:kind:", [v14 dbRowID], v103, 0);
        id v38 = brc_bread_crumbs();
        __int16 v39 = brc_default_log();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138413314;
          uint64_t v111 = (uint64_t)v37;
          __int16 v112 = 2048;
          unint64_t v113 = v23;
          __int16 v114 = 2048;
          unint64_t v115 = v35;
          __int16 v116 = 2048;
          unint64_t v117 = v34;
          __int16 v118 = 2112;
          unint64_t v119 = (unint64_t)v38;
          _os_log_debug_impl(&dword_1D353B000, v39, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%@]: not enough available disk space (%llu available, %llu needed, %llu minimum)%@", buf, 0x34u);
        }

        [(BRCFSSchedulerBase *)v99 setState:43 forJobID:v37];
        id v40 = (void *)MEMORY[0x1E4F28C58];
        __int16 v41 = +[BRCDumpContext stringFromByteCount:v23 showActualByteCount:0 suffix:0 context:0];
        uint64_t v42 = +[BRCDumpContext stringFromByteCount:v34 + v35 showActualByteCount:0 suffix:0 context:0];
        uint64_t v43 = objc_msgSend(v40, "br_errorWithDomain:code:description:", v88, 640, @"Not enough available disk space(have %@ need %@)", v41, v42);
        id v44 = [v14 desiredVersion];
        [v44 setDownloadError:v43];

        self = v99;
        [v14 saveToDB];
      }
      else
      {
        self = v99;
        __int16 v37 = [(BRCAccountSession *)v99->super.super._session diskReclaimer];
        [(BRCDownloadJobIdentifier *)v37 requestPurgeSpace];
        LODWORD(v93) = 1;
      }
      id v8 = v96;
      uint64_t v19 = v101;
      uint64_t v18 = (void *)v103;
    }

    id v17 = (void *)v104;
    uint64_t v20 = (void *)v104;
    if ([(BRCTransferBatchOperation *)v19 itemsCount] >= v97) {
      goto LABEL_51;
    }
  }
  id v17 = v20;
LABEL_51:
  if (v19)
  {
    if ([v8 kind] == 3)
    {
      id v79 = objc_msgSend(MEMORY[0x1E4F1A218], "br_downloadSpeculative");
      if ((v93 & 0x100000000) == 0) {
        goto LABEL_66;
      }
LABEL_58:
      [(_BRCOperation *)v19 setNonDiscretionary:1];
      goto LABEL_66;
    }
    if ((v93 & 0x100000000) != 0)
    {
      id v79 = objc_msgSend(MEMORY[0x1E4F1A218], "br_downloadUserInitiated");
      goto LABEL_58;
    }
    if (v90)
    {
      if ([(BRCAccountSession *)self->super.super._session hasOptimizeStorageEnabled]) {
        objc_msgSend(MEMORY[0x1E4F1A218], "br_downloadOpportunistic");
      }
      else {
      uint64_t v80 = objc_msgSend(MEMORY[0x1E4F1A218], "br_downloadOptimizeStorageOff");
      }
    }
    else
    {
      uint64_t v80 = objc_msgSend(MEMORY[0x1E4F1A218], "br_downloadUpdatedDocuments");
    }
    id v79 = (void *)v80;
LABEL_66:
    [(_BRCOperation *)v19 setGroup:v79];
    id v81 = brc_bread_crumbs();
    brc_default_log();
    v82 = id v15 = v19;
    if (os_log_type_enabled(v82, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v83 = [(BRCTransferBatchOperation *)v15 itemsCount];
      id v84 = [v92 contextIdentifier];
      *(_DWORD *)buf = 134218498;
      uint64_t v111 = v83;
      __int16 v112 = 2112;
      unint64_t v113 = (unint64_t)v84;
      __int16 v114 = 2112;
      unint64_t v115 = (unint64_t)v81;
      _os_log_impl(&dword_1D353B000, v82, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloading %ld documents in %@%@", buf, 0x20u);
    }
    long long v11 = v92;
    uint64_t v85 = [v92 downloadStream];
    [v85 addBatchOperation:v15];

    uint64_t v16 = v95;
  }
  else
  {
    id v15 = 0;
    uint64_t v16 = v95;
    long long v11 = v92;
  }
LABEL_69:
}

uint64_t __79__BRCFSDownloader__sendContentsBatch_sizeHint_maxRecordsCount_isLoserDownload___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishedDownload:a2 syncContext:*(void *)(a1 + 40) operationID:*(void *)(a1 + 48) error:a3];
}

- (void)_postponeLoserForWinner:(int64_t)a3 etag:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v7 = [(BRCAccountSession *)self->super.super._session clientDB];
  [v7 execute:@"UPDATE client_downloads    SET throttle_state = %u  WHERE throttle_id = %lld AND download_kind = %u AND download_etag = %@", 42, a3, 2, v6];

  id v8 = brc_bread_crumbs();
  int v9 = brc_default_log();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218754;
    int64_t v11 = a3;
    __int16 v12 = 2080;
    uint64_t v13 = BRCPrettyPrintEnum();
    __int16 v14 = 2112;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v8;
    _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader[%lld-%s-%@]: postpone because loser is more recent than live item%@", buf, 0x2Au);
  }
}

- (void)_sendLosersBatch:(id)a3 sizeHint:(int64_t)a4 maxRecordsCount:(unint64_t)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = [v6 syncContext];
  id v8 = objc_alloc_init(MEMORY[0x1E4F28E60]);
  int v9 = 0;
  int v10 = 0;
  id v11 = 0;
  __int16 v12 = 0;
  id v13 = 0;
  unint64_t v52 = a5;
  if ([0 itemsCount] + 1 >= a5) {
    goto LABEL_33;
  }
  uint64_t v49 = v7;
  unint64_t v50 = v8;
  int v10 = 0;
  int v9 = 0;
  id v11 = 0;
  __int16 v14 = 0;
  id v13 = 0;
  id v53 = v6;
  while (1)
  {
    id v15 = v9;
    __int16 v16 = (void *)MEMORY[0x1D9438760]();
    int v9 = [v6 nextDocumentItem];

    if (!v9) {
      break;
    }
    id v17 = v10;
    id v18 = v11;
    uint64_t v19 = [v6 stageID];

    uint64_t v20 = [v6 etag];

    uint64_t v21 = [v9 currentVersion];
    uint64_t v22 = [v21 ckInfo];
    unint64_t v23 = [v22 etag];
    id v13 = v20;
    unint64_t v24 = [v23 length];
    unint64_t v25 = [v13 length];
    if (v24 == v25)
    {
      uint64_t v26 = [v23 compare:v13];
    }
    else if (v24 < v25)
    {
      uint64_t v26 = -1;
    }
    else
    {
      uint64_t v26 = 1;
    }

    if (v26 <= 0)
    {
      -[BRCFSDownloader _postponeLoserForWinner:etag:](self, "_postponeLoserForWinner:etag:", [v9 dbRowID], v13);
      id v11 = v18;
      int v10 = v17;
      id v6 = v53;
LABEL_23:
      __int16 v12 = (void *)v19;
      goto LABEL_24;
    }
    id v11 = v18;
    id v6 = v53;
    __int16 v12 = (void *)v19;
    if (v19)
    {
      if (v17) {
        goto LABEL_12;
      }
    }
    else
    {
      id v27 = [NSString alloc];
      uint64_t v28 = [v9 dbRowID];
      uint64_t v29 = [MEMORY[0x1E4F29128] UUID];
      __int16 v30 = [v29 UUIDString];
      __int16 v12 = (void *)[v27 initWithFormat:@"loser-%lld-%@", v28, v30];

      id v6 = v53;
      id v11 = v18;
      if (v17)
      {
LABEL_12:
        int v10 = v17;
        goto LABEL_16;
      }
    }
    int v10 = [[BRCDownloadVersionsBatchOperation alloc] initWithSyncContext:v49 forNonLocalVersion:0];
    uint64_t v31 = [(_BRCOperation *)v10 operationID];

    v54[0] = MEMORY[0x1E4F143A8];
    v54[1] = 3221225472;
    v54[2] = __61__BRCFSDownloader__sendLosersBatch_sizeHint_maxRecordsCount___block_invoke;
    v54[3] = &unk_1E69962B8;
    v54[4] = self;
    id v55 = v49;
    id v11 = v31;
    id v56 = v11;
    [(BRCDownloadVersionsBatchOperation *)v10 setPerDownloadCompletionBlock:v54];

LABEL_16:
    if ((objc_msgSend(v50, "containsIndex:", objc_msgSend(v9, "dbRowID")) & 1) == 0)
    {
      objc_msgSend(v50, "addIndex:", objc_msgSend(v9, "dbRowID"));
      uint64_t v19 = (uint64_t)v12;
      char v32 = [[BRCDownloadVersion alloc] initWithDocument:v9 stageID:v12 etag:v13 isLoser:1];
      int v33 = [(BRCDownloadVersion *)v32 storage];

      if (v33)
      {
        [(BRCDownloadVersionsBatchOperation *)v10 addDownload:v32];
      }
      else
      {
        unint64_t v34 = brc_bread_crumbs();
        unint64_t v35 = brc_default_log();
        if (os_log_type_enabled(v35, (os_log_type_t)0x90u))
        {
          long long v36 = [v9 itemID];
          [(BRCDownloadVersion *)v32 gsError];
          char v48 = v10;
          v38 = id v37 = v11;
          *(_DWORD *)buf = 138412802;
          uint64_t v58 = (uint64_t)v36;
          __int16 v59 = 2112;
          __int16 v60 = v38;
          __int16 v61 = 2112;
          uint64_t v62 = v34;
          _os_log_error_impl(&dword_1D353B000, v35, (os_log_type_t)0x90u, "[ERROR] backing off: can't resolve storage for %@: %@%@", buf, 0x20u);

          id v11 = v37;
          int v10 = v48;
        }
        [v9 markLostClearGenerationID:0 backoffMode:1];
        id v6 = v53;
      }
      [(BRCFSDownloader *)self _willDownload:v32 operationID:v11];

      goto LABEL_23;
    }
LABEL_24:
    __int16 v14 = v12;
    if ([(BRCTransferBatchOperation *)v10 itemsCount] + 1 >= v52) {
      goto LABEL_27;
    }
  }
  __int16 v12 = v14;
LABEL_27:
  if (v10)
  {
    __int16 v39 = objc_msgSend(MEMORY[0x1E4F1A218], "br_downloadConflictingVersions");
    [(_BRCOperation *)v10 setGroup:v39];

    id v40 = brc_bread_crumbs();
    __int16 v41 = brc_default_log();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v42 = v12;
      uint64_t v43 = [(BRCTransferBatchOperation *)v10 itemsCount];
      [v49 contextIdentifier];
      id v44 = v10;
      v46 = id v45 = v11;
      *(_DWORD *)buf = 134218498;
      uint64_t v58 = v43;
      __int16 v12 = v42;
      __int16 v59 = 2112;
      __int16 v60 = v46;
      __int16 v61 = 2112;
      uint64_t v62 = v40;
      _os_log_impl(&dword_1D353B000, v41, OS_LOG_TYPE_DEFAULT, "[NOTICE] downloading %ld previous documents versions in %@%@", buf, 0x20u);

      id v11 = v45;
      int v10 = v44;
    }

    uint64_t v47 = [v49 downloadStream];
    [v47 addBatchOperation:v10];

    uint64_t v7 = v49;
  }
  else
  {
    uint64_t v7 = v49;
  }
  id v8 = v50;
LABEL_33:
}

uint64_t __61__BRCFSDownloader__sendLosersBatch_sizeHint_maxRecordsCount___block_invoke(uint64_t a1, uint64_t a2, uint64_t a3)
{
  return [*(id *)(a1 + 32) _finishedDownload:a2 syncContext:*(void *)(a1 + 40) operationID:*(void *)(a1 + 48) error:a3];
}

- (void)_transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6
{
  id v10 = a3;
  id v11 = [(BRCAccountSession *)self->super.super._session clientDB];
  [v11 assertOnQueue];
  uint64_t v40 = 0x7FFFFFFFFFFFFFFFLL;
  uint64_t v12 = brc_current_date_nsec();
  if ([(BRCFSSchedulerBase *)self isCancelled]) {
    goto LABEL_29;
  }
  long long v36 = self;
  id v13 = [v10 contextIdentifier];
  __int16 v14 = (void *)[v11 fetch:@"  SELECT throttle_id, next_retry_stamp, download_kind, download_etag     FROM client_downloads    WHERE throttle_state = 1      AND transfer_queue = %@      AND transfer_operation IS NULL      AND download_priority >= %ld ORDER BY download_priority DESC, download_request_stamp DESC", v13, a6];

  if (![v14 next])
  {
    __int16 v30 = 0;
    goto LABEL_26;
  }
  unint64_t v37 = a4;
  unint64_t v38 = a5;
  __int16 v39 = 0;
  id v15 = v36;
  unint64_t v34 = v11;
  id v35 = v10;
  do
  {
    __int16 v16 = (void *)MEMORY[0x1D9438760]();
    uint64_t v17 = [v14 unsignedIntegerAtIndex:0];
    uint64_t v18 = [v14 longLongAtIndex:1];
    uint64_t v19 = [v14 intAtIndex:2];
    uint64_t v20 = [v14 stringAtIndex:3];
    uint64_t v21 = (void *)v20;
    if (v18 <= v12)
    {
      if (v19 == 2)
      {
        unint64_t v23 = objc_msgSend(v11, "fetchObjectOfClass:sql:", objc_opt_class(), @"SELECT version_ckinfo FROM client_items WHERE rowid = %ld", v17);
        unint64_t v24 = [v23 etag];
        id v25 = v21;
        unint64_t v26 = [v24 length];
        unint64_t v27 = [v25 length];
        if (v26 == v27)
        {
          uint64_t v28 = [v24 compare:v25];
        }
        else if (v26 < v27)
        {
          uint64_t v28 = -1;
        }
        else
        {
          uint64_t v28 = 1;
        }

        if (v28 <= 0)
        {
          id v15 = v36;
          [(BRCFSDownloader *)v36 _postponeLoserForWinner:v17 etag:v25];

          id v11 = v34;
          id v10 = v35;
          goto LABEL_22;
        }

        id v11 = v34;
        id v10 = v35;
        id v15 = v36;
      }
      [v14 close];
      uint64_t v29 = [[BRCFSDownloaderBatchEnumerator alloc] initWithSyncContext:v10 kind:v19 now:v12 retryQueueKick:&v40];

      switch((int)v19)
      {
        case 0:
        case 3:
          [(BRCFSDownloader *)v15 _sendContentsBatch:v29 sizeHint:v38 maxRecordsCount:v37 isLoserDownload:0];
          break;
        case 1:
          [(BRCFSDownloader *)v15 _sendThumbnailsBatch:v29 sizeHint:v38 maxRecordsCount:v37];
          break;
        case 2:
          [(BRCFSDownloader *)v15 _sendLosersBatch:v29 sizeHint:v38 maxRecordsCount:v37];
          break;
        default:
          break;
      }
      __int16 v39 = v29;
    }
    else
    {
      uint64_t v22 = v40;
      if (v40 >= v18) {
        uint64_t v22 = v18;
      }
      uint64_t v40 = v22;
      [v11 execute:@"UPDATE client_downloads    SET transfer_queue = '_retry'  WHERE throttle_id = %ld AND download_kind = %u AND download_etag = %@", v17, v19, v20];
    }
LABEL_22:
  }
  while (([v14 next] & 1) != 0);
  __int16 v30 = v39;
  if (v40 != 0x7FFFFFFFFFFFFFFFLL) {
    -[BRCFSSchedulerBase signalWithDeadline:](v15, "signalWithDeadline:");
  }
LABEL_26:
  uint64_t v31 = [v10 contextIdentifier];
  char v32 = (void *)[v11 numberWithSQL:@"SELECT MIN(next_retry_stamp) FROM client_downloads   WHERE throttle_state = 1     AND transfer_queue = %@      AND transfer_operation IS NULL ", v31];

  if (v32)
  {
    int v33 = [v10 downloadStream];
    objc_msgSend(v33, "signalWithDeadline:", objc_msgSend(v32, "longLongValue"));
  }
LABEL_29:
}

- (void)transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  __int16 v14 = [(BRCAccountSession *)self->super.super._session clientDB];
  id v15 = [v14 serialQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __115__BRCFSDownloader_transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority_completionBlock___block_invoke;
  v18[3] = &unk_1E69962E0;
  v18[4] = self;
  id v19 = v12;
  unint64_t v22 = a5;
  int64_t v23 = a6;
  id v20 = v13;
  unint64_t v21 = a4;
  id v16 = v13;
  id v17 = v12;
  dispatch_async_with_logs_4(v15, v18);
}

uint64_t __115__BRCFSDownloader_transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _transferStreamOfSyncContext:*(void *)(a1 + 40) didBecomeReadyWithMaxRecordsCount:*(void *)(a1 + 56) sizeHint:*(void *)(a1 + 64) priority:*(void *)(a1 + 72)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);

  return v2();
}

- (void)_reportDownloadErrorForDocument:(id)a3 error:(id)a4
{
  id v6 = a3;
  objc_msgSend(a4, "brc_telemetryReportableErrorWithRecordName:", 0);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v7 = [(BRCAccountSession *)self->super.super._session clientDB];
  uint64_t v8 = [v6 dbRowID];

  int v9 = [v13 domain];
  uint64_t v10 = [v13 code];
  id v11 = objc_msgSend(v13, "brc_cloudKitErrorMessage");
  [v7 execute:@"INSERT OR REPLACE INTO item_errors (item_rowid, error_domain, error_code, error_message, service) VALUES (%llu, %@, %ld, %@, %d)", v8, v9, v10, v11, 2];

  id v12 = +[BRCAutoBugCaptureReporter sharedABCReporter];
  [v12 captureLogsForOperationType:@"SyncHealth" ofSubtype:@"Download" forError:v13];
}

- (void)_clearDownloadErrorForDocument:(id)a3
{
  session = self->super.super._session;
  id v4 = a3;
  id v6 = [(BRCAccountSession *)session clientDB];
  uint64_t v5 = [v4 dbRowID];

  objc_msgSend(v6, "execute:", @"DELETE FROM item_errors WHERE item_rowid = %llu AND service = %d", v5, 2);
}

- (unint64_t)recoverAndReportMissingJobs
{
  id v3 = [(BRCAccountSession *)self->super.super._session clientDB];
  id v4 = (void *)[v3 fetch:@"SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_doc_id, ci.item_file_id, ci.item_generation, ci.item_localname, ci.item_processing_stamp, ci.item_staged_file_id, ci.item_staged_generation, ci.item_bouncedname, ci.item_scope, ci.item_tmpbounceno, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.desired_version, ci.item_live_conflict_loser_etags, ci.item_thumb_live_signature, ci.item_thumb_greedy, ci.version_block_sync_until_bundle_id, ci.version_block_sync_until_timestamp FROM client_items AS ci WHERE ci.desired_version IS NOT NULL AND NOT EXISTS (SELECT 1 FROM client_downloads AS downloader WHERE ci.rowid = downloader.throttle_id AND downloader.throttle_state != 0)"];

  if ([v4 next])
  {
    uint64_t v19 = 8;
    uint64_t v5 = 0;
    do
    {
      id v6 = (void *)MEMORY[0x1D9438760]();
      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = __46__BRCFSDownloader_recoverAndReportMissingJobs__block_invoke;
      v20[3] = &unk_1E6994120;
      void v20[4] = self;
      uint64_t v7 = [v4 object:v20];
      uint64_t v8 = [v7 asDocument];

      int v9 = [v8 desiredVersion];
      int v10 = [v9 wantsContent];

      if (v10)
      {
        id v11 = [v8 clientZone];
        id v12 = [v8 itemID];
        id v13 = [v11 serverItemByItemID:v12];

        [(BRCFSDownloader *)self scheduleContentDownloadForItem:v8 serverItem:v13 options:0 etagIfLoser:0 stageFileName:0 error:0];
        uint64_t v5 = (v5 + 1);
      }
    }
    while (([v4 next] & 1) != 0);
    if ((int)v5 >= 1)
    {
      __int16 v14 = brc_bread_crumbs();
      id v15 = brc_default_log();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG)) {
        [(BRCFSDownloader *)(uint64_t)v14 recoverAndReportMissingJobs];
      }

      [(BRCFSDownloader *)self schedule];
    }
  }
  else
  {
    uint64_t v5 = 0;
  }
  id v16 = +[AppTelemetryTimeSeriesEvent newMissingDownloaderJobEventWithNumberMissing:](AppTelemetryTimeSeriesEvent, "newMissingDownloaderJobEventWithNumberMissing:", v5, v19);
  id v17 = [(BRCAccountSession *)self->super.super._session analyticsReporter];
  [v17 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v16];

  return (int)v5;
}

id __46__BRCFSDownloader_recoverAndReportMissingJobs__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a2;
  id v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (BRCDeadlineScheduler)downloadsDeadlineScheduler
{
  return self->_downloadsDeadlineScheduler;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadsDeadlineScheduler, 0);
  objc_storeStrong((id *)&self->_willRetryOperationProgress, 0);
  objc_storeStrong((id *)&self->_lastDownloadRefresh, 0);
  objc_storeStrong((id *)&self->_fairScheduler, 0);

  objc_storeStrong((id *)&self->_tracker, 0);
}

void __80__BRCFSDownloader_LegacyAdditions__evictLosersOnItem_atURL_applySchedulerState___block_invoke_cold_1(uint64_t a1, uint64_t a2, NSObject *a3)
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v5 = [*(id *)(a1 + 32) path];
  OUTLINED_FUNCTION_2_1();
  uint64_t v7 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] removed additions from %@%@", v6, 0x16u);
}

- (void)_createDownloadingJobForItem:(os_log_t)log state:kind:etag:userInitiated:stageFileName:error:.cold.1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v3 = 136315906;
  id v4 = "-[BRCFSDownloader _createDownloadingJobForItem:state:kind:etag:userInitiated:stageFileName:error:]";
  __int16 v5 = 2080;
  id v6 = "(passed to caller)";
  __int16 v7 = 2112;
  uint64_t v8 = a1;
  __int16 v9 = 2112;
  uint64_t v10 = a2;
  _os_log_error_impl(&dword_1D353B000, log, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", (uint8_t *)&v3, 0x2Au);
}

- (void)_finishedDownload:(uint64_t)a1 syncContext:operationID:error:.cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Got an out of space error %@%@", (void)v3, DWORD2(v3));
}

- (void)_finishedDownload:syncContext:operationID:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: ![[BRCAccountsManager sharedManager] isInSyncBubble]%@", v2, v3, v4, v5, v6);
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_210_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] We failed downloading a conflict loser so kicking the apply scheduler in case it was blocked for download%@", v2, v3, v4, v5, v6);
}

void __67__BRCFSDownloader__finishedDownload_syncContext_operationID_error___block_invoke_210_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] The error is for an unknown item, check if the zone hasn't been wiped%@", v2, v3, v4, v5, v6);
}

- (void)rescheduleJobsPendingWinnerForItem:.cold.1()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Downloader: scheduling %lld suspended throttles%@");
}

- (void)_getCancelErrorFromCancelReason:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: New cancel reasons should be mapped to errors%@", v2, v3, v4, v5, v6);
}

- (void)cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: kind == BRCDownloadKindContent || kind == BRCDownloadKindSpeculative%@", v2, v3, v4, v5, v6);
}

- (void)cancelAndCleanupItemDownload:kind:etag:andNotifyDownloadTrackers:cancelReason:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: etag == nil%@", v2, v3, v4, v5, v6);
}

- (void)makeContentLive:(uint64_t)a1 .cold.1(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] nil coordinated read url for %@%@", (void)v3, DWORD2(v3));
}

void __35__BRCFSDownloader_makeContentLive___block_invoke_cold_1(uint64_t a1)
{
  uint64_t v1 = [*(id *)(a1 + 32) path];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v2, v3, "[DEBUG] no pre-existing thumbnail at '%@'%@", v4, v5, v6, v7, v8);
}

void __35__BRCFSDownloader_makeContentLive___block_invoke_263_cold_1(void *a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *a1;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_4(&dword_1D353B000, v1, v2, "[ERROR] We should have a stageID for this item: %@%@", (void)v3, DWORD2(v3));
}

- (void)scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] no need to schedule anything, we're already attempting to download that same version%@", v2, v3, v4, v5, v6);
}

- (void)scheduleContentDownloadForItem:serverItem:options:etagIfLoser:stageFileName:error:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] no need to schedule anything, we're already actively downloading that same etag%@", v2, v3, v4, v5, v6);
}

- (void)performFirstSchedulingAfterStartupInDB:(void *)a1 .cold.1(void *a1)
{
  [a1 changes];
  OUTLINED_FUNCTION_0_0();
  OUTLINED_FUNCTION_1_0(&dword_1D353B000, v1, v2, "[DEBUG] Rescheduled %lld in-flight transfers because we have restarted%@", v3, v4, v5, v6, v7);
}

- (void)recoverAndReportMissingJobs
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  v3[0] = 67109378;
  v3[1] = a2;
  __int16 v4 = 2112;
  uint64_t v5 = a1;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] Downloader: Recovered from %u missing download jobs%@", (uint8_t *)v3, 0x12u);
}

@end