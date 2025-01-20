@interface CKConversation
+ (BOOL)_iMessage_canAcceptMediaObjectType:(int)a3 givenMediaObjects:(id)a4;
+ (BOOL)_iMessage_canSendComposition:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5 currentService:(id)a6 forceSMS:(BOOL)a7 error:(id *)a8;
+ (BOOL)_iMessage_canSendMessageWithMediaObjectTypes:(int *)a3;
+ (BOOL)_iMessage_canSendMessageWithMediaObjectTypes:(int *)a3 errorCode:(int64_t *)a4;
+ (BOOL)_rcs_canSendComposition:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5 recipientsContainEmail:(BOOL)a6 error:(id *)a7;
+ (BOOL)_sms_canAcceptMediaObjectType:(int)a3 givenMediaObjects:(id)a4 phoneNumber:(id)a5 simID:(id)a6;
+ (BOOL)_sms_canSendComposition:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5 recipientsContainEmail:(BOOL)a6 error:(id *)a7;
+ (BOOL)_sms_canSendComposition:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5 recipientsContainEmail:(BOOL)a6 skipMMSCheck:(BOOL)a7 error:(id *)a8;
+ (BOOL)_sms_canSendMessageWithMediaObjectTypes:(int *)a3 phoneNumber:(id)a4 simID:(id)a5;
+ (BOOL)_sms_canSendMessageWithMediaObjectTypes:(int *)a3 phoneNumber:(id)a4 simID:(id)a5 errorCode:(int64_t *)a6;
+ (BOOL)_sms_mediaObjectPassesDurationCheck:(id)a3;
+ (BOOL)_sms_mediaObjectPassesRestriction:(id)a3;
+ (BOOL)isSMSSpamFilteringEnabled;
+ (NSArray)writableTypeIdentifiersForItemProvider;
+ (double)_iMessage_maxTrimDurationForMediaType:(int)a3;
+ (double)_sms_maxTrimDurationForMediaType:(int)a3;
+ (id)_iMessage_localizedErrorForReason:(int64_t)a3;
+ (id)_sms_localizedErrorForReason:(int64_t)a3;
+ (id)conversationForAddresses:(id)a3 allowRetargeting:(BOOL)a4 candidateConversation:(id)a5;
+ (id)conversationForContacts:(id)a3 candidateConversation:(id)a4;
+ (id)newPendingConversation;
+ (int64_t)_iMessage_maxAttachmentCount;
+ (int64_t)_sms_maxAttachmentCountForPhoneNumber:(id)a3 simID:(id)a4;
+ (unint64_t)_iMessage_maxTransferFileSizeForWiFi:(BOOL)a3;
- (BOOL)_allowedByScreenTime;
- (BOOL)_allowedToSendTypingIndicators;
- (BOOL)_chatHasValidUnreadMessageToLoad;
- (BOOL)_contactsForVisualIdentityHaveKeys:(id)a3;
- (BOOL)_earlyReturnHistoryLoad;
- (BOOL)_handleIsForThisConversation:(id)a3;
- (BOOL)_iMessage_canSendToRecipients:(id)a3 alertIfUnable:(BOOL)a4;
- (BOOL)_iMessage_supportsCharacterCountForAddresses:(id)a3;
- (BOOL)_isOTPChatBotRelayChat;
- (BOOL)_isSendButtonDisabledForCarrierMessaging;
- (BOOL)_sms_canSendToRecipients:(id)a3 alertIfUnable:(BOOL)a4;
- (BOOL)_sms_supportsCharacterCountForAddresses:(id)a3;
- (BOOL)_sms_willSendMMSByDefaultForAddresses:(id)a3;
- (BOOL)_unknownFilteringEnabled;
- (BOOL)allowedByPersonListInActiveFocus;
- (BOOL)allowsMentions;
- (BOOL)canAcceptMediaObjectType:(int)a3 givenMediaObjects:(id)a4;
- (BOOL)canInsertMoreRecipients;
- (BOOL)canLeave;
- (BOOL)canMuteStateBeToggled;
- (BOOL)canReadStateBeToggled;
- (BOOL)canReplyToChatItem:(id)a3;
- (BOOL)canSendComposition:(id)a3 error:(id *)a4;
- (BOOL)canSendComposition:(id)a3 forCapabilities:(unint64_t)a4 error:(id *)a5;
- (BOOL)canSendToRecipients:(id)a3 alertIfUnable:(BOOL)a4;
- (BOOL)completedInitialChatMessagesLoad;
- (BOOL)containsHandleWithUID:(id)a3;
- (BOOL)deletingIncomingMessages;
- (BOOL)forceMMS;
- (BOOL)hasCachedWantsLabelForDSDS;
- (BOOL)hasCancellableScheduledMessage;
- (BOOL)hasDisplayName;
- (BOOL)hasKnownParticipants;
- (BOOL)hasLeft;
- (BOOL)hasLeftGroupChat;
- (BOOL)hasLoadedFromSpotlight;
- (BOOL)hasReplyEnabled;
- (BOOL)hasSetWasKnownSender;
- (BOOL)hasUnreadMessages;
- (BOOL)hasVerifiedBusiness;
- (BOOL)isAdHocGroupConversation;
- (BOOL)isAppleConversation;
- (BOOL)isAutoDonatingMessages;
- (BOOL)isBlockedByCommunicationLimits;
- (BOOL)isBusinessChatDisabled;
- (BOOL)isBusinessConversation;
- (BOOL)isChatBot;
- (BOOL)isCurrentlyPlayingAudio;
- (BOOL)isDeletingIncomingMessages;
- (BOOL)isDowngraded;
- (BOOL)isEmergencyTranscriptSharingConversation;
- (BOOL)isGroupConversation;
- (BOOL)isIgnoringTypingUpdates;
- (BOOL)isKnownSender;
- (BOOL)isMakoConversation;
- (BOOL)isMapKitBusinessConversation;
- (BOOL)isMuted;
- (BOOL)isPending;
- (BOOL)isPinned;
- (BOOL)isPlaceholder;
- (BOOL)isPreviewTextForAttachment;
- (BOOL)isReadOnlyChat;
- (BOOL)isReportedAsSpam;
- (BOOL)isSatelliteSendingService;
- (BOOL)isStewieConversation;
- (BOOL)isToEmailAddress;
- (BOOL)isUserDeletable;
- (BOOL)isWithMyself;
- (BOOL)localUserIsRecording;
- (BOOL)localUserIsTyping;
- (BOOL)needsReload;
- (BOOL)needsUpdatedContactsForVisualIdentity;
- (BOOL)needsUpdatedGroupNameForVisualIdentity;
- (BOOL)needsUpdatedGroupPhotoForVisualIdentity;
- (BOOL)noAvailableServices;
- (BOOL)shouldElevateCheckIn;
- (BOOL)shouldHaveRoundRectAvatar;
- (BOOL)shouldHoldInUnreadFilter;
- (BOOL)shouldPresentSpamReasonPicker;
- (BOOL)shouldReloadPreviewTextForGeneratedAdaptiveImageGlyphWithFileTransferGUID:(id)a3;
- (BOOL)shouldSendReadReceipts;
- (BOOL)shouldShowAutoDonationAction;
- (BOOL)shouldShowCharacterCount;
- (BOOL)shouldShowGroupNameUpdateBanner;
- (BOOL)shouldShowGroupPhotoUpdateBanner;
- (BOOL)shouldShowVerifiedCheckmark;
- (BOOL)supportsDeleteAndBlockGroup;
- (BOOL)supportsInlineAdaptiveImageGlyphs;
- (BOOL)supportsMessageEditing;
- (BOOL)supportsMutatingGroupIdentity;
- (BOOL)supportsMutatingGroupMembers;
- (BOOL)supportsSafetyMonitor;
- (BOOL)supportsSendLater;
- (BOOL)supportsSurf;
- (BOOL)supportsWaldo;
- (BOOL)suppressesMutationsFromLocalDevice;
- (BOOL)wantsLabelForDSDS;
- (BOOL)wantsLabelForDSDSCached;
- (BOOL)wasKnownSender;
- (CKComposition)unsentComposition;
- (CKConversation)init;
- (CKConversation)initWithChat:(id)a3;
- (CKEntity)recipient;
- (CKVisualGroupIdentity)_conversationVisualIdentity;
- (IMChat)chat;
- (IMHandle)businessHandle;
- (IMService)sendingService;
- (NSArray)frequentReplies;
- (NSArray)handles;
- (NSArray)pendingEntities;
- (NSArray)pendingHandles;
- (NSArray)recipientStrings;
- (NSArray)recipients;
- (NSAttributedString)groupName;
- (NSAttributedString)previewText;
- (NSDate)dateLastViewed;
- (NSNumber)businessConversation;
- (NSNumber)chatBot;
- (NSNumber)mapKitBusinessConversation;
- (NSSet)mergedPinningIdentifiers;
- (NSSet)pendingRecipients;
- (NSSet)recipientNames;
- (NSString)chatbotURI;
- (NSString)conversationListCollectionViewJunkItemIdentifier;
- (NSString)conversationListCollectionViewListItemIdentifier;
- (NSString)conversationListCollectionViewPinnedItemIdentifier;
- (NSString)conversationListCollectionViewRecentlyDeletedListItemIdentifier;
- (NSString)deviceIndependentID;
- (NSString)displayName;
- (NSString)fallbackSendString;
- (NSString)groupID;
- (NSString)groupIdentityUpdateHandleID;
- (NSString)lastAddressedHandle;
- (NSString)lastAddressedSIMID;
- (NSString)localUserIsComposing;
- (NSString)name;
- (NSString)pinningIdentifier;
- (NSString)rawAddressedName;
- (NSString)searchDisplayName;
- (NSString)selectedLastAddressedHandle;
- (NSString)selectedLastAddressedSIMID;
- (NSString)senderIdentifier;
- (NSString)serviceDisplayName;
- (char)buttonColor;
- (char)outgoingBubbleColor;
- (char)sendButtonColor;
- (double)maxTrimDurationForMedia:(id)a3;
- (id)_backwardCompatabilityTextForEditedMessagePartText:(id)a3;
- (id)_contactsForVisualIdentityWithKeys:(id)a3 numberOfContacts:(unint64_t)a4;
- (id)_conversationList;
- (id)_groupPhotoFileURL;
- (id)_headerTitleForPendingMediaObjects:(id)a3 subject:(id)a4 onService:(id)a5;
- (id)_headerTitleForService:(id)a3 shouldListParticipants:(BOOL)a4;
- (id)_nameForHandle:(id)a3;
- (id)acquireHandleStatusObservationAssertion;
- (id)activityForNewScene;
- (id)activityForNewSceneCreatedViaDrag:(BOOL)a3;
- (id)carPlayMessageListItemWithTraitCollection:(id)a3 dateFormatter:(id)a4 timeFormatter:(id)a5 avatarImageRenderer:(id)a6;
- (id)contactNameByHandle;
- (id)conversationVisualIdentityWithKeys:(id)a3 requestedNumberOfContactsToFetch:(unint64_t)a4;
- (id)copyForPendingConversation;
- (id)date;
- (id)displayNameForDisplayContext:(int64_t)a3;
- (id)displayNameForMediaObjects:(id)a3 subject:(id)a4 shouldListParticipants:(BOOL)a5;
- (id)ensureMessageWithGUIDIsLoaded:(id)a3;
- (id)entityMatchingHandle:(id)a3;
- (id)fastPreviewTextIgnoringPluginContent;
- (id)groupPhotoData;
- (id)groupPhotoFileTransfer;
- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4;
- (id)messageWithComposition:(id)a3;
- (id)messagesFromComposition:(id)a3;
- (id)nameWithRawAddresses:(BOOL)a3;
- (id)orderedContactsForAvatar3DTouchUIWithKeysToFetch:(id)a3;
- (id)orderedContactsForAvatarView;
- (id)orderedContactsWithMaxCount:(unint64_t)a3 keysToFetch:(id)a4;
- (id)pinnedConversationDisplayNamePreferringShortName:(BOOL)a3;
- (id)recipientEmailAddresses;
- (id)recipientPhoneNumbers;
- (id)recipientsSortedByIsContact:(BOOL)a3 alphabetically:(BOOL)a4;
- (id)renderedAvatarImageWithSize:(CGSize)a3;
- (id)renderedAvatarImageWithSize:(CGSize)a3 traitCollection:(id)a4;
- (id)renderedAvatarImageWithSize:(CGSize)a3 traitCollection:(id)a4 avatarImageRenderer:(id)a5;
- (id)sendingServiceImpl;
- (id)shortDescription;
- (id)sortedHandles;
- (id)uniqueIdentifier;
- (int)wasDetectedAsSMSCategory;
- (int)wasDetectedAsSMSSpam;
- (int)wasDetectedAsSpam;
- (int)wasDetectedAsiMessageSpam;
- (int64_t)compareBySequenceNumberAndDateDescending:(id)a3;
- (int64_t)maximumRecipientsForSendingService;
- (int64_t)spamCategory;
- (int64_t)spamSubCategory;
- (unint64_t)disclosureAtomStyle;
- (unint64_t)recipientCount;
- (unint64_t)unreadCount;
- (unsigned)limitToLoad;
- (void)_chatItemsDidChange:(id)a3;
- (void)_chatPropertiesChanged:(id)a3;
- (void)_clearTypingIndicatorsIfNecessary;
- (void)_createConversationVisualIdentityWithKeys:(id)a3 numberOfContacts:(unint64_t)a4;
- (void)_deleteAllMessagesAndRemoveGroup:(BOOL)a3;
- (void)_handleChatJoinStateDidChange:(id)a3;
- (void)_handleChatParticipantsDidChange:(id)a3;
- (void)_handleEngroupFinishedUpdating:(id)a3;
- (void)_handleLazuliCapabilitiesUpdatedNotification:(id)a3;
- (void)_handlePreferredServiceChangedNotification:(id)a3;
- (void)_invalidateApplicationSnapshotIfNeeded;
- (void)_setProofReadingInfoForChat:(id)a3 withMessage:(id)a4;
- (void)_updateContactsForVisualIdentityWithKeys:(id)a3 numberOfContacts:(unint64_t)a4;
- (void)_updateGroupNameForVisualIdentity;
- (void)_updateGroupPhotoForVisualIdentity;
- (void)acceptTransfer:(id)a3;
- (void)addRecipientHandles:(id)a3;
- (void)canShareFocusStatusWithCompletion:(id)a3;
- (void)clearConversationLoadFromSpotlight;
- (void)dealloc;
- (void)deleteAllMessages;
- (void)deleteAllMessagesAndRemoveGroup;
- (void)deleteBrandLogos;
- (void)didBecomeActive;
- (void)editMessageItem:(id)a3 partIndex:(int64_t)a4 withNewComposition:(id)a5;
- (void)enumerateMessagesWithOptions:(unint64_t)a3 usingBlock:(id)a4;
- (void)fetchAllMessages:(id)a3;
- (void)fetchIncomingPendingMessagesOverSatellite;
- (void)fetchMoreMessages:(id)a3;
- (void)fetchMoreMessagesAfterLastMessage:(id)a3;
- (void)fetchMoreMessagesBeforeFirstMessage:(id)a3;
- (void)fetchOldestMessageDateWithCompletion:(id)a3;
- (void)fetchSuggestedNameIfNecessary;
- (void)isInvitedToViewMyFocusStatusWithCompletion:(id)a3;
- (void)leave;
- (void)loadAllMessages;
- (void)loadAllUnreadMessagesUpToMessageGUID:(id)a3;
- (void)loadFrequentReplies;
- (void)loadMoreMessages;
- (void)loadMoreMessagesAfterLastMessage;
- (void)loadMoreMessagesBeforeFirstMessage;
- (void)markAllMessagesAsRead;
- (void)markLastMessageAsUnread;
- (void)messageHistoryForDateInterval:(id)a3 completion:(id)a4;
- (void)prepareForRecoverableDeletionWithDeleteDate:(id)a3;
- (void)recoverableDeleteAllMessagesGivenDeleteDate:(id)a3;
- (void)refreshServiceForSending;
- (void)reloadIfNeeded;
- (void)removeRecipientHandles:(id)a3;
- (void)repositionSticker:(id)a3 associatedChatItem:(id)a4;
- (void)resendEditedMessageItem:(id)a3 forPartIndex:(int64_t)a4;
- (void)resetCaches;
- (void)resetNameCaches;
- (void)resortMessagesIfNecessary;
- (void)retractMessagePart:(id)a3;
- (void)retractScheduledMessageParts:(id)a3 fromAggregateChatItem:(id)a4;
- (void)retrieveLocalFileURLForTransferGUID:(id)a3;
- (void)retryMessage:(id)a3 onService:(id)a4;
- (void)sendAutoDonationUpdate:(BOOL)a3;
- (void)sendMessage:(id)a3 newComposition:(BOOL)a4;
- (void)sendMessage:(id)a3 onService:(id)a4 newComposition:(BOOL)a5;
- (void)sendPendingSatelliteMessages;
- (void)senderIdentifier;
- (void)setAllowedByPersonListInActiveFocus:(BOOL)a3;
- (void)setBusinessConversation:(id)a3;
- (void)setBusinessHandle:(id)a3;
- (void)setChat:(id)a3;
- (void)setChatBot:(id)a3;
- (void)setCompletedInitialChatMessagesLoad:(BOOL)a3;
- (void)setConversationListCollectionViewJunkItemIdentifier:(id)a3;
- (void)setConversationListCollectionViewListItemIdentifier:(id)a3;
- (void)setConversationListCollectionViewPinnedItemIdentifier:(id)a3;
- (void)setConversationListCollectionViewRecentlyDeletedListItemIdentifier:(id)a3;
- (void)setCurrentlyPlayingAudio:(BOOL)a3;
- (void)setDateLastViewed:(id)a3;
- (void)setDisplayName:(id)a3;
- (void)setElevateCheckIn:(BOOL)a3;
- (void)setForceMMS:(BOOL)a3;
- (void)setGroupIdentityUpdateHandleID:(id)a3;
- (void)setHasCachedWantsLabelForDSDS:(BOOL)a3;
- (void)setHasSetWasKnownSender:(BOOL)a3;
- (void)setHoldInUnreadFilter:(BOOL)a3;
- (void)setIgnoringTypingUpdates:(BOOL)a3;
- (void)setIsReportedAsSpam:(BOOL)a3;
- (void)setLimitToLoad:(unsigned int)a3;
- (void)setLoadedMessageCount:(unint64_t)a3;
- (void)setLoadedMessageCount:(unint64_t)a3 loadImmediately:(BOOL)a4;
- (void)setLocalUserIsComposing:(id)a3;
- (void)setLocalUserIsComposing:(id)a3 typingIndicatorIcon:(id)a4;
- (void)setLocalUserIsRecording:(BOOL)a3;
- (void)setLocalUserIsTyping:(BOOL)a3;
- (void)setMapKitBusinessConversation:(id)a3;
- (void)setMutedUntilDate:(id)a3;
- (void)setName:(id)a3;
- (void)setNeedsReload;
- (void)setNeedsUpdatedContactOrderForVisualIdentity;
- (void)setNeedsUpdatedContactsForVisualIdentity:(BOOL)a3;
- (void)setNeedsUpdatedGroupNameForVisualIdentity;
- (void)setNeedsUpdatedGroupNameForVisualIdentity:(BOOL)a3;
- (void)setNeedsUpdatedGroupPhotoForVisualIdentity;
- (void)setNeedsUpdatedGroupPhotoForVisualIdentity:(BOOL)a3;
- (void)setPendingComposeRecipients:(id)a3;
- (void)setPendingHandles:(id)a3;
- (void)setPendingRecipients:(id)a3;
- (void)setPreviewText:(id)a3;
- (void)setRecipients:(id)a3;
- (void)setSelectedLastAddressedHandle:(id)a3;
- (void)setSelectedLastAddressedSIMID:(id)a3;
- (void)setSendReadReceipts:(BOOL)a3;
- (void)setShouldShowGroupNameUpdateBanner:(BOOL)a3;
- (void)setShouldShowGroupPhotoUpdateBanner:(BOOL)a3;
- (void)setUnsentComposition:(id)a3;
- (void)setWantsLabelForDSDSCached:(BOOL)a3;
- (void)setWasDetectedAsSMSCategory:(int)a3;
- (void)setWasDetectedAsSMSSpam:(int)a3;
- (void)setWasDetectedAsSpam:(int)a3;
- (void)setWasDetectedAsiMessageSpam:(int)a3;
- (void)setWasKnownSender:(BOOL)a3;
- (void)set_conversationVisualIdentity:(id)a3;
- (void)unmute;
- (void)updateConversationVisualIdentityDisplayNameWithSender:(id)a3;
- (void)updateConversationVisualIdentityGroupPhotoWithSender:(id)a3;
- (void)updateDeletingIncomingMessages:(BOOL)a3;
- (void)updateDisplayNameIfSMSSpam;
- (void)updateKeyTransparencyStatusForChatParticipantsDidChange:(id)a3;
- (void)updateLastViewedDate;
- (void)updateUnsentCompositionByAppendingComposition:(id)a3;
- (void)updateUserActivity;
- (void)updateWasKnownSender;
- (void)willBecomeInactive;
@end

@implementation CKConversation

- (id)uniqueIdentifier
{
  v2 = NSString;
  v3 = [(CKConversation *)self groupID];
  v4 = [v2 stringWithFormat:@"%@", v3];

  return v4;
}

- (NSString)groupID
{
  v2 = [(CKConversation *)self chat];
  v3 = [v2 persistentID];

  return (NSString *)v3;
}

- (int)wasDetectedAsiMessageSpam
{
  v3 = [(CKConversation *)self chat];
  v4 = [v3 valueForChatProperty:*MEMORY[0x1E4F6BE78]];
  self->_wasDetectedAsiMessageSpam = [v4 intValue];

  return self->_wasDetectedAsiMessageSpam;
}

- (int64_t)compareBySequenceNumberAndDateDescending:(id)a3
{
  v4 = a3;
  v5 = [v4 date];
  v6 = [(CKConversation *)self date];
  int64_t v7 = [v5 compare:v6];

  if (!v7) {
    int64_t v7 = [(IMChat *)self->_chat compareChatByLastFinishedMessageDate:v4[7]];
  }

  return v7;
}

- (id)date
{
  v2 = [(CKConversation *)self chat];
  v3 = objc_msgSend(v2, "__ck_watermarkDate");
  v4 = [v2 lastTUConversationCreatedDate];
  v5 = [v2 lastScheduledMessageCreatedDate];
  v6 = [v2 lastFinishedMessageDate];
  if (v3)
  {
    uint64_t v7 = [v3 laterDate:v6];

    v6 = (void *)v7;
  }
  if (v4)
  {
    uint64_t v8 = [v6 laterDate:v4];

    v6 = (void *)v8;
  }
  if (v5)
  {
    uint64_t v9 = [v6 laterDate:v5];

    v6 = (void *)v9;
  }

  return v6;
}

- (IMChat)chat
{
  return self->_chat;
}

- (int)wasDetectedAsSpam
{
  int v3 = [(CKConversation *)self wasDetectedAsSMSSpam];
  return [(CKConversation *)self wasDetectedAsiMessageSpam] | v3;
}

- (int)wasDetectedAsSMSSpam
{
  int v3 = [(CKConversation *)self chat];
  self->_wasDetectedAsSMSSpam = [v3 wasDetectedAsSMSSpam];

  return self->_wasDetectedAsSMSSpam;
}

- (BOOL)wantsLabelForDSDS
{
  if (+[CKApplicationState isResizing]
    && [(CKConversation *)self hasCachedWantsLabelForDSDS])
  {
    return [(CKConversation *)self wantsLabelForDSDSCached];
  }
  else if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    v4 = [(CKConversation *)self sendingService];
    char v5 = objc_msgSend(v4, "__ck_isCarrierBased");

    [(CKConversation *)self setWantsLabelForDSDSCached:1];
    [(CKConversation *)self setHasCachedWantsLabelForDSDS:1];
    return v5;
  }
  else
  {
    [(CKConversation *)self setWantsLabelForDSDSCached:0];
    [(CKConversation *)self setHasCachedWantsLabelForDSDS:1];
    return 0;
  }
}

- (void)setWantsLabelForDSDSCached:(BOOL)a3
{
  self->_wantsLabelForDSDSCached = a3;
}

- (void)setHasCachedWantsLabelForDSDS:(BOOL)a3
{
  self->_hasCachedWantsLabelForDSDS = a3;
}

- (NSAttributedString)previewText
{
  previewText = self->_previewText;
  if (!previewText)
  {
    v4 = [(CKConversation *)self chat];
    char v5 = [v4 lastFinishedMessageItem];
    if ([v5 isCorrupt])
    {
      id v6 = objc_alloc(MEMORY[0x1E4F28B18]);
      uint64_t v7 = CKFrameworkBundle();
      uint64_t v8 = [v7 localizedStringForKey:@"CORRUPT_MESSAGE_FALLBACK_TEXT" value:&stru_1EDE4CA38 table:@"ChatKit"];
      uint64_t v9 = (NSAttributedString *)[v6 initWithString:v8];
      v10 = self->_previewText;
      self->_previewText = v9;
    }
    else
    {
      uint64_t v7 = [v4 lastFinishedMessage];
      objc_msgSend(v7, "__ck_previewTextWithChat:ignorePluginContent:", v4, 0);
      v11 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
      uint64_t v8 = self->_previewText;
      self->_previewText = v11;
    }

    previewText = self->_previewText;
  }

  return previewText;
}

- (CKConversation)initWithChat:(id)a3
{
  id v4 = a3;
  char v5 = [(CKConversation *)self init];
  id v6 = v5;
  if (v5) {
    [(CKConversation *)v5 setChat:v4];
  }

  return v6;
}

- (void)setChat:(id)a3
{
}

- (void)fetchSuggestedNameIfNecessary
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (![(CKConversation *)self isBusinessConversation])
  {
    long long v11 = 0u;
    long long v12 = 0u;
    long long v9 = 0u;
    long long v10 = 0u;
    int v3 = [(CKConversation *)self recipients];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v10;
      do
      {
        uint64_t v7 = 0;
        do
        {
          if (*(void *)v10 != v6) {
            objc_enumerationMutation(v3);
          }
          uint64_t v8 = [*(id *)(*((void *)&v9 + 1) + 8 * v7) defaultIMHandle];
          [v8 scheduleSuggestedNameFetchIfNecessary];

          ++v7;
        }
        while (v5 != v7);
        uint64_t v5 = [v3 countByEnumeratingWithState:&v9 objects:v13 count:16];
      }
      while (v5);
    }
  }
}

uint64_t __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke_2(uint64_t a1, void *a2)
{
  int v3 = [a2 defaultIMHandle];
  uint64_t v4 = [*(id *)(a1 + 32) sender];
  uint64_t v5 = [v3 matchesIMHandle:v4];

  return v5;
}

- (unint64_t)recipientCount
{
  v2 = [(CKConversation *)self recipients];
  unint64_t v3 = [v2 count];

  return v3;
}

- (NSArray)recipients
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  recipients = self->_recipients;
  if (!recipients)
  {
    uint64_t v4 = [(CKConversation *)self chat];

    if (v4)
    {
      uint64_t v5 = [(CKConversation *)self chat];
      uint64_t v6 = [v5 participants];
      uint64_t v7 = (void *)[v6 copy];
    }
    else
    {
      uint64_t v5 = [(CKConversation *)self pendingHandles];
      uint64_t v7 = (void *)[v5 copy];
    }

    uint64_t v8 = (NSArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v21 != v12) {
            objc_enumerationMutation(v9);
          }
          uint64_t v14 = *(void *)(*((void *)&v20 + 1) + 8 * i);
          v15 = [CKEntity alloc];
          v16 = [(CKConversation *)self chat];
          v17 = [(CKEntity *)v15 initWithChat:v16 imHandle:v14];

          [(NSArray *)v8 addObject:v17];
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v20 objects:v24 count:16];
      }
      while (v11);
    }

    v18 = self->_recipients;
    self->_recipients = v8;

    recipients = self->_recipients;
  }

  return recipients;
}

