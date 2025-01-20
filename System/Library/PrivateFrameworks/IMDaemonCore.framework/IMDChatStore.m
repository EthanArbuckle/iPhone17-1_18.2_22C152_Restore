@interface IMDChatStore
+ (IMDChatStore)sharedInstance;
- (BOOL)_hasCancellableScheduledMessageForChat:(id)a3;
- (BOOL)_shouldMarkAllChatsAsNeedingSync;
- (BOOL)_storeChat:(id)a3 updateProtectedProperties:(BOOL)a4;
- (BOOL)storeChat:(id)a3;
- (BOOL)updateHandle:(id)a3 sourceMessage:(id)a4 personCentricID:(id)a5 onService:(id)a6;
- (BOOL)updatePersonCentricIDForHandlesInChatWithMessage:(id)a3 fromIdentifier:(id)a4 personCentricID:(id)a5 chat:(id)a6;
- (CKRecordZoneID)record1ZoneID;
- (CKRecordZoneID)recordZoneID;
- (IMDChatStore)init;
- (IMDMessagePTaskStore)messagePTaskStore;
- (IMDRemoteDatabaseProtocol)database;
- (IMStateCaptureAssistant)stateCaptureAssistant;
- (NSString)modificationStamp;
- (id)_chatRegistry;
- (id)_fetchChatRecordsToUploadWithFilter:(unint64_t)a3 limit:(unint64_t)a4;
- (id)_generateCKRecordsFromChatRecords:(id)a3 filter:(unint64_t)a4;
- (id)_incomingChatWithChatRecord:(id)a3;
- (id)_incomingChatsWithChatRecords:(id)a3;
- (id)_loadChatsIncludingAllChats:(BOOL)a3;
- (id)_lockRecord;
- (id)batchOfRecordIDsToDeleteWithLimit:(int64_t)a3 error:(id *)a4;
- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(unint64_t)a4 error:(id *)a5;
- (id)chatIdentitiesForMessageWithGUIDs:(id)a3;
- (id)chatWithGUID:(id)a3;
- (id)chatsFilteredUsingPredicate:(id)a3;
- (id)chatsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5;
- (id)chatsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 olderThan:(id)a5 limit:(unint64_t)a6;
- (id)chatsGUIDsForMessageWithGUID:(id)a3;
- (id)chatsGUIDsForMessageWithIdentifier:(int64_t)a3;
- (id)chatsWithGroupID:(id)a3;
- (id)chatsWithHandle:(id)a3 onService:(id)a4;
- (id)chatsWithHandles:(id)a3 onService:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7;
- (id)chatsWithHandles:(id)a3 onService:(id)a4 displayName:(id)a5 originalGroupID:(id)a6 style:(unsigned __int8)a7;
- (id)chatsWithIdentifier:(id)a3;
- (id)chatsWithIdentifier:(id)a3 onService:(id)a4;
- (id)chatsWithIdentifier:(id)a3 onServiceNamed:(id)a4;
- (id)chatsWithPinningIdentifier:(id)a3;
- (id)chatsWithRoomname:(id)a3 onService:(id)a4;
- (id)copyDuplicateGroupChatsWithLimit:(int64_t)a3;
- (id)loadAllChats;
- (id)loadRecentChats;
- (id)newestChatWithGroupID:(id)a3 onService:(id)a4;
- (id)newestChatWithOriginalGroupID:(id)a3 onService:(id)a4;
- (id)serviceNamesForFilter:(unint64_t)a3;
- (id)stateDictionaryForDiagnosticsRequest;
- (id)syncTokenStore;
- (id)zoneIDForService:(id)a3;
- (unint64_t)_maxFetchChatAttempts;
- (unint64_t)unreadCountForChat:(id)a3;
- (void)_addGroupPhotoToTransferCenterForChat:(id)a3;
- (void)_broadcastToForceReloadChats;
- (void)_hasMarkedAllChatsAsNeedingSync;
- (void)_markAllChatsAsNeedingSync;
- (void)_performOrScheduleSpotlightIndexingOfAddedMessageWithGUID:(id)a3 chat:(id)a4 shouldDeferIndexing:(BOOL)a5;
- (void)_processIncomingChat:(id)a3;
- (void)_updateHasCancellableScheduledMessageForChat:(id)a3;
- (void)_updateModificationDate;
- (void)addMessageWithGUID:(id)a3 toChat:(id)a4;
- (void)addMessageWithGUID:(id)a3 toChat:(id)a4 deferSpotlightIndexing:(BOOL)a5;
- (void)blackholeChat:(id)a3;
- (void)clearLocalSyncState:(unint64_t)a3;
- (void)clearTombstonesForRecordIDs:(id)a3;
- (void)createSMSVariantsIfNeededFor:(id)a3;
- (void)deleteChat:(id)a3;
- (void)enumerateBatchedChatsFilteredUsingPredicate:(id)a3 batchSize:(unint64_t)a4 block:(id)a5;
- (void)enumerateBatchedChatsFilteredUsingPredicate:(id)a3 block:(id)a4;
- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5;
- (void)recordUpdateSucceededWithRecord:(id)a3;
- (void)remapMessageError:(unsigned int)a3 toError:(unsigned int)a4 forChat:(id)a5 completion:(id)a6;
- (void)removeMessageWithGUID:(id)a3 fromChat:(id)a4;
- (void)resetLocalSyncStateIfAppropriate;
- (void)setChatIsFiltered:(int64_t)a3 withChatGuid:(id)a4;
- (void)setMessagePTaskStore:(id)a3;
- (void)setModificationStamp:(id)a3;
- (void)setStateCaptureAssistant:(id)a3;
- (void)unblackholeChat:(id)a3;
@end

@implementation IMDChatStore

- (id)_incomingChatsWithChatRecords:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![v4 count])
  {
    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "No incoming chat records.", buf, 2u);
      }
    }
    id v21 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_27;
  }
  id v20 = v4;
  objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v4, "count"));
  id v21 = (id)objc_claimAutoreleasedReturnValue();
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (!v5)
  {

    goto LABEL_26;
  }
  char v6 = 0;
  uint64_t v7 = *(void *)v24;
  do
  {
    for (uint64_t i = 0; i != v5; ++i)
    {
      if (*(void *)v24 != v7) {
        objc_enumerationMutation(obj);
      }
      v9 = sub_1D9798E78(*(void *)(*((void *)&v23 + 1) + 8 * i));
      if (v9)
      {
        [(IMDChatStore *)self _processIncomingChat:v9];
        v10 = [(IMDChat *)v9 serviceName];
        char v11 = [v10 isEqualToString:*MEMORY[0x1E4F6E1A0]];

        v12 = [(IMDChat *)v9 serviceName];
        v6 |= v11;
        if ([v12 length])
        {
          v13 = +[IMDChatRegistry supportedServiceNames];
          v14 = [(IMDChat *)v9 serviceName];
          int v15 = [v13 containsObject:v14];

          if (v15)
          {
            [v21 addObject:v9];
            goto LABEL_16;
          }
        }
        else
        {
        }
        if (IMOSLoggingEnabled())
        {
          v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            v17 = [(IMDChat *)v9 serviceName];
            *(_DWORD *)buf = 138412546;
            v28 = v17;
            __int16 v29 = 2112;
            v30 = v9;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Tried to load chat for unsupported service (%@): %@", buf, 0x16u);
          }
        }
      }
LABEL_16:
    }
    uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v31 count:16];
  }
  while (v5);

  if (v6) {
    IMGreenTeaMessageReadLog();
  }
LABEL_26:
  id v4 = v20;
LABEL_27:

  return v21;
}

- (id)chatsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 olderThan:(id)a5 limit:(unint64_t)a6
{
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  uint64_t v16 = 0;
  v17 = &v16;
  uint64_t v18 = 0x3032000000;
  v19 = sub_1D97C702C;
  id v20 = sub_1D97C703C;
  id v21 = 0;
  v12 = [(IMDChatStore *)self database];
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D968DA80;
  v15[3] = &unk_1E6B73420;
  v15[4] = &v16;
  [v12 fetchChatRecordsFilteredUsingPredicate:v10 sortedUsingLastMessageDateAscending:v8 olderThan:v11 limit:a6 completionHandler:v15];

  v13 = [(IMDChatStore *)self _incomingChatsWithChatRecords:v17[5]];
  _Block_object_dispose(&v16, 8);

  return v13;
}

