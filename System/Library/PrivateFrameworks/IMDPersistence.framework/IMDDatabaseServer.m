@interface IMDDatabaseServer
+ (id)sharedServer;
- (IMDRemoteDatabaseProtocol)database;
- (void)_asyncPersistenceBlock:(id)a3;
- (void)_authorizeOutgoingSandboxedResource:(id)a3 connection:(id)a4;
- (void)_respondWithAttachmentRecords:(id)a3 responseMessage:(id)a4 completionHandler:(id)a5;
- (void)_respondWithChatRecords:(id)a3 responseMessage:(id)a4 completionHandler:(id)a5;
- (void)_respondWithHandleRecords:(id)a3 responseMessage:(id)a4 completionHandler:(id)a5;
- (void)_respondWithMessageRecords:(id)a3 responseMessage:(id)a4 completionHandler:(id)a5;
- (void)_syncPersistenceBlock:(id)a3;
- (void)deleteAllDonationsForAppDeletion_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleDeleteAttachmentsDirectWithPredicate_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDAttachmentRecordCopyFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDAttachmentRecordCopySortedAttachmentsFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDAttachmentRecordsUpdateSyncStatusForGUIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDChatRecordCopyChatsFilteredUsingPredicate_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDChatRecordCopyChatsSortedByLastMessageDateAndFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDChatRecordCopyChatsWithAtLeastHandlesOnServiceWithStyle_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDChatRecordCopyChatsWithHandlesOnServiceWithDisplayNameGroupIDStyle_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDChatRecordCopyChatsWithIdentifier_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDChatRecordCopyChatsWithPinningIdentifier_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDChatRecordCopyDuplicateGroupChatRecords_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDChatRecordCopyGroupPhotoPaths_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDChatRecordCopySortedChatsFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDChatRecordLoadRecoverableMessages_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDChatRecordMoveMessagesToRecoverableMessage_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDChatRecordPermanentlyDeleteRecoverableMessagesInChatsWithGUIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDChatRecordRecoverMessages_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDChatRecordResolveInconsistentGUID_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDChatRecordsUpdateSyncStatusForGUIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDCoreSpotlightDeleteAttachment_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDCoreSpotlightFetchClientState_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDCoreSpotlightInvalidateSpotlightClientStateVersioning_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDCoreSpotlightValidateClientState_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDCountOfRecordType_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDDeleteDatabase_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDFetchContactsForIdentifiers_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDHandleRecordCopyHandlesFilteredUsingPredicate_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDHandleRecordCopySortedHandlesFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDKVIntegerForKey_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageDeleteTombstonedScheduledMessagesWithRecordIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordAddScheduledMessageGUIDandCKRecordToDeleteFromCloudKit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordClearUnsyncedRemovedRecoverableMessages_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordCopyAllUnreadMessages_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordCopyLastMessageForChatWithRowID_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordCopyMessageWithGUIDExcludingRecoverableMessages_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordCopyScheduledMessagesForChatGUIDToLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordCopyScheduledMessagesToDeleteFromCloudKitToLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordCopySortedMessagesForChatGUIDFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordDeleteJunkMessagesOlderThanDays_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordDeleteRecoverableMessagesOlderThanDays_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordLoadRecoverableMessagesPendingCloudKitDelete_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordLoadRecoverableMessagesPendingCloudKitUpdate_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordMarkGUIDsAsRead_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordMoveToRecoverableMessage_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordStoreRecoverableMessagePartBody_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordUpdateAttachmentSyndicationRanges_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordUpdateMessagesSyndicationRanges_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordUpdateRecoverableMessageSyncStateForMessageGUIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordUpdateRecoverableMessageSyncState_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordsUpdateSyncStatusForGUIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDMessageRecordsUpdateSyncedSyndicationRangesForGUIDsToStatus_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)handleIMDNotificationsPostSharePlayNotification_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
- (void)notifyFirstUnlockComplete_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6;
@end

@implementation IMDDatabaseServer

- (void)_respondWithChatRecords:(id)a3 responseMessage:(id)a4 completionHandler:(id)a5
{
  xpc_object_t xdict = a4;
  v8 = (void (**)(void))a5;
  v9 = [(IMDDatabaseLegacyXPCBridge *)self _xpcArrayWithChatRecords:a3];
  if (xdict && v9) {
    xpc_dictionary_set_value(xdict, "array_result", v9);
  }
  if (v8) {
    v8[2](v8);
  }
}

- (void)handleIMDChatRecordCopyChatsSortedByLastMessageDateAndFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB56030;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDChatRecordLoadRecoverableMessages_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB56794;
  v12[3] = &unk_1E5F8FCB0;
  v12[4] = self;
  id v13 = v8;
  id v14 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v12];
}

- (void)_syncPersistenceBlock:(id)a3
{
}

- (IMDRemoteDatabaseProtocol)database
{
  return +[IMDDatabase synchronousDatabase];
}

