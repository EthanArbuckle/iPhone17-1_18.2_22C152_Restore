@interface IMDChatRegistry
+ (IMDChatRegistry)sharedInstance;
+ (id)supportedServiceNames;
- (BOOL)_chat:(id)a3 isDuplicateOfChat:(id)a4;
- (BOOL)_contactsBasedMergingEnabled;
- (BOOL)_ensureNoExistingGroupForSyncData:(id)a3;
- (BOOL)_existingItemRequiresUpgrade:(id)a3 itemFromCKRecord:(id)a4;
- (BOOL)_hasInconsistentGroupPhotoGUIDAcrossMergedChats:(id)a3;
- (BOOL)_hasInconsistentJoinStateAcrossMergedChats:(id)a3;
- (BOOL)_mergeDuplicateGroupsIfNeeded;
- (BOOL)blackholedChatsExist;
- (BOOL)doneLoadingAfterMerge;
- (BOOL)filteredChatsExistForServices:(id)a3;
- (BOOL)filterediMessageChatsExist;
- (BOOL)handleMessageUpdate:(id)a3;
- (BOOL)hasDumpedLogsForNoExisitingGroup;
- (BOOL)hasKnownSenderChatWithChatIdentifier:(id)a3;
- (BOOL)isBeingSetup;
- (BOOL)loadChatsWithCompletionBlock:(id)a3;
- (BOOL)removeIMDHandleFromRegistry:(id)a3;
- (BOOL)repairDuplicateChatsIfNeeded;
- (BOOL)updateProperties:(id)a3 chat:(id)a4 style:(unsigned __int8)a5;
- (BOOL)updateSyncedSyndicationRanges:(id)a3 forGUID:(id)a4;
- (BOOL)updateUnreadCountForChat:(id)a3;
- (IMDCKUtilities)ckUtilities;
- (IMDChatRegistry)init;
- (IMDChatStore)chatStore;
- (IMDMessageHistorySyncController)messageHistorySyncController;
- (IMDMessageProcessingController)messageProcessingController;
- (NSArray)allChats;
- (NSArray)cachedChats;
- (NSArray)chats;
- (NSData)historyToken;
- (NSMutableDictionary)cachedAliasToCNIDMap;
- (NSMutableDictionary)idToHandlesMap;
- (NSMutableDictionary)pendingChatBotHandleToAlternateID;
- (NSMutableDictionary)personCentricGroupedChatsCache;
- (TUConversationManager)conversationManager;
- (id)_activeTUConversations;
- (id)_addChatFromCacheMiss:(id)a3 preferExistingChat:(BOOL)a4;
- (id)_addChatsFromCacheMisses:(id)a3 preferExistingChats:(BOOL)a4;
- (id)_aliasToCNIDMapForAliases:(id)a3;
- (id)_allChatInfo;
- (id)_allHandles;
- (id)_bestServiceSessionForService:(id)a3 accountID:(id)a4;
- (id)_blackholedChatInfoForNumberOfChats:(int64_t)a3;
- (id)_cachedChatWithGUID:(id)a3;
- (id)_cachedChatsWithGroupID:(id)a3;
- (id)_chatForTUConversation:(id)a3;
- (id)_chatForTUGroupID:(id)a3 participants:(id)a4;
- (id)_chatGUIDToChatMapForChats:(id)a3;
- (id)_chatInfoForChats:(id)a3;
- (id)_chatInfoForConnection;
- (id)_chatInfoForNumberOfChats:(int64_t)a3;
- (id)_chatInfoInRange:(_NSRange)a3 wantsBlackholed:(BOOL)a4;
- (id)_chatsWithBlackholed:(BOOL)a3;
- (id)_cnIDForHandle:(id)a3;
- (id)_conversationItemForChat:(id)a3 conversation:(id)a4;
- (id)_copyDuplicateChatsArrayWithLimit:(int64_t)a3;
- (id)_copyGroupedDuplicateChatsSortedFromWinningToLosingWithLimit:(int64_t)a3;
- (id)_createGroupChatForConversation:(id)a3 onSession:(id)a4;
- (id)_createGroupChatsArray;
- (id)_exactGroupChatMatchOrNewestMatchingGroupID:(id)a3 originalGroupID:(id)a4 serviceName:(id)a5 participants:(id)a6 toIdentifier:(id)a7 outNewestSiblingChat:(id *)a8;
- (id)_existingChatForSyncData:(id)a3 originalGUID:(id)a4;
- (id)_existingChatsForIDs:(id)a3 serviceName:(id)a4 displayName:(id)a5 groupID:(id)a6 useOriginalGroupID:(BOOL)a7 style:(unsigned __int8)a8;
- (id)_existingiMessageChatForChatIdentifier:(id)a3 style:(unsigned __int8)a4;
- (id)_extractHandlesFromMap:(id)a3 usingCNID:(id)a4;
- (id)_findChatWinnerInDuplicateChatArray:(id)a3 fixDisplayName:(BOOL *)a4;
- (id)_findExistingGroupChatForConversation:(id)a3 onSession:(id)a4;
- (id)_findLosingChatGUIDsInArrayOfChats:(id)a3 withWinner:(id)a4;
- (id)_generateCurrentAliasToCNIDDictionary;
- (id)_handlesWithChangedContactsOriginalMap:(id)a3 newMap:(id)a4;
- (id)_initiatorForConversation:(id)a3 chat:(id)a4;
- (id)_itemFromCKRecord:(id)a3;
- (id)_lookupChatUsingParentChatID:(id)a3 service:(id)a4;
- (id)_mergedPinningIdentifiersForChats:(id)a3 chatGUIDToChatMap:(id)a4 groupedChatsByPersonCentricIdWithSortedChats:(id)a5;
- (id)_messageStore;
- (id)_newestExistingChatWithGroupID:(id)a3 onService:(id)a4;
- (id)_newestGroupChatMatchingParticipants:(id)a3 displayName:(id)a4 strictDisplayNameMatching:(BOOL)a5 serviceName:(id)a6 toIdentifier:(id)a7;
- (id)_oneToOneChatForRemoteHandle:(id)a3;
- (id)_parentChatIDFromCKRecord:(id)a3;
- (id)_participantIDSetFromHandles:(id)a3 toIdentifier:(id)a4;
- (id)_potentialGUIDsForIdentifier:(id)a3;
- (id)_preferredFileTransferFromGroupPhotoGUIDs:(id)a3;
- (id)_sharedMessageStore;
- (id)_siblingChatsForChat:(id)a3 usingChatGUIDToChatMap:(id)a4 iMessageChat:(id *)a5;
- (id)_spamMessageCreator;
- (id)_tuConversationForChat:(id)a3;
- (id)_uncachedNewestChatWithOriginalGroupID:(id)a3 onService:(id)a4;
- (id)_upgradeChatToGroupChat:(id)a3 forConversation:(id)a4;
- (id)aliasToCNIDMap;
- (id)allChatsWithIdentifier:(id)a3 style:(unsigned __int8)a4 serviceNames:(id)a5;
- (id)allExistingChatsWithIdentifier:(id)a3;
- (id)allExistingChatsWithIdentifier:(id)a3 style:(unsigned __int8)a4;
- (id)allExistingSupportedServiceChatsWithIdentifier:(id)a3 style:(unsigned __int8)a4;
- (id)allHandlesForID:(id)a3;
- (id)alternateIDForHandle:(id)a3;
- (id)bestCandidateGroupChatWithFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 serviceName:(id)a9;
- (id)bestCandidateGroupChatWithFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7 serviceName:(id)a8;
- (id)blackholedChats;
- (id)chatForHandle:(id)a3 account:(id)a4 chatIdentifier:(id)a5 guid:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 isBlackholed:(BOOL)a9;
- (id)chatForHandles:(id)a3 account:(id)a4 chatIdentifier:(id)a5 style:(unsigned __int8)a6 groupID:(id)a7 originalGroupID:(id)a8 displayName:(id)a9 guid:(id)a10 lastAddressedHandle:(id)a11 lastAddressedSIMID:(id)a12 isBlackholed:(BOOL)a13;
- (id)chatForRoom:(id)a3 account:(id)a4 chatIdentifier:(id)a5 guid:(id)a6;
- (id)chatsToUploadToCloudKitWithLimit:(unint64_t)a3;
- (id)copyRecordIDsAndGUIDsPendingCloudKitDelete;
- (id)existingChatForID:(id)a3 account:(id)a4;
- (id)existingChatForIDs:(id)a3 account:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7;
- (id)existingChatForIDs:(id)a3 account:(id)a4 displayName:(id)a5 originalGroupID:(id)a6 style:(unsigned __int8)a7;
- (id)existingChatForIDs:(id)a3 account:(id)a4 style:(unsigned __int8)a5;
- (id)existingChatForRoom:(id)a3 account:(id)a4;
- (id)existingChatWithEngramID:(id)a3;
- (id)existingChatWithGUID:(id)a3;
- (id)existingChatWithGroupID:(id)a3 onService:(id)a4;
- (id)existingChatWithIdentifier:(id)a3 account:(id)a4;
- (id)existingChatsFilteredUsingPredicate:(id)a3;
- (id)existingChatsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 limit:(unint64_t)a5;
- (id)existingChatsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 olderThan:(id)a5 limit:(unint64_t)a6;
- (id)existingChatsForIDs:(id)a3 displayName:(id)a4 groupID:(id)a5 style:(unsigned __int8)a6;
- (id)existingChatsForIDs:(id)a3 onService:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7;
- (id)existingChatsForIDs:(id)a3 onService:(id)a4 displayName:(id)a5 originalGroupID:(id)a6 style:(unsigned __int8)a7;
- (id)existingChatsForIDs:(id)a3 onService:(id)a4 style:(unsigned __int8)a5;
- (id)existingChatsWithGroupID:(id)a3;
- (id)existingChatsWithPinningIdentifier:(id)a3;
- (id)existingGroupChatsContainingHandles:(id)a3;
- (id)existingOneOnOneChatsWithIdentifiers:(id)a3;
- (id)existingSMSChatForID:(id)a3;
- (id)existingSMSChatForID:(id)a3 withChatStyle:(unsigned __int8)a4;
- (id)existingiMessageChatForID:(id)a3;
- (id)existingiMessageChatForID:(id)a3 withChatStyle:(unsigned __int8)a4;
- (id)generateUnusedChatIdentifierForGroupChatWithAccount:(id)a3;
- (id)groupChatsBasedOnIdentity:(id)a3;
- (id)groupChatsBasedOnIdentityUsingCacheIfApplicable:(id)a3;
- (id)messagesPendingUpdateT1ToCloudKitWithLimit:(unint64_t)a3;
- (id)messagesPendingUpdateT2ToCloudKitWithLimit:(unint64_t)a3;
- (id)messagesToUploadToCloudKitWithLimit:(unint64_t)a3;
- (id)newestExistingChatWithOriginalGroupID:(id)a3 onService:(id)a4;
- (id)personCentricGroupedChatsArrayWithMaximumNumberOfChats:(int64_t)a3 skipsLastMessageLoading:(BOOL)a4 usingChats:(id)a5 useCachedChatGroups:(BOOL)a6 includingPinnedChatIdentifiers:(id)a7 repairInconsistentMergedChats:(BOOL)a8;
- (id)recoverableMessagesMetadata;
- (id)recoverableMessagesMetadataPendingCloudKitDeleteWithLimit:(unint64_t)a3;
- (id)recoverableMessagesMetadataPendingCloudKitSaveWithLimit:(unint64_t)a3;
- (id)sortPersonCentricChatGroups:(id)a3;
- (id)stringForChatStyle:(unsigned __int8)a3;
- (id)truncatedSortedChatsGroupedByPersonCentricID:(id)a3 count:(int64_t)a4 pinnedChatIdentifiers:(id)a5;
- (int64_t)_compareDuplicateChatsWithFirstChat:(id)a3 secondChat:(id)a4;
- (unint64_t)cachedChatCount;
- (unint64_t)markAsSpamForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7 autoReport:(BOOL)a8;
- (unint64_t)markAsSpamForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7 autoReport:(BOOL)a8 isJunkReportedToCarrier:(BOOL)a9;
- (unint64_t)markAsSpamForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7 autoReport:(BOOL)a8 isJunkReportedToCarrier:(BOOL)a9 reportReason:(unint64_t)a10;
- (unint64_t)persistedChatCount;
- (void)__addChatToGroupIDChatIndex:(id)a3;
- (void)__removeChatFromGroupIDChatIndex:(id)a3;
- (void)_addItemToParentChatIfNotLocationItem:(id)a3 parentChat:(id)a4 updatedLastMessageCount:(unint64_t)a5;
- (void)_adoptUpdatedStateForExistingItem:(id)a3 itemFromCKRecord:(id)a4;
- (void)_chatGUIDsThatNeedRemerging:(id *)a3 chatDictionaryArray:(id *)a4 aliasMap:(id)a5;
- (void)_chatGUIDsThatNeedRemerging:(id *)a3 chatDictionaryArray:(id *)a4 oldPersonCentricID:(id)a5;
- (void)_chatGUIDsThatNeedRemergingWithCompletionHandler:(id)a3;
- (void)_checkForContactChanges;
- (void)_contactsChanged:(id)a3;
- (void)_enumeratePersonMergedChatsWithMaximumNumberOfChats:(int64_t)a3 usingChats:(id)a4 useCachedChatGroups:(BOOL)a5 includingPinnedChatIdentifiers:(id)a6 usingBlock:(id)a7;
- (void)_evictCachedChat:(id)a3;
- (void)_finalizeIncomingChat:(id)a3;
- (void)_fixSiblingChatsAndStoreIfNeeded:(id)a3 iMessageChat:(id)a4 chatsToRegenerate:(id)a5;
- (void)_fixUpChatParticipantsIfNeeded:(id)a3;
- (void)_fixUpChatParticipantsIfNeeded:(id)a3 usingChatGUIDToChatMap:(id)a4;
- (void)_forceReloadChats:(BOOL)a3;
- (void)_insertChatUsingSyncData:(id)a3;
- (void)_makeAllAttachmentsClassC;
- (void)_markForksAsSyncedForChat:(id)a3;
- (void)_markGroupPhotosAsUnpurgeableIfNecessary;
- (void)_performPostUnlockHousekeeping;
- (void)_persistMergeIDMergedChatsIfNeeded;
- (void)_populateContactIDOnHandles;
- (void)_populateLastMessageForChat:(id)a3;
- (void)_reloadChatsForDatabaseMergeOrDatabaseSwitch;
- (void)_repairInconsistentGroupPhotoGuidAcrossMergedChatsIfNecessary:(id)a3;
- (void)_repairInconsistentJoinStatesAcrossMergedChatsIfNecessary:(id)a3;
- (void)_reportMessageDictionaryForMessages:(id)a3 withLastAddressedHandle:(id)a4 maxMessageLength:(unint64_t)a5 isAutoReport:(BOOL)a6 withChat:(id)a7 maxMessagesToReport:(unint64_t)a8 totalMessageCount:(unint64_t *)a9 isJunkReportedToCarrier:(BOOL)a10 reportReason:(unint64_t)a11 iMessageReportSpamDictionaries:(id)a12 textMessageReportSpamDictionaries:(id)a13;
- (void)_reportMessageDictionaryForMessages:(id)a3 withLastAddressedHandle:(id)a4 maxMessageLength:(unint64_t)a5 isAutoReport:(BOOL)a6 withChat:(id)a7 maxMessagesToReport:(unint64_t)a8 totalMessageCount:(unint64_t *)a9 notifyInternalSecurity:(BOOL)a10 isJunkReportedToCarrier:(BOOL)a11 reportReason:(unint64_t)a12 iMessageReportSpamDictionaries:(id)a13 textMessageReportSpamDictionaries:(id)a14;
- (void)_reportToIDSTextMessageSpam:(id)a3;
- (void)_reportToIDSiMessageSpam:(id)a3;
- (void)_serializeChatsForRemerge:(id)a3 guidsThatNeedRemerging:(id *)a4 chatDictionaryArray:(id *)a5;
- (void)_setGroupID:(id)a3 forChatAndAllSiblings:(id)a4;
- (void)_setInitialLoadForTesting:(BOOL)a3;
- (void)_setSortIDOnIncomingMessage:(id)a3 forChat:(id)a4;
- (void)_triggerRemergeForPersonCentricID:(id)a3;
- (void)_updateCachedAliasToCNIDMap:(id)a3 withHistoryToken:(id)a4 completionHandler:(id)a5;
- (void)_updateCachedCNIDMapForHandles:(id)a3;
- (void)_updateChat:(id)a3 usingSyncData:(id)a4;
- (void)_updateCurrentAliasToCNIDDictionaryAndHistoryTokenWithCompletionHandler:(id)a3;
- (void)addChat:(id)a3;
- (void)addChat:(id)a3 firstLoad:(BOOL)a4 store:(BOOL)a5;
- (void)addIMDHandleToRegistry:(id)a3;
- (void)addItem:(id)a3 toChat:(id)a4;
- (void)addMessage:(id)a3 toChat:(id)a4;
- (void)addMessage:(id)a3 toChat:(id)a4 deferSpotlightIndexing:(BOOL)a5;
- (void)checkBlackholedChatsExistAfterUpdatingChatWithAdd:(BOOL)a3;
- (void)clearPendingDeleteTable;
- (void)clearRecoverableMessageTombStones;
- (void)conversationManager:(id)a3 conversation:(id)a4 addedMembersLocally:(id)a5;
- (void)dealloc;
- (void)handleMessageUpdateConflictType:(id)a3 serverRecord:(id)a4 localRowID:(int64_t)a5;
- (void)invalidatePersonCentricGroupedChatsCache;
- (void)markChatAsDeferredForSyncingUsingSyncData:(id)a3;
- (void)markDeferredChatsAsNeedingSync;
- (void)moveMessagesInChatsWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4;
- (void)moveMessagesWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4;
- (void)pendingAlternateID:(id)a3 forHandle:(id)a4;
- (void)permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:(id)a3 completionHandler:(id)a4;
- (void)processMessageUsingCKRecord:(id)a3;
- (void)processMessageUsingCKRecord:(id)a3 updatedLastMessageCount:(int)a4;
- (void)recoverMessagesWithChatGUIDs:(id)a3;
- (void)refreshUIWhileSyncing;
- (void)removeChat:(id)a3;
- (void)removeItem:(id)a3 fromChat:(id)a4;
- (void)removeMessage:(id)a3 fromChat:(id)a4;
- (void)repairInconsistentMergedChatsIfNecessary:(id)a3;
- (void)resolveChatConflictUsingSyncData:(id)a3 localGUID:(id)a4;
- (void)setCachedAliasToCNIDMap:(id)a3;
- (void)setChatStore:(id)a3;
- (void)setCkUtilities:(id)a3;
- (void)setHasDumpedLogsForNoExisitingGroup:(BOOL)a3;
- (void)setHistoryToken:(id)a3;
- (void)setIdToHandlesMap:(id)a3;
- (void)setPendingChatBotHandleToAlternateID:(id)a3;
- (void)setPersonCentricGroupedChatsCache:(id)a3;
- (void)setUpInitialConversationManager;
- (void)simulateMessageReceive:(id)a3 serviceName:(id)a4 groupID:(id)a5 handles:(id)a6 sender:(id)a7 date:(id)a8 associatedMessageType:(int64_t)a9 associatedMessageGuid:(id)a10;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)systemDidUnlock;
- (void)updateCachedChatsSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4;
- (void)updateChatUsingSyncData:(id)a3;
- (void)updateChatWithGUID:(id)a3 serverChangeToken:(id)a4 recordID:(id)a5;
- (void)updateChatsUsingMessageGUIDsAndSummaries:(id)a3;
- (void)updateFaceTimeGroupName:(id)a3;
- (void)updateFaceTimeGroupPhoto:(id)a3;
- (void)updateGroupIDForChat:(id)a3 newGroupID:(id)a4;
- (void)updateLastMessageForChat:(id)a3 hintMessage:(id)a4;
- (void)updateLastMessageForChat:(id)a3 hintMessage:(id)a4 historyQuery:(BOOL)a5;
- (void)updateMeCardHasUpdatedForAllChats;
- (void)updateNotificationUnreadCountForChat:(id)a3;
- (void)updateRecoverableMessageSyncState:(int64_t)a3 forMessageRowID:(int64_t)a4 onPartIndex:(int64_t)a5;
- (void)updateStateForChat:(id)a3 forcePost:(BOOL)a4;
- (void)updateStateForChat:(id)a3 forcePost:(BOOL)a4 shouldRebuildFailedMessageDate:(BOOL)a5;
- (void)updateStateForChat:(id)a3 forcePost:(BOOL)a4 shouldRebuildFailedMessageDate:(BOOL)a5 setUnreadCountToZero:(BOOL)a6;
- (void)updateStateForChat:(id)a3 forcePost:(BOOL)a4 shouldRebuildFailedMessageDate:(BOOL)a5 shouldCalculateUnreadCount:(BOOL)a6;
- (void)updateStateForChat:(id)a3 fromMessage:(id)a4 toMessage:(id)a5 forcePost:(BOOL)a6 hintMessage:(id)a7 shouldRebuildFailedMessageDate:(BOOL)a8 shouldCalculateUnreadCount:(BOOL)a9 setUnreadCountToZero:(BOOL)a10;
- (void)updateStateForChat:(id)a3 hintMessage:(id)a4;
- (void)updateStateForChat:(id)a3 hintMessage:(id)a4 shouldRebuildFailedMessageDate:(BOOL)a5;
- (void)updateStateForChat:(id)a3 hintMessage:(id)a4 shouldRebuildFailedMessageDate:(BOOL)a5 setUnreadCountToZero:(BOOL)a6;
- (void)updateStateForChat:(id)a3 hintMessage:(id)a4 shouldRebuildFailedMessageDate:(BOOL)a5 shouldCalculateUnreadCount:(BOOL)a6;
- (void)waitForLoadedChatsWithCompletionHandler:(id)a3;
@end

@implementation IMDChatRegistry

- (BOOL)filterediMessageChatsExist
{
  v5[1] = *MEMORY[0x1E4F143B8];
  v5[0] = *MEMORY[0x1E4F6E1B0];
  v3 = [MEMORY[0x1E4F1C978] arrayWithObjects:v5 count:1];
  LOBYTE(self) = [(IMDChatRegistry *)self filteredChatsExistForServices:v3];

  return (char)self;
}

- (id)_addChatsFromCacheMisses:(id)a3 preferExistingChats:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  v7 = v6;
  v18 = v6;
  if (v4)
  {
    p_chatsLock = &self->_chatsLock;
    [(NSRecursiveLock *)self->_chatsLock lock];
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1D979FCC8;
    v23[3] = &unk_1E6B762F0;
    v23[4] = self;
    objc_msgSend(v7, "__imArrayByApplyingBlock:", v23);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    [(NSRecursiveLock *)*p_chatsLock unlock];
  }
  else
  {
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v10 = v6;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v20 != v12) {
            objc_enumerationMutation(v10);
          }
          v14 = *(void **)(*((void *)&v19 + 1) + 8 * i);
          if (IMOSLoggingEnabled())
          {
            v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              v16 = [v14 guid];
              *(_DWORD *)buf = 138412290;
              v25 = v16;
              _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Adding cache missed chat with GUID %@, not preferring existing chats", buf, 0xCu);
            }
          }
          [(IMDChatRegistry *)self addChat:v14 firstLoad:0 store:0];
        }
        uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v26 count:16];
      }
      while (v11);
    }

    id v9 = v10;
  }

  return v9;
}

- (BOOL)blackholedChatsExist
{
  v2 = [(IMDChatRegistry *)self blackholedChats];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (id)sortPersonCentricChatGroups:(id)a3
{
  BOOL v3 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v4 = a3;
  v5 = objc_msgSend([v3 alloc], "initWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D9685BC4;
  v8[3] = &unk_1E6B73358;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateKeysAndObjectsUsingBlock:v8];

  return v6;
}

- (id)groupChatsBasedOnIdentityUsingCacheIfApplicable:(id)a3
{
  id v4 = a3;
  v5 = [(IMDChatRegistry *)self personCentricGroupedChatsCache];
  uint64_t v6 = [v5 count];

  if (v6)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_7;
    }
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Using person centric grouped chats cache", v10, 2u);
    }
  }
  else
  {
    v7 = [(IMDChatRegistry *)self groupChatsBasedOnIdentity:v4];
    [(IMDChatRegistry *)self setPersonCentricGroupedChatsCache:v7];
  }

LABEL_7:
  v8 = [(IMDChatRegistry *)self personCentricGroupedChatsCache];

  return v8;
}

- (NSMutableDictionary)personCentricGroupedChatsCache
{
  return self->_personCentricGroupedChatsCache;
}

- (id)recoverableMessagesMetadata
{
  v2 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
  BOOL v3 = [v2 loadRecoverableMessagesMetadataGroupedByChatGUID];

  return v3;
}

- (id)personCentricGroupedChatsArrayWithMaximumNumberOfChats:(int64_t)a3 skipsLastMessageLoading:(BOOL)a4 usingChats:(id)a5 useCachedChatGroups:(BOOL)a6 includingPinnedChatIdentifiers:(id)a7 repairInconsistentMergedChats:(BOOL)a8
{
  BOOL v10 = a6;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v13 = a5;
  id v14 = a7;
  uint64_t v21 = 0;
  long long v22 = &v21;
  uint64_t v23 = 0x3032000000;
  v24 = sub_1D979CD74;
  v25 = sub_1D979CD84;
  id v26 = 0;
  id v26 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1D968B388;
  v19[3] = &unk_1E6B76470;
  BOOL v20 = a8;
  v19[4] = self;
  v19[5] = &v21;
  [(IMDChatRegistry *)self _enumeratePersonMergedChatsWithMaximumNumberOfChats:a3 usingChats:v13 useCachedChatGroups:v10 includingPinnedChatIdentifiers:v14 usingBlock:v19];
  if (IMOSLoggingEnabled())
  {
    v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      v16 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend((id)v22[5], "count"));
      *(_DWORD *)buf = 138412290;
      v28 = v16;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Number of person centric chats created to send to client %@", buf, 0xCu);
    }
  }
  id v17 = (id)v22[5];
  _Block_object_dispose(&v21, 8);

  return v17;
}

- (id)existingChatsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 olderThan:(id)a5 limit:(unint64_t)a6
{
  BOOL v7 = a4;
  id v10 = a5;
  id v11 = a3;
  uint64_t v12 = [(IMDChatRegistry *)self chatStore];
  id v13 = [v12 chatsFilteredUsingPredicate:v11 sortedUsingLastMessageDateAscending:v7 olderThan:v10 limit:a6];

  id v14 = [(IMDChatRegistry *)self _addChatsFromCacheMisses:v13 preferExistingChats:1];

  return v14;
}

- (BOOL)filteredChatsExistForServices:(id)a3
{
  v13[2] = *MEMORY[0x1E4F143B8];
  id v4 = (void *)MEMORY[0x1E4F28BA0];
  v5 = (void *)MEMORY[0x1E4F28F60];
  id v6 = a3;
  BOOL v7 = objc_msgSend(v5, "__im_chatPredicateForFilterAction:", 2);
  v13[0] = v7;
  v8 = objc_msgSend(MEMORY[0x1E4F28F60], "__im_chatPredicateForServiceNames:", v6);

  v13[1] = v8;
  id v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v13 count:2];
  id v10 = [v4 andPredicateWithSubpredicates:v9];

  id v11 = [(IMDChatRegistry *)self existingChatsFilteredUsingPredicate:v10 sortedUsingLastMessageDateAscending:0 limit:1];
  LOBYTE(self) = [v11 count] != 0;

  return (char)self;
}

- (id)truncatedSortedChatsGroupedByPersonCentricID:(id)a3 count:(int64_t)a4 pinnedChatIdentifiers:(id)a5
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v26 = a5;
  if (IMOSLoggingEnabled())
  {
    BOOL v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v30 = a4;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Truncating person centric grouped chats to %ld chats.", buf, 0xCu);
    }
  }
  v8 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v26];
  id v9 = [v25 allValues];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1D968A024;
  v27[3] = &unk_1E6B76400;
  id v10 = v8;
  id v28 = v10;
  id v11 = [v9 sortedArrayUsingComparator:v27];
  unint64_t v12 = [v11 count];
  if (v12 >= a4) {
    int64_t v13 = a4;
  }
  else {
    int64_t v13 = v12;
  }
  id v14 = objc_msgSend(v11, "subarrayWithRange:", 0, v13);
  v15 = objc_msgSend(v11, "subarrayWithRange:", v13, objc_msgSend(v11, "count") - v13);
  v16 = objc_msgSend(v15, "__imArrayByFilteringWithBlock:", &unk_1F3391660);
  unint64_t v17 = [v16 count];
  uint64_t v18 = 200;
  if (v17 < 0xC8) {
    uint64_t v18 = [v16 count];
  }
  long long v19 = objc_msgSend(v16, "subarrayWithRange:", 0, v18);
  if (IMOSLoggingEnabled())
  {
    BOOL v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = [v16 count];
      uint64_t v22 = [v15 count];
      *(_DWORD *)buf = 134218496;
      int64_t v30 = v21;
      __int16 v31 = 2048;
      int64_t v32 = a4;
      __int16 v33 = 2048;
      uint64_t v34 = v22;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Found %ld chats with unread messages that would have been cutoff by a count of %ld of out %ld total cutoff chat groups", buf, 0x20u);
    }
  }
  uint64_t v23 = [v14 arrayByAddingObjectsFromArray:v19];

  return v23;
}

- (id)_chatsWithBlackholed:(BOOL)a3
{
  [(NSRecursiveLock *)self->_chatsLock lock];
  v5 = [(NSMutableDictionary *)self->_chats allValues];
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1D9685C40;
  v8[3] = &unk_1E6B762A0;
  BOOL v9 = a3;
  id v6 = objc_msgSend(v5, "__imArrayByFilteringWithBlock:", v8);

  [(NSRecursiveLock *)self->_chatsLock unlock];

  return v6;
}

- (void)_enumeratePersonMergedChatsWithMaximumNumberOfChats:(int64_t)a3 usingChats:(id)a4 useCachedChatGroups:(BOOL)a5 includingPinnedChatIdentifiers:(id)a6 usingBlock:(id)a7
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a6;
  id v14 = (void (**)(id, void, void *))a7;
  id v28 = [(IMDChatRegistry *)self _chatGUIDToChatMapForChats:v12];
  -[IMDChatRegistry _fixUpChatParticipantsIfNeeded:usingChatGUIDToChatMap:](self, "_fixUpChatParticipantsIfNeeded:usingChatGUIDToChatMap:", v12);
  id v26 = v12;
  if (a5) {
    [(IMDChatRegistry *)self groupChatsBasedOnIdentityUsingCacheIfApplicable:v12];
  }
  else {
  v24 = [(IMDChatRegistry *)self groupChatsBasedOnIdentity:v12];
  }
  v15 = [(IMDChatRegistry *)self sortPersonCentricChatGroups:v24];
  v16 = self;
  id v25 = v13;
  [(IMDChatRegistry *)self truncatedSortedChatsGroupedByPersonCentricID:v15 count:a3 pinnedChatIdentifiers:v13];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v17)
  {
    uint64_t v18 = v17;
    uint64_t v19 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v30 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v22 = (void *)MEMORY[0x1E016A370]();
        uint64_t v23 = [(IMDChatRegistry *)v16 _mergedPinningIdentifiersForChats:v21 chatGUIDToChatMap:v28 groupedChatsByPersonCentricIdWithSortedChats:v15];
        v14[2](v14, v21, v23);
      }
      uint64_t v18 = [obj countByEnumeratingWithState:&v29 objects:v33 count:16];
    }
    while (v18);
  }
}

- (id)_chatGUIDToChatMapForChats:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v11 = objc_msgSend(v10, "guid", (void)v13);
        [v4 setObject:v10 forKey:v11];
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_mergedPinningIdentifiersForChats:(id)a3 chatGUIDToChatMap:(id)a4 groupedChatsByPersonCentricIdWithSortedChats:(id)a5
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v32 = a4;
  id v39 = a5;
  if ([v7 count])
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v48 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id v28 = v7;
    id obj = v7;
    uint64_t v33 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v33)
    {
      uint64_t v30 = *(void *)v49;
      do
      {
        uint64_t v9 = 0;
        do
        {
          if (*(void *)v49 != v30) {
            objc_enumerationMutation(obj);
          }
          uint64_t v37 = v9;
          id v10 = *(void **)(*((void *)&v48 + 1) + 8 * v9);
          context = (void *)MEMORY[0x1E016A370]();
          uint64_t v11 = [v10 pinningIdentifier];
          if (v11) {
            [v8 addObject:v11];
          }
          uint64_t v35 = (void *)v11;
          uint64_t v12 = objc_msgSend(v10, "originalGroupID", v28);
          if (v12 && [v10 style] != 45) {
            [v8 addObject:v12];
          }
          uint64_t v34 = (void *)v12;
          long long v13 = [(IMDChatRegistry *)self _siblingChatsForChat:v10 usingChatGUIDToChatMap:v32 iMessageChat:0];
          long long v44 = 0u;
          long long v45 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v38 = v13;
          uint64_t v14 = [v13 countByEnumeratingWithState:&v44 objects:v53 count:16];
          if (v14)
          {
            uint64_t v15 = v14;
            uint64_t v16 = *(void *)v45;
            do
            {
              for (uint64_t i = 0; i != v15; ++i)
              {
                if (*(void *)v45 != v16) {
                  objc_enumerationMutation(v38);
                }
                uint64_t v18 = [*(id *)(*((void *)&v44 + 1) + 8 * i) personCentricID];
                uint64_t v19 = [v39 objectForKeyedSubscript:v18];
                long long v40 = 0u;
                long long v41 = 0u;
                long long v42 = 0u;
                long long v43 = 0u;
                uint64_t v20 = [v19 countByEnumeratingWithState:&v40 objects:v52 count:16];
                if (v20)
                {
                  uint64_t v21 = v20;
                  uint64_t v22 = *(void *)v41;
                  do
                  {
                    for (uint64_t j = 0; j != v21; ++j)
                    {
                      if (*(void *)v41 != v22) {
                        objc_enumerationMutation(v19);
                      }
                      v24 = [*(id *)(*((void *)&v40 + 1) + 8 * j) pinningIdentifier];
                      if (v24) {
                        [v8 addObject:v24];
                      }
                    }
                    uint64_t v21 = [v19 countByEnumeratingWithState:&v40 objects:v52 count:16];
                  }
                  while (v21);
                }
              }
              uint64_t v15 = [v38 countByEnumeratingWithState:&v44 objects:v53 count:16];
            }
            while (v15);
          }

          uint64_t v9 = v37 + 1;
        }
        while (v37 + 1 != v33);
        uint64_t v33 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v33);
    }

    id v25 = [v8 allObjects];
    id v26 = (void *)[v25 copy];

    id v7 = v28;
  }
  else
  {
    id v26 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v26;
}

