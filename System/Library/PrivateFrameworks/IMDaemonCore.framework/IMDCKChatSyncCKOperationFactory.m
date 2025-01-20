@interface IMDCKChatSyncCKOperationFactory
- (id)_chatFetchRecordZoneChangesCKConfiguration:(id)a3;
- (id)_chatFetchRecordZoneChangesOptionsDictionaryUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5;
- (id)_chatSyncOperationGroup;
- (id)_chatSyncOperationGroupWithName:(id)a3;
- (id)_chatWriteRecordsCKConfiguration:(id)a3;
- (id)deleteChatCKOperationUsingRecordIDstoDelete:(id)a3;
- (id)fetchChatCKOperationUsingRecordIDs:(id)a3;
- (id)fetchChatZoneChangesCKOperationUsingToken:(id)a3 zone:(id)a4 resultsLimit:(unint64_t)a5 activity:(id)a6;
- (id)fetchChatZoneChangesCKOperationUsingToken:(id)a3 zone:(id)a4 resultsLimit:(unint64_t)a5 groupName:(id)a6 activity:(id)a7;
- (id)saveChatsCKOperationUsingRecordsToSave:(id)a3 activity:(id)a4;
@end

@implementation IMDCKChatSyncCKOperationFactory

- (id)_chatFetchRecordZoneChangesOptionsDictionaryUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1A060]);
  [v11 setDesiredKeys:0];
  [v11 setPreviousServerChangeToken:v9];

  [v11 setResultsLimit:a5];
  [v10 setObject:v11 forKey:v8];

  return v10;
}

- (id)_chatFetchRecordZoneChangesCKConfiguration:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1A208];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setQualityOfService:17];
  [v5 setAllowsCellularAccess:1];
  objc_msgSend(v5, "im_setActivity:", v4);

  return v5;
}

- (id)_chatSyncOperationGroupWithName:(id)a3
{
  v3 = (__CFString *)a3;
  if (![(__CFString *)v3 length])
  {

    v3 = @"ChatSync";
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  [v4 setName:v3];

  return v4;
}

- (id)_chatSyncOperationGroup
{
  return [(IMDCKChatSyncCKOperationFactory *)self _chatSyncOperationGroupWithName:0];
}

- (id)fetchChatZoneChangesCKOperationUsingToken:(id)a3 zone:(id)a4 resultsLimit:(unint64_t)a5 groupName:(id)a6 activity:(id)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (v13)
  {
    id v16 = objc_alloc(MEMORY[0x1E4F1A070]);
    v17 = IMSingleObjectArray();
    v18 = [(IMDCKChatSyncCKOperationFactory *)self _chatFetchRecordZoneChangesOptionsDictionaryUsingToken:v12 zoneID:v13 resultsLimit:a5];
    v19 = (void *)[v16 initWithRecordZoneIDs:v17 configurationsByRecordZoneID:v18];

    v20 = [(IMDCKChatSyncCKOperationFactory *)self _chatFetchRecordZoneChangesCKConfiguration:v15];
    [v19 setConfiguration:v20];

    v21 = [(IMDCKChatSyncCKOperationFactory *)self _chatSyncOperationGroupWithName:v14];
    [v19 setGroup:v21];

    [v19 setFetchAllChanges:1];
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        v23 = [v19 operationID];
        int v26 = 138412290;
        v27 = v23;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Created fetch chat operation ID %@", (uint8_t *)&v26, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        LOWORD(v26) = 0;
        _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "fetchChatZoneChangesCKOperationUsingToken was passed in a nil zone", (uint8_t *)&v26, 2u);
      }
    }
    v19 = 0;
  }

  return v19;
}

- (id)fetchChatZoneChangesCKOperationUsingToken:(id)a3 zone:(id)a4 resultsLimit:(unint64_t)a5 activity:(id)a6
{
  return [(IMDCKChatSyncCKOperationFactory *)self fetchChatZoneChangesCKOperationUsingToken:a3 zone:a4 resultsLimit:a5 groupName:0 activity:a6];
}

- (id)_chatWriteRecordsCKConfiguration:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1A208];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setQualityOfService:17];
  [v5 setAllowsCellularAccess:1];
  objc_msgSend(v5, "im_setActivity:", v4);

  return v5;
}

- (id)saveChatsCKOperationUsingRecordsToSave:(id)a3 activity:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:v6 recordIDsToDelete:0];
    [v8 setAtomic:1];
    [v8 setSavePolicy:1];
    id v9 = [(IMDCKChatSyncCKOperationFactory *)self _chatWriteRecordsCKConfiguration:v7];
    [v8 setConfiguration:v9];

    id v10 = [(IMDCKChatSyncCKOperationFactory *)self _chatSyncOperationGroup];
    [v8 setGroup:v10];

    id v11 = [v8 group];
    objc_msgSend(v11, "setQuantity:", objc_msgSend(v6, "count"));

    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        id v13 = [v8 operationID];
        int v16 = 138412290;
        v17 = v13;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Created modify chat operation ID %@", (uint8_t *)&v16, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "writeChatsOperationUsingRecordsToSave was passed in a nil records array", (uint8_t *)&v16, 2u);
      }
    }
    id v8 = 0;
  }

  return v8;
}

- (id)deleteChatCKOperationUsingRecordIDstoDelete:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:0 recordIDsToDelete:v4];
  [v5 setAtomic:0];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v6 setQualityOfService:17];
  [v6 setAllowsCellularAccess:1];
  id v7 = [(IMDCKChatSyncCKOperationFactory *)self _chatSyncOperationGroup];
  objc_msgSend(v7, "setQuantity:", objc_msgSend(v4, "count"));
  [v5 setConfiguration:v6];
  [v5 setGroup:v7];
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v5 operationID];
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Created deleted chat operation ID %@", (uint8_t *)&v11, 0xCu);
    }
  }

  return v5;
}

- (id)fetchChatCKOperationUsingRecordIDs:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)[objc_alloc(MEMORY[0x1E4F1A0A8]) initWithRecordIDs:v4];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v6 setQualityOfService:17];
  [v6 setAllowsCellularAccess:1];
  id v7 = [(IMDCKChatSyncCKOperationFactory *)self _chatSyncOperationGroup];
  objc_msgSend(v7, "setQuantity:", objc_msgSend(v4, "count"));
  [v5 setConfiguration:v6];
  [v5 setGroup:v7];
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v5 operationID];
      int v11 = 138412290;
      id v12 = v9;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Created fetch chat operation ID %@", (uint8_t *)&v11, 0xCu);
    }
  }

  return v5;
}

@end