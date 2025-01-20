@interface IMDUpdateV2RecordStore
- (NSMutableDictionary)recordNameToMessageItemMap;
- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5;
- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5;
- (void)recordUpdateSucceededWithRecord:(id)a3;
- (void)setRecordNameToMessageItemMap:(id)a3;
@end

@implementation IMDUpdateV2RecordStore

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  v7 = +[IMDMessageStore sharedInstance];
  v8 = (void *)[v7 messagesPendingUpdateT2ToCloudKitWithLimit:a4];

  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  recordNameToMessageItemMap = self->_recordNameToMessageItemMap;
  self->_recordNameToMessageItemMap = v9;

  long long v43 = 0u;
  long long v44 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
  if (v11)
  {
    uint64_t v13 = *(void *)v42;
    *(void *)&long long v12 = 138412290;
    long long v38 = v12;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v42 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v41 + 1) + 8 * v14);
        v16 = (void *)MEMORY[0x1E4F6E7F0];
        v17 = +[IMDRecordZoneManager sharedInstance];
        v18 = [v17 updateRecordZoneID];
        v19 = +[IMDCKRecordSaltManager sharedInstance];
        v20 = [v19 cachedSalt];
        v21 = (void *)[v16 createCKRecordForUpdateT2:v15 zoneID:v18 salt:v20];

        if (v21)
        {
          v22 = [(IMDUpdateV2RecordStore *)self recordNameToMessageItemMap];
          v23 = [v21 recordID];
          v24 = [v23 recordName];
          v25 = [v22 objectForKeyedSubscript:v24];
          BOOL v26 = v25 == 0;

          if (!v26) {
            goto LABEL_20;
          }
          v27 = [(IMDUpdateV2RecordStore *)self recordNameToMessageItemMap];
          v28 = [v21 recordID];
          v29 = [v28 recordName];
          [v27 setObject:v15 forKeyedSubscript:v29];

          v30 = [v15 objectForKeyedSubscript:@"MID"];
          v31 = [v30 stringValue];

          if (v31)
          {
            [v39 setObject:v21 forKey:v31];
          }
          else
          {
            v36 = IMLogHandleForCategory();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v38;
              v47 = v15;
              _os_log_error_impl(&dword_1D967A000, v36, OS_LOG_TYPE_ERROR, "messageItem guid is nil when setting batch of update records: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            v32 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v38;
              v47 = v15;
              _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "**** T2 Update item [%@] could not be converted to CKRecord, marking it as clean and moving on.", buf, 0xCu);
            }
          }
          v33 = [v15 objectForKey:@"MID"];
          v31 = [v33 stringValue];

          if (v31)
          {
            v34 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
            v45 = v31;
            v35 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v45 count:1];
            [v34 updateMessagesSyncedSyndicationRangesForGUIDs:v35 toStatus:1];
          }
        }

LABEL_20:
        ++v14;
      }
      while (v11 != v14);
      uint64_t v11 = [obj countByEnumeratingWithState:&v41 objects:v48 count:16];
    }
    while (v11);
  }

  return v39;
}

- (void)recordUpdateSucceededWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [(IMDUpdateV2RecordStore *)self recordNameToMessageItemMap];
  v6 = [v4 recordID];
  v7 = [v6 recordName];
  v8 = [v5 objectForKeyedSubscript:v7];

  if (v8)
  {
    v9 = [v8 objectForKeyedSubscript:@"MID"];
    v10 = [v9 stringValue];

    uint64_t v11 = [v8 objectForKeyedSubscript:@"SR"];
    long long v12 = [v11 stringValue];

    uint64_t v13 = +[IMDChatRegistry sharedInstance];
    [v13 updateSyncedSyndicationRanges:v12 forGUID:v10];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v15 = 0;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "No message item present in recordNameToMessageItemMap!", v15, 2u);
    }
  }
}

- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = [v8 recordName];
      int v23 = 138412546;
      id v24 = v10;
      __int16 v25 = 2112;
      BOOL v26 = v12;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Error %@ while writing up record %@", (uint8_t *)&v23, 0x16u);
    }
  }
  uint64_t v13 = +[IMDCKUtilities sharedInstance];
  uint64_t v14 = [v13 extractServerRecordFromCKServerErrorRecordChanged:v10];

  v15 = [(IMDUpdateV2RecordStore *)self recordNameToMessageItemMap];
  v16 = [v8 recordName];
  v17 = [v15 objectForKeyedSubscript:v16];

  v18 = [v17 objectForKeyedSubscript:@"ROWID"];
  uint64_t v19 = [v18 longLongValue];
  if (v14)
  {
    uint64_t v20 = v19;
    if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412290;
        id v24 = v10;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Extracted record from server error %@", (uint8_t *)&v23, 0xCu);
      }
    }
    v22 = +[IMDChatRegistry sharedInstance];
    [v22 handleMessageUpdateConflictType:@"UT2" serverRecord:v14 localRowID:v20];
  }
}

- (NSMutableDictionary)recordNameToMessageItemMap
{
  return self->_recordNameToMessageItemMap;
}

- (void)setRecordNameToMessageItemMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end