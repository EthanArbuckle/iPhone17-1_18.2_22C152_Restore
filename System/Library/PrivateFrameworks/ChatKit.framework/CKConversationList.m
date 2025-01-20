@interface CKConversationList
+ (id)conversationListAlertSuppressionContextForFilterMode:(unint64_t)a3;
+ (id)sharedConversationList;
+ (void)_handleRegistryDidLoadNotification:(id)a3;
+ (void)initialize;
- (BOOL)_chatHasRelevantUnreadLastMessage:(id)a3;
- (BOOL)_isParentWithSubfoldersForFilterMode:(unint64_t)a3;
- (BOOL)_isUnreadChat:(id)a3 ignoringMessages:(id)a4;
- (BOOL)_messageSIMFilteringEnabled;
- (BOOL)_messageSpamFilteringEnabled;
- (BOOL)_messageUnknownFilteringEnabled;
- (BOOL)_shouldBailBeginTrackingForCurrentProcess;
- (BOOL)_shouldFilterForParticipants:(id)a3;
- (BOOL)_shouldShowInboxUI;
- (BOOL)_shouldTreatConversationAsNonSMSCategorized:(id)a3;
- (BOOL)conversation:(id)a3 includedInFilterMode:(unint64_t)a4;
- (BOOL)hasActiveConversations;
- (BOOL)isHoldingWasKnownSenderUpdates;
- (BOOL)loadedConversations;
- (BOOL)loadedPinnedConversations;
- (BOOL)loadingConversations;
- (BOOL)remergingConversations;
- (CKConversation)_beginTrackingConversationWithChat:(id *)a1;
- (CKConversation)pendingConversation;
- (CKConversationList)init;
- (CKConversationListScrollingController)scrollingController;
- (NSArray)conversations;
- (NSArray)pinnedConversations;
- (NSMutableArray)trackedConversations;
- (NSMutableDictionary)conversationsDictionary;
- (id)_alreadyTrackedConversationForChat:(id)a3;
- (id)_beginTrackingConversationWithChatIndirect:(id)a3;
- (id)_chatPredicateForFilterMode:(unint64_t)a3;
- (id)_conversationForChat:(id)a3;
- (id)_conversationSortComparator;
- (id)_copyEntitiesForAddressStrings:(id)a3;
- (id)_emptyConversationsDictionaryWithConversationsCount:(unint64_t)a3;
- (id)_filterConversations:(id)a3 byHandleID:(id)a4 simID:(id)a5;
- (id)_filterConversationsByFocus:(id)a3;
- (id)_filterConversationsWithoutiMessageJunk:(id)a3;
- (id)_nonPlaceholderConversations;
- (id)_recoverableSortComparator;
- (id)_testingTrackedConversations;
- (id)conversationForExistingChatWithChatIdentifier:(id)a3;
- (id)conversationForExistingChatWithDeviceIndependentID:(id)a3;
- (id)conversationForExistingChatWithGUID:(id)a3;
- (id)conversationForExistingChatWithGroupID:(id)a3;
- (id)conversationForExistingChatWithPersonCentricID:(id)a3;
- (id)conversationForExistingChatWithPinningIdentifier:(id)a3;
- (id)conversationForHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5 create:(BOOL)a6;
- (id)conversationForHandles:(id)a3 displayName:(id)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6 joinedChatsOnly:(BOOL)a7 findMatchingNamedGroups:(BOOL)a8 create:(BOOL)a9;
- (id)conversationsForExistingChatsWithGUIDs:(id)a3;
- (id)conversationsForFilterMode:(unint64_t)a3;
- (id)description;
- (id)firstUnreadFilteredConversationIgnoringMessages:(id)a3;
- (id)identifiersSetForConversations:(id)a3;
- (id)pendingConversationCreatingIfNecessary;
- (id)pinningIdentifierMap;
- (id)relevantUnreadLastMessages;
- (id)subclassifiedConversationsForFilterMode:(unint64_t)a3;
- (id)topMostConversation;
- (int64_t)simFilterIndex;
- (int64_t)unreadCountForFilterMode:(unint64_t)a3;
- (int64_t)unreadFilteredConversationCountIgnoringMessages:(id)a3;
- (unint64_t)_filterModeForConversationAsNonSMSCategorized:(id)a3;
- (unint64_t)primaryFilterModeForConversation:(id)a3;
- (void)_abChanged:(id)a3;
- (void)_abPartialChanged:(id)a3;
- (void)_beginTrackingAllExistingChatsIfNeeded;
- (void)_beginTrackingConversationWithChat:(id)a3 completion:(id)a4;
- (void)_chatItemsDidChange:(id)a3;
- (void)_chatPropertiesChanged:(id)a3;
- (void)_configureForOscarEnabledUnsortedConversationList;
- (void)_configureForUnsortedConversationList;
- (void)_deleteBrandLogosIfNeededForConversations:(id)a3;
- (void)_handleChatJoinStateDidChange:(id)a3;
- (void)_handleChatParticipantsDidChange:(id)a3;
- (void)_handleChatsDidRemergeNotification:(id)a3;
- (void)_handleChatsWillRemergeNotification:(id)a3;
- (void)_handleEngroupFinishedUpdating:(id)a3;
- (void)_handleGroupNameChanged:(id)a3;
- (void)_handleGroupPhotoChanged:(id)a3;
- (void)_handleMemoryWarning:(id)a3;
- (void)_handlePreferredServiceChangedNotification:(id)a3;
- (void)_handleRegistryDidRegisterChatNotification:(id)a3;
- (void)_handleRegistryWillUnregisterChatNotification:(id)a3;
- (void)_handleUpdatedMessagesWithSummariesNotification:(id)a3;
- (void)_insertConversationIntoSortedConversationList:(id)a3;
- (void)_invalidatePartialABCaches:(id)a3;
- (void)_postConversationListChangedNotification;
- (void)_postConversationListUpdateVisibleConversationsNotificationForUID:(id)a3;
- (void)_removeConversationsFromRecentlyDeleted:(id)a3;
- (void)_setConversations:(id)a3 forFilterMode:(unint64_t)a4;
- (void)_trackSendEventForMySenderID:(id)a3 andParticipants:(id)a4;
- (void)_updateConversationsForNewPinnedConversations:(id)a3;
- (void)_updatePinnedConversationsControllerForRemovedConversations:(id)a3;
- (void)beginTrackingConversation:(id)a3 forChat:(id)a4;
- (void)beginWasKnownSenderHold;
- (void)clearHoldInUnreadFilter;
- (void)deleteConversation:(id)a3;
- (void)deleteConversations:(id)a3;
- (void)logConversationsTopCount:(int64_t)a3 bottomCount:(int64_t)a4;
- (void)permanentlyDeleteRecoverableMessagesInConversations:(id)a3 synchronousQuery:(BOOL)a4 completionHandler:(id)a5;
- (void)postFinishedInitalPinLoadIfNecessary;
- (void)recoverDeletedMessagesInConversations:(id)a3 synchronousQuery:(BOOL)a4 completionHandler:(id)a5;
- (void)recoverJunkMessagesInConversations:(id)a3;
- (void)recoverableDeleteForConversations:(id)a3 deleteDate:(id)a4 synchronousQuery:(BOOL)a5 completionHandler:(id)a6;
- (void)releaseWasKnownSenderHold;
- (void)removeConversation:(id)a3;
- (void)resetCaches;
- (void)resort;
- (void)setConversationsDictionary:(id)a3;
- (void)setHoldingWasKnownSenderUpdates:(BOOL)a3;
- (void)setLoadedPinnedConversations:(BOOL)a3;
- (void)setNeedsReload;
- (void)setPendingConversation:(id)a3;
- (void)setPinnedConversations:(id)a3;
- (void)setRemergingConversations:(BOOL)a3;
- (void)setSimFilterIndex:(int64_t)a3;
- (void)setTrackedConversations:(id)a3;
- (void)stopTrackingConversation:(id)a3;
- (void)unpendConversation;
- (void)updateConversationFilteredFlagsAndReportSpam;
- (void)updateConversationListsAndSortIfEnabled;
- (void)updateConversationsForNewPinnedConversations:(id)a3;
- (void)updateConversationsWasKnownSender;
- (void)updateEarliestMessageDateForConversations:(id)a3;
- (void)updateFilteredByFocusStateForConversations:(id)a3;
- (void)updatePinnedConversationsFromDataSource;
- (void)updatePinnedConversationsFromDataSourceWithConversationFetch:(BOOL)a3;
- (void)updateRecoverableConversationList;
@end

@implementation CKConversationList

uint64_t __49__CKConversationList__conversationSortComparator__block_invoke(uint64_t a1, void *a2)
{
  return objc_msgSend(a2, "compareBySequenceNumberAndDateDescending:");
}

void __55__CKConversationList_updateRecoverableConversationList__block_invoke(uint64_t a1, void *a2)
{
  id v4 = a2;
  if ([v4 recoverableMessagesCount])
  {
    v3 = [*(id *)(a1 + 32) conversationForExistingChat:v4];
    [*(id *)(a1 + 40) addObject:v3];
  }
}

+ (id)sharedConversationList
{
  v2 = (void *)sharedConversationList_sSharedConversationList;
  if (!sharedConversationList_sSharedConversationList)
  {
    v3 = objc_alloc_init(CKConversationList);
    id v4 = (void *)sharedConversationList_sSharedConversationList;
    sharedConversationList_sSharedConversationList = (uint64_t)v3;

    v2 = (void *)sharedConversationList_sSharedConversationList;
  }

  return v2;
}

- (id)conversationForExistingChatWithGUID:(id)a3
{
  id v4 = a3;
  v5 = v4;
  if (v4 && [v4 length])
  {
    v6 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    v7 = [v6 existingChatWithGUID:v5];

    v8 = [(CKConversationList *)self _conversationForChat:v7];
  }
  else
  {
    v8 = 0;
  }

  return v8;
}

- (id)_conversationForChat:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    v5 = [(CKConversationList *)self _alreadyTrackedConversationForChat:v4];
    if (!v5)
    {
      v5 = -[CKConversationList _beginTrackingConversationWithChat:]((id *)&self->super.isa, v4);
    }
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (CKConversationListScrollingController)scrollingController
{
  scrollingController = self->_scrollingController;
  if (!scrollingController)
  {
    id v4 = [CKConversationListScrollingController alloc];
    v5 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    v6 = [(CKConversationListScrollingController *)v4 initWithConversationList:self chatRegistry:v5];
    v7 = self->_scrollingController;
    self->_scrollingController = v6;

    scrollingController = self->_scrollingController;
  }

  return scrollingController;
}

void __66__CKConversationList_updateConversationFilteredFlagsAndReportSpam__block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v2 = a2;
  v3 = [v2 chat];
  if ([v2 wasDetectedAsSpam])
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v4 = [v2 handles];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v17;
      while (2)
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v17 != v6) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v16 + 1) + 8 * i) isContact])
          {
            [v3 clearSMSCategory];
            goto LABEL_12;
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  if ([v3 isFiltered])
  {
    if ([v3 containsMessageFromContactOrMe]
      && [v3 isFiltered] <= 1
      && ![v2 wasDetectedAsSMSCategory])
    {
      if (IMOSLoggingEnabled())
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Chat has replies: Updating isFiltered to NO", v15, 2u);
        }
      }
      goto LABEL_38;
    }
    if ([v3 hasKnownParticipantsCache])
    {
      if (IMOSLoggingEnabled())
      {
        v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Chat has known participants: Updating isFiltered to NO", v15, 2u);
        }
      }
LABEL_38:
      [v3 updateIsFiltered:0];
      goto LABEL_40;
    }
    if ([v3 shouldBeAllowListed])
    {
      if (IMOSLoggingEnabled())
      {
        v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Allow listed iMessage: Updating isFiltered to NO", v15, 2u);
        }
      }
      goto LABEL_38;
    }
    v10 = [v3 account];
    v11 = [v10 service];
    v12 = [MEMORY[0x1E4F6BDC0] iMessageService];
    BOOL v13 = v11 == v12;

    if (v13)
    {
      if (([v3 supportsFilteringExtensions] & 1) == 0) {
        [v3 clearSMSCategory];
      }
      if (updateConversationFilteredFlagsAndReportSpam_sAlreadyMigrated) {
        [v3 autoReportSpam];
      }
      else {
        [v3 markAsAutoSpamReported];
      }
    }
  }
LABEL_40:
}

