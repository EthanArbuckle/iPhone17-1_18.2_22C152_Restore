@interface IMDAttachmentStore
+ (BOOL)_cloudkitSyncingEnabled;
+ (BOOL)_filesystemIsCaseSensitiveWithPath:(id)a3;
+ (BOOL)fileEligibleForCacheDelete:(id)a3;
+ (BOOL)updateTransferIn:(id)a3 fromGUID:(id)a4 toGUID:(id)a5;
+ (IMDAttachmentStore)sharedInstance;
+ (void)_askToTapToRadarForErrorString:(id)a3 path:(id)a4;
- (BOOL)_shouldEarlyReturnForWrongItemType:(id)a3;
- (BOOL)_shouldMarkAllAttachmentsAsNeedingSync;
- (BOOL)_shouldMarkAttachmentsAsNeedingReupload;
- (BOOL)_updateAttachmentGUID:(id)a3 withGUID:(id)a4;
- (BOOL)deleteAttachmentDataForTransfer:(id)a3;
- (BOOL)deleteAttachmentWithGUID:(id)a3;
- (BOOL)deleteAttachmentsForMessage:(id)a3;
- (BOOL)deleteAttachmentsWithGUIDs:(id)a3;
- (BOOL)isSafeToDeleteAttachmentAtPath:(id)a3;
- (BOOL)removeAttachment:(id)a3 fromMessageWithGUID:(id)a4;
- (BOOL)storeAttachment:(id)a3 associateWithMessageWithGUID:(id)a4;
- (BOOL)storeAttachment:(id)a3 associateWithMessageWithGUID:(id)a4 chatGUID:(id)a5 storeAtExternalLocation:(BOOL)a6;
- (BOOL)updateAttachment:(id)a3;
- (BOOL)updateAttachment:(id)a3 chatGUID:(id)a4 storeAtExternalPath:(BOOL)a5;
- (BOOL)updateTemporaryTransferGUIDsIfNeeded:(id)a3 transfersToSync:(id)a4;
- (BOOL)updateTemporaryTransferGUIDsOn:(id)a3 andUpdateMessageIfNeeded:(id)a4 transfersToSync:(id)a5;
- (BOOL)updateTemporaryTransferGUIDsOnMessageIfNeeded:(id)a3;
- (NSNumber)afterRow;
- (_IMDAttachmentRecordStruct)_loadAttachmentRecordForGUID:(id)a3;
- (id)_alternateAttachmentPathIfExists:(id)a3;
- (id)_newFileTransferFromIMDAttachmentRecordRef:(_IMDAttachmentRecordStruct *)a3;
- (id)_permanentTransferGUIDForExistingTransferWithTemporaryGUID:(id)a3;
- (id)_permanentTransferGUIDForTransfer:(id)a3 inItem:(id)a4;
- (id)_recordZoneIDForFilter:(unint64_t)a3;
- (id)_updateAttachmentGUIDIfNeededAndReturnTransfersMarkedWithFailStatus:(id)a3 transfersToSyncRowIDs:(id)a4;
- (id)attachmentWithGUID:(id)a3;
- (id)attachmentsFilteredUsingPredicate:(id)a3 limit:(unint64_t)a4;
- (id)attachmentsWithGUIDs:(id)a3;
- (id)batchOfRecordIDsToDeleteWithLimit:(int64_t)a3 error:(id *)a4;
- (id)batchOfRecordsMissingAssetsAfterRow:(id *)a3 withLimit:(int64_t)a4;
- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5;
- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 recurseCount:(int)a5 error:(id *)a6;
- (id)database;
- (id)fileTransferWithAttachmentRecordRef:(_IMDAttachmentRecordStruct *)a3;
- (id)messageForTransferGUID:(id)a3 shouldLoadAttachments:(BOOL)a4;
- (id)syncTokenStore;
- (int64_t)_attachmentQueryForFilter:(unint64_t)a3;
- (void)_hasMarkedAllAttachmentsAsNeedingSync;
- (void)_markAllFailedAttachmentsAsNeedingSync;
- (void)_markAttachmentWithROWID:(id)a3 withSyncState:(int64_t)a4;
- (void)_markTransferAsNotBeingAbleToSyncWithGUID:(id)a3;
- (void)_needsToMarkAllAttachmentsAsNeedingSync;
- (void)_reindexMessageGUIDs:(id)a3 reason:(int64_t)a4 completion:(id)a5;
- (void)_removeTransferFromiCloudBackupWithGuid:(id)a3;
- (void)_resetAttachmentSyncStateForGUID:(id)a3 newSyncState:(int64_t)a4;
- (void)clearLocalSyncState:(unint64_t)a3;
- (void)clearTombstonesForRecordIDs:(id)a3;
- (void)deleteAttachmentSyncToken;
- (void)deleteAttachmentsDirectWithPredicate:(id)a3;
- (void)markAllAttachmentsAsNeedingCloudKitSync;
- (void)markAllAttachmentsAsNotPurgeable;
- (void)markAttachment:(id)a3 purgeable:(BOOL)a4;
- (void)markAttachmentPurgeable:(id)a3;
- (void)markAttachmentUnpurgeable:(id)a3;
- (void)markFile:(id)a3 asPurgeable:(BOOL)a4;
- (void)markTransferAsNotSuccessfullyDownloadedWithGUID:(id)a3;
- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5;
- (void)recordUpdateSucceededWithRecord:(id)a3;
- (void)resetFetchState;
- (void)resetFetchStateForAssets;
- (void)resetLocalSyncStateIfAppropriate;
- (void)setAfterRow:(id)a3;
- (void)updateAssetUsingRecord:(id)a3;
@end

@implementation IMDAttachmentStore

- (NSNumber)afterRow
{
  return (NSNumber *)objc_getAssociatedObject(self, sel_afterRow);
}

- (void)setAfterRow:(id)a3
{
}

- (void)resetFetchState
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v4 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Resetting fetch state (afterRow to nil)", v4, 2u);
    }
  }
  [(IMDAttachmentStore *)self setAfterRow:0];
}

- (id)syncTokenStore
{
  if (qword_1EA8CA438 != -1) {
    dispatch_once(&qword_1EA8CA438, &unk_1F33908E0);
  }
  v2 = (void *)qword_1EA8CA430;

  return v2;
}

- (void)resetLocalSyncStateIfAppropriate
{
  if ([(IMDAttachmentStore *)self _shouldMarkAllAttachmentsAsNeedingSync])
  {
    [(IMDAttachmentStore *)self clearLocalSyncState:3];
    [(IMDAttachmentStore *)self _hasMarkedAllAttachmentsAsNeedingSync];
  }

  [(IMDAttachmentStore *)self _markAllFailedAttachmentsAsNeedingSync];
}

- (void)clearLocalSyncState:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v6[0] = 67109120;
      v6[1] = v3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Clearing local attachments sync state, flags 0x%x", (uint8_t *)v6, 8u);
    }
  }
  if (v3) {
    [(IMDAttachmentStore *)self deleteAttachmentSyncToken];
  }
  if ((v3 & 2) != 0)
  {
    [(IMDAttachmentStore *)self markAllAttachmentsAsNeedingCloudKitSync];
  }
  else if ((v3 & 0x10) != 0)
  {
    [(IMDAttachmentStore *)self _needsToMarkAllAttachmentsAsNeedingSync];
  }
}

