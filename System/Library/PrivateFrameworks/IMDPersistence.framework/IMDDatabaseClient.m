@interface IMDDatabaseClient
- (id)chatRecordsFilteredByPredicate:(id)a3;
- (id)chatRecordsWithHandles:(id)a3 serviceName:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7;
- (id)chatRecordsWithHandles:(id)a3 serviceName:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7 useOriginalGroupID:(BOOL)a8;
- (id)chatRecordsWithIdentifier:(id)a3;
- (id)copyDuplicateGroupChatRecordsWithLimit:(int64_t)a3;
- (id)handleRecordsFilteredByPredicate:(id)a3;
- (id)loadRecoverableMessagesMetadataGroupedByChatGUID;
- (id)recoverableMessagesMetadataPendingCloudKitDeleteWithLimit:(int64_t)a3;
- (id)recoverableMessagesMetadataPendingCloudKitSaveWithLimit:(int64_t)a3 filter:(unint64_t)a4;
- (id)scheduledMessagesMetadataPendingCloudKitDeleteWithLimit:(int64_t)a3;
- (void)_fetchMessageRecordsForChatRecordWithGUID:(id)a3 filteredUsingPredicate:(id)a4 sortedUsingDescriptors:(id)a5 parentedOnly:(BOOL)a6 limit:(unint64_t)a7 completionHandler:(id)a8;
- (void)_sendAsyncXPCMessage:(id)a3 action:(int64_t)a4 responseHandler:(id)a5;
- (void)_sendSyncXPCMessage:(id)a3 action:(int64_t)a4 responseHandler:(id)a5;
- (void)addScheduledMessageGUIDandCKRecordToDeleteFromCloudKit:(id)a3 recordID:(id)a4;
- (void)clearRecoverableMessageTombStones;
- (void)coreSpotlightDeleteAttachmentGUIDs:(id)a3 reason:(int64_t)a4;
- (void)deleteAllDonationsForAppDeletionWithCompletion:(id)a3;
- (void)deleteAttachmentsDirectWithPredicate:(id)a3;
- (void)deleteDatabase;
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
- (void)notifyFirstUnlockComplete;
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

@implementation IMDDatabaseClient

- (void)fetchChatRecordsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 olderThan:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7
{
  id v12 = a3;
  id v13 = a5;
  id v14 = a7;
  xpc_object_t v15 = xpc_dictionary_create(0, 0, 0);
  if (v15)
  {
    if (v12) {
      IMInsertCodableObjectsToXPCDictionary();
    }
    xpc_dictionary_set_BOOL(v15, "ascending", a4);
    if (v13) {
      IMInsertCodableObjectsToXPCDictionary();
    }
    xpc_dictionary_set_int64(v15, "limit", a6);
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1AFB55970;
    v16[3] = &unk_1E5F8FB98;
    v16[4] = self;
    id v17 = v14;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:v15 action:147 responseHandler:v16];
  }
}

- (id)loadRecoverableMessagesMetadataGroupedByChatGUID
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    uint64_t v7 = 0;
    v8 = &v7;
    uint64_t v9 = 0x3032000000;
    v10 = sub_1AFBBA6EC;
    v11 = sub_1AFBBA6FC;
    id v12 = 0;
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1AFB58CCC;
    v6[3] = &unk_1E5F8FBC0;
    v6[4] = self;
    v6[5] = &v7;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:empty action:161 responseHandler:v6];
    id v4 = (id)v8[5];
    _Block_object_dispose(&v7, 8);
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (void)_sendSyncXPCMessage:(id)a3 action:(int64_t)a4 responseHandler:(id)a5
{
  uint64_t v7 = (void (**)(void))a5;
  id v8 = a3;
  xpc_dictionary_set_int64(v8, "__xpc__event_code__", a4);
  __XPCIMDMessageStoreSendXPCMessage(v8, v7, 0);
}

- (void)_sendAsyncXPCMessage:(id)a3 action:(int64_t)a4 responseHandler:(id)a5
{
  uint64_t v7 = (void (**)(void))a5;
  id v8 = a3;
  xpc_dictionary_set_int64(v8, "__xpc__event_code__", a4);
  __XPCIMDMessageStoreSendXPCMessage(v8, v7, 1);
}

