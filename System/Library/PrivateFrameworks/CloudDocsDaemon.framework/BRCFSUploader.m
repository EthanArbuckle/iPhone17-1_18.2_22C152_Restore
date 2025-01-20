@interface BRCFSUploader
- (BOOL)_finishPackageUploadWithRecord:(id)a3 item:(id)a4 stageID:(id)a5 error:(id *)a6;
- (BOOL)_retryUploadForError:(id)a3 jobID:(id)a4 recomputeRecord:(BOOL)a5 syncContext:(id)a6;
- (BOOL)_updatePackageRecord:(id)a3 item:(id)a4 stageID:(id)a5 error:(id *)a6;
- (BOOL)canScheduleMoreJobs;
- (BOOL)hasItemsOverQuotaForOwner:(id)a3;
- (BOOL)hasItemsOverQuotaInZone:(id)a3;
- (BOOL)isDefaultOwnerOutOfQuota;
- (BOOL)isUploadingItem:(id)a3;
- (BRCDeadlineScheduler)uploadsDeadlineScheduler;
- (BRCFSUploader)initWithAccountSession:(id)a3;
- (BRCThumbnailGenerationManager)thumbnailGenerationManager;
- (id)_buildItemTooLargeErrorIfNeeded:(id)a3 syncContext:(id)a4;
- (id)_documentItemForJobID:(id)a3 operationID:(id)a4;
- (id)_documentItemForJobID:(id)a3 stageID:(id)a4;
- (id)_duplicatePackage:(id)a3 stageID:(id)a4 stageName:(id)a5 error:(id *)a6;
- (id)quotaAvailableForOwner:(id)a3;
- (int)getStateOfDocumentItem:(id)a3;
- (int64_t)_rescheduleJobsPendingNetwork;
- (int64_t)_rescheduleJobsPendingScreenUnlock;
- (int64_t)_rescheduleJobsPendingVerifyTerms;
- (int64_t)_rescheduleUploadJobsPendingState:(int)a3;
- (unint64_t)_minBatchSize;
- (unint64_t)_thumbnailOperationsMax;
- (unint64_t)recoverAndReportMissingJobs;
- (void)_cancelJobs:(id)a3 state:(int)a4 uploadError:(id)a5;
- (void)_cancelJobsMatching:(id)a3;
- (void)_clearUploadErrorForDocument:(id)a3;
- (void)_close;
- (void)_computeRecordForJobID:(id)a3 item:(id)a4 syncContext:(id)a5;
- (void)_finishedUploadingItem:(id)a3 record:(id)a4 jobID:(id)a5 stageID:(id)a6 syncContext:(id)a7 hasPerformedServerSideAssetCopy:(BOOL)a8 error:(id)a9;
- (void)_globalQuotaStateUpdateForDefaultOwner;
- (void)_handleFileModifiedError:(id)a3 forItem:(id)a4;
- (void)_performServerSideAssetCopyForItem:(id)a3 transferSize:(unint64_t)a4;
- (void)_reportUploadErrorForDocument:(id)a3 error:(id)a4;
- (void)_reportUploadErrorForDocument:(id)a3 error:(id)a4 underlyingError:(id)a5;
- (void)_rescheduleJobsOutOfQuotaForDefaultOwnerWithAvailableSize:(int64_t)a3;
- (void)_rescheduleJobsPendingNetwork;
- (void)_rescheduleJobsPendingScreenUnlock;
- (void)_rescheduleJobsPendingVerifyTerms;
- (void)_scheduleQuotaFetchForDefaultOwner;
- (void)_scheduleRetries;
- (void)_transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6;
- (void)_updateJobID:(id)a3 setStageID:(id)a4 operationID:(id)a5;
- (void)_updateRecord:(id)a3 item:(id)a4 syncContext:(id)a5 targetThumbnailURL:(id)a6 stageID:(id)a7;
- (void)_updateRecord:(id)a3 jobID:(id)a4 syncContext:(id)a5 targetThumbnailURL:(id)a6 stageID:(id)a7;
- (void)_updateRecordInDB:(id)a3 item:(id)a4 syncContext:(id)a5 transferSize:(unint64_t)a6 stageID:(id)a7;
- (void)_willAttemptJobID:(id)a3 throttle:(id)a4 operationID:(id)a5;
- (void)addAliasItem:(id)a3 toUploadingItem:(id)a4;
- (void)cancel;
- (void)cancelAndCleanupItemUpload:(id)a3;
- (void)close;
- (void)deleteJobsForZone:(id)a3;
- (void)deleteJobsMatching:(id)a3;
- (void)finishedSyncingUpItem:(id)a3 withOutOfQuotaError:(id)a4;
- (void)forceScheduleQuotaFetchForOwner:(id)a3;
- (void)networkReachabilityChanged:(BOOL)a3;
- (void)ownerDidReceiveOutOfQuotaError:(id)a3;
- (void)performFirstSchedulingAfterStartupInDB:(id)a3;
- (void)recoverAndReportMissingJobs;
- (void)rescheduleJobsPendingRecentsAndFavoritesFetchInZone:(id)a3;
- (void)resume;
- (void)schedule;
- (void)scheduleQuotaFetchIfNeededForOwner:(id)a3;
- (void)scheduleQuotaStateUpdateForOwner:(id)a3;
- (void)screenLockChanged:(BOOL)a3;
- (void)setIsDefaultOwnerOutOfQuota:(BOOL)a3;
- (void)setIsDefaultOwnerOutOfQuota:(BOOL)a3 forceSignalContainers:(BOOL)a4;
- (void)setQuotaAvailableForDefaultOwner:(unint64_t)a3;
- (void)setState:(int)a3 forItem:(id)a4;
- (void)setState:(int)a3 forItem:(id)a4 uploadError:(id)a5;
- (void)setState:(int)a3 forJobID:(id)a4 zone:(id)a5;
- (void)setState:(int)a3 forUploadJobID:(id)a4 zone:(id)a5;
- (void)setState:(int)a3 forUploadJobID:(id)a4 zone:(id)a5 uploadError:(id)a6;
- (void)suspend;
- (void)transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6 completionBlock:(id)a7;
- (void)uploadItem:(id)a3;
- (void)userVerifiedTerms;
@end

@implementation BRCFSUploader

- (unint64_t)_thumbnailOperationsMax
{
  v2 = +[BRCUserDefaults defaultsForMangledID:0];
  unint64_t v3 = [v2 thumbnailTransferQueueWidth];

  return v3;
}

- (unint64_t)_minBatchSize
{
  v2 = +[BRCUserDefaults defaultsForMangledID:0];
  unint64_t v3 = (int)[v2 transferQueueMinBatchSize];

  return v3;
}

- (BRCFSUploader)initWithAccountSession:(id)a3
{
  id v4 = a3;
  v5 = +[BRCUserDefaults defaultsForMangledID:0];
  v40.receiver = self;
  v40.super_class = (Class)BRCFSUploader;
  v6 = [(BRCFSSchedulerBase *)&v40 initWithSession:v4 name:@"Uploader" tableName:@"client_uploads"];
  if (v6)
  {
    v7 = objc_alloc_init(BRCThumbnailGenerationManager);
    thumbnailGenerationManager = v6->_thumbnailGenerationManager;
    v6->_thumbnailGenerationManager = v7;

    [v5 quotaFetchPacerDelay];
    uint64_t v9 = br_pacer_create();
    quotaPacer = v6->_quotaPacer;
    v6->_quotaPacer = (br_pacer *)v9;

    uint64_t v11 = brc_task_tracker_create("upload-thumbnail-tracker");
    thumbnailTracker = v6->_thumbnailTracker;
    v6->_thumbnailTracker = (brc_task_tracker *)v11;

    objc_initWeak(&location, v6);
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = __40__BRCFSUploader_initWithAccountSession___block_invoke;
    v37[3] = &unk_1E6993C50;
    objc_copyWeak(&v38, &location);
    [(BRCThumbnailGenerationManager *)v6->_thumbnailGenerationManager setHasThumbnailAvailableSlot:v37];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = __40__BRCFSUploader_initWithAccountSession___block_invoke_3;
    v35[3] = &unk_1E6993C50;
    objc_copyWeak(&v36, &location);
    [(BRCThumbnailGenerationManager *)v6->_thumbnailGenerationManager setReachedThumbnailMaximumCapacity:v35];
    v33[1] = (id)MEMORY[0x1E4F143A8];
    v33[2] = (id)3221225472;
    v33[3] = __40__BRCFSUploader_initWithAccountSession___block_invoke_4;
    v33[4] = &unk_1E6993C50;
    objc_copyWeak(&v34, &location);
    br_pacer_set_event_handler();
    v13 = [v4 clientDB];
    v14 = [v13 serialQueue];
    uint64_t v15 = br_pacer_create();
    globalQuotaStateUpdatePacer = v6->_globalQuotaStateUpdatePacer;
    v6->_globalQuotaStateUpdatePacer = (br_pacer *)v15;

    v32[1] = (id)MEMORY[0x1E4F143A8];
    v32[2] = (id)3221225472;
    v32[3] = __40__BRCFSUploader_initWithAccountSession___block_invoke_5;
    v32[4] = &unk_1E6993C50;
    objc_copyWeak(v33, &location);
    br_pacer_set_event_handler();
    v17 = [v4 personaIdentifier];
    v18 = BRPersonaSpecificName();

    id v19 = v18;
    dispatch_workloop_t v20 = dispatch_workloop_create((const char *)[v19 UTF8String]);
    v21 = [[BRCFairScheduler alloc] initWithWorkloop:v20 name:v19];
    fairScheduler = v6->_fairScheduler;
    v6->_fairScheduler = v21;

    v23 = [[BRCDeadlineScheduler alloc] initWithName:@"com.apple.bird.uploader" fairScheduler:v6->_fairScheduler];
    uploadsDeadlineScheduler = v6->_uploadsDeadlineScheduler;
    v6->_uploadsDeadlineScheduler = v23;

    [(BRCDeadlineScheduler *)v6->_uploadsDeadlineScheduler setCoalescingLeeway:10000000];
    v25 = [BRCDeadlineSource alloc];
    v26 = [(BRCAccountSession *)v6->super.super._session defaultScheduler];
    uint64_t v27 = [(BRCDeadlineSource *)v25 initWithScheduler:v26 name:@"uploader-retry"];
    retryQueueSource = v6->_retryQueueSource;
    v6->_retryQueueSource = (BRCDeadlineSource *)v27;

    [(BRCDeadlineSource *)v6->_retryQueueSource setWorkloop:v6->super.super._schedulerWorkloop];
    v29 = v6->_retryQueueSource;
    v31[0] = MEMORY[0x1E4F143A8];
    v31[1] = 3221225472;
    v31[2] = __40__BRCFSUploader_initWithAccountSession___block_invoke_6;
    v31[3] = &unk_1E6993C50;
    objc_copyWeak(v32, &location);
    [(BRCDeadlineSource *)v29 setEventHandler:v31];
    objc_destroyWeak(v32);

    objc_destroyWeak(v33);
    objc_destroyWeak(&v34);
    objc_destroyWeak(&v36);
    objc_destroyWeak(&v38);
    objc_destroyWeak(&location);
  }

  return v6;
}

void __40__BRCFSUploader_initWithAccountSession___block_invoke(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  v2 = [WeakRetained[1] clientDB];
  unint64_t v3 = [v2 serialQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __40__BRCFSUploader_initWithAccountSession___block_invoke_2;
  block[3] = &unk_1E6993698;
  v6 = WeakRetained;
  id v4 = WeakRetained;
  dispatch_async(v3, block);
}

uint64_t __40__BRCFSUploader_initWithAccountSession___block_invoke_2(uint64_t a1)
{
  return [*(id *)(*(void *)(a1 + 32) + 16) resume];
}

void __40__BRCFSUploader_initWithAccountSession___block_invoke_3(uint64_t a1)
{
  WeakRetained = (id *)objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained[2] suspend];
}

void __40__BRCFSUploader_initWithAccountSession___block_invoke_4(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scheduleQuotaFetchForDefaultOwner];
}

void __40__BRCFSUploader_initWithAccountSession___block_invoke_5(uint64_t a1)
{
  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _globalQuotaStateUpdateForDefaultOwner];
}

void __40__BRCFSUploader_initWithAccountSession___block_invoke_6(uint64_t a1)
{
  v2 = (void *)MEMORY[0x1D9438760]();
  memset(v6, 0, sizeof(v6));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader initWithAccountSession:]_block_invoke_6", 175, v6);
  unint64_t v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    __40__BRCFSUploader_initWithAccountSession___block_invoke_6_cold_1();
  }

  id WeakRetained = objc_loadWeakRetained((id *)(a1 + 32));
  [WeakRetained _scheduleRetries];

  __brc_leave_section(v6);
}

- (void)resume
{
  br_pacer_resume();
  unint64_t v3 = [(BRCAccountSession *)self->super.super._session clientState];
  id v4 = [v3 objectForKeyedSubscript:@"availableQuota"];

  if (!v4) {
    br_pacer_signal();
  }
  br_pacer_resume();
  [(BRCDeadlineSource *)self->_retryQueueSource signal];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  session = self->super.super._session;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __23__BRCFSUploader_resume__block_invoke;
  v14[3] = &unk_1E6998A18;
  id v7 = v5;
  id v15 = v7;
  [(BRCAccountSession *)session enumerateServerZones:v14];
  v8 = [(BRCAccountSession *)self->super.super._session globalProgress];
  [v8 resumeProgressForZones:v7];

  [(BRCDeadlineScheduler *)self->_uploadsDeadlineScheduler resume];
  [(BRCDeadlineSource *)self->_retryQueueSource resume];
  [(BRCFairScheduler *)self->_fairScheduler resume];
  v13.receiver = self;
  v13.super_class = (Class)BRCFSUploader;
  [(BRCFSSchedulerBase *)&v13 resume];
  uint64_t v9 = +[BRCSystemResourcesManager manager];
  [v9 addScreenLockObserver:self];

  v10 = +[BRCSystemResourcesManager manager];
  [v10 addReachabilityObserver:self];

  uint64_t v11 = +[BRCAccountHandler currentiCloudAccount];
  char v12 = objc_msgSend(v11, "br_needsToVerifyTerms");

  if ((v12 & 1) == 0) {
    [(BRCFSUploader *)self userVerifiedTerms];
  }
}

uint64_t __23__BRCFSUploader_resume__block_invoke(uint64_t a1, void *a2)
{
  v2 = *(void **)(a1 + 32);
  unint64_t v3 = [a2 clientZone];
  [v2 addObject:v3];

  return 1;
}

- (void)suspend
{
  [(BRCDeadlineScheduler *)self->_uploadsDeadlineScheduler suspend];
  [(BRCDeadlineSource *)self->_retryQueueSource suspend];
  [(BRCFairScheduler *)self->_fairScheduler suspend];
  v3.receiver = self;
  v3.super_class = (Class)BRCFSUploader;
  [(BRCFSSchedulerBase *)&v3 suspend];
}

- (void)close
{
  [(BRCDeadlineScheduler *)self->_uploadsDeadlineScheduler close];
  [(BRCFairScheduler *)self->_fairScheduler close];
  br_pacer_cancel();
  v3.receiver = self;
  v3.super_class = (Class)BRCFSUploader;
  [(BRCFSSchedulerBase *)&v3 close];
}

- (void)_close
{
  v3.receiver = self;
  v3.super_class = (Class)BRCFSUploader;
  [(BRCFSSchedulerBase *)&v3 _close];
  brc_task_tracker_wait((uint64_t)self->_thumbnailTracker);
}

- (void)cancel
{
  objc_super v3 = +[BRCSystemResourcesManager manager];
  [v3 removeScreenLockObserver:self];

  id v4 = +[BRCSystemResourcesManager manager];
  [v4 removeReachabilityObserver:self];

  [(BRCDeadlineSource *)self->_retryQueueSource cancel];
  v5.receiver = self;
  v5.super_class = (Class)BRCFSUploader;
  [(BRCFSSchedulerBase *)&v5 cancel];
  brc_task_tracker_cancel(self->_thumbnailTracker);
}

- (void)setState:(int)a3 forItem:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v8 = a4;
  v6 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", [v8 dbRowID]);
  id v7 = [v8 serverZone];
  [(BRCFSUploader *)self setState:v4 forUploadJobID:v6 zone:v7];
}

- (void)setState:(int)a3 forItem:(id)a4 uploadError:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  id v11 = a4;
  id v8 = a5;
  uint64_t v9 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", [v11 dbRowID]);
  v10 = [v11 serverZone];
  [(BRCFSUploader *)self setState:v6 forUploadJobID:v9 zone:v10 uploadError:v8];
}

- (int)getStateOfDocumentItem:(id)a3
{
  uint64_t v4 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", [a3 dbRowID]);
  LODWORD(self) = [(BRCFSSchedulerBase *)self jobStateFor:v4];

  return (int)self;
}

- (id)_buildItemTooLargeErrorIfNeeded:(id)a3 syncContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 currentVersion];
  id v8 = [v6 defaults];

  if ([v7 isPackage]) {
    uint64_t v9 = [v8 uploadMaxPkgFileSize];
  }
  else {
    uint64_t v9 = [v8 uploadMaxFileSize];
  }
  uint64_t v10 = v9;
  uint64_t v11 = [v7 size];
  if (v11 < v10)
  {
    if (![v7 isPackage]) {
      goto LABEL_7;
    }
    char v12 = [v5 st];
    objc_super v13 = [v12 documentID];
    uint64_t v14 = [v13 unsignedIntValue];
    id v15 = [v5 session];
    uint64_t v11 = +[BRCPackageItem largestPackageItemSizeInDocumentID:v14 session:v15];

    uint64_t v16 = [v8 uploadMaxInPkgFileSize];
    if (v11 < v16)
    {
LABEL_7:
      v17 = 0;
      goto LABEL_10;
    }
    uint64_t v10 = v16;
  }
  v18 = (void *)MEMORY[0x1E4F28C58];
  id v19 = [v5 st];
  dispatch_workloop_t v20 = [v19 filename];
  v17 = objc_msgSend(v18, "brc_errorDocumentWithFilename:size:isTooLargeToUpload:", v20, v11, v10);

LABEL_10:
  return v17;
}

- (void)_updateJobID:(id)a3 setStageID:(id)a4 operationID:(id)a5
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = brc_bread_crumbs();
  char v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    id v16 = v8;
    __int16 v17 = 2112;
    id v18 = v9;
    __int16 v19 = 2112;
    dispatch_workloop_t v20 = v11;
    _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%@]: upload stage set to: %@%@", buf, 0x20u);
  }

  objc_super v13 = [(BRCAccountSession *)self->super.super._session clientDB];
  uint64_t v14 = [v8 matchingJobsWhereSQLClause];
  [v13 execute:@"UPDATE client_uploads SET transfer_stage = %@, transfer_operation = %@ WHERE %@", v9, v10, v14];
}

- (id)_documentItemForJobID:(id)a3 stageID:(id)a4
{
  session = self->super.super._session;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(BRCAccountSession *)session clientDB];
  id v10 = [v8 matchingJobsWhereSQLClause];
  uint64_t v11 = (void *)[v9 numberWithSQL:@"SELECT zone_rowid FROM client_uploads WHERE %@ AND transfer_stage = %@", v10, v7];

  char v12 = [(BRCAccountSession *)self->super.super._session serverZoneByRowID:v11];
  objc_super v13 = [v12 clientZone];
  uint64_t v14 = [v8 itemDBRowID];

  id v15 = [v13 itemByRowID:v14];
  id v16 = [v15 asDocument];

  return v16;
}

- (id)_documentItemForJobID:(id)a3 operationID:(id)a4
{
  session = self->super.super._session;
  id v7 = a4;
  id v8 = a3;
  id v9 = [(BRCAccountSession *)session clientDB];
  id v10 = [v8 matchingJobsWhereSQLClause];
  uint64_t v11 = (void *)[v9 numberWithSQL:@"SELECT zone_rowid FROM client_uploads WHERE %@ AND transfer_operation = %@", v10, v7];

  char v12 = [(BRCAccountSession *)self->super.super._session serverZoneByRowID:v11];
  objc_super v13 = [v12 clientZone];
  uint64_t v14 = [v8 itemDBRowID];

  id v15 = [v13 itemByRowID:v14];
  id v16 = [v15 asDocument];

  return v16;
}

- (BOOL)isUploadingItem:(id)a3
{
  id v3 = a3;
  if ([v3 needsUpload])
  {
    uint64_t v4 = [v3 db];
    id v5 = objc_msgSend(v4, "numberWithSQL:", @"SELECT transfer_operation IS NOT NULL FROM client_uploads WHERE throttle_id = %llu", objc_msgSend(v3, "dbRowID"));
  }
  else
  {
    id v5 = 0;
  }
  char v6 = [v5 BOOLValue];

  return v6;
}

