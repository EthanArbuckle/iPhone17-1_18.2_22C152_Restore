@interface IMChatRegistry
+ (BOOL)hasInitializedChatFiltering;
+ (Class)messageClass;
+ (IMChatRegistry)sharedRegistry;
+ (IMChatRegistry)sharedRegistryIfAvailable;
+ (id)performanceLogHandle;
+ (void)setHasInitializedChatFiltering:(BOOL)a3;
+ (void)setMessageClass:(Class)a3;
- (BOOL)_hasChat:(id)a3 forService:(id)a4;
- (BOOL)_isLoading;
- (BOOL)_nicknameSharingEnabled;
- (BOOL)_postMessageSentNotifications;
- (BOOL)_shouldShareMeCardForAlwaysAskAudienceWithChat:(id)a3;
- (BOOL)_shouldShareMeCardForContactsOnlyAudienceWithChat:(id)a3;
- (BOOL)_shouldSwitchAccountAddingMessagesToChat:(id)a3 messageItems:(id)a4 removedGUIDs:(id)a5 messagesComingFromStorage:(BOOL)a6 chatProperties:(id)a7;
- (BOOL)_updateAutoDonationBehavior:(int64_t)a3 forChat:(id)a4 shouldPostNotification:(BOOL)a5;
- (BOOL)blackholedChatsExist;
- (BOOL)daemonHadTerminated;
- (BOOL)filterediMessageChatsExist;
- (BOOL)isFirstLoad;
- (BOOL)isInternalInstall;
- (BOOL)loading;
- (BOOL)processingChatCacheMiss;
- (BOOL)wantsHistoryReload;
- (IMChatRegistry)init;
- (IMContactStore)contactStore;
- (IMDaemonController)daemonController;
- (IMDaemonProtocol)remoteDaemon;
- (IMDaemonQueryController)daemonQueryController;
- (IMSharedWithYouManager)sharedWithYouManager;
- (IMTimer)markAsReadTimer;
- (NSArray)allExistingChats;
- (NSArray)cachedChats;
- (NSArray)preExistingAllChats;
- (NSArray)serviceNamesForChatIdentifierSearch;
- (NSArray)simulatedChats;
- (NSDictionary)filterCategoryToEarliestInitiallyFetchedLastMessageDate;
- (NSMutableArray)allChatsInProcess;
- (NSMutableArray)cachedChatsInThreadNameMap;
- (NSMutableDictionary)chatGUIDToChatMap;
- (NSMutableDictionary)chatGUIDToCurrentThreadMap;
- (NSMutableDictionary)chatGUIDToInfoMap;
- (NSMutableDictionary)chatGUIDToiMessageSentOrReceivedMap;
- (NSMutableDictionary)chatPersonIDToChatMap;
- (NSMutableDictionary)chatsBeingLoadedMap;
- (NSMutableDictionary)groupIDToChatMap;
- (NSMutableDictionary)groupParticipantToChatsMap;
- (NSMutableDictionary)simulatedChatGUIDToChatMap;
- (NSMutableDictionary)threadNameToChatMap;
- (NSSet)registryChangeHistoryChatsToObserve;
- (NSSet)registryChangeHistoryChatsToUnregister;
- (NSString)historyModificationStamp;
- (NSUserActivity)userActivity;
- (OS_dispatch_queue)contactStoreQueue;
- (TUConversationManager)conversationManager;
- (double)timerStartTimeInterval;
- (id)_activeTUConversations;
- (id)_bestChatForHandleIDs:(id)a3;
- (id)_cachedChatForChatDictionary:(id)a3 participants:(id)a4 participantHash:(id)a5;
- (id)_cachedChatWithDisplayName:(id)a3;
- (id)_cachedChatWithGUID:(id)a3;
- (id)_cachedChatWithGroupID:(id)a3;
- (id)_cachedChatWithHandle:(id)a3;
- (id)_cachedChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7;
- (id)_cachedChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7 findMatchingNamedGroups:(BOOL)a8;
- (id)_cachedChatWithIdentifier:(id)a3;
- (id)_cachedChatWithIdentifier:(id)a3 style:(unsigned __int8)a4;
- (id)_cachedChatWithPersonID:(id)a3;
- (id)_cachedChatsWithDisplayName:(id)a3;
- (id)_cachedChatsWithMessage:(id)a3;
- (id)_cachedChatsWithMessageGUID:(id)a3;
- (id)_cachedGroupChatForGroupChatDictionary:(id)a3 participants:(id)a4 participantHash:(id)a5;
- (id)_cachedOneToOneChatForChatDictionary:(id)a3 participants:(id)a4 participantHash:(id)a5;
- (id)_chatForIdentifiers:(id)a3;
- (id)_chatPredicateForGUIDs:(id)a3;
- (id)_chatsMatchingHandles:(id)a3;
- (id)_chatsMatchingStatusSubscription:(id)a3;
- (id)_copyMergedChatsPairedArrayFromMergedChatsArray:(id)a3;
- (id)_earliestLastMessageDateFromChatDictionaries:(id)a3;
- (id)_eventForMessage:(id)a3;
- (id)_existingChatForHandleUsingPersonID:(id)a3;
- (id)_existingChatForTUConversation:(id)a3;
- (id)_existingChatFromSiblingsForHandle:(id)a3;
- (id)_existingChatWithHandle:(id)a3 fixChatHandle:(BOOL)a4;
- (id)_existingChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 account:(id)a5;
- (id)_existingChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 service:(id)a5;
- (id)_inPersonFromIMHandle:(id)a3 isMe:(BOOL)a4;
- (id)_inPersonHandleFromIMHandle:(id)a3 contact:(id)a4;
- (id)_inPersonNameForContact:(id)a3 imHandle:(id)a4;
- (id)_interactionForMessage:(id)a3 inChat:(id)a4;
- (id)_lastMessageDateForQueryFromChatDictionary:(id)a3;
- (id)_lastMessageItemForChatDictionary:(id)a3;
- (id)_ownerHandleStringsFromSubscription:(id)a3;
- (id)_participantsForChatDictionary:(id)a3;
- (id)_performChatCacheLookupWithBlock:(id)a3 cacheMissQueryKey:(id)a4 queryBlock:(id)a5;
- (id)_performSingleChatCacheLookupWithBlock:(id)a3 cacheMissQueryKey:(id)a4 queryBlock:(id)a5;
- (id)_possiblyUnregisteredCachedChatForRoom:(id)a3 onAccount:(id)a4;
- (id)_possiblyUnregisteredCachedChatWithHandle:(id)a3;
- (id)_possiblyUnregisteredCachedChatWithHandles:(id)a3 style:(unsigned __int8)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7;
- (id)_possiblyUnregisteredCachedChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 account:(id)a5;
- (id)_processLoadedChatDictionaries:(id)a3;
- (id)_sendMessageInteractionForMessage:(id)a3 inChat:(id)a4;
- (id)_sortedParticipantIDHashForParticipants:(id)a3;
- (id)_sortedParticipantIDHashForParticipants:(id)a3 usesPersonCentricID:(BOOL)a4;
- (id)_unsendMessageInteractionForMessage:(id)a3 inChat:(id)a4;
- (id)activeCallForConversationUUID:(id)a3;
- (id)allGUIDsForChat:(id)a3;
- (id)chatDictionariesForChat:(id)a3;
- (id)chatForFaceTimeConversation:(id)a3;
- (id)chatForFaceTimeRecipientIDs:(id)a3;
- (id)chatForIMHandle:(id)a3;
- (id)chatForIMHandles:(id)a3;
- (id)chatForIMHandles:(id)a3 chatName:(id)a4;
- (id)chatForIMHandles:(id)a3 chatName:(id)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6;
- (id)chatForIMHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5;
- (id)chatForIMHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5 lastAddressedHandle:(id)a6 lastAddressedSIMID:(id)a7;
- (id)chatForIMHandles:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5;
- (id)chatForRoom:(id)a3 onAccount:(id)a4;
- (id)chatForURL:(id)a3 outMessageText:(id *)a4 outRecipientIDs:(id *)a5 outService:(id *)a6 outMessageGUID:(id *)a7;
- (id)chatForURL:(id)a3 outMessageText:(id *)a4 outRecipientIDs:(id *)a5 outService:(id *)a6 outMessageGUID:(id *)a7 presentOverlay:(BOOL *)a8;
- (id)chatForURL:(id)a3 outMessageText:(id *)a4 outRecipientIDs:(id *)a5 outService:(id *)a6 outMessageGUID:(id *)a7 presentOverlay:(BOOL *)a8 outSIMID:(id *)a9;
- (id)chatWithHandle:(id)a3;
- (id)chatWithHandle:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5;
- (id)chatWithHandles:(id)a3;
- (id)chatWithHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5;
- (id)chatWithHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5 findMatchingNamedGroups:(BOOL)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8;
- (id)chatWithHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5 lastAddressedHandle:(id)a6 lastAddressedSIMID:(id)a7;
- (id)chatWithHandles:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5;
- (id)chatsWithMyself;
- (id)existingChatForIMHandle:(id)a3;
- (id)existingChatForIMHandle:(id)a3 allowRetargeting:(BOOL)a4;
- (id)existingChatForIMHandle:(id)a3 allowRetargeting:(BOOL)a4 fixChatHandle:(BOOL)a5;
- (id)existingChatForIMHandles:(id)a3;
- (id)existingChatForIMHandles:(id)a3 allowRetargeting:(BOOL)a4;
- (id)existingChatForIMHandles:(id)a3 allowRetargeting:(BOOL)a4 groupID:(id)a5;
- (id)existingChatForIMHandles:(id)a3 allowRetargeting:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 ignoresDisplayName:(BOOL)a7 joinedChatsOnly:(BOOL)a8;
- (id)existingChatForIMHandles:(id)a3 allowRetargeting:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7;
- (id)existingChatForRoom:(id)a3 onAccount:(id)a4;
- (id)existingChatForRoom:(id)a3 onAccount:(id)a4 allowRetargeting:(BOOL)a5;
- (id)existingChatWithAddresses:(id)a3 allowAlternativeService:(BOOL)a4 bestHandles:(id *)a5;
- (id)existingChatWithChatIdentifier:(id)a3;
- (id)existingChatWithContacts:(id)a3 bestHandles:(id *)a4;
- (id)existingChatWithDeviceIndependentID:(id)a3;
- (id)existingChatWithDisplayName:(id)a3;
- (id)existingChatWithGUID:(id)a3;
- (id)existingChatWithGroupID:(id)a3;
- (id)existingChatWithHandle:(id)a3;
- (id)existingChatWithHandle:(id)a3 allowAlternativeService:(BOOL)a4;
- (id)existingChatWithHandles:(id)a3;
- (id)existingChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4;
- (id)existingChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4 groupID:(id)a5;
- (id)existingChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7;
- (id)existingChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7 findMatchingNamedGroups:(BOOL)a8;
- (id)existingChatWithPersonID:(id)a3;
- (id)existingChatWithPinningIdentifier:(id)a3;
- (id)existingChatsWithGUIDs:(id)a3;
- (id)existingConversationForFaceTimeConversationUUID:(id)a3;
- (id)generateUnusedChatIdentifierForGroupChatWithAccount:(id)a3;
- (id)initAsListener:(BOOL)a3;
- (id)messagesURLWithChat:(id)a3;
- (id)messagesURLWithChat:(id)a3 orHandles:(id)a4 withMessageText:(id)a5;
- (id)messagesURLWithMessageGUID:(id)a3;
- (id)performanceLogHandle;
- (id)unblackholeAndLoadChatWithIMHandles:(id)a3;
- (id)unblackholeChatWithHandles:(id)a3;
- (int64_t)_winningJoinStateForExistingChat:(id)a3 incomingDictionary:(id)a4;
- (int64_t)lastFailedMessageDate;
- (unint64_t)_defaultNumberOfMessagesToLoad;
- (unint64_t)_nicknameSharingAudience;
- (unint64_t)numberOfCachedChats;
- (unint64_t)numberOfExistingChats;
- (unint64_t)unreadCount;
- (void)_IMChatGetIdentifiersAndServicesTestHookWithChatRegistry:(id)a3 chat:(id)a4 identifiers:(id *)a5 services:(id *)a6 personCentricEnabled:(BOOL)a7;
- (void)__handleChatReconstructions:(id)a3;
- (void)__handleMergedChatReconstructions:(id)a3;
- (void)_account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messagesUpdated:(id)a7;
- (void)_account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messagesUpdated:(id)a7 suppressNotification:(BOOL)a8;
- (void)_addChat:(id)a3 participantSet:(id)a4;
- (void)_asyncSetChatBotUserActivityForChat:(id)a3 message:(id)a4;
- (void)_automation_markAsReadQuery:(id)a3 finishedWithResult:(BOOL)a4;
- (void)_batchFetchRemainingContactsOnLaunch;
- (void)_chat:(id)a3 cancelScheduledMessageWithGUID:(id)a4 destinations:(id)a5 cancelType:(unint64_t)a6;
- (void)_chat:(id)a3 editScheduledMessageItem:(id)a4 previousMessageItem:(id)a5 partIndex:(int64_t)a6 editType:(unint64_t)a7;
- (void)_chat:(id)a3 editScheduledMessageItem:(id)a4 previousMessageItem:(id)a5 retractingPartIndexes:(id)a6;
- (void)_chat:(id)a3 inviteParticipants:(id)a4 reason:(id)a5;
- (void)_chat:(id)a3 joinWithProperties:(id)a4;
- (void)_chat:(id)a3 joinWithProperties:(id)a4 guid:(id)a5;
- (void)_chat:(id)a3 removeParticipants:(id)a4 reason:(id)a5;
- (void)_chat:(id)a3 repositionSticker:(id)a4;
- (void)_chat:(id)a3 resendEditedMessageItem:(id)a4 partIndex:(int64_t)a5 withBackwardCompatabilityText:(id)a6;
- (void)_chat:(id)a3 retryGroupPhotoUpload:(id)a4;
- (void)_chat:(id)a3 sendEditedMessageItem:(id)a4 previousMessageItem:(id)a5 partIndex:(int64_t)a6 editType:(unint64_t)a7 backwardCompatabilityText:(id)a8;
- (void)_chat:(id)a3 sendGroupPhotoUpdate:(id)a4;
- (void)_chat:(id)a3 sendMessage:(id)a4;
- (void)_chat:(id)a3 sendMessage:(id)a4 withAccount:(id)a5;
- (void)_chat:(id)a3 sendNotifyRecipientCommandForMessage:(id)a4;
- (void)_chat:(id)a3 sendPlayedReceiptForMessage:(id)a4;
- (void)_chat:(id)a3 sendReadReceiptForMessages:(id)a4;
- (void)_chat:(id)a3 sendSavedReceiptForMessage:(id)a4;
- (void)_chat:(id)a3 sendSyndicationAction:(id)a4;
- (void)_chat:(id)a3 sendUpdatedCollaborationMetadata:(id)a4 forMessageGUID:(id)a5;
- (void)_chat:(id)a3 setPlayedExpressiveSendForMessage:(id)a4;
- (void)_chat:(id)a3 setProperties:(id)a4 ofParticipant:(id)a5;
- (void)_chat:(id)a3 setValue:(id)a4 forChatProperty:(id)a5;
- (void)_chat:(id)a3 updateDisplayName:(id)a4;
- (void)_chat:(id)a3 updateIsBlackholed:(BOOL)a4;
- (void)_chat:(id)a3 updateIsDeletingIncomingMessages:(BOOL)a4;
- (void)_chat:(id)a3 updateIsFiltered:(int64_t)a4;
- (void)_chat:(id)a3 updateIsRecovered:(BOOL)a4;
- (void)_chat:(id)a3 updateLastAddressedHandle:(id)a4;
- (void)_chat:(id)a3 updateLastAddressedSIMID:(id)a4;
- (void)_chatLoadedWithChatIdentifier:(id)a3 chats:(id)a4;
- (void)_chat_clearHistory:(id)a3 beforeGUID:(id)a4 afterGUID:(id)a5 queryID:(id)a6;
- (void)_chat_closeSession:(id)a3 didDeleteConversation:(BOOL)a4;
- (void)_chat_declineInvitation:(id)a3;
- (void)_chat_downloadPurgedAttachmentsForChat:(id)a3;
- (void)_chat_fetchHistorySummary:(id)a3 dateInterval:(id)a4 synchronous:(BOOL)a5 queryID:(id)a6 completion:(id)a7;
- (void)_chat_fetchIncomingPendingMessagesOverSatellite:(id)a3;
- (void)_chat_fetchOldestMessageDateForChat:(id)a3 synchronous:(BOOL)a4 queryID:(id)a5 completion:(id)a6;
- (void)_chat_isDownloadingPurgedAssetsForChat:(id)a3 queryID:(id)a4 loadImmediately:(BOOL)a5;
- (void)_chat_leave:(id)a3;
- (void)_chat_loadAttachments:(id)a3 queryID:(id)a4 loadImmediately:(BOOL)a5;
- (void)_chat_loadFrequentReplies:(id)a3 limit:(unint64_t)a4 queryID:(id)a5 loadImmediately:(BOOL)a6;
- (void)_chat_loadHistory:(id)a3 limit:(unint64_t)a4 beforeGUID:(id)a5 afterGUID:(id)a6 threadIdentifier:(id)a7 queryID:(id)a8 synchronous:(BOOL)a9 completion:(id)a10;
- (void)_chat_loadPagedHistory:(id)a3 numberOfMessagesBefore:(unint64_t)a4 numberOfMessagesAfter:(unint64_t)a5 messageGUID:(id)a6 threadIdentifier:(id)a7 queryID:(id)a8 synchronous:(BOOL)a9 completion:(id)a10;
- (void)_chat_loadUncachedAttachmentsCount:(id)a3 queryID:(id)a4 loadImmediately:(BOOL)a5;
- (void)_chat_loadUnreadMessages:(id)a3 limit:(unint64_t)a4 fallbackGUID:(id)a5 queryID:(id)a6 loadImmediately:(BOOL)a7;
- (void)_chat_markAsSpam:(id)a3 queryID:(id)a4 autoReport:(BOOL)a5 isJunkReportedToCarrier:(BOOL)a6 reportReason:(unint64_t)a7;
- (void)_chat_markAsSpam:(id)a3 queryID:(id)a4 isJunkReportedToCarrier:(BOOL)a5;
- (void)_chat_markAsSpamAutomatically:(id)a3;
- (void)_chat_markLastMessageAsUnread:(id)a3;
- (void)_chat_markRepliedForMessageGUID:(id)a3;
- (void)_chat_recoverFromJunk:(id)a3;
- (void)_chat_remove:(id)a3;
- (void)_chat_sendReadReceiptForAllMessages:(id)a3;
- (void)_chat_storeItem:(id)a3 inChat:(id)a4;
- (void)_checkIfItemIsCorrupt:(id)a3;
- (void)_checkLimitAndSetMessagesToKeepLoadedIfNeeded:(unint64_t)a3 chat:(id)a4;
- (void)_clearExistingTypingIndicatorsWithMessageGUID:(id)a3 excludingChatWithIdentifier:(id)a4;
- (void)_clearMapsUsingChat:(id)a3 guids:(id)a4;
- (void)_completeChatLoadQueryWithChat:(id)a3 queryID:(id)a4;
- (void)_completedMovingChatsToRecentlyDeleted:(id)a3 deletionDate:(id)a4;
- (void)_completedRecoveringChatsFromRecentlyDeleted:(id)a3;
- (void)_daemonBeganDeferredSetup;
- (void)_daemonCompletedDeferredSetup;
- (void)_daemonReallyDied:(id)a3;
- (void)_enumerateChatGUIDPermutationsForChatIdentifier:(id)a3 includingInstantMessageStyle:(BOOL)a4 includingGroupStyle:(BOOL)a5 includingRoomStyle:(BOOL)a6 usingBlock:(id)a7;
- (void)_fetchInitialBatchOfContactsOnLaunch;
- (void)_handleAddressBookChange:(id)a3;
- (void)_handleAvailabilityChangedNotification:(id)a3;
- (void)_handleAvailabilityInvitationReceivedNotification:(id)a3;
- (void)_handleAvailabilityStateChangedNotification:(id)a3;
- (void)_handleCachingAliasToCNIDMap:(id)a3;
- (void)_handleChatParticipantsDidChange:(id)a3;
- (void)_handleChatReconstructions:(id)a3;
- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3;
- (void)_handleMergedChatReconstructions:(id)a3;
- (void)_handleOffGridChangedNotification:(id)a3;
- (void)_handleOffGridInvitationReceivedNotification:(id)a3;
- (void)_handleOffGridStateChangedNotification:(id)a3;
- (void)_handleStatusChangedForSubscription:(id)a3;
- (void)_handleStatusInvitationReceivedForSubscription:(id)a3;
- (void)_handleStatusStateChangedForSubscription:(id)a3;
- (void)_loadAllSiblingChatsForHandlesAssociatedWithChats:(id)a3 waitForReply:(BOOL)a4 completionHandler:(id)a5;
- (void)_loadChatsFilteredUsingPredicate:(id)a3 lastMessageOlderThan:(id)a4 limit:(unint64_t)a5 waitForReply:(BOOL)a6 completionHandler:(id)a7;
- (void)_loadSiblingsForChatIfNeeded:(id)a3;
- (void)_markHasHadSuccessfulQueryForChat:(id)a3;
- (void)_noteChatDealloc:(id)a3;
- (void)_noteChatInit:(id)a3;
- (void)_postMultiWayStateChangedNotification:(id)a3;
- (void)_previouslyBlackholedChatLoadedWithHandleIDs:(id)a3 chat:(id)a4;
- (void)_processMessageForAccount:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 message:(id)a9;
- (void)_processMessagesForAccount:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messages:(id)a9 removed:(id)a10 messagesComingFromStorage:(BOOL)a11;
- (void)_recalculateServiceNamesForChatIdentifierSearch;
- (void)_registerChat:(id)a3 isIncoming:(BOOL)a4 guid:(id)a5;
- (void)_registerChatDictionary:(id)a3 forChat:(id)a4 isIncoming:(BOOL)a5 newGUID:(id)a6;
- (void)_registerChatDictionary:(id)a3 forChat:(id)a4 isIncoming:(BOOL)a5 newGUID:(id)a6 shouldPostNotification:(BOOL)a7;
- (void)_removeFromGroupParticipantToChatsMap:(id)a3;
- (void)_resetChatReconstructionGroupMaps;
- (void)_resetChatRegistry;
- (void)_setChatHasCommunicatedOveriMessage:(id)a3;
- (void)_setDefaultNumberOfMessagesToLoad:(unint64_t)a3;
- (void)_setMeCardSharingOnMessage:(id)a3 forChat:(id)a4;
- (void)_setPostMessageSentNotifications:(BOOL)a3;
- (void)_setReplyToGuidOnMessage:(id)a3 forChat:(id)a4;
- (void)_setSimulatedChats:(id)a3;
- (void)_trackUsageForMessage:(id)a3;
- (void)_unregisterChat:(id)a3;
- (void)_unregisterChatWithGUID:(id)a3;
- (void)_updateBlackholedChatsExist:(BOOL)a3;
- (void)_updateChat:(id)a3 groupID:(id)a4 shouldPostNotification:(BOOL)a5;
- (void)_updateChat:(id)a3 originalGroupID:(id)a4 shouldPostNotification:(BOOL)a5;
- (void)_updateChat:(id)a3 updateIsFiltered:(int64_t)a4;
- (void)_updateChatAutoDonationBehavior:(id)a3 withInfo:(id)a4 shouldPostNotification:(BOOL)a5;
- (void)_updateFilterediMessageChatsExist:(BOOL)a3;
- (void)_updateHasCancellableScheduledMessage:(id)a3 shouldPostNotification:(BOOL)a4;
- (void)_updateInfo:(id)a3 forGUID:(id)a4 updatingUnreadCount:(BOOL)a5;
- (void)_updateInfo:(id)a3 forGUID:(id)a4 updatingUnreadCount:(BOOL)a5 shouldPostNotifications:(BOOL)a6;
- (void)_updateIsDownloadingPendingSatelliteMessages:(id)a3 shouldPostNotification:(BOOL)a4;
- (void)_updatePendingIncomingSatelliteMessageCount:(id)a3 shouldPostNotification:(BOOL)a4;
- (void)_updatePersonCentricIDForChat:(id)a3;
- (void)_updatePersonCentricIDToChatMapForChat:(id)a3 toNewPersonCentricID:(id)a4;
- (void)_updateReplySuggestions:(id)a3 withInfo:(id)a4;
- (void)_updateUnreadCountForChat:(id)a3;
- (void)_updateUnreadCountForChat:(id)a3 shouldPostNotification:(BOOL)a4;
- (void)_validateChatQueryResults:(id)a3 matchCurrentCacheResults:(id)a4;
- (void)_verifyChatMergeWithChat:(id)a3 dictionary:(id)a4;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 chatPersonCentricID:(id)a7 member:(id)a8 statusChanged:(int)a9;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 error:(id)a7;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 initialEmergencyQuestionnaireReceived:(id)a9;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messageReceived:(id)a9;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messageSent:(id)a9;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messagesReceived:(id)a9 removed:(id)a10 messagesComingFromStorage:(BOOL)a11;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 statusChanged:(int)a9 handleInfo:(id)a10;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 invitationReceived:(id)a7;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messageUpdated:(id)a7;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messageUpdated:(id)a7 suppressNotification:(BOOL)a8;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messagesUpdated:(id)a7;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 notifySentMessage:(id)a7 sendTime:(id)a8 isReplicating:(BOOL)a9;
- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 updateProperties:(id)a7;
- (void)account:(id)a3 handleID:(id)a4 updatedLastReceivedOnGridMessageDate:(id)a5;
- (void)attachmentQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6;
- (void)blackholedChatsExist:(BOOL)a3;
- (void)capabilitiesUpdatedForHandle:(id)a3;
- (void)chat:(id)a3 chatPersonCentricID:(id)a4 displayNameUpdated:(id)a5;
- (void)chat:(id)a3 chatPersonCentricID:(id)a4 displayNameUpdated:(id)a5 sender:(id)a6;
- (void)chat:(id)a3 engramIDUpdated:(id)a4;
- (void)chat:(id)a3 isDeletingIncomingMessagesUpdated:(BOOL)a4;
- (void)chat:(id)a3 isFilteredUpdated:(int64_t)a4;
- (void)chat:(id)a3 isRecoveredUpdated:(BOOL)a4;
- (void)chat:(id)a3 lastAddressedHandleUpdated:(id)a4;
- (void)chat:(id)a3 lastAddressedHandleUpdated:(id)a4 lastAddressedSIMIDUpdated:(id)a5;
- (void)chat:(id)a3 lastAddressedSIMIDUpdated:(id)a4;
- (void)chat:(id)a3 lastMessageTimeStampOnLoadUpdated:(double)a4;
- (void)chat:(id)a3 propertiesUpdated:(id)a4;
- (void)chat:(id)a3 uncachedAttachmentCountUpdated:(id)a4;
- (void)chat:(id)a3 updated:(id)a4;
- (void)chatLoadedWithChatIdentifier:(id)a3 chats:(id)a4;
- (void)chatsNeedRemerging:(id)a3 groupedChats:(id)a4;
- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 activitySessionsChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4;
- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4;
- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4;
- (void)dealloc;
- (void)downloadedPurgedAssetBatchForChatIDs:(id)a3 completedTransferGUIDs:(id)a4;
- (void)engroupParticipantsUpdatedForChat:(id)a3;
- (void)enumerateAllChatsAndAttachmentSizesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)finishedDownloadingPurgedAssetsForChatIDs:(id)a3;
- (void)forcedReloadingChatRegistryWithQueryID:(id)a3;
- (void)frequentRepliesQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6 limit:(int64_t)a7;
- (void)groupPhotoUpdatedForChatIdentifier:(id)a3 style:(unsigned __int8)a4 account:(id)a5 userInfo:(id)a6;
- (void)historicalMessageGUIDsDeleted:(id)a3 chatGUIDs:(id)a4 queryID:(id)a5;
- (void)historyQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6 limit:(int64_t)a7;
- (void)isDownloadingQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(BOOL)a6;
- (void)lastFailedMessageDateChanged:(int64_t)a3;
- (void)leftChat:(id)a3;
- (void)loadedChats:(id)a3 queryID:(id)a4;
- (void)loadedRecoverableMessagesMetadata:(id)a3 queryID:(id)a4;
- (void)markAsSpamQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6;
- (void)markChatsAsReadFilteredUsingPredicate:(id)a3;
- (void)markedAsReadForMessageGUID:(id)a3 success:(BOOL)a4 queryID:(id)a5;
- (void)moveMessagesInChatsToRecentlyDeleted:(id)a3 deleteDate:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6;
- (void)moveMessagesWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6;
- (void)movedMessagesToRecentlyDeletedForChatsWithGUIDs:(id)a3 queryID:(id)a4 deletionDate:(id)a5;
- (void)movedMessagesToRecentlyDeletedWithQueryID:(id)a3;
- (void)pagedHistoryQuery:(id)a3 chatID:(id)a4 services:(id)a5 numberOfMessagesBefore:(int64_t)a6 numberOfMessagesAfter:(int64_t)a7 finishedWithResult:(id)a8 hasMessagesBefore:(BOOL)hasMoreMessagesToLoad hasMessagesAfter:(BOOL)hasMoreRecentMessagesToLoad;
- (void)permanentlyDeleteRecoverableMessagesInChats:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5;
- (void)permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:(id)a3;
- (void)permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:(id)a3 queryID:(id)a4;
- (void)permanentlyDeletedRecoverableMessagesForChatsWithGUIDs:(id)a3 deletedChatGUIDs:(id)a4;
- (void)previouslyBlackholedChatLoadedWithChatIdentifier:(id)a3 chats:(id)a4;
- (void)previouslyBlackholedChatLoadedWithHandleIDs:(id)a3 chat:(id)a4;
- (void)recoverMessagesForChats:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5;
- (void)recoveredMessagesFromRecentlyDeletedForChatsWithGUIDs:(id)a3;
- (void)recoveredMessagesWithChatGUIDs:(id)a3 queryID:(id)a4;
- (void)screenTimeEnablementChanged:(BOOL)a3;
- (void)service:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 messagesUpdated:(id)a6;
- (void)serviceSwitchRequestReceivedForChatWithIdentifier:(id)a3;
- (void)setBlackholedChatsExist:(BOOL)a3;
- (void)setChatPersonIDToChatMap:(id)a3;
- (void)setChatsBeingLoadedMap:(id)a3;
- (void)setContactStore:(id)a3;
- (void)setContactStoreQueue:(id)a3;
- (void)setDaemonHadTerminated:(BOOL)a3;
- (void)setFilterCategoryToEarliestInitiallyFetchedLastMessageDate:(id)a3;
- (void)setFilterediMessageChatsExist:(BOOL)a3;
- (void)setFirstLoad:(BOOL)a3;
- (void)setHistoryModificationStamp:(id)a3;
- (void)setIsInternalInstall:(BOOL)a3;
- (void)setLastFailedMessageDate:(int64_t)a3;
- (void)setLoading:(BOOL)a3;
- (void)setMarkAsReadTimer:(id)a3;
- (void)setPreExistingAllChats:(id)a3;
- (void)setProcessingChatCacheMiss:(BOOL)a3;
- (void)setRegistryChangeHistoryChatsToObserve:(id)a3;
- (void)setRegistryChangeHistoryChatsToUnregister:(id)a3;
- (void)setServiceNamesForChatIdentifierSearch:(id)a3;
- (void)setTimerStartTimeInterval:(double)a3;
- (void)setUnreadCount:(unint64_t)a3;
- (void)setUpInitialCallState;
- (void)setUserActivity:(id)a3;
- (void)setUserActivityForChat:(id)a3 message:(id)a4 orHandles:(id)a5;
- (void)setUserActivityForChat:(id)a3 orHandles:(id)a4;
- (void)setWantsHistoryReload:(BOOL)a3;
- (void)setupComplete;
- (void)setupComplete:(BOOL)a3 info:(id)a4;
- (void)uncachedAttachmentCountQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6;
- (void)unreadCountChanged:(int64_t)a3;
- (void)unregisterChat:(id)a3;
- (void)unregisterChatWithGUID:(id)a3;
- (void)updateChatDictionaryArray:(id)a3 createdChat:(id)a4 joinstate:(int64_t)a5 setHasCommunicatedOveriMessage:(BOOL *)a6;
- (void)updateChatsUsingMessageGUIDsAndSummaries:(id)a3;
- (void)updateEarliestMessageDateForChats:(id)a3 completion:(id)a4;
- (void)updateRecoverableMessagesMetadataSynchronously:(BOOL)a3 completionHandler:(id)a4;
- (void)updateRecoverableMessagesMetadataSynchronously:(BOOL)a3 loadChats:(BOOL)a4 completionHandler:(id)a5;
- (void)updatedSummariesForChatsWithGUIDsAndProperties:(id)a3;
- (void)verifyFilteringForAllChats;
@end

@implementation IMChatRegistry

- (void)lastFailedMessageDateChanged:(int64_t)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_lastFailedMessageDate(self, a2, a3, v3) != a3)
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v17 = 134218240;
        uint64_t FailedMessageDate = objc_msgSend_lastFailedMessageDate(self, v9, v10, v11);
        __int16 v19 = 2048;
        int64_t v20 = a3;
        _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Failed message date changed from %lld to %lld", (uint8_t *)&v17, 0x16u);
      }
    }
    objc_msgSend_setLastFailedMessageDate_(self, v6, a3, v7);
    v15 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v12, v13, v14);
    objc_msgSend___mainThreadPostNotificationName_object_(v15, v16, @"__kIMChatRegistryLastFailedMessageDateChangedNotification", 0);
  }
}

- (void)unreadCountChanged:(int64_t)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_unreadCount(self, a2, a3, v3) != a3)
  {
    if (IMOSLoggingEnabled())
    {
      v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v17[0] = 67109376;
        v17[1] = objc_msgSend_unreadCount(self, v9, v10, v11);
        __int16 v18 = 1024;
        int v19 = a3;
        _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Unread count changed from %d to %d", (uint8_t *)v17, 0xEu);
      }
    }
    objc_msgSend_setUnreadCount_(self, v6, a3, v7);
    v15 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v12, v13, v14);
    objc_msgSend___mainThreadPostNotificationName_object_(v15, v16, @"__kIMChatRegistryUnreadCountChangedNotification", 0);
  }
}

- (void)setUpInitialCallState
{
  if ((IMIsRunningInUnitTesting() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Setting up initial state of calls", buf, 2u);
      }
    }
    uint64_t v7 = objc_msgSend_conversationManager(self, v3, v4, v5);
    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = sub_1A4AFB2E4;
    v10[3] = &unk_1E5B7ACD0;
    v10[4] = self;
    objc_msgSend_registerWithCompletionHandler_(v7, v8, (uint64_t)v10, v9);
  }
}

- (void)_updateBlackholedChatsExist:(BOOL)a3
{
  objc_msgSend_setBlackholedChatsExist_(self, a2, a3, v3);
  v8 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v5, v6, v7);
  uint64_t v9 = NSNumber;
  uint64_t v13 = objc_msgSend_blackholedChatsExist(self, v10, v11, v12);
  v16 = objc_msgSend_numberWithBool_(v9, v14, v13, v15);
  objc_msgSend___mainThreadPostNotificationName_object_(v8, v17, @"__kIMChatRegistryBlackholedChatsExistNotification", (uint64_t)v16);

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"__kIMChatRegistryBlackholedChatsExistNotification", 0, 0, 1u);
}

- (void)_recalculateServiceNamesForChatIdentifierSearch
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = objc_msgSend_servicesWithCapabilityName_(IMServiceImpl, a2, *MEMORY[0x1E4F6E080], v2);
  uint64_t v7 = objc_msgSend_sortedArrayUsingComparator_(v4, v5, (uint64_t)&unk_1EF8E5798, v6);
  uint64_t v10 = objc_msgSend_arrayByApplyingSelector_(v7, v8, (uint64_t)sel_internalName, v9);
  objc_msgSend_setServiceNamesForChatIdentifierSearch_(self, v11, (uint64_t)v10, v12);

  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v17 = objc_msgSend_serviceNamesForChatIdentifierSearch(self, v14, v15, v16);
      int v18 = 138543362;
      int v19 = v17;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Ranked service names for chat resolution: %{public}@", (uint8_t *)&v18, 0xCu);
    }
  }
}

- (void)_handleMergedChatReconstructions:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v63 = a3;
  uint64_t v7 = objc_msgSend_sharedController(IMDaemonController, v4, v5, v6);
  int v11 = objc_msgSend_processCapabilities(v7, v8, v9, v10);

  if ((v11 & 0x2400000) != 0)
  {
    uint64_t v62 = objc_msgSend__copyMergedChatsPairedArrayFromMergedChatsArray_(self, v12, (uint64_t)v63, v13);
    int v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
    if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v17, v18, 0, v19)) != 0)
    {
    }
    else
    {
      v26 = objc_msgSend_sharedInstance(IMDaemonController, v20, v21, v22);
      int v29 = *MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v26, v27, 0, v28);

      if (!v29)
      {
        if (IMOSLoggingEnabled())
        {
          v37 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "Clearing chat registry", buf, 2u);
          }
        }
        v38 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v34, v35, v36);
        objc_msgSend___mainThreadPostNotificationName_object_(v38, v39, @"__kIMChatRegistryWillLoadNotification", 0);

        long long v66 = 0u;
        long long v67 = 0u;
        long long v64 = 0u;
        long long v65 = 0u;
        v43 = objc_msgSend_cachedChats(self, v40, v41, v42);
        v47 = objc_msgSend_copy(v43, v44, v45, v46);

        uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v64, (uint64_t)v68, 16);
        if (v49)
        {
          uint64_t v50 = *(void *)v65;
          do
          {
            for (uint64_t i = 0; i != v49; ++i)
            {
              if (*(void *)v65 != v50) {
                objc_enumerationMutation(v47);
              }
              uint64_t v52 = *(void *)(*((void *)&v64 + 1) + 8 * i);
              if (IMOSLoggingEnabled())
              {
                v55 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v70 = v52;
                  _os_log_impl(&dword_1A4AF7000, v55, OS_LOG_TYPE_INFO, " => Unregistering chat: %@", buf, 0xCu);
                }
              }
              objc_msgSend__unregisterChat_(self, v53, v52, v54);
            }
            uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v56, (uint64_t)&v64, (uint64_t)v68, 16);
          }
          while (v49);
        }

        v60 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v57, v58, v59);
        objc_msgSend___mainThreadPostNotificationName_object_(v60, v61, @"__kIMChatRegistryDidLoadNotification", 0);

        v30 = (void *)v62;
        goto LABEL_10;
      }
    }
    v30 = (void *)v62;
    objc_msgSend___handleMergedChatReconstructions_(self, v23, v62, v24);
    objc_msgSend_setUpInitialCallState(self, v31, v32, v33);
LABEL_10:

    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    v25 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Bailing out of _handleMergedChatReconstructions as no precached chats are expected.", buf, 2u);
    }
  }
LABEL_11:
}

- (void)_batchFetchRemainingContactsOnLaunch
{
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A4C5EAC8;
  aBlock[3] = &unk_1E5B7ACD0;
  aBlock[4] = self;
  uint64_t v2 = _Block_copy(aBlock);
  dispatch_time_t v3 = dispatch_time(0, 2000000000);
  uint64_t v4 = dispatch_get_global_queue(25, 0);
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1A4C5EBB8;
  v6[3] = &unk_1E5B7AE90;
  id v7 = v2;
  id v5 = v2;
  dispatch_after(v3, v4, v6);
}

- (void)_handleCachingAliasToCNIDMap:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F6C3F8]);
  objc_msgSend_startTimingForKey_(v5, v6, @"_handleCachingAliasToCNIDMap", v7);
  int v11 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  int v14 = *MEMORY[0x1E4F6C548] & objc_msgSend_capabilitiesForListenerID_(v11, v12, 0, v13);

  if (v14)
  {
    if (IMOSLoggingEnabled())
    {
      int v18 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v27) = 0;
        _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Bailing out of handle Contacts cache construction due to kFZListenerCapPaginatedChatRegistry", (uint8_t *)&v27, 2u);
      }
LABEL_9:
    }
  }
  else
  {
    uint64_t v19 = objc_msgSend_contactStore(self, v15, v16, v17);
    objc_msgSend_setHandleIDToCNIDMap_(v19, v20, (uint64_t)v4, v21);

    objc_msgSend_stopTimingForKey_(v5, v22, @"_handleCachingAliasToCNIDMap", v23);
    if (IMOSLoggingEnabled())
    {
      int v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_totalTimeForKey_(v5, v24, @"_handleCachingAliasToCNIDMap", v25);
        int v27 = 134217984;
        uint64_t v28 = v26;
        _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Caching AliasToCNIDMap completed. Took %f seconds", (uint8_t *)&v27, 0xCu);
      }
      goto LABEL_9;
    }
  }
}

- (void)_fetchInitialBatchOfContactsOnLaunch
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v25 = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "ChatRegistry: Fetching the initial batch of Contacts", v25, 2u);
    }
  }
  uint64_t v7 = objc_msgSend_sharedInstance(IMHandleRegistrar, v3, v4, v5);
  int v11 = objc_msgSend_getIDsForInitialBatch(v7, v8, v9, v10);

  unint64_t v15 = objc_msgSend_count(v11, v12, v13, v14);
  if (v15)
  {
    BOOL v19 = v15 < 0x1A;
    uint64_t v20 = objc_msgSend_contactStore(self, v16, v17, v18);
    objc_msgSend_fetchCNContactsForHandlesWithIDs_isFinalBatch_(v20, v21, (uint64_t)v11, v19);
  }
  else
  {
    uint64_t v20 = objc_msgSend_contactStore(self, v16, v17, v18);
    objc_msgSend_setBatchFetchingCompleted(v20, v22, v23, v24);
  }
}

- (void)setUserActivityForChat:(id)a3 message:(id)a4 orHandles:(id)a5
{
  uint64_t v157 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = objc_msgSend_guid(v8, v15, v16, v17);
      uint64_t v22 = objc_msgSend_guid(v9, v19, v20, v21);
      int v151 = 138412802;
      v152 = v18;
      __int16 v153 = 2112;
      v154 = v22;
      __int16 v155 = 2112;
      id v156 = v10;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Updating user activity with chat: %@ message: %@ handles: %@", (uint8_t *)&v151, 0x20u);
    }
  }
  if (v8 || objc_msgSend_count(v10, v11, v12, v13))
  {
    uint64_t v23 = objc_msgSend_userActivity(self, v11, v12, v13);
    BOOL v24 = v23 == 0;

    if (v24)
    {
      id v28 = objc_alloc(MEMORY[0x1E4F29230]);
      v31 = objc_msgSend_initWithActivityType_(v28, v29, @"com.apple.Messages", v30);
      objc_msgSend_setUserActivity_(self, v32, (uint64_t)v31, v33);
    }
    if (v8 && !objc_msgSend_length(0, v25, v26, v27))
    {
      v34 = objc_msgSend_displayName(v8, v25, v26, v27);
      uint64_t v35 = objc_msgSend_length(v34, v39, v40, v41);
    }
    else
    {
      v34 = 0;
      uint64_t v35 = objc_msgSend_length(0, v25, v26, v27);
    }
    if (!v35)
    {
      uint64_t isSpamFilteringOn = objc_msgSend_isSpamFilteringOn(MEMORY[0x1E4F6BF70], v36, v37, v38);
      uint64_t v44 = objc_msgSend_displayNameWithRawAddress_isSpamFilteringEnabled_(v8, v43, 0, isSpamFilteringOn);

      v34 = (void *)v44;
    }
    uint64_t v45 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v36, v37, v38);
    uint64_t v49 = objc_msgSend_lastIncomingFinishedMessageWithTextContent(v8, v46, v47, v48);
    v53 = objc_msgSend_text(v49, v50, v51, v52);
    v57 = objc_msgSend_string(v53, v54, v55, v56);

    if (v57) {
      objc_msgSend_setObject_forKey_(v45, v58, (uint64_t)v57, @"__kIMChatRegistryUserActivityLastMessageKey");
    }
    uint64_t v59 = objc_msgSend_messagesURLWithChat_orHandles_withMessageText_(self, v58, (uint64_t)v8, (uint64_t)v10, 0);
    id v63 = v59;
    if (v59)
    {
      long long v64 = objc_msgSend_absoluteString(v59, v60, v61, v62);
      objc_msgSend_setObject_forKey_(v45, v65, (uint64_t)v64, @"__kIMChatRegistryContinuityURLKey");

      v69 = objc_msgSend_userActivity(self, v66, v67, v68);
      char v70 = objc_opt_respondsToSelector();

      if (v70)
      {
        uint64_t v71 = objc_msgSend_userActivity(self, v60, v61, v62);
        v75 = objc_msgSend_absoluteString(v63, v72, v73, v74);
        objc_msgSend_setTargetContentIdentifier_(v71, v76, (uint64_t)v75, v77);
      }
    }
    v78 = objc_msgSend_userActivity(self, v60, v61, v62);
    v82 = objc_msgSend_copy(v45, v79, v80, v81);
    objc_msgSend_setUserInfo_(v78, v83, (uint64_t)v82, v84);

    v88 = objc_msgSend_userActivity(self, v85, v86, v87);
    objc_msgSend_setTitle_(v88, v89, (uint64_t)v34, v90);

    v94 = objc_msgSend_userActivity(self, v91, v92, v93);
    objc_msgSend_setNeedsSave_(v94, v95, 1, v96);

    v101 = objc_msgSend__interactionForMessage_inChat_(self, v97, (uint64_t)v9, (uint64_t)v8);
    if (v101)
    {
      if (IMOSLoggingEnabled())
      {
        v105 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
        {
          LOWORD(v151) = 0;
          _os_log_impl(&dword_1A4AF7000, v105, OS_LOG_TYPE_INFO, "Donating user activity with interaction", (uint8_t *)&v151, 2u);
        }
      }
      v106 = objc_msgSend_userActivity(self, v102, v103, v104);
      objc_msgSend_setInteraction_(v106, v107, (uint64_t)v101, v108);

      v112 = objc_msgSend_userActivity(self, v109, v110, v111);
      objc_msgSend_setEligibleForHandoff_(v112, v113, 0, v114);
    }
    else if (objc_msgSend_isFinished(v9, v98, v99, v100))
    {
      if (IMOSLoggingEnabled())
      {
        v121 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v121, OS_LOG_TYPE_INFO))
        {
          LOWORD(v151) = 0;
          _os_log_impl(&dword_1A4AF7000, v121, OS_LOG_TYPE_INFO, "Setting user activity for sent message, with no interaction", (uint8_t *)&v151, 2u);
        }
      }
      v112 = objc_msgSend_userActivity(self, v118, v119, v120);
      objc_msgSend_setEligibleForHandoff_(v112, v122, 0, v123);
    }
    else
    {
      v112 = objc_msgSend_userActivity(self, v115, v116, v117);
      objc_msgSend_setEligibleForHandoff_(v112, v124, 1, v125);
    }

    v129 = objc_msgSend_userActivity(self, v126, v127, v128);
    objc_msgSend_setEligibleForSearch_(v129, v130, 0, v131);

    v135 = objc_msgSend_userActivity(self, v132, v133, v134);
    objc_msgSend_setEligibleForPublicIndexing_(v135, v136, 0, v137);

    v141 = objc_msgSend_userActivity(self, v138, v139, v140);
    objc_msgSend_becomeCurrent(v141, v142, v143, v144);
  }
  else
  {
    v145 = objc_msgSend_userActivity(self, v11, v12, v13);
    objc_msgSend_invalidate(v145, v146, v147, v148);

    objc_msgSend_setUserActivity_(self, v149, 0, v150);
  }
}

- (void)setupComplete:(BOOL)a3 info:(id)a4
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v79 = 136315138;
      uint64_t v80 = "-[IMChatRegistry(IMChatRegistry_DaemonIncoming) setupComplete:info:]";
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v79, 0xCu);
    }
  }
  id v10 = objc_msgSend_sharedInstance(IMDaemonController, v6, v7, v8);
  uint64_t v14 = objc_msgSend_listener(v10, v11, v12, v13);
  objc_msgSend__stampForContext_(v14, v15, @"DBModificationStamp", v16);
  uint64_t v17 = (char *)objc_claimAutoreleasedReturnValue();

  LODWORD(v10) = objc_msgSend_daemonHadTerminated(self, v18, v19, v20);
  int v21 = IMOSLoggingEnabled();
  if (!v10)
  {
    if (v21)
    {
      uint64_t v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        int v79 = 138412290;
        uint64_t v80 = v17;
        _os_log_impl(&dword_1A4AF7000, v36, OS_LOG_TYPE_INFO, "This our first launch, just noting the modification stamp: %@", (uint8_t *)&v79, 0xCu);
      }
      goto LABEL_24;
    }
LABEL_25:
    uint64_t v35 = 1;
    goto LABEL_26;
  }
  if (v21)
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      uint64_t v29 = objc_msgSend_historyModificationStamp(self, v26, v27, v28);
      int v79 = 138412546;
      uint64_t v80 = v17;
      __int16 v81 = 2112;
      v82 = v29;
      _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "New history modification stamp is: %@     old was: %@", (uint8_t *)&v79, 0x16u);
    }
  }
  if (!v17
    || (objc_msgSend_historyModificationStamp(self, v22, v23, v24),
        uint64_t v30 = objc_claimAutoreleasedReturnValue(),
        char isEqualToString = objc_msgSend_isEqualToString_(v30, v31, (uint64_t)v17, v32),
        v30,
        (isEqualToString & 1) == 0))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        LOWORD(v79) = 0;
        _os_log_impl(&dword_1A4AF7000, v36, OS_LOG_TYPE_INFO, "   We're out of date, updating as we need", (uint8_t *)&v79, 2u);
      }
LABEL_24:

      goto LABEL_25;
    }
    goto LABEL_25;
  }
  if (IMOSLoggingEnabled())
  {
    v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      LOWORD(v79) = 0;
      _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "   We're up to date, nothing to do here", (uint8_t *)&v79, 2u);
    }
  }
  uint64_t v35 = 0;
LABEL_26:
  uint64_t v37 = objc_msgSend_objectForKey_(v5, v22, *MEMORY[0x1E4F6E328], v24);
  uint64_t v41 = objc_msgSend_integerValue(v37, v38, v39, v40);
  objc_msgSend_unreadCountChanged_(self, v42, v41, v43);

  uint64_t v46 = objc_msgSend_objectForKey_(v5, v44, *MEMORY[0x1E4F6E2F0], v45);
  uint64_t v50 = objc_msgSend_longLongValue(v46, v47, v48, v49);
  objc_msgSend_lastFailedMessageDateChanged_(self, v51, v50, v52);

  if (IMOSLoggingEnabled())
  {
    v53 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      int v57 = objc_msgSend_unreadCount(self, v54, v55, v56);
      int v79 = 67109120;
      LODWORD(v80) = v57;
      _os_log_impl(&dword_1A4AF7000, v53, OS_LOG_TYPE_INFO, "Unread count is %d", (uint8_t *)&v79, 8u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v58 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
    {
      uint64_t FailedMessageDate = objc_msgSend_lastFailedMessageDate(self, v59, v60, v61);
      int v79 = 134217984;
      uint64_t v80 = (const char *)FailedMessageDate;
      _os_log_impl(&dword_1A4AF7000, v58, OS_LOG_TYPE_INFO, "Last failed message date is %lld", (uint8_t *)&v79, 0xCu);
    }
  }
  int v63 = IMOSLoggingEnabled();
  if (v17)
  {
    if (v63)
    {
      long long v66 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        char v70 = objc_msgSend_historyModificationStamp(self, v67, v68, v69);
        int v79 = 138412546;
        uint64_t v80 = v17;
        __int16 v81 = 2112;
        v82 = v70;
        _os_log_impl(&dword_1A4AF7000, v66, OS_LOG_TYPE_INFO, "Updating modification stamp to: %@     old was: %@", (uint8_t *)&v79, 0x16u);
      }
    }
    objc_msgSend_setHistoryModificationStamp_(self, v64, (uint64_t)v17, v65);
  }
  else if (v63)
  {
    uint64_t v71 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_historyModificationStamp(self, v72, v73, v74);
      v75 = (char *)objc_claimAutoreleasedReturnValue();
      int v79 = 138412290;
      uint64_t v80 = v75;
      _os_log_impl(&dword_1A4AF7000, v71, OS_LOG_TYPE_INFO, "No modification stamp to update, old is: %@", (uint8_t *)&v79, 0xCu);
    }
  }
  if (v35 && IMOSLoggingEnabled())
  {
    v76 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
    {
      LOWORD(v79) = 0;
      _os_log_impl(&dword_1A4AF7000, v76, OS_LOG_TYPE_INFO, "   history may by out of date at this point, queries will all be non cached", (uint8_t *)&v79, 2u);
    }
  }
  objc_msgSend_setWantsHistoryReload_(self, v64, v35, v65);
  objc_msgSend_setDaemonHadTerminated_(self, v77, 0, v78);
}

- (TUConversationManager)conversationManager
{
  return self->_conversationManager;
}

- (void)loadedRecoverableMessagesMetadata:(id)a3 queryID:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = objc_msgSend_count(v6, v12, v13, v14);
      uint64_t v16 = @"YES";
      if (!v15) {
        uint64_t v16 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      id v24 = v7;
      __int16 v25 = 2112;
      uint64_t v26 = v16;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Recently Deleted | Completing query: Loaded recoverableMessagesMetadata for query: %@, hasRecoverableMessages: %@", buf, 0x16u);
    }
  }
  uint64_t v17 = objc_msgSend_daemonQueryController(self, v8, v9, v10);
  int v21 = @"recoverableMessagesMetadata";
  id v22 = v6;
  uint64_t v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)&v22, (uint64_t)&v21, 1);
  objc_msgSend_completeQuery_userInfo_(v17, v20, (uint64_t)v7, (uint64_t)v19);
}

- (void)updateRecoverableMessagesMetadataSynchronously:(BOOL)a3 loadChats:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v5 = a4;
  BOOL v6 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = @"NO";
      if (v6) {
        uint64_t v14 = @"YES";
      }
      else {
        uint64_t v14 = @"NO";
      }
      if (v5) {
        uint64_t v13 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v24 = v14;
      __int16 v25 = 2112;
      uint64_t v26 = v13;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Recently Deleted | Loading recoverable message metadata synchronously %@ loadsChats %@", buf, 0x16u);
    }
  }
  uint64_t v15 = objc_msgSend_daemonQueryController(self, v9, v10, v11);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1A4B13480;
  v21[3] = &unk_1E5B7C460;
  BOOL v22 = v6;
  v21[4] = self;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1A4B13AE4;
  v18[3] = &unk_1E5B7C4B0;
  BOOL v20 = v5;
  v18[4] = self;
  id v19 = v8;
  id v16 = v8;
  objc_msgSend_performQueryWithKey_expectsSynchronousResult_block_completionHandler_(v15, v17, @"RecentlyDeleted-RecoverableMessagesMetadata", v6, v21, v18);
}

- (id)_copyMergedChatsPairedArrayFromMergedChatsArray:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v8 = objc_msgSend_count(v3, v5, v6, v7);
  uint64_t v55 = objc_msgSend_initWithCapacity_(v4, v9, v8, v10);
  id v11 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v14 = objc_msgSend_initWithCapacity_(v11, v12, 10, v13);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v15 = v3;
  uint64_t v17 = 0;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v57, (uint64_t)v61, 16);
  if (v20)
  {
    uint64_t v21 = *(void *)v58;
    uint64_t v22 = *MEMORY[0x1E4F6CE00];
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v58 != v21) {
          objc_enumerationMutation(v15);
        }
        id v24 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        __int16 v25 = objc_msgSend_objectForKey_(v24, v18, v22, v19);
        if ((objc_msgSend_isEqualToString_(v17, v26, (uint64_t)v25, v27) & 1) == 0)
        {
          if (objc_msgSend_count(v14, v28, v29, v30) && objc_msgSend_length(v17, v31, v32, v33))
          {
            uint64_t v35 = objc_msgSend_pairWithFirst_second_(MEMORY[0x1E4F6C3A8], v34, (uint64_t)v14, (uint64_t)v17);
            objc_msgSend_addObject_(v55, v36, (uint64_t)v35, v37);

            id v38 = objc_alloc(MEMORY[0x1E4F1CA48]);
            uint64_t v14 = objc_msgSend_initWithCapacity_(v38, v39, 10, v40);
          }
          id v41 = v25;

          uint64_t v17 = v41;
        }
        objc_msgSend_addObject_(v14, v28, (uint64_t)v24, v30);
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v57, (uint64_t)v61, 16);
    }
    while (v20);
  }

  if (objc_msgSend_count(v14, v42, v43, v44) && objc_msgSend_length(v17, v45, v46, v47))
  {
    uint64_t v49 = objc_msgSend_pairWithFirst_second_(MEMORY[0x1E4F6C3A8], v48, (uint64_t)v14, (uint64_t)v17);
    objc_msgSend_addObject_(v55, v50, (uint64_t)v49, v51);
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v52 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v52, OS_LOG_TYPE_INFO, "Completed re-constructing merged chat paired array", buf, 2u);
    }
  }
  id v53 = v55;

  return v53;
}

+ (IMChatRegistry)sharedRegistry
{
  if (qword_1EB3F2348 != -1) {
    dispatch_once(&qword_1EB3F2348, &unk_1EF8E5A98);
  }
  uint64_t v2 = (void *)qword_1EB3F2350;

  return (IMChatRegistry *)v2;
}

- (void)_updateInfo:(id)a3 forGUID:(id)a4 updatingUnreadCount:(BOOL)a5 shouldPostNotifications:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v30 = a3;
  id v13 = a4;
  if (v13)
  {
    if (v30)
    {
      uint64_t v14 = objc_msgSend_chatGUIDToInfoMap(self, v10, v11, v12);
      objc_msgSend_setObject_forKey_(v14, v15, (uint64_t)v30, (uint64_t)v13);
    }
    uint64_t v18 = objc_msgSend__cachedChatWithGUID_(self, v10, (uint64_t)v13, v12);
    if (v18)
    {
      if (v7) {
        objc_msgSend__updateUnreadCountForChat_shouldPostNotification_(self, v16, (uint64_t)v18, v6);
      }
      uint64_t v19 = objc_msgSend_objectForKeyedSubscript_(v30, v16, *MEMORY[0x1E4F6CDE0], v17);
      objc_msgSend__updateChat_originalGroupID_shouldPostNotification_(self, v20, (uint64_t)v18, (uint64_t)v19, v6);

      uint64_t v23 = objc_msgSend_objectForKeyedSubscript_(v30, v21, *MEMORY[0x1E4F6CD40], v22);
      objc_msgSend__updateChat_groupID_shouldPostNotification_(self, v24, (uint64_t)v18, (uint64_t)v23, v6);

      objc_msgSend__updateChatAutoDonationBehavior_withInfo_shouldPostNotification_(self, v25, (uint64_t)v18, (uint64_t)v30, v6);
      objc_msgSend__updateReplySuggestions_withInfo_(self, v26, (uint64_t)v18, (uint64_t)v30);
      objc_msgSend__updatePendingIncomingSatelliteMessageCount_shouldPostNotification_(self, v27, (uint64_t)v18, v6);
      objc_msgSend__updateIsDownloadingPendingSatelliteMessages_shouldPostNotification_(self, v28, (uint64_t)v18, v6);
      objc_msgSend__updateHasCancellableScheduledMessage_shouldPostNotification_(self, v29, (uint64_t)v18, v6);
    }
  }
}

- (void)_updatePendingIncomingSatelliteMessageCount:(id)a3 shouldPostNotification:(BOOL)a4
{
  BOOL v46 = a4;
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v47 = a3;
  uint64_t v8 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v5, v6, v7);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v8, v9, v10, v11);

  if (v47 && isCarrierPigeonEnabled)
  {
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    objc_msgSend__guids(v47, v13, v14, v15);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v17 = 0;
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v49, (uint64_t)v57, 16);
    if (v21)
    {
      uint64_t v22 = *(void *)v50;
      uint64_t v23 = *MEMORY[0x1E4F6CDF8];
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v50 != v22) {
            objc_enumerationMutation(obj);
          }
          uint64_t v25 = *(void *)(*((void *)&v49 + 1) + 8 * i);
          uint64_t v26 = objc_msgSend_chatGUIDToInfoMap(self, v18, v19, v20);
          uint64_t v29 = objc_msgSend_objectForKey_(v26, v27, v25, v28);

          uint64_t v32 = objc_msgSend_objectForKey_(v29, v30, v23, v31);
          uint64_t v36 = objc_msgSend_unsignedIntegerValue(v32, v33, v34, v35);

          int v37 = IMOSLoggingEnabled();
          if (v36)
          {
            if (v37)
            {
              id v38 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v54 = v25;
                __int16 v55 = 1024;
                int v56 = v36;
                _os_log_impl(&dword_1A4AF7000, v38, OS_LOG_TYPE_INFO, "Chat [%@] info dictionary has [pendingSatelliteCount: %d]", buf, 0x12u);
              }
            }
            v17 += v36;
          }
          else if (v37)
          {
            uint64_t v39 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v54 = v25;
              __int16 v55 = 1024;
              int v56 = v17;
              _os_log_impl(&dword_1A4AF7000, v39, OS_LOG_TYPE_INFO, "Chat [%@] info dictionary has [pendingSatelliteCount: %d]", buf, 0x12u);
            }
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v49, (uint64_t)v57, 16);
      }
      while (v21);
    }

    if (IMOSLoggingEnabled())
    {
      id v41 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        uint64_t v45 = objc_msgSend_guid(v47, v42, v43, v44);
        *(_DWORD *)buf = 138412546;
        uint64_t v54 = (uint64_t)v45;
        __int16 v55 = 1024;
        int v56 = v17;
        _os_log_impl(&dword_1A4AF7000, v41, OS_LOG_TYPE_INFO, "Chat [%@] _updatePendingSatelliteCount to %d", buf, 0x12u);
      }
    }
    objc_msgSend__setPendingIncomingSatelliteMessageCount_postNotification_(v47, v40, v17, v46);
  }
}

- (void)_updateUnreadCountForChat:(id)a3 shouldPostNotification:(BOOL)a4
{
  BOOL v38 = a4;
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v39 = v5;
    objc_msgSend__guids(v5, v6, v7, v8);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v10 = 0;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v41, (uint64_t)v49, 16);
    if (v14)
    {
      uint64_t v15 = *(void *)v42;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v42 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v41 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend_chatGUIDToInfoMap(self, v11, v12, v13);
          uint64_t v21 = objc_msgSend_objectForKey_(v18, v19, v17, v20);

          id v24 = objc_msgSend_objectForKey_(v21, v22, @"unreadCount", v23);
          uint64_t v28 = objc_msgSend_unsignedIntegerValue(v24, v25, v26, v27);

          int v29 = IMOSLoggingEnabled();
          if (v28)
          {
            if (v29)
            {
              id v30 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v46 = v17;
                __int16 v47 = 1024;
                int v48 = v28;
                _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Chat [%@] info dictionary has [Unread: %d]", buf, 0x12u);
              }
            }
            v10 += v28;
          }
          else if (v29)
          {
            uint64_t v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v46 = v17;
              __int16 v47 = 1024;
              int v48 = 0;
              _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_DEBUG, "Chat [%@] info dictionary has [Unread: %d]", buf, 0x12u);
            }
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v41, (uint64_t)v49, 16);
      }
      while (v14);
    }

    if (IMOSLoggingEnabled())
    {
      uint64_t v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
      {
        int v37 = objc_msgSend_guid(v39, v34, v35, v36);
        *(_DWORD *)buf = 138412546;
        uint64_t v46 = (uint64_t)v37;
        __int16 v47 = 1024;
        int v48 = v10;
        _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_DEBUG, "Chat [%@] _setDBUnreadCount to %d", buf, 0x12u);
      }
    }
    objc_msgSend__setDBUnreadCount_postNotification_(v39, v32, v10, v38);
    id v5 = v39;
  }
}

- (NSMutableDictionary)chatGUIDToInfoMap
{
  return self->_chatGUIDToInfoMap;
}

- (void)_updateIsDownloadingPendingSatelliteMessages:(id)a3 shouldPostNotification:(BOOL)a4
{
  uint64_t v4 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v7, v8, v9);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v10, v11, v12, v13);

  if (v6 && isCarrierPigeonEnabled)
  {
    long long v44 = 0u;
    long long v45 = 0u;
    long long v42 = 0u;
    long long v43 = 0u;
    uint64_t v18 = objc_msgSend__guids(v6, v15, v16, v17);
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v42, (uint64_t)v46, 16);
    if (v20)
    {
      uint64_t v24 = v20;
      unsigned int v41 = v4;
      uint64_t v25 = *(void *)v43;
      while (2)
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v43 != v25) {
            objc_enumerationMutation(v18);
          }
          uint64_t v27 = *(void *)(*((void *)&v42 + 1) + 8 * i);
          uint64_t v28 = objc_msgSend_chatGUIDToInfoMap(self, v21, v22, v23);
          uint64_t v31 = objc_msgSend_objectForKey_(v28, v29, v27, v30);

          uint64_t v34 = objc_msgSend_objectForKey_(v31, v32, @"downloadingPendingSatelliteMessages", v33);
          char v38 = objc_msgSend_BOOLValue(v34, v35, v36, v37);

          if (v38)
          {
            uint64_t v39 = 1;
            goto LABEL_13;
          }
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v42, (uint64_t)v46, 16);
        if (v24) {
          continue;
        }
        break;
      }
      uint64_t v39 = 0;
LABEL_13:
      uint64_t v4 = v41;
    }
    else
    {
      uint64_t v39 = 0;
    }

    objc_msgSend__setIsDownloadingPendingSatelliteMessages_postNotification_(v6, v40, v39, v4);
  }
}

- (void)_updateHasCancellableScheduledMessage:(id)a3 shouldPostNotification:(BOOL)a4
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (v5)
  {
    long long v43 = 0u;
    long long v44 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id v39 = v5;
    objc_msgSend__guids(v5, v6, v7, v8);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    char v10 = 0;
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v41, (uint64_t)v49, 16);
    if (v14)
    {
      uint64_t v15 = *(void *)v42;
      uint64_t v16 = *MEMORY[0x1E4F6CD50];
LABEL_4:
      uint64_t v17 = 0;
      while (1)
      {
        if (*(void *)v42 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v18 = *(void *)(*((void *)&v41 + 1) + 8 * v17);
        uint64_t v19 = objc_msgSend_chatGUIDToInfoMap(self, v11, v12, v13);
        uint64_t v22 = objc_msgSend_objectForKey_(v19, v20, v18, v21);

        uint64_t v25 = objc_msgSend_objectForKeyedSubscript_(v22, v23, v16, v24);
        int v29 = objc_msgSend_BOOLValue(v25, v26, v27, v28);

        if (IMOSLoggingEnabled())
        {
          uint64_t v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v31 = @"NO";
            if (v29) {
              uint64_t v31 = @"YES";
            }
            uint64_t v46 = v18;
            __int16 v47 = 2112;
            int v48 = v31;
            _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Chat [%@] info dictionary has [hasCancellableScheduledMessage: %@]", buf, 0x16u);
          }
        }
        v10 |= v29;
        if (v29) {
          break;
        }
        if (v14 == ++v17)
        {
          uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v41, (uint64_t)v49, 16);
          if (v14) {
            goto LABEL_4;
          }
          break;
        }
      }
    }

    if (IMOSLoggingEnabled())
    {
      uint64_t v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        char v38 = objc_msgSend_guid(v39, v35, v36, v37);
        *(_DWORD *)buf = 138412546;
        uint64_t v46 = (uint64_t)v38;
        __int16 v47 = 1024;
        LODWORD(v48) = v10 & 1;
        _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "Chat [%@] hasCancellableScheduledMessage to %d", buf, 0x12u);
      }
    }
    objc_msgSend_setHasCancellableScheduledMessage_(v39, v32, v10 & 1, v33);
    id v5 = v39;
  }
}

- (void)_updateChatAutoDonationBehavior:(id)a3 withInfo:(id)a4 shouldPostNotification:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = *MEMORY[0x1E4F6CCE8];
  uint64_t v13 = objc_msgSend_objectForKey_(v9, v11, *MEMORY[0x1E4F6CCE8], v12);

  if (v13)
  {
    uint64_t v16 = objc_msgSend_objectForKey_(v9, v14, v10, v15);
    uint64_t v20 = objc_msgSend_integerValue(v16, v17, v18, v19);

    if (objc_msgSend__updateAutoDonationBehavior_forChat_shouldPostNotification_(self, v21, v20, (uint64_t)v8, v5)&& IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = objc_msgSend_guid(v8, v23, v24, v25);
        uint64_t v27 = (void *)v26;
        uint64_t v28 = @"NO";
        int v35 = 134218498;
        uint64_t v36 = v20;
        __int16 v37 = 2112;
        if (v5) {
          uint64_t v28 = @"YES";
        }
        uint64_t v38 = v26;
        __int16 v39 = 2112;
        uint64_t v40 = v28;
        _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "Found existing autoDonationBehavior: %ld for chat with GUID: %@ (notify: %@)", (uint8_t *)&v35, 0x20u);
      }
LABEL_15:
    }
  }
  else if ((objc_msgSend__updateAutoDonationBehavior_forChat_shouldPostNotification_(self, v14, 0, (uint64_t)v8, v5) & 1) != 0 {
         && IMOSLoggingEnabled())
  }
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = objc_msgSend_guid(v8, v29, v30, v31);
      uint64_t v33 = (void *)v32;
      uint64_t v34 = @"NO";
      if (v5) {
        uint64_t v34 = @"YES";
      }
      int v35 = 138412546;
      uint64_t v36 = v32;
      __int16 v37 = 2112;
      uint64_t v38 = (uint64_t)v34;
      _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "Using default autoDonationBehavior for chat with GUID: %@ (notify: %@)", (uint8_t *)&v35, 0x16u);
    }
    goto LABEL_15;
  }
}

- (void)_updateChat:(id)a3 originalGroupID:(id)a4 shouldPostNotification:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  uint64_t v12 = objc_msgSend_originalGroupID(v7, v9, v10, v11);
  if ((IMAreObjectsLogicallySame() & 1) == 0)
  {
    int v16 = objc_msgSend_chatStyle(v7, v13, v14, v15);
    int v17 = IMOSLoggingEnabled();
    if (v16 == 43)
    {
      if (v17)
      {
        uint64_t v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v24 = objc_msgSend_guid(v7, v21, v22, v23);
          int v36 = 138412802;
          __int16 v37 = v24;
          __int16 v38 = 2112;
          id v39 = v12;
          __int16 v40 = 2112;
          id v41 = v8;
          _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Updating original groupID of chat %@ from %@ to %@", (uint8_t *)&v36, 0x20u);
        }
      }
      if (v8) {
        objc_msgSend_setOriginalGroupID_(v7, v18, (uint64_t)v8, v19);
      }
      if (v5)
      {
        id v25 = objc_alloc(MEMORY[0x1E4F1CA60]);
        uint64_t v28 = objc_msgSend_initWithCapacity_(v25, v26, 2, v27);
        uint64_t v32 = v28;
        if (v12) {
          objc_msgSend_setObject_forKey_(v28, v29, (uint64_t)v12, @"__kIMChatRegistryPreviousOriginalGroupIDKey");
        }
        if (v8) {
          objc_msgSend_setObject_forKey_(v32, v29, (uint64_t)v8, @"__kIMChatRegistryUpdatedOriginalGroupIDKey");
        }
        uint64_t v33 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v29, v30, v31);
        objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v33, v34, @"__kIMChatRegistryOriginalGroupIDChangedNotification", (uint64_t)v7, v32);
      }
    }
    else if (v17)
    {
      int v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        int v36 = 138412802;
        __int16 v37 = v12;
        __int16 v38 = 2112;
        id v39 = v8;
        __int16 v40 = 2112;
        id v41 = v7;
        _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "Ignoring original groupID update (%@ -> %@) because chat is not group chat: %@", (uint8_t *)&v36, 0x20u);
      }
    }
  }
}

- (void)_updateChat:(id)a3 groupID:(id)a4 shouldPostNotification:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  uint64_t v13 = objc_msgSend_groupID(v8, v10, v11, v12);
  if ((IMAreObjectsLogicallySame() & 1) == 0)
  {
    if (objc_msgSend_chatStyle(v8, v14, v15, v16) == 43)
    {
      if (v9)
      {
        uint64_t v20 = objc_msgSend_groupIDToChatMap(self, v17, v18, v19);
        uint64_t v23 = objc_msgSend_objectForKey_(v20, v21, (uint64_t)v9, v22);

        if (v23 && objc_msgSend_chatStyle(v23, v24, v25, v26) == 43)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              uint64_t v31 = objc_msgSend_guid(v8, v28, v29, v30);
              int v54 = 138413058;
              __int16 v55 = v13;
              __int16 v56 = 2112;
              id v57 = v9;
              __int16 v58 = 2112;
              id v59 = v31;
              __int16 v60 = 2112;
              uint64_t v61 = v23;
              _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "Ignoring groupID update (%@ -> %@) for %@ because existing group chat is in groupID map: %@", (uint8_t *)&v54, 0x2Au);
            }
          }
LABEL_27:

          goto LABEL_28;
        }
      }
      else
      {
        uint64_t v23 = 0;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          __int16 v38 = objc_msgSend_guid(v8, v35, v36, v37);
          int v54 = 138412802;
          __int16 v55 = v38;
          __int16 v56 = 2112;
          id v57 = v13;
          __int16 v58 = 2112;
          id v59 = v9;
          _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "Updating groupID of chat %@ from %@ to %@", (uint8_t *)&v54, 0x20u);
        }
      }
      if (v9)
      {
        objc_msgSend_setGroupID_(v8, v32, (uint64_t)v9, v33);
        uint64_t v42 = objc_msgSend_groupIDToChatMap(self, v39, v40, v41);
        objc_msgSend_setObject_forKey_(v42, v43, (uint64_t)v8, (uint64_t)v9);
      }
      if (v5)
      {
        id v44 = objc_alloc(MEMORY[0x1E4F1CA60]);
        __int16 v47 = objc_msgSend_initWithCapacity_(v44, v45, 2, v46);
        long long v51 = v47;
        if (v13) {
          objc_msgSend_setObject_forKey_(v47, v48, (uint64_t)v13, @"__kIMChatRegistryPreviousGroupIDKey");
        }
        if (v9) {
          objc_msgSend_setObject_forKey_(v51, v48, (uint64_t)v9, @"__kIMChatRegistryUpdatedGroupIDKey");
        }
        long long v52 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v48, v49, v50);
        objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v52, v53, @"__kIMChatRegistryGroupIDChangedNotification", (uint64_t)v8, v51);
      }
      goto LABEL_27;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        int v54 = 138412802;
        __int16 v55 = v13;
        __int16 v56 = 2112;
        id v57 = v9;
        __int16 v58 = 2112;
        id v59 = v8;
        _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Ignoring groupID update (%@ -> %@) because chat is not group chat: %@", (uint8_t *)&v54, 0x20u);
      }
      goto LABEL_27;
    }
  }
LABEL_28:
}

- (BOOL)_updateAutoDonationBehavior:(int64_t)a3 forChat:(id)a4 shouldPostNotification:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a4;
  uint64_t v14 = objc_msgSend_autoDonationBehavior(v8, v9, v10, v11);
  if (v14 != a3)
  {
    objc_msgSend_setAutoDonationBehavior_(v8, v12, a3, v13);
    if (v5)
    {
      uint64_t v18 = objc_msgSend_sharedWithYouManager(self, v15, v16, v17);
      int isSharedWithYouEnabled = objc_msgSend_isSharedWithYouEnabled(v18, v19, v20, v21);

      if (isSharedWithYouEnabled)
      {
        uint64_t v26 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v23, v24, v25);
        objc_msgSend___mainThreadPostNotificationName_object_(v26, v27, @"__kIMChatRegistryChatMarkedForAutoDonatingChangedNotification", (uint64_t)v8);
      }
    }
  }

  return v14 != a3;
}

- (NSArray)cachedChats
{
  BOOL v5 = objc_msgSend_simulatedChats(self, a2, v2, v3);
  id v9 = v5;
  if (v5)
  {
    id v10 = v5;
  }
  else
  {
    uint64_t v11 = objc_msgSend_cachedChatsInThreadNameMap(self, v6, v7, v8);
    id v10 = (id)objc_msgSend_copy(v11, v12, v13, v14);
  }

  return (NSArray *)v10;
}

- (NSMutableArray)cachedChatsInThreadNameMap
{
  return self->_cachedChatsInThreadNameMap;
}

- (IMContactStore)contactStore
{
  uint64_t v6 = 0;
  uint64_t v7 = &v6;
  uint64_t v8 = 0x3032000000;
  id v9 = sub_1A4B3456C;
  id v10 = sub_1A4B3439C;
  id v11 = 0;
  contactStoreQueue = self->_contactStoreQueue;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A4B33BB4;
  v5[3] = &unk_1E5B7BE20;
  v5[4] = self;
  v5[5] = &v6;
  dispatch_sync(contactStoreQueue, v5);
  id v3 = (id)v7[5];
  _Block_object_dispose(&v6, 8);

  return (IMContactStore *)v3;
}

- (void)updateChatDictionaryArray:(id)a3 createdChat:(id)a4 joinstate:(int64_t)a5 setHasCommunicatedOveriMessage:(BOOL *)a6
{
  int64_t v63 = a5;
  id v70 = a3;
  id v69 = a4;
  if ((unint64_t)objc_msgSend_count(v70, v8, v9, v10) >= 2)
  {
    uint64_t v67 = *MEMORY[0x1E4F6CD38];
    uint64_t v66 = *MEMORY[0x1E4F6CD88];
    uint64_t v65 = *MEMORY[0x1E4F6CD78];
    uint64_t v64 = *MEMORY[0x1E4F6CDB0];
    uint64_t v13 = off_1E5B7A000;
    unint64_t v14 = 1;
    do
    {
      uint64_t v15 = objc_msgSend_objectAtIndex_(v70, v11, v14, v12, v63);
      uint64_t v18 = objc_msgSend_objectForKey_(v15, v16, v67, v17);
      uint64_t v21 = objc_msgSend_objectForKey_(v15, v19, v66, v20);
      int v25 = objc_msgSend_intValue(v21, v22, v23, v24);

      objc_msgSend__registerChatDictionary_forChat_isIncoming_newGUID_shouldPostNotification_(self, v26, (uint64_t)v15, (uint64_t)v69, 0, v18, 0);
      objc_msgSend__updateInfo_forGUID_updatingUnreadCount_shouldPostNotifications_(self, v27, (uint64_t)v15, (uint64_t)v18, 1, 0);
      uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v15, v28, v65, v29);
      uint64_t v34 = objc_msgSend_longLongValue(v30, v31, v32, v33);

      if (!v34) {
        objc_msgSend_setIsFiltered_(v69, v35, 0, v36);
      }
      uint64_t v37 = objc_msgSend_objectForKey_(v15, v35, v64, v36);
      uint64_t v40 = objc_msgSend_objectForKey_(v37, v38, @"service", v39);
      uint64_t v43 = objc_msgSend_serviceWithInternalName_(v13[58], v41, (uint64_t)v40, v42);
      __int16 v47 = (void *)v43;
      if (!*a6)
      {
        if (v43)
        {
          objc_msgSend_iMessageService(v13[58], v44, v45, v46);
          uint64_t v49 = v48 = v13;

          BOOL v50 = v47 == v49;
          uint64_t v13 = v48;
          if (v50)
          {
            long long v51 = objc_msgSend_sharedRegistry(IMChatRegistry, v44, v45, v46);
            objc_msgSend__setChatHasCommunicatedOveriMessage_(v51, v52, (uint64_t)v69, v53);

            uint64_t v13 = v48;
            *a6 = 1;
          }
        }
      }
      if (objc_msgSend_supportsMutatingGroupMembers(v47, v44, v45, v46))
      {
        char isDiscontinued = objc_msgSend_isDiscontinued(v47, v54, v55, v56);
        if (v63 == 3 && (isDiscontinued & 1) == 0) {
          objc_msgSend__setJoinState_(v69, v58, v25, v59);
        }
      }

      ++v14;
    }
    while (v14 < objc_msgSend_count(v70, v60, v61, v62));
  }
}

- (int64_t)_winningJoinStateForExistingChat:(id)a3 incomingDictionary:(id)a4
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v9 = objc_msgSend_valueForKey_(v6, v7, *MEMORY[0x1E4F6CD88], v8);
  int64_t v13 = (int)objc_msgSend_intValue(v9, v10, v11, v12);

  uint64_t v17 = objc_msgSend_joinState(v5, v14, v15, v16);
  if (v17 == v13)
  {
    int64_t v20 = v13;
  }
  else
  {
    int64_t v20 = v17;
    uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v6, v18, *MEMORY[0x1E4F6CE40], v19);
    uint64_t v24 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v22, (uint64_t)v21, v23);
    char v28 = objc_msgSend_supportsMutatingGroupMembers(v24, v25, v26, v27);

    if (v28)
    {
      int64_t v20 = v13;
    }
    else
    {
      uint64_t v32 = objc_msgSend_guid(v5, v29, v30, v31);
      IMComponentsFromChatGUID();
      id v33 = 0;

      uint64_t v36 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v34, (uint64_t)v33, v35);
      int v40 = objc_msgSend_supportsMutatingGroupMembers(v36, v37, v38, v39);

      if (v40)
      {
        uint64_t v43 = objc_msgSend_objectForKeyedSubscript_(v6, v41, *MEMORY[0x1E4F6CD38], v42);
        if (IMOSLoggingEnabled())
        {
          id v44 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            int v48 = objc_msgSend_guid(v5, v45, v46, v47);
            *(_DWORD *)buf = 138413058;
            long long v51 = v48;
            __int16 v52 = 2048;
            int64_t v53 = v20;
            __int16 v54 = 2112;
            uint64_t v55 = v43;
            __int16 v56 = 2048;
            int64_t v57 = v13;
            _os_log_impl(&dword_1A4AF7000, v44, OS_LOG_TYPE_INFO, "Join state inconsistency detected. Existing chat %@ join state %lu incoming chat %@ join state %lu", buf, 0x2Au);
          }
        }
      }
      else
      {
        int64_t v20 = v13;
      }
    }
  }

  return v20;
}

- (id)_lastMessageItemForChatDictionary:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend_objectForKeyedSubscript_(v4, v5, *MEMORY[0x1E4F6CDB0], v6);
  if (!v7)
  {
    IMMessageFromIMMessageItemDictionary = 0;
    goto LABEL_16;
  }
  id v8 = v4;
  if (!objc_msgSend_count(v7, v9, v10, v11))
  {
    IMMessageFromIMMessageItemDictionary = 0;
    goto LABEL_14;
  }
  unint64_t v14 = objc_msgSend_objectForKey_(v7, v12, @"accountID", v13);
  uint64_t v17 = objc_msgSend_objectForKey_(v7, v15, @"account", v16);
  uint64_t v22 = objc_msgSend_objectForKey_(v7, v18, @"serviceName", v19);
  if (v14)
  {
    if (v17) {
      goto LABEL_5;
    }
  }
  else
  {
    unint64_t v14 = objc_msgSend_objectForKey_(v8, v20, @"accountID", v21);
    if (v17)
    {
LABEL_5:
      if (v22) {
        goto LABEL_12;
      }
      goto LABEL_11;
    }
  }
  uint64_t v17 = objc_msgSend_objectForKey_(v8, v20, @"account", v21);
  if (v22) {
    goto LABEL_12;
  }
LABEL_11:
  uint64_t v22 = objc_msgSend_objectForKey_(v8, v20, @"serviceName", v21);
  if (!v22)
  {
    int v25 = 0;
    goto LABEL_13;
  }
LABEL_12:
  int v25 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v20, (uint64_t)v22, v21);
LABEL_13:
  uint64_t v26 = objc_msgSend_sharedInstance(IMAccountController, v20, v24, v21);
  char v28 = objc_msgSend_bestAccountForService_login_guid_(v26, v27, (uint64_t)v25, (uint64_t)v17, v14);

  IMMessageFromIMMessageItemDictionary = _CreateIMMessageFromIMMessageItemDictionary(v7, v28, 1);
LABEL_14:

  if (IMMessageFromIMMessageItemDictionary) {
    objc_msgSend__checkIfItemIsCorrupt_(self, v29, (uint64_t)IMMessageFromIMMessageItemDictionary, v30);
  }
LABEL_16:

  return IMMessageFromIMMessageItemDictionary;
}

- (void)_updatePersonCentricIDToChatMapForChat:(id)a3 toNewPersonCentricID:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v14 = objc_msgSend_personCentricID(v6, v8, v9, v10);
  if (v14)
  {
    uint64_t v15 = objc_msgSend_chatPersonIDToChatMap(self, v11, v12, v13);
    objc_msgSend_removeObjectForKey_(v15, v16, (uint64_t)v14, v17);
  }
  objc_msgSend_setPersonCentricID_(v6, v11, (uint64_t)v7, v13);
  if (v6)
  {
    id v18 = v6;
    objc_msgSend_chatPersonIDToChatMap(self, v19, v20, v21);
    uint64_t v22 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
    CFDictionarySetValue(v22, v7, v18);
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412802;
      int v25 = v14;
      __int16 v26 = 2112;
      id v27 = v7;
      __int16 v28 = 2112;
      id v29 = v6;
      _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Updated personCentricID from %@ to %@ for chat %@", (uint8_t *)&v24, 0x20u);
    }
  }
}

- (id)_participantsForChatDictionary:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v41 = a3;
  uint64_t v42 = objc_msgSend_objectForKeyedSubscript_(v41, v3, @"accountID", v4);
  id v8 = objc_msgSend_sharedInstance(IMAccountController, v5, v6, v7);
  int v48 = objc_msgSend_accountForUniqueID_(v8, v9, (uint64_t)v42, v10);

  id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v49 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  objc_msgSend_objectForKeyedSubscript_(v41, v11, @"participants", v12);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v13, (uint64_t)&v49, (uint64_t)v61, 16);
  if (v16)
  {
    uint64_t v47 = *(void *)v50;
    uint64_t v46 = *MEMORY[0x1E4F6C5C8];
    uint64_t v45 = *MEMORY[0x1E4F6C648];
    uint64_t v17 = *MEMORY[0x1E4F6C5A0];
    uint64_t v18 = *MEMORY[0x1E4F6C608];
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v50 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v49 + 1) + 8 * i);
        uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v20, v14, v46, v15);
        int v24 = objc_msgSend_objectForKeyedSubscript_(v20, v22, v45, v23);
        id v27 = objc_msgSend_objectForKeyedSubscript_(v20, v25, v17, v26);
        uint64_t v30 = objc_msgSend_objectForKeyedSubscript_(v20, v28, v18, v29);
        uint64_t v32 = objc_msgSend_imHandleWithID_alreadyCanonical_(v48, v31, (uint64_t)v21, 1);
        uint64_t v35 = v32;
        if (v32)
        {
          objc_msgSend_setPersonCentricID_(v32, v33, (uint64_t)v30, v34);
          objc_msgSend_addObject_(v44, v36, (uint64_t)v35, v37);
          objc_msgSend__setOriginalID_countryCode_updateSiblings_(v35, v38, (uint64_t)v24, (uint64_t)v27, 1);
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v39 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138413058;
            __int16 v54 = v21;
            __int16 v55 = 2112;
            __int16 v56 = v24;
            __int16 v57 = 2112;
            uint64_t v58 = v27;
            __int16 v59 = 2112;
            __int16 v60 = v30;
            _os_log_impl(&dword_1A4AF7000, v39, OS_LOG_TYPE_INFO, "Failed to find handle for participant id: %@ unformatted: %@ countryCode: %@ personCentricID: %@", buf, 0x2Au);
          }
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v49, (uint64_t)v61, 16);
    }
    while (v16);
  }

  return v44;
}

- (id)_cachedChatForChatDictionary:(id)a3 participants:(id)a4 participantHash:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v8, v11, @"style", v12);
  unsigned __int8 v17 = objc_msgSend_intValue(v13, v14, v15, v16);

  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v8, v18, @"guid", v19);
  uint64_t v23 = objc_msgSend__cachedChatWithGUID_(self, v21, (uint64_t)v20, v22);

  if (!v23)
  {
    switch(v17)
    {
      case '#':
        if (IMOSLoggingEnabled())
        {
          __int16 v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            LOWORD(v33[0]) = 0;
            _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Room style chats are no longer supported", (uint8_t *)v33, 2u);
          }
        }
        uint64_t v29 = objc_msgSend_objectForKeyedSubscript_(v8, v26, @"roomName", v27);
        uint64_t v23 = objc_msgSend__cachedChatWithIdentifier_style_(self, v30, (uint64_t)v29, 35);

        break;
      case '+':
        uint64_t v25 = objc_msgSend__cachedGroupChatForGroupChatDictionary_participants_participantHash_(self, v24, (uint64_t)v8, (uint64_t)v9, v10);
        goto LABEL_12;
      case '-':
        uint64_t v25 = objc_msgSend__cachedOneToOneChatForChatDictionary_participants_participantHash_(self, v24, (uint64_t)v8, (uint64_t)v9, v10);
LABEL_12:
        uint64_t v23 = (void *)v25;
        break;
      default:
        if (IMOSLoggingEnabled())
        {
          uint64_t v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            v33[0] = 67109120;
            v33[1] = v17;
            _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "Unknown chat style %d", (uint8_t *)v33, 8u);
          }
        }
        uint64_t v23 = 0;
        break;
    }
  }

  return v23;
}

- (id)_cachedChatWithPersonID:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_chatPersonIDToChatMap(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (NSMutableDictionary)chatPersonIDToChatMap
{
  return self->_chatPersonIDToChatMap;
}

- (NSMutableDictionary)groupIDToChatMap
{
  return self->_groupIDToChatMap;
}

- (void)_updateUnreadCountForChat:(id)a3
{
}

- (void)_checkIfItemIsCorrupt:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
    id v8 = objc_msgSend_guid(v4, v5, v6, v7);
    if (objc_msgSend_isGUIDInAttemptingListInScrutinyMode_(IMChat, v9, (uint64_t)v8, v10))
    {
      if (IMOSLoggingEnabled())
      {
        unint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v22 = v8;
          __int16 v23 = 2112;
          id v24 = v4;
          _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Found attempted guid %@. Marking message as corrupt %@", buf, 0x16u);
        }
      }
      char isCorrupt = objc_msgSend_isCorrupt(v4, v11, v12, v13);
      objc_msgSend_setIsCorrupt_(v4, v16, 1, v17);
      v18[0] = MEMORY[0x1E4F143A8];
      v18[1] = 3221225472;
      v18[2] = sub_1A4C5BF48;
      v18[3] = &unk_1E5B7F120;
      id v19 = v8;
      char v20 = isCorrupt;
      dispatch_async(MEMORY[0x1E4F14428], v18);
    }
  }
}

- (void)_registerChatDictionary:(id)a3 forChat:(id)a4 isIncoming:(BOOL)a5 newGUID:(id)a6 shouldPostNotification:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v202 = a5;
  uint64_t v227 = *MEMORY[0x1E4F143B8];
  id v209 = a3;
  uint64_t v10 = (__CFString *)a4;
  id v11 = a6;
  v210 = v10;
  if (!objc_msgSend__shouldRegisterChat(v10, v12, v13, v14)) {
    goto LABEL_111;
  }
  BOOL v200 = v7;
  v206 = v11;
  if (((IMAdditionalChatRegistryLoggingEnabled() & 1) != 0 || !self->_firstLoad) && IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = @"NO";
      *(_DWORD *)buf = 138413058;
      id v218 = v11;
      if (v202) {
        char v20 = @"YES";
      }
      else {
        char v20 = @"NO";
      }
      v220 = v20;
      __int16 v219 = 2112;
      if (v200) {
        id v19 = @"YES";
      }
      __int16 v221 = 2112;
      v222 = v19;
      __int16 v223 = 2112;
      v224 = v10;
      _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Registering dictionary for with newGUID: %@ isIncoming: %@ shouldPostNotification: %@ chat: %@", buf, 0x2Au);
    }
  }
  uint64_t v21 = objc_msgSend_account(v10, v15, v16, v17);
  v204 = objc_msgSend_uniqueID(v21, v22, v23, v24);

  v207 = objc_msgSend_chatIdentifier(v10, v25, v26, v27);
  char v34 = objc_msgSend_chatStyle(v10, v28, v29, v30);
  if (v206)
  {
    id v205 = v206;
  }
  else
  {
    objc_msgSend_guid(v10, v31, v32, v33);
    id v205 = (id)objc_claimAutoreleasedReturnValue();
  }
  objc_msgSend_groupID(v10, v35, v36, v37);
  key = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (v209)
  {
    uint64_t v40 = objc_msgSend_objectForKey_(v209, v38, @"accountID", v39);

    if (!v205)
    {
      objc_msgSend_objectForKey_(v209, v41, @"guid", v42);
      id v205 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v43 = objc_msgSend_objectForKey_(v209, v41, @"chatIdentifier", v42);

    uint64_t v46 = objc_msgSend_objectForKey_(v209, v44, @"style", v45);
    char v34 = objc_msgSend_intValue(v46, v47, v48, v49);

    v207 = (void *)v43;
    v204 = (void *)v40;
  }
  objc_msgSend__verifyChatMergeWithChat_dictionary_(self, v38, (uint64_t)v10, (uint64_t)v209);
  if (v206)
  {
    uint64_t v215 = 0;
    IMComponentsFromChatGUID();
    id v50 = 0;
    if (objc_msgSend_length(v50, v51, v52, v53))
    {
      id v54 = v50;

      v207 = v54;
    }
  }
  v203 = (void *)IMCopyThreadNameForChat();
  if (v203)
  {
    __int16 v57 = objc_msgSend_objectForKey_(self->_chatGUIDToChatMap, v55, (uint64_t)v205, v56);

    if (v10)
    {
      chatGUIDToChatMap = self->_chatGUIDToChatMap;
      uint64_t v62 = objc_msgSend_guid(v10, v58, v59, v60);
      uint64_t v65 = objc_msgSend_objectForKey_(chatGUIDToChatMap, v63, (uint64_t)v62, v64);
      BOOL v199 = v65 != 0;

      if (!v57)
      {
LABEL_33:
        if (v34 == 43)
        {
          if (objc_msgSend_length(key, v58, v59, v60))
          {
            uint64_t v71 = objc_msgSend_objectForKey_(self->_groupIDToChatMap, v58, (uint64_t)key, v60);
            BOOL v72 = v71 == 0;

            if (v72)
            {
              uint64_t v73 = v10;
              if (v10)
              {
                CFDictionarySetValue((CFMutableDictionaryRef)self->_groupIDToChatMap, key, v73);
              }
              else
              {
                uint64_t v74 = MEMORY[0x1E4F14500];
                id v75 = MEMORY[0x1E4F14500];
                if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR)) {
                  sub_1A4CB90B4();
                }
              }
            }
          }
        }
        v76 = objc_msgSend_guid(v10, v58, v59, v60);
        if (objc_msgSend_isEqualToString_(v76, v77, (uint64_t)v205, v78))
        {
          int isInternalInstall = 0;
        }
        else
        {
          uint64_t v83 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C360], v79, v80, v81);
          int isInternalInstall = objc_msgSend_isInternalInstall(v83, v84, v85, v86);
        }
        uint64_t v90 = objc_msgSend_chatIdentifier(v10, v87, v88, v89);
        BOOL v91 = v90 == 0;

        if (v91)
        {
          int v99 = 0;
        }
        else
        {
          v95 = objc_msgSend_chatIdentifier(v10, v92, v93, v94);
          int v98 = objc_msgSend_containsString_(v205, v96, (uint64_t)v95, v97);

          int v99 = v98 ^ 1;
        }
        char v100 = isInternalInstall ^ 1;
        if (v34 != 43) {
          char v100 = 1;
        }
        if (v100)
        {
          if (v34 == 45) {
            int v145 = isInternalInstall;
          }
          else {
            int v145 = 0;
          }
          if (v145 == 1 && IMOSLoggingEnabled())
          {
            v146 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
            {
              objc_msgSend_objectForKey_(v209, v147, *MEMORY[0x1E4F6CE00], v148);
              v149 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
              objc_msgSend_guid(v10, v150, v151, v152);
              __int16 v153 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
              uint64_t v157 = objc_msgSend_personCentricID(v10, v154, v155, v156);
              *(_DWORD *)buf = 138413314;
              id v218 = v205;
              __int16 v219 = 2112;
              v220 = v149;
              __int16 v221 = 2048;
              v222 = v10;
              __int16 v223 = 2112;
              v224 = v153;
              __int16 v225 = 2112;
              id v226 = v157;
              _os_log_impl(&dword_1A4AF7000, v146, OS_LOG_TYPE_INFO, "Registering chat with guid: %@ and personID %@ for chat %p with guid %@ and personID %@", buf, 0x34u);
            }
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v103 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
            {
              objc_msgSend_guid(v10, v104, v105, v106);
              v107 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
              objc_msgSend_groupID(v10, v108, v109, v110);
              id v111 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138413314;
              id v218 = v205;
              __int16 v219 = 2112;
              v220 = key;
              __int16 v221 = 2048;
              v222 = v10;
              __int16 v223 = 2112;
              v224 = v107;
              __int16 v225 = 2112;
              id v226 = v111;
              _os_log_impl(&dword_1A4AF7000, v103, OS_LOG_TYPE_INFO, "Registering chat with guid: %@ groupID: %@ for chat %p with guid %@ groupID: %@ ", buf, 0x34u);
            }
          }
          if (v99)
          {
            v112 = objc_msgSend_objectForKey_(v209, v101, @"participants", v102);
            id v113 = objc_alloc(MEMORY[0x1E4F1CA48]);
            uint64_t v117 = objc_msgSend_count(v112, v114, v115, v116);
            uint64_t v120 = objc_msgSend_initWithCapacity_(v113, v118, v117, v119);
            long long v213 = 0u;
            long long v214 = 0u;
            long long v211 = 0u;
            long long v212 = 0u;
            id v121 = v112;
            uint64_t v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v122, (uint64_t)&v211, (uint64_t)v216, 16);
            if (v125)
            {
              uint64_t v126 = *(void *)v212;
              uint64_t v127 = *MEMORY[0x1E4F6C5C8];
              do
              {
                for (uint64_t i = 0; i != v125; ++i)
                {
                  if (*(void *)v212 != v126) {
                    objc_enumerationMutation(v121);
                  }
                  v129 = objc_msgSend_objectForKey_(*(void **)(*((void *)&v211 + 1) + 8 * i), v123, v127, v124);
                  if (objc_msgSend_length(v129, v130, v131, v132))
                  {
                    objc_msgSend_addObject_(v120, v133, (uint64_t)v129, v134);
                  }
                  else if (IMOSLoggingEnabled())
                  {
                    v135 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_1A4AF7000, v135, OS_LOG_TYPE_INFO, "Skipping an participant with empty ID!", buf, 2u);
                    }
                  }
                }
                uint64_t v125 = objc_msgSend_countByEnumeratingWithState_objects_count_(v121, v123, (uint64_t)&v211, (uint64_t)v216, 16);
              }
              while (v125);
            }

            if (IMOSLoggingEnabled())
            {
              v136 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v136, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                id v218 = v120;
                _os_log_impl(&dword_1A4AF7000, v136, OS_LOG_TYPE_INFO, "participants of chat we are registering %@", buf, 0xCu);
              }
            }
            if (IMOSLoggingEnabled())
            {
              uint64_t v137 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v137, OS_LOG_TYPE_INFO))
              {
                v141 = objc_msgSend_participants(v210, v138, v139, v140);
                objc_msgSend_arrayByApplyingSelector_(v141, v142, (uint64_t)&sel_ID, v143);
                id v144 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                id v218 = v144;
                _os_log_impl(&dword_1A4AF7000, v137, OS_LOG_TYPE_INFO, "participants of existing chat %@", buf, 0xCu);
              }
            }
          }
        }
        v158 = v210;
        if (v210)
        {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_chatGUIDToChatMap, v205, v158);
        }
        else
        {
          v159 = MEMORY[0x1E4F14500];
          id v160 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v159, OS_LOG_TYPE_ERROR)) {
            sub_1A4CB9038();
          }
        }
        id v161 = v203;
        CFDictionarySetValue((CFMutableDictionaryRef)self->_chatGUIDToCurrentThreadMap, v205, v161);

        v162 = v158;
        if (v210)
        {
          CFDictionarySetValue((CFMutableDictionaryRef)self->_threadNameToChatMap, v161, v162);
        }
        else
        {
          v163 = MEMORY[0x1E4F14500];
          id v164 = MEMORY[0x1E4F14500];
          if (os_log_type_enabled(v163, OS_LOG_TYPE_ERROR)) {
            sub_1A4CB8FBC();
          }
        }
        v168 = objc_msgSend_personCentricID(v162, v165, v166, v167);
        BOOL v169 = v168 == 0;

        if (v169) {
          objc_msgSend__updatePersonCentricIDForChat_(self, v170, (uint64_t)v162, v171);
        }
        if ((objc_msgSend_containsObjectIdenticalTo_(self->_cachedChatsInThreadNameMap, v170, (uint64_t)v162, v171) & 1) == 0) {
          objc_msgSend_addObject_(self->_cachedChatsInThreadNameMap, v172, (uint64_t)v162, v174);
        }
        if (v202)
        {
          id v175 = objc_alloc(NSNumber);
          id v178 = (id)objc_msgSend_initWithBool_(v175, v176, 1, v177);

          id v179 = objc_alloc(MEMORY[0x1E4F1C9E8]);
          id v182 = (id)objc_msgSend_initWithObjectsAndKeys_(v179, v180, (uint64_t)v178, v181, @"__kIMChatRegistryIsIncomingKey", 0);
        }
        else
        {
          id v182 = 0;
          id v178 = 0;
        }
        if (!v199 && ((objc_msgSend_isFirstLoad(self, v172, v173, v174) | !v200) & 1) == 0)
        {
          v183 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v172, v173, v174);
          objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v183, v184, @"__kIMChatRegistryDidRegisterChatNotification", (uint64_t)v162, v182);
        }
        objc_msgSend_verifyFiltering(v162, v172, v173, v174);
        v188 = objc_msgSend__guids(v162, v185, v186, v187);
        objc_msgSend_addObject_(v188, v189, (uint64_t)v205, v190);

LABEL_107:
        uint64_t v10 = v210;
      }
    }
    else
    {
      BOOL v199 = 0;
      if (!v57) {
        goto LABEL_33;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v66 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
    {
      id v70 = objc_msgSend_guid(v10, v67, v68, v69);
      *(_DWORD *)buf = 138412290;
      id v218 = v70;
      _os_log_impl(&dword_1A4AF7000, v66, OS_LOG_TYPE_INFO, " => empty thread name for guid %@", buf, 0xCu);
    }
    goto LABEL_107;
  }
  if (objc_msgSend_chatStyle(v10, v58, v59, v60) != 45)
  {
    v194 = objc_msgSend_participants(v210, v191, v192, v193);
    v197 = objc_msgSend__sortedParticipantIDHashForParticipants_(self, v195, (uint64_t)v194, v196);
    objc_msgSend__addChat_participantSet_(self, v198, (uint64_t)v210, (uint64_t)v197);
  }
  id v11 = v206;
LABEL_111:
}

- (BOOL)isFirstLoad
{
  return self->_firstLoad;
}

- (id)_sortedParticipantIDHashForParticipants:(id)a3
{
  return (id)objc_msgSend__sortedParticipantIDHashForParticipants_usesPersonCentricID_(self, a2, (uint64_t)a3, 1);
}

- (void)_addChat:(id)a3 participantSet:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v9 = a4;
  if (v9)
  {
    uint64_t v13 = objc_msgSend_objectForKey_(self->_groupParticipantToChatsMap, v7, (uint64_t)v9, v8);
    if (!v13)
    {
      uint64_t v13 = objc_msgSend_set(MEMORY[0x1E4F1CA80], v10, v11, v12);
      objc_msgSend_setObject_forKey_(self->_groupParticipantToChatsMap, v14, (uint64_t)v13, (uint64_t)v9);
    }
    objc_msgSend_addObject_(v13, v10, (uint64_t)v6, v12);
    if (!self->_firstLoad && IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v19 = objc_msgSend_guid(v6, v16, v17, v18);
        int v20 = 138412802;
        uint64_t v21 = v19;
        __int16 v22 = 2112;
        id v23 = v9;
        __int16 v24 = 2112;
        uint64_t v25 = v13;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Added chat %@ to chatsForParticipant[%@], now %@", (uint8_t *)&v20, 0x20u);
      }
    }
  }
}

- (void)_noteChatInit:(id)a3
{
  id v11 = a3;
  if (objc_msgSend__shouldRegisterChat(v11, v4, v5, v6)
    && (objc_msgSend_containsObjectIdenticalTo_(self->_allChatsInProcess, v7, (uint64_t)v11, v8) & 1) == 0)
  {
    objc_msgSend_addObject_(self->_allChatsInProcess, v9, (uint64_t)v11, v10);
  }
}

- (void)_updateReplySuggestions:(id)a3 withInfo:(id)a4
{
  uint64_t v103 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_lastFinishedMessageItem(v5, v7, v8, v9);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0 || !objc_msgSend_isTypingMessage(v10, v11, v12, v13))
  {
    uint64_t v14 = objc_msgSend_objectForKey_(v6, v11, *MEMORY[0x1E4F6CE20], v13);
    if (!v14)
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_39:

        goto LABEL_40;
      }
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        int64_t v63 = objc_msgSend_guid(v5, v60, v61, v62);
        int v95 = 138412290;
        uint64_t v96 = v63;
        _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "[%@] no smart replies in info dictionary", (uint8_t *)&v95, 0xCu);
      }
LABEL_38:

      goto LABEL_39;
    }
    uint64_t v21 = objc_msgSend_objectForKey_(v6, v19, *MEMORY[0x1E4F6CD38], v20);
    if (IMOSLoggingEnabled())
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v29 = objc_msgSend_guid(v5, v26, v27, v28);
        int v95 = 138412546;
        uint64_t v96 = v29;
        __int16 v97 = 2112;
        uint64_t v98 = (uint64_t)v21;
        _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "[%@] infoGuid = %@", (uint8_t *)&v95, 0x16u);
      }
    }
    uint64_t v30 = objc_msgSend_guid(v5, v22, v23, v24);
    char isEqualToString = objc_msgSend_isEqualToString_(v30, v31, (uint64_t)v21, v32);

    if ((isEqualToString & 1) == 0)
    {
      uint64_t v37 = objc_msgSend_lastFinishedMessage(v5, v34, v35, v36);
      BOOL v38 = v37 == 0;

      if (v38)
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_38;
        }
        uint64_t v49 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          uint64_t v67 = objc_msgSend_guid(v5, v64, v65, v66);
          int v95 = 138412546;
          uint64_t v96 = v67;
          __int16 v97 = 2112;
          uint64_t v98 = (uint64_t)v21;
          _os_log_impl(&dword_1A4AF7000, v49, OS_LOG_TYPE_INFO, "[%@] returning because last finished message is nil, can't get finished message time with info guid = %@", (uint8_t *)&v95, 0x16u);
        }
        goto LABEL_19;
      }
      uint64_t v42 = objc_msgSend_lastFinishedMessageDate(v5, v39, v40, v41);
      uint64_t v46 = objc_msgSend___im_nanosecondTimeInterval(v42, v43, v44, v45);

      uint64_t v49 = objc_msgSend_objectForKey_(v6, v47, *MEMORY[0x1E4F6CDB8], v48);
      uint64_t v53 = objc_msgSend_longLongValue(v49, v50, v51, v52);
      int v54 = IMOSLoggingEnabled();
      if (v53 < v46)
      {
        if (v54)
        {
          __int16 v55 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            uint64_t v59 = objc_msgSend_guid(v5, v56, v57, v58);
            int v95 = 138413058;
            uint64_t v96 = v59;
            __int16 v97 = 2048;
            uint64_t v98 = v53;
            __int16 v99 = 2048;
            uint64_t v100 = v46;
            __int16 v101 = 2112;
            uint64_t v102 = v21;
            _os_log_impl(&dword_1A4AF7000, v55, OS_LOG_TYPE_INFO, "[%@] returning, info timestamp = %lld < chat timestamp = %lld, info guid = %@", (uint8_t *)&v95, 0x2Au);
          }
        }
LABEL_19:

        goto LABEL_38;
      }
      if (v54)
      {
        uint64_t v68 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
        {
          BOOL v72 = objc_msgSend_guid(v5, v69, v70, v71);
          int v95 = 138413058;
          uint64_t v96 = v72;
          __int16 v97 = 2048;
          uint64_t v98 = v53;
          __int16 v99 = 2048;
          uint64_t v100 = v46;
          __int16 v101 = 2112;
          uint64_t v102 = v21;
          _os_log_impl(&dword_1A4AF7000, v68, OS_LOG_TYPE_INFO, "[%@] info timestamp = %lld > chat timestamp = %lld, info guid = %@", (uint8_t *)&v95, 0x2Au);
        }
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v75 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
      {
        int v79 = objc_msgSend_guid(v5, v76, v77, v78);
        uint64_t v83 = objc_msgSend_replySuggestions(v5, v80, v81, v82);
        uint64_t v87 = objc_msgSend_count(v83, v84, v85, v86);
        uint64_t v91 = objc_msgSend_count(v14, v88, v89, v90);
        int v95 = 138412802;
        uint64_t v96 = v79;
        __int16 v97 = 2048;
        uint64_t v98 = v87;
        __int16 v99 = 2048;
        uint64_t v100 = v91;
        _os_log_impl(&dword_1A4AF7000, v75, OS_LOG_TYPE_INFO, "[%@] Updating smart replies from %tu to %tu", (uint8_t *)&v95, 0x20u);
      }
    }
    objc_msgSend_setReplySuggestions_(v5, v73, (uint64_t)v14, v74);
    objc_msgSend_updateReplySuggestions(v5, v92, v93, v94);
    goto LABEL_38;
  }
  objc_msgSend_setReplySuggestions_(v5, v11, 0, v13);
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = objc_msgSend_guid(v5, v15, v16, v17);
      int v95 = 138412290;
      uint64_t v96 = v18;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "[%@] removing replies for typing indicator", (uint8_t *)&v95, 0xCu);
    }
    goto LABEL_39;
  }
LABEL_40:
}

- (void)_verifyChatMergeWithChat:(id)a3 dictionary:(id)a4
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v9 = v6;
  if (v5 && v6)
  {
    uint64_t v10 = objc_msgSend_objectForKeyedSubscript_(v6, v7, @"style", v8);
    unsigned __int8 v14 = objc_msgSend_intValue(v10, v11, v12, v13);

    int v18 = objc_msgSend_chatStyle(v5, v15, v16, v17);
    BOOL v21 = v18 != v14;
    if (v18 == v14)
    {
      uint64_t v36 = 0;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = objc_msgSend_guid(v5, v23, v24, v25);
          *(_DWORD *)buf = 138412802;
          id v97 = v26;
          __int16 v98 = 1024;
          *(_DWORD *)__int16 v99 = objc_msgSend_chatStyle(v5, v27, v28, v29);
          *(_WORD *)&v99[4] = 1024;
          *(_DWORD *)&v99[6] = v14;
          _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "**WARNING** Incorrectly attempting to register dictionary to chat %@ with style %c (expected %c)", buf, 0x18u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          char v34 = objc_msgSend___im_copyChatDictionaryWithRedactedMessageContent(v9, v31, v32, v33);
          *(_DWORD *)buf = 138412290;
          id v97 = v34;
          _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Dictionary: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v97 = v5;
          _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "Registering with chat: %@", buf, 0xCu);
        }
      }
      uint64_t v36 = @"Mismatched chat style";
    }
    uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v9, v19, @"participants", v20);
    uint64_t v41 = objc_msgSend_participants(v5, v38, v39, v40);
    uint64_t v45 = objc_msgSend_count(v41, v42, v43, v44);
    LOBYTE(v45) = v45 == objc_msgSend_count(v37, v46, v47, v48);

    if ((v45 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v52 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          uint64_t v56 = objc_msgSend_guid(v5, v53, v54, v55);
          uint64_t v60 = objc_msgSend_participants(v5, v57, v58, v59);
          *(_DWORD *)buf = 138412802;
          id v97 = v56;
          __int16 v98 = 2112;
          *(void *)__int16 v99 = v60;
          *(_WORD *)&v99[8] = 2112;
          uint64_t v100 = v37;
          _os_log_impl(&dword_1A4AF7000, v52, OS_LOG_TYPE_INFO, "**WARNING** Incorrectly attempting to register dictionary to chat %@ with participants %@ (expected %@)", buf, 0x20u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v61 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          uint64_t v65 = objc_msgSend___im_copyChatDictionaryWithRedactedMessageContent(v9, v62, v63, v64);
          *(_DWORD *)buf = 138412290;
          id v97 = v65;
          _os_log_impl(&dword_1A4AF7000, v61, OS_LOG_TYPE_INFO, "Dictionary: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v66 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v97 = v5;
          _os_log_impl(&dword_1A4AF7000, v66, OS_LOG_TYPE_INFO, "Registering with chat: %@", buf, 0xCu);
        }
      }
      BOOL v21 = 1;
      uint64_t v36 = @"Mismatched participant count";
    }
    uint64_t v67 = objc_msgSend_participants(v5, v49, v50, v51);
    BOOL v71 = objc_msgSend_count(v67, v68, v69, v70) == 0;

    if (v71)
    {
      if (IMOSLoggingEnabled())
      {
        id v75 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          int v79 = objc_msgSend_guid(v5, v76, v77, v78);
          *(_DWORD *)buf = 138412546;
          id v97 = v79;
          __int16 v98 = 2112;
          *(void *)__int16 v99 = v37;
          _os_log_impl(&dword_1A4AF7000, v75, OS_LOG_TYPE_INFO, "**WARNING** Zero participants in chat %@ (dictionary has %@)", buf, 0x16u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v80 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          uint64_t v84 = objc_msgSend___im_copyChatDictionaryWithRedactedMessageContent(v9, v81, v82, v83);
          *(_DWORD *)buf = 138412290;
          id v97 = v84;
          _os_log_impl(&dword_1A4AF7000, v80, OS_LOG_TYPE_INFO, "Dictionary: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v85 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v97 = v5;
          _os_log_impl(&dword_1A4AF7000, v85, OS_LOG_TYPE_INFO, "Registering with chat: %@", buf, 0xCu);
        }
      }
      uint64_t v36 = @"Zero participants";
    }
    else if (!v21)
    {
LABEL_52:

      goto LABEL_53;
    }
    uint64_t v87 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E890], v72, v73, v74);
    uint64_t v88 = (void *)MEMORY[0x1E4F28C58];
    if (v36) {
      uint64_t v89 = v36;
    }
    else {
      uint64_t v89 = @"Generic merge error";
    }
    uint64_t v94 = *MEMORY[0x1E4F28228];
    int v95 = v89;
    uint64_t v90 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v86, (uint64_t)&v95, (uint64_t)&v94, 1);
    uint64_t v92 = objc_msgSend_errorWithDomain_code_userInfo_(v88, v91, @"com.apple.Messages.IMChatRegistryErrorDomain", 2, v90);
    objc_msgSend_forceAutoBugCaptureWithSubType_errorPayload_(v87, v93, @"Invalid Chat Merge", (uint64_t)v92);

    goto LABEL_52;
  }
LABEL_53:
}

- (void)_setChatHasCommunicatedOveriMessage:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    chatGUIDToiMessageSentOrReceivedMap = self->_chatGUIDToiMessageSentOrReceivedMap;
    id v19 = v4;
    uint64_t v9 = objc_msgSend_guid(v4, v5, v6, v7);
    uint64_t v12 = objc_msgSend_objectForKey_(chatGUIDToiMessageSentOrReceivedMap, v10, (uint64_t)v9, v11);

    id v4 = v19;
    if (!v12)
    {
      uint64_t v16 = self->_chatGUIDToiMessageSentOrReceivedMap;
      uint64_t v17 = objc_msgSend_guid(v19, v13, v14, v15);
      objc_msgSend_setObject_forKey_(v16, v18, (uint64_t)v19, (uint64_t)v17);

      id v4 = v19;
    }
  }
}

- (void)_enumerateChatGUIDPermutationsForChatIdentifier:(id)a3 includingInstantMessageStyle:(BOOL)a4 includingGroupStyle:(BOOL)a5 includingRoomStyle:(BOOL)a6 usingBlock:(id)a7
{
  BOOL v26 = a6;
  BOOL v8 = a5;
  BOOL v9 = a4;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v12 = (void (**)(id, void *, unsigned char *))a7;
  char v31 = 0;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  objc_msgSend_serviceNamesForChatIdentifierSearch(self, v13, v14, v15);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v27, (uint64_t)v32, 16);
  if (v17)
  {
    uint64_t v19 = v17;
    uint64_t v20 = *(void *)v28;
LABEL_3:
    uint64_t v21 = 0;
    while (1)
    {
      if (*(void *)v28 != v20) {
        objc_enumerationMutation(obj);
      }
      if (v9)
      {
        __int16 v22 = (void *)IMCopyGUIDForChat();
        v12[2](v12, v22, &v31);

        if (v31) {
          break;
        }
      }
      if (v8)
      {
        uint64_t v23 = (void *)IMCopyGUIDForChat();
        v12[2](v12, v23, &v31);

        if (v31) {
          break;
        }
      }
      if (v26)
      {
        uint64_t v24 = (void *)IMCopyGUIDForChat();
        v12[2](v12, v24, &v31);

        if (v31) {
          break;
        }
      }
      if (v19 == ++v21)
      {
        uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v18, (uint64_t)&v27, (uint64_t)v32, 16);
        if (v19) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
}

- (NSArray)serviceNamesForChatIdentifierSearch
{
  return self->_serviceNamesForChatIdentifierSearch;
}

- (id)_cachedOneToOneChatForChatDictionary:(id)a3 participants:(id)a4 participantHash:(id)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v13 = objc_msgSend_objectForKeyedSubscript_(v8, v11, *MEMORY[0x1E4F6CE00], v12);
  if (objc_msgSend_count(v9, v14, v15, v16) == 1)
  {
    uint64_t v20 = objc_msgSend_lastObject(v9, v17, v18, v19);
    BOOL v26 = objc_msgSend__cachedChatWithHandle_(self, v21, (uint64_t)v20, v22);
    if (v26
      || (objc_msgSend__cachedChatWithPersonID_(self, v23, (uint64_t)v13, v25),
          (BOOL v26 = objc_claimAutoreleasedReturnValue()) != 0))
    {
      if (objc_msgSend_chatStyle(v26, v23, v24, v25) != 45)
      {
        if (IMOSLoggingEnabled())
        {
          long long v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            int v30 = 138413058;
            id v31 = v20;
            __int16 v32 = 2112;
            id v33 = v13;
            __int16 v34 = 2112;
            uint64_t v35 = v26;
            __int16 v36 = 2112;
            id v37 = v8;
            _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "Found chat with handle %@ (pcID: %@) but rejecting as style is not instant message style, chat: %@ dictionary: %@", (uint8_t *)&v30, 0x2Au);
          }
        }
        BOOL v26 = 0;
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        int v30 = 138412546;
        id v31 = v9;
        __int16 v32 = 2112;
        id v33 = v8;
        _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Chat has 1-1 chat style but incorrect count of participants: %@ dictionary: %@", (uint8_t *)&v30, 0x16u);
      }
    }
    BOOL v26 = 0;
  }

  return v26;
}

- (id)_cachedChatWithHandle:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_ID(v4, v5, v6, v7);
  id v10 = objc_msgSend__cachedChatWithIdentifier_style_(self, v9, (uint64_t)v8, 45);

  if (!v10)
  {
    uint64_t v14 = objc_msgSend_ID(v4, v11, v12, v13);
    id v10 = objc_msgSend__cachedChatWithPersonID_(self, v15, (uint64_t)v14, v16);

    if (objc_msgSend_chatStyle(v10, v17, v18, v19) == 45)
    {
      objc_msgSend_setRecipient_(v10, v20, (uint64_t)v4, v21);
    }
    else
    {

      id v10 = 0;
    }
  }

  return v10;
}

- (id)_cachedChatWithIdentifier:(id)a3 style:(unsigned __int8)a4
{
  int v4 = a4;
  id v6 = a3;
  uint64_t v11 = 0;
  uint64_t v12 = &v11;
  uint64_t v13 = 0x3032000000;
  uint64_t v14 = sub_1A4B345BC;
  uint64_t v15 = sub_1A4B343C4;
  id v16 = 0;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A4B2189C;
  v10[3] = &unk_1E5B7EA68;
  v10[4] = self;
  void v10[5] = &v11;
  objc_msgSend__enumerateChatGUIDPermutationsForChatIdentifier_includingInstantMessageStyle_includingGroupStyle_includingRoomStyle_usingBlock_(self, v7, (uint64_t)v6, v4 == 45, v4 == 43, v4 == 35, v10);
  id v8 = (id)v12[5];
  _Block_object_dispose(&v11, 8);

  return v8;
}

- (id)_cachedGroupChatForGroupChatDictionary:(id)a3 participants:(id)a4 participantHash:(id)a5
{
  uint64_t v267 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v240 = a4;
  id v244 = a5;
  v246 = v7;
  v242 = objc_msgSend_objectForKeyedSubscript_(v7, v8, *MEMORY[0x1E4F6CCF0], v9);
  uint64_t v13 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v10, v11, v12);
  LODWORD(a4) = objc_msgSend_isTranscriptSharingEnabled(v13, v14, v15, v16);

  if a4 && (objc_msgSend_hasPrefix_(v242, v17, *MEMORY[0x1E4F6E4A8], v18))
  {
    uint64_t v19 = 0;
    goto LABEL_104;
  }
  uint64_t v20 = objc_msgSend_objectForKeyedSubscript_(v7, v17, *MEMORY[0x1E4F6CE48], v18);
  char v235 = objc_msgSend_intValue(v20, v21, v22, v23);

  objc_msgSend_objectForKeyedSubscript_(v7, v24, *MEMORY[0x1E4F6CD40], v25);
  v239 = (__CFString *)objc_claimAutoreleasedReturnValue();
  uint64_t v243 = objc_msgSend_objectForKeyedSubscript_(v7, v26, *MEMORY[0x1E4F6CD20], v27);
  v238 = objc_msgSend_objectForKeyedSubscript_(v7, v28, *MEMORY[0x1E4F6CE00], v29);
  v236 = objc_msgSend_objectForKeyedSubscript_(v7, v30, *MEMORY[0x1E4F6CE28], v31);
  v237 = objc_msgSend_objectForKeyedSubscript_(v7, v32, *MEMORY[0x1E4F6CCD8], v33);
  id v37 = objc_msgSend_sharedInstance(IMAccountController, v34, v35, v36);
  v241 = objc_msgSend_accountForUniqueID_(v37, v38, (uint64_t)v237, v39);

  uint64_t v45 = objc_msgSend__cachedChatWithGroupID_(self, v40, (uint64_t)v239, v41);
  BOOL v234 = v45 != 0;
  if (v45)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v49 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_guid(v45, v50, v51, v52);
        id v53 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_displayName(v45, v54, v55, v56);
        uint64_t v57 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        uint64_t v61 = objc_msgSend_personCentricID(v45, v58, v59, v60);
        *(_DWORD *)buf = 138413314;
        uint64_t v258 = (uint64_t)v53;
        __int16 v259 = 2112;
        uint64_t v260 = (uint64_t)v239;
        __int16 v261 = 2112;
        v262 = v57;
        __int16 v263 = 2112;
        uint64_t v264 = v243;
        __int16 v265 = 2112;
        uint64_t v266 = (uint64_t)v61;
        _os_log_impl(&dword_1A4AF7000, v49, OS_LOG_TYPE_INFO, "Found existing candidate chat guid: %@ with groupID: %@ ec displayName %@ displayName %@ existing pcmid %@", buf, 0x34u);
      }
    }
    uint64_t v62 = objc_msgSend_participants(v45, v46, v47, v48);
    uint64_t v65 = objc_msgSend__sortedParticipantIDHashForParticipants_(self, v63, (uint64_t)v62, v64);

    int isEqualToString = objc_msgSend_isEqualToString_(v244, v66, (uint64_t)v65, v67);
    uint64_t v74 = objc_msgSend_displayName(v45, v68, v69, v70);
    if ((void *)v243 == v74)
    {
      int v78 = 1;
    }
    else
    {
      id v75 = objc_msgSend_displayName(v45, v71, v72, v73);
      int v78 = objc_msgSend_isEqualToString_((void *)v243, v76, (uint64_t)v75, v77);
    }
    uint64_t v85 = objc_msgSend_personCentricID(v45, v79, v80, v81);
    if (v238 == v85)
    {
      int v89 = 1;
    }
    else
    {
      uint64_t v86 = objc_msgSend_personCentricID(v45, v82, v83, v84);
      int v89 = objc_msgSend_isEqualToString_(v238, v87, (uint64_t)v86, v88);
    }
    uint64_t v93 = objc_msgSend_chatIdentifier(v45, v90, v91, v92);
    int v96 = objc_msgSend_isEqualToString_(v242, v94, (uint64_t)v93, v95);

    uint64_t v100 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v97, v98, v99);
    int isPriusEnabled = objc_msgSend_isPriusEnabled(v100, v101, v102, v103);

    if (isPriusEnabled)
    {
      uint64_t v108 = objc_msgSend_service(v241, v105, v106, v107);
      int v112 = objc_msgSend_groupsMergeDisplayNames(v108, v109, v110, v111);

      uint64_t v116 = objc_msgSend_account(v45, v113, v114, v115);
      uint64_t v120 = objc_msgSend_service(v116, v117, v118, v119);
      int v124 = objc_msgSend_groupsMergeDisplayNames(v120, v121, v122, v123);

      v78 |= v124 | v112;
    }
    if ((isEqualToString & (v78 & v89 | v96)) == 1)
    {
      uint64_t v19 = v45;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v125 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
        {
          v129 = objc_msgSend_guid(v45, v126, v127, v128);
          uint64_t v132 = objc_msgSend_objectForKeyedSubscript_(v7, v130, @"guid", v131);
          uint64_t v133 = (void *)v132;
          uint64_t v134 = @"NO";
          *(_DWORD *)buf = 138413314;
          uint64_t v258 = (uint64_t)v129;
          if (v89) {
            v135 = @"YES";
          }
          else {
            v135 = @"NO";
          }
          if (v78) {
            v136 = @"YES";
          }
          else {
            v136 = @"NO";
          }
          __int16 v259 = 2112;
          if (isEqualToString) {
            uint64_t v134 = @"YES";
          }
          uint64_t v260 = (uint64_t)v134;
          __int16 v261 = 2112;
          v262 = v136;
          __int16 v263 = 2112;
          uint64_t v264 = (uint64_t)v135;
          __int16 v265 = 2112;
          uint64_t v266 = v132;
          _os_log_impl(&dword_1A4AF7000, v125, OS_LOG_TYPE_INFO, "Found candidate chat %@ but rejected matchingParticipantHash: %@ matchingDisplayName: %@ matchingPersonCentricID: %@ dictionary guid: %@", buf, 0x34u);
        }
      }
      uint64_t v19 = 0;
    }
  }
  else
  {
    uint64_t v19 = 0;
  }
  uint64_t v137 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v42, v43, v44);
  int v141 = objc_msgSend_isPriusEnabled(v137, v138, v139, v140);

  if (v141)
  {
    if (v19)
    {
      BOOL v145 = v243 == 0;
      if (!v45) {
        goto LABEL_103;
      }
      goto LABEL_80;
    }
    objc_msgSend_service(v241, v142, v143, v144);
    id v146 = (id)objc_claimAutoreleasedReturnValue();
    if (!objc_msgSend_groupsMergeDisplayNames(v146, v147, v148, v149))
    {
      uint64_t v19 = 0;
LABEL_54:

      goto LABEL_55;
    }
    BOOL v153 = objc_msgSend_length((void *)v243, v150, v151, v152) == 0;

    if (!v153)
    {
      objc_msgSend__cachedChatsWithDisplayName_(self, v142, v243, v144);
      long long v253 = 0u;
      long long v254 = 0u;
      long long v251 = 0u;
      long long v252 = 0u;
      id v146 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v158 = objc_msgSend_countByEnumeratingWithState_objects_count_(v146, v154, (uint64_t)&v251, (uint64_t)v256, 16);
      if (v158)
      {
        uint64_t v159 = *(void *)v252;
        while (2)
        {
          for (uint64_t i = 0; i != v158; ++i)
          {
            if (*(void *)v252 != v159) {
              objc_enumerationMutation(v146);
            }
            id v161 = *(void **)(*((void *)&v251 + 1) + 8 * i);
            v162 = objc_msgSend_participants(v161, v155, v156, v157);
            v165 = objc_msgSend__sortedParticipantIDHashForParticipants_(self, v163, (uint64_t)v162, v164);

            BOOL v169 = objc_msgSend_account(v161, v166, v167, v168);
            uint64_t v173 = objc_msgSend_serviceName(v169, v170, v171, v172);

            if (objc_msgSend_isEqualToString_(v244, v174, (uint64_t)v165, v175))
            {
              id v179 = objc_msgSend_serviceName(v241, v176, v177, v178);
              int v182 = objc_msgSend_isEqualToString_(v173, v180, (uint64_t)v179, v181);

              if (v182)
              {
                uint64_t v19 = v161;

                goto LABEL_53;
              }
            }
          }
          uint64_t v158 = objc_msgSend_countByEnumeratingWithState_objects_count_(v146, v155, (uint64_t)&v251, (uint64_t)v256, 16);
          if (v158) {
            continue;
          }
          break;
        }
      }
      uint64_t v19 = 0;
LABEL_53:

      goto LABEL_54;
    }
    uint64_t v19 = 0;
  }
LABEL_55:
  BOOL v145 = v243 == 0;
  if (v19 | v243 || !objc_msgSend_count(v240, v142, v143, v144))
  {
    if (!v45) {
      goto LABEL_86;
    }
    goto LABEL_80;
  }
  v183 = objc_msgSend_groupParticipantToChatsMap(self, v142, v143, v144);
  uint64_t v186 = objc_msgSend_objectForKeyedSubscript_(v183, v184, (uint64_t)v244, v185);

  if (objc_msgSend_count(v186, v187, v188, v189))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v190 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v258 = (uint64_t)v240;
        _os_log_impl(&dword_1A4AF7000, v190, OS_LOG_TYPE_INFO, "Existing chats for unnamed group with same participants, participants to match %@", buf, 0xCu);
      }
    }
    BOOL v234 = 1;
  }
  long long v249 = 0u;
  long long v250 = 0u;
  long long v247 = 0u;
  long long v248 = 0u;
  id v191 = v186;
  uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v191, v192, (uint64_t)&v247, (uint64_t)v255, 16);
  if (v196)
  {
    uint64_t v197 = *(void *)v248;
    while (2)
    {
      for (uint64_t j = 0; j != v196; ++j)
      {
        if (*(void *)v248 != v197) {
          objc_enumerationMutation(v191);
        }
        BOOL v199 = *(void **)(*((void *)&v247 + 1) + 8 * j);
        BOOL v200 = objc_msgSend_displayName(v199, v193, v194, v195);
        BOOL v201 = v200 == 0;

        if (v201)
        {
          if (IMOSLoggingEnabled())
          {
            BOOL v202 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v202, OS_LOG_TYPE_INFO))
            {
              objc_msgSend_participants(v199, v203, v204, v205);
              id v206 = (id)objc_claimAutoreleasedReturnValue();
              v210 = objc_msgSend_personCentricID(v199, v207, v208, v209);
              *(_DWORD *)buf = 138412546;
              uint64_t v258 = (uint64_t)v206;
              __int16 v259 = 2112;
              uint64_t v260 = (uint64_t)v210;
              _os_log_impl(&dword_1A4AF7000, v202, OS_LOG_TYPE_INFO, "Matched chat with participants %@ pcmid %@", buf, 0x16u);
            }
          }
          uint64_t v19 = v199;
          goto LABEL_79;
        }
      }
      uint64_t v196 = objc_msgSend_countByEnumeratingWithState_objects_count_(v191, v193, (uint64_t)&v247, (uint64_t)v255, 16);
      if (v196) {
        continue;
      }
      break;
    }
  }
  uint64_t v19 = 0;
LABEL_79:

  BOOL v145 = 1;
  if (v234)
  {
LABEL_80:
    if (((unint64_t)objc_msgSend_count(v240, v142, v143, v144) > 1 || v235 == 43)
      && IMOSLoggingEnabled())
    {
      long long v211 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v211, OS_LOG_TYPE_INFO))
      {
        uint64_t v215 = objc_msgSend_guid((void *)v19, v212, v213, v214);
        id v218 = objc_msgSend_arrayByApplyingSelector_(v240, v216, (uint64_t)&sel_ID, v217);
        *(_DWORD *)buf = 138413314;
        uint64_t v258 = (uint64_t)v215;
        __int16 v259 = 2112;
        uint64_t v260 = v243;
        __int16 v261 = 2112;
        v262 = v239;
        __int16 v263 = 2112;
        uint64_t v264 = (uint64_t)v238;
        __int16 v265 = 2112;
        uint64_t v266 = (uint64_t)v218;
        _os_log_impl(&dword_1A4AF7000, v211, OS_LOG_TYPE_INFO, " ==>  chatForChatDictionary info for chat we matched guid %@ displayName %@ groupID: %@ pcmid %@ participants %@", buf, 0x34u);
      }
    }
  }
LABEL_86:
  if (!v19)
  {
    __int16 v219 = objc_msgSend_serviceName(v241, v142, v143, v144);
    v220 = (__CFString *)IMCopyGUIDForChat();
    if (IMAdditionalChatRegistryLoggingEnabled() && IMOSLoggingEnabled())
    {
      __int16 v223 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v223, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v258 = (uint64_t)v219;
        __int16 v259 = 2112;
        uint64_t v260 = (uint64_t)v236;
        __int16 v261 = 2112;
        v262 = v220;
        _os_log_impl(&dword_1A4AF7000, v223, OS_LOG_TYPE_INFO, "Looking up chat based on service name [%@] and roomName [%@] [%@]", buf, 0x20u);
      }
    }
    uint64_t v19 = objc_msgSend__cachedChatWithGUID_(self, v221, (uint64_t)v220, v222);
    if (v19)
    {
      id v226 = v220;
      if (v145) {
        goto LABEL_102;
      }
    }
    else
    {
      objc_msgSend_isEqualToString_(v219, v224, *MEMORY[0x1E4F6E1A0], v225);
      id v226 = (void *)IMCopyGUIDForChat();

      uint64_t v19 = objc_msgSend__cachedChatWithGUID_(self, v227, (uint64_t)v226, v228);
      if (v145)
      {
LABEL_102:

        goto LABEL_103;
      }
    }
    if (IMAdditionalChatRegistryLoggingEnabled() && IMOSLoggingEnabled())
    {
      v231 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v231, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v258 = v243;
        _os_log_impl(&dword_1A4AF7000, v231, OS_LOG_TYPE_INFO, "Updating chat's display name:%@", buf, 0xCu);
      }
    }
    objc_msgSend__updateDisplayName_((void *)v19, v229, v243, v230);
    goto LABEL_102;
  }
LABEL_103:

LABEL_104:

  return (id)v19;
}

- (id)_sortedParticipantIDHashForParticipants:(id)a3 usesPersonCentricID:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMAdditionalChatRegistryLoggingEnabled() && IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v5;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Incoming list of participants to get sorted and hashed: %@", buf, 0xCu);
    }
  }
  id v7 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v11 = objc_msgSend_count(v5, v8, v9, v10);
  uint64_t v14 = objc_msgSend_initWithCapacity_(v7, v12, v11, v13);
  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v15 = v5;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v40, (uint64_t)v44, 16);
  if (v20)
  {
    uint64_t v21 = *(void *)v41;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v41 != v21) {
          objc_enumerationMutation(v15);
        }
        uint64_t v23 = *(void **)(*((void *)&v40 + 1) + 8 * i);
        uint64_t v24 = objc_msgSend_personCentricID(v23, v17, v18, v19, (void)v40);
        if (objc_msgSend_length(v24, v25, v26, v27)) {
          BOOL v28 = v4;
        }
        else {
          BOOL v28 = 0;
        }

        if (v28)
        {
          uint64_t v32 = objc_msgSend_personCentricID(v23, v29, v30, v31);
        }
        else
        {
          uint64_t v35 = objc_msgSend_ID(v23, v29, v30, v31);
          BOOL v36 = v35 == 0;

          if (v36) {
            continue;
          }
          uint64_t v32 = objc_msgSend_ID(v23, v17, v18, v19);
        }
        id v37 = (void *)v32;
        objc_msgSend_addObject_(v14, v33, v32, v34);
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v40, (uint64_t)v44, 16);
    }
    while (v20);
  }

  uint64_t v38 = IMSHA1HashFromStrings();

  return v38;
}

- (id)_cachedChatWithGUID:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v14 = objc_msgSend_simulatedChats(self, v8, v9, v10);
    if (v14) {
      objc_msgSend_simulatedChatGUIDToChatMap(self, v11, v12, v13);
    }
    else {
    uint64_t v16 = objc_msgSend_chatGUIDToChatMap(self, v11, v12, v13);
    }
    id v15 = objc_msgSend_objectForKey_(v16, v17, (uint64_t)v4, v18);
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (NSArray)simulatedChats
{
  return self->_simulatedChats;
}

- (NSMutableDictionary)chatGUIDToChatMap
{
  return self->_chatGUIDToChatMap;
}

- (id)_cachedChatWithGroupID:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_groupIDToChatMap(self, v5, v6, v7);
  uint64_t v11 = objc_msgSend_objectForKey_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (NSMutableDictionary)groupParticipantToChatsMap
{
  return self->_groupParticipantToChatsMap;
}

+ (Class)messageClass
{
  uint64_t v2 = (void *)qword_1EB3F2290;
  if (!qword_1EB3F2290)
  {
    uint64_t v2 = objc_opt_class();
    qword_1EB3F2290 = (uint64_t)v2;
  }

  return (Class)v2;
}

- (void)_resetChatReconstructionGroupMaps
{
  objc_msgSend_removeAllObjects(self->_groupParticipantToChatsMap, a2, v2, v3);
}

- (IMDaemonQueryController)daemonQueryController
{
  id v4 = objc_msgSend_daemonController(self, a2, v2, v3);
  id v8 = objc_msgSend_queryController(v4, v5, v6, v7);

  return (IMDaemonQueryController *)v8;
}

- (id)existingChatWithChatIdentifier:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7) && (objc_msgSend_isEqualToString_(v4, v8, @"-1", v9) & 1) == 0)
  {
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    v16[2] = sub_1A4B2F300;
    v16[3] = &unk_1E5B7C0B0;
    v16[4] = self;
    id v17 = v4;
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1A4B83EFC;
    v13[3] = &unk_1E5B7C100;
    id v14 = v17;
    id v15 = self;
    uint64_t v10 = objc_msgSend__performSingleChatCacheLookupWithBlock_cacheMissQueryKey_queryBlock_(self, v11, (uint64_t)v16, @"ChatCache-LoadWithIdentifier", v13);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (id)existingChatWithGUID:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1A4B2F2F4;
    v14[3] = &unk_1E5B7C0B0;
    v14[4] = self;
    id v15 = v4;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1A4B830E0;
    v11[3] = &unk_1E5B7C100;
    id v12 = v15;
    uint64_t v13 = self;
    uint64_t v9 = objc_msgSend__performSingleChatCacheLookupWithBlock_cacheMissQueryKey_queryBlock_(self, v8, (uint64_t)v14, @"ChatCache-LoadWithGUID", v11);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)_performSingleChatCacheLookupWithBlock:(id)a3 cacheMissQueryKey:(id)a4 queryBlock:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  v24[0] = MEMORY[0x1E4F143A8];
  v24[1] = 3221225472;
  v24[2] = sub_1A4B2F224;
  v24[3] = &unk_1E5B7C2D8;
  id v25 = v8;
  uint64_t v19 = MEMORY[0x1E4F143A8];
  uint64_t v20 = 3221225472;
  uint64_t v21 = sub_1A4B86D00;
  uint64_t v22 = &unk_1E5B7C300;
  id v23 = v9;
  id v10 = v9;
  id v11 = v8;
  uint64_t v13 = objc_msgSend__performChatCacheLookupWithBlock_cacheMissQueryKey_queryBlock_(self, v12, (uint64_t)v24, (uint64_t)a4, &v19);
  id v17 = objc_msgSend_firstObject(v13, v14, v15, v16, v19, v20, v21, v22);

  return v17;
}

- (id)_performChatCacheLookupWithBlock:(id)a3 cacheMissQueryKey:(id)a4 queryBlock:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  id v8 = (void (**)(id, unsigned char *))a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8 && v10)
  {
    char v66 = 0;
    *(void *)&long long v71 = 0;
    *((void *)&v71 + 1) = &v71;
    uint64_t v72 = 0x3032000000;
    uint64_t v73 = sub_1A4B3449C;
    uint64_t v74 = sub_1A4B34334;
    id v75 = 0;
    v8[2](v8, &v66);
    id v75 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_processingChatCacheMiss(self, v12, v13, v14))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          uint64_t v22 = objc_msgSend_count(*(void **)(*((void *)&v71 + 1) + 40), v19, v20, v21);
          *(_DWORD *)buf = 134217984;
          uint64_t v68 = v22;
          _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Attempting a nested chat cache lookup, returning early with %llu cache results only", buf, 0xCu);
        }
      }
    }
    else
    {
      id v25 = objc_msgSend_daemonController(self, v15, v16, v17);
      BOOL v29 = (objc_msgSend_processCapabilities(v25, v26, v27, v28) & 4) == 0;

      if (v29)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            uint64_t v34 = objc_msgSend_daemonController(self, v31, v32, v33);
            objc_msgSend_processCapabilities(v34, v35, v36, v37);
            IMStringFromClientCapabilities();
            id v38 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v42 = objc_msgSend_count(*(void **)(*((void *)&v71 + 1) + 40), v39, v40, v41);
            *(_DWORD *)buf = 138412546;
            uint64_t v68 = (uint64_t)v38;
            __int16 v69 = 2048;
            uint64_t v70 = v42;
            _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Attempting a chat cache lookup without chats capability (has %@), returning early with %llu cache results only", buf, 0x16u);
          }
        }
      }
      else if (v66)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v45 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v68 = (uint64_t)v9;
            _os_log_impl(&dword_1A4AF7000, v45, OS_LOG_TYPE_INFO, "Chat cache miss for key %@", buf, 0xCu);
          }
        }
        id v46 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v47 = objc_msgSend___imArrayByApplyingBlock_(*(void **)(*((void *)&v71 + 1) + 40), v43, (uint64_t)&unk_1EF8E6388, v44);
        uint64_t v50 = objc_msgSend_setWithArray_(v46, v48, (uint64_t)v47, v49);

        uint64_t v54 = objc_msgSend_daemonQueryController(self, v51, v52, v53);
        v63[0] = MEMORY[0x1E4F143A8];
        v63[1] = 3221225472;
        v63[2] = sub_1A4B86D18;
        v63[3] = &unk_1E5B7C348;
        v63[4] = self;
        id v65 = v11;
        id v55 = v50;
        id v64 = v55;
        v58[0] = MEMORY[0x1E4F143A8];
        v58[1] = 3221225472;
        v58[2] = sub_1A4B86DE0;
        v58[3] = &unk_1E5B7C370;
        uint64_t v62 = &v71;
        uint64_t v61 = v8;
        id v59 = v9;
        uint64_t v60 = self;
        objc_msgSend_performQueryWithKey_expectsSynchronousResult_block_completionHandler_(v54, v56, (uint64_t)v59, 1, v63, v58);
      }
    }
    id v24 = *(id *)(*((void *)&v71 + 1) + 40);
    _Block_object_dispose(&v71, 8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        LODWORD(v71) = 136315138;
        *(void *)((char *)&v71 + 4) = "-[IMChatRegistry(Queries_Internal) _performChatCacheLookupWithBlock:cacheMissQue"
                                        "ryKey:queryBlock:]";
        _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Sent nil block to %s", (uint8_t *)&v71, 0xCu);
      }
    }
    id v24 = (id)MEMORY[0x1E4F1CBF0];
  }

  return v24;
}

- (IMDaemonController)daemonController
{
  return (IMDaemonController *)objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
}

- (BOOL)processingChatCacheMiss
{
  return self->_processingChatCacheMiss;
}

- (id)_cachedChatWithIdentifier:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  id v10 = &v9;
  uint64_t v11 = 0x3032000000;
  id v12 = sub_1A4B345BC;
  uint64_t v13 = sub_1A4B343C4;
  id v14 = 0;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A4B26304;
  v8[3] = &unk_1E5B7EA68;
  v8[4] = self;
  v8[5] = &v9;
  objc_msgSend__enumerateChatGUIDPermutationsForChatIdentifier_includingInstantMessageStyle_includingGroupStyle_includingRoomStyle_usingBlock_(self, v5, (uint64_t)v4, 1, 1, 0, v8);
  id v6 = (id)v10[5];
  _Block_object_dispose(&v9, 8);

  return v6;
}

- (id)initAsListener:(BOOL)a3
{
  BOOL v3 = a3;
  v127.receiver = self;
  v127.super_class = (Class)IMChatRegistry;
  id v7 = [(IMChatRegistry *)&v127 init];
  if (v7)
  {
    id v8 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v4, v5, v6);
    objc_msgSend_addObserver_selector_name_object_(v8, v9, (uint64_t)v7, (uint64_t)sel__handleChatParticipantsDidChange_, @"__kIMChatParticipantsDidChangeNotification", 0);

    uint64_t v13 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v10, v11, v12);
    objc_msgSend_addObserver_selector_name_object_(v13, v14, (uint64_t)v7, (uint64_t)sel__handleAddressBookChange_, *MEMORY[0x1E4F6CA60], 0);

    uint64_t v18 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v15, v16, v17);
    objc_msgSend_addObserver_selector_name_object_(v18, v19, (uint64_t)v7, (uint64_t)sel__handleAddressBookChange_, *MEMORY[0x1E4F6CA50], 0);

    id v23 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v20, v21, v22);
    objc_msgSend_addObserver_selector_name_object_(v23, v24, (uint64_t)v7, (uint64_t)sel__handleAvailabilityChangedNotification_, IMHandleAvailabilityChangedNotification, 0);

    uint64_t v28 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v25, v26, v27);
    objc_msgSend_addObserver_selector_name_object_(v28, v29, (uint64_t)v7, (uint64_t)sel__handleAvailabilityInvitationReceivedNotification_, IMHandleAvailabilityInvitationReceivedNotification, 0);

    uint64_t v33 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v30, v31, v32);
    objc_msgSend_addObserver_selector_name_object_(v33, v34, (uint64_t)v7, (uint64_t)sel__handleAvailabilityStateChangedNotification_, IMHandleAvailabilityStateChangedNotification, 0);

    id v38 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v35, v36, v37);
    objc_msgSend_addObserver_selector_name_object_(v38, v39, (uint64_t)v7, (uint64_t)sel__daemonReallyDied_, @"__k_IMDaemonDidDisconnectNotification", 0);

    long long v43 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v40, v41, v42);
    objc_msgSend_addObserver_selector_name_object_(v43, v44, (uint64_t)v7, (uint64_t)sel__handleOffGridChangedNotification_, *MEMORY[0x1E4F6D490], 0);

    uint64_t v48 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v45, v46, v47);
    objc_msgSend_addObserver_selector_name_object_(v48, v49, (uint64_t)v7, (uint64_t)sel__handleOffGridInvitationReceivedNotification_, *MEMORY[0x1E4F6D4A0], 0);

    uint64_t v53 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v50, v51, v52);
    objc_msgSend_addObserver_selector_name_object_(v53, v54, (uint64_t)v7, (uint64_t)sel__handleOffGridStateChangedNotification_, *MEMORY[0x1E4F6D4A8], 0);

    uint64_t v58 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v55, v56, v57);
    objc_msgSend_addObserver_selector_name_object_(v58, v59, (uint64_t)v7, (uint64_t)sel__handleKeyTransparencyStatusChangedNotification_, @"__kIMChatKeyTransparencyStatusChangedNotification", 0);

    uint64_t v63 = objc_msgSend_sharedList(MEMORY[0x1E4F6E8A8], v60, v61, v62);
    objc_msgSend_registerForGroupIDChangeNotifications(v63, v64, v65, v66);

    *((unsigned char *)v7 + 17) = 1;
    uint64_t v67 = (void *)*((void *)v7 + 12);
    *((void *)v7 + 12) = 0;

    *((_WORD *)v7 + 6) = 256;
    uint64_t v68 = (void *)*((void *)v7 + 13);
    *((void *)v7 + 13) = 0;

    __int16 v69 = (void *)*((void *)v7 + 15);
    *((void *)v7 + 14) = 0;
    *((void *)v7 + 15) = 0;

    uint64_t v70 = (void *)*((void *)v7 + 30);
    *((void *)v7 + 30) = 0;

    long long v71 = (void *)*((void *)v7 + 29);
    *((void *)v7 + 29) = 0;

    uint64_t v75 = objc_msgSend_nonRetainingArray(MEMORY[0x1E4F1CA48], v72, v73, v74);
    uint64_t v76 = (void *)*((void *)v7 + 17);
    *((void *)v7 + 17) = v75;

    id v77 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v78 = (void *)*((void *)v7 + 21);
    *((void *)v7 + 21) = v77;

    id v79 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v80 = (void *)*((void *)v7 + 19);
    *((void *)v7 + 19) = v79;

    id v81 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v82 = (void *)*((void *)v7 + 20);
    *((void *)v7 + 20) = v81;

    id v83 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v84 = (void *)*((void *)v7 + 24);
    *((void *)v7 + 24) = v83;

    id v85 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v86 = (void *)*((void *)v7 + 16);
    *((void *)v7 + 16) = v85;

    id v87 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v88 = (void *)*((void *)v7 + 26);
    *((void *)v7 + 26) = v87;

    id v89 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v90 = (void *)*((void *)v7 + 27);
    *((void *)v7 + 27) = v89;

    id v91 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v92 = (void *)*((void *)v7 + 22);
    *((void *)v7 + 22) = v91;

    id v93 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    uint64_t v94 = (void *)*((void *)v7 + 18);
    *((void *)v7 + 18) = v93;

    uint64_t v98 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C360], v95, v96, v97);
    *((unsigned char *)v7 + 14) = objc_msgSend_isInternalInstall(v98, v99, v100, v101);

    *((unsigned char *)v7 + 16) = 0;
    if (v3)
    {
      uint64_t v105 = objc_msgSend_sharedInstance(IMDaemonController, v102, v103, v104);
      uint64_t v109 = objc_msgSend_listener(v105, v106, v107, v108);
      objc_msgSend_addHandler_(v109, v110, (uint64_t)v7, v111);

      uint64_t v115 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C3E0], v112, v113, v114);
      objc_msgSend_addListener_(v115, v116, (uint64_t)v7, v117);
    }
    id v118 = (id)objc_msgSend_sharedInstance(IMChatHistoryController, v102, v103, v104);
    id v119 = objc_alloc_init(MEMORY[0x1E4FADB78]);
    uint64_t v120 = (void *)*((void *)v7 + 11);
    *((void *)v7 + 11) = v119;

    dispatch_queue_t v121 = dispatch_queue_create("IMChatRegistry.contactStoreQueue", 0);
    uint64_t v122 = (void *)*((void *)v7 + 6);
    *((void *)v7 + 6) = v121;

    uint64_t v123 = *((void *)v7 + 6);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4B34E7C;
    block[3] = &unk_1E5B7ACD0;
    id v126 = v7;
    dispatch_async(v123, block);
  }
  return v7;
}

- (void)_resetChatRegistry
{
  objc_msgSend_removeAllObjects(self->_chatGUIDToCurrentThreadMap, a2, v2, v3);
  objc_msgSend_removeAllObjects(self->_chatGUIDToInfoMap, v5, v6, v7);
  objc_msgSend_removeAllObjects(self->_chatGUIDToChatMap, v8, v9, v10);
  objc_msgSend_removeAllObjects(self->_chatGUIDToiMessageSentOrReceivedMap, v11, v12, v13);
  objc_msgSend_removeAllObjects(self->_allChatsInProcess, v14, v15, v16);
  objc_msgSend_removeAllObjects(self->_chatPersonIDToChatMap, v17, v18, v19);
  objc_msgSend_removeAllObjects(self->_cachedChatsInThreadNameMap, v20, v21, v22);
  objc_msgSend_removeAllObjects(self->_threadNameToChatMap, v23, v24, v25);
  objc_msgSend_removeAllObjects(self->_groupIDToChatMap, v26, v27, v28);

  objc_msgSend__resetChatReconstructionGroupMaps(self, v29, v30, v31);
}

- (BOOL)filterediMessageChatsExist
{
  return self->_filterediMessageChatsExist;
}

- (void)setUserActivityForChat:(id)a3 orHandles:(id)a4
{
}

- (void)updateRecoverableMessagesMetadataSynchronously:(BOOL)a3 completionHandler:(id)a4
{
}

- (void)setupComplete
{
  objc_msgSend_setWantsHistoryReload_(self, a2, 0, v2);
}

- (void)_daemonCompletedDeferredSetup
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int isFirstLoad = objc_msgSend_isFirstLoad(self, v6, v7, v8);
      uint64_t v10 = @"NO";
      if (isFirstLoad) {
        uint64_t v10 = @"YES";
      }
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Daemon completed deferred setup (firstLoad was: %@)", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_msgSend_setFirstLoad_(self, v3, 0, v4);
}

- (void)_daemonBeganDeferredSetup
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int isFirstLoad = objc_msgSend_isFirstLoad(self, v7, v8, v9);
      int v11 = @"NO";
      if (isFirstLoad) {
        int v11 = @"YES";
      }
      int v12 = 138412290;
      uint64_t v13 = v11;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Daemon began deferred setup (firstLoad is: %@)", (uint8_t *)&v12, 0xCu);
    }
  }
  objc_msgSend__recalculateServiceNamesForChatIdentifierSearch(self, v3, v4, v5);
}

- (void)__handleMergedChatReconstructions:(id)a3
{
}

- (NSUserActivity)userActivity
{
  return self->_userActivity;
}

- (unint64_t)unreadCount
{
  return self->_unreadCount;
}

- (void)setWantsHistoryReload:(BOOL)a3
{
  self->_wantsHistoryReload = a3;
}

- (void)setUserActivity:(id)a3
{
}

- (void)setUnreadCount:(unint64_t)a3
{
  self->_unreadCount = a3;
}

- (void)setServiceNamesForChatIdentifierSearch:(id)a3
{
}

- (void)setLoading:(BOOL)a3
{
  self->_loading = a3;
}

- (void)setLastFailedMessageDate:(int64_t)a3
{
  self->_lastuint64_t FailedMessageDate = a3;
}

- (void)setHistoryModificationStamp:(id)a3
{
}

- (void)setFirstLoad:(BOOL)a3
{
  self->_firstLoad = a3;
}

- (void)setFilterediMessageChatsExist:(BOOL)a3
{
  self->_filterediMessageChatsExist = a3;
}

- (void)setFilterCategoryToEarliestInitiallyFetchedLastMessageDate:(id)a3
{
}

- (void)setDaemonHadTerminated:(BOOL)a3
{
  self->_daemonHadTerminated = a3;
}

- (void)setBlackholedChatsExist:(BOOL)a3
{
  self->_blackholedChatsExist = a3;
}

- (int64_t)lastFailedMessageDate
{
  return self->_lastFailedMessageDate;
}

- (NSDictionary)filterCategoryToEarliestInitiallyFetchedLastMessageDate
{
  return self->_filterCategoryToEarliestInitiallyFetchedLastMessageDate;
}

- (BOOL)daemonHadTerminated
{
  return self->_daemonHadTerminated;
}

- (BOOL)blackholedChatsExist
{
  return self->_blackholedChatsExist;
}

- (void)_updateFilterediMessageChatsExist:(BOOL)a3
{
}

- (void)_setPostMessageSentNotifications:(BOOL)a3
{
  self->_postMessageSentNotifications = a3;
}

- (void)_setDefaultNumberOfMessagesToLoad:(unint64_t)a3
{
  self->_defaultNumberOfMessagesToLoad = a3;
}

+ (BOOL)hasInitializedChatFiltering
{
  if (qword_1E965E750 != -1) {
    dispatch_once(&qword_1E965E750, &unk_1EF8E3B90);
  }
  return byte_1E9660AC8;
}

+ (void)setHasInitializedChatFiltering:(BOOL)a3
{
  if (byte_1E9660AC8 != a3)
  {
    byte_1E9660AC8 = a3;
    IMSetDomainBoolForKey();
  }
}

- (void)verifyFilteringForAllChats
{
  if ((sub_1A4B34FF8() & 1) != 0 || IMIsRunningInUnitTesting())
  {
    uint64_t v6 = objc_msgSend_cachedChats(self, v3, v4, v5);
    objc_msgSend_enumerateObjectsUsingBlock_(v6, v7, (uint64_t)&unk_1EF8E5A18, v8);

    uint64_t v9 = objc_opt_class();
    MEMORY[0x1F4181798](v9, sel_setHasInitializedChatFiltering_, 1, v10);
  }
}

- (id)existingConversationForFaceTimeConversationUUID:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v42 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Existing TUConversation with UUID: %@", buf, 0xCu);
    }
  }
  long long v38 = 0u;
  long long v39 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v9 = objc_msgSend_conversationManager(self, v5, v6, v7);
  uint64_t v13 = objc_msgSend_activeConversations(v9, v10, v11, v12);

  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v36, (uint64_t)v40, 16);
  if (v15)
  {
    uint64_t v17 = *(void *)v37;
    *(void *)&long long v16 = 138412290;
    long long v35 = v16;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v37 != v17) {
          objc_enumerationMutation(v13);
        }
        uint64_t v19 = *(void **)(*((void *)&v36 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          id v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            uint64_t v27 = objc_msgSend_UUID(v19, v24, v25, v26);
            *(_DWORD *)buf = v35;
            id v42 = v27;
            _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Active TUConversation UUID: %@", buf, 0xCu);
          }
        }
        uint64_t v28 = objc_msgSend_UUID(v19, v20, v21, v22, v35);
        int isEqual = objc_msgSend_isEqual_(v28, v29, (uint64_t)v4, v30);

        if (isEqual)
        {
          id v33 = v19;
          goto LABEL_19;
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v32, (uint64_t)&v36, (uint64_t)v40, 16);
      if (v15) {
        continue;
      }
      break;
    }
  }
  id v33 = 0;
LABEL_19:

  return v33;
}

- (id)chatForFaceTimeConversation:(id)a3
{
  uint64_t v5 = objc_msgSend_remoteMemberHandleStrings(a3, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_chatForFaceTimeRecipientIDs_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (id)chatForFaceTimeRecipientIDs:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedInstance(IMAccountController, v4, v5, v6);
  uint64_t v11 = objc_msgSend_activeIMessageAccount(v7, v8, v9, v10);

  uint64_t v15 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v12, v13, v14);
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  id v16 = v3;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v37, (uint64_t)v41, 16);
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v38 != v20) {
          objc_enumerationMutation(v16);
        }
        uint64_t v22 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        id v23 = [IMHandle alloc];
        uint64_t v25 = objc_msgSend_initWithAccount_ID_alreadyCanonical_(v23, v24, (uint64_t)v11, v22, 0, (void)v37);
        objc_msgSend_addObject_(v15, v26, (uint64_t)v25, v27);
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v28, (uint64_t)&v37, (uint64_t)v41, 16);
    }
    while (v19);
  }

  uint64_t v32 = objc_msgSend_sharedRegistry(IMChatRegistry, v29, v30, v31);
  long long v35 = objc_msgSend_chatWithHandles_(v32, v33, (uint64_t)v15, v34);

  return v35;
}

- (id)chatWithHandle:(id)a3
{
  return (id)objc_msgSend_chatWithHandle_lastAddressedHandle_lastAddressedSIMID_(self, a2, (uint64_t)a3, 0, 0);
}

- (id)chatWithHandle:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v69 = v8;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_DEBUG, "handle: %@", buf, 0xCu);
    }
  }
  if (!v8)
  {
    isDeletingIncomingMessages = 0;
    goto LABEL_43;
  }
  isDeletingIncomingMessages = objc_msgSend_existingChatWithHandle_(self, v11, (uint64_t)v8, v12);
  if (isDeletingIncomingMessages) {
    goto LABEL_7;
  }
  if (IMSharedHelperContactsBasedMergingEnabled())
  {
    isDeletingIncomingMessages = objc_msgSend__existingChatForHandleUsingPersonID_(self, v24, (uint64_t)v8, v25);
    if (isDeletingIncomingMessages)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v69 = isDeletingIncomingMessages;
          _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Found a chat using PersonID: %@ ", buf, 0xCu);
        }
      }
      objc_msgSend_setRecipient_(isDeletingIncomingMessages, v26, (uint64_t)v8, v27);
LABEL_7:
      if (IMOSLoggingEnabled())
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v69 = isDeletingIncomingMessages;
          __int16 v70 = 2112;
          id v71 = v8;
          _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Redirecting chat %@ to handle: %@", buf, 0x16u);
        }
      }
      objc_msgSend_setRecipient_(isDeletingIncomingMessages, v15, (uint64_t)v8, v16);
      uint64_t v21 = objc_msgSend_account(v8, v18, v19, v20);
      objc_msgSend__setAccount_(isDeletingIncomingMessages, v22, (uint64_t)v21, v23);

      goto LABEL_43;
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "No chat found", buf, 2u);
    }
  }
  isDeletingIncomingMessages = objc_msgSend__possiblyUnregisteredCachedChatWithHandle_(self, v29, (uint64_t)v8, v30);
  if (isDeletingIncomingMessages)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v69 = isDeletingIncomingMessages;
        _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "Found created chat: %@", buf, 0xCu);
      }
    }
    objc_msgSend_setRecipient_(isDeletingIncomingMessages, v32, (uint64_t)v8, v33);
    long long v38 = objc_msgSend_account(v8, v35, v36, v37);
    objc_msgSend__setAccount_(isDeletingIncomingMessages, v39, (uint64_t)v38, v40);
  }
  else
  {
    uint64_t v41 = [IMChat alloc];
    uint64_t v45 = objc_msgSend_account(v8, v42, v43, v44);
    uint64_t v46 = IMSingleObjectArray();
    BYTE2(v67) = 0;
    LOWORD(v67) = 0;
    isDeletingIncomingMessages = objc_msgSend__initWithGUID_account_style_roomName_displayName_lastAddressedHandle_lastAddressedSIMID_items_participants_isFiltered_hasHadSuccessfulQuery_isRecovered_isDeletingIncomingMessages_(v41, v47, 0, (uint64_t)v45, 45, 0, 0, v9, v10, 0, v46, 1, v67);

    objc_msgSend__setupObservation(isDeletingIncomingMessages, v48, v49, v50);
    if (IMOSLoggingEnabled())
    {
      uint64_t v51 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_lastAddressedHandleID(isDeletingIncomingMessages, v52, v53, v54);
        id v55 = (id)objc_claimAutoreleasedReturnValue();
        id v59 = objc_msgSend_lastAddressedSIMID(isDeletingIncomingMessages, v56, v57, v58);
        *(_DWORD *)buf = 138412802;
        id v69 = isDeletingIncomingMessages;
        __int16 v70 = 2112;
        id v71 = v55;
        __int16 v72 = 2112;
        uint64_t v73 = v59;
        _os_log_impl(&dword_1A4AF7000, v51, OS_LOG_TYPE_INFO, "Created chat: %@ lastaddressed handle %@ last addressed simID %@", buf, 0x20u);
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v61 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v69 = isDeletingIncomingMessages;
      _os_log_impl(&dword_1A4AF7000, v61, OS_LOG_TYPE_INFO, "registering outgoing chat: %@", buf, 0xCu);
    }
  }
  objc_msgSend__registerChat_isIncoming_guid_(self, v60, (uint64_t)isDeletingIncomingMessages, 0, 0);
  if (IMOSLoggingEnabled())
  {
    uint64_t v65 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v69 = isDeletingIncomingMessages;
      _os_log_impl(&dword_1A4AF7000, v65, OS_LOG_TYPE_INFO, "Joining chat: %@", buf, 0xCu);
    }
  }
  objc_msgSend_join(isDeletingIncomingMessages, v62, v63, v64);
LABEL_43:

  return isDeletingIncomingMessages;
}

- (id)chatWithHandles:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_chatWithHandles_lastAddressedHandle_lastAddressedSIMID_, a3, 0);
}

- (id)chatWithHandles:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5
{
  return (id)MEMORY[0x1F4181798](self, sel_chatWithHandles_displayName_joinedChatsOnly_lastAddressedHandle_lastAddressedSIMID_, a3, 0);
}

- (id)chatWithHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5
{
  return (id)MEMORY[0x1F4181798](self, sel_chatWithHandles_displayName_joinedChatsOnly_lastAddressedHandle_lastAddressedSIMID_, a3, a4);
}

- (id)chatWithHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5 lastAddressedHandle:(id)a6 lastAddressedSIMID:(id)a7
{
  return (id)MEMORY[0x1F4181798](self, sel_chatWithHandles_displayName_joinedChatsOnly_findMatchingNamedGroups_lastAddressedHandle_lastAddressedSIMID_, a3, a4);
}

- (id)chatWithHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5 findMatchingNamedGroups:(BOOL)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v17 = a8;
  uint64_t v21 = objc_msgSend_count(v14, v18, v19, v20);
  if (!v21)
  {
    isDeletingIncomingMessages = 0;
    goto LABEL_29;
  }
  if (v21 == 1)
  {
    uint64_t v25 = objc_msgSend_lastObject(v14, v22, v23, v24);
    isDeletingIncomingMessages = objc_msgSend_chatWithHandle_lastAddressedHandle_lastAddressedSIMID_(self, v26, (uint64_t)v25, (uint64_t)v16, v17);

    goto LABEL_29;
  }
  if (v10)
  {
    isDeletingIncomingMessages = objc_msgSend_existingChatWithHandles_allowAlternativeService_groupID_displayName_joinedChatsOnly_(self, v22, (uint64_t)v14, 0, 0, v15, v11);
    if (isDeletingIncomingMessages)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v54 = isDeletingIncomingMessages;
          _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Found existing chat: %@", buf, 0xCu);
        }
      }
      goto LABEL_29;
    }
  }
  BOOL v29 = objc_msgSend_lastObject(v14, v22, v23, v24);
  uint64_t v33 = objc_msgSend_account(v29, v30, v31, v32);

  isDeletingIncomingMessages = objc_msgSend__possiblyUnregisteredCachedChatWithHandles_style_groupID_displayName_joinedChatsOnly_(self, v34, (uint64_t)v14, 43, 0, v15, v11);
  if (isDeletingIncomingMessages)
  {
    if (IMOSLoggingEnabled())
    {
      long long v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v54 = isDeletingIncomingMessages;
        _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "Found created chat: %@", buf, 0xCu);
      }
LABEL_19:
    }
  }
  else
  {
    uint64_t v36 = [IMChat alloc];
    BYTE2(v52) = 0;
    LOWORD(v52) = 0;
    isDeletingIncomingMessages = objc_msgSend__initWithGUID_account_style_roomName_displayName_lastAddressedHandle_lastAddressedSIMID_items_participants_isFiltered_hasHadSuccessfulQuery_isRecovered_isDeletingIncomingMessages_(v36, v37, 0, (uint64_t)v33, 43, 0, v15, v16, v17, 0, v14, 1, v52);
    objc_msgSend__setupObservation(isDeletingIncomingMessages, v38, v39, v40);
    if (IMOSLoggingEnabled())
    {
      long long v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v44 = objc_msgSend_lastAddressedHandleID(isDeletingIncomingMessages, v41, v42, v43);
        *(_DWORD *)buf = 138412546;
        uint64_t v54 = isDeletingIncomingMessages;
        __int16 v55 = 2112;
        uint64_t v56 = v44;
        _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "Created chat: %@ , lastAddressedHandle %@", buf, 0x16u);
      }
      goto LABEL_19;
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v46 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v54 = isDeletingIncomingMessages;
      _os_log_impl(&dword_1A4AF7000, v46, OS_LOG_TYPE_INFO, "Registering outgoing chat: %@", buf, 0xCu);
    }
  }
  objc_msgSend__registerChat_isIncoming_guid_(self, v45, (uint64_t)isDeletingIncomingMessages, 0, 0);
  if (IMOSLoggingEnabled())
  {
    uint64_t v50 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v54 = isDeletingIncomingMessages;
      _os_log_impl(&dword_1A4AF7000, v50, OS_LOG_TYPE_INFO, "Joining chat: %@", buf, 0xCu);
    }
  }
  objc_msgSend_join(isDeletingIncomingMessages, v47, v48, v49);

LABEL_29:

  return isDeletingIncomingMessages;
}

- (id)allGUIDsForChat:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    id v9 = objc_msgSend_chatGUIDToChatMap(self, v6, v7, v8);
    uint64_t v18 = MEMORY[0x1E4F143A8];
    uint64_t v19 = 3221225472;
    uint64_t v20 = sub_1A4B830C4;
    uint64_t v21 = &unk_1E5B7C088;
    id v22 = v4;
    id v23 = v5;
    id v10 = v5;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v9, v11, (uint64_t)&v18, v12);

    id v16 = objc_msgSend_copy(v10, v13, v14, v15, v18, v19, v20, v21);
  }
  else
  {
    id v16 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v16;
}

- (void)updateChatsUsingMessageGUIDsAndSummaries:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_messageSummarizationEnabled(MEMORY[0x1E4F6E790], v5, v6, v7))
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v19 = 0;
        _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Requesting to update messages with summaries.", v19, 2u);
      }
    }
    uint64_t v12 = objc_msgSend_daemonController(self, v8, v9, v10);
    id v16 = objc_msgSend_remoteDaemon(v12, v13, v14, v15);
    objc_msgSend_updateChatsUsingMessageGUIDsAndSummaries_(v16, v17, (uint64_t)v4, v18);
  }
}

- (id)existingChatsWithGUIDs:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1A4B834A4;
    v14[3] = &unk_1E5B7C128;
    id v15 = v4;
    id v16 = self;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1A4B83674;
    v11[3] = &unk_1E5B7C178;
    id v12 = v15;
    uint64_t v13 = self;
    uint64_t v9 = objc_msgSend__performChatCacheLookupWithBlock_cacheMissQueryKey_queryBlock_(self, v8, (uint64_t)v14, @"ChatCache-LoadWithGUID", v11);
  }
  else
  {
    uint64_t v9 = (void *)MEMORY[0x1E4F1CBF0];
  }

  return v9;
}

- (id)_chatPredicateForGUIDs:(id)a3
{
  id v4 = objc_msgSend___imArrayByApplyingBlock_(a3, a2, (uint64_t)&unk_1EF8E5278, v3);
  uint64_t v7 = objc_msgSend_orPredicateWithSubpredicates_(MEMORY[0x1E4F28BA0], v5, (uint64_t)v4, v6);

  return v7;
}

- (id)existingChatWithHandle:(id)a3
{
  return (id)objc_msgSend_existingChatWithHandle_allowAlternativeService_(self, a2, (uint64_t)a3, 1);
}

- (id)existingChatWithHandle:(id)a3 allowAlternativeService:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v13 = objc_msgSend_ID(v6, v7, v8, v9);
  if (v4)
  {
    uint64_t v14 = objc_msgSend_existingChatWithChatIdentifier_(self, v10, (uint64_t)v13, v12);
  }
  else
  {
    id v15 = objc_msgSend_service(v6, v10, v11, v12);
    uint64_t v19 = objc_msgSend_internalName(v15, v16, v17, v18);
    uint64_t v14 = objc_msgSend__existingChatWithIdentifier_style_service_(self, v20, (uint64_t)v13, 45, v19);
  }
  if (v14 && objc_msgSend_chatStyle(v14, v21, v22, v23) != 45)
  {

    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v29 = 138412802;
        id v30 = v6;
        __int16 v31 = 1024;
        int v32 = (char)objc_msgSend_chatStyle(0, v25, v26, v27);
        __int16 v33 = 2112;
        uint64_t v34 = 0;
        _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "Looked up existing chat for handle %@ but got chat style %c, returning nil chat (found %@)", (uint8_t *)&v29, 0x1Cu);
      }
    }
    uint64_t v14 = 0;
  }

  return v14;
}

- (id)existingChatWithHandles:(id)a3
{
  return (id)objc_msgSend_existingChatWithHandles_allowAlternativeService_groupID_displayName_joinedChatsOnly_(self, a2, (uint64_t)a3, 1, 0, 0, 0);
}

- (id)existingChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4
{
  return (id)objc_msgSend_existingChatWithHandles_allowAlternativeService_groupID_displayName_joinedChatsOnly_(self, a2, (uint64_t)a3, a4, 0, 0, 0);
}

- (id)existingChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4 groupID:(id)a5
{
  return (id)objc_msgSend_existingChatWithHandles_allowAlternativeService_groupID_displayName_joinedChatsOnly_(self, a2, (uint64_t)a3, a4, 0, 0, 0);
}

- (id)existingChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7
{
  return (id)MEMORY[0x1F4181798](self, sel_existingChatWithHandles_allowAlternativeService_groupID_displayName_joinedChatsOnly_findMatchingNamedGroups_, a3, a4);
}

- (id)existingChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7 findMatchingNamedGroups:(BOOL)a8
{
  BOOL v12 = a4;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  uint64_t v20 = objc_msgSend_count(v14, v17, v18, v19);
  if (v20)
  {
    if (v20 == 1)
    {
      uint64_t v24 = objc_msgSend_firstObject(v14, v21, v22, v23);
      uint64_t v26 = objc_msgSend_existingChatWithHandle_allowAlternativeService_(self, v25, (uint64_t)v24, v12);
    }
    else
    {
      v36[0] = MEMORY[0x1E4F143A8];
      v36[1] = 3221225472;
      v36[2] = sub_1A4B83CC0;
      v36[3] = &unk_1E5B7C1C0;
      v36[4] = self;
      id v37 = v14;
      BOOL v40 = v12;
      id v38 = v15;
      id v39 = v16;
      BOOL v41 = a7;
      BOOL v42 = a8;
      v29[0] = MEMORY[0x1E4F143A8];
      v29[1] = 3221225472;
      v29[2] = sub_1A4B83CDC;
      v29[3] = &unk_1E5B7C1E8;
      id v30 = v38;
      id v31 = v39;
      BOOL v34 = a7;
      BOOL v35 = v12;
      id v32 = v37;
      __int16 v33 = self;
      uint64_t v26 = objc_msgSend__performSingleChatCacheLookupWithBlock_cacheMissQueryKey_queryBlock_(self, v27, (uint64_t)v36, @"ChatCache-LoadWithHandlesDisplayNameGroupID", v29);
    }
  }
  else
  {
    uint64_t v26 = 0;
  }

  return v26;
}

- (id)existingChatWithGroupID:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    v13[0] = MEMORY[0x1E4F143A8];
    v13[1] = 3221225472;
    v13[2] = sub_1A4B841BC;
    v13[3] = &unk_1E5B7C0B0;
    void v13[4] = self;
    id v14 = v4;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1A4B841C8;
    v11[3] = &unk_1E5B7C100;
    void v11[4] = self;
    id v12 = v14;
    uint64_t v9 = objc_msgSend__performSingleChatCacheLookupWithBlock_cacheMissQueryKey_queryBlock_(self, v8, (uint64_t)v13, @"ChatCache-LoadWithGroupID", v11);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)existingChatWithDeviceIndependentID:(id)a3
{
  id v4 = a3;
  uint64_t v9 = objc_msgSend_existingChatWithGroupID_(self, v5, (uint64_t)v4, v6);
  if (!v9)
  {
    uint64_t v9 = objc_msgSend_existingChatWithChatIdentifier_(self, v7, (uint64_t)v4, v8);
  }

  return v9;
}

- (id)existingChatWithDisplayName:(id)a3
{
  id v4 = a3;
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1A4B84434;
  v12[3] = &unk_1E5B7C0B0;
  v12[4] = self;
  id v13 = v4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1A4B84440;
  v9[3] = &unk_1E5B7C100;
  id v10 = v13;
  uint64_t v11 = self;
  id v5 = v13;
  uint64_t v7 = objc_msgSend__performSingleChatCacheLookupWithBlock_cacheMissQueryKey_queryBlock_(self, v6, (uint64_t)v12, @"ChatCache-LoadWithGroupID", v9);

  return v7;
}

- (id)existingChatWithPinningIdentifier:(id)a3
{
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v59 = 0;
    uint64_t v60 = (id *)&v59;
    uint64_t v61 = 0x3032000000;
    uint64_t v62 = sub_1A4B3449C;
    uint64_t v63 = sub_1A4B34334;
    id v64 = 0;
    uint64_t v53 = (uint64_t)v4;
    objc_msgSend_existingChatWithDeviceIndependentID_(self, v8, (uint64_t)v4, v9);
    id v64 = (id)objc_claimAutoreleasedReturnValue();
    if (!v60[5])
    {
      long long v57 = 0u;
      long long v58 = 0u;
      long long v55 = 0u;
      long long v56 = 0u;
      id v13 = objc_msgSend_cachedChats(self, v10, v11, v12);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v55, (uint64_t)v67, 16);
      if (v18)
      {
        uint64_t v19 = *(void *)v56;
        while (2)
        {
          for (uint64_t i = 0; i != v18; ++i)
          {
            if (*(void *)v56 != v19) {
              objc_enumerationMutation(v13);
            }
            uint64_t v21 = *(void **)(*((void *)&v55 + 1) + 8 * i);
            if (objc_msgSend_chatStyle(v21, v15, v16, v17) != 45)
            {
              uint64_t v22 = objc_msgSend_displayName(v21, v15, v16, v17);
              if (objc_msgSend_length(v22, v23, v24, v25))
              {
              }
              else
              {
                int v29 = objc_msgSend_participants(v21, v26, v27, v28);
                id v31 = objc_msgSend__sortedParticipantIDHashForParticipants_usesPersonCentricID_(self, v30, (uint64_t)v29, 0);
                int isEqualToString = objc_msgSend_isEqualToString_(v31, v32, v53, v33);

                if (isEqualToString)
                {
                  objc_storeStrong(v60 + 5, v21);
                  goto LABEL_17;
                }
              }
            }
          }
          uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v15, (uint64_t)&v55, (uint64_t)v67, 16);
          if (v18) {
            continue;
          }
          break;
        }
      }
LABEL_17:
    }
    uint64_t v36 = objc_msgSend_daemonController(self, v10, v11, v12);
    char v40 = objc_msgSend_processCapabilities(v36, v37, v38, v39);

    id v41 = v60[5];
    if (!v41 && (v40 & 4) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v45 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v66 = v53;
          _os_log_impl(&dword_1A4AF7000, v45, OS_LOG_TYPE_INFO, "Cache miss for existingChatWithPinningIdentifier %@", buf, 0xCu);
        }
      }
      uint64_t v46 = objc_msgSend_daemonController(self, v42, v43, v44);
      uint64_t v50 = objc_msgSend_synchronousRemoteDaemon(v46, v47, v48, v49);
      v54[0] = MEMORY[0x1E4F143A8];
      v54[1] = 3221225472;
      v54[2] = sub_1A4B848F4;
      v54[3] = &unk_1E5B7C210;
      v54[4] = self;
      v54[5] = &v59;
      objc_msgSend_loadChatsWithPinningIdentifier_reply_(v50, v51, v53, (uint64_t)v54);

      id v41 = v60[5];
    }
    id v35 = v41;
    _Block_object_dispose(&v59, 8);

    id v4 = (id)v53;
  }
  else
  {
    id v35 = 0;
  }

  return v35;
}

- (id)existingChatWithPersonID:(id)a3
{
  id v4 = a3;
  if (IMSharedHelperPersonCentricMergingEnabled() && objc_msgSend_length(v4, v5, v6, v7))
  {
    v14[0] = MEMORY[0x1E4F143A8];
    v14[1] = 3221225472;
    v14[2] = sub_1A4B84A90;
    v14[3] = &unk_1E5B7C0B0;
    void v14[4] = self;
    id v15 = v4;
    v11[0] = MEMORY[0x1E4F143A8];
    v11[1] = 3221225472;
    v11[2] = sub_1A4B84A9C;
    v11[3] = &unk_1E5B7C100;
    id v12 = v15;
    id v13 = self;
    uint64_t v9 = objc_msgSend__performSingleChatCacheLookupWithBlock_cacheMissQueryKey_queryBlock_(self, v8, (uint64_t)v14, @"ChatCache-LoadWithGroupID", v11);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)existingChatWithAddresses:(id)a3 allowAlternativeService:(BOOL)a4 bestHandles:(id *)a5
{
  uint64_t v47 = a5;
  BOOL v5 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v48 = v7;
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        long long v55 = v48;
        _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "allowAlternativeService is YES, attempting to find better handles for addresses: %@", buf, 0xCu);
      }
    }
    id v12 = objc_alloc(MEMORY[0x1E4F1CA80]);
    uint64_t v16 = objc_msgSend_count(v48, v13, v14, v15);
    uint64_t v19 = objc_msgSend_initWithCapacity_(v12, v17, v16, v18);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v20 = v48;
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v49, (uint64_t)v53, 16);
    if (v24)
    {
      uint64_t v25 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v50 != v25) {
            objc_enumerationMutation(v20);
          }
          uint64_t v27 = objc_msgSend_validateAndCleanupID_(MEMORY[0x1E4F6E6D8], v22, *(void *)(*((void *)&v49 + 1) + 8 * i), v23, v47);
          id v31 = objc_msgSend_contactStore(self, v28, v29, v30);
          BOOL v34 = objc_msgSend_fetchCNContactForHandleWithID_(v31, v32, (uint64_t)v27, v33);

          if (v34) {
            objc_msgSend_addObject_(v19, v35, (uint64_t)v34, v36);
          }
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v49, (uint64_t)v53, 16);
      }
      while (v24);
    }

    uint64_t v38 = objc_msgSend_existingChatWithContacts_bestHandles_(self, v37, (uint64_t)v19, (uint64_t)v47);
  }
  else
  {
    uint64_t v39 = v7;
    unint64_t v40 = objc_msgSend_count(v7, v8, v9, v10);
    if (IMOSLoggingEnabled())
    {
      id v41 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        long long v55 = v39;
        _os_log_impl(&dword_1A4AF7000, v41, OS_LOG_TYPE_INFO, "existingChatWithAddresses: %@", buf, 0xCu);
      }

      uint64_t v39 = v48;
    }
    BOOL v42 = IMFindExistingChatForAddresses(v39, 0, v40 > 1, 1);
    uint64_t v38 = v42;
    if (v47)
    {
      objc_msgSend_participants(v42, v43, v44, v45);
      id *v47 = (id)objc_claimAutoreleasedReturnValue();
    }
  }

  return v38;
}

- (id)existingChatWithContacts:(id)a3 bestHandles:(id *)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v5;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Finding existing chat for contacts: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v16 = 0x3032000000;
  uint64_t v17 = sub_1A4B3449C;
  uint64_t v18 = sub_1A4B34334;
  id v19 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A4B850BC;
  v11[3] = &unk_1E5B7C238;
  id v7 = v5;
  p_long long buf = &buf;
  uint64_t v14 = a4;
  id v12 = v7;
  objc_msgSend_bestHandlesForContacts_useExtendedAsyncLookup_completion_(IMHandle, v8, (uint64_t)v7, 0, v11);
  id v9 = *(id *)(*((void *)&buf + 1) + 40);

  _Block_object_dispose(&buf, 8);

  return v9;
}

- (void)_loadChatsFilteredUsingPredicate:(id)a3 lastMessageOlderThan:(id)a4 limit:(unint64_t)a5 waitForReply:(BOOL)a6 completionHandler:(id)a7
{
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  uint64_t v18 = objc_msgSend_daemonController(self, v15, v16, v17);
  uint64_t v22 = v18;
  if (a6) {
    objc_msgSend_synchronousRemoteDaemon(v18, v19, v20, v21);
  }
  else {
  uint64_t v23 = objc_msgSend_remoteDaemon(v18, v19, v20, v21);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1A4B85B6C;
  v26[3] = &unk_1E5B7C260;
  v26[4] = self;
  id v27 = v12;
  BOOL v28 = a6;
  id v24 = v12;
  objc_msgSend_loadChatsFilteredUsingPredicate_lastMessageOlderThan_limit_reply_(v23, v25, (uint64_t)v14, (uint64_t)v13, a5, v26);
}

- (id)_earliestLastMessageDateFromChatDictionaries:(id)a3
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  uint64_t v19 = 0;
  uint64_t v20 = &v19;
  uint64_t v21 = 0x3032000000;
  uint64_t v22 = sub_1A4B3449C;
  uint64_t v23 = sub_1A4B34334;
  id v24 = 0;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = a3;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, (uint64_t)v25, 16);
  if (v8)
  {
    uint64_t v9 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        v14[0] = MEMORY[0x1E4F143A8];
        v14[1] = 3221225472;
        v14[2] = sub_1A4B85F34;
        v14[3] = &unk_1E5B7C288;
        void v14[4] = self;
        void v14[5] = v11;
        v14[6] = &v19;
        objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v11, v6, (uint64_t)v14, v7);
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v15, (uint64_t)v25, 16);
    }
    while (v8);
  }

  id v12 = (id)v20[5];
  _Block_object_dispose(&v19, 8);

  return v12;
}

- (id)_lastMessageDateForQueryFromChatDictionary:(id)a3
{
  id v3 = a3;
  uint64_t v8 = objc_msgSend_objectForKeyedSubscript_(v3, v4, @"lastMessageRecordDateForQuery", v5);
  if (!v8)
  {
    uint64_t v9 = objc_msgSend_objectForKeyedSubscript_(v3, v6, *MEMORY[0x1E4F6CDB0], v7);
    id v12 = objc_msgSend_objectForKeyedSubscript_(v9, v10, @"time", v11);
    long long v16 = v12;
    if (v12 && (objc_msgSend_doubleValue(v12, v13, v14, v15), v20 > 10.0))
    {
      uint64_t v21 = (void *)MEMORY[0x1E4F1C9C8];
      objc_msgSend_doubleValue(v16, v17, v18, v19);
      uint64_t v8 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(v21, v22, v23, v24);
    }
    else
    {
      uint64_t v8 = 0;
    }
  }

  return v8;
}

- (void)_loadAllSiblingChatsForHandlesAssociatedWithChats:(id)a3 waitForReply:(BOOL)a4 completionHandler:(id)a5
{
  uint64_t v127 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v87 = a5;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v116 = 0u;
  long long v117 = 0u;
  long long v118 = 0u;
  long long v119 = 0u;
  id obj = v6;
  uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v116, (uint64_t)v126, 16);
  if (v93)
  {
    uint64_t v91 = *(void *)v117;
    uint64_t v97 = *MEMORY[0x1E4F1AEE0];
    uint64_t v96 = *MEMORY[0x1E4F1ADC8];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v117 != v91)
        {
          uint64_t v13 = v12;
          objc_enumerationMutation(obj);
          uint64_t v12 = v13;
        }
        uint64_t v94 = v12;
        uint64_t v14 = *(void **)(*((void *)&v116 + 1) + 8 * v12);
        if (objc_msgSend_chatStyle(v14, v9, v10, v11, v87) == 45)
        {
          long long v114 = 0u;
          long long v115 = 0u;
          long long v112 = 0u;
          long long v113 = 0u;
          objc_msgSend_participants(v14, v9, v10, v11);
          id v95 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v15, (uint64_t)&v112, (uint64_t)v125, 16);
          if (v99)
          {
            uint64_t v98 = *(void *)v113;
            do
            {
              for (uint64_t i = 0; i != v99; ++i)
              {
                if (*(void *)v113 != v98) {
                  objc_enumerationMutation(v95);
                }
                uint64_t v100 = *(void **)(*((void *)&v112 + 1) + 8 * i);
                v124[0] = v97;
                v124[1] = v96;
                uint64_t v18 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v16, (uint64_t)v124, 2);
                uint64_t v21 = objc_msgSend_cnContactWithKeys_(v100, v19, (uint64_t)v18, v20);

                long long v110 = 0u;
                long long v111 = 0u;
                long long v109 = 0u;
                long long v108 = 0u;
                uint64_t v25 = objc_msgSend_emailAddresses(v21, v22, v23, v24);
                uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v26, (uint64_t)&v108, (uint64_t)v123, 16);
                if (v30)
                {
                  uint64_t v31 = *(void *)v109;
                  do
                  {
                    for (uint64_t j = 0; j != v30; ++j)
                    {
                      if (*(void *)v109 != v31) {
                        objc_enumerationMutation(v25);
                      }
                      uint64_t v33 = objc_msgSend_value(*(void **)(*((void *)&v108 + 1) + 8 * j), v27, v28, v29);
                      BOOL v34 = IMCanonicalFormForEmail();

                      if (v34) {
                        objc_msgSend_addObject_(v7, v35, (uint64_t)v34, v36);
                      }
                    }
                    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v25, v27, (uint64_t)&v108, (uint64_t)v123, 16);
                  }
                  while (v30);
                }

                long long v106 = 0u;
                long long v107 = 0u;
                long long v104 = 0u;
                long long v105 = 0u;
                unint64_t v40 = objc_msgSend_phoneNumbers(v21, v37, v38, v39);
                uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v104, (uint64_t)v122, 16);
                if (v45)
                {
                  uint64_t v46 = *(void *)v105;
                  do
                  {
                    for (uint64_t k = 0; k != v45; ++k)
                    {
                      if (*(void *)v105 != v46) {
                        objc_enumerationMutation(v40);
                      }
                      uint64_t v48 = objc_msgSend_value(*(void **)(*((void *)&v104 + 1) + 8 * k), v42, v43, v44);
                      long long v52 = objc_msgSend_stringValue(v48, v49, v50, v51);
                      uint64_t v53 = IMFormatPhoneNumber();

                      if (v53)
                      {
                        objc_msgSend_addObject_(v7, v54, (uint64_t)v53, v55);
                        uint64_t v56 = IMChatCanonicalIDSIDsForAddress();
                        uint64_t v60 = objc_msgSend__stripFZIDPrefix(v56, v57, v58, v59);

                        if (v60 && (objc_msgSend_isEqualToString_(v53, v61, (uint64_t)v60, v62) & 1) == 0) {
                          objc_msgSend_addObject_(v7, v63, (uint64_t)v60, v64);
                        }
                      }
                    }
                    uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v42, (uint64_t)&v104, (uint64_t)v122, 16);
                  }
                  while (v45);
                }

                uint64_t v68 = objc_msgSend_ID(v100, v65, v66, v67);
                objc_msgSend_addObject_(v7, v69, (uint64_t)v68, v70);
              }
              uint64_t v99 = objc_msgSend_countByEnumeratingWithState_objects_count_(v95, v16, (uint64_t)&v112, (uint64_t)v125, 16);
            }
            while (v99);
          }
        }
        uint64_t v12 = v94 + 1;
      }
      while (v94 + 1 != v93);
      uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v116, (uint64_t)v126, 16);
    }
    while (v93);
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v74 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v121 = v7;
      _os_log_impl(&dword_1A4AF7000, v74, OS_LOG_TYPE_INFO, "Fetching sibling chats with handles %@", buf, 0xCu);
    }
  }
  uint64_t v75 = objc_msgSend_daemonController(self, v71, v72, v73, v87);
  id v79 = v75;
  if (a4) {
    objc_msgSend_synchronousRemoteDaemon(v75, v76, v77, v78);
  }
  else {
  uint64_t v80 = objc_msgSend_remoteDaemon(v75, v76, v77, v78);
  }

  uint64_t v84 = objc_msgSend_allObjects(v7, v81, v82, v83);
  v101[0] = MEMORY[0x1E4F143A8];
  v101[1] = 3221225472;
  v101[2] = sub_1A4B86664;
  v101[3] = &unk_1E5B7C260;
  BOOL v103 = a4;
  v101[4] = self;
  id v102 = v88;
  id v85 = v88;
  objc_msgSend_loadAnyChatsContainingHandleIDsIn_reply_(v80, v86, (uint64_t)v84, (uint64_t)v101);
}

- (void)updateEarliestMessageDateForChats:(id)a3 completion:(id)a4
{
  id v5 = a3;
  id v6 = (void (**)(void))a4;
  id v7 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v11 = objc_msgSend_count(v5, v8, v9, v10);
  uint64_t v14 = objc_msgSend_arrayWithCapacity_(v7, v12, v11, v13);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1A4B86940;
  v30[3] = &unk_1E5B7C2B0;
  id v15 = v14;
  id v31 = v15;
  objc_msgSend_enumerateObjectsUsingBlock_(v5, v16, (uint64_t)v30, v17);
  uint64_t v21 = objc_msgSend_sharedController(IMDaemonController, v18, v19, v20);
  uint64_t v25 = objc_msgSend_synchronousRemoteDaemon(v21, v22, v23, v24);
  v28[0] = MEMORY[0x1E4F143A8];
  v28[1] = 3221225472;
  v28[2] = sub_1A4B86998;
  v28[3] = &unk_1E5B7B0B8;
  id v29 = v5;
  id v26 = v5;
  objc_msgSend_fetchEarliestMessageDateForChatsWithGUIDs_completion_(v25, v27, (uint64_t)v15, (uint64_t)v28);

  if (v6) {
    v6[2](v6);
  }
}

- (void)_validateChatQueryResults:(id)a3 matchCurrentCacheResults:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (!objc_msgSend_count(v5, v7, v8, v9) && !objc_msgSend_count(v6, v10, v11, v12)) {
    goto LABEL_23;
  }
  if (!objc_msgSend_count(v5, v10, v11, v12) && objc_msgSend_count(v6, v13, v14, v15))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v32 = v6;
        __int16 v33 = 2112;
        id v34 = v5;
        _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "Chat cache now has chats, but query didn't explictly populate it, cache: %@ query: %@", buf, 0x16u);
      }
    }
    goto LABEL_23;
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v16 = v5;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v26, (uint64_t)v30, 16);
  if (!v20)
  {

LABEL_19:
    if (IMOSLoggingEnabled())
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v32 = v6;
        __int16 v33 = 2112;
        id v34 = v16;
        _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Chat cache does not have results returned from daemon in cache miss query, cache: %@ query: %@", buf, 0x16u);
      }
    }
    goto LABEL_23;
  }
  int v21 = 0;
  uint64_t v22 = *(void *)v27;
  do
  {
    for (uint64_t i = 0; i != v20; ++i)
    {
      if (*(void *)v27 != v22) {
        objc_enumerationMutation(v16);
      }
      v21 |= objc_msgSend_containsObjectIdenticalTo_(v6, v18, *(void *)(*((void *)&v26 + 1) + 8 * i), v19, (void)v26);
    }
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v26, (uint64_t)v30, 16);
  }
  while (v20);

  if ((v21 & 1) == 0) {
    goto LABEL_19;
  }
LABEL_23:
}

- (id)_existingChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 service:(id)a5
{
  id v5 = 0;
  if (a3 && a5)
  {
    id v7 = (void *)IMCopyGUIDForChat();
    id v5 = objc_msgSend_existingChatWithGUID_(self, v8, (uint64_t)v7, v9);
  }

  return v5;
}

- (id)_existingChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 account:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  uint64_t v10 = v9;
  uint64_t v11 = 0;
  if (v8 && v9)
  {
    uint64_t v15 = (void *)IMCopyThreadNameForChat();
    if (!v15
      || (objc_msgSend_threadNameToChatMap(self, v12, v13, v14),
          id v16 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_objectForKey_(v16, v17, (uint64_t)v15, v18),
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          v16,
          !v11))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int16 v33 = 0;
          _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, " ==> lookup with accountUniqueID failed, looking up with service", v33, 2u);
        }
      }
      uint64_t v23 = objc_msgSend_sharedInstance(IMAccountController, v19, v20, v21);
      long long v26 = objc_msgSend_accountForUniqueID_(v23, v24, (uint64_t)v10, v25);

      uint64_t v30 = objc_msgSend_serviceName(v26, v27, v28, v29);
      uint64_t v11 = objc_msgSend__existingChatWithIdentifier_style_service_(self, v31, (uint64_t)v8, v6, v30);
    }
  }

  return v11;
}

- (id)_existingChatForHandleUsingPersonID:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = objc_msgSend_contactStore(self, v5, v6, v7);
  int isBatchFetchingForLaunchCompleted = objc_msgSend_isBatchFetchingForLaunchCompleted(v8, v9, v10, v11);

  if (isBatchFetchingForLaunchCompleted)
  {
    uint64_t v15 = objc_msgSend_cnContactWithKeys_(v4, v13, MEMORY[0x1E4F1CBF0], v14);
    uint64_t v19 = objc_msgSend_identifier(v15, v16, v17, v18);

    uint64_t v23 = objc_msgSend_length(v19, v20, v21, v22);
    if (v23)
    {
      if (IMOSLoggingEnabled())
      {
        long long v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          int v29 = 138412290;
          uint64_t v30 = v19;
          _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "Attempting to look up chat using PersonID: %@", (uint8_t *)&v29, 0xCu);
        }
      }
      uint64_t v23 = objc_msgSend_existingChatWithPersonID_(self, v24, (uint64_t)v19, v25);
    }
    id v27 = v23;
  }
  else
  {
    id v27 = 0;
  }

  return v27;
}

- (id)_existingChatFromSiblingsForHandle:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = objc_msgSend__chatSiblingsArray(v4, v5, v6, v7);
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v37 = v8;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_DEBUG, " => siblings: %@", buf, 0xCu);
    }
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v10 = v8;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v31, (uint64_t)v35, 16);
  if (v15)
  {
    uint64_t v16 = *(void *)v32;
LABEL_7:
    uint64_t v17 = 0;
    while (1)
    {
      if (*(void *)v32 != v16) {
        objc_enumerationMutation(v10);
      }
      uint64_t v18 = *(void **)(*((void *)&v31 + 1) + 8 * v17);
      uint64_t v19 = objc_msgSend_ID(v18, v12, v13, v14, (void)v31);
      uint64_t v23 = objc_msgSend_service(v18, v20, v21, v22);
      id v27 = objc_msgSend_internalName(v23, v24, v25, v26);
      int v29 = objc_msgSend__existingChatWithIdentifier_style_service_(self, v28, (uint64_t)v19, 45, v27);

      if (v29) {
        break;
      }
      if (v15 == ++v17)
      {
        uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v31, (uint64_t)v35, 16);
        if (v15) {
          goto LABEL_7;
        }
        goto LABEL_13;
      }
    }
  }
  else
  {
LABEL_13:
    int v29 = 0;
  }

  return v29;
}

- (id)_existingChatWithHandle:(id)a3 fixChatHandle:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (qword_1E965E870 != -1) {
    dispatch_once(&qword_1E965E870, &unk_1EF8E63A8);
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = (id)qword_1E965E868;
  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v29, (uint64_t)v35, 16);
  if (v12)
  {
    uint64_t v13 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v30 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v16 = objc_msgSend_ID(v6, v9, v10, v11, (void)v29);
        uint64_t v20 = objc_msgSend_internalName(v15, v17, v18, v19);
        uint64_t v22 = objc_msgSend__existingChatWithIdentifier_style_service_(self, v21, (uint64_t)v16, 45, v20);

        if (v22)
        {

          goto LABEL_21;
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v9, (uint64_t)&v29, (uint64_t)v35, 16);
      if (v12) {
        continue;
      }
      break;
    }
  }

  if (IMSharedHelperContactsBasedMergingEnabled())
  {
    uint64_t v22 = objc_msgSend__existingChatForHandleUsingPersonID_(self, v23, (uint64_t)v6, v24);
    if (v22 && v4)
    {
      if (IMOSLoggingEnabled())
      {
        id v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          long long v34 = v22;
          _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "Found a chat using PersonID: %@ ", buf, 0xCu);
        }
      }
      objc_msgSend_setRecipient_(v22, v25, (uint64_t)v6, v26, (void)v29);
    }
  }
  else
  {
    uint64_t v22 = 0;
  }
LABEL_21:

  return v22;
}

- (void)moveMessagesWithGUIDsToRecentlyDeleted:(id)a3 deleteDate:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v16 = objc_msgSend_daemonQueryController(self, v13, v14, v15);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  v25[2] = sub_1A4B87A30;
  v25[3] = &unk_1E5B7C398;
  BOOL v28 = v7;
  v25[4] = self;
  id v26 = v10;
  id v27 = v11;
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1A4B87AC8;
  v21[3] = &unk_1E5B7C3C0;
  id v22 = v26;
  id v23 = v27;
  id v24 = v12;
  id v17 = v12;
  id v18 = v27;
  id v19 = v26;
  objc_msgSend_performQueryWithKey_expectsSynchronousResult_block_completionHandler_(v16, v20, @"RecentlyDeleted-MoveMessagesWithGUIDsToRecovery", v7, v25, v21);
}

- (void)moveMessagesInChatsToRecentlyDeleted:(id)a3 deleteDate:(id)a4 synchronously:(BOOL)a5 completionHandler:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v38[0] = MEMORY[0x1E4F143A8];
  v38[1] = 3221225472;
  v38[2] = sub_1A4B87E14;
  v38[3] = &unk_1E5B7C3E8;
  id v39 = v13;
  unint64_t v40 = self;
  id v14 = v13;
  objc_msgSend_enumerateObjectsUsingBlock_(v10, v15, (uint64_t)v38, v16);
  uint64_t v20 = objc_msgSend_allObjects(v14, v17, v18, v19);
  id v24 = objc_msgSend_daemonQueryController(self, v21, v22, v23);
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1A4B87E84;
  v34[3] = &unk_1E5B7C398;
  BOOL v37 = v7;
  v34[4] = self;
  id v35 = v20;
  id v36 = v11;
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1A4B87F1C;
  v30[3] = &unk_1E5B7C410;
  void v30[4] = self;
  id v31 = v10;
  id v32 = v36;
  id v33 = v12;
  id v25 = v12;
  id v26 = v36;
  id v27 = v10;
  id v28 = v20;
  objc_msgSend_performQueryWithKey_expectsSynchronousResult_block_completionHandler_(v24, v29, @"RecentlyDeleted-MoveMessagesInChatsToRecovery", v7, v34, v30);
}

- (void)recoverMessagesForChats:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v33[0] = MEMORY[0x1E4F143A8];
  v33[1] = 3221225472;
  _DWORD v33[2] = sub_1A4B88250;
  v33[3] = &unk_1E5B7C3E8;
  id v34 = v10;
  id v35 = self;
  id v11 = v10;
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v12, (uint64_t)v33, v13);
  id v17 = objc_msgSend_allObjects(v11, v14, v15, v16);
  uint64_t v21 = objc_msgSend_daemonQueryController(self, v18, v19, v20);
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1A4B882A8;
  v30[3] = &unk_1E5B7C438;
  BOOL v32 = v6;
  void v30[4] = self;
  id v31 = v17;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1A4B88340;
  v26[3] = &unk_1E5B7C410;
  v26[4] = self;
  id v27 = v8;
  id v28 = v31;
  id v29 = v9;
  id v22 = v9;
  id v23 = v31;
  id v24 = v8;
  objc_msgSend_performQueryWithKey_expectsSynchronousResult_block_completionHandler_(v21, v25, @"RecentlyDeleted-RecoverMessages", v6, v30, v26);
}

- (void)permanentlyDeleteRecoverableMessagesInChats:(id)a3 synchronously:(BOOL)a4 completionHandler:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1A4B88808;
  v32[3] = &unk_1E5B7C3E8;
  id v33 = v10;
  id v34 = self;
  id v11 = v10;
  objc_msgSend_enumerateObjectsUsingBlock_(v8, v12, (uint64_t)v32, v13);
  id v17 = objc_msgSend_allObjects(v11, v14, v15, v16);
  uint64_t v21 = objc_msgSend_daemonQueryController(self, v18, v19, v20);
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1A4B88860;
  v29[3] = &unk_1E5B7C438;
  BOOL v31 = v6;
  void v29[4] = self;
  id v30 = v17;
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1A4B888F8;
  v26[3] = &unk_1E5B7C4D8;
  id v27 = v8;
  id v28 = v9;
  id v22 = v9;
  id v23 = v8;
  id v24 = v17;
  objc_msgSend_performQueryWithKey_expectsSynchronousResult_block_completionHandler_(v21, v25, @"RecentlyDeleted-PermanentlyDeleteRecoverableMessages", v6, v29, v26);
}

- (void)enumerateAllChatsAndAttachmentSizesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  id v9 = objc_msgSend_sharedRegistry(IMChatRegistry, v6, v7, v8);
  uint64_t v13 = objc_msgSend_numberOfCachedChats(v9, v10, v11, v12);

  if (v13)
  {
    id v14 = IMDAttachmentFindLargestConversations();
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v38 = v14;
        _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Found dbLargestConversations: %@", buf, 0xCu);
      }
    }
    uint64_t v19 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v15, v16, v17);
    uint64_t v20 = (void *)MEMORY[0x1A6264150]();
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    v35[2] = sub_1A4BBDA54;
    v35[3] = &unk_1E5B7D050;
    v35[4] = self;
    id v21 = v19;
    id v36 = v21;
    objc_msgSend_enumerateObjectsUsingBlock_(v14, v22, (uint64_t)v35, v23);

    id v24 = (void *)MEMORY[0x1A6264150]();
    id v27 = objc_msgSend_keysSortedByValueUsingComparator_(v21, v25, (uint64_t)&unk_1EF8E53F8, v26);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1A4BBDC18;
    v32[3] = &unk_1E5B7D098;
    void v32[4] = self;
    id v33 = v21;
    id v34 = v5;
    id v28 = v21;
    objc_msgSend_enumerateObjectsUsingBlock_(v27, v29, (uint64_t)v32, v30);
  }
  else if (IMOSLoggingEnabled())
  {
    BOOL v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "No cached chats are loaded -- client has likely not received setup. Skipping largest conversation load.", buf, 2u);
    }
  }
}

- (id)chatForIMHandle:(id)a3
{
  return (id)objc_msgSend_chatWithHandle_lastAddressedHandle_lastAddressedSIMID_(self, a2, (uint64_t)a3, 0, 0);
}

- (id)chatForIMHandles:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_chatWithHandles_lastAddressedHandle_lastAddressedSIMID_, a3, 0);
}

- (id)chatForIMHandles:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5
{
  return (id)MEMORY[0x1F4181798](self, sel_chatWithHandles_displayName_joinedChatsOnly_lastAddressedHandle_lastAddressedSIMID_, a3, 0);
}

- (id)chatForIMHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5
{
  return (id)MEMORY[0x1F4181798](self, sel_chatWithHandles_displayName_joinedChatsOnly_lastAddressedHandle_lastAddressedSIMID_, a3, a4);
}

- (id)chatForIMHandles:(id)a3 displayName:(id)a4 joinedChatsOnly:(BOOL)a5 lastAddressedHandle:(id)a6 lastAddressedSIMID:(id)a7
{
  return (id)MEMORY[0x1F4181798](self, sel_chatWithHandles_displayName_joinedChatsOnly_lastAddressedHandle_lastAddressedSIMID_, a3, a4);
}

- (id)chatForIMHandles:(id)a3 chatName:(id)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_chatForIMHandles_chatName_lastAddressedHandle_lastAddressedSIMID_, a3, a4);
}

- (id)chatForIMHandles:(id)a3 chatName:(id)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      id v60 = v10;
      __int16 v61 = 2112;
      id v62 = v11;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_DEBUG, "handles: %@  name: %@", buf, 0x16u);
    }
  }
  uint64_t v18 = objc_msgSend_lastObject(v10, v14, v15, v16);
  id v22 = objc_msgSend_service(v18, v19, v20, v21);

  uint64_t v24 = objc_msgSend_maxChatParticipantsForHandle_simID_(v22, v23, (uint64_t)v12, (uint64_t)v13);
  int v28 = v24;
  if (v24 >= 1)
  {
    unint64_t v29 = objc_msgSend_count(v10, v25, v26, v27);
    if (v29 > objc_msgSend_maxChatParticipantsForHandle_simID_(v22, v30, (uint64_t)v12, (uint64_t)v13))
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 67109120;
          LODWORD(v60) = v28;
          _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "Failing to invite participants that would put us over our max size of: %d", buf, 8u);
        }
      }
      isDeletingIncomingMessages = 0;
      goto LABEL_39;
    }
  }
  isDeletingIncomingMessages = objc_msgSend_existingChatForIMHandles_(self, v25, (uint64_t)v10, v27);
  int v33 = IMOSLoggingEnabled();
  if (isDeletingIncomingMessages)
  {
    if (v33)
    {
      BOOL v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v60 = isDeletingIncomingMessages;
        _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "Found existing chat: %@", buf, 0xCu);
      }
    }
    goto LABEL_39;
  }
  if (v33)
  {
    uint64_t v38 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A4AF7000, v38, OS_LOG_TYPE_INFO, "No chat found", buf, 2u);
    }
  }
  uint64_t v39 = objc_msgSend_lastObject(v10, v34, v35, v36);
  uint64_t v43 = objc_msgSend_account(v39, v40, v41, v42);

  isDeletingIncomingMessages = objc_msgSend__possiblyUnregisteredCachedChatWithHandles_style_groupID_displayName_joinedChatsOnly_(self, v44, (uint64_t)v10, 43, 0, 0, 0);
  if (isDeletingIncomingMessages)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v60 = isDeletingIncomingMessages;
        _os_log_impl(&dword_1A4AF7000, v45, OS_LOG_TYPE_INFO, "Found created chat: %@", buf, 0xCu);
      }
LABEL_29:
    }
  }
  else
  {
    uint64_t v46 = [IMChat alloc];
    BYTE2(v58) = 0;
    LOWORD(v58) = 0;
    isDeletingIncomingMessages = objc_msgSend__initWithGUID_account_style_roomName_displayName_lastAddressedHandle_lastAddressedSIMID_items_participants_isFiltered_hasHadSuccessfulQuery_isRecovered_isDeletingIncomingMessages_(v46, v47, 0, (uint64_t)v43, 43, 0, 0, v12, v13, 0, v10, 1, v58);
    objc_msgSend__setupObservation(isDeletingIncomingMessages, v48, v49, v50);
    if (IMOSLoggingEnabled())
    {
      uint64_t v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v60 = isDeletingIncomingMessages;
        _os_log_impl(&dword_1A4AF7000, v45, OS_LOG_TYPE_INFO, "Created chat: %@", buf, 0xCu);
      }
      goto LABEL_29;
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v52 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v60 = isDeletingIncomingMessages;
      _os_log_impl(&dword_1A4AF7000, v52, OS_LOG_TYPE_INFO, "Registering outgoing chat: %@", buf, 0xCu);
    }
  }
  objc_msgSend__registerChat_isIncoming_guid_(self, v51, (uint64_t)isDeletingIncomingMessages, 0, 0);
  if (IMOSLoggingEnabled())
  {
    uint64_t v56 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v60 = isDeletingIncomingMessages;
      _os_log_impl(&dword_1A4AF7000, v56, OS_LOG_TYPE_INFO, "Joining chat: %@", buf, 0xCu);
    }
  }
  objc_msgSend_join(isDeletingIncomingMessages, v53, v54, v55);

LABEL_39:

  return isDeletingIncomingMessages;
}

- (id)chatForRoom:(id)a3 onAccount:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      id v27 = v6;
      __int16 v28 = 2112;
      id v29 = v7;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_DEBUG, "roomName: %@  account: %@", buf, 0x16u);
    }
  }
  if (v7)
  {
    id v11 = objc_msgSend_chatIDForRoomName_(v7, v8, (uint64_t)v6, v9);

    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v27 = v11;
        _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Account pushed room name to: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v11 = v6;
  }
  isDeletingIncomingMessages = objc_msgSend_existingChatForRoom_onAccount_(self, v8, (uint64_t)v11, (uint64_t)v7);
  if (isDeletingIncomingMessages)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v27 = isDeletingIncomingMessages;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Found existing chat: %@", buf, 0xCu);
      }
    }
    goto LABEL_30;
  }
  isDeletingIncomingMessages = objc_msgSend__possiblyUnregisteredCachedChatForRoom_onAccount_(self, v13, (uint64_t)v11, (uint64_t)v7);
  if (isDeletingIncomingMessages)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v27 = isDeletingIncomingMessages;
        _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Found created chat: %@", buf, 0xCu);
      }
LABEL_24:
    }
  }
  else
  {
    uint64_t v17 = [IMChat alloc];
    BYTE2(v25) = 0;
    LOWORD(v25) = 0;
    isDeletingIncomingMessages = objc_msgSend__initWithGUID_account_style_roomName_displayName_lastAddressedHandle_lastAddressedSIMID_items_participants_isFiltered_hasHadSuccessfulQuery_isRecovered_isDeletingIncomingMessages_(v17, v18, 0, (uint64_t)v7, 35, v11, 0, 0, 0, 0, 0, 1, v25);
    objc_msgSend__setupObservation(isDeletingIncomingMessages, v19, v20, v21);
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v27 = isDeletingIncomingMessages;
        _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Created chat: %@", buf, 0xCu);
      }
      goto LABEL_24;
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v27 = isDeletingIncomingMessages;
      _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Registering chat: %@", buf, 0xCu);
    }
  }
  objc_msgSend__registerChat_isIncoming_guid_(self, v22, (uint64_t)isDeletingIncomingMessages, 0, 0);
LABEL_30:

  return isDeletingIncomingMessages;
}

- (unint64_t)numberOfExistingChats
{
  uint64_t v8 = objc_msgSend_simulatedChats(self, a2, v2, v3);
  if (v8) {
    objc_msgSend_simulatedChats(self, v5, v6, v7);
  }
  else {
  uint64_t v9 = objc_msgSend_cachedChatsInThreadNameMap(self, v5, v6, v7);
  }
  unint64_t v13 = objc_msgSend_count(v9, v10, v11, v12);

  return v13;
}

- (NSArray)allExistingChats
{
  id v5 = objc_msgSend_simulatedChats(self, a2, v2, v3);
  uint64_t v9 = v5;
  if (v5)
  {
    id v10 = v5;
  }
  else
  {
    objc_msgSend_cachedChatsInThreadNameMap(self, v6, v7, v8);
    id v10 = (id)objc_claimAutoreleasedReturnValue();
  }
  uint64_t v11 = v10;

  return (NSArray *)v11;
}

- (id)existingChatForIMHandle:(id)a3
{
  return (id)MEMORY[0x1F4181798](self, sel_existingChatForIMHandle_allowRetargeting_, a3, 1);
}

- (id)existingChatForIMHandles:(id)a3
{
  return (id)objc_msgSend_existingChatForIMHandles_allowRetargeting_groupID_displayName_joinedChatsOnly_(self, a2, (uint64_t)a3, 1, 0, 0, 0);
}

- (id)existingChatForRoom:(id)a3 onAccount:(id)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_existingChatForRoom_onAccount_allowRetargeting_, a3, a4);
}

- (id)existingChatForIMHandles:(id)a3 allowRetargeting:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7
{
  return (id)MEMORY[0x1F4181798](self, sel_existingChatForIMHandles_allowRetargeting_groupID_displayName_ignoresDisplayName_joinedChatsOnly_, a3, a4);
}

- (id)existingChatForIMHandles:(id)a3 allowRetargeting:(BOOL)a4
{
  return (id)objc_msgSend_existingChatForIMHandles_allowRetargeting_groupID_displayName_joinedChatsOnly_(self, a2, (uint64_t)a3, a4, 0, 0, 0);
}

- (id)existingChatForRoom:(id)a3 onAccount:(id)a4 allowRetargeting:(BOOL)a5
{
  id v7 = a3;
  uint64_t v11 = objc_msgSend_uniqueID(a4, v8, v9, v10);
  unint64_t v13 = objc_msgSend__existingChatWithIdentifier_style_account_(self, v12, (uint64_t)v7, 35, v11);

  return v13;
}

- (id)existingChatForIMHandles:(id)a3 allowRetargeting:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 ignoresDisplayName:(BOOL)a7 joinedChatsOnly:(BOOL)a8
{
  BOOL v65 = a8;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v64 = a3;
  id v66 = a5;
  id v11 = a6;
  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v18 = objc_msgSend_arrayByApplyingSelector_(v64, v16, (uint64_t)"ID", v17);
      uint64_t v19 = @"NO";
      *(_DWORD *)long long buf = 138413058;
      uint64_t v73 = v18;
      if (v65) {
        uint64_t v19 = @"YES";
      }
      __int16 v74 = 2112;
      id v75 = v66;
      __int16 v76 = 2112;
      id v77 = v11;
      __int16 v78 = 2112;
      id v79 = v19;
      _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_DEBUG, "existingChatForHandles: %@  groupID: %@ displayName %@ isJoined %@ ", buf, 0x2Au);
    }
  }
  if (objc_msgSend_count(v64, v12, v13, v14))
  {
    if (objc_msgSend_length(v11, v20, v21, v22)) {
      uint64_t v23 = v11;
    }
    else {
      uint64_t v23 = 0;
    }
    uint64_t v24 = v23;

    long long v69 = 0u;
    long long v70 = 0u;
    long long v67 = 0u;
    long long v68 = 0u;
    __int16 v28 = objc_msgSend_cachedChatsInThreadNameMap(self, v25, v26, v27);
    uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v67, (uint64_t)v71, 16);
    if (v33)
    {
      uint64_t v34 = *(void *)v68;
LABEL_13:
      uint64_t v35 = 0;
      while (1)
      {
        if (*(void *)v68 != v34) {
          objc_enumerationMutation(v28);
        }
        uint64_t v36 = *(void **)(*((void *)&v67 + 1) + 8 * v35);
        if (objc_msgSend_chatStyle(v36, v30, v31, v32) != 43) {
          goto LABEL_33;
        }
        BOOL v37 = objc_msgSend_displayName(v36, v30, v31, v32);
        if (objc_msgSend_length(v37, v38, v39, v40)) {
          uint64_t v41 = v37;
        }
        else {
          uint64_t v41 = 0;
        }
        unint64_t v42 = v41;

        if (!objc_msgSend_length(v66, v43, v44, v45)) {
          goto LABEL_23;
        }
        if (!(v42 | v24)) {
          goto LABEL_28;
        }
        uint64_t v49 = objc_msgSend_groupID(v36, v46, v47, v48);
        int isEqualToString = objc_msgSend_isEqualToString_(v66, v50, (uint64_t)v49, v51);

        if (isEqualToString)
        {
LABEL_23:
          if (a7) {
            goto LABEL_28;
          }
          if (v42)
          {
            if (objc_msgSend_isEqualToString_((void *)v42, v46, v24, v48)) {
              goto LABEL_28;
            }
          }
          else if (!v24)
          {
LABEL_28:
            if (!v65 || objc_msgSend_joinState(v36, v46, v47, v48) >= 2)
            {
              uint64_t v53 = (void *)MEMORY[0x1A6264150]();
              long long v57 = objc_msgSend_participants(v36, v54, v55, v56);
              int v60 = objc_msgSend_equivalentToRecipients_(v64, v58, (uint64_t)v57, v59);

              if (v60)
              {
                id v61 = v36;

                goto LABEL_38;
              }
            }
          }
        }

LABEL_33:
        if (v33 == ++v35)
        {
          uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v30, (uint64_t)&v67, (uint64_t)v71, 16);
          if (v33) {
            goto LABEL_13;
          }
          break;
        }
      }
    }
    id v61 = 0;
LABEL_38:

    id v11 = (id)v24;
  }
  else
  {
    id v61 = 0;
  }

  return v61;
}

- (id)existingChatForIMHandle:(id)a3 allowRetargeting:(BOOL)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_existingChatForIMHandle_allowRetargeting_fixChatHandle_, a3, a4);
}

- (id)existingChatForIMHandle:(id)a3 allowRetargeting:(BOOL)a4 fixChatHandle:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      int v16 = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_DEBUG, "handle: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  id v11 = objc_msgSend__existingChatWithHandle_fixChatHandle_(self, v9, (uint64_t)v8, v5);
  uint64_t v14 = v11;
  if (v6) {
    objc_msgSend_setRecipient_(v11, v12, (uint64_t)v8, v13);
  }

  return v14;
}

- (id)existingChatForIMHandles:(id)a3 allowRetargeting:(BOOL)a4 groupID:(id)a5
{
  BOOL v6 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v14 = objc_msgSend_arrayByApplyingSelector_(v8, v12, (uint64_t)"ID", v13);
      int v17 = 138412546;
      uint64_t v18 = v14;
      __int16 v19 = 2112;
      id v20 = v9;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_DEBUG, "handles: %@  groupID: %@", (uint8_t *)&v17, 0x16u);
    }
  }
  uint64_t v15 = objc_msgSend_existingChatForIMHandles_allowRetargeting_groupID_displayName_joinedChatsOnly_(self, v10, (uint64_t)v8, v6, v9, 0, 0);

  return v15;
}

- (id)unblackholeAndLoadChatWithIMHandles:(id)a3
{
  return (id)((uint64_t (*)(IMChatRegistry *, char *, id))MEMORY[0x1F4181798])(self, sel_unblackholeChatWithHandles_, a3);
}

+ (id)performanceLogHandle
{
  if (qword_1E965DD68 != -1) {
    dispatch_once(&qword_1E965DD68, &unk_1EF8E5578);
  }
  uint64_t v2 = (void *)qword_1E965DD70;

  return v2;
}

- (id)performanceLogHandle
{
  uint64_t v2 = objc_opt_class();

  return (id)MEMORY[0x1F4181798](v2, sel_performanceLogHandle, v3, v4);
}

+ (IMChatRegistry)sharedRegistryIfAvailable
{
  if (IMIsRunningInIMDPersistenceAgent())
  {
    BOOL v6 = 0;
  }
  else
  {
    BOOL v6 = objc_msgSend_sharedRegistry(a1, v3, v4, v5);
  }

  return (IMChatRegistry *)v6;
}

+ (void)setMessageClass:(Class)a3
{
  qword_1EB3F2290 = (uint64_t)a3;
}

- (void)_noteChatDealloc:(id)a3
{
  id v9 = a3;
  if (objc_msgSend__shouldRegisterChat(v9, v4, v5, v6)) {
    objc_msgSend_removeObjectIdenticalTo_(self->_allChatsInProcess, v7, (uint64_t)v9, v8);
  }
}

- (IMChatRegistry)init
{
  return (IMChatRegistry *)objc_msgSend_initAsListener_(self, a2, 0, v2);
}

- (void)dealloc
{
  uint64_t v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  objc_msgSend_removeObserver_name_object_(v5, v6, (uint64_t)self, 0, 0);

  uint64_t v10 = objc_msgSend_sharedInstance(IMDaemonController, v7, v8, v9);
  uint64_t v14 = objc_msgSend_listener(v10, v11, v12, v13);
  objc_msgSend_removeHandler_(v14, v15, (uint64_t)self, v16);

  v17.receiver = self;
  v17.super_class = (Class)IMChatRegistry;
  [(IMChatRegistry *)&v17 dealloc];
}

- (IMDaemonProtocol)remoteDaemon
{
  return (IMDaemonProtocol *)objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
}

- (IMSharedWithYouManager)sharedWithYouManager
{
  return (IMSharedWithYouManager *)objc_msgSend_sharedManager(MEMORY[0x1E4F6EA28], a2, v2, v3);
}

- (void)_registerChatDictionary:(id)a3 forChat:(id)a4 isIncoming:(BOOL)a5 newGUID:(id)a6
{
}

- (void)_registerChat:(id)a3 isIncoming:(BOOL)a4 guid:(id)a5
{
}

- (void)unregisterChat:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "This call is deprecated, and doesn't do anything anymore, please file bugs if you need some behavior here", v5, 2u);
    }
  }
}

- (void)unregisterChatWithGUID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v5 = 0;
      _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "This call is deprecated, and doesn't do anything anymore, please file bugs if you need some behavior here", v5, 2u);
    }
  }
}

- (void)_unregisterChat:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v34 = v4;
        _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Unregistering chat: %@", buf, 0xCu);
      }
    }
    uint64_t v9 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v5, v6, v7);
    objc_msgSend___mainThreadPostNotificationName_object_(v9, v10, @"__kIMChatRegistryWillUnregisterChatNotification", (uint64_t)v4);

    uint64_t v13 = objc_msgSend_allGUIDsForChat_(self, v11, (uint64_t)v4, v12);
    objc_msgSend__clearMapsUsingChat_guids_(self, v14, (uint64_t)v4, (uint64_t)v13);
    objc_msgSend_didUnregisterFromRegistry_(v4, v15, (uint64_t)self, v16);
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v17 = v13;
    uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v28, (uint64_t)v32, 16);
    if (v22)
    {
      uint64_t v23 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v22; ++i)
        {
          if (*(void *)v29 != v23) {
            objc_enumerationMutation(v17);
          }
          uint64_t v25 = *(void *)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v26 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v19, v20, v21);
          objc_msgSend___mainThreadPostNotificationName_object_(v26, v27, @"__kIMChatRegistryDidUnregisterChatNotification", v25);
        }
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v19, (uint64_t)&v28, (uint64_t)v32, 16);
      }
      while (v22);
    }
  }
}

- (void)_unregisterChatWithGUID:(id)a3
{
  objc_msgSend__cachedChatWithGUID_(self, a2, (uint64_t)a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__unregisterChat_(self, v5, (uint64_t)v7, v6);
}

- (void)_clearMapsUsingChat:(id)a3 guids:(id)a4
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v47, (uint64_t)v51, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v48;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v48 != v13) {
          objc_enumerationMutation(v7);
        }
        uint64_t v15 = *(void *)(*((void *)&v47 + 1) + 8 * i);
        objc_msgSend_removeObjectForKey_(self->_chatGUIDToCurrentThreadMap, v10, v15, v11);
        objc_msgSend_removeObjectForKey_(self->_chatGUIDToChatMap, v16, v15, v17);
        objc_msgSend_removeObjectForKey_(self->_chatGUIDToiMessageSentOrReceivedMap, v18, v15, v19);
        objc_msgSend_removeObjectForKey_(self->_chatGUIDToInfoMap, v20, v15, v21);
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v47, (uint64_t)v51, 16);
    }
    while (v12);
  }
  objc_msgSend_removeObjectIdenticalTo_(self->_allChatsInProcess, v10, (uint64_t)v6, v11);
  objc_msgSend_removeObjectIdenticalTo_(self->_cachedChatsInThreadNameMap, v22, (uint64_t)v6, v23);
  uint64_t v26 = objc_msgSend_allKeysForObject_(self->_threadNameToChatMap, v24, (uint64_t)v6, v25);
  if (objc_msgSend_count(v26, v27, v28, v29)) {
    objc_msgSend_removeObjectsForKeys_(self->_threadNameToChatMap, v30, (uint64_t)v26, v31);
  }
  uint64_t v32 = objc_msgSend_allKeysForObject_(self->_chatPersonIDToChatMap, v30, (uint64_t)v6, v31);
  if (objc_msgSend_count(v32, v33, v34, v35)) {
    objc_msgSend_removeObjectsForKeys_(self->_chatPersonIDToChatMap, v36, (uint64_t)v32, v38);
  }
  if (objc_msgSend_chatStyle(v6, v36, v37, v38) == 43)
  {
    uint64_t v41 = objc_msgSend_allKeysForObject_(self->_groupIDToChatMap, v39, (uint64_t)v6, v40);
    if (objc_msgSend_count(v41, v42, v43, v44)) {
      objc_msgSend_removeObjectsForKeys_(self->_groupIDToChatMap, v45, (uint64_t)v41, v46);
    }
    objc_msgSend__removeFromGroupParticipantToChatsMap_(self, v45, (uint64_t)v6, v46);
  }
}

- (id)generateUnusedChatIdentifierForGroupChatWithAccount:(id)a3
{
  uint64_t v5 = (void *)MEMORY[0x1E4F6E670];
  id v6 = objc_msgSend_service(a3, a2, (uint64_t)a3, v3);
  uint64_t v10 = objc_msgSend_internalName(v6, v7, v8, v9);
  v14[0] = MEMORY[0x1E4F143A8];
  v14[1] = 3221225472;
  v14[2] = sub_1A4BFD910;
  v14[3] = &unk_1E5B7C150;
  void v14[4] = self;
  uint64_t v12 = objc_msgSend_generateUnusedChatIdentifierForGroupChatWithServiceName_chatWithChatIdentifierExists_(v5, v11, (uint64_t)v10, (uint64_t)v14);

  return v12;
}

- (BOOL)_hasChat:(id)a3 forService:(id)a4
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  chatGUIDToiMessageSentOrReceivedMap = objc_msgSend_chatIdentifier(v6, v8, v9, v10);
  uint64_t v14 = objc_msgSend_internalName(v7, v11, v12, v13);
  objc_msgSend_chatStyle(v6, v15, v16, v17);
  uint64_t v18 = (void *)IMCopyGUIDForChat();

  uint64_t v21 = objc_msgSend_objectForKey_(self->_chatGUIDToChatMap, v19, (uint64_t)v18, v20);
  LODWORD(chatGUIDToiMessageSentOrReceivedMap) = v21 != 0;

  objc_msgSend_iMessageService(IMServiceImpl, v23, v24, v25);
  id v26 = (id)objc_claimAutoreleasedReturnValue();
  if (v26 == v7) {
    int v27 = (int)chatGUIDToiMessageSentOrReceivedMap;
  }
  else {
    int v27 = 0;
  }

  if (v27 == 1)
  {
    chatGUIDToiMessageSentOrReceivedMap = self->_chatGUIDToiMessageSentOrReceivedMap;
    uint64_t v31 = objc_msgSend_guid(v6, v28, v29, v30);
    uint64_t v34 = objc_msgSend_objectForKey_(chatGUIDToiMessageSentOrReceivedMap, v32, (uint64_t)v31, v33);
    LOBYTE(chatGUIDToiMessageSentOrReceivedMap) = v34 != 0;

    if (IMOSLoggingEnabled())
    {
      uint64_t v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        int v37 = 138412290;
        id v38 = v6;
        _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "iMessage map had entry for %@", (uint8_t *)&v37, 0xCu);
      }
    }
  }

  return (char)chatGUIDToiMessageSentOrReceivedMap;
}

- (void)_setSimulatedChats:(id)a3
{
  id v5 = a3;
  objc_storeStrong((id *)&self->_simulatedChats, a3);
  if (!self->_simulatedChatGUIDToChatMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    simulatedChatGUIDToChatMap = self->_simulatedChatGUIDToChatMap;
    self->_simulatedChatGUIDToChatMap = Mutable;
  }
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1A4BFDBD4;
  v10[3] = &unk_1E5B7E0A8;
  v10[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v5, v6, (uint64_t)v10, v7);
}

- (void)_removeFromGroupParticipantToChatsMap:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v9 = objc_msgSend_allKeys(self->_groupParticipantToChatsMap, v6, v7, v8, 0);
  uint64_t v11 = 0;
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v35, (uint64_t)v43, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v36 != v15) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_objectForKey_(self->_groupParticipantToChatsMap, v12, v17, v13);
        if (objc_msgSend_containsObject_(v18, v19, (uint64_t)v4, v20))
        {
          objc_msgSend_removeObject_(v18, v21, (uint64_t)v4, v22);
          ++v11;
          if (!objc_msgSend_count(v18, v23, v24, v25)) {
            objc_msgSend_addObject_(v5, v26, v17, v27);
          }
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v35, (uint64_t)v43, 16);
    }
    while (v14);
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = objc_msgSend_count(v5, v31, v32, v33);
      *(_DWORD *)long long buf = 134218240;
      uint64_t v40 = v11;
      __int16 v41 = 2048;
      uint64_t v42 = v34;
      _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Removed chat from %lu entries, and clearing %lu keys, from Group Participants cache", buf, 0x16u);
    }
  }
  objc_msgSend_removeObjectsForKeys_(self->_groupParticipantToChatsMap, v28, (uint64_t)v5, v29);
}

- (void)_handleChatParticipantsDidChange:(id)a3
{
  uint64_t v96 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_object(v4, v5, v6, v7);
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v92 = 138412290;
      uint64_t v93 = v8;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Participants changed in [%@]", (uint8_t *)&v92, 0xCu);
    }
  }
  if (v8)
  {
    objc_msgSend_invalidateHasKnownParticipantsCache(v8, v9, v10, v11);
    chatGUIDToChatMap = self->_chatGUIDToChatMap;
    uint64_t v17 = objc_msgSend_guid(v8, v14, v15, v16);
    uint64_t v20 = objc_msgSend_objectForKey_(chatGUIDToChatMap, v18, (uint64_t)v17, v19);
    LOBYTE(chatGUIDToChatMap) = v20 == 0;

    if ((chatGUIDToChatMap & 1) == 0)
    {
      if (objc_msgSend_chatStyle(v8, v21, v22, v23) == 45)
      {
        uint64_t v27 = objc_msgSend_recipient(v8, v24, v25, v26);
        uint64_t v31 = objc_msgSend_ID(v27, v28, v29, v30);
        long long v35 = objc_msgSend_account(v8, v32, v33, v34);
        uint64_t v39 = objc_msgSend_uniqueID(v35, v36, v37, v38);
        uint64_t v40 = (void *)IMCopyThreadNameForChat();

        chatGUIDToCurrentThreadMap = self->_chatGUIDToCurrentThreadMap;
        uint64_t v45 = objc_msgSend_guid(v8, v42, v43, v44);
        long long v48 = objc_msgSend_objectForKey_(chatGUIDToCurrentThreadMap, v46, (uint64_t)v45, v47);

        char isEqualToString = objc_msgSend_isEqualToString_(v40, v49, (uint64_t)v48, v50);
        if (v40) {
          char v53 = isEqualToString;
        }
        else {
          char v53 = 1;
        }
        if ((v53 & 1) == 0)
        {
          objc_msgSend_setObject_forKey_(self->_threadNameToChatMap, v52, (uint64_t)v8, (uint64_t)v40);
          if ((objc_msgSend_containsObjectIdenticalTo_(self->_cachedChatsInThreadNameMap, v54, (uint64_t)v8, v55) & 1) == 0) {
            objc_msgSend_addObject_(self->_cachedChatsInThreadNameMap, v56, (uint64_t)v8, v58);
          }
          uint64_t v59 = self->_chatGUIDToCurrentThreadMap;
          int v60 = objc_msgSend_guid(v8, v56, v57, v58);
          objc_msgSend_setObject_forKey_(v59, v61, (uint64_t)v40, (uint64_t)v60);

          id v62 = self->_chatGUIDToChatMap;
          id v66 = objc_msgSend_guid(v8, v63, v64, v65);
          objc_msgSend_setObject_forKey_(v62, v67, (uint64_t)v8, (uint64_t)v66);
        }
      }
      else
      {
        objc_msgSend__removeFromGroupParticipantToChatsMap_(self, v24, (uint64_t)v8, v26);
        id v71 = objc_msgSend_participants(v8, v68, v69, v70);
        uint64_t v40 = objc_msgSend__sortedParticipantIDHashForParticipants_(self, v72, (uint64_t)v71, v73);

        objc_msgSend__addChat_participantSet_(self, v74, (uint64_t)v8, (uint64_t)v40);
        if (IMOSLoggingEnabled())
        {
          __int16 v78 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
          {
            uint64_t v82 = objc_msgSend_participants(v8, v79, v80, v81);
            int v92 = 138412546;
            uint64_t v93 = v40;
            __int16 v94 = 2112;
            id v95 = v82;
            _os_log_impl(&dword_1A4AF7000, v78, OS_LOG_TYPE_INFO, "New participantIDHash %@ based on %@", (uint8_t *)&v92, 0x16u);
          }
        }
        uint64_t v83 = objc_msgSend_personCentricID(v8, v75, v76, v77);
        BOOL v84 = v83 == 0;

        if (!v84) {
          objc_msgSend__updatePersonCentricIDForChat_(self, v85, (uint64_t)v8, v86);
        }
      }

      uint64_t v90 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v87, v88, v89);
      objc_msgSend_postNotificationName_object_userInfo_(v90, v91, @"__kIMChatMultiWayStateChangedNotification", (uint64_t)v8, 0);
    }
  }
}

- (void)_updatePersonCentricIDForChat:(id)a3
{
  id v17 = a3;
  uint64_t v7 = objc_msgSend_contactStore(self, v4, v5, v6);
  int isBatchFetchingForLaunchCompleted = objc_msgSend_isBatchFetchingForLaunchCompleted(v7, v8, v9, v10);

  if (isBatchFetchingForLaunchCompleted)
  {
    uint64_t v15 = objc_msgSend__generatePersonCentricID(v17, v12, v13, v14);
    objc_msgSend__updatePersonCentricIDToChatMapForChat_toNewPersonCentricID_(self, v16, (uint64_t)v17, (uint64_t)v15);
  }
}

- (void)_handleAddressBookChange:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_userInfo(a3, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_objectForKey_(v5, v6, *MEMORY[0x1E4F6CA90], v7);

  uint64_t v12 = objc_msgSend_cachedChats(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_copy(v12, v13, v14, v15);

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v17 = v16;
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v19)
  {
    uint64_t v23 = v19;
    uint64_t v24 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v30 != v24) {
          objc_enumerationMutation(v17);
        }
        uint64_t v26 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_msgSend_invalidateHasKnownParticipantsCache(v26, v20, v21, v22, (void)v29);
        objc_msgSend__handleAddressBookChangeForRecipientUID_(v26, v27, (uint64_t)v8, v28);
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v29, (uint64_t)v33, 16);
    }
    while (v23);
  }
}

- (id)_ownerHandleStringsFromSubscription:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_ownerHandles(a3, a2, (uint64_t)a3, v3);
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA70]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v26, (uint64_t)v30, 16);
  if (v8)
  {
    uint64_t v12 = v8;
    uint64_t v13 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v12; ++i)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v6);
        }
        uint64_t v15 = objc_msgSend_handleString(*(void **)(*((void *)&v26 + 1) + 8 * i), v9, v10, v11, (void)v26);
        if (objc_msgSend_length(v15, v16, v17, v18)) {
          objc_msgSend_addObject_(v5, v19, (uint64_t)v15, v20);
        }
      }
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v26, (uint64_t)v30, 16);
    }
    while (v12);
  }

  uint64_t v24 = objc_msgSend_array(v5, v21, v22, v23);

  return v24;
}

- (id)chatsWithMyself
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v2 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v6 = objc_msgSend_sharedInstance(IMAccountController, v3, v4, v5, 0);
  uint64_t v10 = objc_msgSend_accounts(v6, v7, v8, v9);

  uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v53, (uint64_t)v57, 16);
  if (v12)
  {
    uint64_t v16 = v12;
    uint64_t v17 = *(void *)v54;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v54 != v17) {
          objc_enumerationMutation(v10);
        }
        uint64_t v19 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend_sharedRegistry(IMChatRegistry, v13, v14, v15);
        uint64_t v24 = objc_msgSend_loginIMHandle(v19, v21, v22, v23);
        long long v27 = objc_msgSend__cachedChatWithHandle_(v20, v25, (uint64_t)v24, v26);

        if (objc_msgSend_chatStyle(v27, v28, v29, v30) == 45)
        {
          uint64_t v34 = objc_msgSend_participants(v27, v31, v32, v33);
          unint64_t v38 = objc_msgSend_count(v34, v35, v36, v37);

          if (v38 <= 1)
          {
            uint64_t v42 = objc_msgSend_recipient(v27, v39, v40, v41);
            if (objc_msgSend_matchesLoginHandleForAnyAccount(v42, v43, v44, v45)) {
              objc_msgSend_addObject_(v2, v46, (uint64_t)v27, v47);
            }
          }
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v13, (uint64_t)&v53, (uint64_t)v57, 16);
    }
    while (v16);
  }

  uint64_t v51 = objc_msgSend_copy(v2, v48, v49, v50);

  return v51;
}

- (id)_chatsMatchingHandles:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v32, (uint64_t)v41, 16);
  if (v8)
  {
    uint64_t v10 = *(void *)v33;
    *(void *)&long long v9 = 138412290;
    long long v30 = v9;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v33 != v10) {
          objc_enumerationMutation(obj);
        }
        uint64_t v12 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v40 = v12;
        uint64_t v13 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)&v40, 1, v30);
        uint64_t v15 = objc_msgSend_existingChatWithAddresses_allowAlternativeService_bestHandles_(self, v14, (uint64_t)v13, 0, 0);
        int v16 = IMOSLoggingEnabled();
        if (v15)
        {
          if (v16)
          {
            uint64_t v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              uint64_t v23 = objc_msgSend_guid(v15, v20, v21, v22);
              *(_DWORD *)long long buf = 138412546;
              uint64_t v37 = v23;
              __int16 v38 = 2112;
              uint64_t v39 = v12;
              _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "_chatsMatchingHandles: Found existing 1-1 chat %@ matching owner handle: %@", buf, 0x16u);
            }
          }
          objc_msgSend_addObject_(v5, v17, (uint64_t)v15, v18);
        }
        else if (v16)
        {
          uint64_t v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = v30;
            uint64_t v37 = v12;
            _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "_chatsMatchingHandles: Did not find any existing 1-1 chat matching owner handle: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v7, (uint64_t)&v32, (uint64_t)v41, 16);
    }
    while (v8);
  }

  long long v28 = objc_msgSend_copy(v5, v25, v26, v27);

  return v28;
}

- (void)_handleKeyTransparencyStatusChangedNotification:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v5, v6, v7);
  int isKeyTransparencyEnabled = objc_msgSend_isKeyTransparencyEnabled(v8, v9, v10, v11);

  if (isKeyTransparencyEnabled)
  {
    int v16 = objc_msgSend_userInfo(v4, v13, v14, v15);
    uint64_t v19 = objc_msgSend_objectForKey_(v16, v17, @"__kIMChatKTStatusChangedAffectedHandlesKey", v18);
    uint64_t v23 = objc_msgSend_copy(v19, v20, v21, v22);

    if (!objc_msgSend_count(v23, v24, v25, v26))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v40 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v58 = 0;
          _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "Received handle key transparency status changed notification with no information about impacted handles", v58, 2u);
        }
      }
      goto LABEL_15;
    }
    long long v30 = objc_msgSend_object(v4, v27, v28, v29);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();

    uint64_t v35 = objc_msgSend_object(v4, v32, v33, v34);
    uint64_t v39 = (void *)v35;
    if (isKindOfClass)
    {
      if (!v35)
      {
LABEL_15:

        goto LABEL_16;
      }
    }
    else
    {
      objc_opt_class();
      if ((objc_opt_isKindOfClass() & 1) == 0) {
        goto LABEL_14;
      }
      uint64_t v44 = objc_msgSend_count(v23, v41, v42, v43);

      if (v44 != 1) {
        goto LABEL_15;
      }
      long long v48 = objc_msgSend_object(v4, v45, v46, v47);
      uint64_t v52 = objc_msgSend_firstObject(v23, v49, v50, v51);
      long long v55 = objc_msgSend_existingIMHandleWithID_(v48, v53, (uint64_t)v52, v54);

      uint64_t v39 = objc_msgSend_existingChatWithHandle_(self, v56, (uint64_t)v55, v57);

      if (!v39) {
        goto LABEL_15;
      }
    }
    objc_msgSend__reloadChatItemsForKeyTransparencyStatusChange(v39, v36, v37, v38);
LABEL_14:

    goto LABEL_15;
  }
LABEL_16:
}

- (void)_handleOffGridChangedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_object(v4, v5, v6, v7);
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Received handle off grid changed notification for subscription: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  objc_msgSend__handleStatusChangedForSubscription_(self, v9, (uint64_t)v8, v10);
}

- (void)_handleOffGridInvitationReceivedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_object(v4, v5, v6, v7);
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Received handle off grid invitation received notification for subscription: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  objc_msgSend__handleStatusInvitationReceivedForSubscription_(self, v9, (uint64_t)v8, v10);
}

- (void)_handleOffGridStateChangedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_object(v4, v5, v6, v7);
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Received handle off grid state changed notification for subscription: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  objc_msgSend__handleStatusStateChangedForSubscription_(self, v9, (uint64_t)v8, v10);
}

- (void)_handleAvailabilityChangedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_object(v4, v5, v6, v7);
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Received handle availability changed notification for subscription: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  objc_msgSend__handleStatusChangedForSubscription_(self, v9, (uint64_t)v8, v10);
}

- (void)_handleAvailabilityInvitationReceivedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_object(v4, v5, v6, v7);
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Received handle availability invitation received notification for subscription: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  objc_msgSend__handleStatusInvitationReceivedForSubscription_(self, v9, (uint64_t)v8, v10);
}

- (void)_handleAvailabilityStateChangedNotification:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_object(v4, v5, v6, v7);
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      uint64_t v13 = v8;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Received handle availability state changed notification for subscription: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  objc_msgSend__handleStatusStateChangedForSubscription_(self, v9, (uint64_t)v8, v10);
}

- (void)_handleStatusChangedForSubscription:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend__chatsMatchingStatusSubscription_(self, a2, (uint64_t)a3, v3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend__reloadChatItemsForHandleAvailabilityChange(*(void **)(*((void *)&v13 + 1) + 8 * v12++), v7, v8, v9);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }
}

- (void)_handleStatusInvitationReceivedForSubscription:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend__chatsMatchingStatusSubscription_(self, a2, (uint64_t)a3, v3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend__reloadChatItemsForHandleAvailabilityChange(*(void **)(*((void *)&v13 + 1) + 8 * v12++), v7, v8, v9);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }
}

- (void)_handleStatusStateChangedForSubscription:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend__chatsMatchingStatusSubscription_(self, a2, (uint64_t)a3, v3);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v4);
        }
        objc_msgSend__reloadChatItemsForHandleAvailabilityChange(*(void **)(*((void *)&v13 + 1) + 8 * v12++), v7, v8, v9);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }
}

- (id)_chatsMatchingStatusSubscription:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v37 = v4;
  if (objc_msgSend_isPersonalStatusSubscription(v4, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend_chatsWithMyself(self, v8, v9, v10);
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v44 = v11;
        _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Status update is for personal channel. Found matching chats: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    long long v13 = objc_msgSend__ownerHandleStringsFromSubscription_(self, v8, (uint64_t)v4, v10);
    id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    long long v42 = 0u;
    id obj = v13;
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v15, (uint64_t)&v39, (uint64_t)v48, 16);
    if (v17)
    {
      uint64_t v18 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v40 != v18) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v39 + 1) + 8 * i);
          uint64_t v47 = v20;
          uint64_t v21 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v16, (uint64_t)&v47, 1);
          uint64_t v23 = objc_msgSend_existingChatWithAddresses_allowAlternativeService_bestHandles_(self, v22, (uint64_t)v21, 0, 0);
          int v24 = IMOSLoggingEnabled();
          if (v23)
          {
            if (v24)
            {
              uint64_t v27 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                uint64_t v31 = objc_msgSend_guid(v23, v28, v29, v30);
                *(_DWORD *)long long buf = 138412546;
                uint64_t v44 = v31;
                __int16 v45 = 2112;
                uint64_t v46 = v20;
                _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "_chatsMatchingStatusSubscription: Found existing 1-1 chat %@ matching owner handle: %@", buf, 0x16u);
              }
            }
            objc_msgSend_addObject_(v14, v25, (uint64_t)v23, v26);
          }
          else if (v24)
          {
            long long v32 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v44 = v20;
              _os_log_impl(&dword_1A4AF7000, v32, OS_LOG_TYPE_INFO, "_chatsMatchingStatusSubscription: Did not find any existing 1-1 chat matching owner handle: %@", buf, 0xCu);
            }
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v39, (uint64_t)v48, 16);
      }
      while (v17);
    }

    uint64_t v11 = objc_msgSend_copy(v14, v33, v34, v35);
  }

  return v11;
}

- (id)chatDictionariesForChat:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v4)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v26 = v4;
    uint64_t v9 = objc_msgSend__guids(v4, v5, v6, v7);
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v27, (uint64_t)v33, 16);
    if (v14)
    {
      uint64_t v15 = *(void *)v28;
      do
      {
        for (uint64_t i = 0; i != v14; ++i)
        {
          if (*(void *)v28 != v15) {
            objc_enumerationMutation(v9);
          }
          uint64_t v17 = *(void *)(*((void *)&v27 + 1) + 8 * i);
          uint64_t v18 = objc_msgSend_chatGUIDToInfoMap(self, v11, v12, v13);
          uint64_t v21 = objc_msgSend_objectForKeyedSubscript_(v18, v19, v17, v20);

          if (v21)
          {
            objc_msgSend_addObject_(v8, v22, (uint64_t)v21, v23);
          }
          else if (IMOSLoggingEnabled())
          {
            int v24 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v32 = v17;
              _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "chatDictionariesForChat: did not find chatDictionary for guid; %@",
                buf,
                0xCu);
            }
          }
        }
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v27, (uint64_t)v33, 16);
      }
      while (v14);
    }

    id v4 = v26;
  }

  return v8;
}

- (unint64_t)_defaultNumberOfMessagesToLoad
{
  return self->_defaultNumberOfMessagesToLoad;
}

- (BOOL)_postMessageSentNotifications
{
  return self->_postMessageSentNotifications;
}

- (OS_dispatch_queue)contactStoreQueue
{
  return self->_contactStoreQueue;
}

- (void)setContactStoreQueue:(id)a3
{
}

- (void)setContactStore:(id)a3
{
}

- (BOOL)_isLoading
{
  return self->__isLoading;
}

- (NSArray)preExistingAllChats
{
  return self->_preExistingAllChats;
}

- (void)setPreExistingAllChats:(id)a3
{
}

- (NSString)historyModificationStamp
{
  return self->_historyModificationStamp;
}

- (IMTimer)markAsReadTimer
{
  return self->_markAsReadTimer;
}

- (void)setMarkAsReadTimer:(id)a3
{
}

- (double)timerStartTimeInterval
{
  return self->_timerStartTimeInterval;
}

- (void)setTimerStartTimeInterval:(double)a3
{
  self->_timerStartTimeInterval = a3;
}

- (BOOL)loading
{
  return self->_loading;
}

- (BOOL)wantsHistoryReload
{
  return self->_wantsHistoryReload;
}

- (BOOL)isInternalInstall
{
  return self->_isInternalInstall;
}

- (void)setIsInternalInstall:(BOOL)a3
{
  self->_int isInternalInstall = a3;
}

- (NSMutableDictionary)chatsBeingLoadedMap
{
  return self->_chatsBeingLoadedMap;
}

- (void)setChatsBeingLoadedMap:(id)a3
{
}

- (void)setChatPersonIDToChatMap:(id)a3
{
}

- (NSMutableArray)allChatsInProcess
{
  return self->_allChatsInProcess;
}

- (NSMutableDictionary)chatGUIDToCurrentThreadMap
{
  return self->_chatGUIDToCurrentThreadMap;
}

- (NSMutableDictionary)threadNameToChatMap
{
  return self->_threadNameToChatMap;
}

- (NSMutableDictionary)simulatedChatGUIDToChatMap
{
  return self->_simulatedChatGUIDToChatMap;
}

- (NSMutableDictionary)chatGUIDToiMessageSentOrReceivedMap
{
  return self->_chatGUIDToiMessageSentOrReceivedMap;
}

- (void)setProcessingChatCacheMiss:(BOOL)a3
{
  self->_processingChatCacheMiss = a3;
}

- (NSSet)registryChangeHistoryChatsToUnregister
{
  return self->_registryChangeHistoryChatsToUnregister;
}

- (void)setRegistryChangeHistoryChatsToUnregister:(id)a3
{
}

- (NSSet)registryChangeHistoryChatsToObserve
{
  return self->_registryChangeHistoryChatsToObserve;
}

- (void)setRegistryChangeHistoryChatsToObserve:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_registryChangeHistoryChatsToObserve, 0);
  objc_storeStrong((id *)&self->_registryChangeHistoryChatsToUnregister, 0);
  objc_storeStrong((id *)&self->_userActivity, 0);
  objc_storeStrong((id *)&self->_groupParticipantToChatsMap, 0);
  objc_storeStrong((id *)&self->_groupIDToChatMap, 0);
  objc_storeStrong((id *)&self->_filterCategoryToEarliestInitiallyFetchedLastMessageDate, 0);
  objc_storeStrong((id *)&self->_chatGUIDToiMessageSentOrReceivedMap, 0);
  objc_storeStrong((id *)&self->_simulatedChatGUIDToChatMap, 0);
  objc_storeStrong((id *)&self->_threadNameToChatMap, 0);
  objc_storeStrong((id *)&self->_chatGUIDToInfoMap, 0);
  objc_storeStrong((id *)&self->_chatGUIDToCurrentThreadMap, 0);
  objc_storeStrong((id *)&self->_chatGUIDToChatMap, 0);
  objc_storeStrong((id *)&self->_cachedChatsInThreadNameMap, 0);
  objc_storeStrong((id *)&self->_allChatsInProcess, 0);
  objc_storeStrong((id *)&self->_chatPersonIDToChatMap, 0);
  objc_storeStrong((id *)&self->_chatsBeingLoadedMap, 0);
  objc_storeStrong((id *)&self->_markAsReadTimer, 0);
  objc_storeStrong((id *)&self->_historyModificationStamp, 0);
  objc_storeStrong((id *)&self->_conversationManager, 0);
  objc_storeStrong((id *)&self->_preExistingAllChats, 0);
  objc_storeStrong((id *)&self->_simulatedChats, 0);
  objc_storeStrong((id *)&self->_contactStore, 0);
  objc_storeStrong((id *)&self->_serviceNamesForChatIdentifierSearch, 0);

  objc_storeStrong((id *)&self->_contactStoreQueue, 0);
}

- (id)activeCallForConversationUUID:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v7 = objc_msgSend_sharedInstance(MEMORY[0x1E4FADA90], v4, v5, v6, 0);
  uint64_t v11 = objc_msgSend_currentVideoCalls(v7, v8, v9, v10);

  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v13)
  {
    uint64_t v17 = v13;
    uint64_t v18 = 0;
    uint64_t v19 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v36 != v19) {
          objc_enumerationMutation(v11);
        }
        uint64_t v21 = *(void **)(*((void *)&v35 + 1) + 8 * i);
        uint64_t v22 = objc_msgSend_sharedInstance(MEMORY[0x1E4FADA90], v14, v15, v16);
        uint64_t v25 = objc_msgSend_activeConversationForCall_(v22, v23, (uint64_t)v21, v24);

        long long v29 = objc_msgSend_UUID(v25, v26, v27, v28);
        int isEqual = objc_msgSend_isEqual_(v29, v30, (uint64_t)v3, v31);

        if (isEqual)
        {
          id v33 = v21;

          uint64_t v18 = v33;
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v35, (uint64_t)v39, 16);
    }
    while (v17);
  }
  else
  {
    uint64_t v18 = 0;
  }

  return v18;
}

- (id)_activeTUConversations
{
  id v4 = objc_msgSend_conversationManager(self, a2, v2, v3);
  id v8 = objc_msgSend_activeConversations(v4, v5, v6, v7);

  return v8;
}

- (id)_existingChatForTUConversation:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  id v8 = objc_msgSend_cachedChats(self, v5, v6, v7, 0);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v20, (uint64_t)v28, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v21 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (objc_msgSend_chatStyle(v16, v10, v11, v12) == 43
          && objc_msgSend_mapsToTUConversation_(v16, v10, (uint64_t)v4, v12))
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v18 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412546;
              uint64_t v25 = v16;
              __int16 v26 = 2112;
              id v27 = v4;
              _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Found chat %@ for TUConversation %@", buf, 0x16u);
            }
          }
          id v17 = v16;
          goto LABEL_16;
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v20, (uint64_t)v28, 16);
      if (v13) {
        continue;
      }
      break;
    }
  }
  id v17 = 0;
LABEL_16:

  return v17;
}

- (void)conversationManager:(id)a3 stateChangedForConversation:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "stateChangedForConversation %@", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_msgSend__postMultiWayStateChangedNotification_(self, v8, (uint64_t)v7, v9);
}

- (void)conversationManager:(id)a3 activeRemoteParticipantsChangedForConversation:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 136315138;
      id v12 = "-[IMChatRegistry(IMChatRegistry_CallManagement) conversationManager:activeRemoteParticipantsChangedForConversation:]";
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "activeRemoteParticipantsChangedForConversation %s", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_msgSend__postMultiWayStateChangedNotification_(self, v8, (uint64_t)v7, v9);
}

- (void)conversationManager:(id)a3 removedActiveConversation:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "removedActiveConversation %@", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_msgSend__postMultiWayStateChangedNotification_(self, v8, (uint64_t)v7, v9);
}

- (void)conversationManager:(id)a3 activitySessionsChangedForConversation:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "activitySessionsChangedForConversation %@", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_msgSend__postMultiWayStateChangedNotification_(self, v8, (uint64_t)v7, v9);
}

- (void)conversationManager:(id)a3 remoteMembersChangedForConversation:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v7;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "remoteMembersChangedForConversation %@", (uint8_t *)&v11, 0xCu);
    }
  }
  objc_msgSend__postMultiWayStateChangedNotification_(self, v8, (uint64_t)v7, v9);
}

- (void)_postMultiWayStateChangedNotification:(id)a3
{
  v31[2] = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v7 = objc_msgSend_messagesGroupUUID(v3, v4, v5, v6);
  int v11 = objc_msgSend_UUIDString(v7, v8, v9, v10);

  if (v11)
  {
    v31[0] = v11;
    v30[0] = @"__kIMChatMultiWayMessagesGroupID";
    v30[1] = @"__kIMChatMultiWayMessagesConversationUUID";
    uint64_t v15 = objc_msgSend_UUID(v3, v12, v13, v14);
    v31[1] = v15;
    id v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)v31, (uint64_t)v30, 2);
  }
  else
  {
    id v17 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    long long v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412802;
      uint64_t v25 = @"__kIMChatMultiWayStateChangedNotification";
      __int16 v26 = 2112;
      id v27 = v11;
      __int16 v28 = 2112;
      uint64_t v29 = v17;
      _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "posting notification %@ for chat with groupID %@ and userInfo %@", (uint8_t *)&v24, 0x20u);
    }
  }
  long long v22 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v18, v19, v20);
  objc_msgSend_postNotificationName_object_userInfo_(v22, v23, @"__kIMChatMultiWayStateChangedNotification", 0, v17);
}

- (void)markChatsAsReadFilteredUsingPredicate:(id)a3
{
  id v4 = a3;
  objc_msgSend_daemonController(self, v5, v6, v7);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  int v11 = objc_msgSend_synchronousRemoteDaemon(v14, v8, v9, v10);
  objc_msgSend_markChatsAsReadFilteredUsingPredicate_(v11, v12, (uint64_t)v4, v13);
}

- (unint64_t)numberOfCachedChats
{
  uint64_t v5 = objc_msgSend_simulatedChats(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_count(v5, v6, v7, v8);

  if (v9) {
    objc_msgSend_simulatedChats(self, v10, v11, v12);
  }
  else {
  uint64_t v13 = objc_msgSend_cachedChatsInThreadNameMap(self, v10, v11, v12);
  }
  unint64_t v17 = objc_msgSend_count(v13, v14, v15, v16);

  return v17;
}

- (id)_possiblyUnregisteredCachedChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 account:(id)a5
{
  uint64_t v6 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v46 = a5;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  uint64_t v12 = objc_msgSend_allChatsInProcess(self, v9, v10, v11);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v47, (uint64_t)v51, 16);
  if (!v14)
  {
    id v45 = 0;
    goto LABEL_17;
  }
  uint64_t v18 = v14;
  uint64_t v19 = *(void *)v48;
  uint64_t v44 = *(void *)v48;
  id v45 = 0;
  do
  {
    uint64_t v20 = 0;
    do
    {
      if (*(void *)v48 != v19) {
        objc_enumerationMutation(v12);
      }
      long long v21 = *(void **)(*((void *)&v47 + 1) + 8 * v20);
      long long v22 = objc_msgSend_chatIdentifier(v21, v15, v16, v17);
      if (!objc_msgSend_isEqualToString_(v8, v23, (uint64_t)v22, v24)
        || objc_msgSend_chatStyle(v21, v25, v26, v27) != v6)
      {
        goto LABEL_10;
      }
      id v31 = v8;
      uint64_t v32 = v12;
      uint64_t v33 = v6;
      uint64_t v34 = objc_msgSend_account(v21, v28, v29, v30);
      long long v38 = objc_msgSend_uniqueID(v34, v35, v36, v37);
      int isEqualToString = objc_msgSend_isEqualToString_(v46, v39, (uint64_t)v38, v40);

      if (isEqualToString)
      {
        long long v22 = v45;
        id v45 = v21;
        uint64_t v6 = v33;
        uint64_t v12 = v32;
        id v8 = v31;
        uint64_t v19 = v44;
LABEL_10:

        goto LABEL_11;
      }
      uint64_t v6 = v33;
      uint64_t v12 = v32;
      id v8 = v31;
      uint64_t v19 = v44;
LABEL_11:
      ++v20;
    }
    while (v18 != v20);
    uint64_t v42 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v47, (uint64_t)v51, 16);
    uint64_t v18 = v42;
  }
  while (v42);
LABEL_17:

  return v45;
}

- (id)_possiblyUnregisteredCachedChatWithHandle:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = objc_msgSend_ID(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_account(v4, v9, v10, v11);
  uint64_t v16 = objc_msgSend_uniqueID(v12, v13, v14, v15);
  uint64_t v18 = objc_msgSend__possiblyUnregisteredCachedChatWithIdentifier_style_account_(self, v17, (uint64_t)v8, 45, v16);

  if (!v18)
  {
    long long v22 = objc_msgSend__chatSiblings(v4, v19, v20, v21);
    if (objc_msgSend_count(v22, v23, v24, v25))
    {
      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      id v26 = v22;
      uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v48, (uint64_t)v52, 16);
      if (v28)
      {
        uint64_t v32 = v28;
        long long v47 = v22;
        uint64_t v33 = *(void *)v49;
LABEL_5:
        uint64_t v34 = 0;
        while (1)
        {
          if (*(void *)v49 != v33) {
            objc_enumerationMutation(v26);
          }
          long long v35 = *(void **)(*((void *)&v48 + 1) + 8 * v34);
          uint64_t v36 = objc_msgSend_ID(v35, v29, v30, v31);
          uint64_t v40 = objc_msgSend_account(v35, v37, v38, v39);
          uint64_t v44 = objc_msgSend_uniqueID(v40, v41, v42, v43);
          uint64_t v18 = objc_msgSend__possiblyUnregisteredCachedChatWithIdentifier_style_account_(self, v45, (uint64_t)v36, 45, v44);

          if (v18) {
            break;
          }
          if (v32 == ++v34)
          {
            uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v48, (uint64_t)v52, 16);
            if (v32) {
              goto LABEL_5;
            }
            uint64_t v18 = 0;
            break;
          }
        }
        long long v22 = v47;
      }
      else
      {
        uint64_t v18 = 0;
      }
    }
    else
    {
      uint64_t v18 = 0;
    }
  }

  return v18;
}

- (id)_possiblyUnregisteredCachedChatWithHandles:(id)a3 style:(unsigned __int8)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7
{
  BOOL v72 = a7;
  int v9 = a4;
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v74 = a5;
  id v12 = a6;
  id v71 = v11;
  if (objc_msgSend_count(v11, v13, v14, v15))
  {
    uint64_t v19 = objc_msgSend_allChatsInProcess(self, v16, v17, v18);
    if (objc_msgSend_length(v12, v20, v21, v22)) {
      long long v23 = v12;
    }
    else {
      long long v23 = 0;
    }
    id v24 = v23;

    long long v77 = 0u;
    long long v78 = 0u;
    long long v75 = 0u;
    long long v76 = 0u;
    id obj = v19;
    uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v25, (uint64_t)&v75, (uint64_t)v79, 16);
    if (v26)
    {
      uint64_t v30 = v26;
      uint64_t v31 = *(void *)v76;
LABEL_7:
      uint64_t v32 = 0;
      while (1)
      {
        if (*(void *)v76 != v31) {
          objc_enumerationMutation(obj);
        }
        uint64_t v33 = *(void **)(*((void *)&v75 + 1) + 8 * v32);
        if (objc_msgSend_chatStyle(v33, v27, v28, v29) != v9) {
          goto LABEL_28;
        }
        uint64_t v34 = objc_msgSend_displayName(v33, v27, v28, v29);
        uint64_t v38 = objc_msgSend_length(v34, v35, v36, v37);
        if (v74 && v38 && (objc_msgSend_groupID(v33, v39, v40, v41), (uint64_t v42 = objc_claimAutoreleasedReturnValue()) != 0))
        {
          id v46 = (void *)v42;
          long long v47 = objc_msgSend_groupID(v33, v43, v44, v45);
          int isEqualToString = objc_msgSend_isEqualToString_(v74, v48, (uint64_t)v47, v49);

          if (isEqualToString)
          {
            id v69 = v33;
            goto LABEL_33;
          }
        }
        else
        {
        }
        uint64_t v54 = objc_msgSend_displayName(v33, v51, v52, v53);
        if (!objc_msgSend_length(v54, v55, v56, v57)) {
          break;
        }
        id v61 = objc_msgSend_displayName(v33, v58, v59, v60);

        if (!v61) {
          goto LABEL_23;
        }
        if (v24 && (objc_msgSend_isEqualToString_(v61, v62, (uint64_t)v24, v64) & 1) != 0)
        {
LABEL_24:
          if (!v72 || objc_msgSend_joinState(v33, v62, v63, v64) >= 2)
          {
            uint64_t v65 = objc_msgSend_participants(v33, v62, v63, v64);
            char hasSameMembers = objc_msgSend__hasSameMembers_(v65, v66, (uint64_t)v71, v67);

            if (hasSameMembers)
            {
              id v69 = v33;

              goto LABEL_33;
            }
          }
        }
LABEL_27:

LABEL_28:
        if (v30 == ++v32)
        {
          uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v75, (uint64_t)v79, 16);
          if (v30) {
            goto LABEL_7;
          }
          goto LABEL_30;
        }
      }

LABEL_23:
      id v61 = 0;
      if (!v24) {
        goto LABEL_24;
      }
      goto LABEL_27;
    }
LABEL_30:
    id v69 = 0;
LABEL_33:
  }
  else
  {
    id v69 = 0;
    id v24 = v12;
  }

  return v69;
}

- (id)_possiblyUnregisteredCachedChatForRoom:(id)a3 onAccount:(id)a4
{
  id v6 = a3;
  uint64_t v10 = objc_msgSend_uniqueID(a4, v7, v8, v9);
  id v12 = objc_msgSend__possiblyUnregisteredCachedChatWithIdentifier_style_account_(self, v11, (uint64_t)v6, 35, v10);

  return v12;
}

- (id)_cachedChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7
{
  return (id)MEMORY[0x1F4181798](self, sel__cachedChatWithHandles_allowAlternativeService_groupID_displayName_joinedChatsOnly_findMatchingNamedGroups_, a3, a4);
}

- (id)_cachedChatWithHandles:(id)a3 allowAlternativeService:(BOOL)a4 groupID:(id)a5 displayName:(id)a6 joinedChatsOnly:(BOOL)a7 findMatchingNamedGroups:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v59 = a7;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v61 = a5;
  id v60 = a6;
  uint64_t v58 = v12;
  if (objc_msgSend_count(v12, v13, v14, v15))
  {
    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    uint64_t v19 = objc_msgSend_cachedChatsInThreadNameMap(self, v16, v17, v18);
    uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v62, (uint64_t)v66, 16);
    if (v21)
    {
      uint64_t v25 = v21;
      uint64_t v26 = *(void *)v63;
      uint64_t v57 = v19;
      while (2)
      {
        for (uint64_t i = 0; i != v25; ++i)
        {
          if (*(void *)v63 != v26) {
            objc_enumerationMutation(v19);
          }
          uint64_t v28 = *(void **)(*((void *)&v62 + 1) + 8 * i);
          if (objc_msgSend_chatStyle(v28, v22, v23, v24) == 43)
          {
            uint64_t v29 = objc_msgSend_displayName(v28, v22, v23, v24);
            uint64_t v36 = objc_msgSend_groupID(v28, v30, v31, v32);
            if ((v8 || !objc_msgSend_length(v29, v33, v34, v35))
              && (!objc_msgSend_length(v36, v33, v34, v35)
               || !objc_msgSend_length(v61, v37, v38, v39)
               || objc_msgSend_isEqualToString_(v61, v37, (uint64_t)v36, v39))
              && (!objc_msgSend_length(v29, v37, v38, v39)
               || !objc_msgSend_length(v60, v40, v41, v42)
               || objc_msgSend_isEqualToString_(v60, v40, (uint64_t)v29, v42))
              && (!v59
               || objc_msgSend_joinState(v28, v40, v41, v42) == 2
               || objc_msgSend_joinState(v28, v43, v44, v45) == 3))
            {
              BOOL v46 = v8;
              long long v47 = (void *)MEMORY[0x1A6264150]();
              long long v51 = objc_msgSend_participants(v28, v48, v49, v50);
              int v54 = objc_msgSend_equivalentToRecipients_(v58, v52, (uint64_t)v51, v53);

              if (v54)
              {
                id v55 = v28;

                uint64_t v19 = v57;
                goto LABEL_27;
              }
              BOOL v8 = v46;
              uint64_t v19 = v57;
            }
          }
        }
        uint64_t v25 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v22, (uint64_t)&v62, (uint64_t)v66, 16);
        if (v25) {
          continue;
        }
        break;
      }
    }
    id v55 = 0;
LABEL_27:
  }
  else
  {
    id v55 = 0;
  }

  return v55;
}

- (id)_cachedChatWithDisplayName:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  BOOL v8 = objc_msgSend_cachedChats(self, v5, v6, v7, 0);
  id v13 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v13; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        uint64_t v17 = objc_msgSend_displayName(v16, v10, v11, v12);
        char isEqualToString = objc_msgSend_isEqualToString_(v17, v18, (uint64_t)v4, v19);

        if (isEqualToString)
        {
          id v13 = v16;
          goto LABEL_11;
        }
      }
      id v13 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v22, (uint64_t)v26, 16);
      if (v13) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v13;
}

- (id)_cachedChatsWithDisplayName:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = objc_msgSend_cachedChats(self, v6, v7, v8, 0);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v11)
  {
    uint64_t v15 = v11;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v9);
        }
        uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend_displayName(v18, v12, v13, v14);
        int isEqualToString = objc_msgSend_isEqualToString_(v19, v20, (uint64_t)v4, v21);

        if (isEqualToString) {
          objc_msgSend_addObject_(v5, v12, (uint64_t)v18, v14);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v15);
  }

  return v5;
}

- (id)_cachedChatsWithMessage:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  uint64_t v9 = objc_msgSend_cachedChats(self, v6, v7, v8, 0);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v11)
  {
    uint64_t v15 = v11;
    uint64_t v16 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v25 != v16) {
          objc_enumerationMutation(v9);
        }
        uint64_t v18 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        uint64_t v19 = objc_msgSend_guid(v4, v12, v13, v14);
        long long v22 = objc_msgSend_messageForGUID_(v18, v20, (uint64_t)v19, v21);

        if (v22) {
          objc_msgSend_addObject_(v5, v12, (uint64_t)v18, v14);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v24, (uint64_t)v28, 16);
    }
    while (v15);
  }

  return v5;
}

- (id)_cachedChatsWithMessageGUID:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v9 = objc_msgSend_cachedChats(self, v6, v7, v8, 0);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v11)
  {
    uint64_t v14 = v11;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v9);
        }
        uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_messageForGUID_(v17, v12, (uint64_t)v4, v13);

        if (v18) {
          objc_msgSend_addObject_(v5, v12, (uint64_t)v17, v13);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v20, (uint64_t)v24, 16);
    }
    while (v14);
  }

  return v5;
}

- (id)unblackholeChatWithHandles:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      *(void *)&uint8_t buf[4] = v3;
      *(_WORD *)&buf[12] = 2048;
      *(void *)&buf[14] = objc_msgSend_count(v3, v8, v9, v10);
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Request to load chat with handleIDs array %@ of count %lu", buf, 0x16u);
    }
  }
  if (v3)
  {
    id v49 = v3;
    if (objc_msgSend_count(v3, v4, v5, v6))
    {
      uint64_t v14 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v11, v12, v13);
      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      id v15 = v3;
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v52, (uint64_t)v60, 16);
      if (v20)
      {
        uint64_t v21 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v20; ++i)
          {
            if (*(void *)v53 != v21) {
              objc_enumerationMutation(v15);
            }
            long long v23 = *(void **)(*((void *)&v52 + 1) + 8 * i);
            long long v24 = objc_msgSend_ID(v23, v17, v18, v19);
            if (objc_msgSend__appearsToBePhoneNumber(v24, v25, v26, v27))
            {
              uint64_t v28 = IMInternationalForPhoneNumberWithOptions();

              long long v24 = (void *)v28;
            }
            uint64_t v29 = IMStripFormattingFromAddress();
            objc_msgSend_addObject_(v14, v30, (uint64_t)v29, v31);

            if (IMOSLoggingEnabled())
            {
              uint64_t v32 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412546;
                *(void *)&uint8_t buf[4] = v23;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v24;
                _os_log_impl(&dword_1A4AF7000, v32, OS_LOG_TYPE_INFO, "Adding IMHandle: %@ into rawAddresses set as ID string %@", buf, 0x16u);
              }
            }
          }
          uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v52, (uint64_t)v60, 16);
        }
        while (v20);
      }

      if (IMOSLoggingEnabled())
      {
        uint64_t v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          uint64_t v40 = objc_msgSend_count(v14, v37, v38, v39);
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v14;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v40;
          _os_log_impl(&dword_1A4AF7000, v36, OS_LOG_TYPE_INFO, "No exisiting chat. Calling out to daemon to find potential chat rawAddressSet set %@ of count %lu", buf, 0x16u);
        }
      }
      *(void *)long long buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      uint64_t v57 = sub_1A4B345DC;
      uint64_t v58 = sub_1A4B343D4;
      id v59 = 0;
      uint64_t v41 = objc_msgSend_daemonController(self, v33, v34, v35);
      uint64_t v45 = objc_msgSend_synchronousRemoteDaemon(v41, v42, v43, v44);
      v51[0] = MEMORY[0x1E4F143A8];
      v51[1] = 3221225472;
      v51[2] = sub_1A4C3F980;
      v51[3] = &unk_1E5B7C210;
      v51[4] = self;
      v51[5] = buf;
      objc_msgSend_unblackholeAndLoadChatWithHandleIDs_reply_(v45, v46, (uint64_t)v14, (uint64_t)v51);

      id v47 = *(id *)(*(void *)&buf[8] + 40);
      _Block_object_dispose(buf, 8);
    }
    else
    {
      id v47 = 0;
    }
    id v3 = v49;
  }
  else
  {
    id v47 = 0;
  }

  return v47;
}

- (void)_IMChatGetIdentifiersAndServicesTestHookWithChatRegistry:(id)a3 chat:(id)a4 identifiers:(id *)a5 services:(id *)a6 personCentricEnabled:(BOOL)a7
{
}

- (void)_chat:(id)a3 sendReadReceiptForMessages:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      id v59 = v6;
      __int16 v60 = 2112;
      id v61 = v7;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_DEBUG, "chat: %@  messages: %@", buf, 0x16u);
    }
  }
  uint64_t v12 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v12, v13, 0, v14)) == 0)
  {
    uint64_t v18 = objc_msgSend_sharedInstance(IMDaemonController, v15, v16, v17);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v18, v19, 0, v20)) == 0)
    {
      long long v52 = objc_msgSend_sharedInstance(IMDaemonController, v21, v22, v23);
      BOOL v55 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v52, v53, 0, v54)) == 0;

      if (v55) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v30 = objc_msgSend_account(v6, v24, v25, v26);
  if (v30)
  {
    uint64_t v31 = objc_msgSend_chatIdentifier(v6, v27, v28, v29);
    BOOL v32 = v31 == 0;

    if (!v32)
    {
      if (objc_msgSend_count(v7, v33, v34, v35))
      {
        id v56 = 0;
        id v57 = 0;
        sub_1A4C416E0(self, v6, &v57, &v56);
        id v36 = v57;
        id v37 = v56;
        uint64_t v38 = (void *)IMCreateSerializedItemsFromArray();
        uint64_t v42 = objc_msgSend_sharedInstance(IMDaemonController, v39, v40, v41);
        uint64_t v46 = objc_msgSend_chatStyle(v6, v43, v44, v45);
        uint64_t v50 = objc_msgSend_unreadMessageCount(v6, v47, v48, v49);
        objc_msgSend_markReadForIDs_style_onServices_messages_clientUnreadCount_(v42, v51, (uint64_t)v36, v46, v37, v38, v50);
      }
    }
  }
LABEL_13:
}

- (void)_chat_sendReadReceiptForAllMessages:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v57 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEBUG, "chat: %@", buf, 0xCu);
    }
  }
  uint64_t v9 = objc_msgSend_sharedInstance(IMDaemonController, v5, v6, v7);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v9, v10, 0, v11)) == 0)
  {
    id v15 = objc_msgSend_sharedInstance(IMDaemonController, v12, v13, v14);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v15, v16, 0, v17)) == 0)
    {
      uint64_t v50 = objc_msgSend_sharedInstance(IMDaemonController, v18, v19, v20);
      BOOL v53 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v50, v51, 0, v52)) == 0;

      if (v53) {
        goto LABEL_16;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v27 = objc_msgSend_account(v4, v21, v22, v23);
  if (v27)
  {
    uint64_t v28 = objc_msgSend_chatIdentifier(v4, v24, v25, v26);
    BOOL v29 = v28 == 0;

    if (!v29)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = objc_msgSend_account(v4, v31, v32, v33);
          *(_DWORD *)long long buf = 138412546;
          id v57 = v4;
          __int16 v58 = 2112;
          id v59 = v34;
          _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Sending read receipt for all messages in chat: %@   for account: %@", buf, 0x16u);
        }
      }
      id v54 = 0;
      id v55 = 0;
      sub_1A4C416E0(self, v4, &v55, &v54);
      id v35 = v55;
      id v36 = v54;
      uint64_t v40 = objc_msgSend_sharedInstance(IMDaemonController, v37, v38, v39);
      uint64_t v44 = objc_msgSend_chatStyle(v4, v41, v42, v43);
      uint64_t v48 = objc_msgSend_unreadMessageCount(v4, v45, v46, v47);
      objc_msgSend_markReadForIDs_style_onServices_messages_clientUnreadCount_setUnreadCountToZero_(v40, v49, (uint64_t)v35, v44, v36, 0, v48, 1);
    }
  }
LABEL_16:
}

- (void)_chat_markLastMessageAsUnread:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = (char *)a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v54 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEBUG, "chat: %@", buf, 0xCu);
    }
  }
  uint64_t v9 = objc_msgSend_sharedInstance(IMDaemonController, v5, v6, v7);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v9, v10, 0, v11)) == 0)
  {
    id v15 = objc_msgSend_sharedInstance(IMDaemonController, v12, v13, v14);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v15, v16, 0, v17)) == 0)
    {
      uint64_t v47 = objc_msgSend_sharedInstance(IMDaemonController, v18, v19, v20);
      BOOL v50 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v47, v48, 0, v49)) == 0;

      if (v50) {
        goto LABEL_18;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v27 = objc_msgSend_lastIncomingFinishedMessage(v4, v21, v22, v23);
  if (!v27)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 136315394;
        id v54 = "-[IMChatRegistry(IMChatRegistry_Sending) _chat_markLastMessageAsUnread:]";
        __int16 v55 = 2112;
        id v56 = v4;
        _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "%s Unable to get lastIncomingFinishedMessage, falling back to lastFinishedMessage. chat: %@", buf, 0x16u);
      }
    }
    uint64_t v27 = objc_msgSend_lastFinishedMessage(v4, v28, v29, v30);
  }
  uint64_t v32 = objc_msgSend_guid(v27, v24, v25, v26);
  if (objc_msgSend_isFromMe(v27, v33, v34, v35))
  {

    uint64_t v32 = 0;
  }
  id v51 = 0;
  id v52 = 0;
  sub_1A4C416E0(self, v4, &v52, &v51);
  id v36 = v52;
  id v37 = v51;
  uint64_t v41 = objc_msgSend_sharedInstance(IMDaemonController, v38, v39, v40);
  uint64_t v45 = objc_msgSend_chatStyle(v4, v42, v43, v44);
  objc_msgSend_markUnreadForMessageGUID_IDs_style_services_(v41, v46, (uint64_t)v32, (uint64_t)v36, v45, v37);

LABEL_18:
}

- (void)_chat_recoverFromJunk:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v3 = (char *)a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      int v49 = 138412290;
      BOOL v50 = v3;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_DEBUG, "chat: %@", (uint8_t *)&v49, 0xCu);
    }
  }
  uint64_t v8 = objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v8, v9, 0, v10)) == 0)
  {
    uint64_t v14 = objc_msgSend_sharedInstance(IMDaemonController, v11, v12, v13);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v14, v15, 0, v16)) == 0)
    {
      uint64_t v45 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
      BOOL v48 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v45, v46, 0, v47)) == 0;

      if (v48) {
        goto LABEL_20;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v26 = objc_msgSend_lastIncomingFinishedMessage(v3, v20, v21, v22);
  if (!v26)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        int v49 = 136315394;
        BOOL v50 = "-[IMChatRegistry(IMChatRegistry_Sending) _chat_recoverFromJunk:]";
        __int16 v51 = 2112;
        id v52 = v3;
        _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "%s Unable to get lastIncomingFinishedMessage, falling back to lastFinishedMessage. chat: %@", (uint8_t *)&v49, 0x16u);
      }
    }
    uint64_t v26 = objc_msgSend_lastFinishedMessage(v3, v27, v28, v29);
  }
  uint64_t v34 = objc_msgSend_guid(v26, v23, v24, v25);
  if (v34)
  {
    uint64_t v35 = objc_msgSend_sharedInstance(IMDaemonController, v31, v32, v33);
    objc_msgSend_recoverChatsFromJunkContainingMessageWithGUID_(v35, v36, (uint64_t)v34, v37);
  }
  else
  {
    uint64_t v35 = IMLogHandleForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB98B0(v35, v38, v39, v40, v41, v42, v43, v44);
    }
  }

LABEL_20:
}

- (void)_chat_storeItem:(id)a3 inChat:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = v6;
  if (!v5 || !v6) {
    goto LABEL_18;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v47 = 138412546;
      id v48 = v7;
      __int16 v49 = 2112;
      id v50 = v5;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_DEBUG, "chat: %@  item: %@", (uint8_t *)&v47, 0x16u);
    }
  }
  uint64_t v12 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v12, v13, 0, v14)) == 0)
  {
    uint64_t v18 = objc_msgSend_sharedInstance(IMDaemonController, v15, v16, v17);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v18, v19, 0, v20)) == 0)
    {
      uint64_t v43 = objc_msgSend_sharedInstance(IMDaemonController, v21, v22, v23);
      BOOL v46 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v43, v44, 0, v45)) == 0;

      if (v46) {
        goto LABEL_18;
      }
      goto LABEL_11;
    }
  }
LABEL_11:
  uint64_t v30 = objc_msgSend_account(v7, v24, v25, v26);
  if (v30)
  {
    uint64_t v31 = objc_msgSend_chatIdentifier(v7, v27, v28, v29);
    BOOL v32 = v31 == 0;

    if (!v32)
    {
      if (IMOSLoggingEnabled())
      {
        id v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          int v47 = 138412546;
          id v48 = v5;
          __int16 v49 = 2112;
          id v50 = v7;
          _os_log_impl(&dword_1A4AF7000, v36, OS_LOG_TYPE_INFO, "Storing item: %@ in chat: %@", (uint8_t *)&v47, 0x16u);
        }
      }
      uint64_t v37 = objc_msgSend_sharedInstance(IMDaemonController, v33, v34, v35);
      uint64_t v41 = objc_msgSend_guid(v7, v38, v39, v40);
      objc_msgSend_storeItem_inChatGUID_(v37, v42, (uint64_t)v5, (uint64_t)v41);
    }
  }
LABEL_18:
}

- (void)_chat:(id)a3 sendPlayedReceiptForMessage:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      id v56 = v6;
      __int16 v57 = 2112;
      id v58 = v7;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_DEBUG, "chat: %@ message: %@", buf, 0x16u);
    }
  }
  uint64_t v12 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v12, v13, 0, v14)) == 0)
  {
    uint64_t v18 = objc_msgSend_sharedInstance(IMDaemonController, v15, v16, v17);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v18, v19, 0, v20)) == 0)
    {
      __int16 v49 = objc_msgSend_sharedInstance(IMDaemonController, v21, v22, v23);
      BOOL v52 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v49, v50, 0, v51)) == 0;

      if (v52) {
        goto LABEL_18;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v30 = objc_msgSend_account(v6, v24, v25, v26);
  if (v30)
  {
    uint64_t v31 = objc_msgSend_chatIdentifier(v6, v27, v28, v29);
    BOOL v32 = v31 == 0;

    if (!v32)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v37 = objc_msgSend_account(v6, v34, v35, v36);
          *(_DWORD *)long long buf = 138412802;
          id v56 = v7;
          __int16 v57 = 2112;
          id v58 = v6;
          __int16 v59 = 2112;
          uint64_t v60 = v37;
          _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "Sending played receipt for message %@ in chat: %@   for account: %@", buf, 0x20u);
        }
      }
      id v53 = 0;
      id v54 = 0;
      sub_1A4C416E0(self, v6, &v54, &v53);
      id v38 = v54;
      id v42 = v53;
      if (v7)
      {
        uint64_t v43 = objc_msgSend_sharedInstance(IMDaemonController, v39, v40, v41);
        uint64_t v47 = objc_msgSend_chatStyle(v6, v44, v45, v46);
        objc_msgSend_markPlayedForIDs_style_onServices_message_(v43, v48, (uint64_t)v38, v47, v42, v7);
      }
    }
  }
LABEL_18:
}

- (void)_chat:(id)a3 setPlayedExpressiveSendForMessage:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      id v56 = v6;
      __int16 v57 = 2112;
      id v58 = v7;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_DEBUG, "chat: %@ message: %@", buf, 0x16u);
    }
  }
  uint64_t v12 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v12, v13, 0, v14)) == 0)
  {
    uint64_t v18 = objc_msgSend_sharedInstance(IMDaemonController, v15, v16, v17);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v18, v19, 0, v20)) == 0)
    {
      __int16 v49 = objc_msgSend_sharedInstance(IMDaemonController, v21, v22, v23);
      BOOL v52 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v49, v50, 0, v51)) == 0;

      if (v52) {
        goto LABEL_18;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v30 = objc_msgSend_account(v6, v24, v25, v26);
  if (v30)
  {
    uint64_t v31 = objc_msgSend_chatIdentifier(v6, v27, v28, v29);
    BOOL v32 = v31 == 0;

    if (!v32)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v37 = objc_msgSend_account(v6, v34, v35, v36);
          *(_DWORD *)long long buf = 138412802;
          id v56 = v7;
          __int16 v57 = 2112;
          id v58 = v6;
          __int16 v59 = 2112;
          uint64_t v60 = v37;
          _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "Setting played expressive send for message %@ in chat: %@   for account: %@", buf, 0x20u);
        }
      }
      id v53 = 0;
      id v54 = 0;
      sub_1A4C416E0(self, v6, &v54, &v53);
      id v38 = v54;
      id v42 = v53;
      if (v7)
      {
        uint64_t v43 = objc_msgSend_sharedInstance(IMDaemonController, v39, v40, v41);
        uint64_t v47 = objc_msgSend_chatStyle(v6, v44, v45, v46);
        objc_msgSend_markPlayedExpressiveSendForIDs_style_onServices_message_(v43, v48, (uint64_t)v38, v47, v42, v7);
      }
    }
  }
LABEL_18:
}

- (void)_chat:(id)a3 sendSavedReceiptForMessage:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      id v56 = v6;
      __int16 v57 = 2112;
      id v58 = v7;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_DEBUG, "chat: %@ message: %@", buf, 0x16u);
    }
  }
  uint64_t v12 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v12, v13, 0, v14)) == 0)
  {
    uint64_t v18 = objc_msgSend_sharedInstance(IMDaemonController, v15, v16, v17);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v18, v19, 0, v20)) == 0)
    {
      __int16 v49 = objc_msgSend_sharedInstance(IMDaemonController, v21, v22, v23);
      BOOL v52 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v49, v50, 0, v51)) == 0;

      if (v52) {
        goto LABEL_18;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v30 = objc_msgSend_account(v6, v24, v25, v26);
  if (v30)
  {
    uint64_t v31 = objc_msgSend_chatIdentifier(v6, v27, v28, v29);
    BOOL v32 = v31 == 0;

    if (!v32)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v37 = objc_msgSend_account(v6, v34, v35, v36);
          *(_DWORD *)long long buf = 138412802;
          id v56 = v7;
          __int16 v57 = 2112;
          id v58 = v6;
          __int16 v59 = 2112;
          uint64_t v60 = v37;
          _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "Sending saved receipt for message %@ in chat: %@   for account: %@", buf, 0x20u);
        }
      }
      id v53 = 0;
      id v54 = 0;
      sub_1A4C416E0(self, v6, &v54, &v53);
      id v38 = v54;
      id v42 = v53;
      if (v7)
      {
        uint64_t v43 = objc_msgSend_sharedInstance(IMDaemonController, v39, v40, v41);
        uint64_t v47 = objc_msgSend_chatStyle(v6, v44, v45, v46);
        objc_msgSend_markSavedForIDs_style_onServices_message_(v43, v48, (uint64_t)v38, v47, v42, v7);
      }
    }
  }
LABEL_18:
}

- (void)_chat:(id)a3 sendNotifyRecipientCommandForMessage:(id)a4
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      id v56 = v6;
      __int16 v57 = 2112;
      id v58 = v7;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_DEBUG, "chat: %@ message: %@", buf, 0x16u);
    }
  }
  uint64_t v12 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v12, v13, 0, v14)) == 0)
  {
    uint64_t v18 = objc_msgSend_sharedInstance(IMDaemonController, v15, v16, v17);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v18, v19, 0, v20)) == 0)
    {
      __int16 v49 = objc_msgSend_sharedInstance(IMDaemonController, v21, v22, v23);
      BOOL v52 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v49, v50, 0, v51)) == 0;

      if (v52) {
        goto LABEL_18;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v30 = objc_msgSend_account(v6, v24, v25, v26);
  if (v30)
  {
    uint64_t v31 = objc_msgSend_chatIdentifier(v6, v27, v28, v29);
    BOOL v32 = v31 == 0;

    if (!v32)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          uint64_t v37 = objc_msgSend_account(v6, v34, v35, v36);
          *(_DWORD *)long long buf = 138412802;
          id v56 = v7;
          __int16 v57 = 2112;
          id v58 = v6;
          __int16 v59 = 2112;
          uint64_t v60 = v37;
          _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "Sending notify recipient commadn for message %@ in chat: %@   for account: %@", buf, 0x20u);
        }
      }
      id v53 = 0;
      id v54 = 0;
      sub_1A4C416E0(self, v6, &v54, &v53);
      id v38 = v54;
      id v42 = v53;
      if (v7)
      {
        uint64_t v43 = objc_msgSend_sharedInstance(IMDaemonController, v39, v40, v41);
        uint64_t v47 = objc_msgSend_chatStyle(v6, v44, v45, v46);
        objc_msgSend_sendNotifyRecipientCommandForIDs_style_onServices_message_(v43, v48, (uint64_t)v38, v47, v42, v7);
      }
    }
  }
LABEL_18:
}

- (void)_markHasHadSuccessfulQueryForChat:(id)a3
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v53 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEBUG, "chat: %@", buf, 0xCu);
    }
  }
  uint64_t v9 = objc_msgSend_sharedInstance(IMDaemonController, v5, v6, v7);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v9, v10, 0, v11)) == 0)
  {
    id v15 = objc_msgSend_sharedInstance(IMDaemonController, v12, v13, v14);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v15, v16, 0, v17)) == 0)
    {
      uint64_t v46 = objc_msgSend_sharedInstance(IMDaemonController, v18, v19, v20);
      BOOL v49 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v46, v47, 0, v48)) == 0;

      if (v49) {
        goto LABEL_16;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v27 = objc_msgSend_account(v4, v21, v22, v23);
  if (v27)
  {
    uint64_t v28 = objc_msgSend_chatIdentifier(v4, v24, v25, v26);
    BOOL v29 = v28 == 0;

    if (!v29)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          uint64_t v34 = objc_msgSend_account(v4, v31, v32, v33);
          *(_DWORD *)long long buf = 138412546;
          id v53 = v4;
          __int16 v54 = 2112;
          __int16 v55 = v34;
          _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Marking chat as had successful ID query in chat: %@   for account: %@", buf, 0x16u);
        }
      }
      id v50 = 0;
      id v51 = 0;
      sub_1A4C416E0(self, v4, &v51, &v50);
      id v35 = v51;
      id v36 = v50;
      uint64_t v40 = objc_msgSend_sharedInstance(IMDaemonController, v37, v38, v39);
      uint64_t v44 = objc_msgSend_chatStyle(v4, v41, v42, v43);
      objc_msgSend_markHasHadSuccessfulQueryForIDs_style_onServices_(v40, v45, (uint64_t)v35, v44, v36);
    }
  }
LABEL_16:
}

- (id)_eventForMessage:(id)a3
{
  id v3 = a3;
  uint64_t v7 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (!v3 || (objc_msgSend_isTypingMessage(v3, v4, v5, v6) & 1) != 0) {
    goto LABEL_35;
  }
  uint64_t v11 = objc_msgSend_balloonBundleID(v3, v8, v9, v10);
  int v14 = objc_msgSend_containsString_(v11, v12, *MEMORY[0x1E4F6CBE8], v13);

  if (v14)
  {
    if (v7)
    {
      id v15 = (const void *)*MEMORY[0x1E4F6D740];
      if (*MEMORY[0x1E4F6D740]) {
        CFArrayAppendValue(v7, v15);
      }
    }
  }
  uint64_t v18 = objc_msgSend_balloonBundleID(v3, (const char *)v15, v16, v17);
  int isEqualToString = objc_msgSend_isEqualToString_(v18, v19, *MEMORY[0x1E4F6CBD8], v20);

  if (isEqualToString)
  {
    if (v7)
    {
      uint64_t v22 = (const void *)*MEMORY[0x1E4F6D880];
      if (*MEMORY[0x1E4F6D880]) {
        CFArrayAppendValue(v7, v22);
      }
    }
  }
  uint64_t v25 = objc_msgSend_balloonBundleID(v3, (const char *)v22, v23, v24);
  int v28 = objc_msgSend_isEqualToString_(v25, v26, *MEMORY[0x1E4F6CC10], v27);

  if (v28)
  {
    if (v7)
    {
      BOOL v29 = (const void *)*MEMORY[0x1E4F6DA98];
      if (*MEMORY[0x1E4F6DA98]) {
        CFArrayAppendValue(v7, v29);
      }
    }
  }
  uint64_t v32 = objc_msgSend_balloonBundleID(v3, (const char *)v29, v30, v31);
  int v35 = objc_msgSend_isEqualToString_(v32, v33, *MEMORY[0x1E4F6CBA0], v34);

  if (v35)
  {
    if (v7)
    {
      id v36 = (const void *)*MEMORY[0x1E4F6D820];
      if (*MEMORY[0x1E4F6D820]) {
        CFArrayAppendValue(v7, v36);
      }
    }
  }
  uint64_t v39 = objc_msgSend_expressiveSendStyleID(v3, (const char *)v36, v37, v38);
  if (objc_msgSend_length(v39, v40, v41, v42))
  {
    uint64_t v46 = objc_msgSend_expressiveSendStyleID(v3, v43, v44, v45);
    uint64_t v49 = objc_msgSend_rangeOfString_(v46, v47, *MEMORY[0x1E4F6D480], v48);

    if (v49 != 0x7FFFFFFFFFFFFFFFLL)
    {
      if (v7)
      {
        id v50 = (const void *)*MEMORY[0x1E4F6D858];
        if (*MEMORY[0x1E4F6D858]) {
          CFArrayAppendValue(v7, v50);
        }
      }
    }
  }
  else
  {
  }
  id v53 = objc_msgSend_expressiveSendStyleID(v3, (const char *)v50, v51, v52);
  int v56 = objc_msgSend_isEqualToString_(v53, v54, *MEMORY[0x1E4F6D4E0], v55);

  if (v56)
  {
    if (!v7) {
      goto LABEL_35;
    }
    uint64_t v60 = (const void **)MEMORY[0x1E4F6D8C0];
    goto LABEL_32;
  }
  uint64_t v61 = objc_msgSend_expressiveSendStyleID(v3, v57, v58, v59);
  if (!objc_msgSend_length(v61, v62, v63, v64))
  {

    goto LABEL_35;
  }
  long long v68 = objc_msgSend_expressiveSendStyleID(v3, v65, v66, v67);
  uint64_t v71 = objc_msgSend_rangeOfString_(v68, v69, *MEMORY[0x1E4F6D4D8], v70);

  if (v71 != 0x7FFFFFFFFFFFFFFFLL && v7)
  {
    uint64_t v60 = (const void **)MEMORY[0x1E4F6D788];
LABEL_32:
    if (*v60) {
      CFArrayAppendValue(v7, *v60);
    }
  }
LABEL_35:

  return v7;
}

- (void)_trackUsageForMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend__eventForMessage_(self, a2, (uint64_t)a3, v3);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v17, (uint64_t)v21, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v18;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void *)(*((void *)&v17 + 1) + 8 * v12);
        int v14 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E890], v7, v8, v9);
        objc_msgSend_trackEvent_(v14, v15, v13, v16);

        ++v12;
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v17, (uint64_t)v21, 16);
    }
    while (v10);
  }
}

- (void)_setReplyToGuidOnMessage:(id)a3 forChat:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v10 = objc_msgSend_lastFinishedMessageItem(v6, v7, v8, v9);
  int v14 = objc_msgSend_guid(v10, v11, v12, v13);

  objc_msgSend_setReplyToGUID_(v5, v15, (uint64_t)v14, v16);
  if (IMOSLoggingEnabled())
  {
    long long v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = objc_msgSend_guid(v5, v18, v19, v20);
      int v22 = 138412546;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      uint64_t v25 = v21;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Setting %@ as the reply to guid for %@", (uint8_t *)&v22, 0x16u);
    }
  }
}

- (BOOL)_nicknameSharingEnabled
{
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E820], a2, v2, v3);
  char v8 = objc_msgSend_sharingEnabled(v4, v5, v6, v7);

  return v8;
}

- (unint64_t)_nicknameSharingAudience
{
  id v4 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E820], a2, v2, v3);
  unint64_t v8 = objc_msgSend_sharingAudience(v4, v5, v6, v7);

  return v8;
}

- (void)_setMeCardSharingOnMessage:(id)a3 forChat:(id)a4
{
  *(void *)&v28[5] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  unint64_t v11 = objc_msgSend__nicknameSharingAudience(self, v8, v9, v10);
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v27 = 134217984;
      *(void *)int v28 = v11;
      _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Current me card sharing audience is %lu", (uint8_t *)&v27, 0xCu);
    }
  }
  if (objc_msgSend__nicknameSharingEnabled(self, v12, v13, v14))
  {
    if (v11 > 1) {
      uint64_t shouldShareMeCardForAlwaysAskAudienceWithChat = objc_msgSend__shouldShareMeCardForAlwaysAskAudienceWithChat_(self, v16, (uint64_t)v7, v17);
    }
    else {
      uint64_t shouldShareMeCardForAlwaysAskAudienceWithChat = objc_msgSend__shouldShareMeCardForContactsOnlyAudienceWithChat_(self, v16, (uint64_t)v7, v17);
    }
    uint64_t v19 = shouldShareMeCardForAlwaysAskAudienceWithChat;
  }
  else
  {
    uint64_t v19 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    int v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      uint64_t v26 = objc_msgSend_guid(v6, v23, v24, v25);
      int v27 = 67109378;
      v28[0] = v19;
      LOWORD(v28[1]) = 2112;
      *(void *)((char *)&v28[1] + 2) = v26;
      _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "Setting meCard sharing preference %d on message %@", (uint8_t *)&v27, 0x12u);
    }
  }
  objc_msgSend_setShouldSendMeCard_(v6, v20, v19, v21);
}

- (BOOL)_shouldShareMeCardForContactsOnlyAudienceWithChat:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_msgSend_allParticipantsAreContacts(v3, v4, v5, v6))
  {
    BOOL v10 = 1;
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    unint64_t v11 = objc_msgSend_participants(v3, v7, v8, v9, 0);
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v29, (uint64_t)v33, 16);
    if (v13)
    {
      uint64_t v17 = v13;
      uint64_t v18 = *(void *)v30;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v30 != v18) {
            objc_enumerationMutation(v11);
          }
          uint64_t v20 = *(void **)(*((void *)&v29 + 1) + 8 * i);
          uint64_t v21 = objc_msgSend_sharedInstance(IMNicknameController, v14, v15, v16);
          if (objc_msgSend_handleIsAllowedForSharing_(v21, v22, (uint64_t)v20, v23))
          {
          }
          else
          {
            char isContact = objc_msgSend_isContact(v20, v24, v25, v26);

            if ((isContact & 1) == 0)
            {
              BOOL v10 = 0;
              goto LABEL_15;
            }
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v29, (uint64_t)v33, 16);
        if (v17) {
          continue;
        }
        break;
      }
    }
    BOOL v10 = 1;
LABEL_15:
  }
  return v10;
}

- (BOOL)_shouldShareMeCardForAlwaysAskAudienceWithChat:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v4 = objc_msgSend_participants(a3, a2, (uint64_t)a3, v3, 0);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v19, (uint64_t)v23, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v20;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v20 != v11) {
          objc_enumerationMutation(v4);
        }
        uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_sharedInstance(IMNicknameController, v7, v8, v9);
        LODWORD(v13) = objc_msgSend_handleIsAllowedForSharing_(v14, v15, v13, v16);

        if (!v13)
        {
          BOOL v17 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v19, (uint64_t)v23, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v17 = 1;
LABEL_11:

  return v17;
}

- (void)_chat:(id)a3 sendMessage:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_account(v7, v8, v9, v10);
  id v12 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__chat_sendMessage_withAccount_(self, v11, (uint64_t)v7, (uint64_t)v6, v12);
}

- (void)_chat:(id)a3 sendMessage:(id)a4 withAccount:(id)a5
{
  uint64_t v229 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      id v224 = v8;
      __int16 v225 = 2112;
      id v226 = v9;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_DEBUG, "chat: %@  message: %@", buf, 0x16u);
    }
  }
  uint64_t v15 = objc_msgSend_sharedInstance(IMDaemonController, v11, v12, v13);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v15, v16, 0, v17)) != 0)
  {
    BOOL v21 = 0;
  }
  else
  {
    long long v22 = objc_msgSend_sharedInstance(IMDaemonController, v18, v19, v20);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v22, v23, 0, v24)) != 0)
    {
      BOOL v21 = 0;
    }
    else
    {
      int v28 = objc_msgSend_sharedInstance(IMDaemonController, v25, v26, v27);
      BOOL v21 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v28, v29, 0, v30)) == 0;
    }
  }

  if (v9) {
    char v34 = v21;
  }
  else {
    char v34 = 1;
  }
  if ((v34 & 1) == 0)
  {
    if ((objc_msgSend_supportsSendingTypingIndicators(v8, v31, v32, v33) & 1) == 0
      && objc_msgSend_isTypingMessage(v9, v35, v36, v37))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1A4AF7000, v38, OS_LOG_TYPE_INFO, "Bailing sending message as its a typing message and service does not support typing", buf, 2u);
        }
      }
      goto LABEL_79;
    }
    uint64_t v222 = IMCopyGUIDForChatOnAccount(v8, v10);
    IMComponentsFromChatGUID();
    id v39 = 0;
    if (!v10 || !v39)
    {
LABEL_78:

      goto LABEL_79;
    }
    id v221 = v39;
    uint64_t v43 = objc_msgSend_copy(v9, v40, v41, v42);
    objc_msgSend__updateError_(v43, v44, 0, v45);
    uint64_t v49 = objc_msgSend_loginIMHandle(v10, v46, v47, v48);
    objc_msgSend__updateSender_(v43, v50, (uint64_t)v49, v51);

    uint64_t v55 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v52, v53, v54);
    if (objc_msgSend_isScheduledMessagesCoreEnabled(v55, v56, v57, v58))
    {
      BOOL v62 = objc_msgSend_scheduleType(v43, v59, v60, v61) == 2;

      if (v62)
      {
LABEL_28:
        if (!objc_msgSend_scheduleType(v43, v63, v64, v65)) {
          objc_msgSend__updateTime_(v43, v69, 0, v70);
        }
        objc_msgSend__updateTimeRead_(v43, v69, 0, v70);
        objc_msgSend__updateTimeDelivered_(v43, v71, 0, v72);
        objc_msgSend__updateTimePlayed_(v43, v73, 0, v74);
        long long v78 = objc_msgSend__imMessageItem(v43, v75, v76, v77);
        objc_msgSend__setMeCardSharingOnMessage_forChat_(self, v79, (uint64_t)v78, (uint64_t)v8);
        if (objc_msgSend_isTypingMessage(v78, v80, v81, v82))
        {
          uint64_t v86 = objc_msgSend_customTypingIndicatorIcon(v9, v83, v84, v85);
          objc_msgSend_setTypingIndicatorIcon_(v78, v87, (uint64_t)v86, v88);
        }
        if (!v78) {
          goto LABEL_77;
        }
        objc_msgSend__trackUsageForMessage_(self, v83, (uint64_t)v78, v85);
        int v92 = objc_msgSend_tapback(v78, v89, v90, v91);
        BOOL v93 = v92 == 0;

        if (!v93)
        {
          uint64_t v97 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6EA88], v94, v95, v96);
          objc_msgSend_sendTapbackSendEvent(v97, v98, v99, v100);
        }
        __int16 v219 = objc_msgSend_notificationIDSTokenURI(v9, v94, v95, v96);
        if (IMOSLoggingEnabled())
        {
          long long v104 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v224 = v219;
            _os_log_impl(&dword_1A4AF7000, v104, OS_LOG_TYPE_INFO, "Before Siri passed in following notificationIDSTokenURI %@ so setting it on immessageitem", buf, 0xCu);
          }
        }
        if (objc_msgSend_length(v219, v101, v102, v103, v219))
        {
          if (IMOSLoggingEnabled())
          {
            long long v110 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              id v224 = v220;
              _os_log_impl(&dword_1A4AF7000, v110, OS_LOG_TYPE_INFO, "Siri passed in following notificationIDSTokenURI %@ so setting it on immessageitem", buf, 0xCu);
            }
          }
          objc_msgSend_setNotificationIDSTokenURI_(v78, v108, (uint64_t)v220, v109);
          if (IMOSLoggingEnabled())
          {
            long long v111 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v111, OS_LOG_TYPE_INFO))
            {
              long long v115 = objc_msgSend_notificationIDSTokenURI(v78, v112, v113, v114);
              *(_DWORD *)long long buf = 138412290;
              id v224 = v115;
              _os_log_impl(&dword_1A4AF7000, v111, OS_LOG_TYPE_INFO, "now it is set to %@", buf, 0xCu);
            }
          }
        }
        long long v116 = objc_msgSend_balloonBundleID(v78, v105, v106, v107);
        if (objc_msgSend_isEqualToString_(v116, v117, *MEMORY[0x1E4F6CC10], v118))
        {
          uint64_t v122 = objc_msgSend_fileTransferGUIDs(v78, v119, v120, v121);
          BOOL v126 = objc_msgSend_count(v122, v123, v124, v125) == 0;

          if (v126)
          {
LABEL_52:
            v138 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6C360], v127, v128, v129);
            int isInternalInstall = objc_msgSend_isInternalInstall(v138, v139, v140, v141);

            if (isInternalInstall)
            {
              id v146 = objc_msgSend_expressiveSendStyleID(v78, v143, v144, v145);
              if (v146 || !IMGetCachedDomainBoolForKey())
              {
              }
              else if ((objc_msgSend_isTypingMessage(v78, v147, v148, v149) & 1) == 0)
              {
                if (IMOSLoggingEnabled())
                {
                  uint64_t v152 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v152, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)long long buf = 0;
                    _os_log_impl(&dword_1A4AF7000, v152, OS_LOG_TYPE_INFO, "Forcing laser due to defaults com.apple.MobileSMS AlwaysSendLasers", buf, 2u);
                  }
                }
                objc_msgSend_setExpressiveSendStyleID_(v78, v150, @"com.apple.messages.effect.CKLasersEffect", v151);
              }
            }
            if (objc_msgSend_isAssociatedMessageItem(v78, v143, v144, v145))
            {
              objc_opt_class();
              if (objc_opt_isKindOfClass())
              {
                id v154 = v78;
                uint64_t v158 = objc_msgSend_associatedMessageGUID(v154, v155, v156, v157);
                uint64_t v159 = IMAssociatedMessageDecodeGUID();

                v162 = objc_msgSend_messageItemForGUID_(v8, v160, (uint64_t)v159, v161);
                uint64_t v166 = objc_msgSend_expressiveSendStyleID(v162, v163, v164, v165);
                objc_msgSend_setAssociatedMessageEffect_(v154, v167, (uint64_t)v166, v168);
              }
            }
            objc_msgSend__setReplyToGuidOnMessage_forChat_(self, v153, (uint64_t)v78, (uint64_t)v8);
            if (IMOSLoggingEnabled())
            {
              uint64_t v172 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v172, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long buf = 138412802;
                id v224 = v78;
                __int16 v225 = 2112;
                id v226 = v8;
                __int16 v227 = 2112;
                id v228 = v10;
                _os_log_impl(&dword_1A4AF7000, v172, OS_LOG_TYPE_DEBUG, "Sending message: %@ to %@ account: %@", buf, 0x20u);
              }
            }
            uint64_t v173 = objc_msgSend_sharedInstance(IMDaemonController, v169, v170, v171);
            uint64_t v177 = objc_msgSend_chatStyle(v8, v174, v175, v176);
            uint64_t v181 = objc_msgSend_uniqueID(v10, v178, v179, v180);
            objc_msgSend_sendMessage_toChatID_identifier_style_account_(v173, v182, (uint64_t)v78, (uint64_t)v222, v221, v177, v181);

            if ((objc_msgSend_isTypingMessage(v78, v183, v184, v185) & 1) == 0)
            {
              uint64_t v189 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6EA88], v186, v187, v188);
              objc_msgSend_sendSentMessageEvent(v189, v190, v191, v192);
            }
            if (objc_msgSend_isChatBot(v8, v186, v187, v188)
              && (objc_msgSend_cachedBusinessName(v8, v193, v194, v195),
                  uint64_t v196 = objc_claimAutoreleasedReturnValue(),
                  BOOL v197 = v196 == 0,
                  v196,
                  v197))
            {
              objc_msgSend__asyncSetChatBotUserActivityForChat_message_(self, v193, (uint64_t)v8, (uint64_t)v9);
            }
            else
            {
              objc_msgSend_setUserActivityForChat_message_orHandles_(self, v193, (uint64_t)v8, (uint64_t)v9, 0);
            }
            BOOL v201 = objc_msgSend_service(v78, v198, v199, v200);
            uint64_t v205 = objc_msgSend_iMessageService(IMServiceImpl, v202, v203, v204);
            uint64_t v209 = objc_msgSend_internalName(v205, v206, v207, v208);
            int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v201, v210, (uint64_t)v209, v211);

            if (isEqualToIgnoringCase)
            {
              v216 = objc_msgSend_sharedRegistry(IMChatRegistry, v213, v214, v215);
              objc_msgSend__setChatHasCommunicatedOveriMessage_(v216, v217, (uint64_t)v8, v218);
            }
LABEL_77:

            id v39 = v221;
            goto LABEL_78;
          }
          v130 = objc_msgSend_body(v78, v127, v128, v129);
          long long v116 = objc_msgSend_mutableCopy(v130, v131, v132, v133);

          objc_msgSend_removeCharactersWithAttribute_(v116, v134, *MEMORY[0x1E4F6C188], v135);
          objc_msgSend_setBody_(v78, v136, (uint64_t)v116, v137);
        }

        goto LABEL_52;
      }
    }
    else
    {
    }
    uint64_t v66 = objc_msgSend_flags(v9, v63, v64, v65);
    objc_msgSend__updateFlags_(v43, v67, v66 & 0xFFFFFFFFFFFF4FFFLL, v68);
    goto LABEL_28;
  }
LABEL_79:
}

- (void)_asyncSetChatBotUserActivityForChat:(id)a3 message:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v35[0] = 0;
  v35[1] = v35;
  v35[2] = 0x2020000000;
  char v36 = 0;
  uint64_t v11 = objc_msgSend_businessHandle(v6, v8, v9, v10);
  uint64_t v15 = objc_msgSend_normalizedID(v11, v12, v13, v14);

  uint64_t v19 = objc_msgSend_sharedInstance(IMHandleRegistrar, v16, v17, v18);
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1A4C446C8;
  void v31[3] = &unk_1E5B7EB38;
  char v34 = v35;
  v31[4] = self;
  id v20 = v6;
  id v32 = v20;
  id v21 = v7;
  id v33 = v21;
  id v23 = (id)objc_msgSend_businessNameForUID_updateHandler_(v19, v22, (uint64_t)v15, (uint64_t)v31);

  dispatch_time_t v24 = dispatch_time(0, 3000000000);
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1A4C446F4;
  v27[3] = &unk_1E5B7EB60;
  v27[4] = self;
  id v28 = v20;
  id v29 = v21;
  uint64_t v30 = v35;
  id v25 = v21;
  id v26 = v20;
  dispatch_after(v24, MEMORY[0x1E4F14428], v27);

  _Block_object_dispose(v35, 8);
}

- (void)_chat:(id)a3 sendEditedMessageItem:(id)a4 previousMessageItem:(id)a5 partIndex:(int64_t)a6 editType:(unint64_t)a7 backwardCompatabilityText:(id)a8
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a8;
  uint64_t v19 = objc_msgSend_account(v12, v16, v17, v18);
  id v20 = IMCopyGUIDForChatOnAccount(v12, v19);

  uint64_t v48 = 0;
  IMComponentsFromChatGUID();
  id v21 = 0;
  uint64_t v25 = objc_msgSend_chatStyle(v12, v22, v23, v24);
  id v29 = objc_msgSend_account(v12, v26, v27, v28);
  id v33 = objc_msgSend_uniqueID(v29, v30, v31, v32);

  if (IMOSLoggingEnabled())
  {
    uint64_t v37 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "Asking daemon to send edited message", buf, 2u);
    }
  }
  uint64_t v38 = objc_msgSend_sharedInstance(IMDaemonController, v34, v35, v36);
  objc_msgSend_sendEditedMessage_previousMessage_partIndex_editType_toChatIdentifier_style_account_backwardCompatabilityText_(v38, v39, (uint64_t)v13, (uint64_t)v14, a6, a7, v21, v25, v33, v15);

  if (a7 == 2)
  {
    uint64_t v43 = objc_msgSend_message(v13, v40, v41, v42);
    objc_msgSend_setUserActivityForChat_message_orHandles_(self, v44, (uint64_t)v12, (uint64_t)v43, 0);
  }
}

- (void)_chat:(id)a3 resendEditedMessageItem:(id)a4 partIndex:(int64_t)a5 withBackwardCompatabilityText:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a6;
  id v15 = objc_msgSend_account(v9, v12, v13, v14);
  uint64_t v16 = IMCopyGUIDForChatOnAccount(v9, v15);

  uint64_t v45 = 0;
  IMComponentsFromChatGUID();
  id v17 = 0;
  uint64_t v21 = objc_msgSend_chatStyle(v9, v18, v19, v20);
  uint64_t v25 = objc_msgSend_account(v9, v22, v23, v24);
  id v29 = objc_msgSend_uniqueID(v25, v26, v27, v28);

  id v33 = objc_msgSend_retractedPartIndexes(v10, v30, v31, v32);
  int v36 = objc_msgSend_containsIndex_(v33, v34, a5, v35);

  if (IMOSLoggingEnabled())
  {
    uint64_t v40 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "Asking daemon to resend edited message", buf, 2u);
    }
  }
  if (v36) {
    uint64_t v41 = 2;
  }
  else {
    uint64_t v41 = 1;
  }
  uint64_t v42 = objc_msgSend_sharedInstance(IMDaemonController, v37, v38, v39);
  objc_msgSend_sendEditedMessage_previousMessage_partIndex_editType_toChatIdentifier_style_account_backwardCompatabilityText_(v42, v43, (uint64_t)v10, (uint64_t)v10, a5, v41, v17, v21, v29, v11);
}

- (void)_chat:(id)a3 cancelScheduledMessageWithGUID:(id)a4 destinations:(id)a5 cancelType:(unint64_t)a6
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  uint64_t v14 = objc_msgSend_account(v10, v11, v12, v13);
  id v15 = IMCopyGUIDForChatOnAccount(v10, v14);

  IMComponentsFromChatGUID();
  uint64_t v19 = objc_msgSend_account(v10, v16, v17, v18);
}

- (void)_chat:(id)a3 editScheduledMessageItem:(id)a4 previousMessageItem:(id)a5 partIndex:(int64_t)a6 editType:(unint64_t)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  uint64_t v17 = objc_msgSend_account(v11, v14, v15, v16);
  uint64_t v18 = IMCopyGUIDForChatOnAccount(v11, v17);

  uint64_t v39 = 0;
  IMComponentsFromChatGUID();
  id v19 = 0;
  uint64_t v23 = objc_msgSend_chatStyle(v11, v20, v21, v22);
  uint64_t v27 = objc_msgSend_account(v11, v24, v25, v26);
  uint64_t v31 = objc_msgSend_uniqueID(v27, v28, v29, v30);

  if (IMOSLoggingEnabled())
  {
    uint64_t v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "Asking daemon to send edited scheduled message", buf, 2u);
    }
  }
  int v36 = objc_msgSend_sharedInstance(IMDaemonController, v32, v33, v34);
  objc_msgSend_sendEditedScheduledMessage_previousMessage_partIndex_editType_toChatIdentifier_style_account_(v36, v37, (uint64_t)v12, (uint64_t)v13, a6, a7, v19, v23, v31);
}

- (void)_chat:(id)a3 editScheduledMessageItem:(id)a4 previousMessageItem:(id)a5 retractingPartIndexes:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  uint64_t v16 = objc_msgSend_account(v9, v13, v14, v15);
  uint64_t v17 = IMCopyGUIDForChatOnAccount(v9, v16);

  uint64_t v38 = 0;
  IMComponentsFromChatGUID();
  id v18 = 0;
  uint64_t v22 = objc_msgSend_chatStyle(v9, v19, v20, v21);
  uint64_t v26 = objc_msgSend_account(v9, v23, v24, v25);
  uint64_t v30 = objc_msgSend_uniqueID(v26, v27, v28, v29);

  if (IMOSLoggingEnabled())
  {
    uint64_t v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v37 = 0;
      _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "Asking daemon to send edited scheduled message retracting part indexes", v37, 2u);
    }
  }
  uint64_t v35 = objc_msgSend_sharedInstance(IMDaemonController, v31, v32, v33);
  objc_msgSend_sendEditedScheduledMessage_previousMessage_retractingPartIndexes_toChatIdentifier_style_account_(v35, v36, (uint64_t)v10, (uint64_t)v11, v12, v18, v22, v30);
}

- (void)_chat:(id)a3 repositionSticker:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v10 = objc_msgSend_account(v5, v7, v8, v9);
  id v11 = IMCopyGUIDForChatOnAccount(v5, v10);

  uint64_t v32 = 0;
  IMComponentsFromChatGUID();
  id v12 = 0;
  uint64_t v16 = objc_msgSend_account(v5, v13, v14, v15);
  uint64_t v20 = objc_msgSend_uniqueID(v16, v17, v18, v19);

  if (IMOSLoggingEnabled())
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v31 = 0;
      _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "Asking daemon to send sticker reposition message", v31, 2u);
    }
  }
  uint64_t v25 = objc_msgSend_sharedInstance(IMDaemonController, v21, v22, v23);
  uint64_t v29 = objc_msgSend_chatStyle(v5, v26, v27, v28);
  objc_msgSend_sendRepositionStickerMessage_chatIdentifier_accountID_style_(v25, v30, (uint64_t)v6, (uint64_t)v12, v20, v29);
}

- (void)_chat:(id)a3 sendGroupPhotoUpdate:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v10 = objc_msgSend_account(v6, v7, v8, v9);
  id v11 = IMCopyGUIDForChatOnAccount(v6, v10);

  IMComponentsFromChatGUID();
  id v12 = 0;
  uint64_t v16 = objc_msgSend_sharedInstance(IMDaemonController, v13, v14, v15);
  uint64_t v20 = objc_msgSend_chatStyle(v6, v17, v18, v19);
  uint64_t v24 = objc_msgSend_account(v6, v21, v22, v23);

  uint64_t v28 = objc_msgSend_uniqueID(v24, v25, v26, v27);
  objc_msgSend_sendGroupPhotoUpdate_toChatID_identifier_style_account_(v16, v29, (uint64_t)v5, (uint64_t)v11, v12, v20, v28);
}

- (void)_chat:(id)a3 retryGroupPhotoUpload:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v10 = objc_msgSend_account(v6, v7, v8, v9);
  id v11 = IMCopyGUIDForChatOnAccount(v6, v10);

  IMComponentsFromChatGUID();
  id v12 = 0;
  uint64_t v16 = objc_msgSend_sharedInstance(IMDaemonController, v13, v14, v15);
  uint64_t v20 = objc_msgSend_chatStyle(v6, v17, v18, v19);
  uint64_t v24 = objc_msgSend_account(v6, v21, v22, v23);

  uint64_t v28 = objc_msgSend_uniqueID(v24, v25, v26, v27);
  objc_msgSend_retryGroupPhotoUpload_toChatID_identifier_style_account_(v16, v29, (uint64_t)v5, (uint64_t)v11, v12, v20, v28);
}

- (void)_chat:(id)a3 sendSyndicationAction:(id)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v10 = a4;
  if (!v10)
  {
    uint64_t v31 = IMLogHandleForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB98E8(v31, v43, v44, v45, v46, v47, v48, v49);
    }
    goto LABEL_15;
  }
  id v11 = objc_msgSend_sharedInstance(IMDaemonController, v7, v8, v9);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v11, v12, 0, v13)) != 0) {
    goto LABEL_5;
  }
  uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
  if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v17, v18, 0, v19)) != 0)
  {

LABEL_5:
    goto LABEL_6;
  }
  id v50 = objc_msgSend_sharedInstance(IMDaemonController, v20, v21, v22);
  int v53 = *MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v50, v51, 0, v52);

  if (!v53) {
    goto LABEL_16;
  }
LABEL_6:
  uint64_t v29 = objc_msgSend_account(v6, v23, v24, v25);
  if (v29)
  {
    uint64_t v30 = objc_msgSend_chatIdentifier(v6, v26, v27, v28);

    if (v30)
    {
      id v54 = 0;
      id v55 = 0;
      sub_1A4C416E0(self, v6, &v55, &v54);
      uint64_t v31 = v55;
      id v32 = v54;
      if (IMOSLoggingEnabled())
      {
        int v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          uint64_t v40 = objc_msgSend_count(v31, v37, v38, v39);
          *(_DWORD *)long long buf = 134218498;
          uint64_t v57 = v40;
          __int16 v58 = 2112;
          id v59 = v10;
          __int16 v60 = 2112;
          uint64_t v61 = v31;
          _os_log_impl(&dword_1A4AF7000, v36, OS_LOG_TYPE_INFO, "Found %lu chats to send Syndication Action %@ to. chatIDs: %@", buf, 0x20u);
        }
      }
      uint64_t v41 = objc_msgSend_sharedInstance(IMDaemonController, v33, v34, v35);
      objc_msgSend_sendSyndicationAction_toChatsWithIdentifiers_(v41, v42, (uint64_t)v10, (uint64_t)v31);

LABEL_15:
    }
  }
LABEL_16:
}

- (void)_chat:(id)a3 sendUpdatedCollaborationMetadata:(id)a4 forMessageGUID:(id)a5
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v13 = a5;
  if (!v9)
  {
    uint64_t v34 = IMLogHandleForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB9920(v34, v46, v47, v48, v49, v50, v51, v52);
    }
    goto LABEL_15;
  }
  uint64_t v14 = objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v14, v15, 0, v16)) != 0) {
    goto LABEL_5;
  }
  uint64_t v20 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
  if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v20, v21, 0, v22)) != 0)
  {

LABEL_5:
    goto LABEL_6;
  }
  int v53 = objc_msgSend_sharedInstance(IMDaemonController, v23, v24, v25);
  int v56 = *MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v53, v54, 0, v55);

  if (!v56) {
    goto LABEL_16;
  }
LABEL_6:
  id v32 = objc_msgSend_account(v8, v26, v27, v28);
  if (v32)
  {
    uint64_t v33 = objc_msgSend_chatIdentifier(v8, v29, v30, v31);

    if (v33)
    {
      id v57 = 0;
      id v58 = 0;
      sub_1A4C416E0(self, v8, &v58, &v57);
      uint64_t v34 = v58;
      id v35 = v57;
      if (IMOSLoggingEnabled())
      {
        uint64_t v39 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          uint64_t v43 = objc_msgSend_count(v34, v40, v41, v42);
          *(_DWORD *)long long buf = 134218498;
          uint64_t v60 = v43;
          __int16 v61 = 2112;
          id v62 = v9;
          __int16 v63 = 2112;
          uint64_t v64 = v34;
          _os_log_impl(&dword_1A4AF7000, v39, OS_LOG_TYPE_INFO, "Found %lu chats to send updated collaboration metadata %@ to. chatIDs: %@", buf, 0x20u);
        }
      }
      uint64_t v44 = objc_msgSend_sharedInstance(IMDaemonController, v36, v37, v38);
      objc_msgSend_sendUpdatedCollaborationMetadata_toChatsWithIdentifiers_forMessageGUID_(v44, v45, (uint64_t)v9, (uint64_t)v34, v13);

LABEL_15:
    }
  }
LABEL_16:
}

- (void)_chat:(id)a3 inviteParticipants:(id)a4 reason:(id)a5
{
  uint64_t v77 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412802;
      id v72 = v7;
      __int16 v73 = 2112;
      id v74 = v8;
      __int16 v75 = 2112;
      id v76 = v9;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_DEBUG, "chat: %@  participants: %@  reason: %@", buf, 0x20u);
    }
  }
  uint64_t v14 = objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v14, v15, 0, v16)) == 0)
  {
    uint64_t v20 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v20, v21, 0, v22)) == 0)
    {
      uint64_t v67 = objc_msgSend_sharedInstance(IMDaemonController, v23, v24, v25);
      BOOL v70 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v67, v68, 0, v69)) == 0;

      if (v70) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v29 = objc_msgSend_account(v7, v26, v27, v28);
  uint64_t v33 = objc_msgSend_uniqueID(v29, v30, v31, v32);

  uint64_t v37 = objc_msgSend_chatStyle(v7, v34, v35, v36);
  uint64_t v41 = objc_msgSend_account(v7, v38, v39, v40);
  uint64_t v42 = IMCopyGUIDForChatOnAccount(v7, v41);

  IMComponentsFromChatGUID();
  id v43 = 0;
  uint64_t v47 = v43;
  if (v33 && v43)
  {
    uint64_t v48 = objc_msgSend_account(v7, v44, v45, v46);
    uint64_t v52 = objc_msgSend_loginIMHandle(v48, v49, v50, v51);
    objc_msgSend__updateSender_(v9, v53, (uint64_t)v52, v54);

    id v58 = objc_msgSend__imMessageItem(v9, v55, v56, v57);
    id v62 = objc_msgSend_sharedInstance(IMDaemonController, v59, v60, v61);
    uint64_t v65 = objc_msgSend_arrayByApplyingSelector_(v8, v63, (uint64_t)sel__handleInfo, v64);
    objc_msgSend_invitePersonInfo_withMessage_toChatID_identifier_style_account_(v62, v66, (uint64_t)v65, (uint64_t)v58, v42, v47, v37, v33);
  }
LABEL_13:
}

- (void)_chat:(id)a3 removeParticipants:(id)a4 reason:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412802;
      id v58 = v7;
      __int16 v59 = 2112;
      id v60 = v8;
      __int16 v61 = 2112;
      id v62 = v9;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_DEBUG, "chat: %@  participants: %@  reason: %@", buf, 0x20u);
    }
  }
  uint64_t v14 = objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v14, v15, 0, v16)) == 0)
  {
    uint64_t v20 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v20, v21, 0, v22)) == 0)
    {
      int v53 = objc_msgSend_sharedInstance(IMDaemonController, v23, v24, v25);
      BOOL v56 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v53, v54, 0, v55)) == 0;

      if (v56) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v29 = objc_msgSend_account(v7, v26, v27, v28);
  uint64_t v33 = objc_msgSend_uniqueID(v29, v30, v31, v32);

  uint64_t v37 = objc_msgSend_chatStyle(v7, v34, v35, v36);
  uint64_t v41 = objc_msgSend_account(v7, v38, v39, v40);
  uint64_t v42 = IMCopyGUIDForChatOnAccount(v7, v41);

  IMComponentsFromChatGUID();
  id v43 = 0;
  uint64_t v47 = v43;
  if (v33 && v43)
  {
    uint64_t v48 = objc_msgSend_sharedInstance(IMDaemonController, v44, v45, v46);
    uint64_t v51 = objc_msgSend_arrayByApplyingSelector_(v8, v49, (uint64_t)sel__handleInfo, v50);
    objc_msgSend_removePersonInfo_chatID_identifier_style_account_(v48, v52, (uint64_t)v51, (uint64_t)v42, v47, v37, v33);
  }
LABEL_13:
}

- (void)_chat:(id)a3 joinWithProperties:(id)a4 guid:(id)a5
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v97 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      id v99 = v8;
      __int16 v100 = 2112;
      id v101 = v97;
      __int16 v102 = 2112;
      id v103 = v9;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "chat: %@  joinProperties: %@, guid: %@", buf, 0x20u);
    }
  }
  uint64_t v14 = objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v14, v15, 0, v16)) != 0) {
    goto LABEL_8;
  }
  uint64_t v20 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
  if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v20, v21, 0, v22)) != 0)
  {

LABEL_8:
    goto LABEL_9;
  }
  uint64_t v64 = objc_msgSend_sharedInstance(IMDaemonController, v23, v24, v25);
  BOOL v67 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v64, v65, 0, v66)) == 0;

  if (v67) {
    goto LABEL_35;
  }
LABEL_9:
  IMComponentsFromChatGUID();
  id v26 = 0;
  uint64_t v30 = objc_msgSend_chatGUIDToChatMap(self, v27, v28, v29);
  uint64_t v36 = objc_msgSend_objectForKey_(v30, v31, (uint64_t)v9, v32);
  if (!v36)
  {

LABEL_14:
    objc_msgSend__registerChat_isIncoming_guid_(self, v41, (uint64_t)v8, 0, v9);
    unsigned int v96 = objc_msgSend_chatStyle(v8, v42, v43, v44);
    uint64_t v48 = objc_msgSend_account(v8, v45, v46, v47);
    if (v48) {
      BOOL v49 = v26 == 0;
    }
    else {
      BOOL v49 = 1;
    }
    int v50 = !v49;

    if (!v50) {
      goto LABEL_34;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v54 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        id v58 = objc_msgSend_account(v8, v55, v56, v57);
        *(_DWORD *)long long buf = 138412546;
        id v99 = v8;
        __int16 v100 = 2112;
        id v101 = v58;
        _os_log_impl(&dword_1A4AF7000, v54, OS_LOG_TYPE_INFO, "Forwarding join chat for: %@   to account: %@", buf, 0x16u);
      }
    }
    if (v96 == 45)
    {
      __int16 v59 = objc_msgSend_recipient(v8, v51, v52, v53);
      uint64_t v63 = objc_msgSend__handleInfo(v59, v60, v61, v62);
      uint64_t v30 = IMSingleObjectArray();
    }
    else
    {
      __int16 v59 = objc_msgSend_participantsWithState_(v8, v51, 21, v53);
      uint64_t v30 = objc_msgSend_arrayByApplyingSelector_(v59, v68, (uint64_t)sel__handleInfo, v69);
    }

    uint64_t v36 = objc_msgSend_groupID(v8, v70, v71, v72);
    if (!v36)
    {
      uint64_t v36 = objc_msgSend_stringGUID(NSString, v73, v74, v75);
      objc_msgSend_setGroupID_(v8, v76, (uint64_t)v36, v77);
    }
    long long v78 = objc_msgSend_sharedInstance(IMDaemonController, v73, v74, v75);
    uint64_t v82 = objc_msgSend_lastAddressedHandleID(v8, v79, v80, v81);
    uint64_t v86 = objc_msgSend_lastAddressedSIMID(v8, v83, v84, v85);
    uint64_t v90 = objc_msgSend_account(v8, v87, v88, v89);
    __int16 v94 = objc_msgSend_uniqueID(v90, v91, v92, v93);
    objc_msgSend_joinChatID_handleInfo_identifier_style_groupID_lastAddressedHandle_lastAddressedSIMID_joinProperties_account_(v78, v95, (uint64_t)v9, (uint64_t)v30, v26, v96, v36, v82, v86, v97, v94);

    goto LABEL_33;
  }
  if (objc_msgSend_joinState(v8, v33, v34, v35) != 3)
  {
    BOOL v40 = objc_msgSend_joinState(v8, v37, v38, v39) == 4;

    if (v40) {
      goto LABEL_34;
    }
    goto LABEL_14;
  }
LABEL_33:

LABEL_34:
LABEL_35:
}

- (void)_chat:(id)a3 joinWithProperties:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v11 = objc_msgSend_account(v7, v8, v9, v10);
  IMCopyGUIDForChatOnAccount(v7, v11);
  id v13 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend__chat_joinWithProperties_guid_(self, v12, (uint64_t)v7, (uint64_t)v6, v13);
}

- (void)_chat_leave:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v66 = v3;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_DEBUG, "chat: %@", buf, 0xCu);
    }
  }
  id v8 = objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v8, v9, 0, v10)) == 0)
  {
    uint64_t v14 = objc_msgSend_sharedInstance(IMDaemonController, v11, v12, v13);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v14, v15, 0, v16)) == 0)
    {
      uint64_t v61 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
      BOOL v64 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v61, v62, 0, v63)) == 0;

      if (v64) {
        goto LABEL_32;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v26 = objc_msgSend_chatStyle(v3, v20, v21, v22);
  if (v26 == 45)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v66 = v3;
        _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "Not allowed to leave 1:1 chat: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v28 = objc_msgSend_account(v3, v23, v24, v25);
    uint64_t v29 = IMCopyGUIDForChatOnAccount(v3, v28);

    IMComponentsFromChatGUID();
    id v33 = 0;
    if (v33)
    {
      uint64_t v34 = objc_msgSend_account(v3, v30, v31, v32);

      if (v34)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v38 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            uint64_t v42 = objc_msgSend_account(v3, v39, v40, v41);
            *(_DWORD *)long long buf = 138412546;
            id v66 = v3;
            __int16 v67 = 2112;
            uint64_t v68 = v42;
            _os_log_impl(&dword_1A4AF7000, v38, OS_LOG_TYPE_INFO, "Forwarding leave chat for: %@   to account: %@", buf, 0x16u);
          }
        }
        uint64_t v43 = objc_msgSend_sharedInstance(IMDaemonController, v35, v36, v37);
        uint64_t v47 = objc_msgSend_account(v3, v44, v45, v46);
        uint64_t v51 = objc_msgSend_uniqueID(v47, v48, v49, v50);
        objc_msgSend_leaveChatID_style_account_(v43, v52, (uint64_t)v33, v26, v51);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v55 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
      {
        __int16 v59 = objc_msgSend_guid(v3, v56, v57, v58);
        *(_DWORD *)long long buf = 138412290;
        id v66 = v59;
        _os_log_impl(&dword_1A4AF7000, v55, OS_LOG_TYPE_INFO, "Unjoining chat locally: %@", buf, 0xCu);
      }
    }
    if (v3) {
      objc_msgSend__setJoinState_(v3, v53, 0, v54);
    }
    if (IMOSLoggingEnabled())
    {
      id v60 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A4AF7000, v60, OS_LOG_TYPE_INFO, "Done", buf, 2u);
      }
    }
  }
LABEL_32:
}

- (void)_chat_remove:(id)a3
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v65 = (uint64_t)v58;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_DEBUG, "chat: %@", buf, 0xCu);
    }
  }
  id v8 = objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v8, v9, 0, v10)) == 0)
  {
    uint64_t v14 = objc_msgSend_sharedInstance(IMDaemonController, v11, v12, v13);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v14, v15, 0, v16)) == 0)
    {
      uint64_t v54 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
      BOOL v57 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v54, v55, 0, v56)) == 0;

      if (v57) {
        goto LABEL_27;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v22 = objc_msgSend_allGUIDsForChat_(self, v20, (uint64_t)v58, v21);
  if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v65 = (uint64_t)v22;
      _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Removing chat from the agent too: %@", buf, 0xCu);
    }
  }
  long long v61 = 0u;
  long long v62 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v24 = v22;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v25, (uint64_t)&v59, (uint64_t)v63, 16);
  if (v26)
  {
    uint64_t v27 = *(void *)v60;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v60 != v27) {
          objc_enumerationMutation(v24);
        }
        uint64_t v29 = *(void *)(*((void *)&v59 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          id v33 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v65 = v29;
            _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "   Found guid to remove: %@", buf, 0xCu);
          }
        }
        uint64_t v34 = objc_msgSend_sharedInstance(IMDaemonController, v30, v31, v32);
        objc_msgSend_removeChat_(v34, v35, v29, v36);

        objc_msgSend__unregisterChatWithGUID_(self, v37, v29, v38);
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v24, v39, (uint64_t)&v59, (uint64_t)v63, 16);
    }
    while (v26);
  }

  uint64_t v43 = objc_msgSend_personCentricID(v58, v40, v41, v42);

  if (v43)
  {
    uint64_t v47 = objc_msgSend_chatPersonIDToChatMap(self, v44, v45, v46);
    uint64_t v51 = objc_msgSend_personCentricID(v58, v48, v49, v50);
    objc_msgSend_removeObjectForKey_(v47, v52, (uint64_t)v51, v53);
  }
LABEL_27:
}

- (void)_chat_declineInvitation:(id)a3
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v59 = v3;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_DEBUG, "chat: %@", buf, 0xCu);
    }
  }
  id v8 = objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v8, v9, 0, v10)) == 0)
  {
    uint64_t v14 = objc_msgSend_sharedInstance(IMDaemonController, v11, v12, v13);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v14, v15, 0, v16)) == 0)
    {
      uint64_t v54 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
      BOOL v57 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v54, v55, 0, v56)) == 0;

      if (v57) {
        goto LABEL_22;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v23 = objc_msgSend_chatStyle(v3, v20, v21, v22);
  uint64_t v27 = objc_msgSend_account(v3, v24, v25, v26);
  uint64_t v28 = IMCopyGUIDForChatOnAccount(v3, v27);

  IMComponentsFromChatGUID();
  id v29 = 0;
  id v33 = objc_msgSend_account(v3, v30, v31, v32);
  if (v33) {
    BOOL v34 = v29 == 0;
  }
  else {
    BOOL v34 = 1;
  }
  int v35 = !v34;

  if (v35)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        uint64_t v43 = objc_msgSend_account(v3, v40, v41, v42);
        *(_DWORD *)long long buf = 138412546;
        id v59 = v3;
        __int16 v60 = 2112;
        long long v61 = v43;
        _os_log_impl(&dword_1A4AF7000, v39, OS_LOG_TYPE_INFO, "Forwarding decline chat for: %@   to account: %@", buf, 0x16u);
      }
    }
    uint64_t v44 = objc_msgSend_sharedInstance(IMDaemonController, v36, v37, v38);
    uint64_t v48 = objc_msgSend_account(v3, v45, v46, v47);
    uint64_t v52 = objc_msgSend_uniqueID(v48, v49, v50, v51);
    objc_msgSend_declineInvitationToChatID_identifier_style_account_(v44, v53, (uint64_t)v28, (uint64_t)v29, v23, v52);
  }
LABEL_22:
}

- (void)_chat:(id)a3 setProperties:(id)a4 ofParticipant:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412802;
      id v70 = v8;
      __int16 v71 = 2112;
      id v72 = v9;
      __int16 v73 = 2112;
      id v74 = v10;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_DEBUG, "chat: %@  properties: %@  participant: %@", buf, 0x20u);
    }
  }
  uint64_t v15 = objc_msgSend_sharedInstance(IMDaemonController, v11, v12, v13);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v15, v16, 0, v17)) == 0)
  {
    uint64_t v21 = objc_msgSend_sharedInstance(IMDaemonController, v18, v19, v20);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v21, v22, 0, v23)) == 0)
    {
      uint64_t v65 = objc_msgSend_sharedInstance(IMDaemonController, v24, v25, v26);
      BOOL v68 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v65, v66, 0, v67)) == 0;

      if (v68) {
        goto LABEL_20;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v30 = objc_msgSend_account(v8, v27, v28, v29);
  uint64_t v31 = IMCopyGUIDForChatOnAccount(v8, v30);

  buf[0] = 0;
  IMComponentsFromChatGUID();
  id v32 = 0;
  uint64_t v36 = objc_msgSend_chatGUIDToChatMap(self, v33, v34, v35);
  uint64_t v39 = objc_msgSend_objectForKey_(v36, v37, (uint64_t)v31, v38);
  BOOL v40 = v39 == 0;

  if (v40) {
    objc_msgSend__registerChat_isIncoming_guid_(self, v41, (uint64_t)v8, 0, v31);
  }
  uint64_t v44 = objc_msgSend_account(v8, v41, v42, v43);
  if (v44) {
    BOOL v45 = v32 == 0;
  }
  else {
    BOOL v45 = 1;
  }
  int v46 = !v45;

  if (v46)
  {
    uint64_t v50 = objc_msgSend_sharedInstance(IMDaemonController, v47, v48, v49);
    uint64_t v54 = objc_msgSend_ID(v10, v51, v52, v53);
    uint64_t v55 = buf[0];
    id v59 = objc_msgSend_account(v8, v56, v57, v58);
    uint64_t v63 = objc_msgSend_uniqueID(v59, v60, v61, v62);
    objc_msgSend_setProperties_ofParticipant_inChatID_identifier_style_account_(v50, v64, (uint64_t)v9, (uint64_t)v54, v31, v32, v55, v63);
  }
LABEL_20:
}

- (void)_chat:(id)a3 setValue:(id)a4 forChatProperty:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v61 = a4;
  id v63 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412802;
      id v70 = v8;
      __int16 v71 = 2112;
      id v72 = v63;
      __int16 v73 = 2112;
      id v74 = v61;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_DEBUG, "chat: %@  property: %@  value: %@", buf, 0x20u);
    }
  }
  uint64_t v13 = objc_msgSend_sharedInstance(IMDaemonController, v9, v10, v11, v61);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v13, v14, 0, v15)) == 0)
  {
    uint64_t v19 = objc_msgSend_sharedInstance(IMDaemonController, v16, v17, v18);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v19, v20, 0, v21)) == 0)
    {
      uint64_t v57 = objc_msgSend_sharedInstance(IMDaemonController, v22, v23, v24);
      BOOL v60 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v57, v58, 0, v59)) == 0;

      if (v60) {
        goto LABEL_24;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v28 = objc_msgSend_account(v8, v25, v26, v27);
  uint64_t v29 = IMCopyGUIDForChatOnAccount(v8, v28);

  id v33 = objc_msgSend_chatGUIDToChatMap(self, v30, v31, v32);
  uint64_t v36 = objc_msgSend_objectForKey_(v33, v34, (uint64_t)v29, v35);
  BOOL v37 = v36 == 0;

  if (v37) {
    objc_msgSend__registerChat_isIncoming_guid_(self, v38, (uint64_t)v8, 0, v29);
  }
  if (v63)
  {
    BOOL v40 = (void *)MEMORY[0x1E4F1C9E8];
    if (v62)
    {
      uint64_t v43 = objc_msgSend_dictionaryWithObject_forKey_(MEMORY[0x1E4F1C9E8], v38, (uint64_t)v62, (uint64_t)v63);
    }
    else
    {
      uint64_t v44 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v38, 0, v39);
      uint64_t v43 = objc_msgSend_dictionaryWithObject_forKey_(v40, v45, (uint64_t)v44, (uint64_t)v63);
    }
    int v46 = objc_msgSend_allGUIDsForChat_(self, v41, (uint64_t)v8, v42);
    long long v66 = 0u;
    long long v67 = 0u;
    long long v64 = 0u;
    long long v65 = 0u;
    uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v64, (uint64_t)v68, 16);
    if (v51)
    {
      uint64_t v52 = *(void *)v65;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v65 != v52) {
            objc_enumerationMutation(v46);
          }
          uint64_t v54 = *(void *)(*((void *)&v64 + 1) + 8 * i);
          uint64_t v55 = objc_msgSend_sharedInstance(IMDaemonController, v48, v49, v50);
          objc_msgSend_chat_updateProperties_(v55, v56, v54, (uint64_t)v43);
        }
        uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v48, (uint64_t)&v64, (uint64_t)v68, 16);
      }
      while (v51);
    }
  }
LABEL_24:
}

- (void)_chat:(id)a3 updateDisplayName:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v63 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      id v70 = v6;
      __int16 v71 = 2112;
      id v72 = v63;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_DEBUG, "chat: %@  update display name: %@", buf, 0x16u);
    }
  }
  uint64_t v11 = objc_msgSend_sharedInstance(IMDaemonController, v7, v8, v9);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v11, v12, 0, v13)) == 0)
  {
    uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v17, v18, 0, v19)) == 0)
    {
      uint64_t v58 = objc_msgSend_sharedInstance(IMDaemonController, v20, v21, v22);
      BOOL v61 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v58, v59, 0, v60)) == 0;

      if (v61) {
        goto LABEL_22;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v26 = objc_msgSend_account(v6, v23, v24, v25);
  uint64_t v62 = IMCopyGUIDForChatOnAccount(v6, v26);

  uint64_t v30 = objc_msgSend_chatGUIDToChatMap(self, v27, v28, v29);
  id v33 = objc_msgSend_objectForKey_(v30, v31, (uint64_t)v62, v32);
  BOOL v34 = v33 == 0;

  if (v34) {
    objc_msgSend__registerChat_isIncoming_guid_(self, v35, (uint64_t)v6, 0, v62);
  }
  BOOL v37 = objc_msgSend_allGUIDsForChat_(self, v35, (uint64_t)v6, v36);
  uint64_t v41 = objc_msgSend_stringGUID(NSString, v38, v39, v40);
  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v42 = v37;
  uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v64, (uint64_t)v68, 16);
  if (v47)
  {
    uint64_t v48 = *(void *)v65;
    uint64_t v49 = (uint64_t *)MEMORY[0x1E4F6E1B0];
    do
    {
      uint64_t v50 = 0;
      do
      {
        if (*(void *)v65 != v48) {
          objc_enumerationMutation(v42);
        }
        uint64_t v51 = *(void *)(*((void *)&v64 + 1) + 8 * v50);
        if (!objc_msgSend_shouldIgnoreiMessageSiblingGroupIdentityUpdates(v6, v44, v45, v46)
          || (IMComponentsFromChatGUID(),
              id v52 = 0,
              char isEqualToString = objc_msgSend_isEqualToString_(v52, v53, *v49, v54),
              v52,
              (isEqualToString & 1) == 0))
        {
          uint64_t v56 = objc_msgSend_sharedInstance(IMDaemonController, v44, v45, v46);
          objc_msgSend_chat_updateDisplayName_messageID_(v56, v57, v51, (uint64_t)v63, v41);
        }
        ++v50;
      }
      while (v47 != v50);
      uint64_t v47 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v44, (uint64_t)&v64, (uint64_t)v68, 16);
    }
    while (v47);
  }

LABEL_22:
}

- (void)_chat:(id)a3 updateLastAddressedHandle:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      id v60 = v6;
      __int16 v61 = 2112;
      id v62 = v7;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_DEBUG, "chat: %@  update last address handle: %@", buf, 0x16u);
    }
  }
  uint64_t v12 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v12, v13, 0, v14)) == 0)
  {
    uint64_t v18 = objc_msgSend_sharedInstance(IMDaemonController, v15, v16, v17);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v18, v19, 0, v20)) == 0)
    {
      uint64_t v50 = objc_msgSend_sharedInstance(IMDaemonController, v21, v22, v23);
      BOOL v53 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v50, v51, 0, v52)) == 0;

      if (v53) {
        goto LABEL_19;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v27 = objc_msgSend_account(v6, v24, v25, v26);
  uint64_t v28 = IMCopyGUIDForChatOnAccount(v6, v27);

  uint64_t v32 = objc_msgSend_chatGUIDToChatMap(self, v29, v30, v31);
  uint64_t v35 = objc_msgSend_objectForKey_(v32, v33, (uint64_t)v28, v34);
  BOOL v36 = v35 == 0;

  if (v36) {
    objc_msgSend__registerChat_isIncoming_guid_(self, v37, (uint64_t)v6, 0, v28);
  }
  uint64_t v39 = objc_msgSend_allGUIDsForChat_(self, v37, (uint64_t)v6, v38);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v54, (uint64_t)v58, 16);
  if (v44)
  {
    uint64_t v45 = *(void *)v55;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v55 != v45) {
          objc_enumerationMutation(v39);
        }
        uint64_t v47 = *(void *)(*((void *)&v54 + 1) + 8 * v46);
        uint64_t v48 = objc_msgSend_sharedInstance(IMDaemonController, v41, v42, v43);
        objc_msgSend_chat_updateLastAddressHandle_(v48, v49, v47, (uint64_t)v7);

        ++v46;
      }
      while (v44 != v46);
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v41, (uint64_t)&v54, (uint64_t)v58, 16);
    }
    while (v44);
  }

LABEL_19:
}

- (void)_chat:(id)a3 updateLastAddressedSIMID:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      id v60 = v6;
      __int16 v61 = 2112;
      id v62 = v7;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_DEBUG, "chat: %@  update last address uniqueID: %@", buf, 0x16u);
    }
  }
  uint64_t v12 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v12, v13, 0, v14)) == 0)
  {
    uint64_t v18 = objc_msgSend_sharedInstance(IMDaemonController, v15, v16, v17);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v18, v19, 0, v20)) == 0)
    {
      uint64_t v50 = objc_msgSend_sharedInstance(IMDaemonController, v21, v22, v23);
      BOOL v53 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v50, v51, 0, v52)) == 0;

      if (v53) {
        goto LABEL_19;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v27 = objc_msgSend_account(v6, v24, v25, v26);
  uint64_t v28 = IMCopyGUIDForChatOnAccount(v6, v27);

  uint64_t v32 = objc_msgSend_chatGUIDToChatMap(self, v29, v30, v31);
  uint64_t v35 = objc_msgSend_objectForKey_(v32, v33, (uint64_t)v28, v34);
  BOOL v36 = v35 == 0;

  if (v36) {
    objc_msgSend__registerChat_isIncoming_guid_(self, v37, (uint64_t)v6, 0, v28);
  }
  uint64_t v39 = objc_msgSend_allGUIDsForChat_(self, v37, (uint64_t)v6, v38);
  long long v56 = 0u;
  long long v57 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v40, (uint64_t)&v54, (uint64_t)v58, 16);
  if (v44)
  {
    uint64_t v45 = *(void *)v55;
    do
    {
      uint64_t v46 = 0;
      do
      {
        if (*(void *)v55 != v45) {
          objc_enumerationMutation(v39);
        }
        uint64_t v47 = *(void *)(*((void *)&v54 + 1) + 8 * v46);
        uint64_t v48 = objc_msgSend_sharedInstance(IMDaemonController, v41, v42, v43);
        objc_msgSend_chat_updateLastAddressedSIMID_(v48, v49, v47, (uint64_t)v7);

        ++v46;
      }
      while (v44 != v46);
      uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v39, v41, (uint64_t)&v54, (uint64_t)v58, 16);
    }
    while (v44);
  }

LABEL_19:
}

- (void)_chat:(id)a3 updateIsFiltered:(int64_t)a4
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v59 = v6;
      __int16 v60 = 1024;
      int v61 = a4;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "chat: %@  update is filtered: %d", buf, 0x12u);
    }
  }
  uint64_t v11 = objc_msgSend_sharedInstance(IMDaemonController, v7, v8, v9);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v11, v12, 0, v13)) == 0)
  {
    uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v17, v18, 0, v19)) == 0)
    {
      uint64_t v49 = objc_msgSend_sharedInstance(IMDaemonController, v20, v21, v22);
      BOOL v52 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v49, v50, 0, v51)) == 0;

      if (v52) {
        goto LABEL_19;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v26 = objc_msgSend_account(v6, v23, v24, v25);
  uint64_t v27 = IMCopyGUIDForChatOnAccount(v6, v26);

  uint64_t v31 = objc_msgSend_chatGUIDToChatMap(self, v28, v29, v30);
  uint64_t v34 = objc_msgSend_objectForKey_(v31, v32, (uint64_t)v27, v33);
  BOOL v35 = v34 == 0;

  if (v35) {
    objc_msgSend__registerChat_isIncoming_guid_(self, v36, (uint64_t)v6, 0, v27);
  }
  uint64_t v38 = objc_msgSend_allGUIDsForChat_(self, v36, (uint64_t)v6, v37);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v53, (uint64_t)v57, 16);
  if (v43)
  {
    uint64_t v44 = *(void *)v54;
    do
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v54 != v44) {
          objc_enumerationMutation(v38);
        }
        uint64_t v46 = *(void *)(*((void *)&v53 + 1) + 8 * v45);
        uint64_t v47 = objc_msgSend_sharedInstance(IMDaemonController, v40, v41, v42);
        objc_msgSend_chat_updateIsFiltered_(v47, v48, v46, a4);

        ++v45;
      }
      while (v43 != v45);
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v40, (uint64_t)&v53, (uint64_t)v57, 16);
    }
    while (v43);
  }

LABEL_19:
}

- (void)_chat:(id)a3 updateIsBlackholed:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v61 = v6;
      __int16 v62 = 1024;
      BOOL v63 = v4;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "chat: %@  update is blackholed: %d", buf, 0x12u);
    }
  }
  uint64_t v11 = objc_msgSend_sharedInstance(IMDaemonController, v7, v8, v9);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v11, v12, 0, v13)) == 0)
  {
    uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v17, v18, 0, v19)) == 0)
    {
      uint64_t v51 = objc_msgSend_sharedInstance(IMDaemonController, v20, v21, v22);
      BOOL v54 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v51, v52, 0, v53)) == 0;

      if (v54) {
        goto LABEL_21;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  if (!v4) {
    objc_msgSend_setValue_forChatProperty_(v6, v23, MEMORY[0x1E4F1CC38], @"restoredFromBlackhole");
  }
  uint64_t v26 = objc_msgSend_account(v6, v23, v24, v25);
  uint64_t v27 = IMCopyGUIDForChatOnAccount(v6, v26);

  uint64_t v30 = objc_msgSend_allGUIDsForChat_(self, v28, (uint64_t)v6, v29);
  uint64_t v34 = objc_msgSend_chatGUIDToChatMap(self, v31, v32, v33);
  uint64_t v37 = objc_msgSend_objectForKey_(v34, v35, (uint64_t)v27, v36);

  if (v37) {
    objc_msgSend__unregisterChat_(self, v38, (uint64_t)v6, v39);
  }
  long long v57 = 0u;
  long long v58 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id v40 = v30;
  uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v55, (uint64_t)v59, 16);
  if (v45)
  {
    uint64_t v46 = *(void *)v56;
    do
    {
      uint64_t v47 = 0;
      do
      {
        if (*(void *)v56 != v46) {
          objc_enumerationMutation(v40);
        }
        uint64_t v48 = *(void *)(*((void *)&v55 + 1) + 8 * v47);
        uint64_t v49 = objc_msgSend_sharedInstance(IMDaemonController, v42, v43, v44, (void)v55);
        objc_msgSend_chat_updateIsBlackholed_(v49, v50, v48, v4);

        ++v47;
      }
      while (v45 != v47);
      uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v42, (uint64_t)&v55, (uint64_t)v59, 16);
    }
    while (v45);
  }

LABEL_21:
}

- (void)_chat:(id)a3 updateIsRecovered:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109378;
      BOOL v59 = v4;
      __int16 v60 = 2112;
      id v61 = v6;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Update is recovered: %d for chat: %@", buf, 0x12u);
    }
  }
  uint64_t v11 = objc_msgSend_sharedInstance(IMDaemonController, v7, v8, v9);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v11, v12, 0, v13)) == 0)
  {
    uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v17, v18, 0, v19)) == 0)
    {
      uint64_t v49 = objc_msgSend_sharedInstance(IMDaemonController, v20, v21, v22);
      BOOL v52 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v49, v50, 0, v51)) == 0;

      if (v52) {
        goto LABEL_19;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v26 = objc_msgSend_account(v6, v23, v24, v25);
  uint64_t v27 = IMCopyGUIDForChatOnAccount(v6, v26);

  uint64_t v31 = objc_msgSend_chatGUIDToChatMap(self, v28, v29, v30);
  uint64_t v34 = objc_msgSend_objectForKey_(v31, v32, (uint64_t)v27, v33);
  BOOL v35 = v34 == 0;

  if (v35) {
    objc_msgSend__registerChat_isIncoming_guid_(self, v36, (uint64_t)v6, 0, v27);
  }
  uint64_t v38 = objc_msgSend_allGUIDsForChat_(self, v36, (uint64_t)v6, v37);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v53, (uint64_t)v57, 16);
  if (v43)
  {
    uint64_t v44 = *(void *)v54;
    do
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v54 != v44) {
          objc_enumerationMutation(v38);
        }
        uint64_t v46 = *(void *)(*((void *)&v53 + 1) + 8 * v45);
        uint64_t v47 = objc_msgSend_sharedInstance(IMDaemonController, v40, v41, v42);
        objc_msgSend_chat_updateIsRecovered_(v47, v48, v46, v4);

        ++v45;
      }
      while (v43 != v45);
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v40, (uint64_t)&v53, (uint64_t)v57, 16);
    }
    while (v43);
  }

LABEL_19:
}

- (void)_chat:(id)a3 updateIsDeletingIncomingMessages:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 67109378;
      BOOL v59 = v4;
      __int16 v60 = 2112;
      id v61 = v6;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Update isDeletingIncomingMessages: %d for chat: %@", buf, 0x12u);
    }
  }
  uint64_t v11 = objc_msgSend_sharedInstance(IMDaemonController, v7, v8, v9);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v11, v12, 0, v13)) == 0)
  {
    uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v17, v18, 0, v19)) == 0)
    {
      uint64_t v49 = objc_msgSend_sharedInstance(IMDaemonController, v20, v21, v22);
      BOOL v52 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v49, v50, 0, v51)) == 0;

      if (v52) {
        goto LABEL_19;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  uint64_t v26 = objc_msgSend_account(v6, v23, v24, v25);
  uint64_t v27 = IMCopyGUIDForChatOnAccount(v6, v26);

  uint64_t v31 = objc_msgSend_chatGUIDToChatMap(self, v28, v29, v30);
  uint64_t v34 = objc_msgSend_objectForKey_(v31, v32, (uint64_t)v27, v33);
  BOOL v35 = v34 == 0;

  if (v35) {
    objc_msgSend__registerChat_isIncoming_guid_(self, v36, (uint64_t)v6, 0, v27);
  }
  uint64_t v38 = objc_msgSend_allGUIDsForChat_(self, v36, (uint64_t)v6, v37);
  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v39, (uint64_t)&v53, (uint64_t)v57, 16);
  if (v43)
  {
    uint64_t v44 = *(void *)v54;
    do
    {
      uint64_t v45 = 0;
      do
      {
        if (*(void *)v54 != v44) {
          objc_enumerationMutation(v38);
        }
        uint64_t v46 = *(void *)(*((void *)&v53 + 1) + 8 * v45);
        uint64_t v47 = objc_msgSend_sharedInstance(IMDaemonController, v40, v41, v42);
        objc_msgSend_chat_updateIsDeletingIncomingMessages_(v47, v48, v46, v4);

        ++v45;
      }
      while (v43 != v45);
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v38, v40, (uint64_t)&v53, (uint64_t)v57, 16);
    }
    while (v43);
  }

LABEL_19:
}

- (void)_chat_fetchIncomingPendingMessagesOverSatellite:(id)a3
{
  id v15 = 0;
  id v16 = 0;
  sub_1A4C416E0(self, a3, &v16, &v15);
  id v4 = v16;
  id v5 = v15;
  uint64_t v9 = objc_msgSend_daemonController(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_remoteDaemon(v9, v10, v11, v12);
  objc_msgSend_fetchIncomingPendingMessagesOverSatelliteForChatsWithIDs_services_(v13, v14, (uint64_t)v4, (uint64_t)v5);
}

- (void)_loadSiblingsForChatIfNeeded:(id)a3
{
  v16[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_chatStyle(v4, v5, v6, v7) == 45
    && (objc_msgSend_hasQueriedForSiblingChats(v4, v8, v9, v10) & 1) == 0)
  {
    v16[0] = v4;
    uint64_t v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v16, 1);
    objc_msgSend__loadAllSiblingChatsForHandlesAssociatedWithChats_waitForReply_completionHandler_(self, v13, (uint64_t)v12, 1, 0);

    objc_msgSend_setHasQueriedForSiblingChats_(v4, v14, 1, v15);
  }
}

- (void)_chat_loadHistory:(id)a3 limit:(unint64_t)a4 beforeGUID:(id)a5 afterGUID:(id)a6 threadIdentifier:(id)a7 queryID:(id)a8 synchronous:(BOOL)a9 completion:(id)a10
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  id v85 = a6;
  id v82 = a7;
  id v86 = a8;
  id v83 = a10;
  if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138413314;
      id v101 = v15;
      __int16 v102 = 1024;
      int v103 = a4;
      __int16 v104 = 2112;
      id v105 = v16;
      __int16 v106 = 2112;
      id v107 = v85;
      __int16 v108 = 2112;
      id v109 = v86;
      _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_DEBUG, "chat: %@ limit: %d beforeGUID: %@ afterGUID: %@ queryID: %@", buf, 0x30u);
    }
  }
  uint64_t v21 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v21, v22, 0, v23)) == 0)
  {
    uint64_t v27 = objc_msgSend_sharedInstance(IMDaemonController, v24, v25, v26);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v27, v28, 0, v29)) == 0)
    {
      id v76 = objc_msgSend_sharedInstance(IMDaemonController, v30, v31, v32);
      BOOL v79 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v76, v77, 0, v78)) == 0;

      if (v79) {
        goto LABEL_20;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  objc_msgSend__loadSiblingsForChatIfNeeded_(self, v33, (uint64_t)v15, v34);
  id v98 = 0;
  id v99 = 0;
  sub_1A4C416E0(self, v15, &v99, &v98);
  id v80 = v99;
  id v35 = v98;
  uint64_t v39 = objc_msgSend_daemonController(self, v36, v37, v38);
  uint64_t v43 = v39;
  if (a9) {
    objc_msgSend_synchronousRemoteDaemon(v39, v40, v41, v42);
  }
  else {
  uint64_t v81 = objc_msgSend_remoteDaemon(v39, v40, v41, v42);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A4C48E90;
  aBlock[3] = &unk_1E5B7EB88;
  aBlock[4] = self;
  id v94 = v86;
  id v44 = v15;
  id v95 = v44;
  id v45 = v35;
  id v96 = v45;
  unint64_t v97 = a4;
  uint64_t v46 = _Block_copy(aBlock);
  uint64_t v47 = IMLogHandleForCategory();
  os_signpost_id_t v48 = os_signpost_id_generate(v47);
  uint64_t v49 = v47;
  uint64_t v50 = v49;
  if (v48 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v49))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4AF7000, v50, OS_SIGNPOST_INTERVAL_BEGIN, v48, "loadHistoryForChatWithGUID", "", buf, 2u);
  }

  long long v54 = objc_msgSend_guid(v44, v51, v52, v53);
  uint64_t v58 = objc_msgSend_chatStyle(v44, v55, v56, v57);
  v87[0] = MEMORY[0x1E4F143A8];
  v87[1] = 3221225472;
  v87[2] = sub_1A4C48F40;
  v87[3] = &unk_1E5B7EBD8;
  os_signpost_id_t v91 = v48;
  uint64_t v88 = v50;
  id v89 = v46;
  BOOL v92 = a9;
  id v90 = v83;
  id v59 = v46;
  __int16 v60 = v50;
  objc_msgSend_loadHistoryForChatWithGUID_chatIdentifiers_style_services_limit_beforeGUID_afterGUID_threadIdentifier_reply_(v81, v61, (uint64_t)v54, (uint64_t)v80, v58, v45, a4, v16, v85, v82, v87);

  if (objc_msgSend_isFiltered(v44, v62, v63, v64))
  {
    if ((objc_msgSend_supportsFilteringExtensions(v44, v65, v66, v67) & 1) == 0)
    {
      id v70 = objc_msgSend_valueForChatProperty_(v44, v68, @"hasViewedPotentialSpamChat", v69);
      char v74 = objc_msgSend_BOOLValue(v70, v71, v72, v73);

      if ((v74 & 1) == 0) {
        objc_msgSend_setValue_forChatProperty_(v44, v75, MEMORY[0x1E4F1CC38], @"hasViewedPotentialSpamChat");
      }
    }
  }

LABEL_20:
}

- (void)_chat_loadPagedHistory:(id)a3 numberOfMessagesBefore:(unint64_t)a4 numberOfMessagesAfter:(unint64_t)a5 messageGUID:(id)a6 threadIdentifier:(id)a7 queryID:(id)a8 synchronous:(BOOL)a9 completion:(id)a10
{
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v68 = a3;
  id v66 = a6;
  id v64 = a7;
  id v67 = a8;
  id v65 = a10;
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138413314;
      id v83 = v68;
      __int16 v84 = 1024;
      int v85 = a4;
      __int16 v86 = 1024;
      int v87 = a5;
      __int16 v88 = 2112;
      id v89 = v66;
      __int16 v90 = 2112;
      id v91 = v67;
      _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_DEBUG, "_chat_loadPagedHistory chat: %@ numberOfMessagesBefore: %d numberOfMessagesAfter: %d messageGUID: %@ queryID: %@", buf, 0x2Cu);
    }
  }
  uint64_t v20 = objc_msgSend_sharedInstance(IMDaemonController, v16, v17, v18);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v20, v21, 0, v22)) == 0)
  {
    uint64_t v26 = objc_msgSend_sharedInstance(IMDaemonController, v23, v24, v25);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v26, v27, 0, v28)) == 0)
    {
      id v59 = objc_msgSend_sharedInstance(IMDaemonController, v29, v30, v31);
      BOOL v62 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v59, v60, 0, v61)) == 0;

      if (v62) {
        goto LABEL_16;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  objc_msgSend__loadSiblingsForChatIfNeeded_(self, v32, (uint64_t)v68, v33);
  id v80 = 0;
  id v81 = 0;
  sub_1A4C416E0(self, v68, &v81, &v80);
  id v63 = v81;
  id v34 = v80;
  id v35 = IMLogHandleForCategory();
  os_signpost_id_t v36 = os_signpost_id_generate(v35);
  uint64_t v37 = v35;
  uint64_t v38 = v37;
  if (v36 - 1 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v37))
  {
    *(_WORD *)long long buf = 0;
    _os_signpost_emit_with_name_impl(&dword_1A4AF7000, v38, OS_SIGNPOST_INTERVAL_BEGIN, v36, "loadPagedHistoryAroundMessageWithGUID", "", buf, 2u);
  }

  uint64_t v42 = objc_msgSend_daemonController(self, v39, v40, v41);
  uint64_t v46 = v42;
  if (a9) {
    objc_msgSend_synchronousRemoteDaemon(v42, v43, v44, v45);
  }
  else {
  uint64_t v47 = objc_msgSend_remoteDaemon(v42, v43, v44, v45);
  }

  uint64_t v51 = objc_msgSend_guid(v68, v48, v49, v50);
  uint64_t v55 = objc_msgSend_chatStyle(v68, v52, v53, v54);
  v69[0] = MEMORY[0x1E4F143A8];
  v69[1] = 3221225472;
  v69[2] = sub_1A4C49588;
  v69[3] = &unk_1E5B7EC28;
  os_signpost_id_t v76 = v36;
  id v70 = v38;
  __int16 v71 = self;
  id v72 = v67;
  id v73 = v68;
  id v74 = v34;
  unint64_t v77 = a4;
  unint64_t v78 = a5;
  BOOL v79 = a9;
  id v75 = v65;
  id v56 = v34;
  uint64_t v57 = v38;
  objc_msgSend_loadPagedHistoryAroundMessageWithGUID_chatGUID_chatIdentifiers_style_services_numberOfMessagesBefore_numberOfMessagesAfter_threadIdentifier_reply_(v47, v58, (uint64_t)v66, (uint64_t)v51, v63, v55, v56, a4, a5, v64, v69);

LABEL_16:
}

- (void)_chat_fetchHistorySummary:(id)a3 dateInterval:(id)a4 synchronous:(BOOL)a5 queryID:(id)a6 completion:(id)a7
{
  BOOL v9 = a5;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138413058;
      id v61 = v12;
      __int16 v62 = 2112;
      id v63 = v13;
      __int16 v64 = 1024;
      BOOL v65 = v9;
      __int16 v66 = 2112;
      id v67 = v14;
      _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_DEBUG, "_chat_fetchHistorySummary chat: %@ dateInterval: %@ synchronous: %d queryID: %@", buf, 0x26u);
    }
  }
  uint64_t v20 = objc_msgSend_sharedInstance(IMDaemonController, v16, v17, v18);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v20, v21, 0, v22)) == 0)
  {
    uint64_t v26 = objc_msgSend_sharedInstance(IMDaemonController, v23, v24, v25);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v26, v27, 0, v28)) == 0)
    {
      uint64_t v50 = objc_msgSend_sharedInstance(IMDaemonController, v29, v30, v31);
      BOOL v53 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v50, v51, 0, v52)) == 0;

      if (v53) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  objc_msgSend__loadSiblingsForChatIfNeeded_(self, v32, (uint64_t)v12, v33);
  id v58 = 0;
  id v59 = 0;
  sub_1A4C416E0(self, v12, &v59, &v58);
  id v34 = v59;
  id v35 = v58;
  uint64_t v39 = objc_msgSend_chatStyle(v12, v36, v37, v38);
  uint64_t v43 = objc_msgSend_daemonController(self, v40, v41, v42);
  uint64_t v47 = v43;
  if (v9) {
    objc_msgSend_synchronousRemoteDaemon(v43, v44, v45, v46);
  }
  else {
  os_signpost_id_t v48 = objc_msgSend_remoteDaemon(v43, v44, v45, v46);
  }

  v54[0] = MEMORY[0x1E4F143A8];
  v54[1] = 3221225472;
  v54[2] = sub_1A4C49B60;
  v54[3] = &unk_1E5B7EC50;
  BOOL v57 = v9;
  id v56 = v15;
  id v55 = v14;
  objc_msgSend_fetchMessageHistorySummaryForDateInterval_chatIdentifiers_chatStyle_services_reply_(v48, v49, (uint64_t)v13, (uint64_t)v34, v39, v35, v54);

LABEL_13:
}

- (void)_chat_fetchOldestMessageDateForChat:(id)a3 synchronous:(BOOL)a4 queryID:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412802;
      id v58 = v10;
      __int16 v59 = 1024;
      BOOL v60 = v8;
      __int16 v61 = 2112;
      id v62 = v11;
      _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_DEBUG, "_chat_fetchOldestMessageDateForChat chat: %@ synchronous: %d queryID: %@", buf, 0x1Cu);
    }
  }
  uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v13, v14, v15);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v17, v18, 0, v19)) == 0)
  {
    uint64_t v23 = objc_msgSend_sharedInstance(IMDaemonController, v20, v21, v22);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v23, v24, 0, v25)) == 0)
    {
      uint64_t v47 = objc_msgSend_sharedInstance(IMDaemonController, v26, v27, v28);
      BOOL v50 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v47, v48, 0, v49)) == 0;

      if (v50) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  objc_msgSend__loadSiblingsForChatIfNeeded_(self, v29, (uint64_t)v10, v30);
  id v55 = 0;
  id v56 = 0;
  sub_1A4C416E0(self, v10, &v56, &v55);
  id v31 = v56;
  id v32 = v55;
  uint64_t v36 = objc_msgSend_chatStyle(v10, v33, v34, v35);
  uint64_t v40 = objc_msgSend_daemonController(self, v37, v38, v39);
  uint64_t v44 = v40;
  if (v8) {
    objc_msgSend_synchronousRemoteDaemon(v40, v41, v42, v43);
  }
  else {
  uint64_t v45 = objc_msgSend_remoteDaemon(v40, v41, v42, v43);
  }

  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = sub_1A4C49F44;
  v51[3] = &unk_1E5B7EC78;
  BOOL v54 = v8;
  id v53 = v12;
  id v52 = v11;
  objc_msgSend_fetchOldestMessageDateForChatIdentifiers_chatStyle_services_reply_(v45, v46, (uint64_t)v31, v36, v32, v51);

LABEL_13:
}

- (void)_chat_clearHistory:(id)a3 beforeGUID:(id)a4 afterGUID:(id)a5 queryID:(id)a6
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138413058;
      id v52 = v10;
      __int16 v53 = 2112;
      id v54 = v11;
      __int16 v55 = 2112;
      id v56 = v12;
      __int16 v57 = 2112;
      id v58 = v13;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_DEBUG, "chat: %@ beforeGUID: %@ afterGUID: %@ queryID: %@", buf, 0x2Au);
    }
  }
  uint64_t v18 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v18, v19, 0, v20)) == 0)
  {
    uint64_t v24 = objc_msgSend_sharedInstance(IMDaemonController, v21, v22, v23);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v24, v25, 0, v26)) == 0)
    {
      uint64_t v45 = objc_msgSend_sharedInstance(IMDaemonController, v27, v28, v29);
      BOOL v48 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v45, v46, 0, v47)) == 0;

      if (v48) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  id v49 = 0;
  id v50 = 0;
  sub_1A4C416E0(self, v10, &v50, &v49);
  id v30 = v50;
  id v31 = v49;
  uint64_t v35 = objc_msgSend_sharedInstance(IMDaemonController, v32, v33, v34);
  uint64_t v39 = objc_msgSend_chatStyle(v10, v36, v37, v38);
  uint64_t v43 = objc_msgSend_guid(v10, v40, v41, v42);
  objc_msgSend_clearHistoryForIDs_style_onServices_beforeGUID_afterGUID_chatID_queryID_(v35, v44, (uint64_t)v30, v39, v31, v11, v12, v43, v13);

LABEL_10:
}

- (void)_chat_markAsSpam:(id)a3 queryID:(id)a4 isJunkReportedToCarrier:(BOOL)a5
{
}

- (void)_chat_markAsSpamAutomatically:(id)a3
{
}

- (void)_chat_markAsSpam:(id)a3 queryID:(id)a4 autoReport:(BOOL)a5 isJunkReportedToCarrier:(BOOL)a6 reportReason:(unint64_t)a7
{
  BOOL v57 = a6;
  BOOL v58 = a5;
  uint64_t v68 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v67 = v9;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "chat: %@", buf, 0xCu);
    }
  }
  uint64_t v15 = objc_msgSend_sharedInstance(IMDaemonController, v11, v12, v13);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v15, v16, 0, v17)) == 0)
  {
    uint64_t v21 = objc_msgSend_sharedInstance(IMDaemonController, v18, v19, v20);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v21, v22, 0, v23)) == 0)
    {
      id v52 = objc_msgSend_sharedInstance(IMDaemonController, v24, v25, v26);
      BOOL v55 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v52, v53, 0, v54)) == 0;

      if (v55) {
        goto LABEL_16;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  id v64 = 0;
  id v65 = 0;
  sub_1A4C416E0(self, v9, &v65, &v64);
  id v27 = v65;
  id v28 = v64;
  if (objc_msgSend_length(v10, v29, v30, v31)) {
    BOOL v35 = !v58;
  }
  else {
    BOOL v35 = 0;
  }
  uint64_t v36 = objc_msgSend_daemonController(self, v32, v33, v34);
  uint64_t v40 = v36;
  if (v35) {
    objc_msgSend_synchronousRemoteDaemon(v36, v37, v38, v39);
  }
  else {
  uint64_t v41 = objc_msgSend_remoteDaemon(v36, v37, v38, v39);
  }

  uint64_t v45 = objc_msgSend_guid(v9, v42, v43, v44);
  uint64_t v49 = objc_msgSend_chatStyle(v9, v46, v47, v48);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = sub_1A4C4A5E4;
  v59[3] = &unk_1E5B7ECA0;
  BOOL v63 = v35;
  v59[4] = self;
  id v60 = v10;
  id v61 = v9;
  id v62 = v28;
  id v50 = v28;
  objc_msgSend_markChatAsSpamWithGUID_chatIdentifiers_style_services_isAutoReport_isJunkReportedToCarrier_reportReason_reply_(v41, v51, (uint64_t)v45, (uint64_t)v27, v49, v50, v58, v57, a7, v59);

LABEL_16:
}

- (void)_chat_loadFrequentReplies:(id)a3 limit:(unint64_t)a4 queryID:(id)a5 loadImmediately:(BOOL)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v52 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412802;
      id v62 = v10;
      __int16 v63 = 1024;
      int v64 = a4;
      __int16 v65 = 2112;
      id v66 = v52;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_DEBUG, "chat: %@ limit:%d queryID: %@", buf, 0x1Cu);
    }
  }
  uint64_t v15 = objc_msgSend_sharedInstance(IMDaemonController, v11, v12, v13);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v15, v16, 0, v17)) == 0)
  {
    uint64_t v21 = objc_msgSend_sharedInstance(IMDaemonController, v18, v19, v20);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v21, v22, 0, v23)) == 0)
    {
      uint64_t v48 = objc_msgSend_sharedInstance(IMDaemonController, v24, v25, v26);
      BOOL v51 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v48, v49, 0, v50)) == 0;

      if (v51) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  id v59 = 0;
  id v60 = 0;
  sub_1A4C416E0(self, v10, &v60, &v59);
  id v27 = v60;
  id v28 = v59;
  id v32 = objc_msgSend_daemonController(self, v29, v30, v31);
  uint64_t v36 = v32;
  if (a6) {
    objc_msgSend_synchronousRemoteDaemon(v32, v33, v34, v35);
  }
  else {
  uint64_t v37 = objc_msgSend_remoteDaemon(v32, v33, v34, v35);
  }

  uint64_t v41 = objc_msgSend_guid(v10, v38, v39, v40);
  uint64_t v45 = objc_msgSend_chatStyle(v10, v42, v43, v44);
  v53[0] = MEMORY[0x1E4F143A8];
  v53[1] = 3221225472;
  v53[2] = sub_1A4C4A9AC;
  v53[3] = &unk_1E5B7ECF0;
  BOOL v58 = a6;
  v53[4] = self;
  id v54 = v52;
  id v55 = v10;
  id v56 = v28;
  unint64_t v57 = a4;
  id v46 = v28;
  objc_msgSend_loadFrequentRepliesForChatWithGUID_chatIdentifiers_style_services_limit_reply_(v37, v47, (uint64_t)v41, (uint64_t)v27, v45, v46, a4, v53);

LABEL_13:
}

- (void)_chat_loadUnreadMessages:(id)a3 limit:(unint64_t)a4 fallbackGUID:(id)a5 queryID:(id)a6 loadImmediately:(BOOL)a7
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  id v56 = a5;
  id v57 = a6;
  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412802;
      id v70 = v58;
      __int16 v71 = 2048;
      unint64_t v72 = a4;
      __int16 v73 = 2112;
      id v74 = v57;
      _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_DEBUG, "chat: %@ limit:%lu queryID: %@", buf, 0x20u);
    }
  }
  uint64_t v16 = objc_msgSend_sharedInstance(IMDaemonController, v12, v13, v14);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v16, v17, 0, v18)) == 0)
  {
    uint64_t v22 = objc_msgSend_sharedInstance(IMDaemonController, v19, v20, v21);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v22, v23, 0, v24)) == 0)
    {
      id v52 = objc_msgSend_sharedInstance(IMDaemonController, v25, v26, v27);
      BOOL v55 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v52, v53, 0, v54)) == 0;

      if (v55) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  id v67 = 0;
  id v68 = 0;
  sub_1A4C416E0(self, v58, &v68, &v67);
  id v28 = v68;
  id v29 = v67;
  uint64_t v33 = objc_msgSend_daemonController(self, v30, v31, v32);
  uint64_t v37 = v33;
  if (a7) {
    objc_msgSend_synchronousRemoteDaemon(v33, v34, v35, v36);
  }
  else {
  uint64_t v38 = objc_msgSend_remoteDaemon(v33, v34, v35, v36);
  }

  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A4C4AEF4;
  aBlock[3] = &unk_1E5B7EB88;
  aBlock[4] = self;
  id v63 = v57;
  id v39 = v58;
  id v64 = v39;
  id v65 = v29;
  unint64_t v66 = a4;
  id v40 = v29;
  uint64_t v41 = _Block_copy(aBlock);
  uint64_t v45 = objc_msgSend_guid(v39, v42, v43, v44);
  uint64_t v49 = objc_msgSend_chatStyle(v39, v46, v47, v48);
  v59[0] = MEMORY[0x1E4F143A8];
  v59[1] = 3221225472;
  v59[2] = sub_1A4C4AFA4;
  v59[3] = &unk_1E5B7ED18;
  BOOL v61 = a7;
  id v60 = v41;
  id v50 = v41;
  objc_msgSend_loadUnreadHistoryForChatWithGUID_chatIdentifiers_style_services_limit_fallbackMessageGUID_reply_(v38, v51, (uint64_t)v45, (uint64_t)v28, v49, v40, a4, v56, v59);

LABEL_13:
}

- (void)_chat_loadAttachments:(id)a3 queryID:(id)a4 loadImmediately:(BOOL)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      id v59 = v8;
      __int16 v60 = 2112;
      id v61 = v9;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_DEBUG, "chat: %@ queryID: %@", buf, 0x16u);
    }
  }
  uint64_t v14 = objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v14, v15, 0, v16)) == 0)
  {
    uint64_t v20 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v20, v21, 0, v22)) == 0)
    {
      uint64_t v47 = objc_msgSend_sharedInstance(IMDaemonController, v23, v24, v25);
      BOOL v50 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v47, v48, 0, v49)) == 0;

      if (v50) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  id v56 = 0;
  id v57 = 0;
  sub_1A4C416E0(self, v8, &v57, &v56);
  id v26 = v57;
  id v27 = v56;
  uint64_t v31 = objc_msgSend_daemonController(self, v28, v29, v30);
  uint64_t v35 = v31;
  if (a5) {
    objc_msgSend_synchronousRemoteDaemon(v31, v32, v33, v34);
  }
  else {
  uint64_t v36 = objc_msgSend_remoteDaemon(v31, v32, v33, v34);
  }

  id v40 = objc_msgSend_guid(v8, v37, v38, v39);
  uint64_t v44 = objc_msgSend_chatStyle(v8, v41, v42, v43);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = sub_1A4C4B3A8;
  v51[3] = &unk_1E5B7ED40;
  BOOL v55 = a5;
  void v51[4] = self;
  id v52 = v9;
  id v53 = v8;
  id v54 = v27;
  id v45 = v27;
  objc_msgSend_loadAttachmentsForChatWithGUID_chatIdentifiers_style_services_reply_(v36, v46, (uint64_t)v40, (uint64_t)v26, v44, v45, v51);

LABEL_13:
}

- (void)_chat_loadUncachedAttachmentsCount:(id)a3 queryID:(id)a4 loadImmediately:(BOOL)a5
{
  uint64_t v62 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      id v59 = v8;
      __int16 v60 = 2112;
      id v61 = v9;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_DEBUG, "chat: %@ queryID: %@", buf, 0x16u);
    }
  }
  uint64_t v14 = objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v14, v15, 0, v16)) == 0)
  {
    uint64_t v20 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v20, v21, 0, v22)) == 0)
    {
      uint64_t v47 = objc_msgSend_sharedInstance(IMDaemonController, v23, v24, v25);
      BOOL v50 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v47, v48, 0, v49)) == 0;

      if (v50) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  id v56 = 0;
  id v57 = 0;
  sub_1A4C416E0(self, v8, &v57, &v56);
  id v26 = v57;
  id v27 = v56;
  uint64_t v31 = objc_msgSend_daemonController(self, v28, v29, v30);
  uint64_t v35 = v31;
  if (a5) {
    objc_msgSend_synchronousRemoteDaemon(v31, v32, v33, v34);
  }
  else {
  uint64_t v36 = objc_msgSend_remoteDaemon(v31, v32, v33, v34);
  }

  id v40 = objc_msgSend_guid(v8, v37, v38, v39);
  uint64_t v44 = objc_msgSend_chatStyle(v8, v41, v42, v43);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = sub_1A4C4B82C;
  v51[3] = &unk_1E5B7ECA0;
  BOOL v55 = a5;
  void v51[4] = self;
  id v52 = v9;
  id v53 = v8;
  id v54 = v27;
  id v45 = v27;
  objc_msgSend_loadUncachedAttachmentCountForChatWithGUID_chatIdentifiers_style_services_reply_(v36, v46, (uint64_t)v40, (uint64_t)v26, v44, v45, v51);

LABEL_13:
}

- (void)_chat_downloadPurgedAttachmentsForChat:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v43 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Download purged attachments for chat %@", buf, 0xCu);
    }
  }
  id v9 = objc_msgSend_sharedInstance(IMDaemonController, v5, v6, v7);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v9, v10, 0, v11)) == 0)
  {
    uint64_t v15 = objc_msgSend_sharedInstance(IMDaemonController, v12, v13, v14);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v15, v16, 0, v17)) == 0)
    {
      uint64_t v36 = objc_msgSend_sharedInstance(IMDaemonController, v18, v19, v20);
      BOOL v39 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v36, v37, 0, v38)) == 0;

      if (v39) {
        goto LABEL_10;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  id v40 = 0;
  id v41 = 0;
  sub_1A4C416E0(self, v4, &v41, &v40);
  id v21 = v41;
  id v22 = v40;
  id v26 = objc_msgSend_sharedInstance(IMDaemonController, v23, v24, v25);
  uint64_t v30 = objc_msgSend_chatStyle(v4, v27, v28, v29);
  uint64_t v34 = objc_msgSend_guid(v4, v31, v32, v33);
  objc_msgSend_downloadPurgedAttachmentsForIDs_style_onServices_chatID_(v26, v35, (uint64_t)v21, v30, v22, v34);

LABEL_10:
}

- (void)_chat_isDownloadingPurgedAssetsForChat:(id)a3 queryID:(id)a4 loadImmediately:(BOOL)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v59 = v8;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Getting isDownloadingPurgedAssets for chat %@", buf, 0xCu);
    }
  }
  uint64_t v14 = objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v14, v15, 0, v16)) == 0)
  {
    uint64_t v20 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v20, v21, 0, v22)) == 0)
    {
      uint64_t v47 = objc_msgSend_sharedInstance(IMDaemonController, v23, v24, v25);
      BOOL v50 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v47, v48, 0, v49)) == 0;

      if (v50) {
        goto LABEL_13;
      }
      goto LABEL_9;
    }
  }
LABEL_9:
  id v56 = 0;
  id v57 = 0;
  sub_1A4C416E0(self, v8, &v57, &v56);
  id v26 = v57;
  id v27 = v56;
  uint64_t v31 = objc_msgSend_daemonController(self, v28, v29, v30);
  uint64_t v35 = v31;
  if (a5) {
    objc_msgSend_synchronousReplyingRemoteDaemon(v31, v32, v33, v34);
  }
  else {
  uint64_t v36 = objc_msgSend_replyingRemoteDaemon(v31, v32, v33, v34);
  }

  id v40 = objc_msgSend_guid(v8, v37, v38, v39);
  uint64_t v44 = objc_msgSend_chatStyle(v8, v41, v42, v43);
  v51[0] = MEMORY[0x1E4F143A8];
  v51[1] = 3221225472;
  v51[2] = sub_1A4C4BEFC;
  v51[3] = &unk_1E5B7EDB8;
  BOOL v55 = a5;
  void v51[4] = self;
  id v52 = v9;
  id v53 = v8;
  id v54 = v27;
  id v45 = v27;
  objc_msgSend_loadIsDownloadingPurgedAttachmentsForChatWithGUID_chatIdentifiers_style_services_reply_(v36, v46, (uint64_t)v40, (uint64_t)v26, v44, v45, v51);

LABEL_13:
}

- (void)_chat_closeSession:(id)a3 didDeleteConversation:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v42 = v5;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Close session for business chat: %@", buf, 0xCu);
    }
  }
  uint64_t v10 = objc_msgSend_chatStyle(v5, v6, v7, v8);
  uint64_t v14 = objc_msgSend_account(v5, v11, v12, v13);
  uint64_t v15 = IMCopyGUIDForChatOnAccount(v5, v14);

  IMComponentsFromChatGUID();
  id v19 = 0;
  if (v19)
  {
    uint64_t v20 = objc_msgSend_account(v5, v16, v17, v18);

    int v21 = IMOSLoggingEnabled();
    if (v20)
    {
      if (v21)
      {
        uint64_t v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v29 = objc_msgSend_account(v5, v26, v27, v28);
          *(_DWORD *)long long buf = 138412802;
          id v42 = v19;
          __int16 v43 = 2112;
          id v44 = v5;
          __int16 v45 = 2112;
          id v46 = v29;
          _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Closing chat session with business with chatIdentifier: %@ chat: %@ on account: %@", buf, 0x20u);
        }
      }
      uint64_t v30 = objc_msgSend_sharedInstance(IMDaemonController, v22, v23, v24);
      uint64_t v34 = objc_msgSend_account(v5, v31, v32, v33);
      uint64_t v38 = objc_msgSend_uniqueID(v34, v35, v36, v37);
      objc_msgSend_closeSessionChatID_identifier_didDeleteConversation_style_account_(v30, v39, (uint64_t)v15, (uint64_t)v19, v4, v10, v38);
    }
    else if (v21)
    {
      id v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v42 = v5;
        _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "ChatRegistry - Cannot close session. Did not find account for chat: %@", buf, 0xCu);
      }
    }
  }
}

- (void)_chat_markRepliedForMessageGUID:(id)a3
{
  id v3 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_markRepliedForMessageGUID_(v9, v7, (uint64_t)v3, v8);
}

- (id)_processLoadedChatDictionaries:(id)a3
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134217984;
      uint64_t v56 = objc_msgSend_count(v5, v7, v8, v9);
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Loaded %llu chats from daemon", buf, 0xCu);
    }
  }
  id v10 = objc_alloc(MEMORY[0x1E4F1CA70]);
  uint64_t v14 = objc_msgSend_count(v5, v11, v12, v13);
  uint64_t v47 = objc_msgSend_initWithCapacity_(v10, v15, v14, v16);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v51 = 0u;
  long long v52 = 0u;
  id obj = v5;
  uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v51, (uint64_t)v62, 16);
  if (v18)
  {
    uint64_t v48 = *(void *)v52;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v52 != v48) {
          objc_enumerationMutation(obj);
        }
        uint64_t v20 = *(void **)(*((void *)&v51 + 1) + 8 * i);
        int v21 = (void *)MEMORY[0x1A6264150]();
        char v50 = 0;
        uint64_t v24 = objc_msgSend__lastMessageItemForChatDictionary_(self, v22, (uint64_t)v20, v23);
        id v26 = (void *)v24;
        if (v24)
        {
          uint64_t v61 = v24;
          id v3 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v25, (uint64_t)&v61, 1);
          uint64_t v27 = v3;
        }
        else
        {
          uint64_t v27 = 0;
        }
        id v49 = 0;
        uint64_t v28 = sub_1A4B19928(self, v20, v27, 1, &v50, &v49);
        id v30 = v49;
        if (v26) {

        }
        if (v28)
        {
          objc_msgSend__registerChatDictionary_forChat_isIncoming_newGUID_shouldPostNotification_(self, v29, (uint64_t)v20, (uint64_t)v28, 1, v30, 1);
          objc_msgSend__updateInfo_forGUID_updatingUnreadCount_(self, v31, (uint64_t)v20, (uint64_t)v30, 1);
          objc_msgSend_addObject_(v47, v32, (uint64_t)v28, v33);
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v34 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            uint64_t v37 = objc_msgSend_objectForKeyedSubscript_(v20, v35, @"guid", v36);
            *(_DWORD *)long long buf = 138412546;
            uint64_t v56 = (uint64_t)v30;
            __int16 v57 = 2112;
            id v58 = v37;
            _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "Failed to reconstruct chat for chatGUID: %@ chatInfo[guid]: %@", buf, 0x16u);
          }
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v38 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
          {
            uint64_t v39 = @"YES";
            if (!v50) {
              uint64_t v39 = @"NO";
            }
            *(_DWORD *)long long buf = 138412802;
            uint64_t v56 = (uint64_t)v39;
            __int16 v57 = 2112;
            id v58 = v30;
            __int16 v59 = 2112;
            uint64_t v60 = v28;
            _os_log_impl(&dword_1A4AF7000, v38, OS_LOG_TYPE_INFO, "Loaded chat was created: %@ guid: %@ chat: %@", buf, 0x20u);
          }
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v40, (uint64_t)&v51, (uint64_t)v62, 16);
    }
    while (v18);
  }

  id v44 = objc_msgSend_array(v47, v41, v42, v43);

  return v44;
}

- (void)loadedChats:(id)a3 queryID:(id)a4
{
  v18[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  uint64_t v9 = objc_msgSend__processLoadedChatDictionaries_(self, v7, (uint64_t)a3, v8);
  uint64_t v13 = objc_msgSend_daemonQueryController(self, v10, v11, v12);
  uint64_t v17 = @"chats";
  v18[0] = v9;
  uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v14, (uint64_t)v18, (uint64_t)&v17, 1);
  objc_msgSend_completeQuery_userInfo_(v13, v16, (uint64_t)v6, (uint64_t)v15);
}

- (void)markedAsReadForMessageGUID:(id)a3 success:(BOOL)a4 queryID:(id)a5
{
  BOOL v5 = a4;
  v21[2] = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  id v9 = a3;
  uint64_t v13 = objc_msgSend_daemonQueryController(self, v10, v11, v12);
  v20[0] = @"messageGUID";
  v20[1] = @"success";
  v21[0] = v9;
  uint64_t v16 = objc_msgSend_numberWithBool_(NSNumber, v14, v5, v15);
  v21[1] = v16;
  uint64_t v18 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v17, (uint64_t)v21, (uint64_t)v20, 2);

  objc_msgSend_completeQuery_userInfo_(v13, v19, (uint64_t)v8, (uint64_t)v18);
}

- (void)forcedReloadingChatRegistryWithQueryID:(id)a3
{
  id v4 = a3;
  objc_msgSend_daemonQueryController(self, v5, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_completeQuery_userInfo_(v9, v8, (uint64_t)v4, 0);
}

- (void)_account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messagesUpdated:(id)a7
{
}

- (void)_account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messagesUpdated:(id)a7 suppressNotification:(BOOL)a8
{
  BOOL v8 = a8;
  unsigned int v40 = a5;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v44 = a3;
  id v42 = a4;
  id v37 = a6;
  id v12 = a7;
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138413058;
      id v57 = v44;
      __int16 v58 = 2112;
      id v59 = v42;
      __int16 v60 = 1024;
      unsigned int v61 = v40;
      __int16 v62 = 2112;
      id v63 = v12;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_DEBUG, "account: %@  chat: %@   style: %d  messages: %@", buf, 0x26u);
    }
  }
  long long v52 = 0u;
  long long v53 = 0u;
  long long v50 = 0u;
  long long v51 = 0u;
  id obj = v12;
  uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v14, (uint64_t)&v50, (uint64_t)v55, 16);
  if (v41)
  {
    uint64_t v39 = *(void *)v51;
    do
    {
      for (uint64_t i = 0; i != v41; ++i)
      {
        if (*(void *)v51 != v39) {
          objc_enumerationMutation(obj);
        }
        uint64_t v16 = *(void **)(*((void *)&v50 + 1) + 8 * i);
        __int16 v45 = _IMBestAccountForIMItem(v16, 0, v44, 0, 0);
        IMMessageFromIMItem = (void *)_CreateIMMessageFromIMItem(v16, v45, 1);
        _IMCheckMessageForDDResults(IMMessageFromIMItem);
        int v21 = objc_msgSend__existingChatWithIdentifier_style_account_(self, v18, (uint64_t)v42, v40, v44);
        if (v21)
        {
          id v22 = objc_alloc(MEMORY[0x1E4F1C978]);
          uint64_t v25 = objc_msgSend_initWithObjects_(v22, v23, (uint64_t)v21, v24, 0, v37);
        }
        else
        {
          uint64_t v25 = objc_msgSend__cachedChatsWithMessage_(self, v19, (uint64_t)IMMessageFromIMItem, v20);
        }
        uint64_t v29 = v25;
        if (objc_msgSend_count(v25, v26, v27, v28))
        {
          long long v48 = 0u;
          long long v49 = 0u;
          long long v46 = 0u;
          long long v47 = 0u;
          id v30 = v29;
          uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v46, (uint64_t)v54, 16);
          if (v33)
          {
            uint64_t v34 = *(void *)v47;
            do
            {
              for (uint64_t j = 0; j != v33; ++j)
              {
                if (*(void *)v47 != v34) {
                  objc_enumerationMutation(v30);
                }
                objc_msgSend__handleIncomingItem_updateRecipient_suppressNotification_(*(void **)(*((void *)&v46 + 1) + 8 * j), v32, (uint64_t)v16, 1, v8);
              }
              uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v32, (uint64_t)&v46, (uint64_t)v54, 16);
            }
            while (v33);
          }
        }
        else
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_26;
          }
          id v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v57 = v42;
            _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "No chat found for chat ID: %@", buf, 0xCu);
          }
        }

LABEL_26:
      }
      uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v36, (uint64_t)&v50, (uint64_t)v55, 16);
    }
    while (v41);
  }
}

- (void)service:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 messagesUpdated:(id)a6
{
  uint64_t v7 = a5;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v50 = a4;
  id v49 = a6;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138413058;
      id v64 = v9;
      __int16 v65 = 2112;
      id v66 = v50;
      __int16 v67 = 1024;
      int v68 = v7;
      __int16 v69 = 2048;
      uint64_t v70 = objc_msgSend_count(v49, v12, v13, v14);
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "service: %@ chat: %@ style: %d messages: %lu", buf, 0x26u);
    }
  }
  long long v48 = v9;
  uint64_t v15 = objc_msgSend__existingChatWithIdentifier_style_service_(self, v10, (uint64_t)v50, v7, v9);
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  id obj = (id)IMCreateItemsFromSerializedArray();
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v57, (uint64_t)v62, 16);
  if (v20)
  {
    uint64_t v21 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v58 != v21) {
          objc_enumerationMutation(obj);
        }
        uint64_t v23 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        if (v15)
        {
          id v24 = objc_alloc(MEMORY[0x1E4F1C978]);
          id v30 = objc_msgSend_initWithObjects_(v24, v25, (uint64_t)v15, v26, 0);
        }
        else
        {
          uint64_t v31 = objc_msgSend_guid(*(void **)(*((void *)&v57 + 1) + 8 * i), v17, v18, v19);
          id v30 = objc_msgSend__cachedChatsWithMessageGUID_(self, v32, (uint64_t)v31, v33);

          uint64_t v15 = objc_msgSend_firstObject(v30, v34, v35, v36);
        }
        objc_msgSend__refreshContextWithAccountHandles(v23, v27, v28, v29);
        if (objc_msgSend_count(v30, v37, v38, v39))
        {
          long long v55 = 0u;
          long long v56 = 0u;
          long long v53 = 0u;
          long long v54 = 0u;
          id v40 = v30;
          uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v41, (uint64_t)&v53, (uint64_t)v61, 16);
          if (v44)
          {
            uint64_t v45 = *(void *)v54;
            do
            {
              for (uint64_t j = 0; j != v44; ++j)
              {
                if (*(void *)v54 != v45) {
                  objc_enumerationMutation(v40);
                }
                objc_msgSend__handleIncomingItem_(*(void **)(*((void *)&v53 + 1) + 8 * j), v42, (uint64_t)v23, v43);
              }
              uint64_t v44 = objc_msgSend_countByEnumeratingWithState_objects_count_(v40, v42, (uint64_t)&v53, (uint64_t)v61, 16);
            }
            while (v44);
          }
        }
        else if (IMOSLoggingEnabled())
        {
          long long v47 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412290;
            id v64 = v50;
            _os_log_impl(&dword_1A4AF7000, v47, OS_LOG_TYPE_INFO, "No chat found for chat ID: %@", buf, 0xCu);
          }
        }
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v17, (uint64_t)&v57, (uint64_t)v62, 16);
    }
    while (v20);
  }
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messageUpdated:(id)a7
{
  uint64_t v7 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  IMSingleObjectArray();
  id v15 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__account_chat_style_chatProperties_messagesUpdated_(self, v14, (uint64_t)v13, (uint64_t)v12, v7, v11, v15);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messageUpdated:(id)a7 suppressNotification:(BOOL)a8
{
  BOOL v8 = a8;
  uint64_t v9 = a5;
  id v13 = a6;
  id v14 = a4;
  id v15 = a3;
  IMSingleObjectArray();
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__account_chat_style_chatProperties_messagesUpdated_suppressNotification_(self, v16, (uint64_t)v15, (uint64_t)v14, v9, v13, v17, v8);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 messagesUpdated:(id)a7
{
  uint64_t v7 = a5;
  id v11 = a6;
  id v12 = a4;
  id v13 = a3;
  id v15 = (id)IMCreateItemsFromSerializedArray();
  objc_msgSend__account_chat_style_chatProperties_messagesUpdated_(self, v14, (uint64_t)v13, (uint64_t)v12, v7, v11, v15);
}

- (BOOL)_shouldSwitchAccountAddingMessagesToChat:(id)a3 messageItems:(id)a4 removedGUIDs:(id)a5 messagesComingFromStorage:(BOOL)a6 chatProperties:(id)a7
{
  BOOL v8 = a6;
  uint64_t v124 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v107 = a4;
  id v13 = a5;
  id v105 = a7;
  __int16 v106 = v13;
  if (v8)
  {
    __int16 v104 = self;
    id v17 = objc_msgSend__items(v12, v14, v15, v16);
    uint64_t v21 = objc_msgSend__items(v12, v18, v19, v20);
    uint64_t v25 = objc_msgSend_mutableCopy(v21, v22, v23, v24);

    id v26 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v30 = objc_msgSend__items(v12, v27, v28, v29);
    uint64_t v33 = objc_msgSend_arrayByApplyingSelector_(v30, v31, (uint64_t)sel_guid, v32);
    uint64_t v36 = objc_msgSend_initWithArray_(v26, v34, (uint64_t)v33, v35);

    id v37 = objc_alloc(MEMORY[0x1E4F1CA80]);
    id v40 = objc_msgSend_arrayByApplyingSelector_(v107, v38, (uint64_t)sel_guid, v39);
    uint64_t v43 = objc_msgSend_initWithArray_(v37, v41, (uint64_t)v40, v42);

    int v103 = (void *)v43;
    objc_msgSend_minusSet_(v36, v44, v43, v45);
    long long v119 = 0u;
    long long v120 = 0u;
    long long v117 = 0u;
    long long v118 = 0u;
    id v46 = v17;
    uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v117, (uint64_t)v123, 16);
    if (v51)
    {
      uint64_t v52 = *(void *)v118;
      do
      {
        for (uint64_t i = 0; i != v51; ++i)
        {
          if (*(void *)v118 != v52) {
            objc_enumerationMutation(v46);
          }
          long long v54 = *(void **)(*((void *)&v117 + 1) + 8 * i);
          long long v55 = objc_msgSend_guid(v54, v48, v49, v50);
          char v58 = objc_msgSend_containsObject_(v36, v56, (uint64_t)v55, v57);

          if ((v58 & 1) == 0) {
            objc_msgSend_removeObject_(v25, v48, (uint64_t)v54, v50);
          }
        }
        uint64_t v51 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v48, (uint64_t)&v117, (uint64_t)v123, 16);
      }
      while (v51);
    }

    unsigned int v61 = objc_msgSend_arrayByAddingObjectsFromArray_(v25, v59, (uint64_t)v107, v60);
    id v63 = objc_msgSend_sortedArrayUsingFunction_context_(v61, v62, (uint64_t)sub_1A4C57980, 0);

    if (IMOSLoggingEnabled())
    {
      id v66 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A4AF7000, v66, OS_LOG_TYPE_INFO, "We received messages from storage so we are appending current items with items from storage", buf, 2u);
      }
    }
    objc_msgSend_beginHoldingChatItemsUpdatesForReason_(v12, v64, @"IMItemsChanged", v65);
    if (objc_msgSend_count(v106, v67, v68, v69)) {
      objc_msgSend__removeItemsForGuids_(v12, v70, (uint64_t)v106, v71);
    }
    long long v114 = 0u;
    long long v115 = 0u;
    long long v112 = 0u;
    long long v113 = 0u;
    id v72 = v63;
    uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v73, (uint64_t)&v112, (uint64_t)v122, 16);
    if (v76)
    {
      uint64_t v77 = *(void *)v113;
      do
      {
        for (uint64_t j = 0; j != v76; ++j)
        {
          if (*(void *)v113 != v77) {
            objc_enumerationMutation(v72);
          }
          objc_msgSend__handleIncomingItem_(v12, v74, *(void *)(*((void *)&v112 + 1) + 8 * j), v75);
        }
        uint64_t v76 = objc_msgSend_countByEnumeratingWithState_objects_count_(v72, v74, (uint64_t)&v112, (uint64_t)v122, 16);
      }
      while (v76);
    }

    objc_msgSend_endHoldingChatItemsUpdatesForReason_(v12, v79, @"IMItemsChanged", v80);
    __int16 v84 = objc_msgSend_guid(v12, v81, v82, v83);
    objc_msgSend__updateInfo_forGUID_updatingUnreadCount_(v104, v85, (uint64_t)v105, (uint64_t)v84, 1);

    BOOL v86 = 1;
  }
  else
  {
    objc_msgSend_beginHoldingChatItemsUpdatesForReason_(v12, v14, @"IMItemsChanged", v16);
    if (objc_msgSend_count(v13, v87, v88, v89)) {
      objc_msgSend__removeItemsForGuids_(v12, v90, (uint64_t)v13, v91);
    }
    long long v110 = 0u;
    long long v111 = 0u;
    long long v108 = 0u;
    long long v109 = 0u;
    id v92 = v107;
    uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v93, (uint64_t)&v108, (uint64_t)v121, 16);
    if (v96)
    {
      uint64_t v97 = *(void *)v109;
      do
      {
        for (uint64_t k = 0; k != v96; ++k)
        {
          if (*(void *)v109 != v97) {
            objc_enumerationMutation(v92);
          }
          char v99 = objc_msgSend__handleIncomingItem_(v12, v94, *(void *)(*((void *)&v108 + 1) + 8 * k), v95);
        }
        BOOL v86 = v99;
        uint64_t v96 = objc_msgSend_countByEnumeratingWithState_objects_count_(v92, v94, (uint64_t)&v108, (uint64_t)v121, 16);
      }
      while (v96);
    }
    else
    {
      BOOL v86 = 1;
    }

    objc_msgSend_endHoldingChatItemsUpdatesForReason_(v12, v100, @"IMItemsChanged", v101);
  }

  return v86;
}

- (void)_processMessageForAccount:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 message:(id)a9
{
  uint64_t v12 = a5;
  uint64_t v16 = (void *)MEMORY[0x1E4F1C978];
  id v17 = a9;
  id v18 = a8;
  id v19 = a7;
  id v20 = a6;
  id v21 = a4;
  id v22 = a3;
  uint64_t v24 = objc_msgSend_arrayWithObjects_count_(v16, v23, (uint64_t)&a9, 1);

  char v26 = 0;
  objc_msgSend__processMessagesForAccount_chat_style_chatProperties_groupID_chatPersonCentricID_messages_removed_messagesComingFromStorage_(self, v25, (uint64_t)v22, (uint64_t)v21, v12, v20, v19, v18, v24, 0, v26);
}

- (void)_processMessagesForAccount:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messages:(id)a9 removed:(id)a10 messagesComingFromStorage:(BOOL)a11
{
  uint64_t v14 = a5;
  uint64_t v209 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v185 = a4;
  id v186 = a6;
  id v181 = a7;
  id v183 = a8;
  id v18 = a9;
  id v184 = a10;
  unsigned int v182 = v14;
  if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = objc_msgSend_arrayByApplyingSelector_(v18, v21, (uint64_t)sel_guid, v22);
      *(_DWORD *)long long buf = 138413314;
      id v200 = v17;
      __int16 v201 = 2112;
      id v202 = v185;
      __int16 v203 = 1024;
      int v204 = v14;
      __int16 v205 = 2112;
      id v206 = v23;
      __int16 v207 = 2112;
      id v208 = v186;
      _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Process messages for account: %@  chat: %@   style: %d  messages: %@  properties: %@", buf, 0x30u);
    }
    uint64_t v14 = v14;
  }
  uint64_t v24 = objc_msgSend__existingChatWithIdentifier_style_account_(self, v19, (uint64_t)v185, v14, v17);
  isDeletingIncomingMessages = v24;
  if (v24)
  {
    if (v186)
    {
      if (objc_msgSend_isFiltered(v24, v25, v26, v27) <= 1)
      {
        uint64_t v32 = objc_msgSend_guid(isDeletingIncomingMessages, v29, v30, v31);
        uint64_t v35 = objc_msgSend_objectForKey_(v186, v33, @"guid", v34);
        char isEqualToString = objc_msgSend_isEqualToString_(v32, v36, (uint64_t)v35, v37);

        if ((isEqualToString & 1) == 0)
        {
          uint64_t v41 = objc_msgSend_objectForKey_(v186, v39, @"isFiltered", v40);
          int v45 = objc_msgSend_intValue(v41, v42, v43, v44);

          if (objc_msgSend_isFiltered(isDeletingIncomingMessages, v46, v47, v48) != v45) {
            objc_msgSend__updateChat_updateIsFiltered_(self, v49, (uint64_t)isDeletingIncomingMessages, v45);
          }
        }
      }
    }
  }
  else
  {
    isDeletingIncomingMessages = objc_msgSend_existingChatWithPersonID_(self, v25, (uint64_t)v183, v27);
    uint64_t v52 = objc_msgSend_objectForKey_(v186, v50, @"guid", v51);
    objc_msgSend__registerChatDictionary_forChat_isIncoming_newGUID_(self, v53, (uint64_t)v186, (uint64_t)isDeletingIncomingMessages, 0, v52);
    objc_msgSend__updateInfo_forGUID_updatingUnreadCount_(self, v54, (uint64_t)v186, (uint64_t)v52, 1);
    unsigned int v61 = objc_msgSend_lastObject(v18, v55, v56, v57);
    if (isDeletingIncomingMessages
      && objc_msgSend_chatStyle(isDeletingIncomingMessages, v58, v59, v60) == 45
      && (objc_msgSend_isFromMe(v61, v62, v63, v64) & 1) == 0)
    {
      uint64_t v68 = objc_msgSend_sharedInstance(IMAccountController, v65, v66, v67);
      uint64_t v71 = objc_msgSend_accountForUniqueID_(v68, v69, (uint64_t)v17, v70);

      if (!v71)
      {
        uint64_t v75 = objc_msgSend_sharedInstance(IMAccountController, v72, v73, v74);
        uint64_t v180 = objc_msgSend_service(v61, v76, v77, v78);
        id v81 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v79, (uint64_t)v180, v80);
        uint64_t v71 = objc_msgSend_bestAccountForService_(v75, v82, (uint64_t)v81, v83);
      }
      __int16 v84 = objc_msgSend_handle(v61, v72, v73, v74);
      int v87 = objc_msgSend_imHandleWithID_(v71, v85, (uint64_t)v84, v86);

      if (v87) {
        objc_msgSend_setRecipient_(isDeletingIncomingMessages, v88, (uint64_t)v87, v89);
      }
    }
  }
  long long v195 = 0u;
  long long v196 = 0u;
  long long v193 = 0u;
  long long v194 = 0u;
  id v90 = v18;
  id v92 = 0;
  uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v91, (uint64_t)&v193, (uint64_t)v198, 16);
  if (v93)
  {
    uint64_t v94 = *(void *)v194;
    do
    {
      uint64_t v95 = 0;
      uint64_t v96 = v92;
      do
      {
        if (*(void *)v194 != v94) {
          objc_enumerationMutation(v90);
        }
        uint64_t v97 = *(void **)(*((void *)&v193 + 1) + 8 * v95);
        id v92 = _IMBestAccountForIMItem(v97, 0, v17, 0, 0);

        IMMessageFromIMItem = (void *)_CreateIMMessageFromIMItem(v97, v92, 1);
        _IMCheckMessageForDDResults(IMMessageFromIMItem);

        ++v95;
        uint64_t v96 = v92;
      }
      while (v93 != v95);
      uint64_t v93 = objc_msgSend_countByEnumeratingWithState_objects_count_(v90, v99, (uint64_t)&v193, (uint64_t)v198, 16);
    }
    while (v93);
  }

  if (isDeletingIncomingMessages)
  {
    if ((objc_msgSend__shouldSwitchAccountAddingMessagesToChat_messageItems_removedGUIDs_messagesComingFromStorage_chatProperties_(self, v100, (uint64_t)isDeletingIncomingMessages, (uint64_t)v90, v184, a11, v186) & 1) == 0)goto LABEL_61; {
    goto LABEL_60;
    }
  }
  if (v182 == 35)
  {
    uint64_t v110 = objc_msgSend_existingChatForRoom_onAccount_(self, v100, (uint64_t)v185, (uint64_t)v92);
LABEL_38:
    isDeletingIncomingMessages = (void *)v110;
    if (v110)
    {
      objc_msgSend__shouldSwitchAccountAddingMessagesToChat_messageItems_removedGUIDs_messagesComingFromStorage_chatProperties_(self, v111, v110, (uint64_t)v90, v184, a11, v186);
      goto LABEL_60;
    }
    long long v114 = objc_msgSend_lastObject(v90, v111, v112, v113);
    char isEmpty = objc_msgSend_isEmpty(v114, v115, v116, v117);

    if ((isEmpty & 1) == 0)
    {
      if (objc_msgSend_count(v186, v100, v101, v102))
      {
        buf[0] = 0;
        id v191 = 0;
        isDeletingIncomingMessages = sub_1A4B19928(self, v186, 0, 1, buf, &v191);
        id v124 = v191;
        long long v187 = 0u;
        long long v188 = 0u;
        long long v189 = 0u;
        long long v190 = 0u;
        id v125 = v90;
        uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v126, (uint64_t)&v187, (uint64_t)v197, 16);
        if (v129)
        {
          uint64_t v130 = *(void *)v188;
          do
          {
            for (uint64_t i = 0; i != v129; ++i)
            {
              if (*(void *)v188 != v130) {
                objc_enumerationMutation(v125);
              }
              objc_msgSend__handleIncomingItem_(isDeletingIncomingMessages, v127, *(void *)(*((void *)&v187 + 1) + 8 * i), v128);
            }
            uint64_t v129 = objc_msgSend_countByEnumeratingWithState_objects_count_(v125, v127, (uint64_t)&v187, (uint64_t)v197, 16);
          }
          while (v129);
        }

        if (buf[0]) {
          objc_msgSend__setupObservation(isDeletingIncomingMessages, v132, v133, v134);
        }
      }
      else
      {
        uint64_t v150 = [IMChat alloc];
        BYTE2(v179) = 0;
        LOWORD(v179) = 0;
        isDeletingIncomingMessages = objc_msgSend__initWithGUID_account_style_roomName_displayName_lastAddressedHandle_lastAddressedSIMID_items_participants_isFiltered_hasHadSuccessfulQuery_isRecovered_isDeletingIncomingMessages_(v150, v151, 0, (uint64_t)v92, v182, v185, 0, 0, 0, v90, 0, 1, v179);
        objc_msgSend__setupObservation(isDeletingIncomingMessages, v152, v153, v154);
        id v124 = 0;
      }
      uint64_t v155 = objc_msgSend_lastObject(v90, v132, v133, v134);
      int v159 = objc_msgSend_isFromMe(v155, v156, v157, v158);
      objc_msgSend__registerChat_isIncoming_guid_(self, v160, (uint64_t)isDeletingIncomingMessages, v159 ^ 1u, v124);

      objc_msgSend__updateUnreadCountForChat_(self, v161, (uint64_t)isDeletingIncomingMessages, v162);
      goto LABEL_60;
    }
LABEL_41:
    isDeletingIncomingMessages = 0;
    goto LABEL_60;
  }
  if (v182 == 43)
  {
    uint64_t v110 = objc_msgSend_existingChatWithChatIdentifier_(self, v100, (uint64_t)v185, v102);
    goto LABEL_38;
  }
  if (v182 != 45) {
    goto LABEL_41;
  }
  int v103 = objc_msgSend_imHandleWithID_(v92, v100, (uint64_t)v185, v102);
  isDeletingIncomingMessages = objc_msgSend_existingChatWithHandle_(self, v104, (uint64_t)v103, v105);
  if (!isDeletingIncomingMessages)
  {
    long long v119 = objc_msgSend_lastObject(v90, v106, v107, v108);
    char isTypingMessage = objc_msgSend_isTypingMessage(v119, v120, v121, v122);

    if (isTypingMessage)
    {
      isDeletingIncomingMessages = 0;
    }
    else
    {
      buf[0] = 0;
      id v192 = 0;
      isDeletingIncomingMessages = sub_1A4B19928(self, v186, v90, 1, buf, &v192);
      id v138 = v192;
      if (buf[0]) {
        objc_msgSend__setupObservation(isDeletingIncomingMessages, v135, v136, v137);
      }
      uint64_t v139 = objc_msgSend_lastObject(v90, v135, v136, v137);
      int v143 = objc_msgSend_isFromMe(v139, v140, v141, v142);
      objc_msgSend__registerChat_isIncoming_guid_(self, v144, (uint64_t)isDeletingIncomingMessages, v143 ^ 1u, v138);

      objc_msgSend__updateUnreadCountForChat_(self, v145, (uint64_t)isDeletingIncomingMessages, v146);
      objc_msgSend_join(isDeletingIncomingMessages, v147, v148, v149);
    }

    goto LABEL_60;
  }
  int shouldSwitchAccountAddingMessagesToChat_messageItems_removedGUIDs_messagesComingFromStorage_chatProperties = objc_msgSend__shouldSwitchAccountAddingMessagesToChat_messageItems_removedGUIDs_messagesComingFromStorage_chatProperties_(self, v106, (uint64_t)isDeletingIncomingMessages, (uint64_t)v90, v184, a11, v186);

  if (shouldSwitchAccountAddingMessagesToChat_messageItems_removedGUIDs_messagesComingFromStorage_chatProperties)
  {
LABEL_60:
    v163 = objc_msgSend_lastObject(v90, v100, v101, v102);
    uint64_t v167 = objc_msgSend__senderHandle(v163, v164, v165, v166);
    uint64_t v171 = objc_msgSend_account(v167, v168, v169, v170);
    objc_msgSend__setAccount_(isDeletingIncomingMessages, v172, (uint64_t)v171, v173);
  }
LABEL_61:
  if (objc_msgSend_serviceSwitchRequested(isDeletingIncomingMessages, v100, v101, v102))
  {
    objc_msgSend_refreshServiceForSending(isDeletingIncomingMessages, v174, v175, v176);
    objc_msgSend_setServiceSwitchRequested_(isDeletingIncomingMessages, v177, 0, v178);
  }
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messageSent:(id)a9
{
  uint64_t v12 = a5;
  id v39 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  kdebug_trace();
  if (objc_msgSend_isFinished(v19, v20, v21, v22))
  {
    uint64_t v26 = objc_msgSend_fileTransferGUIDs(v19, v23, v24, v25);
    if (objc_msgSend_count(v26, v27, v28, v29))
    {
      uint64_t v33 = objc_msgSend_service(v19, v30, v31, v32);
      int isEqualToString = objc_msgSend_isEqualToString_(v33, v34, *MEMORY[0x1E4F6E1B0], v35);

      if (!isEqualToString) {
        goto LABEL_6;
      }
      uint64_t v26 = objc_msgSend_guid(v19, v23, v37, v38);
      _signpostSendFileMessage();
    }
  }
LABEL_6:
  objc_msgSend__processMessageForAccount_chat_style_chatProperties_groupID_chatPersonCentricID_message_(self, v23, (uint64_t)v39, (uint64_t)v15, v12, v16, v17, v18, v19);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 notifySentMessage:(id)a7 sendTime:(id)a8 isReplicating:(BOOL)a9
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (objc_msgSend__postMessageSentNotifications(self, v19, v20, v21))
  {
    uint64_t v22 = _IMBestAccountForIMItem(v17, 0, v14, 0, 0);
    IMMessageFromIMItem = (void *)_CreateIMMessageFromIMItem(v17, v22, 1);
    uint64_t v24 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v27 = v24;
    if (v18) {
      CFDictionarySetValue(v24, @"__kIMChatRegistryMessageSendTimeKey", v18);
    }
    if (IMMessageFromIMItem) {
      CFDictionarySetValue(v27, @"__kIMChatRegistryMessageSentMessageKey", IMMessageFromIMItem);
    }
    uint64_t v28 = objc_msgSend_numberWithBool_(NSNumber, v25, a9, v26);
    if (v28) {
      CFDictionarySetValue(v27, @"__kIMChatRegistryMessageSendIsReplicatingKey", v28);
    }

    uint64_t v32 = objc_msgSend_serviceName(v22, v29, v30, v31);
    id v49 = v15;
    if (objc_msgSend_isEqualToString_(v32, v33, *MEMORY[0x1E4F6E1B8], v34))
    {
      uint64_t v38 = objc_msgSend_fallbackHash(v17, v35, v36, v37);
      uint64_t v42 = objc_msgSend_length(v38, v39, v40, v41);

      if (!v42)
      {
LABEL_12:
        uint64_t v47 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v43, v44, v45);
        objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v47, v48, @"__kIMChatRegistryMessageSentNotification", 0, v27);

        id v15 = v49;
        goto LABEL_13;
      }
      uint64_t v32 = objc_msgSend_fallbackHash(v17, v43, v44, v45);
      objc_msgSend_setObject_forKeyedSubscript_(v27, v46, (uint64_t)v32, @"__kIMChatRegistryMessageOriginalGUIDKey");
    }

    goto LABEL_12;
  }
LABEL_13:
}

- (void)_clearExistingTypingIndicatorsWithMessageGUID:(id)a3 excludingChatWithIdentifier:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend__cachedChatsWithMessageGUID_(self, v8, (uint64_t)v6, v9);
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 134218498;
      uint64_t v52 = objc_msgSend_count(v10, v12, v13, v14);
      __int16 v53 = 2112;
      id v54 = v6;
      __int16 v55 = 2112;
      id v56 = v7;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Found %llu chats with message matching GUID: %@ (will exclude chat %@)", buf, 0x20u);
    }
  }
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v15 = v10;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v46, (uint64_t)v50, 16);
  if (v20)
  {
    uint64_t v22 = *(void *)v47;
    *(void *)&long long v21 = 138412802;
    long long v45 = v21;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v47 != v22) {
          objc_enumerationMutation(v15);
        }
        uint64_t v24 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v25 = objc_msgSend_chatIdentifier(v24, v17, v18, v19, v45, (void)v46);
        char isEqualToString = objc_msgSend_isEqualToString_(v25, v26, (uint64_t)v7, v27);

        if ((isEqualToString & 1) == 0)
        {
          uint64_t v29 = objc_msgSend__itemForGUID_(v24, v17, (uint64_t)v6, v19);
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_isTypingMessage(v29, v30, v31, v32))
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v35 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
              {
                id v39 = objc_msgSend_guid(v24, v36, v37, v38);
                *(_DWORD *)long long buf = v45;
                uint64_t v52 = (uint64_t)v6;
                __int16 v53 = 2112;
                id v54 = v39;
                __int16 v55 = 2112;
                id v56 = v29;
                _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "Removing typing indicator %@ from chat %@, existing item: %@", buf, 0x20u);
              }
            }
            objc_msgSend__removeItem_(v24, v33, (uint64_t)v29, v34);
          }
          else if (IMOSLoggingEnabled())
          {
            uint64_t v40 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              uint64_t v44 = objc_msgSend_guid(v24, v41, v42, v43);
              *(_DWORD *)long long buf = v45;
              uint64_t v52 = (uint64_t)v6;
              __int16 v53 = 2112;
              id v54 = v44;
              __int16 v55 = 2112;
              id v56 = v29;
              _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "Message %@ in chat %@ is not a typing indicator: %@", buf, 0x20u);
            }
          }
        }
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v46, (uint64_t)v50, 16);
    }
    while (v20);
  }
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messageReceived:(id)a9
{
  uint64_t v12 = a5;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a4;
  id v27 = a3;
  uint64_t v24 = objc_msgSend_guid(v16, v21, v22, v23);
  objc_msgSend__clearExistingTypingIndicatorsWithMessageGUID_excludingChatWithIdentifier_(self, v25, (uint64_t)v24, (uint64_t)v20);

  objc_msgSend__processMessageForAccount_chat_style_chatProperties_groupID_chatPersonCentricID_message_(self, v26, (uint64_t)v27, (uint64_t)v20, v12, v19, v18, v17, v16);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 initialEmergencyQuestionnaireReceived:(id)a9
{
  uint64_t v12 = a5;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  objc_msgSend_account_chat_style_chatProperties_groupID_chatPersonCentricID_messageReceived_(self, v21, (uint64_t)v15, (uint64_t)v16, v12, v17, v18, v19, v20);
  if (IMOSLoggingEnabled())
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v36 = v16;
      _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "initialEmergencyQuestionnaireReceived - Opening Messages to: %@", buf, 0xCu);
    }
  }
  if (qword_1E965EB30 != -1) {
    dispatch_once(&qword_1E965EB30, &unk_1EF8E5838);
  }
  uint64_t v25 = objc_msgSend_stringWithFormat_(NSString, v22, @"sms://open?groupid=%@", v23, v16);
  if (IMOSLoggingEnabled())
  {
    uint64_t v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v36 = v25;
      _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "Launching to messages app. URL String is %@", buf, 0xCu);
    }
  }
  uint64_t v30 = objc_msgSend_defaultWorkspace((void *)qword_1E965EB28, v26, v27, v28);
  uint64_t v33 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v31, (uint64_t)v25, v32);
  objc_msgSend_openURL_configuration_completionHandler_(v30, v34, (uint64_t)v33, 0, 0);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 messagesReceived:(id)a9 removed:(id)a10 messagesComingFromStorage:(BOOL)a11
{
  unsigned int v32 = a5;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v33 = a3;
  id v16 = a4;
  id v31 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = a10;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v22)
  {
    uint64_t v26 = v22;
    uint64_t v27 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v35 != v27) {
          objc_enumerationMutation(v19);
        }
        uint64_t v29 = objc_msgSend_guid(*(void **)(*((void *)&v34 + 1) + 8 * i), v23, v24, v25);
        objc_msgSend__clearExistingTypingIndicatorsWithMessageGUID_excludingChatWithIdentifier_(self, v30, (uint64_t)v29, (uint64_t)v16);
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v23, (uint64_t)&v34, (uint64_t)v38, 16);
    }
    while (v26);
  }
  objc_msgSend__processMessagesForAccount_chat_style_chatProperties_groupID_chatPersonCentricID_messages_removed_messagesComingFromStorage_(self, v23, (uint64_t)v33, (uint64_t)v16, v32, v31, v17, v18, v19, v20, a11);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 invitationReceived:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138413058;
      id v56 = v12;
      __int16 v57 = 2112;
      id v58 = v13;
      __int16 v59 = 1024;
      int v60 = v9;
      __int16 v61 = 2112;
      id v62 = v15;
      _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_DEBUG, "account: %@  chat: %@  style: %d  invitation: %@", buf, 0x26u);
    }
  }
  if ((v9 & 0xFFFFFFF7) == 0x23)
  {
    id v20 = objc_msgSend_sharedInstance(IMAccountController, v16, v17, v18);
    uint64_t v23 = objc_msgSend_accountForUniqueID_(v20, v21, (uint64_t)v12, v22);

    uint64_t v25 = objc_msgSend__existingChatWithIdentifier_style_account_(self, v24, (uint64_t)v13, v9, v12);
    isDeletingIncomingMessages = v25;
    if (v25)
    {
      uint64_t v30 = objc_msgSend_groupID(v25, v26, v27, v28);
      objc_msgSend_account_chat_style_chatProperties_groupID_chatPersonCentricID_messageReceived_(self, v31, (uint64_t)v12, (uint64_t)v13, v9, v14, v30, 0, v15);
    }
    else
    {
      objc_msgSend__setInvitation_(v15, v26, 1, v28);
      id v32 = objc_alloc(MEMORY[0x1E4F1C978]);
      uint64_t v30 = objc_msgSend_initWithObjects_(v32, v33, (uint64_t)v15, v34, 0);
      if (objc_msgSend_count(v14, v35, v36, v37))
      {
        buf[0] = 0;
        id v54 = 0;
        isDeletingIncomingMessages = sub_1A4B19928(self, v14, 0, 1, buf, &v54);
        id v38 = v54;
        objc_msgSend__handleIncomingItem_(isDeletingIncomingMessages, v39, (uint64_t)v15, v40);
        if (buf[0]) {
          objc_msgSend__setupObservation(isDeletingIncomingMessages, v41, v42, v43);
        }
      }
      else
      {
        uint64_t v44 = [IMChat alloc];
        BYTE2(v53) = 0;
        LOWORD(v53) = 0;
        isDeletingIncomingMessages = objc_msgSend__initWithGUID_account_style_roomName_displayName_lastAddressedHandle_lastAddressedSIMID_items_participants_isFiltered_hasHadSuccessfulQuery_isRecovered_isDeletingIncomingMessages_(v44, v45, 0, (uint64_t)v23, v9, v13, 0, 0, 0, v30, 0, 1, v53);
        objc_msgSend__setupObservation(isDeletingIncomingMessages, v46, v47, v48);
        id v38 = 0;
      }
      int v49 = objc_msgSend_isFromMe(v15, v41, v42, v43);
      objc_msgSend__registerChat_isIncoming_guid_(self, v50, (uint64_t)isDeletingIncomingMessages, v49 ^ 1u, v38);
      objc_msgSend__updateUnreadCountForChat_(self, v51, (uint64_t)isDeletingIncomingMessages, v52);
    }
  }
  else
  {
    objc_msgSend_account_chat_style_chatProperties_groupID_chatPersonCentricID_messageReceived_(self, v16, (uint64_t)v12, (uint64_t)v13, v9, v14, 0, 0, v15);
  }
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 updateProperties:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  id v12 = a4;
  id v30 = a6;
  id v13 = a7;
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138413058;
      id v39 = v32;
      __int16 v40 = 2112;
      id v41 = v12;
      __int16 v42 = 1024;
      int v43 = v9;
      __int16 v44 = 2112;
      id v45 = v13;
      _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_DEBUG, "account: %@  chat: %@  style: %d  properties: %@", buf, 0x26u);
    }
  }
  id v19 = objc_msgSend__existingChatWithIdentifier_style_account_(self, v14, (uint64_t)v12, v9, v32, v30);
  if (v19)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    id v20 = objc_msgSend_allKeys(v13, v16, v17, v18);
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v21, (uint64_t)&v33, (uint64_t)v37, 16);
    if (v24)
    {
      uint64_t v25 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v34 != v25) {
            objc_enumerationMutation(v20);
          }
          uint64_t v27 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v28 = objc_msgSend_objectForKey_(v13, v22, v27, v23);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend_setValue_forChatProperty_(v19, v29, 0, v27);
          }
          else {
            objc_msgSend_setValue_forChatProperty_(v19, v29, (uint64_t)v28, v27);
          }
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v20, v22, (uint64_t)&v33, (uint64_t)v37, 16);
      }
      while (v24);
    }
  }
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 error:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      int v25 = 138413058;
      id v26 = v12;
      __int16 v27 = 2112;
      id v28 = v13;
      __int16 v29 = 1024;
      int v30 = v9;
      __int16 v31 = 2112;
      id v32 = v15;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_DEBUG, "account: %@  chat: %@  style: %d  error: %@", (uint8_t *)&v25, 0x26u);
    }
  }
  uint64_t v18 = objc_msgSend__existingChatWithIdentifier_style_account_(self, v16, (uint64_t)v13, v9, v12);
  uint64_t v22 = objc_msgSend_localizedDescription(v15, v19, v20, v21);
  objc_msgSend__showErrorMessage_(v18, v23, (uint64_t)v22, v24);
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 groupID:(id)a7 chatPersonCentricID:(id)a8 statusChanged:(int)a9 handleInfo:(id)a10
{
  uint64_t v13 = a5;
  uint64_t v154 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v123 = a6;
  id v121 = a7;
  id v128 = a8;
  id v124 = a10;
  uint64_t v127 = v17;
  long long v120 = v16;
  id v19 = objc_msgSend__existingChatWithIdentifier_style_account_(self, v18, (uint64_t)v17, v13, v16);
  if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      __int16 v27 = objc_msgSend_guid(v19, v24, v25, v26);
      *(_DWORD *)long long buf = 134218498;
      uint64_t v149 = (uint64_t)v19;
      __int16 v150 = 2112;
      uint64_t v151 = v27;
      __int16 v152 = 2112;
      id v153 = v128;
      _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "chat (%p) properties updated for guid %@: personCentricID %@", buf, 0x20u);
    }
  }
  if (v19) {
    goto LABEL_8;
  }
  id v19 = objc_msgSend_existingChatWithPersonID_(self, v20, (uint64_t)v128, v22);
  if (v19)
  {
    int v30 = objc_msgSend_objectForKey_(v123, v28, @"guid", v29);
    objc_msgSend__registerChatDictionary_forChat_isIncoming_newGUID_(self, v31, (uint64_t)v123, (uint64_t)v19, 0, v30);
    objc_msgSend__updateInfo_forGUID_updatingUnreadCount_(self, v32, (uint64_t)v123, (uint64_t)v30, 1);

LABEL_8:
    uint64_t v134 = v19;
    objc_msgSend_guid(v19, v20, v21, v22);
    id v122 = (id)objc_claimAutoreleasedReturnValue();
    goto LABEL_9;
  }
  buf[0] = 0;
  id v145 = 0;
  uint64_t v134 = sub_1A4B19928(self, v123, 0, (a9 < 8) & (0xC6u >> a9), buf, &v145);
  id v122 = v145;
  if (buf[0])
  {
    objc_msgSend__setupObservation(v134, v116, v117, v118);
    objc_msgSend__updatePersonCentricIDToChatMapForChat_toNewPersonCentricID_(self, v119, (uint64_t)v134, (uint64_t)v128);
  }
  if (!v134)
  {
    uint64_t v134 = 0;
    goto LABEL_59;
  }
LABEL_9:
  id v33 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_msgSend_addObject_(v33, v34, (uint64_t)v134, v35);
  id v39 = objc_msgSend_participants(v134, v36, v37, v38);
  id v125 = objc_msgSend__sortedParticipantIDHashForParticipants_(self, v40, (uint64_t)v39, v41);

  id v45 = objc_msgSend_groupParticipantToChatsMap(self, v42, v43, v44);
  uint64_t v48 = objc_msgSend_objectForKey_(v45, v46, (uint64_t)v125, v47);
  BOOL v126 = objc_msgSend_allObjects(v48, v49, v50, v51);

  if (v126)
  {
    v143[0] = MEMORY[0x1E4F143A8];
    v143[1] = 3221225472;
    v143[2] = sub_1A4C5A170;
    v143[3] = &unk_1E5B7F0D0;
    id v144 = v134;
    __int16 v57 = objc_msgSend___imArrayByFilteringWithBlock_(v126, v55, (uint64_t)v143, v56);
    objc_msgSend_addObjectsFromArray_(v33, v58, (uint64_t)v57, v59);
  }
  if ((unint64_t)objc_msgSend_count(v33, v52, v53, v54) >= 2 && IMOSLoggingEnabled())
  {
    int v60 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      uint64_t v64 = objc_msgSend_count(v33, v61, v62, v63);
      *(_DWORD *)long long buf = 134218498;
      uint64_t v149 = v64;
      __int16 v150 = 2112;
      uint64_t v151 = v125;
      __int16 v152 = 2112;
      id v153 = v33;
      _os_log_impl(&dword_1A4AF7000, v60, OS_LOG_TYPE_INFO, "Found %ld chats using participantIDHash %@: %@", buf, 0x20u);
    }
  }
  long long v141 = 0u;
  long long v142 = 0u;
  long long v139 = 0u;
  long long v140 = 0u;
  id obj = v33;
  uint64_t v68 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v65, (uint64_t)&v139, (uint64_t)v147, 16);
  if (v68)
  {
    uint64_t v69 = *(void *)v140;
    do
    {
      uint64_t v70 = 0;
      do
      {
        if (*(void *)v140 != v69) {
          objc_enumerationMutation(obj);
        }
        if ((a9 + 1) <= 8)
        {
          uint64_t v71 = *(void **)(*((void *)&v139 + 1) + 8 * v70);
          if (((1 << (a9 + 1)) & 0x73) != 0)
          {
            objc_msgSend__setJoinState_(v71, v66, 0, v67);
          }
          else if (a9 == 2)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v77 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v149 = (uint64_t)v17;
                _os_log_impl(&dword_1A4AF7000, v77, OS_LOG_TYPE_INFO, "Joined chat: %@", buf, 0xCu);
              }
            }
            objc_msgSend__setJoinState_(v71, v75, 3, v76);
          }
          else if (a9 == 7)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v74 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long buf = 138412290;
                uint64_t v149 = (uint64_t)v17;
                _os_log_impl(&dword_1A4AF7000, v74, OS_LOG_TYPE_INFO, "Read Only chat: %@", buf, 0xCu);
              }
            }
            objc_msgSend__setJoinState_(v71, v72, 4, v73);
          }
        }
        ++v70;
      }
      while (v68 != v70);
      uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v66, (uint64_t)&v139, (uint64_t)v147, 16);
      uint64_t v68 = v78;
    }
    while (v78);
  }

  if ((a9 + 1) <= 8)
  {
    if (((1 << (a9 + 1)) & 0x73) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v80 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1A4AF7000, v80, OS_LOG_TYPE_INFO, "We're not in the room, leaving as is", buf, 2u);
        }
      }
    }
    else
    {
      objc_msgSend__registerChat_isIncoming_guid_(self, v79, (uint64_t)v134, 0, v122);
    }
  }
  long long v137 = 0u;
  long long v138 = 0u;
  long long v135 = 0u;
  long long v136 = 0u;
  id v129 = v124;
  uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v129, v81, (uint64_t)&v135, (uint64_t)v146, 16);
  if (v84)
  {
    uint64_t v133 = *(void *)v136;
    uint64_t v132 = *MEMORY[0x1E4F6C5C8];
    uint64_t v131 = *MEMORY[0x1E4F6C648];
    uint64_t v85 = *MEMORY[0x1E4F6C5A0];
    uint64_t v86 = *MEMORY[0x1E4F6C458];
    do
    {
      for (uint64_t i = 0; i != v84; ++i)
      {
        if (*(void *)v136 != v133) {
          objc_enumerationMutation(v129);
        }
        uint64_t v88 = *(void **)(*((void *)&v135 + 1) + 8 * i);
        uint64_t v89 = objc_msgSend_objectForKey_(v88, v82, v132, v83);
        id v92 = objc_msgSend_objectForKey_(v88, v90, v131, v91);
        uint64_t v95 = objc_msgSend_objectForKey_(v88, v93, v85, v94);
        uint64_t v98 = objc_msgSend_objectForKey_(v88, v96, v86, v97);
        uint64_t v102 = (void *)v98;
        if (v89) {
          BOOL v103 = v98 == 0;
        }
        else {
          BOOL v103 = 1;
        }
        if (!v103)
        {
          __int16 v104 = objc_msgSend_account(v134, v99, v100, v101);
          __int16 v106 = objc_msgSend_imHandleWithID_alreadyCanonical_(v104, v105, (uint64_t)v89, 1);

          objc_msgSend__setOriginalID_countryCode_updateSiblings_(v106, v107, (uint64_t)v92, (uint64_t)v95, 1);
          objc_msgSend_setPersonCentricID_(v106, v108, (uint64_t)v128, v109);
          int v113 = objc_msgSend_intValue(v102, v110, v111, v112);
          uint64_t v114 = sub_1A4BCF73C(v113);
          objc_msgSend__setParticipantState_forHandle_postNotification_(v134, v115, v114, (uint64_t)v106, 0);
        }
      }
      uint64_t v84 = objc_msgSend_countByEnumeratingWithState_objects_count_(v129, v82, (uint64_t)&v135, (uint64_t)v146, 16);
    }
    while (v84);
  }

LABEL_59:
}

- (void)leftChat:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Leaving chat with GUID: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  BOOL v8 = objc_msgSend_existingChatWithGUID_(self, v5, (uint64_t)v4, v6);
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Found chat: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  if (v8)
  {
    objc_msgSend__setJoinState_(v8, v9, 0, v10);
    objc_msgSend__unregisterChat_(self, v12, (uint64_t)v8, v13);
  }
}

- (void)account:(id)a3 chat:(id)a4 style:(unsigned __int8)a5 chatProperties:(id)a6 chatPersonCentricID:(id)a7 member:(id)a8 statusChanged:(int)a9
{
  uint64_t v12 = a5;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEBUG))
    {
      int v35 = 138413314;
      id v36 = v15;
      __int16 v37 = 2112;
      id v38 = v16;
      __int16 v39 = 1024;
      int v40 = v12;
      __int16 v41 = 2112;
      id v42 = v19;
      __int16 v43 = 1024;
      int v44 = a9;
      _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_DEBUG, "Chat status changed: account: %@  chat: %@  style: %d  member: %@  status: %d", (uint8_t *)&v35, 0x2Cu);
    }
  }
  uint64_t v22 = objc_msgSend__existingChatWithIdentifier_style_account_(self, v20, (uint64_t)v16, v12, v15);
  if (objc_msgSend_canHaveMultipleParticipants(v22, v23, v24, v25))
  {
    uint64_t v29 = objc_msgSend_account(v22, v26, v27, v28);
    id v32 = objc_msgSend_imHandleWithInfo_(v29, v30, (uint64_t)v19, v31);

    objc_msgSend__participant_statusChanged_(v22, v33, (uint64_t)v32, a9);
    objc_msgSend__updatePersonCentricIDToChatMapForChat_toNewPersonCentricID_(self, v34, (uint64_t)v22, (uint64_t)v18);
  }
}

- (void)account:(id)a3 handleID:(id)a4 updatedLastReceivedOnGridMessageDate:(id)a5
{
  if (a5)
  {
    uint64_t v6 = (void *)MEMORY[0x1E4F6E7B0];
    id v7 = a5;
    id v8 = a4;
    objc_msgSend_sharedInstance(v6, v9, v10, v11);
    id v13 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_overrideStatusForHandleWithID_publishedBeforeDate_(v13, v12, (uint64_t)v8, (uint64_t)v7);
  }
}

- (void)chat:(id)a3 propertiesUpdated:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412546;
      id v15 = v6;
      __int16 v16 = 2112;
      id v17 = v7;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "chat: %@  propertiesUpdated: %@", (uint8_t *)&v14, 0x16u);
    }
  }
  uint64_t v11 = objc_msgSend__cachedChatWithGUID_(self, v8, (uint64_t)v6, v9);
  objc_msgSend__setChatProperties_(v11, v12, (uint64_t)v7, v13);
}

- (void)chat:(id)a3 chatPersonCentricID:(id)a4 displayNameUpdated:(id)a5
{
}

- (void)chat:(id)a3 chatPersonCentricID:(id)a4 displayNameUpdated:(id)a5 sender:(id)a6
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled())
  {
    __int16 v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v23 = 138412546;
      id v24 = v10;
      __int16 v25 = 2112;
      id v26 = v12;
      _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "chat: %@  displayName: %@", (uint8_t *)&v23, 0x16u);
    }
  }
  id v17 = objc_msgSend_existingChatWithGUID_(self, v14, (uint64_t)v10, v15);
  objc_msgSend__updateDisplayName_sender_(v17, v18, (uint64_t)v12, (uint64_t)v13);
  if (objc_msgSend_canHaveMultipleParticipants(v17, v19, v20, v21)) {
    objc_msgSend__updatePersonCentricIDToChatMapForChat_toNewPersonCentricID_(self, v22, (uint64_t)v17, (uint64_t)v11);
  }
}

- (void)chat:(id)a3 lastAddressedHandleUpdated:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "chat: %@ lastAddressedHandleUpdated: %@", (uint8_t *)&v19, 0x16u);
    }
  }
  id v11 = objc_msgSend__cachedChatWithGUID_(self, v8, (uint64_t)v6, v9);
  int v14 = v11;
  if (v11)
  {
    objc_msgSend__updateLastAddressedHandleID_(v11, v12, (uint64_t)v7, v13);
    objc_msgSend_refreshServiceForSending(v14, v15, v16, v17);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring last addressed handle update", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)chat:(id)a3 lastAddressedSIMIDUpdated:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "chat: %@ lastAddressedSIMIDUpdated: %@", (uint8_t *)&v19, 0x16u);
    }
  }
  id v11 = objc_msgSend__cachedChatWithGUID_(self, v8, (uint64_t)v6, v9);
  int v14 = v11;
  if (v11)
  {
    objc_msgSend__updateLastAddressedSIMID_(v11, v12, (uint64_t)v7, v13);
    objc_msgSend_refreshServiceForSending(v14, v15, v16, v17);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring last addressed SIM ID update", (uint8_t *)&v19, 0xCu);
    }
  }
}

- (void)chat:(id)a3 lastAddressedHandleUpdated:(id)a4 lastAddressedSIMIDUpdated:(id)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412802;
      id v25 = v8;
      __int16 v26 = 2112;
      id v27 = v9;
      __int16 v28 = 2112;
      id v29 = v10;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "chat: %@ lastAddressedHandleUpdated: %@ lastAddressedSIMIDUpdated: %@", (uint8_t *)&v24, 0x20u);
    }
  }
  int v14 = objc_msgSend__cachedChatWithGUID_(self, v11, (uint64_t)v8, v12);
  uint64_t v17 = v14;
  if (v14)
  {
    objc_msgSend__updateLastAddressedHandleID_(v14, v15, (uint64_t)v9, v16);
    objc_msgSend__updateLastAddressedSIMID_(v17, v18, (uint64_t)v10, v19);
    objc_msgSend_refreshServiceForSending(v17, v20, v21, v22);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      id v25 = v8;
      _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring last addressed handle and last addressed SIM ID update", (uint8_t *)&v24, 0xCu);
    }
  }
}

- (void)chat:(id)a3 isFilteredUpdated:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      id v16 = v6;
      __int16 v17 = 1024;
      int v18 = a4;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "chat: %@ isFilteredUpdated: %d", (uint8_t *)&v15, 0x12u);
    }
  }
  id v10 = objc_msgSend__cachedChatWithGUID_(self, v7, (uint64_t)v6, v8);
  uint64_t v13 = v10;
  if (v10)
  {
    objc_msgSend_setIsFiltered_(v10, v11, a4, v12);
  }
  else if (IMOSLoggingEnabled())
  {
    int v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      id v16 = v6;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring is filtered update", (uint8_t *)&v15, 0xCu);
    }
  }
}

- (void)chat:(id)a3 isRecoveredUpdated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = @"NO";
      if (v4) {
        id v10 = @"YES";
      }
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "chat: %@ isRecoveredUpdated: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  id v11 = objc_msgSend__cachedChatWithGUID_(self, v7, (uint64_t)v6, v8);
  int v14 = v11;
  if (v11)
  {
    objc_msgSend_setRecovered_(v11, v12, v4, v13);
  }
  else if (IMOSLoggingEnabled())
  {
    int v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring is recover update", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)chat:(id)a3 isDeletingIncomingMessagesUpdated:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = @"NO";
      if (v4) {
        id v10 = @"YES";
      }
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      uint64_t v19 = v10;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "chat: %@ isDeletingIncomingMessagesUpdated: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  id v11 = objc_msgSend__cachedChatWithGUID_(self, v7, (uint64_t)v6, v8);
  int v14 = v11;
  if (v11)
  {
    objc_msgSend_setDeletingIncomingMessages_(v11, v12, v4, v13);
  }
  else if (IMOSLoggingEnabled())
  {
    int v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring is is deleting incoming messages update", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)chat:(id)a3 engramIDUpdated:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "chat: %@ engramIDUpdated: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  id v11 = objc_msgSend__cachedChatWithGUID_(self, v8, (uint64_t)v6, v9);
  int v14 = v11;
  if (v11)
  {
    objc_msgSend__updateEngramID_(v11, v12, (uint64_t)v7, v13);
  }
  else if (IMOSLoggingEnabled())
  {
    int v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring engram ID update", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)engroupParticipantsUpdatedForChat:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "chat: %@ finished updating group chat", (uint8_t *)&v14, 0xCu);
    }
  }
  uint64_t v8 = objc_msgSend__cachedChatWithGUID_(self, v5, (uint64_t)v4, v6);
  uint64_t v12 = v8;
  if (v8)
  {
    objc_msgSend__engroupParticipantsUpdated(v8, v9, v10, v11);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring engroup update", (uint8_t *)&v14, 0xCu);
    }
  }
}

- (void)updatedSummariesForChatsWithGUIDsAndProperties:(id)a3
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_messageSummarizationEnabled(MEMORY[0x1E4F6E790], v5, v6, v7))
  {
    objc_msgSend_allKeys(v4, v8, v9, v10);
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v53, (uint64_t)v59, 16);
    if (v52)
    {
      uint64_t v51 = *(void *)v54;
      uint64_t v14 = *MEMORY[0x1E4F6CD00];
      do
      {
        for (uint64_t i = 0; i != v52; ++i)
        {
          if (*(void *)v54 != v51) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void *)(*((void *)&v53 + 1) + 8 * i);
          id v17 = v4;
          __int16 v18 = objc_msgSend_objectForKey_(v4, v12, v16, v13);
          uint64_t v21 = objc_msgSend__cachedChatWithGUID_(self, v19, v16, v20);
          id v25 = objc_msgSend_allChatProperties(v21, v22, v23, v24);
          id v29 = objc_msgSend_mutableCopy(v25, v26, v27, v28);

          id v32 = objc_msgSend_valueForKey_(v18, v30, v14, v31);
          id v36 = objc_msgSend_null(MEMORY[0x1E4F1CA98], v33, v34, v35);

          if (v32 == v36) {
            objc_msgSend_removeObjectForKey_(v29, v37, v14, v38);
          }
          else {
            objc_msgSend_setValue_forKey_(v29, v37, (uint64_t)v32, v14);
          }
          id v42 = objc_msgSend_copy(v29, v39, v40, v41);
          objc_msgSend_chat_propertiesUpdated_(self, v43, v16, (uint64_t)v42);

          id v4 = v17;
        }
        uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v53, (uint64_t)v59, 16);
      }
      while (v52);
    }
    __int16 v57 = @"__kIMChatRegistrySummaryDictionaryKey";
    id v58 = obj;
    int v44 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)&v58, (uint64_t)&v57, 1);
    uint64_t v48 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v45, v46, v47);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v48, v49, @"__kIMChatRegistryDidUpdateMessagesWithSummaryNotification", 0, v44);
  }
}

- (void)chat:(id)a3 uncachedAttachmentCountUpdated:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412546;
      id v17 = v6;
      __int16 v18 = 2112;
      id v19 = v7;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "chat: %@ uncachedAttachmentCountUpdated: %@", (uint8_t *)&v16, 0x16u);
    }
  }
  uint64_t v11 = objc_msgSend__cachedChatWithGUID_(self, v8, (uint64_t)v6, v9);
  uint64_t v14 = v11;
  if (v11)
  {
    objc_msgSend__setCountOfAttachmentsNotCachedLocally_(v11, v12, (uint64_t)v7, v13);
  }
  else if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "No cached chat for %@, ignoring attachment count update", (uint8_t *)&v16, 0xCu);
    }
  }
}

- (void)_updateChat:(id)a3 updateIsFiltered:(int64_t)a4
{
  id v10 = a3;
  objc_msgSend_updateIsFiltered_(v10, v5, a4, v6);
  objc_msgSend_verifyFiltering(v10, v7, v8, v9);
}

- (void)_updateInfo:(id)a3 forGUID:(id)a4 updatingUnreadCount:(BOOL)a5
{
}

- (void)chat:(id)a3 updated:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v10 = objc_msgSend_objectForKeyedSubscript_(v7, v8, *MEMORY[0x1E4F6CDB0], v9);
  uint64_t v13 = v10;
  if (v10)
  {
    uint64_t v14 = objc_msgSend_objectForKey_(v10, v11, @"guid", v12);
  }
  else
  {
    uint64_t v14 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    int v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412802;
      id v18 = v6;
      __int16 v19 = 2112;
      uint64_t v20 = v14;
      __int16 v21 = 2112;
      id v22 = v7;
      _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "chat: %@  last message guid %@ updated: %@", (uint8_t *)&v17, 0x20u);
    }
  }
  objc_msgSend__updateInfo_forGUID_updatingUnreadCount_(self, v15, (uint64_t)v7, (uint64_t)v6, 1);
}

- (void)historicalMessageGUIDsDeleted:(id)a3 chatGUIDs:(id)a4 queryID:(id)a5
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      id v55 = v8;
      __int16 v56 = 2112;
      id v57 = v10;
      __int16 v58 = 2112;
      id v59 = v9;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "deletedGUIDs: %@  queryID: %@  chatGUIDs: %@", buf, 0x20u);
    }
  }
  if (objc_msgSend_count(v9, v11, v12, v13))
  {
    id v18 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id v19 = v9;
    uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v49, (uint64_t)v53, 16);
    if (v23)
    {
      uint64_t v24 = *(void *)v50;
      do
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v50 != v24) {
            objc_enumerationMutation(v19);
          }
          uint64_t v28 = objc_msgSend_existingChatWithGUID_(self, v21, *(void *)(*((void *)&v49 + 1) + 8 * v25), v22);
          if (v28 && (objc_msgSend_containsObjectIdenticalTo_(v18, v26, (uint64_t)v28, v27) & 1) == 0)
          {
            objc_msgSend__handleMessageGUIDDeletions_(v28, v29, (uint64_t)v8, v30);
            objc_msgSend_addObject_(v18, v31, (uint64_t)v28, v32);
          }

          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v49, (uint64_t)v53, 16);
      }
      while (v23);
    }
  }
  else
  {
    id v33 = objc_msgSend_chatGUIDToChatMap(self, v15, v16, v17);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = sub_1A4C5BE28;
    v47[3] = &unk_1E5B7F0F8;
    id v48 = v8;
    objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v33, v34, (uint64_t)v47, v35);

    id v18 = v48;
  }

  __int16 v39 = objc_msgSend_daemonQueryController(self, v36, v37, v38);
  objc_msgSend_completeQuery_(v39, v40, (uint64_t)v10, v41);

  uint64_t v45 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v42, v43, v44);
  objc_msgSend___mainThreadPostNotificationName_object_(v45, v46, @"__kIMChatRegistryDidMoveMessagesInChatsToRecentlyDeletedNotification", (uint64_t)v8);
}

- (void)_checkLimitAndSetMessagesToKeepLoadedIfNeeded:(unint64_t)a3 chat:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  if (objc_msgSend_numberOfMessagesToKeepLoaded(v5, v6, v7, v8) < a3)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v15 = 134218240;
        unint64_t v16 = a3;
        __int16 v17 = 2048;
        uint64_t v18 = objc_msgSend_numberOfMessagesToKeepLoaded(v5, v12, v13, v14);
        _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "The limit (%lu) of number of messages we loaded is higher than our capacity (%lu), bumping our capactity to the new limit", (uint8_t *)&v15, 0x16u);
      }
    }
    objc_msgSend_setNumberOfMessagesToKeepLoaded_(v5, v9, a3, v10);
  }
}

- (void)_completeChatLoadQueryWithChat:(id)a3 queryID:(id)a4
{
  v25[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v10 = a4;
  if (v10)
  {
    if (v6)
    {
      uint64_t v11 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v7, v8, v9);
      uint64_t v24 = @"__kIMChatQueryIDKey";
      v25[0] = v10;
      uint64_t v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)v25, (uint64_t)&v24, 1);
      objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v11, v14, @"__kIMChatLoadRequestDidCompleteNotification", (uint64_t)v6, v13);

      uint64_t v18 = objc_msgSend_daemonQueryController(self, v15, v16, v17);
      objc_msgSend_completeQuery_(v18, v19, (uint64_t)v10, v20);
    }
    else
    {
      uint64_t v18 = objc_msgSend_daemonQueryController(self, v7, v8, v9);
      uint64_t v22 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v21, @"com.apple.Messages.IMChatRegistryErrorDomain", 1, 0);
      objc_msgSend_failQuery_error_(v18, v23, (uint64_t)v10, (uint64_t)v22);
    }
  }
}

- (void)historyQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6 limit:(int64_t)a7
{
  uint64_t v97 = *MEMORY[0x1E4F143B8];
  id v81 = a3;
  id v80 = a4;
  id v78 = a5;
  id v79 = a6;
  uint64_t v13 = objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v13, v14, 0, v15)) == 0)
  {
    uint64_t v19 = objc_msgSend_sharedInstance(IMDaemonController, v16, v17, v18);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v19, v20, 0, v21)) == 0)
    {
      uint64_t v73 = objc_msgSend_sharedInstance(IMDaemonController, v22, v23, v24);
      int v76 = *MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v73, v74, 0, v75);

      if (!v76) {
        goto LABEL_38;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138413058;
      id v89 = v81;
      __int16 v90 = 2112;
      id v91 = v80;
      __int16 v92 = 2112;
      id v93 = v78;
      __int16 v94 = 1024;
      int v95 = objc_msgSend_count(v79, v28, v29, v30);
      _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "History query ID: %@   chatID: %@  service: %@  finished with results (%d)", buf, 0x26u);
    }
  }
  uint64_t v31 = objc_msgSend_existingChatWithGUID_(self, v25, (uint64_t)v80, v26);
  int v32 = IMOSLoggingEnabled();
  if (v31)
  {
    if (v32)
    {
      id v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v89 = v31;
        _os_log_impl(&dword_1A4AF7000, v36, OS_LOG_TYPE_INFO, "Found chat: %@", buf, 0xCu);
      }
    }
    uint64_t v37 = objc_msgSend_sharedInstance(IMAccountController, v33, v34, v35);
    objc_msgSend__enableCache(v37, v38, v39, v40);

    long long v86 = 0u;
    long long v87 = 0u;
    long long v84 = 0u;
    long long v85 = 0u;
    id v41 = v79;
    id v43 = 0;
    id v44 = 0;
    uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v84, (uint64_t)v96, 16);
    if (v45)
    {
      uint64_t v46 = *(void *)v85;
      do
      {
        uint64_t v47 = 0;
        id v48 = v43;
        do
        {
          if (*(void *)v85 != v46) {
            objc_enumerationMutation(v41);
          }
          long long v49 = *(void **)(*((void *)&v84 + 1) + 8 * v47);
          id v83 = v48;
          long long v50 = _IMBestAccountForIMMessageItemDictionary(v49, v31, 0, v48, &v83);
          id v43 = v83;

          IMMessageFromIMMessageItemDictionary = _CreateIMMessageFromIMMessageItemDictionary(v49, v50, 1);
          if (IMMessageFromIMMessageItemDictionary)
          {
            if (IMOSLoggingEnabled())
            {
              long long v54 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
              {
                *(_DWORD *)long long buf = 138412290;
                id v89 = IMMessageFromIMMessageItemDictionary;
                _os_log_impl(&dword_1A4AF7000, v54, OS_LOG_TYPE_DEBUG, "   => Created IMItem: %@", buf, 0xCu);
              }
            }
            if (!v44) {
              id v44 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            objc_msgSend__checkIfItemIsCorrupt_(self, v52, (uint64_t)IMMessageFromIMMessageItemDictionary, v53);
            if (!objc_msgSend_type(IMMessageFromIMMessageItemDictionary, v55, v56, v57))
            {
              __int16 v61 = objc_msgSend_message(IMMessageFromIMMessageItemDictionary, v58, v59, v60);
              _IMCheckMessageForDDResults(v61);
            }
            objc_msgSend_addObject_(v44, v58, (uint64_t)IMMessageFromIMMessageItemDictionary, v60);
          }

          ++v47;
          id v48 = v43;
        }
        while (v45 != v47);
        uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v62, (uint64_t)&v84, (uint64_t)v96, 16);
      }
      while (v45);
    }

    objc_msgSend__checkLimitAndSetMessagesToKeepLoadedIfNeeded_chat_(self, v63, a7, (uint64_t)v31);
    objc_msgSend__insertHistoricalMessages_queryID_isRefresh_isHistoryQuery_limit_(v31, v64, (uint64_t)v44, (uint64_t)v81, 0, 1, a7);
    uint64_t v68 = objc_msgSend_sharedInstance(IMAccountController, v65, v66, v67);
    objc_msgSend__disableCache(v68, v69, v70, v71);
  }
  else
  {
    if (v32)
    {
      id v72 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v89 = v81;
        __int16 v90 = 2112;
        id v91 = v80;
        _os_log_impl(&dword_1A4AF7000, v72, OS_LOG_TYPE_INFO, "Found no chat object for query: %@   chat ID: %@", buf, 0x16u);
      }
    }
    id v43 = 0;
  }
  objc_msgSend__completeChatLoadQueryWithChat_queryID_(self, v33, (uint64_t)v31, (uint64_t)v81);
  kdebug_trace();

LABEL_38:
}

- (void)pagedHistoryQuery:(id)a3 chatID:(id)a4 services:(id)a5 numberOfMessagesBefore:(int64_t)a6 numberOfMessagesAfter:(int64_t)a7 finishedWithResult:(id)a8 hasMessagesBefore:(BOOL)hasMoreMessagesToLoad hasMessagesAfter:(BOOL)hasMoreRecentMessagesToLoad
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v91 = a3;
  id v90 = a4;
  id v87 = a5;
  id v89 = a8;
  uint64_t v16 = objc_msgSend_sharedInstance(IMDaemonController, v13, v14, v15);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v16, v17, 0, v18)) == 0)
  {
    uint64_t v22 = objc_msgSend_sharedInstance(IMDaemonController, v19, v20, v21);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v22, v23, 0, v24)) == 0)
    {
      id v81 = objc_msgSend_sharedInstance(IMDaemonController, v25, v26, v27);
      int v84 = *MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v81, v82, 0, v83);

      if (!v84) {
        goto LABEL_43;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    uint64_t v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138413570;
      *(void *)char v99 = v91;
      *(_WORD *)&v99[8] = 2112;
      id v100 = v90;
      __int16 v101 = 2112;
      id v102 = v87;
      __int16 v103 = 1024;
      int v104 = objc_msgSend_count(v89, v31, v32, v33);
      __int16 v105 = 1024;
      int v106 = a6;
      __int16 v107 = 1024;
      int v108 = a7;
      _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Paged history query ID: %@ chatID: %@ service: %@ finished with results count: %d numberOfMessagesBefore: %d numberOfMessagesAfter: %d", buf, 0x32u);
    }
  }
  uint64_t v37 = objc_msgSend_existingChatWithGUID_(self, v28, (uint64_t)v90, v29);
  if (v37)
  {
    uint64_t v38 = objc_msgSend_sharedInstance(IMAccountController, v34, v35, v36);
    objc_msgSend__enableCache(v38, v39, v40, v41);

    long long v96 = 0u;
    long long v97 = 0u;
    long long v94 = 0u;
    long long v95 = 0u;
    id v42 = v89;
    id v44 = 0;
    id v45 = 0;
    uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v94, (uint64_t)v109, 16);
    if (v46)
    {
      uint64_t v47 = *(void *)v95;
      do
      {
        uint64_t v48 = 0;
        long long v49 = v44;
        do
        {
          if (*(void *)v95 != v47) {
            objc_enumerationMutation(v42);
          }
          long long v50 = *(void **)(*((void *)&v94 + 1) + 8 * v48);
          id v93 = v49;
          long long v51 = _IMBestAccountForIMMessageItemDictionary(v50, v37, 0, v49, &v93);
          id v44 = v93;

          IMMessageFromIMMessageItemDictionary = _CreateIMMessageFromIMMessageItemDictionary(v50, v51, 1);
          if (IMMessageFromIMMessageItemDictionary)
          {
            if (!v45) {
              id v45 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            }
            objc_msgSend__checkIfItemIsCorrupt_(self, v52, (uint64_t)IMMessageFromIMMessageItemDictionary, v53);
            if (!objc_msgSend_type(IMMessageFromIMMessageItemDictionary, v55, v56, v57))
            {
              __int16 v61 = objc_msgSend_message(IMMessageFromIMMessageItemDictionary, v58, v59, v60);
              _IMCheckMessageForDDResults(v61);
            }
            objc_msgSend_addObject_(v45, v58, (uint64_t)IMMessageFromIMMessageItemDictionary, v60);
          }

          ++v48;
          long long v49 = v44;
        }
        while (v46 != v48);
        uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v62, (uint64_t)&v94, (uint64_t)v109, 16);
      }
      while (v46);
    }

    if (IMOSLoggingEnabled())
    {
      uint64_t v66 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 67109376;
        *(_DWORD *)char v99 = a6;
        *(_WORD *)&v99[4] = 1024;
        *(_DWORD *)&v99[6] = a7;
        _os_log_impl(&dword_1A4AF7000, v66, OS_LOG_TYPE_INFO, "Paged history about to call insert historicalMessages numberOfMessagesBefore: %d numberOfMessagesAfter: %d", buf, 0xEu);
      }
    }
    BOOL v67 = a7 > 0 && a6 > 0;
    if (a6 <= 0) {
      hasMoreMessagesToLoad = objc_msgSend_hasMoreMessagesToLoad(v37, v63, v64, v65);
    }
    if (a7 <= 0) {
      hasMoreRecentMessagesToLoad = objc_msgSend_hasMoreRecentMessagesToLoad(v37, v63, v64, v65);
    }
    uint64_t v72 = objc_msgSend_count(v45, v63, v64, v65);
    HIBYTE(v85) = hasMoreRecentMessagesToLoad;
    LOBYTE(v85) = hasMoreMessagesToLoad;
    objc_msgSend__insertHistoricalMessages_queryID_isRefresh_isHistoryQuery_isReplacingItems_limit_hasMessagesBefore_hasMessagesAfter_(v37, v73, (uint64_t)v45, (uint64_t)v91, 0, 1, v67, v72, v85);
    uint64_t v77 = objc_msgSend_sharedInstance(IMAccountController, v74, v75, v76);
    objc_msgSend__disableCache(v77, v78, v79, v80);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v70 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)char v99 = v91;
        *(_WORD *)&v99[8] = 2112;
        id v100 = v90;
        _os_log_impl(&dword_1A4AF7000, v70, OS_LOG_TYPE_INFO, "Found no chat object for query: %@  chat ID: %@", buf, 0x16u);
      }
    }
    id v44 = 0;
  }
  objc_msgSend__completeChatLoadQueryWithChat_queryID_(self, v69, (uint64_t)v37, (uint64_t)v91);

LABEL_43:
}

- (void)attachmentQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v17, v18, 0, v19)) == 0)
  {
    uint64_t v23 = objc_msgSend_sharedInstance(IMDaemonController, v20, v21, v22);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v23, v24, 0, v25)) == 0)
    {
      uint64_t v53 = objc_msgSend_sharedInstance(IMDaemonController, v26, v27, v28);
      int v56 = *MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v53, v54, 0, v55);

      if (!v56) {
        goto LABEL_20;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    uint64_t v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138413058;
      id v60 = v10;
      __int16 v61 = 2112;
      id v62 = v11;
      __int16 v63 = 2112;
      id v64 = v12;
      __int16 v65 = 1024;
      int v66 = objc_msgSend_count(v13, v32, v33, v34);
      _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "Media attachment filenames query ID: %@   chatID: %@  service: %@  finished with results (%d)", buf, 0x26u);
    }
  }
  uint64_t v35 = objc_msgSend_existingChatWithGUID_(self, v29, (uint64_t)v11, v30);
  int v36 = IMOSLoggingEnabled();
  if (v35)
  {
    if (v36)
    {
      uint64_t v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v60 = v35;
        _os_log_impl(&dword_1A4AF7000, v38, OS_LOG_TYPE_INFO, "Found chat: %@", buf, 0xCu);
      }
    }
    id v39 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v43 = objc_msgSend_count(v13, v40, v41, v42);
    uint64_t v46 = objc_msgSend_initWithCapacity_(v39, v44, v43, v45);
    v57[0] = MEMORY[0x1E4F143A8];
    v57[1] = 3221225472;
    v57[2] = sub_1A4C5D2AC;
    v57[3] = &unk_1E5B7F148;
    id v58 = v46;
    id v47 = v46;
    objc_msgSend_enumerateObjectsUsingBlock_(v13, v48, (uint64_t)v57, v49);
    objc_msgSend__setAttachments_(v35, v50, (uint64_t)v47, v51);
  }
  else if (v36)
  {
    long long v52 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      id v60 = v10;
      __int16 v61 = 2112;
      id v62 = v11;
      _os_log_impl(&dword_1A4AF7000, v52, OS_LOG_TYPE_INFO, "Found no chat object for query: %@   chat ID: %@", buf, 0x16u);
    }
  }
  objc_msgSend__completeChatLoadQueryWithChat_queryID_(self, v37, (uint64_t)v35, (uint64_t)v10);

LABEL_20:
}

- (void)uncachedAttachmentCountQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v17, v18, 0, v19)) == 0)
  {
    uint64_t v23 = objc_msgSend_sharedInstance(IMDaemonController, v20, v21, v22);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v23, v24, 0, v25)) == 0)
    {
      uint64_t v41 = objc_msgSend_sharedInstance(IMDaemonController, v26, v27, v28);
      int v44 = *MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v41, v42, 0, v43);

      if (!v44) {
        goto LABEL_20;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    uint64_t v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      int v45 = 138413058;
      id v46 = v10;
      __int16 v47 = 2112;
      id v48 = v11;
      __int16 v49 = 2112;
      id v50 = v12;
      __int16 v51 = 2048;
      uint64_t v52 = objc_msgSend_unsignedLongValue(v13, v32, v33, v34);
      _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "Media attachment uncached count query ID: %@   chatID: %@  service: %@  finished with results (%lu)", (uint8_t *)&v45, 0x2Au);
    }
  }
  uint64_t v35 = objc_msgSend_existingChatWithGUID_(self, v29, (uint64_t)v11, v30);
  int v36 = IMOSLoggingEnabled();
  if (v35)
  {
    if (v36)
    {
      id v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        int v45 = 138412290;
        id v46 = v35;
        _os_log_impl(&dword_1A4AF7000, v39, OS_LOG_TYPE_INFO, "Found chat: %@", (uint8_t *)&v45, 0xCu);
      }
    }
    objc_msgSend__setCountOfAttachmentsNotCachedLocally_(v35, v37, (uint64_t)v13, v38);
  }
  else if (v36)
  {
    uint64_t v40 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      int v45 = 138412546;
      id v46 = v10;
      __int16 v47 = 2112;
      id v48 = v11;
      _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "Found no chat object for query: %@   chat ID: %@", (uint8_t *)&v45, 0x16u);
    }
  }
  objc_msgSend__completeChatLoadQueryWithChat_queryID_(self, v37, (uint64_t)v35, (uint64_t)v10);

LABEL_20:
}

- (id)_chatForIdentifiers:(id)a3
{
  id v4 = a3;
  uint64_t v10 = 0;
  id v11 = &v10;
  uint64_t v12 = 0x3032000000;
  id v13 = sub_1A4B345EC;
  uint64_t v14 = sub_1A4B343DC;
  id v15 = 0;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1A4C5D830;
  v9[3] = &unk_1E5B7F170;
  void v9[4] = self;
  v9[5] = &v10;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v5, (uint64_t)v9, v6);
  id v7 = (id)v11[5];
  _Block_object_dispose(&v10, 8);

  return v7;
}

- (void)finishedDownloadingPurgedAssetsForChatIDs:(id)a3
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedInstance(IMDaemonController, v5, v6, v7);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v8, v9, 0, v10)) == 0)
  {
    uint64_t v14 = objc_msgSend_sharedInstance(IMDaemonController, v11, v12, v13);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v14, v15, 0, v16)) == 0)
    {
      uint64_t v29 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
      int v32 = *MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v29, v30, 0, v31);

      if (!v32) {
        goto LABEL_12;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v33 = 138412290;
      id v34 = v4;
      _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "Media attachment download purged assets for chatIDs: %@  finished.", (uint8_t *)&v33, 0xCu);
    }
  }
  uint64_t v26 = objc_msgSend__chatForIdentifiers_(self, v20, (uint64_t)v4, v21);
  if (v26)
  {
    uint64_t v27 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v23, v24, v25);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v27, v28, @"__kIMChatPurgedAttachmentsDownloadCompleteNotification", (uint64_t)v26, 0);
  }
LABEL_12:
}

- (void)downloadedPurgedAssetBatchForChatIDs:(id)a3 completedTransferGUIDs:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v11 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v11, v12, 0, v13)) == 0)
  {
    uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v17, v18, 0, v19)) == 0)
    {
      uint64_t v35 = objc_msgSend_sharedInstance(IMDaemonController, v20, v21, v22);
      int v38 = *MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v35, v36, 0, v37);

      if (!v38) {
        goto LABEL_15;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v42 = v6;
      _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Media attachment download purged assets batch for chatIDs: %@  finished.", buf, 0xCu);
    }
  }
  uint64_t v27 = objc_msgSend__chatForIdentifiers_(self, v23, (uint64_t)v6, v24);
  if (v27)
  {
    if (v7) {
      id v28 = v7;
    }
    else {
      id v28 = (id)MEMORY[0x1E4F1CBF0];
    }
    id v39 = @"completedTransferGUIDs";
    id v40 = v28;
    uint64_t v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v26, (uint64_t)&v40, (uint64_t)&v39, 1);
    int v33 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v30, v31, v32);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v33, v34, @"__kIMChatPurgedAttachmentsDownloadBatchCompleteNotification", (uint64_t)v27, v29);
  }
LABEL_15:
}

- (void)isDownloadingQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  uint64_t v16 = objc_msgSend_sharedInstance(IMDaemonController, v13, v14, v15);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v16, v17, 0, v18)) == 0)
  {
    uint64_t v22 = objc_msgSend_sharedInstance(IMDaemonController, v19, v20, v21);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v22, v23, 0, v24)) == 0)
    {
      uint64_t v37 = objc_msgSend_sharedInstance(IMDaemonController, v25, v26, v27);
      int v40 = *MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v37, v38, 0, v39);

      if (!v40) {
        goto LABEL_20;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    uint64_t v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      int v41 = 138413058;
      id v42 = v10;
      __int16 v43 = 2112;
      id v44 = v11;
      __int16 v45 = 2112;
      id v46 = v12;
      __int16 v47 = 1024;
      BOOL v48 = v6;
      _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Media attachment is downloading purged assets query ID: %@   chatID: %@  service: %@  finished with results (%i)", (uint8_t *)&v41, 0x26u);
    }
  }
  uint64_t v31 = objc_msgSend_existingChatWithGUID_(self, v28, (uint64_t)v11, v29);
  int v32 = IMOSLoggingEnabled();
  if (v31)
  {
    if (v32)
    {
      uint64_t v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        int v41 = 138412290;
        id v42 = v31;
        _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "Found chat: %@", (uint8_t *)&v41, 0xCu);
      }
    }
    objc_msgSend__setIsDownloadingPurgedAssets_(v31, v33, v6, v34);
  }
  else if (v32)
  {
    int v36 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
    {
      int v41 = 138412546;
      id v42 = v10;
      __int16 v43 = 2112;
      id v44 = v11;
      _os_log_impl(&dword_1A4AF7000, v36, OS_LOG_TYPE_INFO, "Found no chat object for query: %@   chat ID: %@", (uint8_t *)&v41, 0x16u);
    }
  }
  objc_msgSend__completeChatLoadQueryWithChat_queryID_(self, v33, (uint64_t)v31, (uint64_t)v10);

LABEL_20:
}

- (void)markAsSpamQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v17 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v17, v18, 0, v19)) == 0)
  {
    uint64_t v23 = objc_msgSend_sharedInstance(IMDaemonController, v20, v21, v22);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v23, v24, 0, v25)) == 0)
    {
      int v38 = objc_msgSend_sharedInstance(IMDaemonController, v26, v27, v28);
      int v41 = *MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v38, v39, 0, v40);

      if (!v41) {
        goto LABEL_20;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    uint64_t v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      int v42 = 138413058;
      id v43 = v10;
      __int16 v44 = 2112;
      id v45 = v11;
      __int16 v46 = 2112;
      id v47 = v12;
      __int16 v48 = 2112;
      id v49 = v13;
      _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "Mark as Spam query ID: %@   chatID: %@  service: %@  finished with results (%@)", (uint8_t *)&v42, 0x2Au);
    }
  }
  int v32 = objc_msgSend_existingChatWithGUID_(self, v29, (uint64_t)v11, v30);
  int v33 = IMOSLoggingEnabled();
  if (v32)
  {
    if (v33)
    {
      int v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        int v42 = 138412290;
        id v43 = v32;
        _os_log_impl(&dword_1A4AF7000, v36, OS_LOG_TYPE_INFO, "Found chat: %@", (uint8_t *)&v42, 0xCu);
      }
    }
    objc_msgSend__setCountOfMessagesMarkedAsSpam_(v32, v34, (uint64_t)v13, v35);
  }
  else if (v33)
  {
    uint64_t v37 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      int v42 = 138412546;
      id v43 = v10;
      __int16 v44 = 2112;
      id v45 = v11;
      _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "Found no chat object for query: %@   chat ID: %@", (uint8_t *)&v42, 0x16u);
    }
  }
  objc_msgSend__completeChatLoadQueryWithChat_queryID_(self, v34, (uint64_t)v32, (uint64_t)v10);

LABEL_20:
}

- (void)frequentRepliesQuery:(id)a3 chatID:(id)a4 services:(id)a5 finishedWithResult:(id)a6 limit:(int64_t)a7
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  uint64_t v18 = objc_msgSend_sharedInstance(IMDaemonController, v15, v16, v17);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v18, v19, 0, v20)) == 0)
  {
    uint64_t v24 = objc_msgSend_sharedInstance(IMDaemonController, v21, v22, v23);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v24, v25, 0, v26)) == 0)
    {
      __int16 v51 = objc_msgSend_sharedInstance(IMDaemonController, v27, v28, v29);
      int v54 = *MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v51, v52, 0, v53);

      if (!v54) {
        goto LABEL_12;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  uint64_t v35 = objc_msgSend_existingChatWithGUID_(self, v30, (uint64_t)v12, v31);
  if (v35)
  {
    int v36 = objc_msgSend_sharedInstance(IMAccountController, v32, v33, v34);
    objc_msgSend__enableCache(v36, v37, v38, v39);

    objc_msgSend_setFrequentReplies_(v35, v40, (uint64_t)v14, v41);
    id v45 = objc_msgSend_sharedInstance(IMAccountController, v42, v43, v44);
    objc_msgSend__disableCache(v45, v46, v47, v48);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v50 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
    {
      int v55 = 138412546;
      id v56 = v11;
      __int16 v57 = 2112;
      id v58 = v12;
      _os_log_impl(&dword_1A4AF7000, v50, OS_LOG_TYPE_INFO, "Found no chat object for frequent replies query: %@   chat ID: %@", (uint8_t *)&v55, 0x16u);
    }
  }
  objc_msgSend__completeChatLoadQueryWithChat_queryID_(self, v49, (uint64_t)v35, (uint64_t)v11);

LABEL_12:
}

- (void)_automation_markAsReadQuery:(id)a3 finishedWithResult:(BOOL)a4
{
  id v30 = a3;
  uint64_t v8 = objc_msgSend_sharedInstance(IMDaemonController, v5, v6, v7);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v8, v9, 0, v10)) != 0) {
    goto LABEL_4;
  }
  id v14 = objc_msgSend_sharedInstance(IMDaemonController, v11, v12, v13);
  if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v14, v15, 0, v16)) != 0)
  {

LABEL_4:
LABEL_5:
    uint64_t v23 = objc_msgSend_daemonQueryController(self, v20, v21, v22);
    objc_msgSend_completeQuery_(v23, v24, (uint64_t)v30, v25);

    goto LABEL_6;
  }
  uint64_t v26 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
  int v29 = *MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v26, v27, 0, v28);

  if (v29) {
    goto LABEL_5;
  }
LABEL_6:
}

- (void)chatsNeedRemerging:(id)a3 groupedChats:(id)a4
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v61 = a3;
  id v59 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Chats need re-merging notification", buf, 2u);
    }
  }
  if ((unint64_t)objc_msgSend_count(v61, v6, v7, v8, v59) < 2)
  {
    if (objc_msgSend_count(v61, v10, v11, v12) == 1)
    {
      __int16 v46 = objc_msgSend_lastObject(v61, v43, v44, v45);
      id v49 = objc_msgSend_existingChatWithGUID_(self, v47, (uint64_t)v46, v48);
      uint64_t v53 = objc_msgSend_firstObject(v60, v50, v51, v52);
      id v56 = objc_msgSend_objectForKey_(v53, v54, *MEMORY[0x1E4F6CE00], v55);
      objc_msgSend__updatePersonCentricIDToChatMapForChat_toNewPersonCentricID_(self, v57, (uint64_t)v49, (uint64_t)v56);
    }
    if (IMOSLoggingEnabled())
    {
      id v58 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A4AF7000, v58, OS_LOG_TYPE_INFO, "One GUID presented to merge, not remerging!", buf, 2u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v72 = (uint64_t)v61;
        _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Asked to remerge %@", buf, 0xCu);
      }
    }
    uint64_t v18 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v13, v14, v15);
    id v19 = v61;
    if (!v61) {
      id v19 = (id)MEMORY[0x1E4F1CBF0];
    }
    uint64_t v69 = @"__kIMChatRegistryGUIDListKey";
    id v70 = v19;
    uint64_t v20 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v17, (uint64_t)&v70, (uint64_t)&v69, 1);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v18, v21, @"__kIMChatRegistryWillRemergeChatsNotification", (uint64_t)self, v20);

    long long v64 = 0u;
    long long v65 = 0u;
    long long v62 = 0u;
    long long v63 = 0u;
    id v22 = v61;
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v62, (uint64_t)v68, 16);
    if (v24)
    {
      uint64_t v25 = *(void *)v63;
      do
      {
        for (uint64_t i = 0; i != v24; ++i)
        {
          if (*(void *)v63 != v25) {
            objc_enumerationMutation(v22);
          }
          uint64_t v27 = *(void *)(*((void *)&v62 + 1) + 8 * i);
          if (IMOSLoggingEnabled())
          {
            id v30 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v72 = v27;
              _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Unregistering chat guid %@", buf, 0xCu);
            }
          }
          objc_msgSend__unregisterChatWithGUID_(self, v28, v27, v29);
        }
        uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v31, (uint64_t)&v62, (uint64_t)v68, 16);
      }
      while (v24);
    }

    uint64_t v34 = objc_msgSend__copyMergedChatsPairedArrayFromMergedChatsArray_(self, v32, (uint64_t)v60, v33);
    sub_1A4B163C8(self, v34, 0);
    uint64_t v39 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v35, v36, v37);
    int v66 = @"__kIMChatRegistryMergedPairsListKey";
    uint64_t v40 = (void *)MEMORY[0x1E4F1CBF0];
    if (v34) {
      uint64_t v40 = v34;
    }
    uint64_t v67 = v40;
    uint64_t v41 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v38, (uint64_t)&v67, (uint64_t)&v66, 1);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v39, v42, @"__kIMChatRegistryDidRemergeChatsNotification", (uint64_t)self, v41);
  }
}

- (void)_handleChatReconstructions:(id)a3
{
  uint64_t v82 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  uint64_t v7 = objc_msgSend_sharedInstance(IMDaemonController, v4, v5, v6);
  int v10 = *MEMORY[0x1E4F6C548] & objc_msgSend_capabilitiesForListenerID_(v7, v8, 0, v9);

  if (v10)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Bailing out of handle chat reconstructions due to kFZListenerCapPaginatedChatRegistry", buf, 2u);
      }
LABEL_13:

      goto LABEL_14;
    }
    goto LABEL_14;
  }
  uint64_t v15 = objc_msgSend_sharedInstance(IMDaemonController, v11, v12, v13);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v15, v16, 0, v17)) == 0)
  {
    uint64_t v21 = objc_msgSend_sharedInstance(IMDaemonController, v18, v19, v20);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v21, v22, 0, v23)) == 0)
    {
      int v42 = objc_msgSend_sharedInstance(IMDaemonController, v24, v25, v26);
      int v45 = *MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v42, v43, 0, v44);

      if (!v45)
      {
        if (IMOSLoggingEnabled())
        {
          id v49 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1A4AF7000, v49, OS_LOG_TYPE_INFO, "Clearing chat registry", buf, 2u);
          }
        }
        uint64_t v50 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v46, v47, v48);
        objc_msgSend___mainThreadPostNotificationName_object_(v50, v51, @"__kIMChatRegistryWillLoadNotification", 0);

        long long v77 = 0u;
        long long v78 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        uint64_t v55 = objc_msgSend_cachedChats(self, v52, v53, v54);
        id v59 = objc_msgSend_copy(v55, v56, v57, v58);

        uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v60, (uint64_t)&v75, (uint64_t)v79, 16);
        if (v61)
        {
          uint64_t v62 = *(void *)v76;
          do
          {
            for (uint64_t i = 0; i != v61; ++i)
            {
              if (*(void *)v76 != v62) {
                objc_enumerationMutation(v59);
              }
              uint64_t v64 = *(void *)(*((void *)&v75 + 1) + 8 * i);
              if (IMOSLoggingEnabled())
              {
                uint64_t v67 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)long long buf = 138412290;
                  uint64_t v81 = v64;
                  _os_log_impl(&dword_1A4AF7000, v67, OS_LOG_TYPE_INFO, " => Unregistering chat: %@", buf, 0xCu);
                }
              }
              objc_msgSend__unregisterChat_(self, v65, v64, v66);
            }
            uint64_t v61 = objc_msgSend_countByEnumeratingWithState_objects_count_(v59, v68, (uint64_t)&v75, (uint64_t)v79, 16);
          }
          while (v61);
        }

        uint64_t v72 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v69, v70, v71);
        objc_msgSend___mainThreadPostNotificationName_object_(v72, v73, @"__kIMChatRegistryDidLoadNotification", 0);

        goto LABEL_14;
      }
      goto LABEL_10;
    }
  }
LABEL_10:
  id v30 = objc_msgSend_cachedChats(self, v27, v28, v29);
  objc_msgSend_setPreExistingAllChats_(self, v31, (uint64_t)v30, v32);

  uint64_t v36 = objc_msgSend_chatGUIDToInfoMap(self, v33, v34, v35);
  objc_msgSend_removeAllObjects(v36, v37, v38, v39);

  objc_msgSend___handleChatReconstructions_(self, v40, (uint64_t)v74, v41);
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Not doing 2 step chat registry load", buf, 2u);
    }
    goto LABEL_13;
  }
LABEL_14:
}

- (void)__handleChatReconstructions:(id)a3
{
  uint64_t v331 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "Restoring chats", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      MarcoLoggingStringForMessageData();
      id v9 = (id)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)long long buf = 138412290;
      id v330 = v9;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEBUG, " => chats: %@", buf, 0xCu);
    }
  }
  v290 = objc_msgSend_IMCoreSetupTimingCollection(MEMORY[0x1E4F6C3F8], v5, v6, v7);
  objc_msgSend_startTimingForKey_(v290, v10, @"IMCoreSetup: ChatReconstruction", v11);
  objc_msgSend_setLoading_(self, v12, 1, v13);
  int isFirstLoad = objc_msgSend_isFirstLoad(self, v14, v15, v16);
  id v292 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v289 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v293 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v20 = objc_msgSend_cachedChats(self, v17, v18, v19);
  objc_msgSend_addObjectsFromArray_(v292, v21, (uint64_t)v20, v22);

  objc_msgSend__resetChatReconstructionGroupMaps(self, v23, v24, v25);
  uint64_t v29 = objc_msgSend_groupIDToChatMap(self, v26, v27, v28);
  objc_msgSend_removeAllObjects(v29, v30, v31, v32);

  long long v323 = 0u;
  long long v324 = 0u;
  long long v321 = 0u;
  long long v322 = 0u;
  id obj = v3;
  uint64_t v296 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v33, (uint64_t)&v321, (uint64_t)v328, 16);
  if (!v296)
  {
    char v300 = 0;
    goto LABEL_110;
  }
  char v300 = 0;
  unsigned int v288 = isFirstLoad ^ 1;
  uint64_t v294 = *MEMORY[0x1E4F6CDB0];
  uint64_t v295 = *(void *)v322;
  do
  {
    for (uint64_t i = 0; i != v296; ++i)
    {
      if (*(void *)v322 != v295) {
        objc_enumerationMutation(obj);
      }
      v303 = *(void **)(*((void *)&v321 + 1) + 8 * i);
      v304 = objc_msgSend_objectForKey_(v303, v34, @"guid", v35);
      uint64_t v39 = objc_msgSend__cachedChatWithGUID_(self, v37, (uint64_t)v304, v38);
      v302 = objc_msgSend_objectForKey_(v303, v40, v294, v41);
      if (!v39)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v70 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1A4AF7000, v70, OS_LOG_TYPE_INFO, " => no existing chat, we'll create one", buf, 2u);
          }
        }
        id v71 = v302;
        id v72 = v303;
        if (objc_msgSend_count(v71, v73, v74, v75))
        {
          long long v78 = objc_msgSend_objectForKey_(v71, v76, @"accountID", v77);
          uint64_t v81 = objc_msgSend_objectForKey_(v71, v79, @"account", v80);
          long long v86 = objc_msgSend_objectForKey_(v71, v82, @"serviceName", v83);
          if (v78)
          {
            if (v81) {
              goto LABEL_34;
            }
LABEL_40:
            uint64_t v81 = objc_msgSend_objectForKey_(v72, v84, @"account", v85);
            if (!v86) {
              goto LABEL_41;
            }
LABEL_42:
            objc_msgSend_serviceWithInternalName_(IMServiceImpl, v84, (uint64_t)v86, v85);
            id v99 = (id)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            long long v78 = objc_msgSend_objectForKey_(v72, v84, @"accountID", v85);
            if (!v81) {
              goto LABEL_40;
            }
LABEL_34:
            if (v86) {
              goto LABEL_42;
            }
LABEL_41:
            long long v86 = objc_msgSend_objectForKey_(v72, v84, @"serviceName", v85);
            if (v86) {
              goto LABEL_42;
            }
            id v99 = 0;
          }
          id v100 = objc_msgSend_sharedInstance(IMAccountController, v84, v98, v85);
          id v102 = objc_msgSend_bestAccountForService_login_guid_(v100, v101, (uint64_t)v99, (uint64_t)v81, v78);

          IMMessageFromIMMessageItemDictionary = _CreateIMMessageFromIMMessageItemDictionary(v71, v102, 1);
        }
        else
        {
          IMMessageFromIMMessageItemDictionary = 0;
        }
        id v90 = IMMessageFromIMMessageItemDictionary;

        if (v90)
        {
          objc_msgSend__checkIfItemIsCorrupt_(self, v103, (uint64_t)v90, v104);
          id v298 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          objc_msgSend_addObject_(v298, v105, (uint64_t)v90, v106);
        }
        else
        {
          id v298 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        char v320 = 0;
        id v319 = 0;
        uint64_t v39 = sub_1A4B19928(self, v72, v298, 1, &v320, &v319);
        id v297 = v319;
        if (v320)
        {
          objc_msgSend__startTiming_(v39, v107, (uint64_t)v290, v108);
          objc_msgSend_addObject_(v289, v109, (uint64_t)v39, v110);
          uint64_t v111 = self;
          if ((v300 & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              long long v115 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_1A4AF7000, v115, OS_LOG_TYPE_INFO, "** Posting will load notification", buf, 2u);
              }
            }
            uint64_t v116 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v112, v113, v114);
            objc_msgSend___mainThreadPostNotificationName_object_(v116, v117, @"__kIMChatRegistryWillLoadNotification", (uint64_t)v111);
          }
          if (IMOSLoggingEnabled())
          {
            long long v119 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v119, OS_LOG_TYPE_DEBUG))
            {
              objc_msgSend_guid(v39, v120, v121, v122);
              id v123 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)long long buf = 138412290;
              id v330 = v123;
              _os_log_impl(&dword_1A4AF7000, v119, OS_LOG_TYPE_DEBUG, "   Loaded chat: %@", buf, 0xCu);
            }
          }
          objc_msgSend__registerChatDictionary_forChat_isIncoming_newGUID_shouldPostNotification_(v111, v118, (uint64_t)v72, (uint64_t)v39, 0, v297, 0);
          char v300 = 1;
          goto LABEL_99;
        }
        if (IMOSLoggingEnabled())
        {
          BOOL v126 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v126, OS_LOG_TYPE_INFO))
          {
            objc_msgSend_guid(v39, v127, v128, v129);
            id v130 = (id)objc_claimAutoreleasedReturnValue();
            *(_DWORD *)long long buf = 138412290;
            id v330 = v130;
            _os_log_impl(&dword_1A4AF7000, v126, OS_LOG_TYPE_INFO, "Not registering: %@, already existing", buf, 0xCu);
          }
        }
        objc_msgSend__registerChatDictionary_forChat_isIncoming_newGUID_shouldPostNotification_(self, v125, (uint64_t)v72, (uint64_t)v39, 0, v297, 0);
        objc_msgSend_removeObjectIdenticalTo_(v292, v131, (uint64_t)v39, v132);
        id v133 = v90;
        id v134 = v39;
        long long v138 = objc_msgSend__lastMessage(v134, v135, v136, v137);
        long long v142 = v138;
        if (v138)
        {
          if (objc_msgSend_messageID(v138, v139, v140, v141) && objc_msgSend_messageID(v133, v143, v144, v145))
          {
            uint64_t v146 = objc_msgSend_time(v133, v143, v144, v145);
            __int16 v150 = objc_msgSend_time(v142, v147, v148, v149);
            BOOL v153 = objc_msgSend_compare_(v146, v151, (uint64_t)v150, v152) == 1;

            if (!v153)
            {
LABEL_99:
              objc_msgSend__updateInfo_forGUID_updatingUnreadCount_(self, v124, (uint64_t)v72, (uint64_t)v304, 1);
              if (v39 && (objc_msgSend_containsObjectIdenticalTo_(v293, v204, (uint64_t)v39, v205) & 1) == 0) {
                objc_msgSend_addObject_(v293, v206, (uint64_t)v39, v207);
              }

              goto LABEL_103;
            }
LABEL_98:
            objc_msgSend__insertHistoricalMessages_queryID_isRefresh_isHistoryQuery_(v134, v124, (uint64_t)v298, @"Reconstruction", v288, 0);
            goto LABEL_99;
          }
          if (objc_msgSend_messageID(v142, v143, v144, v145) || !objc_msgSend_messageID(v133, v191, v192, v193))
          {
            if (objc_msgSend_messageID(v142, v191, v192, v193)) {
              objc_msgSend_messageID(v133, v194, v195, v196);
            }

            goto LABEL_99;
          }
        }

        goto LABEL_98;
      }
      if (!objc_msgSend_wantsHistoryReload(self, v42, v43, v44))
      {
        objc_msgSend__registerChatDictionary_forChat_isIncoming_newGUID_shouldPostNotification_(self, v45, (uint64_t)v303, (uint64_t)v39, 0, v304, 0);
        objc_msgSend__updateInfo_forGUID_updatingUnreadCount_(self, v87, (uint64_t)v303, (uint64_t)v304, 1);
        objc_msgSend_removeObjectIdenticalTo_(v292, v88, (uint64_t)v39, v89);
        id v90 = 0;
        objc_msgSend__checkIfItemIsCorrupt_(self, v91, 0, v92);
        goto LABEL_104;
      }
      __int16 v46 = self;
      if ((v300 & 1) == 0)
      {
        uint64_t v47 = (uint64_t)v46;
        if (IMOSLoggingEnabled())
        {
          uint64_t v51 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1A4AF7000, v51, OS_LOG_TYPE_INFO, "** Posting will load notification", buf, 2u);
          }
        }
        uint64_t v52 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v48, v49, v50);
        objc_msgSend___mainThreadPostNotificationName_object_(v52, v53, @"__kIMChatRegistryWillLoadNotification", v47);

        __int16 v46 = (IMChatRegistry *)v47;
      }
      v301 = v46;

      id v54 = v302;
      id v55 = v303;
      if (!objc_msgSend_count(v54, v56, v57, v58))
      {
        long long v97 = 0;
        goto LABEL_73;
      }
      uint64_t v61 = objc_msgSend_objectForKey_(v54, v59, @"accountID", v60);
      uint64_t v64 = objc_msgSend_objectForKey_(v54, v62, @"account", v63);
      uint64_t v69 = objc_msgSend_objectForKey_(v54, v65, @"serviceName", v66);
      if (v61)
      {
        if (v64) {
          goto LABEL_25;
        }
      }
      else
      {
        uint64_t v61 = objc_msgSend_objectForKey_(v55, v67, @"accountID", v68);
        if (v64)
        {
LABEL_25:
          if (v69) {
            goto LABEL_71;
          }
          goto LABEL_70;
        }
      }
      uint64_t v64 = objc_msgSend_objectForKey_(v55, v67, @"account", v68);
      if (v69) {
        goto LABEL_71;
      }
LABEL_70:
      uint64_t v69 = objc_msgSend_objectForKey_(v55, v67, @"serviceName", v68);
      if (!v69)
      {
        id v155 = 0;
        goto LABEL_72;
      }
LABEL_71:
      objc_msgSend_serviceWithInternalName_(IMServiceImpl, v67, (uint64_t)v69, v68);
      id v155 = (id)objc_claimAutoreleasedReturnValue();

LABEL_72:
      uint64_t v156 = objc_msgSend_sharedInstance(IMAccountController, v67, v154, v68);
      uint64_t v158 = objc_msgSend_bestAccountForService_login_guid_(v156, v157, (uint64_t)v155, (uint64_t)v64, v61);

      long long v97 = _CreateIMMessageFromIMMessageItemDictionary(v54, v158, 1);
LABEL_73:
      id v90 = v97;

      if (v90)
      {
        objc_msgSend__checkIfItemIsCorrupt_(v301, v159, (uint64_t)v90, v160);
        id v161 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        objc_msgSend_addObject_(v161, v162, (uint64_t)v90, v163);
        id v164 = v90;
        id v165 = v39;
        uint64_t v169 = objc_msgSend__lastMessage(v165, v166, v167, v168);
        uint64_t v173 = v169;
        if (v169)
        {
          if (objc_msgSend_messageID(v169, v170, v171, v172) && objc_msgSend_messageID(v164, v174, v175, v176))
          {
            uint64_t v177 = objc_msgSend_time(v164, v174, v175, v176);
            id v181 = objc_msgSend_time(v173, v178, v179, v180);
            BOOL v299 = objc_msgSend_compare_(v177, v182, (uint64_t)v181, v183) == 1;

            if (!v299) {
              goto LABEL_91;
            }
            goto LABEL_90;
          }
          if (objc_msgSend_messageID(v173, v174, v175, v176) || !objc_msgSend_messageID(v164, v185, v186, v187))
          {
            if (objc_msgSend_messageID(v173, v185, v186, v187)) {
              objc_msgSend_messageID(v164, v188, v189, v190);
            }

            goto LABEL_91;
          }
        }

LABEL_90:
        objc_msgSend__insertHistoricalMessages_queryID_isRefresh_isHistoryQuery_(v165, v184, (uint64_t)v161, @"Reconstruction", v288, 0);
LABEL_91:
      }
      objc_msgSend__registerChatDictionary_forChat_isIncoming_newGUID_shouldPostNotification_(v301, v159, (uint64_t)v55, (uint64_t)v39, 0, v304, 0);
      objc_msgSend__updateInfo_forGUID_updatingUnreadCount_(v301, v197, (uint64_t)v55, (uint64_t)v304, 1);
      if ((objc_msgSend_containsObjectIdenticalTo_(v293, v198, (uint64_t)v39, v199) & 1) == 0) {
        objc_msgSend_addObject_(v293, v200, (uint64_t)v39, v201);
      }
      objc_msgSend_removeObjectIdenticalTo_(v292, v200, (uint64_t)v39, v201);
      char v300 = 1;
LABEL_103:
      objc_msgSend__checkIfItemIsCorrupt_(self, v202, (uint64_t)v90, v203);
LABEL_104:
      id v208 = objc_msgSend_service(v90, v93, v94, v95);
      long long v212 = objc_msgSend_iMessageService(IMServiceImpl, v209, v210, v211);
      v216 = objc_msgSend_internalName(v212, v213, v214, v215);
      int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v208, v217, (uint64_t)v216, v218);

      if (isEqualToIgnoringCase) {
        objc_msgSend__setChatHasCommunicatedOveriMessage_(self, v220, (uint64_t)v39, v221);
      }
      uint64_t v222 = objc_msgSend__winningJoinStateForExistingChat_incomingDictionary_(self, v220, (uint64_t)v39, (uint64_t)v303);
      objc_msgSend__setJoinState_(v39, v223, v222, v224);
    }
    uint64_t v296 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v34, (uint64_t)&v321, (uint64_t)v328, 16);
  }
  while (v296);
LABEL_110:

  objc_msgSend_startTimingForKey_(v290, v225, @"IMCoreSetup: Updating unread counts", v226);
  long long v317 = 0u;
  long long v318 = 0u;
  long long v315 = 0u;
  long long v316 = 0u;
  id v227 = v293;
  uint64_t v231 = objc_msgSend_countByEnumeratingWithState_objects_count_(v227, v228, (uint64_t)&v315, (uint64_t)v327, 16);
  if (v231)
  {
    uint64_t v232 = *(void *)v316;
    do
    {
      for (uint64_t j = 0; j != v231; ++j)
      {
        if (*(void *)v316 != v232) {
          objc_enumerationMutation(v227);
        }
        objc_msgSend__updateUnreadCountForChat_(self, v229, *(void *)(*((void *)&v315 + 1) + 8 * j), v230);
      }
      uint64_t v231 = objc_msgSend_countByEnumeratingWithState_objects_count_(v227, v229, (uint64_t)&v315, (uint64_t)v327, 16);
    }
    while (v231);
  }

  objc_msgSend_stopTimingForKey_(v290, v234, @"IMCoreSetup: Updating unread counts", v235);
  if (IMOSLoggingEnabled())
  {
    v236 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v236, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v330 = v292;
      _os_log_impl(&dword_1A4AF7000, v236, OS_LOG_TYPE_INFO, "Removing stale chats: %@", buf, 0xCu);
    }
  }
  long long v313 = 0u;
  long long v314 = 0u;
  long long v311 = 0u;
  long long v312 = 0u;
  id v237 = v292;
  uint64_t v242 = objc_msgSend_countByEnumeratingWithState_objects_count_(v237, v238, (uint64_t)&v311, (uint64_t)v326, 16);
  if (v242)
  {
    uint64_t v243 = *(void *)v312;
    do
    {
      for (uint64_t k = 0; k != v242; ++k)
      {
        if (*(void *)v312 != v243) {
          objc_enumerationMutation(v237);
        }
        v245 = *(void **)(*((void *)&v311 + 1) + 8 * k);
        if (objc_msgSend_joinState(v245, v239, v240, v241) == 2)
        {
          if (IMOSLoggingEnabled())
          {
            v246 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v246, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl(&dword_1A4AF7000, v246, OS_LOG_TYPE_INFO, "We're in process of joining, let's keep this around", buf, 2u);
            }
          }
        }
        else
        {
          long long v247 = self;
          if ((v300 & 1) == 0)
          {
            if (IMOSLoggingEnabled())
            {
              long long v251 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v251, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_1A4AF7000, v251, OS_LOG_TYPE_INFO, "** Posting will load notification", buf, 2u);
              }
            }
            long long v252 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v248, v249, v250);
            objc_msgSend___mainThreadPostNotificationName_object_(v252, v253, @"__kIMChatRegistryWillLoadNotification", (uint64_t)v247);
          }
          if (IMOSLoggingEnabled())
          {
            v256 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v256, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              id v330 = v245;
              _os_log_impl(&dword_1A4AF7000, v256, OS_LOG_TYPE_INFO, " => Unregistering chat: %@", buf, 0xCu);
            }
          }
          objc_msgSend__unregisterChat_(v247, v254, (uint64_t)v245, v255);
          char v300 = 1;
        }
      }
      uint64_t v242 = objc_msgSend_countByEnumeratingWithState_objects_count_(v237, v239, (uint64_t)&v311, (uint64_t)v326, 16);
    }
    while (v242);
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v260 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v260, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A4AF7000, v260, OS_LOG_TYPE_INFO, "Done restoring chats", buf, 2u);
    }
  }
  if (v290)
  {
    long long v309 = 0u;
    long long v310 = 0u;
    long long v307 = 0u;
    long long v308 = 0u;
    __int16 v261 = objc_msgSend_cachedChats(self, v257, v258, v259);
    uint64_t v266 = objc_msgSend_countByEnumeratingWithState_objects_count_(v261, v262, (uint64_t)&v307, (uint64_t)v325, 16);
    if (v266)
    {
      uint64_t v267 = *(void *)v308;
      do
      {
        for (uint64_t m = 0; m != v266; ++m)
        {
          if (*(void *)v308 != v267) {
            objc_enumerationMutation(v261);
          }
          objc_msgSend__endTiming(*(void **)(*((void *)&v307 + 1) + 8 * m), v263, v264, v265);
        }
        uint64_t v266 = objc_msgSend_countByEnumeratingWithState_objects_count_(v261, v263, (uint64_t)&v307, (uint64_t)v325, 16);
      }
      while (v266);
    }
  }
  objc_msgSend_stopTimingForKey_(v290, v257, @"IMCoreSetup: ChatReconstruction", v259);
  if (v300)
  {
    if (IMOSLoggingEnabled())
    {
      v274 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v274, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A4AF7000, v274, OS_LOG_TYPE_INFO, "** Posting did load notification", buf, 2u);
      }
    }
    if (isFirstLoad)
    {
      v275 = 0;
    }
    else
    {
      v276 = (void *)MEMORY[0x1E4F1C9E8];
      v277 = objc_msgSend_numberWithBool_(NSNumber, v271, 1, v273);
      v275 = objc_msgSend_dictionaryWithObjectsAndKeys_(v276, v278, (uint64_t)v277, v279, @"__kIMChatRegistryDidLoadIsRefreshKey", 0);
    }
    v280 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v271, v272, v273);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v280, v281, @"__kIMChatRegistryDidLoadNotification", (uint64_t)self, v275);
  }
  objc_msgSend_setLoading_(self, v269, 0, v270);
  objc_msgSend_setFirstLoad_(self, v282, 0, v283);
  if ((IMIsRunningInUnitTesting() & 1) == 0)
  {
    id v306 = v289;
    im_dispatch_after();
  }
  objc_msgSend_setUpInitialCallState(self, v284, v285, v286);
}

- (void)_daemonReallyDied:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 136315138;
      id v9 = "-[IMChatRegistry(IMChatRegistry_DaemonIncoming) _daemonReallyDied:]";
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "%s", (uint8_t *)&v8, 0xCu);
    }
  }
  objc_msgSend_setDaemonHadTerminated_(self, v5, 1, v6);
}

- (void)_chatLoadedWithChatIdentifier:(id)a3 chats:(id)a4
{
  uint64_t v106 = *MEMORY[0x1E4F143B8];
  id v93 = a3;
  long long v97 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  id obj = a4;
  uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v97, (uint64_t)v105, 16);
  if (v92)
  {
    uint64_t v91 = *(void *)v98;
    uint64_t v88 = *MEMORY[0x1E4F6CDB0];
    do
    {
      for (uint64_t i = 0; i != v92; ++i)
      {
        if (*(void *)v98 != v91) {
          objc_enumerationMutation(obj);
        }
        id v9 = *(void **)(*((void *)&v97 + 1) + 8 * i);
        uint64_t v95 = objc_msgSend_objectForKey_(v9, v6, @"guid", v7);
        uint64_t v12 = objc_msgSend_objectForKey_(v9, v10, @"chatIdentifier", v11);
        if (objc_msgSend_isEqualToIgnoringCase_(v12, v13, (uint64_t)v93, v14))
        {
          uint64_t v17 = objc_msgSend_objectForKey_(v9, v15, v88, v16);
          id v18 = v9;
          if (objc_msgSend_count(v17, v19, v20, v21))
          {
            uint64_t v24 = objc_msgSend_objectForKey_(v17, v22, @"accountID", v23);
            uint64_t v27 = objc_msgSend_objectForKey_(v17, v25, @"account", v26);
            uint64_t v32 = objc_msgSend_objectForKey_(v17, v28, @"serviceName", v29);
            if (v24)
            {
              if (v27) {
                goto LABEL_10;
              }
LABEL_18:
              uint64_t v27 = objc_msgSend_objectForKey_(v18, v30, @"account", v31);
              if (!v32) {
                goto LABEL_19;
              }
LABEL_20:
              uint64_t v36 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v30, (uint64_t)v32, v31);
            }
            else
            {
              uint64_t v24 = objc_msgSend_objectForKey_(v18, v30, @"accountID", v31);
              if (!v27) {
                goto LABEL_18;
              }
LABEL_10:
              if (v32) {
                goto LABEL_20;
              }
LABEL_19:
              uint64_t v32 = objc_msgSend_objectForKey_(v18, v30, @"serviceName", v31);
              if (v32) {
                goto LABEL_20;
              }
              uint64_t v36 = 0;
            }
            uint64_t v37 = objc_msgSend_sharedInstance(IMAccountController, v30, v35, v31);
            uint64_t v39 = objc_msgSend_bestAccountForService_login_guid_(v37, v38, (uint64_t)v36, (uint64_t)v27, v24);

            IMMessageFromIMMessageItemDictionary = _CreateIMMessageFromIMMessageItemDictionary(v17, v39, 1);
          }
          else
          {
            IMMessageFromIMMessageItemDictionary = 0;
          }

          if (IMMessageFromIMMessageItemDictionary) {
            objc_msgSend__checkIfItemIsCorrupt_(self, v40, (uint64_t)IMMessageFromIMMessageItemDictionary, v41);
          }
          int v42 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
          uint64_t v43 = v42;
          BOOL v44 = IMMessageFromIMMessageItemDictionary == 0;
          if (!v42) {
            BOOL v44 = 1;
          }
          if (!v44) {
            CFArrayAppendValue(v42, IMMessageFromIMMessageItemDictionary);
          }
          buf[0] = 0;
          id v96 = 0;
          int v45 = sub_1A4B19928(self, v18, v43, 1, buf, &v96);
          id v46 = v96;
          objc_msgSend__registerChatDictionary_forChat_isIncoming_newGUID_(self, v47, (uint64_t)v18, (uint64_t)v45, 0, v46);
          objc_msgSend__updateInfo_forGUID_updatingUnreadCount_(self, v48, (uint64_t)v18, (uint64_t)v95, 1);
          if (buf[0]) {
            goto LABEL_42;
          }
          id v90 = IMMessageFromIMMessageItemDictionary;
          uint64_t v53 = objc_msgSend__lastMessage(v45, v50, v51, v52);
          uint64_t v57 = v53;
          if (v53)
          {
            if (objc_msgSend_messageID(v53, v54, v55, v56) && objc_msgSend_messageID(v90, v58, v59, v60))
            {
              id v87 = objc_msgSend_time(v90, v58, v59, v60);
              uint64_t v64 = objc_msgSend_time(v57, v61, v62, v63);
              BOOL v86 = objc_msgSend_compare_(v87, v65, (uint64_t)v64, v66) == 1;

              if (!v86) {
                goto LABEL_42;
              }
LABEL_41:
              objc_msgSend__insertHistoricalMessages_queryID_isRefresh_isHistoryQuery_(v45, v49, (uint64_t)v43, @"Reconstruction", 0, 0);
LABEL_42:
              uint64_t v73 = objc_msgSend__winningJoinStateForExistingChat_incomingDictionary_(self, v49, (uint64_t)v45, (uint64_t)v18);
              objc_msgSend__setJoinState_(v45, v74, v73, v75);

              goto LABEL_43;
            }
            if (objc_msgSend_messageID(v57, v58, v59, v60) || !objc_msgSend_messageID(v90, v67, v68, v69))
            {
              if (objc_msgSend_messageID(v57, v67, v68, v69)) {
                objc_msgSend_messageID(v90, v70, v71, v72);
              }

              goto LABEL_42;
            }
          }

          goto LABEL_41;
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v33 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412546;
            id v102 = v93;
            __int16 v103 = 2112;
            uint64_t v104 = v12;
            _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "We got back up the wrong chat. Expected %@, got %@", buf, 0x16u);
          }
        }
LABEL_43:
      }
      uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v97, (uint64_t)v105, 16);
    }
    while (v92);
  }

  uint64_t v79 = objc_msgSend_chatsBeingLoadedMap(self, v76, v77, v78);
  objc_msgSend_removeObjectForKey_(v79, v80, (uint64_t)v93, v81);

  objc_msgSend_setLoading_(self, v82, 0, v83);
  objc_msgSend_setFirstLoad_(self, v84, 0, v85);
}

- (void)_previouslyBlackholedChatLoadedWithHandleIDs:(id)a3 chat:(id)a4
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc(MEMORY[0x1E4F1CAD0]);
  uint64_t v11 = objc_msgSend_initWithArray_(v8, v9, (uint64_t)v6, v10);
  uint64_t v14 = objc_msgSend_objectForKey_(v7, v12, @"participants", v13);
  id v15 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v19 = objc_msgSend_count(v14, v16, v17, v18);
  uint64_t v22 = objc_msgSend_initWithCapacity_(v15, v20, v19, v21);
  v50[0] = MEMORY[0x1E4F143A8];
  v50[1] = 3221225472;
  v50[2] = sub_1A4C61670;
  v50[3] = &unk_1E5B7E0A8;
  id v23 = v22;
  id v51 = v23;
  objc_msgSend_enumerateObjectsUsingBlock_(v14, v24, (uint64_t)v50, v25);
  uint64_t v26 = NSString;
  uint64_t v30 = objc_msgSend_hash(v11, v27, v28, v29);
  uint64_t v33 = objc_msgSend_stringWithFormat_(v26, v31, @"%lu", v32, v30);
  if (objc_msgSend_isEqualToSet_(v23, v34, (uint64_t)v11, v35))
  {
    id v52 = v7;
    uint64_t v37 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v36, (uint64_t)&v52, 1);
    objc_msgSend__chatLoadedWithChatIdentifier_chats_(self, v38, (uint64_t)v33, (uint64_t)v37);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v42 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v54 = v11;
        __int16 v55 = 2112;
        id v56 = v23;
        _os_log_impl(&dword_1A4AF7000, v42, OS_LOG_TYPE_INFO, "We got back up the wrong chat. Expected %@, got %@", buf, 0x16u);
      }
    }
    uint64_t v43 = objc_msgSend_chatsBeingLoadedMap(self, v39, v40, v41);
    objc_msgSend_removeObjectForKey_(v43, v44, (uint64_t)v33, v45);

    objc_msgSend_setLoading_(self, v46, 0, v47);
    objc_msgSend_setFirstLoad_(self, v48, 0, v49);
  }
}

- (void)chatLoadedWithChatIdentifier:(id)a3 chats:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  int v14 = (*MEMORY[0x1E4F6C4F8] | *MEMORY[0x1E4F6C548] | *MEMORY[0x1E4F6C508]) & objc_msgSend_capabilitiesForListenerID_(v11, v12, 0, v13);

  if (v14)
  {
    objc_msgSend__chatLoadedWithChatIdentifier_chats_(self, v15, (uint64_t)v6, (uint64_t)v7);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Bailing out of handle chatLoadedWithChatIdentifier due to kFZListenerCapOnDemandChatRegistry cap not being present", v17, 2u);
    }
  }
}

- (void)previouslyBlackholedChatLoadedWithChatIdentifier:(id)a3 chats:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  int v14 = (*MEMORY[0x1E4F6C4F8] | *MEMORY[0x1E4F6C548] | *MEMORY[0x1E4F6C508]) & objc_msgSend_capabilitiesForListenerID_(v11, v12, 0, v13);

  if (v14)
  {
    objc_msgSend__chatLoadedWithChatIdentifier_chats_(self, v15, (uint64_t)v6, (uint64_t)v7);
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"__kIMChatPreviouslyBlackholedChatHasBeenLoaded", 0, 0, 1u);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Bailing out of handle chatLoadedWithChatIdentifier due to kFZListenerCapOnDemandChatRegistry cap not being present", v18, 2u);
    }
  }
}

- (void)previouslyBlackholedChatLoadedWithHandleIDs:(id)a3 chat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  int v14 = *MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v11, v12, 0, v13);

  if (v14)
  {
    objc_msgSend__previouslyBlackholedChatLoadedWithHandleIDs_chat_(self, v15, (uint64_t)v6, (uint64_t)v7);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v17 = 0;
      _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Bailing out of handle chatLoadedWithChatIdentifier due to kFZListenerCapChats cap not being present", v17, 2u);
    }
  }
}

- (void)blackholedChatsExist:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v5 = objc_msgSend_sharedInstance(IMDaemonController, a2, a3, v3);
  int v8 = (*MEMORY[0x1E4F6C4F8] | *MEMORY[0x1E4F6C508]) & objc_msgSend_capabilitiesForListenerID_(v5, v6, 0, v7);

  if (v8)
  {
    objc_msgSend_sharedRegistry(IMChatRegistry, v9, v10, v11);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__updateBlackholedChatsExist_(v15, v12, v4, v13);
  }
  else if (IMOSLoggingEnabled())
  {
    int v14 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Bailing out of handle blackholedChatsExist due to kFZListenerCapChats cap not being present", buf, 2u);
    }
  }
}

- (void)screenTimeEnablementChanged:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_sharedInstance(IMDaemonController, a2, a3, v3);
  if ((*MEMORY[0x1E4F6C508] & objc_msgSend_capabilitiesForListenerID_(v5, v6, 0, v7)) == 0)
  {
    uint64_t v11 = objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
    if ((*MEMORY[0x1E4F6C560] & objc_msgSend_capabilitiesForListenerID_(v11, v12, 0, v13)) == 0)
    {
      uint64_t v26 = objc_msgSend_sharedInstance(IMDaemonController, v14, v15, v16);
      int v29 = *MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilitiesForListenerID_(v26, v27, 0, v28);

      if (!v29) {
        return;
      }
      goto LABEL_5;
    }
  }
LABEL_5:
  if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = @"Disabled";
      if (v4) {
        uint64_t v21 = @"Enabled";
      }
      int v30 = 138412290;
      uint64_t v31 = v21;
      _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "ScreenTime is: %@", (uint8_t *)&v30, 0xCu);
    }
  }
  uint64_t v22 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v17, v18, v19);
  uint64_t v24 = v22;
  uint64_t v25 = &off_1E965C710;
  if (!v4) {
    uint64_t v25 = &off_1E965C718;
  }
  objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v22, v23, (uint64_t)*v25, 0, 0);
}

- (void)groupPhotoUpdatedForChatIdentifier:(id)a3 style:(unsigned __int8)a4 account:(id)a5 userInfo:(id)a6
{
  uint64_t v8 = a4;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    int v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412546;
      id v23 = v10;
      __int16 v24 = 2112;
      id v25 = v12;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Received groupPhotoUpdatedForChatIdentifier: %@ userInfo: %@", (uint8_t *)&v22, 0x16u);
    }
  }
  uint64_t v15 = objc_msgSend__existingChatWithIdentifier_style_account_(self, v13, (uint64_t)v10, v8, v11);
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v15;
      _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Found chat %@", (uint8_t *)&v22, 0xCu);
    }
  }
  uint64_t v20 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v16, v17, v18);
  objc_msgSend_postNotificationName_object_userInfo_(v20, v21, @"__kIMChatGroupPhotoChangedNotification", (uint64_t)v15, v12);
}

- (void)movedMessagesToRecentlyDeletedWithQueryID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Recently Deleted | Completing query: moved messages to recently deleted for query: %@", (uint8_t *)&v12, 0xCu);
    }
  }
  uint64_t v9 = objc_msgSend_daemonQueryController(self, v5, v6, v7);
  objc_msgSend_completeQuery_(v9, v10, (uint64_t)v4, v11);
}

- (void)movedMessagesToRecentlyDeletedForChatsWithGUIDs:(id)a3 queryID:(id)a4 deletionDate:(id)a5
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v44 = v9;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Recently Deleted | Completing query: moved messages from chats to recently deleted for query: %@", buf, 0xCu);
    }
  }
  if (!v9) {
    goto LABEL_7;
  }
  uint64_t v15 = objc_msgSend_daemonQueryController(self, v11, v12, v13);
  uint64_t v19 = objc_msgSend_queries(v15, v16, v17, v18);
  int v22 = objc_msgSend_objectForKey_(v19, v20, (uint64_t)v9, v21);
  BOOL v23 = v22 == 0;

  uint64_t v27 = objc_msgSend_daemonQueryController(self, v24, v25, v26);
  objc_msgSend_completeQuery_(v27, v28, (uint64_t)v9, v29);

  if (v23)
  {
LABEL_7:
    int v30 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v11, v12, v13);
    uint64_t v37 = MEMORY[0x1E4F143A8];
    uint64_t v38 = 3221225472;
    uint64_t v39 = sub_1A4C62264;
    uint64_t v40 = &unk_1E5B7C5C8;
    uint64_t v41 = self;
    id v42 = v30;
    id v31 = v30;
    objc_msgSend_enumerateObjectsUsingBlock_(v8, v32, (uint64_t)&v37, v33);
    objc_msgSend__completedMovingChatsToRecentlyDeleted_deletionDate_(self, v34, (uint64_t)v31, (uint64_t)v10, v37, v38, v39, v40, v41);
  }
  uint64_t v35 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v11, v12, v13);
  objc_msgSend___mainThreadPostNotificationName_object_(v35, v36, @"__kIMChatRegistryDidMoveMessagesInChatsToRecentlyDeletedNotification", (uint64_t)v8);
}

- (void)_completedMovingChatsToRecentlyDeleted:(id)a3 deletionDate:(id)a4
{
  id v5 = a4;
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1A4C6235C;
  v9[3] = &unk_1E5B7C2B0;
  id v10 = v5;
  id v6 = v5;
  objc_msgSend_enumerateObjectsUsingBlock_(a3, v7, (uint64_t)v9, v8);
}

- (void)recoveredMessagesWithChatGUIDs:(id)a3 queryID:(id)a4
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v40 = v7;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Recently Deleted | Completing query: recovered messages for query: %@", buf, 0xCu);
    }
  }
  if (!v7) {
    goto LABEL_7;
  }
  uint64_t v12 = objc_msgSend_daemonQueryController(self, v8, v9, v10);
  uint64_t v16 = objc_msgSend_queries(v12, v13, v14, v15);
  uint64_t v19 = objc_msgSend_objectForKey_(v16, v17, (uint64_t)v7, v18);
  BOOL v20 = v19 == 0;

  __int16 v24 = objc_msgSend_daemonQueryController(self, v21, v22, v23);
  objc_msgSend_completeQuery_(v24, v25, (uint64_t)v7, v26);

  if (v20)
  {
LABEL_7:
    uint64_t v27 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v8, v9, v10);
    uint64_t v33 = MEMORY[0x1E4F143A8];
    uint64_t v34 = 3221225472;
    uint64_t v35 = sub_1A4C625CC;
    uint64_t v36 = &unk_1E5B7C5C8;
    uint64_t v37 = self;
    id v38 = v27;
    id v28 = v27;
    objc_msgSend_enumerateObjectsUsingBlock_(v6, v29, (uint64_t)&v33, v30);
    objc_msgSend__completedRecoveringChatsFromRecentlyDeleted_(self, v31, (uint64_t)v28, v32, v33, v34, v35, v36, v37);
  }
}

- (void)_completedRecoveringChatsFromRecentlyDeleted:(id)a3
{
  objc_msgSend_enumerateObjectsUsingBlock_(a3, a2, (uint64_t)&unk_1EF8E34C8, v3);
}

- (void)permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v19 = v4;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Recently Deleted | Fully deleted chats with GUIDs: %@", buf, 0xCu);
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v6 = v4;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v14;
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v14 != v11) {
          objc_enumerationMutation(v6);
        }
        objc_msgSend__unregisterChatWithGUID_(self, v8, *(void *)(*((void *)&v13 + 1) + 8 * v12++), v9, (void)v13);
      }
      while (v10 != v12);
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v8, (uint64_t)&v13, (uint64_t)v17, 16);
    }
    while (v10);
  }
}

- (void)permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs:(id)a3 queryID:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v7;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Recently Deleted | Completing query: permanently deleted messages in recently deleted from chats for query: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  objc_msgSend_permanentlyDeletedMessagesInChatsWithDeletedChatGUIDs_(self, v8, (uint64_t)v6, v9);
  long long v14 = objc_msgSend_daemonQueryController(self, v11, v12, v13);
  objc_msgSend_completeQuery_(v14, v15, (uint64_t)v7, v16);
}

- (void)permanentlyDeletedRecoverableMessagesForChatsWithGUIDs:(id)a3 deletedChatGUIDs:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v21, (uint64_t)v25, 16);
  if (v9)
  {
    uint64_t v12 = v9;
    uint64_t v13 = *(void *)v22;
    do
    {
      uint64_t v14 = 0;
      do
      {
        if (*(void *)v22 != v13) {
          objc_enumerationMutation(v7);
        }
        objc_msgSend__unregisterChatWithGUID_(self, v10, *(void *)(*((void *)&v21 + 1) + 8 * v14++), v11);
      }
      while (v12 != v14);
      uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v21, (uint64_t)v25, 16);
    }
    while (v12);
  }
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  void v20[2] = sub_1A4C62AE0;
  v20[3] = &unk_1E5B7BBE8;
  v20[4] = self;
  objc_msgSend_enumerateObjectsUsingBlock_(v6, v10, (uint64_t)v20, v11);
  id v18 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v15, v16, v17);
  objc_msgSend___mainThreadPostNotificationName_object_(v18, v19, @"__kIMChatRegistryDidPermanentlyDeleteRecoverableMessagesInChatsNotification", (uint64_t)v6);
}

- (void)recoveredMessagesFromRecentlyDeletedForChatsWithGUIDs:(id)a3
{
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A4C62BFC;
  v11[3] = &unk_1E5B7BBE8;
  void v11[4] = self;
  id v3 = a3;
  objc_msgSend_enumerateObjectsUsingBlock_(v3, v4, (uint64_t)v11, v5);
  uint64_t v9 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v6, v7, v8);
  objc_msgSend___mainThreadPostNotificationName_object_(v9, v10, @"__kIMChatRegistryDidRecoverMessagesInChatsNotification", (uint64_t)v3);
}

- (void)chat:(id)a3 lastMessageTimeStampOnLoadUpdated:(double)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = objc_msgSend_numberWithDouble_(NSNumber, v10, v11, v12, a4);
      int v20 = 138412546;
      id v21 = v5;
      __int16 v22 = 2112;
      long long v23 = v13;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Recently Deleted | IMChat: %@, updated last message timestamp on load: %@", (uint8_t *)&v20, 0x16u);
    }
  }
  uint64_t v14 = objc_msgSend_sharedRegistry(IMChatRegistry, v6, v7, v8);
  uint64_t v17 = objc_msgSend_existingChatWithGUID_(v14, v15, (uint64_t)v5, v16);

  objc_msgSend_setLastMessageTimeStampOnLoad_(v17, v18, (uint64_t)a4, v19);
}

- (void)serviceSwitchRequestReceivedForChatWithIdentifier:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_sharedRegistry(IMChatRegistry, v4, v5, v6);
  objc_msgSend__cachedChatWithIdentifier_(v7, v8, (uint64_t)v3, v9);
  id v17 = (id)objc_claimAutoreleasedReturnValue();

  if (v17)
  {
    objc_msgSend_setServiceSwitchRequested_(v17, v10, 1, v11);
    long long v15 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v12, v13, v14);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v15, v16, @"__kIMChatServiceSwitchRequestedNotification", (uint64_t)v17, 0);
  }
}

- (void)capabilitiesUpdatedForHandle:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "capabilitiesUpdatedForHandle: Posting notification", v10, 2u);
    }
  }
  uint64_t v8 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v4, v5, v6);
  objc_msgSend___mainThreadPostNotificationName_object_(v8, v9, @"__kIMChatHandleLazuliCapabilitiesUpdatedNotification", (uint64_t)v3);
}

- (id)messagesURLWithChat:(id)a3 orHandles:(id)a4 withMessageText:(id)a5
{
  uint64_t v171 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v12 = a5;
  if (v7)
  {
    uint64_t v13 = objc_msgSend_account(v7, v9, v10, v11);
    id v17 = objc_msgSend_service(v13, v14, v15, v16);
    uint64_t v21 = objc_msgSend_shortName(v17, v18, v19, v20);

    if (objc_msgSend_chatStyle(v7, v22, v23, v24) != 45)
    {
      uint64_t v59 = objc_msgSend_groupID(v7, v25, v26, v27);
      objc_msgSend_participants(v7, v60, v61, v62);
      id v44 = 0;
      uint64_t v32 = v8;
      id v8 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_10;
    }
    id v28 = objc_msgSend_recipient(v7, v25, v26, v27);
    uint64_t v32 = v28;
    if (v28)
    {
      uint64_t v33 = (void *)MEMORY[0x1E4F1C978];
      uint64_t v34 = objc_msgSend_ID(v28, v29, v30, v31);
      id v38 = objc_msgSend_URLPathAllowedCharacterSet(MEMORY[0x1E4F28B88], v35, v36, v37);
      uint64_t v41 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v34, v39, (uint64_t)v38, v40);

      id v44 = objc_msgSend_arrayWithObject_(v33, v42, (uint64_t)v41, v43);

LABEL_8:
      uint64_t v59 = 0;
LABEL_10:

      id v165 = v59;
      if (objc_msgSend_count(v44, v63, v64, v65) || !objc_msgSend_count(v8, v66, v67, v68))
      {
        uint64_t v69 = v44;
      }
      else
      {
        uint64_t v161 = v21;
        id v162 = v12;
        id v164 = v7;
        uint64_t v73 = (void *)MEMORY[0x1E4F1CA48];
        uint64_t v74 = objc_msgSend_count(v8, v70, v71, v72);
        uint64_t v69 = objc_msgSend_arrayWithCapacity_(v73, v75, v74, v76);
        long long v166 = 0u;
        long long v167 = 0u;
        long long v168 = 0u;
        long long v169 = 0u;
        id v163 = v8;
        id v77 = v8;
        uint64_t v79 = objc_msgSend_countByEnumeratingWithState_objects_count_(v77, v78, (uint64_t)&v166, (uint64_t)v170, 16);
        if (v79)
        {
          uint64_t v83 = v79;
          uint64_t v84 = *(void *)v167;
          do
          {
            for (uint64_t i = 0; i != v83; ++i)
            {
              if (*(void *)v167 != v84) {
                objc_enumerationMutation(v77);
              }
              BOOL v86 = objc_msgSend_ID(*(void **)(*((void *)&v166 + 1) + 8 * i), v80, v81, v82);
              id v90 = objc_msgSend_URLPathAllowedCharacterSet(MEMORY[0x1E4F28B88], v87, v88, v89);
              id v93 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v86, v91, (uint64_t)v90, v92);

              objc_msgSend_addObject_(v69, v94, (uint64_t)v93, v95);
            }
            uint64_t v83 = objc_msgSend_countByEnumeratingWithState_objects_count_(v77, v80, (uint64_t)&v166, (uint64_t)v170, 16);
          }
          while (v83);
        }

        id v8 = v163;
        id v7 = v164;
        uint64_t v21 = v161;
        id v12 = v162;
        uint64_t v59 = v165;
      }
      id v96 = objc_alloc(MEMORY[0x1E4F28E78]);
      long long v97 = (void *)v21;
      __int16 v103 = objc_msgSend_initWithFormat_(v96, v98, @"sms://open?service=%@", v99, v21);
      id v104 = v12;
      if (v59)
      {
        __int16 v105 = (void *)MEMORY[0x1E4F28B88];
        id v106 = v59;
        uint64_t v110 = objc_msgSend_URLPathAllowedCharacterSet(v105, v107, v108, v109);
        uint64_t v113 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v106, v111, (uint64_t)v110, v112);

        id v12 = v104;
        objc_msgSend_appendFormat_(v103, v114, @"&groupid=%@", v115, v113);
      }
      uint64_t v116 = objc_msgSend_displayName(v7, v100, v101, v102);
      if (objc_msgSend_length(v116, v117, v118, v119))
      {
        id v123 = (void *)MEMORY[0x1E4F28B88];
        id v124 = v116;
        uint64_t v128 = objc_msgSend_URLPathAllowedCharacterSet(v123, v125, v126, v127);
        uint64_t v131 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v124, v129, (uint64_t)v128, v130);

        id v12 = v104;
        objc_msgSend_appendFormat_(v103, v132, @"&displayname=%@", v133, v131);
      }
      if (objc_msgSend_length(v12, v120, v121, v122))
      {
        uint64_t v137 = (void *)MEMORY[0x1E4F28B88];
        id v138 = v12;
        long long v142 = objc_msgSend_URLPathAllowedCharacterSet(v137, v139, v140, v141);
        uint64_t v145 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v138, v143, (uint64_t)v142, v144);

        id v12 = v104;
        objc_msgSend_appendFormat_(v103, v146, @"&body=%@", v147, v145);
      }
      if ((unint64_t)objc_msgSend_count(v69, v134, v135, v136) < 2)
      {
        if (objc_msgSend_count(v69, v148, v149, v150) != 1)
        {
LABEL_32:
          int v159 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v154, (uint64_t)v103, v156);

          goto LABEL_33;
        }
        uint64_t v151 = objc_msgSend_firstObject(v69, v154, v155, v156);
        objc_msgSend_appendFormat_(v103, v157, @"&recipient=%@", v158, v151);
      }
      else
      {
        uint64_t v151 = objc_msgSend_componentsJoinedByString_(v69, v148, @",", v150);
        objc_msgSend_appendFormat_(v103, v152, @"&recipients=%@", v153, v151);
      }

      goto LABEL_32;
    }
LABEL_7:
    id v44 = 0;
    goto LABEL_8;
  }
  if (objc_msgSend_count(v8, v9, v10, v11))
  {
    uint64_t v32 = objc_msgSend_firstObject(v8, v45, v46, v47);
    id v51 = objc_msgSend_account(v32, v48, v49, v50);
    __int16 v55 = objc_msgSend_service(v51, v52, v53, v54);
    uint64_t v21 = objc_msgSend_shortName(v55, v56, v57, v58);

    goto LABEL_7;
  }
  int v159 = 0;
LABEL_33:

  return v159;
}

- (id)messagesURLWithChat:(id)a3
{
  id v3 = (objc_class *)MEMORY[0x1E4F28E78];
  id v4 = a3;
  id v5 = [v3 alloc];
  id v8 = objc_msgSend_initWithString_(v5, v6, @"sms://open?", v7);
  id v12 = objc_msgSend_chatIdentifier(v4, v9, v10, v11);

  uint64_t v16 = objc_msgSend_URLPathAllowedCharacterSet(MEMORY[0x1E4F28B88], v13, v14, v15);
  uint64_t v19 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v12, v17, (uint64_t)v16, v18);

  objc_msgSend_appendFormat_(v8, v20, @"groupid=%@", v21, v19);
  uint64_t v24 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v22, (uint64_t)v8, v23);

  return v24;
}

- (id)messagesURLWithMessageGUID:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc(MEMORY[0x1E4F28E78]);
  uint64_t v7 = objc_msgSend_initWithString_(v4, v5, @"sms://open?", v6);
  id v8 = (void *)MEMORY[0x1E4F28B88];
  id v9 = v3;
  uint64_t v13 = objc_msgSend_URLPathAllowedCharacterSet(v8, v10, v11, v12);
  uint64_t v16 = objc_msgSend_stringByAddingPercentEncodingWithAllowedCharacters_(v9, v14, (uint64_t)v13, v15);

  objc_msgSend_appendFormat_(v7, v17, @"message-guid=%@", v18, v16);
  uint64_t v21 = objc_msgSend_URLWithString_(MEMORY[0x1E4F1CB10], v19, (uint64_t)v7, v20);

  return v21;
}

- (id)chatForURL:(id)a3 outMessageText:(id *)a4 outRecipientIDs:(id *)a5 outService:(id *)a6 outMessageGUID:(id *)a7
{
  return (id)MEMORY[0x1F4181798](self, sel_chatForURL_outMessageText_outRecipientIDs_outService_outMessageGUID_presentOverlay_, a3, a4);
}

- (id)chatForURL:(id)a3 outMessageText:(id *)a4 outRecipientIDs:(id *)a5 outService:(id *)a6 outMessageGUID:(id *)a7 presentOverlay:(BOOL *)a8
{
  return (id)objc_msgSend_chatForURL_outMessageText_outRecipientIDs_outService_outMessageGUID_presentOverlay_outSIMID_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, a7, a8, 0);
}

- (id)chatForURL:(id)a3 outMessageText:(id *)a4 outRecipientIDs:(id *)a5 outService:(id *)a6 outMessageGUID:(id *)a7 presentOverlay:(BOOL *)a8 outSIMID:(id *)a9
{
  uint64_t v172 = *MEMORY[0x1E4F143B8];
  id v162 = a3;
  uint64_t v19 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v13, v14, v15);
  if (a7) {
    *a7 = 0;
  }
  if (a5) {
    *a5 = 0;
  }
  if (a6) {
    *a6 = 0;
  }
  if (a7) {
    *a7 = 0;
  }
  if (a8) {
    *a8 = 0;
  }
  if (a9) {
    *a9 = 0;
  }
  objc_msgSend_resourceSpecifier(v162, v16, v17, v18);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_rangeOfString_(v20, v21, @"open?groupid", v22) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend_rangeOfString_(v20, v23, @"open?address", v24) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend_rangeOfString_(v20, v25, @"open?addresses", v26) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend_rangeOfString_(v20, v27, @"open?message-guid", v28) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend_rangeOfString_(v20, v29, @"open?recipients", v30) == 0x7FFFFFFFFFFFFFFFLL
    && objc_msgSend_rangeOfString_(v20, v31, @"open?recipient", v32) == 0x7FFFFFFFFFFFFFFFLL)
  {
    uint64_t v35 = objc_msgSend_rangeOfString_(v20, v33, @"open?service", v34);

    if (v35 != 0x7FFFFFFFFFFFFFFFLL) {
      goto LABEL_26;
    }
    if (objc_msgSend_hasPrefix_(v20, v36, @"//", v38))
    {
      uint64_t v41 = objc_msgSend_substringFromIndex_(v20, v39, 2, v40);

      id v20 = (id)v41;
    }
    id v42 = v20;
    uint64_t v45 = objc_msgSend_rangeOfString_(v42, v43, @"?", v44);
    unint64_t v48 = 0x1E4F29000;
    if (v45 == 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v49 = &stru_1EF8E78C8;
      id v20 = v42;
    }
    else
    {
      uint64_t v142 = v45;
      objc_msgSend_substringToIndex_(v42, v46, v45, v47);
      id v20 = (id)objc_claimAutoreleasedReturnValue();

      int v143 = NSString;
      uint64_t v146 = objc_msgSend_substringFromIndex_(v42, v144, v142 + 1, v145);
      objc_msgSend_stringWithFormat_(v143, v147, @"&%@", v148, v146);
      uint64_t v49 = (__CFString *)objc_claimAutoreleasedReturnValue();

      unint64_t v48 = 0x1E4F29000uLL;
    }
    uint64_t v149 = (void *)MEMORY[0x1E4F1CB10];
    uint64_t v150 = objc_msgSend_stringWithFormat_(*(void **)(v48 + 24), v46, @"sms:/open?address=%@%@", v47, v20, v49);
    uint64_t v153 = objc_msgSend_URLWithString_(v149, v151, (uint64_t)v150, v152);

    id v162 = (id)v153;
  }
  else
  {
    id v42 = v20;
  }

  id v20 = v42;
LABEL_26:
  uint64_t v50 = objc_msgSend_absoluteString(v162, v36, v37, v38);
  id v51 = (id)ExtractURLQueries();

  uint64_t v54 = objc_msgSend_objectForKey_(v19, v52, @"body", v53);
  *(void *)&long long v159 = objc_msgSend_objectForKey_(v19, v55, @"bot-name", v56);
  *((void *)&v159 + 1) = objc_msgSend_objectForKey_(v19, v57, @"service_id", v58);
  if (v159 != 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v62 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A4AF7000, v62, OS_LOG_TYPE_INFO, "> Incoming messagesURL is detected as a chatbot based on its query parameters.", buf, 2u);
      }
    }
    uint64_t v63 = objc_msgSend_stringByReplacingOccurrencesOfString_withString_(v54, v61, @"+", @"%20");

    uint64_t v54 = objc_msgSend_stringByRemovingPercentEncoding(v63, v64, v65, v66);
  }
  if (a4 && v54) {
    *a4 = v54;
  }
  uint64_t v157 = objc_msgSend_objectForKey_(v19, v59, @"groupid", v60);
  uint64_t v158 = objc_msgSend_objectForKey_(v19, v67, @"chatguid", v68);
  uint64_t v161 = objc_msgSend_objectForKey_(v19, v69, @"recipient", v70);
  uint64_t v73 = objc_msgSend_objectForKeyedSubscript_(v19, v71, @"best-match", v72);
  int v154 = objc_msgSend_BOOLValue(v73, v74, v75, v76);

  uint64_t v160 = objc_msgSend_objectForKey_(v19, v77, @"simid", v78);
  if (v160) {
    BOOL v82 = a9 != 0;
  }
  else {
    BOOL v82 = 0;
  }
  if (v82) {
    *a9 = (id)objc_msgSend_copy(v160, v79, v80, v81);
  }
  if (!v161)
  {
    if (*((void *)&v159 + 1))
    {
      uint64_t v161 = (uint64_t)*((id *)&v159 + 1);
    }
    else
    {
      uint64_t v161 = objc_msgSend_objectForKey_(v19, v79, @"address", v81);
    }
  }
  uint64_t v85 = objc_msgSend_objectForKey_(v19, v79, @"recipients", v81);
  if (!v85)
  {
    uint64_t v85 = objc_msgSend_objectForKey_(v19, v83, @"addresses", v84);
  }
  BOOL v86 = objc_msgSend_objectForKey_(v19, v83, @"overlay", v84);
  BOOL v87 = v86 != 0;

  if (a8 != 0 && v87) {
    *a8 = 1;
  }
  id v90 = objc_msgSend_objectForKey_(v19, v88, @"message-guid", v89);
  if (objc_msgSend_length(v90, v91, v92, v93))
  {
    id v94 = 0;
    if (a7) {
      *a7 = v90;
    }
    goto LABEL_116;
  }
  if (IMOSLoggingEnabled())
  {
    long long v97 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v169 = v162;
      _os_log_impl(&dword_1A4AF7000, v97, OS_LOG_TYPE_INFO, "finding chat for URL: %@", buf, 0xCu);
    }
  }
  if (v158)
  {
    if (IMOSLoggingEnabled())
    {
      long long v100 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v100, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v169 = v158;
        _os_log_impl(&dword_1A4AF7000, v100, OS_LOG_TYPE_INFO, "didn't find chat, lets look for it as chatGUID: %@", buf, 0xCu);
      }
    }
    objc_msgSend_existingChatWithGUID_(self, v98, (uint64_t)v158, v99);
    id v94 = (id)objc_claimAutoreleasedReturnValue();
    if (v94)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_116;
      }
      uint64_t v101 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v169 = v94;
        __int16 v170 = 2112;
        uint64_t v171 = v158;
        _os_log_impl(&dword_1A4AF7000, v101, OS_LOG_TYPE_INFO, "    => found chat: %@ for chatGUID: %@", buf, 0x16u);
      }
      goto LABEL_64;
    }
  }
  if (v157)
  {
    objc_msgSend_existingChatWithGroupID_(self, v95, (uint64_t)v157, v96);
    id v94 = (id)objc_claimAutoreleasedReturnValue();
    if (v94) {
      goto LABEL_73;
    }
    if (IMOSLoggingEnabled())
    {
      id v104 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v104, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1A4AF7000, v104, OS_LOG_TYPE_INFO, "didn't find chat, lets look for it as a chat identifier", buf, 2u);
      }
    }
    objc_msgSend_existingChatWithChatIdentifier_(self, v102, (uint64_t)v157, v103);
    id v94 = (id)objc_claimAutoreleasedReturnValue();
    if (v94)
    {
LABEL_73:
      if (!IMOSLoggingEnabled()) {
        goto LABEL_116;
      }
      uint64_t v101 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v101, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v169 = v94;
        _os_log_impl(&dword_1A4AF7000, v101, OS_LOG_TYPE_INFO, "    => found chat: %@", buf, 0xCu);
      }
LABEL_64:

      goto LABEL_116;
    }
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v107 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v107, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1A4AF7000, v107, OS_LOG_TYPE_INFO, "didn't find it, going through participant logic and others", buf, 2u);
    }
  }
  if (v161)
  {
    objc_msgSend_arrayWithObject_(MEMORY[0x1E4F1C978], v105, v161, v106);
    id v108 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v112 = objc_msgSend_count(v108, v109, v110, v111);
  }
  else if (v85)
  {
    uint64_t v115 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v105, 0, v106);
    long long v165 = 0u;
    long long v166 = 0u;
    long long v163 = 0u;
    long long v164 = 0u;
    uint64_t v118 = objc_msgSend_componentsSeparatedByString_((void *)v85, v116, @",", v117);
    uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v119, (uint64_t)&v163, (uint64_t)v167, 16);
    if (v122)
    {
      uint64_t v123 = *(void *)v164;
      do
      {
        for (uint64_t i = 0; i != v122; ++i)
        {
          if (*(void *)v164 != v123) {
            objc_enumerationMutation(v118);
          }
          objc_msgSend_addObject_(v115, v120, *(void *)(*((void *)&v163 + 1) + 8 * i), v121);
        }
        uint64_t v122 = objc_msgSend_countByEnumeratingWithState_objects_count_(v118, v120, (uint64_t)&v163, (uint64_t)v167, 16);
      }
      while (v122);
    }

    id v108 = v115;
    uint64_t v112 = objc_msgSend_count(v108, v125, v126, v127);
  }
  else
  {
    id v108 = 0;
    uint64_t v112 = objc_msgSend_count(0, v105, 0, v106);
  }
  int v128 = v154;
  if (!v112) {
    int v128 = 0;
  }
  if (v128 == 1)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v131 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v131, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v169 = v108;
        _os_log_impl(&dword_1A4AF7000, v131, OS_LOG_TYPE_INFO, "URL expects best contacts match for handle IDs %@", buf, 0xCu);
      }
    }
    uint64_t v132 = objc_msgSend__bestChatForHandleIDs_(self, v129, (uint64_t)v108, v130);
    int v133 = IMOSLoggingEnabled();
    if (v132)
    {
      if (v133)
      {
        id v134 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v134, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v169 = v132;
          _os_log_impl(&dword_1A4AF7000, v134, OS_LOG_TYPE_INFO, "    => Found chat based on recipientIDs: %@", buf, 0xCu);
        }
      }
      id v94 = v132;

      goto LABEL_116;
    }
    if (v133)
    {
      uint64_t v135 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v169 = v108;
        _os_log_impl(&dword_1A4AF7000, v135, OS_LOG_TYPE_INFO, "    => didn't find existing chat with contacts from handle IDs %@", buf, 0xCu);
      }
    }
  }
  long long v139 = objc_msgSend_objectForKey_(v19, v113, @"displayname", v114);
  if (a5) {
    *a5 = v108;
  }
  if (v161 | v85)
  {
    BOOL v140 = (unint64_t)objc_msgSend_count(v108, v136, v137, v138) > 1;
    IMFindExistingChatForAddresses(v108, v139, v140, 1);
    id v94 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v94 = 0;
  }

LABEL_116:

  return v94;
}

- (id)_bestChatForHandleIDs:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  id v5 = v3;
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v28, (uint64_t)v36, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v29;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v29 != v11) {
          objc_enumerationMutation(v5);
        }
        uint64_t v13 = *(void *)(*((void *)&v28 + 1) + 8 * i);
        uint64_t v14 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E6D8], v7, v8, v9);
        uint64_t v17 = objc_msgSend_fetchCNContactForHandleWithID_(v14, v15, v13, v16);

        int v18 = IMOSLoggingEnabled();
        if (!v17)
        {
          if (v18)
          {
            uint64_t v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              uint64_t v33 = v13;
              _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "    => could not find contact for handle %@, not searching for chat by contacts", buf, 0xCu);
            }
          }
          uint64_t v23 = 0;
          goto LABEL_22;
        }
        if (v18)
        {
          uint64_t v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412546;
            uint64_t v33 = (uint64_t)v17;
            __int16 v34 = 2112;
            uint64_t v35 = v13;
            _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "    => adding contact %@ for handle %@", buf, 0x16u);
          }
        }
        objc_msgSend_addObject_(v4, v19, (uint64_t)v17, v20);
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v28, (uint64_t)v36, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }

  uint64_t v23 = objc_msgSend_existingChatWithContacts_bestHandles_(self, v22, (uint64_t)v4, 0);
  if (IMOSLoggingEnabled())
  {
    uint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v33 = (uint64_t)v23;
      _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "    => found best chat with contacts: %@", buf, 0xCu);
    }
  }
LABEL_22:

  return v23;
}

- (id)_inPersonHandleFromIMHandle:(id)a3 contact:(id)a4
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  uint64_t v9 = objc_msgSend_normalizedID(a3, v6, v7, v8);
  if (!MEMORY[0x1A62639B0]())
  {
    if (!IMStringIsEmail())
    {
      uint64_t v46 = 0;
      long long v31 = 0;
      goto LABEL_42;
    }
    if (!v5)
    {
      long long v31 = 0;
      uint64_t v46 = 1;
      goto LABEL_42;
    }
    uint64_t v16 = IMNormalizeFormattedString();
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    uint64_t v17 = objc_msgSend_emailAddresses(v5, v32, v33, v34);
    long long v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v35, (uint64_t)&v53, (uint64_t)v61, 16);
    if (v31)
    {
      id v51 = v9;
      id v52 = v5;
      uint64_t v39 = *(void *)v54;
      while (2)
      {
        uint64_t v40 = 0;
        do
        {
          if (*(void *)v54 != v39) {
            objc_enumerationMutation(v17);
          }
          uint64_t v41 = *(void **)(*((void *)&v53 + 1) + 8 * (void)v40);
          id v42 = objc_msgSend_value(v41, v36, v37, v38, v51, v52);
          uint64_t v43 = IMNormalizeFormattedString();

          if (objc_msgSend_isEqual_(v43, v44, (uint64_t)v16, v45))
          {
            if (qword_1E965DED0 != -1) {
              dispatch_once(&qword_1E965DED0, &unk_1EF8E3CF0);
            }
            if (off_1E965E4E0)
            {
              long long v31 = ((void (*)(void *))off_1E965E4E0)(v41);

              uint64_t v46 = 1;
LABEL_37:
              uint64_t v9 = v51;
              id v5 = v52;
              goto LABEL_40;
            }
          }

          uint64_t v40 = (char *)v40 + 1;
        }
        while (v31 != v40);
        long long v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v36, (uint64_t)&v53, (uint64_t)v61, 16);
        if (v31) {
          continue;
        }
        break;
      }
      uint64_t v9 = v51;
      id v5 = v52;
    }
    uint64_t v46 = 1;
    goto LABEL_40;
  }
  if (!v5)
  {
    long long v31 = 0;
    uint64_t v46 = 2;
    goto LABEL_42;
  }
  id v10 = objc_alloc((Class)MEMORY[0x1A6263B40](@"CNPhoneNumber", @"Contacts"));
  uint64_t v16 = objc_msgSend_initWithStringValue_(v10, v11, (uint64_t)v9, v12);
  if (v16)
  {
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    uint64_t v17 = objc_msgSend_phoneNumbers(v5, v13, v14, v15);
    uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v57, (uint64_t)v62, 16);
    if (v19)
    {
      uint64_t v23 = v19;
      id v51 = v9;
      id v52 = v5;
      uint64_t v24 = *(void *)v58;
      while (2)
      {
        uint64_t v25 = 0;
        do
        {
          if (*(void *)v58 != v24) {
            objc_enumerationMutation(v17);
          }
          uint64_t v26 = *(void **)(*((void *)&v57 + 1) + 8 * v25);
          uint64_t v27 = objc_msgSend_value(v26, v20, v21, v22, v51, v52);
          int isLikePhoneNumber = objc_msgSend_isLikePhoneNumber_(v27, v28, (uint64_t)v16, v29);

          if (isLikePhoneNumber)
          {
            if (qword_1E965DE18 != -1) {
              dispatch_once(&qword_1E965DE18, &unk_1EF8E3CB0);
            }
            if (off_1E965DE10)
            {
              long long v31 = ((void (*)(void *))off_1E965DE10)(v26);
              uint64_t v46 = 2;
              goto LABEL_37;
            }
          }
          ++v25;
        }
        while (v23 != v25);
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v57, (uint64_t)v62, 16);
        if (v23) {
          continue;
        }
        break;
      }
      long long v31 = 0;
      uint64_t v9 = v51;
      id v5 = v52;
    }
    else
    {
      long long v31 = 0;
    }
    uint64_t v46 = 2;
LABEL_40:

    goto LABEL_41;
  }
  long long v31 = 0;
  uint64_t v46 = 2;
LABEL_41:

LABEL_42:
  id v47 = objc_alloc((Class)qword_1E965E6E0);
  uint64_t v49 = objc_msgSend_initWithValue_type_label_(v47, v48, (uint64_t)v9, v46, v31);

  return v49;
}

- (id)_inPersonNameForContact:(id)a3 imHandle:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v10 = objc_msgSend_normalizedID(v6, v7, v8, v9);
  if (objc_msgSend_isBusiness(v6, v11, v12, v13))
  {
    uint64_t v17 = (void *)MEMORY[0x1E4F6E628];
    int v18 = objc_msgSend_ID(v6, v14, v15, v16);
    uint64_t v21 = objc_msgSend_placeholderNameForBrandURI_(v17, v19, (uint64_t)v18, v20);

    dispatch_semaphore_t v22 = dispatch_semaphore_create(0);
    uint64_t v60 = 0;
    uint64_t v61 = &v60;
    uint64_t v62 = 0x3032000000;
    uint64_t v63 = sub_1A4B3463C;
    uint64_t v64 = sub_1A4B34404;
    id v65 = 0;
    uint64_t v26 = objc_msgSend_sharedInstance(IMHandleRegistrar, v23, v24, v25);
    uint64_t v54 = MEMORY[0x1E4F143A8];
    uint64_t v55 = 3221225472;
    long long v56 = sub_1A4C89250;
    long long v57 = &unk_1E5B7F3A8;
    long long v59 = &v60;
    uint64_t v27 = v22;
    long long v58 = v27;
    uint64_t v29 = objc_msgSend_businessNameForUID_updateHandler_(v26, v28, (uint64_t)v10, (uint64_t)&v54);

    uint64_t v33 = objc_msgSend_length(v29, v30, v31, v32, v54, v55, v56, v57);
    uint64_t v37 = v29;
    if (!v33)
    {
      if ((objc_msgSend_isChatBot(v6, v34, v35, v36) & 1) == 0)
      {
        dispatch_time_t v41 = dispatch_time(0, 3000000000);
        dispatch_semaphore_wait(v27, v41);
      }
      if (!objc_msgSend_length((void *)v61[5], v38, v39, v40)) {
        goto LABEL_8;
      }
      uint64_t v37 = (void *)v61[5];
    }
    id v42 = v37;

    uint64_t v21 = v42;
LABEL_8:
    id v43 = v21;

    _Block_object_dispose(&v60, 8);
    goto LABEL_16;
  }
  if (v5)
  {
    uint64_t v44 = objc_msgSend_nickname(v5, v14, v15, v16);
    if (objc_msgSend_length(v44, v45, v46, v47))
    {
      id v43 = v44;
      goto LABEL_16;
    }
    unint64_t v48 = (void *)MEMORY[0x1A6263B40](@"CNContactFormatter", @"Contacts");
    objc_msgSend_stringFromContact_style_(v48, v49, (uint64_t)v5, 0);
    id v43 = (id)objc_claimAutoreleasedReturnValue();
    if (objc_msgSend_length(v43, v50, v51, v52))
    {

      goto LABEL_16;
    }
  }
  objc_msgSend_displayID(v6, v14, v15, v16);
  id v43 = (id)objc_claimAutoreleasedReturnValue();
LABEL_16:

  return v43;
}

- (id)_inPersonFromIMHandle:(id)a3 isMe:(BOOL)a4
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = *(id *)MEMORY[0x1A6263B50]("CNContactPhoneNumbersKey", @"Contacts");
  id v8 = *(id *)MEMORY[0x1A6263B50]("CNContactEmailAddressesKey", @"Contacts");
  id v10 = v8;
  if (v7) {
    BOOL v11 = v8 == 0;
  }
  else {
    BOOL v11 = 1;
  }
  if (v11)
  {
    uint64_t v15 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    v46[0] = v8;
    v46[1] = v7;
    uint64_t v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v9, (uint64_t)v46, 2);
    uint64_t v15 = objc_msgSend_arrayByAddingObjectsFromArray_(MEMORY[0x1E4F1CBF0], v13, (uint64_t)v12, v14);
  }
  uint64_t v16 = (void *)MEMORY[0x1A6263B40](@"CNContactFormatter", @"Contacts");
  if (v16)
  {
    uint64_t v20 = objc_msgSend_descriptorForRequiredKeysForStyle_(v16, v17, 0, v19);
    uint64_t v23 = objc_msgSend_arrayByAddingObject_(v15, v21, (uint64_t)v20, v22);

    uint64_t v15 = (void *)v23;
  }
  uint64_t v24 = objc_msgSend_descriptorForUsedKeys(MEMORY[0x1E4F28F30], v17, v18, v19);
  uint64_t v27 = objc_msgSend_arrayByAddingObject_(v15, v25, (uint64_t)v24, v26);

  long long v30 = objc_msgSend_cnContactWithKeys_(v6, v28, (uint64_t)v27, v29);
  uint64_t v32 = objc_msgSend__inPersonHandleFromIMHandle_contact_(self, v31, (uint64_t)v6, (uint64_t)v30);
  uint64_t v34 = objc_msgSend__inPersonNameForContact_imHandle_(self, v33, (uint64_t)v30, (uint64_t)v6);

  uint64_t v37 = objc_msgSend_componentsForContact_(MEMORY[0x1E4F28F30], v35, (uint64_t)v30, v36);
  dispatch_time_t v41 = objc_msgSend_identifier(v30, v38, v39, v40);
  id v42 = objc_alloc((Class)qword_1E965E6D8);
  isMe = objc_msgSend_initWithPersonHandle_nameComponents_displayName_image_contactIdentifier_customIdentifier_isMe_(v42, v43, (uint64_t)v32, (uint64_t)v37, v34, 0, v41, 0, a4);

  return isMe;
}

- (id)_interactionForMessage:(id)a3 inChat:(id)a4
{
  id v6 = a3;
  id v10 = a4;
  if (qword_1E965E710 != -1) {
    dispatch_once(&qword_1E965E710, &unk_1EF8E5938);
  }
  BOOL v11 = objc_msgSend_retractedPartIndexes(v6, v7, v8, v9);
  uint64_t v15 = objc_msgSend_count(v11, v12, v13, v14);

  if (v15)
  {
    uint64_t v19 = objc_msgSend__unsendMessageInteractionForMessage_inChat_(self, v16, (uint64_t)v6, (uint64_t)v10);
LABEL_5:
    uint64_t v20 = (void *)v19;
    goto LABEL_14;
  }
  if (objc_msgSend_isFinished(v6, v16, v17, v18)
    && (objc_msgSend_isTypingMessage(v6, v21, v22, v23) & 1) == 0)
  {
    uint64_t v27 = objc_msgSend_plainBody(v6, v24, v25, v26);
    if (objc_msgSend_length(v27, v28, v29, v30) || (objc_msgSend_hasInlineAttachments(v6, v31, v32, v33) & 1) != 0)
    {
      uint64_t v34 = objc_msgSend_associatedMessageType(v6, v31, v32, v33);

      if (!v34)
      {
        uint64_t v19 = objc_msgSend__sendMessageInteractionForMessage_inChat_(self, v35, (uint64_t)v6, (uint64_t)v10);
        goto LABEL_5;
      }
    }
    else
    {
    }
  }
  uint64_t v20 = 0;
LABEL_14:

  return v20;
}

- (id)_sendMessageInteractionForMessage:(id)a3 inChat:(id)a4
{
  uint64_t v183 = *MEMORY[0x1E4F143B8];
  id v171 = a3;
  id v172 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = objc_msgSend_guid(v171, v10, v11, v12);
      uint64_t v17 = objc_msgSend_guid(v172, v14, v15, v16);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v180 = v13;
      __int16 v181 = 2112;
      unsigned int v182 = v17;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Donating send message interaction for message %@ in chat %@", buf, 0x16u);
    }
  }
  uint64_t v18 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v6, v7, v8);
  uint64_t v21 = objc_msgSend_participantsWithState_(v172, v19, 16, v20);
  long long v175 = 0u;
  long long v176 = 0u;
  long long v173 = 0u;
  long long v174 = 0u;
  uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v22, (uint64_t)&v173, (uint64_t)v178, 16);
  if (v26)
  {
    uint64_t v27 = *(void *)v174;
    do
    {
      for (uint64_t i = 0; i != v26; ++i)
      {
        if (*(void *)v174 != v27) {
          objc_enumerationMutation(v21);
        }
        uint64_t v29 = objc_msgSend__inPersonFromIMHandle_isMe_(self, v23, *(void *)(*((void *)&v173 + 1) + 8 * i), 0);
        objc_msgSend_addObject_(v18, v30, (uint64_t)v29, v31);
      }
      uint64_t v26 = objc_msgSend_countByEnumeratingWithState_objects_count_(v21, v23, (uint64_t)&v173, (uint64_t)v178, 16);
    }
    while (v26);
  }
  uint64_t v32 = objc_msgSend_account(v172, v23, v24, v25);
  long long v165 = objc_msgSend_service(v32, v33, v34, v35);

  id v169 = objc_msgSend_name(v165, v36, v37, v38);
  id v42 = objc_msgSend_sender(v171, v39, v40, v41);
  long long v168 = objc_msgSend__inPersonFromIMHandle_isMe_(self, v43, (uint64_t)v42, 1);

  if (!objc_msgSend_isGroupChat(v172, v44, v45, v46)
    || (objc_msgSend_displayName(v172, v47, v48, v49),
        uint64_t v50 = objc_claimAutoreleasedReturnValue(),
        BOOL v54 = objc_msgSend_length(v50, v51, v52, v53) == 0,
        v50,
        v54))
  {
    long long v167 = 0;
  }
  else
  {
    id v55 = objc_alloc((Class)qword_1E965E6F8);
    long long v59 = objc_msgSend_guid(v172, v56, v57, v58);
    uint64_t v63 = objc_msgSend_displayName(v172, v60, v61, v62);
    long long v167 = objc_msgSend_initWithVocabularyIdentifier_spokenPhrase_pronunciationHint_(v55, v64, (uint64_t)v59, (uint64_t)v63, 0);
  }
  id v65 = objc_alloc((Class)qword_1E965E6E8);
  uint64_t v69 = objc_msgSend_plainBody(v171, v66, v67, v68);
  uint64_t v73 = objc_msgSend_guid(v172, v70, v71, v72);
  __int16 v170 = objc_msgSend_initWithRecipients_content_speakableGroupName_conversationIdentifier_serviceName_sender_(v65, v74, (uint64_t)v18, (uint64_t)v69, v167, v73, v169, v168);

  objc_msgSend__setLaunchId_(v170, v75, @"com.apple.MobileSMS", v76);
  uint64_t v80 = objc_msgSend_allChatProperties(v172, v77, v78, v79);
  long long v164 = objc_msgSend_objectForKey_(v80, v81, *MEMORY[0x1E4F6CD48], v82);

  BOOL v86 = objc_msgSend_sharedInstance(IMFileTransferCenter, v83, v84, v85);
  uint64_t v89 = objc_msgSend_transferForGUID_(v86, v87, (uint64_t)v164, v88);
  uint64_t v93 = objc_msgSend_filename(v89, v90, v91, v92);
  long long v163 = objc_msgSend_im_lastPathComponent(v93, v94, v95, v96);

  long long v100 = objc_msgSend_guid(v172, v97, v98, v99);
  long long v166 = IMSharedHelperExternalLocationForFile();

  if (objc_msgSend_length(v166, v101, v102, v103))
  {
    uint64_t v106 = objc_msgSend_fileURLWithPath_(MEMORY[0x1E4F1CB10], v104, (uint64_t)v166, v105);
  }
  else
  {
    uint64_t v106 = 0;
  }
  id v162 = (void *)v106;
  id v108 = objc_msgSend_imageWithURL_((void *)qword_1E965E6C0, v104, v106, v105);
  if (v108) {
    objc_msgSend_setImage_forParameterNamed_(v170, v107, (uint64_t)v108, @"speakableGroupName");
  }
  id v109 = objc_alloc((Class)qword_1E965E6F0);
  uint64_t v111 = objc_msgSend_initWithCode_userActivity_(v109, v110, 3, 0);
  uint64_t v115 = objc_msgSend_guid(v171, v112, v113, v114);
  uint64_t v119 = objc_msgSend_time(v171, v116, v117, v118);
  uint64_t v123 = objc_msgSend_guid(v172, v120, v121, v122);
  id v124 = objc_alloc((Class)qword_1E965E6D0);
  int v128 = objc_msgSend_plainBody(v171, v125, v126, v127);
  uint64_t v130 = objc_msgSend_initWithIdentifier_conversationIdentifier_content_dateSent_sender_recipients_groupName_messageType_serviceName_(v124, v129, (uint64_t)v115, (uint64_t)v123, v128, v119, v168, v18, v167, 1, v169);

  uint64_t v177 = v130;
  uint64_t v132 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v131, (uint64_t)&v177, 1);
  objc_msgSend_setSentMessages_(v111, v133, (uint64_t)v132, v134);

  id v135 = objc_alloc((Class)qword_1E965E6C8);
  uint64_t v137 = objc_msgSend_initWithIntent_response_(v135, v136, (uint64_t)v170, (uint64_t)v111);
  if (IMIsRunningInMessagesComposeViewService())
  {
    BOOL v140 = objc_opt_new();
    objc_msgSend__setContextExtensionUUID_(v137, v141, (uint64_t)v140, v142);
  }
  objc_msgSend_setIdentifier_(v137, v138, (uint64_t)v115, v139);
  objc_msgSend_setGroupIdentifier_(v137, v143, (uint64_t)v123, v144);
  if (objc_msgSend_isFromMe(v171, v145, v146, v147)) {
    objc_msgSend_setDirection_(v137, v148, 1, v149);
  }
  else {
    objc_msgSend_setDirection_(v137, v148, 2, v149);
  }
  if (v119)
  {
    id v153 = objc_alloc(MEMORY[0x1E4F28C18]);
    started = objc_msgSend_initWithStartDate_duration_(v153, v154, (uint64_t)v119, v155, 0.0);
    objc_msgSend_setDateInterval_(v137, v157, (uint64_t)started, v158);
  }
  if (objc_msgSend_isFinished(v171, v150, v151, v152)) {
    objc_msgSend_notifyInteractionWithPeople_(IMRemindersIntegration, v159, (uint64_t)v18, v160);
  }
  objc_msgSend_setIntentHandlingStatus_(v137, v159, 3, v160);

  return v137;
}

- (id)_unsendMessageInteractionForMessage:(id)a3 inChat:(id)a4
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = objc_msgSend_guid(v5, v11, v12, v13);
      uint64_t v18 = objc_msgSend_guid(v6, v15, v16, v17);
      *(_DWORD *)long long buf = 138412546;
      uint64_t v52 = v14;
      __int16 v53 = 2112;
      BOOL v54 = v18;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Donating unsend message interaction for message %@ in chat %@", buf, 0x16u);
    }
  }
  uint64_t v19 = objc_msgSend_guid(v5, v7, v8, v9);
  if (objc_msgSend_length(v19, v20, v21, v22))
  {
    uint64_t v50 = v19;
    uint64_t v24 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v23, (uint64_t)&v50, 1);
  }
  else
  {
    uint64_t v24 = (void *)MEMORY[0x1E4F1CBF0];
  }
  id v25 = objc_alloc((Class)qword_1E965DDE8);
  long long v28 = objc_msgSend_initWithMessageIdentifiers_(v25, v26, (uint64_t)v24, v27);
  objc_msgSend__setLaunchId_(v28, v29, @"com.apple.MobileSMS", v30);
  id v31 = objc_alloc((Class)qword_1E965DDF0);
  uint64_t v33 = objc_msgSend_initWithCode_userActivity_(v31, v32, 3, 0);
  id v34 = objc_alloc((Class)qword_1E965E6C8);
  uint64_t v36 = objc_msgSend_initWithIntent_response_(v34, v35, (uint64_t)v28, (uint64_t)v33);
  id v42 = objc_msgSend_dateEdited(v5, v37, v38, v39);
  if (v42)
  {
    id v43 = objc_alloc(MEMORY[0x1E4F28C18]);
    started = objc_msgSend_initWithStartDate_duration_(v43, v44, (uint64_t)v42, v45, 0.0);
    objc_msgSend_setDateInterval_(v36, v47, (uint64_t)started, v48);
  }
  objc_msgSend_setIntentHandlingStatus_(v36, v40, 3, v41);

  return v36;
}

@end