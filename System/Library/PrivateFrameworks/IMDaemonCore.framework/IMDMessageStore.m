@interface IMDMessageStore
+ (BOOL)_updateCacheForMessageGUID:(id)a3 fromMessage:(id)a4 toMessage:(id)a5 updateLastMessage:(BOOL)a6 calculateUnreadCount:(BOOL)a7;
+ (IMDMessageStore)sharedInstance;
+ (id)_missingMessageReadReceiptCache;
+ (void)_displayDatabaseFullAlert;
+ (void)databaseFull;
+ (void)databaseNoLongerFull;
- (BOOL)_checkIfRecord:(id)a3 hasBadChatIDForMessageGUID:(id)a4;
- (BOOL)_hasMessagesWithGUIDs:(id)a3;
- (BOOL)_isUnreadLoggingRateLimited;
- (BOOL)_isValidPhoneNumber:(id)a3 forCountryCode:(id)a4;
- (BOOL)_itemClassShouldUpdateTransferForItem:(id)a3;
- (BOOL)_preflightLogAllUnreadMessages;
- (BOOL)_shouldMarkAllMessagesAsNeedingSync;
- (BOOL)_shouldUseBadgeUtilities;
- (BOOL)canStoreItem:(id)a3 onService:(id)a4;
- (BOOL)canStoreMessage:(id)a3 onService:(id)a4;
- (BOOL)hasStoredMessageWithGUID:(id)a3;
- (BOOL)isAttachmentReferencedByMessage:(id)a3;
- (BOOL)isSuppressDatabaseUpdates;
- (BOOL)markMessageGUIDUnread:(id)a3;
- (BOOL)popReadReceiptForMissingGUID:(id)a3;
- (BOOL)updateSyndicatedMessageWithMessageItem:(id)a3 newRange:(id)a4;
- (BOOL)wasMessageDeduplicatedWithGUID:(id)a3;
- (CKRecordZoneID)recordZoneID;
- (IMDMessageStore)init;
- (IMStateCaptureAssistant)stateCaptureAssistant;
- (NSMutableDictionary)visitedChats;
- (NSString)modificationStamp;
- (_IMDHandleRecordStruct)_copyHandle:(id)a3 onService:(id)a4;
- (id)_chatRegistrySharedInstance;
- (id)_chatsForMessageGUID:(id)a3 enableVerboseLogging:(BOOL)a4;
- (id)_chatsForMessageIdentifier:(int64_t)a3;
- (id)_cleanupPhoneNumber:(id)a3;
- (id)_fileTransferCenter;
- (id)_fileTransferGUIDsInMessageBody:(id)a3;
- (id)_handleIDsForChat:(id)a3;
- (id)_handleStringsForChat:(id)a3;
- (id)_itemsForMessageRecords:(id)a3 handleID:(id)a4 useAttachmentCache:(BOOL)a5 shouldLoadAttachments:(BOOL)a6 reverseOrder:(BOOL)a7;
- (id)_itemsWithAssociatedGUID:(id)a3 shouldLoadAttachments:(BOOL)a4;
- (id)_itemsWithGUIDs:(id)a3;
- (id)_itemsWithHandles:(id)a3 onServices:(id)a4 messageGUID:(id)a5 threadIdentifier:(id)a6 limit:(unint64_t)a7 onlyMessages:(BOOL)a8;
- (id)_itemsWithHandlesBeforeAndAfterGUID:(id)a3 handles:(id)a4 onServices:(id)a5 numberOfMessagesBefore:(unint64_t)a6 numberOfMessagesAfter:(unint64_t)a7 threadIdentifier:(id)a8 hasMessagesBefore:(BOOL *)a9 hasMessagesAfter:(BOOL *)a10;
- (id)_itemsWithRoomNames:(id)a3 onServices:(id)a4 messageGUID:(id)a5 threadIdentifier:(id)a6 limit:(unint64_t)a7 onlyMessages:(BOOL)a8;
- (id)_lastUnreadDumpDate;
- (id)_logAllUnreadMessages;
- (id)_messageItemsForMessageRecords:(id)a3 handleID:(id)a4 useAttachmentCache:(BOOL)a5 shouldLoadAttachments:(BOOL)a6 reverseOrder:(BOOL)a7;
- (id)_messagesPendingUpdateT1ToCloudKitWithLimit:(int64_t)a3 attemptCount:(unint64_t)a4;
- (id)_messagesPendingUpdateT2ToCloudKitWithLimit:(int64_t)a3 attemptCount:(unint64_t)a4;
- (id)_messagesPendingUpdateT3ToCloudKitWithLimit:(int64_t)a3 attemptCount:(unint64_t)a4;
- (id)_messagesThatNeedSyncWithCloudKitWithFilter:(unint64_t)a3 limit:(int64_t)a4 attemptCount:(unint64_t)a5;
- (id)_unreadMessagesWithHandles:(id)a3 onServices:(id)a4 limit:(unint64_t)a5 fallbackGUID:(id)a6;
- (id)_unreadMessagesWithRoomNames:(id)a3 onServices:(id)a4 limit:(unint64_t)a5 fallbackGUID:(id)a6;
- (id)_updateAssociatedMessageItemsFromMessage:(id)a3 toMessage:(id)a4;
- (id)addEditHistoryToMessage:(id)a3 editedPartIndex:(int64_t)a4 editType:(unint64_t)a5 previousMessage:(id)a6;
- (id)attachmentsWithHandles:(id)a3 onServices:(id)a4;
- (id)attachmentsWithRoomNames:(id)a3 onServices:(id)a4;
- (id)batchOfRecordIDsToDeleteWithLimit:(int64_t)a3 error:(id *)a4;
- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5;
- (id)chatForMessage:(id)a3;
- (id)chatForMessageGUID:(id)a3;
- (id)chatForMessageGUID:(id)a3 enableVerboseLogging:(BOOL)a4;
- (id)chatForMessageIdentifier:(int64_t)a3;
- (id)chatsForMessage:(id)a3;
- (id)chatsForMessageGUID:(id)a3;
- (id)cleanUnformattedPhoneNumber:(id)a3 countryCode:(id)a4;
- (id)copyMessagesThatNeedToBeDeletedInCloudKitWithLimit:(unint64_t)a3;
- (id)deleteMessageGUIDs:(id)a3;
- (id)deleteMessageGUIDs:(id)a3 inChat:(id)a4;
- (id)deleteMessagesWithChatIdentifiers:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5;
- (id)deleteMessagesWithChatIdentifiers:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 completion:(id)a6;
- (id)deleteMessagesWithReplaceMessageID:(int)a3 fromHandle:(id)a4 onService:(id)a5;
- (id)existingChatForMessageGUID:(id)a3;
- (id)existingMessageSimilarToMessage:(id)a3 skipServices:(id)a4 skipGUIDs:(id)a5 withinTimeInterval:(double)a6 participants:(id)a7;
- (id)existingSOSMessageSimilarToMessage:(id)a3 matchingService:(id)a4 withinTimeInterval:(double)a5;
- (id)frequentRepliesForForChatIdentifiers:(id)a3 onServices:(id)a4 limit:(unint64_t)a5;
- (id)itemWithGUID:(id)a3;
- (id)itemsWithHandles:(id)a3 onServices:(id)a4 limit:(unint64_t)a5;
- (id)itemsWithHandles:(id)a3 onServices:(id)a4 messageGUID:(id)a5 limit:(unint64_t)a6;
- (id)itemsWithHandles:(id)a3 onServices:(id)a4 messageGUID:(id)a5 numberOfMessagesBefore:(unint64_t)a6 numberOfMessagesAfter:(unint64_t)a7 threadIdentifier:(id)a8 hasMessagesBefore:(BOOL *)a9 hasMessagesAfter:(BOOL *)a10;
- (id)itemsWithHandles:(id)a3 onServices:(id)a4 messageGUID:(id)a5 threadIdentifier:(id)a6 limit:(unint64_t)a7;
- (id)itemsWithRoomNames:(id)a3 onServices:(id)a4 limit:(unint64_t)a5;
- (id)itemsWithRoomNames:(id)a3 onServices:(id)a4 messageGUID:(id)a5 limit:(unint64_t)a6;
- (id)itemsWithRoomNames:(id)a3 onServices:(id)a4 messageGUID:(id)a5 threadIdentifier:(id)a6 limit:(unint64_t)a7;
- (id)lastIncomingMessageForChatWithIdentifier:(id)a3 chatStyle:(unsigned __int8)a4 onService:(id)a5;
- (id)lastMessageForChatWithRowID:(int64_t)a3;
- (id)lastMessageWithHandles:(id)a3 onServices:(id)a4;
- (id)lastMessageWithRoomNames:(id)a3 onServices:(id)a4;
- (id)lastTUConversationItemForChat:(id)a3;
- (id)markMessagesAsReadWithChatGUIDs:(id)a3 upToGUID:(id)a4 readDate:(id)a5 fromMe:(BOOL)a6;
- (id)markMessagesAsReadWithIdentifiers:(id)a3 onServices:(id)a4 chatStyle:(unsigned __int8)a5 upToGUID:(id)a6 readDate:(id)a7 fromMe:(BOOL)a8;
- (id)messageActionItemsForOriginalMessageGUID:(id)a3;
- (id)messageForAttachmentGUID:(id)a3;
- (id)messageHistorySummaryForDateInterval:(id)a3 chatIdentifiers:(id)a4 chatStyle:(unsigned __int8)a5 services:(id)a6;
- (id)messageRecordsToUploadToCloudKitWithFilter:(unint64_t)a3 limit:(int64_t)a4;
- (id)messageWithGUID:(id)a3;
- (id)messageWithGUID:(id)a3 registerAttachments:(BOOL)a4;
- (id)messageWithReplaceMessageID:(int)a3 fromHandle:(id)a4 onService:(id)a5;
- (id)messagesInChat:(id)a3 earliestDate:(id)a4 limit:(unint64_t)a5;
- (id)messagesPendingUpdateT1ToCloudKitWithLimit:(int64_t)a3;
- (id)messagesPendingUpdateT2ToCloudKitWithLimit:(int64_t)a3;
- (id)messagesPendingUpdateT3ToCloudKitWithLimit:(int64_t)a3;
- (id)messagesThatNeedSyncWithCloudKitWithFilter:(unint64_t)a3 limit:(int64_t)a4;
- (id)messagesWithAssociatedGUID:(id)a3;
- (id)messagesWithAssociatedGUID:(id)a3 shouldLoadAttachments:(BOOL)a4;
- (id)messagesWithGUIDs:(id)a3;
- (id)messagesWithReplyToGUID:(id)a3;
- (id)notificationContext;
- (id)oldestMessageDateForChatIdentifiers:(id)a3 chatStyle:(unsigned __int8)a4 services:(id)a5;
- (id)recordIDsAndGUIDsToDeleteWithLimit:(int64_t)a3;
- (id)recordZoneIDForFilter:(unint64_t)a3;
- (id)replaceMessageAcknowledgmentsWithNewMessageAcknowledgment:(id)a3 associatedMessageGUID:(id)a4 sender:(id)a5;
- (id)scheduledMessagesBatchFetcher;
- (id)scheduledMessagesBatchFetcherForChat:(id)a3;
- (id)scheduledMessagesBatchFetcherForSyncState:(int64_t)a3;
- (id)sortedMessageItemsWithFallbackHash:(id)a3 inChat:(id)a4 limit:(unint64_t)a5;
- (id)stateDictionaryForDiagnosticsRequest;
- (id)storeEditedMessage:(id)a3 editedPartIndex:(int64_t)a4 editType:(unint64_t)a5 previousMessage:(id)a6 chat:(id)a7 updatedAssociatedMessageItems:(id *)a8;
- (id)storeEditedMessage:(id)a3 editedPartIndexes:(id)a4 editType:(unint64_t)a5 previousMessage:(id)a6 chat:(id)a7 updatedAssociatedMessageItems:(id *)a8;
- (id)storeItem:(id)a3 forceReplace:(BOOL)a4;
- (id)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 flagMask:(unint64_t)a7;
- (id)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 flagMask:(unint64_t)a7 updateMessageCache:(BOOL)a8 calculateUnreadCount:(BOOL)a9;
- (id)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 flagMask:(unint64_t)a7 updateMessageCache:(BOOL)a8 calculateUnreadCount:(BOOL)a9 reindexMessage:(BOOL)a10;
- (id)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 flagMask:(unint64_t)a7 updateMessageCache:(BOOL)a8 calculateUnreadCount:(BOOL)a9 reindexMessage:(BOOL)a10 isCloudImport:(BOOL)a11;
- (id)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 flagMask:(unint64_t)a7 updateMessageCache:(BOOL)a8 calculateUnreadCount:(BOOL)a9 reindexMessage:(BOOL)a10 isCloudImport:(BOOL)a11 isIncomingMessage:(BOOL)a12 didReplaceBlock:(id)a13;
- (id)storeRepositionedStickerLocally:(id)a3;
- (id)storeRepositionedStickerWithMetadata:(id)a3 fileTransferGUID:(id)a4 repositioningFromLocalChange:(BOOL)a5;
- (id)syncTokenStore;
- (id)unreadMessagesWithHandles:(id)a3 onServices:(id)a4 limit:(unint64_t)a5 fallbackGUID:(id)a6;
- (id)unreadMessagesWithRoomNames:(id)a3 onServices:(id)a4 limit:(unint64_t)a5 fallbackGUID:(id)a6;
- (id)updateSyndicatedMessageWithMessageGUID:(id)a3 newRange:(id)a4;
- (id)updateSyndicatedMessageWithSyndicationMessageAction:(id)a3;
- (id)updatedMessagesForMessages:(id)a3;
- (int64_t)_calculateUnreadMessagesCountFilteredByFocus:(BOOL)a3 filteredByAssistiveAccess:(BOOL)a4;
- (int64_t)lastFailedMessageDate;
- (int64_t)lastNotifiedUnreadCount;
- (int64_t)lastSyncedMessageRowID;
- (int64_t)unreadMessagesCount;
- (void)__postDBUpdate;
- (void)_deleteMessagesWithGUIDs:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 onServices:(id)a6 batchNumber:(unint64_t)a7 completion:(id)a8;
- (void)_fixupStoringMessageIfNecessaryWithMessage:(id)a3;
- (void)_hasMarkedAllMessagesAsNeedingSync;
- (void)_markAllUnsuccessFullSyncMessagesAsNeedingSync;
- (void)_needsToMarkAllMessagesAsNeedingSync;
- (void)_notifyWidgetKitTimeline:(int64_t)a3;
- (void)_performBlock:(id)a3 afterDelay:(double)a4;
- (void)_postDBUpdate;
- (void)_resetSyncStateForMessageWithGUID:(id)a3 toState:(int64_t)a4;
- (void)_setLastUnreadDumpDate:(id)a3;
- (void)_setLastUnreadDumpToNow;
- (void)_storeAttachmentsForMessage:(id)a3;
- (void)_suppressDBUpdateTimerFired;
- (void)_updateModificationDate;
- (void)addMissingMessageReadReceipt:(id)a3;
- (void)cleanseAttachments;
- (void)clearLocalSyncState:(unint64_t)a3;
- (void)clearMessagesTombStoneTable;
- (void)clearTombstonesForRecordIDs:(id)a3;
- (void)databaseChatSpamUpdated:(id)a3;
- (void)dealloc;
- (void)deleteMessagesFromTombStoneTableWithRecordIDs:(id)a3;
- (void)enumerateMessagesToRelayOnService:(id)a3 usingBlock:(id)a4;
- (void)focusStateDidChange;
- (void)legacyImport:(id)a3;
- (void)loadConsumedSessionPayloadsForItems:(id)a3;
- (void)markAllMessagesAsNeedingCloudKitSync;
- (void)markMessageAsCleanWithROWID:(int64_t)a3;
- (void)markMessageAsDeduplicated:(id)a3;
- (void)markMessageAsIgnoreButNeedingSyncWithROWID:(int64_t)a3;
- (void)performInitialHousekeeping;
- (void)postCountChanges;
- (void)postUrgentNotificationsForMessageGUIDs:(id)a3;
- (void)rebuildLastFailedMessageDate;
- (void)rebuildUnreadMessageCount;
- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5;
- (void)recordUpdateSucceededWithRecord:(id)a3;
- (void)registerTransfersWithGUIDs:(id)a3 forMessageGUID:(id)a4;
- (void)resetLocalSyncStateIfAppropriate;
- (void)resolveUnformattedRepresentationsForHandles:(id)a3 onService:(id)a4 message:(id)a5 completionBlock:(id)a6;
- (void)retractPostedNotificationsForMessageGUIDs:(id)a3;
- (void)retractPostedNotificationsForMessagesMatchingChatGUIDs:(id)a3;
- (void)setLastNotifiedUnreadCount:(int64_t)a3;
- (void)setModificationStamp:(id)a3;
- (void)setStateCaptureAssistant:(id)a3;
- (void)setSuppressDatabaseUpdates:(BOOL)a3;
- (void)setVisitedChats:(id)a3;
- (void)signalUnreadChangeForHandle:(id)a3;
- (void)updateFileTransfer:(id)a3;
- (void)updatePostedNotificationsForMessageGUIDs:(id)a3;
- (void)updateStamp;
- (void)updateUnformattedID:(id)a3 forBuddyID:(id)a4 onService:(id)a5;
@end

@implementation IMDMessageStore

+ (IMDMessageStore)sharedInstance
{
  if (qword_1EBE2B868 != -1) {
    dispatch_once(&qword_1EBE2B868, &unk_1F3391360);
  }
  v2 = (void *)qword_1EBE2B9A0;

  return (IMDMessageStore *)v2;
}

- (NSString)modificationStamp
{
  return (NSString *)objc_getProperty(self, a2, 8, 1);
}

- (int64_t)unreadMessagesCount
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  if (self->_cachedUnreadMessageCount)
  {
    if (IMOSLoggingEnabled())
    {
      v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        cachedUnreadMessageCount = self->_cachedUnreadMessageCount;
        int v21 = 138412290;
        v22 = cachedUnreadMessageCount;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Returning _cachedUnreadMessageCount %@", (uint8_t *)&v21, 0xCu);
      }
    }
    return [(NSNumber *)self->_cachedUnreadMessageCount longLongValue];
  }
  else
  {
    v6 = [MEMORY[0x1E4F6E788] sharedManager];
    uint64_t v7 = [v6 shouldFilterUnreadMessageCount];

    v8 = [MEMORY[0x1E4F6E5D8] sharedManager];
    uint64_t v9 = [v8 shouldFilterIncomingMessages];

    int v10 = IMOSLoggingEnabled();
    if ((v7 | v9) == 1)
    {
      if (v10)
      {
        v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          v12 = @"NO";
          if (v7) {
            v13 = @"YES";
          }
          else {
            v13 = @"NO";
          }
          if (v9) {
            v12 = @"YES";
          }
          int v21 = 138412546;
          v22 = v13;
          __int16 v23 = 2112;
          v24 = v12;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Calculating unread message count by focus [%@] and/or by assistive access [%@].", (uint8_t *)&v21, 0x16u);
        }
      }
      uint64_t v14 = [(IMDMessageStore *)self _calculateUnreadMessagesCountFilteredByFocus:v7 filteredByAssistiveAccess:v9];
    }
    else
    {
      if (v10)
      {
        v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Counting all unread messages.", (uint8_t *)&v21, 2u);
        }
      }
      uint64_t v14 = IMDMessageRecordCountAllUnreadMessages();
    }
    int64_t v5 = v14;
    v16 = (NSNumber *)[objc_alloc(NSNumber) initWithLongLong:v14];
    v17 = self->_cachedUnreadMessageCount;
    self->_cachedUnreadMessageCount = v16;

    if (IMOSLoggingEnabled())
    {
      v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        v19 = self->_cachedUnreadMessageCount;
        int v21 = 138412290;
        v22 = v19;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Computed _cachedUnreadMessageCount %@", (uint8_t *)&v21, 0xCu);
      }
    }
  }
  return v5;
}

- (int64_t)lastFailedMessageDate
{
  cachedLastint64_t FailedMessageDate = self->_cachedLastFailedMessageDate;
  if (cachedLastFailedMessageDate)
  {
    return [(NSNumber *)cachedLastFailedMessageDate longLongValue];
  }
  else
  {
    int64_t FailedMessageDate = IMDMessageRecordLastFailedMessageDate();
    v6 = (NSNumber *)[objc_alloc(NSNumber) initWithLongLong:FailedMessageDate];
    uint64_t v7 = self->_cachedLastFailedMessageDate;
    self->_cachedLastint64_t FailedMessageDate = v6;

    return FailedMessageDate;
  }
}

- (id)stateDictionaryForDiagnosticsRequest
{
  v6[1] = *MEMORY[0x1E4F143B8];
  int64_t v5 = @"allUnreadMessages";
  v2 = [(IMDMessageStore *)self _logAllUnreadMessages];
  v6[0] = v2;
  v3 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];

  return v3;
}

- (id)_lastUnreadDumpDate
{
  return (id)IMGetCachedDomainValueForKey();
}

- (void)_setLastUnreadDumpDate:(id)a3
{
}

- (BOOL)_isUnreadLoggingRateLimited
{
  v2 = [(IMDMessageStore *)self _lastUnreadDumpDate];
  v3 = v2;
  if (v2)
  {
    [v2 timeIntervalSinceNow];
    BOOL v5 = fabs(v4) < 3600.0;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (void)_setLastUnreadDumpToNow
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(IMDMessageStore *)self _setLastUnreadDumpDate:v3];
}

- (BOOL)_preflightLogAllUnreadMessages
{
  if ([(IMDMessageStore *)self _isUnreadLoggingRateLimited])
  {
    int v3 = IMOSLoggingEnabled();
    if (v3)
    {
      double v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        __int16 v14 = 0;
        BOOL v5 = "Not logging all unread messages because we have already logged in the past hour.";
        v6 = (uint8_t *)&v14;
LABEL_20:
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, v5, v6, 2u);
        goto LABEL_21;
      }
      goto LABEL_21;
    }
  }
  else
  {
    if (!sub_1D96B483C() || !sub_1D96B4734()) {
      goto LABEL_17;
    }
    id v15 = 0;
    char v7 = [sub_1D96B4734() isSysdiagnoseInProgressWithError:&v15];
    id v8 = v15;
    if (v8)
    {
      uint64_t v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1D98FE340((uint64_t)v8, v9);
      }
    }
    if (v7)
    {
      [(IMDMessageStore *)self _setLastUnreadDumpToNow];
      if (IMOSLoggingEnabled())
      {
        int v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v12 = 0;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Proceeding with logging all unread messages", v12, 2u);
        }
      }
      LOBYTE(v3) = 1;
    }
    else
    {
LABEL_17:
      int v3 = IMOSLoggingEnabled();
      if (v3)
      {
        double v4 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          BOOL v5 = "Not logging all unread messages because sysdiagnosed is not running.";
          v6 = buf;
          goto LABEL_20;
        }
LABEL_21:

        LOBYTE(v3) = 0;
      }
    }
  }
  return v3;
}

- (id)_logAllUnreadMessages
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  if ([(IMDMessageStore *)self _preflightLogAllUnreadMessages])
  {
    uint64_t v28 = 0;
    v29 = &v28;
    uint64_t v30 = 0x3032000000;
    v31 = sub_1D96B470C;
    v32 = sub_1D96B471C;
    id v33 = 0;
    v2 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
    int v3 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", *MEMORY[0x1E4F6CD78], 2);
    v27[0] = MEMORY[0x1E4F143A8];
    v27[1] = 3221225472;
    v27[2] = sub_1D96B4724;
    v27[3] = &unk_1E6B73420;
    v27[4] = &v28;
    [v2 fetchUnreadMessageRecordsForChatsFilteredUsingPredicate:v3 limit:100 completionHandler:v27];

    double v4 = [MEMORY[0x1E4F1CA60] dictionary];
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id obj = (id)v29[5];
    uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v34 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v24 != v6) {
            objc_enumerationMutation(obj);
          }
          id v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v9 = [v8 chatRecord];
          uint64_t v10 = [v9 guid];
          v11 = (void *)v10;
          if (v10) {
            v12 = (__CFString *)v10;
          }
          else {
            v12 = @"nilChatGUID";
          }
          v13 = v12;

          __int16 v14 = [v4 objectForKeyedSubscript:v13];
          id v15 = v14;
          if (v14) {
            id v16 = v14;
          }
          else {
            id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          v17 = v16;

          uint64_t v18 = [v8 guid];
          v19 = (void *)v18;
          if (v18) {
            v20 = (__CFString *)v18;
          }
          else {
            v20 = @"nilMessageGUID";
          }
          [v17 addObject:v20];

          [v4 setObject:v17 forKey:v13];
        }
        uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v34 count:16];
      }
      while (v5);
    }

    _Block_object_dispose(&v28, 8);
  }
  else
  {
    double v4 = (void *)MEMORY[0x1E4F1CC08];
  }

  return v4;
}