- (void)_willAttemptJobID:(id)a3 throttle:(id)a4 operationID:(id)a5
{
  session = self->super.super._session;
  id v7 = a5;
  id v8 = a3;
  id v10 = [(BRCAccountSession *)session clientDB];
  id v9 = [v8 matchingJobsWhereSQLClause];

  [v10 execute:@"UPDATE client_uploads SET   throttle_state = 1, transfer_operation = %@ WHERE %@", v7, v9];
}

- (void)_cancelJobs:(id)a3 state:(int)a4 uploadError:(id)a5
{
  uint64_t v35 = *(void *)&a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v34 = a5;
  if ([v6 next])
  {
    do
    {
      context = (void *)MEMORY[0x1D9438760]();
      id v7 = [v6 numberAtIndex:0];
      v39 = [v6 stringAtIndex:1];
      id v38 = [v6 uuidAtIndex:2];
      id v8 = [v6 stringAtIndex:3];
      id v9 = [v6 numberAtIndex:4];
      int v10 = [v6 intAtIndex:5];
      uint64_t v11 = [v6 numberAtIndex:6];
      v37 = [(BRCAccountSession *)self->super.super._session appLibraryByRowID:v9];
      char v12 = [(BRCAccountSession *)self->super.super._session serverZoneByRowID:v11];
      memset(v41, 0, sizeof(v41));
      __brc_create_section(0, (uint64_t)"-[BRCFSUploader _cancelJobs:state:uploadError:]", 391, v41);
      objc_super v13 = brc_bread_crumbs();
      uint64_t v14 = brc_default_log();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v33 = v41[0];
        uint64_t v32 = BRCPrettyPrintEnum();
        uint64_t v31 = BRCPrettyPrintEnum();
        *(_DWORD *)buf = 134219010;
        uint64_t v43 = v33;
        __int16 v44 = 2112;
        v45 = v7;
        __int16 v46 = 2080;
        uint64_t v47 = v32;
        __int16 v48 = 2080;
        uint64_t v49 = v31;
        __int16 v50 = 2112;
        v51 = v13;
        _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%@]: %s -> %s [cancel-job]%@", buf, 0x34u);
      }

      if (v10 == 32)
      {
        if (v35 == 32) {
          goto LABEL_12;
        }
        id v18 = [v12 ownerName];
        [(BRCFSUploader *)self scheduleQuotaStateUpdateForOwner:v18];
      }
      else
      {
        if (v10 != 1) {
          goto LABEL_12;
        }
        id v15 = brc_bread_crumbs();
        id v16 = brc_default_log();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v43 = (uint64_t)v7;
          __int16 v44 = 2112;
          v45 = v15;
          _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%@]: Cancelling upload%@", buf, 0x16u);
        }

        __int16 v17 = -[BRCAccountSession itemByRowID:](self->super.super._session, "itemByRowID:", [v7 unsignedIntegerValue]);
        id v18 = [v17 asDocument];

        __int16 v19 = [(BRCAccountSession *)self->super.super._session globalProgress];
        [v19 updateUploadThrottleForDocument:v18 toState:v35];
      }
LABEL_12:
      if ([v39 isEqualToString:@"_prepare"])
      {
        dispatch_workloop_t v20 = [(BRCFSUploader *)self thumbnailGenerationManager];
        uint64_t v21 = [v20 operationForThumbnailID:v7];

        if (v21)
        {
          [v21 cancel];
          v22 = brc_bread_crumbs();
          v23 = brc_default_log();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412802;
            uint64_t v43 = (uint64_t)v7;
            __int16 v44 = 2112;
            v45 = v21;
            __int16 v46 = 2112;
            uint64_t v47 = (uint64_t)v22;
            _os_log_debug_impl(&dword_1D353B000, v23, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%@]: cancelled thumbnail upload: %@%@", buf, 0x20u);
          }

LABEL_19:
        }

        goto LABEL_21;
      }
      if (v38)
      {
        uint64_t v21 = +[BRCSyncContext transferContextForServerZone:v12 appLibrary:v37];
        v22 = [v21 uploadStream];
        [v22 cancelTransferID:v7 operationID:v38];
        goto LABEL_19;
      }
LABEL_21:
      if (v8)
      {
        v24 = brc_bread_crumbs();
        v25 = brc_default_log();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412802;
          uint64_t v43 = (uint64_t)v7;
          __int16 v44 = 2112;
          v45 = v8;
          __int16 v46 = 2112;
          uint64_t v47 = (uint64_t)v24;
          _os_log_debug_impl(&dword_1D353B000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%@]: Cleaning up upload stage: %@%@", buf, 0x20u);
        }

        v26 = [(BRCAccountSession *)self->super.super._session stageRegistry];
        [v26 cleanupStagedUploadWithID:v8];
      }
      if (v34)
      {
        uint64_t v27 = (void *)MEMORY[0x1E4FBA8F8];
        v28 = [v34 description];
        v29 = [v27 formatInjection:@", upload_error = %@ ", v28];
      }
      else
      {
        v29 = [MEMORY[0x1E4FBA908] rawInjection:"" length:0];
      }
      v30 = [v6 db];
      [v30 execute:@"UPDATE client_uploads SET  throttle_state = %d, transfer_queue = '_prepare', transfer_record = NULL, transfer_stage = NULL, transfer_operation = NULL%@ WHERE throttle_id = %@", v35, v29, v7];

      __brc_leave_section(v41);
    }
    while (([v6 next] & 1) != 0);
  }
  [v6 close];
}

- (void)_cancelJobsMatching:(id)a3
{
  session = self->super.super._session;
  id v5 = a3;
  id v8 = [(BRCAccountSession *)session clientDB];
  id v6 = [v5 matchingJobsWhereSQLClause];

  id v7 = (void *)[v8 fetch:@"SELECT throttle_id, transfer_queue, transfer_operation, transfer_stage, app_library_rowid, throttle_state, zone_rowid   FROM client_uploads  WHERE %@ AND throttle_state != 0", v6];
  [(BRCFSUploader *)self _cancelJobs:v7 state:0 uploadError:0];
}

- (void)deleteJobsMatching:(id)a3
{
  id v4 = a3;
  [(BRCFSUploader *)self _cancelJobsMatching:v4];
  v5.receiver = self;
  v5.super_class = (Class)BRCFSUploader;
  [(BRCFSSchedulerBase *)&v5 deleteJobsMatching:v4];
}

- (void)deleteJobsForZone:(id)a3
{
  session = self->super.super._session;
  id v5 = a3;
  id v6 = [(BRCAccountSession *)session clientDB];
  id v7 = [v5 dbRowID];
  id v8 = (void *)[v6 fetch:@"SELECT throttle_id, transfer_queue, transfer_operation, transfer_stage, app_library_rowid, throttle_state, zone_rowid   FROM client_uploads  WHERE zone_rowid = %@ AND throttle_state != 0", v7];
  [(BRCFSUploader *)self _cancelJobs:v8 state:0 uploadError:0];

  v9.receiver = self;
  v9.super_class = (Class)BRCFSUploader;
  [(BRCFSSchedulerBase *)&v9 deleteJobsMatching:v5];
}

- (void)cancelAndCleanupItemUpload:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  memset(v9, 0, sizeof(v9));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader cancelAndCleanupItemUpload:]", 460, v9);
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v7 = v9[0];
    id v8 = [v4 jobsDescription];
    *(_DWORD *)buf = 134218498;
    uint64_t v11 = v7;
    __int16 v12 = 2112;
    objc_super v13 = v8;
    __int16 v14 = 2112;
    id v15 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%@]: cancel and cleanup item upload%@", buf, 0x20u);
  }
  [(BRCFSUploader *)self _cancelJobsMatching:v4];
  __brc_leave_section(v9);
}

- (int64_t)_rescheduleUploadJobsPendingState:(int)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if ((a3 - 35) >= 3)
  {
    id v5 = brc_bread_crumbs();
    __int16 v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_FAULT)) {
      -[BRCFSUploader _rescheduleUploadJobsPendingState:]();
    }

    int64_t v11 = 0;
  }
  else
  {
    id v5 = objc_msgSend(MEMORY[0x1E4FBA908], "rawInjection:length:", -[__CFString UTF8String](off_1E6998BF0[a3 - 35], "UTF8String"), -[__CFString length](off_1E6998BF0[v3], "length"));
    memset(v16, 0, sizeof(v16));
    __brc_create_section(0, (uint64_t)"-[BRCFSUploader _rescheduleUploadJobsPendingState:]", 481, v16);
    id v6 = brc_bread_crumbs();
    uint64_t v7 = brc_default_log();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = v16[0];
      uint64_t v15 = BRCPrettyPrintEnum();
      *(_DWORD *)buf = 134218498;
      uint64_t v18 = v14;
      __int16 v19 = 2080;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      v22 = v6;
      _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx re-uploading failed items for %s%@", buf, 0x20u);
    }

    id v8 = [(BRCAccountSession *)self->super.super._session clientDB];
    [v8 execute:@"UPDATE client_items SET version_upload_error = NULL, item_notifs_rank = bump_notifs_rank_and_trigger_notifs(rowid) WHERE rowid IN (SELECT throttle_id FROM client_uploads WHERE throttle_state = %@)", v5];
    if ([v8 changes])
    {
      [v8 execute:@"UPDATE client_uploads SET throttle_state = 1, upload_error = NULL WHERE throttle_state = %@", v5];
      if ([v8 changes])
      {
        objc_super v9 = brc_bread_crumbs();
        int v10 = brc_default_log();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSUploader _rescheduleUploadJobsPendingState:]();
        }

        [(BRCFSSchedulerBase *)self signal];
      }
      int64_t v11 = [v8 changes];
    }
    else
    {
      int64_t v11 = 0;
    }

    __brc_leave_section(v16);
  }

  return v11;
}

- (int64_t)_rescheduleJobsPendingVerifyTerms
{
  memset(v7, 0, sizeof(v7));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader _rescheduleJobsPendingVerifyTerms]", 506, v7);
  int v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSUploader _rescheduleJobsPendingVerifyTerms]();
  }

  int64_t v5 = [(BRCFSUploader *)self _rescheduleUploadJobsPendingState:37];
  __brc_leave_section(v7);
  return v5;
}

- (int64_t)_rescheduleJobsPendingNetwork
{
  memset(v7, 0, sizeof(v7));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader _rescheduleJobsPendingNetwork]", 512, v7);
  int v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSUploader _rescheduleJobsPendingNetwork]();
  }

  int64_t v5 = [(BRCFSUploader *)self _rescheduleUploadJobsPendingState:36];
  __brc_leave_section(v7);
  return v5;
}

- (int64_t)_rescheduleJobsPendingScreenUnlock
{
  memset(v7, 0, sizeof(v7));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader _rescheduleJobsPendingScreenUnlock]", 518, v7);
  int v3 = brc_bread_crumbs();
  id v4 = brc_default_log();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSUploader _rescheduleJobsPendingScreenUnlock]();
  }

  int64_t v5 = [(BRCFSUploader *)self _rescheduleUploadJobsPendingState:35];
  __brc_leave_section(v7);
  return v5;
}

- (void)rescheduleJobsPendingRecentsAndFavoritesFetchInZone:(id)a3
{
  session = self->super.super._session;
  id v5 = a3;
  id v6 = [(BRCAccountSession *)session clientDB];
  uint64_t v7 = [v5 dbRowID];

  [v6 execute:@"UPDATE client_uploads SET throttle_state = 1 WHERE throttle_state = 30 AND zone_rowid = %@ AND throttle_state != 0", v7];
  if ([v6 changes])
  {
    id v8 = brc_bread_crumbs();
    objc_super v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSUploader _rescheduleUploadJobsPendingState:]();
    }

    [(BRCFSSchedulerBase *)self signal];
  }
}

- (void)addAliasItem:(id)a3 toUploadingItem:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(BRCAccountSession *)self->super.super._session clientDB];
  objc_super v9 = objc_msgSend(v8, "fetchObjectOfClass:sql:", objc_opt_class(), @"SELECT transfer_operation    FROM client_uploads  WHERE throttle_id = %lld AND throttle_state == 1", objc_msgSend(v7, "dbRowID"));

  if (v9)
  {
    int v10 = brc_bread_crumbs();
    int64_t v11 = brc_default_log();
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

    __int16 v12 = [v7 syncContextUsedForTransfers];
    objc_super v13 = [v12 uploadStream];
    uint64_t v14 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v7, "dbRowID"));
    [v13 addAliasItem:v6 toTransferWithID:v14 operationID:v9];
  }
}

- (void)setState:(int)a3 forJobID:(id)a4 zone:(id)a5
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_FAULT))
  {
    int v7 = 138412290;
    id v8 = v5;
    _os_log_fault_impl(&dword_1D353B000, v6, OS_LOG_TYPE_FAULT, "[CRIT] API MISUSE: should call setState:forUploadJobID:zone:%@", (uint8_t *)&v7, 0xCu);
  }
}

- (void)setState:(int)a3 forUploadJobID:(id)a4 zone:(id)a5
{
}

- (void)setState:(int)a3 forUploadJobID:(id)a4 zone:(id)a5 uploadError:(id)a6
{
  uint64_t v8 = *(void *)&a3;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  memset(v30, 0, sizeof(v30));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader setState:forUploadJobID:zone:uploadError:]", 580, v30);
  objc_super v13 = brc_bread_crumbs();
  uint64_t v14 = brc_default_log();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v27 = v30[0];
    uint64_t v28 = BRCPrettyPrintEnum();
    *(_DWORD *)buf = 134218754;
    uint64_t v32 = v27;
    __int16 v33 = 2112;
    id v34 = v10;
    __int16 v35 = 2080;
    uint64_t v36 = v28;
    __int16 v37 = 2112;
    id v38 = v13;
    _os_log_debug_impl(&dword_1D353B000, v14, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%@]: setting state to %s%@", buf, 0x2Au);
  }

  if (v8 == 1)
  {
    id v18 = [(BRCAccountSession *)self->super.super._session clientDB];
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = __58__BRCFSUploader_setState_forUploadJobID_zone_uploadError___block_invoke;
    v29[3] = &unk_1E6994080;
    v29[4] = self;
    __int16 v19 = (void *)MEMORY[0x1D94389C0](v29);
    uint64_t v20 = [v10 matchingJobsWhereSQLClause];
    [v18 execute:@"UPDATE client_uploads SET  throttle_state = call_block(%@, next_retry_stamp, app_library_rowid, zone_rowid), transfer_queue = %@ WHERE %@", v19, @"_prepare", v20];
  }
  else if (v8 == 31)
  {
    if (v12)
    {
      uint64_t v15 = (void *)MEMORY[0x1E4FBA8F8];
      id v16 = [v12 description];
      __int16 v17 = [v15 formatInjection:@"upload_error = %@, ", v16];
    }
    else
    {
      __int16 v17 = [MEMORY[0x1E4FBA908] rawInjection:"" length:0];
    }
    v25 = [(BRCAccountSession *)self->super.super._session clientDB];
    v26 = [v10 matchingJobsWhereSQLClause];
    [v25 execute:@"UPDATE client_uploads    SET throttle_state = %d, %@ transfer_operation = NULL  WHERE %@", 31, v17, v26];
  }
  else
  {
    uint64_t v21 = [(BRCAccountSession *)self->super.super._session clientDB];
    v22 = [v10 matchingJobsWhereSQLClause];
    uint64_t v23 = (void *)[v21 fetch:@"SELECT throttle_id, transfer_queue, transfer_operation, transfer_stage, app_library_rowid, throttle_state, zone_rowid   FROM client_uploads  WHERE %@", v22];
    [(BRCFSUploader *)self _cancelJobs:v23 state:v8 uploadError:v12];

    if (v8 == 32)
    {
      v24 = [v11 ownerName];
      [(BRCFSUploader *)self ownerDidReceiveOutOfQuotaError:v24];
    }
  }
  __brc_leave_section(v30);
}

void __58__BRCFSUploader_setState_forUploadJobID_zone_uploadError___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  sqlite3_int64 v7 = sqlite3_value_int64(*a4);
  if (sqlite3_value_int(a4[1]))
  {
    [*(id *)(a1 + 32) signalWithDeadline:v7];
  }
  else
  {
    uint64_t v8 = [NSNumber numberWithLongLong:sqlite3_value_int64(a4[1])];
    uint64_t v9 = [NSNumber numberWithLongLong:sqlite3_value_int64(a4[2])];
    id v10 = [*(id *)(*(void *)(a1 + 32) + 8) appLibraryByRowID:v8];
    id v11 = [*(id *)(*(void *)(a1 + 32) + 8) serverZoneByRowID:v9];
    id v12 = +[BRCSyncContext transferContextForServerZone:v11 appLibrary:v10];
    objc_super v13 = [v12 uploadStream];
    [v13 signalWithDeadline:v7];
  }
  sqlite3_result_int(a2, 1);
}

- (void)uploadItem:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  memset(v50, 0, sizeof(v50));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader uploadItem:]", 623, v50);
  id v4 = brc_bread_crumbs();
  id v5 = brc_default_log();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = v50[0];
    __int16 v17 = [v3 jobsDescription];
    *(_DWORD *)buf = 134218498;
    uint64_t v52 = v16;
    __int16 v53 = 2112;
    v54 = v17;
    __int16 v55 = 2112;
    v56 = v4;
    _os_log_debug_impl(&dword_1D353B000, v5, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%@]: uploading%@", buf, 0x20u);
  }
  __int16 v46 = [v3 appLibrary];
  id v6 = [v3 currentVersion];
  uint64_t v49 = [v6 uploadError];

  uint64_t v47 = [v3 syncContextUsedForTransfers];
  if (objc_msgSend(v49, "brc_isCloudKitErrorDataProtectionClass") && !self->_isScreenLocked)
  {

    uint64_t v8 = brc_bread_crumbs();
    uint64_t v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      __int16 v35 = [v3 itemID];
      uint64_t v36 = [v35 debugItemIDString];
      *(_DWORD *)buf = 138412546;
      uint64_t v52 = (uint64_t)v36;
      __int16 v53 = 2112;
      v54 = v8;
      _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Screen no longer locked. Try upload item: %@%@", buf, 0x16u);
    }
  }
  else if (v49)
  {
    if (objc_msgSend(v49, "brc_isCloudKitOutOfQuota"))
    {
      int v41 = 0;
      int v7 = 32;
    }
    else if (objc_msgSend(v49, "brc_isCloudKitErrorDataProtectionClass"))
    {
      int v41 = 0;
      int v7 = 35;
    }
    else if (objc_msgSend(v49, "brc_isCloudKitErrorNoNetwork"))
    {
      int v41 = 0;
      int v7 = 36;
    }
    else if (objc_msgSend(v49, "brc_isCloudKitErrorRequiresVerifyTerms"))
    {
      uint64_t v14 = +[BRCAccountHandler currentiCloudAccount];
      int v15 = objc_msgSend(v14, "br_needsToVerifyTerms");

      int v41 = 0;
      if (v15) {
        int v7 = 37;
      }
      else {
        int v7 = 33;
      }
    }
    else
    {
      int v41 = 0;
      int v7 = 33;
    }
    goto LABEL_29;
  }
  id v10 = [(BRCAccountSession *)self->super.super._session syncUpScheduler];
  char v11 = [v10 isItemPendingSyncUp:v3];

  if (v11)
  {
    uint64_t v49 = 0;
    int v41 = 0;
    int v7 = 31;
  }
  else
  {
    uint64_t v49 = [(BRCFSUploader *)self _buildItemTooLargeErrorIfNeeded:v3 syncContext:v47];
    if (v49)
    {
      int v41 = 0;
      int v7 = 34;
    }
    else
    {
      id v12 = [v3 serverZone];
      int v13 = [v12 hasFetchedRecentsAndFavorites];

      if (v13)
      {
        if (([v3 isPausedFromSync] & 1) != 0 || objc_msgSend(v3, "isResumingSync"))
        {
          __int16 v37 = brc_bread_crumbs();
          id v38 = brc_default_log();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_FAULT)) {
            -[BRCFSUploader uploadItem:]();
          }
        }
        uint64_t v49 = 0;
        int v7 = 1;
        int v41 = 1;
      }
      else
      {
        uint64_t v49 = 0;
        int v41 = 0;
        int v7 = 30;
      }
    }
  }