- (void)_beginTrackingAllExistingChatsIfNeeded
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 136315138;
      v22 = "-[CKConversationList _beginTrackingAllExistingChatsIfNeeded]";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    long long v16 = "-[CKConversationList _beginTrackingAllExistingChatsIfNeeded]";
    _CKLog();
  }
  if (CKIsRunningInPreferences()
    || CKIsRunningInNanoSettings()
    || CKIsRunningInMessagesOrSpringBoard()
    || IMIsRunningInMessagesComposeViewService())
  {
    self->_loadingConversations = 1;
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Attempting to register existing chats", buf, 2u);
      }
    }
    trackedConversations = self->_trackedConversations;
    self->_trackedConversations = 0;

    pinnedConversations = self->_pinnedConversations;
    self->_pinnedConversations = 0;

    id v7 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
    [v7 startTimingForKey:@"ChatTracking"];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    v8 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    v9 = [v8 cachedChats];

    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v18;
      do
      {
        uint64_t v12 = 0;
        do
        {
          if (*(void *)v18 != v11) {
            objc_enumerationMutation(v9);
          }
          id v13 = -[CKConversationList _beginTrackingConversationWithChat:]((id *)&self->super.isa, *(void **)(*((void *)&v17 + 1) + 8 * v12++));
        }
        while (v10 != v12);
        uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v25 count:16];
      }
      while (v10);
    }

    [v7 stopTimingForKey:@"ChatTracking"];
    if (IMOSLoggingEnabled())
    {
      v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 136315394;
        v22 = "-[CKConversationList _beginTrackingAllExistingChatsIfNeeded]";
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "%s %@", buf, 0x16u);
      }
    }
    *(_WORD *)&self->_loadingConversations = 256;
    if (objc_msgSend(MEMORY[0x1E4F6BD70], "processSupportsPinnedConversations", v16)) {
      [(CKConversationList *)self updatePinnedConversationsFromDataSource];
    }
    v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 postNotificationName:@"CKConversationListFinishedLoadingNotification" object:self userInfo:0];
  }
}

- (CKConversation)_beginTrackingConversationWithChat:(id *)a1
{
  id v3 = a2;
  if (a1)
  {
    if (CKIsRunningInPreferences()
      || CKIsRunningInNanoSettings()
      || CKIsRunningInMessages()
      || (IMIsRunningInMessagesComposeViewService() & 1) != 0
      || CKIsRunningInCarousel())
    {
      [v3 setNumberOfMessagesToKeepLoaded:50];
    }
    id v4 = [a1 _alreadyTrackedConversationForChat:v3];
    if (!v4) {
      id v4 = [[CKConversation alloc] initWithChat:v3];
    }
    if (([a1[6] containsObjectIdenticalTo:v4] & 1) == 0) {
      [a1 beginTrackingConversation:v4 forChat:v3];
    }
  }
  else
  {
    id v4 = 0;
  }

  return v4;
}

- (id)_alreadyTrackedConversationForChat:(id)a3
{
  return (id)[a3 contextInfo];
}

- (void)beginTrackingConversation:(id)a3 forChat:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(CKConversationList *)self _shouldBailBeginTrackingForCurrentProcess])
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v9 = [v7 guid];
        *(_DWORD *)buf = 138412802;
        long long v17 = v9;
        __int16 v18 = 2048;
        id v19 = v6;
        __int16 v20 = 2048;
        id v21 = v7;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "-beginTrackingConversation called with guid %@ conversation %p chat %p", buf, 0x20u);
      }
    }
    if (!self->_trackedConversations)
    {
      uint64_t v10 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      trackedConversations = self->_trackedConversations;
      self->_trackedConversations = v10;
    }
    if (v6)
    {
      [v7 setContextInfo:v6];
      if (IMIsOscarEnabled())
      {
        uint64_t v12 = [v6 chat];
        BOOL v13 = [v12 isFiltered] == 2;

        if (v13)
        {
          id v15 = v6;
          v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v15 count:1];
          [(CKConversationList *)self updateEarliestMessageDateForConversations:v14];
        }
      }
      [(CKConversationList *)self _insertConversationIntoSortedConversationList:v6];
    }
    [(CKConversationList *)self _postConversationListChangedNotification];
  }
}

- (BOOL)_shouldBailBeginTrackingForCurrentProcess
{
  return !CKIsRunningInPreferences()
      && !CKIsRunningInNanoSettings()
      && !CKIsRunningInMessages()
      && (IMIsRunningInMessagesComposeViewService() & 1) == 0
      && CKIsRunningInCarousel() == 0;
}

- (void)_postConversationListChangedNotification
{
  BOOL v3 = [(CKConversationList *)self loadingConversations];
  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v8 = 0;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Not posting _postConversationListChangedNotification: Still loading conversations", v8, 2u);
      }
    }
  }
  else
  {
    if (v4)
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Posting _postConversationListChangedNotification", buf, 2u);
      }
    }
    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"CKConversationListChangedNotification" object:self userInfo:0];
  }
}

- (BOOL)loadingConversations
{
  return self->_loadingConversations;
}

- (void)_insertConversationIntoSortedConversationList:(id)a3
{
  trackedConversations = self->_trackedConversations;
  id v8 = a3;
  uint64_t v5 = [(NSMutableArray *)trackedConversations count];
  id v6 = [(CKConversationList *)self _conversationSortComparator];
  uint64_t v7 = -[NSMutableArray indexOfObject:inSortedRange:options:usingComparator:](trackedConversations, "indexOfObject:inSortedRange:options:usingComparator:", v8, 0, v5, 1024, v6);

  [(NSMutableArray *)self->_trackedConversations insertObject:v8 atIndex:v7];
}

- (id)_conversationSortComparator
{
  return &__block_literal_global_233;
}

- (void)updatePinnedConversationsFromDataSource
{
}

- (void)updatePinnedConversationsFromDataSourceWithConversationFetch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F6BD70] processSupportsPinnedConversations])
  {
    if (IMOSLoggingEnabled())
    {
      int v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Updating pinned conversations from the IMPinnedConversationsController", buf, 2u);
      }
    }
    uint64_t v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v6 = [MEMORY[0x1E4F6BD70] sharedInstance];
    id v24 = [v6 pinnedConversationIdentifiers];

    if (v3)
    {
      long long v32 = 0u;
      long long v33 = 0u;
      long long v30 = 0u;
      long long v31 = 0u;
      id v7 = v24;
      uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v37 count:16];
      if (v8)
      {
        uint64_t v9 = *(void *)v31;
        do
        {
          for (uint64_t i = 0; i != v8; ++i)
          {
            if (*(void *)v31 != v9) {
              objc_enumerationMutation(v7);
            }
            uint64_t v11 = *(void *)(*((void *)&v30 + 1) + 8 * i);
            uint64_t v12 = [(CKConversationList *)self conversationForExistingChatWithPinningIdentifier:v11];
            if (!v12 && IMOSLoggingEnabled())
            {
              BOOL v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v36 = v11;
                _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Failed to find existing chat for pinning identifier %@", buf, 0xCu);
              }
            }
          }
          uint64_t v8 = [v7 countByEnumeratingWithState:&v30 objects:v37 count:16];
        }
        while (v8);
      }
    }
    v14 = [(CKConversationList *)self pinningIdentifierMap];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v26 = 0u;
    long long v27 = 0u;
    id v15 = v24;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v27;
      do
      {
        for (uint64_t j = 0; j != v16; ++j)
        {
          if (*(void *)v27 != v17) {
            objc_enumerationMutation(v15);
          }
          uint64_t v19 = *(void *)(*((void *)&v26 + 1) + 8 * j);
          __int16 v20 = [v14 objectForKey:v19];
          if (v20)
          {
            [v5 addObject:v20];
          }
          else
          {
            id v21 = IMLogHandleForCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v36 = v19;
              _os_log_error_impl(&dword_18EF18000, v21, OS_LOG_TYPE_ERROR, "A CKConversation with pinningIdentifier \"%@\" was not found in pinningIdentifierMap. This conversation will appear as not pinned.", buf, 0xCu);
            }

            if (v14)
            {
              [v14 enumerateKeysAndObjectsUsingBlock:&__block_literal_global_28];
            }
            else if (IMOSLoggingEnabled())
            {
              uint64_t v22 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "pinningIdentifierMap == nil", buf, 2u);
              }
            }
          }
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v26 objects:v34 count:16];
      }
      while (v16);
    }

    id v23 = [v5 copy];
    [(CKConversationList *)self setPinnedConversations:v23];
  }
  else
  {
    uint64_t v5 = IMLogHandleForCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
      -[CKConversationList updatePinnedConversationsFromDataSourceWithConversationFetch:](v5);
    }
  }
}

- (void)setPinnedConversations:(id)a3
{
}

- (CKConversationList)init
{
  v9.receiver = self;
  v9.super_class = (Class)CKConversationList;
  id v2 = [(CKConversationList *)&v9 init];
  if (v2)
  {
    BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 addObserver:v2 selector:sel__invalidateABCaches_ name:*MEMORY[0x1E4F6CA58] object:0];
    [v3 addObserver:v2 selector:sel__abChanged_ name:*MEMORY[0x1E4F6CA50] object:0];
    [v3 addObserver:v2 selector:sel__invalidatePartialABCaches_ name:*MEMORY[0x1E4F6CA98] object:0];
    [v3 addObserver:v2 selector:sel__abPartialChanged_ name:*MEMORY[0x1E4F6CA60] object:0];
    [v3 addObserver:v2 selector:sel__handleChatParticipantsDidChange_ name:*MEMORY[0x1E4F6B9C8] object:0];
    [v3 addObserver:v2 selector:sel__handleChatJoinStateDidChange_ name:*MEMORY[0x1E4F6B980] object:0];
    [v3 addObserver:v2 selector:sel__handlePreferredServiceChangedNotification_ name:*MEMORY[0x1E4F6BA80] object:0];
    [v3 addObserver:v2 selector:sel__chatItemsDidChange_ name:*MEMORY[0x1E4F6B8D8] object:0];
    [v3 addObserver:v2 selector:sel__handleEngroupFinishedUpdating_ name:*MEMORY[0x1E4F6B8A8] object:0];
    [v3 addObserver:v2 selector:sel__chatPropertiesChanged_ name:*MEMORY[0x1E4F6B9F0] object:0];
    [v3 addObserver:v2 selector:sel__handleChatsWillRemergeNotification_ name:*MEMORY[0x1E4F6BA70] object:0];
    [v3 addObserver:v2 selector:sel__handleChatsDidRemergeNotification_ name:*MEMORY[0x1E4F6BA48] object:0];
    [v3 addObserver:v2 selector:sel__handleUpdatedMessagesWithSummariesNotification_ name:*MEMORY[0x1E4F6BA58] object:0];
    if (CKIsRunningInPreferences()
      || CKIsRunningInNanoSettings()
      || CKIsRunningInMessagesOrSpringBoard())
    {
      [v3 addObserver:v2 selector:sel__handleRegistryDidRegisterChatNotification_ name:*MEMORY[0x1E4F6BA40] object:0];
      [v3 addObserver:v2 selector:sel__handleRegistryWillUnregisterChatNotification_ name:*MEMORY[0x1E4F6BA78] object:0];
      [v3 addObserver:v2 selector:sel__handleMemoryWarning_ name:*MEMORY[0x1E4F43670] object:0];
    }
    [v3 addObserver:v2 selector:sel_updateConversationsForNewPinnedConversations_ name:*MEMORY[0x1E4F6BB98] object:0];
    [v3 addObserver:v2 selector:sel__handleGroupPhotoChanged_ name:*MEMORY[0x1E4F6B8B0] object:0];
    [v3 addObserver:v2 selector:sel__handleGroupNameChanged_ name:*MEMORY[0x1E4F6B898] object:0];
    uint64_t v4 = [MEMORY[0x1E4F1CA60] dictionary];
    conversationsDictionary = v2->_conversationsDictionary;
    v2->_conversationsDictionary = (NSMutableDictionary *)v4;

    v2->_simFilterIndex = -1;
    id v6 = MEMORY[0x192FBA040](@"com.apple.MobileSMS", @"simFilterIndex");
    uint64_t v7 = [v6 integerValue];

    if ((unint64_t)(v7 - 1) <= 1) {
      v2->_simFilterIndex = v7;
    }
  }
  return v2;
}

uint64_t __50__CKConversationList__nonPlaceholderConversations__block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPlaceholder] ^ 1;
}

uint64_t __61__CKConversationList_updateConversationListsAndSortIfEnabled__block_invoke(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateConversationFilteredFlagsAndReportSpam];
}