+ (id)sharedServer
{
  if (qword_1EB5ABA50 != -1) {
    dispatch_once(&qword_1EB5ABA50, &unk_1F084CC20);
  }
  v2 = (void *)qword_1EB5ABA58;
  return v2;
}

- (void)_asyncPersistenceBlock:(id)a3
{
}

- (void)_respondWithMessageRecords:(id)a3 responseMessage:(id)a4 completionHandler:(id)a5
{
  xpc_object_t xdict = a4;
  id v8 = (void (**)(void))a5;
  id v9 = [(IMDDatabaseLegacyXPCBridge *)self _xpcArrayWithMessageRecords:a3];
  if (xdict && v9) {
    xpc_dictionary_set_value(xdict, "array_result", v9);
  }
  if (v8) {
    v8[2](v8);
  }
}

- (void)_respondWithAttachmentRecords:(id)a3 responseMessage:(id)a4 completionHandler:(id)a5
{
  xpc_object_t xdict = a4;
  id v8 = (void (**)(void))a5;
  id v9 = [(IMDDatabaseLegacyXPCBridge *)self _xpcArrayWithAttachmentRecords:a3];
  if (xdict && v9) {
    xpc_dictionary_set_value(xdict, "array_result", v9);
  }
  if (v8) {
    v8[2](v8);
  }
}

- (void)_respondWithHandleRecords:(id)a3 responseMessage:(id)a4 completionHandler:(id)a5
{
  xpc_object_t xdict = a4;
  id v8 = (void (**)(void))a5;
  id v9 = [(IMDDatabaseLegacyXPCBridge *)self _xpcArrayWithHandleRecords:a3];
  if (xdict && v9) {
    xpc_dictionary_set_value(xdict, "array_result", v9);
  }
  if (v8) {
    v8[2](v8);
  }
}

- (void)_authorizeOutgoingSandboxedResource:(id)a3 connection:(id)a4
{
  id v5 = a3;
  [v5 authorizeForPID:xpc_connection_get_pid((xpc_connection_t)a4)];
}

- (void)handleIMDChatRecordCopyChatsFilteredUsingPredicate_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB7F9D4;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDChatRecordCopySortedChatsFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB7FB5C;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDChatRecordCopyChatsWithIdentifier_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB7FDAC;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDChatRecordCopyChatsWithPinningIdentifier_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB7FF20;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDChatRecordCopyChatsWithHandlesOnServiceWithDisplayNameGroupIDStyle_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB800F4;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDChatRecordCopyChatsWithAtLeastHandlesOnServiceWithStyle_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB80308;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDChatRecordCopyGroupPhotoPaths_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1AFB80548;
  v18[3] = &unk_1E5F8FC88;
  id v19 = v11;
  v20 = self;
  id v21 = v10;
  id v22 = v12;
  id v23 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v10;
  id v17 = v11;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v18];
}

- (void)handleIMDChatRecordCopyDuplicateGroupChatRecords_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB80810;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDChatRecordsUpdateSyncStatusForGUIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB8095C;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v12];
}

- (void)handleIMDChatRecordResolveInconsistentGUID_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB80AE0;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDMessageRecordsUpdateSyncStatusForGUIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB80CFC;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v12];
}

- (void)handleIMDMessageRecordsUpdateSyncedSyndicationRangesForGUIDsToStatus_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB80E60;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v12];
}

- (void)handleIMDMessageRecordCopyLastMessageForChatWithRowID_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB80FE4;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDMessageRecordCopySortedMessagesForChatGUIDFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB8126C;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDMessageRecordCopyAllUnreadMessages_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB814DC;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDMessageRecordCopyMessageWithGUIDExcludingRecoverableMessages_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB816DC;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDMessageRecordUpdateAttachmentSyndicationRanges_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB81940;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v12];
}

- (void)handleIMDMessageRecordUpdateMessagesSyndicationRanges_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB81AA4;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v12];
}

- (void)handleIMDMessageRecordCopyScheduledMessagesForChatGUIDToLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB81C28;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDMessageRecordCopyScheduledMessagesToDeleteFromCloudKitToLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB81E14;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDMessageRecordAddScheduledMessageGUIDandCKRecordToDeleteFromCloudKit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB81F98;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v12];
}

- (void)handleIMDMessageDeleteTombstonedScheduledMessagesWithRecordIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB82104;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v12];
}

- (void)handleIMDMessageRecordMarkGUIDsAsRead_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB82248;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v12];
}

- (void)handleIMDMessageRecordMoveToRecoverableMessage_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB8238C;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _asyncPersistenceBlock:v12];
}

- (void)handleIMDChatRecordMoveMessagesToRecoverableMessage_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB8250C;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _asyncPersistenceBlock:v12];
}

- (void)handleIMDChatRecordRecoverMessages_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB8268C;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _asyncPersistenceBlock:v12];
}

- (void)handleIMDMessageRecordDeleteRecoverableMessagesOlderThanDays_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB827D0;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _asyncPersistenceBlock:v12];
}

- (void)handleIMDMessageRecordDeleteJunkMessagesOlderThanDays_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB82918;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _asyncPersistenceBlock:v12];
}