- (id)syncTokenStore
{
  if (qword_1EA8CA520 != -1) {
    dispatch_once(&qword_1EA8CA520, &unk_1F33910E0);
  }
  v2 = (void *)qword_1EA8CA518;

  return v2;
}

- (CKRecordZoneID)recordZoneID
{
  v2 = +[IMDRecordZoneManager sharedInstance];
  int v3 = [v2 messageRecordZoneID];

  return (CKRecordZoneID *)v3;
}

- (id)recordZoneIDForFilter:(unint64_t)a3
{
  double v4 = +[IMDRecordZoneManager sharedInstance];
  uint64_t v5 = v4;
  if (a3 == 4) {
    [v4 chatBotMessageRecordZoneID];
  }
  else {
  uint64_t v6 = [v4 messageRecordZoneID];
  }

  return v6;
}

- (void)resetLocalSyncStateIfAppropriate
{
  if ([(IMDMessageStore *)self _shouldMarkAllMessagesAsNeedingSync])
  {
    [(IMDMessageStore *)self clearLocalSyncState:3];
    [(IMDMessageStore *)self _hasMarkedAllMessagesAsNeedingSync];
  }
}

- (void)clearLocalSyncState:(unint64_t)a3
{
  int v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      v7[0] = 67109120;
      v7[1] = v3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Clearing local messages sync state, flags 0x%x", (uint8_t *)v7, 8u);
    }
  }
  if (v3)
  {
    uint64_t v6 = [(IMDMessageStore *)self syncTokenStore];
    [v6 persistToken:0 forKey:@"messagesChangeToken"];
  }
  if ((v3 & 2) != 0)
  {
    [(IMDMessageStore *)self markAllMessagesAsNeedingCloudKitSync];
  }
  else if ((v3 & 0x10) != 0)
  {
    [(IMDMessageStore *)self _needsToMarkAllMessagesAsNeedingSync];
  }
}

- (void)_markAllUnsuccessFullSyncMessagesAsNeedingSync
{
}

- (void)_needsToMarkAllMessagesAsNeedingSync
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v2 setBool:0 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF38]];
}

- (BOOL)_shouldMarkAllMessagesAsNeedingSync
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
    int v4 = [v5 getBoolFromDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF38]] ^ 1;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      char v7 = @"NO";
      if (v4) {
        char v7 = @"YES";
      }
      int v9 = 138412290;
      uint64_t v10 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "_shouldMarkAllMessagesAsNeedingSync %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return v4;
}

- (void)_hasMarkedAllMessagesAsNeedingSync
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  [v2 setBool:1 forDomain:*MEMORY[0x1E4F6CF00] forKey:*MEMORY[0x1E4F6CF38]];
}

- (id)batchOfRecordsToWriteWithFilter:(unint64_t)a3 limit:(int64_t)a4 error:(id *)a5
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v7 = -[IMDMessageStore messagesThatNeedSyncWithCloudKitWithFilter:limit:](self, "messagesThatNeedSyncWithCloudKitWithFilter:limit:", a3, a4, a5);
  v37 = self;
  v41 = [(IMDMessageStore *)self recordZoneIDForFilter:a3];
  uint64_t v8 = +[IMDCKRecordSaltManager sharedInstance];
  v40 = [v8 cachedSalt];

  id v36 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v39 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v7;
  uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
  if (v9)
  {
    uint64_t v42 = *(void *)v44;
    *(void *)&long long v10 = 138412290;
    long long v35 = v10;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v44 != v42) {
          objc_enumerationMutation(obj);
        }
        v12 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        v13 = (void *)MEMORY[0x1E016A370]();
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v12;
          if ([v14 isTypingMessage])
          {
            -[IMDMessageStore markMessageAsCleanWithROWID:](v37, "markMessageAsCleanWithROWID:", [v14 messageID]);
            goto LABEL_25;
          }
        }
        id v15 = +[IMDChatStore sharedInstance];
        id v16 = [v12 guid];
        id v14 = [v15 chatsGUIDsForMessageWithGUID:v16];

        v17 = +[IMDChatStore sharedInstance];
        uint64_t v18 = objc_msgSend(v14, "__imFirstObject");
        v19 = [v17 chatWithGUID:v18];

        v20 = [v19 cloudKitChatID];
        [v12 setParentChatID:v20];

        int v21 = [v12 parentChatID];
        LODWORD(v20) = v21 == 0;

        if (v20 && IMOSLoggingEnabled())
        {
          v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            long long v23 = [v12 guid];
            *(_DWORD *)buf = v35;
            v48 = v23;
            _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Message %@ is orphaned (parentChatID is nil)", buf, 0xCu);
          }
        }
        long long v24 = (void *)[v12 copyCKRecordRepresentationWithZoneID:v41 salt:v40];
        long long v25 = [v24 objectAtIndexedSubscript:0];

        if (!v25)
        {
          if (IMOSLoggingEnabled())
          {
            v32 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              id v33 = [v12 guid];
              *(_DWORD *)buf = v35;
              v48 = v33;
              _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Cannot generate CKRecord for message %@", buf, 0xCu);
            }
          }
          -[IMDMessageStore markMessageAsCleanWithROWID:](v37, "markMessageAsCleanWithROWID:", [v12 messageID]);
          uint64_t v30 = [MEMORY[0x1E4F6E890] sharedInstance];
          v31 = [MEMORY[0x1E4F28C58] errorWithDomain:@"com.apple.messages.sync" code:0 userInfo:0];
          [v30 forceAutoBugCaptureWithSubType:@"FailCreateCKRecordForMessage" errorPayload:v31 type:@"MiCSync" context:@"Failed to create CKRecord for message"];
          goto LABEL_23;
        }
        long long v26 = [v25 recordID];
        v27 = [v26 recordName];
        char v28 = [v39 containsObject:v27];

        if ((v28 & 1) == 0)
        {
          v29 = [v12 guid];
          [v36 setObject:v25 forKey:v29];

          uint64_t v30 = [v25 recordID];
          v31 = [v30 recordName];
          [v39 addObject:v31];
LABEL_23:
        }
LABEL_25:
      }
      uint64_t v9 = [obj countByEnumeratingWithState:&v43 objects:v49 count:16];
    }
    while (v9);
  }

  return v36;
}

- (void)recordUpdateSucceededWithRecord:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDChatRegistry sharedInstance];
  [v4 processMessageUsingCKRecord:v3];
}

- (void)recordUpdateFailedWithID:(id)a3 localGUID:(id)a4 error:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F6EA68] sharedInstance];
  v12 = +[IMDCKUtilities sharedInstance];
  v13 = [v12 extractServerRecordFromCKServerErrorRecordChanged:v10];

  if ([v11 wasRecordAlreadyChanged:v10])
  {
    id v14 = [v8 recordName];
    id v15 = [v13 recordID];
    id v16 = [v15 recordName];
    int v17 = [v14 isEqualToString:v16];

    if (v17)
    {
      uint64_t v18 = +[IMDChatRegistry sharedInstance];
      [v18 processMessageUsingCKRecord:v13];

      goto LABEL_38;
    }
    if (IMOSLoggingEnabled())
    {
      v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        long long v23 = [v13 recordID];
        long long v24 = [v23 recordName];
        long long v25 = [v8 recordName];
        int v31 = 138412546;
        uint64_t v32 = (uint64_t)v24;
        __int16 v33 = 2112;
        id v34 = v25;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Conflicting serverRecord was different than the one being updated (server: %@, local: %@)", (uint8_t *)&v31, 0x16u);
      }
    }
LABEL_32:
    [(IMDMessageStore *)self _resetSyncStateForMessageWithGUID:v9 toState:2];
    goto LABEL_38;
  }
  if ([v11 wasZoneNotFound:v10])
  {
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        v20 = [v8 recordName];
        int v31 = 138412546;
        uint64_t v32 = (uint64_t)v20;
        __int16 v33 = 2112;
        id v34 = v9;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Zone was not found for recordName (%@) with local guid (%@)", (uint8_t *)&v31, 0x16u);
      }
    }
    [(IMDMessageStore *)self _resetSyncStateForMessageWithGUID:v9 toState:0];
  }
  else
  {
    if ([v11 wasUnknownItem:v10])
    {
      if (IMOSLoggingEnabled())
      {
        int v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          LOWORD(v31) = 0;
          _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Record had invalid arguments, we'll try this record again on the next sync", (uint8_t *)&v31, 2u);
        }
      }
      goto LABEL_32;
    }
    if (![v11 wasRecordArchived:v10])
    {
      if (IMOSLoggingEnabled())
      {
        v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          int v31 = 134217984;
          uint64_t v32 = [v10 code];
          _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Encountered an unknown error.  We'll try syncing this message again on the next sync. Error code: %llu", (uint8_t *)&v31, 0xCu);
        }
      }
      goto LABEL_32;
    }
    BOOL v26 = [(IMDMessageStore *)self _checkIfRecord:v13 hasBadChatIDForMessageGUID:v9];
    int v27 = IMOSLoggingEnabled();
    if (v26)
    {
      if (v27)
      {
        char v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          LOWORD(v31) = 0;
          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Archived Server Record has incorrect parent Chat ID, marking record as needing T3 update", (uint8_t *)&v31, 2u);
        }
      }
      [(IMDMessageStore *)self _resetSyncStateForMessageWithGUID:v9 toState:9];
    }
    else
    {
      if (v27)
      {
        uint64_t v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          LOWORD(v31) = 0;
          _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Record was archived, marking record as synced", (uint8_t *)&v31, 2u);
        }
      }
      [(IMDMessageStore *)self _resetSyncStateForMessageWithGUID:v9 toState:1];
    }
  }
LABEL_38:
}

- (BOOL)_checkIfRecord:(id)a3 hasBadChatIDForMessageGUID:(id)a4
{
  id v6 = a3;
  id v7 = [(IMDMessageStore *)self chatForMessageGUID:a4];
  id v8 = v7;
  if (v7)
  {
    uint64_t v9 = [v7 cloudKitChatID];
    id v10 = [v6 parentChatIDForMessage];
    uint64_t v11 = v10;
    if (v9)
    {
      int v12 = [v10 isEqualToString:v9] ^ 1;

      uint64_t v11 = (void *)v9;
    }
    else
    {
      LOBYTE(v12) = 0;
    }
  }
  else
  {
    LOBYTE(v12) = 0;
  }

  return v12;
}

- (void)_resetSyncStateForMessageWithGUID:(id)a3 toState:(int64_t)a4
{
  id v9 = [(IMDMessageStore *)self itemWithGUID:a3];
  [v9 setCloudKitRecordID:0];
  [v9 setCloudKitRecordChangeTag:0];
  [v9 setCloudKitSyncState:a4];
  [v9 setCloudKitServerChangeTokenBlob:0];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    BYTE2(v8) = 1;
    LOWORD(v8) = 0;
    id v6 = -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:](self, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:", v9, 0, 0, 0, 0x2000, 1, v8);
  }
  else
  {
    id v7 = [(IMDMessageStore *)self storeItem:v9 forceReplace:0];
  }
}

- (void)legacyImport:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 _stringForKey:@"chatID"];
  if (v5)
  {
    id v6 = [(IMDMessageStore *)self visitedChats];
    id v7 = [v6 objectForKey:v5];

    uint64_t v8 = [(IMDMessageStore *)self visitedChats];
    id v9 = v8;
    if (v7)
    {
      id v10 = objc_msgSend(NSNumber, "numberWithInt:", objc_msgSend(v7, "intValue") + 1);
      [v9 setObject:v10 forKey:v5];
    }
    else
    {
      [v8 setObject:&unk_1F33C5958 forKey:v5];
    }

    int v12 = [(IMDMessageStore *)self visitedChats];
    v13 = [v12 objectForKey:v5];

    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412546;
        int v17 = v5;
        __int16 v18 = 1024;
        int v19 = [v13 intValue];
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Found parentChatID: %@, updatedLastMessageCount: %d", (uint8_t *)&v16, 0x12u);
      }
    }
    id v15 = +[IMDChatRegistry sharedInstance];
    objc_msgSend(v15, "processMessageUsingCKRecord:updatedLastMessageCount:", v4, objc_msgSend(v13, "intValue"));
  }
  else
  {
    uint64_t v11 = +[IMDChatRegistry sharedInstance];
    [v11 processMessageUsingCKRecord:v4];
  }
}

- (IMDMessageStore)init
{
  v11.receiver = self;
  v11.super_class = (Class)IMDMessageStore;
  id v2 = [(IMDMessageStore *)&v11 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F6C3E0] sharedInstance];
    [v3 addListener:v2];

    id v4 = [NSString stringGUID];
    [(IMDMessageStore *)v2 setModificationStamp:v4];

    v2->_suppressedUpdates = 0;
    id v5 = (id)[MEMORY[0x1E4F6EBE0] sharedInstance];
    [(IMDMessageStore *)v2 performInitialHousekeeping];
    id v6 = [MEMORY[0x1E4F6E788] sharedManager];
    [v6 addDelegate:v2];

    id v7 = objc_alloc(MEMORY[0x1E4F6EA48]);
    uint64_t v8 = (void *)[v7 initWithObject:v2 title:@"IMDChatStore-AllUnreadMessages" queue:MEMORY[0x1E4F14428]];
    [(IMDMessageStore *)v2 setStateCaptureAssistant:v8];

    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(IMDMessageStore *)v2 setVisitedChats:v9];
  }
  return v2;
}

- (void)performInitialHousekeeping
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "Performing initial database housekeeping", buf, 2u);
    }
  }
  id v3 = [MEMORY[0x1E4F6C360] sharedInstance];
  if ([v3 isInternalInstall])
  {
    int v4 = IMIsRunningInUnitTesting();

    if (v4)
    {
      if (IMOSLoggingEnabled())
      {
        id v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v10 = 0;
          _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Bailing out of initial housekeeping, currently under unit testing", v10, 2u);
        }
      }
      return;
    }
  }
  else
  {
  }
  if (qword_1EBE2BB90 != -1) {
    dispatch_once(&qword_1EBE2BB90, &unk_1F3391380);
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "  => Failing all unsent, unfailed messages", v9, 2u);
    }
  }
  IMDMessageRecordMarkFailedAllUnsentUnfailedMessages();
  if (IMDSMSRecordIsFull())
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "  => Database was full, waiting to post", v8, 2u);
      }
    }
    im_dispatch_after();
  }
}

- (void)dealloc
{
  id v3 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)IMDMessageStore;
  [(IMDMessageStore *)&v4 dealloc];
}

- (id)_chatRegistrySharedInstance
{
  return +[IMDChatRegistry sharedInstance];
}

- (void)focusStateDidChange
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Focus state changed, rebuilding unread message count", buf, 2u);
    }
  }
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D9779414;
  block[3] = &unk_1E6B73268;
  block[4] = self;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_updateModificationDate
{
  id v3 = [NSString stringGUID];
  [(IMDMessageStore *)self setModificationStamp:v3];

  if (IMOSLoggingEnabled())
  {
    objc_super v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Resetting _cachedUnreadMessageCount because _updateModificationDate", v6, 2u);
    }
  }
  cachedUnreadMessageCount = self->_cachedUnreadMessageCount;
  self->_cachedUnreadMessageCount = 0;
}

- (void)_performBlock:(id)a3 afterDelay:(double)a4
{
}

+ (BOOL)_updateCacheForMessageGUID:(id)a3 fromMessage:(id)a4 toMessage:(id)a5 updateLastMessage:(BOOL)a6 calculateUnreadCount:(BOOL)a7
{
  BOOL v28 = a6;
  BOOL v29 = a7;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v30 = a4;
  id v31 = a5;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      objc_super v11 = @"NO";
      if (v29) {
        objc_super v11 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v38 = v9;
      __int16 v39 = 2112;
      v40 = v11;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Updating cache for message guid: %@ calculateUnreadCount %@", buf, 0x16u);
    }
  }
  if (v9)
  {
    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    int v12 = +[IMDChatRegistry sharedInstance];
    v13 = [v12 cachedChats];

    uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v14)
    {
      uint64_t v15 = *(void *)v33;
      while (2)
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v33 != v15) {
            objc_enumerationMutation(v13);
          }
          int v17 = *(void **)(*((void *)&v32 + 1) + 8 * i);
          __int16 v18 = (void *)MEMORY[0x1E016A370]();
          int v19 = [v17 lastMessage];
          uint64_t v20 = [v19 guid];
          int v21 = [v20 isEqualToString:v9];

          if (v21)
          {
            if (IMOSLoggingEnabled())
            {
              long long v23 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "  **** Updating this chat!", buf, 2u);
              }
            }
            if (v28)
            {
              long long v24 = +[IMDChatRegistry sharedInstance];
              [v24 updateLastMessageForChat:v17 hintMessage:v31];
            }
            long long v25 = +[IMDChatRegistry sharedInstance];
            LOWORD(v27) = v29;
            objc_msgSend(v25, "updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:", v17, v30, v31, 0, 0, 1, v27);

            BOOL v22 = 1;
            goto LABEL_24;
          }
        }
        uint64_t v14 = [v13 countByEnumeratingWithState:&v32 objects:v36 count:16];
        if (v14) {
          continue;
        }
        break;
      }
    }
    BOOL v22 = 0;
LABEL_24:
  }
  else
  {
    BOOL v22 = 0;
  }

  return v22;
}

- (void)_storeAttachmentsForMessage:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_super v4 = +[IMDFileTransferCenter sharedInstance];
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [v3 fileTransferGUIDs];
  uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v24;
    *(void *)&long long v6 = 138412290;
    long long v21 = v6;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(obj);
        }
        id v9 = objc_msgSend(v4, "transferForGUID:", *(void *)(*((void *)&v23 + 1) + 8 * v8), v21);
        if (v9)
        {
          id v10 = +[IMDAttachmentStore sharedInstance];
          objc_super v11 = [v3 guid];
          [v10 storeAttachment:v9 associateWithMessageWithGUID:v11];

          if ([v9 isAuxImage])
          {
            if (IMOSLoggingEnabled())
            {
              int v12 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v21;
                BOOL v28 = v9;
                _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Storing Aux image transfer %@", buf, 0xCu);
              }
            }
            v13 = +[IMDFileTransferCenter sharedInstance];
            uint64_t v14 = (void *)MEMORY[0x1E4F6E780];
            uint64_t v15 = [v9 guid];
            int v16 = [v14 AuxGUIDFromFileTransferGUID:v15];
            int v17 = [v13 transferForGUID:v16];

            if (v17)
            {
              __int16 v18 = +[IMDAttachmentStore sharedInstance];
              [v18 storeAttachment:v17 associateWithMessageWithGUID:0];
            }
            else if (IMOSLoggingEnabled())
            {
              int v19 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                uint64_t v20 = [v9 guid];
                *(_DWORD *)buf = v21;
                BOOL v28 = v20;
                _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "_storeAttachmentsForMessage did not find Aux video transfer %@", buf, 0xCu);
              }
            }
          }
        }

        ++v8;
      }
      while (v5 != v8);
      uint64_t v5 = [obj countByEnumeratingWithState:&v23 objects:v29 count:16];
    }
    while (v5);
  }
}

- (void)updateFileTransfer:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    if (IMOSLoggingEnabled())
    {
      objc_super v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        id v14 = v3;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Updating transfer: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    uint64_t v5 = +[IMDAttachmentStore sharedInstance];
    [v5 storeAttachment:v3 associateWithMessageWithGUID:0];

    long long v6 = +[IMDAttachmentStore sharedInstance];
    uint64_t v7 = [v3 guid];
    uint64_t v8 = [v6 attachmentWithGUID:v7];

    id v9 = [v3 messageGUID];
    [v8 setMessageGUID:v9];

    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        id v14 = v8;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Posting resulting transfer to clients; %@",
          (uint8_t *)&v13,
          0xCu);
      }
    }
    objc_super v11 = +[IMDFileTransferCenter sharedInstance];
    int v12 = [v8 guid];
    [v11 addTransfer:v8 forGUID:v12];
  }
}

- (id)storeItem:(id)a3 forceReplace:(BOOL)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  long long v6 = v5;
  if (v5)
  {
    id v7 = v5;
    uint64_t v8 = +[IMDServiceController sharedController];
    id v9 = [v7 service];
    id v10 = [v8 serviceWithName:v9];

    if (v10 && ([v10 supportsDatabase] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v25 = 138412290;
          id v26 = v10;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, " => Not storing item, service: %@  does not support a database", (uint8_t *)&v25, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        int v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v25 = 138412290;
          id v26 = v7;
          _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Not storing: %@", (uint8_t *)&v25, 0xCu);
        }
      }
      id AttachmentIfNeededRef = v7;
    }
    else
    {

      objc_super v11 = (void *)MEMORY[0x1E016A370]();
      int IsFull = IMDSMSRecordIsFull();
      int v13 = [v7 guid];
      id v14 = IMSingleObjectArray();
      uint64_t v15 = [(IMDMessageStore *)self _itemsWithGUIDs:v14];

      if ([v15 count])
      {
        int v16 = [v15 lastObject];
        if (v16)
        {
          IMDUpdateIMItemWithIMItemForceReplace();
          id AttachmentIfNeededRef = (id)objc_claimAutoreleasedReturnValue();
        }
        else
        {
          id AttachmentIfNeededRef = 0;
        }
      }
      else
      {
        uint64_t v20 = (const void *)IMDCreateIMDMessageRecordRefFromIMMessageItem();
        long long v21 = [v7 handle];
        id AttachmentIfNeededRef = (id)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)v20, v21);

        if (v20) {
          CFRelease(v20);
        }
      }
      int v22 = IMDSMSRecordIsFull();

      if (IMOSLoggingEnabled())
      {
        long long v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v25 = 138412546;
          id v26 = v7;
          __int16 v27 = 2112;
          id v28 = AttachmentIfNeededRef;
          _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Stored item to database: %@:%@", (uint8_t *)&v25, 0x16u);
        }
      }
      [(IMDMessageStore *)self updateStamp];
      sub_1D977A0E0(IsFull != 0, v22 != 0);
    }
  }
  else
  {
    id AttachmentIfNeededRef = 0;
  }

  return AttachmentIfNeededRef;
}

- (id)updateSyndicatedMessageWithSyndicationMessageAction:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = [objc_alloc(MEMORY[0x1E4F6E880]) initWithSyndicationAction:v4];
    long long v6 = [v4 messagePartGUID];
    id v7 = [v6 messageGUID];
    uint64_t v8 = [(IMDMessageStore *)self updateSyndicatedMessageWithMessageGUID:v7 newRange:v5];

    int v9 = IMOSLoggingEnabled();
    if (v8)
    {
      if (!v9) {
        goto LABEL_14;
      }
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412546;
        id v13 = v4;
        __int16 v14 = 2112;
        uint64_t v15 = v5;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Updated syndication ranges with SyndicationAction %@. newRange: %@", (uint8_t *)&v12, 0x16u);
      }
    }
    else
    {
      if (!v9) {
        goto LABEL_14;
      }
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        id v13 = v4;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Did NOT update IMMessageItem's syndication ranges for SyndicationAction %@", (uint8_t *)&v12, 0xCu);
      }
    }
  }
  else
  {
    id v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      sub_1D9902A10();
    }
    uint64_t v8 = 0;
  }
LABEL_14:

  return v8;
}

- (id)updateSyndicatedMessageWithMessageGUID:(id)a3 newRange:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (!v6)
  {
    uint64_t v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
      sub_1D9902A44();
    }
    goto LABEL_19;
  }
  uint64_t v8 = [(IMDMessageStore *)self messageWithGUID:v6];
  if (!v8)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v6;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Message not found for syndication action for guid: %@", (uint8_t *)&v17, 0xCu);
      }
      goto LABEL_18;
    }
