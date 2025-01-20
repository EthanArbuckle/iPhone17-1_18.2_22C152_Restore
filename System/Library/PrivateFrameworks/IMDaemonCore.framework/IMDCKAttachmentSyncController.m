@interface IMDCKAttachmentSyncController
+ (id)sharedInstance;
- (BOOL)__shouldOptimizeAttachmentDefault;
- (BOOL)_attachmentDownloadCanStart:(BOOL)a3 withActivity:(id)a4;
- (BOOL)_attachmentZoneCreated;
- (BOOL)_deviceConditionsAllowsMessageSyncForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4 activity:(id)a5;
- (BOOL)_deviceConditionsAllowsMessageSyncIgnoreFeatureEnabled:(BOOL)a3 activity:(id)a4;
- (BOOL)_deviceConditionsAllowsMessageSyncWithActivity:(id)a3;
- (BOOL)_fetchedAllChangesFromCloudKit;
- (BOOL)_hasCompletedRecoveryResync;
- (BOOL)_kickOffWriteIfNeededForSyncType:(int64_t)a3 activity:(id)a4 completion:(id)a5;
- (BOOL)_shouldMarkAllAttachmentsAsNeedingSync;
- (BOOL)_shouldMarkAttachmentsAsNeedingReupload;
- (BOOL)assetDownloadInProgress;
- (BOOL)isDoingDeleteRecoverySync;
- (IMDCKAttachmentSyncCKOperationFactory)CKOperationFactory;
- (IMDCKAttachmentSyncController)init;
- (IMDCKAttachmentSyncController)initWithSyncTokenStore:(id)a3;
- (IMDRecordZoneManager)recordZoneManager;
- (NSMutableArray)downloadAssetsForTransferGUIDs;
- (NSMutableDictionary)completionBlocksForAssetFetchOperations;
- (NSMutableDictionary)recordIDToTransferMap;
- (OS_dispatch_queue)ckQueue;
- (SyncTokenStoreProviding)syncTokenStore;
- (id)__databaseRequestForAttachmentsWithAssets;
- (id)_attachmentZoneID;
- (id)_attachmentZoneSalt;
- (id)_changeTokenKeyForSyncType:(int64_t)a3;
- (id)_ckUtilitiesInstance;
- (id)_constructAttachmentRecordIDUsingTombStoneDictionary:(id)a3;
- (id)_copyRecordIDsToDeleteWithLimit:(unint64_t)a3;
- (id)_fetchAndPrepareRecordsToWrite:(BOOL *)a3;
- (id)_operationErrorForModifyingRecordCompletion:(id)a3;
- (id)_readNextDeleteAfterRow;
- (id)_recordKeyManagerSharedInstance;
- (id)_recordsToProcessWithError:(id)a3 error:(id)a4;
- (id)_updateAttachmentGUIDIfNeededAndReturnTransfersToForceMarkAsSync:(id)a3 transfersToSyncRowIDs:(id)a4;
- (id)fileTransferCenter;
- (id)latestSyncTokenForSyncType:(int64_t)a3;
- (id)perTransferProgress;
- (id)purgedAttachmentsForChat:(id)a3 services:(id)a4 limit:(int64_t)a5;
- (id)recordStore;
- (int)_resyncForDeleteRecoveryState;
- (int64_t)_numberOfBatchesOfAttachmentsToFetchInInitialSync;
- (int64_t)_numberOfMetadataBatchesOfAttachmentsToFetchInInitialSync;
- (int64_t)syncControllerRecordType;
- (unint64_t)_attachmentDeleteBatchSize;
- (unint64_t)_numberOfAttachmentsToDownload;
- (unint64_t)_numberOfAttachmentsToWriteUp;
- (unint64_t)deviceConditionsToCheck;
- (unint64_t)purgedAttachmentsCountForChatsWithChatIdentifiers:(id)a3 services:(id)a4;
- (void)_deleteAttachmentsWithRecordIDs:(id)a3 completion:(id)a4;
- (void)_downloadAttachmentAssetsWithActivity:(id)a3 restoringAttachments:(BOOL)a4 retryCount:(unint64_t)a5 numAttachmentsDownloaded:(unint64_t)a6 completion:(id)a7;
- (void)_downloadAttachmentAssetsWithActivity:(id)a3 restoringAttachments:(BOOL)a4 retryCount:(unint64_t)a5 numAttachmentsDownloaded:(unint64_t)a6 transfers:(id)a7 completion:(id)a8;
- (void)_fetchAndValidateFileTransfersFromCloudKit:(id)a3 capturedWithABC:(BOOL)a4 activity:(id)a5 completion:(id)a6;
- (void)_fetchAttachmentZoneChangesShouldWriteBackChanges:(BOOL)a3 desiredKeys:(int64_t)a4 syncType:(int64_t)a5 currentBatchCount:(int64_t)a6 maxBatchCount:(int64_t)a7 syncToken:(id)a8 activity:(id)a9 completionBlock:(id)a10;
- (void)_fetchAttachmentZoneRecords:(id)a3 desiredKeys:(int64_t)a4 ognSuffix:(id)a5 removeTombstones:(BOOL)a6 activity:(id)a7 completion:(id)a8;
- (void)_hasMarkedAllAttachmentsAsNeedingSync;
- (void)_initResyncForDeleteRecovery;
- (void)_kickOffAssetFetchForTransfersIfNeededWithActivity:(id)a3;
- (void)_kickOffWriteOnCKQueueWithActivity:(id)a3 completion:(id)a4;
- (void)_markAllFailedAttachmentsAsNeedingSync;
- (void)_markAttachmentWithROWID:(int64_t)a3 withSyncState:(int64_t)a4;
- (void)_markResyncForDeleteRecoveryAs:(int)a3;
- (void)_markTransferAsNotBeingAbleToSync:(id)a3;
- (void)_markTransferAsNotBeingAbleToSyncUsingCKRecord:(id)a3;
- (void)_migrateSyncToken;
- (void)_needsToMarkAllAttachmentsAsNeedingSync;
- (void)_processAndValidateAttachmentRecordsEligibleForPurge:(id)a3 recordIDsToTransfers:(id)a4 capturedWithABC:(BOOL)a5 completion:(id)a6;
- (void)_processAssetFetchOperationCompletionBlock:(id)a3 removeTombstones:(BOOL)a4 operationID:(id)a5 error:(id)a6;
- (void)_processAssetFetchPerRecordCompletionBlock:(id)a3 recordID:(id)a4 error:(id)a5;
- (void)_processAssetFetchPerRecordProgressBlock:(id)a3 progress:(double)a4;
- (void)_processFetchRecordChangesCompleted:(id)a3 completionBlock:(id)a4;
- (void)_processModifyPerRecordCallBack:(id)a3 error:(id)a4;
- (void)_processModifyRecordCompletion:(id)a3 deletedRecordIDs:(id)a4 error:(id)a5 completionBlock:(id)a6;
- (void)_processRecordChanged:(id)a3;
- (void)_processRecordDeletion:(id)a3;
- (void)_processRecordZoneChangeTokenUpdated:(id)a3 zoneID:(id)a4 clienChangeToken:(id)a5 syncType:(int64_t)a6;
- (void)_processRecordZoneFetchCompletion:(id)a3 zoneID:(id)a4 clientChangeTokenData:(id)a5 moreComing:(BOOL)a6 shouldWriteBackChanges:(BOOL)a7 desiredKeys:(int64_t)a8 syncType:(int64_t)a9 error:(id)a10 currentBatchCount:(int64_t)a11 maxBatchCount:(int64_t)a12 activity:(id)a13 completionBlock:(id)a14;
- (void)_removeTransferFromiCloudBackupWithGuid:(id)a3;
- (void)_resetAttachmentSyncStateForRecord:(id)a3 toState:(int64_t)a4;
- (void)_scheduleOperation:(id)a3;
- (void)_setNextDeleteAfterRow:(id)a3;
- (void)_updateDeviceConditionsToCheckIfNeededForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4;
- (void)_updateTransferUsingCKRecord:(id)a3 wasFetched:(BOOL)a4 dispatchToMain:(BOOL)a5;
- (void)_validateTransferFromCloudKit:(id)a3 localTransfer:(id)a4 validateCompletion:(id)a5;
- (void)_writeAttachmentsToCloudKitWithActivity:(id)a3 completionBlock:(id)a4;
- (void)_writeCKRecordsToAttachmentZone:(id)a3 activity:(id)a4 withCompletion:(id)a5;
- (void)acceptFileTransfer:(id)a3 completion:(id)a4;
- (void)acceptFileTransfers:(id)a3 completion:(id)a4;
- (void)clearLocalSyncState:(unint64_t)a3;
- (void)deleteAttachmentSyncToken;
- (void)deleteAttachmentZone;
- (void)deleteChatBotAttachmentSyncToken;
- (void)downloadAttachmentAssetsForChatIDs:(id)a3 services:(id)a4 style:(unsigned __int8)a5 completion:(id)a6;
- (void)downloadAttachmentAssetsWithActivity:(id)a3 restoringAttachments:(BOOL)a4;
- (void)downloadAttachmentAssetsWithActivity:(id)a3 restoringAttachments:(BOOL)a4 completion:(id)a5;
- (void)fetchAttachmentDataForTransfers:(id)a3 highQuality:(BOOL)a4 perTransferProgress:(id)a5 activity:(id)a6 completion:(id)a7;
- (void)setAssetDownloadInProgress:(BOOL)a3;
- (void)setCKOperationFactory:(id)a3;
- (void)setCkQueue:(id)a3;
- (void)setCompletionBlocksForAssetFetchOperations:(id)a3;
- (void)setDeviceConditionsToCheck:(unint64_t)a3;
- (void)setDownloadAssetsForTransferGUIDs:(id)a3;
- (void)setIsDoingDeleteRecoverySync:(BOOL)a3;
- (void)setLatestSyncToken:(id)a3 forSyncType:(int64_t)a4;
- (void)setPerTransferProgress:(id)a3;
- (void)setRecordIDToTransferMap:(id)a3;
- (void)setRecordZoneManager:(id)a3;
- (void)setSyncTokenStore:(id)a3;
- (void)syncAttachmentDeletesToCloudKitWithActivity:(id)a3 completion:(id)a4;
- (void)syncAttachmentsWithSyncType:(int64_t)a3 deviceConditionsToCheck:(unint64_t)a4 activity:(id)a5 completionBlock:(id)a6;
@end

@implementation IMDCKAttachmentSyncController

+ (id)sharedInstance
{
  if (qword_1EBE2B830 != -1) {
    dispatch_once(&qword_1EBE2B830, &unk_1F3390C60);
  }
  v2 = (void *)qword_1EBE2B960;

  return v2;
}

- (IMDCKAttachmentSyncController)initWithSyncTokenStore:(id)a3
{
  id v5 = a3;
  v20.receiver = self;
  v20.super_class = (Class)IMDCKAttachmentSyncController;
  v6 = [(IMDCKAttachmentSyncController *)&v20 init];
  if (v6)
  {
    dispatch_queue_t v7 = dispatch_queue_create("com.apple.private.IMDCKAttachmentSyncController", 0);
    ckQueue = v6->_ckQueue;
    v6->_ckQueue = (OS_dispatch_queue *)v7;

    uint64_t v9 = +[IMDRecordZoneManager sharedInstance];
    recordZoneManager = v6->_recordZoneManager;
    v6->_recordZoneManager = (IMDRecordZoneManager *)v9;

    v11 = objc_alloc_init(IMDCKAttachmentSyncCKOperationFactory);
    CKOperationFactory = v6->_CKOperationFactory;
    v6->_CKOperationFactory = v11;

    v6->_deviceConditionsToCheck = 0;
    objc_storeStrong((id *)&v6->_syncTokenStore, a3);
    v13 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    downloadAssetsForTransferGUIDs = v6->_downloadAssetsForTransferGUIDs;
    v6->_downloadAssetsForTransferGUIDs = v13;

    v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    recordIDToTransferMap = v6->_recordIDToTransferMap;
    v6->_recordIDToTransferMap = v15;

    v17 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    completionBlocksForAssetFetchOperations = v6->_completionBlocksForAssetFetchOperations;
    v6->_completionBlocksForAssetFetchOperations = v17;

    [(IMDCKAttachmentSyncController *)v6 _migrateSyncToken];
  }

  return v6;
}