- (id)_siblingChatsForChat:(id)a3 usingChatGUIDToChatMap:(id)a4 iMessageChat:(id *)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v24 = a4;
  id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v8 = [v7 serviceName];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F6E1B0]];
  uint64_t v22 = a5;
  if (a5 && v9) {
    *a5 = v7;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = +[IMDChatRegistry supportedServiceNames];
  uint64_t v10 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v27 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (([v14 isEqualToString:v8] & 1) == 0)
        {
          uint64_t v15 = -[IMDChatRegistry stringForChatStyle:](self, "stringForChatStyle:", [v7 style]);
          uint64_t v16 = [v7 chatIdentifier];
          uint64_t v17 = (void *)IMSharedHelperNSNewStringByAppendingStrings();

          uint64_t v18 = [v24 objectForKeyedSubscript:v17];
          if (v18)
          {
            [v21 addObject:v18];
            int v19 = [v14 isEqualToString:*MEMORY[0x1E4F6E1B0]];
            if (v22)
            {
              if (v19) {
                *uint64_t v22 = v18;
              }
            }
          }
        }
      }
      uint64_t v11 = [obj countByEnumeratingWithState:&v26 objects:v30 count:16];
    }
    while (v11);
  }

  return v21;
}

- (id)stringForChatStyle:(unsigned __int8)a3
{
  id v3 = @"-";
  if (a3 == 43) {
    id v3 = @"+";
  }
  if (a3 == 35) {
    return @"#";
  }
  else {
    return v3;
  }
}

+ (id)supportedServiceNames
{
  v2 = +[IMDServiceController sharedController];
  id v3 = [v2 serviceNamesSupportingCapability:*MEMORY[0x1E4F6E080]];

  return v3;
}

- (void)repairInconsistentMergedChatsIfNecessary:(id)a3
{
  id v4 = a3;
  [(IMDChatRegistry *)self _repairInconsistentGroupPhotoGuidAcrossMergedChatsIfNecessary:v4];
  [(IMDChatRegistry *)self _repairInconsistentJoinStatesAcrossMergedChatsIfNecessary:v4];
}

- (void)_repairInconsistentJoinStatesAcrossMergedChatsIfNecessary:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(IMDChatRegistry *)self _hasInconsistentJoinStateAcrossMergedChats:v4])goto LABEL_39; {
  if (IMOSLoggingEnabled())
  }
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Join state inconsistency detected among merged chats. Attempting to repair", buf, 2u);
    }
  }
  long long v34 = 0u;
  long long v35 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v27 = v4;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
  if (v7)
  {
    char v8 = 0;
    uint64_t v9 = *(void *)v33;
    uint64_t v10 = 3;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v33 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        long long v13 = [v12 service];
        int v14 = [v13 supportsMutatingGroupMembers];

        if (v14)
        {
          uint64_t v10 = [v12 state];
          char v8 = 1;
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v32 objects:v39 count:16];
    }
    while (v7);

    if (v8) {
      goto LABEL_22;
    }
  }
  else
  {

    uint64_t v10 = 3;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Couldn't find a chat whose service supports group mutability. Setting all chats to joined.", buf, 2u);
    }
  }
LABEL_22:
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v16 = v6;
  uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
  int v18 = 0;
  if (v17)
  {
    uint64_t v19 = *(void *)v29;
    do
    {
      for (uint64_t j = 0; j != v17; ++j)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v16);
        }
        id v21 = *(void **)(*((void *)&v28 + 1) + 8 * j);
        if ([v21 state] != v10)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v22 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              uint64_t v23 = [v21 guid];
              *(_DWORD *)buf = 138412546;
              *(void *)uint64_t v37 = v23;
              *(_WORD *)&v37[8] = 2048;
              *(void *)&v37[10] = v10;
              _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Repairing join state of %@ to %ld", buf, 0x16u);
            }
          }
          [v21 setState:v10];
          id v24 = +[IMDChatStore sharedInstance];
          [v24 storeChat:v21];

          ++v18;
        }
      }
      uint64_t v17 = [v16 countByEnumeratingWithState:&v28 objects:v38 count:16];
    }
    while (v17);
  }

  id v4 = v27;
  if (IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = [v16 count];
      *(_DWORD *)buf = 67109376;
      *(_DWORD *)uint64_t v37 = v18;
      *(_WORD *)&v37[4] = 2048;
      *(void *)&v37[6] = v26;
      _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Repaired join state for %d of %lu chats", buf, 0x12u);
    }

    id v4 = v27;
  }
LABEL_39:
}

- (void)_repairInconsistentGroupPhotoGuidAcrossMergedChatsIfNecessary:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(IMDChatRegistry *)self _hasInconsistentGroupPhotoGUIDAcrossMergedChats:v4])
  {
    long long v33 = self;
    long long v31 = v4;
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Group photo inconsistency detected among merged chats. Attempting to repair", buf, 2u);
      }
    }
    id v6 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    long long v40 = 0u;
    long long v41 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    id v7 = v31;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v49 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v39 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v11, "groupPhotoGuid", v31);
          long long v13 = [v11 guid];
          if (IMOSLoggingEnabled())
          {
            int v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              long long v43 = v13;
              __int16 v44 = 2112;
              long long v45 = v12;
              _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "    Chat %@ has groupPhotoGuid %@", buf, 0x16u);
            }
          }
          if (v12) {
            [v6 addObject:v12];
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v38 objects:v49 count:16];
      }
      while (v8);
    }

    uint64_t v15 = [(IMDChatRegistry *)v33 _preferredFileTransferFromGroupPhotoGUIDs:v6];
    long long v32 = v15;
    if (v15)
    {
      id v16 = [v15 guid];
      if (IMOSLoggingEnabled())
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          long long v43 = v16;
          __int16 v44 = 2112;
          long long v45 = v32;
          _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "The preferred groupPhotoGuid is %@. Transfer: %@", buf, 0x16u);
        }
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v18 = v7;
      uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v48 count:16];
      if (v19)
      {
        uint64_t v20 = *(void *)v35;
        do
        {
          for (uint64_t j = 0; j != v19; ++j)
          {
            if (*(void *)v35 != v20) {
              objc_enumerationMutation(v18);
            }
            uint64_t v22 = *(void **)(*((void *)&v34 + 1) + 8 * j);
            uint64_t v23 = objc_msgSend(v22, "guid", v31);
            id v24 = [v22 groupPhotoGuid];
            char v25 = [v24 isEqualToString:v16];
            int v26 = IMOSLoggingEnabled();
            if (v25)
            {
              if (v26)
              {
                id v27 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  long long v43 = v23;
                  __int16 v44 = 2112;
                  long long v45 = v24;
                  _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Chat %@ already had groupPhotoGuid %@, leaving as is.", buf, 0x16u);
                }
              }
            }
            else
            {
              if (v26)
              {
                long long v28 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412802;
                  long long v43 = v16;
                  __int16 v44 = 2112;
                  long long v45 = v23;
                  __int16 v46 = 2112;
                  long long v47 = v24;
                  _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Applying groupPhotoGuid %@ to chat %@ which previously had groupPhotoGuid %@", buf, 0x20u);
                }
              }
              [v22 updateGroupPhotoGuid:v16];
            }
          }
          uint64_t v19 = [v18 countByEnumeratingWithState:&v34 objects:v48 count:16];
        }
        while (v19);
      }

      if (IMOSLoggingEnabled())
      {
        long long v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Completed repair of group photo inconsistency.", buf, 2u);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      long long v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Could not determine a preferred group photo among inconsistent merged chats. Leaving inconsistency as is.", buf, 2u);
      }
    }
    id v4 = v31;
  }
}

- (BOOL)_hasInconsistentJoinStateAcrossMergedChats:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 2)
  {
    id v5 = [v3 firstObject];
    uint64_t v6 = [v5 state];

    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v7 = v3;
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "state", (void)v13) != v6)
          {
            BOOL v4 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v4 = 0;
LABEL_13:
  }
  else
  {
    BOOL v4 = 0;
  }

  return v4;
}

- (BOOL)_hasInconsistentGroupPhotoGUIDAcrossMergedChats:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ((unint64_t)[v3 count] >= 2)
  {
    id v5 = [v3 firstObject];
    uint64_t v6 = [v5 groupPhotoGuid];

    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    id v7 = v3;
    uint64_t v4 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v4)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (uint64_t i = 0; i != v4; ++i)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v7);
          }
          uint64_t v10 = objc_msgSend(*(id *)(*((void *)&v14 + 1) + 8 * i), "groupPhotoGuid", (void)v14);
          uint64_t v11 = v10;
          if (v10 != v6)
          {
            BOOL v12 = !v10 || v6 == 0;
            if (v12 || ([v10 isEqualToString:v6] & 1) == 0)
            {

              LOBYTE(v4) = 1;
              goto LABEL_18;
            }
          }
        }
        uint64_t v4 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v4) {
          continue;
        }
        break;
      }
    }
LABEL_18:
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)_fixUpChatParticipantsIfNeeded:(id)a3 usingChatGUIDToChatMap:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(buf) = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Attempting to fix up chat participants if needed", (uint8_t *)&buf, 2u);
    }
  }
  if (v6)
  {
    id v8 = v6;
  }
  else
  {
    id v8 = [(IMDChatRegistry *)self _chatGUIDToChatMapForChats:v19];
  }
  uint64_t v9 = v8;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v19;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void *)(*((void *)&v21 + 1) + 8 * v13);
        long long v15 = (void *)MEMORY[0x1E016A370]();
        id v20 = 0;
        long long v16 = [(IMDChatRegistry *)self _siblingChatsForChat:v14 usingChatGUIDToChatMap:v9 iMessageChat:&v20];
        id v17 = v20;
        uint64_t v18 = [v16 count];
        if (self && v18) {
          [(IMDChatRegistry *)self _fixSiblingChatsAndStoreIfNeeded:v16 iMessageChat:v17 chatsToRegenerate:0];
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v11);
  }
}

- (void)_fixSiblingChatsAndStoreIfNeeded:(id)a3 iMessageChat:(id)a4 chatsToRegenerate:(id)a5
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v42 = a4;
  id v35 = a5;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id obj = v7;
  uint64_t v38 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
  if (v38)
  {
    uint64_t v37 = *(void *)v44;
    *(void *)&long long v8 = 138413314;
    long long v33 = v8;
    do
    {
      for (uint64_t i = 0; i != v38; ++i)
      {
        if (*(void *)v44 != v37) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v43 + 1) + 8 * i);
        long long v39 = [v10 displayName];
        long long v40 = [v10 groupID];
        long long v41 = [v42 displayName];
        uint64_t v11 = [v42 groupID];
        uint64_t v12 = [v42 participants];
        uint64_t v13 = [v10 participants];
        if (v42)
        {
          uint64_t v14 = [v10 serviceSession];
          int v15 = [v14 chatCanMergeWithSuperChat:v10];

          if (v15
            && (!IMSharedHelperAreObjectsLogicallySame()
             || (IMSharedHelperAreObjectsLogicallySame() & 1) == 0))
          {
            objc_msgSend(v10, "setGroupID:", v11, v33);
            [v10 setDisplayName:v41];
            if (IMOSLoggingEnabled())
            {
              long long v16 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                id v17 = [v10 guid];
                id v18 = [v10 displayName];
                id v19 = [v10 groupID];
                *(_DWORD *)int buf = v33;
                id v48 = v17;
                __int16 v49 = 2112;
                id v50 = v39;
                __int16 v51 = 2112;
                v52 = v40;
                __int16 v53 = 2112;
                id v54 = v18;
                __int16 v55 = 2112;
                v56 = v19;
                _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Storing sibling chat %@ old display name %@, old group ID %@ new display name %@, new group ID %@", buf, 0x34u);
              }
            }
            id v20 = [(IMDChatRegistry *)self chatStore];
            [v20 storeChat:v10];
          }
          if (!objc_msgSend(v12, "count", v33) && objc_msgSend(v13, "count"))
          {
            if (IMOSLoggingEnabled())
            {
              long long v21 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)int buf = 138412546;
                id v48 = v42;
                __int16 v49 = 2112;
                id v50 = v13;
                _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Found iMessage chat with zero participants %@. Updating with sibling participants %@", buf, 0x16u);
              }
            }
            [v42 resetParticipants:v13];
            id v22 = v13;

            [v35 addObject:v42];
            uint64_t v12 = v22;
          }
        }
        long long v23 = sub_1D968D3E0(v12);
        long long v24 = sub_1D968D3E0(v13);
        if (([v23 isEqualToSet:v24] & 1) == 0)
        {
          char v25 = [v10 serviceSession];
          int v26 = [v25 chatCanMergeWithSuperChat:v10];

          if (v26)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v27 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)int buf = 138412546;
                id v48 = v10;
                __int16 v49 = 2112;
                id v50 = v42;
                _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Found sibling chat with different participants than its iMessage sibling. Chat: %@. Updating participants using %@", buf, 0x16u);
              }
            }
            objc_msgSend(v10, "resetParticipants:", v12, v33);
          }
          else
          {
            long long v28 = [v10 groupID];
            long long v29 = [v42 groupID];
            char v30 = [v28 isEqualToString:v29];

            if (v30) {
              goto LABEL_36;
            }
            if (IMOSLoggingEnabled())
            {
              long long v31 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)int buf = 0;
                _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Found sibling chat with different participants than its iMessage sibling, but it is backed by a group server. We must fork 🍴", buf, 2u);
              }
            }
            long long v32 = objc_msgSend(NSString, "stringGUID", v33);
            [v10 setGroupID:v32];
          }
          [v35 addObject:v10];
        }
LABEL_36:
      }
      uint64_t v38 = [obj countByEnumeratingWithState:&v43 objects:v57 count:16];
    }
    while (v38);
  }
}

+ (IMDChatRegistry)sharedInstance
{
  if (qword_1EBE2B880 != -1) {
    dispatch_once(&qword_1EBE2B880, &unk_1F3391560);
  }
  v2 = (void *)qword_1EBE2B9B8;

  return (IMDChatRegistry *)v2;
}

- (id)existingChatsFilteredUsingPredicate:(id)a3 sortedUsingLastMessageDateAscending:(BOOL)a4 limit:(unint64_t)a5
{
  return (id)MEMORY[0x1F4181798](self, sel_existingChatsFilteredUsingPredicate_sortedUsingLastMessageDateAscending_olderThan_limit_);
}

- (NSArray)chats
{
  return (NSArray *)[(IMDChatRegistry *)self _chatsWithBlackholed:0];
}

- (IMDChatStore)chatStore
{
  chatStore = self->_chatStore;
  if (!chatStore)
  {
    uint64_t v4 = +[IMDChatStore sharedInstance];
    id v5 = self->_chatStore;
    self->_chatStore = v4;

    chatStore = self->_chatStore;
  }

  return chatStore;
}

- (id)blackholedChats
{
  return [(IMDChatRegistry *)self _chatsWithBlackholed:1];
}

- (id)aliasToCNIDMap
{
  v2 = (void *)[(NSMutableDictionary *)self->_cachedAliasToCNIDMap copy];

  return v2;
}

- (IMDChatRegistry)init
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  v36.receiver = self;
  v36.super_class = (Class)IMDChatRegistry;
  v2 = [(IMDChatRegistry *)&v36 init];
  if (v2)
  {
    id v3 = [MEMORY[0x1E4F6EAB8] sharedInstance];
    int v4 = [v3 isUnderFirstDataProtectionLock];

    v2->_firstUnlockTriggered = v4 ^ 1;
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = @"NO";
        if (v4) {
          id v6 = @"YES";
        }
        *(_DWORD *)int buf = 138412290;
        uint64_t v38 = v6;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Is under first unlock: %@", buf, 0xCu);
      }
    }
    id v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    chats = v2->_chats;
    v2->_chats = v7;

    uint64_t v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    chatsByGroupID = v2->_chatsByGroupID;
    v2->_chatsByGroupID = v9;

    uint64_t v11 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    chatsLock = v2->_chatsLock;
    v2->_chatsLock = v11;

    uint64_t v13 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    handlesLock = v2->_handlesLock;
    v2->_handlesLock = v13;

    int v15 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    idToHandlesMap = v2->_idToHandlesMap;
    v2->_idToHandlesMap = v15;

    id v17 = (NSData *)objc_alloc_init(MEMORY[0x1E4F1C9B8]);
    historyToken = v2->_historyToken;
    v2->_historyToken = v17;

    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D9799864;
    aBlock[3] = &unk_1E6B76280;
    id v19 = v2;
    id v35 = v19;
    id v20 = _Block_copy(aBlock);
    dword_1EBE2A800 = IMDispatchForNotify();
    dword_1EBE2A804 = IMDispatchForNotify();

    long long v33 = v19;
    dword_1EBE2A808 = IMDispatchForNotify();

    long long v32 = v33;
    IMDispatchForNotify();

    long long v21 = [MEMORY[0x1E4F6EAB8] sharedInstance];
    [v21 addListener:v32];

    v32->_doneLoadingAfterMerge = 0;
    id v22 = (TUConversationManager *)objc_alloc_init(MEMORY[0x1E4FADB78]);
    conversationManager = v32->_conversationManager;
    v32->_conversationManager = v22;

    long long v24 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    personCentricGroupedChatsCache = v32->_personCentricGroupedChatsCache;
    v32->_personCentricGroupedChatsCache = v24;
  }
  if (IMSharedHelperContactsBasedMergingEnabled())
  {
    [MEMORY[0x1E4F1B980] initialize];
    int v26 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v26 addObserver:v2 selector:sel__contactsChanged_ name:*MEMORY[0x1E4F1AF80] object:0];
  }
  uint64_t v27 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v27 addObserver:v2 selector:sel_updateMeCardHasUpdatedForAllChats name:IMDMeCardUpdatedNotification object:0];

  long long v28 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  int v29 = [v28 hasReceivedFirstUnlockNotification];

  if (v29)
  {
    long long v31 = v2;
    im_dispatch_after();
  }
  return v2;
}

- (IMDCKUtilities)ckUtilities
{
  ckUtilities = self->_ckUtilities;
  if (!ckUtilities)
  {
    int v4 = +[IMDCKUtilities sharedInstance];
    id v5 = self->_ckUtilities;
    self->_ckUtilities = v4;

    ckUtilities = self->_ckUtilities;
  }

  return ckUtilities;
}

- (void)dealloc
{
  if (dword_1EBE2A800 != -1)
  {
    notify_cancel(dword_1EBE2A800);
    dword_1EBE2A800 = -1;
  }
  if (dword_1EBE2A804 != -1)
  {
    notify_cancel(dword_1EBE2A804);
    dword_1EBE2A804 = -1;
  }
  if (dword_1EBE2A808 != -1)
  {
    notify_cancel(dword_1EBE2A808);
    dword_1EBE2A808 = -1;
  }
  id v3 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  [v3 removeListener:self];

  v4.receiver = self;
  v4.super_class = (Class)IMDChatRegistry;
  [(IMDChatRegistry *)&v4 dealloc];
}

- (id)_sharedMessageStore
{
  return +[IMDMessageStore sharedInstance];
}

- (NSArray)allChats
{
  [(NSRecursiveLock *)self->_chatsLock lock];
  id v3 = [(NSMutableDictionary *)self->_chats allValues];
  objc_super v4 = (void *)[v3 copy];

  [(NSRecursiveLock *)self->_chatsLock unlock];

  return (NSArray *)v4;
}

- (NSArray)cachedChats
{
  [(NSRecursiveLock *)self->_chatsLock lock];
  id v3 = [(NSMutableDictionary *)self->_chats allValues];
  objc_super v4 = (void *)[v3 copy];

  [(NSRecursiveLock *)self->_chatsLock unlock];

  return (NSArray *)v4;
}

- (unint64_t)cachedChatCount
{
  [(NSRecursiveLock *)self->_chatsLock lock];
  unint64_t v3 = [(NSMutableDictionary *)self->_chats count];
  [(NSRecursiveLock *)self->_chatsLock unlock];
  return v3;
}

- (id)chatForHandle:(id)a3 account:(id)a4 chatIdentifier:(id)a5 guid:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 isBlackholed:(BOOL)a9
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  uint64_t v14 = (IMDChat *)a3;
  id v15 = a4;
  id v16 = a5;
  id v48 = a6;
  id v46 = a7;
  id v47 = a8;
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 138413058;
      id v50 = v14;
      __int16 v51 = 2112;
      id v52 = v15;
      __int16 v53 = 2112;
      id v54 = v16;
      __int16 v55 = 2112;
      id v56 = v48;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_DEBUG, "handle: %@  account: %@  chatIdentifier: %@  guid: %@", buf, 0x2Au);
    }
  }
  id v18 = 0;
  if (v14 && v15)
  {
    id v19 = [(IMDChat *)v14 ID];
    id v20 = [(IMDChatRegistry *)self existingChatForID:v19 account:v15];

    if (v20)
    {
      if (IMOSLoggingEnabled())
      {
        long long v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412290;
          id v50 = v20;
          _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Found existing chat: %@", buf, 0xCu);
        }
      }
      id v18 = v20;
    }
    else
    {
      id v22 = [(IMDChat *)v14 ID];
      long long v44 = [(IMDChatRegistry *)self alternateIDForHandle:v22];

      if (v44)
      {
        [(IMDChat *)v14 setPersonCentricID:v44];
        if (IMOSLoggingEnabled())
        {
          long long v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            long long v24 = [(IMDChat *)v14 ID];
            *(_DWORD *)int buf = 138412546;
            id v50 = v44;
            __int16 v51 = 2112;
            id v52 = v24;
            _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Found alternate ID: %@, for handle: %@", buf, 0x16u);
          }
        }
      }
      char v25 = [IMDChat alloc];
      int v26 = [v15 accountID];
      uint64_t v27 = [v15 service];
      long long v28 = [v27 internalName];
      int v29 = [NSString stringGUID];
      char v30 = IMSingleObjectArray();
      LOWORD(v43) = 0;
      LOBYTE(v42) = a9;
      LOBYTE(v41) = 0;
      LOBYTE(v40) = 45;
      long long v31 = -[IMDChat initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:](v25, "initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:", v26, v28, v48, v29, v16, v30, v16, 0, v46, v47, 0, 3, v40, 1,
              v41,
              0,
              0,
              0,
              0,
              0,
              -1,
              0,
              v42,
              0,
              0,
              v43);

      if (IMOSLoggingEnabled())
      {
        long long v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          long long v33 = [(IMDChat *)v31 lastAddressedLocalHandle];
          *(_DWORD *)int buf = 138412546;
          id v50 = v31;
          __int16 v51 = 2112;
          id v52 = v33;
          _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Created chat: %@ lastAddressedHandle %@", buf, 0x16u);
        }
      }
      [(IMDChatRegistry *)self addChat:v31];
      if ([MEMORY[0x1E4F6EA38] isInternationalSpamFilteringEnabled])
      {
        long long v34 = [(IMDChat *)v31 serviceName];
        int v35 = [v34 isEqualToString:*MEMORY[0x1E4F6E1B0]];

        if (v35)
        {
          objc_super v36 = [(IMDChat *)v31 chatIdentifier];
          uint64_t v37 = [(IMDChatRegistry *)self existingSMSChatForID:v36 withChatStyle:[(IMDChat *)v31 style]];

          if (v37) {
            -[IMDChat updateSMSHandshakeState:](v31, "updateSMSHandshakeState:", [v37 smsHandshakeState]);
          }
        }
      }
      uint64_t v38 = +[IMDChatRegistry sharedInstance];
      [v38 addIMDHandleToRegistry:v14];

      id v18 = v31;
    }
  }

  return v18;
}

- (id)chatForHandles:(id)a3 account:(id)a4 chatIdentifier:(id)a5 style:(unsigned __int8)a6 groupID:(id)a7 originalGroupID:(id)a8 displayName:(id)a9 guid:(id)a10 lastAddressedHandle:(id)a11 lastAddressedSIMID:(id)a12 isBlackholed:(BOOL)a13
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v48 = (IMDChat *)a3;
  id v18 = a4;
  id v19 = a5;
  id v42 = a7;
  id v43 = a8;
  id v44 = a9;
  id v47 = a10;
  id v45 = a11;
  id v46 = a12;
  if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 138413058;
      __int16 v55 = v48;
      __int16 v56 = 2112;
      id v57 = v18;
      __int16 v58 = 2112;
      id v59 = v19;
      __int16 v60 = 2112;
      id v61 = v47;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_DEBUG, "handles: %@  account: %@  chatIdentifier: %@  guid: %@", buf, 0x2Au);
    }
  }
  if (v18)
  {
    long long v21 = [(IMDChatRegistry *)self existingChatWithIdentifier:v19 account:v18];
    if (v21)
    {
      if (IMOSLoggingEnabled())
      {
        id v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412290;
          __int16 v55 = v21;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Found existing chat: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      long long v23 = [IMDChat alloc];
      long long v24 = [v18 accountID];
      char v25 = [v18 service];
      int v26 = [v25 internalName];
      if (v42)
      {
        LOWORD(v40) = 0;
        LOBYTE(v39) = a13;
        LOBYTE(v38) = 0;
        LOBYTE(v37) = a6;
        long long v21 = -[IMDChat initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:](v23, "initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:", v24, v26, v47, v42, v19, v48, v19, v44, v45, v46, 0, 0, v37,
                1,
                v38,
                0,
                0,
                0,
                v43,
                0,
                -1,
                0,
                v39,
                0,
                0,
                v40);
      }
      else
      {
        uint64_t v27 = [NSString stringGUID];
        LOWORD(v40) = 0;
        LOBYTE(v39) = a13;
        LOBYTE(v38) = 0;
        LOBYTE(v37) = a6;
        long long v21 = -[IMDChat initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:](v23, "initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:", v24, v26, v47, v27, v19, v48, v19, v44, v45, v46, 0, 0, v37,
                1,
                v38,
                0,
                0,
                0,
                v43,
                0,
                -1,
                0,
                v39,
                0,
                0,
                v40);
      }
      if (IMOSLoggingEnabled())
      {
        long long v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412290;
          __int16 v55 = v21;
          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Created chat: %@", buf, 0xCu);
        }
      }
      [(IMDChatRegistry *)self addChat:v21];
      long long v51 = 0u;
      long long v52 = 0u;
      long long v49 = 0u;
      long long v50 = 0u;
      int v29 = v48;
      uint64_t v30 = [(IMDChat *)v29 countByEnumeratingWithState:&v49 objects:v53 count:16];
      if (v30)
      {
        uint64_t v31 = *(void *)v50;
        do
        {
          for (uint64_t i = 0; i != v30; ++i)
          {
            if (*(void *)v50 != v31) {
              objc_enumerationMutation(v29);
            }
            uint64_t v33 = *(void *)(*((void *)&v49 + 1) + 8 * i);
            long long v34 = +[IMDChatRegistry sharedInstance];
            [v34 addIMDHandleToRegistry:v33];
          }
          uint64_t v30 = [(IMDChat *)v29 countByEnumeratingWithState:&v49 objects:v53 count:16];
        }
        while (v30);
      }
    }
    int v35 = v21;
  }
  else
  {
    int v35 = 0;
  }

  return v35;
}

- (id)chatForRoom:(id)a3 account:(id)a4 chatIdentifier:(id)a5 guid:(id)a6
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v10 = (IMDChat *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)int buf = 138413058;
      uint64_t v31 = v10;
      __int16 v32 = 2112;
      id v33 = v11;
      __int16 v34 = 2112;
      id v35 = v12;
      __int16 v36 = 2112;
      id v37 = v13;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_DEBUG, "room: %@  account: %@  chatIdentifier: %@  guid: %@", buf, 0x2Au);
    }
  }
  uint64_t v15 = [(IMDChat *)v10 length];
  id v16 = 0;
  if (v11 && v15)
  {
    id v17 = [(IMDChatRegistry *)self existingChatForRoom:v10 account:v11];
    if (v17)
    {
      if (IMOSLoggingEnabled())
      {
        id v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412290;
          uint64_t v31 = v17;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Found existing chat: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v19 = [IMDChat alloc];
      id v20 = [v11 accountID];
      long long v21 = [v11 service];
      id v22 = [v21 internalName];
      long long v23 = [NSString stringGUID];
      LOWORD(v29) = 0;
      LOBYTE(v28) = 0;
      LOBYTE(v27) = 0;
      LOBYTE(v26) = 35;
      id v17 = -[IMDChat initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:](v19, "initWithAccountID:service:guid:groupID:chatIdentifier:participants:roomName:displayName:lastAddressedLocalHandle:lastAddressedSIMID:properties:state:style:isFiltered:hasHadSuccessfulQuery:engramID:serverChangeToken:cloudKitSyncState:originalGroupID:lastReadMessageTimeStamp:lastMessageTimeStampOnLoad:cloudKitRecordID:isBlackholed:autoDonationBehavior:autoDonationBehaviorLastModificationDate:isRecovered:isDeletingIncomingMessages:", v20, v22, v13, v23, v12, 0, v10, 0, 0, 0, 0, 0, v26, 1,
              v27,
              0,
              0,
              0,
              0,
              0,
              -1,
              0,
              v28,
              0,
              0,
              v29);

      if (IMOSLoggingEnabled())
      {
        long long v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412290;
          uint64_t v31 = v17;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Created chat: %@", buf, 0xCu);
        }
      }
      [(IMDChatRegistry *)self addChat:v17];
    }
    id v16 = v17;
  }

  return v16;
}

- (id)generateUnusedChatIdentifierForGroupChatWithAccount:(id)a3
{
  objc_super v4 = (void *)MEMORY[0x1E4F6E670];
  id v5 = [a3 service];
  id v6 = [v5 internalName];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D979AB00;
  v9[3] = &unk_1E6B73DC0;
  v9[4] = self;
  id v7 = [v4 generateUnusedChatIdentifierForGroupChatWithServiceName:v6 chatWithChatIdentifierExists:v9];

  return v7;
}

- (id)existingiMessageChatForID:(id)a3
{
  return [(IMDChatRegistry *)self existingiMessageChatForID:a3 withChatStyle:45];
}

- (id)existingiMessageChatForID:(id)a3 withChatStyle:(unsigned __int8)a4
{
  id v5 = MEMORY[0x1E0169B80](a3, a2);
  id v6 = (void *)IMCopyGUIDForChat();

  id v7 = [(IMDChatRegistry *)self existingChatWithGUID:v6];

  return v7;
}

- (id)existingSMSChatForID:(id)a3
{
  return [(IMDChatRegistry *)self existingSMSChatForID:a3 withChatStyle:45];
}

- (id)existingSMSChatForID:(id)a3 withChatStyle:(unsigned __int8)a4
{
  id v5 = MEMORY[0x1E0169B80](a3, a2);
  id v6 = (void *)IMCopyGUIDForChat();

  id v7 = [(IMDChatRegistry *)self existingChatWithGUID:v6];

  return v7;
}

- (BOOL)hasKnownSenderChatWithChatIdentifier:(id)a3
{
  unint64_t v3 = [(IMDChatRegistry *)self existingiMessageChatForID:a3];
  objc_super v4 = v3;
  if (v3) {
    BOOL v5 = [v3 isFiltered] == 0;
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_cachedChatWithGUID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(NSRecursiveLock *)self->_chatsLock lock];
    BOOL v5 = [(NSMutableDictionary *)self->_chats objectForKeyedSubscript:v4];
    [(NSRecursiveLock *)self->_chatsLock unlock];
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)_cachedChatsWithGroupID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    [(NSRecursiveLock *)self->_chatsLock lock];
    BOOL v5 = [(NSMutableDictionary *)self->_chatsByGroupID objectForKey:v4];
    id v6 = (void *)[v5 copy];

    [(NSRecursiveLock *)self->_chatsLock unlock];
  }
  else
  {
    id v6 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v6;
}

- (void)pendingAlternateID:(id)a3 forHandle:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  long long v8 = [(IMDChatRegistry *)self pendingChatBotHandleToAlternateID];

  if (!v8)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(IMDChatRegistry *)self setPendingChatBotHandleToAlternateID:v9];
  }
  id v10 = [(IMDChatRegistry *)self pendingChatBotHandleToAlternateID];
  [v10 setObject:v7 forKeyedSubscript:v6];
}

- (id)alternateIDForHandle:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IMDChatRegistry *)self pendingChatBotHandleToAlternateID];

  if (v5)
  {
    id v6 = [(IMDChatRegistry *)self pendingChatBotHandleToAlternateID];
    BOOL v5 = [v6 objectForKeyedSubscript:v4];

    if (v5)
    {
      id v7 = [(IMDChatRegistry *)self pendingChatBotHandleToAlternateID];
      [v7 removeObjectForKey:v4];
    }
  }

  return v5;
}