- (CKConversation)init
{
  v6.receiver = self;
  v6.super_class = (Class)CKConversation;
  v2 = [(CKConversation *)&v6 init];
  unint64_t v3 = v2;
  if (v2)
  {
    v2->_limitToLoad = 1;
    uint64_t v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v4 addObserver:v3 selector:sel__handleLazuliCapabilitiesUpdatedNotification_ name:*MEMORY[0x1E4F6B8B8] object:0];
  }
  return v3;
}

- (id)nameWithRawAddresses:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  uint64_t v5 = [(CKConversation *)self recipients];

  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      objc_super v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = [(IMChat *)self->_chat guid];
        int v13 = 138412290;
        uint64_t v14 = v7;
        _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Determining conversation name for chat guid: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    uint64_t v8 = [(IMChat *)self->_chat displayNameWithRawAddress:v3 isSpamFilteringEnabled:+[CKConversation isSMSSpamFilteringEnabled]];
    id v9 = (NSString *)[v8 copy];
    name = self->_name;
    self->_name = v9;
  }
  uint64_t v11 = self->_name;

  return v11;
}

+ (BOOL)isSMSSpamFilteringEnabled
{
  return CKMessageSpamFilteringEnabled() != 0;
}

- (NSString)conversationListCollectionViewListItemIdentifier
{
  conversationListCollectionViewListItemIdentifier = self->_conversationListCollectionViewListItemIdentifier;
  if (!conversationListCollectionViewListItemIdentifier)
  {
    uint64_t v4 = [(CKConversation *)self chat];
    uint64_t v5 = [v4 guid];
    objc_super v6 = (void *)v5;
    uint64_t v7 = &stru_1EDE4CA38;
    if (v5) {
      uint64_t v7 = (__CFString *)v5;
    }
    uint64_t v8 = v7;

    id v9 = [@"list-" stringByAppendingString:v8];

    uint64_t v10 = self->_conversationListCollectionViewListItemIdentifier;
    self->_conversationListCollectionViewListItemIdentifier = v9;

    conversationListCollectionViewListItemIdentifier = self->_conversationListCollectionViewListItemIdentifier;
  }

  return conversationListCollectionViewListItemIdentifier;
}

- (NSString)name
{
  return (NSString *)[(CKConversation *)self nameWithRawAddresses:0];
}

- (id)orderedContactsWithMaxCount:(unint64_t)a3 keysToFetch:(id)a4
{
  unint64_t v34 = a3;
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v5 = a4;
  objc_super v6 = [(CKConversation *)self recipients];
  if ([v6 count])
  {
    uint64_t v7 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v8 = [v7 isTranscriptSharingEnabled];

    if (v8)
    {
      id v9 = [(CKConversation *)self chat];
      int v10 = [v9 isStewieSharingChat];

      if (v10)
      {
        uint64_t v11 = [MEMORY[0x1E4F1CA48] array];
        long long v54 = 0u;
        long long v55 = 0u;
        long long v52 = 0u;
        long long v53 = 0u;
        id v12 = v6;
        uint64_t v13 = [v12 countByEnumeratingWithState:&v52 objects:v62 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v53;
          while (2)
          {
            for (uint64_t i = 0; i != v13; ++i)
            {
              if (*(void *)v53 != v14) {
                objc_enumerationMutation(v12);
              }
              v16 = *(void **)(*((void *)&v52 + 1) + 8 * i);
              v17 = objc_msgSend(v16, "defaultIMHandle", v34);
              int v18 = [v17 isStewieTranscriptSharingHandle];

              if (v18)
              {
                [v11 addObject:v16];
                goto LABEL_19;
              }
            }
            uint64_t v13 = [v12 countByEnumeratingWithState:&v52 objects:v62 count:16];
            if (v13) {
              continue;
            }
            break;
          }
        }
LABEL_19:

        objc_super v6 = (void *)[v11 copy];
      }
    }
    if (objc_msgSend(v6, "count", v34) == 1)
    {
      long long v22 = [v6 firstObject];
      long long v23 = [v22 cnContactWithKeys:v5];

      if (v23)
      {
        v61 = v23;
        id v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v61 count:1];
      }
      else
      {
        id v24 = 0;
      }
    }
    else
    {
      *(void *)&long long buf = 0;
      *((void *)&buf + 1) = &buf;
      uint64_t v57 = 0x3032000000;
      v58 = __Block_byref_object_copy__32;
      v59 = __Block_byref_object_dispose__32;
      id v60 = 0;
      id v60 = [MEMORY[0x1E4F1CA48] array];
      v50[0] = 0;
      v50[1] = v50;
      v50[2] = 0x3032000000;
      v50[3] = __Block_byref_object_copy__32;
      v50[4] = __Block_byref_object_dispose__32;
      id v51 = 0;
      id v51 = [MEMORY[0x1E4F1CA48] array];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke;
      aBlock[3] = &unk_1E5626F28;
      id v25 = v6;
      id v46 = v25;
      v48 = v50;
      id v26 = v5;
      id v47 = v26;
      p_long long buf = &buf;
      v27 = _Block_copy(aBlock);
      if ([(CKConversation *)self completedInitialChatMessagesLoad])
      {
        v28 = [(CKConversation *)self chat];
        v29 = [v28 chatItems];
        v41[0] = MEMORY[0x1E4F143A8];
        v41[1] = 3221225472;
        v41[2] = __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke_3;
        v41[3] = &unk_1E5626F50;
        id v42 = v27;
        v43 = &buf;
        unint64_t v44 = v35;
        [v29 enumerateMessagesWithOptions:2 usingBlock:v41];

        v30 = v42;
      }
      else
      {
        v31 = [(CKConversation *)self chat];
        v30 = [v31 lastIncomingFinishedMessage];

        if (v30) {
          (*((void (**)(void *, void *))v27 + 2))(v27, v30);
        }
      }

      unint64_t v32 = [*(id *)(*((void *)&buf + 1) + 40) count];
      if (v32 < [v25 count] && objc_msgSend(*(id *)(*((void *)&buf + 1) + 40), "count") < v35)
      {
        v36[0] = MEMORY[0x1E4F143A8];
        v36[1] = 3221225472;
        v36[2] = __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke_4;
        v36[3] = &unk_1E5626F78;
        v38 = v50;
        id v37 = v26;
        v39 = &buf;
        unint64_t v40 = v35;
        [v25 enumerateObjectsUsingBlock:v36];
      }
      id v24 = *(id *)(*((void *)&buf + 1) + 40);

      _Block_object_dispose(v50, 8);
      _Block_object_dispose(&buf, 8);
    }
    id v21 = v24;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        long long v20 = [(CKConversation *)self chat];
        LODWORD(buf) = 138412290;
        *(void *)((char *)&buf + 4) = v20;
        _os_log_impl(&dword_18EF18000, v19, OS_LOG_TYPE_INFO, "No recipients found for chat %@", (uint8_t *)&buf, 0xCu);
      }
    }
    id v21 = 0;
  }

  return v21;
}

- (BOOL)hasDisplayName
{
  BOOL v3 = [(CKConversation *)self displayName];
  if (v3)
  {
    uint64_t v4 = [(CKConversation *)self displayName];
    int v5 = [v4 isEqualToString:&stru_1EDE4CA38] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }

  return v5;
}

- (NSString)displayName
{
  BOOL v3 = [(CKConversation *)self chat];
  uint64_t v4 = [v3 displayName];

  int v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isTranscriptSharingEnabled];

  if (v6)
  {
    uint64_t v7 = [(CKConversation *)self chat];
    int v8 = [v7 isStewieSharingChat];

    if (v8)
    {
      id v9 = NSString;
      int v10 = CKFrameworkBundle();
      uint64_t v11 = [v10 localizedStringForKey:@"TS_CONVERSATION_NAME" value:&stru_1EDE4CA38 table:@"TranscriptSharing-SYDROB_FEATURES"];
      id v12 = [(CKConversation *)self chat];
      uint64_t v13 = [v12 emergencyUserHandle];
      uint64_t v14 = [(CKConversation *)self chat];
      uint64_t v15 = [v13 displayNameForChat:v14];
      uint64_t v16 = objc_msgSend(v9, "localizedStringWithFormat:", v11, v15);

      uint64_t v4 = (void *)v16;
    }
  }

  return (NSString *)v4;
}

- (BOOL)hasVerifiedBusiness
{
  BOOL v3 = [(CKConversation *)self isBusinessConversation];
  if (v3)
  {
    uint64_t v4 = [(CKConversation *)self businessHandle];
    int v5 = [v4 brand];
    char v6 = [v5 isVerified];

    LOBYTE(v3) = v6;
  }
  return v3;
}

- (BOOL)isBusinessConversation
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  businessConversation = self->_businessConversation;
  if (!businessConversation)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    uint64_t v4 = [(CKConversation *)self handles];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v17;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v16 + 1) + 8 * v8) isBusiness])
          {
            int v9 = 1;
            goto LABEL_12;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v16 objects:v20 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    int v9 = 0;
LABEL_12:

    int v10 = [(CKConversation *)self chat];
    unsigned int v11 = [v10 isBusinessChat];

    BOOL v12 = [(CKConversation *)self _isOTPChatBotRelayChat];
    uint64_t v13 = [NSNumber numberWithBool:v12 | v9 | v11];
    uint64_t v14 = self->_businessConversation;
    self->_businessConversation = v13;

    businessConversation = self->_businessConversation;
  }
  return [(NSNumber *)businessConversation BOOLValue];
}

- (id)conversationVisualIdentityWithKeys:(id)a3 requestedNumberOfContactsToFetch:(unint64_t)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (!self->__conversationVisualIdentity)
  {
    [(CKConversation *)self _createConversationVisualIdentityWithKeys:v6 numberOfContacts:a4];
    [(CKConversation *)self setNeedsUpdatedContactsForVisualIdentity:0];
    [(CKConversation *)self setNeedsUpdatedGroupPhotoForVisualIdentity:0];
    [(CKConversation *)self setNeedsUpdatedGroupNameForVisualIdentity:0];
    goto LABEL_24;
  }
  if ([(CKConversation *)self needsUpdatedContactsForVisualIdentity]) {
    goto LABEL_3;
  }
  uint64_t v15 = [(CKVisualGroupIdentity *)self->__conversationVisualIdentity contacts];
  if ([v15 count] >= a4)
  {
  }
  else
  {
    long long v16 = [(CKVisualGroupIdentity *)self->__conversationVisualIdentity contacts];
    unint64_t v17 = [v16 count];
    long long v18 = [(CKConversation *)self recipients];
    unint64_t v19 = [v18 count];

    if (v17 < v19)
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_3:
        if (IMOSLoggingEnabled())
        {
          uint64_t v7 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
          {
            int v22 = 138412290;
            long long v23 = self;
            _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Updating contacts for conversationVisualIdentity on conversation %@", (uint8_t *)&v22, 0xCu);
          }
        }
        uint64_t v8 = [(CKVisualGroupIdentity *)self->__conversationVisualIdentity contacts];
        unint64_t v9 = [v8 count];

        if (v9 <= a4) {
          unint64_t v10 = a4;
        }
        else {
          unint64_t v10 = v9;
        }
        [(CKConversation *)self _updateContactsForVisualIdentityWithKeys:v6 numberOfContacts:v10];
        [(CKConversation *)self setNeedsUpdatedContactsForVisualIdentity:0];
        goto LABEL_11;
      }
      long long v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        uint64_t v21 = [(CKVisualGroupIdentity *)self->__conversationVisualIdentity contacts];
        int v22 = 134218498;
        long long v23 = (CKConversation *)[v21 count];
        __int16 v24 = 2048;
        unint64_t v25 = a4;
        __int16 v26 = 2112;
        v27 = self;
        _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Additional contacts needed for conversationVisualIdentity, had %ld, fetching %ld, conversation: %@", (uint8_t *)&v22, 0x20u);
      }
LABEL_30:

      goto LABEL_3;
    }
  }
  if (![(CKConversation *)self _contactsForVisualIdentityHaveKeys:v6])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_3;
    }
    long long v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      long long v23 = self;
      _os_log_impl(&dword_18EF18000, v20, OS_LOG_TYPE_INFO, "Contacts need additional keys for conversationVisualIdentity on conversation %@", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_30;
  }
LABEL_11:
  if ([(CKConversation *)self needsUpdatedGroupPhotoForVisualIdentity])
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412290;
        long long v23 = self;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Updating group photo for conversationVisualIdentity on conversation %@", (uint8_t *)&v22, 0xCu);
      }
    }
    [(CKConversation *)self _updateGroupPhotoForVisualIdentity];
    [(CKConversation *)self setNeedsUpdatedGroupPhotoForVisualIdentity:0];
  }
  if ([(CKConversation *)self needsUpdatedGroupNameForVisualIdentity])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412290;
        long long v23 = self;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Updating group name for conversationVisualIdentity on conversation %@", (uint8_t *)&v22, 0xCu);
      }
    }
    [(CKConversation *)self _updateGroupNameForVisualIdentity];
    [(CKConversation *)self setNeedsUpdatedGroupNameForVisualIdentity:0];
  }
LABEL_24:
  uint64_t v13 = self->__conversationVisualIdentity;

  return v13;
}

- (BOOL)shouldShowVerifiedCheckmark
{
  if ([(CKConversation *)self isChatBot]) {
    return 0;
  }

  return [(CKConversation *)self hasVerifiedBusiness];
}

- (BOOL)shouldHaveRoundRectAvatar
{
  if ([(CKConversation *)self isChatBot]) {
    return 1;
  }

  return [(CKConversation *)self isBusinessConversation];
}

- (BOOL)isChatBot
{
  chatBot = self->_chatBot;
  if (!chatBot)
  {
    uint64_t v4 = [(CKConversation *)self chat];
    if (v4)
    {
      uint64_t v5 = (void *)v4;
      id v6 = [(CKConversation *)self chat];
      int v7 = [v6 chatStyle];

      if (v7 != 45) {
        return 0;
      }
    }
    uint64_t v8 = [(CKConversation *)self handles];
    unint64_t v9 = [v8 firstObject];
    uint64_t v10 = [v9 isChatBot];

    unsigned int v11 = [NSNumber numberWithBool:v10];
    BOOL v12 = self->_chatBot;
    self->_chatBot = v11;

    chatBot = self->_chatBot;
  }

  return [(NSNumber *)chatBot BOOLValue];
}

- (BOOL)isMuted
{
  v2 = [(CKConversation *)self chat];
  char v3 = [v2 isMuted];

  return v3;
}

- (BOOL)isGroupConversation
{
  v2 = [(CKConversation *)self chat];
  char v3 = [v2 isGroupChat];

  return v3;
}

- (BOOL)isPlaceholder
{
  char v3 = [(CKConversation *)self chat];
  if ([v3 messageCount])
  {
    BOOL v4 = 0;
  }
  else
  {
    uint64_t v5 = [(CKConversation *)self chat];
    id v6 = [v5 lastMessage];
    if (v6)
    {
      BOOL v4 = 0;
    }
    else
    {
      int v7 = [(CKConversation *)self chat];
      uint64_t v8 = [v7 lastTUConversationCreatedDate];
      if (v8)
      {
        BOOL v4 = 0;
      }
      else
      {
        unint64_t v9 = [(CKConversation *)self chat];
        uint64_t v10 = [v9 lastScheduledMessageCreatedDate];
        BOOL v4 = v10 == 0;
      }
    }
  }
  return v4;
}

- (BOOL)hasUnreadMessages
{
  return [(CKConversation *)self unreadCount] != 0;
}

- (unint64_t)unreadCount
{
  return [(IMChat *)self->_chat unreadMessageCount];
}

- (BOOL)hasCancellableScheduledMessage
{
  v2 = [(CKConversation *)self chat];
  char v3 = [v2 hasCancellableScheduledMessage];

  return v3;
}

void __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke(uint64_t a1, void *a2)
{
  id v3 = a2;
  BOOL v4 = v3;
  if (v3)
  {
    uint64_t v5 = *(void **)(a1 + 32);
    v9[0] = MEMORY[0x1E4F143A8];
    v9[1] = 3221225472;
    v9[2] = __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke_2;
    v9[3] = &unk_1E5626F00;
    id v10 = v3;
    uint64_t v6 = [v5 indexOfObjectPassingTest:v9];
    if (v6 != 0x7FFFFFFFFFFFFFFFLL)
    {
      int v7 = [*(id *)(a1 + 32) objectAtIndex:v6];
      if (([*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) containsObject:v7] & 1) == 0)
      {
        uint64_t v8 = [v7 cnContactWithKeys:*(void *)(a1 + 40)];
        [*(id *)(*(void *)(*(void *)(a1 + 56) + 8) + 40) addObject:v8];
        [*(id *)(*(void *)(*(void *)(a1 + 48) + 8) + 40) addObject:v7];
      }
    }
  }
}

void __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke_4(void *a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v9 = a2;
  char v6 = [*(id *)(*(void *)(a1[5] + 8) + 40) containsObject:v9];
  int v7 = v9;
  if ((v6 & 1) == 0)
  {
    uint64_t v8 = [v9 cnContactWithKeys:a1[4]];
    [*(id *)(*(void *)(a1[6] + 8) + 40) addObject:v8];
    if ((unint64_t)[*(id *)(*(void *)(a1[6] + 8) + 40) count] >= a1[7]) {
      *a4 = 1;
    }

    int v7 = v9;
  }
}

- (id)orderedContactsForAvatarView
{
  return [(CKConversation *)self orderedContactsWithMaxCount:2 keysToFetch:MEMORY[0x1E4F1CBF0]];
}

- (BOOL)needsUpdatedGroupPhotoForVisualIdentity
{
  return self->_needsUpdatedGroupPhotoForVisualIdentity;
}

- (BOOL)needsUpdatedGroupNameForVisualIdentity
{
  return self->_needsUpdatedGroupNameForVisualIdentity;
}

- (BOOL)needsUpdatedContactsForVisualIdentity
{
  return self->_needsUpdatedContactsForVisualIdentity;
}

- (BOOL)_contactsForVisualIdentityHaveKeys:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKVisualGroupIdentity *)self->__conversationVisualIdentity contacts];
  if ([v4 count])
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v6 = v5;
    uint64_t v7 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v7)
    {
      uint64_t v8 = v7;
      uint64_t v9 = *(void *)v14;
      while (2)
      {
        for (uint64_t i = 0; i != v8; ++i)
        {
          if (*(void *)v14 != v9) {
            objc_enumerationMutation(v6);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "areKeysAvailable:", v4, (void)v13))
          {
            BOOL v11 = 0;
            goto LABEL_12;
          }
        }
        uint64_t v8 = [v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
    BOOL v11 = 1;
LABEL_12:
  }
  else
  {
    BOOL v11 = 1;
  }

  return v11;
}

- (void)setNeedsUpdatedGroupPhotoForVisualIdentity:(BOOL)a3
{
  self->_needsUpdatedGroupPhotoForVisualIdentity = a3;
}

- (void)setNeedsUpdatedGroupNameForVisualIdentity:(BOOL)a3
{
  self->_needsUpdatedGroupNameForVisualIdentity = a3;
}

- (void)setNeedsUpdatedContactsForVisualIdentity:(BOOL)a3
{
  self->_needsUpdatedContactsForVisualIdentity = a3;
}

- (BOOL)_isOTPChatBotRelayChat
{
  id v3 = [(CKConversation *)self chat];

  if (!v3) {
    return 0;
  }
  id v4 = [(CKConversation *)self chat];
  int v5 = [v4 chatStyle];

  if (v5 != 45
    || ![(CKConversation *)self isReadOnlyChat]
    || ![(CKConversation *)self hasDisplayName])
  {
    return 0;
  }
  id v6 = [(CKConversation *)self chat];
  char v7 = [v6 isRCS];

  return v7;
}

- (NSArray)handles
{
  if ([(CKConversation *)self isPending])
  {
    uint64_t v3 = [(CKConversation *)self pendingHandles];
    id v4 = (void *)v3;
    int v5 = (void *)MEMORY[0x1E4F1CBF0];
    if (v3) {
      int v5 = (void *)v3;
    }
    id v6 = v5;
  }
  else
  {
    id v4 = [(CKConversation *)self chat];
    id v6 = [v4 participants];
  }
  char v7 = v6;

  return (NSArray *)v7;
}

- (BOOL)isPending
{
  if (!CKIsRunningInMessages() && !IMIsRunningInMessagesComposeViewService()) {
    return self->_chat == 0;
  }
  uint64_t v3 = +[CKConversationList sharedConversationList];
  id v4 = [v3 pendingConversation];
  BOOL v5 = v4 == self;

  return v5;
}

- (void)setAllowedByPersonListInActiveFocus:(BOOL)a3
{
  self->_allowedByPersonListInActiveFocus = a3;
}

- (id)fastPreviewTextIgnoringPluginContent
{
  p_previewText = &self->_previewText;
  previewText = self->_previewText;
  if (previewText)
  {
    id v4 = previewText;
  }
  else
  {
    BOOL v5 = [(CKConversation *)self chat];
    id v6 = [v5 lastFinishedMessage];
    objc_msgSend(v6, "__ck_previewTextWithChat:ignorePluginContent:", v5, 1);
    id v4 = (NSAttributedString *)objc_claimAutoreleasedReturnValue();
    char v7 = [v6 balloonBundleID];

    if (!v7) {
      objc_storeStrong((id *)p_previewText, v4);
    }
  }

  return v4;
}

- (BOOL)isReadOnlyChat
{
  v2 = [(CKConversation *)self chat];
  char v3 = [v2 isReadOnly];

  return v3;
}

- (void)_createConversationVisualIdentityWithKeys:(id)a3 numberOfContacts:(unint64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    char v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412290;
      long long v16 = self;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Create group photo for visual identity on conversation %@", (uint8_t *)&v15, 0xCu);
    }
  }
  uint64_t v8 = [(CKConversation *)self _contactsForVisualIdentityWithKeys:v6 numberOfContacts:a4];
  uint64_t v9 = [(CKConversation *)self groupPhotoData];
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = @"NO";
      if (!v9) {
        BOOL v11 = @"YES";
      }
      int v15 = 138412290;
      long long v16 = (CKConversation *)v11;
      _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "groupImageData is nil: %@", (uint8_t *)&v15, 0xCu);
    }
  }
  BOOL v12 = [(CKConversation *)self displayName];
  long long v13 = [[CKVisualGroupIdentity alloc] initGroupWithName:v12 photo:v9 visualContacts:v8 groupParticipantCount:[(CKConversation *)self recipientCount]];
  conversationVisualIdentity = self->__conversationVisualIdentity;
  self->__conversationVisualIdentity = v13;
}

- (id)groupPhotoData
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(CKConversation *)self isGroupConversation])
  {
    char v7 = 0;
    goto LABEL_35;
  }
  char v3 = [(CKConversation *)self _groupPhotoFileURL];
  id v4 = v3;
  if (!v3)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v17 = 0;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "groupPhotoFileURL is nil: %@", buf, 0xCu);
      }
    }
    char v7 = 0;
    goto LABEL_34;
  }
  BOOL v5 = [v3 path];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v17 = v5;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "groupPhotoFilePath is: %@", buf, 0xCu);
    }
  }
  if (![v5 length])
  {
    if (IMOSLoggingEnabled())
    {
      long long v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v17 = v5;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "groupPhotoFilePath is nil: %@", buf, 0xCu);
      }
    }
    char v7 = 0;
    goto LABEL_33;
  }
  id v15 = 0;
  char v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfFile:v5 options:8 error:&v15];
  id v8 = v15;
  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        uint64_t v17 = v5;
        __int16 v18 = 2112;
        id v19 = v8;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Error loading group photo at path %@ error: %@", buf, 0x16u);
      }
    }
    if (!IMOSLoggingEnabled()) {
      goto LABEL_32;
    }
    BOOL v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v17 = v5;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Error loading group photo: %@", buf, 0xCu);
    }
    goto LABEL_31;
  }
  if (v9)
  {
    BOOL v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v17 = v5;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "no error in loading group photo data at path: %@", buf, 0xCu);
    }
LABEL_31:
  }
LABEL_32:

LABEL_33:
LABEL_34:

LABEL_35:

  return v7;
}

- (id)_contactsForVisualIdentityWithKeys:(id)a3 numberOfContacts:(unint64_t)a4
{
  if (a4)
  {
    BOOL v5 = [(CKConversation *)self orderedContactsWithMaxCount:a4 keysToFetch:a3];
  }
  else
  {
    BOOL v5 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v5;
}

- (id)_groupPhotoFileURL
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = [(CKConversation *)self groupPhotoFileTransfer];
  uint64_t v4 = v3;
  if (v3)
  {
    BOOL v5 = [v3 guid];
    if ([v4 existsAtLocalPath])
    {
      id v6 = [v4 localPath];
      char v7 = objc_msgSend(v6, "__ck_stringByExpandingTildeInPath");

      if ([v7 length])
      {
        id v8 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v7 isDirectory:0];
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          BOOL v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            BOOL v12 = [(IMChat *)self->_chat chatIdentifier];
            int v15 = 138412546;
            long long v16 = v5;
            __int16 v17 = 2112;
            __int16 v18 = v12;
            _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Could not determine path for group photo file tranfer with guid %@ for chat with identifier %@", (uint8_t *)&v15, 0x16u);
          }
        }
        id v8 = 0;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        int v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = [(IMChat *)self->_chat chatIdentifier];
          int v15 = 138412546;
          long long v16 = v5;
          __int16 v17 = 2112;
          __int16 v18 = v10;
          _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Group photo with guid %@ does not exist at local path for chat with identifier %@", (uint8_t *)&v15, 0x16u);
        }
      }
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    long long v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      long long v16 = v8;
      __int16 v17 = 2112;
      __int16 v18 = self;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "retrieved group photo URL %@ for conversation %@", (uint8_t *)&v15, 0x16u);
    }
  }

  return v8;
}

- (id)groupPhotoFileTransfer
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  char v3 = [(IMChat *)self->_chat allChatProperties];
  uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F6CD48]];

  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      long long v14 = self;
      __int16 v15 = 2112;
      long long v16 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "retrieving group photo URL for conversation %@ using groupPhotoGuid %@", (uint8_t *)&v13, 0x16u);
    }
  }
  if (![(CKConversation *)v4 length]) {
    goto LABEL_15;
  }
  id v6 = [MEMORY[0x1E4F6BCC8] sharedInstance];
  char v7 = [v6 transferForGUID:v4];

  int v8 = IMOSLoggingEnabled();
  if (!v7)
  {
    if (v8)
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        BOOL v11 = [(IMChat *)self->_chat chatIdentifier];
        int v13 = 138412546;
        long long v14 = v4;
        __int16 v15 = 2112;
        long long v16 = v11;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "Could not find file transfer matching groupPhotoGuid %@ for chat with identifier %@", (uint8_t *)&v13, 0x16u);
      }
    }
LABEL_15:
    char v7 = 0;
    goto LABEL_16;
  }
  if (v8)
  {
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      long long v14 = v7;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "found transfer %@", (uint8_t *)&v13, 0xCu);
    }
  }
LABEL_16:

  return v7;
}

- (id)renderedAvatarImageWithSize:(CGSize)a3
{
  return -[CKConversation renderedAvatarImageWithSize:traitCollection:](self, "renderedAvatarImageWithSize:traitCollection:", 0, a3.width, a3.height);
}

- (id)renderedAvatarImageWithSize:(CGSize)a3 traitCollection:(id)a4
{
  double height = a3.height;
  double width = a3.width;
  char v7 = (objc_class *)MEMORY[0x1E4F1BB20];
  id v8 = a4;
  id v9 = [v7 alloc];
  id v10 = [MEMORY[0x1E4F1BB28] defaultSettings];
  BOOL v11 = (void *)[v9 initWithSettings:v10];

  BOOL v12 = -[CKConversation renderedAvatarImageWithSize:traitCollection:avatarImageRenderer:](self, "renderedAvatarImageWithSize:traitCollection:avatarImageRenderer:", v8, v11, width, height);

  return v12;
}

