@interface IMDDatabase
+ (IMDRemoteDatabaseProtocol)database;
+ (IMDRemoteDatabaseProtocol)synchronousDatabase;
+ (id)_databaseClient;
+ (id)_databaseServer;
+ (id)_newSyndicationRangeForCMMMessageItem:(id)a3 syndicationIdentifier:(id)a4 shouldHideFromSyndication:(BOOL)a5;
- (BOOL)_updateSyndicatedMessageItem:(id)a3 newMessageItem:(id)a4 newSyndicationRange:(id)a5;
- (id)_chatGUIDsForChatsWithJunkMessagesOlderThanDate:(id)a3 operation:(IMDSqlOperation *)a4;
- (id)_chatGUIDsForChatsWithRecoverableMessagesOlderThanDate:(id)a3 operation:(IMDSqlOperation *)a4;
- (id)_copyAttachmentRecordsFromCoreSDBResults:(id)a3;
- (id)_copyChatRecordsFromCoreSDBResults:(id)a3;
- (id)_copyHandleRecordsFromCoreSDBResults:(id)a3;
- (id)_copyMessageRecordsFromCoreSDBResults:(id)a3;
- (id)_deleteChatIfEmptyWithGUID:(id)a3 lastMessageDate:(id)a4 operation:(IMDSqlOperation *)a5;
- (id)_loadAttributedBodyTextForMessageWithGUID:(id)a3;
- (id)_loadRecoverableMessagePartsMetadataForChatGUID:(id)a3;
- (id)_mostRecentJunkMessageDateForChatWithGUID:(id)a3 operation:(IMDSqlOperation *)a4;
- (id)_mostRecentRecoverableMessageDateForChatWithGUID:(id)a3 operation:(IMDSqlOperation *)a4;
- (id)_permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:(id)a3 beforeDate:(id)a4;
- (id)_restoredAttributedBodyForMessageGUID:(id)a3 withRecoveredAttributedParts:(id)a4;
- (id)_updateAttachmentsSyncStateQueryFor:(int64_t)a3;
- (id)_updateChatsSyncStateQueryFor:(int64_t)a3;
- (id)_updateMessageSyncStateQueryFor:(int64_t)a3;
- (id)_updateMessageSyncedSyndicationRangesQueryFor:(int64_t)a3;
- (id)_updateRecoverableMessageSyncStateForMessageGUIDsQueryFor:(int64_t)a3;
- (id)chatRecordsFilteredByPredicate:(id)a3;
- (id)chatRecordsWithHandles:(id)a3 serviceName:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7;
- (id)chatRecordsWithHandles:(id)a3 serviceName:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7 useOriginalGroupID:(BOOL)a8;
- (id)chatRecordsWithIdentifier:(id)a3;
- (id)copyDuplicateGroupChatRecordsWithLimit:(int64_t)a3;
- (id)handleRecordsFilteredByPredicate:(id)a3;
- (id)loadRecoverableMessagesMetadataGroupedByChatGUID;
- (id)recoverableMessagesMetadataPendingCloudKitDeleteWithLimit:(unint64_t)a3;
- (id)recoverableMessagesMetadataPendingCloudKitSaveWithLimit:(unint64_t)a3 filter:(unint64_t)a4;
- (id)scheduledMessagesMetadataPendingCloudKitDeleteWithLimit:(int64_t)a3;
- (int64_t)_countMessagesExcludingGroupPhotosInChatWithGUID:(id)a3 isRecoverable:(BOOL)a4 operation:(IMDSqlOperation *)a5;
- (void)_deleteTransfersInMessagePartsForChatGUID:(id)a3;
- (void)_fetchChatRecordsWithHandles:(id)a3 allowSubsetMatching:(BOOL)a4 serviceName:(id)a5 displayName:(id)a6 groupID:(id)a7 style:(unsigned __int8)a8 useOriginalGroupID:(BOOL)a9 completionHandler:(id)a10;
- (void)_fetchMessageRecordsForChatRecordWithGUID:(id)a3 filteredUsingPredicate:(id)a4 sortedUsingDescriptors:(id)a5 parentedOnly:(BOOL)a6 limit:(unint64_t)a7 completionHandler:(id)a8;
- (void)_permanentlyDeleteJunkMessagesBeforeDate:(id)a3;
- (void)_recoverMessagePartsForChatRecordsWithGUIDs:(id)a3 operation:(IMDSqlOperation *)a4;
- (void)_removeFromRecoverableMessagePartForMessageGUID:(id)a3 operation:(IMDSqlOperation *)a4;
- (void)_updateMessageItemSyndicationRanges:(id)a3 messagePartDescriptor:(id)a4 shouldHideFromSyndication:(BOOL)a5;
- (void)_updateMessageRecordForGUID:(id)a3 withAttributedBody:(id)a4 operation:(IMDSqlOperation *)a5;
- (void)_updateMessagesSyncedSyndicationRangesToSyncedForGUIDs:(id)a3;
- (void)_validateSpotlightClientStateWithLastError:(id)a3 attempts:(int64_t)a4 completion:(id)a5;
- (void)addScheduledMessageGUIDandCKRecordToDeleteFromCloudKit:(id)a3 recordID:(id)a4;
- (void)clearRecoverableMessageTombStones;
- (void)coreSpotlightDeleteAttachmentGUIDs:(id)a3 reason:(int64_t)a4;
- (void)deleteAllDonationsForAppDeletionWithCompletion:(id)a3;
- (void)deleteAttachmentsDirectWithPredicate:(id)a3;
- (void)deleteJunkMessagesOlderThanDays:(int64_t)a3;
- (void)deleteRecoverableMessagesOlderThanDays:(int64_t)a3;
- (void)deleteTombstonedScheduledMessagesWithRecordIDs:(id)a3;
- (void)fetchAttachmentRecordsFilteredUsingPredicate:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5;
- (void)fetchAttachmentRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6;
- (void)fetchChatRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6;
- (void)fetchChatRecordsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 limit:(unint64_t)a5 completionHandler:(id)a6;
- (void)fetchChatRecordsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 olderThan:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7;
- (void)fetchChatRecordsWithAtLeastHandles:(id)a3 serviceName:(id)a4 style:(unsigned __int8)a5 completionHandler:(id)a6;
- (void)fetchChatRecordsWithPinningIdentifier:(id)a3 completionHandler:(id)a4;
- (void)fetchContactsForIdentifiers:(id)a3 completionHandler:(id)a4;
- (void)fetchCountOfRecordType:(unint64_t)a3 completionHandler:(id)a4;
- (void)fetchDataForKey:(id)a3 completionHandler:(id)a4;
- (void)fetchGroupPhotoPathsForChatsWithGroupIDs:(id)a3 completionHandler:(id)a4;
- (void)fetchHandleRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6;
- (void)fetchInteger64ForKey:(id)a3 completionHandler:(id)a4;
- (void)fetchLastMessageRecordForChatRecordWithRowID:(int64_t)a3 completionHandler:(id)a4;
- (void)fetchMessageRecordWithGUID:(id)a3 excludeRecoverableMessages:(BOOL)a4 completionHandler:(id)a5;
- (void)fetchMessageRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6;
- (void)fetchMessageRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 parentedOnly:(BOOL)a5 limit:(unint64_t)a6 completionHandler:(id)a7;
- (void)fetchMessageRecordsForChatRecordWithGUID:(id)a3 filteredUsingPredicate:(id)a4 sortedUsingDescriptors:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7;
- (void)fetchScheduledMessageRecordsForChatRecordWithGUID:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5;
- (void)fetchSpotlightClientStateWithCompletion:(id)a3;
- (void)fetchUnreadMessageRecordsForChatsFilteredUsingPredicate:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5;
- (void)invalidateSpotlightClientStateVersioningWithCompletion:(id)a3;
- (void)markMessageRecordsAsReadWithGUIDs:(id)a3;
- (void)moveMessageRecordsToRecoveryForChatRecordsWithGUIDs:(id)a3 deleteDate:(id)a4;
- (void)moveMessageRecordsToRecoveryForMessageGUIDs:(id)a3 deleteDate:(id)a4;
- (void)permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:(id)a3 completionHandler:(id)a4;
- (void)postSharePlayNotificationForChatGUID:(id)a3 faceTimeConversationUUID:(id)a4 handleIdentifier:(id)a5 localizedApplicationName:(id)a6;
- (void)recoverMessageRecordsForChatRecordsWithGUIDs:(id)a3;
- (void)resolveInconsistentGUIDForChatRecordWithGUID:(id)a3 newGUID:(id)a4 completionHandler:(id)a5;
- (void)sendLegacyXPCCommandWithObject:(id)a3 reply:(id)a4;
- (void)storeData:(id)a3 forKey:(id)a4;
- (void)storeRecoverableMessagePartWithBody:(id)a3 forMessageWithGUID:(id)a4 deleteDate:(id)a5;
- (void)updateAttachmentSyndicationRanges:(id)a3 shouldHideFromSyndication:(BOOL)a4;
- (void)updateAttachmentsSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4;
- (void)updateChatsSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4;
- (void)updateMessageSyndicationRanges:(id)a3 shouldHideFromSyndication:(BOOL)a4;
- (void)updateMessagesSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4;
- (void)updateMessagesSyncedSyndicationRangesForGUIDs:(id)a3 toStatus:(int64_t)a4;
- (void)updateRecoverableMessageSyncState:(int64_t)a3 forMessageGUIDs:(id)a4;
- (void)updateRecoverableMessageSyncState:(int64_t)a3 forMessageRowID:(int64_t)a4 onPartIndex:(int64_t)a5;
- (void)validateSpotlightClientStateWithCompletion:(id)a3;
@end

@implementation IMDDatabase

- (void)fetchChatRecordsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 olderThan:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7
{
  BOOL v10 = a4;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a5;
  v14 = (void (**)(id, void))a7;
  uint64_t v30 = 0;
  v31 = &v30;
  uint64_t v32 = 0x3032000000;
  v33 = sub_1AFC07868;
  v34 = sub_1AFC07878;
  id v35 = 0;
  if (v12)
  {
    v15 = [IMDPredicateToSQLConverter alloc];
    v16 = +[IMDChatRecord keyPathsToColumns];
    v17 = [(IMDPredicateToSQLConverter *)v15 initWithPredicate:v12 keyPathsToColumns:v16];

    if (!v17)
    {
      if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v37 = "-[IMDDatabase(Chats) fetchChatRecordsFilteredUsingPredicate:sortedUsingLastMessageDateAscending:olderTha"
                "n:limit:completionHandler:]";
          __int16 v38 = 2112;
          id v39 = v12;
          _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", buf, 0x16u);
        }
      }
      if (v14) {
        v14[2](v14, MEMORY[0x1E4F1CBF0]);
      }
      goto LABEL_19;
    }
  }
  else
  {
    v17 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v20 = @"YES";
      *(_DWORD *)buf = 138412802;
      if (!v12) {
        v20 = @"NO";
      }
      v37 = (const char *)v20;
      __int16 v38 = 2112;
      id v39 = v13;
      __int16 v40 = 2048;
      unint64_t v41 = a6;
      _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "Fetching chats sorted by recent and filtered by predicate: %@ olderThan: %@ limit: %llu", buf, 0x20u);
    }
  }
  v21 = [(IMDPredicateToSQLConverter *)v17 expression];
  MessageDateAndFilteredUsingPredicateWithLimitQuery = (void *)IMDChatRecordCopyChatsSortedByLastMessageDateAndFilteredUsingPredicateWithLimitQuery(v10, (uint64_t)v13, (uint64_t)v21);

  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1AFB55850;
  v24[3] = &unk_1E5F94070;
  v23 = v17;
  v25 = v23;
  v28 = &v30;
  unint64_t v29 = a6;
  id v26 = v13;
  v27 = self;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)MessageDateAndFilteredUsingPredicateWithLimitQuery, (uint64_t)v24);
  if (v14) {
    v14[2](v14, v31[5]);
  }

LABEL_19:
  _Block_object_dispose(&v30, 8);
}

+ (IMDRemoteDatabaseProtocol)synchronousDatabase
{
  if ([a1 isServerProcess]) {
    [a1 _databaseServer];
  }
  else {
  v3 = [a1 _databaseClient];
  }
  return (IMDRemoteDatabaseProtocol *)v3;
}

- (id)loadRecoverableMessagesMetadataGroupedByChatGUID
{
  v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)buf = 0;
    _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Recently Deleted | Will begin counting recoverable messages per chat", buf, 2u);
  }

  *(void *)buf = 0;
  v9 = buf;
  uint64_t v10 = 0x3032000000;
  v11 = sub_1AFC07868;
  id v12 = sub_1AFC07878;
  id v13 = 0;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFB58C40;
  v7[3] = &unk_1E5F99740;
  v7[4] = buf;
  IMDRunSqlOperation((uint64_t)v7);
  v3 = IMLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)v6 = 0;
    _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Recently Deleted | Finished counting recoverable messages per chat", v6, 2u);
  }

  id v4 = *((id *)v9 + 5);
  _Block_object_dispose(buf, 8);

  return v4;
}

+ (id)_databaseServer
{
  if (qword_1EB5ABA78 != -1) {
    dispatch_once(&qword_1EB5ABA78, &unk_1F084CDE0);
  }
  v2 = (void *)qword_1EB5ABA80;
  return v2;
}

+ (id)_databaseClient
{
  if (qword_1EB5ABBE0 != -1) {
    dispatch_once(&qword_1EB5ABBE0, &unk_1F084D160);
  }
  v2 = (void *)qword_1EB5ABBE8;
  return v2;
}

- (id)_copyChatRecordsFromCoreSDBResults:(id)a3
{
  return _IMDChatRecordCopyChatsFromRecords(a3);
}

- (void)fetchDataForKey:(id)a3 completionHandler:(id)a4
{
  v6 = (void (**)(id, void *))a4;
  v5 = IMDKVValueForKey(a3);
  if (v6) {
    v6[2](v6, v5);
  }
}

- (void)fetchInteger64ForKey:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  v6 = (void (**)(id, void))a4;
  if ([v5 length])
  {
    uint64_t v10 = 0;
    v11 = &v10;
    uint64_t v12 = 0x2020000000;
    uint64_t v13 = 0;
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1AFB61538;
    v7[3] = &unk_1E5F8D4C0;
    id v8 = v5;
    v9 = &v10;
    _IMDPerformLockedStatementBlockWithQuery(@"SELECT value FROM kvtable WHERE key = ?", (uint64_t)v7);
    if (v6) {
      v6[2](v6, v11[3]);
    }

    _Block_object_dispose(&v10, 8);
  }
}

- (void)storeData:(id)a3 forKey:(id)a4
{
}

- (void)fetchCountOfRecordType:(unint64_t)a3 completionHandler:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = (void (**)(id, void))a4;
  if (a3 >= 4)
  {
    v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1AFC61DE4(a3, v11);
    }

    v5[2](v5, 0);
  }
  else
  {
    v6 = off_1E5F8D4E0[a3];
    id v13 = 0;
    uint64_t v7 = IMDRowCountForTable((uint64_t)v6, (uint64_t)&v13);
    id v8 = v13;
    v9 = IMLogHandleForCategory();
    uint64_t v10 = v9;
    if (v8)
    {
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1AFC61D5C((uint64_t)v6, (uint64_t)v8, v10);
      }
      uint64_t v7 = 0;
    }
    else if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v7];
      *(_DWORD *)buf = 138543618;
      v15 = v6;
      __int16 v16 = 2112;
      v17 = v12;
      _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Total row count for table %{public}@: %@", buf, 0x16u);
    }
    v5[2](v5, v7);
  }
}

- (id)_copyHandleRecordsFromCoreSDBResults:(id)a3
{
  return _IMDHandleRecordCopyHandlesFromRecords(a3);
}

- (id)handleRecordsFilteredByPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v18 = 0;
  v19 = &v18;
  uint64_t v20 = 0x3032000000;
  v21 = sub_1AFB65714;
  v22 = sub_1AFB65724;
  id v23 = 0;
  if (v4)
  {
    id v5 = [IMDPredicateToSQLConverter alloc];
    v6 = +[IMDHandleRecord keyPathsToColumns];
    uint64_t v7 = [(IMDPredicateToSQLConverter *)v5 initWithPredicate:v4 keyPathsToColumns:v6];

    if (v7)
    {
      if (_IMWillLog())
      {
        id v13 = @"YES";
        _IMAlwaysLog();
      }
      id v8 = [(IMDPredicateToSQLConverter *)v7 expression];
      v9 = (void *)IMDHandleRecordCopyHandlesFilteredUsingPredicateQuery(v8);

      v14[0] = MEMORY[0x1E4F143A8];
      v14[1] = 3221225472;
      v14[2] = sub_1AFB6572C;
      v14[3] = &unk_1E5F8E480;
      __int16 v16 = self;
      v17 = &v18;
      v15 = v7;
      _IMDPerformLockedStatementBlockWithQuery((uint64_t)v9, (uint64_t)v14);
      uint64_t v10 = (void *)v19[5];
      if (!v10) {
        uint64_t v10 = (void *)MEMORY[0x1E4F1CBF0];
      }
      id v11 = v10;
    }
    else
    {
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      id v11 = 0;
    }
  }
  else
  {
    if (_IMWillLog()) {
      _IMAlwaysLog();
    }
    id v11 = (id)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v18, 8);

  return v11;
}

- (void)fetchHandleRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v29 = a4;
  uint64_t v32 = (void (**)(id, void))a6;
  uint64_t v42 = 0;
  v43 = &v42;
  uint64_t v44 = 0x3032000000;
  v45 = sub_1AFB65714;
  v46 = sub_1AFB65724;
  id v47 = 0;
  uint64_t v30 = v8;
  if (v8)
  {
    v9 = [IMDPredicateToSQLConverter alloc];
    uint64_t v10 = +[IMDHandleRecord keyPathsToColumns];
    v31 = [(IMDPredicateToSQLConverter *)v9 initWithPredicate:v8 keyPathsToColumns:v10];

    if (!v31)
    {
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      if (v32) {
        v32[2](v32, MEMORY[0x1E4F1CBF0]);
      }
      goto LABEL_28;
    }
  }
  else
  {
    v31 = 0;
  }
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v12 = v29;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v39;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v39 != v14) {
          objc_enumerationMutation(v12);
        }
        uint64_t v16 = *(void *)(*((void *)&v38 + 1) + 8 * i);
        v17 = [IMDSortDescriptorToSQLConverter alloc];
        uint64_t v18 = +[IMDHandleRecord keyPathsToColumns];
        v19 = [(IMDSortDescriptorToSQLConverter *)v17 initWithSortDescriptor:v16 keyPathsToColumns:v18];

        if (!v19)
        {
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
          if (v32) {
            v32[2](v32, MEMORY[0x1E4F1CBF0]);
          }
          goto LABEL_27;
        }
        uint64_t v20 = [(IMDSortDescriptorToSQLConverter *)v19 expression];
        [v11 addObject:v20];
      }
      uint64_t v13 = [v12 countByEnumeratingWithState:&v38 objects:v48 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }

  if (_IMWillLog())
  {
    uint64_t v21 = [v12 count];
    v22 = @"YES";
    if (!v30) {
      v22 = @"NO";
    }
    uint64_t v25 = v21;
    unint64_t v26 = a5;
    v24 = v22;
    _IMAlwaysLog();
  }
  id v23 = [(IMDPredicateToSQLConverter *)v31 expression];
  id v12 = (id)IMDHandleRecordCopySortedHandlesFilteredUsingPredicateWithLimitQuery(v23, v11);

  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  v33[2] = sub_1AFB65C14;
  v33[3] = &unk_1E5F8E4A8;
  v36 = &v42;
  unint64_t v37 = a5;
  v34 = v31;
  id v35 = self;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v12, (uint64_t)v33);
  if (v32) {
    v32[2](v32, v43[5]);
  }

LABEL_27:
LABEL_28:
  _Block_object_dispose(&v42, 8);
}

- (void)fetchContactsForIdentifiers:(id)a3 completionHandler:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  v6 = (void (**)(id, void *))a4;
  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  uint64_t v7 = [MEMORY[0x1E4F6E6D8] sharedInstance];
  id v8 = [v7 batchFetchContactsWithoutCachingForIdentifiers:v5];
  v9 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v10 = v8;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v11)
  {
    uint64_t v12 = v11;
    uint64_t v13 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v18 != v13) {
          objc_enumerationMutation(v10);
        }
        v15 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v16 = [v15 identifier];
        [v9 setObject:v15 forKey:v16];
      }
      uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v12);
  }

  if (_IMWillLog())
  {
    [v9 count];
    _IMAlwaysLog();
  }
  v6[2](v6, v9);
}

- (id)_copyMessageRecordsFromCoreSDBResults:(id)a3
{
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  if ([v3 count])
  {
    unint64_t v5 = 0;
    uint64_t v6 = *MEMORY[0x1E4F1CF80];
    do
    {
      [v3 objectAtIndex:v5];
      int ID = CSDBRecordGetID();
      id v8 = (void *)IMDMessageRecordCreateFromRecordIDUnlocked(v6, ID);
      if (v8) {
        [v4 addObject:v8];
      }

      ++v5;
    }
    while (v5 < [v3 count]);
  }

  return v4;
}

- (void)fetchLastMessageRecordForChatRecordWithRowID:(int64_t)a3 completionHandler:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  unint64_t v5 = (void (**)(id, void *))a4;
  uint64_t v6 = IMDChatRecordCreateFromRecordIDUnlocked(*MEMORY[0x1E4F1CF80], a3);
  uint64_t v7 = v6;
  if (v6)
  {
    Message = (void *)IMDChatRecordCopyLastMessage((uint64_t)v6);
    if (IMOSLoggingEnabled())
    {
      v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412546;
        int64_t v12 = (int64_t)Message;
        __int16 v13 = 2048;
        int64_t v14 = a3;
        _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Fetched last message %@ for chat with rowID: %lld", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 134217984;
        int64_t v12 = a3;
        _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "No chat record for chat with rowID: %lld", (uint8_t *)&v11, 0xCu);
      }
    }
    Message = 0;
  }
  if (v5) {
    v5[2](v5, Message);
  }
}