- (IMDRemoteDatabaseProtocol)database
{
  return (IMDRemoteDatabaseProtocol *)[MEMORY[0x1E4F6BF48] synchronousDatabase];
}

- (id)stateDictionaryForDiagnosticsRequest
{
  v7[2] = *MEMORY[0x1E4F143B8];
  v6[0] = @"schema_version";
  v2 = [NSNumber numberWithUnsignedInt:IMDSMSRecordStoreGetSchemaVersion()];
  v6[1] = @"schema";
  v7[0] = v2;
  v3 = IMDSMSRecordStoreGetSchema();
  v7[1] = v3;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v7 forKeys:v6 count:2];

  return v4;
}

- (CKRecordZoneID)recordZoneID
{
  v2 = +[IMDRecordZoneManager sharedInstance];
  v3 = [v2 chatRecordZoneID];

  return (CKRecordZoneID *)v3;
}

- (CKRecordZoneID)record1ZoneID
{
  v2 = +[IMDRecordZoneManager sharedInstance];
  v3 = [v2 chat1RecordZoneID];

  return (CKRecordZoneID *)v3;
}

- (id)syncTokenStore
{
  if (qword_1EA8CA490 != -1) {
    dispatch_once(&qword_1EA8CA490, &unk_1F3390F20);
  }
  v2 = (void *)qword_1EA8CA488;

  return v2;
}

- (void)resetLocalSyncStateIfAppropriate
{
  if ([(IMDChatStore *)self _shouldMarkAllChatsAsNeedingSync])
  {
    [(IMDChatStore *)self clearLocalSyncState:3];
    [(IMDChatStore *)self _hasMarkedAllChatsAsNeedingSync];
  }
  id v3 = +[IMDChatRegistry sharedInstance];
  [v3 markDeferredChatsAsNeedingSync];
}

- (void)clearLocalSyncState:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v22 = v3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Clearing local chat sync state, flags 0x%x", buf, 8u);
    }
  }
  if (v3)
  {
    char v6 = +[IMDCKUtilities sharedInstance];
    uint64_t v7 = [v6 syncState];
    [v7 setLastSyncDate:0];

    BOOL v8 = [(IMDChatStore *)self syncTokenStore];
    [v8 persistToken:0 forKey:@"changeToken"];

    v9 = [(IMDChatStore *)self syncTokenStore];
    [v9 persistToken:0 forKey:@"chat1changeToken"];
  }
  if ((v3 & 2) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Marking all chats as dirty", buf, 2u);
      }
    }
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v11 = +[IMDChatRegistry sharedInstance];
    v12 = [v11 chats];

    uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v17;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v17 != v14) {
            objc_enumerationMutation(v12);
          }
          [*(id *)(*((void *)&v16 + 1) + 8 * v15++) resetCKSyncState];
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v13);
    }
  }
  else if ((v3 & 0x10) != 0)
  {
    [(IMDChatStore *)self _markAllChatsAsNeedingSync];
  }
}

- (void)_markAllChatsAsNeedingSync
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v2 setBool:0 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF28]];
}

- (BOOL)_shouldMarkAllChatsAsNeedingSync
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
    uint64_t v5 = [MEMORY[0x1E4F6E720] sharedInstance];
    int v4 = [v5 getBoolFromDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF28]] ^ 1;
  }
  if (IMOSLoggingEnabled())
  {
    char v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = @"NO";
      if (v4) {
        uint64_t v7 = @"YES";
      }
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "_shouldMarkAllChatsAsNeedingSync %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return v4;
}

- (void)_hasMarkedAllChatsAsNeedingSync
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v2 setBool:1 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF28]];
}

- (id)_lockRecord
{
  id v2 = (void *)qword_1EA8CDC60;
  if (!qword_1EA8CDC60)
  {
    if (IMOSLoggingEnabled())
    {
      char v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Generating Lock Record - OH BOY", v11, 2u);
      }
    }
    int v4 = +[IMDRecordZoneManager sharedInstance];
    uint64_t v5 = [v4 chatRecordZoneID];

    char v6 = (void *)[objc_alloc(MEMORY[0x1E4F1A2F8]) initWithRecordName:@"chatLockRecordName" zoneID:v5];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1A2D8]) initWithRecordType:@"chatLockRecordType" recordID:v6];
    BOOL v8 = [NSString stringGUID];
    [v7 setValue:v8 forKey:@"lRKey"];

    int v9 = (void *)qword_1EA8CDC60;
    qword_1EA8CDC60 = (uint64_t)v7;

    id v2 = (void *)qword_1EA8CDC60;
  }

  return v2;
}

- (unint64_t)_maxFetchChatAttempts
{
  id v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  char v3 = [v2 objectForKey:@"ck-client-fetch-chats-max-retry"];
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    unint64_t v4 = [v3 unsignedIntValue];
  }
  else {
    unint64_t v4 = 100;
  }

  return v4;
}

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(unint64_t)a4 error:(id *)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  unint64_t v8 = [(IMDChatStore *)self _maxFetchChatAttempts];
  uint64_t v9 = 0;
  if (v8 <= 1) {
    uint64_t v10 = 1;
  }
  else {
    uint64_t v10 = v8;
  }
  do
  {
    uint64_t v11 = [(IMDChatStore *)self _fetchChatRecordsToUploadWithFilter:a3 limit:a4];
    if (![v11 count]) {
      goto LABEL_18;
    }
    v12 = [(IMDChatStore *)self _generateCKRecordsFromChatRecords:v11 filter:a3];
    uint64_t v13 = v12;
    if (v12 && [v12 count]) {
      goto LABEL_19;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = [v11 count];
        *(_DWORD *)buf = 134218240;
        uint64_t v26 = v15;
        __int16 v27 = 2048;
        uint64_t v28 = v9;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "For batch of %lu records to write up, all records failed to convert to CKRecord, loop %lu.", buf, 0x16u);
      }
    }
    ++v9;
  }
  while (v10 != v9);
  if (IMOSLoggingEnabled())
  {
    long long v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v26 = v10;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Tried max times(%lu) to find chats to fetch, aborting", buf, 0xCu);
    }
  }
  if (a5)
  {
    id v17 = objc_alloc(MEMORY[0x1E4F28C58]);
    uint64_t v23 = *MEMORY[0x1E4F28568];
    long long v24 = @"Failed to find chats to sync; fetched chats failed to encode as CKRecord";
    long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    *a5 = (id)[v17 initWithDomain:*MEMORY[0x1E4F6D200] code:1 userInfo:v18];

    uint64_t v11 = [MEMORY[0x1E4F6E890] sharedInstance];
    id v19 = *a5;
    id v20 = objc_msgSend([NSString alloc], "initWithFormat:", @"%s", "-[IMDChatStore(RecordStore) batchOfRecordsToWriteWithFilter:limit:error:]");
    [v11 forceAutoBugCaptureWithSubType:@"ExceededMaxFetchChatAttempts" errorPayload:v19 type:@"MiCSync" context:v20];

LABEL_18:
    uint64_t v13 = 0;
LABEL_19:

    goto LABEL_20;
  }
  uint64_t v13 = 0;
LABEL_20:

  return v13;
}

- (void)recordUpdateSucceededWithRecord:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDCKChatSyncController sharedInstance];
  [v4 _updateChatUsingCKRecord:v3 onRead:0 didSucceed:1 dispatchToMain:0];
}

- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [MEMORY[0x1E4F6EA68] sharedInstance];
  uint64_t v11 = (void *)[v8 copy];
  if (([v10 wasZoneNotFound:v9] & 1) != 0 || objc_msgSend(v10, "wasUnknownItem:", v9))
  {
    v12 = [v7 recordName];
    int v13 = [v12 isEqualToString:@"chatLockRecordName"];

    if (v13)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v29 = 138412290;
          id v30 = v9;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "We got back error [%@] on the lock record, setting the lock record to nil to re-generate on next sync", (uint8_t *)&v29, 0xCu);
        }
      }
      uint64_t v15 = (void *)qword_1EA8CDC60;
      qword_1EA8CDC60 = 0;
    }
    else
    {
      long long v16 = +[IMDChatRegistry sharedInstance];
      uint64_t v15 = [v16 existingChatWithGUID:v11];

      if (v15)
      {
        if (IMOSLoggingEnabled())
        {
          id v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            int v29 = 138412290;
            id v30 = v15;
            _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Marking existing chat %@ as deferred", (uint8_t *)&v29, 0xCu);
          }
        }
        [v15 updateCloudKitSyncState:2];
        [v15 updateServerChangeToken:0];
        [v15 updateCloudKitRecordID:0];
        long long v18 = +[IMDChatRegistry sharedInstance];
        [v18 _markForksAsSyncedForChat:v15];
      }
    }
    goto LABEL_29;
  }
  id v19 = +[IMDCKUtilities sharedInstance];
  uint64_t v15 = [v19 extractServerRecordFromCKServerErrorRecordChanged:v9];

  int v20 = IMOSLoggingEnabled();
  if (v15)
  {
    if (v20)
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v29 = 138412290;
        id v30 = v15;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Extracted record from server error %@", (uint8_t *)&v29, 0xCu);
      }
    }
    int v22 = [v15 recordID];
    uint64_t v23 = [v22 recordName];
    int v24 = [v23 isEqualToString:@"chatLockRecordName"];

    if (!v24)
    {
      long long v25 = +[IMDChatRegistry sharedInstance];
      [v25 resolveChatConflictUsingSyncData:v15 localGUID:v11];
LABEL_28:

      goto LABEL_29;
    }