- (void)updateConversationListsAndSortIfEnabled
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  long long v32 = [(CKConversationList *)self conversations];
  [(CKConversationList *)self updateFilteredByFocusStateForConversations:v32];
  [(CKConversationList *)self updateRecoverableConversationList];
  long long v31 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:0];
  BOOL v3 = [v31 objectForKey:@"stop-auto-report-unknown"];
  int v4 = [v3 BOOLValue];

  if ((v4 & 1) == 0)
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = __61__CKConversationList_updateConversationListsAndSortIfEnabled__block_invoke;
    block[3] = &unk_1E5620C40;
    block[4] = self;
    dispatch_async(MEMORY[0x1E4F14428], block);
  }
  if ([(CKConversationList *)self _shouldShowInboxUI]
    || [(CKConversationList *)self _messageUnknownFilteringEnabled])
  {
    if (v4 && [(CKConversationList *)self _messageUnknownFilteringEnabled])
    {
      v43[0] = MEMORY[0x1E4F143A8];
      v43[1] = 3221225472;
      v43[2] = __61__CKConversationList_updateConversationListsAndSortIfEnabled__block_invoke_2;
      v43[3] = &unk_1E5620C40;
      v43[4] = self;
      dispatch_async(MEMORY[0x1E4F14428], v43);
    }
    long long v30 = [(CKConversationList *)self _nonPlaceholderConversations];
    uint64_t v5 = -[CKConversationList _emptyConversationsDictionaryWithConversationsCount:](self, "_emptyConversationsDictionaryWithConversationsCount:", [v30 count]);
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = __61__CKConversationList_updateConversationListsAndSortIfEnabled__block_invoke_3;
    v41[3] = &unk_1E5622508;
    v41[4] = self;
    id v6 = v5;
    id v42 = v6;
    [v30 enumerateObjectsUsingBlock:v41];
    for (unint64_t i = 1; i != 10; ++i)
    {
      if (i != 7)
      {
        uint64_t v8 = CKConversationListFilterModeStringValue(i);
        objc_super v9 = [v6 objectForKey:v8];

        [(CKConversationList *)self _setConversations:v9 forFilterMode:i];
      }
    }
    uint64_t v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    char v11 = [v10 isSMSFilterSyncEnabled];

    if (v11)
    {
      if (![(CKConversationList *)self _messageSpamFilteringEnabled])
      {
LABEL_46:
        long long v29 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v29 postNotificationName:@"CKConversationListDidFinishSorting" object:0 userInfo:0];

        goto LABEL_47;
      }
      long long v39 = 0u;
      long long v40 = 0u;
      long long v37 = 0u;
      long long v38 = 0u;
      uint64_t v12 = [MEMORY[0x1E4F6E938] fetchSMSFilterExtensionParams];
      uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v50 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v38;
        do
        {
          for (uint64_t j = 0; j != v13; ++j)
          {
            if (*(void *)v38 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void **)(*((void *)&v37 + 1) + 8 * j);
            if ((unint64_t)[v16 filterMode] >= 0x10)
            {
              uint64_t v17 = CKConversationListFilterModeStringValue([v16 filterMode]);
              if (v17)
              {
                __int16 v18 = [v6 objectForKey:v17];
                -[CKConversationList _setConversations:forFilterMode:](self, "_setConversations:forFilterMode:", v18, [v16 filterMode]);
              }
              else if (IMOSLoggingEnabled())
              {
                uint64_t v19 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  uint64_t v20 = [v16 filterMode];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v47 = 0;
                  __int16 v48 = 2048;
                  uint64_t v49 = v20;
                  _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "%@ found for filterMode: %ld, this will result in empty sub-classification folder", buf, 0x16u);
                }
              }
            }
          }
          uint64_t v13 = [v12 countByEnumeratingWithState:&v37 objects:v50 count:16];
        }
        while (v13);
      }
    }
    else
    {
      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      uint64_t v12 = [MEMORY[0x1E4F6E938] fetchSMSFilterExtensionParams];
      uint64_t v21 = [v12 countByEnumeratingWithState:&v33 objects:v45 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v34;
        do
        {
          for (uint64_t k = 0; k != v21; ++k)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v12);
            }
            id v24 = *(void **)(*((void *)&v33 + 1) + 8 * k);
            if ((unint64_t)[v24 filterMode] >= 0x10)
            {
              v25 = CKConversationListFilterModeStringValue([v24 filterMode]);
              if (v25)
              {
                long long v26 = [v6 objectForKey:v25];
                -[CKConversationList _setConversations:forFilterMode:](self, "_setConversations:forFilterMode:", v26, [v24 filterMode]);
              }
              else if (IMOSLoggingEnabled())
              {
                long long v27 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  uint64_t v28 = [v24 filterMode];
                  *(_DWORD *)buf = 138412546;
                  uint64_t v47 = 0;
                  __int16 v48 = 2048;
                  uint64_t v49 = v28;
                  _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "%@ found for filterMode: %ld, this will result in empty sub-classification folder", buf, 0x16u);
                }
              }
            }
          }
          uint64_t v21 = [v12 countByEnumeratingWithState:&v33 objects:v45 count:16];
        }
        while (v21);
      }
    }

    goto LABEL_46;
  }
  if (IMIsOscarEnabled()) {
    [(CKConversationList *)self _configureForOscarEnabledUnsortedConversationList];
  }
  else {
    [(CKConversationList *)self _configureForUnsortedConversationList];
  }
LABEL_47:
}

- (void)updateRecoverableConversationList
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  int v4 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  uint64_t v5 = [v4 cachedChats];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  uint64_t v10 = __55__CKConversationList_updateRecoverableConversationList__block_invoke;
  char v11 = &unk_1E5622598;
  uint64_t v12 = self;
  id v13 = v3;
  id v6 = v3;
  [v5 enumerateObjectsUsingBlock:&v8];

  uint64_t v7 = [(CKConversationList *)self _recoverableSortComparator];
  [v6 sortUsingComparator:v7];

  [(CKConversationList *)self _setConversations:v6 forFilterMode:7];
}

- (id)_recoverableSortComparator
{
  return &__block_literal_global_297_0;
}

- (BOOL)_shouldShowInboxUI
{
  return CKShouldShowInboxView() != 0;
}

- (BOOL)_messageUnknownFilteringEnabled
{
  return CKMessageUnknownFilteringEnabled() != 0;
}

- (void)_configureForUnsortedConversationList
{
  id v3 = [(CKConversationList *)self _nonPlaceholderConversations];
  [(CKConversationList *)self _setConversations:v3 forFilterMode:0];
}

- (void)resort
{
  if (![(CKConversationList *)self loadingConversations])
  {
    trackedConversations = self->_trackedConversations;
    int v4 = [(CKConversationList *)self _conversationSortComparator];
    [(NSMutableArray *)trackedConversations sortUsingComparator:v4];

    [(CKConversationList *)self logConversationsTopCount:20 bottomCount:10];
  }
}

- (void)logConversationsTopCount:(int64_t)a3 bottomCount:(int64_t)a4
{
  int v4 = self;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  uint64_t v34 = [(NSMutableArray *)self->_trackedConversations count];
  long long v32 = v4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v36 = v34;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "resorted conversation list. length %ld", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v36 = a3;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "top %ld conversations:", buf, 0xCu);
    }
  }
  uint64_t v7 = [(NSMutableArray *)v4->_trackedConversations count];
  if (a3 >= 1 && v7)
  {
    int64_t v8 = 1;
    do
    {
      uint64_t v9 = [(NSMutableArray *)v4->_trackedConversations objectAtIndex:v8 - 1];
      if (IMOSLoggingEnabled())
      {
        uint64_t v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          char v11 = [v9 chat];
          uint64_t v12 = [v11 lastFinishedMessageDate];
          id v13 = [v9 chat];
          uint64_t v14 = [v13 lastTUConversationCreatedDate];
          id v15 = [v9 chat];
          uint64_t v16 = [v15 lastScheduledMessageCreatedDate];
          *(_DWORD *)buf = 134219010;
          int64_t v36 = v8 - 1;
          __int16 v37 = 2112;
          long long v38 = v12;
          __int16 v39 = 2112;
          long long v40 = v14;
          __int16 v41 = 2112;
          id v42 = v16;
          __int16 v43 = 2112;
          v44 = v9;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "%ld. %@ (lastTUConversationCreatedDate: %@) (lastScheduledMessageCreatedDate: %@) - %@", buf, 0x34u);

          int v4 = v32;
        }
      }
      unint64_t v17 = [(NSMutableArray *)v4->_trackedConversations count];
      if (v8 >= a3) {
        break;
      }
    }
    while (v8++ < v17);
  }
  if (v34 - a3 >= a4) {
    int64_t v19 = a4;
  }
  else {
    int64_t v19 = v34 - a3;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "---------------------------------------", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      int64_t v36 = v19 & ~(v19 >> 63);
      _os_log_impl(&dword_18EF18000, v21, OS_LOG_TYPE_INFO, "bottom %ld conversations:", buf, 0xCu);
    }
  }
  if (v19 >= 1)
  {
    int64_t v22 = v34 - (v19 & ~(v19 >> 63));
    do
    {
      id v23 = [(NSMutableArray *)v4->_trackedConversations objectAtIndex:v22];
      if (IMOSLoggingEnabled())
      {
        id v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          v25 = [v23 chat];
          long long v26 = [v25 lastFinishedMessageDate];
          long long v27 = [v23 chat];
          uint64_t v28 = [v27 lastTUConversationCreatedDate];
          long long v29 = [v23 chat];
          long long v30 = [v29 lastScheduledMessageCreatedDate];
          *(_DWORD *)buf = 134219010;
          int64_t v36 = v22;
          __int16 v37 = 2112;
          long long v38 = v26;
          __int16 v39 = 2112;
          long long v40 = v28;
          __int16 v41 = 2112;
          id v42 = v30;
          __int16 v43 = 2112;
          v44 = v23;
          _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "%ld. %@ (lastTUConversationCreatedDate: %@) (lastScheduledMessageCreatedDate: %@) - %@", buf, 0x34u);

          int v4 = v32;
        }
      }
      ++v22;
    }
    while (v22 < v34);
  }
}

- (NSArray)pinnedConversations
{
  return self->_pinnedConversations;
}

- (id)conversationsForFilterMode:(unint64_t)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(CKConversationList *)self conversationsDictionary];
  id v6 = CKConversationListFilterModeStringValue(a3);
  uint64_t v7 = [v5 objectForKey:v6];

  if ([(CKConversationList *)self _isParentWithSubfoldersForFilterMode:a3])
  {
    if (IMOSLoggingEnabled())
    {
      int64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v20 = 134217984;
        unint64_t v21 = a3;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Looking into sub classes of parent mode: %lu", (uint8_t *)&v20, 0xCu);
      }
    }
    uint64_t v9 = [(CKConversationList *)self subclassifiedConversationsForFilterMode:a3];

    uint64_t v7 = (void *)v9;
  }
  if (v7
    && [(CKConversationList *)self _messageSIMFilteringEnabled]
    && self->_simFilterIndex != -1)
  {
    uint64_t v10 = [MEMORY[0x1E4F6E668] sharedInstance];
    char v11 = [v10 ctSubscriptionInfo];
    uint64_t v12 = objc_msgSend(v11, "__im_subscriptionContextForForSlotID:", -[CKConversationList simFilterIndex](self, "simFilterIndex"));

    id v13 = [v12 phoneNumber];
    uint64_t v14 = [v12 labelID];
    uint64_t v15 = [(CKConversationList *)self _filterConversations:v7 byHandleID:v13 simID:v14];

    uint64_t v7 = (void *)v15;
  }
  uint64_t v16 = [MEMORY[0x1E4F6E788] sharedManager];
  int v17 = [v16 shouldFilterConversationsByFocus];

  if (v17)
  {
    uint64_t v18 = [(CKConversationList *)self _filterConversationsByFocus:v7];

    uint64_t v7 = (void *)v18;
  }
  if (!v7) {
    uint64_t v7 = objc_opt_new();
  }

  return v7;
}

- (void)_setConversations:(id)a3 forFilterMode:(unint64_t)a4
{
  if (a3)
  {
    id v6 = a3;
    id v8 = [(CKConversationList *)self conversationsDictionary];
    uint64_t v7 = CKConversationListFilterModeStringValue(a4);
    [v8 setObject:v6 forKey:v7];
  }
}

- (NSMutableDictionary)conversationsDictionary
{
  return self->_conversationsDictionary;
}

- (BOOL)_isParentWithSubfoldersForFilterMode:(unint64_t)a3
{
  return (a3 & 0xFFFFFFFFFFFFFFFELL) == 4;
}

- (CKConversation)pendingConversation
{
  return self->_pendingConversation;
}

- (BOOL)_messageSIMFilteringEnabled
{
  return CKMessageSIMFilteringEnabled();
}

- (void)updateFilteredByFocusStateForConversations:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  int v4 = [MEMORY[0x1E4F6E788] sharedManager];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v12 + 1) + 8 * v9);
        if (objc_msgSend(v4, "shouldDisplayFocusFilterBanner", (void)v12)) {
          uint64_t v11 = [v4 conversationMatchesActiveFocusMode:v10];
        }
        else {
          uint64_t v11 = 1;
        }
        [v10 setAllowedByPersonListInActiveFocus:v11];
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }
}