- (void)_fetchMessageRecordsForChatRecordWithGUID:(id)a3 filteredUsingPredicate:(id)a4 sortedUsingDescriptors:(id)a5 parentedOnly:(BOOL)a6 limit:(unint64_t)a7 completionHandler:(id)a8
{
  BOOL v31 = a6;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  v34 = (char *)a3;
  int v11 = (__CFString *)a4;
  id v36 = a5;
  long long v38 = (void (**)(id, void))a8;
  uint64_t v49 = 0;
  v50 = &v49;
  uint64_t v51 = 0x3032000000;
  v52 = sub_1AFB9E784;
  v53 = sub_1AFB9E794;
  id v54 = 0;
  id v35 = v11;
  if (v11)
  {
    int64_t v12 = [IMDPredicateToSQLConverter alloc];
    __int16 v13 = +[IMDMessageRecord keyPathsToColumns];
    unint64_t v37 = [(IMDPredicateToSQLConverter *)v12 initWithPredicate:v11 keyPathsToColumns:v13];

    if (!v37)
    {
      if (IMOSLoggingEnabled())
      {
        int64_t v14 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 136315394;
          v56 = "-[IMDDatabase(Messages) _fetchMessageRecordsForChatRecordWithGUID:filteredUsingPredicate:sortedUsingDesc"
                "riptors:parentedOnly:limit:completionHandler:]";
          __int16 v57 = 2112;
          v58 = v11;
          _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", buf, 0x16u);
        }
      }
      if (v38) {
        v38[2](v38, MEMORY[0x1E4F1CBF0]);
      }
      goto LABEL_37;
    }
  }
  else
  {
    unint64_t v37 = 0;
  }
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v16 = v36;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v63 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v46;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v46 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = *(__CFString **)(*((void *)&v45 + 1) + 8 * i);
        uint64_t v21 = [IMDSortDescriptorToSQLConverter alloc];
        uint64_t v22 = +[IMDMessageRecord keyPathsToColumns];
        id v23 = [(IMDSortDescriptorToSQLConverter *)v21 initWithSortDescriptor:v20 keyPathsToColumns:v22];

        if (!v23)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v30 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              v56 = "-[IMDDatabase(Messages) _fetchMessageRecordsForChatRecordWithGUID:filteredUsingPredicate:sortedUsing"
                    "Descriptors:parentedOnly:limit:completionHandler:]";
              __int16 v57 = 2112;
              v58 = v20;
              _os_log_impl(&dword_1AFB53000, v30, OS_LOG_TYPE_INFO, "Bad sort descriptor provided to %s (%@)", buf, 0x16u);
            }
          }
          if (v38) {
            ((void (*)(void))v38[2])();
          }
          goto LABEL_36;
        }
        v24 = [(IMDSortDescriptorToSQLConverter *)v23 expression];
        [v15 addObject:v24];
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v45 objects:v63 count:16];
      if (v17) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = [v16 count];
      v27 = @"YES";
      *(_DWORD *)buf = 138413058;
      __int16 v57 = 2112;
      v56 = v34;
      if (!v35) {
        v27 = @"NO";
      }
      v58 = v27;
      __int16 v59 = 2048;
      uint64_t v60 = v26;
      __int16 v61 = 2048;
      unint64_t v62 = a7;
      _os_log_impl(&dword_1AFB53000, v25, OS_LOG_TYPE_INFO, "Fetching messages for chat: %@ filtered by predicate: %@ sortDescriptors: %llu limit: %llu", buf, 0x2Au);
    }
  }
  v28 = [(IMDPredicateToSQLConverter *)v37 expression];
  if (v34) {
    uint64_t v29 = IMDMessageRecordCopySortedMessagesForChatGUIDFilteredUsingPredicateWithLimitQuery((uint64_t)v28, v15);
  }
  else {
    uint64_t v29 = IMDMessageRecordCopySortedMessagesFilteredUsingPredicateWithLimitQuery(v28, v15, v31);
  }
  id v16 = (id)v29;

  v39[0] = MEMORY[0x1E4F143A8];
  v39[1] = 3221225472;
  v39[2] = sub_1AFB9E79C;
  v39[3] = &unk_1E5F94070;
  long long v40 = v34;
  v43 = &v49;
  unint64_t v44 = a7;
  long long v41 = v37;
  uint64_t v42 = self;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v16, (uint64_t)v39);
  if (v38) {
    v38[2](v38, v50[5]);
  }

LABEL_36:
LABEL_37:
  _Block_object_dispose(&v49, 8);
}

- (void)fetchMessageRecordsForChatRecordWithGUID:(id)a3 filteredUsingPredicate:(id)a4 sortedUsingDescriptors:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7
{
}

- (void)fetchUnreadMessageRecordsForChatsFilteredUsingPredicate:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  v9 = (void (**)(id, void))a5;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a4;
      _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Fetching unread messages for chat predicate: %@  limit: %llu", buf, 0x16u);
    }
  }
  *(void *)buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  v27 = sub_1AFB9E784;
  v28 = sub_1AFB9E794;
  id v29 = 0;
  if (!v8)
  {
    id v15 = (void *)IMDMessageRecordCopyAllUnreadMessagesQueryWithFilter(0, a4);
    __int16 v13 = 0;
    goto LABEL_9;
  }
  int v11 = [IMDPredicateToSQLConverter alloc];
  int64_t v12 = +[IMDChatRecord keyPathsToColumns];
  __int16 v13 = [(IMDPredicateToSQLConverter *)v11 initWithPredicate:v8 keyPathsToColumns:v12];

  if (v13)
  {
    int64_t v14 = [(IMDPredicateToSQLConverter *)v13 expression];
    id v15 = (void *)IMDMessageRecordCopyAllUnreadMessagesQueryWithFilter((uint64_t)v14, a4);

LABEL_9:
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1AFB9EBA0;
    v18[3] = &unk_1E5F8E480;
    id v16 = v13;
    long long v20 = self;
    uint64_t v21 = buf;
    long long v19 = v16;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)v15, (uint64_t)v18);
    v9[2](v9, *(void *)(*(void *)&buf[8] + 40));

    goto LABEL_10;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)uint64_t v22 = 136315394;
      id v23 = "-[IMDDatabase(Messages) fetchUnreadMessageRecordsForChatsFilteredUsingPredicate:limit:completionHandler:]";
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", v22, 0x16u);
    }
  }
  if (v9) {
    v9[2](v9, MEMORY[0x1E4F1CBF0]);
  }
LABEL_10:
  _Block_object_dispose(buf, 8);
}

- (void)fetchMessageRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
}

- (void)fetchMessageRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 parentedOnly:(BOOL)a5 limit:(unint64_t)a6 completionHandler:(id)a7
{
}

- (void)fetchMessageRecordWithGUID:(id)a3 excludeRecoverableMessages:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  id v9 = a5;
  id v10 = (void (**)(void, void))v9;
  if (v8 && v9)
  {
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    long long v20 = sub_1AFB9E784;
    uint64_t v21 = sub_1AFB9E794;
    id v22 = 0;
    if (v6)
    {
      v15[0] = MEMORY[0x1E4F143A8];
      v15[1] = 3221225472;
      v15[2] = sub_1AFB9EEA8;
      v15[3] = &unk_1E5F8E480;
      uint64_t v17 = self;
      uint64_t v18 = buf;
      id v16 = v8;
      _IMDPerformLockedStatementBlockWithQuery(@"SELECT ROWID, guid, text, replace, service_center, handle_id, subject, country, attributedBody, version, type, service, account, account_guid, error, date, date_read, date_delivered, is_delivered, is_finished, is_emote, is_from_me, is_empty, is_delayed, is_auto_reply, is_prepared, is_read, is_system_message, is_sent, has_dd_results, is_service_message, is_forward, was_downgraded, is_archive, cache_has_attachments, cache_roomnames, was_data_detected, was_deduplicated, is_audio_message, is_played, date_played, item_type, other_handle, group_title, group_action_type, share_status,  share_direction, is_expirable, expire_state, message_action_type, message_source, associated_message_guid, associated_message_type, balloon_bundle_id, payload_data, expressive_send_style_id,  associated_message_range_location, associated_message_range_length, time_expressive_send_played, message_summary_info, ck_sync_state, ck_record_id, ck_record_change_tag, destination_caller_id, is_corrupt, reply_to_guid, sort_id, is_spam, has_unseen_mention, thread_originator_guid, thread_originator_part, syndication_ranges, synced_syndication_ranges, was_delivered_quietly, did_notify_recipient, date_retracted, date_edited, was_detonated, part_count, is_stewie, is_sos, is_critical, bia_reference_id, is_kt_verified, fallback_hash, associated_message_emoji, is_pending_satellite_send, needs_relay, schedule_type, schedule_state, sent_or_received_off_grid FROM message JOIN chat_message_join AS cmj ON message.ROWint ID = cmj.message_id WHERE message.guid = ?;",
        (uint64_t)v15);
      int v11 = v16;
    }
    else
    {
      CFStringRef v14 = IMDMessageRecordCopyMessageForGUID(v8);
      int v11 = *(__CFString **)(*(void *)&buf[8] + 40);
      *(void *)(*(void *)&buf[8] + 40) = v14;
    }

    v10[2](v10, *(void *)(*(void *)&buf[8] + 40));
    _Block_object_dispose(buf, 8);
  }
  else if (IMOSLoggingEnabled())
  {
    int64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      __int16 v13 = _Block_copy(v10);
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v8;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v13;
      _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Database | One or more invalid required parameters: messageGUID: %@, completionHandler: %@", buf, 0x16u);
    }
  }
}

- (void)fetchScheduledMessageRecordsForChatRecordWithGUID:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x3032000000;
  long long v20 = sub_1AFB9E784;
  uint64_t v21 = sub_1AFB9E794;
  id v22 = 0;
  if (v8 && [v8 length]) {
    id v10 = @"SELECT m.ROWID, m.guid, m.text, m.replace, m.service_center, m.handle_id, m.subject, m.country, m.attributedBody, m.version, m.type, m.service, m.account, m.account_guid, m.error, m.date, m.date_read, m.date_delivered, m.is_delivered, m.is_finished, m.is_emote, m.is_from_me, m.is_empty, m.is_delayed, m.is_auto_reply, m.is_prepared, m.is_read, m.is_system_message, m.is_sent, m.has_dd_results, m.is_service_message, m.is_forward, m.was_downgraded, m.is_archive, m.cache_has_attachments, m.cache_roomnames, m.was_data_detected, m.was_deduplicated, m.is_audio_message, m.is_played, m.date_played, m.item_type, m.other_handle, m.group_title, m.group_action_type, m.share_status, m.share_direction, m.is_expirable, m.expire_state, m.message_action_type, m.message_source, m.associated_message_guid, m.associated_message_type, m.balloon_bundle_id, m.payload_data, m.expressive_send_style_id, m.associated_message_range_location, m.associated_message_range_length, m.time_expressive_send_played, m.message_summary_info, m.ck_sync_state, m.ck_record_id, m.ck_record_change_tag, m.destination_caller_id, m.is_corrupt, m.reply_to_guid, m.sort_id, m.is_spam, m.has_unseen_mention, m.thread_originator_guid, m.thread_originator_part, m.syndication_ranges, m.synced_syndication_ranges, m.was_delivered_quietly, m.did_notify_recipient, m.date_retracted, m.date_edited, m.was_detonated, m.part_count, m.is_stewie, m.is_sos, m.is_critical, m.bia_reference_id, m.is_kt_verified, m.fallback_hash, m.associated_message_emoji, m.is_pending_satellite_send, m.needs_relay, m.schedule_type, m.schedule_state, m.sent_or_received_off_grid FROM message m  INNER JOIN chat_message_join cm ON cm.message_id = m.rowid  INNER JOIN chat c ON c.ROWID = cm.chat_id  WHERE c.guid = ?  AND m.schedule_type == 2  AND (m.schedule_state == 1 OR m.schedule_state == 2)  ORDER BY m.date ASC LIMIT ?";
  }
  else {
    id v10 = @"SELECT m.ROWID, m.guid, m.text, m.replace, m.service_center, m.handle_id, m.subject, m.country, m.attributedBody, m.version, m.type, m.service, m.account, m.account_guid, m.error, m.date, m.date_read, m.date_delivered, m.is_delivered, m.is_finished, m.is_emote, m.is_from_me, m.is_empty, m.is_delayed, m.is_auto_reply, m.is_prepared, m.is_read, m.is_system_message, m.is_sent, m.has_dd_results, m.is_service_message, m.is_forward, m.was_downgraded, m.is_archive, m.cache_has_attachments, m.cache_roomnames, m.was_data_detected, m.was_deduplicated, m.is_audio_message, m.is_played, m.date_played, m.item_type, m.other_handle, m.group_title, m.group_action_type, m.share_status, m.share_direction, m.is_expirable, m.expire_state, m.message_action_type, m.message_source, m.associated_message_guid, m.associated_message_type, m.balloon_bundle_id, m.payload_data, m.expressive_send_style_id, m.associated_message_range_location, m.associated_message_range_length, m.time_expressive_send_played, m.message_summary_info, m.ck_sync_state, m.ck_record_id, m.ck_record_change_tag, m.destination_caller_id, m.is_corrupt, m.reply_to_guid, m.sort_id, m.is_spam, m.has_unseen_mention, m.thread_originator_guid, m.thread_originator_part, m.syndication_ranges, m.synced_syndication_ranges, m.was_delivered_quietly, m.did_notify_recipient, m.date_retracted, m.date_edited, m.was_detonated, m.part_count, m.is_stewie, m.is_sos, m.is_critical, m.bia_reference_id, m.is_kt_verified, m.fallback_hash, m.associated_message_emoji, m.is_pending_satellite_send, m.needs_relay, m.schedule_type, m.schedule_state, m.sent_or_received_off_grid FROM message m  INNER JOIN chat_message_join cm ON cm.message_id = m.rowid  INNER JOIN chat c ON c.ROWID = cm.chat_id  WHERE m.schedule_type == 2  AND (m.schedule_state == 1 OR m.schedule_state == 2)  ORDER BY m.date ASC LIMIT ?";
  }
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB9F0C0;
  v12[3] = &unk_1E5F8E4A8;
  id v11 = v8;
  id v15 = &v17;
  unint64_t v16 = a4;
  id v13 = v11;
  CFStringRef v14 = self;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v10, (uint64_t)v12);
  if (v9) {
    v9[2](v9, v18[5]);
  }

  _Block_object_dispose(&v17, 8);
}

- (void)addScheduledMessageGUIDandCKRecordToDeleteFromCloudKit:(id)a3 recordID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1AFB9F22C;
  v9[3] = &unk_1E5F94098;
  id v10 = v5;
  id v11 = v6;
  id v7 = v6;
  id v8 = v5;
  _IMDPerformLockedStatementBlockWithQuery(@" INSERT INTO scheduled_messages_pending_cloudkit_delete (guid, recordID) VALUES (?, ?);",
    (uint64_t)v9);
}

- (void)deleteTombstonedScheduledMessagesWithRecordIDs:(id)a3
{
  id v3 = a3;
  MutableCopy = CFStringCreateMutableCopy(0, 0, @"DELETE from scheduled_messages_pending_cloudkit_delete");
  if ([v3 count])
  {
    CFStringAppend(MutableCopy, @" WHERE (recordint ID = ?");
    if ((unint64_t)[v3 count] >= 2)
    {
      unint64_t v5 = 1;
      do
      {
        CFStringAppend(MutableCopy, @" OR recordint ID = ?");
        ++v5;
      }
      while (v5 < [v3 count]);
    }
    CFStringAppend(MutableCopy, @""));
  }
  CFStringAppend(MutableCopy, @";");
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFB9F3CC;
  v7[3] = &unk_1E5F940C0;
  id v8 = v3;
  id v6 = v3;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)MutableCopy, (uint64_t)v7);
}

- (void)markMessageRecordsAsReadWithGUIDs:(id)a3
{
  id v3 = a3;
  CFAllocatorRef v4 = (const __CFAllocator *)*MEMORY[0x1E4F1CF80];
  unint64_t v5 = IMDGenerateInClauseForCount([v3 count]);
  CFStringRef v6 = CFStringCreateWithFormat(v4, 0, @"UPDATE   message SET   is_read = 1,   date_read = ? WHERE guid %@", v5);
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFB9F4EC;
  v8[3] = &unk_1E5F940C0;
  id v9 = v3;
  id v7 = v3;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v6, (uint64_t)v8);
}

- (id)scheduledMessagesMetadataPendingCloudKitDeleteWithLimit:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  memset(v11, 0, sizeof(v11));
  memset(v10, 0, sizeof(v10));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v10);
  _IMDSqlOperationBeginQuery((uint64_t)v10, @" select * from scheduled_messages_pending_cloudkit_delete where LENGTH(TRIM(recordID)) > 0 limit ?;");
  IMDSqlStatementBindInt64((uint64_t)v11, a3);
  while (IMDSqlOperationHasRows((uint64_t)v10))
  {
    Row = IMDSqlStatementGetRow((sqlite3_stmt **)v11);
    if (Row) {
      [v4 addObject:Row];
    }
  }
  IMDSqlOperationFinishQuery((uint64_t)v10);
  id v9 = 0;
  IMDSqlOperationRelease((uint64_t)v10, &v9);
  id v6 = v9;
  if (v6)
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Got error: %@ while trying to get scheduled messages pending cloudkit delete", buf, 0xCu);
    }
  }
  return v4;
}

- (id)_updateMessageSyncStateQueryFor:(int64_t)a3
{
  id v3 = NSString;
  id v4 = [NSString substitutionStringForCount:a3];
  unint64_t v5 = [v3 stringWithFormat:@"%@( %@)", @"UPDATE message SET ck_sync_state = ? where guid in ", v4];

  return v5;
}

- (void)updateMessagesSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v18 = 0u;
  memset(v17, 0, sizeof(v17));
  memset(v16, 0, sizeof(v16));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v16);
  IMDSqlOperationBeginTransaction(v16);
  _IMDSqlOperationBeginQuery((uint64_t)v16, (CFStringRef)-[IMDDatabase _updateMessageSyncStateQueryFor:](self, "_updateMessageSyncStateQueryFor:", [v6 count]));
  IMDSqlStatementBindInt64((uint64_t)v17, a3);
  CFArrayRef v7 = (const __CFArray *)v6;
  IMDSqlStatementBindTextFromArrayOfCFStrings((uint64_t)v17, v7);
  if (IMDSqlOperationFinishQuery((uint64_t)v16))
  {
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFArrayRef v20 = v7;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "CloudSync.message | updated ck_sync_state for recordIDs: %@", buf, 0xCu);
    }
  }
  else
  {
    id v8 = *((id *)&v18 + 1);
    id v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1AFC66930((uint64_t)v7, v8);
    }
  }
  IMDSqlOperationCommitOrRevertTransaction(v16);
  id v15 = 0;
  BOOL v10 = IMDSqlOperationRelease((uint64_t)v16, &v15);
  id v11 = v15;
  int64_t v12 = IMLogHandleForCategory();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (v13) {
      sub_1AFC66840();
    }
  }
  else if (v13)
  {
    sub_1AFC668AC(v11);
  }

  uint64_t v14 = IMLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CFArrayRef v20 = v7;
    _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "CloudSync.message | Finished updating ck_sync_state for recordIDs %@", buf, 0xCu);
  }
}

- (BOOL)_updateSyndicatedMessageItem:(id)a3 newMessageItem:(id)a4 newSyndicationRange:(id)a5
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  BOOL v10 = v9;
  if (v7)
  {
    if (v8)
    {
      if (v9)
      {
        if (IMOSLoggingEnabled())
        {
          id v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            int64_t v12 = [v8 guid];
            *(_DWORD *)buf = 138412546;
            id v28 = v12;
            __int16 v29 = 2112;
            id v30 = v10;
            _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "Updating syndication ranges for message item with guid %@. newSyndicationRange: %@", buf, 0x16u);
          }
        }
        BOOL v13 = [v8 syndicationRanges];
        char v26 = 0;
        uint64_t v14 = (void *)MEMORY[0x1E4F6E880];
        v33[0] = v10;
        id v15 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
        unint64_t v16 = [v14 updateMessagesRanges:v13 withMessagePartSyndicationRanges:v15 didUpdate:&v26];

        if (v26)
        {
          [v8 setSyndicationRanges:v16];
          uint64_t v17 = IMDUpdateIMMessageItemWithIMMessageItemForceReplaceReplaceError(v7, v8, 1, 0, 0, 1, 0);
          long long v18 = [v17 guid];
          IMDCoreSpotlightAddMessageGUID(v18, 1011);

          if (IMOSLoggingEnabled())
          {
            uint64_t v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              CFArrayRef v20 = [v8 guid];
              *(_DWORD *)buf = 138412290;
              id v28 = v20;
              _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "Updated syndication ranges for message: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          if (!IMOSLoggingEnabled())
          {
LABEL_25:
            BOOL v21 = v26 != 0;

            goto LABEL_26;
          }
          uint64_t v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v22 = [v8 guid];
            id v23 = [v10 description];
            __int16 v24 = [v13 componentsJoinedByString:@",\n"];
            *(_DWORD *)buf = 138412802;
            id v28 = v22;
            __int16 v29 = 2112;
            id v30 = v23;
            __int16 v31 = 2112;
            uint64_t v32 = v24;
            _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "Did NOT update syndication ranges for message: %@\nNew Range:\n%@\nOriginal Ranges:\n%@", buf, 0x20u);
          }
        }

        goto LABEL_25;
      }
      BOOL v13 = IMLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1AFC66A34();
      }
    }
    else
    {
      BOOL v13 = IMLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1AFC66A00();
      }
    }
  }
  else
  {
    BOOL v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1AFC669CC();
    }
  }
  BOOL v21 = 0;