- (id)existingChatWithGUID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    BOOL v5 = [(IMDChatRegistry *)self _cachedChatWithGUID:v4];
    if (!v5)
    {
      id v6 = [(IMDChatRegistry *)self chatStore];
      id v7 = [v6 chatWithGUID:v4];

      long long v8 = [(IMDChatRegistry *)self _addChatFromCacheMiss:v7 preferExistingChat:0];
      BOOL v5 = v8;
      if (v8)
      {
        id v9 = [v8 guid];
        char v10 = [v9 isEqualToString:v4];

        if ((v10 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            id v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              id v12 = [v5 guid];
              int v15 = 138412546;
              id v16 = v12;
              __int16 v17 = 2112;
              id v18 = v4;
              _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Chat GUID %@ doesn't match requested GUID %@, may have changed due to inconsistent properties", (uint8_t *)&v15, 0x16u);
            }
          }

          BOOL v5 = 0;
        }
      }
      if (IMOSLoggingEnabled())
      {
        id v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412546;
          id v16 = v4;
          __int16 v17 = 2112;
          id v18 = v5;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Cache miss for chat with guid: %@ result: %@", (uint8_t *)&v15, 0x16u);
        }
      }
    }
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (id)existingChatsFilteredUsingPredicate:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(IMDChatRegistry *)self chatStore];
  id v6 = [v5 chatsFilteredUsingPredicate:v4];

  id v7 = [(IMDChatRegistry *)self _addChatsFromCacheMisses:v6 preferExistingChats:1];

  return v7;
}

- (id)existingChatsWithGroupID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 length];
  id v6 = (id)MEMORY[0x1E4F1CBF0];
  if (v5)
  {
    id v7 = [(IMDChatRegistry *)self _cachedChatsWithGroupID:v4];
    if ([v7 count])
    {
      long long v8 = v7;
    }
    else
    {
      id v9 = [(IMDChatRegistry *)self chatStore];
      char v10 = [v9 chatsWithGroupID:v4];

      long long v8 = [(IMDChatRegistry *)self _addChatsFromCacheMisses:v10 preferExistingChats:1];

      if (IMOSLoggingEnabled())
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = [v8 arrayByApplyingSelector:sel_guid];
          int v15 = 138412546;
          id v16 = v4;
          __int16 v17 = 2112;
          id v18 = v12;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Cache miss for chats with group ID: %@ result: %@", (uint8_t *)&v15, 0x16u);
        }
      }
    }
    if (v8) {
      id v13 = v8;
    }
    else {
      id v13 = v6;
    }
    id v6 = v13;
  }

  return v6;
}

- (id)existingChatWithGroupID:(id)a3 onService:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  [(IMDChatRegistry *)self existingChatsWithGroupID:a3];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "serviceName", (void)v15);
        char v13 = [v12 isEqualToString:v6];

        if (v13)
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v8;
}

- (id)existingChatWithIdentifier:(id)a3 account:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if ([v6 length])
  {
    id v8 = [v7 service];
    uint64_t v9 = [v8 internalName];
    char v10 = (void *)IMCopyGUIDForChat();

    id v11 = [(IMDChatRegistry *)self _cachedChatWithGUID:v10];
    if (v11)
    {
      id v12 = v11;
      id v13 = v12;
    }
    else
    {
      uint64_t v14 = [v7 service];
      long long v15 = [v14 internalName];
      long long v16 = (void *)IMCopyGUIDForChat();

      long long v17 = [(IMDChatRegistry *)self _cachedChatWithGUID:v16];
      id v12 = v17;
      if (v17)
      {
        id v13 = v17;
      }
      else
      {
        long long v18 = [(IMDChatRegistry *)self chatStore];
        uint64_t v19 = [v7 service];
        uint64_t v20 = [v18 chatsWithIdentifier:v6 onService:v19];

        long long v21 = [v20 firstObject];
        id v13 = [(IMDChatRegistry *)self _addChatFromCacheMiss:v21 preferExistingChat:1];

        if (v13)
        {
          id v22 = [v13 chatIdentifier];
          char v23 = [v22 isEqualToString:v6];

          if ((v23 & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              long long v24 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                char v25 = [v13 chatIdentifier];
                int v28 = 138412546;
                id v29 = v25;
                __int16 v30 = 2112;
                id v31 = v6;
                _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Chat identifier %@ doesn't match requested identifier %@, may have changed due to inconsistent properties", (uint8_t *)&v28, 0x16u);
              }
            }

            id v13 = 0;
          }
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            int v28 = 138412802;
            id v29 = v6;
            __int16 v30 = 2112;
            id v31 = v7;
            __int16 v32 = 2112;
            id v33 = v13;
            _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Cache miss for chat with identifier: %@ account: %@ result: %@", (uint8_t *)&v28, 0x20u);
          }
        }
      }
    }
  }
  else
  {
    id v13 = 0;
  }

  return v13;
}

- (id)existingChatsWithPinningIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(id)objc_opt_class() supportedServiceNames];
  id v6 = [(IMDChatRegistry *)self allChatsWithIdentifier:v4 style:45 serviceNames:v5];

  if ([v6 count])
  {
    id v7 = v6;
  }
  else
  {
    id v8 = [(IMDChatRegistry *)self existingChatsWithGroupID:v4];
    if ([v8 count])
    {
      id v7 = v8;
    }
    else
    {
      uint64_t v9 = [(IMDChatRegistry *)self chatStore];
      char v10 = [v9 chatsWithPinningIdentifier:v4];

      id v7 = [(IMDChatRegistry *)self _addChatsFromCacheMisses:v10 preferExistingChats:1];
    }
  }

  return v7;
}

- (id)existingChatWithEngramID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    uint64_t v5 = [(IMDChatRegistry *)self allChats];
    id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v6; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v14 != v7) {
            objc_enumerationMutation(v5);
          }
          uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          char v10 = [v9 engramID];
          char v11 = [v10 isEqualToString:v4];

          if (v11)
          {
            id v6 = v9;
            goto LABEL_12;
          }
        }
        id v6 = (id)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (id)existingChatForID:(id)a3 account:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v6 length];
  id v9 = 0;
  if (v7 && v8)
  {
    char v10 = [v7 service];
    char v11 = [v10 internalName];
    id v12 = (void *)IMCopyGUIDForChat();

    long long v13 = [(IMDChatRegistry *)self existingChatWithGUID:v12];
    long long v14 = v13;
    if (v13)
    {
      id v9 = v13;
    }
    else
    {
      long long v15 = [(IMDChatRegistry *)self chatStore];
      long long v16 = [v7 service];
      long long v17 = [v16 internalName];
      uint64_t v18 = [v15 chatsWithHandle:v6 onService:v17];

      uint64_t v19 = [v18 firstObject];
      id v9 = [(IMDChatRegistry *)self _addChatFromCacheMiss:v19 preferExistingChat:1];

      if (IMOSLoggingEnabled())
      {
        uint64_t v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          int v22 = 138412802;
          id v23 = v6;
          __int16 v24 = 2112;
          id v25 = v7;
          __int16 v26 = 2112;
          id v27 = v9;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Cache miss for chats with ID: %@ account: %@ result: %@", (uint8_t *)&v22, 0x20u);
        }
      }
    }
  }

  return v9;
}

- (id)existingChatForIDs:(id)a3 account:(id)a4 style:(unsigned __int8)a5
{
  return [(IMDChatRegistry *)self existingChatForIDs:a3 account:a4 displayName:0 groupID:0 style:a5];
}

- (id)existingChatForIDs:(id)a3 account:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  long long v15 = [a4 service];
  long long v16 = [(IMDChatRegistry *)self existingChatsForIDs:v14 onService:v15 displayName:v13 groupID:v12 style:v7];

  long long v17 = [v16 firstObject];

  return v17;
}

- (id)existingChatForIDs:(id)a3 account:(id)a4 displayName:(id)a5 originalGroupID:(id)a6 style:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  long long v15 = [a4 service];
  long long v16 = [(IMDChatRegistry *)self existingChatsForIDs:v14 onService:v15 displayName:v13 originalGroupID:v12 style:v7];

  long long v17 = [v16 firstObject];

  return v17;
}

- (id)existingChatsForIDs:(id)a3 onService:(id)a4 style:(unsigned __int8)a5
{
  return [(IMDChatRegistry *)self existingChatsForIDs:a3 onService:a4 displayName:0 groupID:0 style:a5];
}

- (id)existingChatsForIDs:(id)a3 onService:(id)a4 displayName:(id)a5 groupID:(id)a6 style:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  long long v15 = [a4 internalName];
  long long v16 = [(IMDChatRegistry *)self _existingChatsForIDs:v14 serviceName:v15 displayName:v13 groupID:v12 useOriginalGroupID:0 style:v7];

  return v16;
}

- (id)existingChatsForIDs:(id)a3 onService:(id)a4 displayName:(id)a5 originalGroupID:(id)a6 style:(unsigned __int8)a7
{
  uint64_t v7 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a3;
  long long v15 = [a4 internalName];
  long long v16 = [(IMDChatRegistry *)self _existingChatsForIDs:v14 serviceName:v15 displayName:v13 groupID:v12 useOriginalGroupID:1 style:v7];

  return v16;
}

- (id)existingChatsForIDs:(id)a3 displayName:(id)a4 groupID:(id)a5 style:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id obj = [(id)objc_opt_class() supportedServiceNames];
  uint64_t v14 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
  if (v14)
  {
    uint64_t v15 = v14;
    uint64_t v16 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v22 != v16) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = [(IMDChatRegistry *)self _existingChatsForIDs:v10 serviceName:*(void *)(*((void *)&v21 + 1) + 8 * i) displayName:v11 groupID:v12 useOriginalGroupID:0 style:v6];
        [v13 addObjectsFromArray:v18];
      }
      uint64_t v15 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    }
    while (v15);
  }

  return v13;
}

- (id)_existingChatsForIDs:(id)a3 serviceName:(id)a4 displayName:(id)a5 groupID:(id)a6 useOriginalGroupID:(BOOL)a7 style:(unsigned __int8)a8
{
  uint64_t v8 = a8;
  BOOL v9 = a7;
  id v14 = a6;
  id v15 = a5;
  id v16 = a4;
  id v17 = a3;
  uint64_t v18 = [(IMDChatRegistry *)self chatStore];
  uint64_t v19 = v18;
  if (v9) {
    [v18 chatsWithHandles:v17 onService:v16 displayName:v15 originalGroupID:v14 style:v8];
  }
  else {
  uint64_t v20 = [v18 chatsWithHandles:v17 onService:v16 displayName:v15 groupID:v14 style:v8];
  }

  long long v21 = [(IMDChatRegistry *)self _addChatsFromCacheMisses:v20 preferExistingChats:1];

  return v21;
}

- (id)existingChatForRoom:(id)a3 account:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7 && [v6 length])
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    uint64_t v26 = self;
    uint64_t v8 = [(IMDChatRegistry *)self allChats];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v28 != v10) {
            objc_enumerationMutation(v8);
          }
          id v12 = *(void **)(*((void *)&v27 + 1) + 8 * i);
          id v13 = [v12 service];
          id v14 = [v7 service];
          BOOL v15 = v13 == v14;

          if (v15 && [v12 style] == 35)
          {
            id v16 = [v12 roomName];
            if ([v16 length])
            {
              id v17 = [v12 roomName];
              char v18 = [v17 isEqualToString:v6];

              if (v18)
              {
                id v24 = v12;
                goto LABEL_21;
              }
            }
            else
            {
            }
          }
        }
        uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
      }
      while (v9);
    }

    uint64_t v19 = [(IMDChatRegistry *)v26 chatStore];
    uint64_t v20 = [v7 service];
    long long v21 = [v20 internalName];
    uint64_t v8 = [v19 chatsWithRoomname:v6 onService:v21];

    long long v22 = [v8 firstObject];
    id v24 = [(IMDChatRegistry *)v26 _addChatFromCacheMiss:v22 preferExistingChat:1];

    if (IMOSLoggingEnabled())
    {
      long long v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412802;
        id v32 = v6;
        __int16 v33 = 2112;
        id v34 = v7;
        __int16 v35 = 2112;
        id v36 = v24;
        _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Cache miss for chat with roomname: %@ account: %@ result: %@", buf, 0x20u);
      }
    }
LABEL_21:
  }
  else
  {
    id v24 = 0;
  }

  return v24;
}

- (id)allChatsWithIdentifier:(id)a3 style:(unsigned __int8)a4 serviceNames:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a5;
  if ([v7 length] && objc_msgSend(v8, "count"))
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v18 = v8;
    id v10 = v8;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v20;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v20 != v13) {
            objc_enumerationMutation(v10);
          }
          BOOL v15 = (void *)IMCopyGUIDForChat();
          id v16 = [(IMDChatRegistry *)self existingChatWithGUID:v15];
          if (v16) {
            [v9 addObject:v16];
          }
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v12);
    }

    id v8 = v18;
  }
  else
  {
    id v9 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (id)allExistingSupportedServiceChatsWithIdentifier:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() supportedServiceNames];
  id v8 = [(IMDChatRegistry *)self allChatsWithIdentifier:v6 style:v4 serviceNames:v7];

  return v8;
}

- (id)allExistingChatsWithIdentifier:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(id)objc_opt_class() supportedServiceNames];
  id v8 = [(IMDChatRegistry *)self allChatsWithIdentifier:v6 style:v4 serviceNames:v7];

  return v8;
}

- (id)allExistingChatsWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMDChatRegistry *)self chatStore];
  id v6 = [v5 chatsWithIdentifier:v4];

  id v7 = [(IMDChatRegistry *)self _addChatsFromCacheMisses:v6 preferExistingChats:1];

  return v7;
}

- (id)_participantIDSetFromHandles:(id)a3 toIdentifier:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA80];
  id v7 = a3;
  id v8 = objc_alloc_init(v6);
  id v9 = objc_msgSend(v7, "__imArrayByApplyingBlock:", &unk_1F3391580);

  [v8 addObjectsFromArray:v9];
  if (v5) {
    [v8 addObject:v5];
  }

  return v8;
}

- (id)_exactGroupChatMatchOrNewestMatchingGroupID:(id)a3 originalGroupID:(id)a4 serviceName:(id)a5 participants:(id)a6 toIdentifier:(id)a7 outNewestSiblingChat:(id *)a8
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v37 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  uint64_t v58 = 0;
  id v59 = &v58;
  uint64_t v60 = 0x3032000000;
  id v61 = sub_1D979CD74;
  uint64_t v62 = sub_1D979CD84;
  id v63 = 0;
  v56[0] = 0;
  v56[1] = v56;
  v56[2] = 0x2020000000;
  char v57 = 0;
  uint64_t v50 = 0;
  long long v51 = &v50;
  uint64_t v52 = 0x3032000000;
  __int16 v53 = sub_1D979CD74;
  id v54 = sub_1D979CD84;
  id v55 = 0;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D979CD8C;
  aBlock[3] = &unk_1E6B762C8;
  id v47 = &v50;
  id v34 = v14;
  id v43 = v34;
  id v44 = self;
  id v36 = self;
  id v33 = v16;
  id v45 = v33;
  id v32 = v15;
  id v46 = v32;
  id v48 = v56;
  long long v49 = &v58;
  id v17 = (void (**)(void *, void *))_Block_copy(aBlock);
  [(IMDChatRegistry *)v36 existingChatsWithGroupID:v13];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v66 count:16];
  if (v19)
  {
    uint64_t v20 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v39 != v20) {
          objc_enumerationMutation(v18);
        }
        long long v22 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        long long v23 = objc_msgSend(v22, "groupID", v32, v33);
        char v24 = [v23 isEqualToIgnoringCase:v13];

        if (v24)
        {
          v17[2](v17, v22);
        }
        else if (IMOSLoggingEnabled())
        {
          id v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int buf = 138412290;
            v65 = v22;
            _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, " ==> ERROR sanity check failed: ChatRegistry returned chat that did not match inputs: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v19 = [v18 countByEnumeratingWithState:&v38 objects:v66 count:16];
    }
    while (v19);
  }

  if (v37 && !v59[5])
  {
    uint64_t v26 = [(IMDChatRegistry *)v36 newestExistingChatWithOriginalGroupID:v37 onService:v34];
    long long v27 = [v26 originalGroupID];
    int v28 = [v27 isEqualToString:v37];

    if (v28) {
      v17[2](v17, v26);
    }
  }
  if (a8)
  {
    long long v29 = (void *)v51[5];
    if (v29) {
      *a8 = v29;
    }
  }
  id v30 = (id)v59[5];

  _Block_object_dispose(&v50, 8);
  _Block_object_dispose(v56, 8);
  _Block_object_dispose(&v58, 8);

  return v30;
}

- (id)_newestGroupChatMatchingParticipants:(id)a3 displayName:(id)a4 strictDisplayNameMatching:(BOOL)a5 serviceName:(id)a6 toIdentifier:(id)a7
{
  BOOL v9 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v36 = a6;
  id v14 = a7;
  id v33 = v12;
  id v15 = (void *)[v12 mutableCopy];
  id v34 = v14;
  [v15 removeObject:v14];
  __int16 v35 = v15;
  id v16 = [v15 allObjects];
  id v17 = [(IMDChatRegistry *)self _existingChatsForIDs:v16 serviceName:v36 displayName:v13 groupID:0 useOriginalGroupID:0 style:43];

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v18 = v17;
  uint64_t v19 = 0;
  uint64_t v20 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v38;
    do
    {
      uint64_t v22 = 0;
      do
      {
        if (*(void *)v38 != v21) {
          objc_enumerationMutation(v18);
        }
        long long v23 = *(void **)(*((void *)&v37 + 1) + 8 * v22);
        if (!v9
          || [v13 length]
          || ([v23 displayName],
              uint64_t v26 = objc_claimAutoreleasedReturnValue(),
              BOOL v27 = [v26 length] == 0,
              v26,
              v27))
        {
          if (!v19 || [v23 isNewerThan:v19])
          {
            if (IMOSLoggingEnabled())
            {
              char v24 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)int buf = 138412290;
                id v42 = v23;
                _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, " ==> Found a newer chat based on participants and display name: %@", buf, 0xCu);
              }
            }
            id v25 = v23;

            uint64_t v19 = v25;
          }
        }
        else if (IMOSLoggingEnabled())
        {
          int v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            long long v29 = [v23 displayName];
            *(_DWORD *)int buf = 138412546;
            id v42 = v29;
            __int16 v43 = 2112;
            id v44 = v23;
            _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, " ==> Skipping chat with display name of %@, requested display name was zero length, chat: %@", buf, 0x16u);
          }
        }
        ++v22;
      }
      while (v20 != v22);
      uint64_t v30 = [v18 countByEnumeratingWithState:&v37 objects:v45 count:16];
      uint64_t v20 = v30;
    }
    while (v30);
  }

  id v31 = v19;
  return v31;
}

- (void)_setGroupID:(id)a3 forChatAndAllSiblings:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v20 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v26 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, " ==> Migrating siblings to new groupID if needed: %@", buf, 0xCu);
    }
  }
  id v8 = [v20 chatIdentifier];
  BOOL v9 = -[IMDChatRegistry allExistingChatsWithIdentifier:style:](self, "allExistingChatsWithIdentifier:style:", v8, [v20 style]);

  long long v23 = 0u;
  long long v24 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v10 = v9;
  uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v22 != v12) {
          objc_enumerationMutation(v10);
        }
        id v14 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        id v15 = [v14 groupID];
        char v16 = IMSharedHelperAreObjectsLogicallySame();

        if ((v16 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            id v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              id v18 = [v14 guid];
              uint64_t v19 = [v14 groupID];
              *(_DWORD *)int buf = 138412802;
              id v26 = v18;
              __int16 v27 = 2112;
              int v28 = v19;
              __int16 v29 = 2112;
              id v30 = v6;
              _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, " ==> Updating chat (%@) group ID from %@ => %@", buf, 0x20u);
            }
          }
          [(IMDChatRegistry *)self updateGroupIDForChat:v14 newGroupID:v6];
        }
      }
      uint64_t v11 = [v10 countByEnumeratingWithState:&v21 objects:v31 count:16];
    }
    while (v11);
  }
}

- (id)bestCandidateGroupChatWithFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7 serviceName:(id)a8
{
  return [(IMDChatRegistry *)self bestCandidateGroupChatWithFromIdentifier:a3 toIdentifier:a4 displayName:a5 participants:a6 groupID:a7 originalGroupID:0 serviceName:a8];
}

- (id)bestCandidateGroupChatWithFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 serviceName:(id)a9
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  long long v37 = (__CFString *)a5;
  id v15 = (__CFString *)a7;
  id v36 = a8;
  id v16 = a9;
  id v17 = a6;
  id v18 = a4;
  __int16 v35 = [a3 _stripFZIDPrefix];
  uint64_t v19 = [v18 _stripFZIDPrefix];

  id v20 = objc_msgSend(v17, "__imArrayByApplyingBlock:", &unk_1F33915A0);

  long long v21 = (void *)[objc_alloc(MEMORY[0x1E4F1CAD0]) initWithArray:v20];
  if (IMOSLoggingEnabled())
  {
    long long v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138413314;
      long long v40 = v19;
      __int16 v41 = 2112;
      id v42 = v35;
      __int16 v43 = 2112;
      id v44 = v37;
      __int16 v45 = 2112;
      uint64_t v46 = v20;
      __int16 v47 = 2112;
      id v48 = v15;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Finding best candidate group chat with toIdentifier: %@ fromIdentifier: %@ displayName: %@ partipciants: %@ groupID: %@", buf, 0x34u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      long long v40 = v15;
      _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, " ==> Looking up with groupID %@", buf, 0xCu);
    }
  }
  if ([(__CFString *)v15 length])
  {
    id v38 = 0;
    long long v24 = [(IMDChatRegistry *)self _exactGroupChatMatchOrNewestMatchingGroupID:v15 originalGroupID:v36 serviceName:v16 participants:v21 toIdentifier:v19 outNewestSiblingChat:&v38];
    id v25 = v38;
    if (v24) {
      goto LABEL_23;
    }
  }
  else
  {
    id v25 = 0;
  }
  id v26 = +[IMDServiceController sharedController];
  __int16 v27 = [v26 serviceWithName:v16];
  int v28 = [v27 groupsMergeDisplayNames];

  if (IMOSLoggingEnabled())
  {
    __int16 v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      id v30 = @"NO";
      *(_DWORD *)int buf = 138412802;
      long long v40 = v37;
      __int16 v41 = 2112;
      if (v28) {
        id v30 = @"YES";
      }
      id v42 = v20;
      __int16 v43 = 2112;
      id v44 = v30;
      _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, " ==> groupID lookup failed, falling back to display name: %@ participants: %@ mergeDisplayNames: %@", buf, 0x20u);
    }
  }
  if (v28) {
    id v31 = 0;
  }
  else {
    id v31 = v37;
  }
  long long v24 = [(IMDChatRegistry *)self _newestGroupChatMatchingParticipants:v21 displayName:v31 strictDisplayNameMatching:v28 ^ 1u serviceName:v16 toIdentifier:v19];
LABEL_23:
  if ([(__CFString *)v15 length] && v24) {
    [(IMDChatRegistry *)self _setGroupID:v15 forChatAndAllSiblings:v24];
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      long long v40 = v24;
      _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, " ==> Found matching chat: %@", buf, 0xCu);
    }
  }
  id v33 = v24;

  return v33;
}

- (void)updateLastMessageForChat:(id)a3 hintMessage:(id)a4
{
}

- (void)updateLastMessageForChat:(id)a3 hintMessage:(id)a4 historyQuery:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (!v7) {
    goto LABEL_46;
  }
  BOOL v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v10 = [v9 isScheduledMessagesCoreEnabled];

  if (!v10)
  {
LABEL_15:
    if (v8)
    {
      if ([v8 messageID])
      {
        uint64_t v12 = [v7 lastMessage];
        int v13 = [v12 isOlderThanItem:v8];

        if (v13)
        {
          if (IMOSLoggingEnabled())
          {
            id v14 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              id v15 = [v8 time];
              id v16 = [v7 lastMessage];
              id v17 = [v16 time];
              int v44 = 138412546;
              id v45 = v15;
              __int16 v46 = 2112;
              id v47 = v17;
              _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, " Hint message for last message was newer than the current last message: %@, current: %@", (uint8_t *)&v44, 0x16u);
            }
          }
          id v18 = v8;
          goto LABEL_41;
        }
      }
    }
    if (!v5) {
      goto LABEL_46;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v44 = 138412290;
        id v45 = v7;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, " Querying db for last message: %@", (uint8_t *)&v44, 0xCu);
      }
    }
    id v20 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v21 = [v20 isScheduledMessagesCoreEnabled];

    if (v21)
    {
      long long v22 = +[IMDMessageStore sharedInstance];
      objc_msgSend(v22, "lastMessageForChatWithRowID:", objc_msgSend(v7, "rowID"));
      id v18 = (id)objc_claimAutoreleasedReturnValue();

LABEL_41:
      if (IMOSLoggingEnabled())
      {
        __int16 v43 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
        {
          int v44 = 138412546;
          id v45 = v18;
          __int16 v46 = 2112;
          id v47 = v7;
          _os_log_impl(&dword_1D967A000, v43, OS_LOG_TYPE_INFO, " => Using last message: %@ for chat: %@", (uint8_t *)&v44, 0x16u);
        }
      }
      [v7 _updateLastMessage:v18];

      goto LABEL_46;
    }
    int v23 = [v7 style];
    if (v23 == 35 || v23 == 43)
    {
      id v18 = [v7 roomName];
      if (!v18) {
        goto LABEL_41;
      }
      id v34 = [v7 service];
      __int16 v35 = [v34 internalName];
      BOOL v36 = v35 == 0;

      if (!v36)
      {
        long long v37 = +[IMDMessageStore sharedInstance];
        id v38 = [v7 roomName];
        long long v39 = IMSingleObjectArray();
        long long v40 = [v7 service];
        __int16 v41 = [v40 internalName];
        id v42 = IMSingleObjectArray();
        id v18 = [v37 lastMessageWithRoomNames:v39 onServices:v42];

        goto LABEL_41;
      }
    }
    else if (v23 == 45)
    {
      long long v24 = [v7 participants];
      if ([v24 count])
      {
        id v25 = [v7 service];
        id v26 = [v25 internalName];
        BOOL v27 = v26 == 0;

        if (!v27)
        {
          int v28 = +[IMDMessageStore sharedInstance];
          __int16 v29 = [v7 participants];
          id v30 = [v29 arrayByApplyingSelector:sel_ID];
          id v31 = [v7 service];
          uint64_t v32 = [v31 internalName];
          id v33 = IMSingleObjectArray();
          id v18 = [v28 lastMessageWithHandles:v30 onServices:v33];

          goto LABEL_41;
        }
      }
      else
      {
      }
    }
    id v18 = 0;
    goto LABEL_41;
  }
  if ([v8 scheduleType] != 2
    || [v8 scheduleState] != 2 && objc_msgSend(v8, "scheduleState") != 1)
  {
    if ([v8 isTypingMessage])
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_46;
      }
      uint64_t v11 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v44 = 138412290;
        id v45 = v8;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Skipping updating last message to %@ because it's a typingMessage.", (uint8_t *)&v44, 0xCu);
      }
      goto LABEL_9;
    }
    goto LABEL_15;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v44) = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Scheduled Messages | Skiping updating last message as hint message is a user scheduled message", (uint8_t *)&v44, 2u);
    }
LABEL_9:
  }
LABEL_46:
}

- (BOOL)updateUnreadCountForChat:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3)
  {
    int v5 = [v3 unreadCount];
    id v6 = +[IMDChatStore sharedInstance];
    unsigned int v7 = [v6 unreadCountForChat:v4];

    if ((v7 & 0x80000000) != 0)
    {
      BOOL v9 = 0;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412546;
          uint64_t v12 = v4;
          __int16 v13 = 1024;
          unsigned int v14 = v7;
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, " Updating unread count for chat: %@ to: %d", (uint8_t *)&v11, 0x12u);
        }
      }
      [v4 _setUnreadCount:v7];
      BOOL v9 = v5 != [v4 unreadCount];
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (void)updateNotificationUnreadCountForChat:(id)a3
{
  LOWORD(v3) = 1;
  -[IMDChatRegistry updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:](self, "updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:", a3, 0, 0, 1, 0, 0, v3);
}

- (void)updateStateForChat:(id)a3 fromMessage:(id)a4 toMessage:(id)a5 forcePost:(BOOL)a6 hintMessage:(id)a7 shouldRebuildFailedMessageDate:(BOOL)a8 shouldCalculateUnreadCount:(BOOL)a9 setUnreadCountToZero:(BOOL)a10
{
  BOOL v10 = a8;
  BOOL v12 = a6;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v35 = a5;
  id v18 = a7;
  if (v18) {
    [(IMDChatRegistry *)self updateLastMessageForChat:v16 hintMessage:v18];
  }
  if ([(IMDChatRegistry *)self isBeingSetup] || !a9)
  {
    BOOL v21 = 0;
    if (![(IMDChatRegistry *)self isBeingSetup] && a10)
    {
      if (IMOSLoggingEnabled())
      {
        long long v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412290;
          id v37 = v16;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Forcing unread count to zero on chat: %@", buf, 0xCu);
        }
      }
      [v16 _setUnreadCount:0];
      BOOL v21 = 1;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = [v16 guid];
        *(_DWORD *)int buf = 138412290;
        id v37 = v20;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Updating the unread count on chat: %@", buf, 0xCu);
      }
    }
    BOOL v21 = [(IMDChatRegistry *)self updateUnreadCountForChat:v16];
  }
  if (v35
    && v17
    && v10
    && ([v17 errorCode] || objc_msgSend(v35, "errorCode")))
  {
    if (IMOSLoggingEnabled())
    {
      int v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        id v37 = v17;
        _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "We believe the failed message might have changed, lets rebuild with fromMessage: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      long long v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        id v37 = v35;
        _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "    => toMessage: %@", buf, 0xCu);
      }
    }
    int v25 = 1;
  }
  else
  {
    if (!v21 && !v12) {
      goto LABEL_41;
    }
    int v25 = 0;
  }
  id v26 = (void *)[v16 copyDictionaryRepresentation:0];
  BOOL v27 = [(IMDChatRegistry *)self _sharedMessageStore];
  int v28 = [v27 isSuppressDatabaseUpdates];

  if (v28 ^ 1 | v12)
  {
    __int16 v29 = +[IMDBroadcastController sharedProvider];
    id v30 = objc_msgSend(v29, "broadcasterForChatListenersUsingBlackholeRegistry:", objc_msgSend(v16, "isBlackholed"));
    id v31 = [v16 guid];
    [v30 chat:v31 updated:v26];
  }
  uint64_t v32 = [(IMDChatRegistry *)self _sharedMessageStore];
  [v32 updateStamp];

  if (![(IMDChatRegistry *)self isBeingSetup])
  {
    if (v21 || a9)
    {
      id v33 = [(IMDChatRegistry *)self _sharedMessageStore];
      [v33 rebuildUnreadMessageCount];
    }
    if (v25)
    {
      id v34 = [(IMDChatRegistry *)self _sharedMessageStore];
      [v34 rebuildLastFailedMessageDate];
    }
  }

LABEL_41:
}

- (void)updateStateForChat:(id)a3 hintMessage:(id)a4
{
}

- (void)updateStateForChat:(id)a3 hintMessage:(id)a4 shouldRebuildFailedMessageDate:(BOOL)a5
{
  LOWORD(v5) = 1;
  -[IMDChatRegistry updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:](self, "updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:", a3, 0, 0, 0, a4, a5, v5);
}

- (void)updateStateForChat:(id)a3 hintMessage:(id)a4 shouldRebuildFailedMessageDate:(BOOL)a5 shouldCalculateUnreadCount:(BOOL)a6
{
  LOWORD(v6) = a6;
  -[IMDChatRegistry updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:](self, "updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:", a3, 0, 0, 0, a4, a5, v6);
}

- (void)updateStateForChat:(id)a3 hintMessage:(id)a4 shouldRebuildFailedMessageDate:(BOOL)a5 setUnreadCountToZero:(BOOL)a6
{
  BYTE1(v6) = a6;
  LOBYTE(v6) = 0;
  -[IMDChatRegistry updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:](self, "updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:", a3, 0, 0, 0, a4, a5, v6);
}

- (void)updateStateForChat:(id)a3 forcePost:(BOOL)a4
{
}

- (void)updateStateForChat:(id)a3 forcePost:(BOOL)a4 shouldRebuildFailedMessageDate:(BOOL)a5
{
}

- (void)updateStateForChat:(id)a3 forcePost:(BOOL)a4 shouldRebuildFailedMessageDate:(BOOL)a5 shouldCalculateUnreadCount:(BOOL)a6
{
  LOWORD(v6) = a6;
  -[IMDChatRegistry updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:](self, "updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:", a3, 0, 0, a4, 0, a5, v6);
}

- (void)updateStateForChat:(id)a3 forcePost:(BOOL)a4 shouldRebuildFailedMessageDate:(BOOL)a5 setUnreadCountToZero:(BOOL)a6
{
  BYTE1(v6) = a6;
  LOBYTE(v6) = 0;
  -[IMDChatRegistry updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:](self, "updateStateForChat:fromMessage:toMessage:forcePost:hintMessage:shouldRebuildFailedMessageDate:shouldCalculateUnreadCount:setUnreadCountToZero:", a3, 0, 0, a4, 0, a5, v6);
}

- (void)updateGroupIDForChat:(id)a3 newGroupID:(id)a4
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    [(NSRecursiveLock *)self->_chatsLock lock];
    [(IMDChatRegistry *)self __removeChatFromGroupIDChatIndex:v6];
    [(NSRecursiveLock *)self->_chatsLock unlock];
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        BOOL v9 = [v6 groupID];
        int v10 = 138412802;
        int v11 = v9;
        __int16 v12 = 2112;
        id v13 = v7;
        __int16 v14 = 2112;
        id v15 = v6;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Updating groupID from (%@) to (%@) for chat %@", (uint8_t *)&v10, 0x20u);
      }
    }
    [v6 updateGroupID:v7];
    [(NSRecursiveLock *)self->_chatsLock lock];
    [(IMDChatRegistry *)self __addChatToGroupIDChatIndex:v6];
    [(NSRecursiveLock *)self->_chatsLock unlock];
  }
}