- (BOOL)_shouldMarkAttachmentsAsNeedingReupload
{
  v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  int v3 = [v2 getValueFromDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CAC8]];

  if (v3)
  {
    v4 = (void *)MEMORY[0x1E4F1C9C8];
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
  BOOL v2 = [(IMDAttachmentStore *)self _shouldMarkAttachmentsAsNeedingReupload];
  int v3 = IMOSLoggingEnabled();
  if (v2)
  {
    if (v3)
    {
      v4 = OSLogHandleForIMFoundationCategory();
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

- (void)deleteAttachmentSyncToken
{
  id v2 = [(IMDAttachmentStore *)self syncTokenStore];
  [v2 persistToken:0 forKey:@"attachmentZoneChangeToken"];
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
      double v7 = @"NO";
      if (v4) {
        double v7 = @"YES";
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

- (void)_markAttachmentWithROWID:(id)a3 withSyncState:(int64_t)a4
{
  [a3 longLongValue];

  IMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState();
}

- (id)_updateAttachmentGUIDIfNeededAndReturnTransfersMarkedWithFailStatus:(id)a3 transfersToSyncRowIDs:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v25 = a4;
  id v24 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v6;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v8)
  {
    uint64_t v10 = 0;
    uint64_t v26 = *(void *)v28;
    *(void *)&long long v9 = 138412546;
    long long v23 = v9;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v26) {
          objc_enumerationMutation(v7);
        }
        v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        v13 = objc_msgSend(v12, "guid", v23);
        v14 = [v12 guid];
        v15 = [(IMDAttachmentStore *)self messageForTransferGUID:v14 shouldLoadAttachments:1];

        if (v15)
        {
          if ([(IMDAttachmentStore *)self updateTemporaryTransferGUIDsOn:v12 andUpdateMessageIfNeeded:v15 transfersToSync:v7])
          {
            if (IMOSLoggingEnabled())
            {
              v16 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                v17 = [v12 guid];
                *(_DWORD *)buf = v23;
                v32 = v13;
                __int16 v33 = 2112;
                v34 = v17;
                _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Fixed up guid for transfer old guid: %@ new guid: %@", buf, 0x16u);
              }
            }
          }
          else if (IMFileTransferGUIDIsTemporary())
          {
            v20 = [v25 objectAtIndexedSubscript:v10 + i];
            if (IMOSLoggingEnabled())
            {
              v21 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v23;
                v32 = v13;
                __int16 v33 = 2112;
                v34 = v20;
                _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "******** Marking attachment as failed to upload, as we could not update it's guid %@ (rowid %@)", buf, 0x16u);
              }
            }
            [(IMDAttachmentStore *)self _markAttachmentWithROWID:v20 withSyncState:2];
            [v24 addObject:v12];
          }
        }
        else
        {
          v18 = [v25 objectAtIndexedSubscript:v10 + i];
          if (IMOSLoggingEnabled())
          {
            v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v23;
              v32 = v13;
              __int16 v33 = 2112;
              v34 = v18;
              _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "******** Marking attachment %@ (rowid %@) as forever failed to upload, as we could not find an associated message", buf, 0x16u);
            }
          }
          [(IMDAttachmentStore *)self _markAttachmentWithROWID:v18 withSyncState:64];
          [v24 addObject:v12];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v35 count:16];
      v10 += i;
    }
    while (v8);
  }

  return v24;
}

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5
{
  return [(IMDAttachmentStore *)self batchOfRecordsToWriteWithFilter:a3 limit:a4 recurseCount:0 error:a5];
}

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 recurseCount:(int)a5 error:(id *)a6
{
  v102[2] = *MEMORY[0x1E4F143B8];
  -[IMDAttachmentStore _attachmentQueryForFilter:](self, "_attachmentQueryForFilter:");
  v69 = self;
  id v7 = [(IMDAttachmentStore *)self afterRow];
  uint64_t v8 = (void *)IMDAttachmentRecordCopyAttachmentsForQueryWithLimit();

  v68 = v8;
  uint64_t v9 = [v8 count];
  if (v9)
  {
    uint64_t v72 = v9;
    id v76 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v75 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v77 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v10 = [(IMDAttachmentStore *)v69 afterRow];
    long long v88 = 0u;
    long long v89 = 0u;
    long long v86 = 0u;
    long long v87 = 0u;
    id v11 = v8;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v86 objects:v100 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v87;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v87 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = *(void **)(*((void *)&v86 + 1) + 8 * i);
          id v16 = IMFileTransferFromIMDAttachmentRecordRef(v15);
          uint64_t v17 = [v15 rowID];
          if (!v10 || [v10 longLongValue] < v17)
          {
            uint64_t v18 = [NSNumber numberWithLongLong:v17];

            uint64_t v10 = (void *)v18;
          }
          if (v16)
          {
            [v76 addObject:v16];
            v19 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v15, "rowID"));
            [v75 addObject:v19];

            v20 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v15, "rowID"));
            v21 = [v16 guid];
            [v77 setObject:v20 forKey:v21];
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              v22 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                uint64_t v23 = [v15 rowID];
                *(_DWORD *)buf = 134217984;
                uint64_t v97 = v23;
                _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "**** failed to create IMFileTransfer from IMDAttachmentRecordRef rowid: %lld, marking as failed to upload ***", buf, 0xCu);
              }
            }
            [v15 rowID];
            IMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState();
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v86 objects:v100 count:16];
      }
      while (v12);
    }

    [(IMDAttachmentStore *)v69 setAfterRow:v10];
    if (IMOSLoggingEnabled())
    {
      id v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        uint64_t v25 = [v76 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v97 = v72;
        __int16 v98 = 2048;
        uint64_t v99 = v25;
        _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Got %lu dirty results to sync, filtered to %lu", buf, 0x16u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Fixing up attachment GUIDs if needed", buf, 2u);
      }
    }
    id v66 = [(IMDAttachmentStore *)v69 _updateAttachmentGUIDIfNeededAndReturnTransfersMarkedWithFailStatus:v76 transfersToSyncRowIDs:v75];
    if ([v66 count])
    {
      if (IMOSLoggingEnabled())
      {
        long long v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Removing attachments that failed guid conversion", buf, 2u);
        }
      }
      [v76 removeObjectsInArray:v66];
      long long v84 = 0u;
      long long v85 = 0u;
      long long v82 = 0u;
      long long v83 = 0u;
      id v28 = v76;
      uint64_t v29 = [v28 countByEnumeratingWithState:&v82 objects:v95 count:16];
      if (v29)
      {
        uint64_t v30 = *(void *)v83;
        do
        {
          for (uint64_t j = 0; j != v29; ++j)
          {
            if (*(void *)v83 != v30) {
              objc_enumerationMutation(v28);
            }
            uint64_t v32 = *(void *)(*((void *)&v82 + 1) + 8 * j);
            if (IMOSLoggingEnabled())
            {
              __int16 v33 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v97 = v32;
                _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "Transfer to sync %@ ", buf, 0xCu);
              }
            }
          }
          uint64_t v29 = [v28 countByEnumeratingWithState:&v82 objects:v95 count:16];
        }
        while (v29);
      }
    }
    v74 = [(IMDAttachmentStore *)v69 _recordZoneIDForFilter:a3];
    v34 = +[IMDCKRecordSaltManager sharedInstance];
    v73 = [v34 cachedSalt];

    id v70 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([v76 count])
    {
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
      long long v80 = 0u;
      long long v81 = 0u;
      long long v78 = 0u;
      long long v79 = 0u;
      obuint64_t j = v76;
      uint64_t v36 = [obj countByEnumeratingWithState:&v78 objects:v94 count:16];
      if (!v36) {
        goto LABEL_66;
      }
      uint64_t v37 = *(void *)v79;
      while (1)
      {
        for (uint64_t k = 0; k != v36; ++k)
        {
          if (*(void *)v79 != v37) {
            objc_enumerationMutation(obj);
          }
          v39 = *(void **)(*((void *)&v78 + 1) + 8 * k);
          v40 = (void *)[v39 copyCKRecordRepresentationWithZoneID:v74 salt:v73];
          v41 = v40;
          if (v40)
          {
            v42 = [v40 recordID];
            v43 = [v42 recordName];
            char v44 = [v35 containsObject:v43];

            if (v44) {
              goto LABEL_64;
            }
            v45 = [v39 guid];
            [v70 setObject:v41 forKey:v45];

            v46 = [v41 recordID];
            v47 = [v46 recordName];
            [v35 addObject:v47];
          }
          else
          {
            v48 = [v39 guid];
            v49 = [v77 objectForKey:v48];
            uint64_t v50 = [v49 longLongValue];

            if (v50)
            {
              if (IMOSLoggingEnabled())
              {
                v51 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
                {
                  v52 = [v39 guid];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v97 = (uint64_t)v52;
                  __int16 v98 = 2048;
                  uint64_t v99 = v50;
                  _os_log_impl(&dword_1D967A000, v51, OS_LOG_TYPE_INFO, "**** failed to create CKRecord from IMTransfer guid %@, marking row %lld as failed to upload ***", buf, 0x16u);
                }
              }
              IMDAttachmentRecordMarkAttachmentWithROWIDWithSyncState();
            }
            else
            {
              v53 = IMLogHandleForCategory();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_ERROR)) {
                sub_1D98FE564(v92, v39, &v93, v53);
              }
            }
            v46 = [MEMORY[0x1E4F6E890] sharedInstance];
            [v46 forceAutoBugCaptureWithSubType:@"NullCKRecordForIMFileTransfer" errorPayload:0 type:@"MiCSync" context:@"Failed to generate CKRecord for IMFileTransfer"];
          }

LABEL_64:
        }
        uint64_t v36 = [obj countByEnumeratingWithState:&v78 objects:v94 count:16];
        if (!v36)
        {
LABEL_66:

          break;
        }
      }
    }
    if ([v70 count])
    {
      if (a5 >= 1)
      {
        v54 = [MEMORY[0x1E4F6E890] sharedInstance];
        v90[0] = *MEMORY[0x1E4F6D8E0];
        v55 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v70, "count"));
        v91[0] = v55;
        v90[1] = *MEMORY[0x1E4F6D8E8];
        v56 = [NSNumber numberWithInt:a5];
        v91[1] = v56;
        v57 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v91 forKeys:v90 count:2];
        [v54 trackEvent:*MEMORY[0x1E4F6D8F0] withDictionary:v57];
      }
      v58 = v70;
      id v59 = v70;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v61 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v61, OS_LOG_TYPE_INFO, "*** All the records we fetched to write had problems, fetching next batch ***", buf, 2u);
        }
      }
      id v59 = [(IMDAttachmentStore *)v69 batchOfRecordsToWriteWithFilter:a3 limit:a4 recurseCount:(a5 + 1) error:a6];
      v58 = v70;
    }

    goto LABEL_79;
  }
  if (a5 >= 1)
  {
    id v76 = [MEMORY[0x1E4F6E890] sharedInstance];
    uint64_t v60 = *MEMORY[0x1E4F6D8E8];
    v101[0] = *MEMORY[0x1E4F6D8E0];
    v101[1] = v60;
    v102[0] = &unk_1F33C5718;
    id v75 = [NSNumber numberWithInt:a5];
    v102[1] = v75;
    id v77 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v102 forKeys:v101 count:2];
    [v76 trackEvent:*MEMORY[0x1E4F6D8F0] withDictionary:v77];
    id v59 = 0;