LABEL_26:

  return v21;
}

- (void)updateAttachmentSyndicationRanges:(id)a3 shouldHideFromSyndication:(BOOL)a4
{
  BOOL v35 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    IMMessageGuidFromIMFileTransferGuid();
    CFStringRef v5 = (const __CFString *)objc_claimAutoreleasedReturnValue();
    id v6 = v5;
    if (!v5)
    {
      id v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1AFC66AE4();
      }
      goto LABEL_58;
    }
    id v7 = (const __CFArray **)IMDMessageRecordCopyMessageForGUID(v5);
    if (v7)
    {
      id v8 = v7;
      id v9 = IMDCreateIMItemFromIMDMessageRecordRefWithAccountLookup(v7, 0, 0, 0);
      CFRelease(v8);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (v9)
        {
          if (IMOSLoggingEnabled())
          {
            BOOL v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              long long v41 = "-[IMDDatabase(Messages) updateAttachmentSyndicationRanges:shouldHideFromSyndication:]";
              __int16 v42 = 2112;
              id v43 = v4;
              _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "%s Found corresponding IMMessageItem for attachment GUID %@", buf, 0x16u);
            }
          }
          id v11 = [v9 fileTransferGUIDs];
          int v12 = [v11 containsObject:v4];

          if (v12)
          {
            BOOL v13 = v4;
          }
          else
          {
            BOOL v13 = [v9 findTransferGUIDMatchingSpotlightDonatedSpeculativeTransferGUID:v4];
            if (!v13)
            {
              uint64_t v32 = IMLogHandleForCategory();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR)) {
                sub_1AFC66CE8();
              }

              BOOL v13 = IMLogHandleForCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
                sub_1AFC66C50(v9);
              }
LABEL_57:

LABEL_58:
              goto LABEL_59;
            }
          }
          [v9 messageParts];
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          id obj = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v17 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
          if (v17)
          {
            uint64_t v18 = *(void *)v37;
LABEL_27:
            uint64_t v19 = 0;
            while (1)
            {
              if (*(void *)v37 != v18) {
                objc_enumerationMutation(obj);
              }
              CFArrayRef v20 = *(void **)(*((void *)&v36 + 1) + 8 * v19);
              BOOL v21 = [v20 transferGUID];
              int v22 = [v13 isEqualToString:v21];

              if (v22) {
                break;
              }
              if (v17 == ++v19)
              {
                uint64_t v17 = [obj countByEnumeratingWithState:&v36 objects:v46 count:16];
                if (v17) {
                  goto LABEL_27;
                }
                goto LABEL_33;
              }
            }
            if (IMOSLoggingEnabled())
            {
              id v23 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                long long v41 = "-[IMDDatabase(Messages) updateAttachmentSyndicationRanges:shouldHideFromSyndication:]";
                __int16 v42 = 2112;
                id v43 = v4;
                __int16 v44 = 2112;
                long long v45 = v13;
                _os_log_impl(&dword_1AFB53000, v23, OS_LOG_TYPE_INFO, "%s Found corresponding IMMessagePartDescriptor for attachment GUID %@ (actualAttachmentGUID %@)", buf, 0x20u);
              }
            }
            id v24 = v20;

            if (v24)
            {
              [(IMDDatabase *)self _updateMessageItemSyndicationRanges:v9 messagePartDescriptor:v24 shouldHideFromSyndication:v35];

              goto LABEL_56;
            }
          }
          else
          {
LABEL_33:
          }
          int v25 = [v9 isCMM];
          int v26 = IMOSLoggingEnabled();
          if (v25)
          {
            if (v26)
            {
              v27 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1AFB53000, v27, OS_LOG_TYPE_INFO, "messageItem is CMM, routing to alternative path to handle IMMessagePartSyndicationAssetDescriptors", buf, 2u);
              }
            }
            id v28 = +[IMDDatabase _newSyndicationRangeForCMMMessageItem:v9 syndicationIdentifier:v13 shouldHideFromSyndication:v35];
            if (v28
              && ![(IMDDatabase *)self _updateSyndicatedMessageItem:v9 newMessageItem:v9 newSyndicationRange:v28]&& IMOSLoggingEnabled())
            {
              __int16 v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                id v30 = [v9 guid];
                *(_DWORD *)buf = 136315394;
                long long v41 = "-[IMDDatabase(Messages) updateAttachmentSyndicationRanges:shouldHideFromSyndication:]";
                __int16 v42 = 2112;
                id v43 = v30;
                _os_log_impl(&dword_1AFB53000, v29, OS_LOG_TYPE_INFO, "%s message item with GUID %@ did not update its syndication ranges", buf, 0x16u);
              }
            }
          }
          else if (v26)
          {
            __int16 v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              long long v41 = (const char *)v13;
              _os_log_impl(&dword_1AFB53000, v31, OS_LOG_TYPE_INFO, "Failed to find matching messagePart for attachment GUID %@", buf, 0xCu);
            }
          }
LABEL_56:

          goto LABEL_57;
        }
LABEL_22:
        id v9 = IMLogHandleForCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
          sub_1AFC66B60();
        }
        goto LABEL_58;
      }
      unint64_t v16 = IMLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1AFC66D98();
      }
    }
    else
    {
      id v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1AFC66BDC();
      }
    }

    goto LABEL_22;
  }
  id v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1AFC66A68(v6, v14, v15);
  }
LABEL_59:
}

- (void)_updateMessageItemSyndicationRanges:(id)a3 messagePartDescriptor:(id)a4 shouldHideFromSyndication:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = v9;
  if (v8)
  {
    if (v9)
    {
      uint64_t v11 = [v9 messagePartRange];
      if (!(v11 | v12))
      {
        BOOL v13 = IMLogHandleForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1AFC66F04(v8);
        }
        goto LABEL_57;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = [v8 guid];
          uint64_t v20 = [v10 messagePartIndex];
          v66.location = [v10 messagePartRange];
          BOOL v21 = NSStringFromRange(v66);
          *(_DWORD *)buf = 136315906;
          v58 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
          __int16 v59 = 2112;
          id v60 = v19;
          __int16 v61 = 2048;
          uint64_t v62 = v20;
          __int16 v63 = 2112;
          uint64_t v64 = v21;
          _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "%s Updating syndication ranges for message guid: %@, part %ld, range: %@", buf, 0x2Au);
        }
      }
      NSUInteger v22 = [v10 messagePartRange];
      NSUInteger v24 = v23;
      int v25 = IMOSLoggingEnabled();
      if (v5)
      {
        if (v25)
        {
          int v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            v67.location = v22;
            v67.length = v24;
            NSStringFromRange(v67);
            id v27 = (id)objc_claimAutoreleasedReturnValue();
            id v28 = [v8 guid];
            *(_DWORD *)buf = 136315650;
            v58 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
            __int16 v59 = 2112;
            id v60 = v27;
            __int16 v61 = 2112;
            uint64_t v62 = (uint64_t)v28;
            _os_log_impl(&dword_1AFB53000, v26, OS_LOG_TYPE_INFO, "%s Removing message part range from syndication %@ for message item with GUID %@", buf, 0x20u);
          }
        }
        id v29 = objc_alloc(MEMORY[0x1E4F6E880]);
        id v30 = [MEMORY[0x1E4F1C9C8] date];
        BOOL v13 = objc_msgSend(v29, "initWithSyndicationType:messagePartRange:syndicationStartDate:", 4, v22, v24, v30);
      }
      else
      {
        if (v25)
        {
          __int16 v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v68.location = v22;
            v68.length = v24;
            NSStringFromRange(v68);
            id v32 = (id)objc_claimAutoreleasedReturnValue();
            v33 = [v8 guid];
            *(_DWORD *)buf = 136315650;
            v58 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
            __int16 v59 = 2112;
            id v60 = v32;
            __int16 v61 = 2112;
            uint64_t v62 = (uint64_t)v33;
            _os_log_impl(&dword_1AFB53000, v31, OS_LOG_TYPE_INFO, "%s Unhiding syndication for message part range %@ for message item with GUID %@", buf, 0x20u);
          }
        }
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        v34 = objc_msgSend(v8, "syndicationRanges", 0);
        uint64_t v35 = [v34 countByEnumeratingWithState:&v52 objects:v56 count:16];
        if (v35)
        {
          uint64_t v36 = *(void *)v53;
LABEL_26:
          uint64_t v37 = 0;
          while (1)
          {
            if (*(void *)v53 != v36) {
              objc_enumerationMutation(v34);
            }
            long long v38 = *(void **)(*((void *)&v52 + 1) + 8 * v37);
            if ([v38 messagePartRange] == v22 && v39 == v24) {
              break;
            }
            if (v35 == ++v37)
            {
              uint64_t v35 = [v34 countByEnumeratingWithState:&v52 objects:v56 count:16];
              if (v35) {
                goto LABEL_26;
              }
              goto LABEL_35;
            }
          }
          id v30 = v38;

          if (v30 && ([v30 syndicationType] & 4) != 0)
          {
            uint64_t v49 = [v30 syndicationType];
            id v50 = objc_alloc(MEMORY[0x1E4F6E880]);
            uint64_t v51 = [MEMORY[0x1E4F1C9C8] date];
            BOOL v13 = objc_msgSend(v50, "initWithSyndicationType:messagePartRange:syndicationStartDate:", v49 & 0xFFFFFFFFFFFFFFFBLL, v22, v24, v51);

            goto LABEL_43;
          }
        }
        else
        {
LABEL_35:

          id v30 = 0;
        }
        if (IMOSLoggingEnabled())
        {
          long long v41 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            __int16 v42 = [v8 guid];
            *(_DWORD *)buf = 136315650;
            v58 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
            __int16 v59 = 2112;
            id v60 = v42;
            __int16 v61 = 2112;
            uint64_t v62 = (uint64_t)v30;
            _os_log_impl(&dword_1AFB53000, v41, OS_LOG_TYPE_INFO, "%s NOT updating message syndication ranges for message item with GUID %@ because it is already unhidden. currentSyndicationRange: %@", buf, 0x20u);
          }
        }
        BOOL v13 = 0;
      }
LABEL_43:

      int v43 = IMOSLoggingEnabled();
      if (!v13)
      {
        if (!v43) {
          goto LABEL_57;
        }
        long long v46 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          long long v48 = [v8 guid];
          *(_DWORD *)buf = 136315394;
          v58 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
          __int16 v59 = 2112;
          id v60 = v48;
          _os_log_impl(&dword_1AFB53000, v46, OS_LOG_TYPE_INFO, "%s newSyndicationRange was nil. Did not update syndication ranges for message with GUID %@", buf, 0x16u);
        }
LABEL_56:

        goto LABEL_57;
      }
      if (v43)
      {
        __int16 v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          long long v45 = [v8 guid];
          *(_DWORD *)buf = 136315650;
          v58 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
          __int16 v59 = 2112;
          id v60 = v45;
          __int16 v61 = 2112;
          uint64_t v62 = (uint64_t)v13;
          _os_log_impl(&dword_1AFB53000, v44, OS_LOG_TYPE_INFO, "%s Updating message syndication ranges for message item with GUID %@. newSyndicationRange: %@", buf, 0x20u);
        }
      }
      if (![(IMDDatabase *)self _updateSyndicatedMessageItem:v8 newMessageItem:v8 newSyndicationRange:v13]&& IMOSLoggingEnabled())
      {
        long long v46 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
        {
          uint64_t v47 = [v8 guid];
          *(_DWORD *)buf = 136315394;
          v58 = "-[IMDDatabase(Messages) _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:]";
          __int16 v59 = 2112;
          id v60 = v47;
          _os_log_impl(&dword_1AFB53000, v46, OS_LOG_TYPE_INFO, "%s message item with GUID %@ did not update its syndication ranges", buf, 0x16u);
        }
        goto LABEL_56;
      }
    }
    else
    {
      BOOL v13 = IMLogHandleForCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
        sub_1AFC66E88(v13, v16, v17);
      }
    }
  }
  else
  {
    BOOL v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1AFC66E0C(v13, v14, v15);
    }
  }
LABEL_57:
}

+ (id)_newSyndicationRangeForCMMMessageItem:(id)a3 syndicationIdentifier:(id)a4 shouldHideFromSyndication:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v152 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v119 = a4;
  if (!v7)
  {
    uint64_t v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1AFC66F9C(v15, v16, v17);
    }
    goto LABEL_13;
  }
  id v8 = [v7 fileTransferGUIDs];
  if (!v8
    || ([v7 fileTransferGUIDs],
        id v9 = objc_claimAutoreleasedReturnValue(),
        uint64_t v10 = [v9 count],
        v9,
        v8,
        !v10))
  {
    uint64_t v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1AFC67018(v7);
    }
    goto LABEL_13;
  }
  unint64_t v11 = [v7 getCMMAssetOffset];
  unint64_t v118 = IMCMMAssetIndexFromIMFileTransferGUID();
  uint64_t v12 = [v7 fileTransferGUIDs];
  unint64_t v13 = [v12 count];

  if (v13 < v11)
  {
    uint64_t v14 = IMLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      sub_1AFC670B0();
    }

    goto LABEL_14;
  }
  if (v13 != v11)
  {
    if (v118 < v11)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "Attachment is CMM preview, aborting since we don't care about donating preview to CoreSpotlight", buf, 2u);
        }
      }
      goto LABEL_14;
    }
    unint64_t v114 = v13 - v11;
    BOOL v21 = [v7 fileTransferGUIDs];
    v117 = [v21 firstObject];

    if (!v117)
    {
      id v32 = IMLogHandleForCategory();
      v33 = v32;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        sub_1AFC671C4(v7);
        goto LABEL_46;
      }
LABEL_47:
      uint64_t v18 = 0;
      goto LABEL_131;
    }
    long long v134 = 0u;
    long long v135 = 0u;
    long long v132 = 0u;
    long long v133 = 0u;
    NSUInteger v22 = [v7 messageParts];
    uint64_t v23 = [v22 countByEnumeratingWithState:&v132 objects:v151 count:16];
    if (v23)
    {
      uint64_t v24 = *(void *)v133;
      while (2)
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v133 != v24) {
            objc_enumerationMutation(v22);
          }
          int v26 = *(void **)(*((void *)&v132 + 1) + 8 * i);
          id v27 = [v26 transferGUID];
          int v28 = [v117 isEqualToString:v27];

          if (v28)
          {
            if (IMOSLoggingEnabled())
            {
              id v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 136315650;
                v146 = "+[IMDDatabase(Messages) _newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:]";
                __int16 v147 = 2112;
                unint64_t v148 = (unint64_t)v117;
                __int16 v149 = 2112;
                id v150 = v119;
                _os_log_impl(&dword_1AFB53000, v29, OS_LOG_TYPE_INFO, "%s Found corresponding IMMessagePartDescriptor for fileTransferGUID %@ (actualAttachmentGUID %@)", buf, 0x20u);
              }
            }
            uint64_t v30 = [v26 messagePartRange];
            uint64_t v115 = v31;
            uint64_t v116 = v30;
            goto LABEL_40;
          }
        }
        uint64_t v23 = [v22 countByEnumeratingWithState:&v132 objects:v151 count:16];
        if (v23) {
          continue;
        }
        break;
      }
    }
    uint64_t v115 = 0x7FFFFFFFFFFFFFFFLL;
    uint64_t v116 = 0x7FFFFFFFFFFFFFFFLL;
LABEL_40:

    if (v116 == 0x7FFFFFFFFFFFFFFFLL && v115 == 0x7FFFFFFFFFFFFFFFLL)
    {
      id v32 = IMLogHandleForCategory();
      v33 = v32;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
      {
        sub_1AFC6725C();
LABEL_46:
        uint64_t v18 = 0;
        v33 = v32;
LABEL_131:

        goto LABEL_15;
      }
      goto LABEL_47;
    }
    v34 = [v7 syndicationRanges];
    if (!v34
      || ([v7 syndicationRanges],
          uint64_t v35 = objc_claimAutoreleasedReturnValue(),
          BOOL v36 = [v35 count] == 0,
          v35,
          v34,
          v36))
    {
      uint64_t v111 = 0;
    }
    else
    {
      uint64_t v37 = [v7 syndicationRanges];
      long long v38 = [v37 firstObject];
      uint64_t v111 = [v38 copy];
    }
    int v39 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v39)
      {
        long long v40 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          long long v41 = [v7 guid];
          *(_DWORD *)buf = 136315650;
          v146 = "+[IMDDatabase(Messages) _newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:]";
          __int16 v147 = 2048;
          unint64_t v148 = v118;
          __int16 v149 = 2112;
          id v150 = v41;
          _os_log_impl(&dword_1AFB53000, v40, OS_LOG_TYPE_INFO, "%s Updating asset syndication descriptor to be hidden for asset index %ld on message item with GUID %@", buf, 0x20u);
        }
      }
      __int16 v42 = objc_msgSend(v7, "fileTransferGUIDs", v111);
      objc_msgSend(v42, "subarrayWithRange:", v11, v114);
      id v113 = (id)objc_claimAutoreleasedReturnValue();

      if (!v112) {
        goto LABEL_81;
      }
      int v43 = [v112 assetDescriptor];
      if (!v43) {
        goto LABEL_81;
      }
      __int16 v44 = [v112 assetDescriptor];
      long long v45 = [v44 assetSyndications];
      BOOL v46 = v45 == 0;

      if (!v46)
      {
        uint64_t v47 = (void *)MEMORY[0x1E4F1CA60];
        long long v48 = [v112 assetDescriptor];
        uint64_t v49 = [v48 assetSyndications];
        id v50 = [v47 dictionaryWithDictionary:v49];

        if (!v50
          || ([v50 objectForKey:&unk_1F0864EC0],
              uint64_t v51 = objc_claimAutoreleasedReturnValue(),
              BOOL v52 = v51 == 0,
              v51,
              v52))
        {
          id v60 = 0;
        }
        else
        {
          long long v53 = [v50 objectForKeyedSubscript:&unk_1F0864EC0];
          long long v54 = (void *)[v53 mutableCopy];

          long long v55 = [MEMORY[0x1E4F28ED0] numberWithInteger:v118];
          v56 = [v54 objectForKey:v55];

          if (v56
            && ([MEMORY[0x1E4F28ED0] numberWithInteger:v118],
                __int16 v57 = objc_claimAutoreleasedReturnValue(),
                [v54 objectForKeyedSubscript:v57],
                v58 = objc_claimAutoreleasedReturnValue(),
                int v59 = [v58 intValue],
                v58,
                v57,
                v59 != 4))
          {
            v99 = [MEMORY[0x1E4F28ED0] numberWithInteger:v118];
            [v54 setObject:&unk_1F0864ED8 forKeyedSubscript:v99];

            id v60 = v54;
          }
          else
          {
            id v60 = 0;
          }
        }
      }
      else
      {
LABEL_81:
        objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v113, "count"));
        id v60 = (id)objc_claimAutoreleasedReturnValue();
        long long v130 = 0u;
        long long v131 = 0u;
        long long v128 = 0u;
        long long v129 = 0u;
        id v50 = v113;
        uint64_t v70 = [v50 countByEnumeratingWithState:&v128 objects:v144 count:16];
        if (v70)
        {
          uint64_t v71 = *(void *)v129;
          do
          {
            for (uint64_t j = 0; j != v70; ++j)
            {
              if (*(void *)v129 != v71) {
                objc_enumerationMutation(v50);
              }
              if (*(void *)(*((void *)&v128 + 1) + 8 * j))
              {
                unint64_t v73 = IMCMMAssetIndexFromIMFileTransferGUID();
                if (v73 >= v11)
                {
                  if (v73 == v118)
                  {
                    v74 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithInteger:");
                    [v60 setObject:&unk_1F0864ED8 forKeyedSubscript:v74];
                  }
                  else
                  {
                    v74 = [MEMORY[0x1E4F28ED0] numberWithInteger:v73];
                    [v60 setObject:&unk_1F0864EC0 forKeyedSubscript:v74];
                  }
                }
              }
            }
            uint64_t v70 = [v50 countByEnumeratingWithState:&v128 objects:v144 count:16];
          }
          while (v70);
        }
      }

      if (v60)
      {
        id v100 = objc_alloc(MEMORY[0x1E4F6E878]);
        v142 = &unk_1F0864EC0;
        id v143 = v60;
        v101 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v143 forKeys:&v142 count:1];
        v102 = (void *)[v100 initWithAssetSyndications:v101];

        id v103 = objc_alloc(MEMORY[0x1E4F6E880]);
        v104 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v18 = objc_msgSend(v103, "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", 0, v116, v115, v104, 0, v102);