- (id)chatRecordsFilteredByPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  xpc_object_t v15 = sub_1AFBBA6EC;
  v16 = sub_1AFBBA6FC;
  id v17 = 0;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    if (v4)
    {
      id v9 = v4;
      uint64_t v10 = 0;
      IMInsertCodableObjectsToXPCDictionary();
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1AFBBA704;
    v11[3] = &unk_1E5F8FBC0;
    v11[4] = self;
    v11[5] = &v12;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v5, 145, v11, v9, v10);
  }
  v6 = (void *)v13[5];
  if (!v6) {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v6;

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)fetchChatRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  if (v13)
  {
    if (v10) {
      IMInsertCodableObjectsToXPCDictionary();
    }
    if (v11)
    {
      uint64_t v14 = [(IMDDatabaseLegacyXPCBridge *)self _xpcArrayWithCodableObjects:v11];
      xpc_dictionary_set_value(v13, "sortDescriptors", v14);
    }
    xpc_dictionary_set_int64(v13, "limit", a5);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1AFBBA8DC;
    v15[3] = &unk_1E5F8FB98;
    v15[4] = self;
    id v16 = v12;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:v13 action:146 responseHandler:v15];
  }
}

- (void)fetchChatRecordsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
}

- (id)chatRecordsWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  xpc_object_t v13 = &v12;
  uint64_t v14 = 0x3032000000;
  xpc_object_t v15 = sub_1AFBBA6EC;
  id v16 = sub_1AFBBA6FC;
  id v17 = 0;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    if (v4)
    {
      id v9 = v4;
      uint64_t v10 = 0;
      IMInsertNSStringsToXPCDictionary();
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1AFBBAAFC;
    v11[3] = &unk_1E5F8FBC0;
    v11[4] = self;
    v11[5] = &v12;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v5, 148, v11, v9, v10);
  }
  v6 = (void *)v13[5];
  if (!v6) {
    v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v6;

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)fetchChatRecordsWithPinningIdentifier:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (v8)
  {
    if (v6) {
      IMInsertNSStringsToXPCDictionary();
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1AFBBAC6C;
    v9[3] = &unk_1E5F8FB98;
    v9[4] = self;
    id v10 = v7;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:v8 action:150 responseHandler:v9];
  }
}

- (id)chatRecordsWithHandles:(id)a3 serviceName:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7
{
  return [(IMDDatabaseClient *)self chatRecordsWithHandles:a3 serviceName:a4 displayName:a5 groupID:a6 style:a7 useOriginalGroupID:0];
}

- (id)chatRecordsWithHandles:(id)a3 serviceName:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7 useOriginalGroupID:(BOOL)a8
{
  BOOL v8 = a8;
  unsigned int v9 = a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v23 = 0;
  v24 = &v23;
  uint64_t v25 = 0x3032000000;
  v26 = sub_1AFBBA6EC;
  v27 = sub_1AFBBA6FC;
  id v28 = 0;
  xpc_object_t v18 = xpc_dictionary_create(0, 0, 0);
  if (v18)
  {
    if (v14) {
      IMInsertArraysToXPCDictionary();
    }
    if (v15) {
      IMInsertNSStringsToXPCDictionary();
    }
    if (v16) {
      IMInsertNSStringsToXPCDictionary();
    }
    if (v17) {
      IMInsertNSStringsToXPCDictionary();
    }
    if (v8) {
      IMInsertBoolsToXPCDictionary();
    }
    xpc_dictionary_set_int64(v18, "style", v9);
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1AFBBAF44;
    v22[3] = &unk_1E5F8FBC0;
    v22[4] = self;
    v22[5] = &v23;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:v18 action:143 responseHandler:v22];
  }
  v19 = (void *)v24[5];
  if (!v19) {
    v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v20 = v19;

  _Block_object_dispose(&v23, 8);
  return v20;
}