LABEL_29:
  unsigned int v42 = v7;
  id v18 = [v3 currentVersion];
  [v18 setUploadError:v49];

  id v19 = v3;
  v45 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", [v19 dbRowID]);

  __int16 v44 = [v47 uploadThrottle];
  uint64_t v43 = objc_msgSend(MEMORY[0x1E4FBA908], "rawInjection:length:", "app_library_rowid, transfer_queue, transfer_size, transfer_record, transfer_stage, transfer_operation, upload_priority, upload_request_stamp , zone_rowid", 153);
  uint64_t v20 = (void *)MEMORY[0x1E4FBA8F8];
  uint64_t v21 = [v46 dbRowID];
  v22 = [v19 currentVersion];
  uint64_t v23 = [v22 size];
  v24 = [v19 currentVersion];
  uint64_t v25 = [v24 thumbnailSize];
  v26 = [v19 serverZone];
  uint64_t v27 = [v26 dbRowID];
  uint64_t v28 = [v20 formatInjection:@"%@, %@, %lld, %@, %@, %@, %lld, %lld, %@", v21, @"_prepare", v25 + v23, 0, 0, 0, -1, 0, v27];
  v29 = (void *)MEMORY[0x1E4FBA8F8];
  v30 = [v19 serverZone];
  uint64_t v31 = [v30 dbRowID];
  uint64_t v32 = [v29 formatInjection:@"zone_rowid = %@", v31];
  int v39 = [(BRCFSSchedulerBase *)self insertOrUpdateJobID:v45 throttle:v44 withState:v42 insertedSQLColumn:v43 insertedSQLValues:v28 updatedSQLValues:v32 error:0];
  uint64_t v40 = v33;

  if (v41)
  {
    [(BRCFSSchedulerBase *)self signalWithDeadline:v40];
  }
  else if (v39 == 1)
  {
    id v34 = [(BRCAccountSession *)self->super.super._session globalProgress];
    [v34 updateUploadThrottleForDocument:v19 toState:v42];
  }
  __brc_leave_section(v50);
}

- (void)_scheduleRetries
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┏%llx Uploader: scheduling retries%@", (void)v3, DWORD2(v3));
}

void __33__BRCFSUploader__scheduleRetries__block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, uint64_t a4)
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  int v7 = *(void **)(*(void *)(a1 + 32) + 8);
  uint64_t v8 = (void *)[NSNumber newFromSqliteValue:*(void *)(a4 + 8)];
  uint64_t v9 = [v7 appLibraryByRowID:v8];

  id v10 = *(void **)(*(void *)(a1 + 32) + 8);
  char v11 = (void *)[NSNumber newFromSqliteValue:*(void *)(a4 + 24)];
  id v12 = [v10 serverZoneByRowID:v11];

  int v13 = +[BRCSyncContext transferContextForServerZone:v12 appLibrary:v9];
  uint64_t v14 = [v13 contextIdentifier];
  int v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
  {
    sqlite3_int64 v19 = sqlite3_value_int64(*(sqlite3_value **)a4);
    int v20 = 134218498;
    sqlite3_int64 v21 = v19;
    __int16 v22 = 2112;
    uint64_t v23 = v14;
    __int16 v24 = 2112;
    uint64_t v25 = v15;
    _os_log_debug_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%lld]: job has been put back in queue %@%@", (uint8_t *)&v20, 0x20u);
  }

  id v17 = v14;
  sqlite3_result_text(a2, (const char *)[v17 UTF8String], -1, (void (__cdecl *)(void *))0xFFFFFFFFFFFFFFFFLL);
  id v18 = [v13 uploadStream];
  [v18 signalWithDeadline:sqlite3_value_int64(*(sqlite3_value **)(a4 + 16))];
}

- (void)performFirstSchedulingAfterStartupInDB:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [v4 execute:@"UPDATE client_uploads SET transfer_operation = NULL WHERE (transfer_operation >= '')"];
  if ([v4 changes])
  {
    id v5 = brc_bread_crumbs();
    id v6 = brc_default_log();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      [(BRCFSUploader *)v4 performFirstSchedulingAfterStartupInDB:v6];
    }
  }
  int v7 = (void *)[v4 fetch:@"SELECT app_library_rowid, zone_rowid, transfer_queue   FROM client_uploads  WHERE throttle_state = 1 GROUP BY app_library_rowid, zone_rowid, transfer_queue"];
  if ([v7 next])
  {
    do
    {
      uint64_t v8 = (void *)MEMORY[0x1D9438760]();
      session = self->super.super._session;
      id v10 = [v7 numberAtIndex:0];
      char v11 = [(BRCAccountSession *)session appLibraryByRowID:v10];

      id v12 = self->super.super._session;
      int v13 = [v7 numberAtIndex:1];
      uint64_t v14 = [(BRCAccountSession *)v12 serverZoneByRowID:v13];

      int v15 = [v7 stringAtIndex:2];
      if (([v15 isEqualToString:@"_prepare"] & 1) == 0
        && ([v15 isEqualToString:@"_retry"] & 1) == 0)
      {
        uint64_t v16 = brc_bread_crumbs();
        id v17 = brc_default_log();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
        {
          int v20 = [v7 stringAtIndex:2];
          *(_DWORD *)buf = 138412546;
          __int16 v22 = v20;
          __int16 v23 = 2112;
          __int16 v24 = v16;
          _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Kicking uploads for %@%@", buf, 0x16u);
        }
        id v18 = +[BRCSyncContext transferContextForServerZone:v14 appLibrary:v11];
        sqlite3_int64 v19 = [v18 uploadStream];
        [v19 signal];
      }
    }
    while (([v7 next] & 1) != 0);
  }
  [(BRCFSUploader *)self setIsDefaultOwnerOutOfQuota:[(BRCFSUploader *)self hasItemsOverQuotaForOwner:*MEMORY[0x1E4F19C08]] forceSignalContainers:1];
}

- (BOOL)canScheduleMoreJobs
{
  return [(BRCThumbnailGenerationManager *)self->_thumbnailGenerationManager canScheduleMoreJobs];
}

- (void)schedule
{
  long long v3 = +[BRCUserDefaults defaultsForMangledID:0];
  uint64_t v4 = [v3 readerScanBatchSize];

  id v5 = [MEMORY[0x1E4FBA8F8] formatInjection:@"transfer_queue = '_prepare' AND transfer_operation IS NULL"];
  id v6 = objc_msgSend(MEMORY[0x1E4FBA908], "rawInjection:length:", "throttle_id, app_library_rowid, zone_rowid", 42);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = __25__BRCFSUploader_schedule__block_invoke;
  uint64_t v7[3] = &unk_1E6996268;
  v7[4] = self;
  [(BRCFSSchedulerBase *)self scheduleWithBatchSize:v4 whereSQLClause:v5 columns:v6 actionHandler:v7];
}

void __25__BRCFSUploader_schedule__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v5 = a2;
  id v6 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", [v5 longLongAtIndex:a3]);
  int v7 = [v5 numberAtIndex:(a3 + 1)];
  uint64_t v8 = [v5 numberAtIndex:(a3 + 2)];
  uint64_t v9 = [*(id *)(*(void *)(a1 + 32) + 8) appLibraryByRowID:v7];
  uint64_t v10 = [*(id *)(*(void *)(a1 + 32) + 8) serverZoneByRowID:v8];
  char v11 = (void *)v10;
  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12)
  {
    int v13 = brc_bread_crumbs();
    uint64_t v14 = brc_default_log();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_FAULT)) {
      __25__BRCFSUploader_schedule__block_invoke_cold_2();
    }

    [*(id *)(a1 + 32) deleteJobsMatching:v6];
  }
  else
  {
    int v15 = objc_msgSend(*(id *)(*(void *)(a1 + 32) + 8), "itemByRowID:", -[BRCItemDBRowIDJobIdentifier itemDBRowID](v6, "itemDBRowID"));
    uint64_t v16 = [v15 asDocument];

    id v17 = +[BRCSyncContext transferContextForServerZone:v11 appLibrary:v9];
    if (v16)
    {
      id v18 = [v5 db];
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      v21[2] = __25__BRCFSUploader_schedule__block_invoke_138;
      v21[3] = &unk_1E6998A40;
      v21[4] = *(void *)(a1 + 32);
      __int16 v22 = v6;
      id v23 = v16;
      id v24 = v17;
      [v18 groupInBatch:v21];
    }
    else
    {
      int v20 = brc_bread_crumbs();
      sqlite3_int64 v19 = brc_default_log();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_FAULT)) {
        __25__BRCFSUploader_schedule__block_invoke_cold_1();
      }

      [*(id *)(a1 + 32) deleteJobsMatching:v6];
    }
  }
}

uint64_t __25__BRCFSUploader_schedule__block_invoke_138(uint64_t a1)
{
  return [*(id *)(a1 + 32) _computeRecordForJobID:*(void *)(a1 + 40) item:*(void *)(a1 + 48) syncContext:*(void *)(a1 + 56)];
}

- (BOOL)_updatePackageRecord:(id)a3 item:(id)a4 stageID:(id)a5 error:(id *)a6
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  BOOL v12 = [(BRCAccountSession *)self->super.super._session stageRegistry];
  uint64_t v13 = [v12 createURLForUploadWithStageID:v11 name:@"brpackage"];
  uint64_t v14 = [v12 createURLForUploadWithStageID:v11 name:@"ckpackage"];
  v78 = v9;
  v81 = [v9 getAndUpdateBoundaryKeyForItem:v10];
  int v15 = brc_bread_crumbs();
  uint64_t v16 = brc_default_log();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSUploader _updatePackageRecord:item:stageID:error:](v10);
  }

  id v17 = [BRCPackageManifestWriter alloc];
  id v18 = [v10 clientZone];
  v80 = (void *)v13;
  sqlite3_int64 v19 = [(BRCPackageManifestWriter *)v17 initWithZone:v18 stageID:v11 url:v13];

  int v20 = [(BRCPackageManifestWriter *)v19 error];

  if (!v20)
  {
    v77 = objc_alloc_init(BRFieldPkgItem);
    id v94 = 0;
    v29 = objc_msgSend(MEMORY[0x1E4F1A250], "br_packageWithBoundaryKey:error:", v81, &v94);
    id v30 = v94;
    id v31 = v30;
    id v23 = (void *)v14;
    if (v29)
    {
      id v93 = v30;
      char v32 = [v29 anchorAtURL:v14 error:&v93];
      uint64_t v33 = v29;
      char v34 = v32;
      id v71 = v93;

      if (v34)
      {
        __int16 v35 = NSNumber;
        uint64_t v36 = [(BRCAccountSession *)self->super.super._session volume];
        __int16 v37 = objc_msgSend(v35, "numberWithInt:", objc_msgSend(v36, "deviceID"));

        id v38 = [[BRCLazyPackage alloc] initWithRegistry:v12 stageID:v11 name:@"ckpackage-xattrs" boundaryKey:v81];
        v83[0] = MEMORY[0x1E4F143A8];
        v83[1] = 3221225472;
        v83[2] = __57__BRCFSUploader__updatePackageRecord_item_stageID_error___block_invoke;
        v83[3] = &unk_1E6998A68;
        id v63 = v10;
        id v84 = v63;
        id v69 = v37;
        v70 = v33;
        id v85 = v69;
        id v39 = v33;
        id v86 = v39;
        uint64_t v40 = a6;
        v92 = a6;
        v87 = v77;
        id v88 = v12;
        v75 = v38;
        v89 = v75;
        int v41 = v19;
        v90 = v41;
        id v66 = v80;
        id v91 = v66;
        id v31 = [v39 performTransactionBlock:v83];

        id v24 = v78;
        if (v31)
        {
          v72 = brc_bread_crumbs();
          unsigned int v42 = brc_default_log();
          if (os_log_type_enabled(v42, (os_log_type_t)0x90u))
          {
            *(_DWORD *)buf = 138412802;
            id v96 = v39;
            __int16 v97 = 2112;
            uint64_t v98 = (uint64_t)v31;
            __int16 v99 = 2112;
            id v100 = v72;
            _os_log_error_impl(&dword_1D353B000, v42, (os_log_type_t)0x90u, "[ERROR] Fail to performTransactionBlock for package [%@] with error [%@]%@", buf, 0x20u);
          }

          uint64_t v40 = a6;
        }
        [v39 close];
        v73 = v41;
        BOOL v43 = [(BRCPackageManifestWriter *)v41 done];
        uint64_t v28 = v80;
        if (v43)
        {
          uint64_t v44 = [(BRCLazyPackage *)v75 closeAndReturn];
          if (v44) {
            [v78 setObject:v44 forKeyedSubscript:@"pkgXattrs"];
          }
          v74 = (void *)v44;
          uint64_t v45 = objc_msgSend(MEMORY[0x1E4F19E50], "br_assetWithFileURL:boundaryKey:", v66, v81);
          [v78 setObject:v39 forKeyedSubscript:@"pkgContent"];
          v67 = (void *)v45;
          [v78 setObject:v45 forKeyedSubscript:@"pkgManifest"];
          __int16 v46 = [v63 session];
          id v82 = 0;
          char v26 = [v78 validateEnhancedDrivePrivacyFieldsWithSession:v46 error:&v82];
          id obj = v82;
          id v64 = v82;

          if (a6 && (v26 & 1) == 0) {
            objc_storeStrong(a6, obj);
          }

          __int16 v48 = v70;
          id v47 = v74;
        }
        else
        {
          v65 = brc_bread_crumbs();
          __int16 v55 = brc_default_log();
          if (os_log_type_enabled(v55, (os_log_type_t)0x90u))
          {
            v68 = [v66 path];
            uint64_t v60 = [(BRCPackageManifestWriter *)v73 error];
            *(_DWORD *)buf = 138412802;
            id v96 = v68;
            __int16 v97 = 2112;
            uint64_t v98 = v60;
            v61 = (void *)v60;
            __int16 v99 = 2112;
            id v100 = v65;
            _os_log_error_impl(&dword_1D353B000, v55, (os_log_type_t)0x90u, "[ERROR] failed to create manifest at %@: %@%@", buf, 0x20u);

            uint64_t v40 = a6;
          }

          if (!v40)
          {
            char v26 = 0;
            __int16 v48 = v70;
            goto LABEL_36;
          }
          uint64_t v56 = [(BRCPackageManifestWriter *)v73 error];
          char v26 = 0;
          id v47 = *v40;
          *uint64_t v40 = (id)v56;
          __int16 v48 = v70;
        }

LABEL_36:
        id v51 = v69;
        goto LABEL_37;
      }
      v76 = v23;
      uint64_t v52 = brc_bread_crumbs();
      __int16 v53 = brc_default_log();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        v54 = [v23 path];
        *(_DWORD *)buf = 138413058;
        id v96 = v33;
        __int16 v97 = 2112;
        uint64_t v98 = (uint64_t)v54;
        __int16 v99 = 2112;
        id v100 = v71;
        __int16 v101 = 2112;
        v102 = v52;
        _os_log_impl(&dword_1D353B000, v53, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to anchor package %@ at %@: %@%@", buf, 0x2Au);
      }
      id v24 = v78;
      __int16 v48 = v33;
      if (!a6)
      {
        char v26 = 0;
        id v31 = v71;
        uint64_t v28 = v80;
        goto LABEL_38;
      }
      id v31 = v71;
      char v26 = 0;
      id v51 = *a6;
      *a6 = v31;
      uint64_t v28 = v80;
    }
    else
    {
      v76 = (void *)v14;
      uint64_t v49 = brc_bread_crumbs();
      __int16 v50 = brc_default_log();
      if (os_log_type_enabled(v50, (os_log_type_t)0x90u)) {
        -[BRCFSUploader _updatePackageRecord:item:stageID:error:]();
      }

      id v24 = v78;
      if (!a6)
      {
        char v26 = 0;
        uint64_t v28 = v80;
        __int16 v48 = 0;
        id v23 = v76;
        goto LABEL_38;
      }
      id v31 = v31;
      char v26 = 0;
      id v51 = *a6;
      *a6 = v31;
      uint64_t v28 = v80;
      __int16 v48 = 0;
    }
    id v23 = v76;
LABEL_37:

LABEL_38:
    id v27 = v77;
    goto LABEL_39;
  }
  sqlite3_int64 v21 = brc_bread_crumbs();
  __int16 v22 = brc_default_log();
  id v23 = (void *)v14;
  if (os_log_type_enabled(v22, (os_log_type_t)0x90u))
  {
    v58 = [v80 path];
    v59 = [(BRCPackageManifestWriter *)v19 error];
    *(_DWORD *)buf = 138412802;
    id v96 = v58;
    __int16 v97 = 2112;
    uint64_t v98 = (uint64_t)v59;
    __int16 v99 = 2112;
    id v100 = v21;
    _os_log_error_impl(&dword_1D353B000, v22, (os_log_type_t)0x90u, "[ERROR] failed to create manifest at %@: %@%@", buf, 0x20u);
  }
  id v24 = v78;
  if (a6)
  {
    uint64_t v25 = [(BRCPackageManifestWriter *)v19 error];
    char v26 = 0;
    id v27 = *a6;
    *a6 = v25;
    uint64_t v28 = v80;
LABEL_39:

    goto LABEL_40;
  }
  char v26 = 0;
  uint64_t v28 = v80;
LABEL_40:

  return v26;
}