- (id)pinningIdentifierMap
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  obuint64_t j = [(CKConversationList *)self conversations];
  uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v20;
    *(void *)&long long v5 = 138412802;
    long long v17 = v5;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v9 = objc_msgSend(v8, "chat", v17);
        uint64_t v10 = [MEMORY[0x1E4F6BD70] sharedInstance];
        uint64_t v11 = [v10 matchingIdentifierForChat:v9];

        if (v11)
        {
          long long v12 = [v3 objectForKey:v11];
          if (v12)
          {
            long long v13 = IMLogHandleForCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)buf = v17;
              id v24 = v11;
              __int16 v25 = 2112;
              long long v26 = v12;
              __int16 v27 = 2112;
              uint64_t v28 = v8;
              _os_log_error_impl(&dword_18EF18000, v13, OS_LOG_TYPE_ERROR, "We matched multiple conversations to one pinning identifier. Keeping existing match. matchingIdentifier: %@, match1: %@, match2: %@", buf, 0x20u);
            }
          }
          else
          {
            if (IMOSLoggingEnabled())
            {
              long long v14 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v24 = v11;
                __int16 v25 = 2112;
                long long v26 = v8;
                _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "Found a match for the conversation in the IMPinnedConversationsController. matchingIdentifier: %@, conversation: %@", buf, 0x16u);
              }
            }
            [v3 setObject:v8 forKey:v11];
          }
        }
      }
      uint64_t v4 = [obj countByEnumeratingWithState:&v19 objects:v29 count:16];
    }
    while (v4);
  }

  long long v15 = (void *)[v3 copy];

  return v15;
}

+ (void)_handleRegistryDidLoadNotification:(id)a3
{
  id v3 = objc_msgSend(a1, "sharedConversationList", a3);
  [v3 _beginTrackingAllExistingChatsIfNeeded];

  uint64_t v4 = objc_alloc_init(CKConversationMutedChatListMigrator);
  [(CKConversationMutedChatListMigrator *)v4 migrateMutedChatListInfoIfNeeded];
}

- (void)updateConversationFilteredFlagsAndReportSpam
{
  id v2 = [(CKConversationList *)self conversations];
  id v3 = v2;
  if (updateConversationFilteredFlagsAndReportSpam_onceToken != -1)
  {
    dispatch_once(&updateConversationFilteredFlagsAndReportSpam_onceToken, &__block_literal_global_268);
    id v2 = v3;
  }
  [v2 enumerateObjectsUsingBlock:&__block_literal_global_274];
  if (!updateConversationFilteredFlagsAndReportSpam_sAlreadyMigrated)
  {
    updateConversationFilteredFlagsAndReportSpam_sAlreadyMigrated = 1;
    IMSetDomainBoolForKey();
  }
}

- (id)_nonPlaceholderConversations
{
  id v2 = [(CKConversationList *)self conversations];
  if (CKIsRunningForDevelopmentOnSimulator() || CKIsRunningUITests())
  {
    id v3 = v2;
  }
  else
  {
    long long v5 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_278];
    id v3 = [v2 filteredArrayUsingPredicate:v5];
  }

  return v3;
}

- (NSArray)conversations
{
  id v2 = [(CKConversationList *)self trackedConversations];
  id v3 = (void *)[v2 copy];

  return (NSArray *)v3;
}

- (NSMutableArray)trackedConversations
{
  if (!self->_loadedConversations) {
    [(CKConversationList *)self _beginTrackingAllExistingChatsIfNeeded];
  }
  trackedConversations = self->_trackedConversations;

  return trackedConversations;
}

uint64_t __66__CKConversationList_updateConversationFilteredFlagsAndReportSpam__block_invoke()
{
  uint64_t result = IMGetDomainBoolForKey();
  updateConversationFilteredFlagsAndReportSpam_sAlreadyMigrated = result;
  return result;
}

- (void)updateConversationsForNewPinnedConversations:(id)a3
{
  id v4 = [a3 object];
  [(CKConversationList *)self _updateConversationsForNewPinnedConversations:v4];
}

- (void)_updateConversationsForNewPinnedConversations:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v17 = self;
  long long v5 = [(CKConversationList *)self pinnedConversations];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v19 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [v9 pinningIdentifier];
        if (v10)
        {
          [v4 addObject:v10];
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            long long v12 = [(CKConversationList *)v17 pinnedConversations];
            *(_DWORD *)buf = 138412546;
            id v23 = v9;
            __int16 v24 = 2112;
            __int16 v25 = v12;
            _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "An existing pinned conversation's pinningIdentifier was nil. existingPinnedConversation: %@, pinnedConversations: %@", buf, 0x16u);
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v26 count:16];
    }
    while (v6);
  }

  if ([v4 isEqualToOrderedSet:v16])
  {
    if (IMOSLoggingEnabled())
    {
      long long v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "A pinned conversation list update notification was received, but the conversations are the same. Ignoring notification.", buf, 2u);
      }
    }
    [(CKConversationList *)v17 postFinishedInitalPinLoadIfNecessary];
  }
  else
  {
    [(CKConversationList *)v17 updatePinnedConversationsFromDataSource];
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [v14 setObject:v4 forKeyedSubscript:@"previousPinnedConversationIdentifiers"];
    long long v15 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v15 postNotificationName:@"CKConversationListPinnedConversationsChangedNotification" object:v17 userInfo:v14];

    [(CKConversationList *)v17 postFinishedInitalPinLoadIfNecessary];
  }
}

- (void)postFinishedInitalPinLoadIfNecessary
{
  if (![(CKConversationList *)self loadedPinnedConversations])
  {
    [(CKConversationList *)self setLoadedPinnedConversations:1];
    id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 postNotificationName:@"CKConversationListFinishedInitalPinLoadNotification" object:self userInfo:0];
  }
}

- (void)setLoadedPinnedConversations:(BOOL)a3
{
  self->_loadedPinnedConversations = a3;
}

- (BOOL)loadedPinnedConversations
{
  return self->_loadedPinnedConversations;
}

+ (void)initialize
{
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:a1 selector:sel__handleRegistryDidLoadNotification_ name:*MEMORY[0x1E4F6BA20] object:0];
}

+ (id)conversationListAlertSuppressionContextForFilterMode:(unint64_t)a3
{
  if (a3 > 1)
  {
    id v4 = CKConversationListFilterModeStringValue(a3);
    id v3 = [@"ConversationListSuppressionContext" stringByAppendingString:v4];
  }
  else
  {
    id v3 = @"ConversationListSuppressionContext";
  }

  return v3;
}

- (id)description
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v2 = [(CKConversationList *)self conversations];
  __int16 v25 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v2, "count"));
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  obuint64_t j = v2;
  uint64_t v26 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v26)
  {
    uint64_t v24 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v29 != v24) {
          objc_enumerationMutation(obj);
        }
        id v4 = [*(id *)(*((void *)&v28 + 1) + 8 * i) chat];
        uint64_t v5 = [v4 lastFinishedMessageID];
        uint64_t v6 = objc_msgSend(v4, "__ck_watermarkMessageID");
        uint64_t v7 = [v4 lastFinishedMessageDate];
        uint64_t v8 = objc_msgSend(v4, "__ck_watermarkDate");
        id v9 = [NSString alloc];
        if (v5 <= v6) {
          uint64_t v10 = v6;
        }
        else {
          uint64_t v10 = v5;
        }
        uint64_t v11 = [v7 laterDate:v8];
        long long v12 = [v4 guid];
        [v7 timeIntervalSinceReferenceDate];
        uint64_t v14 = v13;
        [v8 timeIntervalSinceReferenceDate];
        id v16 = (void *)[v9 initWithFormat:@"%lld - %@ | %@ (%lld,%lld) (%f,%f)", v10, v11, v12, v5, v6, v14, v15];

        [v25 addObject:v16];
      }
      uint64_t v26 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v26);
  }

  long long v17 = NSString;
  v27.receiver = self;
  v27.super_class = (Class)CKConversationList;
  long long v18 = [(CKConversationList *)&v27 description];
  long long v19 = [v25 description];
  long long v20 = [v17 stringWithFormat:@"%@ %@", v18, v19];

  return v20;
}

- (id)_beginTrackingConversationWithChatIndirect:(id)a3
{
  return -[CKConversationList _beginTrackingConversationWithChat:]((id *)&self->super.isa, a3);
}

- (void)_beginTrackingConversationWithChat:(id)a3 completion:(id)a4
{
  id v8 = a3;
  uint64_t v6 = (void (**)(id, CKConversation *))a4;
  uint64_t v7 = [(CKConversationList *)self _alreadyTrackedConversationForChat:v8];
  if (!v7) {
    uint64_t v7 = [[CKConversation alloc] initWithChat:v8];
  }
  [v8 setContextInfo:v7];
  if (v6) {
    v6[2](v6, v7);
  }
}

- (id)conversationForExistingChatWithPinningIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F6BC40];
    id v5 = a3;
    uint64_t v6 = [v4 sharedRegistry];
    uint64_t v7 = [v6 existingChatWithPinningIdentifier:v5];

    id v8 = [(CKConversationList *)self _conversationForChat:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)conversationForExistingChatWithDeviceIndependentID:(id)a3
{
  if (a3)
  {
    id v4 = (void *)MEMORY[0x1E4F6BC40];
    id v5 = a3;
    uint64_t v6 = [v4 sharedRegistry];
    uint64_t v7 = [v6 existingChatWithDeviceIndependentID:v5];

    id v8 = [(CKConversationList *)self _conversationForChat:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)conversationForExistingChatWithChatIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length] && (objc_msgSend(v4, "isEqualToString:", @"-1") & 1) == 0)
  {
    uint64_t v6 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    uint64_t v7 = [v6 existingChatWithChatIdentifier:v4];

    id v5 = [(CKConversationList *)self _conversationForChat:v7];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)conversationForExistingChatWithGroupID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && ([v4 isEqualToString:@"-1"] & 1) == 0)
  {
    uint64_t v7 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    id v8 = [v7 existingChatWithGroupID:v5];

    uint64_t v6 = [(CKConversationList *)self _conversationForChat:v8];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return v6;
}

- (id)conversationForExistingChatWithPersonCentricID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 length])
  {
    uint64_t v6 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    uint64_t v7 = [v6 existingChatWithPersonID:v5];

    id v8 = [(CKConversationList *)self _conversationForChat:v7];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)conversationsForExistingChatsWithGUIDs:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4 && [v4 count])
  {
    uint64_t v6 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    uint64_t v7 = [v6 existingChatsWithGUIDs:v5];

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __61__CKConversationList_conversationsForExistingChatsWithGUIDs___block_invoke;
    v10[3] = &unk_1E5622438;
    v10[4] = self;
    id v8 = objc_msgSend(v7, "__imArrayByApplyingBlock:", v10);
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

uint64_t __61__CKConversationList_conversationsForExistingChatsWithGUIDs___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) _conversationForChat:a2];
}

- (void)stopTrackingConversation:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [v4 chat];
      uint64_t v7 = [v6 guid];
      int v10 = 138412290;
      uint64_t v11 = v7;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Stop tracking conversation: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  if (v4)
  {
    int v8 = [v4 isPinned];
    id v9 = [v4 chat];
    [v9 setContextInfo:0];
    [(NSMutableArray *)self->_trackedConversations removeObject:v4];
    [(CKConversationList *)self _postConversationListChangedNotification];
    if (v8) {
      [(CKConversationList *)self updatePinnedConversationsFromDataSourceWithConversationFetch:0];
    }
  }
}

- (void)_handleRegistryDidRegisterChatNotification:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 object];
  uint64_t v6 = -[CKConversationList _beginTrackingConversationWithChat:]((id *)&self->super.isa, v5);
  uint64_t v7 = [(CKConversationList *)self pendingConversation];
  if (v7)
  {
    int v8 = [(CKConversationList *)self pendingConversation];
    id v9 = [v8 chat];

    if (!v9)
    {
      if (IMOSLoggingEnabled())
      {
        int v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = [(CKConversationList *)self pendingConversation];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v11;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Pending conversation has no chat set: %@", (uint8_t *)&buf, 0xCu);
        }
      }
      uint64_t v12 = [(CKConversationList *)self pendingConversation];
      uint64_t v13 = [v6 chat];
      uint64_t v14 = [v13 participants];
      uint64_t v15 = [v14 sortedArrayUsingSelector:sel_guid];

      id v16 = [(CKConversationList *)self pendingConversation];
      long long v17 = [v16 pendingHandles];
      long long v18 = [v17 sortedArrayUsingSelector:sel_guid];

      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v36 = 0x2020000000;
      BOOL v37 = 0;
      uint64_t v19 = [v15 count];
      BOOL v37 = v19 == [v18 count];
      if (*(unsigned char *)(*((void *)&buf + 1) + 24))
      {
        uint64_t v25 = MEMORY[0x1E4F143A8];
        uint64_t v26 = 3221225472;
        objc_super v27 = __65__CKConversationList__handleRegistryDidRegisterChatNotification___block_invoke;
        long long v28 = &unk_1E5622460;
        id v29 = v18;
        p_long long buf = &buf;
        [v15 enumerateObjectsUsingBlock:&v25];

        if (*(unsigned char *)(*((void *)&buf + 1) + 24))
        {
          long long v20 = objc_msgSend(v6, "copyForPendingConversation", v25, v26, v27, v28);
          long long v21 = [v12 pendingHandles];
          [v20 setPendingHandles:v21];

          if (IMOSLoggingEnabled())
          {
            long long v22 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)uint64_t v33 = 138412290;
              uint64_t v34 = v20;
              _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Handles are identical, setting new pending conversation: %@", v33, 0xCu);
            }
          }
          [(CKConversationList *)self setPendingConversation:v20];
          long long v31 = @"CKConversationListWasPendingKey";
          uint64_t v32 = MEMORY[0x1E4F1CC38];
          id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v32 forKeys:&v31 count:1];
          uint64_t v24 = [MEMORY[0x1E4F28EB8] defaultCenter];
          [v24 postNotificationName:@"CKConversationListConversationLeftNotification" object:v12 userInfo:v23];
        }
      }
      _Block_object_dispose(&buf, 8);
    }
  }
}