- (void)fetchChatRecordsWithAtLeastHandles:(id)a3 serviceName:(id)a4 style:(unsigned __int8)a5 completionHandler:(id)a6
{
  unsigned int v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  if (v13)
  {
    if (v10) {
      IMInsertArraysToXPCDictionary();
    }
    if (v11) {
      IMInsertNSStringsToXPCDictionary();
    }
    xpc_dictionary_set_int64(v13, "style", v7);
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1AFBBB0FC;
    v14[3] = &unk_1E5F8FB98;
    v14[4] = self;
    id v15 = v12;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:v13 action:144 responseHandler:v14];
  }
}

- (void)fetchGroupPhotoPathsForChatsWithGroupIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v12[0] = 0;
  v12[1] = v12;
  v12[2] = 0x3032000000;
  v12[3] = sub_1AFBBA6EC;
  v12[4] = sub_1AFBBA6FC;
  id v13 = 0;
  xpc_object_t v8 = xpc_dictionary_create(0, 0, 0);
  if (v8)
  {
    if (v6) {
      IMInsertArraysToXPCDictionary();
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1AFBBB2FC;
    v9[3] = &unk_1E5F957B0;
    id v11 = v12;
    v9[4] = self;
    id v10 = v7;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:v8 action:154 responseHandler:v9];
  }
  _Block_object_dispose(v12, 8);
}

- (id)copyDuplicateGroupChatRecordsWithLimit:(int64_t)a3
{
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_1AFBBA6EC;
  id v14 = sub_1AFBBA6FC;
  id v15 = 0;
  xpc_object_t empty = xpc_dictionary_create_empty();
  id v6 = empty;
  if (empty)
  {
    xpc_dictionary_set_int64(empty, "limit", a3);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1AFBBB4E4;
    v9[3] = &unk_1E5F8FBC0;
    v9[4] = self;
    void v9[5] = &v10;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:v6 action:153 responseHandler:v9];
  }
  id v7 = (id)v11[5];

  _Block_object_dispose(&v10, 8);
  return v7;
}

- (void)resolveInconsistentGUIDForChatRecordWithGUID:(id)a3 newGUID:(id)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    if (v8) {
      IMInsertNSStringsToXPCDictionary();
    }
    if (v9) {
      IMInsertNSStringsToXPCDictionary();
    }
    v12[0] = MEMORY[0x1E4F143A8];
    v12[1] = 3221225472;
    v12[2] = sub_1AFBBB674;
    v12[3] = &unk_1E5F957D8;
    id v13 = v10;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:empty action:155 responseHandler:v12];
  }
}

- (void)fetchLastMessageRecordForChatRecordWithRowID:(int64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  id v8 = empty;
  if (empty)
  {
    xpc_dictionary_set_int64(empty, "chatRowID", a3);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1AFBBB7A8;
    v9[3] = &unk_1E5F8FB98;
    v9[4] = self;
    id v10 = v6;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:v8 action:48 responseHandler:v9];
  }
}

- (void)_fetchMessageRecordsForChatRecordWithGUID:(id)a3 filteredUsingPredicate:(id)a4 sortedUsingDescriptors:(id)a5 parentedOnly:(BOOL)a6 limit:(unint64_t)a7 completionHandler:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a8;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    if (v14) {
      IMInsertNSStringsToXPCDictionary();
    }
    if (v15) {
      IMInsertCodableObjectsToXPCDictionary();
    }
    if (v16)
    {
      v19 = [(IMDDatabaseLegacyXPCBridge *)self _xpcArrayWithCodableObjects:v16];
      xpc_dictionary_set_value(empty, "sortDescriptors", v19);
    }
    xpc_dictionary_set_int64(empty, "limit", a7);
    xpc_dictionary_set_BOOL(empty, "parentedOnly", a6);
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1AFBBB9E8;
    v20[3] = &unk_1E5F8FB98;
    v20[4] = self;
    id v21 = v17;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:empty action:59 responseHandler:v20];
  }
}

- (void)fetchMessageRecordsForChatRecordWithGUID:(id)a3 filteredUsingPredicate:(id)a4 sortedUsingDescriptors:(id)a5 limit:(unint64_t)a6 completionHandler:(id)a7
{
}