- (id)renderedAvatarImageWithSize:(CGSize)a3 traitCollection:(id)a4 avatarImageRenderer:(id)a5
{
  double height = a3.height;
  double width = a3.width;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [MEMORY[0x1E4F1BB38] maxContactAvatars];
  BOOL v12 = [(CKConversation *)self conversationVisualIdentityWithKeys:MEMORY[0x1E4F1CBF0] requestedNumberOfContactsToFetch:v11];
  int v13 = [v12 groupPhoto];

  if (v13)
  {
    long long v14 = (void *)MEMORY[0x1E4F42A80];
    __int16 v15 = [v12 groupPhoto];
    long long v16 = [v14 imageWithData:v15];

    uint64_t v17 = objc_msgSend(objc_alloc(MEMORY[0x1E4F42A58]), "initWithSize:", width, height);
    v26[0] = MEMORY[0x1E4F143A8];
    v26[1] = 3221225472;
    v26[2] = __104__CKConversation_AvatarImageRendering__renderedAvatarImageWithSize_traitCollection_avatarImageRenderer___block_invoke;
    v26[3] = &unk_1E5621DC0;
    uint64_t v28 = 0;
    uint64_t v29 = 0;
    double v30 = width;
    double v31 = height;
    double v32 = width * 0.5;
    id v27 = v16;
    id v18 = v16;
    uint64_t v19 = [v17 imageWithActions:v26];
  }
  else
  {
    uint64_t v20 = [MEMORY[0x1E4F42D90] mainScreen];
    [v20 scale];
    double v22 = v21;

    if (v9)
    {
      [v9 displayScale];
      double v22 = v23;
      if ([v9 userInterfaceStyle] == 1) {
        uint64_t v24 = 2;
      }
      else {
        uint64_t v24 = 3;
      }
    }
    else
    {
      uint64_t v24 = 0;
    }
    uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1BB30], "scopeWithPointSize:scale:rightToLeft:style:backgroundStyle:", 0, 0, v24, width, height, v22);
    id v18 = [v12 contacts];
    uint64_t v19 = [v10 avatarImageForContacts:v18 scope:v17];
  }

  return v19;
}

void __104__CKConversation_AvatarImageRendering__renderedAvatarImageWithSize_traitCollection_avatarImageRenderer___block_invoke(uint64_t a1)
{
  objc_msgSend(MEMORY[0x1E4F427D0], "bezierPathWithRoundedRect:cornerRadius:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64), *(double *)(a1 + 72));
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  [v2 addClip];
  objc_msgSend(*(id *)(a1 + 32), "drawInRect:", *(double *)(a1 + 40), *(double *)(a1 + 48), *(double *)(a1 + 56), *(double *)(a1 + 64));
}

- (id)pinnedConversationDisplayNamePreferringShortName:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKConversation *)self recipientCount] == 1)
  {
    if (v3)
    {
      BOOL v5 = [(CKConversation *)self recipients];
      id v6 = [v5 firstObject];

      char v7 = [v6 defaultIMHandle];
      id v8 = v7;
      if (v7) {
        [v7 _displayNameWithAbbreviation];
      }
      else {
      id v10 = [(CKConversation *)self name];
      }

      goto LABEL_11;
    }
    goto LABEL_7;
  }
  if (![(CKConversation *)self hasDisplayName])
  {
LABEL_7:
    uint64_t v9 = [(CKConversation *)self name];
    goto LABEL_8;
  }
  uint64_t v9 = [(CKConversation *)self displayName];
LABEL_8:
  id v10 = (void *)v9;
LABEL_11:

  return v10;
}

- (void)fetchOldestMessageDateWithCompletion:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [(CKConversation *)self chat];
  id v6 = v5;
  if (v5)
  {
    char v7 = [v5 guid];
    id v8 = IMLogHandleForCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      int v13 = v7;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Fetch oldest message date for chat: %@", buf, 0xCu);
    }

    v10[0] = MEMORY[0x1E4F143A8];
    v10[1] = 3221225472;
    v10[2] = __95__CKConversation_MessageHistoryViewControllerDataSource__fetchOldestMessageDateWithCompletion___block_invoke;
    v10[3] = &unk_1E5625C80;
    id v11 = v4;
    [v6 fetchOldestMessageDateWithCompletion:v10];
  }
  else
  {
    uint64_t v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Oldest message date fetch skipped for conversation with no backing chat (e.g. new compose).", buf, 2u);
    }

    char v7 = [MEMORY[0x1E4F1C9C8] date];
    (*((void (**)(id, void *))v4 + 2))(v4, v7);
  }
}

void __95__CKConversation_MessageHistoryViewControllerDataSource__fetchOldestMessageDateWithCompletion___block_invoke(uint64_t a1, void *a2, void *a3)
{
  id v5 = a2;
  id v6 = a3;
  if (v6)
  {
    char v7 = IMLogHandleForCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __95__CKConversation_MessageHistoryViewControllerDataSource__fetchOldestMessageDateWithCompletion___block_invoke_cold_1((uint64_t)v6, v7);
    }

    id v8 = [MEMORY[0x1E4F1C9C8] distantPast];
    (*(void (**)(void))(*(void *)(a1 + 32) + 16))();
  }
  else
  {
    uint64_t v9 = IMLogHandleForCategory();
    BOOL v10 = os_log_type_enabled(v9, OS_LOG_TYPE_INFO);
    if (v5)
    {
      if (v10)
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Message history fetch completed with non nil result", buf, 2u);
      }

      id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    else
    {
      if (v10)
      {
        *(_WORD *)BOOL v12 = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Message history fetch completed with nil result", v12, 2u);
      }

      id v11 = *(void (**)(void))(*(void *)(a1 + 32) + 16);
    }
    v11();
  }
}

- (void)messageHistoryForDateInterval:(id)a3 completion:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [(CKConversation *)self chat];
  uint64_t v9 = v8;
  if (v8)
  {
    BOOL v10 = [v8 guid];
    id v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v20 = v10;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "Message history fetch beginning for chat: %@, dateInterval: %@", buf, 0x16u);
    }

    v15[0] = MEMORY[0x1E4F143A8];
    v15[1] = 3221225472;
    v15[2] = __99__CKConversation_MessageHistoryViewControllerDataSource__messageHistoryForDateInterval_completion___block_invoke;
    v15[3] = &unk_1E5625CA8;
    id v16 = v10;
    id v17 = v6;
    id v18 = v7;
    id v12 = v10;
    [v9 fetchMessageHistoryForDateInterval:v17 completion:v15];
  }
  else
  {
    int v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_INFO, "Message history fetch skipped for conversation with no backing chat (e.g. new compose).", buf, 2u);
    }

    id v14 = objc_alloc(MEMORY[0x1E4F6E840]);
    id v12 = (id)[v14 initWithDateInterval:v6 messages:MEMORY[0x1E4F1CBF0]];
    (*((void (**)(id, id))v7 + 2))(v7, v12);
  }
}

void __99__CKConversation_MessageHistoryViewControllerDataSource__messageHistoryForDateInterval_completion___block_invoke(void *a1, void *a2, void *a3)
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v5 = a2;
  id v6 = a3;
  id v7 = IMLogHandleForCategory();
  id v8 = v7;
  if (v5)
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v5 messages];
      uint64_t v10 = [v9 count];
      uint64_t v11 = a1[4];
      uint64_t v12 = a1[5];
      int v15 = 134218498;
      uint64_t v16 = v10;
      __int16 v17 = 2112;
      uint64_t v18 = v11;
      __int16 v19 = 2112;
      uint64_t v20 = v12;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Message history fetch completed with %ld results for chatGUID: %@, dateInterval: %@", (uint8_t *)&v15, 0x20u);
    }
    (*(void (**)(void))(a1[6] + 16))();
  }
  else
  {
    if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
      __95__CKConversation_MessageHistoryViewControllerDataSource__fetchOldestMessageDateWithCompletion___block_invoke_cold_1((uint64_t)v6, v8);
    }

    id v13 = objc_alloc(MEMORY[0x1E4F6E840]);
    id v14 = (void *)[v13 initWithDateInterval:a1[5] messages:MEMORY[0x1E4F1CBF0]];
    (*(void (**)(void))(a1[6] + 16))();
  }
}

- (void)dealloc
{
  if ((CKConversation *)[(IMChat *)self->_chat contextInfo] == self)
  {
    [(IMChat *)self->_chat setContextInfo:0];
    BOOL v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v3 removeObserver:self name:*MEMORY[0x1E4F6B8B8] object:0];
  }
  v4.receiver = self;
  v4.super_class = (Class)CKConversation;
  [(CKConversation *)&v4 dealloc];
}

- (void)willBecomeInactive
{
  id v2 = [(CKConversation *)self chat];
  [v2 endListeningToAttributionChanges];
}

- (void)setNeedsUpdatedContactOrderForVisualIdentity
{
}

- (void)setNeedsUpdatedGroupPhotoForVisualIdentity
{
}

- (void)setNeedsUpdatedGroupNameForVisualIdentity
{
}

- (void)_updateContactsForVisualIdentityWithKeys:(id)a3 numberOfContacts:(unint64_t)a4
{
  id v6 = (void *)MEMORY[0x1E4F1BB38];
  id v7 = a3;
  unint64_t v8 = [v6 maxContactAvatars];
  unint64_t v9 = [MEMORY[0x1E4F1BBB8] maxContactAvatars];
  if (v8 <= v9) {
    unint64_t v10 = v9;
  }
  else {
    unint64_t v10 = v8;
  }
  if (v10 <= a4) {
    unint64_t v11 = a4;
  }
  else {
    unint64_t v11 = v10;
  }
  id v12 = [(CKConversation *)self _contactsForVisualIdentityWithKeys:v7 numberOfContacts:v11];

  [(CKVisualGroupIdentity *)self->__conversationVisualIdentity updateVisualContacts:v12 groupParticipantCount:[(CKConversation *)self recipientCount]];
}

- (void)_updateGroupPhotoForVisualIdentity
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v5 = 138412290;
      id v6 = self;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Updating group photo for visual identity on conversation %@", (uint8_t *)&v5, 0xCu);
    }
  }
  objc_super v4 = [(CKConversation *)self groupPhotoData];
  [(CKVisualGroupIdentity *)self->__conversationVisualIdentity updateGroupPhoto:v4];
}

- (void)updateConversationVisualIdentityGroupPhotoWithSender:(id)a3
{
  objc_super v4 = (NSString *)a3;
  [(CKConversation *)self setNeedsUpdatedGroupPhotoForVisualIdentity:1];
  groupIdentityUpdateHandleID = self->_groupIdentityUpdateHandleID;
  self->_groupIdentityUpdateHandleID = v4;
}

- (void)updateConversationVisualIdentityDisplayNameWithSender:(id)a3
{
  objc_super v4 = (NSString *)a3;
  [(CKConversation *)self setNeedsUpdatedGroupNameForVisualIdentity:1];
  groupIdentityUpdateHandleID = self->_groupIdentityUpdateHandleID;
  self->_groupIdentityUpdateHandleID = v4;
}

- (void)_updateGroupNameForVisualIdentity
{
  id v3 = [(CKConversation *)self displayName];
  [(CKVisualGroupIdentity *)self->__conversationVisualIdentity updateGroupName:v3];
}

- (void)didBecomeActive
{
  id v2 = [(CKConversation *)self chat];
  if (!v2 && IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v4 = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "No chat found, bailing", v4, 2u);
    }
  }
  if (!CKIsRunningInMessagesNotificationExtension()
    && !CKIsRunningInMessagesViewService()
    && (IMSharedHelperIsOlderDevice() & 1) == 0)
  {
    [v2 beginListeningToAttributionChanges];
  }
}

- (id)acquireHandleStatusObservationAssertion
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Beginning listening to status changes", buf, 2u);
    }
  }
  objc_super v4 = [(CKConversation *)self chat];
  int v5 = v4;
  if (v4)
  {
    id v6 = [v4 beginObservingHandleStatuses];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unint64_t v9 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "No chat found, bailing", v9, 2u);
      }
    }
    id v6 = 0;
  }

  return v6;
}

- (NSString)lastAddressedHandle
{
  id v3 = [(CKConversation *)self chat];
  objc_super v4 = [v3 lastAddressedHandleID];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [(CKConversation *)self chat];
    uint64_t v7 = [v6 lastAddressedHandleID];
  }
  else
  {
    uint64_t v7 = [(CKConversation *)self selectedLastAddressedHandle];
  }

  return (NSString *)v7;
}

- (NSString)lastAddressedSIMID
{
  id v3 = [(CKConversation *)self chat];
  objc_super v4 = [v3 lastAddressedSIMID];
  uint64_t v5 = [v4 length];

  if (v5)
  {
    id v6 = [(CKConversation *)self chat];
    uint64_t v7 = [v6 lastAddressedSIMID];
  }
  else
  {
    uint64_t v7 = [(CKConversation *)self selectedLastAddressedSIMID];
  }

  return (NSString *)v7;
}

+ (id)newPendingConversation
{
  id v2 = [CKPendingConversation alloc];

  return [(CKConversation *)v2 initWithChat:0];
}

+ (id)conversationForAddresses:(id)a3 allowRetargeting:(BOOL)a4 candidateConversation:(id)a5
{
  BOOL v29 = a4;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v31 = a3;
  id v6 = a5;
  uint64_t v7 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  id v37 = 0;
  double v32 = [v7 existingChatForAddresses:v31 allowRetargeting:v29 bestHandles:&v37];
  id v30 = v37;

  id v8 = v6;
  unint64_t v9 = v8;
  if (v32)
  {
    unint64_t v10 = [v8 chat];
    char v11 = [v10 isEqual:v32];

    id v12 = v9;
    if ((v11 & 1) == 0)
    {
      [v9 setUnsentComposition:0];
      id v13 = +[CKConversationList sharedConversationList];
      id v14 = [v13 conversationForExistingChat:v32];
      id v12 = (void *)[v14 copyForPendingConversation];
    }
    [v12 refreshServiceForSending];
  }
  else
  {
    [v8 setUnsentComposition:0];
    int v15 = +[CKConversationList sharedConversationList];
    id v12 = [v15 pendingConversationCreatingIfNecessary];

    if (v29 && (uint64_t v16 = [v30 count], v16 == objc_msgSend(v31, "count")))
    {
      id v17 = v30;
    }
    else
    {
      id v17 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      uint64_t v18 = [MEMORY[0x1E4F6BBD8] sharedInstance];
      __int16 v19 = objc_msgSend(v18, "__ck_bestAccountForAddresses:", v31);

      long long v35 = 0u;
      long long v36 = 0u;
      long long v33 = 0u;
      long long v34 = 0u;
      id v20 = v31;
      uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v42 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v34;
        do
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v34 != v22) {
              objc_enumerationMutation(v20);
            }
            uint64_t v24 = IMStripFormattingFromAddress();
            unint64_t v25 = [v19 imHandleWithID:v24];

            if (v25) {
              [v17 addObject:v25];
            }
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v33 objects:v42 count:16];
        }
        while (v21);
      }
    }
    [v12 setPendingHandles:v17];
    id v30 = v17;
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      id v27 = @"NO";
      if (v29) {
        id v27 = @"YES";
      }
      *(_DWORD *)long long buf = 138412546;
      v39 = v27;
      __int16 v40 = 2112;
      v41 = v12;
      _os_log_impl(&dword_18EF18000, v26, OS_LOG_TYPE_INFO, "conversationForAddresses (allowRetargeting is %@) using %@", buf, 0x16u);
    }
  }

  return v12;
}

+ (id)conversationForContacts:(id)a3 candidateConversation:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  id v20 = 0;
  id v8 = [v7 existingChatForContacts:v5 bestHandles:&v20];
  id v9 = v20;

  id v10 = v6;
  char v11 = v10;
  if (v8)
  {
    id v12 = [v10 chat];
    char v13 = [v12 isEqual:v8];

    id v14 = v11;
    if ((v13 & 1) == 0)
    {
      [v11 setUnsentComposition:0];
      int v15 = +[CKConversationList sharedConversationList];
      uint64_t v16 = [v15 conversationForExistingChat:v8];
      id v14 = (void *)[v16 copyForPendingConversation];
    }
    [v14 refreshServiceForSending];
  }
  else
  {
    [v10 setUnsentComposition:0];
    id v17 = +[CKConversationList sharedConversationList];
    id v14 = [v17 pendingConversationCreatingIfNecessary];

    [v14 setPendingHandles:v9];
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v22 = v14;
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "conversationForContacts using %@", buf, 0xCu);
    }
  }

  return v14;
}

- (void)resetNameCaches
{
  name = self->_name;
  self->_name = 0;
}

- (void)resetCaches
{
  [(CKConversation *)self resetNameCaches];
  recipients = self->_recipients;
  self->_recipients = 0;

  conversationVisualIdentity = self->__conversationVisualIdentity;
  self->__conversationVisualIdentity = 0;
}

- (void)setNeedsReload
{
  self->_needsReload = 1;
}

- (void)reloadIfNeeded
{
  if (self->_needsReload)
  {
    [(CKConversation *)self clearConversationLoadFromSpotlight];
    [(CKConversation *)self loadAllMessages];
  }
}

- (id)sortedHandles
{
  v9[2] = *MEMORY[0x1E4F143B8];
  id v3 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"isContact" ascending:0];
  objc_super v4 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"fullName" ascending:1 selector:sel_caseInsensitiveCompare_];
  v9[0] = v3;
  v9[1] = v4;
  id v5 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:2];
  id v6 = [(CKConversation *)self handles];
  uint64_t v7 = [v6 sortedArrayUsingDescriptors:v5];

  return v7;
}

- (BOOL)containsHandleWithUID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v5 = [(CKConversation *)self handles];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v13;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) ID];
        char v10 = [v9 isEqualToString:v4];

        if (v10)
        {
          LOBYTE(v6) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (CKEntity)recipient
{
  id v3 = [(CKConversation *)self recipients];
  uint64_t v4 = [v3 count];

  if (v4 == 1)
  {
    id v5 = [(CKConversation *)self recipients];
    uint64_t v6 = [v5 lastObject];
  }
  else
  {
    uint64_t v6 = 0;
  }

  return (CKEntity *)v6;
}

- (void)acceptTransfer:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(19);
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Accept transfer %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
  {
    id v6 = v3;
    _CKLogExternal();
  }
  id v5 = objc_msgSend(MEMORY[0x1E4F6BCC8], "sharedInstance", v6);
  [v5 acceptTransfer:v3];
}

- (void)retrieveLocalFileURLForTransferGUID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(19);
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v8 = v3;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Retrieve local file URL for transfer %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
  {
    id v6 = v3;
    _CKLogExternal();
  }
  id v5 = objc_msgSend(MEMORY[0x1E4F6BCC8], "sharedInstance", v6);
  [v5 retrieveLocalFileURLForFileTransferWithGUID:v3 options:0 completion:0];
}

- (void)_handleChatParticipantsDidChange:(id)a3
{
  id v8 = [a3 object];
  uint64_t v4 = [(CKConversation *)self chat];
  int v5 = [v8 isEqual:v4];

  if (v5)
  {
    recipients = self->_recipients;
    self->_recipients = 0;

    uint64_t v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"CKConversationParticipantsDidChangeNotification" object:self];

    [(CKConversation *)self updateKeyTransparencyStatusForChatParticipantsDidChange:v8];
  }
}

- (void)_handleChatJoinStateDidChange:(id)a3
{
  id v7 = [a3 object];
  uint64_t v4 = [(CKConversation *)self chat];
  int v5 = [v7 isEqual:v4];

  if (v5)
  {
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"CKConversationJoinStateDidChangeNotification" object:self];
  }
}

- (void)_handleEngroupFinishedUpdating:(id)a3
{
  id v8 = [a3 object];
  uint64_t v4 = [(CKConversation *)self chat];
  int v5 = [v8 isEqual:v4];

  if (v5)
  {
    pendingRecipients = self->_pendingRecipients;
    self->_pendingRecipients = 0;

    id v7 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v7 postNotificationName:@"CKConversationPendingRecipientsUpdatedNotification" object:self];
  }
}

- (void)_handleLazuliCapabilitiesUpdatedNotification:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 object];
  uint64_t v16 = 0;
  uint64_t v17 = &v16;
  uint64_t v18 = 0x2020000000;
  char v19 = 0;
  id v6 = [(CKConversation *)self chat];
  id v7 = [v6 participants];
  uint64_t v10 = MEMORY[0x1E4F143A8];
  uint64_t v11 = 3221225472;
  long long v12 = __63__CKConversation__handleLazuliCapabilitiesUpdatedNotification___block_invoke;
  long long v13 = &unk_1E5622460;
  id v8 = v5;
  id v14 = v8;
  long long v15 = &v16;
  [v7 enumerateObjectsUsingBlock:&v10];

  if (*((unsigned char *)v17 + 24))
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v21 = v8;
        __int16 v22 = 2112;
        uint64_t v23 = self;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "Handle %@ is part of %@ and it's RCS capabilities got updated. Refreshing service...", buf, 0x16u);
      }
    }
    [(CKConversation *)self refreshServiceForSending];
  }

  _Block_object_dispose(&v16, 8);
}

void __63__CKConversation__handleLazuliCapabilitiesUpdatedNotification___block_invoke(uint64_t a1, void *a2, uint64_t a3, unsigned char *a4)
{
  id v6 = [a2 ID];
  int v7 = [v6 isEqualToString:*(void *)(a1 + 32)];

  if (v7)
  {
    *(unsigned char *)(*(void *)(*(void *)(a1 + 40) + 8) + 24) = 1;
    *a4 = 1;
  }
}

- (void)setUnsentComposition:(id)a3
{
  id v4 = a3;
  id v5 = +[CKDraftManager sharedInstance];
  [v5 setDraft:v4 forConversation:self];
}

- (void)updateUnsentCompositionByAppendingComposition:(id)a3
{
  id v7 = a3;
  id v4 = [(CKConversation *)self unsentComposition];
  if (([v4 isAudioComposition] & 1) == 0)
  {
    if (v4)
    {
      id v5 = [v4 compositionByAppendingComposition:v7];
    }
    else
    {
      id v5 = v7;
    }
    id v6 = v5;
    [(CKConversation *)self setUnsentComposition:v5];
  }
}

- (CKComposition)unsentComposition
{
  id v3 = +[CKDraftManager sharedInstance];
  id v4 = [v3 draftForConversation:self];

  return (CKComposition *)v4;
}

- (BOOL)isDowngraded
{
  id v2 = [(CKConversation *)self chat];
  char v3 = [v2 isDowngraded];

  return v3;
}

- (BOOL)isIgnoringTypingUpdates
{
  return *(unsigned char *)&self->_conversationFlags & 1;
}

- (void)setIgnoringTypingUpdates:(BOOL)a3
{
  *(unsigned char *)&self->_conversationFlags = *(unsigned char *)&self->_conversationFlags & 0xFE | a3;
}

- (BOOL)forceMMS
{
  id v2 = [(CKConversation *)self chat];
  char v3 = [v2 forceMMS];

  return v3;
}

- (void)setForceMMS:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKConversation *)self chat];
  [v4 setForceMMS:v3];
}

- (NSString)fallbackSendString
{
  if ([(CKConversation *)self isToEmailAddress])
  {
    BOOL v3 = CKFrameworkBundle();
    id v4 = v3;
    id v5 = @"MADRID_SEND_TO_EMAIL";
  }
  else
  {
    id v6 = [(CKConversation *)self chat];
    int v7 = [v6 isRCS];

    BOOL v3 = CKFrameworkBundle();
    id v4 = v3;
    if (v7) {
      id v5 = @"LAZULI_SEND_AS_TEXT_MESSAGE";
    }
    else {
      id v5 = @"MADRID_SEND_AS_TEXT_MESSAGE";
    }
  }
  id v8 = [v3 localizedStringForKey:v5 value:&stru_1EDE4CA38 table:@"ChatKit"];

  return (NSString *)v8;
}

- (BOOL)canLeave
{
  id v2 = [(CKConversation *)self chat];
  char v3 = [v2 canLeaveChat];

  return v3;
}

- (BOOL)hasLeft
{
  char v3 = [(CKConversation *)self chat];
  uint64_t v4 = [v3 joinState];

  unsigned int v5 = (v4 != 3) & ~[(CKConversation *)self isPending];
  if (v4 == 2) {
    return 0;
  }
  else {
    return v5;
  }
}

- (BOOL)hasLeftGroupChat
{
  id v2 = [(CKConversation *)self chat];
  char v3 = [v2 hasLeftGroup];

  return v3;
}

- (void)leave
{
  id v2 = [(CKConversation *)self chat];
  [v2 leave];
}

- (BOOL)isBusinessChatDisabled
{
  int v2 = [(CKConversation *)self isBusinessConversation];
  if (v2) {
    LOBYTE(v2) = [MEMORY[0x1E4F6E730] supportsBusinessChat] ^ 1;
  }
  return v2;
}

- (BOOL)supportsMutatingGroupMembers
{
  if ((CKIsRunningUITests() || CKIsRunningForDevelopmentOnSimulator())
    && [(CKConversation *)self isGroupConversation])
  {
    return 1;
  }
  uint64_t v4 = [(CKConversation *)self chat];
  char v5 = [v4 supportsCapabilities:32];

  return v5;
}

- (BOOL)supportsMutatingGroupIdentity
{
  int v2 = [(CKConversation *)self chat];
  char v3 = [v2 supportsCapabilities:16];

  return v3;
}

- (BOOL)supportsDeleteAndBlockGroup
{
  int v2 = [(CKConversation *)self chat];
  char v3 = [v2 supportsCapabilities:256];

  return v3;
}

- (BOOL)suppressesMutationsFromLocalDevice
{
  int v2 = [(CKConversation *)self chat];
  char v3 = [v2 _suppressesMutationsFromLocalDevice];

  return v3;
}

- (BOOL)isSatelliteSendingService
{
  char v3 = [(CKConversation *)self sendingService];
  uint64_t v4 = [MEMORY[0x1E4F6BDC0] iMessageLiteService];
  if (v3 == v4)
  {
    BOOL v7 = 1;
  }
  else
  {
    char v5 = [(CKConversation *)self sendingService];
    id v6 = [MEMORY[0x1E4F6BDC0] satelliteSMSService];
    BOOL v7 = v5 == v6;
  }
  return v7;
}

- (BOOL)isAdHocGroupConversation
{
  if (![(CKConversation *)self isGroupConversation]) {
    return 0;
  }
  char v3 = [(CKConversation *)self conversationVisualIdentityWithKeys:MEMORY[0x1E4F1CBF0] requestedNumberOfContactsToFetch:0];
  uint64_t v4 = [v3 groupPhoto];
  BOOL v5 = [v4 length] == 0;

  return v5;
}

- (BOOL)canReplyToChatItem:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(CKConversation *)self chat];
  id v6 = [(CKConversation *)self chat];
  if ([v6 isStewieChat])
  {
    char v7 = 0;
  }
  else
  {
    id v8 = [(CKConversation *)self chat];
    char v9 = [v8 isStewieSharingChat];

    char v7 = v9 ^ 1;
  }

  uint64_t v10 = [MEMORY[0x1E4F59080] sharedSystemShellSwitcher];
  char v11 = [v10 isClarityBoardEnabled];

  if (![v5 supportsCapabilities:4]
    || [(CKConversation *)self hasLeftGroupChat]
    || [(CKConversation *)self isReadOnlyChat]
    || ([v5 isBusinessChat] & 1) != 0)
  {
    char v12 = 0;
  }
  else if ([v5 isOscarChat])
  {
    char v12 = 0;
  }
  else
  {
    char v12 = v7 & (v11 ^ 1);
  }
  char v13 = v12 & [v4 canInlineReply];

  return v13;
}

- (int64_t)maximumRecipientsForSendingService
{
  char v3 = [(CKConversation *)self sendingService];
  id v4 = [(CKConversation *)self lastAddressedHandle];
  BOOL v5 = [(CKConversation *)self lastAddressedSIMID];
  if (v3)
  {
    int64_t v6 = objc_msgSend(v3, "__ck_maxRecipientCountForHandle:simID:", v4, v5);
  }
  else
  {
    char v7 = [MEMORY[0x1E4F6BDC0] smsService];
    int64_t v6 = objc_msgSend(v7, "__ck_maxRecipientCountForHandle:simID:", v4, v5);
  }
  return v6;
}