LABEL_19:
    id v13 = 0;
    goto LABEL_20;
  }
  BOOL v9 = [(IMDMessageStore *)self updateSyndicatedMessageWithMessageItem:v8 newRange:v7];
  int v10 = IMOSLoggingEnabled();
  if (!v9)
  {
    if (v10)
    {
      __int16 v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = [v8 guid];
        int v17 = 138412546;
        id v18 = v15;
        __int16 v19 = 2112;
        id v20 = v7;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Did not updated syndication ranges for message item with guid %@. newRange: %@", (uint8_t *)&v17, 0x16u);
      }
LABEL_18:

      goto LABEL_19;
    }
    goto LABEL_19;
  }
  if (v10)
  {
    objc_super v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = [v8 guid];
      int v17 = 138412546;
      id v18 = v12;
      __int16 v19 = 2112;
      id v20 = v7;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Updated syndication ranges for message item with guid %@. newRange: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  uint64_t v8 = v8;
  id v13 = v8;
LABEL_20:

  return v13;
}

- (BOOL)updateSyndicatedMessageWithMessageItem:(id)a3 newRange:(id)a4
{
  v31[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    objc_super v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1D9902A78();
    }
    goto LABEL_14;
  }
  if (!v7)
  {
    objc_super v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1D9902AAC();
    }
LABEL_14:
    BOOL v18 = 0;
    goto LABEL_18;
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = [v6 guid];
      *(_DWORD *)buf = 138412546;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Updating syndication ranges for message item with guid %@. newRange: %@", buf, 0x16u);
    }
  }
  objc_super v11 = [v6 syndicationRanges];
  char v24 = 0;
  int v12 = (void *)MEMORY[0x1E4F6E880];
  v31[0] = v8;
  id v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v31 count:1];
  __int16 v14 = [v12 updateMessagesRanges:v11 withMessagePartSyndicationRanges:v13 didUpdate:&v24];

  if (v24)
  {
    [v6 setSyndicationRanges:v14];
    LOWORD(v23) = 256;
    id v15 = -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:](self, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v6, 1, 0, 0, 0, 1, v23);
    uint64_t v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = [v6 guid];
      *(_DWORD *)buf = 138412290;
      id v26 = v17;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Updated syndication ranges for message: %@", buf, 0xCu);
    }
  }
  else
  {
    uint64_t v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v19 = [v6 guid];
      id v20 = [v8 description];
      uint64_t v21 = [v11 componentsJoinedByString:@",\n"];
      *(_DWORD *)buf = 138412802;
      id v26 = v19;
      __int16 v27 = 2112;
      id v28 = v20;
      __int16 v29 = 2112;
      uint64_t v30 = v21;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Did NOT update syndication ranges for message: %@\nNew Range:\n%@\nOriginal Ranges:\n%@", buf, 0x20u);
    }
  }

  BOOL v18 = v24 != 0;
LABEL_18:

  return v18;
}

- (void)_fixupStoringMessageIfNecessaryWithMessage:(id)a3
{
  id v5 = a3;
  if ([v5 scheduleType] == 2
    && [v5 errorCode]
    && [v5 scheduleState] != 4)
  {
    id v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1D9902AE0();
    }

    id v7 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"IMDMessageStoreDomain", objc_msgSend(v5, "errorCode"), 0);
    uint64_t v8 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v8 forceAutoBugCaptureWithSubType:@"MessageStore attempted to store scheduled message with an invalid scheduleState" errorPayload:v7 type:@"ScheduledMessageFailureStateNotSet" context:0];

    BOOL v9 = [MEMORY[0x1E4F28B00] currentHandler];
    [v9 handleFailureInMethod:a2, self, @"IMDMessageStore.m", 685, @"Scheduled message is marked as a failure, but didn't transition the scheduleState" object file lineNumber description];

    [v5 setScheduleState:4];
  }
}

- (id)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 flagMask:(unint64_t)a7
{
  LOBYTE(v8) = 0;
  return [(IMDMessageStore *)self storeMessage:a3 forceReplace:a4 modifyError:a5 modifyFlags:a6 flagMask:a7 updateMessageCache:1 calculateUnreadCount:v8];
}

- (id)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 flagMask:(unint64_t)a7 updateMessageCache:(BOOL)a8 calculateUnreadCount:(BOOL)a9
{
  LOWORD(v10) = a9;
  return -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:](self, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", a3, a4, a5, a6, a7, a8, v10);
}

- (id)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 flagMask:(unint64_t)a7 updateMessageCache:(BOOL)a8 calculateUnreadCount:(BOOL)a9 reindexMessage:(BOOL)a10
{
  BYTE2(v11) = 0;
  LOWORD(v11) = __PAIR16__(a10, a9);
  return -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:](self, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:", a3, a4, a5, a6, a7, a8, v11);
}

- (id)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 flagMask:(unint64_t)a7 updateMessageCache:(BOOL)a8 calculateUnreadCount:(BOOL)a9 reindexMessage:(BOOL)a10 isCloudImport:(BOOL)a11
{
  BYTE3(v12) = 0;
  *(_WORD *)((char *)&v12 + 1) = __PAIR16__(a11, a10);
  LOBYTE(v12) = a9;
  return -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:isIncomingMessage:didReplaceBlock:](self, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:isIncomingMessage:didReplaceBlock:", a3, a4, a5, a6, a7, a8, v12, 0);
}

- (id)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 flagMask:(unint64_t)a7 updateMessageCache:(BOOL)a8 calculateUnreadCount:(BOOL)a9 reindexMessage:(BOOL)a10 isCloudImport:(BOOL)a11 isIncomingMessage:(BOOL)a12 didReplaceBlock:(id)a13
{
  BOOL v56 = a8;
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = (void (**)(void))a13;
  uint64_t v16 = v15;
  if (!v14)
  {
    id AttachmentIfNeededRef = 0;
    goto LABEL_64;
  }
  v57 = v15;
  if (a11) {
    goto LABEL_3;
  }
  id v24 = v14;
  int v25 = +[IMDServiceController sharedController];
  id v26 = [v24 service];
  __int16 v27 = [v25 serviceWithName:v26];

  if (v27 && ([v27 supportsDatabase] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v62 = v27;
        _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, " => Not storing message, service: %@  does not support a database", buf, 0xCu);
      }
    }
    goto LABEL_24;
  }
  if ([v24 isTypingMessage])
  {
LABEL_24:

    goto LABEL_25;
  }
  int v28 = [v24 isSuggestedActionResponse];

  if (v28)
  {
LABEL_25:
    char v32 = [v24 isTypingMessage];
    int v33 = IMOSLoggingEnabled();
    if (v32)
    {
      uint64_t v16 = v57;
      if (v33)
      {
        long long v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          long long v35 = [v24 guid];
          *(_DWORD *)buf = 138412546;
          id v62 = v35;
          __int16 v63 = 2112;
          id v64 = v24;
          _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "Message %@ is a typing message, not storing %@", buf, 0x16u);
        }
LABEL_33:

        uint64_t v16 = v57;
      }
    }
    else
    {
      uint64_t v16 = v57;
      if (v33)
      {
        long long v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v62 = v24;
          _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "Not storing: %@", buf, 0xCu);
        }
        goto LABEL_33;
      }
    }
    id AttachmentIfNeededRef = v24;
    goto LABEL_64;
  }
LABEL_3:
  context = (void *)MEMORY[0x1E016A370]();
  [(IMDMessageStore *)self _fixupStoringMessageIfNecessaryWithMessage:v14];
  int IsFull = IMDSMSRecordIsFull();
  int v17 = [v14 guid];
  BOOL v18 = IMSingleObjectArray();
  __int16 v19 = [(IMDMessageStore *)self _itemsWithGUIDs:v18];

  if ([v19 count])
  {
    id v20 = [v19 lastObject];
    uint64_t v21 = v20;
    if (v20)
    {
      int v22 = (void *)[v20 copy];
      IMDUpdateIMMessageItemWithIMMessageItemForceReplaceReplaceError();
      id AttachmentIfNeededRef = (id)objc_claimAutoreleasedReturnValue();
      if (v57) {
        v57[2]();
      }
    }
    else
    {
      id AttachmentIfNeededRef = 0;
    }
  }
  else
  {
    __int16 v29 = (const void *)IMDCreateIMDMessageRecordRefFromIMMessageItem();
    if (!v29)
    {
      uint64_t v30 = IMLogHandleForCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
        sub_1D9902BB0();
      }
    }
    [(IMDMessageStore *)self _storeAttachmentsForMessage:v14];
    if ([v14 isFromMe]) {
      [v14 handle];
    }
    else {
    id v36 = [v14 sender];
    }
    id AttachmentIfNeededRef = (id)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)v29, v36);

    if (!AttachmentIfNeededRef)
    {
      v37 = IMLogHandleForCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_1D9902B48();
      }
    }
    if (v29) {
      CFRelease(v29);
    }
  }
  int v38 = IMDSMSRecordIsFull();
  __int16 v39 = [AttachmentIfNeededRef retractedPartIndexes];
  uint64_t v40 = [v39 count];

  uint64_t v41 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v42 = [v41 isInboxSummaryEnabled];

  if (v40) {
    int v43 = v42;
  }
  else {
    int v43 = 0;
  }
  if (v43 == 1)
  {
    long long v44 = [AttachmentIfNeededRef guid];
    long long v45 = [(IMDMessageStore *)self chatForMessageGUID:v44];

    if (v45)
    {
      uint64_t v59 = *MEMORY[0x1E4F6CD00];
      long long v46 = [MEMORY[0x1E4F1CA98] null];
      v60 = v46;
      v47 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v60 forKeys:&v59 count:1];
      [v45 updateProperties:v47 shouldBroadcast:1];
    }
  }
  if (a10)
  {
    v48 = [AttachmentIfNeededRef guid];
    if ([v48 length])
    {
      if ([AttachmentIfNeededRef isFullyRetracted])
      {
        v58 = v48;
        v49 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v58 count:1];
        IMDCoreSpotlightDeleteMessageGUIDS();
      }
      else
      {
        IMDCoreSpotlightAddMessageGUID();
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v50 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v62 = AttachmentIfNeededRef;
      _os_log_impl(&dword_1D967A000, v50, OS_LOG_TYPE_INFO, "Stored message: %@", buf, 0xCu);
    }
  }
  if (v56)
  {
    v51 = [AttachmentIfNeededRef guid];
    +[IMDMessageStore _updateCacheForMessageGUID:v51 fromMessage:v14 toMessage:AttachmentIfNeededRef updateLastMessage:1 calculateUnreadCount:a9];
  }
  [(IMDMessageStore *)self _storeAttachmentsForMessage:AttachmentIfNeededRef];
  [(IMDMessageStore *)self updateStamp];
  sub_1D977A0E0(IsFull != 0, v38 != 0);
  v52 = [v14 notificationIDSTokenURI];
  [AttachmentIfNeededRef setNotificationIDSTokenURI:v52];

  uint64_t v16 = v57;
LABEL_64:

  return AttachmentIfNeededRef;
}

- (void)updateUnformattedID:(id)a3 forBuddyID:(id)a4 onService:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v7 length]
    && [v8 length]
    && [v9 length]
    && ([v7 isEqualToIgnoringCase:v8] & 1) == 0)
  {
    uint64_t v10 = (void *)IMDHandleRecordCopyHandleForIDOnService();
    if (v10)
    {
      uint64_t v11 = (void *)IMDHandleRecordCopyCountry();
      IMDHandleRecordBulkUpdate();
      if (IMOSLoggingEnabled())
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v13 = 138412802;
          id v14 = v8;
          __int16 v15 = 2112;
          id v16 = v7;
          __int16 v17 = 2112;
          id v18 = v9;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Updated from %@->%@  on service: %@", (uint8_t *)&v13, 0x20u);
        }
      }
    }
  }
}

- (id)_itemsForMessageRecords:(id)a3 handleID:(id)a4 useAttachmentCache:(BOOL)a5 shouldLoadAttachments:(BOOL)a6 reverseOrder:(BOOL)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    uint64_t v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id v22 = v9;
    if (a7)
    {
      id v12 = [v9 reverseObjectEnumerator];
    }
    else
    {
      id v12 = v9;
    }
    int v13 = v12;
    uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
    if (v14)
    {
      uint64_t v15 = v14;
      uint64_t v16 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v24 != v16) {
            objc_enumerationMutation(v13);
          }
          uint64_t v18 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v19 = (void *)MEMORY[0x1E016A370]();
          id AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef(v18, v10);
          if (AttachmentIfNeededRef) {
            [v11 addObject:AttachmentIfNeededRef];
          }
        }
        uint64_t v15 = [v13 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v15);
    }

    id v9 = v22;
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v11;
}

- (id)_messageItemsForMessageRecords:(id)a3 handleID:(id)a4 useAttachmentCache:(BOOL)a5 shouldLoadAttachments:(BOOL)a6 reverseOrder:(BOOL)a7
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (v9)
  {
    id v22 = (id)objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v9, "count"));
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    if (a7)
    {
      id v11 = [v9 reverseObjectEnumerator];
    }
    else
    {
      id v11 = v9;
    }
    id v12 = v11;
    uint64_t v13 = objc_msgSend(v11, "countByEnumeratingWithState:objects:count:", &v23, v27, 16, v9);
    if (v13)
    {
      uint64_t v14 = v13;
      uint64_t v15 = *(void *)v24;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v24 != v15) {
            objc_enumerationMutation(v12);
          }
          uint64_t v17 = *(void *)(*((void *)&v23 + 1) + 8 * i);
          uint64_t v18 = (void *)MEMORY[0x1E016A370]();
          id AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef(v17, v10);
          if (AttachmentIfNeededRef)
          {
            objc_opt_class();
            if (objc_opt_isKindOfClass()) {
              [v22 addObject:AttachmentIfNeededRef];
            }
          }
        }
        uint64_t v14 = [v12 countByEnumeratingWithState:&v23 objects:v27 count:16];
      }
      while (v14);
    }

    id v9 = v21;
  }
  else
  {
    id v22 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v22;
}

- (BOOL)_hasMessagesWithGUIDs:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E016A370]();
  id v5 = (void *)IMDMessageRecordCopyMessagesForGUIDs();
  BOOL v6 = [v5 count] != 0;

  return v6;
}

- (id)_itemsWithAssociatedGUID:(id)a3 shouldLoadAttachments:(BOOL)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  context = (void *)MEMORY[0x1E016A370]();
  id v22 = v4;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v5 = (id)IMDMessageRecordCopyMessagesForAssociatedGUID();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v24 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        id AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)v9, 0);
        if (AttachmentIfNeededRef)
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v11 = AttachmentIfNeededRef;
            id v12 = [v11 associatedMessageGUID];
            char v13 = [v12 isEqualToString:v22];

            if (v13)
            {
              [v21 addObject:v11];
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                uint64_t v15 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "************* Please file a radar!!!!!!!!!!! *******************************", buf, 2u);
                }
              }
              if (IMOSLoggingEnabled())
              {
                uint64_t v16 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  uint64_t v17 = [v11 associatedMessageGUID];
                  uint64_t v18 = [v9 associatedMessageGUID];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v28 = v17;
                  __int16 v29 = 2112;
                  uint64_t v30 = v18;
                  _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "A message returned by IMDMessageRecordCopyMessagesForAssociatedGUID is associated to %@ instead of the requested GUID %@.", buf, 0x16u);
                }
              }
            }
          }
          else if (IMOSLoggingEnabled())
          {
            uint64_t v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v28 = AttachmentIfNeededRef;
              _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "IMDMessageRecordCopyMessagesForAssociatedGUID resulted in a non-associated message item: %@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v6);
  }

  return v21;
}

- (id)_itemsWithGUIDs:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  context = (void *)MEMORY[0x1E016A370]();
  id v4 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v3];
  id v22 = v3;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v5 = (id)IMDMessageRecordCopyMessagesForGUIDs();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v25;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v24 + 1) + 8 * v8);
        id AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)v9, 0);
        id v11 = AttachmentIfNeededRef;
        if (AttachmentIfNeededRef)
        {
          id v12 = [AttachmentIfNeededRef guid];
          if ([v4 containsObject:v12])
          {

LABEL_10:
            [v23 addObject:v11];
            goto LABEL_11;
          }
          char v13 = [v11 service];
          char v14 = [v13 isEqualToIgnoringCase:*MEMORY[0x1E4F6E1A0]];

          if (v14) {
            goto LABEL_10;
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "************* Please file a radar!!!!!!!!!!! *******************************", buf, 2u);
            }
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              uint64_t v17 = [v11 guid];
              uint64_t v18 = [v9 guid];
              *(_DWORD *)buf = 138412802;
              __int16 v29 = v17;
              __int16 v30 = 2112;
              id v31 = v18;
              __int16 v32 = 2112;
              int v33 = v22;
              _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "GUID we got from IMDMessageRecordCopyMessagesForGUIDs wasn't one of the guids we requested. IMItem we got back was: %@, IMDMessageRecordRef guid we got was: %@, requested guids was: %@", buf, 0x20u);
            }
          }
        }
LABEL_11:

        ++v8;
      }
      while (v6 != v8);
      uint64_t v19 = [v5 countByEnumeratingWithState:&v24 objects:v34 count:16];
      uint64_t v6 = v19;
    }
    while (v19);
  }

  return v23;
}

- (id)_itemsWithHandles:(id)a3 onServices:(id)a4 messageGUID:(id)a5 threadIdentifier:(id)a6 limit:(unint64_t)a7 onlyMessages:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  uint64_t v18 = (void *)MEMORY[0x1E016A370]();
  id v19 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v19 startTimingForKey:@"history query"];
  if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      id v21 = @"NO";
      *(_DWORD *)__int16 v30 = 138413570;
      *(void *)&v30[4] = v16;
      *(_WORD *)&v30[12] = 2112;
      if (v8) {
        id v21 = @"YES";
      }
      *(void *)&v30[14] = v14;
      __int16 v31 = 2112;
      id v32 = v15;
      __int16 v33 = 2048;
      unint64_t v34 = a7;
      __int16 v35 = 2112;
      id v36 = v17;
      __int16 v37 = 2112;
      int v38 = v21;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Requesting history with guid: %@ handles: %@ services: %@ limit: %llu thread identifier: %@ only messages: %@", v30, 0x3Eu);
    }
  }
  id v22 = (void *)IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesUpToGUIDOrLimitWithOptionalThreadIdentifier();
  [v19 stopTimingForKey:@"history query"];
  [v19 startTimingForKey:@"generate chat items"];
  uint64_t v23 = [v14 count];
  if (v23 == 1)
  {
    long long v24 = [v14 firstObject];
  }
  else
  {
    long long v24 = 0;
  }
  long long v25 = -[IMDMessageStore _itemsForMessageRecords:handleID:useAttachmentCache:shouldLoadAttachments:reverseOrder:](self, "_itemsForMessageRecords:handleID:useAttachmentCache:shouldLoadAttachments:reverseOrder:", v22, v24, 1, 1, 1, *(_OWORD *)v30);
  if (v23 == 1) {

  }
  [v19 stopTimingForKey:@"generate chat items"];
  if (IMOSLoggingEnabled())
  {
    long long v26 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)__int16 v30 = 138412290;
      *(void *)&v30[4] = v19;
      _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "history query timing: %@", v30, 0xCu);
    }
  }
  if (v25) {
    long long v27 = v25;
  }
  else {
    long long v27 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v28 = v27;

  return v28;
}

- (id)_itemsWithRoomNames:(id)a3 onServices:(id)a4 messageGUID:(id)a5 threadIdentifier:(id)a6 limit:(unint64_t)a7 onlyMessages:(BOOL)a8
{
  int v8 = a7;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = (void *)MEMORY[0x1E016A370]();
  uint64_t v18 = (void *)IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesUpToGUIDOrLimitWithOptionalThreadIdentifier();
  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v24 = 138413058;
      id v25 = v13;
      __int16 v26 = 2112;
      id v27 = v14;
      __int16 v28 = 1024;
      int v29 = v8;
      __int16 v30 = 2112;
      __int16 v31 = v18;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "_messagesWithRoomNames: %@ onServices %@ limit %d recordStoreRecords: %@", (uint8_t *)&v24, 0x26u);
    }
  }
  id v20 = [(IMDMessageStore *)self _itemsForMessageRecords:v18 handleID:0 useAttachmentCache:1 shouldLoadAttachments:1 reverseOrder:1];

  if (v20) {
    id v21 = v20;
  }
  else {
    id v21 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v22 = v21;

  return v22;
}

- (id)_itemsWithHandlesBeforeAndAfterGUID:(id)a3 handles:(id)a4 onServices:(id)a5 numberOfMessagesBefore:(unint64_t)a6 numberOfMessagesAfter:(unint64_t)a7 threadIdentifier:(id)a8 hasMessagesBefore:(BOOL *)a9 hasMessagesAfter:(BOOL *)a10
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  context = (void *)MEMORY[0x1E016A370]();
  id v20 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  [v20 startTimingForKey:@"paged history query"];
  if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413570;
      id v32 = v16;
      __int16 v33 = 2112;
      id v34 = v17;
      __int16 v35 = 2112;
      id v36 = v18;
      __int16 v37 = 2048;
      *(void *)int v38 = a6;
      *(_WORD *)&v38[8] = 2048;
      unint64_t v39 = a7;
      __int16 v40 = 2112;
      id v41 = v19;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Requesting history with guid: %@ handles: %@ services: %@ number before: %llu number after: %llu thread identifier: %@", buf, 0x3Eu);
    }
  }
  id v22 = (void *)IMDMessageRecordCopyMessagesWithChatIdentifiersOnServicesBeforeAndAfterGUIDWithOptionalThreadIdentifier();
  [v20 stopTimingForKey:@"paged history query"];
  if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v24 = [v22 count];
      *(_DWORD *)buf = 138413570;
      id v32 = v17;
      __int16 v33 = 2112;
      id v34 = v18;
      __int16 v35 = 2112;
      id v36 = v16;
      __int16 v37 = 1024;
      *(_DWORD *)int v38 = a6;
      *(_WORD *)&v38[4] = 1024;
      *(_DWORD *)&v38[6] = a7;
      LOWORD(v39) = 1024;
      *(_DWORD *)((char *)&v39 + 2) = v24;
      _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "_limitedNumberOfMessagesWithHandles: %@ services: %@ messageGUID: %@ numberOfMessagesBefore: %d, numberOfMessagesAfter: %d record count: %d", buf, 0x32u);
    }
  }
  [v20 startTimingForKey:@"generate chat items"];
  id v25 = [(IMDMessageStore *)self _itemsForMessageRecords:v22 handleID:0 useAttachmentCache:1 shouldLoadAttachments:1 reverseOrder:1];
  [v20 stopTimingForKey:@"generate chat items"];
  if (IMOSLoggingEnabled())
  {
    __int16 v26 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v32 = v20;
      _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "paged history query timing: %@", buf, 0xCu);
    }
  }
  if (v25) {
    id v27 = v25;
  }
  else {
    id v27 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v28 = v27;

  return v28;
}

- (id)_unreadMessagesWithHandles:(id)a3 onServices:(id)a4 limit:(unint64_t)a5 fallbackGUID:(id)a6
{
  int v7 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1E016A370]();
  id v14 = (void *)IMDMessageRecordCopyUnreadIncomingMessagesWithChatIdentifiersOnServicesToLimitFallbackGUID();
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v22 = 138413058;
      id v23 = v10;
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 1024;
      int v27 = v7;
      __int16 v28 = 2112;
      int v29 = v14;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "_unreadMessagesWithHandles: %@ onServices %@ limit %d recordStoreRecords: %@", (uint8_t *)&v22, 0x26u);
    }
  }
  uint64_t v16 = [v10 count];
  if (v16 == 1)
  {
    id v17 = [v10 firstObject];
  }
  else
  {
    id v17 = 0;
  }
  id v18 = [(IMDMessageStore *)self _messageItemsForMessageRecords:v14 handleID:v17 useAttachmentCache:1 shouldLoadAttachments:1 reverseOrder:1];
  if (v16 == 1) {

  }
  if (v18) {
    id v19 = v18;
  }
  else {
    id v19 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v20 = v19;

  return v20;
}

- (id)_unreadMessagesWithRoomNames:(id)a3 onServices:(id)a4 limit:(unint64_t)a5 fallbackGUID:(id)a6
{
  int v7 = a5;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = (void *)MEMORY[0x1E016A370]();
  id v14 = (void *)IMDMessageRecordCopyUnreadIncomingMessagesWithChatIdentifiersOnServicesToLimitFallbackGUID();
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v20 = 138413314;
      id v21 = v10;
      __int16 v22 = 2112;
      id v23 = v11;
      __int16 v24 = 1024;
      int v25 = v7;
      __int16 v26 = 2112;
      id v27 = v12;
      __int16 v28 = 2112;
      int v29 = v14;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "_unreadMessagesWithRoomNames: %@ onServices %@ limit %d fallbackGUID %@ recordStoreRecords: %@", (uint8_t *)&v20, 0x30u);
    }
  }
  uint64_t v16 = [(IMDMessageStore *)self _messageItemsForMessageRecords:v14 handleID:0 useAttachmentCache:1 shouldLoadAttachments:1 reverseOrder:1];

  if (v16) {
    id v17 = v16;
  }
  else {
    id v17 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v18 = v17;

  return v18;
}