- (IMDCKAttachmentSyncController)init
{
  v3 = objc_alloc_init(IMDCKSyncTokenStore);
  v4 = [(IMDCKAttachmentSyncController *)self initWithSyncTokenStore:v3];

  return v4;
}

- (int64_t)syncControllerRecordType
{
  return 3;
}

- (id)recordStore
{
  if (qword_1EA8CA458 != -1) {
    dispatch_once(&qword_1EA8CA458, &unk_1F3390C80);
  }
  v2 = (void *)qword_1EA8CA450;

  return v2;
}

- (void)_needsToMarkAllAttachmentsAsNeedingSync
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v2 setBool:0 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF20]];
}

- (BOOL)_shouldMarkAllAttachmentsAsNeedingSync
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  char v3 = [v2 isUnderFirstDataProtectionLock];

  if (v3)
  {
    int v4 = 0;
  }
  else
  {
    id v5 = [MEMORY[0x1E4F6E720] sharedInstance];
    int v4 = [v5 getBoolFromDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF20]] ^ 1;
  }
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      dispatch_queue_t v7 = @"NO";
      if (v4) {
        dispatch_queue_t v7 = @"YES";
      }
      int v9 = 138412290;
      v10 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "_shouldMarkAllAttachmentsAsNeedingSync %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return v4;
}

- (void)_hasMarkedAllAttachmentsAsNeedingSync
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v2 setBool:1 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF20]];
}

- (int64_t)_numberOfBatchesOfAttachmentsToFetchInInitialSync
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  char v3 = [(IMDCKAbstractSyncController *)self ckUtilities];
  char v4 = [v3 isInCloudKitDemoMode];

  if (v4) {
    return 1;
  }
  v6 = [(IMDCKAbstractSyncController *)self ckUtilities];
  dispatch_queue_t v7 = [v6 serverBag];
  v8 = [v7 objectForKey:@"ck-max-number-of-attachment-batches"];

  if (v8 && [v8 integerValue] >= 1)
  {
    int64_t v5 = [v8 integerValue];
    if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        v10 = [NSNumber numberWithUnsignedInteger:v5];
        int v12 = 138412290;
        v13 = v10;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, " overriding max number of attachment batches to fetch %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    int64_t v5 = 50;
  }

  return v5;
}

- (BOOL)_shouldMarkAttachmentsAsNeedingReupload
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  char v3 = [v2 getValueFromDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CAC8]];

  if (v3)
  {
    char v4 = (void *)MEMORY[0x1E4F1C9C8];
    id v5 = v3;
    v6 = [v4 date];
    [v6 timeIntervalSinceDate:v5];
    double v8 = v7;

    BOOL v9 = v8 > 604800.0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)_markAllFailedAttachmentsAsNeedingSync
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  BOOL v2 = [(IMDCKAttachmentSyncController *)self _shouldMarkAttachmentsAsNeedingReupload];
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      char v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Marking any unsuccessfully synced attachments as needing sync", (uint8_t *)&v9, 2u);
      }
    }
    IMDAttachmentMarkAllFailedAttachmentsAsNeedingSync();
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Finished Marking any unsuccessfully synced attachments as needing sync", (uint8_t *)&v9, 2u);
      }
    }
    v6 = [MEMORY[0x1E4F1C9C8] date];
    IMSetDomainValueForKey();
  }
  else if (v3)
  {
    double v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      double v8 = IMGetCachedDomainValueForKey();
      int v9 = 138412290;
      v10 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Not marking unsuccessful attachments as needing sync. Last attempt date %@", (uint8_t *)&v9, 0xCu);
    }
  }
}

- (int64_t)_numberOfMetadataBatchesOfAttachmentsToFetchInInitialSync
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  int v3 = [(IMDCKAbstractSyncController *)self ckUtilities];
  int v4 = [v3 isInCloudKitDemoMode];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "overriding max number of attachment metadata batches to fetch as this is in demo mode.", (uint8_t *)&v13, 2u);
      }
    }
    return 1;
  }
  else
  {
    double v7 = [(IMDCKAbstractSyncController *)self ckUtilities];
    double v8 = [v7 serverBag];
    int v9 = [v8 objectForKey:@"ck-max-number-of-attachment-metadata-batches"];

    if (v9 && [v9 integerValue] >= 1)
    {
      int64_t v6 = [v9 integerValue];
      if (IMOSLoggingEnabled())
      {
        v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = [NSNumber numberWithUnsignedInteger:v6];
          int v13 = 138412290;
          uint64_t v14 = v11;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "overriding max number of attachment metadata batches to fetch %@", (uint8_t *)&v13, 0xCu);
        }
      }
    }
    else
    {
      int64_t v6 = 5;
    }
  }
  return v6;
}

- (void)syncAttachmentsWithSyncType:(int64_t)a3 deviceConditionsToCheck:(unint64_t)a4 activity:(id)a5 completionBlock:(id)a6
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v10 = a5;
  id v11 = a6;
  if (IMOSLoggingEnabled())
  {
    int v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v35 = a3;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Initiating attachment syncing with type %ld", buf, 0xCu);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D97021A8;
  aBlock[3] = &unk_1E6B746E0;
  id v32 = v11;
  int64_t v33 = a3;
  aBlock[4] = self;
  id v21 = v11;
  int v13 = _Block_copy(aBlock);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1D9702368;
  v28[3] = &unk_1E6B74708;
  v28[4] = self;
  id v14 = v10;
  id v29 = v14;
  id v15 = v13;
  id v30 = v15;
  v16 = _Block_copy(v28);
  [(IMDCKAbstractSyncController *)self resetRecordCounts];
  v17 = [(IMDCKAttachmentSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97024F4;
  block[3] = &unk_1E6B74758;
  int64_t v26 = a3;
  unint64_t v27 = a4;
  block[4] = self;
  id v23 = v14;
  id v24 = v15;
  id v25 = v16;
  id v18 = v16;
  id v19 = v15;
  id v20 = v14;
  dispatch_async(v17, block);
}

- (void)fetchAttachmentDataForTransfers:(id)a3 highQuality:(BOOL)a4 perTransferProgress:(id)a5 activity:(id)a6 completion:(id)a7
{
  BOOL v10 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      v17 = @"NO";
      if (v10) {
        v17 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v30 = v12;
      __int16 v31 = 2112;
      id v32 = v17;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "fetchAttachmentDataForTransferGUIDs %@ HQ %@", buf, 0x16u);
    }
  }
  id v18 = [(IMDCKAttachmentSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D9702AA4;
  block[3] = &unk_1E6B747C8;
  id v24 = v12;
  id v25 = self;
  id v27 = v13;
  id v28 = v15;
  id v26 = v14;
  id v19 = v14;
  id v20 = v15;
  id v21 = v13;
  id v22 = v12;
  dispatch_async(v18, block);
}

- (void)acceptFileTransfer:(id)a3 completion:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    double v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "accepting file transfer %@", buf, 0xCu);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D97031EC;
  aBlock[3] = &unk_1E6B747F0;
  id v9 = v6;
  id v22 = v9;
  BOOL v10 = _Block_copy(aBlock);
  uint64_t v15 = MEMORY[0x1E4F143A8];
  uint64_t v16 = 3221225472;
  v17 = sub_1D970337C;
  id v18 = &unk_1E6B74818;
  id v19 = v9;
  id v20 = v7;
  id v11 = v9;
  id v12 = v7;
  id v13 = _Block_copy(&v15);
  id v23 = v11;
  id v14 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v23, 1, v15, v16, v17, v18);
  [(IMDCKAttachmentSyncController *)self fetchAttachmentDataForTransfers:v14 highQuality:0 perTransferProgress:v10 activity:0 completion:v13];
}

- (void)acceptFileTransfers:(id)a3 completion:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    double v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "accepting file transfers %@", buf, 0xCu);
    }
  }
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D9703590;
  aBlock[3] = &unk_1E6B74840;
  id v12 = v7;
  id v9 = v7;
  BOOL v10 = _Block_copy(aBlock);
  [(IMDCKAttachmentSyncController *)self fetchAttachmentDataForTransfers:v6 highQuality:0 perTransferProgress:0 activity:0 completion:v10];
}

- (BOOL)_attachmentDownloadCanStart:(BOOL)a3 withActivity:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  BOOL v7 = [(IMDCKAttachmentSyncController *)self __shouldOptimizeAttachmentDefault];
  if (!v4 && v7)
  {
    if (IMOSLoggingEnabled())
    {
      double v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        __int16 v17 = 0;
        id v9 = "Won't download assets, we are optimizing attachment storage.";
        BOOL v10 = (uint8_t *)&v17;
LABEL_19:
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, v9, v10, 2u);
        goto LABEL_20;
      }
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  id v11 = [(IMDCKAttachmentSyncController *)self _attachmentZoneSalt];

  if (!v11)
  {
    if (IMOSLoggingEnabled())
    {
      double v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        __int16 v16 = 0;
        id v9 = "We have a nil salt so we can't download assets anyway -- bailing";
        BOOL v10 = (uint8_t *)&v16;
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  if ([(IMDCKAttachmentSyncController *)self assetDownloadInProgress])
  {
    if (IMOSLoggingEnabled())
    {
      double v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        __int16 v15 = 0;
        id v9 = "CloudKit Asset download already in progress, ignoring request";
        BOOL v10 = (uint8_t *)&v15;
        goto LABEL_19;
      }
LABEL_20:
    }
LABEL_21:
    BOOL v12 = 0;
    goto LABEL_22;
  }
  if (![(IMDCKAttachmentSyncController *)self _deviceConditionsAllowsMessageSyncIgnoreFeatureEnabled:v4 activity:v6])
  {
    if (IMOSLoggingEnabled())
    {
      double v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        __int16 v14 = 0;
        id v9 = "Won't download download assets, we don't meet the resource conditions currently";
        BOOL v10 = (uint8_t *)&v14;
        goto LABEL_19;
      }
      goto LABEL_20;
    }
    goto LABEL_21;
  }
  BOOL v12 = 1;
LABEL_22:

  return v12;
}

- (void)_downloadAttachmentAssetsWithActivity:(id)a3 restoringAttachments:(BOOL)a4 retryCount:(unint64_t)a5 numAttachmentsDownloaded:(unint64_t)a6 completion:(id)a7
{
}