LABEL_27:
    long long v25 = (void *)qword_1EA8CDC60;
    qword_1EA8CDC60 = 0;
    goto LABEL_28;
  }
  if (v20)
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      LOWORD(v29) = 0;
      _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Could not extract server record, checking if lock record", (uint8_t *)&v29, 2u);
    }
  }
  __int16 v27 = [v7 recordName];
  int v28 = [v27 isEqualToString:@"chatLockRecordName"];

  if (v28) {
    goto LABEL_27;
  }
LABEL_29:
}

- (id)serviceNamesForFilter:(unint64_t)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (a3 == 2)
  {
    id v4 = +[IMDServiceController sharedController];
    uint64_t v5 = [v4 serviceNamesSupportingCapability:*MEMORY[0x1E4F6E080]];
    char v6 = [v5 allObjects];
    id v3 = [v6 arrayByExcludingObjectsInArray:*MEMORY[0x1E4F6E188]];
  }
  else
  {
    if (a3 == 1)
    {
      id v3 = (id)*MEMORY[0x1E4F6E188];
      goto LABEL_7;
    }
    id v4 = +[IMDServiceController sharedController];
    uint64_t v5 = [v4 serviceNamesSupportingCapability:*MEMORY[0x1E4F6E080]];
    id v3 = [v5 allObjects];
  }

LABEL_7:
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v3;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Predicate filtering for services %@", (uint8_t *)&v9, 0xCu);
    }
  }

  return v3;
}

- (id)_fetchChatRecordsToUploadWithFilter:(unint64_t)a3 limit:(unint64_t)a4
{
  v23[3] = *MEMORY[0x1E4F143B8];
  char v6 = [(IMDChatStore *)self serviceNamesForFilter:a3];
  id v7 = (void *)MEMORY[0x1E4F28BA0];
  id v8 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K != %@", *MEMORY[0x1E4F6CD38], &stru_1F3398578];
  v23[0] = v8;
  int v9 = objc_msgSend(MEMORY[0x1E4F28F60], "__im_chatPredicateForServiceNames:", v6);
  v23[1] = v9;
  id v10 = objc_msgSend(MEMORY[0x1E4F28F60], "__im_chatPredicateForSyncState:", 0);
  v23[2] = v10;
  uint64_t v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v23 count:3];
  v12 = [v7 andPredicateWithSubpredicates:v11];

  uint64_t v17 = 0;
  long long v18 = &v17;
  uint64_t v19 = 0x3032000000;
  int v20 = sub_1D9729270;
  id v21 = sub_1D9729280;
  id v22 = 0;
  int v13 = [(IMDChatStore *)self database];
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  v16[2] = sub_1D9729288;
  v16[3] = &unk_1E6B73420;
  v16[4] = &v17;
  [v13 fetchChatRecordsFilteredUsingPredicate:v12 sortedUsingDescriptors:MEMORY[0x1E4F1CBF0] limit:a4 completionHandler:v16];

  id v14 = (id)v18[5];
  _Block_object_dispose(&v17, 8);

  return v14;
}

- (void)createSMSVariantsIfNeededFor:(id)a3
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v3 = +[IMDAccountController sharedAccountController];
  v51 = [v3 anySessionForServiceName:*MEMORY[0x1E4F6E1A0]];

  if (v51)
  {
    long long v68 = 0u;
    long long v69 = 0u;
    long long v66 = 0u;
    long long v67 = 0u;
    id obj = v50;
    uint64_t v54 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
    if (v54)
    {
      uint64_t v53 = *(void *)v67;
      do
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v67 != v53) {
            objc_enumerationMutation(obj);
          }
          uint64_t v5 = *(void **)(*((void *)&v66 + 1) + 8 * i);
          if ([v5 style] == 45)
          {
            buf[0] = 45;
            char v6 = [v5 guid];
            id v64 = 0;
            id v65 = 0;
            IMComponentsFromChatGUID();
            id v7 = v65;
            id v8 = v64;

            int v9 = [(IMDChatStore *)self chatsWithIdentifier:v7 onServiceNamed:*MEMORY[0x1E4F6E1A0]];
            id v10 = [v9 firstObject];
          }
          else
          {
            uint64_t v11 = [v5 groupID];
            v12 = [(IMDChatStore *)self chatsWithGroupID:v11];

            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v7 = v12;
            uint64_t v13 = [v7 countByEnumeratingWithState:&v60 objects:v75 count:16];
            if (v13)
            {
              uint64_t v14 = *(void *)v61;
LABEL_11:
              uint64_t v15 = 0;
              while (1)
              {
                if (*(void *)v61 != v14) {
                  objc_enumerationMutation(v7);
                }
                long long v16 = *(void **)(*((void *)&v60 + 1) + 8 * v15);
                uint64_t v17 = [v5 service];
                long long v18 = [v17 internalName];
                char v19 = [v18 isEqualToString:*MEMORY[0x1E4F6E1A0]];

                if (v19) {
                  break;
                }
                if (v13 == ++v15)
                {
                  uint64_t v13 = [v7 countByEnumeratingWithState:&v60 objects:v75 count:16];
                  if (v13) {
                    goto LABEL_11;
                  }
                  goto LABEL_17;
                }
              }
              id v10 = v16;

              if (v10) {
                goto LABEL_32;
              }
            }
            else
            {
LABEL_17:
            }
            int v20 = [v5 groupID];
            id v21 = [v5 originalGroupID];
            char v22 = [v20 isEqualToString:v21];

            if (v22)
            {
              id v10 = 0;
            }
            else
            {
              uint64_t v23 = [v5 originalGroupID];
              int v24 = [(IMDChatStore *)self chatsWithGroupID:v23];

              long long v58 = 0u;
              long long v59 = 0u;
              long long v56 = 0u;
              long long v57 = 0u;
              id v7 = v24;
              id v10 = (id)[v7 countByEnumeratingWithState:&v56 objects:v74 count:16];
              if (v10)
              {
                uint64_t v25 = *(void *)v57;
                while (2)
                {
                  for (j = 0; j != v10; j = (char *)j + 1)
                  {
                    if (*(void *)v57 != v25) {
                      objc_enumerationMutation(v7);
                    }
                    __int16 v27 = *(void **)(*((void *)&v56 + 1) + 8 * (void)j);
                    int v28 = [v5 service];
                    int v29 = [v28 internalName];
                    int v30 = [v29 isEqualToString:*MEMORY[0x1E4F6E1A0]];

                    if (v30)
                    {
                      id v10 = v27;
                      goto LABEL_31;
                    }
                  }
                  id v10 = (id)[v7 countByEnumeratingWithState:&v56 objects:v74 count:16];
                  if (v10) {
                    continue;
                  }
                  break;
                }
              }
LABEL_31:
            }
          }
LABEL_32:

          if (v10 || ([v5 isChatBot] & 1) != 0)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v31 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                uint64_t v32 = [v5 guid];
                v33 = [v10 guid];
                int v34 = [v5 isChatBot];
                *(_DWORD *)buf = 138412802;
                v35 = @"NO";
                if (v34) {
                  v35 = @"YES";
                }
                v71 = v32;
                __int16 v72 = 2112;
                *(void *)v73 = v33;
                *(_WORD *)&v73[8] = 2112;
                *(void *)&v73[10] = v35;
                _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Found SMS variant for new service chat %@ as %@ or it's a chat bot: %@", buf, 0x20u);
              }
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              v36 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
              {
                v37 = [v5 guid];
                char v38 = [v5 style];
                v39 = [v5 groupID];
                v40 = [v5 originalGroupID];
                *(_DWORD *)buf = 138413058;
                v71 = v37;
                __int16 v72 = 1024;
                *(_DWORD *)v73 = v38;
                *(_WORD *)&v73[4] = 2112;
                *(void *)&v73[6] = v39;
                *(_WORD *)&v73[14] = 2112;
                *(void *)&v73[16] = v40;
                _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_INFO, "Could not find SMS fallback chat for %@/style %c groupID %@ origGroupID %@, creating", buf, 0x26u);
              }
            }
            v41 = [v51 createHandleInfoFor:v5];
            uint64_t v42 = [v5 spamCategory];
            v43 = [v5 spamExtensionName];
            v44 = [v5 chatIdentifier];
            uint64_t v45 = [v5 style];
            v46 = [v5 displayName];
            v47 = [v5 groupID];
            v48 = [v5 originalGroupID];
            [v51 didJoinChat:v44 style:v45 displayName:v46 groupID:v47 originalGroupID:v48 handleInfo:v41 category:v42 spamExtensionName:v43];
          }
        }
        uint64_t v54 = [obj countByEnumeratingWithState:&v66 objects:v76 count:16];
      }
      while (v54);
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v49 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v49, OS_LOG_TYPE_INFO, "Could not find SMS session to create alternate chat to sync", buf, 2u);
    }
  }
}