- (void)registerTransfersWithGUIDs:(id)a3 forMessageGUID:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v27 = a4;
  int v25 = v6;
  uint64_t v26 = [v6 count];
  if (v26)
  {
    if (IMOSLoggingEnabled())
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134218498;
        uint64_t v35 = [v6 count];
        __int16 v36 = 2112;
        uint64_t v37 = (uint64_t)v6;
        __int16 v38 = 2112;
        id v39 = v27;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Ensure transfers(count=%lu) with GUIDs registered: %@ for message: %@", buf, 0x20u);
      }
    }
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id obj = v6;
    uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    if (v8)
    {
      uint64_t v10 = 0;
      uint64_t v11 = *(void *)v30;
      unint64_t v12 = *MEMORY[0x1E4F6BFA0];
      *(void *)&long long v9 = 138412290;
      long long v24 = v9;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          id v15 = [(IMDMessageStore *)self _fileTransferCenter];
          uint64_t v16 = [v15 transferForGUID:v14];

          if (IMOSLoggingEnabled())
          {
            id v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 134218498;
              uint64_t v35 = v10 + i + 1;
              __int16 v36 = 2048;
              uint64_t v37 = v26;
              __int16 v38 = 2112;
              id v39 = v16;
              _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Existing transfer: %lu/%lu %@", buf, 0x20u);
            }
          }
          if (v16)
          {
            id v18 = [(IMDMessageStore *)self _fileTransferCenter];
            [v18 addTransfer:v16 forGUID:v14];
          }
          else
          {
            id v19 = +[IMDAttachmentStore sharedInstance];
            id v18 = [v19 attachmentWithGUID:v14];

            if (IMOSLoggingEnabled())
            {
              int v20 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = v24;
                uint64_t v35 = (uint64_t)v18;
                _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Found saved transfer from DB: %@", buf, 0xCu);
              }
            }
            if (v18)
            {
              if (v27) {
                [v18 setMessageGUID:v27];
              }
              if (IMOSLoggingEnabled())
              {
                id v21 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = v24;
                  uint64_t v35 = (uint64_t)v18;
                  _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "New transfer: %@", buf, 0xCu);
                }
              }
              __int16 v22 = [(IMDMessageStore *)self _fileTransferCenter];
              [v22 addTransfer:v18 forGUID:v14];
            }
          }

          if (v10 + i + 1 >= v12)
          {
            if (IMOSLoggingEnabled())
            {
              id v23 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 134218240;
                uint64_t v35 = v26 - v12;
                __int16 v36 = 2048;
                uint64_t v37 = v26;
                _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Not registering %lu/%lu transfers, too many for one message", buf, 0x16u);
              }
            }
            goto LABEL_38;
          }
        }
        uint64_t v8 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
        v10 += i;
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_38:
  }
}

- (id)_fileTransferCenter
{
  return +[IMDFileTransferCenter sharedInstance];
}

- (id)messagesWithAssociatedGUID:(id)a3
{
  return [(IMDMessageStore *)self messagesWithAssociatedGUID:a3 shouldLoadAttachments:1];
}

- (id)messagesWithAssociatedGUID:(id)a3 shouldLoadAttachments:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  if ([v19 length])
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = @"NO";
        if (v4) {
          int v7 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        int v25 = v7;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Should load attachments for associated messages %@", buf, 0xCu);
      }
    }
    context = (void *)MEMORY[0x1E016A370]();
    uint64_t v8 = [(IMDMessageStore *)self _itemsWithAssociatedGUID:v19 shouldLoadAttachments:v4];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v9 = 0;
    uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v21 != v11) {
            objc_enumerationMutation(v8);
          }
          id v13 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          if (!v9) {
            long long v9 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [(__CFString *)v9 addObject:v13];
          if (v4)
          {
            uint64_t v14 = [v13 fileTransferGUIDs];
            id v15 = [v13 guid];
            [(IMDMessageStore *)self registerTransfersWithGUIDs:v14 forMessageGUID:v15];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v10);
    }

    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        int v25 = v9;
        __int16 v26 = 2112;
        id v27 = v19;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Found messages with associated guids: %@  (%@)", buf, 0x16u);
      }
    }
  }
  else
  {
    long long v9 = 0;
  }

  return v9;
}

- (id)messagesWithGUIDs:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 count])
  {
    context = (void *)MEMORY[0x1E016A370]();
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v5 = [(IMDMessageStore *)self _itemsWithGUIDs:v4];
    id v6 = 0;
    uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v17;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v17 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v10 = *(void **)(*((void *)&v16 + 1) + 8 * i);
          if (![v10 type])
          {
            if (!v6) {
              id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            [v6 addObject:v10];
            uint64_t v11 = [v10 fileTransferGUIDs];
            unint64_t v12 = [v10 guid];
            [(IMDMessageStore *)self registerTransfersWithGUIDs:v11 forMessageGUID:v12];
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v16 objects:v24 count:16];
      }
      while (v7);
    }

    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v21 = v6;
        __int16 v22 = 2112;
        id v23 = v4;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Found messages with guids: %@  (%@)", buf, 0x16u);
      }
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)sortedMessageItemsWithFallbackHash:(id)a3 inChat:(id)a4 limit:(unint64_t)a5
{
  v20[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v9 = (void *)MEMORY[0x1E016A370]();
    uint64_t v10 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F6D590] ascending:0];
    uint64_t v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", *MEMORY[0x1E4F6D598], v6];
    unint64_t v12 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
    id v13 = [v7 guid];
    v20[0] = v10;
    uint64_t v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v20 count:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1D977D87C;
    v18[3] = &unk_1E6B745A8;
    id v15 = v8;
    id v19 = v15;
    [v12 fetchMessageRecordsForChatRecordWithGUID:v13 filteredUsingPredicate:v11 sortedUsingDescriptors:v14 limit:1 completionHandler:v18];

    long long v16 = (void *)[v15 copy];
  }
  else
  {
    long long v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

- (BOOL)canStoreItem:(id)a3 onService:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = v5;
    id v8 = +[IMDServiceController sharedController];
    long long v9 = [v7 service];
    uint64_t v10 = [v8 serviceWithName:v9];

    if (v10 && ([v10 supportsDatabase] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        unint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v14 = 138412290;
          id v15 = v10;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, " => Not storing item, service: %@  does not support a database", (uint8_t *)&v14, 0xCu);
        }
      }
      BOOL v11 = 0;
    }
    else
    {
      BOOL v11 = 1;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (BOOL)canStoreMessage:(id)a3 onService:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = v5;
    id v8 = +[IMDServiceController sharedController];
    long long v9 = [v7 service];
    uint64_t v10 = [v8 serviceWithName:v9];

    if (v10 && ([v10 supportsDatabase] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        unint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v14 = 138412290;
          id v15 = v10;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, " => Not storing message, service: %@  does not support a database", (uint8_t *)&v14, 0xCu);
        }
      }
    }
    else if (([v7 isTypingMessage] & 1) == 0)
    {
      int v11 = [v7 isSuggestedActionResponse] ^ 1;
LABEL_12:

      goto LABEL_13;
    }
    LOBYTE(v11) = 0;
    goto LABEL_12;
  }
  LOBYTE(v11) = 0;
LABEL_13:

  return v11;
}

- (BOOL)hasStoredMessageWithGUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v5 = IMSingleObjectArray();
    BOOL v6 = [(IMDMessageStore *)self _hasMessagesWithGUIDs:v5];

    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = @"NO";
        if (v6) {
          id v8 = @"YES";
        }
        int v10 = 138412546;
        id v11 = v4;
        __int16 v12 = 2112;
        id v13 = v8;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Have stored message for guid (%@): %@", (uint8_t *)&v10, 0x16u);
      }
    }
  }
  else
  {
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (id)itemWithGUID:(id)a3
{
  v15[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v15[0] = v4;
    BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v15 count:1];
    id v7 = [(IMDMessageStore *)self _itemsWithGUIDs:v6];
    id v8 = [v7 firstObject];

    if (IMOSLoggingEnabled())
    {
      long long v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412546;
        __int16 v12 = v5;
        __int16 v13 = 2048;
        uint64_t v14 = v8;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Fetched item from database for guid (%@): %p", (uint8_t *)&v11, 0x16u);
      }
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)messageWithGUID:(id)a3
{
  return [(IMDMessageStore *)self messageWithGUID:a3 registerAttachments:0];
}

- (id)messageWithGUID:(id)a3 registerAttachments:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(IMDMessageStore *)self itemWithGUID:v6];
  if ([v7 type])
  {
    id v8 = v7;
    id v7 = 0;
  }
  else
  {
    if (!v4) {
      goto LABEL_6;
    }
    id v8 = [v7 fileTransferGUIDs];
    long long v9 = [v7 guid];
    [(IMDMessageStore *)self registerTransfersWithGUIDs:v8 forMessageGUID:v9];
  }
LABEL_6:
  if (IMOSLoggingEnabled())
  {
    int v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Stored message for guid (%@): %@", (uint8_t *)&v12, 0x16u);
    }
  }

  return v7;
}

- (id)messageForAttachmentGUID:(id)a3
{
  id v3 = (void *)IMDAttachmentRecordCopyMessageForAttachmentGUID();
  id AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)v3, 0);
  objc_opt_class();
  id v5 = 0;
  if (objc_opt_isKindOfClass()) {
    id v5 = AttachmentIfNeededRef;
  }

  return v5;
}

- (id)existingMessageSimilarToMessage:(id)a3 skipServices:(id)a4 skipGUIDs:(id)a5 withinTimeInterval:(double)a6 participants:(id)a7
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v49 = a5;
  id v13 = a7;
  uint64_t v50 = v11;
  if (v11)
  {
    id v47 = v13;
    long long v46 = objc_msgSend(v12, "__imArrayByApplyingBlock:", &unk_1F3391420);
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    __int16 v14 = [v11 body];
    id v15 = [v14 string];
    long long v45 = objc_msgSend(v15, "__stringByStrippingAttachmentAndControlCharacters");

    v48 = [v11 sender];
    if ((unint64_t)[v47 count] < 2)
    {
      uint64_t v40 = (const void *)IMDMessageRecordCopyMessageMatchingBodyStringWithHandleSkippingServicesSkippingGUIDs();
    }
    else
    {
      uint64_t v16 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v47, "count"));
      long long v59 = 0u;
      long long v60 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v17 = v47;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v59 objects:v75 count:16];
      if (v18)
      {
        uint64_t v19 = *(void *)v60;
        do
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v60 != v19) {
              objc_enumerationMutation(v17);
            }
            id v21 = objc_msgSend(*(id *)(*((void *)&v59 + 1) + 8 * i), "ID", v45);
            if ([v21 length]) {
              [v16 addObject:v21];
            }
          }
          uint64_t v18 = [v17 countByEnumeratingWithState:&v59 objects:v75 count:16];
        }
        while (v18);
      }

      id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v23 = +[IMDServiceController sharedController];
      long long v24 = [v23 allServices];

      uint64_t v25 = [v24 countByEnumeratingWithState:&v55 objects:v74 count:16];
      if (v25)
      {
        uint64_t v26 = *(void *)v56;
        do
        {
          for (uint64_t j = 0; j != v25; ++j)
          {
            if (*(void *)v56 != v26) {
              objc_enumerationMutation(v24);
            }
            uint64_t v28 = *(void *)(*((void *)&v55 + 1) + 8 * j);
            if ((objc_msgSend(v12, "containsObject:", v28, v45) & 1) == 0)
            {
              uint64_t v29 = +[IMDChatRegistry sharedInstance];
              long long v30 = [v29 existingChatsForIDs:v16 onService:v28 style:43];
              [v22 addObjectsFromArray:v30];
            }
          }
          uint64_t v25 = [v24 countByEnumeratingWithState:&v55 objects:v74 count:16];
        }
        while (v25);
      }

      long long v31 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v22, "count"));
      long long v32 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v22, "count"));
      long long v53 = 0u;
      long long v54 = 0u;
      long long v51 = 0u;
      long long v52 = 0u;
      id v33 = v22;
      uint64_t v34 = [v33 countByEnumeratingWithState:&v51 objects:v73 count:16];
      if (v34)
      {
        uint64_t v35 = *(void *)v52;
        do
        {
          for (uint64_t k = 0; k != v34; ++k)
          {
            if (*(void *)v52 != v35) {
              objc_enumerationMutation(v33);
            }
            uint64_t v37 = *(void **)(*((void *)&v51 + 1) + 8 * k);
            __int16 v38 = objc_msgSend(v37, "serviceName", v45);
            [v31 addObject:v38];

            id v39 = [v37 chatIdentifier];
            [v32 addObject:v39];
          }
          uint64_t v34 = [v33 countByEnumeratingWithState:&v51 objects:v73 count:16];
        }
        while (v34);
      }

      uint64_t v40 = (const void *)IMDMessageRecordCopyMessageMatchingBodyStringWithChatIdentifiersServicesSkippingGUIDs();
    }
    if (v40
      && (id AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)v40, v48), CFRelease(v40), AttachmentIfNeededRef))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413314;
          id v64 = AttachmentIfNeededRef;
          __int16 v65 = 2112;
          id v66 = v50;
          __int16 v67 = 2112;
          id v68 = v12;
          __int16 v69 = 2112;
          double v70 = *(double *)&v49;
          __int16 v71 = 2048;
          double v72 = a6;
          _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "Found existing message: %@ similar to: %@   (Skip Services: %@   Skip GUIDs: %@   Within Time Interval: %f)", buf, 0x34u);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        int v43 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          id v64 = v50;
          __int16 v65 = 2112;
          id v66 = v12;
          __int16 v67 = 2112;
          id v68 = v49;
          __int16 v69 = 2048;
          double v70 = a6;
          _os_log_impl(&dword_1D967A000, v43, OS_LOG_TYPE_INFO, "No existing message similar to: %@   (Skip Services: %@   Skip GUIDs: %@   Within Time Interval: %f)", buf, 0x2Au);
        }
      }
      id AttachmentIfNeededRef = 0;
    }

    id v13 = v47;
  }
  else
  {
    id AttachmentIfNeededRef = 0;
  }

  return AttachmentIfNeededRef;
}

- (id)existingSOSMessageSimilarToMessage:(id)a3 matchingService:(id)a4 withinTimeInterval:(double)a5
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (v7)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    long long v9 = [v7 body];
    int v10 = [v9 string];
    id v11 = objc_msgSend(v10, "__stringByStrippingAttachmentAndControlCharacters");

    id v12 = [v7 sender];
    int v13 = [v7 isSOS];
    __int16 v14 = [v7 guid];
    int v15 = v13 ^ 1;
    uint64_t v16 = IMDMessageRecordCopyMessageMatchingBodyStringWithHandleMatchingServiceMatchingSOSSkippingGUID();
    if (v16
      && (id v17 = (const void *)v16,
          id AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef(v16, v12),
          CFRelease(v17),
          AttachmentIfNeededRef))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v22 = 138413314;
          id v23 = v8;
          __int16 v24 = 1024;
          int v25 = v15;
          __int16 v26 = 2048;
          double v27 = a5;
          __int16 v28 = 2112;
          id v29 = AttachmentIfNeededRef;
          __int16 v30 = 2112;
          id v31 = v7;
          _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Found existing SOS message (Matching service: %@  Matching isSOS: %d  Within Time Interval: %f) - found message: %@ similar to: %@", (uint8_t *)&v22, 0x30u);
        }
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        long long v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          int v22 = 138413058;
          id v23 = v8;
          __int16 v24 = 1024;
          int v25 = v15;
          __int16 v26 = 2048;
          double v27 = a5;
          __int16 v28 = 2112;
          id v29 = v7;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "No existing SOS message (Matching service: %@  Matching isSOS: %d  Within Time Interval: %f) - similar to: %@", (uint8_t *)&v22, 0x26u);
        }
      }
      id AttachmentIfNeededRef = 0;
    }
  }
  else
  {
    id AttachmentIfNeededRef = 0;
  }

  return AttachmentIfNeededRef;
}

- (void)markMessageAsDeduplicated:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v5 = v3;
    BOOL v4 = [v3 guid];

    id v3 = v5;
    if (v4)
    {
      [v5 guid];
      IMDMessageRecordMarkMessageGUIDAsDeduplicated();
      id v3 = v5;
    }
  }
}

- (BOOL)wasMessageDeduplicatedWithGUID:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 length])
  {
    BOOL v4 = (void *)IMDMessageRecordCopyMessageForGUID();
    char v5 = [v4 wasDeduplicated];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v8 = 136315138;
        long long v9 = "-[IMDMessageStore wasMessageDeduplicatedWithGUID:]";
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "%s received zero-length message GUID", (uint8_t *)&v8, 0xCu);
      }
    }
    char v5 = 0;
  }

  return v5;
}

- (id)messageWithReplaceMessageID:(int)a3 fromHandle:(id)a4 onService:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  long long v9 = v8;
  id AttachmentIfNeededRef = 0;
  if (v7 && v8)
  {
    uint64_t v11 = IMDMessageRecordCopyMessageWithHandleOnServiceWithReplaceID();
    if (v11)
    {
      id v12 = (const void *)v11;
      id AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef(v11, v7);
      CFRelease(v12);
    }
    else
    {
      id AttachmentIfNeededRef = 0;
    }
    if (IMOSLoggingEnabled())
    {
      int v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v15[0] = 67109378;
        v15[1] = a3;
        __int16 v16 = 2112;
        id v17 = AttachmentIfNeededRef;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Stored message for replace ID (%d): %@", (uint8_t *)v15, 0x12u);
      }
    }
  }

  return AttachmentIfNeededRef;
}

- (id)itemsWithHandles:(id)a3 onServices:(id)a4 limit:(unint64_t)a5
{
  return (id)MEMORY[0x1F4181798](self, sel_itemsWithHandles_onServices_messageGUID_threadIdentifier_limit_);
}

- (id)itemsWithHandles:(id)a3 onServices:(id)a4 messageGUID:(id)a5 limit:(unint64_t)a6
{
  return (id)MEMORY[0x1F4181798](self, sel_itemsWithHandles_onServices_messageGUID_threadIdentifier_limit_);
}

- (id)itemsWithHandles:(id)a3 onServices:(id)a4 messageGUID:(id)a5 threadIdentifier:(id)a6 limit:(unint64_t)a7
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  context = (void *)MEMORY[0x1E016A370]();
  id v31 = v14;
  uint64_t v32 = v15;
  int v30 = a7;
  [(IMDMessageStore *)self _itemsWithHandles:v12 onServices:v13 messageGUID:v14 threadIdentifier:v15 limit:a7 onlyMessages:0];
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v35 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        if (![v20 type])
        {
          id v21 = [v20 fileTransferGUIDs];
          int v22 = [v20 guid];
          [(IMDMessageStore *)self registerTransfersWithGUIDs:v21 forMessageGUID:v22];

          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v23 = [v20 threadOriginator];
            __int16 v24 = v23;
            if (v23)
            {
              int v25 = [v23 fileTransferGUIDs];
              __int16 v26 = [v24 guid];
              [(IMDMessageStore *)self registerTransfersWithGUIDs:v25 forMessageGUID:v26];
            }
          }
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v17);
  }

  if (IMOSLoggingEnabled())
  {
    double v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v28 = [v16 count];
      *(_DWORD *)buf = 67109890;
      int v39 = v28;
      __int16 v40 = 2112;
      id v41 = v12;
      __int16 v42 = 2112;
      id v43 = v13;
      __int16 v44 = 1024;
      int v45 = v30;
      _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Found %d messages with handles: %@ on services: %@  limit: %d", buf, 0x22u);
    }
  }

  return v16;
}

- (id)itemsWithRoomNames:(id)a3 onServices:(id)a4 limit:(unint64_t)a5
{
  return (id)MEMORY[0x1F4181798](self, sel_itemsWithRoomNames_onServices_messageGUID_threadIdentifier_limit_);
}

- (id)itemsWithRoomNames:(id)a3 onServices:(id)a4 messageGUID:(id)a5 limit:(unint64_t)a6
{
  return (id)MEMORY[0x1F4181798](self, sel_itemsWithRoomNames_onServices_messageGUID_threadIdentifier_limit_);
}

- (id)itemsWithRoomNames:(id)a3 onServices:(id)a4 messageGUID:(id)a5 threadIdentifier:(id)a6 limit:(unint64_t)a7
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = (void *)MEMORY[0x1E016A370]();
  int v28 = v14;
  id v29 = v12;
  int v27 = a7;
  [(IMDMessageStore *)self _itemsWithRoomNames:v12 onServices:v13 messageGUID:v14 threadIdentifier:v15 limit:a7 onlyMessages:0];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v31 != v19) {
          objc_enumerationMutation(v17);
        }
        id v21 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        if (![v21 type])
        {
          int v22 = [v21 fileTransferGUIDs];
          id v23 = [v21 guid];
          [(IMDMessageStore *)self registerTransfersWithGUIDs:v22 forMessageGUID:v23];
        }
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v18);
  }

  if (IMOSLoggingEnabled())
  {
    __int16 v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v25 = [v17 count];
      *(_DWORD *)buf = 67109890;
      int v35 = v25;
      __int16 v36 = 2112;
      long long v37 = v29;
      __int16 v38 = 2112;
      id v39 = v13;
      __int16 v40 = 1024;
      int v41 = v27;
      _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Found %d messages with room names: %@ on services: %@  limit: %d", buf, 0x22u);
    }
  }

  return v17;
}

- (id)itemsWithHandles:(id)a3 onServices:(id)a4 messageGUID:(id)a5 numberOfMessagesBefore:(unint64_t)a6 numberOfMessagesAfter:(unint64_t)a7 threadIdentifier:(id)a8 hasMessagesBefore:(BOOL *)a9 hasMessagesAfter:(BOOL *)a10
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a8;
  long long v20 = (void *)MEMORY[0x1E016A370]();
  long long v37 = v18;
  __int16 v38 = v16;
  int v35 = a6;
  int v36 = a7;
  unint64_t v21 = a6;
  int v22 = v19;
  [(IMDMessageStore *)self _itemsWithHandlesBeforeAndAfterGUID:v18 handles:v16 onServices:v17 numberOfMessagesBefore:v21 numberOfMessagesAfter:a7 threadIdentifier:v19 hasMessagesBefore:a9 hasMessagesAfter:a10];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v23 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v53 count:16];
  if (v24)
  {
    uint64_t v25 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v40 != v25) {
          objc_enumerationMutation(v23);
        }
        int v27 = *(void **)(*((void *)&v39 + 1) + 8 * i);
        if (![v27 type])
        {
          int v28 = [v27 fileTransferGUIDs];
          id v29 = [v27 guid];
          [(IMDMessageStore *)self registerTransfersWithGUIDs:v28 forMessageGUID:v29];
        }
      }
      uint64_t v24 = [v23 countByEnumeratingWithState:&v39 objects:v53 count:16];
    }
    while (v24);
  }

  if (IMOSLoggingEnabled())
  {
    long long v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      int v31 = [v23 count];
      int v32 = [v38 count];
      int v33 = [v17 count];
      *(_DWORD *)buf = 67110144;
      int v44 = v31;
      __int16 v45 = 1024;
      int v46 = v32;
      __int16 v47 = 1024;
      int v48 = v33;
      __int16 v49 = 1024;
      int v50 = v35;
      __int16 v51 = 1024;
      int v52 = v36;
      _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "messagesWithHandlesBeforeAndAfterGUID found %d messages for number of ids: %d on number of services: %d numberOfMessagesBefore: %d numberOfMessagesAfter: %d", buf, 0x20u);
    }
  }

  return v23;
}

- (id)lastMessageWithHandles:(id)a3 onServices:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E016A370]();
  long long v9 = [(IMDMessageStore *)self _itemsWithHandles:v6 onServices:v7 messageGUID:0 threadIdentifier:0 limit:1 onlyMessages:1];
  uint64_t v10 = [v9 firstObject];

  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412802;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Found last message: %@ with handles: %@ on services: %@", (uint8_t *)&v13, 0x20u);
    }
  }

  return v10;
}