LABEL_120:
        int v105 = IMOSLoggingEnabled();
        if (v18)
        {
          if (v105)
          {
            v106 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v106, OS_LOG_TYPE_INFO))
            {
              v107 = [v7 guid];
              *(_DWORD *)buf = 136315650;
              v146 = "+[IMDDatabase(Messages) _newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:]";
              __int16 v147 = 2112;
              unint64_t v148 = (unint64_t)v107;
              __int16 v149 = 2112;
              id v150 = v18;
              _os_log_impl(&dword_1AFB53000, v106, OS_LOG_TYPE_INFO, "%s Updating message syndication ranges for message item with GUID %@. newSyndicationRange: %@", buf, 0x20u);
            }
          }
          id v108 = v18;
        }
        else if (v105)
        {
          v109 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
          {
            v110 = [v7 guid];
            *(_DWORD *)buf = 136315394;
            v146 = "+[IMDDatabase(Messages) _newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:]";
            __int16 v147 = 2112;
            unint64_t v148 = (unint64_t)v110;
            _os_log_impl(&dword_1AFB53000, v109, OS_LOG_TYPE_INFO, "%s newSyndicationRange was nil. Did not update syndication ranges for message with GUID %@", buf, 0x16u);
          }
        }

        v33 = v112;
        goto LABEL_131;
      }
    }
    else
    {
      if (v39)
      {
        __int16 v61 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          uint64_t v62 = [v7 guid];
          *(_DWORD *)buf = 136315650;
          v146 = "+[IMDDatabase(Messages) _newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:]";
          __int16 v147 = 2048;
          unint64_t v148 = v118;
          __int16 v149 = 2112;
          id v150 = v62;
          _os_log_impl(&dword_1AFB53000, v61, OS_LOG_TYPE_INFO, "%s Updating asset syndication descriptor to be not hidden for part index %ld on message item with GUID %@", buf, 0x20u);
        }
      }
      long long v126 = 0u;
      long long v127 = 0u;
      long long v124 = 0u;
      long long v125 = 0u;
      __int16 v63 = objc_msgSend(v7, "syndicationRanges", v111);
      uint64_t v64 = [v63 countByEnumeratingWithState:&v124 objects:v141 count:16];
      if (!v64)
      {
LABEL_80:

LABEL_102:
        v82 = [v7 fileTransferGUIDs];
        v83 = objc_msgSend(v82, "subarrayWithRange:", v11, v114);

        v84 = objc_msgSend(MEMORY[0x1E4F1CA60], "dictionaryWithCapacity:", objc_msgSend(v83, "count"));
        long long v122 = 0u;
        long long v123 = 0u;
        long long v120 = 0u;
        long long v121 = 0u;
        id v60 = v83;
        uint64_t v85 = [v60 countByEnumeratingWithState:&v120 objects:v140 count:16];
        if (v85)
        {
          uint64_t v86 = *(void *)v121;
          do
          {
            for (uint64_t k = 0; k != v85; ++k)
            {
              if (*(void *)v121 != v86) {
                objc_enumerationMutation(v60);
              }
              if (*(void *)(*((void *)&v120 + 1) + 8 * k))
              {
                unint64_t v88 = IMCMMAssetIndexFromIMFileTransferGUID();
                if (v88 >= v11)
                {
                  v89 = [MEMORY[0x1E4F28ED0] numberWithInteger:v88];
                  [v84 setObject:&unk_1F0864EC0 forKeyedSubscript:v89];
                }
              }
            }
            uint64_t v85 = [v60 countByEnumeratingWithState:&v120 objects:v140 count:16];
          }
          while (v85);
        }

        id v90 = objc_alloc(MEMORY[0x1E4F6E878]);
        v138 = &unk_1F0864EC0;
        v139 = v84;
        v91 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v139 forKeys:&v138 count:1];
        v92 = (void *)[v90 initWithAssetSyndications:v91];

        id v93 = objc_alloc(MEMORY[0x1E4F6E880]);
        v94 = [MEMORY[0x1E4F1C9C8] date];
        v95 = objc_msgSend(v93, "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", 0, v116, v115, v94, 0, v92);

        id v113 = v95;
        uint64_t v18 = v113;
        goto LABEL_120;
      }
      uint64_t v65 = *(void *)v125;
LABEL_71:
      uint64_t v66 = 0;
      while (1)
      {
        if (*(void *)v125 != v65) {
          objc_enumerationMutation(v63);
        }
        NSRange v67 = *(void **)(*((void *)&v124 + 1) + 8 * v66);
        if ([v67 messagePartRange] == v116 && v68 == v115) {
          break;
        }
        if (v64 == ++v66)
        {
          uint64_t v64 = [v63 countByEnumeratingWithState:&v124 objects:v141 count:16];
          if (v64) {
            goto LABEL_71;
          }
          goto LABEL_80;
        }
      }
      id v113 = v67;

      if (!v113) {
        goto LABEL_102;
      }
      v75 = [v113 syndicationForPartIndex:v118 asset:0];
      id v60 = v75;
      if (v75)
      {
        int v76 = [v75 intValue];
        uint64_t v77 = v76;
        if ((v76 & 4) != 0)
        {
          v96 = [MEMORY[0x1E4F28ED0] numberWithInteger:v118];
          v136 = v96;
          v97 = [MEMORY[0x1E4F28ED0] numberWithInteger:v77 & 0xFFFFFFFFFFFFFFFBLL];
          v137 = v97;
          v98 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v137 forKeys:&v136 count:1];

          uint64_t v18 = [MEMORY[0x1E4F6E880] updateAssetInfoWith:v98 asset:0 range:v113];

          goto LABEL_120;
        }
        if (IMOSLoggingEnabled())
        {
          v78 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          {
            v79 = [v7 guid];
            v80 = [v113 assetDescriptor];
            v81 = [v80 serializedString];
            *(_DWORD *)buf = 136315650;
            v146 = "+[IMDDatabase(Messages) _newSyndicationRangeForCMMMessageItem:syndicationIdentifier:shouldHideFromSyndication:]";
            __int16 v147 = 2112;
            unint64_t v148 = (unint64_t)v79;
            __int16 v149 = 2112;
            id v150 = v81;
            _os_log_impl(&dword_1AFB53000, v78, OS_LOG_TYPE_INFO, "%s NOT updating CMM asset syndication for message item with GUID %@ because it is already unhidden. current syndications: %@", buf, 0x20u);
          }
        }
      }
    }
    uint64_t v18 = 0;
    goto LABEL_120;
  }
  uint64_t v15 = IMLogHandleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
    sub_1AFC6712C(v7);
  }
LABEL_13:

LABEL_14:
  uint64_t v18 = 0;
LABEL_15:

  return v18;
}

- (void)updateMessageSyndicationRanges:(id)a3 shouldHideFromSyndication:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  CFStringRef v6 = (const __CFString *)a3;
  id v7 = (__CFString *)v6;
  if (v6)
  {
    id v8 = (const __CFArray **)IMDMessageRecordCopyMessageForGUID(v6);
    if (v8)
    {
      id v9 = v8;
      uint64_t v10 = IMDCreateIMItemFromIMDMessageRecordRefWithAccountLookup(v8, 0, 0, 0);
      CFRelease(v9);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        unint64_t v11 = v10;
        if (v11)
        {
          uint64_t v12 = v11;
          if (IMOSLoggingEnabled())
          {
            unint64_t v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 136315394;
              uint64_t v35 = "-[IMDDatabase(Messages) updateMessageSyndicationRanges:shouldHideFromSyndication:]";
              __int16 v36 = 2112;
              uint64_t v37 = v7;
              _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "%s Found IMMessageItem for message GUID %@", buf, 0x16u);
            }
          }
          uint64_t v14 = [objc_alloc(MEMORY[0x1E4F6E868]) initWithEncodedMessagePartGUID:v7];
          if (v14)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v15 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                uint64_t v16 = [v14 partNumber];
                *(_DWORD *)buf = 136315650;
                uint64_t v35 = "-[IMDDatabase(Messages) updateMessageSyndicationRanges:shouldHideFromSyndication:]";
                __int16 v36 = 2048;
                uint64_t v37 = (__CFString *)v16;
                __int16 v38 = 2112;
                int v39 = v7;
                _os_log_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_INFO, "%s Found partNumber %ld for message GUID %@", buf, 0x20u);
              }
            }
            uint64_t v17 = [v12 body];
            objc_msgSend(v17, "__im_messagePartMatchingPartIndex:", -[NSObject partNumber](v14, "partNumber"));
            id v18 = (id)objc_claimAutoreleasedReturnValue();

            if (v18)
            {
              [(IMDDatabase *)self _updateMessageItemSyndicationRanges:v12 messagePartDescriptor:v18 shouldHideFromSyndication:v4];
            }
            else
            {
              int v28 = IMLogHandleForCategory();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
                sub_1AFC67478(v14);
              }
            }
          }
          else
          {
            NSUInteger v22 = [v12 messageParts];
            if (IMOSLoggingEnabled())
            {
              uint64_t v23 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                uint64_t v24 = [v22 count];
                *(_DWORD *)buf = 136315650;
                uint64_t v35 = "-[IMDDatabase(Messages) updateMessageSyndicationRanges:shouldHideFromSyndication:]";
                __int16 v36 = 2112;
                uint64_t v37 = v7;
                __int16 v38 = 2048;
                int v39 = (__CFString *)v24;
                _os_log_impl(&dword_1AFB53000, v23, OS_LOG_TYPE_INFO, "%s messagePart number not foound for message GUID %@, updating all %ld parts", buf, 0x20u);
              }
            }
            long long v31 = 0u;
            long long v32 = 0u;
            long long v29 = 0u;
            long long v30 = 0u;
            id v18 = v22;
            uint64_t v25 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
            if (v25)
            {
              uint64_t v26 = *(void *)v30;
              do
              {
                for (uint64_t i = 0; i != v25; ++i)
                {
                  if (*(void *)v30 != v26) {
                    objc_enumerationMutation(v18);
                  }
                  -[IMDDatabase _updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:](self, "_updateMessageItemSyndicationRanges:messagePartDescriptor:shouldHideFromSyndication:", v12, *(void *)(*((void *)&v29 + 1) + 8 * i), v4, (void)v29);
                }
                uint64_t v25 = [v18 countByEnumeratingWithState:&v29 objects:v33 count:16];
              }
              while (v25);
            }
          }
LABEL_42:

          goto LABEL_43;
        }
      }
      else
      {
        BOOL v21 = IMLogHandleForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1AFC6751C();
        }
      }
      uint64_t v14 = IMLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1AFC673FC();
      }
      uint64_t v12 = 0;
      goto LABEL_42;
    }
    uint64_t v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1AFC67380();
    }
  }
  else
  {
    uint64_t v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1AFC67304(v12, v19, v20);
    }
  }
LABEL_43:
}

- (id)_updateMessageSyncedSyndicationRangesQueryFor:(int64_t)a3
{
  id v3 = NSString;
  BOOL v4 = [NSString substitutionStringForCount:a3];
  BOOL v5 = [v3 stringWithFormat:@"%@ (%@)", @"update message set synced_syndication_ranges=syndication_ranges where guid in", v4];

  return v5;
}

- (void)updateMessagesSyncedSyndicationRangesForGUIDs:(id)a3 toStatus:(int64_t)a4
{
  id v6 = a3;
  id v7 = v6;
  if (a4 == 1)
  {
    id v9 = v6;
    uint64_t v8 = [v6 count];
    id v7 = v9;
    if (v8)
    {
      [(IMDDatabase *)self _updateMessagesSyncedSyndicationRangesToSyncedForGUIDs:v9];
      id v7 = v9;
    }
  }
}

- (void)_updateMessagesSyncedSyndicationRangesToSyncedForGUIDs:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v16 = 0u;
  memset(v15, 0, sizeof(v15));
  memset(v14, 0, sizeof(v14));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v14);
  IMDSqlOperationBeginTransaction(v14);
  _IMDSqlOperationBeginQuery((uint64_t)v14, (CFStringRef)-[IMDDatabase _updateMessageSyncedSyndicationRangesQueryFor:](self, "_updateMessageSyncedSyndicationRangesQueryFor:", [v4 count]));
  CFArrayRef v5 = (const __CFArray *)v4;
  IMDSqlStatementBindTextFromArrayOfCFStrings((uint64_t)v15, v5);
  if (IMDSqlOperationFinishQuery((uint64_t)v14))
  {
    id v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFArrayRef v18 = v5;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "CloudSync.message | updated synced syndication ranges for recordIDs: %@", buf, 0xCu);
    }
  }
  else
  {
    id v6 = *((id *)&v16 + 1);
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1AFC67688((uint64_t)v5, v6);
    }
  }
  IMDSqlOperationCommitOrRevertTransaction(v14);
  id v13 = 0;
  BOOL v8 = IMDSqlOperationRelease((uint64_t)v14, &v13);
  id v9 = v13;
  uint64_t v10 = IMLogHandleForCategory();
  BOOL v11 = os_log_type_enabled(v10, OS_LOG_TYPE_ERROR);
  if (v8)
  {
    if (v11) {
      sub_1AFC67598();
    }
  }
  else if (v11)
  {
    sub_1AFC67604(v9);
  }

  uint64_t v12 = IMLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 138412290;
    CFArrayRef v18 = v5;
    _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "CloudSync.message | Finished updating synced syndication ranges for: %@", buf, 0xCu);
  }
}

- (void)moveMessageRecordsToRecoveryForMessageGUIDs:(id)a3 deleteDate:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v24 = a3;
  id v25 = a4;
  CFArrayRef v5 = [MEMORY[0x1E4F1CAD0] setWithArray:v24];
  id v6 = [v5 allObjects];

  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v25;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v6 count];
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Recently Deleted | Will begin moving messages to recoverable message table with deleteDate: %@ for %lu unique messages", buf, 0x16u);
    }
  }
  sqlite3_int64 v8 = objc_msgSend(v25, "__im_nanosecondTimeInterval");
  long long v38 = 0u;
  memset(v37, 0, sizeof(v37));
  memset(buf, 0, sizeof(buf));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
  IMDSqlOperationBeginTransaction(buf);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v12 = *(const __CFString **)(*((void *)&v28 + 1) + 8 * i);
        id v13 = (__CFString *)IMDMessageRecordCopyMessageForGUID(v12);
        sqlite3_int64 v14 = [(__CFString *)v13 rowID];
        _IMDSqlOperationBeginQuery((uint64_t)buf, @"INSERT OR REPLACE INTO chat_recoverable_message_join (chat_id, message_id, delete_date)   SELECT chat_id, message_id, ?   FROM chat_message_join AS cmj   JOIN message AS m   ON m.ROWint ID = cmj.message_id AND m.guid = ?;");
        IMDSqlStatementBindInt64((uint64_t)v37, v8);
        IMDSqlStatementBindTextFromCFString((uint64_t)v37, (uint64_t)v12);
        if (!IMDSqlOperationFinishQuery((uint64_t)buf))
        {
          id v17 = *((id *)&v38 + 1);
          CFArrayRef v18 = IMLogHandleForCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
            sub_1AFC67808();
          }

          goto LABEL_21;
        }
        _IMDSqlOperationBeginQuery((uint64_t)buf, @"DELETE FROM chat_message_join WHERE message_id = ? AND message_id IN(SELECT message_id FROM chat_recoverable_message_join WHERE message_id = ?);");
        IMDSqlStatementBindInt64((uint64_t)v37, v14);
        IMDSqlStatementBindInt64((uint64_t)v37, v14);
        if (!IMDSqlOperationFinishQuery((uint64_t)buf))
        {
          id v15 = *((id *)&v38 + 1);
          long long v16 = IMLogHandleForCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
            sub_1AFC677AC((uint64_t)v34, (uint64_t)v15);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_21:

  IMDSqlOperationCommitOrRevertTransaction(buf);
  id v27 = 0;
  BOOL v19 = IMDSqlOperationRelease((uint64_t)buf, &v27);
  id v20 = v27;
  if (v19)
  {
    IMDCoreSpotlightDeleteMessageGUIDS(obj, 1005);
    IMDCoreSpotlightScheduleUpdateForDeletedMessages(1005);
  }
  else
  {
    BOOL v21 = IMLogHandleForCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
      sub_1AFC67724(v20);
    }
  }
  if (IMOSLoggingEnabled())
  {
    NSUInteger v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = [obj count];
      *(_DWORD *)long long v32 = 134217984;
      uint64_t v33 = v23;
      _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "Recently Deleted | Finished moving messages to recoverable message table for %lu unique messages", v32, 0xCu);
    }
  }
}

- (void)deleteRecoverableMessagesOlderThanDays:(int64_t)a3
{
  CFArrayRef v5 = [MEMORY[0x1E4F1C9C8] date];
  objc_msgSend(v5, "__im_dateByAddingDays:", -a3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();

  id v6 = [(IMDDatabase *)self _permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:0 beforeDate:v7];
}

- (void)deleteJunkMessagesOlderThanDays:(int64_t)a3
{
  CFArrayRef v5 = [MEMORY[0x1E4F1C9C8] date];
  objc_msgSend(v5, "__im_dateByAddingDays:", -a3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();

  [(IMDDatabase *)self _permanentlyDeleteJunkMessagesBeforeDate:v6];
}

- (void)permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:(id)a3 completionHandler:(id)a4
{
  id v7 = (void (**)(id, void *))a4;
  id v6 = [(IMDDatabase *)self _permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:a3 beforeDate:0];
  if (v7) {
    v7[2](v7, v6);
  }
}

- (id)_permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:(id)a3 beforeDate:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = (uint64_t)a3;
  unint64_t v7 = (unint64_t)a4;
  if (IMOSLoggingEnabled())
  {
    sqlite3_int64 v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf[0]) = 134217984;
      *(void *)((char *)buf + 4) = [(id)v6 count];
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Recently Deleted | Will begin permanently deleting recoverable messages for %lu chatGUIDs", (uint8_t *)buf, 0xCu);
    }
  }
  if (!(v6 | v7))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(buf[0]) = 0;
        _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Recently Deleted | Cannot delete recoverable messages in chats without chatGUIDs or beforeDate", (uint8_t *)buf, 2u);
      }
    }
    id v33 = (id)MEMORY[0x1E4F1CBF0];
    goto LABEL_55;
  }
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v37 = objc_msgSend((id)v7, "__im_nanosecondTimeInterval");
  uint64_t v10 = @"INSERT INTO unsynced_removed_recoverable_messages (chat_guid, message_guid, part_index) SELECT c.guid, m.guid, -1 FROM chat_recoverable_message_join AS crmj JOIN chat AS c  ON c.ROWID=crmj.chat_id AND c.guid = ? JOIN message AS m  ON m.ROWID=crmj.message_id AND crmj.delete_date < ? AND crmj.ck_sync_state=1 UNION ALL SELECT c.guid, m.guid, rmp.part_index FROM recoverable_message_part AS rmp JOIN chat AS c  ON c.ROWID=rmp.chat_id JOIN message AS m  ON m.ROWID=rmp.message_id AND rmp.delete_date < ? AND rmp.ck_sync_state=1;";
  if (v7)
  {
    BOOL v11 = @"DELETE FROM message AS m WHERE m.ROWID IN( SELECT crmj.message_id   FROM chat_recoverable_message_join AS crmj   JOIN message AS m   ON crmj.message_id = m.ROWID   JOIN chat AS c ON crmj.chat_id = c.ROWID and c.guid = ?   WHERE crmj.delete_date < ?    AND NOT (m.group_action_type IN (1,3) AND (m.ROWID IN (SELECT message_id FROM message_attachment_join))));";
  }
  else
  {
    uint64_t v10 = @"INSERT INTO unsynced_removed_recoverable_messages (chat_guid, message_guid, part_index) SELECT c.guid, m.guid, -1 FROM chat_recoverable_message_join AS crmj JOIN chat AS c  ON c.ROWID=crmj.chat_id AND c.guid=? JOIN message AS m  ON m.ROWID=crmj.message_id AND crmj.ck_sync_state=1;";
    BOOL v11 = @"DELETE FROM message WHERE NOT (group_action_type IN (1,3) AND (ROWID IN (SELECT message_id FROM message_attachment_join))) AND (ROWID IN (SELECT message_id                FROM chat_recoverable_message_join AS crmj                JOIN chat AS c                ON c.ROWID = crmj.chat_id AND c.guid = ?));";
  }
  theString = v10;
  uint64_t v35 = v11;
  long long v50 = 0u;
  memset(v49, 0, sizeof(v49));
  memset(buf, 0, sizeof(buf));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
  IMDSqlOperationBeginTransaction(buf);
  if (!v6)
  {
    uint64_t v6 = [(IMDDatabase *)self _chatGUIDsForChatsWithRecoverableMessagesOlderThanDate:v7 operation:buf];
  }
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id obj = (id)v6;
  uint64_t v12 = 0;
  uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (!v13) {
    goto LABEL_42;
  }
  uint64_t v34 = *(void *)v40;
  long long v31 = &v46;
  while (2)
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v40 != v34) {
        objc_enumerationMutation(obj);
      }
      uint64_t v15 = *(void *)(*((void *)&v39 + 1) + 8 * i);
      long long v16 = [(IMDDatabase *)self _mostRecentRecoverableMessageDateForChatWithGUID:v15 operation:buf];
      _IMDSqlOperationBeginQuery((uint64_t)buf, theString);
      IMDSqlStatementBindTextFromCFString((uint64_t)v49, v15);
      if (v7) {
        IMDSqlStatementBindInt64((uint64_t)v49, v37);
      }
      if (!IMDSqlOperationFinishQuery((uint64_t)buf))
      {
        id v17 = *((id *)&v50 + 1);
        CFArrayRef v18 = IMLogHandleForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1AFC67A64((uint64_t)v45, (uint64_t)v17);
        }
      }
      _IMDSqlOperationBeginQuery((uint64_t)buf, v35);
      IMDSqlStatementBindTextFromCFString((uint64_t)v49, v15);
      if (v7) {
        IMDSqlStatementBindInt64((uint64_t)v49, v37);
      }
      if (!IMDSqlOperationFinishQuery((uint64_t)buf))
      {
        id v20 = *((id *)&v50 + 1);
        BOOL v21 = IMLogHandleForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1AFC679C8();
        }
        goto LABEL_41;
      }
      v12 += IMDMessageRecordCountChangesUnlocked();
      if (!v7)
      {
        [(IMDDatabase *)self _deleteTransfersInMessagePartsForChatGUID:v15];
        _IMDSqlOperationBeginQuery((uint64_t)buf, @"DELETE FROM recoverable_message_part AS rmp WHERE rmp.chat_id IN( SELECT c.ROWID  FROM chat AS c  WHERE c.guid = ?);");
        IMDSqlStatementBindTextFromCFString((uint64_t)v49, v15);
        if (!IMDSqlOperationFinishQuery((uint64_t)buf))
        {
          id v20 = *((id *)&v50 + 1);
          BOOL v21 = IMLogHandleForCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
            sub_1AFC6792C();
          }
LABEL_41:

          goto LABEL_42;
        }
      }
      BOOL v19 = -[IMDDatabase _deleteChatIfEmptyWithGUID:lastMessageDate:operation:](self, "_deleteChatIfEmptyWithGUID:lastMessageDate:operation:", v15, v16, buf, v31);
      if (v19) {
        [v33 addObject:v19];
      }
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v39 objects:v47 count:16];
    if (v13) {
      continue;
    }
    break;
  }