- (void)_downloadAttachmentAssetsWithActivity:(id)a3 restoringAttachments:(BOOL)a4 retryCount:(unint64_t)a5 numAttachmentsDownloaded:(unint64_t)a6 transfers:(id)a7 completion:(id)a8
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v14 = a7;
  id v31 = a8;
  [(IMDCKAttachmentSyncController *)self setAssetDownloadInProgress:1];
  uint64_t v47 = 0;
  v48 = &v47;
  uint64_t v49 = 0x2020000000;
  unint64_t v50 = a6;
  id v32 = v14;
  if ([v14 count])
  {
    id v33 = v14;
  }
  else
  {
    id v33 = [(IMDCKAttachmentSyncController *)self __databaseRequestForAttachmentsWithAssets];
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [v33 count];
      __int16 v17 = [NSNumber numberWithUnsignedInteger:a5];
      *(_DWORD *)buf = 134218242;
      uint64_t v53 = v16;
      __int16 v54 = 2112;
      v55 = v17;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Starting attachment download batch with %lu items retries %@", buf, 0x16u);
    }
  }
  if (objc_msgSend(v33, "count", v29))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D9703BE4;
    aBlock[3] = &unk_1E6B74890;
    v44 = &v47;
    id v18 = v33;
    id v39 = v18;
    id v40 = v14;
    v41 = self;
    unint64_t v45 = a5;
    BOOL v46 = a4;
    id v19 = v30;
    id v42 = v19;
    id v43 = v31;
    id v20 = _Block_copy(aBlock);
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id v21 = v18;
    uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v51 count:16];
    if (v22)
    {
      uint64_t v23 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v35 != v23) {
            objc_enumerationMutation(v21);
          }
          id v25 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          uint64_t v26 = [(IMDCKAttachmentSyncController *)self fileTransferCenter];
          id v27 = [v25 guid];
          [v26 addTransfer:v25 forGUID:v27];
        }
        uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v51 count:16];
      }
      while (v22);
    }

    [(IMDCKAttachmentSyncController *)self fetchAttachmentDataForTransfers:v21 highQuality:0 perTransferProgress:0 activity:v19 completion:v20];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "No assets to downloand", buf, 2u);
      }
    }
    [(IMDCKAttachmentSyncController *)self setAssetDownloadInProgress:0];
    if (v31) {
      (*((void (**)(id, uint64_t, uint64_t, void))v31 + 2))(v31, 1, v48[3], 0);
    }
  }

  _Block_object_dispose(&v47, 8);
}

- (void)downloadAttachmentAssetsWithActivity:(id)a3 restoringAttachments:(BOOL)a4 completion:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if ([(IMDCKAttachmentSyncController *)self _attachmentDownloadCanStart:v6 withActivity:v8])
  {
    BOOL v10 = [(IMDCKAttachmentSyncController *)self __databaseRequestForAttachmentsWithAssets];
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1D9704600;
    v11[3] = &unk_1E6B748B8;
    id v12 = v9;
    [(IMDCKAttachmentSyncController *)self _downloadAttachmentAssetsWithActivity:v8 restoringAttachments:v6 retryCount:0 numAttachmentsDownloaded:0 transfers:v10 completion:v11];
  }
  else if (v9)
  {
    (*((void (**)(id, void, void))v9 + 2))(v9, 0, 0);
  }
}

- (void)downloadAttachmentAssetsWithActivity:(id)a3 restoringAttachments:(BOOL)a4
{
}

- (id)purgedAttachmentsForChat:(id)a3 services:(id)a4 limit:(int64_t)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v22 = a4;
  if (IMOSLoggingEnabled())
  {
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v29 = (uint64_t)v21;
      __int16 v30 = 2112;
      id v31 = v22;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "purgedAttachmentsForChat Request to download purged assets for chats %@ on services %@", buf, 0x16u);
    }
  }
  BOOL v7 = (void *)IMDAttachmentRecordCopyPurgedAttachmentsForChatIdentifiersOnServices();
  int v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (!v8) {
      goto LABEL_14;
    }
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = [v7 count];
      *(_DWORD *)buf = 134217984;
      uint64_t v29 = v10;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Got %lu purged assets to download", buf, 0xCu);
    }
  }
  else
  {
    if (!v8) {
      goto LABEL_14;
    }
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "No assets that have been purged", buf, 2u);
    }
  }

LABEL_14:
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v12 = v7;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v24 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id v17 = IMFileTransferFromIMDAttachmentRecordRef(v16);
        if (v17)
        {
          [v11 addObject:v17];
        }
        else
        {
          uint64_t v18 = [v16 rowID];
          if (IMOSLoggingEnabled())
          {
            id v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v29 = v18;
              _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "**** failed to create IMFileTransfer from IMDAttachmentRecordRef rowid: %lld, marking as synced ***", buf, 0xCu);
            }
          }
          IMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState();
        }
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v13);
  }

  return v11;
}

- (unint64_t)purgedAttachmentsCountForChatsWithChatIdentifiers:(id)a3 services:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    BOOL v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      unint64_t v16 = (unint64_t)v5;
      __int16 v17 = 2112;
      id v18 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "purgedAttachmentsCountForChat Request to get count of purged assets for chats %@ on services %@", (uint8_t *)&v15, 0x16u);
    }
  }
  int v8 = (void *)IMDAttachmentRecordCopyPurgedAttachmentsCountForChatIdentifiersOnServices();
  id v9 = v8;
  if (v8)
  {
    uint64_t v10 = [v8 firstObject];
    unint64_t v11 = [v10 unsignedIntegerValue];

    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v15 = 134217984;
        unint64_t v16 = v11;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Got %lu purged assets to download", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "No assets that have been purged", (uint8_t *)&v15, 2u);
      }
    }
    unint64_t v11 = 0;
  }

  return v11;
}

- (void)downloadAttachmentAssetsForChatIDs:(id)a3 services:(id)a4 style:(unsigned __int8)a5 completion:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  id v22 = a4;
  id v18 = a6;
  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v34 = v23;
      __int16 v35 = 2112;
      id v36 = v22;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Request to download purged assets for chats %@ on services %@", buf, 0x16u);
    }
  }
  id v20 = objc_msgSend(MEMORY[0x1E4F6B598], "sharedInstanceForBagType:", 1, v18);
  long long v24 = [v20 objectForKey:@"ck-client-download-purged-attachments-batch-size"];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && (int)[v24 intValue] >= 1) {
    uint64_t v9 = (int)[v24 intValue];
  }
  else {
    uint64_t v9 = 10;
  }
  [(IMDCKAttachmentSyncController *)self purgedAttachmentsForChat:v23 services:v22 limit:v9];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v29 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          int v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v34 = v14;
            _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Got %@", buf, 0xCu);
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v11);
  }

  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1D9704F40;
  v25[3] = &unk_1E6B748E0;
  id v26 = v23;
  id v27 = v19;
  id v16 = v19;
  id v17 = v23;
  [(IMDCKAttachmentSyncController *)self _downloadAttachmentAssetsWithActivity:0 restoringAttachments:0 retryCount:0 numAttachmentsDownloaded:0 transfers:v10 completion:v25];
}

- (id)__databaseRequestForAttachmentsWithAssets
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  [(IMDCKAttachmentSyncController *)self _numberOfAttachmentsToDownload];
  BOOL v2 = (void *)IMDAttachmentRecordCopyAttachmentsForQueryWithLimit();
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v20 = (uint64_t)v2;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Found records to donwload {%@}", buf, 0xCu);
    }
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v2;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = IMFileTransferFromIMDAttachmentRecordRef(v9);
        if (v10)
        {
          [v4 addObject:v10];
        }
        else
        {
          uint64_t v11 = [v9 rowID];
          if (IMOSLoggingEnabled())
          {
            uint64_t v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134217984;
              uint64_t v20 = v11;
              _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "**** failed to create IMFileTransfer from IMDAttachmentRecordRef rowid: %lld, marking as failed to sync ***", buf, 0xCu);
            }
          }
          IMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState();
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_ckUtilitiesInstance
{
  return +[IMDCKUtilities sharedInstance];
}

- (void)_updateDeviceConditionsToCheckIfNeededForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (![(IMDCKAttachmentSyncController *)self deviceConditionsToCheck])
  {
    if (a4 == -1)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v10) = 0;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "This is a periodic sync and deviceConditionstoCheck is set to IMCheckNoDeviceConditions, changing it to IMCheckAllDeviceConditions", (uint8_t *)&v10, 2u);
        }
        goto LABEL_12;
      }
LABEL_13:
      [(IMDCKAttachmentSyncController *)self setDeviceConditionsToCheck:1];
      return;
    }
    if ((a4 & 0x8000000000000000) == 0 && a3 > a4)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v8 = [NSNumber numberWithInteger:a3];
          uint64_t v9 = [NSNumber numberWithInteger:a4];
          int v10 = 138412546;
          uint64_t v11 = v8;
          __int16 v12 = 2112;
          uint64_t v13 = v9;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "This is an initial sync but current batch count [%@] >= maxBatchCount [%@] and deviceConditionstoCheck is set to IMCheckNoDeviceConditions, changing it to IMCheckAllDeviceConditions", (uint8_t *)&v10, 0x16u);
        }
LABEL_12:

        goto LABEL_13;
      }
      goto LABEL_13;
    }
  }
}

- (BOOL)_deviceConditionsAllowsMessageSyncForCurrentBatchCount:(int64_t)a3 maxBatchCount:(int64_t)a4 activity:(id)a5
{
  id v8 = a5;
  [(IMDCKAttachmentSyncController *)self _updateDeviceConditionsToCheckIfNeededForCurrentBatchCount:a3 maxBatchCount:a4];
  LOBYTE(a4) = [(IMDCKAttachmentSyncController *)self _deviceConditionsAllowsMessageSyncWithActivity:v8];

  return a4;
}

- (BOOL)_deviceConditionsAllowsMessageSyncWithActivity:(id)a3
{
  return [(IMDCKAttachmentSyncController *)self _deviceConditionsAllowsMessageSyncIgnoreFeatureEnabled:0 activity:a3];
}

- (BOOL)_deviceConditionsAllowsMessageSyncIgnoreFeatureEnabled:(BOOL)a3 activity:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (_xpc_activity_s *)a4;
  uint64_t v7 = [(IMDCKAttachmentSyncController *)self _ckUtilitiesInstance];
  int v8 = [v7 cloudKitSyncingEnabled];

  if (a3 || v8)
  {
    int v10 = [(IMDCKAttachmentSyncController *)self _ckUtilitiesInstance];
    int v9 = [v10 iCloudAccountMatchesiMessageAccount];

    if (!v6) {
      goto LABEL_16;
    }
  }
  else
  {
    int v9 = 0;
    if (!v6) {
      goto LABEL_16;
    }
  }
  if ((v9 & xpc_activity_should_defer(v6)) == 1)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Setting xpc_activity_t to XPC_ACTIVITY_STATE_DEFER because conditions are no longer met", (uint8_t *)&v22, 2u);
      }
    }
    if (!xpc_activity_set_state(v6, 3) && IMOSLoggingEnabled())
    {
      __int16 v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Error forcing xpc_activity_t to XPC_ACTIVITY_STATE_DEFER", (uint8_t *)&v22, 2u);
      }
    }
    goto LABEL_33;
  }
LABEL_16:
  if (!v9) {
    goto LABEL_34;
  }
  unint64_t v13 = [(IMDCKAttachmentSyncController *)self deviceConditionsToCheck];
  if (v6 || !v13) {
    goto LABEL_34;
  }
  unint64_t v14 = [(IMDCKAttachmentSyncController *)self deviceConditionsToCheck];
  if (v14 == 2)
  {
    long long v15 = [(IMDCKAttachmentSyncController *)self _ckUtilitiesInstance];
    int v16 = [v15 isDeviceOnWifi];
    goto LABEL_23;
  }
  if (v14 == 1)
  {
    long long v15 = [(IMDCKAttachmentSyncController *)self _ckUtilitiesInstance];
    int v16 = [v15 deviceConditionsAllowPeriodicSync];
LABEL_23:
    int v17 = v16;

    goto LABEL_25;
  }
  int v17 = 0;
LABEL_25:
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      if (v17) {
        uint64_t v19 = @"YES";
      }
      else {
        uint64_t v19 = @"NO";
      }
      uint64_t v20 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", -[IMDCKAttachmentSyncController deviceConditionsToCheck](self, "deviceConditionsToCheck"));
      int v22 = 138412546;
      id v23 = v19;
      __int16 v24 = 2112;
      long long v25 = v20;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Attachment sync: device conditions allow sync: %@ deviceConditionsToCheck %@", (uint8_t *)&v22, 0x16u);
    }
  }
  if (!v17) {
LABEL_33:
  }
    LOBYTE(v9) = 0;
LABEL_34:

  return v9;
}