LABEL_79:

    goto LABEL_80;
  }
  id v59 = 0;
LABEL_80:

  return v59;
}

- (id)_recordZoneIDForFilter:(unint64_t)a3
{
  int v4 = +[IMDRecordZoneManager sharedInstance];
  id v5 = v4;
  if (a3 == 4) {
    [v4 chatBotAttachmentRecordZoneID];
  }
  else {
  id v6 = [v4 attachmentRecordZoneID];
  }

  return v6;
}

- (int64_t)_attachmentQueryForFilter:(unint64_t)a3
{
  if (a3 == 4) {
    return 3;
  }
  else {
    return 1;
  }
}

- (void)recordUpdateSucceededWithRecord:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDCKAttachmentSyncController sharedInstance];
  [v4 _updateTransferUsingCKRecord:v3 wasFetched:0 dispatchToMain:0];
}

- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F6EA68] sharedInstance];
  id v11 = (void *)[v8 copy];
  if (![v10 wasRecordAlreadyChanged:v9])
  {
    if ([v10 wasAssetNotAvailable:v9])
    {
      if (IMOSLoggingEnabled())
      {
        id v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Asset was not available marking transfer as unsuccessully synced", buf, 2u);
        }
      }
LABEL_14:
      [(IMDAttachmentStore *)self _markTransferAsNotBeingAbleToSyncWithGUID:v11];
      goto LABEL_32;
    }
    if ([v10 wasUnknownItem:v9])
    {
      uint64_t v25 = self;
      uint64_t v26 = v11;
      uint64_t v27 = 2;
    }
    else
    {
      if (![v10 wasZoneNotFound:v9])
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Record failed with unhandled error will try this record again on next sync", buf, 2u);
          }
        }
        goto LABEL_14;
      }
      uint64_t v25 = self;
      uint64_t v26 = v11;
      uint64_t v27 = 0;
    }
    [(IMDAttachmentStore *)v25 _resetAttachmentSyncStateForGUID:v26 newSyncState:v27];
    goto LABEL_32;
  }
  uint64_t v12 = +[IMDCKUtilities sharedInstance];
  uint64_t v13 = [v12 extractServerRecordFromCKServerErrorRecordChanged:v9];

  v14 = [v7 recordName];
  v15 = [v13 recordID];
  id v16 = [v15 recordName];
  uint64_t v17 = v7;
  int v18 = [v14 isEqualToString:v16];

  if (v18)
  {
    v19 = [MEMORY[0x1E4F6E780] transferGUIDOfRecord:v13];
    int v20 = [v11 isEqualToString:v19];
    int v21 = IMOSLoggingEnabled();
    if (v20)
    {
      id v7 = v17;
      if (v21)
      {
        v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Server's GUID matched local GUID; aligning with the server's data",
            buf,
            2u);
        }
      }
      uint64_t v23 = +[IMDCKAttachmentSyncController sharedInstance];
      [v23 _updateTransferUsingCKRecord:v13 wasFetched:0 dispatchToMain:0];
    }
    else
    {
      id v7 = v17;
      if (v21)
      {
        v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v36 = v19;
          __int16 v37 = 2112;
          v38 = v11;
          _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "On conflict, the server record's GUID (%@) was different than the record we tried to update with GUID (%@); "
            "marking local attachment as synced, to skip to",
            buf,
            0x16u);
        }
      }
      IMDAttachmentRecordRowIDForGUID();
      IMDAttachmentRecordMarkAttachmentWithROWIDAsSyncedWithCloudKit();
    }
  }
  else
  {
    id v7 = v17;
    if (IMOSLoggingEnabled())
    {
      id v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        __int16 v33 = [v13 recordID];
        uint64_t v29 = [v33 recordName];
        uint64_t v30 = [v17 recordName];
        *(_DWORD *)buf = 138412546;
        uint64_t v36 = v29;
        __int16 v37 = 2112;
        v38 = v30;
        _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Conflicting serverRecord was different than the one being updated (server: %@, local: %@)", buf, 0x16u);
      }
    }
    [(IMDAttachmentStore *)self _resetAttachmentSyncStateForGUID:v11 newSyncState:2];
  }

LABEL_32:
}

- (void)_resetAttachmentSyncStateForGUID:(id)a3 newSyncState:(int64_t)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(IMDAttachmentStore *)self attachmentWithGUID:v6];
  id v8 = v7;
  if (v7)
  {
    [v7 setCloudKitServerChangeTokenBlob:0];
    [v8 setCloudKitRecordID:0];
    [v8 setCloudKitSyncState:a4];
    [(IMDAttachmentStore *)self updateAttachment:v8];
  }
  else if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Tried to clear sync state for a transfer with guid (%@), transfer not found on disk", (uint8_t *)&v10, 0xCu);
    }
  }
}