- (void)checkBlackholedChatsExistAfterUpdatingChatWithAdd:(BOOL)a3
{
  int blackholedChatsExistCache = self->_blackholedChatsExistCache;
  if (blackholedChatsExistCache != a3)
  {
    int v5 = [(IMDChatRegistry *)self blackholedChatsExist];
    self->_int blackholedChatsExistCache = v5;
    if (blackholedChatsExistCache != v5)
    {
      id v6 = +[IMDBroadcastController sharedProvider];
      id v7 = [v6 broadcasterForBlackholeChatListeners];
      [v7 blackholedChatsExist:self->_blackholedChatsExistCache];

      id v9 = +[IMDBroadcastController sharedProvider];
      id v8 = [v9 broadcasterForChatListeners];
      [v8 blackholedChatsExist:self->_blackholedChatsExistCache];
    }
  }
}

- (unint64_t)markAsSpamForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7 autoReport:(BOOL)a8
{
  LOBYTE(v9) = 0;
  return [(IMDChatRegistry *)self markAsSpamForIDs:a3 style:a4 onServices:a5 chatID:a6 queryID:a7 autoReport:a8 isJunkReportedToCarrier:v9];
}

- (unint64_t)markAsSpamForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7 autoReport:(BOOL)a8 isJunkReportedToCarrier:(BOOL)a9
{
  LOBYTE(v10) = a9;
  return [(IMDChatRegistry *)self markAsSpamForIDs:a3 style:a4 onServices:a5 chatID:a6 queryID:a7 autoReport:a8 isJunkReportedToCarrier:v10 reportReason:0];
}

- (unint64_t)markAsSpamForIDs:(id)a3 style:(unsigned __int8)a4 onServices:(id)a5 chatID:(id)a6 queryID:(id)a7 autoReport:(BOOL)a8 isJunkReportedToCarrier:(BOOL)a9 reportReason:(unint64_t)a10
{
  BOOL v10 = a8;
  int v45 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  id v46 = a6;
  id v44 = a7;
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      id v18 = @"NO";
      *(_DWORD *)int buf = 138413058;
      if (v10) {
        id v18 = @"YES";
      }
      uint64_t v49 = v18;
      __int16 v50 = 2112;
      id v51 = v15;
      __int16 v52 = 2112;
      id v53 = v16;
      __int16 v54 = 2112;
      id v55 = v46;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Handling request (autoReport %@) to mark IDs (%@) for services (%@) as spam for chatGUID (%@)", buf, 0x2Au);
    }
  }
  if ([v15 count] && objc_msgSend(v16, "count"))
  {
    if (v45 == 45 && v10)
    {
      uint64_t v19 = +[IMDSpamController sharedInstance];
      id v20 = [v15 lastObject];
      [v19 detectSpam:v20 chatGUID:v46];
    }
    __int16 v43 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:0];
    __int16 v41 = [v43 objectForKey:@"max-spam-messages-per-report"];
    BOOL v21 = [v43 objectForKey:@"max-spam-message-size"];
    id v42 = v21;
    if (v21)
    {
      uint64_t v39 = [v21 integerValue];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        int v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int buf = 0;
          _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Server Bag has no value for max-spam-message-size, using the default 50", buf, 2u);
        }
      }
      uint64_t v39 = 50;
    }
    if (v41)
    {
      uint64_t v24 = [v41 integerValue];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        int v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int buf = 0;
          _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Server Bag has no value for max-spam-messages-per-report, using the default 2", buf, 2u);
        }
      }
      uint64_t v24 = 2;
    }
    if ([(IMDChatRegistry *)self _shouldHandleInternalPhishingAttempts] || !a9) {
      uint64_t v26 = 30;
    }
    else {
      uint64_t v26 = 1;
    }
    BOOL v27 = +[IMDMessageStore sharedInstance];
    int v28 = v27;
    if (v45 == 45) {
      [v27 itemsWithHandles:v15 onServices:v16 messageGUID:0 limit:v26];
    }
    else {
    long long v40 = [v27 itemsWithRoomNames:v15 onServices:v16 messageGUID:0 limit:v26];
    }

    __int16 v29 = [(IMDChatRegistry *)self existingChatWithGUID:v46];
    uint64_t v30 = [v29 lastAddressedLocalHandle];
    if (v30) {
      id v31 = (__CFString *)v30;
    }
    else {
      id v31 = &stru_1F3398578;
    }
    unint64_t v47 = 0;
    id v32 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    id v33 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    LOBYTE(v38) = a9;
    [(IMDChatRegistry *)self _reportMessageDictionaryForMessages:v40 withLastAddressedHandle:v31 maxMessageLength:v39 isAutoReport:v10 withChat:v29 maxMessagesToReport:v24 totalMessageCount:&v47 isJunkReportedToCarrier:v38 reportReason:a10 iMessageReportSpamDictionaries:v32 textMessageReportSpamDictionaries:v33];
    [(IMDChatRegistry *)self _reportToIDSiMessageSpam:v32];
    [(IMDChatRegistry *)self _reportToIDSTextMessageSpam:v33];
    if (v45 == 43 && !v10)
    {
      [v29 setWasReportedAsJunk:1];
      id v34 = [v29 groupID];
      if ([v34 length])
      {
        id v35 = [MEMORY[0x1E4F6E7A0] sharedInstance];
        [v35 blocklistGroupId:v34];
      }
      else
      {
        id v35 = IMLogHandleForCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
          sub_1D99032FC((uint64_t)v29, v35);
        }
      }
    }
    if (IMOSLoggingEnabled())
    {
      BOOL v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 134217984;
        uint64_t v49 = (__CFString *)v47;
        _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_INFO, "Marked %lu messages as spam", buf, 0xCu);
      }
    }
    unint64_t v22 = v47;
  }
  else
  {
    unint64_t v22 = 0;
  }

  return v22;
}

- (void)_reportMessageDictionaryForMessages:(id)a3 withLastAddressedHandle:(id)a4 maxMessageLength:(unint64_t)a5 isAutoReport:(BOOL)a6 withChat:(id)a7 maxMessagesToReport:(unint64_t)a8 totalMessageCount:(unint64_t *)a9 isJunkReportedToCarrier:(BOOL)a10 reportReason:(unint64_t)a11 iMessageReportSpamDictionaries:(id)a12 textMessageReportSpamDictionaries:(id)a13
{
  BOOL v14 = a6;
  id v25 = a3;
  id v18 = a4;
  id v19 = a7;
  id v20 = a12;
  id v21 = a13;
  BOOL v22 = !v14 && [(IMDChatRegistry *)self _shouldHandleInternalPhishingAttempts];
  BYTE1(v23) = a10;
  LOBYTE(v23) = v22;
  -[IMDChatRegistry _reportMessageDictionaryForMessages:withLastAddressedHandle:maxMessageLength:isAutoReport:withChat:maxMessagesToReport:totalMessageCount:notifyInternalSecurity:isJunkReportedToCarrier:reportReason:iMessageReportSpamDictionaries:textMessageReportSpamDictionaries:](self, "_reportMessageDictionaryForMessages:withLastAddressedHandle:maxMessageLength:isAutoReport:withChat:maxMessagesToReport:totalMessageCount:notifyInternalSecurity:isJunkReportedToCarrier:reportReason:iMessageReportSpamDictionaries:textMessageReportSpamDictionaries:", v25, v18, a5, v14, v19, a8, a9, v23, a11, v20, v21);
}

- (void)_reportToIDSiMessageSpam:(id)a3
{
  if (a3) {
    [a3 enumerateKeysAndObjectsUsingBlock:&unk_1F33915C0];
  }
}

- (id)_spamMessageCreator
{
  v2 = objc_alloc_init(IMDSpamMessageCreator);

  return v2;
}

- (void)_reportMessageDictionaryForMessages:(id)a3 withLastAddressedHandle:(id)a4 maxMessageLength:(unint64_t)a5 isAutoReport:(BOOL)a6 withChat:(id)a7 maxMessagesToReport:(unint64_t)a8 totalMessageCount:(unint64_t *)a9 notifyInternalSecurity:(BOOL)a10 isJunkReportedToCarrier:(BOOL)a11 reportReason:(unint64_t)a12 iMessageReportSpamDictionaries:(id)a13 textMessageReportSpamDictionaries:(id)a14
{
  BOOL v26 = a6;
  id v18 = a14;
  id v19 = a13;
  id v20 = a7;
  id v21 = a4;
  id v22 = a3;
  id v24 = [(IMDChatRegistry *)self _spamMessageCreator];
  LOWORD(v23) = __PAIR16__(a11, a10);
  objc_msgSend(v24, "reportMessageDictionariesForMessages:withLastAddressedHandle:maxMessageLength:isAutoReport:withChat:maxMessagesToReport:totalMessageCount:notifyInternalSecurity:isJunkReportedToCarrier:reportReason:iMessageReportSpamDictionaries:textMessageReportSpamDictionaries:", v22, v21, a5, v26, v20, a8, a9, v23, a12, v19, v18);
}

- (void)_reportToIDSTextMessageSpam:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    id v4 = objc_alloc(MEMORY[0x1E4F6AB90]);
    int v5 = (void *)[v4 initWithService:*MEMORY[0x1E4F6AA78]];
    v7[0] = MEMORY[0x1E4F143A8];
    v7[1] = 3221225472;
    v7[2] = sub_1D979F658;
    v7[3] = &unk_1E6B73358;
    id v8 = v5;
    id v6 = v5;
    [v3 enumerateKeysAndObjectsUsingBlock:v7];
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_4;
    }
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Recieved empty junk message metadata dictionary while reporting to IDS server.", buf, 2u);
    }
  }

LABEL_4:
}

- (void)_finalizeIncomingChat:(id)a3
{
  id v4 = a3;
  [(IMDChatRegistry *)self _populateLastMessageForChat:v4];
  [v4 _repairChatIfNeeded];
}

- (void)_populateLastMessageForChat:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (![v3 lastMessageTimeStampOnLoad]
    || ([v3 lastMessage], id v4 = objc_claimAutoreleasedReturnValue(), v4, !v4))
  {
    int v5 = [v3 lastMessage];

    if (!v5)
    {
      id v6 = +[IMDMessageStore sharedInstance];
      id v7 = objc_msgSend(v6, "lastMessageForChatWithRowID:", objc_msgSend(v3, "rowID"));

      [v3 setLastMessage:v7];
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          uint64_t v9 = [v3 guid];
          BOOL v10 = [v7 guid];
          *(_DWORD *)int buf = 138412546;
          uint64_t v23 = v9;
          __int16 v24 = 2112;
          id v25 = v10;
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Chat %@ did not have final message, loaded %@", buf, 0x16u);
        }
      }
    }
    int v11 = [v3 lastMessage];
    BOOL v12 = v11 == 0;

    if (v12)
    {
      id v15 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
      id v16 = [v3 guid];
      id v17 = [MEMORY[0x1E4F29008] sortDescriptorWithKey:*MEMORY[0x1E4F6D590] ascending:0];
      id v21 = v17;
      id v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v21 count:1];
      v19[0] = MEMORY[0x1E4F143A8];
      v19[1] = 3221225472;
      v19[2] = sub_1D979FB64;
      v19[3] = &unk_1E6B745A8;
      id v20 = v3;
      [v15 fetchMessageRecordsForChatRecordWithGUID:v16 filteredUsingPredicate:0 sortedUsingDescriptors:v18 limit:1 completionHandler:v19];

      id v13 = v20;
    }
    else
    {
      id v13 = [v3 lastMessage];
      BOOL v14 = [v13 time];
      objc_msgSend(v3, "setLastMessageTimeStampOnLoad:", objc_msgSend(v14, "__im_nanosecondTimeInterval"));
    }
  }
}

- (id)_addChatFromCacheMiss:(id)a3 preferExistingChat:(BOOL)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    BOOL v4 = a4;
    id v12 = a3;
    id v6 = (void *)MEMORY[0x1E4F1C978];
    id v7 = a3;
    id v8 = [v6 arrayWithObjects:&v12 count:1];

    uint64_t v9 = -[IMDChatRegistry _addChatsFromCacheMisses:preferExistingChats:](self, "_addChatsFromCacheMisses:preferExistingChats:", v8, v4, v12, v13);
    BOOL v10 = [v9 firstObject];
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (void)addChat:(id)a3
{
}

- (void)addChat:(id)a3 firstLoad:(BOOL)a4 store:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  if (v31)
  {
    BOOL v33 = a4;
    if (!a4 && IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        id v42 = v31;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Registering chat: %@", buf, 0xCu);
      }
    }
    [(IMDChatRegistry *)self _finalizeIncomingChat:v31];
    [(NSRecursiveLock *)self->_chatsLock lock];
    chats = self->_chats;
    BOOL v10 = [v31 guid];
    [(NSMutableDictionary *)chats setObject:v31 forKey:v10];

    if ([v31 style] == 43)
    {
      int v11 = [v31 groupID];
      BOOL v12 = [v11 length] == 0;

      if (!v12) {
        [(IMDChatRegistry *)self __addChatToGroupIDChatIndex:v31];
      }
    }
    [(NSRecursiveLock *)self->_chatsLock unlock];
    if (!v33)
    {
      if ([v31 isBlackholed]) {
        [(IMDChatRegistry *)self checkBlackholedChatsExistAfterUpdatingChatWithAdd:1];
      }
      if ((IMIsRunningInUnitTesting() & 1) == 0)
      {
        uint64_t v13 = +[IMDChatVocabularyUpdater sharedInstance];
        [v13 updateVocabularyForAddedChat:v31 completionHandler:0];
      }
    }
    if (v5)
    {
      BOOL v14 = +[IMDChatStore sharedInstance];
      [v14 storeChat:v31];

      id v15 = +[IMDMessageStore sharedInstance];
      [v15 updateStamp];
    }
    id v16 = [v31 participants];
    uint64_t v30 = objc_msgSend(v16, "__imArrayByApplyingBlock:", &unk_1F33915E0);

    if ([(IMDChatRegistry *)self _contactsBasedMergingEnabled] && !v33) {
      [(IMDChatRegistry *)self _updateCachedCNIDMapForHandles:v30];
    }
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = [v31 participants];
    uint64_t v17 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v36;
      uint64_t v32 = *MEMORY[0x1E4F6BEF8];
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v36 != v18) {
            objc_enumerationMutation(obj);
          }
          id v20 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v21 = [v20 ID];
          if (v21 && [(IMDChatRegistry *)self _contactsBasedMergingEnabled])
          {

            if (v33) {
              goto LABEL_35;
            }
            id v22 = [(IMDChatRegistry *)self cachedAliasToCNIDMap];
            uint64_t v23 = [v20 ID];
            id v21 = [v22 objectForKeyedSubscript:v23];

            if (([v21 isEqualToString:v32] & 1) == 0) {
              [v20 setCNContactID:v21];
            }
            if (IMOSLoggingEnabled())
            {
              __int16 v24 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                id v25 = [v20 ID];
                id v26 = [v20 CNContactID];
                BOOL v27 = [v31 guid];
                *(_DWORD *)int buf = 138412802;
                id v42 = v25;
                __int16 v43 = 2112;
                id v44 = v26;
                __int16 v45 = 2112;
                id v46 = v27;
                _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Adding handle %@ handleCNID  %@ to chat %@", buf, 0x20u);
              }
            }
          }

LABEL_35:
          [(IMDChatRegistry *)self addIMDHandleToRegistry:v20];
        }
        uint64_t v17 = [obj countByEnumeratingWithState:&v35 objects:v47 count:16];
      }
      while (v17);
    }

    int v28 = [MEMORY[0x1E4F28EB8] defaultCenter];
    uint64_t v39 = @"__kIMDChatRegistryChatKey";
    id v40 = v31;
    __int16 v29 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v40 forKeys:&v39 count:1];
    [v28 postNotificationName:@"__kIMDChatRegistryAddedChatNotification" object:self userInfo:v29];

    if (!v33) {
      [(IMDChatRegistry *)self invalidatePersonCentricGroupedChatsCache];
    }
  }
}

- (void)_evictCachedChat:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = v4;
  if (v4)
  {
    id v6 = [v4 guid];
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        int v11 = v6;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Evicting chat: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    [(NSRecursiveLock *)self->_chatsLock lock];
    [(NSMutableDictionary *)self->_chats setObject:0 forKeyedSubscript:v6];
    if ([v5 style] == 43)
    {
      id v8 = [v5 groupID];
      BOOL v9 = [v8 length] == 0;

      if (!v9) {
        [(IMDChatRegistry *)self __removeChatFromGroupIDChatIndex:v5];
      }
    }
    [(NSRecursiveLock *)self->_chatsLock unlock];
    [(IMDChatRegistry *)self invalidatePersonCentricGroupedChatsCache];
  }
}

- (void)removeChat:(id)a3
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    id v42 = self;
    [(IMDChatRegistry *)self invalidatePersonCentricGroupedChatsCache];
    if (IMOSLoggingEnabled())
    {
      BOOL v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        id v50 = v4;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Unregistering chat: %@", buf, 0xCu);
      }
    }
    id v40 = [v4 guid];
    [(IMDChatRegistry *)v42 _evictCachedChat:v4];
    if ([v4 isBlackholed]) {
      [(IMDChatRegistry *)v42 checkBlackholedChatsExistAfterUpdatingChatWithAdd:0];
    }
    if (!v42->_isLoading && (IMIsRunningInUnitTesting() & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412290;
          id v50 = v4;
          _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Deleting chat: %@", buf, 0xCu);
        }
      }
      id v7 = +[IMDChatStore sharedInstance];
      [v7 deleteChat:v4];

      id v8 = +[IMDMessageStore sharedInstance];
      [v8 updateStamp];

      BOOL v9 = [MEMORY[0x1E4F6E7C8] sharedInstance];
      uint64_t v48 = v40;
      int v10 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v48 count:1];
      [v9 deleteInteractionsWithChatGUIDs:v10];

      int v11 = +[IMDChatVocabularyUpdater sharedInstance];
      [v11 updateVocabularyForDeletedChat:v4 completionHandler:0];

      uint64_t v12 = [v4 recordName];
      if ([v12 length])
      {
        uint64_t v13 = +[IMDCKUtilities sharedInstance];
        int v14 = [v13 cloudKitSyncingEnabled];

        if (v14)
        {
          if (IMOSLoggingEnabled())
          {
            id v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)int buf = 0;
              _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "CloudKit syncing is on. Writing deleted chat to deleted sync table", buf, 2u);
            }
          }
          id v16 = [v4 guid];
          uint64_t v17 = [v4 recordName];
          uint64_t v18 = [v4 lastMessage];
          id v19 = [v18 time];
          objc_msgSend(v19, "__im_nanosecondTimeInterval");
          IMDChatInsertIntoDeletedChatsTable();
        }
      }
    }
    __int16 v41 = [v4 account];
    id v20 = [v41 session];
    id v21 = [v4 guid];
    id v22 = [v4 chatIdentifier];
    uint64_t v23 = [v4 style];
    __int16 v24 = [v4 groupID];
    id v25 = [v4 originalGroupID];
    id v26 = [v4 properties];
    BOOL v27 = [v4 lastAddressedLocalHandle];
    int v28 = [v4 lastAddressedSIMID];
    [v20 didDeleteChatGUID:v21 chatIdentifier:v22 style:v23 groupID:v24 originalGroupID:v25 properties:v26 lastAddressedLocalHandle:v27 lastAddressedSIMID:v28];

    id v29 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    uint64_t v30 = [v4 participants];
    uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v47 count:16];
    if (v31)
    {
      uint64_t v32 = *(void *)v44;
      do
      {
        for (uint64_t i = 0; i != v31; ++i)
        {
          if (*(void *)v44 != v32) {
            objc_enumerationMutation(v30);
          }
          id v34 = *(void **)(*((void *)&v43 + 1) + 8 * i);
          long long v35 = +[IMDChatRegistry sharedInstance];
          int v36 = [v35 removeIMDHandleFromRegistry:v34];

          if (v36)
          {
            long long v37 = [v34 ID];
            [v29 addObject:v37];
          }
        }
        uint64_t v31 = [v30 countByEnumeratingWithState:&v43 objects:v47 count:16];
      }
      while (v31);
    }

    long long v38 = +[IMDNicknameController sharedInstance];
    [v38 cleanUpNicknameForIDs:v29];

    uint64_t v39 = [(IMDChatRegistry *)v42 personCentricGroupedChatsCache];
    [v39 removeAllObjects];
  }
}

- (void)addItem:(id)a3 toChat:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5)
  {
    if (v6)
    {
      id v8 = +[IMDMessageStore sharedInstance];
      BOOL v9 = [v7 serviceName];
      int v10 = [v8 canStoreItem:v5 onService:v9];

      if (v10)
      {
        if (IMOSLoggingEnabled())
        {
          int v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            id v12 = [v5 guid];
            uint64_t v13 = [v7 guid];
            int v16 = 136315650;
            uint64_t v17 = "-[IMDChatRegistry addItem:toChat:]";
            __int16 v18 = 2112;
            id v19 = v12;
            __int16 v20 = 2112;
            id v21 = v13;
            _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "%s: item: %@ chat: %@\n", (uint8_t *)&v16, 0x20u);
          }
        }
        int v14 = +[IMDChatStore sharedInstance];
        id v15 = [v5 guid];
        [v14 addMessageWithGUID:v15 toChat:v7];
      }
    }
  }
}

- (void)removeItem:(id)a3 fromChat:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (v13)
  {
    if (v6)
    {
      id v7 = +[IMDMessageStore sharedInstance];
      id v8 = [v6 serviceName];
      int v9 = [v7 canStoreItem:v13 onService:v8];

      if (v9)
      {
        int v10 = +[IMDChatStore sharedInstance];
        int v11 = [v13 guid];
        [v10 removeMessageWithGUID:v11 fromChat:v6];

        id v12 = +[IMDChatRegistry sharedInstance];
        [v12 updateLastMessageForChat:v6 hintMessage:0];

        [(IMDChatRegistry *)self updateStateForChat:v6 hintMessage:0];
      }
    }
  }
}

- (void)addMessage:(id)a3 toChat:(id)a4
{
}

- (void)addMessage:(id)a3 toChat:(id)a4 deferSpotlightIndexing:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if (IMOSLoggingEnabled())
  {
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v7 guid];
      int v11 = [v8 guid];
      int v22 = 136315650;
      uint64_t v23 = "-[IMDChatRegistry addMessage:toChat:deferSpotlightIndexing:]";
      __int16 v24 = 2112;
      id v25 = v10;
      __int16 v26 = 2112;
      BOOL v27 = v11;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "%s: message: %@ chat: %@\n", (uint8_t *)&v22, 0x20u);
    }
  }
  if (!v7 || !v8)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_21;
    }
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412546;
      uint64_t v23 = (const char *)v7;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "******* Not storing message %@ to chat %@", (uint8_t *)&v22, 0x16u);
    }
    goto LABEL_20;
  }
  id v12 = +[IMDMessageStore sharedInstance];
  id v13 = [v8 serviceName];
  char v14 = [v12 canStoreMessage:v7 onService:v13];

  int v15 = IMOSLoggingEnabled();
  if ((v14 & 1) == 0)
  {
    if (!v15) {
      goto LABEL_21;
    }
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412546;
      uint64_t v23 = (const char *)v7;
      __int16 v24 = 2112;
      id v25 = v8;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "******* IMDMessageStore cannot store message %@ to chat %@", (uint8_t *)&v22, 0x16u);
    }
LABEL_20:

    goto LABEL_21;
  }
  if (v15)
  {
    int v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [v7 guid];
      __int16 v18 = [v8 guid];
      int v22 = 136315650;
      uint64_t v23 = "-[IMDChatRegistry addMessage:toChat:deferSpotlightIndexing:]";
      __int16 v24 = 2112;
      id v25 = v17;
      __int16 v26 = 2112;
      BOOL v27 = v18;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "%s: message: %@ chat: %@\n", (uint8_t *)&v22, 0x20u);
    }
  }
  id v19 = +[IMDChatStore sharedInstance];
  __int16 v20 = [v7 guid];
  [v19 addMessageWithGUID:v20 toChat:v8 deferSpotlightIndexing:v5];

LABEL_21:
}

- (void)removeMessage:(id)a3 fromChat:(id)a4
{
  id v13 = a3;
  id v6 = a4;
  if (v13)
  {
    if (v6)
    {
      id v7 = +[IMDMessageStore sharedInstance];
      id v8 = [v6 serviceName];
      int v9 = [v7 canStoreMessage:v13 onService:v8];

      if (v9)
      {
        id v10 = +[IMDChatStore sharedInstance];
        int v11 = [v13 guid];
        [v10 removeMessageWithGUID:v11 fromChat:v6];

        id v12 = +[IMDChatRegistry sharedInstance];
        [v12 updateLastMessageForChat:v6 hintMessage:0];

        [(IMDChatRegistry *)self updateStateForChat:v6 hintMessage:0];
      }
    }
  }
}

- (void)_fixUpChatParticipantsIfNeeded:(id)a3
{
}

- (id)_chatInfoForChats:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v3, "count"));
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v8 = v6;
    uint64_t v9 = *(void *)v17;
    *(void *)&long long v7 = 138412290;
    long long v15 = v7;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v5);
        }
        int v11 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        id v12 = objc_msgSend(v11, "copyDictionaryRepresentation:", 1, v15, (void)v16);
        if (v12)
        {
          [v4 addObject:v12];
        }
        else
        {
          id v13 = IMLogHandleForCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)int buf = v15;
            id v21 = v11;
            _os_log_error_impl(&dword_1D967A000, v13, OS_LOG_TYPE_ERROR, "Could not get chatInfo from chat: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
    }
    while (v8);
  }

  return v4;
}

- (id)_chatInfoForConnection
{
  return (id)MEMORY[0x1F4181798](self, sel__chatInfoInRange_wantsBlackholed_);
}

- (id)_allChatInfo
{
  return (id)MEMORY[0x1F4181798](self, sel__chatInfoInRange_wantsBlackholed_);
}

- (id)_chatInfoForNumberOfChats:(int64_t)a3
{
  return (id)MEMORY[0x1F4181798](self, sel__chatInfoInRange_wantsBlackholed_);
}

- (id)_blackholedChatInfoForNumberOfChats:(int64_t)a3
{
  return (id)MEMORY[0x1F4181798](self, sel__chatInfoInRange_wantsBlackholed_);
}

- (id)_chatInfoInRange:(_NSRange)a3 wantsBlackholed:(BOOL)a4
{
  NSUInteger length = a3.length;
  NSUInteger location = a3.location;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  __int16 v26 = [(IMDChatRegistry *)self _chatsWithBlackholed:a4];
  if (location + length <= [v26 count])
  {
    if (!location && IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 134218240;
        NSUInteger v47 = length;
        __int16 v48 = 2048;
        uint64_t v49 = [v26 count];
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Retrieving %ld most recent chats out of %ld chats", buf, 0x16u);
      }
    }
    NSUInteger v6 = length;
  }
  else
  {
    NSUInteger v6 = [v26 count] - location;
    if (IMOSLoggingEnabled())
    {
      long long v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 134218752;
        NSUInteger v47 = location;
        __int16 v48 = 2048;
        uint64_t v49 = length;
        __int16 v50 = 2048;
        NSUInteger v51 = location;
        __int16 v52 = 2048;
        NSUInteger v53 = v6;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Could not retrieve chats in range (%ld,%ld) as there are not that many, so retrieving all chats, range (%ld,%ld).", buf, 0x2Au);
      }
    }
  }
  uint64_t v9 = [v26 sortedArrayUsingComparator:&unk_1F3391600];
  id v10 = objc_msgSend(v9, "subarrayWithRange:", location, v6);

  uint64_t v11 = [v10 count];
  id v12 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v11];
  uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:v11];
  id v28 = (id)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:v11];
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v10;
  uint64_t v30 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
  if (v30)
  {
    uint64_t v29 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v30; ++i)
      {
        if (*(void *)v41 != v29) {
          objc_enumerationMutation(obj);
        }
        char v14 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        id v34 = [v14 guid];
        [v32 setObject:v14 forKey:v34];
        id v39 = 0;
        long long v15 = [(IMDChatRegistry *)self _siblingChatsForChat:v14 usingChatGUIDToChatMap:v32 iMessageChat:&v39];
        id v33 = v39;
        id v16 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        if ([v15 count]) {
          [(IMDChatRegistry *)self _fixSiblingChatsAndStoreIfNeeded:v15 iMessageChat:v33 chatsToRegenerate:v16];
        }
        long long v37 = 0u;
        long long v38 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        id v17 = v16;
        uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v44 count:16];
        if (v18)
        {
          uint64_t v19 = *(void *)v36;
          do
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v36 != v19) {
                objc_enumerationMutation(v17);
              }
              id v21 = *(void **)(*((void *)&v35 + 1) + 8 * j);
              if (v21 != v14)
              {
                int v22 = (void *)[*(id *)(*((void *)&v35 + 1) + 8 * j) copyDictionaryRepresentation:1];
                if ([v22 count])
                {
                  uint64_t v23 = [v21 guid];
                  [v12 setObject:v22 forKey:v23];
                }
              }
            }
            uint64_t v18 = [v17 countByEnumeratingWithState:&v35 objects:v44 count:16];
          }
          while (v18);
        }

        __int16 v24 = (void *)[v14 copyDictionaryRepresentation:1];
        if ([v24 count])
        {
          [v12 setObject:v24 forKey:v34];
          [v28 addObject:v24];
        }
      }
      uint64_t v30 = [obj countByEnumeratingWithState:&v40 objects:v45 count:16];
    }
    while (v30);
  }

  return v28;
}

- (void)_setInitialLoadForTesting:(BOOL)a3
{
  if ((IMIsRunningInUnitTesting() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long v7 = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "********* Calling setInitialLoadForTesting in non unit tests is not supported ***** ", v7, 2u);
      }
    }
    id v6 = [MEMORY[0x1E4F1CA00] exceptionWithName:@"com.apple.IMDaemonCore.unsupportedAction" reason:0 userInfo:0];
    objc_exception_throw(v6);
  }
  self->_doneLoadingAfterMerge = a3;
}

- (void)_forceReloadChats:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((self->_isLoading || self->_doneLoadingAfterMerge) && !a3)
  {
    unint64_t v5 = [(IMDChatRegistry *)self cachedChatCount];
    int v6 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v6)
      {
        long long v7 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          BOOL isLoading = self->_isLoading;
          BOOL doneLoadingAfterMerge = self->_doneLoadingAfterMerge;
          int v22 = 67109632;
          BOOL v23 = isLoading;
          __int16 v24 = 1024;
          BOOL v25 = doneLoadingAfterMerge;
          __int16 v26 = 1024;
          BOOL v27 = v3;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "NOT forcing reload of chats _isLoading: %d _doneLoadingAfterMerge: %d forced: %d", (uint8_t *)&v22, 0x14u);
        }
      }
      return;
    }
    if (v6)
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Would have ignored reload of chats but has zero chats, forcing reload", (uint8_t *)&v22, 2u);
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      BOOL v12 = self->_isLoading;
      BOOL v13 = self->_doneLoadingAfterMerge;
      int v22 = 67109632;
      BOOL v23 = v12;
      __int16 v24 = 1024;
      BOOL v25 = v13;
      __int16 v26 = 1024;
      BOOL v27 = v3;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Forcing reload of chats _isLoading: %d _doneLoadingAfterMerge: %d forced: %d", (uint8_t *)&v22, 0x14u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    char v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Dropping all chats in registry", (uint8_t *)&v22, 2u);
    }
  }
  [(NSRecursiveLock *)self->_chatsLock lock];
  [(NSMutableDictionary *)self->_chats removeAllObjects];
  [(NSMutableDictionary *)self->_chatsByGroupID removeAllObjects];
  [(NSRecursiveLock *)self->_chatsLock unlock];
  [(NSRecursiveLock *)self->_handlesLock lock];
  [(NSMutableDictionary *)self->_idToHandlesMap removeAllObjects];
  [(NSRecursiveLock *)self->_handlesLock unlock];
  long long v15 = +[IMDFileTransferCenter sharedInstance];
  [v15 removeFinishedTransfers];

  [(IMDChatRegistry *)self invalidatePersonCentricGroupedChatsCache];
  [(IMDChatRegistry *)self loadChatsWithCompletionBlock:0];
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Updating database clients", (uint8_t *)&v22, 2u);
    }
  }
  id v17 = +[IMDMessageStore sharedInstance];
  [v17 updateStamp];

  if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Posting the update chat registry to all listeners", (uint8_t *)&v22, 2u);
    }
  }
  uint64_t v19 = +[IMDLocalDaemon sharedDaemon];
  [v19 notifyClientsNewSetupInfoAvailableWithRequiredCapabilities:4];

  if (IMOSLoggingEnabled())
  {
    __int16 v20 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "=> Done notifying clients", (uint8_t *)&v22, 2u);
    }
  }
  id v21 = +[IMDChatVocabularyUpdater sharedInstance];
  [v21 updateVocabularyForDeferredUpdateRequestIfNecessaryWithCompletionHandler:0];
}

- (void)refreshUIWhileSyncing
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "Posting the update chat registry to all listeners", v4, 2u);
    }
  }
  BOOL v3 = +[IMDLocalDaemon sharedDaemon];
  [v3 notifyClientsNewSetupInfoAvailableWithRequiredCapabilities:4];
}

- (void)waitForLoadedChatsWithCompletionHandler:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    unint64_t v5 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Received request to wait for chats to be loaded", buf, 2u);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D97A2098;
  v7[3] = &unk_1E6B73AB0;
  void v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