id __57__BRCFSUploader__updatePackageRecord_item_stageID_error___block_invoke(uint64_t a1)
{
  uint64_t v72 = *MEMORY[0x1E4F143B8];
  +[BRCPackageItem packageItemsForItem:*(void *)(a1 + 32) order:1];
  long long v59 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v53 = [obj countByEnumeratingWithState:&v59 objects:v71 count:16];
  if (v53)
  {
    uint64_t v2 = 0;
    uint64_t v52 = *(void *)v60;
    while (2)
    {
      uint64_t v3 = 0;
      do
      {
        if (*(void *)v60 != v52) {
          objc_enumerationMutation(obj);
        }
        uint64_t v4 = *(void **)(*((void *)&v59 + 1) + 8 * v3);
        id v5 = (void *)MEMORY[0x1D9438760]();
        if ([v4 isFile])
        {
          uint64_t v55 = v2;
          id v6 = brc_bread_crumbs();
          int v7 = brc_default_log();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
          {
            uint64_t v32 = [*(id *)(a1 + 32) dbRowID];
            uint64_t v33 = [*(id *)(a1 + 40) longValue];
            uint64_t v34 = [v4 fileID];
            *(_DWORD *)buf = 134218754;
            uint64_t v64 = v32;
            __int16 v65 = 2048;
            uint64_t v66 = v33;
            __int16 v67 = 2048;
            uint64_t v68 = v34;
            __int16 v69 = 2112;
            v70 = v6;
            _os_log_debug_impl(&dword_1D353B000, v7, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%lld]: adding package item with deviceID 0x%lx fileID %lu%@", buf, 0x2Au);
          }

          id v8 = objc_alloc(MEMORY[0x1E4F1A258]);
          uint64_t v9 = *(void *)(a1 + 40);
          id v10 = objc_msgSend(NSNumber, "numberWithUnsignedLongLong:", objc_msgSend(v4, "fileID"));
          id v11 = [v4 generationID];
          BOOL v12 = [v11 fsGenerationID];
          uint64_t v13 = (void *)[v8 initWithDeviceID:v9 fileID:v10 generationID:v12];

          [v13 setPackageIndex:v55];
          uint64_t v14 = [v4 pathInPackage];
          int v15 = [v14 lastPathComponent];
          uint64_t v16 = objc_msgSend(v15, "br_pathExtension");
          [v13 setItemTypeHint:v16];

          if (([*(id *)(a1 + 48) addItem:v13] & 1) == 0)
          {
            BOOL v43 = brc_bread_crumbs();
            uint64_t v44 = brc_default_log();
            if (os_log_type_enabled(v44, (os_log_type_t)0x90u)) {
              __57__BRCFSUploader__updatePackageRecord_item_stageID_error___block_invoke_cold_1();
            }

            uint64_t v45 = [MEMORY[0x1E4F1A130] errorWithCode:1000 format:@"Failed to add item to package"];
            __int16 v37 = [v45 CKClientSuitableError];

            __int16 v46 = *(id **)(a1 + 96);
            if (v46) {
              objc_storeStrong(v46, v37);
            }
            goto LABEL_38;
          }
          uint64_t v2 = v55 + 1;
        }
        else
        {
          uint64_t v13 = 0;
        }
        [*(id *)(a1 + 56) updateWithPkgItem:v4];
        [*(id *)(a1 + 56) setSignature:0];
        id v17 = [v4 xattrSignature];

        if (v17)
        {
          v54 = v5;
          id v18 = *(void **)(a1 + 64);
          uint64_t v19 = [v4 xattrSignature];
          int v20 = [v18 urlForXattrSignature:v19];

          id v58 = 0;
          LOBYTE(v19) = [v20 checkResourceIsReachableAndReturnError:&v58];
          id v21 = v58;
          if (v19)
          {
            uint64_t v56 = v2;
            __int16 v22 = (void *)[objc_alloc(MEMORY[0x1E4F1A258]) initWithFileURL:v20];
            uint64_t v23 = [*(id *)(a1 + 72) itemCount];
            [v13 setPackageIndex:v23];
            id v24 = brc_bread_crumbs();
            uint64_t v25 = brc_default_log();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
            {
              uint64_t v50 = [*(id *)(a1 + 32) dbRowID];
              __int16 v35 = [v4 pathInPackage];
              *(_DWORD *)buf = 134218754;
              uint64_t v64 = v50;
              __int16 v65 = 2112;
              uint64_t v66 = (uint64_t)v20;
              __int16 v67 = 2112;
              uint64_t v68 = (uint64_t)v35;
              __int16 v69 = 2112;
              v70 = v24;
              _os_log_debug_impl(&dword_1D353B000, v25, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%lld]: adding xattr package item with URL %@ for %@%@", buf, 0x2Au);
            }
            char v26 = *(void **)(a1 + 72);
            id v57 = v21;
            char v27 = [v26 addItem:v22 error:&v57];
            id v28 = v57;

            if (v27)
            {
              [*(id *)(a1 + 56) setXattrIndex:v23];
              id v21 = v28;
              uint64_t v2 = v56;
            }
            else
            {
              id v30 = brc_bread_crumbs();
              id v31 = brc_default_log();
              uint64_t v2 = v56;
              if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v64 = (uint64_t)v28;
                __int16 v65 = 2112;
                uint64_t v66 = (uint64_t)v30;
                _os_log_impl(&dword_1D353B000, v31, OS_LOG_TYPE_DEFAULT, "[WARNING] Failed to add xattrs to xattrs package: %@%@", buf, 0x16u);
              }

              id v21 = v28;
            }
          }
          else
          {
            __int16 v22 = brc_bread_crumbs();
            v29 = brc_default_log();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_FAULT))
            {
              uint64_t v36 = [v4 xattrSignature];
              *(_DWORD *)buf = 138412802;
              uint64_t v64 = (uint64_t)v36;
              __int16 v65 = 2112;
              uint64_t v66 = (uint64_t)v21;
              __int16 v67 = 2112;
              uint64_t v68 = (uint64_t)v22;
              _os_log_fault_impl(&dword_1D353B000, v29, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: We're missing a package xattr for signature %@ - %@%@", buf, 0x20u);
            }
          }

          id v5 = v54;
        }
        if (([*(id *)(a1 + 80) addItem:*(void *)(a1 + 56)] & 1) == 0)
        {
          id v38 = brc_bread_crumbs();
          id v39 = brc_default_log();
          if (os_log_type_enabled(v39, (os_log_type_t)0x90u))
          {
            __int16 v48 = [*(id *)(a1 + 88) path];
            uint64_t v49 = [*(id *)(a1 + 80) error];
            *(_DWORD *)buf = 138412802;
            uint64_t v64 = (uint64_t)v48;
            __int16 v65 = 2112;
            uint64_t v66 = (uint64_t)v49;
            __int16 v67 = 2112;
            uint64_t v68 = (uint64_t)v38;
            _os_log_error_impl(&dword_1D353B000, v39, (os_log_type_t)0x90u, "[ERROR] failed to create manifest at %@: %@%@", buf, 0x20u);
          }
          if (*(void *)(a1 + 96))
          {
            uint64_t v40 = [*(id *)(a1 + 80) error];
            int v41 = *(void ***)(a1 + 96);
            unsigned int v42 = *v41;
            *int v41 = (void *)v40;
          }
          __int16 v37 = [*(id *)(a1 + 80) error];
LABEL_38:

          goto LABEL_39;
        }
        [*(id *)(a1 + 56) clear];

        ++v3;
      }
      while (v53 != v3);
      uint64_t v53 = [obj countByEnumeratingWithState:&v59 objects:v71 count:16];
      if (v53) {
        continue;
      }
      break;
    }
  }
  __int16 v37 = 0;
LABEL_39:

  return v37;
}

- (void)_updateRecordInDB:(id)a3 item:(id)a4 syncContext:(id)a5 transferSize:(unint64_t)a6 stageID:(id)a7
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  uint64_t v16 = brc_bread_crumbs();
  id v17 = brc_default_log();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 134218498;
    uint64_t v25 = [v13 dbRowID];
    __int16 v26 = 2112;
    id v27 = v12;
    __int16 v28 = 2112;
    v29 = v16;
    _os_log_debug_impl(&dword_1D353B000, v17, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%lld]: assets only record generated: %@%@", buf, 0x20u);
  }

  id v18 = [(BRCAccountSession *)self->super.super._session clientDB];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __73__BRCFSUploader__updateRecordInDB_item_syncContext_transferSize_stageID___block_invoke;
  v22[3] = &unk_1E6994080;
  id v23 = v14;
  id v19 = v14;
  int v20 = (void *)MEMORY[0x1D94389C0](v22);
  id v21 = [v19 contextIdentifier];
  [v18 execute:@"UPDATE client_uploads SET  transfer_queue = call_block(%@, next_retry_stamp, %@), transfer_record = %@, transfer_operation = NULL, transfer_stage = %@, transfer_size = %lld WHERE throttle_id = %lld", v20, v21, v12, v15, a6, objc_msgSend(v13, "dbRowID")];
}

void __73__BRCFSUploader__updateRecordInDB_item_syncContext_transferSize_stageID___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  id v6 = [*(id *)(a1 + 32) uploadStream];
  [v6 signalWithDeadline:sqlite3_value_int64(*a4)];

  int v7 = a4[1];
  sqlite3_result_value(a2, v7);
}

- (void)_updateRecord:(id)a3 item:(id)a4 syncContext:(id)a5 targetThumbnailURL:(id)a6 stageID:(id)a7
{
  uint64_t v119 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  v104 = [v13 currentVersion];
  uint64_t v99 = [v104 size];
  id v100 = v12;
  id location = 0;
  id v17 = [v12 getAndUpdateBoundaryKeyForItem:v13];
  if ([v13 isFinderBookmark]) {
    int v18 = [v13 shouldUseEnhancedDrivePrivacyWhenNeedsPreserving:0];
  }
  else {
    int v18 = 0;
  }
  id v19 = v17;
  if (![v13 isDocumentBeingCopiedToNewZone]) {
    goto LABEL_7;
  }
  int v20 = [v13 currentVersion];
  [v20 contentSignature];
  v22 = id v21 = v16;
  int v23 = objc_msgSend(v22, "brc_signatureIsValid");

  id v16 = v21;
  id v17 = v19;

  if (!v23)
  {
LABEL_7:
    __int16 v26 = [v13 fileIDForUpload];

    if (!v26)
    {
      uint64_t v32 = brc_bread_crumbs();
      uint64_t v33 = brc_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
        -[BRCFSUploader _updateRecord:item:syncContext:targetThumbnailURL:stageID:]();
      }

      [v13 markNeedsReading];
      [v13 saveToDB];
      goto LABEL_15;
    }
    if ([v13 isFault])
    {
      id v27 = brc_bread_crumbs();
      __int16 v28 = brc_default_log();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_FAULT)) {
        -[BRCFSUploader _updateRecord:item:syncContext:targetThumbnailURL:stageID:]();
      }

      v29 = [v13 clientZone];
      uint64_t v30 = [v13 itemID];
      id v31 = [v29 serverItemByItemID:v30];

      [v13 markNeedsDeleteForRescheduleOfItem:v31];
      [v13 saveToDB];

LABEL_15:
      id v17 = v19;
      uint64_t v25 = v100;
      goto LABEL_56;
    }
    id v98 = v16;
    if ([v104 isPackage])
    {
      if ([v13 isFinderBookmark])
      {
        v89 = brc_bread_crumbs();
        v90 = brc_default_log();
        if (os_log_type_enabled(v90, OS_LOG_TYPE_FAULT)) {
          -[BRCDownloadVersion initWithDocument:stageID:etag:isLoser:]();
        }

        id v17 = v19;
      }
      uint64_t v34 = self;
      __int16 v35 = self;
      uint64_t v25 = v100;
      int v36 = [(BRCFSUploader *)v35 _updatePackageRecord:v100 item:v13 stageID:v16 error:&location];
      if (!v15) {
        goto LABEL_36;
      }
    }
    else
    {
      __int16 v37 = brc_bread_crumbs();
      id v38 = brc_default_log();
      uint64_t v34 = self;
      id v96 = v15;
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        id v94 = [(BRCAccountSession *)self->super.super._session volume];
        v83 = (void *)(int)[v94 deviceID];
        id v84 = [v13 fileIDForUpload];
        id v85 = [v13 itemID];
        *(_DWORD *)buf = 134218754;
        v112 = v83;
        __int16 v113 = 2112;
        id v114 = v84;
        __int16 v115 = 2112;
        v116 = v85;
        __int16 v117 = 2112;
        v118 = v37;
        _os_log_debug_impl(&dword_1D353B000, v38, OS_LOG_TYPE_DEBUG, "[DEBUG] Adding CKAsset with deviceID 0x%lx fileID %@ to the record for item %@%@", buf, 0x2Au);
      }
      id v39 = [v13 fileIDForUpload];
      uint64_t v25 = v100;
      id v95 = v14;
      if (v18)
      {
        uint64_t v40 = objc_msgSend(MEMORY[0x1E4F1C9B8], "brc_generateSaltingKey");

        id v17 = (void *)v40;
      }
      int v41 = (void *)MEMORY[0x1E4F19E50];
      unsigned int v42 = NSNumber;
      BOOL v43 = [(BRCAccountSession *)v34->super.super._session volume];
      uint64_t v44 = objc_msgSend(v42, "numberWithInt:", objc_msgSend(v43, "deviceID"));
      uint64_t v45 = [v13 generationIDForUpload];
      __int16 v46 = [v45 fsGenerationID];
      id v47 = objc_msgSend(v41, "br_assetWithDeviceID:fileID:generationID:boundaryKey:", v44, v39, v46, v17);

      int v48 = [v13 isFinderBookmark];
      uint64_t v49 = kBRRecordKeyFinderBookmarkContent;
      if (!v48) {
        uint64_t v49 = kBRRecordKeyFileContent;
      }
      [v100 setObject:v47 forKeyedSubscript:*v49];
      uint64_t v50 = [v13 st];
      id v51 = [v50 logicalName];
      uint64_t v52 = objc_msgSend(v51, "br_pathExtension");
      [v47 setItemTypeHint:v52];

      int v36 = 1;
      id v14 = v95;
      id v15 = v96;
      if (!v96)
      {
LABEL_36:
        v102 = [v104 xattrSignature];
        if (!v102)
        {
          if (!v36) {
            goto LABEL_52;
          }
          goto LABEL_46;
        }
        long long v60 = [[BRCItemToPathLookup alloc] initWithItem:v13];
        long long v61 = [(BRCItemToPathLookup *)v60 byFileSystemID];
        if ([v61 exists])
        {
          id v107 = location;
          int v62 = [v13 updateXattrInfoFromPath:v61 error:&v107];
          objc_storeStrong(&location, v107);
          if (!v62)
          {
LABEL_50:
            [(BRCItemToPathLookup *)v60 closePaths];
            goto LABEL_51;
          }
          int v92 = v36;
          id v97 = v15;
          id v63 = [v13 currentVersion];
          uint64_t v64 = [v63 xattrSignature];
          char v65 = [v102 isEqualToData:v64];

          if (v65)
          {
            [(BRCItemToPathLookup *)v60 closePaths];
            id v15 = v97;
            if (v92)
            {
              uint64_t v66 = [v13 session];
              __int16 v67 = [v66 stageRegistry];
              id v93 = [v67 urlForXattrSignature:v102];

              uint64_t v68 = v93;
              id v106 = location;
              LODWORD(v66) = [v93 checkResourceIsReachableAndReturnError:&v106];
              objc_storeStrong(&location, v106);
              if (v66)
              {
                __int16 v69 = objc_msgSend(MEMORY[0x1E4F19E50], "br_assetWithFileURL:boundaryKey:", v93, v17);
                [v25 setObject:v69 forKeyedSubscript:@"xattr"];
                v70 = v102;
                if (!v17) {
                  v70 = 0;
                }
                id v71 = objc_msgSend(v25, "encryptedValues", v70);
                [v71 setObject:v91 forKeyedSubscript:@"xattrSignature"];

                uint64_t v68 = v93;
                v99 += [v69 size];
              }
              else
              {
                uint64_t v91 = brc_bread_crumbs();
                id v86 = brc_default_log();
                if (os_log_type_enabled(v86, OS_LOG_TYPE_FAULT)) {
                  -[BRCFSUploader _updateRecord:item:syncContext:targetThumbnailURL:stageID:]();
                }

                __int16 v69 = (void *)v91;
              }

LABEL_46:
              uint64_t v72 = objc_msgSend(v13, "session", v91);
              id v105 = location;
              char v73 = [v25 validateEnhancedDrivePrivacyFieldsWithSession:v72 error:&v105];
              objc_storeStrong(&location, v105);

              if (v73)
              {
                id v16 = v98;
                [(BRCFSUploader *)v34 _updateRecordInDB:v25 item:v13 syncContext:v14 transferSize:v99 stageID:v98];
LABEL_55:

                goto LABEL_56;
              }
LABEL_52:
              v77 = brc_bread_crumbs();
              v78 = brc_default_log();
              id v16 = v98;
              if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG))
              {
                id v82 = [v13 itemID];
                *(_DWORD *)buf = 138412802;
                v112 = v82;
                __int16 v113 = 2112;
                id v114 = location;
                __int16 v115 = 2112;
                v116 = v77;
                _os_log_debug_impl(&dword_1D353B000, v78, OS_LOG_TYPE_DEBUG, "[DEBUG] Creation of record for %@ failed: %@%@", buf, 0x20u);
              }
              v79 = [(BRCAccountSession *)v34->super.super._session stageRegistry];
              [v79 cleanupStagedUploadWithID:v98];

              [(BRCFSUploader *)v34 setState:33 forItem:v13];
              [(BRCFSUploader *)v34 _reportUploadErrorForDocument:v13 error:location];
              [(BRCFSUploader *)v34 _handleFileModifiedError:location forItem:v13];
              id v80 = location;
              v81 = [v13 currentVersion];
              [v81 setUploadError:v80];

              [v13 saveToDB];
              goto LABEL_55;
            }
LABEL_51:

            goto LABEL_52;
          }
          uint64_t v74 = 35;
          id v15 = v97;
        }
        else
        {
          uint64_t v74 = 2;
        }
        v75 = objc_msgSend(MEMORY[0x1E4F28C58], "br_errorWithPOSIXCode:", v74);
        id v76 = location;
        id location = v75;

        goto LABEL_50;
      }
    }
    if ([v13 shouldTransferThumbnail])
    {
      id v109 = 0;
      uint64_t v53 = *MEMORY[0x1E4F1C5F8];
      id obj = 0;
      char v54 = [v15 getResourceValue:&v109 forKey:v53 error:&obj];
      id v55 = v109;
      objc_storeStrong(&location, obj);
      if (v54)
      {
        __int16 v101 = v55;
        uint64_t v56 = objc_msgSend(MEMORY[0x1E4F19E50], "br_assetWithFileURL:boundaryKey:", v15, v17);
        [v25 setObject:v56 forKeyedSubscript:@"thumb1024"];
        id v57 = brc_bread_crumbs();
        id v58 = brc_default_log();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSUploader _updateRecord:item:syncContext:targetThumbnailURL:stageID:].cold.4();
        }

        id v55 = v101;
        v99 += [v101 unsignedLongLongValue];
      }
      else
      {
        uint64_t v56 = brc_bread_crumbs();
        long long v59 = brc_default_log();
        if (os_log_type_enabled(v59, (os_log_type_t)0x90u))
        {
          [v15 path];
          id v103 = v55;
          id v88 = v87 = v36;
          *(_DWORD *)buf = 138412802;
          v112 = v88;
          __int16 v113 = 2112;
          id v114 = location;
          __int16 v115 = 2112;
          v116 = v56;
          _os_log_error_impl(&dword_1D353B000, v59, (os_log_type_t)0x90u, "[ERROR] Unable to get thumbnail size at '%@' to upload stage: %@%@", buf, 0x20u);

          int v36 = v87;
          id v55 = v103;
        }
      }
    }
    goto LABEL_36;
  }
  id v24 = self;
  uint64_t v25 = v100;
  [(BRCFSUploader *)v24 _updateRecordInDB:v100 item:v13 syncContext:v14 transferSize:v99 stageID:v16];
LABEL_56:
}

- (void)_updateRecord:(id)a3 jobID:(id)a4 syncContext:(id)a5 targetThumbnailURL:(id)a6 stageID:(id)a7
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [(BRCFSUploader *)self _documentItemForJobID:v13 stageID:v16];
  if (v17)
  {
    memset(v22, 0, sizeof(v22));
    __brc_create_section(0, (uint64_t)"-[BRCFSUploader _updateRecord:jobID:syncContext:targetThumbnailURL:stageID:]", 1114, v22);
    int v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v21 = v22[0];
      int v20 = [v17 itemID];
      *(_DWORD *)buf = 134218754;
      uint64_t v24 = v21;
      __int16 v25 = 2112;
      id v26 = v13;
      __int16 v27 = 2112;
      __int16 v28 = v20;
      __int16 v29 = 2112;
      uint64_t v30 = v18;
      _os_log_debug_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%@]: Done generating thumbnail, building record for %@%@", buf, 0x2Au);
    }
    [(BRCFSUploader *)self _updateRecord:v12 item:v17 syncContext:v14 targetThumbnailURL:v15 stageID:v16];
    __brc_leave_section(v22);
  }
}

- (void)_computeRecordForJobID:(id)a3 item:(id)a4 syncContext:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  unsigned int v42 = (char *)a3;
  id v8 = a4;
  id v41 = a5;
  memset(v48, 0, sizeof(v48));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader _computeRecordForJobID:item:syncContext:]", 1127, v48);
  uint64_t v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v33 = v48[0];
    uint64_t v34 = [v8 itemID];
    *(_DWORD *)buf = 134218754;
    uint64_t v51 = v33;
    __int16 v52 = 2112;
    uint64_t v53 = v42;
    __int16 v54 = 2112;
    id v55 = v34;
    __int16 v56 = 2112;
    id v57 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%@]: Preparing record for upload of %@%@", buf, 0x2Au);
  }
  id v11 = NSString;
  id v12 = [MEMORY[0x1E4F29128] UUID];
  id v13 = [v12 UUIDString];
  id v14 = [v11 stringWithFormat:@"upload-%@-%@", v42, v13];

  id v15 = [v8 currentVersion];
  id v16 = [v15 ckInfo];
  id v17 = [v8 baseRecordClearAllFields:v16 != 0];

  if ([v8 shouldTransferThumbnail])
  {
    id v18 = objc_alloc(MEMORY[0x1E4F29128]);
    v49[0] = 0;
    v49[1] = 0;
    uint64_t v40 = (void *)[v18 initWithUUIDBytes:v49];
    id v19 = NSString;
    int v20 = [(BRCAccountSession *)self->super.super._session volume];
    uint64_t v21 = [v20 deviceID];
    __int16 v22 = [v8 fileIDForUpload];
    id v39 = objc_msgSend(v19, "br_pathWithDeviceID:fileID:", v21, objc_msgSend(v22, "unsignedLongLongValue"));

    int v23 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v39];
    [(BRCFSUploader *)self _updateJobID:v42 setStageID:v14 operationID:v40];
    uint64_t v24 = [(BRCAccountSession *)self->super.super._session stageRegistry];
    __int16 v25 = [v24 createURLForThumbnailUploadWithStageID:v14];

    v43[0] = MEMORY[0x1E4F143A8];
    v43[1] = 3221225472;
    v43[2] = __57__BRCFSUploader__computeRecordForJobID_item_syncContext___block_invoke;
    v43[3] = &unk_1E6998AB8;
    v43[4] = self;
    id v44 = v17;
    id v26 = v42;
    uint64_t v45 = v26;
    id v27 = v41;
    id v46 = v27;
    id v47 = v14;
    __int16 v28 = (void *)MEMORY[0x1D94389C0](v43);
    __int16 v29 = [(BRCFSUploader *)self thumbnailGenerationManager];
    uint64_t v30 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v26, "itemDBRowID"));
    [v29 addThumbnailGenerationJobAtURL:v23 targetURL:v25 thumbnailID:v30 syncContext:v27 completionHandler:v28];
  }
  else
  {
    uint64_t v31 = brc_bread_crumbs();
    uint64_t v32 = brc_default_log();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEBUG))
    {
      int v35 = [v8 isInDocumentScope];
      int v36 = [v8 shouldHaveThumbnail];
      __int16 v37 = "no";
      *(_DWORD *)buf = 138413058;
      uint64_t v51 = (uint64_t)v42;
      if (v35) {
        id v38 = "yes";
      }
      else {
        id v38 = "no";
      }
      __int16 v52 = 2080;
      uint64_t v53 = v38;
      if (v36) {
        __int16 v37 = "yes";
      }
      __int16 v54 = 2080;
      id v55 = v37;
      __int16 v56 = 2112;
      id v57 = v31;
      _os_log_debug_impl(&dword_1D353B000, v32, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%@]: skipping thumbnail (inDocumentScope:%s shouldHaveThumbnail:%s shouldTransferThumbnail:no)%@", buf, 0x2Au);
    }

    [(BRCFSUploader *)self _updateRecord:v17 item:v8 syncContext:v41 targetThumbnailURL:0 stageID:v14];
  }

  __brc_leave_section(v48);
}