- (id)_attachmentZoneID
{
  BOOL v2 = [(IMDCKAttachmentSyncController *)self recordZoneManager];
  int v3 = [v2 attachmentRecordZoneID];

  return v3;
}

- (id)_recordKeyManagerSharedInstance
{
  return +[IMDCKRecordSaltManager sharedInstance];
}

- (id)_attachmentZoneSalt
{
  BOOL v2 = [(IMDCKAttachmentSyncController *)self _recordKeyManagerSharedInstance];
  int v3 = [v2 cachedSalt];

  return v3;
}

- (void)_scheduleOperation:(id)a3
{
  id v3 = a3;
  id v5 = +[IMDCKDatabaseManager sharedInstance];
  id v4 = [v5 truthDatabase];
  [v4 addOperation:v3];
}

- (unint64_t)_numberOfAttachmentsToDownload
{
  return 20;
}

- (unint64_t)_numberOfAttachmentsToWriteUp
{
  return 20;
}

- (id)_updateAttachmentGUIDIfNeededAndReturnTransfersToForceMarkAsSync:(id)a3 transfersToSyncRowIDs:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v24 = a4;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v7)
  {
    uint64_t v9 = 0;
    uint64_t v10 = *(void *)v26;
    *(void *)&long long v8 = 138412546;
    long long v21 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v26 != v10) {
          objc_enumerationMutation(v6);
        }
        __int16 v12 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        unint64_t v13 = objc_msgSend(v12, "guid", v21);
        unint64_t v14 = +[IMDAttachmentStore sharedInstance];
        int v15 = [v14 updateTemporaryTransferGUIDsIfNeeded:v12 transfersToSync:v6];

        if (v15)
        {
          if (IMOSLoggingEnabled())
          {
            int v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              int v17 = [v12 guid];
              *(_DWORD *)buf = v21;
              long long v30 = v13;
              __int16 v31 = 2112;
              uint64_t v32 = v17;
              _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Fixed up guid for transfer old guid: %@ new guid: %@", buf, 0x16u);
            }
          }
        }
        else if (IMFileTransferGUIDIsTemporary())
        {
          id v18 = [v24 objectAtIndexedSubscript:v9 + i];
          if (IMOSLoggingEnabled())
          {
            uint64_t v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v21;
              long long v30 = v13;
              __int16 v31 = 2112;
              uint64_t v32 = v18;
              _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "******** Marking attachment with final failure, as we could not update it's guid %@ (rowid %@)", buf, 0x16u);
            }
          }
          -[IMDCKAttachmentSyncController _markAttachmentWithROWID:withSyncState:](self, "_markAttachmentWithROWID:withSyncState:", [v18 longLongValue], 64);
          [v23 addObject:v12];
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v25 objects:v33 count:16];
      v9 += i;
    }
    while (v7);
  }

  return v23;
}

- (id)_fetchAndPrepareRecordsToWrite:(BOOL *)a3
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = [(IMDCKAttachmentSyncController *)self _numberOfAttachmentsToWriteUp];
  id v6 = (void *)IMDAttachmentRecordCopyAttachmentsForQueryWithLimit();
  unint64_t v7 = [v6 count];
  if (a3) {
    *a3 = v7 < v5;
  }
  unint64_t v46 = v7;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  long long v64 = 0u;
  obuint64_t j = v6;
  uint64_t v10 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v62;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v62 != v11) {
          objc_enumerationMutation(obj);
        }
        unint64_t v13 = *(void **)(*((void *)&v61 + 1) + 8 * i);
        id v14 = IMFileTransferFromIMDAttachmentRecordRef(v13);
        if (v14)
        {
          [v8 addObject:v14];
          int v15 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v13, "rowID"));
          [v9 addObject:v15];
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            int v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              uint64_t v17 = [v13 rowID];
              *(_DWORD *)buf = 134217984;
              *(void *)&uint8_t buf[4] = v17;
              _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "**** failed to create IMFileTransfer from IMDAttachmentRecordRef rowid: %lld, marking as clean ***", buf, 0xCu);
            }
          }
          [v13 rowID];
          IMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState();
        }
      }
      uint64_t v10 = [obj countByEnumeratingWithState:&v61 objects:v75 count:16];
    }
    while (v10);
  }

  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v19 = [v8 count];
      *(_DWORD *)buf = 134218240;
      *(void *)&uint8_t buf[4] = v46;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = v19;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Got %lu dirty results to sync, filtered to %lu", buf, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Fixing up attachment GUIDs if needed", buf, 2u);
    }
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v72 = sub_1D970646C;
  v73 = sub_1D970647C;
  id v74 = 0;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D9706484;
  block[3] = &unk_1E6B74908;
  v60 = buf;
  void block[4] = self;
  id v47 = v8;
  id v58 = v47;
  id v44 = v9;
  id v59 = v44;
  dispatch_sync(MEMORY[0x1E4F14428], block);
  if ([*(id *)(*(void *)&buf[8] + 40) count])
  {
    if (IMOSLoggingEnabled())
    {
      long long v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v65 = 0;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Removing attachments that were marked as clean ", v65, 2u);
      }
    }
    objc_msgSend(v47, "removeObjectsInArray:", *(void *)(*(void *)&buf[8] + 40), v44);
    long long v55 = 0u;
    long long v56 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    id v22 = v47;
    uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v70 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v54;
      do
      {
        for (uint64_t j = 0; j != v23; ++j)
        {
          if (*(void *)v54 != v24) {
            objc_enumerationMutation(v22);
          }
          uint64_t v26 = *(void *)(*((void *)&v53 + 1) + 8 * j);
          if (IMOSLoggingEnabled())
          {
            long long v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v65 = 138412290;
              uint64_t v66 = v26;
              _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Transfer to sync %@ ", v65, 0xCu);
            }
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v53 objects:v70 count:16];
      }
      while (v23);
    }
  }
  if (objc_msgSend(v47, "count", v44))
  {
    id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v29 = v47;
    uint64_t v30 = [v29 countByEnumeratingWithState:&v49 objects:v69 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v50;
      do
      {
        for (uint64_t k = 0; k != v30; ++k)
        {
          if (*(void *)v50 != v31) {
            objc_enumerationMutation(v29);
          }
          id v33 = *(void **)(*((void *)&v49 + 1) + 8 * k);
          uint64_t v34 = [(IMDCKAttachmentSyncController *)self recordZoneManager];
          __int16 v35 = [v34 attachmentRecordZoneID];
          id v36 = [(IMDCKAttachmentSyncController *)self _attachmentZoneSalt];
          uint64_t v37 = (void *)[v33 copyCKRecordRepresentationWithZoneID:v35 salt:v36];

          if (v37) {
            [v28 addObject:v37];
          }
        }
        uint64_t v30 = [v29 countByEnumeratingWithState:&v49 objects:v69 count:16];
      }
      while (v30);
    }

    v38 = [(IMDCKAbstractSyncController *)self ckUtilities];
    id v39 = (void *)[v38 newfilteredArrayRemovingCKRecordDupes:v28];

    if (IMOSLoggingEnabled())
    {
      id v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        uint64_t v41 = [v28 count];
        uint64_t v42 = [v39 count];
        *(_DWORD *)v65 = 134218240;
        uint64_t v66 = v41;
        __int16 v67 = 2048;
        uint64_t v68 = v42;
        _os_log_impl(&dword_1D967A000, v40, OS_LOG_TYPE_INFO, "Got %lu records to sync, filtered to %lu unique records", v65, 0x16u);
      }
    }
  }
  else
  {
    id v39 = 0;
  }

  _Block_object_dispose(buf, 8);

  return v39;
}

- (void)_writeAttachmentsToCloudKitWithActivity:(id)a3 completionBlock:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Writing up a batch of attachments to cloudKit", buf, 2u);
    }
  }
  if ([(IMDCKAttachmentSyncController *)self _deviceConditionsAllowsMessageSyncForCurrentBatchCount:1 maxBatchCount:-1 activity:v6])
  {
    [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToUploading];
    unsigned __int8 v30 = 0;
    id v9 = [(IMDCKAttachmentSyncController *)self _fetchAndPrepareRecordsToWrite:&v30];
    uint64_t v10 = [v9 count];
    int v11 = v30;
    if (v10)
    {
      if (v30 && IMOSLoggingEnabled())
      {
        __int16 v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          uint64_t v13 = [v9 count];
          unint64_t v14 = [(IMDCKAttachmentSyncController *)self _numberOfAttachmentsToWriteUp];
          *(_DWORD *)buf = 134218240;
          unint64_t v32 = v13;
          __int16 v33 = 2048;
          unint64_t v34 = v14;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "*** This is the last batch of attachments to write up. Number of records to write %lu < max batch size %lu", buf, 0x16u);
        }
      }
      v24[0] = MEMORY[0x1E4F143A8];
      v24[1] = 3221225472;
      v24[2] = sub_1D970698C;
      v24[3] = &unk_1E6B74930;
      id v28 = v7;
      char v29 = v11;
      id v25 = v9;
      uint64_t v26 = self;
      id v27 = v6;
      [(IMDCKAttachmentSyncController *)self _writeCKRecordsToAttachmentZone:v25 activity:v27 withCompletion:v24];
    }
    else
    {
      int v17 = IMOSLoggingEnabled();
      if (v11)
      {
        if (v17)
        {
          id v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            unint64_t v19 = [(IMDCKAttachmentSyncController *)self _numberOfAttachmentsToWriteUp];
            *(_DWORD *)buf = 134217984;
            unint64_t v32 = v19;
            _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Failed to write any of these %lu dirty attachments, looks like there's nothing left to do", buf, 0xCu);
          }
        }
        if (v7) {
          (*((void (**)(id, void))v7 + 2))(v7, 0);
        }
      }
      else
      {
        if (v17)
        {
          uint64_t v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            unint64_t v21 = [(IMDCKAttachmentSyncController *)self _numberOfAttachmentsToWriteUp];
            *(_DWORD *)buf = 134217984;
            unint64_t v32 = v21;
            _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Failed to write any of these %lu dirty attachments, looking for more attachments to write", buf, 0xCu);
          }
        }
        v22[0] = MEMORY[0x1E4F143A8];
        v22[1] = 3221225472;
        v22[2] = sub_1D9706CB0;
        v22[3] = &unk_1E6B72C60;
        id v23 = v7;
        [(IMDCKAttachmentSyncController *)self _kickOffWriteOnCKQueueWithActivity:v6 completion:v22];
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Device conditions dont allow us to sync", buf, 2u);
      }
    }
    if (v7)
    {
      int v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6D1E8] code:4 userInfo:0];
      (*((void (**)(id, void *))v7 + 2))(v7, v16);
    }
  }
}

- (void)_fetchAttachmentZoneRecords:(id)a3 desiredKeys:(int64_t)a4 ognSuffix:(id)a5 removeTombstones:(BOOL)a6 activity:(id)a7 completion:(id)a8
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  int v15 = (__CFString *)a5;
  id v30 = a7;
  id v16 = a8;
  if (IMOSLoggingEnabled())
  {
    int v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v14;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Fetching assets for %@", buf, 0xCu);
    }
  }
  id v18 = v15;
  if (v15) {
    goto LABEL_8;
  }
  if ([(IMDCKAttachmentSyncController *)self isDoingDeleteRecoverySync])
  {
    id v18 = @"-DRR";
LABEL_8:
    objc_msgSend(@"OptimizeRedownload", "stringByAppendingString:", v18, v30);
    unint64_t v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  unint64_t v19 = @"OptimizeRedownload";
LABEL_9:
  uint64_t v20 = [(IMDCKAttachmentSyncController *)self CKOperationFactory];
  unint64_t v21 = [v20 fetchAttachmentZoneRecords:v14 desiredKeys:a4 operationGroupName:v19 activity:v31];

  v36[0] = MEMORY[0x1E4F143A8];
  v36[1] = 3221225472;
  v36[2] = sub_1D9707014;
  v36[3] = &unk_1E6B74958;
  v36[4] = self;
  [v21 setPerRecordProgressBlock:v36];
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_1D9707020;
  v35[3] = &unk_1E6B74980;
  v35[4] = self;
  [v21 setPerRecordCompletionBlock:v35];
  id v22 = [v21 operationID];
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1D9707034;
  v32[3] = &unk_1E6B749A8;
  BOOL v34 = a6;
  v32[4] = self;
  id v33 = v22;
  id v23 = v22;
  [v21 setFetchRecordsCompletionBlock:v32];
  if (v16)
  {
    uint64_t v24 = [(IMDCKAttachmentSyncController *)self completionBlocksForAssetFetchOperations];
    id v25 = (void *)[v16 copy];
    uint64_t v26 = _Block_copy(v25);
    id v27 = [v21 operationID];
    [v24 setObject:v26 forKey:v27];
  }
  id v28 = +[IMDCKDatabaseManager sharedInstance];
  char v29 = [v28 manateeDataBase];
  [v29 addOperation:v21];
}