- (void)_markTransferAsNotBeingAbleToSyncWithGUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDAttachmentStore *)self attachmentWithGUID:v4];
  id v6 = v5;
  if (v5)
  {
    [v5 setCloudKitSyncState:2];
    [(IMDAttachmentStore *)self updateAttachment:v6];
  }
  else if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Could not find transfer for guid (%@) to mark as not synced successfully", (uint8_t *)&v8, 0xCu);
    }
  }
}

+ (IMDAttachmentStore)sharedInstance
{
  if (qword_1EBE2B898 != -1) {
    dispatch_once(&qword_1EBE2B898, &unk_1F3391820);
  }
  return (IMDAttachmentStore *)qword_1EBE2B9D0;
}

- (BOOL)storeAttachment:(id)a3 associateWithMessageWithGUID:(id)a4
{
  return [(IMDAttachmentStore *)self storeAttachment:a3 associateWithMessageWithGUID:a4 chatGUID:0 storeAtExternalLocation:0];
}

- (BOOL)storeAttachment:(id)a3 associateWithMessageWithGUID:(id)a4 chatGUID:(id)a5 storeAtExternalLocation:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v11 = (void *)MEMORY[0x1E016A370](self, a2);
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      uint64_t v25 = (uint64_t)a3;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Request to store transfer: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  id v13 = -[IMDAttachmentStore attachmentWithGUID:](self, "attachmentWithGUID:", [a3 guid]);
  if (v13)
  {
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        uint64_t v25 = (uint64_t)v13;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "  => Updating existing : %@", (uint8_t *)&v24, 0xCu);
      }
    }
    BOOL v15 = [(IMDAttachmentStore *)self updateAttachment:a3 chatGUID:a5 storeAtExternalPath:v6];
    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  id v16 = (void *)IMDAttachmentRecordRefFromIMFileTransfer(a3, (uint64_t)a5, v6);
  uint64_t v17 = v16;
  if (!v16)
  {
    BOOL v15 = 0;
    if (!a4) {
      goto LABEL_20;
    }
    goto LABEL_15;
  }
  id v18 = IMFileTransferFromIMDAttachmentRecordRef(v16);
  if (IMOSLoggingEnabled())
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      uint64_t v25 = (uint64_t)v18;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "  => Created new : %@", (uint8_t *)&v24, 0xCu);
    }
  }
  BOOL v15 = v18 != 0;

  CFRelease(v17);
  if (a4)
  {
LABEL_15:
    if (([a3 isAuxVideo] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        int v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = [a3 guid];
          int v24 = 138412546;
          uint64_t v25 = v21;
          __int16 v26 = 2112;
          id v27 = a4;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "  ** Associated transfer GUID %@ with message GUID: %@", (uint8_t *)&v24, 0x16u);
        }
      }
      [a3 guid];
      IMDMessageRecordAssociateMessageWithGUIDToAttachmentWithGUID();
    }
  }
LABEL_20:

  if ([a3 isAuxVideo])
  {
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      BOOL v15 = 1;
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412290;
        uint64_t v25 = (uint64_t)a3;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Over ridiing return val in storeAttachment for Aux transfer %@", (uint8_t *)&v24, 0xCu);
      }
    }
    else
    {
      return 1;
    }
  }
  return v15;
}

- (BOOL)removeAttachment:(id)a3 fromMessageWithGUID:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v7 = (void *)MEMORY[0x1E016A370](self, a2);
  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      id v13 = a3;
      __int16 v14 = 2112;
      id v15 = a4;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Request to unassociate transfer: %@ from message guid: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  id v9 = -[IMDAttachmentStore attachmentWithGUID:](self, "attachmentWithGUID:", [a3 guid]);
  id v10 = v9;
  [a3 guid];
  IMDMessageRecordUnassociateMessageWithGUIDFromAttachmentWithGUID();

  return 0;
}

- (BOOL)updateAttachment:(id)a3
{
  return [(IMDAttachmentStore *)self updateAttachment:a3 chatGUID:0 storeAtExternalPath:0];
}

- (BOOL)updateAttachment:(id)a3 chatGUID:(id)a4 storeAtExternalPath:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v9 = (void *)MEMORY[0x1E016A370](self, a2);
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = a3;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Request to update transfer: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  [a3 guid];
  id v11 = (const void *)IMDAttachmentRecordCopyAttachmentForGUID();
  id v12 = [(IMDAttachmentStore *)self fileTransferWithAttachmentRecordRef:v11];
  int v13 = IMOSLoggingEnabled();
  if (v12)
  {
    if (v13)
    {
      __int16 v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412546;
        id v19 = v12;
        __int16 v20 = 2112;
        id v21 = a3;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "  => Updating existing: %@ with: %@", (uint8_t *)&v18, 0x16u);
      }
    }
    IMDUpdateIMFileTransferFromIMFileTransfer(v12, v11, a3, v5, (uint64_t)a4);
    BOOL v15 = 1;
    if (!v11) {
      goto LABEL_15;
    }
LABEL_14:
    CFRelease(v11);
    goto LABEL_15;
  }
  if (v13)
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "  => Found no transfer, storing instead", (uint8_t *)&v18, 2u);
    }
  }
  BOOL v15 = [(IMDAttachmentStore *)self storeAttachment:a3 associateWithMessageWithGUID:0 chatGUID:a4 storeAtExternalLocation:v5];
  if (v11) {
    goto LABEL_14;
  }
LABEL_15:
  return v15;
}

- (void)markFile:(id)a3 asPurgeable:(BOOL)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    if (a4)
    {
      if (!+[IMDAttachmentStore fileEligibleForCacheDelete:a3])
      {
        if (IMOSLoggingEnabled())
        {
          BOOL v5 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
          {
            int v10 = 138412290;
            id v11 = a3;
            BOOL v6 = "%@ not eligible for cache delete";
            id v7 = v5;
            uint32_t v8 = 12;
LABEL_10:
            _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, v6, (uint8_t *)&v10, v8);
            return;
          }
        }
        return;
      }
    }
    else if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C360], "sharedInstance"), "isInternalInstall"))
    {
      IMLogBacktrace();
      +[IMDAttachmentStore _askToTapToRadarForErrorString:@"SingleFile" path:a3];
    }
    MEMORY[0x1F4181798](a3, sel_im_markFileAsPurgeable_);
    return;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      BOOL v6 = "No attachment path to mark as purgable";
      id v7 = v9;
      uint32_t v8 = 2;
      goto LABEL_10;
    }
  }
}

+ (BOOL)_cloudkitSyncingEnabled
{
  id v2 = +[IMDCKUtilities sharedInstance];

  return [(IMDCKUtilities *)v2 cloudKitSyncingEnabled];
}