- (void)fetchUnreadMessageRecordsForChatsFilteredUsingPredicate:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    if (v8) {
      IMInsertCodableObjectsToXPCDictionary();
    }
    IMInsertIntsToXPCDictionary();
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1AFBBBB90;
    v11[3] = &unk_1E5F8FB98;
    v11[4] = self;
    id v12 = v9;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 85, v11, a4, 0);
  }
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  xpc_object_t empty = xpc_dictionary_create_empty();
  id v11 = empty;
  if (v9 && v8 && empty)
  {
    IMInsertNSStringsToXPCDictionary();
    IMInsertBoolsToXPCDictionary();
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1AFBBBE38;
    v14[3] = &unk_1E5F8FB98;
    v14[4] = self;
    id v15 = v9;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v11, 60, v14, v6, 0);
  }
  else if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = _Block_copy(v9);
      *(_DWORD *)buf = 138412802;
      id v17 = v11;
      __int16 v18 = 2112;
      id v19 = v8;
      __int16 v20 = 2112;
      id v21 = v13;
      _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "IMDDatabaseClient | One or more invalid required parameters: xpc_object_t message: %@, messageGUID: %@, completionHandler: %@", buf, 0x20u);
    }
  }
}

- (void)updateAttachmentSyndicationRanges:(id)a3 shouldHideFromSyndication:(BOOL)a4
{
  id v7 = a3;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    if (v7) {
      IMInsertNSStringsToXPCDictionary();
    }
    xpc_dictionary_set_BOOL(v6, "shouldHideFromSyndication", a4);
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:v6 action:225 responseHandler:&unk_1F084CE00];
  }
}

- (void)updateMessageSyndicationRanges:(id)a3 shouldHideFromSyndication:(BOOL)a4
{
  id v7 = a3;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    if (v7) {
      IMInsertNSStringsToXPCDictionary();
    }
    xpc_dictionary_set_BOOL(v6, "shouldHideFromSyndication", a4);
    [(IMDDatabaseClient *)self _sendAsyncXPCMessage:v6 action:235 responseHandler:&unk_1F084C5E8];
  }
}

- (void)postSharePlayNotificationForChatGUID:(id)a3 faceTimeConversationUUID:(id)a4 handleIdentifier:(id)a5 localizedApplicationName:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  xpc_object_t empty = xpc_dictionary_create_empty();
  id v15 = empty;
  if (v12 && v11 && v10 && empty)
  {
    IMInsertNSStringsToXPCDictionary();
    IMInsertNSStringsToXPCDictionary();
    id v17 = v12;
    IMInsertNSStringsToXPCDictionary();
    if (v13)
    {
      id v17 = v13;
      IMInsertNSStringsToXPCDictionary();
    }
    -[IMDDatabaseClient _sendAsyncXPCMessage:action:responseHandler:](self, "_sendAsyncXPCMessage:action:responseHandler:", v15, 234, &unk_1F084C7C8, v17, 0);
  }
  else if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v19 = v15;
      __int16 v20 = 2112;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, "Not sending XPC message for SharePlay notification because message (%@), chatGUID (%@), faceTimeConversationUUID (%@), or handleIdentifier (%@) were nil", buf, 0x2Au);
    }
  }
}

- (void)notifyFirstUnlockComplete
{
  id v3 = xpc_dictionary_create(0, 0, 0);
  [(IMDDatabaseClient *)self _sendSyncXPCMessage:v3 action:241 responseHandler:&unk_1F084C300];
}

- (void)deleteDatabase
{
  id v3 = xpc_dictionary_create(0, 0, 0);
  [(IMDDatabaseClient *)self _sendSyncXPCMessage:v3 action:251 responseHandler:&unk_1F084C320];
}