LABEL_42:

  NSUInteger v22 = [MEMORY[0x1E4F6E890] sharedInstance];
  uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v12];
  if (v7) {
    uint64_t v24 = 4;
  }
  else {
    uint64_t v24 = 1;
  }
  objc_msgSend(v22, "trackDeleteMessages:sourceType:", v23, v24, v31);

  IMDSqlOperationCommitOrRevertTransaction(buf);
  id v38 = 0;
  BOOL v25 = IMDSqlOperationRelease((uint64_t)buf, &v38);
  id v26 = v38;
  if (v25)
  {
    IMDCoreSpotlightScheduleUpdateForDeletedMessages(1005);
  }
  else
  {
    id v27 = IMLogHandleForCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
      sub_1AFC678A4(v26);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = [obj count];
      *(_DWORD *)int v43 = 134217984;
      uint64_t v44 = v29;
      _os_log_impl(&dword_1AFB53000, v28, OS_LOG_TYPE_INFO, "Recently Deleted | Finished permanently deleting recoverable messages for %lu chatGUIDs", v43, 0xCu);
    }
  }
LABEL_55:

  return v33;
}

- (id)_mostRecentRecoverableMessageDateForChatWithGUID:(id)a3 operation:(IMDSqlOperation *)a4
{
  id v5 = a3;
  uint64_t v13 = 0;
  sqlite3_int64 v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = sub_1AFBA31CC;
  v10[3] = &unk_1E5F940E8;
  uint64_t v12 = a4;
  id v6 = v5;
  id v11 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1AFBA31D8;
  v9[3] = &unk_1E5F90178;
  void v9[4] = &v13;
  v9[5] = a4;
  _IMDSqlOperationRunQuery((uint64_t)a4, @"SELECT m.date FROM chat_recoverable_message_join AS crmj JOIN chat AS c ON c.ROWint ID = crmj.chat_id AND c.guid = ? JOIN message AS m ON m.ROWint ID = crmj.message_id ORDER BY m.date DESC LIMIT 1 ", (uint64_t)v10, (uint64_t)v9);
  unint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v14[3]);

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (void)_permanentlyDeleteJunkMessagesBeforeDate:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Junk Messages | Will begin permanently deleting junk messages", buf, 2u);
    }
  }
  NSUInteger v22 = v4;
  if (v4)
  {
    sqlite3_int64 v6 = objc_msgSend(v4, "__im_nanosecondTimeInterval");
    long long v31 = 0u;
    long long v29 = 0u;
    memset(v30, 0, sizeof(v30));
    *(_OWORD *)buf = 0u;
    IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
    IMDSqlOperationBeginTransaction(buf);
    [(IMDDatabase *)self _chatGUIDsForChatsWithJunkMessagesOlderThanDate:v4 operation:buf];
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = 0;
    uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v25 != v9) {
            objc_enumerationMutation(obj);
          }
          uint64_t v11 = *(void *)(*((void *)&v24 + 1) + 8 * i);
          uint64_t v12 = -[IMDDatabase _mostRecentJunkMessageDateForChatWithGUID:operation:](self, "_mostRecentJunkMessageDateForChatWithGUID:operation:", v11, buf, v22);
          _IMDSqlOperationBeginQuery((uint64_t)buf, @"DELETE FROM message AS m WHERE m.ROWID IN( SELECT cmj.message_id   FROM chat_message_join AS cmj   JOIN message AS m   ON cmj.message_id = m.ROWID   JOIN chat AS c ON cmj.chat_id = c.ROWID and c.guid = ?   WHERE m.date < ?);");
          IMDSqlStatementBindTextFromCFString((uint64_t)v30, v11);
          IMDSqlStatementBindInt64((uint64_t)v30, v6);
          if (!IMDSqlOperationFinishQuery((uint64_t)buf))
          {
            id v15 = *((id *)&v31 + 1);
            uint64_t v16 = IMLogHandleForCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
              sub_1AFC67AC0();
            }

            goto LABEL_18;
          }
          uint64_t v13 = IMDMessageRecordCountChangesUnlocked();
          id v14 = [(IMDDatabase *)self _deleteChatIfEmptyWithGUID:v11 lastMessageDate:v12 operation:buf];

          v7 += v13;
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v24 objects:v34 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_18:

    id v17 = [MEMORY[0x1E4F6E890] sharedInstance];
    CFArrayRef v18 = [MEMORY[0x1E4F28ED0] numberWithLongLong:v7];
    [v17 trackDeleteMessages:v18 sourceType:5];

    IMDSqlOperationCommitOrRevertTransaction(buf);
    if (IMOSLoggingEnabled())
    {
      BOOL v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v20 = [obj count];
        *(_DWORD *)long long v32 = 134217984;
        uint64_t v33 = v20;
        _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "Junk Messages | Finished permanently deleting junk messages for %lu chatGUIDs", v32, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    BOOL v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "Junk Messages | Cannot delete junk messages in chats without beforeDate", buf, 2u);
    }
  }
}

- (id)_mostRecentJunkMessageDateForChatWithGUID:(id)a3 operation:(IMDSqlOperation *)a4
{
  id v5 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  uint64_t v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = sub_1AFBA3900;
  v10[3] = &unk_1E5F940E8;
  uint64_t v12 = a4;
  id v6 = v5;
  id v11 = v6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1AFBA390C;
  v9[3] = &unk_1E5F90178;
  void v9[4] = &v13;
  v9[5] = a4;
  _IMDSqlOperationRunQuery((uint64_t)a4, @"SELECT m.date FROM chat_message_join AS cmj JOIN chat AS c ON c.ROWint ID = cmj.chat_id AND c.guid = ? JOIN message AS m ON m.ROWint ID = cmj.message_id ORDER BY m.date DESC LIMIT 1 ", (uint64_t)v10, (uint64_t)v9);
  uint64_t v7 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v14[3]);

  _Block_object_dispose(&v13, 8);
  return v7;
}

- (int64_t)_countMessagesExcludingGroupPhotosInChatWithGUID:(id)a3 isRecoverable:(BOOL)a4 operation:(IMDSqlOperation *)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  uint64_t v8 = @"SELECT COUNT(*) FROM chat_message_join AS cmj JOIN message AS m ON cmj.message_id = m.ROWID JOIN chat AS c ON cmj.chat_id = c.ROWID WHERE c.guid = ? AND NOT (m.group_action_type IN (1,3) AND (m.ROWID IN (SELECT message_id FROM message_attachment_join)))";
  if (v6) {
    uint64_t v8 = @"SELECT COUNT(*) FROM chat_recoverable_message_join AS crmj JOIN message AS m ON crmj.message_id = m.ROWID JOIN chat AS c ON crmj.chat_id = c.ROWID WHERE c.guid = ? AND NOT (m.group_action_type IN (1,3) AND (m.ROWID IN (SELECT message_id FROM message_attachment_join)))";
  }
  uint64_t v9 = v8;
  uint64_t v17 = 0;
  CFArrayRef v18 = &v17;
  uint64_t v19 = 0x2020000000;
  uint64_t v20 = 0;
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  _OWORD v14[2] = sub_1AFBA3C54;
  v14[3] = &unk_1E5F940E8;
  uint64_t v16 = a5;
  id v10 = v7;
  id v15 = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1AFBA3C60;
  v13[3] = &unk_1E5F90178;
  v13[4] = &v17;
  v13[5] = a5;
  _IMDSqlOperationRunQuery((uint64_t)a5, v9, (uint64_t)v14, (uint64_t)v13);
  int64_t v11 = v18[3];

  _Block_object_dispose(&v17, 8);
  return v11;
}

- (id)recoverableMessagesMetadataPendingCloudKitSaveWithLimit:(unint64_t)a3 filter:(unint64_t)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    id v7 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v7;
    _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Recently Deleted | retrieving recoverable messages pending cloudkit update with resultLimit: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v18 = 0x3032000000;
  uint64_t v19 = sub_1AFB9E784;
  uint64_t v20 = sub_1AFB9E794;
  id v21 = 0;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = @"SELECT c.guid, crmj.message_id, m.guid, crmj.delete_date, -1, NULL FROM chat_recoverable_message_join AS crmj JOIN chat AS c  ON c.ROWID = crmj.chat_id JOIN message AS m  ON m.ROWID = crmj.message_id WHERE crmj.ck_sync_state = 0  AND (m.balloon_bundle_id IS NULL OR m.balloon_bundle_id != 'com.apple.messages.chatbot')  UNION ALL SELECT c.guid, rmp.message_id, m.guid, rmp.delete_date, rmp.part_index, rmp.part_text  FROM recoverable_message_part AS rmp  JOIN chat AS c   ON c.ROWID = rmp.chat_id  JOIN message AS m   ON m.ROWID = rmp.message_id  WHERE rmp.ck_sync_state = 0  AND (m.balloon_bundle_id IS NULL OR m.balloon_bundle_id != 'com.apple.messages.chatbot') LIMIT ?;";
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1AFBA4080;
  v13[3] = &unk_1E5F94138;
  p_long long buf = &buf;
  unint64_t v16 = a3;
  if (a4 == 4) {
    uint64_t v8 = @"SELECT c.guid, crmj.message_id, m.guid, crmj.delete_date, -1, NULL FROM chat_recoverable_message_join AS crmj JOIN chat AS c  ON c.ROWID = crmj.chat_id JOIN message AS m  ON m.ROWID = crmj.message_id WHERE crmj.ck_sync_state = 0 AND balloon_bundle_id == 'com.apple.messages.chatbot'   UNION ALL SELECT c.guid, rmp.message_id, m.guid, rmp.delete_date, rmp.part_index, rmp.part_text  FROM recoverable_message_part AS rmp  JOIN chat AS c   ON c.ROWID = rmp.chat_id  JOIN message AS m   ON m.ROWID = rmp.message_id  WHERE rmp.ck_sync_state = 0 AND balloon_bundle_id == 'com.apple.messages.chatbot'  LIMIT ?;";
  }
  id v14 = v8;
  IMDRunSqlOperation((uint64_t)v13);
  uint64_t v9 = IMLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v12 = 0;
    _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Recently Deleted | Finished fetching messages metadata pending update", v12, 2u);
  }

  id v10 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v10;
}

- (id)recoverableMessagesMetadataPendingCloudKitDeleteWithLimit:(unint64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = IMLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    id v5 = [MEMORY[0x1E4F28ED0] numberWithUnsignedInteger:a3];
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v5;
    _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Recently Deleted | retrieving recoverable messages pending cloudkit delete with resultLimit: %@", (uint8_t *)&buf, 0xCu);
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v12 = 0x3032000000;
  uint64_t v13 = sub_1AFB9E784;
  id v14 = sub_1AFB9E794;
  id v15 = 0;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _OWORD v10[2] = sub_1AFBA4B2C;
  v10[3] = &unk_1E5F901A0;
  void v10[4] = &buf;
  v10[5] = a3;
  IMDRunSqlOperation((uint64_t)v10);
  BOOL v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)uint64_t v9 = 0;
    _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Recently Deleted | Finished fetching messages metadata pending delete", v9, 2u);
  }

  id v7 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v7;
}

- (void)updateRecoverableMessageSyncState:(int64_t)a3 forMessageRowID:(int64_t)a4 onPartIndex:(int64_t)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    uint64_t v9 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    id v10 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    int64_t v11 = [MEMORY[0x1E4F28ED0] numberWithInteger:a5];
    LODWORD(buf[0]) = 138412802;
    *(void *)((char *)buf + 4) = v9;
    WORD2(buf[1]) = 2112;
    *(void *)((char *)&buf[1] + 6) = v10;
    HIWORD(buf[2]) = 2112;
    buf[3] = v11;
    _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Recently Deleted | setting recoverable sync state: %@ for message rowID: %@ partIndex: %@", (uint8_t *)buf, 0x20u);
  }
  long long v42 = 0u;
  memset(v41, 0, sizeof(v41));
  memset(buf, 0, sizeof(buf));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
  if (a5 == -1)
  {
    _IMDSqlOperationBeginQuery((uint64_t)buf, @"UPDATE chat_recoverable_message_join AS crmj SET ck_sync_state = ? WHERE crmj.message_id = ?;");
    sqlite3_int64 v12 = a3;
    sqlite3_int64 v13 = a4;
  }
  else
  {
    _IMDSqlOperationBeginQuery((uint64_t)buf, @"UPDATE recoverable_message_part AS rmp SET ck_sync_state = ? WHERE rmp.message_id = ? AND rmp.part_index = ?;");
    IMDSqlStatementBindInt64((uint64_t)v41, a3);
    sqlite3_int64 v12 = a4;
    sqlite3_int64 v13 = a5;
  }
  IMDSqlStatementBindInt64((uint64_t)v41, v12);
  IMDSqlStatementBindInt64((uint64_t)v41, v13);
  if (!IMDSqlOperationFinishQuery((uint64_t)buf))
  {
    id v14 = *((id *)&v42 + 1);
    id v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      uint64_t v23 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
      long long v24 = [v14 localizedDescription];
      long long v25 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
      long long v26 = [MEMORY[0x1E4F28ED0] numberWithInteger:a5];
      *(_DWORD *)long long v32 = 138413058;
      uint64_t v33 = v23;
      __int16 v34 = 2112;
      uint64_t v35 = v24;
      __int16 v36 = 2112;
      uint64_t v37 = v25;
      __int16 v38 = 2112;
      long long v39 = v26;
      _os_log_error_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_ERROR, "Recently Deleted | Failed setting recoverable sync state: %@ with op finish error: %@ for message rowID: %@ partIndex: %@", v32, 0x2Au);
    }
  }
  id v31 = 0;
  BOOL v16 = IMDSqlOperationRelease((uint64_t)buf, &v31);
  id v17 = v31;
  uint64_t v18 = IMLogHandleForCategory();
  uint64_t v19 = v18;
  if (v16)
  {
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
      id v21 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
      uint64_t v22 = [MEMORY[0x1E4F28ED0] numberWithInteger:a5];
      *(_DWORD *)long long v32 = 138412802;
      uint64_t v33 = v20;
      __int16 v34 = 2112;
      uint64_t v35 = v21;
      __int16 v36 = 2112;
      uint64_t v37 = v22;
      _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "Recently Deleted | Successfully set recoverable sync state: %@ for message rowID: %@ partIndex: %@", v32, 0x20u);
    }
  }
  else if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
  {
    long long v27 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    long long v28 = [v17 localizedDescription];
    long long v29 = [MEMORY[0x1E4F28ED0] numberWithInteger:a4];
    long long v30 = [MEMORY[0x1E4F28ED0] numberWithInteger:a5];
    *(_DWORD *)long long v32 = 138413058;
    uint64_t v33 = v27;
    __int16 v34 = 2112;
    uint64_t v35 = v28;
    __int16 v36 = 2112;
    uint64_t v37 = v29;
    __int16 v38 = 2112;
    long long v39 = v30;
    _os_log_error_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_ERROR, "Recently Deleted | Failed setting recoverable sync state: %@ with op release error: %@ for message rowID: %@ partIndex: %@", v32, 0x2Au);
  }
}

- (void)updateRecoverableMessageSyncState:(int64_t)a3 forMessageGUIDs:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = IMLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    uint64_t v8 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    *(_DWORD *)long long buf = 138412546;
    *(void *)&void buf[4] = v8;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Recently Deleted | setting recoverable sync state: %@ for message guids: %@", buf, 0x16u);
  }
  long long v31 = 0u;
  memset(v30, 0, sizeof(v30));
  memset(buf, 0, sizeof(buf));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
  -[IMDDatabase _updateRecoverableMessageSyncStateForMessageGUIDsQueryFor:](self, "_updateRecoverableMessageSyncStateForMessageGUIDsQueryFor:", [v6 count]);
  uint64_t v9 = (__CFString *)objc_claimAutoreleasedReturnValue();
  _IMDSqlOperationBeginQuery((uint64_t)buf, v9);
  IMDSqlStatementBindInt64((uint64_t)v30, a3);
  CFArrayRef v10 = (const __CFArray *)v6;
  IMDSqlStatementBindTextFromArrayOfCFStrings((uint64_t)v30, v10);
  if (!IMDSqlOperationFinishQuery((uint64_t)buf))
  {
    id v11 = *((id *)&v31 + 1);
    sqlite3_int64 v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      uint64_t v18 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
      CFArrayRef v19 = [v11 localizedDescription];
      *(_DWORD *)uint64_t v23 = 138412802;
      long long v24 = v18;
      __int16 v25 = 2112;
      CFArrayRef v26 = v19;
      __int16 v27 = 2112;
      CFArrayRef v28 = v10;
      _os_log_error_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_ERROR, "Recently Deleted | Failed bulk updating recoverable messages sync state: %@ with op finish error: %@ for message guids: %@", v23, 0x20u);
    }
  }
  id v22 = 0;
  BOOL v13 = IMDSqlOperationRelease((uint64_t)buf, &v22);
  id v14 = v22;
  id v15 = IMLogHandleForCategory();
  BOOL v16 = v15;
  if (v13)
  {
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v17 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
      *(_DWORD *)uint64_t v23 = 138412546;
      long long v24 = v17;
      __int16 v25 = 2112;
      CFArrayRef v26 = v10;
      _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, "Recently Deleted | Successfully bulk updated recoverable sync state: %@ for message guids: %@", v23, 0x16u);
    }
  }
  else if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
  {
    uint64_t v20 = [MEMORY[0x1E4F28ED0] numberWithInteger:a3];
    CFArrayRef v21 = [v14 localizedDescription];
    *(_DWORD *)uint64_t v23 = 138412802;
    long long v24 = v20;
    __int16 v25 = 2112;
    CFArrayRef v26 = v21;
    __int16 v27 = 2112;
    CFArrayRef v28 = v10;
    _os_log_error_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_ERROR, "Recently Deleted | Failed bulk updating recoverable sync state: %@ with op release error: %@ for message guids: %@", v23, 0x20u);
  }
}

- (void)storeRecoverableMessagePartWithBody:(id)a3 forMessageWithGUID:(id)a4 deleteDate:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  CFArrayRef v10 = IMLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf[0]) = 138412546;
    *(void *)((char *)buf + 4) = v8;
    WORD2(buf[1]) = 2112;
    *(void *)((char *)&buf[1] + 6) = v9;
    _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Recently Deleted | Will begin storing message part body for message with GUID: %@ at deleteDate: %@", (uint8_t *)buf, 0x16u);
  }

  sqlite3_int64 v11 = objc_msgSend(v9, "__im_nanosecondTimeInterval");
  sqlite3_int64 v12 = [v7 attributesAtIndex:0 effectiveRange:0];
  BOOL v13 = [v12 objectForKey:*MEMORY[0x1E4F6C1F8]];

  if (v13)
  {
    sqlite3_int64 v14 = [v13 integerValue];
    JWEncodeCodableObject();
    CFDataRef v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    if (v15)
    {
      long long v34 = 0u;
      memset(v33, 0, sizeof(v33));
      memset(buf, 0, sizeof(buf));
      IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
      IMDSqlOperationBeginTransaction(buf);
      _IMDSqlOperationBeginQuery((uint64_t)buf, @"INSERT INTO recoverable_message_part (chat_id, message_id, part_index, delete_date, part_text, ck_sync_state)   SELECT cmj.chat_id, cmj.message_id, ?, ?, ?, 0   FROM chat_message_join AS cmj   JOIN message AS m   ON m.ROWint ID = cmj.message_id AND m.guid = ?;");
      IMDSqlStatementBindInt64((uint64_t)v33, v14);
      IMDSqlStatementBindInt64((uint64_t)v33, v11);
      IMDSqlStatementBindBlob((uint64_t)v33, v15);
      IMDSqlStatementBindTextFromCFString((uint64_t)v33, (uint64_t)v8);
      if (!IMDSqlOperationFinishQuery((uint64_t)buf))
      {
        id v16 = *((id *)&v34 + 1);
        id v17 = IMLogHandleForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
        {
          uint64_t v23 = [v16 localizedDescription];
          *(_DWORD *)CFArrayRef v26 = 138412802;
          id v27 = v23;
          __int16 v28 = 2112;
          id v29 = v8;
          __int16 v30 = 2112;
          id v31 = v9;
          _os_log_error_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_ERROR, "Recently Deleted | Failed with error: %@ storing message part body for message with GUID: %@ at deleteDate: %@", v26, 0x20u);
        }
      }
      IMDSqlOperationCommitOrRevertTransaction(buf);
      id v24 = 0;
      BOOL v18 = IMDSqlOperationRelease((uint64_t)buf, &v24);
      id v19 = v24;
      if (v18)
      {
        id v25 = v8;
        uint64_t v20 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v25 count:1];
        IMDCoreSpotlightDeleteMessageGUIDS(v20, 1005);

        IMDCoreSpotlightScheduleUpdateForDeletedMessages(1005);
      }
      else
      {
        CFArrayRef v21 = IMLogHandleForCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
          sub_1AFC67BC4(v19);
        }
      }
      id v22 = IMLogHandleForCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)CFArrayRef v26 = 138412546;
        id v27 = v8;
        __int16 v28 = 2112;
        id v29 = v9;
        _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "Recently Deleted | Finished storing message part body for message with GUID: %@ at deleteDate: %@", v26, 0x16u);
      }
    }
    else
    {
      IMLogHandleForCategory();
      CFDataRef v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();
      if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
        sub_1AFC67B90();
      }
    }
  }
  else
  {
    IMLogHandleForCategory();
    CFDataRef v15 = (const __CFData *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v15, OS_LOG_TYPE_ERROR)) {
      sub_1AFC67B5C();
    }
  }
}

