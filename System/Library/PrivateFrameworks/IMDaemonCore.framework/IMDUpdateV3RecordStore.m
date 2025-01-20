@interface IMDUpdateV3RecordStore
- (NSMutableDictionary)recordNameToRowIDMap;
- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5;
- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5;
- (void)recordUpdateSucceededWithRecord:(id)a3;
- (void)setRecordNameToRowIDMap:(id)a3;
@end

@implementation IMDUpdateV3RecordStore

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  v6 = +[IMDMessageStore sharedInstance];
  v7 = (void *)[v6 messagesPendingUpdateT3ToCloudKitWithLimit:a4];

  id v42 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  recordNameToRowIDMap = self->_recordNameToRowIDMap;
  self->_recordNameToRowIDMap = v8;

  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id obj = v7;
  uint64_t v46 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
  if (v46)
  {
    uint64_t v45 = *(void *)v50;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v50 != v45) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        v12 = [v11 objectForKeyedSubscript:@"MID"];
        v13 = +[IMDMessageStore sharedInstance];
        v14 = [v13 chatForMessageGUID:v12];

        if (v14)
        {
          uint64_t v15 = [v14 cloudKitChatID];
          v16 = (void *)v15;
          if (v15)
          {
            v53[0] = @"MID";
            v53[1] = @"CHATID";
            v54[0] = v12;
            v54[1] = v15;
            v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v54 forKeys:v53 count:2];
            v17 = (void *)MEMORY[0x1E4F6E7F0];
            v18 = +[IMDRecordZoneManager sharedInstance];
            v19 = [v18 updateRecordZoneID];
            v20 = +[IMDCKRecordSaltManager sharedInstance];
            v21 = [v20 cachedSalt];
            v22 = (void *)[v17 createCKRecordForUpdateT3:v47 zoneID:v19 salt:v21];

            if (v22)
            {
              v23 = [(IMDUpdateV3RecordStore *)self recordNameToRowIDMap];
              v24 = [v22 recordID];
              v25 = [v24 recordName];
              v26 = [v23 objectForKeyedSubscript:v25];
              BOOL v27 = v26 == 0;

              if (v27)
              {
                [v42 setObject:v22 forKey:v12];
                v28 = [v11 objectForKeyedSubscript:@"ROWID"];
                v29 = [(IMDUpdateV3RecordStore *)self recordNameToRowIDMap];
                v30 = [v22 recordID];
                v31 = [v30 recordName];
                [v29 setObject:v28 forKeyedSubscript:v31];

                goto LABEL_26;
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                v38 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v56 = v11;
                  _os_log_impl(&dword_1D967A000, v38, OS_LOG_TYPE_INFO, "**** T3 Update item [%@] could not be converted to CKRecord, marking it as clean and moving on.", buf, 0xCu);
                }
              }
              v39 = [v11 objectForKeyedSubscript:@"ROWID"];
              uint64_t v40 = [v39 longLongValue];

              v28 = +[IMDMessageStore sharedInstance];
              [v28 markMessageAsCleanWithROWID:v40];
LABEL_26:
            }
            goto LABEL_29;
          }
          if (IMOSLoggingEnabled())
          {
            v35 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v56 = v11;
              _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "**** T3 Update item [%@] chat had no cloudKitChatID!, marking it as clean and moving on.", buf, 0xCu);
            }
          }
          v36 = [v11 objectForKeyedSubscript:@"ROWID"];
          uint64_t v37 = [v36 longLongValue];

          v48 = +[IMDMessageStore sharedInstance];
          [v48 markMessageAsCleanWithROWID:v37];
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            v32 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v56 = v11;
              _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "**** T3 Update item [%@] could not find a chat as a source of truth, marking it as clean and moving on.", buf, 0xCu);
            }
          }
          v33 = [v11 objectForKeyedSubscript:@"ROWID"];
          uint64_t v34 = [v33 longLongValue];

          v16 = +[IMDMessageStore sharedInstance];
          [v16 markMessageAsCleanWithROWID:v34];
        }
LABEL_29:
      }
      uint64_t v46 = [obj countByEnumeratingWithState:&v49 objects:v57 count:16];
    }
    while (v46);
  }

  return v42;
}

- (void)recordUpdateSucceededWithRecord:(id)a3
{
  id v4 = a3;
  v5 = [(IMDUpdateV3RecordStore *)self recordNameToRowIDMap];
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
    v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v12 = [v8 recordName];
      int v22 = 138412546;
      id v23 = v10;
      __int16 v24 = 2112;
      v25 = v12;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Error %@ while writing up record %@", (uint8_t *)&v22, 0x16u);
    }
  }
  v13 = +[IMDCKUtilities sharedInstance];
  v14 = [v13 extractServerRecordFromCKServerErrorRecordChanged:v10];

  uint64_t v15 = [(IMDUpdateV3RecordStore *)self recordNameToRowIDMap];
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
    [v21 handleMessageUpdateConflictType:@"UT3" serverRecord:v14 localRowID:v19];
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