- (id)handleRecordsFilteredByPredicate:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  id v15 = sub_1AFBBA6EC;
  id v16 = sub_1AFBBA6FC;
  id v17 = 0;
  xpc_object_t v5 = xpc_dictionary_create(0, 0, 0);
  if (v5)
  {
    if (v4)
    {
      id v9 = v4;
      uint64_t v10 = 0;
      IMInsertCodableObjectsToXPCDictionary();
    }
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1AFBBC5A0;
    v11[3] = &unk_1E5F8FBC0;
    v11[4] = self;
    void v11[5] = &v12;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v5, 246, v11, v9, v10);
  }
  xpc_object_t v6 = (void *)v13[5];
  if (!v6) {
    xpc_object_t v6 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v7 = v6;

  _Block_object_dispose(&v12, 8);
  return v7;
}

- (void)fetchHandleRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  if (v13)
  {
    if (v10) {
      IMInsertCodableObjectsToXPCDictionary();
    }
    if (v11)
    {
      uint64_t v14 = [(IMDDatabaseLegacyXPCBridge *)self _xpcArrayWithCodableObjects:v11];
      xpc_dictionary_set_value(v13, "sortDescriptors", v14);
    }
    xpc_dictionary_set_int64(v13, "limit", a5);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1AFBBC778;
    v15[3] = &unk_1E5F8FB98;
    v15[4] = self;
    id v16 = v12;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:v13 action:247 responseHandler:v15];
  }
}

- (void)coreSpotlightDeleteAttachmentGUIDs:(id)a3 reason:(int64_t)a4
{
  id v7 = a3;
  xpc_object_t v6 = xpc_dictionary_create(0, 0, 0);
  if (v6)
  {
    if (v7) {
      IMInsertArraysToXPCDictionary();
    }
    xpc_dictionary_set_int64(v6, "reason", a4);
    [(IMDDatabaseClient *)self _sendAsyncXPCMessage:v6 action:135 responseHandler:&unk_1F084C608];
  }
}

- (void)deleteAttachmentsDirectWithPredicate:(id)a3
{
  id v7 = a3;
  xpc_object_t v4 = xpc_dictionary_create(0, 0, 0);
  if (v4)
  {
    if (v7)
    {
      id v5 = v7;
      uint64_t v6 = 0;
      IMInsertCodableObjectsToXPCDictionary();
    }
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v4, 32, &unk_1F084C748, v5, v6);
  }
}

- (void)fetchAttachmentRecordsFilteredUsingPredicate:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
  if (v10)
  {
    if (v8) {
      IMInsertCodableObjectsToXPCDictionary();
    }
    xpc_dictionary_set_int64(v10, "limit", a4);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1AFBBCA80;
    v11[3] = &unk_1E5F8FB98;
    v11[4] = self;
    id v12 = v9;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:v10 action:33 responseHandler:v11];
  }
}

- (void)fetchAttachmentRecordsFilteredUsingPredicate:(id)a3 sortedUsingDescriptors:(id)a4 limit:(unint64_t)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  xpc_object_t v13 = xpc_dictionary_create(0, 0, 0);
  if (v13)
  {
    if (v10) {
      IMInsertCodableObjectsToXPCDictionary();
    }
    if (v11)
    {
      uint64_t v14 = [(IMDDatabaseLegacyXPCBridge *)self _xpcArrayWithCodableObjects:v11];
      xpc_dictionary_set_value(v13, "sortDescriptors", v14);
    }
    xpc_dictionary_set_int64(v13, "limit", a5);
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = sub_1AFBBCC78;
    v15[3] = &unk_1E5F8FB98;
    v15[4] = self;
    id v16 = v12;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:v13 action:34 responseHandler:v15];
  }
}

- (void)fetchDataForKey:(id)a3 completionHandler:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  v11[0] = 0;
  v11[1] = v11;
  v11[2] = 0x3032000000;
  v11[3] = sub_1AFBBA6EC;
  v11[4] = sub_1AFBBA6FC;
  id v12 = 0;
  v8[0] = (void (*)(void))MEMORY[0x1E4F143A8];
  v8[1] = (void (*)(void))3221225472;
  v8[2] = (void (*)(void))sub_1AFBBCE28;
  v8[3] = (void (*)(void))&unk_1E5F95800;
  id v10 = v11;
  id v7 = v6;
  id v9 = v7;
  __syncXPCIMDKVValueForKey_IPCAction(v8, (uint64_t)v5);

  _Block_object_dispose(v11, 8);
}