void __65__CKConversationList__handleRegistryDidRegisterChatNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  uint64_t v7 = *(void **)(a1 + 32);
  id v8 = a2;
  id v9 = [v7 objectAtIndex:a3];
  uint64_t v10 = [v8 compareIDs:v9];

  if (v10)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 0;
    *a4 = 1;
  }
}

- (void)_handleRegistryWillUnregisterChatNotification:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      long long v21 = "-[CKConversationList _handleRegistryWillUnregisterChatNotification:]";
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    long long v17 = "-[CKConversationList _handleRegistryWillUnregisterChatNotification:]";
    _CKLog();
  }
  uint64_t v6 = objc_msgSend(v4, "object", v17);
  if (v6)
  {
    uint64_t v7 = [(CKConversationList *)self _alreadyTrackedConversationForChat:v6];
    if (v7)
    {
      [(CKConversationList *)self stopTrackingConversation:v7];
      id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v8 postNotificationName:@"CKConversationListConversationLeftNotification" object:v7 userInfo:0];
    }
    id v9 = [(CKConversationList *)self pendingConversation];
    uint64_t v10 = [v9 chat];
    int v11 = [v10 isEqual:v6];

    if (v11)
    {
      uint64_t v12 = [(CKConversationList *)self pendingConversation];
      id v13 = +[CKConversation newPendingConversation];
      uint64_t v14 = [v6 participants];
      [v13 setPendingHandles:v14];

      [(CKConversationList *)self setPendingConversation:v13];
      long long v18 = @"CKConversationListWasPendingKey";
      uint64_t v19 = MEMORY[0x1E4F1CC38];
      uint64_t v15 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v19 forKeys:&v18 count:1];
      id v16 = [MEMORY[0x1E4F28EB8] defaultCenter];
      [v16 postNotificationName:@"CKConversationListConversationLeftNotification" object:v12 userInfo:v15];
    }
  }
}

- (id)_copyEntitiesForAddressStrings:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = v3;
  if (v3 && [v3 count])
  {
    id v5 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v4, "count"));
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = v4;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v15;
      do
      {
        uint64_t v10 = 0;
        do
        {
          if (*(void *)v15 != v9) {
            objc_enumerationMutation(v6);
          }
          id v11 = +[CKEntity copyEntityForAddressString:](CKEntity, "copyEntityForAddressString:", *(void *)(*((void *)&v14 + 1) + 8 * v10), (void)v14);
          if (v11) {
            [v5 addObject:v11];
          }

          ++v10;
        }
        while (v8 != v10);
        uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v8);
    }

    uint64_t v12 = (void *)[v5 copy];
  }
  else
  {
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)conversationForHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5 create:(BOOL)a6
{
  LOBYTE(v7) = a6;
  return [(CKConversationList *)self conversationForHandles:a3 displayName:a4 lastAddressedHandle:0 lastAddressedSIMID:0 joinedChatsOnly:a5 findMatchingNamedGroups:1 create:v7];
}

- (id)conversationForHandles:(id)a3 displayName:(id)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6 joinedChatsOnly:(BOOL)a7 findMatchingNamedGroups:(BOOL)a8 create:(BOOL)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  long long v15 = (void *)MEMORY[0x1E4F6BC40];
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  long long v20 = [v15 sharedRegistry];
  LOBYTE(v24) = a9;
  long long v21 = objc_msgSend(v20, "_ck_chatForHandles:displayName:lastAddressedHandle:lastAddressedSIMID:joinedChatsOnly:findMatchingNamedGroups:createIfNecessary:", v19, v18, v17, v16, v10, v9, v24);

  uint64_t v22 = [(CKConversationList *)self _conversationForChat:v21];

  return v22;
}

- (void)resetCaches
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v2 = (void *)[(NSMutableArray *)self->_trackedConversations _copyForEnumerating];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = v2;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v9;
    do
    {
      uint64_t v7 = 0;
      do
      {
        if (*(void *)v9 != v6) {
          objc_enumerationMutation(v3);
        }
        objc_msgSend(*(id *)(*((void *)&v8 + 1) + 8 * v7++), "resetCaches", (void)v8);
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)setNeedsReload
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  id v2 = self->_trackedConversations;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = v3;
    uint64_t v5 = *(void *)v8;
    do
    {
      uint64_t v6 = 0;
      do
      {
        if (*(void *)v8 != v5) {
          objc_enumerationMutation(v2);
        }
        objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * v6++), "setNeedsReload", (void)v7);
      }
      while (v4 != v6);
      uint64_t v4 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
    }
    while (v4);
  }
}

void __83__CKConversationList_updatePinnedConversationsFromDataSourceWithConversationFetch___block_invoke(uint64_t a1, void *a2, void *a3)
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a2;
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412546;
      id v8 = v4;
      __int16 v9 = 2112;
      id v10 = v5;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "pinningIdentifierMap[%@] == %@", (uint8_t *)&v7, 0x16u);
    }
  }
}

- (void)_handleGroupPhotoChanged:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      long long v28 = self;
      __int16 v29 = 2112;
      id v30 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "IMChatGroupPhotoChangedNotification _handleGroupPhotoChanged called on conversation list %@ notification %@", buf, 0x16u);
    }
  }
  uint64_t v6 = [v4 userInfo];
  int v7 = [v6 valueForKey:@"sender"];
  id v8 = [v4 object];
  __int16 v9 = [(CKConversationList *)self conversationForExistingChat:v8];
  [(CKConversationList *)v9 setNeedsUpdatedGroupPhotoForVisualIdentity];
  uint64_t v25 = @"conversation";
  uint64_t v26 = v9;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v26 forKeys:&v25 count:1];
  uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v11 postNotificationName:@"CKConversationListAvatarUpdateNotification" object:0 userInfo:v10];

  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = [(CKConversationList *)v8 guid];
      *(_DWORD *)long long buf = 138412546;
      long long v28 = v9;
      __int16 v29 = 2112;
      id v30 = v13;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Found conversation %@ for chatGuid %@", buf, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v28 = v8;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, " => chat %@", buf, 0xCu);
    }
  }
  [(CKConversationList *)v9 updateConversationVisualIdentityGroupPhotoWithSender:v7];
  if ([v7 length])
  {
    [(CKConversationList *)v9 setShouldShowGroupPhotoUpdateBanner:1];
    long long v15 = [(CKConversationList *)v9 conversationVisualIdentityWithKeys:MEMORY[0x1E4F1CBF0] requestedNumberOfContactsToFetch:0];
    id v16 = [v15 groupPhoto];
    BOOL v17 = [v16 length] == 0;

    id v18 = [CKGroupUpdate alloc];
    if (v17) {
      uint64_t v19 = 4;
    }
    else {
      uint64_t v19 = 2;
    }
    long long v20 = [(CKGroupUpdate *)v18 initWithType:v19 handleID:v7];
    id v23 = @"CKGroupPhotoUpdate";
    uint64_t v24 = v20;
    long long v21 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v24 forKeys:&v23 count:1];
    uint64_t v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v22 postNotificationName:@"CKConversationShowGroupPhotoBannersNotification" object:v8 userInfo:v21];
  }
}

- (void)_handleGroupNameChanged:(id)a3
{
  v21[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 userInfo];
  uint64_t v6 = [v5 valueForKey:@"sender"];
  int v7 = [v4 object];

  id v8 = [(CKConversationList *)self conversationForExistingChat:v7];
  [v8 updateConversationVisualIdentityDisplayNameWithSender:v6];
  __int16 v9 = [v8 conversationVisualIdentityWithKeys:MEMORY[0x1E4F1CBF0] requestedNumberOfContactsToFetch:0];
  if ([v6 length]
    && (([v9 groupName],
         id v10 = objc_claimAutoreleasedReturnValue(),
         uint64_t v11 = [v10 length],
         v10,
         uint64_t v12 = [CKGroupUpdate alloc],
         v11)
      ? (uint64_t v13 = 1)
      : (uint64_t v13 = 5),
        (uint64_t v14 = [(CKGroupUpdate *)v12 initWithType:v13 handleID:v6]) != 0))
  {
    long long v15 = (void *)v14;
    [v8 setShouldShowGroupNameUpdateBanner:1];
    int v16 = 0;
    long long v20 = @"GroupNameUpdate";
    BOOL v17 = v15;
  }
  else
  {
    long long v20 = @"GroupNameUpdate";
    BOOL v17 = [MEMORY[0x1E4F1CA98] null];
    long long v15 = 0;
    int v16 = 1;
  }
  v21[0] = v17;
  id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v21 forKeys:&v20 count:1];
  if (v16) {

  }
  uint64_t v19 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v19 postNotificationName:@"CKConversationShowGroupNameBannersNotification" object:v7 userInfo:v18];
}

- (BOOL)_shouldFilterForParticipants:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([(CKConversationList *)self _messageUnknownFilteringEnabled])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v5 = v4;
    uint64_t v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v6)
    {
      uint64_t v7 = v6;
      uint64_t v8 = *(void *)v16;
      uint64_t v9 = MEMORY[0x1E4F1CBF0];
      while (2)
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v16 != v8) {
            objc_enumerationMutation(v5);
          }
          uint64_t v11 = (void *)MEMORY[0x1E4F6E6D8];
          uint64_t v12 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * i), "cnContactWithKeys:", v9, (void)v15);
          LOBYTE(v11) = [v11 isCNContactAKnownContact:v12];

          if (v11)
          {
            BOOL v13 = 0;
            goto LABEL_13;
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
    BOOL v13 = 1;
LABEL_13:
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (id)firstUnreadFilteredConversationIgnoringMessages:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v5 = objc_msgSend(MEMORY[0x1E4F6BC40], "sharedRegistry", 0);
  uint64_t v6 = [v5 cachedChats];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if ([(CKConversationList *)self _isUnreadChat:v11 ignoringMessages:v4])
        {
          BOOL v13 = [v11 persistentID];
          uint64_t v14 = [(CKConversationList *)self conversationForExistingChatWithChatIdentifier:v13];
          long long v15 = v14;
          if (v14)
          {
            id v12 = v14;
          }
          else
          {
            long long v16 = [v11 persistentID];
            id v12 = [(CKConversationList *)self conversationForExistingChatWithGroupID:v16];
          }
          goto LABEL_14;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_14:

  return v12;
}

- (id)_chatPredicateForFilterMode:(unint64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (a3 > 0xF)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = [MEMORY[0x1E4F6E938] fetchSMSFilterExtensionParams];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v15 + 1) + 8 * i) filterMode] == a3)
          {
            uint64_t v9 = objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K = %d", *MEMORY[0x1E4F6CD78], a3);

            goto LABEL_23;
          }
        }
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

LABEL_13:
    uint64_t v9 = 0;
  }
  else
  {
    switch(a3)
    {
      case 1uLL:
        objc_msgSend(MEMORY[0x1E4F28F60], "predicateWithFormat:", @"%K != %d", *MEMORY[0x1E4F6CD78], 2);
        goto LABEL_22;
      case 2uLL:
        id v10 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v11 = *MEMORY[0x1E4F6CD78];
        uint64_t v14 = 0;
        goto LABEL_21;
      case 3uLL:
        id v10 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v11 = *MEMORY[0x1E4F6CD78];
        uint64_t v12 = 1;
        goto LABEL_20;
      case 4uLL:
        id v10 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v11 = *MEMORY[0x1E4F6CD78];
        uint64_t v12 = 4;
        goto LABEL_20;
      case 5uLL:
        id v10 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v11 = *MEMORY[0x1E4F6CD78];
        uint64_t v12 = 3;
        goto LABEL_20;
      case 6uLL:
        id v10 = (void *)MEMORY[0x1E4F28F60];
        uint64_t v11 = *MEMORY[0x1E4F6CD78];
        uint64_t v12 = 2;
LABEL_20:
        uint64_t v14 = v12;
LABEL_21:
        objc_msgSend(v10, "predicateWithFormat:", @"%K = %d", v11, v14);
        uint64_t v9 = LABEL_22:;
        break;
      default:
        goto LABEL_13;
    }
  }