void __57__BRCFSUploader__computeRecordForJobID_item_syncContext___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  uint64_t v4 = *(void *)(a1 + 32);
  id v5 = *(void **)(v4 + 112);
  id v6 = *(void **)(v4 + 24);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = __57__BRCFSUploader__computeRecordForJobID_item_syncContext___block_invoke_2;
  v8[3] = &unk_1E6998A90;
  v8[4] = v4;
  id v9 = *(id *)(a1 + 40);
  id v10 = *(id *)(a1 + 48);
  id v11 = *(id *)(a1 + 56);
  id v12 = v3;
  id v13 = *(id *)(a1 + 64);
  id v7 = v3;
  brc_task_tracker_async_with_logs(v5, v6, v8, &__block_literal_global_42);
}

void __57__BRCFSUploader__computeRecordForJobID_item_syncContext___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = (void *)MEMORY[0x1D9438760]();
  [*(id *)(a1 + 32) _updateRecord:*(void *)(a1 + 40) jobID:*(void *)(a1 + 48) syncContext:*(void *)(a1 + 56) targetThumbnailURL:*(void *)(a1 + 64) stageID:*(void *)(a1 + 72)];
}

- (id)_duplicatePackage:(id)a3 stageID:(id)a4 stageName:(id)a5 error:(id *)a6
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = objc_msgSend(MEMORY[0x1E4F1A250], "br_packageWithPackage:error:", a3, a6);
  if (v12)
  {
    id v13 = [(BRCAccountSession *)self->super.super._session stageRegistry];
    id v14 = [v13 createURLForUploadWithStageID:v10 name:v11];

    if ([v12 anchorAtURL:v14 error:a6])
    {
      [v12 close];
      id v15 = v12;
      goto LABEL_17;
    }
    id v18 = brc_bread_crumbs();
    id v19 = brc_default_log();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v20 = [(__CFString *)v14 path];
      uint64_t v21 = (void *)v20;
      if (a6) {
        __int16 v22 = (__CFString *)*a6;
      }
      else {
        __int16 v22 = @"unknown";
      }
      int v24 = 138413058;
      __int16 v25 = v12;
      __int16 v26 = 2112;
      uint64_t v27 = v20;
      __int16 v28 = 2112;
      __int16 v29 = v22;
      __int16 v30 = 2112;
      uint64_t v31 = v18;
      _os_log_impl(&dword_1D353B000, v19, OS_LOG_TYPE_DEFAULT, "[WARNING] can't anchor the package %@ at %@: %@%@", (uint8_t *)&v24, 0x2Au);
    }
    [v12 close];
    [v12 removeDB];
  }
  else
  {
    brc_bread_crumbs();
    id v14 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      if (a6) {
        id v17 = (__CFString *)*a6;
      }
      else {
        id v17 = @"unknown";
      }
      int v24 = 138412802;
      __int16 v25 = 0;
      __int16 v26 = 2112;
      uint64_t v27 = (uint64_t)v17;
      __int16 v28 = 2112;
      __int16 v29 = v14;
      _os_log_impl(&dword_1D353B000, v16, OS_LOG_TYPE_DEFAULT, "[WARNING] can't duplicate the package %@: %@%@", (uint8_t *)&v24, 0x20u);
    }
  }
  id v15 = 0;
LABEL_17:

  return v15;
}

- (BOOL)_finishPackageUploadWithRecord:(id)a3 item:(id)a4 stageID:(id)a5 error:(id *)a6
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(BRFieldPkgItem);
  id v14 = [v10 objectForKeyedSubscript:@"pkgContent"];
  id v59 = 0;
  LOBYTE(a5) = [v14 openWithError:&v59];
  id v15 = v59;
  id v16 = v15;
  if ((a5 & 1) == 0)
  {
    id v18 = (BRCPackageChecksummer *)v15;
    if (v18)
    {
      uint64_t v32 = v16;
      uint64_t v33 = brc_bread_crumbs();
      uint64_t v34 = brc_default_log();
      if (os_log_type_enabled(v34, (os_log_type_t)0x90u))
      {
        id v44 = "(passed to caller)";
        *(_DWORD *)buf = 136315906;
        int v62 = "-[BRCFSUploader _finishPackageUploadWithRecord:item:stageID:error:]";
        __int16 v63 = 2080;
        if (!a6) {
          id v44 = "(ignored by caller)";
        }
        uint64_t v64 = v44;
        __int16 v65 = 2112;
        uint64_t v66 = v18;
        __int16 v67 = 2112;
        uint64_t v68 = v33;
        _os_log_error_impl(&dword_1D353B000, v34, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
      }

      id v16 = v32;
    }
    if (a6)
    {
      id v18 = v18;
      BOOL v35 = 0;
      *a6 = v18;
    }
    else
    {
      BOOL v35 = 0;
    }
    goto LABEL_41;
  }
  id v52 = v12;
  BOOL v17 = +[BRCPackageItem updateSignaturesForFilesInItem:v11 fromCKPackage:v14 error:a6];
  [v14 close];
  if (v17)
  {
    id v47 = self;
    uint64_t v50 = v16;
    uint64_t v51 = a6;
    uint64_t v49 = v10;
    id v18 = objc_alloc_init(BRCPackageChecksummer);
    +[BRCPackageItem packageItemsForItem:v11 order:2];
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v19 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
    if (v19)
    {
      uint64_t v21 = v19;
      __int16 v22 = 0;
      uint64_t v23 = *(void *)v56;
      *(void *)&long long v20 = 138412290;
      long long v46 = v20;
      id v48 = v11;
      while (2)
      {
        uint64_t v24 = 0;
        __int16 v25 = v22;
        do
        {
          if (*(void *)v56 != v23) {
            objc_enumerationMutation(obj);
          }
          uint64_t v26 = *(void *)(*((void *)&v55 + 1) + 8 * v24);
          uint64_t v27 = (void *)MEMORY[0x1D9438760]();
          [(BRFieldPkgItem *)v13 updateWithPkgItem:v26];
          if ([(BRFieldPkgItem *)v13 type] == 2 && ![(BRFieldPkgItem *)v13 hasSignature])
          {
            brc_bread_crumbs();
            __int16 v29 = (char *)objc_claimAutoreleasedReturnValue();
            __int16 v30 = brc_default_log();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_FAULT))
            {
              *(_DWORD *)buf = v46;
              int v62 = v29;
              _os_log_fault_impl(&dword_1D353B000, v30, OS_LOG_TYPE_FAULT, "[CRIT] Assertion failed: pbitem.type != BRFieldPkgItemType_FILE || pbitem.hasSignature%@", buf, 0xCu);
            }
          }
          __int16 v54 = v25;
          BOOL v28 = -[BRCPackageChecksummer addItem:error:](v18, "addItem:error:", v13, &v54, v46);
          __int16 v22 = v54;

          if (!v28)
          {

            [(BRCPackageChecksummer *)v18 done];
            int v36 = v22;
            id v11 = v48;
            id v10 = v49;
            id v12 = v52;
            if (v36)
            {
              __int16 v37 = brc_bread_crumbs();
              id v38 = brc_default_log();
              if (os_log_type_enabled(v38, (os_log_type_t)0x90u))
              {
                uint64_t v45 = "(passed to caller)";
                *(_DWORD *)buf = 136315906;
                int v62 = "-[BRCFSUploader _finishPackageUploadWithRecord:item:stageID:error:]";
                __int16 v63 = 2080;
                if (!v51) {
                  uint64_t v45 = "(ignored by caller)";
                }
                uint64_t v64 = v45;
                __int16 v65 = 2112;
                uint64_t v66 = v36;
                __int16 v67 = 2112;
                uint64_t v68 = v37;
                _os_log_error_impl(&dword_1D353B000, v38, (os_log_type_t)0x90u, "[ERROR] %s: %s error: %@%@", buf, 0x2Au);
              }
            }
            if (v51)
            {
              int v36 = v36;
              BOOL v35 = 0;
              id *v51 = v36;
            }
            else
            {
              BOOL v35 = 0;
            }
            __int16 v22 = v36;
            goto LABEL_37;
          }
          [(BRFieldPkgItem *)v13 clear];
          ++v24;
          __int16 v25 = v22;
        }
        while (v21 != v24);
        uint64_t v31 = [obj countByEnumeratingWithState:&v55 objects:v60 count:16];
        uint64_t v21 = v31;
        id v11 = v48;
        if (v31) {
          continue;
        }
        break;
      }
    }
    else
    {
      __int16 v22 = 0;
    }

    [(BRCPackageChecksummer *)v18 done];
    id v39 = [(BRCPackageChecksummer *)v18 signature];
    id v10 = v49;
    [v49 setObject:v39 forKeyedSubscript:@"pkgSignature"];

    id v12 = v52;
    uint64_t v40 = [(BRCFSUploader *)v47 _duplicatePackage:v14 stageID:v52 stageName:@"ckpackage" error:v51];

    if (v40)
    {
      [v49 setObject:v40 forKeyedSubscript:@"pkgContent"];
      uint64_t v41 = [v49 objectForKeyedSubscript:@"pkgXattrs"];
      if (!v41)
      {
        BOOL v35 = 1;
        goto LABEL_40;
      }
      unsigned int v42 = (void *)v41;
      int v36 = [(BRCFSUploader *)v47 _duplicatePackage:v41 stageID:v52 stageName:@"ckpackage-xattrs" error:v51];

      if (v36)
      {
        [v49 setObject:v36 forKeyedSubscript:@"pkgXattrs"];
        BOOL v35 = 1;
        id v14 = (void *)v40;
LABEL_37:

        uint64_t v40 = (uint64_t)v14;
        goto LABEL_40;
      }
    }
    BOOL v35 = 0;
LABEL_40:

    id v14 = (void *)v40;
    id v16 = v50;
LABEL_41:

    goto LABEL_42;
  }
  BOOL v35 = 0;
LABEL_42:

  return v35;
}

- (void)_handleFileModifiedError:(id)a3 forItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = brc_bread_crumbs();
  id v8 = brc_default_log();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG)) {
    -[BRCFSUploader _handleFileModifiedError:forItem:]();
  }

  [v6 markLostClearGenerationID:1 backoffMode:1];
}

- (BOOL)_retryUploadForError:(id)a3 jobID:(id)a4 recomputeRecord:(BOOL)a5 syncContext:(id)a6
{
  id v10 = a6;
  session = self->super.super._session;
  id v12 = a4;
  id v13 = a3;
  id v14 = [(BRCAccountSession *)session clientDB];
  if (a5)
  {
    id v15 = @"_prepare";
  }
  else
  {
    id v15 = [v10 contextIdentifier];
  }
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = __72__BRCFSUploader__retryUploadForError_jobID_recomputeRecord_syncContext___block_invoke;
  uint64_t v22[3] = &unk_1E6994080;
  id v23 = v10;
  id v16 = v10;
  BOOL v17 = (void *)MEMORY[0x1D94389C0](v22);
  id v18 = [v13 description];

  uint64_t v19 = [v12 matchingJobsWhereSQLClause];

  char v20 = [v14 execute:@"UPDATE client_uploads SET transfer_queue = %@, transfer_operation = call_block(%@, next_retry_stamp), upload_error = %@ WHERE %@", v15, v17, v18, v19];
  if (!a5) {

  }
  return v20;
}

void __72__BRCFSUploader__retryUploadForError_jobID_recomputeRecord_syncContext___block_invoke(uint64_t a1, sqlite3_context *a2, uint64_t a3, sqlite3_value **a4)
{
  sqlite3_int64 v6 = sqlite3_value_int64(*a4);
  id v7 = [*(id *)(a1 + 32) uploadStream];
  [v7 signalWithDeadline:v6];

  sqlite3_result_null(a2);
}

- (void)_finishedUploadingItem:(id)a3 record:(id)a4 jobID:(id)a5 stageID:(id)a6 syncContext:(id)a7 hasPerformedServerSideAssetCopy:(BOOL)a8 error:(id)a9
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v61 = a4;
  int v62 = (__CFString *)a5;
  id v58 = a6;
  id v60 = a7;
  id v15 = (__CFString *)a9;
  id v16 = [v14 clientZone];
  memset(v67, 0, sizeof(v67));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:]", 1385, v67);
  BOOL v17 = brc_bread_crumbs();
  id v18 = brc_default_log();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v38 = v67[0];
    uint64_t v39 = [v14 digestDescription];
    uint64_t v40 = (void *)v39;
    uint64_t v41 = @"success";
    *(_DWORD *)buf = 134219010;
    if (v15) {
      uint64_t v41 = v15;
    }
    uint64_t v69 = v38;
    __int16 v70 = 2112;
    id v71 = v62;
    __int16 v72 = 2112;
    uint64_t v73 = v39;
    __int16 v74 = 2112;
    v75 = v41;
    __int16 v76 = 2112;
    v77 = v17;
    _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%@]: done with %@ (%@)%@", buf, 0x34u);
  }
  [(__CFString *)v15 brc_logUnderlineErrorsChain];
  if ([v16 handleZoneLevelErrorIfNeeded:v15 forItemCreation:1]) {
    goto LABEL_61;
  }
  if (v15) {
    goto LABEL_78;
  }
  id v23 = [v61 objectForKeyedSubscript:@"pkgContent"];
  BOOL v24 = !v23 || a8;

  if (!v24)
  {
    id v66 = 0;
    BOOL v25 = [(BRCFSUploader *)self _finishPackageUploadWithRecord:v61 item:v14 stageID:v58 error:&v66];
    uint64_t v26 = (__CFString *)v66;
    id v15 = v26;
    if (!v25)
    {
      if (!v26)
      {
        long long v55 = brc_bread_crumbs();
        long long v56 = brc_default_log();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
          -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:].cold.7();
        }
      }
      uint64_t v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F281F8] code:512 userInfo:0];

      id v15 = (__CFString *)v27;
    }
    if (v15)
    {
LABEL_78:
      if ([(__CFString *)v15 brc_isCloudKitUnknownItemError])
      {
        uint64_t v19 = brc_bread_crumbs();
        char v20 = brc_default_log();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:]();
        }

        [v14 handleUnknownItemError];
        [v14 markLostClearGenerationID:0 backoffMode:0];
LABEL_8:
        char v21 = 0;
        __int16 v22 = 0;
LABEL_23:
        int v57 = 1;
        goto LABEL_24;
      }
      if (([(__CFString *)v15 brc_isCloudKitErrorRequiringAssetRecheck] & 1) != 0
        || ([(__CFString *)v15 brc_isCloudKitErrorRequiringAssetRescan] & 1) != 0
        || [(__CFString *)v15 br_isCKErrorCode:12])
      {
        [(BRCFSUploader *)self _handleFileModifiedError:v15 forItem:v14];
        __int16 v22 = [v60 uploadFileModifiedThrottle];
        char v21 = 1;
        goto LABEL_23;
      }
      if ([(__CFString *)v15 brc_isCloudKitErrorNoNetwork])
      {
        unsigned int v42 = brc_bread_crumbs();
        BOOL v43 = brc_default_log();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
          -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:].cold.4();
        }
      }
      else
      {
        if ([(__CFString *)v15 brc_isCloudKitErrorRequiresVerifyTerms])
        {
          id v44 = +[BRCAccountHandler currentiCloudAccount];
          int v45 = objc_msgSend(v44, "br_needsToVerifyTerms");

          if (v45)
          {
            unsigned int v42 = brc_bread_crumbs();
            BOOL v43 = brc_default_log();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_DEBUG)) {
              -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:].cold.5();
            }
            int v57 = 0;
            goto LABEL_46;
          }
        }
        if (([(__CFString *)v15 brc_isCloudKitCancellationError] & 1) != 0
          || ([(__CFString *)v15 brc_isCloudKitErrorRequiringAssetReupload] & 1) != 0
          || [(__CFString *)v15 brc_isRetriable])
        {
          uint64_t v49 = brc_bread_crumbs();
          uint64_t v50 = brc_default_log();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_DEBUG)) {
            -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:].cold.6();
          }

          [(BRCFSUploader *)self _retryUploadForError:v15 jobID:v62 recomputeRecord:0 syncContext:v60];
          goto LABEL_8;
        }
        unsigned int v42 = brc_bread_crumbs();
        BOOL v43 = brc_default_log();
        if (os_log_type_enabled(v43, (os_log_type_t)0x90u))
        {
          uint64_t v51 = [v14 st];
          id v52 = [v51 displayName];
          *(_DWORD *)buf = 138412802;
          uint64_t v69 = (uint64_t)v52;
          __int16 v70 = 2112;
          id v71 = v15;
          __int16 v72 = 2112;
          uint64_t v73 = (uint64_t)v42;
          _os_log_error_impl(&dword_1D353B000, v43, (os_log_type_t)0x90u, "[ERROR] non recoverable error while uploading %@: %@%@", buf, 0x20u);
        }
      }
      int v57 = 1;
LABEL_46:

      __int16 v22 = 0;
      char v21 = 1;
LABEL_24:
      __int16 v29 = brc_bread_crumbs();
      __int16 v30 = brc_default_log();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:]();
      }

      uint64_t v31 = v22;
      if (!v22)
      {
        uint64_t v31 = [v60 uploadThrottle];
      }
      unint64_t v32 = [(BRCFSSchedulerBase *)self postponeJobID:v62 withThrottle:v31];
      if (!v22) {

      }
      uint64_t v33 = [v14 appLibrary];
      uint64_t v34 = [v33 mangledID];
      BOOL v35 = +[BRCUserDefaults defaultsForMangledID:v34];
      unint64_t v36 = [v35 uploadRetryCountForFailure];

      if ((v21 & 1) == 0)
      {
        if (v32 > v36) {
          [(BRCFSUploader *)self _reportUploadErrorForDocument:v14 error:v15 underlyingError:0];
        }
        goto LABEL_60;
      }
      if ([(__CFString *)v15 brc_isCloudKitOutOfQuota])
      {
        uint64_t v37 = 32;
      }
      else if ([(__CFString *)v15 brc_isCloudKitErrorDataProtectionClass])
      {
        uint64_t v37 = 35;
      }
      else if ([(__CFString *)v15 brc_isCloudKitErrorNoNetwork])
      {
        uint64_t v37 = 36;
      }
      else
      {
        if ((v57 | [(__CFString *)v15 brc_isCloudKitErrorRequiresVerifyTerms] ^ 1))
        {
          [(BRCFSUploader *)self setState:33 forItem:v14 uploadError:v15];
          if (([(__CFString *)v15 brc_isCloudKitErrorRequiringAssetRescan] & 1) == 0) {
            [(BRCFSUploader *)self _reportUploadErrorForDocument:v14 error:v15];
          }
          goto LABEL_57;
        }
        uint64_t v37 = 37;
      }
      [(BRCFSUploader *)self setState:v37 forItem:v14 uploadError:v15];
LABEL_57:

      char v28 = 0;
      goto LABEL_58;
    }
  }
  if ([v14 isReadAndUploaded])
  {
    uint64_t v53 = brc_bread_crumbs();
    __int16 v54 = brc_default_log();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_FAULT)) {
      -[BRCFSUploader _finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:]();
    }
  }
  [v14 markUploadedWithRecord:v61];
  [(BRCFSUploader *)self _clearUploadErrorForDocument:v14];
  id v15 = 0;
  char v28 = 1;
LABEL_58:
  long long v46 = [v14 currentVersion];
  [v46 setUploadError:v15];

  [v14 saveToDB];
  if ((v28 & 1) == 0)
  {
    id v47 = [(BRCAccountSession *)self->super.super._session clientDB];
    id v48 = [v47 serialQueue];
    v63[0] = MEMORY[0x1E4F143A8];
    v63[1] = 3221225472;
    v63[2] = __111__BRCFSUploader__finishedUploadingItem_record_jobID_stageID_syncContext_hasPerformedServerSideAssetCopy_error___block_invoke;
    v63[3] = &unk_1E6993628;
    id v64 = v16;
    __int16 v65 = v62;
    dispatch_async_with_logs_11(v48, v63);

    __int16 v22 = v64;
LABEL_60:
  }