+ (BOOL)fileEligibleForCacheDelete:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (([a1 _cloudkitSyncingEnabled] & 1) == 0)
  {
    int v6 = IMOSLoggingEnabled();
    if (!v6) {
      return v6;
    }
    id v7 = OSLogHandleForIMFoundationCategory();
    int v6 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
    if (!v6) {
      return v6;
    }
    LOWORD(v16) = 0;
    uint32_t v8 = "Not marking path as eligible for cachedelete, cloudkit syncing is not on";
    id v9 = v7;
    uint32_t v10 = 2;
    goto LABEL_8;
  }
  id v4 = (void *)[a3 lastPathComponent];
  if (![v4 isEqualToString:@"Attachments"])
  {
    if (![v4 containsString:*MEMORY[0x1E4F6D450]])
    {
      if ((objc_msgSend((id)objc_msgSend(a3, "stringByDeletingLastPathComponent"), "containsString:", objc_msgSend(@"/var/mobile/Library/SMS/Attachments", "stringByExpandingTildeInPath")) & 1) == 0)
      {
        __int16 v14 = IMLogHandleForCategory();
        int v6 = os_log_type_enabled(v14, OS_LOG_TYPE_ERROR);
        if (!v6) {
          return v6;
        }
        sub_1D9903430();
        goto LABEL_9;
      }
      int v12 = objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "im_isAudioMessageExtension");
      if (v12)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            int v16 = 138412290;
            id v17 = a3;
            _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Not marking path as eligible for cachedelete, file extension is an audio message. path: %@", (uint8_t *)&v16, 0xCu);
          }
        }
      }
      LOBYTE(v6) = v12 ^ 1;
      return v6;
    }
    int v6 = IMOSLoggingEnabled();
    if (!v6) {
      return v6;
    }
    id v11 = OSLogHandleForIMFoundationCategory();
    int v6 = os_log_type_enabled(v11, OS_LOG_TYPE_INFO);
    if (!v6) {
      return v6;
    }
    int v16 = 138412290;
    id v17 = a3;
    uint32_t v8 = "Not marking path as eligible for cachedelete, last path component matches group photo file name. path: %@";
    id v9 = v11;
    uint32_t v10 = 12;
LABEL_8:
    _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v16, v10);
    goto LABEL_9;
  }
  BOOL v5 = IMLogHandleForCategory();
  int v6 = os_log_type_enabled(v5, OS_LOG_TYPE_ERROR);
  if (v6)
  {
    sub_1D99033EC(v5);
LABEL_9:
    LOBYTE(v6) = 0;
  }
  return v6;
}

- (void)markAttachmentPurgeable:(id)a3
{
}

- (void)markAttachmentUnpurgeable:(id)a3
{
}

- (void)markAttachment:(id)a3 purgeable:(BOOL)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = a4;
    -[IMDAttachmentStore markFile:asPurgeable:](self, "markFile:asPurgeable:");
    id v7 = [(IMDAttachmentStore *)self _alternateAttachmentPathIfExists:a3];
    if (v7) {
      [(IMDAttachmentStore *)self markFile:v7 asPurgeable:v4];
    }
    if ((objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "isEqualToString:", @"MOV") & 1) == 0
      && (objc_msgSend((id)objc_msgSend(a3, "pathExtension"), "isEqualToString:", @"mov") & 1) == 0)
    {
      uint64_t v8 = objc_msgSend(a3, "im_livePhotoVideoPath");
      if (v8)
      {
        uint64_t v9 = v8;
        if (IMOSLoggingEnabled())
        {
          uint32_t v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            int v12 = 138412290;
            uint64_t v13 = v9;
            _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Found aux video path: %@", (uint8_t *)&v12, 0xCu);
          }
        }
        [(IMDAttachmentStore *)self markFile:v9 asPurgeable:v4];
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "No attachment path to mark as purgable", (uint8_t *)&v12, 2u);
    }
  }
}

+ (BOOL)_filesystemIsCaseSensitiveWithPath:(id)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D97B847C;
  block[3] = &unk_1E6B73178;
  block[4] = a3;
  if (qword_1EBE2BFD8 != -1) {
    dispatch_once(&qword_1EBE2BFD8, block);
  }
  return byte_1EBE2BFD0;
}

- (id)_alternateAttachmentPathIfExists:(id)a3
{
  if (!+[IMDAttachmentStore _filesystemIsCaseSensitiveWithPath:](IMDAttachmentStore, "_filesystemIsCaseSensitiveWithPath:"))return 0; {
  BOOL v4 = (void *)[a3 pathExtension];
  }
  id result = (id)[v4 length];
  if (result)
  {
    uint64_t v6 = [v4 lowercaseString];
    uint64_t v7 = [v4 uppercaseString];
    if ([v4 isEqualToString:v7]) {
      uint64_t v8 = v6;
    }
    else {
      uint64_t v8 = v7;
    }
    uint64_t v9 = objc_msgSend((id)objc_msgSend(a3, "stringByDeletingPathExtension"), "stringByAppendingPathExtension:", v8);
    if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F28CB8], "defaultManager"), "fileExistsAtPath:", v9)) {
      return v9;
    }
    else {
      return 0;
    }
  }
  return result;
}

+ (void)_askToTapToRadarForErrorString:(id)a3 path:(id)a4
{
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C360], "sharedInstance"), "isInternalInstall")
    && IMGetCachedDomainBoolForKeyWithDefaultValue())
  {
    if (qword_1EA8CA570 != -1) {
      dispatch_once(&qword_1EA8CA570, &unk_1F3391840);
    }
    uint64_t v6 = objc_msgSend(MEMORY[0x1E4F6C410], "userNotificationWithIdentifier:title:message:defaultButton:alternateButton:otherButton:", objc_msgSend(NSString, "stringGUID"), @"Messages Storage Management", @"An attachment was unexpectedly marked as not purgeable.", @"File a Radar", @"Dismiss", 0);
    if (v6)
    {
      uint64_t v7 = (void *)v6;
      if (IMOSLoggingEnabled())
      {
        uint64_t v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Presenting CacheDelete TTR UI", buf, 2u);
        }
      }
      uint64_t v9 = (void *)[MEMORY[0x1E4F6E890] sharedInstance];
      [v9 trackEvent:*MEMORY[0x1E4F6DA58]];
      [v7 setUsesNotificationCenter:0];
      [v7 setRepresentedApplicationBundle:*MEMORY[0x1E4F6C440]];
      uint32_t v10 = (void *)[MEMORY[0x1E4F6C418] sharedInstance];
      v11[0] = MEMORY[0x1E4F143A8];
      v11[1] = 3221225472;
      v11[2] = sub_1D97B8848;
      v11[3] = &unk_1E6B76700;
      v11[4] = a3;
      v11[5] = a4;
      [v10 addUserNotification:v7 listener:0 completionHandler:v11];
    }
  }
}

- (void)markAllAttachmentsAsNotPurgeable
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6C360], "sharedInstance"), "isInternalInstall"))
  {
    IMLogBacktrace();
    +[IMDAttachmentStore _askToTapToRadarForErrorString:@"All attachments" path:0];
  }
  id v2 = (void *)[@"/var/mobile/Library/SMS/Attachments" stringByExpandingTildeInPath];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v2;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Clearing purgeable flags under %@", (uint8_t *)&buf, 0xCu);
    }
  }
  uint64_t v21 = 0;
  uint64_t v22 = 0;
  long long buf = 0x900000002uLL;
  int v4 = fsctl((const char *)[v2 fileSystemRepresentation], 0xC0204A49uLL, &buf, 0);
  if (v4)
  {
    BOOL v5 = *__error() == 2;
    int v6 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v6)
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v14 = 138412290;
          BOOL v15 = v2;
          uint64_t v8 = "%@ does not exist, skip clearing the purgeable flags";
LABEL_14:
          uint64_t v9 = v7;
          uint32_t v10 = 12;
LABEL_18:
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, v8, (uint8_t *)&v14, v10);
        }
      }
    }
    else if (v6)
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = __error();
        uint64_t v13 = strerror(*v12);
        int v14 = 138412802;
        BOOL v15 = v2;
        __int16 v16 = 1024;
        int v17 = v4;
        __int16 v18 = 2080;
        id v19 = v13;
        uint64_t v8 = "Failed to clear purgeable flag for %@ %d (%s)";
        uint64_t v9 = v11;
        uint32_t v10 = 28;
        goto LABEL_18;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      BOOL v15 = v2;
      uint64_t v8 = "Cleared purgeable flags under %@";
      goto LABEL_14;
    }
  }
}

