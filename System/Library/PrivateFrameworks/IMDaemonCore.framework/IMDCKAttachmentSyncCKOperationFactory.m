@interface IMDCKAttachmentSyncCKOperationFactory
+ (id)_desiredKeysArrayForType:(int64_t)a3;
- (BOOL)_defaultsSayWeHaveSyncedOnce;
- (id)_attachmentFetchRecordZoneChangesOptionsDictionaryUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5 desiredKeys:(int64_t)a6;
- (id)_operationGroupWithName:(id)a3;
- (id)deleteAttachmentCKOperationUsingRecordIDstoDelete:(id)a3;
- (id)fetchAttachmentZoneChangesCKOperationUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5 desiredKeys:(int64_t)a6 operationGroupName:(id)a7 activity:(id)a8;
- (id)fetchAttachmentZoneRecords:(id)a3 desiredKeys:(int64_t)a4 operationGroupName:(id)a5 activity:(id)a6;
- (id)saveAttachmentsCKOperationUsingRecordsToSave:(id)a3 operationGroupName:(id)a4 activity:(id)a5;
@end

@implementation IMDCKAttachmentSyncCKOperationFactory

- (id)fetchAttachmentZoneChangesCKOperationUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5 desiredKeys:(int64_t)a6 operationGroupName:(id)a7 activity:(id)a8
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  v18 = [(IMDCKAttachmentSyncCKOperationFactory *)self _attachmentFetchRecordZoneChangesOptionsDictionaryUsingToken:v14 zoneID:v15 resultsLimit:a5 desiredKeys:a6];
  id v19 = objc_alloc(MEMORY[0x1E4F1A070]);
  v20 = IMSingleObjectArray();
  v21 = (void *)[v19 initWithRecordZoneIDs:v20 configurationsByRecordZoneID:v18];

  id v22 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v22 setQualityOfService:17];
  [v22 setAllowsCellularAccess:1];
  objc_msgSend(v22, "im_setActivity:", v17);
  v23 = [(IMDCKAttachmentSyncCKOperationFactory *)self _operationGroupWithName:v16];
  [v21 setGroup:v23];

  [v21 setConfiguration:v22];
  [v21 setFetchAllChanges:0];
  if (IMOSLoggingEnabled())
  {
    v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      v25 = [v21 operationID];
      int v27 = 138412546;
      v28 = v25;
      __int16 v29 = 2112;
      v30 = v18;
      _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Created fetch attachment operation  ID %@ fetch operation dictionary %@", (uint8_t *)&v27, 0x16u);
    }
  }

  return v21;
}

- (id)fetchAttachmentZoneRecords:(id)a3 desiredKeys:(int64_t)a4 operationGroupName:(id)a5 activity:(id)a6
{
  v10 = (objc_class *)MEMORY[0x1E4F1A0A8];
  id v11 = a6;
  id v12 = a5;
  id v13 = a3;
  id v14 = (void *)[[v10 alloc] initWithRecordIDs:v13];

  id v15 = [(id)objc_opt_class() _desiredKeysArrayForType:a4];
  [v14 setDesiredKeys:v15];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v16 setQualityOfService:17];
  [v16 setAllowsCellularAccess:1];
  objc_msgSend(v16, "im_setActivity:", v11);

  id v17 = [(IMDCKAttachmentSyncCKOperationFactory *)self _operationGroupWithName:v12];

  [v14 setGroup:v17];
  [v14 setConfiguration:v16];

  return v14;
}

- (id)saveAttachmentsCKOperationUsingRecordsToSave:(id)a3 operationGroupName:(id)a4 activity:(id)a5
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
  objc_msgSend(v12, "im_setActivity:", v10);
  id v13 = [(IMDCKAttachmentSyncCKOperationFactory *)self _operationGroupWithName:v9];
  objc_msgSend(v13, "setQuantity:", objc_msgSend(v8, "count"));
  [v11 setConfiguration:v12];
  [v11 setGroup:v13];
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [v11 operationID];
      id v16 = [v11 group];
      id v17 = [v16 name];
      int v19 = 138412546;
      id v20 = v15;
      __int16 v21 = 2112;
      id v22 = v17;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Created modify attachment operation ID %@ operationGroupName %@", (uint8_t *)&v19, 0x16u);
    }
  }

  return v11;
}

- (BOOL)_defaultsSayWeHaveSyncedOnce
{
  v2 = +[IMDCKUtilities sharedInstance];
  v3 = [v2 syncState];
  v4 = [v3 lastSyncDate];
  BOOL v5 = v4 != 0;

  return v5;
}

- (id)_operationGroupWithName:(id)a3
{
  v3 = (objc_class *)MEMORY[0x1E4F1A218];
  id v4 = a3;
  id v5 = objc_alloc_init(v3);
  [v5 setName:v4];

  return v5;
}

- (id)_attachmentFetchRecordZoneChangesOptionsDictionaryUsingToken:(id)a3 zoneID:(id)a4 resultsLimit:(unint64_t)a5 desiredKeys:(int64_t)a6
{
  id v9 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v10 = a4;
  id v11 = a3;
  id v12 = objc_alloc_init(v9);
  id v13 = objc_alloc_init(MEMORY[0x1E4F1A060]);
  id v14 = [(id)objc_opt_class() _desiredKeysArrayForType:a6];
  [v13 setDesiredKeys:v14];
  [v13 setPreviousServerChangeToken:v11];

  [v13 setResultsLimit:a5];
  [v13 setFetchNewestChangesFirst:v11 == 0];
  [v12 setObject:v13 forKey:v10];

  return v12;
}

+ (id)_desiredKeysArrayForType:(int64_t)a3
{
  v9[2] = *MEMORY[0x1E4F143B8];
  if (a3 == 1)
  {
    v8[0] = @"cm";
    v8[1] = @"m";
    v8[2] = @"lqa";
    v8[3] = @"avid";
    v3 = (void *)MEMORY[0x1E4F1C978];
    id v4 = v8;
    uint64_t v5 = 4;
    goto LABEL_5;
  }
  if (!a3)
  {
    v9[0] = @"cm";
    v9[1] = @"m";
    v3 = (void *)MEMORY[0x1E4F1C978];
    id v4 = v9;
    uint64_t v5 = 2;
LABEL_5:
    v6 = [v3 arrayWithObjects:v4 count:v5];
    goto LABEL_7;
  }
  v6 = 0;
LABEL_7:

  return v6;
}

- (id)deleteAttachmentCKOperationUsingRecordIDstoDelete:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1A198]) initWithRecordsToSave:0 recordIDsToDelete:v3];
  [v4 setAtomic:0];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1A208]);
  [v5 setQualityOfService:17];
  [v5 setAllowsCellularAccess:1];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1A218]);
  [v6 setName:@"AttachmentDelete"];
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
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Created deleted attachment operation ID %@", (uint8_t *)&v10, 0xCu);
    }
  }

  return v4;
}

@end