- (id)zoneIDForService:(id)a3
{
  uint64_t v3 = [(id)*MEMORY[0x1E4F6E188] indexOfObject:a3];
  id v4 = +[IMDRecordZoneManager sharedInstance];
  uint64_t v5 = v4;
  if (v3 == 0x7FFFFFFFFFFFFFFFLL) {
    [v4 chat1RecordZoneID];
  }
  else {
  char v6 = [v4 chatRecordZoneID];
  }

  return v6;
}

- (id)_generateCKRecordsFromChatRecords:(id)a3 filter:(unint64_t)a4
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  theDict = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v32 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id obj = v4;
  uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v37 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        int v9 = sub_1D9798E78((uint64_t)v8);
        if (v9)
        {
          [v33 addObject:v9];
          id v10 = [(IMDChat *)v9 serviceName];
          uint64_t v11 = [(IMDChatStore *)self zoneIDForService:v10];

          v12 = [NSString stringGUID];
          id v35 = 0;
          id v13 = [(IMDChat *)v9 copyCKRecordRepresentationWithZoneID:v11 salt:v12 error:&v35];
          id v14 = v35;

          if (v13)
          {
            uint64_t v15 = [v13 recordID];
            long long v16 = [v15 recordName];
            char v17 = [v32 containsObject:v16];

            if ((v17 & 1) == 0)
            {
              id v18 = v13;
              CFDictionarySetValue(theDict, [(IMDChat *)v9 guid], v18);

              char v19 = [v18 recordID];
              int v20 = [v19 recordName];
              [v32 addObject:v20];

              goto LABEL_16;
            }
          }
          else
          {
            [(IMDChat *)v9 setCloudKitSyncState:2];
            [(IMDChatStore *)self storeChat:v9];
            char v22 = IMLogHandleForCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
            {
              uint64_t v25 = [(IMDChat *)v9 guid];
              *(_DWORD *)buf = 138412802;
              uint64_t v41 = (uint64_t)v25;
              __int16 v42 = 2112;
              id v43 = v14;
              __int16 v44 = 1024;
              LODWORD(v45) = 2;
              _os_log_error_impl(&dword_1D967A000, v22, OS_LOG_TYPE_ERROR, "Failed to generate CKRecord for chat %@, error %@, marking ck_sync_state as %d", buf, 0x1Cu);
            }
            char v19 = [MEMORY[0x1E4F6E890] sharedInstance];
            [v19 forceAutoBugCaptureWithSubType:@"NullCKRecordForIMDChat" errorPayload:v14 type:@"MiCSync" context:@"Failed to generate CKRecord for Chat"];
LABEL_16:
          }
          goto LABEL_18;
        }
        id v21 = IMLogHandleForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = [v8 guid];
          int v24 = [v8 chatIdentifier];
          *(_DWORD *)buf = 138412802;
          uint64_t v41 = (uint64_t)v23;
          __int16 v42 = 2112;
          id v43 = v24;
          __int16 v44 = 2112;
          uint64_t v45 = v8;
          _os_log_error_impl(&dword_1D967A000, v21, OS_LOG_TYPE_ERROR, "Failed to create IMDChat for guid %@ chatIdentifier %@ ChatRecord %@", buf, 0x20u);
        }
        id v14 = [MEMORY[0x1E4F6E890] sharedInstance];
        [v14 forceAutoBugCaptureWithSubType:@"NullIMDChatForChatRecordRef" errorPayload:0 type:@"MiCSync" context:@"Failed to generate IMDChat for IMDChatRecordRef"];
LABEL_18:
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
    }
    while (v5);
  }

  if (a4 == 2 && [v33 count])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = [v33 count];
        *(_DWORD *)buf = 134217984;
        uint64_t v41 = v27;
        _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Making sure %ld chats have SMS variants", buf, 0xCu);
      }
    }
    [(IMDChatStore *)self createSMSVariantsIfNeededFor:v33];
  }

  return theDict;
}

+ (IMDChatStore)sharedInstance
{
  if (qword_1EBE2B8A0 != -1) {
    dispatch_once(&qword_1EBE2B8A0, &unk_1F33918C0);
  }
  id v2 = (void *)qword_1EBE2B9D8;

  return (IMDChatStore *)v2;
}

- (IMDChatStore)init
{
  v9.receiver = self;
  v9.super_class = (Class)IMDChatStore;
  id v2 = [(IMDChatStore *)&v9 init];
  if (v2)
  {
    uint64_t v3 = [NSString stringGUID];
    [(IMDChatStore *)v2 setModificationStamp:v3];

    id v4 = objc_alloc_init(IMDMessagePTaskXPCStore);
    messagePTaskStore = v2->_messagePTaskStore;
    v2->_messagePTaskStore = (IMDMessagePTaskStore *)v4;

    id v6 = objc_alloc(MEMORY[0x1E4F6EA48]);
    id v7 = (void *)[v6 initWithObject:v2 title:@"IMDChatStore-Schema" queue:MEMORY[0x1E4F14428]];
    [(IMDChatStore *)v2 setStateCaptureAssistant:v7];
  }
  return v2;
}

- (void)_updateModificationDate
{
  id v3 = [NSString stringGUID];
  [(IMDChatStore *)self setModificationStamp:v3];
}

- (void)blackholeChat:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v3;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Blackholing chat: %@", (uint8_t *)&v7, 0xCu);
      }
    }
    [v3 guid];
    uint64_t v5 = (const void *)IMDChatRecordCopyChatForGUID();
    if (v5)
    {
      IMDChatRecordSetIsBlackholed();
      CFRelease(v5);
    }
    else if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v3;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "No chat record found to archive for chat: %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (void)unblackholeChat:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v3;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Unblackholing chat: %@", (uint8_t *)&v7, 0xCu);
      }
    }
    [v3 guid];
    uint64_t v5 = (const void *)IMDChatRecordCopyChatForGUID();
    if (v5)
    {
      IMDChatRecordSetIsBlackholed();
      CFRelease(v5);
    }
    else if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v3;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "No chat record found to unarchive for chat: %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (void)_addGroupPhotoToTransferCenterForChat:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 groupPhotoGuid];
  uint64_t v5 = +[IMDFileTransferCenter sharedInstance];
  id v6 = [v5 transferForGUID:v4];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        id v14 = v6;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Transfer already exists in transfer center. not overwriting. Transfer: %@", (uint8_t *)&v13, 0xCu);
      }
LABEL_17:
    }
  }
  else if ([v4 length])
  {
    id v8 = +[IMDAttachmentStore sharedInstance];
    int v7 = [v8 attachmentWithGUID:v4];

    int v9 = IMOSLoggingEnabled();
    if (v7)
    {
      if (v9)
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v13 = 138412290;
          id v14 = v4;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Adding group photo to IMDFileTransferCenter for guid: %@.", (uint8_t *)&v13, 0xCu);
        }
      }
      uint64_t v11 = +[IMDFileTransferCenter sharedInstance];
      [v11 addTransfer:v7 forGUID:v4];
    }
    else if (v9)
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        id v14 = v4;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Group file transfer is nil for guid: %@. Not adding anything to file transfers.", (uint8_t *)&v13, 0xCu);
      }
    }
    goto LABEL_17;
  }
}