- (id)unreadMessagesWithHandles:(id)a3 onServices:(id)a4 limit:(unint64_t)a5 fallbackGUID:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  context = (void *)MEMORY[0x1E016A370]();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  int v24 = a5;
  uint64_t v25 = v12;
  int v13 = [(IMDMessageStore *)self _unreadMessagesWithHandles:v10 onServices:v11 limit:a5 fallbackGUID:v12];
  id v14 = 0;
  uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (v18)
        {
          if (!v14) {
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v14 addObject:v18];
          if (![v18 type])
          {
            uint64_t v19 = [v18 fileTransferGUIDs];
            long long v20 = [v18 guid];
            [(IMDMessageStore *)self registerTransfersWithGUIDs:v19 forMessageGUID:v20];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v15);
  }

  if (IMOSLoggingEnabled())
  {
    unint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = [v14 count];
      *(_DWORD *)buf = 67109890;
      int v32 = v22;
      __int16 v33 = 2112;
      id v34 = v10;
      __int16 v35 = 2112;
      id v36 = v11;
      __int16 v37 = 1024;
      int v38 = v24;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Found %d messages with handle: %@ on service: %@  limit: %d", buf, 0x22u);
    }
  }

  return v14;
}

- (id)unreadMessagesWithRoomNames:(id)a3 onServices:(id)a4 limit:(unint64_t)a5 fallbackGUID:(id)a6
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  context = (void *)MEMORY[0x1E016A370]();
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  int v24 = a5;
  uint64_t v25 = v12;
  int v13 = [(IMDMessageStore *)self _unreadMessagesWithRoomNames:v10 onServices:v11 limit:a5 fallbackGUID:v12];
  id v14 = 0;
  uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v39 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v13);
        }
        id v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (v18)
        {
          if (!v14) {
            id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v14 addObject:v18];
          if (![v18 type])
          {
            uint64_t v19 = [v18 fileTransferGUIDs];
            long long v20 = [v18 guid];
            [(IMDMessageStore *)self registerTransfersWithGUIDs:v19 forMessageGUID:v20];
          }
        }
      }
      uint64_t v15 = [v13 countByEnumeratingWithState:&v27 objects:v39 count:16];
    }
    while (v15);
  }

  if (IMOSLoggingEnabled())
  {
    unint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = [v14 count];
      *(_DWORD *)buf = 67109890;
      int v32 = v22;
      __int16 v33 = 2112;
      id v34 = v10;
      __int16 v35 = 2112;
      id v36 = v11;
      __int16 v37 = 1024;
      int v38 = v24;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Found %d messages with handle: %@ on service: %@  limit: %d", buf, 0x22u);
    }
  }

  return v14;
}

- (id)lastMessageWithRoomNames:(id)a3 onServices:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = (void *)MEMORY[0x1E016A370]();
  long long v9 = [(IMDMessageStore *)self _itemsWithRoomNames:v6 onServices:v7 messageGUID:0 threadIdentifier:0 limit:1 onlyMessages:1];
  id v10 = [v9 firstObject];

  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412802;
      id v14 = v10;
      __int16 v15 = 2112;
      id v16 = v6;
      __int16 v17 = 2112;
      id v18 = v7;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Found last message: %@ with room names: %@ on services: %@", (uint8_t *)&v13, 0x20u);
    }
  }

  return v10;
}

- (id)lastIncomingMessageForChatWithIdentifier:(id)a3 chatStyle:(unsigned __int8)a4 onService:(id)a5
{
  v27[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a5;
  id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %lld", *MEMORY[0x1E4F6D5B8], 0);
  long long v9 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", *MEMORY[0x1E4F6D5B0], MEMORY[0x1E4F1CC28]];
  id v10 = (void *)MEMORY[0x1E4F28BA0];
  v27[0] = v8;
  v27[1] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v27 count:2];
  id v12 = [v10 andPredicateWithSubpredicates:v11];

  int v13 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F6D590] ascending:0];
  id v14 = (void *)IMCopyGUIDForChat();
  uint64_t v20 = 0;
  unint64_t v21 = &v20;
  uint64_t v22 = 0x3032000000;
  id v23 = sub_1D977FFCC;
  int v24 = sub_1D977FFDC;
  id v25 = 0;
  __int16 v15 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
  __int16 v26 = v13;
  id v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v26 count:1];
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1D977FFE4;
  v19[3] = &unk_1E6B73420;
  v19[4] = &v20;
  [v15 fetchMessageRecordsForChatRecordWithGUID:v14 filteredUsingPredicate:v12 sortedUsingDescriptors:v16 limit:1 completionHandler:v19];

  id v17 = (id)v21[5];
  _Block_object_dispose(&v20, 8);

  return v17;
}

- (id)messagesInChat:(id)a3 earliestDate:(id)a4 limit:(unint64_t)a5
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  long long v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %lld", *MEMORY[0x1E4F6D5B8], 0);
  uint64_t v10 = *MEMORY[0x1E4F6D590];
  id v11 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", *MEMORY[0x1E4F6D590], v8];
  id v12 = (void *)MEMORY[0x1E4F28BA0];
  v29[0] = v9;
  v29[1] = v11;
  int v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  id v14 = [v12 andPredicateWithSubpredicates:v13];

  __int16 v15 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v10 ascending:0];
  uint64_t v22 = 0;
  id v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_1D977FFCC;
  __int16 v26 = sub_1D977FFDC;
  id v27 = 0;
  id v16 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
  id v17 = [v7 guid];
  long long v28 = v15;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v28 count:1];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1D9780338;
  v21[3] = &unk_1E6B73420;
  v21[4] = &v22;
  [v16 fetchMessageRecordsForChatRecordWithGUID:v17 filteredUsingPredicate:v14 sortedUsingDescriptors:v18 limit:a5 completionHandler:v21];

  id v19 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v19;
}

- (id)scheduledMessagesBatchFetcher
{
  return [(IMDMessageStore *)self scheduledMessagesBatchFetcherForChat:0];
}

- (id)scheduledMessagesBatchFetcherForChat:(id)a3
{
  v14[3] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = v3;
  if (v3 && [v3 length]) {
    id v5 = (id)[objc_alloc(MEMORY[0x1E4F6BF58]) initWithAssociatedChatGUID:v4];
  }
  else {
    id v5 = objc_alloc_init(MEMORY[0x1E4F6BF58]);
  }
  id v6 = v5;
  [v5 setBatchSize:100];
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %lld", *MEMORY[0x1E4F6D5B8], 0);
  id v8 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %lu", *MEMORY[0x1E4F6D5E0], 2);
  long long v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %lu OR %K = %lu", *MEMORY[0x1E4F6D5D8], 1, *MEMORY[0x1E4F6D5D8], 2);
  uint64_t v10 = (void *)MEMORY[0x1E4F28BA0];
  v14[0] = v7;
  v14[1] = v8;
  v14[2] = v9;
  id v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:v14 count:3];
  id v12 = [v10 andPredicateWithSubpredicates:v11];
  [v6 setPredicate:v12];

  return v6;
}

- (id)scheduledMessagesBatchFetcherForSyncState:(int64_t)a3
{
  v12[3] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F6BF58]);
  [v4 setBatchSize:100];
  id v5 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %lld", *MEMORY[0x1E4F6D5B8], 0);
  id v6 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %lu", *MEMORY[0x1E4F6D5E0], 2);
  id v7 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %lld", *MEMORY[0x1E4F6D588], a3);
  id v8 = (void *)MEMORY[0x1E4F28BA0];
  v12[0] = v5;
  v12[1] = v6;
  v12[2] = v7;
  long long v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v12 count:3];
  uint64_t v10 = [v8 andPredicateWithSubpredicates:v9];
  [v4 setPredicate:v10];

  return v4;
}

- (id)messageHistorySummaryForDateInterval:(id)a3 chatIdentifiers:(id)a4 chatStyle:(unsigned __int8)a5 services:(id)a6
{
  uint64_t v7 = a5;
  v44[3] = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v40 = a6;
  uint64_t v11 = [v9 startDate];
  __int16 v37 = v9;
  uint64_t v12 = [v9 endDate];
  uint64_t v13 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %lld", *MEMORY[0x1E4F6D5B8], 0);
  uint64_t v14 = *MEMORY[0x1E4F6D590];
  id v36 = (void *)v11;
  uint64_t v15 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K >= %@", *MEMORY[0x1E4F6D590], v11];
  __int16 v35 = (void *)v12;
  uint64_t v16 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K <= %@", v14, v12];
  id v17 = (void *)MEMORY[0x1E4F28BA0];
  __int16 v33 = (void *)v15;
  id v34 = (void *)v13;
  v44[0] = v13;
  v44[1] = v15;
  int v32 = (void *)v16;
  v44[2] = v16;
  id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v44 count:3];
  long long v39 = [v17 andPredicateWithSubpredicates:v18];

  id v19 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:v14 ascending:0];
  id v20 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v38 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
  if ([v10 count])
  {
    unint64_t v21 = 0;
    do
    {
      [v10 objectAtIndexedSubscript:v21];
      id v23 = v22 = v10;
      uint64_t v24 = [v40 objectAtIndexedSubscript:v21];
      id v25 = (void *)IMCopyGUIDForChat();
      uint64_t v43 = v19;
      [MEMORY[0x1E4F1C978] arrayWithObjects:&v43 count:1];
      v27 = uint64_t v26 = v7;
      v41[0] = MEMORY[0x1E4F143A8];
      v41[1] = 3221225472;
      v41[2] = sub_1D9780C08;
      v41[3] = &unk_1E6B745A8;
      id v42 = v20;
      [v38 fetchMessageRecordsForChatRecordWithGUID:v25 filteredUsingPredicate:v39 sortedUsingDescriptors:v27 limit:10000 completionHandler:v41];

      uint64_t v7 = v26;
      id v10 = v22;
      ++v21;
    }
    while (v21 < [v22 count]);
  }
  id v28 = objc_alloc(MEMORY[0x1E4F6E840]);
  long long v29 = (void *)[v20 copy];
  long long v30 = (void *)[v28 initWithDateInterval:v37 messages:v29];

  return v30;
}

- (id)oldestMessageDateForChatIdentifiers:(id)a3 chatStyle:(unsigned __int8)a4 services:(id)a5
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v17 = a5;
  uint64_t v16 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %lld", *MEMORY[0x1E4F6D5B8], 0);
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F6D590] ascending:1];
  id v8 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
  unint64_t v9 = 0;
  uint64_t v19 = 0;
  id v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1D977FFCC;
  id v23 = sub_1D977FFDC;
  id v24 = 0;
  while (v9 < [v6 count])
  {
    id v10 = [v6 objectAtIndexedSubscript:v9];
    uint64_t v11 = [v17 objectAtIndexedSubscript:v9];
    uint64_t v12 = (void *)IMCopyGUIDForChat();
    v25[0] = v7;
    uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:1];
    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    v18[2] = sub_1D9781040;
    v18[3] = &unk_1E6B73420;
    void v18[4] = &v19;
    [v8 fetchMessageRecordsForChatRecordWithGUID:v12 filteredUsingPredicate:v16 sortedUsingDescriptors:v13 limit:1 completionHandler:v18];

    ++v9;
  }
  id v14 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v14;
}

- (id)lastMessageForChatWithRowID:(int64_t)a3
{
  uint64_t v8 = 0;
  unint64_t v9 = &v8;
  uint64_t v10 = 0x3032000000;
  uint64_t v11 = sub_1D977FFCC;
  uint64_t v12 = sub_1D977FFDC;
  id v13 = 0;
  id v4 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  _DWORD v7[2] = sub_1D97812A8;
  v7[3] = &unk_1E6B76010;
  v7[4] = &v8;
  [v4 fetchLastMessageRecordForChatRecordWithRowID:a3 completionHandler:v7];

  id v5 = (id)v9[5];
  _Block_object_dispose(&v8, 8);

  return v5;
}

- (id)lastTUConversationItemForChat:(id)a3
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v12 = 0;
  id v13 = &v12;
  uint64_t v14 = 0x3032000000;
  uint64_t v15 = sub_1D977FFCC;
  uint64_t v16 = sub_1D977FFDC;
  id v17 = 0;
  id v4 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %lld", *MEMORY[0x1E4F6D5B8], 6);
  id v5 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
  id v6 = [v3 guid];
  uint64_t v7 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F6D590] ascending:0];
  v18[0] = v7;
  uint64_t v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v18 count:1];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D9781554;
  v11[3] = &unk_1E6B73420;
  v11[4] = &v12;
  [v5 fetchMessageRecordsForChatRecordWithGUID:v6 filteredUsingPredicate:v4 sortedUsingDescriptors:v8 limit:1 completionHandler:v11];

  id v9 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v9;
}

- (id)attachmentsWithHandles:(id)a3 onServices:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E016A370]();
  uint64_t v8 = (void *)IMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServices();
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11[0] = 67109634;
      v11[1] = [v8 count];
      __int16 v12 = 2112;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Found %d filenames with handles: %@ on services: %@", (uint8_t *)v11, 0x1Cu);
    }
  }

  return v8;
}

- (id)attachmentsWithRoomNames:(id)a3 onServices:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = (void *)MEMORY[0x1E016A370]();
  uint64_t v8 = (void *)IMDAttachmentRecordCopyAttachmentGUIDsAndPathsForChatIdentifiersOnServices();
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      v11[0] = 67109634;
      v11[1] = [v8 count];
      __int16 v12 = 2112;
      id v13 = v5;
      __int16 v14 = 2112;
      id v15 = v6;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Found %d filenames with room names: %@ on services: %@ ", (uint8_t *)v11, 0x1Cu);
    }
  }

  return v8;
}

- (id)messageActionItemsForOriginalMessageGUID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E016A370]();
  id v5 = (void *)IMDMessageRecordCopyMessageActionItemsForOriginalMessageGUID();
  if ([v5 count])
  {
    unint64_t v6 = 0;
    id v7 = 0;
    do
    {
      uint64_t v8 = [v5 objectAtIndex:v6];
      if (v8)
      {
        id AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef(v8, 0);
        if (AttachmentIfNeededRef)
        {
          if (!v7) {
            id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v7 addObject:AttachmentIfNeededRef];
        }
      }
      ++v6;
    }
    while ([v5 count] > v6);
  }
  else
  {
    id v7 = 0;
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v12[0] = 67109378;
      v12[1] = [v7 count];
      __int16 v13 = 2112;
      id v14 = v3;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Found %d message action items for original message guid: %@", (uint8_t *)v12, 0x12u);
    }
  }

  return v7;
}

- (id)frequentRepliesForForChatIdentifiers:(id)a3 onServices:(id)a4 limit:(unint64_t)a5
{
  int v5 = a5;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = (void *)MEMORY[0x1E016A370]();
  uint64_t v10 = (void *)IMDMessageRecordCopyFrequentRepliesForChatIdentifiersOnServicesUpToLimit();
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      v13[0] = 67109890;
      v13[1] = [v10 count];
      __int16 v14 = 2112;
      id v15 = v7;
      __int16 v16 = 2112;
      id v17 = v8;
      __int16 v18 = 1024;
      int v19 = v5;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Found %d messages with handles: %@ on services: %@  limit: %d", (uint8_t *)v13, 0x22u);
    }
  }

  return v10;
}

- (id)messagesWithReplyToGUID:(id)a3
{
  id v3 = a3;
  id v4 = (void *)MEMORY[0x1E016A370]();
  int v5 = (void *)IMDMessageRecordCopyMessagesWithReplyToGUIDs();
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v5 count])
  {
    unint64_t v7 = 0;
    do
    {
      id v8 = (void *)MEMORY[0x1E016A370]();
      id AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef([v5 objectAtIndex:v7], 0);
      if (AttachmentIfNeededRef) {
        [v6 addObject:AttachmentIfNeededRef];
      }

      ++v7;
    }
    while ([v5 count] > v7);
  }

  return v6;
}

+ (id)_missingMessageReadReceiptCache
{
  if (qword_1EBE2BBA0 != -1) {
    dispatch_once(&qword_1EBE2BBA0, &unk_1F3391440);
  }
  id v2 = (void *)qword_1EBE2BB98;

  return v2;
}

- (void)addMissingMessageReadReceipt:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[IMDMessageStore _missingMessageReadReceiptCache];
  [v4 addObject:v3];

  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = +[IMDMessageStore _missingMessageReadReceiptCache];
      int v7 = 138412546;
      id v8 = v3;
      __int16 v9 = 2048;
      uint64_t v10 = [v6 count];
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Adding message GUID to readReceiptsForMissingMessage cache: %@ (size: %lu)", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (BOOL)popReadReceiptForMissingGUID:(id)a3
{
  id v3 = a3;
  if ([v3 length]
    && (+[IMDMessageStore _missingMessageReadReceiptCache](IMDMessageStore, "_missingMessageReadReceiptCache"), v4 = objc_claimAutoreleasedReturnValue(), int v5 = [v4 containsObject:v3], v4, v5))
  {
    id v6 = +[IMDMessageStore _missingMessageReadReceiptCache];
    [v6 removeObject:v3];

    BOOL v7 = 1;
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (void)enumerateMessagesToRelayOnService:(id)a3 usingBlock:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void (**)(id, void *))a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F6BF58]);
  id v8 = (void *)MEMORY[0x1E4F28F60];
  __int16 v18 = v5;
  __int16 v9 = [v5 internalName];
  int v19 = [v8 predicateWithFormat:@"%K = %@ AND %K = %@", *MEMORY[0x1E4F6D5C0], MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F6D5E8], v9];

  [v7 setPredicate:v19];
  [v7 setBatchSize:100];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v10 = v7;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        __int16 v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (![v14 itemType])
        {
          id AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)v14, 0);
          if (AttachmentIfNeededRef)
          {
            v6[2](v6, AttachmentIfNeededRef);
          }
          else if (IMOSLoggingEnabled())
          {
            __int16 v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              id v17 = [v14 guid];
              *(_DWORD *)buf = 138412290;
              id v25 = v17;
              _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Could not fetch IMMessageItem from record guid: %@", buf, 0xCu);
            }
          }
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
    }
    while (v11);
  }
}

- (id)chatForMessage:(id)a3
{
  id v4 = [a3 guid];
  id v5 = [(IMDMessageStore *)self chatForMessageGUID:v4];

  return v5;
}

- (id)chatForMessageGUID:(id)a3
{
  return [(IMDMessageStore *)self chatForMessageGUID:a3 enableVerboseLogging:1];
}

- (id)chatForMessageGUID:(id)a3 enableVerboseLogging:(BOOL)a4
{
  id v4 = [(IMDMessageStore *)self _chatsForMessageGUID:a3 enableVerboseLogging:a4];
  id v5 = objc_msgSend(v4, "__imFirstObject");

  return v5;
}

- (id)chatsForMessage:(id)a3
{
  id v4 = [a3 guid];
  id v5 = [(IMDMessageStore *)self chatsForMessageGUID:v4];

  return v5;
}

- (id)chatsForMessageGUID:(id)a3
{
  return [(IMDMessageStore *)self _chatsForMessageGUID:a3 enableVerboseLogging:1];
}

- (id)_chatsForMessageGUID:(id)a3 enableVerboseLogging:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  if (v21)
  {
    BOOL v20 = v4;
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    context = (void *)MEMORY[0x1E016A370]();
    id v6 = +[IMDChatStore sharedInstance];
    id v7 = [v6 chatsGUIDsForMessageWithGUID:v21];

    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v28 = v7;
        __int16 v29 = 2112;
        id v30 = v21;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Found chat guids: %@ for message guid: %@", buf, 0x16u);
      }
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v23 != v11) {
            objc_enumerationMutation(v9);
          }
          __int16 v13 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          __int16 v14 = +[IMDChatRegistry sharedInstance];
          id v15 = [v14 existingChatWithGUID:v13];

          if (v15)
          {
            [v5 addObject:v15];
          }
          else if (IMOSLoggingEnabled())
          {
            __int16 v16 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v28 = v13;
              __int16 v29 = 2112;
              id v30 = v21;
              _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Couldn't find existing chat with guid: %@ in IMDChatRegistry for messageGUID: %@", buf, 0x16u);
            }
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v10);
    }

    if (v20 && IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v28 = v5;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "   Found Chats: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)chatForMessageIdentifier:(int64_t)a3
{
  id v3 = [(IMDMessageStore *)self _chatsForMessageIdentifier:a3];
  BOOL v4 = objc_msgSend(v3, "__imFirstObject");

  return v4;
}

- (id)existingChatForMessageGUID:(id)a3
{
  id v3 = a3;
  BOOL v4 = +[IMDChatStore sharedInstance];
  id v5 = [v4 chatsGUIDsForMessageWithGUID:v3];

  id v6 = objc_msgSend(v5, "__imFirstObject");

  id v7 = +[IMDChatRegistry sharedInstance];
  id v8 = [v7 existingChatWithGUID:v6];

  return v8;
}

- (id)_chatsForMessageIdentifier:(int64_t)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v4 = +[IMDChatStore sharedInstance];
  id v5 = [v4 chatsGUIDsForMessageWithIdentifier:a3];

  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      long long v25 = v5;
      __int16 v26 = 2048;
      int64_t v27 = a3;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Found chat guids: %@ for message identifier: %lld", buf, 0x16u);
    }
  }
  long long v21 = 0u;
  long long v22 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v10 = *(void *)v20;
    *(void *)&long long v9 = 138412546;
    long long v17 = v9;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v20 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        __int16 v13 = +[IMDChatRegistry sharedInstance];
        __int16 v14 = [v13 existingChatWithGUID:v12];

        if (v14)
        {
          [v3 addObject:v14];
        }
        else if (IMOSLoggingEnabled())
        {
          id v15 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v17;
            long long v25 = v12;
            __int16 v26 = 2048;
            int64_t v27 = a3;
            _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Couldn't find existing chat with guid: %@ in IMDChatRegistry for messageIdentifier: %lld", buf, 0x16u);
          }
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v8);
  }

  return v3;
}

- (_IMDHandleRecordStruct)_copyHandle:(id)a3 onService:(id)a4
{
  return (_IMDHandleRecordStruct *)IMDHandleRecordCopyHandleForIDOnService();
}

- (BOOL)_isValidPhoneNumber:(id)a3 forCountryCode:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = (uint64_t (*)(id, id))MEMORY[0x1E0169C40]("PNIsValidPhoneNumberForCountry", @"CorePhoneNumbers");
  char v8 = v7(v6, v5);

  return v8;
}

- (id)cleanUnformattedPhoneNumber:(id)a3 countryCode:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v6;
  BOOL v9 = [(IMDMessageStore *)self _isValidPhoneNumber:v8 forCountryCode:v7];
  BOOL v10 = (([v8 hasPrefix:@"#"] & 1) != 0
      || [v8 hasPrefix:@"*"])
     && (unint64_t)[v8 length] >= 5
     && (unint64_t)[v8 length] < 0xA;
  if ([v8 hasPrefix:@"444"] && objc_msgSend(v8, "length") == 7) {
    BOOL v10 = 1;
  }
  uint64_t v11 = v8;
  if (!v10)
  {
    uint64_t v11 = v8;
    if (v9)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v14 = 138412802;
          id v15 = v8;
          __int16 v16 = 1024;
          int v17 = 1;
          __int16 v18 = 1024;
          int v19 = 0;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Cleaning up symbols from unformatted phone number %@ based on phoneNumberIsValid %d and phoneNumberIsShortCode %d", (uint8_t *)&v14, 0x18u);
        }
      }
      uint64_t v11 = [(IMDMessageStore *)self _cleanupPhoneNumber:v8];
    }
  }

  return v11;
}

- (id)updatedMessagesForMessages:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  __int16 v26 = [v4 arrayByApplyingSelector:sel_guid];
  id v5 = -[IMDMessageStore messagesWithGUIDs:](self, "messagesWithGUIDs:");
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v32 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        __int16 v13 = [v12 guid];
        [v6 setObject:v12 forKeyedSubscript:v13];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v31 objects:v36 count:16];
    }
    while (v9);
  }

  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v15 = v4;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v28;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v28 != v18) {
          objc_enumerationMutation(v15);
        }
        uint64_t v20 = *(void **)(*((void *)&v27 + 1) + 8 * j);
        long long v21 = [v20 guid];
        long long v22 = [v6 objectForKeyedSubscript:v21];

        if (v22) {
          long long v23 = v22;
        }
        else {
          long long v23 = v20;
        }
        [v14 addObject:v23];
      }
      uint64_t v17 = [v15 countByEnumeratingWithState:&v27 objects:v35 count:16];
    }
    while (v17);
  }

  long long v24 = (void *)[v14 copy];

  return v24;
}