LABEL_23:

  return v9;
}

- (BOOL)hasActiveConversations
{
  if (!CKIsRunningInPreferences()
    && !CKIsRunningInNanoSettings()
    && !CKIsRunningInMessagesOrSpringBoard())
  {
    return 0;
  }
  id v2 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  BOOL v3 = [v2 numberOfExistingChats] != 0;

  return v3;
}

- (id)topMostConversation
{
  [(CKConversationList *)self resort];
  trackedConversations = self->_trackedConversations;

  return (id)[(NSMutableArray *)trackedConversations firstObject];
}

- (void)_postConversationListUpdateVisibleConversationsNotificationForUID:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (![(CKConversationList *)self loadingConversations])
  {
    if ([v4 length])
    {
      uint64_t v7 = @"uid";
      v8[0] = v4;
      uint64_t v5 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v8 forKeys:&v7 count:1];
    }
    else
    {
      uint64_t v5 = 0;
    }
    uint64_t v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"CKConversationListUpdateVisibleConversationsNotification" object:self userInfo:v5];
  }
}

- (void)unpendConversation
{
  if (self->_pendingConversation) {
    [(CKConversationList *)self setPendingConversation:0];
  }
}

- (int64_t)unreadCountForFilterMode:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (a3 == 7) {
    return 0;
  }
  id v4 = -[CKConversationList conversationsForFilterMode:](self, "conversationsForFilterMode:");
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    int64_t v3 = 0;
    uint64_t v7 = *(void *)v11;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v4);
        }
        v3 += [*(id *)(*((void *)&v10 + 1) + 8 * i) unreadCount];
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
  else
  {
    int64_t v3 = 0;
  }

  return v3;
}

- (int64_t)unreadFilteredConversationCountIgnoringMessages:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v5 = objc_msgSend(MEMORY[0x1E4F6BC40], "sharedRegistry", 0);
  uint64_t v6 = [v5 cachedChats];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    int64_t v9 = 0;
    uint64_t v10 = *(void *)v14;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v6);
        }
        v9 += [(CKConversationList *)self _isUnreadChat:*(void *)(*((void *)&v13 + 1) + 8 * i) ignoringMessages:v4];
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v8);
  }
  else
  {
    int64_t v9 = 0;
  }

  return v9;
}

- (BOOL)_isUnreadChat:(id)a3 ignoringMessages:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([(CKConversationList *)self _chatHasRelevantUnreadLastMessage:v6])
  {
    uint64_t v8 = [v6 persistentID];
    int64_t v9 = [(CKConversationList *)self conversationForExistingChatWithChatIdentifier:v8];
    uint64_t v10 = v9;
    if (v9)
    {
      id v11 = v9;
    }
    else
    {
      long long v13 = [v6 persistentID];
      id v11 = [(CKConversationList *)self conversationForExistingChatWithGroupID:v13];
    }
    if ([v11 isKnownSender] && (objc_msgSend(v11, "isMuted") & 1) == 0)
    {
      long long v14 = [v6 lastMessage];
      long long v15 = [v14 guid];

      if (v15) {
        int v12 = [v7 containsObject:v15] ^ 1;
      }
      else {
        LOBYTE(v12) = 0;
      }
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

- (id)relevantUnreadLastMessages
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v23 = [MEMORY[0x1E4F1CA48] array];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  int64_t v3 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  id v4 = [v3 cachedChats];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v25;
    uint64_t v20 = *MEMORY[0x1E4F1C3B8];
    long long v21 = v4;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v25 != v7) {
          objc_enumerationMutation(v4);
        }
        int64_t v9 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([(CKConversationList *)self _chatHasRelevantUnreadLastMessage:v9])
        {
          uint64_t v10 = [v9 lastMessage];
          id v11 = [v10 guid];

          if (v11)
          {
            [v23 addObject:v11];
          }
          else
          {
            int v12 = [v9 lastMessage];
            if (v12) {
              [NSString stringWithFormat:@"*** relevantUnreadLastMessages: IMMessage has nil guid: %@", v12];
            }
            else {
            long long v13 = [NSString stringWithFormat:@"*** relevantUnreadLastMessages: IMMessageItem has nil message in chat %@", v9];
            }
            long long v14 = (void *)MEMORY[0x1E4F1CA00];
            v28[0] = @"chat";
            long long v15 = [v9 description];
            v28[1] = @"lastMessage";
            v29[0] = v15;
            if (v12)
            {
              uint64_t v22 = [v12 description];
              long long v16 = v22;
            }
            else
            {
              long long v16 = @"<nil>";
            }
            v29[1] = v16;
            long long v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v29 forKeys:v28 count:2];
            uint64_t v18 = [v14 exceptionWithName:v20 reason:v13 userInfo:v17];

            if (v12) {
            IMLogExceptionBacktrace();
            }
            IMLogSimulateCrashForException();

            id v4 = v21;
          }
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v24 objects:v30 count:16];
    }
    while (v6);
  }

  return v23;
}

- (BOOL)_chatHasRelevantUnreadLastMessage:(id)a3
{
  id v3 = a3;
  if ([v3 unreadMessageCount]
    && [v3 lastMessageExists]
    && ([v3 lastMessage],
        id v4 = objc_claimAutoreleasedReturnValue(),
        char v5 = [v4 isRead],
        v4,
        (v5 & 1) == 0))
  {
    uint64_t v8 = [v3 lastMessage];
    char v9 = [v8 isFromMe];

    char v6 = v9 ^ 1;
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (void)deleteConversation:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    char v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "-deleteConversation called with: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    id v7 = v4;
    _CKLog();
  }
  id v8 = v4;
  char v6 = objc_msgSend(MEMORY[0x1E4F1C978], "arrayWithObjects:count:", &v8, 1, v7);
  [(CKConversationList *)self deleteConversations:v6];
}

- (void)deleteConversations:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    char v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v33 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "-deleteConversations called with: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    id v21 = v4;
    _CKLog();
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v7 = (id)[v4 _copyForEnumerating];
  uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v27 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        int v12 = objc_msgSend(v11, "chat", v21);
        [v12 setContextInfo:0];
        [v11 deleteAllMessagesAndRemoveGroup];
        long long v13 = [v11 pinningIdentifier];
        if ([v13 length]) {
          [v6 addObject:v13];
        }
        [(NSMutableArray *)self->_trackedConversations removeObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v8);
  }

  if ([MEMORY[0x1E4F6BD70] processSupportsPinnedConversations])
  {
    if ([(CKConversationList *)self remergingConversations]) {
      goto LABEL_23;
    }
    long long v14 = [MEMORY[0x1E4F6BD70] sharedInstance];
    [v14 conversationsWereDeletedWithIdentifiers:v6];
  }
  else
  {
    long long v14 = IMLogHandleForCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
      -[CKConversationList deleteConversations:](v14);
    }
  }

LABEL_23:
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v15 = v4;
  uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
  if (v16)
  {
    uint64_t v17 = *(void *)v23;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v23 != v17) {
          objc_enumerationMutation(v15);
        }
        long long v19 = *(void **)(*((void *)&v22 + 1) + 8 * j);
        uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v21);
        [v20 postNotificationName:@"CKConversationListConversationLeftNotification" object:v19 userInfo:0];

        [v19 resetCaches];
        [v19 setPendingHandles:0];
      }
      uint64_t v16 = [v15 countByEnumeratingWithState:&v22 objects:v30 count:16];
    }
    while (v16);
  }
}

- (void)_abChanged:(id)a3
{
  id v4 = a3;
  [(CKConversationList *)self resetCaches];
  if (IMOSLoggingEnabled())
  {
    char v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "AB changed notification, updating caches", v6, 2u);
    }
  }
  [(CKConversationList *)self _postConversationListChangedNotification];
}

- (void)_invalidatePartialABCaches:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  char v5 = [v4 userInfo];
  id v6 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6CA90]];
  id v7 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6CA80]];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v20 = v6;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Received address book partial change notification for UID %@.", buf, 0xCu);
    }
  }
  if ([v7 isEqualToString:*MEMORY[0x1E4F6CA88]]) {
    [(CKConversationList *)self resetCaches];
  }
  if ([v6 length])
  {
    long long v16 = 0u;
    long long v17 = 0u;
    long long v14 = 0u;
    long long v15 = 0u;
    uint64_t v9 = [(CKConversationList *)self conversations];
    uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v15;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v15 != v11) {
            objc_enumerationMutation(v9);
          }
          long long v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          if ([v13 containsHandleWithUID:v6]) {
            [v13 resetCaches];
          }
        }
        uint64_t v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
      }
      while (v10);
    }
  }
}

- (void)_abPartialChanged:(id)a3
{
  id v5 = [a3 userInfo];
  id v4 = [v5 objectForKeyedSubscript:*MEMORY[0x1E4F6CA90]];
  [(CKConversationList *)self _postConversationListUpdateVisibleConversationsNotificationForUID:v4];
}

- (void)_handleChatParticipantsDidChange:(id)a3
{
  id v4 = a3;
  id v6 = [v4 object];
  id v5 = [(CKConversationList *)self _alreadyTrackedConversationForChat:v6];
  [v5 _handleChatParticipantsDidChange:v4];
}

- (void)_handleChatJoinStateDidChange:(id)a3
{
  id v4 = a3;
  id v6 = [v4 object];
  id v5 = [(CKConversationList *)self _alreadyTrackedConversationForChat:v6];
  [v5 _handleChatJoinStateDidChange:v4];
}

- (void)_handlePreferredServiceChangedNotification:(id)a3
{
  id v4 = a3;
  id v6 = [v4 object];
  id v5 = [(CKConversationList *)self _alreadyTrackedConversationForChat:v6];
  [v5 _handlePreferredServiceChangedNotification:v4];
}

- (void)_chatItemsDidChange:(id)a3
{
  id v4 = a3;
  id v6 = [v4 object];
  id v5 = [(CKConversationList *)self _alreadyTrackedConversationForChat:v6];
  [v5 _chatItemsDidChange:v4];
}

- (void)_handleEngroupFinishedUpdating:(id)a3
{
  id v4 = a3;
  id v6 = [v4 object];
  id v5 = [(CKConversationList *)self _alreadyTrackedConversationForChat:v6];
  [v5 _handleEngroupFinishedUpdating:v4];
}

- (void)_chatPropertiesChanged:(id)a3
{
  id v4 = a3;
  id v6 = [v4 object];
  id v5 = [(CKConversationList *)self _alreadyTrackedConversationForChat:v6];
  [v5 _chatPropertiesChanged:v4];
}

- (void)_handleChatsWillRemergeNotification:(id)a3
{
}

- (void)_handleChatsDidRemergeNotification:(id)a3
{
  [(CKConversationList *)self setRemergingConversations:0];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 postNotificationName:@"CKConversationListFinishedMergingChatsNotification" object:self];
}

- (void)_handleUpdatedMessagesWithSummariesNotification:(id)a3
{
  id v5 = a3;
  if ([MEMORY[0x1E4F6E790] messageSummarizationEnabled])
  {
    id v3 = [v5 userInfo];
    id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 postNotificationName:@"CKConversationListDidReceiveSummaries" object:0 userInfo:v3];
  }
}

- (id)pendingConversationCreatingIfNecessary
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKConversationList *)self pendingConversation];

  if (!v3)
  {
    id v4 = +[CKConversation newPendingConversation];
    [(CKConversationList *)self setPendingConversation:v4];

    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = [(CKConversationList *)self pendingConversation];
        int v9 = 138412290;
        uint64_t v10 = v6;
        _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "no current pendingConversation, creating one: %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  id v7 = [(CKConversationList *)self pendingConversation];

  return v7;
}

- (void)setPendingConversation:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = (CKConversation *)a3;
  pendingConversation = self->_pendingConversation;
  p_pendingConversation = &self->_pendingConversation;
  if (pendingConversation != v5)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        uint64_t v11 = v5;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "pendingConversation changed to: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    objc_storeStrong((id *)p_pendingConversation, a3);
    int v9 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v9 postNotificationName:@"CKConversationListPendingConversationChangedNotification" object:v5];
  }
}

- (id)_testingTrackedConversations
{
  trackedConversations = self->_trackedConversations;
  if (!trackedConversations)
  {
    id v4 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v5 = self->_trackedConversations;
    self->_trackedConversations = v4;

    trackedConversations = self->_trackedConversations;
  }

  return trackedConversations;
}

- (void)_handleMemoryWarning:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(26);
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Received memory warning, clearing caches", v6, 2u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal()) {
    _CKLogExternal();
  }
  [(CKConversationList *)self resetCaches];
}