- (BOOL)_hasCancellableScheduledMessageForChat:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v23 = a3;
  char v22 = +[IMDMessageStore sharedInstance];
  id v3 = [v23 guid];
  id v4 = [v22 scheduledMessagesBatchFetcherForChat:v3];

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = v4;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v6)
  {
    uint64_t v8 = *(void *)v27;
    *(void *)&long long v7 = 138412290;
    long long v21 = v7;
LABEL_3:
    uint64_t v9 = 0;
    while (1)
    {
      if (*(void *)v27 != v8) {
        objc_enumerationMutation(v5);
      }
      id v10 = (void *)IMDCreateIMMessageItemFromIMDMessageRecordRef(*(void *)(*((void *)&v26 + 1) + 8 * v9), 0);
      uint64_t v11 = v10;
      if (v10)
      {
        if ([v10 scheduleType] != 2 || (unint64_t)(objc_msgSend(v11, "scheduleState") - 1) > 1) {
          goto LABEL_20;
        }
        if (IMOSLoggingEnabled())
        {
          v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            int v13 = [v23 chatIdentifier];
            *(_DWORD *)buf = 138412546;
            uint64_t v31 = v11;
            __int16 v32 = 2112;
            id v33 = v13;
            _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Found scheduled message: %@ for chatIdentifier: %@", buf, 0x16u);
          }
        }
        if (!objc_msgSend(v11, "errorCode", v21))
        {

          BOOL v19 = 1;
          goto LABEL_28;
        }
        id v14 = IMLogHandleForCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)buf = v21;
          uint64_t v31 = v11;
          _os_log_error_impl(&dword_1D967A000, v14, OS_LOG_TYPE_ERROR, "Scheduled message was marked as failed but didn't update the scheduleState: %@", buf, 0xCu);
        }

        uint64_t v15 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"IMDChatStore-Database", objc_msgSend(v11, "errorCode"), 0);
        long long v16 = [MEMORY[0x1E4F6E890] sharedInstance];
        [v16 forceAutoBugCaptureWithSubType:@"Database read a failed scheduled message with an invalid scheduleState" errorPayload:v15 type:@"ScheduledMessageFailureStateNotSet" context:0];

        [v11 setScheduleState:4];
      }
      else
      {
        uint64_t v15 = IMLogHandleForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1D9903884(&v24, v25, v15);
        }
      }

LABEL_20:
      if (v6 == ++v9)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v6) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (IMOSLoggingEnabled())
  {
    char v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = [v23 chatIdentifier];
      *(_DWORD *)buf = 138412290;
      uint64_t v31 = v18;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "No scheduled message found for chatIdentifier: %@", buf, 0xCu);
    }
  }
  BOOL v19 = 0;
LABEL_28:

  return v19;
}

- (void)_updateHasCancellableScheduledMessageForChat:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = (__CFString *)a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Updating hasCancellableScheduledMessage state for chat: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  BOOL v6 = [(IMDChatStore *)self _hasCancellableScheduledMessageForChat:v4];
  if (IMOSLoggingEnabled())
  {
    long long v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = @"NO";
      if (v6) {
        uint64_t v8 = @"YES";
      }
      int v9 = 138412546;
      id v10 = v8;
      __int16 v11 = 2112;
      v12 = v4;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Calculated hasCancellableScheduledMessage: %@ for chat: %@", (uint8_t *)&v9, 0x16u);
    }
  }
  [(__CFString *)v4 updateHasCancellableScheduledMessage:v6];
}

- (void)_processIncomingChat:(id)a3
{
  id v15 = a3;
  id v4 = [v15 service];
  if (([v4 chatsIgnoreLoginStatus] & 1) == 0 && objc_msgSend(v15, "style") != 45) {
    [v15 setState:0];
  }
  BOOL v5 = [v15 style] == 43;
  BOOL v6 = v15;
  if (v5)
  {
    long long v7 = [v15 displayName];
    if ([v7 length])
    {
      uint64_t v8 = [v15 displayName];
      int v9 = [v8 trimmedString];
      uint64_t v10 = [v9 length];

      BOOL v6 = v15;
      if (v10) {
        goto LABEL_11;
      }
      [v15 setDisplayName:0];
    }
    else
    {
    }
    BOOL v6 = v15;
  }
LABEL_11:
  __int16 v11 = [v6 lastMessage];
  if (v11)
  {
    v12 = +[IMDMessageStore sharedInstance];
    uint64_t v13 = [v11 fileTransferGUIDs];
    id v14 = [v11 guid];
    [v12 registerTransfersWithGUIDs:v13 forMessageGUID:v14];
  }
  [(IMDChatStore *)self _updateHasCancellableScheduledMessageForChat:v15];
  [v15 recoverParticipantsIfNeeded];
  [(IMDChatStore *)self _addGroupPhotoToTransferCenterForChat:v15];
  [v15 _repairUnregisteredChatIfNeeded];
}

- (id)loadAllChats
{
  return (id)MEMORY[0x1F4181798](self, sel__loadChatsIncludingAllChats_);
}

- (id)loadRecentChats
{
  return (id)MEMORY[0x1F4181798](self, sel__loadChatsIncludingAllChats_);
}

- (id)_loadChatsIncludingAllChats:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  uint64_t v36 = 0;
  long long v37 = &v36;
  uint64_t v38 = 0x3032000000;
  long long v39 = sub_1D97C702C;
  v40 = sub_1D97C703C;
  id v41 = 0;
  id v5 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v5 startTimingForKey:@"loadAllChatsForChatStore"];
  uint8_t v24 = self;
  uint64_t v32 = 0;
  id v33 = &v32;
  uint64_t v34 = 0x2020000000;
  char v35 = 0;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D97C7044;
  aBlock[3] = &unk_1E6B76818;
  id v7 = v6;
  id v31 = v7;
  uint64_t v8 = (void (**)(void *, void))_Block_copy(aBlock);
  if (v3)
  {
    IMDChatRecordCopyAllActiveChatsProgressivelyWithLimitAndBlock();
  }
  else
  {
    uint64_t v9 = IMGetCachedDomainIntForKeyWithDefaultValue();
    uint64_t v10 = IMGetCachedDomainIntForKeyWithDefaultValue();
    if (IMOSLoggingEnabled())
    {
      __int16 v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218240;
        uint64_t v44 = v9;
        __int16 v45 = 2048;
        uint64_t v46 = v10;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Loading recent chats (budget %lld for known senders, %lld for other filters)", buf, 0x16u);
      }
    }
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v12 = (id)IMDChatRecordCopyAllUnreadChatsAndRecentChatsWithLimit();
    uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v42 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v27;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v27 != v14) {
            objc_enumerationMutation(v12);
          }
          uint64_t v16 = *(void *)(*((void *)&v26 + 1) + 8 * i);
          char v17 = (void *)MEMORY[0x1E016A370]();
          v8[2](v8, v16);
        }
        uint64_t v13 = [v12 countByEnumeratingWithState:&v26 objects:v42 count:16];
      }
      while (v13);
    }
  }
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1D97C70A0;
  v25[3] = &unk_1E6B76840;
  v25[4] = v24;
  v25[5] = &v32;
  v25[6] = &v36;
  objc_msgSend(v7, "enumerateObjectsUsingBlock:", v25, v24);
  if (*((unsigned char *)v33 + 24)) {
    IMGreenTeaMessageReadLog();
  }
  [v5 stopTimingForKey:@"loadAllChatsForChatStore"];
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      [v5 totalTimeForKey:@"loadAllChatsForChatStore"];
      uint64_t v20 = v19;
      uint64_t v21 = [(id)v37[5] count];
      *(_DWORD *)buf = 134218240;
      uint64_t v44 = v20;
      __int16 v45 = 2048;
      uint64_t v46 = v21;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Loading all chats took %f seconds for %lu chats", buf, 0x16u);
    }
  }
  id v22 = (id)v37[5];

  _Block_object_dispose(&v32, 8);
  _Block_object_dispose(&v36, 8);

  return v22;
}