- (void)handleIMDChatRecordPermanentlyDeleteRecoverableMessagesInChatsWithGUIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB82A80;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _asyncPersistenceBlock:v15];
}

- (void)handleIMDMessageRecordLoadRecoverableMessagesPendingCloudKitUpdate_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB82CDC;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _asyncPersistenceBlock:v15];
}

- (void)handleIMDMessageRecordLoadRecoverableMessagesPendingCloudKitDelete_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB82E98;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _asyncPersistenceBlock:v15];
}

- (void)handleIMDMessageRecordClearUnsyncedRemovedRecoverableMessages_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1AFB82FF0;
  v9[3] = &unk_1E5F8FD28;
  v9[4] = self;
  id v10 = v7;
  id v8 = v7;
  [(IMDDatabaseServer *)self _asyncPersistenceBlock:v9];
}

- (void)handleIMDMessageRecordUpdateRecoverableMessageSyncState_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB83114;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _asyncPersistenceBlock:v12];
}

- (void)handleIMDMessageRecordUpdateRecoverableMessageSyncStateForMessageGUIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB83298;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _asyncPersistenceBlock:v12];
}

- (void)handleIMDMessageRecordStoreRecoverableMessagePartBody_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB833FC;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _asyncPersistenceBlock:v12];
}

- (void)handleIMDNotificationsPostSharePlayNotification_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v7 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1AFB83584;
  v9[3] = &unk_1E5F8D508;
  id v10 = v7;
  id v11 = self;
  id v8 = v7;
  [(IMDDatabaseServer *)self _asyncPersistenceBlock:v9];
}

- (void)notifyFirstUnlockComplete_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v13 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = (void (**)(void))a6;
  v11[2]();
  if (IMDPersistenceProtectionMerge_CurrentlyUsingUnprotectedDatabase())
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Database told that first unlock is complete - exiting.", buf, 2u);
      }
    }
    exit(0);
  }
}

- (void)handleIMDCountOfRecordType_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB8383C;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDHandleRecordCopyHandlesFilteredUsingPredicate_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB83A40;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDHandleRecordCopySortedHandlesFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB83BC8;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDAttachmentRecordsUpdateSyncStatusForGUIDs_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB83DF8;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v12];
}

- (void)handleIMDCoreSpotlightDeleteAttachment_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB83F5C;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _asyncPersistenceBlock:v12];
}

- (void)handleDeleteAttachmentsDirectWithPredicate_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a4;
  id v9 = a6;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB840C0;
  v12[3] = &unk_1E5F8FCB0;
  id v13 = v8;
  id v14 = self;
  id v15 = v9;
  id v10 = v9;
  id v11 = v8;
  [(IMDDatabaseServer *)self _asyncPersistenceBlock:v12];
}

- (void)handleIMDAttachmentRecordCopyFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB84238;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDAttachmentRecordCopySortedAttachmentsFilteredUsingPredicateWithLimit_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB84438;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDKVIntegerForKey_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB84688;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDCoreSpotlightValidateClientState_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v7 = a5;
  id v8 = a6;
  id v9 = sub_1AFBD517C();
  id v12 = v8;
  id v10 = v8;
  id v11 = v7;
  xpc_dictionary_handoff_reply();
}

- (void)handleIMDCoreSpotlightFetchClientState_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v7 = a5;
  id v8 = a6;
  id v9 = dispatch_get_global_queue(2, 0);
  id v12 = v8;
  id v10 = v8;
  id v11 = v7;
  xpc_dictionary_handoff_reply();
}

- (void)handleIMDCoreSpotlightInvalidateSpotlightClientStateVersioning_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v7 = a5;
  id v8 = a6;
  id v9 = sub_1AFBD517C();
  id v12 = v8;
  id v10 = v8;
  id v11 = v7;
  xpc_dictionary_handoff_reply();
}

- (void)deleteAllDonationsForAppDeletion_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v8 = a5;
  id v9 = a6;
  id v10 = [(IMDDatabaseServer *)self database];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1AFB84EE4;
  v13[3] = &unk_1E5F8E6B0;
  id v14 = v8;
  id v15 = v9;
  id v11 = v9;
  id v12 = v8;
  [v10 deleteAllDonationsForAppDeletionWithCompletion:v13];
}

- (void)handleIMDFetchContactsForIdentifiers_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v9 = a4;
  id v10 = a5;
  id v11 = a6;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1AFB8503C;
  v15[3] = &unk_1E5F8FBE8;
  id v16 = v9;
  id v17 = self;
  id v18 = v10;
  id v19 = v11;
  id v12 = v11;
  id v13 = v10;
  id v14 = v9;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v15];
}

- (void)handleIMDDeleteDatabase_IPCActionWithXPCConnection:(id)a3 requestMessage:(id)a4 responseMessage:(id)a5 completionHandler:(id)a6
{
  id v7 = a6;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1AFB852EC;
  v9[3] = &unk_1E5F8FDF0;
  id v10 = v7;
  id v8 = v7;
  [(IMDDatabaseServer *)self _syncPersistenceBlock:v9];
}

@end