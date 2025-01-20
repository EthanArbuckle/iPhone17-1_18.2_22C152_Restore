@interface IMChat
+ (BOOL)isGUIDInAttemptingListInScrutinyMode:(id)a3;
+ (Class)_NPSManagerClass;
+ (Class)chatItemRulesClass;
+ (id)_participantsWorkQueue;
+ (id)chatItemUpdaterLogHandle;
+ (id)pendingChatForHandle:(id)a3;
+ (id)stateCaptureRecents;
+ (id)watermarkComparator;
+ (void)_initializeFindMyController;
+ (void)cleanWatermarkCache;
+ (void)removeGUIDInAttemptingListInScrutinyMode:(id)a3;
+ (void)setChatItemRulesClass:(Class)a3;
+ (void)storeGUIDInAttemptingListInScrutinyMode:(id)a3;
- (BOOL)_accountIsOperational:(id)a3 forService:(id)a4;
- (BOOL)_canLeaveChatIgnoringParticipantCount:(BOOL)a3;
- (BOOL)_canPossiblyBecomeHybrid;
- (BOOL)_canShareStatus;
- (BOOL)_chatStyleSupportsTypingAndCancelTypingIndicators;
- (BOOL)_handleIncomingItem:(id)a3;
- (BOOL)_handleIncomingItem:(id)a3 updateRecipient:(BOOL)a4;
- (BOOL)_handleIncomingItem:(id)a3 updateRecipient:(BOOL)a4 suppressNotification:(BOOL)a5;
- (BOOL)_handleIncomingItem:(id)a3 updateRecipient:(BOOL)a4 suppressNotification:(BOOL)a5 updateReplyCounts:(BOOL)a6;
- (BOOL)_hasCommunicatedOnService:(id)a3;
- (BOOL)_hasJustSentAMessage;
- (BOOL)_idsQueryResultsHaveMixedIDSStatus:(id)a3;
- (BOOL)_isBlackHoled;
- (BOOL)_isDuplicate:(id)a3;
- (BOOL)_isHybridGroup;
- (BOOL)_isHybridGroupEligibleByCarrier;
- (BOOL)_isRCSService;
- (BOOL)_isReplicatingService;
- (BOOL)_isSMSSatelliteService;
- (BOOL)_isSMSService;
- (BOOL)_isSatelliteServiceActive;
- (BOOL)_isSendToMakoAllowed;
- (BOOL)_isiMessageLiteServiceOrInCompatibleMode;
- (BOOL)_isiMessageService;
- (BOOL)_itemsAreRelayItemsFromMeWithServiceSwitch:(id)a3 otherItem:(id)a4;
- (BOOL)_lastKnownHybridState;
- (BOOL)_processSupportsHistory;
- (BOOL)_reachabilityResultHasMixedStatus:(id)a3;
- (BOOL)_recipientIsPhoneNumber;
- (BOOL)_sanityCheckAccounts;
- (BOOL)_serverBagPreventsScrutinyMode;
- (BOOL)_serviceCapabilityEnabled:(id)a3;
- (BOOL)_serviceSupportsCapability:(id)a3;
- (BOOL)_shouldRegisterChat;
- (BOOL)_shouldSendCancelTypingIndicator;
- (BOOL)_supportsAlternativeCommunicationActions;
- (BOOL)_supportsAttachments;
- (BOOL)_supportsAudioMessages;
- (BOOL)_supportsDeleteAndBlockGroup;
- (BOOL)_supportsDeliveryReceipts;
- (BOOL)_supportsEditMessage;
- (BOOL)_supportsExpressiveText;
- (BOOL)_supportsFaceTime;
- (BOOL)_supportsFocusMode;
- (BOOL)_supportsGroupIdentity;
- (BOOL)_supportsGroupMutability;
- (BOOL)_supportsInlineAdaptiveImageGlyphs;
- (BOOL)_supportsInlineReply;
- (BOOL)_supportsMentions;
- (BOOL)_supportsMessageEffects;
- (BOOL)_supportsMultiPart;
- (BOOL)_supportsNameAndPhoto;
- (BOOL)_supportsSendLater;
- (BOOL)_supportsSendMenu;
- (BOOL)_supportsShareLocation;
- (BOOL)_supportsSimSwitch;
- (BOOL)_supportsStickers;
- (BOOL)_supportsTapbacks;
- (BOOL)_supportsUndoSend;
- (BOOL)_suppressesMutationsFromLocalDevice;
- (BOOL)_uncachedHybridGroupStatus;
- (BOOL)_uncachedHybridGroupStatusWithIDSQueryResults:(id)a3;
- (BOOL)_uncachedHybridGroupStatusWithReachabilityResult:(id)a3;
- (BOOL)_updateJoinStateWithMessageIfNeeded:(id)a3;
- (BOOL)_updateLastKnownHybridState:(BOOL)a3;
- (BOOL)accountMatchesLastFinishedMessageItem;
- (BOOL)allParticipantsAreContacts;
- (BOOL)allParticipantsBlocked;
- (BOOL)allRecipientsFollowingLocation;
- (BOOL)allRecipientsSharingLocation;
- (BOOL)allowedByScreenTime;
- (BOOL)allowedToShowConversation;
- (BOOL)allowedToShowConversationSync;
- (BOOL)authorizationToSendCurrentLocationMessageDenied;
- (BOOL)authorizationToSendCurrentLocationMessageDetermined;
- (BOOL)authorizedToSendCurrentLocationMessage;
- (BOOL)canAddParticipant:(id)a3;
- (BOOL)canAddParticipants:(id)a3;
- (BOOL)canHaveMultipleParticipants;
- (BOOL)canLeaveChat;
- (BOOL)canRemoveParticipants:(id)a3;
- (BOOL)canSend;
- (BOOL)canSendCurrentLocationMessage;
- (BOOL)canSendInlineReply;
- (BOOL)canSendMessage:(id)a3;
- (BOOL)canSendTransfer:(id)a3;
- (BOOL)containsActiveBIASession;
- (BOOL)containsMessageFromContactOrMe;
- (BOOL)deleteAllHistory;
- (BOOL)didSendAFinishedMessage;
- (BOOL)forceMMS;
- (BOOL)hasBeenConfigured;
- (BOOL)hasCancellableScheduledMessage;
- (BOOL)hasCommSafetySensitiveMessage;
- (BOOL)hasCommSafetySensitiveMessageFromSomeoneElse;
- (BOOL)hasEarlierMessagesToLoad;
- (BOOL)hasHadSuccessfulQuery;
- (BOOL)hasKnownParticipants;
- (BOOL)hasKnownParticipantsCache;
- (BOOL)hasLeftGroup;
- (BOOL)hasMessageFromMe;
- (BOOL)hasMessageFromService:(id)a3;
- (BOOL)hasMessageWithServiceCapability:(id)a3;
- (BOOL)hasMoreMessagesToLoad;
- (BOOL)hasMoreRecentMessagesToLoad;
- (BOOL)hasQueriedForSiblingChats;
- (BOOL)hasRecipientsFollowingLocation;
- (BOOL)hasRecipientsSharingLocation;
- (BOOL)hasRefreshedServiceForSending;
- (BOOL)hasSentMessageToBusiness;
- (BOOL)hasSiblingRecipientsSharingLocation;
- (BOOL)hasStoredMessageWithGUID:(id)a3;
- (BOOL)hasSurfRequest;
- (BOOL)hasSurfRequestForPaymentType:(unint64_t)a3;
- (BOOL)hasSurfRequestNotFromMe:(id)a3;
- (BOOL)hasUnhandledInvitation;
- (BOOL)hasVerifiedBusiness;
- (BOOL)ignoreDowngradeStatusUpdates;
- (BOOL)isAppleChat;
- (BOOL)isAutoDonatingMessages;
- (BOOL)isBusinessChat;
- (BOOL)isCategorized;
- (BOOL)isChatBot;
- (BOOL)isCommSafetySensitiveMessageRecent;
- (BOOL)isCurrentlyDownloadingPurgedAssets;
- (BOOL)isCurrentlyDownloadingPurgedAttachments;
- (BOOL)isDeletingIncomingMessages;
- (BOOL)isDowngraded;
- (BOOL)isDownloadingPendingSatelliteMessages;
- (BOOL)isEmergencyChat;
- (BOOL)isFirstMessageInvitation;
- (BOOL)isGroupChat;
- (BOOL)isHoldingChatItemsUpdatesForReason:(id)a3;
- (BOOL)isInScrutinyMode;
- (BOOL)isInterworking;
- (BOOL)isLastIncomingFinishedMessageNotiMessage;
- (BOOL)isLastMessageTypingIndicator;
- (BOOL)isMakoChat;
- (BOOL)isMapKitBusinessChat;
- (BOOL)isMessagesAuthorizedToAccessFocusStatus;
- (BOOL)isMuted;
- (BOOL)isOscarChat;
- (BOOL)isPinned;
- (BOOL)isRCS;
- (BOOL)isReadOnly;
- (BOOL)isRecipientAbleToDowngradeToSMS;
- (BOOL)isRecovered;
- (BOOL)isReplyEnabled;
- (BOOL)isSMS;
- (BOOL)isSatelliteMessagingCompatible;
- (BOOL)isShowingEditHistoryForAnyChatItem;
- (BOOL)isShowingEditHistoryForChatItemGUID:(id)a3;
- (BOOL)isStewieChat;
- (BOOL)isStewieEmergencyChat;
- (BOOL)isStewieRoadsideChat;
- (BOOL)isStewieSharingChat;
- (BOOL)isSubscriptionSwitchParticipantAddTypeFound;
- (BOOL)isUnregistered;
- (BOOL)isUpdatingChatItems;
- (BOOL)lastMessageExists;
- (BOOL)lastUsedSatelliteStatus;
- (BOOL)lastUsedShowTextEmergencyServicesStatus;
- (BOOL)lastUsedShowTextRoadsideProviderStatus;
- (BOOL)localUserIsRecording;
- (BOOL)localUserIsTyping;
- (BOOL)mapsToTUConversation:(id)a3;
- (BOOL)prefersTextResponseToIncomingAudioMessages;
- (BOOL)receivedResponseForChat;
- (BOOL)repliedToChat;
- (BOOL)serviceSwitchRequested;
- (BOOL)shouldBeAllowListed;
- (BOOL)shouldDisplayOffGridModeStatus;
- (BOOL)shouldDisplayUnavailabilityIndicator;
- (BOOL)shouldForceServerStatusRefresh;
- (BOOL)shouldForceToSMS;
- (BOOL)shouldShowAudioButtonInEntryView;
- (BOOL)shouldShowAutoDonationAction;
- (BOOL)supportsCapabilities:(unint64_t)a3;
- (BOOL)supportsFilteringExtensions;
- (BOOL)supportsSendingReadReceipts;
- (BOOL)supportsSendingTypingIndicators;
- (BOOL)wantsSenderBlackholeWarning;
- (BOOL)wasDetectedAsSMSSpam;
- (BOOL)wasInvitationHandled;
- (IMAccount)account;
- (IMBrand)brand;
- (IMChat)init;
- (IMChatItem)lastDeletableChatItem;
- (IMChatItemRules)chatItemRules;
- (IMChatScrutinyController)chatScrutinyController;
- (IMDaemonProtocol)daemonController;
- (IMHandle)businessHandle;
- (IMHandle)cachedEUHandle;
- (IMHandle)emergencyUserHandle;
- (IMHandle)recipient;
- (IMInlineReplyController)inlineReplyController;
- (IMMessage)firstMessage;
- (IMMessage)invitationForPendingParticipants;
- (IMMessage)lastFinishedMessage;
- (IMMessage)lastIncomingFinishedMessage;
- (IMMessage)lastIncomingFinishedMessageWithTextContent;
- (IMMessage)lastIncomingMessage;
- (IMMessage)lastIncomingReplyableMessage;
- (IMMessage)lastMessage;
- (IMMessage)lastPendingSatelliteSendMessage;
- (IMMessage)lastSentMessage;
- (IMMessageItem)firstUnreadMessageItem;
- (IMMessagePartChatItem)lastTapbackableChatItemNotFromMe;
- (IMMomentSharePresentationCache)momentSharePresentationCache;
- (IMOrderingTools)orderingTools;
- (IMParticipantChangeChatItem)subscriptionSwitchParticipantAddChatItem;
- (IMReasonTrackingUpdater)chatItemsUpdater;
- (IMScheduledUpdater)downgradeStateUpdater;
- (IMSendProgress)sendProgress;
- (IMSharedEmergencyInfo)emergencyUserInfo;
- (IMTimingCollection)timingCollection;
- (NSArray)alternativeSpeakableMatches;
- (NSArray)attachments;
- (NSArray)chatItems;
- (NSArray)frequentReplies;
- (NSArray)participantDNDContactHandles;
- (NSArray)participants;
- (NSArray)replySuggestions;
- (NSData)engramID;
- (NSDate)availabilityStatusPublishedDate;
- (NSDate)earliestCachedMessageDate;
- (NSDate)earliestRecoverableMessageDeletionDate;
- (NSDate)lastCompletedServiceReachabilityRequestStartTime;
- (NSDate)lastFinishedMessageDate;
- (NSDate)lastSatelliteFetchDate;
- (NSDate)lastScheduledMessageCreatedDate;
- (NSDate)lastSentMessageDate;
- (NSDate)lastTUConversationCreatedDate;
- (NSDate)latestRecoverableMessageDeletionDate;
- (NSDate)watermarkDate;
- (NSDictionary)bizIntent;
- (NSDictionary)proofreadingInfo;
- (NSMutableArray)messagesPendingJoin;
- (NSMutableArray)showingEditHistoryForChatItemGUIDs;
- (NSMutableDictionary)chatProperties;
- (NSMutableDictionary)participantProperties;
- (NSMutableDictionary)participantStates;
- (NSMutableSet)_guids;
- (NSNumber)cachedStewieSharingChat;
- (NSNumber)countOfAttachmentsNotCachedLocally;
- (NSNumber)countOfMessagesMarkedAsSpam;
- (NSSet)allSiblingFMFHandles;
- (NSSet)allSiblingFindMyHandles;
- (NSSet)findMyHandles;
- (NSSet)fmfHandles;
- (NSSet)mergedPinningIdentifiers;
- (NSString)cachedBusinessName;
- (NSString)chatIdentifier;
- (NSString)currentLocationGUID;
- (NSString)currentUnreadHistoryQuery;
- (NSString)description;
- (NSString)deviceIndependentID;
- (NSString)displayName;
- (NSString)downgradeStateForDebugMenu;
- (NSString)groupChatIdentifierUppercase;
- (NSString)groupID;
- (NSString)guid;
- (NSString)identifier;
- (NSString)identityHash;
- (NSString)interworkingService;
- (NSString)lastAddressedHandleID;
- (NSString)lastAddressedSIMID;
- (NSString)lastSeenMessageGuid;
- (NSString)lastUndeliveredMessageGUIDForForcedQuery;
- (NSString)localTypingMessageGUID;
- (NSString)localUserIsComposing;
- (NSString)originalGroupID;
- (NSString)personCentricID;
- (NSString)pinningIdentifier;
- (NSString)pronunciationHint;
- (NSString)roomName;
- (NSString)roomNameWithoutSuffix;
- (NSString)stewieSharingSuggestedName;
- (NSString)suggestedRepliesData;
- (NSString)typingGUID;
- (char)downgradeState;
- (double)latestTypingIndicatorTimeInterval;
- (id)_archivedItemsToReplace:(id)a3 isReplacingItems:(BOOL)a4;
- (id)_consecutiveDowngradeAttemptsViaManualDowngrades:(BOOL)a3;
- (id)_existingMessageFromMessagePartGUID:(id)a3;
- (id)_fetchMessagesBeforeAndAfterGUID:(id)a3 numberOfMessagesToLoadBeforeGUID:(unint64_t)a4 numberOfMessagesToLoadAfterGUID:(unint64_t)a5 threadIdentifier:(id)a6 synchronous:(BOOL)a7 completion:(id)a8;
- (id)_fetchMessagesUpToGUID:(id)a3 limit:(unint64_t)a4 synchronous:(BOOL)a5 completion:(id)a6;
- (id)_fetchMessagesUpToLimit:(unint64_t)a3 synchronous:(BOOL)a4 completion:(id)a5;
- (id)_generatePersonCentricID;
- (id)_getCurrentLocale;
- (id)_getDeleteChatItemMap:(id)a3;
- (id)_getMessageChatItemMap:(id)a3 withDeleteMap:(id)a4 andAllChatItems:(id)a5;
- (id)_initWithDictionaryRepresentation:(id)a3 items:(id)a4 participantsHint:(id)a5 accountHint:(id)a6;
- (id)_initWithGUID:(id)a3 account:(id)a4 style:(unsigned __int8)a5 roomName:(id)a6 displayName:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 items:(id)a10 participants:(id)a11 isFiltered:(int64_t)a12 hasHadSuccessfulQuery:(BOOL)a13 isRecovered:(BOOL)a14 isDeletingIncomingMessages:(BOOL)a15;
- (id)_initWithItems:(id)a3;
- (id)_keyTransparencyVerifier;
- (id)_ktQueue;
- (id)_lastChatItemMatchingCriteria:(id)a3;
- (id)_lastFinishedMessageDateForChat:(id)a3;
- (id)_lastKTVerifierResultForParticipant:(id)a3;
- (id)_mergeParticipantIDs;
- (id)_participantListStringForNames:(id)a3 visibleNameCount:(int64_t)a4;
- (id)_pendingParticipants;
- (id)_performQueryWithKey:(id)a3 loadImmediately:(BOOL)a4 block:(id)a5;
- (id)_performQueryWithKey:(id)a3 loadImmediately:(BOOL)a4 block:(id)a5 completion:(id)a6;
- (id)_previousAccountForService:(id)a3;
- (id)_privateInitWithAccount:(id)a3 style:(unsigned __int8)a4 roomName:(id)a5 messages:(id)a6 participants:(id)a7 isFiltered:(int64_t)a8 hasHadSuccessfulQuery:(BOOL)a9 isRecovered:(BOOL)a10 isDeletingIncomingMessages:(BOOL)a11;
- (id)_renderingDataDictionary;
- (id)_serviceForCapabilityCheck;
- (id)_storedWatermarkMessageID;
- (id)activeParticipantsForTUConversation;
- (id)allChatProperties;
- (id)allMessagesToReportAsSpam;
- (id)allPropertiesOfParticipant:(id)a3;
- (id)associatedBusinessID;
- (id)beginObservingHandleStatuses;
- (id)callDurationStringForTuCall;
- (id)chatItemUpdaterLogHandle;
- (id)chatItemsForItems:(id)a3;
- (id)chatRegistry;
- (id)chatSummary;
- (id)chatSummaryMessageGUID;
- (id)contacts;
- (id)conversation;
- (id)conversationContext;
- (id)conversationWithUUID:(id)a3;
- (id)currentTUCall;
- (id)displayNameWithDescriptor:(IMChatDisplayNameDescriptor)a3;
- (id)displayNameWithRawAddress:(BOOL)a3 isSpamFilteringEnabled:(BOOL)a4;
- (id)getParticipantsWithKTUIStatus:(unint64_t)a3;
- (id)hashOfParticipantIDs;
- (id)lastIncomingReplyableChatItem;
- (id)lastRelatedIncomingFinishedMessageTextContentWithLimit:(int64_t)a3;
- (id)lastTranslatableMessageGUIDWithLanguageCode:(id)a3;
- (id)loadFrequentRepliesLimit:(unint64_t)a3 loadImmediately:(BOOL)a4;
- (id)loadMessagesBeforeAndAfterGUID:(id)a3 numberOfMessagesToLoadBeforeGUID:(unint64_t)a4 numberOfMessagesToLoadAfterGUID:(unint64_t)a5 loadImmediately:(BOOL)a6 threadIdentifier:(id)a7;
- (id)loadMessagesBeforeDate:(id)a3 limit:(unint64_t)a4;
- (id)loadMessagesBeforeDate:(id)a3 limit:(unint64_t)a4 loadImmediately:(BOOL)a5;
- (id)loadMessagesUpToGUID:(id)a3 date:(id)a4 limit:(unint64_t)a5 loadImmediately:(BOOL)a6;
- (id)loadMessagesUpToGUID:(id)a3 limit:(unint64_t)a4;
- (id)loadUnreadMessagesWithLimit:(unint64_t)a3 fallbackToMessagesUpToGUID:(id)a4;
- (id)loadUnreadMessagesWithLimit:(unint64_t)a3 fallbackToMessagesUpToGUID:(id)a4 loadImmediately:(BOOL)a5;
- (id)localizedUnreadShortcutTitle;
- (id)messageForGUID:(id)a3;
- (id)messageGuidsForMyUnreadMentions;
- (id)messagesForScheduledMessageSectionWithTranscriptItem:(id)a3;
- (id)messagesToReportAsSpamFromChatItems:(id)a3;
- (id)momentShareCache;
- (id)muteUntilDate;
- (id)participantHandleIDs;
- (id)participantsWithState:(unint64_t)a3;
- (id)persistentMenu;
- (id)recentIncomingMessagesWithTextContentForReplySuggestions;
- (id)recentOugoingMessagesWithTextContentForReplySuggestions;
- (id)remoteMembersForTUConversation;
- (id)sendProgressDelegate;
- (id)stateDictionaryForDiagnosticsRequest;
- (id)testChatItems;
- (id)valueForChatProperty:(id)a3;
- (id)valueForProperty:(id)a3 ofParticipant:(id)a4;
- (int64_t)_compareChat:(id)a3 withDate:(id)a4 withDate:(id)a5;
- (int64_t)_uncachedInterworkingState;
- (int64_t)autoDonationBehavior;
- (int64_t)cachedShouldShowReportSpam;
- (int64_t)cachedShouldShowSpam;
- (int64_t)chatPropertyValueFor:(int64_t)a3;
- (int64_t)compareChatByDate:(id)a3;
- (int64_t)compareChatByLastFinishedMessageDate:(id)a3;
- (int64_t)filterCategory;
- (int64_t)filterSubCategory;
- (int64_t)hasKnownParticipantsCacheStatus;
- (int64_t)hybridGroupState;
- (int64_t)interworkingState;
- (int64_t)isFiltered;
- (int64_t)joinState;
- (int64_t)lastFinishedMessageID;
- (int64_t)lastMessageTimeStampOnLoad;
- (int64_t)numberOfTimesRespondedToThread;
- (int64_t)smsCategory;
- (int64_t)transcriptSharingState;
- (int64_t)wasDetectedAsSMSSpamCacheStatus;
- (int64_t)watermarkMessageID;
- (unint64_t)_flagsForCancelTypingIndicatorMessage;
- (unint64_t)_flagsForTypingIndicatorMessage:(BOOL)a3;
- (unint64_t)capabilities;
- (unint64_t)conversationKTUIStatus;
- (unint64_t)dbFailedCount;
- (unint64_t)dbUnreadCount;
- (unint64_t)getKTDisplayStatusAndRelatedPeerHandles:(id *)a3;
- (unint64_t)keyTransparencyStatusForAffectedHandles:(id *)a3;
- (unint64_t)ktStatus;
- (unint64_t)lastKTStatus;
- (unint64_t)markAsSpam:(unint64_t)a3;
- (unint64_t)markAsSpam:(unint64_t)a3 isJunkReportedToCarrier:(BOOL)a4;
- (unint64_t)messageCount;
- (unint64_t)messageFailureCount;
- (unint64_t)numberOfMessagesToKeepLoaded;
- (unint64_t)overallChatStatus;
- (unint64_t)paymentTypeForMessage:(id)a3;
- (unint64_t)pendingIncomingSatelliteMessageCount;
- (unint64_t)recoverableMessagesCount;
- (unint64_t)scrutinyModeAttemptCount;
- (unint64_t)stateForParticipant:(id)a3;
- (unint64_t)totalSatelliteMessageCount;
- (unint64_t)unreadMessageCount;
- (unint64_t)unreadRecoverableMessagesCount;
- (unsigned)chatStyle;
- (void)__clearReadMessageCache;
- (void)_accountControllerUpdated:(id)a3;
- (void)_accountLoggedOut:(id)a3;
- (void)_addParticipants:(id)a3 withState:(unint64_t)a4;
- (void)_automation_markAsRead:(BOOL)a3 messageGUID:(id)a4 forChatGUID:(id)a5 fromMe:(BOOL)a6;
- (void)_calculateDowngradeState;
- (void)_calculateDowngradeStateTimerFired;
- (void)_clearCachedIdentifier;
- (void)_clearDowngradeMarkers;
- (void)_clearPendingMessages;
- (void)_clearUnreadCount;
- (void)_closeSession:(BOOL)a3;
- (void)_configureLocationShareItem:(id)a3;
- (void)_daemonAlive:(id)a3;
- (void)_daemonDied:(id)a3;
- (void)_delayedInvalidateDowngradeState;
- (void)_deleteTransfersWithGUIDs:(id)a3 fromChatItems:(id)a4;
- (void)_endTiming;
- (void)_engroupParticipantsUpdated;
- (void)_fixItemForSendingMessageTime:(id)a3;
- (void)_fixSendingItemDateAndSortID:(id)a3;
- (void)_handleAddressBookChangeForRecipientUID:(id)a3;
- (void)_handleBalloonPluginAttributionChanged;
- (void)_handleItem:(id)a3;
- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4;
- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4 keepExistingIndex:(BOOL)a5;
- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4 updateReplyCounts:(BOOL)a5;
- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4 updateReplyCounts:(BOOL)a5 keepExistingIndex:(BOOL)a6;
- (void)_handleItem:(id)a3 keepExistingIndex:(BOOL)a4;
- (void)_handleMessageGUIDDeletions:(id)a3;
- (void)_insertHistoricalMessages:(id)a3 queryID:(id)a4 isRefresh:(BOOL)a5 isHistoryQuery:(BOOL)a6;
- (void)_insertHistoricalMessages:(id)a3 queryID:(id)a4 isRefresh:(BOOL)a5 isHistoryQuery:(BOOL)a6 isReplacingItems:(BOOL)a7 limit:(unint64_t)a8 hasMessagesBefore:(BOOL)a9 hasMessagesAfter:(BOOL)a10;
- (void)_insertHistoricalMessages:(id)a3 queryID:(id)a4 isRefresh:(BOOL)a5 isHistoryQuery:(BOOL)a6 limit:(unint64_t)a7;
- (void)_itemsDidChange:(id)a3;
- (void)_markItemAsPlayed:(id)a3;
- (void)_momentShareCacheDidChange:(id)a3;
- (void)_participant:(id)a3 statusChanged:(int)a4;
- (void)_participant:(id)a3 statusChanged:(int)a4 postNotification:(BOOL)a5;
- (void)_participants:(id)a3 statusChanged:(int)a4;
- (void)_participants:(id)a3 statusChanged:(int)a4 postNotification:(BOOL)a5;
- (void)_persistSortIDFromReplacedItem:(id)a3 toItem:(id)a4;
- (void)_postIMChatItemsDidChangeNotificationWithInserted:(id)a3 removed:(id)a4 reload:(id)a5 regenerate:(id)a6 oldChatItems:(id)a7 newChatItems:(id)a8;
- (void)_postNotification:(id)a3 userInfo:(id)a4;
- (void)_recalculateIsInterworking;
- (void)_refreshServiceForSendingIfNeededWithMessage:(id)a3;
- (void)_refreshServiceForSendingWithDaemon;
- (void)_refreshServiceForSendingWithLegacyPath;
- (void)_reloadChatItemsForHandleAvailabilityChange;
- (void)_reloadChatItemsForJunkStateChange;
- (void)_reloadChatItemsForKeyTransparencyStatusChange;
- (void)_reloadChatItemsForSatelliteStateChangeIfRequired:(id)a3;
- (void)_reloadChatItemsForServiceChange;
- (void)_removeItem:(id)a3;
- (void)_removeItemsForGuids:(id)a3;
- (void)_replaceItems:(id)a3;
- (void)_replaceStaleChatItems;
- (void)_resetForceServerStatusRefresh;
- (void)_sendMessage:(id)a3 adjustingSender:(BOOL)a4 shouldQueue:(BOOL)a5;
- (void)_sendMessage:(id)a3 withAccount:(id)a4 adjustingSender:(BOOL)a5 shouldQueue:(BOOL)a6;
- (void)_setAccount:(id)a3;
- (void)_setAccount:(id)a3 locally:(BOOL)a4;
- (void)_setAndIncrementDowngradeMarkersForManual:(BOOL)a3;
- (void)_setAttachments:(id)a3;
- (void)_setChatProperties:(id)a3;
- (void)_setCountOfAttachmentsNotCachedLocally:(id)a3;
- (void)_setCountOfMessagesMarkedAsSpam:(id)a3;
- (void)_setDBFailedCount:(unint64_t)a3;
- (void)_setDBUnreadCount:(unint64_t)a3;
- (void)_setDBUnreadCount:(unint64_t)a3 postNotification:(BOOL)a4;
- (void)_setDisplayName:(id)a3;
- (void)_setGUIDs:(id)a3;
- (void)_setIsDownloadingPendingSatelliteMessages:(BOOL)a3 postNotification:(BOOL)a4;
- (void)_setIsDownloadingPurgedAssets:(BOOL)a3;
- (void)_setJoinState:(int64_t)a3;
- (void)_setJoinState:(int64_t)a3 quietly:(BOOL)a4;
- (void)_setLocalUserIsComposing:(id)a3 suppliedGUID:(id)a4;
- (void)_setLocalUserIsComposing:(id)a3 suppliedGUID:(id)a4 typingIndicatorData:(id)a5;
- (void)_setParticipantState:(unint64_t)a3 forHandle:(id)a4 postNotification:(BOOL)a5;
- (void)_setParticipantState:(unint64_t)a3 forHandles:(id)a4 postNotification:(BOOL)a5;
- (void)_setPendingIncomingSatelliteMessageCount:(unint64_t)a3 postNotification:(BOOL)a4;
- (void)_setPreviousAccount:(id)a3 forService:(id)a4;
- (void)_setRenderingDataDictionary:(id)a3;
- (void)_setStartSendProgressImmediatelyIfNecessary;
- (void)_setTimerForReadMessageCache;
- (void)_setupObservation;
- (void)_showErrorMessage:(id)a3;
- (void)_startTiming:(id)a3;
- (void)_targetToService:(id)a3 newComposition:(BOOL)a4;
- (void)_updateBizIntentForMessageIfNeeded:(id)a3;
- (void)_updateChatItemsWithDataDetectorResultsForReason:(id)a3;
- (void)_updateChatItemsWithReason:(id)a3 block:(id)a4;
- (void)_updateChatItemsWithReason:(id)a3 block:(id)a4 shouldPost:(BOOL)a5;
- (void)_updateDisplayName:(id)a3;
- (void)_updateDisplayName:(id)a3 sender:(id)a4;
- (void)_updateDowngradeState:(char)a3 checkAgainInterval:(double)a4;
- (void)_updateEngramID:(id)a3;
- (void)_updateExistingMessageWithSyndicationAction:(id)a3;
- (void)_updateFileAttachmentGUIDsForMessageIfNeeded:(id)a3 withPayloadAttachments:(id)a4;
- (void)_updateHybridGroupStateWithPerParticipantIDSStatus:(id)a3;
- (void)_updateHybridGroupStateWithReachabilityResult:(id)a3;
- (void)_updateLastAddressedHandleID:(id)a3;
- (void)_updateLastAddressedSIMID:(id)a3;
- (void)_updateLocaleForMessageIfNeeded:(id)a3;
- (void)_updateLocationShareItemsForSender:(id)a3;
- (void)_updateMessageItemStewieIfNeeded:(id)a3;
- (void)_updateMessageItemTimeIfNeeded:(id)a3;
- (void)_updatePayloadForMessageIfNeeded:(id)a3;
- (void)_updateRepliesIfNecessaryWithItem:(id)a3;
- (void)_updateRepliesIfNecessaryWithRemovedItems:(id)a3 threadIdentifiersOfRemovedParts:(id)a4;
- (void)_updateScheduledMessageTimeOffsetIfNeeded:(id)a3;
- (void)_updateSenderForMessageIfNeeded:(id)a3 adjustingSender:(BOOL)a4;
- (void)_updateSenderForMessageIfNeeded:(id)a3 adjustingSender:(BOOL)a4 withAccount:(id)a5;
- (void)_updateTypingGUIDForMessageIfNeeded:(id)a3;
- (void)_updateWalletBreadcrumbingAssociationForMessageIfNeeded:(id)a3;
- (void)_validateChatRegistrationWithRegistry;
- (void)acceptInvitation;
- (void)addHandlesToGroupFaceTimeChatIfRegistered:(id)a3;
- (void)addPendingParticipants:(id)a3;
- (void)autoInviteToViewAvailabilityIfNeeded;
- (void)autoInviteToViewOffGridModeIfNeeded;
- (void)autoReportSpam;
- (void)beginHoldingChatItemsUpdatesForReason:(id)a3;
- (void)beginListeningToAttributionChanges;
- (void)beginShowingEditHistoryForChatItemGUID:(id)a3;
- (void)canShareFocusStatusWithCompletion:(id)a3;
- (void)cancelScheduledMessageItem:(id)a3 atPartIndex:(int64_t)a4 shouldRetractSubject:(BOOL)a5;
- (void)cancelScheduledMessageItem:(id)a3 cancelType:(unint64_t)a4;
- (void)cancelScheduledMessageWithGUID:(id)a3 destinations:(id)a4 cancelType:(unint64_t)a5;
- (void)cleanupChatItems;
- (void)clear;
- (void)clearSMSCategory;
- (void)clearScrutinyMode;
- (void)closeSession;
- (void)consumeSummaryIfNeeded;
- (void)contextInfo;
- (void)createIMChatItemForTransientAttachmentWithAssetUUID:(id)a3 parentChatItemGUID:(id)a4;
- (void)dealloc;
- (void)declineInvitation;
- (void)deleteChatItems:(id)a3;
- (void)deleteChatItems:(id)a3 fromChatItems:(id)a4;
- (void)deleteChatItemsWithTransferGUIDs:(id)a3 fromMessageItem:(id)a4;
- (void)deleteIMMessageItems:(id)a3;
- (void)deleteTransfers:(id)a3;
- (void)didUnregisterFromRegistry:(id)a3;
- (void)dismissInlineReplies;
- (void)downgradeMessage:(id)a3 manualDowngrade:(BOOL)a4;
- (void)downgradeMessage:(id)a3 manualDowngrade:(BOOL)a4 downgradeChat:(BOOL)a5;
- (void)downloadPurgedAttachments;
- (void)editMessageItem:(id)a3 atPartIndex:(int64_t)a4 withNewPartText:(id)a5 backwardCompatabilityText:(id)a6;
- (void)editScheduledMessageItem:(id)a3 atPartIndex:(int64_t)a4 withNewPartText:(id)a5;
- (void)editScheduledMessageItem:(id)a3 scheduleType:(unint64_t)a4 deliveryTime:(id)a5;
- (void)editScheduledMessageItems:(id)a3 scheduleType:(unint64_t)a4 deliveryTime:(id)a5;
- (void)endAllHoldsOnChatItemsUpdatesForReason:(id)a3;
- (void)endHoldingChatItemsUpdatesForAllReasons;
- (void)endHoldingChatItemsUpdatesForReason:(id)a3;
- (void)endListeningToAttributionChanges;
- (void)endShowingEditHistoryForAllChatItems;
- (void)endShowingEditHistoryForChatItemGUID:(id)a3;
- (void)fetchIncomingPendingMessagesOverSatellite;
- (void)fetchIsCurrentlyDownloadingPurgedAttachments:(id)a3;
- (void)fetchKTStatus;
- (void)fetchMessageHistoryForDateInterval:(id)a3 completion:(id)a4;
- (void)fetchMessagesBeforeAndAfterGUID:(id)a3 numberOfMessagesToLoadBeforeGUID:(unint64_t)a4 numberOfMessagesToLoadAfterGUID:(unint64_t)a5 threadIdentifier:(id)a6 completion:(id)a7;
- (void)fetchMessagesUpToGUID:(id)a3 limit:(unint64_t)a4 completion:(id)a5;
- (void)fetchMessagesUpToLimit:(unint64_t)a3 completion:(id)a4;
- (void)fetchOldestMessageDateWithCompletion:(id)a3;
- (void)forceCancelTypingIndicator;
- (void)ignoreKTFailure;
- (void)initiateTUConversationWithScreenShareType:(unint64_t)a3;
- (void)initiateTUConversationWithVideoEnabled:(BOOL)a3;
- (void)initiateTUDialRequestWithVideoEnabled:(BOOL)a3;
- (void)invalidateHasKnownParticipantsCache;
- (void)invalidateSpamIndicatorCachedValues;
- (void)invalidateSpamIndicatorCachedValuesIfNeeded;
- (void)inviteParticipants:(id)a3 reason:(id)a4;
- (void)isInvitedToViewMyFocusStatusWithCompletion:(id)a3;
- (void)join;
- (void)joinExistingConversation:(id)a3;
- (void)joinExistingTUConversation;
- (void)joinExistingTUConversationWithUUID:(id)a3;
- (void)leave;
- (void)leaveConversation;
- (void)leaveCurrentTUCall;
- (void)loadAttachments:(id)a3;
- (void)loadInlineRepliesForThreadIdentifier:(id)a3 threadOriginator:(id)a4 messageGuid:(id)a5;
- (void)loadParticipantContactsIfNecessary;
- (void)markAllLocationShareItemsAsUnactionable;
- (void)markAllMessagesAsRead;
- (void)markAsAutoSpamReported;
- (void)markAsHasBeenBlockContact;
- (void)markBusinessChatAsSpam:(unint64_t)a3;
- (void)markChatItemAsNotifyRecipient:(id)a3;
- (void)markChatItemAsPlayed:(id)a3;
- (void)markChatItemAsPlayedExpressiveSend:(id)a3;
- (void)markChatItemAsSaved:(id)a3;
- (void)markKTFailureSeen;
- (void)markLastMessageAsUnread;
- (void)markMessageAsRead:(id)a3;
- (void)markMessagesAsRead:(id)a3;
- (void)markRepliedForMessageGUID:(id)a3;
- (void)momentSharePresentationCacheDidChange:(id)a3;
- (void)photoLibraryPersistedSyndicatedAssetSetDidChange;
- (void)reasonTrackingUpdater:(id)a3 needsUpdateForReasons:(id)a4 followingHoldForReason:(id)a5;
- (void)recoverFromJunk;
- (void)refreshServiceForSending;
- (void)reloadChatItemsForSuggestedRepliesChange;
- (void)remove;
- (void)removeMentionMessageGUID:(id)a3;
- (void)removeParticipants:(id)a3 reason:(id)a4;
- (void)replaceItemWhenReplied:(id)a3;
- (void)reportJunkToCarrier;
- (void)reportLazuliSpam:(unint64_t)a3 isBot:(BOOL)a4;
- (void)repositionSticker:(id)a3 associatedChatItem:(id)a4;
- (void)resendEditedMessageItem:(id)a3 forPartIndex:(int64_t)a4 withBackwardCompatabilityText:(id)a5;
- (void)resendGroupPhoto;
- (void)resortMessages;
- (void)retractMessagePart:(id)a3;
- (void)retractScheduledMessagePartIndexes:(id)a3 fromChatItem:(id)a4;
- (void)retryGroupPhotoUploadIfNecessary;
- (void)saveWatermark;
- (void)sendAutoDonationUpdate:(BOOL)a3;
- (void)sendCurrentLocationMessage;
- (void)sendGroupPhotoUpdate:(id)a3;
- (void)sendMessage:(id)a3;
- (void)sendMessage:(id)a3 onAccount:(id)a4;
- (void)sendMessage:(id)a3 onService:(id)a4;
- (void)sendPendingSatelliteMessages;
- (void)sendProgress:(id)a3 progressDidChange:(float)a4 sendingMessages:(id)a5 sendCount:(unint64_t)a6 totalCount:(unint64_t)a7 finished:(BOOL)a8;
- (void)sendSyndicationAction:(unsigned __int8)a3 forMessagePartGUID:(id)a4 syndicatedMessagePartRange:(_NSRange)a5;
- (void)sendUpdatedCollaborationMetadata:(id)a3 forMessageGUID:(id)a4;
- (void)setAllowedByScreenTime:(BOOL)a3;
- (void)setAttachments:(id)a3;
- (void)setAutoDonationBehavior:(int64_t)a3;
- (void)setBizIntent:(id)a3;
- (void)setCachedEUHandle:(id)a3;
- (void)setCachedShouldShowReportSpam:(int64_t)a3;
- (void)setCachedShouldShowSpam:(int64_t)a3;
- (void)setCachedStewieSharingChat:(id)a3;
- (void)setChatItemRules:(id)a3;
- (void)setChatItemsUpdater:(id)a3;
- (void)setChatProperties:(id)a3;
- (void)setContextInfo:(void *)a3;
- (void)setCountOfAttachmentsNotCachedLocally:(id)a3;
- (void)setCountOfMessagesMarkedAsSpam:(id)a3;
- (void)setCurrentLocationGUID:(id)a3;
- (void)setCurrentUnreadHistoryQuery:(id)a3;
- (void)setDbFailedCount:(unint64_t)a3;
- (void)setDbUnreadCount:(unint64_t)a3;
- (void)setDeletingIncomingMessages:(BOOL)a3;
- (void)setDidSendAFinishedMessage:(BOOL)a3;
- (void)setDisplayName:(id)a3;
- (void)setDowngradeState:(char)a3;
- (void)setDowngradeStateUpdater:(id)a3;
- (void)setEarliestCachedMessageDate:(id)a3;
- (void)setEarliestRecoverableMessageDeletionDate:(id)a3;
- (void)setForceMMS:(BOOL)a3;
- (void)setFrequentReplies:(id)a3;
- (void)setGroupChatIdentifierUppercase:(id)a3;
- (void)setGroupID:(id)a3;
- (void)setHasBeenConfigured:(BOOL)a3;
- (void)setHasCancellableScheduledMessage:(BOOL)a3;
- (void)setHasEarlierMessagesToLoad:(BOOL)a3;
- (void)setHasHadSuccessfulQuery:(BOOL)a3;
- (void)setHasKnownParticipantsCache:(BOOL)a3;
- (void)setHasKnownParticipantsCacheStatus:(int64_t)a3;
- (void)setHasMoreRecentMessagesToLoad:(BOOL)a3;
- (void)setHasQueriedForSiblingChats:(BOOL)a3;
- (void)setHasRefreshedServiceForSending:(BOOL)a3;
- (void)setHasSurfRequest:(BOOL)a3;
- (void)setHybridGroupState:(int64_t)a3;
- (void)setIdentifier:(id)a3;
- (void)setIgnoreDowngradeStatusUpdates:(BOOL)a3;
- (void)setInterworkingService:(id)a3;
- (void)setInterworkingState:(int64_t)a3;
- (void)setInvitationForPendingParticipants:(id)a3;
- (void)setIsCurrentlyDownloadingPurgedAssets:(BOOL)a3;
- (void)setIsFiltered:(int64_t)a3;
- (void)setIsFirstMessageInvitation:(BOOL)a3;
- (void)setIsSubscriptionSwitchParticipantAddTypeFound:(BOOL)a3;
- (void)setIsUpdatingChatItems:(BOOL)a3;
- (void)setKeyTransparencyURIToUUIDMapping:(id)a3;
- (void)setLastAddressedHandleID:(id)a3;
- (void)setLastAddressedSIMID:(id)a3;
- (void)setLastCompletedServiceReachabilityRequestStartTime:(id)a3;
- (void)setLastKTStatus:(unint64_t)a3;
- (void)setLastMessageTimeStampOnLoad:(int64_t)a3;
- (void)setLastSatelliteFetchDate:(id)a3;
- (void)setLastScheduledMessageCreatedDate:(id)a3;
- (void)setLastTUConversationCreatedDate:(id)a3;
- (void)setLastUndeliveredMessageGUIDForForcedQuery:(id)a3;
- (void)setLastUsedSatelliteStatus:(BOOL)a3;
- (void)setLastUsedShowTextEmergencyServicesStatus:(BOOL)a3;
- (void)setLastUsedShowTextRoadsideProviderStatus:(BOOL)a3;
- (void)setLatestRecoverableMessageDeletionDate:(id)a3;
- (void)setLatestTypingIndicatorTimeInterval:(double)a3;
- (void)setLocalUserIsComposing:(id)a3;
- (void)setLocalUserIsComposing:(id)a3 typingIndicatorData:(id)a4;
- (void)setLocalUserIsRecording:(BOOL)a3;
- (void)setLocalUserIsTyping:(BOOL)a3;
- (void)setMergedPinningIdentifiers:(id)a3;
- (void)setMessagesPendingJoin:(id)a3;
- (void)setMuteUntilDate:(id)a3;
- (void)setOrderingTools:(id)a3;
- (void)setOriginalGroupID:(id)a3;
- (void)setOscarChat:(BOOL)a3;
- (void)setParticipantProperties:(id)a3;
- (void)setParticipantStates:(id)a3;
- (void)setParticipants:(id)a3;
- (void)setPendingIncomingSatelliteMessageCount:(unint64_t)a3;
- (void)setPersonCentricID:(id)a3;
- (void)setPrefersTextResponseToIncomingAudioMessages:(BOOL)a3;
- (void)setProofreadingInfo:(id)a3;
- (void)setRecipient:(id)a3;
- (void)setRecipient:(id)a3 locally:(BOOL)a4;
- (void)setRecoverableMessagesCount:(unint64_t)a3;
- (void)setRecovered:(BOOL)a3;
- (void)setReplySuggestions:(id)a3;
- (void)setRoomName:(id)a3;
- (void)setRoomNameWithoutSuffix:(id)a3;
- (void)setSelectedIndexOnCarouselChatItem:(id)a3 selectedIndex:(int64_t)a4;
- (void)setSendProgress:(id)a3;
- (void)setSendProgressDelegate:(id)a3;
- (void)setServiceSwitchRequested:(BOOL)a3;
- (void)setShouldShowAudioButtonInEntryView:(BOOL)a3;
- (void)setShowingEditHistoryForChatItemGUIDs:(id)a3;
- (void)setSmsCategory:(int64_t)a3;
- (void)setSubscriptionSwitchParticipantAddChatItem:(id)a3;
- (void)setSuggestedRepliesData:(id)a3;
- (void)setTimingCollection:(id)a3;
- (void)setTotalSatelliteMessageCount:(unint64_t)a3;
- (void)setTypingGUID:(id)a3;
- (void)setUnreadRecoverableMessagesCount:(unint64_t)a3;
- (void)setUnregistered:(BOOL)a3;
- (void)setValue:(id)a3 forChatProperty:(id)a4;
- (void)setValue:(id)a3 forProperty:(id)a4 ofParticipant:(id)a5;
- (void)setWasDetectedAsSMSSpamCacheStatus:(int64_t)a3;
- (void)setWasInvitationHandled:(BOOL)a3;
- (void)shareLocationWithDuration:(int64_t)a3;
- (void)startTrackingParticipantLocations;
- (void)stickerRepositionedForAssociatedChatItem:(id)a3;
- (void)stopSharingLocation;
- (void)stopTrackingParticipantLocations;
- (void)stopTranscriptSharingWithChat;
- (void)updateAssociatedBusinessID:(id)a3;
- (void)updateChatItemsSynchronouslyIfAsyncUpdateIsPending;
- (void)updateCommSafety:(int64_t)a3 forChatItem:(id)a4;
- (void)updateCommSafety:(int64_t)a3 forChatItems:(id)a4;
- (void)updateCommSafety:(int64_t)a3 forChatItems:(id)a4 parentChatItem:(id)a5;
- (void)updateIsBlackholed:(BOOL)a3;
- (void)updateIsEmergencyChat:(BOOL)a3;
- (void)updateIsFiltered:(int64_t)a3;
- (void)updateLastMessageGUID:(id)a3 forLanguageCode:(id)a4;
- (void)updateLineSwitchedTo:(id)a3;
- (void)updateMessage:(id)a3 withIndexesOfDeletedItems:(id)a4 withIndexToRangeMapOfDeletedItems:(id)a5 deleteDate:(id)a6;
- (void)updateReplySuggestions;
- (void)updateSMSCategory:(int64_t)a3 subCategory:(int64_t)a4;
- (void)updateShouldForceToSMS:(BOOL)a3;
- (void)updateTranscriptSharingState:(int64_t)a3;
- (void)updateWatermarks;
- (void)userToggledReadReceiptSwitch:(BOOL)a3;
- (void)verifyFiltering;
- (void)watermarkInForScrutinyMode;
- (void)watermarkOutForScrutinyMode;
@end

@implementation IMChat

- (unint64_t)recoverableMessagesCount
{
  return self->_recoverableMessagesCount;
}

- (void)_calculateDowngradeState
{
  uint64_t v94 = *MEMORY[0x1E4F143B8];
  if ((objc_msgSend_ignoreDowngradeStatusUpdates(self, a2, v2, v3) & 1) == 0)
  {
    if (objc_msgSend_isDowngraded(self, v5, v6, v7))
    {
      v14 = objc_msgSend_smsService(IMService, v8, v9, v10);
    }
    else
    {
      v15 = objc_msgSend_lastMessage(self, v8, v9, v10);
      v19 = objc_msgSend_sender(v15, v16, v17, v18);
      v14 = objc_msgSend_service(v19, v20, v21, v22);
    }
    if (!objc_msgSend_smsEnabled(IMServiceImpl, v11, v12, v13)) {
      goto LABEL_35;
    }
    if (objc_msgSend_chatStyle(self, v23, v24, v25) != 45) {
      goto LABEL_35;
    }
    v27 = objc_msgSend_smsService(IMServiceImpl, v23, v26, v25);

    if (v14 != v27 || !objc_msgSend__recipientIsPhoneNumber(self, v23, v28, v25)) {
      goto LABEL_35;
    }
    v29 = objc_msgSend_valueForChatProperty_(self, v23, *MEMORY[0x1E4F6C468], v25);
    v33 = v29;
    if (!v29
      || (v34 = (void *)MEMORY[0x1E4F1C9C8],
          objc_msgSend_doubleValue(v29, v30, v31, v32),
          objc_msgSend_dateWithTimeIntervalSince1970_(v34, v35, v36, v37),
          double v38 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue()),
          v38 == 0.0))
    {
      v53 = objc_msgSend_lastMessage(self, v30, v31, v32);
      v57 = objc_msgSend_error(v53, v54, v55, v56);
      uint64_t v61 = objc_msgSend_code(v57, v58, v59, v60);

      int v62 = IMOSLoggingEnabled();
      if (v61 != 43)
      {
        if (v62)
        {
          v66 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v83 = self;
            _os_log_impl(&dword_1A4AF7000, v66, OS_LOG_TYPE_INFO, "Marking self (%@) as upgraded because it does not have a downgrade time specified", buf, 0xCu);
          }
        }
        goto LABEL_34;
      }
      if (v62)
      {
        v65 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v83 = self;
          _os_log_impl(&dword_1A4AF7000, v65, OS_LOG_TYPE_INFO, "User resent as SMS in response to blackhole error; Marking chat (%@) as downgraded.",
            buf,
            0xCu);
        }
      }
      objc_msgSend__updateDowngradeState_checkAgainInterval_(self, v63, 1, v64, 0.0);
    }
    else
    {
      objc_msgSend__consecutiveDowngradeAttemptsViaManualDowngrades_(self, v30, 0, v32);
      double v39 = COERCE_DOUBLE(objc_claimAutoreleasedReturnValue());
      v42 = objc_msgSend__consecutiveDowngradeAttemptsViaManualDowngrades_(self, v40, 1, v41);
      uint64_t v43 = sub_1A4C4C980(v42, *(void **)&v39);
      BOOL v81 = 0;
      double v44 = sub_1A4C4C910(*(void **)&v38, &v81);
      if (!v81)
      {
        if (IMOSLoggingEnabled())
        {
          v70 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            v83 = self;
            __int16 v84 = 2112;
            double v85 = v38;
            _os_log_impl(&dword_1A4AF7000, v70, OS_LOG_TYPE_INFO, "Marking self (%@) as upgraded because it's time since downgrade is in the future (%@). This should not happen. File a radar.", buf, 0x16u);
          }
        }
        objc_msgSend__clearDowngradeMarkers(self, v67, v68, v69);
        goto LABEL_33;
      }
      double v45 = v44;
      double v49 = sub_1A4C4C8E8(v43);
      double v50 = v49;
      if (v45 >= v49)
      {
        int v51 = IMOSLoggingEnabled();
        if (v43)
        {
          if (v51)
          {
            v52 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413570;
              v83 = self;
              __int16 v84 = 2048;
              double v85 = v45;
              __int16 v86 = 2048;
              uint64_t v87 = v43;
              __int16 v88 = 2112;
              double v89 = v39;
              __int16 v90 = 2112;
              v91 = v42;
              __int16 v92 = 2048;
              double v93 = v50;
              _os_log_impl(&dword_1A4AF7000, v52, OS_LOG_TYPE_INFO, "Marking chat (%@) as upgraded because it's been %5.2f seconds since downgrade, larger than threshold for %ld (%@ auto, %@ manual) consecutive downgraded messages (%5.2f)", buf, 0x3Eu);
            }
          }
        }
        else if (v51)
        {
          v80 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v83 = self;
            _os_log_impl(&dword_1A4AF7000, v80, OS_LOG_TYPE_INFO, "Marking chat (%@) as upgraded because there are no active downgrade markers.", buf, 0xCu);
          }
        }
LABEL_33:

LABEL_34:
LABEL_35:
        objc_msgSend__updateDowngradeState_checkAgainInterval_(self, v23, 2, v25, 0.0);
LABEL_36:

        return;
      }
      v71 = objc_msgSend_dateByAddingTimeInterval_(*(void **)&v38, v46, v47, v48, v49);
      objc_msgSend_timeIntervalSinceNow(v71, v72, v73, v74);
      double v76 = v75;

      if (IMOSLoggingEnabled())
      {
        v79 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          v83 = self;
          __int16 v84 = 2112;
          double v85 = v39;
          __int16 v86 = 2112;
          uint64_t v87 = (uint64_t)v42;
          __int16 v88 = 2048;
          double v89 = v76;
          _os_log_impl(&dword_1A4AF7000, v79, OS_LOG_TYPE_INFO, "Marking chat (%@) as downgraded because of %@ automatic downgrades, %@ manual downgrades, with %5.2f seconds until next update check.", buf, 0x2Au);
        }
      }
      objc_msgSend__updateDowngradeState_checkAgainInterval_(self, v77, 1, v78, v76);
    }
    goto LABEL_36;
  }
}

- (BOOL)ignoreDowngradeStatusUpdates
{
  return self->_ignoreDowngradeStatusUpdates;
}

- (BOOL)isStewieChat
{
  v4 = objc_msgSend_chatIdentifier(self, a2, v2, v3);
  char v5 = MEMORY[0x1A62639C0]();

  return v5;
}

- (BOOL)isGroupChat
{
  return objc_msgSend_chatStyle(self, a2, v2, v3) != 45;
}

- (id)conversation
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  char v5 = objc_msgSend_sharedRegistry(IMChatRegistry, a2, v2, v3, 0);
  uint64_t v9 = objc_msgSend_conversationManager(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_activeConversations(v9, v10, v11, v12);

  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v24, (uint64_t)v28, 16);
  if (v15)
  {
    uint64_t v18 = v15;
    uint64_t v19 = *(void *)v25;
    while (2)
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v25 != v19) {
          objc_enumerationMutation(v13);
        }
        uint64_t v21 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if (objc_msgSend_mapsToTUConversation_(self, v16, (uint64_t)v21, v17))
        {
          id v22 = v21;
          goto LABEL_11;
        }
      }
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v24, (uint64_t)v28, 16);
      if (v18) {
        continue;
      }
      break;
    }
  }
  id v22 = 0;
LABEL_11:

  return v22;
}

- (BOOL)isReadOnly
{
  char v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v5, v6, v7, v8);

  if (isCarrierPigeonEnabled)
  {
    uint64_t v13 = objc_msgSend_sharedInstance(IMChorosMonitor, v10, v11, v12);
    int isMessagingActiveOverSatellite = objc_msgSend_isMessagingActiveOverSatellite(v13, v14, v15, v16);

    if (isMessagingActiveOverSatellite)
    {
      if ((objc_msgSend_isStewieChat(self, v10, v11, v12) & 1) == 0)
      {
        if (objc_msgSend_isGroupChat(self, v10, v11, v12)) {
          return 1;
        }
        uint64_t v28 = objc_msgSend_account(self, v25, v26, v27);
        uint64_t v32 = objc_msgSend_service(v28, v29, v30, v31);
        uint64_t v36 = objc_msgSend_iMessageLiteService(IMServiceImpl, v33, v34, v35);
        if (v32 == (void *)v36)
        {

          goto LABEL_4;
        }
        v40 = (void *)v36;
        uint64_t v41 = objc_msgSend_account(self, v37, v38, v39);
        double v45 = objc_msgSend_service(v41, v42, v43, v44);
        double v49 = objc_msgSend_satelliteSMSService(IMServiceImpl, v46, v47, v48);

        if (v45 != v49) {
          return 1;
        }
      }
    }
  }
LABEL_4:
  if (objc_msgSend_joinState(self, v10, v11, v12) == 4 && (objc_msgSend_isGroupChat(self, v18, v19, v20) & 1) == 0) {
    return objc_msgSend_isBusinessChat(self, v21, v22, v23) ^ 1;
  }
  else {
    return 0;
  }
}

- (int64_t)compareChatByLastFinishedMessageDate:(id)a3
{
  id v4 = a3;
  uint64_t v7 = objc_msgSend__lastFinishedMessageDateForChat_(self, v5, (uint64_t)v4, v6);
  uint64_t v10 = objc_msgSend__lastFinishedMessageDateForChat_(self, v8, (uint64_t)self, v9);
  int64_t v12 = objc_msgSend__compareChat_withDate_withDate_(self, v11, (uint64_t)v4, (uint64_t)v7, v10);

  return v12;
}

- (id)_lastFinishedMessageDateForChat:(id)a3
{
  id v3 = a3;
  uint64_t v7 = objc_msgSend_lastTUConversationCreatedDate(v3, v4, v5, v6);
  uint64_t v11 = objc_msgSend_lastFinishedMessageDate(v3, v8, v9, v10);
  uint64_t v15 = objc_msgSend_lastScheduledMessageCreatedDate(v3, v12, v13, v14);

  if (v7)
  {
    objc_msgSend_laterDate_(v7, v16, (uint64_t)v11, v17);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v18 = v11;
  }
  uint64_t v21 = v18;
  if (v15)
  {
    objc_msgSend_laterDate_(v15, v19, (uint64_t)v18, v20);
    id v22 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v22 = v18;
  }
  uint64_t v23 = v22;

  return v23;
}

- (NSDate)lastTUConversationCreatedDate
{
  return (NSDate *)objc_msgSend_valueForChatProperty_(self, a2, @"lastTUConversationCreatedDate", v2);
}

- (NSDate)lastScheduledMessageCreatedDate
{
  return (NSDate *)objc_msgSend_valueForChatProperty_(self, a2, @"lastScheduledMessageCreatedDate", v2);
}

- (int64_t)_compareChat:(id)a3 withDate:(id)a4 withDate:(id)a5
{
  id v8 = a3;
  int64_t v14 = objc_msgSend_compare_(a4, v9, (uint64_t)a5, v10);
  if (!v14)
  {
    uint64_t FinishedMessageID = objc_msgSend_lastFinishedMessageID(self, v11, v12, v13);
    uint64_t v19 = objc_msgSend_lastFinishedMessageID(v8, v16, v17, v18);
    uint64_t v20 = -1;
    if (v19 >= FinishedMessageID) {
      uint64_t v20 = 1;
    }
    if (v19 == FinishedMessageID) {
      int64_t v14 = 0;
    }
    else {
      int64_t v14 = v20;
    }
  }

  return v14;
}

- (BOOL)isMuted
{
  uint64_t v5 = objc_msgSend_sharedList(MEMORY[0x1E4F6E8A8], a2, v2, v3);
  LOBYTE(self) = objc_msgSend_isMutedChat_(v5, v6, (uint64_t)self, v7);

  return (char)self;
}

- (NSString)lastAddressedHandleID
{
  return self->_lastAddressedHandleID;
}

- (void)setAllowedByScreenTime:(BOOL)a3
{
  int v4 = a3;
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isContactLimitsFeatureEnabled(IMDowntimeController, a2, a3, v3))
  {
    int allowedByScreenTime = self->_allowedByScreenTime;
    self->_int allowedByScreenTime = v4;
    if (allowedByScreenTime != v4)
    {
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          uint64_t v11 = objc_msgSend_numberWithBool_(NSNumber, v9, self->_allowedByScreenTime, v10);
          int v13 = 138412546;
          int64_t v14 = self;
          __int16 v15 = 2112;
          uint64_t v16 = v11;
          _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "chat: %@ allowedByScreenTime changed to: %@", (uint8_t *)&v13, 0x16u);
        }
      }
      objc_msgSend__postNotification_userInfo_(self, v7, @"__kIMChatAllowedByScreenTimeChangedNotification", 0);
      objc_msgSend__postNotification_userInfo_(self, v12, *MEMORY[0x1E4F6CA58], 0);
    }
  }
}

- (BOOL)allowedByScreenTime
{
  uint64_t isContactLimitsFeatureEnabled = objc_msgSend_isContactLimitsFeatureEnabled(IMDowntimeController, a2, v2, v3);
  if (!isContactLimitsFeatureEnabled) {
    return 1;
  }
  uint64_t v9 = IMSharedDowntimeController(isContactLimitsFeatureEnabled, v6, v7, v8);
  char v11 = objc_msgSend_allowedToShowConversationForChat_sync_(v9, v10, (uint64_t)self, 0);

  return v11;
}

- (id)participantHandleIDs
{
  int v4 = objc_msgSend_participants(self, a2, v2, v3);
  uint64_t v7 = objc_msgSend___imArrayByApplyingBlock_(v4, v5, (uint64_t)&unk_1EF8E5B98, v6);

  return v7;
}

- (int64_t)isFiltered
{
  return self->_isFiltered;
}

- (void)_setJoinState:(int64_t)a3 quietly:(BOOL)a4
{
  if (self->_joinState == a3)
  {
    objc_msgSend__clearPendingMessages(self, a2, a3, a4);
  }
  else
  {
    self->_joinState = a3;
    objc_msgSend__clearPendingMessages(self, a2, a3, a4);
    if (!a4)
    {
      objc_msgSend__postNotification_userInfo_(self, v6, @"__kIMChatJoinStateDidChangeNotification", 0);
    }
  }
}

- (void)_clearPendingMessages
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (self->_joinState == 3 && self->_messagesPendingJoin)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        messagesPendingJoin = self->_messagesPendingJoin;
        *(_DWORD *)buf = 138412290;
        uint64_t v27 = (uint64_t)messagesPendingJoin;
        _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "messages pending join: %@", buf, 0xCu);
      }
    }
    uint64_t v8 = objc_msgSend_copy(self->_messagesPendingJoin, v3, v4, v5);
    uint64_t v9 = self->_messagesPendingJoin;
    self->_messagesPendingJoin = 0;

    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v10 = v8;
    uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v21, (uint64_t)v25, 16);
    if (v12)
    {
      uint64_t v14 = *(void *)v22;
      *(void *)&long long v13 = 138412290;
      long long v20 = v13;
      do
      {
        uint64_t v15 = 0;
        do
        {
          if (*(void *)v22 != v14) {
            objc_enumerationMutation(v10);
          }
          uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * v15);
          if (IMOSLoggingEnabled())
          {
            uint64_t v18 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v20;
              uint64_t v27 = v16;
              _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Un-pending message: %@", buf, 0xCu);
            }
          }
          objc_msgSend__sendMessage_adjustingSender_shouldQueue_(self, v17, v16, 0, 1, v20, (void)v21);
          ++v15;
        }
        while (v12 != v15);
        uint64_t v12 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v19, (uint64_t)&v21, (uint64_t)v25, 16);
      }
      while (v12);
    }
  }
}

- (NSMutableSet)_guids
{
  return self->_guids;
}

- (void)_setDBUnreadCount:(unint64_t)a3 postNotification:(BOOL)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (self->_dbUnreadCount != a3)
  {
    BOOL v4 = a4;
    self->_unint64_t dbUnreadCount = a3;
    uint64_t v6 = objc_msgSend_unreadMessageCount(self, a2, a3, a4);
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        unint64_t dbUnreadCount = self->_dbUnreadCount;
        *(_DWORD *)buf = 67109634;
        int v18 = dbUnreadCount;
        __int16 v19 = 1024;
        int v20 = v6;
        __int16 v21 = 2112;
        long long v22 = self;
        _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "_dbUnreadCount changed to %d: Posting new unread count of %d for %@", buf, 0x18u);
      }
    }
    if (v4)
    {
      char v11 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v7, v6, v8, @"__kIMChatUnreadKey");
      uint64_t v16 = v11;
      long long v13 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)&v16, (uint64_t)&v15, 1);
      objc_msgSend__postNotification_userInfo_(self, v14, @"__kIMChatUnreadCountChangedNotification", (uint64_t)v13);
    }
  }
}

- (NSString)originalGroupID
{
  return self->_originalGroupID;
}

- (void)setHasCancellableScheduledMessage:(BOOL)a3
{
  self->_hasCancellableScheduledMessage = a3;
}

- (int64_t)autoDonationBehavior
{
  return self->_autoDonationBehavior;
}

- (void)_setPendingIncomingSatelliteMessageCount:(unint64_t)a3 postNotification:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, a3, a4);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v7, v8, v9, v10);

  if (isCarrierPigeonEnabled && self->_pendingIncomingSatelliteMessageCount != a3)
  {
    self->_unint64_t pendingIncomingSatelliteMessageCount = a3;
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        unint64_t pendingIncomingSatelliteMessageCount = self->_pendingIncomingSatelliteMessageCount;
        *(_DWORD *)buf = 67109378;
        int v24 = pendingIncomingSatelliteMessageCount;
        __int16 v25 = 2112;
        uint64_t v26 = self;
        _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "_pendingIncomingSatelliteMessageCount changed to %d for %@", buf, 0x12u);
      }
    }
    if (self->_downloadingPendingSatelliteMessages)
    {
      if (a3)
      {
        unint64_t totalSatelliteMessageCount = self->_totalSatelliteMessageCount;
        if (totalSatelliteMessageCount <= a3) {
          unint64_t totalSatelliteMessageCount = a3;
        }
      }
      else
      {
        unint64_t totalSatelliteMessageCount = 0;
      }
      self->_unint64_t totalSatelliteMessageCount = totalSatelliteMessageCount;
      objc_msgSend__updateChatItemsWithReason_block_(self, v12, @"Satellite count changed!", (uint64_t)&unk_1EF8E6428);
    }
    if (v4)
    {
      uint64_t v17 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v12, self->_pendingIncomingSatelliteMessageCount, v13, @"__kIMChatPendingIncomingSatelliteMessageCountKey");
      long long v22 = v17;
      __int16 v19 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)&v22, (uint64_t)&v21, 1);
      objc_msgSend__postNotification_userInfo_(self, v20, @"__kIMChatPendingIncomingSatelliteMessageCountChangedNotification", (uint64_t)v19);
    }
  }
}

- (void)_setIsDownloadingPendingSatelliteMessages:(BOOL)a3 postNotification:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, a3, a4);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v7, v8, v9, v10);

  if (isCarrierPigeonEnabled && self->_downloadingPendingSatelliteMessages != v5)
  {
    self->_downloadingPendingSatelliteMessages = v5;
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = @"NO";
        if (v5) {
          uint64_t v14 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        int v20 = v14;
        __int16 v21 = 2112;
        long long v22 = self;
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "_downloadingPendingSatelliteMessages changed to %@ for %@", buf, 0x16u);
      }
    }
    if (v4)
    {
      uint64_t v17 = @"__kIMChatIsDownloadingPendingSatelliteMessagesKey";
      uint64_t v18 = MEMORY[0x1E4F1CC38];
      uint64_t v15 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v12, (uint64_t)&v18, (uint64_t)&v17, 1);
      objc_msgSend__postNotification_userInfo_(self, v16, @"__kIMChatIsDownloadingPendingSatelliteMessagesChangedNotification", (uint64_t)v15);
    }
  }
}

- (void)_setJoinState:(int64_t)a3
{
}

- (int64_t)joinState
{
  return self->_joinState;
}

- (void)setPersonCentricID:(id)a3
{
}

- (void)_participants:(id)a3 statusChanged:(int)a4 postNotification:(BOOL)a5
{
  uint64_t v95 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      __int16 v90 = self;
      __int16 v91 = 2112;
      id v92 = v6;
      __int16 v93 = 1024;
      int v94 = a4;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_DEBUG, "chat: %@  handles: %@  status: %d", buf, 0x1Cu);
    }
  }
  int v8 = 0;
  uint64_t v9 = 2;
  switch(a4)
  {
    case -1:
      break;
    case 0:
      int v8 = 0;
      uint64_t v9 = 4;
      break;
    case 1:
      int v8 = 0;
      uint64_t v9 = 8;
      break;
    case 2:
      int v8 = 0;
      uint64_t v9 = 16;
      break;
    case 3:
      int v8 = 1;
      uint64_t v9 = 32;
      break;
    case 4:
      int v8 = 0;
      uint64_t v9 = 64;
      break;
    case 5:
      int v8 = 0;
      uint64_t v9 = 128;
      break;
    default:
      int v8 = 0;
      uint64_t v9 = 1;
      break;
  }
  int v74 = v8;
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = v6;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v82, (uint64_t)v88, 16);
  if (!v13)
  {

    id v14 = 0;
    v77 = 0;
    uint64_t v59 = 0;
    goto LABEL_60;
  }
  char v79 = 0;
  id v14 = 0;
  double v76 = 0;
  v77 = 0;
  uint64_t v15 = *(void *)v83;
  char v78 = 0;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v83 != v15) {
        objc_enumerationMutation(obj);
      }
      uint64_t v17 = *(void **)(*((void *)&v82 + 1) + 8 * i);
      if (objc_msgSend_stateForParticipant_(self, v11, (uint64_t)v17, v12) != v9)
      {
        if (!v14) {
          id v14 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        objc_msgSend_addObject_(v14, v18, (uint64_t)v17, v20);
        char v79 = 1;
      }
      if (a4 == 2)
      {
        participantStates = self->_participantStates;
        long long v22 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v18, v9, v20);
        uint64_t v26 = objc_msgSend_guid(v17, v23, v24, v25);
        objc_msgSend_setObject_forKey_(participantStates, v27, (uint64_t)v22, (uint64_t)v26);

        if ((objc_msgSend_canHaveMultipleParticipants(self, v28, v29, v30) & 1) != 0
          && (objc_msgSend_containsObject_(self->_participants, v11, (uint64_t)v17, v12) & 1) == 0)
        {
          id v34 = (id)objc_msgSend_mutableCopy(self->_participants, v11, v31, v12);
          if (!v34) {
            id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          objc_msgSend_addObject_(v34, v32, (uint64_t)v17, v33);
          objc_storeStrong((id *)&self->_participants, v34);
          id v37 = v77;
          if (!v77)
          {
            id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            v77 = v37;
          }
LABEL_35:
          objc_msgSend_addObject_(v37, v35, (uint64_t)v17, v36);

          char v78 = 1;
          continue;
        }
      }
      else if ((((a4 - 3) < 3) & objc_msgSend_canHaveMultipleParticipants(self, v18, v19, v20)) != 0&& objc_msgSend_containsObject_(self->_participants, v11, (uint64_t)v17, v12))
      {
        uint64_t v39 = self->_participantStates;
        v40 = objc_msgSend_guid(v17, v11, v38, v12);
        objc_msgSend_removeObjectForKey_(v39, v41, (uint64_t)v40, v42);

        id v34 = (id)objc_msgSend_mutableCopy(self->_participants, v43, v44, v45);
        if (!v34) {
          id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
        }
        objc_msgSend_removeObjectIdenticalTo_(v34, v46, (uint64_t)v17, v47);
        objc_storeStrong((id *)&self->_participants, v34);
        id v37 = v76;
        if (!v76)
        {
          id v37 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          double v76 = v37;
        }
        goto LABEL_35;
      }
    }
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v82, (uint64_t)v88, 16);
  }
  while (v13);

  if (v78)
  {
    if (IMOSLoggingEnabled())
    {
      v54 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        __int16 v90 = self;
        _os_log_impl(&dword_1A4AF7000, v54, OS_LOG_TYPE_DEBUG, "chat: %@ has participants set changed. Refresh service for sending...", buf, 0xCu);
      }
    }
    objc_msgSend_refreshServiceForSending(self, v51, v52, v53);
  }
  if (!a5) {
    goto LABEL_55;
  }
  if (v79)
  {
    __int16 v86 = @"__kIMChatValueKey";
    uint64_t v55 = objc_msgSend_copy(v14, v48, v49, v50);
    uint64_t v87 = v55;
    v57 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v56, (uint64_t)&v87, (uint64_t)&v86, 1);
    objc_msgSend__postNotification_userInfo_(self, v58, @"__kIMChatParticipantStateDidChangeNotification", (uint64_t)v57);

    if ((v78 & 1) == 0) {
      goto LABEL_56;
    }
LABEL_50:
    id v60 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (objc_msgSend_count(v77, v61, v62, v63))
    {
      v67 = objc_msgSend_copy(v77, v64, v65, v66);
      objc_msgSend_setObject_forKey_(v60, v68, (uint64_t)v67, @"__kIMChatParticipantsDidChangeAddedParticipantsKey");
    }
    if (objc_msgSend_count(v76, v64, v65, v66))
    {
      v72 = objc_msgSend_copy(v76, v69, v70, v71);
      objc_msgSend_setObject_forKey_(v60, v73, (uint64_t)v72, @"__kIMChatParticipantsDidChangeRemovedParticipantsKey");
    }
    objc_msgSend__postNotification_userInfo_(self, v69, @"__kIMChatParticipantsDidChangeNotification", (uint64_t)v60);

LABEL_55:
    if (v79)
    {
LABEL_56:
      if (v74) {
        objc_msgSend_invalidateSpamIndicatorCachedValues(self, v48, v49, v50);
      }
      else {
        objc_msgSend_invalidateSpamIndicatorCachedValuesIfNeeded(self, v48, v49, v50);
      }
    }
  }
  else if (v78)
  {
    goto LABEL_50;
  }
  uint64_t v59 = v76;
LABEL_60:
}

- (unint64_t)stateForParticipant:(id)a3
{
  id v7 = a3;
  if (self->_style == 45
    && (objc_msgSend_participants(self, v4, v5, v6),
        int v8 = objc_claimAutoreleasedReturnValue(),
        char v11 = objc_msgSend_containsObject_(v8, v9, (uint64_t)v7, v10),
        v8,
        (v11 & 1) != 0))
  {
    unint64_t v12 = 16;
  }
  else
  {
    participantStates = self->_participantStates;
    id v14 = objc_msgSend_guid(v7, v4, v5, v6);
    uint64_t v17 = objc_msgSend_objectForKey_(participantStates, v15, (uint64_t)v14, v16);
    unint64_t v12 = objc_msgSend_integerValue(v17, v18, v19, v20);
  }
  return v12;
}

- (NSString)guid
{
  return self->_guid;
}

- (NSString)chatIdentifier
{
  identifier = self->_identifier;
  if (!identifier)
  {
    int style = self->_style;
    switch(style)
    {
      case '#':
        objc_msgSend_roomName(self, a2, v2, v3);
        uint64_t v13 = (NSString *)objc_claimAutoreleasedReturnValue();
        id v14 = self->_identifier;
        self->_identifier = v13;

        break;
      case '+':
        uint64_t v15 = objc_msgSend_guid(self, a2, v2, v3);
        IMComponentsFromChatGUID();
        id v7 = 0;

        if (v7)
        {
          uint64_t v19 = (NSString *)v7;
        }
        else
        {
          objc_msgSend_roomName(self, v16, v17, v18);
          uint64_t v19 = (NSString *)objc_claimAutoreleasedReturnValue();
        }
        uint64_t v20 = self->_identifier;
        self->_identifier = v19;

        uint64_t v24 = objc_msgSend_uppercaseString(self->_identifier, v21, v22, v23);
        objc_msgSend_setGroupChatIdentifierUppercase_(self, v25, (uint64_t)v24, v26);

        goto LABEL_11;
      case '-':
        objc_msgSend_recipient(self, a2, v2, v3);
        id v7 = (id)objc_claimAutoreleasedReturnValue();
        objc_msgSend_ID(v7, v8, v9, v10);
        char v11 = (NSString *)objc_claimAutoreleasedReturnValue();
        unint64_t v12 = self->_identifier;
        self->_identifier = v11;

LABEL_11:
        break;
    }
    identifier = self->_identifier;
  }
  uint64_t v27 = identifier;

  return v27;
}

- (BOOL)canHaveMultipleParticipants
{
  return (objc_msgSend_chatStyle(self, a2, v2, v3) & 0xFFFFFFF7) == 35;
}

- (unsigned)chatStyle
{
  return self->_style;
}

- (NSString)personCentricID
{
  return self->_personCentricID;
}

- (NSString)groupID
{
  return self->_groupID;
}

- (IMAccount)account
{
  return self->_account;
}

- (BOOL)_shouldRegisterChat
{
  return 1;
}

- (void)verifyFiltering
{
  if (objc_msgSend_isFiltered(self, a2, v2, v3))
  {
    int isCategorized = objc_msgSend_isCategorized(self, v5, v6, v7);
    int v12 = objc_msgSend_supportsFilteringExtensions(self, v9, v10, v11);
    char v13 = v12;
    if ((!v12 || isCategorized)
      && ((sub_1A4B34FF8() & 1) != 0 || IMIsRunningInUnitTesting())
      && objc_msgSend_isFiltered(self, v14, v15, v16))
    {
      if (v13)
      {
        if (!objc_msgSend_isOscarChat(self, v17, v18, v19)
          || !objc_msgSend_containsMessageFromContactOrMe(self, v20, v21, v22))
        {
          if (objc_msgSend_containsMessageFromContactOrMe(self, v20, v21, v22)
            && (objc_msgSend_isFiltered(self, v23, v24, v25) > 1 ? (char v26 = 1) : (char v26 = isCategorized), (v26 & 1) == 0)
            || objc_msgSend_hasKnownParticipants(self, v23, v24, v25))
          {
            objc_msgSend_updateIsFiltered_(self, v23, 0, v25);
            objc_msgSend_clearSMSCategory(self, v28, v29, v30);
            return;
          }
          if ((objc_msgSend_isStewieChat(self, v23, v27, v25) & 1) == 0
            && !objc_msgSend_isStewieSharingChat(self, v20, v55, v22))
          {
            return;
          }
        }
        objc_msgSend_updateIsFiltered_(self, v20, 0, v22);
      }
      else
      {
        uint64_t v31 = objc_msgSend_account(self, v17, v18, v19);
        uint64_t v35 = objc_msgSend_service(v31, v32, v33, v34);
        uint64_t v39 = objc_msgSend_smsService(IMServiceImpl, v36, v37, v38);

        if (v35 != v39) {
          objc_msgSend_clearSMSCategory(self, v40, v41, v42);
        }
        if ((objc_msgSend_containsMessageFromContactOrMe(self, v40, v41, v42) & 1) != 0
          || objc_msgSend_hasKnownParticipants(self, v43, v44, v45))
        {
          objc_msgSend_updateIsFiltered_(self, v43, 0, v45);
        }
        if ((objc_msgSend_shouldBeAllowListed(self, v43, v46, v45) & 1) != 0
          || (objc_msgSend_isStewieChat(self, v47, v48, v49) & 1) != 0
          || objc_msgSend_isStewieSharingChat(self, v47, v50, v49))
        {
          objc_msgSend_updateIsFiltered_(self, v47, 0, v49);
        }
        if (objc_msgSend_hasInitializedChatFiltering(IMChatRegistry, v47, v51, v49))
        {
          MEMORY[0x1F4181798](self, sel_autoReportSpam, v53, v54);
        }
        else
        {
          objc_msgSend_markAsAutoSpamReported(self, v52, v53, v54);
        }
      }
    }
  }
}

- (id)_initWithGUID:(id)a3 account:(id)a4 style:(unsigned __int8)a5 roomName:(id)a6 displayName:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 items:(id)a10 participants:(id)a11 isFiltered:(int64_t)a12 hasHadSuccessfulQuery:(BOOL)a13 isRecovered:(BOOL)a14 isDeletingIncomingMessages:(BOOL)a15
{
  uint64_t v188 = *MEMORY[0x1E4F143B8];
  id v168 = a3;
  id v165 = a4;
  id v163 = a6;
  id v164 = a7;
  id v167 = a8;
  id v166 = a9;
  id v21 = a10;
  id obj = a11;
  v182.receiver = self;
  v182.super_class = (Class)IMChat;
  id v22 = [(IMItemsController *)&v182 _initWithItems:v21];
  uint64_t v25 = (uint64_t)v22;
  if (v22)
  {
    objc_msgSend_setIsFiltered_(v22, v23, a12, v24);
    *(unsigned char *)(v25 + 60) = 1;
    *(unsigned char *)(v25 + 59) = 0;
    *(unsigned char *)(v25 + 62) = 0;
    *(unsigned char *)(v25 + 67) = 0;
    *(unsigned char *)(v25 + 48) = a13;
    *(unsigned char *)(v25 + 46) = a14;
    *(unsigned char *)(v25 + 47) = a15;
    *(unsigned char *)(v25 + 54) = 0;
    *(unsigned char *)(v25 + 55) = 0;
    *(unsigned char *)(v25 + 40) = 1;
    if (objc_msgSend_length(v167, v26, v27, v28)) {
      objc_storeStrong((id *)(v25 + 80), a8);
    }
    if (objc_msgSend_length(v166, v29, v30, v31)) {
      objc_storeStrong((id *)(v25 + 616), a9);
    }
    *(void *)(v25 + 128) = 0;
    uint64_t v35 = objc_msgSend_chatRegistry((void *)v25, v32, v33, v34);
    objc_msgSend__noteChatInit_(v35, v36, v25, v37);

    v162 = objc_msgSend_chatItemUpdaterLogHandle(IMChat, v38, v39, v40);
    id v41 = objc_alloc(MEMORY[0x1E4F6E900]);
    uint64_t v43 = objc_msgSend_initWithLogHandle_delegate_(v41, v42, (uint64_t)v162, v25);
    uint64_t v44 = *(void **)(v25 + 552);
    *(void *)(v25 + 552) = v43;

    objc_storeStrong((id *)(v25 + 144), a7);
    objc_storeStrong((id *)(v25 + 112), a4);
    *(unsigned char *)(v25 + 41) = a5;
    uint64_t v45 = (void **)(v25 + 136);
    objc_storeStrong((id *)(v25 + 136), a6);
    id v46 = obj;
    id v47 = obj;
    if (!obj)
    {
      id v47 = objc_alloc_init(MEMORY[0x1E4F1C978]);
      id v46 = 0;
    }
    BOOL v48 = v46 == 0;
    uint64_t v49 = (void **)(v25 + 120);
    objc_storeStrong((id *)(v25 + 120), v47);
    if (v48) {

    }
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    uint64_t v51 = *(void **)(v25 + 312);
    *(void *)(v25 + 312) = Mutable;

    CFMutableDictionaryRef v52 = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    uint64_t v53 = *(void **)(v25 + 328);
    *(void *)(v25 + 328) = v52;

    CFMutableSetRef v54 = CFSetCreateMutable(0, 0, MEMORY[0x1E4F1D548]);
    uint64_t v55 = *(void **)(v25 + 96);
    *(void *)(v25 + 96) = v54;

    *(void *)(v25 + 440) = -1;
    *(unsigned char *)(v25 + 50) = 0;
    if (!*v45 && objc_msgSend_chatStyle((void *)v25, v56, v57, v58) != 45)
    {
      uint64_t v62 = objc_msgSend_chatRegistry((void *)v25, v59, v60, v61);
      uint64_t v65 = objc_msgSend_generateUnusedChatIdentifierForGroupChatWithAccount_(v62, v63, (uint64_t)v165, v64);
      uint64_t v66 = *v45;
      *uint64_t v45 = (void *)v65;
    }
    long long v180 = 0u;
    long long v181 = 0u;
    long long v178 = 0u;
    long long v179 = 0u;
    id v67 = v21;
    v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v68, (uint64_t)&v178, (uint64_t)v187, 16);
    if (v72)
    {
      uint64_t v73 = *(void *)v179;
      while (2)
      {
        for (uint64_t i = 0; i != v72; uint64_t i = (char *)i + 1)
        {
          if (*(void *)v179 != v73) {
            objc_enumerationMutation(v67);
          }
          double v75 = *(void **)(*((void *)&v178 + 1) + 8 * i);
          objc_msgSend__senderHandle(v75, v69, v70, v71);
          uint64_t v45 = (void **)objc_claimAutoreleasedReturnValue();
          if (v45 && (objc_msgSend_isFromMe(v75, v76, v77, v78) & 1) == 0)
          {
            *(unsigned char *)(v25 + 50) = objc_msgSend__isInvitation(v75, v79, v80, v81);
            if (!objc_msgSend_count(*v49, v82, v83, v84))
            {
              id v85 = objc_alloc(MEMORY[0x1E4F1C978]);
              uint64_t v88 = objc_msgSend_initWithObjects_(v85, v86, (uint64_t)v45, v87, 0);
              double v89 = *v49;
              *uint64_t v49 = (void *)v88;
            }
            goto LABEL_26;
          }
        }
        v72 = objc_msgSend_countByEnumeratingWithState_objects_count_(v67, v69, (uint64_t)&v178, (uint64_t)v187, 16);
        if (v72) {
          continue;
        }
        break;
      }
    }
LABEL_26:

    id v93 = v168;
    int v94 = v168;
    if (!v168)
    {
      objc_msgSend_chatIdentifier((void *)v25, v90, v91, v92);
      uint64_t v45 = (void **)objc_claimAutoreleasedReturnValue();
      objc_msgSend_service(v165, v95, v96, v97);
      uint64_t v49 = (void **)objc_claimAutoreleasedReturnValue();
      v72 = objc_msgSend_internalName(v49, v98, v99, v100);
      int v94 = (void *)IMCopyGUIDForChat();
      id v93 = 0;
    }
    BOOL v101 = v93 == 0;
    objc_storeStrong((id *)(v25 + 104), v94);
    if (v101)
    {
    }
    long long v176 = 0u;
    long long v177 = 0u;
    long long v174 = 0u;
    long long v175 = 0u;
    id v102 = v67;
    uint64_t v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(v102, v103, (uint64_t)&v174, (uint64_t)v186, 16);
    if (v104)
    {
      uint64_t v105 = *(void *)v175;
      do
      {
        for (uint64_t j = 0; j != v104; ++j)
        {
          if (*(void *)v175 != v105) {
            objc_enumerationMutation(v102);
          }
          v107 = *(void **)(*((void *)&v174 + 1) + 8 * j);
          objc_opt_class();
          if (objc_opt_isKindOfClass()) {
            objc_msgSend__configureLocationShareItem_((void *)v25, v108, (uint64_t)v107, v109);
          }
          objc_opt_class();
          if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_isFinished(v107, v110, v111, v112)) {
            *(unsigned char *)(v25 + 52) = 1;
          }
        }
        uint64_t v104 = objc_msgSend_countByEnumeratingWithState_objects_count_(v102, v110, (uint64_t)&v174, (uint64_t)v186, 16);
      }
      while (v104);
    }

    if (objc_msgSend_count(obj, v113, v114, v115))
    {
      if (qword_1EB3F21D0 != -1) {
        dispatch_once(&qword_1EB3F21D0, &unk_1EF8E54F8);
      }
      long long v172 = 0u;
      long long v173 = 0u;
      long long v170 = 0u;
      long long v171 = 0u;
      id v119 = obj;
      uint64_t v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v120, (uint64_t)&v170, (uint64_t)v185, 16);
      if (v124)
      {
        uint64_t v125 = *(void *)v171;
        do
        {
          for (uint64_t k = 0; k != v124; ++k)
          {
            if (*(void *)v171 != v125) {
              objc_enumerationMutation(v119);
            }
            v127 = *(void **)(v25 + 312);
            uint64_t v128 = qword_1EB3F21D8;
            v129 = objc_msgSend_guid(*(void **)(*((void *)&v170 + 1) + 8 * k), v121, v122, v123);
            objc_msgSend_setObject_forKey_(v127, v130, v128, (uint64_t)v129);
          }
          uint64_t v124 = objc_msgSend_countByEnumeratingWithState_objects_count_(v119, v121, (uint64_t)&v170, (uint64_t)v185, 16);
        }
        while (v124);
      }
    }
    if (objc_msgSend_isBusinessChat((void *)v25, v116, v117, v118)
      && objc_msgSend_count(obj, v131, v132, v133))
    {
      v134 = objc_msgSend_objectAtIndexedSubscript_(obj, v131, 0, v133);
      v138 = objc_msgSend_name(v134, v135, v136, v137);
      objc_msgSend__setDisplayName_((void *)v25, v139, (uint64_t)v138, v140);
    }
    if (objc_msgSend_isStewieEmergencyChat((void *)v25, v131, v132, v133))
    {
      if (objc_msgSend_count(obj, v141, v142, v143))
      {
        v146 = objc_msgSend_objectAtIndexedSubscript_(obj, v144, 0, v145);
        v150 = objc_msgSend_name(v146, v147, v148, v149);
        objc_msgSend__setDisplayName_((void *)v25, v151, (uint64_t)v150, v152);
      }
      else
      {
        v146 = IMLogHandleForCategory();
        if (os_log_type_enabled(v146, OS_LOG_TYPE_ERROR)) {
          sub_1A4CB8998();
        }
      }
    }
    objc_msgSend__initialize((void *)v25, v141, v142, v143);
    if (qword_1EB3F21C8 != -1) {
      dispatch_once(&qword_1EB3F21C8, &unk_1EF8E34E8);
    }
    if (byte_1E965E7A8)
    {
      v153 = objc_alloc_init(IMOrderingTools);
      objc_storeStrong((id *)(v25 + 512), v153);
      objc_msgSend_startTrackingChat_(v153, v154, v25, v155);
      if (IMOSLoggingEnabled())
      {
        v156 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v156, OS_LOG_TYPE_INFO))
        {
          v160 = objc_msgSend_orderingTools((void *)v25, v157, v158, v159);
          *(_DWORD *)buf = 138412290;
          v184 = v160;
          _os_log_impl(&dword_1A4AF7000, v156, OS_LOG_TYPE_INFO, "We are monitoring message ordering under automation {tools %@}", buf, 0xCu);
        }
      }
    }
  }

  return (id)v25;
}

- (BOOL)isBusinessChat
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_chatStyle(self, a2, v2, v3) == 45)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    int v8 = objc_msgSend_participants(self, v5, v6, v7, 0);
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v17, (uint64_t)v21, 16);
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend_isBusiness(*(void **)(*((void *)&v17 + 1) + 8 * i), v10, v11, v12))
          {
            LOBYTE(v13) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v17, (uint64_t)v21, 16);
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (void)setIsFiltered:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  int64_t isFiltered = self->_isFiltered;
  if (isFiltered != a3)
  {
    if (isFiltered == 2)
    {
      objc_msgSend_invalidateSpamIndicatorCachedValuesIfNeeded(self, a2, a3, v3);
      self->_int64_t isFiltered = a3;
    }
    else
    {
      self->_int64_t isFiltered = a3;
      if (a3) {
        return;
      }
    }
    if (IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v14 = 134218242;
        uint64_t v15 = objc_msgSend_isFiltered(self, v9, v10, v11);
        __int16 v16 = 2112;
        long long v17 = self;
        _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Updating isFiltered to %ld for chat %@", (uint8_t *)&v14, 0x16u);
      }
    }
    objc_msgSend__postNotification_userInfo_(self, v7, @"__kIMChatIsFilteredChangedNotification", 0);
    objc_msgSend__updateChatItemsWithDataDetectorResultsForReason_(self, v12, @"updateIsFiltered:NO", v13);
  }
}

- (BOOL)isStewieEmergencyChat
{
  BOOL v4 = objc_msgSend_chatIdentifier(self, a2, v2, v3);
  char v5 = IMIsStringStewieEmergency();

  return v5;
}

- (id)chatRegistry
{
  return (id)objc_msgSend_sharedRegistry(IMChatRegistry, a2, v2, v3);
}

- (id)_initWithDictionaryRepresentation:(id)a3 items:(id)a4 participantsHint:(id)a5 accountHint:(id)a6
{
  uint64_t v196 = *MEMORY[0x1E4F143B8];
  id v181 = a3;
  id v179 = a4;
  id v9 = a5;
  id v173 = a6;
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v13 = MarcoLoggingStringForMessageData();
      *(_DWORD *)buf = 138412802;
      v191 = self;
      __int16 v192 = 2112;
      v193 = v13;
      __int16 v194 = 2112;
      id v195 = v179;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_DEBUG, "chat: _initWithDictionaryRepresentation: %@  dictionary: %@  messages: %@", buf, 0x20u);
    }
  }
  long long v170 = objc_msgSend_objectForKey_(v181, v10, @"guid", v11);
  v169 = objc_msgSend_objectForKey_(v181, v14, @"roomName", v15);
  id v168 = objc_msgSend_objectForKey_(v181, v16, @"displayName", v17);
  id v165 = objc_msgSend_objectForKey_(v181, v18, @"properties", v19);
  objc_msgSend_objectForKey_(v181, v20, @"lastAddressedLocalHandle", v21);
  id v177 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v181, v22, @"lastAddressedSIMID", v23);
  id v176 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v181, v24, @"groupID", v25);
  id v178 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_objectForKey_(v181, v26, @"originalGroupID", v27);
  id v164 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v30 = objc_msgSend_objectForKey_(v181, v28, @"isFiltered", v29);
  uint64_t v33 = objc_msgSend_objectForKey_(v181, v31, @"hasHadSuccessfulQuery", v32);
  id v163 = objc_msgSend_objectForKey_(v181, v34, @"engramID", v35);
  v162 = objc_msgSend_objectForKey_(v181, v36, @"lastMessageTimeStampOnLoad", v37);
  long long v175 = objc_msgSend_objectForKey_(v181, v38, *MEMORY[0x1E4F6CDD8], v39);
  objc_msgSend_objectForKey_(v181, v40, @"replySuggestions", v41);
  id v174 = (id)objc_claimAutoreleasedReturnValue();
  long long v172 = objc_msgSend_objectForKey_(v181, v42, @"isRecovered", v43);
  long long v171 = objc_msgSend_objectForKey_(v181, v44, @"isDeletingIncomingMessages", v45);
  BOOL v48 = (void *)MEMORY[0x1E4F1CC38];
  if (v30) {
    BOOL v48 = (void *)v30;
  }
  id v167 = v48;
  uint64_t v49 = (void *)MEMORY[0x1E4F1CC28];
  if (v33) {
    uint64_t v49 = (void *)v33;
  }
  id v166 = v49;
  uint64_t v50 = objc_msgSend_objectForKey_(v181, v46, @"style", v47);
  unsigned __int8 v159 = objc_msgSend_intValue(v50, v51, v52, v53);

  uint64_t v56 = objc_msgSend_objectForKey_(v181, v54, @"state", v55);
  int v161 = objc_msgSend_intValue(v56, v57, v58, v59);

  if (v173)
  {
    id v184 = v173;
  }
  else
  {
    uint64_t v63 = objc_msgSend_sharedInstance(IMAccountController, v60, v61, v62);
    uint64_t v66 = objc_msgSend_objectForKey_(v181, v64, @"accountID", v65);
    objc_msgSend_accountForUniqueID_(v63, v67, (uint64_t)v66, v68);
    id v184 = (id)objc_claimAutoreleasedReturnValue();

    if (!v184)
    {
      v72 = objc_msgSend_sharedInstance(IMAccountController, v69, v70, v71);
      double v75 = objc_msgSend_objectForKey_(v181, v73, @"serviceName", v74);
      uint64_t v78 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v76, (uint64_t)v75, v77);
      objc_msgSend_bestAccountForService_(v72, v79, (uint64_t)v78, v80);
      id v184 = (id)objc_claimAutoreleasedReturnValue();
    }
  }
  id v180 = v9;
  id v183 = v180;
  if (!objc_msgSend_count(v180, v81, v82, v83))
  {
    id v183 = objc_alloc_init(MEMORY[0x1E4F1CA48]);

    long long v187 = 0u;
    long long v188 = 0u;
    long long v185 = 0u;
    long long v186 = 0u;
    objc_msgSend_objectForKey_(v181, v87, @"participants", v88);
    id obj = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v89, (uint64_t)&v185, (uint64_t)v189, 16);
    if (v92)
    {
      uint64_t v93 = *(void *)v186;
      uint64_t v94 = *MEMORY[0x1E4F6C5C8];
      uint64_t v95 = *MEMORY[0x1E4F6C648];
      uint64_t v96 = *MEMORY[0x1E4F6C5A0];
      do
      {
        for (uint64_t i = 0; i != v92; ++i)
        {
          if (*(void *)v186 != v93) {
            objc_enumerationMutation(obj);
          }
          v98 = *(void **)(*((void *)&v185 + 1) + 8 * i);
          uint64_t v99 = objc_msgSend_objectForKey_(v98, v90, v94, v91);
          id v102 = objc_msgSend_objectForKey_(v98, v100, v95, v101);
          uint64_t v105 = objc_msgSend_objectForKey_(v98, v103, v96, v104);
          uint64_t v109 = objc_msgSend__appearsToBePhoneNumber(v99, v106, v107, v108);
          v113 = objc_msgSend_imHandleWithID_alreadyCanonical_(v184, v110, (uint64_t)v99, v109);
          if (v113)
          {
            objc_msgSend_addObject_(v183, v111, (uint64_t)v113, v112);
            objc_msgSend__setOriginalID_countryCode_updateSiblings_(v113, v114, (uint64_t)v102, (uint64_t)v105, 1);
          }
        }
        uint64_t v92 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v90, (uint64_t)&v185, (uint64_t)v189, 16);
      }
      while (v92);
    }
  }
  uint64_t v115 = objc_msgSend_integerValue(v167, v84, v85, v86);
  char v119 = objc_msgSend_BOOLValue(v166, v116, v117, v118);
  char v123 = objc_msgSend_BOOLValue(v172, v120, v121, v122);
  BYTE2(v158) = objc_msgSend_BOOLValue(v171, v124, v125, v126);
  BYTE1(v158) = v123;
  LOBYTE(v158) = v119;
  uint64_t isDeletingIncomingMessages = objc_msgSend__initWithGUID_account_style_roomName_displayName_lastAddressedHandle_lastAddressedSIMID_items_participants_isFiltered_hasHadSuccessfulQuery_isRecovered_isDeletingIncomingMessages_(self, v127, (uint64_t)v170, (uint64_t)v184, v159, v169, v168, 0, 0, v179, v183, v115, v158);
  if (isDeletingIncomingMessages)
  {
    if (IMOSLoggingEnabled())
    {
      v130 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v130, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v191) = v161;
        _os_log_impl(&dword_1A4AF7000, v130, OS_LOG_TYPE_DEBUG, "Setting initial join state: %d", buf, 8u);
      }
    }
    objc_msgSend__setJoinState_quietly_((void *)isDeletingIncomingMessages, v129, v161, 1);
    objc_msgSend__setChatProperties_((void *)isDeletingIncomingMessages, v131, (uint64_t)v165, v132);
    if (!*(void *)(isDeletingIncomingMessages + 328))
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      v134 = *(void **)(isDeletingIncomingMessages + 328);
      *(void *)(isDeletingIncomingMessages + 328) = Mutable;
    }
    if (*(id *)(isDeletingIncomingMessages + 88) != v178) {
      objc_storeStrong((id *)(isDeletingIncomingMessages + 88), v178);
    }
    objc_storeStrong((id *)(isDeletingIncomingMessages + 632), v164);
    objc_msgSend__updateEngramID_((void *)isDeletingIncomingMessages, v135, (uint64_t)v163, v136);
    if (*(id *)(isDeletingIncomingMessages + 80) != v177) {
      objc_storeStrong((id *)(isDeletingIncomingMessages + 80), v177);
    }
    if (*(id *)(isDeletingIncomingMessages + 616) != v176) {
      objc_storeStrong((id *)(isDeletingIncomingMessages + 616), v176);
    }
    if ((v161 - 3) <= 1)
    {
      uint64_t v140 = objc_msgSend_participants((void *)isDeletingIncomingMessages, v137, v138, v139);
      objc_msgSend__setParticipantState_forHandles_postNotification_((void *)isDeletingIncomingMessages, v141, 16, (uint64_t)v140, 0);
    }
    *(void *)(isDeletingIncomingMessages + 264) = objc_msgSend_longLongValue(v162, v137, v138, v139);
    if (objc_msgSend_count(v175, v142, v143, v144))
    {
      uint64_t v148 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v145, (uint64_t)v175, v147);
      uint64_t v149 = *(void **)(isDeletingIncomingMessages + 176);
      *(void *)(isDeletingIncomingMessages + 176) = v148;
    }
    if (objc_msgSend_count(v174, v145, v146, v147)) {
      objc_storeStrong((id *)(isDeletingIncomingMessages + 184), v174);
    }
    uint64_t v152 = objc_msgSend_objectForKey_(v181, v150, *MEMORY[0x1E4F6CD50], v151);
    *(unsigned char *)(isDeletingIncomingMessages + 42) = objc_msgSend_BOOLValue(v152, v153, v154, v155);

    id v156 = (id)isDeletingIncomingMessages;
  }

  return (id)isDeletingIncomingMessages;
}

- (id)valueForChatProperty:(id)a3
{
  BOOL v4 = objc_msgSend_objectForKey_(self->_chatProperties, a2, (uint64_t)a3, v3);
  int v8 = objc_msgSend_copy(v4, v5, v6, v7);

  return v8;
}

- (NSDate)lastFinishedMessageDate
{
  char v5 = objc_msgSend__lastFinishedMessage(self, a2, v2, v3);
  id v9 = objc_msgSend_time(v5, v6, v7, v8);

  if (!v9)
  {
    uint64_t v13 = (void *)MEMORY[0x1E4F1C9C8];
    uint64_t MessageTimeStampOnLoad = objc_msgSend_lastMessageTimeStampOnLoad(self, v10, v11, v12);
    id v9 = objc_msgSend___im_dateWithNanosecondTimeIntervalSinceReferenceDate_(v13, v15, v16, v17, (double)MessageTimeStampOnLoad);
  }

  return (NSDate *)v9;
}

- (NSArray)participants
{
  return self->_participants;
}

- (unint64_t)messageCount
{
  BOOL v4 = objc_msgSend__items(self, a2, v2, v3);
  unint64_t v8 = objc_msgSend_count(v4, v5, v6, v7);

  return v8;
}

- (void)_updateEngramID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    uint64_t v11 = objc_msgSend___im_engramDataRepresentation(v4, v8, v9, v10);
    p_engramID = &self->_engramID;
    if (objc_msgSend_isEqualToData_(*p_engramID, v13, (uint64_t)v11, v14))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "EngramIDs are equal, not updating", (uint8_t *)&v17, 2u);
        }
LABEL_11:
      }
    }
    else
    {
      objc_storeStrong((id *)p_engramID, v11);
      if (IMOSLoggingEnabled())
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v17 = 138412290;
          id v18 = v4;
          _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Updating engramID string version: %@", (uint8_t *)&v17, 0xCu);
        }
        goto LABEL_11;
      }
    }

    goto LABEL_13;
  }
  engramID = self->_engramID;
  self->_engramID = 0;

LABEL_13:
}

- (void)_setParticipantState:(unint64_t)a3 forHandles:(id)a4 postNotification:(BOOL)a5
{
  if (a3 == 128) {
    int v5 = 5;
  }
  else {
    int v5 = -1;
  }
  if (a3 == 64) {
    int v6 = 4;
  }
  else {
    int v6 = v5;
  }
  if (a3 == 32) {
    unsigned int v7 = 3;
  }
  else {
    unsigned int v7 = v6;
  }
  if (a3 == 16) {
    unsigned int v8 = 2;
  }
  else {
    unsigned int v8 = -1;
  }
  if (a3 == 8) {
    unsigned int v8 = 1;
  }
  if (a3 == 4) {
    unsigned int v8 = 0;
  }
  if ((uint64_t)a3 <= 31) {
    objc_msgSend__participants_statusChanged_postNotification_(self, a2, (uint64_t)a4, v8, a5);
  }
  else {
    objc_msgSend__participants_statusChanged_postNotification_(self, a2, (uint64_t)a4, v7, a5);
  }
}

+ (BOOL)isGUIDInAttemptingListInScrutinyMode:(id)a3
{
  id v3 = a3;
  id v4 = IMGetCachedDomainValueForKey();
  unsigned int v7 = v4;
  BOOL v8 = v4 && (objc_msgSend_isEqualToString_(v4, v5, (uint64_t)v3, v6) & 1) != 0;

  return v8;
}

+ (id)chatItemUpdaterLogHandle
{
  if (qword_1E965E7B8 != -1) {
    dispatch_once(&qword_1E965E7B8, &unk_1EF8E63E8);
  }
  uint64_t v2 = (void *)qword_1E965E7C0;

  return v2;
}

- (BOOL)isStewieSharingChat
{
  cachedStewieSharingChat = self->_cachedStewieSharingChat;
  if (!cachedStewieSharingChat)
  {
    uint64_t v6 = NSNumber;
    unsigned int v7 = objc_msgSend_emergencyUserInfo(self, a2, v2, v3);
    objc_msgSend_numberWithInt_(v6, v8, v7 != 0, v9);
    uint64_t v10 = (NSNumber *)objc_claimAutoreleasedReturnValue();
    uint64_t v11 = self->_cachedStewieSharingChat;
    self->_cachedStewieSharingChat = v10;

    cachedStewieSharingChat = self->_cachedStewieSharingChat;
  }

  return objc_msgSend_BOOLValue(cachedStewieSharingChat, a2, v2, v3);
}

- (NSString)displayName
{
  return self->_displayName;
}

- (void)setGroupChatIdentifierUppercase:(id)a3
{
}

- (void)invalidateSpamIndicatorCachedValuesIfNeeded
{
  if (objc_msgSend_cachedShouldShowReportSpam(self, a2, v2, v3) == 2) {
    objc_msgSend_setCachedShouldShowReportSpam_(self, v5, 0, v7);
  }
  if (objc_msgSend_cachedShouldShowSpam(self, v5, v6, v7) == 2)
  {
    objc_msgSend_setCachedShouldShowSpam_(self, v8, 0, v9);
  }
}

- (int64_t)cachedShouldShowSpam
{
  return self->_cachedShouldShowSpam;
}

- (int64_t)cachedShouldShowReportSpam
{
  return self->_cachedShouldShowReportSpam;
}

- (id)displayNameWithDescriptor:(IMChatDisplayNameDescriptor)a3
{
  int64_t var3 = a3.var3;
  v123[1] = *MEMORY[0x1E4F143B8];
  int v97 = *(_DWORD *)&a3.var0;
  BOOL v4 = !a3.var0;
  id v5 = objc_alloc(MEMORY[0x1E4F29008]);
  uint64_t v94 = objc_msgSend_initWithKey_ascending_(v5, v6, @"isContact", 0);
  v123[0] = v94;
  uint64_t v96 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v7, (uint64_t)v123, 1);
  uint64_t v11 = objc_msgSend_participants(self, v8, v9, v10);
  uint64_t v95 = objc_msgSend_sortedArrayUsingDescriptors_(v11, v12, (uint64_t)v96, v13);

  if (v4)
  {
    v107[0] = MEMORY[0x1E4F143A8];
    v107[1] = 3221225472;
    v107[2] = sub_1A4B33BA8;
    v107[3] = &unk_1E5B7D5F0;
    v107[4] = self;
    v98 = objc_msgSend___imArrayByApplyingBlock_(v95, v14, (uint64_t)v107, v15);
  }
  else
  {
    v98 = objc_msgSend___imArrayByApplyingBlock_(v95, v14, (uint64_t)&unk_1EF8E4090, v15);
  }
  if ((v97 & 0x10000) != 0)
  {
    uint64_t v27 = objc_msgSend__participantListStringForNames_visibleNameCount_(self, v16, (uint64_t)v98, var3);
  }
  else
  {
    uint64_t v19 = objc_msgSend_count(v98, v16, v17, v18);
    if (v19)
    {
      uint64_t v99 = v19 - 1;
      if (v19 == 1)
      {
        uint64_t v23 = objc_msgSend_firstObject(v98, v20, v21, v22);
        uint64_t v27 = objc_msgSend_copy(v23, v24, v25, v26);
      }
      else
      {
        long long v105 = 0u;
        long long v106 = 0u;
        long long v103 = 0u;
        long long v104 = 0u;
        id obj = v98;
        uint64_t v27 = 0;
        uint64_t v29 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v28, (uint64_t)&v103, (uint64_t)v122, 16);
        if (v29)
        {
          uint64_t v30 = 0;
          uint64_t v31 = *(void *)v104;
          do
          {
            uint64_t v32 = 0;
            uint64_t v33 = v99 - v30;
            uint64_t v100 = v30;
            uint64_t v34 = -v30;
            do
            {
              if (*(void *)v104 != v31) {
                objc_enumerationMutation(obj);
              }
              uint64_t v35 = *(void *)(*((void *)&v103 + 1) + 8 * v32);
              if (v34 == v32)
              {
                uint64_t v36 = NSString;
                uint64_t v37 = IMSharedUtilitiesFrameworkBundle();
                uint64_t v39 = objc_msgSend_localizedStringForKey_value_table_(v37, v38, @"PARTICIPANT_ADDRESS_FIRST_ITEM", (uint64_t)&stru_1EF8E78C8, @"IMSharedUtilities");
                objc_msgSend_localizedStringWithFormat_(v36, v40, (uint64_t)v39, v41, v35);
                uint64_t v27 = v42 = v27;
              }
              else
              {
                uint64_t v43 = NSString;
                uint64_t v44 = IMSharedUtilitiesFrameworkBundle();
                uint64_t v37 = v44;
                if (v33 == v32) {
                  objc_msgSend_localizedStringForKey_value_table_(v44, v45, @"PARTICIPANT_ADDRESS_FINAL_ITEM", (uint64_t)&stru_1EF8E78C8, @"IMSharedUtilities");
                }
                else {
                uint64_t v39 = objc_msgSend_localizedStringForKey_value_table_(v44, v45, @"PARTICIPANT_ADDRESS_NON_FINAL_ITEM", (uint64_t)&stru_1EF8E78C8, @"IMSharedUtilities");
                }
                uint64_t v42 = objc_msgSend_localizedStringWithFormat_(v43, v46, (uint64_t)v39, v47, v35);
                uint64_t v50 = objc_msgSend_stringByAppendingString_(v27, v48, (uint64_t)v42, v49);

                uint64_t v27 = (void *)v50;
              }

              ++v32;
            }
            while (v29 != v32);
            uint64_t v52 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v103, (uint64_t)v122, 16);
            uint64_t v30 = v100 + v29;
            uint64_t v29 = v52;
          }
          while (v52);
        }
      }
    }
    else
    {
      uint64_t v27 = 0;
    }
  }
  uint64_t v53 = objc_msgSend_valueForChatProperty_(self, v20, @"wasAutoDetectedForSpam", v22);
  int v57 = objc_msgSend_BOOLValue(v53, v54, v55, v56);

  uint64_t v60 = objc_msgSend_valueForChatProperty_(self, v58, @"wasDetectedAsSMSSpam", v59);
  if (objc_msgSend_intValue(v60, v61, v62, v63))
  {
    BOOL v66 = 1;
  }
  else
  {
    id v67 = objc_msgSend_valueForChatProperty_(self, v64, @"SMSCategory", v65);
    BOOL v66 = objc_msgSend_intValue(v67, v68, v69, v70) == 1;
  }
  uint64_t isFiltered = objc_msgSend_isFiltered(self, v71, v72, v73);
  if (isFiltered) {
    char v75 = v57;
  }
  else {
    char v75 = 0;
  }
  if ((v75 & 1) != 0 || v66 && (v97 & 0x100) == 0)
  {
    double v76 = NSString;
    uint64_t v77 = IMSharedUtilitiesFrameworkBundle();
    char v79 = objc_msgSend_localizedStringForKey_value_table_(v77, v78, @"MAYBE_JUNK", (uint64_t)&stru_1EF8E78C8, @"IMSharedUtilities");
    uint64_t v82 = objc_msgSend_localizedStringWithFormat_(v76, v80, (uint64_t)v79, v81, v27);

    uint64_t v27 = (void *)v82;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v83 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
    {
      uint64_t v87 = objc_msgSend_guid(self, v84, v85, v86);
      uint64_t v88 = @"YES";
      *(_DWORD *)buf = 138413826;
      uint64_t v109 = v87;
      if (v97) {
        double v89 = @"YES";
      }
      else {
        double v89 = @"NO";
      }
      v113 = v89;
      __int16 v110 = 2112;
      if (isFiltered) {
        __int16 v90 = @"YES";
      }
      else {
        __int16 v90 = @"NO";
      }
      uint64_t v111 = v27;
      if (v57) {
        uint64_t v91 = @"YES";
      }
      else {
        uint64_t v91 = @"NO";
      }
      __int16 v112 = 2112;
      if ((v97 & 0x100) != 0) {
        uint64_t v92 = @"YES";
      }
      else {
        uint64_t v92 = @"NO";
      }
      __int16 v114 = 2112;
      if (!v66) {
        uint64_t v88 = @"NO";
      }
      uint64_t v115 = v90;
      __int16 v116 = 2112;
      uint64_t v117 = v91;
      __int16 v118 = 2112;
      char v119 = v92;
      __int16 v120 = 2112;
      uint64_t v121 = v88;
      _os_log_impl(&dword_1A4AF7000, v83, OS_LOG_TYPE_INFO, "Determining conversation name for chat guid: %@ name: %@ wantsRawAddress: %@ isFiltered %@ wasAutoDetectedAsSMSSpam %@ isSpamFilteringEnabled: %@ wasDetectedAsSMSSpam %@", buf, 0x48u);
    }
  }

  return v27;
}

- (BOOL)wasDetectedAsSMSSpam
{
  if (objc_msgSend_wasDetectedAsSMSSpamCacheStatus(self, a2, v2, v3)) {
    return objc_msgSend_wasDetectedAsSMSSpamCacheStatus(self, v5, v6, v7) == 2;
  }
  uint64_t v9 = objc_msgSend_valueForChatProperty_(self, v5, @"wasDetectedAsSMSSpam", v7);
  if (objc_msgSend_intValue(v9, v10, v11, v12))
  {

LABEL_6:
    objc_msgSend_setWasDetectedAsSMSSpamCacheStatus_(self, v15, 2, v16);
    return 1;
  }
  uint64_t v17 = objc_msgSend_valueForChatProperty_(self, v13, @"SMSCategory", v14);
  int v21 = objc_msgSend_intValue(v17, v18, v19, v20);

  if (v21 == 1) {
    goto LABEL_6;
  }
  objc_msgSend_setWasDetectedAsSMSSpamCacheStatus_(self, v15, 1, v16);
  return 0;
}

- (int64_t)wasDetectedAsSMSSpamCacheStatus
{
  return self->_wasDetectedAsSMSSpamCacheStatus;
}

- (void)_setChatProperties:(id)a3
{
  id v5 = (char *)a3;
  p_chatProperties = (void **)&self->_chatProperties;
  chatProperties = self->_chatProperties;
  if (chatProperties == (NSMutableDictionary *)v5) {
    goto LABEL_18;
  }
  char isEqualToDictionary = 0;
  uint64_t v53 = v5;
  if (!v5 || !chatProperties) {
    goto LABEL_7;
  }
  uint64_t v11 = objc_msgSend_count(chatProperties, v5, v6, v7);
  uint64_t v15 = objc_msgSend_count(v53, v12, v13, v14);
  id v5 = v53;
  if (v11 != v15)
  {
    char isEqualToDictionary = 0;
LABEL_7:
    objc_msgSend_valueForKey_(v5, v5, @"wasAutoDetectedForSpam", v7);
    goto LABEL_8;
  }
  char isEqualToDictionary = objc_msgSend_isEqualToDictionary_(*p_chatProperties, v53, (uint64_t)v53, v7);
  objc_msgSend_valueForKey_(v53, v53, @"wasAutoDetectedForSpam", v16);
  uint64_t v17 = LABEL_8:;
  int v21 = objc_msgSend_BOOLValue(v17, v18, v19, v20);
  uint64_t v24 = objc_msgSend_valueForKey_(*p_chatProperties, v22, @"wasAutoDetectedForSpam", v23);
  int v28 = objc_msgSend_BOOLValue(v24, v25, v26, v27);

  if (isEqualToDictionary)
  {
    int v31 = 0;
  }
  else
  {
    uint64_t v32 = objc_msgSend_valueForKey_(v53, v29, *MEMORY[0x1E4F6CCE0], v30);
    uint64_t v36 = objc_msgSend_associatedBusinessID(self, v33, v34, v35);
    int v31 = objc_msgSend_isEqualToString_(v32, v37, (uint64_t)v36, v38) ^ 1;
  }
  objc_storeStrong((id *)&self->_chatProperties, a3);
  if (!*p_chatProperties)
  {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    uint64_t v41 = *p_chatProperties;
    *p_chatProperties = Mutable;
  }
  if ((isEqualToDictionary & 1) == 0)
  {
    objc_msgSend_setWasDetectedAsSMSSpamCacheStatus_(self, v53, 0, v39);
    objc_msgSend__postNotification_userInfo_(self, v42, @"__kIMChatPropertiesChangedNotification", 0);
    objc_msgSend__delayedInvalidateDowngradeState(self, v43, v44, v45);
    if (v21 != v28) {
      objc_msgSend__updateChatItemsWithReason_block_(self, v46, @"(IMChat) Report spam", (uint64_t)&unk_1EF8E41F0);
    }
    if (v31)
    {
      uint64_t v49 = objc_msgSend_recipient(self, v53, v47, v48);
      objc_msgSend_associatedBusinessIDChanged(v49, v50, v51, v52);
    }
  }
LABEL_18:

  MEMORY[0x1F41817F8]();
}

- (void)setWasDetectedAsSMSSpamCacheStatus:(int64_t)a3
{
  self->_wasDetectedAsSMSSpamCacheStatus = a3;
}

- (IMHandle)recipient
{
  return (IMHandle *)objc_msgSend_lastObject(self->_participants, a2, v2, v3);
}

- (void)_delayedInvalidateDowngradeState
{
  id v5 = objc_msgSend_downgradeStateUpdater(self, a2, v2, v3);

  if (!v5)
  {
    id v9 = objc_alloc(MEMORY[0x1E4F6C3D8]);
    uint64_t v11 = objc_msgSend_initWithTarget_action_(v9, v10, (uint64_t)self, (uint64_t)sel__invalidateDowngradeState);
    objc_msgSend_setDowngradeStateUpdater_(self, v12, (uint64_t)v11, v13);
  }
  objc_msgSend_downgradeStateUpdater(self, v6, v7, v8);
  id v17 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setNeedsUpdate(v17, v14, v15, v16);
}

- (IMScheduledUpdater)downgradeStateUpdater
{
  return self->_downgradeStateUpdater;
}

- (void)setDowngradeStateUpdater:(id)a3
{
}

- (id)associatedBusinessID
{
  if (objc_msgSend_isStewieRoadsideChat(self, a2, v2, v3))
  {
    uint64_t v7 = objc_msgSend_valueForChatProperty_(self, v5, *MEMORY[0x1E4F6CCE0], v6);
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (BOOL)isStewieRoadsideChat
{
  BOOL v4 = objc_msgSend_chatIdentifier(self, a2, v2, v3);
  char v5 = IMIsStringStewieRoadside();

  return v5;
}

- (void)_postNotification:(id)a3 userInfo:(id)a4
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_sharedRegistry(IMChatRegistry, v8, v9, v10);
  char isFirstLoad = objc_msgSend_isFirstLoad(v11, v12, v13, v14);

  if ((isFirstLoad & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412290;
        id v23 = v6;
        _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Notification posted: %@", (uint8_t *)&v22, 0xCu);
      }
    }
    uint64_t v20 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v16, v17, v18);
    objc_msgSend___mainThreadPostNotificationName_object_userInfo_(v20, v21, (uint64_t)v6, (uint64_t)self, v7);
  }
}

- (IMSharedEmergencyInfo)emergencyUserInfo
{
  uint64_t v3 = (void *)MEMORY[0x1E4F6E9A0];
  BOOL v4 = objc_msgSend_valueForChatProperty_(self, a2, *MEMORY[0x1E4F6CD28], v2);
  id v6 = objc_msgSend_infoFromDictionary_isStewieTranscriptSharingMessage_(v3, v5, (uint64_t)v4, 0);

  return (IMSharedEmergencyInfo *)v6;
}

- (int64_t)lastMessageTimeStampOnLoad
{
  return self->_lastMessageTimeStampOnLoad;
}

- (IMMessage)lastFinishedMessage
{
  BOOL v4 = objc_msgSend__lastFinishedMessage(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_message(v4, v5, v6, v7);

  return (IMMessage *)v8;
}

- (IMMessage)lastIncomingFinishedMessage
{
  BOOL v4 = objc_msgSend_lastIncomingFinishedMessageItem(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_message(v4, v5, v6, v7);

  return (IMMessage *)v8;
}

- (IMMessage)lastMessage
{
  BOOL v4 = objc_msgSend__lastMessage(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_message(v4, v5, v6, v7);

  return (IMMessage *)v8;
}

- (void)setOriginalGroupID:(id)a3
{
}

- (void)setGroupID:(id)a3
{
}

- (void)contextInfo
{
  return self->_context;
}

- (void)setContextInfo:(void *)a3
{
  self->_context = a3;
}

- (unint64_t)pendingIncomingSatelliteMessageCount
{
  return self->_pendingIncomingSatelliteMessageCount;
}

- (id)displayNameWithRawAddress:(BOOL)a3 isSpamFilteringEnabled:(BOOL)a4
{
  uint64_t v4 = 256;
  if (!a4) {
    uint64_t v4 = 0;
  }
  return (id)MEMORY[0x1F4181798](self, sel_displayNameWithDescriptor_, v4 | a3, 0);
}

- (unint64_t)unreadMessageCount
{
  int64_t dbUnreadCount = self->_dbUnreadCount;
  if ((dbUnreadCount | 0x8000000000000000) == 0xFFFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return dbUnreadCount & ~(dbUnreadCount >> 63);
  }
}

- (BOOL)isDownloadingPendingSatelliteMessages
{
  return self->_downloadingPendingSatelliteMessages;
}

- (BOOL)hasCancellableScheduledMessage
{
  return self->_hasCancellableScheduledMessage;
}

- (id)allChatProperties
{
  return self->_chatProperties;
}

- (void)setMergedPinningIdentifiers:(id)a3
{
}

- (void)setHasHadSuccessfulQuery:(BOOL)a3
{
  if (a3 && !self->_hasHadSuccessfulQuery)
  {
    self->_hasHadSuccessfulQuery = a3;
    objc_msgSend_chatRegistry(self, a2, a3, v3);
    id v7 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__markHasHadSuccessfulQueryForChat_(v7, v5, (uint64_t)self, v6);
  }
}

+ (void)setChatItemRulesClass:(Class)a3
{
  qword_1E965E760 = (uint64_t)a3;
}

- (void)refreshServiceForSending
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  if (qword_1E965E7A0 != -1) {
    dispatch_once(&qword_1E965E7A0, &unk_1EF8E34A8);
  }
  if (byte_1E965E7B0)
  {
    char v5 = IMGetCachedDomainValueForKey();
    uint64_t v8 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v6, (uint64_t)v5, v7);
    if (v8)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v26 = 138412290;
          uint64_t v27 = v5;
          _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Overriding service for sending to %@ per user-default", (uint8_t *)&v26, 0xCu);
        }
      }
      objc_msgSend__targetToService_newComposition_(self, v10, (uint64_t)v8, 0);

      return;
    }
    if (v5 && IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v26 = 138412290;
        uint64_t v27 = v5;
        _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Ignoring service for sending override to %@ because service does not exist", (uint8_t *)&v26, 0xCu);
      }
    }
  }
  uint64_t v12 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isServiceForSendingRefactorEnabled = objc_msgSend_isServiceForSendingRefactorEnabled(v12, v13, v14, v15);

  if (isServiceForSendingRefactorEnabled)
  {
    if (objc_msgSend_ignoreDowngradeStatusUpdates(self, v17, v18, v19))
    {
      objc_msgSend_setIgnoreDowngradeStatusUpdates_(self, v20, 0, v22);
      if (!objc_msgSend_downgradeState(self, v23, v24, v25)) {
        objc_msgSend__invalidateDowngradeState(self, v20, v21, v22);
      }
    }
    objc_msgSend__refreshServiceForSendingWithDaemon(self, v20, v21, v22);
  }
  else
  {
    objc_msgSend__refreshServiceForSendingWithLegacyPath(self, v17, v18, v19);
  }
}

- (void)_refreshServiceForSendingWithLegacyPath
{
  uint64_t v83 = *MEMORY[0x1E4F143B8];
  char v5 = objc_msgSend_account(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_service(v5, v6, v7, v8);

  uint64_t v16 = objc_msgSend_iMessageService(IMServiceImpl, v10, v11, v12);
  if (v9 == v16)
  {
  }
  else
  {
    uint64_t v17 = objc_msgSend_smsService(IMServiceImpl, v13, v14, v15);

    if (v9 != v17)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v80 = v9;
          __int16 v81 = 2112;
          uint64_t v82 = self;
          _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "(-refreshServiceForSending) bailing, current service isn't useful: %@, chat %@", buf, 0x16u);
        }
      }
      goto LABEL_18;
    }
  }
  if (objc_msgSend_ignoreDowngradeStatusUpdates(self, v18, v19, v20))
  {
    objc_msgSend_setIgnoreDowngradeStatusUpdates_(self, v22, 0, v24);
    if (!objc_msgSend_downgradeState(self, v25, v26, v27)) {
      objc_msgSend__invalidateDowngradeState(self, v22, v23, v24);
    }
  }
  uint64_t v28 = objc_msgSend_participants(self, v22, v23, v24);
  uint64_t v77 = objc_msgSend___imArrayByApplyingBlock_(v28, v29, (uint64_t)&unk_1EF8E5038, v30);

  if (IMOSLoggingEnabled())
  {
    uint64_t v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v80 = v77;
      __int16 v81 = 2112;
      uint64_t v82 = self;
      _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "(-refreshServiceForSending) addresses: %@, chat: %@", buf, 0x16u);
    }
  }
  int shouldForceServerStatusRefresh = objc_msgSend_shouldForceServerStatusRefresh(self, v31, v32, v33);
  unsigned __int8 v76 = objc_msgSend_receivedResponseForChat(self, v36, v37, v38);
  uint64_t v42 = objc_msgSend_account(self, v39, v40, v41);
  id v46 = objc_msgSend_loginIMHandle(v42, v43, v44, v45);

  uint64_t v50 = objc_msgSend_ID(v46, v47, v48, v49);
  CFMutableSetRef v54 = objc_msgSend__stripFZIDPrefix(v50, v51, v52, v53);

  uint64_t v58 = IMChatCanonicalIDSIDsForAddress();
  if (shouldForceServerStatusRefresh) {
    objc_msgSend__resetForceServerStatusRefresh(self, v55, v56, v57);
  }
  uint64_t v59 = objc_msgSend_lastAddressedHandleID(self, v55, v56, v57);
  uint64_t v63 = objc_msgSend_lastAddressedSIMID(self, v60, v61, v62);
  unsigned __int8 isDowngraded = objc_msgSend_isDowngraded(self, v64, v65, v66);
  uint64_t v71 = objc_msgSend_account(self, v68, v69, v70);
  char v75 = objc_msgSend_service(v71, v72, v73, v74);
  v78[0] = MEMORY[0x1E4F143A8];
  v78[1] = 3221225472;
  v78[2] = sub_1A4B364A0;
  v78[3] = &unk_1E5B7AB48;
  v78[4] = self;
  IMChatCalculateServiceForSendingNewComposeMaybeForceWithKTData(v77, self, v58, v59, v63, 0, 0, 0, isDowngraded, v76, v75, v78);

LABEL_18:
}

- (void)downgradeMessage:(id)a3 manualDowngrade:(BOOL)a4
{
}

- (void)downgradeMessage:(id)a3 manualDowngrade:(BOOL)a4 downgradeChat:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  objc_msgSend_participants(self, a2, (uint64_t)a3, a4);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  if (objc_msgSend_count(v16, v8, v9, v10) == 1)
  {
    if (v5) {
      objc_msgSend__updateDowngradeState_checkAgainInterval_(self, v11, 1, v13, 0.0);
    }
    else {
      objc_msgSend__setAndIncrementDowngradeMarkersForManual_(self, v11, v6, v13);
    }
  }
  uint64_t v14 = objc_msgSend_smsService(IMService, v11, v12, v13);
  objc_msgSend__targetToService_newComposition_(self, v15, (uint64_t)v14, 0);
}

- (BOOL)_accountIsOperational:(id)a3 forService:(id)a4
{
  id v5 = a3;
  char isUsableForSending = 0;
  if (v5 && a4)
  {
    id v7 = a4;
    objc_msgSend_service(v5, v8, v9, v10);
    id v11 = (id)objc_claimAutoreleasedReturnValue();

    if (v11 == v7) {
      char isUsableForSending = objc_msgSend__isUsableForSending(v5, v12, v13, v14);
    }
    else {
      char isUsableForSending = 0;
    }
  }

  return isUsableForSending;
}

- (id)_previousAccountForService:(id)a3
{
  if (a3)
  {
    id v4 = a3;
    id v7 = objc_msgSend_valueForChatProperty_(self, v5, @"CKChatPreviousAccountsDictionaryKey", v6);
    id v11 = objc_msgSend_name(v4, v8, v9, v10);

    uint64_t v14 = objc_msgSend_objectForKey_(v7, v12, (uint64_t)v11, v13);

    if (v14)
    {
      uint64_t v18 = objc_msgSend_sharedInstance(IMAccountController, v15, v16, v17);
      uint64_t v21 = objc_msgSend_accountForUniqueID_(v18, v19, (uint64_t)v14, v20);
    }
    else
    {
      uint64_t v21 = 0;
    }
  }
  else
  {
    uint64_t v21 = 0;
  }

  return v21;
}

- (void)_setPreviousAccount:(id)a3 forService:(id)a4
{
  id v31 = a3;
  id v8 = a4;
  if (v8)
  {
    uint64_t v9 = objc_msgSend_valueForChatProperty_(self, v6, @"CKChatPreviousAccountsDictionaryKey", v7);
    uint64_t v13 = v9;
    if (v9) {
      id v14 = (id)objc_msgSend_mutableCopy(v9, v10, v11, v12);
    }
    else {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    }
    uint64_t v18 = v14;
    if (v31)
    {
      uint64_t v19 = objc_msgSend_uniqueID(v31, v15, v16, v17);

      if (!v19)
      {
LABEL_10:
        objc_msgSend_setValue_forChatProperty_(self, v20, (uint64_t)v18, @"CKChatPreviousAccountsDictionaryKey");

        goto LABEL_11;
      }
      uint64_t v23 = objc_msgSend_uniqueID(v31, v20, v21, v22);
      uint64_t v27 = objc_msgSend_name(v8, v24, v25, v26);
      objc_msgSend_setObject_forKey_(v18, v28, (uint64_t)v23, (uint64_t)v27);
    }
    else
    {
      uint64_t v23 = objc_msgSend_name(v8, v15, v16, v17);
      objc_msgSend_removeObjectForKey_(v18, v29, (uint64_t)v23, v30);
    }

    goto LABEL_10;
  }
LABEL_11:
}

- (void)_targetToService:(id)a3 newComposition:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v10 = objc_msgSend_account(self, v7, v8, v9);
  int IsOperational_forService = objc_msgSend__accountIsOperational_forService_(self, v11, (uint64_t)v10, (uint64_t)v6);

  if (!IsOperational_forService || v4)
  {
    uint64_t v16 = objc_msgSend_account(self, v13, v14, v15);
    uint64_t v20 = objc_msgSend_service(v16, v17, v18, v19);
    uint64_t v26 = objc_msgSend__previousAccountForService_(self, v21, (uint64_t)v6, v22);
    if (v26)
    {
      if (objc_msgSend__accountIsOperational_forService_(self, v23, (uint64_t)v26, (uint64_t)v6))
      {
        id v28 = v26;
        objc_msgSend__setPreviousAccount_forService_(self, v29, 0, (uint64_t)v6);
        if (IMOSLoggingEnabled())
        {
          uint64_t v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            objc_msgSend_name(v20, v31, v32, v33);
            uint64_t v34 = (char *)(id)objc_claimAutoreleasedReturnValue();
            uint64_t v38 = objc_msgSend_name(v6, v35, v36, v37);
            int v82 = 138412802;
            uint64_t v83 = v34;
            __int16 v84 = 2112;
            id v85 = v38;
            __int16 v86 = 2112;
            id v87 = v28;
            _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "Targeting chat from [%@] to [%@] with preference to previous account: %@", (uint8_t *)&v82, 0x20u);
          }
        }
        if (!v4) {
          goto LABEL_33;
        }
LABEL_13:
        objc_msgSend_smsService(IMServiceImpl, v23, v24, v25);
        id v39 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v40 = v39 == v6;

        if (v40)
        {
          CFMutableSetRef v54 = v28;
        }
        else
        {
          uint64_t v44 = objc_msgSend_sharedInstance(IMAccountController, v41, v42, v43);
          uint64_t v48 = objc_msgSend_participants(self, v45, v46, v47);
          uint64_t v51 = objc_msgSend_arrayByApplyingSelector_(v48, v49, (uint64_t)"ID", v50);
          CFMutableSetRef v54 = objc_msgSend__bestAccountForAddresses_(v44, v52, (uint64_t)v51, v53);

          objc_msgSend_service(v54, v55, v56, v57);
          id v58 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v59 = v58 == v6;

          if (!v59)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v63 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
              {
                int v82 = 138412546;
                uint64_t v83 = (const char *)v54;
                __int16 v84 = 2112;
                id v85 = v6;
                _os_log_impl(&dword_1A4AF7000, v63, OS_LOG_TYPE_INFO, "Account returned [%@] did not match the service we wanted [%@], moving to the default account", (uint8_t *)&v82, 0x16u);
              }
            }
            uint64_t v64 = IMPreferredAccountForService(v6);

            CFMutableSetRef v54 = (void *)v64;
          }
          if (objc_msgSend__isUsableForSending(v54, v60, v61, v62))
          {
            id v28 = v54;
LABEL_28:
            int v66 = IMOSLoggingEnabled();
            if (!v28)
            {
              if (v66)
              {
                __int16 v81 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
                {
                  int v82 = 136315138;
                  uint64_t v83 = "-[IMChat(IMChat_ServiceForSending) _targetToService:newComposition:]";
                  _os_log_impl(&dword_1A4AF7000, v81, OS_LOG_TYPE_INFO, "In (%s), expected to target to a useable account, but didn't have one", (uint8_t *)&v82, 0xCu);
                }
              }
              id v28 = 0;
              goto LABEL_39;
            }
            if (v66)
            {
              id v67 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
              {
                objc_msgSend_name(v20, v68, v69, v70);
                uint64_t v71 = (char *)(id)objc_claimAutoreleasedReturnValue();
                char v75 = objc_msgSend_name(v6, v72, v73, v74);
                int v82 = 138412802;
                uint64_t v83 = v71;
                __int16 v84 = 2112;
                id v85 = v75;
                __int16 v86 = 2112;
                id v87 = v28;
                _os_log_impl(&dword_1A4AF7000, v67, OS_LOG_TYPE_INFO, "Targeting chat from [%@] to [%@] with using the default account: %@", (uint8_t *)&v82, 0x20u);
              }
            }
LABEL_33:
            objc_msgSend__setAccount_(self, v23, (uint64_t)v28, v25);
            char v79 = objc_msgSend_service(v16, v76, v77, v78);
            objc_msgSend__setPreviousAccount_forService_(self, v80, (uint64_t)v16, (uint64_t)v79);

LABEL_39:
            goto LABEL_40;
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v65 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
            {
              int v82 = 138412546;
              uint64_t v83 = (const char *)v54;
              __int16 v84 = 2112;
              id v85 = v6;
              _os_log_impl(&dword_1A4AF7000, v65, OS_LOG_TYPE_INFO, "Account returned [%@] is not operational [%@], moving to the default account", (uint8_t *)&v82, 0x16u);
            }
          }
        }
        IMPreferredAccountForService(v6);
        id v28 = (id)objc_claimAutoreleasedReturnValue();

        goto LABEL_28;
      }
      objc_msgSend__setPreviousAccount_forService_(self, v27, 0, (uint64_t)v6);
    }
    id v28 = 0;
    goto LABEL_13;
  }
LABEL_40:
}

- (BOOL)isDowngraded
{
  return objc_msgSend_downgradeState(self, a2, v2, v3) == 1;
}

- (void)_updateDowngradeState:(char)a3 checkAgainInterval:(double)a4
{
  uint64_t v6 = a3;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  int v8 = objc_msgSend_downgradeState(self, a2, a3, v4);
  if (objc_msgSend_downgradeState(self, v9, v10, v11) != v6)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v18 = objc_msgSend_downgradeState(self, v15, v16, v17);
        if (v18 == 1) {
          uint64_t v19 = @"Downgraded";
        }
        else {
          uint64_t v19 = @"Unknown";
        }
        if (v18 == 2) {
          uint64_t v19 = @"Upgraded";
        }
        uint64_t v20 = v19;
        if (v6 == 1) {
          uint64_t v21 = @"Downgraded";
        }
        else {
          uint64_t v21 = @"Unknown";
        }
        if (v6 == 2) {
          uint64_t v21 = @"Upgraded";
        }
        uint64_t v22 = v21;
        uint64_t v23 = v22;
        *(_DWORD *)uint64_t v38 = 138413314;
        uint64_t v24 = @"NO";
        *(void *)&v38[4] = self;
        if (!v8) {
          uint64_t v24 = @"YES";
        }
        *(_WORD *)&v38[12] = 2112;
        *(void *)&v38[14] = v20;
        __int16 v39 = 2112;
        BOOL v40 = v22;
        __int16 v41 = 2112;
        uint64_t v42 = v24;
        __int16 v43 = 2048;
        double v44 = a4;
      }
    }
    objc_msgSend_setDowngradeState_(self, v12, v6, v13, *(_OWORD *)v38);
    if (v8)
    {
      if (IMOSLoggingEnabled())
      {
        id v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v38 = 0;
          _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Posting downgrade state changed notification", v38, 2u);
        }
      }
      uint64_t v29 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v25, v26, v27);
      objc_msgSend_postNotificationName_object_userInfo_(v29, v30, @"__kIMChatDowngradeStatusChanged", (uint64_t)self, 0);

      objc_msgSend_setLocalUserIsTyping_(self, v31, 0, v32);
    }
  }
  if (a4 > 0.0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)uint64_t v38 = 67109120;
        *(_DWORD *)&v38[4] = (int)a4;
        _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "Scheduling timer to recalculate downgrade time in %d seconds", v38, 8u);
      }
    }
    uint64_t v34 = (void *)MEMORY[0x1E4FBA8A8];
    uint64_t v35 = self;
    objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(v34, v36, (uint64_t)v35, (uint64_t)sel__calculateDowngradeStateTimerFired, 0);
    objc_msgSend_performSelector_withObject_afterDelay_(v35, v37, (uint64_t)sel__calculateDowngradeStateTimerFired, 0, a4);
  }
}

- (void)_calculateDowngradeStateTimerFired
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v7 = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Downgrade state recalculate timer fired", v7, 2u);
    }
  }
  objc_msgSend__calculateDowngradeState(self, v3, v4, v5);
}

- (id)_consecutiveDowngradeAttemptsViaManualDowngrades:(BOOL)a3
{
  uint64_t v4 = (uint64_t *)MEMORY[0x1E4F6C470];
  if (!a3) {
    uint64_t v4 = (uint64_t *)MEMORY[0x1E4F6C460];
  }
  return (id)objc_msgSend_valueForChatProperty_(self, a2, *v4, v3);
}

- (void)_clearDowngradeMarkers
{
  objc_msgSend_setValue_forChatProperty_(self, a2, 0, *MEMORY[0x1E4F6C470]);
  objc_msgSend_setValue_forChatProperty_(self, v3, 0, *MEMORY[0x1E4F6C460]);
  uint64_t v5 = *MEMORY[0x1E4F6C468];

  objc_msgSend_setValue_forChatProperty_(self, v4, 0, v5);
}

- (void)_setAndIncrementDowngradeMarkersForManual:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v6 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], a2, a3, v3);
  objc_msgSend_timeIntervalSince1970(v6, v7, v8, v9);
  double v11 = v10;

  objc_msgSend_numberWithDouble_(NSNumber, v12, v13, v14, v11);
  id v31 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forChatProperty_(self, v15, (uint64_t)v31, *MEMORY[0x1E4F6C468]);
  uint64_t v16 = (id *)MEMORY[0x1E4F6C470];
  if (!v4) {
    uint64_t v16 = (id *)MEMORY[0x1E4F6C460];
  }
  id v17 = *v16;
  uint64_t v20 = objc_msgSend_valueForChatProperty_(self, v18, (uint64_t)v17, v19);
  uint64_t v24 = v20;
  if (v20) {
    uint64_t v25 = objc_msgSend_unsignedIntegerValue(v20, v21, v22, v23) + 1;
  }
  else {
    uint64_t v25 = 1;
  }
  id v26 = objc_alloc(NSNumber);
  uint64_t v29 = objc_msgSend_initWithUnsignedInteger_(v26, v27, v25, v28);
  objc_msgSend_setValue_forChatProperty_(self, v30, (uint64_t)v29, (uint64_t)v17);
}

- (BOOL)_recipientIsPhoneNumber
{
  BOOL v4 = objc_msgSend_recipient(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_ID(v4, v5, v6, v7);
  char v12 = objc_msgSend__appearsToBePhoneNumber(v8, v9, v10, v11);

  return v12;
}

- (BOOL)shouldForceServerStatusRefresh
{
  if (!objc_msgSend_supportsCapabilities_(self, a2, 512, v2)) {
    goto LABEL_3;
  }
  uint64_t v7 = objc_msgSend_account(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_service(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_iMessageService(IMServiceImpl, v12, v13, v14);

  if (v11 == v15)
  {
    uint64_t v21 = objc_msgSend_lastSentMessage(self, v16, v17, v18);
    uint64_t v25 = v21;
    if (!v21) {
      goto LABEL_7;
    }
    id v26 = objc_msgSend_sender(v21, v22, v23, v24);
    uint64_t v30 = objc_msgSend_service(v26, v27, v28, v29);
    uint64_t v34 = objc_msgSend_iMessageService(IMServiceImpl, v31, v32, v33);

    uint64_t v38 = objc_msgSend_guid(v25, v35, v36, v37);
    uint64_t v42 = objc_msgSend_lastUndeliveredMessageGUIDForForcedQuery(self, v39, v40, v41);
    int isEqualToString = objc_msgSend_isEqualToString_(v38, v43, (uint64_t)v42, v44);

    if (v30 == v34) {
      int v19 = (objc_msgSend_isDelivered(v25, v46, v47, v48) | isEqualToString) ^ 1;
    }
    else {
LABEL_7:
    }
      LOBYTE(v19) = 0;
  }
  else
  {
LABEL_3:
    LOBYTE(v19) = 0;
  }
  return v19;
}

- (void)_resetForceServerStatusRefresh
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_lastSentMessage(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_guid(v5, v6, v7, v8);
  objc_msgSend_setLastUndeliveredMessageGUIDForForcedQuery_(self, v10, (uint64_t)v9, v11);

  if (IMOSLoggingEnabled())
  {
    char v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = objc_msgSend_guid(v5, v13, v14, v15);
      int v17 = 138412290;
      uint64_t v18 = v16;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Stopping force queries while last sent message is %@", (uint8_t *)&v17, 0xCu);
    }
  }
}

- (unint64_t)capabilities
{
  if (objc_msgSend__supportsUndoSend(self, a2, v2, v3)) {
    uint64_t v8 = 2;
  }
  else {
    uint64_t v8 = 0;
  }
  unint64_t v9 = v8 | objc_msgSend__supportsEditMessage(self, v5, v6, v7);
  if (objc_msgSend__supportsNameAndPhoto(self, v10, v11, v12)) {
    v9 |= 8uLL;
  }
  if (objc_msgSend__supportsAudioMessages(self, v13, v14, v15)) {
    v9 |= 0x40uLL;
  }
  if (objc_msgSend__supportsGroupIdentity(self, v16, v17, v18)) {
    v9 |= 0x10uLL;
  }
  if (objc_msgSend__supportsGroupMutability(self, v19, v20, v21)) {
    v9 |= 0x20uLL;
  }
  if (objc_msgSend__supportsInlineReply(self, v22, v23, v24)) {
    v9 |= 4uLL;
  }
  if (objc_msgSend__supportsMentions(self, v25, v26, v27)) {
    v9 |= 0x80uLL;
  }
  if (objc_msgSend__supportsDeleteAndBlockGroup(self, v28, v29, v30)) {
    v9 |= 0x100uLL;
  }
  if (objc_msgSend__supportsDeliveryReceipts(self, v31, v32, v33)) {
    v9 |= 0x200uLL;
  }
  if (objc_msgSend__supportsFaceTime(self, v34, v35, v36)) {
    v9 |= 0x400uLL;
  }
  if (objc_msgSend__supportsSendMenu(self, v37, v38, v39)) {
    v9 |= 0x800uLL;
  }
  if (objc_msgSend__supportsShareLocation(self, v40, v41, v42)) {
    v9 |= 0x1000uLL;
  }
  if (objc_msgSend__supportsSimSwitch(self, v43, v44, v45)) {
    v9 |= 0x2000uLL;
  }
  if (objc_msgSend__supportsAlternativeCommunicationActions(self, v46, v47, v48)) {
    v9 |= 0x4000uLL;
  }
  if (objc_msgSend__supportsAttachments(self, v49, v50, v51)) {
    v9 |= 0x10000uLL;
  }
  if (objc_msgSend__supportsStickers(self, v52, v53, v54)) {
    v9 |= 0x8000uLL;
  }
  if (objc_msgSend__supportsMessageEffects(self, v55, v56, v57)) {
    v9 |= 0x20000uLL;
  }
  if (objc_msgSend__supportsTapbacks(self, v58, v59, v60)) {
    v9 |= 0x40000uLL;
  }
  if (objc_msgSend__supportsSendLater(self, v61, v62, v63)) {
    v9 |= 0x80000uLL;
  }
  if (objc_msgSend__supportsInlineAdaptiveImageGlyphs(self, v64, v65, v66)) {
    v9 |= 0x400000uLL;
  }
  if (objc_msgSend__supportsExpressiveText(self, v67, v68, v69)) {
    v9 |= 0x100000uLL;
  }
  if (objc_msgSend__supportsFocusMode(self, v70, v71, v72)) {
    return v9 | 0x200000;
  }
  else {
    return v9;
  }
}

- (BOOL)supportsCapabilities:(unint64_t)a3
{
  int v4 = a3;
  int v6 = a3 & 1;
  if (a3)
  {
    char v7 = objc_msgSend__supportsEditMessage(self, a2, a3, v3);
    if ((v4 & 2) == 0) {
      goto LABEL_9;
    }
  }
  else
  {
    char v7 = 0;
    if ((a3 & 2) == 0) {
      goto LABEL_9;
    }
  }
  char v8 = objc_msgSend__supportsUndoSend(self, a2, a3, v3);
  if (v4) {
    v7 &= v8;
  }
  else {
    char v7 = v8;
  }
  int v6 = 1;
LABEL_9:
  if ((v4 & 4) != 0)
  {
    char v11 = objc_msgSend__supportsInlineReply(self, a2, a3, v3);
    if (v6) {
      v7 &= v11;
    }
    else {
      char v7 = v11;
    }
    int v6 = 1;
    if ((v4 & 8) == 0)
    {
LABEL_11:
      if ((v4 & 0x10) == 0) {
        goto LABEL_12;
      }
      goto LABEL_42;
    }
  }
  else if ((v4 & 8) == 0)
  {
    goto LABEL_11;
  }
  char v12 = objc_msgSend__supportsNameAndPhoto(self, a2, a3, v3);
  if (v6) {
    v7 &= v12;
  }
  else {
    char v7 = v12;
  }
  int v6 = 1;
  if ((v4 & 0x10) == 0)
  {
LABEL_12:
    if ((v4 & 0x20) == 0) {
      goto LABEL_13;
    }
    goto LABEL_46;
  }
LABEL_42:
  char v13 = objc_msgSend__supportsGroupIdentity(self, a2, a3, v3);
  if (v6) {
    v7 &= v13;
  }
  else {
    char v7 = v13;
  }
  int v6 = 1;
  if ((v4 & 0x20) == 0)
  {
LABEL_13:
    if ((v4 & 0x40) == 0) {
      goto LABEL_14;
    }
    goto LABEL_50;
  }
LABEL_46:
  char v14 = objc_msgSend__supportsGroupMutability(self, a2, a3, v3);
  if (v6) {
    v7 &= v14;
  }
  else {
    char v7 = v14;
  }
  int v6 = 1;
  if ((v4 & 0x40) == 0)
  {
LABEL_14:
    if ((v4 & 0x80) == 0) {
      goto LABEL_15;
    }
    goto LABEL_54;
  }
LABEL_50:
  char v15 = objc_msgSend__supportsAudioMessages(self, a2, a3, v3);
  if (v6) {
    v7 &= v15;
  }
  else {
    char v7 = v15;
  }
  int v6 = 1;
  if ((v4 & 0x80) == 0)
  {
LABEL_15:
    if ((v4 & 0x100) == 0) {
      goto LABEL_16;
    }
    goto LABEL_58;
  }
LABEL_54:
  char v16 = objc_msgSend__supportsMentions(self, a2, a3, v3);
  if (v6) {
    v7 &= v16;
  }
  else {
    char v7 = v16;
  }
  int v6 = 1;
  if ((v4 & 0x100) == 0)
  {
LABEL_16:
    if ((v4 & 0x200) == 0) {
      goto LABEL_17;
    }
    goto LABEL_62;
  }
LABEL_58:
  char v17 = objc_msgSend__supportsDeleteAndBlockGroup(self, a2, a3, v3);
  if (v6) {
    v7 &= v17;
  }
  else {
    char v7 = v17;
  }
  int v6 = 1;
  if ((v4 & 0x200) == 0)
  {
LABEL_17:
    if ((v4 & 0x400) == 0) {
      goto LABEL_18;
    }
    goto LABEL_66;
  }
LABEL_62:
  char v18 = objc_msgSend__supportsDeliveryReceipts(self, a2, a3, v3);
  if (v6) {
    v7 &= v18;
  }
  else {
    char v7 = v18;
  }
  int v6 = 1;
  if ((v4 & 0x400) == 0)
  {
LABEL_18:
    if ((v4 & 0x800) == 0) {
      goto LABEL_19;
    }
    goto LABEL_70;
  }
LABEL_66:
  char v19 = objc_msgSend__supportsFaceTime(self, a2, a3, v3);
  if (v6) {
    v7 &= v19;
  }
  else {
    char v7 = v19;
  }
  int v6 = 1;
  if ((v4 & 0x800) == 0)
  {
LABEL_19:
    if ((v4 & 0x1000) == 0) {
      goto LABEL_20;
    }
    goto LABEL_74;
  }
LABEL_70:
  char v20 = objc_msgSend__supportsSendMenu(self, a2, a3, v3);
  if (v6) {
    v7 &= v20;
  }
  else {
    char v7 = v20;
  }
  int v6 = 1;
  if ((v4 & 0x1000) == 0)
  {
LABEL_20:
    if ((v4 & 0x2000) == 0) {
      goto LABEL_21;
    }
    goto LABEL_78;
  }
LABEL_74:
  char v21 = objc_msgSend__supportsShareLocation(self, a2, a3, v3);
  if (v6) {
    v7 &= v21;
  }
  else {
    char v7 = v21;
  }
  int v6 = 1;
  if ((v4 & 0x2000) == 0)
  {
LABEL_21:
    if ((v4 & 0x4000) == 0) {
      goto LABEL_22;
    }
    goto LABEL_82;
  }
LABEL_78:
  char v22 = objc_msgSend__supportsSimSwitch(self, a2, a3, v3);
  if (v6) {
    v7 &= v22;
  }
  else {
    char v7 = v22;
  }
  int v6 = 1;
  if ((v4 & 0x4000) == 0)
  {
LABEL_22:
    if ((v4 & 0x8000) == 0) {
      goto LABEL_23;
    }
    goto LABEL_86;
  }
LABEL_82:
  char v23 = objc_msgSend__supportsAlternativeCommunicationActions(self, a2, a3, v3);
  if (v6) {
    v7 &= v23;
  }
  else {
    char v7 = v23;
  }
  int v6 = 1;
  if ((v4 & 0x8000) == 0)
  {
LABEL_23:
    if ((v4 & 0x10000) == 0) {
      goto LABEL_24;
    }
    goto LABEL_90;
  }
LABEL_86:
  char v24 = objc_msgSend__supportsStickers(self, a2, a3, v3);
  if (v6) {
    v7 &= v24;
  }
  else {
    char v7 = v24;
  }
  int v6 = 1;
  if ((v4 & 0x10000) == 0)
  {
LABEL_24:
    if ((v4 & 0x20000) == 0) {
      goto LABEL_25;
    }
    goto LABEL_94;
  }
LABEL_90:
  char v25 = objc_msgSend__supportsAttachments(self, a2, a3, v3);
  if (v6) {
    v7 &= v25;
  }
  else {
    char v7 = v25;
  }
  int v6 = 1;
  if ((v4 & 0x20000) == 0)
  {
LABEL_25:
    if ((v4 & 0x40000) == 0) {
      goto LABEL_26;
    }
    goto LABEL_98;
  }
LABEL_94:
  char v26 = objc_msgSend__supportsMessageEffects(self, a2, a3, v3);
  if (v6) {
    v7 &= v26;
  }
  else {
    char v7 = v26;
  }
  int v6 = 1;
  if ((v4 & 0x40000) == 0)
  {
LABEL_26:
    if ((v4 & 0x80000) == 0) {
      goto LABEL_27;
    }
    goto LABEL_102;
  }
LABEL_98:
  char v27 = objc_msgSend__supportsTapbacks(self, a2, a3, v3);
  if (v6) {
    v7 &= v27;
  }
  else {
    char v7 = v27;
  }
  int v6 = 1;
  if ((v4 & 0x80000) == 0)
  {
LABEL_27:
    if ((v4 & 0x100000) == 0) {
      goto LABEL_28;
    }
    goto LABEL_106;
  }
LABEL_102:
  char v28 = objc_msgSend__supportsSendLater(self, a2, a3, v3);
  if (v6) {
    v7 &= v28;
  }
  else {
    char v7 = v28;
  }
  int v6 = 1;
  if ((v4 & 0x100000) == 0)
  {
LABEL_28:
    if ((v4 & 0x200000) == 0) {
      goto LABEL_29;
    }
    goto LABEL_110;
  }
LABEL_106:
  char v29 = objc_msgSend__supportsExpressiveText(self, a2, a3, v3);
  if (v6) {
    v7 &= v29;
  }
  else {
    char v7 = v29;
  }
  int v6 = 1;
  if ((v4 & 0x200000) == 0)
  {
LABEL_29:
    if ((v4 & 0x400000) == 0) {
      return v7;
    }
    goto LABEL_30;
  }
LABEL_110:
  char v30 = objc_msgSend__supportsFocusMode(self, a2, a3, v3);
  if (v6) {
    v7 &= v30;
  }
  else {
    char v7 = v30;
  }
  int v6 = 1;
  if ((v4 & 0x400000) != 0)
  {
LABEL_30:
    char v9 = objc_msgSend__supportsInlineAdaptiveImageGlyphs(self, a2, a3, v3);
    if (v6) {
      return v7 & v9;
    }
    else {
      return v9;
    }
  }
  return v7;
}

- (BOOL)_isHybridGroupEligibleByCarrier
{
  if (objc_msgSend__isSMSService(self, a2, v2, v3))
  {
    char v8 = (void *)MEMORY[0x1E4F6E660];
    char v9 = objc_msgSend_lastAddressedHandleID(self, v5, v6, v7);
    char v13 = objc_msgSend_lastAddressedSIMID(self, v10, v11, v12);
    LOBYTE(v8) = objc_msgSend_IMMMSGroupTextReplicationSupportedForPhoneNumber_simID_(v8, v14, (uint64_t)v9, (uint64_t)v13);

    return (char)v8;
  }
  else if (objc_msgSend__isRCSService(self, v5, v6, v7))
  {
    char v19 = objc_msgSend_sharedManager(MEMORY[0x1E4F6E658], v16, v17, v18);
    char v23 = objc_msgSend_lastAddressedHandleID(self, v20, v21, v22);
    char v27 = objc_msgSend_lastAddressedSIMID(self, v24, v25, v26);
    char v29 = objc_msgSend_groupTextReplicationSupportedForPhoneNumber_simID_(v19, v28, (uint64_t)v23, (uint64_t)v27);

    return v29;
  }
  else
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4B40994;
    block[3] = &unk_1E5B7ACD0;
    block[4] = self;
    if (qword_1E965E808 != -1) {
      dispatch_once(&qword_1E965E808, block);
    }
    return 1;
  }
}

- (BOOL)_isHybridGroup
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend_hybridGroupState(self, a2, v2, v3))
  {
    uint64_t v10 = objc_msgSend__uncachedHybridGroupStatus(self, v5, v6, v7);
    if (v10) {
      objc_msgSend_setHybridGroupState_(self, v8, 2, v9);
    }
    else {
      objc_msgSend_setHybridGroupState_(self, v8, 1, v9);
    }
    objc_msgSend__updateLastKnownHybridState_(self, v11, v10, v12);
    if (IMOSLoggingEnabled())
    {
      char v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        v18[0] = 67109120;
        v18[1] = objc_msgSend_hybridGroupState(self, v14, v15, v16);
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Hybrid group state unknown, updated to %d", (uint8_t *)v18, 8u);
      }
    }
  }
  return objc_msgSend_hybridGroupState(self, v5, v6, v7) == 2;
}

- (BOOL)_uncachedHybridGroupStatus
{
  return objc_msgSend__uncachedHybridGroupStatusWithIDSQueryResults_(self, a2, 0, v2);
}

- (BOOL)_canPossiblyBecomeHybrid
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_account(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_service(v5, v6, v7, v8);
  char v13 = objc_msgSend_supportsReplication(v9, v10, v11, v12);

  if ((v13 & 1) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    char v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "Chat is not Hybrid, not using SMS service", buf, 2u);
    }
LABEL_8:

    return 0;
  }
  if ((objc_msgSend__isHybridGroupEligibleByCarrier(self, v14, v15, v16) & 1) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      return 0;
    }
    char v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "Chat is not Hybrid, disabled by carrier", buf, 2u);
    }
    goto LABEL_8;
  }
  char v20 = objc_msgSend_participants(self, v17, v18, v19);
  if ((unint64_t)objc_msgSend_count(v20, v21, v22, v23) < 2)
  {

    goto LABEL_23;
  }
  int v28 = objc_msgSend_chatStyle(self, v24, v25, v26);

  if (v28 != 43)
  {
LABEL_23:
    if (IMOSLoggingEnabled())
    {
      __int16 v43 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
      {
        uint64_t v47 = objc_msgSend_participants(self, v44, v45, v46);
        *(_DWORD *)buf = 134217984;
        uint64_t v63 = objc_msgSend_count(v47, v48, v49, v50);
        _os_log_impl(&dword_1A4AF7000, v43, OS_LOG_TYPE_INFO, "Chat is not Hybrid, not enough participants: %lu", buf, 0xCu);
      }
    }
    return 0;
  }
  long long v59 = 0u;
  long long v60 = 0u;
  long long v57 = 0u;
  long long v58 = 0u;
  uint64_t v32 = objc_msgSend_participants(self, v29, v30, v31, 0);
  uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v57, (uint64_t)v61, 16);
  if (v37)
  {
    uint64_t v38 = *(void *)v58;
    while (2)
    {
      for (uint64_t i = 0; i != v37; ++i)
      {
        if (*(void *)v58 != v38) {
          objc_enumerationMutation(v32);
        }
        uint64_t v40 = objc_msgSend_ID(*(void **)(*((void *)&v57 + 1) + 8 * i), v34, v35, v36);
        char v41 = MEMORY[0x1A62639B0]();

        if ((v41 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v52 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              uint64_t v56 = objc_msgSend_participants(self, v53, v54, v55);
              *(_DWORD *)buf = 138412290;
              uint64_t v63 = (uint64_t)v56;
              _os_log_impl(&dword_1A4AF7000, v52, OS_LOG_TYPE_INFO, "Chat is not Hybrid, not all handles are phone number: %@", buf, 0xCu);
            }
          }
          BOOL v42 = 0;
          goto LABEL_34;
        }
      }
      uint64_t v37 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v34, (uint64_t)&v57, (uint64_t)v61, 16);
      if (v37) {
        continue;
      }
      break;
    }
  }
  BOOL v42 = 1;
LABEL_34:

  return v42;
}

- (BOOL)_uncachedHybridGroupStatusWithIDSQueryResults:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend__canPossiblyBecomeHybrid(self, v5, v6, v7))
  {
    id v8 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v45 = 0u;
    long long v46 = 0u;
    long long v47 = 0u;
    long long v48 = 0u;
    uint64_t v12 = objc_msgSend_participants(self, v9, v10, v11, 0);
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v45, (uint64_t)v49, 16);
    if (v14)
    {
      uint64_t v18 = v14;
      uint64_t v19 = *(void *)v46;
      do
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v46 != v19) {
            objc_enumerationMutation(v12);
          }
          uint64_t v21 = objc_msgSend_ID(*(void **)(*((void *)&v45 + 1) + 8 * i), v15, v16, v17);
          uint64_t v22 = IMChatCanonicalIDSIDsForAddress();
          objc_msgSend_addObject_(v8, v23, (uint64_t)v22, v24);
        }
        uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v45, (uint64_t)v49, 16);
      }
      while (v18);
    }

    if (!v4
      || (uint64_t v28 = objc_msgSend_count(v4, v25, v26, v27),
          objc_msgSend_participants(self, v29, v30, v31),
          uint64_t v32 = objc_claimAutoreleasedReturnValue(),
          uint64_t v36 = objc_msgSend_count(v32, v33, v34, v35),
          v32,
          v28 != v36))
    {
      uint64_t v39 = (void *)MEMORY[0x1E4F6E7B8];
      uint64_t v40 = IMServiceNameForCanonicalIDSAddresses();
      uint64_t v42 = objc_msgSend__currentIDStatusForDestinations_service_listenerID_(v39, v41, (uint64_t)v8, (uint64_t)v40, @"IMChat+Capabilities");

      id v4 = (id)v42;
    }
    char HaveMixedIDSStatus = objc_msgSend__idsQueryResultsHaveMixedIDSStatus_(self, v37, (uint64_t)v4, v38);
  }
  else
  {
    char HaveMixedIDSStatus = 0;
  }

  return HaveMixedIDSStatus;
}

- (BOOL)_reachabilityResultHasMixedStatus:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v7 = v3;
  if (v3 && (objc_msgSend_allAreReachable(v3, v4, v5, v6) & 1) == 0)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    uint64_t v12 = objc_msgSend_handleResults(v7, v8, v9, v10, 0);
    uint64_t v16 = objc_msgSend_allValues(v12, v13, v14, v15);

    uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v24, (uint64_t)v28, 16);
    if (v11)
    {
      uint64_t v21 = *(void *)v25;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v25 != v21) {
            objc_enumerationMutation(v16);
          }
          if (objc_msgSend_isReachable(*(void **)(*((void *)&v24 + 1) + 8 * i), v18, v19, v20))
          {
            LOBYTE(v11) = 1;
            goto LABEL_14;
          }
        }
        uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v18, (uint64_t)&v24, (uint64_t)v28, 16);
        if (v11) {
          continue;
        }
        break;
      }
    }
LABEL_14:
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)_uncachedHybridGroupStatusWithReachabilityResult:(id)a3
{
  id v4 = a3;
  if (objc_msgSend__canPossiblyBecomeHybrid(self, v5, v6, v7)) {
    char HasMixedStatus = objc_msgSend__reachabilityResultHasMixedStatus_(self, v8, (uint64_t)v4, v9);
  }
  else {
    char HasMixedStatus = 0;
  }

  return HasMixedStatus;
}

- (BOOL)_idsQueryResultsHaveMixedIDSStatus:(id)a3
{
  id v3 = a3;
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  uint64_t v19 = 0;
  uint64_t v12 = 0;
  char v13 = &v12;
  uint64_t v14 = 0x2020000000;
  uint64_t v15 = 0;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1A4B413C8;
  v11[3] = &unk_1E5B7AF30;
  v11[4] = &v16;
  v11[5] = &v12;
  objc_msgSend_enumerateKeysAndObjectsUsingBlock_(v3, v4, (uint64_t)v11, v5);
  if (!v17[3])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        id v8 = "Chat is not Hybrid, not enough iMessageable participants";
LABEL_10:
        _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, v8, v10, 2u);
      }
LABEL_11:
    }
LABEL_12:
    BOOL v6 = 0;
    goto LABEL_13;
  }
  if (!v13[3])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        id v8 = "Chat is not Hybrid, not enough non-iMessageable participants";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  BOOL v6 = 1;
LABEL_13:
  _Block_object_dispose(&v12, 8);
  _Block_object_dispose(&v16, 8);

  return v6;
}

- (BOOL)_isiMessageService
{
  id v4 = objc_msgSend_account(self, a2, v2, v3);
  id v8 = objc_msgSend_service(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_name(v8, v9, v10, v11);
  char isEqualToString = objc_msgSend_isEqualToString_(v12, v13, *MEMORY[0x1E4F6E1B0], v14);

  return isEqualToString;
}

- (BOOL)_isSMSService
{
  id v4 = objc_msgSend_account(self, a2, v2, v3);
  id v8 = objc_msgSend_service(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_name(v8, v9, v10, v11);
  char isEqualToString = objc_msgSend_isEqualToString_(v12, v13, *MEMORY[0x1E4F6E1A0], v14);

  return isEqualToString;
}

- (BOOL)_isRCSService
{
  id v4 = objc_msgSend_account(self, a2, v2, v3);
  id v8 = objc_msgSend_service(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_name(v8, v9, v10, v11);
  char isEqualToString = objc_msgSend_isEqualToString_(v12, v13, *MEMORY[0x1E4F6E198], v14);

  return isEqualToString;
}

- (BOOL)_isReplicatingService
{
  id v4 = objc_msgSend_account(self, a2, v2, v3);
  id v8 = objc_msgSend_service(v4, v5, v6, v7);
  char v12 = objc_msgSend_supportsReplication(v8, v9, v10, v11);

  return v12;
}

- (BOOL)_isiMessageLiteServiceOrInCompatibleMode
{
  if (objc_msgSend_shouldDisplayOffGridModeStatus(self, a2, v2, v3)) {
    return 1;
  }
  uint64_t v9 = objc_msgSend_account(self, v5, v6, v7);
  char v13 = objc_msgSend_service(v9, v10, v11, v12);
  uint64_t v17 = objc_msgSend_internalName(v13, v14, v15, v16);
  char isEqualToString = objc_msgSend_isEqualToString_(v17, v18, *MEMORY[0x1E4F6E1B8], v19);

  return isEqualToString;
}

- (BOOL)_isSMSSatelliteService
{
  id v4 = objc_msgSend_account(self, a2, v2, v3);
  id v8 = objc_msgSend_service(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_internalName(v8, v9, v10, v11);
  char isEqualToString = objc_msgSend_isEqualToString_(v12, v13, *MEMORY[0x1E4F6E1A8], v14);

  return isEqualToString;
}

- (BOOL)_serviceCapabilityEnabled:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend__serviceForCapabilityCheck(self, v5, v6, v7);
  BOOL v14 = (objc_msgSend_supportsCapability_(v8, v9, (uint64_t)v4, v10) & 1) != 0
     || objc_msgSend_supportsReplication(v8, v11, v12, v13)
     && objc_msgSend__isHybridGroup(self, v15, v16, v17)
     && (objc_msgSend_supportsReplicationCapability_(v8, v18, (uint64_t)v4, v19) & 1) != 0;

  return v14;
}

- (id)_serviceForCapabilityCheck
{
  if (objc_msgSend_shouldForceToSMS(self, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_smsService(IMServiceImpl, v5, v6, v7);
LABEL_5:
    uint64_t v12 = (void *)v8;
    goto LABEL_7;
  }
  if (objc_msgSend_shouldDisplayOffGridModeStatus(self, v5, v6, v7))
  {
    uint64_t v8 = objc_msgSend_iMessageLiteService(IMServiceImpl, v9, v10, v11);
    goto LABEL_5;
  }
  uint64_t v13 = objc_msgSend_account(self, v9, v10, v11);
  uint64_t v12 = objc_msgSend_service(v13, v14, v15, v16);

LABEL_7:

  return v12;
}

- (BOOL)_supportsInlineReply
{
  if ((objc_msgSend_isBusinessChat(self, a2, v2, v3) & 1) != 0
    || (objc_msgSend_isMakoChat(self, v5, v6, v7) & 1) != 0
    || (objc_msgSend_isAppleChat(self, v8, v9, v10) & 1) != 0
    || (objc_msgSend_isReadOnly(self, v11, v12, v13) & 1) != 0
    || (objc_msgSend_isStewieSharingChat(self, v14, v15, v16) & 1) != 0)
  {
    return 0;
  }
  uint64_t v19 = *MEMORY[0x1E4F6E060];

  return MEMORY[0x1F4181798](self, sel__serviceCapabilityEnabled_, v19, v17);
}

- (BOOL)_supportsUndoSend
{
  if (objc_msgSend_isReadOnly(self, a2, v2, v3)) {
    return 0;
  }
  uint64_t v7 = *MEMORY[0x1E4F6E130];

  return MEMORY[0x1F4181798](self, sel__serviceCapabilityEnabled_, v7, v5);
}

- (BOOL)_supportsEditMessage
{
  if (objc_msgSend_isReadOnly(self, a2, v2, v3)) {
    return 0;
  }
  uint64_t v7 = *MEMORY[0x1E4F6E018];

  return MEMORY[0x1F4181798](self, sel__serviceCapabilityEnabled_, v7, v5);
}

- (BOOL)_supportsMentions
{
  if ((objc_msgSend_isBusinessChat(self, a2, v2, v3) & 1) != 0
    || (objc_msgSend_isReadOnly(self, v5, v6, v7) & 1) != 0
    || (objc_msgSend_isStewieChat(self, v8, v9, v10) & 1) != 0)
  {
    return 0;
  }
  uint64_t v13 = *MEMORY[0x1E4F6E078];

  return MEMORY[0x1F4181798](self, sel__serviceCapabilityEnabled_, v13, v11);
}

- (BOOL)_supportsDeleteAndBlockGroup
{
  char isSMS = objc_msgSend_isSMS(self, a2, v2, v3);
  return isSMS & objc_msgSend_isGroupChat(self, v6, v7, v8);
}

- (BOOL)_supportsDeliveryReceipts
{
  uint64_t v5 = objc_msgSend_account(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_service(v5, v6, v7, v8);
  if (objc_msgSend_supportsCapability_(v9, v10, *MEMORY[0x1E4F6E008], v11)) {
    BOOL v15 = objc_msgSend_chatStyle(self, v12, v13, v14) == 45;
  }
  else {
    BOOL v15 = 0;
  }

  return v15;
}

- (BOOL)_supportsNameAndPhoto
{
  if (objc_msgSend_isBusinessChat(self, a2, v2, v3) & 1) != 0 || (objc_msgSend_isReadOnly(self, v5, v6, v7)) {
    return 0;
  }
  uint64_t v10 = *MEMORY[0x1E4F6E0A0];

  return MEMORY[0x1F4181798](self, sel__serviceCapabilityEnabled_, v10, v8);
}

- (BOOL)_supportsAudioMessages
{
  uint64_t v5 = objc_msgSend_participants(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_count(v5, v6, v7, v8);

  if (!v9 || (objc_msgSend_isReadOnly(self, v10, v11, v12) & 1) != 0) {
    return 0;
  }
  uint64_t v15 = *MEMORY[0x1E4F6DFD8];

  return MEMORY[0x1F4181798](self, sel__serviceCapabilityEnabled_, v15, v13);
}

- (BOOL)_supportsGroupIdentity
{
  int isGroupChat = objc_msgSend_isGroupChat(self, a2, v2, v3);
  if (isGroupChat)
  {
    if ((objc_msgSend_hasLeftGroup(self, v6, v7, v8) & 1) != 0
      || (objc_msgSend_isReadOnly(self, v9, v10, v11) & 1) != 0
      || (objc_msgSend_sharedInstance(IMChorosMonitor, v12, v13, v14),
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          char isSatelliteConnectionActive = objc_msgSend_isSatelliteConnectionActive(v15, v16, v17, v18),
          v15,
          (isSatelliteConnectionActive & 1) != 0))
    {
      LOBYTE(isGroupChat) = 0;
    }
    else
    {
      LOBYTE(isGroupChat) = objc_msgSend__suppressesMutationsFromLocalDevice(self, v20, v21, v22) ^ 1;
    }
  }
  return isGroupChat;
}

- (BOOL)_supportsGroupMutability
{
  if (!objc_msgSend_isGroupChat(self, a2, v2, v3)
    || (objc_msgSend_hasLeftGroup(self, v5, v6, v7) & 1) != 0
    || (objc_msgSend_isReadOnly(self, v8, v9, v10) & 1) != 0
    || (objc_msgSend__suppressesMutationsFromLocalDevice(self, v11, v12, v13) & 1) != 0)
  {
    return 0;
  }
  uint64_t v18 = objc_msgSend_account(self, v14, v15, v16);
  uint64_t v22 = objc_msgSend_service(v18, v19, v20, v21);
  char v26 = objc_msgSend_supportsMutatingGroupMembers(v22, v23, v24, v25);

  return v26;
}

- (BOOL)_supportsFaceTime
{
  uint64_t v5 = objc_msgSend_sharedInstance(IMChorosMonitor, a2, v2, v3);
  char isSatelliteConnectionActive = objc_msgSend_isSatelliteConnectionActive(v5, v6, v7, v8);

  if (isSatelliteConnectionActive & 1) != 0 || (objc_msgSend_isStewieSharingChat(self, v10, v11, v12)) {
    return 0;
  }
  uint64_t v15 = *MEMORY[0x1E4F6E020];

  return MEMORY[0x1F4181798](self, sel__serviceCapabilityEnabled_, v15, v13);
}

- (BOOL)_supportsSendMenu
{
  if (objc_msgSend_isReadOnly(self, a2, v2, v3)) {
    goto LABEL_4;
  }
  int v8 = objc_msgSend__supportsAttachments(self, v5, v6, v7);
  if (v8)
  {
    if (IMIsRunningInMessagesViewService())
    {
LABEL_4:
      LOBYTE(v8) = 0;
      return v8;
    }
    LOBYTE(v8) = IMIsRunningInMessagesTranscriptExtension() ^ 1;
  }
  return v8;
}

- (BOOL)_supportsExpressiveText
{
  if ((objc_msgSend_isReadOnly(self, a2, v2, v3) & 1) != 0
    || (objc_msgSend_isBusinessChat(self, v5, v6, v7) & 1) != 0
    || (objc_msgSend_isMakoChat(self, v8, v9, v10) & 1) != 0
    || (objc_msgSend_isAppleChat(self, v11, v12, v13) & 1) != 0
    || (objc_msgSend_isStewieChat(self, v14, v15, v16) & 1) != 0
    || (objc_msgSend_isStewieEmergencyChat(self, v17, v18, v19) & 1) != 0
    || (objc_msgSend_isStewieSharingChat(self, v20, v21, v22) & 1) != 0)
  {
    return 0;
  }
  uint64_t v25 = *MEMORY[0x1E4F6E118];

  return MEMORY[0x1F4181798](self, sel__serviceCapabilityEnabled_, v25, v23);
}

- (BOOL)_supportsFocusMode
{
  if (objc_msgSend_chatStyle(self, a2, v2, v3) != 45) {
    return 0;
  }
  if (objc_msgSend_isReadOnly(self, v5, v6, v7)) {
    return 0;
  }
  if (objc_msgSend_isBusinessChat(self, v8, v9, v10)) {
    return 0;
  }
  if (objc_msgSend_isMakoChat(self, v11, v12, v13)) {
    return 0;
  }
  if (objc_msgSend_isAppleChat(self, v14, v15, v16)) {
    return 0;
  }
  if (objc_msgSend_isStewieChat(self, v17, v18, v19)) {
    return 0;
  }
  if (objc_msgSend_isStewieEmergencyChat(self, v20, v21, v22)) {
    return 0;
  }
  if (objc_msgSend_isStewieSharingChat(self, v23, v24, v25)) {
    return 0;
  }
  uint64_t v29 = objc_msgSend_sharedInstance(IMChorosMonitor, v26, v27, v28);
  char isSatelliteConnectionActive = objc_msgSend_isSatelliteConnectionActive(v29, v30, v31, v32);

  if (isSatelliteConnectionActive) {
    return 0;
  }
  uint64_t v36 = *MEMORY[0x1E4F6E028];

  return MEMORY[0x1F4181798](self, sel__serviceCapabilityEnabled_, v36, v34);
}

- (BOOL)_supportsShareLocation
{
  if ((objc_msgSend_hasLeftGroup(self, a2, v2, v3) & 1) != 0
    || (objc_msgSend_isReadOnly(self, v5, v6, v7) & 1) != 0
    || (objc_msgSend__isiMessageLiteServiceOrInCompatibleMode(self, v8, v9, v10) & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend__isSMSSatelliteService(self, v11, v12, v13) ^ 1;
  }
}

- (BOOL)_supportsSimSwitch
{
  if (objc_msgSend_isReadOnly(self, a2, v2, v3)) {
    return 0;
  }
  if (objc_msgSend_hasLeftGroup(self, v5, v6, v7)) {
    return 0;
  }
  if (objc_msgSend_isGroupChat(self, v8, v9, v10))
  {
    uint64_t v14 = objc_msgSend_sharedInstance(IMChorosMonitor, v11, v12, v13);
    char isSatelliteConnectionActive = objc_msgSend_isSatelliteConnectionActive(v14, v15, v16, v17);

    if (isSatelliteConnectionActive) {
      return 0;
    }
  }

  return MEMORY[0x1F4124440]();
}

- (BOOL)_supportsAlternativeCommunicationActions
{
  if ((objc_msgSend__isiMessageLiteServiceOrInCompatibleMode(self, a2, v2, v3) & 1) != 0
    || (objc_msgSend__isSMSSatelliteService(self, v5, v6, v7) & 1) != 0)
  {
    return 0;
  }
  if (!objc_msgSend_isGroupChat(self, v8, v9, v10)) {
    return 1;
  }
  uint64_t v15 = objc_msgSend_sharedInstance(IMChorosMonitor, v12, v13, v14);
  char isSatelliteConnectionActive = objc_msgSend_isSatelliteConnectionActive(v15, v16, v17, v18);

  return isSatelliteConnectionActive ^ 1;
}

- (BOOL)_supportsAttachments
{
  if (objc_msgSend_isGroupChat(self, a2, v2, v3))
  {
    int v8 = objc_msgSend_sharedInstance(IMChorosMonitor, v5, v6, v7);
    char isSatelliteConnectionActive = objc_msgSend_isSatelliteConnectionActive(v8, v9, v10, v11);

    if (isSatelliteConnectionActive) {
      return 0;
    }
  }
  uint64_t v14 = *MEMORY[0x1E4F6DFC8];

  return MEMORY[0x1F4181798](self, sel__serviceCapabilityEnabled_, v14, v7);
}

- (BOOL)_supportsMultiPart
{
  id v4 = objc_msgSend_account(self, a2, v2, v3);
  int v8 = objc_msgSend_service(v4, v5, v6, v7);
  char v11 = objc_msgSend_supportsCapability_(v8, v9, *MEMORY[0x1E4F6E088], v10);

  return v11;
}

- (BOOL)_supportsStickers
{
  if (objc_msgSend_isBusinessChat(self, a2, v2, v3)) {
    return 0;
  }
  if (objc_msgSend_isGroupChat(self, v5, v6, v7))
  {
    char v11 = objc_msgSend_sharedInstance(IMChorosMonitor, v8, v9, v10);
    char isSatelliteConnectionActive = objc_msgSend_isSatelliteConnectionActive(v11, v12, v13, v14);

    if (isSatelliteConnectionActive) {
      return 0;
    }
  }
  if ((objc_msgSend_isStewieChat(self, v8, v9, v10) & 1) != 0
    || (objc_msgSend_isStewieEmergencyChat(self, v16, v17, v18) & 1) != 0
    || (objc_msgSend_isStewieSharingChat(self, v19, v20, v21) & 1) != 0
    || (objc_msgSend_isStewieRoadsideChat(self, v22, v23, v24) & 1) != 0)
  {
    return 0;
  }
  uint64_t v27 = *MEMORY[0x1E4F6E110];

  return MEMORY[0x1F4181798](self, sel__serviceCapabilityEnabled_, v27, v25);
}

- (BOOL)_supportsMessageEffects
{
  if ((objc_msgSend_isBusinessChat(self, a2, v2, v3) & 1) != 0
    || (objc_msgSend_isStewieChat(self, v5, v6, v7) & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend__isSMSSatelliteService(self, v8, v9, v10) ^ 1;
  }
}

- (BOOL)_supportsTapbacks
{
  if ((objc_msgSend_isStewieChat(self, a2, v2, v3) & 1) != 0
    || (objc_msgSend_isStewieEmergencyChat(self, v5, v6, v7) & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend_isStewieSharingChat(self, v8, v9, v10) ^ 1;
  }
}

- (BOOL)_supportsSendLater
{
  if ((objc_msgSend_isBusinessChat(self, a2, v2, v3) & 1) != 0
    || (objc_msgSend_isMakoChat(self, v5, v6, v7) & 1) != 0
    || (objc_msgSend_isAppleChat(self, v8, v9, v10) & 1) != 0
    || (objc_msgSend_isStewieChat(self, v11, v12, v13) & 1) != 0
    || (objc_msgSend_isStewieEmergencyChat(self, v14, v15, v16) & 1) != 0
    || (objc_msgSend_isStewieSharingChat(self, v17, v18, v19) & 1) != 0)
  {
    return 0;
  }
  uint64_t v22 = *MEMORY[0x1E4F6E0F8];

  return MEMORY[0x1F4181798](self, sel__serviceCapabilityEnabled_, v22, v20);
}

- (BOOL)_supportsInlineAdaptiveImageGlyphs
{
  uint64_t v5 = objc_msgSend__serviceForCapabilityCheck(self, a2, v2, v3);
  if (!objc_msgSend_supportsCapability_(v5, v6, *MEMORY[0x1E4F6E058], v7)
    || !objc_msgSend__supportsAttachments(self, v8, v9, v10)
    || (objc_msgSend_isBusinessChat(self, v11, v12, v13) & 1) != 0
    || (objc_msgSend_isMakoChat(self, v14, v15, v16) & 1) != 0
    || (objc_msgSend_isAppleChat(self, v17, v18, v19) & 1) != 0
    || (objc_msgSend_isStewieChat(self, v20, v21, v22) & 1) != 0
    || (objc_msgSend_isStewieEmergencyChat(self, v23, v24, v25) & 1) != 0)
  {
    LOBYTE(v29) = 0;
  }
  else
  {
    int v29 = objc_msgSend_isStewieSharingChat(self, v26, v27, v28) ^ 1;
  }

  return v29;
}

- (void)_updateHybridGroupStateWithPerParticipantIDSStatus:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v9 = objc_msgSend__uncachedHybridGroupStatusWithIDSQueryResults_(self, v5, (uint64_t)v4, v6);
  if (v9) {
    objc_msgSend_setHybridGroupState_(self, v7, 2, v8);
  }
  else {
    objc_msgSend_setHybridGroupState_(self, v7, 1, v8);
  }
  objc_msgSend__updateLastKnownHybridState_(self, v10, v9, v11);
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v16[0] = 67109120;
      v16[1] = objc_msgSend_hybridGroupState(self, v13, v14, v15);
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Updating hybrid group state to %d using provided IDS statuses", (uint8_t *)v16, 8u);
    }
  }
}

- (void)_updateHybridGroupStateWithReachabilityResult:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v9 = objc_msgSend__uncachedHybridGroupStatusWithReachabilityResult_(self, v5, (uint64_t)v4, v6);
  if (v9) {
    objc_msgSend_setHybridGroupState_(self, v7, 2, v8);
  }
  else {
    objc_msgSend_setHybridGroupState_(self, v7, 1, v8);
  }
  objc_msgSend__updateLastKnownHybridState_(self, v10, v9, v11);
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      v16[0] = 67109120;
      v16[1] = objc_msgSend_hybridGroupState(self, v13, v14, v15);
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Updating hybrid group state to %d using provided IDS statuses", (uint8_t *)v16, 8u);
    }
  }
}

- (BOOL)_suppressesMutationsFromLocalDevice
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  char isRelayGroupMutationEnabled = objc_msgSend_isRelayGroupMutationEnabled(v5, v6, v7, v8);

  if (isRelayGroupMutationEnabled) {
    return 0;
  }
  uint64_t v13 = objc_msgSend_account(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_service(v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_rcsService(IMService, v18, v19, v20);

  return v17 == v21 && !IMSharedHelperRetrieveSimDetailsFromTelephony();
}

- (BOOL)mapsToTUConversation:(id)a3
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_chatStyle(self, v5, v6, v7) == 43)
  {
    uint64_t v11 = objc_msgSend_groupID(self, v8, v9, v10);
    uint64_t v15 = objc_msgSend_messagesGroupUUID(v4, v12, v13, v14);
    uint64_t v19 = objc_msgSend_UUIDString(v15, v16, v17, v18);
    int isEqualToString = objc_msgSend_isEqualToString_(v11, v20, (uint64_t)v19, v21);

    if (isEqualToString)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_chatIdentifier(self, v24, v25, v26);
          id v27 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v31 = objc_msgSend_messagesGroupUUID(v4, v28, v29, v30);
          objc_msgSend_UUIDString(v31, v32, v33, v34);
          id v35 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v39 = objc_msgSend_groupID(self, v36, v37, v38);
          int v87 = 138412802;
          id v88 = v27;
          __int16 v89 = 2112;
          id v90 = v35;
          __int16 v91 = 2112;
          uint64_t v92 = v39;
          _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "We mapped a chat %@ to a TUConversation with messagesGroupUUID %@ for chat groupID %@", (uint8_t *)&v87, 0x20u);
        }
      }
      LOBYTE(v40) = 1;
      goto LABEL_19;
    }
LABEL_16:
    LOBYTE(v40) = 0;
    goto LABEL_19;
  }
  char v41 = objc_msgSend_participants(self, v8, v9, v10);
  uint64_t v45 = objc_msgSend_count(v41, v42, v43, v44);

  if (v45 != 1) {
    goto LABEL_16;
  }
  uint64_t v49 = objc_msgSend_remoteMembers(v4, v46, v47, v48);
  if (objc_msgSend_count(v49, v50, v51, v52) == 1)
  {
    uint64_t v56 = objc_msgSend_participants(self, v53, v54, v55);
    long long v60 = objc_msgSend_firstObject(v56, v57, v58, v59);

    uint64_t v61 = (void *)MEMORY[0x1E4FADBD8];
    uint64_t v65 = objc_msgSend_ID(v60, v62, v63, v64);
    uint64_t v68 = objc_msgSend_normalizedHandleWithDestinationID_(v61, v66, (uint64_t)v65, v67);

    uint64_t v72 = objc_msgSend_allObjects(v49, v69, v70, v71);
    unsigned __int8 v76 = objc_msgSend_firstObject(v72, v73, v74, v75);
    uint64_t v80 = objc_msgSend_handle(v76, v77, v78, v79);

    int v40 = TUHandlesAreCanonicallyEqual();
    if (v40 && IMOSLoggingEnabled())
    {
      __int16 v81 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        id v85 = objc_msgSend_chatIdentifier(self, v82, v83, v84);
        int v87 = 138412546;
        id v88 = v85;
        __int16 v89 = 2112;
        id v90 = v4;
        _os_log_impl(&dword_1A4AF7000, v81, OS_LOG_TYPE_INFO, "We mapped a 1x1 chat %@ to a TUConversation: %@", (uint8_t *)&v87, 0x16u);
      }
    }
  }
  else
  {
    LOBYTE(v40) = 0;
  }

LABEL_19:
  return v40;
}

- (void)addHandlesToGroupFaceTimeChatIfRegistered:(id)a3
{
  id v4 = a3;
  uint64_t v10 = objc_msgSend_conversation(self, v5, v6, v7);
  if (v10)
  {
    uint64_t v11 = objc_msgSend___imArrayByApplyingBlock_(v4, v8, (uint64_t)&unk_1EF8E50B8, v9);
    uint64_t v12 = (void *)MEMORY[0x1E4F6E7B8];
    uint64_t v13 = *MEMORY[0x1E4F6AA58];
    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    _DWORD v16[2] = sub_1A4B431D4;
    v16[3] = &unk_1E5B7B0B8;
    id v17 = v10;
    objc_msgSend_refreshIDStatusForDestinations_service_listenerID_queue_completionBlock_(v12, v14, (uint64_t)v11, v13, @"IMChat+TelephonyUtilities", MEMORY[0x1E4F14428], v16);
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_4;
    }
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v15 = 0;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "No paired Group FaceTime conversation to keep in sync", v15, 2u);
    }
  }

LABEL_4:
}

- (id)conversationWithUUID:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v7 = objc_msgSend_sharedRegistry(IMChatRegistry, v4, v5, v6, 0);
  uint64_t v11 = objc_msgSend_conversationManager(v7, v8, v9, v10);
  uint64_t v15 = objc_msgSend_activeConversations(v11, v12, v13, v14);

  id v20 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v20)
  {
    uint64_t v21 = *(void *)v30;
    while (2)
    {
      for (uint64_t i = 0; i != v20; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v30 != v21) {
          objc_enumerationMutation(v15);
        }
        uint64_t v23 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        uint64_t v24 = objc_msgSend_UUID(v23, v17, v18, v19);
        int isEqual = objc_msgSend_isEqual_(v24, v25, (uint64_t)v3, v26);

        if (isEqual)
        {
          id v20 = v23;
          goto LABEL_11;
        }
      }
      id v20 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v17, (uint64_t)&v29, (uint64_t)v33, 16);
      if (v20) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v20;
}

- (void)joinExistingTUConversationWithUUID:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_conversationWithUUID_(self, v5, (uint64_t)v4, v6);
  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        uint64_t v13 = v7;
        _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Found conversation %@", (uint8_t *)&v12, 0xCu);
      }
    }
    objc_msgSend_joinExistingConversation_(self, v8, (uint64_t)v7, v9);
  }
  else
  {
    uint64_t v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB7230((uint64_t)v4, v11);
    }
  }
}

- (void)joinExistingTUConversation
{
  objc_msgSend_conversation(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_joinExistingConversation_(self, v5, (uint64_t)v7, v6);
}

- (void)joinExistingConversation:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMDeviceIsGreenTea())
  {
    id v7 = objc_msgSend_faceTimeShowInCallUIURL(MEMORY[0x1E4F1CB10], v4, v5, v6);
    TUOpenURL();
  }
  else
  {
    uint64_t v8 = objc_msgSend_conversationIsVideoCall_(IMFaceTimeUtilities, v4, (uint64_t)v3, v6);
    uint64_t v12 = objc_msgSend_platformSupportsStagingArea(IMFaceTimeUtilities, v9, v10, v11) & v8;
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = objc_msgSend_UUID(v3, v15, v16, v17);
        uint64_t v19 = (void *)v18;
        id v20 = @"NO";
        if (v8) {
          uint64_t v21 = @"YES";
        }
        else {
          uint64_t v21 = @"NO";
        }
        *(_DWORD *)uint64_t v22 = 138412802;
        *(void *)&v22[4] = v18;
        *(void *)&v22[14] = v21;
        *(_WORD *)&v22[12] = 2112;
        if (v12) {
          id v20 = @"YES";
        }
        *(_WORD *)&v22[22] = 2112;
        uint64_t v23 = v20;
        _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Join TUConversation UUID: %@, isVideoCall: %@, wantsStagingArea: %@", v22, 0x20u);
      }
    }
    objc_msgSend_joinExistingConversationForTUCoversation_videoEnabled_wantsStagingArea_(IMFaceTimeUtilities, v13, (uint64_t)v3, v8, v12, *(_OWORD *)v22, *(void *)&v22[16]);
  }
}

- (void)initiateTUConversationWithVideoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = @"NO";
      if (v3) {
        uint64_t v9 = @"YES";
      }
      int v42 = 138412290;
      unint64_t v43 = (unint64_t)v9;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] We want to initiate a TUConversation withVideo %@", (uint8_t *)&v42, 0xCu);
    }
  }
  if (objc_msgSend_joinState(self, v5, v6, v7))
  {
    uint64_t v13 = objc_msgSend_participants(self, v10, v11, v12);
    unint64_t v17 = objc_msgSend_count(v13, v14, v15, v16);

    unint64_t v24 = objc_msgSend_maximumNumberOfInvitedMembers(MEMORY[0x1E4FADB78], v18, v19, v20) + 1;
    if (v17 - 1 < v24)
    {
      uint64_t v25 = objc_msgSend_participants(self, v21, v22, v23);
      long long v29 = objc_msgSend_lastAddressedHandleID(self, v26, v27, v28);
      uint64_t v33 = objc_msgSend_groupID(self, v30, v31, v32);
      uint64_t v37 = objc_msgSend_displayName(self, v34, v35, v36);
      objc_msgSend_initiateTUConversationForParticipants_senderAddress_videoEnabled_groupID_displayName_screenShareType_(IMFaceTimeUtilities, v38, (uint64_t)v25, (uint64_t)v29, v3, v33, v37, 0);

      return;
    }
    BOOL v40 = v17 > v24;
    int v41 = IMOSLoggingEnabled();
    if (v40)
    {
      if (!v41) {
        return;
      }
      uint64_t v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        int v42 = 134217984;
        unint64_t v43 = v17;
        _os_log_impl(&dword_1A4AF7000, v39, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] Conversation has %lu recipients. Call is not allowed.", (uint8_t *)&v42, 0xCu);
      }
    }
    else
    {
      if (!v41) {
        return;
      }
      uint64_t v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        LOWORD(v42) = 0;
        _os_log_impl(&dword_1A4AF7000, v39, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] No recipients found on conversation, so not initiating a call.", (uint8_t *)&v42, 2u);
      }
    }
  }
  else
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    uint64_t v39 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      LOWORD(v42) = 0;
      _os_log_impl(&dword_1A4AF7000, v39, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] Bailing on initiating a call because we're no longer in the chat", (uint8_t *)&v42, 2u);
    }
  }
}

- (void)initiateTUConversationWithScreenShareType:(unint64_t)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v35 = 134217984;
      unint64_t v36 = a3;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] We want to initiate a TUConversation withScreenShareType %ld", (uint8_t *)&v35, 0xCu);
    }
  }
  if (!objc_msgSend_joinState(self, v5, v6, v7))
  {
    if (!IMOSLoggingEnabled()) {
      return;
    }
    uint64_t v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      LOWORD(v35) = 0;
      _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] Bailing on initiating a call because we're no longer in the chat", (uint8_t *)&v35, 2u);
    }
    goto LABEL_15;
  }
  uint64_t v12 = objc_msgSend_participants(self, v9, v10, v11);
  uint64_t v16 = objc_msgSend_count(v12, v13, v14, v15);

  if (v16 == 1)
  {
    uint64_t v20 = objc_msgSend_participants(self, v17, v18, v19);
    unint64_t v24 = objc_msgSend_lastAddressedHandleID(self, v21, v22, v23);
    uint64_t v28 = objc_msgSend_groupID(self, v25, v26, v27);
    uint64_t v32 = objc_msgSend_displayName(self, v29, v30, v31);
    objc_msgSend_initiateTUConversationForParticipants_senderAddress_videoEnabled_groupID_displayName_screenShareType_(IMFaceTimeUtilities, v33, (uint64_t)v20, (uint64_t)v24, 0, v28, v32, a3);

    return;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      int v35 = 134217984;
      unint64_t v36 = v16;
      _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] Unsupported number of participants for TUConversationWithScreenShare: %lu. Only 1 is allowed.", (uint8_t *)&v35, 0xCu);
    }
LABEL_15:
  }
}

- (void)initiateTUDialRequestWithVideoEnabled:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = @"NO";
      if (v3) {
        uint64_t v9 = @"YES";
      }
      int v25 = 138412290;
      uint64_t v26 = (uint64_t)v9;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilities] We want to initiate a TUDialRequest withVideo: %@", (uint8_t *)&v25, 0xCu);
    }
  }
  uint64_t v10 = objc_msgSend_participants(self, v5, v6, v7);
  uint64_t v14 = objc_msgSend_count(v10, v11, v12, v13);

  if (v14 == 1)
  {
    uint64_t v18 = objc_msgSend_participants(self, v15, v16, v17);
    uint64_t v22 = objc_msgSend_firstObject(v18, v19, v20, v21);
    objc_msgSend_initiateTUDialRequestForSingleParticipant_videoEnabled_(IMFaceTimeUtilities, v23, (uint64_t)v22, v3);
  }
  else if (IMOSLoggingEnabled())
  {
    unint64_t v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      int v25 = 134217984;
      uint64_t v26 = v14;
      _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "[IMChat+TelephonyUtilites] Unsupported number of participants for TUDialRequest: %lu. Only 1 is allowed.", (uint8_t *)&v25, 0xCu);
    }
  }
}

- (void)leaveCurrentTUCall
{
  objc_msgSend_currentTUCall(self, a2, v2, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_leaveTUCall_(IMFaceTimeUtilities, v4, (uint64_t)v6, v5);
}

- (id)callDurationStringForTuCall
{
  id v4 = objc_msgSend_currentTUCall(self, a2, v2, v3);
  uint64_t v8 = v4;
  if (v4)
  {
    uint64_t v9 = objc_msgSend_callDurationString(v4, v5, v6, v7);
  }
  else
  {
    uint64_t v9 = 0;
  }

  return v9;
}

- (id)currentTUCall
{
  uint64_t v84 = *MEMORY[0x1E4F143B8];
  long long v79 = 0u;
  long long v80 = 0u;
  long long v81 = 0u;
  long long v82 = 0u;
  unint64_t v5 = 0x1E4FAD000uLL;
  uint64_t v6 = objc_msgSend_sharedInstance(MEMORY[0x1E4FADA90], a2, v2, v3);
  uint64_t v10 = objc_msgSend_currentAudioAndVideoCalls(v6, v7, v8, v9);

  id obj = v10;
  uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v79, (uint64_t)v83, 16);
  uint64_t v15 = 0;
  if (v78)
  {
    uint64_t v77 = *(void *)v80;
    do
    {
      for (uint64_t i = 0; i != v78; ++i)
      {
        if (*(void *)v80 != v77) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v79 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_sharedInstance(*(void **)(v5 + 2704), v12, v13, v14);
        uint64_t v21 = objc_msgSend_activeConversationForCall_(v18, v19, (uint64_t)v17, v20);

        int v25 = objc_msgSend_UUID(v21, v22, v23, v24);
        long long v29 = objc_msgSend_conversation(self, v26, v27, v28);
        uint64_t v33 = objc_msgSend_UUID(v29, v30, v31, v32);
        int isEqual = objc_msgSend_isEqual_(v25, v34, (uint64_t)v33, v35);

        if (isEqual)
        {
          id v40 = v17;
        }
        else
        {
          int v41 = objc_msgSend_participants(self, v37, v38, v39);
          uint64_t v45 = objc_msgSend_count(v41, v42, v43, v44);

          if (v45 != 1) {
            goto LABEL_13;
          }
          uint64_t v49 = objc_msgSend_participants(self, v46, v47, v48);
          uint64_t v53 = objc_msgSend_firstObject(v49, v50, v51, v52);

          uint64_t v54 = (void *)MEMORY[0x1E4FADBD8];
          uint64_t v58 = objc_msgSend_ID(v53, v55, v56, v57);
          uint64_t v61 = objc_msgSend_normalizedHandleWithDestinationID_(v54, v59, (uint64_t)v58, v60);

          uint64_t v65 = objc_msgSend_remoteParticipantHandles(v17, v62, v63, v64);
          uint64_t v69 = objc_msgSend_allObjects(v65, v66, v67, v68);
          uint64_t v73 = objc_msgSend_firstObject(v69, v70, v71, v72);

          if (TUHandlesAreCanonicallyEqual())
          {
            id v74 = v17;

            uint64_t v15 = v74;
          }
          id v40 = v15;

          uint64_t v15 = v53;
          unint64_t v5 = 0x1E4FAD000;
        }

        uint64_t v15 = v40;
LABEL_13:
      }
      uint64_t v78 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v79, (uint64_t)v83, 16);
    }
    while (v78);
  }

  return v15;
}

- (id)activeParticipantsForTUConversation
{
  id v4 = objc_msgSend_conversation(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_activeRemoteParticipants(v4, v5, v6, v7);

  return v8;
}

- (id)remoteMembersForTUConversation
{
  id v4 = objc_msgSend_conversation(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_remoteMembers(v4, v5, v6, v7);

  return v8;
}

+ (id)watermarkComparator
{
  if (qword_1E965E838 != -1) {
    dispatch_once(&qword_1E965E838, &unk_1EF8E5DD8);
  }
  uint64_t v2 = _Block_copy((const void *)qword_1E965E830);

  return v2;
}

- (id)_storedWatermarkMessageID
{
  uint64_t v3 = IMWatermarkMessageIDCache();
  uint64_t v7 = objc_msgSend_guid(self, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  if (!v10)
  {
    uint64_t v10 = objc_msgSend_valueForChatProperty_(self, v11, @"IMChatWatermarkMessageID", v12);
    if (!v10)
    {
      uint64_t v10 = objc_msgSend_valueForChatProperty_(self, v13, @"CKChatWatermarkMessageID", v14);
      if (v10) {
        objc_msgSend_setValue_forChatProperty_(self, v15, 0, @"CKChatWatermarkMessageID");
      }
    }
  }

  return v10;
}

- (int64_t)watermarkMessageID
{
  uint64_t v8 = objc_msgSend__storedWatermarkMessageID(self, a2, v2, v3);
  if (!v8)
  {
    uint64_t v9 = NSNumber;
    uint64_t FinishedMessageID = objc_msgSend_lastFinishedMessageID(self, v5, v6, v7);
    uint64_t v8 = objc_msgSend_numberWithLongLong_(v9, v11, FinishedMessageID, v12);
  }
  if (objc_msgSend_longLongValue(v8, v5, v6, v7))
  {
    uint64_t v16 = IMWatermarkMessageIDCache();
    uint64_t v20 = objc_msgSend_guid(self, v17, v18, v19);
    objc_msgSend_setObject_forKey_(v16, v21, (uint64_t)v8, (uint64_t)v20);
  }
  int64_t v22 = objc_msgSend_longLongValue(v8, v13, v14, v15);

  return v22;
}

- (NSDate)watermarkDate
{
  uint64_t v3 = sub_1A4B512D4();
  uint64_t v7 = objc_msgSend_guid(self, v4, v5, v6);
  uint64_t v10 = objc_msgSend_objectForKey_(v3, v8, (uint64_t)v7, v9);

  if (!v10)
  {
    uint64_t v10 = objc_msgSend_valueForChatProperty_(self, v11, @"IMChatWatermarkDate", v12);
    if (!v10)
    {
      uint64_t v15 = objc_msgSend_valueForChatProperty_(self, v13, @"CKChatWatermarkTime", v14);
      uint64_t v19 = v15;
      if (v15)
      {
        objc_msgSend_doubleValue(v15, v16, v17, v18);
        if (v23 > 0.0)
        {
          uint64_t v24 = (void *)MEMORY[0x1E4F1C9C8];
          objc_msgSend_doubleValue(v19, v20, v21, v22);
          uint64_t v10 = objc_msgSend_dateWithTimeIntervalSince1970_(v24, v25, v26, v27);
          objc_msgSend_setValue_forChatProperty_(self, v28, 0, @"CKChatWatermarkTime");
          if (v10)
          {
            long long v29 = sub_1A4B512D4();
            uint64_t v33 = objc_msgSend_guid(self, v30, v31, v32);
            objc_msgSend_setObject_forKey_(v29, v34, (uint64_t)v10, (uint64_t)v33);

LABEL_11:
            goto LABEL_12;
          }
        }
      }
      else
      {
        uint64_t v10 = objc_msgSend_lastFinishedMessageDate(self, v16, v17, v18);
        if (v10) {
          goto LABEL_11;
        }
      }
      if (objc_msgSend_lastMessageTimeStampOnLoad(self, v20, v21, v22) < 1)
      {
        uint64_t v10 = 0;
      }
      else
      {
        uint64_t v38 = (void *)MEMORY[0x1E4F1C9C8];
        uint64_t MessageTimeStampOnLoad = objc_msgSend_lastMessageTimeStampOnLoad(self, v35, v36, v37);
        uint64_t v10 = objc_msgSend___im_dateWithNanosecondTimeIntervalSinceReferenceDate_(v38, v40, v41, v42, (double)MessageTimeStampOnLoad);
      }
      goto LABEL_11;
    }
  }
LABEL_12:

  return (NSDate *)v10;
}

- (void)updateWatermarks
{
  objc_msgSend_guid(self, a2, v2, v3);
  id v39 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend__storedWatermarkMessageID(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_longLongValue(v8, v9, v10, v11);

  uint64_t FinishedMessageID = v12;
  if (v12 <= objc_msgSend_lastFinishedMessageID(self, v13, v14, v15)) {
    uint64_t FinishedMessageID = objc_msgSend_lastFinishedMessageID(self, v16, v17, v18);
  }
  if (v39 && FinishedMessageID >= 1)
  {
    uint64_t v20 = IMWatermarkMessageIDCache();
    double v23 = objc_msgSend_numberWithLongLong_(NSNumber, v21, FinishedMessageID, v22);
    objc_msgSend_setObject_forKey_(v20, v24, (uint64_t)v23, (uint64_t)v39);
  }
  int v25 = objc_msgSend_watermarkDate(self, v16, v17, v18);
  long long v29 = objc_msgSend_lastFinishedMessageDate(self, v26, v27, v28);
  uint64_t v32 = v29;
  if (v25)
  {
    objc_msgSend_laterDate_(v25, v30, (uint64_t)v29, v31);
    id v33 = (id)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    id v33 = v29;
  }
  uint64_t v36 = v33;
  if (v39 && v33)
  {
    uint64_t v37 = sub_1A4B512D4();
    objc_msgSend_setObject_forKey_(v37, v38, (uint64_t)v36, (uint64_t)v39);
  }
  if (FinishedMessageID != v12 || v25 != v36 && (objc_msgSend_isEqualToDate_(v25, v34, (uint64_t)v36, v35) & 1) == 0) {
    objc_msgSend__postNotification_userInfo_(self, v34, @"IMChatWatermarkDidUpdateNotification", 0);
  }
}

- (void)saveWatermark
{
  objc_msgSend_guid(self, a2, v2, v3);
  id v22 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_watermarkMessageID(self, v5, v6, v7);
  if (v8 >= 1)
  {
    uint64_t v12 = objc_msgSend_numberWithLongLong_(NSNumber, v9, v8, v11);
    objc_msgSend_setValue_forChatProperty_(self, v13, (uint64_t)v12, @"IMChatWatermarkMessageID");

    if (v22)
    {
      uint64_t v14 = IMWatermarkMessageIDCache();
      objc_msgSend_removeObjectForKey_(v14, v15, (uint64_t)v22, v16);
    }
  }
  uint64_t v18 = objc_msgSend_watermarkDate(self, v9, v10, v11);
  if (v18)
  {
    objc_msgSend_setValue_forChatProperty_(self, v17, (uint64_t)v18, @"IMChatWatermarkDate");
    if (v22)
    {
      uint64_t v19 = sub_1A4B512D4();
      objc_msgSend_removeObjectForKey_(v19, v20, (uint64_t)v22, v21);
    }
  }
}

- (BOOL)shouldBeAllowListed
{
  if (objc_msgSend_chatStyle(self, a2, v2, v3) == 45)
  {
    uint64_t v8 = objc_msgSend_participants(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_count(v8, v9, v10, v11);

    if (v12 == 1)
    {
      uint64_t v13 = objc_msgSend_participants(self, v5, v6, v7);
      uint64_t v17 = objc_msgSend_firstObject(v13, v14, v15, v16);

      uint64_t v21 = objc_msgSend_normalizedID(v17, v18, v19, v20);
      if (IMStringIsEmail()
        && ((objc_msgSend_hasSuffix_(v21, v22, @"@apple.com", v23) & 1) != 0
         || objc_msgSend_hasSuffix_(v21, v24, @".apple.com", v25)))
      {

        return 1;
      }
    }
  }
  if (objc_msgSend_isAppleChat(self, v5, v6, v7)) {
    return 1;
  }

  return objc_msgSend_isMakoChat(self, v26, v27, v28);
}

- (BOOL)_hasJustSentAMessage
{
  id v4 = objc_msgSend_lastFinishedMessage(self, a2, v2, v3);
  uint64_t v8 = v4;
  BOOL v12 = v4 && objc_msgSend_isFromMe(v4, v5, v6, v7) && objc_msgSend_messageID(v8, v9, v10, v11) == 0;

  return v12;
}

- (int64_t)compareChatByDate:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_lastFinishedMessageDate(v4, v5, v6, v7);
  BOOL v12 = objc_msgSend_lastFinishedMessageDate(self, v9, v10, v11);
  int64_t v14 = objc_msgSend__compareChat_withDate_withDate_(self, v13, (uint64_t)v4, (uint64_t)v8, v12);

  return v14;
}

- (NSArray)participantDNDContactHandles
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend_participantsWithState_(self, a2, 16, v2);
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v22 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v5 = v3;
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v22, (uint64_t)v26, 16);
  if (v7)
  {
    uint64_t v11 = v7;
    uint64_t v12 = *(void *)v23;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v23 != v12) {
          objc_enumerationMutation(v5);
        }
        int64_t v14 = objc_msgSend_dndContactHandle(*(void **)(*((void *)&v22 + 1) + 8 * i), v8, v9, v10, (void)v22);
        objc_msgSend_addObject_(v4, v15, (uint64_t)v14, v16);
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v8, (uint64_t)&v22, (uint64_t)v26, 16);
    }
    while (v11);
  }

  uint64_t v20 = objc_msgSend_copy(v4, v17, v18, v19);

  return (NSArray *)v20;
}

+ (Class)_NPSManagerClass
{
  if (qword_1E965E848 != -1) {
    dispatch_once(&qword_1E965E848, &unk_1EF8E5F38);
  }
  uint64_t v2 = (void *)qword_1E965E840;

  return (Class)v2;
}

+ (void)cleanWatermarkCache
{
  uint64_t v2 = IMWatermarkMessageIDCache();
  objc_msgSend_removeAllObjects(v2, v3, v4, v5);

  sub_1A4B512D4();
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeAllObjects(v9, v6, v7, v8);
}

- (void)createIMChatItemForTransientAttachmentWithAssetUUID:(id)a3 parentChatItemGUID:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  objc_msgSend_sharedInstance(IMDaemonController, v8, v9, v10);
  id v16 = (id)objc_claimAutoreleasedReturnValue();
  int64_t v14 = objc_msgSend_guid(self, v11, v12, v13);
  objc_msgSend_createItemForPHAssetWithUUID_parentChatItemGUID_chatGUID_(v16, v15, (uint64_t)v7, (uint64_t)v6, v14);
}

- (IMBrand)brand
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v4 = objc_msgSend_participants(self, a2, v2, v3, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v14, (uint64_t)v18, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v4);
        }
        uint64_t v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend_isBusiness(v12, v6, v7, v8))
        {
          uint64_t v9 = objc_msgSend_brand(v12, v6, v7, v8);
          goto LABEL_11;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v14, (uint64_t)v18, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return (IMBrand *)v9;
}

- (BOOL)isReplyEnabled
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isTranscriptSharingEnabled = objc_msgSend_isTranscriptSharingEnabled(v5, v6, v7, v8);

  if (isTranscriptSharingEnabled && (objc_msgSend_isStewieSharingChat(self, v10, v11, v12) & 1) != 0
    || objc_msgSend_joinState(self, v10, v11, v12) == 4)
  {
    return 0;
  }
  if (objc_msgSend_isBusinessChat(self, v13, v14, v15)
    && objc_msgSend_isMakoChat(self, v17, v18, v19))
  {
    uint64_t v20 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], v17, 0, v19);
    long long v23 = objc_msgSend_objectForKey_(v20, v21, @"m-reply-enabled", v22);
    if (v23)
    {
      uint64_t v27 = v23;
      int v28 = objc_msgSend_BOOLValue(v23, v24, v25, v26);

      if (v28) {
        goto LABEL_9;
      }
    }
    else
    {
    }
    return 0;
  }
LABEL_9:
  if (!objc_msgSend_isBusinessChat(self, v17, v18, v19)) {
    return 1;
  }
  uint64_t v32 = (void *)MEMORY[0x1E4F6E730];

  return objc_msgSend_supportsBusinessChat(v32, v29, v30, v31);
}

- (IMHandle)businessHandle
{
  uint64_t v4 = objc_msgSend_participants(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_firstObject(v4, v5, v6, v7);

  if (objc_msgSend_isBusiness(v8, v9, v10, v11)) {
    uint64_t v12 = v8;
  }
  else {
    uint64_t v12 = 0;
  }
  uint64_t v13 = v12;

  return v13;
}

- (BOOL)containsActiveBIASession
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isBIAEnabled = objc_msgSend_isBIAEnabled(v5, v6, v7, v8);

  if (!isBIAEnabled) {
    return 0;
  }
  uint64_t v13 = objc_msgSend_allChatProperties(self, v10, v11, v12);
  long long v16 = objc_msgSend_objectForKeyedSubscript_(v13, v14, @"AMB-BIAContext", v15);
  uint64_t v20 = objc_msgSend_lastObject(v16, v17, v18, v19);

  long long v23 = objc_msgSend_valueForKey_(v20, v21, @"userId", v22);
  BOOL v27 = objc_msgSend_length(v23, v24, v25, v26) != 0;

  return v27;
}

- (BOOL)hasSentMessageToBusiness
{
  if (!objc_msgSend_isBusinessChat(self, a2, v2, v3)) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_lastSentMessage(self, v5, v6, v7);
  BOOL v9 = v8 != 0;

  return v9;
}

- (BOOL)isMapKitBusinessChat
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_chatStyle(self, a2, v2, v3) == 45)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    uint64_t v8 = objc_msgSend_participants(self, v5, v6, v7, 0);
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v17, (uint64_t)v21, 16);
    if (v13)
    {
      uint64_t v14 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v18 != v14) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend_isMapKitBusiness(*(void **)(*((void *)&v17 + 1) + 8 * i), v10, v11, v12))
          {
            LOBYTE(v13) = 1;
            goto LABEL_13;
          }
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v17, (uint64_t)v21, 16);
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_13:
  }
  else
  {
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (BOOL)hasVerifiedBusiness
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isBusinessChat(self, a2, v2, v3))
  {
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v8 = objc_msgSend_participants(self, v5, v6, v7, 0);
    uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v40, (uint64_t)v48, 16);
    if (v13)
    {
      uint64_t v14 = *(void *)v41;
      while (2)
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v41 != v14) {
            objc_enumerationMutation(v8);
          }
          long long v16 = *(void **)(*((void *)&v40 + 1) + 8 * i);
          long long v17 = objc_msgSend_brand(v16, v10, v11, v12);
          int isVerified = objc_msgSend_isVerified(v17, v18, v19, v20);

          if (isVerified)
          {
            if (IMOSLoggingEnabled())
            {
              BOOL v27 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
              {
                uint64_t v31 = objc_msgSend_displayID(v16, v28, v29, v30);
                *(_DWORD *)buf = 138412290;
                uint64_t v45 = (uint64_t)v31;
                _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "Handle:%@ is verified businesss", buf, 0xCu);
              }
            }
            LODWORD(v13) = 1;
            goto LABEL_21;
          }
        }
        uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v40, (uint64_t)v48, 16);
        if (v13) {
          continue;
        }
        break;
      }
    }
LABEL_21:

    if (IMOSLoggingEnabled())
    {
      uint64_t v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = objc_msgSend_guid(self, v33, v34, v35);
        uint64_t v37 = (void *)v36;
        uint64_t v38 = @"NO";
        if (v13) {
          uint64_t v38 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        uint64_t v45 = v36;
        __int16 v46 = 2112;
        uint64_t v47 = v38;
        _os_log_impl(&dword_1A4AF7000, v32, OS_LOG_TYPE_INFO, "Chat ID: %@ has verified business:%@", buf, 0x16u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = objc_msgSend_guid(self, v23, v24, v25);
        *(_DWORD *)buf = 138412290;
        uint64_t v45 = (uint64_t)v26;
        _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "Chat with guid:%@ is not business conversation. Return NO", buf, 0xCu);
      }
    }
    LOBYTE(v13) = 0;
  }
  return v13;
}

- (BOOL)isMakoChat
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = objc_msgSend_participants(self, a2, v2, v3, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend_isMako(*(void **)(*((void *)&v13 + 1) + 8 * i), v6, v7, v8))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v13, (uint64_t)v17, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (BOOL)isAppleChat
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  uint64_t v4 = objc_msgSend_participants(self, a2, v2, v3, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v13, (uint64_t)v17, 16);
  if (v9)
  {
    uint64_t v10 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v14 != v10) {
          objc_enumerationMutation(v4);
        }
        if (objc_msgSend_isApple(*(void **)(*((void *)&v13 + 1) + 8 * i), v6, v7, v8))
        {
          LOBYTE(v9) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v13, (uint64_t)v17, 16);
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v9;
}

- (void)closeSession
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      uint64_t v7 = self;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Messages for Business close session for chat: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  objc_msgSend__closeSession_(self, v3, 1, v4);
}

- (void)leaveConversation
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      uint64_t v7 = self;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Messages for Business leave conversation and close session for chat: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  objc_msgSend__closeSession_(self, v3, 0, v4);
}

- (void)_closeSession:(BOOL)a3
{
  BOOL v4 = a3;
  objc_msgSend_sharedRegistry(IMChatRegistry, a2, a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__chat_closeSession_didDeleteConversation_(v7, v6, (uint64_t)self, v4);
}

- (NSString)cachedBusinessName
{
  uint64_t v5 = objc_msgSend_brand(self, a2, v2, v3);

  if (v5)
  {
    uint64_t v9 = objc_msgSend_businessHandle(self, v6, v7, v8);
    long long v13 = objc_msgSend_normalizedID(v9, v10, v11, v12);

    long long v17 = objc_msgSend_sharedInstance(IMHandleRegistrar, v14, v15, v16);
    uint64_t v19 = objc_msgSend_businessNameForUID_blockFetch_updateHandler_(v17, v18, (uint64_t)v13, 1, 0);
  }
  else
  {
    uint64_t v19 = 0;
  }

  return (NSString *)v19;
}

- (void)sendUpdatedCollaborationMetadata:(id)a3 forMessageGUID:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = v7;
  if (v6 && objc_msgSend_length(v7, v8, v9, v10))
  {
    uint64_t v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412290;
      id v20 = v6;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Sending updated collaboration metadata: %@", (uint8_t *)&v19, 0xCu);
    }

    uint64_t v16 = objc_msgSend_sharedRegistry(IMChatRegistry, v13, v14, v15);
    objc_msgSend__chat_sendUpdatedCollaborationMetadata_forMessageGUID_(v16, v17, (uint64_t)self, (uint64_t)v6, v11);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = 138412546;
      id v20 = v6;
      __int16 v21 = 2112;
      uint64_t v22 = v11;
      _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Not sending collaboration metadata since either passed in collaboration metadata:%@ or messageGUID:%@ is nil.", (uint8_t *)&v19, 0x16u);
    }
  }
}

- (id)_existingMessageFromMessagePartGUID:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_messageGUID(v4, v5, v6, v7);
  uint64_t v20 = 0;
  __int16 v21 = &v20;
  uint64_t v22 = 0x3032000000;
  uint64_t v23 = sub_1A4B344BC;
  uint64_t v24 = sub_1A4B34344;
  id v25 = 0;
  uint64_t v12 = objc_msgSend__items(self, v9, v10, v11);
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1A4B92A30;
  v17[3] = &unk_1E5B7C7F8;
  id v13 = v8;
  id v18 = v13;
  int v19 = &v20;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v12, v14, 2, (uint64_t)v17);
  id v15 = (id)v21[5];

  _Block_object_dispose(&v20, 8);

  return v15;
}

- (void)_updateExistingMessageWithSyndicationAction:(id)a3
{
  v40[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_messagePartGUID(v4, v5, v6, v7);
  uint64_t v11 = objc_msgSend__existingMessageFromMessagePartGUID_(self, v9, (uint64_t)v8, v10);

  if (v11)
  {
    id v15 = objc_msgSend_message(v11, v12, v13, v14);
    id v16 = objc_alloc(MEMORY[0x1E4F6E880]);
    int v19 = objc_msgSend_initWithSyndicationAction_(v16, v17, (uint64_t)v4, v18);
    uint64_t v23 = objc_msgSend_syndicationRanges(v11, v20, v21, v22);
    char v39 = 0;
    uint64_t v24 = (void *)MEMORY[0x1E4F6E880];
    v40[0] = v19;
    uint64_t v26 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v25, (uint64_t)v40, 1);
    int v28 = objc_msgSend_updateMessagesRanges_withMessagePartSyndicationRanges_didUpdate_(v24, v27, (uint64_t)v23, (uint64_t)v26, &v39);

    if (v39)
    {
      objc_msgSend__syndicationRanges_(v15, v29, (uint64_t)v28, v30);
      uint64_t v34 = objc_msgSend__imMessageItem(v15, v31, v32, v33);
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_1A4B92CC0;
      v37[3] = &unk_1E5B7B130;
      v37[4] = self;
      id v38 = v34;
      id v35 = v34;
      objc_msgSend__updateChatItemsWithReason_block_(self, v36, @"send highlight", (uint64_t)v37);
    }
  }
}

- (void)sendSyndicationAction:(unsigned __int8)a3 forMessagePartGUID:(id)a4 syndicatedMessagePartRange:(_NSRange)a5
{
  NSUInteger length = a5.length;
  NSUInteger location = a5.location;
  uint64_t v7 = a3;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  uint64_t v9 = (objc_class *)MEMORY[0x1E4F6E888];
  id v10 = a4;
  id v11 = [v9 alloc];
  id v15 = objc_msgSend_guid(self, v12, v13, v14);
  int v19 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v16, v17, v18);
  started = objc_msgSend_initWithChatGUID_syndicationStartDate_syndicationActionType_encodedMessagePartGUID_messagePartRange_(v11, v20, (uint64_t)v15, (uint64_t)v19, v7, v10, location, length);

  if (started)
  {
    uint64_t v22 = IMLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v31 = 138412290;
      uint64_t v32 = started;
      _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "Sending syndication message: %@", (uint8_t *)&v31, 0xCu);
    }

    uint64_t v26 = objc_msgSend_sharedRegistry(IMChatRegistry, v23, v24, v25);
    objc_msgSend__chat_sendSyndicationAction_(v26, v27, (uint64_t)self, (uint64_t)started);

    objc_msgSend__updateExistingMessageWithSyndicationAction_(self, v28, (uint64_t)started, v29);
  }
  else
  {
    uint64_t v30 = IMLogHandleForCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB7A3C(v30);
    }
  }
}

- (void)sendAutoDonationUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = objc_alloc(MEMORY[0x1E4F6E678]);
  uint64_t v9 = objc_msgSend_guid(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v10, v11, v12);
  started = objc_msgSend_initWithChatGUID_syndicationStartDate_autoDonateMessages_(v5, v14, (uint64_t)v9, (uint64_t)v13, v3);

  if (started)
  {
    id v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      uint64_t v26 = started;
      _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Sending syndication message: %@", (uint8_t *)&v25, 0xCu);
    }

    uint64_t v20 = objc_msgSend_sharedRegistry(IMChatRegistry, v17, v18, v19);
    objc_msgSend__chat_sendSyndicationAction_(v20, v21, (uint64_t)self, (uint64_t)started);

    if (v3) {
      objc_msgSend_setAutoDonationBehavior_(self, v22, 1, v23);
    }
    else {
      objc_msgSend_setAutoDonationBehavior_(self, v22, 2, v23);
    }
  }
  else
  {
    uint64_t v24 = IMLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB7A3C(v24);
    }
  }
}

- (void)photoLibraryPersistedSyndicatedAssetSetDidChange
{
}

- (id)localizedUnreadShortcutTitle
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_participants(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_unreadMessageCount(self, v6, v7, v8);
  if (objc_msgSend_isGroupChat(self, v10, v11, v12))
  {
    id v16 = objc_msgSend_displayName(self, v13, v14, v15);
  }
  else
  {
    id v16 = 0;
  }
  id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v18 = v5;
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v20)
  {
    uint64_t v23 = v20;
    uint64_t v24 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v33 != v24) {
          objc_enumerationMutation(v18);
        }
        uint64_t v26 = objc_msgSend_displayNameForChat_(*(void **)(*((void *)&v32 + 1) + 8 * i), v21, (uint64_t)self, v22, (void)v32);
        objc_msgSend_addObject_(v17, v27, (uint64_t)v26, v28);
      }
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v32, (uint64_t)v36, 16);
    }
    while (v23);
  }

  uint64_t v30 = objc_msgSend_unreadSummaryWithUnreadCount_withParticipants_withGroupChatName_(MEMORY[0x1E4F6E998], v29, v9, (uint64_t)v17, v16);

  return v30;
}

- (IMChatItemRules)chatItemRules
{
  chatItemRules = self->_chatItemRules;
  if (!chatItemRules)
  {
    id v4 = IMLogHandleForCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_FAULT)) {
      sub_1A4CB8958();
    }

    uint64_t v6 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v5, *MEMORY[0x1E4F6C158], 43, MEMORY[0x1E4F1CC08]);
    id v10 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E890], v7, v8, v9);
    objc_msgSend_autoBugCaptureWithSubType_errorPayload_(v10, v11, @"chatItemRules", (uint64_t)v6);

    chatItemRules = self->_chatItemRules;
  }

  return chatItemRules;
}

- (IMChatScrutinyController)chatScrutinyController
{
  return (IMChatScrutinyController *)objc_msgSend_sharedController(IMChatScrutinyController, a2, v2, v3);
}

- (void)_setupObservation
{
  if (!self->_hasBeenConfigured)
  {
    self->_hasBeenConfigured = 1;
    id v5 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
    objc_msgSend_addObserver_selector_name_object_(v5, v6, (uint64_t)self, (uint64_t)sel__accountLoggedOut_, @"__kIMAccountLoggedOutNotification", 0);

    id v10 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v7, v8, v9);
    objc_msgSend_addObserver_selector_name_object_(v10, v11, (uint64_t)self, (uint64_t)sel__daemonDied_, @"__kIMDaemonDidDisconnectNotification", 0);

    uint64_t v15 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v12, v13, v14);
    objc_msgSend_addObserver_selector_name_object_(v15, v16, (uint64_t)self, (uint64_t)sel__daemonAlive_, @"__kIMDaemonDidConnectNotification", 0);

    uint64_t v20 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v17, v18, v19);
    objc_msgSend_addObserver_selector_name_object_(v20, v21, (uint64_t)self, (uint64_t)sel__accountControllerUpdated_, @"__kIMAccountControllerUpdatedNotification", 0);

    int v25 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v22, v23, v24);
    objc_msgSend_addObserver_selector_name_object_(v25, v26, (uint64_t)self, (uint64_t)sel__accountControllerUpdated_, @"__kIMAccountActivatedNotification", 0);

    objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v27, v28, v29);
    id v31 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_addObserver_selector_name_object_(v31, v30, (uint64_t)self, (uint64_t)sel__accountControllerUpdated_, @"__kIMAccountDeactivatedNotification", 0);
  }
}

+ (id)pendingChatForHandle:(id)a3
{
  id v3 = a3;
  id v4 = [IMChat alloc];
  uint64_t v8 = objc_msgSend_account(v3, v5, v6, v7);
  uint64_t v9 = IMSingleObjectArray();

  BYTE2(v13) = 0;
  LOWORD(v13) = 0;
  uint64_t isDeletingIncomingMessages = objc_msgSend__initWithGUID_account_style_roomName_displayName_lastAddressedHandle_lastAddressedSIMID_items_participants_isFiltered_hasHadSuccessfulQuery_isRecovered_isDeletingIncomingMessages_(v4, v10, 0, (uint64_t)v8, 45, 0, 0, 0, 0, 0, v9, 1, v13);

  return isDeletingIncomingMessages;
}

+ (void)_initializeFindMyController
{
  id v4 = (id)objc_msgSend_sharedInstance(IMFMFSession, a2, v2, v3);
}

- (IMChat)init
{
  BYTE2(v3) = 0;
  LOWORD(v3) = 0;
  return (IMChat *)objc_msgSend__initWithGUID_account_style_roomName_displayName_lastAddressedHandle_lastAddressedSIMID_items_participants_isFiltered_hasHadSuccessfulQuery_isRecovered_isDeletingIncomingMessages_(self, a2, 0, 0, 45, 0, 0, 0, 0, 0, 0, 1, v3);
}

- (id)chatItemUpdaterLogHandle
{
  uint64_t v2 = objc_opt_class();

  return (id)objc_msgSend_chatItemUpdaterLogHandle(v2, v3, v4, v5);
}

+ (Class)chatItemRulesClass
{
  uint64_t v2 = (void *)qword_1E965E760;
  if (!qword_1E965E760) {
    uint64_t v2 = objc_opt_class();
  }

  return (Class)v2;
}

- (void)dealloc
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      long long v35 = self;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Dealloc: %@", buf, 0xCu);
    }
  }
  uint64_t v7 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v3, v4, v5);
  objc_msgSend_removeObserver_name_object_(v7, v8, (uint64_t)self, 0, 0);

  uint64_t v12 = objc_msgSend_chatRegistry(self, v9, v10, v11);
  objc_msgSend__noteChatDealloc_(v12, v13, (uint64_t)self, v14);

  objc_msgSend_setDelegate_(self->_sendProgress, v15, 0, v16);
  objc_msgSend_setContext_(self->_sendProgress, v17, 0, v18);
  objc_msgSend_invalidate(self->_sendProgress, v19, v20, v21);
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_(MEMORY[0x1E4FBA8A8], v22, (uint64_t)self, v23);
  objc_msgSend_invalidate(self->_downgradeStateUpdater, v24, v25, v26);
  uint64_t v30 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v27, v28, v29);
  objc_msgSend_removeObserver_(v30, v31, (uint64_t)self, v32);

  v33.receiver = self;
  v33.super_class = (Class)IMChat;
  [(IMItemsController *)&v33 dealloc];
}

- (id)_initWithItems:(id)a3
{
  BYTE2(v4) = 0;
  LOWORD(v4) = 0;
  return (id)objc_msgSend__initWithGUID_account_style_roomName_displayName_lastAddressedHandle_lastAddressedSIMID_items_participants_isFiltered_hasHadSuccessfulQuery_isRecovered_isDeletingIncomingMessages_(self, a2, 0, 0, 45, 0, 0, 0, 0, a3, 0, 1, v4);
}

- (void)_itemsDidChange:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_chatRegistry(self, v5, v6, v7);
  char isFirstLoad = objc_msgSend_isFirstLoad(v8, v9, v10, v11);

  if ((isFirstLoad & 1) == 0)
  {
    v16.receiver = self;
    v16.super_class = (Class)IMChat;
    [(IMItemsController *)&v16 _itemsDidChange:v4];
    objc_msgSend_setNeedsDeferredUpdateWithReason_(self->_chatItemsUpdater, v13, @"IMItemsChanged", v14);
    objc_msgSend_updateForItems_forced_(self->_sendProgress, v15, (uint64_t)v4, 0);
  }
}

- (void)_handleItem:(id)a3
{
  id v9 = a3;
  uint64_t v7 = objc_msgSend_chatStyle(self, v4, v5, v6);
  objc_msgSend__handleItem_forChatStyle_keepExistingIndex_(self, v8, (uint64_t)v9, v7, 0);
}

- (void)_handleItem:(id)a3 keepExistingIndex:(BOOL)a4
{
  BOOL v4 = a4;
  id v11 = a3;
  uint64_t v9 = objc_msgSend_chatStyle(self, v6, v7, v8);
  objc_msgSend__handleItem_forChatStyle_keepExistingIndex_(self, v10, (uint64_t)v11, v9, v4);
}

- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4
{
}

- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4 keepExistingIndex:(BOOL)a5
{
}

- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4 updateReplyCounts:(BOOL)a5
{
}

- (void)_handleItem:(id)a3 forChatStyle:(unsigned __int8)a4 updateReplyCounts:(BOOL)a5 keepExistingIndex:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v8 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = objc_msgSend_guid(self, v12, v13, v14);
      objc_super v16 = @"NO";
      *(_DWORD *)buf = 138412802;
      uint64_t v27 = v15;
      __int16 v28 = 2112;
      if (v7) {
        objc_super v16 = @"YES";
      }
      uint64_t v29 = v16;
      __int16 v30 = 2112;
      id v31 = v10;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Handle item for chat (%@) updateReplyCounts (%@) item:(%@)", buf, 0x20u);
    }
  }
  v25.receiver = self;
  v25.super_class = (Class)IMChat;
  [(IMItemsController *)&v25 _handleItem:v10 forChatStyle:v8 keepExistingIndex:v6];
  uint64_t v20 = objc_msgSend_inlineReplyController(self, v17, v18, v19);
  objc_msgSend_insertItem_(v20, v21, (uint64_t)v10, v22);

  if (v7) {
    objc_msgSend__updateRepliesIfNecessaryWithItem_(self, v23, (uint64_t)v10, v24);
  }
}

- (void)_removeItem:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)IMChat;
  id v4 = a3;
  [(IMItemsController *)&v11 _removeItem:v4];
  uint64_t v8 = objc_msgSend_inlineReplyController(self, v5, v6, v7, v11.receiver, v11.super_class);
  objc_msgSend_removeItem_(v8, v9, (uint64_t)v4, v10);
}

- (void)_replaceItems:(id)a3
{
  v11.receiver = self;
  v11.super_class = (Class)IMChat;
  id v4 = a3;
  [(IMItemsController *)&v11 _replaceItems:v4];
  uint64_t v8 = objc_msgSend_inlineReplyController(self, v5, v6, v7, v11.receiver, v11.super_class);
  objc_msgSend_replaceItems_(v8, v9, (uint64_t)v4, v10);
}

- (void)_removeItemsForGuids:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    id v44 = v4;
    uint64_t v10 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v8, (uint64_t)v4, v9);
    objc_super v11 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v15 = objc_msgSend_count(v10, v12, v13, v14);
    uint64_t v18 = objc_msgSend_arrayWithCapacity_(v11, v16, v15, v17);
    long long v49 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    uint64_t v22 = objc_msgSend__items(self, v19, v20, v21);
    uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v23, (uint64_t)&v49, (uint64_t)v54, 16);
    if (v24)
    {
      uint64_t v28 = v24;
      uint64_t v29 = *(void *)v50;
      do
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v50 != v29) {
            objc_enumerationMutation(v22);
          }
          id v31 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          uint64_t v32 = objc_msgSend_guid(v31, v25, v26, v27);
          int v35 = objc_msgSend_containsObject_(v10, v33, (uint64_t)v32, v34);

          if (v35) {
            objc_msgSend_addObject_(v18, v25, (uint64_t)v31, v27);
          }
        }
        uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v22, v25, (uint64_t)&v49, (uint64_t)v54, 16);
      }
      while (v28);
    }

    long long v47 = 0u;
    long long v48 = 0u;
    long long v45 = 0u;
    long long v46 = 0u;
    id v36 = v18;
    uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v37, (uint64_t)&v45, (uint64_t)v53, 16);
    if (v38)
    {
      uint64_t v41 = v38;
      uint64_t v42 = *(void *)v46;
      do
      {
        for (uint64_t j = 0; j != v41; ++j)
        {
          if (*(void *)v46 != v42) {
            objc_enumerationMutation(v36);
          }
          objc_msgSend__removeItem_(self, v39, *(void *)(*((void *)&v45 + 1) + 8 * j), v40);
        }
        uint64_t v41 = objc_msgSend_countByEnumeratingWithState_objects_count_(v36, v39, (uint64_t)&v45, (uint64_t)v53, 16);
      }
      while (v41);
    }

    id v4 = v44;
  }
}

- (void)_clearUnreadCount
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  unint64_t dbUnreadCount = self->_dbUnreadCount;
  int v4 = IMOSLoggingEnabled();
  if (dbUnreadCount)
  {
    if (v4)
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        unint64_t v6 = self->_dbUnreadCount;
        int v23 = 138412802;
        *(void *)uint64_t v24 = self;
        *(_WORD *)&v24[8] = 1024;
        *(_DWORD *)&v24[10] = v6;
        __int16 v25 = 1024;
        int v26 = 0;
        _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Clearing [DB] unread count for %@ from %d to %d", (uint8_t *)&v23, 0x18u);
      }
    }
    self->_unint64_t dbUnreadCount = 0;
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v23 = 67109378;
        *(_DWORD *)uint64_t v24 = 0;
        *(_WORD *)&v24[4] = 2112;
        *(void *)&v24[6] = self;
        _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "   Posting new unread count of %u for %@", (uint8_t *)&v23, 0x12u);
      }
    }
    objc_super v11 = NSNumber;
    uint64_t v12 = objc_msgSend_unreadMessageCount(self, v7, v8, v9, @"__kIMChatUnreadKey");
    uint64_t v15 = objc_msgSend_numberWithUnsignedInteger_(v11, v13, v12, v14);
    uint64_t v22 = v15;
    uint64_t v17 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v16, (uint64_t)&v22, (uint64_t)&v21, 1);
    objc_msgSend__postNotification_userInfo_(self, v18, @"__kIMChatUnreadCountChangedNotification", (uint64_t)v17);
  }
  else if (v4)
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      unint64_t v20 = self->_dbUnreadCount;
      int v23 = 138412546;
      *(void *)uint64_t v24 = self;
      *(_WORD *)&v24[8] = 1024;
      *(_DWORD *)&v24[10] = v20;
      _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Unread count [DB] for %@ stayed at: %d", (uint8_t *)&v23, 0x12u);
    }
  }
}

- (void)_setDBUnreadCount:(unint64_t)a3
{
}

- (void)_setDBFailedCount:(unint64_t)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  if (self->_dbFailedCount != a3)
  {
    self->_unint64_t dbFailedCount = a3;
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        unint64_t dbFailedCount = self->_dbFailedCount;
        v10[0] = 67109634;
        v10[1] = dbFailedCount;
        __int16 v11 = 1024;
        int v12 = objc_msgSend_messageFailureCount(self, v6, v7, v8);
        __int16 v13 = 2112;
        uint64_t v14 = self;
        _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "_dbFailedCount changed to %d: Posting new failed count of %d for %@", (uint8_t *)v10, 0x18u);
      }
    }
    objc_msgSend__postNotification_userInfo_(self, v4, @"__kIMChatMessageFailureCountChangedNotification", 0);
  }
}

- (void)_reloadChatItemsForServiceChange
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v5, v6, v7, v8);

  if (isCarrierPigeonEnabled)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = objc_msgSend_account(self, v12, v13, v14);
        uint64_t v19 = objc_msgSend_service(v15, v16, v17, v18);
        int v23 = objc_msgSend_internalName(v19, v20, v21, v22);
        uint64_t v27 = objc_msgSend_guid(self, v24, v25, v26);
        int v28 = 138412546;
        uint64_t v29 = v23;
        __int16 v30 = 2112;
        id v31 = v27;
        _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Service for sending changed to %@, updating chat items for chat: %@", (uint8_t *)&v28, 0x16u);
      }
    }
    objc_msgSend__updateChatItemsWithReason_block_(self, v10, @"(IMChat) Service for sending changed", (uint64_t)&unk_1EF8E6408);
  }
}

- (void)_insertHistoricalMessages:(id)a3 queryID:(id)a4 isRefresh:(BOOL)a5 isHistoryQuery:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  id v10 = a4;
  id v16 = a3;
  uint64_t v14 = objc_msgSend_numberOfMessagesToKeepLoaded(self, v11, v12, v13);
  objc_msgSend__insertHistoricalMessages_queryID_isRefresh_isHistoryQuery_limit_(self, v15, (uint64_t)v16, (uint64_t)v10, v7, v6, v14);
}

- (void)_insertHistoricalMessages:(id)a3 queryID:(id)a4 isRefresh:(BOOL)a5 isHistoryQuery:(BOOL)a6 limit:(unint64_t)a7
{
  __int16 v7 = 0;
  objc_msgSend__insertHistoricalMessages_queryID_isRefresh_isHistoryQuery_isReplacingItems_limit_hasMessagesBefore_hasMessagesAfter_(self, a2, (uint64_t)a3, (uint64_t)a4, a5, a6, 1, a7, v7);
}

- (void)_insertHistoricalMessages:(id)a3 queryID:(id)a4 isRefresh:(BOOL)a5 isHistoryQuery:(BOOL)a6 isReplacingItems:(BOOL)a7 limit:(unint64_t)a8 hasMessagesBefore:(BOOL)a9 hasMessagesAfter:(BOOL)a10
{
  BOOL v11 = a7;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  uint64_t v19 = objc_msgSend__items(self, v16, v17, v18);
  objc_msgSend_im_logGUIDsForReason_(v19, v20, @"WillInsertHistoricalMessages", v21);

  if ((objc_msgSend_containsString_(v15, v22, @"InlineReplyHistoryLoading", v23) & 1) != 0
    || objc_msgSend_containsString_(v15, v24, @"PagedInlineReplyHistoryLoading", v25))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        objc_super v33 = objc_msgSend_inlineReplyController(self, v30, v31, v32);
        *(_DWORD *)buf = 138412290;
        long long v46 = v33;
        _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "Passing inline reply history request to %@", buf, 0xCu);
      }
    }
    uint64_t v34 = objc_msgSend_inlineReplyController(self, v26, v27, v28);
    objc_msgSend_insertHistoricalMessages_queryID_hasMessagesBefore_hasMessagesAfter_isReplacingItems_(v34, v35, (uint64_t)v14, (uint64_t)v15, a9, a10, v11);
  }
  else
  {
    self->_hasEarlierMessagesToLoad = a9;
    self->_hasMoreRecentMessagesToLoad = a10;
    v37[0] = MEMORY[0x1E4F143A8];
    v37[1] = 3221225472;
    v37[2] = sub_1A4BD0BE8;
    v37[3] = &unk_1E5B7D508;
    id v38 = v15;
    uint64_t v40 = self;
    unint64_t v41 = a8;
    BOOL v42 = a9;
    BOOL v43 = a10;
    id v39 = v14;
    BOOL v44 = v11;
    objc_msgSend__updateChatItemsWithReason_block_(self, v36, @"(IMChat) History query", (uint64_t)v37);

    uint64_t v34 = v38;
  }
}

- (id)_archivedItemsToReplace:(id)a3 isReplacingItems:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v17[0] = 67109120;
      v17[1] = objc_msgSend_count(v6, v11, v12, v13);
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "_archivedItemsToReplace archivedItemsCount: %d", (uint8_t *)v17, 8u);
    }
  }
  if (v4)
  {
    objc_msgSend__removeAllItems(self, v7, v8, v9);
    id v14 = v6;
  }
  else
  {
    objc_msgSend__appendArchivedItemsToItemsArray_(self, v7, (uint64_t)v6, v9);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
  }
  id v15 = v14;

  return v15;
}

- (id)messageForGUID:(id)a3
{
  BOOL v4 = objc_msgSend__itemForGUID_(self, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_message(v4, v5, v6, v7);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = objc_msgSend_replyCountsByPart(v4, v9, v10, v11);
    objc_msgSend_setReplyCountsByPart_(v8, v13, (uint64_t)v12, v14);
  }

  return v8;
}

- (IMMessage)firstMessage
{
  BOOL v4 = objc_msgSend__firstMessage(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_message(v4, v5, v6, v7);

  return (IMMessage *)v8;
}

- (IMMessage)lastIncomingMessage
{
  BOOL v4 = objc_msgSend__lastIncomingMessage(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_message(v4, v5, v6, v7);

  return (IMMessage *)v8;
}

- (IMMessage)lastIncomingFinishedMessageWithTextContent
{
  BOOL v4 = objc_msgSend__lastIncomingFinishedMessageItemWithTextContent(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_message(v4, v5, v6, v7);

  return (IMMessage *)v8;
}

- (id)_lastChatItemMatchingCriteria:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  BOOL v4 = (uint64_t (**)(id, void *))a3;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v8 = objc_msgSend_chatItems(self, v5, v6, v7, 0);
  uint64_t v12 = objc_msgSend_reverseObjectEnumerator(v8, v9, v10, v11);

  id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v20, (uint64_t)v24, 16);
  if (v14)
  {
    uint64_t v15 = *(void *)v21;
    while (2)
    {
      for (uint64_t i = 0; i != v14; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v12);
        }
        uint64_t v17 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if (v4[2](v4, v17))
        {
          id v14 = v17;
          goto LABEL_11;
        }
      }
      id v14 = (id)objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v18, (uint64_t)&v20, (uint64_t)v24, 16);
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v14;
}

- (IMChatItem)lastDeletableChatItem
{
  return (IMChatItem *)((uint64_t (*)(IMChat *, char *, void *))MEMORY[0x1F4181798])(self, sel__lastChatItemMatchingCriteria_, &unk_1EF8E6448);
}

- (id)lastIncomingReplyableChatItem
{
  return (id)((uint64_t (*)(IMChat *, char *, void *))MEMORY[0x1F4181798])(self, sel__lastChatItemMatchingCriteria_, &unk_1EF8E6468);
}

- (IMMessage)lastIncomingReplyableMessage
{
  BOOL v4 = objc_msgSend_lastIncomingReplyableChatItem(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend__item(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_message(v8, v9, v10, v11);

  return (IMMessage *)v12;
}

- (IMMessagePartChatItem)lastTapbackableChatItemNotFromMe
{
  return (IMMessagePartChatItem *)((uint64_t (*)(IMChat *, char *, void *))MEMORY[0x1F4181798])(self, sel__lastChatItemMatchingCriteria_, &unk_1EF8E6488);
}

- (id)lastRelatedIncomingFinishedMessageTextContentWithLimit:(int64_t)a3
{
  return (id)((uint64_t (*)(IMChat *, char *, int64_t))MEMORY[0x1F4181798])(self, sel__lastRelatedIncomingFinishedMessageTextContentWithLimit_, a3);
}

- (BOOL)isLastIncomingFinishedMessageNotiMessage
{
  BOOL v4 = objc_msgSend_lastIncomingFinishedMessageItem(self, a2, v2, v3);
  uint64_t v8 = v4;
  if (v4)
  {
    uint64_t v9 = objc_msgSend_service(v4, v5, v6, v7);
    uint64_t v13 = objc_msgSend_iMessageService(IMService, v10, v11, v12);
    uint64_t v17 = objc_msgSend_internalName(v13, v14, v15, v16);

    int v20 = objc_msgSend_isEqualToString_(v9, v18, (uint64_t)v17, v19) ^ 1;
  }
  else
  {
    LOBYTE(v20) = 0;
  }

  return v20;
}

- (BOOL)lastMessageExists
{
  BOOL v4 = objc_msgSend__lastMessage(self, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (void)setLastTUConversationCreatedDate:(id)a3
{
}

- (void)setLastScheduledMessageCreatedDate:(id)a3
{
}

- (IMMessage)lastSentMessage
{
  BOOL v4 = objc_msgSend__lastSentMessage(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_message(v4, v5, v6, v7);

  return (IMMessage *)v8;
}

- (NSDate)lastSentMessageDate
{
  BOOL v4 = objc_msgSend__lastSentMessage(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_time(v4, v5, v6, v7);

  return (NSDate *)v8;
}

- (int64_t)lastFinishedMessageID
{
  BOOL v4 = objc_msgSend__lastFinishedMessage(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_messageID(v4, v5, v6, v7);

  return v8;
}

- (IMMessage)lastPendingSatelliteSendMessage
{
  BOOL v4 = objc_msgSend__lastPendingSatelliteSendMessage(self, a2, v2, v3);
  int64_t v8 = objc_msgSend_message(v4, v5, v6, v7);

  return (IMMessage *)v8;
}

- (id)messageGuidsForMyUnreadMentions
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  BOOL v5 = objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, v2, v3);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v9 = objc_msgSend__items(self, v6, v7, v8, 0);
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v34, (uint64_t)v38, 16);
  if (v11)
  {
    uint64_t v15 = v11;
    uint64_t v16 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v35 != v16) {
          objc_enumerationMutation(v9);
        }
        uint64_t v18 = *(void **)(*((void *)&v34 + 1) + 8 * i);
        long long v22 = objc_msgSend_message(v18, v12, v13, v14);
        if (v22 && objc_msgSend_hasUnseenMention(v18, v19, v20, v21))
        {
          uint64_t v26 = objc_msgSend_guid(v22, v23, v24, v25);
          objc_msgSend_addObject_(v5, v27, (uint64_t)v26, v28);
        }
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v12, (uint64_t)&v34, (uint64_t)v38, 16);
    }
    while (v15);
  }

  uint64_t v32 = objc_msgSend_copy(v5, v29, v30, v31);

  return v32;
}

- (void)removeMentionMessageGUID:(id)a3
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend__items(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_copy(v8, v9, v10, v11);

  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v13 = v12;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v48, (uint64_t)v52, 16);
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v49;
    do
    {
      uint64_t v18 = 0;
      do
      {
        if (*(void *)v49 != v17) {
          objc_enumerationMutation(v13);
        }
        id v19 = *(id *)(*((void *)&v48 + 1) + 8 * v18);
        long long v23 = objc_msgSend_message(v19, v20, v21, v22, (void)v48);
        uint64_t v27 = objc_msgSend_guid(v23, v24, v25, v26);
        if (objc_msgSend_isEqualToString_(v27, v28, (uint64_t)v4, v29))
        {
          int hasUnseenMention = objc_msgSend_hasUnseenMention(v19, v30, v31, v32);

          if (!hasUnseenMention) {
            goto LABEL_10;
          }
          uint64_t v27 = objc_msgSend__copy(v19, v34, v35, v36);
          objc_msgSend_setHasUnseenMention_(v27, v37, 0, v38);
          BOOL v42 = objc_msgSend_daemonController(self, v39, v40, v41);
          objc_msgSend_updateMessage_(v42, v43, (uint64_t)v27, v44);

          objc_msgSend__handleItem_(self, v45, (uint64_t)v27, v46);
        }

LABEL_10:
        ++v18;
      }
      while (v16 != v18);
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v47, (uint64_t)&v48, (uint64_t)v52, 16);
    }
    while (v16);
  }
}

- (unint64_t)messageFailureCount
{
  int64_t dbFailedCount = self->_dbFailedCount;
  if ((dbFailedCount | 0x8000000000000000) == 0xFFFFFFFFFFFFFFFFLL) {
    return 0;
  }
  else {
    return dbFailedCount & ~(dbFailedCount >> 63);
  }
}

- (BOOL)deleteAllHistory
{
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A4BD1D74;
  v8[3] = &unk_1E5B7D550;
  v8[4] = self;
  id v3 = (id)objc_msgSend__performQueryWithKey_loadImmediately_block_(self, a2, @"DeleteHistory", 0, v8);
  objc_msgSend_clear(self, v4, v5, v6);
  return 1;
}

- (unint64_t)markAsSpam:(unint64_t)a3
{
  return MEMORY[0x1F4181798](self, sel_markAsSpam_isJunkReportedToCarrier_, a3, 0);
}

- (unint64_t)markAsSpam:(unint64_t)a3 isJunkReportedToCarrier:(BOOL)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  v34[2] = sub_1A4BD1FC0;
  v34[3] = &unk_1E5B7C460;
  v34[4] = self;
  BOOL v35 = a4;
  id v6 = (id)objc_msgSend__performQueryWithKey_loadImmediately_block_(self, a2, @"MarkAsSpam", 1, v34);
  uint64_t v7 = self->_countOfMessagesMarkedAsSpam;
  objc_msgSend__setCountOfMessagesMarkedAsSpam_(self, v8, 0, v9);
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      uint64_t v16 = objc_msgSend_integerValue(v7, v13, v14, v15);
      *(_DWORD *)buf = 134217984;
      uint64_t v37 = v16;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Marked %ld messages as spam", buf, 0xCu);
    }
  }
  uint64_t v17 = objc_msgSend_valueForChatProperty_(self, v10, @"restoredFromBlackhole", v11);
  int v21 = objc_msgSend_BOOLValue(v17, v18, v19, v20);

  uint64_t v25 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E890], v22, v23, v24);
  uint64_t v28 = v25;
  if (v21) {
    objc_msgSend_trackSpamEvent_(v25, v26, 32, v27);
  }
  else {
    objc_msgSend_trackSpamEvent_(v25, v26, a3, v27);
  }

  unint64_t v32 = objc_msgSend_integerValue(v7, v29, v30, v31);
  return v32;
}

- (void)markAsAutoSpamReported
{
}

- (void)autoReportSpam
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_valueForChatProperty_(self, a2, @"hasBeenAutoSpamReported", v2);

  if (!v4)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = objc_msgSend_chatIdentifier(self, v9, v10, v11);
        int v19 = 138412290;
        uint64_t v20 = v12;
        _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "autoReportSpam on self %@", (uint8_t *)&v19, 0xCu);
      }
    }
    id v13 = objc_msgSend_chatRegistry(self, v5, v6, v7);
    objc_msgSend__chat_markAsSpamAutomatically_(v13, v14, (uint64_t)self, v15);

    objc_msgSend_markAsAutoSpamReported(self, v16, v17, v18);
  }
}

- (void)reportJunkToCarrier
{
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = objc_msgSend__messageToReportJunk(self, a2, v2, v3);
  if (!v8)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_16;
    }
    uint64_t v60 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      uint64_t v64 = objc_msgSend_chatItems(self, v61, v62, v63);
      int v65 = 138412290;
      uint64_t v66 = v64;
      _os_log_impl(&dword_1A4AF7000, v60, OS_LOG_TYPE_INFO, "No chat item of type IMMessageItem found while reporting junk. Chat Items -> %@", (uint8_t *)&v65, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  uint64_t v9 = objc_msgSend_chatStyle(self, v5, v6, v7);
  uint64_t v13 = objc_msgSend_messageCount(self, v10, v11, v12);
  objc_msgSend_collectReportJunkMetricsForJunkMessageItem_junkChatStyle_totalMessagesInThread_(IMCarrierReportJunkHelper, v14, (uint64_t)v8, v9, v13);
  if ((objc_msgSend_canReportJunkOverCellularServiceOfMessageItem_(IMCarrierReportJunkHelper, v15, (uint64_t)v8, v16) & 1) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_16;
    }
    uint64_t v60 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
    {
      LOWORD(v65) = 0;
      _os_log_impl(&dword_1A4AF7000, v60, OS_LOG_TYPE_INFO, "Cellular service not at home service. Cannot report junk", (uint8_t *)&v65, 2u);
    }
    goto LABEL_15;
  }
  uint64_t v20 = objc_msgSend_sharedInstance(IMAccountController, v17, v18, v19);
  uint64_t v24 = objc_msgSend_smsService(IMServiceImpl, v21, v22, v23);
  uint64_t v27 = objc_msgSend_activeAccountsForService_(v20, v25, (uint64_t)v24, v26);
  uint64_t v31 = objc_msgSend_firstObject(v27, v28, v29, v30);

  uint64_t v35 = objc_msgSend_chatStyle(self, v32, v33, v34);
  uint64_t v39 = objc_msgSend_account(self, v36, v37, v38);
  BOOL v43 = objc_msgSend_service(v39, v40, v41, v42);
  uint64_t v47 = objc_msgSend_internalName(v43, v44, v45, v46);
  long long v49 = objc_msgSend_junkReportMessageItemForMessageItem_account_junkChatStyle_serviceName_(IMCarrierReportJunkHelper, v48, (uint64_t)v8, (uint64_t)v31, v35, v47);

  if (IMOSLoggingEnabled())
  {
    uint64_t v53 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      int v65 = 138412290;
      uint64_t v66 = v49;
      _os_log_impl(&dword_1A4AF7000, v53, OS_LOG_TYPE_INFO, "sending junk report item: %@", (uint8_t *)&v65, 0xCu);
    }
  }
  uint64_t v54 = objc_msgSend_sharedInstance(IMDaemonController, v50, v51, v52);
  uint64_t v58 = objc_msgSend_uniqueID(v31, v55, v56, v57);
  objc_msgSend_sendJunkReportMessage_account_(v54, v59, (uint64_t)v49, (uint64_t)v58);

LABEL_16:
}

- (void)reportLazuliSpam:(unint64_t)a3 isBot:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  uint64_t v7 = objc_msgSend__messageToReportJunk(self, a2, a3, a4);
  uint64_t v11 = objc_msgSend_service(v7, v8, v9, v10);
  char isEqualToString = objc_msgSend_isEqualToString_(v11, v12, *MEMORY[0x1E4F6E198], v13);

  if (isEqualToString)
  {
    if (v7)
    {
      uint64_t v18 = objc_msgSend_sharedInstance(IMAccountController, v15, v16, v17);
      uint64_t v22 = objc_msgSend_rcsService(IMServiceImpl, v19, v20, v21);
      uint64_t v25 = objc_msgSend_activeAccountsForService_(v18, v23, (uint64_t)v22, v24);
      uint64_t v29 = objc_msgSend_firstObject(v25, v26, v27, v28);

      if (v4)
      {
        uint64_t v33 = objc_msgSend_messageCount(self, v30, v31, v32);
        objc_msgSend_collectReportJunkMetricsForChatbotJunkMessageItem_totalMessagesInThread_(IMCarrierReportJunkHelper, v34, (uint64_t)v7, v33);
      }
      else
      {
        uint64_t v40 = objc_msgSend_chatStyle(self, v30, v31, v32);
        uint64_t v44 = objc_msgSend_messageCount(self, v41, v42, v43);
        objc_msgSend_collectReportJunkMetricsForJunkMessageItem_junkChatStyle_totalMessagesInThread_(IMCarrierReportJunkHelper, v45, (uint64_t)v7, v40, v44);
      }
      int v46 = IMOSLoggingEnabled();
      if (v29)
      {
        if (v46)
        {
          long long v50 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            int v62 = 67109120;
            LODWORD(v63) = v4;
            _os_log_impl(&dword_1A4AF7000, v50, OS_LOG_TYPE_INFO, "Found RCS account, reporting spam, isBot: %d", (uint8_t *)&v62, 8u);
          }
        }
        uint64_t v51 = objc_msgSend_sharedInstance(IMDaemonController, v47, v48, v49);
        uint64_t v55 = objc_msgSend_uniqueID(v29, v52, v53, v54);
        objc_msgSend_sendLazuliSpamReport_isBot_spamType_account_(v51, v56, (uint64_t)v7, v4, a3, v55);
      }
      else if (v46)
      {
        uint64_t v57 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          uint64_t v61 = objc_msgSend_chatItems(self, v58, v59, v60);
          int v62 = 138412290;
          uint64_t v63 = v61;
          _os_log_impl(&dword_1A4AF7000, v57, OS_LOG_TYPE_INFO, "No RCS Account found while reporting spam. Chat Items -> %@", (uint8_t *)&v62, 0xCu);
        }
      }
LABEL_23:

      goto LABEL_24;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        uint64_t v39 = objc_msgSend_chatItems(self, v36, v37, v38);
        int v62 = 138412290;
        uint64_t v63 = v39;
        _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, "No chat item of type IMMessageItem found while reporting spam. Chat Items -> %@", (uint8_t *)&v62, 0xCu);
      }
      goto LABEL_23;
    }
  }
  else
  {
    uint64_t v35 = IMLogHandleForCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB89CC();
    }
  }
LABEL_24:
}

- (void)markAsHasBeenBlockContact
{
}

- (void)updateIsFiltered:(int64_t)a3
{
  if (self->_isFiltered != a3)
  {
    objc_msgSend_setIsFiltered_(self, a2, a3, v3);
    objc_msgSend_chatRegistry(self, v5, v6, v7);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__chat_updateIsFiltered_(v9, v8, (uint64_t)self, self->_isFiltered);
  }
}

- (void)updateIsBlackholed:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v6 = objc_msgSend_daemonController(self, a2, a3, v3);
  BOOL v10 = (*MEMORY[0x1E4F6C4F8] & objc_msgSend_capabilities(v6, v7, v8, v9)) == 0;

  if (v10 == v4)
  {
    objc_msgSend_chatRegistry(self, v11, v12, v13);
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__chat_updateIsBlackholed_(v15, v14, (uint64_t)self, v4);
  }
}

- (void)setRecovered:(BOOL)a3
{
  if (self->_recovered != a3)
  {
    if (a3)
    {
      self->_recovered = a3;
      if (IMOSLoggingEnabled())
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Updating isRecovered to YES", buf, 2u);
        }
      }
      uint64_t v8 = objc_msgSend_chatRegistry(self, v4, v5, v6);
      objc_msgSend__chat_updateIsRecovered_(v8, v9, (uint64_t)self, 1);
    }
    else if (IMOSLoggingEnabled())
    {
      BOOL v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Chat - Tried to update isRecovered to NO, not allowed", v11, 2u);
      }
    }
  }
}

- (void)setDeletingIncomingMessages:(BOOL)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_deletingIncomingMessages != a3)
  {
    BOOL v3 = a3;
    self->_deletingIncomingMessages = a3;
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = @"NO";
        if (v3) {
          uint64_t v9 = @"YES";
        }
        int v12 = 138412290;
        uint64_t v13 = v9;
        _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Updating isDeletingIncomingMessages to %@", (uint8_t *)&v12, 0xCu);
      }
    }
    BOOL v10 = objc_msgSend_chatRegistry(self, v5, v6, v7);
    objc_msgSend__chat_updateIsDeletingIncomingMessages_(v10, v11, (uint64_t)self, v3);
  }
}

- (void)updateLineSwitchedTo:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "SIM Line is switched to %@", (uint8_t *)&v7, 0xCu);
    }
  }
  objc_msgSend__updateChatItemsWithReason_block_(self, v5, @"(IMChat) Conversation line switched", (uint64_t)&unk_1EF8E64A8);
}

- (void)loadParticipantContactsIfNecessary
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v4 = objc_msgSend_participants(self, a2, v2, v3, 0);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v14, (uint64_t)v18, 16);
  if (v6)
  {
    uint64_t v9 = v6;
    uint64_t v10 = *(void *)v15;
    uint64_t v11 = MEMORY[0x1E4F1CBF0];
    do
    {
      uint64_t v12 = 0;
      do
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v4);
        }
        id v13 = (id)objc_msgSend_cnContactWithKeys_(*(void **)(*((void *)&v14 + 1) + 8 * v12++), v7, v11, v8);
      }
      while (v9 != v12);
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v14, (uint64_t)v18, 16);
    }
    while (v9);
  }
}

+ (id)_participantsWorkQueue
{
  if (qword_1E965E9C8 != -1) {
    dispatch_once(&qword_1E965E9C8, &unk_1EF8E5C58);
  }
  uint64_t v2 = (void *)qword_1E965E9C0;

  return v2;
}

- (BOOL)hasKnownParticipants
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v5 = objc_msgSend_participants(self, a2, v2, v3, 0);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v16, (uint64_t)v20, 16);
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v5);
        }
        if (objc_msgSend_isContactButNotMe(*(void **)(*((void *)&v16 + 1) + 8 * i), v7, v8, v9))
        {
          uint64_t v10 = 1;
          goto LABEL_11;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v7, (uint64_t)&v16, (uint64_t)v20, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  objc_msgSend_setHasKnownParticipantsCache_(self, v13, v10, v14);
  return v10;
}

- (void)invalidateHasKnownParticipantsCache
{
}

- (void)setHasKnownParticipantsCache:(BOOL)a3
{
}

- (BOOL)hasKnownParticipantsCache
{
  unint64_t hasKnownParticipantsCacheStatus = objc_msgSend_hasKnownParticipantsCacheStatus(self, a2, v2, v3);
  if (hasKnownParticipantsCacheStatus >= 2)
  {
    if (hasKnownParticipantsCacheStatus == -1)
    {
      LOBYTE(hasKnownParticipantsCacheStatus) = objc_msgSend_hasKnownParticipants(self, v6, v7, v8);
    }
    else
    {
      LOBYTE(hasKnownParticipantsCacheStatus) = 0;
    }
  }
  return hasKnownParticipantsCacheStatus;
}

- (BOOL)allParticipantsAreContacts
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v4 = objc_msgSend_participants(self, a2, v2, v3, 0);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v15, (uint64_t)v19, 16);
  if (v6)
  {
    uint64_t v10 = v6;
    uint64_t v11 = *(void *)v16;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v16 != v11) {
          objc_enumerationMutation(v4);
        }
        if (!objc_msgSend_isContact(*(void **)(*((void *)&v15 + 1) + 8 * i), v7, v8, v9))
        {
          BOOL v13 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v7, (uint64_t)&v15, (uint64_t)v19, 16);
      if (v10) {
        continue;
      }
      break;
    }
  }
  BOOL v13 = 1;
LABEL_11:

  return v13;
}

- (BOOL)hasMessageWithServiceCapability:(id)a3
{
  id v4 = objc_msgSend__lastMessageItemWithServiceCapability_(self, a2, (uint64_t)a3, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)hasMessageFromService:(id)a3
{
  BOOL v5 = objc_msgSend_internalName(a3, a2, (uint64_t)a3, v3);
  uint64_t v9 = v5;
  if (v5 && objc_msgSend_length(v5, v6, v7, v8))
  {
    uint64_t v12 = objc_msgSend__lastMessageItemWithService_(self, v10, (uint64_t)v9, v11);
    BOOL v13 = v12 != 0;
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)isSMS
{
  id v4 = objc_msgSend_account(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_service(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_smsService(IMService, v9, v10, v11);
  BOOL v13 = v8 == v12;

  return v13;
}

- (BOOL)isRCS
{
  id v4 = objc_msgSend_account(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_service(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_rcsService(IMService, v9, v10, v11);
  BOOL v13 = v8 == v12;

  return v13;
}

- (BOOL)shouldForceToSMS
{
  uint64_t v3 = objc_msgSend_valueForChatProperty_(self, a2, @"shouldForceToSMS", v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (void)updateShouldForceToSMS:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v6 = objc_msgSend_valueForChatProperty_(self, a2, @"shouldForceToSMS", v3);
  int v10 = objc_msgSend_BOOLValue(v6, v7, v8, v9);

  if (v10 != v4)
  {
    objc_msgSend_numberWithBool_(NSNumber, v11, v4, v12);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setValue_forChatProperty_(self, v13, (uint64_t)v14, @"shouldForceToSMS");
  }
}

- (void)setPrefersTextResponseToIncomingAudioMessages:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v6 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, a3, v3);
  char isAudioMessagesEntryViewRecordingEnabled = objc_msgSend_isAudioMessagesEntryViewRecordingEnabled(v6, v7, v8, v9);

  if ((isAudioMessagesEntryViewRecordingEnabled & 1) == 0)
  {
    BOOL v13 = objc_msgSend_valueForChatProperty_(self, v11, @"prefersTextResponseToIncomingAudioMessages", v12);
    int v17 = objc_msgSend_BOOLValue(v13, v14, v15, v16);

    if (v17 != v4)
    {
      objc_msgSend_numberWithBool_(NSNumber, v18, v4, v19);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValue_forChatProperty_(self, v20, (uint64_t)v21, @"prefersTextResponseToIncomingAudioMessages");
    }
  }
}

- (void)setKeyTransparencyURIToUUIDMapping:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v37 = *MEMORY[0x1E4F6CD90];
  uint64_t v38 = self;
  char v7 = objc_msgSend_valueForChatProperty_(self, v5, *MEMORY[0x1E4F6CD90], v6);
  uint64_t v11 = objc_msgSend_dictionary(MEMORY[0x1E4F1CA60], v8, v9, v10);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  uint64_t v15 = objc_msgSend_allKeys(v4, v12, v13, v14);
  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v17)
  {
    uint64_t v20 = v17;
    uint64_t v21 = *(void *)v40;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v40 != v21) {
          objc_enumerationMutation(v15);
        }
        uint64_t v23 = *(void *)(*((void *)&v39 + 1) + 8 * i);
        uint64_t v24 = objc_msgSend_objectForKeyedSubscript_(v4, v18, v23, v19);
        uint64_t v28 = objc_msgSend_UUIDString(v24, v25, v26, v27);
        objc_msgSend_setObject_forKeyedSubscript_(v11, v29, (uint64_t)v28, v23);
      }
      uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v20);
  }

  if ((objc_msgSend_isEqualToDictionary_(v7, v30, (uint64_t)v11, v31) & 1) == 0)
  {
    uint64_t v35 = objc_msgSend_copy(v11, v32, v33, v34);
    objc_msgSend_setValue_forChatProperty_(v38, v36, (uint64_t)v35, v37);
  }
}

- (BOOL)prefersTextResponseToIncomingAudioMessages
{
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  char isAudioMessagesEntryViewRecordingEnabled = objc_msgSend_isAudioMessagesEntryViewRecordingEnabled(v5, v6, v7, v8);

  if (isAudioMessagesEntryViewRecordingEnabled) {
    return 1;
  }
  uint64_t v13 = objc_msgSend_valueForChatProperty_(self, v10, @"prefersTextResponseToIncomingAudioMessages", v11);
  char v17 = objc_msgSend_BOOLValue(v13, v14, v15, v16);

  return v17;
}

- (void)setShouldShowAudioButtonInEntryView:(BOOL)a3
{
  BOOL v4 = a3;
  uint64_t v6 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, a3, v3);
  int isAudioMessagesEntryViewRecordingEnabled = objc_msgSend_isAudioMessagesEntryViewRecordingEnabled(v6, v7, v8, v9);

  if (isAudioMessagesEntryViewRecordingEnabled)
  {
    uint64_t v13 = objc_msgSend_valueForChatProperty_(self, v11, @"showAudioButtonInEntryView", v12);
    int v17 = objc_msgSend_BOOLValue(v13, v14, v15, v16);

    if (v17 != v4)
    {
      objc_msgSend_numberWithBool_(NSNumber, v18, v4, v19);
      id v21 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend_setValue_forChatProperty_(self, v20, (uint64_t)v21, @"showAudioButtonInEntryView");
    }
  }
}

- (BOOL)shouldShowAudioButtonInEntryView
{
  int v4 = objc_msgSend_supportsCapabilities_(self, a2, 64, v2);
  if (v4)
  {
    uint64_t v7 = objc_msgSend_valueForChatProperty_(self, v5, @"showAudioButtonInEntryView", v6);
    char v11 = objc_msgSend_BOOLValue(v7, v8, v9, v10);

    LOBYTE(v4) = v11;
  }
  return v4;
}

- (void)updateSMSCategory:(int64_t)a3 subCategory:(int64_t)a4
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_fetchSMSFilterParamForCategory_subCategory_(MEMORY[0x1E4F6E938], a2, a3, a4);
  uint64_t v10 = objc_msgSend_category(v6, v7, v8, v9);
  uint64_t v14 = objc_msgSend_subCategory(v6, v11, v12, v13);
  int v17 = objc_msgSend_valueForChatProperty_(self, v15, @"SMSCategory", v16);
  uint64_t v21 = objc_msgSend_integerValue(v17, v18, v19, v20);

  if (v21 != v10)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        int v43 = v10;
        _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "Setting spam category to: %d", buf, 8u);
      }
    }
    uint64_t v25 = objc_msgSend_numberWithInteger_(NSNumber, v22, v10, v23);
    objc_msgSend_setValue_forChatProperty_(self, v26, (uint64_t)v25, @"SMSCategory");

    uint64_t v29 = objc_msgSend_numberWithInteger_(NSNumber, v27, v14, v28);
    objc_msgSend_setValue_forChatProperty_(self, v30, (uint64_t)v29, @"SMSSubCategory");

    BOOL v31 = a3 == 2;
    uint64_t v34 = objc_msgSend_numberWithBool_(NSNumber, v32, v31, v33);
    objc_msgSend_setValue_forChatProperty_(self, v35, (uint64_t)v34, @"wasDetectedAsSMSSpam");

    objc_msgSend__postNotification_userInfo_(self, v36, @"__kIMChatIsFilteredChangedNotification", 0);
    if (!v31)
    {
      long long v39 = objc_msgSend_stringWithFormat_(NSString, v37, @"updateSMSCategory:%d", v38, v10);
      objc_msgSend__updateChatItemsWithDataDetectorResultsForReason_(self, v40, (uint64_t)v39, v41);
    }
  }
}

- (int64_t)chatPropertyValueFor:(int64_t)a3
{
  if ((unint64_t)(a3 - 2) >= 3) {
    return 0;
  }
  else {
    return a3 - 1;
  }
}

- (int64_t)filterCategory
{
  return objc_msgSend_isFiltered(self, a2, v2, v3) & 0xF;
}

- (int64_t)filterSubCategory
{
  return objc_msgSend_isFiltered(self, a2, v2, v3) >> 4;
}

- (void)clearSMSCategory
{
}

- (BOOL)isCategorized
{
  int v4 = objc_msgSend_valueForChatProperty_(self, a2, @"wasDetectedAsSMSSpam", v2);
  if (objc_msgSend_BOOLValue(v4, v5, v6, v7))
  {
    BOOL v10 = 1;
  }
  else
  {
    char v11 = objc_msgSend_valueForChatProperty_(self, v8, @"SMSCategory", v9);
    BOOL v10 = (int)objc_msgSend_intValue(v11, v12, v13, v14) > 0;
  }
  return v10;
}

- (int64_t)smsCategory
{
  uint64_t v3 = objc_msgSend_valueForChatProperty_(self, a2, @"SMSCategory", v2);
  int64_t v7 = (int)objc_msgSend_intValue(v3, v4, v5, v6);

  return v7;
}

- (void)_updateChatItemsWithDataDetectorResultsForReason:(id)a3
{
  if (a3) {
    int v4 = (__CFString *)a3;
  }
  else {
    int v4 = @"(IMChat) <Reason undefined>";
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1A4BD3B0C;
  v7[3] = &unk_1E5B7ACD0;
  v7[4] = self;
  id v5 = a3;
  objc_msgSend__updateChatItemsWithReason_block_(self, v6, (uint64_t)v4, (uint64_t)v7);
}

- (NSString)lastSeenMessageGuid
{
  return (NSString *)objc_msgSend_valueForChatProperty_(self, a2, *MEMORY[0x1E4F6CDC8], v2);
}

- (IMMessageItem)firstUnreadMessageItem
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_unreadMessageCount(self, a2, v2, v3)
    && (uint64_t v55 = self,
        objc_msgSend_lastSeenMessageGuid(self, v5, v6, v7),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v8))
  {
    uint64_t v54 = objc_msgSend__items(v55, v9, v10, v11);
    long long v58 = 0u;
    long long v59 = 0u;
    long long v56 = 0u;
    long long v57 = 0u;
    uint64_t v15 = objc_msgSend_reverseObjectEnumerator(v54, v12, v13, v14);
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v56, (uint64_t)v62, 16);
    if (v17)
    {
      id v18 = 0;
      uint64_t v19 = *(void *)v57;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v57 != v19) {
            objc_enumerationMutation(v15);
          }
          id v21 = *(id *)(*((void *)&v56 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v25 = objc_msgSend_guid(v21, v22, v23, v24);
            uint64_t v29 = objc_msgSend_lastSeenMessageGuid(v55, v26, v27, v28);
            int isEqualToString = objc_msgSend_isEqualToString_(v25, v30, (uint64_t)v29, v31);

            if (isEqualToString)
            {
              if (v18) {
                uint64_t v47 = v18;
              }
              else {
                uint64_t v47 = v21;
              }
              id v46 = v47;

              goto LABEL_27;
            }
            id v33 = v21;

            id v18 = v33;
          }
        }
        uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v34, (uint64_t)&v56, (uint64_t)v62, 16);
        if (v17) {
          continue;
        }
        break;
      }

      if (v18)
      {
        uint64_t v38 = objc_msgSend_guid(v18, v35, v36, v37);
        long long v42 = objc_msgSend_lastSeenMessageGuid(v55, v39, v40, v41);
        int v45 = objc_msgSend_isEqualToString_(v38, v43, (uint64_t)v42, v44);

        if (v45)
        {
          id v18 = v18;
          id v46 = v18;
          goto LABEL_27;
        }
      }
    }
    else
    {

      id v18 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v48 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
      {
        uint64_t v52 = objc_msgSend_count(v54, v49, v50, v51);
        *(_DWORD *)buf = 134217984;
        uint64_t v61 = v52;
        _os_log_impl(&dword_1A4AF7000, v48, OS_LOG_TYPE_INFO, "Tried to identify first unread message but it was not part of the %lu loaded messages", buf, 0xCu);
      }
    }
    id v46 = 0;
LABEL_27:
  }
  else
  {
    id v46 = 0;
  }

  return (IMMessageItem *)v46;
}

- (void)updateTranscriptSharingState:(int64_t)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_valueForChatProperty_(self, a2, @"emergencyTranscriptSharingState", v3);
  uint64_t v10 = objc_msgSend_integerValue(v6, v7, v8, v9);

  if (v10 != a3)
  {
    uint64_t v13 = objc_msgSend_numberWithInteger_(NSNumber, v11, a3, v12);
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        uint64_t v17 = v13;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Updating transcript sharing state to %@", (uint8_t *)&v16, 0xCu);
      }
    }
    objc_msgSend_setValue_forChatProperty_(self, v14, (uint64_t)v13, @"emergencyTranscriptSharingState");
  }
}

- (int64_t)transcriptSharingState
{
  uint64_t v3 = objc_msgSend_valueForChatProperty_(self, a2, @"emergencyTranscriptSharingState", v2);
  int64_t v7 = objc_msgSend_integerValue(v3, v4, v5, v6);

  return v7;
}

- (BOOL)shouldShowAutoDonationAction
{
  if ((objc_msgSend_isBusinessChat(self, a2, v2, v3) & 1) != 0
    || !objc_msgSend_hasKnownParticipants(self, v5, v6, v7))
  {
    return 0;
  }
  uint64_t v11 = objc_msgSend_sharedManager(MEMORY[0x1E4F6EA28], v8, v9, v10);
  char isSharedWithYouEnabled = objc_msgSend_isSharedWithYouEnabled(v11, v12, v13, v14);

  return isSharedWithYouEnabled;
}

- (BOOL)isAutoDonatingMessages
{
  uint64_t v5 = objc_msgSend_autoDonationBehavior(self, a2, v2, v3);
  if (v5 == 2) {
    goto LABEL_6;
  }
  if (v5 == 1) {
    return v5;
  }
  if (v5)
  {
LABEL_6:
    LOBYTE(v5) = 0;
    return v5;
  }
  LODWORD(v5) = objc_msgSend_shouldShowAutoDonationAction(self, v6, v7, v8);
  if (v5)
  {
    uint64_t v12 = objc_msgSend_sharedManager(MEMORY[0x1E4F6EA28], v9, v10, v11);
    char isSharedWithYouEnabled = objc_msgSend_isSharedWithYouEnabled(v12, v13, v14, v15);

    LOBYTE(v5) = isSharedWithYouEnabled;
  }
  return v5;
}

- (void)setAutoDonationBehavior:(int64_t)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_autoDonationBehavior != a3)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = objc_msgSend_guid(self, v6, v7, v8);
        int v10 = 134218242;
        int64_t v11 = a3;
        __int16 v12 = 2112;
        uint64_t v13 = v9;
        _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Updating AutoDonateBehavior to: %ld for chat guid: %@", (uint8_t *)&v10, 0x16u);
      }
    }
    self->_autoDonationBehavior = a3;
  }
}

- (id)lastTranslatableMessageGUIDWithLanguageCode:(id)a3
{
  uint64_t v4 = *MEMORY[0x1E4F6CDD0];
  id v5 = a3;
  uint64_t v8 = objc_msgSend_valueForChatProperty_(self, v6, v4, v7);
  int64_t v11 = objc_msgSend_objectForKeyedSubscript_(v8, v9, (uint64_t)v5, v10);

  return v11;
}

- (void)updateLastMessageGUID:(id)a3 forLanguageCode:(id)a4
{
  uint64_t v6 = *MEMORY[0x1E4F6CDD0];
  id v7 = a4;
  id v8 = a3;
  objc_msgSend_valueForChatProperty_(self, v9, v6, v10);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forKey_(v13, v11, (uint64_t)v8, (uint64_t)v7);

  objc_msgSend_setValue_forChatProperty_(self, v12, (uint64_t)v13, v6);
}

- (BOOL)isEmergencyChat
{
  uint64_t v3 = objc_msgSend_valueForChatProperty_(self, a2, *MEMORY[0x1E4F6CD70], v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (id)chatSummary
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  if (!objc_msgSend_messageSummarizationEnabled(MEMORY[0x1E4F6E790], a2, v2, v3))
  {
    id v23 = 0;
    goto LABEL_22;
  }
  char v7 = objc_msgSend_valueForChatProperty_(self, v5, *MEMORY[0x1E4F6CD00], v6);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0) {
    goto LABEL_8;
  }
  uint64_t v10 = objc_msgSend_objectForKey_(v7, v8, *MEMORY[0x1E4F6CCF8], v9);
  int v14 = objc_msgSend_BOOLValue(v10, v11, v12, v13);

  if (!v14)
  {
    uint64_t v27 = objc_msgSend_chatSummaryMessageGUID(self, v15, v16, v17);
    if (v27)
    {
      uint64_t v28 = objc_msgSend_lastMessage(self, v24, v25, v26);
      uint64_t v32 = objc_msgSend_guid(v28, v29, v30, v31);

      if (v32 && (objc_msgSend_isEqualToString_(v32, v33, (uint64_t)v27, v34) & 1) == 0)
      {
        objc_msgSend_consumeSummaryIfNeeded(self, v35, v36, v37);

        id v23 = 0;
LABEL_20:

        goto LABEL_21;
      }
    }
    uint64_t v38 = objc_msgSend_objectForKey_(v7, v24, *MEMORY[0x1E4F6CD10], v26);
    long long v39 = (void *)MEMORY[0x1E4F28DC0];
    uint64_t v40 = objc_opt_class();
    id v46 = 0;
    long long v42 = objc_msgSend_unarchivedObjectOfClass_fromData_error_(v39, v41, v40, (uint64_t)v38, &v46);
    id v43 = v46;
    if (v43)
    {
      uint64_t v44 = IMLogHandleForCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB8A00();
      }

      id v23 = 0;
    }
    else
    {
      id v23 = v42;
    }

    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = objc_msgSend_guid(self, v19, v20, v21);
      *(_DWORD *)buf = 138412290;
      uint64_t v48 = v22;
      _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Stored summary was already consumed for chat with GUID %@.", buf, 0xCu);
    }
  }
LABEL_8:
  id v23 = 0;
LABEL_21:

LABEL_22:

  return v23;
}

- (id)chatSummaryMessageGUID
{
  if (objc_msgSend_messageSummarizationEnabled(MEMORY[0x1E4F6E790], a2, v2, v3))
  {
    char v7 = objc_msgSend_valueForChatProperty_(self, v5, *MEMORY[0x1E4F6CD00], v6);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v10 = objc_msgSend_objectForKey_(v7, v8, *MEMORY[0x1E4F6CD08], v9);
    }
    else
    {
      uint64_t v10 = 0;
    }
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)updateIsEmergencyChat:(BOOL)a3
{
  objc_msgSend_numberWithBool_(NSNumber, a2, a3, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setValue_forChatProperty_(self, v5, (uint64_t)v6, *MEMORY[0x1E4F6CD70]);
}

- (void)updateAssociatedBusinessID:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ((objc_msgSend_isStewieRoadsideChat(self, v5, v6, v7) & 1) == 0)
  {
    uint64_t v24 = IMLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB8AD8();
    }
    goto LABEL_14;
  }
  if ((objc_msgSend__appearsToBeBusinessID(v4, v8, v9, v10) & 1) == 0)
  {
    uint64_t v24 = IMLogHandleForCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB8A6C();
    }
LABEL_14:

    goto LABEL_15;
  }
  int v14 = objc_msgSend_associatedBusinessID(self, v11, v12, v13);
  char isEqualToString = objc_msgSend_isEqualToString_(v4, v15, (uint64_t)v14, v16);

  if ((isEqualToString & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v23 = objc_msgSend_guid(self, v20, v21, v22);
        int v25 = 138412546;
        id v26 = v4;
        __int16 v27 = 2112;
        uint64_t v28 = v23;
        _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Updating Associated business ID to: %@ for chat guid: %@", (uint8_t *)&v25, 0x16u);
      }
    }
    objc_msgSend_setValue_forChatProperty_(self, v18, (uint64_t)v4, *MEMORY[0x1E4F6CCE0]);
  }
LABEL_15:
}

- (void)markBusinessChatAsSpam:(unint64_t)a3
{
  v4[0] = MEMORY[0x1E4F143A8];
  v4[1] = 3221225472;
  v4[2] = sub_1A4BD4A14;
  v4[3] = &unk_1E5B7D578;
  v4[4] = self;
  v4[5] = a3;
  id v3 = (id)objc_msgSend__performQueryWithKey_loadImmediately_block_(self, a2, @"MarkAsSpam", 1, v4);
}

- (NSString)stewieSharingSuggestedName
{
  if (objc_msgSend_isStewieSharingChat(self, a2, v2, v3))
  {
    id v8 = objc_msgSend_emergencyUserInfo(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_emergencyUserPersona(v8, v9, v10, v11);
    uint64_t v16 = objc_msgSend_suggestedDisplayName(v12, v13, v14, v15);
  }
  else
  {
    uint64_t v16 = 0;
  }

  return (NSString *)v16;
}

- (IMHandle)emergencyUserHandle
{
  if (objc_msgSend_isStewieSharingChat(self, a2, v2, v3) && !self->_cachedEUHandle)
  {
    id v8 = objc_msgSend_emergencyUserInfo(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_emergencyUserPersona(v8, v9, v10, v11);
    uint64_t v19 = objc_msgSend_senderID(v12, v13, v14, v15);
    if (v19)
    {
      uint64_t v20 = objc_msgSend_account(self, v16, v17, v18);
      objc_msgSend_imHandleWithID_(v20, v21, (uint64_t)v19, v22);
      id v23 = (IMHandle *)objc_claimAutoreleasedReturnValue();
      cachedEUHandle = self->_cachedEUHandle;
      self->_cachedEUHandle = v23;
    }
  }
  int v25 = self->_cachedEUHandle;

  return v25;
}

- (void)stopTranscriptSharingWithChat
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int v9 = objc_msgSend_stewieEnabled(v5, v6, v7, v8);

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v21 = 136315138;
        uint64_t v22 = "-[IMChat stopTranscriptSharingWithChat]";
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "Stop transcript sharing for %s", (uint8_t *)&v21, 0xCu);
      }
    }
    uint64_t v14 = objc_msgSend_sharedInstance(IMDaemonController, v10, v11, v12);
    uint64_t v18 = objc_msgSend_chatIdentifier(self, v15, v16, v17);
    objc_msgSend_stopTranscriptSharingWithChat_(v14, v19, (uint64_t)v18, v20);
  }
}

- (BOOL)isOscarChat
{
  if (objc_msgSend_isFiltered(self, a2, v2, v3) != 2) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_account(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_service(v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_internalName(v12, v13, v14, v15);
  char isEqualToString = objc_msgSend_isEqualToString_(v16, v17, *MEMORY[0x1E4F6E1B0], v18);

  return isEqualToString;
}

- (BOOL)containsMessageFromContactOrMe
{
  if (objc_msgSend_numberOfTimesRespondedToThread(self, a2, v2, v3) > 0) {
    return 1;
  }
  int v9 = objc_msgSend_lastFinishedMessageItem(self, v5, v6, v7);
  uint64_t v13 = objc_msgSend__senderHandle(v9, v10, v11, v12);
  if (objc_msgSend_isContact(v13, v14, v15, v16))
  {
    char v8 = 1;
  }
  else
  {
    uint64_t v20 = objc_msgSend_lastFinishedMessageItem(self, v17, v18, v19);
    char v8 = objc_msgSend_isFromMe(v20, v21, v22, v23);
  }
  return v8;
}

- (int64_t)numberOfTimesRespondedToThread
{
  uint64_t v3 = objc_msgSend_valueForChatProperty_(self, a2, @"numberOfTimesRespondedtoThread", v2);
  int64_t v7 = objc_msgSend_integerValue(v3, v4, v5, v6);

  return v7;
}

- (void)clear
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int64_t v7 = self;
      _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "Clearing chat: %@", buf, 0xCu);
    }
  }
  self->_didSendAFinishedMessage = 0;
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A4BD4F8C;
  v5[3] = &unk_1E5B7ACD0;
  v5[4] = self;
  objc_msgSend__updateChatItemsWithReason_block_(self, v3, @"(IMChat) Clear transcript", (uint64_t)v5);
}

- (void)didUnregisterFromRegistry:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = objc_msgSend_guid(self, v9, v10, v11);
      uint64_t v16 = objc_msgSend_participants(self, v13, v14, v15);
      int v21 = 138412546;
      uint64_t v22 = v12;
      __int16 v23 = 2112;
      uint64_t v24 = v16;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Chat %@ has been unregistered, removing participants (were %@)", (uint8_t *)&v21, 0x16u);
    }
  }
  objc_msgSend__removeAllItems(self, v5, v6, v7);
  participants = self->_participants;
  self->_participants = 0;

  account = self->_account;
  self->_account = 0;

  objc_msgSend_setUnregistered_(self, v19, 1, v20);
}

- (void)_accountLoggedOut:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_msgSend_object(v4, v5, v6, v7);
  uint64_t v8 = (IMAccount *)objc_claimAutoreleasedReturnValue();
  account = self->_account;

  if (v8 == account && IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v11 = self->_account;
      int v12 = 138412546;
      uint64_t v13 = self;
      __int16 v14 = 2112;
      uint64_t v15 = v11;
      _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_DEBUG, "Account Logged Out: chat: %@ account: %@", (uint8_t *)&v12, 0x16u);
    }
  }
}

- (void)_startTiming:(id)a3
{
  id v5 = a3;
  p_timingCollection = &self->_timingCollection;
  if (!self->_timingCollection)
  {
    id v7 = v5;
    objc_storeStrong((id *)p_timingCollection, a3);
    id v5 = v7;
  }

  MEMORY[0x1F41817F8](p_timingCollection, v5);
}

- (void)_endTiming
{
  self->_timingCollection = 0;
  MEMORY[0x1F41817F8]();
}

- (void)_postIMChatItemsDidChangeNotificationWithInserted:(id)a3 removed:(id)a4 reload:(id)a5 regenerate:(id)a6 oldChatItems:(id)a7 newChatItems:(id)a8
{
  v35[6] = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v21 = a8;
  v34[0] = @"__kIMChatItemsInserted";
  uint64_t v22 = (uint64_t)v13;
  if (!v13)
  {
    uint64_t v22 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v18, v19, v20);
  }
  uint64_t v31 = (void *)v22;
  v35[0] = v22;
  v34[1] = @"__kIMChatItemsRemoved";
  uint64_t v23 = (uint64_t)v14;
  if (!v14)
  {
    uint64_t v23 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v18, v19, v20);
  }
  uint64_t v30 = (void *)v23;
  v35[1] = v23;
  v34[2] = @"__kIMChatItemsReload";
  uint64_t v24 = v15;
  if (!v15)
  {
    uint64_t v24 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v18, v19, v20);
  }
  id v33 = v13;
  v35[2] = v24;
  v34[3] = @"__kIMChatItemsRegenerate";
  uint64_t v25 = v16;
  if (!v16)
  {
    uint64_t v25 = objc_msgSend_indexSet(MEMORY[0x1E4F28D60], v18, v19, v20);
  }
  v35[3] = v25;
  v34[4] = @"__kIMChatItemsOldItems";
  id v26 = v17;
  if (!v17)
  {
    id v26 = objc_msgSend_array(MEMORY[0x1E4F1C978], v18, v19, v20);
  }
  v35[4] = v26;
  void v34[5] = @"__kIMChatItemsNewItems";
  __int16 v27 = v21;
  if (!v21)
  {
    __int16 v27 = objc_msgSend_array(MEMORY[0x1E4F1C978], v18, v19, v20);
  }
  v35[5] = v27;
  uint64_t v29 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v18, (uint64_t)v35, (uint64_t)v34, 6);
  if (v21)
  {
    if (v17) {
      goto LABEL_15;
    }
LABEL_21:

    if (v16) {
      goto LABEL_16;
    }
    goto LABEL_22;
  }

  if (!v17) {
    goto LABEL_21;
  }
LABEL_15:
  if (v16) {
    goto LABEL_16;
  }
LABEL_22:

LABEL_16:
  if (v15)
  {
    if (v14) {
      goto LABEL_18;
    }
LABEL_24:

    if (v33) {
      goto LABEL_19;
    }
LABEL_25:

    goto LABEL_19;
  }

  if (!v14) {
    goto LABEL_24;
  }
LABEL_18:
  if (!v33) {
    goto LABEL_25;
  }
LABEL_19:
  objc_msgSend__postNotification_userInfo_(self, v28, @"__kIMChatItemsDidChangeNotification", (uint64_t)v29);
}

- (void)_setParticipantState:(unint64_t)a3 forHandle:(id)a4 postNotification:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a4;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a4;
  uint64_t v11 = objc_msgSend_arrayWithObjects_count_(v8, v10, (uint64_t)&v13, 1);

  objc_msgSend__setParticipantState_forHandles_postNotification_(self, v12, a3, (uint64_t)v11, v5, v13, v14);
}

- (void)_handleMessageGUIDDeletions:(id)a3
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v42 = v4;
      __int16 v43 = 2112;
      uint64_t v44 = self;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Handle deleted messages: %@  in chat: %@", buf, 0x16u);
    }
  }
  long long v37 = 0u;
  long long v38 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v6 = v4;
  uint64_t v8 = 0;
  uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v35, (uint64_t)v40, 16);
  if (v11)
  {
    uint64_t v12 = *(void *)v36;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v36 != v12) {
          objc_enumerationMutation(v6);
        }
        uint64_t v14 = objc_msgSend__itemForGUID_(self, v9, *(void *)(*((void *)&v35 + 1) + 8 * v13), v10);
        if (v14)
        {
          if (v8 || (uint64_t v8 = (__CFArray *)objc_alloc_init(MEMORY[0x1E4F1CA48])) != 0) {
            CFArrayAppendValue(v8, v14);
          }
        }

        ++v13;
      }
      while (v11 != v13);
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v9, (uint64_t)&v35, (uint64_t)v40, 16);
    }
    while (v11);
  }

  if (objc_msgSend_count(v8, v15, v16, v17)) {
    objc_msgSend__updateRepliesIfNecessaryWithRemovedItems_threadIdentifiersOfRemovedParts_(self, v18, (uint64_t)v8, 0);
  }
  long long v33 = 0u;
  long long v34 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v19 = v8;
  uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v20, (uint64_t)&v31, (uint64_t)v39, 16);
  if (v23)
  {
    uint64_t v24 = *(void *)v32;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v32 != v24) {
          objc_enumerationMutation(v19);
        }
        objc_msgSend__removeItem_(self, v21, *(void *)(*((void *)&v31 + 1) + 8 * v25++), v22, (void)v31);
      }
      while (v23 != v25);
      uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v19, v21, (uint64_t)&v31, (uint64_t)v39, 16);
    }
    while (v23);
  }

  if (!objc_msgSend_messageCount(self, v26, v27, v28)) {
    id v30 = (id)objc_msgSend_loadMessagesBeforeDate_limit_loadImmediately_(self, v29, 0, 1, 1);
  }
}

- (unint64_t)paymentTypeForMessage:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = IMExtensionPayloadUnarchivingClasses();
  id v5 = objc_alloc(MEMORY[0x1E4F28DC0]);
  id v9 = objc_msgSend_payloadData(v3, v6, v7, v8);
  id v24 = 0;
  uint64_t v11 = objc_msgSend_initForReadingFromData_error_(v5, v10, (uint64_t)v9, (uint64_t)&v24);
  id v12 = v24;

  if (objc_opt_respondsToSelector())
  {
    objc_msgSend__enableStrictSecureDecodingMode(v11, v13, v14, v15);
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "strict-decoding 008 _enableStrictSecureDecodingMode called", buf, 2u);
      }
    }
  }
  uint64_t v17 = objc_msgSend_decodeObjectOfClasses_forKey_(v11, v13, (uint64_t)v4, *MEMORY[0x1E4F284E8]);
  if (v12 && IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v12;
      _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "Failed to unarchive message payload data. Error: %@", buf, 0xCu);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v21 = objc_msgSend_objectForKey_(v17, v19, *MEMORY[0x1E4F6D330], v20);
    if (qword_1E965E9D8 != -1) {
      dispatch_once(&qword_1E965E9D8, &unk_1EF8E3508);
    }
    if (off_1E965E9D0) {
      unint64_t v22 = off_1E965E9D0(v21);
    }
    else {
      unint64_t v22 = 0;
    }
  }
  else
  {
    unint64_t v22 = 0;
  }

  return v22;
}

- (BOOL)hasSurfRequestForPaymentType:(unint64_t)a3
{
  return a3 == 2;
}

- (BOOL)hasSurfRequestNotFromMe:(id)a3
{
  id v4 = a3;
  if ((objc_msgSend_isFromMe(v4, v5, v6, v7) & 1) != 0
    || (objc_msgSend_balloonBundleID(v4, v8, v9, v10),
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        int v14 = objc_msgSend_containsString_(v11, v12, *MEMORY[0x1E4F6CC30], v13),
        v11,
        !v14))
  {
    char hasSurfRequestForPaymentType = 0;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v23 = 0;
        _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Checking for request type in incoming SURF message for spam filtering", v23, 2u);
      }
    }
    uint64_t v18 = objc_msgSend_paymentTypeForMessage_(self, v15, (uint64_t)v4, v16);
    char hasSurfRequestForPaymentType = objc_msgSend_hasSurfRequestForPaymentType_(self, v19, v18, v20);
  }

  return hasSurfRequestForPaymentType;
}

- (void)_fixSendingItemDateAndSortID:(id)a3
{
  uint64_t v146 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_guid(v4, v5, v6, v7);
  uint64_t v11 = objc_msgSend__itemForGUID_(self, v9, (uint64_t)v8, v10);

  if (objc_msgSend__shouldPinUnsentMessagesToBottom(self, v12, v13, v14))
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_hasEditedParts(v4, v18, v19, v20))
    {
      uint64_t v21 = objc_msgSend_flags(v4, v18, v19, v20);
      objc_msgSend_setFlags_(v4, v22, v21 | 0x8000, v23);
    }
    if (v11
      && objc_msgSend_unsentIsFromMeItem(v11, v18, v19, v20)
      && (objc_msgSend_unsentIsFromMeItem(v4, v18, v19, v20) & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          LOWORD(v138) = 0;
          _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "We have an unsent message that has now been sent, so we want to assign it a sortID", (uint8_t *)&v138, 2u);
        }
      }
      objc_msgSend__setSortID_(self, v24, (uint64_t)v4, v25);
    }
    uint64_t v27 = objc_msgSend__items(self, v18, v19, v20);
    long long v31 = objc_msgSend_lastObject(v27, v28, v29, v30);

    if (objc_msgSend_unsentIsFromMeItem(v31, v32, v33, v34)
      && !((v11 != 0) | objc_msgSend_isFromMe(v4, v35, v36, v37) & 1))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v40 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          LOWORD(v138) = 0;
          _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "The last item in the transcript is an unsent message and we are receiving an incoming message, we should display the progress bar", (uint8_t *)&v138, 2u);
        }
      }
      objc_msgSend_setStartSendProgressImmediately_(self->_sendProgress, v38, 1, v39);
    }
  }
  else if (v11)
  {
    if (objc_msgSend_isFromMe(v4, v15, v16, v17))
    {
      uint64_t v44 = objc_msgSend_clientSendTime(v11, v41, v42, v43);
      objc_msgSend_setClientSendTime_(v4, v45, (uint64_t)v44, v46);

      uint64_t v50 = objc_msgSend_time(v11, v47, v48, v49);
      objc_msgSend_setTime_(v4, v51, (uint64_t)v50, v52);

      if (IMOSLoggingEnabled())
      {
        uint64_t v53 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          long long v57 = NSNumber;
          long long v58 = objc_msgSend_time(v4, v54, v55, v56);
          objc_msgSend_timeIntervalSinceReferenceDate(v58, v59, v60, v61);
          objc_msgSend_numberWithDouble_(v57, v62, v63, v64);
          int v65 = (__CFString *)objc_claimAutoreleasedReturnValue();
          int v138 = 138412290;
          uint64_t v139 = v65;
          _os_log_impl(&dword_1A4AF7000, v53, OS_LOG_TYPE_INFO, "Fixing message time to be found item's time %@", (uint8_t *)&v138, 0xCu);
        }
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass()) {
      int isTypingMessage = objc_msgSend_isTypingMessage(v11, v66, v67, v68);
    }
    else {
      int isTypingMessage = 0;
    }
    objc_opt_class();
    BOOL v94 = (objc_opt_isKindOfClass() & 1) != 0
       && (objc_msgSend_isTypingMessage(v11, v88, v89, v90) & 1) == 0
       && objc_msgSend_sortID(v11, v91, v92, v93) == 0;
    int v95 = IMOSLoggingEnabled();
    if (isTypingMessage | v94)
    {
      if (v95)
      {
        uint64_t v99 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
        {
          uint64_t v100 = @"NO";
          if (isTypingMessage) {
            uint64_t v101 = @"YES";
          }
          else {
            uint64_t v101 = @"NO";
          }
          if (v94) {
            uint64_t v100 = @"YES";
          }
          int v138 = 138412546;
          uint64_t v139 = v101;
          __int16 v140 = 2112;
          v141 = v100;
          _os_log_impl(&dword_1A4AF7000, v99, OS_LOG_TYPE_INFO, "We have a typing indicator or the sort id for an existing item is 0, so resetting {itemIsTyping: %@ nonTypingZero %@}", (uint8_t *)&v138, 0x16u);
        }
      }
      objc_msgSend__setSortID_(self, v96, (uint64_t)v4, v98);
    }
    else
    {
      if (v95)
      {
        id v102 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v102, OS_LOG_TYPE_INFO))
        {
          long long v106 = NSNumber;
          uint64_t v107 = objc_msgSend_messageID(v4, v103, v104, v105);
          objc_msgSend_numberWithLongLong_(v106, v108, v107, v109);
          __int16 v110 = (__CFString *)objc_claimAutoreleasedReturnValue();
          uint64_t v111 = NSNumber;
          uint64_t v115 = objc_msgSend_sortID(v4, v112, v113, v114);
          objc_msgSend_numberWithUnsignedInteger_(v111, v116, v115, v117);
          __int16 v118 = (__CFString *)objc_claimAutoreleasedReturnValue();
          char v119 = NSNumber;
          uint64_t v123 = objc_msgSend_messageID(v11, v120, v121, v122);
          uint64_t v126 = objc_msgSend_numberWithLongLong_(v119, v124, v123, v125);
          v127 = NSNumber;
          uint64_t v131 = objc_msgSend_sortID(v11, v128, v129, v130);
          v134 = objc_msgSend_numberWithUnsignedInteger_(v127, v132, v131, v133);
          int v138 = 138413058;
          uint64_t v139 = v110;
          __int16 v140 = 2112;
          v141 = v118;
          __int16 v142 = 2112;
          uint64_t v143 = v126;
          __int16 v144 = 2112;
          uint64_t v145 = v134;
          _os_log_impl(&dword_1A4AF7000, v102, OS_LOG_TYPE_INFO, "Need to transfer sort id over from previous item message mid %@ sid %@ item mid %@ sid %@", (uint8_t *)&v138, 0x2Au);
        }
      }
      uint64_t v135 = objc_msgSend_sortID(v11, v96, v97, v98);
      objc_msgSend_setSortID_(v4, v136, v135, v137);
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_isTypingMessage(v4, v70, v71, v72))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v75 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          long long v79 = NSNumber;
          uint64_t v80 = objc_msgSend_messageID(v4, v76, v77, v78);
          objc_msgSend_numberWithLongLong_(v79, v81, v80, v82);
          uint64_t v83 = (__CFString *)objc_claimAutoreleasedReturnValue();
          objc_msgSend_guid(v4, v84, v85, v86);
          int v87 = (__CFString *)objc_claimAutoreleasedReturnValue();
          int v138 = 138412546;
          uint64_t v139 = v83;
          __int16 v140 = 2112;
          v141 = v87;
          _os_log_impl(&dword_1A4AF7000, v75, OS_LOG_TYPE_INFO, "we have a typing indicator so setting sortID 0 message id %@ message guid %@", (uint8_t *)&v138, 0x16u);
        }
      }
      objc_msgSend_setSortID_(v4, v73, 0, v74);
    }
    else
    {
      objc_msgSend__setSortID_(self, v70, (uint64_t)v4, v72);
    }
  }
}

- (void)_persistSortIDFromReplacedItem:(id)a3 toItem:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = v6;
      if (objc_msgSend_hasEditedParts(v7, v8, v9, v10))
      {
        uint64_t v14 = objc_msgSend_sortID(v5, v11, v12, v13);
        if (v14)
        {
          uint64_t v18 = v14;
          uint64_t v19 = objc_msgSend_sortID(v7, v15, v16, v17);
          int v20 = IMOSLoggingEnabled();
          if (v19)
          {
            if (v20)
            {
              uint64_t v23 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
              {
                int v26 = 134217984;
                uint64_t v27 = v19;
                _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Not updating sortID of edited message item, the message already has a sort ID of %ld", (uint8_t *)&v26, 0xCu);
              }
            }
          }
          else
          {
            if (v20)
            {
              uint64_t v25 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                int v26 = 134217984;
                uint64_t v27 = v18;
                _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Updating sortID of received edited message to %ld, to match existing sortID in transcript", (uint8_t *)&v26, 0xCu);
              }
            }
            objc_msgSend_setSortID_(v7, v21, v18, v22);
          }
        }
        else
        {
          id v24 = IMLogHandleForCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            sub_1A4CB8B0C();
          }
        }
      }
    }
  }
}

- (BOOL)_handleIncomingItem:(id)a3
{
  return objc_msgSend__handleIncomingItem_updateRecipient_suppressNotification_(self, a2, (uint64_t)a3, 1, 0);
}

- (BOOL)_handleIncomingItem:(id)a3 updateRecipient:(BOOL)a4
{
  return objc_msgSend__handleIncomingItem_updateRecipient_suppressNotification_(self, a2, (uint64_t)a3, a4, 0);
}

- (BOOL)_handleIncomingItem:(id)a3 updateRecipient:(BOOL)a4 suppressNotification:(BOOL)a5
{
  return objc_msgSend__handleIncomingItem_updateRecipient_suppressNotification_updateReplyCounts_(self, a2, (uint64_t)a3, a4, a5, 1);
}

- (BOOL)_itemsAreRelayItemsFromMeWithServiceSwitch:(id)a3 otherItem:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_isFromMe(v6, v8, v9, v10) && objc_msgSend_isFromMe(v7, v11, v12, v13))
  {
    uint64_t v17 = objc_msgSend_service(v6, v14, v15, v16);
    int v20 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v18, (uint64_t)v17, v19);
    if (!objc_msgSend_supportsRelay(v20, v21, v22, v23))
    {
      LOBYTE(v60) = 0;
LABEL_11:

      goto LABEL_12;
    }
    uint64_t v27 = objc_msgSend_service(v7, v24, v25, v26);
    uint64_t v30 = objc_msgSend_serviceWithInternalName_(IMServiceImpl, v28, (uint64_t)v27, v29);
    if (!objc_msgSend_supportsRelay(v30, v31, v32, v33))
    {
      LOBYTE(v60) = 0;
      goto LABEL_10;
    }
    uint64_t v37 = objc_msgSend_account(self, v34, v35, v36);
    uint64_t v41 = objc_msgSend_service(v37, v38, v39, v40);
    int v45 = objc_msgSend_supportsRelay(v41, v42, v43, v44);

    if (v45)
    {
      uint64_t v17 = objc_msgSend_service(v6, v46, v47, v48);
      int v20 = objc_msgSend_account(self, v49, v50, v51);
      uint64_t v27 = objc_msgSend_service(v20, v52, v53, v54);
      uint64_t v30 = objc_msgSend_internalName(v27, v55, v56, v57);
      int v60 = objc_msgSend_isEqualToString_(v17, v58, (uint64_t)v30, v59) ^ 1;
LABEL_10:

      goto LABEL_11;
    }
  }
  LOBYTE(v60) = 0;
LABEL_12:

  return v60;
}

- (BOOL)_handleIncomingItem:(id)a3 updateRecipient:(BOOL)a4 suppressNotification:(BOOL)a5 updateReplyCounts:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  BOOL v8 = a4;
  uint64_t v311 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  if (v10)
  {
    BOOL v305 = v8;
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v308 = self;
        __int16 v309 = 2112;
        id v310 = v10;
        _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Handle incoming message on chat (%@) message: %@", buf, 0x16u);
      }
    }
    if (!objc_msgSend_canHaveMultipleParticipants(self, v11, v12, v13)
      || (objc_msgSend__isDuplicate_(self, v15, (uint64_t)v10, v17) & 1) == 0)
    {
      uint64_t v19 = objc_msgSend_message(v10, v15, v16, v17);
      if ((objc_msgSend_isSystemMessage(v19, v20, v21, v22) & 1) != 0
        || objc_msgSend_isTypingMessage(v19, v23, v24, v25)
        && (objc_msgSend_isGroupChat(self, v26, v27, v28) & 1) != 0)
      {
        char v18 = 0;
LABEL_68:

        goto LABEL_69;
      }
      if (objc_msgSend_type(v10, v26, v27, v28) == 4) {
        objc_msgSend__configureLocationShareItem_(self, v29, (uint64_t)v10, v31);
      }
      v303 = objc_msgSend__items(self, v29, v30, v31);
      uint64_t v36 = objc_msgSend__indexOfItem_(self, v32, (uint64_t)v10, v33);
      if (v36 == 0x7FFFFFFFFFFFFFFFLL)
      {
        v306 = 0;
      }
      else
      {
        v306 = objc_msgSend_objectAtIndex_(v303, v34, v36, v35);
      }
      objc_msgSend__fixSendingItemDateAndSortID_(self, v34, (uint64_t)v10, v35);
      objc_msgSend__persistSortIDFromReplacedItem_toItem_(self, v37, (uint64_t)v306, (uint64_t)v10);
      uint64_t v41 = objc_msgSend_chatStyle(self, v38, v39, v40);
      objc_msgSend__handleItem_forChatStyle_updateReplyCounts_(self, v42, (uint64_t)v10, v41, v6);
      if (objc_msgSend_associatedMessageType(v10, v43, v44, v45) == 2)
      {
        uint64_t v49 = objc_msgSend__items(self, v46, v47, v48);
        if (v36 - 1 >= (unint64_t)objc_msgSend_count(v49, v50, v51, v52))
        {
          uint64_t v59 = 0;
        }
        else
        {
          uint64_t v56 = objc_msgSend__items(self, v53, v54, v55);
          uint64_t v59 = objc_msgSend_objectAtIndex_(v56, v57, v36 - 1, v58);
        }
        if (objc_msgSend_associatedMessageType(v59, v60, v61, v62) == 3)
        {
          uint64_t v66 = objc_msgSend_pluginSessionGUID(v59, v63, v64, v65);
          uint64_t v70 = objc_msgSend_pluginSessionGUID(v10, v67, v68, v69);
          int isEqualToString = objc_msgSend_isEqualToString_(v66, v71, (uint64_t)v70, v72);

          if (isEqualToString)
          {
            uint64_t v77 = objc_msgSend_guid(v59, v74, v75, v76);
            uint64_t v80 = objc_msgSend_messageForGUID_(self, v78, (uint64_t)v77, v79);
            uint64_t v84 = objc_msgSend__imMessageItem(v80, v81, v82, v83);

            objc_msgSend__handleIncomingItem_updateRecipient_suppressNotification_updateReplyCounts_(self, v85, (uint64_t)v84, v305, v7, v6);
          }
        }
      }
      id v88 = objc_msgSend_message(v306, v46, v47, v48);
      if (v88) {
        objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1C9E8], v86, (uint64_t)v19, v87, @"__kIMChatValueKey", v88, @"__kIMChatOldValueKey", 0);
      }
      else {
      v304 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1C9E8], v86, (uint64_t)v19, v87, @"__kIMChatValueKey", 0);
      }
      uint64_t v92 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v89, v90, v91);
      objc_msgSend_postNotificationName_object_userInfo_(v92, v93, @"__kIMChatMessageDidChangeNotification", (uint64_t)self, v304);

      uint64_t v97 = objc_msgSend_error(v88, v94, v95, v96);
      if (v97)
      {
      }
      else
      {
        uint64_t v104 = objc_msgSend_error(v19, v98, v99, v100);
        BOOL v105 = v104 == 0;

        if (!v105)
        {
          uint64_t v106 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1C9E8], v101, (uint64_t)v19, v103, @"__kIMChatValueKey", 0);

          __int16 v110 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v107, v108, v109);
          objc_msgSend_postNotificationName_object_userInfo_(v110, v111, @"__kIMChatMessageSendFailedNotification", (uint64_t)self, v106);

          objc_msgSend_refreshServiceForSending(self, v112, v113, v114);
          v304 = (void *)v106;
        }
      }
      if (objc_msgSend_isRead(v88, v101, v102, v103)) {
        int v118 = objc_msgSend_isRead(v19, v115, v116, v117) ^ 1;
      }
      else {
        int v118 = 0;
      }
      char isFinished = objc_msgSend_isFinished(v88, v115, v116, v117);
      if (v36) {
        char v123 = isFinished;
      }
      else {
        char v123 = 0;
      }
      if (v123)
      {
        int v124 = 0;
        if (!v19) {
          goto LABEL_44;
        }
      }
      else
      {
        int v124 = objc_msgSend_isFinished(v19, v120, v121, v122);
        if (!v19) {
          goto LABEL_44;
        }
      }
      if (!objc_msgSend_isFromMe(v19, v120, v121, v122))
      {
        char v185 = objc_msgSend_isRead(v19, v120, v121, v122);
        int isCancelTypingMessage = objc_msgSend_isCancelTypingMessage(v19, v186, v187, v188);
        char v128 = isCancelTypingMessage;
        if ((v185 & 1) == 0 && ((isCancelTypingMessage | (v118 | v124) ^ 1) & 1) == 0 && !v7)
        {
          uint64_t v190 = objc_msgSend_dictionaryWithObjectsAndKeys_(MEMORY[0x1E4F1C9E8], v125, (uint64_t)v19, v127, @"__kIMChatValueKey", 0);

          __int16 v194 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v191, v192, v193);
          objc_msgSend_postNotificationName_object_userInfo_(v194, v195, @"__kIMChatMessageReceivedNotification", (uint64_t)self, v190);

          char v128 = 0;
          v304 = (void *)v190;
        }
LABEL_45:
        if (objc_msgSend_type(v10, v125, v126, v127) == 4)
        {
          uint64_t v132 = objc_msgSend_sender(v10, v129, v130, v131);
          objc_msgSend__updateLocationShareItemsForSender_(self, v133, (uint64_t)v132, v134);
        }
        uint64_t v135 = objc_msgSend_momentSharePresentationCache(self, v129, v130, v131);
        objc_msgSend_registerMomentShareItemForMessage_(v135, v136, (uint64_t)v19, v137);

        if ((objc_msgSend_isRead(v88, v138, v139, v140) & 1) != 0
          || !objc_msgSend_isRead(v19, v141, v142, v143))
        {
          int v301 = 0;
        }
        else
        {
          int v301 = objc_msgSend_isFromMe(v19, v141, v142, v143);
        }
        if (objc_msgSend_wasDataDetected(v88, v141, v142, v143)) {
          int v302 = 0;
        }
        else {
          int v302 = objc_msgSend_wasDataDetected(v19, v144, v145, v146);
        }
        if ((objc_msgSend_isDelivered(v88, v144, v145, v146) & 1) != 0
          || !objc_msgSend_isDelivered(v19, v147, v148, v149))
        {
          int v300 = 0;
        }
        else
        {
          int v300 = objc_msgSend_isFromMe(v19, v147, v148, v149);
        }
        if ((objc_msgSend_isPlayed(v88, v147, v148, v149) & 1) != 0
          || !objc_msgSend_isPlayed(v19, v150, v151, v152))
        {
          int v299 = 0;
        }
        else
        {
          int v299 = objc_msgSend_isFromMe(v19, v153, v154, v155);
        }

        if ((v128 & 1) != 0 || objc_msgSend_type(v10, v156, v157, v158)) {
          goto LABEL_64;
        }
        if (objc_msgSend_isFromMe(v19, v156, v157, v158)) {
          self->_didSendAFinishedMessage = 1;
        }
        v199 = objc_msgSend_service(self->_account, v196, v197, v198);
        v206 = objc_msgSend_iMessageService(IMServiceImpl, v200, v201, v202);
        if (v199 == v206)
        {
          v207 = objc_msgSend_sender(v19, v203, v204, v205);
          v211 = objc_msgSend_account(v207, v208, v209, v210);
          v215 = objc_msgSend_service(v211, v212, v213, v214);
          v219 = objc_msgSend_iMessageService(IMServiceImpl, v216, v217, v218);
          BOOL v298 = v215 != v219;
        }
        else
        {
          BOOL v298 = 0;
        }

        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_isTypingMessage(v10, v220, v221, v222))
        {
          v223 = objc_msgSend_service(self->_account, v220, v221, v222);
          v227 = objc_msgSend_smsService(IMServiceImpl, v224, v225, v226);
          BOOL v297 = v223 == v227;
        }
        else
        {
          BOOL v297 = 0;
        }
        v228 = objc_msgSend_service(self->_account, v220, v221, v222);
        v235 = objc_msgSend_smsService(IMServiceImpl, v229, v230, v231);
        if (v228 == v235)
        {
          v296 = objc_msgSend_sender(v19, v232, v233, v234);
          v295 = objc_msgSend_account(v296, v237, v238, v239);
          v294 = objc_msgSend_service(v295, v240, v241, v242);
          v249 = objc_msgSend_iMessageService(IMServiceImpl, v243, v244, v245);
          if (v294 == v249)
          {
            v250 = objc_msgSend_guid(v19, v246, v247, v248);
            v293 = objc_msgSend_lastMessage(self, v251, v252, v253);
            v257 = objc_msgSend_guid(v293, v254, v255, v256);
            int v260 = objc_msgSend_isEqualToString_(v250, v258, (uint64_t)v257, v259);

            int v236 = v260 ^ 1;
          }
          else
          {
            int v236 = 0;
          }
        }
        else
        {
          int v236 = 0;
        }

        if (objc_msgSend_isInterworking(self, v261, v262, v263))
        {
          v267 = objc_msgSend_service(v10, v264, v265, v266);
          v271 = objc_msgSend_interworkingService(self, v268, v269, v270);
          int v274 = objc_msgSend_isEqualToString_(v267, v272, (uint64_t)v271, v273);

          int v275 = v274 ^ 1;
        }
        else
        {
          int v275 = 1;
        }
        if (((objc_msgSend_isFromMe(v10, v264, v265, v266) | v302) & 1) == 0
          && (objc_msgSend_canHaveMultipleParticipants(self, v276, v277, v278) & 1) == 0)
        {
          v281 = objc_msgSend_sender(v19, v276, v279, v280);
          v285 = objc_msgSend_recipient(self, v282, v283, v284);
          if ((objc_msgSend_isEqual_(v281, v286, (uint64_t)v285, v287) | v300 | v301 | v299 | v298 | v297) == 1)
          {
          }
          else
          {

            if ((v275 & v305 & ~v236) != 0)
            {
              v290 = objc_msgSend_sender(v19, v276, v288, v289);
              objc_msgSend_setRecipient_(self, v291, (uint64_t)v290, v292);

LABEL_64:
              LOBYTE(v159) = 1;
LABEL_65:
              v160 = objc_msgSend_service(v10, v156, v157, v158);
              id v164 = objc_msgSend_iMessageService(IMServiceImpl, v161, v162, v163);
              id v168 = objc_msgSend_internalName(v164, v165, v166, v167);
              int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v160, v169, (uint64_t)v168, v170);

              if (isEqualToIgnoringCase)
              {
                long long v175 = objc_msgSend_chatRegistry(self, v172, v173, v174);
                objc_msgSend__setChatHasCommunicatedOveriMessage_(v175, v176, (uint64_t)self, v177);
              }
              objc_msgSend__invalidateDowngradeState(self, v172, v173, v174);
              objc_msgSend_updateWatermarks(self, v178, v179, v180);
              objc_msgSend__setStartSendProgressImmediatelyIfNecessary(self, v181, v182, v183);

              char v18 = v159 & ~v128;
              goto LABEL_68;
            }
          }
        }
        int v159 = objc_msgSend__itemsAreRelayItemsFromMeWithServiceSwitch_otherItem_(self, v276, (uint64_t)v10, (uint64_t)v306) & v275;
        goto LABEL_65;
      }
LABEL_44:
      char v128 = objc_msgSend_isCancelTypingMessage(v19, v120, v121, v122);
      goto LABEL_45;
    }
  }
  char v18 = 0;
LABEL_69:

  return v18;
}

- (void)_setStartSendProgressImmediatelyIfNecessary
{
  if (objc_msgSend__shouldPinUnsentMessagesToBottom(self, a2, v2, v3))
  {
    BOOL v8 = objc_msgSend__items(self, v5, v6, v7);
    objc_msgSend_assignSortIDsToItems_shouldRecalculateSortIDForAllMessages_(self, v9, (uint64_t)v8, 0);

    if (objc_msgSend_startSendProgressImmediately(self->_sendProgress, v10, v11, v12))
    {
      uint64_t v13 = objc_msgSend__items(self, v5, v6, v7);
      uint64_t v17 = objc_msgSend_lastObject(v13, v14, v15, v16);
      char v21 = objc_msgSend_unsentIsFromMeItem(v17, v18, v19, v20);

      if ((v21 & 1) == 0) {
        objc_msgSend_setStartSendProgressImmediately_(self->_sendProgress, v5, 0, v7);
      }
    }
  }
  if (objc_msgSend_isStewieChat(self, v5, v6, v7)) {
    objc_msgSend_setStartSendProgressImmediately_(self->_sendProgress, v22, 1, v24);
  }
  if (objc_msgSend__isSatelliteServiceActive(self, v22, v23, v24))
  {
    sendProgress = self->_sendProgress;
    objc_msgSend_setStartSendProgressImmediately_(sendProgress, v25, 1, v26);
  }
}

- (BOOL)_isSatelliteServiceActive
{
  id v5 = objc_msgSend_sharedInstance(IMChorosMonitor, a2, v2, v3);
  int isSatelliteConnectionActive = objc_msgSend_isSatelliteConnectionActive(v5, v6, v7, v8);

  if (!isSatelliteConnectionActive) {
    return 0;
  }
  uint64_t v13 = objc_msgSend_account(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_service(v13, v14, v15, v16);
  uint64_t v24 = objc_msgSend_iMessageLiteService(IMServiceImpl, v18, v19, v20);
  if (v17 == v24)
  {
    BOOL v34 = 1;
  }
  else
  {
    uint64_t v25 = objc_msgSend_account(self, v21, v22, v23);
    uint64_t v29 = objc_msgSend_service(v25, v26, v27, v28);
    uint64_t v33 = objc_msgSend_satelliteSMSService(IMServiceImpl, v30, v31, v32);
    BOOL v34 = v29 == v33;
  }
  return v34;
}

- (void)_participant:(id)a3 statusChanged:(int)a4
{
  uint64_t v4 = *(void *)&a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a3;
  uint64_t v9 = objc_msgSend_arrayWithObjects_count_(v6, v8, (uint64_t)&v11, 1);

  objc_msgSend__participants_statusChanged_(self, v10, (uint64_t)v9, v4, v11, v12);
}

- (void)_participant:(id)a3 statusChanged:(int)a4 postNotification:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a4;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  uint64_t v8 = (void *)MEMORY[0x1E4F1C978];
  id v9 = a3;
  id v11 = objc_msgSend_arrayWithObjects_count_(v8, v10, (uint64_t)&v13, 1);

  objc_msgSend__participants_statusChanged_postNotification_(self, v12, (uint64_t)v11, v6, v5, v13, v14);
}

- (void)_participants:(id)a3 statusChanged:(int)a4
{
}

- (void)_showErrorMessage:(id)a3
{
  uint64_t v4 = (objc_class *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 alloc];
  id v10 = (id)objc_msgSend_initWithObjectsAndKeys_(v6, v7, (uint64_t)v5, v8, @"__kIMChatValueKey", 0);

  objc_msgSend__postNotification_userInfo_(self, v9, @"__kIMChatErrorDidOccurNotification", (uint64_t)v10);
}

- (id)_performQueryWithKey:(id)a3 loadImmediately:(BOOL)a4 block:(id)a5 completion:(id)a6
{
  BOOL v8 = a4;
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  objc_msgSend__validateChatRegistrationWithRegistry(self, v13, v14, v15);
  int v16 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v16)
    {
      uint64_t v20 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = self;
        _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Initiate query %@ for chat: %@", buf, 0x16u);
      }
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    uint64_t v36 = sub_1A4B3452C;
    uint64_t v37 = sub_1A4B3437C;
    id v38 = 0;
    char v21 = objc_msgSend_sharedInstance(IMDaemonController, v17, v18, v19);
    uint64_t v25 = objc_msgSend_queryController(v21, v22, v23, v24);
    v32[0] = MEMORY[0x1E4F143A8];
    v32[1] = 3221225472;
    v32[2] = sub_1A4BD7954;
    v32[3] = &unk_1E5B7D5A0;
    BOOL v34 = buf;
    id v33 = v11;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1A4BD79C0;
    v30[3] = &unk_1E5B7D5C8;
    id v31 = v12;
    objc_msgSend_performQueryWithKey_expectsSynchronousResult_block_completionHandler_(v25, v26, (uint64_t)v10, v8, v32, v30);

    id v27 = *(id *)(*(void *)&buf[8] + 40);
    _Block_object_dispose(buf, 8);
  }
  else
  {
    if (v16)
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = v10;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = 0;
        _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Attempted to initiate query with nil query block for key: %@ chat: %@", buf, 0x16u);
      }
    }
    id v27 = 0;
  }

  return v27;
}

- (id)_performQueryWithKey:(id)a3 loadImmediately:(BOOL)a4 block:(id)a5
{
  return (id)objc_msgSend__performQueryWithKey_loadImmediately_block_completion_(self, a2, (uint64_t)a3, a4, a5, 0);
}

- (void)endListeningToAttributionChanges
{
  objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], a2, v2, v3);
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_removeObserver_name_object_(v6, v5, (uint64_t)self, @"__kIMBalloonPluginAttributionChangedNotification", 0);
}

- (void)beginListeningToAttributionChanges
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = objc_msgSend_chatItems(self, a2, v2, v3, 0);
  uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v6, (uint64_t)&v30, (uint64_t)v34, 16);
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v31;
    uint64_t v10 = *MEMORY[0x1E4F6CC18];
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v31 != v9) {
          objc_enumerationMutation(v5);
        }
        id v12 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v14 = v12;
          uint64_t v18 = objc_msgSend_bundleID(v14, v15, v16, v17);
          int v21 = objc_msgSend_containsString_(v18, v19, v10, v20);

          if (!v21)
          {
            objc_msgSend__handleBalloonPluginAttributionChanged(self, v22, v23, v24);

            goto LABEL_13;
          }
        }
      }
      uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v5, v13, (uint64_t)&v30, (uint64_t)v34, 16);
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_13:

  uint64_t v28 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v25, v26, v27);
  objc_msgSend_addObserver_selector_name_object_(v28, v29, (uint64_t)self, (uint64_t)sel__handleBalloonPluginAttributionChanged, @"__kIMBalloonPluginAttributionChangedNotification", 0);
}

- (void)_handleBalloonPluginAttributionChanged
{
  objc_msgSend_setNeedsDeferredUpdateWithReason_(self->_chatItemsUpdater, a2, @"BalloonPluginAttributionChanged", v2);
}

- (void)_engroupParticipantsUpdated
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "Posting IMChatEngroupFinishedUpdatingNotification from IMChat", v5, 2u);
    }
  }
  objc_msgSend__postNotification_userInfo_(self, v3, @"__kIMChatEngroupFinishedUpdatingNotification", 0);
}

- (void)_validateChatRegistrationWithRegistry
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_isUnregistered(self, a2, v2, v3) && IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      uint64_t v7 = self;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "***WARNING*** Attempting to use a chat that has been unregistered: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (id)participantsWithState:(unint64_t)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  int v6 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v7 = objc_msgSend_count(self->_participants, a2, a3, v3);
  uint64_t v10 = objc_msgSend_arrayWithCapacity_(v6, v8, v7, v9);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = self->_participants;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v12, (uint64_t)&v27, (uint64_t)v31, 16);
  if (v13)
  {
    uint64_t v16 = v13;
    uint64_t v17 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v16; ++i)
      {
        if (*(void *)v28 != v17) {
          objc_enumerationMutation(v11);
        }
        uint64_t v19 = *(void *)(*((void *)&v27 + 1) + 8 * i);
        unint64_t v20 = objc_msgSend_stateForParticipant_(self, v14, v19, v15, (void)v27);
        if (v20 <= 1) {
          uint64_t v21 = 1;
        }
        else {
          uint64_t v21 = v20;
        }
        if ((v21 & a3) != 0) {
          objc_msgSend_addObject_(v10, v14, v19, v15);
        }
      }
      uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v11, v14, (uint64_t)&v27, (uint64_t)v31, 16);
    }
    while (v16);
  }

  uint64_t v25 = objc_msgSend_copy(v10, v22, v23, v24);

  return v25;
}

- (void)_clearCachedIdentifier
{
  identifier = self->_identifier;
  self->_identifier = 0;

  objc_msgSend_setGroupChatIdentifierUppercase_(self, v4, 0, v5);
}

- (unint64_t)overallChatStatus
{
  if (objc_msgSend_chatStyle(self, a2, v2, v3) != 45) {
    return 1;
  }
  uint64_t v8 = objc_msgSend_recipient(self, v5, v6, v7);
  unint64_t v12 = objc_msgSend_status(v8, v9, v10, v11);

  return v12;
}

- (void)setRoomName:(id)a3
{
  uint64_t v5 = (NSString *)a3;
  if (self->_roomName != v5 && self->_style != 45)
  {
    uint64_t v9 = v5;
    objc_msgSend__clearCachedIdentifier(self, v6, v7, v8);
    objc_storeStrong((id *)&self->_roomName, a3);
    uint64_t v5 = v9;
  }
}

- (void)_setDisplayName:(id)a3
{
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = IMSharedHelperTruncatedGroupDisplayName();
  p_displayName = &self->_displayName;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
  {
    if (self->_style != 45
      || (objc_msgSend_isBusinessChat(self, v6, v7, v8) & 1) != 0
      || (objc_msgSend_isStewieChat(self, v6, v9, v8) & 1) != 0
      || (objc_msgSend_rcsService(IMService, v6, v10, v8),
          uint64_t v11 = objc_claimAutoreleasedReturnValue(),
          int hasMessageFromService = objc_msgSend_hasMessageFromService_(self, v12, (uint64_t)v11, v13),
          v11,
          hasMessageFromService))
    {
      uint64_t v15 = (uint64_t)*p_displayName;
      if (!*p_displayName)
      {
        uint64_t v16 = objc_msgSend_trimmedString(v4, v6, 0, v8);
        uint64_t v20 = objc_msgSend_length(v16, v17, v18, v19);

        if (!v20) {
          goto LABEL_17;
        }
        uint64_t v15 = (uint64_t)*p_displayName;
      }
      if ((objc_msgSend_isEqualToString_(v4, v6, v15, v8) & 1) == 0)
      {
        uint64_t v24 = (void *)MEMORY[0x1E4F6E628];
        uint64_t v25 = objc_msgSend_businessHandle(self, v21, v22, v23);
        long long v29 = objc_msgSend_ID(v25, v26, v27, v28);
        uint64_t v32 = objc_msgSend_placeholderNameForBrandURI_(v24, v30, (uint64_t)v29, v31);
        int isEqualToString = objc_msgSend_isEqualToString_(v4, v33, (uint64_t)v32, v34);

        if (!isEqualToString || (objc_msgSend_isBusinessChat(self, v36, v37, v38) & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v42 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              uint64_t v43 = *p_displayName;
              int v50 = 138412546;
              uint64_t v51 = v43;
              __int16 v52 = 2112;
              uint64_t v53 = v4;
              _os_log_impl(&dword_1A4AF7000, v42, OS_LOG_TYPE_INFO, "Changing display name from %@ to %@", (uint8_t *)&v50, 0x16u);
            }
          }
          objc_msgSend__clearCachedIdentifier(self, v39, v40, v41);
          objc_storeStrong((id *)&self->_displayName, v4);
          uint64_t v47 = objc_msgSend_chatRegistry(self, v44, v45, v46);
          objc_msgSend__chat_updateDisplayName_(v47, v48, (uint64_t)self, (uint64_t)v4);

          objc_msgSend__postNotification_userInfo_(self, v49, @"__kIMChatDisplayNameChangedNotification", 0);
        }
      }
    }
  }
LABEL_17:
}

- (void)_updateDisplayName:(id)a3
{
}

- (void)_updateDisplayName:(id)a3 sender:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
  {
    if (self->_style != 45
      || (objc_msgSend_isStewieChat(self, v9, v10, v11) & 1) != 0
      || (objc_msgSend_rcsService(IMService, v12, v13, v14),
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          int hasMessageFromService = objc_msgSend_hasMessageFromService_(self, v16, (uint64_t)v15, v17),
          v15,
          hasMessageFromService))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          displayName = self->_displayName;
          *(_DWORD *)buf = 138412546;
          long long v30 = displayName;
          __int16 v31 = 2112;
          id v32 = v7;
          _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "Updating display name from %@ to %@", buf, 0x16u);
        }
      }
      objc_msgSend__clearCachedIdentifier(self, v19, v20, v21);
      objc_storeStrong((id *)&self->_displayName, a3);
      if (v8)
      {
        uint64_t v27 = @"sender";
        id v28 = v8;
        uint64_t v25 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v24, (uint64_t)&v28, (uint64_t)&v27, 1);
        objc_msgSend__postNotification_userInfo_(self, v26, @"__kIMChatDisplayNameChangedNotification", (uint64_t)v25);
      }
      else
      {
        uint64_t v25 = 0;
        objc_msgSend__postNotification_userInfo_(self, v24, @"__kIMChatDisplayNameChangedNotification", 0);
      }
    }
  }
}

- (void)setDisplayName:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      displayName = self->_displayName;
      int v13 = 138412802;
      uint64_t v14 = self;
      __int16 v15 = 2112;
      uint64_t v16 = displayName;
      __int16 v17 = 2112;
      id v18 = v4;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "[%@]Request to change display name from %@ to %@", (uint8_t *)&v13, 0x20u);
    }
  }
  if (objc_msgSend_joinState(self, v5, v6, v7))
  {
    objc_msgSend__setDisplayName_(self, v10, (uint64_t)v4, v11);
  }
  else if (IMOSLoggingEnabled())
  {
    unint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      LOWORD(v13) = 0;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Not changing display name because we're no longer in the chat", (uint8_t *)&v13, 2u);
    }
  }
}

- (id)_participantListStringForNames:(id)a3 visibleNameCount:(int64_t)a4
{
  id v5 = a3;
  if (objc_msgSend_count(v5, v6, v7, v8) >= (unint64_t)a4) {
    int64_t v12 = a4 & ~(a4 >> 63);
  }
  else {
    int64_t v12 = objc_msgSend_count(v5, v9, v10, v11);
  }
  uint64_t v16 = objc_msgSend_count(v5, v9, v10, v11) - v12;
  if (v16 == 1)
  {
    int64_t v12 = objc_msgSend_count(v5, v13, v14, v15);
    uint64_t v16 = 0;
  }
  __int16 v17 = objc_msgSend_subarrayWithRange_(v5, v13, 0, v12);
  id v18 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v23 = objc_msgSend_initWithArray_(v18, v19, (uint64_t)v17, v20);
  if (v16 >= 1)
  {
    uint64_t v24 = NSString;
    uint64_t v25 = sub_1A4C0ACE4();
    uint64_t v27 = objc_msgSend_localizedStringForKey_value_table_(v25, v26, @"N_OTHERS", (uint64_t)&stru_1EF8E78C8, @"IMCoreLocalizable");
    long long v30 = objc_msgSend_localizedStringWithFormat_(v24, v28, (uint64_t)v27, v29, v16);

    objc_msgSend_addObject_(v23, v31, (uint64_t)v30, v32);
  }
  uint64_t v33 = objc_msgSend_localizedStringByJoiningStrings_(MEMORY[0x1E4F28DF8], v21, (uint64_t)v23, v22);

  return v33;
}

- (void)_updateLastAddressedHandleID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0
    && (objc_msgSend_isEqualToIgnoringCase_(v5, v6, *MEMORY[0x1E4F6C7B8], v7) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        lastAddressedHandleID = self->_lastAddressedHandleID;
        int v11 = 138412802;
        int64_t v12 = self;
        __int16 v13 = 2112;
        uint64_t v14 = lastAddressedHandleID;
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "[%@]Request from imagent to set client last addressed handle from %@ to %@", (uint8_t *)&v11, 0x20u);
      }
    }
    objc_storeStrong((id *)&self->_lastAddressedHandleID, a3);
    self->_senderBlackholeWarningStatus = 0;
    objc_msgSend__postNotification_userInfo_(self, v10, @"__kIMChatLastAddressedHandleChangedNotification", 0);
  }
}

- (void)setLastAddressedHandleID:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      lastAddressedHandleID = self->_lastAddressedHandleID;
      int v26 = 138412802;
      uint64_t v27 = self;
      __int16 v28 = 2112;
      uint64_t v29 = lastAddressedHandleID;
      __int16 v30 = 2112;
      id v31 = v5;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "[%@]Request from client to update client/imagent last addressed handle from %@ to %@", (uint8_t *)&v26, 0x20u);
    }
  }
  p_lastAddressedHandleID = (id *)&self->_lastAddressedHandleID;
  if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0
    && (objc_msgSend_isEqualToIgnoringCase_(v5, v9, *MEMORY[0x1E4F6C7B8], v10) & 1) == 0)
  {
    if ((IMSharedHelperDeviceHasMultipleSubscriptions() & 1) != 0
      || *p_lastAddressedHandleID
      || (objc_msgSend_trimmedString(v5, v11, v12, v13),
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          BOOL v18 = objc_msgSend_length(v14, v15, v16, v17) == 0,
          v14,
          !v18))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          uint64_t v20 = (IMChat *)*p_lastAddressedHandleID;
          int v26 = 138412546;
          uint64_t v27 = v20;
          __int16 v28 = 2112;
          uint64_t v29 = (NSString *)v5;
          _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Changing client last addressed handle from %@ to %@", (uint8_t *)&v26, 0x16u);
        }
      }
      objc_storeStrong(p_lastAddressedHandleID, a3);
      self->_senderBlackholeWarningStatus = 0;
      uint64_t v24 = objc_msgSend_chatRegistry(self, v21, v22, v23);
      objc_msgSend__chat_updateLastAddressedHandle_(v24, v25, (uint64_t)self, (uint64_t)v5);
    }
  }
}

- (void)_updateLastAddressedSIMID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (objc_msgSend_length(v5, v6, v7, v8) && (IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        lastAddressedSIMID = self->_lastAddressedSIMID;
        int v11 = 138412802;
        uint64_t v12 = self;
        __int16 v13 = 2112;
        uint64_t v14 = lastAddressedSIMID;
        __int16 v15 = 2112;
        id v16 = v5;
        _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "[%@]Request from imagent to set client last addressed sim ID from %@ to %@", (uint8_t *)&v11, 0x20u);
      }
    }
    objc_storeStrong((id *)&self->_lastAddressedSIMID, a3);
  }
}

- (void)setLastAddressedSIMID:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      lastAddressedSIMID = self->_lastAddressedSIMID;
      int v27 = 138412802;
      __int16 v28 = self;
      __int16 v29 = 2112;
      __int16 v30 = lastAddressedSIMID;
      __int16 v31 = 2112;
      id v32 = v5;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "[%@]Request from client to update client/imagent last addressed sim ID from %@ to %@", (uint8_t *)&v27, 0x20u);
    }
  }
  if (objc_msgSend_length(v5, v6, v7, v8))
  {
    p_lastAddressedSIMID = &self->_lastAddressedSIMID;
    if ((IMSharedHelperAreObjectsLogicallySame() & 1) == 0)
    {
      if (*p_lastAddressedSIMID
        || (objc_msgSend_trimmedString(v5, v12, v13, v14),
            __int16 v15 = objc_claimAutoreleasedReturnValue(),
            BOOL v19 = objc_msgSend_length(v15, v16, v17, v18) == 0,
            v15,
            !v19))
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            uint64_t v21 = (IMChat *)*p_lastAddressedSIMID;
            int v27 = 138412546;
            __int16 v28 = v21;
            __int16 v29 = 2112;
            __int16 v30 = (NSString *)v5;
            _os_log_impl(&dword_1A4AF7000, v20, OS_LOG_TYPE_INFO, "Changing client last addressed sim ID from %@ to %@", (uint8_t *)&v27, 0x16u);
          }
        }
        objc_storeStrong((id *)&self->_lastAddressedSIMID, a3);
        uint64_t v25 = objc_msgSend_chatRegistry(self, v22, v23, v24);
        objc_msgSend__chat_updateLastAddressedSIMID_(v25, v26, (uint64_t)self, (uint64_t)v5);
      }
    }
  }
}

- (NSString)deviceIndependentID
{
  if (objc_msgSend_isGroupChat(self, a2, v2, v3)) {
    objc_msgSend_groupID(self, v5, v6, v7);
  }
  else {
  uint64_t v8 = objc_msgSend_persistentID(self, v5, v6, v7);
  }

  return (NSString *)v8;
}

- (NSString)pinningIdentifier
{
  if (objc_msgSend_isGroupChat(self, a2, v2, v3) && objc_msgSend_isSMS(self, v5, v6, v7))
  {
    uint64_t v8 = objc_msgSend_chatRegistry(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_participants(self, v9, v10, v11);
    uint64_t v14 = objc_msgSend__sortedParticipantIDHashForParticipants_usesPersonCentricID_(v8, v13, (uint64_t)v12, 0);
  }
  else
  {
    uint64_t v14 = objc_msgSend_deviceIndependentID(self, v5, v6, v7);
  }

  return (NSString *)v14;
}

- (NSString)identityHash
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v46 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  uint64_t v7 = objc_msgSend_participants(self, v4, v5, v6, 0);
  uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v46, (uint64_t)v50, 16);
  if (v9)
  {
    uint64_t v13 = v9;
    uint64_t v14 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v47 != v14) {
          objc_enumerationMutation(v7);
        }
        uint64_t v18 = objc_msgSend_ID(*(void **)(*((void *)&v46 + 1) + 8 * i), v10, v11, v12);
        if (v18) {
          objc_msgSend_addObject_(v3, v16, (uint64_t)v18, v17);
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v46, (uint64_t)v50, 16);
    }
    while (v13);
  }

  objc_msgSend_sortUsingSelector_(v3, v19, (uint64_t)sel_compare_, v20);
  uint64_t v24 = objc_msgSend_displayName(self, v21, v22, v23);
  if (v24)
  {
    __int16 v28 = (void *)v24;
    __int16 v29 = objc_msgSend_displayName(self, v25, v26, v27);
    char isEqualToString = objc_msgSend_isEqualToString_(v29, v30, (uint64_t)&stru_1EF8E78C8, v31);

    if ((isEqualToString & 1) == 0)
    {
      uint64_t v34 = objc_msgSend_displayName(self, v25, v33, v27);
      objc_msgSend_addObject_(v3, v35, (uint64_t)v34, v36);
    }
  }
  uint64_t v37 = objc_msgSend_componentsJoinedByString_(v3, v25, @",", v27);
  uint64_t v40 = objc_msgSend_dataUsingEncoding_(v37, v38, 4, v39);
  uint64_t v44 = objc_msgSend_SHA1HexString(v40, v41, v42, v43);

  return (NSString *)v44;
}

- (NSString)roomNameWithoutSuffix
{
  roomNameWithoutSuffix = self->_roomNameWithoutSuffix;
  if (roomNameWithoutSuffix) {
    goto LABEL_5;
  }
  uint64_t v5 = objc_msgSend_rangeOfString_(self->_roomName, a2, @"@", v2);
  if (v5 == 0x7FFFFFFFFFFFFFFFLL
    || (uint64_t v9 = v5, v10 = (uint64_t)&v6[v5], &v6[v5] == (const char *)objc_msgSend_length(self->_roomName, v6, v7, v8)))
  {
    roomNameWithoutSuffix = self->_roomName;
LABEL_5:
    uint64_t v13 = roomNameWithoutSuffix;
    goto LABEL_6;
  }
  __int16 v15 = objc_msgSend_substringFromIndex_(self->_roomName, v11, v10, v12);
  if (objc_msgSend_length(v15, v16, v17, v18))
  {
    uint64_t v22 = objc_msgSend_account(self, v19, v20, v21);
    uint64_t v26 = objc_msgSend_server(v22, v23, v24, v25);

    if (objc_msgSend_length(v26, v27, v28, v29)
      && (uint64_t v32 = objc_msgSend_rangeOfString_(v15, v30, (uint64_t)v26, v31), v32 != 0x7FFFFFFFFFFFFFFFLL)
      && (uint64_t v36 = v32, &v33[v32] == (const char *)objc_msgSend_length(v15, v33, v34, v35)))
    {
      uint64_t v39 = objc_msgSend_substringToIndex_(self->_roomName, v37, v9, v38);
      uint64_t v42 = objc_msgSend_substringToIndex_(v15, v40, v36, v41);
      if (objc_msgSend_hasSuffix_(v42, v43, @".", v44))
      {
        uint64_t v48 = objc_msgSend_length(v42, v45, v46, v47);
        uint64_t v51 = objc_msgSend_substringToIndex_(v42, v49, v48 - 1, v50);

        uint64_t v42 = (void *)v51;
      }
      __int16 v52 = objc_msgSend_componentsSeparatedByString_(v42, v45, @".", v47);
      unint64_t v56 = objc_msgSend_count(v52, v53, v54, v55);

      if (v56 >= 2)
      {
        uint64_t v59 = objc_msgSend_stringByAppendingFormat_(v39, v57, @"@%@", v58, v42);

        uint64_t v39 = (void *)v59;
      }
      int v60 = self->_roomNameWithoutSuffix;
      self->_roomNameWithoutSuffix = (NSString *)v39;
      id v61 = v39;

      uint64_t v13 = self->_roomNameWithoutSuffix;
    }
    else
    {
      uint64_t v13 = self->_roomName;
    }
  }
  else
  {
    uint64_t v13 = self->_roomName;
  }

LABEL_6:

  return v13;
}

- (BOOL)hasUnhandledInvitation
{
  return self->_isFirstMessageInvitation && !self->_wasInvitationHandled;
}

- (void)acceptInvitation
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      __int16 v15 = self;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_DEBUG, "chat: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  if (objc_msgSend_joinState(self, v3, v4, v5) != 3)
  {
    objc_msgSend__setJoinState_(self, v7, 2, v8);
    uint64_t v12 = objc_msgSend_chatRegistry(self, v9, v10, v11);
    objc_msgSend__chat_joinWithProperties_(v12, v13, (uint64_t)self, 0);

    self->_wasInvitationHandled = 1;
  }
}

- (void)declineInvitation
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      int v10 = 138412290;
      uint64_t v11 = self;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_DEBUG, "chat: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v7 = objc_msgSend_chatRegistry(self, v3, v4, v5);
  objc_msgSend__chat_declineInvitation_(v7, v8, (uint64_t)self, v9);

  self->_wasInvitationHandled = 1;
}

- (void)_sendMessage:(id)a3 adjustingSender:(BOOL)a4 shouldQueue:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  objc_msgSend_account(self, v9, v10, v11);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__sendMessage_withAccount_adjustingSender_shouldQueue_(self, v12, (uint64_t)v8, (uint64_t)v13, v6, v5);
}

- (void)_sendMessage:(id)a3 withAccount:(id)a4 adjustingSender:(BOOL)a5 shouldQueue:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v7 = a5;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (IMChat *)a3;
  uint64_t v11 = (IMChat *)a4;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      int v14 = @"NO";
      *(_DWORD *)buf = 138412802;
      int v60 = self;
      __int16 v61 = 2112;
      if (v7) {
        int v14 = @"YES";
      }
      uint64_t v62 = v10;
      __int16 v63 = 2112;
      uint64_t v64 = (IMChat *)v14;
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_DEBUG, "chat: %@   message: %@  adjusting sender: %@", buf, 0x20u);
    }
  }
  objc_msgSend__updateSenderForMessageIfNeeded_adjustingSender_withAccount_(self, v12, (uint64_t)v10, v7, v11);
  objc_msgSend__updateBizIntentForMessageIfNeeded_(self, v15, (uint64_t)v10, v16);
  objc_msgSend__updateLocaleForMessageIfNeeded_(self, v17, (uint64_t)v10, v18);
  objc_msgSend__updateTypingGUIDForMessageIfNeeded_(self, v19, (uint64_t)v10, v20);
  objc_msgSend__updateWalletBreadcrumbingAssociationForMessageIfNeeded_(self, v21, (uint64_t)v10, v22);
  id v58 = 0;
  unint64_t v25 = objc_msgSend_keyTransparencyStatusForAffectedHandles_(self, v23, (uint64_t)&v58, v24);
  id v26 = v58;
  objc_msgSend_setIsKeyTransparencyVerifiedMessage_(v10, v27, (v25 < 9) & (0x130u >> v25), v28);
  if (objc_msgSend__updateJoinStateWithMessageIfNeeded_(self, v29, (uint64_t)v10, v30))
  {
    objc_msgSend__updatePayloadForMessageIfNeeded_(self, v31, (uint64_t)v10, v33);
    if (IMOSLoggingEnabled())
    {
      uint64_t v37 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        messagesPendingJoin = self->_messagesPendingJoin;
        *(_DWORD *)buf = 138413058;
        int v60 = v10;
        __int16 v61 = 2112;
        uint64_t v62 = v11;
        __int16 v63 = 2112;
        uint64_t v64 = self;
        __int16 v65 = 2112;
        uint64_t v66 = messagesPendingJoin;
        _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "Sending message %@ to account: %@ (%@)  (Pending: %@)", buf, 0x2Au);
      }
    }
    uint64_t v39 = objc_msgSend_chatRegistry(self, v34, v35, v36);
    objc_msgSend__chat_sendMessage_withAccount_(v39, v40, (uint64_t)self, (uint64_t)v10, v11);

    objc_msgSend__refreshServiceForSendingIfNeededWithMessage_(self, v41, (uint64_t)v10, v42);
  }
  uint64_t v43 = objc_msgSend__imMessageItem(v10, v31, v32, v33);
  objc_msgSend__updateMessageItemTimeIfNeeded_(self, v44, (uint64_t)v43, v45);
  objc_msgSend__updateMessageItemStewieIfNeeded_(self, v46, (uint64_t)v43, v47);
  if (objc_msgSend_scheduleType(v10, v48, v49, v50) == 1)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v54 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        int v60 = v10;
        __int16 v61 = 2112;
        uint64_t v62 = v11;
        __int16 v63 = 2112;
        uint64_t v64 = self;
        _os_log_impl(&dword_1A4AF7000, v54, OS_LOG_TYPE_INFO, "Not updating client about scheduled message %@ to account: %@ (%@)", buf, 0x20u);
      }
    }
  }
  else if (v6)
  {
    objc_msgSend__handleIncomingItem_(self, v51, (uint64_t)v43, v53);
  }
  else if ((objc_msgSend_isTypingMessage(v10, v51, v52, v53) & 1) == 0)
  {
    v56[0] = MEMORY[0x1E4F143A8];
    v56[1] = 3221225472;
    v56[2] = sub_1A4BD9A1C;
    v56[3] = &unk_1E5B7B130;
    v56[4] = self;
    id v57 = v43;
    objc_msgSend__updateChatItemsWithReason_block_(self, v55, @"Sending message", (uint64_t)v56);
  }
}

- (NSNumber)countOfAttachmentsNotCachedLocally
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A4BD9AC4;
  v5[3] = &unk_1E5B7D550;
  v5[4] = self;
  id v3 = (id)objc_msgSend__performQueryWithKey_loadImmediately_block_(self, a2, @"CountAttachmentsNotCachedLocally", 1, v5);
  return self->_countOfAttachmentsNotCachedLocally;
}

- (NSArray)attachments
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1A4BD9CA8;
  v13[3] = &unk_1E5B7D550;
  v13[4] = self;
  id v3 = (id)objc_msgSend__performQueryWithKey_loadImmediately_block_(self, a2, @"LoadAttachments", 1, v13);
  uint64_t v4 = self->_attachments;
  objc_msgSend__setAttachments_(self, v5, 0, v6);
  if (IMOSLoggingEnabled())
  {
    BOOL v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = objc_msgSend_count(v4, v8, v9, v10);
      *(_DWORD *)buf = 67109120;
      int v15 = v11;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Return %d attachments", buf, 8u);
    }
  }

  return v4;
}

- (void)cancelScheduledMessageWithGUID:(id)a3 destinations:(id)a4 cancelType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  objc_msgSend_chatRegistry(self, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__chat_cancelScheduledMessageWithGUID_destinations_cancelType_(v14, v13, (uint64_t)self, (uint64_t)v9, v8, a5);
}

- (void)editScheduledMessageItem:(id)a3 atPartIndex:(int64_t)a4 withNewPartText:(id)a5
{
  id v37 = a3;
  id v8 = a5;
  uint64_t v12 = objc_msgSend_editedPartIndexes(v37, v9, v10, v11);
  uint64_t v16 = objc_msgSend_mutableCopy(v12, v13, v14, v15);

  if (v16)
  {
    objc_msgSend_removeIndex_(v16, v17, a4, v19);
    objc_msgSend_setEditedPartIndexes_(v37, v20, (uint64_t)v16, v21);
  }
  uint64_t v22 = objc_msgSend_failedEditPartIndexes(v37, v17, v18, v19);
  id v26 = objc_msgSend_mutableCopy(v22, v23, v24, v25);

  if (v26)
  {
    objc_msgSend_removeIndex_(v26, v27, a4, v28);
    objc_msgSend_setFailedEditPartIndexes_(v37, v29, (uint64_t)v26, v30);
  }
  uint64_t v31 = objc_msgSend_editedMessageItemWithOriginalMessageItem_editedPartIndex_newPartText_(MEMORY[0x1E4F6E850], v27, (uint64_t)v37, a4, v8);
  uint64_t v35 = objc_msgSend_chatRegistry(self, v32, v33, v34);
  objc_msgSend__chat_editScheduledMessageItem_previousMessageItem_partIndex_editType_(v35, v36, (uint64_t)self, (uint64_t)v31, v37, a4, 1);
}

- (void)cancelScheduledMessageItem:(id)a3 cancelType:(unint64_t)a4
{
  id v6 = a3;
  id v9 = objc_msgSend_participantsWithState_(self, v7, 16, v8);
  uint64_t v12 = objc_msgSend___imArrayByApplyingBlock_(v9, v10, (uint64_t)&unk_1EF8E64C8, v11);

  if (a4 - 2 < 3) {
    goto LABEL_4;
  }
  if (a4 == 1)
  {
    v22[0] = MEMORY[0x1E4F143A8];
    v22[1] = 3221225472;
    v22[2] = sub_1A4BDA03C;
    v22[3] = &unk_1E5B7D618;
    v22[4] = self;
    id v23 = v6;
    id v24 = v12;
    uint64_t v25 = 1;
    objc_msgSend__updateChatItemsWithReason_block_(self, v21, @"(IMChat) Cancel scheduled message items", (uint64_t)v22);

    goto LABEL_6;
  }
  if (!a4)
  {
LABEL_4:
    uint64_t v16 = objc_msgSend_guid(v6, v13, v14, v15);
    uint64_t v19 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v17, (uint64_t)v12, v18);
    objc_msgSend_cancelScheduledMessageWithGUID_destinations_cancelType_(self, v20, (uint64_t)v16, (uint64_t)v19, a4);
  }
LABEL_6:
}

- (void)cancelScheduledMessageItem:(id)a3 atPartIndex:(int64_t)a4 shouldRetractSubject:(BOOL)a5
{
  BOOL v5 = a5;
  id v39 = a3;
  if (objc_msgSend_partCount(v39, v8, v9, v10) == 1)
  {
    objc_msgSend_cancelScheduledMessageItem_cancelType_(self, v11, (uint64_t)v39, 1);
  }
  else
  {
    uint64_t v14 = objc_msgSend_retractedPartIndexes(v39, v11, v12, v13);
    uint64_t v18 = objc_msgSend_mutableCopy(v14, v15, v16, v17);

    if (v18)
    {
      objc_msgSend_removeIndex_(v18, v19, a4, v21);
      objc_msgSend_setRetractedPartIndexes_(v39, v22, (uint64_t)v18, v23);
    }
    id v24 = objc_msgSend_failedRetractPartIndexes(v39, v19, v20, v21);
    uint64_t v28 = objc_msgSend_mutableCopy(v24, v25, v26, v27);

    if (v28)
    {
      objc_msgSend_removeIndex_(v28, v29, a4, v30);
      objc_msgSend_setFailedRetractPartIndexes_(v39, v31, (uint64_t)v28, v32);
    }
    uint64_t v33 = objc_msgSend_editedMessageItemWithOriginalMessageItem_retractedPartIndex_shouldRetractSubject_(MEMORY[0x1E4F6E850], v29, (uint64_t)v39, a4, v5);
    id v37 = objc_msgSend_chatRegistry(self, v34, v35, v36);
    objc_msgSend__chat_editScheduledMessageItem_previousMessageItem_partIndex_editType_(v37, v38, (uint64_t)self, (uint64_t)v33, v39, a4, 2);
  }
}

- (void)editScheduledMessageItems:(id)a3 scheduleType:(unint64_t)a4 deliveryTime:(id)a5
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a5;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v10 = v8;
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v11, (uint64_t)&v32, (uint64_t)v36, 16);
  if (v15)
  {
    uint64_t v16 = *(void *)v33;
    while (2)
    {
      for (uint64_t i = 0; i != v15; ++i)
      {
        if (*(void *)v33 != v16) {
          objc_enumerationMutation(v10);
        }
        uint64_t v18 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_msgSend_scheduleType(v18, v12, v13, v14) == a4)
        {
          objc_msgSend_time(v18, v19, v20, v21);
          id v22 = (id)objc_claimAutoreleasedReturnValue();
          BOOL v23 = v22 == v9;

          if (v23) {
            continue;
          }
        }

        v26[0] = MEMORY[0x1E4F143A8];
        v26[1] = 3221225472;
        v26[2] = sub_1A4BDA49C;
        v26[3] = &unk_1E5B7D618;
        id v27 = v10;
        uint64_t v28 = self;
        unint64_t v30 = a4;
        id v29 = v9;
        objc_msgSend__updateChatItemsWithReason_block_(self, v25, @"Modifying scheduled time to be immediate", (uint64_t)v26);

        goto LABEL_15;
      }
      uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v10, v12, (uint64_t)&v32, (uint64_t)v36, 16);
      if (v15) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    id v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, "editScheduledMessageItems ignoring request since all items are already of the scheduleType & deliveryTime", buf, 2u);
    }
  }
LABEL_15:
}

- (void)editScheduledMessageItem:(id)a3 scheduleType:(unint64_t)a4 deliveryTime:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (objc_msgSend_scheduleType(v8, v10, v11, v12) == 2 && objc_msgSend_scheduleState(v8, v13, v14, v15) == 2)
  {
    id v22 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v16, v17, v18);
    if (a4 == 2)
    {
      if (v9)
      {
        objc_msgSend_timeIntervalSinceNow(v9, v19, v20, v21);
        if (v23 > 0.0)
        {
          id v24 = v9;

          uint64_t v28 = objc_msgSend___im_dateWithCurrentServerTime(MEMORY[0x1E4F1C9C8], v25, v26, v27);
          objc_msgSend_setDateEdited_(v8, v29, (uint64_t)v28, v30);

          id v22 = v24;
          objc_msgSend_setTime_(v8, v31, (uint64_t)v24, v32);
LABEL_13:
          objc_msgSend_setScheduleType_(v8, v33, a4, v34);
          if (!objc_msgSend_scheduleType(v8, v38, v39, v40)) {
            objc_msgSend_setScheduleState_(v8, v41, 0, v43);
          }
          uint64_t v44 = objc_msgSend_account(self, v41, v42, v43);
          uint64_t v48 = objc_msgSend_sender(v8, v45, v46, v47);
          uint64_t v51 = objc_msgSend_imHandleWithID_(v44, v49, (uint64_t)v48, v50);

          uint64_t v55 = objc_msgSend_account(self, v52, v53, v54);
          uint64_t v59 = objc_msgSend_handle(v8, v56, v57, v58);
          uint64_t v62 = objc_msgSend_imHandleWithID_(v55, v60, (uint64_t)v59, v61);

          uint64_t v64 = objc_msgSend_messageFromIMMessageItem_sender_subject_(IMMessage, v63, (uint64_t)v8, (uint64_t)v51, v62);
          uint64_t v68 = v64;
          if (!a4)
          {
            uint64_t v69 = objc_msgSend_flags(v64, v65, v66, v67);
            objc_msgSend__updateFlags_(v68, v70, v69 & 0xFFFFFFFFFFFF7FFFLL, v71);
          }
          uint64_t v72 = objc_msgSend_context(v8, v65, v66, v67);
          if (v72)
          {
            uint64_t v76 = (void *)v72;
            uint64_t v77 = objc_msgSend_context(v8, v73, v74, v75);
            objc_opt_class();
            char isKindOfClass = objc_opt_isKindOfClass();

            if (isKindOfClass)
            {
              uint64_t v80 = objc_msgSend_context(v8, v73, v79, v75);
              objc_msgSend_setMessage_(v80, v81, (uint64_t)v68, v82);
            }
          }
          objc_msgSend_sendMessage_(self, v73, (uint64_t)v68, v75);
          objc_msgSend__handleItem_(self, v83, (uint64_t)v8, v84);

          goto LABEL_21;
        }
      }
      uint64_t v37 = IMLogHandleForCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB8B40();
      }
    }
    objc_msgSend_setTime_(v8, v19, (uint64_t)v22, v21);
    goto LABEL_13;
  }
  id v22 = IMLogHandleForCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
    sub_1A4CB8BAC(v8, (char *)v22, v35, v36);
  }
LABEL_21:
}

- (void)_updateMessageItemStewieIfNeeded:(id)a3
{
  id v9 = a3;
  if (objc_msgSend_isStewieChat(self, v4, v5, v6)) {
    objc_msgSend_setIsStewie_(v9, v7, 1, v8);
  }
}

- (void)_updateScheduledMessageTimeOffsetIfNeeded:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_scheduleType(v4, v5, v6, v7) == 2)
  {
    uint64_t v11 = objc_msgSend__items(self, v8, v9, v10);
    uint64_t v31 = 0;
    uint64_t v32 = &v31;
    uint64_t v33 = 0x3032000000;
    uint64_t v34 = sub_1A4B3452C;
    uint64_t v35 = sub_1A4B3437C;
    id v36 = 0;
    uint64_t v25 = MEMORY[0x1E4F143A8];
    uint64_t v26 = 3221225472;
    uint64_t v27 = sub_1A4BDAA34;
    uint64_t v28 = &unk_1E5B7C7F8;
    id v12 = v4;
    id v29 = v12;
    uint64_t v30 = &v31;
    objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v11, v13, 2, (uint64_t)&v25);
    uint64_t v17 = (void *)v32[5];
    if (v17)
    {
      uint64_t v18 = objc_msgSend_time(v17, v14, v15, v16, v25, v26, v27, v28);
      id v22 = objc_msgSend_dateByAddingTimeInterval_(v18, v19, v20, v21, 0.001);
      objc_msgSend_setTime_(v12, v23, (uint64_t)v22, v24);
    }
    _Block_object_dispose(&v31, 8);
  }
}

- (void)_updateMessageItemTimeIfNeeded:(id)a3
{
  id v9 = a3;
  if ((objc_msgSend__shouldPinUnsentMessagesToBottom(self, v4, v5, v6) & 1) == 0) {
    objc_msgSend__fixItemForSendingMessageTime_(self, v7, (uint64_t)v9, v8);
  }
  objc_msgSend__updateScheduledMessageTimeOffsetIfNeeded_(self, v7, (uint64_t)v9, v8);
}

- (void)_updateSenderForMessageIfNeeded:(id)a3 adjustingSender:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  objc_msgSend_account(self, v7, v8, v9);
  id v11 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__updateSenderForMessageIfNeeded_adjustingSender_withAccount_(self, v10, (uint64_t)v6, v4, v11);
}

- (void)_updateSenderForMessageIfNeeded:(id)a3 adjustingSender:(BOOL)a4 withAccount:(id)a5
{
  BOOL v6 = a4;
  id v18 = a3;
  id v7 = a5;
  id v11 = v7;
  if (v6)
  {
    uint64_t v15 = objc_msgSend_loginIMHandle(v7, v8, v9, v10);
    if (!v15)
    {
      if (objc_msgSend_isRunningPPT(IMBalloonPluginManager, v12, v13, v14))
      {
        uint64_t v15 = objc_msgSend_imHandleWithID_(v11, v12, @"test@icloud.com", v14);
        objc_msgSend__updateSender_(v18, v16, (uint64_t)v15, v17);
LABEL_7:

        goto LABEL_8;
      }
      uint64_t v15 = 0;
    }
    objc_msgSend__updateSender_(v18, v12, (uint64_t)v15, v14);
    goto LABEL_7;
  }
LABEL_8:
}

- (void)_updateBizIntentForMessageIfNeeded:(id)a3
{
  id v29 = a3;
  if (objc_msgSend_isMapKitBusinessChat(self, v4, v5, v6))
  {
    uint64_t v10 = objc_msgSend_bizIntent(self, v7, v8, v9);
    BOOL v11 = v10 == 0;
  }
  else
  {
    BOOL v11 = 1;
  }
  if ((objc_msgSend_isTypingMessage(v29, v7, v8, v9) & 1) == 0)
  {
    uint64_t v15 = objc_msgSend_associatedMessageGUID(v29, v12, v13, v14);
    uint64_t v19 = objc_msgSend_length(v15, v16, v17, v18);

    char v23 = v19 || v11;
    if ((v23 & 1) == 0)
    {
      uint64_t v24 = objc_msgSend_bizIntent(self, v20, v21, v22);
      objc_msgSend__updateBizIntent_(v29, v25, (uint64_t)v24, v26);

      objc_msgSend_setBizIntent_(self, v27, 0, v28);
    }
  }
}

- (void)_updateLocaleForMessageIfNeeded:(id)a3
{
  id v31 = a3;
  if (objc_msgSend_isBusinessChat(self, v4, v5, v6)
    && (objc_msgSend_isTypingMessage(v31, v7, v8, v9) & 1) == 0)
  {
    uint64_t v13 = objc_msgSend_associatedMessageGUID(v31, v10, v11, v12);
    if (!objc_msgSend_length(v13, v14, v15, v16)
      || (objc_msgSend_messageForGUID_(self, v17, (uint64_t)v13, v19),
          uint64_t v20 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend_balloonBundleID(v20, v21, v22, v23),
          uint64_t v24 = objc_claimAutoreleasedReturnValue(),
          int isEqualToString = objc_msgSend_isEqualToString_(v24, v25, *MEMORY[0x1E4F6CAE8], v26),
          v24,
          v20,
          isEqualToString))
    {
      uint64_t v28 = objc_msgSend__getCurrentLocale(self, v17, v18, v19);
      objc_msgSend__updateLocale_(v31, v29, (uint64_t)v28, v30);
    }
  }
}

- (id)_getCurrentLocale
{
  BOOL v4 = objc_msgSend_currentLocale(MEMORY[0x1E4F1CA20], a2, v2, v3);
  uint64_t v8 = objc_msgSend_localeIdentifier(v4, v5, v6, v7);

  return v8;
}

- (void)_updateTypingGUIDForMessageIfNeeded:(id)a3
{
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (self->_typingGUID)
  {
    uint64_t v8 = objc_msgSend_account(self, v4, v5, v6);
    uint64_t v12 = objc_msgSend_service(v8, v9, v10, v11);
    int v16 = objc_msgSend_supportsTypingIndicators(v12, v13, v14, v15);

    int v20 = objc_msgSend_wasDowngraded(v7, v17, v18, v19);
    uint64_t v24 = objc_msgSend_guid(v7, v21, v22, v23);
    int isEqualToIgnoringCase = objc_msgSend_isEqualToIgnoringCase_(v24, v25, (uint64_t)self->_typingGUID, v26);

    currentLocationGUID = self->_currentLocationGUID;
    uint64_t v32 = objc_msgSend_guid(v7, v29, v30, v31);
    int isEqualToString = objc_msgSend_isEqualToString_(currentLocationGUID, v33, (uint64_t)v32, v34);

    uint64_t v39 = objc_msgSend_account(self, v36, v37, v38);
    uint64_t v43 = objc_msgSend_service(v39, v40, v41, v42);
    if (objc_msgSend_shouldReuseTypingIndicatorGUID(v43, v44, v45, v46)) {
      char isGroupChat = objc_msgSend_isGroupChat(self, v47, v48, v49);
    }
    else {
      char isGroupChat = 1;
    }

    uint64_t v54 = objc_msgSend_scheduleType(v7, v51, v52, v53);
    if (((v16 ^ 1 | v20 | isEqualToIgnoringCase | isEqualToString) & 1) == 0 && (isGroupChat & 1) == 0 && v54 != 2)
    {
      if (IMOSLoggingEnabled())
      {
        int v60 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_guid(v7, v61, v62, v63);
          uint64_t v64 = (NSString *)objc_claimAutoreleasedReturnValue();
          typingGUID = self->_typingGUID;
          int v70 = 138412546;
          uint64_t v71 = v64;
          __int16 v72 = 2112;
          uint64_t v73 = typingGUID;
          _os_log_impl(&dword_1A4AF7000, v60, OS_LOG_TYPE_INFO, "Updating typing guid on IMMessage from %@ to %@", (uint8_t *)&v70, 0x16u);
        }
      }
      objc_msgSend__updateGUID_(v7, v58, (uint64_t)self->_typingGUID, v59);
    }
    if (objc_msgSend_isFinished(v7, v55, v56, v57))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v66 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
        {
          uint64_t v67 = self->_typingGUID;
          int v70 = 138412290;
          uint64_t v71 = v67;
          _os_log_impl(&dword_1A4AF7000, v66, OS_LOG_TYPE_INFO, " => Message is finished, clearing typing guid: %@", (uint8_t *)&v70, 0xCu);
        }
      }
      uint64_t v68 = self->_typingGUID;
      self->_typingGUID = 0;

      localUserIsComposing = self->_localUserIsComposing;
      self->_localUserIsComposing = 0;
    }
  }
}

- (void)_updateWalletBreadcrumbingAssociationForMessageIfNeeded:(id)a3
{
  uint64_t v81 = *MEMORY[0x1E4F143B8];
  id v66 = a3;
  id v7 = objc_msgSend_balloonBundleID(v66, v4, v5, v6);
  int v10 = objc_msgSend_containsString_(v7, v8, *MEMORY[0x1E4F6CC30], v9);

  if (v10)
  {
    uint64_t v14 = objc_msgSend_associatedMessageGUID(v66, v11, v12, v13);
    if (!v14)
    {
      uint64_t v67 = IMExtensionPayloadUnarchivingClasses();
      uint64_t v15 = (void *)MEMORY[0x1E4F28DC0];
      uint64_t v19 = objc_msgSend_payloadData(v66, v16, v17, v18);
      id v77 = 0;
      uint64_t v21 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(v15, v20, (uint64_t)v67, (uint64_t)v19, &v77);
      id v22 = v77;

      if (IMOSLoggingEnabled())
      {
        uint64_t v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v80 = v22;
          _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Finished unarchivedObjectOfClasses for payloadData. Error: [%@]", buf, 0xCu);
        }
      }
      uint64_t v69 = IMSanitizedSessionIdentifierForIMExtensionPayloadUserSessionIdentifierKey();
      long long v75 = 0u;
      long long v76 = 0u;
      long long v73 = 0u;
      long long v74 = 0u;
      objc_msgSend_chatItems(self, v24, v25, v26);
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v27, (uint64_t)&v73, (uint64_t)v78, 16);
      if (v71)
      {
        uint64_t v70 = *(void *)v74;
        while (2)
        {
          for (uint64_t i = 0; i != v71; ++i)
          {
            if (*(void *)v74 != v70) {
              objc_enumerationMutation(obj);
            }
            id v29 = *(void **)(*((void *)&v73 + 1) + 8 * i);
            objc_opt_class();
            if (objc_opt_isKindOfClass())
            {
              id v31 = v29;
              uint64_t v35 = objc_msgSend_message(v31, v32, v33, v34);
              uint64_t v39 = objc_msgSend_payloadData(v35, v36, v37, v38);
              id v72 = v22;
              uint64_t v41 = objc_msgSend_unarchivedObjectOfClasses_fromData_error_(MEMORY[0x1E4F28DC0], v40, (uint64_t)v67, (uint64_t)v39, &v72);
              id v42 = v72;

              if (IMOSLoggingEnabled())
              {
                uint64_t v43 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v80 = v42;
                  _os_log_impl(&dword_1A4AF7000, v43, OS_LOG_TYPE_INFO, "Finished unarchivedObjectOfClasses for payloadData. Error: [%@]", buf, 0xCu);
                }
              }
              uint64_t v44 = IMSanitizedSessionIdentifierForIMExtensionPayloadUserSessionIdentifierKey();
              uint64_t v48 = v44;
              if (v44) {
                BOOL v49 = v69 != 0;
              }
              else {
                BOOL v49 = 0;
              }
              if (v49)
              {
                uint64_t v50 = objc_msgSend_UUIDString(v44, v45, v46, v47);
                uint64_t v54 = objc_msgSend_UUIDString(v69, v51, v52, v53);
                int isEqualToString = objc_msgSend_isEqualToString_(v50, v55, (uint64_t)v54, v56);

                if (isEqualToString)
                {
                  uint64_t v61 = objc_msgSend_guid(v35, v58, v59, v60);
                  objc_msgSend__associatedMessageGUID_(v66, v62, (uint64_t)v61, v63);

                  objc_msgSend__associatedMessageType_(v66, v64, 2, v65);
                  uint64_t v21 = (void *)v41;
                  id v22 = v42;
                  goto LABEL_27;
                }
              }

              uint64_t v21 = (void *)v41;
              id v22 = v42;
            }
          }
          uint64_t v71 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v30, (uint64_t)&v73, (uint64_t)v78, 16);
          if (v71) {
            continue;
          }
          break;
        }
      }
LABEL_27:

      uint64_t v14 = 0;
    }
  }
}

- (BOOL)_updateJoinStateWithMessageIfNeeded:(id)a3
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_joinState(self, v5, v6, v7) == 3 || objc_msgSend_joinState(self, v8, v9, v10) == 4)
  {
    BOOL v11 = 1;
  }
  else
  {
    if (!self->_messagesPendingJoin)
    {
      uint64_t v12 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      messagesPendingJoin = self->_messagesPendingJoin;
      self->_messagesPendingJoin = v12;
    }
    if (IMOSLoggingEnabled())
    {
      int v16 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v20 = objc_msgSend_account(self, v17, v18, v19);
        int v25 = 138412802;
        id v26 = v4;
        __int16 v27 = 2112;
        uint64_t v28 = v20;
        __int16 v29 = 2112;
        uint64_t v30 = self;
        _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Adding pending message message %@ for account: %@ (%@)", (uint8_t *)&v25, 0x20u);
      }
    }
    objc_msgSend_addObject_(self->_messagesPendingJoin, v14, (uint64_t)v4, v15);
    objc_msgSend_join(self, v21, v22, v23);
    BOOL v11 = 0;
  }

  return v11;
}

- (void)_updatePayloadForMessageIfNeeded:(id)a3
{
  uint64_t v88 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_balloonBundleID(v4, v5, v6, v7);
  if (objc_msgSend_isEqualToString_(v8, v9, *MEMORY[0x1E4F6CC10], v10))
  {
    uint64_t v14 = objc_msgSend__imMessageItem(v4, v11, v12, v13);
    uint64_t CMMState = objc_msgSend_getCMMState(v14, v15, v16, v17);

    if (!CMMState)
    {
      uint64_t v22 = objc_msgSend_payloadData(v4, v19, v20, v21);
      id v26 = objc_msgSend_payloadData(v4, v23, v24, v25);
      __int16 v27 = IMSharedHelperPayloadFromCombinedPluginPayloadData();
      id v28 = 0;

      if (v27)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            objc_msgSend_fileTransferGUIDs(v4, v32, v33, v34);
            id v35 = (id)objc_claimAutoreleasedReturnValue();
            id v36 = NSNumber;
            uint64_t v40 = objc_msgSend_payloadData(v4, v37, v38, v39);
            uint64_t v44 = objc_msgSend_length(v40, v41, v42, v43);
            uint64_t v47 = objc_msgSend_numberWithUnsignedInteger_(v36, v45, v44, v46);
            uint64_t v48 = NSNumber;
            uint64_t v52 = objc_msgSend_length(v22, v49, v50, v51);
            uint64_t v55 = objc_msgSend_numberWithUnsignedInteger_(v48, v53, v52, v54);
            *(_DWORD *)buf = 138412802;
            id v83 = v35;
            __int16 v84 = 2112;
            uint64_t v85 = v47;
            __int16 v86 = 2112;
            uint64_t v87 = v55;
            _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "Before splitting up rich links into file for msg guid %@ message payloadad data length %@, original payload data lenght %@", buf, 0x20u);
          }
        }
        objc_msgSend_setPayloadData_(v4, v29, (uint64_t)v27, v30);
        objc_msgSend__updateFileAttachmentGUIDsForMessageIfNeeded_withPayloadAttachments_(self, v56, (uint64_t)v4, (uint64_t)v28);
        if (IMOSLoggingEnabled())
        {
          uint64_t v57 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            objc_msgSend_fileTransferGUIDs(v4, v58, v59, v60);
            id v61 = (id)objc_claimAutoreleasedReturnValue();
            uint64_t v62 = NSNumber;
            id v66 = objc_msgSend_payloadData(v4, v63, v64, v65);
            uint64_t v70 = objc_msgSend_length(v66, v67, v68, v69);
            long long v73 = objc_msgSend_numberWithUnsignedInteger_(v62, v71, v70, v72);
            long long v74 = NSNumber;
            uint64_t v78 = objc_msgSend_length(v22, v75, v76, v77);
            uint64_t v81 = objc_msgSend_numberWithUnsignedInteger_(v74, v79, v78, v80);
            *(_DWORD *)buf = 138412802;
            id v83 = v61;
            __int16 v84 = 2112;
            uint64_t v85 = v73;
            __int16 v86 = 2112;
            uint64_t v87 = v81;
            _os_log_impl(&dword_1A4AF7000, v57, OS_LOG_TYPE_INFO, "After splitting up rich links into file for msg guid %@ message payloadad data length %@, original payload data lenght %@", buf, 0x20u);
          }
        }
      }
    }
  }
  else
  {
  }
}

- (void)_updateFileAttachmentGUIDsForMessageIfNeeded:(id)a3 withPayloadAttachments:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (objc_msgSend_count(v7, v8, v9, v10))
  {
    uint64_t v14 = objc_msgSend_sharedInstance(IMFileTransferCenter, v11, v12, v13);
    uint64_t v18 = objc_msgSend_guid(v6, v15, v16, v17);
    id v43 = v7;
    uint64_t v20 = objc_msgSend_guidsForStoredAttachmentPayloadData_messageGUID_(v14, v19, (uint64_t)v7, (uint64_t)v18);

    id v21 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend_addObjectsFromArray_(v21, v22, (uint64_t)v20, v23);
    uint64_t v42 = v21;
    objc_msgSend__updateFileTransferGUIDs_(v6, v24, (uint64_t)v21, v25);
    long long v46 = 0u;
    long long v47 = 0u;
    long long v44 = 0u;
    long long v45 = 0u;
    id v26 = v20;
    uint64_t v28 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v44, (uint64_t)v48, 16);
    if (v28)
    {
      uint64_t v32 = v28;
      uint64_t v33 = *(void *)v45;
      do
      {
        uint64_t v34 = 0;
        do
        {
          if (*(void *)v45 != v33) {
            objc_enumerationMutation(v26);
          }
          uint64_t v35 = *(void *)(*((void *)&v44 + 1) + 8 * v34);
          id v36 = objc_msgSend_sharedInstance(IMFileTransferCenter, v29, v30, v31);
          uint64_t v40 = objc_msgSend_account(self, v37, v38, v39);
          objc_msgSend_assignTransfer_toMessage_account_(v36, v41, v35, (uint64_t)v6, v40);

          ++v34;
        }
        while (v32 != v34);
        uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v29, (uint64_t)&v44, (uint64_t)v48, 16);
      }
      while (v32);
    }

    id v7 = v43;
  }
}

- (void)_refreshServiceForSendingIfNeededWithMessage:(id)a3
{
  id v13 = a3;
  if (objc_msgSend_wasDowngraded(v13, v4, v5, v6) && (objc_msgSend_isSOS(v13, v7, v8, v9) & 1) == 0) {
    objc_msgSend_refreshServiceForSending(self, v10, v11, v12);
  }
}

- (void)_fixItemForSendingMessageTime:(id)a3
{
  uint64_t v101 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_lastIncomingMessage(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_time(v8, v9, v10, v11);

  uint64_t v16 = objc_msgSend_lastSentMessageDate(self, v13, v14, v15);
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = NSNumber;
      uint64_t v24 = objc_msgSend_time(v4, v20, v21, v22);
      objc_msgSend_timeIntervalSinceReferenceDate(v24, v25, v26, v27);
      uint64_t v31 = objc_msgSend_numberWithDouble_(v23, v28, v29, v30);
      uint64_t v32 = NSNumber;
      objc_msgSend_timeIntervalSinceReferenceDate(v12, v33, v34, v35);
      uint64_t v39 = objc_msgSend_numberWithDouble_(v32, v36, v37, v38);
      uint64_t v40 = NSNumber;
      objc_msgSend_timeIntervalSinceReferenceDate(v16, v41, v42, v43);
      long long v47 = objc_msgSend_numberWithDouble_(v40, v44, v45, v46);
      int v95 = 138412802;
      uint64_t v96 = v31;
      __int16 v97 = 2112;
      uint64_t v98 = v39;
      __int16 v99 = 2112;
      uint64_t v100 = v47;
      _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "itemToUpdateTime: %@ lastIncomingMessage time: %@ lastSentMessageDate: %@", (uint8_t *)&v95, 0x20u);
    }
  }
  if (objc_msgSend_compare_(v12, v17, (uint64_t)v16, v18) == 1) {
    objc_msgSend_timeIntervalSinceReferenceDate(v12, v48, v49, v50);
  }
  else {
    objc_msgSend_timeIntervalSinceReferenceDate(v16, v48, v49, v50);
  }
  double v55 = v54;
  uint64_t v56 = objc_msgSend_time(v4, v51, v52, v53);
  objc_msgSend_timeIntervalSinceReferenceDate(v56, v57, v58, v59);
  BOOL v61 = v60 - v55 < 60.0;

  if (v61)
  {
    uint64_t v65 = objc_msgSend_dateWithTimeIntervalSinceReferenceDate_(MEMORY[0x1E4F1C9C8], v62, v63, v64, v55 + 0.100000001);
    if (IMOSLoggingEnabled())
    {
      uint64_t v69 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
      {
        long long v73 = NSNumber;
        objc_msgSend_timeIntervalSinceReferenceDate(v65, v70, v71, v72);
        uint64_t v77 = objc_msgSend_numberWithDouble_(v73, v74, v75, v76);
        uint64_t v78 = NSNumber;
        uint64_t v82 = objc_msgSend_time(v4, v79, v80, v81);
        objc_msgSend_timeIntervalSinceReferenceDate(v82, v83, v84, v85);
        uint64_t v89 = objc_msgSend_numberWithDouble_(v78, v86, v87, v88);
        int v95 = 138412802;
        uint64_t v96 = v77;
        __int16 v97 = 2112;
        uint64_t v98 = v65;
        __int16 v99 = 2112;
        uint64_t v100 = v89;
        _os_log_impl(&dword_1A4AF7000, v69, OS_LOG_TYPE_INFO, "The last recent message was received less than a minute ago, going to use time interval: %@ date: %@ clientSendTime: %@", (uint8_t *)&v95, 0x20u);
      }
    }
    uint64_t v90 = objc_msgSend_time(v4, v66, v67, v68);
    objc_msgSend_setClientSendTime_(v4, v91, (uint64_t)v90, v92);

    objc_msgSend_setTime_(v4, v93, (uint64_t)v65, v94);
  }
}

- (void)sendMessage:(id)a3
{
  id v4 = a3;
  objc_msgSend_account(self, v5, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_sendMessage_onAccount_(self, v8, (uint64_t)v4, (uint64_t)v9);
}

- (void)sendMessage:(id)a3 onService:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v11 = objc_msgSend_sharedInstance(IMAccountController, v8, v9, v10);
  objc_msgSend_bestAccountForService_(v11, v12, (uint64_t)v6, v13);
  id v15 = (id)objc_claimAutoreleasedReturnValue();

  objc_msgSend_sendMessage_onAccount_(self, v14, (uint64_t)v7, (uint64_t)v15);
}

- (void)sendMessage:(id)a3 onAccount:(id)a4
{
  v168[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (__CFString *)a3;
  id v156 = a4;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v164 = v5;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Client request to send message: %@", buf, 0xCu);
    }
  }
  kdebug_trace();
  if (objc_msgSend_isFinished(v5, v7, v8, v9))
  {
    uint64_t v13 = objc_msgSend_service(v156, v10, v11, v12);
    uint64_t v17 = objc_msgSend_iMessageService(IMServiceImpl, v14, v15, v16);
    BOOL v18 = v13 == v17;

    if (v18)
    {
      uint64_t v22 = objc_msgSend_fileTransferGUIDs(v5, v19, v20, v21);
      BOOL v26 = objc_msgSend_count(v22, v23, v24, v25) == 0;

      if (!v26)
      {
        uint64_t v30 = objc_msgSend_guid(v5, v27, v28, v29);
        _signpostSendFileMessage();
      }
      uint64_t v31 = objc_msgSend_guid(v5, v27, v28, v29);
      uint64_t v35 = objc_msgSend_fileTransferGUIDs(v5, v32, v33, v34);
      objc_msgSend_count(v35, v36, v37, v38);
      _signpostSendMessage();
    }
    uint64_t v39 = (void *)MEMORY[0x1E4F6F4B0];
    uint64_t v40 = objc_msgSend_deviceIndependentID(self, v19, v20, v21);
    uint64_t v41 = IMTextInputIdentifier(v40);
    objc_msgSend_sendSignal_toChannel_withNullableUniqueStringID_withPayload_(v39, v42, *MEMORY[0x1E4F6F488], *MEMORY[0x1E4F6F440], v41, 0);
  }
  uint64_t v43 = objc_msgSend_mainBundle(MEMORY[0x1E4F28B50], v10, v11, v12);
  uint64_t v154 = objc_msgSend_bundleIdentifier(v43, v44, v45, v46);

  if (objc_msgSend_length(v154, v47, v48, v49))
  {
    uint64_t v167 = *MEMORY[0x1E4F6D6C8];
    v168[0] = v154;
    uint64_t v53 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v50, (uint64_t)v168, (uint64_t)&v167, 1);
    uint64_t v57 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E890], v54, v55, v56);
    BOOL v61 = objc_msgSend_copy(v53, v58, v59, v60);
    objc_msgSend_trackEvent_withDictionary_(v57, v62, *MEMORY[0x1E4F6D9B8], (uint64_t)v61);
  }
  if ((objc_msgSend_isFinished(v5, v50, v51, v52) & 1) == 0
    && (objc_msgSend_isLocatingMessage(v5, v63, v64, v65) & 1) == 0)
  {
    int isAudioMessage = objc_msgSend_isAudioMessage(v5, v63, v64, v65);
    uint64_t v70 = @"__kIMChatComposeTyping";
    if (isAudioMessage) {
      uint64_t v70 = @"__kIMChatComposeRecording";
    }
    goto LABEL_19;
  }
  if (objc_msgSend_isEmpty(v5, v63, v64, v65) && objc_msgSend_isFinished(v5, v66, v67, v68))
  {
    int v69 = objc_msgSend_isAudioMessage(v5, v66, v67, v68);
    uint64_t v70 = @"__kIMChatComposeRecording";
    if (!v69) {
      uint64_t v70 = 0;
    }
LABEL_19:
    uint64_t v71 = v70;
    uint64_t v75 = objc_msgSend_guid(v5, v72, v73, v74);
    objc_msgSend__setLocalUserIsComposing_suppliedGUID_(self, v76, (uint64_t)v71, (uint64_t)v75);
    goto LABEL_54;
  }
  if (objc_msgSend_isStewieChat(self, v66, v67, v68)
    && (objc_msgSend_text(v5, v77, v78, v79),
        uint64_t v80 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_string(v80, v81, v82, v83),
        uint64_t v84 = objc_claimAutoreleasedReturnValue(),
        BOOL v87 = (unint64_t)objc_msgSend_lengthOfBytesUsingEncoding_(v84, v85, 4, v86) > 0xA0,
        v84,
        v80,
        v87))
  {
    uint64_t v88 = objc_msgSend_messagesSeparatedByByteLength_(v5, v77, 160, v79);
  }
  else if (objc_msgSend_hasDataDetectorResults(v5, v77, v78, v79) {
         && (objc_msgSend_isSOS(v5, v89, v90, v91) & 1) == 0)
  }
  {
    uint64_t v88 = objc_msgSend_messagesBySeparatingRichLinks(v5, v92, v93, v94);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v96 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v96, OS_LOG_TYPE_INFO))
      {
        int hasDataDetectorResults = objc_msgSend_hasDataDetectorResults(v5, v97, v98, v99);
        uint64_t v104 = objc_msgSend_service(v156, v101, v102, v103);
        BOOL v105 = (void *)v104;
        uint64_t v106 = @"NO";
        if (hasDataDetectorResults) {
          uint64_t v106 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        id v164 = v106;
        __int16 v165 = 2112;
        uint64_t v166 = v104;
        _os_log_impl(&dword_1A4AF7000, v96, OS_LOG_TYPE_INFO, "Not splitting message rich links, has data detected results (%@) and service %@", buf, 0x16u);
      }
    }
    uint64_t v162 = v5;
    uint64_t v88 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v95, (uint64_t)&v162, 1);
  }
  long long v159 = 0u;
  long long v160 = 0u;
  long long v157 = 0u;
  long long v158 = 0u;
  uint64_t v71 = v88;
  uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v108, (uint64_t)&v157, (uint64_t)v161, 16);
  if (v112)
  {
    uint64_t v113 = *(void *)v158;
    do
    {
      for (uint64_t i = 0; i != v112; ++i)
      {
        if (*(void *)v158 != v113) {
          objc_enumerationMutation(v71);
        }
        uint64_t v115 = *(void **)(*((void *)&v157 + 1) + 8 * i);
        uint64_t v116 = objc_msgSend_notificationIDSTokenURI(v5, v109, v110, v111);
        if (!objc_msgSend_length(v116, v117, v118, v119)) {
          goto LABEL_46;
        }
        char v123 = objc_msgSend_notificationIDSTokenURI(v5, v120, v121, v122);
        uint64_t v127 = objc_msgSend_notificationIDSTokenURI(v115, v124, v125, v126);
        char isEqualToString = objc_msgSend_isEqualToString_(v123, v128, (uint64_t)v127, v129);

        if ((isEqualToString & 1) == 0)
        {
          uint64_t v134 = objc_msgSend_notificationIDSTokenURI(v5, v131, v132, v133);
          objc_msgSend_setNotificationIDSTokenURI_(v115, v135, (uint64_t)v134, v136);

          if (IMOSLoggingEnabled())
          {
            uint64_t v116 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v116, OS_LOG_TYPE_INFO))
            {
              objc_msgSend_notificationIDSTokenURI(v115, v137, v138, v139);
              uint64_t v140 = (__CFString *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              id v164 = v140;
              _os_log_impl(&dword_1A4AF7000, v116, OS_LOG_TYPE_INFO, "New immessage does not have notificationIDSTokenURI, it is now set to %@ before sending.", buf, 0xCu);
            }
LABEL_46:
          }
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v142 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v142, OS_LOG_TYPE_INFO))
          {
            uint64_t v146 = objc_msgSend_guid(v5, v143, v144, v145);
            *(_DWORD *)buf = 138412546;
            id v164 = v5;
            __int16 v165 = 2112;
            uint64_t v166 = (uint64_t)v146;
            _os_log_impl(&dword_1A4AF7000, v142, OS_LOG_TYPE_INFO, "Add sending message: %@ guid: %@", buf, 0x16u);
          }
        }
        objc_msgSend__sendMessage_withAccount_adjustingSender_shouldQueue_(self, v141, (uint64_t)v115, (uint64_t)v156, 1, 0);
      }
      uint64_t v112 = objc_msgSend_countByEnumeratingWithState_objects_count_(v71, v109, (uint64_t)&v157, (uint64_t)v161, 16);
    }
    while (v112);
  }
  uint64_t v75 = v71;
LABEL_54:

  if ((sub_1A4C0AC10() & 1) == 0)
  {
    v150 = objc_msgSend_sharedInstance(IMBalloonPluginAttributionController, v147, v148, v149);
    objc_msgSend_startExpiryTimer(v150, v151, v152, v153);
  }
}

- (void)sendCurrentLocationMessage
{
  objc_msgSend_sharedInstance(IMLocationManagerUtils, a2, v2, v3);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v8 = objc_msgSend_sharedInstance(IMLocationManager, v5, v6, v7);
  objc_msgSend_sendCurrentLocationMessageWithChat_withLocationManager_withSourceApplicationIdentifier_foregroundAssertionForBundleIdentifier_completion_(v10, v9, (uint64_t)self, (uint64_t)v8, 0, 0, 0);
}

- (void)retractMessagePart:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_messageItem(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_index(v4, v9, v10, v11);
  uint64_t hasSubject = objc_msgSend_hasSubject(v4, v13, v14, v15);
  uint64_t v20 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v17, v18, v19);
  BOOL v30 = objc_msgSend_isScheduledMessagesCoreEnabled(v20, v21, v22, v23)
     && objc_msgSend_scheduleType(v8, v24, v25, v26) == 2
     && objc_msgSend_scheduleState(v8, v27, v28, v29) == 2;

  if (IMOSLoggingEnabled())
  {
    uint64_t v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      id v36 = objc_msgSend_guid(v8, v33, v34, v35);
      int v55 = 138412802;
      uint64_t v56 = v36;
      __int16 v57 = 2048;
      uint64_t v58 = objc_msgSend_scheduleType(v8, v37, v38, v39);
      __int16 v59 = 2048;
      uint64_t v60 = objc_msgSend_scheduleState(v8, v40, v41, v42);
      _os_log_impl(&dword_1A4AF7000, v32, OS_LOG_TYPE_INFO, "Retracting/Cancelling message with guid: %@, scheduleType: %lu, scheduleState %lu", (uint8_t *)&v55, 0x20u);
    }
  }
  if (v30)
  {
    objc_msgSend_cancelScheduledMessageItem_atPartIndex_shouldRetractSubject_(self, v31, (uint64_t)v8, v12, hasSubject);
  }
  else
  {
    uint64_t v43 = objc_msgSend_editedMessageItemWithOriginalMessageItem_retractedPartIndex_shouldRetractSubject_(MEMORY[0x1E4F6E850], v31, (uint64_t)v8, v12, hasSubject);
    long long v47 = objc_msgSend_chatRegistry(self, v44, v45, v46);
    objc_msgSend__chat_sendEditedMessageItem_previousMessageItem_partIndex_editType_backwardCompatabilityText_(v47, v48, (uint64_t)self, (uint64_t)v43, v8, v12, 2, 0);

    uint64_t v52 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E890], v49, v50, v51);
    objc_msgSend_trackEvent_(v52, v53, *MEMORY[0x1E4F6DDA8], v54);
  }
}

- (void)retractScheduledMessagePartIndexes:(id)a3 fromChatItem:(id)a4
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v11 = objc_msgSend_messageItem(v7, v8, v9, v10);
  uint64_t hasSubject = objc_msgSend_hasSubject(v7, v12, v13, v14);
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = objc_msgSend_guid(v11, v20, v21, v22);
      int v57 = 138413058;
      id v58 = v6;
      __int16 v59 = 2112;
      uint64_t v60 = v23;
      __int16 v61 = 2048;
      uint64_t v62 = objc_msgSend_scheduleType(v11, v24, v25, v26);
      __int16 v63 = 2048;
      uint64_t v64 = objc_msgSend_scheduleState(v11, v27, v28, v29);
      _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Retracting/Cancelling scheduled message part indexes (%@) from message with guid: %@, scheduleType: %lu, scheduleState %lu", (uint8_t *)&v57, 0x2Au);
    }
  }
  if (objc_msgSend_partCount(v11, v16, v17, v18) == 1)
  {
    uint64_t v33 = objc_msgSend_participantsWithState_(self, v30, 16, v32);
    id v36 = objc_msgSend___imArrayByApplyingBlock_(v33, v34, (uint64_t)&unk_1EF8E64E8, v35);

    uint64_t v40 = objc_msgSend_guid(v11, v37, v38, v39);
    uint64_t v43 = objc_msgSend_setWithArray_(MEMORY[0x1E4F1CAD0], v41, (uint64_t)v36, v42);
    objc_msgSend_cancelScheduledMessageWithGUID_destinations_cancelType_(self, v44, (uint64_t)v40, (uint64_t)v43, 1);
  }
  else
  {
    uint64_t v45 = objc_msgSend_failedRetractPartIndexes(v11, v30, v31, v32);
    id v36 = objc_msgSend_mutableCopy(v45, v46, v47, v48);

    if (v36)
    {
      objc_msgSend_removeIndexes_(v36, v49, (uint64_t)v6, v50);
      objc_msgSend_setFailedRetractPartIndexes_(v11, v51, (uint64_t)v36, v52);
    }
    uint64_t v40 = objc_msgSend_editedMessageItemWithOriginalMessageItem_retractedPartIndexes_shouldRetractSubject_(MEMORY[0x1E4F6E850], v49, (uint64_t)v11, (uint64_t)v6, hasSubject);
    uint64_t v43 = objc_msgSend_chatRegistry(self, v53, v54, v55);
    objc_msgSend__chat_editScheduledMessageItem_previousMessageItem_retractingPartIndexes_(v43, v56, (uint64_t)self, (uint64_t)v40, v11, v6);
  }
}

- (void)editMessageItem:(id)a3 atPartIndex:(int64_t)a4 withNewPartText:(id)a5 backwardCompatabilityText:(id)a6
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  uint64_t v16 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], v13, v14, v15);
  BOOL v26 = objc_msgSend_isScheduledMessagesCoreEnabled(v16, v17, v18, v19)
     && objc_msgSend_scheduleType(v10, v20, v21, v22) == 2
     && objc_msgSend_scheduleState(v10, v23, v24, v25) == 2;

  if (IMOSLoggingEnabled())
  {
    uint64_t v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      uint64_t v32 = objc_msgSend_guid(v10, v29, v30, v31);
      int v51 = 138412802;
      uint64_t v52 = v32;
      __int16 v53 = 2048;
      uint64_t v54 = objc_msgSend_scheduleType(v10, v33, v34, v35);
      __int16 v55 = 2048;
      uint64_t v56 = objc_msgSend_scheduleState(v10, v36, v37, v38);
      _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Editing Message with guid: %@, scheduleType: %lu, scheduleState: %lu", (uint8_t *)&v51, 0x20u);
    }
  }
  if (v26)
  {
    objc_msgSend_editScheduledMessageItem_atPartIndex_withNewPartText_(self, v27, (uint64_t)v10, a4, v11);
  }
  else
  {
    uint64_t v39 = objc_msgSend_editedMessageItemWithOriginalMessageItem_editedPartIndex_newPartText_(MEMORY[0x1E4F6E850], v27, (uint64_t)v10, a4, v11);
    uint64_t v43 = objc_msgSend_chatRegistry(self, v40, v41, v42);
    objc_msgSend__chat_sendEditedMessageItem_previousMessageItem_partIndex_editType_backwardCompatabilityText_(v43, v44, (uint64_t)self, (uint64_t)v39, v10, a4, 1, v12);

    uint64_t v48 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E890], v45, v46, v47);
    objc_msgSend_trackEvent_(v48, v49, *MEMORY[0x1E4F6D738], v50);
  }
}

- (void)resendEditedMessageItem:(id)a3 forPartIndex:(int64_t)a4 withBackwardCompatabilityText:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  objc_msgSend_chatRegistry(self, v10, v11, v12);
  id v14 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__chat_resendEditedMessageItem_partIndex_withBackwardCompatabilityText_(v14, v13, (uint64_t)self, (uint64_t)v9, a4, v8);
}

- (void)beginShowingEditHistoryForChatItemGUID:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_showingEditHistoryForChatItemGUIDs(self, v5, v6, v7);

  if (!v8)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    objc_msgSend_setShowingEditHistoryForChatItemGUIDs_(self, v13, (uint64_t)v12, v14);
  }
  uint64_t v15 = objc_msgSend_showingEditHistoryForChatItemGUIDs(self, v9, v10, v11);
  objc_msgSend_addObject_(v15, v16, (uint64_t)v4, v17);

  uint64_t v21 = objc_msgSend_inlineReplyController(self, v18, v19, v20);
  objc_msgSend_setNeedsUpdateChatItems(v21, v22, v23, v24);

  objc_msgSend__updateChatItemsWithReason_block_(self, v25, @"Begin showing edit history", (uint64_t)&unk_1EF8E6508);
}

- (void)endShowingEditHistoryForChatItemGUID:(id)a3
{
  id v4 = a3;
  id v8 = objc_msgSend_showingEditHistoryForChatItemGUIDs(self, v5, v6, v7);
  objc_msgSend_removeObject_(v8, v9, (uint64_t)v4, v10);

  uint64_t v14 = objc_msgSend_inlineReplyController(self, v11, v12, v13);
  objc_msgSend_setNeedsUpdateChatItems(v14, v15, v16, v17);

  objc_msgSend__updateChatItemsWithReason_block_(self, v18, @"End showing edit history", (uint64_t)&unk_1EF8E3528);
}

- (void)endShowingEditHistoryForAllChatItems
{
  uint64_t v5 = objc_msgSend_showingEditHistoryForChatItemGUIDs(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_count(v5, v6, v7, v8);

  if (v9)
  {
    uint64_t v13 = objc_msgSend_showingEditHistoryForChatItemGUIDs(self, v10, v11, v12);
    objc_msgSend_removeAllObjects(v13, v14, v15, v16);

    uint64_t v20 = objc_msgSend_inlineReplyController(self, v17, v18, v19);
    objc_msgSend_setNeedsUpdateChatItems(v20, v21, v22, v23);

    objc_msgSend__updateChatItemsWithReason_block_(self, v24, @"End showing edit history for all items", (uint64_t)&unk_1EF8E41D0);
  }
}

- (BOOL)isShowingEditHistoryForChatItemGUID:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_showingEditHistoryForChatItemGUIDs(self, v5, v6, v7);
  char v11 = objc_msgSend_containsObject_(v8, v9, (uint64_t)v4, v10);

  return v11;
}

- (BOOL)isShowingEditHistoryForAnyChatItem
{
  id v4 = objc_msgSend_showingEditHistoryForChatItemGUIDs(self, a2, v2, v3);
  BOOL v8 = objc_msgSend_count(v4, v5, v6, v7) != 0;

  return v8;
}

- (void)repositionSticker:(id)a3 associatedChatItem:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    char v11 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v41 = 138412290;
      id v42 = v6;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Client request to reposition sticker: %@", (uint8_t *)&v41, 0xCu);
    }
  }
  uint64_t v12 = objc_msgSend__imMessageItem(v6, v8, v9, v10);
  uint64_t v16 = objc_msgSend_guid(v6, v13, v14, v15);
  uint64_t v20 = objc_msgSend__stripFZIDPrefix(v16, v17, v18, v19);
  uint64_t v23 = objc_msgSend__itemForGUID_(self, v21, (uint64_t)v20, v22);

  uint64_t v27 = objc_msgSend_fileTransferGUIDs(v23, v24, v25, v26);
  objc_msgSend_setFileTransferGUIDs_(v12, v28, (uint64_t)v27, v29);

  uint64_t v33 = objc_msgSend_body(v23, v30, v31, v32);
  objc_msgSend_setBody_(v12, v34, (uint64_t)v33, v35);

  uint64_t v39 = objc_msgSend_chatRegistry(self, v36, v37, v38);
  objc_msgSend__chat_repositionSticker_(v39, v40, (uint64_t)self, (uint64_t)v12);
}

- (id)messagesForScheduledMessageSectionWithTranscriptItem:(id)a3
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      LOWORD(v55) = 0;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Client requested messages for scheduled message section", (uint8_t *)&v55, 2u);
    }
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v10 = objc_msgSend_chatItems(self, v7, v8, v9);
  uint64_t v14 = objc_msgSend_count(v10, v11, v12, v13);

  unint64_t v18 = v14 + 1;
  do
  {
    if ((uint64_t)(v18 - 2) < 0)
    {
      if (IMOSLoggingEnabled())
      {
        int v51 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v51, OS_LOG_TYPE_INFO))
        {
          int v55 = 138412290;
          id v56 = v4;
          _os_log_impl(&dword_1A4AF7000, v51, OS_LOG_TYPE_INFO, "Couldn't find requested transcriptItem: %@ in chatItems", (uint8_t *)&v55, 0xCu);
        }
      }
      id v52 = v6;
      goto LABEL_21;
    }
    uint64_t v19 = objc_msgSend_chatItems(self, v15, v16, v17);
    uint64_t v22 = objc_msgSend_objectAtIndexedSubscript_(v19, v20, v18 - 2, v21);

    LODWORD(v19) = objc_msgSend_isEqual_(v22, v23, (uint64_t)v4, v24);
    --v18;
  }
  while (!v19);
  uint64_t v25 = objc_msgSend_chatItems(self, v15, v16, v17);
  BOOL v29 = v18 < objc_msgSend_count(v25, v26, v27, v28);

  if (v29)
  {
    while (1)
    {
      uint64_t v33 = objc_msgSend_chatItems(self, v30, v31, v32);
      id v36 = objc_msgSend_objectAtIndexedSubscript_(v33, v34, v18, v35);

      objc_opt_class();
      if (objc_opt_isKindOfClass()) {
        break;
      }
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        uint64_t v40 = objc_msgSend_messageItem(v36, v37, v38, v39);
        objc_msgSend_addObject_(v6, v41, (uint64_t)v40, v42);
      }
      uint64_t v46 = objc_msgSend_chatItems(self, v43, v44, v45);
      unint64_t v50 = objc_msgSend_count(v46, v47, v48, v49);

      if (++v18 >= v50) {
        goto LABEL_20;
      }
    }
  }
LABEL_20:
  id v52 = (id)objc_msgSend_copy(v6, v30, v31, v32);
LABEL_21:
  __int16 v53 = v52;

  return v53;
}

- (void)sendPendingSatelliteMessages
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Client request to send pending satellite messages", buf, 2u);
    }
  }
  id v7 = objc_msgSend_iMessageLiteService(IMService, v3, v4, v5);
  objc_msgSend__targetToService_newComposition_(self, v8, (uint64_t)v7, 0);
  id v59 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v58 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  uint64_t v12 = objc_msgSend__items(self, v9, v10, v11);
  id obj = objc_msgSend_reverseObjectEnumerator(v12, v13, v14, v15);

  uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v16, (uint64_t)&v70, (uint64_t)v77, 16);
  if (v17)
  {
    char v18 = 0;
    uint64_t v19 = *(void *)v71;
    while (2)
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v71 != v19) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void **)(*((void *)&v70 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v23 = v21;
          int isPendingSatelliteSend = objc_msgSend_isPendingSatelliteSend(v23, v24, v25, v26);
          if (isPendingSatelliteSend)
          {
            objc_msgSend_insertObject_atIndex_(v59, v27, (uint64_t)v23, 0);
            if (IMOSLoggingEnabled())
            {
              BOOL v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                uint64_t v33 = objc_msgSend_guid(v23, v30, v31, v32);
                *(_DWORD *)buf = 138412290;
                uint64_t v76 = v33;
                _os_log_impl(&dword_1A4AF7000, v29, OS_LOG_TYPE_INFO, " => Enqueuing message for satellite send %@", buf, 0xCu);
              }
            }
          }
          else if (v18)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v34 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
              {
                uint64_t v38 = objc_msgSend_guid(v23, v35, v36, v37);
                *(_DWORD *)buf = 138412290;
                uint64_t v76 = v38;
                _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, " => Reached message without pending flag %@", buf, 0xCu);
              }
            }

            goto LABEL_26;
          }

          char v18 = isPendingSatelliteSend;
        }
      }
      uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v22, (uint64_t)&v70, (uint64_t)v77, 16);
      if (v17) {
        continue;
      }
      break;
    }
  }
LABEL_26:

  v66[0] = MEMORY[0x1E4F143A8];
  v66[1] = 3221225472;
  v66[2] = sub_1A4BDDCE8;
  v66[3] = &unk_1E5B7BE70;
  id v60 = v59;
  id v67 = v60;
  uint64_t v68 = self;
  id v39 = v58;
  id v69 = v39;
  objc_msgSend__updateChatItemsWithReason_block_(self, v40, @"Sending via satellite", (uint64_t)v66);
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id v41 = v39;
  uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v42, (uint64_t)&v62, (uint64_t)v74, 16);
  if (v43)
  {
    uint64_t v44 = *(void *)v63;
    do
    {
      for (uint64_t j = 0; j != v43; ++j)
      {
        if (*(void *)v63 != v44) {
          objc_enumerationMutation(v41);
        }
        uint64_t v46 = *(void **)(*((void *)&v62 + 1) + 8 * j);
        if (IMOSLoggingEnabled())
        {
          unint64_t v50 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            uint64_t v54 = objc_msgSend_guid(v46, v51, v52, v53);
            *(_DWORD *)buf = 138412290;
            uint64_t v76 = v54;
            _os_log_impl(&dword_1A4AF7000, v50, OS_LOG_TYPE_INFO, " => Dispatching message for satellite send %@", buf, 0xCu);
          }
        }
        int v55 = objc_msgSend_message(v46, v47, v48, v49);
        objc_msgSend_sendMessage_onService_(self, v56, (uint64_t)v55, (uint64_t)v7);
      }
      uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v41, v57, (uint64_t)&v62, (uint64_t)v74, 16);
    }
    while (v43);
  }
}

- (void)fetchIncomingPendingMessagesOverSatellite
{
  uint64_t v5 = objc_msgSend_lastSatelliteFetchDate(self, a2, v2, v3);
  if (!v5) {
    goto LABEL_9;
  }
  uint64_t v9 = (void *)v5;
  uint64_t v10 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v6, v7, v8);
  uint64_t v14 = objc_msgSend_lastSatelliteFetchDate(self, v11, v12, v13);
  objc_msgSend_timeIntervalSinceDate_(v10, v15, (uint64_t)v14, v16);
  double v18 = v17;

  if (v18 >= 180.0)
  {
LABEL_9:
    if (objc_msgSend_pendingIncomingSatelliteMessageCount(self, v6, v7, v8))
    {
      uint64_t v22 = objc_msgSend_now(MEMORY[0x1E4F1C9C8], v19, v20, v21);
      objc_msgSend_setLastSatelliteFetchDate_(self, v23, (uint64_t)v22, v24);

      objc_msgSend_chatRegistry(self, v25, v26, v27);
      id v30 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend__chat_fetchIncomingPendingMessagesOverSatellite_(v30, v28, (uint64_t)self, v29);
    }
  }
}

- (void)sendGroupPhotoUpdate:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v7 = objc_msgSend_valueForChatProperty_(self, v5, *MEMORY[0x1E4F6CD48], v6);
  int v8 = IMAreObjectsLogicallySame();
  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_guid(self, v11, v12, v13);
        uint64_t v14 = (IMChat *)objc_claimAutoreleasedReturnValue();
        int v27 = 138412802;
        uint64_t v28 = v14;
        __int16 v29 = 2112;
        id v30 = v7;
        __int16 v31 = 2112;
        id v32 = v4;
        _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Not updating group photo guid for chatGuid %@ from %@ to %@", (uint8_t *)&v27, 0x20u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v27 = 138412290;
        uint64_t v28 = self;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, " => Chat: %@", (uint8_t *)&v27, 0xCu);
      }
    }
  }
  else
  {
    if (v9)
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_guid(self, v17, v18, v19);
        uint64_t v20 = (IMChat *)objc_claimAutoreleasedReturnValue();
        int v27 = 138412802;
        uint64_t v28 = v20;
        __int16 v29 = 2112;
        id v30 = v7;
        __int16 v31 = 2112;
        id v32 = v4;
        _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Updating group photo guid for chatGuid %@ from %@ to %@", (uint8_t *)&v27, 0x20u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        int v27 = 138412290;
        uint64_t v28 = self;
        _os_log_impl(&dword_1A4AF7000, v24, OS_LOG_TYPE_INFO, " => Chat: %@", (uint8_t *)&v27, 0xCu);
      }
    }
    uint64_t v25 = objc_msgSend_chatRegistry(self, v21, v22, v23);
    objc_msgSend__chat_sendGroupPhotoUpdate_(v25, v26, (uint64_t)self, (uint64_t)v4);
  }
}

- (void)resendGroupPhoto
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_valueForChatProperty_(self, a2, *MEMORY[0x1E4F6CD48], v2);
  if (objc_msgSend_length(v4, v5, v6, v7))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        uint64_t v15 = v4;
        _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Resending group photo: %@", (uint8_t *)&v14, 0xCu);
      }
    }
    uint64_t v12 = objc_msgSend_chatRegistry(self, v8, v9, v10);
    objc_msgSend__chat_sendGroupPhotoUpdate_(v12, v13, (uint64_t)self, (uint64_t)v4);
  }
  else
  {
    uint64_t v12 = IMLogHandleForCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB8C38();
    }
  }
}

- (void)retryGroupPhotoUploadIfNecessary
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_valueForChatProperty_(self, a2, *MEMORY[0x1E4F6CD48], v2);
  int v8 = objc_msgSend_sharedInstance(IMFileTransferCenter, v5, v6, v7);
  uint64_t v11 = objc_msgSend_transferForGUID_(v8, v9, (uint64_t)v4, v10);

  if (objc_msgSend_transferState(v11, v12, v13, v14) == 7 && objc_msgSend_error(v11, v15, v16, v17) == 27)
  {
    uint64_t v21 = objc_msgSend_chatRegistry(self, v18, v19, v20);
    objc_msgSend__chat_retryGroupPhotoUpload_(v21, v22, (uint64_t)self, (uint64_t)v4);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v24 = 138412290;
      uint64_t v25 = v11;
      _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Not retrying group photo upload for transfer %@", (uint8_t *)&v24, 0xCu);
    }
  }
}

- (BOOL)localUserIsTyping
{
  return self->_typingGUID != 0;
}

- (BOOL)localUserIsRecording
{
  return objc_msgSend_isEqualToString_(self->_localUserIsComposing, a2, @"__kIMChatComposeRecording", v2);
}

- (NSString)localTypingMessageGUID
{
  return self->_typingGUID;
}

- (BOOL)_shouldSendCancelTypingIndicator
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], a2, v2, v3);
  objc_msgSend_timeIntervalSince1970(v5, v6, v7, v8);
  double v10 = v9;

  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_latestTypingIndicatorTimeInterval(self, v15, v16, v17);
      int v21 = 134218240;
      double v22 = v10;
      __int16 v23 = 2048;
      uint64_t v24 = v18;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "currentTimeInterval %f, latestTypingIndicatorTimeInterval %f", (uint8_t *)&v21, 0x16u);
    }
  }
  objc_msgSend_latestTypingIndicatorTimeInterval(self, v11, v12, v13);
  return v10 - v19 > 3.0;
}

- (unint64_t)_flagsForTypingIndicatorMessage:(BOOL)a3
{
  if (a3) {
    return 2097164;
  }
  else {
    return 12;
  }
}

- (unint64_t)_flagsForCancelTypingIndicatorMessage
{
  return 13;
}

- (BOOL)_chatStyleSupportsTypingAndCancelTypingIndicators
{
  return objc_msgSend_chatStyle(self, a2, v2, v3) == 45;
}

- (void)_setLocalUserIsComposing:(id)a3 suppliedGUID:(id)a4
{
}

- (void)_setLocalUserIsComposing:(id)a3 suppliedGUID:(id)a4 typingIndicatorData:(id)a5
{
  uint64_t v76 = *MEMORY[0x1E4F143B8];
  double v9 = (NSString *)a3;
  id v10 = a4;
  id v11 = a5;
  if ((objc_msgSend_hasKnownParticipants(self, v12, v13, v14) & 1) == 0)
  {
    uint64_t v18 = objc_msgSend_lastSentMessage(self, v15, v16, v17);

    if (!v18)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v71 = (uint64_t)self;
          _os_log_impl(&dword_1A4AF7000, v42, OS_LOG_TYPE_DEBUG, "Not setting local user composing for chat because this chat has no known participants, and we have never sent them a message before. Bailing. Chat: %@.", buf, 0xCu);
        }
      }
      goto LABEL_55;
    }
  }
  localUserIsComposing = self->_localUserIsComposing;
  if (localUserIsComposing == v9)
  {
    if (!v9 || objc_msgSend_isEqualToString_(v9, v15, (uint64_t)v9, v17))
    {
      int v21 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v15, v16, v17);
      objc_msgSend_timeIntervalSince1970(v21, v22, v23, v24);
      objc_msgSend_setLatestTypingIndicatorTimeInterval_(self, v25, v26, v27);

      goto LABEL_55;
    }
    goto LABEL_10;
  }
  if (v9)
  {
LABEL_10:
    char v20 = 0;
    goto LABEL_11;
  }
  if (self->_typingGUID)
  {
    char v20 = 1;
LABEL_11:
    if (IMOSLoggingEnabled())
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412802;
        uint64_t v71 = (uint64_t)v9;
        __int16 v72 = 2112;
        long long v73 = self;
        __int16 v74 = 2112;
        id v75 = v10;
        _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_DEBUG, "Setting local user is composing with %@ for chat: %@   supplied guid: %@", buf, 0x20u);
      }
    }
    int v29 = IMOSLoggingEnabled();
    if (v20)
    {
      if (v29)
      {
        uint64_t v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          uint64_t v71 = 0x4008000000000000;
          _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "Dispatching cancel typing indicator after %f seconds", buf, 0xCu);
        }
      }
      dispatch_time_t v34 = dispatch_time(0, 3000000000);
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1A4BDEC84;
      block[3] = &unk_1E5B7ACD0;
      block[4] = self;
      dispatch_after(v34, MEMORY[0x1E4F14428], block);
    }
    else
    {
      if (v29)
      {
        uint64_t v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_latestTypingIndicatorTimeInterval(self, v36, v37, v38);
          *(_DWORD *)buf = 134217984;
          uint64_t v71 = v39;
          _os_log_impl(&dword_1A4AF7000, v35, OS_LOG_TYPE_INFO, "Setting typing indicator time to %f", buf, 0xCu);
        }
      }
      if (self->_typingGUID && IMOSLoggingEnabled())
      {
        uint64_t v40 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v71 = (uint64_t)v9;
          _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, " => Updating existing composing message to recording message: %@", buf, 0xCu);
        }
      }
      if (v10)
      {
        id v41 = (NSString *)v10;
      }
      else
      {
        objc_msgSend_stringGUID(NSString, v30, v31, v32);
        id v41 = (NSString *)objc_claimAutoreleasedReturnValue();
      }
      typingGUID = self->_typingGUID;
      self->_typingGUID = v41;

      objc_storeStrong((id *)&self->_localUserIsComposing, a3);
      if (objc_msgSend__chatStyleSupportsTypingAndCancelTypingIndicators(self, v44, v45, v46))
      {
        uint64_t isEqualToString = objc_msgSend_isEqualToString_(v9, v47, @"__kIMChatComposeRecording", v48);
        if ((objc_msgSend_isEqualToString_(v9, v50, @"__kIMChatComposeTyping", v51) & 1) != 0
          || (objc_msgSend_isEqualToString_(v9, v52, @"__kIMChatComposeTyping", v53) & 1) != 0)
        {
          uint64_t v54 = 0;
        }
        else
        {
          uint64_t v54 = v9;
        }
        id v56 = [IMMessage alloc];
        uint64_t v59 = objc_msgSend__flagsForTypingIndicatorMessage_(self, v57, isEqualToString, v58);
        __int16 v61 = objc_msgSend_initWithSender_time_text_messageSubject_fileTransferGUIDs_flags_error_guid_subject_balloonBundleID_payloadData_expressiveSendStyleID_threadIdentifier_(v56, v60, 0, 0, 0, 0, 0, v59, 0, self->_typingGUID, 0, v54, 0, 0, 0);
        if (objc_msgSend_chatStyle(self, v62, v63, v64) == 45) {
          objc_msgSend_setCustomTypingIndicatorIcon_(v61, v65, (uint64_t)v11, v66);
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v68 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v71 = (uint64_t)v61;
            _os_log_impl(&dword_1A4AF7000, v68, OS_LOG_TYPE_INFO, " => Sending start typing message: %@", buf, 0xCu);
          }
        }
        objc_msgSend__sendMessage_adjustingSender_shouldQueue_(self, v67, (uint64_t)v61, 1, 0);
      }
      else if (IMOSLoggingEnabled())
      {
        int v55 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1A4AF7000, v55, OS_LOG_TYPE_INFO, " => Not sending start typing message, the chat style does not support it", buf, 2u);
        }
      }
    }
    goto LABEL_55;
  }
  if (localUserIsComposing)
  {
    self->_localUserIsComposing = 0;
  }
LABEL_55:
}

- (void)forceCancelTypingIndicator
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (self->_localUserIsComposing && self->_typingGUID)
  {
    if (objc_msgSend__chatStyleSupportsTypingAndCancelTypingIndicators(self, a2, v2, v3))
    {
      uint64_t v5 = [IMMessage alloc];
      uint64_t v9 = objc_msgSend__flagsForCancelTypingIndicatorMessage(self, v6, v7, v8);
      id v11 = objc_msgSend_initWithSender_time_text_messageSubject_fileTransferGUIDs_flags_error_guid_subject_threadIdentifier_(v5, v10, 0, 0, 0, 0, 0, v9, 0, self->_typingGUID, 0, 0);
      if (IMOSLoggingEnabled())
      {
        uint64_t v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v18 = v11;
          _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, " => Sending forced cancel typing message:: %@", buf, 0xCu);
        }
      }
      objc_msgSend__sendMessage_adjustingSender_shouldQueue_(self, v12, (uint64_t)v11, 1, 0);
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, " => Not sending forced cancel typing message, the chat style does not support it", buf, 2u);
      }
    }
    typingGUID = self->_typingGUID;
    self->_typingGUID = 0;

    localUserIsComposing = self->_localUserIsComposing;
    self->_localUserIsComposing = 0;
  }
}

- (void)setLocalUserIsComposing:(id)a3 typingIndicatorData:(id)a4
{
}

- (void)setLocalUserIsComposing:(id)a3
{
}

- (void)setLocalUserIsTyping:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = @"__kIMChatComposeTyping";
  }
  else {
    uint64_t v3 = 0;
  }
  ((void (*)(IMChat *, char *, __CFString *))MEMORY[0x1F4181798])(self, sel_setLocalUserIsComposing_, v3);
}

- (void)setLocalUserIsRecording:(BOOL)a3
{
  if (a3) {
    uint64_t v3 = @"__kIMChatComposeRecording";
  }
  else {
    uint64_t v3 = 0;
  }
  ((void (*)(IMChat *, char *, __CFString *))MEMORY[0x1F4181798])(self, sel_setLocalUserIsComposing_, v3);
}

- (BOOL)canSendMessage:(id)a3
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_account(self, v5, v6, v7);
  int hasCapability = objc_msgSend_hasCapability_(v8, v9, 1024, v10);

  if (hasCapability)
  {
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    uint64_t v15 = objc_msgSend_fileTransferGUIDs(v4, v12, v13, v14, 0);
    uint64_t v17 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v16, (uint64_t)&v33, (uint64_t)v37, 16);
    if (v17)
    {
      uint64_t v21 = v17;
      uint64_t v22 = *(void *)v34;
      while (2)
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v34 != v22) {
            objc_enumerationMutation(v15);
          }
          uint64_t v24 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          uint64_t v25 = objc_msgSend_sharedInstance(IMFileTransferCenter, v18, v19, v20);
          uint64_t v28 = objc_msgSend_transferForGUID_(v25, v26, v24, v27);

          if (v28 && !objc_msgSend_canSendTransfer_(self, v29, (uint64_t)v28, v30))
          {

            BOOL v31 = 0;
            goto LABEL_14;
          }
        }
        uint64_t v21 = objc_msgSend_countByEnumeratingWithState_objects_count_(v15, v18, (uint64_t)&v33, (uint64_t)v37, 16);
        if (v21) {
          continue;
        }
        break;
      }
    }
    BOOL v31 = 1;
LABEL_14:
  }
  else
  {
    BOOL v31 = 0;
  }

  return v31;
}

- (BOOL)canSendTransfer:(id)a3
{
  uint64_t v5 = objc_msgSend_account(self, a2, (uint64_t)a3, v3);
  int hasCapability = objc_msgSend_hasCapability_(v5, v6, 32, v7);

  if (!hasCapability) {
    return 0;
  }
  if (objc_msgSend_chatStyle(self, v9, v10, v11) == 45) {
    return 1;
  }
  uint64_t v16 = objc_msgSend_account(self, v12, v13, v14);
  uint64_t v20 = objc_msgSend_service(v16, v17, v18, v19);
  char v15 = objc_msgSend_supportsGroupAttachments(v20, v21, v22, v23);

  return v15;
}

- (BOOL)canSendCurrentLocationMessage
{
  return self->_currentLocationGUID == 0;
}

- (BOOL)authorizationToSendCurrentLocationMessageDetermined
{
  id v4 = objc_msgSend_sharedInstance(IMLocationManager, a2, v2, v3);
  char v8 = objc_msgSend_locationAuthorizationDetermined(v4, v5, v6, v7);

  return v8;
}

- (BOOL)authorizedToSendCurrentLocationMessage
{
  id v4 = objc_msgSend_sharedInstance(IMLocationManager, a2, v2, v3);
  int v8 = objc_msgSend_locationAuthorizationDetermined(v4, v5, v6, v7);

  if (v8)
  {
    uint64_t v12 = objc_msgSend_sharedInstance(IMLocationManager, v9, v10, v11);
    int v16 = objc_msgSend_locationAuthorizationDenied(v12, v13, v14, v15) ^ 1;
  }
  else
  {
    LOBYTE(v16) = 1;
  }
  return v16;
}

- (BOOL)authorizationToSendCurrentLocationMessageDenied
{
  id v4 = objc_msgSend_sharedInstance(IMLocationManager, a2, v2, v3);
  char v8 = objc_msgSend_locationAuthorizationDenied(v4, v5, v6, v7);

  return v8;
}

- (void)updateMessage:(id)a3 withIndexesOfDeletedItems:(id)a4 withIndexToRangeMapOfDeletedItems:(id)a5 deleteDate:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  uint64_t v10 = (IMChat *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
    {
      int v27 = 138412546;
      uint64_t v28 = self;
      __int16 v29 = 2112;
      uint64_t v30 = v10;
      _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_DEBUG, "chat: %@   message: %@", (uint8_t *)&v27, 0x16u);
    }
  }
  int v15 = IMOSLoggingEnabled();
  if (v10)
  {
    if (v15)
    {
      uint64_t v19 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v27 = 138412546;
        uint64_t v28 = v10;
        __int16 v29 = 2112;
        uint64_t v30 = self;
        _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Sending update message %@ to daemon (Chat: %@)", (uint8_t *)&v27, 0x16u);
      }
    }
    uint64_t v20 = objc_msgSend_daemonController(self, v16, v17, v18);
    uint64_t v24 = objc_msgSend__imMessageItem(v10, v21, v22, v23);
    objc_msgSend_updateMessage_withIndexesOfDeletedItems_withIndexToRangeMapOfDeletedItems_deleteDate_(v20, v25, (uint64_t)v24, (uint64_t)v11, v12, v13);
  }
  else if (v15)
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      int v27 = 138412290;
      uint64_t v28 = self;
      _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "Asked to update empty message in chat: %@", (uint8_t *)&v27, 0xCu);
    }
  }
}

- (void)__clearReadMessageCache
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v10 = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Clearing read message cache", v10, 2u);
    }
  }
  uint64_t v7 = objc_msgSend_chatRegistry(self, v3, v4, v5);
  objc_msgSend__updateUnreadCountForChat_(v7, v8, (uint64_t)self, v9);
}

- (void)_setTimerForReadMessageCache
{
  objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], a2, (uint64_t)self, (uint64_t)sel___clearReadMessageCache, 0);

  objc_msgSend_performSelector_withObject_afterDelay_(self, v3, (uint64_t)sel___clearReadMessageCache, 0, 3.0);
}

- (void)markMessageAsRead:(id)a3
{
  if (a3)
  {
    IMSingleObjectArray();
    id v6 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_markMessagesAsRead_(self, v4, (uint64_t)v6, v5);
  }
}

- (void)markMessagesAsRead:(id)a3
{
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7))
  {
    id v8 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v12 = objc_msgSend_count(v4, v9, v10, v11);
    int v15 = objc_msgSend_initWithCapacity_(v8, v13, v12, v14);
    long long v50 = 0u;
    long long v51 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v16 = v4;
    uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v50, (uint64_t)v54, 16);
    if (v18)
    {
      uint64_t v22 = v18;
      uint64_t v23 = *(void *)v51;
      do
      {
        uint64_t v24 = 0;
        do
        {
          if (*(void *)v51 != v23) {
            objc_enumerationMutation(v16);
          }
          uint64_t v25 = objc_msgSend_guid(*(void **)(*((void *)&v50 + 1) + 8 * v24), v19, v20, v21);
          uint64_t v28 = objc_msgSend__itemForGUID_(self, v26, (uint64_t)v25, v27);

          if ((objc_msgSend_isRead(v28, v29, v30, v31) & 1) == 0
            && (objc_msgSend_isFromMe(v28, v32, v33, v34) & 1) == 0)
          {
            objc_msgSend_addObject_(v15, v35, (uint64_t)v28, v36);
          }

          ++v24;
        }
        while (v22 != v24);
        uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v50, (uint64_t)v54, 16);
      }
      while (v22);
    }

    uint64_t v40 = objc_msgSend_chatRegistry(self, v37, v38, v39);
    objc_msgSend__chat_sendReadReceiptForMessages_(v40, v41, (uint64_t)self, (uint64_t)v15);

    objc_msgSend__setTimerForReadMessageCache(self, v42, v43, v44);
    v47[0] = MEMORY[0x1E4F143A8];
    v47[1] = 3221225472;
    v47[2] = sub_1A4BDFB18;
    v47[3] = &unk_1E5B7B130;
    id v48 = v15;
    uint64_t v49 = self;
    id v45 = v15;
    objc_msgSend__updateChatItemsWithReason_block_(self, v46, @"(IMChat) Mark as read", (uint64_t)v47);
  }
}

- (void)markRepliedForMessageGUID:(id)a3
{
  id v4 = a3;
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  int v15 = sub_1A4BDFCF4;
  id v16 = &unk_1E5B7B130;
  uint64_t v17 = self;
  id v18 = v4;
  id v5 = v4;
  objc_msgSend__updateChatItemsWithReason_block_(self, v6, @"Suggested replies selected", (uint64_t)&v13);
  uint64_t v10 = objc_msgSend_chatRegistry(self, v7, v8, v9, v13, v14, v15, v16, v17);
  objc_msgSend__chat_markRepliedForMessageGUID_(v10, v11, (uint64_t)v5, v12);
}

- (void)replaceItemWhenReplied:(id)a3
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v63 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  long long v66 = 0u;
  uint64_t v8 = objc_msgSend__items(self, v5, v6, v7);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v63, (uint64_t)v68, 16);
  if (!v10)
  {
    id v15 = v8;
    goto LABEL_18;
  }
  uint64_t v14 = v10;
  long long v62 = self;
  id v15 = 0;
  uint64_t v16 = *(void *)v64;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v64 != v16) {
        objc_enumerationMutation(v8);
      }
      id v18 = *(void **)(*((void *)&v63 + 1) + 8 * i);
      uint64_t v19 = objc_msgSend_guid(v18, v11, v12, v13);
      if (objc_msgSend_isEqualToString_(v4, v20, (uint64_t)v19, v21))
      {
        objc_opt_class();
        char isKindOfClass = objc_opt_isKindOfClass();

        if ((isKindOfClass & 1) == 0) {
          continue;
        }
        uint64_t v19 = v15;
        id v15 = v18;
      }
    }
    uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v11, (uint64_t)&v63, (uint64_t)v68, 16);
  }
  while (v14);

  if (v15)
  {
    uint64_t v26 = objc_msgSend_body(v15, v23, v24, v25);
    if (objc_msgSend_length(v26, v27, v28, v29))
    {
      uint64_t v33 = objc_msgSend_string(v26, v30, v31, v32);
      uint64_t v37 = objc_msgSend_length(v26, v34, v35, v36);
      uint64_t v40 = objc_msgSend_substringFromIndex_(v33, v38, v37 - 1, v39);
      int isEqualToString = objc_msgSend_isEqualToString_(v40, v41, *MEMORY[0x1E4F6CE60], v42);

      if (isEqualToString)
      {
        uint64_t v47 = objc_msgSend_copyAsReplied(v15, v44, v45, v46);
        uint64_t v51 = objc_msgSend_messageID(v15, v48, v49, v50);
        objc_msgSend__setMessageID_(v47, v52, v51, v53);
        uint64_t v57 = objc_msgSend_copyAsReplied(v15, v54, v55, v56);
        id v67 = v57;
        uint64_t v59 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v58, (uint64_t)&v67, 1);
        objc_msgSend__replaceItems_(v62, v60, (uint64_t)v59, v61);
      }
    }

LABEL_18:
  }
}

- (void)markLastMessageAsUnread
{
  if (objc_msgSend_unreadMessageCount(self, a2, v2, v3))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "We already have unread messages, ignoring request", buf, 2u);
      }
    }
  }
  else
  {
    objc_msgSend_chatRegistry(self, v5, v6, v7);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__chat_markLastMessageAsUnread_(v11, v9, (uint64_t)self, v10);
  }
}

- (void)markAllMessagesAsRead
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v29 = 138412290;
      uint64_t v30 = self;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Request to mark all messages as read: %@", (uint8_t *)&v29, 0xCu);
    }
  }
  objc_msgSend_markKTFailureSeen(self, v3, v4, v5);
  BOOL v10 = objc_msgSend_unreadMessageCount(self, v7, v8, v9) == 0;
  int v11 = IMOSLoggingEnabled();
  if (v10)
  {
    if (v11)
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Chat has no unread messages, tell the daemon that we tried to mark it as read since this could affect message suppression", (uint8_t *)&v29, 2u);
      }
    }
    uint64_t v26 = objc_msgSend_chatRegistry(self, v12, v13, v14);
    objc_msgSend__chat_sendReadReceiptForAllMessages_(v26, v27, (uint64_t)self, v28);
  }
  else
  {
    if (v11)
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v29) = 0;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Chat has unread messages", (uint8_t *)&v29, 2u);
      }
    }
    uint64_t v16 = objc_msgSend_chatRegistry(self, v12, v13, v14);
    objc_msgSend__chat_sendReadReceiptForAllMessages_(v16, v17, (uint64_t)self, v18);

    objc_msgSend__clearUnreadCount(self, v19, v20, v21);
    objc_msgSend__setTimerForReadMessageCache(self, v22, v23, v24);
  }
}

- (void)recoverFromJunk
{
  if (objc_msgSend_isFiltered(self, a2, v2, v3) == 2)
  {
    objc_msgSend_setRecovered_(self, v5, 1, v6);
    objc_msgSend_updateIsFiltered_(self, v7, 1, v8);
    objc_msgSend__reloadChatItemsForJunkStateChange(self, v9, v10, v11);
    objc_msgSend_chatRegistry(self, v12, v13, v14);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend__chat_recoverFromJunk_(v18, v15, (uint64_t)self, v16);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Chat is not a junk chat, not recovering", buf, 2u);
    }
  }
}

- (void)resortMessages
{
}

- (BOOL)_isDuplicate:(id)a3
{
  return 0;
}

- (void)setValue:(id)a3 forChatProperty:(id)a4
{
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v7)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v50 = 138412802;
        id v51 = v6;
        __int16 v52 = 2112;
        id v53 = v7;
        __int16 v54 = 2112;
        uint64_t v55 = self;
        _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, "Attempt to set value: %@ for chatProperty: %@ on chat: %@", (uint8_t *)&v50, 0x20u);
      }
    }
    if (qword_1EB3F2298 != -1) {
      dispatch_once(&qword_1EB3F2298, &unk_1EF8E6528);
    }
    if (objc_msgSend_containsObject_((void *)qword_1EB3F22A0, v8, (uint64_t)v7, v9))
    {
      uint64_t v13 = objc_msgSend_valueForChatProperty_(self, v11, (uint64_t)v7, v12);
      uint64_t v16 = (void *)v13;
      if ((id)v13 == v6 || v6 && v13 && objc_msgSend_isEqual_(v6, v14, v13, v15))
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            LOWORD(v50) = 0;
            _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Attempt to update a chat property to the same value.", (uint8_t *)&v50, 2u);
          }
        }
      }
      else
      {
        if ((objc_msgSend_isEqualToString_(v7, v14, @"wasDetectedAsSMSSpam", v15) & 1) != 0
          || objc_msgSend_isEqualToString_(v7, v20, @"SMSCategory", v21))
        {
          objc_msgSend_setWasDetectedAsSMSSpamCacheStatus_(self, v20, 0, v21);
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            int v50 = 138412546;
            id v51 = v7;
            __int16 v52 = 2112;
            id v53 = v6;
            _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Setting chatProperty: %@ to value: %@", (uint8_t *)&v50, 0x16u);
          }
        }
        chatProperties = self->_chatProperties;
        if (!chatProperties)
        {
          CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
          uint64_t v28 = self->_chatProperties;
          self->_chatProperties = Mutable;

          chatProperties = self->_chatProperties;
        }
        if ((objc_msgSend___imIsMutable(chatProperties, v22, v23, v24) & 1) == 0)
        {
          uint64_t v32 = (NSMutableDictionary *)objc_msgSend_mutableCopy(self->_chatProperties, v29, v30, v31);
          if (!v32) {
            uint64_t v32 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
          }
          uint64_t v33 = self->_chatProperties;
          self->_chatProperties = v32;
        }
        if (!v6
          || (objc_msgSend_null(MEMORY[0x1E4F1CA98], v29, v30, v31),
              id v34 = (id)objc_claimAutoreleasedReturnValue(),
              BOOL v35 = v34 == v6,
              v34,
              v35))
        {
          objc_msgSend_removeObjectForKey_(self->_chatProperties, v29, (uint64_t)v7, v31);
        }
        else
        {
          uint64_t v37 = self->_chatProperties;
          uint64_t v38 = objc_msgSend_copy(v6, v29, v36, v31);
          objc_msgSend_setObject_forKey_(v37, v39, (uint64_t)v38, (uint64_t)v7);
        }
        uint64_t v43 = objc_msgSend_chatRegistry(self, v40, v41, v42);
        objc_msgSend__chat_setValue_forChatProperty_(v43, v44, (uint64_t)self, (uint64_t)v6, v7);

        if (!objc_msgSend_count(self->_chatProperties, v45, v46, v47))
        {
          uint64_t v49 = self->_chatProperties;
          self->_chatProperties = 0;
        }
        objc_msgSend__postNotification_userInfo_(self, v48, @"__kIMChatPropertiesChangedNotification", 0);
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v50 = 138412290;
        id v51 = v7;
        _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Attempt to modify chat property: %@ which is not in the allowlist", (uint8_t *)&v50, 0xCu);
      }
    }
  }
  else
  {
    id v18 = IMLogHandleForCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB8C6C();
    }
  }
}

- (void)consumeSummaryIfNeeded
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend_messageSummarizationEnabled(MEMORY[0x1E4F6E790], a2, v2, v3))
  {
    uint64_t v7 = *MEMORY[0x1E4F6CD00];
    uint64_t v8 = objc_msgSend_valueForChatProperty_(self, v5, *MEMORY[0x1E4F6CD00], v6);
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      uint64_t v11 = *MEMORY[0x1E4F6CCF8];
      uint64_t v12 = objc_msgSend_objectForKey_(v8, v9, *MEMORY[0x1E4F6CCF8], v10);
      char v16 = objc_msgSend_BOOLValue(v12, v13, v14, v15);

      if ((v16 & 1) == 0)
      {
        uint64_t v20 = objc_msgSend_mutableCopy(v8, v17, v18, v19);
        objc_msgSend_setObject_forKey_(v20, v21, MEMORY[0x1E4F1CC38], v11);
        if (IMOSLoggingEnabled())
        {
          uint64_t v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            int v29 = objc_msgSend_guid(self, v26, v27, v28);
            int v32 = 138412290;
            uint64_t v33 = v29;
            _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Marking summary as consumed on chat with GUID %@", (uint8_t *)&v32, 0xCu);
          }
        }
        uint64_t v30 = objc_msgSend_copy(v20, v22, v23, v24);
        objc_msgSend_setValue_forChatProperty_(self, v31, (uint64_t)v30, v7);
      }
    }
  }
}

- (void)userToggledReadReceiptSwitch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      guid = self->_guid;
      chatProperties = self->_chatProperties;
      *(_DWORD *)buf = 67109634;
      *(_DWORD *)uint64_t v85 = v3;
      *(_WORD *)&v85[4] = 2112;
      *(void *)&v85[6] = guid;
      *(_WORD *)&v85[14] = 2112;
      *(void *)&v85[16] = chatProperties;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "User toggled the read receipt setting to: %d for chat: %@ with properties prior to updating: %@", buf, 0x1Cu);
    }
  }
  uint64_t v10 = *MEMORY[0x1E4F6CE10];
  uint64_t v11 = objc_msgSend_valueForChatProperty_(self, v5, *MEMORY[0x1E4F6CE10], v6);
  uint64_t v80 = v11;
  if (v11)
  {
    uint64_t v15 = objc_msgSend_integerValue(v11, v12, v13, v14) + 1;
    objc_msgSend_numberWithInteger_(NSNumber, v16, v15, v17);
  }
  else
  {
    objc_msgSend_numberWithInteger_(NSNumber, v12, 1, v14);
  uint64_t v81 = };
  uint64_t v20 = objc_msgSend_numberWithBool_(NSNumber, v18, v3, v19);
  if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)uint64_t v85 = v81;
      *(_WORD *)&v85[8] = 2112;
      *(void *)&v85[10] = v80;
      _os_log_impl(&dword_1A4AF7000, v21, OS_LOG_TYPE_INFO, "Setting read receipt versionID to: %@ from: %@", buf, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v85 = v20;
      _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Setting read receipt value to: %@", buf, 0xCu);
    }
  }
  objc_msgSend_setValue_forChatProperty_(self, v22, (uint64_t)v81, v10);
  uint64_t v24 = *MEMORY[0x1E4F6CD30];
  objc_msgSend_setValue_forChatProperty_(self, v25, (uint64_t)v20, *MEMORY[0x1E4F6CD30]);
  v82[0] = v10;
  v82[1] = v24;
  v83[0] = v81;
  v83[1] = v20;
  uint64_t v27 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v26, (uint64_t)v83, (uint64_t)v82, 2);
  if (IMOSLoggingEnabled())
  {
    uint64_t v31 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v85 = v27;
      _os_log_impl(&dword_1A4AF7000, v31, OS_LOG_TYPE_INFO, "Sending generic notification to update chat properties for properties: %@", buf, 0xCu);
    }
  }
  int v32 = objc_msgSend_sharedInstance(IMAccountController, v28, v29, v30);
  uint64_t v36 = objc_msgSend_iMessageService(IMServiceImpl, v33, v34, v35);
  uint64_t v40 = objc_msgSend_strippedLogin(self->_account, v37, v38, v39);
  uint64_t v42 = objc_msgSend_bestOperationalAccountForService_withLogin_(v32, v41, (uint64_t)v36, (uint64_t)v40);

  if (v42) {
    goto LABEL_38;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v46 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      int v50 = objc_msgSend_strippedLogin(self->_account, v47, v48, v49);
      *(_DWORD *)buf = 138412290;
      *(void *)uint64_t v85 = v50;
      _os_log_impl(&dword_1A4AF7000, v46, OS_LOG_TYPE_INFO, "Could not find operational account with login %@, looking for next best operational account.", buf, 0xCu);
    }
  }
  id v51 = objc_msgSend_sharedInstance(IMAccountController, v43, v44, v45);
  uint64_t v55 = objc_msgSend_iMessageService(IMServiceImpl, v52, v53, v54);
  uint64_t v42 = objc_msgSend_bestOperationalAccountForService_(v51, v56, (uint64_t)v55, v57);

  if (v42)
  {
LABEL_38:
    if (IMOSLoggingEnabled())
    {
      uint64_t v61 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)uint64_t v85 = v42;
        _os_log_impl(&dword_1A4AF7000, v61, OS_LOG_TYPE_INFO, "Found account for sending: %@", buf, 0xCu);
      }
    }
    long long v62 = objc_msgSend_daemonController(self, v58, v59, v60);
    long long v65 = objc_msgSend_numberWithInteger_(NSNumber, v63, 60000, v64);
    uint64_t v69 = objc_msgSend_loginIMHandle(self->_account, v66, v67, v68);
    long long v73 = objc_msgSend_ID(v69, v70, v71, v72);
    uint64_t v77 = objc_msgSend_uniqueID(v42, v74, v75, v76);
    objc_msgSend_sendCommand_withProperties_toPerson_account_toChatID_identifier_style_(v62, v78, (uint64_t)v65, (uint64_t)v27, v73, v77, self->_guid, self->_identifier, self->_style);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v79 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v79, OS_LOG_TYPE_INFO, "Could not find operational account to use for syncing chat properties.", buf, 2u);
    }
  }
}

- (id)allPropertiesOfParticipant:(id)a3
{
  participantProperties = self->_participantProperties;
  uint64_t v5 = objc_msgSend_guid(a3, a2, (uint64_t)a3, v3);
  uint64_t v8 = objc_msgSend_objectForKey_(participantProperties, v6, (uint64_t)v5, v7);

  return v8;
}

- (id)valueForProperty:(id)a3 ofParticipant:(id)a4
{
  id v6 = a3;
  uint64_t v9 = objc_msgSend_allPropertiesOfParticipant_(self, v7, (uint64_t)a4, v8);
  uint64_t v12 = objc_msgSend_objectForKey_(v9, v10, (uint64_t)v6, v11);

  return v12;
}

- (void)setValue:(id)a3 forProperty:(id)a4 ofParticipant:(id)a5
{
  id v28 = a3;
  id v8 = a4;
  id v9 = a5;
  uint64_t v12 = v9;
  if (v8 && v9)
  {
    objc_msgSend_allPropertiesOfParticipant_(self, v10, (uint64_t)v9, v11);
    id v14 = (id)objc_claimAutoreleasedReturnValue();
    if (!v14)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      participantProperties = self->_participantProperties;
      if (!participantProperties)
      {
        CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
        uint64_t v20 = self->_participantProperties;
        self->_participantProperties = Mutable;

        participantProperties = self->_participantProperties;
      }
      uint64_t v21 = objc_msgSend_guid(v12, v15, v16, v17);
      objc_msgSend_setObject_forKey_(participantProperties, v22, (uint64_t)v14, (uint64_t)v21);
    }
    objc_msgSend_setObject_forKey_(v14, v13, (uint64_t)v28, (uint64_t)v8);
    uint64_t v26 = objc_msgSend_chatRegistry(self, v23, v24, v25);
    objc_msgSend__chat_setProperties_ofParticipant_(v26, v27, (uint64_t)self, (uint64_t)v14, v12);
  }
}

- (id)_mergeParticipantIDs
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v7 = objc_msgSend_participants(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_count(v7, v8, v9, v10);
  id v14 = objc_msgSend_initWithCapacity_(v3, v12, v11, v13);

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  uint64_t v18 = objc_msgSend_participants(self, v15, v16, v17, 0);
  uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v53, (uint64_t)v57, 16);
  if (v20)
  {
    uint64_t v24 = v20;
    uint64_t v25 = *(void *)v54;
    uint64_t v26 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v24; ++i)
      {
        if (*(void *)v54 != v25) {
          objc_enumerationMutation(v18);
        }
        id v28 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if (objc_msgSend_isContact(v28, v21, v22, v23)
          && IMSharedHelperContactsBasedMergingEnabled())
        {
          uint64_t v31 = objc_msgSend_cnContactWithKeys_(v28, v29, v26, v30);
          uint64_t v35 = objc_msgSend_identifier(v31, v32, v33, v34);

          uint64_t v39 = objc_msgSend_length(v35, v36, v37, v38);
        }
        else if (IMSharedHelperPersonCentricMergingEnabled())
        {
          uint64_t v35 = objc_msgSend_personCentricID(v28, v43, v44, v45);
          uint64_t v39 = objc_msgSend_length(v35, v46, v47, v48);
        }
        else
        {
          uint64_t v35 = 0;
          uint64_t v39 = objc_msgSend_length(0, v43, v44, v45);
        }
        if (!v39)
        {
          uint64_t v49 = objc_msgSend_ID(v28, v40, v41, v42);

          uint64_t v35 = (void *)v49;
        }
        if (objc_msgSend_length(v35, v40, v41, v42)) {
          objc_msgSend_addObject_(v14, v50, (uint64_t)v35, v51);
        }
        else {
          objc_msgSend_addObject_(v14, v50, @"invalidHandle", v51);
        }
      }
      uint64_t v24 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v53, (uint64_t)v57, 16);
    }
    while (v24);
  }

  return v14;
}

- (id)_generatePersonCentricID
{
  uint64_t v46 = (void *)MEMORY[0x1E4F6E670];
  uint64_t v5 = objc_msgSend_guid(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_chatIdentifier(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_chatStyle(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_groupID(self, v14, v15, v16);
  uint64_t v21 = objc_msgSend_displayName(self, v18, v19, v20);
  uint64_t KnownHybridState = objc_msgSend__lastKnownHybridState(self, v22, v23, v24);
  uint64_t v29 = objc_msgSend_account(self, v26, v27, v28);
  uint64_t v33 = objc_msgSend_service(v29, v30, v31, v32);
  char v37 = objc_msgSend_groupsMergeDisplayNames(v33, v34, v35, v36);
  uint64_t v41 = objc_msgSend__mergeParticipantIDs(self, v38, v39, v40);
  char v45 = v37;
  uint64_t v43 = objc_msgSend_personCentricIDForChatWithGUID_chatIdentifier_chatStyle_groupID_displayName_lastKnownToBeHybrid_mergeDisplayNames_participantIDs_(v46, v42, (uint64_t)v5, (uint64_t)v9, v13, v17, v21, KnownHybridState, v45, v41);

  return v43;
}

- (BOOL)_hasCommunicatedOnService:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_account(self, v5, v6, v7);
  objc_msgSend_service(v8, v9, v10, v11);
  id v12 = (id)objc_claimAutoreleasedReturnValue();

  if (v12 == v4)
  {
    char hasChat_forService = 1;
  }
  else
  {
    uint64_t v16 = objc_msgSend_chatRegistry(self, v13, v14, v15);
    char hasChat_forService = objc_msgSend__hasChat_forService_(v16, v17, (uint64_t)self, (uint64_t)v4);
  }
  return hasChat_forService;
}

- (void)_setAccount:(id)a3
{
}

- (void)_setAccount:(id)a3 locally:(BOOL)a4
{
  BOOL v134 = a4;
  uint64_t v147 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v135 = self;
  if (objc_msgSend_joinState(self, v7, v8, v9))
  {
    char isEqual = 0;
  }
  else
  {
    uint64_t v13 = objc_msgSend_service(v6, v10, v11, v12);
    uint64_t v17 = objc_msgSend_iMessageService(IMServiceImpl, v14, v15, v16);
    if (objc_msgSend_isEqual_(v13, v18, (uint64_t)v17, v19))
    {
      uint64_t v23 = objc_msgSend_service(self->_account, v20, v21, v22);
      uint64_t v27 = objc_msgSend_iMessageService(IMServiceImpl, v24, v25, v26);
      char isEqual = objc_msgSend_isEqual_(v23, v28, (uint64_t)v27, v29);
    }
    else
    {
      char isEqual = 0;
    }
  }
  uint64_t v30 = objc_msgSend_service(v6, v10, v11, v12);
  int v34 = objc_msgSend_supportsMessaging(v30, v31, v32, v33);

  uint64_t v38 = (unsigned __int8 *)v135;
  if (!v6) {
    goto LABEL_65;
  }
  p_account = (void **)&v135->_account;
  if (v135->_account == v6 || v34 == 0) {
    goto LABEL_65;
  }
  uint64_t v41 = objc_msgSend_joinState(v135, v35, v36, v37);
  BOOL v132 = v41 != 4;
  if (v41 != 4 && v134)
  {
    uint64_t v42 = objc_msgSend_chatRegistry(v135, v35, v36, v37);
    uint64_t v46 = objc_msgSend_account(v135, v43, v44, v45);
    int v50 = objc_msgSend_service(v46, v47, v48, v49);
    uint64_t v38 = (unsigned __int8 *)v135;
    BOOL v132 = (objc_msgSend__hasChat_forService_(v42, v51, (uint64_t)v135, (uint64_t)v50) & 1) == 0
        && objc_msgSend_joinState(v135, v52, v53, v54) == 3;
  }
  long long v55 = *p_account;
  if (*p_account != v6)
  {
    int v56 = v38[41];
    if (v56 == 35 || v56 == 43)
    {
LABEL_29:
      uint64_t v67 = objc_msgSend_service(v55, v35, v36, v37);
      uint64_t v71 = objc_msgSend_service(v6, v68, v69, v70);

      if (IMOSLoggingEnabled())
      {
        uint64_t v72 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
        {
          objc_msgSend_uniqueID(*p_account, v73, v74, v75);
          id v76 = (id)objc_claimAutoreleasedReturnValue();
          uint64_t v80 = objc_msgSend_uniqueID(v6, v77, v78, v79);
          uint64_t v81 = (void *)v80;
          uint64_t v82 = @"YES";
          *(_DWORD *)buf = 138412802;
          id v142 = v76;
          __int16 v143 = 2112;
          if (v67 == v71) {
            uint64_t v82 = @"NO";
          }
          uint64_t v144 = v80;
          __int16 v145 = 2112;
          uint64_t v146 = v82;
          _os_log_impl(&dword_1A4AF7000, v72, OS_LOG_TYPE_INFO, "Trying to change group chat account from %@ to %@ (service change: %@)", buf, 0x20u);
        }
      }
      objc_storeStrong(p_account, a3);
      uint64_t v86 = objc_msgSend_participants(v135, v83, v84, v85);
      uint64_t v90 = objc_msgSend_copy(v86, v87, v88, v89);

      uint64_t v91 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1C978]);
      participants = v135->_participants;
      v135->_participants = v91;

      objc_msgSend_removeAllObjects(v135->_participantStates, v93, v94, v95);
      id v96 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v100 = objc_msgSend_count(v90, v97, v98, v99);
      uint64_t v103 = objc_msgSend_initWithCapacity_(v96, v101, v100, v102);
      long long v138 = 0u;
      long long v139 = 0u;
      long long v136 = 0u;
      long long v137 = 0u;
      id v104 = v90;
      uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v105, (uint64_t)&v136, (uint64_t)v140, 16);
      if (v108)
      {
        uint64_t v109 = *(void *)v137;
        do
        {
          for (uint64_t i = 0; i != v108; ++i)
          {
            if (*(void *)v137 != v109) {
              objc_enumerationMutation(v104);
            }
            uint64_t v111 = *(void **)(*((void *)&v136 + 1) + 8 * i);
            uint64_t v112 = objc_msgSend_imHandleForOtherAccount_(v111, v106, (uint64_t)v6, v107);
            if (IMOSLoggingEnabled())
            {
              uint64_t v115 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v115, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v142 = v111;
                __int16 v143 = 2112;
                uint64_t v144 = (uint64_t)v112;
                _os_log_impl(&dword_1A4AF7000, v115, OS_LOG_TYPE_INFO, " Old handle: %@     New handle: %@", buf, 0x16u);
              }
            }
            if (v112) {
              objc_msgSend_addObject_(v103, v113, (uint64_t)v112, v114);
            }
          }
          uint64_t v108 = objc_msgSend_countByEnumeratingWithState_objects_count_(v104, v106, (uint64_t)&v136, (uint64_t)v140, 16);
        }
        while (v108);
      }

      if (v132) {
        objc_msgSend__addParticipants_withState_(v135, v116, (uint64_t)v103, 1);
      }
      else {
        objc_msgSend__addParticipants_withState_(v135, v116, (uint64_t)v103, 16);
      }
      if (IMOSLoggingEnabled())
      {
        __int16 v120 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
        {
          int v124 = objc_msgSend_participants(v135, v121, v122, v123);
          *(_DWORD *)buf = 138412546;
          id v142 = v104;
          __int16 v143 = 2112;
          uint64_t v144 = (uint64_t)v124;
          _os_log_impl(&dword_1A4AF7000, v120, OS_LOG_TYPE_INFO, " Old participants: %@        New participants: %@", buf, 0x16u);
        }
      }
      uint64_t v125 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v117, v118, v119);
      objc_msgSend_postNotificationName_object_(v125, v126, @"__kIMChatSendingServiceChangedNotification", (uint64_t)v135);

      uint64_t v38 = (unsigned __int8 *)v135;
      goto LABEL_56;
    }
    if (v56 == 45)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v60 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
        {
          uint64_t v61 = *p_account;
          *(_DWORD *)buf = 138412546;
          id v142 = v61;
          __int16 v143 = 2112;
          uint64_t v144 = (uint64_t)v6;
          _os_log_impl(&dword_1A4AF7000, v60, OS_LOG_TYPE_INFO, "Trying to change 1-1 account from %@ to %@", buf, 0x16u);
        }

        uint64_t v38 = (unsigned __int8 *)v135;
      }
      long long v62 = objc_msgSend_recipient(v38, v57, v58, v59);
      long long v65 = objc_msgSend_imHandleForOtherAccount_(v62, v63, (uint64_t)v6, v64);

      if (v65) {
        objc_msgSend_setRecipient_locally_(v135, v66, (uint64_t)v65, v134);
      }

      long long v55 = *p_account;
      goto LABEL_29;
    }
  }
LABEL_56:
  if ((isEqual & 1) == 0)
  {
    if (v132)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v127 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
        {
          uint64_t v131 = objc_msgSend_guid(v135, v128, v129, v130);
          *(_DWORD *)buf = 138412290;
          id v142 = v131;
          _os_log_impl(&dword_1A4AF7000, v127, OS_LOG_TYPE_INFO, "Transitioning %@ to joining state due to account change", buf, 0xCu);
        }
      }
      uint64_t v38 = (unsigned __int8 *)v135;
      v135->_joinState = 2;
    }
    if (!v134)
    {
      objc_msgSend_join(v38, v35, v36, v37);
      uint64_t v38 = (unsigned __int8 *)v135;
    }
  }
LABEL_65:
  objc_msgSend__clearCachedIdentifier(v38, v35, v36, v37);
}

- (void)setRecipient:(id)a3 locally:(BOOL)a4
{
  uint64_t v159 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v13 = objc_msgSend_recipient(self, v10, v11, v12);
      *(_DWORD *)buf = 138412802;
      uint64_t v154 = v13;
      __int16 v155 = 2112;
      id v156 = v5;
      __int16 v157 = 2112;
      long long v158 = self;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Trying to change recipient from %@ to %@ (Chat: %@)", buf, 0x20u);
    }
  }
  if (v5)
  {
    uint64_t v14 = objc_msgSend_recipient(self, v6, v7, v8);
    if (objc_msgSend_isEqual_(v14, v15, (uint64_t)v5, v16))
    {
LABEL_47:

      goto LABEL_48;
    }
    if (v14
      && !a4
      && objc_msgSend_chatStyle(self, v17, v18, v19) == 45
      && (objc_msgSend__isChatSiblingOf_(v5, v17, (uint64_t)v14, v19) & 1) == 0
      && (IMSharedHelperPersonCentricMergingEnabled() & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v59 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          uint64_t v154 = v14;
          __int16 v155 = 2112;
          id v156 = v5;
          _os_log_impl(&dword_1A4AF7000, v59, OS_LOG_TYPE_INFO, "** Cannot change recipient from %@ => %@, this is not a chat sibling", buf, 0x16u);
        }
      }
      goto LABEL_47;
    }
    if (objc_msgSend_chatStyle(self, v17, v18, v19) == 45)
    {
      uint64_t v23 = objc_msgSend_originalID(v5, v20, v21, v22);
      uint64_t v27 = objc_msgSend_originalID(v14, v24, v25, v26);
      if (objc_msgSend_isEqualToString_(v23, v28, (uint64_t)v27, v29))
      {
        uint64_t v33 = objc_msgSend_ID(v5, v30, v31, v32);
        uint64_t v37 = objc_msgSend_originalID(v14, v34, v35, v36);
        if ((objc_msgSend_isEqualToString_(v33, v38, (uint64_t)v37, v39) & 1) == 0)
        {
          uint64_t v43 = objc_msgSend_ID(v5, v40, v41, v42);
          if (MEMORY[0x1A62639B0]())
          {
            uint64_t v47 = objc_msgSend_ID(v14, v44, v45, v46);
            if (MEMORY[0x1A62639B0]())
            {
              uint64_t v149 = objc_msgSend_ID(v5, v48, v49, v50);
              __int16 v145 = IMCountryCodeForNumber();
              uint64_t v147 = objc_msgSend_ID(v14, v51, v52, v53);
              uint64_t v54 = IMCountryCodeForNumber();
              char isEqualToString = objc_msgSend_isEqualToString_(v145, v55, (uint64_t)v54, v56);

              if ((isEqualToString & 1) == 0)
              {
                uint64_t v57 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E890], v20, v21, v22);
                objc_msgSend_forceAutoBugCaptureWithSubType_errorPayload_type_context_(v57, v58, @"Country Code Swap", 0, @"DSDS Privacy Violation", @"Detected an attempt to retarget a chat at the same destination, but with a different country code");

                goto LABEL_47;
              }
              goto LABEL_27;
            }
          }
        }
      }
    }
LABEL_27:
    v150 = objc_msgSend_recipient(self, v20, v21, v22);
    id v60 = v5;
    uint64_t v146 = self->_account;
    objc_msgSend_account(v60, v61, v62, v63);
    uint64_t v148 = (IMAccount *)objc_claimAutoreleasedReturnValue();
    id v69 = (id)objc_msgSend_mutableCopy(self->_participants, v64, v65, v66);
    if (!v69) {
      id v69 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    if (objc_msgSend_containsObjectIdenticalTo_(v69, v67, (uint64_t)v150, v68)) {
      objc_msgSend_removeObject_(v69, v70, (uint64_t)v150, v71);
    }
    objc_msgSend_addObject_(v69, v70, (uint64_t)v60, v71);
    objc_storeStrong((id *)&self->_participants, v69);
    uint64_t v75 = objc_msgSend_service(v148, v72, v73, v74);
    unsigned __int8 v79 = objc_msgSend_supportsMessaging(v75, v76, v77, v78);

    if (((v146 != v148) & v79) == 1)
    {
      account = self->_account;
      objc_msgSend_account(v60, v80, v81, v82);
      uint64_t v84 = (IMAccount *)objc_claimAutoreleasedReturnValue();
      LOBYTE(account) = account == v84;

      if ((account & 1) == 0)
      {
        objc_msgSend_account(v60, v80, v81, v82);
        uint64_t v85 = (IMAccount *)objc_claimAutoreleasedReturnValue();
        uint64_t v86 = self->_account;
        self->_account = v85;

        self->_senderBlackholeWarningStatus = 0;
        uint64_t v90 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v87, v88, v89);
        objc_msgSend_postNotificationName_object_(v90, v91, @"__kIMChatSendingServiceChangedNotification", (uint64_t)self);
      }
    }
    objc_msgSend__clearCachedIdentifier(self, v80, v81, v82);
    id v92 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    uint64_t v95 = objc_msgSend_initWithObjectsAndKeys_(v92, v93, (uint64_t)v60, v94, @"__kIMChatValueKey", v150, @"__kIMChatOldValueKey", 0);
    objc_msgSend__postNotification_userInfo_(self, v96, @"__kIMChatRecipientDidChangeNotification", (uint64_t)v95);
    objc_msgSend__postNotification_userInfo_(self, v97, @"__kIMChatParticipantsDidChangeNotification", 0);
    if (a4)
    {
      uint64_t v101 = objc_msgSend_chatRegistry(self, v98, v99, v100);
      BOOL v105 = objc_msgSend_account(self, v102, v103, v104);
      uint64_t v109 = objc_msgSend_service(v105, v106, v107, v108);
      if (objc_msgSend__hasChat_forService_(v101, v110, (uint64_t)self, (uint64_t)v109))
      {
      }
      else
      {
        BOOL v119 = objc_msgSend_joinState(self, v111, v112, v113) == 3;

        if (v119)
        {
          if (IMOSLoggingEnabled())
          {
            __int16 v120 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
            {
              int v124 = objc_msgSend_guid(self, v121, v122, v123);
              uint64_t v152 = objc_msgSend_account(self, v125, v126, v127);
              id v142 = objc_msgSend_uniqueID(v152, v128, v129, v130);
              uint64_t v144 = objc_msgSend_account(self, v131, v132, v133);
              long long v137 = objc_msgSend_service(v144, v134, v135, v136);
              objc_msgSend_internalName(v137, v138, v139, v140);
              v141 = (IMChat *)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412802;
              uint64_t v154 = v124;
              __int16 v155 = 2112;
              id v156 = v142;
              __int16 v157 = 2112;
              long long v158 = v141;
              _os_log_impl(&dword_1A4AF7000, v120, OS_LOG_TYPE_INFO, "Transitioning %@ to joining state because chat registry does not have chat for new account %@ on service %@", buf, 0x20u);
            }
          }
          self->_joinState = 2;
        }
      }
    }
    else if (objc_msgSend_joinState(self, v98, v99, v100) == 3)
    {
      uint64_t v117 = objc_msgSend_chatRegistry(self, v114, v115, v116);
      objc_msgSend__chat_joinWithProperties_(v117, v118, (uint64_t)self, (uint64_t)self->_chatProperties);
    }
    else
    {
      objc_msgSend_join(self, v114, v115, v116);
    }

    goto LABEL_47;
  }
LABEL_48:
}

- (void)setRecipient:(id)a3
{
}

- (void)join
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      uint64_t v18 = self;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "Request to join chat: %@", (uint8_t *)&v17, 0xCu);
    }
  }
  if ((unint64_t)(self->_joinState - 3) >= 2)
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        objc_msgSend_guid(self, v7, v8, v9);
        uint64_t v10 = (IMChat *)objc_claimAutoreleasedReturnValue();
        int64_t joinState = self->_joinState;
        int v17 = 138412546;
        uint64_t v18 = v10;
        __int16 v19 = 2048;
        int64_t v20 = joinState;
        _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Transitioning %@ to joining state due to join from state %ld", (uint8_t *)&v17, 0x16u);
      }
    }
    objc_msgSend__setJoinState_(self, v4, 2, v5);
    uint64_t v15 = objc_msgSend_chatRegistry(self, v12, v13, v14);
    objc_msgSend__chat_joinWithProperties_(v15, v16, (uint64_t)self, (uint64_t)self->_chatProperties);
  }
}

- (void)leave
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      uint64_t v12 = self;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Request to leave chat: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  if (self->_style == 45)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        uint64_t v12 = self;
        _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Not allowed to leave 1:1 chat: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    if (self->_joinState == 3) {
      objc_msgSend__setJoinState_(self, v3, 1, v5);
    }
    uint64_t v8 = objc_msgSend_chatRegistry(self, v3, v4, v5);
    objc_msgSend__chat_leave_(v8, v9, (uint64_t)self, v10);
  }
}

- (void)remove
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      int v11 = self;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Request to remove chat: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  if (self->_joinState == 3) {
    objc_msgSend__setJoinState_(self, v3, 1, v5);
  }
  uint64_t v7 = objc_msgSend_chatRegistry(self, v3, v4, v5);
  objc_msgSend__chat_remove_(v7, v8, (uint64_t)self, v9);
}

- (void)_addParticipants:(id)a3 withState:(unint64_t)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (objc_msgSend_count(v6, v7, v8, v9))
  {
    id v10 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v14 = objc_msgSend_count(v6, v11, v12, v13);
    int v17 = objc_msgSend_initWithCapacity_(v10, v15, v14, v16);
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    id v18 = v6;
    uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v19, (uint64_t)&v38, (uint64_t)v42, 16);
    if (v20)
    {
      uint64_t v23 = v20;
      uint64_t v24 = *(void *)v39;
      do
      {
        for (uint64_t i = 0; i != v23; ++i)
        {
          if (*(void *)v39 != v24) {
            objc_enumerationMutation(v18);
          }
          uint64_t v26 = *(void *)(*((void *)&v38 + 1) + 8 * i);
          if ((objc_msgSend_containsObject_(self->_participants, v21, v26, v22, (void)v38) & 1) == 0) {
            objc_msgSend_addObject_(v17, v21, v26, v22);
          }
        }
        uint64_t v23 = objc_msgSend_countByEnumeratingWithState_objects_count_(v18, v21, (uint64_t)&v38, (uint64_t)v42, 16);
      }
      while (v23);
    }

    if (objc_msgSend_count(v17, v27, v28, v29))
    {
      uint64_t v36 = (NSArray *)objc_msgSend_mutableCopy(self->_participants, v30, v31, v32);
      if (!v36) {
        uint64_t v36 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      }
      if (self->_style == 45) {
        objc_msgSend_removeAllObjects(v36, v33, v34, v35);
      }
      objc_msgSend_addObjectsFromArray_(v36, v33, (uint64_t)v17, v35, (void)v38);
      participants = self->_participants;
      self->_participants = v36;

      self->_senderBlackholeWarningStatus = 0;
    }
    objc_msgSend__setParticipantState_forHandles_postNotification_(self, v30, a4, (uint64_t)v18, 1, (void)v38);
  }
}

- (BOOL)canLeaveChat
{
  return objc_msgSend__canLeaveChatIgnoringParticipantCount_(self, a2, 0, v2);
}

- (BOOL)_canLeaveChatIgnoringParticipantCount:(BOOL)a3
{
  if (objc_msgSend_chatStyle(self, a2, a3, v3) == 45)
  {
    LOBYTE(v9) = 0;
  }
  else
  {
    id v10 = objc_msgSend_account(self, v6, v7, v8);
    uint64_t v14 = objc_msgSend_service(v10, v11, v12, v13);
    int v9 = objc_msgSend_supportsMutatingGroupMembers(v14, v15, v16, v17);

    if (v9 && !a3)
    {
      uint64_t v21 = objc_msgSend_participants(self, v18, v19, v20);
      LOBYTE(v9) = (unint64_t)objc_msgSend_count(v21, v22, v23, v24) > 2;
    }
  }
  return v9;
}

- (BOOL)canAddParticipant:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_participants(self, v5, v6, v7);
  char v11 = objc_msgSend_containsObject_(v8, v9, (uint64_t)v4, v10);

  if (v11)
  {
    BOOL v15 = 1;
  }
  else if (objc_msgSend_chatStyle(self, v12, v13, v14) == 45 {
         || objc_msgSend_joinState(self, v16, v17, v18) >= 1
  }
         && (objc_msgSend_account(self, v19, v20, v21),
             uint64_t v22 = objc_claimAutoreleasedReturnValue(),
             objc_msgSend_service(v22, v23, v24, v25),
             uint64_t v26 = objc_claimAutoreleasedReturnValue(),
             int v30 = objc_msgSend_supportsMutatingGroupMembers(v26, v27, v28, v29),
             v26,
             v22,
             !v30))
  {
    BOOL v15 = 0;
  }
  else
  {
    uint64_t v34 = objc_msgSend_service(v4, v19, v20, v21);
    if (!v34)
    {
      uint64_t v35 = objc_msgSend_account(self, v31, v32, v33);
      uint64_t v34 = objc_msgSend_service(v35, v36, v37, v38);
    }
    long long v39 = objc_msgSend_lastAddressedHandleID(self, v31, v32, v33);
    uint64_t v43 = objc_msgSend_lastAddressedSIMID(self, v40, v41, v42);
    uint64_t v45 = objc_msgSend_maxChatParticipantsForHandle_simID_(v34, v44, (uint64_t)v39, (uint64_t)v43);

    if (v45 < 1) {
      goto LABEL_16;
    }
    uint64_t v49 = objc_msgSend_participants(self, v46, v47, v48);
    uint64_t v53 = objc_msgSend_count(v49, v50, v51, v52);
    uint64_t v57 = objc_msgSend_lastAddressedHandleID(self, v54, v55, v56);
    uint64_t v61 = objc_msgSend_lastAddressedSIMID(self, v58, v59, v60);
    unint64_t v62 = v53 + 1;
    unint64_t v64 = objc_msgSend_maxChatParticipantsForHandle_simID_(v34, v63, (uint64_t)v57, (uint64_t)v61);

    if (v62 <= v64)
    {
LABEL_16:
      BOOL v15 = 1;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v65 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          int v67 = 138412546;
          id v68 = v4;
          __int16 v69 = 1024;
          int v70 = v45;
          _os_log_impl(&dword_1A4AF7000, v65, OS_LOG_TYPE_INFO, "Cannot add participant %@  that would put us over our max size of: %d", (uint8_t *)&v67, 0x12u);
        }
      }
      BOOL v15 = 0;
    }
  }
  return v15;
}

- (BOOL)canAddParticipants:(id)a3
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_count(v4, v5, v6, v7) && objc_msgSend_chatStyle(self, v8, v9, v10) != 45)
  {
    BOOL v15 = objc_msgSend_lastObject(v4, v11, v12, v13);
    uint64_t v19 = objc_msgSend_service(v15, v16, v17, v18);

    if (!v19)
    {
      uint64_t v23 = objc_msgSend_account(self, v20, v21, v22);
      uint64_t v19 = objc_msgSend_service(v23, v24, v25, v26);
    }
    uint64_t v27 = objc_msgSend_lastAddressedHandleID(self, v20, v21, v22);
    uint64_t v31 = objc_msgSend_lastAddressedSIMID(self, v28, v29, v30);
    uint64_t v33 = objc_msgSend_maxChatParticipantsForHandle_simID_(v19, v32, (uint64_t)v27, (uint64_t)v31);

    if (v33 < 1) {
      goto LABEL_13;
    }
    uint64_t v37 = objc_msgSend_count(v4, v34, v35, v36);
    uint64_t v41 = objc_msgSend_participants(self, v38, v39, v40);
    uint64_t v45 = objc_msgSend_count(v41, v42, v43, v44);
    uint64_t v49 = objc_msgSend_lastAddressedHandleID(self, v46, v47, v48);
    uint64_t v53 = objc_msgSend_lastAddressedSIMID(self, v50, v51, v52);
    unint64_t v54 = v45 + v37;
    unint64_t v56 = objc_msgSend_maxChatParticipantsForHandle_simID_(v19, v55, (uint64_t)v49, (uint64_t)v53);

    if (v54 <= v56)
    {
LABEL_13:
      long long v68 = 0u;
      long long v69 = 0u;
      long long v66 = 0u;
      long long v67 = 0u;
      id v58 = v4;
      uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v59, (uint64_t)&v66, (uint64_t)v70, 16);
      if (v62)
      {
        uint64_t v63 = *(void *)v67;
        while (2)
        {
          for (uint64_t i = 0; i != v62; ++i)
          {
            if (*(void *)v67 != v63) {
              objc_enumerationMutation(v58);
            }
            if (!objc_msgSend_canAddParticipant_(self, v60, *(void *)(*((void *)&v66 + 1) + 8 * i), v61, (void)v66))
            {
              BOOL v14 = 0;
              goto LABEL_23;
            }
          }
          uint64_t v62 = objc_msgSend_countByEnumeratingWithState_objects_count_(v58, v60, (uint64_t)&v66, (uint64_t)v70, 16);
          if (v62) {
            continue;
          }
          break;
        }
      }
      BOOL v14 = 1;
LABEL_23:
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v57 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v72 = v4;
          __int16 v73 = 1024;
          int v74 = v33;
          _os_log_impl(&dword_1A4AF7000, v57, OS_LOG_TYPE_INFO, "Cannot add participants: %@ that would put us over our max size of: %d", buf, 0x12u);
        }
      }
      BOOL v14 = 0;
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (id)_pendingParticipants
{
  if (objc_msgSend_canHaveMultipleParticipants(self, a2, v2, v3)
    && objc_msgSend_chatStyle(self, v5, v6, v7) == 43)
  {
    uint64_t v10 = objc_msgSend_participantsWithState_(self, v8, 1, v9);
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (void)inviteParticipants:(id)a3 reason:(id)a4
{
  uint64_t v184 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (uint64_t (*)(uint64_t, uint64_t))a4;
  if (IMOSLoggingEnabled())
  {
    char v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = self;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v6;
      *(_WORD *)&buf[22] = 2112;
      id v181 = v7;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Request to invite participants to chat: %@   handles: %@  reason: %@", buf, 0x20u);
    }
  }
  if (objc_msgSend_chatStyle(self, v8, v9, v10) == 45)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = self;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Cannot mutate participants on 1-1 chat: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v16 = objc_msgSend_lastObject(v6, v12, v13, v14);
    uint64_t v20 = objc_msgSend_service(v16, v17, v18, v19);

    if (!v20)
    {
      uint64_t v24 = objc_msgSend_account(self, v21, v22, v23);
      uint64_t v20 = objc_msgSend_service(v24, v25, v26, v27);
    }
    uint64_t v28 = objc_msgSend_account(self, v21, v22, v23);
    uint64_t v32 = objc_msgSend_service(v28, v29, v30, v31);
    char v36 = objc_msgSend_supportsMutatingGroupMembers(v32, v33, v34, v35);

    if (v36)
    {
      *(void *)buf = 0;
      *(void *)&buf[8] = buf;
      *(void *)&uint8_t buf[16] = 0x3032000000;
      id v181 = sub_1A4B3452C;
      uint64_t v182 = sub_1A4B3437C;
      id v183 = 0;
      id v183 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v172[0] = MEMORY[0x1E4F143A8];
      v172[1] = 3221225472;
      v172[2] = sub_1A4BE3C60;
      v172[3] = &unk_1E5B7D640;
      v172[4] = self;
      v172[5] = buf;
      objc_msgSend_enumerateObjectsUsingBlock_(v6, v37, (uint64_t)v172, v38);
      uint64_t v42 = objc_msgSend_lastAddressedHandleID(self, v39, v40, v41);
      uint64_t v46 = objc_msgSend_lastAddressedSIMID(self, v43, v44, v45);
      uint64_t v48 = objc_msgSend_maxChatParticipantsForHandle_simID_(v20, v47, (uint64_t)v42, (uint64_t)v46);

      if (objc_msgSend_count(*(void **)(*(void *)&buf[8] + 40), v49, v50, v51))
      {
        if (v48 >= 1)
        {
          uint64_t v55 = objc_msgSend_count(*(void **)(*(void *)&buf[8] + 40), v52, v53, v54);
          uint64_t v59 = objc_msgSend_participants(self, v56, v57, v58);
          uint64_t v63 = objc_msgSend_count(v59, v60, v61, v62);
          long long v67 = objc_msgSend_lastAddressedHandleID(self, v64, v65, v66);
          uint64_t v71 = objc_msgSend_lastAddressedSIMID(self, v68, v69, v70);
          LODWORD(v55) = v63 + v55 > (unint64_t)objc_msgSend_maxChatParticipantsForHandle_simID_(v20, v72, (uint64_t)v67, (uint64_t)v71);

          if (v55)
          {
            if (IMOSLoggingEnabled())
            {
              id v76 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)long long v175 = 67109120;
                LODWORD(v176) = v48;
                _os_log_impl(&dword_1A4AF7000, v76, OS_LOG_TYPE_INFO, "Failing to invite some participants that would put us over our max size of: %d", v175, 8u);
              }
            }
            uint64_t v77 = objc_msgSend_participants(self, v73, v74, v75);
            BOOL v81 = objc_msgSend_count(v77, v78, v79, v80) == v48;

            if (v81)
            {
              objc_msgSend_removeAllObjects(*(void **)(*(void *)&buf[8] + 40), v82, v83, v84);
            }
            else
            {
              uint64_t v94 = objc_msgSend_participants(self, v82, v83, v84);
              uint64_t v98 = objc_msgSend_count(v94, v95, v96, v97);
              uint64_t v102 = objc_msgSend_count(*(void **)(*(void *)&buf[8] + 40), v99, v100, v101);

              uint64_t v103 = *(void **)(*(void *)&buf[8] + 40);
              uint64_t v107 = objc_msgSend_count(v103, v104, v105, v106);
              objc_msgSend_removeObjectsInRange_(v103, v108, v107 - (v98 - v48 + v102), v98 - v48 + v102);
            }
            if (IMOSLoggingEnabled())
            {
              uint64_t v109 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
              {
                uint64_t v110 = *(IMChat **)(*(void *)&buf[8] + 40);
                *(_DWORD *)long long v175 = 138412290;
                id v176 = v110;
                _os_log_impl(&dword_1A4AF7000, v109, OS_LOG_TYPE_INFO, "  => Will invite: %@", v175, 0xCu);
              }
            }
          }
        }
      }
      if (objc_msgSend_chatStyle(self, v52, v53, v54) == 45)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v114 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v114, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long v175 = 138412290;
            id v176 = self;
            _os_log_impl(&dword_1A4AF7000, v114, OS_LOG_TYPE_INFO, "Cannot mutate participants on 1-1 chat: %@", v175, 0xCu);
          }
        }
      }
      else
      {
        uint64_t v115 = objc_msgSend__pendingParticipants(self, v111, v112, v113);
        id v116 = objc_alloc(MEMORY[0x1E4F1CA48]);
        uint64_t v120 = objc_msgSend_count(v6, v117, v118, v119);
        uint64_t v124 = objc_msgSend_count(v115, v121, v122, v123);
        uint64_t v127 = objc_msgSend_initWithCapacity_(v116, v125, v124 + v120, v126);
        if (objc_msgSend_count(v6, v128, v129, v130)) {
          objc_msgSend_addObjectsFromArray_(v127, v131, (uint64_t)v6, v133);
        }
        if (objc_msgSend_count(v115, v131, v132, v133)) {
          objc_msgSend_addObjectsFromArray_(v127, v134, (uint64_t)v115, v135);
        }
        id v136 = objc_alloc(MEMORY[0x1E4F1CA48]);
        uint64_t v140 = objc_msgSend_count(v127, v137, v138, v139);
        __int16 v143 = (IMChat *)objc_msgSend_initWithCapacity_(v136, v141, v140, v142);
        uint64_t v167 = v115;
        long long v170 = 0u;
        long long v171 = 0u;
        long long v168 = 0u;
        long long v169 = 0u;
        id v144 = v127;
        uint64_t v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(v144, v145, (uint64_t)&v168, (uint64_t)v179, 16);
        if (v148)
        {
          uint64_t v149 = *(void *)v169;
          do
          {
            for (uint64_t i = 0; i != v148; ++i)
            {
              if (*(void *)v169 != v149) {
                objc_enumerationMutation(v144);
              }
              uint64_t v151 = *(void *)(*((void *)&v168 + 1) + 8 * i);
              if (objc_msgSend_stateForParticipant_(self, v146, v151, v147) != 16) {
                objc_msgSend_addObject_(v143, v146, v151, v147);
              }
            }
            uint64_t v148 = objc_msgSend_countByEnumeratingWithState_objects_count_(v144, v146, (uint64_t)&v168, (uint64_t)v179, 16);
          }
          while (v148);
        }

        if (objc_msgSend_count(v143, v152, v153, v154))
        {
          objc_msgSend_addHandlesToGroupFaceTimeChatIfRegistered_(self, v155, (uint64_t)v143, v156);
          objc_msgSend__addParticipants_withState_(self, v157, (uint64_t)v143, 4);
          if (IMOSLoggingEnabled())
          {
            int v161 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long v175 = 138412546;
              id v176 = v143;
              __int16 v177 = 2112;
              id v178 = v167;
              _os_log_impl(&dword_1A4AF7000, v161, OS_LOG_TYPE_INFO, "Inviting: %@   (Pending: %@)", v175, 0x16u);
            }
          }
          uint64_t v162 = objc_msgSend_chatRegistry(self, v158, v159, v160);
          objc_msgSend__chat_inviteParticipants_reason_(v162, v163, (uint64_t)self, (uint64_t)v143, v7);

          uint64_t v173 = @"__kIMChatParticipantsDidChangeAddedParticipantsKey";
          id v174 = v6;
          __int16 v165 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v164, (uint64_t)&v174, (uint64_t)&v173, 1);
          objc_msgSend__postNotification_userInfo_(self, v166, @"__kIMChatParticipantsDidChangeNotification", (uint64_t)v165);
        }
      }
      _Block_object_dispose(buf, 8);
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v85 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
      {
        uint64_t v89 = objc_msgSend_account(self, v86, v87, v88);
        uint64_t v93 = objc_msgSend_service(v89, v90, v91, v92);
        *(_DWORD *)buf = 138412546;
        *(void *)&uint8_t buf[4] = self;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v93;
        _os_log_impl(&dword_1A4AF7000, v85, OS_LOG_TYPE_INFO, "Cannot mutate participants on chat: %@   service doesn't support it: %@", buf, 0x16u);
      }
    }
  }
}

- (void)removeParticipants:(id)a3 reason:(id)a4
{
  uint64_t v80 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    char v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v75 = self;
      __int16 v76 = 2112;
      id v77 = v6;
      __int16 v78 = 2112;
      id v79 = v7;
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_DEBUG, "chat: %@   handles: %@  reason: %@", buf, 0x20u);
    }
  }
  if (objc_msgSend_chatStyle(self, v8, v9, v10) == 45)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v75 = self;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Cannot mutate participants on 1-1 chat: %@", buf, 0xCu);
      }
LABEL_37:

      goto LABEL_33;
    }
    goto LABEL_33;
  }
  uint64_t v16 = objc_msgSend_account(self, v12, v13, v14);
  uint64_t v20 = objc_msgSend_service(v16, v17, v18, v19);
  char v24 = objc_msgSend_supportsMutatingGroupMembers(v20, v21, v22, v23);

  if ((v24 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        uint64_t v63 = objc_msgSend_account(self, v60, v61, v62);
        long long v67 = objc_msgSend_service(v63, v64, v65, v66);
        *(_DWORD *)buf = 138412546;
        uint64_t v75 = self;
        __int16 v76 = 2112;
        id v77 = v67;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Cannot mutate participants on chat: %@   service doesn't support it: %@", buf, 0x16u);
      }
      goto LABEL_37;
    }
    goto LABEL_33;
  }
  uint64_t v28 = objc_msgSend_participants(self, v25, v26, v27);
  if (!objc_msgSend_count(v28, v29, v30, v31))
  {

LABEL_29:
    if (IMOSLoggingEnabled())
    {
      long long v68 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v68, OS_LOG_TYPE_INFO, "Tried to remove too many participants, ignoring", buf, 2u);
      }
    }
    goto LABEL_33;
  }
  char v34 = objc_msgSend_canRemoveParticipants_(self, v32, (uint64_t)v6, v33);

  if ((v34 & 1) == 0) {
    goto LABEL_29;
  }
  if (objc_msgSend_joinState(self, v35, v36, v37))
  {
    id v38 = objc_alloc(MEMORY[0x1E4F1CA48]);
    uint64_t v42 = objc_msgSend_count(v6, v39, v40, v41);
    uint64_t v45 = objc_msgSend_initWithCapacity_(v38, v43, v42, v44);
    long long v71 = 0u;
    long long v72 = 0u;
    long long v69 = 0u;
    long long v70 = 0u;
    id v46 = v6;
    uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v47, (uint64_t)&v69, (uint64_t)v73, 16);
    if (v50)
    {
      uint64_t v51 = *(void *)v70;
      do
      {
        for (uint64_t i = 0; i != v50; ++i)
        {
          if (*(void *)v70 != v51) {
            objc_enumerationMutation(v46);
          }
          uint64_t v53 = *(void *)(*((void *)&v69 + 1) + 8 * i);
          if (objc_msgSend_containsObject_(self->_participants, v48, v53, v49, (void)v69)) {
            objc_msgSend_addObject_(v45, v48, v53, v49);
          }
        }
        uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v46, v48, (uint64_t)&v69, (uint64_t)v73, 16);
      }
      while (v50);
    }

    objc_msgSend__setParticipantState_forHandles_postNotification_(self, v54, 256, (uint64_t)v45, 1);
    uint64_t v58 = objc_msgSend_chatRegistry(self, v55, v56, v57);
    objc_msgSend__chat_removeParticipants_reason_(v58, v59, (uint64_t)self, (uint64_t)v45, v7);
  }
  else if (IMOSLoggingEnabled())
  {
    BOOL v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v75 = self;
      _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Cannot mutate participants if already left chat: %@", buf, 0xCu);
    }
    goto LABEL_37;
  }
LABEL_33:
}

- (BOOL)canRemoveParticipants:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_participants(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_count(v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_count(v4, v13, v14, v15);

  return (unint64_t)(v12 - v16 + 1) > 2;
}

- (void)addPendingParticipants:(id)a3
{
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_lastObject(v4, v5, v6, v7);
  uint64_t v12 = objc_msgSend_service(v8, v9, v10, v11);

  if (!v12)
  {
    uint64_t v16 = objc_msgSend_account(self, v13, v14, v15);
    uint64_t v12 = objc_msgSend_service(v16, v17, v18, v19);
  }
  uint64_t v61 = 0;
  uint64_t v62 = &v61;
  uint64_t v63 = 0x3032000000;
  unint64_t v64 = sub_1A4B3452C;
  uint64_t v65 = sub_1A4B3437C;
  id v66 = 0;
  id v66 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v60[0] = MEMORY[0x1E4F143A8];
  v60[1] = 3221225472;
  v60[2] = sub_1A4BE4630;
  v60[3] = &unk_1E5B7D640;
  v60[4] = self;
  v60[5] = &v61;
  objc_msgSend_enumerateObjectsUsingBlock_(v4, v20, (uint64_t)v60, v21);
  uint64_t v25 = objc_msgSend_lastAddressedHandleID(self, v22, v23, v24);
  uint64_t v29 = objc_msgSend_lastAddressedSIMID(self, v26, v27, v28);
  uint64_t v31 = objc_msgSend_maxChatParticipantsForHandle_simID_(v12, v30, (uint64_t)v25, (uint64_t)v29);

  if (objc_msgSend_count((void *)v62[5], v32, v33, v34))
  {
    if (v31 >= 1)
    {
      uint64_t v38 = objc_msgSend_count((void *)v62[5], v35, v36, v37);
      uint64_t v42 = objc_msgSend_participants(self, v39, v40, v41);
      uint64_t v46 = objc_msgSend_count(v42, v43, v44, v45);
      uint64_t v50 = objc_msgSend_lastAddressedHandleID(self, v47, v48, v49);
      uint64_t v54 = objc_msgSend_lastAddressedSIMID(self, v51, v52, v53);
      LODWORD(v38) = v46 + v38 > (unint64_t)objc_msgSend_maxChatParticipantsForHandle_simID_(v12, v55, (uint64_t)v50, (uint64_t)v54);

      if (v38)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v56 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            int v70 = v31;
            _os_log_impl(&dword_1A4AF7000, v56, OS_LOG_TYPE_INFO, "Failing to add some pending participants that would put us over our max size of: %d", buf, 8u);
          }
        }
      }
    }
  }
  if (self->_style == 45) {
    objc_msgSend__addParticipants_withState_(self, v35, (uint64_t)v4, 16);
  }
  else {
    objc_msgSend__addParticipants_withState_(self, v35, (uint64_t)v4, 1);
  }
  long long v67 = @"__kIMChatParticipantsDidChangeAddedParticipantsKey";
  id v68 = v4;
  uint64_t v58 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v57, (uint64_t)&v68, (uint64_t)&v67, 1);
  objc_msgSend__postNotification_userInfo_(self, v59, @"__kIMChatParticipantsDidChangeNotification", (uint64_t)v58);

  _Block_object_dispose(&v61, 8);
}

- (BOOL)hasMessageFromMe
{
  return objc_msgSend_numberOfTimesRespondedToThread(self, a2, v2, v3) > 0;
}

- (id)momentShareCache
{
  momentShareCache = self->_momentShareCache;
  if (!momentShareCache)
  {
    objc_msgSend_sharedInstance(IMMomentShareCache, a2, v2, v3);
    uint64_t v6 = (IMMomentShareCache *)objc_claimAutoreleasedReturnValue();
    uint64_t v7 = self->_momentShareCache;
    self->_momentShareCache = v6;

    uint64_t v11 = objc_msgSend_defaultCenter(MEMORY[0x1E4F28EB8], v8, v9, v10);
    objc_msgSend_addObserver_selector_name_object_(v11, v12, (uint64_t)self, (uint64_t)sel__momentShareCacheDidChange_, @"IMMomentShareCacheDidChangeNotification", self->_momentShareCache);

    momentShareCache = self->_momentShareCache;
  }

  return momentShareCache;
}

- (IMMomentSharePresentationCache)momentSharePresentationCache
{
  momentSharePresentationCache = self->_momentSharePresentationCache;
  if (!momentSharePresentationCache)
  {
    uint64_t v6 = objc_msgSend_momentShareCache(self, a2, v2, v3);
    uint64_t v7 = [IMMomentSharePresentationCache alloc];
    uint64_t v10 = (IMMomentSharePresentationCache *)objc_msgSend_initWithMomentShareCache_(v7, v8, (uint64_t)v6, v9);
    uint64_t v11 = self->_momentSharePresentationCache;
    self->_momentSharePresentationCache = v10;

    objc_msgSend_setDelegate_(self->_momentSharePresentationCache, v12, (uint64_t)self, v13);
    momentSharePresentationCache = self->_momentSharePresentationCache;
  }

  return momentSharePresentationCache;
}

- (void)_momentShareCacheDidChange:(id)a3
{
}

- (void)momentSharePresentationCacheDidChange:(id)a3
{
}

- (BOOL)isPinned
{
  int v5 = objc_msgSend_processSupportsPinnedConversations(IMPinnedConversationsController, a2, v2, v3);
  if (v5)
  {
    uint64_t v9 = objc_msgSend_sharedInstance(IMPinnedConversationsController, v6, v7, v8);
    char v12 = objc_msgSend_pinnedConversationsContainsChat_(v9, v10, (uint64_t)self, v11);

    LOBYTE(v5) = v12;
  }
  return v5;
}

- (BOOL)shouldDisplayOffGridModeStatus
{
  if (objc_msgSend_chatStyle(self, a2, v2, v3) != 45) {
    return 0;
  }
  uint64_t v8 = objc_msgSend_account(self, v5, v6, v7);
  char v12 = objc_msgSend_service(v8, v9, v10, v11);
  uint64_t v16 = objc_msgSend_internalName(v12, v13, v14, v15);
  int isEqualToString = objc_msgSend_isEqualToString_(v16, v17, *MEMORY[0x1E4F6E1B0], v18);

  if (!isEqualToString) {
    return 0;
  }
  if (objc_msgSend_isReadOnly(self, v20, v21, v22)) {
    return 0;
  }
  uint64_t v28 = objc_msgSend_recipient(self, v23, v24, v25);
  BOOL v26 = objc_msgSend_offGridMode(v28, v29, v30, v31) == 2;

  return v26;
}

- (void)autoInviteToViewOffGridModeIfNeeded
{
  int v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v5, v6, v7, v8);

  if (isCarrierPigeonEnabled)
  {
    if (objc_msgSend__canShareStatus(self, v10, v11, v12))
    {
      if (objc_msgSend_containsMessageFromContactOrMe(self, v13, v14, v15))
      {
        uint64_t v19 = objc_msgSend_lastAddressedHandleID(self, v16, v17, v18);
        if (objc_msgSend_length(v19, v20, v21, v22))
        {
          BOOL v26 = objc_msgSend_recipient(self, v23, v24, v25);
          objc_msgSend_autoInviteToViewOffGridModeIfNeededFromHandleID_(v26, v27, (uint64_t)v19, v28);
        }
        else
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_17;
          }
          BOOL v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)uint64_t v31 = 0;
            _os_log_impl(&dword_1A4AF7000, v26, OS_LOG_TYPE_INFO, "Not sharing off grid mode in chat with no lastAddressedHandleID", v31, 2u);
          }
        }

LABEL_17:
        return;
      }
      if (!IMOSLoggingEnabled()) {
        return;
      }
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      *(_WORD *)buf = 0;
      uint64_t v29 = "Not sharing off grid mode in chat with non contact that I have not participated in";
      uint64_t v30 = buf;
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        return;
      }
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v19, OS_LOG_TYPE_INFO)) {
        goto LABEL_17;
      }
      __int16 v33 = 0;
      uint64_t v29 = "Not able to share off grid mode";
      uint64_t v30 = (uint8_t *)&v33;
    }
    _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, v29, v30, 2u);
    goto LABEL_17;
  }
}

- (BOOL)shouldDisplayUnavailabilityIndicator
{
  if (!objc_msgSend_supportsCapabilities_(self, a2, 0x200000, v2)) {
    return 0;
  }
  uint64_t v7 = objc_msgSend_recipient(self, v4, v5, v6);
  BOOL v11 = objc_msgSend_availability(v7, v8, v9, v10) == 2;

  return v11;
}

- (NSDate)availabilityStatusPublishedDate
{
  if (objc_msgSend_chatStyle(self, a2, v2, v3) == 45)
  {
    uint64_t v8 = objc_msgSend_recipient(self, v5, v6, v7);
    uint64_t v12 = objc_msgSend_availabilityStatusPublishedDate(v8, v9, v10, v11);
  }
  else
  {
    uint64_t v12 = 0;
  }

  return (NSDate *)v12;
}

- (void)isInvitedToViewMyFocusStatusWithCompletion:(id)a3
{
  id v4 = (void (**)(id, void, void *))a3;
  if (objc_msgSend_chatStyle(self, v5, v6, v7) != 45)
  {
    uint64_t v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB8CA0();
    }

    uint64_t v13 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v12, *MEMORY[0x1E4F6CAD8], 1, 0);
    v4[2](v4, 0, v13);
  }
  uint64_t v14 = objc_msgSend_lastAddressedHandleID(self, v8, v9, v10);
  if (!objc_msgSend_length(v14, v15, v16, v17))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v26 = 0;
        _os_log_impl(&dword_1A4AF7000, v22, OS_LOG_TYPE_INFO, "Not able to determine if sender if invited with no lastAddressedHandleID", v26, 2u);
      }
    }
    uint64_t v23 = objc_msgSend_errorWithDomain_code_userInfo_(MEMORY[0x1E4F28C58], v21, *MEMORY[0x1E4F6CAD8], 2, 0);
    v4[2](v4, 0, v23);
  }
  uint64_t v24 = objc_msgSend_recipient(self, v18, v19, v20);
  objc_msgSend_isInvitedToViewMyFocusStatusFromHandleID_completion_(v24, v25, (uint64_t)v14, (uint64_t)v4);
}

- (id)beginObservingHandleStatuses
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Beginning observing of handle status", buf, 2u);
    }
  }
  if (objc_msgSend_chatStyle(self, v3, v4, v5) == 45)
  {
    uint64_t v10 = objc_msgSend_recipient(self, v7, v8, v9);
    uint64_t v14 = objc_msgSend_beginObservingAvailability(v10, v11, v12, v13);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v17 = 0;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Chat is not 1:1, bailing", v17, 2u);
      }
    }
    uint64_t v14 = 0;
  }

  return v14;
}

- (void)_reloadChatItemsForHandleAvailabilityChange
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = objc_msgSend_guid(self, v5, v6, v7);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "Availability changed, updating chat items for chat: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  objc_msgSend__updateChatItemsWithReason_block_(self, v3, @"(IMChat) IMHandle availability changed", (uint64_t)&unk_1EF8E6548);
}

- (void)_reloadChatItemsForKeyTransparencyStatusChange
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = objc_msgSend_guid(self, v5, v6, v7);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "Key Transparency changed, updating chat items for chat: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  objc_msgSend__updateChatItemsWithReason_block_(self, v3, @"(IMChat) IMHandle key transparency changed", (uint64_t)&unk_1EF8E6568);
}

- (void)_reloadChatItemsForSatelliteStateChangeIfRequired:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  chatItemRules = self->_chatItemRules;
  int v9 = objc_msgSend_chatItems(self, v6, v7, v8);
  LODWORD(chatItemRules) = objc_msgSend__shouldReloadSatelliteChatItems_(chatItemRules, v10, (uint64_t)v9, v11);

  int v12 = IMOSLoggingEnabled();
  if (chatItemRules)
  {
    if (v12)
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v18 = objc_msgSend_guid(self, v15, v16, v17);
        int v24 = 138412546;
        id v25 = v4;
        __int16 v26 = 2112;
        uint64_t v27 = v18;
        _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "%@, updating chat items for chat: %@", (uint8_t *)&v24, 0x16u);
      }
    }
    objc_msgSend__updateChatItemsWithReason_block_(self, v13, (uint64_t)v4, (uint64_t)&unk_1EF8E6588);
  }
  else if (v12)
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v23 = objc_msgSend_guid(self, v20, v21, v22);
      int v24 = 138412546;
      id v25 = v4;
      __int16 v26 = 2112;
      uint64_t v27 = v23;
      _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, "Skipping chat items update (%@) for chat: %@. Items don't need update", (uint8_t *)&v24, 0x16u);
    }
  }
}

- (void)_reloadChatItemsForJunkStateChange
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = objc_msgSend_guid(self, v5, v6, v7);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "Junk status changed, updating chat items for chat: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  objc_msgSend__updateChatItemsWithReason_block_(self, v3, @"(IMChat) Junk status changed", (uint64_t)&unk_1EF8E65A8);
}

- (void)reloadChatItemsForSuggestedRepliesChange
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = objc_msgSend_guid(self, v5, v6, v7);
      int v9 = 138412290;
      uint64_t v10 = v8;
      _os_log_impl(&dword_1A4AF7000, v4, OS_LOG_TYPE_INFO, "Suggested replies changed, updating chat items for chat: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  objc_msgSend__updateChatItemsWithReason_block_(self, v3, @"(IMChat) Suggested replies changed", (uint64_t)&unk_1EF8E42B0);
}

- (void)autoInviteToViewAvailabilityIfNeeded
{
  id location = 0;
  objc_initWeak(&location, self);
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A4BE55A0;
  v5[3] = &unk_1E5B7D668;
  objc_copyWeak(&v6, &location);
  objc_msgSend_canShareFocusStatusWithCompletion_(self, v3, (uint64_t)v5, v4);
  objc_destroyWeak(&v6);
  objc_destroyWeak(&location);
}

- (void)canShareFocusStatusWithCompletion:(id)a3
{
  id v4 = a3;
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1A4BE5968;
  aBlock[3] = &unk_1E5B7D6B8;
  id v5 = v4;
  id v25 = v5;
  id v6 = (void (**)(void *, void))_Block_copy(aBlock);
  if ((objc_msgSend__canShareStatus(self, v7, v8, v9) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v20 = "Not able to share focus status";
LABEL_10:
        _os_log_impl(&dword_1A4AF7000, v19, OS_LOG_TYPE_INFO, v20, buf, 2u);
      }
LABEL_11:
    }
LABEL_12:
    v6[2](v6, 0);
    goto LABEL_13;
  }
  if ((objc_msgSend_isMessagesAuthorizedToAccessFocusStatus(self, v10, v11, v12) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v20 = "Not able to share focus status because Messages is not authorized to access that status";
        goto LABEL_10;
      }
      goto LABEL_11;
    }
    goto LABEL_12;
  }
  uint64_t v16 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E600], v13, v14, v15);
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1A4BE5A14;
  v21[3] = &unk_1E5B7D6B8;
  uint64_t v22 = v6;
  objc_msgSend_fetchIsFocusConfigurationShareAcrossDevicesEnabledWithCompletion_(v16, v17, (uint64_t)v21, v18);

LABEL_13:
}

- (BOOL)isMessagesAuthorizedToAccessFocusStatus
{
  uint64_t v2 = (void *)MEMORY[0x1A6263B40](@"INFocusStatusCenter", @"Intents");
  id v6 = objc_msgSend_defaultCenter(v2, v3, v4, v5);
  switch(objc_msgSend_authorizationStatus(v6, v7, v8, v9))
  {
    case 0:
      if (!IMOSLoggingEnabled()) {
        goto LABEL_13;
      }
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (!os_log_type_enabled(v10, OS_LOG_TYPE_INFO)) {
        goto LABEL_12;
      }
      __int16 v15 = 0;
      uint64_t v11 = "Focus Status authorization status is not determined. This is unexpected, as we should have prompted on app l"
            "aunch. Treating as not authorized.";
      uint64_t v12 = (uint8_t *)&v15;
      goto LABEL_8;
    case 1:
      uint64_t v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_1A4CB8CD4();
      }
      goto LABEL_12;
    case 2:
      if (!IMOSLoggingEnabled()) {
        goto LABEL_13;
      }
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v11 = "Focus Status authorization status is denied.";
        uint64_t v12 = buf;
LABEL_8:
        _os_log_impl(&dword_1A4AF7000, v10, OS_LOG_TYPE_INFO, v11, v12, 2u);
      }
LABEL_12:

LABEL_13:
      BOOL v13 = 0;
LABEL_14:

      return v13;
    case 3:
      BOOL v13 = 1;
      goto LABEL_14;
    default:
      goto LABEL_13;
  }
}

- (BOOL)_canShareStatus
{
  if (objc_msgSend_isSMS(self, a2, v2, v3))
  {
    int v8 = IMOSLoggingEnabled();
    if (v8)
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v39 = 0;
        uint64_t v10 = "Not able to share status in SMS chat";
        uint64_t v11 = (uint8_t *)&v39;
LABEL_29:
        _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, v10, v11, 2u);
        goto LABEL_30;
      }
      goto LABEL_30;
    }
  }
  else if (objc_msgSend_isRCS(self, v5, v6, v7))
  {
    int v8 = IMOSLoggingEnabled();
    if (v8)
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v38 = 0;
        uint64_t v10 = "Not able to share status in RCS chat";
        uint64_t v11 = (uint8_t *)&v38;
        goto LABEL_29;
      }
LABEL_30:

      LOBYTE(v8) = 0;
    }
  }
  else if (objc_msgSend_isInAppleStoreDemoMode(MEMORY[0x1E4F6E5D0], v12, v13, v14))
  {
    int v8 = IMOSLoggingEnabled();
    if (v8)
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v37 = 0;
        uint64_t v10 = "Not able to share status in Apple Store Demo mode.";
        uint64_t v11 = (uint8_t *)&v37;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  else if (objc_msgSend_isBusinessChat(self, v15, v16, v17))
  {
    int v8 = IMOSLoggingEnabled();
    if (v8)
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v36 = 0;
        uint64_t v10 = "Not able to share status in business chat";
        uint64_t v11 = (uint8_t *)&v36;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  else if (objc_msgSend_isStewieChat(self, v18, v19, v20))
  {
    int v8 = IMOSLoggingEnabled();
    if (v8)
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v35 = 0;
        uint64_t v10 = "Not able to share status in stewie chat";
        uint64_t v11 = (uint8_t *)&v35;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  else if (objc_msgSend_chatStyle(self, v21, v22, v23) == 45)
  {
    uint64_t v27 = objc_msgSend_recipient(self, v24, v25, v26);
    int v31 = objc_msgSend_matchesLoginHandleForAnyAccount(v27, v28, v29, v30);

    if (v31)
    {
      int v8 = IMOSLoggingEnabled();
      if (v8)
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          __int16 v33 = 0;
          uint64_t v10 = "Not able to share status with myself";
          uint64_t v11 = (uint8_t *)&v33;
          goto LABEL_29;
        }
        goto LABEL_30;
      }
    }
    else
    {
      LOBYTE(v8) = 1;
    }
  }
  else
  {
    int v8 = IMOSLoggingEnabled();
    if (v8)
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        uint64_t v10 = "Not able to share status in non 1-1 chat";
        uint64_t v11 = buf;
        goto LABEL_29;
      }
      goto LABEL_30;
    }
  }
  return v8;
}

- (void)_handleAddressBookChangeForRecipientUID:(id)a3
{
  id v4 = a3;
  if (objc_msgSend_isBusinessChat(self, v5, v6, v7)
    && (objc_msgSend_recipient(self, v8, v9, v10),
        uint64_t v11 = objc_claimAutoreleasedReturnValue(),
        objc_msgSend_ID(v11, v12, v13, v14),
        __int16 v15 = objc_claimAutoreleasedReturnValue(),
        int isEqualToString = objc_msgSend_isEqualToString_(v4, v16, (uint64_t)v15, v17),
        v15,
        v11,
        isEqualToString))
  {
    uint64_t v19 = objc_msgSend_recipient(self, v8, v9, v10);
    uint64_t v23 = objc_msgSend_name(v19, v20, v21, v22);
    objc_msgSend__setDisplayName_(self, v24, (uint64_t)v23, v25);
  }
  else if (!v4)
  {
    objc_msgSend_invalidateSpamIndicatorCachedValues(self, v8, v9, v10);
    if (objc_msgSend_isFiltered(self, v26, v27, v28)
      && objc_msgSend_hasKnownParticipants(self, v29, v30, v31))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)__int16 v35 = 0;
          _os_log_impl(&dword_1A4AF7000, v34, OS_LOG_TYPE_INFO, "A contact has been added to the chat: Updating isFiltered to NO", v35, 2u);
        }
      }
      objc_msgSend_updateIsFiltered_(self, v32, 0, v33);
    }
    objc_msgSend__updateChatItemsWithReason_block_(self, v29, @"(IMChat) AddressBook changed", (uint64_t)&unk_1EF8E65C8);
  }
}

- (BOOL)_sanityCheckAccounts
{
  uint64_t v78 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_account(self, a2, v2, v3);
  uint64_t v6 = self;
  uint64_t v10 = objc_msgSend_sharedInstance(IMAccountController, v7, v8, v9);
  uint64_t v14 = objc_msgSend_accounts(v10, v11, v12, v13);
  char v17 = objc_msgSend_containsObjectIdenticalTo_(v14, v15, (uint64_t)v5, v16);

  if ((v17 & 1) == 0)
  {
    BOOL v21 = objc_msgSend_chatStyle(v6, v18, v19, v20) == 45;
    uint64_t v25 = objc_msgSend_service(v5, v22, v23, v24);
    uint64_t v29 = objc_msgSend_sharedInstance(IMAccountController, v26, v27, v28);
    uint64_t v32 = objc_msgSend_bestAccountForService_(v29, v30, (uint64_t)v25, v31);

    if (v21)
    {
      if (v32)
      {
        if (IMOSLoggingEnabled())
        {
          __int16 v37 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            __int16 v73 = v32;
            _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "This is a 1-1 chat, the account attached to it is gone, we're re-targeting to this account: %@", buf, 0xCu);
          }
        }
        objc_msgSend__setAccount_locally_(v6, v36, (uint64_t)v32, 1);
      }
      else
      {
        uint64_t v41 = objc_msgSend_recipient(v6, v33, v34, v35);
        uint64_t v71 = objc_msgSend__chatSiblings(v41, v42, v43, v44);
        if (objc_msgSend_count(v71, v45, v46, v47))
        {
          objc_msgSend__bestChatSibling(v41, v48, v49, v50);
          int v70 = (IMChat *)objc_claimAutoreleasedReturnValue();
          uint64_t v54 = objc_msgSend_sharedInstance(IMAccountController, v51, v52, v53);
          uint64_t v58 = objc_msgSend_accounts(v54, v55, v56, v57);
          uint64_t v62 = objc_msgSend_account(v70, v59, v60, v61);
          int v65 = objc_msgSend_containsObjectIdenticalTo_(v58, v63, (uint64_t)v62, v64);

          if (v65)
          {
            if (IMOSLoggingEnabled())
            {
              id v68 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412802;
                __int16 v73 = v41;
                __int16 v74 = 2112;
                uint64_t v75 = v70;
                __int16 v76 = 2112;
                id v77 = v6;
                _os_log_impl(&dword_1A4AF7000, v68, OS_LOG_TYPE_INFO, "This is a 1-1 chat, the account attached to it is gone, we're re-targeting from: %@ to: %@ (Chat: %@)", buf, 0x20u);
              }
            }
            objc_msgSend_setRecipient_(v6, v66, (uint64_t)v70, v67);
          }
        }
      }
    }
    else if (v32 && v5 != v32)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v40 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          __int16 v73 = v32;
          __int16 v74 = 2112;
          uint64_t v75 = v6;
          _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "This is a group chat, found a new account to attach to: %@  (Chat: %@)", buf, 0x16u);
        }
      }
      objc_msgSend__setAccount_(v6, v38, (uint64_t)v32, v39);
    }
  }
  return v17 ^ 1;
}

- (void)_accountControllerUpdated:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v14 = 138412290;
      __int16 v15 = self;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_DEBUG, "chat: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_object(v4, v10, v11, v12);
      uint64_t v13 = (IMChat *)objc_claimAutoreleasedReturnValue();
      int v14 = 138412290;
      __int16 v15 = v13;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "_accountControllerUpdated: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  objc_msgSend__sanityCheckAccounts(self, v6, v7, v8);
}

- (void)_daemonAlive:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v9 = 138412290;
      uint64_t v10 = self;
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_DEBUG, "chat: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  objc_msgSend__sanityCheckAccounts(self, v5, v6, v7);
}

- (void)_daemonDied:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      int v6 = 138412290;
      uint64_t v7 = self;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_DEBUG, "chat: %@", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (NSString)description
{
  uint64_t v106 = NSString;
  uint64_t v5 = objc_msgSend_chatIdentifier(self, a2, v2, v3);
  int v9 = objc_msgSend_guid(self, v6, v7, v8);
  uint64_t v13 = objc_msgSend_persistentID(self, v10, v11, v12);
  uint64_t v109 = objc_msgSend_account(self, v14, v15, v16);
  uint64_t v20 = objc_msgSend_uniqueID(v109, v17, v18, v19);
  uint64_t v104 = objc_msgSend_chatStyle(self, v21, v22, v23);
  uint64_t v103 = objc_msgSend_joinState(self, v24, v25, v26);
  uint64_t v107 = objc_msgSend_participants(self, v27, v28, v29);
  uint64_t v108 = (void *)v20;
  uint64_t v111 = (void *)v5;
  uint64_t v110 = (void *)v13;
  if (v107)
  {
    uint64_t v33 = NSNumber;
    uint64_t v95 = objc_msgSend_participants(self, v30, v31, v32);
    uint64_t v37 = objc_msgSend_count(v95, v34, v35, v36);
    objc_msgSend_numberWithUnsignedInteger_(v33, v38, v37, v39);
    uint64_t v105 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    uint64_t v105 = @"nil";
  }
  uint64_t v102 = objc_msgSend_roomName(self, v30, v31, v32);
  uint64_t v101 = objc_msgSend_displayName(self, v40, v41, v42);
  if (objc_msgSend_isUnregistered(self, v43, v44, v45)) {
    uint64_t v49 = @"YES";
  }
  else {
    uint64_t v49 = @"NO";
  }
  uint64_t v100 = v49;
  uint64_t v99 = objc_msgSend_lastAddressedHandleID(self, v46, v47, v48);
  uint64_t v98 = objc_msgSend_lastAddressedSIMID(self, v50, v51, v52);
  uint64_t v97 = objc_msgSend_groupID(self, v53, v54, v55);
  uint64_t v96 = objc_msgSend_unreadMessageCount(self, v56, v57, v58);
  uint64_t v62 = objc_msgSend_messageFailureCount(self, v59, v60, v61);
  uint64_t isFiltered = objc_msgSend_isFiltered(self, v63, v64, v65);
  if (objc_msgSend_hasHadSuccessfulQuery(self, v67, v68, v69)) {
    __int16 v73 = @"YES";
  }
  else {
    __int16 v73 = @"NO";
  }
  __int16 v74 = objc_msgSend_bizIntent(self, v70, v71, v72);
  uint64_t v78 = objc_msgSend_personCentricID(self, v75, v76, v77);
  uint64_t v82 = objc_msgSend_mergedPinningIdentifiers(self, v79, v80, v81);
  if (objc_msgSend_isRecovered(self, v83, v84, v85)) {
    uint64_t v89 = @"YES";
  }
  else {
    uint64_t v89 = @"NO";
  }
  if (objc_msgSend_isDeletingIncomingMessages(self, v86, v87, v88)) {
    uint64_t v92 = @"YES";
  }
  else {
    uint64_t v92 = @"NO";
  }
  objc_msgSend_stringWithFormat_(v106, v90, @"<IMChat %p> [Identifier: %@   GUID: %@ Persistent ID: %@   Account: %@   Style: %c   State: %d  Participants: %@  Room Name: %@  Display Name: %@  Unregistered: %@  Last Addressed Handle: %@ Last Addressed SIMID: %@ Group ID: %@  Unread Count: %u  Failure Count: %u, isFiltered: %d, hasHadSuccessfulQuery: %@, bizIntent: %@ personCentricID: %@ mergedPinningIdentifiers: %@, isRecovered: %@  isDeletingIncomingMessages: %@]", v91, self, v111, v9, v110, v108, v104, v103, v105, v102, v101, v100, v99, v98, v97, v96,
    v62,
    isFiltered,
    v73,
    v74,
    v78,
    v82,
    v89,
  uint64_t v93 = v92);

  if (v107)
  {
  }

  return (NSString *)v93;
}

- (BOOL)hasStoredMessageWithGUID:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  uint64_t v8 = objc_msgSend_chatItems(self, v5, v6, v7, 0);
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v35, (uint64_t)v39, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v36;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v36 != v14) {
          objc_enumerationMutation(v8);
        }
        uint64_t v16 = objc_msgSend__item(*(void **)(*((void *)&v35 + 1) + 8 * i), v10, v11, v12);
        if (objc_msgSend_type(v16, v17, v18, v19))
        {
          uint64_t v23 = 0;
          objc_msgSend_guid(0, v20, v21, v22);
        }
        else
        {
          uint64_t v23 = objc_msgSend_message(v16, v20, v21, v22);
          objc_msgSend_guid(v23, v24, v25, v26);
        uint64_t v27 = };
        if (objc_msgSend_isEqualToIgnoringCase_(v27, v28, (uint64_t)v4, v29))
        {
          uint64_t v33 = objc_msgSend_messageID(v23, v30, v31, v32);

          if (v33 > 0)
          {

            LOBYTE(v13) = 1;
            goto LABEL_15;
          }
        }
        else
        {
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v10, (uint64_t)&v35, (uint64_t)v39, 16);
    }
    while (v13);
  }
LABEL_15:

  return v13;
}

- (void)setSendProgressDelegate:(id)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  sendProgress = self->_sendProgress;
  if (v7)
  {
    objc_msgSend_context(sendProgress, v4, v5, v6);
    id v9 = (id)objc_claimAutoreleasedReturnValue();

    if (v9 != v7)
    {
      objc_msgSend_setDelegate_(self->_sendProgress, v10, 0, v11);
      objc_msgSend_setContext_(self->_sendProgress, v12, 0, v13);
      objc_msgSend_invalidate(self->_sendProgress, v14, v15, v16);
      char v17 = [IMSendProgress alloc];
      uint64_t v19 = (IMSendProgress *)objc_msgSend_initWithDelegate_context_(v17, v18, (uint64_t)self, (uint64_t)v7);
      uint64_t v20 = self->_sendProgress;
      self->_sendProgress = v19;

      uint64_t v21 = self->_sendProgress;
      uint64_t v25 = objc_msgSend__items(self, v22, v23, v24);
      objc_msgSend_updateForItems_forced_(v21, v26, (uint64_t)v25, 1);
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v31 = objc_msgSend_guid(self, v28, v29, v30);
        uint64_t v32 = self->_sendProgress;
        int v39 = 138412546;
        uint64_t v40 = v31;
        __int16 v41 = 2112;
        uint64_t v42 = v32;
        _os_log_impl(&dword_1A4AF7000, v27, OS_LOG_TYPE_INFO, "Set send progress delegate for chat %@. Send progress: %@", (uint8_t *)&v39, 0x16u);
      }
    }
  }
  else
  {
    objc_msgSend_setDelegate_(sendProgress, v4, 0, v6);
    objc_msgSend_setContext_(self->_sendProgress, v33, 0, v34);
    objc_msgSend_invalidate(self->_sendProgress, v35, v36, v37);
    long long v38 = self->_sendProgress;
    self->_sendProgress = 0;
  }
}

- (id)sendProgressDelegate
{
  return (id)objc_msgSend_context(self->_sendProgress, a2, v2, v3);
}

- (void)sendProgress:(id)a3 progressDidChange:(float)a4 sendingMessages:(id)a5 sendCount:(unint64_t)a6 totalCount:(unint64_t)a7 finished:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a5;
  objc_msgSend_context(a3, v15, v16, v17);
  id v20 = (id)objc_claimAutoreleasedReturnValue();
  *(float *)&double v18 = a4;
  objc_msgSend_chat_progressDidChange_sendingMessages_sendCount_totalCount_finished_(v20, v19, (uint64_t)self, (uint64_t)v14, a6, a7, v8, v18);
}

- (void)downloadPurgedAttachments
{
  objc_msgSend_chatRegistry(self, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__chat_downloadPurgedAttachmentsForChat_(v7, v5, (uint64_t)self, v6);
}

- (void)loadInlineRepliesForThreadIdentifier:(id)a3 threadOriginator:(id)a4 messageGuid:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [IMInlineReplyController alloc];
  uint64_t v13 = (IMInlineReplyController *)objc_msgSend_initWithChat_threadIdentifier_threadOriginator_(v11, v12, (uint64_t)self, (uint64_t)v8, v9);
  inlineReplyController = self->_inlineReplyController;
  self->_inlineReplyController = v13;

  objc_msgSend_setCapacity_(self->_inlineReplyController, v15, 50, v16);
  if (IMOSLoggingEnabled())
  {
    double v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      uint64_t v22 = objc_msgSend_guid(self, v19, v20, v21);
      int v24 = 136316162;
      uint64_t v25 = "-[IMChat loadInlineRepliesForThreadIdentifier:threadOriginator:messageGuid:]";
      __int16 v26 = 2112;
      uint64_t v27 = v22;
      __int16 v28 = 2112;
      id v29 = v8;
      __int16 v30 = 2112;
      id v31 = v10;
      __int16 v32 = 2112;
      id v33 = v9;
      _os_log_impl(&dword_1A4AF7000, v18, OS_LOG_TYPE_INFO, "%s chatGUID: %@, threadIdentifier: %@, messageGUID: %@, threadOriginator: %@", (uint8_t *)&v24, 0x34u);
    }
  }
  id v23 = (id)objc_msgSend_loadMessagesBeforeAndAfterGUID_numberOfMessagesToLoadBeforeGUID_numberOfMessagesToLoadAfterGUID_loadImmediately_threadIdentifier_(self, v17, (uint64_t)v10, 25, 25, 1, v8);
}

- (void)dismissInlineReplies
{
  self->_inlineReplyController = 0;
  MEMORY[0x1F41817F8]();
}

- (BOOL)canSend
{
  if (objc_msgSend_isStewieEmergencyChat(self, a2, v2, v3)
    && (objc_msgSend_sharedInstance(IMChorosMonitor, v5, v6, v7),
        id v8 = objc_claimAutoreleasedReturnValue(),
        char isStewieEmergencyActive = objc_msgSend_isStewieEmergencyActive(v8, v9, v10, v11),
        v8,
        (isStewieEmergencyActive & 1) == 0))
  {
    int v16 = IMOSLoggingEnabled();
    if (v16)
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v46 = 0;
        double v18 = "canSend = NO: chat is emergency but emergency is not active";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
  }
  else if (objc_msgSend_isStewieSharingChat(self, v5, v6, v7))
  {
    int v16 = IMOSLoggingEnabled();
    if (v16)
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v46 = 0;
        double v18 = "canSend = NO: chat is stewie sharing";
LABEL_31:
        _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, v18, v46, 2u);
        goto LABEL_32;
      }
      goto LABEL_32;
    }
  }
  else if (objc_msgSend_isStewieRoadsideChat(self, v13, v14, v15) {
         && (objc_msgSend_sharedInstance(IMChorosMonitor, v19, v20, v21),
  }
             uint64_t v22 = objc_claimAutoreleasedReturnValue(),
             char isStewieRoadsideActive = objc_msgSend_isStewieRoadsideActive(v22, v23, v24, v25),
             v22,
             (isStewieRoadsideActive & 1) == 0))
  {
    int v16 = IMOSLoggingEnabled();
    if (v16)
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v46 = 0;
        double v18 = "canSend = NO: chat is roadside and roadside is not active";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
  }
  else if (objc_msgSend_allowedByScreenTime(self, v19, v20, v21))
  {
    if (objc_msgSend_isOscarChat(self, v27, v28, v29))
    {
      int v16 = IMOSLoggingEnabled();
      if (v16)
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v46 = 0;
          double v18 = "canSend = NO: chat is oscar";
          goto LABEL_31;
        }
LABEL_32:

        LOBYTE(v16) = 0;
      }
    }
    else if (objc_msgSend_hasLeftGroup(self, v30, v31, v32))
    {
      int v16 = IMOSLoggingEnabled();
      if (v16)
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v46 = 0;
          double v18 = "canSend = NO: chat has left group";
          goto LABEL_31;
        }
        goto LABEL_32;
      }
    }
    else if (objc_msgSend_isReadOnly(self, v33, v34, v35))
    {
      int v16 = IMOSLoggingEnabled();
      if (v16)
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v46 = 0;
          double v18 = "canSend = NO: chat is read only";
          goto LABEL_31;
        }
        goto LABEL_32;
      }
    }
    else
    {
      if (objc_msgSend_isBusinessChat(self, v36, v37, v38)
        && objc_msgSend_isMakoChat(self, v39, v40, v41)
        && (objc_msgSend__isSendToMakoAllowed(self, v39, v40, v41) & 1) == 0)
      {
        int v16 = IMOSLoggingEnabled();
        if (!v16) {
          return v16;
        }
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
          goto LABEL_32;
        }
        *(_WORD *)uint64_t v46 = 0;
        double v18 = "canSend = NO: chat is business && mako and sending to mako is not allowed";
        goto LABEL_31;
      }
      if (objc_msgSend_isBusinessChat(self, v39, v40, v41)
        && (objc_msgSend_supportsBusinessChat(MEMORY[0x1E4F6E730], v42, v43, v44) & 1) == 0)
      {
        int v16 = IMOSLoggingEnabled();
        if (!v16) {
          return v16;
        }
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (!os_log_type_enabled(v17, OS_LOG_TYPE_INFO)) {
          goto LABEL_32;
        }
        *(_WORD *)uint64_t v46 = 0;
        double v18 = "canSend = NO: chat is business but device does not support business chats";
        goto LABEL_31;
      }
      LOBYTE(v16) = 1;
    }
  }
  else
  {
    int v16 = IMOSLoggingEnabled();
    if (v16)
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v46 = 0;
        double v18 = "canSend = NO: chat is blocked by screen time";
        goto LABEL_31;
      }
      goto LABEL_32;
    }
  }
  return v16;
}

- (BOOL)_isSendToMakoAllowed
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, 0, v2);
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"m-reply-enabled", v5);
  uint64_t v10 = v6;
  if (v6)
  {
    int v11 = objc_msgSend_BOOLValue(v6, v7, v8, v9);
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        v15[0] = 67109120;
        v15[1] = v11;
        _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "_isSendToMakoAllowed: Server bag value found: return: %{BOOL}d", (uint8_t *)v15, 8u);
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
        LOWORD(v15[0]) = 0;
        _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "_isSendToMakoAllowed: No server bag value found: defaulting to NO", (uint8_t *)v15, 2u);
      }
    }
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (BOOL)canSendInlineReply
{
  int canSend = objc_msgSend_canSend(self, a2, v2, v3);
  if (canSend)
  {
    LOBYTE(canSend) = objc_msgSend_supportsCapabilities_(self, v6, 4, v7);
  }
  return canSend;
}

- (int64_t)_uncachedInterworkingState
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend__lastInterworkedMessage(self, a2, v2, v3);
  uint64_t v9 = v5;
  if (v5)
  {
    uint64_t v10 = objc_msgSend_originalServiceName(v5, v6, v7, v8);
    if (v10)
    {
      uint64_t v14 = (void *)v10;
      uint64_t v15 = objc_msgSend_account(self, v11, v12, v13);
      uint64_t v19 = objc_msgSend_service(v15, v16, v17, v18);

      if (v19)
      {
        id v23 = (void *)MEMORY[0x1E4F1CAD0];
        uint64_t v24 = objc_msgSend_service(v9, v20, v21, v22);
        uint64_t v28 = objc_msgSend_originalServiceName(v9, v25, v26, v27);
        uint64_t v31 = objc_msgSend_setWithObjects_(v23, v29, (uint64_t)v24, v30, v28, 0);

        uint64_t v35 = objc_msgSend__lastSentMessage(self, v32, v33, v34);
        int v39 = v35;
        if (v9 == v35)
        {
          objc_msgSend_wasInterworked(v9, v36, v37, v38);
          int v69 = 1;
        }
        else
        {
          uint64_t v40 = objc_msgSend_service(v35, v36, v37, v38);
          int v43 = objc_msgSend_containsObject_(v31, v41, (uint64_t)v40, v42);

          if (!v43) {
            goto LABEL_28;
          }
          uint64_t v107 = v39;
          long long v110 = 0u;
          long long v111 = 0u;
          long long v108 = 0u;
          long long v109 = 0u;
          uint64_t v47 = objc_msgSend__sentMessagesSinceInterworking(self, v44, v45, v46);
          uint64_t v49 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v48, (uint64_t)&v108, (uint64_t)v112, 16);
          if (v49)
          {
            uint64_t v53 = v49;
            uint64_t v54 = *(void *)v109;
            char v55 = 1;
            while (1)
            {
              for (uint64_t i = 0; i != v53; ++i)
              {
                if (*(void *)v109 != v54) {
                  objc_enumerationMutation(v47);
                }
                uint64_t v57 = *(void **)(*((void *)&v108 + 1) + 8 * i);
                uint64_t v58 = objc_msgSend_service(v57, v50, v51, v52);
                if (!objc_msgSend_containsObject_(v31, v59, (uint64_t)v58, v60))
                {

LABEL_15:
                  char v55 = 0;
                  continue;
                }
                char isDelivered = objc_msgSend_isDelivered(v57, v61, v62, v63);

                if (isDelivered) {
                  goto LABEL_15;
                }
              }
              uint64_t v53 = objc_msgSend_countByEnumeratingWithState_objects_count_(v47, v50, (uint64_t)&v108, (uint64_t)v112, 16);
              if (!v53) {
                goto LABEL_26;
              }
            }
          }
          char v55 = 1;
LABEL_26:

          int v69 = v55 & 1;
          int v39 = v107;
          if ((objc_msgSend_wasInterworked(v107, v92, v93, v94) & 1) == 0 && !v69) {
            goto LABEL_28;
          }
        }
        int v70 = objc_msgSend_account(self, v66, v67, v68);
        __int16 v74 = objc_msgSend_service(v70, v71, v72, v73);
        uint64_t v78 = objc_msgSend_name(v74, v75, v76, v77);
        int v81 = objc_msgSend_containsObject_(v31, v79, (uint64_t)v78, v80);

        if (v81)
        {
          uint64_t v88 = objc_msgSend_lastIncomingFinishedMessageItem(self, v82, v83, v84);
          if (!v88
            || ((objc_msgSend_isOlderThanItem_(v9, v85, (uint64_t)v88, v87) ^ 1 | v69) & 1) != 0
            || objc_msgSend_wasInterworked(v39, v85, v86, v87)
            && (objc_msgSend_service(v88, v95, v96, v97),
                uint64_t v98 = objc_claimAutoreleasedReturnValue(),
                objc_msgSend_service(v39, v99, v100, v101),
                uint64_t v102 = objc_claimAutoreleasedReturnValue(),
                int isEqualToString = objc_msgSend_isEqualToString_(v98, v103, (uint64_t)v102, v104),
                v102,
                v98,
                isEqualToString))
          {
            uint64_t v89 = objc_msgSend_service(v9, v85, v86, v87);
            objc_msgSend_setInterworkingService_(self, v90, (uint64_t)v89, v91);

            int64_t v65 = 1;
          }
          else
          {
            int64_t v65 = 2;
          }

          goto LABEL_33;
        }
LABEL_28:
        int64_t v65 = 2;
LABEL_33:

        goto LABEL_34;
      }
    }
  }
  int64_t v65 = 2;
LABEL_34:

  return v65;
}

- (void)_recalculateIsInterworking
{
  uint64_t v5 = objc_msgSend_interworkingState(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend__uncachedInterworkingState(self, v6, v7, v8);
  objc_msgSend_setInterworkingState_(self, v10, v9, v11);
  if (objc_msgSend_interworkingState(self, v12, v13, v14) != v5)
  {
    objc_msgSend__postNotification_userInfo_(self, v15, @"__kIMChatInterworkingStateChangedNotification", 0);
  }
}

- (BOOL)isInterworking
{
  if (!objc_msgSend_interworkingState(self, a2, v2, v3)) {
    objc_msgSend__recalculateIsInterworking(self, v5, v6, v7);
  }
  return objc_msgSend_interworkingState(self, v5, v6, v7) == 1;
}

- (NSString)interworkingService
{
  if (objc_msgSend_isInterworking(self, a2, v2, v3)) {
    uint64_t v5 = self->_interworkingService;
  }
  else {
    uint64_t v5 = 0;
  }

  return v5;
}

- (BOOL)hasLeftGroup
{
  int isGroupChat = objc_msgSend_isGroupChat(self, a2, v2, v3);
  if (isGroupChat)
  {
    uint64_t v8 = objc_msgSend__serviceSupportsCapability_(self, v6, *MEMORY[0x1E4F6E040], v7);
    int isGroupChat = objc_msgSend__canLeaveChatIgnoringParticipantCount_(self, v9, v8, v10);
    if (isGroupChat) {
      LOBYTE(isGroupChat) = objc_msgSend_joinState(self, v11, v12, v13) != 3
    }
                         && objc_msgSend_joinState(self, v14, v15, v16) != 2;
  }
  return isGroupChat;
}

- (void)_updateRepliesIfNecessaryWithItem:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass()) {
    uint64_t v5 = v4;
  }
  else {
    uint64_t v5 = 0;
  }
  id v6 = v5;
  uint64_t v10 = v6;
  if (v6)
  {
    uint64_t v11 = objc_msgSend_threadOriginator(v6, v7, v8, v9);
    uint64_t v12 = (void *)v11;
    if (v11) {
      uint64_t v13 = (void *)v11;
    }
    else {
      uint64_t v13 = v10;
    }
    id v14 = v13;

    uint64_t v18 = objc_msgSend_replyCountsByPart(v14, v15, v16, v17);

    if (v18)
    {
      uint64_t v22 = objc_msgSend__items(self, v19, v20, v21);
      id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v27[0] = MEMORY[0x1E4F143A8];
      v27[1] = 3221225472;
      v27[2] = sub_1A4BE7C20;
      v27[3] = &unk_1E5B7D730;
      id v28 = v22;
      id v29 = v4;
      id v30 = v14;
      id v31 = v23;
      uint64_t v32 = self;
      id v24 = v23;
      id v25 = v22;
      objc_msgSend__updateChatItemsWithReason_block_(self, v26, @"Update items with thread originator (reply counts)", (uint64_t)v27);
    }
  }
}

- (void)_updateRepliesIfNecessaryWithRemovedItems:(id)a3 threadIdentifiersOfRemovedParts:(id)a4
{
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v83 = a4;
  long long v95 = 0u;
  long long v96 = 0u;
  long long v97 = 0u;
  long long v98 = 0u;
  id obj = v5;
  uint64_t v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v95, (uint64_t)v103, 16);
  if (v88)
  {
    id v7 = 0;
    id v85 = 0;
    CFMutableDictionaryRef Mutable = 0;
    uint64_t v87 = *(void *)v96;
    do
    {
      for (uint64_t i = 0; i != v88; ++i)
      {
        if (*(void *)v96 != v87) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v95 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v11 = v9;
          uint64_t v15 = objc_msgSend_replyCountsByPart(v11, v12, v13, v14);

          if (v15)
          {
            if (!v7) {
              id v7 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            }
            uint64_t v19 = objc_msgSend_guid(v11, v16, v17, v18);
            objc_msgSend_addObject_(v7, v20, (uint64_t)v19, v21);

            id v25 = objc_msgSend_guid(v11, v22, v23, v24);
            objc_msgSend_removeObjectForKey_(Mutable, v26, (uint64_t)v25, v27);
          }
          id v28 = objc_msgSend_threadOriginator(v11, v16, v17, v18);

          if (v28)
          {
            if (!Mutable) {
              CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
            }
            if (!v85) {
              id v85 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
            }
            uint64_t v32 = objc_msgSend_guid(v11, v29, v30, v31);
            objc_msgSend_addObject_(v85, v33, (uint64_t)v32, v34);

            uint64_t v38 = objc_msgSend_threadOriginator(v11, v35, v36, v37);
            uint64_t v42 = objc_msgSend_guid(v38, v39, v40, v41);
            uint64_t v46 = objc_msgSend_threadIdentifier(v11, v43, v44, v45);
            if ((objc_msgSend_containsObject_(v7, v47, (uint64_t)v42, v48) & 1) == 0
              && (objc_msgSend_containsObject_(v83, v49, (uint64_t)v46, v50) & 1) == 0)
            {
              uint64_t v94 = 0;
              IMMessageThreadIdentifierGetComponents();
              id v51 = 0;
              if (v51)
              {
                uint64_t v54 = v51;
                uint64_t v58 = objc_msgSend_objectForKey_(Mutable, v52, (uint64_t)v42, v53);
                if (!v58)
                {
                  uint64_t v59 = objc_msgSend_replyCountsByPart(v38, v55, v56, v57);
                  uint64_t v58 = objc_msgSend_mutableCopy(v59, v60, v61, v62);

                  if (v58) {
                    objc_msgSend_setObject_forKey_(Mutable, v55, (uint64_t)v58, (uint64_t)v42);
                  }
                }
                uint64_t v63 = objc_msgSend_objectForKey_(v58, v55, (uint64_t)v54, v57);
                uint64_t v67 = objc_msgSend_unsignedIntegerValue(v63, v64, v65, v66);

                if (v67)
                {
                  int v70 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v68, v67 - 1, v69);
                  objc_msgSend_setObject_forKey_(v58, v71, (uint64_t)v70, (uint64_t)v54);
                }
              }
              else if (IMOSLoggingEnabled())
              {
                uint64_t v72 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
                {
                  uint64_t v76 = objc_msgSend_guid(v11, v73, v74, v75);
                  *(_DWORD *)buf = 138412546;
                  uint64_t v100 = v76;
                  __int16 v101 = 2112;
                  uint64_t v102 = v46;
                  _os_log_impl(&dword_1A4AF7000, v72, OS_LOG_TYPE_INFO, "When attempting to remove message %@, no part identifier was found for thread identifier %@", buf, 0x16u);
                }
              }
            }
          }
        }
      }
      uint64_t v88 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v95, (uint64_t)v103, 16);
    }
    while (v88);
  }
  else
  {
    id v7 = 0;
    id v85 = 0;
    CFMutableDictionaryRef Mutable = 0;
  }

  v89[0] = MEMORY[0x1E4F143A8];
  v89[1] = 3221225472;
  v89[2] = sub_1A4BE8408;
  v89[3] = &unk_1E5B7D730;
  v89[4] = self;
  id v90 = v85;
  id v91 = v7;
  CFMutableDictionaryRef v92 = Mutable;
  id v93 = v83;
  id v77 = v83;
  uint64_t v78 = Mutable;
  id v79 = v7;
  id v80 = v85;
  objc_msgSend__updateChatItemsWithReason_block_(self, v81, @"(IMChat) Decrement reply counts", (uint64_t)v89);
}

- (id)muteUntilDate
{
  id v5 = objc_msgSend_sharedList(MEMORY[0x1E4F6E8A8], a2, v2, v3);
  uint64_t v8 = objc_msgSend_unmuteDateForChat_(v5, v6, (uint64_t)self, v7);

  return v8;
}

- (void)setMuteUntilDate:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F6E8A8];
  id v5 = a3;
  objc_msgSend_sharedList(v4, v6, v7, v8);
  id v10 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_muteChat_untilDate_(v10, v9, (uint64_t)self, (uint64_t)v5);
}

- (IMDaemonProtocol)daemonController
{
  return (IMDaemonProtocol *)objc_msgSend_sharedInstance(IMDaemonController, a2, v2, v3);
}

- (id)_lastKTVerifierResultForParticipant:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend_sharedController(IMKeyTransparencyController, v5, v6, v7);
  uint64_t v12 = objc_msgSend_ID(v4, v9, v10, v11);
  uint64_t v16 = objc_msgSend__stripFZIDPrefix(v12, v13, v14, v15);
  uint64_t v19 = objc_msgSend_ktVerifierResultForHandleID_(v8, v17, (uint64_t)v16, v18);

  if (v19)
  {
    id inited = v19;
  }
  else
  {
    uint64_t v24 = objc_msgSend__keyTransparencyVerifier(self, v20, v21, v22);
    id v28 = objc_msgSend_ID(v4, v25, v26, v27);
    uint64_t v32 = objc_msgSend__stripFZIDPrefix(v28, v29, v30, v31);
    uint64_t v33 = IMChatCanonicalIDSIDsForAddress();

    if (IMOSLoggingEnabled())
    {
      uint64_t v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        int v62 = 138412290;
        uint64_t v63 = v33;
        _os_log_impl(&dword_1A4AF7000, v37, OS_LOG_TYPE_INFO, "Could not find a kt verifier result for handle: %@  initializing to Pending", (uint8_t *)&v62, 0xCu);
      }
    }
    uint64_t v38 = (void *)MEMORY[0x1E4FB0028];
    int v39 = objc_msgSend_applicationIdentifier(v24, v34, v35, v36);
    uint64_t v41 = objc_msgSend_addApplicationPrefixForIdentifier_uri_(v38, v40, (uint64_t)v39, (uint64_t)v33);

    id v42 = objc_alloc(MEMORY[0x1E4FB0020]);
    uint64_t v46 = objc_msgSend_applicationIdentifier(v24, v43, v44, v45);
    id inited = (id)objc_msgSend_initPendingForUri_application_(v42, v47, (uint64_t)v41, (uint64_t)v46);

    id v51 = objc_msgSend_sharedController(IMKeyTransparencyController, v48, v49, v50);
    char v55 = objc_msgSend_ID(v4, v52, v53, v54);
    uint64_t v59 = objc_msgSend__stripFZIDPrefix(v55, v56, v57, v58);
    objc_msgSend_setKTVerifierResult_forHandleID_(v51, v60, (uint64_t)inited, (uint64_t)v59);
  }

  return inited;
}

- (id)_ktQueue
{
  if (qword_1E965DE28 != -1) {
    dispatch_once(&qword_1E965DE28, &unk_1EF8E65E8);
  }
  uint64_t v2 = (void *)qword_1E965DE20;

  return v2;
}

- (void)markKTFailureSeen
{
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isKeyTransparencyEnabled = objc_msgSend_isKeyTransparencyEnabled(v5, v6, v7, v8);

  if (isKeyTransparencyEnabled)
  {
    uint64_t v13 = objc_msgSend__keyTransparencyVerifier(self, v10, v11, v12);
    uint64_t v17 = objc_msgSend_participants(self, v14, v15, v16);
    uint64_t v21 = objc_msgSend_copy(v17, v18, v19, v20);

    uint64_t v22 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v26 = objc_msgSend_count(v21, v23, v24, v25);
    id v29 = objc_msgSend_arrayWithCapacity_(v22, v27, v26, v28);
    long long v52 = 0u;
    long long v53 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    id v30 = v21;
    uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v31, (uint64_t)&v52, (uint64_t)v56, 16);
    if (v32)
    {
      uint64_t v35 = v32;
      uint64_t v36 = *(void *)v53;
      do
      {
        uint64_t v37 = 0;
        do
        {
          if (*(void *)v53 != v36) {
            objc_enumerationMutation(v30);
          }
          uint64_t v40 = objc_msgSend__lastKTVerifierResultForParticipant_(self, v33, *(void *)(*((void *)&v52 + 1) + 8 * v37), v34);
          if (v40) {
            objc_msgSend_addObject_(v29, v38, (uint64_t)v40, v39);
          }

          ++v37;
        }
        while (v35 != v37);
        uint64_t v35 = objc_msgSend_countByEnumeratingWithState_objects_count_(v30, v33, (uint64_t)&v52, (uint64_t)v56, 16);
      }
      while (v35);
    }

    uint64_t v44 = objc_msgSend__ktQueue(self, v41, v42, v43);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1A4BE8DE0;
    block[3] = &unk_1E5B7BE70;
    id v49 = v13;
    id v50 = v29;
    id v51 = v30;
    id v45 = v30;
    id v46 = v29;
    id v47 = v13;
    dispatch_async(v44, block);
  }
}

- (void)ignoreKTFailure
{
  uint64_t v136 = *MEMORY[0x1E4F143B8];
  id v4 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isKeyTransparencyEnabled = objc_msgSend_isKeyTransparencyEnabled(v4, v5, v6, v7);

  if (isKeyTransparencyEnabled)
  {
    uint64_t v118 = objc_msgSend__keyTransparencyVerifier(self, v9, v10, v11);
    uint64_t v12 = (void *)MEMORY[0x1E4F1CA48];
    uint64_t v16 = objc_msgSend_participants(self, v13, v14, v15);
    uint64_t v20 = objc_msgSend_count(v16, v17, v18, v19);
    uint64_t v119 = objc_msgSend_arrayWithCapacity_(v12, v21, v20, v22);

    long long v128 = 0u;
    long long v129 = 0u;
    long long v126 = 0u;
    long long v127 = 0u;
    uint64_t v26 = objc_msgSend_participants(self, v23, v24, v25);
    uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v126, (uint64_t)v135, 16);
    if (v30)
    {
      uint64_t v31 = *(void *)v127;
      do
      {
        uint64_t v32 = 0;
        do
        {
          if (*(void *)v127 != v31) {
            objc_enumerationMutation(v26);
          }
          uint64_t v35 = objc_msgSend__lastKTVerifierResultForParticipant_(self, v28, *(void *)(*((void *)&v126 + 1) + 8 * v32), v29);
          if (v35) {
            objc_msgSend_addObject_(v119, v33, (uint64_t)v35, v34);
          }

          ++v32;
        }
        while (v30 != v32);
        uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v28, (uint64_t)&v126, (uint64_t)v135, 16);
      }
      while (v30);
    }

    id v125 = 0;
    objc_msgSend_ignoreFailureForResults_error_(v118, v36, (uint64_t)v119, (uint64_t)&v125);
    id v114 = v125;
    if (v114)
    {
      uint64_t v40 = (void *)MEMORY[0x1E4F1CA48];
      uint64_t v41 = objc_msgSend_participants(self, v37, v38, v39);
      uint64_t v45 = objc_msgSend_count(v41, v42, v43, v44);
      uint64_t v117 = objc_msgSend_arrayWithCapacity_(v40, v46, v45, v47);

      long long v123 = 0u;
      long long v124 = 0u;
      long long v121 = 0u;
      long long v122 = 0u;
      objc_msgSend_participants(self, v48, v49, v50);
      id obj = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v51, (uint64_t)&v121, (uint64_t)v134, 16);
      if (v55)
      {
        uint64_t v116 = *(void *)v122;
        do
        {
          uint64_t v56 = 0;
          do
          {
            if (*(void *)v122 != v116) {
              objc_enumerationMutation(obj);
            }
            uint64_t v57 = *(void **)(*((void *)&v121 + 1) + 8 * v56);
            uint64_t v58 = objc_msgSend_sharedController(IMKeyTransparencyController, v52, v53, v54);
            int v62 = objc_msgSend_ID(v57, v59, v60, v61);
            uint64_t v66 = objc_msgSend__stripFZIDPrefix(v62, v63, v64, v65);
            uint64_t v69 = objc_msgSend_idsIDInfoResultForHandleID_(v58, v67, (uint64_t)v66, v68);

            uint64_t v73 = objc_msgSend_uri(v69, v70, v71, v72);
            uint64_t v74 = (void *)MEMORY[0x1E4FB0028];
            uint64_t v78 = objc_msgSend_applicationIdentifier(v118, v75, v76, v77);
            id v80 = objc_msgSend_addApplicationPrefixForIdentifier_uri_(v74, v79, (uint64_t)v78, (uint64_t)v73);

            uint64_t v84 = objc_msgSend_sharedController(IMKeyTransparencyController, v81, v82, v83);
            uint64_t v88 = objc_msgSend_ID(v57, v85, v86, v87);
            CFMutableDictionaryRef v92 = objc_msgSend__stripFZIDPrefix(v88, v89, v90, v91);
            long long v95 = objc_msgSend_ktVerifierResultForHandleID_(v84, v93, (uint64_t)v92, v94);

            long long v96 = NSString;
            uint64_t v100 = objc_msgSend_name(v57, v97, v98, v99);
            uint64_t v104 = objc_msgSend_uiStatus(v95, v101, v102, v103);
            uint64_t v107 = objc_msgSend_stringWithFormat_(v96, v105, @"(name:%@, uri:%@, uiStatus:%lu)", v106, v100, v80, v104);

            objc_msgSend_addObject_(v117, v108, (uint64_t)v107, v109);
            ++v56;
          }
          while (v55 != v56);
          uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v52, (uint64_t)&v121, (uint64_t)v134, 16);
        }
        while (v55);
      }

      if (IMOSLoggingEnabled())
      {
        long long v110 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v110, OS_LOG_TYPE_INFO))
        {
          uint64_t v113 = objc_msgSend_componentsJoinedByString_(v117, v111, @" ", v112);;
          *(_DWORD *)buf = 138412546;
          uint64_t v131 = v113;
          __int16 v132 = 2112;
          id v133 = v114;
          _os_log_impl(&dword_1A4AF7000, v110, OS_LOG_TYPE_INFO, "IMChat_KT There was an error ignoring the KT failure for participants [%@] with error: %@", buf, 0x16u);
        }
      }
    }
    objc_msgSend_fetchKTStatus(self, v37, v38, v39);
  }
}

- (unint64_t)conversationKTUIStatus
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v5 = (void *)MEMORY[0x1E4F1CA48];
  uint64_t v6 = objc_msgSend_participants(self, a2, v2, v3);
  uint64_t v10 = objc_msgSend_count(v6, v7, v8, v9);
  uint64_t v13 = objc_msgSend_arrayWithCapacity_(v5, v11, v10, v12);

  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  uint64_t v17 = objc_msgSend_participants(self, v14, v15, v16, 0);
  uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v18, (uint64_t)&v39, (uint64_t)v43, 16);
  if (v19)
  {
    uint64_t v22 = v19;
    uint64_t v23 = *(void *)v40;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v40 != v23) {
          objc_enumerationMutation(v17);
        }
        uint64_t v27 = objc_msgSend__lastKTVerifierResultForParticipant_(self, v20, *(void *)(*((void *)&v39 + 1) + 8 * v24), v21);
        if (v27) {
          objc_msgSend_addObject_(v13, v25, (uint64_t)v27, v26);
        }

        ++v24;
      }
      while (v22 != v24);
      uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v17, v20, (uint64_t)&v39, (uint64_t)v43, 16);
    }
    while (v22);
  }

  uint64_t v31 = objc_msgSend__keyTransparencyVerifier(self, v28, v29, v30);
  uint64_t v35 = IMIsEnrolledInContactKeyVerification((uint64_t)v31, v32, v33, v34);
  unint64_t isSelfOptedIn = objc_msgSend_getDisplayStatusForResults_isSelfOptedIn_(v31, v36, (uint64_t)v13, v35);

  return isSelfOptedIn;
}

- (id)getParticipantsWithKTUIStatus:(unint64_t)a3
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  objc_msgSend_array(MEMORY[0x1E4F1CA48], a2, a3, v3);
  id v36 = (id)objc_claimAutoreleasedReturnValue();
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  objc_msgSend_participants(self, v6, v7, v8);
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v38, (uint64_t)v42, 16);
  if (v10)
  {
    uint64_t v14 = v10;
    uint64_t v15 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v39 != v15) {
          objc_enumerationMutation(obj);
        }
        uint64_t v17 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        uint64_t v18 = objc_msgSend_sharedController(IMKeyTransparencyController, v11, v12, v13);
        uint64_t v22 = objc_msgSend_ID(v17, v19, v20, v21);
        uint64_t v26 = objc_msgSend__stripFZIDPrefix(v22, v23, v24, v25);
        uint64_t v29 = objc_msgSend_ktVerifierResultForHandleID_(v18, v27, (uint64_t)v26, v28);

        if (objc_msgSend_uiStatus(v29, v30, v31, v32) == a3) {
          objc_msgSend_addObject_(v36, v33, (uint64_t)v17, v34);
        }
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v11, (uint64_t)&v38, (uint64_t)v42, 16);
    }
    while (v14);
  }

  return v36;
}

- (unint64_t)getKTDisplayStatusAndRelatedPeerHandles:(id *)a3
{
  uint64_t v89 = *MEMORY[0x1E4F143B8];
  uint64_t v6 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, (uint64_t)a3, v3);
  int isKeyTransparencyEnabled = objc_msgSend_isKeyTransparencyEnabled(v6, v7, v8, v9);

  if (!isKeyTransparencyEnabled) {
    return 0;
  }
  uint64_t v75 = objc_msgSend_conversationKTUIStatus(self, v11, v12, v13);
  objc_msgSend_getParticipantsWithKTUIStatus_(self, v14, v75, v15);
  id v76 = (id)objc_claimAutoreleasedReturnValue();
  int isLastIncomingFinishedMessageNotiMessage = objc_msgSend_isLastIncomingFinishedMessageNotiMessage(self, v16, v17, v18);
  uint64_t v77 = IMKeyTransparencyStatusFromKTUIStatus(v75, isLastIncomingFinishedMessageNotiMessage ^ 1u);
  objc_msgSend_setLastKTStatus_(self, v20, v77, v21);
  if (a3 && v76) {
    *a3 = v76;
  }
  if (v77)
  {
    uint64_t v25 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v22, v23, v24);
    long long v80 = 0u;
    long long v81 = 0u;
    long long v78 = 0u;
    long long v79 = 0u;
    id v26 = v76;
    uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v27, (uint64_t)&v78, (uint64_t)v88, 16);
    if (v31)
    {
      uint64_t v32 = *(void *)v79;
      do
      {
        uint64_t v33 = 0;
        do
        {
          if (*(void *)v79 != v32) {
            objc_enumerationMutation(v26);
          }
          uint64_t v34 = *(void **)(*((void *)&v78 + 1) + 8 * v33);
          uint64_t v35 = objc_msgSend_sharedController(IMKeyTransparencyController, v28, v29, v30);
          long long v39 = objc_msgSend_ID(v34, v36, v37, v38);
          uint64_t v43 = objc_msgSend__stripFZIDPrefix(v39, v40, v41, v42);
          id v46 = objc_msgSend_idsIDInfoResultForHandleID_(v35, v44, (uint64_t)v43, v45);

          uint64_t v50 = objc_msgSend_uri(v46, v47, v48, v49);

          if (v50)
          {
            uint64_t v54 = objc_msgSend_uri(v46, v51, v52, v53);
            objc_msgSend_addObject_(v25, v55, (uint64_t)v54, v56);
          }
          ++v33;
        }
        while (v31 != v33);
        uint64_t v31 = objc_msgSend_countByEnumeratingWithState_objects_count_(v26, v28, (uint64_t)&v78, (uint64_t)v88, 16);
      }
      while (v31);
    }

    if (IMOSLoggingEnabled())
    {
      uint64_t v57 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
      {
        uint64_t v60 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v58, v75, v59);
        uint64_t v63 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v61, v77, v62);
        uint64_t v66 = objc_msgSend_componentsJoinedByString_(v25, v64, @", ", v65);
        *(_DWORD *)buf = 138412802;
        uint64_t v83 = v60;
        __int16 v84 = 2112;
        id v85 = v63;
        __int16 v86 = 2112;
        uint64_t v87 = v66;
        _os_log_impl(&dword_1A4AF7000, v57, OS_LOG_TYPE_INFO, "Received KT display status %@/IM status %@ for %@", buf, 0x20u);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v67 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
    {
      int v70 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v68, v75, v69);
      uint64_t v73 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v71, 0, v72);
      *(_DWORD *)buf = 138412546;
      uint64_t v83 = v70;
      __int16 v84 = 2112;
      id v85 = v73;
      _os_log_impl(&dword_1A4AF7000, v67, OS_LOG_TYPE_INFO, "Received KT display status %@/IM status %@", buf, 0x16u);
    }
  }

  return v77;
}

- (unint64_t)keyTransparencyStatusForAffectedHandles:(id *)a3
{
  return ((uint64_t (*)(IMChat *, char *, id *))MEMORY[0x1F4181798])(self, sel_getKTDisplayStatusAndRelatedPeerHandles_, a3);
}

- (void)fetchKTStatus
{
  if (IMIsEnrolledInContactKeyVerification((uint64_t)self, a2, v2, v3))
  {
    objc_msgSend_refreshServiceForSending(self, v5, v6, v7);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Self is not opted in, returning early before requesting status.", v9, 2u);
      }
    }
    self->_ktStatus = 0;
    self->_lastKTStatus = 0;
  }
}

- (id)_keyTransparencyVerifier
{
  id v4 = objc_msgSend_sharedController(IMKeyTransparencyController, a2, v2, v3);
  uint64_t v8 = objc_msgSend_verifier(v4, v5, v6, v7);

  return v8;
}

- (BOOL)_lastKnownHybridState
{
  uint64_t v3 = objc_msgSend_valueForChatProperty_(self, a2, *MEMORY[0x1E4F6CDA8], v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (BOOL)_isBlackHoled
{
  uint64_t v3 = objc_msgSend_valueForChatProperty_(self, a2, *MEMORY[0x1E4F6CD60], v2);
  char v7 = objc_msgSend_BOOLValue(v3, v4, v5, v6);

  return v7;
}

- (BOOL)_updateLastKnownHybridState:(BOOL)a3
{
  BOOL v4 = a3;
  if (objc_msgSend__lastKnownHybridState(self, a2, a3, v3) != a3)
  {
    uint64_t v9 = objc_msgSend_sharedController(IMDaemonController, v6, v7, v8);
    uint64_t v13 = objc_msgSend_synchronousRemoteDaemon(v9, v10, v11, v12);
    uint64_t v17 = objc_msgSend_guid(self, v14, v15, v16);
    objc_msgSend_chat_updateLastKnownHybridState_(v13, v18, (uint64_t)v17, v4);
  }
  return v4;
}

- (BOOL)_serviceSupportsCapability:(id)a3
{
  id v4 = a3;
  uint64_t v8 = objc_msgSend_account(self, v5, v6, v7);
  char hasSuppressionForCapability = objc_msgSend__hasSuppressionForCapability_(v8, v9, (uint64_t)v4, v10);

  if ((hasSuppressionForCapability & 1) == 0)
  {
    id v46 = objc_msgSend_account(self, v12, v13, v14);
    uint64_t v22 = objc_msgSend_service(v46, v47, v48, v49);
    char v52 = objc_msgSend_supportsCapability_((void *)v22, v50, (uint64_t)v4, v51);
    goto LABEL_12;
  }
  uint64_t v15 = objc_msgSend_lastAddressedHandleID(self, v12, v13, v14);
  uint64_t v22 = objc_msgSend_lastAddressedSIMID(self, v16, v17, v18);
  if (!(v15 | v22))
  {
    uint64_t v34 = objc_msgSend_account(self, v19, v20, v21);
    uint64_t v15 = objc_msgSend_displayName(v34, v53, v54, v55);
    goto LABEL_7;
  }
  uint64_t v23 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E668], v19, v20, v21);
  uint64_t v27 = objc_msgSend_ctSubscriptionInfo(v23, v24, v25, v26);
  uint64_t v30 = objc_msgSend___im_subscriptionContextForForSimID_(v27, v28, v22, v29);

  if (v30)
  {
    uint64_t v34 = objc_msgSend_sharedInstance(MEMORY[0x1E4F6E668], v31, v32, v33);
    uint64_t v38 = objc_msgSend_ctSubscriptionInfo(v34, v35, v36, v37);
    uint64_t v41 = objc_msgSend___im_subscriptionContextForForSimID_(v38, v39, v22, v40);
    uint64_t v45 = objc_msgSend_phoneNumber(v41, v42, v43, v44);

    uint64_t v15 = v45;
LABEL_7:
  }
  uint64_t v56 = objc_msgSend__stripFZIDPrefix((void *)v15, v31, v32, v33);

  if (objc_msgSend__appearsToBePhoneNumber(v56, v57, v58, v59)) {
    IMNormalizePhoneNumber();
  }
  else {
  id v46 = IMCanonicalizeFormattedString();
  }

  uint64_t v63 = objc_msgSend_account(self, v60, v61, v62);
  char v52 = objc_msgSend_supportsCapability_forAlias_simID_(v63, v64, (uint64_t)v4, (uint64_t)v46, v22);

LABEL_12:
  return v52;
}

- (BOOL)supportsSendingTypingIndicators
{
  return objc_msgSend__serviceSupportsCapability_(self, a2, *MEMORY[0x1E4F6E120], v2);
}

- (BOOL)supportsSendingReadReceipts
{
  return objc_msgSend__serviceSupportsCapability_(self, a2, *MEMORY[0x1E4F6E0C8], v2);
}

- (BOOL)supportsFilteringExtensions
{
  return objc_msgSend__serviceSupportsCapability_(self, a2, *MEMORY[0x1E4F6E108], v2);
}

- (BOOL)accountMatchesLastFinishedMessageItem
{
  uint64_t v5 = objc_msgSend_lastFinishedMessageItem(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_service(v5, v6, v7, v8);
  uint64_t v13 = objc_msgSend_account(self, v10, v11, v12);
  uint64_t v17 = objc_msgSend_service(v13, v14, v15, v16);
  uint64_t v21 = objc_msgSend_internalName(v17, v18, v19, v20);
  char isEqualToString = objc_msgSend_isEqualToString_(v9, v22, (uint64_t)v21, v23);

  return isEqualToString;
}

- (NSArray)frequentReplies
{
  return self->_frequentReplies;
}

- (void)setFrequentReplies:(id)a3
{
}

- (void)_setGUIDs:(id)a3
{
}

- (void)setParticipants:(id)a3
{
}

- (NSString)roomName
{
  return self->_roomName;
}

- (IMMessage)invitationForPendingParticipants
{
  return self->_invitationForPendingParticipants;
}

- (void)setInvitationForPendingParticipants:(id)a3
{
}

- (IMInlineReplyController)inlineReplyController
{
  return self->_inlineReplyController;
}

- (NSSet)mergedPinningIdentifiers
{
  return self->_mergedPinningIdentifiers;
}

- (void)setReplySuggestions:(id)a3
{
}

- (NSData)engramID
{
  return self->_engramID;
}

- (void)setInterworkingService:(id)a3
{
}

- (BOOL)hasSurfRequest
{
  return self->_hasSurfRequest;
}

- (void)setHasSurfRequest:(BOOL)a3
{
  self->_hasSurfRequest = a3;
}

- (unint64_t)ktStatus
{
  return self->_ktStatus;
}

- (void)setPendingIncomingSatelliteMessageCount:(unint64_t)a3
{
  self->_unint64_t pendingIncomingSatelliteMessageCount = a3;
}

- (unint64_t)totalSatelliteMessageCount
{
  return self->_totalSatelliteMessageCount;
}

- (void)setTotalSatelliteMessageCount:(unint64_t)a3
{
  self->_unint64_t totalSatelliteMessageCount = a3;
}

- (void)setRoomNameWithoutSuffix:(id)a3
{
}

- (NSString)localUserIsComposing
{
  return self->_localUserIsComposing;
}

- (void)setOscarChat:(BOOL)a3
{
  self->_oscarChat = a3;
}

- (void)setLastMessageTimeStampOnLoad:(int64_t)a3
{
  self->_lastuint64_t MessageTimeStampOnLoad = a3;
}

- (void)setSmsCategory:(int64_t)a3
{
  self->_smsCategory = a3;
}

- (BOOL)isRecovered
{
  return self->_recovered;
}

- (BOOL)isDeletingIncomingMessages
{
  return self->_deletingIncomingMessages;
}

- (BOOL)hasHadSuccessfulQuery
{
  return self->_hasHadSuccessfulQuery;
}

- (NSDictionary)bizIntent
{
  return self->_bizIntent;
}

- (void)setBizIntent:(id)a3
{
}

- (NSString)typingGUID
{
  return self->_typingGUID;
}

- (void)setTypingGUID:(id)a3
{
}

- (NSString)identifier
{
  return self->_identifier;
}

- (void)setIdentifier:(id)a3
{
}

- (NSMutableDictionary)participantStates
{
  return self->_participantStates;
}

- (void)setParticipantStates:(id)a3
{
}

- (NSMutableArray)messagesPendingJoin
{
  return self->_messagesPendingJoin;
}

- (void)setMessagesPendingJoin:(id)a3
{
}

- (NSMutableDictionary)chatProperties
{
  return self->_chatProperties;
}

- (void)setChatProperties:(id)a3
{
}

- (NSMutableDictionary)participantProperties
{
  return self->_participantProperties;
}

- (void)setParticipantProperties:(id)a3
{
}

- (void)setAttachments:(id)a3
{
}

- (void)setCountOfAttachmentsNotCachedLocally:(id)a3
{
}

- (NSNumber)countOfMessagesMarkedAsSpam
{
  return self->_countOfMessagesMarkedAsSpam;
}

- (void)setCountOfMessagesMarkedAsSpam:(id)a3
{
}

- (IMTimingCollection)timingCollection
{
  return self->_timingCollection;
}

- (void)setTimingCollection:(id)a3
{
}

- (void)setChatItemRules:(id)a3
{
}

- (IMSendProgress)sendProgress
{
  return self->_sendProgress;
}

- (void)setSendProgress:(id)a3
{
}

- (unint64_t)dbFailedCount
{
  return self->_dbFailedCount;
}

- (void)setDbFailedCount:(unint64_t)a3
{
  self->_int64_t dbFailedCount = a3;
}

- (unint64_t)dbUnreadCount
{
  return self->_dbUnreadCount;
}

- (void)setDbUnreadCount:(unint64_t)a3
{
  self->_unint64_t dbUnreadCount = a3;
}

- (BOOL)hasBeenConfigured
{
  return self->_hasBeenConfigured;
}

- (void)setHasBeenConfigured:(BOOL)a3
{
  self->_hasBeenConfigured = a3;
}

- (BOOL)isFirstMessageInvitation
{
  return self->_isFirstMessageInvitation;
}

- (void)setIsFirstMessageInvitation:(BOOL)a3
{
  self->_isFirstMessageInvitation = a3;
}

- (BOOL)wasInvitationHandled
{
  return self->_wasInvitationHandled;
}

- (void)setWasInvitationHandled:(BOOL)a3
{
  self->_wasInvitationHandled = a3;
}

- (BOOL)didSendAFinishedMessage
{
  return self->_didSendAFinishedMessage;
}

- (void)setDidSendAFinishedMessage:(BOOL)a3
{
  self->_didSendAFinishedMessage = a3;
}

- (BOOL)isUpdatingChatItems
{
  return self->_isUpdatingChatItems;
}

- (void)setIsUpdatingChatItems:(BOOL)a3
{
  self->_isUpdatingChatItems = a3;
}

- (NSString)currentUnreadHistoryQuery
{
  return self->_currentUnreadHistoryQuery;
}

- (void)setCurrentUnreadHistoryQuery:(id)a3
{
}

- (BOOL)hasEarlierMessagesToLoad
{
  return self->_hasEarlierMessagesToLoad;
}

- (void)setHasEarlierMessagesToLoad:(BOOL)a3
{
  self->_hasEarlierMessagesToLoad = a3;
}

- (BOOL)hasMoreRecentMessagesToLoad
{
  return self->_hasMoreRecentMessagesToLoad;
}

- (void)setHasMoreRecentMessagesToLoad:(BOOL)a3
{
  self->_hasMoreRecentMessagesToLoad = a3;
}

- (BOOL)isCurrentlyDownloadingPurgedAssets
{
  return self->_isCurrentlyDownloadingPurgedAssets;
}

- (void)setIsCurrentlyDownloadingPurgedAssets:(BOOL)a3
{
  self->_isCurrentlyDownloadingPurgedAssets = a3;
}

- (int64_t)interworkingState
{
  return self->_interworkingState;
}

- (void)setInterworkingState:(int64_t)a3
{
  self->_interworkingState = a3;
}

- (NSString)groupChatIdentifierUppercase
{
  return self->_groupChatIdentifierUppercase;
}

- (int64_t)hasKnownParticipantsCacheStatus
{
  return self->_hasKnownParticipantsCacheStatus;
}

- (void)setHasKnownParticipantsCacheStatus:(int64_t)a3
{
  self->_unint64_t hasKnownParticipantsCacheStatus = a3;
}

- (BOOL)isUnregistered
{
  return self->_unregistered;
}

- (void)setUnregistered:(BOOL)a3
{
  self->_unregistered = a3;
}

- (NSNumber)cachedStewieSharingChat
{
  return self->_cachedStewieSharingChat;
}

- (void)setCachedStewieSharingChat:(id)a3
{
}

- (IMHandle)cachedEUHandle
{
  return self->_cachedEUHandle;
}

- (void)setCachedEUHandle:(id)a3
{
}

- (unint64_t)lastKTStatus
{
  return self->_lastKTStatus;
}

- (void)setLastKTStatus:(unint64_t)a3
{
  self->_lastKTStatus = a3;
}

- (BOOL)hasQueriedForSiblingChats
{
  return self->_hasQueriedForSiblingChats;
}

- (void)setHasQueriedForSiblingChats:(BOOL)a3
{
  self->_hasQueriedForSiblingChats = a3;
}

- (char)downgradeState
{
  return self->_downgradeState;
}

- (void)setDowngradeState:(char)a3
{
  self->_downgradeState = a3;
}

- (int64_t)hybridGroupState
{
  return self->_hybridGroupState;
}

- (void)setHybridGroupState:(int64_t)a3
{
  self->_hybridGroupState = a3;
}

- (void)setIgnoreDowngradeStatusUpdates:(BOOL)a3
{
  self->_ignoreDowngradeStatusUpdates = a3;
}

- (BOOL)serviceSwitchRequested
{
  return self->_serviceSwitchRequested;
}

- (void)setServiceSwitchRequested:(BOOL)a3
{
  self->_serviceSwitchRequested = a3;
}

- (BOOL)forceMMS
{
  return self->_forceMMS;
}

- (void)setForceMMS:(BOOL)a3
{
  self->_forceMMS = a3;
}

- (NSString)lastUndeliveredMessageGUIDForForcedQuery
{
  return self->_lastUndeliveredMessageGUIDForForcedQuery;
}

- (void)setLastUndeliveredMessageGUIDForForcedQuery:(id)a3
{
}

- (double)latestTypingIndicatorTimeInterval
{
  return self->_latestTypingIndicatorTimeInterval;
}

- (void)setLatestTypingIndicatorTimeInterval:(double)a3
{
  self->_latestTypingIndicatorTimeInterval = a3;
}

- (IMOrderingTools)orderingTools
{
  return self->_orderingTools;
}

- (void)setOrderingTools:(id)a3
{
}

- (NSString)currentLocationGUID
{
  return self->_currentLocationGUID;
}

- (void)setCurrentLocationGUID:(id)a3
{
}

- (NSMutableArray)showingEditHistoryForChatItemGUIDs
{
  return self->_showingEditHistoryForChatItemGUIDs;
}

- (void)setShowingEditHistoryForChatItemGUIDs:(id)a3
{
}

- (void)setCachedShouldShowReportSpam:(int64_t)a3
{
  self->_cachedShouldShowReportSpam = a3;
}

- (void)setCachedShouldShowSpam:(int64_t)a3
{
  self->_cachedShouldShowSpam = a3;
}

- (IMReasonTrackingUpdater)chatItemsUpdater
{
  return self->_chatItemsUpdater;
}

- (void)setChatItemsUpdater:(id)a3
{
}

- (BOOL)isSubscriptionSwitchParticipantAddTypeFound
{
  return self->_isSubscriptionSwitchParticipantAddTypeFound;
}

- (void)setIsSubscriptionSwitchParticipantAddTypeFound:(BOOL)a3
{
  self->_isSubscriptionSwitchParticipantAddTypeFound = a3;
}

- (IMParticipantChangeChatItem)subscriptionSwitchParticipantAddChatItem
{
  return self->_subscriptionSwitchParticipantAddChatItem;
}

- (void)setSubscriptionSwitchParticipantAddChatItem:(id)a3
{
}

- (void)setRecoverableMessagesCount:(unint64_t)a3
{
  self->_recoverableMessagesCount = a3;
}

- (unint64_t)unreadRecoverableMessagesCount
{
  return self->_unreadRecoverableMessagesCount;
}

- (void)setUnreadRecoverableMessagesCount:(unint64_t)a3
{
  self->_unreadRecoverableMessagesCount = a3;
}

- (NSDate)earliestRecoverableMessageDeletionDate
{
  return self->_earliestRecoverableMessageDeletionDate;
}

- (void)setEarliestRecoverableMessageDeletionDate:(id)a3
{
}

- (NSDate)latestRecoverableMessageDeletionDate
{
  return self->_latestRecoverableMessageDeletionDate;
}

- (void)setLatestRecoverableMessageDeletionDate:(id)a3
{
}

- (BOOL)lastUsedSatelliteStatus
{
  return self->_lastUsedSatelliteStatus;
}

- (void)setLastUsedSatelliteStatus:(BOOL)a3
{
  self->_lastUsedSatelliteStatus = a3;
}

- (NSDate)lastSatelliteFetchDate
{
  return self->_lastSatelliteFetchDate;
}

- (void)setLastSatelliteFetchDate:(id)a3
{
}

- (BOOL)lastUsedShowTextRoadsideProviderStatus
{
  return self->_lastUsedShowTextRoadsideProviderStatus;
}

- (void)setLastUsedShowTextRoadsideProviderStatus:(BOOL)a3
{
  self->_lastUsedShowTextRoadsideProviderStatus = a3;
}

- (BOOL)lastUsedShowTextEmergencyServicesStatus
{
  return self->_lastUsedShowTextEmergencyServicesStatus;
}

- (void)setLastUsedShowTextEmergencyServicesStatus:(BOOL)a3
{
  self->_lastUsedShowTextEmergencyServicesStatus = a3;
}

- (NSDate)earliestCachedMessageDate
{
  return self->_earliestCachedMessageDate;
}

- (void)setEarliestCachedMessageDate:(id)a3
{
}

- (BOOL)hasRefreshedServiceForSending
{
  return self->_hasRefreshedServiceForSending;
}

- (void)setHasRefreshedServiceForSending:(BOOL)a3
{
  self->_hasRefreshedServiceForSending = a3;
}

- (NSString)lastAddressedSIMID
{
  return self->_lastAddressedSIMID;
}

- (NSDictionary)proofreadingInfo
{
  return self->_proofreadingInfo;
}

- (void)setProofreadingInfo:(id)a3
{
}

- (NSDate)lastCompletedServiceReachabilityRequestStartTime
{
  return self->_lastCompletedServiceReachabilityRequestStartTime;
}

- (void)setLastCompletedServiceReachabilityRequestStartTime:(id)a3
{
}

- (NSString)suggestedRepliesData
{
  return self->_suggestedRepliesData;
}

- (void)setSuggestedRepliesData:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_suggestedRepliesData, 0);
  objc_storeStrong((id *)&self->_lastCompletedServiceReachabilityRequestStartTime, 0);
  objc_storeStrong((id *)&self->_originalGroupID, 0);
  objc_storeStrong((id *)&self->_proofreadingInfo, 0);
  objc_storeStrong((id *)&self->_lastAddressedSIMID, 0);
  objc_storeStrong((id *)&self->_earliestCachedMessageDate, 0);
  objc_storeStrong((id *)&self->_lastSatelliteFetchDate, 0);
  objc_storeStrong((id *)&self->_latestRecoverableMessageDeletionDate, 0);
  objc_storeStrong((id *)&self->_earliestRecoverableMessageDeletionDate, 0);
  objc_storeStrong((id *)&self->_subscriptionSwitchParticipantAddChatItem, 0);
  objc_storeStrong((id *)&self->_chatItemsUpdater, 0);
  objc_storeStrong((id *)&self->_showingEditHistoryForChatItemGUIDs, 0);
  objc_storeStrong((id *)&self->_currentLocationGUID, 0);
  objc_storeStrong((id *)&self->_orderingTools, 0);
  objc_storeStrong((id *)&self->_lastUndeliveredMessageGUIDForForcedQuery, 0);
  objc_storeStrong((id *)&self->_downgradeStateUpdater, 0);
  objc_storeStrong((id *)&self->_cachedEUHandle, 0);
  objc_storeStrong((id *)&self->_cachedStewieSharingChat, 0);
  objc_storeStrong((id *)&self->_groupChatIdentifierUppercase, 0);
  objc_storeStrong((id *)&self->_currentUnreadHistoryQuery, 0);
  objc_storeStrong((id *)&self->_sendProgress, 0);
  objc_storeStrong((id *)&self->_chatItemRules, 0);
  objc_storeStrong((id *)&self->_timingCollection, 0);
  objc_storeStrong((id *)&self->_countOfMessagesMarkedAsSpam, 0);
  objc_storeStrong((id *)&self->_countOfAttachmentsNotCachedLocally, 0);
  objc_storeStrong((id *)&self->_attachments, 0);
  objc_storeStrong((id *)&self->_participantProperties, 0);
  objc_storeStrong((id *)&self->_chatProperties, 0);
  objc_storeStrong((id *)&self->_messagesPendingJoin, 0);
  objc_storeStrong((id *)&self->_participantStates, 0);
  objc_storeStrong((id *)&self->_identifier, 0);
  objc_storeStrong((id *)&self->_typingGUID, 0);
  objc_storeStrong((id *)&self->_bizIntent, 0);
  objc_storeStrong((id *)&self->_localUserIsComposing, 0);
  objc_storeStrong((id *)&self->_roomNameWithoutSuffix, 0);
  objc_storeStrong((id *)&self->_interworkingService, 0);
  objc_storeStrong((id *)&self->_engramID, 0);
  objc_storeStrong((id *)&self->_personCentricID, 0);
  objc_storeStrong((id *)&self->_replySuggestions, 0);
  objc_storeStrong((id *)&self->_mergedPinningIdentifiers, 0);
  objc_storeStrong((id *)&self->_inlineReplyController, 0);
  objc_storeStrong((id *)&self->_invitationForPendingParticipants, 0);
  objc_storeStrong((id *)&self->_displayName, 0);
  objc_storeStrong((id *)&self->_roomName, 0);
  objc_storeStrong((id *)&self->_participants, 0);
  objc_storeStrong((id *)&self->_account, 0);
  objc_storeStrong((id *)&self->_guid, 0);
  objc_storeStrong((id *)&self->_guids, 0);
  objc_storeStrong((id *)&self->_groupID, 0);
  objc_storeStrong((id *)&self->_lastAddressedHandleID, 0);
  objc_storeStrong((id *)&self->_frequentReplies, 0);
  objc_storeStrong((id *)&self->_momentSharePresentationCache, 0);

  objc_storeStrong((id *)&self->_momentShareCache, 0);
}

- (id)_privateInitWithAccount:(id)a3 style:(unsigned __int8)a4 roomName:(id)a5 messages:(id)a6 participants:(id)a7 isFiltered:(int64_t)a8 hasHadSuccessfulQuery:(BOOL)a9 isRecovered:(BOOL)a10 isDeletingIncomingMessages:(BOOL)a11
{
  uint64_t v14 = a4;
  uint64_t v16 = self;
  uint64_t v17 = NSString;
  id v18 = a7;
  id v19 = a5;
  id v20 = a3;
  uint64_t v24 = objc_msgSend_stringGUID(v17, v21, v22, v23);
  BYTE2(v28) = a11;
  LOWORD(v28) = __PAIR16__(a10, a9);
  uint64_t isDeletingIncomingMessages = objc_msgSend__initWithGUID_account_style_roomName_displayName_lastAddressedHandle_lastAddressedSIMID_items_participants_isFiltered_hasHadSuccessfulQuery_isRecovered_isDeletingIncomingMessages_(v16, v25, (uint64_t)v24, (uint64_t)v20, v14, v19, 0, 0, 0, 0, v18, a8, v28);

  return isDeletingIncomingMessages;
}

- (BOOL)_processSupportsHistory
{
  id v4 = objc_msgSend_daemonController(self, a2, v2, v3);
  unsigned int v8 = objc_msgSend_processCapabilities(v4, v5, v6, v7);

  return ((v8 & 0x4000004) != 0) & (v8 >> 13);
}

- (unint64_t)numberOfMessagesToKeepLoaded
{
  return ((uint64_t (*)(IMChat *, char *))MEMORY[0x1F4181798])(self, sel_capacity);
}

- (BOOL)hasMoreMessagesToLoad
{
  return (objc_msgSend_isMoreToLoad(self, a2, v2, v3) & 1) != 0 || self->_hasEarlierMessagesToLoad;
}

- (id)loadMessagesUpToGUID:(id)a3 limit:(unint64_t)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (objc_msgSend__processSupportsHistory(self, v7, v8, v9))
  {
    uint64_t v13 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v10, v11, v12);
    uint64_t v15 = objc_msgSend_loadMessagesUpToGUID_date_limit_loadImmediately_(self, v14, (uint64_t)v6, (uint64_t)v13, a4, 1);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v20 = objc_msgSend_guid(self, v17, v18, v19);
        int v22 = 138412546;
        id v23 = v6;
        __int16 v24 = 2112;
        uint64_t v25 = v20;
        _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Load messages up to GUID %@ for %@ rejected, client does not have history capability", (uint8_t *)&v22, 0x16u);
      }
    }
    uint64_t v15 = 0;
  }

  return v15;
}

- (id)loadMessagesBeforeDate:(id)a3 limit:(unint64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (objc_msgSend__processSupportsHistory(self, v7, v8, v9))
  {
    uint64_t v11 = objc_msgSend_loadMessagesBeforeDate_limit_loadImmediately_(self, v10, (uint64_t)v6, a4, 0);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        uint64_t v16 = objc_msgSend_guid(self, v13, v14, v15);
        int v18 = 138412290;
        uint64_t v19 = v16;
        _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Load messages before date for %@ rejected, client does not have history capability", (uint8_t *)&v18, 0xCu);
      }
    }
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)loadMessagesBeforeDate:(id)a3 limit:(unint64_t)a4 loadImmediately:(BOOL)a5
{
  return (id)objc_msgSend__fetchMessagesUpToGUID_limit_synchronous_completion_(self, a2, 0, a4, a5, &unk_1EF8E6608);
}

- (void)fetchMessagesUpToLimit:(unint64_t)a3 completion:(id)a4
{
  id v4 = (id)objc_msgSend__fetchMessagesUpToGUID_limit_synchronous_completion_(self, a2, 0, a3, 0, a4);
}

- (id)_fetchMessagesUpToLimit:(unint64_t)a3 synchronous:(BOOL)a4 completion:(id)a5
{
  BOOL v5 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v8 = a5;
  if (objc_msgSend__processSupportsHistory(self, v9, v10, v11))
  {
    uint64_t v13 = objc_msgSend__fetchMessagesUpToGUID_limit_synchronous_completion_(self, v12, 0, a3, v5, v8);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v18 = objc_msgSend_guid(self, v15, v16, v17);
        int v20 = 138412290;
        uint64_t v21 = v18;
        _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Load messages before date for %@ rejected, client does not have history capability", (uint8_t *)&v20, 0xCu);
      }
    }
    uint64_t v13 = 0;
  }

  return v13;
}

- (id)loadMessagesUpToGUID:(id)a3 date:(id)a4 limit:(unint64_t)a5 loadImmediately:(BOOL)a6
{
  return (id)objc_msgSend__fetchMessagesUpToGUID_limit_synchronous_completion_(self, a2, (uint64_t)a3, a5, a6, &unk_1EF8E6628);
}

- (void)fetchMessagesUpToGUID:(id)a3 limit:(unint64_t)a4 completion:(id)a5
{
  id v5 = (id)objc_msgSend__fetchMessagesUpToGUID_limit_synchronous_completion_(self, a2, (uint64_t)a3, a4, 0, a5);
}

- (id)_fetchMessagesUpToGUID:(id)a3 limit:(unint64_t)a4 synchronous:(BOOL)a5 completion:(id)a6
{
  BOOL v7 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a6;
  if (objc_msgSend__processSupportsHistory(self, v12, v13, v14))
  {
    kdebug_trace();
    v23[0] = MEMORY[0x1E4F143A8];
    v23[1] = 3221225472;
    v23[2] = sub_1A4BEB800;
    v23[3] = &unk_1E5B7D778;
    v23[4] = self;
    unint64_t v26 = a4;
    id v24 = v10;
    BOOL v27 = v7;
    id v25 = v11;
    uint64_t v16 = objc_msgSend__performQueryWithKey_loadImmediately_block_(self, v15, @"HistoryLoading", v7, v23);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = objc_msgSend_guid(self, v18, v19, v20);
        *(_DWORD *)buf = 138412546;
        id v29 = v10;
        __int16 v30 = 2112;
        uint64_t v31 = v21;
        _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Load messages up to GUID %@ for %@ rejected, client does not have history capability", buf, 0x16u);
      }
    }
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)loadMessagesBeforeAndAfterGUID:(id)a3 numberOfMessagesToLoadBeforeGUID:(unint64_t)a4 numberOfMessagesToLoadAfterGUID:(unint64_t)a5 loadImmediately:(BOOL)a6 threadIdentifier:(id)a7
{
  return (id)objc_msgSend__fetchMessagesBeforeAndAfterGUID_numberOfMessagesToLoadBeforeGUID_numberOfMessagesToLoadAfterGUID_threadIdentifier_synchronous_completion_(self, a2, (uint64_t)a3, a4, a5, a7, a6, &unk_1EF8E6648);
}

- (void)fetchMessagesBeforeAndAfterGUID:(id)a3 numberOfMessagesToLoadBeforeGUID:(unint64_t)a4 numberOfMessagesToLoadAfterGUID:(unint64_t)a5 threadIdentifier:(id)a6 completion:(id)a7
{
  id v7 = (id)objc_msgSend__fetchMessagesBeforeAndAfterGUID_numberOfMessagesToLoadBeforeGUID_numberOfMessagesToLoadAfterGUID_threadIdentifier_synchronous_completion_(self, a2, (uint64_t)a3, a4, a5, a6, 0, a7);
}

- (id)_fetchMessagesBeforeAndAfterGUID:(id)a3 numberOfMessagesToLoadBeforeGUID:(unint64_t)a4 numberOfMessagesToLoadAfterGUID:(unint64_t)a5 threadIdentifier:(id)a6 synchronous:(BOOL)a7 completion:(id)a8
{
  BOOL v9 = a7;
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a6;
  id v16 = a8;
  if ((objc_msgSend__processSupportsHistory(self, v17, v18, v19) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      int v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        uint64_t v32 = objc_msgSend_guid(self, v29, v30, v31);
        *(_DWORD *)buf = 138412290;
        id v44 = v32;
        _os_log_impl(&dword_1A4AF7000, v28, OS_LOG_TYPE_INFO, "Load messages for %@ rejected, client does not have history capability", buf, 0xCu);
      }
    }
    goto LABEL_18;
  }
  if (!objc_msgSend_length(v14, v20, v21, v22))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v33, OS_LOG_TYPE_INFO, "Trying to loadMessagesBeforeAndAfterGUID with a null messageGUID. Please call loadMessagesUpToGUID if a messageGUID is not specified, Returning early", buf, 2u);
      }
    }
LABEL_18:
    BOOL v27 = 0;
    goto LABEL_19;
  }
  id v23 = @"PagedInlineReplyHistoryLoading";
  if (!v15) {
    id v23 = @"PagedHistoryLoading";
  }
  id v24 = v23;
  if (IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v44 = v14;
      __int16 v45 = 2048;
      unint64_t v46 = a4;
      __int16 v47 = 2048;
      unint64_t v48 = a5;
      _os_log_impl(&dword_1A4AF7000, v25, OS_LOG_TYPE_INFO, "Begin loadMessagesBeforeAndAfterGUID: %@ numberOfMessagesBeforeGUID: %lu numberOfMessagesAfterGUID: %lu", buf, 0x20u);
    }
  }
  v35[0] = MEMORY[0x1E4F143A8];
  v35[1] = 3221225472;
  v35[2] = sub_1A4BEBBF8;
  v35[3] = &unk_1E5B7D7A0;
  unint64_t v40 = a4;
  unint64_t v41 = a5;
  id v36 = v14;
  uint64_t v37 = self;
  id v38 = v15;
  BOOL v42 = v9;
  id v39 = v16;
  BOOL v27 = objc_msgSend__performQueryWithKey_loadImmediately_block_completion_(self, v26, (uint64_t)v24, v9, v35, &unk_1EF8E6668);

LABEL_19:

  return v27;
}

- (void)fetchMessageHistoryForDateInterval:(id)a3 completion:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v11 = objc_msgSend_guid(self, v8, v9, v10);
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v6;
      __int16 v29 = 2112;
      uint64_t v30 = v11;
      _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Queueing fetchMessageHistoryForDateInterval: %@ chatGUIDs: %@", buf, 0x16u);
    }
  }
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1A4BEC084;
  v21[3] = &unk_1E5B7D810;
  id v22 = v6;
  id v23 = v11;
  id v24 = self;
  char v26 = 0;
  id v25 = v7;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  _DWORD v17[2] = sub_1A4BEC378;
  v17[3] = &unk_1E5B7D838;
  id v18 = v22;
  id v19 = v23;
  id v20 = v25;
  id v13 = v25;
  id v14 = v23;
  id v15 = v22;
  objc_msgSend__performQueryWithKey_loadImmediately_block_completion_(self, v16, @"MessageHistorySummaryLoading", 0, v21, v17);
}

- (void)fetchOldestMessageDateWithCompletion:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = objc_msgSend_guid(self, v5, v6, v7);
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v22 = v8;
      _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Queueing fetchOldestMessageDate chatGUID: %@", buf, 0xCu);
    }
  }
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  _DWORD v16[2] = sub_1A4BEC6CC;
  v16[3] = &unk_1E5B7D888;
  id v17 = v8;
  id v18 = self;
  char v20 = 0;
  id v19 = v4;
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1A4BEC9A0;
  v13[3] = &unk_1E5B7D8B0;
  id v14 = v17;
  id v15 = v19;
  id v10 = v19;
  id v11 = v17;
  objc_msgSend__performQueryWithKey_loadImmediately_block_completion_(self, v12, @"OldestMessageDateLoading", 0, v16, v13);
}

- (id)loadFrequentRepliesLimit:(unint64_t)a3 loadImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend__processSupportsHistory(self, a2, a3, a4))
  {
    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    _DWORD v15[2] = sub_1A4BECC64;
    v15[3] = &unk_1E5B7D8D8;
    v15[4] = self;
    v15[5] = a3;
    BOOL v16 = v4;
    id v8 = objc_msgSend__performQueryWithKey_loadImmediately_block_(self, v7, @"FrequentRepliesLoading", v4, v15);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v13 = objc_msgSend_guid(self, v10, v11, v12);
        *(_DWORD *)buf = 138412290;
        id v18 = v13;
        _os_log_impl(&dword_1A4AF7000, v9, OS_LOG_TYPE_INFO, "Load frequent replies for %@ rejected, client does not have history capability", buf, 0xCu);
      }
    }
    id v8 = 0;
  }

  return v8;
}

- (id)loadUnreadMessagesWithLimit:(unint64_t)a3 fallbackToMessagesUpToGUID:(id)a4
{
  return (id)MEMORY[0x1F4181798](self, sel_loadUnreadMessagesWithLimit_fallbackToMessagesUpToGUID_loadImmediately_, a3, a4);
}

- (id)loadUnreadMessagesWithLimit:(unint64_t)a3 fallbackToMessagesUpToGUID:(id)a4 loadImmediately:(BOOL)a5
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  if (objc_msgSend__processSupportsHistory(self, v9, v10, v11))
  {
    v20[0] = MEMORY[0x1E4F143A8];
    v20[1] = 3221225472;
    v20[2] = sub_1A4BECE94;
    v20[3] = &unk_1E5B7D900;
    v20[4] = self;
    unint64_t v22 = a3;
    id v21 = v8;
    BOOL v23 = a5;
    id v13 = objc_msgSend__performQueryWithKey_loadImmediately_block_(self, v12, @"UnreadLoading", 1, v20);
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v18 = objc_msgSend_guid(self, v15, v16, v17);
        *(_DWORD *)buf = 138412290;
        id v25 = v18;
        _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Load unread messages for %@ rejected, client does not have history capability", buf, 0xCu);
      }
    }
    id v13 = 0;
  }

  return v13;
}

- (void)_setAttachments:(id)a3
{
  if (self->_attachments != a3)
  {
    id v5 = (NSArray *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
    attachments = self->_attachments;
    self->_attachments = v5;
    MEMORY[0x1F41817F8](v5, attachments);
  }
}

- (void)_setCountOfMessagesMarkedAsSpam:(id)a3
{
  if (self->_countOfMessagesMarkedAsSpam != a3)
  {
    id v5 = (NSNumber *)objc_msgSend_copy(a3, a2, (uint64_t)a3, v3);
    countOfMessagesMarkedAsSpam = self->_countOfMessagesMarkedAsSpam;
    self->_countOfMessagesMarkedAsSpam = v5;
    MEMORY[0x1F41817F8](v5, countOfMessagesMarkedAsSpam);
  }
}

- (void)_setCountOfAttachmentsNotCachedLocally:(id)a3
{
  uint64_t isEqualToNumber = (uint64_t)a3;
  uint64_t v6 = isEqualToNumber;
  if (isEqualToNumber)
  {
    uint64_t v11 = (void *)isEqualToNumber;
    uint64_t isEqualToNumber = objc_msgSend_isEqualToNumber_(self->_countOfAttachmentsNotCachedLocally, (const char *)isEqualToNumber, isEqualToNumber, v5);
    uint64_t v6 = (uint64_t)v11;
    if ((isEqualToNumber & 1) == 0)
    {
      uint64_t v9 = (NSNumber *)objc_msgSend_copy(v11, (const char *)v11, v7, v8);
      countOfAttachmentsNotCachedLocally = self->_countOfAttachmentsNotCachedLocally;
      self->_countOfAttachmentsNotCachedLocally = v9;

      uint64_t v6 = (uint64_t)v11;
    }
  }

  MEMORY[0x1F41817F8](isEqualToNumber, v6);
}

- (void)_setIsDownloadingPurgedAssets:(BOOL)a3
{
  self->_isCurrentlyDownloadingPurgedAssets = a3;
}

- (void)loadAttachments:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = sub_1A4BED150;
  v10[3] = &unk_1E5B7D550;
  v10[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A4BED1C4;
  v8[3] = &unk_1E5B7D8B0;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v7 = (id)objc_msgSend__performQueryWithKey_loadImmediately_block_completion_(self, v6, @"LoadAttachmentsAsync", 0, v10, v8);
}

- (BOOL)isCurrentlyDownloadingPurgedAttachments
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1A4BED334;
  v5[3] = &unk_1E5B7D550;
  void v5[4] = self;
  id v3 = (id)objc_msgSend__performQueryWithKey_loadImmediately_block_(self, a2, @"IsCurrentlyDownloadingPurgedAttachments", 1, v5);
  return self->_isCurrentlyDownloadingPurgedAssets;
}

- (void)fetchIsCurrentlyDownloadingPurgedAttachments:(id)a3
{
  id v4 = a3;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  _DWORD v10[2] = sub_1A4BED494;
  v10[3] = &unk_1E5B7D550;
  v10[4] = self;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A4BED508;
  v8[3] = &unk_1E5B7D928;
  v8[4] = self;
  id v9 = v4;
  id v5 = v4;
  id v7 = (id)objc_msgSend__performQueryWithKey_loadImmediately_block_completion_(self, v6, @"IsCurrentlyDownloadingPurgedAttachments", 0, v10, v8);
}

- (void)deleteTransfers:(id)a3
{
  id v4 = a3;
  objc_msgSend_chatItems(self, v5, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__deleteTransfersWithGUIDs_fromChatItems_(self, v8, (uint64_t)v4, (uint64_t)v9);
}

- (void)deleteChatItemsWithTransferGUIDs:(id)a3 fromMessageItem:(id)a4
{
  v17[1] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  objc_msgSend__refreshContextWithAccountHandles(v6, v8, v9, v10);
  v17[0] = v6;
  uint64_t v12 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v11, (uint64_t)v17, 1);

  id v15 = objc_msgSend_chatItemsForItems_(self, v13, (uint64_t)v12, v14);

  objc_msgSend__deleteTransfersWithGUIDs_fromChatItems_(self, v16, (uint64_t)v7, (uint64_t)v15);
}

- (void)_deleteTransfersWithGUIDs:(id)a3 fromChatItems:(id)a4
{
  uint64_t v73 = self;
  uint64_t v98 = *MEMORY[0x1E4F143B8];
  id v74 = a3;
  id v5 = a4;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v95 = v74;
      __int16 v96 = 2112;
      id v97 = v5;
      _os_log_impl(&dword_1A4AF7000, v6, OS_LOG_TYPE_INFO, "Delete transfer guids: %@ from chatItems: %@", buf, 0x16u);
    }
  }
  id v7 = objc_alloc(MEMORY[0x1E4F1CA80]);
  uint64_t v10 = objc_msgSend_initWithArray_(v7, v8, (uint64_t)v74, v9);
  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v89 = 0u;
  long long v90 = 0u;
  long long v87 = 0u;
  long long v88 = 0u;
  id obj = v5;
  uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v12, (uint64_t)&v87, (uint64_t)v93, 16);
  if (v77)
  {
    uint64_t v76 = *(void *)v88;
    do
    {
      uint64_t v79 = 0;
      do
      {
        if (*(void *)v88 != v76) {
          objc_enumerationMutation(obj);
        }
        id v13 = *(void **)(*((void *)&v87 + 1) + 8 * v79);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            char v20 = objc_msgSend_aggregateAttachmentParts(v13, v14, v15, v16);
          }
          else
          {
            CFMutableDictionaryRef v92 = v13;
            id v21 = (void *)MEMORY[0x1E4F1C978];
            id v22 = v13;
            char v20 = objc_msgSend_arrayWithObjects_count_(v21, v23, (uint64_t)&v92, 1);
          }
          id v24 = objc_msgSend_array(MEMORY[0x1E4F1CA48], v17, v18, v19, v73);
          v84[0] = MEMORY[0x1E4F143A8];
          v84[1] = 3221225472;
          v84[2] = sub_1A4BEDB18;
          v84[3] = &unk_1E5B7D950;
          id v85 = v10;
          id v25 = v24;
          id v86 = v25;
          objc_msgSend_enumerateObjectsUsingBlock_(v20, v26, (uint64_t)v84, v27);
          uint64_t v31 = objc_msgSend_count(v20, v28, v29, v30);
          if (v31 == objc_msgSend_count(v25, v32, v33, v34)) {
            objc_msgSend_addObject_(v11, v35, (uint64_t)v13, v36);
          }
          else {
            objc_msgSend_addObjectsFromArray_(v11, v35, (uint64_t)v25, v36);
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v78 = objc_msgSend_visibleAssociatedMessageChatItems(v13, v37, v38, v39);
          if (objc_msgSend_count(v78, v40, v41, v42))
          {
            long long v82 = 0u;
            long long v83 = 0u;
            long long v80 = 0u;
            long long v81 = 0u;
            id v43 = v78;
            uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v44, (uint64_t)&v80, (uint64_t)v91, 16);
            if (v45)
            {
              uint64_t v46 = *(void *)v81;
              do
              {
                uint64_t v47 = 0;
                do
                {
                  if (*(void *)v81 != v46) {
                    objc_enumerationMutation(v43);
                  }
                  unint64_t v48 = *(void **)(*((void *)&v80 + 1) + 8 * v47);
                  objc_opt_class();
                  if (objc_opt_isKindOfClass())
                  {
                    id v50 = v48;
                    uint64_t v54 = objc_msgSend_transferGUID(v50, v51, v52, v53);
                    int v57 = objc_msgSend_containsObject_(v10, v55, (uint64_t)v54, v56);

                    if (v57)
                    {
                      uint64_t v61 = objc_msgSend_transferGUID(v50, v58, v59, v60);
                      objc_msgSend_removeObject_(v10, v62, (uint64_t)v61, v63);

                      objc_msgSend_addObject_(v11, v64, (uint64_t)v50, v65);
                    }
                  }
                  ++v47;
                }
                while (v45 != v47);
                uint64_t v45 = objc_msgSend_countByEnumeratingWithState_objects_count_(v43, v49, (uint64_t)&v80, (uint64_t)v91, 16);
              }
              while (v45);
            }
          }
        }
        ++v79;
      }
      while (v79 != v77);
      uint64_t v77 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v37, (uint64_t)&v87, (uint64_t)v93, 16);
    }
    while (v77);
  }

  uint64_t v69 = objc_msgSend_daemonController(v73, v66, v67, v68);
  objc_msgSend_fileTransfersRecoverablyDeleted_(v69, v70, (uint64_t)v10, v71);

  objc_msgSend_deleteChatItems_fromChatItems_(v73, v72, (uint64_t)v11, (uint64_t)obj);
}

- (void)watermarkInForScrutinyMode
{
  if ((sub_1A4C0AC10() & 1) == 0)
  {
    uint64_t v6 = objc_msgSend_scrutinyModeAttemptCount(self, v3, v4, v5);
    objc_msgSend__renderingDataDictionary(self, v7, v8, v9);
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v12 = objc_msgSend_numberWithUnsignedInteger_(NSNumber, v10, v6 + 1, v11);
    objc_msgSend_setObject_forKey_(v16, v13, (uint64_t)v12, @"acnt");

    objc_msgSend__setRenderingDataDictionary_(self, v14, (uint64_t)v16, v15);
  }
}

- (unint64_t)scrutinyModeAttemptCount
{
  CFMutableDictionaryRef Mutable = objc_msgSend__renderingDataDictionary(self, a2, v2, v3);
  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  id v7 = objc_msgSend_objectForKey_(Mutable, v4, @"acnt", v5);
  unint64_t v11 = objc_msgSend_unsignedIntegerValue(v7, v8, v9, v10);

  return v11;
}

- (BOOL)_serverBagPreventsScrutinyMode
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = objc_msgSend_sharedInstanceForBagType_(MEMORY[0x1E4F6B598], a2, 1, v2);
  uint64_t v6 = objc_msgSend_objectForKey_(v3, v4, @"disableScrutinyMode", v5);
  int v10 = objc_msgSend_BOOLValue(v6, v7, v8, v9);

  if (v10 && IMOSLoggingEnabled())
  {
    unint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      uint64_t v14 = @"YES";
      _os_log_impl(&dword_1A4AF7000, v11, OS_LOG_TYPE_INFO, "Server has disabled scrutiny mode %@", (uint8_t *)&v13, 0xCu);
    }
  }
  return v10;
}

- (BOOL)isInScrutinyMode
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  if (objc_msgSend__serverBagPreventsScrutinyMode(self, a2, v2, v3) & 1) != 0 || (sub_1A4C0AC10()) {
    return 0;
  }
  unint64_t v9 = objc_msgSend_scrutinyModeAttemptCount(self, v5, v6, v7);
  if ((v9 & 0xFFFFFFFFFFFFFFFELL) != 2)
  {
    if (v9 >= 4) {
      objc_msgSend_clearScrutinyMode(self, v10, v11, v12);
    }
    return 0;
  }
  if (IMOSLoggingEnabled())
  {
    int v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v17 = objc_msgSend_chatIdentifier(self, v14, v15, v16);
      int v18 = 138412546;
      uint64_t v19 = v17;
      __int16 v20 = 2112;
      id v21 = @"YES";
      _os_log_impl(&dword_1A4AF7000, v13, OS_LOG_TYPE_INFO, "isInScrutinyModeForAttemptCount chat %@ result %@", (uint8_t *)&v18, 0x16u);
    }
  }
  return 1;
}

- (void)watermarkOutForScrutinyMode
{
  if ((sub_1A4C0AC10() & 1) == 0)
  {
    objc_msgSend__renderingDataDictionary(self, v3, v4, v5);
    id v9 = (id)objc_claimAutoreleasedReturnValue();
    objc_msgSend_setObject_forKey_(v9, v6, (uint64_t)&unk_1EF914500, @"acnt");
    objc_msgSend__setRenderingDataDictionary_(self, v7, (uint64_t)v9, v8);
  }
}

+ (void)storeGUIDInAttemptingListInScrutinyMode:(id)a3
{
}

+ (void)removeGUIDInAttemptingListInScrutinyMode:(id)a3
{
}

- (void)clearScrutinyMode
{
  objc_msgSend__setRenderingDataDictionary_(self, a2, 0, v2);
  objc_msgSend_chatScrutinyController(self, v4, v5, v6);
  id v8 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_setTranscriptRenderingMetadata_forChatIdentifier_(v8, v7, 0, 0);
}

- (void)reasonTrackingUpdater:(id)a3 needsUpdateForReasons:(id)a4 followingHoldForReason:(id)a5
{
}

- (NSArray)chatItems
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  chatItemRules = self->_chatItemRules;
  if (!chatItemRules)
  {
    uint64_t v6 = objc_msgSend_IMCoreSetupTimingCollection(MEMORY[0x1E4F6C3F8], a2, v2, v3);
    objc_msgSend_startTimingForKey_(v6, v7, @"IMCoreSetup: Generate chat items", v8);
    id v12 = objc_alloc((Class)objc_msgSend_chatItemRulesClass(IMChat, v9, v10, v11));
    uint64_t v15 = (IMChatItemRules *)objc_msgSend__initWithChat_(v12, v13, (uint64_t)self, v14);
    uint64_t v16 = self->_chatItemRules;
    self->_chatItemRules = v15;

    __int16 v20 = objc_msgSend__items(self, v17, v18, v19);
    id v21 = self->_chatItemRules;
    id v25 = objc_msgSend__chatItems(v21, v22, v23, v24);
    _IMChatItemsReplaceWithChatItemsForItems(v25, v21, v20);
    objc_msgSend__didProcessChatItems_(v21, v26, (uint64_t)v25, v27);
    if (IMOSLoggingEnabled())
    {
      uint64_t v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        uint64_t v34 = NSNumber;
        uint64_t v35 = objc_msgSend_count(v25, v31, v32, v33);
        uint64_t v38 = objc_msgSend_numberWithUnsignedInteger_(v34, v36, v35, v37);
        int v41 = 136315394;
        uint64_t v42 = "-[IMChat(IMChatItem) chatItems]";
        __int16 v43 = 2112;
        id v44 = v38;
        _os_log_impl(&dword_1A4AF7000, v30, OS_LOG_TYPE_INFO, "%s Configuring chatItemRules and chatItems, count: %@", (uint8_t *)&v41, 0x16u);
      }
    }
    objc_msgSend_stopTimingForKey_(v6, v28, @"IMCoreSetup: Generate chat items", v29);

    chatItemRules = self->_chatItemRules;
  }
  uint64_t v39 = objc_msgSend__chatItems(chatItemRules, a2, v2, v3);

  return (NSArray *)v39;
}

- (void)cleanupChatItems
{
  self->_chatItemRules = 0;
  MEMORY[0x1F41817F8]();
}

- (BOOL)wantsSenderBlackholeWarning
{
  if (self)
  {
    unint64_t senderBlackholeWarningStatus = self->_senderBlackholeWarningStatus;
    if (senderBlackholeWarningStatus) {
      return senderBlackholeWarningStatus == 2;
    }
  }
  if (objc_msgSend_receivedResponseForChat(self, a2, v2, v3))
  {
    unint64_t senderBlackholeWarningStatus = 1;
  }
  else
  {
    id v9 = objc_msgSend_lastAddressedHandleID(self, v6, v7, v8);
    int v13 = v9;
    if (!v9 || !objc_msgSend_length(v9, v10, v11, v12))
    {
      uint64_t v14 = objc_msgSend_account(self, v10, v11, v12);
      uint64_t v18 = objc_msgSend_strippedLogin(v14, v15, v16, v17);

      int v13 = (void *)v18;
    }
    uint64_t v19 = objc_msgSend_recipient(self, v10, v11, v12);
    uint64_t v23 = objc_msgSend_ID(v19, v20, v21, v22);

    LODWORD(v19) = objc_msgSend_shouldShowSMSWarningForSender_forRecipient_withConversationHistory_(MEMORY[0x1E4F6EA38], v24, (uint64_t)v13, (uint64_t)v23, 0);
    unint64_t senderBlackholeWarningStatus = 1;
    if (v19) {
      unint64_t senderBlackholeWarningStatus = 2;
    }
  }
  if (self)
  {
    self->_unint64_t senderBlackholeWarningStatus = senderBlackholeWarningStatus;
    return senderBlackholeWarningStatus == 2;
  }
  return 0;
}

- (void)beginHoldingChatItemsUpdatesForReason:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v9 = objc_msgSend_guid(self, v6, v7, v8);
    int v12 = 138412546;
    int v13 = v9;
    __int16 v14 = 2114;
    id v15 = v4;
    _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Chat %@ will hold chat item updates for reason: %{public}@", (uint8_t *)&v12, 0x16u);
  }
  objc_msgSend_beginHoldingUpdatesForReason_(self->_chatItemsUpdater, v10, (uint64_t)v4, v11);
}

- (void)endHoldingChatItemsUpdatesForReason:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
  {
    id v9 = objc_msgSend_guid(self, v6, v7, v8);
    int v21 = 138412546;
    uint64_t v22 = v9;
    __int16 v23 = 2114;
    uint64_t v24 = (uint64_t)v4;
    _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Chat %@ will end holding chat item updates for reason: %{public}@", (uint8_t *)&v21, 0x16u);
  }
  objc_msgSend_endHoldingUpdatesForReason_updateTriggeredIfNotHeldShouldBeDeferred_(self->_chatItemsUpdater, v10, (uint64_t)v4, 1);
  uint64_t active = objc_msgSend_activeUpdaterHoldsCount(self->_chatItemsUpdater, v11, v12, v13);
  id v15 = IMLogHandleForCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
  {
    uint64_t v19 = objc_msgSend_guid(self, v16, v17, v18);
    chatItemsUpdater = self->_chatItemsUpdater;
    int v21 = 138412802;
    uint64_t v22 = v19;
    __int16 v23 = 2050;
    uint64_t v24 = active;
    __int16 v25 = 2112;
    uint64_t v26 = chatItemsUpdater;
    _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "--> Chat %@ has %{public}ld remaining holds: %@", (uint8_t *)&v21, 0x20u);
  }
}

- (void)endAllHoldsOnChatItemsUpdatesForReason:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (objc_msgSend_isHoldingUpdatesForReason_(self->_chatItemsUpdater, v5, (uint64_t)v4, v6))
  {
    uint64_t v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = objc_msgSend_guid(self, v8, v9, v10);
      int v23 = 138412546;
      uint64_t v24 = v11;
      __int16 v25 = 2114;
      uint64_t v26 = (uint64_t)v4;
      _os_log_impl(&dword_1A4AF7000, v7, OS_LOG_TYPE_INFO, "Chat %@ is ending holds on updates for reason: %{public}@", (uint8_t *)&v23, 0x16u);
    }
    uint64_t active = objc_msgSend_activeUpdaterHoldsCount(self->_chatItemsUpdater, v12, v13, v14);
    uint64_t v16 = IMLogHandleForCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      __int16 v20 = objc_msgSend_guid(self, v17, v18, v19);
      chatItemsUpdater = self->_chatItemsUpdater;
      int v23 = 138412802;
      uint64_t v24 = v20;
      __int16 v25 = 2050;
      uint64_t v26 = active;
      __int16 v27 = 2112;
      id v28 = chatItemsUpdater;
      _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "--> Chat %@ has %{public}ld remaining holds: %@", (uint8_t *)&v23, 0x20u);
    }
    objc_msgSend_endAllHoldsOnUpdatesForReason_updateTriggeredIfNotHeldShouldBeDeferred_(self->_chatItemsUpdater, v22, (uint64_t)v4, 1);
  }
}

- (BOOL)isHoldingChatItemsUpdatesForReason:(id)a3
{
  return objc_msgSend_isHoldingUpdatesForReason_(self->_chatItemsUpdater, a2, (uint64_t)a3, v3);
}

- (void)endHoldingChatItemsUpdatesForAllReasons
{
  if (objc_msgSend_isHoldingUpdates(self->_chatItemsUpdater, a2, v2, v3))
  {
    IMLogHandleForCategory();
    uint64_t v5 = (char *)objc_claimAutoreleasedReturnValue();
    if (os_log_type_enabled((os_log_t)v5, OS_LOG_TYPE_ERROR)) {
      sub_1A4CB8E10(self, v5, v6, v7);
    }

    objc_msgSend_endHoldingUpdatesForAllReasonsWithPotentialUpdateDeferred_(self->_chatItemsUpdater, v8, 1, v9);
  }
}

- (void)updateChatItemsSynchronouslyIfAsyncUpdateIsPending
{
}

- (void)_updateChatItemsWithReason:(id)a3 block:(id)a4
{
}

- (void)_updateChatItemsWithReason:(id)a3 block:(id)a4 shouldPost:(BOOL)a5
{
  BOOL v252 = a5;
  uint64_t v277 = *MEMORY[0x1E4F143B8];
  id v257 = a3;
  uint64_t v259 = (void (**)(void))a4;
  uint64_t v6 = MEMORY[0x1E4F14428];
  id v7 = MEMORY[0x1E4F14428];
  dispatch_assert_queue_V2(v6);

  uint64_t v8 = IMLogHandleForCategory();
  os_signpost_id_t v9 = os_signpost_id_generate(v8);
  uint64_t v10 = v8;
  uint64_t v11 = v10;
  os_signpost_id_t spid = v9;
  unint64_t v253 = v9 - 1;
  if (v9 - 1 > 0xFFFFFFFFFFFFFFFDLL)
  {

    uint64_t v13 = v11;
  }
  else
  {
    if (os_signpost_enabled(v10))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4AF7000, v11, OS_SIGNPOST_INTERVAL_BEGIN, v9, "updateChatItemsWithReason_all", "", buf, 2u);
    }

    uint64_t v12 = v11;
    if (os_signpost_enabled(v12))
    {
      *(_WORD *)buf = 0;
      _os_signpost_emit_with_name_impl(&dword_1A4AF7000, v12, OS_SIGNPOST_INTERVAL_BEGIN, v9, "updateChatItemsWithReason_beforePosting", "", buf, 2u);
    }
  }
  uint64_t v256 = v11;

  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      objc_msgSend_guid(self, v18, v19, v20);
      int v21 = (IMChat *)objc_claimAutoreleasedReturnValue();
      *(_DWORD *)buf = 138412546;
      int v274 = v21;
      __int16 v275 = 2112;
      id v276 = v257;
      _os_log_impl(&dword_1A4AF7000, v17, OS_LOG_TYPE_INFO, "Update chat items (chatGUID: %@), reason: %@", buf, 0x16u);
    }
  }
  uint64_t v22 = objc_msgSend_stateCaptureRecents(IMChat, v14, v15, v16);
  objc_msgSend_promoteRecentObject_(v22, v23, (uint64_t)self, v24);

  objc_msgSend__validateChatRegistrationWithRegistry(self, v25, v26, v27);
  id v28 = self;
  v261 = self->_chatItemRules;
  if (!v261)
  {
    if ((objc_msgSend__isBlackHoled(self, v29, v30, v31) & 1) != 0 || !IMIsRunningInMessagesUIProcess())
    {
      v261 = 0;
    }
    else
    {
      id v35 = objc_alloc((Class)objc_msgSend_chatItemRulesClass(IMChat, v32, v33, v34));
      uint64_t v38 = (IMChatItemRules *)objc_msgSend__initWithChat_(v35, v36, (uint64_t)self, v37);
      chatItemRules = self->_chatItemRules;
      self->_chatItemRules = v38;

      v261 = self->_chatItemRules;
    }
    id v28 = self;
  }
  if (v28->_isUpdatingChatItems)
  {
    if (IMOSLoggingEnabled())
    {
      unint64_t v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v40, OS_LOG_TYPE_INFO, "Update already in progress, executing update block", buf, 2u);
      }
    }
    v259[2]();
    goto LABEL_116;
  }
  p_isUpdatingChatItems = &v28->_isUpdatingChatItems;
  v28->_isUpdatingChatItems = 1;
  v259[2]();
  uint64_t v45 = objc_msgSend_inlineReplyController(self, v42, v43, v44);
  objc_msgSend_updateChatItemsIfNeeded(v45, v46, v47, v48);

  objc_msgSend_cancelAllPendingDeferredUpdates(self->_chatItemsUpdater, v49, v50, v51);
  BOOL *p_isUpdatingChatItems = 0;
  if (v261)
  {
    v250 = objc_msgSend__items(self, v52, v53, v54);
    if (IMOSLoggingEnabled())
    {
      uint64_t v58 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
      {
        uint64_t v62 = NSNumber;
        uint64_t v63 = objc_msgSend_count(v250, v59, v60, v61);
        objc_msgSend_numberWithUnsignedInteger_(v62, v64, v63, v65);
        uint64_t v66 = (IMChat *)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        int v274 = v66;
        _os_log_impl(&dword_1A4AF7000, v58, OS_LOG_TYPE_INFO, "\tIMItem count = %@", buf, 0xCu);
      }
    }
    uint64_t v67 = objc_msgSend__chatItems(v261, v55, v56, v57);
    uint64_t v71 = objc_msgSend_copy(v67, v68, v69, v70);
    _IMChatItemsReplaceWithChatItemsForItems(v67, v261, v250);
    objc_msgSend__didProcessChatItems_(v261, v72, (uint64_t)v67, v73);
    if (v71)
    {
      id v77 = v71;
    }
    else
    {
      objc_msgSend_array(MEMORY[0x1E4F1CA48], v74, v75, v76);
      id v77 = (id)objc_claimAutoreleasedReturnValue();
    }
    uint64_t v262 = v77;

    if (v67)
    {
      id v84 = v67;
    }
    else
    {
      objc_msgSend_array(MEMORY[0x1E4F1CA48], v81, v82, v83);
      id v84 = (id)objc_claimAutoreleasedReturnValue();
    }
    id v85 = v84;

    v249 = objc_msgSend_differenceFromArray_(v85, v86, (uint64_t)v262, v87);
    id v270 = 0;
    id v271 = 0;
    IMIndexesFromOrderedCollectionDifference(v249, &v271, &v270);
    v254 = (IMChat *)v271;
    v251 = (IMChat *)v270;
    uint64_t v248 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v88, v89, v90);
    if (objc_msgSend_count(v254, v91, v92, v93))
    {
      v268[0] = MEMORY[0x1E4F143A8];
      v268[1] = 3221225472;
      v268[2] = sub_1A4BEFA78;
      v268[3] = &unk_1E5B7D978;
      id v269 = v248;
      objc_msgSend_enumerateObjectsAtIndexes_options_usingBlock_(v85, v97, (uint64_t)v254, 0, v268);
    }
    objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v94, v95, v96);
    v258 = (IMChat *)objc_claimAutoreleasedReturnValue();
    objc_msgSend_indexSet(MEMORY[0x1E4F28E60], v98, v99, v100);
    int v260 = (IMChat *)objc_claimAutoreleasedReturnValue();
    id v101 = objc_alloc(MEMORY[0x1E4F28E60]);
    uint64_t v105 = objc_msgSend_count(v262, v102, v103, v104);
    uint64_t v107 = objc_msgSend_initWithIndexesInRange_(v101, v106, 0, v105);
    id v108 = objc_alloc(MEMORY[0x1E4F28E60]);
    uint64_t v112 = objc_msgSend_count(v85, v109, v110, v111);
    id v114 = objc_msgSend_initWithIndexesInRange_(v108, v113, 0, v112);
    objc_msgSend_removeIndexes_(v107, v115, (uint64_t)v251, v116);
    objc_msgSend_removeIndexes_(v114, v117, (uint64_t)v254, v118);
    uint64_t Index = objc_msgSend_firstIndex(v107, v119, v120, v121);
    uint64_t v126 = objc_msgSend_firstIndex(v114, v123, v124, v125);
    if (Index != 0x7FFFFFFFFFFFFFFFLL)
    {
      uint64_t v129 = v126;
      if (v126 != 0x7FFFFFFFFFFFFFFFLL)
      {
        do
        {
          uint64_t v130 = objc_msgSend_objectAtIndex_(v262, v127, Index, v128);
          uint64_t v135 = objc_msgSend_objectAtIndex_(v85, v131, v129, v132);
          if (v130 != v135)
          {
            objc_msgSend_addIndex_(v260, v133, v129, v134);
            uint64_t v139 = objc_msgSend__timeAdded(v130, v136, v137, v138);
            objc_msgSend__setTimeAdded_(v135, v140, (uint64_t)v139, v141);
          }
          if (objc_msgSend__shouldReloadChatItem_oldChatItem_(self->_chatItemRules, v133, (uint64_t)v135, (uint64_t)v130))objc_msgSend_addIndex_(v258, v142, v129, v143); {
          uint64_t Index = objc_msgSend_indexGreaterThanIndex_(v107, v142, Index, v143);
          }
          uint64_t v129 = objc_msgSend_indexGreaterThanIndex_(v114, v144, v129, v145);
        }
        while (Index != 0x7FFFFFFFFFFFFFFFLL && v129 != 0x7FFFFFFFFFFFFFFFLL);
      }
    }

    long long v266 = 0u;
    long long v267 = 0u;
    long long v264 = 0u;
    long long v265 = 0u;
    id v146 = v85;
    uint64_t v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(v146, v147, (uint64_t)&v264, (uint64_t)v272, 16);
    if (v151)
    {
      uint64_t v152 = 0;
      uint64_t v153 = *(void *)v265;
      do
      {
        for (uint64_t i = 0; i != v151; ++i)
        {
          if (*(void *)v265 != v153) {
            objc_enumerationMutation(v146);
          }
          __int16 v155 = objc_msgSend__timeStale(*(void **)(*((void *)&v264 + 1) + 8 * i), v148, v149, v150);
          long long v158 = v155;
          if (v155)
          {
            uint64_t v159 = objc_msgSend_earlierDate_(v155, v156, (uint64_t)v152, v157);
            BOOL v160 = v159 == v158;

            if (v160)
            {
              int v161 = v158;

              uint64_t v152 = v161;
            }
          }
        }
        uint64_t v151 = objc_msgSend_countByEnumeratingWithState_objects_count_(v146, v148, (uint64_t)&v264, (uint64_t)v272, 16);
      }
      while (v151);

      if (v152)
      {
        __int16 v165 = objc_msgSend__nextStaleTime(v261, v162, v163, v164);
        char isEqualToDate = objc_msgSend_isEqualToDate_(v152, v166, (uint64_t)v165, v167);

        if ((isEqualToDate & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            long long v171 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v171, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              int v274 = v152;
              _os_log_impl(&dword_1A4AF7000, v171, OS_LOG_TYPE_INFO, "\tSchedule _replaceStaleChatItems for nextStaleTime:%@", buf, 0xCu);
            }
          }
          objc_msgSend__setNextStaleTime_(v261, v169, (uint64_t)v152, v170);
          objc_msgSend_timeIntervalSinceReferenceDate(v152, v172, v173, v174);
          double v176 = v175;
          objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v177, v178, v179);
          double v184 = v176 - v183;
          double v185 = 0.0;
          if (v184 > 0.0)
          {
            objc_msgSend_timeIntervalSinceReferenceDate(v152, v180, v181, v182);
            double v187 = v186;
            objc_msgSend_timeIntervalSinceReferenceDate(MEMORY[0x1E4F1C9C8], v188, v189, v190);
            double v185 = v187 - v191;
          }
          objc_msgSend_cancelPreviousPerformRequestsWithTarget_selector_object_(MEMORY[0x1E4FBA8A8], v180, (uint64_t)self, (uint64_t)sel__replaceStaleChatItems, 0);
          objc_msgSend_performSelector_withObject_afterDelay_(self, v192, (uint64_t)sel__replaceStaleChatItems, 0, v185);
        }
      }
    }
    else
    {

      uint64_t v152 = 0;
    }
    if (objc_msgSend_count(v251, v162, v163, v164)
      || objc_msgSend_count(v254, v193, v194, v195)
      || objc_msgSend_count(v258, v196, v197, v198)
      || objc_msgSend_count(v260, v199, v200, v201))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v205 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v205, OS_LOG_TYPE_INFO))
        {
          uint64_t v209 = objc_msgSend_guid(self, v206, v207, v208);
          *(_DWORD *)buf = 138412546;
          int v274 = self;
          __int16 v275 = 2112;
          id v276 = v209;
          _os_log_impl(&dword_1A4AF7000, v205, OS_LOG_TYPE_INFO, "\tchat: %@, guid: %@", buf, 0x16u);
        }
      }
      if (objc_msgSend_count(v254, v202, v203, v204) && IMOSLoggingEnabled())
      {
        uint64_t v213 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v213, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          int v274 = v254;
          _os_log_impl(&dword_1A4AF7000, v213, OS_LOG_TYPE_INFO, "\tinserted: %@", buf, 0xCu);
        }
      }
      if (objc_msgSend_count(v251, v210, v211, v212) && IMOSLoggingEnabled())
      {
        uint64_t v217 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v217, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          int v274 = v251;
          _os_log_impl(&dword_1A4AF7000, v217, OS_LOG_TYPE_INFO, "\tremoved: %@", buf, 0xCu);
        }
      }
      if (objc_msgSend_count(v258, v214, v215, v216) && IMOSLoggingEnabled())
      {
        uint64_t v221 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v221, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          int v274 = v258;
          _os_log_impl(&dword_1A4AF7000, v221, OS_LOG_TYPE_INFO, "\treload: %@", buf, 0xCu);
        }
      }
      if (objc_msgSend_count(v260, v218, v219, v220) && IMOSLoggingEnabled())
      {
        uint64_t v222 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v222, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          int v274 = v260;
          _os_log_impl(&dword_1A4AF7000, v222, OS_LOG_TYPE_INFO, "\tregenerate: %@", buf, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v223 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v223, OS_LOG_TYPE_INFO))
        {
          v227 = NSNumber;
          uint64_t v228 = objc_msgSend_count(v262, v224, v225, v226);
          objc_msgSend_numberWithUnsignedInteger_(v227, v229, v228, v230);
          uint64_t v231 = (IMChat *)objc_claimAutoreleasedReturnValue();
          v232 = NSNumber;
          uint64_t v236 = objc_msgSend_count(v146, v233, v234, v235);
          uint64_t v239 = objc_msgSend_numberWithUnsignedInteger_(v232, v237, v236, v238);
          *(_DWORD *)buf = 138412546;
          int v274 = v231;
          __int16 v275 = 2112;
          id v276 = v239;
          _os_log_impl(&dword_1A4AF7000, v223, OS_LOG_TYPE_INFO, "\toldChatItems: %@, newChatItems: %@", buf, 0x16u);
        }
      }
      v240 = v256;
      uint64_t v241 = v240;
      if (v253 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v240))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4AF7000, v241, OS_SIGNPOST_INTERVAL_END, spid, "updateChatItemsWithReason_beforePosting", "", buf, 2u);
      }

      objc_msgSend__recalculateIsInterworking(self, v242, v243, v244);
      if (v252) {
        objc_msgSend__postIMChatItemsDidChangeNotificationWithInserted_removed_reload_regenerate_oldChatItems_newChatItems_(self, v245, (uint64_t)v254, (uint64_t)v251, v258, v260, v262, v146);
      }
      v246 = v241;
      uint64_t v247 = v246;
      if (v253 <= 0xFFFFFFFFFFFFFFFDLL && os_signpost_enabled(v246))
      {
        *(_WORD *)buf = 0;
        _os_signpost_emit_with_name_impl(&dword_1A4AF7000, v247, OS_SIGNPOST_INTERVAL_END, spid, "updateChatItemsWithReason_all", "", buf, 2u);
      }
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_115;
      }
      uint64_t v247 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v247, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v247, OS_LOG_TYPE_INFO, "\tDon't post update, no significant updates to chatItems.", buf, 2u);
      }
    }

LABEL_115:
    goto LABEL_116;
  }
  if (IMOSLoggingEnabled())
  {
    long long v78 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v78, OS_LOG_TYPE_INFO, "ChatItem Rules undefined", buf, 2u);
    }
  }
  if (v252)
  {
    if (IMOSLoggingEnabled())
    {
      long long v80 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v80, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1A4AF7000, v80, OS_LOG_TYPE_INFO, "Posting nil update for compatiblity.", buf, 2u);
      }
    }
    objc_msgSend__postIMChatItemsDidChangeNotificationWithInserted_removed_reload_regenerate_oldChatItems_newChatItems_(self, v79, 0, 0, 0, 0, 0, 0);
  }
LABEL_116:
}

- (void)_replaceStaleChatItems
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1A4AF7000, v3, OS_LOG_TYPE_INFO, "(IMChat) _replaceStaleChatItems", buf, 2u);
    }
  }
  id v51 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id v7 = objc_msgSend_chatItems(self, v4, v5, v6);
  os_signpost_id_t v9 = 0;
  uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v8, (uint64_t)&v56, (uint64_t)v62, 16);
  if (v13)
  {
    uint64_t v14 = *(void *)v57;
    do
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v57 != v14) {
          objc_enumerationMutation(v7);
        }
        uint64_t v16 = *(void **)(*((void *)&v56 + 1) + 8 * i);
        uint64_t v20 = objc_msgSend__timeStale(v16, v10, v11, v12);
        if (v20)
        {
          int v21 = objc_msgSend_date(MEMORY[0x1E4F1C9C8], v17, v18, v19);
          objc_msgSend_timeIntervalSinceReferenceDate(v21, v22, v23, v24);
          double v26 = v25;
          objc_msgSend_timeIntervalSinceReferenceDate(v20, v27, v28, v29);
          BOOL v31 = v26 < v30;

          if (!v31)
          {
            id v35 = objc_msgSend__item(v16, v32, v33, v34);
            if (v9 == v35)
            {
              id v36 = v9;
            }
            else
            {
              id v36 = v35;

              os_signpost_id_t v9 = objc_msgSend__copy(v36, v37, v38, v39);
              objc_msgSend_addObject_(v51, v40, (uint64_t)v9, v41);
            }

            os_signpost_id_t v9 = v36;
          }
        }
      }
      uint64_t v13 = objc_msgSend_countByEnumeratingWithState_objects_count_(v7, v10, (uint64_t)&v56, (uint64_t)v62, 16);
    }
    while (v13);
  }

  long long v54 = 0u;
  long long v55 = 0u;
  long long v52 = 0u;
  long long v53 = 0u;
  id v42 = v51;
  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v43, (uint64_t)&v52, (uint64_t)v61, 16);
  if (v46)
  {
    uint64_t v47 = *(void *)v53;
    do
    {
      for (uint64_t j = 0; j != v46; ++j)
      {
        if (*(void *)v53 != v47) {
          objc_enumerationMutation(v42);
        }
        objc_msgSend__handleItem_(self, v44, *(void *)(*((void *)&v52 + 1) + 8 * j), v45);
      }
      uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v42, v44, (uint64_t)&v52, (uint64_t)v61, 16);
    }
    while (v46);
  }

  objc_msgSend__setNextStaleTime_(self->_chatItemRules, v49, 0, v50);
}

- (id)_getDeleteChatItemMap:(id)a3
{
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F6C380]);
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  id obj = v3;
  uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v5, (uint64_t)&v53, (uint64_t)v60, 16);
  if (v48)
  {
    uint64_t v47 = *(void *)v54;
    *(void *)&long long v9 = 138412290;
    long long v44 = v9;
    do
    {
      for (uint64_t i = 0; i != v48; ++i)
      {
        if (*(void *)v54 != v47) {
          objc_enumerationMutation(obj);
        }
        uint64_t v11 = *(void **)(*((void *)&v53 + 1) + 8 * i);
        if (objc_msgSend_canDelete(v11, v6, v7, v8, v44))
        {
          uint64_t v15 = objc_msgSend__item(v11, v12, v13, v14);
          uint64_t v19 = objc_msgSend_guid(v15, v16, v17, v18);

          objc_msgSend_pushObject_forKey_(v4, v20, (uint64_t)v11, (uint64_t)v19);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            uint64_t v46 = objc_msgSend_visibleAssociatedMessageChatItems(v11, v21, v22, v23);
            if (objc_msgSend_count(v46, v24, v25, v26))
            {
              long long v51 = 0u;
              long long v52 = 0u;
              long long v49 = 0u;
              long long v50 = 0u;
              id v27 = v46;
              uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v49, (uint64_t)v59, 16);
              if (v32)
              {
                uint64_t v33 = *(void *)v50;
                do
                {
                  for (uint64_t j = 0; j != v32; ++j)
                  {
                    if (*(void *)v50 != v33) {
                      objc_enumerationMutation(v27);
                    }
                    id v35 = *(void **)(*((void *)&v49 + 1) + 8 * j);
                    if (objc_msgSend_canDelete(v35, v29, v30, v31))
                    {
                      id v36 = objc_msgSend__item(v35, v29, v30, v31);
                      unint64_t v40 = objc_msgSend_guid(v36, v37, v38, v39);

                      objc_msgSend_pushObject_forKey_(v4, v41, (uint64_t)v35, (uint64_t)v40);
                    }
                  }
                  uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v49, (uint64_t)v59, 16);
                }
                while (v32);
              }
            }
          }
        }
        else if (IMOSLoggingEnabled())
        {
          id v42 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v44;
            long long v58 = v11;
            _os_log_impl(&dword_1A4AF7000, v42, OS_LOG_TYPE_INFO, "Request to delete chatItem %@ which can't be deleted", buf, 0xCu);
          }
        }
      }
      uint64_t v48 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v6, (uint64_t)&v53, (uint64_t)v60, 16);
    }
    while (v48);
  }

  return v4;
}

- (id)_getMessageChatItemMap:(id)a3 withDeleteMap:(id)a4 andAllChatItems:(id)a5
{
  uint64_t v66 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a5;
  id v8 = objc_alloc_init(MEMORY[0x1E4F6C380]);
  long long v60 = 0u;
  long long v61 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = v7;
  uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v60, (uint64_t)v65, 16);
  if (v55)
  {
    uint64_t v13 = *(void *)v61;
    uint64_t v52 = *(void *)v61;
    do
    {
      for (uint64_t i = 0; i != v55; ++i)
      {
        if (*(void *)v61 != v13) {
          objc_enumerationMutation(obj);
        }
        uint64_t v15 = *(void **)(*((void *)&v60 + 1) + 8 * i);
        if (objc_msgSend_canDelete(v15, v10, v11, v12, v52))
        {
          uint64_t v19 = objc_msgSend__parentItem(v15, v16, v17, v18);
          uint64_t v23 = objc_msgSend_guid(v19, v20, v21, v22);

          uint64_t v26 = objc_msgSend_peekObjectForKey_(v6, v24, (uint64_t)v23, v25);

          if (v26) {
            objc_msgSend_pushObject_forKey_(v8, v27, (uint64_t)v15, (uint64_t)v23);
          }
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          uint64_t v28 = objc_msgSend_visibleAssociatedMessageChatItems(v15, v10, v11, v12);
          if (objc_msgSend_count(v28, v29, v30, v31))
          {
            long long v58 = 0u;
            long long v59 = 0u;
            long long v56 = 0u;
            long long v57 = 0u;
            long long v54 = v28;
            id v32 = v28;
            uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v33, (uint64_t)&v56, (uint64_t)v64, 16);
            if (v34)
            {
              uint64_t v38 = v34;
              uint64_t v39 = *(void *)v57;
              do
              {
                for (uint64_t j = 0; j != v38; ++j)
                {
                  if (*(void *)v57 != v39) {
                    objc_enumerationMutation(v32);
                  }
                  uint64_t v41 = *(void **)(*((void *)&v56 + 1) + 8 * j);
                  if (objc_msgSend_canDelete(v41, v35, v36, v37))
                  {
                    id v42 = objc_msgSend__parentItem(v41, v35, v36, v37);
                    uint64_t v46 = objc_msgSend_guid(v42, v43, v44, v45);

                    long long v49 = objc_msgSend_peekObjectForKey_(v6, v47, (uint64_t)v46, v48);

                    if (v49) {
                      objc_msgSend_pushObject_forKey_(v8, v50, (uint64_t)v41, (uint64_t)v46);
                    }
                  }
                }
                uint64_t v38 = objc_msgSend_countByEnumeratingWithState_objects_count_(v32, v35, (uint64_t)&v56, (uint64_t)v64, 16);
              }
              while (v38);
            }

            uint64_t v13 = v52;
            uint64_t v28 = v54;
          }
        }
      }
      uint64_t v55 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v10, (uint64_t)&v60, (uint64_t)v65, 16);
    }
    while (v55);
  }

  return v8;
}

- (void)deleteChatItems:(id)a3
{
  id v4 = a3;
  objc_msgSend_chatItems(self, v5, v6, v7);
  id v9 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_deleteChatItems_fromChatItems_(self, v8, (uint64_t)v4, (uint64_t)v9);
}

- (void)deleteChatItems:(id)a3 fromChatItems:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134217984;
      uint64_t v19 = objc_msgSend_count(v6, v9, v10, v11);
      _os_log_impl(&dword_1A4AF7000, v8, OS_LOG_TYPE_INFO, "Processing %lu chat items for deletion", buf, 0xCu);
    }
  }
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  _DWORD v15[2] = sub_1A4BF0510;
  v15[3] = &unk_1E5B7BE70;
  v15[4] = self;
  id v16 = v6;
  id v17 = v7;
  id v12 = v7;
  id v13 = v6;
  objc_msgSend__updateChatItemsWithReason_block_(self, v14, @"(IMChat) Delete chat items", (uint64_t)v15);
}

- (void)deleteIMMessageItems:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_1A4AF7000, v5, OS_LOG_TYPE_INFO, "Delete message items: %@", buf, 0xCu);
    }
  }
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1A4BF1218;
  v8[3] = &unk_1E5B7B130;
  v8[4] = self;
  id v9 = v4;
  id v6 = v4;
  objc_msgSend__updateChatItemsWithReason_block_(self, v7, @"(IMChat) Delete message items", (uint64_t)v8);
}

- (void)markChatItemAsSaved:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = objc_msgSend__item(v4, v5, v6, v7);
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && objc_msgSend_expireState(v8, v9, v10, v11) <= 2)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v23 = v4;
        _os_log_impl(&dword_1A4AF7000, v15, OS_LOG_TYPE_INFO, "Mark chat item as saved: %@", buf, 0xCu);
      }
    }
    id v16 = objc_msgSend_chatRegistry(self, v12, v13, v14);
    objc_msgSend__chat_sendSavedReceiptForMessage_(v16, v17, (uint64_t)self, (uint64_t)v8);

    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1A4BF15EC;
    v19[3] = &unk_1E5B7B130;
    id v20 = v8;
    uint64_t v21 = self;
    objc_msgSend__updateChatItemsWithReason_block_(self, v18, @"(IMChat) Mark as saved", (uint64_t)v19);
  }
}

- (void)markChatItemAsNotifyRecipient:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = objc_msgSend__item(v4, v5, v6, v7);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v4;
        _os_log_impl(&dword_1A4AF7000, v12, OS_LOG_TYPE_INFO, "Mark chat item as notify recipient: %@", buf, 0xCu);
      }
    }
    uint64_t v13 = objc_msgSend_chatRegistry(self, v9, v10, v11);
    objc_msgSend__chat_sendNotifyRecipientCommandForMessage_(v13, v14, (uint64_t)self, (uint64_t)v8);

    v16[0] = MEMORY[0x1E4F143A8];
    v16[1] = 3221225472;
    _DWORD v16[2] = sub_1A4BF17E0;
    v16[3] = &unk_1E5B7B130;
    id v17 = v8;
    uint64_t v18 = self;
    objc_msgSend__updateChatItemsWithReason_block_(self, v15, @"(IMChat) Mark as notify recipient", (uint64_t)v16);
  }
}

- (void)setSelectedIndexOnCarouselChatItem:(id)a3 selectedIndex:(int64_t)a4
{
  uint64_t v6 = objc_msgSend__item(a3, a2, (uint64_t)a3, a4);
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1A4BF18F0;
  v9[3] = &unk_1E5B7D9C8;
  uint64_t v11 = self;
  int64_t v12 = a4;
  id v10 = v6;
  id v7 = v6;
  objc_msgSend__updateChatItemsWithReason_block_(self, v8, @"(IMChat) Set selected rich card index", (uint64_t)v9);
}

- (void)markChatItemAsPlayed:(id)a3
{
  objc_msgSend__item(a3, a2, (uint64_t)a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend__markItemAsPlayed_(self, v5, (uint64_t)v7, v6);
}

- (void)_markItemAsPlayed:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && (objc_msgSend_isPlayed(v4, v5, v6, v7) & 1) == 0
    && (objc_msgSend_isFromMe(v4, v8, v9, v10) & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v4;
        _os_log_impl(&dword_1A4AF7000, v14, OS_LOG_TYPE_INFO, "Mark chat item as played: %@", buf, 0xCu);
      }
    }
    uint64_t v15 = objc_msgSend_chatRegistry(self, v11, v12, v13);
    objc_msgSend__chat_sendPlayedReceiptForMessage_(v15, v16, (uint64_t)self, (uint64_t)v4);

    v18[0] = MEMORY[0x1E4F143A8];
    v18[1] = 3221225472;
    _DWORD v18[2] = sub_1A4BF1B70;
    v18[3] = &unk_1E5B7B130;
    id v19 = v4;
    id v20 = self;
    objc_msgSend__updateChatItemsWithReason_block_(self, v17, @"(IMChat) Mark as played", (uint64_t)v18);
  }
}

- (void)markChatItemAsPlayedExpressiveSend:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v8 = objc_msgSend__item(v4, v5, v6, v7);
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v12 = objc_msgSend_timeExpressiveSendPlayed(v8, v9, v10, v11);

    if (!v12)
    {
      if (IMOSLoggingEnabled())
      {
        id v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v4;
          _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Mark chat item as having played expressive send: %@", buf, 0xCu);
        }
      }
      id v17 = objc_msgSend_chatRegistry(self, v13, v14, v15);
      objc_msgSend__chat_setPlayedExpressiveSendForMessage_(v17, v18, (uint64_t)self, (uint64_t)v8);

      v20[0] = MEMORY[0x1E4F143A8];
      v20[1] = 3221225472;
      v20[2] = sub_1A4BF1DD0;
      v20[3] = &unk_1E5B7B130;
      id v21 = v8;
      id v22 = self;
      objc_msgSend__updateChatItemsWithReason_block_(self, v19, @"(IMChat) Mark as played expressive send", (uint64_t)v20);
    }
  }
}

- (NSArray)replySuggestions
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_lastFinishedMessage(self, a2, v2, v3);
  if (objc_msgSend_isFromMe(v5, v6, v7, v8)
    && !objc_msgSend_isAssociatedMessage(v5, v9, v10, v11))
  {
    uint64_t v39 = (NSArray *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v12 = objc_msgSend_lastMessage(self, v9, v10, v11);
    if (objc_msgSend_isFromMe(v12, v13, v14, v15)
      && !objc_msgSend_isAssociatedMessage(v5, v16, v17, v18))
    {
      uint64_t v39 = (NSArray *)MEMORY[0x1E4F1CBF0];
    }
    else
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id v19 = objc_msgSend_chatItems(self, v16, v17, v18, 0);
      uint64_t v23 = objc_msgSend_messages(v19, v20, v21, v22);
      id v27 = objc_msgSend_reverseObjectEnumerator(v23, v24, v25, v26);

      id v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v41, (uint64_t)v45, 16);
      if (v32)
      {
        uint64_t v33 = *(void *)v42;
        while (2)
        {
          for (uint64_t i = 0; i != v32; uint64_t i = (char *)i + 1)
          {
            if (*(void *)v42 != v33) {
              objc_enumerationMutation(v27);
            }
            id v35 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            if ((objc_msgSend_isAssociatedMessageItem(v35, v29, v30, v31) & 1) == 0)
            {
              id v32 = objc_msgSend_message(v35, v29, v30, v31);
              goto LABEL_15;
            }
          }
          id v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v41, (uint64_t)v45, 16);
          if (v32) {
            continue;
          }
          break;
        }
      }
LABEL_15:

      if (objc_msgSend_isFromMe(v32, v36, v37, v38)) {
        uint64_t v39 = (NSArray *)MEMORY[0x1E4F1CBF0];
      }
      else {
        uint64_t v39 = self->_replySuggestions;
      }
    }
  }

  return v39;
}

- (BOOL)hasCommSafetySensitiveMessage
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  long long v38 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id v4 = objc_msgSend__items(self, a2, v2, v3);
  uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v38, (uint64_t)v43, 16);
  if (v33)
  {
    uint64_t v9 = *(void *)v39;
    uint64_t v32 = *(void *)v39;
    do
    {
      for (uint64_t i = 0; i != v33; ++i)
      {
        if (*(void *)v39 != v9) {
          objc_enumerationMutation(v4);
        }
        uint64_t v11 = *(void **)(*((void *)&v38 + 1) + 8 * i);
        long long v34 = 0u;
        long long v35 = 0u;
        long long v36 = 0u;
        long long v37 = 0u;
        uint64_t v12 = objc_msgSend_fileTransferGUIDs(v11, v6, v7, v8, v32);
        uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v13, (uint64_t)&v34, (uint64_t)v42, 16);
        if (v14)
        {
          uint64_t v18 = v14;
          uint64_t v19 = *(void *)v35;
          while (2)
          {
            for (uint64_t j = 0; j != v18; ++j)
            {
              if (*(void *)v35 != v19) {
                objc_enumerationMutation(v12);
              }
              uint64_t v21 = *(void *)(*((void *)&v34 + 1) + 8 * j);
              uint64_t v22 = objc_msgSend_sharedInstance(IMFileTransferCenter, v15, v16, v17);
              uint64_t v25 = objc_msgSend_transferForGUID_(v22, v23, v21, v24);
              uint64_t v29 = objc_msgSend_commSafetySensitive(v25, v26, v27, v28);

              if ((unint64_t)(v29 - 3) > 0xFFFFFFFFFFFFFFFDLL)
              {

                BOOL v30 = 1;
                goto LABEL_19;
              }
            }
            uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v12, v15, (uint64_t)&v34, (uint64_t)v42, 16);
            if (v18) {
              continue;
            }
            break;
          }
        }

        uint64_t v9 = v32;
      }
      BOOL v30 = 0;
      uint64_t v33 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v6, (uint64_t)&v38, (uint64_t)v43, 16);
    }
    while (v33);
  }
  else
  {
    BOOL v30 = 0;
  }
LABEL_19:

  return v30;
}

- (BOOL)hasCommSafetySensitiveMessageFromSomeoneElse
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  long long v40 = 0u;
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  id v4 = objc_msgSend__items(self, a2, v2, v3);
  uint64_t v6 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v5, (uint64_t)&v40, (uint64_t)v45, 16);
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v41;
    uint64_t v34 = *(void *)v41;
    do
    {
      uint64_t v9 = 0;
      uint64_t v35 = v7;
      do
      {
        if (*(void *)v41 != v8) {
          objc_enumerationMutation(v4);
        }
        uint64_t v10 = *(void **)(*((void *)&v40 + 1) + 8 * v9);
        objc_opt_class();
        if ((objc_opt_isKindOfClass() & 1) == 0 || (objc_msgSend_isFromMe(v10, v11, v12, v13) & 1) == 0)
        {
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          uint64_t v14 = objc_msgSend_fileTransferGUIDs(v10, v11, v12, v13, v34);
          uint64_t v16 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v15, (uint64_t)&v36, (uint64_t)v44, 16);
          if (v16)
          {
            uint64_t v20 = v16;
            uint64_t v21 = *(void *)v37;
            while (2)
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v37 != v21) {
                  objc_enumerationMutation(v14);
                }
                uint64_t v23 = *(void *)(*((void *)&v36 + 1) + 8 * i);
                uint64_t v24 = objc_msgSend_sharedInstance(IMFileTransferCenter, v17, v18, v19);
                uint64_t v27 = objc_msgSend_transferForGUID_(v24, v25, v23, v26);
                uint64_t v31 = objc_msgSend_commSafetySensitive(v27, v28, v29, v30);

                if ((unint64_t)(v31 - 3) > 0xFFFFFFFFFFFFFFFDLL)
                {

                  BOOL v32 = 1;
                  goto LABEL_22;
                }
              }
              uint64_t v20 = objc_msgSend_countByEnumeratingWithState_objects_count_(v14, v17, (uint64_t)&v36, (uint64_t)v44, 16);
              if (v20) {
                continue;
              }
              break;
            }
          }

          uint64_t v8 = v34;
          uint64_t v7 = v35;
        }
        ++v9;
      }
      while (v9 != v7);
      uint64_t v7 = objc_msgSend_countByEnumeratingWithState_objects_count_(v4, v11, (uint64_t)&v40, (uint64_t)v45, 16);
      BOOL v32 = 0;
    }
    while (v7);
  }
  else
  {
    BOOL v32 = 0;
  }
LABEL_22:

  return v32;
}

- (BOOL)isCommSafetySensitiveMessageRecent
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id v4 = objc_msgSend__items(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_reverseObjectEnumerator(v4, v5, v6, v7);

  uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v44, (uint64_t)v49, 16);
  if (v39)
  {
    uint64_t v10 = *(void *)v45;
    uint64_t v37 = *(void *)v45;
    uint64_t v38 = 0;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v45 != v10) {
        objc_enumerationMutation(v8);
      }
      uint64_t v12 = *(void **)(*((void *)&v44 + 1) + 8 * v11);
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (objc_msgSend_isFromMe(v12, v13, v14, v15))
        {
          if ((unint64_t)++v38 > 2) {
            break;
          }
        }
      }
      long long v42 = 0u;
      long long v43 = 0u;
      long long v40 = 0u;
      long long v41 = 0u;
      uint64_t v16 = objc_msgSend_fileTransferGUIDs(v12, v13, v14, v15);
      uint64_t v18 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v17, (uint64_t)&v40, (uint64_t)v48, 16);
      if (v18)
      {
        uint64_t v22 = v18;
        uint64_t v23 = *(void *)v41;
        while (2)
        {
          for (uint64_t i = 0; i != v22; ++i)
          {
            if (*(void *)v41 != v23) {
              objc_enumerationMutation(v16);
            }
            uint64_t v25 = *(void *)(*((void *)&v40 + 1) + 8 * i);
            uint64_t v26 = objc_msgSend_sharedInstance(IMFileTransferCenter, v19, v20, v21);
            uint64_t v29 = objc_msgSend_transferForGUID_(v26, v27, v25, v28);
            uint64_t v33 = objc_msgSend_commSafetySensitive(v29, v30, v31, v32);

            if ((unint64_t)(v33 - 3) > 0xFFFFFFFFFFFFFFFDLL)
            {

              BOOL v35 = 1;
              goto LABEL_22;
            }
          }
          uint64_t v22 = objc_msgSend_countByEnumeratingWithState_objects_count_(v16, v19, (uint64_t)&v40, (uint64_t)v48, 16);
          if (v22) {
            continue;
          }
          break;
        }
      }

      ++v11;
      uint64_t v10 = v37;
      if (v11 == v39)
      {
        BOOL v35 = 0;
        uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v34, (uint64_t)&v44, (uint64_t)v49, 16);
        if (v39) {
          goto LABEL_3;
        }
        goto LABEL_22;
      }
    }
  }
  BOOL v35 = 0;
LABEL_22:

  return v35;
}

- (BOOL)allParticipantsBlocked
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_sharedBlockList(MEMORY[0x1E4F6E620], a2, v2, v3);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  uint64_t v9 = objc_msgSend_participants(self, v6, v7, v8);
  uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v10, (uint64_t)&v27, (uint64_t)v35, 16);
  if (v14)
  {
    uint64_t v16 = *(void *)v28;
    char v17 = 1;
    *(void *)&long long v15 = 138412546;
    long long v26 = v15;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v28 != v16) {
          objc_enumerationMutation(v9);
        }
        uint64_t v19 = objc_msgSend_ID(*(void **)(*((void *)&v27 + 1) + 8 * i), v11, v12, v13, v26);
        int IsBlocked = objc_msgSend_addressIsBlocked_(v5, v20, (uint64_t)v19, v21);
        if (IMOSLoggingEnabled())
        {
          uint64_t v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v26;
            uint64_t v24 = @"NO";
            if (IsBlocked) {
              uint64_t v24 = @"YES";
            }
            uint64_t v32 = v19;
            __int16 v33 = 2112;
            uint64_t v34 = v24;
            _os_log_impl(&dword_1A4AF7000, v23, OS_LOG_TYPE_INFO, "Participant %@ is blocked %@", buf, 0x16u);
          }
        }
        v17 &= IsBlocked;
      }
      uint64_t v14 = objc_msgSend_countByEnumeratingWithState_objects_count_(v9, v11, (uint64_t)&v27, (uint64_t)v35, 16);
    }
    while (v14);
  }
  else
  {
    char v17 = 1;
  }

  return v17;
}

- (void)updateCommSafety:(int64_t)a3 forChatItem:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v11 = a4;
  uint64_t v6 = (void *)MEMORY[0x1E4F1C978];
  id v7 = a4;
  uint64_t v9 = objc_msgSend_arrayWithObjects_count_(v6, v8, (uint64_t)&v11, 1);

  objc_msgSend_updateCommSafety_forChatItems_parentChatItem_(self, v10, a3, (uint64_t)v9, 0, v11, v12);
}

- (void)updateCommSafety:(int64_t)a3 forChatItems:(id)a4
{
}

- (void)updateCommSafety:(int64_t)a3 forChatItems:(id)a4 parentChatItem:(id)a5
{
  long long v62 = self;
  uint64_t v86 = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v63 = a5;
  long long v76 = 0u;
  long long v77 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = v7;
  uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v8, (uint64_t)&v76, (uint64_t)v85, 16);
  if (v66)
  {
    uint64_t v65 = *(void *)v77;
    do
    {
      for (uint64_t i = 0; i != v66; ++i)
      {
        if (*(void *)v77 != v65) {
          objc_enumerationMutation(obj);
        }
        uint64_t v13 = *(void **)(*((void *)&v76 + 1) + 8 * i);
        if (objc_msgSend_supportsCommunicationSafety(v13, v9, v10, v11, v62))
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              uint64_t v19 = objc_msgSend_numberWithInteger_(NSNumber, v17, a3, v18);
              *(_DWORD *)buf = 138412546;
              uint64_t v82 = v13;
              __int16 v83 = 2112;
              id v84 = v19;
              _os_log_impl(&dword_1A4AF7000, v16, OS_LOG_TYPE_INFO, "Mark chat item %@ for CommSafety: %@", buf, 0x16u);
            }
          }
          objc_msgSend_setNeedsReloadForTransferStatusChangeWithType_(v13, v14, 1, v15);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v23 = v13;
            long long v72 = 0u;
            long long v73 = 0u;
            long long v74 = 0u;
            long long v75 = 0u;
            long long v27 = objc_msgSend_acknowledgments(v23, v24, v25, v26);
            uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v28, (uint64_t)&v72, (uint64_t)v80, 16);
            if (v32)
            {
              uint64_t v33 = *(void *)v73;
              do
              {
                for (uint64_t j = 0; j != v32; ++j)
                {
                  if (*(void *)v73 != v33) {
                    objc_enumerationMutation(v27);
                  }
                  BOOL v35 = objc_msgSend_commSafetyTransferGUID(*(void **)(*((void *)&v72 + 1) + 8 * j), v29, v30, v31);
                  uint64_t v39 = objc_msgSend_sharedInstance(IMFileTransferCenter, v36, v37, v38);
                  objc_msgSend_setCommSafetySensitiveForTransfer_value_(v39, v40, (uint64_t)v35, a3);
                }
                uint64_t v32 = objc_msgSend_countByEnumeratingWithState_objects_count_(v27, v29, (uint64_t)&v72, (uint64_t)v80, 16);
              }
              while (v32);
            }
          }
          else
          {
            objc_msgSend_sharedInstance(IMFileTransferCenter, v20, v21, v22);
            id v23 = (id)objc_claimAutoreleasedReturnValue();
            long long v27 = objc_msgSend_commSafetyTransferGUID(v13, v41, v42, v43);
            objc_msgSend_setCommSafetySensitiveForTransfer_value_(v23, v44, (uint64_t)v27, a3);
          }
        }
      }
      uint64_t v66 = objc_msgSend_countByEnumeratingWithState_objects_count_(obj, v9, (uint64_t)&v76, (uint64_t)v85, 16);
    }
    while (v66);
  }

  long long v47 = v63;
  if (v63)
  {
    objc_msgSend_setNeedsReloadForTransferStatusChangeWithType_(v63, v45, 1, v46);
    objc_opt_class();
    char isKindOfClass = objc_opt_isKindOfClass();
    long long v47 = v63;
    if (isKindOfClass)
    {
      uint64_t v52 = objc_msgSend_text(v63, v49, v50, v51);
      uint64_t v56 = objc_msgSend_length(v52, v53, v54, v55);
      uint64_t v57 = *MEMORY[0x1E4F6C188];
      v71[0] = MEMORY[0x1E4F143A8];
      v71[1] = 3221225472;
      v71[2] = sub_1A4BF2D90;
      v71[3] = &unk_1E5B7D9E8;
      v71[4] = a3;
      objc_msgSend_enumerateAttribute_inRange_options_usingBlock_(v52, v58, v57, 0, v56, 0, v71);

      long long v47 = v63;
    }
  }
  v67[0] = MEMORY[0x1E4F143A8];
  v67[1] = 3221225472;
  v67[2] = sub_1A4BF2E34;
  v67[3] = &unk_1E5B7BE70;
  id v68 = obj;
  uint64_t v69 = v62;
  id v70 = v47;
  id v59 = v47;
  id v60 = obj;
  objc_msgSend__updateChatItemsWithReason_block_(v62, v61, @"(IMChat) Update communication safety flag", (uint64_t)v67);
}

- (id)_renderingDataDictionary
{
  uint64_t v5 = objc_msgSend_chatScrutinyController(self, a2, v2, v3);
  uint64_t v9 = objc_msgSend_chatIdentifier(self, v6, v7, v8);
  uint64_t v12 = objc_msgSend_transcriptRenderingMetadataForChatIdentifier_(v5, v10, (uint64_t)v9, v11);
  CFMutableDictionaryRef Mutable = objc_msgSend_mutableCopy(v12, v13, v14, v15);

  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }

  return Mutable;
}

- (void)_setRenderingDataDictionary:(id)a3
{
  id v4 = a3;
  objc_msgSend_chatScrutinyController(self, v5, v6, v7);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_chatIdentifier(self, v8, v9, v10);
  objc_msgSend_setTranscriptRenderingMetadata_forChatIdentifier_(v13, v12, (uint64_t)v4, (uint64_t)v11);
}

- (void)stickerRepositionedForAssociatedChatItem:(id)a3
{
  id v4 = a3;
  objc_msgSend_setNeedsReloadForTransferStatusChangeWithType_(v4, v5, 2, v6);
  uint64_t v10 = objc_msgSend__item(v4, v7, v8, v9);
  uint64_t v14 = objc_msgSend__item(v4, v11, v12, v13);

  uint64_t v18 = objc_msgSend_flags(v14, v15, v16, v17);
  id v27 = (id)objc_msgSend__copyWithFlags_(v10, v19, v18, v20);

  uint64_t v21 = [IMChatItem alloc];
  uint64_t v24 = objc_msgSend__initWithItem_(v21, v22, (uint64_t)v27, v23);
  if (objc_opt_respondsToSelector()) {
    objc_msgSend_setNeedsReloadForTransferStatusChangeWithType_(v24, v25, 0, v26);
  }
  objc_msgSend__handleItem_(self, v25, (uint64_t)v27, v26);
}

- (id)chatItemsForItems:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = v4;
  uint64_t v8 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v7, (uint64_t)&v18, (uint64_t)v22, 16);
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v19;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v6);
        }
        _IMAppendChatItemsForItem(v5, self->_chatItemRules, *(void **)(*((void *)&v18 + 1) + 8 * i));
      }
      uint64_t v9 = objc_msgSend_countByEnumeratingWithState_objects_count_(v6, v12, (uint64_t)&v18, (uint64_t)v22, 16);
    }
    while (v9);
  }

  uint64_t v16 = objc_msgSend_copy(v5, v13, v14, v15, (void)v18);

  return v16;
}

- (id)allMessagesToReportAsSpam
{
  id v5 = objc_msgSend_chatItems(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_messagesToReportAsSpamFromChatItems_(self, v6, (uint64_t)v5, v7);

  return v8;
}

- (id)messagesToReportAsSpamFromChatItems:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  uint64_t v8 = objc_msgSend___imItems(v3, v5, v6, v7, 0);
  uint64_t v10 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v9, (uint64_t)&v29, (uint64_t)v33, 16);
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v30;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(v8);
        }
        uint64_t v14 = *(void **)(*((void *)&v29 + 1) + 8 * i);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v18 = objc_msgSend_fileTransferGUIDs(v14, v15, v16, v17);
          uint64_t v22 = objc_msgSend_count(v18, v19, v20, v21);

          if (!v22) {
            objc_msgSend_addObject_(v4, v15, (uint64_t)v14, v23);
          }
        }
      }
      uint64_t v11 = objc_msgSend_countByEnumeratingWithState_objects_count_(v8, v15, (uint64_t)&v29, (uint64_t)v33, 16);
    }
    while (v11);
  }

  id v27 = objc_msgSend_copy(v4, v24, v25, v26);

  return v27;
}

- (void)_configureLocationShareItem:(id)a3
{
  id v4 = a3;
  objc_msgSend_account(self, v5, v6, v7);
  id v32 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = objc_msgSend_sender(v4, v8, v9, v10);
  uint64_t v13 = objc_msgSend_imHandleWithID_alreadyCanonical_(v32, v12, (uint64_t)v11, 1);

  uint64_t v17 = objc_msgSend_sharedInstance(IMFMFSession, v14, v15, v16);
  int IsSharingLocationWithMe = objc_msgSend_handleIsSharingLocationWithMe_(v17, v18, (uint64_t)v13, v19);

  uint64_t v24 = objc_msgSend_sharedInstance(IMFMFSession, v21, v22, v23);
  int IsFollowingMyLocation = objc_msgSend_handleIsFollowingMyLocation_(v24, v25, (uint64_t)v13, v26);

  objc_msgSend_setExpired_(v4, v28, IsSharingLocationWithMe ^ 1u, v29);
  objc_msgSend_setActionable_(v4, v30, IsFollowingMyLocation ^ 1u, v31);
}

- (void)_updateLocationShareItemsForSender:(id)a3
{
  uint64_t v79 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v8 = objc_msgSend__items(self, v5, v6, v7);
  uint64_t v12 = objc_msgSend_account(self, v9, v10, v11);
  uint64_t v66 = v4;
  uint64_t v14 = objc_msgSend_imHandleWithID_alreadyCanonical_(v12, v13, (uint64_t)v4, 1);
  long long v18 = objc_msgSend_sharedInstance(IMFMFSession, v15, v16, v17);
  int IsSharingLocationWithMe = objc_msgSend_handleIsSharingLocationWithMe_(v18, v19, (uint64_t)v14, v20);

  id v21 = objc_alloc(MEMORY[0x1E4F1CA48]);
  uint64_t v25 = objc_msgSend_count(v8, v22, v23, v24);
  uint64_t v67 = objc_msgSend_initWithCapacity_(v21, v26, v25, v27);
  long long v73 = 0u;
  long long v74 = 0u;
  long long v75 = 0u;
  long long v76 = 0u;
  id v28 = v8;
  uint64_t v30 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v29, (uint64_t)&v73, (uint64_t)v78, 16);
  if (v30)
  {
    uint64_t v34 = v30;
    uint64_t v35 = *(void *)v74;
    do
    {
      for (uint64_t i = 0; i != v34; ++i)
      {
        if (*(void *)v74 != v35) {
          objc_enumerationMutation(v28);
        }
        uint64_t v37 = *(void **)(*((void *)&v73 + 1) + 8 * i);
        if (objc_msgSend_type(v37, v31, v32, v33) == 4)
        {
          id v38 = v37;
          uint64_t v42 = objc_msgSend_sender(v38, v39, v40, v41);
          long long v44 = objc_msgSend_imHandleWithID_alreadyCanonical_(v12, v43, (uint64_t)v42, 1);

          if (objc_msgSend_isEqual_(v14, v45, (uint64_t)v44, v46)
            && IsSharingLocationWithMe == objc_msgSend_expired(v38, v47, v48, v49))
          {
            objc_msgSend_addObject_(v67, v50, (uint64_t)v38, v51);
          }
        }
      }
      uint64_t v34 = objc_msgSend_countByEnumeratingWithState_objects_count_(v28, v31, (uint64_t)&v73, (uint64_t)v78, 16);
    }
    while (v34);
  }

  long long v71 = 0u;
  long long v72 = 0u;
  long long v69 = 0u;
  long long v70 = 0u;
  id v52 = v67;
  uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v53, (uint64_t)&v69, (uint64_t)v77, 16);
  if (v54)
  {
    uint64_t v58 = v54;
    uint64_t v59 = *(void *)v70;
    do
    {
      for (uint64_t j = 0; j != v58; ++j)
      {
        if (*(void *)v70 != v59) {
          objc_enumerationMutation(v52);
        }
        long long v61 = objc_msgSend_copy(*(void **)(*((void *)&v69 + 1) + 8 * j), v55, v56, v57);
        objc_msgSend_setExpired_(v61, v62, IsSharingLocationWithMe ^ 1u, v63);
        objc_msgSend__handleItem_(self, v64, (uint64_t)v61, v65);
      }
      uint64_t v58 = objc_msgSend_countByEnumeratingWithState_objects_count_(v52, v55, (uint64_t)&v69, (uint64_t)v77, 16);
    }
    while (v58);
  }
}

- (NSSet)fmfHandles
{
  id v5 = objc_msgSend_sharedInstance(IMFMFSession, a2, v2, v3);
  uint64_t v8 = objc_msgSend_findMyHandlesForChat_(v5, v6, (uint64_t)self, v7);
  uint64_t v12 = objc_msgSend___im_fmfHandles(v8, v9, v10, v11);

  return (NSSet *)v12;
}

- (NSSet)findMyHandles
{
  id v5 = objc_msgSend_sharedInstance(IMFMFSession, a2, v2, v3);
  uint64_t v8 = objc_msgSend_findMyHandlesForChat_(v5, v6, (uint64_t)self, v7);

  return (NSSet *)v8;
}

- (void)markAllLocationShareItemsAsUnactionable
{
  v2[0] = MEMORY[0x1E4F143A8];
  v2[1] = 3221225472;
  v2[2] = sub_1A4BF3A24;
  v2[3] = &unk_1E5B7ACD0;
  v2[4] = self;
  objc_msgSend__updateChatItemsWithReason_block_(self, a2, @"(IMChat) Mark as unactionable", (uint64_t)v2);
}

- (NSSet)allSiblingFMFHandles
{
  id v5 = objc_msgSend_sharedInstance(IMFMFSession, a2, v2, v3);
  uint64_t v8 = objc_msgSend_allSiblingFindMyHandlesForChat_(v5, v6, (uint64_t)self, v7);
  uint64_t v12 = objc_msgSend___im_fmfHandles(v8, v9, v10, v11);

  return (NSSet *)v12;
}

- (NSSet)allSiblingFindMyHandles
{
  id v5 = objc_msgSend_sharedInstance(IMFMFSession, a2, v2, v3);
  uint64_t v8 = objc_msgSend_allSiblingFindMyHandlesForChat_(v5, v6, (uint64_t)self, v7);

  return (NSSet *)v8;
}

- (BOOL)hasRecipientsFollowingLocation
{
  id v5 = objc_msgSend_sharedInstance(IMFMFSession, a2, v2, v3);
  LOBYTE(self) = objc_msgSend_chatHasParticipantsFollowingMyLocation_(v5, v6, (uint64_t)self, v7);

  return (char)self;
}

- (BOOL)allRecipientsFollowingLocation
{
  id v5 = objc_msgSend_sharedInstance(IMFMFSession, a2, v2, v3);
  LOBYTE(self) = objc_msgSend_allChatParticipantsFollowingMyLocation_(v5, v6, (uint64_t)self, v7);

  return (char)self;
}

- (BOOL)hasRecipientsSharingLocation
{
  id v5 = objc_msgSend_sharedInstance(IMFMFSession, a2, v2, v3);
  LOBYTE(self) = objc_msgSend_chatHasParticipantsSharingLocationWithMe_(v5, v6, (uint64_t)self, v7);

  return (char)self;
}

- (BOOL)hasSiblingRecipientsSharingLocation
{
  id v5 = objc_msgSend_sharedInstance(IMFMFSession, a2, v2, v3);
  LOBYTE(self) = objc_msgSend_chatHasSiblingParticipantsSharingLocationWithMe_(v5, v6, (uint64_t)self, v7);

  return (char)self;
}

- (BOOL)allRecipientsSharingLocation
{
  id v5 = objc_msgSend_sharedInstance(IMFMFSession, a2, v2, v3);
  LOBYTE(self) = objc_msgSend_allChatParticipantsSharingLocationWithMe_(v5, v6, (uint64_t)self, v7);

  return (char)self;
}

- (void)shareLocationWithDuration:(int64_t)a3
{
  objc_msgSend_sharedInstance(IMFMFSession, a2, a3, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startSharingWithChat_withDuration_(v7, v6, (uint64_t)self, a3);
}

- (void)stopSharingLocation
{
  objc_msgSend_sharedInstance(IMFMFSession, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopSharingWithChat_(v7, v5, (uint64_t)self, v6);
}

- (void)startTrackingParticipantLocations
{
  objc_msgSend_sharedInstance(IMFMFSession, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_startTrackingLocationForChat_(v7, v5, (uint64_t)self, v6);
}

- (void)stopTrackingParticipantLocations
{
  objc_msgSend_sharedInstance(IMFMFSession, a2, v2, v3);
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  objc_msgSend_stopTrackingLocationForChat_(v7, v5, (uint64_t)self, v6);
}

- (id)testChatItems
{
  return (id)((uint64_t (*)(IMChatItemRules *, char *))MEMORY[0x1F4181798])(self->_chatItemRules, sel_testChatItems);
}

- (void)_automation_markAsRead:(BOOL)a3 messageGUID:(id)a4 forChatGUID:(id)a5 fromMe:(BOOL)a6
{
  id v10 = a4;
  id v11 = a5;
  v16[0] = MEMORY[0x1E4F143A8];
  v16[1] = 3221225472;
  _DWORD v16[2] = sub_1A4BF4114;
  v16[3] = &unk_1E5B7DA10;
  BOOL v19 = a3;
  id v17 = v10;
  id v18 = v11;
  BOOL v20 = a6;
  id v12 = v11;
  id v13 = v10;
  id v15 = (id)objc_msgSend__performQueryWithKey_loadImmediately_block_(self, v14, @"AutomationMarkAsRead", 1, v16);
}

- (BOOL)repliedToChat
{
  id v4 = objc_msgSend_lastSentMessage(self, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

- (BOOL)receivedResponseForChat
{
  id v4 = objc_msgSend_lastIncomingFinishedMessage(self, a2, v2, v3);
  BOOL v5 = v4 != 0;

  return v5;
}

+ (id)stateCaptureRecents
{
  if (qword_1EB3F22B0 != -1) {
    dispatch_once(&qword_1EB3F22B0, &unk_1EF8E66C8);
  }
  uint64_t v2 = (void *)qword_1EB3F22A8;

  return v2;
}

- (id)stateDictionaryForDiagnosticsRequest
{
  uint64_t v110 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc(MEMORY[0x1E4F1CA80]);
  id v7 = objc_msgSend__items(self, v4, v5, v6);
  uint64_t v11 = objc_msgSend_count(v7, v8, v9, v10);
  uint64_t v14 = objc_msgSend_initWithCapacity_(v3, v12, v11, v13);

  id v15 = objc_alloc(MEMORY[0x1E4F1CA48]);
  BOOL v19 = objc_msgSend__items(self, v16, v17, v18);
  if ((unint64_t)objc_msgSend_count(v19, v20, v21, v22) >= 0x64)
  {
    uint64_t v33 = objc_msgSend_initWithCapacity_(v15, v23, 100, v25);
  }
  else
  {
    uint64_t v26 = objc_msgSend__items(self, v23, v24, v25);
    uint64_t v30 = objc_msgSend_count(v26, v27, v28, v29);
    uint64_t v33 = objc_msgSend_initWithCapacity_(v15, v31, v30, v32);
  }
  id v98 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v34 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v38 = objc_msgSend_chatItems(self, v35, v36, v37);
  v103[0] = MEMORY[0x1E4F143A8];
  v103[1] = 3221225472;
  v103[2] = sub_1A4BF46D0;
  v103[3] = &unk_1E5B7DA38;
  id v39 = v14;
  id v104 = v39;
  id v97 = v34;
  id v105 = v97;
  id v95 = v33;
  id v106 = v95;
  objc_msgSend_enumerateObjectsWithOptions_usingBlock_(v38, v40, 2, (uint64_t)v103);

  long long v101 = 0u;
  long long v102 = 0u;
  long long v99 = 0u;
  long long v100 = 0u;
  uint64_t v96 = self;
  long long v44 = objc_msgSend__items(self, v41, v42, v43);
  uint64_t v46 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v45, (uint64_t)&v99, (uint64_t)v109, 16);
  if (v46)
  {
    uint64_t v50 = v46;
    uint64_t v51 = *(void *)v100;
    do
    {
      for (uint64_t i = 0; i != v50; ++i)
      {
        if (*(void *)v100 != v51) {
          objc_enumerationMutation(v44);
        }
        long long v53 = *(void **)(*((void *)&v99 + 1) + 8 * i);
        uint64_t v54 = objc_msgSend_guid(v53, v47, v48, v49);
        if ((objc_msgSend_containsObject_(v39, v55, (uint64_t)v54, v56) & 1) == 0
          && (objc_msgSend_isAssociatedMessageItem(v53, v57, v58, v59) & 1) == 0)
        {
          id v60 = NSString;
          long long v61 = (objc_class *)objc_opt_class();
          long long v62 = NSStringFromClass(v61);
          uint64_t v66 = objc_msgSend_guid(v53, v63, v64, v65);
          long long v69 = objc_msgSend_stringWithFormat_(v60, v67, @"%@: %@", v68, v62, v66);
          objc_msgSend_addObject_(v98, v70, (uint64_t)v69, v71);
        }
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          id v72 = v53;
          if (objc_msgSend_isTypingMessage(v72, v73, v74, v75))
          {
            long long v76 = NSString;
            long long v77 = (objc_class *)objc_opt_class();
            long long v78 = NSStringFromClass(v77);
            uint64_t v82 = objc_msgSend_guid(v72, v79, v80, v81);
            id v85 = objc_msgSend_stringWithFormat_(v76, v83, @"i:%@: %@", v84, v78, v82);
            objc_msgSend_addObject_(v97, v86, (uint64_t)v85, v87);
          }
        }
      }
      uint64_t v50 = objc_msgSend_countByEnumeratingWithState_objects_count_(v44, v47, (uint64_t)&v99, (uint64_t)v109, 16);
    }
    while (v50);
  }

  v107[0] = @"debugDescription";
  uint64_t v91 = objc_msgSend_debugDescription(v96, v88, v89, v90);
  v108[0] = v91;
  v108[1] = v95;
  v107[1] = @"bottomChatItemGUIDs";
  v107[2] = @"unrepresentedItems";
  v107[3] = @"typingIndicators";
  v108[2] = v98;
  v108[3] = v97;
  uint64_t v93 = objc_msgSend_dictionaryWithObjects_forKeys_count_(MEMORY[0x1E4F1C9E8], v92, (uint64_t)v108, (uint64_t)v107, 4);

  return v93;
}

- (void)invalidateSpamIndicatorCachedValues
{
  objc_msgSend_setCachedShouldShowReportSpam_(self, a2, 0, v2);

  objc_msgSend_setCachedShouldShowSpam_(self, v4, 0, v5);
}

- (id)contacts
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_set(MEMORY[0x1E4F1CA80], a2, v2, v3);
  uint64_t v9 = objc_msgSend_account(self, v6, v7, v8);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v13 = objc_msgSend_participants(self, v10, v11, v12, 0);
  uint64_t v15 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v14, (uint64_t)&v33, (uint64_t)v37, 16);
  if (v15)
  {
    uint64_t v19 = v15;
    uint64_t v20 = *(void *)v34;
    uint64_t v21 = MEMORY[0x1E4F1CBF0];
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v34 != v20) {
          objc_enumerationMutation(v13);
        }
        uint64_t v23 = objc_msgSend_ID(*(void **)(*((void *)&v33 + 1) + 8 * i), v16, v17, v18);
        uint64_t v26 = objc_msgSend_imHandleWithID_(v9, v24, (uint64_t)v23, v25);

        uint64_t v31 = objc_msgSend_cnContactWithKeys_(v26, v27, v21, v28);
        if (v31) {
          objc_msgSend_addObject_(v5, v29, (uint64_t)v31, v30);
        }
      }
      uint64_t v19 = objc_msgSend_countByEnumeratingWithState_objects_count_(v13, v16, (uint64_t)&v33, (uint64_t)v37, 16);
    }
    while (v19);
  }

  return v5;
}

- (NSString)downgradeStateForDebugMenu
{
  int v4 = objc_msgSend_downgradeState(self, a2, v2, v3);

  return (NSString *)sub_1A4B35E04(v4);
}

- (BOOL)allowedToShowConversation
{
  if (!objc_msgSend_isContactLimitsFeatureEnabled(IMDowntimeController, a2, v2, v3)) {
    return 1;
  }
  uint64_t v8 = objc_msgSend_sharedInstance(IMDowntimeController, v5, v6, v7);
  char v10 = objc_msgSend_allowedToShowConversationForChat_sync_(v8, v9, (uint64_t)self, 0);

  return v10;
}

- (BOOL)allowedToShowConversationSync
{
  if (!objc_msgSend_isContactLimitsFeatureEnabled(IMDowntimeController, a2, v2, v3)) {
    return 1;
  }
  uint64_t v8 = objc_msgSend_sharedInstance(IMDowntimeController, v5, v6, v7);
  uint64_t v11 = objc_msgSend_conversationContextForChat_(v8, v9, (uint64_t)self, v10);
  uint64_t v15 = v11;
  if (v11) {
    char v16 = objc_msgSend_allowedByScreenTime(v11, v12, v13, v14);
  }
  else {
    char v16 = objc_msgSend_allowedToShowConversationForChat_sync_(v8, v12, (uint64_t)self, 1);
  }
  BOOL v17 = v16;

  return v17;
}

- (id)conversationContext
{
  if (objc_msgSend_isContactLimitsFeatureEnabled(IMDowntimeController, a2, v2, v3))
  {
    uint64_t v8 = objc_msgSend_sharedInstance(IMDowntimeController, v5, v6, v7);
    uint64_t v11 = objc_msgSend_conversationContextForChat_(v8, v9, (uint64_t)self, v10);
  }
  else
  {
    uint64_t v11 = 0;
  }

  return v11;
}

- (id)hashOfParticipantIDs
{
  if (objc_msgSend_isContactLimitsFeatureEnabled(IMDowntimeController, a2, v2, v3)
    && (objc_msgSend_participants(self, v5, v6, v7),
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        uint64_t v12 = objc_msgSend_count(v8, v9, v10, v11),
        v8,
        v12))
  {
    char v16 = objc_msgSend_participantHandleIDs(self, v13, v14, v15);
    uint64_t v20 = IMHashOfHashesForStringArray(v16, v17, v18, v19);
  }
  else
  {
    uint64_t v20 = 0;
  }

  return v20;
}

- (NSString)pronunciationHint
{
  return 0;
}

- (NSArray)alternativeSpeakableMatches
{
  return 0;
}

- (void)updateReplySuggestions
{
  uint64_t v5 = objc_msgSend_chatItemsUpdater(self, a2, v2, v3);
  char isHoldingUpdates = objc_msgSend_isHoldingUpdates(v5, v6, v7, v8);

  if ((isHoldingUpdates & 1) == 0)
  {
    objc_msgSend__updateChatItemsWithReason_block_(self, v10, @"Update Smart Replies", (uint64_t)&unk_1EF8E57D8);
  }
}

- (id)recentIncomingMessagesWithTextContentForReplySuggestions
{
  int v4 = (void *)MEMORY[0x1E4F6E918];
  uint64_t v5 = objc_msgSend__items(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_recentIncomingMessagesWithTextContentForReplySuggestions_(v4, v6, (uint64_t)v5, v7);

  return v8;
}

- (id)recentOugoingMessagesWithTextContentForReplySuggestions
{
  int v4 = (void *)MEMORY[0x1E4F6E918];
  uint64_t v5 = objc_msgSend__items(self, a2, v2, v3);
  uint64_t v8 = objc_msgSend_recentOugoingMessagesWithTextContentForReplySuggestions_(v4, v6, (uint64_t)v5, v7);

  return v8;
}

- (BOOL)isRecipientAbleToDowngradeToSMS
{
  v66[1] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = objc_msgSend_sharedFeatureFlags(MEMORY[0x1E4F6E778], a2, v2, v3);
  int isCarrierPigeonEnabled = objc_msgSend_isCarrierPigeonEnabled(v5, v6, v7, v8);

  if (!isCarrierPigeonEnabled || objc_msgSend_chatStyle(self, v10, v11, v12) != 45) {
    return 0;
  }
  char v16 = objc_msgSend_recipient(self, v13, v14, v15);
  uint64_t v20 = objc_msgSend_ID(v16, v17, v18, v19);
  uint64_t v21 = IMChatCanonicalIDSIDsForAddress();

  uint64_t v22 = (void *)MEMORY[0x1E4F6E7B8];
  v66[0] = v21;
  int v23 = 1;
  uint64_t v25 = objc_msgSend_arrayWithObjects_count_(MEMORY[0x1E4F1C978], v24, (uint64_t)v66, 1);
  uint64_t v27 = objc_msgSend__currentCachedRemoteDevicesForDestinations_service_listenerID_(v22, v26, (uint64_t)v25, @"com.apple.madrid", @"IMChat+LiteService");

  if (v27)
  {
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    uint64_t v31 = objc_msgSend_allValues(v27, v28, v29, v30);
    uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v31, v32, (uint64_t)&v60, (uint64_t)v65, 16);
    if (v54)
    {
      uint64_t v33 = *(void *)v61;
      uint64_t v34 = *MEMORY[0x1E4F6B2B8];
      uint64_t v52 = *(void *)v61;
      long long v53 = v16;
      uint64_t v55 = v31;
      do
      {
        for (uint64_t i = 0; i != v54; ++i)
        {
          if (*(void *)v61 != v33) {
            objc_enumerationMutation(v31);
          }
          long long v36 = *(void **)(*((void *)&v60 + 1) + 8 * i);
          long long v56 = 0u;
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          id v37 = v36;
          uint64_t v39 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v38, (uint64_t)&v56, (uint64_t)v64, 16);
          if (v39)
          {
            uint64_t v43 = v39;
            uint64_t v44 = *(void *)v57;
            while (2)
            {
              for (uint64_t j = 0; j != v43; ++j)
              {
                if (*(void *)v57 != v44) {
                  objc_enumerationMutation(v37);
                }
                uint64_t v46 = objc_msgSend_capabilities(*(void **)(*((void *)&v56 + 1) + 8 * j), v40, v41, v42, v52);
                uint64_t v49 = objc_msgSend_valueForCapability_(v46, v47, v34, v48);

                if (v49)
                {

                  int v23 = 1;
                  char v16 = v53;
                  uint64_t v31 = v55;
                  goto LABEL_22;
                }
              }
              uint64_t v43 = objc_msgSend_countByEnumeratingWithState_objects_count_(v37, v40, (uint64_t)&v56, (uint64_t)v64, 16);
              if (v43) {
                continue;
              }
              break;
            }
          }

          uint64_t v31 = v55;
          uint64_t v33 = v52;
        }
        int v23 = 0;
        char v16 = v53;
        uint64_t v54 = objc_msgSend_countByEnumeratingWithState_objects_count_(v55, v50, (uint64_t)&v60, (uint64_t)v65, 16);
      }
      while (v54);
    }
    else
    {
      int v23 = 0;
    }
LABEL_22:
  }
  return v23 != 0;
}

- (BOOL)isSatelliteMessagingCompatible
{
  if ((objc_msgSend_isGroupChat(self, a2, v2, v3) & 1) != 0
    || (objc_msgSend_isReadOnly(self, v5, v6, v7) & 1) != 0
    || (objc_msgSend_hasLeftGroup(self, v8, v9, v10) & 1) != 0
    || (objc_msgSend_isBusinessChat(self, v11, v12, v13) & 1) != 0
    || (objc_msgSend_isStewieChat(self, v14, v15, v16) & 1) != 0)
  {
    return 0;
  }
  else
  {
    return objc_msgSend_isStewieSharingChat(self, v17, v18, v19) ^ 1;
  }
}

- (void)_refreshServiceForSendingWithDaemon
{
  uint64_t v2 = self;
  sub_1A4CA67C0();
}

- (BOOL)isChatBot
{
  uint64_t v2 = self;
  char v3 = sub_1A4CAC9FC();

  return v3 & 1;
}

- (id)persistentMenu
{
  uint64_t v2 = self;
  id v3 = [(IMChat *)v2 allChatProperties];
  if (v3 && (v4 = v3, v5 = sub_1A4CBB0AC(), v4, unint64_t v6 = sub_1A4CAE480(v5), swift_bridgeObjectRelease(), v6))
  {
    id v7 = objc_allocWithZone(MEMORY[0x1E4F6E8E8]);
    uint64_t v8 = sub_1A4CBB09C();
    swift_bridgeObjectRelease();
    id v9 = objc_msgSend(v7, sel_initWithDictionary_, v8);

    uint64_t v2 = (IMChat *)v8;
  }
  else
  {
    id v9 = 0;
  }

  return v9;
}

- (BOOL)isLastMessageTypingIndicator
{
  uint64_t v2 = self;
  id v3 = [(IMChat *)v2 lastMessage];
  if (v3)
  {
    int v4 = v3;
    unsigned __int8 v5 = [(IMMessage *)v3 isTypingMessage];
    unsigned __int8 v6 = [(IMMessage *)v4 isFromMe];

    return v5 & (v6 ^ 1);
  }
  else
  {

    return 0;
  }
}

@end