- (id)_cleanupPhoneNumber:(id)a3
{
  return (id)MEMORY[0x1F4123680](a3, a2);
}

- (void)resolveUnformattedRepresentationsForHandles:(id)a3 onService:(id)a4 message:(id)a5 completionBlock:(id)a6
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v53 = a3;
  id v59 = a4;
  id v58 = a5;
  id v9 = a6;
  if (v9)
  {
    uint64_t v10 = v9;
    int v52 = (void (**)(void, void))[v9 copy];

    id v55 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v63 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    long long v66 = 0u;
    id obj = v53;
    uint64_t v57 = [obj countByEnumeratingWithState:&v63 objects:v75 count:16];
    if (!v57) {
      goto LABEL_58;
    }
    uint64_t v56 = *(void *)v64;
    while (1)
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v64 != v56)
        {
          uint64_t v12 = v11;
          objc_enumerationMutation(obj);
          uint64_t v11 = v12;
        }
        uint64_t v61 = v11;
        __int16 v13 = *(void **)(*((void *)&v63 + 1) + 8 * v11);
        id v14 = [v13 ID];
        id v15 = [v59 internalName];
        uint64_t v16 = [(IMDMessageStore *)self _copyHandle:v14 onService:v15];

        if (v16)
        {
          uint64_t v17 = (void *)IMDHandleRecordCopyCountry();
          uint64_t v18 = IMDHandleRecordCopyUncanonicalizedID();
          int v19 = (void *)v18;
          if (v17)
          {
            if (v18) {
              goto LABEL_10;
            }
LABEL_17:
            int v19 = [v58 unformattedID];
            if (!v17) {
              goto LABEL_18;
            }
LABEL_11:
            if (!v19) {
              goto LABEL_19;
            }
          }
          else
          {
            uint64_t v17 = [v58 countryCode];
            if (!v19) {
              goto LABEL_17;
            }
LABEL_10:
            if (v17) {
              goto LABEL_11;
            }
LABEL_18:
            uint64_t v17 = [v13 countryCode];
            if (!v19)
            {
LABEL_19:
              int v19 = [v13 unformattedID];
            }
          }
          long long v23 = [v13 ID];
          long long v24 = objc_msgSend(v23, "im_stripCategoryLabel");

          long long v60 = [MEMORY[0x1E4FADBD8] normalizedPhoneNumberHandleForValue:v24 isoCountryCode:v17];
          long long v25 = (void *)MEMORY[0x1E4FADBD8];
          __int16 v26 = objc_msgSend(v19, "im_stripCategoryLabel");
          if (v17)
          {
            long long v27 = [v25 normalizedPhoneNumberHandleForValue:v26 isoCountryCode:v17];
          }
          else
          {
            long long v28 = [v60 isoCountryCode];
            long long v27 = [v25 normalizedPhoneNumberHandleForValue:v26 isoCountryCode:v28];
          }
          if (v27 && ([v27 isEquivalentToHandle:v60] & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              long long v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138413058;
                id v68 = v24;
                __int16 v69 = 2112;
                double v70 = v19;
                __int16 v71 = 2112;
                double v72 = v60;
                __int16 v73 = 2112;
                v74 = v27;
                _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Canonicalized handle (%@) and unformatted handle (%@) were not equal - TU canonical: (%@) TU unformatted: (%@)", buf, 0x2Au);
              }
            }
            int v19 = 0;
          }
          long long v30 = [(IMDMessageStore *)self cleanUnformattedPhoneNumber:v19 countryCode:v17];
          long long v31 = objc_msgSend(v30, "im_stripCategoryLabel");

          long long v32 = [v59 internalName];
          if ([v32 isEqualToString:*MEMORY[0x1E4F6E198]])
          {
            long long v33 = [v13 personCentricID];
            int v34 = objc_msgSend(v33, "__im_isSipHandle");

            if (v34)
            {
              if (IMOSLoggingEnabled())
              {
                __int16 v35 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
                {
                  id v36 = [v13 personCentricID];
                  *(_DWORD *)buf = 138412546;
                  id v68 = v36;
                  __int16 v69 = 2112;
                  double v70 = v24;
                  _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "Found a chat bot sip handle %@, for %@", buf, 0x16u);
                }
              }
              uint64_t v37 = (void *)MEMORY[0x1E4F1C9E8];
              int v38 = [v13 personCentricID];
              long long v39 = objc_msgSend(v37, "dictionaryWithObjectsAndKeys:", v24, @"__kIMDMessageStoreHandleCanonicalIDKey", v38, @"__kIMDMessageStoreHandleAlternateSIPID", v31, @"__kIMDMessageStoreHandleUnformattedIDKey", v17, @"__kIMDMessageStoreHandleCountryCodeKey", 0);

              if (!v39) {
                goto LABEL_41;
              }
LABEL_40:
              [v55 addObject:v39];
LABEL_41:

              CFRelease(v16);
              goto LABEL_56;
            }
          }
          else
          {
          }
          long long v39 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v24, @"__kIMDMessageStoreHandleCanonicalIDKey", v31, @"__kIMDMessageStoreHandleUnformattedIDKey", v17, @"__kIMDMessageStoreHandleCountryCodeKey", 0);
          if (v39) {
            goto LABEL_40;
          }
          goto LABEL_41;
        }
        uint64_t v20 = [v58 countryCode];
        uint64_t v21 = [v58 unformattedID];
        long long v22 = (void *)v21;
        if (v20)
        {
          if (!v21) {
            goto LABEL_43;
          }
        }
        else
        {
          uint64_t v20 = [v13 countryCode];
          if (!v22)
          {
LABEL_43:
            long long v22 = [v13 unformattedID];
          }
        }
        id v40 = (void *)MEMORY[0x1E4FADBD8];
        long long v41 = [v13 ID];
        id v42 = [v40 normalizedPhoneNumberHandleForValue:v41 isoCountryCode:v20];

        uint64_t v43 = (void *)MEMORY[0x1E4FADBD8];
        if (v20)
        {
          int v44 = [MEMORY[0x1E4FADBD8] normalizedPhoneNumberHandleForValue:v22 isoCountryCode:v20];
        }
        else
        {
          __int16 v45 = [v42 isoCountryCode];
          int v44 = [v43 normalizedPhoneNumberHandleForValue:v22 isoCountryCode:v45];
        }
        if (([v44 isEquivalentToHandle:v42] & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            int v46 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
            {
              __int16 v47 = [v13 ID];
              *(_DWORD *)buf = 138413058;
              id v68 = v47;
              __int16 v69 = 2112;
              double v70 = v22;
              __int16 v71 = 2112;
              double v72 = v42;
              __int16 v73 = 2112;
              v74 = v44;
              _os_log_impl(&dword_1D967A000, v46, OS_LOG_TYPE_INFO, "Canonicalized handle (%@) and unformatted handle (%@) were not equal - TU canonical: (%@) TU unformatted: (%@)", buf, 0x2Au);
            }
          }

          long long v22 = 0;
        }
        int v48 = [(IMDMessageStore *)self cleanUnformattedPhoneNumber:v22 countryCode:v20];
        __int16 v49 = (void *)MEMORY[0x1E4F1C9E8];
        int v50 = [v13 ID];
        __int16 v51 = objc_msgSend(v49, "dictionaryWithObjectsAndKeys:", v50, @"__kIMDMessageStoreHandleCanonicalIDKey", v48, @"__kIMDMessageStoreHandleUnformattedIDKey", v20, @"__kIMDMessageStoreHandleCountryCodeKey", 0);

        if (v51) {
          [v55 addObject:v51];
        }

LABEL_56:
        uint64_t v11 = v61 + 1;
      }
      while (v57 != v61 + 1);
      uint64_t v57 = [obj countByEnumeratingWithState:&v63 objects:v75 count:16];
      if (!v57)
      {
LABEL_58:

        ((void (**)(void, id))v52)[2](v52, v55);
        break;
      }
    }
  }
}

- (id)deleteMessageGUIDs:(id)a3 inChat:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  __int16 v26 = v6;
  if (v7)
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    context = (void *)MEMORY[0x1E016A370]();
    int IsFull = IMDSMSRecordIsFull();
    long long v31 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v9 = [(IMDMessageStore *)self _itemsWithGUIDs:v6];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v42 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v32 != v11) {
            objc_enumerationMutation(v9);
          }
          __int16 v13 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v14 = [v13 guid];
          if (v14) {
            [v8 addObject:v14];
          }
          id v15 = +[IMDChatRegistry sharedInstance];
          [v15 removeMessage:v13 fromChat:v7];
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v31 objects:v42 count:16];
      }
      while (v10);
    }

    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v16 = v26;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v41 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v28;
      do
      {
        for (uint64_t j = 0; j != v17; ++j)
        {
          if (*(void *)v28 != v18) {
            objc_enumerationMutation(v16);
          }
          +[IMDMessageStore _updateCacheForMessageGUID:*(void *)(*((void *)&v27 + 1) + 8 * j) fromMessage:0 toMessage:0 updateLastMessage:1 calculateUnreadCount:1];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v27 objects:v41 count:16];
      }
      while (v17);
    }

    int v20 = IMDSMSRecordIsFull();
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int v22 = [v8 count];
        *(_DWORD *)buf = 67109634;
        int v36 = v22;
        __int16 v37 = 2112;
        id v38 = v16;
        __int16 v39 = 2112;
        id v40 = v7;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Deleted %d messages with guids: %@ in chat: %@", buf, 0x1Cu);
      }
    }
    if (![v8 count])
    {

      id v8 = 0;
    }
    [(IMDMessageStore *)self updateStamp];
    sub_1D977A0E0(IsFull != 0, v20 != 0);
  }
  else
  {
    id v8 = [(IMDMessageStore *)self deleteMessageGUIDs:v6];
  }

  return v8;
}

- (id)deleteMessageGUIDs:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (void *)MEMORY[0x1E016A370]();
  int IsFull = IMDSMSRecordIsFull();
  uint64_t v21 = 0;
  IMDMessageRecordDeleteMessagesForGUIDs();
  id v7 = 0;
  if (v7)
  {
  }
  else
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v8 = v4;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v26 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v8);
          }
          +[IMDMessageStore _updateCacheForMessageGUID:fromMessage:toMessage:updateLastMessage:calculateUnreadCount:](IMDMessageStore, "_updateCacheForMessageGUID:fromMessage:toMessage:updateLastMessage:calculateUnreadCount:", *(void *)(*((void *)&v17 + 1) + 8 * i), 0, 0, 1, 1, (void)v17);
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v26 count:16];
      }
      while (v9);
    }

    int v12 = IMDSMSRecordIsFull();
    __int16 v13 = [MEMORY[0x1E4F6E7C8] sharedInstance];
    [v13 deleteInteractionsWithMessageGUIDs:v8];

    [(IMDMessageStore *)self updateStamp];
    sub_1D977A0E0(IsFull != 0, v12 != 0);
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v15 = [v8 count];
        *(_DWORD *)buf = 67109378;
        int v23 = v15;
        __int16 v24 = 2112;
        id v25 = v8;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Deleted %d messages with guids: %@", buf, 0x12u);
      }
    }
  }

  return v4;
}

- (void)_deleteMessagesWithGUIDs:(id)a3 chatIdentifiers:(id)a4 style:(unsigned __int8)a5 onServices:(id)a6 batchNumber:(unint64_t)a7 completion:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a6;
  uint64_t v27 = (void (**)(void))a8;
  long long v28 = v13;
  unint64_t v16 = [v13 count];
  unint64_t v25 = a7;
  unint64_t v17 = 1000 * a7;
  id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v14 count])
  {
    unint64_t v19 = 0;
    do
    {
      long long v20 = objc_msgSend(v14, "objectAtIndex:", v19, v25);
      uint64_t v21 = [v15 objectAtIndex:v19];
      int v22 = (void *)IMCopyGUIDForChat();

      if ([v22 length]) {
        [v18 addObject:v22];
      }

      ++v19;
    }
    while (v19 < [v14 count]);
  }
  if (v17 >= v16)
  {
    __int16 v24 = v27;
    int v23 = v28;
    if (v27) {
      v27[2](v27);
    }
  }
  else
  {
    v29[0] = MEMORY[0x1E4F143A8];
    v29[1] = 3221225472;
    v29[2] = sub_1D9783F28;
    void v29[3] = &unk_1E6B76058;
    unint64_t v36 = v16;
    unint64_t v37 = v17;
    int v23 = v28;
    id v30 = v28;
    unint64_t v38 = v25;
    id v31 = v14;
    id v32 = v15;
    __int16 v24 = v27;
    id v33 = v18;
    long long v34 = self;
    unsigned __int8 v39 = a5;
    __int16 v35 = v27;
    [(IMDMessageStore *)self _performBlock:v29 afterDelay:2.0];
  }
}

- (id)deleteMessagesWithChatIdentifiers:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 completion:(id)a6
{
  uint64_t v8 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412546;
      id v20 = v10;
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "deleteMessageswithChatIdentifiers: %@ onServices: %@", (uint8_t *)&v19, 0x16u);
    }
  }
  id v14 = (void *)MEMORY[0x1E016A370]();
  id v15 = (void *)IMDMessageRecordCopyGUIDsForMessagesWithChatIdentifiersOnServices();
  if (IMOSLoggingEnabled())
  {
    unint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = [v15 count];
      int v19 = 67109120;
      LODWORD(v20) = v17;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Found %d messages to delete", (uint8_t *)&v19, 8u);
    }
  }
  [(IMDMessageStore *)self _deleteMessagesWithGUIDs:v15 chatIdentifiers:v10 style:v8 onServices:v11 batchNumber:0 completion:v12];
  if (![v15 count])
  {

    id v15 = 0;
  }

  return v15;
}

- (id)deleteMessagesWithChatIdentifiers:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5
{
  return (id)MEMORY[0x1F4181798](self, sel_deleteMessagesWithChatIdentifiers_style_onServices_completion_);
}

- (id)deleteMessagesWithReplaceMessageID:(int)a3 fromHandle:(id)a4 onService:(id)a5
{
  uint64_t v6 = *(void *)&a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a5;
  id v10 = [(IMDMessageStore *)self messageWithReplaceMessageID:v6 fromHandle:v8 onService:v9];
  if (v10)
  {
    id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v12 = [v10 guid];

    if (v12)
    {
      id v13 = [v10 guid];
      [v11 addObject:v13];

      id v14 = [v10 guid];
      id v15 = IMSingleObjectArray();
      id v16 = [(IMDMessageStore *)self deleteMessageGUIDs:v15];
    }
    int v17 = +[IMDBroadcastController sharedProvider];
    id v18 = [v17 broadcasterForChatListeners];
    [v18 historicalMessageGUIDsDeleted:v11 chatGUIDs:0 queryID:0];
  }
  else
  {
    id v11 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    int v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      v21[0] = 67109890;
      v21[1] = [v11 count];
      __int16 v22 = 1024;
      int v23 = v6;
      __int16 v24 = 2112;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v9;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Deleted %d messages with replace ID: %d from handle: %@ on service: %@", (uint8_t *)v21, 0x22u);
    }
  }

  return v11;
}

- (void)signalUnreadChangeForHandle:(id)a3
{
  id v3 = a3;
  id v4 = (void *)[v3 copy];
  id v5 = IMBiomeQueue();
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D97846DC;
  v8[3] = &unk_1E6B73218;
  id v9 = v4;
  id v10 = v3;
  id v6 = v3;
  id v7 = v4;
  dispatch_async(v5, v8);
}

- (BOOL)markMessageGUIDUnread:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDMessageStore *)self chatForMessageGUID:v4];
  if (v5)
  {
    IMDMessageRecordMarkMessageGUIDUnread();
    id v6 = [(IMDMessageStore *)self messageWithGUID:v4];
    BOOL v7 = v6 != 0;
    if (v6)
    {
      id v8 = +[IMDBroadcastController sharedProvider];
      id v9 = objc_msgSend(v8, "broadcasterForChatListenersUsingBlackholeRegistry:", objc_msgSend(v5, "isBlackholed"));

      id v10 = [v5 accountID];
      id v11 = [v5 chatIdentifier];
      -[NSObject account:chat:style:chatProperties:messageUpdated:suppressNotification:](v9, "account:chat:style:chatProperties:messageUpdated:suppressNotification:", v10, v11, [v5 style], 0, v6, 1);

      if (([(id)objc_opt_class() _updateCacheForMessageGUID:v4 fromMessage:0 toMessage:0 updateLastMessage:0 calculateUnreadCount:1] & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          id v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            int v17 = 138412290;
            id v18 = v4;
            _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Attempted to mark a message as unread that wasn't the last message: %@", (uint8_t *)&v17, 0xCu);
          }
        }
        id v13 = +[IMDChatRegistry sharedInstance];
        [v13 updateStateForChat:v5 forcePost:0 shouldRebuildFailedMessageDate:0 shouldCalculateUnreadCount:1];
      }
      if (IMOSLoggingEnabled())
      {
        id v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          int v17 = 138412290;
          id v18 = v4;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Marked %@ as unread", (uint8_t *)&v17, 0xCu);
        }
      }
      id v15 = [v6 handle];
      [(IMDMessageStore *)self signalUnreadChangeForHandle:v15];
    }
    else
    {
      id v9 = IMLogHandleForCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
        sub_1D9902C80();
      }
    }
  }
  else
  {
    id v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1D9902C18();
    }
    BOOL v7 = 0;
  }

  return v7;
}

- (id)markMessagesAsReadWithIdentifiers:(id)a3 onServices:(id)a4 chatStyle:(unsigned __int8)a5 upToGUID:(id)a6 readDate:(id)a7 fromMe:(BOOL)a8
{
  BOOL v25 = a8;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v26 = a6;
  id v14 = a7;
  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if ([v12 count])
  {
    unint64_t v16 = 0;
    do
    {
      int v17 = [v12 objectAtIndex:v16];
      id v18 = [v13 objectAtIndex:v16];
      uint64_t v19 = (void *)IMCopyGUIDForChat();

      if (v19) {
        [v15 addObject:v19];
      }

      ++v16;
    }
    while (v16 < [v12 count]);
  }
  id v20 = [(IMDMessageStore *)self markMessagesAsReadWithChatGUIDs:v15 upToGUID:v26 readDate:v14 fromMe:v25];
  if (![v20 count])
  {

    id v20 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = [v20 count];
      int v23 = @"NO";
      *(_DWORD *)buf = 67109890;
      int v28 = v22;
      __int16 v29 = 2112;
      if (v25) {
        int v23 = @"YES";
      }
      id v30 = v12;
      __int16 v31 = 2112;
      id v32 = v13;
      __int16 v33 = 2112;
      long long v34 = v23;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Marked %d messages as read with handles: %@ on service: %@  from me: %@", buf, 0x26u);
    }
  }

  return v20;
}

- (id)markMessagesAsReadWithChatGUIDs:(id)a3 upToGUID:(id)a4 readDate:(id)a5 fromMe:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = (void *)MEMORY[0x1E016A370]();
  MessagesPriorToGuidMatchingChatGUIDs = (void *)IMDMessageRecordCopyAndMarkAsReadMessagesPriorToGuidMatchingChatGUIDs();
  if (![MessagesPriorToGuidMatchingChatGUIDs count])
  {

    MessagesPriorToGuidMatchingChatGUIDs = 0;
  }
  if ([MessagesPriorToGuidMatchingChatGUIDs count]) {
    [(IMDMessageStore *)self updateStamp];
  }
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = [MessagesPriorToGuidMatchingChatGUIDs count];
      int v17 = @"NO";
      v19[0] = 67109634;
      v19[1] = v16;
      __int16 v20 = 2112;
      if (v6) {
        int v17 = @"YES";
      }
      id v21 = v10;
      __int16 v22 = 2112;
      int v23 = v17;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Marked %d messages as read with chat guid: %@ from me: %@", (uint8_t *)v19, 0x1Cu);
    }
  }

  return MessagesPriorToGuidMatchingChatGUIDs;
}

- (int64_t)_calculateUnreadMessagesCountFilteredByFocus:(BOOL)a3 filteredByAssistiveAccess:(BOOL)a4
{
  BOOL v5 = a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  int v23 = [MEMORY[0x1E4F6E788] sharedManager];
  __int16 v22 = [MEMORY[0x1E4F6E5D8] sharedManager];
  id v21 = +[IMDChatRegistry sharedInstance];
  BOOL v6 = [v21 cachedChats];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v33 = [v6 count];
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Calculating unread message count from %ld cached chats.", buf, 0xCu);
    }
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  uint64_t v7 = 0;
  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  if (!v8)
  {
    int64_t v27 = 0;
    goto LABEL_35;
  }
  int64_t v27 = 0;
  uint64_t v9 = *(void *)v29;
  do
  {
    for (uint64_t i = 0; i != v8; ++i)
    {
      if (*(void *)v29 != v9) {
        objc_enumerationMutation(obj);
      }
      id v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
      uint64_t v12 = [v11 unreadCount];
      if (v12)
      {
        if (!v5)
        {
          if (a4) {
            goto LABEL_20;
          }
          goto LABEL_25;
        }
        id v4 = [(IMDMessageStore *)self _handleStringsForChat:v11];
        if ([v23 activeFocusModeMatchesConversationWithHandleStrings:v4])
        {
          if (!a4)
          {

            goto LABEL_25;
          }
LABEL_20:
          id v15 = [(IMDMessageStore *)self _handleIDsForChat:v11];
          int v16 = [v22 allowsConversationWithHandleIDs:v15];

          if (v5)
          {

            if ((v16 & 1) == 0) {
              goto LABEL_26;
            }
LABEL_25:
            v27 += v12;
LABEL_30:
            v7 += v12;
            continue;
          }
          if (v16) {
            goto LABEL_25;
          }
        }
        else
        {
        }
LABEL_26:
        if (IMOSLoggingEnabled())
        {
          int v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v18 = [v11 guid];
            *(_DWORD *)buf = 138412290;
            uint64_t v33 = (uint64_t)v18;
            _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Chat with guid is not allowed: %@", buf, 0xCu);
          }
        }
        goto LABEL_30;
      }
      if (IMOSLoggingEnabled())
      {
        id v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = [v11 guid];
          *(_DWORD *)buf = 138412290;
          uint64_t v33 = (uint64_t)v14;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Chat with guid (%@) did not have an unread count greater than 0.", buf, 0xCu);
        }
      }
    }
    uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v36 count:16];
  }
  while (v8);
LABEL_35:

  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218240;
      uint64_t v33 = v27;
      __int16 v34 = 2048;
      uint64_t v35 = v7;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Determined unread badge count is %ld after filtering, totalUnreadCount: %ld", buf, 0x16u);
    }
  }
  return v27;
}

- (id)_handleStringsForChat:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 participants];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "ID", (void)v14);
        id v11 = objc_msgSend(v10, "im_stripCategoryLabel");

        if ([v11 length]) {
          [v4 addObject:v11];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }

  uint64_t v12 = (void *)[v4 copy];

  return v12;
}

- (id)_handleIDsForChat:(id)a3
{
  id v3 = [a3 participants];
  id v4 = objc_msgSend(v3, "__imArrayByApplyingBlock:", &unk_1F3391480);

  return v4;
}

- (void)cleanseAttachments
{
  id v2 = [MEMORY[0x1E4F6BF78] sharedInstance];
  [v2 cleanseOrphanedFileTransfers];
}

- (BOOL)isAttachmentReferencedByMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  IMMessageGuidFromIMFileTransferGuid();
  id v5 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v5)
  {
    uint64_t v6 = [(IMDMessageStore *)self itemWithGUID:v5];
    if (v6)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = v6;
        uint64_t v8 = [v7 balloonBundleID];
        uint64_t v9 = [v8 length];

        uint64_t v10 = [v7 messagePartIndexForAttachmentMessagePartWithTransferGUID:v4];
        if (!v9 && v10 == 0x7FFFFFFFFFFFFFFFLL)
        {
          if (IMOSLoggingEnabled())
          {
            id v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              uint64_t v12 = [v7 balloonBundleID];
              int v16 = 138412802;
              id v17 = v4;
              __int16 v18 = 2112;
              uint64_t v19 = @"NO";
              __int16 v20 = 2112;
              id v21 = v12;
              _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Attachment %@ orphaned: not in message(nil:%@), bundle %@", (uint8_t *)&v16, 0x20u);
            }
          }
LABEL_27:

          goto LABEL_28;
        }
        goto LABEL_18;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v7 = v6;
        if (([v7 actionIsGroupPhoto] & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            long long v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              int v16 = 138412546;
              id v17 = v4;
              __int16 v18 = 2048;
              uint64_t v19 = (__CFString *)[v7 actionType];
              _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Attachment %@ orphaned: not in group action type %lu", (uint8_t *)&v16, 0x16u);
            }
          }
          goto LABEL_27;
        }