- (BOOL)_storeChat:(id)a3 updateProtectedProperties:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    id v7 = (void *)MEMORY[0x1E016A370]();
    uint64_t v8 = sub_1D97979E8(v6, v4);
    if (v8)
    {
      uint64_t v9 = (const void *)v8;
      [v6 _setRowID:IMDChatRecordGetIdentifier()];
      CFRelease(v9);
    }
    else
    {
      [v6 _setRowID:-1];
    }
    [(IMDChatStore *)self _updateModificationDate];
  }

  return 0;
}

- (BOOL)storeChat:(id)a3
{
  return [(IMDChatStore *)self _storeChat:a3 updateProtectedProperties:0];
}

- (unint64_t)unreadCountForChat:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = [v3 service];
  int v5 = [v4 supportsDatabase];

  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = [v3 rowID];
        uint64_t v8 = @"Chat Row ID";
        if (v7 == -1) {
          uint64_t v8 = @"Chat GUID";
        }
        int v12 = 138412290;
        uint64_t v13 = v8;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Counting all unread messages for %@", (uint8_t *)&v12, 0xCu);
      }
    }
    if ([v3 rowID] == -1)
    {
      [v3 guid];
      uint64_t v9 = IMDMessageRecordCountAllUnreadMessagesForChatGUID();
    }
    else
    {
      [v3 rowID];
      uint64_t v9 = IMDMessageRecordCountAllUnreadMessagesForChatRowID();
    }
    unint64_t v10 = v9;
  }
  else
  {
    unint64_t v10 = 0;
  }

  return v10;
}

- (id)_incomingChatWithChatRecord:(id)a3
{
  v12[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = v4;
  if (v4)
  {
    v12[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:1];
    uint64_t v7 = [(IMDChatStore *)self _incomingChatsWithChatRecords:v6];
    uint64_t v8 = [v7 firstObject];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v11 = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "No incoming chat record.", v11, 2u);
      }
    }
    uint64_t v8 = 0;
  }

  return v8;
}

- (id)chatWithGUID:(id)a3
{
  id v4 = (void *)IMDChatRecordCopyChatForGUID();
  int v5 = [(IMDChatStore *)self _incomingChatWithChatRecord:v4];

  return v5;
}

- (id)chatsFilteredUsingPredicate:(id)a3
{
  id v4 = a3;
  int v5 = [(IMDChatStore *)self database];
  id v6 = [v5 chatRecordsFilteredByPredicate:v4];

  uint64_t v7 = [(IMDChatStore *)self _incomingChatsWithChatRecords:v6];

  return v7;
}

- (id)chatsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v14 = 0;
  id v15 = &v14;
  uint64_t v16 = 0x3032000000;
  char v17 = sub_1D97C702C;
  id v18 = sub_1D97C703C;
  id v19 = 0;
  unint64_t v10 = [(IMDChatStore *)self database];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1D97C76E0;
  v13[3] = &unk_1E6B73420;
  v13[4] = &v14;
  [v10 fetchChatRecordsFilteredUsingPredicate:v8 sortedUsingDescriptors:v9 limit:a5 completionHandler:v13];

  __int16 v11 = [(IMDChatStore *)self _incomingChatsWithChatRecords:v15[5]];
  _Block_object_dispose(&v14, 8);

  return v11;
}

- (id)chatsWithIdentifier:(id)a3
{
  id v4 = a3;
  int v5 = [(IMDChatStore *)self database];
  id v6 = [v5 chatRecordsWithIdentifier:v4];

  uint64_t v7 = [(IMDChatStore *)self _incomingChatsWithChatRecords:v6];

  return v7;
}

- (id)chatsWithIdentifier:(id)a3 onService:(id)a4
{
  id v6 = a3;
  uint64_t v7 = [a4 internalName];
  id v8 = [(IMDChatStore *)self chatsWithIdentifier:v6 onServiceNamed:v7];

  return v8;
}

- (id)chatsWithIdentifier:(id)a3 onServiceNamed:(id)a4
{
  int v5 = (void *)IMDChatRecordCopyChatsWithIdentifierOnService();
  id v6 = [(IMDChatStore *)self _incomingChatsWithChatRecords:v5];

  return v6;
}

- (id)chatsWithPinningIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  unint64_t v10 = &v9;
  uint64_t v11 = 0x3032000000;
  int v12 = sub_1D97C702C;
  uint64_t v13 = sub_1D97C703C;
  id v14 = 0;
  int v5 = [(IMDChatStore *)self database];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D97C7980;
  v8[3] = &unk_1E6B73420;
  v8[4] = &v9;
  [v5 fetchChatRecordsWithPinningIdentifier:v4 completionHandler:v8];

  id v6 = [(IMDChatStore *)self _incomingChatsWithChatRecords:v10[5]];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)chatsWithGroupID:(id)a3
{
  id v4 = (void *)IMDChatRecordCopyChatsWithGroupID();
  int v5 = [(IMDChatStore *)self _incomingChatsWithChatRecords:v4];

  return v5;
}

- (id)chatsWithHandle:(id)a3 onService:(id)a4
{
  int v5 = (void *)IMDChatRecordCopyChatsWithHandleOnService();
  id v6 = [(IMDChatStore *)self _incomingChatsWithChatRecords:v5];

  return v6;
}

- (id)chatsWithHandles:(id)a3 onService:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = [(IMDChatStore *)self database];
  char v17 = [v16 chatRecordsWithHandles:v15 serviceName:v14 displayName:v13 groupID:v12 style:v7 useOriginalGroupID:0];

  id v18 = [(IMDChatStore *)self _incomingChatsWithChatRecords:v17];

  return v18;
}

- (id)chatsWithHandles:(id)a3 onService:(id)a4 displayName:(id)a5 originalGroupID:(id)a6 style:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  uint64_t v16 = [(IMDChatStore *)self database];
  char v17 = [v16 chatRecordsWithHandles:v15 serviceName:v14 displayName:v13 groupID:v12 style:v7 useOriginalGroupID:1];

  id v18 = [(IMDChatStore *)self _incomingChatsWithChatRecords:v17];

  return v18;
}

- (id)chatsWithRoomname:(id)a3 onService:(id)a4
{
  int v5 = (void *)IMDChatRecordCopyChatsWithRoomnameOnService();
  id v6 = [(IMDChatStore *)self _incomingChatsWithChatRecords:v5];

  return v6;
}

- (id)copyDuplicateGroupChatsWithLimit:(int64_t)a3
{
  int v5 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
  id v6 = (void *)[v5 copyDuplicateGroupChatRecordsWithLimit:a3];

  uint64_t v7 = [(IMDChatStore *)self _incomingChatsWithChatRecords:v6];

  return v7;
}

- (id)newestChatWithOriginalGroupID:(id)a3 onService:(id)a4
{
  int v5 = (void *)IMDChatRecordCopyNewestChatForGroupIDOnService();
  id v6 = [(IMDChatStore *)self _incomingChatWithChatRecord:v5];

  return v6;
}

- (id)newestChatWithGroupID:(id)a3 onService:(id)a4
{
  uint64_t v4 = IMDChatRecordCopyNewestChatForGroupIDOnService();
  int v5 = (void *)v4;
  if (v4) {
    id v6 = sub_1D9798E78(v4);
  }
  else {
    id v6 = 0;
  }

  return v6;
}

- (void)enumerateBatchedChatsFilteredUsingPredicate:(id)a3 block:(id)a4
{
}

- (void)enumerateBatchedChatsFilteredUsingPredicate:(id)a3 batchSize:(unint64_t)a4 block:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, void *, unsigned char *))a5;
  if (v9)
  {
    unsigned __int8 v25 = 0;
    id v10 = objc_alloc_init(MEMORY[0x1E4F6BF38]);
    [v10 setBatchSize:a4];
    id v20 = v8;
    [v10 setPredicate:v8];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v22;
LABEL_4:
      uint64_t v15 = 0;
      while (1)
      {
        if (*(void *)v22 != v14) {
          objc_enumerationMutation(v11);
        }
        uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * v15);
        char v17 = (void *)MEMORY[0x1E016A370]();
        id v18 = [(IMDChatStore *)self _incomingChatWithChatRecord:v16];
        v9[2](v9, v18, &v25);
        int v19 = v25;

        if (v19) {
          break;
        }
        if (v13 == ++v15)
        {
          uint64_t v13 = [v11 countByEnumeratingWithState:&v21 objects:v26 count:16];
          if (v13) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    id v8 = v20;
  }
}