- (void)_configureForOscarEnabledUnsortedConversationList
{
  id v3 = [(CKConversationList *)self _nonPlaceholderConversations];
  id v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = [MEMORY[0x1E4F1CA48] array];
  uint64_t v8 = MEMORY[0x1E4F143A8];
  uint64_t v9 = 3221225472;
  int v10 = __71__CKConversationList__configureForOscarEnabledUnsortedConversationList__block_invoke;
  uint64_t v11 = &unk_1E5622508;
  id v12 = v5;
  id v13 = v4;
  id v6 = v4;
  id v7 = v5;
  [v3 enumerateObjectsUsingBlock:&v8];
  -[CKConversationList _setConversations:forFilterMode:](self, "_setConversations:forFilterMode:", v6, 0, v8, v9, v10, v11);
  [(CKConversationList *)self _setConversations:v7 forFilterMode:9];
}

void __71__CKConversationList__configureForOscarEnabledUnsortedConversationList__block_invoke(uint64_t a1, void *a2)
{
  id v6 = a2;
  id v3 = [v6 chat];
  uint64_t v4 = [v3 isFiltered];

  uint64_t v5 = 40;
  if (v4 == 2) {
    uint64_t v5 = 32;
  }
  [*(id *)(a1 + v5) addObject:v6];
}

uint64_t __61__CKConversationList_updateConversationListsAndSortIfEnabled__block_invoke_2(uint64_t a1)
{
  return [*(id *)(a1 + 32) updateConversationFilteredFlagsAndReportSpam];
}

void __61__CKConversationList_updateConversationListsAndSortIfEnabled__block_invoke_3(uint64_t a1, void *a2)
{
  id v17 = a2;
  unint64_t v3 = [*(id *)(a1 + 32) primaryFilterModeForConversation:v17];
  uint64_t v4 = *(void **)(a1 + 40);
  uint64_t v5 = CKConversationListFilterModeStringValue(v3);
  id v6 = [v4 objectForKey:v5];
  [v6 addObject:v17];

  if (v3 != 6 && v3 != 9)
  {
    uint64_t v8 = *(void **)(a1 + 40);
    uint64_t v9 = CKConversationListFilterModeStringValue(1uLL);
    int v10 = [v8 objectForKey:v9];
    [v10 addObject:v17];

    uint64_t v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v12 = [v11 isSMSFilterSyncEnabled];

    char v13 = [v17 hasUnreadMessages];
    if (v12)
    {
      if ((v13 & 1) == 0 && ![v17 shouldHoldInUnreadFilter]
        || [v17 wasDetectedAsSMSSpam])
      {
        goto LABEL_6;
      }
    }
    else if ((v13 & 1) == 0 && ![v17 shouldHoldInUnreadFilter] {
           || [v17 spamCategory] == 2)
    }
    {
      goto LABEL_6;
    }
    [v17 setHoldInUnreadFilter:1];
    long long v14 = *(void **)(a1 + 40);
    long long v15 = CKConversationListFilterModeStringValue(8uLL);
    long long v16 = [v14 objectForKey:v15];
    [v16 addObject:v17];
  }
LABEL_6:
}

- (id)_emptyConversationsDictionaryWithConversationsCount:(unint64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [MEMORY[0x1E4F1CA60] dictionary];
  for (unint64_t i = 1; i != 10; ++i)
  {
    id v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
    uint64_t v8 = CKConversationListFilterModeStringValue(i);
    [v5 setObject:v7 forKey:v8];
  }
  uint64_t v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v10 = [v9 isSMSFilterSyncEnabled];

  if ((v10 & 1) == 0 || [(CKConversationList *)self _messageSpamFilteringEnabled])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    uint64_t v11 = [MEMORY[0x1E4F6E938] fetchSMSFilterExtensionParams];
    uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v12)
    {
      uint64_t v14 = *(void *)v24;
      *(void *)&long long v13 = 138412546;
      long long v22 = v13;
      do
      {
        for (uint64_t j = 0; j != v12; ++j)
        {
          if (*(void *)v24 != v14) {
            objc_enumerationMutation(v11);
          }
          long long v16 = *(void **)(*((void *)&v23 + 1) + 8 * j);
          if ((unint64_t)objc_msgSend(v16, "filterMode", v22) >= 0x10)
          {
            id v17 = CKConversationListFilterModeStringValue([v16 filterMode]);
            if (v17)
            {
              uint64_t v18 = (void *)[objc_alloc(MEMORY[0x1E4F1CA48]) initWithCapacity:a3];
              [v5 setObject:v18 forKey:v17];
            }
            else if (IMOSLoggingEnabled())
            {
              long long v19 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
              {
                uint64_t v20 = [v16 filterMode];
                *(_DWORD *)long long buf = v22;
                uint64_t v28 = 0;
                __int16 v29 = 2048;
                uint64_t v30 = v20;
                _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "%@ found for filterMode: %ld, this will result in empty sub-classification folder", buf, 0x16u);
              }
            }
          }
        }
        uint64_t v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
      }
      while (v12);
    }
  }

  return v5;
}

- (BOOL)conversation:(id)a3 includedInFilterMode:(unint64_t)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (v6)
  {
    [(CKConversationList *)self conversationsForFilterMode:a4];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v19;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v19 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          uint64_t v12 = objc_msgSend(v6, "chat", (void)v18);
          long long v13 = [v12 guid];
          uint64_t v14 = [v11 chat];
          long long v15 = [v14 guid];
          char v16 = [v13 isEqualToString:v15];

          if (v16)
          {
            LOBYTE(v8) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v7 countByEnumeratingWithState:&v18 objects:v22 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v8) = 0;
  }

  return v8;
}

- (unint64_t)primaryFilterModeForConversation:(id)a3
{
  id v4 = a3;
  if (IMIsOscarEnabled()
    && ([v4 chat],
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 isFiltered],
        v5,
        v6 == 2))
  {
    unint64_t v7 = 9;
  }
  else if ([(CKConversationList *)self _messageUnknownFilteringEnabled])
  {
    if ([(CKConversationList *)self _shouldTreatConversationAsNonSMSCategorized:v4])
    {
      unint64_t v7 = [(CKConversationList *)self _filterModeForConversationAsNonSMSCategorized:v4];
    }
    else if ([v4 spamSubCategory])
    {
      uint64_t v8 = [v4 spamSubCategory];
      unint64_t v7 = [v4 spamCategory] & 0xF | (16 * v8);
    }
    else
    {
      uint64_t v10 = [v4 spamCategory];
      unint64_t v7 = v10;
      if (v10 != 4)
      {
        if (v10 == 3)
        {
          unint64_t v7 = 5;
        }
        else if (IMIsOscarEnabled())
        {
          unint64_t v7 = 9;
        }
        else
        {
          unint64_t v7 = 6;
        }
      }
    }
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)_shouldTreatConversationAsNonSMSCategorized:(id)a3
{
  id v4 = a3;
  if (![(CKConversationList *)self _messageSpamFilteringEnabled]) {
    goto LABEL_9;
  }
  uint64_t v5 = [v4 chat];
  char v6 = [v5 isRecovered];

  if (v6) {
    goto LABEL_9;
  }
  unint64_t v7 = [v4 chat];
  if (![v7 isFiltered])
  {

LABEL_9:
    char v12 = 1;
    goto LABEL_10;
  }
  uint64_t v8 = [v4 chat];
  uint64_t v9 = [v8 isFiltered];

  if (v9 == 1) {
    goto LABEL_9;
  }
  uint64_t v10 = [v4 chat];
  int v11 = [v10 supportsFilteringExtensions];

  if (!v11 || ![v4 wasDetectedAsSMSCategory]) {
    goto LABEL_9;
  }
  char v12 = [v4 isKnownSender];
LABEL_10:

  return v12;
}

- (unint64_t)_filterModeForConversationAsNonSMSCategorized:(id)a3
{
  id v3 = a3;
  char v4 = [v3 hasSetWasKnownSender];
  int v5 = [v3 wasKnownSender];
  if ((v4 & 1) == 0) {
    int v5 = [v3 isKnownSender];
  }
  if (v5) {
    unint64_t v6 = 2;
  }
  else {
    unint64_t v6 = 3;
  }

  return v6;
}

- (id)subclassifiedConversationsForFilterMode:(unint64_t)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  int v5 = objc_opt_new();
  if (a3 == 4) {
    goto LABEL_4;
  }
  if (a3 == 5)
  {
    a3 = 3;
LABEL_4:
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    unint64_t v6 = objc_msgSend(MEMORY[0x1E4F6E938], "fetchSMSFilterExtensionParams", 0);
    uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v19;
      do
      {
        for (uint64_t i = 0; i != v7; ++i)
        {
          if (*(void *)v19 != v8) {
            objc_enumerationMutation(v6);
          }
          uint64_t v10 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v10 action] == a3)
          {
            int v11 = [(CKConversationList *)self conversationsDictionary];
            char v12 = CKConversationListFilterModeStringValue([v10 filterMode]);
            long long v13 = [v11 objectForKey:v12];

            if (v13) {
              [v5 addObjectsFromArray:v13];
            }
          }
        }
        uint64_t v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v7);
    }

    uint64_t v14 = [(CKConversationList *)self _conversationSortComparator];
    [v5 sortUsingComparator:v14];

    long long v15 = (void *)[v5 copy];
    goto LABEL_21;
  }
  if (IMOSLoggingEnabled())
  {
    char v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      unint64_t v24 = a3;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_INFO, "Filter action mapping shouldn't fail. Got filterAction: %lu, returning empty array", buf, 0xCu);
    }
  }
  long long v15 = (void *)MEMORY[0x1E4F1CBF0];
LABEL_21:

  return v15;
}

- (id)_filterConversationsByFocus:(id)a3
{
  return (id)objc_msgSend(a3, "__imArrayByFilteringWithBlock:", &__block_literal_global_287_0);
}

uint64_t __50__CKConversationList__filterConversationsByFocus___block_invoke(uint64_t a1, void *a2)
{
  return [a2 allowedByPersonListInActiveFocus];
}

- (id)_filterConversationsWithoutiMessageJunk:(id)a3
{
  return (id)objc_msgSend(a3, "__imArrayByFilteringWithBlock:", &__block_literal_global_289_0);
}

uint64_t __62__CKConversationList__filterConversationsWithoutiMessageJunk___block_invoke(uint64_t a1, void *a2)
{
  id v2 = [a2 chat];
  uint64_t v3 = [v2 isOscarChat] ^ 1;

  return v3;
}

- (id)_filterConversations:(id)a3 byHandleID:(id)a4 simID:(id)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  unint64_t v8 = (unint64_t)a4;
  unint64_t v9 = (unint64_t)a5;
  uint64_t v10 = (void *)v9;
  if (v8 | v9)
  {
    if (v8)
    {
      int v11 = v21;
      v21[0] = MEMORY[0x1E4F143A8];
      v21[1] = 3221225472;
      char v12 = __60__CKConversationList__filterConversations_byHandleID_simID___block_invoke;
      long long v13 = (void *)v8;
    }
    else
    {
      if (!v9)
      {
        id v15 = 0;
        goto LABEL_12;
      }
      int v11 = &v19;
      uint64_t v19 = MEMORY[0x1E4F143A8];
      uint64_t v20 = 3221225472;
      char v12 = __60__CKConversationList__filterConversations_byHandleID_simID___block_invoke_2;
      long long v13 = (void *)v9;
    }
    v11[2] = (uint64_t)v12;
    v11[3] = (uint64_t)&unk_1E5622550;
    v11[4] = (uint64_t)v13;
    char v16 = (id *)(v11 + 4);
    objc_msgSend(v7, "__imArrayByFilteringWithBlock:", v11);
    id v15 = (id)objc_claimAutoreleasedReturnValue();

LABEL_12:
    if (!objc_msgSend(v15, "count", v19, v20) && IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        unint64_t v23 = v8;
        __int16 v24 = 2112;
        uint64_t v25 = v10;
        _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_INFO, "SIM Filter | No conversations found for handleID: %@ simID: %@", buf, 0x16u);
      }
    }
    goto LABEL_17;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v14, OS_LOG_TYPE_INFO, "SIM Filter | handleID & simID are nil, do not apply any filter", buf, 2u);
    }
  }
  id v15 = v7;
LABEL_17:

  return v15;
}

uint64_t __60__CKConversationList__filterConversations_byHandleID_simID___block_invoke(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 lastAddressedHandle];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

uint64_t __60__CKConversationList__filterConversations_byHandleID_simID___block_invoke_2(uint64_t a1, void *a2)
{
  uint64_t v3 = [a2 lastAddressedSIMID];
  uint64_t v4 = [v3 isEqualToString:*(void *)(a1 + 32)];

  return v4;
}

- (void)removeConversation:(id)a3
{
  id v7 = a3;
  for (uint64_t i = 0; i != 10; ++i)
  {
    int v5 = [(CKConversationList *)self conversationsForFilterMode:i];
    unint64_t v6 = (void *)[v5 mutableCopy];

    [v6 removeObject:v7];
    [(CKConversationList *)self _setConversations:v6 forFilterMode:i];
  }
}