- (BOOL)canInsertMoreRecipients
{
  if (![(CKConversation *)self recipientCount]) {
    return 1;
  }
  unint64_t v3 = [(CKConversation *)self recipientCount];
  return v3 < [(CKConversation *)self maximumRecipientsForSendingService];
}

- (BOOL)canMuteStateBeToggled
{
  unint64_t v3 = [(CKConversation *)self chat];

  if (v3)
  {
    id v4 = [(CKConversation *)self chat];
    int v5 = [v4 isStewieChat] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (IMHandle)businessHandle
{
  if ([(CKConversation *)self isBusinessConversation])
  {
    p_businessHandle = &self->_businessHandle;
    businessHandle = self->_businessHandle;
    if (!businessHandle)
    {
      int v5 = [(CKConversation *)self handles];
      int64_t v6 = [v5 firstObject];

      if ([v6 isBusiness]) {
        objc_storeStrong((id *)&self->_businessHandle, v6);
      }
      if (!*p_businessHandle)
      {
        char v7 = [(CKConversation *)self chat];
        id v8 = [v7 businessHandle];
        char v9 = self->_businessHandle;
        self->_businessHandle = v8;
      }
      businessHandle = *p_businessHandle;
    }
    uint64_t v10 = businessHandle;
  }
  else
  {
    uint64_t v10 = 0;
  }

  return v10;
}

- (BOOL)isMapKitBusinessConversation
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  mapKitBusinessConversation = self->_mapKitBusinessConversation;
  if (!mapKitBusinessConversation)
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v4 = [(CKConversation *)self handles];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v5)
    {
      uint64_t v6 = v5;
      uint64_t v7 = *(void *)v16;
      while (2)
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v16 != v7) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v15 + 1) + 8 * v8) isMapKitBusiness])
          {
            int v9 = 1;
            goto LABEL_12;
          }
          ++v8;
        }
        while (v6 != v8);
        uint64_t v6 = [v4 countByEnumeratingWithState:&v15 objects:v19 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }
    int v9 = 0;
LABEL_12:

    uint64_t v10 = [(CKConversation *)self chat];
    unsigned int v11 = [v10 isMapKitBusinessChat];

    char v12 = [NSNumber numberWithBool:v9 | v11];
    char v13 = self->_mapKitBusinessConversation;
    self->_mapKitBusinessConversation = v12;

    mapKitBusinessConversation = self->_mapKitBusinessConversation;
  }
  return [(NSNumber *)mapKitBusinessConversation BOOLValue];
}

- (BOOL)shouldPresentSpamReasonPicker
{
  BOOL v3 = [(CKConversation *)self isChatBot];
  return [(CKConversation *)self isBusinessConversation] && !v3;
}

- (NSString)chatbotURI
{
  if ([(CKConversation *)self isChatBot])
  {
    BOOL v3 = [(CKConversation *)self chat];
    id v4 = [v3 chatIdentifier];
    uint64_t v5 = [v4 stringByReplacingOccurrencesOfString:@"sip:" withString:&stru_1EDE4CA38];
  }
  else
  {
    uint64_t v5 = 0;
  }

  return (NSString *)v5;
}

- (void)deleteBrandLogos
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [(CKConversation *)self businessHandle];
      uint64_t v5 = [v4 brand];
      uint64_t v6 = [v5 brandURI];
      int v9 = 138412290;
      uint64_t v10 = v6;
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, "Messages for Business delete brand logos for brand URI: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  uint64_t v7 = [(CKConversation *)self businessHandle];
  uint64_t v8 = [v7 brand];
  [v8 clearCachedAssets:&__block_literal_global_95];
}

void __34__CKConversation_deleteBrandLogos__block_invoke(uint64_t a1, void *a2)
{
  id v2 = a2;
  if (v2)
  {
    BOOL v3 = IMLogHandleForCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
      __34__CKConversation_deleteBrandLogos__block_invoke_cold_1((uint64_t)v2, v3);
    }
  }
}

- (BOOL)isUserDeletable
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  if ([(CKConversation *)self isStewieConversation])
  {
    id v2 = [MEMORY[0x1E4F6BC48] sharedInstance];
    int v3 = [v2 isStewieActive];
  }
  else
  {
    int v3 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = @"YES";
      if (v3) {
        uint64_t v5 = @"NO";
      }
      int v7 = 138412290;
      uint64_t v8 = v5;
      _os_log_impl(&dword_18EF18000, v4, OS_LOG_TYPE_INFO, "Conversation can be deleted: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  return v3 ^ 1;
}

- (BOOL)isStewieConversation
{
  id v2 = [(CKConversation *)self chat];
  char v3 = [v2 isStewieChat];

  return v3;
}

- (BOOL)isEmergencyTranscriptSharingConversation
{
  id v2 = [(CKConversation *)self chat];
  char v3 = [v2 isStewieSharingChat];

  return v3;
}

- (BOOL)isAppleConversation
{
  BOOL v3 = [(CKConversation *)self isBusinessConversation];
  if (v3)
  {
    id v4 = [(CKConversation *)self chat];
    char v5 = [v4 isAppleChat];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isMakoConversation
{
  BOOL v3 = [(CKConversation *)self isBusinessConversation];
  if (v3)
  {
    id v4 = [(CKConversation *)self chat];
    char v5 = [v4 isMakoChat];

    LOBYTE(v3) = v5;
  }
  return v3;
}

- (BOOL)isWithMyself
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [MEMORY[0x1E4F6BBD8] sharedInstance];
  id v4 = [(CKConversation *)self sendingService];
  char v5 = [v3 bestActiveAccountForService:v4];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  uint64_t v6 = [(CKConversation *)self handles];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v18;
    while (2)
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v6);
        }
        uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        char v12 = [v5 aliases];
        char v13 = [v11 ID];
        int v14 = [v12 containsObject:v13];

        if (!v14)
        {
          BOOL v15 = 0;
          goto LABEL_11;
        }
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v15 = 1;
LABEL_11:

  return v15;
}

- (BOOL)hasReplyEnabled
{
  BOOL v3 = [(CKConversation *)self chat];
  if (v3)
  {
    id v4 = [(CKConversation *)self chat];
    char v5 = [v4 isReplyEnabled];
  }
  else
  {
    char v5 = 1;
  }

  return v5;
}

- (void)unmute
{
  id v2 = [(CKConversation *)self chat];
  [v2 setMuteUntilDate:0];
}

- (void)setMutedUntilDate:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversation *)self chat];
  [v5 setMuteUntilDate:v4];
}

- (BOOL)shouldSendReadReceipts
{
  id v2 = [(CKConversation *)self chat];
  char v3 = objc_msgSend(v2, "__ck_sendReadReceipts");

  return v3;
}

- (void)setSendReadReceipts:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKConversation *)self chat];
  objc_msgSend(v4, "__ck_setSendReadReceipts:", v3);
}

- (void)canShareFocusStatusWithCompletion:(id)a3
{
  uint64_t v6 = (void (**)(id, void))a3;
  id v4 = [(CKConversation *)self chat];

  if (v4)
  {
    id v5 = [(CKConversation *)self chat];
    [v5 canShareFocusStatusWithCompletion:v6];
  }
  else
  {
    v6[2](v6, 0);
  }
}

- (void)isInvitedToViewMyFocusStatusWithCompletion:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversation *)self chat];

  if (v5)
  {
    uint64_t v6 = [(CKConversation *)self chat];
    [v6 isInvitedToViewMyFocusStatusWithCompletion:v4];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v8 = 0;
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Requested to share focus mode in conversation with no chat.", v8, 2u);
      }
    }
    (*((void (**)(id, void, void))v4 + 2))(v4, 0, 0);
  }
}

- (void)addRecipientHandles:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = [v4 setWithArray:v5];
  [(CKConversation *)self setPendingRecipients:v6];

  id v7 = [(CKConversation *)self chat];
  [v7 inviteParticipants:v5 reason:0];
}

- (void)removeRecipientHandles:(id)a3
{
  id v4 = (void *)MEMORY[0x1E4F1CAD0];
  id v5 = a3;
  uint64_t v6 = [v4 setWithArray:v5];
  [(CKConversation *)self setPendingRecipients:v6];

  id v7 = [(CKConversation *)self chat];
  [v7 removeParticipants:v5 reason:0];
}

- (id)entityMatchingHandle:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CKConversation *)self recipients];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v5 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v17 != v7) {
        objc_enumerationMutation(v5);
      }
      uint64_t v9 = *(void **)(*((void *)&v16 + 1) + 8 * v8);
      uint64_t v10 = objc_msgSend(v9, "defaultIMHandle", (void)v16);
      if ([v10 matchesIMHandle:v4]) {
        break;
      }

      if (v6 == ++v8)
      {
        uint64_t v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    uint64_t v11 = v9;

    if (v11) {
      goto LABEL_16;
    }
  }
  else
  {
LABEL_9:
  }
  if (IMOSLoggingEnabled())
  {
    char v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v21 = v4;
      _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_INFO, "Recipient not found on conversation mathing handle: %@. Creating a new CKEntity.", buf, 0xCu);
    }
  }
  char v13 = [CKEntity alloc];
  int v14 = [(CKConversation *)self chat];
  uint64_t v11 = [(CKEntity *)v13 initWithChat:v14 imHandle:v4];

LABEL_16:

  return v11;
}

- (void)updateDisplayNameIfSMSSpam
{
  if ([(CKConversation *)self wasDetectedAsSMSSpam])
  {
    [(CKConversation *)self resetNameCaches];
  }
}

- (id)orderedContactsForAvatar3DTouchUIWithKeysToFetch:(id)a3
{
  return [(CKConversation *)self orderedContactsWithMaxCount:-1 keysToFetch:a3];
}

void __58__CKConversation_orderedContactsWithMaxCount_keysToFetch___block_invoke_3(void *a1, void *a2, unsigned char *a3)
{
  id v5 = a2;
  if (([v5 isFromMe] & 1) == 0 && (objc_msgSend(v5, "isTypingMessage") & 1) == 0)
  {
    (*(void (**)(void))(a1[4] + 16))();
    if ((unint64_t)[*(id *)(*(void *)(a1[5] + 8) + 40) count] >= a1[6]) {
      *a3 = 1;
    }
  }
}

- (void)refreshServiceForSending
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(38);
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v7 = "-[CKConversation refreshServiceForSending]";
      _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    id v5 = "-[CKConversation refreshServiceForSending]";
    _CKLog();
  }
  id v4 = [(CKConversation *)self chat];
  [v4 refreshServiceForSending];
}

- (IMService)sendingService
{
  BOOL v3 = [(CKConversation *)self chat];
  id v4 = [v3 account];
  id v5 = [v4 service];

  if (!v5)
  {
    if ([(CKConversation *)self isChatBot]) {
      [MEMORY[0x1E4F6BDB8] rcsService];
    }
    else {
    id v5 = [MEMORY[0x1E4F6BDB8] smsService];
    }
  }

  return (IMService *)v5;
}

- (id)sendingServiceImpl
{
  id v2 = [(CKConversation *)self chat];
  BOOL v3 = [v2 account];
  id v4 = [v3 service];

  if (!v4)
  {
    id v4 = [MEMORY[0x1E4F6BDB8] smsService];
  }

  return v4;
}

- (BOOL)_handleIsForThisConversation:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    [(CKConversation *)self handles];
    long long v10 = 0u;
    long long v11 = 0u;
    long long v12 = 0u;
    long long v13 = 0u;
    id v5 = (id)objc_claimAutoreleasedReturnValue();
    uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v11;
      while (2)
      {
        for (uint64_t i = 0; i != v6; ++i)
        {
          if (*(void *)v11 != v7) {
            objc_enumerationMutation(v5);
          }
          if (!objc_msgSend(*(id *)(*((void *)&v10 + 1) + 8 * i), "compareIDs:", v4, (void)v10))
          {
            LOBYTE(v6) = 1;
            goto LABEL_12;
          }
        }
        uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
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
    LOBYTE(v6) = 0;
  }

  return v6;
}

- (void)_handlePreferredServiceChangedNotification:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(38);
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v9 = "-[CKConversation _handlePreferredServiceChangedNotification:]";
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "%s", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    uint64_t v7 = "-[CKConversation _handlePreferredServiceChangedNotification:]";
    _CKLog();
  }
  uint64_t v6 = objc_msgSend(MEMORY[0x1E4F28EB8], "defaultCenter", v7);
  [v6 postNotificationName:@"CKConversationPreferredServiceChangedNotification" object:self userInfo:0];

  [(CKConversation *)self _clearTypingIndicatorsIfNecessary];
}

- (void)_chatItemsDidChange:(id)a3
{
  previewText = self->_previewText;
  self->_previewText = 0;
}

- (void)_chatPropertiesChanged:(id)a3
{
  id v3 = +[CKConversationList sharedConversationList];
  [v3 _postConversationListChangedNotification];
}

- (BOOL)_isSendButtonDisabledForCarrierMessaging
{
  if ([(CKConversation *)self recipientCount])
  {
    id v3 = [(CKConversation *)self sendingService];
    if (objc_msgSend(v3, "__ck_isSMS") && -[CKConversation isPending](self, "isPending"))
    {
      int v4 = [MEMORY[0x1E4F6BDC0] smsEnabled];

      if (!v4)
      {
        LOBYTE(v5) = 1;
        return v5;
      }
    }
    else
    {
    }
  }
  if ([(CKConversation *)self recipientCount])
  {
    uint64_t v6 = [(CKConversation *)self sendingService];
    if (objc_msgSend(v6, "__ck_isRCS") && -[CKConversation isPending](self, "isPending"))
    {
      uint64_t v7 = [MEMORY[0x1E4F6E9B0] sharedInstance];
      int v5 = [v7 isRCSEnabled] ^ 1;
    }
    else
    {
      LOBYTE(v5) = 0;
    }
  }
  else
  {
    LOBYTE(v5) = 0;
  }
  return v5;
}

- (char)sendButtonColor
{
  if ([(CKConversation *)self _isSendButtonDisabledForCarrierMessaging]) {
    return -1;
  }
  if ([(CKConversation *)self isMapKitBusinessConversation]
    || [(CKConversation *)self isStewieConversation])
  {
    return 6;
  }
  int v5 = [(CKConversation *)self sendingService];
  char v6 = objc_msgSend(v5, "__ck_displayColor");

  return v6;
}

- (BOOL)noAvailableServices
{
  return 0;
}

- (NSString)deviceIndependentID
{
  id v2 = [(CKConversation *)self chat];
  id v3 = [v2 deviceIndependentID];

  return (NSString *)v3;
}

- (NSString)pinningIdentifier
{
  id v2 = [(CKConversation *)self chat];
  id v3 = [v2 pinningIdentifier];

  return (NSString *)v3;
}

- (int)wasDetectedAsSMSCategory
{
  id v3 = [(CKConversation *)self chat];
  int v4 = [v3 valueForChatProperty:*MEMORY[0x1E4F6BE58]];
  if ((int)[v4 intValue] < 1)
  {
    char v6 = [(CKConversation *)self chat];
    uint64_t v7 = [v6 valueForChatProperty:*MEMORY[0x1E4F6BE70]];
    self->_wasDetectedAsSMSCategory = [v7 intValue] != 0;
    p_wasDetectedAsSMSCategory = &self->_wasDetectedAsSMSCategory;
  }
  else
  {
    self->_wasDetectedAsSMSCategory = 1;
    p_wasDetectedAsSMSCategory = &self->_wasDetectedAsSMSCategory;
  }

  return *p_wasDetectedAsSMSCategory;
}

- (int64_t)spamCategory
{
  id v3 = [(CKConversation *)self chat];
  int v4 = [v3 valueForChatProperty:*MEMORY[0x1E4F6BE70]];
  char v5 = [v4 BOOLValue];

  if (v5) {
    return 2;
  }
  uint64_t v7 = (void *)MEMORY[0x1E4F6E938];
  uint64_t v8 = [(CKConversation *)self chat];
  uint64_t v9 = [v8 valueForChatProperty:*MEMORY[0x1E4F6BE58]];
  int64_t v10 = objc_msgSend(v7, "filterActionForCategory:", (int)objc_msgSend(v9, "intValue"));

  return v10;
}

- (int64_t)spamSubCategory
{
  id v3 = [(CKConversation *)self chat];
  int v4 = [v3 valueForChatProperty:*MEMORY[0x1E4F6BE58]];
  uint64_t v5 = (int)[v4 intValue];

  char v6 = [(CKConversation *)self chat];
  uint64_t v7 = [v6 valueForChatProperty:*MEMORY[0x1E4F6BE60]];
  uint64_t v8 = (int)[v7 intValue];

  uint64_t v9 = (void *)MEMORY[0x1E4F6E938];

  return [v9 filterSubActionForCategory:v5 subCategory:v8];
}

- (BOOL)hasKnownParticipants
{
  id v2 = [(CKConversation *)self chat];
  char v3 = [v2 hasKnownParticipants];

  return v3;
}

- (id)recipientsSortedByIsContact:(BOOL)a3 alphabetically:(BOOL)a4
{
  BOOL v4 = a4;
  BOOL v5 = a3;
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  if (v5)
  {
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"defaultIMHandle.isContact" ascending:0];
    [v7 addObject:v8];
  }
  if (v4)
  {
    uint64_t v9 = (void *)[objc_alloc(MEMORY[0x1E4F29008]) initWithKey:@"fullName" ascending:1 selector:sel_caseInsensitiveCompare_];
    [v7 addObject:v9];
  }
  int64_t v10 = [(CKConversation *)self recipients];
  long long v11 = [v10 sortedArrayUsingDescriptors:v7];

  return v11;
}

- (BOOL)isToEmailAddress
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  id v2 = [(CKConversation *)self recipients];
  uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v10;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v10 != v4) {
          objc_enumerationMutation(v2);
        }
        char v6 = [*(id *)(*((void *)&v9 + 1) + 8 * i) rawAddress];
        char v7 = [v6 _appearsToBeEmail];

        if (v7)
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [v2 countByEnumeratingWithState:&v9 objects:v13 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (void)_deleteAllMessagesAndRemoveGroup:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(27);
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412546;
      uint64_t v23 = self;
      __int16 v24 = 1024;
      BOOL v25 = v3;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_DEBUG, "deleting all messages involving conversation %@ and removing group: %d", buf, 0x12u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    long long v20 = self;
    BOOL v21 = v3;
    _CKLog();
  }
  char v6 = [(CKConversation *)self chat];
  int v7 = [v6 isBusinessChat];
  uint64_t v8 = [MEMORY[0x1E4F6E6D0] sharedManager];
  if ([v8 isFeatureEnabled])
  {
    int v9 = [v6 hasCommSafetySensitiveMessage];

    if (!v9) {
      goto LABEL_12;
    }
    long long v10 = (void *)MEMORY[0x1E4F6BC78];
    uint64_t v8 = [(CKConversation *)self chat];
    [v10 registerEvent:2 eventType:3 messageGUID:0 chat:v8 forImages:0];
  }

LABEL_12:
  if (v3) {
    [v6 remove];
  }
  else {
    [v6 deleteAllHistory];
  }
  if (v7) {
    [v6 deleteExtensionPayloadData];
  }
  if (![(CKConversation *)self isGroupConversation])
  {
    long long v11 = [(CKConversation *)self recipient];
    long long v12 = [v11 rawAddress];
    BOOL v13 = v12 == 0;

    if (!v13)
    {
      uint64_t v14 = objc_alloc_init(CKDetailsContactsManager);
      uint64_t v15 = [(CKConversation *)self recipient];
      long long v16 = [v15 rawAddress];
      [(CKDetailsContactsManager *)v14 setPreferredCallService:0 forID:v16];
    }
  }
  long long v17 = +[CKDraftManager sharedInstance];
  [v17 setDraft:0 forConversation:self];

  if (IMOSLoggingEnabled())
  {
    long long v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 136315138;
      uint64_t v23 = (CKConversation *)"-[CKConversation _deleteAllMessagesAndRemoveGroup:]";
      _os_log_impl(&dword_18EF18000, v18, OS_LOG_TYPE_INFO, "%s requesting purge of default snapshot", buf, 0xCu);
    }
  }
  id v19 = objc_alloc_init(MEMORY[0x1E4FA69B8]);
  [v19 deleteSnapshotsForApplicationIdentifier:@"com.apple.MobileSMS"];
  [v19 invalidate];
}

- (void)deleteAllMessages
{
}

- (void)deleteAllMessagesAndRemoveGroup
{
}

- (BOOL)_earlyReturnHistoryLoad
{
  return !CKIsRunningInPreferences()
      && !CKIsRunningInNanoSettings()
      && !CKIsRunningInMessagesOrSpringBoard()
      && (IMIsRunningInMessagesComposeViewService() & 1) == 0
      && !CKIsRunningInMessagesNotificationExtension()
      && !CKIsRunningInMessagesAssistantUIExtension()
      && !CKIsRunningInMessagesTranscriptExtension()
      || CKIsRunningUnitTests() != 0;
}

- (void)loadAllMessages
{
  BOOL v3 = _os_activity_create(&dword_18EF18000, "com.apple.messages.HistoryLoad", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0;
  state.opaque[1] = 0;
  os_activity_scope_enter(v3, &state);
  if (![(CKConversation *)self _earlyReturnHistoryLoad])
  {
    unsigned int v4 = [(CKConversation *)self limitToLoad];
    if ([(CKConversation *)self _chatHasValidUnreadMessageToLoad])
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "First unread message is not loaded. Increasing limitToLoad to 100 for Catch Up.", buf, 2u);
        }
      }
      unsigned int v4 = 100;
    }
    int v6 = CKIsRunningInRemoteIntentClient();
    if (v4
      && ([(IMChat *)self->_chat setNumberOfMessagesToKeepLoaded:v4], v4 >= 2))
    {
      chat = self->_chat;
      if (v6)
      {
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __33__CKConversation_loadAllMessages__block_invoke;
        void v9[3] = &unk_1E5626FA0;
        void v9[4] = self;
        [(IMChat *)chat fetchMessagesUpToLimit:v4 completion:v9];
        goto LABEL_16;
      }
      id v8 = (id)[(IMChat *)chat loadMessagesBeforeDate:0 limit:v4 loadImmediately:1];
    }
    else if (v6)
    {
      goto LABEL_16;
    }
    self->_needsReload = 0;
    [(CKConversation *)self setCompletedInitialChatMessagesLoad:1];
  }
LABEL_16:
  os_activity_scope_leave(&state);
}

uint64_t __33__CKConversation_loadAllMessages__block_invoke(uint64_t a1, uint64_t a2)
{
  (*(void (**)(uint64_t))(a2 + 16))(a2);
  *(unsigned char *)(*(void *)(a1 + 32) + 13) = 0;
  BOOL v3 = *(void **)(a1 + 32);

  return [v3 setCompletedInitialChatMessagesLoad:1];
}

- (void)fetchAllMessages:(id)a3
{
  id v4 = a3;
  if (![(CKConversation *)self _earlyReturnHistoryLoad])
  {
    unsigned int v5 = [(CKConversation *)self limitToLoad];
    if (v5)
    {
      unsigned int v6 = v5;
      uint64_t v7 = v5;
      [(IMChat *)self->_chat setNumberOfMessagesToKeepLoaded:v5];
      if (v6 != 1)
      {
        chat = self->_chat;
        v9[0] = MEMORY[0x1E4F143A8];
        v9[1] = 3221225472;
        v9[2] = __35__CKConversation_fetchAllMessages___block_invoke;
        void v9[3] = &unk_1E5626FC8;
        void v9[4] = self;
        id v10 = v4;
        [(IMChat *)chat fetchMessagesUpToLimit:v7 completion:v9];
      }
    }
  }
}

uint64_t __35__CKConversation_fetchAllMessages___block_invoke(uint64_t a1)
{
  (*(void (**)(void))(*(void *)(a1 + 40) + 16))();
  *(unsigned char *)(*(void *)(a1 + 32) + 13) = 0;
  id v2 = *(void **)(a1 + 32);

  return [v2 setCompletedInitialChatMessagesLoad:1];
}

- (void)loadAllUnreadMessagesUpToMessageGUID:(id)a3
{
  id v9 = a3;
  BOOL v4 = [(CKConversation *)self _earlyReturnHistoryLoad];
  unsigned int v5 = v9;
  if (!v4)
  {
    unsigned int v6 = [(CKConversation *)self limitToLoad];
    if (v6)
    {
      unsigned int v7 = v6;
      [(IMChat *)self->_chat setNumberOfMessagesToKeepLoaded:v6];
      if (v7 != 1) {
        id v8 = (id)[(IMChat *)self->_chat loadUnreadMessagesWithLimit:v7 fallbackToMessagesUpToGUID:v9];
      }
    }
    self->_needsReload = 0;
    unsigned int v5 = v9;
  }
}

- (void)loadMoreMessagesBeforeFirstMessage
{
  BOOL v3 = _os_activity_create(&dword_18EF18000, "com.apple.messages.HistoryLoadMore", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v10.opaque[0] = 0;
  v10.opaque[1] = 0;
  os_activity_scope_enter(v3, &v10);
  if (![(CKConversation *)self _earlyReturnHistoryLoad])
  {
    BOOL v4 = +[CKUIBehavior sharedBehaviors];
    unsigned int v5 = [v4 defaultConversationLoadMoreCount];

    unsigned int v6 = [(CKConversation *)self limitToLoad];
    if (v6)
    {
      [(IMChat *)self->_chat setNumberOfMessagesToKeepLoaded:v6];
      if (v6 >= 2)
      {
        unsigned int v7 = [(IMChat *)self->_chat firstMessage];
        id v8 = [v7 guid];
        id v9 = (id)[(IMChat *)self->_chat loadMessagesBeforeAndAfterGUID:v8 numberOfMessagesToLoadBeforeGUID:v5 numberOfMessagesToLoadAfterGUID:0 loadImmediately:1 threadIdentifier:0];
      }
    }
  }
  os_activity_scope_leave(&v10);
}

- (void)fetchMoreMessagesBeforeFirstMessage:(id)a3
{
  id v4 = a3;
  unsigned int v5 = _os_activity_create(&dword_18EF18000, "com.apple.messages.HistoryLoadMore", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
  v11.opaque[0] = 0;
  v11.opaque[1] = 0;
  os_activity_scope_enter(v5, &v11);
  if (![(CKConversation *)self _earlyReturnHistoryLoad])
  {
    unsigned int v6 = +[CKUIBehavior sharedBehaviors];
    unsigned int v7 = [v6 defaultConversationLoadMoreCount];

    unsigned int v8 = [(CKConversation *)self limitToLoad];
    if (v8)
    {
      [(IMChat *)self->_chat setNumberOfMessagesToKeepLoaded:v8];
      if (v8 >= 2)
      {
        id v9 = [(IMChat *)self->_chat firstMessage];
        os_activity_scope_state_s v10 = [v9 guid];
        [(IMChat *)self->_chat fetchMessagesBeforeAndAfterGUID:v10 numberOfMessagesToLoadBeforeGUID:v7 numberOfMessagesToLoadAfterGUID:0 threadIdentifier:0 completion:v4];
      }
    }
  }
  os_activity_scope_leave(&v11);
}

- (void)loadMoreMessagesAfterLastMessage
{
  if (![(CKConversation *)self _earlyReturnHistoryLoad])
  {
    BOOL v3 = +[CKUIBehavior sharedBehaviors];
    unsigned int v4 = [v3 defaultConversationLoadMoreCount];

    [(CKConversation *)self setLimitToLoad:[(CKConversation *)self limitToLoad] + v4];
    unsigned int v5 = [(CKConversation *)self limitToLoad];
    if (v5)
    {
      unsigned int v6 = v5;
      [(IMChat *)self->_chat setNumberOfMessagesToKeepLoaded:v5];
      if (v6 != 1)
      {
        id v9 = [(IMChat *)self->_chat lastMessage];
        unsigned int v7 = [v9 guid];
        id v8 = (id)[(IMChat *)self->_chat loadMessagesBeforeAndAfterGUID:v7 numberOfMessagesToLoadBeforeGUID:0 numberOfMessagesToLoadAfterGUID:v4 loadImmediately:1 threadIdentifier:0];
      }
    }
  }
}

- (void)fetchMoreMessagesAfterLastMessage:(id)a3
{
  id v10 = a3;
  if (![(CKConversation *)self _earlyReturnHistoryLoad])
  {
    unsigned int v4 = +[CKUIBehavior sharedBehaviors];
    unsigned int v5 = [v4 defaultConversationLoadMoreCount];

    [(CKConversation *)self setLimitToLoad:[(CKConversation *)self limitToLoad] + v5];
    unsigned int v6 = [(CKConversation *)self limitToLoad];
    if (v6)
    {
      unsigned int v7 = v6;
      [(IMChat *)self->_chat setNumberOfMessagesToKeepLoaded:v6];
      if (v7 != 1)
      {
        id v8 = [(IMChat *)self->_chat lastMessage];
        id v9 = [v8 guid];
        [(IMChat *)self->_chat fetchMessagesBeforeAndAfterGUID:v9 numberOfMessagesToLoadBeforeGUID:0 numberOfMessagesToLoadAfterGUID:v5 threadIdentifier:0 completion:v10];
      }
    }
  }
}

- (NSArray)frequentReplies
{
  id v2 = [(IMChat *)self->_chat frequentReplies];
  BOOL v3 = v2;
  if (!v2) {
    id v2 = (void *)MEMORY[0x1E4F1CBF0];
  }
  unsigned int v4 = v2;

  return v4;
}

- (void)loadFrequentReplies
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (CKIsRunningInMessagesOrSpringBoard()
    || (IMIsRunningInMessagesComposeViewService() & 1) != 0
    || CKIsRunningInMessagesNotificationExtension())
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(21);
      BOOL v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        chat = self->_chat;
        *(_DWORD *)long long buf = 138412546;
        os_activity_scope_state_s v11 = chat;
        __int16 v12 = 2112;
        BOOL v13 = self;
        _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_DEBUG, "Loading common replies for imchat %@ on conversation %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_CKShouldLog())
      {
        id v8 = self->_chat;
        id v9 = self;
        _CKLog();
      }
    }
    unsigned int v5 = +[CKUIBehavior sharedBehaviors];
    uint64_t v6 = [v5 commonRepliesLoadLimit];

    id v7 = (id)[(IMChat *)self->_chat loadFrequentRepliesLimit:v6 loadImmediately:1];
  }
}