- (void)clearRecoverableMessageTombStones
{
  v2 = IMLogHandleForCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Recently Deleted | Will begin clearing recoverable message tombstones", buf, 2u);
  }

  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  *(_OWORD *)long long buf = 0u;
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
  IMDSqlOperationBeginTransaction(buf);
  _IMDSqlOperationBeginQuery((uint64_t)buf, @"DELETE FROM unsynced_removed_recoverable_messages;");
  if (!IMDSqlOperationFinishQuery((uint64_t)buf))
  {
    id v3 = *((id *)&v21 + 1);
    id v4 = IMLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
      sub_1AFC67D3C(v3);
    }
  }
  IMDSqlOperationCommitOrRevertTransaction(buf);
  id v10 = 0;
  BOOL v5 = IMDSqlOperationRelease((uint64_t)buf, &v10);
  id v6 = v10;
  if (!v5)
  {
    id v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      sub_1AFC67CB8(v6);
    }
  }
  id v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v9 = 0;
    _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Recently Deleted | Finished clearing recoverable message tombstones", v9, 2u);
  }
}

- (id)_updateRecoverableMessageSyncStateForMessageGUIDsQueryFor:(int64_t)a3
{
  id v3 = NSString;
  id v4 = [NSString substitutionStringForCount:a3];
  BOOL v5 = [v3 stringWithFormat:@"%@ (%@)", @"SELECT rowid FROM message WHERE guid IN", v4];

  id v6 = [NSString stringWithFormat:@"%@ (%@)", @"UPDATE chat_recoverable_message_join AS crmj SET ck_sync_state = ? WHERE crmj.message_id IN", v5];

  return v6;
}

+ (IMDRemoteDatabaseProtocol)database
{
  if ([a1 isServerProcess]) {
    [a1 _databaseServer];
  }
  else {
  id v3 = [a1 _databaseClient];
  }
  return (IMDRemoteDatabaseProtocol *)v3;
}

- (void)sendLegacyXPCCommandWithObject:(id)a3 reply:(id)a4
{
  id v5 = a4;
  id v6 = [a3 object];
  xpc_object_t empty = xpc_dictionary_create_empty();
  BOOL v8 = v5 != 0;
  int64_t int64 = xpc_dictionary_get_int64(v6, "__xpc__event_code__");
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFBB9064;
  v12[3] = &unk_1E5F8FD28;
  id v13 = empty;
  id v14 = v5;
  id v10 = v5;
  id v11 = empty;
  __IMDPersistenceIPCServer_command_dispatcher(int64, 0, v6, v8, (uint64_t)v11, (uint64_t)v12);
}

- (void)coreSpotlightDeleteAttachmentGUIDs:(id)a3 reason:(int64_t)a4
{
}

- (void)deleteAttachmentsDirectWithPredicate:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = (char *)a3;
  if (v3)
  {
    id v4 = [IMDPredicateToSQLConverter alloc];
    id v5 = +[IMDAttachmentRecord keyPathsToColumns];
    id v6 = [(IMDPredicateToSQLConverter *)v4 initWithPredicate:v3 keyPathsToColumns:v5];

    if (!v6)
    {
      if (IMOSLoggingEnabled())
      {
        id v7 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          long long v16 = "-[IMDDatabase(Attachments) deleteAttachmentsDirectWithPredicate:]";
          __int16 v17 = 2112;
          long long v18 = v3;
          _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", buf, 0x16u);
        }
      }
      goto LABEL_13;
    }
  }
  else
  {
    id v6 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v16 = v3;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Deleting attachments filtered by predicate %@", buf, 0xCu);
    }
  }
  id v9 = [(IMDPredicateToSQLConverter *)v6 expression];
  id v10 = (void *)IMDAttachmentRecordDeleteUsingPredicateQuery((uint64_t)v9);

  id v11 = v10;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1AFBEB968;
  v13[3] = &unk_1E5F940C0;
  id v14 = v6;
  long long v12 = v6;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v11, (uint64_t)v13);

LABEL_13:
}

- (id)_updateAttachmentsSyncStateQueryFor:(int64_t)a3
{
  id v3 = NSString;
  id v4 = [NSString substitutionStringForCount:a3];
  id v5 = [v3 stringWithFormat:@"%@( %@)", @"UPDATE attachment SET ck_sync_state = ? WHERE guid IN ", v4];

  return v5;
}

- (void)updateAttachmentsSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v18 = 0u;
  memset(v17, 0, sizeof(v17));
  memset(v16, 0, sizeof(v16));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v16);
  IMDSqlOperationBeginTransaction(v16);
  _IMDSqlOperationBeginQuery((uint64_t)v16, (CFStringRef)-[IMDDatabase _updateAttachmentsSyncStateQueryFor:](self, "_updateAttachmentsSyncStateQueryFor:", [v6 count]));
  IMDSqlStatementBindInt64((uint64_t)v17, a3);
  CFArrayRef v7 = (const __CFArray *)v6;
  IMDSqlStatementBindTextFromArrayOfCFStrings((uint64_t)v17, v7);
  if (IMDSqlOperationFinishQuery((uint64_t)v16))
  {
    BOOL v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFArrayRef v20 = v7;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "CloudSync.message | updated ck_sync_state for recordIDs: %@", buf, 0xCu);
    }
  }
  else
  {
    BOOL v8 = *((id *)&v18 + 1);
    id v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6CA1C((uint64_t)v7, v8, v9);
    }
  }
  IMDSqlOperationCommitOrRevertTransaction(v16);
  id v15 = 0;
  BOOL v10 = IMDSqlOperationRelease((uint64_t)v16, &v15);
  id v11 = v15;
  long long v12 = IMLogHandleForCategory();
  BOOL v13 = os_log_type_enabled(v12, OS_LOG_TYPE_ERROR);
  if (v10)
  {
    if (v13) {
      sub_1AFC6C90C((uint64_t)v7, v12);
    }
  }
  else if (v13)
  {
    sub_1AFC6C984(v11, v12);
  }

  id v14 = IMLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    CFArrayRef v20 = v7;
    _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "CloudSync.message | Finished updating ck_sync_state for recordIDs %@", buf, 0xCu);
  }
}

- (void)fetchAttachmentRecordsFilteredUsingPredicate:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = (void (**)(id, void))a5;
  if (v8)
  {
    BOOL v10 = [IMDPredicateToSQLConverter alloc];
    id v11 = +[IMDAttachmentRecord keyPathsToColumns];
    long long v12 = [(IMDPredicateToSQLConverter *)v10 initWithPredicate:v8 keyPathsToColumns:v11];

    if (!v12)
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v13 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          *(void *)&uint8_t buf[4] = "-[IMDDatabase(Attachments) fetchAttachmentRecordsFilteredUsingPredicate:limit:completionHandler:]";
          *(_WORD *)&buf[12] = 2112;
          *(void *)&buf[14] = v8;
          _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", buf, 0x16u);
        }
      }
      v9[2](v9, MEMORY[0x1E4F1CBF0]);
      goto LABEL_18;
    }
  }
  else
  {
    long long v12 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = @"YES";
      if (!v8) {
        id v15 = @"NO";
      }
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v15;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = a4;
      _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "Fetching attachments filtered by predicate: %@ limit: %llu", buf, 0x16u);
    }
  }
  long long v16 = [(IMDPredicateToSQLConverter *)v12 expression];
  __int16 v17 = (void *)IMDAttachmentRecordCopyFilteredUsingPredicateWithLimitQuery((uint64_t)v16);

  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x3032000000;
  id v24 = sub_1AFBEC094;
  id v25 = sub_1AFBEC0A4;
  id v26 = 0;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1AFBEC0AC;
  v19[3] = &unk_1E5F8E480;
  long long v18 = v12;
  uint64_t v21 = self;
  id v22 = buf;
  CFArrayRef v20 = v18;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v17, (uint64_t)v19);
  if (v9) {
    v9[2](v9, *(void *)(*(void *)&buf[8] + 40));
  }

  _Block_object_dispose(buf, 8);
LABEL_18:
}

- (void)fetchAttachmentRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v31 = a4;
  uint64_t v33 = (void (**)(id, void))a6;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000;
  int v46 = sub_1AFBEC094;
  uint64_t v47 = sub_1AFBEC0A4;
  id v48 = 0;
  __int16 v30 = v8;
  if (v8)
  {
    id v9 = [IMDPredicateToSQLConverter alloc];
    BOOL v10 = +[IMDAttachmentRecord keyPathsToColumns];
    uint64_t v32 = [(IMDPredicateToSQLConverter *)v9 initWithPredicate:v8 keyPathsToColumns:v10];

    if (!v32)
    {
      if (IMOSLoggingEnabled())
      {
        id v11 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          long long v50 = "-[IMDDatabase(Attachments) fetchAttachmentRecordsFilteredUsingPredicate:sortedUsingDescriptors:limit:com"
                "pletionHandler:]";
          __int16 v51 = 2112;
          uint64_t v52 = (uint64_t)v8;
          _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", buf, 0x16u);
        }
      }
      if (v33) {
        v33[2](v33, MEMORY[0x1E4F1CBF0]);
      }
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v32 = 0;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v13 = v31;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v55 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v13);
        }
        __int16 v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        long long v18 = [IMDSortDescriptorToSQLConverter alloc];
        uint64_t v19 = +[IMDAttachmentRecord keyPathsToColumns];
        CFArrayRef v20 = [(IMDSortDescriptorToSQLConverter *)v18 initWithSortDescriptor:v17 keyPathsToColumns:v19];

        if (!v20)
        {
          if (IMOSLoggingEnabled())
          {
            id v26 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 136315394;
              long long v50 = "-[IMDDatabase(Attachments) fetchAttachmentRecordsFilteredUsingPredicate:sortedUsingDescriptors:limit"
                    ":completionHandler:]";
              __int16 v51 = 2112;
              uint64_t v52 = (uint64_t)v17;
              _os_log_impl(&dword_1AFB53000, v26, OS_LOG_TYPE_INFO, "Bad sort descriptor provided to %s (%@)", buf, 0x16u);
            }
          }
          if (v33) {
            ((void (*)(void))v33[2])();
          }
          goto LABEL_33;
        }
        uint64_t v21 = [(IMDSortDescriptorToSQLConverter *)v20 expression];
        [v12 addObject:v21];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v55 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    id v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = [v13 count];
      id v24 = @"YES";
      *(_DWORD *)long long buf = 138412802;
      if (!v30) {
        id v24 = @"NO";
      }
      long long v50 = (const char *)v24;
      __int16 v51 = 2048;
      uint64_t v52 = v23;
      __int16 v53 = 2048;
      unint64_t v54 = a5;
      _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "Fetching attachments filtered by predicate: %@ sortDescriptors: %llu limit: %llu", buf, 0x20u);
    }
  }
  id v25 = [(IMDPredicateToSQLConverter *)v32 expression];
  id v13 = (id)IMDAttachmentRecordCopySortedAttachmentsFilteredUsingPredicateWithLimitQuery(v25, v12);

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1AFBEC6BC;
  v34[3] = &unk_1E5F8E4A8;
  uint64_t v37 = &v43;
  unint64_t v38 = a5;
  uint64_t v35 = v32;
  uint64_t v36 = v28;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v13, (uint64_t)v34);
  if (v33) {
    v33[2](v33, v44[5]);
  }

LABEL_33:
LABEL_34:
  _Block_object_dispose(&v43, 8);
}

- (id)_copyAttachmentRecordsFromCoreSDBResults:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
    if ([v3 count])
    {
      unint64_t v5 = 0;
      uint64_t v6 = *MEMORY[0x1E4F1CF80];
      do
      {
        [v3 objectAtIndex:v5];
        int ID = CSDBRecordGetID();
        id v8 = IMDAttachmentRecordCreateFromRecordID(v6, ID);
        if (v8)
        {
          id v9 = v8;
          [v4 addObject:v8];
          CFRelease(v9);
        }
        ++v5;
      }
      while (v5 < [v3 count]);
    }
    BOOL v10 = (void *)[v4 copy];
  }
  else
  {
    BOOL v10 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v10;
}

- (void)postSharePlayNotificationForChatGUID:(id)a3 faceTimeConversationUUID:(id)a4 handleIdentifier:(id)a5 localizedApplicationName:(id)a6
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = 138413058;
      id v16 = v9;
      __int16 v17 = 2112;
      id v18 = v10;
      __int16 v19 = 2112;
      id v20 = v11;
      __int16 v21 = 2112;
      id v22 = v12;
      _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Asked to post Started SharePlay from Messages notification for chat GUID %@, FaceTime conversation UUID %@, handleIdentifier %@, and localizedApplicationName %@", (uint8_t *)&v15, 0x2Au);
    }
  }
  uint64_t v14 = +[IMDNotificationsController sharedInstance];
  [v14 postSharePlayNotificationForChatGUID:v9 faceTimeConversationUUID:v10 handleIdentifier:v11 localizedApplicationName:v12];
}

- (id)chatRecordsFilteredByPredicate:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_1AFC07868;
  id v24 = sub_1AFC07878;
  id v25 = 0;
  if (v4)
  {
    unint64_t v5 = [IMDPredicateToSQLConverter alloc];
    uint64_t v6 = +[IMDChatRecord keyPathsToColumns];
    CFArrayRef v7 = [(IMDPredicateToSQLConverter *)v5 initWithPredicate:v4 keyPathsToColumns:v6];

    if (v7)
    {
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          uint64_t v27 = (const char *)@"YES";
          _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Fetching chats filtered by predicate: %@", buf, 0xCu);
        }
      }
      id v9 = [(IMDPredicateToSQLConverter *)v7 expression];
      id v10 = (void *)IMDChatRecordCopyChatsFilteredUsingPredicateQuery((uint64_t)v9);

      v16[0] = MEMORY[0x1E4F143A8];
      v16[1] = 3221225472;
      _OWORD v16[2] = sub_1AFC07880;
      v16[3] = &unk_1E5F8E480;
      id v18 = self;
      __int16 v19 = &v20;
      __int16 v17 = v7;
      _IMDPerformLockedStatementBlockWithQuery((uint64_t)v10, (uint64_t)v16);
      id v11 = (void *)v21[5];
      if (!v11) {
        id v11 = (void *)MEMORY[0x1E4F1CBF0];
      }
      id v12 = v11;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          uint64_t v27 = "-[IMDDatabase(Chats) chatRecordsFilteredByPredicate:]";
          __int16 v28 = 2112;
          id v29 = v4;
          _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", buf, 0x16u);
        }
      }
      id v12 = 0;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v27 = "-[IMDDatabase(Chats) chatRecordsFilteredByPredicate:]";
        _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "No predicate provided to %s", buf, 0xCu);
      }
    }
    id v12 = 0;
  }
  _Block_object_dispose(&v20, 8);

  return v12;
}

- (void)fetchChatRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v31 = a4;
  uint64_t v33 = (void (**)(id, void))a6;
  uint64_t v43 = 0;
  uint64_t v44 = &v43;
  uint64_t v45 = 0x3032000000;
  int v46 = sub_1AFC07868;
  uint64_t v47 = sub_1AFC07878;
  id v48 = 0;
  uint64_t v30 = v8;
  if (v8)
  {
    id v9 = [IMDPredicateToSQLConverter alloc];
    id v10 = +[IMDChatRecord keyPathsToColumns];
    uint64_t v32 = [(IMDPredicateToSQLConverter *)v9 initWithPredicate:v8 keyPathsToColumns:v10];

    if (!v32)
    {
      if (IMOSLoggingEnabled())
      {
        id v11 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136315394;
          long long v50 = "-[IMDDatabase(Chats) fetchChatRecordsFilteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:]";
          __int16 v51 = 2112;
          uint64_t v52 = (uint64_t)v8;
          _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "Bad predicate provided to %s (%@)", buf, 0x16u);
        }
      }
      if (v33) {
        v33[2](v33, MEMORY[0x1E4F1CBF0]);
      }
      goto LABEL_34;
    }
  }
  else
  {
    uint64_t v32 = 0;
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v13 = v31;
  uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v55 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v40;
    while (2)
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v40 != v15) {
          objc_enumerationMutation(v13);
        }
        __int16 v17 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        id v18 = [IMDSortDescriptorToSQLConverter alloc];
        __int16 v19 = +[IMDChatRecord keyPathsToColumns];
        uint64_t v20 = [(IMDSortDescriptorToSQLConverter *)v18 initWithSortDescriptor:v17 keyPathsToColumns:v19];

        if (!v20)
        {
          if (IMOSLoggingEnabled())
          {
            id v26 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 136315394;
              long long v50 = "-[IMDDatabase(Chats) fetchChatRecordsFilteredUsingPredicate:sortedUsingDescriptors:limit:completionHandler:]";
              __int16 v51 = 2112;
              uint64_t v52 = (uint64_t)v17;
              _os_log_impl(&dword_1AFB53000, v26, OS_LOG_TYPE_INFO, "Bad sort descriptor provided to %s (%@)", buf, 0x16u);
            }
          }
          if (v33) {
            ((void (*)(void))v33[2])();
          }
          goto LABEL_33;
        }
        __int16 v21 = [(IMDSortDescriptorToSQLConverter *)v20 expression];
        [v12 addObject:v21];
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v39 objects:v55 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = [v13 count];
      id v24 = @"YES";
      *(_DWORD *)long long buf = 138412802;
      if (!v30) {
        id v24 = @"NO";
      }
      long long v50 = (const char *)v24;
      __int16 v51 = 2048;
      uint64_t v52 = v23;
      __int16 v53 = 2048;
      unint64_t v54 = a5;
      _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "Fetching chats filtered by predicate: %@ sortDescriptors: %llu limit: %llu", buf, 0x20u);
    }
  }
  id v25 = [(IMDPredicateToSQLConverter *)v32 expression];
  id v13 = (id)IMDChatRecordCopySortedChatsFilteredUsingPredicateWithLimitQuery((uint64_t)v25, v12);

  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1AFC07E8C;
  v34[3] = &unk_1E5F8E4A8;
  uint64_t v37 = &v43;
  unint64_t v38 = a5;
  uint64_t v35 = v32;
  uint64_t v36 = v28;
  _IMDPerformLockedStatementBlockWithQuery((uint64_t)v13, (uint64_t)v34);
  if (v33) {
    v33[2](v33, v44[5]);
  }

LABEL_33:
LABEL_34:
  _Block_object_dispose(&v43, 8);
}

- (void)fetchChatRecordsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
}

- (id)chatRecordsWithIdentifier:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1AFC07868;
  __int16 v17 = sub_1AFC07878;
  id v18 = 0;
  if ([v4 length])
  {
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1AFC08154;
    v9[3] = &unk_1E5F8E480;
    id v11 = self;
    id v12 = &v13;
    id v10 = v4;
    _IMDPerformLockedStatementBlockWithQuery(@"SELECT ROWID, guid, style, state, account_id, properties, chat_identifier, service_name, room_name, account_login, is_archived, last_addressed_handle, display_name, group_id, is_filtered, successful_query, engram_id, server_change_token, ck_sync_state, original_group_id, last_read_message_timestamp, cloudkit_record_id, last_addressed_sim_id, is_blackholed, syndication_date, syndication_type, is_recovered, is_deleting_incoming_messages FROM chat WHERE    chat_identifier = ? ORDER BY chat.ROWID ASC;",
      (uint64_t)v9);
    unint64_t v5 = (void *)v14[5];
    if (!v5) {
      unint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
    }
    id v6 = v5;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CFArrayRef v7 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        uint64_t v20 = "-[IMDDatabase(Chats) chatRecordsWithIdentifier:]";
        _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "No identifier provided to %s", buf, 0xCu);
      }
    }
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }
  _Block_object_dispose(&v13, 8);

  return v6;
}

- (void)fetchChatRecordsWithPinningIdentifier:(id)a3 completionHandler:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = (__CFString *)a3;
  CFArrayRef v7 = (void (**)(id, void *))a4;
  if ([(__CFString *)v6 length])
  {
    id v8 = [(IMDDatabase *)self chatRecordsWithIdentifier:v6];
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134218242;
        uint64_t v38 = [v8 count];
        __int16 v39 = 2112;
        long long v40 = (const char *)v6;
        _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Found %llu pinned chats using chatIdentifier %@", buf, 0x16u);
      }
    }
    if ([v8 count])
    {
      id v10 = v8;
    }
    else
    {
      id v12 = (void *)IMDChatRecordCopyChatsWithGroupID(v6);

      if (IMOSLoggingEnabled())
      {
        uint64_t v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = [v12 count];
          *(_DWORD *)long long buf = 134218242;
          uint64_t v38 = v14;
          __int16 v39 = 2112;
          long long v40 = (const char *)v6;
          _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Found %llu pinned chats using groupID %@", buf, 0x16u);
        }
      }
      id v10 = v12;
    }
    id v31 = v10;
    if ([v10 count])
    {
      uint64_t v15 = v31;
    }
    else
    {
      id v30 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      id v16 = objc_alloc_init(IMDChatRecordBatchFetcher);
      __int16 v17 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", *MEMORY[0x1E4F6CE40], *MEMORY[0x1E4F6E1A0]];
      [(IMDRecordBatchFetcher *)v16 setPredicate:v17];

      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      id v18 = v16;
      uint64_t v19 = [(IMDRecordBatchFetcher *)v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v33;
        uint64_t v21 = &selRef__setMessageID_;
        while (2)
        {
          uint64_t v22 = 0;
          uint64_t v23 = v21[188];
          do
          {
            if (*(void *)v33 != v20) {
              objc_enumerationMutation(v18);
            }
            id v24 = *(void **)(*((void *)&v32 + 1) + 8 * v22);
            id v25 = [v24 handleRecords];
            id v26 = [v25 arrayByApplyingSelector:v23];

            uint64_t v27 = IMSHA1HashFromStrings();
            if ([(__CFString *)v6 isEqualToString:v27])
            {
              [v30 addObject:v24];

              goto LABEL_31;
            }

            ++v22;
          }
          while (v19 != v22);
          uint64_t v19 = [(IMDRecordBatchFetcher *)v18 countByEnumeratingWithState:&v32 objects:v36 count:16];
          uint64_t v21 = &selRef__setMessageID_;
          if (v19) {
            continue;
          }
          break;
        }
      }
LABEL_31:

      uint64_t v15 = (void *)[v30 copy];
      if (IMOSLoggingEnabled())
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          uint64_t v29 = [v15 count];
          *(_DWORD *)long long buf = 134218242;
          uint64_t v38 = v29;
          __int16 v39 = 2112;
          long long v40 = (const char *)v6;
          _os_log_impl(&dword_1AFB53000, v28, OS_LOG_TYPE_INFO, "Found %llu pinned chats using participantHash %@", buf, 0x16u);
        }
      }
    }
    if (v7) {
      v7[2](v7, v15);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v38 = (uint64_t)v6;
        __int16 v39 = 2080;
        long long v40 = "-[IMDDatabase(Chats) fetchChatRecordsWithPinningIdentifier:completionHandler:]";
        _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "No pinning identifier (%@) provided to %s", buf, 0x16u);
      }
    }
    if (v7) {
      v7[2](v7, (void *)MEMORY[0x1E4F1CBF0]);
    }
  }
}