- (void)fetchInteger64ForKey:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    if (v6) {
      IMInsertNSStringsToXPCDictionary();
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1AFBBCF88;
    v9[3] = &unk_1E5F957D8;
    id v10 = v7;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:empty action:211 responseHandler:v9];
  }
}

- (void)storeData:(id)a3 forKey:(id)a4
{
}

- (void)moveMessageRecordsToRecoveryForMessageGUIDs:(id)a3 deleteDate:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty && [v8 count])
  {
    IMInsertArraysToXPCDictionary();
    IMInsertCodableObjectsToXPCDictionary();
    -[IMDDatabaseClient _sendAsyncXPCMessage:action:responseHandler:](self, "_sendAsyncXPCMessage:action:responseHandler:", empty, 226, &unk_1F084D418, v6, 0);
  }
}

- (void)moveMessageRecordsToRecoveryForChatRecordsWithGUIDs:(id)a3 deleteDate:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty && [v8 count])
  {
    IMInsertArraysToXPCDictionary();
    IMInsertCodableObjectsToXPCDictionary();
    -[IMDDatabaseClient _sendAsyncXPCMessage:action:responseHandler:](self, "_sendAsyncXPCMessage:action:responseHandler:", empty, 158, &unk_1F084C8D0, v6, 0);
  }
}

- (void)recoverMessageRecordsForChatRecordsWithGUIDs:(id)a3
{
  id v5 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty && [v5 count])
  {
    IMInsertArraysToXPCDictionary();
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 159, &unk_1F084D438, v5, 0);
  }
}

- (void)updateChatsSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4
{
  id v7 = a4;
  if ([v7 count])
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    IMInsertArraysToXPCDictionary();
    IMInsertIntsToXPCDictionary();
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 168, &unk_1F084C628, a3, 0);
  }
}

- (void)updateMessagesSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4
{
  id v7 = a4;
  if ([v7 count])
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    IMInsertArraysToXPCDictionary();
    IMInsertIntsToXPCDictionary();
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 200, &unk_1F084C4A8, a3, 0);
  }
}

- (void)updateMessagesSyncedSyndicationRangesForGUIDs:(id)a3 toStatus:(int64_t)a4
{
  id v7 = a3;
  if ([v7 count])
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    IMInsertArraysToXPCDictionary();
    IMInsertIntsToXPCDictionary();
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 201, &unk_1F084C060, a4, 0);
  }
}

- (void)updateAttachmentsSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4
{
  id v7 = a4;
  if ([v7 count])
  {
    xpc_object_t empty = xpc_dictionary_create_empty();
    IMInsertArraysToXPCDictionary();
    IMInsertIntsToXPCDictionary();
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 207, &unk_1F084C0C0, a3, 0);
  }
}

- (void)deleteRecoverableMessagesOlderThanDays:(int64_t)a3
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    id v6 = empty;
    IMInsertIntsToXPCDictionary();
    -[IMDDatabaseClient _sendAsyncXPCMessage:action:responseHandler:](self, "_sendAsyncXPCMessage:action:responseHandler:", v6, 227, &unk_1F084D0A0, a3, 0);
    xpc_object_t empty = v6;
  }
}

- (void)deleteJunkMessagesOlderThanDays:(int64_t)a3
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    id v6 = empty;
    IMInsertIntsToXPCDictionary();
    -[IMDDatabaseClient _sendAsyncXPCMessage:action:responseHandler:](self, "_sendAsyncXPCMessage:action:responseHandler:", v6, 238, &unk_1F084C4E8, a3, 0);
    xpc_object_t empty = v6;
  }
}

- (void)permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty && [v6 count])
  {
    IMInsertArraysToXPCDictionary();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1AFBBD694;
    v9[3] = &unk_1E5F8FB98;
    void v9[4] = self;
    id v10 = v7;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 160, v9, v6, 0);
  }
}