- (id)attachmentWithGUID:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = a3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Request for attachment with guid: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  BOOL v5 = (void *)MEMORY[0x1E016A370]();
  int v6 = (void *)IMDAttachmentRecordCopyAttachmentForGUID();
  uint64_t v7 = v6;
  if (v6)
  {
    id v8 = IMFileTransferFromIMDAttachmentRecordRef(v6);
    [v8 fixInvalidTransferStateIfNeeded];
    CFRelease(v7);
  }
  else
  {
    id v8 = 0;
  }
  return v8;
}

- (id)attachmentsWithGUIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = a3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Request for attachments with guids: %@", buf, 0xCu);
    }
  }
  id v6 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(a3, "count"));
  if (a3)
  {
    id v7 = -[IMDAttachmentStore attachmentsFilteredUsingPredicate:limit:](self, "attachmentsFilteredUsingPredicate:limit:", [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", *MEMORY[0x1E4F6CAB8], a3], -1);
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v14;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v13 + 1) + 8 * v10);
          if (v11
            && ([*(id *)(*((void *)&v13 + 1) + 8 * v10) isFinished] & 1) == 0
            && [v11 transferState])
          {
            [v11 _setTransferState:6];
            [v11 _setError:11];
          }
          [v6 addObject:v11];
          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v8);
    }
  }
  return v6;
}

- (id)fileTransferWithAttachmentRecordRef:(_IMDAttachmentRecordStruct *)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      uint64_t v8 = a3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Request for attachment with attachmentRecord: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  BOOL v5 = (void *)MEMORY[0x1E016A370]();
  if (a3)
  {
    a3 = (_IMDAttachmentRecordStruct *)IMFileTransferFromIMDAttachmentRecordRef(a3);
    [(_IMDAttachmentRecordStruct *)a3 fixInvalidTransferStateIfNeeded];
  }
  return a3;
}

- (id)attachmentsFilteredUsingPredicate:(id)a3 limit:(unint64_t)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v20 = 0;
  uint64_t v21 = &v20;
  uint64_t v22 = 0x3052000000;
  uint64_t v23 = sub_1D97B6C78;
  int v24 = sub_1D97B6C88;
  uint64_t v25 = 0;
  id v6 = (void *)[MEMORY[0x1E4F6BF48] synchronousDatabase];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1D97B929C;
  v19[3] = &unk_1E6B73420;
  v19[4] = &v20;
  [v6 fetchAttachmentRecordsFilteredUsingPredicate:a3 limit:a4 completionHandler:v19];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v8 = (void *)v21[5];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v26 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = IMFileTransferFromIMDAttachmentRecordRef(*(void **)(*((void *)&v15 + 1) + 8 * i));
        if (v12) {
          [v7 addObject:v12];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v26 count:16];
    }
    while (v9);
  }

  id v13 = v7;
  _Block_object_dispose(&v20, 8);
  return v13;
}

- (id)database
{
  return (id)[MEMORY[0x1E4F6BF48] synchronousDatabase];
}

- (id)messageForTransferGUID:(id)a3 shouldLoadAttachments:(BOOL)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = IMDAttachmentRecordCopyMessageForAttachmentGUID();
  if (v5)
  {
    id v6 = (const void *)v5;
    AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef(v5, 0);
    CFRelease(v6);
    return AttachmentIfNeededRef;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = a3;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "messageForTransferGUID failed to get a message record for transfer %@", (uint8_t *)&v10, 0xCu);
      }
    }
    return 0;
  }
}

- (BOOL)updateTemporaryTransferGUIDsIfNeeded:(id)a3 transfersToSync:(id)a4
{
  id v7 = -[IMDAttachmentStore messageForTransferGUID:shouldLoadAttachments:](self, "messageForTransferGUID:shouldLoadAttachments:", [a3 guid], 1);

  return [(IMDAttachmentStore *)self updateTemporaryTransferGUIDsOn:a3 andUpdateMessageIfNeeded:v7 transfersToSync:a4];
}

- (BOOL)_shouldEarlyReturnForWrongItemType:(id)a3
{
  return (objc_opt_isKindOfClass() & 1) == 0;
}

- (BOOL)updateTemporaryTransferGUIDsOnMessageIfNeeded:(id)a3
{
  return [(IMDAttachmentStore *)self updateTemporaryTransferGUIDsOn:0 andUpdateMessageIfNeeded:a3 transfersToSync:0];
}

- (_IMDAttachmentRecordStruct)_loadAttachmentRecordForGUID:(id)a3
{
  return (_IMDAttachmentRecordStruct *)IMDAttachmentRecordCopyAttachmentForGUID();
}

- (id)_newFileTransferFromIMDAttachmentRecordRef:(_IMDAttachmentRecordStruct *)a3
{
  return IMFileTransferFromIMDAttachmentRecordRef(a3);
}

- (BOOL)_updateAttachmentGUID:(id)a3 withGUID:(id)a4
{
  return IMDAttachmentRecordUpdateAttachmentGUIDWithGUID() != 0;
}

- (void)_reindexMessageGUIDs:(id)a3 reason:(int64_t)a4 completion:(id)a5
{
}

+ (BOOL)updateTransferIn:(id)a3 fromGUID:(id)a4 toGUID:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(a3);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * v11);
        if (objc_msgSend((id)objc_msgSend(v12, "guid"), "isEqualToString:", a4))
        {
          [v12 setGuid:a5];
          LOBYTE(v8) = 1;
          return v8;
        }
        ++v11;
      }
      while (v9 != v11);
      uint64_t v8 = [a3 countByEnumeratingWithState:&v14 objects:v18 count:16];
      uint64_t v9 = v8;
      if (v8) {
        continue;
      }
      break;
    }
  }
  return v8;
}

- (id)_permanentTransferGUIDForTransfer:(id)a3 inItem:(id)a4
{
  id v6 = (void *)[a3 guid];
  if (!IMFileTransferGUIDIsTemporary()) {
    return v6;
  }
  uint64_t v7 = [a4 guid];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
LABEL_10:
    uint64_t v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v12 = 0;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Could not find message part matching file transfer GUID, using 0 as the message part index.", v12, 2u);
    }
    return (id)IMFileTransferGUIDForPluginPayloadOrGroupPhotoInMessageGUID();
  }
  if (objc_msgSend((id)objc_msgSend(a4, "body"), "__im_isRichCard"))
  {
    uint64_t v8 = objc_msgSend((id)objc_msgSend(a3, "filename"), "__im_indexForRichCardFile");
LABEL_14:
    return (id)MEMORY[0x1F41240B8](v7, v8);
  }
  if (![a3 isAdaptiveImageGlyph])
  {
    uint64_t v8 = [a4 messagePartIndexForAttachmentMessagePartWithTransferGUID:v6];
    if (v8 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_14;
    }
    goto LABEL_10;
  }
  uint64_t v9 = [a3 adaptiveImageGlyphContentIdentifier];

  return (id)MEMORY[0x1F41240C0](v9, v7);
}

- (id)_permanentTransferGUIDForExistingTransferWithTemporaryGUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = IMDAttachmentRecordCopyAttachmentForGUID();
  if (v5)
  {
    id v6 = (void *)v5;
    uint64_t v7 = IMDAttachmentRecordCopyMessageForAttachmentGUID();
    if (v7)
    {
      uint64_t v8 = (const void *)v7;
      uint64_t v9 = (void *)IMDCreateIMMessageItemFromIMDMessageRecordRef(v7, 0);
      if (v9)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            int v17 = 138412290;
            id v18 = a3;
            _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Found corresponding IMItem for temporary transferGUID %@", (uint8_t *)&v17, 0xCu);
          }
        }
        id v11 = IMFileTransferFromIMDAttachmentRecordRef(v6);
        id v12 = [(IMDAttachmentStore *)self _permanentTransferGUIDForTransfer:v11 inItem:v9];
      }
      else
      {
        long long v15 = IMLogHandleForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1D9903568();
        }
        id v12 = 0;
      }

      CFRelease(v8);
    }
    else
    {
      long long v14 = IMLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1D9903500();
      }
      id v12 = 0;
    }
    CFRelease(v6);
  }
  else
  {
    id v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1D9903498();
    }
    return 0;
  }
  return v12;
}