- (void)_fetchChatRecordsWithHandles:(id)a3 allowSubsetMatching:(BOOL)a4 serviceName:(id)a5 displayName:(id)a6 groupID:(id)a7 style:(unsigned __int8)a8 useOriginalGroupID:(BOOL)a9 completionHandler:(id)a10
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  uint64_t v20 = (void (**)(id, void))a10;
  uint64_t v44 = 0;
  uint64_t v45 = &v44;
  uint64_t v46 = 0x3032000000;
  uint64_t v47 = sub_1AFC07868;
  id v48 = sub_1AFC07878;
  id v49 = 0;
  if ([v16 count] && objc_msgSend(v17, "length"))
  {
    id v30 = self;
    unsigned __int8 v31 = a8;
    uint64_t v21 = [v18 length];
    uint64_t v22 = v18;
    BOOL v23 = v21 != 0;
    id v24 = v19;
    if ([v19 length]) {
      BOOL v25 = !a9;
    }
    else {
      BOOL v25 = 0;
    }
    uint64_t v26 = [v16 count];
    uint64_t v27 = IMDChatRecordCopyChatsWithHandlesOnServiceWithDisplayNameGroupIDStyleQuery(v26, a4, v21 != 0, v25, 0);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1AFC08A48;
    v32[3] = &unk_1E5F99680;
    id v33 = v16;
    id v34 = v17;
    BOOL v40 = v23;
    id v35 = v22;
    BOOL v41 = v25;
    unsigned __int8 v42 = v31;
    BOOL v43 = a4;
    uint64_t v38 = &v44;
    uint64_t v39 = v26;
    id v36 = v24;
    uint64_t v37 = v30;
    _IMDPerformLockedStatementBlockWithQuery((uint64_t)v27, (uint64_t)v32);
    if (v20) {
      v20[2](v20, v45[5]);
    }

    id v18 = v22;
    id v19 = v24;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v28 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        uint64_t v29 = [v16 count];
        *(_DWORD *)long long buf = 134218498;
        uint64_t v51 = v29;
        __int16 v52 = 2112;
        id v53 = v17;
        __int16 v54 = 2080;
        long long v55 = "-[IMDDatabase(Chats) _fetchChatRecordsWithHandles:allowSubsetMatching:serviceName:displayName:groupID:styl"
              "e:useOriginalGroupID:completionHandler:]";
        _os_log_impl(&dword_1AFB53000, v28, OS_LOG_TYPE_INFO, "No handles (%llu) or service (%@) provided to %s", buf, 0x20u);
      }
    }
    if (v20) {
      v20[2](v20, MEMORY[0x1E4F1CBF0]);
    }
  }
  _Block_object_dispose(&v44, 8);
}

- (id)chatRecordsWithHandles:(id)a3 serviceName:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7
{
  return [(IMDDatabase *)self chatRecordsWithHandles:a3 serviceName:a4 displayName:a5 groupID:a6 style:a7 useOriginalGroupID:0];
}

- (id)chatRecordsWithHandles:(id)a3 serviceName:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7 useOriginalGroupID:(BOOL)a8
{
  uint64_t v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v22 = 0;
  BOOL v23 = &v22;
  uint64_t v24 = 0x3032000000;
  BOOL v25 = sub_1AFC07868;
  uint64_t v26 = sub_1AFC07878;
  id v27 = 0;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1AFC08CBC;
  v21[3] = &unk_1E5F8E3B8;
  v21[4] = &v22;
  LOBYTE(v20) = a8;
  [(IMDDatabase *)self _fetchChatRecordsWithHandles:v14 allowSubsetMatching:0 serviceName:v15 displayName:v16 groupID:v17 style:v9 useOriginalGroupID:v20 completionHandler:v21];
  id v18 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v18;
}

- (void)fetchChatRecordsWithAtLeastHandles:(id)a3 serviceName:(id)a4 style:(unsigned __int8)a5 completionHandler:(id)a6
{
  LOBYTE(v6) = 0;
  [(IMDDatabase *)self _fetchChatRecordsWithHandles:a3 allowSubsetMatching:1 serviceName:a4 displayName:0 groupID:0 style:a5 useOriginalGroupID:v6 completionHandler:a6];
}

- (void)fetchGroupPhotoPathsForChatsWithGroupIDs:(id)a3 completionHandler:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  uint64_t v22 = (void (**)(id, void *))a4;
  uint64_t v21 = v5;
  if ([v5 count])
  {
    BOOL v23 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(v5, "count", v5));
    long long v27 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v5;
    uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v6)
    {
      uint64_t v25 = *MEMORY[0x1E4F6CD48];
      uint64_t v26 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v28 != v26) {
            objc_enumerationMutation(obj);
          }
          CFStringRef v8 = *(const __CFString **)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v9 = (void *)IMDChatRecordCopyChatsWithGroupID(v8);
          id v10 = [v9 lastObject];
          id v11 = [v10 properties];
          id v12 = [v11 objectForKeyedSubscript:v25];

          if (IMOSLoggingEnabled())
          {
            uint64_t v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412546;
              long long v32 = (const char *)v12;
              __int16 v33 = 2112;
              CFStringRef v34 = v8;
              _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Found groupPhotoGUID %@ for chat with groupID %@", buf, 0x16u);
            }
          }
          if ([(__CFString *)v12 length])
          {
            id v14 = (__CFString *)IMDAttachmentRecordCopyAttachmentForGUID(v12);
            id v15 = [(__CFString *)v14 path];
            int v16 = [(__CFString *)v14 transferState];
            if ([(__CFString *)v15 length])
            {
              id v17 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v15];
              id v18 = (void *)[objc_alloc(MEMORY[0x1E4F6E948]) initWithFileURL:v17];
              [v23 setObject:v18 forKeyedSubscript:v8];
            }
            else if (IMOSLoggingEnabled())
            {
              id v19 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412802;
                long long v32 = (const char *)v12;
                __int16 v33 = 2112;
                CFStringRef v34 = v15;
                __int16 v35 = 1024;
                int v36 = v16;
                _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "Transfer invalid for groupPhotoGUID: %@ filename: %@ state: %d", buf, 0x1Cu);
              }
            }
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v6);
    }

    if (v22) {
      v22[2](v22, v23);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315138;
        long long v32 = "-[IMDDatabase(Chats) fetchGroupPhotoPathsForChatsWithGroupIDs:completionHandler:]";
        _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "No group IDs provided to %s", buf, 0xCu);
      }
    }
    if (v22) {
      v22[2](v22, 0);
    }
  }
}

- (void)resolveInconsistentGUIDForChatRecordWithGUID:(id)a3 newGUID:(id)a4 completionHandler:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  CFArrayRef v7 = (__CFString *)a3;
  id v8 = a4;
  uint64_t v9 = (void (**)(id, BOOL))a5;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      int v16 = v7;
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Updating chat GUID from %@ to %@ to resolve inconsistent properties", (uint8_t *)&v15, 0x16u);
    }
  }
  if (-[__CFString length](v7, "length") && [v8 length])
  {
    CFStringRef v11 = IMDChatRecordCopyChatForGUID(v7);
    id v12 = (__CFString *)v11;
    if (v11)
    {
      _IMDChatRecordSetGUID((uint64_t)v11, (uint64_t)v8);
    }
    else if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        int v16 = v7;
        _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "Failed to find a chat with GUID %@", (uint8_t *)&v15, 0xCu);
      }
    }
    if (v9) {
      v9[2](v9, v12 != 0);
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412546;
        int v16 = v7;
        __int16 v17 = 2112;
        id v18 = v8;
        _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Current GUID %@ or new GUID %@ has zero length", (uint8_t *)&v15, 0x16u);
      }
    }
    if (v9) {
      v9[2](v9, 0);
    }
  }
}

- (void)moveMessageRecordsToRecoveryForChatRecordsWithGUIDs:(id)a3 deleteDate:(id)a4
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v43 = a4;
  uint64_t v6 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  unsigned __int8 v42 = [v6 allObjects];

  if (IMOSLoggingEnabled())
  {
    CFArrayRef v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v43;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = [v42 count];
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Recently Deleted | Will begin moving messages to recoverable message table with deleteDate: %@ for %lu chatGUIDs", buf, 0x16u);
    }
  }
  uint64_t v40 = objc_msgSend(v43, "__im_nanosecondTimeInterval");
  long long v73 = 0u;
  memset(v72, 0, sizeof(v72));
  memset(buf, 0, sizeof(buf));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)buf);
  IMDSqlOperationBeginTransaction(buf);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v5 count])
  {
    IMDChatRecordRowIDsWithChatGUIDsQuery(v5);
    CFStringRef theString = (const __CFString *)objc_claimAutoreleasedReturnValue();
    uint64_t v9 = (__CFString *)theString;
    if (theString)
    {
      _IMDSqlOperationBeginQuery((uint64_t)buf, theString);
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v10 = v5;
      uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v70 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v59;
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v59 != v12) {
              objc_enumerationMutation(v10);
            }
            IMDSqlStatementBindTextFromCFString((uint64_t)v72, *(void *)(*((void *)&v58 + 1) + 8 * i));
          }
          uint64_t v11 = [v10 countByEnumeratingWithState:&v58 objects:v70 count:16];
        }
        while (v11);
      }

      if (IMDSqlOperationHasRows((uint64_t)buf))
      {
        uint64_t v14 = MEMORY[0x1E4F143A8];
        do
        {
          *(void *)&long long v65 = 0;
          *((void *)&v65 + 1) = &v65;
          uint64_t v66 = 0x3032000000;
          NSRange v67 = sub_1AFC07868;
          uint64_t v68 = sub_1AFC07878;
          id v69 = 0;
          v57[0] = v14;
          v57[1] = 3221225472;
          v57[2] = sub_1AFC09B38;
          v57[3] = &unk_1E5F90980;
          v57[4] = &v65;
          IMDSqlOperationIterateRow((uint64_t)buf, (uint64_t)v57);
          if (*(void *)(*((void *)&v65 + 1) + 40)) {
            objc_msgSend(v8, "addObject:");
          }
          _Block_object_dispose(&v65, 8);
        }
        while (IMDSqlOperationHasRows((uint64_t)buf));
      }
      if (!IMDSqlOperationFinishQuery((uint64_t)buf))
      {
        id v15 = *((id *)&v73 + 1);
        int v16 = IMLogHandleForCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
          sub_1AFC6F22C(v15);
        }
      }
      IMDInsertMessagesFromChatsWihGUIDsIntoRecoverableMessageJoinQuery(v8);
      __int16 v17 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v17)
      {
        _IMDSqlOperationBeginQuery((uint64_t)buf, v17);
        IMDSqlStatementBindInt64((uint64_t)v72, v40);
        long long v55 = 0u;
        long long v56 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        id v18 = v8;
        uint64_t v19 = [v18 countByEnumeratingWithState:&v53 objects:v64 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v54;
          do
          {
            for (uint64_t j = 0; j != v19; ++j)
            {
              if (*(void *)v54 != v20) {
                objc_enumerationMutation(v18);
              }
              IMDSqlStatementBindInt64((uint64_t)v72, [*(id *)(*((void *)&v53 + 1) + 8 * j) longLongValue]);
            }
            uint64_t v19 = [v18 countByEnumeratingWithState:&v53 objects:v64 count:16];
          }
          while (v19);
        }

        if (!IMDSqlOperationFinishQuery((uint64_t)buf))
        {
          id v22 = *((id *)&v73 + 1);
          BOOL v23 = IMLogHandleForCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
            sub_1AFC6F1A4(v22);
          }
        }
        IMDDeleteFromChatMessageJoinWhereMessageInRecoveryForChatsWithGUIDsQuery(v18);
        uint64_t v24 = (__CFString *)objc_claimAutoreleasedReturnValue();
        if (v24)
        {
          _IMDSqlOperationBeginQuery((uint64_t)buf, v24);
          long long v51 = 0u;
          long long v52 = 0u;
          long long v49 = 0u;
          long long v50 = 0u;
          id v25 = v18;
          uint64_t v26 = [v25 countByEnumeratingWithState:&v49 objects:v63 count:16];
          if (v26)
          {
            uint64_t v27 = *(void *)v50;
            do
            {
              for (uint64_t k = 0; k != v26; ++k)
              {
                if (*(void *)v50 != v27) {
                  objc_enumerationMutation(v25);
                }
                IMDSqlStatementBindInt64((uint64_t)v72, [*(id *)(*((void *)&v49 + 1) + 8 * k) longLongValue]);
              }
              uint64_t v26 = [v25 countByEnumeratingWithState:&v49 objects:v63 count:16];
            }
            while (v26);
          }

          long long v47 = 0u;
          long long v48 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          id v29 = v25;
          uint64_t v30 = [v29 countByEnumeratingWithState:&v45 objects:v62 count:16];
          if (v30)
          {
            uint64_t v31 = *(void *)v46;
            do
            {
              for (uint64_t m = 0; m != v30; ++m)
              {
                if (*(void *)v46 != v31) {
                  objc_enumerationMutation(v29);
                }
                IMDSqlStatementBindInt64((uint64_t)v72, [*(id *)(*((void *)&v45 + 1) + 8 * m) longLongValue]);
              }
              uint64_t v30 = [v29 countByEnumeratingWithState:&v45 objects:v62 count:16];
            }
            while (v30);
          }

          if (!IMDSqlOperationFinishQuery((uint64_t)buf))
          {
            id v33 = *((id *)&v73 + 1);
            CFStringRef v34 = IMLogHandleForCategory();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
              sub_1AFC6F11C(v33);
            }
          }
          IMDSqlOperationCommitOrRevertTransaction(buf);
          id v44 = 0;
          BOOL v35 = IMDSqlOperationRelease((uint64_t)buf, &v44);
          id v36 = v44;
          if (v35)
          {
            [v42 enumerateObjectsUsingBlock:&unk_1F084CF40];
            IMDCoreSpotlightScheduleUpdateForDeletedMessages(1005);
          }
          else
          {
            uint64_t v37 = IMLogHandleForCategory();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
              sub_1AFC6F094(v36);
            }
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v38 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              uint64_t v39 = [v42 count];
              LODWORD(v65) = 134217984;
              *(void *)((char *)&v65 + 4) = v39;
              _os_log_impl(&dword_1AFB53000, v38, OS_LOG_TYPE_INFO, "Recently Deleted | Finished moving messages to recoverable message table for %lu chatGUIDs", (uint8_t *)&v65, 0xCu);
            }
          }
        }
      }
      uint64_t v9 = (__CFString *)theString;
    }
  }
}

- (void)recoverMessageRecordsForChatRecordsWithGUIDs:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v3 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
  id v4 = [v3 allObjects];

  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = [v4 count];
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Recently Deleted | Will begin recovering messages for %lu unique chatGUIDs", (uint8_t *)&buf, 0xCu);
    }
  }
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long buf = 0u;
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)&buf);
  IMDSqlOperationBeginTransaction(&buf);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v4;
  uint64_t v25 = [obj countByEnumeratingWithState:&v28 objects:v45 count:16];
  if (!v25) {
    goto LABEL_29;
  }
  uint64_t v24 = *(void *)v29;
  while (2)
  {
    for (uint64_t i = 0; i != v25; ++i)
    {
      if (*(void *)v29 != v24) {
        objc_enumerationMutation(obj);
      }
      uint64_t v8 = *(void *)(*((void *)&v28 + 1) + 8 * i);
      _IMDSqlOperationBeginQuery((uint64_t)&buf, @" SELECT m.guid FROM chat_recoverable_message_join AS crmj JOIN chat AS c  ON crmj.chat_id = c.ROWID AND c.guid = ? JOIN message AS m  ON crmj.message_id = m.ROWID;");
      IMDSqlStatementBindTextFromCFString((uint64_t)&v48, v8);
      if (IMDSqlOperationHasRows((uint64_t)&buf))
      {
        uint64_t v9 = MEMORY[0x1E4F143A8];
        do
        {
          *(void *)long long v32 = 0;
          *(void *)&v32[8] = v32;
          *(void *)&long long v33 = 0x3032000000;
          *((void *)&v33 + 1) = sub_1AFC07868;
          *(void *)&long long v34 = sub_1AFC07878;
          *((void *)&v34 + 1) = 0;
          v27[0] = v9;
          v27[1] = 3221225472;
          v27[2] = sub_1AFC0A29C;
          v27[3] = &unk_1E5F996C8;
          v27[4] = v8;
          v27[5] = v32;
          IMDSqlOperationIterateRow((uint64_t)&buf, (uint64_t)v27);
          if (*(void *)(*(void *)&v32[8] + 40)) {
            objc_msgSend(v6, "addObject:");
          }
          _Block_object_dispose(v32, 8);
        }
        while (IMDSqlOperationHasRows((uint64_t)&buf));
      }
      if (!IMDSqlOperationFinishQuery((uint64_t)&buf))
      {
        id v12 = *((id *)&v56 + 1);
        uint64_t v13 = IMLogHandleForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1AFC6F4DC(v8, v12);
        }
        goto LABEL_28;
      }
      _IMDSqlOperationBeginQuery((uint64_t)&buf, @"INSERT INTO chat_message_join (chat_id, message_id, message_date) SELECT crmj.chat_id, crmj.message_id, m.date FROM chat_recoverable_message_join AS crmj JOIN chat AS c  ON crmj.chat_id = c.ROWID AND c.guid = ? JOIN message AS m  ON crmj.message_id = m.ROWID;");
      IMDSqlStatementBindTextFromCFString((uint64_t)&v48, v8);
      if (!IMDSqlOperationFinishQuery((uint64_t)&buf))
      {
        id v12 = *((id *)&v56 + 1);
        uint64_t v13 = IMLogHandleForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1AFC6F43C(v8, v12);
        }
LABEL_28:

        goto LABEL_29;
      }
      _IMDSqlOperationBeginQuery((uint64_t)&buf, @"INSERT INTO unsynced_removed_recoverable_messages (chat_guid, message_guid, part_index) SELECT c.guid, m.guid, -1 FROM chat_recoverable_message_join AS crmj JOIN chat AS c  ON c.ROWID=crmj.chat_id AND c.guid=? JOIN message AS m  ON m.ROWID=crmj.message_id AND crmj.ck_sync_state=1;");
      IMDSqlStatementBindTextFromCFString((uint64_t)&v48, v8);
      if (!IMDSqlOperationFinishQuery((uint64_t)&buf))
      {
        id v10 = *((id *)&v56 + 1);
        uint64_t v11 = IMLogHandleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1AFC6F3C4(v43, v10, &v44, v11);
        }
      }
    }
    uint64_t v25 = [obj countByEnumeratingWithState:&v28 objects:v45 count:16];
    if (v25) {
      continue;
    }
    break;
  }
LABEL_29:

  _IMDSqlOperationBeginQuery((uint64_t)&buf, @"DELETE FROM chat_recoverable_message_join WHERE message_id IN(SELECT message_id FROM chat_message_join);");
  if (!IMDSqlOperationFinishQuery((uint64_t)&buf))
  {
    id v14 = *((id *)&v56 + 1);
    id v15 = IMLogHandleForCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6F33C(v14);
    }
  }
  long long v39 = v53;
  long long v40 = v54;
  long long v41 = v55;
  long long v42 = v56;
  long long v35 = v49;
  long long v36 = v50;
  long long v37 = v51;
  long long v38 = v52;
  *(_OWORD *)long long v32 = buf;
  long long v33 = v47;
  long long v34 = v48;
  [(IMDDatabase *)self _recoverMessagePartsForChatRecordsWithGUIDs:obj operation:v32];
  IMDSqlOperationCommitOrRevertTransaction(&buf);
  id v26 = 0;
  BOOL v16 = IMDSqlOperationRelease((uint64_t)&buf, &v26);
  id v17 = v26;
  if (v16)
  {
    IMDCoreSpotlightAddChatGUIDs(obj, 1005);
    if ([v6 count]) {
      IMDCoreSpotlightAddMessageGUIDs(v6, 1005);
    }
  }
  else
  {
    id v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6F2B4(v17);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = [obj count];
      *(_DWORD *)long long v32 = 134217984;
      *(void *)&void v32[4] = v20;
      _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "Recently Deleted | Finished recovering messages for %lu unique chatGUIDs", v32, 0xCu);
    }
  }
}