- (BOOL)_fetchedAllChangesFromCloudKit
{
  return IMGetDomainBoolForKey();
}

- (int)_resyncForDeleteRecoveryState
{
  BOOL v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  id v3 = [v2 getValueFromDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CC78]];
  int v4 = [v3 intValue];

  return v4;
}

- (BOOL)_hasCompletedRecoveryResync
{
  return [(IMDCKAttachmentSyncController *)self _resyncForDeleteRecoveryState] == 2;
}

- (void)_initResyncForDeleteRecovery
{
  int v3 = [(IMDCKAttachmentSyncController *)self _resyncForDeleteRecoveryState];
  if (v3 <= 0)
  {
    if (IMOSLoggingEnabled())
    {
      int v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Starting Delete Recovery Resync", buf, 2u);
      }
    }
    [(IMDCKAttachmentSyncController *)self clearLocalSyncState:3];
    [(IMDCKAttachmentSyncController *)self _markResyncForDeleteRecoveryAs:1];
  }
  if ([(IMDCKAttachmentSyncController *)self _resyncForDeleteRecoveryState] < 1
    || [(IMDCKAttachmentSyncController *)self _resyncForDeleteRecoveryState] > 1)
  {
    [(IMDCKAttachmentSyncController *)self setIsDoingDeleteRecoverySync:0];
  }
  else
  {
    [(IMDCKAttachmentSyncController *)self setIsDoingDeleteRecoverySync:1];
    if (v3 >= 1 && IMOSLoggingEnabled())
    {
      unint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Continuing Delete Recovery Resync", v6, 2u);
      }
    }
  }
}

- (void)_markResyncForDeleteRecoveryAs:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = [MEMORY[0x1E4F6E720] sharedInstance];
  int v4 = [NSNumber numberWithInt:v3];
  [v5 setValue:v4 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CC78]];
}

- (void)_fetchAttachmentZoneChangesShouldWriteBackChanges:(BOOL)a3 desiredKeys:(int64_t)a4 syncType:(int64_t)a5 currentBatchCount:(int64_t)a6 maxBatchCount:(int64_t)a7 syncToken:(id)a8 activity:(id)a9 completionBlock:(id)a10
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v39 = a8;
  id v44 = a9;
  uint64_t v41 = (void (**)(void))a10;
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = [NSNumber numberWithInteger:a6];
      id v16 = [NSNumber numberWithInteger:a7];
      int v17 = [NSNumber numberWithInteger:a5];
      *(_DWORD *)buf = 138413314;
      id v58 = v15;
      __int16 v59 = 2112;
      v60 = v16;
      __int16 v61 = 2112;
      long long v62 = v17;
      __int16 v63 = 2112;
      long long v64 = &unk_1F33C5760;
      __int16 v65 = 2112;
      id v66 = v39;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Fetching attachment batch count %@ (max: %@) syncType %@ batch size %@ token %@", buf, 0x34u);
    }
  }
  id v18 = @"AttachmentSync";
  if (a5 == 1) {
    id v18 = @"PeriodicSync";
  }
  if (!a5) {
    id v18 = @"FullRestore";
  }
  id v43 = v18;
  if ([(IMDCKAttachmentSyncController *)self isDoingDeleteRecoverySync])
  {
    id v43 = [v43 stringByAppendingString:@"-DRR"];
  }
  BOOL v20 = a7 >= 0 && a6 >= a7 && a5 == 0;
  int v21 = v20;
  int v40 = v21;
  if (v20 && IMOSLoggingEnabled())
  {
    id v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "*** Exceeded max number of attachment batches to fetch. Stopping attachment fetch ***", buf, 2u);
    }
  }
  id v23 = +[IMDCKCacheDeleteManager sharedInstance];
  int v24 = [v23 canWriteFileOfEstimatedSize:819200 refreshCachedValue:a6 % 0x64uLL == 0];

  int64_t v25 = a4;
  if (a5 == 1)
  {
    int64_t v25 = a4;
    if (![(IMDCKAttachmentSyncController *)self _fetchedAllChangesFromCloudKit])
    {
      uint64_t v26 = +[IMDCKCacheDeleteManager sharedInstance];
      int v27 = [v26 shouldDownloadAssetsOfSize:819200 refreshCachedValue:a6 % 0x64uLL == 0];

      int64_t v25 = a4;
      if (v27)
      {
        if (IMOSLoggingEnabled())
        {
          id v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Downloading asset while performing periodic syncing with cloudkit", buf, 2u);
          }
        }
        int64_t v25 = 1;
      }
    }
  }
  if ((v40 | [(IMDCKAttachmentSyncController *)self _deviceConditionsAllowsMessageSyncForCurrentBatchCount:a6 maxBatchCount:a7 activity:v44] & v24 ^ 1))
  {
    if (IMOSLoggingEnabled())
    {
      char v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        id v30 = @"YES";
        if (v40) {
          uint64_t v31 = @"NO";
        }
        else {
          uint64_t v31 = @"YES";
        }
        if (!v24) {
          id v30 = @"NO";
        }
        *(_DWORD *)buf = 138412546;
        id v58 = v31;
        __int16 v59 = 2112;
        v60 = v30;
        _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Device conditions dont allow sync OR continueFetching %@. Disk Space Available: %@", buf, 0x16u);
      }
    }
    unint64_t v32 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6D1E8] code:4 userInfo:0];
    id v33 = v32;
    if (v40)
    {

      id v33 = 0;
    }
    if (v41) {
      v41[2]();
    }
  }
  else
  {
    [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToDownloading];
    BOOL v34 = [(IMDCKAttachmentSyncController *)self CKOperationFactory];
    uint64_t v35 = [(IMDCKAttachmentSyncController *)self _attachmentZoneID];
    id v33 = [v34 fetchAttachmentZoneChangesCKOperationUsingToken:v39 zoneID:v35 resultsLimit:20 desiredKeys:v25 operationGroupName:v43 activity:v44];

    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = sub_1D9707A38;
    v56[3] = &unk_1E6B749D0;
    v56[4] = self;
    [v33 setRecordChangedBlock:v56];
    [v33 setRecordZoneChangeTokensUpdatedBlock:&unk_1F3390CC0];
    v55[0] = MEMORY[0x1E4F143A8];
    v55[1] = 3221225472;
    v55[2] = sub_1D9707B08;
    v55[3] = &unk_1E6B74A18;
    v55[4] = self;
    [v33 setRecordWithIDWasDeletedBlock:v55];
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = sub_1D9707B14;
    v47[3] = &unk_1E6B74A40;
    BOOL v54 = a3;
    v47[4] = self;
    int64_t v50 = a4;
    int64_t v51 = a5;
    int64_t v52 = a6;
    int64_t v53 = a7;
    id v48 = v44;
    id v36 = v41;
    long long v49 = v36;
    [v33 setRecordZoneFetchCompletionBlock:v47];
    v45[0] = MEMORY[0x1E4F143A8];
    v45[1] = 3221225472;
    v45[2] = sub_1D9707B6C;
    v45[3] = &unk_1E6B74A68;
    v45[4] = self;
    unint64_t v46 = v36;
    [v33 setFetchRecordZoneChangesCompletionBlock:v45];
    if (IMOSLoggingEnabled())
    {
      uint64_t v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_INFO, "Scheduling a fetch operation from attachment zone", buf, 2u);
      }
    }
    [(IMDCKAttachmentSyncController *)self _scheduleOperation:v33];
  }
}

- (void)_writeCKRecordsToAttachmentZone:(id)a3 activity:(id)a4 withCompletion:(id)a5
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = [(IMDCKAttachmentSyncController *)self _fetchedAllChangesFromCloudKit];
  __int16 v12 = @"BackfillAttachmentSync";
  if (v11) {
    __int16 v12 = @"PeriodicAttachmentSync";
  }
  uint64_t v13 = v12;
  if ([(IMDCKAttachmentSyncController *)self isDoingDeleteRecoverySync])
  {
    uint64_t v14 = [(__CFString *)v13 stringByAppendingString:@"-DRR"];

    uint64_t v13 = (__CFString *)v14;
  }
  int v15 = [(IMDCKAttachmentSyncController *)self CKOperationFactory];
  id v16 = [v15 saveAttachmentsCKOperationUsingRecordsToSave:v8 operationGroupName:v13 activity:v9];

  [v16 setPerRecordProgressBlock:&unk_1F3390CE0];
  v22[0] = MEMORY[0x1E4F143A8];
  v22[1] = 3221225472;
  v22[2] = sub_1D9707E1C;
  v22[3] = &unk_1E6B74AB0;
  void v22[4] = self;
  [v16 setPerRecordCompletionBlock:v22];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1D9707E2C;
  v20[3] = &unk_1E6B73B28;
  v20[4] = self;
  id v17 = v10;
  id v21 = v17;
  [v16 setModifyRecordsCompletionBlock:v20];
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      unint64_t v19 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v8, "count"));
      *(_DWORD *)buf = 138412290;
      int v24 = v19;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Attempting to write %@ records to truth zone ", buf, 0xCu);
    }
  }
  [(IMDCKAttachmentSyncController *)self _scheduleOperation:v16];
}

- (BOOL)_attachmentZoneCreated
{
  uint64_t v14 = 0;
  int v15 = &v14;
  uint64_t v16 = 0x2020000000;
  char v17 = 0;
  dispatch_semaphore_t v3 = dispatch_semaphore_create(0);
  int v4 = [(IMDCKAttachmentSyncController *)self recordZoneManager];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D9707FE8;
  v11[3] = &unk_1E6B73B50;
  uint64_t v13 = &v14;
  id v5 = v3;
  __int16 v12 = v5;
  [v4 createAttachmentZoneIfNeededWithCompletionBlock:v11];

  dispatch_time_t v6 = dispatch_time(0, 300000000000);
  if (dispatch_semaphore_wait(v5, v6))
  {
    *((unsigned char *)v15 + 24) = 0;
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v10 = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "***** Timed out creating attachment zone *******", v10, 2u);
      }
    }
  }
  char v8 = *((unsigned char *)v15 + 24);

  _Block_object_dispose(&v14, 8);
  return v8;
}

- (void)deleteAttachmentSyncToken
{
  dispatch_semaphore_t v3 = [(IMDCKAbstractSyncController *)self ckUtilities];
  id v5 = [v3 logCollectorAddress];

  int v4 = [(IMDCKAbstractSyncController *)self ckUtilities];
  [v4 reportMOCDebuggingErrorWithString:@"ChangeTokenExpired" internalOnly:1 initialSync:0 sendToHandle:v5 reasonString:@"ChangeTokenExpired"];

  [(IMDCKAttachmentSyncController *)self setLatestSyncToken:0 forSyncType:1];
  [(IMDCKAttachmentSyncController *)self setLatestSyncToken:0 forSyncType:5];
}