- (BOOL)loadChatsWithCompletionBlock:(id)a3
{
  v93[1] = *MEMORY[0x1E4F143B8];
  v76 = (void (**)(id, uint64_t))a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Loading Chats... ", buf, 2u);
    }
  }
  self->_BOOL isLoading = 1;
  id v4 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  char v75 = [v4 isUnderFirstDataProtectionLock];

  int v78 = IMGetDomainBoolForKeyWithDefaultValue();
  if (IMOSLoggingEnabled())
  {
    unint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = @"YES";
      if (v78) {
        id v6 = @"NO";
      }
      *(_DWORD *)int buf = 138412290;
      *(void *)&uint8_t buf[4] = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Should fix unnamed groupID: %@", buf, 0xCu);
    }
  }
  long long v7 = +[IMDChatStore sharedInstance];
  v77 = [v7 loadRecentChats];

  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = [v77 count];
      *(_DWORD *)int buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v9;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, " Found %d chats", buf, 8u);
    }
  }
  id v10 = [MEMORY[0x1E4F6E890] sharedInstance];
  uint64_t v92 = *MEMORY[0x1E4F6DD40];
  uint64_t v11 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v77, "count"));
  v93[0] = v11;
  BOOL v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v93 forKeys:&v92 count:1];
  [v10 trackEvent:*MEMORY[0x1E4F6D808] withDictionary:v12];

  if (!v77 || ![v77 count])
  {
    BOOL v57 = 0;
    goto LABEL_86;
  }
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v77;
  uint64_t v13 = [obj countByEnumeratingWithState:&v83 objects:v91 count:16];
  if (!v13)
  {
    LOBYTE(v82) = 0;
    goto LABEL_85;
  }
  int v82 = 0;
  uint64_t v81 = *(void *)v84;
  do
  {
    uint64_t v14 = 0;
    do
    {
      if (*(void *)v84 != v81) {
        objc_enumerationMutation(obj);
      }
      long long v15 = *(void **)(*((void *)&v83 + 1) + 8 * v14);
      id v16 = (void *)MEMORY[0x1E016A370]();
      if (v15)
      {
        id v17 = +[IMDAccountController sharedInstance];
        uint64_t v18 = [v15 accountID];
        uint64_t v19 = [v17 accountForAccountID:v18];

        if (v19) {
          goto LABEL_38;
        }
        __int16 v20 = [v15 service];
        id v21 = [v15 serviceName];
        if (!v20 && IMOSLoggingEnabled())
        {
          int v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int buf = 138412290;
            *(void *)&uint8_t buf[4] = v21;
            _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "No service found, looking at name: %@", buf, 0xCu);
          }
        }
        if (v21)
        {
          BOOL v23 = +[IMDServiceController sharedController];
          uint64_t v24 = [v23 serviceWithName:v21];

          __int16 v20 = (void *)v24;
        }
        if (!v20 && IMOSLoggingEnabled())
        {
          BOOL v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int buf = 138412546;
            *(void *)&uint8_t buf[4] = v21;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v15;
            _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "No service found for name: %@: removing this chat [%@]", buf, 0x16u);
          }
        }
        __int16 v26 = +[IMDAccountController sharedInstance];
        BOOL v27 = [v26 accountsForService:v20];
        uint64_t v19 = [v27 lastObject];

        if (v19)
        {
          uint64_t v28 = [v19 accountID];
          [v15 setAccountID:v28];

LABEL_38:
          [(IMDChatRegistry *)self addChat:v15 firstLoad:1 store:0];
          uint64_t v29 = [v15 groupID];
          BOOL v30 = [v29 length] == 0;

          if (v30)
          {
            id v33 = [v15 generateNewGroupID];
            if (!v33)
            {
              *(_OWORD *)int buf = xmmword_1E6B76358;
              *(_OWORD *)&uint8_t buf[16] = *(_OWORD *)off_1E6B76368;
              uint64_t v90 = 2085;
              id v34 = NSString;
              uint64_t v35 = IMFileLocationTrimFileName();
              uint64_t v36 = v90;
              long long v37 = [NSString stringWithFormat:&stru_1F3398578];
              long long v38 = [v34 stringWithFormat:@"Unexpected nil '%@' in %s at %s:%d. %@", @"generatedGroupID", "-[IMDChatRegistry loadChatsWithCompletionBlock:]", v35, v36, v37];

              id v39 = (void (*)(void *))IMGetAssertionFailureHandler();
              if (v39)
              {
                v39(v38);
              }
              else if (IMOSLoggingEnabled())
              {
                long long v44 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v87 = 138412290;
                  v88 = v38;
                  _os_log_impl(&dword_1D967A000, v44, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", v87, 0xCu);
                }
              }
            }
            [v15 setGroupID:v33];
          }
          else
          {
            if ((v78 & 1) != 0
              || ([v15 displayName],
                  uint64_t v31 = objc_claimAutoreleasedReturnValue(),
                  BOOL v32 = [v31 length] == 0,
                  v31,
                  !v32))
            {
              IMSetDomainBoolForKey();
              goto LABEL_59;
            }
            id v41 = objc_alloc(MEMORY[0x1E4F29128]);
            long long v42 = [v15 groupID];
            long long v43 = (void *)[v41 initWithUUIDString:v42];

            if (v43)
            {

              IMSetDomainBoolForKey();
              goto LABEL_59;
            }
            if (IMOSLoggingEnabled())
            {
              NSUInteger v47 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)int buf = 138412290;
                *(void *)&uint8_t buf[4] = v15;
                _os_log_impl(&dword_1D967A000, v47, OS_LOG_TYPE_INFO, "Unnamed group with non UUID style groupID, lets fix this chat: %@", buf, 0xCu);
              }
            }
            id v33 = [v15 generateNewGroupID];
            if (!v33)
            {
              *(_OWORD *)int buf = xmmword_1E6B76380;
              *(_OWORD *)&uint8_t buf[16] = *(_OWORD *)off_1E6B76390;
              uint64_t v90 = 2097;
              __int16 v48 = NSString;
              uint64_t v49 = IMFileLocationTrimFileName();
              uint64_t v50 = v90;
              NSUInteger v51 = [NSString stringWithFormat:&stru_1F3398578];
              __int16 v52 = [v48 stringWithFormat:@"Unexpected nil '%@' in %s at %s:%d. %@", @"generatedGroupID", "-[IMDChatRegistry loadChatsWithCompletionBlock:]", v49, v50, v51];

              NSUInteger v53 = (void (*)(void *))IMGetAssertionFailureHandler();
              if (v53)
              {
                v53(v52);
              }
              else if (IMOSLoggingEnabled())
              {
                uint64_t v54 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v87 = 138412290;
                  v88 = v52;
                  _os_log_impl(&dword_1D967A000, v54, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", v87, 0xCu);
                }
              }
            }
            [v15 setGroupID:v33];
            if (IMOSLoggingEnabled())
            {
              id v55 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)int buf = 138412290;
                *(void *)&uint8_t buf[4] = v33;
                _os_log_impl(&dword_1D967A000, v55, OS_LOG_TYPE_INFO, "    New groupID: %@", buf, 0xCu);
              }
            }
          }

          IMSetDomainBoolForKey();
          [v15 storeAndBroadcastChatChanges];
LABEL_59:
          int v45 = [v15 isBlackholed];
          int v46 = v82;
          if (v45) {
            int v46 = 1;
          }
          int v82 = v46;
          __int16 v20 = v19;
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            long long v40 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138412290;
              *(void *)&uint8_t buf[4] = v15;
              _os_log_impl(&dword_1D967A000, v40, OS_LOG_TYPE_INFO, "No account: removing this chat [%@]", buf, 0xCu);
            }
          }
        }
      }
      ++v14;
    }
    while (v13 != v14);
    uint64_t v56 = [obj countByEnumeratingWithState:&v83 objects:v91 count:16];
    uint64_t v13 = v56;
  }
  while (v56);
LABEL_85:

  BOOL v57 = v82 & 1;
LABEL_86:
  self->_int blackholedChatsExistCache = v57;
  uint64_t v58 = +[IMDMessageStore sharedInstance];
  [v58 rebuildUnreadMessageCount];

  id v59 = +[IMDMessageStore sharedInstance];
  [v59 rebuildLastFailedMessageDate];

  if (IMOSLoggingEnabled())
  {
    uint64_t v60 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      id v61 = [(IMDChatRegistry *)self cachedChats];
      int v62 = [v61 count];
      *(_DWORD *)int buf = 67109120;
      *(_DWORD *)&uint8_t buf[4] = v62;
      _os_log_impl(&dword_1D967A000, v60, OS_LOG_TYPE_INFO, "=> Done Loading %d Chats", buf, 8u);
    }
  }
  self->_BOOL isLoading = 0;
  self->_BOOL doneLoadingAfterMerge = v75 ^ 1;
  id v63 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  char v64 = [v63 isUnderFirstDataProtectionLock];

  if (v64)
  {
    if (IMOSLoggingEnabled())
    {
      v65 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_1D967A000, v65, OS_LOG_TYPE_INFO, "Not merging forks before first unlock", buf, 2u);
      }
    }
  }
  else
  {
    [(IMDChatRegistry *)self repairDuplicateChatsIfNeeded];
  }
  if (IMSharedHelperContactsBasedMergingEnabled()) {
    [(IMDChatRegistry *)self _populateContactIDOnHandles];
  }
  if (IMSharedHelperPersistMergeIDMergedChats()) {
    [(IMDChatRegistry *)self _persistMergeIDMergedChatsIfNeeded];
  }
  if ((v75 & 1) == 0) {
    [(IMDChatRegistry *)self _markGroupPhotosAsUnpurgeableIfNecessary];
  }
  v66 = self;
  if (!self->_messageProcessingController)
  {
    uint64_t v67 = objc_alloc_init(IMDMessageProcessingController);
    messageProcessingController = self->_messageProcessingController;
    self->_messageProcessingController = v67;

    [(IMDMessageProcessingController *)self->_messageProcessingController scheduleInitialProcessingCheck];
    v66 = self;
  }
  if (!v66->_messageHistorySyncController)
  {
    v69 = objc_alloc_init(IMDMessageHistorySyncTaskLiveFactory);
    v70 = [[IMDMessageHistorySyncController alloc] initWithMessageHistorySyncTaskFactory:v69];
    messageHistorySyncController = self->_messageHistorySyncController;
    self->_messageHistorySyncController = v70;
  }
  if (v76) {
    v76[2](v76, 1);
  }
  v72 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v72 postNotificationName:@"__kIMDChatsLoadedNotification" object:0];

  v73 = +[IMDCKExitManager sharedInstance];
  [v73 writeInitialSyncCompletedRecordIfNeeded];

  [(IMDChatRegistry *)self setUpInitialConversationManager];
  +[IMDChatVocabularyUpdater performInitialUpdateIfNeeded];

  return 1;
}

- (void)_persistMergeIDMergedChatsIfNeeded
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if ((byte_1EBE2BBC0 & 1) == 0)
  {
    BOOL v3 = (void *)MEMORY[0x1E016A370](self, a2);
    id v4 = [(IMDChatRegistry *)self _allHandles];
    if (IMOSLoggingEnabled())
    {
      unint64_t v5 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 134217984;
        uint64_t v18 = [v4 count];
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "try to persist mergeID merged chats for [%lu] handles", buf, 0xCu);
      }
    }
    long long v14 = 0u;
    long long v15 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v6 = [(IMDChatRegistry *)self allChats];
    uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v13;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v13 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v12 + 1) + 8 * i);
          uint64_t v11 = (void *)MEMORY[0x1E016A370]();
          [v10 _persistMergedIDMergedChatsIfNeeded:v4];
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v12 objects:v16 count:16];
      }
      while (v7);
    }

    byte_1EBE2BBC0 = 1;
  }
}

- (BOOL)updateProperties:(id)a3 chat:(id)a4 style:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 count] && objc_msgSend(v9, "length"))
  {
    id v10 = [(IMDChatRegistry *)self allExistingChatsWithIdentifier:v9 style:v5];
    long long v17 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      int v13 = 0;
      uint64_t v14 = *(void *)v18;
      do
      {
        for (uint64_t i = 0; i != v12; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v10);
          }
          v13 |= [*(id *)(*((void *)&v17 + 1) + 8 * i) updateProperties:v8];
        }
        uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v21 count:16];
      }
      while (v12);
    }
    else
    {
      LOBYTE(v13) = 0;
    }
  }
  else
  {
    LOBYTE(v13) = 0;
  }

  return v13 & 1;
}

- (void)addIMDHandleToRegistry:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSRecursiveLock *)self->_handlesLock lock];
  if (v4
    && ([v4 ID],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 length],
        v5,
        v6))
  {
    idToHandlesMap = self->_idToHandlesMap;
    id v8 = [v4 ID];
    id v9 = [(NSMutableDictionary *)idToHandlesMap objectForKey:v8];

    if (!v9)
    {
      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
      id v10 = self->_idToHandlesMap;
      uint64_t v11 = [v4 ID];
      [(NSMutableDictionary *)v10 setObject:v9 forKey:v11];
    }
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v12 = v9;
    uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      while (2)
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v12);
          }
          if (*(id *)(*((void *)&v17 + 1) + 8 * v15) == v4)
          {

            goto LABEL_20;
          }
          ++v15;
        }
        while (v13 != v15);
        uint64_t v13 = [v12 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v13) {
          continue;
        }
        break;
      }
    }

    objc_msgSend(v12, "addObject:", v4, (void)v17);
LABEL_20:
    [(NSRecursiveLock *)self->_handlesLock unlock];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        id v23 = v4;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Will not add malformed IMHandle:%@ to IMDHandleRegistry", buf, 0xCu);
      }
    }
    id v12 = 0;
  }
}

- (BOOL)removeIMDHandleFromRegistry:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSRecursiveLock *)self->_handlesLock lock];
  if (!v4) {
    goto LABEL_12;
  }
  uint64_t v5 = [v4 ID];
  uint64_t v6 = [v5 length];

  if (!v6) {
    goto LABEL_15;
  }
  idToHandlesMap = self->_idToHandlesMap;
  id v8 = [v4 ID];
  id v9 = [(NSMutableDictionary *)idToHandlesMap objectForKey:v8];

  if (!v9)
  {
LABEL_12:
    LOBYTE(v6) = 0;
    goto LABEL_15;
  }
  uint64_t v10 = [v9 indexOfObject:v4];
  if (v10 != 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v11 = v10;
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v4;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Removing IMDHandle:%@ from IMDHandleRegistry", (uint8_t *)&v16, 0xCu);
      }
    }
    [v9 removeObjectAtIndex:v11];
  }
  LODWORD(v6) = [v9 count] == 0;
  uint64_t v13 = self->_idToHandlesMap;
  uint64_t v14 = [v4 ID];
  if (v6) {
    [(NSMutableDictionary *)v13 removeObjectForKey:v14];
  }
  else {
    [(NSMutableDictionary *)v13 setObject:v9 forKey:v14];
  }

LABEL_15:
  [(NSRecursiveLock *)self->_handlesLock unlock];

  return v6;
}

- (id)allHandlesForID:(id)a3
{
  id v4 = a3;
  [(NSRecursiveLock *)self->_handlesLock lock];
  if ([v4 length])
  {
    uint64_t v5 = [(NSMutableDictionary *)self->_idToHandlesMap objectForKey:v4];
    [(NSRecursiveLock *)self->_handlesLock unlock];
  }
  else
  {
    uint64_t v5 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v5;
}

- (void)_reloadChatsForDatabaseMergeOrDatabaseSwitch
{
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Received merge complete notification, re-syncing chats", v4, 2u);
    }
  }
  [(IMDChatRegistry *)self _forceReloadChats:1];
  [(IMDChatRegistry *)self _performPostUnlockHousekeeping];
}

- (void)_performPostUnlockHousekeeping
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  v2 = +[IMDMessageStore sharedInstance];
  [v2 performInitialHousekeeping];

  BOOL v3 = +[IMDReplayController sharedInstance];
  [v3 replayMessages];

  id v4 = +[IMDCKBackupController sharedInstance];
  [v4 _ensureRestoredDatabaseToBackup];

  uint64_t MessagesSequenceNumber = IMDMessageRecordGetMessagesSequenceNumber();
  int v6 = IMOSLoggingEnabled();
  if (MessagesSequenceNumber == -1)
  {
    if (v6)
    {
      id v8 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = 134217984;
        uint64_t v10 = -1;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Not Resetting LastBulletinboardPostedMessageRowID: %lld", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v7 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v9 = 134217984;
        uint64_t v10 = MessagesSequenceNumber;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Resetting LastBulletinboardPostedMessageRowID: %lld", (uint8_t *)&v9, 0xCu);
      }
    }
    IMSetDomainIntForKey();
  }
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Device left first unlock, re-syncing chats", buf, 2u);
    }
  }
  self->_firstUnlockTriggered = 1;
  id v4 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
  [v4 notifyFirstUnlockComplete];

  [(IMDChatRegistry *)self _forceReloadChats:0];
  [(IMDChatRegistry *)self _makeAllAttachmentsClassC];
  uint64_t v5 = +[IMDAccountController sharedInstance];
  int v6 = [v5 anySessionForServiceName:*MEMORY[0x1E4F6E1B0]];

  if (v6
    || (+[IMDAccountController sharedInstance],
        uint64_t v7 = objc_claimAutoreleasedReturnValue(),
        [v7 anySessionForServiceName:*MEMORY[0x1E4F6E1A0]],
        int v6 = objc_claimAutoreleasedReturnValue(),
        v7,
        v6))
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v17 = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "calling update routing, expire and watch dog after first unlock", v17, 2u);
      }
    }
    [v6 _updateRoutingTimerWithInterval:120.0];
    [v6 _updateExpireStateTimerWithInterval:120.0];
    [v6 _updateWatchdogTimerWithInterval:120.0];
  }
  int v9 = +[IMDCKRecordSaltManager sharedInstance];
  [v9 fetchLatestRecordKeyFromCKAndCreateIfKeyDoesNotExistWithCompletion:&unk_1F3391620];

  uint64_t v10 = +[IMDCKRampManager sharedInstance];
  [v10 fetchLatestRampStateFromCK:0];

  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v16 = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Performing one time account check after upgrade", v16, 2u);
    }
  }
  id v12 = +[IMDCKSyncController sharedInstance];
  [v12 performOneTimeAccountUpgradeCheckIfNeeded];

  uint64_t v13 = +[IMDAccountController sharedInstance];
  uint64_t v14 = [v13 activeAliases];

  uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v14 forKey:*MEMORY[0x1E4F6BF28]];
  IMDNotificationsRetractNotificationsFromFirstUnlockWithContext();
}

- (void)systemDidUnlock
{
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "systemDidUnlock", buf, 2u);
    }
  }
  if (!self->_firstUnlockTriggered)
  {
    id v4 = [MEMORY[0x1E4F6EAB8] sharedInstance];
    char v5 = [v4 isUnderFirstDataProtectionLock];

    if ((v5 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        int v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v7 = 0;
          _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Detected an unlock but first unlock notifications were missed, performing first unlock as if we did just now", v7, 2u);
        }
      }
      [(IMDChatRegistry *)self systemDidLeaveFirstDataProtectionLock];
    }
  }
  [(IMDChatRegistry *)self _makeAllAttachmentsClassC];
}

- (void)_makeAllAttachmentsClassC
{
  if ((IMGetDomainBoolForKey() & 1) == 0)
  {
    im_dispatch_after();
  }
}

- (BOOL)_chat:(id)a3 isDuplicateOfChat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 style] == 43 && objc_msgSend(v6, "style") == 43)
  {
    uint64_t v7 = [v5 groupID];
    id v8 = [v6 groupID];
    if ([v7 isEqual:v8])
    {
      int v9 = [v5 serviceName];
      uint64_t v10 = [v6 serviceName];
      char v11 = [v9 isEqual:v10];
    }
    else
    {
      char v11 = 0;
    }
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (int64_t)_compareDuplicateChatsWithFirstChat:(id)a3 secondChat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 groupID];
  id v8 = [v6 groupID];
  int64_t v9 = [v7 compare:v8];

  if (!v9)
  {
    uint64_t v10 = [v5 serviceName];
    char v11 = [v6 serviceName];
    int64_t v9 = [v10 compare:v11];

    if (!v9)
    {
      uint64_t v12 = [v5 groupParticipantVersion];
      uint64_t v13 = [v6 groupParticipantVersion];
      if (v12 >= v13)
      {
        if (v12 <= v13)
        {
          uint64_t v14 = [v5 displayName];
          uint64_t v15 = [v6 displayName];
          if ([v14 length] || !objc_msgSend(v15, "length"))
          {
            if (![v14 length] || objc_msgSend(v15, "length"))
            {

              int64_t v9 = [v5 compareBySequenceNumberAndDateDescending:v6];
              goto LABEL_15;
            }
            int64_t v9 = -1;
          }
          else
          {
            int64_t v9 = 1;
          }

          goto LABEL_15;
        }
        int64_t v9 = -1;
      }
      else
      {
        int64_t v9 = 1;
      }
    }
  }
LABEL_15:

  return v9;
}

- (id)_findChatWinnerInDuplicateChatArray:(id)a3 fixDisplayName:(BOOL *)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ([v5 count])
  {
    id v6 = [v5 objectAtIndexedSubscript:0];
  }
  else
  {
    id v6 = 0;
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([(IMDChatRegistry *)self _compareDuplicateChatsWithFirstChat:v12 secondChat:v6] == -1)
        {
          uint64_t v13 = [v6 displayName];
          if ([v13 length])
          {
            uint64_t v14 = [v12 displayName];
            uint64_t v15 = [v14 length];

            if (!v15)
            {
              int v16 = [v6 displayName];
              [v12 setDisplayName:v16];

              if (a4) {
                *a4 = 1;
              }
            }
          }
          else
          {
          }
          id v17 = v12;

          id v6 = v17;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v9);
  }

  return v6;
}

- (id)_findLosingChatGUIDsInArrayOfChats:(id)a3 withWinner:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v5, "count") - 1);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
  if (v9)
  {
    char v10 = 0;
    uint64_t v11 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v21 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(id *)(*((void *)&v20 + 1) + 8 * i);
        if (v13 == v6)
        {
          char v10 = 1;
        }
        else
        {
          uint64_t v14 = objc_msgSend(v13, "guid", (void)v20);
          [v7 addObject:v14];
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v20 objects:v28 count:16];
    }
    while (v9);

    if (v10)
    {
      id v15 = v7;
      goto LABEL_19;
    }
  }
  else
  {
  }
  if (IMOSLoggingEnabled())
  {
    int v16 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [v6 description];
      uint64_t v18 = [v8 description];
      *(_DWORD *)int buf = 138412546;
      id v25 = v17;
      __int16 v26 = 2112;
      BOOL v27 = v18;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "did not find winner %@ in list of duplicates %@", buf, 0x16u);
    }
  }
  id v15 = 0;
LABEL_19:

  return v15;
}

- (id)_createGroupChatsArray
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Finding group chats", buf, 2u);
    }
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v5 = [(IMDChatRegistry *)self allChats];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v12;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v12 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        if ([v9 style] == 43) {
          [v4 addObject:v9];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v11 objects:v16 count:16];
    }
    while (v6);
  }

  return v4;
}

- (id)_copyDuplicateChatsArrayWithLimit:(int64_t)a3
{
  id v5 = +[IMDChatStore sharedInstance];
  uint64_t v6 = (void *)[v5 copyDuplicateGroupChatsWithLimit:a3];

  uint64_t v7 = [(IMDChatRegistry *)self _addChatsFromCacheMisses:v6 preferExistingChats:1];

  return v7;
}

- (id)_copyGroupedDuplicateChatsSortedFromWinningToLosingWithLimit:(int64_t)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = [(IMDChatRegistry *)self _copyDuplicateChatsArrayWithLimit:a3];
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1D97A5160;
  v25[3] = &unk_1E6B763B0;
  v25[4] = self;
  id v5 = [v4 sortedArrayUsingComparator:v25];

  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v22 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v12 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v13 = objc_msgSend(v12, "groupID", (void)v21);
        long long v14 = [v6 objectForKeyedSubscript:v13];

        if (!v14)
        {
          id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          int v16 = [v12 groupID];
          [v6 setObject:v15 forKeyedSubscript:v16];
        }
        uint64_t v17 = [v12 groupID];
        uint64_t v18 = [v6 objectForKeyedSubscript:v17];
        [v18 addObject:v12];
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v9);
  }

  long long v19 = [v6 allValues];

  return v19;
}

- (BOOL)_mergeDuplicateGroupsIfNeeded
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v42 = [(IMDChatRegistry *)self _copyGroupedDuplicateChatsSortedFromWinningToLosingWithLimit:500];
  uint64_t v3 = [v42 count];
  int v4 = IMOSLoggingEnabled();
  if (!v3)
  {
    if (v4)
    {
      uint64_t v35 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "No duplicate chats found to merge", buf, 2u);
      }
    }
    char v8 = 0;
    goto LABEL_70;
  }
  if (v4)
  {
    id v5 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [v42 count];
      id v7 = [v42 description];
      *(_DWORD *)int buf = 134218242;
      uint64_t v60 = v6;
      __int16 v61 = 2112;
      id v62 = v7;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Found %ld duplicate chats needing merging: %@", buf, 0x16u);
    }
  }
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  id obj = v42;
  uint64_t v45 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
  BOOL v41 = v45 != 0;
  if (!v45) {
    goto LABEL_49;
  }
  char v8 = 0;
  uint64_t v44 = *(void *)v55;
  while (2)
  {
    uint64_t v9 = 0;
    do
    {
      if (*(void *)v55 != v44)
      {
        uint64_t v10 = v9;
        objc_enumerationMutation(obj);
        uint64_t v9 = v10;
      }
      uint64_t v46 = v9;
      long long v11 = *(void **)(*((void *)&v54 + 1) + 8 * v9);
      char v53 = 0;
      long long v12 = [(IMDChatRegistry *)self _findChatWinnerInDuplicateChatArray:v11 fixDisplayName:&v53];
      if (!v12)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v36 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)int buf = 0;
            _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_INFO, "winningChat unexpectedly nil", buf, 2u);
          }
        }
        goto LABEL_69;
      }
      NSUInteger v47 = [(IMDChatRegistry *)self _findLosingChatGUIDsInArrayOfChats:v11 withWinner:v12];
      int v13 = IMOSLoggingEnabled();
      if (!v47)
      {
        if (v13)
        {
          long long v37 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)int buf = 0;
            _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_INFO, "losingChats is unexpectedly nil", buf, 2u);
          }
        }
        goto LABEL_68;
      }
      if (v13)
      {
        long long v14 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v15 = [v12 description];
          id v16 = [v47 description];
          uint64_t v17 = [v11 description];
          *(_DWORD *)int buf = 138412802;
          uint64_t v60 = (uint64_t)v15;
          __int16 v61 = 2112;
          id v62 = v16;
          __int16 v63 = 2112;
          char v64 = v17;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "found winning chat %@, and losing chats %@, in list of chat duplicates: %@", buf, 0x20u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = [v47 description];
          long long v20 = [v12 guid];
          *(_DWORD *)int buf = 138412546;
          uint64_t v60 = (uint64_t)v19;
          __int16 v61 = 2112;
          id v62 = v20;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "will merge losing chats %@ into winning chat id %@", buf, 0x16u);
        }
      }
      if ((IMIsRunningInUnitTesting() & 1) == 0)
      {
        if (v53)
        {
          long long v21 = [v12 displayName];
        }
        else
        {
          long long v21 = 0;
        }
        long long v22 = [v12 guid];
        id v52 = 0;
        IMDChatRecordRepairDuplicateChats();
        id v23 = v52;

        if (!v23)
        {

          goto LABEL_27;
        }
        if (IMOSLoggingEnabled())
        {
          long long v38 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            id v39 = [v23 localizedDescription];
            *(_DWORD *)int buf = 138412290;
            uint64_t v60 = (uint64_t)v39;
            _os_log_impl(&dword_1D967A000, v38, OS_LOG_TYPE_INFO, "repairing duplicate chats failed: %@", buf, 0xCu);
          }
        }

LABEL_68:
LABEL_69:

        goto LABEL_70;
      }
LABEL_27:
      if (IMOSLoggingEnabled())
      {
        long long v24 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          id v25 = [v47 description];
          __int16 v26 = [v12 guid];
          *(_DWORD *)int buf = 138412546;
          uint64_t v60 = (uint64_t)v25;
          __int16 v61 = 2112;
          id v62 = v26;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "merged losing chats %@ into winning chat id %@", buf, 0x16u);
        }
      }
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v27 = v11;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v58 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v49;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v49 != v29) {
              objc_enumerationMutation(v27);
            }
            uint64_t v31 = *(void **)(*((void *)&v48 + 1) + 8 * i);
            if (([v31 isEqual:v12] & 1) == 0)
            {
              [(IMDChatRegistry *)self removeChat:v31];
              if (IMOSLoggingEnabled())
              {
                BOOL v32 = OSLogHandleForIMEventCategory();
                if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)int buf = 138412290;
                  uint64_t v60 = (uint64_t)v31;
                  _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Deleted unwanted chat %@", buf, 0xCu);
                }
              }
            }
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v48 objects:v58 count:16];
        }
        while (v28);
      }

      if (IMOSLoggingEnabled())
      {
        id v33 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = [v47 count];
          *(_DWORD *)int buf = 134217984;
          uint64_t v60 = v34;
          _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "finished merging %ld duplicate chats", buf, 0xCu);
        }
      }
      uint64_t v9 = v46 + 1;
      char v8 = 1;
    }
    while (v46 + 1 != v45);
    uint64_t v45 = [obj countByEnumeratingWithState:&v54 objects:v65 count:16];
    if (v45) {
      continue;
    }
    break;
  }
LABEL_49:

  char v8 = v41;
LABEL_70:

  return v8 & 1;
}

- (BOOL)repairDuplicateChatsIfNeeded
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E016A370](self, a2);
  if (self->_isLoading)
  {
    *(_OWORD *)id v27 = xmmword_1E6B763D0;
    long long v28 = *(_OWORD *)off_1E6B763E0;
    uint64_t v29 = 2644;
    int v4 = NSString;
    uint64_t v5 = IMFileLocationTrimFileName();
    uint64_t v6 = [NSString stringWithFormat:&stru_1F3398578];
    id v7 = [v4 stringWithFormat:@"Unexepectedly true '%@' in %s at %s:%d. %@", @"_isLoading", "-[IMDChatRegistry repairDuplicateChatsIfNeeded]", v5, 2644, v6];

    char v8 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v8)
    {
      v8(v7);
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        __int16 v26 = v7;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F6C830];
  long long v11 = IMGetCachedDomainValueForKey();
  long long v12 = v11;
  if (v11 && [v11 integerValue] > 3)
  {
    if (IMOSLoggingEnabled())
    {
      long long v22 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v27 = 138412290;
        *(void *)&void v27[4] = v10;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Will NOT check for duplicate chats after checking pref key %@:merged-duplicate-chats", v27, 0xCu);
      }
      goto LABEL_36;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v13 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v27 = 138412290;
        *(void *)&void v27[4] = v10;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "will check for duplicate chats after checking pref key %@:merged-duplicate-chats", v27, 0xCu);
      }
    }
    IMSetDomainValueForKey();
    if (IMOSLoggingEnabled())
    {
      long long v14 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v27 = 138412290;
        *(void *)&void v27[4] = v10;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Set pref for duplicate check (%@:merged-duplicate-chats) to YES", v27, 0xCu);
      }
    }
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    double v16 = v15;
    if ([(IMDChatRegistry *)self _mergeDuplicateGroupsIfNeeded])
    {
      unsigned int v17 = 0;
      do
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v18 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id v27 = 0;
            _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Finished repairing a batch of duplicate chats", v27, 2u);
          }
        }
        BOOL v19 = [(IMDChatRegistry *)self _mergeDuplicateGroupsIfNeeded];
      }
      while (v17++ < 9 && v19);
    }
    if (IMOSLoggingEnabled())
    {
      long long v22 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
        *(_DWORD *)id v27 = 134217984;
        *(double *)&void v27[4] = v23 - v16;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Finished repairing duplicate chats in %f seconds", v27, 0xCu);
      }
LABEL_36:
    }
  }

  return 1;
}

- (void)_markGroupPhotosAsUnpurgeableIfNecessary
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if ((IMGetDomainBoolForKeyWithDefaultValue() & 1) == 0)
  {
    id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
    [(NSRecursiveLock *)self->_chatsLock lock];
    int v4 = [(NSMutableDictionary *)self->_chats allValues];
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v5 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v23;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v23 != v7) {
            objc_enumerationMutation(v4);
          }
          uint64_t v9 = [*(id *)(*((void *)&v22 + 1) + 8 * v8) groupPhotoGuid];
          if ([v9 length]) {
            [v3 addObject:v9];
          }

          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v22 objects:v27 count:16];
      }
      while (v6);
    }
    [(NSRecursiveLock *)self->_chatsLock unlock];
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v10 = v3;
    uint64_t v11 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = v11;
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v10);
          }
          double v15 = (void *)IMDAttachmentRecordCopyAttachmentForGUID();
          if (v15)
          {
            double v16 = (void *)IMDAttachmentRecordCopyFilename();
            if ([v16 length])
            {
              unsigned int v17 = +[IMDAttachmentStore sharedInstance];
              [v17 markAttachmentUnpurgeable:v16];
            }
          }

          ++v14;
        }
        while (v12 != v14);
        uint64_t v12 = [v10 countByEnumeratingWithState:&v18 objects:v26 count:16];
      }
      while (v12);
    }

    IMSetDomainBoolForKey();
  }
}