- (id)recoverableMessagesMetadataPendingCloudKitSaveWithLimit:(int64_t)a3 filter:(unint64_t)a4
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    IMInsertIntsToXPCDictionary();
    IMInsertIntsToXPCDictionary();
    uint64_t v10 = 0;
    id v11 = &v10;
    uint64_t v12 = 0x3032000000;
    xpc_object_t v13 = sub_1AFBBA6EC;
    uint64_t v14 = sub_1AFBBA6FC;
    id v15 = 0;
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1AFBBD898;
    v9[3] = &unk_1E5F8FBC0;
    void v9[4] = self;
    void v9[5] = &v10;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 229, v9, a4, 0);
    id v7 = (id)v11[5];
    _Block_object_dispose(&v10, 8);
  }
  else
  {
    id v7 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v7;
}

- (id)recoverableMessagesMetadataPendingCloudKitDeleteWithLimit:(int64_t)a3
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    IMInsertIntsToXPCDictionary();
    uint64_t v9 = 0;
    uint64_t v10 = &v9;
    uint64_t v11 = 0x3032000000;
    uint64_t v12 = sub_1AFBBA6EC;
    xpc_object_t v13 = sub_1AFBBA6FC;
    id v14 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1AFBBDA78;
    v8[3] = &unk_1E5F8FBC0;
    v8[4] = self;
    v8[5] = &v9;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 232, v8, a3, 0);
    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)clearRecoverableMessageTombStones
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:empty action:233 responseHandler:&unk_1F084C768];
  }
  else if (IMOSLoggingEnabled())
  {
    xpc_object_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Recently Deleted | Could not create xpc message. Not clearing message tombstones", v5, 2u);
    }
  }
}

- (void)updateRecoverableMessageSyncState:(int64_t)a3 forMessageRowID:(int64_t)a4 onPartIndex:(int64_t)a5
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    id v8 = empty;
    IMInsertIntsToXPCDictionary();
    IMInsertIntsToXPCDictionary();
    IMInsertIntsToXPCDictionary();
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", v8, 230, &unk_1F084D458, a5, 0);
    xpc_object_t empty = v8;
  }
}

- (void)updateRecoverableMessageSyncState:(int64_t)a3 forMessageGUIDs:(id)a4
{
  id v6 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    IMInsertIntsToXPCDictionary();
    IMInsertArraysToXPCDictionary();
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1AFBBDD54;
    v8[3] = &unk_1E5F95820;
    v8[4] = a3;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 240, v8, v6, 0);
  }
}

- (void)storeRecoverableMessagePartWithBody:(id)a3 forMessageWithGUID:(id)a4 deleteDate:(id)a5
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (v9 && [v9 length])
  {
    IMInsertNSStringsToXPCDictionary();
    IMInsertCodableObjectsToXPCDictionary();
    IMInsertCodableObjectsToXPCDictionary();
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 231, &unk_1F084D478, v8, 0);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v9;
      _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "IMDDatabaseClient | Early return: Recently Deleted:storeRecoverableMessagePartWithBody given messageGUID: %@", buf, 0xCu);
    }
  }
}

- (void)fetchCountOfRecordType:(unint64_t)a3 completionHandler:(id)a4
{
  id v6 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  id v8 = empty;
  if (empty)
  {
    xpc_dictionary_set_uint64(empty, "recordType", a3);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1AFBBE108;
    v10[3] = &unk_1E5F957D8;
    id v11 = v6;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:v8 action:245 responseHandler:v10];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Failed to create XPC dictionary", buf, 2u);
      }
    }
    (*((void (**)(id, void))v6 + 2))(v6, 0);
  }
}

- (void)fetchScheduledMessageRecordsForChatRecordWithGUID:(id)a3 limit:(unint64_t)a4 completionHandler:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    if (v8) {
      IMInsertNSStringsToXPCDictionary();
    }
    xpc_dictionary_set_int64(empty, "limit", a4);
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1AFBBE25C;
    v11[3] = &unk_1E5F8FB98;
    v11[4] = self;
    id v12 = v9;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:empty action:71 responseHandler:v11];
  }
}