- (void)loadMoreMessages
{
  BOOL v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 defaultConversationLoadMoreCount];

  [(CKConversation *)self setLimitToLoad:[(CKConversation *)self limitToLoad] + v4];
  if ([(CKConversation *)self hasLoadedFromSpotlight])
  {
    [(CKConversation *)self loadMoreMessagesBeforeFirstMessage];
  }
  else
  {
    [(CKConversation *)self loadAllMessages];
  }
}

- (void)fetchMoreMessages:(id)a3
{
  id v6 = a3;
  int v4 = +[CKUIBehavior sharedBehaviors];
  int v5 = [v4 defaultConversationLoadMoreCount];

  [(CKConversation *)self setLimitToLoad:[(CKConversation *)self limitToLoad] + v5];
  [(CKConversation *)self fetchMoreMessagesBeforeFirstMessage:v6];
}

- (void)setLoadedMessageCount:(unint64_t)a3 loadImmediately:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(27);
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      unsigned int limitToLoad = self->_limitToLoad;
      id v9 = [(CKConversation *)self shortDescription];
      *(_DWORD *)long long buf = 67109634;
      unsigned int v18 = limitToLoad;
      __int16 v19 = 2048;
      unint64_t v20 = a3;
      __int16 v21 = 2112;
      uint64_t v22 = v9;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Setting limit to load (old: %d   new: %lu) for conversation: %@", buf, 0x1Cu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
  {
    uint64_t v10 = self->_limitToLoad;
    [(CKConversation *)self shortDescription];
    v16 = unint64_t v15 = a3;
    uint64_t v14 = v10;
    _CKLogExternal();
  }
  if (self->_limitToLoad == a3)
  {
    if (![(CKConversation *)self hasLoadedFromSpotlight])
    {
      if (self->_limitToLoad)
      {
        os_activity_scope_state_s v11 = [(CKConversation *)self chat];
        __int16 v12 = [v11 _items];
        BOOL v13 = [v12 count] == 0;

        if (v13) {
          [(CKConversation *)self setNeedsReload];
        }
      }
      [(CKConversation *)self reloadIfNeeded];
    }
  }
  else
  {
    [(CKConversation *)self setLimitToLoad:a3];
    if (v4 && ![(CKConversation *)self hasLoadedFromSpotlight]) {
      [(CKConversation *)self loadAllMessages];
    }
  }
}

- (BOOL)_chatHasValidUnreadMessageToLoad
{
  if (!CKIsCatchUpEnabled()) {
    return 0;
  }
  uint64_t v3 = [(IMChat *)self->_chat unreadMessageCount];
  BOOL v4 = [(IMChat *)self->_chat lastSeenMessageGuid];
  int v5 = [(IMChat *)self->_chat messageForGUID:v4];
  if (v3) {
    BOOL v6 = [v4 length] != 0;
  }
  else {
    BOOL v6 = 0;
  }
  if (v5) {
    BOOL v7 = 0;
  }
  else {
    BOOL v7 = v6;
  }

  return v7;
}

- (void)setLoadedMessageCount:(unint64_t)a3
{
}

- (id)ensureMessageWithGUIDIsLoaded:(id)a3
{
  id v4 = a3;
  int v5 = [(IMChat *)self->_chat messageForGUID:v4];
  if (!v5)
  {
    BOOL v6 = +[CKUIBehavior sharedBehaviors];
    uint64_t v7 = [v6 defaultConversationViewingMessageCount];

    id v8 = (id)[(IMChat *)self->_chat loadMessagesBeforeAndAfterGUID:v4 numberOfMessagesToLoadBeforeGUID:v7 numberOfMessagesToLoadAfterGUID:v7 loadImmediately:1 threadIdentifier:0];
    int v5 = [(IMChat *)self->_chat messageForGUID:v4];
    if (v5)
    {
      _sHasLoadedGuidFromSpotlight = 1;
      [(CKConversation *)self setNeedsReload];
    }
    unsigned int v9 = [(CKConversation *)self limitToLoad];
    unsigned int v10 = [(IMChat *)self->_chat messageCount];
    if (v9 <= v10) {
      uint64_t v11 = v10;
    }
    else {
      uint64_t v11 = v9;
    }
    [(CKConversation *)self setLimitToLoad:v11];
  }

  return v5;
}

- (void)clearConversationLoadFromSpotlight
{
  _sHasLoadedGuidFromSpotlight = 0;
}

- (BOOL)hasLoadedFromSpotlight
{
  return _sHasLoadedGuidFromSpotlight;
}

- (void)enumerateMessagesWithOptions:(unint64_t)a3 usingBlock:(id)a4
{
  id v6 = a4;
  id v8 = [(CKConversation *)self chat];
  uint64_t v7 = [v8 chatItems];
  [v7 enumerateMessagesWithOptions:a3 usingBlock:v6];
}

- (void)markAllMessagesAsRead
{
  if (![MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled]) {
    goto LABEL_5;
  }
  uint64_t v3 = [(CKConversation *)self chat];
  id v4 = v3;
  if (!v3 || (v6 = v3, int v5 = [v3 allowedByScreenTime], v4 = v6, v5))
  {

LABEL_5:
    uint64_t v7 = [(CKConversation *)self chat];
    [v7 markAllMessagesAsRead];
    id v4 = v7;
  }
}

- (void)markLastMessageAsUnread
{
  id v2 = [(CKConversation *)self chat];
  [v2 markLastMessageAsUnread];
}

- (BOOL)canReadStateBeToggled
{
  return ![(CKConversation *)self hasLeftGroupChat];
}

- (void)updateLastViewedDate
{
  id v3 = [MEMORY[0x1E4F1C9C8] date];
  [(CKConversation *)self setDateLastViewed:v3];
}

- (id)shortDescription
{
  id v3 = objc_getAssociatedObject(self, "CKConversationShortDescriptionKey");
  if (!v3)
  {
    id v4 = [NSString alloc];
    uint64_t v5 = objc_opt_class();
    id v6 = [(CKConversation *)self chat];
    uint64_t v7 = [v6 persistentID];
    id v8 = [(CKConversation *)self chat];
    unsigned int v9 = [v8 guid];
    unsigned int v10 = [(CKConversation *)self chat];
    uint64_t v11 = [v10 participants];
    id v3 = (void *)[v4 initWithFormat:@"%@<%p>{identifier:'%@'  guid:'%@'}%@", v5, self, v7, v9, v11];

    objc_setAssociatedObject(self, "CKConversationShortDescriptionKey", v3, (void *)1);
  }

  return v3;
}

- (void)setPendingComposeRecipients:(id)a3
{
  id v4 = [a3 composeRecipientHandles];
  [(CKConversation *)self setPendingHandles:v4];
}

- (void)setPendingRecipients:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (![(NSSet *)self->_pendingRecipients isEqualToSet:v5])
  {
    objc_storeStrong((id *)&self->_pendingRecipients, a3);
    id v6 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v6 postNotificationName:@"CKConversationPendingRecipientsUpdatedNotification" object:self];

    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = 138412546;
        id v9 = v5;
        __int16 v10 = 2112;
        uint64_t v11 = @"CKConversationPendingRecipientsUpdatedNotification";
        _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_INFO, "Setting pending recipients to: %@ and firing notification: %@", (uint8_t *)&v8, 0x16u);
      }
    }
  }
}

- (void)setPendingHandles:(id)a3
{
  id v5 = (NSArray *)a3;
  if (self->_pendingHandles != v5)
  {
    id v6 = v5;
    objc_storeStrong((id *)&self->_pendingHandles, a3);
    [(CKConversation *)self resetCaches];
    id v5 = v6;
  }
}

- (NSArray)pendingEntities
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [(CKConversation *)self pendingHandles];
  uint64_t v4 = [v3 count];

  if (v4)
  {
    id v5 = objc_alloc(MEMORY[0x1E4F1CA48]);
    id v6 = [(CKConversation *)self pendingHandles];
    uint64_t v7 = objc_msgSend(v5, "initWithCapacity:", objc_msgSend(v6, "count"));

    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    int v8 = [(CKConversation *)self pendingHandles];
    uint64_t v9 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v11 = *(void *)v16;
      do
      {
        for (uint64_t i = 0; i != v10; ++i)
        {
          if (*(void *)v16 != v11) {
            objc_enumerationMutation(v8);
          }
          BOOL v13 = [[CKEntity alloc] initWithIMHandle:*(void *)(*((void *)&v15 + 1) + 8 * i)];
          if (v13) {
            [v7 addObject:v13];
          }
        }
        uint64_t v10 = [v8 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v10);
    }
  }
  else
  {
    uint64_t v7 = 0;
  }

  return (NSArray *)v7;
}

- (NSArray)recipientStrings
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(CKConversation *)self recipients];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) rawAddress];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];

  return (NSArray *)v10;
}

- (NSSet)recipientNames
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = [(CKConversation *)self recipients];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) fullName];
        if (v9) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  uint64_t v10 = (void *)[v3 copy];

  return (NSSet *)v10;
}

- (BOOL)canAcceptMediaObjectType:(int)a3 givenMediaObjects:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  uint64_t v7 = [(CKConversation *)self sendingService];
  int v8 = [(CKConversation *)self lastAddressedHandle];
  uint64_t v9 = [(CKConversation *)self lastAddressedSIMID];
  int v10 = objc_msgSend(v7, "__ck_isSMS");
  uint64_t v11 = objc_opt_class();
  if (v10) {
    char v12 = objc_msgSend(v11, "_sms_canAcceptMediaObjectType:givenMediaObjects:phoneNumber:simID:", v4, v6, v8, v9);
  }
  else {
    char v12 = objc_msgSend(v11, "_iMessage_canAcceptMediaObjectType:givenMediaObjects:", v4, v6);
  }
  BOOL v13 = v12;

  return v13;
}

- (BOOL)_allowedByScreenTime
{
  if (![MEMORY[0x1E4F6BCB0] isContactLimitsFeatureEnabled]) {
    return 1;
  }
  uint64_t v3 = [(CKConversation *)self chat];
  if (!v3) {
    return 1;
  }
  uint64_t v4 = (void *)v3;
  uint64_t v5 = [(CKConversation *)self chat];
  char v6 = [v5 allowedToShowConversationSync];

  return v6;
}

- (BOOL)canSendComposition:(id)a3 error:(id *)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  BOOL v7 = [(CKConversation *)self canSendComposition:v6 forCapabilities:0x10000 error:a4];
  if (a4 && !v7)
  {
    if (IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        uint64_t v9 = [*a4 localizedDescription];
        int v21 = 138412290;
        uint64_t v22 = v9;
        _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "Cannot send composition due to error %@", (uint8_t *)&v21, 0xCu);
      }
    }
    goto LABEL_18;
  }
  if (![(CKConversation *)self _allowedByScreenTime])
  {
LABEL_18:
    char v17 = 0;
    goto LABEL_19;
  }
  int v10 = [(CKConversation *)self sendingService];
  BOOL v11 = [(CKConversation *)self isToEmailAddress];
  if (objc_msgSend(v10, "__ck_isSMS"))
  {
    char v12 = objc_opt_class();
    BOOL v13 = [(CKConversation *)self lastAddressedHandle];
    long long v14 = [(CKConversation *)self lastAddressedSIMID];
    char v15 = objc_msgSend(v12, "_sms_canSendComposition:lastAddressedHandle:lastAddressedSIMID:recipientsContainEmail:error:", v6, v13, v14, v11, a4);
LABEL_12:
    char v17 = v15;
    goto LABEL_13;
  }
  if (objc_msgSend(v10, "__ck_isRCS"))
  {
    long long v16 = objc_opt_class();
    BOOL v13 = [(CKConversation *)self lastAddressedHandle];
    long long v14 = [(CKConversation *)self lastAddressedSIMID];
    char v15 = objc_msgSend(v16, "_rcs_canSendComposition:lastAddressedHandle:lastAddressedSIMID:recipientsContainEmail:error:", v6, v13, v14, v11, a4);
    goto LABEL_12;
  }
  if (!objc_msgSend(v10, "__ck_isMadrid"))
  {
    char v17 = 1;
    goto LABEL_14;
  }
  long long v18 = objc_opt_class();
  BOOL v13 = [(CKConversation *)self lastAddressedHandle];
  long long v14 = [(CKConversation *)self lastAddressedSIMID];
  __int16 v19 = [(CKConversation *)self chat];
  char v17 = objc_msgSend(v18, "_iMessage_canSendComposition:lastAddressedHandle:lastAddressedSIMID:currentService:forceSMS:error:", v6, v13, v14, v10, objc_msgSend(v19, "shouldForceToSMS"), a4);

LABEL_13:
LABEL_14:

LABEL_19:
  return v17;
}

- (BOOL)canSendToRecipients:(id)a3 alertIfUnable:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  BOOL v7 = [(CKConversation *)self sendingService];
  if (objc_msgSend(v7, "__ck_isSMS")) {
    BOOL v8 = [(CKConversation *)self _sms_canSendToRecipients:v6 alertIfUnable:v4];
  }
  else {
    BOOL v8 = [(CKConversation *)self _iMessage_canSendToRecipients:v6 alertIfUnable:v4];
  }
  BOOL v9 = v8;

  return v9;
}

- (double)maxTrimDurationForMedia:(id)a3
{
  uint64_t v4 = [a3 mediaType];
  uint64_t v5 = [(CKConversation *)self sendingService];
  int v6 = objc_msgSend(v5, "__ck_isSMS");
  BOOL v7 = objc_opt_class();
  if (v6) {
    objc_msgSend(v7, "_sms_maxTrimDurationForMediaType:", v4);
  }
  else {
    objc_msgSend(v7, "_iMessage_maxTrimDurationForMediaType:", v4);
  }
  double v9 = v8;

  return v9;
}

- (void)resortMessagesIfNecessary
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  uint64_t v3 = [MEMORY[0x1E4F1C9C8] date];
  uint64_t v4 = [(CKConversation *)self dateLastViewed];
  if (v4)
  {
    uint64_t v5 = [(CKConversation *)self dateLastViewed];
    [v3 timeIntervalSinceDate:v5];
    double v7 = v6;
    double v8 = +[CKUIBehavior sharedBehaviors];
    [v8 transcriptResortTimeout];
    double v10 = v9;

    if (v7 > v10)
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = [(CKConversation *)self dateLastViewed];
          BOOL v13 = +[CKUIBehavior sharedBehaviors];
          [v13 transcriptResortTimeout];
          int v16 = 138413058;
          char v17 = self;
          __int16 v18 = 2112;
          id v19 = v12;
          __int16 v20 = 2112;
          int v21 = v3;
          __int16 v22 = 2048;
          uint64_t v23 = v14;
          _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_INFO, "re-sorting messages in conversation: %@ date last viewed: %@, date now: %@, resort timeout: %f", (uint8_t *)&v16, 0x2Au);
        }
      }
      char v15 = [(CKConversation *)self chat];
      [v15 resortMessages];
    }
  }
}

- (id)messageWithComposition:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(CKConversation *)self chat];
  double v6 = [v5 localTypingMessageGUID];

  double v7 = [(CKConversation *)self sendingServiceImpl];
  if (([v7 shouldReuseTypingIndicatorGUID] & 1) == 0)
  {

    goto LABEL_5;
  }
  double v8 = [(CKConversation *)self chat];
  int v9 = [v8 isGroupChat];

  if (v9)
  {
LABEL_5:
    uint64_t v10 = [NSString stringGUID];

    double v6 = (void *)v10;
  }
  BOOL v11 = [v4 messageWithGUID:v6];

  return v11;
}

- (id)messagesFromComposition:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [(CKConversation *)self chat];
  double v6 = [v5 localTypingMessageGUID];

  double v7 = [(CKConversation *)self sendingServiceImpl];
  if ([v7 shouldReuseTypingIndicatorGUID])
  {
    double v8 = [(CKConversation *)self chat];
    int v9 = [v8 isGroupChat];

    if (!v9) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  uint64_t v10 = [NSString stringGUID];

  double v6 = (void *)v10;
LABEL_6:
  BOOL v11 = [(CKConversation *)self sendingService];
  id v12 = [v4 messagesFromCompositionFirstGUIDForMessage:v6 sendingService:v11];

  BOOL v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v14 = [v13 isCarrierPigeonEnabled];

  if (v14)
  {
    char v15 = [(CKConversation *)self chat];
    int v16 = [v15 shouldDisplayOffGridModeStatus];

    if (v16)
    {
      long long v25 = 0u;
      long long v26 = 0u;
      long long v23 = 0u;
      long long v24 = 0u;
      id v17 = v12;
      uint64_t v18 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
      if (v18)
      {
        uint64_t v19 = v18;
        uint64_t v20 = *(void *)v24;
        do
        {
          for (uint64_t i = 0; i != v19; ++i)
          {
            if (*(void *)v24 != v20) {
              objc_enumerationMutation(v17);
            }
            objc_msgSend(*(id *)(*((void *)&v23 + 1) + 8 * i), "setPendingSatelliteSend:", 1, (void)v23);
          }
          uint64_t v19 = [v17 countByEnumeratingWithState:&v23 objects:v27 count:16];
        }
        while (v19);
      }
    }
  }

  return v12;
}

- (void)retryMessage:(id)a3 onService:(id)a4
{
  id v7 = a3;
  id v6 = a4;
  [v7 setIsTapToRetry:1];
  if (([v7 scheduleState] & 0xFFFFFFFFFFFFFFFELL) == 4) {
    [v7 setScheduleState:1];
  }
  [(CKConversation *)self sendMessage:v7 onService:v6 newComposition:0];
  [v7 setIsTapToRetry:0];
}

- (void)sendMessage:(id)a3 onService:(id)a4 newComposition:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v49 = a4;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(27);
    int v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      uint64_t v10 = @"NO";
      *(_DWORD *)long long buf = 138412802;
      id v56 = v8;
      __int16 v57 = 2112;
      if (v5) {
        uint64_t v10 = @"YES";
      }
      id v58 = v49;
      __int16 v59 = 2112;
      id v60 = v10;
      _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "sendMessage:onService:newComposition: [%@] [%@] [%@]", buf, 0x20u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
  {
    if (v5) {
      BOOL v11 = @"YES";
    }
    else {
      BOOL v11 = @"NO";
    }
    id v46 = v49;
    id v47 = v11;
    id v44 = v8;
    _CKLogExternal();
  }
  if ([(CKConversation *)self hasLeftGroupChat])
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(27);
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_DEBUG, "Failing to send message on a group chat we've left before", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
LABEL_20:
    }
      _CKLog();
  }
  else if ([(CKConversation *)self isReadOnlyChat])
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(27);
      BOOL v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_DEBUG, "Failing to send message on a read only chat", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      goto LABEL_20;
    }
  }
  else
  {
    v48 = [(CKConversation *)self chat];
    if (v49)
    {
      int v14 = [MEMORY[0x1E4F6BBD8] sharedInstance];
      char v15 = [v14 bestAccountForService:v49];
    }
    else
    {
      char v15 = [v48 account];
    }
    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    int v16 = [v8 fileTransferGUIDs];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v54 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v51;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v51 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v50 + 1) + 8 * i);
          int v21 = [MEMORY[0x1E4F6BCC8] sharedInstance];
          [v21 assignTransfer:v20 toMessage:v8 account:v15];
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v50 objects:v54 count:16];
      }
      while (v17);
    }

    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      __int16 v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = [v8 guid];
        *(_DWORD *)long long buf = 138412290;
        id v56 = v23;
        _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_INFO, "Sending message with guid: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      v45 = [v8 guid];
      _CKLogExternal();
    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      long long v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v56 = v48;
        _os_log_impl(&dword_18EF18000, v24, OS_LOG_TYPE_INFO, "  => Chat: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      v45 = v48;
      _CKLogExternal();
    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      long long v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v26 = [v48 account];
        *(_DWORD *)long long buf = 138412290;
        id v56 = v26;
        _os_log_impl(&dword_18EF18000, v25, OS_LOG_TYPE_INFO, "  => Sending account: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      v45 = [v48 account];
      _CKLogExternal();
    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      id v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        uint64_t v28 = [v48 account];
        id v29 = [v28 displayName];
        *(_DWORD *)long long buf = 138412290;
        id v56 = v29;
        _os_log_impl(&dword_18EF18000, v27, OS_LOG_TYPE_INFO, "  => Display name: %@", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      id v30 = [v48 account];
      v45 = [v30 displayName];
      _CKLogExternal();
    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      id v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        double v32 = [v48 participants];
        id v33 = [v32 componentsJoinedByString:@","];
        *(_DWORD *)long long buf = 138412290;
        id v56 = v33;
        _os_log_impl(&dword_18EF18000, v31, OS_LOG_TYPE_INFO, "  => Recipients: [%@]", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      long long v34 = [v48 participants];
      v45 = [v34 componentsJoinedByString:@","];
      _CKLogExternal();
    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      long long v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        long long v36 = [v8 fileTransferGUIDs];
        id v37 = [v36 componentsJoinedByString:@","];
        *(_DWORD *)long long buf = 138412290;
        id v56 = v37;
        _os_log_impl(&dword_18EF18000, v35, OS_LOG_TYPE_INFO, "  => Transfers: [%@]", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
    {
      v38 = [v8 fileTransferGUIDs];
      v45 = [v38 componentsJoinedByString:@","];
      _CKLogExternal();
    }
    objc_msgSend(v48, "sendMessage:onService:", v8, v49, v45);
    v39 = [(CKConversation *)self chat];
    if ([v39 unreadMessageCount] && CKIsRunningInMessages())
    {
      char v40 = [v8 isTypingMessage];

      if ((v40 & 1) == 0
        && (!+[CKStarkManager isCarPlayConnected]
         || !CKIsScreenLocked()))
      {
        if (IMOSLoggingEnabled())
        {
          v41 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
          {
            id v42 = [(CKConversation *)self chat];
            id v43 = [v42 chatIdentifier];
            *(_DWORD *)long long buf = 138412290;
            id v56 = v43;
            _os_log_impl(&dword_18EF18000, v41, OS_LOG_TYPE_INFO, "Marking chat %@ as read on message send ", buf, 0xCu);
          }
        }
        [(CKConversation *)self markAllMessagesAsRead];
      }
    }
    else
    {
    }
    [(CKConversation *)self _setProofReadingInfoForChat:v48 withMessage:v8];
  }
}

- (void)_setProofReadingInfoForChat:(id)a3 withMessage:(id)a4
{
  v59[2] = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 text];
  id v8 = objc_msgSend(v7, "__im_messagePartIndexes");
  uint64_t v9 = [v8 lastIndex];

  uint64_t v10 = objc_msgSend(v7, "__im_messagePartMatchingPartIndex:", v9);
  BOOL v11 = [v10 messagePartBody];
  id v12 = [v11 string];

  uint64_t v13 = [v12 length];
  int v14 = [v5 proofreadingInfo];
  uint64_t v15 = *MEMORY[0x1E4F6B9E0];
  int v16 = [v14 objectForKeyedSubscript:*MEMORY[0x1E4F6B9E0]];

  if ([v16 count])
  {
    id v49 = v10;
    long long v50 = v6;
    uint64_t v17 = v12;
    uint64_t v18 = [v5 proofreadingInfo];
    uint64_t v19 = [v18 objectForKeyedSubscript:v15];
    uint64_t v20 = [v19 objectForKeyedSubscript:@"UnderlineRanges"];

    int v21 = v20;
    if ([v20 count])
    {
      id v47 = [v50 guid];
      uint64_t v48 = [[NSString alloc] initWithFormat:@"p:%ld/%@", v9, v47];
      uint64_t v10 = v49;
      id v12 = v17;
      if (v9 && CKIsRunningInMacCatalyst())
      {
        id v46 = v21;
        __int16 v22 = objc_msgSend(v7, "attributedSubstringFromRange:", 0, v13);
        id v23 = [v22 string];

        long long v24 = [v5 proofreadingInfo];
        long long v25 = [v24 objectForKeyedSubscript:v15];
        id v26 = [v25 objectForKeyedSubscript:@"TextCorrections"];

        v45 = v26;
        id v27 = [v26 lastObject];
        if (v27)
        {
          id v44 = [v46 lastObject];
          [v44 rangeValue];
          uint64_t v42 = v28;
          uint64_t v29 = [v23 length];
          uint64_t v40 = v29 - [v27 length];
          id v30 = [v5 proofreadingInfo];
          id v31 = [v30 objectForKeyedSubscript:v15];
          v39 = [v31 objectForKeyedSubscript:@"ReplacedStrings"];

          long long v55 = v27;
          v56[0] = @"TextCorrections";
          id v43 = v27;
          v41 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v55 count:1];
          v57[0] = v41;
          v56[1] = @"ReplacedStrings";
          v38 = [v39 lastObject];
          long long v54 = v38;
          double v32 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v54 count:1];
          v57[1] = v32;
          v56[2] = @"UnderlineRanges";
          id v33 = objc_msgSend(MEMORY[0x1E4F29238], "valueWithRange:", v40, v42);
          long long v53 = v33;
          long long v34 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v53 count:1];
          v57[2] = v34;
          long long v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v57 forKeys:v56 count:3];

          id v27 = v43;
          v51[0] = *MEMORY[0x1E4F6B9E8];
          v51[1] = v15;
          v52[0] = v48;
          v52[1] = v35;
          long long v36 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v52 forKeys:v51 count:2];
          [v5 setProofreadingInfo:v36];
        }
        uint64_t v10 = v49;
        id v6 = v50;
        int v21 = v46;
        id v37 = (void *)v48;
      }
      else
      {
        v58[0] = *MEMORY[0x1E4F6B9E8];
        v58[1] = v15;
        id v37 = (void *)v48;
        v59[0] = v48;
        v59[1] = v16;
        id v23 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v59 forKeys:v58 count:2];
        [v5 setProofreadingInfo:v23];
        id v6 = v50;
      }
    }
    else
    {

      id v12 = v17;
      uint64_t v10 = v49;
      id v6 = v50;
    }
  }
}