- (id)_allHandles
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  int v4 = [(IMDChatRegistry *)self allChats];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v22;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v22 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v21 + 1) + 8 * i);
        long long v17 = 0u;
        long long v18 = 0u;
        long long v19 = 0u;
        long long v20 = 0u;
        id v10 = objc_msgSend(v9, "participants", 0);
        uint64_t v11 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v11)
        {
          uint64_t v12 = v11;
          uint64_t v13 = *(void *)v18;
          do
          {
            for (uint64_t j = 0; j != v12; ++j)
            {
              if (*(void *)v18 != v13) {
                objc_enumerationMutation(v10);
              }
              if (v3)
              {
                double v15 = *(const void **)(*((void *)&v17 + 1) + 8 * j);
                if (v15) {
                  CFArrayAppendValue(v3, v15);
                }
              }
            }
            uint64_t v12 = [v10 countByEnumeratingWithState:&v17 objects:v25 count:16];
          }
          while (v12);
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v21 objects:v26 count:16];
    }
    while (v6);
  }

  return v3;
}

- (id)groupChatsBasedOnIdentity:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "NOT Using person centric grouped chats cache", buf, 2u);
    }
  }
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v6 = v3;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
  uint64_t v8 = v7;
  if (v7)
  {
    uint64_t v9 = *(void *)v17;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v17 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v16 + 1) + 8 * v10);
        uint64_t v12 = (void *)MEMORY[0x1E016A370](v7);
        uint64_t v13 = objc_msgSend(v11, "personCentricID", (void)v16);
        id v14 = [v5 objectForKey:v13];
        if (!v14)
        {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          [v5 setObject:v14 forKey:v13];
        }
        [v14 addObject:v11];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v16 objects:v21 count:16];
      uint64_t v8 = v7;
    }
    while (v7);
  }

  return v5;
}

- (id)chatsToUploadToCloudKitWithLimit:(unint64_t)a3
{
  v29[2] = *MEMORY[0x1E4F143B8];
  id v6 = (void *)MEMORY[0x1E4F28BA0];
  uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v8 = +[IMDServiceController sharedController];
  uint64_t v9 = [v8 serviceNamesSupportingCapability:*MEMORY[0x1E4F6E080]];
  uint64_t v10 = [v9 allObjects];
  uint64_t v11 = objc_msgSend(v7, "__im_chatPredicateForServiceNames:", v10);
  v29[0] = v11;
  uint64_t v12 = objc_msgSend(MEMORY[0x1E4F28F60], "__im_chatPredicateForSyncState:", 1);
  v29[1] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v29 count:2];
  id v14 = [v6 andPredicateWithSubpredicates:v13];

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v16 = [(IMDChatRegistry *)self chatStore];
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  v23[2] = sub_1D97A676C;
  v23[3] = &unk_1E6B76498;
  id v17 = v15;
  id v24 = v17;
  unint64_t v25 = a3;
  SEL v26 = a2;
  [v16 enumerateBatchedChatsFilteredUsingPredicate:v14 batchSize:a3 block:v23];

  long long v18 = [v17 allValues];
  long long v19 = [(IMDChatRegistry *)self _addChatsFromCacheMisses:v18 preferExistingChats:1];

  if (IMOSLoggingEnabled())
  {
    long long v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = [v19 count];
      *(_DWORD *)int buf = 134217984;
      uint64_t v28 = v21;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Got %llu chats to upload", buf, 0xCu);
    }
  }

  return v19;
}

- (void)updateChatWithGUID:(id)a3 serverChangeToken:(id)a4 recordID:(id)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(IMDChatRegistry *)self existingChatWithGUID:v8];
  uint64_t v12 = v11;
  if (v11)
  {
    [v11 setServerChangeToken:v9];
    [v12 setCloudKitRecordID:v10];
    [v12 storeAndBroadcastChatChanges];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Did not find chat for GUID %@", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)_insertChatUsingSyncData:(id)a3
{
  id v10 = +[IMDChat chatWithSyncData:a3];
  int v4 = [(IMDChat *)v10 guid];
  id v5 = [(IMDChatRegistry *)self existingChatWithGUID:v4];

  if (!v5)
  {
    id v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v7 = [v6 isMessagesIniCloudVersion2];

    if (v7)
    {
      id v8 = +[IMDChatStore sharedInstance];
      [v8 storeChat:v10];

      id v9 = +[IMDMessageStore sharedInstance];
      [v9 updateStamp];
    }
    else
    {
      [(IMDChatRegistry *)self addChat:v10];
    }
  }
}

- (id)_uncachedNewestChatWithOriginalGroupID:(id)a3 onService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IMDChatRegistry *)self chatStore];
  id v9 = [v8 newestChatWithOriginalGroupID:v7 onService:v6];

  return v9;
}

- (id)newestExistingChatWithOriginalGroupID:(id)a3 onService:(id)a4
{
  id v5 = [(IMDChatRegistry *)self _uncachedNewestChatWithOriginalGroupID:a3 onService:a4];
  id v6 = [(IMDChatRegistry *)self _addChatFromCacheMiss:v5 preferExistingChat:1];

  return v6;
}

- (id)_newestExistingChatWithGroupID:(id)a3 onService:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412546;
      id v26 = v6;
      __int16 v27 = 2112;
      id v28 = v7;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Searching for the newest chat with groupID: %@ service: %@", buf, 0x16u);
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v19 = v6;
  id v9 = [(IMDChatRegistry *)self existingChatsWithGroupID:v6];
  id v10 = 0;
  uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v9);
        }
        int v14 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        id v15 = [v14 serviceName];
        if (![v15 isEqualToString:v7]) {
          goto LABEL_19;
        }
        BOOL v16 = [v14 style] == 43;

        if (v16 && (!v10 || [v14 isNewerThan:v10]))
        {
          if (IMOSLoggingEnabled())
          {
            id v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138412290;
              id v26 = v14;
              _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Found newer chat match for groupID: %@", buf, 0xCu);
            }
          }
          id v15 = v10;
          id v10 = v14;
LABEL_19:

          continue;
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v11);
  }

  return v10;
}

- (id)_existingChatForSyncData:(id)a3 originalGUID:(id)a4
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 numberForKey:@"stl"];
  char v9 = [v8 unsignedIntegerValue];

  if (!v7 && v9 != 45)
  {
    id v10 = [v6 stringForKey:@"ogid"];
    uint64_t v11 = [v6 stringForKey:@"svc"];
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412546;
        id v24 = v10;
        __int16 v25 = 2112;
        unint64_t v26 = (unint64_t)v11;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Looking for chat for CKRecord with originalGroupID: %@ service: %@", (uint8_t *)&v23, 0x16u);
      }
    }
    if (v10 && [v10 length])
    {
      uint64_t v13 = [(IMDChatRegistry *)self _uncachedNewestChatWithOriginalGroupID:v10 onService:v11];
    }
    else
    {
      uint64_t v13 = 0;
    }
    BOOL v16 = [v6 stringForKey:@"gid"];
    id v17 = v16;
    if (!v13 && v16)
    {
      if (![v16 length])
      {
        uint64_t v13 = 0;
        if (v10)
        {
LABEL_31:
          if (!v13)
          {
            if ([v10 length])
            {
              if (IMOSLoggingEnabled())
              {
                long long v20 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  int v23 = 138412290;
                  id v24 = v10;
                  _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Failed to find group chat with current group ID, trying with originalGroupID (%@) as groupID", (uint8_t *)&v23, 0xCu);
                }
              }
              uint64_t v13 = [(IMDChatRegistry *)self _newestExistingChatWithGroupID:v10 onService:v11];
            }
            else
            {
              uint64_t v13 = 0;
            }
          }
        }
LABEL_41:

        goto LABEL_42;
      }
      if (IMOSLoggingEnabled())
      {
        long long v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          unint64_t v19 = [(IMDChatRegistry *)self cachedChatCount];
          int v23 = 138412802;
          id v24 = v10;
          __int16 v25 = 2048;
          unint64_t v26 = v19;
          __int16 v27 = 2112;
          id v28 = v17;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Failed to find group chat with originalGroupID as regular groupID (%@) in %llu chats, trying with client groupID (%@)", (uint8_t *)&v23, 0x20u);
        }
      }
      uint64_t v13 = [(IMDChatRegistry *)self _newestExistingChatWithGroupID:v17 onService:v11];
    }
    if (v10) {
      goto LABEL_31;
    }
    goto LABEL_41;
  }
  if (v7)
  {
    id v10 = v7;
    if (IMOSLoggingEnabled())
    {
      int v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v23 = 138412546;
        id v24 = v10;
        __int16 v25 = 2112;
        unint64_t v26 = (unint64_t)v6;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "We specified originalGUID %@ for sync data %@", (uint8_t *)&v23, 0x16u);
      }
    }
  }
  else
  {
    id v10 = [v6 stringForKey:@"guid"];
  }
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412290;
      id v24 = v10;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Looking for chat for CKRecord with GUID: %@", (uint8_t *)&v23, 0xCu);
    }
  }
  uint64_t v13 = [(IMDChatRegistry *)self existingChatWithGUID:v10];
LABEL_42:

  if (IMOSLoggingEnabled())
  {
    long long v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412290;
      id v24 = v13;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Found existing chat for CKRecord: %@", (uint8_t *)&v23, 0xCu);
    }
  }

  return v13;
}

- (BOOL)_ensureNoExistingGroupForSyncData:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 numberForKey:@"stl"];
  unsigned __int8 v6 = [v5 unsignedIntegerValue];

  id v7 = [v4 stringForKey:@"gid"];
  id v8 = [v4 stringForKey:@"ogid"];
  uint64_t v9 = [v4 stringForKey:@"svc"];
  id v10 = (void *)v9;
  if (v6 == 45 || v8 == 0 || v9 == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v24 = 67109634;
        *(_DWORD *)__int16 v25 = v6;
        *(_WORD *)&v25[4] = 2112;
        *(void *)&v25[6] = v8;
        *(_WORD *)&v25[14] = 2112;
        *(void *)&v25[16] = v10;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Won't _ensureNoExistingGroupForCKRecord style:%hhu, originalGroupID:%@ service:%@", (uint8_t *)&v24, 0x1Cu);
      }
    }
    BOOL v14 = 1;
  }
  else
  {
    id v15 = [(IMDChatRegistry *)self chatStore];
    BOOL v16 = [v15 newestChatWithOriginalGroupID:v8 onService:v10];

    if (v16) {
      goto LABEL_32;
    }
    if (IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v24 = 138412546;
        *(void *)__int16 v25 = v8;
        *(_WORD *)&v25[8] = 2112;
        *(void *)&v25[10] = v7;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "No existing chat with originalGroupID (%@) found, checking client groupID (%@)", (uint8_t *)&v24, 0x16u);
      }
    }
    long long v18 = [(IMDChatRegistry *)self chatStore];
    BOOL v16 = [v18 newestChatWithGroupID:v7 onService:v10];

    if (v16)
    {
LABEL_32:
      if (IMOSLoggingEnabled())
      {
        unint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v24 = 138412546;
          *(void *)__int16 v25 = v8;
          *(_WORD *)&v25[8] = 2112;
          *(void *)&v25[10] = v16;
          _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "IMDChatRegistry: Found an existing chat that's not in the registry. This is likely because the registry failed it's chat load. OriginalGroupID:%@ Chat:%@", (uint8_t *)&v24, 0x16u);
        }
      }
      if (![(IMDChatRegistry *)self hasDumpedLogsForNoExisitingGroup])
      {
        long long v20 = [(IMDChatRegistry *)self ckUtilities];
        long long v21 = [v20 logCollectorAddress];

        long long v22 = [(IMDChatRegistry *)self ckUtilities];
        [v22 reportMOCDebuggingErrorWithString:@"TriedToInsertDuplicateChat" internalOnly:1 initialSync:0 sendToHandle:v21 reasonString:@"TriedToInsertDuplicateChat"];

        [(IMDChatRegistry *)self setHasDumpedLogsForNoExisitingGroup:1];
      }
      BOOL v14 = 0;
    }
    else
    {
      BOOL v14 = 1;
    }
  }
  return v14;
}

- (void)_markForksAsSyncedForChat:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 style] == 43)
  {
    __int16 v27 = self;
    id v5 = [v4 serviceName];
    uint64_t v26 = [v4 groupID];
    id v28 = [v4 originalGroupID];
    [(IMDChatRegistry *)v27 existingChatsWithGroupID:v26];
    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v35;
      do
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v35 != v7) {
            objc_enumerationMutation(obj);
          }
          id v9 = *(id *)(*((void *)&v34 + 1) + 8 * i);
          id v10 = [v9 serviceName];
          int v11 = [v10 isEqualToString:v5];
          if (v9 == v4) {
            int v12 = 0;
          }
          else {
            int v12 = v11;
          }

          if (v12)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)int buf = 138412290;
                id v40 = v4;
                _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Found groupd_id fork for chat while applying changes from cloudKit %@", buf, 0xCu);
              }
            }
            if (IMOSLoggingEnabled())
            {
              BOOL v14 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)int buf = 138412290;
                id v40 = v9;
                _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Marking fork as clean %@", buf, 0xCu);
              }
            }
            [v9 updateCloudKitSyncState:1];
          }
        }
        uint64_t v6 = [obj countByEnumeratingWithState:&v34 objects:v41 count:16];
      }
      while (v6);
    }

    long long v32 = 0u;
    long long v33 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v15 = [(IMDChatRegistry *)v27 allChats];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v31;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v31 != v17) {
            objc_enumerationMutation(v15);
          }
          id v19 = *(id *)(*((void *)&v30 + 1) + 8 * j);
          if ([v19 style] == 43)
          {
            long long v20 = [v19 originalGroupID];
            if ([v20 isEqualToString:v28])
            {
              long long v21 = [v19 serviceName];
              int v22 = [v21 isEqualToString:v5];
              if (v19 == v4) {
                int v23 = 0;
              }
              else {
                int v23 = v22;
              }

              if (v23)
              {
                if (IMOSLoggingEnabled())
                {
                  int v24 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)int buf = 138412290;
                    id v40 = v4;
                    _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Found original_groupd_id fork for chat while applying changes from cloudKit %@", buf, 0xCu);
                  }
                }
                if (IMOSLoggingEnabled())
                {
                  __int16 v25 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)int buf = 138412290;
                    id v40 = v19;
                    _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Marking fork as clean %@", buf, 0xCu);
                  }
                }
                [v19 updateCloudKitSyncState:1];
              }
            }
            else
            {
            }
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
      }
      while (v16);
    }
  }
}

- (void)_updateChat:(id)a3 usingSyncData:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [v6 guid];
      int v10 = 138412290;
      int v11 = v9;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Chat already exists: %@ to apply changes from CKRecord", (uint8_t *)&v10, 0xCu);
    }
  }
  [v6 applyChangesUsingSyncData:v7];
  [(IMDChatRegistry *)self _markForksAsSyncedForChat:v6];
}

- (void)updateChatUsingSyncData:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 stringForKey:@"guid"];
  id v6 = [(IMDChatRegistry *)self _existingChatForSyncData:v4 originalGUID:v5];
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412546;
        int v10 = v5;
        __int16 v11 = 2112;
        id v12 = v4;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Updating existing chat %@ with record %@", (uint8_t *)&v9, 0x16u);
      }
    }
    [(IMDChatRegistry *)self _updateChat:v6 usingSyncData:v4];
  }
  else if ([(IMDChatRegistry *)self _ensureNoExistingGroupForSyncData:v4])
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412546;
        int v10 = v5;
        __int16 v11 = 2112;
        id v12 = v4;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Creating new chat %@ with record %@", (uint8_t *)&v9, 0x16u);
      }
    }
    [(IMDChatRegistry *)self _insertChatUsingSyncData:v4];
  }
}

- (void)resolveChatConflictUsingSyncData:(id)a3 localGUID:(id)a4
{
  id v6 = a3;
  id v7 = [(IMDChatRegistry *)self existingChatWithGUID:a4];
  [(IMDChatRegistry *)self _updateChat:v7 usingSyncData:v6];
}

- (void)updateCachedChatsSyncStatusTo:(int64_t)a3 forGUIDs:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = [(IMDChatRegistry *)self _cachedChatWithGUID:*(void *)(*((void *)&v13 + 1) + 8 * v10)];
        id v12 = v11;
        if (v11) {
          [v11 setCloudKitSyncState:a3];
        }

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
}

- (void)markChatAsDeferredForSyncingUsingSyncData:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDChatRegistry *)self _existingChatForSyncData:v4 originalGUID:0];
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        uint64_t v8 = v5;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Marking existing chat %@ as deferred", (uint8_t *)&v7, 0xCu);
      }
    }
    [v5 updateCloudKitSyncState:2];
    [v5 updateServerChangeToken:0];
    [v5 updateCloudKitRecordID:0];
    [(IMDChatRegistry *)self _markForksAsSyncedForChat:v5];
  }
}

- (void)markDeferredChatsAsNeedingSync
{
  objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", *MEMORY[0x1E4F6CD18], 2);
  id v4 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [(IMDChatRegistry *)self chatStore];
  [v3 enumerateBatchedChatsFilteredUsingPredicate:v4 block:&unk_1F33916A0];
}

- (void)__addChatToGroupIDChatIndex:(id)a3
{
  id v4 = a3;
  chatsByGroupID = self->_chatsByGroupID;
  id v10 = v4;
  id v6 = [v4 groupID];
  int v7 = [(NSMutableDictionary *)chatsByGroupID objectForKey:v6];

  if (!v7)
  {
    int v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:1];
    uint64_t v8 = self->_chatsByGroupID;
    uint64_t v9 = [v10 groupID];
    [(NSMutableDictionary *)v8 setObject:v7 forKey:v9];
  }
  [v7 addObject:v10];
}

- (void)__removeChatFromGroupIDChatIndex:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 groupID];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    chatsByGroupID = self->_chatsByGroupID;
    uint64_t v8 = [v4 groupID];
    uint64_t v9 = [(NSMutableDictionary *)chatsByGroupID objectForKey:v8];

    [v9 removeObject:v4];
    if (![v9 count])
    {
      id v10 = self->_chatsByGroupID;
      __int16 v11 = [v4 groupID];
      [(NSMutableDictionary *)v10 removeObjectForKey:v11];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v4;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Trying to remove chat with nil groupID: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (id)messagesToUploadToCloudKitWithLimit:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = +[IMDMessageStore sharedInstance];
  id v5 = (void *)[v4 messagesThatNeedSyncWithCloudKitWithFilter:0 limit:a3];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = v5;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    do
    {
      uint64_t v10 = 0;
      do
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        __int16 v11 = *(void **)(*((void *)&v17 + 1) + 8 * v10);
        id v12 = +[IMDMessageStore sharedInstance];
        int v13 = [v11 guid];
        id v14 = [v12 chatForMessageGUID:v13 enableVerboseLogging:0];

        uint64_t v15 = [v14 cloudKitChatID];
        [v11 setParentChatID:v15];

        ++v10;
      }
      while (v8 != v10);
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v8);
  }

  return v6;
}

- (id)messagesPendingUpdateT1ToCloudKitWithLimit:(unint64_t)a3
{
  id v4 = +[IMDMessageStore sharedInstance];
  id v5 = (void *)[v4 messagesPendingUpdateT1ToCloudKitWithLimit:a3];

  return v5;
}

- (id)messagesPendingUpdateT2ToCloudKitWithLimit:(unint64_t)a3
{
  id v4 = +[IMDMessageStore sharedInstance];
  id v5 = (void *)[v4 messagesPendingUpdateT2ToCloudKitWithLimit:a3];

  return v5;
}

- (id)_lookupChatUsingParentChatID:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [(IMDChatRegistry *)self existingChatWithGUID:v6];
  if (!v8)
  {
    uint64_t v8 = [(IMDChatRegistry *)self _uncachedNewestChatWithOriginalGroupID:v6 onService:v7];
    if (!v8)
    {
      uint64_t v8 = [(IMDChatRegistry *)self _newestExistingChatWithGroupID:v6 onService:v7];
    }
  }

  return v8;
}

- (id)_itemFromCKRecord:(id)a3
{
  return (id)MEMORY[0x1F4181798](MEMORY[0x1E4F6E7F0], sel_createItemWithCKRecord_);
}

- (id)_parentChatIDFromCKRecord:(id)a3
{
  return (id)[a3 _stringForKey:@"chatID"];
}

- (void)_addItemToParentChatIfNotLocationItem:(id)a3 parentChat:(id)a4 updatedLastMessageCount:(unint64_t)a5
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    [(id)objc_opt_class() addLocationShareItemToMatchingChats:v8];
  }
  else if (v9)
  {
    [(IMDChatRegistry *)self addItem:v8 toChat:v9];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (a5) {
        [(IMDChatRegistry *)self updateLastMessageForChat:v9 hintMessage:v8 historyQuery:0];
      }
      else {
        [(IMDChatRegistry *)self updateLastMessageForChat:v9 hintMessage:v8];
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = [v8 guid];
      int v12 = 138412290;
      int v13 = v11;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "No chat record found when adding message item %@, this may NOT be visible to the user!", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_setSortIDOnIncomingMessage:(id)a3 forChat:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMSharedHelperSortUsingReplyToGUIDAlgorithm())
  {
    id v7 = objc_alloc_init(IMDMessageSortOrderAssigner);
    [(IMDMessageSortOrderAssigner *)v7 assignSortIDToIncomingMessage:v5 onChat:v6];
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        id v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "sortID"));
        id v10 = [v5 guid];
        __int16 v11 = [v6 guid];
        int v12 = 138412802;
        int v13 = v9;
        __int16 v14 = 2112;
        id v15 = v10;
        __int16 v16 = 2112;
        long long v17 = v11;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Setting sort id %@ for message %@ on chat %@ synced from CloudKit", (uint8_t *)&v12, 0x20u);
      }
    }
  }
}

- (void)processMessageUsingCKRecord:(id)a3
{
}

- (BOOL)_existingItemRequiresUpgrade:(id)a3 itemFromCKRecord:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v8 = [v7 messageSyncP2Enabled];

  if (v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v9 = v5;
    }
    else {
      id v9 = 0;
    }
    id v10 = v9;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      __int16 v11 = v6;
    }
    else {
      __int16 v11 = 0;
    }
    id v12 = v11;
    int v13 = v12;
    if (v10) {
      BOOL v14 = v12 == 0;
    }
    else {
      BOOL v14 = 1;
    }
    if (v14)
    {
      BOOL v15 = 0;
    }
    else
    {
      uint64_t v16 = [v10 threadIdentifier];
      long long v17 = (void *)v16;
      if (v16)
      {
        uint64_t v18 = [v13 threadIdentifier];
        BOOL v15 = v18 == 0;
      }
      else
      {
        BOOL v15 = 0;
      }
    }
  }
  else
  {
    BOOL v15 = 0;
  }

  return v15;
}

- (void)_adoptUpdatedStateForExistingItem:(id)a3 itemFromCKRecord:(id)a4
{
  id v16 = a3;
  id v5 = a4;
  id v6 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v7 = [v6 messageSyncP2Enabled];

  if (v7)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int v8 = v16;
    }
    else {
      int v8 = 0;
    }
    id v9 = v8;
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      id v10 = v5;
    }
    else {
      id v10 = 0;
    }
    id v11 = v10;
    id v12 = v11;
    if (v9) {
      BOOL v13 = v11 == 0;
    }
    else {
      BOOL v13 = 1;
    }
    if (!v13)
    {
      BOOL v14 = [v9 threadIdentifier];

      if (!v14)
      {
        BOOL v15 = [v12 threadIdentifier];
        [v9 setThreadIdentifier:v15];
      }
    }
  }
}

- (void)processMessageUsingCKRecord:(id)a3 updatedLastMessageCount:(int)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = (void *)MEMORY[0x1E016A370]();
  id v8 = [(IMDChatRegistry *)self _itemFromCKRecord:v6];
  if ([v8 isCompatibleWithMiC])
  {
    id v9 = [(IMDChatRegistry *)self _sharedMessageStore];
    id v10 = [v8 guid];
    int v11 = [v9 hasStoredMessageWithGUID:v10];

    id v12 = [(IMDChatRegistry *)self _parentChatIDFromCKRecord:v6];
    BOOL v13 = [v6 _stringForKey:@"svc"];
    BOOL v14 = [(IMDChatRegistry *)self _lookupChatUsingParentChatID:v12 service:v13];

    if (v11)
    {
      BOOL v15 = [(IMDChatRegistry *)self _sharedMessageStore];
      id v16 = [v8 guid];
      long long v17 = [v15 itemWithGUID:v16];

      uint64_t v18 = [(IMDChatRegistry *)self _existingItemRequiresUpgrade:v17 itemFromCKRecord:v8] ^ 1;
      [(IMDChatRegistry *)self _adoptUpdatedStateForExistingItem:v17 itemFromCKRecord:v8];
      [v17 setCloudKitSyncState:v18];
      long long v19 = [v6 recordID];
      long long v20 = [v19 recordName];
      [v17 setCloudKitRecordID:v20];

      uint64_t v21 = [v6 recordChangeTag];
      [v17 setCloudKitRecordChangeTag:v21];

      [v17 setCloudKitServerChangeTokenBlob:0];
      objc_opt_class();
      LOBYTE(v21) = objc_opt_isKindOfClass();
      uint64_t v22 = [(IMDChatRegistry *)self _sharedMessageStore];
      int v23 = v22;
      if (v21)
      {
        LOBYTE(v49) = 0;
        id v24 = (id)[v22 storeMessage:v17 forceReplace:0 modifyError:0 modifyFlags:0 flagMask:0x2000 updateMessageCache:0 calculateUnreadCount:v49];
      }
      else
      {
        id v33 = (id)[v22 storeItem:v17 forceReplace:0];
      }

LABEL_38:
      goto LABEL_39;
    }
    if (![v8 shouldStoreMessage]) {
      goto LABEL_19;
    }
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && v14)
    {
      id v28 = v8;
      uint64_t v29 = +[IMDBackwardCompatibilityMessageIdentifier sharedIdentifier];
      if ([v29 isIgnorableBackwardCompatibilityMessage:v28 inChat:v14])
      {
        if (IMOSLoggingEnabled())
        {
          long long v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            long long v31 = [v28 guid];
            *(_DWORD *)int buf = 138412290;
            id v53 = v31;
            _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Message %@ is an ignorable backward compatibility message, ignoring.", buf, 0xCu);
          }
        }

LABEL_19:
        int v32 = 0;
LABEL_32:
        if (IMOSLoggingEnabled())
        {
          uint64_t v44 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            id v45 = [v8 guid];
            uint64_t v46 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v8, "cloudKitSyncState"));
            NSUInteger v47 = (void *)v46;
            long long v48 = @"NO";
            *(_DWORD *)int buf = 138412802;
            id v53 = v45;
            __int16 v54 = 2112;
            if (v32) {
              long long v48 = @"YES";
            }
            uint64_t v55 = v46;
            __int16 v56 = 2112;
            long long v57 = v48;
            _os_log_impl(&dword_1D967A000, v44, OS_LOG_TYPE_INFO, "Updated msg %@ to have CKSyncState %@ stored message: %@", buf, 0x20u);
          }
        }
        goto LABEL_38;
      }
    }
    [(IMDChatRegistry *)self _setSortIDOnIncomingMessage:v8 forChat:v14];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      objc_msgSend(v8, "setFlags:", objc_msgSend(v8, "flags") | 0x2000);
      long long v34 = [(IMDChatRegistry *)self _sharedMessageStore];
      LOBYTE(v49) = 0;
      id v35 = (id)[v34 storeMessage:v8 forceReplace:0 modifyError:0 modifyFlags:0 flagMask:0x2000 updateMessageCache:0 calculateUnreadCount:v49];

      long long v36 = [v8 guid];
      v50[0] = MEMORY[0x1E4F143A8];
      v50[1] = 3221225472;
      v50[2] = sub_1D97A9664;
      v50[3] = &unk_1E6B764E0;
      id v51 = v36;
      id v37 = v36;
      [v8 enumerateAttachmentGUIDsWithBlock:v50];
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v38 = v8;
        id v39 = [v38 timeRead];

        if (!v39)
        {
          id v40 = [MEMORY[0x1E4F1C9C8] now];
          [v38 setTimeRead:v40];
        }
        BOOL v41 = [(IMDChatRegistry *)self _sharedMessageStore];
        id v42 = (id)[v41 storeItem:v38 forceReplace:0];
      }
      else
      {
        id v38 = [(IMDChatRegistry *)self _sharedMessageStore];
        id v43 = (id)[v38 storeItem:v8 forceReplace:0];
      }
    }
    [(IMDChatRegistry *)self _addItemToParentChatIfNotLocationItem:v8 parentChat:v14 updatedLastMessageCount:a4];
    int v32 = 1;
    goto LABEL_32;
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v53 = v8;
      _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Found item that is incompatible with the current device version: %@", buf, 0xCu);
    }
  }
  uint64_t v26 = [v8 guid];
  __int16 v27 = [v8 cloudKitRecordID];
  IMDMessageRecordAddGUIDAndCKRecordIDToDeleteFromCloudKit();

  id v12 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v12 postNotificationName:@"__kCKRecordIMMessageIncompatibleDeleteNotification" object:0];
LABEL_39:
}

- (BOOL)handleMessageUpdate:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 _stringForKey:@"ut"];
  id v6 = [v4 _dataForKey:@"up"];
  if ([v5 isEqualToString:@"UT1"])
  {
    int v7 = [MEMORY[0x1E4F6E7F0] protobufForUpdateT1:v6];
    id v8 = [v7 msgid];
    id v9 = [v7 threadGuid];
    id v10 = [v7 threadPart];
    ThreadIdentifierWithComponents = (void *)IMMessageCreateThreadIdentifierWithComponents();
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138413058;
        id v42 = v8;
        __int16 v43 = 2112;
        uint64_t v44 = ThreadIdentifierWithComponents;
        __int16 v45 = 2112;
        uint64_t v46 = v9;
        __int16 v47 = 2112;
        long long v48 = v10;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "UpdateSyncT1 relating msgID %@ to thread %@ (threadGuid %@ threadPart %@)", buf, 0x2Au);
      }
    }
    if (!v7 || ![v8 length] || !objc_msgSend(ThreadIdentifierWithComponents, "length"))
    {
      if (IMOSLoggingEnabled())
      {
        long long v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412290;
          id v42 = v7;
          _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_INFO, "Ignoring update message T1: no message ID or thread ID %@", buf, 0xCu);
        }
      }
      goto LABEL_56;
    }
    BOOL v13 = +[IMDMessageStore sharedInstance];
    id v40 = [v13 itemWithGUID:v8];

    if (v40)
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        id v39 = v40;
        BOOL v14 = [v39 threadIdentifier];
        BOOL v15 = [v14 length] == 0;

        if (v15)
        {
          [v39 setThreadIdentifier:ThreadIdentifierWithComponents];
        }
        else
        {
          id v16 = [v39 threadIdentifier];
          char v17 = [ThreadIdentifierWithComponents isEqualToString:v16];

          if ((v17 & 1) == 0 && IMOSLoggingEnabled())
          {
            uint64_t v18 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              long long v19 = [v39 threadIdentifier];
              *(_DWORD *)int buf = 138412546;
              id v42 = v19;
              __int16 v43 = 2112;
              uint64_t v44 = ThreadIdentifierWithComponents;
              _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "ThreadIdentifier update rejected, thread identifier already populated as %@, update would be %@", buf, 0x16u);
            }
          }
        }
        if ([v39 cloudKitSyncState] == 8) {
          [v39 setCloudKitSyncState:1];
        }
        id v33 = +[IMDMessageStore sharedInstance];
        LOBYTE(v38) = 0;
        id v34 = (id)[v33 storeMessage:v39 forceReplace:0 modifyError:0 modifyFlags:0 flagMask:0x2000 updateMessageCache:0 calculateUnreadCount:v38];

        goto LABEL_45;
      }
      if (IMOSLoggingEnabled())
      {
        int v32 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int buf = 0;
          _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Update record for non-message type, ignoring", buf, 2u);
        }
LABEL_36:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      int v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        id v42 = v8;
        _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Ignoring update T1 message: message not found for id %@ (it may have been deleted)", buf, 0xCu);
      }
      goto LABEL_36;
    }
LABEL_45:

LABEL_56:
LABEL_57:
    BOOL v31 = 1;
    goto LABEL_58;
  }
  if ([v5 isEqualToString:@"UT2"])
  {
    long long v20 = [MEMORY[0x1E4F6E7F0] protobufForUpdateT2:v6];
    uint64_t v21 = [v20 msgid];
    uint64_t v22 = [v20 sr];
    if (v20 && [v21 length]) {
      [(IMDChatRegistry *)self updateSyncedSyndicationRanges:v22 forGUID:v21];
    }

    goto LABEL_57;
  }
  if ([v5 isEqualToString:@"UT3"])
  {
    int v23 = [MEMORY[0x1E4F6E7F0] protobufForUpdateT3:v6];
    id v24 = [v23 msgid];
    __int16 v25 = [v23 chatid];
    if (v23 && [v24 length] && objc_msgSend(v25, "length"))
    {
      uint64_t v26 = +[IMDMessageStore sharedInstance];
      __int16 v27 = [v26 itemWithGUID:v24];

      if (v27)
      {
        +[IMDaemonCoreBridgeImpl addItem:v27 toParentChatID:v25 updatedLastMessageCount:-1];
        [v27 setCloudKitSyncState:1];
        id v28 = +[IMDMessageStore sharedInstance];
        id v29 = (id)[v28 storeItem:v27 forceReplace:0];
      }
      else if (IMOSLoggingEnabled())
      {
        id v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412290;
          id v42 = v24;
          _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "Ignoring update T3 message: message not found for guid %@ (it may have been deleted)", buf, 0xCu);
        }
      }
    }

    goto LABEL_57;
  }
  if (IMOSLoggingEnabled())
  {
    long long v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      id v42 = v5;
      _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Ignoring message update %@, unrecognized update type", buf, 0xCu);
    }
  }
  BOOL v31 = 0;
LABEL_58:

  return v31;
}