- (BOOL)updateTemporaryTransferGUIDsOn:(id)a3 andUpdateMessageIfNeeded:(id)a4 transfersToSync:(id)a5
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v40 = [a4 guid];
    id v45 = a4;
    uint64_t v7 = objc_msgSend((id)objc_msgSend(a4, "fileTransferGUIDs"), "copy");
    id v44 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    obuint64_t j = v7;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v54 objects:v63 count:16];
    if (v8)
    {
      char v41 = 0;
      uint64_t v9 = *(void *)v55;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v55 != v9) {
            objc_enumerationMutation(obj);
          }
          id v11 = *(void **)(*((void *)&v54 + 1) + 8 * i);
          if (IMFileTransferGUIDIsTemporary())
          {
            id v12 = [(IMDAttachmentStore *)self _loadAttachmentRecordForGUID:v11];
            if (v12)
            {
              id v13 = [(IMDAttachmentStore *)self _newFileTransferFromIMDAttachmentRecordRef:v12];
              CFRelease(v12);
              id v14 = [(IMDAttachmentStore *)self _permanentTransferGUIDForTransfer:v13 inItem:v45];
              if (IMOSLoggingEnabled())
              {
                long long v15 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 138412546;
                  uint64_t v60 = (uint64_t)v11;
                  __int16 v61 = 2112;
                  id v62 = v14;
                  _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Re-targeting transfer GUID from %@ to %@", buf, 0x16u);
                }
              }
              BOOL v16 = [(IMDAttachmentStore *)self _updateAttachmentGUID:v11 withGUID:v14];
              if (IMOSLoggingEnabled())
              {
                int v17 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  id v18 = @"NO";
                  if (v16) {
                    id v18 = @"YES";
                  }
                  *(_DWORD *)long long buf = 138412290;
                  uint64_t v60 = (uint64_t)v18;
                  _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "_updateAttachmentGUID completed with success %@", buf, 0xCu);
                }
              }
              if (v16)
              {
                if (v13) {
                  [v13 setGuid:v14];
                }
                +[IMDAttachmentStore updateTransferIn:a5 fromGUID:v11 toGUID:v14];
                [+[IMDFileTransferCenter sharedInstance] updateTransferGUID:v11 toGUID:v14];
                if (a3 && objc_msgSend(v11, "isEqualToString:", objc_msgSend(a3, "guid")))
                {
                  if (IMOSLoggingEnabled())
                  {
                    uint64_t v19 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                    {
                      uint64_t v20 = [a3 guid];
                      *(_DWORD *)long long buf = 138412546;
                      uint64_t v60 = v20;
                      __int16 v61 = 2112;
                      id v62 = v14;
                      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "We are updating the in-memory transfer's guid that we will sync to CloudKit in-memory transfer: %@ newGUID: %@", buf, 0x16u);
                    }
                  }
                  [a3 setGuid:v14];
                  char v41 = 1;
                }
                [(IMDAttachmentStore *)self updateAttachment:v13];
                [v44 setObject:v14 forKey:v11];
              }
            }
            else
            {
              uint64_t v21 = IMLogHandleForCategory();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v60 = (uint64_t)v11;
                _os_log_error_impl(&dword_1D967A000, v21, OS_LOG_TYPE_ERROR, "Got null attachment record for %@", buf, 0xCu);
              }
            }
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v54 objects:v63 count:16];
      }
      while (v8);
    }
    else
    {
      char v41 = 0;
    }
    int v24 = (void *)[v44 copy];

    int v43 = [v45 updateTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:v24];
    if (v43)
    {
      id v25 = [+[IMDMessageStore sharedInstance] storeMessage:v45 forceReplace:0 modifyError:0 modifyFlags:0 flagMask:0];
      if (!v45 || v25 == v45)
      {
        uint64_t v27 = IMLogHandleForCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
          sub_1D99035D0(v40, v45, v27);
        }
        __int16 v26 = @"FAILED (maybe)";
      }
      else
      {
        __int16 v26 = @"succeeded";
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v60 = (uint64_t)v26;
          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Message body attachment attributes update %@!", buf, 0xCu);
        }
      }
      id v46 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      [v46 addObject:v40];
      id v29 = [+[IMDMessageStore sharedInstance] messagesWithAssociatedGUID:v40];
      long long v52 = 0u;
      long long v53 = 0u;
      long long v50 = 0u;
      long long v51 = 0u;
      uint64_t v30 = [v29 countByEnumeratingWithState:&v50 objects:v58 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v51;
        do
        {
          for (uint64_t j = 0; j != v30; ++j)
          {
            if (*(void *)v51 != v31) {
              objc_enumerationMutation(v29);
            }
            __int16 v33 = *(void **)(*((void *)&v50 + 1) + 8 * j);
            uint64_t v34 = [v33 guid];
            int v35 = [v33 updateTemporaryFileTransferGUIDsWithPermanentFileTransferGUIDs:v24];
            uint64_t v36 = IMLogHandleForCategory();
            BOOL v37 = os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT);
            if (v35)
            {
              if (v37)
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v60 = v34;
                _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_DEFAULT, "Associated message item %@ changed when temporary file transfers were updated.", buf, 0xCu);
              }
              [v46 addObject:v34];
            }
            else if (v37)
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v60 = v34;
              _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_DEFAULT, "Associated message item %@ did not change when temporary file transfers were updated.", buf, 0xCu);
            }
          }
          uint64_t v30 = [v29 countByEnumeratingWithState:&v50 objects:v58 count:16];
        }
        while (v30);
      }
      v38 = (void *)[v46 copy];

      v49[0] = MEMORY[0x1E4F143A8];
      v49[1] = 3221225472;
      v49[2] = sub_1D97BA108;
      v49[3] = &unk_1E6B73178;
      v49[4] = v38;
      [(IMDAttachmentStore *)self _reindexMessageGUIDs:v38 reason:1001 completion:v49];
    }
    char v23 = v41;
    if (!a3) {
      char v23 = v43;
    }
  }
  else
  {
    uint64_t v22 = IMLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_1D9903674((uint64_t)a4, v22);
    }
    char v23 = 0;
  }
  return v23 & 1;
}

- (void)markAllAttachmentsAsNeedingCloudKitSync
{
}

- (BOOL)deleteAttachmentsForMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  int v4 = (void *)[a3 fileTransferGUIDs];
  if (![v4 count]) {
    goto LABEL_7;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      uint64_t v10 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Deleting attachments, guids %@", (uint8_t *)&v9, 0xCu);
    }
  }
  if ([(IMDAttachmentStore *)self deleteAttachmentsWithGUIDs:v4])
  {
    LOBYTE(v6) = 1;
  }
  else
  {
LABEL_7:
    int v6 = IMOSLoggingEnabled();
    if (v6)
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      int v6 = os_log_type_enabled(v7, OS_LOG_TYPE_INFO);
      if (v6)
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Failed to delete attachments", (uint8_t *)&v9, 2u);
        LOBYTE(v6) = 0;
      }
    }
  }
  return v6;
}