LABEL_18:

        BOOL v13 = 1;
LABEL_29:

        goto LABEL_30;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v16 = 138412546;
          id v17 = v4;
          __int16 v18 = 2048;
          uint64_t v19 = (__CFString *)[v6 type];
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Attachment %@ orphaned: not in item type %lu", (uint8_t *)&v16, 0x16u);
        }
        goto LABEL_27;
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412546;
        id v17 = v4;
        __int16 v18 = 2112;
        uint64_t v19 = v5;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Attachment %@ orphaned: mssage %@ not found", (uint8_t *)&v16, 0x16u);
      }
      goto LABEL_27;
    }
LABEL_28:
    BOOL v13 = 0;
    goto LABEL_29;
  }
  BOOL v13 = 0;
LABEL_30:

  return v13;
}

- (BOOL)isSuppressDatabaseUpdates
{
  return self->_suppressedUpdates;
}

- (void)_suppressDBUpdateTimerFired
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "suppress DB update timer fired", v5, 2u);
    }
  }
  [(NSTimer *)self->_suppressedUpdatesTimer invalidate];
  suppressedUpdatesTimer = self->_suppressedUpdatesTimer;
  self->_suppressedUpdatesTimer = 0;

  self->_suppressedUpdates = 0;
  [(IMDMessageStore *)self updateStamp];
}

- (void)setSuppressDatabaseUpdates:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      BOOL v11 = v3;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "setSuppressDatabaseUpdates called with suppressUpdates %d ", buf, 8u);
    }
  }
  suppressedUpdatesTimer = self->_suppressedUpdatesTimer;
  if (suppressedUpdatesTimer)
  {
    [(NSTimer *)suppressedUpdatesTimer invalidate];
    uint64_t v7 = self->_suppressedUpdatesTimer;
    self->_suppressedUpdatesTimer = 0;
  }
  self->_suppressedUpdates = v3;
  if (v3)
  {
    uint64_t v8 = [MEMORY[0x1E4F29060] mainThread];
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = sub_1D9785B2C;
    v9[3] = &unk_1E6B73268;
    v9[4] = self;
    objc_msgSend(v8, "__im_performBlock:", v9);
  }
  else
  {
    [(IMDMessageStore *)self updateStamp];
  }
}

- (void)retractPostedNotificationsForMessageGUIDs:(id)a3
{
  id v3 = a3;
  int v4 = IMSupportsUserNotifications();
  if (v3 && v4 && [v3 count])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v6 = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Going to retract user notifications for read messages", v6, 2u);
      }
    }
    IMDNotificationsRetractNotificationsForReadMessages();
  }
}

- (void)retractPostedNotificationsForMessagesMatchingChatGUIDs:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = IMSupportsUserNotifications();
  if (v3 && v4 && [v3 count])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = 138412290;
        id v7 = v3;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Retract notification for messages matching chats: %@", (uint8_t *)&v6, 0xCu);
      }
    }
    IMDMessageRecordRetractNotificationsForMessagesMatchingChatGUIDs();
  }
}

- (void)postUrgentNotificationsForMessageGUIDs:(id)a3
{
  id v3 = a3;
  if (IMSupportsUserNotifications() && [v3 count])
  {
    if (IMOSLoggingEnabled())
    {
      int v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Posting urgent notifications for messages", v8, 2u);
      }
    }
    id v5 = +[IMDAccountController sharedInstance];
    int v6 = [v5 activeAliases];

    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v6 forKey:*MEMORY[0x1E4F6BF28]];
    IMDNotificationsPostUrgentNotificationsForMessages();
  }
}

- (void)updatePostedNotificationsForMessageGUIDs:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMSupportsUserNotifications() && [v3 count])
  {
    if (IMOSLoggingEnabled())
    {
      int v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412290;
        id v9 = v3;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Updating posted notifications for messages: %@", (uint8_t *)&v8, 0xCu);
      }
    }
    id v5 = +[IMDAccountController sharedInstance];
    int v6 = [v5 activeAliases];

    id v7 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v6 forKey:*MEMORY[0x1E4F6BF28]];
    IMDNotificationsUpdatePostedNotificationsForMessages();
  }
}

- (void)__postDBUpdate
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel___postDBUpdate object:0];
  id v3 = +[IMDBroadcastController sharedProvider];
  int v4 = [v3 broadcasterForChatDatabaseListeners];
  id v5 = [(IMDMessageStore *)self modificationStamp];
  [v4 databaseUpdated:v5];

  [(IMDMessageStore *)self postCountChanges];
  if (IMSupportsUserNotifications())
  {
    if (IMOSLoggingEnabled())
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v8 = 0;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Going to post user notifications", v8, 2u);
      }
    }
    id v7 = [(IMDMessageStore *)self notificationContext];
    IMDNotificationsPostNotificationsWithContext();
  }
}

- (void)_postDBUpdate
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel___postDBUpdate object:0];

  [(IMDMessageStore *)self performSelector:sel___postDBUpdate withObject:0 afterDelay:0.2];
}

- (void)updateStamp
{
  [(IMDMessageStore *)self _updateModificationDate];
  if (!self->_suppressedUpdates)
  {
    MEMORY[0x1F4181798](self, sel__postDBUpdate);
  }
}

- (void)databaseChatSpamUpdated:(id)a3
{
  id v3 = a3;
  id v5 = +[IMDBroadcastController sharedProvider];
  int v4 = [v5 broadcasterForChatDatabaseListeners];
  [v4 databaseChatSpamUpdated:v3];
}

- (id)notificationContext
{
  id v2 = +[IMDAccountController sharedInstance];
  id v3 = [v2 activeAliases];

  int v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v3 forKey:*MEMORY[0x1E4F6BF28]];

  return v4;
}

- (BOOL)_shouldUseBadgeUtilities
{
  return 1;
}

- (void)rebuildLastFailedMessageDate
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  cachedLastint64_t FailedMessageDate = self->_cachedLastFailedMessageDate;
  self->_cachedLastint64_t FailedMessageDate = 0;

  if (self->_suppressedUpdates)
  {
    if (IMOSLoggingEnabled())
    {
      int v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Suppressed: Rebuilding lastFailedMessageDateChanged", (uint8_t *)&v10, 2u);
      }
    }
  }
  else
  {
    int64_t v5 = [(IMDMessageStore *)self lastFailedMessageDate];
    if (IMOSLoggingEnabled())
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v10 = 134217984;
        int64_t v11 = v5;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Rebuilding lastFailedMessageDateChanged with new value: %lld ", (uint8_t *)&v10, 0xCu);
      }
    }
    id v7 = +[IMDBroadcastController sharedProvider];
    int v8 = [v7 broadcasterForChatCountsListeners];
    [v8 lastFailedMessageDateChanged:v5];

    id v9 = +[IMDBadgeUtilities sharedInstance];
    [v9 updateBadgeForLastFailedMessageDateChangeIfNeeded:v5];
  }
}

- (void)rebuildUnreadMessageCount
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  cachedUnreadMessageCount = self->_cachedUnreadMessageCount;
  self->_cachedUnreadMessageCount = 0;

  if (self->_suppressedUpdates)
  {
    if (IMOSLoggingEnabled())
    {
      int v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Suppressed: Rebuilding/Broadcasting unreadCountChanged", (uint8_t *)&v10, 2u);
      }
    }
  }
  else
  {
    int64_t v5 = [(IMDMessageStore *)self unreadMessagesCount];
    if (IMOSLoggingEnabled())
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v10 = 134217984;
        int64_t v11 = v5;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Rebuilding/Broadcasting unreadCountChanged with new value: %lld ", (uint8_t *)&v10, 0xCu);
      }
    }
    id v7 = +[IMDBroadcastController sharedProvider];
    int v8 = [v7 broadcasterForChatCountsListeners];
    [v8 unreadCountChanged:v5];

    [(IMDMessageStore *)self _notifyWidgetKitTimeline:v5];
    if ([(IMDMessageStore *)self _shouldUseBadgeUtilities])
    {
      id v9 = +[IMDBadgeUtilities sharedInstance];
      [v9 updateBadgeForUnreadCountChangeIfNeeded:v5];
    }
  }
}

- (void)postCountChanges
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (self->_suppressedUpdates)
  {
    if (IMOSLoggingEnabled())
    {
      id v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "Suppressed: Broadcasting unreadCountChanged", (uint8_t *)&v15, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        LOWORD(v15) = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Suppressed: Broadcasting lastFailedMessageDateChanged", (uint8_t *)&v15, 2u);
      }
    }
  }
  else
  {
    int64_t v5 = [(IMDMessageStore *)self unreadMessagesCount];
    int64_t v6 = [(IMDMessageStore *)self lastFailedMessageDate];
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v15 = 134217984;
        int64_t v16 = v5;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Broadcasting unreadCountChanged with new value: %lld ", (uint8_t *)&v15, 0xCu);
      }
    }
    int v8 = +[IMDBroadcastController sharedProvider];
    id v9 = [v8 broadcasterForChatCountsListeners];
    [v9 unreadCountChanged:v5];

    [(IMDMessageStore *)self _notifyWidgetKitTimeline:v5];
    if ([(IMDMessageStore *)self _shouldUseBadgeUtilities])
    {
      int v10 = +[IMDBadgeUtilities sharedInstance];
      [v10 updateBadgeForUnreadCountChangeIfNeeded:v5];
    }
    if (IMOSLoggingEnabled())
    {
      int64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v15 = 134217984;
        int64_t v16 = v6;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Broadcasting lastFailedMessageDateChanged with new value: %lld ", (uint8_t *)&v15, 0xCu);
      }
    }
    uint64_t v12 = +[IMDBroadcastController sharedProvider];
    BOOL v13 = [v12 broadcasterForChatCountsListeners];
    [v13 lastFailedMessageDateChanged:v6];

    long long v14 = +[IMDBadgeUtilities sharedInstance];
    [v14 updateBadgeForLastFailedMessageDateChangeIfNeeded:v6];
  }
}

- (void)_notifyWidgetKitTimeline:(int64_t)a3
{
  if ([(IMDMessageStore *)self lastNotifiedUnreadCount] != a3)
  {
    MEMORY[0x1F4181798](self, sel_setLastNotifiedUnreadCount_);
  }
}

- (id)replaceMessageAcknowledgmentsWithNewMessageAcknowledgment:(id)a3 associatedMessageGUID:(id)a4 sender:(id)a5
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v51 = a5;
  int v52 = v7;
  if (!v7)
  {
    id v9 = v8;
    *(_OWORD *)id v55 = xmmword_1E6B76098;
    *(_OWORD *)&v55[16] = *(_OWORD *)off_1E6B760A8;
    uint64_t v56 = 2789;
    int v10 = NSString;
    uint64_t v11 = IMFileLocationTrimFileName();
    uint64_t v12 = [NSString stringWithFormat:&stru_1F3398578];
    BOOL v13 = [v10 stringWithFormat:@"Unexpected nil '%@' in %s at %s:%d. %@", @"newGUID", "-[IMDMessageStore replaceMessageAcknowledgmentsWithNewMessageAcknowledgment:associatedMessageGUID:sender:]", v11, 2789, v12];

    long long v14 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v14)
    {
      v14(v13);
    }
    else if (IMOSLoggingEnabled())
    {
      int v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v54 = v13;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }
    }
    id v8 = v9;
    if (v9) {
      goto LABEL_18;
    }
    goto LABEL_11;
  }
  if (!v8)
  {
LABEL_11:
    id v16 = v8;
    *(_OWORD *)id v55 = xmmword_1E6B760C0;
    *(_OWORD *)&v55[16] = *(_OWORD *)off_1E6B760D0;
    uint64_t v56 = 2790;
    uint64_t v17 = NSString;
    uint64_t v18 = IMFileLocationTrimFileName();
    uint64_t v19 = v56;
    __int16 v20 = [NSString stringWithFormat:&stru_1F3398578];
    id v21 = [v17 stringWithFormat:@"Unexpected nil '%@' in %s at %s:%d. %@", @"associatedMessageGUID", "-[IMDMessageStore replaceMessageAcknowledgmentsWithNewMessageAcknowledgment:associatedMessageGUID:sender:]", v18, v19, v20];

    uint64_t v22 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v22)
    {
      v22(v21);
    }
    else if (IMOSLoggingEnabled())
    {
      int v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v54 = v21;
        _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }
    }
    id v8 = v16;
  }
LABEL_18:
  int v50 = v8;
  CFArrayRef v24 = (const __CFArray *)IMDMessageRecordCopyArrayOfAssociatedMessagesForMessageGUIDFromSender();
  id v25 = 0;
  if (v25)
  {
    if (IMOSLoggingEnabled())
    {
      id v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        int64_t v27 = [v25 localizedDescription];
        *(_DWORD *)id v55 = 138412290;
        *(void *)&v55[4] = v27;
        _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Deleting previous acknowledgments failed with error: %@", v55, 0xCu);
      }
    }
    id v28 = 0;
    goto LABEL_49;
  }
  CFIndex Count = CFArrayGetCount(v24);
  if (Count < 1)
  {
    id v31 = 0;
    id v28 = 0;
    goto LABEL_48;
  }
  CFIndex v30 = 0;
  id v31 = 0;
  id v28 = 0;
  do
  {
    ValueAtIndex = CFArrayGetValueAtIndex(v24, v30);
    if (!ValueAtIndex) {
      goto LABEL_43;
    }
    id AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef((uint64_t)ValueAtIndex, 0);
    __int16 v34 = AttachmentIfNeededRef;
    if (AttachmentIfNeededRef)
    {
      unint64_t v35 = [AttachmentIfNeededRef associatedMessageType] & 0xFFFFFFFFFFFFFFF8;
      if (v35 != 3000 && v35 != 2000
        || ([v34 guid],
            unint64_t v36 = objc_claimAutoreleasedReturnValue(),
            char v37 = [v36 isEqual:v52],
            v36,
            (v37 & 1) != 0))
      {
        unint64_t v38 = IMLogHandleForCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          unsigned __int8 v39 = [v34 guid];
          id v40 = [v34 associatedMessageGUID];
          uint64_t v41 = [v34 associatedMessageType];
          *(_DWORD *)id v55 = 138412802;
          *(void *)&v55[4] = v39;
          *(_WORD *)&v55[12] = 2112;
          *(void *)&v55[14] = v40;
          *(_WORD *)&v55[22] = 2048;
          *(void *)&v55[24] = v41;
          _os_log_impl(&dword_1D967A000, v38, OS_LOG_TYPE_INFO, "Will NOT delete old ack %@: %@: %lld", v55, 0x20u);
        }
        goto LABEL_42;
      }
      id v42 = IMLogHandleForCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        uint64_t v43 = [v34 guid];
        int v44 = [v34 associatedMessageGUID];
        uint64_t v45 = [v34 associatedMessageType];
        *(_DWORD *)id v55 = 138412802;
        *(void *)&v55[4] = v43;
        *(_WORD *)&v55[12] = 2112;
        *(void *)&v55[14] = v44;
        *(_WORD *)&v55[22] = 2048;
        *(void *)&v55[24] = v45;
        _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "Will delete old ack %@: %@: %lld", v55, 0x20u);
      }
      if (v28)
      {
        if (!v31) {
          goto LABEL_40;
        }
      }
      else
      {
        id v28 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if (!v31) {
LABEL_40:
        }
          id v31 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      int v46 = [v34 guid];
      [v31 addObject:v46];

      [v28 addObject:v34];
    }
LABEL_42:

LABEL_43:
    ++v30;
  }
  while (Count != v30);
  if (v31 && [v31 count]) {
    id v47 = [(IMDMessageStore *)self deleteMessageGUIDs:v31];
  }
LABEL_48:

LABEL_49:
  if (v24) {
    CFRelease(v24);
  }

  return v28;
}

- (id)_fileTransferGUIDsInMessageBody:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 length];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  uint64_t v6 = *MEMORY[0x1E4F6C188];
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1D9787138;
  v10[3] = &unk_1E6B760F0;
  id v11 = v5;
  id v7 = v5;
  objc_msgSend(v3, "enumerateAttribute:inRange:options:usingBlock:", v6, 0, v4, 0, v10);

  id v8 = [v7 array];

  return v8;
}

- (id)addEditHistoryToMessage:(id)a3 editedPartIndex:(int64_t)a4 editType:(unint64_t)a5 previousMessage:(id)a6
{
  id v8 = a3;
  id v9 = a6;
  int v10 = [v8 body];
  int v46 = v9;
  id v11 = [v9 body];
  if (!v11)
  {
    uint64_t v12 = [v9 plainBody];
    BOOL v13 = (void *)v12;
    long long v14 = &stru_1F3398578;
    if (v12) {
      long long v14 = (__CFString *)v12;
    }
    int v15 = v14;

    id v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v15];
  }
  id v16 = objc_msgSend(v8, "originalTextRangesByPartIndex", a5);
  uint64_t v17 = [v16 count];

  if (v17)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_11;
    }
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Message already had originalTextRangesByPartIndex, messages is being edited for a second (or more) time. Not overriding original values.", buf, 2u);
    }
  }
  else
  {
    uint64_t v18 = objc_msgSend(v11, "__im_messagePartIndexToRangeMap");
    [v8 setOriginalTextRangesByPartIndex:v18];
  }

LABEL_11:
  uint64_t v19 = [v8 historyForMessagePart:a4];
  __int16 v20 = (void *)[v19 mutableCopy];
  id v21 = v20;
  if (v20) {
    id v22 = v20;
  }
  else {
    id v22 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  }
  int v23 = v22;

  if (![v23 count])
  {
    CFArrayRef v24 = v10;
    id v25 = objc_msgSend(v11, "__im_messagePartMatchingPartIndex:", a4);
    id v26 = [v25 messagePartBody];
    int64_t v27 = v26;
    if (v26) {
      id v28 = v26;
    }
    else {
      id v28 = objc_alloc_init(MEMORY[0x1E4F28B18]);
    }
    long long v29 = v28;

    id v30 = objc_alloc(MEMORY[0x1E4F6E870]);
    id v31 = [v46 time];
    id v32 = (void *)[v30 initWithMessagePartText:v29 dateSent:v31 backwardCompatibleMessageGUID:0];

    [v23 addObject:v32];
    int v10 = v24;
  }
  uint64_t v33 = v10;
  __int16 v34 = objc_msgSend(v10, "__im_messagePartMatchingPartIndex:", a4);
  unint64_t v35 = [v34 messagePartBody];
  unint64_t v36 = v35;
  if (v35) {
    id v37 = v35;
  }
  else {
    id v37 = objc_alloc_init(MEMORY[0x1E4F28B18]);
  }
  unint64_t v38 = v37;

  id v39 = objc_alloc(MEMORY[0x1E4F6E870]);
  id v40 = [v8 dateEdited];
  uint64_t v41 = (void *)[v39 initWithMessagePartText:v38 dateSent:v40 backwardCompatibleMessageGUID:0];

  [v23 addObject:v41];
  if (v45 == 2)
  {
    if ([v8 scheduleType] != 2)
    {
      [v8 setHistory:MEMORY[0x1E4F1CBF0] forMessagePart:a4];
      goto LABEL_28;
    }
LABEL_26:
    id v42 = (void *)[v23 copy];
    [v8 setHistory:v42 forMessagePart:a4];

    goto LABEL_28;
  }
  if (v45 == 1) {
    goto LABEL_26;
  }
LABEL_28:

  return v8;
}

- (id)storeEditedMessage:(id)a3 editedPartIndex:(int64_t)a4 editType:(unint64_t)a5 previousMessage:(id)a6 chat:(id)a7 updatedAssociatedMessageItems:(id *)a8
{
  long long v14 = (void *)MEMORY[0x1E4F28D60];
  id v15 = a7;
  id v16 = a6;
  id v17 = a3;
  uint64_t v18 = [v14 indexSetWithIndex:a4];
  uint64_t v19 = [(IMDMessageStore *)self storeEditedMessage:v17 editedPartIndexes:v18 editType:a5 previousMessage:v16 chat:v15 updatedAssociatedMessageItems:a8];

  return v19;
}