- (void)sendMessage:(id)a3 newComposition:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(27);
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 67109120;
      BOOL v11 = v4;
      _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEBUG, "sending message on preferred service (newComposition: %d)", buf, 8u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    BOOL v9 = v4;
    _CKLog();
  }
  id v8 = [(CKConversation *)self sendingService];
  [(CKConversation *)self sendMessage:v6 onService:v8 newComposition:v4];
}

- (void)retractMessagePart:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversation *)self chat];
  [v5 retractMessagePart:v4];
}

- (void)retractScheduledMessageParts:(id)a3 fromAggregateChatItem:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [MEMORY[0x1E4F28E60] indexSet];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v17;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v17 != v12) {
          objc_enumerationMutation(v9);
        }
        objc_msgSend(v8, "addIndex:", objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v13++), "index", (void)v16));
      }
      while (v11 != v13);
      uint64_t v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v11);
  }

  int v14 = [(CKConversation *)self chat];
  uint64_t v15 = (void *)[v8 copy];
  [v14 retractScheduledMessagePartIndexes:v15 fromChatItem:v7];
}

- (void)editMessageItem:(id)a3 partIndex:(int64_t)a4 withNewComposition:(id)a5
{
  id v8 = a3;
  id v11 = [a5 superFormatText:0];
  id v9 = [(CKConversation *)self _backwardCompatabilityTextForEditedMessagePartText:v11];
  uint64_t v10 = [(CKConversation *)self chat];
  [v10 editMessageItem:v8 atPartIndex:a4 withNewPartText:v11 backwardCompatabilityText:v9];
}

- (void)resendEditedMessageItem:(id)a3 forPartIndex:(int64_t)a4
{
  id v6 = a3;
  id v11 = [v6 body];
  id v7 = objc_msgSend(v11, "__im_messagePartMatchingPartIndex:", a4);
  id v8 = [v7 messagePartBody];
  if ([v8 length])
  {
    id v9 = [(CKConversation *)self _backwardCompatabilityTextForEditedMessagePartText:v8];
  }
  else
  {
    id v9 = 0;
  }
  uint64_t v10 = [(CKConversation *)self chat];
  [v10 resendEditedMessageItem:v6 forPartIndex:a4 withBackwardCompatabilityText:v9];
}

- (id)_backwardCompatabilityTextForEditedMessagePartText:(id)a3
{
  v22[2] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = (void *)MEMORY[0x1E4F42F18];
  id v4 = a3;
  id v5 = [v3 currentInputMode];
  id v6 = [v5 primaryLanguage];

  id v7 = IMSharedUtilitiesFrameworkBundle();
  id v8 = (void *)MEMORY[0x1E4F28B50];
  id v9 = [v7 localizations];
  v22[0] = v6;
  uint64_t v10 = [v7 preferredLocalizations];
  id v11 = [v10 firstObject];
  v22[1] = v11;
  uint64_t v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v22 count:2];
  uint64_t v13 = [v8 preferredLocalizationsFromArray:v9 forPreferences:v12];
  int v14 = [v13 firstObject];

  uint64_t v15 = [v7 localizedStringForKey:@"EDITED_MESSAGE_BACKWARD_COMPATIBILITY_EDITED" value:0 table:@"IMSharedUtilities" localization:v14];
  long long v16 = [v7 localizedStringForKey:@"EDITED_MESSAGE_BACKWARD_COMPATIBILITY_FORMAT" value:0 table:@"IMSharedUtilities" localization:v14];
  long long v17 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v16];
  long long v18 = (void *)[v4 mutableCopy];

  objc_msgSend(v18, "removeAttribute:range:", *MEMORY[0x1E4F6C1F8], 0, objc_msgSend(v18, "length"));
  long long v19 = (void *)[v18 copy];
  uint64_t v20 = objc_msgSend(MEMORY[0x1E4F28B18], "localizedAttributedStringWithFormat:", v17, v15, v19);

  return v20;
}

- (BOOL)supportsMessageEditing
{
  if ([(CKConversation *)self hasLeftGroupChat])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        __int16 v11 = 0;
        id v4 = "Not allowing message editing because the user is no longer a member of this group chat.";
        id v5 = (uint8_t *)&v11;
LABEL_9:
        _os_log_impl(&dword_18EF18000, v3, OS_LOG_TYPE_INFO, v4, v5, 2u);
        goto LABEL_10;
      }
      goto LABEL_10;
    }
    return 0;
  }
  id v6 = [(CKConversation *)self chat];
  BOOL v7 = 1;
  char v8 = [v6 supportsCapabilities:1];

  if ((v8 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = 0;
        id v4 = "Not allowing message editing because the capability is not allowed.";
        id v5 = (uint8_t *)&v10;
        goto LABEL_9;
      }
LABEL_10:
    }
    return 0;
  }
  return v7;
}

- (BOOL)supportsInlineAdaptiveImageGlyphs
{
  id v2 = [(CKConversation *)self chat];
  uint64_t v3 = v2;
  if (v2) {
    char v4 = [v2 supportsCapabilities:0x400000];
  }
  else {
    char v4 = 1;
  }

  return v4;
}

- (BOOL)supportsSendLater
{
  uint64_t v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isScheduledMessagesEnabled];

  if (v4
    && ([(CKConversation *)self recipient],
        id v5 = objc_claimAutoreleasedReturnValue(),
        [v5 defaultIMHandle],
        id v6 = objc_claimAutoreleasedReturnValue(),
        char v7 = [v6 matchesLoginHandleForAnyAccount],
        v6,
        v5,
        (v7 & 1) == 0))
  {
    id v9 = [(CKConversation *)self chat];

    if (v9)
    {
      __int16 v10 = [(CKConversation *)self chat];
      LOBYTE(v8) = [v10 supportsCapabilities:0x80000];
    }
    else
    {
      __int16 v10 = [(CKConversation *)self sendingService];
      __int16 v11 = [MEMORY[0x1E4F6BDB8] iMessageService];
      uint64_t v8 = v10 == v11;
    }
  }
  else
  {
    LOBYTE(v8) = 0;
  }
  return v8;
}

- (void)repositionSticker:(id)a3 associatedChatItem:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(27);
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v13 = v6;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_INFO, "repositionSticker: [%@]", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLogExternal())
  {
    id v11 = v6;
    _CKLogExternal();
  }
  if ([(CKConversation *)self hasLeftGroupChat])
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(27);
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_DEBUG, "Failing to send message on a group chat we've left before", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
LABEL_15:
    }
      _CKLog();
  }
  else
  {
    if (![(CKConversation *)self isReadOnlyChat])
    {
      [(IMChat *)self->_chat repositionSticker:v6 associatedChatItem:v7];
      goto LABEL_25;
    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(27);
      __int16 v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_DEBUG, "Failing to send message on a read only chat", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      goto LABEL_15;
    }
  }
LABEL_25:
}

- (void)sendPendingSatelliteMessages
{
}

- (void)fetchIncomingPendingMessagesOverSatellite
{
}

- (BOOL)_allowedToSendTypingIndicators
{
  if ([(CKConversation *)self isIgnoringTypingUpdates]
    || !CKIsRunningInMessagesOrSpringBoard()
    && !CKIsRunningInMessagesNotificationViewService()
    && (IMIsRunningInMessagesComposeViewService() & 1) == 0
    && !CKIsRunningInMessagesNotificationExtension())
  {
    return 0;
  }
  int v4 = [(CKConversation *)self chat];
  char v5 = [v4 supportsSendingTypingIndicators];

  return v5;
}

- (void)setLocalUserIsComposing:(id)a3
{
  id v5 = a3;
  if ([(CKConversation *)self _allowedToSendTypingIndicators])
  {
    int v4 = [(CKConversation *)self chat];
    [v4 setLocalUserIsComposing:v5];
  }
}

- (void)setLocalUserIsComposing:(id)a3 typingIndicatorIcon:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([(CKConversation *)self _allowedToSendTypingIndicators])
  {
    id v7 = [(CKConversation *)self chat];
    [v7 setLocalUserIsComposing:v8 typingIndicatorData:v6];
  }
}

- (NSString)localUserIsComposing
{
  id v2 = [(CKConversation *)self chat];
  uint64_t v3 = [v2 localUserIsComposing];

  return (NSString *)v3;
}

- (void)setLocalUserIsTyping:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKConversation *)self _allowedToSendTypingIndicators])
  {
    id v5 = [(CKConversation *)self chat];
    [v5 setLocalUserIsTyping:v3];
  }
}

- (BOOL)localUserIsTyping
{
  id v2 = [(CKConversation *)self chat];
  char v3 = [v2 localUserIsTyping];

  return v3;
}

- (void)setLocalUserIsRecording:(BOOL)a3
{
  BOOL v3 = a3;
  if ([(CKConversation *)self _allowedToSendTypingIndicators])
  {
    id v5 = [(CKConversation *)self chat];
    [v5 setLocalUserIsRecording:v3];
  }
}

- (BOOL)localUserIsRecording
{
  id v2 = [(CKConversation *)self chat];
  char v3 = [v2 localUserIsRecording];

  return v3;
}

- (void)updateUserActivity
{
  if ([(CKConversation *)self isPending])
  {
    id v5 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    [v5 setUserActivityForChat:0 orHandles:0];
  }
  else
  {
    id v5 = [(CKConversation *)self chat];
    char v3 = [(CKConversation *)self handles];
    int v4 = [MEMORY[0x1E4F6BC40] sharedRegistry];
    [v4 setUserActivityForChat:v5 orHandles:v3];
  }
}

- (void)_clearTypingIndicatorsIfNecessary
{
  char v3 = [(CKConversation *)self chat];
  int v4 = [v3 localUserIsTyping];

  if (v4)
  {
    id v5 = [(CKConversation *)self chat];
    char v6 = [v5 supportsSendingTypingIndicators];

    if ((v6 & 1) == 0)
    {
      id v7 = [(CKConversation *)self chat];
      [v7 setLocalUserIsTyping:0];
    }
  }
}

- (NSString)senderIdentifier
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  char v3 = [(CKConversation *)self chat];
  int v4 = [v3 lastAddressedHandleID];

  id v5 = [MEMORY[0x1E4F28B88] whitespaceCharacterSet];
  char v6 = [v4 stringByTrimmingCharactersInSet:v5];
  uint64_t v7 = [v6 length];

  if (v7)
  {
    id v8 = v4;
  }
  else
  {
    if (v4 && IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        __int16 v10 = [(CKConversation *)self chat];
        int v17 = 138412290;
        long long v18 = v10;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_INFO, "lastAddressedHandleID is empty but not nil for chat %@", (uint8_t *)&v17, 0xCu);
      }
    }
    id v11 = [(CKConversation *)self chat];
    uint64_t v12 = [v11 account];

    if (!v12)
    {
      id v13 = [MEMORY[0x1E4F6BBD8] sharedInstance];
      uint64_t v14 = [(CKConversation *)self sendingService];
      uint64_t v12 = [v13 bestActiveAccountForService:v14];
    }
    id v8 = [v12 strippedLogin];

    if (!v8)
    {
      uint64_t v15 = IMLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        [(CKConversation *)(uint64_t)v12 senderIdentifier];
      }
    }
  }

  return (NSString *)v8;
}

- (BOOL)shouldShowCharacterCount
{
  if (![(CKConversation *)self isStewieConversation])
  {
    int v4 = [(CKConversation *)self sendingService];
    id v5 = [(CKConversation *)self recipientStrings];
    if (objc_msgSend(v4, "__ck_isSMS"))
    {
      BOOL v6 = [(CKConversation *)self _sms_supportsCharacterCountForAddresses:v5];
    }
    else
    {
      if ((objc_msgSend(v4, "__ck_isiMessageLite") & 1) != 0
        || (objc_msgSend(v4, "__ck_isSatelliteSMS") & 1) != 0
        || ([(CKConversation *)self chat],
            uint64_t v7 = objc_claimAutoreleasedReturnValue(),
            char v8 = [v7 shouldDisplayOffGridModeStatus],
            v7,
            (v8 & 1) != 0))
      {
        BOOL v3 = 1;
        goto LABEL_10;
      }
      BOOL v6 = [(CKConversation *)self _iMessage_supportsCharacterCountForAddresses:v5];
    }
    BOOL v3 = v6;
LABEL_10:

    return v3;
  }
  return 1;
}

- (unint64_t)disclosureAtomStyle
{
  return 2 * CKIsRunningInFullCKClient();
}

- (NSString)rawAddressedName
{
  return (NSString *)[(CKConversation *)self nameWithRawAddresses:1];
}

- (NSString)searchDisplayName
{
  if (+[CKConversation isSMSSpamFilteringEnabled]) {
    uint64_t v3 = 65792;
  }
  else {
    uint64_t v3 = 0x10000;
  }
  chat = self->_chat;

  return (NSString *)-[IMChat displayNameWithDescriptor:](chat, "displayNameWithDescriptor:", v3, 3);
}

- (id)displayNameForDisplayContext:(int64_t)a3
{
  uint64_t v3 = self;
  if (a3 != 1)
  {
    if (a3) {
      goto LABEL_8;
    }
    if (![(CKConversation *)self hasDisplayName])
    {
      self = [(CKConversation *)v3 name];
      goto LABEL_8;
    }
    goto LABEL_6;
  }
  if ([(CKConversation *)self hasDisplayName])
  {
LABEL_6:
    self = [(CKConversation *)v3 displayName];
    goto LABEL_8;
  }
  self = [(CKConversation *)v3 displayNameForMediaObjects:0 subject:0 shouldListParticipants:0];
LABEL_8:

  return self;
}

- (void)setDisplayName:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversation *)self chat];
  [v5 setDisplayName:v4];
}

- (BOOL)isPreviewTextForAttachment
{
  uint64_t v3 = [(CKConversation *)self chat];
  id v4 = [v3 lastFinishedMessageItem];

  if (([v4 isCorrupt] & 1) != 0
    || ([v4 retractedPartIndexes],
        id v5 = objc_claimAutoreleasedReturnValue(),
        uint64_t v6 = [v5 count],
        v5,
        v6))
  {
    BOOL v7 = 0;
  }
  else
  {
    id v9 = [(CKConversation *)self chat];
    __int16 v10 = [v9 lastFinishedMessage];

    id v11 = [v10 error];

    if (v11) {
      goto LABEL_7;
    }
    uint64_t v12 = [v10 balloonBundleID];

    if (v12
      || ([(CKConversation *)self chat],
          id v13 = objc_claimAutoreleasedReturnValue(),
          objc_msgSend(v10, "__ck_previewTextWithChat:ignorePluginContent:", v13, 1),
          uint64_t v14 = objc_claimAutoreleasedReturnValue(),
          uint64_t v15 = [v14 length],
          v14,
          v13,
          !v15))
    {
LABEL_7:
      BOOL v7 = 0;
    }
    else
    {
      long long v16 = [v10 plainBody];
      int v17 = [v16 stringByReplacingOccurrencesOfString:*MEMORY[0x1E4F6C110] withString:&stru_1EDE4CA38];
      long long v18 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
      uint64_t v19 = [v17 stringByTrimmingCharactersInSet:v18];

      uint64_t v20 = [v10 messageSubject];
      uint64_t v21 = [v20 string];

      uint64_t v22 = [v19 length];
      if (v22 | [v21 length]) {
        BOOL v7 = 0;
      }
      else {
        BOOL v7 = ([v10 flags] & 0x1000000) == 0;
      }
    }
  }

  return v7;
}

- (BOOL)shouldReloadPreviewTextForGeneratedAdaptiveImageGlyphWithFileTransferGUID:(id)a3
{
  id v4 = a3;
  id v5 = [(CKConversation *)self chat];
  uint64_t v6 = [v5 lastFinishedMessage];
  BOOL v7 = [v6 fileTransferGUIDs];
  int v8 = [v7 containsObject:v4];

  if (!v8)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      __int16 v10 = [v6 associatedMessagePartText];
      id v11 = [MEMORY[0x1E4F6BCC8] sharedInstance];
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = __92__CKConversation_shouldReloadPreviewTextForGeneratedAdaptiveImageGlyphWithFileTransferGUID___block_invoke;
      aBlock[3] = &unk_1E5621100;
      id v18 = v11;
      id v12 = v11;
      id v13 = _Block_copy(aBlock);
      if (objc_msgSend(v10, "__im_containsAdaptiveImageGlyphFileTransfersUsingFileTransferProvider:", v13))
      {
        previewText = self->_previewText;
        self->_previewText = 0;

        goto LABEL_6;
      }
    }
    BOOL v15 = 0;
    goto LABEL_9;
  }
  id v9 = self->_previewText;
  self->_previewText = 0;

LABEL_6:
  BOOL v15 = 1;
LABEL_9:

  return v15;
}

uint64_t __92__CKConversation_shouldReloadPreviewTextForGeneratedAdaptiveImageGlyphWithFileTransferGUID___block_invoke(uint64_t a1, uint64_t a2)
{
  return [*(id *)(a1 + 32) transferForGUID:a2];
}

- (NSSet)mergedPinningIdentifiers
{
  id v2 = [(CKConversation *)self chat];
  uint64_t v3 = [v2 mergedPinningIdentifiers];

  return (NSSet *)v3;
}

- (BOOL)isPinned
{
  id v2 = [(CKConversation *)self chat];
  char v3 = [v2 isPinned];

  return v3;
}

- (char)buttonColor
{
  char v3 = [(CKConversation *)self sendingService];
  if ([(CKConversation *)self isStewieConversation])
  {
    char v4 = 12;
  }
  else if ([(CKConversation *)self isBusinessConversation])
  {
    char v4 = 6;
  }
  else
  {
    char v4 = objc_msgSend(v3, "__ck_displayColor");
  }

  return v4;
}

- (char)outgoingBubbleColor
{
  char v3 = [(CKConversation *)self sendingService];
  if ([(CKConversation *)self isStewieConversation])
  {
    char v4 = 12;
  }
  else if ([(CKConversation *)self isBusinessConversation])
  {
    char v4 = 6;
  }
  else
  {
    char v4 = objc_msgSend(v3, "__ck_displayColor");
  }

  return v4;
}

- (NSString)serviceDisplayName
{
  id v2 = [(CKConversation *)self sendingService];
  char v3 = objc_msgSend(v2, "__ck_displayName");

  return (NSString *)v3;
}

- (id)_nameForHandle:(id)a3
{
  id v3 = a3;
  if ([v3 isLoginIMHandle])
  {
    char v4 = CKFrameworkBundle();
    id v5 = [v4 localizedStringForKey:@"ME" value:&stru_1EDE4CA38 table:@"ChatKit"];
LABEL_5:
    uint64_t v6 = v5;
    goto LABEL_7;
  }
  char v4 = [v3 _displayNameWithAbbreviation];
  if ([v4 length])
  {
    id v5 = v4;
    char v4 = v5;
    goto LABEL_5;
  }
  BOOL v7 = CKFrameworkBundle();
  uint64_t v6 = [v7 localizedStringForKey:@"Unknown" value:&stru_1EDE4CA38 table:@"ChatKit"];

LABEL_7:

  return v6;
}

- (id)_headerTitleForService:(id)a3 shouldListParticipants:(BOOL)a4
{
  id v6 = a3;
  BOOL v7 = [(CKConversation *)self handles];
  uint64_t v8 = [v7 count];
  int v9 = objc_msgSend(v6, "__ck_isSMS");

  if (!v9)
  {
    if ((unint64_t)[v7 count] < 2)
    {
      long long v16 = [(CKConversation *)self businessHandle];

      if (v16) {
        [(CKConversation *)self businessHandle];
      }
      else {
      __int16 v10 = [v7 lastObject];
      }
      uint64_t v13 = [(CKConversation *)self _nameForHandle:v10];
    }
    else
    {
      __int16 v10 = [(CKConversation *)self displayName];
      if ([(CKConversation *)self hasDisplayName]) {
        goto LABEL_23;
      }
      if (!a4)
      {
        uint64_t v19 = NSString;
        uint64_t v20 = CKFrameworkBundle();
        uint64_t v21 = [v20 localizedStringForKey:@"GROUP_PEOPLE_COUNT" value:&stru_1EDE4CA38 table:@"ChatKit"];
        id v11 = objc_msgSend(v19, "localizedStringWithFormat:", v21, v8);

        uint64_t v22 = [MEMORY[0x1E4F42738] sharedApplication];
        uint64_t v23 = [v22 userInterfaceLayoutDirection];

        if (v23 == 1) {
          long long v24 = @"\u200F";
        }
        else {
          long long v24 = @"\u200E";
        }
        uint64_t v12 = [(__CFString *)v24 stringByAppendingString:v11];
        goto LABEL_30;
      }
      uint64_t v13 = [(CKConversation *)self name];
    }
    int v17 = (void *)v13;
    goto LABEL_22;
  }
  __int16 v10 = [(CKConversation *)self lastAddressedHandle];
  id v11 = [(CKConversation *)self lastAddressedSIMID];
  if ([MEMORY[0x1E4F6BDC0] mmsEnabledforPhoneNumber:v10 simID:v11]
    && (unint64_t)[v7 count] >= 2
    && [MEMORY[0x1E4F6E660] IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:v10 simID:v11])
  {
    if (a4)
    {
      uint64_t v12 = [(CKConversation *)self name];
LABEL_30:
      int v17 = (void *)v12;
      goto LABEL_18;
    }
    long long v25 = NSString;
    id v26 = CKFrameworkBundle();
    id v27 = [v26 localizedStringForKey:@"GROUP_PEOPLE_COUNT" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v14 = objc_msgSend(v25, "localizedStringWithFormat:", v27, v8);

    uint64_t v28 = [MEMORY[0x1E4F42738] sharedApplication];
    uint64_t v29 = [v28 userInterfaceLayoutDirection];

    if (v29 == 1) {
      id v30 = @"\u200F";
    }
    else {
      id v30 = @"\u200E";
    }
    uint64_t v15 = [(__CFString *)v30 stringByAppendingString:v14];
  }
  else
  {
    if ((unint64_t)[v7 count] < 2)
    {
      uint64_t v14 = [v7 lastObject];
      [(CKConversation *)self _nameForHandle:v14];
    }
    else
    {
      uint64_t v14 = CKFrameworkBundle();
      [v14 localizedStringForKey:@"OUTGOING" value:&stru_1EDE4CA38 table:@"ChatKit"];
    uint64_t v15 = };
  }
  int v17 = (void *)v15;

LABEL_18:
LABEL_22:

  __int16 v10 = v17;
LABEL_23:

  return v10;
}

- (id)_headerTitleForPendingMediaObjects:(id)a3 subject:(id)a4 onService:(id)a5
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(CKConversation *)self isBusinessConversation])
  {
    id v11 = [(CKConversation *)self businessHandle];
    uint64_t v12 = [v11 name];
LABEL_5:
    uint64_t v13 = (void *)v12;
    goto LABEL_24;
  }
  if (objc_msgSend(v10, "__ck_isiMessage"))
  {
    id v11 = CKFrameworkBundle();
    uint64_t v12 = [v11 localizedStringForKey:@"NEW_MADRID_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
    goto LABEL_5;
  }
  id v11 = [(CKConversation *)self pendingHandles];
  uint64_t v14 = [(CKConversation *)self lastAddressedHandle];
  uint64_t v15 = [(CKConversation *)self lastAddressedSIMID];
  if (objc_msgSend(v10, "__ck_isRCS") && (unint64_t)objc_msgSend(v11, "count") >= 2)
  {
    long long v16 = [MEMORY[0x1E4F6E658] sharedManager];
    int v17 = [v16 groupMessagingEnabledForPhoneNumber:v14 simID:v15];

    id v18 = CKFrameworkBundle();
    if (!v17)
    {
      uint64_t v19 = @"NEW_BROADCAST_MESSAGE";
      goto LABEL_17;
    }
    goto LABEL_9;
  }
  if (!objc_msgSend(v10, "__ck_isSMS")
    || ![MEMORY[0x1E4F6BDC0] mmsEnabledforPhoneNumber:v14 simID:v15])
  {
    goto LABEL_21;
  }
  if ((unint64_t)[v11 count] >= 2)
  {
    int v20 = [MEMORY[0x1E4F6E660] IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:v14 simID:v15];
    uint64_t v21 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v22 = [v21 isLazuliEnabled];

    if (v20)
    {
      id v18 = CKFrameworkBundle();
      if (!v22)
      {
        uint64_t v19 = @"NEW_MMS_GROUP";
        goto LABEL_17;
      }
LABEL_9:
      uint64_t v19 = @"NEW_GROUP_MESSAGE";
LABEL_17:
      uint64_t v23 = v18;
      goto LABEL_22;
    }
    if (v22)
    {
      uint64_t v23 = CKFrameworkBundle();
      id v18 = v23;
      uint64_t v19 = @"NEW_BROADCAST_MESSAGE";
      goto LABEL_22;
    }
  }
  long long v24 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v25 = [v24 isLazuliEnabled];

  if (v25) {
    goto LABEL_21;
  }
  if (![v8 count] && !objc_msgSend(v9, "length"))
  {
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = v11;
    uint64_t v27 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    if (v27)
    {
      uint64_t v28 = v27;
      uint64_t v34 = *(void *)v36;
      while (2)
      {
        for (uint64_t i = 0; i != v28; ++i)
        {
          if (*(void *)v36 != v34) {
            objc_enumerationMutation(obj);
          }
          id v30 = [*(id *)(*((void *)&v35 + 1) + 8 * i) ID];
          char v31 = [v30 _appearsToBeEmail];

          if (v31)
          {
            double v32 = CKFrameworkBundle();
            uint64_t v13 = [v32 localizedStringForKey:@"NEW_MMS_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

            goto LABEL_23;
          }
        }
        uint64_t v28 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
        if (v28) {
          continue;
        }
        break;
      }
    }

LABEL_21:
    uint64_t v23 = CKFrameworkBundle();
    id v18 = v23;
    uint64_t v19 = @"NEW_MESSAGE";
    goto LABEL_22;
  }
  uint64_t v23 = CKFrameworkBundle();
  id v18 = v23;
  uint64_t v19 = @"NEW_MMS_MESSAGE";
LABEL_22:
  uint64_t v13 = [v23 localizedStringForKey:v19 value:&stru_1EDE4CA38 table:@"ChatKit"];

LABEL_23:
LABEL_24:

  return v13;
}

- (id)displayNameForMediaObjects:(id)a3 subject:(id)a4 shouldListParticipants:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(CKConversation *)self sendingService];
  if ([(CKConversation *)self isPending]) {
    [(CKConversation *)self _headerTitleForPendingMediaObjects:v8 subject:v9 onService:v10];
  }
  else {
  id v11 = [(CKConversation *)self _headerTitleForService:v10 shouldListParticipants:v5];
  }

  return v11;
}

- (id)copyForPendingConversation
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v3 = [CKPendingConversation alloc];
  char v4 = [(CKConversation *)self chat];
  BOOL v5 = [(CKConversation *)v3 initWithChat:v4];

  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      BOOL v7 = [(CKConversation *)self chat];
      int v9 = 138412290;
      id v10 = v7;
      _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_INFO, "Created pending conversation for chat: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  return v5;
}

- (BOOL)deletingIncomingMessages
{
  id v2 = [(CKConversation *)self chat];
  char v3 = [v2 isDeletingIncomingMessages];

  return v3;
}

- (void)updateDeletingIncomingMessages:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = [(CKConversation *)self chat];
  [v4 setDeletingIncomingMessages:v3];
}

- (BOOL)isKnownSender
{
  BOOL v3 = [(CKConversation *)self chat];
  uint64_t v4 = [v3 isFiltered];

  BOOL v5 = [(CKConversation *)self chat];
  if (![v5 containsMessageFromContactOrMe] || v4 > 1)
  {
    if (!v4)
    {
      char v6 = 1;
      goto LABEL_9;
    }
LABEL_7:
    BOOL v7 = [(CKConversation *)self chat];
    char v6 = [v7 hasKnownParticipantsCache];

    goto LABEL_9;
  }
  char v6 = 1;
  if ([(CKConversation *)self wasDetectedAsSMSCategory] && v4) {
    goto LABEL_7;
  }
LABEL_9:

  if (!self->_hasSetWasKnownSender)
  {
    self->_hasSetWasKnownSender = 1;
    self->_wasKnownSender = v6;
  }
  return v6;
}