- (void)handleMessageUpdateConflictType:(id)a3 serverRecord:(id)a4 localRowID:(int64_t)a5
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if ([v8 isEqualToString:@"UT1"])
  {
    if (a5) {
      goto LABEL_8;
    }
  }
  else if ([v8 isEqualToString:@"UT2"])
  {
    [(IMDChatRegistry *)self handleMessageUpdate:v9];
  }
  else if ([v8 isEqualToString:@"UT3"])
  {
    if (a5)
    {
LABEL_8:
      id v10 = +[IMDMessageStore sharedInstance];
      [v10 markMessageAsCleanWithROWID:a5];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      id v13 = v8;
      __int16 v14 = 2048;
      int64_t v15 = a5;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Failed to handle conflict for unknown update type %@, rowID %lu", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (BOOL)updateSyncedSyndicationRanges:(id)a3 forGUID:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IMDChatRegistry *)self _sharedMessageStore];
  id v9 = [v8 itemWithGUID:v7];

  if (!v9)
  {
    if (IMOSLoggingEnabled())
    {
      long long v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        id v28 = v7;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Can't apply updated syndication ranges for %@, message not found!", buf, 0xCu);
      }
      goto LABEL_16;
    }
LABEL_17:
    BOOL v20 = 0;
    goto LABEL_25;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      long long v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412546;
        id v28 = v7;
        __int16 v29 = 2112;
        long long v30 = v9;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Can't apply updated syndication ranges for %@, invalid message type for item %@", buf, 0x16u);
      }
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  id v10 = v9;
  int v11 = [MEMORY[0x1E4F6E880] rangesFromSerializedString:v6];
  uint64_t v26 = [MEMORY[0x1E4F6E880] maxStartDateForRanges:v11];
  int v12 = (void *)MEMORY[0x1E4F6E880];
  id v13 = [(__CFString *)v10 syndicationRanges];
  __int16 v14 = [v12 maxStartDateForRanges:v13];

  int64_t v15 = [(__CFString *)v10 syndicationRanges];
  if (!v15) {
    goto LABEL_19;
  }
  uint64_t v16 = [(__CFString *)v10 syndicationRanges];
  if (![v16 count] || !v14 || !v26)
  {

    goto LABEL_19;
  }
  uint64_t v17 = [v14 compare:v26];

  if (v17 == -1)
  {
LABEL_19:
    [(__CFString *)v10 setSyndicationRanges:v11];
    uint64_t v18 = @"YES";
    goto LABEL_20;
  }
  uint64_t v18 = @"NO";
LABEL_20:
  [(__CFString *)v10 setSyncedSyndicationRanges:v11];
  uint64_t v21 = [(IMDChatRegistry *)self _sharedMessageStore];
  LOWORD(v25) = 256;
  id v22 = (id)objc_msgSend(v21, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:", v10, 0, 0, 0, 0, 0, v25);

  if (IMOSLoggingEnabled())
  {
    int v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412546;
      id v28 = v7;
      __int16 v29 = 2112;
      long long v30 = v18;
      _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Applied updated syndicationRanges to %@, was newer data? %@)", buf, 0x16u);
    }
  }
  BOOL v20 = 1;
LABEL_25:

  return v20;
}

- (id)copyRecordIDsAndGUIDsPendingCloudKitDelete
{
  return (id)IMDChatCopyChatRecordIDsAndGUIDsToDeleteWithLimit();
}

- (void)clearPendingDeleteTable
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v3 = 0;
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "Clearing pending chat delete table", v3, 2u);
    }
  }
  IMDChatClearPendingDeleteChatsTable();
}

- (BOOL)doneLoadingAfterMerge
{
  return self->_doneLoadingAfterMerge;
}

- (BOOL)isBeingSetup
{
  return self->_isLoading;
}

- (id)_existingiMessageChatForChatIdentifier:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  [(IMDChatRegistry *)self allExistingChatsWithIdentifier:v6 style:v4];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    id v10 = (void *)MEMORY[0x1E4F6E1B0];
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v7);
        }
        int v12 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        id v13 = objc_msgSend(v12, "serviceName", (void)v22);
        int v14 = [v13 isEqualToString:*v10];

        if (v14)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v18 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              id v19 = [v12 guid];
              BOOL v20 = [NSNumber numberWithUnsignedChar:v4];
              *(_DWORD *)int buf = 138412802;
              id v27 = v19;
              __int16 v28 = 2112;
              id v29 = v6;
              __int16 v30 = 2112;
              uint64_t v31 = v20;
              _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Found iMessage chat %@ for chatID %@ style %@", buf, 0x20u);
            }
          }
          id v17 = v12;

          goto LABEL_19;
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v22 objects:v32 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    int64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = [NSNumber numberWithUnsignedChar:v4];
      *(_DWORD *)int buf = 138412546;
      id v27 = v6;
      __int16 v28 = 2112;
      id v29 = v16;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Did not find iMessage chat for ID %@ and style %@", buf, 0x16u);
    }
  }
  id v17 = 0;
LABEL_19:

  return v17;
}

- (void)simulateMessageReceive:(id)a3 serviceName:(id)a4 groupID:(id)a5 handles:(id)a6 sender:(id)a7 date:(id)a8 associatedMessageType:(int64_t)a9 associatedMessageGuid:(id)a10
{
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v65 = a3;
  id v16 = a4;
  id v67 = a5;
  id v17 = a6;
  id v66 = a7;
  id v68 = a8;
  id v18 = a10;
  v70 = v17;
  v69 = v16;
  if ([v17 count] && objc_msgSend(v16, "length"))
  {
    id v19 = +[IMDAccountController sharedInstance];
    char v64 = [v19 anySessionForServiceName:v16];

    if (!v64)
    {
      if (IMOSLoggingEnabled())
      {
        long long v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412290;
          id v83 = v16;
          _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "No session for serviceName %@ -- can't simulate receive", buf, 0xCu);
        }
      }
      goto LABEL_53;
    }
    __int16 v61 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v65];
    if (a9 <= 0)
    {
      id v26 = objc_alloc(MEMORY[0x1E4F6E850]);
      id v27 = v68;
      uint64_t v21 = v68;
      if (!v68)
      {
        uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
        id v27 = 0;
      }
      BOOL v28 = v27 == 0;
      id v29 = [NSString stringGUID];
      __int16 v63 = (void *)[v26 initWithSender:v66 time:v21 body:v61 attributes:0 fileTransferGUIDs:0 flags:1 error:0 guid:v29 threadIdentifier:0];

      if (!v28) {
        goto LABEL_24;
      }
    }
    else
    {
      id v20 = objc_alloc(MEMORY[0x1E4F6E5E0]);
      uint64_t v21 = v68;
      if (!v68)
      {
        uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
      }
      uint64_t v22 = [NSString stringGUID];
      long long v23 = (void *)v22;
      if (v18)
      {
        __int16 v63 = objc_msgSend(v20, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:", v66, v21, v61, 0, 0, 1, 0, v22, v18, a9, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
      }
      else
      {
        __int16 v30 = [NSString stringGUID];
        __int16 v63 = objc_msgSend(v20, "initWithSender:time:body:attributes:fileTransferGUIDs:flags:error:guid:associatedMessageGUID:associatedMessageType:associatedMessageRange:messageSummaryInfo:threadIdentifier:", v66, v21, v61, 0, 0, 1, 0, v23, v30, a9, 0, 0x7FFFFFFFFFFFFFFFLL, 0, 0);
      }
      if (v68) {
        goto LABEL_24;
      }
    }

LABEL_24:
    if ((unint64_t)[v17 count] <= 1) {
      int v31 = 45;
    }
    else {
      int v31 = 43;
    }
    unsigned int v62 = v31;
    uint64_t v60 = [v64 service];
    int v32 = [(IMDChatRegistry *)self existingChatsForIDs:v17 onService:v60 style:v62];
    uint64_t v33 = [(IMDChatRegistry *)self existingChatsWithGroupID:v67];
    id v59 = [v32 arrayByAddingObjectsFromArray:v33];

    if ([v59 count])
    {
      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v34 = v59;
      id v35 = 0;
      uint64_t v36 = [v34 countByEnumeratingWithState:&v76 objects:v81 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v77;
        do
        {
          for (uint64_t i = 0; i != v36; ++i)
          {
            if (*(void *)v77 != v37) {
              objc_enumerationMutation(v34);
            }
            id v39 = *(void **)(*((void *)&v76 + 1) + 8 * i);
            if ([v39 lastMessageTimeStampOnLoad])
            {
              id v40 = v39;

              id v35 = v40;
            }
          }
          uint64_t v36 = [v34 countByEnumeratingWithState:&v76 objects:v81 count:16];
        }
        while (v36);
      }

      BOOL v41 = [v35 chatIdentifier];
    }
    else
    {
      id v35 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      if ((unint64_t)[v17 count] < 2)
      {
        id v51 = (void *)MEMORY[0x1E4F1C9E8];
        id v52 = [NSNumber numberWithInt:2];
        id v53 = objc_msgSend(v51, "dictionaryWithObjectsAndKeys:", v52, *MEMORY[0x1E4F6C458], 0, *MEMORY[0x1E4F6C5C8], 0);

        [v35 addObject:v53];
        BOOL v41 = [v17 firstObject];
      }
      else
      {
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        id obj = v17;
        uint64_t v42 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
        if (v42)
        {
          uint64_t v43 = *(void *)v73;
          uint64_t v44 = *MEMORY[0x1E4F6C458];
          uint64_t v45 = *MEMORY[0x1E4F6C5C8];
          do
          {
            for (uint64_t j = 0; j != v42; ++j)
            {
              if (*(void *)v73 != v43) {
                objc_enumerationMutation(obj);
              }
              uint64_t v47 = *(void *)(*((void *)&v72 + 1) + 8 * j);
              long long v48 = (void *)MEMORY[0x1E4F1C9E8];
              uint64_t v49 = [NSNumber numberWithInt:2];
              long long v50 = objc_msgSend(v48, "dictionaryWithObjectsAndKeys:", v49, v44, v47, v45, 0);

              [v35 addObject:v50];
            }
            uint64_t v42 = [obj countByEnumeratingWithState:&v72 objects:v80 count:16];
          }
          while (v42);
        }

        BOOL v41 = [NSString generatedRoomNameForGroupChat];
      }
      id v54 = v67;
      uint64_t v55 = v67;
      if (!v67)
      {
        uint64_t v55 = [NSString stringGUID];
        id v54 = 0;
      }
      BOOL v56 = v54 == 0;
      long long v57 = [v64 account];
      LOBYTE(v58) = 0;
      [v64 didJoinChat:v41 style:v62 displayName:0 groupID:v55 handleInfo:v35 account:v57 isBlackholed:v58];

      if (v56) {
    }
      }

    [v63 setRoomName:v41];
    [v64 didReceiveMessage:v63 forChat:v41 style:v62 fromIDSID:0];

LABEL_53:
    goto LABEL_54;
  }
  if (IMOSLoggingEnabled())
  {
    long long v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412546;
      id v83 = v17;
      __int16 v84 = 2112;
      id v85 = v16;
      _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "No handles or servicename to receive a message from: {handles: %@ serviceName: %@}", buf, 0x16u);
    }
  }
LABEL_54:
}

- (void)invalidatePersonCentricGroupedChatsCache
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Invalidating person centric grouped chats cache", v5, 2u);
    }
  }
  uint64_t v4 = [(IMDChatRegistry *)self personCentricGroupedChatsCache];
  [v4 removeAllObjects];
}

- (BOOL)_contactsBasedMergingEnabled
{
  if (qword_1EBE2C070[0] != -1) {
    dispatch_once(qword_1EBE2C070, &unk_1F33916C0);
  }
  return byte_1EBE2C181;
}

- (void)_updateCachedAliasToCNIDMap:(id)a3 withHistoryToken:(id)a4 completionHandler:(id)a5
{
}

- (id)_aliasToCNIDMapForAliases:(id)a3
{
  id v4 = a3;
  if (IMIsRunningInUnitTesting())
  {
    id v5 = 0;
  }
  else
  {
    id v6 = IMDCNRecordIDAndHistoryTokenForAliases();
    id v7 = [v6 objectForKey:*MEMORY[0x1E4F6BF98]];
    [(IMDChatRegistry *)self setHistoryToken:v7];
    id v5 = [v6 objectForKey:*MEMORY[0x1E4F6BF90]];
  }

  return v5;
}

- (void)setHistoryToken:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    historyToken = self->_historyToken;
    p_historyToken = &self->_historyToken;
    if (![(NSData *)historyToken isEqualToData:v5])
    {
      objc_storeStrong((id *)p_historyToken, a3);
      if (IMOSLoggingEnabled())
      {
        uint64_t v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v9) = 0;
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "ContactStore history token updated.", (uint8_t *)&v9, 2u);
        }
LABEL_10:
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      uint64_t v10 = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Not updating the ContactStore history token with %@", (uint8_t *)&v9, 0xCu);
    }
    goto LABEL_10;
  }
}

- (void)_updateCurrentAliasToCNIDDictionaryAndHistoryTokenWithCompletionHandler:(id)a3
{
  id v4 = a3;
  id v6 = [(IMDChatRegistry *)self aliasToCNIDMap];
  id v5 = (void *)[(NSData *)self->_historyToken copy];
  [(IMDChatRegistry *)self _updateCachedAliasToCNIDMap:v6 withHistoryToken:v5 completionHandler:v4];
}

- (id)_generateCurrentAliasToCNIDDictionary
{
  [(NSRecursiveLock *)self->_handlesLock lock];
  id v3 = [(IMDChatRegistry *)self idToHandlesMap];
  id v4 = [v3 allKeys];
  id v5 = (void *)[v4 copy];

  [(NSRecursiveLock *)self->_handlesLock unlock];
  id v6 = [(IMDChatRegistry *)self _aliasToCNIDMapForAliases:v5];
  id v7 = (void *)[v6 mutableCopy];

  return v7;
}

- (void)_populateContactIDOnHandles
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  p_handlesLock = &self->_handlesLock;
  [(NSRecursiveLock *)self->_handlesLock lock];
  id v4 = [(IMDChatRegistry *)self idToHandlesMap];
  id v5 = [v4 allKeys];
  long long v24 = (void *)[v5 copy];

  [(NSRecursiveLock *)*p_handlesLock unlock];
  id v6 = [(IMDChatRegistry *)self _generateCurrentAliasToCNIDDictionary];
  uint64_t v7 = [v6 mutableCopy];

  long long v23 = (void *)v7;
  [(IMDChatRegistry *)self setCachedAliasToCNIDMap:v7];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "All handles and CachedAliasToCNIDMap", buf, 2u);
    }
  }
  [MEMORY[0x1E4F6E6D8] logHandleIDs:v24 checkAdditionalLoggingEnabled:1];
  int v9 = (void *)MEMORY[0x1E4F6E6D8];
  uint64_t v10 = [(IMDChatRegistry *)self cachedAliasToCNIDMap];
  [v9 logDictionary:v10];

  [(NSRecursiveLock *)self->_handlesLock lock];
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v11 = [(IMDChatRegistry *)self cachedAliasToCNIDMap];
  id obj = [v11 allKeys];

  uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v31;
    uint64_t v14 = *MEMORY[0x1E4F6BEF8];
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v31 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void *)(*((void *)&v30 + 1) + 8 * v15);
        id v17 = [(IMDChatRegistry *)self cachedAliasToCNIDMap];
        id v18 = [v17 objectForKey:v16];

        if ([v18 isEqualToString:v14])
        {

          id v18 = 0;
        }
        id v19 = [(NSMutableDictionary *)self->_idToHandlesMap objectForKey:v16];
        long long v28 = 0u;
        long long v29 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v35 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v27;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v27 != v21) {
                objc_enumerationMutation(v19);
              }
              [*(id *)(*((void *)&v26 + 1) + 8 * v22++) setCNContactID:v18];
            }
            while (v20 != v22);
            uint64_t v20 = [v19 countByEnumeratingWithState:&v26 objects:v35 count:16];
          }
          while (v20);
        }

        ++v15;
      }
      while (v15 != v12);
      uint64_t v12 = [obj countByEnumeratingWithState:&v30 objects:v36 count:16];
    }
    while (v12);
  }

  [(NSRecursiveLock *)self->_handlesLock unlock];
}

- (void)_updateCachedCNIDMapForHandles:(id)a3
{
  id v4 = [(IMDChatRegistry *)self _aliasToCNIDMapForAliases:a3];
  [(NSMutableDictionary *)self->_cachedAliasToCNIDMap addEntriesFromDictionary:v4];
}

- (id)_cnIDForHandle:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(NSMutableDictionary *)self->_cachedAliasToCNIDMap objectForKeyedSubscript:v4];
  if (!v5)
  {
    v9[0] = v4;
    id v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    [(IMDChatRegistry *)self _updateCachedCNIDMapForHandles:v6];

    id v5 = [(NSMutableDictionary *)self->_cachedAliasToCNIDMap objectForKeyedSubscript:v4];
  }
  if ([v5 isEqualToString:*MEMORY[0x1E4F6BEF8]]) {
    id v7 = 0;
  }
  else {
    id v7 = v5;
  }

  return v7;
}

- (id)_extractHandlesFromMap:(id)a3 usingCNID:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  [v6 removeObject:*MEMORY[0x1E4F6BEF8]];
  id v7 = objc_opt_new();
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v8 = v5;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v8, "objectForKeyedSubscript:", v13, (void)v17);
        if ([v6 containsObject:v14])
        {
          uint64_t v15 = [v7 objectForKeyedSubscript:v14];
          if (!v15)
          {
            uint64_t v15 = objc_opt_new();
            [v7 setObject:v15 forKeyedSubscript:v14];
          }
          [v15 addObject:v13];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v10);
  }

  return v7;
}

- (id)_handlesWithChangedContactsOriginalMap:(id)a3 newMap:(id)a4
{
  long long v24 = self;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v8 = [v6 allKeys];
  uint64_t v9 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v8);
        }
        uint64_t v13 = *(void *)(*((void *)&v30 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend(v6, "objectForKeyedSubscript:", v13, v24);
        uint64_t v15 = [v5 objectForKeyedSubscript:v13];
        if (([v14 isEqualToIgnoringCase:v15] & 1) == 0)
        {
          [v7 addObject:v13];
          [v25 addObject:v14];
          if (v15) {
            [v25 addObject:v15];
          }
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v30 objects:v35 count:16];
    }
    while (v10);
  }

  [v25 removeObject:*MEMORY[0x1E4F6BEF8]];
  uint64_t v16 = [(IMDChatRegistry *)v24 _extractHandlesFromMap:v6 usingCNID:v25];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v17 = [v16 allKeys];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v27;
    do
    {
      for (uint64_t j = 0; j != v19; ++j)
      {
        if (*(void *)v27 != v20) {
          objc_enumerationMutation(v17);
        }
        uint64_t v22 = objc_msgSend(v16, "objectForKeyedSubscript:", *(void *)(*((void *)&v26 + 1) + 8 * j), v24);
        [v7 addObjectsFromArray:v22];
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v26 objects:v34 count:16];
    }
    while (v19);
  }

  return v7;
}

- (id)_potentialGUIDsForIdentifier:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = +[IMDChatRegistry supportedServiceNames];
  id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v4;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v9) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend(NSString, "stringWithFormat:", @"%@;-;%@",
          *(void *)(*((void *)&v13 + 1) + 8 * i),
          v3,
        uint64_t v11 = (void)v13);
        [v5 addObject:v11];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }

  return v5;
}

- (id)existingOneOnOneChatsWithIdentifiers:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_opt_new();
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = v4;
  uint64_t v6 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v24;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v24 != v8) {
          objc_enumerationMutation(obj);
        }
        uint64_t v10 = *(void *)(*((void *)&v23 + 1) + 8 * i);
        long long v19 = 0u;
        long long v20 = 0u;
        long long v21 = 0u;
        long long v22 = 0u;
        uint64_t v11 = [(IMDChatRegistry *)self _potentialGUIDsForIdentifier:v10];
        uint64_t v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
        if (v12)
        {
          uint64_t v13 = v12;
          uint64_t v14 = *(void *)v20;
          do
          {
            for (uint64_t j = 0; j != v13; ++j)
            {
              if (*(void *)v20 != v14) {
                objc_enumerationMutation(v11);
              }
              long long v16 = [(IMDChatRegistry *)self existingChatWithGUID:*(void *)(*((void *)&v19 + 1) + 8 * j)];
              if (v16) {
                [v5 addObject:v16];
              }
            }
            uint64_t v13 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          }
          while (v13);
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    }
    while (v7);
  }

  return v5;
}

- (id)existingGroupChatsContainingHandles:(id)a3
{
  uint64_t v109 = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  id v4 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v55 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  long long v101 = 0u;
  id v5 = [(IMDChatRegistry *)self allChats];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v98 objects:v108 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v99;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v99 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v98 + 1) + 8 * i);
        if ([v10 style] == 43)
        {
          uint64_t v11 = [v10 displayName];
          uint64_t v12 = [v11 length];

          if (v12)
          {
            uint64_t v13 = [v10 displayName];
            uint64_t v14 = [v13 length];

            long long v15 = v55;
            if (v14) {
              BOOL v16 = v55 == 0;
            }
            else {
              BOOL v16 = 1;
            }
            if (!v16 && v10 != 0)
            {
LABEL_19:
              CFArrayAppendValue(v15, v10);
              continue;
            }
          }
          else if (v4)
          {
            long long v15 = v4;
            if (v10) {
              goto LABEL_19;
            }
          }
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v98 objects:v108 count:16];
    }
    while (v7);
  }

  uint64_t v18 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v94 = 0u;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  id obj = v4;
  uint64_t v60 = [(__CFArray *)obj countByEnumeratingWithState:&v94 objects:v107 count:16];
  if (v60)
  {
    uint64_t v58 = *(void *)v95;
    do
    {
      uint64_t v19 = 0;
      do
      {
        if (*(void *)v95 != v58) {
          objc_enumerationMutation(obj);
        }
        uint64_t v62 = v19;
        long long v20 = *(void **)(*((void *)&v94 + 1) + 8 * v19);
        long long v90 = 0u;
        long long v91 = 0u;
        long long v92 = 0u;
        long long v93 = 0u;
        id v70 = v64;
        uint64_t v21 = [v70 countByEnumeratingWithState:&v90 objects:v106 count:16];
        if (v21)
        {
          uint64_t v22 = v21;
          LOBYTE(v23) = 0;
          uint64_t v24 = *(void *)v91;
          uint64_t v66 = *(void *)v91;
          do
          {
            uint64_t v25 = 0;
            uint64_t v68 = v22;
            do
            {
              if (*(void *)v91 != v24) {
                objc_enumerationMutation(v70);
              }
              if (v23)
              {
                LOBYTE(v23) = 1;
              }
              else
              {
                uint64_t v72 = v25;
                uint64_t v26 = *(void *)(*((void *)&v90 + 1) + 8 * v25);
                long long v88 = 0u;
                long long v89 = 0u;
                long long v86 = 0u;
                long long v87 = 0u;
                long long v27 = [v20 participants];
                uint64_t v28 = [v27 countByEnumeratingWithState:&v86 objects:v105 count:16];
                if (v28)
                {
                  uint64_t v29 = v28;
                  int v23 = 0;
                  uint64_t v30 = *(void *)v87;
                  do
                  {
                    for (uint64_t j = 0; j != v29; ++j)
                    {
                      if (*(void *)v87 != v30) {
                        objc_enumerationMutation(v27);
                      }
                      long long v32 = [*(id *)(*((void *)&v86 + 1) + 8 * j) ID];
                      int v33 = [v32 isEqualToIgnoringCase:v26];

                      int v34 = v33 ^ 1 | v23;
                      v23 |= v34 ^ 1;
                      if ((v34 & 1) == 0 && v18 && v20)
                      {
                        CFArrayAppendValue(v18, v20);
                        int v23 = 1;
                      }
                    }
                    uint64_t v29 = [v27 countByEnumeratingWithState:&v86 objects:v105 count:16];
                  }
                  while (v29);
                }
                else
                {
                  LOBYTE(v23) = 0;
                }

                uint64_t v24 = v66;
                uint64_t v22 = v68;
                uint64_t v25 = v72;
              }
              ++v25;
            }
            while (v25 != v22);
            uint64_t v22 = [v70 countByEnumeratingWithState:&v90 objects:v106 count:16];
          }
          while (v22);
        }

        uint64_t v19 = v62 + 1;
      }
      while (v62 + 1 != v60);
      uint64_t v60 = [(__CFArray *)obj countByEnumeratingWithState:&v94 objects:v107 count:16];
    }
    while (v60);
  }

  id v35 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v82 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  long long v85 = 0u;
  BOOL v56 = v55;
  uint64_t v61 = [(__CFArray *)v56 countByEnumeratingWithState:&v82 objects:v104 count:16];
  if (v61)
  {
    uint64_t v59 = *(void *)v83;
    id v65 = v18;
    do
    {
      uint64_t v36 = 0;
      do
      {
        if (*(void *)v83 != v59) {
          objc_enumerationMutation(v56);
        }
        uint64_t v63 = v36;
        uint64_t v37 = *(void **)(*((void *)&v82 + 1) + 8 * v36);
        long long v78 = 0u;
        long long v79 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        id v71 = v64;
        uint64_t v38 = [v71 countByEnumeratingWithState:&v78 objects:v103 count:16];
        if (v38)
        {
          uint64_t v39 = v38;
          LOBYTE(v40) = 0;
          uint64_t v41 = *(void *)v79;
          uint64_t v67 = *(void *)v79;
          do
          {
            uint64_t v42 = 0;
            uint64_t v69 = v39;
            do
            {
              if (*(void *)v79 != v41) {
                objc_enumerationMutation(v71);
              }
              if (v40)
              {
                LOBYTE(v40) = 1;
              }
              else
              {
                uint64_t v73 = v42;
                uint64_t v43 = *(void *)(*((void *)&v78 + 1) + 8 * v42);
                long long v76 = 0u;
                long long v77 = 0u;
                long long v74 = 0u;
                long long v75 = 0u;
                uint64_t v44 = [v37 participants];
                uint64_t v45 = [v44 countByEnumeratingWithState:&v74 objects:v102 count:16];
                if (v45)
                {
                  uint64_t v46 = v45;
                  int v40 = 0;
                  uint64_t v47 = *(void *)v75;
                  do
                  {
                    for (uint64_t k = 0; k != v46; ++k)
                    {
                      if (*(void *)v75 != v47) {
                        objc_enumerationMutation(v44);
                      }
                      uint64_t v49 = [*(id *)(*((void *)&v74 + 1) + 8 * k) ID];
                      int v50 = [v49 isEqualToIgnoringCase:v43];

                      int v51 = v50 ^ 1 | v40;
                      v40 |= v51 ^ 1;
                      if ((v51 & 1) == 0 && v35 && v37)
                      {
                        CFArrayAppendValue(v35, v37);
                        int v40 = 1;
                      }
                    }
                    uint64_t v46 = [v44 countByEnumeratingWithState:&v74 objects:v102 count:16];
                  }
                  while (v46);
                }
                else
                {
                  LOBYTE(v40) = 0;
                }

                uint64_t v18 = v65;
                uint64_t v41 = v67;
                uint64_t v39 = v69;
                uint64_t v42 = v73;
              }
              ++v42;
            }
            while (v42 != v39);
            uint64_t v39 = [v71 countByEnumeratingWithState:&v78 objects:v103 count:16];
          }
          while (v39);
        }

        uint64_t v36 = v63 + 1;
      }
      while (v63 + 1 != v61);
      uint64_t v61 = [(__CFArray *)v56 countByEnumeratingWithState:&v82 objects:v104 count:16];
    }
    while (v61);
  }

  id v52 = [MEMORY[0x1E4F1CA60] dictionary];
  id v53 = v52;
  if (v18) {
    [v52 setObject:v18 forKey:@"UnnamedGroupChats"];
  }
  if (v35) {
    [v53 setObject:v35 forKey:@"NamedGroupChats"];
  }

  return v53;
}

- (void)_contactsChanged:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = IMSharedHelperContactsBasedMergingEnabled();
  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Contacts changed notification %@ ", (uint8_t *)&v10, 0xCu);
      }
    }
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
    [(IMDChatRegistry *)self performSelector:sel__checkForContactChanges withObject:0 afterDelay:0.0];
    uint64_t v8 = +[IMDNicknameController sharedInstance];
    [v8 purgeUnknownSenderRecordInfoIfNeeded];
  }
  else if (v6)
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Contacts based merging is disabled.", (uint8_t *)&v10, 2u);
    }
  }
}

- (void)_checkForContactChanges
{
}

- (void)_chatGUIDsThatNeedRemergingWithCompletionHandler:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D97AC99C;
  v6[3] = &unk_1E6B76528;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  [(IMDChatRegistry *)self _updateCurrentAliasToCNIDDictionaryAndHistoryTokenWithCompletionHandler:v6];
}

- (void)_chatGUIDsThatNeedRemerging:(id *)a3 chatDictionaryArray:(id *)a4 aliasMap:(id)a5
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v48 = a5;
  uint64_t v55 = self;
  int v6 = [(IMDChatRegistry *)self cachedAliasToCNIDMap];
  uint64_t v49 = [(IMDChatRegistry *)v55 _handlesWithChangedContactsOriginalMap:v6 newMap:v48];

  if ([v49 count])
  {
    uint64_t v47 = [MEMORY[0x1E4F1CA48] array];
    id v7 = [v49 allObjects];
    uint64_t v8 = [(IMDChatRegistry *)v55 existingOneOnOneChatsWithIdentifiers:v7];
    [v47 addObjectsFromArray:v8];

    uint64_t v9 = [v49 allObjects];
    int v10 = [(IMDChatRegistry *)v55 existingGroupChatsContainingHandles:v9];
    id v11 = [v10 objectForKey:@"UnnamedGroupChats"];
    [v47 addObjectsFromArray:v11];

    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v13 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v47, "count"));
        *(_DWORD *)int buf = 138412290;
        uint64_t v73 = v13;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "# chats that need update after contacts changed notification %@", buf, 0xCu);
      }
    }
    uint64_t v46 = (void *)[v48 mutableCopy];
    [(IMDChatRegistry *)v55 setCachedAliasToCNIDMap:v46];
    int v50 = [(IMDChatRegistry *)v55 blackholedChats];
    id v57 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v70 = 0u;
    long long v71 = 0u;
    long long v68 = 0u;
    long long v69 = 0u;
    id obj = v49;
    uint64_t v53 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
    if (v53)
    {
      uint64_t v52 = *(void *)v69;
      uint64_t v59 = *MEMORY[0x1E4F6BEF8];
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v69 != v52)
          {
            uint64_t v15 = v14;
            objc_enumerationMutation(obj);
            uint64_t v14 = v15;
          }
          uint64_t v54 = v14;
          BOOL v16 = *(void **)(*((void *)&v68 + 1) + 8 * v14);
          long long v17 = [(IMDChatRegistry *)v55 idToHandlesMap];
          uint64_t v18 = [v17 objectForKeyedSubscript:v16];

          uint64_t v19 = [(IMDChatRegistry *)v55 cachedAliasToCNIDMap];
          long long v20 = [v19 objectForKeyedSubscript:v16];

          long long v66 = 0u;
          long long v67 = 0u;
          long long v64 = 0u;
          long long v65 = 0u;
          id v58 = v18;
          uint64_t v21 = [v58 countByEnumeratingWithState:&v64 objects:v77 count:16];
          if (v21)
          {
            uint64_t v22 = *(void *)v65;
            do
            {
              for (uint64_t i = 0; i != v21; ++i)
              {
                if (*(void *)v65 != v22) {
                  objc_enumerationMutation(v58);
                }
                uint64_t v24 = *(void **)(*((void *)&v64 + 1) + 8 * i);
                if ([v20 isEqualToString:v59])
                {
                  if (IMOSLoggingEnabled())
                  {
                    uint64_t v25 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                    {
                      uint64_t v26 = [v24 ID];
                      *(_DWORD *)int buf = 138412290;
                      uint64_t v73 = v26;
                      _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "No CNContact for alias %@", buf, 0xCu);
                    }
                  }

                  if (IMOSLoggingEnabled())
                  {
                    long long v27 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)int buf = 138412290;
                      uint64_t v73 = v16;
                      _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Clean up nickname for alias %@", buf, 0xCu);
                    }
                  }
                  if (v16) {
                    [v57 addObject:v16];
                  }
                  long long v20 = 0;
                }
                [v24 setCNContactID:v20];
              }
              uint64_t v21 = [v58 countByEnumeratingWithState:&v64 objects:v77 count:16];
            }
            while (v21);
          }

          if (([v20 isEqualToString:v59] & 1) == 0)
          {
            long long v62 = 0u;
            long long v63 = 0u;
            long long v60 = 0u;
            long long v61 = 0u;
            id v56 = v50;
            uint64_t v28 = [v56 countByEnumeratingWithState:&v60 objects:v76 count:16];
            if (v28)
            {
              uint64_t v29 = *(void *)v61;
              do
              {
                for (uint64_t j = 0; j != v28; ++j)
                {
                  if (*(void *)v61 != v29) {
                    objc_enumerationMutation(v56);
                  }
                  long long v31 = *(void **)(*((void *)&v60 + 1) + 8 * j);
                  long long v32 = [v31 participants];
                  int v33 = objc_msgSend(v32, "__imArrayByApplyingBlock:", &unk_1F3391700);

                  if ([v33 containsObject:v16])
                  {
                    if (IMOSLoggingEnabled())
                    {
                      int v34 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                      {
                        id v35 = [v31 guid];
                        *(_DWORD *)int buf = 138412546;
                        uint64_t v73 = v16;
                        __int16 v74 = 2112;
                        long long v75 = v35;
                        _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "Hawking: New contact (%@) added, removing chat (%@) from blackhole.", buf, 0x16u);
                      }
                    }
                    [v31 updateIsBlackholed:0];
                    uint64_t v36 = [(IMDChatRegistry *)v55 _sharedMessageStore];
                    uint64_t v37 = [v31 lastMessage];
                    uint64_t v38 = [v37 guid];
                    [v36 markMessageGUIDUnread:v38];

                    uint64_t v39 = [v31 participants];
                    LODWORD(v36) = [v39 count] == 1;

                    int v40 = [MEMORY[0x1E4F6E890] sharedInstance];
                    uint64_t v41 = v40;
                    if (v36) {
                      uint64_t v42 = 24;
                    }
                    else {
                      uint64_t v42 = 25;
                    }
                    [v40 trackSpamEvent:v42];
                  }
                }
                uint64_t v28 = [v56 countByEnumeratingWithState:&v60 objects:v76 count:16];
              }
              while (v28);
            }
          }
          uint64_t v14 = v54 + 1;
        }
        while (v54 + 1 != v53);
        uint64_t v53 = [obj countByEnumeratingWithState:&v68 objects:v78 count:16];
      }
      while (v53);
    }

    uint64_t v43 = +[IMDNicknameController sharedInstance];
    [v43 cleanUpNicknameForIDs:v57];

    [(IMDChatRegistry *)v55 _serializeChatsForRemerge:v47 guidsThatNeedRemerging:a3 chatDictionaryArray:a4];
  }
}