LABEL_61:
  __brc_leave_section(v67);
}

void __111__BRCFSUploader__finishedUploadingItem_record_jobID_stageID_syncContext_hasPerformedServerSideAssetCopy_error___block_invoke(uint64_t a1)
{
  objc_msgSend(*(id *)(a1 + 32), "itemByRowID:", objc_msgSend(*(id *)(a1 + 40), "itemDBRowID"));
  id v1 = (id)objc_claimAutoreleasedReturnValue();
  [v1 triggerNotificationIfNeeded];
}

- (void)_performServerSideAssetCopyForItem:(id)a3 transferSize:(unint64_t)a4
{
  v63[1] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  sqlite3_int64 v6 = [v5 currentVersion];
  id v7 = [v6 previousItemGlobalID];

  uint64_t v45 = [v5 dbRowID];
  session = self->super.super._session;
  id v9 = [v7 zoneRowID];
  id v10 = [(BRCAccountSession *)session serverZoneByRowID:v9];

  id v47 = v7;
  id v11 = [v7 itemID];
  id v12 = [v10 zoneID];
  id v13 = [v11 contentsRecordIDInZoneID:v12];

  id v14 = [v5 baseRecord];
  id v15 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", [v5 dbRowID]);
  id v16 = [v10 clientZone];
  BOOL v17 = [v16 serverItemByItemID:v11];

  v55[0] = MEMORY[0x1E4F143A8];
  v55[1] = 3221225472;
  v55[2] = __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke;
  v55[3] = &unk_1E6998B08;
  id v18 = v15;
  long long v56 = v18;
  id v19 = v10;
  id v57 = v19;
  id v58 = self;
  id v20 = v13;
  id v59 = v20;
  id v21 = v14;
  id v60 = v21;
  id v61 = 0;
  __int16 v22 = (void (**)(void, void, void, void, void))MEMORY[0x1D94389C0](v55);
  if (v17) {
    id v23 = v17;
  }
  else {
    id v23 = v5;
  }
  if ([v23 isPackage])
  {
    unsigned int v42 = v22;
    id v43 = v21;
    BOOL v24 = brc_bread_crumbs();
    BOOL v25 = brc_default_log();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSUploader _performServerSideAssetCopyForItem:transferSize:]();
    }

    id v26 = objc_alloc(MEMORY[0x1E4F1A0A8]);
    v63[0] = v20;
    uint64_t v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:v63 count:1];
    char v28 = (void *)[v26 initWithRecordIDs:v27];

    [v28 setShouldFetchAssetContent:0];
    v62[0] = @"pkgManifest";
    v62[1] = @"pkgXattrs";
    __int16 v29 = [MEMORY[0x1E4F1C978] arrayWithObjects:v62 count:2];
    [v28 setDesiredKeys:v29];

    v48[0] = MEMORY[0x1E4F143A8];
    v48[1] = 3221225472;
    v48[2] = __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_192;
    uint64_t v48[3] = &unk_1E6998B58;
    v48[4] = self;
    uint64_t v54 = v45;
    __int16 v30 = v18;
    uint64_t v49 = v30;
    id v50 = v20;
    id v44 = v18;
    id v46 = v19;
    id v31 = v19;
    id v51 = v31;
    unint64_t v32 = v11;
    id v52 = v11;
    uint64_t v53 = v22;
    [v28 setFetchRecordsCompletionBlock:v48];
    uint64_t v33 = [BRCFetchRecordsWrapperOperation alloc];
    uint64_t v34 = objc_msgSend(MEMORY[0x1E4F1A218], "br_operationGroupWithName:", @"FetchRecordsWrapper");
    BOOL v35 = [(BRCFetchRecordsWrapperOperation *)v33 initWithCKFetchRecordsOperation:v28 group:v34 serverZone:v31 isUserWaiting:0 sessionContext:self->super.super._session];

    unint64_t v36 = [v5 syncContextUsedForTransfers];
    uint64_t v37 = [v36 uploadThrottle];
    uint64_t v38 = [(_BRCOperation *)v35 operationID];
    uint64_t v39 = self;
    id v40 = v20;
    uint64_t v41 = (void *)v38;
    [(BRCFSUploader *)v39 _willAttemptJobID:v30 throttle:v37 operationID:v38];

    id v20 = v40;
    __int16 v22 = v42;

    id v11 = v32;
    id v18 = v44;
    [(_BRCOperation *)v35 schedule];

    id v19 = v46;
    id v21 = v43;
  }
  else
  {
    ((void (**)(void, id, void *, void, void))v22)[2](v22, v5, v17, 0, 0);
  }
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke(uint64_t a1, void *a2, void *a3, void *a4, char a5)
{
  id v9 = a2;
  id v10 = a3;
  id v11 = a4;
  id v12 = [v9 db];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2;
  v18[3] = &unk_1E6998AE0;
  id v19 = *(id *)(a1 + 32);
  id v20 = *(id *)(a1 + 40);
  id v21 = v10;
  uint64_t v13 = *(void *)(a1 + 48);
  id v14 = *(void **)(a1 + 56);
  id v22 = v9;
  uint64_t v23 = v13;
  id v24 = v14;
  id v25 = *(id *)(a1 + 64);
  id v26 = *(id *)(a1 + 72);
  id v27 = v11;
  char v28 = a5;
  id v15 = v11;
  id v16 = v9;
  id v17 = v10;
  [v12 groupInBatch:v18];
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2(uint64_t a1)
{
  uint64_t v2 = brc_bread_crumbs();
  id v3 = brc_default_log();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG)) {
    __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_12(a1);
  }

  if ([*(id *)(a1 + 40) isSharedZone]) {
    uint64_t v4 = 3;
  }
  else {
    uint64_t v4 = 2;
  }
  id v5 = [*(id *)(a1 + 48) latestVersion];
  sqlite3_int64 v6 = v5;
  if (v5)
  {
    id v7 = v5;
  }
  else
  {
    id v7 = [*(id *)(a1 + 56) currentVersion];
  }
  id v8 = v7;

  char v9 = [v8 isPackage];
  id v10 = [v8 contentSignature];
  if ((objc_msgSend(v10, "brc_signatureIsValid") & 1) == 0)
  {
    id v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
      __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_11(a1);
    }

    id v24 = *(void **)(a1 + 56);
    uint64_t v23 = *(void **)(a1 + 64);
    uint64_t v25 = *(void *)(a1 + 32);
    id v26 = [v24 syncContextUsedForTransfers];
    id v27 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F19C40] code:17 userInfo:0];
    [v23 _finishedUploadingItem:v24 record:0 jobID:v25 stageID:0 syncContext:v26 hasPerformedServerSideAssetCopy:1 error:v27];
LABEL_22:

    goto LABEL_64;
  }
  if ((v9 & 1) == 0)
  {
    char v28 = brc_bread_crumbs();
    __int16 v29 = brc_default_log();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG)) {
      __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_10();
    }

    id v26 = (id)[objc_alloc(MEMORY[0x1E4F19E70]) initWithExistingRecordID:*(void *)(a1 + 72) databaseScope:v4 fieldName:@"fileContent" fileSignature:v10];
    if (!v26)
    {
      __int16 v30 = brc_bread_crumbs();
      id v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG)) {
        __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_9();
      }
    }
    unint64_t v32 = objc_msgSend(MEMORY[0x1E4F19E50], "br_assetWithAssetReferece:boundaryKey:", v26, *(void *)(a1 + 88));
    [*(id *)(a1 + 80) setObject:v32 forKeyedSubscript:@"fileContent"];

    uint64_t v33 = [*(id *)(a1 + 80) objectForKeyedSubscript:@"fileContent"];

    if (v33)
    {
LABEL_42:

      if ([v8 hasThumbnail])
      {
        id v51 = [v8 thumbnailSignature];
        char v52 = objc_msgSend(v51, "brc_signatureIsValid");

        if (v52)
        {
          id v53 = objc_alloc(MEMORY[0x1E4F19E70]);
          uint64_t v54 = *(void *)(a1 + 72);
          long long v55 = [v8 thumbnailSignature];
          long long v56 = (void *)[v53 initWithExistingRecordID:v54 databaseScope:v4 fieldName:@"thumb1024" fileSignature:v55];

          id v57 = objc_msgSend(MEMORY[0x1E4F19E50], "br_assetWithAssetReferece:boundaryKey:", v56, *(void *)(a1 + 88));
          [*(id *)(a1 + 80) setObject:v57 forKeyedSubscript:@"thumb1024"];
        }
        else
        {
          long long v56 = brc_bread_crumbs();
          id v57 = brc_default_log();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_FAULT)) {
            __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_4(a1);
          }
        }
      }
      id v60 = [v8 xattrSignature];

      if (!v60) {
        goto LABEL_63;
      }
      id v61 = [v8 xattrSignature];
      char v62 = objc_msgSend(v61, "brc_signatureIsValid");

      if (v62)
      {
        id v63 = objc_alloc(MEMORY[0x1E4F19E70]);
        uint64_t v64 = *(void *)(a1 + 72);
        __int16 v65 = [v8 xattrSignature];
        id v66 = (void *)[v63 initWithExistingRecordID:v64 databaseScope:v4 fieldName:@"xattr" fileSignature:v65];

        __int16 v67 = objc_msgSend(MEMORY[0x1E4F19E50], "br_assetWithAssetReferece:boundaryKey:", v66, *(void *)(a1 + 88));
        [*(id *)(a1 + 80) setObject:v67 forKeyedSubscript:@"xattr"];

        uint64_t v68 = *(void *)(a1 + 88);
        if (v68)
        {
          uint64_t v69 = [v8 xattrSignature];
        }
        else
        {
          uint64_t v69 = 0;
        }
        v75 = [*(id *)(a1 + 80) encryptedValues];
        [v75 setObject:v69 forKeyedSubscript:@"xattrSignature"];

        if (!v68) {
          goto LABEL_62;
        }
      }
      else
      {
        id v66 = brc_bread_crumbs();
        uint64_t v69 = brc_default_log();
        if (os_log_type_enabled(v69, OS_LOG_TYPE_FAULT)) {
          __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_3(a1);
        }
      }

LABEL_62:
LABEL_63:
      [*(id *)(a1 + 80) serializeContentBoundaryKey:*(void *)(a1 + 88)];
      v77 = *(void **)(a1 + 56);
      __int16 v76 = *(void **)(a1 + 64);
      uint64_t v78 = *(void *)(a1 + 80);
      uint64_t v79 = *(void *)(a1 + 32);
      id v26 = [v77 syncContextUsedForTransfers];
      [v76 _finishedUploadingItem:v77 record:v78 jobID:v79 stageID:0 syncContext:v26 hasPerformedServerSideAssetCopy:1 error:0];
      goto LABEL_64;
    }
    uint64_t v34 = brc_bread_crumbs();
    BOOL v35 = brc_default_log();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEBUG)) {
      __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_8();
    }

    uint64_t v37 = *(void **)(a1 + 56);
    unint64_t v36 = *(void **)(a1 + 64);
    uint64_t v38 = *(void *)(a1 + 32);
    id v27 = [v37 syncContextUsedForTransfers];
    uint64_t v39 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorCantCreateAsset");
    [v36 _finishedUploadingItem:v37 record:0 jobID:v38 stageID:0 syncContext:v27 hasPerformedServerSideAssetCopy:1 error:v39];

    goto LABEL_22;
  }
  id v11 = brc_bread_crumbs();
  id v12 = brc_default_log();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG)) {
    __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_7(a1);
  }

  if (*(unsigned char *)(a1 + 104))
  {
    uint64_t v13 = *(void *)(a1 + 72);
    uint64_t v14 = *(void *)(a1 + 88);
    id v81 = 0;
    id v15 = objc_msgSend(MEMORY[0x1E4F1A250], "br_clonedPackageWithRecordID:databaseScope:fieldName:boundaryKey:error:", v13, v4, @"pkgXattrs", v14, &v81);
    id v16 = v81;
    [*(id *)(a1 + 80) setObject:v15 forKeyedSubscript:@"pkgXattrs"];

    id v17 = [*(id *)(a1 + 80) objectForKeyedSubscript:@"pkgXattrs"];

    if (!v17 || (id v18 = 0, v16))
    {
      id v19 = brc_bread_crumbs();
      id v20 = brc_default_log();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG)) {
        __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_6();
      }

      id v18 = v16;
    }
  }
  else
  {
    id v18 = 0;
  }
  uint64_t v40 = *(void *)(a1 + 72);
  uint64_t v41 = *(void *)(a1 + 88);
  id v80 = v18;
  unsigned int v42 = objc_msgSend(MEMORY[0x1E4F1A250], "br_clonedPackageWithRecordID:databaseScope:fieldName:boundaryKey:error:", v40, v4, @"pkgContent", v41, &v80);
  id v26 = v80;

  [*(id *)(a1 + 80) setObject:v42 forKeyedSubscript:@"pkgContent"];
  id v43 = [*(id *)(a1 + 80) objectForKeyedSubscript:@"pkgContent"];

  if (!v43 || v26)
  {
    id v44 = brc_bread_crumbs();
    uint64_t v45 = brc_default_log();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_DEBUG)) {
      __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_5();
    }
  }
  id v46 = (void *)[objc_alloc(MEMORY[0x1E4F19E70]) initWithExistingRecordID:*(void *)(a1 + 72) databaseScope:v4 fieldName:@"pkgManifest" fileSignature:*(void *)(a1 + 96)];
  if (v46)
  {
    id v47 = objc_msgSend(MEMORY[0x1E4F19E50], "br_assetWithAssetReferece:boundaryKey:", v46, *(void *)(a1 + 88));
    [*(id *)(a1 + 80) setObject:v47 forKeyedSubscript:@"pkgManifest"];

    id v48 = [*(id *)(a1 + 80) objectForKeyedSubscript:@"pkgManifest"];

    if (v48)
    {
      uint64_t v49 = [*(id *)(a1 + 56) currentVersion];
      id v50 = [v49 contentSignature];
      [*(id *)(a1 + 80) setObject:v50 forKeyedSubscript:@"pkgSignature"];

      goto LABEL_42;
    }
    id v58 = brc_bread_crumbs();
    id v59 = brc_default_log();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
      __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_2();
    }
  }
  else
  {
    id v58 = brc_bread_crumbs();
    id v59 = brc_default_log();
    if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG)) {
      __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_1();
    }
  }

  id v71 = *(void **)(a1 + 56);
  __int16 v70 = *(void **)(a1 + 64);
  uint64_t v72 = *(void *)(a1 + 32);
  uint64_t v73 = [v71 syncContextUsedForTransfers];
  __int16 v74 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorCantCreateAsset");
  [v70 _finishedUploadingItem:v71 record:0 jobID:v72 stageID:0 syncContext:v73 hasPerformedServerSideAssetCopy:1 error:v74];

LABEL_64:
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_192(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  id v7 = [*(id *)(*(void *)(a1 + 32) + 8) clientTruthWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_193;
  block[3] = &unk_1E6998B30;
  uint64_t v19 = *(void *)(a1 + 80);
  id v8 = *(void **)(a1 + 40);
  void block[4] = *(void *)(a1 + 32);
  id v12 = v6;
  id v13 = v8;
  id v14 = v5;
  id v15 = *(id *)(a1 + 48);
  id v16 = *(id *)(a1 + 56);
  id v17 = *(id *)(a1 + 64);
  id v18 = *(id *)(a1 + 72);
  id v9 = v5;
  id v10 = v6;
  dispatch_async(v7, block);
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_193(uint64_t a1)
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(*(void *)(a1 + 32) + 8) itemByRowID:*(void *)(a1 + 96)];
  id v3 = [v2 asDocument];

  if (*(void *)(a1 + 40))
  {
    uint64_t v4 = *(void **)(a1 + 32);
    uint64_t v5 = *(void *)(a1 + 48);
    id v6 = [v3 syncContextUsedForTransfers];
    [v4 _finishedUploadingItem:v3 record:0 jobID:v5 stageID:0 syncContext:v6 hasPerformedServerSideAssetCopy:1 error:*(void *)(a1 + 40)];
  }
  else
  {
    id v7 = [*(id *)(a1 + 56) objectForKeyedSubscript:*(void *)(a1 + 64)];
    id v8 = [v7 objectForKeyedSubscript:@"pkgManifest"];
    if (v8) {
      BOOL v9 = v3 == 0;
    }
    else {
      BOOL v9 = 1;
    }
    if (v9)
    {
      id v10 = brc_bread_crumbs();
      id v11 = brc_default_log();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412802;
        id v27 = v7;
        __int16 v28 = 2112;
        __int16 v29 = v3;
        __int16 v30 = 2112;
        id v31 = v10;
        _os_log_fault_impl(&dword_1D353B000, v11, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: No error but also no asset or item with record %@ item %@%@", buf, 0x20u);
      }

      id v12 = *(void **)(a1 + 32);
      uint64_t v13 = *(void *)(a1 + 48);
      id v16 = [v3 syncContextUsedForTransfers];
      id v14 = objc_msgSend(MEMORY[0x1E4F28C58], "brc_errorItemChanged");
      [v12 _finishedUploadingItem:v3 record:0 jobID:v13 stageID:0 syncContext:v16 hasPerformedServerSideAssetCopy:1 error:v14];
    }
    else
    {
      id v15 = [*(id *)(a1 + 72) clientZone];
      id v16 = [v15 serverItemByItemID:*(void *)(a1 + 80)];

      id v17 = brc_bread_crumbs();
      id v18 = brc_default_log();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        id v24 = [*(id *)(a1 + 64) recordName];
        uint64_t v23 = [v8 signature];
        id v21 = NSNumber;
        uint64_t v25 = [v7 objectForKeyedSubscript:@"pkgXattrs"];
        id v22 = [v21 numberWithInt:v25 != 0];
        *(_DWORD *)buf = 138413058;
        id v27 = v24;
        __int16 v28 = 2112;
        __int16 v29 = v23;
        __int16 v30 = 2112;
        id v31 = v22;
        __int16 v32 = 2112;
        uint64_t v33 = v17;
        _os_log_debug_impl(&dword_1D353B000, v18, OS_LOG_TYPE_DEBUG, "[DEBUG] Record [%@] pkgManifest signature [%@] hasXattrs [%@]%@", buf, 0x2Au);
      }
      uint64_t v19 = *(void *)(a1 + 88);
      id v14 = [v8 signature];
      id v20 = [v7 objectForKeyedSubscript:@"pkgXattrs"];
      (*(void (**)(uint64_t, void *, void *, void *, BOOL))(v19 + 16))(v19, v3, v16, v14, v20 != 0);
    }
  }
}