- (id)chatsGUIDsForMessageWithGUID:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 length])
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = (void *)IMDMessageRecordCopyMessageForGUID();
    if (v6)
    {
      long long v16 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      id v7 = (id)IMDMessageRecordCopyChats();
      uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v17;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v17 != v9) {
              objc_enumerationMutation(v7);
            }
            id v11 = (void *)IMDChatRecordCopyGUID();
            if (v11) {
              objc_msgSend(v5, "addObject:", v11, v16);
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v16 objects:v22 count:16];
        }
        while (v8);
      }

      if (![v5 count] && IMOSLoggingEnabled())
      {
        uint64_t v12 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v21 = v4;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Couldn't find chat for message guid: %@", buf, 0xCu);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        long long v21 = v4;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Couldn't find message for guid: %@", buf, 0xCu);
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
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Lookup failed, NIL or empty message GUID.", buf, 2u);
      }
    }
    id v5 = 0;
  }

  return v5;
}

- (id)chatIdentitiesForMessageWithGUIDs:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = (void *)IMDChatRecordCopyChatIdentitiesForMessageWithGUIDs();
    id v6 = v5;
    if (v5 && [v5 count])
    {
      if (IMOSLoggingEnabled())
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v12 = 136315650;
          uint64_t v13 = "-[IMDChatStore chatIdentitiesForMessageWithGUIDs:]";
          __int16 v14 = 2048;
          uint64_t v15 = [v6 count];
          __int16 v16 = 2048;
          uint64_t v17 = [v4 count];
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "%s found %lu chats from %lu message guids", (uint8_t *)&v12, 0x20u);
        }
      }
      id v8 = v6;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v12 = 136315138;
          uint64_t v13 = "-[IMDChatStore chatIdentitiesForMessageWithGUIDs:]";
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "%s returned nil or empty", (uint8_t *)&v12, 0xCu);
        }
      }
      id v8 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Lookup failed, NILL or empty message GUIDs array.", (uint8_t *)&v12, 2u);
      }
    }
    id v8 = 0;
  }

  return v8;
}

- (id)chatsGUIDsForMessageWithIdentifier:(int64_t)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = (id)IMDMessageRecordCopyChatsForMessageIdentifier();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = (void *)IMDChatRecordCopyGUID();
        if (v9) {
          objc_msgSend(v4, "addObject:", v9, v12);
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v6);
  }

  if (![v4 count] && IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v17 = a3;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Couldn't find chat for message identifier: %lld", buf, 0xCu);
    }
  }

  return v4;
}

- (void)addMessageWithGUID:(id)a3 toChat:(id)a4
{
}

- (void)addMessageWithGUID:(id)a3 toChat:(id)a4 deferSpotlightIndexing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = [v9 service];
  int v11 = [v10 supportsDatabase];

  if (v11)
  {
    if (v8 && [v8 length])
    {
      long long v12 = [v9 guid];
      long long v13 = v12;
      if (v12 && [v12 length])
      {
        if (IMOSLoggingEnabled())
        {
          long long v14 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            int v16 = 138412546;
            id v17 = v8;
            __int16 v18 = 2112;
            id v19 = v9;
            _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Associating message guid: %@ to chat: %@", (uint8_t *)&v16, 0x16u);
          }
        }
        IMDChatRecordAssociateMessageWithGUIDToChatWithGUIDIfNeeded();
        [(IMDChatStore *)self _performOrScheduleSpotlightIndexingOfAddedMessageWithGUID:v8 chat:v9 shouldDeferIndexing:v5];
        IMDSMSRecordStoreSave();
      }
      else if (IMOSLoggingEnabled())
      {
        long long v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Association failed, NIL or empty chat GUID.", (uint8_t *)&v16, 2u);
        }
      }
LABEL_19:

      goto LABEL_20;
    }
    if (IMOSLoggingEnabled())
    {
      long long v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Association failed, NIL or empty message GUID.", (uint8_t *)&v16, 2u);
      }
      goto LABEL_19;
    }
  }
LABEL_20:
}

- (void)_performOrScheduleSpotlightIndexingOfAddedMessageWithGUID:(id)a3 chat:(id)a4 shouldDeferIndexing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v9 isDeletingIncomingMessages])
  {
    if (IMOSLoggingEnabled())
    {
      OSLogHandleForIMFoundationCategory();
      id v10 = (IMDMessagePTask *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled(&v10->super, OS_LOG_TYPE_INFO))
      {
        int v11 = [v9 guid];
        *(_DWORD *)buf = 138412546;
        id v27 = v8;
        __int16 v28 = 2112;
        long long v29 = v11;
        _os_log_impl(&dword_1D967A000, &v10->super, OS_LOG_TYPE_INFO, "Not indexing %@, chat %@ has automatic deletion of incoming messages enabled", buf, 0x16u);
      }
LABEL_5:
    }
  }
  else
  {
    if (v5)
    {
      id v10 = [[IMDMessagePTask alloc] initWithGUID:v8];
      [(IMDMessagePTask *)v10 setTaskFlag:1];
      [(IMDMessagePTaskStore *)self->_messagePTaskStore storePTask:v10];
      if (IMOSLoggingEnabled())
      {
        long long v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v27 = v8;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Deferring indexing of %@", buf, 0xCu);
        }
      }
      goto LABEL_5;
    }
    long long v13 = +[IMDMessageStore sharedInstance];
    long long v14 = [v13 messageWithGUID:v8];

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v15 = objc_msgSend(v14, "syndicationRanges", 0);
    uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v22;
      while (2)
      {
        for (uint64_t i = 0; i != v16; ++i)
        {
          if (*(void *)v22 != v17) {
            objc_enumerationMutation(v15);
          }
          if ([*(id *)(*((void *)&v21 + 1) + 8 * i) syndicationStatus] == 2)
          {
            if (IMOSLoggingEnabled())
            {
              id v19 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                uint64_t v20 = [v14 guid];
                *(_DWORD *)buf = 138412290;
                id v27 = v20;
                _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Not indexing message %@, contains syndication range with not donated status", buf, 0xCu);
              }
            }

            goto LABEL_26;
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v21 objects:v25 count:16];
        if (v16) {
          continue;
        }
        break;
      }
    }

    IMDCoreSpotlightAddMessageGUID();
LABEL_26:
  }
}

- (void)removeMessageWithGUID:(id)a3 fromChat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 service];
  int v8 = [v7 supportsDatabase];

  if (v8)
  {
    if (v5 && [v5 length])
    {
      id v9 = [v6 guid];
      id v10 = v9;
      if (v9 && [v9 length])
      {
        IMDChatRecordDisassociateMessageWithGUIDFromChatWithGUIDIfNeeded();
        IMDSMSRecordStoreSave();
      }
      else if (IMOSLoggingEnabled())
      {
        int v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long v12 = 0;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Disassociation failed, NIL or empty chat GUID.", v12, 2u);
        }
      }
LABEL_14:

      goto LABEL_15;
    }
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Disassociation failed, NIL or empty message GUID.", buf, 2u);
      }
      goto LABEL_14;
    }
  }
LABEL_15:
}

- (void)remapMessageError:(unsigned int)a3 toError:(unsigned int)a4 forChat:(id)a5 completion:(id)a6
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  long long v24 = (void (**)(id, id))a6;
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  unsigned __int8 v25 = v8;
  [v8 guid];
  CFTypeRef cf = (CFTypeRef)IMDChatRecordCopyChatForGUID();
  CFArrayRef v10 = (const __CFArray *)IMDChatRecordCopyMessagesWithLimit();
  CFArrayRef v11 = v10;
  if (v10)
  {
    CFIndex Count = CFArrayGetCount(v10);
    if (Count << 32 >= 1)
    {
      CFIndex v14 = 0;
      uint64_t v15 = (int)Count;
      *(void *)&long long v13 = 138412290;
      long long v22 = v13;
      do
      {
        CFArrayGetValueAtIndex(v11, v14);
        uint64_t v16 = (void *)IMDMessageRecordCopyGUIDForMessage();
        uint64_t v17 = +[IMDMessageStore sharedInstance];
        __int16 v18 = [v17 messageWithGUID:v16];

        if (v16 && [v18 errorCode] == a3)
        {
          [v9 addObject:v16];
        }
        else
        {
          id v19 = IMLogHandleForCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)buf = v22;
            __int16 v28 = v25;
            _os_log_error_impl(&dword_1D967A000, v19, OS_LOG_TYPE_ERROR, "No message guid found for chat: %@", buf, 0xCu);
          }
        }
        ++v14;
      }
      while (v15 != v14);
    }
  }
  uint64_t v20 = objc_msgSend(v25, "guid", v22);
  long long v26 = v20;
  long long v21 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];

  IMDChatRemapMessagesWithErrorCodeToErrorCode();
  if (v24) {
    v24[2](v24, v9);
  }
  if (cf) {
    CFRelease(cf);
  }
  if (v11) {
    CFRelease(v11);
  }
}

