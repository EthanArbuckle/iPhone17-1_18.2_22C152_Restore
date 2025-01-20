@interface IMDCKMessageSyncCKOperationFactory
- (id)_fetchOptionsDictionaryWithFetchOptions:(id)a3 andZoneID:(id)a4;
- (id)_messageFetchRecordZoneChangesOptionsDictionaryUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5;
- (id)_operationGroupWithName:(id)a3;
- (id)deleteMessageCKOperationUsingRecordIDstoDelete:(id)a3;
- (id)deleteRecoverableMessageCKOperationUsingRecordIDstoDelete:(id)a3;
- (id)fetchArchivedRecordsOperationWithSyncToken:(id)a3 zoneID:(id)a4 activity:(id)a5;
- (id)fetchMessageZoneChangesCKOperationUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5 operationGroupName:(id)a6 activity:(id)a7;
- (id)saveMessagesCKOperationUsingRecordsToSave:(id)a3 operationGroupName:(id)a4 activity:(id)a5;
@end

@implementation IMDCKMessageSyncCKOperationFactory

- (id)_messageFetchRecordZoneChangesOptionsDictionaryUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5
{
  v7 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v8 = a4;
  id v9 = a3;
  id v10 = objc_alloc_init(v7);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1A060]);
  [v11 setDesiredKeys:0];
  [v11 setPreviousServerChangeToken:v9];

  [v11 setResultsLimit:a5];
  [v11 setFetchNewestChangesFirst:v9 == 0];
  [v10 setObject:v11 forKey:v8];

  return v10;
}

- (id)_operationGroupWithName:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1A218];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setName:v4];

  return v5;
}

- (id)fetchMessageZoneChangesCKOperationUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5 operationGroupName:(id)a6 activity:(id)a7
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v27 = v12;
  v16 = [(IMDCKMessageSyncCKOperationFactory *)self _messageFetchRecordZoneChangesOptionsDictionaryUsingToken:v12 zoneID:v13 resultsLimit:a5];
  id v17 = objc_alloc(MEMORY[0x1E4F1A070]);
  v18 = IMSingleObjectArray();
  v19 = (void *)[v17 initWithRecordZoneIDs:v18 configurationsByRecordZoneID:v16];

  id v20 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v20 setQualityOfService:17];
  [v20 setAllowsCellularAccess:1];
  objc_msgSend(v20, "im_setActivity:", v15);
  v21 = [(IMDCKMessageSyncCKOperationFactory *)self _operationGroupWithName:v14];
  [v19 setGroup:v21];

  [v19 setConfiguration:v20];
  [v19 setFetchAllChanges:0];
  if (IMOSLoggingEnabled())
  {
    v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [v19 operationID];
      v24 = [v19 group];
      v25 = [v24 name];
      *(_DWORD *)buf = 138412546;
      id v29 = v23;
      __int16 v30 = 2112;
      v31 = v25;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Created fetch message operation ID %@ operationGroupName %@", buf, 0x16u);
    }
  }

  return v19;
}

- (id)saveMessagesCKOperationUsingRecordsToSave:(id)a3 operationGroupName:(id)a4 activity:(id)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:v8 recordIDsToDelete:0];
  [v11 setAtomic:0];
  id v12 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v12 setQualityOfService:17];
  [v12 setAllowsCellularAccess:1];
  id v13 = [(IMDCKMessageSyncCKOperationFactory *)self _operationGroupWithName:v9];
  objc_msgSend(v13, "setQuantity:", objc_msgSend(v8, "count"));
  [v11 setConfiguration:v12];
  [v11 setGroup:v13];
  [v11 setSavePolicy:1];
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [v11 operationID];
      v16 = [v11 group];
      id v17 = [v16 name];
      int v19 = 138412546;
      id v20 = v15;
      __int16 v21 = 2112;
      v22 = v17;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Created modify message operation ID %@ operationGroupName %@", (uint8_t *)&v19, 0x16u);
    }
  }

  return v11;
}

- (id)deleteMessageCKOperationUsingRecordIDstoDelete:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:0 recordIDsToDelete:v3];
  [v4 setAtomic:0];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v5 setQualityOfService:17];
  [v5 setAllowsCellularAccess:1];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  [v6 setName:@"MessageDelete"];
  objc_msgSend(v6, "setQuantity:", objc_msgSend(v3, "count"));
  [v4 setConfiguration:v5];
  [v4 setGroup:v6];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v4 operationID];
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Created deleted message operation ID %@", (uint8_t *)&v10, 0xCu);
    }
  }

  return v4;
}

- (id)deleteRecoverableMessageCKOperationUsingRecordIDstoDelete:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:0 recordIDsToDelete:v3];
  [v4 setAtomic:0];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v5 setQualityOfService:17];
  [v5 setAllowsCellularAccess:1];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  [v6 setName:@"RecoverableMessageDelete"];
  objc_msgSend(v6, "setQuantity:", objc_msgSend(v3, "count"));
  [v4 setConfiguration:v5];
  [v4 setGroup:v6];
  if (IMOSLoggingEnabled())
  {
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v4 operationID];
      int v10 = 138412290;
      id v11 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Created recoverable deleted message operation ID %@", (uint8_t *)&v10, 0xCu);
    }
  }

  return v4;
}

- (id)_fetchOptionsDictionaryWithFetchOptions:(id)a3 andZoneID:(id)a4
{
  return (id)objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", a3, a4, 0);
}

- (id)fetchArchivedRecordsOperationWithSyncToken:(id)a3 zoneID:(id)a4 activity:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = objc_alloc_init(MEMORY[0x1E4F1A030]);
  [v11 setPreviousServerChangeToken:v8];
  uint64_t v12 = [(IMDCKMessageSyncCKOperationFactory *)self _fetchOptionsDictionaryWithFetchOptions:v11 andZoneID:v9];
  id v13 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v13 setAllowsCellularAccess:1];
  [v13 setQualityOfService:17];
  id v14 = objc_alloc(MEMORY[0x1E4F1A028]);
  id v15 = IMSingleObjectArray();
  v16 = (void *)[v14 initWithRecordZoneIDs:v15 configurationsByRecordZoneID:v12];

  [v16 setFetchAllChanges:0];
  [v16 setConfiguration:v13];
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      v18 = [v16 operationID];
      int v20 = 138412546;
      __int16 v21 = v18;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Created fetched archived operation ID %@ using zone id %@", (uint8_t *)&v20, 0x16u);
    }
  }

  return v16;
}

@end