- (void)deleteChatBotAttachmentSyncToken
{
  id v2 = [(IMDCKAttachmentSyncController *)self syncTokenStore];
  [v2 persistToken:0 forKey:@"chatBotAttachmentChangeToken"];
}

- (void)_kickOffWriteOnCKQueueWithActivity:(id)a3 completion:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    char v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Kicking off an attachment write after fetching messages", buf, 2u);
    }
  }
  id v9 = [(IMDCKAttachmentSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D9708328;
  block[3] = &unk_1E6B73A60;
  void block[4] = self;
  id v13 = v6;
  id v14 = v7;
  id v10 = v7;
  id v11 = v6;
  dispatch_async(v9, block);
}

- (BOOL)_kickOffWriteIfNeededForSyncType:(int64_t)a3 activity:(id)a4 completion:(id)a5
{
  id v8 = a4;
  id v9 = (void (**)(id, uint64_t, void))a5;
  id v10 = [(IMDCKAttachmentSyncController *)self _ckUtilitiesInstance];
  LODWORD(a3) = [v10 shouldKickOffWriteForSyncType:a3];

  if (!a3)
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v18[0] = 0;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Not writing up messages as sync type does not allow it", (uint8_t *)v18, 2u);
      }
    }
    if (v9) {
      v9[2](v9, 1, 0);
    }
    goto LABEL_16;
  }
  id v11 = [(IMDCKAttachmentSyncController *)self _ckUtilitiesInstance];
  int v12 = [v11 isLocalCachedSaltPresent];

  if (!v12)
  {
    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        int v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Not kicking off a write because cachedSalt is not present.", buf, 2u);
        }
      }
      uint64_t v16 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6D1E8] code:7 userInfo:0];
      ((void (**)(id, uint64_t, void *))v9)[2](v9, 0, v16);
    }
LABEL_16:
    BOOL v13 = 0;
    goto LABEL_17;
  }
  [(IMDCKAttachmentSyncController *)self _kickOffWriteOnCKQueueWithActivity:v8 completion:v9];
  BOOL v13 = 1;
LABEL_17:

  return v13;
}

- (void)_processRecordZoneFetchCompletion:(id)a3 zoneID:(id)a4 clientChangeTokenData:(id)a5 moreComing:(BOOL)a6 shouldWriteBackChanges:(BOOL)a7 desiredKeys:(int64_t)a8 syncType:(int64_t)a9 error:(id)a10 currentBatchCount:(int64_t)a11 maxBatchCount:(int64_t)a12 activity:(id)a13 completionBlock:(id)a14
{
  BOOL v14 = a6;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  unint64_t v45 = (__CFString *)a3;
  uint64_t v42 = (__CFString *)a4;
  id v43 = a5;
  id v18 = (__CFString *)a10;
  id v44 = a13;
  unint64_t v19 = (void (**)(id, void, id))a14;
  if (IMOSLoggingEnabled())
  {
    BOOL v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v66 = v42;
      if (v14) {
        id v21 = @"YES";
      }
      __int16 v67 = 2112;
      uint64_t v68 = v45;
      __int16 v69 = 2112;
      id v70 = v43;
      __int16 v71 = 2112;
      v72 = v21;
      __int16 v73 = 2112;
      id v74 = v18;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "recordZoneChangeTokensUpdatedBlock recordZoneID %@ serverChangeToken %@ clientChangeToken %@ moreComing %@ recordZoneError %@", buf, 0x34u);
    }
  }
  id v22 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
  int v23 = [v22 errorIndicatesZoneNotCreated:v18];

  int v24 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
  int v25 = [v24 errorIndicatesUserDeletedZone:v18];

  int64_t v38 = a12;
  if (v18)
  {
    uint64_t v26 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
    int v27 = [v26 CKPartialError:v18 hasErrorCode:&unk_1F33C5778];

    if (v27)
    {
      if (IMOSLoggingEnabled())
      {
        id v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "We got back a change token has expired for processing the record zone for attachments going to try and fetch again", buf, 2u);
        }
      }
      -[IMDCKAttachmentSyncController clearLocalSyncState:](self, "clearLocalSyncState:", 17, a12);
      if (v19) {
LABEL_38:
      }
        v19[2](v19, 0, v18);
    }
    else
    {
      int v30 = IMOSLoggingEnabled();
      if (!(v23 | v25))
      {
        if (v30)
        {
          uint64_t v37 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v66 = v18;
            _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_INFO, "//---*** Error fetching attachments from CloudKit with error: %@ ---- ***//", buf, 0xCu);
          }
        }
        goto LABEL_38;
      }
      if (v30)
      {
        uint64_t v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          unint64_t v32 = @"zone not created";
          if (v25) {
            unint64_t v32 = @"user deleted zone";
          }
          *(_DWORD *)buf = 138412546;
          id v66 = v32;
          __int16 v67 = 2112;
          uint64_t v68 = v18;
          _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "We got a %@ error while fetching attachments. %@", buf, 0x16u);
        }
      }
      if (v25)
      {
        if (IMOSLoggingEnabled())
        {
          id v33 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "Resetting local attachment sync state & last sync date after received user deleted zone error", buf, 2u);
          }
        }
        -[IMDCKAttachmentSyncController clearLocalSyncState:](self, "clearLocalSyncState:", 3, a12);
        BOOL v34 = [(IMDCKAbstractSyncController *)self ckUtilities];
        [v34 resetLastSyncDate];
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "Attachment zone missing, attempting to create it", buf, 2u);
        }
      }
      id v36 = [(IMDCKAttachmentSyncController *)self ckQueue];
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = sub_1D97091C4;
      v46[3] = &unk_1E6B74B28;
      BOOL v53 = a7;
      v46[4] = self;
      int64_t v49 = a8;
      int64_t v50 = a9;
      int64_t v51 = a11;
      uint64_t v52 = v39;
      id v47 = v44;
      id v48 = v19;
      dispatch_async(v36, v46);
    }
  }
  else
  {
    char v29 = [(IMDCKAttachmentSyncController *)self ckQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D9708C3C;
    block[3] = &unk_1E6B74B00;
    long long v55 = v45;
    long long v56 = self;
    BOOL v63 = v14;
    BOOL v64 = a7;
    int64_t v59 = a9;
    int64_t v60 = a8;
    int64_t v61 = a11;
    int64_t v62 = a12;
    id v57 = v44;
    id v58 = v19;
    dispatch_async(v29, block);
  }
}

- (void)_processModifyPerRecordCallBack:(id)a3 error:(id)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v6 recordID];
      id v10 = [v6 recordChangeTag];
      *(_DWORD *)buf = 138412802;
      id v45 = v9;
      __int16 v46 = 2112;
      id v47 = v10;
      __int16 v48 = 2112;
      id v49 = v7;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Attachment per-record completion %@ changeTag %@ error %@", buf, 0x20u);
    }
  }
  if (v7 && [v7 code] != 16)
  {
    v40[0] = MEMORY[0x1E4F143A8];
    v40[1] = 3221225472;
    v40[2] = sub_1D9709AE4;
    v40[3] = &unk_1E6B73268;
    v40[4] = self;
    dispatch_sync(MEMORY[0x1E4F14428], v40);
    if ([v7 code] == 14)
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "_writeCKRecordsToAttachmentZone had a conflict ", buf, 2u);
        }
      }
      BOOL v14 = [(IMDCKAttachmentSyncController *)self _ckUtilitiesInstance];
      int v15 = [v14 extractServerRecordFromCKServerErrorRecordChanged:v7];

      uint64_t v16 = [(IMDCKAttachmentSyncController *)self ckQueue];
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = sub_1D9709AF4;
      v36[3] = &unk_1E6B73BC8;
      id v37 = v6;
      id v38 = v15;
      uint64_t v39 = self;
      id v17 = v15;
      dispatch_sync(v16, v36);
    }
    else if ([v7 code] == 12 || objc_msgSend(v7, "code") == 35)
    {
      if (IMOSLoggingEnabled())
      {
        id v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Record had invalid arguments, we'll try this record again on the next sync", buf, 2u);
        }
      }
      unint64_t v19 = [(IMDCKAttachmentSyncController *)self ckQueue];
      v34[0] = MEMORY[0x1E4F143A8];
      v34[1] = 3221225472;
      v34[2] = sub_1D9709DF0;
      v34[3] = &unk_1E6B73218;
      v34[4] = self;
      id v35 = v6;
      dispatch_sync(v19, v34);
    }
    else if ([v7 code] == 11)
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Record had unknown error code. Clearing out CK metadata", buf, 2u);
        }
      }
      id v21 = [(IMDCKAttachmentSyncController *)self ckQueue];
      v32[0] = MEMORY[0x1E4F143A8];
      v32[1] = 3221225472;
      v32[2] = sub_1D9709DFC;
      v32[3] = &unk_1E6B73218;
      v32[4] = self;
      id v33 = v6;
      dispatch_sync(v21, v32);
    }
    else
    {
      BOOL v22 = [v7 code] == 26;
      int v23 = IMOSLoggingEnabled();
      if (v22)
      {
        if (v23)
        {
          int v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "We couldn't find the attachment zone for this record so marking the attachment as dirty and clearing the state", buf, 2u);
          }
        }
        int v25 = [(IMDCKAttachmentSyncController *)self ckQueue];
        v30[0] = MEMORY[0x1E4F143A8];
        v30[1] = 3221225472;
        v30[2] = sub_1D9709E0C;
        v30[3] = &unk_1E6B73218;
        v30[4] = self;
        id v31 = v6;
        dispatch_sync(v25, v30);
      }
      else
      {
        if (v23)
        {
          uint64_t v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v45 = v7;
            _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "_writeCKRecordsToAttachmentZone perRecordCompletionBlock encountered an error.  Will try this record again on next sync. %@", buf, 0xCu);
          }
        }
        int v27 = [(IMDCKAttachmentSyncController *)self ckQueue];
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = sub_1D9709E1C;
        v28[3] = &unk_1E6B73218;
        v28[4] = self;
        id v29 = v6;
        dispatch_sync(v27, v28);
      }
    }
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D9709AC0;
    block[3] = &unk_1E6B73268;
    void block[4] = self;
    dispatch_sync(MEMORY[0x1E4F14428], block);
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "_writeCKRecordsToAttachmentZone uploaded record successfully", buf, 2u);
      }
    }
    int v12 = [(IMDCKAttachmentSyncController *)self ckQueue];
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = sub_1D9709AD0;
    v41[3] = &unk_1E6B73218;
    v41[4] = self;
    id v42 = v6;
    dispatch_sync(v12, v41);
  }
}

- (void)_processFetchRecordChangesCompleted:(id)a3 completionBlock:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "_processFetchRecordChangesCompleted error %@", buf, 0xCu);
    }
  }
  if (v6)
  {
    id v9 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
    char v10 = [v9 errorIndicatesZoneNotCreated:v6];

    if (v7) {
      char v11 = v10;
    }
    else {
      char v11 = 1;
    }
    if ((v11 & 1) == 0)
    {
      int v12 = [(IMDCKAttachmentSyncController *)self ckQueue];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = sub_1D9709FE0;
      v13[3] = &unk_1E6B73A10;
      id v15 = v7;
      id v14 = v6;
      dispatch_async(v12, v13);
    }
  }
}

- (void)_processRecordDeletion:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = v3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "_processRecordDeletion deleted record %@", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)_processRecordChanged:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 recordID];
      uint64_t v7 = [MEMORY[0x1E4F6E780] transferGUIDOfRecord:v4];
      *(_DWORD *)buf = 138412546;
      id v14 = v6;
      __int16 v15 = 2112;
      uint64_t v16 = v7;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "_processRecordChanged changed recordID:%@ for attachmentGUID %@", buf, 0x16u);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D970A2D0;
  block[3] = &unk_1E6B73268;
  void block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
  id v8 = [(IMDCKAttachmentSyncController *)self ckQueue];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1D970A2E0;
  v10[3] = &unk_1E6B73218;
  v10[4] = self;
  id v11 = v4;
  id v9 = v4;
  dispatch_sync(v8, v10);
}