- (void)deleteChat:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v5 = v4;
    [v3 guid];
    IMDChatRecordDeleteChatForGUID();
    id v6 = +[IMDMessageStore sharedInstance];
    [v6 updateStamp];

    uint64_t v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
      int v9 = 134218242;
      double v10 = v8 - v5;
      __int16 v11 = 2112;
      id v12 = v3;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Deleted chat in %f seconds (%@) ", (uint8_t *)&v9, 0x16u);
    }
  }
  else
  {
    uint64_t v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1D99038C4(v7);
    }
  }
}

- (void)setChatIsFiltered:(int64_t)a3 withChatGuid:(id)a4
{
  id v4 = a4;
  double v5 = v4;
  if (v4 && [v4 length])
  {
    IMDChatRecordSetIsFiltered();
  }
  else if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Setting chat isFiltered failed, nil chat guid", v7, 2u);
    }
  }
}

- (id)_chatRegistry
{
  return +[IMDChatRegistry sharedInstance];
}

- (BOOL)updatePersonCentricIDForHandlesInChatWithMessage:(id)a3 fromIdentifier:(id)a4 personCentricID:(id)a5 chat:(id)a6
{
  uint64_t v70 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  if (IMSharedHelperPersistMergeID())
  {
    id v43 = v11;
    __int16 v42 = [v9 _stripFZIDPrefix];

    if ([v47 isTypingMessage])
    {
      char v12 = 0;
    }
    else
    {
      id v9 = v42;
      if ([v42 isEqualToIgnoringCase:*MEMORY[0x1E4F6C7B8]])
      {
        char v12 = 0;
        goto LABEL_12;
      }
      uint64_t v15 = [v42 _stripFZIDPrefix];
      uint64_t v16 = [(IMDChatStore *)self _chatRegistry];
      uint64_t v17 = [v11 chatIdentifier];
      __int16 v18 = objc_msgSend(v16, "allExistingChatsWithIdentifier:style:", v17, objc_msgSend(v43, "style"));

      long long v59 = 0u;
      long long v60 = 0u;
      long long v57 = 0u;
      long long v58 = 0u;
      id obj = v18;
      uint64_t v41 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
      if (v41)
      {
        char v12 = 0;
        uint64_t v40 = *(void *)v58;
        do
        {
          for (uint64_t i = 0; i != v41; ++i)
          {
            if (*(void *)v58 != v40) {
              objc_enumerationMutation(obj);
            }
            id v19 = *(void **)(*((void *)&v57 + 1) + 8 * i);
            long long v53 = 0u;
            long long v54 = 0u;
            long long v55 = 0u;
            long long v56 = 0u;
            __int16 v45 = v19;
            id v48 = [v19 participants];
            uint64_t v20 = [v48 countByEnumeratingWithState:&v53 objects:v68 count:16];
            if (v20)
            {
              uint64_t v21 = *(void *)v54;
              do
              {
                for (uint64_t j = 0; j != v20; ++j)
                {
                  if (*(void *)v54 != v21) {
                    objc_enumerationMutation(v48);
                  }
                  long long v23 = *(void **)(*((void *)&v53 + 1) + 8 * j);
                  long long v24 = [v23 ID];
                  int v25 = [v24 isEqualToString:v15];

                  if (v25)
                  {
                    long long v26 = [v23 personCentricID];
                    char v27 = [v26 isEqualToString:v10];

                    if ((v27 & 1) == 0)
                    {
                      if (IMOSLoggingEnabled())
                      {
                        __int16 v28 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                        {
                          id v29 = [v23 ID];
                          uint64_t v30 = [v23 personCentricID];
                          *(_DWORD *)buf = 138412802;
                          id v63 = v29;
                          __int16 v64 = 2112;
                          id v65 = v30;
                          __int16 v66 = 2112;
                          id v67 = v10;
                          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Updating handle(%@) from:%@ to:%@", buf, 0x20u);
                        }
                      }
                      id v31 = +[IMDChatRegistry sharedInstance];
                      uint64_t v32 = [v23 ID];
                      id v33 = [v31 allHandlesForID:v32];

                      long long v51 = 0u;
                      long long v52 = 0u;
                      long long v49 = 0u;
                      long long v50 = 0u;
                      id v34 = v33;
                      uint64_t v35 = [v34 countByEnumeratingWithState:&v49 objects:v61 count:16];
                      if (v35)
                      {
                        uint64_t v36 = *(void *)v50;
                        do
                        {
                          for (uint64_t k = 0; k != v35; ++k)
                          {
                            if (*(void *)v50 != v36) {
                              objc_enumerationMutation(v34);
                            }
                            [*(id *)(*((void *)&v49 + 1) + 8 * k) setPersonCentricID:v10];
                          }
                          uint64_t v35 = [v34 countByEnumeratingWithState:&v49 objects:v61 count:16];
                        }
                        while (v35);
                      }

                      [v23 setPersonCentricID:v10];
                      uint64_t v38 = [v45 serviceName];
                      [(IMDChatStore *)self updateHandle:v23 sourceMessage:v47 personCentricID:v10 onService:v38];

                      char v12 = 1;
                    }
                  }
                }
                uint64_t v20 = [v48 countByEnumeratingWithState:&v53 objects:v68 count:16];
              }
              while (v20);
            }
          }
          uint64_t v41 = [obj countByEnumeratingWithState:&v57 objects:v69 count:16];
        }
        while (v41);
      }
      else
      {
        char v12 = 0;
      }
    }
    id v9 = v42;
LABEL_12:
    id v11 = v43;
    goto LABEL_13;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Not persisting merge id due to override", buf, 2u);
    }
  }
  char v12 = 0;
LABEL_13:

  return v12 & 1;
}

- (BOOL)updateHandle:(id)a3 sourceMessage:(id)a4 personCentricID:(id)a5 onService:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  [v9 ID];
  uint64_t v13 = IMDHandleRecordCopyHandleForIDOnService();
  if (v13)
  {
    CFIndex v14 = (const void *)v13;
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Writing to DB", buf, 2u);
      }
    }
    [v9 ID];
    [v9 countryCode];
    [v9 unformattedID];
    IMDHandleRecordBulkUpdate();
    uint64_t v16 = +[IMDChatRegistry sharedInstance];
    [v16 invalidatePersonCentricGroupedChatsCache];

    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v19 = 0;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Done", v19, 2u);
      }
    }
    CFRelease(v14);
  }

  return 1;
}

- (void)_broadcastToForceReloadChats
{
  id v2 = +[IMDChatRegistry sharedInstance];
  [v2 _forceReloadChats:1];
}

- (NSString)modificationStamp
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (void)setModificationStamp:(id)a3
{
}

- (IMDMessagePTaskStore)messagePTaskStore
{
  return (IMDMessagePTaskStore *)objc_getProperty(self, a2, 16, 1);
}

- (void)setMessagePTaskStore:(id)a3
{
}

- (IMStateCaptureAssistant)stateCaptureAssistant
{
  return self->_stateCaptureAssistant;
}

- (void)setStateCaptureAssistant:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssistant, 0);
  objc_storeStrong((id *)&self->_messagePTaskStore, 0);

  objc_storeStrong((id *)&self->_lastModificationStamp, 0);
}

- (id)batchOfRecordIDsToDeleteWithLimit:(int64_t)a3 error:(id *)a4
{
  id v4 = self;
  IMDChatStore.batchOfRecordIDsToDelete(limit:)();

  sub_1D989832C();
  sub_1D989836C();
  double v5 = (void *)sub_1D9906CB0();
  swift_bridgeObjectRelease();

  return v5;
}

- (void)clearTombstonesForRecordIDs:(id)a3
{
  sub_1D989832C();
  sub_1D9906F20();
  id v4 = self;
  _sSo12IMDChatStoreC12IMDaemonCoreE15clearTombstones12forRecordIDsySaySo10CKRecordIDCG_tF_0();

  swift_bridgeObjectRelease();
}

@end