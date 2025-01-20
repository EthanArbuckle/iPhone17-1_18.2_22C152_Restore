@interface IMDUpdateV1RecordStore
- (NSMutableDictionary)recordNameToRowIDMap;
- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5;
- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5;
- (void)recordUpdateSucceededWithRecord:(id)a3;
- (void)setRecordNameToRowIDMap:(id)a3;
@end

@implementation IMDUpdateV1RecordStore

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  v7 = +[IMDMessageStore sharedInstance];
  v8 = (void *)[v7 messagesPendingUpdateT1ToCloudKitWithLimit:a4];

  id v38 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  recordNameToRowIDMap = self->_recordNameToRowIDMap;
  self->_recordNameToRowIDMap = v9;

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v8;
  uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
  if (v11)
  {
    uint64_t v13 = *(void *)v41;
    *(void *)&long long v12 = 138412290;
    long long v37 = v12;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v41 != v13) {
          objc_enumerationMutation(obj);
        }
        v15 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        v16 = (void *)MEMORY[0x1E4F6E7F0];
        v17 = +[IMDRecordZoneManager sharedInstance];
        v18 = [v17 updateRecordZoneID];
        v19 = +[IMDCKRecordSaltManager sharedInstance];
        v20 = [v19 cachedSalt];
        v21 = (void *)[v16 createCKRecordForUpdateT1:v15 zoneID:v18 salt:v20];

        if (v21)
        {
          v22 = [(IMDUpdateV1RecordStore *)self recordNameToRowIDMap];
          v23 = [v21 recordID];
          v24 = [v23 recordName];
          v25 = [v22 objectForKeyedSubscript:v24];
          BOOL v26 = v25 == 0;

          if (!v26) {
            goto LABEL_15;
          }
          v27 = [v15 objectForKeyedSubscript:@"MID"];
          v28 = [v27 stringValue];

          [v38 setObject:v21 forKey:v28];
          v29 = [v15 objectForKeyedSubscript:@"ROWID"];
          v30 = [(IMDUpdateV1RecordStore *)self recordNameToRowIDMap];
          v31 = [v21 recordID];
          v32 = [v31 recordName];
          [v30 setObject:v29 forKeyedSubscript:v32];
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v37;
              v45 = v15;
              _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "**** T1 Update item [%@] could not be converted to CKRecord, marking it as clean and moving on.", buf, 0xCu);
            }
          }
          v34 = [v15 objectForKeyedSubscript:@"ROWID"];
          uint64_t v35 = [v34 longLongValue];

          v28 = +[IMDMessageStore sharedInstance];
          [v28 markMessageAsCleanWithROWID:v35];
        }

LABEL_15:
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v40 objects:v46 count:16];
    }
    while (v11);
  }

  return v38;
}

- (void)recordUpdateSucceededWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [(IMDUpdateV1RecordStore *)self recordNameToRowIDMap];
  v6 = [v4 recordID];
  v7 = [v6 recordName];
  v8 = [v5 objectForKeyedSubscript:v7];

  if (v8)
  {
    [v8 longLongValue];
    IMDMessageRecordMarkMessageWithROWIDAsSyncedWithCloudKit();
  }
  else if (IMOSLoggingEnabled())
  {
    v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "No rowID present in recordNameToRowIDMap! ", v10, 2u);
    }
  }
}

- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = [v8 recordName];
      int v22 = 138412546;
      id v23 = v10;
      __int16 v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Error %@ while writing up record %@", (uint8_t *)&v22, 0x16u);
    }
  }
  uint64_t v13 = +[IMDCKUtilities sharedInstance];
  v14 = [v13 extractServerRecordFromCKServerErrorRecordChanged:v10];

  v15 = [(IMDUpdateV1RecordStore *)self recordNameToRowIDMap];
  v16 = [v8 recordName];
  v17 = [v15 objectForKeyedSubscript:v16];

  uint64_t v18 = [v17 longLongValue];
  if (v14)
  {
    uint64_t v19 = v18;
    if (IMOSLoggingEnabled())
    {
      v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412290;
        id v23 = v10;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Extracted record from server error %@", (uint8_t *)&v22, 0xCu);
      }
    }
    v21 = +[IMDChatRegistry sharedInstance];
    [v21 handleMessageUpdateConflictType:@"UT1" serverRecord:v14 localRowID:v19];
  }
}

- (NSMutableDictionary)recordNameToRowIDMap
{
  return self->_recordNameToRowIDMap;
}

- (void)setRecordNameToRowIDMap:(id)a3
{
}

- (void).cxx_destruct
{
}

@end