- (void)_processRecordZoneChangeTokenUpdated:(id)a3 zoneID:(id)a4 clienChangeToken:(id)a5 syncType:(int64_t)a6
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (IMOSLoggingEnabled())
  {
    BOOL v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v20 = v11;
      __int16 v21 = 2112;
      id v22 = v10;
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "recordZoneChangeTokensUpdatedBlock recordZoneID %@ serverChangeToken %@ clientChangeToken %@", buf, 0x20u);
    }
  }
  id v14 = [(IMDCKAttachmentSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D970A49C;
  block[3] = &unk_1E6B74108;
  void block[4] = self;
  id v17 = v10;
  int64_t v18 = a6;
  id v15 = v10;
  dispatch_sync(v14, block);
}

- (id)_operationErrorForModifyingRecordCompletion:(id)a3
{
  id v4 = a3;
  int v5 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:", &unk_1F33C5790, &unk_1F33C57A8, &unk_1F33C57C0, &unk_1F33C57D8, &unk_1F33C57F0, &unk_1F33C5808, 0);
  id v6 = [(IMDCKAbstractSyncController *)self errorAnalyzer];
  int v7 = [v6 CKPartialError:v4 onlyHasErrorCodes:v5];

  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Modify attachment had errors we can deal with, so treating this as a non error case", buf, 2u);
      }
    }
    id v9 = 0;
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (void)_processModifyRecordCompletion:(id)a3 deletedRecordIDs:(id)a4 error:(id)a5 completionBlock:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v12;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "_processModifyRecordCompletion error: %@", buf, 0xCu);
    }
  }
  id v15 = [(IMDCKAttachmentSyncController *)self _operationErrorForModifyingRecordCompletion:v12];

  if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v10, "count"));
      *(_DWORD *)buf = 138412546;
      id v23 = v17;
      __int16 v24 = 2112;
      uint64_t v25 = v15;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Number of records saved %@ with error %@", buf, 0x16u);
    }
  }
  if (v13)
  {
    int64_t v18 = [(IMDCKAttachmentSyncController *)self ckQueue];
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1D970A86C;
    v19[3] = &unk_1E6B73A10;
    id v21 = v13;
    id v20 = v15;
    dispatch_async(v18, v19);
  }
}

- (void)_processAssetFetchPerRecordProgressBlock:(id)a3 progress:(double)a4
{
  id v6 = a3;
  int v7 = [(IMDCKAttachmentSyncController *)self perTransferProgress];
  if (v7)
  {
    id v8 = [(IMDCKAttachmentSyncController *)self recordIDToTransferMap];
    id v9 = [v8 objectForKey:v6];

    if (v9)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D970A984;
      block[3] = &unk_1E6B74B50;
      id v12 = v7;
      id v11 = v9;
      double v13 = a4;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
  }
}

- (void)_processAssetFetchPerRecordCompletionBlock:(id)a3 recordID:(id)a4 error:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IMDCKAttachmentSyncController *)self recordIDToTransferMap];
  id v12 = [v11 objectForKey:v9];

  if (v12)
  {
    if (IMOSLoggingEnabled())
    {
      double v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = [v12 guid];
        *(_DWORD *)buf = 138412546;
        id v23 = v14;
        __int16 v24 = 2112;
        id v25 = v10;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Asset fetch complete for %@ error %@", buf, 0x16u);
      }
    }
    id v15 = [(IMDCKAttachmentSyncController *)self perTransferProgress];
    uint64_t v16 = v15;
    if (v15)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D970ABDC;
      block[3] = &unk_1E6B73AD8;
      id v21 = v15;
      id v19 = v12;
      id v20 = v10;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    if (v10 && (CKCanRetryForError() & 1) == 0)
    {
      id v17 = +[IMDFileTransferCenter sharedInstance];
      [v17 markTransferAsNotSuccessfullyDownloadedFromCloud:v12];
    }
  }
}

- (void)_processAssetFetchOperationCompletionBlock:(id)a3 removeTombstones:(BOOL)a4 operationID:(id)a5 error:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  v21[0] = 0;
  v21[1] = v21;
  v21[2] = 0x3032000000;
  v21[3] = sub_1D970646C;
  v21[4] = sub_1D970647C;
  id v22 = 0;
  id v12 = a6;
  id v22 = v12;
  double v13 = [(IMDCKAttachmentSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D970AD70;
  block[3] = &unk_1E6B74BC8;
  void block[4] = self;
  id v17 = v10;
  BOOL v20 = a4;
  id v18 = v11;
  id v19 = v21;
  id v14 = v11;
  id v15 = v10;
  dispatch_sync(v13, block);

  _Block_object_dispose(v21, 8);
}

- (id)_recordsToProcessWithError:(id)a3 error:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = v6;
  if (v6 && [v6 code] != 2)
  {
    id v9 = 0;
  }
  else
  {
    id v8 = [v5 allKeys];
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (v7)
    {
      id v10 = [v7 userInfo];
      uint64_t v11 = *MEMORY[0x1E4F19CD8];
      id v12 = [v10 objectForKey:*MEMORY[0x1E4F19CD8]];

      if (v12)
      {
        double v13 = [v7 userInfo];
        id v14 = [v13 objectForKey:v11];
        id v15 = [v14 allKeys];

        uint64_t v16 = [v8 arrayByExcludingObjectsInArray:v15];

        id v8 = (void *)v16;
      }
    }
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v17 = v8;
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
          id v22 = objc_msgSend(v5, "objectForKey:", *(void *)(*((void *)&v24 + 1) + 8 * v21), (void)v24);
          [v9 addObject:v22];

          ++v21;
        }
        while (v19 != v21);
        uint64_t v19 = [v17 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v19);
    }
  }
  return v9;
}

- (void)_removeTransferFromiCloudBackupWithGuid:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[IMDAttachmentStore sharedInstance];
  id v5 = [v4 attachmentWithGUID:v3];

  if (v5 && [v5 cloudKitSyncState] == 1)
  {
    id v6 = [v5 localPath];
    char v12 = 0;
    if (v6
      && ([MEMORY[0x1E4F28CB8] defaultManager],
          int v7 = objc_claimAutoreleasedReturnValue(),
          int v8 = [v7 fileExistsAtPath:v6 isDirectory:&v12],
          v7,
          v8))
    {
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v14 = v6;
          __int16 v15 = 2112;
          id v16 = v3;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Removing icloud backup attribute for path '%@' for %@ from iCloud backups", buf, 0x16u);
        }
      }
      id v10 = +[IMDCKBackupController sharedInstance];
      [v10 removePathFromiCloudBackup:v6];
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v3;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Attachment at path '%@' for %@ not found, NOT removing from iCloud backups", buf, 0x16u);
      }
    }
  }
}

- (void)_updateTransferUsingCKRecord:(id)a3 wasFetched:(BOOL)a4 dispatchToMain:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v27 = 0;
  id v28 = &v27;
  uint64_t v29 = 0x2020000000;
  char v30 = 0;
  uint64_t v21 = 0;
  id v22 = &v21;
  uint64_t v23 = 0x3032000000;
  long long v24 = sub_1D970646C;
  long long v25 = sub_1D970647C;
  id v26 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D970C07C;
  aBlock[3] = &unk_1E6B74BF0;
  uint64_t v18 = &v21;
  id v9 = v8;
  BOOL v20 = v6;
  uint64_t v19 = &v27;
  id v16 = v9;
  uint64_t v17 = self;
  id v10 = (void (**)(void))_Block_copy(aBlock);
  uint64_t v11 = v10;
  if (v5) {
    dispatch_sync(MEMORY[0x1E4F14428], v10);
  }
  else {
    v10[2](v10);
  }
  if (*((unsigned char *)v28 + 24) && [(id)v22[5] length])
  {
    if (IMOSLoggingEnabled())
    {
      char v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = v22[5];
        *(_DWORD *)buf = 138412290;
        uint64_t v32 = v13;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Going to fetch the asset for transfer guid at the end of this batch: %@", buf, 0xCu);
      }
    }
    id v14 = [(IMDCKAttachmentSyncController *)self downloadAssetsForTransferGUIDs];
    [v14 addObject:v22[5]];
  }
  if (v6) {
    [MEMORY[0x1E4F6E780] cleanUpAssetsOnDiskForRecord:v9];
  }

  _Block_object_dispose(&v21, 8);
  _Block_object_dispose(&v27, 8);
}

- (void)_kickOffAssetFetchForTransfersIfNeededWithActivity:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IMDCKAttachmentSyncController *)self ckQueue];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D970C1F4;
  v7[3] = &unk_1E6B73218;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(v5, v7);
}

- (void)_markAttachmentWithROWID:(int64_t)a3 withSyncState:(int64_t)a4
{
}

- (void)_markTransferAsNotBeingAbleToSync:(id)a3
{
  id v3 = a3;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D970C674;
  block[3] = &unk_1E6B73268;
  id v6 = v3;
  id v4 = v3;
  dispatch_sync(MEMORY[0x1E4F14428], block);
}

- (void)_markTransferAsNotBeingAbleToSyncUsingCKRecord:(id)a3
{
  id v3 = [MEMORY[0x1E4F6E780] transferGUIDOfRecord:a3];
  id v4 = v3;
  if (v3)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D970C770;
    block[3] = &unk_1E6B73268;
    id v6 = v3;
    dispatch_sync(MEMORY[0x1E4F14428], block);
  }
}

- (void)_resetAttachmentSyncStateForRecord:(id)a3 toState:(int64_t)a4
{
  id v5 = a3;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D970C860;
  v7[3] = &unk_1E6B74C60;
  id v8 = v5;
  int64_t v9 = a4;
  id v6 = v5;
  dispatch_sync(MEMORY[0x1E4F14428], v7);
}

- (void)_migrateSyncToken
{
  id v2 = [(IMDCKAttachmentSyncController *)self syncTokenStore];
  [v2 migrateKey:@"attachmentZoneChangeToken" fromDatabase:@"/var/mobile/Library/SMS/CloudKitMetaData/AttachmentSyncZoneMetaData.db"];
}

- (id)_changeTokenKeyForSyncType:(int64_t)a3
{
  return @"attachmentZoneChangeToken";
}

- (void)setLatestSyncToken:(id)a3 forSyncType:(int64_t)a4
{
  id v6 = a3;
  id v8 = [(IMDCKAttachmentSyncController *)self syncTokenStore];
  int v7 = [(IMDCKAttachmentSyncController *)self _changeTokenKeyForSyncType:a4];
  [v8 persistToken:v6 forKey:v7];
}

- (id)latestSyncTokenForSyncType:(int64_t)a3
{
  id v5 = [(IMDCKAttachmentSyncController *)self syncTokenStore];
  id v6 = [(IMDCKAttachmentSyncController *)self _changeTokenKeyForSyncType:a3];
  int v7 = [v5 tokenForKey:v6];

  return v7;
}

- (void)deleteAttachmentZone
{
  id v3 = [(IMDCKAttachmentSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D970CAA4;
  block[3] = &unk_1E6B73268;
  void block[4] = self;
  dispatch_async(v3, block);
}

- (void)clearLocalSyncState:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v8[0] = 67109120;
      v8[1] = v3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Clearing local attachments sync state, flags 0x%x", (uint8_t *)v8, 8u);
    }
  }
  if (v3)
  {
    id v6 = [(IMDCKAttachmentSyncController *)self syncTokenStore];
    [v6 persistToken:0 forKey:@"attachmentZoneChangeToken"];

    [(IMDCKAttachmentSyncController *)self deleteChatBotAttachmentSyncToken];
  }
  if ((v3 & 2) != 0)
  {
    int v7 = +[IMDAttachmentStore sharedInstance];
    [v7 markAllAttachmentsAsNeedingCloudKitSync];
  }
  else if ((v3 & 0x10) != 0)
  {
    [(IMDCKAttachmentSyncController *)self _needsToMarkAllAttachmentsAsNeedingSync];
  }
}