- (void)updateWasKnownSender
{
  if ([(CKConversation *)self _unknownFilteringEnabled])
  {
    BOOL v3 = [(CKConversation *)self _conversationList];
    char v4 = [v3 isHoldingWasKnownSenderUpdates];

    if ((v4 & 1) == 0) {
      self->_wasKnownSender = [(CKConversation *)self isKnownSender];
    }
  }
}

- (BOOL)wasKnownSender
{
  return self->_wasKnownSender;
}

- (BOOL)hasSetWasKnownSender
{
  return self->_hasSetWasKnownSender;
}

- (BOOL)_unknownFilteringEnabled
{
  return CKMessageUnknownFilteringEnabled() != 0;
}

- (NSString)conversationListCollectionViewPinnedItemIdentifier
{
  conversationListCollectionViewPinnedItemIdentifier = self->_conversationListCollectionViewPinnedItemIdentifier;
  if (!conversationListCollectionViewPinnedItemIdentifier)
  {
    char v4 = [(CKConversation *)self chat];
    uint64_t v5 = [v4 guid];
    char v6 = (void *)v5;
    BOOL v7 = &stru_1EDE4CA38;
    if (v5) {
      BOOL v7 = (__CFString *)v5;
    }
    id v8 = v7;

    int v9 = [@"pinned-" stringByAppendingString:v8];

    id v10 = self->_conversationListCollectionViewPinnedItemIdentifier;
    self->_conversationListCollectionViewPinnedItemIdentifier = v9;

    conversationListCollectionViewPinnedItemIdentifier = self->_conversationListCollectionViewPinnedItemIdentifier;
  }

  return conversationListCollectionViewPinnedItemIdentifier;
}

- (NSString)conversationListCollectionViewJunkItemIdentifier
{
  conversationListCollectionViewJunkItemIdentifier = self->_conversationListCollectionViewJunkItemIdentifier;
  if (!conversationListCollectionViewJunkItemIdentifier)
  {
    char v4 = [(CKConversation *)self chat];
    uint64_t v5 = [v4 guid];
    char v6 = (void *)v5;
    BOOL v7 = &stru_1EDE4CA38;
    if (v5) {
      BOOL v7 = (__CFString *)v5;
    }
    id v8 = v7;

    int v9 = [@"junk-" stringByAppendingString:v8];

    id v10 = self->_conversationListCollectionViewJunkItemIdentifier;
    self->_conversationListCollectionViewJunkItemIdentifier = v9;

    conversationListCollectionViewJunkItemIdentifier = self->_conversationListCollectionViewJunkItemIdentifier;
  }

  return conversationListCollectionViewJunkItemIdentifier;
}

- (NSString)conversationListCollectionViewRecentlyDeletedListItemIdentifier
{
  conversationListCollectionViewRecentlyDeletedListItemIdentifier = self->_conversationListCollectionViewRecentlyDeletedListItemIdentifier;
  if (!conversationListCollectionViewRecentlyDeletedListItemIdentifier)
  {
    char v4 = [(CKConversation *)self chat];
    uint64_t v5 = [v4 guid];
    char v6 = (void *)v5;
    BOOL v7 = &stru_1EDE4CA38;
    if (v5) {
      BOOL v7 = (__CFString *)v5;
    }
    id v8 = v7;

    int v9 = [@"recoverable-" stringByAppendingString:v8];

    id v10 = self->_conversationListCollectionViewRecentlyDeletedListItemIdentifier;
    self->_conversationListCollectionViewRecentlyDeletedListItemIdentifier = v9;

    conversationListCollectionViewRecentlyDeletedListItemIdentifier = self->_conversationListCollectionViewRecentlyDeletedListItemIdentifier;
  }

  return conversationListCollectionViewRecentlyDeletedListItemIdentifier;
}

- (BOOL)isBlockedByCommunicationLimits
{
  id v2 = [(CKConversation *)self chat];
  BOOL v3 = v2;
  if (v2) {
    int v4 = [v2 allowedToShowConversationSync] ^ 1;
  }
  else {
    LOBYTE(v4) = 0;
  }

  return v4;
}

- (void)prepareForRecoverableDeletionWithDeleteDate:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v4;
      _os_log_impl(&dword_18EF18000, v5, OS_LOG_TYPE_INFO, "moving all messages before date: %@ to recently deleted", (uint8_t *)&v14, 0xCu);
    }
  }
  char v6 = [(CKConversation *)self chat];
  if ([v6 isBusinessChat]) {
    [v6 deleteExtensionPayloadData];
  }
  if (![(CKConversation *)self isGroupConversation])
  {
    BOOL v7 = [(CKConversation *)self recipient];
    id v8 = [v7 rawAddress];
    BOOL v9 = v8 == 0;

    if (!v9)
    {
      id v10 = objc_alloc_init(CKDetailsContactsManager);
      uint64_t v11 = [(CKConversation *)self recipient];
      uint64_t v12 = [v11 rawAddress];
      [(CKDetailsContactsManager *)v10 setPreferredCallService:0 forID:v12];
    }
  }
  uint64_t v13 = +[CKDraftManager sharedInstance];
  [v13 setDraft:0 forConversation:self];

  [(CKConversation *)self _invalidateApplicationSnapshotIfNeeded];
}

- (void)recoverableDeleteAllMessagesGivenDeleteDate:(id)a3
{
  v8[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(CKConversation *)self prepareForRecoverableDeletionWithDeleteDate:v4];
  uint64_t v5 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  char v6 = [(CKConversation *)self chat];
  v8[0] = v6;
  BOOL v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v8 count:1];
  [v5 moveMessagesInChatsToRecentlyDeleted:v7 deleteDate:v4 synchronously:0 completionHandler:&__block_literal_global_375_0];
}

void __62__CKConversation_recoverableDeleteAllMessagesGivenDeleteDate___block_invoke()
{
  id v0 = [MEMORY[0x1E4F6BC40] sharedRegistry];
  [v0 updateRecoverableMessagesMetadataSynchronously:0 completionHandler:0];
}

- (void)_invalidateApplicationSnapshotIfNeeded
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      uint64_t v5 = "-[CKConversation _invalidateApplicationSnapshotIfNeeded]";
      _os_log_impl(&dword_18EF18000, v2, OS_LOG_TYPE_INFO, "%s requesting purge of default snapshot", (uint8_t *)&v4, 0xCu);
    }
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4FA69B8]);
  [v3 deleteSnapshotsForApplicationIdentifier:@"com.apple.MobileSMS"];
  [v3 invalidate];
}

- (id)recipientEmailAddresses
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v4 = [(CKConversation *)self recipientStrings];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (IMStringIsEmail()) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = (void *)[v3 copy];

  return v10;
}

- (id)recipientPhoneNumbers
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v4 = [(CKConversation *)self recipientStrings];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        if (MEMORY[0x192FBA6E0](v9)) {
          [v3 addObject:v9];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  id v10 = (void *)[v3 copy];

  return v10;
}

- (id)_conversationList
{
  return +[CKConversationList sharedConversationList];
}

- (id)contactNameByHandle
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v3 = [MEMORY[0x1E4F1CA60] dictionary];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  int v4 = [(CKConversation *)self recipients];
  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v15 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        id v10 = [v9 defaultIMHandle];
        uint64_t v11 = [v10 ID];

        long long v12 = [v9 fullName];
        if ([v12 length] && objc_msgSend(v11, "length")) {
          [v3 setObject:v12 forKeyedSubscript:v11];
        }
      }
      uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v6);
  }

  return v3;
}

- (BOOL)allowsMentions
{
  id v3 = +[CKUIBehavior sharedBehaviors];
  int v4 = [v3 platformSupportsMentioning];

  if (!v4) {
    return 0;
  }
  uint64_t v5 = [(CKConversation *)self chat];

  if (v5)
  {
    uint64_t v6 = [(CKConversation *)self chat];
    char v7 = [v6 supportsCapabilities:128];

    return v7;
  }
  uint64_t v9 = [(CKConversation *)self sendingService];
  if (objc_msgSend(v9, "__ck_isSMS"))
  {
    BOOL v10 = [(CKConversation *)self isGroupConversation];

    if (!v10) {
      return 0;
    }
  }
  else
  {
  }
  if ([(CKConversation *)self isStewieConversation]) {
    return 0;
  }
  return ![(CKConversation *)self isBusinessConversation];
}

- (void)updateKeyTransparencyStatusForChatParticipantsDidChange:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v6 = [v5 isKeyTransparencyEnabled];

  if (v6)
  {
    uint64_t v7 = [v4 ktStatus];
    [v4 fetchKTStatus];
    uint64_t v8 = [v4 keyTransparencyStatusForAffectedHandles:0];
    if (v7 != v8)
    {
      uint64_t v9 = v8;
      if (IMOSLoggingEnabled())
      {
        BOOL v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v12 = 134218240;
          uint64_t v13 = v7;
          __int16 v14 = 2048;
          uint64_t v15 = v9;
          _os_log_impl(&dword_18EF18000, v10, OS_LOG_TYPE_INFO, "chat participants changed status %lu->%lu: sending status change notification", (uint8_t *)&v12, 0x16u);
        }
      }
      uint64_t v11 = [MEMORY[0x1E4F28EB8] defaultCenter];
      objc_msgSend(v11, "__mainThreadPostNotificationName:object:", *MEMORY[0x1E4F6B998], self);
    }
  }
}

- (void)setRecipients:(id)a3
{
}

- (NSString)selectedLastAddressedHandle
{
  return self->_selectedLastAddressedHandle;
}

- (void)setSelectedLastAddressedHandle:(id)a3
{
}

- (NSString)selectedLastAddressedSIMID
{
  return self->_selectedLastAddressedSIMID;
}

- (void)setSelectedLastAddressedSIMID:(id)a3
{
}

- (NSSet)pendingRecipients
{
  return self->_pendingRecipients;
}

- (void)setName:(id)a3
{
}

- (NSAttributedString)groupName
{
  return self->_groupName;
}

- (void)setPreviewText:(id)a3
{
}

- (BOOL)isCurrentlyPlayingAudio
{
  return self->_currentlyPlayingAudio;
}

- (void)setCurrentlyPlayingAudio:(BOOL)a3
{
  self->_currentlyPlayingAudio = a3;
}

- (BOOL)needsReload
{
  return self->_needsReload;
}

- (BOOL)completedInitialChatMessagesLoad
{
  return self->_completedInitialChatMessagesLoad;
}

- (void)setCompletedInitialChatMessagesLoad:(BOOL)a3
{
  self->_completedInitialChatMessagesLoad = a3;
}

- (BOOL)allowedByPersonListInActiveFocus
{
  return self->_allowedByPersonListInActiveFocus;
}

- (void)setWasDetectedAsSMSSpam:(int)a3
{
  self->_wasDetectedAsSMSSpam = a3;
}

- (void)setWasDetectedAsSMSCategory:(int)a3
{
  self->_wasDetectedAsSMSCategory = a3;
}

- (void)setWasDetectedAsiMessageSpam:(int)a3
{
  self->_wasDetectedAsiMessageSpam = a3;
}

- (void)setWasDetectedAsSpam:(int)a3
{
  self->_wasDetectedAsSpam = a3;
}

- (BOOL)shouldShowGroupPhotoUpdateBanner
{
  return self->_shouldShowGroupPhotoUpdateBanner;
}

- (void)setShouldShowGroupPhotoUpdateBanner:(BOOL)a3
{
  self->_shouldShowGroupPhotoUpdateBanner = a3;
}

- (BOOL)shouldShowGroupNameUpdateBanner
{
  return self->_shouldShowGroupNameUpdateBanner;
}

- (void)setShouldShowGroupNameUpdateBanner:(BOOL)a3
{
  self->_shouldShowGroupNameUpdateBanner = a3;
}

- (NSString)groupIdentityUpdateHandleID
{
  return self->_groupIdentityUpdateHandleID;
}

- (void)setGroupIdentityUpdateHandleID:(id)a3
{
}

- (BOOL)wantsLabelForDSDSCached
{
  return self->_wantsLabelForDSDSCached;
}

- (BOOL)hasCachedWantsLabelForDSDS
{
  return self->_hasCachedWantsLabelForDSDS;
}

- (unsigned)limitToLoad
{
  return self->_limitToLoad;
}

- (void)setLimitToLoad:(unsigned int)a3
{
  self->_unsigned int limitToLoad = a3;
}

- (NSArray)pendingHandles
{
  return self->_pendingHandles;
}

- (void)setBusinessHandle:(id)a3
{
}

- (NSNumber)chatBot
{
  return self->_chatBot;
}

- (void)setChatBot:(id)a3
{
}

- (BOOL)isDeletingIncomingMessages
{
  return self->_deletingIncomingMessages;
}

- (BOOL)shouldHoldInUnreadFilter
{
  return self->_holdInUnreadFilter;
}

- (void)setHoldInUnreadFilter:(BOOL)a3
{
  self->_holdInUnreadFilter = a3;
}

- (void)setConversationListCollectionViewPinnedItemIdentifier:(id)a3
{
}

- (void)setConversationListCollectionViewListItemIdentifier:(id)a3
{
}

- (void)setConversationListCollectionViewJunkItemIdentifier:(id)a3
{
}

- (void)setConversationListCollectionViewRecentlyDeletedListItemIdentifier:(id)a3
{
}

- (BOOL)shouldElevateCheckIn
{
  return self->_elevateCheckIn;
}

- (void)setElevateCheckIn:(BOOL)a3
{
  self->_elevateCheckIn = a3;
}

- (BOOL)isReportedAsSpam
{
  return self->_isReportedAsSpam;
}

- (void)setIsReportedAsSpam:(BOOL)a3
{
  self->_isReportedAsSpam = a3;
}

- (NSNumber)businessConversation
{
  return self->_businessConversation;
}

- (void)setBusinessConversation:(id)a3
{
}

- (NSNumber)mapKitBusinessConversation
{
  return self->_mapKitBusinessConversation;
}

- (void)setMapKitBusinessConversation:(id)a3
{
}

- (NSDate)dateLastViewed
{
  return self->_dateLastViewed;
}

- (void)setDateLastViewed:(id)a3
{
}

- (void)setWasKnownSender:(BOOL)a3
{
  self->_wasKnownSender = a3;
}

- (void)setHasSetWasKnownSender:(BOOL)a3
{
  self->_hasSetWasKnownSender = a3;
}

- (CKVisualGroupIdentity)_conversationVisualIdentity
{
  return self->__conversationVisualIdentity;
}

- (void)set_conversationVisualIdentity:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->__conversationVisualIdentity, 0);
  objc_storeStrong((id *)&self->_dateLastViewed, 0);
  objc_storeStrong((id *)&self->_mapKitBusinessConversation, 0);
  objc_storeStrong((id *)&self->_businessConversation, 0);
  objc_storeStrong((id *)&self->_conversationListCollectionViewRecentlyDeletedListItemIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationListCollectionViewJunkItemIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationListCollectionViewListItemIdentifier, 0);
  objc_storeStrong((id *)&self->_conversationListCollectionViewPinnedItemIdentifier, 0);
  objc_storeStrong((id *)&self->_chatBot, 0);
  objc_storeStrong((id *)&self->_businessHandle, 0);
  objc_storeStrong((id *)&self->_pendingHandles, 0);
  objc_storeStrong((id *)&self->_groupIdentityUpdateHandleID, 0);
  objc_storeStrong((id *)&self->_previewText, 0);
  objc_storeStrong((id *)&self->_groupName, 0);
  objc_storeStrong((id *)&self->_name, 0);
  objc_storeStrong((id *)&self->_pendingRecipients, 0);
  objc_storeStrong((id *)&self->_selectedLastAddressedSIMID, 0);
  objc_storeStrong((id *)&self->_selectedLastAddressedHandle, 0);
  objc_storeStrong((id *)&self->_recipients, 0);

  objc_storeStrong((id *)&self->_chat, 0);
}

+ (NSArray)writableTypeIdentifiersForItemProvider
{
  return (NSArray *)&unk_1EDF15410;
}

- (id)loadDataWithTypeIdentifier:(id)a3 forItemProviderCompletionHandler:(id)a4
{
  uint64_t v5 = (void (**)(id, void *, void))a4;
  int v6 = [(CKConversation *)self chat];
  uint64_t v7 = [v6 guid];
  uint64_t v8 = [v7 dataUsingEncoding:4];

  v5[2](v5, v8, 0);
  return 0;
}

+ (BOOL)_iMessage_canAcceptMediaObjectType:(int)a3 givenMediaObjects:(id)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  memset(v19, 0, 44);
  ++*((_DWORD *)v19 + a3);
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = v7;
    uint64_t v9 = *(void *)v15;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v15 != v9) {
          objc_enumerationMutation(v6);
        }
        int v11 = [*(id *)(*((void *)&v14 + 1) + 8 * i) mediaType];
        ++*((_DWORD *)v19 + v11);
      }
      uint64_t v8 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v8);
  }
  char v12 = objc_msgSend(a1, "_iMessage_canSendMessageWithMediaObjectTypes:", v19);

  return v12;
}

+ (int64_t)_iMessage_maxAttachmentCount
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (BOOL)_iMessage_supportsCharacterCountForAddresses:(id)a3
{
  return 0;
}

+ (BOOL)_iMessage_canSendMessageWithMediaObjectTypes:(int *)a3 errorCode:(int64_t *)a4
{
  uint64_t v5 = 0;
  uint64_t v6 = 0;
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  do
    v6 += a3[v5++];
  while (v5 != 11);
  uint64_t v7 = objc_msgSend(a1, "_iMessage_maxAttachmentCount");
  if (v7 == 0x7FFFFFFFFFFFFFFFLL)
  {
    int64_t v8 = 0;
    BOOL v9 = 1;
  }
  else
  {
    uint64_t v10 = v7;
    BOOL v9 = v6 <= v7;
    if (v6 > v7) {
      int64_t v8 = 2001;
    }
    else {
      int64_t v8 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(24);
      int v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        char v12 = @"NO";
        *(_DWORD *)long long buf = 138412802;
        if (v6 <= v10) {
          char v12 = @"YES";
        }
        int64_t v20 = (int64_t)v12;
        __int16 v21 = 2048;
        uint64_t v22 = v6;
        __int16 v23 = 2048;
        uint64_t v24 = v10;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_DEBUG, "(iMessage) Accept: %@: total count: %ld, max attachment count: %ld", buf, 0x20u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      long long v14 = @"NO";
      if (v9) {
        long long v14 = @"YES";
      }
      *(_DWORD *)long long buf = 138412290;
      int64_t v20 = (int64_t)v14;
      _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_DEBUG, "(iMessage) Accept: %@", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
    _CKLog();
  }
  if (a4) {
    char v15 = v9;
  }
  else {
    char v15 = 1;
  }
  if ((v15 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(24);
      long long v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134217984;
        int64_t v20 = v8;
        _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_DEBUG, "(iMessage) Error code: %ld", buf, 0xCu);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
    *a4 = v8;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    long long v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_18EF18000, v17, OS_LOG_TYPE_DEBUG, "---------", buf, 2u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
    _CKLog();
  }
  return v9;
}

+ (BOOL)_iMessage_canSendMessageWithMediaObjectTypes:(int *)a3
{
  return objc_msgSend(a1, "_iMessage_canSendMessageWithMediaObjectTypes:errorCode:", a3, 0);
}

+ (BOOL)_iMessage_canSendComposition:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5 currentService:(id)a6 forceSMS:(BOOL)a7 error:(id *)a8
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  if (CKIsRunningInFullCKClient()
    && !CKIsRunningUnitTests()
    && !CKIsRunningUITests()
    && !CKIsRunningForDevelopmentOnSimulator()
    && ![MEMORY[0x1E4F6BDC0] iMessageEnabledForSenderLastAddressedHandle:v14 simID:v15 previousService:v16])
  {
    LOBYTE(v27) = 0;
    uint64_t v28 = 3001;
    if (!a8) {
      goto LABEL_23;
    }
    goto LABEL_19;
  }
  id v17 = v16;
  id v18 = v15;
  id v19 = v14;
  memset(v39, 0, 44);
  id v20 = v13;
  __int16 v21 = objc_msgSend(v13, "mediaObjects", a8);
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  uint64_t v22 = [v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
  if (v22)
  {
    uint64_t v23 = v22;
    uint64_t v24 = *(void *)v35;
    do
    {
      for (uint64_t i = 0; i != v23; ++i)
      {
        if (*(void *)v35 != v24) {
          objc_enumerationMutation(v21);
        }
        int v26 = [*(id *)(*((void *)&v34 + 1) + 8 * i) mediaType];
        ++v39[v26];
      }
      uint64_t v23 = [v21 countByEnumeratingWithState:&v34 objects:v38 count:16];
    }
    while (v23);
  }
  if ([v21 count])
  {
    uint64_t v33 = 0;
    int v27 = objc_msgSend(a1, "_iMessage_canSendMessageWithMediaObjectTypes:errorCode:", v39, &v33);
    if (v27) {
      uint64_t v28 = 0;
    }
    else {
      uint64_t v28 = v33;
    }
  }
  else
  {
    uint64_t v28 = 0;
    LOBYTE(v27) = 1;
  }

  id v14 = v19;
  id v15 = v18;
  id v16 = v17;
  a8 = v32;
  id v13 = v20;
  if (v32)
  {
LABEL_19:
    if ((v27 & 1) == 0)
    {
      uint64_t v29 = objc_msgSend(a1, "_iMessage_localizedErrorForReason:", v28);
      id v30 = v29;
      if (v29) {
        *a8 = v29;
      }
    }
  }
LABEL_23:

  return v27;
}

+ (id)_iMessage_localizedErrorForReason:(int64_t)a3
{
  id v3 = (void *)a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  switch(a3)
  {
    case 0:
      goto LABEL_30;
    case 2001:
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(44);
        uint64_t v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v15 = 2001;
          _os_log_impl(&dword_18EF18000, v6, OS_LOG_TYPE_DEBUG, "iMessage: Not handing back error for too many attachments: %ld", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        uint64_t v13 = 2001;
        _CKLog();
      }
      break;
    case 3001:
      id v4 = CKFrameworkBundle();
      uint64_t v5 = [v4 localizedStringForKey:@"ERR_NEED_IMESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

      goto LABEL_20;
    default:
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(44);
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v15 = (uint64_t)v3;
          _os_log_impl(&dword_18EF18000, v7, OS_LOG_TYPE_DEBUG, "iMessage: Not handing back error with: %ld", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        uint64_t v13 = (uint64_t)v3;
        _CKLog();
      }
      break;
  }
  uint64_t v5 = 0;
LABEL_20:
  int v8 = CKShowInternalErrors();
  int v9 = v8;
  if (v5 || v8)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v5)
    {
      if (v9)
      {
        uint64_t v11 = [NSString stringWithFormat:@"%@\n\n[INTERNAL]\niMessage Content Error: %ld", v5, v3];

        uint64_t v5 = (void *)v11;
      }
      objc_msgSend(v10, "setObject:forKey:", v5, *MEMORY[0x1E4F28568], v13);
    }
    else
    {
      uint64_t v5 = 0;
    }
    id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CKMessageContentErrorDomain", v3, v10, v13);
  }
  else
  {
    id v3 = 0;
    uint64_t v5 = 0;
  }

LABEL_30:

  return v3;
}

- (BOOL)_iMessage_canSendToRecipients:(id)a3 alertIfUnable:(BOOL)a4
{
  return 1;
}

+ (unint64_t)_iMessage_maxTransferFileSizeForWiFi:(BOOL)a3
{
  BOOL v3 = a3;
  unint64_t v9 = 0;
  unint64_t v10 = 0;
  if (!CKIsRunningInMessages()
    && (IMIsRunningInMessagesComposeViewService() & 1) == 0
    && !CKIsRunningInMessagesNotificationViewService()
    && !CKIsRunningInMessagesNotificationExtension()
    || (id v4 = (void *)MEMORY[0x1E4F6E660],
        objc_msgSend(MEMORY[0x1E4F61768], "sharedInstanceForBagType:", 1, v9),
        uint64_t v5 = objc_claimAutoreleasedReturnValue(),
        [v4 IMiMessageMaxTransferFileSizeForWifiForPhoneNumber:&v10 cellSize:&v9 serverConfigurationBag:v5 phoneNumber:0 simID:0], v5, (unint64_t v6 = v10) == 0))
  {
    unint64_t v6 = 10485760;
  }
  unint64_t v7 = v9;
  if (!v9) {
    unint64_t v7 = 0x200000;
  }
  if (v3) {
    return v6;
  }
  else {
    return v7;
  }
}

+ (double)_iMessage_maxTrimDurationForMediaType:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  if (_iMessage_maxTrimDurationForMediaType___pred_CMTimeGetSecondsCoreMedia != -1) {
    dispatch_once(&_iMessage_maxTrimDurationForMediaType___pred_CMTimeGetSecondsCoreMedia, &__block_literal_global_163);
  }
  uint64_t v5 = (void *)MEMORY[0x1E4F1C9E8];
  unint64_t v6 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(a1, "_iMessage_maxTransferFileSizeForWiFi:", 1));
  unint64_t v7 = [v5 dictionaryWithObject:v6 forKey:@"fileLengthLimit"];

  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(19);
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 67109120;
      LODWORD(v22) = v3;
      _os_log_impl(&dword_18EF18000, v8, OS_LOG_TYPE_DEBUG, "maxTrimDurationForMediaType: %d", buf, 8u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    uint64_t v18 = v3;
    _CKLog();
  }
  if ((v3 - 3) >= 9 && v3)
  {
    if (v3 == 2)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(19);
        uint64_t v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_DEBUG, "video!", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
        _CKLog();
      }
      id v17 = (double (*)(unsigned char *))_iMessage_maxTrimDurationForMediaType___CMTimeGetSeconds;
      objc_msgSend(MEMORY[0x1E4F16360], "maximumDurationForPreset:properties:", *MEMORY[0x1E4F15748], v7, v18);
      double v15 = v17(v19);
    }
    else
    {
      double v10 = 0.0;
      if (v3 != 1) {
        goto LABEL_19;
      }
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(19);
        uint64_t v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_18EF18000, v13, OS_LOG_TYPE_DEBUG, "audio!", buf, 2u);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
        _CKLog();
      }
      id v14 = (void (*)(unsigned char *))_iMessage_maxTrimDurationForMediaType___CMTimeGetSeconds;
      objc_msgSend(MEMORY[0x1E4F16360], "maximumDurationForPreset:properties:", *MEMORY[0x1E4F15750], v7, v18);
      v14(v20);
    }
    double v10 = v15;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(19);
      unint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_18EF18000, v9, OS_LOG_TYPE_DEBUG, "default/unsupported mediaType!", buf, 2u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
    double v10 = 9.22337204e18;
  }
LABEL_19:
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(19);
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134217984;
      double v22 = v10;
      _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_DEBUG, "Max trim answer: %f", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
    _CKLog();
  }

  return v10;
}

void *__75__CKConversation_Content_Utilities___iMessage_maxTrimDurationForMediaType___block_invoke()
{
  result = (void *)MEMORY[0x192FBA870]("CMTimeGetSeconds", @"CoreMedia");
  _iMessage_maxTrimDurationForMediaType___CMTimeGetSeconds = result;
  return result;
}