- (void)_transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6
{
  uint64_t v85 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  BOOL v9 = [(BRCAccountSession *)self->super.super._session clientDB];
  [v9 assertOnQueue];
  uint64_t v70 = brc_current_date_nsec();
  id v66 = self;
  if ([(BRCFSSchedulerBase *)self isCancelled]) {
    goto LABEL_43;
  }
  unint64_t v63 = a5;
  uint64_t v64 = v8;
  id v10 = [v8 contextIdentifier];
  uint64_t v68 = v9;
  id v11 = (void *)[v9 fetch:@"  SELECT throttle_id, zone_rowid, transfer_size, transfer_record, next_retry_stamp, transfer_stage     FROM client_uploads    WHERE throttle_state = 1      AND transfer_queue = %@      AND transfer_operation IS NULL ORDER BY upload_priority DESC, upload_request_stamp DESC, transfer_size ASC", v10];

  id v12 = 0;
  uint64_t v13 = 0;
  uint64_t v69 = 0x7FFFFFFFFFFFFFFFLL;
  p_isa = (id *)&v66->super.super.super.isa;
  while ([v11 next] && -[BRCTransferBatchOperation itemsCount](v13, "itemsCount") < a4)
  {
    uint64_t v15 = MEMORY[0x1D9438760]();
    id v16 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", [v11 longLongAtIndex:0]);
    id v17 = [v11 numberAtIndex:1];
    uint64_t v18 = [v11 unsignedIntegerAtIndex:2];
    uint64_t v73 = [v11 unarchivedObjectOfClass:objc_opt_class() atIndex:3];
    uint64_t v19 = [v11 longLongAtIndex:4];
    id v20 = [v11 stringAtIndex:5];
    context = (void *)v15;
    if (v19 > v70)
    {
      id v21 = v13;
      uint64_t v22 = v69;
      if (v69 >= v19) {
        uint64_t v22 = v19;
      }
      uint64_t v69 = v22;
      uint64_t v23 = [(BRCItemDBRowIDJobIdentifier *)v16 matchingJobsWhereSQLClause];
      [v68 execute:@"UPDATE client_uploads    SET transfer_queue = '_retry'  WHERE %@", v23];
      int v24 = 2;
      goto LABEL_32;
    }
    uint64_t v67 = v18;
    uint64_t v23 = [p_isa[1] serverZoneByRowID:v17];
    uint64_t v25 = objc_msgSend(p_isa[1], "itemByRowID:", -[BRCItemDBRowIDJobIdentifier itemDBRowID](v16, "itemDBRowID"));
    if (([v25 isDocument] & 1) == 0)
    {
      id v29 = v12;
      id v21 = v13;
      __int16 v30 = brc_bread_crumbs();
      id v31 = brc_default_log();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v80 = (uint64_t)v25;
        __int16 v81 = 2112;
        id v82 = v30;
        _os_log_fault_impl(&dword_1D353B000, v31, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ should be a document%@", buf, 0x16u);
      }

      int v24 = 2;
      id v12 = v29;
      p_isa = (id *)&v66->super.super.super.isa;
      goto LABEL_31;
    }
    __int16 v65 = v12;
    if ([v25 syncUpState] != 3)
    {
      id v21 = v13;
      __int16 v32 = brc_bread_crumbs();
      uint64_t v33 = brc_default_log();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT))
      {
        *(_DWORD *)buf = 138412546;
        uint64_t v80 = (uint64_t)v25;
        __int16 v81 = 2112;
        id v82 = v32;
        _os_log_fault_impl(&dword_1D353B000, v33, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: %@ should be needs-upload%@", buf, 0x16u);
      }

      [p_isa cancelAndCleanupItemUpload:v25];
      int v24 = 2;
      goto LABEL_21;
    }
    if (![v25 isDocumentBeingCopiedToNewZone]) {
      goto LABEL_23;
    }
    id v26 = [v25 currentVersion];
    char v62 = [v26 contentSignature];
    if ((objc_msgSend(v62, "brc_signatureIsValid") & 1) == 0)
    {

LABEL_23:
      if (!v13)
      {
        uint64_t v37 = [BRCUploadBatchOperation alloc];
        id v38 = p_isa[1];
        uint64_t v39 = [v23 clientZone];
        uint64_t v40 = [(BRCUploadBatchOperation *)v37 initWithSyncContext:v64 sessionContext:v38 clientZone:v39];

        uint64_t v41 = [(_BRCOperation *)v40 operationID];

        v74[0] = MEMORY[0x1E4F143A8];
        v74[1] = 3221225472;
        v74[2] = __98__BRCFSUploader__transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority___block_invoke;
        v74[3] = &unk_1E6998BA8;
        id v75 = v68;
        __int16 v76 = p_isa;
        id v42 = v41;
        unint64_t v36 = v40;
        id v12 = v42;
        id v77 = v42;
        id v78 = v64;
        [(BRCUploadBatchOperation *)v36 setPerUploadCompletionBlock:v74];

        goto LABEL_30;
      }
      uint64_t v34 = v13;
      unint64_t v35 = [(BRCTransferBatchOperation *)v13 itemsCount];
      if (v35 < [p_isa _minBatchSize])
      {
        unint64_t v36 = v34;
LABEL_29:
        id v12 = v65;
LABEL_30:
        id v21 = v36;
        [(BRCUploadBatchOperation *)v36 addItem:v25 stageID:v20 record:v73 transferSize:v67];
        id v43 = [v64 uploadThrottle];
        [p_isa _willAttemptJobID:v16 throttle:v43 operationID:v12];

        [v25 triggerNotificationIfNeeded];
        int v24 = 0;
        goto LABEL_31;
      }
      unint64_t v36 = v34;
      if ([(BRCTransferBatchOperation *)v34 totalSize] + v67 <= v63) {
        goto LABEL_29;
      }
      id v21 = v34;
      int v24 = 3;
LABEL_21:
      id v12 = v65;
      goto LABEL_31;
    }
    id v61 = v26;
    id v21 = v13;
    id v27 = p_isa[1];
    id v60 = [v25 currentVersion];
    id v59 = [v60 previousItemGlobalID];
    id v57 = [v59 zoneRowID];
    long long v55 = [v27 serverZoneByRowID:v57];
    uint64_t v54 = [v55 clientZone];
    int v58 = [v54 enhancedDrivePrivacyEnabled];
    __int16 v28 = [v25 clientZone];
    int v56 = [v28 enhancedDrivePrivacyEnabled];

    uint64_t v13 = v21;
    if (v58 != v56) {
      goto LABEL_23;
    }
    [p_isa _performServerSideAssetCopyForItem:v25 transferSize:v67];
    int v24 = 2;
LABEL_31:

LABEL_32:
    BOOL v44 = v24 == 3;
    uint64_t v13 = v21;
    if (v44) {
      break;
    }
  }
  if (v69 != 0x7FFFFFFFFFFFFFFFLL) {
    objc_msgSend(p_isa[10], "signalWithDeadline:");
  }
  if (v13)
  {
    uint64_t v45 = objc_msgSend(MEMORY[0x1E4F1A218], "br_upload");
    [(_BRCOperation *)v13 setGroup:v45];

    id v46 = brc_bread_crumbs();
    id v47 = brc_default_log();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v48 = [(BRCTransferBatchOperation *)v13 itemsCount];
      uint64_t v49 = [v64 contextIdentifier];
      *(_DWORD *)buf = 134218498;
      uint64_t v80 = v48;
      __int16 v81 = 2112;
      id v82 = v49;
      __int16 v83 = 2112;
      id v84 = v46;
      _os_log_impl(&dword_1D353B000, v47, OS_LOG_TYPE_DEFAULT, "[NOTICE] uploading %ld documents in %@%@", buf, 0x20u);
    }
    id v50 = [v64 uploadStream];
    [v50 addBatchOperation:v13];
  }
  id v8 = v64;
  id v51 = [v64 contextIdentifier];
  char v52 = (void *)[v68 numberWithSQL:@"SELECT MIN(next_retry_stamp) FROM client_uploads   WHERE throttle_state = 1     AND transfer_queue = %@      AND transfer_operation IS NULL ", v51];

  if (v52)
  {
    id v53 = [v64 uploadStream];
    objc_msgSend(v53, "signalWithDeadline:", objc_msgSend(v52, "longLongValue"));
  }
  BOOL v9 = v68;
LABEL_43:
}

void __98__BRCFSUploader__transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __98__BRCFSUploader__transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority___block_invoke_2;
  v12[3] = &unk_1E6998B80;
  id v8 = *(void **)(a1 + 32);
  uint64_t v7 = *(void *)(a1 + 40);
  BOOL v9 = *(void **)(a1 + 48);
  id v13 = v5;
  uint64_t v14 = v7;
  id v15 = v9;
  id v16 = *(id *)(a1 + 56);
  id v17 = v6;
  id v10 = v6;
  id v11 = v5;
  [v8 groupInBatch:v12];
}

void __98__BRCFSUploader__transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority___block_invoke_2(uint64_t a1)
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  uint64_t v2 = [*(id *)(a1 + 32) transferID];
  id v3 = -[BRCItemDBRowIDJobIdentifier initWithItemDBRowID:]([BRCItemDBRowIDJobIdentifier alloc], "initWithItemDBRowID:", [v2 unsignedLongLongValue]);

  uint64_t v4 = [*(id *)(a1 + 40) _documentItemForJobID:v3 operationID:*(void *)(a1 + 48)];
  if (v4)
  {
    id v5 = *(void **)(a1 + 40);
    id v6 = [*(id *)(a1 + 32) record];
    uint64_t v7 = [*(id *)(a1 + 32) stageID];
    [v5 _finishedUploadingItem:v4 record:v6 jobID:v3 stageID:v7 syncContext:*(void *)(a1 + 56) hasPerformedServerSideAssetCopy:0 error:*(void *)(a1 + 64)];
  }
  else
  {
    id v8 = brc_bread_crumbs();
    BOOL v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      id v10 = [*(id *)(a1 + 48) UUIDString];
      *(_DWORD *)buf = 138412802;
      id v12 = v3;
      __int16 v13 = 2112;
      uint64_t v14 = v10;
      __int16 v15 = 2112;
      id v16 = v8;
      _os_log_debug_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader[%@]: throttle for %@ doesn't exist anymore%@", buf, 0x20u);
    }
  }
}

- (void)transferStreamOfSyncContext:(id)a3 didBecomeReadyWithMaxRecordsCount:(unint64_t)a4 sizeHint:(unint64_t)a5 priority:(int64_t)a6 completionBlock:(id)a7
{
  id v12 = a3;
  id v13 = a7;
  uint64_t v14 = [(BRCAccountSession *)self->super.super._session clientDB];
  __int16 v15 = [v14 serialQueue];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = __113__BRCFSUploader_transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority_completionBlock___block_invoke;
  v18[3] = &unk_1E69962E0;
  void v18[4] = self;
  id v19 = v12;
  unint64_t v22 = a5;
  int64_t v23 = a6;
  id v20 = v13;
  unint64_t v21 = a4;
  id v16 = v13;
  id v17 = v12;
  dispatch_async_with_logs_11(v15, v18);
}

uint64_t __113__BRCFSUploader_transferStreamOfSyncContext_didBecomeReadyWithMaxRecordsCount_sizeHint_priority_completionBlock___block_invoke(uint64_t a1)
{
  [*(id *)(a1 + 32) _transferStreamOfSyncContext:*(void *)(a1 + 40) didBecomeReadyWithMaxRecordsCount:*(void *)(a1 + 56) sizeHint:*(void *)(a1 + 64) priority:*(void *)(a1 + 72)];
  uint64_t v2 = *(uint64_t (**)(void))(*(void *)(a1 + 48) + 16);
  return v2();
}

- (void)finishedSyncingUpItem:(id)a3 withOutOfQuotaError:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 dbRowID];
  memset(v17, 0, sizeof(v17));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader finishedSyncingUpItem:withOutOfQuotaError:]", 1898, v17);
  BOOL v9 = brc_bread_crumbs();
  id v10 = brc_default_log();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v13 = v17[0];
    uint64_t v14 = [v6 digestDescription];
    *(_DWORD *)buf = 134219010;
    uint64_t v19 = v13;
    __int16 v20 = 2048;
    uint64_t v21 = v8;
    __int16 v22 = 2112;
    int64_t v23 = v14;
    __int16 v24 = 2112;
    id v25 = v7;
    __int16 v26 = 2112;
    id v27 = v9;
    _os_log_debug_impl(&dword_1D353B000, v10, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx Uploader[%lld]: %@ failed to sync up because it's out of quota: %@%@", buf, 0x34u);
  }
  [v6 markOverQuotaWithError:v7];
  [v6 saveToDB];
  [(BRCFSUploader *)self setState:32 forItem:v6];
  id v11 = [(BRCAccountSession *)self->super.super._session clientDB];
  BOOL v12 = [v11 changes] == 1;

  if (!v12)
  {
    __int16 v15 = brc_bread_crumbs();
    id v16 = brc_default_log();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_FAULT)) {
      -[BRCFSUploader finishedSyncingUpItem:withOutOfQuotaError:]();
    }
  }
  __brc_leave_section(v17);
}

- (BOOL)hasItemsOverQuotaForOwner:(id)a3
{
  id v4 = a3;
  uint64_t v14 = 0;
  __int16 v15 = &v14;
  uint64_t v16 = 0x3032000000;
  id v17 = __Block_byref_object_copy__36;
  uint64_t v18 = __Block_byref_object_dispose__36;
  id v19 = 0;
  id v5 = [(BRCAccountSession *)self->super.super._session clientDB];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = __43__BRCFSUploader_hasItemsOverQuotaForOwner___block_invoke;
  v10[3] = &unk_1E69936C0;
  uint64_t v13 = &v14;
  id v6 = v5;
  id v11 = v6;
  id v7 = v4;
  id v12 = v7;
  [v6 disableProfilingForQueriesInBlock:v10];
  char v8 = [(id)v15[5] BOOLValue];

  _Block_object_dispose(&v14, 8);
  return v8;
}

void __43__BRCFSUploader_hasItemsOverQuotaForOwner___block_invoke(uint64_t a1)
{
  uint64_t v2 = [*(id *)(a1 + 32) numberWithSQL:@"SELECT 1 FROM client_uploads  WHERE throttle_state = 32    AND zone_rowid IN (SELECT rowid FROM client_zones WHERE zone_owner = %@ AND zone_plist IS NOT NULL)  LIMIT 1", *(void *)(a1 + 40)];
  uint64_t v3 = *(void *)(*(void *)(a1 + 48) + 8);
  id v4 = *(void **)(v3 + 40);
  *(void *)(v3 + 40) = v2;
}

- (BOOL)hasItemsOverQuotaInZone:(id)a3
{
  session = self->super.super._session;
  id v4 = a3;
  id v5 = [(BRCAccountSession *)session clientDB];
  id v6 = [v4 dbRowID];

  id v7 = (void *)[v5 numberWithSQL:@"SELECT 1 FROM client_uploads WHERE throttle_state = 32 AND zone_rowid = %@ LIMIT 1", v6];
  LOBYTE(v5) = [v7 BOOLValue];

  return (char)v5;
}

- (id)quotaAvailableForOwner:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F19C08]])
  {
    id v4 = [(BRCAccountSession *)self->super.super._session clientState];
    id v5 = [v4 objectForKeyedSubscript:@"availableQuota"];
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)_rescheduleJobsOutOfQuotaForDefaultOwnerWithAvailableSize:(int64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  memset(v18, 0, sizeof(v18));
  __brc_create_section(0, (uint64_t)"-[BRCFSUploader _rescheduleJobsOutOfQuotaForDefaultOwnerWithAvailableSize:]", 1947, v18);
  id v5 = brc_bread_crumbs();
  id v6 = brc_default_log();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
  {
    uint64_t v16 = v18[0];
    id v17 = +[BRCDumpContext stringFromByteCount:a3 context:0];
    *(_DWORD *)buf = 134218498;
    uint64_t v20 = v16;
    __int16 v21 = 2112;
    __int16 v22 = v17;
    __int16 v23 = 2112;
    __int16 v24 = v5;
    _os_log_debug_impl(&dword_1D353B000, v6, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx re-uploading failed items with size less than %@%@", buf, 0x20u);
  }
  id v7 = self->super.super._session;
  [(BRCAccountSession *)v7 enumerateClientZones:&__block_literal_global_221];
  char v8 = [(BRCAccountSession *)v7 clientDB];
  BOOL v9 = (void *)[v8 fetch:@"SELECT throttle_id, transfer_size   FROM client_uploads  WHERE throttle_state = 32    AND transfer_size < %lld", a3];
  for (char i = 0; ; char i = 1)
  {
    uint64_t v11 = [v9 next];
    int v12 = a3 > 0 ? v11 : 0;
    if (v12 != 1) {
      break;
    }
    uint64_t v13 = (void *)MEMORY[0x1D9438760](v11);
    uint64_t v14 = [v9 longLongAtIndex:0];
    uint64_t v15 = [v9 longLongAtIndex:1];
    objc_msgSend(v8, "execute:", @"UPDATE client_items SET version_upload_error = NULL WHERE rowid = %lld", v14);
    [v8 execute:@"UPDATE client_uploads SET throttle_state = 1, upload_error = NULL WHERE throttle_id = %lld", v14];
    a3 -= v15;
  }
  [v9 close];
  if (i) {
    [(BRCFSSchedulerBase *)self signal];
  }
  [(BRCFSUploader *)self setIsDefaultOwnerOutOfQuota:[(BRCFSUploader *)self hasItemsOverQuotaForOwner:*MEMORY[0x1E4F19C08]]];

  __brc_leave_section(v18);
}

uint64_t __75__BRCFSUploader__rescheduleJobsOutOfQuotaForDefaultOwnerWithAvailableSize___block_invoke(uint64_t a1, void *a2)
{
  return 1;
}

- (void)setQuotaAvailableForDefaultOwner:(unint64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  p_session = &self->super.super._session;
  id v6 = [(BRCAccountSession *)self->super.super._session clientDB];
  [v6 assertOnQueue];

  id v7 = [(BRCFSUploader *)self quotaAvailableForOwner:*MEMORY[0x1E4F19C08]];
  unint64_t v8 = [v7 unsignedLongLongValue];

  BOOL v9 = [MEMORY[0x1E4F1C9C8] date];
  id v10 = [(BRCAccountSession *)*p_session clientState];
  [v10 setObject:v9 forKeyedSubscript:@"lastQuotaFetchDate"];

  if (v8 != a3)
  {
    memset(v18, 0, sizeof(v18));
    __brc_create_section(0, (uint64_t)"-[BRCFSUploader setQuotaAvailableForDefaultOwner:]", 2000, v18);
    uint64_t v11 = brc_bread_crumbs();
    int v12 = brc_default_log();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v15 = v18[0];
      id v16 = +[BRCDumpContext stringFromByteCount:v8 context:0];
      id v17 = +[BRCDumpContext stringFromByteCount:a3 context:0];
      *(_DWORD *)buf = 134218754;
      uint64_t v20 = v15;
      __int16 v21 = 2112;
      id v22 = v16;
      __int16 v23 = 2112;
      __int16 v24 = v17;
      __int16 v25 = 2112;
      __int16 v26 = v11;
      _os_log_debug_impl(&dword_1D353B000, v12, OS_LOG_TYPE_DEBUG, "[DEBUG] ┏%llx quota changed from %@ to %@%@", buf, 0x2Au);
    }
    uint64_t v13 = [NSNumber numberWithUnsignedLongLong:a3];
    uint64_t v14 = [(BRCAccountSession *)self->super.super._session clientState];
    [v14 setObject:v13 forKeyedSubscript:@"availableQuota"];

    if (v8 < a3) {
      [(BRCFSUploader *)self _rescheduleJobsOutOfQuotaForDefaultOwnerWithAvailableSize:a3];
    }
    __brc_leave_section(v18);
  }
}

- (void)_globalQuotaStateUpdateForDefaultOwner
{
  uint64_t v3 = [(BRCAccountSession *)self->super.super._session clientDB];
  [v3 assertOnQueue];

  if ([(BRCFSUploader *)self isDefaultOwnerOutOfQuota])
  {
    BOOL v4 = [(BRCFSUploader *)self hasItemsOverQuotaForOwner:*MEMORY[0x1E4F19C08]];
    [(BRCFSUploader *)self setIsDefaultOwnerOutOfQuota:v4];
  }
}

- (void)_scheduleQuotaFetchForDefaultOwner
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1A0F8]);
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1A218], "br_quotaUpdateUploader");
  [v3 setGroup:v4];

  br_pacer_suspend();
  id v5 = [(BRCAccountSession *)self->super.super._session clientDB];
  id v6 = [v5 serialQueue];
  [v3 setCallbackQueue:v6];

  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke;
  v12[3] = &unk_1E6998BD0;
  void v12[4] = self;
  [v3 setFetchUserQuotaCompletionBlock:v12];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke_237;
  v11[3] = &unk_1E6993698;
  v11[4] = self;
  [v3 setCompletionBlock:v11];
  id v7 = dispatch_get_global_queue(17, 0);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke_2;
  uint64_t v9[3] = &unk_1E6993628;
  v9[4] = self;
  id v10 = v3;
  id v8 = v3;
  dispatch_async_with_logs_11(v7, v9);
}

void __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke(uint64_t a1, uint64_t a2, void *a3)
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = brc_bread_crumbs();
  id v7 = brc_default_log();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG)) {
    __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke_cold_1((uint64_t)v6, a2, v7);
  }

  if (v5)
  {
    id v8 = brc_bread_crumbs();
    BOOL v9 = brc_default_log();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      int v10 = 138412546;
      id v11 = v5;
      __int16 v12 = 2112;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1D353B000, v9, OS_LOG_TYPE_DEFAULT, "[WARNING] can't update quota: %@%@", (uint8_t *)&v10, 0x16u);
    }

    br_pacer_signal();
  }
  else
  {
    [*(id *)(a1 + 32) setQuotaAvailableForDefaultOwner:a2];
  }
}

uint64_t __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke_237()
{
  return br_pacer_resume();
}

void __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke_2(uint64_t a1)
{
  id v3 = [*(id *)(*(void *)(a1 + 32) + 8) syncContextProvider];
  uint64_t v2 = [v3 defaultSyncContext];
  [v2 addOperation:*(void *)(a1 + 40)];
}

- (void)setIsDefaultOwnerOutOfQuota:(BOOL)a3
{
}