- (id)storeEditedMessage:(id)a3 editedPartIndexes:(id)a4 editType:(unint64_t)a5 previousMessage:(id)a6 chat:(id)a7 updatedAssociatedMessageItems:(id *)a8
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v79 = a4;
  id v13 = a6;
  id v78 = a7;
  v83 = [v13 guid];
  if (IMOSLoggingEnabled())
  {
    long long v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v83;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Applying edits to the content of message: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  v80 = [v12 body];
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v109 = 0x3032000000;
  v110 = sub_1D977FFCC;
  v111 = sub_1D977FFDC;
  id v112 = 0;
  id v15 = v12;
  id v112 = v15;
  v95[0] = MEMORY[0x1E4F143A8];
  v95[1] = 3221225472;
  v95[2] = sub_1D978824C;
  v95[3] = &unk_1E6B76118;
  v95[4] = self;
  p_long long buf = &buf;
  unint64_t v98 = a5;
  id v82 = v13;
  id v96 = v82;
  [v79 enumerateIndexesUsingBlock:v95];
  id v86 = *(id *)(*((void *)&buf + 1) + 40);

  id v16 = v86;
  if ([v86 isFullyRetracted])
  {
    if ([v86 isRead])
    {
      uint64_t v17 = 0;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v99 = 0;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Message no longer contains any parts, all parts have been retracted, marking message as read", v99, 2u);
        }

        id v16 = v86;
      }
      objc_msgSend(v16, "setFlags:", objc_msgSend(v16, "flags") | 0x2000);
      uint64_t v19 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithCurrentServerTime");
      [v16 setTimeRead:v19];

      uint64_t v17 = 0x2000;
      id v16 = v86;
    }
    __int16 v20 = [v16 payloadData];
    BOOL v21 = [v20 length] == 0;

    if (v21) {
      goto LABEL_20;
    }
    id v22 = v86;
    if (IMOSLoggingEnabled())
    {
      int v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v99 = 0;
        _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Message is fully retracted, deleting payload data", v99, 2u);
      }

      id v22 = v86;
    }
    [v22 setPayloadData:0];
    CFArrayRef v24 = [v22 retractedPartIndexes];
    BOOL v25 = [v24 count] == 0;

    if (v25)
    {
      id v16 = v86;
      if (IMOSLoggingEnabled())
      {
        id v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v99 = 0;
          _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "We retracted the payload data on a message that had no body and was a payload only. Inserting a retraction stamp at index 0.", v99, 2u);
        }

        id v16 = v86;
      }
      [v16 addRetractedPartIndex:0];
    }
    else
    {
LABEL_20:
      id v16 = v86;
    }
  }
  else
  {
    uint64_t v17 = 0;
  }
  if ([v16 errorCode]) {
    [v16 setErrorCode:0];
  }
  [v16 setCloudKitSyncState:0];
  if ([MEMORY[0x1E4F6E730] supportsDataDetectors])
  {
    int64_t v27 = (void *)[v80 mutableCopy];
    id v28 = [v80 string];
    [v16 isFromMe];
    long long v29 = [v16 time];
    id v30 = IMDDataDectorDictionaryForMessageItem();
    id v31 = [v16 sender];
    id v32 = v31;
    if (v31)
    {
      id v33 = v31;
    }
    else
    {
      id v33 = [v86 handle];
    }
    unint64_t v35 = v33;

    int v36 = IMDDScanAttributedStringWithExtendedContext();
    id v37 = (void *)[v27 copy];
    [v86 setBody:v37];

    unint64_t v38 = [v86 flags] & 0xFFFFFFFFFFFEFFFFLL;
    uint64_t v39 = 0x10000;
    if (!v36) {
      uint64_t v39 = 0;
    }
    [v86 setFlags:v38 | v39];

    uint64_t v34 = v17 | 0x10000;
    id v16 = v86;
  }
  else
  {
    uint64_t v34 = v17;
  }
  uint64_t v74 = v34;
  LODWORD(v72) = 16777473;
  id v40 = -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:isIncomingMessage:didReplaceBlock:](self, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:isIncomingMessage:didReplaceBlock:", v16, 1, 1, v34 != 0, v72, 0);
  uint64_t v41 = [(IMDMessageStore *)self messageWithGUID:v83];
  id v42 = +[IMDChatRegistry sharedInstance];
  [v42 updateStateForChat:v78 forcePost:1 shouldRebuildFailedMessageDate:0 shouldCalculateUnreadCount:1];
  v75 = v42;
  id v81 = (id)v41;
  id v77 = [(IMDMessageStore *)self _updateAssociatedMessageItemsFromMessage:v82 toMessage:v41];
  if (a8) {
    *a8 = v77;
  }
  uint64_t v43 = [v82 fileTransferGUIDs];
  int v44 = [(IMDMessageStore *)self _fileTransferGUIDsInMessageBody:v80];
  if ([v86 scheduleType] == 2) {
    [v86 setScheduledMessageOriginalTransferGUIDs:v43];
  }
  long long v93 = 0u;
  long long v94 = 0u;
  long long v91 = 0u;
  long long v92 = 0u;
  id v45 = v43;
  uint64_t v46 = [v45 countByEnumeratingWithState:&v91 objects:v107 count:16];
  if (v46)
  {
    int v85 = 0;
    uint64_t v47 = *(void *)v92;
    do
    {
      for (uint64_t i = 0; i != v46; ++i)
      {
        if (*(void *)v92 != v47) {
          objc_enumerationMutation(v45);
        }
        __int16 v49 = *(void **)(*((void *)&v91 + 1) + 8 * i);
        if (([v44 containsObject:v49] & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            int v50 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)v99 = 138412290;
              id v100 = v49;
              _os_log_impl(&dword_1D967A000, v50, OS_LOG_TYPE_INFO, "Edited message does not contain file transfer guid: %@", v99, 0xCu);
            }
          }
          id v51 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
          int v52 = [v51 isScheduledMessagesCoreEnabled];

          if (v52 && [v86 scheduleType] == 2 && objc_msgSend(v86, "scheduleState") == 2)
          {
            id v53 = [v86 fileTransferGUIDs];
            uint64_t v54 = (void *)[v53 mutableCopy];

            [v54 removeObject:v49];
            [v86 setFileTransferGUIDs:v54];
            int v85 = 1;
          }
          else
          {
            uint64_t v54 = +[IMDAttachmentStore sharedInstance];
            [v54 deleteAttachmentWithGUID:v49];
          }
        }
      }
      uint64_t v46 = [v45 countByEnumeratingWithState:&v91 objects:v107 count:16];
    }
    while (v46);
  }
  else
  {
    int v85 = 0;
  }

  id v55 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v56 = [v55 isScheduledMessagesCoreEnabled];

  if ((v56 & v85) == 1)
  {
    LOWORD(v73) = 257;
    uint64_t v57 = -[IMDMessageStore storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:](self, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v86, 1, 1, v74 != 0, v73);

    id v81 = (id)v57;
  }
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id v58 = v44;
  uint64_t v59 = [v58 countByEnumeratingWithState:&v87 objects:v106 count:16];
  if (v59)
  {
    uint64_t v60 = *(void *)v88;
    do
    {
      for (uint64_t j = 0; j != v59; ++j)
      {
        if (*(void *)v88 != v60) {
          objc_enumerationMutation(v58);
        }
        long long v62 = *(void **)(*((void *)&v87 + 1) + 8 * j);
        if (([v45 containsObject:v62] & 1) == 0)
        {
          long long v63 = IMLogHandleForCategory();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)v99 = 138412290;
            id v100 = v62;
            _os_log_error_impl(&dword_1D967A000, v63, OS_LOG_TYPE_ERROR, "Edited message contains a file transfer not found in original message. FileTransferGuid: %@", v99, 0xCu);
          }
        }
      }
      uint64_t v59 = [v58 countByEnumeratingWithState:&v87 objects:v106 count:16];
    }
    while (v59);
  }

  if (v83)
  {
    v105 = v83;
    [MEMORY[0x1E4F1C978] arrayWithObjects:&v105 count:1];
    v65 = id v64 = v81;
  }
  else
  {
    long long v65 = (void *)MEMORY[0x1E4F1CBF0];
    id v64 = v81;
  }
  [(IMDMessageStore *)self updatePostedNotificationsForMessageGUIDs:v65];
  if (!v64)
  {
    long long v66 = IMLogHandleForCategory();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_ERROR)) {
      sub_1D9902CE8();
    }

    __int16 v67 = IMLogHandleForCategory();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_ERROR))
    {
      __int16 v71 = [NSNumber numberWithUnsignedInteger:a5];
      *(_DWORD *)v99 = 138412802;
      id v100 = v79;
      __int16 v101 = 2112;
      v102 = v71;
      __int16 v103 = 2112;
      id v104 = v82;
      _os_log_error_impl(&dword_1D967A000, v67, OS_LOG_TYPE_ERROR, "partIndexes: %@ editType: %@ previousMessage: %@", v99, 0x20u);
    }
    id v68 = [MEMORY[0x1E4F28C58] errorWithDomain:@"IMDMessageStoreDomain" code:0 userInfo:0];
    __int16 v69 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v69 forceAutoBugCaptureWithSubType:@"Store Edited Message Failed" errorPayload:v68];
  }
  _Block_object_dispose(&buf, 8);

  return v81;
}

- (id)_updateAssociatedMessageItemsFromMessage:(id)a3 toMessage:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 guid];
  id v9 = [v7 retractedPartIndexes];
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v18 = MEMORY[0x1E4F143A8];
  uint64_t v19 = 3221225472;
  __int16 v20 = sub_1D9788510;
  BOOL v21 = &unk_1E6B76140;
  objc_copyWeak(&v24, &location);
  id v12 = v8;
  id v22 = v12;
  id v13 = v10;
  id v23 = v13;
  [v9 enumerateIndexesUsingBlock:&v18];
  if (objc_msgSend(v13, "count", v18, v19, v20, v21))
  {
    if (IMOSLoggingEnabled())
    {
      long long v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v27 = v13;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Deleting associated message GUIDs: %@", buf, 0xCu);
      }
    }
    id v15 = [(IMDMessageStore *)self deleteMessageGUIDs:v13];
  }
  id v16 = (void *)[v11 copy];

  objc_destroyWeak(&v24);
  objc_destroyWeak(&location);

  return v16;
}

- (id)storeRepositionedStickerWithMetadata:(id)a3 fileTransferGUID:(id)a4 repositioningFromLocalChange:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = +[IMDFileTransferCenter sharedInstance];
  id v11 = [v10 transferForGUID:v9];

  id v12 = [v11 stickerUserInfo];
  id v13 = (void *)[v12 mutableCopy];

  uint64_t v14 = *MEMORY[0x1E4F6E3C0];
  id v15 = [v13 objectForKey:*MEMORY[0x1E4F6E3C0]];
  unint64_t v16 = [v15 unsignedIntegerValue];

  uint64_t v17 = [v8 objectForKey:v14];
  unint64_t v18 = [v17 unsignedIntegerValue];

  if (v16 >= v18)
  {
    if (IMOSLoggingEnabled())
    {
      unint64_t v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "Don't store the new sticker user info", buf, 2u);
      }
    }
    id v33 = 0;
  }
  else
  {
    uint64_t v41 = self;
    BOOL v42 = v5;
    id v45 = v11;
    id v46 = v9;
    uint64_t v40 = *MEMORY[0x1E4F6E3D0];
    uint64_t v19 = objc_msgSend(v8, "objectForKey:");
    uint64_t v39 = *MEMORY[0x1E4F6E3D8];
    int v50 = objc_msgSend(v8, "objectForKey:");
    uint64_t v20 = *MEMORY[0x1E4F6E380];
    uint64_t v21 = [v8 objectForKey:*MEMORY[0x1E4F6E380]];
    uint64_t v38 = *MEMORY[0x1E4F6E378];
    __int16 v49 = objc_msgSend(v8, "objectForKey:");
    uint64_t v22 = *MEMORY[0x1E4F6E370];
    id v23 = [v8 objectForKey:*MEMORY[0x1E4F6E370]];
    uint64_t v48 = [v8 objectForKey:v14];
    uint64_t v24 = *MEMORY[0x1E4F6E368];
    uint64_t v47 = [v8 objectForKey:*MEMORY[0x1E4F6E368]];
    uint64_t v25 = [v8 objectForKey:v24];
    id v26 = (void *)v25;
    id v27 = &unk_1F33C5B50;
    if (v25) {
      id v27 = (void *)v25;
    }
    id v44 = v27;

    uint64_t v28 = (void *)v21;
    uint64_t v43 = (void *)v19;
    if (v19 && v50 && v21 && v49 && v23 && v48 && v47)
    {
      [v13 setValue:v19 forKey:v40];
      [v13 setValue:v50 forKey:v39];
      [v13 setValue:v21 forKey:v20];
      [v13 setValue:v49 forKey:v38];
      [v13 setValue:v23 forKey:v22];
      long long v29 = (void *)v48;
      [v13 setValue:v48 forKey:v14];
      id v30 = (void *)v47;
      [v13 setValue:v47 forKey:v24];
      id v31 = v44;
      [v13 setValue:v44 forKey:*MEMORY[0x1E4F6E358]];
      [v13 setValue:MEMORY[0x1E4F1CC28] forKey:*MEMORY[0x1E4F6E3B0]];
      id v32 = [(IMDMessageStore *)v41 _fileTransferCenter];
      id v9 = v46;
      [v32 setUpdatedStickerUserInfo:v13 forTransfer:v46 repositioningFromLocalChange:v42];

      id v33 = (void *)[v13 copy];
      uint64_t v34 = v28;
      id v11 = v45;
    }
    else
    {
      uint64_t v34 = (void *)v21;
      int v36 = IMLogHandleForCategory();
      id v9 = v46;
      if (os_log_type_enabled(v36, OS_LOG_TYPE_ERROR)) {
        sub_1D9902D50();
      }

      id v33 = 0;
      id v31 = v44;
      id v11 = v45;
      id v30 = (void *)v47;
      long long v29 = (void *)v48;
    }
  }

  return v33;
}

- (id)storeRepositionedStickerLocally:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 messageSummaryInfo];
  id v6 = [v5 objectForKey:*MEMORY[0x1E4F6D6A0]];

  id v7 = [v4 fileTransferGUIDs];

  id v8 = [v7 firstObject];

  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  if (v9)
  {
    id v10 = 0;
  }
  else
  {
    id v10 = [(IMDMessageStore *)self storeRepositionedStickerWithMetadata:v6 fileTransferGUID:v8 repositioningFromLocalChange:1];
  }

  return v10;
}

- (void)loadConsumedSessionPayloadsForItems:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v3 = objc_msgSend(v19, "__imArrayByFilteringWithBlock:", &unk_1F33914A0);
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA80]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id obj = v3;
  uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v23 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        BOOL v9 = [v8 pluginSessionGUID];
        if ([v4 containsObject:v9])
        {
          if (IMOSLoggingEnabled())
          {
            id v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              id v11 = [v8 balloonBundleID];
              *(_DWORD *)long long buf = 138412802;
              id v27 = v8;
              __int16 v28 = 2112;
              uint64_t v29 = (uint64_t)v11;
              __int16 v30 = 2112;
              id v31 = v9;
              _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Observed more than one unconsumed breadcrumb: %@ for '%@' session %@", buf, 0x20u);
            }
          }
        }
        else
        {
          id v12 = +[IMDMessageStore sharedInstance];
          id v13 = [v12 messagesWithAssociatedGUID:v9 shouldLoadAttachments:0];
          v21[0] = MEMORY[0x1E4F143A8];
          v21[1] = 3221225472;
          _DWORD v21[2] = sub_1D9789080;
          v21[3] = &unk_1E6B76188;
          v21[4] = v8;
          uint64_t v14 = objc_msgSend(v13, "__imArrayByFilteringWithBlock:", v21);

          id v15 = IMGetConsumedSessionPayloadsForBreadcrumbItems();
          [v8 setConsumedSessionPayloads:v15];

          if (IMOSLoggingEnabled())
          {
            unint64_t v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              uint64_t v17 = [v8 consumedSessionPayloads];
              uint64_t v18 = [v17 count];
              *(_DWORD *)long long buf = 138412546;
              id v27 = v8;
              __int16 v28 = 2048;
              uint64_t v29 = v18;
              _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "History query found breadcrumb %@ with payload history: %tu items.", buf, 0x16u);
            }
          }
          [v4 addObject:v9];
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v22 objects:v32 count:16];
    }
    while (v5);
  }
}

- (BOOL)_itemClassShouldUpdateTransferForItem:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();

  return isKindOfClass & 1;
}

- (id)messageRecordsToUploadToCloudKitWithFilter:(unint64_t)a3 limit:(int64_t)a4
{
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Trying to Load Message Records that need CK Sync", v7, 2u);
    }
  }
  uint64_t v5 = (void *)IMDMessageRecordCopyMessagesToUploadToCloudKitWithLimit();

  return v5;
}

- (id)messagesThatNeedSyncWithCloudKitWithFilter:(unint64_t)a3 limit:(int64_t)a4
{
  return [(IMDMessageStore *)self _messagesThatNeedSyncWithCloudKitWithFilter:a3 limit:a4 attemptCount:0];
}

- (id)_messagesThatNeedSyncWithCloudKitWithFilter:(unint64_t)a3 limit:(int64_t)a4 attemptCount:(unint64_t)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  int v7 = IMOSLoggingEnabled();
  unint64_t v31 = a5;
  if (a5 < 0x64)
  {
    if (v7)
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134218240;
        int64_t v35 = a4;
        __int16 v36 = 2048;
        unint64_t v37 = v31;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "load messages needing CK sync with limit %ld, attemptCount %lu", buf, 0x16u);
      }
    }
    id v11 = [(IMDMessageStore *)self messageRecordsToUploadToCloudKitWithFilter:a3 limit:a4];
    id v12 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if (![v11 count]) {
      goto LABEL_41;
    }
    unint64_t v14 = 0;
    char v15 = 0;
    *(void *)&long long v13 = 134217984;
    long long v30 = v13;
    do
    {
      uint64_t v16 = objc_msgSend(v11, "objectAtIndex:", v14, v30);
      id AttachmentIfNeededRef = (void *)IMDCreateIMMessageItemFromIMDMessageRecordLoadAttachmentIfNeededRef(v16, 0);
      if (!AttachmentIfNeededRef)
      {
        int64_t v18 = *(void *)(v16 + 16);
        if (IMOSLoggingEnabled())
        {
          id v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = v30;
            int64_t v35 = v18;
            _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "**** Marking message with rowID %lld as clean ***", buf, 0xCu);
          }
        }
        IMDMessageRecordMarkMessageWithROWIDAsSyncedWithCloudKit();
        char v15 = 1;
      }
      if ([(IMDMessageStore *)self _itemClassShouldUpdateTransferForItem:AttachmentIfNeededRef])
      {
        uint64_t v20 = +[IMDAttachmentStore sharedInstance];
        int v21 = [v20 updateTemporaryTransferGUIDsOnMessageIfNeeded:AttachmentIfNeededRef];

        if (v21)
        {
          long long v22 = [AttachmentIfNeededRef guid];
          long long v23 = +[IMDMessageStore sharedInstance];
          uint64_t v24 = [v23 itemWithGUID:v22];

          id AttachmentIfNeededRef = (void *)v24;
        }
      }
      if (v12 && AttachmentIfNeededRef) {
        CFArrayAppendValue(v12, AttachmentIfNeededRef);
      }

      ++v14;
    }
    while ([v11 count] > v14);
    if (v15)
    {
      if (IMOSLoggingEnabled())
      {
        long long v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = v30;
          int64_t v35 = v31;
          _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "**** We had corrupt messages amongst dirty messages. Trying to load messages again. numberOfAttempts %lu", buf, 0xCu);
        }
      }
      id v26 = [(IMDMessageStore *)self _messagesThatNeedSyncWithCloudKitWithFilter:a3 limit:a4 attemptCount:v31 + 1];
    }
    else
    {
LABEL_41:
      if (IMOSLoggingEnabled())
      {
        id v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          uint64_t v28 = [(__CFArray *)v12 count];
          *(_DWORD *)long long buf = 134217984;
          int64_t v35 = v28;
          _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "loaded %lu messages needing CK sync with limit", buf, 0xCu);
        }
      }
      id v26 = v12;
    }
    BOOL v9 = v26;
  }
  else
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "************* We hit max number of attempts to load dirty messages. Bailing for now", buf, 2u);
      }
    }
    return 0;
  }
  return v9;
}

- (id)messagesPendingUpdateT1ToCloudKitWithLimit:(int64_t)a3
{
  return (id)MEMORY[0x1F4181798](self, sel__messagesPendingUpdateT1ToCloudKitWithLimit_attemptCount_);
}

- (id)_messagesPendingUpdateT1ToCloudKitWithLimit:(int64_t)a3 attemptCount:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v6 = IMOSLoggingEnabled();
  if (a4 < 0x64)
  {
    if (v6)
    {
      BOOL v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v13 = 134218240;
        int64_t v14 = a3;
        __int16 v15 = 2048;
        unint64_t v16 = a4;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "load messages needing CK update T1 with limit %ld, attemptCount %lu", (uint8_t *)&v13, 0x16u);
      }
    }
    updated = (void *)IMDMessageRecordCopyMessagesPendingUpdateT1ToCloudKitWithLimit();
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [updated count];
        int v13 = 134217984;
        int64_t v14 = v11;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "loaded %lu messages needing T1 update with limit", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  else
  {
    if (v6)
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "************* We hit max number of attempts to load dirty messages needing a T1 update. Bailing for now", (uint8_t *)&v13, 2u);
      }
    }
    return 0;
  }
  return updated;
}

- (id)messagesPendingUpdateT2ToCloudKitWithLimit:(int64_t)a3
{
  return (id)MEMORY[0x1F4181798](self, sel__messagesPendingUpdateT2ToCloudKitWithLimit_attemptCount_);
}

- (id)_messagesPendingUpdateT2ToCloudKitWithLimit:(int64_t)a3 attemptCount:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v6 = IMOSLoggingEnabled();
  if (a4 < 0x64)
  {
    if (v6)
    {
      BOOL v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v13 = 134218240;
        int64_t v14 = a3;
        __int16 v15 = 2048;
        unint64_t v16 = a4;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "load messages needing CK update T2 with limit %ld, attemptCount %lu", (uint8_t *)&v13, 0x16u);
      }
    }
    updated = (void *)IMDMessageRecordCopyMessagesPendingUpdateT2ToCloudKitWithLimit();
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [updated count];
        int v13 = 134217984;
        int64_t v14 = v11;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "loaded %lu messages needing T2 update with limit", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  else
  {
    if (v6)
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "************* We hit max number of attempts to load dirty messages needing a T2 update. Bailing for now", (uint8_t *)&v13, 2u);
      }
    }
    return 0;
  }
  return updated;
}

- (id)messagesPendingUpdateT3ToCloudKitWithLimit:(int64_t)a3
{
  return (id)MEMORY[0x1F4181798](self, sel__messagesPendingUpdateT3ToCloudKitWithLimit_attemptCount_);
}

- (id)_messagesPendingUpdateT3ToCloudKitWithLimit:(int64_t)a3 attemptCount:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  int v6 = IMOSLoggingEnabled();
  if (a4 < 0x64)
  {
    if (v6)
    {
      BOOL v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v13 = 134218240;
        int64_t v14 = a3;
        __int16 v15 = 2048;
        unint64_t v16 = a4;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "load messages needing CK update T3 with limit %ld, attemptCount %lu", (uint8_t *)&v13, 0x16u);
      }
    }
    updated = (void *)IMDMessageRecordCopyMessagesPendingUpdateT3ToCloudKitWithLimit();
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        uint64_t v11 = [updated count];
        int v13 = 134217984;
        int64_t v14 = v11;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "loaded %lu messages needing T3 update with limit", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  else
  {
    if (v6)
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "************* We hit max number of attempts to load dirty messages needing a T2 update. Bailing for now", (uint8_t *)&v13, 2u);
      }
    }
    return 0;
  }
  return updated;
}

- (void)markAllMessagesAsNeedingCloudKitSync
{
}

- (id)copyMessagesThatNeedToBeDeletedInCloudKitWithLimit:(unint64_t)a3
{
  return (id)IMDMessageRecordCopyRecordIDsAndGUIDsToDeleteWithLimit();
}

- (void)deleteMessagesFromTombStoneTableWithRecordIDs:(id)a3
{
}

- (void)clearMessagesTombStoneTable
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "Clearing tombstone message table", v3, 2u);
    }
  }
  IMDMessageRecordClearDeleteTombStones();
}

- (void)markMessageAsCleanWithROWID:(int64_t)a3
{
}

- (void)markMessageAsIgnoreButNeedingSyncWithROWID:(int64_t)a3
{
}

+ (void)databaseFull
{
  if ((byte_1EA8CA538 & 1) == 0)
  {
    byte_1EA8CA538 = 1;
    uint64_t v2 = objc_opt_class();
    MEMORY[0x1F4181798](v2, sel__displayDatabaseFullAlert);
  }
}

+ (void)databaseNoLongerFull
{
  if (byte_1EA8CA538 == 1) {
    byte_1EA8CA538 = 0;
  }
}

+ (void)_displayDatabaseFullAlert
{
  uint64_t v2 = NSString;
  IMSharedUtilitiesFrameworkBundle();
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v8 localizedStringForKey:@"SMS_FULL_WARNING" value:&stru_1F3398578 table:@"IMSharedUtilities"];
  CFStringRef v4 = (const __CFString *)objc_msgSend(v2, "localizedStringWithFormat:", v3, 0);
  uint64_t v5 = NSString;
  int v6 = IMSharedUtilitiesFrameworkBundle();
  int v7 = [v6 localizedStringForKey:@"DISMISS" value:&stru_1F3398578 table:@"IMSharedUtilities"];
  CFUserNotificationDisplayAlert(0.0, 0, 0, 0, 0, v4, 0, (CFStringRef)objc_msgSend(v5, "localizedStringWithFormat:", v7, 0), 0, 0, 0);
}

- (int64_t)lastSyncedMessageRowID
{
  return MEMORY[0x1F4123560](self, a2);
}

- (void)setModificationStamp:(id)a3
{
}

- (NSMutableDictionary)visitedChats
{
  return self->_visitedChats;
}

- (void)setVisitedChats:(id)a3
{
}

- (IMStateCaptureAssistant)stateCaptureAssistant
{
  return self->_stateCaptureAssistant;
}

- (void)setStateCaptureAssistant:(id)a3
{
}

- (int64_t)lastNotifiedUnreadCount
{
  return self->_lastNotifiedUnreadCount;
}

- (void)setLastNotifiedUnreadCount:(int64_t)a3
{
  self->_lastNotifiedUnreadCFIndex Count = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_stateCaptureAssistant, 0);
  objc_storeStrong((id *)&self->_visitedChats, 0);
  objc_storeStrong((id *)&self->_suppressedUpdatesTimer, 0);
  objc_storeStrong((id *)&self->_cachedLastFailedMessageDate, 0);
  objc_storeStrong((id *)&self->_cachedUnreadMessageCount, 0);

  objc_storeStrong((id *)&self->_modificationStamp, 0);
}

- (id)recordIDsAndGUIDsToDeleteWithLimit:(int64_t)a3
{
  _sSo15IMDMessageStoreC12IMDaemonCoreE25recordIDsAndGUIDsToDelete9withLimitSaySDys11AnyHashableVypGGs5Int64V_tF_0();
  sub_1D96867CC(&qword_1EBE2B4B0);
  id v3 = (void *)sub_1D9906F00();
  swift_bridgeObjectRelease();

  return v3;
}

- (id)batchOfRecordIDsToDeleteWithLimit:(int64_t)a3 error:(id *)a4
{
  uint64_t v5 = self;
  IMDMessageStore.batchOfRecordIDsToDelete(limit:)(a3);

  sub_1D989832C();
  sub_1D989836C();
  int v6 = (void *)sub_1D9906CB0();
  swift_bridgeObjectRelease();

  return v6;
}

- (void)clearTombstonesForRecordIDs:(id)a3
{
  sub_1D989832C();
  sub_1D9906F20();
  CFStringRef v4 = self;
  _sSo15IMDMessageStoreC12IMDaemonCoreE15clearTombstones12forRecordIDsySaySo10CKRecordIDCG_tF_0();

  swift_bridgeObjectRelease();
}

@end