+ (BOOL)_sms_mediaObjectPassesRestriction:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 data];
  uint64_t v5 = [v4 length];

  if ([v3 mediaType] == 3)
  {
    unint64_t v6 = (void *)MEMORY[0x1E4F42A80];
    unint64_t v7 = [v3 data];
    int v8 = [v6 ckImageWithData:v7];

    [v8 size];
    CGFloat v10 = v9;
    CGFloat v12 = v11;
  }
  else
  {
    CGFloat v10 = *MEMORY[0x1E4F1DB30];
    CGFloat v12 = *(double *)(MEMORY[0x1E4F1DB30] + 8);
  }
  uint64_t v13 = [v3 mimeType];
  int CanBeSent = IMMMSPartCanBeSent();

  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    double v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      if (CanBeSent) {
        uint64_t v16 = @"YES";
      }
      else {
        uint64_t v16 = @"NO";
      }
      id v17 = [v3 mimeType];
      v31.double width = v10;
      v31.double height = v12;
      uint64_t v18 = NSStringFromCGSize(v31);
      *(_DWORD *)long long buf = 138413058;
      uint64_t v23 = v16;
      __int16 v24 = 2112;
      id v25 = v17;
      __int16 v26 = 2048;
      uint64_t v27 = v5;
      __int16 v28 = 2112;
      uint64_t v29 = v18;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_DEBUG, "(MMS) Accept: %@ (MIME Type: %@, length %lu, sz %@)", buf, 0x2Au);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    id v19 = [v3 mimeType];
    v32.double width = v10;
    v32.double height = v12;
    __int16 v21 = NSStringFromCGSize(v32);
    _CKLog();
  }
  return CanBeSent;
}

+ (int64_t)_sms_maxAttachmentCountForPhoneNumber:(id)a3 simID:(id)a4
{
  return (int)[MEMORY[0x1E4F6E660] IMMMSMaximumSlideCountForPhoneNumber:a3 simID:a4];
}

- (BOOL)_sms_willSendMMSByDefaultForAddresses:(id)a3
{
  id v4 = a3;
  uint64_t v5 = (void *)MEMORY[0x1E4F6BDC0];
  unint64_t v6 = [(CKConversation *)self lastAddressedHandle];
  unint64_t v7 = [(CKConversation *)self lastAddressedSIMID];
  LODWORD(v5) = [v5 mmsEnabledforPhoneNumber:v6 simID:v7];

  if (v5
    && [v4 count]
    && ([v4 count] != 1
     || ([v4 lastObject],
         int v8 = objc_claimAutoreleasedReturnValue(),
         int IsEmail = IMStringIsEmail(),
         v8,
         IsEmail)))
  {
    if ((unint64_t)[v4 count] < 2)
    {
      char v13 = 1;
    }
    else
    {
      CGFloat v10 = (void *)MEMORY[0x1E4F6E660];
      double v11 = [(CKConversation *)self lastAddressedHandle];
      CGFloat v12 = [(CKConversation *)self lastAddressedSIMID];
      char v13 = [v10 IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:v11 simID:v12];
    }
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)_sms_supportsCharacterCountForAddresses:(id)a3
{
  return ![(CKConversation *)self _sms_willSendMMSByDefaultForAddresses:a3];
}

+ (BOOL)_sms_canSendMessageWithMediaObjectTypes:(int *)a3 phoneNumber:(id)a4 simID:(id)a5 errorCode:(int64_t *)a6
{
  *(void *)&v51[13] = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  uint64_t v12 = 0;
  LODWORD(v13) = 0;
  do
    uint64_t v13 = a3[v12++] + (uint64_t)(int)v13;
  while (v12 != 11);
  uint64_t v14 = objc_msgSend(a1, "_sms_maxAttachmentCountForPhoneNumber:simID:", v10, v11);
  if (v14 == 0x7FFFFFFFFFFFFFFFLL) {
    goto LABEL_15;
  }
  uint64_t v15 = v14;
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&id v17 = COERCE_DOUBLE(@"YES");
      *(_DWORD *)long long buf = 138412802;
      if (v15 < v13) {
        *(double *)&id v17 = COERCE_DOUBLE(@"NO");
      }
      double v49 = *(double *)&v17;
      __int16 v50 = 1024;
      *(_DWORD *)long long v51 = v13;
      void v51[2] = 2048;
      *(void *)&v51[3] = v15;
      _os_log_impl(&dword_18EF18000, v16, OS_LOG_TYPE_DEBUG, "(MMS) Accept: %@: total count: %d, max attachment count: %ld", buf, 0x1Cu);
    }
  }
  if (!os_log_shim_legacy_logging_enabled() || !_CKShouldLog())
  {
    if (v15 >= v13) {
      goto LABEL_15;
    }
LABEL_19:
    BOOL v21 = 0;
    uint64_t v19 = 2001;
    goto LABEL_63;
  }
  uint64_t v18 = @"YES";
  if (v15 < v13) {
    uint64_t v18 = @"NO";
  }
  uint64_t v44 = v13;
  uint64_t v47 = v15;
  id v43 = v18;
  _CKLog();
  if (v15 < v13) {
    goto LABEL_19;
  }
LABEL_15:
  if (a3[1] >= 1)
  {
    if ((int)v13 <= 1)
    {
      *(double *)&uint64_t v19 = 0.0;
      int v20 = 1;
      goto LABEL_23;
    }
    goto LABEL_22;
  }
  *(double *)&uint64_t v19 = 0.0;
  int v20 = 1;
  if (a3[2] >= 1 && (int)v13 > 1)
  {
LABEL_22:
    int v20 = 0;
    uint64_t v19 = 2004;
  }
LABEL_23:
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    double v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&uint64_t v23 = COERCE_DOUBLE(@"NO");
      if (v20) {
        *(double *)&uint64_t v23 = COERCE_DOUBLE(@"YES");
      }
      int v24 = a3[1];
      int v25 = a3[2];
      *(_DWORD *)long long buf = 138412802;
      double v49 = *(double *)&v23;
      __int16 v50 = 1024;
      *(_DWORD *)long long v51 = v13;
      void v51[2] = 1024;
      *(_DWORD *)&v51[3] = v25 + v24;
      _os_log_impl(&dword_18EF18000, v22, OS_LOG_TYPE_DEBUG, "(MMS) Accept: %@: total count: %d, avCount: %d", buf, 0x18u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    __int16 v26 = @"NO";
    if (v20) {
      __int16 v26 = @"YES";
    }
    uint64_t v44 = v13;
    uint64_t v47 = (a3[2] + a3[1]);
    id v43 = v26;
    _CKLog();
    if ((v20 & 1) == 0) {
      goto LABEL_34;
    }
  }
  else if (!v20)
  {
LABEL_34:
    BOOL v21 = 0;
    goto LABEL_63;
  }
  *(void *)&double v27 = (int)objc_msgSend(MEMORY[0x1E4F6E660], "IMMMSMaximumMessageByteCountForPhoneNumber:simID:", v10, v11, v43, v44, v47);
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    __int16 v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134217984;
      double v49 = v27;
      _os_log_impl(&dword_18EF18000, v28, OS_LOG_TYPE_DEBUG, "(MMS) Max Message Byte Count: %lld", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
    _CKLog();
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    uint64_t v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 134217984;
      double v49 = (double)SLODWORD(v27) * 0.95;
      _os_log_impl(&dword_18EF18000, v29, OS_LOG_TYPE_DEBUG, "(MMS) Max Message Byte Count (less backoff): %f", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
    _CKLog();
  }
  float v30 = (double)SLODWORD(v27) * 0.95 / 10240.0;
  float v31 = floorf(v30);
  if (v31 < 1.0) {
    float v31 = 1.0;
  }
  int v32 = (int)v31;
  int v33 = a3[3];
  BOOL v21 = v33 <= (int)v31;
  if (v33 > (int)v31) {
    uint64_t v19 = 2002;
  }
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    long long v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEBUG))
    {
      *(double *)&long long v35 = COERCE_DOUBLE(@"NO");
      *(_DWORD *)long long buf = 138412802;
      if (v33 <= v32) {
        *(double *)&long long v35 = COERCE_DOUBLE(@"YES");
      }
      double v49 = *(double *)&v35;
      __int16 v50 = 1024;
      *(_DWORD *)long long v51 = v32;
      void v51[2] = 1024;
      *(_DWORD *)&v51[3] = v33;
      _os_log_impl(&dword_18EF18000, v34, OS_LOG_TYPE_DEBUG, "(MMS) Accept: %@: maximumImageCount: %d, asked for %d", buf, 0x18u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
    _CKLog();
  }
LABEL_63:
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    long long v36 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v36, OS_LOG_TYPE_DEBUG))
    {
      if (v21) {
        *(double *)&long long v37 = COERCE_DOUBLE(@"YES");
      }
      else {
        *(double *)&long long v37 = COERCE_DOUBLE(@"NO");
      }
      long long v38 = CKErrorStringForCKMessageContentError(v19);
      *(_DWORD *)long long buf = 138412546;
      double v49 = *(double *)&v37;
      __int16 v50 = 2112;
      *(void *)long long v51 = v38;
      _os_log_impl(&dword_18EF18000, v36, OS_LOG_TYPE_DEBUG, "(MMS) Accept: %@ reason [%@]", buf, 0x16u);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    v45 = CKErrorStringForCKMessageContentError(v19);
    _CKLog();
  }
  if (a6) {
    char v39 = v21;
  }
  else {
    char v39 = 1;
  }
  if ((v39 & 1) == 0)
  {
    *a6 = v19;
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(24);
      uint64_t v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEBUG))
      {
        v41 = CKErrorStringForCKMessageContentError(v19);
        *(_DWORD *)long long buf = 134218242;
        double v49 = *(double *)&v19;
        __int16 v50 = 2112;
        *(void *)long long v51 = v41;
        _os_log_impl(&dword_18EF18000, v40, OS_LOG_TYPE_DEBUG, "Error code: %ld description: %@", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
    {
      id v46 = CKErrorStringForCKMessageContentError(v19);
      _CKLog();
    }
  }

  return v21;
}

+ (BOOL)_sms_canSendMessageWithMediaObjectTypes:(int *)a3 phoneNumber:(id)a4 simID:(id)a5
{
  return objc_msgSend(a1, "_sms_canSendMessageWithMediaObjectTypes:phoneNumber:simID:errorCode:", a3, a4, a5, 0);
}

+ (BOOL)_sms_canAcceptMediaObjectType:(int)a3 givenMediaObjects:(id)a4 phoneNumber:(id)a5 simID:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  memset(v25, 0, 44);
  ++*((_DWORD *)v25 + a3);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v13 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v21;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v21 != v15) {
          objc_enumerationMutation(v10);
        }
        int v17 = [*(id *)(*((void *)&v20 + 1) + 8 * i) mediaType];
        ++*((_DWORD *)v25 + v17);
      }
      uint64_t v14 = [v10 countByEnumeratingWithState:&v20 objects:v24 count:16];
    }
    while (v14);
  }
  char v18 = objc_msgSend(a1, "_sms_canSendMessageWithMediaObjectTypes:phoneNumber:simID:", v25, v11, v12);

  return v18;
}

+ (BOOL)_sms_canSendComposition:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5 recipientsContainEmail:(BOOL)a6 error:(id *)a7
{
  return objc_msgSend(a1, "_sms_canSendComposition:lastAddressedHandle:lastAddressedSIMID:recipientsContainEmail:skipMMSCheck:error:", a3, a4, a5, a6, 0, a7);
}

+ (BOOL)_sms_canSendComposition:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5 recipientsContainEmail:(BOOL)a6 skipMMSCheck:(BOOL)a7 error:(id *)a8
{
  BOOL v51 = a6;
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  int v49 = [MEMORY[0x1E4F6BDC0] mmsEnabledforPhoneNumber:v12 simID:v13];
  long long v53 = v12;
  long long v54 = v13;
  int v14 = [MEMORY[0x1E4F6E660] IMMMSRestrictedModeEnabledForPhoneNumber:v12 simID:v13];
  memset(v74, 0, 44);
  if (IMOSLoggingEnabled())
  {
    CKLogCStringForType(24);
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v16 = @"NO";
      if (v14) {
        uint64_t v16 = @"YES";
      }
      *(_DWORD *)long long buf = 138412290;
      *(void *)&uint8_t buf[4] = v16;
      _os_log_impl(&dword_18EF18000, v15, OS_LOG_TYPE_DEBUG, "(MMS) Restricted Mode Enabled [%@]", buf, 0xCu);
    }
  }
  if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
  {
    int v17 = @"NO";
    if (v14) {
      int v17 = @"YES";
    }
    uint64_t v48 = v17;
    _CKLog();
  }
  __int16 v57 = objc_msgSend(v11, "shelfPluginPayload", v48);
  objc_opt_class();
  char isKindOfClass = objc_opt_isKindOfClass();
  uint64_t v19 = v57;
  if ((isKindOfClass & 1) == 0) {
    uint64_t v19 = 0;
  }
  id v56 = v19;
  int v20 = [v56 shouldSendAsMediaObject];
  if (v20)
  {
    long long v21 = [v56 mediaObjectFromPayload];
    uint64_t v22 = [v11 compositionByAppendingMediaObject:v21];

    long long v23 = (void *)v22;
  }
  else
  {
    long long v23 = v11;
  }
  long long v55 = v23;
  int v24 = [v23 mediaObjects];
  long long v68 = 0u;
  long long v69 = 0u;
  long long v66 = 0u;
  long long v67 = 0u;
  char v25 = 0;
  char v26 = 0;
  uint64_t v27 = [v24 countByEnumeratingWithState:&v66 objects:v72 count:16];
  if (v27)
  {
    uint64_t v28 = *(void *)v67;
    do
    {
      for (uint64_t i = 0; i != v27; ++i)
      {
        if (*(void *)v67 != v28) {
          objc_enumerationMutation(v24);
        }
        int v30 = [*(id *)(*((void *)&v66 + 1) + 8 * i) mediaType];
        ++*((_DWORD *)v74 + v30);
        v25 |= v30 == 2;
        v26 |= v30 == 7;
      }
      uint64_t v27 = [v24 countByEnumeratingWithState:&v66 objects:v72 count:16];
    }
    while (v27);
  }
  if ([v24 count]) {
    int v31 = 1;
  }
  else {
    int v31 = v20;
  }
  if (v31)
  {
    BOOL v32 = 1;
  }
  else
  {
    int v33 = [v55 subject];
    BOOL v32 = [v33 length] != 0;
  }
  if (v26)
  {
    LOBYTE(v34) = 0;
    uint64_t v35 = 2003;
  }
  else
  {
    LOBYTE(v34) = 1;
    if (!v51 && !v32 || a7) {
      goto LABEL_73;
    }
    int v34 = v49;
    if (v49) {
      uint64_t v35 = 0;
    }
    else {
      uint64_t v35 = 3000;
    }
    if ((v49 & v31) == 1)
    {
      *(void *)long long buf = 0;
      int v34 = objc_msgSend(a1, "_sms_canSendMessageWithMediaObjectTypes:phoneNumber:simID:errorCode:", v74, v53, v54, buf);
      if (v34) {
        uint64_t v35 = 0;
      }
      else {
        uint64_t v35 = *(void *)buf;
      }
    }
    if ((v31 & v34 & v14) == 1)
    {
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v38 = v24;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v62 objects:v71 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v63;
        while (2)
        {
          for (uint64_t j = 0; j != v39; ++j)
          {
            if (*(void *)v63 != v40) {
              objc_enumerationMutation(v38);
            }
            if (!objc_msgSend(a1, "_sms_mediaObjectPassesRestriction:", *(void *)(*((void *)&v62 + 1) + 8 * j)))
            {
              int v34 = 0;
              uint64_t v35 = 2003;
              goto LABEL_58;
            }
          }
          uint64_t v39 = [v38 countByEnumeratingWithState:&v62 objects:v71 count:16];
          if (v39) {
            continue;
          }
          break;
        }
      }
      else
      {
        int v34 = 1;
      }
LABEL_58:
    }
    if (v34)
    {
      if ((v25 & 1) == 0)
      {
        LOBYTE(v34) = 1;
        goto LABEL_73;
      }
      long long v60 = 0u;
      long long v61 = 0u;
      long long v58 = 0u;
      long long v59 = 0u;
      id v42 = v24;
      uint64_t v43 = [v42 countByEnumeratingWithState:&v58 objects:v70 count:16];
      if (v43)
      {
        uint64_t v44 = *(void *)v59;
        do
        {
          for (uint64_t k = 0; k != v43; ++k)
          {
            if (*(void *)v59 != v44) {
              objc_enumerationMutation(v42);
            }
            id v46 = *(void **)(*((void *)&v58 + 1) + 8 * k);
            if ([v46 mediaType] - 1 <= 1
              && !objc_msgSend(a1, "_sms_mediaObjectPassesDurationCheck:", v46))
            {
              uint64_t v35 = 2005;
              LOBYTE(v34) = 0;
            }
          }
          uint64_t v43 = [v42 countByEnumeratingWithState:&v58 objects:v70 count:16];
        }
        while (v43);
        LOBYTE(v34) = v34 & 1;
      }
      else
      {
        LOBYTE(v34) = 1;
      }
    }
  }
  if (a8 && (v34 & 1) == 0)
  {
    long long v36 = objc_msgSend(a1, "_sms_localizedErrorForReason:", v35);
    long long v37 = v36;
    if (v36) {
      *a8 = v36;
    }

    LOBYTE(v34) = 0;
  }
LABEL_73:

  return v34;
}

+ (BOOL)_rcs_canSendComposition:(id)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5 recipientsContainEmail:(BOOL)a6 error:(id *)a7
{
  return objc_msgSend(a1, "_sms_canSendComposition:lastAddressedHandle:lastAddressedSIMID:recipientsContainEmail:skipMMSCheck:error:", a3, a4, a5, a6, 1, a7);
}

+ (id)_sms_localizedErrorForReason:(int64_t)a3
{
  id v3 = (void *)a3;
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ((unint64_t)(a3 - 2001) >= 5)
  {
    if (!a3) {
      goto LABEL_17;
    }
    if (a3 != 3000)
    {
      if (IMOSLoggingEnabled())
      {
        CKLogCStringForType(44);
        id v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
        {
          *(_DWORD *)long long buf = 134217984;
          uint64_t v15 = v3;
          _os_log_impl(&dword_18EF18000, v12, OS_LOG_TYPE_DEBUG, "SMS: Not generating NSError for message content error: %ld", buf, 0xCu);
        }
      }
      if (os_log_shim_legacy_logging_enabled() && _CKShouldLog())
      {
        id v13 = v3;
        _CKLog();
      }
      unint64_t v6 = 0;
      goto LABEL_4;
    }
    id v4 = CKFrameworkBundle();
    uint64_t v5 = [v4 localizedStringForKey:@"ERR_NEED_MMS" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  else
  {
    id v4 = CKFrameworkBundle();
    uint64_t v5 = [v4 localizedStringForKey:@"ERR_NEED_IMESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];
  }
  unint64_t v6 = (void *)v5;

LABEL_4:
  int v7 = CKShowInternalErrors();
  int v8 = v7;
  if (v6 || v7)
  {
    id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if (v6)
    {
      if (v8)
      {
        uint64_t v10 = [NSString stringWithFormat:@"%@\n\n[INTERNAL]\nSMS Content Error: %ld", v6, v3];

        unint64_t v6 = (void *)v10;
      }
      objc_msgSend(v9, "setObject:forKey:", v6, *MEMORY[0x1E4F28568], v13);
    }
    else
    {
      unint64_t v6 = 0;
    }
    id v3 = objc_msgSend(MEMORY[0x1E4F28C58], "errorWithDomain:code:userInfo:", @"CKMessageContentErrorDomain", v3, v9, v13);
  }
  else
  {
    id v3 = 0;
    unint64_t v6 = 0;
  }

LABEL_17:

  return v3;
}

+ (double)_sms_maxTrimDurationForMediaType:(int)a3
{
  if (a3 == 1) {
    [MEMORY[0x1E4F6E660] IMMMSMaximumAudioDurationForPhoneNumber:0 simID:0];
  }
  else {
    [MEMORY[0x1E4F6E660] IMMMSMaximumVideoDurationForPhoneNumber:0 simID:0];
  }
  return result;
}

+ (BOOL)_sms_mediaObjectPassesDurationCheck:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4
    && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0)
    && ([v4 duration],
        double v6 = v5,
        objc_msgSend(a1, "_sms_maxTrimDurationForMediaType:", objc_msgSend(v4, "mediaType")),
        double v8 = v7,
        v6 >= v7 + 0.00000011920929))
  {
    if (IMOSLoggingEnabled())
    {
      CKLogCStringForType(44);
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134218240;
        double v13 = v6;
        __int16 v14 = 2048;
        double v15 = v8;
        _os_log_impl(&dword_18EF18000, v11, OS_LOG_TYPE_DEBUG, "SMS: Media has duration:%f   max: %f", buf, 0x16u);
      }
    }
    if (os_log_shim_legacy_logging_enabled() && _CKShouldLog()) {
      _CKLog();
    }
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (BOOL)_sms_canSendToRecipients:(id)a3 alertIfUnable:(BOOL)a4
{
  LODWORD(v4) = a4;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  double v7 = (void *)MEMORY[0x1E4F6BDC0];
  double v8 = [(CKConversation *)self lastAddressedHandle];
  BOOL v9 = [(CKConversation *)self lastAddressedSIMID];
  char v10 = [v7 mmsEnabledforPhoneNumber:v8 simID:v9];

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v11 = v6;
  uint64_t v12 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
  if (v12)
  {
    uint64_t v13 = v12;
    uint64_t v14 = *(void *)v30;
    double v15 = (void *)*MEMORY[0x1E4F1ADC8];
    while (2)
    {
      for (uint64_t i = 0; i != v13; ++i)
      {
        if (*(void *)v30 != v14) {
          objc_enumerationMutation(v11);
        }
        if ((v10 & 1) == 0)
        {
          int v17 = [*(id *)(*((void *)&v29 + 1) + 8 * i) propertyType];

          if (v17 == v15)
          {
            if (v4)
            {
              char v18 = CKFrameworkBundle();
              id v4 = [v18 localizedStringForKey:@"CANNOT_SEND_MESSAGE" value:&stru_1EDE4CA38 table:@"ChatKit"];

              uint64_t v19 = CKFrameworkBundle();
              int v20 = [v19 localizedStringForKey:@"ERR_NEED_MMS_TO_EMAIL" value:&stru_1EDE4CA38 table:@"ChatKit"];

              long long v21 = +[CKAlertController alertControllerWithTitle:v4 message:v20 preferredStyle:1];
              uint64_t v22 = CKFrameworkBundle();
              long long v23 = [v22 localizedStringForKey:@"OK" value:&stru_1EDE4CA38 table:@"ChatKit"];
              int v24 = +[CKAlertAction actionWithTitle:v23 style:0 handler:0];

              [v21 addAction:v24];
              block[0] = MEMORY[0x1E4F143A8];
              block[1] = 3221225472;
              block[2] = __80__CKConversation_SMS_Content_Utilities___sms_canSendToRecipients_alertIfUnable___block_invoke;
              block[3] = &unk_1E5620C40;
              id v28 = v21;
              id v25 = v21;
              dispatch_async(MEMORY[0x1E4F14428], block);

              LOBYTE(v4) = 0;
            }
            goto LABEL_13;
          }
        }
      }
      uint64_t v13 = [v11 countByEnumeratingWithState:&v29 objects:v33 count:16];
      if (v13) {
        continue;
      }
      break;
    }
  }
  LOBYTE(v4) = 1;
LABEL_13:

  return (char)v4;
}

void __80__CKConversation_SMS_Content_Utilities___sms_canSendToRecipients_alertIfUnable___block_invoke(uint64_t a1)
{
  id v2 = [MEMORY[0x1E4F42738] sharedApplication];
  id v3 = [v2 keyWindow];
  id v4 = [v3 rootViewController];

  [*(id *)(a1 + 32) presentFromViewController:v4 animated:1 completion:0];
}

- (BOOL)supportsSurf
{
  if ([(CKConversation *)self isGroupConversation]
    || [(CKConversation *)self isBusinessConversation])
  {
    return 0;
  }
  id v4 = [(CKConversation *)self sendingService];
  char v5 = objc_msgSend(v4, "__ck_isiMessage");

  return v5;
}

- (BOOL)supportsWaldo
{
  if ([(CKConversation *)self isBusinessConversation]) {
    return 0;
  }
  id v4 = [(CKConversation *)self sendingService];
  char v5 = objc_msgSend(v4, "__ck_isiMessage");

  return v5;
}

- (BOOL)supportsSafetyMonitor
{
  return +[CKCheckInAppVisibilityManager isCheckInVisibleInConversation:self];
}

- (id)activityForNewScene
{
  return [(CKConversation *)self activityForNewSceneCreatedViaDrag:0];
}

- (id)activityForNewSceneCreatedViaDrag:(BOOL)a3
{
  BOOL v3 = a3;
  v15[2] = *MEMORY[0x1E4F143B8];
  if (_IMWillLog())
  {
    uint64_t v13 = [(CKConversation *)self groupID];
    _IMAlwaysLog();
  }
  char v5 = [CKSceneDelegateState alloc];
  id v6 = [(CKConversation *)self groupID];
  double v7 = [(CKSceneDelegateState *)v5 initWithUnreadMessages:0 groupID:v6 composingNewMessage:0 filterMode:0 showingInbox:0];

  double v8 = +[CKSceneDelegate userInfoDictionaryForState:v7];
  if (v8)
  {
    BOOL v9 = (void *)[objc_alloc(MEMORY[0x1E4F22488]) initWithActivityType:@"com.apple.Messages.StateRestoration"];
    v14[1] = @"CKSceneInitiationTypeKey";
    v15[0] = &unk_1EDF16F10;
    v14[0] = @"CKCanvasStateRestorationContainerType";
    char v10 = [NSNumber numberWithInteger:!v3];
    v15[1] = v10;
    id v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:v14 count:2];
    [v9 addUserInfoEntriesFromDictionary:v11];

    [v9 addUserInfoEntriesFromDictionary:v8];
  }
  else
  {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)isAutoDonatingMessages
{
  return sub_18F64DCE4(self, (uint64_t)a2, (SEL *)&selRef_isAutoDonatingMessages);
}

- (void)sendAutoDonationUpdate:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = self;
  char v5 = [(CKConversation *)v4 chat];
  [(IMChat *)v5 sendAutoDonationUpdate:v3];
}

- (BOOL)shouldShowAutoDonationAction
{
  return sub_18F64DCE4(self, (uint64_t)a2, (SEL *)&selRef_shouldShowAutoDonationAction);
}

- (BOOL)canSendComposition:(id)a3 forCapabilities:(unint64_t)a4 error:(id *)a5
{
  id v7 = a3;
  double v8 = self;
  CKConversation.canSendComposition(_:forCapabilities:)(v7, a4);

  return 1;
}

- (id)carPlayMessageListItemWithTraitCollection:(id)a3 dateFormatter:(id)a4 timeFormatter:(id)a5 avatarImageRenderer:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = self;
  id v15 = CKConversation.carPlayMessageListItem(traitCollection:dateFormatter:timeFormatter:avatarImageRenderer:)((uint64_t)v10, v11, v12, (uint64_t)v13);

  return v15;
}

void __95__CKConversation_MessageHistoryViewControllerDataSource__fetchOldestMessageDateWithCompletion___block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Message history fetch failed with error: %@", (uint8_t *)&v2, 0xCu);
}

void __34__CKConversation_deleteBrandLogos__block_invoke_cold_1(uint64_t a1, NSObject *a2)
{
  uint64_t v4 = *MEMORY[0x1E4F143B8];
  int v2 = 138412290;
  uint64_t v3 = a1;
  _os_log_error_impl(&dword_18EF18000, a2, OS_LOG_TYPE_ERROR, "Unable to delete logos from cache. Error %@.", (uint8_t *)&v2, 0xCu);
}

- (void)sendMessage:(void *)a1 onService:newComposition:.cold.1(void *a1)
{
  objc_end_catch();
}

- (void)sendMessage:(void *)a1 onService:newComposition:.cold.2(void *a1)
{
  objc_end_catch();
}

- (void)senderIdentifier
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  char v5 = [a2 chat];
  int v6 = 138412546;
  uint64_t v7 = a1;
  __int16 v8 = 2112;
  BOOL v9 = v5;
  _os_log_error_impl(&dword_18EF18000, a3, OS_LOG_TYPE_ERROR, "senderIdentifier is nil for account: %@, chat: %@", (uint8_t *)&v6, 0x16u);
}

@end