- (void)setIsDefaultOwnerOutOfQuota:(BOOL)a3 forceSignalContainers:(BOOL)a4
{
  if (self->_isDefaultOwnerOutOfQuota == a3)
  {
    if (!a4 || a3) {
      return;
    }
    goto LABEL_9;
  }
  self->_isDefaultOwnerOutOfQuota = a3;
  if (!a3)
  {
LABEL_9:
    id v4 = [(BRCAccountSession *)self->super.super._session globalProgress];
    [v4 clearOutOfQuotaState];

    return;
  }
  br_pacer_signal();
}

- (void)ownerDidReceiveOutOfQuotaError:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F19C08]])
  {
    [(BRCFSUploader *)self setIsDefaultOwnerOutOfQuota:1];
  }
}

- (void)scheduleQuotaStateUpdateForOwner:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F19C08]]
    && [(BRCFSUploader *)self isDefaultOwnerOutOfQuota])
  {
    br_pacer_signal();
  }
}

- (void)scheduleQuotaFetchIfNeededForOwner:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F19C08]]
    && [(BRCFSUploader *)self isDefaultOwnerOutOfQuota])
  {
    br_pacer_signal();
  }
}

- (void)forceScheduleQuotaFetchForOwner:(id)a3
{
  if ([a3 isEqualToString:*MEMORY[0x1E4F19C08]])
  {
    br_pacer_signal();
  }
}

- (void)_reportUploadErrorForDocument:(id)a3 error:(id)a4
{
}

- (void)_reportUploadErrorForDocument:(id)a3 error:(id)a4 underlyingError:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  objc_msgSend(v9, "brc_telemetryReportableErrorWithRecordName:", 0);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  id v11 = [(BRCAccountSession *)self->super.super._session clientDB];
  uint64_t v12 = [v10 dbRowID];

  uint64_t v13 = [v20 domain];
  uint64_t v14 = [v20 code];
  uint64_t v15 = objc_msgSend(v20, "brc_cloudKitErrorMessage");
  uint64_t v16 = [v8 domain];
  id v17 = (void *)v16;
  if (v16) {
    uint64_t v18 = (__CFString *)v16;
  }
  else {
    uint64_t v18 = &stru_1F2AC7720;
  }
  [v11 execute:@"INSERT OR REPLACE INTO item_errors (item_rowid, error_domain, error_code, error_message, underlying_error_domain, underlying_error_code, service) VALUES (%llu, %@, %ld, %@, %@, %ld, %d)", v12, v13, v14, v15, v18, objc_msgSend(v8, "code"), 1];

  id v19 = +[BRCAutoBugCaptureReporter sharedABCReporter];
  [v19 captureLogsForOperationType:@"SyncHealth" ofSubtype:@"Upload" forError:v9 underlyingError:v8];
}

- (void)_clearUploadErrorForDocument:(id)a3
{
  session = self->super.super._session;
  id v4 = a3;
  id v6 = [(BRCAccountSession *)session clientDB];
  uint64_t v5 = [v4 dbRowID];

  objc_msgSend(v6, "execute:", @"DELETE FROM item_errors WHERE item_rowid = %llu AND service = %d", v5, 1);
}

- (unint64_t)recoverAndReportMissingJobs
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v3 = [(BRCAccountSession *)self->super.super._session clientDB];
  id v4 = (void *)[v3 fetch:@"SELECT ci.rowid, ci.zone_rowid, ci.item_id, ci.item_creator_id, ci.item_sharing_options, ci.item_side_car_ckinfo, ci.item_parent_zone_rowid, ci.item_localsyncupstate, ci.item_local_diffs, ci.item_notifs_rank, ci.app_library_rowid, ci.item_min_supported_os_rowid, ci.item_user_visible, ci.item_stat_ckinfo, ci.item_state, ci.item_type, ci.item_mode, ci.item_birthtime, ci.item_lastusedtime, ci.item_favoriterank,ci.item_parent_id, ci.item_filename, ci.item_hidden_ext, ci.item_finder_tags, ci.item_xattr_signature, ci.item_trash_put_back_path, ci.item_trash_put_back_parent_id, ci.item_alias_target, ci.item_creator, ci.item_doc_id, ci.item_file_id, ci.item_generation, ci.item_localname, ci.item_processing_stamp, ci.item_staged_file_id, ci.item_staged_generation, ci.item_bouncedname, ci.item_scope, ci.item_tmpbounceno, ci.version_name, ci.version_ckinfo, ci.version_mtime, ci.version_size, ci.version_thumb_size, ci.version_thumb_signature, ci.version_content_signature, ci.version_xattr_signature, ci.version_edited_since_shared, ci.version_device, ci.version_conflict_loser_etags, ci.version_quarantine_info, ci.version_uploaded_assets, ci.version_upload_error, ci.version_old_zone_item_id, ci.version_old_zone_rowid, ci.desired_version, ci.item_live_conflict_loser_etags, ci.item_thumb_live_signature, ci.item_thumb_greedy, ci.version_block_sync_until_bundle_id, ci.version_block_sync_until_timestamp FROM client_items AS ci WHERE ci.item_localsyncupstate = 3 AND ci.item_localsyncupstate != 0 AND NOT EXISTS (SELECT 1 FROM client_uploads AS up WHERE ci.rowid = up.throttle_id AND up.throttle_state != 0)"];

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = __44__BRCFSUploader_recoverAndReportMissingJobs__block_invoke;
  v35[3] = &unk_1E6994120;
  void v35[4] = self;
  uint64_t v5 = [v4 enumerateObjects:v35];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v36 objects:v44 count:16];
  uint64_t v7 = v6;
  if (v6)
  {
    uint64_t v33 = v4;
    LODWORD(v8) = 0;
    uint64_t v9 = *(void *)v37;
    uint64_t v32 = v6;
    do
    {
      int v34 = v8;
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v37 != v9) {
          objc_enumerationMutation(v5);
        }
        id v11 = *(void **)(*((void *)&v36 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x1D9438760]();
        if ([v11 isDocument])
        {
          uint64_t v13 = [v11 asDocument];
          [(BRCFSUploader *)self uploadItem:v13];
        }
        else
        {
          uint64_t v14 = brc_bread_crumbs();
          uint64_t v15 = brc_default_log();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_FAULT))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v41 = v11;
            __int16 v42 = 2112;
            id v43 = v14;
            _os_log_fault_impl(&dword_1D353B000, v15, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Item scheduled to upload isn't a document %@%@", buf, 0x16u);
          }

          [v11 markNeedsUploadOrSyncingUp];
          [v11 saveToDB];
        }
        ++v10;
      }
      while (v7 != v10);
      uint64_t v8 = (v34 + v7);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v36 objects:v44 count:16];
    }
    while (v7);

    uint64_t v16 = brc_bread_crumbs();
    id v17 = brc_default_log();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSUploader recoverAndReportMissingJobs]();
    }

    id v4 = v33;
    uint64_t v7 = v32;
  }
  else
  {

    uint64_t v8 = 0;
  }
  uint64_t v18 = [(BRCAccountSession *)self->super.super._session clientDB];
  [v18 execute:@"UPDATE client_uploads SET throttle_state = 1 WHERE throttle_state = 31 AND transfer_operation IS NULL  AND throttle_id NOT IN (SELECT throttle_id FROM client_sync_up WHERE throttle_state != 0)"];

  id v19 = [(BRCAccountSession *)self->super.super._session clientDB];
  uint64_t v20 = [v19 changes];

  if (v20)
  {
    __int16 v21 = brc_bread_crumbs();
    id v22 = brc_default_log();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG)) {
      -[BRCFSUploader recoverAndReportMissingJobs]();
    }
  }
  __int16 v23 = +[BRCAccountHandler currentiCloudAccount];
  char v24 = objc_msgSend(v23, "br_needsToVerifyTerms");

  if (v24)
  {
    uint64_t v25 = 0;
  }
  else
  {
    uint64_t v25 = [(BRCFSUploader *)self _rescheduleJobsPendingVerifyTerms];
    if (v25 >= 1)
    {
      __int16 v26 = brc_bread_crumbs();
      uint64_t v27 = brc_default_log();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG)) {
        -[BRCFSUploader recoverAndReportMissingJobs]();
      }
    }
  }
  unint64_t v28 = v20 + (int)v8 + v25;
  if (v28) {
    [(BRCFSUploader *)self schedule];
  }
  if (v7)
  {
    id v29 = +[AppTelemetryTimeSeriesEvent newMissingUploaderJobEventWithNumberMissing:v8];
    __int16 v30 = [(BRCAccountSession *)self->super.super._session analyticsReporter];
    [v30 postReportForDefaultSubCategoryWithCategory:8 telemetryTimeEvent:v29];
  }
  return v28;
}

id __44__BRCFSUploader_recoverAndReportMissingJobs__block_invoke(uint64_t a1, void *a2, uint64_t a3)
{
  id v4 = *(void **)(*(void *)(a1 + 32) + 8);
  id v5 = a2;
  uint64_t v6 = [v4 clientDB];
  uint64_t v7 = (void *)[v4 newLocalItemFromPQLResultSet:v5 db:v6 error:a3];

  return v7;
}

- (void)screenLockChanged:(BOOL)a3
{
  self->_isScreenLocked = a3;
  if (!a3)
  {
    id v4 = [(BRCAccountSession *)self->super.super._session clientTruthWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __35__BRCFSUploader_screenLockChanged___block_invoke;
    block[3] = &unk_1E6993698;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

void __35__BRCFSUploader_screenLockChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (!*(unsigned char *)(v1 + 105))
  {
    uint64_t v2 = [*(id *)(v1 + 8) personaIdentifier];
    BRPerformWithPersonaAndError();
  }
}

void __35__BRCFSUploader_screenLockChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __35__BRCFSUploader_screenLockChanged___block_invoke_2_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _rescheduleJobsPendingScreenUnlock];
  }
}

- (void)networkReachabilityChanged:(BOOL)a3
{
  self->_isNetworkReachable = a3;
  if (a3)
  {
    id v4 = [(BRCAccountSession *)self->super.super._session clientTruthWorkloop];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __44__BRCFSUploader_networkReachabilityChanged___block_invoke;
    block[3] = &unk_1E6993698;
    void block[4] = self;
    dispatch_async(v4, block);
  }
}

void __44__BRCFSUploader_networkReachabilityChanged___block_invoke(uint64_t a1)
{
  uint64_t v1 = *(void *)(a1 + 32);
  if (*(unsigned char *)(v1 + 106))
  {
    uint64_t v2 = [*(id *)(v1 + 8) personaIdentifier];
    BRPerformWithPersonaAndError();
  }
}

void __44__BRCFSUploader_networkReachabilityChanged___block_invoke_2(uint64_t a1, void *a2)
{
  id v3 = a2;
  if (v3)
  {
    id v4 = brc_bread_crumbs();
    id v5 = brc_default_log();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_FAULT)) {
      __35__BRCFSUploader_screenLockChanged___block_invoke_2_cold_1();
    }
  }
  else
  {
    [*(id *)(a1 + 32) _rescheduleJobsPendingNetwork];
  }
}

- (void)userVerifiedTerms
{
  id v3 = [(BRCAccountSession *)self->super.super._session clientTruthWorkloop];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = __34__BRCFSUploader_userVerifiedTerms__block_invoke;
  block[3] = &unk_1E6993698;
  void block[4] = self;
  dispatch_async(v3, block);
}

uint64_t __34__BRCFSUploader_userVerifiedTerms__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) _rescheduleJobsPendingVerifyTerms];
}

- (BOOL)isDefaultOwnerOutOfQuota
{
  return self->_isDefaultOwnerOutOfQuota;
}

- (BRCDeadlineScheduler)uploadsDeadlineScheduler
{
  return self->_uploadsDeadlineScheduler;
}

- (BRCThumbnailGenerationManager)thumbnailGenerationManager
{
  return self->_thumbnailGenerationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_thumbnailGenerationManager, 0);
  objc_storeStrong((id *)&self->_uploadsDeadlineScheduler, 0);
  objc_storeStrong((id *)&self->_thumbnailTracker, 0);
  objc_storeStrong((id *)&self->_globalQuotaStateUpdatePacer, 0);
  objc_storeStrong((id *)&self->_quotaPacer, 0);
  objc_storeStrong((id *)&self->_retryQueueSource, 0);
  objc_storeStrong((id *)&self->_fairScheduler, 0);
}

void __40__BRCFSUploader_initWithAccountSession___block_invoke_6_cold_1()
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┏%llx Uploader: scheduling retries%@", (void)v3, DWORD2(v3));
}

- (void)_rescheduleUploadJobsPendingState:.cold.1()
{
  OUTLINED_FUNCTION_5_2();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Uploader: scheduling %lld suspended throttles%@");
}

- (void)_rescheduleUploadJobsPendingState:.cold.2()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8_1();
  _os_log_fault_impl(&dword_1D353B000, v0, OS_LOG_TYPE_FAULT, "[CRIT] UNREACHABLE: Method don't support state: %d%@", v1, 0x12u);
}

- (void)_rescheduleJobsPendingVerifyTerms
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┏%llx User verified terms - re-uploading failed items for user need to verify terms%@", (void)v3, DWORD2(v3));
}

- (void)_rescheduleJobsPendingNetwork
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┏%llx Network available - re-uploading failed items for no network%@", (void)v3, DWORD2(v3));
}

- (void)_rescheduleJobsPendingScreenUnlock
{
  OUTLINED_FUNCTION_9(*MEMORY[0x1E4F143B8]);
  LODWORD(v3) = 134218242;
  *(void *)((char *)&v3 + 4) = v0;
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] ┏%llx Screen is unlocked - re-uploading failed items for data protection class%@", (void)v3, DWORD2(v3));
}

- (void)uploadItem:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: !item.isPausedFromSync && !item.isResumingSync%@", v2, v3, v4, v5, v6);
}

- (void)performFirstSchedulingAfterStartupInDB:(NSObject *)a3 .cold.1(void *a1, uint64_t a2, NSObject *a3)
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  int v5 = 134218242;
  uint64_t v6 = [a1 changes];
  __int16 v7 = 2112;
  uint64_t v8 = a2;
  _os_log_debug_impl(&dword_1D353B000, a3, OS_LOG_TYPE_DEBUG, "[DEBUG] Rescheduled %lld in-flight transfers because we have restarted%@", (uint8_t *)&v5, 0x16u);
}

void __25__BRCFSUploader_schedule__block_invoke_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: upload scheduler is exact we should have an item%@", v2, v3, v4, v5, v6);
}

void __25__BRCFSUploader_schedule__block_invoke_cold_2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: no app library for row ID %@%@");
}

- (void)_updatePackageRecord:item:stageID:error:.cold.1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to create package: %@%@", v1, 0x16u);
}

- (void)_updatePackageRecord:(void *)a1 item:stageID:error:.cold.2(void *a1)
{
  [a1 dbRowID];
  uint64_t v2 = [a1 itemID];
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_11_0(&dword_1D353B000, v3, v4, "[DEBUG] Uploader[%lld]: generating manifest for %@%@", v5, v6, v7, v8, v9);
}

void __57__BRCFSUploader__updatePackageRecord_item_stageID_error___block_invoke_cold_1()
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_3_0();
  _os_log_error_impl(&dword_1D353B000, v0, (os_log_type_t)0x90u, "[ERROR] Failed to add item to package%@", v1, 0xCu);
}

- (void)_updateRecord:item:syncContext:targetThumbnailURL:stageID:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: can't upload an item without a fileID%@", v2, v3, v4, v5, v6);
}

- (void)_updateRecord:item:syncContext:targetThumbnailURL:stageID:.cold.2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: can't upload a fault%@", v2, v3, v4, v5, v6);
}

- (void)_updateRecord:item:syncContext:targetThumbnailURL:stageID:.cold.3()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Couldn't find xattr for signature %@%@");
}

- (void)_updateRecord:item:syncContext:targetThumbnailURL:stageID:.cold.4()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] generated thumbnail: %@%@");
}

- (void)_handleFileModifiedError:forItem:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Handling file modified error: %@%@");
}

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: ![item isReadAndUploaded]%@", v2, v3, v4, v5, v6);
}

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.2()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Uploader[%@]: increasing throttle back off%@");
}

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.3()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] The error is for an unknown item, check if the zone hasn't been wiped%@", v2, v3, v4, v5, v6);
}

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.4()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Suspending for no network%@", v2, v3, v4, v5, v6);
}

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.5()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Suspending for user need to verify terms%@", v2, v3, v4, v5, v6);
}

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.6()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] Error is retriable, putting item back in the queue%@", v2, v3, v4, v5, v6);
}

- (void)_finishedUploadingItem:record:jobID:stageID:syncContext:hasPerformedServerSideAssetCopy:error:.cold.7()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: error%@", v2, v3, v4, v5, v6);
}

- (void)_performServerSideAssetCopyForItem:transferSize:.cold.1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] Uploader[%@] Fetching package signature to perform server side asset copy%@");
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] creating manifestAssetReference failed%@", v2, v3, v4, v5, v6);
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_2()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] creating kBRRecordKeyPackageManifest CKAsset failed%@", v2, v3, v4, v5, v6);
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_3(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 56);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: Can't server-side asset copy an item with an invalid xattr signature %@%@", (void)v3, DWORD2(v3));
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_4(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 56);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: Can't server-side asset copy an invalid thumbanil signature for %@%@", (void)v3, DWORD2(v3));
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_5()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] clonedPackageWithRecordID for kBRRecordKeyPackageContent failed with error %@%@");
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_6()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v0, v1, "[DEBUG] clonedPackageWithRecordID for kBRRecordKeyPackageXattrs failed with error %@%@");
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_7(uint64_t a1)
{
  os_log_t v1 = [NSNumber numberWithBool:*(unsigned __int8 *)(a1 + 104)];
  OUTLINED_FUNCTION_8_5();
  OUTLINED_FUNCTION_11_0(&dword_1D353B000, v2, v3, "[DEBUG] duplicate pkg content. pkgManifest signature [%@] pkgHasXattrs [%@]%@", v4, v5, v6, v7, v8);
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_8()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] creating kBRRecordKeyFileContent CKAsset failed%@", v2, v3, v4, v5, v6);
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_9()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] creating contentAssetReference failed%@", v2, v3, v4, v5, v6);
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_10()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2_0(&dword_1D353B000, v0, v1, "[DEBUG] duplicate document content%@", v2, v3, v4, v5, v6);
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_11(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 56);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v1, v2, "[CRIT] UNREACHABLE: Can't server-side asset copy an item with an invalid signature %@%@", (void)v3, DWORD2(v3));
}

void __65__BRCFSUploader__performServerSideAssetCopyForItem_transferSize___block_invoke_2_cold_12(uint64_t a1)
{
  LODWORD(v3) = 138412546;
  *(void *)((char *)&v3 + 4) = *(void *)(a1 + 32);
  OUTLINED_FUNCTION_3_1();
  OUTLINED_FUNCTION_1(&dword_1D353B000, v1, v2, "[DEBUG] Uploader[%@]: performing server-side asset copy%@", (void)v3, DWORD2(v3));
}

- (void)finishedSyncingUpItem:withOutOfQuotaError:.cold.1()
{
  OUTLINED_FUNCTION_3_0();
  OUTLINED_FUNCTION_2(&dword_1D353B000, v0, v1, "[CRIT] Assertion failed: _session.clientDB.changes == 1%@", v2, v3, v4, v5, v6);
}

void __51__BRCFSUploader__scheduleQuotaFetchForDefaultOwner__block_invoke_cold_1(uint64_t a1, uint64_t a2, os_log_t log)
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F19C08];
  int v4 = 138412802;
  uint64_t v5 = v3;
  __int16 v6 = 2048;
  uint64_t v7 = a2;
  __int16 v8 = 2112;
  uint64_t v9 = a1;
  _os_log_debug_impl(&dword_1D353B000, log, OS_LOG_TYPE_DEBUG, "[DEBUG] updated %@ quota: %lld%@", (uint8_t *)&v4, 0x20u);
}

- (void)recoverAndReportMissingJobs
{
  uint64_t v2 = *MEMORY[0x1E4F143B8];
  OUTLINED_FUNCTION_8_1();
  _os_log_debug_impl(&dword_1D353B000, v0, OS_LOG_TYPE_DEBUG, "[DEBUG] Uploader: Recovered from %u missing uploader jobs%@", v1, 0x12u);
}

void __35__BRCFSUploader_screenLockChanged___block_invoke_2_cold_1()
{
  OUTLINED_FUNCTION_0();
  OUTLINED_FUNCTION_1_1(&dword_1D353B000, v0, v1, "[CRIT] UNREACHABLE: Failed to adopt persona with error %@%@");
}

@end