- (void)_recoverMessagePartsForChatRecordsWithGUIDs:(id)a3 operation:(IMDSqlOperation *)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v22 = a3;
  id v6 = objc_msgSend(MEMORY[0x1E4F1CAD0], "setWithArray:");
  CFArrayRef v7 = [v6 allObjects];

  uint64_t v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 134217984;
    uint64_t v42 = [v7 count];
    _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Will begin recovering message parts for %lu unique chatGUIDs", buf, 0xCu);
  }

  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v37;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v37 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        uint64_t v13 = [(IMDDatabase *)self _loadRecoverableMessagePartsMetadataForChatGUID:v12];
        if ([v13 count])
        {
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v24[2] = sub_1AFC0A768;
          v24[3] = &unk_1E5F996F0;
          void v24[4] = self;
          long long v14 = *(_OWORD *)&a4->var4.var7.var4;
          long long v33 = *(_OWORD *)&a4->var4.var7.var2;
          long long v34 = v14;
          long long v35 = *(_OWORD *)&a4->var4.var7.var6;
          long long v15 = *(_OWORD *)&a4->var4.var7.var0.var0;
          long long v29 = *(_OWORD *)&a4->var4.var4;
          long long v30 = v15;
          long long v16 = *(_OWORD *)&a4->var4.var7.var0.var4;
          long long v31 = *(_OWORD *)&a4->var4.var7.var0.var2;
          long long v32 = v16;
          long long v17 = *(_OWORD *)&a4->var2;
          long long v25 = *(_OWORD *)&a4->var0;
          long long v26 = v17;
          long long v18 = *(_OWORD *)&a4->var4.var2;
          long long v27 = *(_OWORD *)&a4->var4.var0;
          long long v28 = v18;
          [v13 enumerateKeysAndObjectsUsingBlock:v24];
        }
        else
        {
          uint64_t v19 = IMLogHandleForCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v42 = v12;
            _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: No parts metadata found for chatGUID: %@. This state is valid if there are no message part deletions.", buf, 0xCu);
          }
        }
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
    }
    while (v9);
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = [obj count];
      *(_DWORD *)long long buf = 134217984;
      uint64_t v42 = v21;
      _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "Recently Deleted | Finished recovering message parts for %lu unique chatGUIDs", buf, 0xCu);
    }
  }
}

- (id)_restoredAttributedBodyForMessageGUID:(id)a3 withRecoveredAttributedParts:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(IMDDatabase *)self _loadAttributedBodyTextForMessageWithGUID:v6];
  uint64_t v9 = v8;
  if (v8)
  {
    uint64_t v10 = (void *)[v8 mutableCopy];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v11 = v7;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v20 = v9;
      id v21 = v7;
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          uint64_t v16 = *(void *)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v17 = objc_msgSend(v10, "__im_insertionIndexForMessagePartBody:", v16, v20, v21);
          if (v17 == 0x7FFFFFFFFFFFFFFFLL)
          {
            long long v18 = IMLogHandleForCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              id v27 = v6;
              _os_log_error_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_ERROR, "Recently Deleted | Cannot recover: message part number already exists. Not inserting into main message body for messageGUID: %@", buf, 0xCu);
            }
          }
          else
          {
            [v10 insertAttributedString:v16 atIndex:v17];
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v28 count:16];
      }
      while (v13);
      uint64_t v9 = v20;
      id v7 = v21;
    }
  }
  else
  {
    uint64_t v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6F57C();
    }
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)_updateMessageRecordForGUID:(id)a3 withAttributedBody:(id)a4 operation:(IMDSqlOperation *)a5
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = IMLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
  {
    LODWORD(v22[0]) = 138412290;
    *(void *)((char *)v22 + 4) = v8;
    _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Writing restored part to message GUID: %@", (uint8_t *)v22, 0xCu);
  }

  JWEncodeCodableObject();
  CFDataRef v11 = (const __CFData *)objc_claimAutoreleasedReturnValue();
  _IMDSqlOperationBeginQuery((uint64_t)a5, @"UPDATE message SET attributedBody = ?, text = ?   WHERE message.guid = ?;");
  IMDSqlStatementBindBlob((uint64_t)&a5->var4, v11);
  uint64_t v12 = [v9 string];

  IMDSqlStatementBindTextFromCFString((uint64_t)&a5->var4, (uint64_t)v12);
  IMDSqlStatementBindTextFromCFString((uint64_t)&a5->var4, (uint64_t)v8);
  if (IMDSqlOperationFinishQuery((uint64_t)a5))
  {
    uint64_t v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(v22[0]) = 138412290;
      *(void *)((char *)v22 + 4) = v8;
      _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Recently Deleted | updated attributedbody for messageGUID: %@", (uint8_t *)v22, 0xCu);
    }

    long long v14 = *(_OWORD *)&a5->var4.var7.var4;
    v22[8] = *(_OWORD *)&a5->var4.var7.var2;
    v22[9] = v14;
    v22[10] = *(_OWORD *)&a5->var4.var7.var6;
    long long v15 = *(_OWORD *)&a5->var4.var7.var0.var0;
    uint8_t v22[4] = *(_OWORD *)&a5->var4.var4;
    v22[5] = v15;
    long long v16 = *(_OWORD *)&a5->var4.var7.var0.var4;
    v22[6] = *(_OWORD *)&a5->var4.var7.var0.var2;
    v22[7] = v16;
    long long v17 = *(_OWORD *)&a5->var2;
    v22[0] = *(_OWORD *)&a5->var0;
    v22[1] = v17;
    long long v18 = *(_OWORD *)&a5->var4.var2;
    v22[2] = *(_OWORD *)&a5->var4.var0;
    v22[3] = v18;
    [(IMDDatabase *)self _removeFromRecoverableMessagePartForMessageGUID:v8 operation:v22];
    IMDCoreSpotlightAddMessageGUID(v8, 1005);
  }
  else
  {
    uint64_t v19 = a5->var5;
    uint64_t v20 = IMLogHandleForCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6F5F0((uint64_t)v8, v19);
    }
  }
  id v21 = IMLogHandleForCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    LODWORD(v22[0]) = 138412290;
    *(void *)((char *)v22 + 4) = v8;
    _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Finished writing restored part to message GUID: %@", (uint8_t *)v22, 0xCu);
  }
}

- (void)_removeFromRecoverableMessagePartForMessageGUID:(id)a3 operation:(IMDSqlOperation *)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Removing recoverable message parts for message GUID: %@", (uint8_t *)&v12, 0xCu);
  }

  _IMDSqlOperationBeginQuery((uint64_t)a4, @"INSERT INTO unsynced_removed_recoverable_messages (chat_guid, message_guid, part_index) SELECT c.guid, m.guid, rmp.part_index  FROM recoverable_message_part AS rmp  JOIN chat AS c   ON c.ROWID=rmp.chat_id  JOIN message AS m   ON m.ROWID=rmp.message_id AND m.guid=? AND rmp.ck_sync_state=1;");
  IMDSqlStatementBindTextFromCFString((uint64_t)&a4->var4, (uint64_t)v5);
  if (!IMDSqlOperationFinishQuery((uint64_t)a4))
  {
    id v7 = a4->var5;
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6F710(v7);
    }
  }
  _IMDSqlOperationBeginQuery((uint64_t)a4, @"DELETE FROM recoverable_message_part WHERE message_id IN( SELECT ROWID  FROM message AS m  WHERE m.guid = ?);");
  IMDSqlStatementBindTextFromCFString((uint64_t)&a4->var4, (uint64_t)v5);
  if (!IMDSqlOperationFinishQuery((uint64_t)a4))
  {
    id v9 = a4->var5;
    uint64_t v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6F68C(v9);
    }
  }
  CFDataRef v11 = IMLogHandleForCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
  {
    int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Finished removing recoverable message parts for message GUID: %@", (uint8_t *)&v12, 0xCu);
  }
}

- (id)_loadAttributedBodyTextForMessageWithGUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = IMLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Loading attributed message body for message GUID: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3032000000;
  long long v16 = sub_1AFC07868;
  long long v17 = sub_1AFC07878;
  id v18 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1AFC0B0EC;
  v9[3] = &unk_1E5F99718;
  id v5 = v3;
  id v10 = v5;
  p_long long buf = &buf;
  IMDRunSqlOperation((uint64_t)v9);
  id v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Finished loading attributed message body for message GUID: %@", v12, 0xCu);
  }

  id v7 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v7;
}

- (id)_loadRecoverableMessagePartsMetadataForChatGUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = IMLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
  {
    LODWORD(buf) = 138412290;
    *(void *)((char *)&buf + 4) = v3;
    _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Loading message parts metadata for chat GUID: %@", (uint8_t *)&buf, 0xCu);
  }

  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v15 = 0x3032000000;
  long long v16 = sub_1AFC07868;
  long long v17 = sub_1AFC07878;
  id v18 = 0;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1AFC0B814;
  v9[3] = &unk_1E5F99718;
  id v5 = v3;
  id v10 = v5;
  p_long long buf = &buf;
  IMDRunSqlOperation((uint64_t)v9);
  id v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)int v12 = 138412290;
    id v13 = v5;
    _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Finished loading message parts metadata for chat GUID: %@", v12, 0xCu);
  }

  id v7 = *(id *)(*((void *)&buf + 1) + 40);
  _Block_object_dispose(&buf, 8);

  return v7;
}

- (id)_chatGUIDsForChatsWithRecoverableMessagesOlderThanDate:(id)a3 operation:(IMDSqlOperation *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1AFC0C1F4;
  v19[3] = &unk_1E5F940E8;
  id v21 = a4;
  id v7 = v5;
  id v20 = v7;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_1AFC0C234;
  long long v16 = &unk_1E5F940E8;
  id v18 = a4;
  id v8 = v6;
  id v17 = v8;
  _IMDSqlOperationRunQuery((uint64_t)a4, @"SELECT c.guid FROM chat_recoverable_message_join AS crmj JOIN message AS m ON m.ROWint ID = crmj.message_id  JOIN chat AS c ON c.ROWint ID = crmj.chat_id WHERE(  crmj.delete_date < ?  AND   NOT (m.group_action_type IN (1,3) AND (m.ROWID IN (SELECT message_id FROM message_attachment_join))) ) GROUP BY    c.guid  ", (uint64_t)v19, (uint64_t)&v13);
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = objc_msgSend(v8, "count", v13, v14, v15, v16);
      *(_DWORD *)long long buf = 134217984;
      uint64_t v23 = v10;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Found %llu chats affected by message deletion", buf, 0xCu);
    }
  }
  CFDataRef v11 = objc_msgSend(v8, "copy", v13, v14, v15, v16);

  return v11;
}

- (id)_chatGUIDsForChatsWithJunkMessagesOlderThanDate:(id)a3 operation:(IMDSqlOperation *)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1AFC0C620;
  v19[3] = &unk_1E5F940E8;
  id v21 = a4;
  id v7 = v5;
  id v20 = v7;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  uint64_t v15 = sub_1AFC0C660;
  long long v16 = &unk_1E5F940E8;
  id v18 = a4;
  id v8 = v6;
  id v17 = v8;
  _IMDSqlOperationRunQuery((uint64_t)a4, @"SELECT c.guid FROM chat_message_join AS cmj JOIN message AS m ON m.ROWint ID = cmj.message_id  JOIN chat AS c ON c.ROWint ID = cmj.chat_id WHERE(  m.date < ?  AND   c.is_filtered = 2) GROUP BY    c.guid  ", (uint64_t)v19, (uint64_t)&v13);
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = objc_msgSend(v8, "count", v13, v14, v15, v16);
      *(_DWORD *)long long buf = 134217984;
      uint64_t v23 = v10;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Found %llu chats affected by message deletion", buf, 0xCu);
    }
  }
  CFDataRef v11 = objc_msgSend(v8, "copy", v13, v14, v15, v16);

  return v11;
}

- (id)_deleteChatIfEmptyWithGUID:(id)a3 lastMessageDate:(id)a4 operation:(IMDSqlOperation *)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v8 = (__CFString *)a3;
  id v9 = a4;
  uint64_t v10 = [(IMDDatabase *)self _countMessagesExcludingGroupPhotosInChatWithGUID:v8 isRecoverable:0 operation:a5];
  uint64_t v11 = [(IMDDatabase *)self _countMessagesExcludingGroupPhotosInChatWithGUID:v8 isRecoverable:1 operation:a5];
  if (IMOSLoggingEnabled())
  {
    int v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v37 = 138412802;
      long long v38 = v8;
      __int16 v39 = 2048;
      uint64_t v40 = v10;
      __int16 v41 = 2048;
      uint64_t v42 = v11;
      _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Chat with guid %@ has %lld messages and %lld recoverable messages", (uint8_t *)&v37, 0x20u);
    }
  }
  uint64_t v13 = 0;
  if (v10 <= 0 && v11 <= 0)
  {
    uint64_t v14 = (__CFString *)IMDChatRecordCopyChatForGUID(v8);
    id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v16 = [(__CFString *)v14 guid];
    [v15 setObject:v16 forKeyedSubscript:*MEMORY[0x1E4F6CD38]];

    id v17 = [(__CFString *)v14 chatIdentifier];
    [v15 setObject:v17 forKeyedSubscript:*MEMORY[0x1E4F6CCF0]];

    id v18 = [(__CFString *)v14 serviceName];
    [v15 setObject:v18 forKeyedSubscript:*MEMORY[0x1E4F6CE40]];

    uint64_t v19 = objc_msgSend(MEMORY[0x1E4F28ED0], "numberWithUnsignedChar:", -[__CFString style](v14, "style"));
    [v15 setObject:v19 forKeyedSubscript:*MEMORY[0x1E4F6CE48]];

    id v20 = [(__CFString *)v14 groupID];

    if (v20)
    {
      id v21 = [(__CFString *)v14 groupID];
      [v15 setObject:v21 forKeyedSubscript:*MEMORY[0x1E4F6CD40]];
    }
    long long v22 = [(__CFString *)v14 originalGroupID];

    if (v22)
    {
      uint64_t v23 = [(__CFString *)v14 originalGroupID];
      [v15 setObject:v23 forKeyedSubscript:*MEMORY[0x1E4F6CDE0]];
    }
    uint64_t v24 = [(__CFString *)v14 accountID];

    if (v24)
    {
      long long v25 = [(__CFString *)v14 accountID];
      [v15 setObject:v25 forKeyedSubscript:*MEMORY[0x1E4F6CCD8]];
    }
    long long v26 = [(__CFString *)v14 properties];

    if (v26)
    {
      id v27 = [(__CFString *)v14 properties];
      [v15 setObject:v27 forKeyedSubscript:*MEMORY[0x1E4F6CE08]];
    }
    long long v28 = [(__CFString *)v14 lastAddressedHandle];

    if (v28)
    {
      uint64_t v29 = [(__CFString *)v14 lastAddressedHandle];
      [v15 setObject:v29 forKeyedSubscript:*MEMORY[0x1E4F6CD98]];
    }
    long long v30 = [(__CFString *)v14 lastAddressedSIMID];

    if (v30)
    {
      long long v31 = [(__CFString *)v14 lastAddressedSIMID];
      [v15 setObject:v31 forKeyedSubscript:*MEMORY[0x1E4F6CDA0]];
    }
    int v32 = IMGetCachedDomainBoolForKey();
    if (IMOSLoggingEnabled())
    {
      long long v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        long long v34 = @"NO";
        if (v32) {
          long long v34 = @"YES";
        }
        int v37 = 138412546;
        long long v38 = v8;
        __int16 v39 = 2112;
        uint64_t v40 = (uint64_t)v34;
        _os_log_impl(&dword_1AFB53000, v33, OS_LOG_TYPE_INFO, "Deleting empty chat %@, cloud sync enabled is %@", (uint8_t *)&v37, 0x16u);
      }
    }
    if (v32)
    {
      long long v35 = [(__CFString *)v14 cloudRecordID];
      IMDChatInsertIntoDeletedChatsTable(v8, v35, objc_msgSend(v9, "__im_nanosecondTimeInterval"));
    }
    IMDChatRecordDeleteChatForGUID(v8);
    uint64_t v13 = (void *)[v15 copy];
  }
  return v13;
}

- (void)_deleteTransfersInMessagePartsForChatGUID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDDatabase *)self _loadRecoverableMessagePartsMetadataForChatGUID:v4];
  [v5 enumerateKeysAndObjectsUsingBlock:&unk_1F084C648];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Recently Deleted | Parts: Finished deleting recoverable message parts transfers for chatGUID: %@", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (id)_updateChatsSyncStateQueryFor:(int64_t)a3
{
  id v3 = NSString;
  id v4 = [NSString substitutionStringForCount:a3];
  id v5 = [v3 stringWithFormat:@"%@ (%@)", @"UPDATE chat SET ck_sync_state = ? where guid in ", v4];

  return v5;
}

- (void)updateChatsSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v18 = 0u;
  memset(v17, 0, sizeof(v17));
  memset(v16, 0, sizeof(v16));
  IMDSqlOperationInitWithSharedCSDBDatabase((uint64_t)v16);
  IMDSqlOperationBeginTransaction(v16);
  _IMDSqlOperationBeginQuery((uint64_t)v16, (CFStringRef)-[IMDDatabase _updateChatsSyncStateQueryFor:](self, "_updateChatsSyncStateQueryFor:", [v6 count]));
  IMDSqlStatementBindInt64((uint64_t)v17, a3);
  CFArrayRef v7 = (const __CFArray *)v6;
  IMDSqlStatementBindTextFromArrayOfCFStrings((uint64_t)v17, v7);
  if (IMDSqlOperationFinishQuery((uint64_t)v16))
  {
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFArrayRef v20 = v7;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "CloudSync | updated ck_sync_state for recordIDs: %@", buf, 0xCu);
    }
  }
  else
  {
    id v8 = *((id *)&v18 + 1);
    uint64_t v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6F86C((uint64_t)v7, v8);
    }
  }
  IMDSqlOperationCommitOrRevertTransaction(v16);
  id v15 = 0;
  BOOL v10 = IMDSqlOperationRelease((uint64_t)v16, &v15);
  id v11 = v15;
  int v12 = IMLogHandleForCategory();
  uint64_t v13 = v12;
  if (v10)
  {
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      CFArrayRef v20 = v7;
      _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "CloudSync.chat | Update status Query success for: %@", buf, 0xCu);
    }
  }
  else if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
  {
    sub_1AFC6F7E8(v11);
  }

  uint64_t v14 = IMLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138412290;
    CFArrayRef v20 = v7;
    _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "CloudSync.chat | Finished updating ck_sync_state for recordIDs %@", buf, 0xCu);
  }
}

- (id)copyDuplicateGroupChatRecordsWithLimit:(int64_t)a3
{
  uint64_t v6 = 0;
  CFArrayRef v7 = &v6;
  uint64_t v8 = 0x3032000000;
  uint64_t v9 = sub_1AFC07868;
  BOOL v10 = sub_1AFC07878;
  id v11 = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1AFC0D4EC;
  v5[3] = &unk_1E5F99788;
  v5[5] = &v6;
  v5[6] = a3;
  v5[4] = self;
  _IMDPerformLockedStatementBlockWithQuery(@"SELECT ROWID, guid, style, state, account_id, properties, chat_identifier, service_name, room_name, account_login, is_archived, last_addressed_handle, display_name, group_id, is_filtered, successful_query, engram_id, server_change_token, ck_sync_state, original_group_id, last_read_message_timestamp, cloudkit_record_id, last_addressed_sim_id, is_blackholed, syndication_date, syndication_type, is_recovered, is_deleting_incoming_messages    FROM chat c   WHERE style = 43   AND (SELECT count(*) FROM chat cdupe WHERE cdupe.group_id = c.group_id AND cdupe.service_name = c.service_name) > 1   LIMIT ?", (uint64_t)v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return v3;
}

- (void)_validateSpotlightClientStateWithLastError:(id)a3 attempts:(int64_t)a4 completion:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = (void (**)(id, uint64_t, void))a5;
  if (a4 < 5)
  {
    if ([MEMORY[0x1E4F6E700] needsIndexing])
    {
      if (IMOSLoggingEnabled())
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 136446210;
          long long v18 = "-[IMDDatabase(Spotlight) _validateSpotlightClientStateWithLastError:attempts:completion:]";
          _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "%{public}s CS already needs reindexing, not checking client state", buf, 0xCu);
        }
      }
      v9[2](v9, 1, 0);
    }
    else
    {
      int v12 = IMCoreSpotlightIndex();
      if (v12)
      {
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        _OWORD v14[2] = sub_1AFC444FC;
        v14[3] = &unk_1E5F9D318;
        int64_t v16 = a4;
        void v14[4] = self;
        id v15 = v9;
        [v12 fetchLastClientStateWithCompletionHandler:v14];
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 136446210;
            long long v18 = "-[IMDDatabase(Spotlight) _validateSpotlightClientStateWithLastError:attempts:completion:]";
            _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "%{public}s Failed to fetch Spotlight index, bailing", buf, 0xCu);
          }
        }
        v9[2](v9, 1, 0);
      }
    }
  }
  else
  {
    BOOL v10 = IMLogHandleForCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_1AFC70BC0(v10);
    }

    ((void (**)(id, uint64_t, id))v9)[2](v9, 1, v8);
  }
}

- (void)validateSpotlightClientStateWithCompletion:(id)a3
{
}

- (void)fetchSpotlightClientStateWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDSpotlightClientStateManager sharedManager];
  [v4 _currentClientStateWithCompletion:v3];
}

- (void)invalidateSpotlightClientStateVersioningWithCompletion:(id)a3
{
  id v3 = (void (**)(id, id))a3;
  id v4 = +[IMDSpotlightClientStateManager sharedManager];
  id v9 = 0;
  id v5 = [v4 currentClientStateWithError:&v9];
  id v6 = v9;

  if (!v6)
  {
    [v5 setIndexRevision:0];
    [v5 setIndexVersion:0];
    CFArrayRef v7 = +[IMDSpotlightClientStateManager sharedManager];
    id v8 = 0;
    [v7 saveClientState:v5 withError:&v8];
    id v6 = v8;
  }
  v3[2](v3, v6);
}

- (void)deleteAllDonationsForAppDeletionWithCompletion:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDCoreSpotlightManager sharedInstance];
  [v4 deleteAllDonationsForAppDeletionWithCompletion:v3];
}

@end