- (void)updateConversationsWasKnownSender
{
  if ([(CKConversationList *)self _messageUnknownFilteringEnabled])
  {
    id v3 = [(CKConversationList *)self conversations];
    [v3 enumerateObjectsUsingBlock:&__block_literal_global_292];
  }
}

uint64_t __55__CKConversationList_updateConversationsWasKnownSender__block_invoke(uint64_t a1, void *a2)
{
  return [a2 updateWasKnownSender];
}

- (BOOL)isHoldingWasKnownSenderUpdates
{
  return self->_holdingWasKnownSenderUpdates;
}

- (void)beginWasKnownSenderHold
{
  self->_holdingWasKnownSenderUpdates = 1;
}

- (void)releaseWasKnownSenderHold
{
  self->_holdingWasKnownSenderUpdates = 0;
}

- (void)clearHoldInUnreadFilter
{
  if ([(CKConversationList *)self _messageUnknownFilteringEnabled])
  {
    id v3 = [(CKConversationList *)self conversationsForFilterMode:8];
    [v3 enumerateObjectsUsingBlock:&__block_literal_global_294];
  }
}

uint64_t __45__CKConversationList_clearHoldInUnreadFilter__block_invoke(uint64_t a1, void *a2)
{
  return [a2 setHoldInUnreadFilter:0];
}

- (BOOL)_messageSpamFilteringEnabled
{
  return CKMessageSpamFilteringEnabled() != 0;
}

uint64_t __48__CKConversationList__recoverableSortComparator__block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v4 = a3;
  int v5 = [a2 chat];
  unint64_t v6 = [v5 latestRecoverableMessageDeletionDate];

  id v7 = [v4 chat];

  unint64_t v8 = [v7 latestRecoverableMessageDeletionDate];

  uint64_t v9 = [v8 compare:v6];
  return v9;
}

- (void)recoverableDeleteForConversations:(id)a3 deleteDate:(id)a4 synchronousQuery:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    long long v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v30 = v10;
      __int16 v31 = 2112;
      id v32 = v11;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Recently Deleted | -recoverableDeleteForConversations called with: %@ with deleteDate: %@", buf, 0x16u);
    }
  }
  [(CKConversationList *)self _updatePinnedConversationsControllerForRemovedConversations:v10];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v14 = (id)[v10 _copyForEnumerating];
  uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
  if (v15)
  {
    uint64_t v16 = *(void *)v25;
    do
    {
      uint64_t v17 = 0;
      do
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v14);
        }
        [*(id *)(*((void *)&v24 + 1) + 8 * v17++) prepareForRecoverableDeletionWithDeleteDate:v11];
      }
      while (v15 != v17);
      uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v28 count:16];
    }
    while (v15);
  }

  long long v18 = objc_msgSend(v10, "__imArrayByApplyingBlock:", &__block_literal_global_300);
  uint64_t v19 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  void v21[2] = __102__CKConversationList_recoverableDeleteForConversations_deleteDate_synchronousQuery_completionHandler___block_invoke_2;
  v21[3] = &unk_1E56225E0;
  BOOL v23 = v7;
  id v22 = v12;
  id v20 = v12;
  [v19 moveMessagesInChatsToRecentlyDeleted:v18 deleteDate:v11 synchronously:v7 completionHandler:v21];
}

uint64_t __102__CKConversationList_recoverableDeleteForConversations_deleteDate_synchronousQuery_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 chat];
}

void __102__CKConversationList_recoverableDeleteForConversations_deleteDate_synchronousQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  [v2 updateRecoverableMessagesMetadataSynchronously:*(unsigned __int8 *)(a1 + 40) completionHandler:*(void *)(a1 + 32)];
}

- (void)permanentlyDeleteRecoverableMessagesInConversations:(id)a3 synchronousQuery:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v8;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Recently Deleted | -permanentlyDeleteRecoverableMessagesInConversations called with: %@", buf, 0xCu);
    }
  }
  [(CKConversationList *)self _removeConversationsFromRecentlyDeleted:v8];
  [(CKConversationList *)self _deleteBrandLogosIfNeededForConversations:v8];
  id v11 = objc_msgSend(v8, "__imArrayByApplyingBlock:", &__block_literal_global_302);
  id v12 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __109__CKConversationList_permanentlyDeleteRecoverableMessagesInConversations_synchronousQuery_completionHandler___block_invoke_2;
  v14[3] = &unk_1E56225E0;
  BOOL v16 = v6;
  id v15 = v9;
  id v13 = v9;
  [v12 permanentlyDeleteRecoverableMessagesInChats:v11 synchronously:v6 completionHandler:v14];
}

uint64_t __109__CKConversationList_permanentlyDeleteRecoverableMessagesInConversations_synchronousQuery_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 chat];
}

void __109__CKConversationList_permanentlyDeleteRecoverableMessagesInConversations_synchronousQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  [v2 updateRecoverableMessagesMetadataSynchronously:*(unsigned __int8 *)(a1 + 40) completionHandler:*(void *)(a1 + 32)];
}

- (void)_deleteBrandLogosIfNeededForConversations:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v4)
  {
    uint64_t v5 = v4;
    uint64_t v6 = *(void *)v10;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v10 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v9 + 1) + 8 * i);
        if ([v8 isBusinessConversation]) {
          [v8 deleteBrandLogos];
        }
      }
      uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    }
    while (v5);
  }
}

- (void)_updatePinnedConversationsControllerForRemovedConversations:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Recently Deleted | updatingPinnedConversationsForRemovedConversations: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithBlock:&__block_literal_global_304];
  BOOL v7 = [v4 filteredArrayUsingPredicate:v6];
  id v8 = [v7 valueForKey:@"pinningIdentifier"];

  if (![(CKConversationList *)self remergingConversations])
  {
    long long v9 = [MEMORY[0x1E4F6BD70] sharedInstance];
    [v9 conversationsWereDeletedWithIdentifiers:v8];
  }
}

uint64_t __82__CKConversationList__updatePinnedConversationsControllerForRemovedConversations___block_invoke(uint64_t a1, void *a2)
{
  return [a2 isPinned];
}

- (void)recoverDeletedMessagesInConversations:(id)a3 synchronousQuery:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    int v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v18 = v8;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Recently Deleted | -recoverDeletedMessagesInConversations called with: %@", buf, 0xCu);
    }
  }
  [(CKConversationList *)self _removeConversationsFromRecentlyDeleted:v8];
  id v11 = objc_msgSend(v8, "__imArrayByApplyingBlock:", &__block_literal_global_309_0);
  uint64_t v12 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = __95__CKConversationList_recoverDeletedMessagesInConversations_synchronousQuery_completionHandler___block_invoke_2;
  v14[3] = &unk_1E56225E0;
  BOOL v16 = v6;
  id v15 = v9;
  id v13 = v9;
  [v12 recoverMessagesForChats:v11 synchronously:v6 completionHandler:v14];
}

uint64_t __95__CKConversationList_recoverDeletedMessagesInConversations_synchronousQuery_completionHandler___block_invoke(uint64_t a1, void *a2)
{
  return [a2 chat];
}

void __95__CKConversationList_recoverDeletedMessagesInConversations_synchronousQuery_completionHandler___block_invoke_2(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  [v2 updateRecoverableMessagesMetadataSynchronously:*(unsigned __int8 *)(a1 + 40) completionHandler:*(void *)(a1 + 32)];
}

- (void)_removeConversationsFromRecentlyDeleted:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKConversationList *)self conversationsForFilterMode:7];
  id v6 = (id)[v5 mutableCopy];

  [v6 removeObjectsInArray:v4];
  [(CKConversationList *)self _setConversations:v6 forFilterMode:7];
}

- (void)recoverJunkMessagesInConversations:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "Junk Messages | -recoverJunkMessagesInConversations called with: %@", buf, 0xCu);
    }
  }
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = __57__CKConversationList_recoverJunkMessagesInConversations___block_invoke;
  v9[3] = &unk_1E5622608;
  v9[4] = self;
  [v4 enumerateObjectsUsingBlock:v9];
  id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
  int v10 = @"CKConversationListRecoveredJunkConversationIdentifiersUserInfoKey";
  BOOL v7 = [(CKConversationList *)self identifiersSetForConversations:v4];
  id v11 = v7;
  id v8 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  [v6 postNotificationName:@"CKConversationListDidRecoverJunkConversationsNotification" object:0 userInfo:v8];
}

void __57__CKConversationList_recoverJunkMessagesInConversations___block_invoke(uint64_t a1, void *a2)
{
  id v10 = a2;
  id v3 = [v10 chat];
  [v3 recoverFromJunk];

  id v4 = [v10 sendingService];
  uint64_t v5 = [MEMORY[0x1E4F6BDB8] iMessageService];

  if (v4 == v5)
  {
    BOOL v7 = *(void **)(a1 + 32);
    id v6 = [v10 lastAddressedHandle];
    id v8 = [v10 chat];
    id v9 = [v8 participants];
    [v7 _trackSendEventForMySenderID:v6 andParticipants:v9];
  }
  else
  {
    id v6 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v6 trackiMessageJunkEvent:6];
  }
}

- (id)identifiersSetForConversations:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA80];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v3, "setWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __53__CKConversationList_identifiersSetForConversations___block_invoke;
  v8[3] = &unk_1E5622608;
  id v6 = v5;
  id v9 = v6;
  [v4 enumerateObjectsUsingBlock:v8];

  return v6;
}

void __53__CKConversationList_identifiersSetForConversations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v4 = [a2 chat];
  id v3 = [v4 guid];
  [v2 addObject:v3];
}

- (void)updateEarliestMessageDateForConversations:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1CA48];
  id v4 = a3;
  uint64_t v5 = objc_msgSend(v3, "arrayWithCapacity:", objc_msgSend(v4, "count"));
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  void v8[2] = __64__CKConversationList_updateEarliestMessageDateForConversations___block_invoke;
  v8[3] = &unk_1E5622608;
  id v9 = v5;
  id v6 = v5;
  [v4 enumerateObjectsUsingBlock:v8];

  BOOL v7 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  [v7 updateEarliestMessageDateForChats:v6 completion:0];
}

void __64__CKConversationList_updateEarliestMessageDateForConversations___block_invoke(uint64_t a1, void *a2)
{
  id v2 = *(void **)(a1 + 32);
  id v3 = [a2 chat];
  [v2 addObject:v3];
}

- (void)_trackSendEventForMySenderID:(id)a3 andParticipants:(id)a4
{
  v20[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 count];
  if (v7 && v7 <= 1)
  {
    id v8 = [v6 firstObject];
    id v9 = [v8 ID];

    id v10 = [NSNumber numberWithInt:0xFFFFFFFFLL];
    uint64_t v11 = MEMORY[0x192FBA6E0](v9);
    if (v11 && MEMORY[0x192FBA6E0](v5))
    {
      uint64_t v12 = NSNumber;
      id v13 = IMCountryCodeForNumber();
      uint64_t v14 = IMCountryCodeForNumber();
      uint64_t v15 = objc_msgSend(v12, "numberWithBool:", objc_msgSend(v13, "isEqualToString:", v14));

      id v10 = (void *)v15;
    }
    BOOL v16 = [MEMORY[0x1E4F6E890] sharedInstance];
    v19[0] = &unk_1EDF16148;
    uint64_t v17 = [NSNumber numberWithBool:v11];
    v19[1] = &unk_1EDF16160;
    v20[0] = v17;
    v20[1] = v10;
    id v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
    [v16 trackiMessageJunkEvent:7 withDictionary:v18];
  }
}

- (BOOL)loadedConversations
{
  return self->_loadedConversations;
}

- (BOOL)remergingConversations
{
  return self->_remergingConversations;
}

- (void)setRemergingConversations:(BOOL)a3
{
  self->_remergingConversations = a3;
}

- (int64_t)simFilterIndex
{
  return self->_simFilterIndex;
}

- (void)setSimFilterIndex:(int64_t)a3
{
  self->_simFilterIndex = a3;
}

- (void)setHoldingWasKnownSenderUpdates:(BOOL)a3
{
  self->_holdingWasKnownSenderUpdates = a3;
}

- (void)setTrackedConversations:(id)a3
{
}

- (void)setConversationsDictionary:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_conversationsDictionary, 0);
  objc_storeStrong((id *)&self->_trackedConversations, 0);
  objc_storeStrong((id *)&self->_pinnedConversations, 0);
  objc_storeStrong((id *)&self->_scrollingController, 0);

  objc_storeStrong((id *)&self->_pendingConversation, 0);
}

- (void)updatePinnedConversationsFromDataSourceWithConversationFetch:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Ignoring request to update pinned conversations from data source from a process that does not support pinned conversations.", v1, 2u);
}

- (void)deleteConversations:(os_log_t)log .cold.1(os_log_t log)
{
  *(_WORD *)v1 = 0;
  _os_log_error_impl(&dword_18EF18000, log, OS_LOG_TYPE_ERROR, "Deleting conversations from a process that does not support pinning may leave the deleted conversation pinned.", v1, 2u);
}

@end