- (id)scheduledMessagesMetadataPendingCloudKitDeleteWithLimit:(int64_t)a3
{
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    IMInsertIntsToXPCDictionary();
    uint64_t v9 = 0;
    id v10 = &v9;
    uint64_t v11 = 0x3032000000;
    id v12 = sub_1AFBBA6EC;
    xpc_object_t v13 = sub_1AFBBA6FC;
    id v14 = 0;
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1AFBBE440;
    v8[3] = &unk_1E5F8FBC0;
    v8[4] = self;
    void v8[5] = &v9;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 72, v8, a3, 0);
    id v6 = (id)v10[5];
    _Block_object_dispose(&v9, 8);
  }
  else
  {
    id v6 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)addScheduledMessageGUIDandCKRecordToDeleteFromCloudKit:(id)a3 recordID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty && [v6 length] && objc_msgSend(v7, "length"))
  {
    IMInsertNSStringsToXPCDictionary();
    IMInsertNSStringsToXPCDictionary();
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1AFBBE5E8;
    v9[3] = &unk_1E5F95848;
    id v10 = v6;
    id v11 = v7;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 73, v9, v7, 0);
  }
}

- (void)deleteTombstonedScheduledMessagesWithRecordIDs:(id)a3
{
  id v4 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    if ([v4 count]) {
      IMInsertArraysToXPCDictionary();
    }
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1AFBBE7AC;
    v6[3] = &unk_1E5F95870;
    id v7 = v4;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:empty action:74 responseHandler:v6];
  }
}

- (void)markMessageRecordsAsReadWithGUIDs:(id)a3
{
  id v4 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    IMInsertArraysToXPCDictionary();
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1AFBBE958;
    v6[3] = &unk_1E5F95870;
    id v7 = v4;
    -[IMDDatabaseClient _sendSyncXPCMessage:action:responseHandler:](self, "_sendSyncXPCMessage:action:responseHandler:", empty, 248, v6, v4, 0);
  }
}

- (void)sendLegacyXPCCommandWithObject:(id)a3 reply:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F1CA00] exceptionWithName:*MEMORY[0x1E4F1C3B8], @"IMDDatabaseClient should not fulfill this method, should use proxy directly!", 0 reason userInfo];
  objc_exception_throw(v7);
}

- (void)validateSpotlightClientStateWithCompletion:(id)a3
{
  id v4 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1AFBBEB58;
    v6[3] = &unk_1E5F957D8;
    id v7 = v4;
    [(IMDDatabaseClient *)self _sendAsyncXPCMessage:empty action:136 responseHandler:v6];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)fetchSpotlightClientStateWithCompletion:(id)a3
{
  id v4 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1AFBBECC8;
    v6[3] = &unk_1E5F957D8;
    id v7 = v4;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:empty action:137 responseHandler:v6];
  }
  else
  {
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)invalidateSpotlightClientStateVersioningWithCompletion:(id)a3
{
  id v4 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1AFBBEE54;
    v6[3] = &unk_1E5F957D8;
    id v7 = v4;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:empty action:138 responseHandler:v6];
  }
  else
  {
    (*((void (**)(id, void))v4 + 2))(v4, 0);
  }
}

- (void)fetchContactsForIdentifiers:(id)a3 completionHandler:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    if (v6) {
      IMInsertArraysToXPCDictionary();
    }
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1AFBBEFE0;
    v9[3] = &unk_1E5F8FB98;
    void v9[4] = self;
    id v10 = v7;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:empty action:250 responseHandler:v9];
  }
  else
  {
    (*((void (**)(id, void))v7 + 2))(v7, MEMORY[0x1E4F1CC08]);
  }
}

- (void)deleteAllDonationsForAppDeletionWithCompletion:(id)a3
{
  id v4 = a3;
  xpc_object_t empty = xpc_dictionary_create_empty();
  if (empty)
  {
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1AFBBF134;
    v6[3] = &unk_1E5F957D8;
    id v7 = v4;
    [(IMDDatabaseClient *)self _sendSyncXPCMessage:empty action:128 responseHandler:v6];
  }
}

@end