- (BOOL)deleteAttachmentsWithGUIDs:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v30 = a3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Request to delete attachments with guids: %@", buf, 0xCu);
    }
  }
  context = (void *)MEMORY[0x1E016A370]();
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  uint64_t v7 = [a3 countByEnumeratingWithState:&v24 objects:v33 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v25 != v8) {
          objc_enumerationMutation(a3);
        }
        uint64_t v10 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        [v6 addObject:v10];
        if (IMFileTransferGUIDIsTemporary())
        {
          id v11 = [(IMDAttachmentStore *)self _permanentTransferGUIDForExistingTransferWithTemporaryGUID:v10];
          if ([v11 length])
          {
            if (IMOSLoggingEnabled())
            {
              id v12 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412546;
                id v30 = v10;
                __int16 v31 = 2112;
                id v32 = v11;
                _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Requested delete of temporary attachmentGUID %@ will also delete permanent attachmentGUID %@", buf, 0x16u);
              }
            }
            [v6 addObject:v11];
          }
        }
      }
      uint64_t v7 = [a3 countByEnumeratingWithState:&v24 objects:v33 count:16];
    }
    while (v7);
  }
  id v13 = (void *)[v6 copy];

  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v30 = v13;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Deleting attachments with attachment guids from spotlight: %@", buf, 0xCu);
    }
  }
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6BF48], "database"), "coreSpotlightDeleteAttachmentGUIDs:reason:", v13, 1006);

  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v15 = [a3 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v21;
    do
    {
      for (uint64_t j = 0; j != v15; ++j)
      {
        if (*(void *)v21 != v16) {
          objc_enumerationMutation(a3);
        }
        IMDAttachmentRecordDeleteAttachmentForGUID();
      }
      uint64_t v15 = [a3 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v15);
  }
  return 1;
}

- (BOOL)deleteAttachmentDataForTransfer:(id)a3
{
  int v4 = (void *)MEMORY[0x1E016A370](self, a2);
  objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6BF78], "sharedInstance"), "deleteAttachmentsForTransfer:", a3);
  return 1;
}

- (BOOL)deleteAttachmentWithGUID:(id)a3
{
  v7[1] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    v7[0] = a3;
    return -[IMDAttachmentStore deleteAttachmentsWithGUIDs:](self, "deleteAttachmentsWithGUIDs:", [MEMORY[0x1E4F1C978] arrayWithObjects:v7 count:1]);
  }
  else if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    BOOL v3 = 1;
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Request to delete attachment with nil guid", v6, 2u);
    }
  }
  else
  {
    return 1;
  }
  return v3;
}

- (BOOL)isSafeToDeleteAttachmentAtPath:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [a3 length];
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = a3;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Request to check if the attachment path is safe: %@", (uint8_t *)&v7, 0xCu);
      }
    }
    LOBYTE(v4) = objc_msgSend((id)objc_msgSend(MEMORY[0x1E4F6BF78], "sharedInstance"), "isSafeToDeleteAttachmentPath:", a3);
  }
  return v4;
}

- (void)deleteAttachmentsDirectWithPredicate:(id)a3
{
  uint64_t v3 = [MEMORY[0x1E4F6BF48] database];

  MEMORY[0x1F4181798](v3, sel_deleteAttachmentsDirectWithPredicate_);
}

- (void)resetFetchStateForAssets
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v3 = 0;
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "Resetting fetch state for assets (afterRow to nil)", v3, 2u);
    }
  }
}

- (id)batchOfRecordsMissingAssetsAfterRow:(id *)a3 withLimit:(int64_t)a4
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  uint64_t v28 = a3;
  if (a3) {
    id v4 = *a3;
  }
  else {
    id v4 = 0;
  }
  id v5 = v4;
  id v6 = (void *)IMDAttachmentRecordCopyAttachmentsForQueryWithLimit();
  if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v6 count];
      if (v5)
      {
        uint64_t v9 = [v5 stringValue];
      }
      else
      {
        uint64_t v9 = @"nil";
      }
      *(_DWORD *)long long buf = 134218498;
      uint64_t v37 = v8;
      __int16 v38 = 2112;
      uint64_t v39 = v9;
      __int16 v40 = 2112;
      char v41 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Found %lu records afterRow %@ to download {%@} ", buf, 0x20u);
      if (v5) {
    }
      }
  }
  id v30 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v10 = +[IMDRecordZoneManager sharedInstance];
  id v11 = [v10 attachmentRecordZone];
  id v12 = [v11 zoneID];

  id v29 = v5;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v13 = v6;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
  uint64_t v15 = v29;
  if (v14)
  {
    uint64_t v16 = *(void *)v32;
    uint64_t v15 = v29;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v32 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (!v15 || (uint64_t v19 = [v15 longLongValue], v19 < objc_msgSend(v18, "rowID")))
        {
          uint64_t v20 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v18, "rowID", v28));

          uint64_t v15 = (void *)v20;
        }
        long long v21 = objc_msgSend(v18, "cloudRecordID", v28);

        if (v21)
        {
          id v22 = objc_alloc(MEMORY[0x1E4F1A2F8]);
          long long v23 = [v18 cloudRecordID];
          long long v24 = [v22 initWithRecordName:v23 zoneID:v12];

          if (v24)
          {
            long long v25 = [v18 guid];
            [v30 setObject:v25 forKey:v24];
          }
          else if (IMOSLoggingEnabled())
          {
            long long v26 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v37 = (uint64_t)v18;
              _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Could not create recordID for attachment to upload on record %@", buf, 0xCu);
            }
          }
        }
        else
        {
          if (!IMOSLoggingEnabled()) {
            continue;
          }
          long long v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v37 = (uint64_t)v18;
            _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "cloudRecordID is nil on record %@", buf, 0xCu);
          }
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v31 objects:v35 count:16];
    }
    while (v14);
  }

  if (v28) {
    *uint64_t v28 = v15;
  }

  return v30;
}

- (void)updateAssetUsingRecord:(id)a3
{
  id v4 = a3;
  char v8 = 0;
  id v5 = +[IMDFileTransferCenter sharedInstance];
  id v6 = [v5 updateTransfersWithCKRecord:v4 recordWasFetched:1 downloadAsset:&v8];
  int v7 = (void *)[v6 copy];

  if (v7 && [v7 length]) {
    [(IMDAttachmentStore *)self _removeTransferFromiCloudBackupWithGuid:v7];
  }
  [MEMORY[0x1E4F6E780] cleanUpAssetsOnDiskForRecord:v4];
}

- (void)markTransferAsNotSuccessfullyDownloadedWithGUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDAttachmentStore *)self attachmentWithGUID:v4];
  id v6 = v5;
  if (v5)
  {
    [v5 setCloudKitSyncState:5];
    [(IMDAttachmentStore *)self updateAttachment:v6];
  }
  else if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v4;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Failed to find transfer %@ to mark as unsuccessful", (uint8_t *)&v8, 0xCu);
    }
  }
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
          *(_DWORD *)long long buf = 138412546;
          id v14 = v3;
          __int16 v15 = 2112;
          id v16 = v6;
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Removing icloud backup attribute for guid %@ path %@", buf, 0x16u);
        }
      }
      uint64_t v10 = +[IMDCKBackupController sharedInstance];
      [v10 removePathFromiCloudBackup:v6];
    }
    else if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v3;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Attachment at path '%@' for %@ not found, NOT removing from iCloud backups", buf, 0x16u);
      }
    }
  }
}

- (id)batchOfRecordIDsToDeleteWithLimit:(int64_t)a3 error:(id *)a4
{
  id v5 = self;
  IMDAttachmentStore.batchOfRecordIDsToDelete(limit:)(a3);

  sub_1D968E084(0, (unint64_t *)&qword_1EBE2B4D0);
  sub_1D989836C();
  id v6 = (void *)sub_1D9906CB0();
  swift_bridgeObjectRelease();

  return v6;
}

- (void)clearTombstonesForRecordIDs:(id)a3
{
  sub_1D968E084(0, (unint64_t *)&qword_1EBE2B4D0);
  unint64_t v4 = sub_1D9906F20();
  id v5 = self;
  _sSo18IMDAttachmentStoreC12IMDaemonCoreE15clearTombstones12forRecordIDsySaySo10CKRecordIDCG_tF_0(v4);

  swift_bridgeObjectRelease();
}

@end