- (void)_validateTransferFromCloudKit:(id)a3 localTransfer:(id)a4 validateCompletion:(id)a5
{
  id v8 = (void (**)(id, uint64_t, void *))a5;
  uint64_t v6 = [MEMORY[0x1E4F6E780] validateMD5HashForRecord:a3];
  if (v6)
  {
    int v7 = 0;
  }
  else
  {
    int v7 = [MEMORY[0x1E4F28C58] errorWithDomain:*MEMORY[0x1E4F6D1E8] code:3 userInfo:0];
  }
  v8[2](v8, v6, v7);
}

- (void)_processAndValidateAttachmentRecordsEligibleForPurge:(id)a3 recordIDsToTransfers:(id)a4 capturedWithABC:(BOOL)a5 completion:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [(IMDCKAttachmentSyncController *)self ckQueue];
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D970CDE0;
  block[3] = &unk_1E6B74D00;
  BOOL v22 = a5;
  id v18 = v10;
  id v19 = v11;
  BOOL v20 = self;
  id v21 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  dispatch_sync(v13, block);
}

- (void)_fetchAndValidateFileTransfersFromCloudKit:(id)a3 capturedWithABC:(BOOL)a4 activity:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (v10 && [v10 count])
  {
    [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToUploading];
    uint64_t v13 = [(IMDCKAttachmentSyncController *)self ckQueue];
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D970D8A4;
    block[3] = &unk_1E6B73C18;
    id v16 = v10;
    uint64_t v17 = self;
    id v18 = v11;
    BOOL v20 = v8;
    id v19 = v12;
    dispatch_async(v13, block);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Attempting to fetch a nil file transfers from CloudKit for attachment purging", buf, 2u);
      }
    }
    (*((void (**)(id, BOOL))v12 + 2))(v12, v8);
  }
}

- (id)fileTransferCenter
{
  return +[IMDFileTransferCenter sharedInstance];
}

- (BOOL)__shouldOptimizeAttachmentDefault
{
  return 1;
}

- (id)_constructAttachmentRecordIDUsingTombStoneDictionary:(id)a3
{
  id v4 = [a3 objectForKeyedSubscript:@"recordID"];
  if ([v4 length])
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1A2F8]);
    uint64_t v6 = [(IMDCKAttachmentSyncController *)self _attachmentZoneID];
    int v7 = (void *)[v5 initWithRecordName:v4 zoneID:v6];
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (unint64_t)_attachmentDeleteBatchSize
{
  return 20;
}

- (id)_readNextDeleteAfterRow
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  int v3 = [v2 getValueFromDomain:*MEMORY[0x1E4F6CF00] forKey:@"deleteAfterRow"];

  return v3;
}

- (void)_setNextDeleteAfterRow:(id)a3
{
  int v3 = (void *)MEMORY[0x1E4F6E720];
  id v4 = a3;
  id v5 = [v3 sharedInstance];
  [v5 setValue:v4 forDomain:*MEMORY[0x1E4F6CF00] forKey:@"deleteAfterRow"];
}

- (id)_copyRecordIDsToDeleteWithLimit:(unint64_t)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v19 = [(IMDCKAttachmentSyncController *)self _readNextDeleteAfterRow];
  id v4 = (void *)IMDAttachmentCopyRecordIDsToDeleteAfterRowWithLimit();
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  context = (void *)MEMORY[0x1E016A370]();
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = v4;
  uint64_t v6 = 0;
  uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v23 != v8) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v11 = -[IMDCKAttachmentSyncController _constructAttachmentRecordIDUsingTombStoneDictionary:](self, "_constructAttachmentRecordIDUsingTombStoneDictionary:", v10, context, v19);
        if ([v5 containsObject:v11])
        {
          if (IMOSLoggingEnabled())
          {
            id v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v27 = v11;
              _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Removed duplicate recordID %@ from delete syncing", buf, 0xCu);
            }
          }
        }
        else
        {
          [v5 addObject:v11];
          uint64_t v13 = [v10 objectForKey:@"guid"];
          [v20 setObject:v11 forKey:v13];
        }
        id v14 = [v10 objectForKey:@"ROWID"];
        uint64_t v15 = [v14 longLongValue];

        if (!v6 || v15 > [v6 longLongValue])
        {
          uint64_t v16 = [NSNumber numberWithLongLong:v15];

          uint64_t v6 = (void *)v16;
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v22 objects:v28 count:16];
    }
    while (v7);
  }

  [(IMDCKAttachmentSyncController *)self _setNextDeleteAfterRow:v6];

  return v20;
}

- (void)_deleteAttachmentsWithRecordIDs:(id)a3 completion:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 count])
  {
    [(IMDCKAbstractSyncController *)self setBroadcastedSyncStateToDeleting];
    uint64_t v8 = [(IMDCKAttachmentSyncController *)self CKOperationFactory];
    uint64_t v9 = [v8 deleteAttachmentCKOperationUsingRecordIDstoDelete:v6];

    uint64_t v12 = MEMORY[0x1E4F143A8];
    uint64_t v13 = 3221225472;
    id v14 = sub_1D970E828;
    uint64_t v15 = &unk_1E6B73B28;
    uint64_t v16 = self;
    id v17 = v7;
    [v9 setModifyRecordsCompletionBlock:&v12];
    objc_msgSend(v9, "setPerRecordSaveBlock:", &unk_1F3390D40, v12, v13, v14, v15, v16);
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v19 = v6;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Kicking off deleted of recordIDs %@", buf, 0xCu);
      }
    }
    [(IMDCKAttachmentSyncController *)self _scheduleOperation:v9];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "No GUIDs passed in to delete", buf, 2u);
      }
    }
    (*((void (**)(id, void))v7 + 2))(v7, 0);
  }
}

- (void)syncAttachmentDeletesToCloudKitWithActivity:(id)a3 completion:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  id v31 = (void (**)(void))a4;
  uint64_t v29 = self;
  id v6 = [(IMDCKAttachmentSyncController *)self _ckUtilitiesInstance];
  LOBYTE(self) = [v6 cloudKitSyncingEnabled];

  if (self)
  {
    id v7 = [(IMDCKAttachmentSyncController *)v29 _copyRecordIDsToDeleteWithLimit:[(IMDCKAttachmentSyncController *)v29 _attachmentDeleteBatchSize]];
    if ([v7 count])
    {
      id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v32 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v38 = 0u;
      long long v39 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      id v7 = v7;
      uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v50 count:16];
      if (v9)
      {
        uint64_t v10 = *(void *)v39;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v39 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = *(void *)(*((void *)&v38 + 1) + 8 * i);
            uint64_t v13 = [v7 objectForKey:v12];
            id v14 = +[IMDMessageStore sharedInstance];
            int v15 = [v14 isAttachmentReferencedByMessage:v12];

            uint64_t v16 = v8;
            if (v15)
            {
              int v17 = IMOSLoggingEnabled();
              uint64_t v16 = v32;
              if (v17)
              {
                id v18 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v45 = v12;
                  _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Attachment %@ was to be deleted, but is still being referenced. Fetching instead.", buf, 0xCu);
                }

                uint64_t v16 = v32;
              }
            }
            [v16 addObject:v13];
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v38 objects:v50 count:16];
        }
        while (v9);
      }

      if (IMOSLoggingEnabled())
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = [v7 count];
          uint64_t v21 = [v32 count];
          uint64_t v22 = [v8 count];
          *(_DWORD *)buf = 134218496;
          uint64_t v45 = v20;
          __int16 v46 = 2048;
          uint64_t v47 = v21;
          __int16 v48 = 2048;
          uint64_t v49 = v22;
          _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Got %lu recordIDs queued for delete processing which split sa %lu records to RE-fetch and  %lu to delete", buf, 0x20u);
        }
      }
      long long v23 = [(IMDCKAttachmentSyncController *)v29 ckQueue];
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D970F054;
      block[3] = &unk_1E6B74E30;
      void block[4] = v29;
      id v34 = v8;
      id v37 = v31;
      id v35 = v32;
      id v36 = v30;
      id v24 = v32;
      id v25 = v8;
      dispatch_async(v23, block);
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "No pending messages to delete/fetch from CloudKit", buf, 2u);
        }
      }
      IMDAttachmentRecordClearDeleteTombStones();
      if (v31) {
        v31[2]();
      }
    }
    goto LABEL_32;
  }
  if (IMOSLoggingEnabled())
  {
    id v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Cloudkit sync is not enabled. Not deleting attachments", buf, 2u);
    }
  }
  id v27 = v31;
  if (v31)
  {
    v42[0] = MEMORY[0x1E4F143A8];
    v42[1] = 3221225472;
    v42[2] = sub_1D970F03C;
    v42[3] = &unk_1E6B731C8;
    id v43 = v31;
    dispatch_async(MEMORY[0x1E4F14428], v42);
    id v7 = v43;
LABEL_32:

    id v27 = v31;
  }
}

- (BOOL)isDoingDeleteRecoverySync
{
  return self->_isDoingDeleteRecoverySync;
}

- (void)setIsDoingDeleteRecoverySync:(BOOL)a3
{
  self->_isDoingDeleteRecoverySync = a3;
}

- (OS_dispatch_queue)ckQueue
{
  return self->_ckQueue;
}

- (void)setCkQueue:(id)a3
{
}

- (IMDRecordZoneManager)recordZoneManager
{
  return self->_recordZoneManager;
}

- (void)setRecordZoneManager:(id)a3
{
}

- (IMDCKAttachmentSyncCKOperationFactory)CKOperationFactory
{
  return self->_CKOperationFactory;
}

- (void)setCKOperationFactory:(id)a3
{
}

- (SyncTokenStoreProviding)syncTokenStore
{
  return self->_syncTokenStore;
}

- (void)setSyncTokenStore:(id)a3
{
}

- (NSMutableDictionary)completionBlocksForAssetFetchOperations
{
  return self->_completionBlocksForAssetFetchOperations;
}

- (void)setCompletionBlocksForAssetFetchOperations:(id)a3
{
}

- (NSMutableDictionary)recordIDToTransferMap
{
  return self->_recordIDToTransferMap;
}

- (void)setRecordIDToTransferMap:(id)a3
{
}

- (id)perTransferProgress
{
  return self->_perTransferProgress;
}

- (void)setPerTransferProgress:(id)a3
{
}

- (BOOL)assetDownloadInProgress
{
  return self->_assetDownloadInProgress;
}

- (void)setAssetDownloadInProgress:(BOOL)a3
{
  self->_assetDownloadInProgress = a3;
}

- (NSMutableArray)downloadAssetsForTransferGUIDs
{
  return self->_downloadAssetsForTransferGUIDs;
}

- (void)setDownloadAssetsForTransferGUIDs:(id)a3
{
}

- (unint64_t)deviceConditionsToCheck
{
  return self->_deviceConditionsToCheck;
}

- (void)setDeviceConditionsToCheck:(unint64_t)a3
{
  self->_deviceConditionsToChecuint64_t k = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_downloadAssetsForTransferGUIDs, 0);
  objc_storeStrong(&self->_perTransferProgress, 0);
  objc_storeStrong((id *)&self->_recordIDToTransferMap, 0);
  objc_storeStrong((id *)&self->_completionBlocksForAssetFetchOperations, 0);
  objc_storeStrong((id *)&self->_syncTokenStore, 0);
  objc_storeStrong((id *)&self->_CKOperationFactory, 0);
  objc_storeStrong((id *)&self->_recordZoneManager, 0);

  objc_storeStrong((id *)&self->_ckQueue, 0);
}

@end