- (void)_chatGUIDsThatNeedRemerging:(id *)a3 chatDictionaryArray:(id *)a4 oldPersonCentricID:(id)a5
{
  id v13 = a5;
  if ([v13 length])
  {
    uint64_t v8 = [(IMDChatRegistry *)self personCentricGroupedChatsCache];
    uint64_t v9 = [v8 valueForKey:v13];

    int v10 = [(IMDChatRegistry *)self personCentricGroupedChatsCache];
    [v10 removeObjectForKey:v13];

    if ([v9 count])
    {
      id v11 = [(IMDChatRegistry *)self groupChatsBasedOnIdentity:v9];
      uint64_t v12 = [(IMDChatRegistry *)self personCentricGroupedChatsCache];
      [v12 addEntriesFromDictionary:v11];

      [(IMDChatRegistry *)self _serializeChatsForRemerge:v9 guidsThatNeedRemerging:a3 chatDictionaryArray:a4];
    }
  }
}

- (void)_serializeChatsForRemerge:(id)a3 guidsThatNeedRemerging:(id *)a4 chatDictionaryArray:(id *)a5
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if ([v6 count])
  {
    if (a4)
    {
      id v18 = v6;
      *a4 = [MEMORY[0x1E4F1CA48] array];
      long long v21 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v7 = v6;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v22;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v22 != v9) {
              objc_enumerationMutation(v7);
            }
            id v11 = *(void **)(*((void *)&v21 + 1) + 8 * i);
            if (IMOSLoggingEnabled())
            {
              uint64_t v12 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
              {
                id v13 = [v11 guid];
                *(_DWORD *)int buf = 138412290;
                uint64_t v26 = v13;
                _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Chat %@ needs to be merged / un-merged & updated in spotlight", buf, 0xCu);
              }
            }
            id v14 = *a4;
            uint64_t v15 = [v11 guid];
            [v14 addObject:v15];
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v21 objects:v27 count:16];
        }
        while (v8);
      }

      id v6 = v18;
    }
    if (a5)
    {
      *a5 = [(IMDChatRegistry *)self personCentricGroupedChatsArrayWithMaximumNumberOfChats:0x7FFFFFFFFFFFFFFFLL skipsLastMessageLoading:0 usingChats:v6 useCachedChatGroups:0 includingPinnedChatIdentifiers:0 repairInconsistentMergedChats:0];
      if (IMOSLoggingEnabled())
      {
        BOOL v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          long long v17 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(*a5, "count"));
          *(_DWORD *)int buf = 138412290;
          uint64_t v26 = v17;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "No of entries in chat dictionary %@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)updateMeCardHasUpdatedForAllChats
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Update MeCard for all IMDChats", buf, 2u);
    }
  }
  long long v10 = 0u;
  long long v11 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  id v4 = [(IMDChatRegistry *)self allChats];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v8 + 1) + 8 * v7++) meCardHasUpdated];
      }
      while (v5 != v7);
      uint64_t v5 = [v4 countByEnumeratingWithState:&v8 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)moveMessagesWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F6BF48];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 database];
  [v8 moveMessageRecordsToRecoveryForMessageGUIDs:v7 deleteDate:v6];
}

- (void)moveMessagesInChatsWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4
{
  uint64_t v5 = (void *)MEMORY[0x1E4F6BF48];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v5 database];
  [v8 moveMessageRecordsToRecoveryForChatRecordsWithGUIDs:v7 deleteDate:v6];
}

- (void)recoverMessagesWithChatGUIDs:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6BF48];
  id v4 = a3;
  id v5 = [v3 database];
  [v5 recoverMessageRecordsForChatRecordsWithGUIDs:v4];
}

- (id)_bestServiceSessionForService:(id)a3 accountID:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    id v7 = +[IMDServiceController sharedController];
    id v8 = [v7 serviceWithName:v5];

    long long v9 = +[IMDAccountController sharedInstance];
    long long v10 = [v9 activeAccountsForService:v8];

    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v11 = v10;
    uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v12)
    {
      uint64_t v13 = v12;
      uint64_t v14 = *(void *)v23;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v11);
          }
          BOOL v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          long long v17 = objc_msgSend(v16, "session", (void)v22);

          if (v17)
          {
            if (!v6
              || ([v8 supportsOneSessionForAllAccounts] & 1) != 0
              || ([v16 accountID],
                  id v18 = objc_claimAutoreleasedReturnValue(),
                  char v19 = [v6 isEqualToString:v18],
                  v18,
                  (v19 & 1) != 0))
            {
              long long v20 = [v16 session];
              goto LABEL_17;
            }
          }
        }
        uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v26 count:16];
        long long v20 = 0;
        if (v13) {
          continue;
        }
        break;
      }
    }
    else
    {
      long long v20 = 0;
    }
LABEL_17:
  }
  else
  {
    long long v20 = 0;
  }

  return v20;
}

- (void)permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:(id)a3 completionHandler:(id)a4
{
  id v6 = a4;
  id v7 = (void *)MEMORY[0x1E4F6BF48];
  id v8 = a3;
  long long v9 = [v7 synchronousDatabase];
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D97ADB78;
  v11[3] = &unk_1E6B76550;
  v11[4] = self;
  id v12 = v6;
  id v10 = v6;
  [v9 permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:v8 completionHandler:v11];
}

- (id)recoverableMessagesMetadataPendingCloudKitSaveWithLimit:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
  id v5 = [v4 recoverableMessagesMetadataPendingCloudKitSaveWithLimit:a3 filter:3];

  return v5;
}

- (id)recoverableMessagesMetadataPendingCloudKitDeleteWithLimit:(unint64_t)a3
{
  id v4 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
  id v5 = [v4 recoverableMessagesMetadataPendingCloudKitDeleteWithLimit:a3];

  return v5;
}

- (void)clearRecoverableMessageTombStones
{
  id v2 = [MEMORY[0x1E4F6BF48] database];
  [v2 clearRecoverableMessageTombStones];
}

- (void)updateRecoverableMessageSyncState:(int64_t)a3 forMessageRowID:(int64_t)a4 onPartIndex:(int64_t)a5
{
  id v8 = [MEMORY[0x1E4F6BF48] database];
  [v8 updateRecoverableMessageSyncState:a3 forMessageRowID:a4 onPartIndex:a5];
}

- (void)_triggerRemergeForPersonCentricID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v11 = 0;
  id v12 = 0;
  [(IMDChatRegistry *)self _chatGUIDsThatNeedRemerging:&v12 chatDictionaryArray:&v11 oldPersonCentricID:v4];
  id v5 = v12;
  id v6 = v11;
  if ([v5 count])
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = [v5 count];
        *(_DWORD *)int buf = 67109378;
        int v14 = v8;
        __int16 v15 = 2112;
        id v16 = v4;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Broadcasting remerge for %d chats, invalidated personCentricID=%@", buf, 0x12u);
      }
    }
    long long v9 = +[IMDBroadcastController sharedProvider];
    id v10 = [v9 broadcasterForChatListeners];
    [v10 chatsNeedRemerging:v5 groupedChats:v6];
  }
}

- (unint64_t)persistedChatCount
{
  return self->_persistedChatCount;
}

- (NSMutableDictionary)idToHandlesMap
{
  return self->_idToHandlesMap;
}

- (void)setIdToHandlesMap:(id)a3
{
}

- (NSData)historyToken
{
  return self->_historyToken;
}

- (void)setCkUtilities:(id)a3
{
}

- (void)setChatStore:(id)a3
{
}

- (BOOL)hasDumpedLogsForNoExisitingGroup
{
  return self->_hasDumpedLogsForNoExisitingGroup;
}

- (void)setHasDumpedLogsForNoExisitingGroup:(BOOL)a3
{
  self->_hasDumpedLogsForNoExisitingGroup = a3;
}

- (IMDMessageProcessingController)messageProcessingController
{
  return self->_messageProcessingController;
}

- (IMDMessageHistorySyncController)messageHistorySyncController
{
  return self->_messageHistorySyncController;
}

- (void)setPersonCentricGroupedChatsCache:(id)a3
{
}

- (NSMutableDictionary)cachedAliasToCNIDMap
{
  return self->_cachedAliasToCNIDMap;
}

- (void)setCachedAliasToCNIDMap:(id)a3
{
}

- (NSMutableDictionary)pendingChatBotHandleToAlternateID
{
  return self->_pendingChatBotHandleToAlternateID;
}

- (void)setPendingChatBotHandleToAlternateID:(id)a3
{
}

- (TUConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationManager, 0);
  objc_storeStrong((id *)&self->_pendingChatBotHandleToAlternateID, 0);
  objc_storeStrong((id *)&self->_cachedAliasToCNIDMap, 0);
  objc_storeStrong((id *)&self->_personCentricGroupedChatsCache, 0);
  objc_storeStrong((id *)&self->_messageHistorySyncController, 0);
  objc_storeStrong((id *)&self->_messageProcessingController, 0);
  objc_storeStrong((id *)&self->_chatStore, 0);
  objc_storeStrong((id *)&self->_ckUtilities, 0);
  objc_storeStrong((id *)&self->_historyToken, 0);
  objc_storeStrong((id *)&self->_idToHandlesMap, 0);
  objc_storeStrong((id *)&self->_chats, 0);
  objc_storeStrong((id *)&self->_handlesLock, 0);
  objc_storeStrong((id *)&self->_chatsLock, 0);

  objc_storeStrong((id *)&self->_chatsByGroupID, 0);
}

- (id)_preferredFileTransferFromGroupPhotoGUIDs:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id obj = a3;
  id v3 = 0;
  uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v31;
    *(void *)&long long v5 = 138412290;
    long long v28 = v5;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v31 != v6) {
          objc_enumerationMutation(obj);
        }
        int v8 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        long long v9 = +[IMDAttachmentStore sharedInstance];
        id v10 = [v9 attachmentWithGUID:v8];

        int v11 = IMOSLoggingEnabled();
        if (v10)
        {
          if (v11)
          {
            id v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138412546;
              id v35 = v8;
              __int16 v36 = 2112;
              uint64_t v37 = v10;
              _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Have file transfer matching groupPhotoGuid: %@. FileTransfer: %@", buf, 0x16u);
            }
          }
          if (v3)
          {
            uint64_t v13 = [v10 createdDate];
            if (v13)
            {
              int v14 = [v3 createdDate];
              __int16 v15 = v14;
              if (!v14 || [v14 compare:v13] == -1)
              {
                if (IMOSLoggingEnabled())
                {
                  long long v20 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                  {
                    long long v21 = [v10 guid];
                    long long v22 = [v3 guid];
                    *(_DWORD *)int buf = 138412546;
                    id v35 = v21;
                    __int16 v36 = 2112;
                    uint64_t v37 = v22;
                    _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Preferring %@ over %@ because the creation date is newer.", buf, 0x16u);
                  }
                }
                id v23 = v10;

                id v3 = v23;
              }
              else if (IMOSLoggingEnabled())
              {
                id v16 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
                {
                  uint64_t v17 = [v10 guid];
                  id v18 = [v3 guid];
                  *(_DWORD *)int buf = 138412546;
                  id v35 = v17;
                  __int16 v36 = 2112;
                  uint64_t v37 = v18;
                  _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Not preferring %@ over %@ because the creation date is older.", buf, 0x16u);
                }
              }
            }
            else if (IMOSLoggingEnabled())
            {
              long long v24 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                long long v25 = [v10 guid];
                *(_DWORD *)int buf = v28;
                id v35 = v25;
                _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Not preferring %@ because it does not have a creation date", buf, 0xCu);
              }
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v26 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)int buf = v28;
                id v35 = v8;
                _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Accepting groupPhotoGuid %@ as the initial preferred group photo.", buf, 0xCu);
              }
            }
            id v3 = v10;
          }
        }
        else if (v11)
        {
          char v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int buf = v28;
            id v35 = v8;
            _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Could not find file transfer matching group photo guid: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v30 objects:v38 count:16];
    }
    while (v4);
  }

  return v3;
}

- (void)setUpInitialConversationManager
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Setting up conversation manager for imagent", buf, 2u);
    }
  }
  uint64_t v4 = [(IMDChatRegistry *)self conversationManager];
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  void v5[2] = sub_1D9870A28;
  v5[3] = &unk_1E6B73268;
  v5[4] = self;
  [v4 registerWithCompletionHandler:v5];
}

- (id)_activeTUConversations
{
  id v2 = [(IMDChatRegistry *)self conversationManager];
  id v3 = [v2 activeConversations];

  return v3;
}

- (void)updateFaceTimeGroupName:(id)a3
{
  id v9 = a3;
  uint64_t v4 = -[IMDChatRegistry _tuConversationForChat:](self, "_tuConversationForChat:");
  if (v4)
  {
    long long v5 = [(IMDChatRegistry *)self conversationManager];
    char v6 = objc_opt_respondsToSelector();

    if (v6)
    {
      id v7 = [(IMDChatRegistry *)self conversationManager];
      int v8 = [v9 displayName];
      [v7 updateMessagesGroupName:v8 onConversation:v4];
    }
  }
}

- (void)updateFaceTimeGroupPhoto:(id)a3
{
  uint64_t v4 = [(IMDChatRegistry *)self _tuConversationForChat:a3];
  if (v4)
  {
    id v8 = v4;
    long long v5 = [(IMDChatRegistry *)self conversationManager];
    char v6 = objc_opt_respondsToSelector();

    uint64_t v4 = v8;
    if (v6)
    {
      id v7 = [(IMDChatRegistry *)self conversationManager];
      [v7 conversationUpdateMessagesGroupPhoto:v8];

      uint64_t v4 = v8;
    }
  }
}

- (id)_oneToOneChatForRemoteHandle:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      long long v5 = NSNumber;
      char v6 = [(IMDChatRegistry *)self chats];
      id v7 = objc_msgSend(v5, "numberWithUnsignedInteger:", objc_msgSend(v6, "count"));
      *(_DWORD *)int buf = 138412290;
      long long v31 = v7;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Chats count: %@", buf, 0xCu);
    }
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v8 = [(IMDChatRegistry *)self chats];
  id v9 = (id)[v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (!v9) {
    goto LABEL_22;
  }
  uint64_t v11 = *(void *)v27;
  id v12 = (void *)MEMORY[0x1E4F6E1B0];
  *(void *)&long long v10 = 138412546;
  long long v24 = v10;
  while (2)
  {
    for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
    {
      if (*(void *)v27 != v11) {
        objc_enumerationMutation(v8);
      }
      int v14 = *(void **)(*((void *)&v26 + 1) + 8 * i);
      __int16 v15 = objc_msgSend(v14, "serviceName", v24);
      if ([v15 isEqualToString:*v12])
      {
        id v16 = [v14 participants];
        BOOL v17 = [v16 count] == 1;

        if (!v17) {
          continue;
        }
        id v18 = (void *)MEMORY[0x1E4FADBD8];
        char v19 = [v14 participants];
        long long v20 = [v19 firstObject];
        long long v21 = [v20 ID];
        __int16 v15 = [v18 normalizedHandleWithDestinationID:v21];

        if (IMOSLoggingEnabled())
        {
          long long v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int buf = v24;
            long long v31 = v15;
            __int16 v32 = 2112;
            id v33 = v25;
            _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "chat handle %@ vs conversation handle %@", buf, 0x16u);
          }
        }
        if (TUHandlesAreCanonicallyEqual())
        {
          id v9 = v14;

          goto LABEL_22;
        }
      }
    }
    id v9 = (id)[v8 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v9) {
      continue;
    }
    break;
  }
LABEL_22:

  return v9;
}

- (id)_chatForTUGroupID:(id)a3 participants:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(IMDChatRegistry *)self existingChatsWithGroupID:v6];
  uint64_t v25 = 0;
  long long v26 = &v25;
  uint64_t v27 = 0x3032000000;
  long long v28 = sub_1D9871584;
  long long v29 = sub_1D9871594;
  id v30 = 0;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1D987159C;
  v24[3] = &unk_1E6B76448;
  v24[4] = &v25;
  [v8 enumerateObjectsUsingBlock:v24];
  id v9 = [(id)v26[5] participants];
  if (v26[5] && (uint64_t v10 = [v7 count], v10 == objc_msgSend(v9, "count")))
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CA80];
    id v12 = objc_msgSend(v9, "__imArrayByApplyingBlock:", &unk_1F33923A0);
    uint64_t v13 = [v11 setWithArray:v12];

    int v14 = objc_msgSend(v7, "__imSetByApplyingBlock:", &unk_1F33923C0);
    [v13 minusSet:v14];
    if ([v13 count])
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412546;
          id v32 = v9;
          __int16 v33 = 2112;
          id v34 = v7;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "While groupID matched, Messages participants (%@) did not equal TUConversation remoteMembers (%@)", buf, 0x16u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        id v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412290;
          id v32 = v13;
          _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "different handles: (%@)", buf, 0xCu);
        }
      }
      BOOL v17 = (void *)v26[5];
      v26[5] = 0;
    }
    else if (IMOSLoggingEnabled())
    {
      char v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = [(id)v26[5] chatIdentifier];
        long long v21 = [(id)v26[5] groupID];
        *(_DWORD *)int buf = 138412802;
        id v32 = v20;
        __int16 v33 = 2112;
        id v34 = v6;
        __int16 v35 = 2112;
        __int16 v36 = v21;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "We mapped a chat %@ to a TUConversation with messagesGroupUUID %@ for chat groupID %@", buf, 0x20u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412546;
        id v32 = v9;
        __int16 v33 = 2112;
        id v34 = v7;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "While groupID matched, Messages participants (%@) count did not equal TUConversation remoteMembers (%@)", buf, 0x16u);
      }
    }
    uint64_t v13 = (void *)v26[5];
    v26[5] = 0;
  }

  id v22 = (id)v26[5];
  _Block_object_dispose(&v25, 8);

  return v22;
}

- (id)_chatForTUConversation:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v5 = [v4 messagesGroupUUID];

  if (v5)
  {
    id v6 = [v4 messagesGroupUUID];
    id v7 = [v6 UUIDString];
    id v8 = objc_msgSend(v4, "__im_filteredRemoteMembers");
    id v9 = [(IMDChatRegistry *)self _chatForTUGroupID:v7 participants:v8];

    goto LABEL_13;
  }
  uint64_t v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v11 = [v10 isAVLessSharePlayEnabled];

  if (!v11) {
    goto LABEL_12;
  }
  id v12 = [v4 remoteMembers];
  if ([v12 count] != 1)
  {

    goto LABEL_12;
  }
  uint64_t v13 = [v4 avMode];

  if (v13)
  {
LABEL_12:
    id v9 = 0;
    goto LABEL_13;
  }
  if (IMOSLoggingEnabled())
  {
    int v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Attempting to map 1x1 chat for conversation: %@", (uint8_t *)&v19, 0xCu);
    }
  }
  __int16 v15 = [v4 remoteMembers];
  id v16 = [v15 anyObject];
  BOOL v17 = [v16 handle];
  id v9 = [(IMDChatRegistry *)self _oneToOneChatForRemoteHandle:v17];

LABEL_13:

  return v9;
}

- (id)_tuConversationForChat:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v29 = 0;
  id v30 = &v29;
  uint64_t v31 = 0x3032000000;
  id v32 = sub_1D9871584;
  __int16 v33 = sub_1D9871594;
  id v34 = 0;
  long long v5 = [(IMDChatRegistry *)self _activeTUConversations];
  uint64_t v23 = MEMORY[0x1E4F143A8];
  uint64_t v24 = 3221225472;
  uint64_t v25 = sub_1D9871D34;
  long long v26 = &unk_1E6B784F8;
  id v6 = v4;
  id v27 = v6;
  long long v28 = &v29;
  [v5 enumerateObjectsUsingBlock:&v23];

  id v7 = objc_msgSend((id)v30[5], "remoteMembers", v23, v24, v25, v26);
  id v8 = [v6 participants];
  uint64_t v9 = [v7 count];
  if (v9 == [v8 count])
  {
    uint64_t v10 = (void *)MEMORY[0x1E4F1CA80];
    int v11 = objc_msgSend(v8, "__imArrayByApplyingBlock:", &unk_1F33923E0);
    id v12 = [v10 setWithArray:v11];

    uint64_t v13 = objc_msgSend(v7, "__imSetByApplyingBlock:", &unk_1F3392400);
    [v12 minusSet:v13];
    if ([v12 count])
    {
      if (IMOSLoggingEnabled())
      {
        int v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412546;
          id v36 = v8;
          __int16 v37 = 2112;
          uint64_t v38 = v7;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "While groupID matched, Messages participants (%@) did not equal TUConversation remoteMembers (%@)", buf, 0x16u);
        }
      }
      __int16 v15 = (void *)v30[5];
      v30[5] = 0;
    }
    else if (IMOSLoggingEnabled())
    {
      BOOL v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = [v6 chatIdentifier];
        int v19 = [(id)v30[5] messagesGroupUUID];
        id v20 = [v6 groupID];
        *(_DWORD *)int buf = 138412802;
        id v36 = v18;
        __int16 v37 = 2112;
        uint64_t v38 = v19;
        __int16 v39 = 2112;
        int v40 = v20;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "We mapped a chat %@ to a TUConversation with messagesGroupUUID %@ for chat groupID %@", buf, 0x20u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412546;
        id v36 = v8;
        __int16 v37 = 2112;
        uint64_t v38 = v7;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "While groupID matched, Messages participants (%@) count did not equal TUConversation remoteMembers (%@)", buf, 0x16u);
      }
    }
    id v12 = (void *)v30[5];
    v30[5] = 0;
  }

  id v21 = (id)v30[5];
  _Block_object_dispose(&v29, 8);

  return v21;
}

- (id)_initiatorForConversation:(id)a3 chat:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v5 isLocallyCreated])
  {
    id v7 = [v6 lastAddressedLocalHandle];
    if (!v7)
    {
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Not able to find lastAddressedLocalHandle, falling back to account's loginID", (uint8_t *)&v17, 2u);
        }
      }
      uint64_t v9 = [v6 account];
      uint64_t v10 = [v9 loginID];
      id v7 = [v10 _stripFZIDPrefix];
    }
  }
  else
  {
    if (objc_opt_respondsToSelector())
    {
      int v11 = [v5 performSelector:sel_initiator];
    }
    else
    {
      id v12 = [v5 remoteMembers];
      uint64_t v13 = [v12 anyObject];

      int v14 = [v13 handles];
      int v11 = [v14 anyObject];
    }
    id v7 = [v11 value];
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v7;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Conversation initiator handle value %@", (uint8_t *)&v17, 0xCu);
    }
  }

  return v7;
}

- (id)_conversationItemForChat:(id)a3 conversation:(id)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v32 = a4;
  id v7 = -[IMDChatRegistry _initiatorForConversation:chat:](self, "_initiatorForConversation:chat:");
  if (v7)
  {
    id v8 = [v32 UUID];
    uint64_t v31 = [v8 UUIDString];

    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412546;
        id v41 = v31;
        __int16 v42 = 2112;
        id v43 = v32;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "TUConversation UUID %@ for conversation %@", buf, 0x16u);
      }
    }
    id v10 = objc_alloc(MEMORY[0x1E4F6EA78]);
    uint64_t v38 = *MEMORY[0x1E4F6C5C8];
    __int16 v39 = v7;
    int v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v39 forKeys:&v38 count:1];
    id v12 = [v6 account];
    uint64_t v13 = [v12 loginID];
    int v14 = [v6 account];
    __int16 v15 = [v14 loginID];
    id v16 = [v6 serviceName];
    int v17 = [v6 roomName];
    id v18 = (void *)[v10 initWithSenderInfo:v11 time:0 guid:v31 messageID:0 account:v13 accountID:v15 service:v16 handle:v7 roomName:v17 unformattedID:0 countryCode:0 type:6];

    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v19 = [v6 participants];
    uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v34 != v21) {
            objc_enumerationMutation(v19);
          }
          uint64_t v23 = *(void **)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v24 = [v23 ID];
          int v25 = [v24 isEqualToString:v7];

          if (v25)
          {
            long long v26 = [v23 unformattedID];
            [v18 setUnformattedID:v26];

            id v27 = [v23 countryCode];
            [v18 setCountryCode:v27];
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v20);
    }

    long long v28 = [v6 lastAddressedLocalHandle];
    [v18 setDestinationCallerID:v28];

    if ([v32 isLocallyCreated]) {
      [v18 setFlags:4];
    }
    objc_msgSend(v18, "setAvMode:", objc_msgSend(v32, "avMode"));
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412546;
        id v41 = v6;
        __int16 v42 = 2112;
        id v43 = v32;
        _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Not creating IMTUConversationItem - likely a nil lastAddressedHandle on chat: %@ or nil handles in conversation: %@", buf, 0x16u);
      }
    }
    id v18 = 0;
  }

  return v18;
}

- (void)conversationManager:(id)a3 conversation:(id)a4 addedMembersLocally:(id)a5
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v35 = a3;
  id v7 = a4;
  id v8 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412546;
      id v40 = v7;
      __int16 v41 = 2112;
      id v42 = v8;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Callback for addedMembersLocally conversation: %@ member: %@", buf, 0x16u);
    }
  }
  id v10 = objc_msgSend(v7, "__im_filteredRemoteMembers", self);
  int v11 = (void *)[v10 mutableCopy];

  [v11 minusSet:v8];
  id v12 = objc_msgSend(v7, "__im_filteredRemoteMembers");
  uint64_t v13 = (void *)[v12 mutableCopy];

  [v13 minusSet:v11];
  BOOL v14 = [v13 count] == 0;
  int v15 = IMOSLoggingEnabled();
  if (!v14)
  {
    if (v15)
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        id v40 = v13;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Proceeding with addedMembers: %@", buf, 0xCu);
      }
    }
    int v17 = [v7 groupUUID];
    id v18 = [v17 UUIDString];
    uint64_t v19 = [v34 _chatForTUGroupID:v18 participants:v11];

    if (!v19)
    {
      if ([v11 count] != 1) {
        goto LABEL_13;
      }
      if ([v7 avMode]) {
        goto LABEL_13;
      }
      uint64_t v31 = [v11 anyObject];
      id v32 = [v31 handle];
      uint64_t v19 = [v34 _oneToOneChatForRemoteHandle:v32];

      if (!v19)
      {
LABEL_13:
        uint64_t v20 = IMLogHandleForCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
          sub_1D99058F8(v7, v20);
        }

        uint64_t v19 = 0;
      }
    }
    if ([v19 style] == 43)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412290;
          id v40 = v19;
          _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Found chat to potentially add members to: %@", buf, 0xCu);
        }
      }
      id v22 = +[IMDAccountController sharedInstance];
      uint64_t v23 = [v22 anySessionForServiceName:*MEMORY[0x1E4F6E1B0]];

      if (!v23)
      {
        long long v28 = IMLogHandleForCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
          sub_1D990583C(v28);
        }
        goto LABEL_36;
      }
      uint64_t v24 = objc_msgSend(v13, "__imSetByApplyingBlock:", &unk_1F3392420);
      int v25 = [v24 allObjects];

      if ([v25 count])
      {
        long long v26 = (void *)MEMORY[0x1E4F6E7B8];
        uint64_t v27 = *MEMORY[0x1E4F6AA78];
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = sub_1D9872B78;
        v36[3] = &unk_1E6B75F28;
        id v37 = v23;
        id v38 = v19;
        [v26 refreshIDStatusForDestinations:v25 service:v27 listenerID:@"IMDChatRegistry_CallManagement" queue:MEMORY[0x1E4F14428] completionBlock:v36];
      }
    }
    if ([v19 style] != 45)
    {
LABEL_37:

      goto LABEL_38;
    }
    long long v28 = [v34 _upgradeChatToGroupChat:v19 forConversation:v7];
    if (!v28)
    {
      uint64_t v29 = IMLogHandleForCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR)) {
        sub_1D9905880((uint64_t)v7, v29);
      }
    }
LABEL_36:

    goto LABEL_37;
  }
  if (v15)
  {
    id v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Not processing addedMembersLocally since, after filtering, we don't have anyone to add.", buf, 2u);
    }
  }
LABEL_38:
}

- (id)_upgradeChatToGroupChat:(id)a3 forConversation:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 style] == 45)
  {
    id v8 = +[IMDAccountController sharedInstance];
    uint64_t v9 = [v8 anySessionForServiceName:*MEMORY[0x1E4F6E1B0]];

    if (v9)
    {
      id v10 = [(IMDChatRegistry *)self _findExistingGroupChatForConversation:v7 onSession:v9];
      if (v10) {
        goto LABEL_9;
      }
      if (IMOSLoggingEnabled())
      {
        int v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int buf = 0;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Couldn't find chat, trying to create a new one!", buf, 2u);
        }
      }
      id v10 = [(IMDChatRegistry *)self _createGroupChatForConversation:v7 onSession:v9];
      if (v10)
      {
LABEL_9:
        id v12 = [v10 guid];
        uint64_t v13 = [v10 chatIdentifier];
        -[NSObject invitePersonInfo:withMessage:toChatID:identifier:style:](v9, "invitePersonInfo:withMessage:toChatID:identifier:style:", &unk_1F33C6048, 0, v12, v13, [v10 style]);

        BOOL v14 = [(IMDChatRegistry *)self conversationManager];
        LOBYTE(v13) = objc_opt_respondsToSelector();

        if ((v13 & 1) == 0) {
          goto LABEL_22;
        }
        if (IMOSLoggingEnabled())
        {
          int v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)uint64_t v19 = 0;
            _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Indicating to TU that we are now mapped to a messages group.", v19, 2u);
          }
        }
        id v16 = [(IMDChatRegistry *)self conversationManager];
        int v17 = [v7 UUID];
        [v16 registerMessagesGroupUUIDForConversationUUID:v17];

        goto LABEL_21;
      }
      id v16 = IMLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1D99059AC((uint64_t)v7, v16);
      }
    }
    else
    {
      id v16 = IMLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1D990583C(v16);
      }
    }
    id v10 = 0;
LABEL_21:

    goto LABEL_22;
  }
  uint64_t v9 = IMLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1D9905A24(v6, v9);
  }
  id v10 = 0;
LABEL_22:

  return v10;
}

- (id)_findExistingGroupChatForConversation:(id)a3 onSession:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_msgSend(v7, "__im_filteredRemoteMembers");
  uint64_t v9 = objc_msgSend(v8, "__imSetByApplyingBlock:", &unk_1F3392440);
  id v10 = [v9 allObjects];

  int v11 = [v10 firstObject];
  id v12 = [v7 initiator];
  uint64_t v13 = [v12 normalizedValue];
  BOOL v14 = [v7 groupUUID];

  int v15 = [v14 UUIDString];
  id v16 = [v6 service];

  int v17 = [v16 internalName];
  id v18 = [(IMDChatRegistry *)self bestCandidateGroupChatWithFromIdentifier:v11 toIdentifier:v13 displayName:0 participants:v10 groupID:v15 serviceName:v17];

  return v18;
}

- (id)_createGroupChatForConversation:(id)a3 onSession:(id)a4
{
  uint64_t v24 = self;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v27 = a3;
  id v26 = a4;
  id v5 = [v26 account];
  int v25 = [(IMDChatRegistry *)v24 generateUnusedChatIdentifierForGroupChatWithAccount:v5];

  long long v28 = [MEMORY[0x1E4F1CA48] array];
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  objc_msgSend(v27, "__im_filteredRemoteMembers");
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
  if (v6)
  {
    uint64_t v30 = *(void *)v32;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v32 != v30) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v31 + 1) + 8 * i);
        if (objc_msgSend(v8, "isLightweightMember", v24))
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v9 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138412290;
              long long v36 = v8;
              _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "This is a lightweight member - skipping: %@", buf, 0xCu);
            }
          }
        }
        else
        {
          id v10 = [IMDHandle alloc];
          int v11 = [v8 handle];
          id v12 = [v11 normalizedValue];
          uint64_t v13 = [v8 handle];
          BOOL v14 = [v13 value];
          int v15 = [v8 handle];
          id v16 = [v15 isoCountryCode];
          int v17 = [(IMDHandle *)v10 initWithID:v12 unformattedID:v14 countryCode:v16];
          id v18 = [(IMDHandle *)v17 handleInfo];

          [v28 addObject:v18];
        }
      }
      uint64_t v6 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    }
    while (v6);
  }

  uint64_t v19 = [v27 groupUUID];
  uint64_t v20 = [v19 UUIDString];
  [v26 didJoinChat:v25 style:43 displayName:0 groupID:v20 handleInfo:v28];

  uint64_t v21 = [v26 account];
  id v22 = [(IMDChatRegistry *)v24 existingChatWithIdentifier:v25 account:v21];

  return v22;
}

- (id)_messageStore
{
  return +[IMDMessageStore sharedInstance];
}

- (void)updateChatsUsingMessageGUIDsAndSummaries:(id)a3
{
  sub_1D968E084(0, &qword_1EA8C88D8);
  uint64_t v4 = sub_1D9906CD0();
  id v5 = self;
  sub_1D988411C(v4);

  swift_bridgeObjectRelease();
}

@end