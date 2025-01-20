@interface IMDNotificationsController
+ (BOOL)_isFacetimeHighlighted:(id)a3;
+ (BOOL)isSpamFilteringOn;
+ (BOOL)isUnknownSenderFilteringOn;
+ (id)_IMDCoreSpotlightCNContactForAddress:(id)a3;
+ (id)_addressBookNameForAddress:(id)a3 orContact:(id)a4;
+ (id)_addressForHandle:(id)a3;
+ (id)_countryCodeForHandle:(id)a3;
+ (id)_database;
+ (id)_displayNameForBusinessChatAddress:(id)a3 businessNameManager:(id)a4;
+ (id)_displayNameForChatRecord:(id)a3;
+ (id)_displayNameForHandle:(id)a3 andContact:(id)a4 businessNameManager:(id)a5 suggestionProvider:(id)a6;
+ (id)_formattedDisplayStringForAddress:(id)a3 countryCode:(id)a4;
+ (id)_lpLinkMetadataForMessage:(id)a3 attachmentPaths:(id)a4 originalURL:(id)a5;
+ (id)_pluginPayloadAttachmentPathsForMessage:(id)a3;
+ (id)_truncateNameIfNeeded:(id)a3;
+ (id)_uncanonicalizedAddressForHandle:(id)a3;
+ (id)logger;
+ (id)sharedInstance;
+ (int)reminderAlertCount;
+ (int)validateAlertCount:(int)a3;
- (BOOL)_UTITypeMightBeAnimated:(id)a3;
- (BOOL)_amIMentionedInMessage:(id)a3;
- (BOOL)_areAllMessagePartsRetractedForMessageDictionary:(id)a3;
- (BOOL)_chatHasCategoryMuted:(id)a3 isFromContact:(BOOL)a4;
- (BOOL)_chatIsMuted:(id)a3;
- (BOOL)_chatIsMutedBasedOnChatGUID:(id)a3 chatIdentifier:(id)a4 groupID:(id)a5 handles:(id)a6 lastAddressedHandleString:(id)a7 originalGroupID:(id)a8 style:(int64_t)a9;
- (BOOL)_contentBodyHasLocationURL:(id)a3;
- (BOOL)_deviceIsElgibileToBeForcedIntoFilteringUnknownSenders;
- (BOOL)_deviceUnderFirstUnlock;
- (BOOL)_filteringSettingConfirmed;
- (BOOL)_handleIsSpokenMessageAllowlisted:(id)a3 chat:(id)a4 message:(id)a5;
- (BOOL)_hasMigratedPreferences;
- (BOOL)_isMostActiveDevice;
- (BOOL)_isRaiseGestureEnabled;
- (BOOL)_isUnknownSenders:(id)a3;
- (BOOL)_messageIsBusiness:(id)a3;
- (BOOL)_messageIsFromFavorite:(id)a3;
- (BOOL)_messageIsFromKnownContact:(id)a3;
- (BOOL)_messageIsSOSMapURL:(id)a3;
- (BOOL)_messageIsStewieEmergency:(id)a3;
- (BOOL)_messageShouldBeSilentlyDeliveredForBusinessChat:(id)a3;
- (BOOL)_messageShouldBeSpoken:(id)a3 chatDictionary:(id)a4;
- (BOOL)_notificationIsFromAFilteredSender:(id)a3 messageDictionary:(id)a4;
- (BOOL)_overrideDNDForMessagesAddressingMe;
- (BOOL)_shouldOverrideChatSilencingBecauseImMentioned:(id)a3;
- (BOOL)_shouldPostNotificationForChat:(id)a3 messageDictionary:(id)a4;
- (BOOL)_shouldPostNotificationRequest:(id)a3 withCurrentlyPostedNotifications:(id)a4;
- (BOOL)_shouldRepostNotification:(id)a3 withAlreadyPostedNotification:(id)a4;
- (BOOL)areMyTokens:(id)a3 inMessage:(id)a4;
- (BOOL)copyFirstFrameOfMultiFrameImageAtFileURL:(id)a3 toFileURL:(id)a4;
- (BOOL)imagePreviewIsMultiFrameAtFileURL:(id)a3;
- (BOOL)isFromChatBotNotOTC:(id)a3;
- (CNContact)meContact;
- (IMBusinessNameManager)businessNameManager;
- (IMDNotificationsController)init;
- (NSSet)activeAccountAliases;
- (NSSet)meTokens;
- (UNNotificationCategory)incomingFilesNotificationCategory;
- (UNNotificationCategory)incomingMessageNotificationCategory;
- (UNUserNotificationCenter)notificationCenter;
- (id)RCSCategoryWithIdentifier:(id)a3 actions:(id)a4;
- (id)SMSCategoryWithIdentifier:(id)a3 actions:(id)a4;
- (id)_adaptiveImageGlyphForAttachment:(id)a3;
- (id)_attachmentRecordsForAssociatedMessagePartText:(id)a3;
- (id)_attributedMessageBodyByInsertingAdaptiveImageGlyphsInMessageBody:(id)a3 attachments:(id)a4;
- (id)_attributedSummaryOfTapback:(id)a3 messageDictionary:(id)a4 senderDisplayName:(id)a5;
- (id)_chatDictionaryForChatRecord:(id)a3;
- (id)_chatDictionaryForMessageRecord:(id)a3;
- (id)_coreSpotlightChatParticipantsFromChatDictionary:(id)a3 senderHandleID:(id)a4;
- (id)_displayNameForHandle:(id)a3;
- (id)_displayNameForHandle:(id)a3 andContact:(id)a4;
- (id)_failedMessageRecordsAfterDateInNanoseconds:(int64_t)a3;
- (id)_generateNotificationRequestForDeliveryError:(id)a3 isCarouselUITriggered:(BOOL)a4;
- (id)_generateNotificationRequestForMessageRecord:(id)a3 isUrgentMessageTrigger:(BOOL)a4 isCarouselUITriggered:(BOOL)a5 shouldAdvanceLastAlertedMessageDate:(BOOL *)a6;
- (id)_generateNotificationRequestForMessageRecord:(id)a3 messageDictionary:(id)a4 chatDictionary:(id)a5 isUrgentMessageTrigger:(BOOL)a6 isCarouselUITriggered:(BOOL)a7 shouldAdvanceLastAlertedMessageDate:(BOOL *)a8;
- (id)_groupPhotoInternalFilePathForGroupPhotoGuid:(id)a3;
- (id)_handleIDsForChatDictionary:(id)a3;
- (id)_lastMessageTimeForChat:(id)a3;
- (id)_lastTwoMessagesForChat:(id)a3;
- (id)_legacyDatePreference;
- (id)_makeNotificationCategories;
- (id)_messageDictionaryForMessageRecord:(id)a3;
- (id)_messageDictionaryForMessageRecord:(id)a3 copyThreadOriginator:(BOOL)a4;
- (id)_messages:(id)a3 newerThanDate:(int64_t)a4;
- (id)_messagesSortedByDate:(id)a3;
- (id)_nicknameDisplayNameForID:(id)a3;
- (id)_notificationsSafePreviewFileURLForTransferURL:(id)a3 utiType:(id)a4 knownSender:(BOOL)a5;
- (id)_requestForNonMostActiveDeviceRequest:(id)a3;
- (id)_senderDisplayNameForTapback:(id)a3 sendMessageIntent:(id)a4 chatParticipants:(id)a5;
- (id)_stickerTapbackTransferGUIDFromMessageDictionary:(id)a3;
- (id)_suggestedDisplayNameForAddress:(id)a3;
- (id)_synthesizedMessagingNotificationContentWithContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5 isUrgentMessageTrigger:(BOOL)a6;
- (id)_tapbackFromMessageDictionary:(id)a3;
- (id)_userNotificationForParticipantChangeMessageRecord:(id)a3;
- (id)_userNotificationsForFailedDeliveryMessageRecords:(id)a3 isCarouselUITriggered:(BOOL)a4;
- (id)_userNotificationsForMessageRecords:(id)a3 newerThanDate:(int64_t)a4 isUrgentMessageTrigger:(BOOL)a5 isCarouselUITriggered:(BOOL)a6;
- (id)allTokens;
- (id)contactForHandleRecord:(id)a3;
- (id)defaultsSharedInstance;
- (id)madridBusinessCategoryWithIdentifier:(id)a3 actions:(id)a4;
- (id)madridCategoryWithIdentifier:(id)a3 actions:(id)a4;
- (id)madridGroupCategoryWithIdentifier:(id)a3 actions:(id)a4;
- (id)noRelayCategoryWithIdentifier:(id)a3 actions:(id)a4;
- (int64_t)_legacyDateForMessageWithRowIDPreference:(int64_t)a3;
- (int64_t)_legacyRowIDPreference;
- (int64_t)lastAlertedFailedMessageDate;
- (int64_t)lastAlertedMessageDate;
- (unint64_t)_getMessagesSpokenAllowlistLevel:(BOOL *)a3;
- (unint64_t)_getSpokenMessageAllowlistLevelVersion;
- (unint64_t)screenTimeNotificationOptionsForChatDictionary:(id)a3;
- (unint64_t)screenTimeNotificationOptionsForContext:(id)a3;
- (void)__postNotificationRequests:(id)a3 isMostActiveDevice:(BOOL)a4;
- (void)__postNotifications;
- (void)_migrateLastedPostedPreferencesIfNeeded;
- (void)_populateAttachmentsForNotificationContent:(id)a3 messageDictionary:(id)a4 messageRecord:(id)a5 knownSender:(BOOL)a6;
- (void)_populateBasicNotificationIdentifyingContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5 isCarouselUITriggered:(BOOL)a6;
- (void)_populateBodyAndTitleForSendFailedNotificationContent:(id)a3 messageDictionary:(id)a4;
- (void)_populateBodyAndTitleForSendReceivedAsJunkNotificationContent:(id)a3 messageDictionary:(id)a4;
- (void)_populateBodyForNotificationContent:(id)a3 messageDictionary:(id)a4;
- (void)_populateIgnoresDoNotDisturb:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5;
- (void)_populateNotificationContentForTranscriptSharing:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5;
- (void)_populateRealertCountForNotificationContent:(id)a3;
- (void)_populateSoundAndDisplayActivationForNotificationContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5;
- (void)_populateSubtitleForNotificationContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5;
- (void)_populateTimeSensitiveOrCriticalForNotificationContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5;
- (void)_populateTitleForNotificationContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5;
- (void)_populateUserInfoForMessageContent:(id)a3 messageDictionary:(id)a4 messageIsAddressedToMe:(BOOL)a5;
- (void)_populateUserInfoOnContentForWatch:(id)a3 messageDictionary:(id)a4 chatDictionary:(id)a5 isCarouselUITriggered:(BOOL)a6;
- (void)_postNotificationRequests:(id)a3 isMostActiveDevice:(BOOL)a4;
- (void)_postUnreadNotificationRequests:(id)a3 failedNotificationRequests:(id)a4;
- (void)_postUrgentNotificationRequests:(id)a3;
- (void)_removeAllDeliveredMessageNotifications;
- (void)_setContactInMessageDictionary:(id)a3 messageDictionary:(id)a4;
- (void)_setHasMigratedPreferenceTrue;
- (void)_setLastPostedDateFromMigration:(id)a3;
- (void)_setMessagesSpokenAllowlistLevelInPreferences:(unint64_t)a3;
- (void)_setSpokenMessageAllowlistLevelVersion:(unint64_t)a3;
- (void)_setUpNotificationCenter;
- (void)_setupBusinessNameManager;
- (void)_setupCriticalNotifications;
- (void)_setupFirstLoad;
- (void)_setupMeContactAndTokens;
- (void)_storeLastAlertedFailedMessageDate:(int64_t)a3;
- (void)_storeLastAlertedMessageDate:(int64_t)a3;
- (void)advanceLastAlertedFailedMessageDate:(int64_t)a3;
- (void)advanceLastAlertedMessageDate:(int64_t)a3;
- (void)postFirstUnlockMessage:(id)a3 forIdentifier:(id)a4;
- (void)postNotificationsWithContext:(id)a3;
- (void)postSharePlayNotificationForChatGUID:(id)a3 faceTimeConversationUUID:(id)a4 handleIdentifier:(id)a5 localizedApplicationName:(id)a6;
- (void)postUrgentNotificationForMessages:(id)a3 withContext:(id)a4;
- (void)repostNotificationsFromFirstUnlockWithContext:(id)a3;
- (void)retractNotificationsForReadMessages:(id)a3;
- (void)setActiveAccountAliases:(id)a3;
- (void)setBusinessNameManager:(id)a3;
- (void)setIncomingFilesNotificationCategory:(id)a3;
- (void)setIncomingMessageNotificationCategory:(id)a3;
- (void)setLastAlertedFailedMessageDate:(int64_t)a3;
- (void)setLastAlertedMessageDate:(int64_t)a3;
- (void)setMeContact:(id)a3;
- (void)setMeTokens:(id)a3;
- (void)setNotificationCenter:(id)a3;
- (void)updatePostedNotificationsForMessages:(id)a3 withContext:(id)a4;
@end

@implementation IMDNotificationsController

+ (id)sharedInstance
{
  if (IMSupportsUserNotifications())
  {
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1AFB69160;
    block[3] = &unk_1E5F8E728;
    block[4] = a1;
    if (qword_1EB5ABCC0 != -1) {
      dispatch_once(&qword_1EB5ABCC0, block);
    }
    id v3 = (id)qword_1EB5ABCD8;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "Tried to access IMDNotificationsController on unsupported platform, returning nil.", buf, 2u);
      }
    }
    id v3 = 0;
  }
  return v3;
}

+ (id)logger
{
  if (qword_1E9AF8048 != -1) {
    dispatch_once(&qword_1E9AF8048, &unk_1F084CBE0);
  }
  v2 = (void *)qword_1E9AF8040;
  return v2;
}

- (IMDNotificationsController)init
{
  v5.receiver = self;
  v5.super_class = (Class)IMDNotificationsController;
  v2 = [(IMDNotificationsController *)&v5 init];
  id v3 = v2;
  if (v2)
  {
    [(IMDNotificationsController *)v2 _setupFirstLoad];
    [(IMDNotificationsController *)v3 _setUpNotificationCenter];
    [(IMDNotificationsController *)v3 _setupCriticalNotifications];
    [(IMDNotificationsController *)v3 _setupBusinessNameManager];
    [(IMDNotificationsController *)v3 _setupMeContactAndTokens];
  }
  return v3;
}

- (void)_setupBusinessNameManager
{
  id v3 = [MEMORY[0x1E4F6E640] sharedInstance];
  [(IMDNotificationsController *)self setBusinessNameManager:v3];
}

- (UNUserNotificationCenter)notificationCenter
{
  sub_1AFB69340(1);
  notificationCenter = self->_notificationCenter;
  return notificationCenter;
}

- (void)_setUpNotificationCenter
{
  id v3 = (UNUserNotificationCenter *)[objc_alloc(MEMORY[0x1E4F44680]) initWithBundleIdentifier:@"com.apple.MobileSMS"];
  notificationCenter = self->_notificationCenter;
  self->_notificationCenter = v3;

  id v5 = [(IMDNotificationsController *)self _makeNotificationCategories];
  [(UNUserNotificationCenter *)self->_notificationCenter setNotificationCategories:v5];
}

- (id)_makeNotificationCategories
{
  v26[2] = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  v4 = (void *)MEMORY[0x1E4F445A0];
  uint64_t v6 = *MEMORY[0x1E4F30208];
  v26[0] = *MEMORY[0x1E4F30200];
  uint64_t v5 = v26[0];
  v26[1] = v6;
  v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:v26 count:2];
  v8 = (void *)MEMORY[0x1E4F1CBF0];
  v24 = [v4 categoryWithIdentifier:@"MessageExtension" actions:MEMORY[0x1E4F1CBF0] intentIdentifiers:v7 options:14];

  [v3 addObject:v24];
  v23 = [(IMDNotificationsController *)self madridCategoryWithIdentifier:@"MessageExtension-Madrid" actions:v8];
  [v3 addObject:v23];
  v22 = [(IMDNotificationsController *)self madridGroupCategoryWithIdentifier:@"MessageExtension-MadridGroup" actions:v8];
  [v3 addObject:v22];
  v21 = [(IMDNotificationsController *)self madridBusinessCategoryWithIdentifier:@"MessageExtension-MadridBusiness" actions:v8];
  [v3 addObject:v21];
  v9 = [(IMDNotificationsController *)self SMSCategoryWithIdentifier:@"MessageExtension-SMS" actions:v8];
  [v3 addObject:v9];
  v10 = [(IMDNotificationsController *)self noRelayCategoryWithIdentifier:@"MessageExtension-NoRelay" actions:v8];
  [v3 addObject:v10];
  v11 = [(IMDNotificationsController *)self RCSCategoryWithIdentifier:@"MessageExtension-RCS" actions:v8];
  [v3 addObject:v11];
  v12 = (void *)MEMORY[0x1E4F445A0];
  v25[0] = v5;
  v25[1] = v6;
  v13 = [MEMORY[0x1E4F1C978] arrayWithObjects:v25 count:2];
  v14 = [v12 categoryWithIdentifier:@"MessageExtension-AudioRaise" actions:v8 intentIdentifiers:v13 options:33554446];

  [v3 addObject:v14];
  v15 = +[IMExtensionNotificationManager sharedInstance];
  uint64_t v16 = [v15 notificationCategories];
  v17 = (void *)v16;
  if (v16) {
    v18 = (void *)v16;
  }
  else {
    v18 = v8;
  }
  id v19 = v18;

  [v3 addObjectsFromArray:v19];
  return v3;
}

- (void)_setupCriticalNotifications
{
  id v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isCriticalAlertingEnabled];

  if (v4)
  {
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = sub_1AFB69968;
    v5[3] = &unk_1E5F8E798;
    v5[4] = self;
    sub_1AFB698F0(v5);
  }
}

- (id)defaultsSharedInstance
{
  return (id)[MEMORY[0x1E4F6E720] sharedInstance];
}

- (void)_setupMeContactAndTokens
{
  id v3 = [(IMDNotificationsController *)self _IMDContactStore];
  int v4 = IMMentionContactKeysForMe();
  uint64_t v7 = 0;
  uint64_t v5 = [v3 _crossPlatformUnifiedMeContactWithKeysToFetch:v4 error:&v7];

  uint64_t v6 = IMMentionMeTokensForContact();
  [(IMDNotificationsController *)self setMeTokens:v6];
  [(IMDNotificationsController *)self setMeContact:v5];
}

- (id)madridCategoryWithIdentifier:(id)a3 actions:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F445A0];
  uint64_t v6 = *MEMORY[0x1E4F30208];
  v15[0] = *MEMORY[0x1E4F30200];
  v15[1] = v6;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 arrayWithObjects:v15 count:2];
  v11 = [NSString localizedUserNotificationStringForKey:@"MADRID_MESSAGE_FORMAT" arguments:0];
  v12 = [NSString localizedUserNotificationStringForKey:@"SINGLE_SUMMARY_FORMAT" arguments:0];
  v13 = [v5 categoryWithIdentifier:v9 actions:v8 intentIdentifiers:v10 hiddenPreviewsBodyPlaceholder:v11 categorySummaryFormat:v12 options:14];

  return v13;
}

- (id)madridGroupCategoryWithIdentifier:(id)a3 actions:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F445A0];
  uint64_t v6 = *MEMORY[0x1E4F30208];
  v15[0] = *MEMORY[0x1E4F30200];
  v15[1] = v6;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 arrayWithObjects:v15 count:2];
  v11 = [NSString localizedUserNotificationStringForKey:@"MADRID_MESSAGE_FORMAT" arguments:0];
  v12 = [NSString localizedUserNotificationStringForKey:@"GROUP_SUMMARY_FORMAT" arguments:0];
  v13 = [v5 categoryWithIdentifier:v9 actions:v8 intentIdentifiers:v10 hiddenPreviewsBodyPlaceholder:v11 categorySummaryFormat:v12 options:14];

  return v13;
}

- (id)madridBusinessCategoryWithIdentifier:(id)a3 actions:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F445A0];
  uint64_t v6 = *MEMORY[0x1E4F30208];
  v15[0] = *MEMORY[0x1E4F30200];
  v15[1] = v6;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 arrayWithObjects:v15 count:2];
  v11 = [NSString localizedUserNotificationStringForKey:@"MADRID_BUSINESS_MESSAGE_FORMAT" arguments:0];
  v12 = [NSString localizedUserNotificationStringForKey:@"SINGLE_SUMMARY_FORMAT" arguments:0];
  v13 = [v5 categoryWithIdentifier:v9 actions:v8 intentIdentifiers:v10 hiddenPreviewsBodyPlaceholder:v11 categorySummaryFormat:v12 options:14];

  return v13;
}

- (id)SMSCategoryWithIdentifier:(id)a3 actions:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F445A0];
  uint64_t v6 = *MEMORY[0x1E4F30208];
  v15[0] = *MEMORY[0x1E4F30200];
  v15[1] = v6;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 arrayWithObjects:v15 count:2];
  v11 = [NSString localizedUserNotificationStringForKey:@"TEXT_MESSAGE_FORMAT" arguments:0];
  v12 = [NSString localizedUserNotificationStringForKey:@"SINGLE_SUMMARY_FORMAT" arguments:0];
  v13 = [v5 categoryWithIdentifier:v9 actions:v8 intentIdentifiers:v10 hiddenPreviewsBodyPlaceholder:v11 categorySummaryFormat:v12 options:14];

  return v13;
}

- (id)RCSCategoryWithIdentifier:(id)a3 actions:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F445A0];
  uint64_t v6 = *MEMORY[0x1E4F30208];
  v15[0] = *MEMORY[0x1E4F30200];
  v15[1] = v6;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 arrayWithObjects:v15 count:2];
  v11 = [NSString localizedUserNotificationStringForKey:@"TEXT_MESSAGE_FORMAT" arguments:0];
  v12 = [NSString localizedUserNotificationStringForKey:@"SINGLE_SUMMARY_FORMAT" arguments:0];
  v13 = [v5 categoryWithIdentifier:v9 actions:v8 intentIdentifiers:v10 hiddenPreviewsBodyPlaceholder:v11 categorySummaryFormat:v12 options:14];

  return v13;
}

- (id)noRelayCategoryWithIdentifier:(id)a3 actions:(id)a4
{
  v15[2] = *MEMORY[0x1E4F143B8];
  uint64_t v5 = (void *)MEMORY[0x1E4F445A0];
  uint64_t v6 = *MEMORY[0x1E4F30208];
  v15[0] = *MEMORY[0x1E4F30200];
  v15[1] = v6;
  uint64_t v7 = (void *)MEMORY[0x1E4F1C978];
  id v8 = a4;
  id v9 = a3;
  v10 = [v7 arrayWithObjects:v15 count:2];
  v11 = [NSString localizedUserNotificationStringForKey:@"TEXT_MESSAGE_FORMAT" arguments:0];
  v12 = [NSString localizedUserNotificationStringForKey:@"SINGLE_SUMMARY_FORMAT" arguments:0];
  v13 = [v5 categoryWithIdentifier:v9 actions:v8 intentIdentifiers:v10 hiddenPreviewsBodyPlaceholder:v11 categorySummaryFormat:v12 options:14];

  return v13;
}

- (BOOL)_hasMigratedPreferences
{
  return IMGetDomainBoolForKey();
}

- (id)_legacyDatePreference
{
  return (id)IMGetCachedDomainValueForKey();
}

- (int64_t)_legacyRowIDPreference
{
  return IMGetDomainIntForKey();
}

- (int64_t)_legacyDateForMessageWithRowIDPreference:(int64_t)a3
{
  id v3 = (void *)IMDMessageRecordCopyMessageForRowID(a3);
  int v4 = v3;
  if (v3) {
    int64_t v5 = [v3 rawDate];
  }
  else {
    int64_t v5 = -1;
  }

  return v5;
}

- (void)_setLastPostedDateFromMigration:(id)a3
{
}

- (void)_setHasMigratedPreferenceTrue
{
}

- (void)_migrateLastedPostedPreferencesIfNeeded
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (![(IMDNotificationsController *)self _hasMigratedPreferences])
  {
    id v3 = [(IMDNotificationsController *)self _legacyDatePreference];
    if (IMOSLoggingEnabled())
    {
      int v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        v17 = v3;
        _os_log_impl(&dword_1AFB53000, v4, OS_LOG_TYPE_INFO, "We have not migrated the SMSBBPlugin preferences to the new UserNotifications domain...doing so now with last posted date %@", (uint8_t *)&v16, 0xCu);
      }
    }
    if (v3 && [v3 integerValue])
    {
      if (IMOSLoggingEnabled())
      {
        int64_t v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          int v16 = 138412290;
          v17 = v3;
          _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "We are setting the date to be %@", (uint8_t *)&v16, 0xCu);
        }
      }
      [(IMDNotificationsController *)self _setLastPostedDateFromMigration:v3];
    }
    else
    {
      uint64_t v6 = [(IMDNotificationsController *)self _legacyRowIDPreference];
      if (IMOSLoggingEnabled())
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          LOWORD(v16) = 0;
          _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "The SMSBBPlugin last posted date was null, so migrating the rowid", (uint8_t *)&v16, 2u);
        }
      }
      if (v6 >= 1)
      {
        int64_t v8 = [(IMDNotificationsController *)self _legacyDateForMessageWithRowIDPreference:v6];
        int v9 = IMOSLoggingEnabled();
        if (v8 == -1)
        {
          if (v9)
          {
            v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              v15 = [NSNumber numberWithInteger:v6];
              int v16 = 138412290;
              v17 = v15;
              _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "lastAlertedMessage is null for the old rowid: %@ -- this device hasn't posted any message notifications", (uint8_t *)&v16, 0xCu);
            }
          }
        }
        else
        {
          if (v9)
          {
            v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              v11 = [NSNumber numberWithInteger:v6];
              v12 = [NSNumber numberWithLongLong:v8];
              int v16 = 138412546;
              v17 = v11;
              __int16 v18 = 2112;
              id v19 = v12;
              _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "The last posted rowid is %@ and the date for that message is %@", (uint8_t *)&v16, 0x16u);
            }
          }
          v13 = [NSNumber numberWithLongLong:v8];
          [(IMDNotificationsController *)self _setLastPostedDateFromMigration:v13];
        }
      }
    }
  }
  [(IMDNotificationsController *)self _setHasMigratedPreferenceTrue];
}

- (void)_setupFirstLoad
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  [(IMDNotificationsController *)self _migrateLastedPostedPreferencesIfNeeded];
  id v3 = IMGetCachedDomainValueForKey();
  uint64_t v4 = [v3 longLongValue];

  int64_t v5 = IMGetCachedDomainValueForKey();
  uint64_t v6 = [v5 longLongValue];

  uint64_t MostRecentMessageDate = IMDMessageRecordGetMostRecentMessageDate();
  if (v4 >= MostRecentMessageDate) {
    int64_t v8 = MostRecentMessageDate;
  }
  else {
    int64_t v8 = v4;
  }
  if (v6 >= MostRecentMessageDate) {
    int64_t v9 = MostRecentMessageDate;
  }
  else {
    int64_t v9 = v6;
  }
  if (MostRecentMessageDate == -1)
  {
    int64_t v8 = v4;
    int64_t v9 = v6;
  }
  self->_lastAlertedMessageDate = v8;
  self->_lastAlertedFailedMessageDate = v9;
  if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      v11 = [NSNumber numberWithLongLong:self->_lastAlertedMessageDate];
      v12 = [NSNumber numberWithLongLong:self->_lastAlertedFailedMessageDate];
      int v13 = 138412546;
      v14 = v11;
      __int16 v15 = 2112;
      int v16 = v12;
      _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Setup first load lastAlertedMessageDate %@ lastAlertedFailedMessageDate %@", (uint8_t *)&v13, 0x16u);
    }
  }
}

- (int64_t)lastAlertedMessageDate
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t lastAlertedMessageDate = v2->_lastAlertedMessageDate;
  objc_sync_exit(v2);

  return lastAlertedMessageDate;
}

- (int64_t)lastAlertedFailedMessageDate
{
  v2 = self;
  objc_sync_enter(v2);
  int64_t lastAlertedFailedMessageDate = v2->_lastAlertedFailedMessageDate;
  objc_sync_exit(v2);

  return lastAlertedFailedMessageDate;
}

- (void)_storeLastAlertedMessageDate:(int64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1AFB6AB64;
  block[3] = &unk_1E5F8E728;
  block[4] = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)_storeLastAlertedFailedMessageDate:(int64_t)a3
{
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1AFB6AC3C;
  block[3] = &unk_1E5F8E728;
  block[4] = a3;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)setLastAlertedMessageDate:(int64_t)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = self;
  objc_sync_enter(v4);
  v4->_int64_t lastAlertedMessageDate = a3;
  [(IMDNotificationsController *)v4 _storeLastAlertedMessageDate:a3];
  if (IMOSLoggingEnabled())
  {
    int64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [NSNumber numberWithLongLong:v4->_lastAlertedMessageDate];
      int v7 = 138412290;
      int64_t v8 = v6;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "setting last alerted message date to %@", (uint8_t *)&v7, 0xCu);
    }
  }
  objc_sync_exit(v4);
}

- (void)advanceLastAlertedMessageDate:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_lastAlertedMessageDate < a3) {
    [(IMDNotificationsController *)obj setLastAlertedMessageDate:a3];
  }
  objc_sync_exit(obj);
}

- (void)setLastAlertedFailedMessageDate:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  obj->_int64_t lastAlertedFailedMessageDate = a3;
  [(IMDNotificationsController *)obj _storeLastAlertedFailedMessageDate:a3];
  objc_sync_exit(obj);
}

- (void)advanceLastAlertedFailedMessageDate:(int64_t)a3
{
  obj = self;
  objc_sync_enter(obj);
  if (obj->_lastAlertedFailedMessageDate < a3) {
    [(IMDNotificationsController *)obj setLastAlertedFailedMessageDate:a3];
  }
  objc_sync_exit(obj);
}

- (BOOL)_overrideDNDForMessagesAddressingMe
{
  return IMGetDomainBoolForKeyWithDefaultValue();
}

- (id)_messagesSortedByDate:(id)a3
{
  return (id)[a3 sortedArrayUsingComparator:&unk_1F084C2A0];
}

- (id)_messages:(id)a3 newerThanDate:(int64_t)a4
{
  uint64_t v4 = (void *)MEMORY[0x1E4F28F60];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1AFB6B0F0;
  v9[3] = &unk_1E5F8E7D8;
  v9[4] = a4;
  id v5 = a3;
  uint64_t v6 = [v4 predicateWithBlock:v9];
  int v7 = [v5 filteredArrayUsingPredicate:v6];

  return v7;
}

- (id)_userNotificationForParticipantChangeMessageRecord:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  uint64_t v4 = (const __CFArray **)a3;
  id v5 = IMDCreateIMItemFromIMDMessageRecord(v4, 0, 1, 0);
  if (!v5 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {
    uint64_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1AFC6362C();
    }
    goto LABEL_8;
  }
  if ([v5 changeType])
  {
    uint64_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1AFC637F8(v5, v6);
    }
LABEL_8:
    int v7 = 0;
    goto LABEL_9;
  }
  if ([v5 isFromMe])
  {
    uint64_t v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG)) {
      sub_1AFC63694();
    }
    goto LABEL_8;
  }
  uint64_t v6 = [v4 chatRecord];
  if (!v6)
  {
    v28 = IMLogHandleForCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR)) {
      sub_1AFC63708(v4, v28);
    }

    goto LABEL_8;
  }
  uint64_t v31 = 0;
  v32 = &v31;
  uint64_t v33 = 0x2020000000;
  uint64_t v34 = 0;
  uint64_t v9 = +[IMDDatabase synchronousDatabase];
  v10 = [v6 guid];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  v30[2] = sub_1AFB6B7F0;
  v30[3] = &unk_1E5F8E3B8;
  v30[4] = &v31;
  [v9 fetchScheduledMessageRecordsForChatRecordWithGUID:v10 limit:2 completionHandler:v30];

  if (v32[3])
  {
    v11 = [MEMORY[0x1E4F1CA60] dictionary];
    v12 = [v4 guid];
    [v11 setObject:v12 forKeyedSubscript:@"__kmessageGUIDKey"];

    int v13 = [v4 handleRecord];
    [v11 setObject:v13 forKeyedSubscript:@"__kmessageHandleKey"];

    v14 = [v4 handleRecord];
    __int16 v15 = [(IMDNotificationsController *)self _displayNameForHandle:v14];

    int v16 = [v4 otherHandleRecord];
    uint64_t v17 = [(IMDNotificationsController *)self _displayNameForHandle:v16];

    __int16 v18 = NSString;
    id v19 = IMSharedUtilitiesFrameworkBundle();
    uint64_t v20 = [v19 localizedStringForKey:@"%@ added %@ to the conversation. %lu scheduled messages" value:&stru_1F084E970 table:@"IMSharedUtilities"];
    v21 = objc_msgSend(v18, "localizedStringWithFormat:", v20, v15, v17, v32[3]);
    [v11 setObject:v21 forKeyedSubscript:@"__kmessageTextKey"];

    v22 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "rawDate"));
    [v11 setObject:v22 forKeyedSubscript:@"__kmessageDateKey"];

    v23 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v4, "rawDate"));
    [v11 setObject:v23 forKeyedSubscript:@"__kmessageDateDeliveredKey"];

    v24 = [v4 handleRecord];
    [(IMDNotificationsController *)self _setContactInMessageDictionary:v24 messageDictionary:v11];

    if (IMOSLoggingEnabled())
    {
      v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        uint64_t v26 = v32[3];
        *(_DWORD *)buf = 138412802;
        v36 = v15;
        __int16 v37 = 2112;
        v38 = v17;
        __int16 v39 = 2048;
        uint64_t v40 = v26;
        _os_log_impl(&dword_1AFB53000, v25, OS_LOG_TYPE_INFO, "%@ added %@ and chat has scheduled message count: %lu", buf, 0x20u);
      }
    }
    buf[0] = 1;
    v27 = [(IMDNotificationsController *)self _chatDictionaryForChatRecord:v6];
    int v7 = [(IMDNotificationsController *)self _generateNotificationRequestForMessageRecord:0 messageDictionary:v11 chatDictionary:v27 isUrgentMessageTrigger:0 isCarouselUITriggered:0 shouldAdvanceLastAlertedMessageDate:buf];
  }
  else
  {
    v11 = IMLogHandleForCategory();
    if (!os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
    {
      int v7 = 0;
      goto LABEL_30;
    }
    __int16 v15 = v11;
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
    {
      v29 = [v6 guid];
      sub_1AFC637A0(v29, buf, v15);
    }
    int v7 = 0;
    v11 = v15;
  }

LABEL_30:
  _Block_object_dispose(&v31, 8);
LABEL_9:

  return v7;
}

- (id)_userNotificationsForMessageRecords:(id)a3 newerThanDate:(int64_t)a4 isUrgentMessageTrigger:(BOOL)a5 isCarouselUITriggered:(BOOL)a6
{
  BOOL v32 = a6;
  BOOL v6 = a5;
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  BOOL v31 = v6;
  id v26 = v9;
  int64_t v30 = a4;
  if (v6)
  {
    id v11 = v9;
  }
  else
  {
    -[IMDNotificationsController _messages:newerThanDate:](self, "_messages:newerThanDate:", v9, a4, v9);
    id v11 = (id)objc_claimAutoreleasedReturnValue();
  }
  v28 = v11;
  uint64_t v34 = [(IMDNotificationsController *)self _messagesSortedByDate:v26];
  uint64_t v33 = [v34 count];
  if (v33)
  {
    uint64_t v12 = 0;
    double v13 = (double)a4;
    id v29 = v10;
    do
    {
      v14 = (void *)MEMORY[0x1B3E8A120]();
      __int16 v15 = [v34 objectAtIndex:v12];
      uint64_t v16 = [v15 rawDate];
      if (IMOSLoggingEnabled())
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v16);
          id v18 = (id)objc_claimAutoreleasedReturnValue();
          id v19 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", v13);
          *(_DWORD *)buf = 134218754;
          uint64_t v37 = v16;
          __int16 v38 = 2112;
          id v39 = v18;
          __int16 v40 = 2048;
          int64_t v41 = v30;
          __int16 v42 = 2112;
          v43 = v19;
          _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "iterating new messages for newMessageDate: [%lld]-[%@], last alerted date: [%lld]-[%@]", buf, 0x2Au);
        }
      }
      char v35 = 1;
      if ([v15 itemType] == 1) {
        [(IMDNotificationsController *)self _userNotificationForParticipantChangeMessageRecord:v15];
      }
      else {
      uint64_t v20 = [(IMDNotificationsController *)self _generateNotificationRequestForMessageRecord:v15 isUrgentMessageTrigger:v31 isCarouselUITriggered:v32 shouldAdvanceLastAlertedMessageDate:&v35];
      }
      if (v20)
      {
        if (IMOSLoggingEnabled())
        {
          v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            id v22 = [v20 identifier];
            v23 = [v20 content];
            v24 = [v23 categoryIdentifier];
            *(_DWORD *)buf = 138412546;
            uint64_t v37 = (uint64_t)v22;
            __int16 v38 = 2112;
            id v39 = v24;
            _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "Generated notification request for identifier %@ with category identifier %@", buf, 0x16u);

            id v10 = v29;
          }
        }
        [(IMDNotificationsController *)self advanceLastAlertedMessageDate:v16];
        [v10 addObject:v20];
      }
      else if (v35)
      {
        [(IMDNotificationsController *)self advanceLastAlertedMessageDate:v16];
      }

      ++v12;
    }
    while (v33 != v12);
  }

  return v10;
}

- (id)_userNotificationsForFailedDeliveryMessageRecords:(id)a3 isCarouselUITriggered:(BOOL)a4
{
  BOOL v6 = [(IMDNotificationsController *)self _messagesSortedByDate:a3];
  id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB6BCA4;
  v12[3] = &unk_1E5F8E800;
  v12[4] = self;
  BOOL v14 = a4;
  id v8 = v7;
  id v13 = v8;
  [v6 enumerateObjectsWithOptions:2 usingBlock:v12];
  id v9 = v13;
  id v10 = v8;

  return v10;
}

- (void)__postNotifications
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v3, OS_LOG_TYPE_INFO, "Post notifications after coalescing, background threading", buf, 2u);
    }
  }
  uint64_t v4 = (void *)IMDMessageRecordCopyNewMessagesForKnownRowIDs(0);
  id v5 = [v4 objectForKey:@"newMessages"];
  id v23 = objc_alloc_init(MEMORY[0x1E4F1C978]);
  uint64_t v6 = [(IMDNotificationsController *)self lastAlertedMessageDate];
  uint64_t v7 = [(IMDNotificationsController *)self lastAlertedFailedMessageDate];
  id v8 = IMGetCachedDomainValueForKey();
  uint64_t v22 = objc_msgSend(v8, "__im_nanosecondTimeInterval");

  id v9 = [v4 objectForKey:@"lastFailedDate"];
  uint64_t v10 = [v9 longLongValue];

  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v21 = [v5 count];
      uint64_t v20 = [v23 count];
      objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v6);
      id v12 = (id)objc_claimAutoreleasedReturnValue();
      objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v7);
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      BOOL v14 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v10);
      *(_DWORD *)buf = 134219778;
      uint64_t v26 = v21;
      __int16 v27 = 2048;
      uint64_t v28 = v20;
      __int16 v29 = 2048;
      uint64_t v30 = v6;
      __int16 v31 = 2112;
      id v32 = v12;
      __int16 v33 = 2048;
      uint64_t v34 = v7;
      __int16 v35 = 2112;
      id v36 = v13;
      __int16 v37 = 2048;
      uint64_t v38 = v10;
      __int16 v39 = 2112;
      __int16 v40 = v14;
      _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "new messages number: [%lu] new participant changes number: [%lu] lastAlertedDate: [%lld]-[%@] lastFailedMessageAlertDate: [%lld]-[%@] lastFailedMessageDate: [%lld]-[%@]", buf, 0x52u);
    }
  }
  if (v10 >= v7 || v22 >= v7)
  {
    uint64_t v16 = [(IMDNotificationsController *)self _failedMessageRecordsAfterDateInNanoseconds:v7];
    __int16 v15 = [(IMDNotificationsController *)self _userNotificationsForFailedDeliveryMessageRecords:v16 isCarouselUITriggered:0];
  }
  else
  {
    __int16 v15 = 0;
  }
  uint64_t v17 = [v5 arrayByAddingObjectsFromArray:v23];
  id v18 = [(IMDNotificationsController *)self _userNotificationsForMessageRecords:v17 newerThanDate:v6 isUrgentMessageTrigger:0 isCarouselUITriggered:0];

  if ([v5 count] || objc_msgSend(v15, "count"))
  {
    [(IMDNotificationsController *)self _postUnreadNotificationRequests:v18 failedNotificationRequests:v15];
  }
  else if (![v5 count])
  {
    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "Queuing retraction of all delivered notifications, as we had nothing unread.", buf, 2u);
      }
    }
    v24[0] = MEMORY[0x1E4F143A8];
    v24[1] = 3221225472;
    v24[2] = sub_1AFB6C22C;
    v24[3] = &unk_1E5F8E798;
    v24[4] = self;
    sub_1AFB698F0(v24);
  }
}

- (void)_removeAllDeliveredMessageNotifications
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v2, OS_LOG_TYPE_INFO, "Retracting all unread message notifications", buf, 2u);
    }
  }
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v4 = [(IMDNotificationsController *)self notificationCenter];
  id v5 = [v4 deliveredNotifications];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
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
        id v9 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        uint64_t v10 = [v9 request];
        id v11 = [v10 content];

        id v12 = [v11 categoryIdentifier];
        int v13 = [v12 hasPrefix:@"MessageExtension"];

        if (v13)
        {
          BOOL v14 = [v9 request];
          __int16 v15 = [v14 identifier];
          [v3 addObject:v15];
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v18 objects:v23 count:16];
    }
    while (v6);
  }

  uint64_t v16 = [(IMDNotificationsController *)self notificationCenter];
  [v16 removeDeliveredNotificationsWithIdentifiers:v3];
}

- (id)_failedMessageRecordsAfterDateInNanoseconds:(int64_t)a3
{
  v24[2] = *MEMORY[0x1E4F143B8];
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  id v5 = (void *)IMDMessageRecordCopyNewestFailedOutgoingMessagesToLimitAfterDate(10, a3);
  [v4 addObjectsFromArray:v5];
  uint64_t v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", *MEMORY[0x1E4F6D5C8], MEMORY[0x1E4F1CC38]];
  uint64_t v7 = (void *)MEMORY[0x1E4F28F60];
  uint64_t v8 = *MEMORY[0x1E4F6D590];
  id v9 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)a3);
  uint64_t v10 = [v7 predicateWithFormat:@"%K > %@", v8, v9];

  id v11 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v12 = +[IMDDatabase synchronousDatabase];
  int v13 = (void *)MEMORY[0x1E4F28BA0];
  v24[0] = v6;
  v24[1] = v10;
  BOOL v14 = [MEMORY[0x1E4F1C978] arrayWithObjects:v24 count:2];
  __int16 v15 = [v13 andPredicateWithSubpredicates:v14];
  v21[0] = MEMORY[0x1E4F143A8];
  v21[1] = 3221225472;
  v21[2] = sub_1AFB6C68C;
  v21[3] = &unk_1E5F8E828;
  id v22 = v11;
  id v16 = v4;
  id v23 = v16;
  id v17 = v11;
  [v12 fetchMessageRecordsFilteredUsingPredicate:v15 sortedUsingDescriptors:0 limit:10 completionHandler:v21];

  long long v18 = v23;
  id v19 = v16;

  return v19;
}

- (void)_postUnreadNotificationRequests:(id)a3 failedNotificationRequests:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  v10[0] = MEMORY[0x1E4F143A8];
  v10[1] = 3221225472;
  v10[2] = sub_1AFB6C8BC;
  v10[3] = &unk_1E5F8E850;
  id v11 = v6;
  id v12 = v7;
  int v13 = self;
  id v8 = v7;
  id v9 = v6;
  sub_1AFB698F0(v10);
}

- (void)_postUrgentNotificationRequests:(id)a3
{
  id v4 = a3;
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1AFB6C9E4;
  v6[3] = &unk_1E5F8D508;
  v6[4] = self;
  id v7 = v4;
  id v5 = v4;
  sub_1AFB698F0(v6);
}

- (void)_postNotificationRequests:(id)a3 isMostActiveDevice:(BOOL)a4
{
  id v6 = a3;
  v8[0] = MEMORY[0x1E4F143A8];
  v8[1] = 3221225472;
  v8[2] = sub_1AFB6CAC0;
  v8[3] = &unk_1E5F8E878;
  v8[4] = self;
  id v9 = v6;
  BOOL v10 = a4;
  id v7 = v6;
  sub_1AFB698F0(v8);
}

- (void)__postNotificationRequests:(id)a3 isMostActiveDevice:(BOOL)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(IMDNotificationsController *)self notificationCenter];
  id v8 = [v7 deliveredNotifications];

  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id obj = v6;
  uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v29;
    long long v21 = v25;
    do
    {
      uint64_t v11 = 0;
      do
      {
        if (*(void *)v29 != v10) {
          objc_enumerationMutation(obj);
        }
        id v12 = *(id *)(*((void *)&v28 + 1) + 8 * v11);
        if (!a4)
        {
          uint64_t v13 = -[IMDNotificationsController _requestForNonMostActiveDeviceRequest:](self, "_requestForNonMostActiveDeviceRequest:", v12, v21);

          id v12 = (id)v13;
        }
        if (-[IMDNotificationsController _shouldPostNotificationRequest:withCurrentlyPostedNotifications:](self, "_shouldPostNotificationRequest:withCurrentlyPostedNotifications:", v12, v8, v21))
        {
          dispatch_semaphore_t v14 = dispatch_semaphore_create(0);
          __int16 v15 = [(IMDNotificationsController *)self notificationCenter];
          v24[0] = MEMORY[0x1E4F143A8];
          v24[1] = 3221225472;
          v25[0] = sub_1AFB6CDA8;
          v25[1] = &unk_1E5F8E8A0;
          id v16 = v12;
          id v26 = v16;
          id v17 = v14;
          __int16 v27 = v17;
          [v15 addNotificationRequest:v16 withCompletionHandler:v24];

          dispatch_time_t v18 = dispatch_time(0, 3000000000);
          if (dispatch_semaphore_wait(v17, v18) && IMOSLoggingEnabled())
          {
            id v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "timeout waiting for completionHandler from UNNotificationCenter", buf, 2u);
            }
          }
        }

        ++v11;
      }
      while (v9 != v11);
      uint64_t v9 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    }
    while (v9);
  }

  long long v20 = [(IMDNotificationsController *)self notificationCenter];
  [v20 getNotificationSettingsWithCompletionHandler:&unk_1F084D298];
}

- (id)_requestForNonMostActiveDeviceRequest:(id)a3
{
  id v3 = a3;
  id v4 = [v3 content];
  id v5 = (void *)[v4 mutableCopy];

  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Coordinated Alerts -- this is not the most active device, suppressing the screen from lighting up and not playing sound for message", buf, 2u);
    }
  }
  [v5 setShouldIgnoreDoNotDisturb:0];
  [v5 setShouldSuppressScreenLightUp:1];
  [v5 setSound:0];
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v17 = 0;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Coordinated Alerts -- this is not the most active device, suppressing spoken messages", v17, 2u);
    }
  }
  if ([v5 interruptionLevel] == 3)
  {
    [v5 setShouldSuppressScreenLightUp:0];
    uint64_t v8 = [v5 sound];
    if (!v8
      || (uint64_t v9 = (void *)v8,
          [v5 sound],
          uint64_t v10 = objc_claimAutoreleasedReturnValue(),
          uint64_t v11 = [v10 alertType],
          v10,
          v9,
          v11 == 2))
    {
      id v12 = [MEMORY[0x1E4F44640] defaultCriticalSound];
      [v5 setSound:v12];
    }
  }
  uint64_t v13 = (void *)MEMORY[0x1E4F44628];
  dispatch_semaphore_t v14 = [v3 identifier];
  __int16 v15 = [v13 requestWithIdentifier:v14 content:v5 trigger:0 destinations:15];

  return v15;
}

- (void)postNotificationsWithContext:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Post notifications called from client with context %@", (uint8_t *)&v9, 0xCu);
    }
  }
  if ([(IMDNotificationsController *)self _haveMigrated])
  {
    id v6 = [v4 objectForKeyedSubscript:@"IMActiveAccountAliasesKey"];
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v7 = [MEMORY[0x1E4F1CAD0] setWithArray:v6];
      [(IMDNotificationsController *)self setActiveAccountAliases:v7];
    }
    [(IMDNotificationsController *)self __postNotifications];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      LOWORD(v9) = 0;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "We don't post notifications during system migration", (uint8_t *)&v9, 2u);
    }
  }
}

- (void)retractNotificationsForReadMessages:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Withdrawing message notifications for message guids %@", buf, 0xCu);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFB6D4F4;
  v7[3] = &unk_1E5F8D508;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_1AFB698F0(v7);
}

- (void)repostNotificationsFromFirstUnlockWithContext:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Retract and re-post iMessage notifications sent before first unlock", buf, 2u);
    }
  }
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1AFB6D718;
  v7[3] = &unk_1E5F8D508;
  v7[4] = self;
  id v8 = v4;
  id v6 = v4;
  sub_1AFB698F0(v7);
}

- (void)postUrgentNotificationForMessages:(id)a3 withContext:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  CFArrayRef v6 = (const __CFArray *)a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      CFArrayRef v12 = v6;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "We need to post these urgent message requests %@ with context %@", (uint8_t *)&v11, 0x16u);
    }
  }
  CFArrayRef v9 = IMDMessageRecordCopyMessagesForGUIDs(v6);
  id v10 = [(IMDNotificationsController *)self _userNotificationsForMessageRecords:v9 newerThanDate:[(IMDNotificationsController *)self lastAlertedMessageDate] isUrgentMessageTrigger:1 isCarouselUITriggered:0];
  [(IMDNotificationsController *)self _postUrgentNotificationRequests:v10];
}

- (void)updatePostedNotificationsForMessages:(id)a3 withContext:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  CFArrayRef v24 = (const __CFArray *)a3;
  id v23 = a4;
  if (IMOSLoggingEnabled())
  {
    CFArrayRef v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFArrayRef v36 = v24;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Updating posted notifications for messages %@", buf, 0xCu);
    }
  }
  CFArrayRef v7 = IMDMessageRecordCopyMessagesForGUIDs(v24);
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v25 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  CFArrayRef v9 = v7;
  uint64_t v10 = [(__CFArray *)v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v31;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v31 != v11) {
          objc_enumerationMutation(v9);
        }
        __int16 v13 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        char v29 = 0;
        id v14 = [(IMDNotificationsController *)self _generateNotificationRequestForMessageRecord:v13 isUrgentMessageTrigger:0 isCarouselUITriggered:0 shouldAdvanceLastAlertedMessageDate:&v29];
        uint64_t v15 = v14;
        if (v14)
        {
          CFArrayRef v16 = [v14 identifier];
          if (IMOSLoggingEnabled())
          {
            id v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              CFArrayRef v36 = v16;
              _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "Generated an updated notification request for notification: %@", buf, 0xCu);
            }
          }
          dispatch_time_t v18 = [v15 content];
          if ([(__CFArray *)v16 length]) {
            BOOL v19 = v18 == 0;
          }
          else {
            BOOL v19 = 1;
          }
          if (!v19) {
            [v8 setObject:v18 forKeyedSubscript:v16];
          }
        }
        else
        {
          CFArrayRef v16 = [v13 guid];
          if (IMOSLoggingEnabled())
          {
            long long v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              CFArrayRef v36 = v16;
              _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "Could not generate an updated notification request for edited message, message may have been retracted. Retracting outstanding notifications for messageGUID: %@", buf, 0xCu);
            }
          }
          if ([(__CFArray *)v16 length]) {
            [v25 addObject:v16];
          }
        }
      }
      uint64_t v10 = [(__CFArray *)v9 countByEnumeratingWithState:&v30 objects:v34 count:16];
    }
    while (v10);
  }

  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1AFB6DCF8;
  void v26[3] = &unk_1E5F8E850;
  v26[4] = self;
  id v27 = v8;
  id v28 = v25;
  id v21 = v25;
  id v22 = v8;
  sub_1AFB698F0(v26);
}

- (void)postFirstUnlockMessage:(id)a3 forIdentifier:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    id v8 = IMSharedUtilitiesFrameworkBundle();
    CFArrayRef v9 = [v8 localizedStringForKey:@"MADRID_MESSAGE" value:&stru_1F084E970 table:@"IMSharedUtilities"];

    id v10 = objc_alloc_init(MEMORY[0x1E4F445B0]);
    [v10 setTitle:v7];
    [v10 setBody:v9];
    [v10 setCategoryIdentifier:@"MessageExtension-Madrid"];
    [v10 setThreadIdentifier:v7];
    uint64_t v11 = [v10 userInfo];
    Mutable = (__CFDictionary *)[v11 mutableCopy];

    if (!Mutable) {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    CFDictionarySetValue(Mutable, @"CKBBContextKeyMessageGUID", v6);
    CFDictionarySetValue(Mutable, @"CKBBContextKeyIsFirstUnlock", MEMORY[0x1E4F1CC38]);
    [v10 setUserInfo:Mutable];
    __int16 v13 = [MEMORY[0x1E4F44670] triggerWithTimeInterval:0 repeats:0.1];
    id v14 = [MEMORY[0x1E4F44628] requestWithIdentifier:v6 content:v10 trigger:v13];
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v23 = v14;
        __int16 v24 = 2112;
        id v25 = v10;
        _os_log_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_INFO, "adding notification request under first unlock %@ with content %@", buf, 0x16u);
      }
    }
    v19[0] = MEMORY[0x1E4F143A8];
    v19[1] = 3221225472;
    v19[2] = sub_1AFB6E380;
    v19[3] = &unk_1E5F8E850;
    v19[4] = self;
    long long v20 = v14;
    id v21 = v10;
    id v16 = v10;
    id v17 = v14;
    sub_1AFB698F0(v19);
  }
  else if (IMOSLoggingEnabled())
  {
    dispatch_time_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      id v23 = "-[IMDNotificationsController postFirstUnlockMessage:forIdentifier:]";
      _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "IMDNotificationsController - %s asked to post notification with nil messageGUID", buf, 0xCu);
    }
  }
}

- (void)postSharePlayNotificationForChatGUID:(id)a3 faceTimeConversationUUID:(id)a4 handleIdentifier:(id)a5 localizedApplicationName:(id)a6
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v10 = (__CFString *)a3;
  uint64_t v11 = (__CFString *)a4;
  CFArrayRef v12 = (__CFString *)a5;
  v50 = (__CFString *)a6;
  int v13 = IMOSLoggingEnabled();
  v49 = v11;
  if (v10 && v11 && v12)
  {
    v47 = self;
    if (v13)
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int buf = 138412802;
        v59 = v10;
        __int16 v60 = 2112;
        v61 = v12;
        __int16 v62 = 2112;
        v63 = v50;
        _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "Posting SharePlay notification for chat GUID %@ and handle identifier %@ with app name %@", (uint8_t *)&buf, 0x20u);
      }
    }
    uint64_t v15 = (__CFString *)IMDChatRecordCopyChatForGUID(v10);
    v48 = v15;
    if (!v15)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          int buf = 138412290;
          v59 = v10;
          _os_log_impl(&dword_1AFB53000, v34, OS_LOG_TYPE_INFO, "No chat record for guid: %@", (uint8_t *)&buf, 0xCu);
        }
      }
      goto LABEL_47;
    }
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v16 = [(__CFString *)v15 handleRecords];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v57 count:16];
    if (v17)
    {
      dispatch_time_t v18 = 0;
      uint64_t v19 = *(void *)v53;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v53 != v19) {
            objc_enumerationMutation(v16);
          }
          id v21 = *(void **)(*((void *)&v52 + 1) + 8 * i);
          id v22 = [v21 canonicalizedURIString];
          int v23 = [v22 isEqualToString:v12];

          if (v23)
          {
            id v24 = v21;

            dispatch_time_t v18 = v24;
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v52 objects:v57 count:16];
      }
      while (v17);

      if (v18)
      {
        id v25 = [MEMORY[0x1E4F1C9C8] date];
        uint64_t v26 = objc_msgSend(v25, "__im_nanosecondTimeInterval");

        id v27 = [MEMORY[0x1E4F1CA60] dictionary];
        id v28 = [NSString stringWithFormat:@"%@-%@", v10, v49];
        [v27 setObject:v28 forKeyedSubscript:@"__kmessageGUIDKey"];

        [v27 setObject:v18 forKeyedSubscript:@"__kmessageHandleKey"];
        if (v50)
        {
          char v29 = NSString;
          long long v30 = IMSharedUtilitiesFrameworkBundle();
          long long v31 = [v30 localizedStringForKey:@"SharePlay “%@” Together" value:&stru_1F084E970 table:@"IMSharedUtilities"];
          long long v32 = objc_msgSend(v29, "localizedStringWithFormat:", v31, v50);
          [v27 setObject:v32 forKeyedSubscript:@"__kmessageTextKey"];
        }
        else
        {
          long long v30 = IMSharedUtilitiesFrameworkBundle();
          long long v31 = [v30 localizedStringForKey:@"SharePlay Together" value:&stru_1F084E970 table:@"IMSharedUtilities"];
          [v27 setObject:v31 forKeyedSubscript:@"__kmessageTextKey"];
        }

        CFArrayRef v36 = [NSNumber numberWithLongLong:v26];
        [v27 setObject:v36 forKeyedSubscript:@"__kmessageDateKey"];

        uint64_t v37 = [NSNumber numberWithLongLong:v26];
        [v27 setObject:v37 forKeyedSubscript:@"__kmessageDateDeliveredKey"];

        [(IMDNotificationsController *)v47 _setContactInMessageDictionary:v18 messageDictionary:v27];
        uint64_t v38 = [(IMDNotificationsController *)v47 _chatDictionaryForChatRecord:v48];
        char v51 = 1;
        __int16 v39 = [(IMDNotificationsController *)v47 _generateNotificationRequestForMessageRecord:0 messageDictionary:v27 chatDictionary:v38 isUrgentMessageTrigger:0 isCarouselUITriggered:0 shouldAdvanceLastAlertedMessageDate:&v51];
        int v40 = IMOSLoggingEnabled();
        if (v39)
        {
          if (v40)
          {
            uint64_t v41 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              __int16 v42 = [v39 identifier];
              v46 = [v39 content];
              v43 = [v46 categoryIdentifier];
              int buf = 138412546;
              v59 = v42;
              __int16 v60 = 2112;
              v61 = v43;
              _os_log_impl(&dword_1AFB53000, v41, OS_LOG_TYPE_INFO, "Generated notification request for identifier %@ with category identifier %@", (uint8_t *)&buf, 0x16u);
            }
          }
          v56 = v39;
          uint64_t v44 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v56 count:1];
          [(IMDNotificationsController *)v47 _postNotificationRequests:v44 isMostActiveDevice:1];

          if (v51) {
            [(IMDNotificationsController *)v47 advanceLastAlertedMessageDate:v26];
          }
        }
        else if (v40)
        {
          v45 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
          {
            int buf = 138412546;
            v59 = v10;
            __int16 v60 = 2112;
            v61 = v12;
            _os_log_impl(&dword_1AFB53000, v45, OS_LOG_TYPE_INFO, "Failed to generate SharePlay notification request for chat GUID %@ and handle identifier %@", (uint8_t *)&buf, 0x16u);
          }
        }
LABEL_47:

        goto LABEL_48;
      }
    }
    else
    {
    }
    if (IMOSLoggingEnabled())
    {
      __int16 v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        int buf = 138412290;
        v59 = v12;
        _os_log_impl(&dword_1AFB53000, v35, OS_LOG_TYPE_INFO, "No handle record for identifier: %@", (uint8_t *)&buf, 0xCu);
      }
    }
    goto LABEL_47;
  }
  if (v13)
  {
    long long v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      int buf = 138412802;
      v59 = v10;
      __int16 v60 = 2112;
      v61 = v11;
      __int16 v62 = 2112;
      v63 = v12;
      _os_log_impl(&dword_1AFB53000, v33, OS_LOG_TYPE_INFO, "Not posting SharePlay notification because chatGUID (%@), faceTimeConversationUUID (%@), or handleIdentifier (%@) were missing.", (uint8_t *)&buf, 0x20u);
    }
  }
LABEL_48:
}

- (BOOL)_isRaiseGestureEnabled
{
  v2 = [(IMDNotificationsController *)self defaultsSharedInstance];
  id v3 = [v2 getValueFromDomain:@"com.apple.MobileSMS" forKey:@"RaiseToListenEnabled"];

  if (v3)
  {
    char v4 = [v3 BOOLValue];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "We have never set the raise to listen default, marking it as enabled", v7, 2u);
      }
    }
    char v4 = 1;
  }

  return v4;
}

- (void)_populateBasicNotificationIdentifyingContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5 isCarouselUITriggered:(BOOL)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  CFArrayRef v12 = [v11 objectForKey:@"__kmessageDateKey"];
  uint64_t v13 = [v12 longLongValue];

  uint64_t v41 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v13);
  [v9 setDate:v41];
  id v14 = [v10 objectForKey:@"__kchatChatIdentifierKey"];
  uint64_t v15 = [v11 objectForKey:@"__kmessageServiceKey"];
  int v16 = [v15 isEqualToString:*MEMORY[0x1E4F6E1A0]];

  uint64_t v17 = [v11 objectForKey:@"__kmessageServiceKey"];
  char v18 = [v17 isEqualToString:*MEMORY[0x1E4F6E198]];

  BOOL v19 = [(IMDNotificationsController *)self _messageIsBusiness:v11];
  BOOL v20 = v19;
  id v21 = 0;
  char v22 = v16 | v18;
  if ((v22 & 1) == 0 && !v19)
  {
    if ([(IMDNotificationsController *)self _amIMentionedInMessage:v11])
    {
      id v21 = [v11 objectForKey:@"__kmessageGUIDKey"];
    }
    else
    {
      id v21 = 0;
    }
  }
  int v40 = objc_msgSend(MEMORY[0x1E4F1CB10], "__im_URLForChatIdentifier:entryBody:messageGUID:", v14, 0, v21);
  int v23 = [v11 objectForKey:@"__kmessageFlagsKey"];
  __int16 v39 = v10;
  int v24 = [v23 unsignedLongLongValue];

  if ((v24 & 0x200000) == 0)
  {
    [v9 setDefaultActionURL:v40];
LABEL_14:
    uint64_t v26 = v39;
    id v28 = [v39 objectForKey:@"__kchatStyleKey"];
    uint64_t v29 = [v28 longLongValue];

    if (v22)
    {
      if (v16) {
        long long v30 = @"MessageExtension-SMS";
      }
      else {
        long long v30 = @"MessageExtension-RCS";
      }
      [v9 setCategoryIdentifier:v30];
      if (MEMORY[0x1B3E89A20](v14))
      {
        if (IMOSLoggingEnabled())
        {
          long long v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)int buf = 0;
            _os_log_impl(&dword_1AFB53000, v31, OS_LOG_TYPE_INFO, "Do not relay notification", buf, 2u);
          }
        }
        [v9 setCategoryIdentifier:@"MessageExtension-NoRelay"];
      }
    }
    else
    {
      if (v20)
      {
        long long v32 = @"MessageExtension-MadridBusiness";
      }
      else if (v29 == 43)
      {
        long long v32 = @"MessageExtension-MadridGroup";
      }
      else
      {
        long long v32 = @"MessageExtension-Madrid";
      }
      [v9 setCategoryIdentifier:v32];
    }
    if (IMOSLoggingEnabled())
    {
      long long v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_1AFB53000, v33, OS_LOG_TYPE_INFO, "This was not an audio message", buf, 2u);
      }
    }
    goto LABEL_34;
  }
  BOOL v25 = [(IMDNotificationsController *)self _isRaiseGestureEnabled];
  [v9 setDefaultActionURL:v40];
  if (!v25) {
    goto LABEL_14;
  }
  uint64_t v26 = v39;
  if (IMOSLoggingEnabled())
  {
    id v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1AFB53000, v27, OS_LOG_TYPE_INFO, "We got an audio message and raise to listen is enabled setting audio notification category", buf, 2u);
    }
  }
  [v9 setCategoryIdentifier:@"MessageExtension-AudioRaise"];
LABEL_34:
  if ([v14 length])
  {
    [v9 setThreadIdentifier:v14];
  }
  else
  {
    uint64_t v34 = IMLogHandleForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_1AFC639C0();
    }
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      id v36 = [v9 date];
      id v37 = [v9 categoryIdentifier];
      uint64_t v38 = [v9 threadIdentifier];
      *(_DWORD *)int buf = 138412802;
      id v43 = v36;
      __int16 v44 = 2112;
      id v45 = v37;
      __int16 v46 = 2112;
      v47 = v38;
      _os_log_impl(&dword_1AFB53000, v35, OS_LOG_TYPE_INFO, "Setting the date %@ category identifier %@ thread identifier %@", buf, 0x20u);
    }
  }
}

- (void)_populateBodyForNotificationContent:(id)a3 messageDictionary:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 objectForKey:@"__kmessageAttributedBodyKey"];
  id v8 = objc_msgSend(v7, "__im_richCardsPreviewText");
  if (!v8)
  {
    id v9 = objc_msgSend(v7, "__im_suggestedReplyPreviewText");
    if (v9)
    {
      [v5 setBody:v9];
LABEL_18:

      goto LABEL_19;
    }
    BOOL v25 = [v6 objectForKey:@"__kmessageExpressiveSendStyleIDKey"];
    if ([v25 isEqualToString:*MEMORY[0x1E4F6D4E0]])
    {
      id v10 = NSString;
      id v11 = IMSharedUtilitiesFrameworkBundle();
      CFArrayRef v12 = [v11 localizedStringForKey:@"Message sent with Invisible Ink" value:&stru_1F084E970 table:@"IMSharedUtilities"];
      uint64_t v13 = [v10 localizedStringWithFormat:v12];

      uint64_t v14 = *MEMORY[0x1E4F6C110];
      uint64_t v15 = *MEMORY[0x1E4F6C130];
    }
    else
    {
      uint64_t v13 = [v6 objectForKey:@"__kmessageTextKey"];
      if (![v13 length])
      {
        char v22 = [v6 objectForKey:@"__kmessageGUIDKey"];
        if (v22)
        {
          if (IMOSLoggingEnabled())
          {
            int v23 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)int buf = 138412290;
              id v27 = v22;
              _os_log_impl(&dword_1AFB53000, v23, OS_LOG_TYPE_INFO, "We don't have a message body for message guid %@", buf, 0xCu);
            }
          }
        }
        else
        {
          int v24 = IMLogHandleForCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
            sub_1AFC63A28();
          }
        }
        goto LABEL_17;
      }
      id v19 = objc_alloc_init(MEMORY[0x1E4F28E58]);
      uint64_t v14 = *MEMORY[0x1E4F6C110];
      [v19 addCharactersInString:*MEMORY[0x1E4F6C110]];
      uint64_t v15 = *MEMORY[0x1E4F6C130];
      [v19 addCharactersInString:*MEMORY[0x1E4F6C130]];
      if (![v13 length])
      {
LABEL_14:
        uint64_t v20 = 0;
        goto LABEL_15;
      }
      uint64_t v21 = 0;
      while ((objc_msgSend(v19, "characterIsMember:", objc_msgSend(v13, "characterAtIndex:", v21)) & 1) != 0)
      {
        if (++v21 >= (unint64_t)[v13 length]) {
          goto LABEL_14;
        }
      }
    }
    int v16 = [v13 stringByReplacingOccurrencesOfString:v14 withString:@" "];
    uint64_t v17 = [v16 stringByReplacingOccurrencesOfString:v15 withString:&stru_1F084E970];
    char v18 = [v17 stringByReplacingOccurrencesOfString:*MEMORY[0x1E4F6CE60] withString:&stru_1F084E970];
    id v19 = [v18 stringByReplacingOccurrencesOfString:*MEMORY[0x1E4F6DF68] withString:&stru_1F084E970];

    if ((unint64_t)[v19 length] < 0x3E9)
    {
LABEL_16:
      [v5 setBody:v19];

LABEL_17:
      goto LABEL_18;
    }
    uint64_t v20 = [v19 substringToIndex:1000];
LABEL_15:

    id v19 = (id)v20;
    goto LABEL_16;
  }
  [v5 setBody:v8];
LABEL_19:
}

- (void)_populateSubtitleForNotificationContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5
{
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v55 = a3;
  id v57 = a4;
  id v58 = a5;
  __int16 v60 = [v58 objectForKey:@"__kmessageHandleKey"];
  v56 = [(id)objc_opt_class() _addressForHandle:v60];
  if (v56 && (MEMORY[0x1B3E899E0]() & 1) != 0)
  {
    long long v53 = 0;
    char v7 = 0;
  }
  else
  {
    long long v53 = [v57 objectForKeyedSubscript:@"__kchatGroupNameKey"];
    char v7 = 1;
  }
  long long v54 = [v57 objectForKeyedSubscript:@"__kchatHandlesForChatKey"];
  id v8 = v53;
  if (![v53 length] && objc_msgSend(v54, "count"))
  {
    int v23 = [v57 objectForKeyedSubscript:@"__kchatStyleKey"];
    uint64_t v24 = [v23 longLongValue];

    char v25 = v7 ^ 1;
    if (v24 == 45) {
      char v25 = 1;
    }
    if (v25)
    {
      id v8 = v53;
    }
    else
    {
      uint64_t v26 = [MEMORY[0x1E4F1CA48] array];
      long long v67 = 0u;
      long long v68 = 0u;
      long long v65 = 0u;
      long long v66 = 0u;
      id v27 = v54;
      uint64_t v28 = [v27 countByEnumeratingWithState:&v65 objects:v72 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v66;
        do
        {
          for (uint64_t i = 0; i != v28; ++i)
          {
            if (*(void *)v66 != v29) {
              objc_enumerationMutation(v27);
            }
            long long v31 = *(void **)(*((void *)&v65 + 1) + 8 * i);
            uint64_t v32 = [v31 rowID];
            if (v32 != [v60 rowID])
            {
              long long v33 = [(IMDNotificationsController *)self _displayNameForHandle:v31 andContact:0];
              if (v33)
              {
                [v26 addObject:v33];
              }
              else if (IMOSLoggingEnabled())
              {
                uint64_t v34 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  __int16 v35 = [v58 objectForKeyedSubscript:@"__kmessageGUIDKey"];
                  *(_DWORD *)int buf = 138412290;
                  v71 = v35;
                  _os_log_impl(&dword_1AFB53000, v34, OS_LOG_TYPE_INFO, "Unable to create formatted display string for other recipient handle from messageGUID %@", buf, 0xCu);
                }
              }
            }
          }
          uint64_t v28 = [v27 countByEnumeratingWithState:&v65 objects:v72 count:16];
        }
        while (v28);
      }

      id v36 = IMSharedUtilitiesFrameworkBundle();
      id v8 = [v36 localizedStringForKey:@"PARTICIPANT_ADDRESS_TO_YOU_ITEM" value:&stru_1F084E970 table:@"IMSharedUtilities"];

      long long v63 = 0u;
      long long v64 = 0u;
      long long v61 = 0u;
      long long v62 = 0u;
      id v37 = v26;
      uint64_t v38 = [v37 countByEnumeratingWithState:&v61 objects:v69 count:16];
      if (v38)
      {
        uint64_t v39 = 0;
        uint64_t v40 = *(void *)v62;
        do
        {
          uint64_t v41 = 0;
          __int16 v42 = v8;
          do
          {
            if (*(void *)v62 != v40) {
              objc_enumerationMutation(v37);
            }
            uint64_t v43 = *(void *)(*((void *)&v61 + 1) + 8 * v41);
            BOOL v44 = v39 + v41 == [v37 count] - 1;
            id v45 = NSString;
            __int16 v46 = IMSharedUtilitiesFrameworkBundle();
            v47 = v46;
            if (v44) {
              uint64_t v48 = @"PARTICIPANT_ADDRESS_FINAL_ITEM";
            }
            else {
              uint64_t v48 = @"PARTICIPANT_ADDRESS_NON_FINAL_ITEM";
            }
            v49 = [v46 localizedStringForKey:v48 value:&stru_1F084E970 table:@"IMSharedUtilities"];
            v50 = objc_msgSend(v45, "localizedStringWithFormat:", v49, v43);
            id v8 = [v42 stringByAppendingString:v50];

            ++v41;
            __int16 v42 = v8;
          }
          while (v38 != v41);
          v39 += v38;
          uint64_t v38 = [v37 countByEnumeratingWithState:&v61 objects:v69 count:16];
        }
        while (v38);
      }
    }
  }
  id v9 = [v58 objectForKeyedSubscript:@"__kmessageThreadOriginatorKey"];
  id v10 = [v58 objectForKey:@"__kmessageServiceKey"];
  int v11 = [v10 isEqualToString:*MEMORY[0x1E4F6E1A0]];

  BOOL v12 = [(IMDNotificationsController *)self _amIMentionedInMessage:v58];
  if (![v8 length]) {
    goto LABEL_14;
  }
  if (((v11 | !v12) & 1) == 0)
  {
    char v51 = NSString;
    uint64_t v13 = IMSharedUtilitiesFrameworkBundle();
    uint64_t v17 = [v13 localizedStringForKey:@"GROUP_MENTION_RECEIVED_TITLE" value:&stru_1F084E970 table:@"IMSharedUtilities"];
    char v22 = objc_msgSend(v51, "localizedStringWithFormat:", v17, v8);
LABEL_51:

    goto LABEL_52;
  }
  if (!v9)
  {
LABEL_14:
    char v22 = v8;
    goto LABEL_53;
  }
  uint64_t v13 = [v9 objectForKey:@"__kmessageHandleKey"];
  uint64_t v14 = [v9 objectForKey:@"__kmessageFlagsKey"];
  char v15 = [v14 unsignedLongLongValue];

  if (v13) {
    BOOL v16 = (v15 & 4) == 0;
  }
  else {
    BOOL v16 = 0;
  }
  if (v16)
  {
    uint64_t v17 = [v9 objectForKey:@"__kmessageCNContactForSenderKey"];
    uint64_t v18 = [(IMDNotificationsController *)self _displayNameForHandle:v13 andContact:v17];
    id v19 = NSString;
    uint64_t v20 = IMSharedUtilitiesFrameworkBundle();
    uint64_t v21 = [v20 localizedStringForKey:@"GROUP_REPLY_RECEIVED_TITLE" value:&stru_1F084E970 table:@"IMSharedUtilities"];
    char v22 = objc_msgSend(v19, "localizedStringWithFormat:", v21, v18, v8);

LABEL_50:
    id v8 = (void *)v18;
    goto LABEL_51;
  }
  if ((v15 & 4) != 0)
  {
    long long v52 = NSString;
    uint64_t v17 = IMSharedUtilitiesFrameworkBundle();
    uint64_t v18 = [v17 localizedStringForKey:@"GROUP_REPLY_RECEIVED_TO_YOU_TITLE" value:&stru_1F084E970 table:@"IMSharedUtilities"];
    char v22 = objc_msgSend(v52, "localizedStringWithFormat:", v18, v8);
    uint64_t v20 = v8;
    goto LABEL_50;
  }
  char v22 = v8;
LABEL_52:

LABEL_53:
  if ([v22 length]) {
    [v55 setSubtitle:v22];
  }
}

- (void)_populateBodyAndTitleForSendReceivedAsJunkNotificationContent:(id)a3 messageDictionary:(id)a4
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = IMSharedUtilitiesFrameworkBundle();
  id v9 = [v8 localizedStringForKey:@"MESSAGE_SEND_RECEIVED_AS_JUNK_DEFAULT" value:&stru_1F084E970 table:@"IMSharedUtilities"];

  id v10 = IMSharedUtilitiesFrameworkBundle();
  int v11 = [v10 localizedStringForKey:@"MESSAGE_SEND_RECEIVED_AS_JUNK_BODY_DEFAULT" value:&stru_1F084E970 table:@"IMSharedUtilities"];

  BOOL v12 = [v6 userInfo];
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v12 mutableCopy];

  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  uint64_t v14 = [v7 objectForKeyedSubscript:@"__kmessageHandleKey"];
  if (v14)
  {
    char v15 = [v7 objectForKey:@"__kmessageCNContactForSenderKey"];
    BOOL v16 = [(IMDNotificationsController *)self _displayNameForHandle:v14 andContact:v15];

    if (v16)
    {
      uint64_t v17 = NSString;
      uint64_t v18 = IMSharedUtilitiesFrameworkBundle();
      id v19 = [v18 localizedStringForKey:@"MESSAGE_SEND_TO_%@_RECEIVED_AS_JUNK" value:&stru_1F084E970 table:@"IMSharedUtilities"];
      uint64_t v20 = objc_msgSend(v17, "localizedStringWithFormat:", v19, v16);

      [(__CFDictionary *)Mutable setObject:v16 forKey:@"CKBBContextKeySenderName"];
      id v9 = (void *)v20;
    }
  }
  uint64_t v21 = [v7 objectForKeyedSubscript:@"__kmessageDestinationCallerIDKey"];
  if (!v21)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_20;
    }
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1AFB53000, v26, OS_LOG_TYPE_INFO, "Sender (self) ID not found (senderID is NULL). Displaying default summary for received-as-junk notification", buf, 2u);
    }
LABEL_19:

    goto LABEL_20;
  }
  if (!IMStringIsEmail())
  {
    if (MEMORY[0x1B3E89A10](v21))
    {
      long long v31 = IMFormattedDisplayStringForNumber();
      id v27 = NSString;
      uint64_t v28 = IMSharedUtilitiesFrameworkBundle();
      uint64_t v29 = [v28 localizedStringForKey:@"MESSAGE_SEND_RECEIVED_AS_JUNK_BODY_PHONE_NUMBER_%@" value:&stru_1F084E970 table:@"IMSharedUtilities"];
      uint64_t v30 = objc_msgSend(v27, "localizedStringWithFormat:", v29, v31);

      int v11 = (void *)v30;
      goto LABEL_20;
    }
    if (!IMOSLoggingEnabled()) {
      goto LABEL_20;
    }
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      long long v33 = v21;
      _os_log_impl(&dword_1AFB53000, v26, OS_LOG_TYPE_INFO, "Sender (self) ID \"%@\" type not identified as email or phone number. Displaying default summary for received-as-junk notification", buf, 0xCu);
    }
    goto LABEL_19;
  }
  char v22 = NSString;
  int v23 = IMSharedUtilitiesFrameworkBundle();
  uint64_t v24 = [v23 localizedStringForKey:@"MESSAGE_SEND_RECEIVED_AS_JUNK_BODY_EMAIL_ADDRESS_%@" value:&stru_1F084E970 table:@"IMSharedUtilities"];
  uint64_t v25 = objc_msgSend(v22, "localizedStringWithFormat:", v24, v21);

  int v11 = (void *)v25;
LABEL_20:
  [v6 setTitle:v9];
  [v6 setBody:v11];
  [(__CFDictionary *)Mutable setObject:MEMORY[0x1E4F1CC38] forKey:@"CKBBContextKeyIsFailedMessage"];
  [v6 setUserInfo:Mutable];
}

- (BOOL)_contentBodyHasLocationURL:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"__kmessageAttributedBodyKey"];
  char v4 = objc_msgSend(v3, "__im_dataDetectedURLsFromAttributes");
  if (![v4 count])
  {
LABEL_10:
    BOOL v16 = 0;
    goto LABEL_11;
  }
  uint64_t v5 = 0;
  while (1)
  {
    id v6 = [v4 objectAtIndex:v5];
    id v7 = [v6 scheme];
    id v8 = [v7 lowercaseString];
    id v9 = [v8 trimmedString];
    int v10 = [v9 isEqualToString:@"http"];

    int v11 = [MEMORY[0x1E4F6E818] locationInfoFromURL:v6];
    BOOL v12 = v11;
    if (!v10) {
      goto LABEL_8;
    }
    uint64_t v13 = [v11 location];
    if (!v13)
    {

LABEL_8:
      goto LABEL_9;
    }
    uint64_t v14 = [v12 address];

    if (!v14) {
      break;
    }
LABEL_9:
    if (++v5 >= (unint64_t)[v4 count]) {
      goto LABEL_10;
    }
  }
  BOOL v16 = 1;
LABEL_11:

  return v16;
}

- (void)_populateNotificationContentForTranscriptSharing:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5
{
  uint64_t v69 = *MEMORY[0x1E4F143B8];
  id v57 = a3;
  id v56 = a4;
  id v55 = a5;
  id v8 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LODWORD(a4) = [v8 isTranscriptSharingEnabled];

  if (!a4) {
    goto LABEL_32;
  }
  id v9 = (void *)MEMORY[0x1E4F6E9A0];
  int v10 = [v56 objectForKey:@"__kchatEmergencyUserInfo"];
  id v58 = [v9 infoFromDictionary:v10 isStewieTranscriptSharingMessage:0];

  if (!v58) {
    goto LABEL_32;
  }
  int v11 = [v55 objectForKey:@"__kmessageIsInitialTranscriptSharingItem"];
  int v51 = [v11 BOOLValue];

  long long v54 = [v55 objectForKey:@"__kmessageHandleKey"];
  long long v53 = [(id)objc_opt_class() _addressForHandle:v54];
  uint64_t v12 = *MEMORY[0x1E4F6D2C0];
  int v52 = [v53 hasSuffix:*MEMORY[0x1E4F6D2C0]];
  [v56 objectForKeyedSubscript:@"__kchatHandlesForChatKey"];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v13 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
  if (!v13)
  {
    __int16 v60 = 0;
    long long v61 = 0;
    goto LABEL_25;
  }
  __int16 v60 = 0;
  long long v61 = 0;
  uint64_t v14 = *(void *)v63;
  do
  {
    for (uint64_t i = 0; i != v13; ++i)
    {
      if (*(void *)v63 != v14) {
        objc_enumerationMutation(obj);
      }
      BOOL v16 = *(void **)(*((void *)&v62 + 1) + 8 * i);
      uint64_t v17 = [(id)objc_opt_class() _addressForHandle:v16];
      uint64_t v18 = _IMDCoreSpotlightCNContactForHandle(v16);
      if ([v17 hasSuffix:v12])
      {
        id v19 = IMSharedUtilitiesFrameworkBundle();
        uint64_t v20 = [v19 localizedStringForKey:@"TS_NOTIFICATION_EMERGENCY_SUBTITLE_DISPLAYNAME" value:&stru_1F084E970 table:@"IMSharedUtilities-SYDROB_FEATURES"];

        __int16 v60 = (void *)v20;
        goto LABEL_21;
      }
      if (v18
        || ([v58 emergencyUserPersona],
            int v23 = objc_claimAutoreleasedReturnValue(),
            [v23 suggestedDisplayName],
            uint64_t v24 = objc_claimAutoreleasedReturnValue(),
            BOOL v25 = v24 == 0,
            v24,
            v23,
            v25))
      {
        uint64_t v21 = [(IMDNotificationsController *)self _displayNameForHandle:v16 andContact:v18];

        if (IMOSLoggingEnabled())
        {
          char v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int buf = 138412290;
            uint64_t v67 = v21;
            _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "Not using suggested display name for user in emergency. Using display name = %@", buf, 0xCu);
          }
          goto LABEL_19;
        }
      }
      else
      {
        uint64_t v26 = [v58 emergencyUserPersona];
        uint64_t v21 = [v26 suggestedDisplayName];

        if (IMOSLoggingEnabled())
        {
          char v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)int buf = 138412290;
            uint64_t v67 = v21;
            _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "Using suggested display name for user in emergency = %@", buf, 0xCu);
          }
LABEL_19:
        }
      }
      long long v61 = (void *)v21;
LABEL_21:
    }
    uint64_t v13 = [obj countByEnumeratingWithState:&v62 objects:v68 count:16];
  }
  while (v13);
LABEL_25:

  id v27 = NSString;
  uint64_t v28 = IMSharedUtilitiesFrameworkBundle();
  uint64_t v29 = [v28 localizedStringForKey:@"TS_NOTIFICATION_EMERGENCY_SOS_HANDLE" value:&stru_1F084E970 table:@"IMSharedUtilities-SYDROB_FEATURES"];
  uint64_t v30 = [v27 localizedStringWithFormat:v29];

  long long v31 = NSString;
  uint64_t v32 = IMSharedUtilitiesFrameworkBundle();
  long long v33 = [v32 localizedStringForKey:@"TS_EMERGENCY_USER_BODY_FIRST_MESSAGE" value:&stru_1F084E970 table:@"IMSharedUtilities-SYDROB_FEATURES"];
  uint64_t v34 = objc_msgSend(v31, "stringWithFormat:", v33, v61);

  __int16 v35 = NSString;
  id v36 = IMSharedUtilitiesFrameworkBundle();
  id v37 = [v36 localizedStringForKey:@"TS_EMERGENCY_USER_SUBTITLE_MESSAGE" value:&stru_1F084E970 table:@"IMSharedUtilities-SYDROB_FEATURES"];
  uint64_t v38 = objc_msgSend(v35, "localizedStringWithFormat:", v37, v60, v61);

  if ((v52 & 1) == 0)
  {
    uint64_t v39 = NSString;
    uint64_t v40 = IMSharedUtilitiesFrameworkBundle();
    uint64_t v41 = [v40 localizedStringForKey:@"TS_EMERGENCY_USER_SUBTITLE_MESSAGE" value:&stru_1F084E970 table:@"IMSharedUtilities-SYDROB_FEATURES"];
    uint64_t v42 = objc_msgSend(v39, "stringWithFormat:", v41, v61, v60);

    uint64_t v38 = (void *)v42;
  }
  if (v51)
  {
    uint64_t v43 = NSString;
    BOOL v44 = IMSharedUtilitiesFrameworkBundle();
    id v45 = [v44 localizedStringForKey:@"TS_NOTIFICATION_EMERGENCY_SUBTITLE_DISPLAYNAME_FIRST_MESSASGE" value:&stru_1F084E970 table:@"IMSharedUtilities-SYDROB_FEATURES"];
    uint64_t v46 = objc_msgSend(v43, "stringWithFormat:", v45, v61);

    [v57 setBody:v34];
    uint64_t v38 = (void *)v46;
  }
  else if (((![(IMDNotificationsController *)self _contentBodyHasLocationURL:v55] | v52) & 1) == 0)
  {
    v47 = NSString;
    uint64_t v48 = IMSharedUtilitiesFrameworkBundle();
    v49 = [v48 localizedStringForKey:@"TS_LOCATION_SHARED" value:&stru_1F084E970 table:@"IMSharedUtilities-SYDROB_FEATURES"];
    v50 = objc_msgSend(v47, "stringWithFormat:", v49, v61);
    [v57 setBody:v50];
  }
  [v57 setTitle:v30];
  [v57 setSubtitle:v38];

LABEL_32:
}

- (void)_populateBodyAndTitleForSendFailedNotificationContent:(id)a3 messageDictionary:(id)a4
{
  id v43 = a3;
  id v6 = a4;
  id v7 = IMSharedUtilitiesFrameworkBundle();
  id v8 = [v7 localizedStringForKey:@"MESSAGE_SEND_FAILED" value:&stru_1F084E970 table:@"IMSharedUtilities"];

  id v9 = IMSharedUtilitiesFrameworkBundle();
  int v10 = [v9 localizedStringForKey:@"MESSAGE_SEND_TO_UNKNOWN_FAILED" value:&stru_1F084E970 table:@"IMSharedUtilities"];

  int v11 = [v43 userInfo];
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v11 mutableCopy];

  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  uint64_t v13 = [v6 objectForKeyedSubscript:@"__kmessageHandleKey"];
  uint64_t v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v15 = [v14 isCarrierPigeonEnabled];

  if (v15)
  {
    BOOL v16 = [v6 objectForKey:@"__kmessageServiceKey"];
    char v17 = [v16 isEqualToString:*MEMORY[0x1E4F6E1B8]];

    uint64_t v18 = [v6 objectForKey:@"__kmessageServiceKey"];
    int v19 = [v18 isEqualToString:*MEMORY[0x1E4F6E1A8]];

    if ((v17 & 1) != 0 || v19)
    {
      uint64_t v20 = IMSharedUtilitiesFrameworkBundle();
      uint64_t v21 = [v20 localizedStringForKey:@"MESSAGE_SEND_FAILURE_VIA_SATELLITE_TITLE" value:&stru_1F084E970 table:@"IMSharedUtilities"];

      id v8 = (void *)v21;
    }
  }
  if (v13)
  {
    char v22 = [v6 objectForKey:@"__kmessageCNContactForSenderKey"];
    int v23 = [(IMDNotificationsController *)self _displayNameForHandle:v13 andContact:v22];

    if (v23)
    {
      uint64_t v24 = NSString;
      BOOL v25 = IMSharedUtilitiesFrameworkBundle();
      uint64_t v26 = [v25 localizedStringForKey:@"MESSAGE_SEND_TO_PERSON_FAILED_FORMAT" value:&stru_1F084E970 table:@"IMSharedUtilities"];
      id v27 = objc_msgSend(v24, "localizedStringWithFormat:", v26, v23);

      [(__CFDictionary *)Mutable setObject:v23 forKey:@"CKBBContextKeySenderName"];
      uint64_t v28 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      LODWORD(v25) = [v28 isCarrierPigeonEnabled];

      if (!v25) {
        goto LABEL_15;
      }
      uint64_t v29 = [v6 objectForKeyedSubscript:@"__kmessageFlagsKey"];
      uint64_t v30 = [v29 unsignedLongLongValue];

      long long v31 = [v6 objectForKey:@"__kmessageServiceKey"];
      int v32 = [v31 isEqualToString:*MEMORY[0x1E4F6E1B8]];

      long long v33 = [v6 objectForKey:@"__kmessageServiceKey"];
      int v34 = [v33 isEqualToString:*MEMORY[0x1E4F6E1A8]];

      if ((v30 & 0x20000000000) == 0) {
        goto LABEL_15;
      }
      __int16 v35 = [v6 objectForKeyedSubscript:@"__kmessageItemTypeKey"];
      uint64_t v36 = [v35 longValue];

      int v37 = v36 ? 1 : v32;
      if (((v37 | v34) & 1) == 0)
      {
        uint64_t v38 = IMSharedUtilitiesFrameworkBundle();
        uint64_t v42 = [v38 localizedStringForKey:@"MESSAGE_SEND_FAILED_USER_OFFGRID" value:&stru_1F084E970 table:@"IMSharedUtilities"];

        uint64_t v39 = NSString;
        uint64_t v40 = IMSharedUtilitiesFrameworkBundle();
        uint64_t v41 = [v40 localizedStringForKey:@"MESSAGE_SEND_TO_PERSON_FAILED_FORMAT_USER_OFFGRID" value:&stru_1F084E970 table:@"IMSharedUtilities"];
        int v10 = objc_msgSend(v39, "localizedStringWithFormat:", v41, v23);

        id v8 = (void *)v42;
      }
      else
      {
LABEL_15:
        int v10 = v27;
      }
    }
  }
  [v43 setTitle:v8];
  [v43 setBody:v10];
  [v43 setInterruptionLevel:2];
  [(__CFDictionary *)Mutable setObject:MEMORY[0x1E4F1CC38] forKey:@"CKBBContextKeyIsFailedMessage"];
  [v43 setUserInfo:Mutable];
}

- (void)_populateTitleForNotificationContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5
{
  uint64_t v46 = *MEMORY[0x1E4F143B8];
  id v43 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [v9 objectForKey:@"__kmessageHandleKey"];
  int v11 = (void *)MEMORY[0x1E4F6E9A0];
  uint64_t v12 = [v8 objectForKey:@"__kchatEmergencyUserInfo"];
  uint64_t v42 = [v11 infoFromDictionary:v12 isStewieTranscriptSharingMessage:0];

  if (!v10)
  {
    uint64_t v13 = 0;
LABEL_21:
    char v17 = 0;
    goto LABEL_33;
  }
  uint64_t v13 = [(id)objc_opt_class() _addressForHandle:v10];
  if (![v13 length])
  {
    if (IMOSLoggingEnabled())
    {
      char v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        int v23 = [v9 objectForKeyedSubscript:@"__kmessageGUIDKey"];
        *(_DWORD *)int buf = 138412290;
        id v45 = v23;
        _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "Unable to create formatted display string for handle from messageGUID %@", buf, 0xCu);
      }
    }
    goto LABEL_21;
  }
  uint64_t v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v15 = [v14 stewieEnabled];

  if (v15 && (MEMORY[0x1B3E89A20](v13) & 1) != 0)
  {
    char v40 = 0;
    LOBYTE(v41) = -1;
  }
  else
  {
    unsigned int v41 = ~MEMORY[0x1B3E899E0](v13);
    char v40 = 1;
  }
  BOOL v16 = [v9 objectForKey:@"__kmessageCNContactForSenderKey"];
  char v17 = [(IMDNotificationsController *)self _displayNameForHandle:v10 andContact:v16];

  if (v17 && [v17 length])
  {
    [v43 setTitle:v17];
    uint64_t v18 = [v43 userInfo];
    CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v18 mutableCopy];

    if (!Mutable) {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    [(__CFDictionary *)Mutable setObject:v17 forKey:@"CKBBContextKeySenderName"];
    CFMutableDictionaryRef v37 = Mutable;
    [v43 setUserInfo:Mutable];
    uint64_t v39 = [v8 objectForKeyedSubscript:@"__kchatHandlesForChatKey"];
    uint64_t v38 = [v9 objectForKeyedSubscript:@"__kmessageThreadOriginatorKey"];
    if ((unint64_t)[v39 count] < 2)
    {
      char v21 = 0;
    }
    else
    {
      uint64_t v20 = [v8 objectForKeyedSubscript:@"__kchatStyleKey"];
      if ([v20 longLongValue] == 45) {
        char v21 = 0;
      }
      else {
        char v21 = v41 & v40;
      }
    }
    uint64_t v24 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v25 = [v24 isTranscriptSharingEnabled];

    if (v25) {
      v21 &= v42 == 0;
    }
    uint64_t v26 = [v9 objectForKey:@"__kmessageServiceKey"];
    int v27 = [v26 isEqualToString:*MEMORY[0x1E4F6E1A0]];

    BOOL v28 = [(IMDNotificationsController *)self _amIMentionedInMessage:v9];
    if (v21) {
      goto LABEL_32;
    }
    if ((v27 | !v28))
    {
      if (!v38) {
        goto LABEL_32;
      }
      uint64_t v29 = [v38 objectForKey:@"__kmessageFlagsKey"];
      char v30 = [v29 unsignedLongLongValue];

      if ((v30 & 4) == 0) {
        goto LABEL_32;
      }
      long long v31 = NSString;
      int v32 = IMSharedUtilitiesFrameworkBundle();
      long long v33 = [v32 localizedStringForKey:@"REPLY_RECEIVED_TITLE" value:&stru_1F084E970 table:@"IMSharedUtilities"];
      uint64_t v34 = objc_msgSend(v31, "localizedStringWithFormat:", v33, v17);
    }
    else
    {
      __int16 v35 = NSString;
      int v32 = IMSharedUtilitiesFrameworkBundle();
      long long v33 = [v32 localizedStringForKey:@"MENTION_RECEIVED_TITLE" value:&stru_1F084E970 table:@"IMSharedUtilities"];
      uint64_t v34 = objc_msgSend(v35, "localizedStringWithFormat:", v33, v17);
    }
    uint64_t v36 = (void *)v34;
    [v43 setTitle:v34];

LABEL_32:
  }
LABEL_33:
}

- (void)_populateSoundAndDisplayActivationForNotificationContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [MEMORY[0x1E4F445C0] soundWithAlertType:2];
  int v11 = [v9 objectForKey:@"__kmessageCNContactForSenderKey"];
  uint64_t v12 = v11;
  if (v11)
  {
    uint64_t v13 = [v11 valueForKey:*MEMORY[0x1E4F1AF90]];
    uint64_t v14 = v13;
    if (v13)
    {
      int v15 = [v13 vibration];
      [v10 setVibrationIdentifier:v15];

      BOOL v16 = [v14 sound];
      [v10 setToneIdentifier:v16];

      objc_msgSend(v10, "setShouldIgnoreRingerSwitch:", -[NSObject ignoreMute](v14, "ignoreMute"));
      objc_msgSend(v7, "setShouldIgnoreDoNotDisturb:", -[NSObject ignoreMute](v14, "ignoreMute"));
      if ([v14 ignoreMute])
      {
        if (IMOSLoggingEnabled())
        {
          char v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            LOWORD(v28) = 0;
            _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "ignoreMute is YES. Contact is Emergency Broadcast enabled. Expecting notification to bypass system mute and/or system DND.", (uint8_t *)&v28, 2u);
          }
        }
      }
    }
LABEL_12:

    goto LABEL_13;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "messageCNContactForSenderKey not found in messageDictionary.", (uint8_t *)&v28, 2u);
    }
    goto LABEL_12;
  }
LABEL_13:
  uint64_t v18 = [v9 objectForKey:@"__kmessageAssociatedMessageGUIDKey"];
  BOOL v19 = [v18 length] == 0;

  if (!v19)
  {
    uint64_t v20 = [v9 objectForKey:@"__kmessageAssociatedMessageTypeKey"];
    uint64_t v21 = [v20 integerValue];

    if ((unint64_t)(v21 - 2000) <= 5) {
      [v10 setAlertTopic:**((void **)&unk_1E5F8EB88 + v21 - 2000)];
    }
  }
  [v7 setShouldSuppressScreenLightUp:0];
  [v7 setSound:v10];
  if (IMOSLoggingEnabled())
  {
    char v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      id v23 = [v7 sound];
      int v24 = [v7 shouldIgnoreDoNotDisturb];
      int v25 = [v7 shouldSuppressScreenLightUp];
      uint64_t v26 = @"NO";
      if (v24) {
        int v27 = @"YES";
      }
      else {
        int v27 = @"NO";
      }
      int v28 = 138412802;
      id v29 = v23;
      __int16 v30 = 2112;
      long long v31 = v27;
      if (v25) {
        uint64_t v26 = @"YES";
      }
      __int16 v32 = 2112;
      long long v33 = v26;
      _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "Populating sound and display sound %@ ignoreDND %@ suppress screen light up %@", (uint8_t *)&v28, 0x20u);
    }
  }
}

- (void)_populateIgnoresDoNotDisturb:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  int v10 = [v8 objectForKey:@"__kchatChatIdentifierKey"];
  if (MEMORY[0x1B3E89A20]())
  {
    if (IMOSLoggingEnabled())
    {
      int v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = [v9 objectForKey:@"__kmessageGUIDKey"];
        int v16 = 138412290;
        char v17 = v12;
        _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "Chat is flagged as Stewie for message %@ punching through DND", (uint8_t *)&v16, 0xCu);
      }
    }
    if (([v10 hasPrefix:*MEMORY[0x1E4F6E4A8]] & 1) == 0) {
      goto LABEL_13;
    }
  }
  else if (![v10 hasPrefix:*MEMORY[0x1E4F6E4A8]])
  {
    goto LABEL_18;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = [v9 objectForKey:@"__kmessageGUIDKey"];
      int v16 = 138412290;
      char v17 = v14;
      _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Chat is flagged as Stewie TS for message %@ punching through DND", (uint8_t *)&v16, 0xCu);
    }
  }
LABEL_13:
  if (IMOSLoggingEnabled())
  {
    int v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_INFO, "Setting ShouldIgnoreDoNotDisturb = YES", (uint8_t *)&v16, 2u);
    }
  }
  [v7 setShouldIgnoreDoNotDisturb:1];
LABEL_18:
}

- (void)_populateTimeSensitiveOrCriticalForNotificationContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v37 = a4;
  id v8 = a5;
  id v9 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LODWORD(a4) = [v9 isSOSAlertingEnabled];

  if (!a4) {
    goto LABEL_28;
  }
  int v10 = [v8 objectForKey:@"__kmessageFlagsKey"];
  unint64_t v11 = [v10 unsignedLongLongValue];

  if ((v11 & 0x8000000000) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Message has an SOS flag", buf, 2u);
      }
    }
    if (![(IMDNotificationsController *)self _messageIsSOSMapURL:v8])
    {
      unsigned int v35 = 0;
      goto LABEL_15;
    }
  }
  else if (![(IMDNotificationsController *)self _messageIsSOSMapURL:v8])
  {
    goto LABEL_28;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Message has an SOS URL match", buf, 2u);
    }
  }
  uint64_t v14 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v14 trackEvent:*MEMORY[0x1E4F6DAE0]];

  unsigned int v35 = 1;
LABEL_15:
  int v15 = [v8 objectForKey:@"__kmessageFlagsKey"];
  uint64_t v16 = [v15 unsignedLongLongValue];

  sub_1AFB71EE0();
  unint64_t v17 = v16 & 0x4000000000;
  if (objc_opt_respondsToSelector())
  {
    uint64_t v18 = [sub_1AFB71EE0() isSOSMessagesUrgentAlertingEnabled];
    BOOL v19 = [(IMDNotificationsController *)self _messageIsFromKnownContact:v8];
    if ((v17 != 0) & v18 & v19)
    {
      if ((unint64_t)[v38 realertCount] >= 4) {
        uint64_t v20 = [v38 realertCount];
      }
      else {
        uint64_t v20 = 4;
      }
      [v38 setRealertCount:v20];
      uint64_t v21 = 0;
      unsigned int v34 = 1;
      uint64_t v22 = 3;
      goto LABEL_23;
    }
  }
  else
  {
    BOOL v19 = [(IMDNotificationsController *)self _messageIsFromKnownContact:v8];
    uint64_t v18 = 0;
  }
  unsigned int v34 = 0;
  uint64_t v21 = 1;
  uint64_t v22 = 2;
LABEL_23:
  if (IMOSLoggingEnabled())
  {
    id v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      uint64_t v24 = [v38 realertCount];
      *(_DWORD *)int buf = 67110144;
      int v42 = v17 >> 38;
      __int16 v43 = 1024;
      int v44 = v18;
      __int16 v45 = 1024;
      BOOL v46 = v19;
      __int16 v47 = 2048;
      uint64_t v48 = v22;
      __int16 v49 = 2048;
      uint64_t v50 = v24;
      _os_log_impl(&dword_1AFB53000, v23, OS_LOG_TYPE_INFO, "SOS Message - hasCriticalFlag:%{BOOL}d, prefEnabled:%{BOOL}d, isFromContact:%{BOOL}d => interruptionLevel:%tu, realertCount:%tu", buf, 0x28u);
    }
  }
  [v38 setInterruptionLevel:v22];
  uint64_t v36 = [MEMORY[0x1E4F6E890] sharedInstance];
  v39[0] = @"markedSOS";
  int v25 = [NSNumber numberWithBool:(v11 >> 39) & 1];
  v40[0] = v25;
  v39[1] = @"markedCritical";
  uint64_t v26 = [NSNumber numberWithBool:v17 != 0];
  v40[1] = v26;
  v39[2] = @"sosMapURL";
  int v27 = [NSNumber numberWithBool:v35];
  v40[2] = v27;
  v39[3] = @"sosCriticalPrefEnabled";
  int v28 = [NSNumber numberWithBool:v18];
  v40[3] = v28;
  v39[4] = @"receivedFromContact";
  id v29 = [NSNumber numberWithBool:v19];
  v40[4] = v29;
  v39[5] = @"interruptionLevel";
  __int16 v30 = [NSNumber numberWithUnsignedInteger:v22];
  v40[5] = v30;
  v39[6] = @"interruptionLevelTimeSensitive";
  long long v31 = [NSNumber numberWithInt:v21];
  v40[6] = v31;
  v39[7] = @"interruptionLevelCritical";
  __int16 v32 = [NSNumber numberWithInt:v34];
  v40[7] = v32;
  long long v33 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v40 forKeys:v39 count:8];
  [v36 trackEvent:*MEMORY[0x1E4F6DAB8] withDictionary:v33];

LABEL_28:
}

- (BOOL)_messageIsSOSMapURL:(id)a3
{
  id v3 = a3;
  char v4 = [v3 objectForKeyedSubscript:@"__kmessageServiceKey"];
  int v5 = [v4 isEqualToString:*MEMORY[0x1E4F6E1A0]];

  if (v5)
  {
    id v6 = [v3 objectForKeyedSubscript:@"__kmessageTextKey"];
    char v7 = objc_msgSend(v6, "im_matchesSOSMapURL");
  }
  else
  {
    char v7 = 0;
  }

  return v7;
}

- (BOOL)isFromChatBotNotOTC:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  char v4 = [v3 objectForKeyedSubscript:@"__kmessageBalloonBundleIDKey"];
  if ([v4 isEqualToString:*MEMORY[0x1E4F6CAF0]])
  {
    int v5 = [v3 objectForKeyedSubscript:@"__kmessageAttributedBodyKey"];
    uint64_t v6 = [v3 objectForKeyedSubscript:@"__kmessageGUIDKey"];
    char v7 = (void *)v6;
    BOOL v8 = 1;
    if (!v5 || !v6) {
      goto LABEL_15;
    }
    id v9 = objc_alloc_init(MEMORY[0x1E4F6E8D8]);
    int v10 = (void *)[v9 createOTCFromMessageBody:v5 sender:@"sender" guid:v7];

    BOOL v8 = v10 == 0;
    int v11 = IMOSLoggingEnabled();
    if (v10)
    {
      if (v11)
      {
        uint64_t v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v14 = 138412290;
          int v15 = v7;
          _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "message %@ is from a chat bot and is OTC", (uint8_t *)&v14, 0xCu);
        }
LABEL_13:
      }
    }
    else if (v11)
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v14 = 138412290;
        int v15 = v7;
        _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "message %@ is from a chat bot but is not OTC", (uint8_t *)&v14, 0xCu);
      }
      goto LABEL_13;
    }

LABEL_15:
    goto LABEL_16;
  }
  BOOL v8 = 0;
LABEL_16:

  return v8;
}

- (void)_populateUserInfoOnContentForWatch:(id)a3 messageDictionary:(id)a4 chatDictionary:(id)a5 isCarouselUITriggered:(BOOL)a6
{
  v77[1] = *MEMORY[0x1E4F143B8];
  id v62 = a3;
  id v9 = a4;
  id v10 = a5;
  id v56 = self;
  long long v64 = v9;
  if ([(IMDNotificationsController *)self isFromChatBotNotOTC:v9]) {
    goto LABEL_64;
  }
  v59 = v10;
  int v11 = [v62 userInfo];
  uint64_t v12 = [v11 mutableCopy];

  theDict = (__CFDictionary *)v12;
  if (!v12) {
    theDict = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  uint64_t v13 = [v64 objectForKey:@"__kmessageGUIDKey"];
  if (v13) {
    CFDictionarySetValue(theDict, @"CKBBContextKeyMessageGUID", v13);
  }

  int v14 = [v59 objectForKey:@"__kchatChatIdentifierKey"];
  if (v14) {
    CFDictionarySetValue(theDict, @"CKBBUserInfoKeyChatIdentifier", v14);
  }

  int v15 = [v59 objectForKey:@"__kchatChatGUIDKey"];

  if (v15
    && ([v59 objectForKey:@"__kchatChatGUIDKey"],
        uint64_t v16 = objc_claimAutoreleasedReturnValue(),
        v77[0] = v16,
        [MEMORY[0x1E4F1C978] arrayWithObjects:v77 count:1],
        unint64_t v17 = objc_claimAutoreleasedReturnValue(),
        v16,
        (id v18 = v17) != 0))
  {
    id v55 = v18;
    CFDictionarySetValue(theDict, @"CKBBContextKeyChatGUIDs", v18);
  }
  else
  {
    id v55 = 0;
  }
  BOOL v19 = [v59 objectForKey:@"__kchatStyleKey"];
  BOOL v20 = [v19 integerValue] == 43;

  if (v20)
  {
    uint64_t v21 = [v59 objectForKey:@"__kchatGroupIDKey"];
    if (v21) {
      CFDictionarySetValue(theDict, @"CKBBContextKeyChatGroupID", v21);
    }
  }
  else
  {
    uint64_t v21 = [v64 objectForKey:@"__kmessageCNContactForSenderKey"];
    uint64_t v22 = [v21 identifier];
    if (v22) {
      CFDictionarySetValue(theDict, @"CKBBContextKeySenderPersonCentricID", v22);
    }
  }
  id v23 = [v64 objectForKey:@"__kmessageAssociatedMessageGUIDKey"];
  BOOL v24 = [v23 length] == 0;

  if (!v24)
  {
    int v25 = [v64 objectForKey:@"__kmessageAssociatedMessageTypeKey"];
    uint64_t v26 = [v25 integerValue];

    if ((v26 & 0xFFFFFFFFFFFFFFF8) == 0x7D0)
    {
      int v27 = @"CKBBContextKeyIsAcknowledgment";
    }
    else
    {
      if (v26 != 1000) {
        goto LABEL_24;
      }
      int v27 = @"CKBBContextKeyIsSticker";
    }
    [(__CFDictionary *)theDict setObject:MEMORY[0x1E4F1CC38] forKey:v27];
  }
LABEL_24:
  id v58 = [v64 objectForKey:@"__kmessageBalloonBundleIDKey"];
  if ([v58 length])
  {
    [(__CFDictionary *)theDict setObject:MEMORY[0x1E4F1CC38] forKey:@"CKBBContextKeyIsBalloonPluginBulletin"];
    [(__CFDictionary *)theDict setObject:v58 forKey:@"CKBBContextKeyBalloonBundleID"];
  }
  int v28 = [v64 objectForKey:@"__kmessageExpressiveSendStyleIDKey"];
  if ([v28 containsString:*MEMORY[0x1E4F6D4D8]])
  {
  }
  else
  {
    id v29 = [v64 objectForKey:@"__kmessageExpressiveSendStyleIDKey"];
    int v30 = [v29 containsString:*MEMORY[0x1E4F6D480]];

    if (!v30)
    {
      int v32 = 0;
      goto LABEL_31;
    }
  }
  long long v31 = [v64 objectForKey:@"__kmessageExpressiveSendStyleIDKey"];
  [(__CFDictionary *)theDict setObject:v31 forKey:@"CKBBContextKeyEffectIdentifier"];

  int v32 = 1;
LABEL_31:
  id v57 = [v64 objectForKey:@"__kmessageAttachmentsKey"];
  if ([v57 count])
  {
    if (v32) {
      [(__CFDictionary *)theDict setObject:MEMORY[0x1E4F1CC38] forKey:@"CKBBContextKeyIsAttachmentWithEffectBulletin"];
    }
    long long v33 = [v62 body];
    [(__CFDictionary *)theDict setObject:v33 forKey:@"CKBBContentKeyAttachmentSummary"];

    id v34 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    long long v72 = 0u;
    long long v73 = 0u;
    long long v70 = 0u;
    long long v71 = 0u;
    id obj = v57;
    uint64_t v35 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
    if (v35)
    {
      uint64_t v36 = *(void *)v71;
      long long v61 = (void *)*MEMORY[0x1E4F6EB08];
      __int16 v60 = (void *)*MEMORY[0x1E4F6EAF8];
      long long v65 = (void *)*MEMORY[0x1E4F6EB00];
      long long v66 = (void *)*MEMORY[0x1E4F6EAF0];
      uint64_t v67 = (void *)*MEMORY[0x1E4F6EB58];
      long long v68 = (void *)*MEMORY[0x1E4F6EB68];
      id v37 = (void *)*MEMORY[0x1E4F6EB60];
      id v38 = (void *)*MEMORY[0x1E4F6EB50];
      do
      {
        for (uint64_t i = 0; i != v35; ++i)
        {
          if (*(void *)v71 != v36) {
            objc_enumerationMutation(obj);
          }
          char v40 = [*(id *)(*((void *)&v70 + 1) + 8 * i) utiString];
          char IsImage = IMUTTypeIsImage();
          int v42 = v38;
          if ((IsImage & 1) == 0)
          {
            char IsMovie = IMUTTypeIsMovie();
            int v42 = v37;
            if ((IsMovie & 1) == 0)
            {
              char IsPass = IMUTTypeIsPass();
              int v42 = v68;
              if ((IsPass & 1) == 0)
              {
                char IsMap = IMUTTypeIsMap();
                int v42 = v67;
                if ((IsMap & 1) == 0)
                {
                  char IsAudio = IMUTTypeIsAudio();
                  int v42 = v66;
                  if ((IsAudio & 1) == 0)
                  {
                    char IsVCard = IMUTTypeIsVCard();
                    int v42 = v65;
                    if ((IsVCard & 1) == 0)
                    {
                      int IsCalendar = IMUTTypeIsCalendar();
                      int v42 = v61;
                      if (IsCalendar) {
                        int v42 = v60;
                      }
                    }
                  }
                }
              }
            }
          }
          id v49 = v42;
          if (v49)
          {
            uint64_t v50 = [v34 objectForKey:v49];
            uint64_t v51 = v50;
            if (v50)
            {
              int v52 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v50, "unsignedIntegerValue") + 1);
              [v34 setObject:v52 forKey:v49];
            }
            else
            {
              [v34 setObject:&unk_1F0864EA8 forKey:v49];
            }
          }
        }
        uint64_t v35 = [obj countByEnumeratingWithState:&v70 objects:v76 count:16];
      }
      while (v35);
    }

    if ([v34 count])
    {
      long long v53 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(obj, "count"));
      [(__CFDictionary *)theDict setObject:v53 forKey:@"CKBBContentKeyAttachmentCount"];

      [(__CFDictionary *)theDict setObject:v34 forKey:@"CKBBContentKeyCountByAttachmentType"];
    }
  }
  if ([(IMDNotificationsController *)v56 _amIMentionedInMessage:v64]) {
    [(__CFDictionary *)theDict setObject:MEMORY[0x1E4F1CC38] forKey:@"messageMentionsMe"];
  }
  if (IMOSLoggingEnabled())
  {
    long long v54 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)int buf = 138412290;
      v75 = theDict;
      _os_log_impl(&dword_1AFB53000, v54, OS_LOG_TYPE_INFO, "Set userInfo for dictionaries %@", buf, 0xCu);
    }
  }
  [v62 setUserInfo:theDict];

  id v10 = v59;
LABEL_64:
}

- (void)_populateUserInfoForMessageContent:(id)a3 messageDictionary:(id)a4 messageIsAddressedToMe:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = [v7 userInfo];
  CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v9 mutableCopy];

  if (Mutable)
  {
    if (!v5) {
      goto LABEL_4;
    }
    goto LABEL_3;
  }
  CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  if (v5) {
LABEL_3:
  }
    [(__CFDictionary *)Mutable setObject:MEMORY[0x1E4F1CC38] forKey:@"messageIsAddressedToMe"];
LABEL_4:
  if (IMOSLoggingEnabled())
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      CFMutableDictionaryRef v13 = Mutable;
      _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "Set userInfo for message content dictionaries %@", (uint8_t *)&v12, 0xCu);
    }
  }
  [v7 setUserInfo:Mutable];
}

- (void)_populateAttachmentsForNotificationContent:(id)a3 messageDictionary:(id)a4 messageRecord:(id)a5 knownSender:(BOOL)a6
{
  BOOL v67 = a6;
  uint64_t v92 = *MEMORY[0x1E4F143B8];
  id v58 = a3;
  id v8 = a4;
  long long v54 = (const __CFArray **)a5;
  id v56 = v8;
  id v55 = [v8 objectForKey:@"__kmessageAttributedBodyKey"];
  if ((objc_msgSend(v55, "__im_isRichCardsOrSuggestedReply") & 1) == 0)
  {
    id v9 = [v8 objectForKeyedSubscript:@"__kmessageExpressiveSendStyleIDKey"];

    if (!v9
      || ([v8 objectForKeyedSubscript:@"__kmessageExpressiveSendStyleIDKey"],
          id v10 = objc_claimAutoreleasedReturnValue(),
          char v11 = [v10 isEqualToString:*MEMORY[0x1E4F6D4E0]],
          v10,
          (v11 & 1) == 0))
    {
      int v12 = [v56 objectForKeyedSubscript:@"__kmessageAttachmentsKey"];
      v59 = [MEMORY[0x1E4F1CA48] array];
      long long v72 = [MEMORY[0x1E4F1CA60] dictionary];
      long long v79 = 0u;
      long long v80 = 0u;
      long long v77 = 0u;
      long long v78 = 0u;
      id obj = v12;
      uint64_t v73 = [obj countByEnumeratingWithState:&v77 objects:v91 count:16];
      if (v73)
      {
        char v57 = 0;
        id v70 = 0;
        uint64_t v71 = *(void *)v78;
        CFStringRef inConformsToUTI = (const __CFString *)*MEMORY[0x1E4F22580];
        uint64_t v61 = *MEMORY[0x1E4F446C0];
        do
        {
          for (uint64_t i = 0; i != v73; ++i)
          {
            if (*(void *)v78 != v71) {
              objc_enumerationMutation(obj);
            }
            uint64_t v14 = *(void **)(*((void *)&v77 + 1) + 8 * i);
            int v15 = [v14 utiString];
            uint64_t v16 = [v14 path];
            unint64_t v17 = [v14 guid];
            uint64_t v18 = [v14 transferState];
            [v72 setObject:v14 forKeyedSubscript:v17];
            if ([v16 length]) {
              BOOL v19 = v18 == 5;
            }
            else {
              BOOL v19 = 0;
            }
            if (v19)
            {
              BOOL v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16 isDirectory:0];
              int v21 = UTTypeConformsTo(v15, inConformsToUTI);
              if (!v70)
              {
                if (v21)
                {
                  long long v63 = IMPreviewCachesDirectoryWithAttachmentURL();
                  id v62 = [v20 lastPathComponent];
                  uint64_t v22 = [v63 URLByAppendingPathComponent:v62 isDirectory:0];
                  long long v64 = [v22 URLByAppendingPathExtension:@"plist"];

                  id v76 = 0;
                  long long v65 = [MEMORY[0x1E4F1C9E8] dictionaryWithContentsOfURL:v64 error:&v76];
                  id v60 = v76;
                  int v23 = IMOSLoggingEnabled();
                  if (v65)
                  {
                    if (v23)
                    {
                      BOOL v24 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)int buf = 138412290;
                        v82 = v64;
                        _os_log_impl(&dword_1AFB53000, v24, OS_LOG_TYPE_INFO, "Successfully loaded contact plist at: %@", buf, 0xCu);
                      }
                    }
                    int v25 = [v65 objectForKeyedSubscript:@"contactFormatterTitle"];
                    uint64_t v26 = [v65 objectForKeyedSubscript:@"organizationNameTitle"];
                    if ([v26 length])
                    {
                      id v27 = v26;

                      int v25 = v27;
                    }
                    int v28 = +[IMDNotificationsController _truncateNameIfNeeded:v25];

                    if (v28)
                    {
                      [v58 setBody:v28];
                      char v57 = 1;
                    }
                    id v70 = v14;
                  }
                  else
                  {
                    if (v23)
                    {
                      id v29 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)int buf = 138412546;
                        v82 = v64;
                        __int16 v83 = 2112;
                        id v84 = v60;
                        _os_log_impl(&dword_1AFB53000, v29, OS_LOG_TYPE_INFO, "Failed to load contact plist at: %@ (error: %@)", buf, 0x16u);
                      }
                    }
                    id v70 = 0;
                  }
                }
                else
                {
                  id v70 = 0;
                }
              }
            }
            if ([v16 length]) {
              BOOL v30 = v18 == 5;
            }
            else {
              BOOL v30 = 0;
            }
            if (v30)
            {
              long long v31 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v16 isDirectory:0];
              int v32 = [(IMDNotificationsController *)self _notificationsSafePreviewFileURLForTransferURL:v31 utiType:v15 knownSender:v67];
              unsigned int v33 = [v14 isCommSafetySensitive];
              int v34 = [v14 isAdaptiveImageGlyph];
              uint64_t v35 = v33;
              if (IMOSLoggingEnabled())
              {
                uint64_t v36 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                {
                  id v37 = [NSNumber numberWithInteger:v35];
                  *(_DWORD *)int buf = 138412290;
                  v82 = v37;
                  _os_log_impl(&dword_1AFB53000, v36, OS_LOG_TYPE_INFO, "CommSafety Sensitive value on the record: %@", buf, 0xCu);
                }
              }
              if (v32) {
                int v38 = v35;
              }
              else {
                int v38 = 1;
              }
              if ((v38 | v34))
              {
                if (IMOSLoggingEnabled())
                {
                  uint64_t v39 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)int buf = 138412290;
                    v82 = v31;
                    _os_log_impl(&dword_1AFB53000, v39, OS_LOG_TYPE_INFO, "We didn't generate a previewFileURL for transfer %@ to generate a notification preview", buf, 0xCu);
                  }
                }
              }
              else
              {
                uint64_t v89 = v61;
                v90 = @"public.jpeg";
                int v42 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v90 forKeys:&v89 count:1];
                id v75 = 0;
                __int16 v43 = [MEMORY[0x1E4F445F0] attachmentWithIdentifier:v17 URL:v32 options:v42 error:&v75];
                id v44 = v75;
                if (IMOSLoggingEnabled())
                {
                  __int16 v45 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)int buf = 138413058;
                    v82 = v32;
                    __int16 v83 = 2112;
                    id v84 = v31;
                    __int16 v85 = 2112;
                    v86 = v43;
                    __int16 v87 = 2112;
                    id v88 = v44;
                    _os_log_impl(&dword_1AFB53000, v45, OS_LOG_TYPE_INFO, "generated previewfile url %@ for transfer %@ as unnotificationattachment %@ with error %@", buf, 0x2Au);
                  }
                }
                if (v43) {
                  [v59 addObject:v43];
                }
              }
            }
            else if (IMOSLoggingEnabled())
            {
              char v40 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
              {
                unsigned int v41 = [NSNumber numberWithInteger:v18];
                *(_DWORD *)int buf = 138412802;
                v82 = v16;
                __int16 v83 = 2112;
                id v84 = v41;
                __int16 v85 = 2112;
                v86 = v17;
                _os_log_impl(&dword_1AFB53000, v40, OS_LOG_TYPE_INFO, "Filename was null (%@) or transfer state was not finished (%@) for file transfer %@ -- did not generate attachment preview", buf, 0x20u);
              }
            }
          }
          uint64_t v73 = [obj countByEnumeratingWithState:&v77 objects:v91 count:16];
        }
        while (v73);
      }
      else
      {
        char v57 = 0;
        id v70 = 0;
      }

      BOOL v46 = IMDCreateIMItemFromIMDMessageRecordRefWithAccountLookup(v54, 0, 1, 0);
      if (v46)
      {
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          __int16 v47 = [v56 objectForKey:@"__kmessageHandleKey"];
          uint64_t v48 = [v56 objectForKey:@"__kmessageCNContactForSenderKey"];
          id v49 = [(IMDNotificationsController *)self _displayNameForHandle:v47 andContact:v48];
          uint64_t v50 = [MEMORY[0x1E4F6E6D8] firstNameForCNContact:v48];
          if (![v50 length])
          {
            id v51 = v49;

            uint64_t v50 = v51;
          }
          id v74 = v72;
          int v52 = IMSharedMessageSummaryCreateWithShortName();
          long long v53 = v52;
          if ((v57 & 1) == 0 && [v52 length]) {
            [v58 setBody:v53];
          }
        }
      }
      if ([v59 count]) {
        [v58 setAttachments:v59];
      }
    }
  }
}

+ (int)validateAlertCount:(int)a3
{
  if (a3 > 0xB) {
    return 2;
  }
  else {
    return dword_1AFC77B20[a3];
  }
}

+ (int)reminderAlertCount
{
  int result = dword_1EB5AAAF4;
  if (dword_1EB5AAAF4 == -1)
  {
    if ((byte_1EB5ABB70 & 1) == 0)
    {
      byte_1EB5ABB70 = 1;
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterAddObserver(DarwinNotifyCenter, 0, (CFNotificationCallback)sub_1AFB73840, @"com.apple.MobileSMS.IncomingMessageAlertCount.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    }
    Boolean keyExistsAndHasValidFormat = 0;
    CFPreferencesSynchronize(@"com.apple.MobileSMS", (CFStringRef)*MEMORY[0x1E4F1D3F0], (CFStringRef)*MEMORY[0x1E4F1D3E0]);
    CFIndex AppIntegerValue = CFPreferencesGetAppIntegerValue(@"IncomingMessageAlertCount", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
    if (keyExistsAndHasValidFormat == 1) {
      int result = [a1 validateAlertCount:AppIntegerValue];
    }
    else {
      int result = 2;
    }
    dword_1EB5AAAF4 = result;
  }
  return result;
}

- (void)_populateRealertCountForNotificationContent:(id)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (objc_opt_respondsToSelector())
  {
    int v4 = [(id)objc_opt_class() reminderAlertCount] - 1;
    if (IMOSLoggingEnabled())
    {
      BOOL v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        v6[0] = 67109120;
        v6[1] = v4;
        _os_log_impl(&dword_1AFB53000, v5, OS_LOG_TYPE_INFO, "Setting repeat alert count to %d", (uint8_t *)v6, 8u);
      }
    }
    [v3 setRealertCount:v4];
  }
}

- (BOOL)_messageShouldBeSpoken:(id)a3 chatDictionary:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 objectForKey:@"__kmessageHandleKey"];
  if (!v8)
  {
LABEL_7:
    LOBYTE(v10) = 0;
    goto LABEL_8;
  }
  if ([(IMDNotificationsController *)self _chatIsMuted:v7])
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        uint64_t v14 = @"YES";
        _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "Chat has isMuted set %@, not marking as spoken message allowlisted", (uint8_t *)&v13, 0xCu);
      }
    }
    goto LABEL_7;
  }
  BOOL v10 = [(IMDNotificationsController *)self _handleIsSpokenMessageAllowlisted:v8 chat:v7 message:v6];
  if (IMOSLoggingEnabled())
  {
    int v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412546;
      uint64_t v14 = v8;
      __int16 v15 = 1024;
      BOOL v16 = v10;
      _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "Contact %@ isSpokenMessageAllowlisted: %d", (uint8_t *)&v13, 0x12u);
    }
  }
LABEL_8:

  return v10;
}

- (BOOL)_isMostActiveDevice
{
  uint64_t v17 = 0;
  uint64_t v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 1;
  id v2 = objc_alloc_init(MEMORY[0x1E4F9F6C0]);
  [v2 setType:1];
  if (qword_1E9AF7F78 != -1) {
    dispatch_once(&qword_1E9AF7F78, &unk_1F084D318);
  }
  id v3 = (id)qword_1E9AF7F80;
  [v2 setDispatchQueue:v3];

  id v4 = v2;
  dispatch_semaphore_t v5 = dispatch_semaphore_create(0);
  v13[0] = MEMORY[0x1E4F143A8];
  v13[1] = 3221225472;
  v13[2] = sub_1AFB73DD0;
  v13[3] = &unk_1E5F8E960;
  BOOL v16 = &v17;
  id v6 = v4;
  id v14 = v6;
  id v7 = v5;
  __int16 v15 = v7;
  [v6 setCompletionHandler:v13];
  [v6 start];
  dispatch_time_t v8 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v7, v8) && IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v12 = 0;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "timeout waiting for completionHandler from SFCoordinatedAlertRequest", v12, 2u);
    }
  }
  char v10 = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return v10;
}

- (BOOL)_UTITypeMightBeAnimated:(id)a3
{
  CFStringRef v3 = (const __CFString *)a3;
  id v4 = (__CFString *)v3;
  BOOL v5 = v3
    && (UTTypeConformsTo(v3, (CFStringRef)*MEMORY[0x1E4F225D8])
     || UTTypeConformsTo(v4, (CFStringRef)*MEMORY[0x1E4F22678]));

  return v5;
}

- (id)_notificationsSafePreviewFileURLForTransferURL:(id)a3 utiType:(id)a4 knownSender:(BOOL)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = IMPreviewExtension();
  char v10 = IMAttachmentPreviewFileURL();

  if ([(IMDNotificationsController *)self _UTITypeMightBeAnimated:v8]
    && [(IMDNotificationsController *)self imagePreviewIsMultiFrameAtFileURL:v10])
  {
    if (IMOSLoggingEnabled())
    {
      char v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "The image is animated - lets copy the first frame", buf, 2u);
      }
    }
    int v12 = [MEMORY[0x1E4F28CB8] defaultManager];
    int v13 = [v10 lastPathComponent];
    id v14 = objc_msgSend(v12, "im_randomTemporaryFileURLWithFileName:", v13);

    if (v14)
    {
      if ([(IMDNotificationsController *)self copyFirstFrameOfMultiFrameImageAtFileURL:v10 toFileURL:v14])
      {
        goto LABEL_24;
      }

      __int16 v15 = IMLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1AFC63AC4();
      }
    }
    else
    {
      __int16 v15 = IMLogHandleForCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
        sub_1AFC63A90();
      }
    }
    id v14 = 0;
  }
  else
  {
    if (!v10
      || ([MEMORY[0x1E4F28CB8] defaultManager],
          BOOL v16 = objc_claimAutoreleasedReturnValue(),
          [v10 path],
          uint64_t v17 = objc_claimAutoreleasedReturnValue(),
          int v18 = [v16 fileExistsAtPath:v17],
          v17,
          v16,
          !v18))
    {
      id v14 = 0;
      goto LABEL_24;
    }
    uint64_t v19 = IMSafeTemporaryDirectory();
    char v20 = [v19 path];
    int v21 = [v10 lastPathComponent];
    uint64_t v22 = [v20 stringByAppendingPathComponent:v21];

    id v14 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v22 isDirectory:0];
    int v23 = [MEMORY[0x1E4F28CB8] defaultManager];
    id v26 = 0;
    [v23 copyItemAtURL:v10 toURL:v14 error:&v26];
    __int16 v15 = v26;

    if (v15 && IMOSLoggingEnabled())
    {
      BOOL v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        int v28 = v15;
        _os_log_impl(&dword_1AFB53000, v24, OS_LOG_TYPE_INFO, "Error when copy preview image: [%@]", buf, 0xCu);
      }
    }
  }

LABEL_24:
  return v14;
}

- (BOOL)_handleIsSpokenMessageAllowlisted:(id)a3 chat:(id)a4 message:(id)a5
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unint64_t v11 = [(IMDNotificationsController *)self _getMessagesSpokenAllowlistLevel:0];
  if (IMOSLoggingEnabled())
  {
    int v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v25 = 134217984;
      double v26 = *(double *)&v11;
      _os_log_impl(&dword_1AFB53000, v12, OS_LOG_TYPE_INFO, "SpokenMessageAllowlistLevel: %lu", (uint8_t *)&v25, 0xCu);
    }
  }
  if (v11 == 3)
  {
LABEL_11:
    int v13 = 1;
    goto LABEL_30;
  }
  if (v11 != 2)
  {
    if (v11 != 1 && [(IMDNotificationsController *)self _messageIsFromKnownContact:v10])
    {
      if (v11 == 4)
      {
        int v13 = [(IMDNotificationsController *)self _messageIsFromFavorite:v10];
        goto LABEL_30;
      }
      goto LABEL_11;
    }
    goto LABEL_29;
  }
  id v14 = [v9 objectForKey:@"__kchatLastMessageTimestamp"];
  uint64_t v15 = [v14 longLongValue];

  if (IMOSLoggingEnabled())
  {
    BOOL v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v25 = 134217984;
      double v26 = (double)v15;
      _os_log_impl(&dword_1AFB53000, v16, OS_LOG_TYPE_INFO, "Last message timestamp: %f", (uint8_t *)&v25, 0xCu);
    }
  }
  if (!v15)
  {
    if (IMOSLoggingEnabled())
    {
      char v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v21 = [v9 valueForKey:@"__kchatChatGUIDKey"];
        int v25 = 138412290;
        double v26 = *(double *)&v21;
        _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "Missing last read date for chatID %@", (uint8_t *)&v25, 0xCu);
      }
    }
LABEL_29:
    int v13 = 0;
    goto LABEL_30;
  }
  uint64_t v17 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v15);
  if (IMOSLoggingEnabled())
  {
    int v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v25 = 138412290;
      double v26 = *(double *)&v17;
      _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "Last message date: %@", (uint8_t *)&v25, 0xCu);
    }
  }
  uint64_t v19 = [MEMORY[0x1E4F1C9A8] currentCalendar];
  if ([v19 isDateInToday:v17]) {
    int v13 = 1;
  }
  else {
    int v13 = [v19 isDateInYesterday:v17];
  }

LABEL_30:
  if (IMOSLoggingEnabled())
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      int v23 = [v10 valueForKey:@"__kmessageGUIDKey"];
      int v25 = 138412546;
      double v26 = *(double *)&v23;
      __int16 v27 = 1024;
      int v28 = v13;
      _os_log_impl(&dword_1AFB53000, v22, OS_LOG_TYPE_INFO, "Message: %@ is spoken message allowlisted: %d", (uint8_t *)&v25, 0x12u);
    }
  }

  return v13;
}

- (unint64_t)_getSpokenMessageAllowlistLevelVersion
{
  id v2 = [(IMDNotificationsController *)self defaultsSharedInstance];
  CFStringRef v3 = [v2 getValueFromDomain:@"com.apple.MobileSMS" forKey:@"kSpokenMessageWhitelistLevelVersion"];
  unint64_t v4 = [v3 unsignedIntegerValue];

  return v4;
}

- (void)_setSpokenMessageAllowlistLevelVersion:(unint64_t)a3
{
  id v5 = [(IMDNotificationsController *)self defaultsSharedInstance];
  unint64_t v4 = [NSNumber numberWithUnsignedInteger:a3];
  [v5 setValue:v4 forDomain:@"com.apple.MobileSMS" forKey:@"kSpokenMessageWhitelistLevelVersion"];
}

- (id)_lastMessageTimeForChat:(id)a3
{
  CFStringRef v3 = [(IMDNotificationsController *)self _lastTwoMessagesForChat:a3];
  if ([v3 count] == 2)
  {
    unint64_t v4 = [v3 firstObject];
    id v5 = [v4 date];
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)_lastTwoMessagesForChat:(id)a3
{
  CFStringRef v3 = (void *)IMDChatRecordCopyMessagesWithLimit((uint64_t)a3, 2);
  return v3;
}

- (BOOL)_messageIsFromFavorite:(id)a3
{
  id v3 = a3;
  unint64_t v4 = objc_alloc_init(IMDCNPersonAliasResolver);
  id v5 = [v3 objectForKey:@"__kmessageCNContactForSenderKey"];

  LOBYTE(v3) = [(IMDCNPersonAliasResolver *)v4 isCNContactFavorited:v5];
  return (char)v3;
}

- (unint64_t)_getMessagesSpokenAllowlistLevel:(BOOL *)a3
{
  CFPreferencesAppSynchronize(@"com.apple.MobileSMS");
  Boolean keyExistsAndHasValidFormat = 0;
  unint64_t result = CFPreferencesGetAppIntegerValue(@"kSpokenMessageWhitelistLevel", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
  if (a3) {
    *a3 = keyExistsAndHasValidFormat == 0;
  }
  return result;
}

- (void)_setMessagesSpokenAllowlistLevelInPreferences:(unint64_t)a3
{
  id v5 = [(IMDNotificationsController *)self defaultsSharedInstance];
  unint64_t v4 = [NSNumber numberWithInteger:a3];
  [v5 setValue:v4 forDomain:@"com.apple.MobileSMS" forKey:@"kSpokenMessageWhitelistLevel"];
}

+ (id)_truncateNameIfNeeded:(id)a3
{
  id v3 = a3;
  unint64_t v4 = v3;
  if ((unint64_t)[v3 length] >= 0xC9)
  {
    unint64_t v4 = objc_msgSend(v3, "substringWithRange:", 0, 200);
  }
  return v4;
}

+ (id)_addressBookNameForAddress:(id)a3 orContact:(id)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7) {
    goto LABEL_11;
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v15) = 0;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "We don't have a contact to use. Fetching one", (uint8_t *)&v15, 2u);
    }
  }
  id v10 = [v6 _stripFZIDPrefix];
  id v8 = [a1 _IMDCoreSpotlightCNContactForAddress:v10];
  if (IMOSLoggingEnabled())
  {
    unint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v15 = 138412546;
      BOOL v16 = v10;
      __int16 v17 = 2112;
      int v18 = v8;
      _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "Stripped address: %@, contactToUse: %@", (uint8_t *)&v15, 0x16u);
    }
  }
  if (v8)
  {
LABEL_11:
    int v12 = [MEMORY[0x1E4F6E6D8] displayNameForContact:v8];
    if (IMOSLoggingEnabled())
    {
      int v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v15 = 138412290;
        BOOL v16 = v12;
        _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Contact to use valid. AddressBookName : %@", (uint8_t *)&v15, 0xCu);
      }
    }
  }
  else
  {
    int v12 = 0;
  }

  return v12;
}

+ (id)_uncanonicalizedAddressForHandle:(id)a3
{
  return (id)[a3 uncanonicalizedURIString];
}

+ (id)_addressForHandle:(id)a3
{
  id v4 = a3;
  id v5 = [v4 canonicalizedURIString];
  id v6 = v5;
  if (!v5 || ![v5 length])
  {
    uint64_t v7 = [a1 _uncanonicalizedAddressForHandle:v4];

    id v6 = (void *)v7;
  }

  return v6;
}

+ (id)_countryCodeForHandle:(id)a3
{
  return (id)MEMORY[0x1F4181798](a3, sel_countryCodeString);
}

+ (id)_formattedDisplayStringForAddress:(id)a3 countryCode:(id)a4
{
  return (id)MEMORY[0x1F4123740](a3, a4, 0);
}

+ (id)_database
{
  return +[IMDDatabase synchronousDatabase];
}

+ (id)_displayNameForHandle:(id)a3 andContact:(id)a4 businessNameManager:(id)a5 suggestionProvider:(id)a6
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (void (**)(id, void *))a6;
  id v14 = [(id)objc_opt_class() _addressForHandle:v10];
  int v15 = objc_msgSend(v14, "im_stripCategoryLabel");

  if ([v15 hasSuffix:*MEMORY[0x1E4F6D2C0]])
  {
    BOOL v16 = IMSharedUtilitiesFrameworkBundle();
    __int16 v17 = [v16 localizedStringForKey:@"TS_NOTIFICATION_EMERGENCY_SOS_HANDLE" value:&stru_1F084E970 table:@"IMSharedUtilities-SYDROB_FEATURES"];
  }
  else
  {
    __int16 v17 = 0;
  }
  int v18 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v19 = [v18 stewieEnabled];

  if (v19)
  {
    if (IMIsStringStewieEmergency())
    {
      char v20 = IMSharedUtilitiesFrameworkBundle();
      uint64_t v21 = [v20 localizedStringForKey:@"STEWIE_NOTIFICATION_EMERGENCY_SOS_HANDLE" value:&stru_1F084E970 table:@"IMSharedUtilities-SYDROB_FEATURES"];
      goto LABEL_7;
    }
    if (IMIsStringStewieRoadside())
    {
      int v23 = [a1 _database];
      BOOL v24 = [v23 chatRecordsWithIdentifier:v15];
      char v20 = [v24 firstObject];

      if (v20)
      {
        uint64_t v25 = [a1 _displayNameForChatRecord:v20];

        __int16 v17 = (void *)v25;
      }
      if (v17) {
        goto LABEL_12;
      }
      __int16 v17 = IMSharedUtilitiesFrameworkBundle();
      uint64_t v21 = [v17 localizedStringForKey:@"STEWIE_NOTIFICATION_ROADSIDE_HANDLE" value:&stru_1F084E970 table:@"IMSharedUtilities-Avocet"];
LABEL_7:
      uint64_t v22 = (void *)v21;

      __int16 v17 = v22;
LABEL_12:
    }
  }
  if (![v17 length]
    && ((MEMORY[0x1B3E899E0](v15) & 1) != 0 || objc_msgSend(v15, "__im_isChatBot")))
  {
    uint64_t v26 = [(id)objc_opt_class() _displayNameForBusinessChatAddress:v15 businessNameManager:v12];

    __int16 v17 = (void *)v26;
  }
  if (![v17 length]
    && (!v11 || [MEMORY[0x1E4F6E6D8] isCNContactAKnownContact:v11]))
  {
    uint64_t v27 = [(id)objc_opt_class() _addressBookNameForAddress:v15 orContact:v11];

    __int16 v17 = (void *)v27;
  }
  if (IMOSLoggingEnabled())
  {
    int v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      int v42 = 138412802;
      __int16 v43 = v15;
      __int16 v44 = 2112;
      __int16 v45 = v17;
      __int16 v46 = 2112;
      id v47 = v11;
      _os_log_impl(&dword_1AFB53000, v28, OS_LOG_TYPE_INFO, "Address: %@, displayName = %@. Contact = %@", (uint8_t *)&v42, 0x20u);
    }
  }
  uint64_t v29 = [v17 length];
  if (v13 && !v29)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        LOWORD(v42) = 0;
        _os_log_impl(&dword_1AFB53000, v30, OS_LOG_TYPE_INFO, "We don't have an address book name, so going to try and suggest a name", (uint8_t *)&v42, 2u);
      }
    }
    uint64_t v31 = v13[2](v13, v15);

    __int16 v17 = (void *)v31;
  }
  if ([v17 length])
  {
    int v32 = v17;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        LOWORD(v42) = 0;
        _os_log_impl(&dword_1AFB53000, v33, OS_LOG_TYPE_INFO, "Defaulting to the handle for the display name", (uint8_t *)&v42, 2u);
      }
    }
    int v34 = [(id)objc_opt_class() _countryCodeForHandle:v10];
    int v32 = [(id)objc_opt_class() _formattedDisplayStringForAddress:v15 countryCode:v34];

    uint64_t v35 = [(id)objc_opt_class() _uncanonicalizedAddressForHandle:v10];
    uint64_t v36 = [v35 lowercaseString];
    int v37 = [v32 isEqualToString:v36];

    if (v37)
    {
      if (IMOSLoggingEnabled())
      {
        int v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          LOWORD(v42) = 0;
          _os_log_impl(&dword_1AFB53000, v38, OS_LOG_TYPE_INFO, "Handle display name is equal to lowercase uncanonicalized address, falling back to preserve case", (uint8_t *)&v42, 2u);
        }
      }
      id v39 = v35;

      int v32 = v39;
    }
  }
  if (IMOSLoggingEnabled())
  {
    char v40 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      int v42 = 138412290;
      __int16 v43 = v32;
      _os_log_impl(&dword_1AFB53000, v40, OS_LOG_TYPE_INFO, "Display name = %@", (uint8_t *)&v42, 0xCu);
    }
  }
  return v32;
}

- (id)_displayNameForHandle:(id)a3 andContact:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = objc_opt_class();
  id v9 = [(IMDNotificationsController *)self businessNameManager];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB75354;
  v12[3] = &unk_1E5F8E988;
  v12[4] = self;
  id v10 = [v8 _displayNameForHandle:v7 andContact:v6 businessNameManager:v9 suggestionProvider:v12];

  return v10;
}

- (id)_displayNameForHandle:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDNotificationsController *)self contactForHandleRecord:v4];
  id v6 = [(IMDNotificationsController *)self _displayNameForHandle:v4 andContact:v5];

  return v6;
}

- (id)_suggestedDisplayNameForAddress:(id)a3
{
  return _IMDCoreSpotlightSuggestedNameForAddress(a3);
}

- (id)_nicknameDisplayNameForID:(id)a3
{
  id v3 = _IMDCoreSpotlightNicknameForAddress(a3);
  id v4 = _IMDContactNameForNickname(v3, 1);

  return v4;
}

+ (id)_displayNameForBusinessChatAddress:(id)a3 businessNameManager:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  dispatch_semaphore_t v7 = dispatch_semaphore_create(0);
  uint64_t v23 = 0;
  BOOL v24 = &v23;
  uint64_t v25 = 0x3032000000;
  uint64_t v26 = sub_1AFB756EC;
  uint64_t v27 = sub_1AFB756FC;
  id v28 = 0;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1AFB75704;
  v20[3] = &unk_1E5F8E9B0;
  uint64_t v22 = &v23;
  id v8 = v7;
  uint64_t v21 = v8;
  id v9 = [v6 businessNameForUID:v5 updateHandler:v20];
  id v10 = v9;
  if (v9)
  {
    id v11 = v9;
LABEL_3:
    id v12 = v11;
    goto LABEL_12;
  }
  dispatch_time_t v13 = dispatch_time(0, 3000000000);
  if (dispatch_semaphore_wait(v8, v13))
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v19 = 0;
        _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "Business name lookup timed out", v19, 2u);
      }
    }
  }
  else
  {
    int v15 = (void *)v24[5];
    if (v15)
    {
      id v11 = v15;
      goto LABEL_3;
    }
  }
  BOOL v16 = IMSharedUtilitiesFrameworkBundle();
  id v12 = [v16 localizedStringForKey:@"BUSINESS_NOTIFICATION_TITLE" value:&stru_1F084E970 table:@"IMSharedUtilities"];

LABEL_12:
  id v17 = v12;

  _Block_object_dispose(&v23, 8);
  return v17;
}

- (BOOL)_filteringSettingConfirmed
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  int v3 = IMSharedHelperDeviceIsiPad();
  id v4 = [(IMDNotificationsController *)self defaultsSharedInstance];
  int v5 = [v4 getBoolFromDomain:@"com.apple.carrier" forKey:@"ShowMessagesConversationListFilteringPrompt"];

  if (IMSharedHelperDeviceHasMultipleSubscriptions()) {
    int v6 = [MEMORY[0x1E4F6E660] IMMessagesFilteringSettingForPreferedSubscription];
  }
  else {
    int v6 = v3 | v5;
  }
  if (IMOSLoggingEnabled())
  {
    dispatch_semaphore_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = @"NO";
      if (v3) {
        id v9 = @"YES";
      }
      else {
        id v9 = @"NO";
      }
      if (v6) {
        id v10 = @"YES";
      }
      else {
        id v10 = @"NO";
      }
      int v14 = 138412802;
      int v15 = v9;
      __int16 v16 = 2112;
      id v17 = v10;
      if (v5) {
        id v8 = @"YES";
      }
      __int16 v18 = 2112;
      int v19 = v8;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, " deviceIsiPad %@ allowPromptToConfirmSetting %@ carrier setting %@", (uint8_t *)&v14, 0x20u);
    }
  }
  if (!v6) {
    return 1;
  }
  id v11 = [(IMDNotificationsController *)self defaultsSharedInstance];
  char v12 = [v11 getBoolFromDomain:@"com.apple.MobileSMS" forKey:@"MessageFilteringSettingsConfirmed"];

  return v12;
}

- (BOOL)_deviceIsElgibileToBeForcedIntoFilteringUnknownSenders
{
  int v3 = [MEMORY[0x1E4F6E730] IMDeviceRegionIsEligibleToBeForcedIntoFilteringUnknownSender];
  if (v3) {
    LOBYTE(v3) = ![(IMDNotificationsController *)self _filteringSettingConfirmed];
  }
  return v3;
}

+ (BOOL)isUnknownSenderFilteringOn
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  int v3 = [MEMORY[0x1E4F6E720] sharedInstance];
  id v4 = [v3 getValueFromDomain:@"com.apple.MobileSMS" forKey:@"IncomingMessageAlertFiltration"];

  if (v4)
  {
    LOBYTE(v5) = [v4 BOOLValue];
  }
  else
  {
    int v6 = [a1 sharedInstance];
    int v5 = [v6 _deviceIsElgibileToBeForcedIntoFilteringUnknownSenders];

    if (IMOSLoggingEnabled())
    {
      dispatch_semaphore_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = @"NO";
        if (v5) {
          id v8 = @"YES";
        }
        int v10 = 138412290;
        id v11 = v8;
        _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "We have never set the filtering default, check if we should be doing it by default %@", (uint8_t *)&v10, 0xCu);
      }
    }
  }

  return v5;
}

+ (BOOL)isSpamFilteringOn
{
  id v2 = [MEMORY[0x1E4F6E720] sharedInstance];
  char v3 = [v2 getBoolFromDomain:@"com.apple.MobileSMS" forKey:@"IncomingMessageAlertSpamFiltration"];

  return v3;
}

- (BOOL)_messageIsFromKnownContact:(id)a3
{
  char v3 = [a3 objectForKey:@"__kmessageCNContactForSenderKey"];
  char v4 = [MEMORY[0x1E4F6E6D8] isCNContactAKnownContact:v3];

  return v4;
}

- (BOOL)_messageIsBusiness:(id)a3
{
  char v3 = [a3 objectForKey:@"__kmessageHandleKey"];
  uint64_t v4 = [(id)objc_opt_class() _addressForHandle:v3];
  int v5 = (void *)v4;
  if (v4)
  {
    if (MEMORY[0x1B3E899E0](v4)) {
      char v6 = 1;
    }
    else {
      char v6 = objc_msgSend(v5, "__im_isChatBot");
    }
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (BOOL)_messageIsStewieEmergency:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint64_t v4 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v5 = [v4 stewieEnabled];

  if (v5)
  {
    char v6 = [v3 objectForKey:@"__kmessageHandleKey"];
    uint64_t v7 = [(id)objc_opt_class() _addressForHandle:v6];
    id v8 = (void *)v7;
    if (v7)
    {
      int v9 = MEMORY[0x1B3E89A20](v7);
      if (IMOSLoggingEnabled())
      {
        int v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = @"NO";
          if (v9) {
            id v11 = @"YES";
          }
          int v13 = 138412290;
          int v14 = v11;
          _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "Sender is Stewie emergency: %@", (uint8_t *)&v13, 0xCu);
        }
      }
    }
    else
    {
      LOBYTE(v9) = 0;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return v9;
}

- (BOOL)_notificationIsFromAFilteredSender:(id)a3 messageDictionary:(id)a4
{
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 objectForKey:@"__kmessageServiceKey"];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F6E1A0]];
  int v30 = [(id)objc_opt_class() isUnknownSenderFilteringOn];
  int v10 = [(id)objc_opt_class() isSpamFilteringOn];
  id v11 = [v6 objectForKey:@"__kchatIsFilteredKey"];
  if ([v11 BOOLValue])
  {
    int v29 = 1;
  }
  else
  {
    uint64_t v12 = [v6 objectForKey:@"__kchatWasReportedAsiMessageSpamKey"];
    int v29 = [v12 BOOLValue];
  }
  int v13 = [v6 objectForKey:@"__kchatSMSCategoryKey"];
  if ([v13 intValue] == 1)
  {
    LODWORD(v14) = 1;
  }
  else
  {
    uint64_t v15 = [v6 objectForKey:@"__kchatWasDetectedAsSMSSpamKey"];
    if ([v15 BOOLValue])
    {
      LODWORD(v14) = 1;
    }
    else
    {
      __int16 v16 = [v6 objectForKey:@"__kchatWasReportedAsiMessageSpamKey"];
      if ([v16 BOOLValue])
      {
        LODWORD(v14) = 1;
      }
      else
      {
        id v28 = [v6 objectForKey:@"__kchatWasDetectedAsiMessageSpamKey"];
        if ([v28 BOOLValue])
        {
          LODWORD(v14) = 1;
        }
        else
        {
          uint64_t v27 = [v7 objectForKey:@"__kmessageFlagsKey"];
          unint64_t v14 = ((unint64_t)[v27 integerValue] >> 27) & 1;
        }
      }
    }
  }

  BOOL v17 = [(IMDNotificationsController *)self _messageIsFromKnownContact:v7];
  if (IMOSLoggingEnabled())
  {
    __int16 v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v19 = @"NO";
      if (v9) {
        uint64_t v20 = @"YES";
      }
      else {
        uint64_t v20 = @"NO";
      }
      if (v30) {
        uint64_t v21 = @"YES";
      }
      else {
        uint64_t v21 = @"NO";
      }
      *(_DWORD *)int buf = 138413570;
      int v32 = v20;
      if (v10) {
        uint64_t v22 = @"YES";
      }
      else {
        uint64_t v22 = @"NO";
      }
      __int16 v33 = 2112;
      int v34 = v21;
      if (v29) {
        uint64_t v23 = @"YES";
      }
      else {
        uint64_t v23 = @"NO";
      }
      __int16 v35 = 2112;
      uint64_t v36 = v22;
      if (v14) {
        BOOL v24 = @"YES";
      }
      else {
        BOOL v24 = @"NO";
      }
      __int16 v37 = 2112;
      int v38 = v23;
      if (v17) {
        int v19 = @"YES";
      }
      __int16 v39 = 2112;
      char v40 = v24;
      __int16 v41 = 2112;
      int v42 = v19;
      _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "isSMS %@ unknownFilterinOn %@ smsSpamFilteringOn %@ chatIsFiltered %@ isSpam %@ isContact %@", buf, 0x3Eu);
    }
  }
  if (v9 | v14 ^ 1) {
    BOOL v25 = v9 & v10 & v14 & !v17;
  }
  else {
    BOOL v25 = !v17;
  }

  return v25;
}

- (BOOL)_chatIsMuted:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"__kchatIsMutedKey"];
  char v4 = [v3 BOOLValue];

  return v4;
}

- (BOOL)_chatHasCategoryMuted:(id)a3 isFromContact:(BOOL)a4
{
  id v6 = a3;
  int v7 = [(id)objc_opt_class() isUnknownSenderFilteringOn];
  int v8 = [(id)objc_opt_class() isSpamFilteringOn];
  int v9 = [v6 objectForKey:@"__kchatIsFilteredKey"];

  uint64_t v10 = [v9 intValue] & 0xF;
  switch(v10)
  {
    case 1:
      if (a4) {
        return 0;
      }
      uint64_t v12 = [(IMDNotificationsController *)self defaultsSharedInstance];
      int v13 = v12;
      unint64_t v14 = @"IncomingMessageAlertFiltrationUnknownSenders";
      break;
    case 2:
      return 1;
    case 3:
      BOOL result = 0;
      if ((v7 & v8) != 1 || a4) {
        return result;
      }
      uint64_t v12 = [(IMDNotificationsController *)self defaultsSharedInstance];
      int v13 = v12;
      unint64_t v14 = @"IncomingMessageAlertFiltrationPromotions";
      break;
    case 4:
      BOOL result = 0;
      if ((v7 & v8) != 1 || a4) {
        return result;
      }
      uint64_t v12 = [(IMDNotificationsController *)self defaultsSharedInstance];
      int v13 = v12;
      unint64_t v14 = @"IncomingMessageAlertFiltrationTransactions";
      break;
    default:
      return 0;
  }
  char v15 = [v12 getBoolFromDomain:@"com.apple.MobileSMS" forKey:v14];

  return v15;
}

- (BOOL)_shouldPostNotificationForChat:(id)a3 messageDictionary:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [MEMORY[0x1E4F6E5D8] sharedManager];
  if (![v8 shouldFilterIncomingMessages])
  {
    int v10 = 1;
    if (!v6) {
      goto LABEL_26;
    }
    goto LABEL_10;
  }
  int v9 = [(IMDNotificationsController *)self _handleIDsForChatDictionary:v6];
  int v10 = [v8 allowsConversationWithHandleIDs:v9];
  if ((v10 & 1) == 0 && IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v20) = 0;
      _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "We are not posting the notification in Assistive Access because this conversation is not allowed.", (uint8_t *)&v20, 2u);
    }
  }
  if (v6)
  {
LABEL_10:
    if (v10)
    {
      BOOL v12 = [(IMDNotificationsController *)self _chatIsMuted:v6];
      BOOL v13 = [(IMDNotificationsController *)self _notificationIsFromAFilteredSender:v6 messageDictionary:v7];
      BOOL v14 = [(IMDNotificationsController *)self _chatHasCategoryMuted:v6 isFromContact:[(IMDNotificationsController *)self _messageIsFromKnownContact:v7]];
      if (v12 || v13 || v14)
      {
        if (IMOSLoggingEnabled())
        {
          char v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            __int16 v16 = @"NO";
            if (v12) {
              BOOL v17 = @"YES";
            }
            else {
              BOOL v17 = @"NO";
            }
            if (v13) {
              __int16 v18 = @"YES";
            }
            else {
              __int16 v18 = @"NO";
            }
            int v20 = 138412802;
            uint64_t v21 = v17;
            __int16 v22 = 2112;
            uint64_t v23 = v18;
            if (v14) {
              __int16 v16 = @"YES";
            }
            __int16 v24 = 2112;
            BOOL v25 = v16;
            _os_log_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_INFO, "We are not posting the notification because chat is muted (%@)                                                 or it's from a filtered unknown sender (%@)                                                 or the chat category is muted (%@)", (uint8_t *)&v20, 0x20u);
          }
        }
        LOBYTE(v10) = 0;
      }
      else
      {
        LOBYTE(v10) = 1;
      }
    }
  }
LABEL_26:

  return v10;
}

- (BOOL)_isUnknownSenders:(id)a3
{
  if (!a3) {
    return 0;
  }
  id v3 = [a3 objectForKey:@"__kchatIsFilteredKey"];
  int v4 = [v3 intValue];

  return v4 == 1;
}

- (id)allTokens
{
  id v3 = [(IMDNotificationsController *)self meTokens];
  int v4 = [(IMDNotificationsController *)self activeAccountAliases];
  int v5 = [v3 setByAddingObjectsFromSet:v4];

  return v5;
}

- (BOOL)_amIMentionedInMessage:(id)a3
{
  id v4 = a3;
  int v5 = [(IMDNotificationsController *)self allTokens];
  id v6 = (void *)[v5 mutableCopy];

  id v7 = [v4 objectForKey:@"__kmessageDestinationCallerIDKey"];
  int v8 = v7;
  if (v7 && [v7 length]) {
    [v6 addObject:v8];
  }
  if ([v6 count]) {
    BOOL v9 = [(IMDNotificationsController *)self areMyTokens:v6 inMessage:v4];
  }
  else {
    BOOL v9 = 0;
  }

  return v9;
}

- (BOOL)areMyTokens:(id)a3 inMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v15 = 0;
  __int16 v16 = &v15;
  uint64_t v17 = 0x2020000000;
  char v18 = 0;
  id v7 = [v6 objectForKey:@"__kmessageAttributedBodyKey"];
  uint64_t v8 = [v7 length];
  uint64_t v9 = *MEMORY[0x1E4F6D538];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1AFB76760;
  v12[3] = &unk_1E5F8E9D8;
  id v10 = v5;
  id v13 = v10;
  BOOL v14 = &v15;
  objc_msgSend(v7, "enumerateAttribute:inRange:options:usingBlock:", v9, 0, v8, 0, v12);
  LOBYTE(v8) = *((unsigned char *)v16 + 24);

  _Block_object_dispose(&v15, 8);
  return v8;
}

- (BOOL)_shouldOverrideChatSilencingBecauseImMentioned:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 objectForKey:@"__kmessageServiceKey"];
  int v6 = [v5 isEqualToString:*MEMORY[0x1E4F6E1A0]];

  BOOL v7 = [(IMDNotificationsController *)self _messageIsBusiness:v4];
  BOOL v8 = v7;
  if ((v6 & 1) != 0
    || v7
    || ![(IMDNotificationsController *)self _overrideDNDForMessagesAddressingMe])
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = @"NO";
        if (v6) {
          BOOL v12 = @"YES";
        }
        else {
          BOOL v12 = @"NO";
        }
        int v14 = 138412802;
        uint64_t v15 = @"NO";
        __int16 v16 = 2112;
        uint64_t v17 = v12;
        if (v8) {
          id v11 = @"YES";
        }
        __int16 v18 = 2112;
        int v19 = v11;
        _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "not overriding chat silencing because override message mentions me is (%@) isSMS (%@) isBusinessChat (%@).", (uint8_t *)&v14, 0x20u);
      }
    }
    BOOL v9 = 0;
  }
  else
  {
    BOOL v9 = [(IMDNotificationsController *)self _amIMentionedInMessage:v4];
  }

  return v9;
}

- (BOOL)_shouldPostNotificationRequest:(id)a3 withCurrentlyPostedNotifications:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 identifier];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v8 = v6;
  uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v28;
LABEL_3:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v28 != v10) {
        objc_enumerationMutation(v8);
      }
      BOOL v12 = *(void **)(*((void *)&v27 + 1) + 8 * v11);
      id v13 = [v12 request];
      int v14 = [v13 identifier];
      int v15 = [v14 isEqualToString:v7];

      if (v15) {
        break;
      }

      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v27 objects:v37 count:16];
        if (v9) {
          goto LABEL_3;
        }
        goto LABEL_20;
      }
    }
    id v16 = v12;
    if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412802;
        int v32 = v7;
        __int16 v33 = 2112;
        int v34 = v13;
        __int16 v35 = 2112;
        id v36 = v5;
        _os_log_impl(&dword_1AFB53000, v17, OS_LOG_TYPE_INFO, "Request %@ is already delivered {deliveredRequest: %@ currentRequest: %@}", buf, 0x20u);
      }
    }
    if (!v16) {
      goto LABEL_21;
    }
    BOOL v18 = [(IMDNotificationsController *)self _shouldRepostNotification:v5 withAlreadyPostedNotification:v16];
    int v19 = IMOSLoggingEnabled();
    if (v18)
    {
      if (v19)
      {
        uint64_t v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)int buf = 138412290;
          int v32 = v7;
          _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "Re-posting notification %@ that has already been delivered", buf, 0xCu);
        }
      }
      goto LABEL_21;
    }
    if (v19)
    {
      __int16 v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        int v32 = v7;
        _os_log_impl(&dword_1AFB53000, v24, OS_LOG_TYPE_INFO, "Not re-posting notification %@ that has already been delivered", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      BOOL v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        int v32 = v7;
        _os_log_impl(&dword_1AFB53000, v25, OS_LOG_TYPE_INFO, "We will NOT post the notification request %@", buf, 0xCu);
      }
    }
    BOOL v22 = 0;
  }
  else
  {
LABEL_20:

    id v16 = 0;
LABEL_21:
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        int v32 = v7;
        _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "We will post the notification request %@", buf, 0xCu);
      }
    }
    BOOL v22 = 1;
  }

  return v22;
}

- (BOOL)_shouldRepostNotification:(id)a3 withAlreadyPostedNotification:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 identifier];
  id v8 = [v6 request];
  uint64_t v9 = [v8 content];

  uint64_t v10 = [v5 content];
  unint64_t v11 = [v9 interruptionLevel];
  unint64_t v12 = [v10 interruptionLevel];
  if (v12 > v11 && IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v30 = 138412802;
      uint64_t v31 = v7;
      __int16 v32 = 2048;
      unint64_t v33 = v12;
      __int16 v34 = 2048;
      unint64_t v35 = v11;
      _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Will re-post notification request %@ because the requestedInterruptionLevel:%ld has been escalated above postedInterruptionLevel:%ld", (uint8_t *)&v30, 0x20u);
    }
  }
  int v14 = [v9 communicationContext];
  int v15 = [v10 communicationContext];
  int v16 = [v14 notifyRecipientAnyway];
  if ((v16 | [v15 notifyRecipientAnyway] ^ 1))
  {
    if (v12 <= v11)
    {
      uint64_t v17 = [v9 body];
      BOOL v18 = [v10 body];
      if (![v17 length] || (objc_msgSend(v17, "isEqualToString:", v18) & 1) != 0)
      {

        int v19 = [v9 attachments];
        uint64_t v20 = [v10 attachments];
        id v21 = v19;
        id v22 = v20;
        uint64_t v23 = v22;
        if (v21 == v22)
        {
        }
        else
        {
          if (!v21 || !v22)
          {

LABEL_29:
            if (IMOSLoggingEnabled())
            {
              long long v29 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
              {
                int v30 = 138412290;
                uint64_t v31 = v7;
                _os_log_impl(&dword_1AFB53000, v29, OS_LOG_TYPE_INFO, "Will re-post notification request %@ because attachment are different", (uint8_t *)&v30, 0xCu);
              }
            }
            BOOL v27 = 1;
            goto LABEL_34;
          }
          char v24 = [v21 isEqualToArray:v22];

          if ((v24 & 1) == 0) {
            goto LABEL_29;
          }
        }
        BOOL v27 = 0;
LABEL_34:

        goto LABEL_25;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          int v30 = 138412290;
          uint64_t v31 = v7;
          _os_log_impl(&dword_1AFB53000, v26, OS_LOG_TYPE_INFO, "Will re-post notification request %@ because the message content has been edited", (uint8_t *)&v30, 0xCu);
        }
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    BOOL v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      int v30 = 138412290;
      uint64_t v31 = v7;
      _os_log_impl(&dword_1AFB53000, v25, OS_LOG_TYPE_INFO, "Will re-post notification request %@ because the notification has been escalated to notifyAnyway", (uint8_t *)&v30, 0xCu);
    }
  }
  BOOL v27 = 1;
LABEL_25:

  return v27;
}

- (unint64_t)screenTimeNotificationOptionsForContext:(id)a3
{
  id v3 = a3;
  if (![v3 allowedByScreenTime])
  {
LABEL_14:
    unint64_t v7 = 4;
    goto LABEL_15;
  }
  if (![v3 applicationCurrentlyLimited])
  {
    unint64_t v7 = 1;
    goto LABEL_15;
  }
  int v4 = [v3 shouldBeAllowedByScreenTimeWhenLimited];
  int v5 = IMOSLoggingEnabled();
  if (!v4)
  {
    if (v5)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v10 = 0;
        _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Disallowing notifications during ScreenTime Comm Limits", v10, 2u);
      }
    }
    goto LABEL_14;
  }
  if (v5)
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "Disallowing notifications during ScreenTime Downtime", buf, 2u);
    }
  }
  unint64_t v7 = 2;
LABEL_15:

  return v7;
}

- (unint64_t)screenTimeNotificationOptionsForChatDictionary:(id)a3
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    int v5 = [(IMDNotificationsController *)self _handleIDsForChatDictionary:v4];
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412290;
        unint64_t v13 = (unint64_t)v5;
        _os_log_impl(&dword_1AFB53000, v6, OS_LOG_TYPE_INFO, "fetch screenTimeNotificationOption for handleIDs: [%@]", (uint8_t *)&v12, 0xCu);
      }
    }
    if (qword_1EB5ABBD0 != -1) {
      dispatch_once(&qword_1EB5ABBD0, &unk_1F084D2B8);
    }
    if ([v5 count])
    {
      unint64_t v7 = (void *)[objc_alloc((Class)qword_1EB5ABBC8) initSynchronouslyWithBundleIdentifier:@"com.apple.MobileSMS"];
      id v8 = [v7 allowableByContactsHandles:v5];
      unint64_t v9 = [(IMDNotificationsController *)self screenTimeNotificationOptionsForContext:v8];
      if (IMOSLoggingEnabled())
      {
        uint64_t v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          int v12 = 134217984;
          unint64_t v13 = v9;
          _os_log_impl(&dword_1AFB53000, v10, OS_LOG_TYPE_INFO, "get screenTimeNotificationOption: [%tu]", (uint8_t *)&v12, 0xCu);
        }
      }
    }
    else
    {
      unint64_t v9 = 1;
    }
  }
  else
  {
    unint64_t v9 = 1;
  }

  return v9;
}

- (id)_handleIDsForChatDictionary:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [MEMORY[0x1E4F1CA48] array];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  int v5 = objc_msgSend(v3, "objectForKeyedSubscript:", @"__kchatHandlesForChatKey", 0);
  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v13 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = [*(id *)(*((void *)&v12 + 1) + 8 * i) canonicalizedURIString];
        if (v10) {
          [v4 addObject:v10];
        }
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v7);
  }

  return v4;
}

- (id)_coreSpotlightChatParticipantsFromChatDictionary:(id)a3 senderHandleID:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v26 = a4;
  int v5 = [a3 objectForKey:@"__kchatParticipantsKey"];
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v28;
    unint64_t v11 = 0x1E5F8C000uLL;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v28 != v10) {
          objc_enumerationMutation(v7);
        }
        long long v13 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v14 = _IMDCoreSpotlightHandleID(v13);
        if (v14)
        {
          long long v15 = _IMDCoreSpotlightCNContactForHandle(v13);
          uint64_t v16 = [v7 count];
          unsigned int v17 = [v26 isEqualToString:v14];
          BOOL v18 = v16 == 1;
          if (v16 == 1) {
            uint64_t v19 = 1;
          }
          else {
            uint64_t v19 = v17;
          }
          if (v18 && (v17 & 1) == 0)
          {
            unint64_t v20 = v11;
            id v21 = _IMDCoreSpotlightCNContactForHandleID(v26);
            id v22 = v21;
            if (v21) {
              uint64_t v19 = objc_msgSend(v21, "_im_isEqualToContact:", v15);
            }
            else {
              uint64_t v19 = 0;
            }

            unint64_t v11 = v20;
          }
          uint64_t v23 = (void *)[objc_alloc(*(Class *)(v11 + 3512)) initWithHandleID:v14 contact:v15 isSender:v19];
          [v6 addObject:v23];
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v9);
  }

  char v24 = (void *)[v6 copy];
  return v24;
}

- (id)_groupPhotoInternalFilePathForGroupPhotoGuid:(id)a3
{
  id v3 = (__CFString *)a3;
  if ([(__CFString *)v3 length])
  {
    id v4 = (__CFString *)IMDAttachmentRecordCopyAttachmentForGUID(v3);
    int v5 = [(__CFString *)v4 path];
  }
  else
  {
    int v5 = 0;
  }

  return v5;
}

- (id)_synthesizedMessagingNotificationContentWithContent:(id)a3 chatDictionary:(id)a4 messageDictionary:(id)a5 isUrgentMessageTrigger:(BOOL)a6
{
  uint64_t v93 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if ([(IMDNotificationsController *)self _messageIsBusiness:v12])
  {
    if (IMOSLoggingEnabled())
    {
      long long v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int buf = 0;
        _os_log_impl(&dword_1AFB53000, v13, OS_LOG_TYPE_INFO, "Not synthesizing notification content from intent, message is a business chat message", buf, 2u);
      }
    }
    id v14 = v10;
  }
  else
  {
    long long v66 = [v12 objectForKey:@"__kmessageGUIDKey"];
    id v70 = [v10 body];
    long long v15 = [v12 objectForKey:@"__kmessageDateKey"];
    uint64_t v16 = [v15 longLongValue];

    long long v65 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithNanosecondTimeIntervalSinceReferenceDate:", (double)v16);
    long long v64 = [v12 objectForKey:@"__kmessageServiceKey"];
    uint64_t v73 = [v12 objectForKey:@"__kmessageHandleKey"];
    long long v63 = [v73 uncanonicalizedURIString];
    _IMDCoreSpotlightHandleID(v73);
    id v74 = (__CFString *)objc_claimAutoreleasedReturnValue();
    id v62 = [v11 objectForKey:@"__kchatChatGUIDKey"];
    uint64_t v71 = [v11 objectForKey:@"__kchatChatIdentifierKey"];
    uint64_t v69 = [v11 objectForKey:@"__kchatGroupNameKey"];
    unsigned int v17 = [v11 objectForKey:@"__kchatStyleKey"];
    char v18 = [v17 intValue];

    uint64_t v19 = [v11 objectForKey:@"__kchatLastAddressedHandleStringKey"];
    uint64_t v61 = [v19 _stripFZIDPrefix];

    long long v72 = [v11 objectForKey:@"__kchatGroupPhotoGuidKey"];
    id v60 = [(IMDNotificationsController *)self _groupPhotoInternalFilePathForGroupPhotoGuid:v72];
    unsigned __int8 v20 = [(IMDNotificationsController *)self _amIMentionedInMessage:v12];
    BOOL v67 = [v12 objectForKey:@"__kmessageThreadOriginatorKey"];
    id v21 = [v67 objectForKey:@"__kmessageFlagsKey"];
    char v22 = [v21 unsignedLongLongValue];

    if (a6)
    {
      LOBYTE(v23) = 1;
    }
    else
    {
      char v24 = [v12 objectForKey:@"__kmessageFlagsKey"];
      unint64_t v23 = ((unint64_t)[v24 unsignedLongLongValue] >> 35) & 1;
    }
    BOOL v25 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v26 = [v25 isTranscriptSharingEnabled];

    if (v26 && [v71 hasPrefix:*MEMORY[0x1E4F6E4A8]])
    {
      uint64_t v27 = [v10 subtitle];

      uint64_t v28 = [v10 body];

      id v74 = @"stewie:eServices";
      uint64_t v69 = (void *)v27;
      id v70 = (void *)v28;
    }
    long long v68 = [(IMDNotificationsController *)self _coreSpotlightChatParticipantsFromChatDictionary:v11 senderHandleID:v74];
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1AFB785A4;
    aBlock[3] = &unk_1E5F8E798;
    aBlock[4] = self;
    v59 = _Block_copy(aBlock);
    long long v29 = _IMDCoreSpotlightNewINInteractionForIncomingMessage(v66, v70, v65, v64, v74, v63, v62, v71, v69, v18, v68, v61, v72, v60, v20, (v22 & 4) != 0, v23, v59);
    long long v30 = [v29 intent];
    if (v30 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      id v56 = v30;
      uint64_t v31 = [v10 userInfo];
      id v58 = [v31 objectForKey:*MEMORY[0x1E4F6DE88]];

      char v57 = [MEMORY[0x1E4F1CB10] URLWithString:v58];
      uint64_t v88 = 0;
      uint64_t v89 = &v88;
      uint64_t v90 = 0x2050000000;
      uint64_t v32 = (void *)qword_1E9AF7FA8;
      uint64_t v91 = qword_1E9AF7FA8;
      if (!qword_1E9AF7FA8)
      {
        *(void *)int buf = MEMORY[0x1E4F143A8];
        uint64_t v84 = 3221225472;
        __int16 v85 = sub_1AFB7CDC0;
        v86 = &unk_1E5F8EB38;
        __int16 v87 = &v88;
        sub_1AFB7CDC0((uint64_t)buf);
        uint64_t v32 = (void *)v89[3];
      }
      id v33 = v32;
      _Block_object_dispose(&v88, 8);
      uint64_t v34 = [v33 messageTypeFromURL:v57];
      if ((objc_opt_respondsToSelector() & (v34 == 3)) == 1)
      {
        id v14 = (id)[v10 mutableCopy];
        id v35 = [MEMORY[0x1E4F44610] iconNamed:@"zelkovaTriggerNotificationIcon" shouldSuppressMask:1];
        [v14 setIcon:v35];
        [v14 setShouldShowSubordinateIcon:1];
      }
      else
      {
        id v55 = [(IMDNotificationsController *)self _tapbackFromMessageDictionary:v12];
        if (v55)
        {
          __int16 v37 = [(IMDNotificationsController *)self _senderDisplayNameForTapback:v55 sendMessageIntent:v56 chatParticipants:v68];
          long long v54 = [(IMDNotificationsController *)self _attributedSummaryOfTapback:v55 messageDictionary:v12 senderDisplayName:v37];
        }
        else
        {
          long long v54 = 0;
        }
        [v12 objectForKeyedSubscript:@"__kmessageAttachmentsKey"];
        long long v80 = 0u;
        long long v81 = 0u;
        long long v78 = 0u;
        long long v79 = 0u;
        id v38 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v39 = [v38 countByEnumeratingWithState:&v78 objects:v92 count:16];
        if (v39)
        {
          uint64_t v40 = *(void *)v79;
          while (2)
          {
            for (uint64_t i = 0; i != v39; ++i)
            {
              if (*(void *)v79 != v40) {
                objc_enumerationMutation(v38);
              }
              if ([*(id *)(*((void *)&v78 + 1) + 8 * i) isAdaptiveImageGlyph])
              {
                int v42 = 0;
                goto LABEL_37;
              }
            }
            uint64_t v39 = [v38 countByEnumeratingWithState:&v78 objects:v92 count:16];
            if (v39) {
              continue;
            }
            break;
          }
        }
        int v42 = 1;
LABEL_37:

        uint64_t v43 = [v12 objectForKeyedSubscript:@"__kmessageExpressiveSendStyleIDKey"];
        int v44 = [v43 isEqualToString:*MEMORY[0x1E4F6D4E0]];

        __int16 v45 = [v12 objectForKeyedSubscript:@"__kmessageAttributedBodyKey"];
        __int16 v46 = v45;
        if (v54)
        {
          id v47 = objc_msgSend((id)MEMORY[0x1B3E89B10](@"UNNotificationAttributedMessageContext", @"UserNotifications"), "contextWithSendMessageIntent:attributedContent:", v56, v54);
          id v77 = 0;
          uint64_t v48 = [v10 contentByUpdatingWithAttributedMessageContext:v47 error:&v77];
          id v35 = v77;
        }
        else if ((v42 | v44) & 1) == 0 && [v45 length] && (objc_opt_respondsToSelector())
        {
          long long v53 = [(IMDNotificationsController *)self _attributedMessageBodyByInsertingAdaptiveImageGlyphsInMessageBody:v46 attachments:v38];
          id v49 = objc_msgSend((id)MEMORY[0x1B3E89B10](@"UNNotificationAttributedMessageContext", @"UserNotifications"), "contextWithSendMessageIntent:attributedContent:", v56, v53);
          id v76 = 0;
          uint64_t v48 = [v10 contentByUpdatingWithAttributedMessageContext:v49 error:&v76];
          id v35 = v76;
        }
        else
        {
          id v75 = 0;
          uint64_t v48 = [v10 contentByUpdatingWithProvider:v56 error:&v75];
          id v35 = v75;
        }
        uint64_t v50 = v48;
        if (v35)
        {
          id v51 = IMLogHandleForCategory();
          if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR)) {
            sub_1AFC63AF8();
          }

          uint64_t v50 = v10;
        }
        id v14 = v50;
      }
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v36 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)int buf = 0;
          _os_log_impl(&dword_1AFB53000, v36, OS_LOG_TYPE_INFO, "Not synthesizing notification content from intent, intent was not generated for message", buf, 2u);
        }
      }
      id v14 = v10;
    }
  }
  return v14;
}

- (id)_attributedSummaryOfTapback:(id)a3 messageDictionary:(id)a4 senderDisplayName:(id)a5
{
  uint64_t v63 = *MEMORY[0x1E4F143B8];
  id v45 = a3;
  id v8 = a4;
  id v43 = a5;
  uint64_t v9 = [v8 objectForKeyedSubscript:@"__kmessageFlagsKey"];
  unint64_t v39 = [v9 unsignedLongLongValue];

  int v42 = [v8 objectForKeyedSubscript:@"__kmessageSummaryInfoDataKey"];
  id v10 = JWDecodeDictionary();
  uint64_t v11 = objc_msgSend(v10, "__imami_attributedStringForKey:", *MEMORY[0x1E4F6D628]);
  int v44 = v8;
  id v12 = v8;
  long long v13 = self;
  id v14 = [v12 objectForKeyedSubscript:@"__kmessageAttachmentsKey"];
  __int16 v41 = (void *)v11;
  long long v15 = [(IMDNotificationsController *)v13 _attachmentRecordsForAssociatedMessagePartText:v11];
  id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v57 = 0u;
  long long v58 = 0u;
  long long v59 = 0u;
  long long v60 = 0u;
  id v17 = v14;
  uint64_t v18 = [v17 countByEnumeratingWithState:&v57 objects:v62 count:16];
  if (v18)
  {
    uint64_t v19 = v18;
    uint64_t v20 = *(void *)v58;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v58 != v20) {
          objc_enumerationMutation(v17);
        }
        char v22 = *(void **)(*((void *)&v57 + 1) + 8 * i);
        unint64_t v23 = [v22 guid];
        if (v23) {
          [v16 setObject:v22 forKeyedSubscript:v23];
        }
      }
      uint64_t v19 = [v17 countByEnumeratingWithState:&v57 objects:v62 count:16];
    }
    while (v19);
  }

  long long v55 = 0u;
  long long v56 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  id v24 = v15;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v53 objects:v61 count:16];
  if (v25)
  {
    uint64_t v26 = v25;
    uint64_t v27 = *(void *)v54;
    do
    {
      for (uint64_t j = 0; j != v26; ++j)
      {
        if (*(void *)v54 != v27) {
          objc_enumerationMutation(v24);
        }
        long long v29 = *(void **)(*((void *)&v53 + 1) + 8 * j);
        long long v30 = [v29 guid];
        if (v30) {
          [v16 setObject:v29 forKeyedSubscript:v30];
        }
      }
      uint64_t v26 = [v24 countByEnumeratingWithState:&v53 objects:v61 count:16];
    }
    while (v26);
  }

  uint64_t v31 = (void *)[v16 copy];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1AFB78A90;
  aBlock[3] = &unk_1E5F8EA50;
  id v32 = v31;
  id v52 = v32;
  id v33 = _Block_copy(aBlock);
  v49[0] = MEMORY[0x1E4F143A8];
  v49[1] = 3221225472;
  v49[2] = sub_1AFB78AD0;
  v49[3] = &unk_1E5F8EA50;
  id v34 = v32;
  id v50 = v34;
  id v35 = _Block_copy(v49);
  v46[0] = MEMORY[0x1E4F143A8];
  v46[1] = 3221225472;
  v46[2] = sub_1AFB78B10;
  v46[3] = &unk_1E5F8EA78;
  id v47 = v34;
  uint64_t v48 = v13;
  id v36 = v34;
  __int16 v37 = _Block_copy(v46);
  id v40 = [v45 previewAttributedStringWithMessageSummaryInfo:v10 isAdaptiveImageGlyphProvider:v33 isCommSafetySensitiveProvider:v35 adaptiveImageGlyphProvider:v37 senderDisplayName:v43 isFromMe:(v39 >> 2) & 1 effectString:0];

  return v40;
}

- (id)_attachmentRecordsForAssociatedMessagePartText:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = objc_msgSend(a3, "__im_transferGUIDsInAttributedString");
    id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
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
          id v10 = (__CFString *)IMDAttachmentRecordCopyAttachmentForGUID(*(const __CFString **)(*((void *)&v13 + 1)
                                                                                            + 8 * i));
          if (v10) {
            objc_msgSend(v4, "addObject:", v10, (void)v13);
          }
        }
        uint64_t v7 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v7);
    }

    uint64_t v11 = (void *)[v4 copy];
  }
  else
  {
    uint64_t v11 = (void *)MEMORY[0x1E4F1CBF0];
  }
  return v11;
}

- (id)_senderDisplayNameForTapback:(id)a3 sendMessageIntent:(id)a4 chatParticipants:(id)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = a5;
  id v8 = (id)[v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v20;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v20 != v9) {
        objc_enumerationMutation(v7);
      }
      uint64_t v11 = *(void **)(*((void *)&v19 + 1) + 8 * v10);
      if (objc_msgSend(v11, "isSender", (void)v19)) {
        break;
      }
      if (v8 == (id)++v10)
      {
        id v8 = (id)[v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
        if (v8) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v8 = v11;

    if (!v8)
    {
      id v12 = 0;
      goto LABEL_22;
    }
    long long v13 = [v8 contact];
    if (v13 && [MEMORY[0x1E4F6E6D8] isCNContactAKnownContact:v13])
    {
      long long v14 = [MEMORY[0x1E4F1B9A8] sharedDefaults];
      if ([v14 shortNameFormatPrefersNicknames])
      {
        id v12 = [v13 nickname];
      }
      else
      {
        id v12 = 0;
      }
      if (![v12 length])
      {
        uint64_t v15 = [MEMORY[0x1E4F1B910] stringFromContact:v13 style:1000];

        id v12 = (void *)v15;
      }
    }
    else
    {
      id v12 = 0;
    }
  }
  else
  {
LABEL_9:
    id v12 = 0;
    long long v13 = v7;
  }

LABEL_22:
  if (!objc_msgSend(v12, "length", (void)v19))
  {
    long long v16 = [v6 sender];
    uint64_t v17 = [v16 displayName];

    id v12 = (void *)v17;
  }

  return v12;
}

- (id)_adaptiveImageGlyphForAttachment:(id)a3
{
  id v3 = a3;
  if ([v3 transferState] == 5)
  {
    id v4 = [v3 path];
    if ([v4 length])
    {
      id v5 = [MEMORY[0x1E4F1CB10] fileURLWithPath:v4 isDirectory:0];
      id v6 = IMAttachmentEmojiImagePreviewFileURL();
      uint64_t v10 = 0;
      id v7 = [MEMORY[0x1E4F1C9B8] dataWithContentsOfURL:v6 options:1 error:&v10];
      if (v7) {
        id v8 = (void *)[objc_alloc(MEMORY[0x1E4F425E8]) initWithImageContent:v7];
      }
      else {
        id v8 = 0;
      }
    }
    else
    {
      id v8 = 0;
    }
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (id)_attributedMessageBodyByInsertingAdaptiveImageGlyphsInMessageBody:(id)a3 attachments:(id)a4
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
  if (v10)
  {
    uint64_t v11 = v10;
    uint64_t v12 = *(void *)v33;
    do
    {
      for (uint64_t i = 0; i != v11; ++i)
      {
        if (*(void *)v33 != v12) {
          objc_enumerationMutation(v9);
        }
        long long v14 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        uint64_t v15 = [v14 guid];
        if (v15) {
          [v8 setObject:v14 forKey:v15];
        }
      }
      uint64_t v11 = [v9 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v11);
  }

  uint64_t v16 = [v6 length];
  uint64_t v17 = (void *)[v6 mutableCopy];
  uint64_t v18 = *MEMORY[0x1E4F6C188];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1AFB79298;
  v27[3] = &unk_1E5F8EAA0;
  id v28 = v8;
  long long v29 = self;
  id v30 = v6;
  id v19 = v17;
  id v31 = v19;
  id v20 = v6;
  id v21 = v8;
  objc_msgSend(v20, "enumerateAttribute:inRange:options:usingBlock:", v18, 0, v16, 0, v27);
  v25[0] = MEMORY[0x1E4F143A8];
  v25[1] = 3221225472;
  void v25[2] = sub_1AFB79478;
  v25[3] = &unk_1E5F8EAF0;
  id v26 = v19;
  id v22 = v19;
  objc_msgSend(v22, "enumerateAttributesInRange:options:usingBlock:", 0, v16, 0, v25);
  unint64_t v23 = (void *)[v22 copy];

  return v23;
}

- (id)_generateNotificationRequestForMessageRecord:(id)a3 isUrgentMessageTrigger:(BOOL)a4 isCarouselUITriggered:(BOOL)a5 shouldAdvanceLastAlertedMessageDate:(BOOL *)a6
{
  BOOL v7 = a5;
  BOOL v8 = a4;
  id v10 = a3;
  uint64_t v11 = [(IMDNotificationsController *)self _messageDictionaryForMessageRecord:v10 copyThreadOriginator:1];
  uint64_t v12 = [(IMDNotificationsController *)self _chatDictionaryForMessageRecord:v10];
  long long v13 = [(IMDNotificationsController *)self _generateNotificationRequestForMessageRecord:v10 messageDictionary:v11 chatDictionary:v12 isUrgentMessageTrigger:v8 isCarouselUITriggered:v7 shouldAdvanceLastAlertedMessageDate:a6];

  return v13;
}

- (id)_generateNotificationRequestForMessageRecord:(id)a3 messageDictionary:(id)a4 chatDictionary:(id)a5 isUrgentMessageTrigger:(BOOL)a6 isCarouselUITriggered:(BOOL)a7 shouldAdvanceLastAlertedMessageDate:(BOOL *)a8
{
  BOOL v9 = a7;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  BOOL v51 = a6;
  id v17 = objc_alloc_init(MEMORY[0x1E4F445B0]);
  BOOL v18 = [(IMDNotificationsController *)self _messageShouldBeSilentlyDeliveredForBusinessChat:v15];
  if (![v16 count])
  {
    if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = [v15 objectForKey:@"__kmessageGUIDKey"];
        *(_DWORD *)int buf = 138412290;
        id v53 = v22;
        _os_log_impl(&dword_1AFB53000, v21, OS_LOG_TYPE_INFO, "This notification %@ hasn't been associated with a chat yet", buf, 0xCu);
      }
    }
    if (!a8) {
      goto LABEL_68;
    }
LABEL_12:
    *a8 = 0;
    goto LABEL_68;
  }
  if (v18)
  {
    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        id v20 = [v15 objectForKey:@"__kmessageGUIDKey"];
        *(_DWORD *)int buf = 138412290;
        id v53 = v20;
        _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "Not notifying for %@ because it is a silent business chat message", buf, 0xCu);
      }
LABEL_51:

      goto LABEL_68;
    }
    goto LABEL_68;
  }
  if ([(IMDNotificationsController *)self _areAllMessagePartsRetractedForMessageDictionary:v15])
  {
    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        unint64_t v23 = [v15 objectForKey:@"__kmessageGUIDKey"];
        *(_DWORD *)int buf = 138412290;
        id v53 = v23;
        _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "Not generating notification request for %@ because all message parts have been retracted", buf, 0xCu);
      }
      goto LABEL_51;
    }
LABEL_68:

    id v38 = 0;
    goto LABEL_69;
  }
  if ([(id)objc_opt_class() _isFacetimeHighlighted:v15])
  {
    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        uint64_t v24 = [v15 objectForKey:@"__kmessageGUIDKey"];
        *(_DWORD *)int buf = 138412290;
        id v53 = v24;
        _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "Not generating notification request for %@ because it's already highlighted in an ongoing FaceTime call", buf, 0xCu);
      }
      goto LABEL_51;
    }
    goto LABEL_68;
  }
  if ([(IMDNotificationsController *)self _deviceUnderFirstUnlock])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_35;
    }
    uint64_t v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int buf = 0;
      _os_log_impl(&dword_1AFB53000, v25, OS_LOG_TYPE_INFO, "Device under first unlock, skip checking screentime", buf, 2u);
    }
    goto LABEL_34;
  }
  unint64_t v26 = [(IMDNotificationsController *)self screenTimeNotificationOptionsForChatDictionary:v16];
  if ((v26 & 4) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        unint64_t v39 = [v15 objectForKey:@"__kmessageGUIDKey"];
        *(_DWORD *)int buf = 138412290;
        id v53 = v39;
        _os_log_impl(&dword_1AFB53000, v19, OS_LOG_TYPE_INFO, "Not notifying for %@ because it is not allowed by Screen Time", buf, 0xCu);
      }
      goto LABEL_51;
    }
    goto LABEL_68;
  }
  [v17 setShouldIgnoreDowntime:(v26 >> 1) & 1];
  if (IMOSLoggingEnabled())
  {
    uint64_t v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v27 = [v15 objectForKey:@"__kmessageGUIDKey"];
      int v28 = [v17 shouldIgnoreDowntime];
      long long v29 = @"NO";
      if (v28) {
        long long v29 = @"YES";
      }
      *(_DWORD *)int buf = 138412546;
      id v53 = v27;
      __int16 v54 = 2112;
      long long v55 = v29;
      _os_log_impl(&dword_1AFB53000, v25, OS_LOG_TYPE_INFO, "shouldIgnoreDowntime for %@ : %@ ", buf, 0x16u);
    }
LABEL_34:
  }
LABEL_35:
  BOOL v30 = [(IMDNotificationsController *)self _shouldOverrideChatSilencingBecauseImMentioned:v15]|| [(IMDNotificationsController *)self _messageIsStewieEmergency:v15];
  [(IMDNotificationsController *)self _messageShouldBeSpoken:v15 chatDictionary:v16];
  if (!v9
    && ![(IMDNotificationsController *)self _shouldPostNotificationForChat:v16 messageDictionary:v15]&& !v30)
  {
    if (IMOSLoggingEnabled())
    {
      id v45 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        __int16 v46 = [v15 objectForKeyedSubscript:@"__kmessageGUIDKey"];
        *(_DWORD *)int buf = 138412290;
        id v53 = v46;
        _os_log_impl(&dword_1AFB53000, v45, OS_LOG_TYPE_INFO, "suppressed notification generation for silenced message %@.", buf, 0xCu);
      }
    }
    if (![(IMDNotificationsController *)self _isUnknownSenders:v16]) {
      goto LABEL_68;
    }
    if (IMOSLoggingEnabled())
    {
      id v47 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
      {
        uint64_t v48 = [v15 objectForKey:@"__kmessageGUIDKey"];
        *(_DWORD *)int buf = 138412290;
        id v53 = v48;
        _os_log_impl(&dword_1AFB53000, v47, OS_LOG_TYPE_INFO, "This notification %@ mark as sending from unknown senders", buf, 0xCu);
      }
    }
    if (!a8) {
      goto LABEL_68;
    }
    goto LABEL_12;
  }
  [(IMDNotificationsController *)self _populateBasicNotificationIdentifyingContent:v17 chatDictionary:v16 messageDictionary:v15 isCarouselUITriggered:v9];
  [(IMDNotificationsController *)self _populateBodyForNotificationContent:v17 messageDictionary:v15];
  [(IMDNotificationsController *)self _populateTitleForNotificationContent:v17 chatDictionary:v16 messageDictionary:v15];
  [(IMDNotificationsController *)self _populateSubtitleForNotificationContent:v17 chatDictionary:v16 messageDictionary:v15];
  [(IMDNotificationsController *)self _populateSoundAndDisplayActivationForNotificationContent:v17 chatDictionary:v16 messageDictionary:v15];
  [(IMDNotificationsController *)self _populateIgnoresDoNotDisturb:v17 chatDictionary:v16 messageDictionary:v15];
  if (v14) {
    [(IMDNotificationsController *)self _populateAttachmentsForNotificationContent:v17 messageDictionary:v15 messageRecord:v14 knownSender:[(IMDNotificationsController *)self _messageIsFromKnownContact:v15]];
  }
  [(IMDNotificationsController *)self _populateUserInfoOnContentForWatch:v17 messageDictionary:v15 chatDictionary:v16 isCarouselUITriggered:v9];
  [(IMDNotificationsController *)self _populateNotificationCategoryContent:v17 messageDictionary:v15 chatDictionary:v16];
  [(IMDNotificationsController *)self _populateUserInfoForMessageContent:v17 messageDictionary:v15 messageIsAddressedToMe:v30];
  [(IMDNotificationsController *)self _populateRealertCountForNotificationContent:v17];
  [(IMDNotificationsController *)self _populateNotificationContentForTranscriptSharing:v17 chatDictionary:v16 messageDictionary:v15];
  [(IMDNotificationsController *)self _populateTimeSensitiveOrCriticalForNotificationContent:v17 chatDictionary:v16 messageDictionary:v15];
  id v31 = [v15 objectForKey:@"__kmessageGUIDKey"];
  char v50 = 0;
  long long v32 = +[IMExtensionNotificationManager sharedInstance];
  long long v33 = [v15 objectForKeyedSubscript:@"__kmessageBalloonBundleIDKey"];
  long long v34 = [v15 objectForKeyedSubscript:@"__kmessagePayloadDataKey"];
  long long v35 = [v16 objectForKey:@"__kchatChatIdentifierKey"];
  [v32 populateUserInfoForNotificationContent:v17 messageBalloonBundleID:v33 payloadData:v34 chatIdentifier:v35 isUrgentMessageTrigger:&v51 shouldSuppressNotification:&v50];

  if (v50)
  {
    if (IMOSLoggingEnabled())
    {
      id v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        uint64_t v37 = [v15 objectForKey:@"__kmessageGUIDKey"];
        *(_DWORD *)int buf = 138412290;
        id v53 = v37;
        _os_log_impl(&dword_1AFB53000, v36, OS_LOG_TYPE_INFO, "Suppressing notification for messageGUID %@", buf, 0xCu);
      }
    }
    id v38 = 0;
  }
  else
  {
    if ([v17 interruptionLevel] == 3)
    {
      [v17 setShouldSuppressScreenLightUp:0];
      id v40 = [v17 sound];
      if (!v40
        || ([v17 sound],
            __int16 v41 = objc_claimAutoreleasedReturnValue(),
            BOOL v42 = [v41 alertType] == 2,
            v41,
            v40,
            v42))
      {
        id v43 = [MEMORY[0x1E4F44640] defaultCriticalSound];
        [v17 setSound:v43];
      }
    }
    int v44 = [(IMDNotificationsController *)self _synthesizedMessagingNotificationContentWithContent:v17 chatDictionary:v16 messageDictionary:v15 isUrgentMessageTrigger:v51];
    id v38 = [MEMORY[0x1E4F44628] requestWithIdentifier:v31 content:v44 trigger:0 destinations:15];
  }
LABEL_69:

  return v38;
}

- (BOOL)_areAllMessagePartsRetractedForMessageDictionary:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"__kmessageBalloonBundleIDKey"];
  id v5 = +[IMExtensionNotificationManager sharedInstance];
  int v6 = [v5 canPopulateUserInfoForMessageBalloonBundleID:v4];

  if (v6)
  {
    BOOL v7 = [v3 objectForKey:@"__kmessageGUIDKey"];
    if (IMOSLoggingEnabled())
    {
      BOOL v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412546;
        id v17 = v4;
        __int16 v18 = 2112;
        id v19 = v7;
        _os_log_impl(&dword_1AFB53000, v8, OS_LOG_TYPE_INFO, "Delegating retracted check to IMExtensionNotificationManager for BalloonBundleID %@ messageGUID %@", (uint8_t *)&v16, 0x16u);
      }
    }
    BOOL v9 = +[IMExtensionNotificationManager sharedInstance];
    char v10 = [v9 shouldRetractedMessageForBalloonBundleID:v4];
  }
  else
  {
    BOOL v7 = [v3 objectForKeyedSubscript:@"__kmessageAttributedBodyKey"];
    BOOL v9 = [v3 objectForKeyedSubscript:@"__kmessageTextKey"];
    if ([v7 length]
      || [v9 length]
      || ([v3 objectForKeyedSubscript:@"__kmessageDateEditedKey"],
          uint64_t v12 = objc_claimAutoreleasedReturnValue(),
          uint64_t v13 = [v12 longLongValue],
          v12,
          v13 < 1))
    {
      char v10 = 0;
    }
    else
    {
      id v14 = [v3 objectForKey:@"__kmessageGUIDKey"];
      if (IMOSLoggingEnabled())
      {
        id v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v16 = 138412290;
          id v17 = v14;
          _os_log_impl(&dword_1AFB53000, v15, OS_LOG_TYPE_INFO, "Determined that all message parts have been retracted for messageGUID %@", (uint8_t *)&v16, 0xCu);
        }
      }
      char v10 = 1;
    }
  }

  return v10;
}

+ (BOOL)_isFacetimeHighlighted:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v24 = [a1 _pluginPayloadAttachmentPathsForMessage:v4];
  uint64_t v25 = [v4 objectForKeyedSubscript:@"__kmessageTextKey"];
  id v5 = [MEMORY[0x1E4F1CB10] URLWithString:v25];
  unint64_t v26 = [a1 _lpLinkMetadataForMessage:v4 attachmentPaths:v24 originalURL:v5];

  int v6 = [v26 collaborationMetadata];

  if (IMOSLoggingEnabled())
  {
    BOOL v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      BOOL v8 = @"YES";
      if (!v6) {
        BOOL v8 = @"NO";
      }
      *(_DWORD *)int buf = 138412290;
      long long v33 = v8;
      _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "Message has collaboration meta data: %@", buf, 0xCu);
    }
  }
  if (v6)
  {
    BOOL v9 = [v26 collaborationMetadata];
    char v10 = [v9 collaborationIdentifier];

    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        long long v33 = v10;
        _os_log_impl(&dword_1AFB53000, v11, OS_LOG_TYPE_INFO, "Read collaborationIdentifier from message: %@", buf, 0xCu);
      }
    }
    if ([(__CFString *)v10 length])
    {
      uint64_t v12 = [MEMORY[0x1E4FADA90] sharedInstance];
      unint64_t v23 = [v12 conversationManager];

      [v23 activeConversations];
      long long v29 = 0u;
      long long v30 = 0u;
      long long v27 = 0u;
      long long v28 = 0u;
      id v13 = (id)objc_claimAutoreleasedReturnValue();
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v28;
        while (2)
        {
          for (uint64_t i = 0; i != v14; ++i)
          {
            if (*(void *)v28 != v15) {
              objc_enumerationMutation(v13);
            }
            id v17 = *(void **)(*((void *)&v27 + 1) + 8 * i);
            if (IMOSLoggingEnabled())
            {
              __int16 v18 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                id v19 = [v17 highlightIdentifiers];
                *(_DWORD *)int buf = 138412290;
                long long v33 = v19;
                _os_log_impl(&dword_1AFB53000, v18, OS_LOG_TYPE_INFO, "Read highlightIdentifiers from current FaceTime call: %@", buf, 0xCu);
              }
            }
            uint64_t v20 = [v17 highlightIdentifiers];
            char v21 = [v20 containsObject:v10];

            if (v21)
            {

              LOBYTE(v6) = 1;
              goto LABEL_28;
            }
          }
          uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
          if (v14) {
            continue;
          }
          break;
        }
      }
    }
    LOBYTE(v6) = 0;
LABEL_28:
  }
  return (char)v6;
}

+ (id)_pluginPayloadAttachmentPathsForMessage:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 objectForKey:@"__kmessageRowIDKey"];
  uint64_t v4 = [v3 integerValue];

  id v5 = (void *)IMDMessageRecordCopyAttachmentsForIDWithLock(v4);
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v16;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v16 != v10) {
          objc_enumerationMutation(v7);
        }
        uint64_t v12 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if (v12)
        {
          id v13 = objc_msgSend(v12, "path", (void)v15);
          if (v13) {
            [v6 addObject:v13];
          }
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v9);
  }

  return v6;
}

+ (id)_lpLinkMetadataForMessage:(id)a3 attachmentPaths:(id)a4 originalURL:(id)a5
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (MEMORY[0x1B3E89B10](@"LPLinkMetadataPresentationTransformer", @"LinkPresentation"))
  {
    uint64_t v10 = [v7 objectForKey:@"__kmessagePayloadDataKey"];
    id v11 = objc_alloc_init(MEMORY[0x1E4F6E718]);
    unint64_t v26 = (void *)v10;
    [v11 setData:v10];
    uint64_t v25 = [v7 objectForKey:@"__kmessageGUIDKey"];
    objc_msgSend(v11, "setMessageGUID:");
    uint64_t v12 = [v7 objectForKey:@"__kmessageFlagsKey"];
    unint64_t v13 = ((unint64_t)[v12 unsignedLongLongValue] >> 2) & 1;

    [v11 setIsFromMe:v13];
    [v11 setUrl:v9];
    uint64_t v14 = [MEMORY[0x1E4F1CA48] array];
    long long v28 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    long long v31 = 0u;
    id v27 = v8;
    id v15 = v8;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      uint64_t v18 = *(void *)v29;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          uint64_t v20 = [MEMORY[0x1E4F1CB10] fileURLWithPath:*(void *)(*((void *)&v28 + 1) + 8 * i)];
          char v21 = v20;
          if (v14 && v20) {
            CFArrayAppendValue(v14, v20);
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v17);
    }

    [v11 setAttachments:v14];
    id v22 = [MEMORY[0x1E4F6E9A8] linkMetadataForPluginPayload:v11];
    unint64_t v23 = (void *)[v22 copy];

    id v8 = v27;
  }
  else
  {
    unint64_t v23 = 0;
  }

  return v23;
}

- (BOOL)_deviceUnderFirstUnlock
{
  id v2 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  char v3 = [v2 isUnderFirstDataProtectionLock];

  return v3;
}

- (id)_generateNotificationRequestForDeliveryError:(id)a3 isCarouselUITriggered:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = [(IMDNotificationsController *)self _messageDictionaryForMessageRecord:v6];
  id v8 = [v7 objectForKeyedSubscript:@"__kmessageErrorKey"];
  uint64_t v9 = [v8 longValue];

  uint64_t v10 = [v7 objectForKeyedSubscript:@"__kmessageFlagsKey"];
  uint64_t v11 = [v10 unsignedLongLongValue];

  if (v9 | v11 & 0x20000000000
    && ([v7 objectForKeyedSubscript:@"__kmessageItemTypeKey"],
        uint64_t v12 = objc_claimAutoreleasedReturnValue(),
        uint64_t v13 = [v12 longValue],
        v12,
        !v13))
  {
    id v16 = objc_alloc_init(MEMORY[0x1E4F445B0]);
    uint64_t v18 = [(IMDNotificationsController *)self _chatDictionaryForMessageRecord:v6];
    [(IMDNotificationsController *)self _populateBasicNotificationIdentifyingContent:v16 chatDictionary:v18 messageDictionary:v7 isCarouselUITriggered:v4];
    if (v9 == 43) {
      [(IMDNotificationsController *)self _populateBodyAndTitleForSendReceivedAsJunkNotificationContent:v16 messageDictionary:v7];
    }
    else {
      [(IMDNotificationsController *)self _populateBodyAndTitleForSendFailedNotificationContent:v16 messageDictionary:v7];
    }
    [(IMDNotificationsController *)self _populateUserInfoOnContentForWatch:v16 messageDictionary:v7 chatDictionary:v18 isCarouselUITriggered:v4];
    [(IMDNotificationsController *)self _populateRealertCountForNotificationContent:v16];
    id v19 = [v7 objectForKey:@"__kmessageGUIDKey"];
    id v15 = [MEMORY[0x1E4F44628] requestWithIdentifier:v19 content:v16 trigger:0];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v20 = 138412290;
        char v21 = v7;
        _os_log_impl(&dword_1AFB53000, v14, OS_LOG_TYPE_INFO, "We don't notify for delivery non-failures or failures of non-messages for messageDictionary %@", (uint8_t *)&v20, 0xCu);
      }
    }
    id v15 = 0;
    id v16 = 0;
  }

  return v15;
}

- (id)_messageDictionaryForMessageRecord:(id)a3
{
  return [(IMDNotificationsController *)self _messageDictionaryForMessageRecord:a3 copyThreadOriginator:0];
}

- (id)_messageDictionaryForMessageRecord:(id)a3 copyThreadOriginator:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = (__CFDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:20];
  uint64_t v135 = 0;
  uint64_t v136 = -1;
  uint64_t v133 = 0;
  uint64_t v134 = 0;
  v131 = 0;
  uint64_t v132 = 0;
  v129 = 0;
  v130 = 0;
  v127 = 0;
  v128 = 0;
  CFNumberRef v126 = 0;
  char v125 = 0;
  uint64_t v123 = 0;
  uint64_t v124 = 0;
  v121 = 0;
  uint64_t v122 = 0;
  v120 = 0;
  long long v119 = 0u;
  v117 = 0;
  v118 = 0;
  v116 = 0;
  v115 = 0;
  v114 = 0;
  v113 = 0;
  v112 = 0;
  v111 = 0;
  uint64_t v110 = 0;
  v109 = 0;
  v108 = 0;
  v107 = 0;
  v104 = v5;
  IMDMessageRecordBulkCopy((uint64_t)v5, &v135, &v136, 0, &v131, &v134, &v133, &v132, 0, &v130, &v111, &v126, &v128, &v113, 0, &v121, &v129, &v123, &v124,
    &v125,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    0,
    &v120,
    &v122,
    &v119,
    &v127,
    &v115,
    &v116,
    0,
    &v118,
    0,
    0,
    0,
    0,
    &v114,
    0,
    0,
    &v112,
    0,
    0,
    0,
    0,
    &v110,
    &v109,
    0,
    &v117,
    &v108,
    &v107);
  id v8 = v130;
  id v7 = v131;
  uint64_t v9 = v128;
  uint64_t v10 = v129;
  long long v59 = v127;
  CFNumberRef v94 = v126;
  [NSNumber numberWithBool:v125 != 0];
  id v100 = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v11 = [NSNumber numberWithLongLong:v123];
  id v70 = [NSNumber numberWithLongLong:v124];
  id v92 = v120;
  id v86 = v117;
  id v105 = v118;
  id v90 = [NSNumber numberWithLongLong:v122];
  id v82 = v115;
  id v84 = v116;
  id v88 = [MEMORY[0x1E4F29238] valueWithRange:v119];
  uint64_t v12 = [NSNumber numberWithLongLong:v136];
  uint64_t v13 = [NSNumber numberWithLongLong:v135];
  value = [NSNumber numberWithLongLong:v134];
  id v98 = [NSNumber numberWithLongLong:v132];
  id v96 = [NSNumber numberWithLongLong:v133];
  uint64_t v14 = [NSNumber numberWithLongLong:v110];
  id v76 = v114;
  long long v72 = (void *)v14;
  id v74 = v113;
  long long v79 = v112;
  BOOL v67 = v109;
  long long v65 = [NSNumber numberWithLongLong:v108];
  uint64_t v69 = [NSNumber numberWithLongLong:v107];
  long long v81 = v111;
  if (v111)
  {
    JWDecodeCodableObjectWithStandardAllowlist();
    id v15 = (id)objc_claimAutoreleasedReturnValue();
    if (v15) {
      CFDictionarySetValue(v6, @"__kmessageAttributedBodyKey", v15);
    }
  }
  uint64_t v61 = [v104 handleRecord];
  if (v4)
  {
    id v16 = (__CFString *)IMDMessageRecordCopyMessageForGUID(v79);
    if (v16)
    {
      uint64_t v63 = [(IMDNotificationsController *)self _messageDictionaryForMessageRecord:v16];
    }
    else
    {
      uint64_t v63 = 0;
    }
  }
  else
  {
    uint64_t v63 = 0;
  }
  if (v125)
  {
    uint64_t v17 = [v104 attachmentRecords];
  }
  else
  {
    uint64_t v17 = 0;
  }
  id v18 = v7;
  if (v18) {
    CFDictionarySetValue(v6, @"__kmessageGUIDKey", v18);
  }

  id v19 = v8;
  if (v19) {
    CFDictionarySetValue(v6, @"__kmessageTextKey", v19);
  }

  id v20 = v10;
  if (v20) {
    CFDictionarySetValue(v6, @"__kmessageSubjectKey", v20);
  }

  id v21 = v9;
  if (v21) {
    CFDictionarySetValue(v6, @"__kmessageServiceKey", v21);
  }

  id v22 = v59;
  if (v22) {
    CFDictionarySetValue(v6, @"__kmessageBalloonBundleIDKey", v22);
  }

  id v23 = v11;
  if (v23) {
    CFDictionarySetValue(v6, @"__kmessageErrorKey", v23);
  }

  id v24 = v12;
  if (v24) {
    CFDictionarySetValue(v6, @"__kmessageRowIDKey", v24);
  }

  id v25 = v13;
  if (v25) {
    CFDictionarySetValue(v6, @"__kmessageItemTypeKey", v25);
  }

  id v26 = value;
  valuea = v26;
  if (v26)
  {
    CFDictionarySetValue(v6, @"__kmessageDateKey", v26);
    id v26 = valuea;
  }

  id v27 = v98;
  id v99 = v27;
  if (v27)
  {
    CFDictionarySetValue(v6, @"__kmessageDateDeliveredKey", v27);
    id v27 = v99;
  }

  id v28 = v96;
  id v97 = v28;
  if (v28)
  {
    CFDictionarySetValue(v6, @"__kmessageDateReadKey", v28);
    id v28 = v97;
  }

  id v29 = v100;
  id v101 = v29;
  if (v29)
  {
    CFDictionarySetValue(v6, @"__kmessageHasAttachmentsKey", v29);
    id v29 = v101;
  }

  id v30 = v17;
  if (v30) {
    CFDictionarySetValue(v6, @"__kmessageAttachmentsKey", v30);
  }
  long long v60 = v30;

  CFNumberRef v31 = v94;
  if (v31) {
    CFDictionarySetValue(v6, @"__kmessageFlagsKey", v31);
  }

  id v32 = v70;
  id v95 = v32;
  if (v32)
  {
    CFDictionarySetValue(v6, @"__kmessageMadridTypeKey", v32);
    id v32 = v95;
  }

  id v33 = v92;
  id v93 = v33;
  if (v33)
  {
    CFDictionarySetValue(v6, @"__kmessageAssociatedMessageGUIDKey", v33);
    id v33 = v93;
  }

  id v34 = v90;
  id v91 = v34;
  if (v34)
  {
    CFDictionarySetValue(v6, @"__kmessageAssociatedMessageTypeKey", v34);
    id v34 = v91;
  }

  id v35 = v88;
  id v89 = v35;
  if (v35)
  {
    CFDictionarySetValue(v6, @"__kmessageAssociatedMessageRangeKey", v35);
    id v35 = v89;
  }

  id v36 = v86;
  id v87 = v36;
  if (v36)
  {
    CFDictionarySetValue(v6, @"__kmessageAssociatedMessageEmojiKey", v36);
    id v36 = v87;
  }

  id v37 = v105;
  id v106 = v37;
  if (v37)
  {
    CFDictionarySetValue(v6, @"__kmessageSummaryInfoDataKey", v37);
    id v37 = v106;
  }

  id v38 = v84;
  id v85 = v38;
  if (v38)
  {
    CFDictionarySetValue(v6, @"__kmessageExpressiveSendStyleIDKey", v38);
    id v38 = v85;
  }
  uint64_t v71 = v22;

  id v39 = v82;
  if (v39) {
    CFDictionarySetValue(v6, @"__kmessagePayloadDataKey", v39);
  }
  long long v58 = v39;

  id v40 = v61;
  if (v40) {
    CFDictionarySetValue(v6, @"__kmessageHandleKey", v40);
  }

  id v41 = v76;
  id v83 = v41;
  if (v41)
  {
    CFDictionarySetValue(v6, @"__kmessageDestinationCallerIDKey", v41);
    id v41 = v83;
  }
  id v77 = v18;

  id v42 = v74;
  if (v42) {
    CFDictionarySetValue(v6, @"__kmessageAccountKey", v42);
  }
  id v75 = v19;

  id v43 = v79;
  if (v43) {
    CFDictionarySetValue(v6, @"__kmessageThreadOriginatorGUIDKey", v43);
  }
  long long v80 = v20;
  long long v57 = v43;

  id v44 = v63;
  if (v44) {
    CFDictionarySetValue(v6, @"__kmessageThreadOriginatorKey", v44);
  }
  CFNumberRef v64 = v31;

  id v45 = v67;
  if (v45) {
    CFDictionarySetValue(v6, @"__kbiaReferenceIDKey", v45);
  }
  id v62 = v42;
  long long v68 = v23;

  id v46 = v65;
  if (v46) {
    CFDictionarySetValue(v6, @"__kscheduleTypeKey", v46);
  }
  id v47 = v24;
  long long v66 = v25;

  id v48 = v69;
  if (v48) {
    CFDictionarySetValue(v6, @"__kscheduleStateKey", v48);
  }
  id v49 = v21;

  id v50 = v72;
  if (v50) {
    CFDictionarySetValue(v6, @"__kmessageDateEditedKey", v50);
  }

  BOOL v51 = v106;
  if (v106)
  {
    uint64_t v73 = v49;
    id v52 = JWDecodeDictionary();
    id v53 = [v52 objectForKey:*MEMORY[0x1E4F6D6B0]];
    if (v53) {
      CFDictionarySetValue(v6, @"__kmessageIsInitialTranscriptSharingItem", v53);
    }

    __int16 v54 = [v52 objectForKey:*MEMORY[0x1E4F6D6B8]];
    if (v54) {
      CFDictionarySetValue(v6, @"__kmessageTranscriptSharingMessageType", v54);
    }

    id v49 = v73;
    BOOL v51 = v106;
  }
  [(IMDNotificationsController *)self _setContactInMessageDictionary:v40 messageDictionary:v6];
  long long v55 = v6;

  return v55;
}

- (id)_chatDictionaryForMessageRecord:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 chatRecord];
  if (v5)
  {
    uint64_t v6 = [(IMDNotificationsController *)self _chatDictionaryForChatRecord:v5];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_1AFB53000, v7, OS_LOG_TYPE_INFO, "We didn't get any chat records for message record %@", (uint8_t *)&v10, 0xCu);
      }
    }
    uint64_t v6 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
  }
  id v8 = (void *)v6;

  return v8;
}

+ (id)_displayNameForChatRecord:(id)a3
{
  id v5 = 0;
  if (a3)
  {
    _IMDChatRecordBulkCopy((uint64_t)a3, 0, 0, 0, 0, 0, 0, 0, 0, &v5, 0, 0, 0, 0, 0, 0, 0, 0, 0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0);
    char v3 = v5;
  }
  else
  {
    char v3 = 0;
  }
  return v3;
}

- (id)_chatDictionaryForChatRecord:(id)a3
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = (__CFDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:10];
  __int16 v54 = 0;
  long long v55 = 0;
  id v52 = 0;
  id v53 = 0;
  id v50 = 0;
  BOOL v51 = 0;
  id v48 = 0;
  id v49 = 0;
  id v47 = 0;
  if (v4)
  {
    _IMDChatRecordBulkCopy((uint64_t)v4, &v48, 0, 0, &v49, &v55, 0, &v54, 0, &v53, &v50, 0, &v52, 0, &v47, 0, 0, 0, 0,
      &v51,
      0,
      0,
      0,
      0,
      0,
      0,
      0,
      0);
    id v45 = v55;
    id v46 = v54;
    value = v53;
    id v43 = v52;
    uint64_t v6 = v50;
    id v44 = v51;
    id v7 = v49;
    if (v49)
    {
      id v8 = JWDecodeDictionary();
      uint64_t v9 = [v8 valueForKey:@"wasAutoDetectedForSpam"];
      HIDWORD(v40) = [v9 BOOLValue];

      int v10 = [v8 valueForKey:@"wasDetectedAsiMessageSpam"];
      LODWORD(v40) = [v10 BOOLValue];

      id v11 = [v8 valueForKey:@"wasDetectedAsSMSSpam"];
      unsigned int v39 = [v11 BOOLValue];

      id v41 = [v8 objectForKey:*MEMORY[0x1E4F6CD48]];
      uint64_t v12 = [v8 valueForKey:@"SMSCategory"];
      int v13 = [v12 intValue];

      uint64_t v14 = [v8 valueForKey:@"SMSSubCategory"];
      int v15 = [v14 intValue];

      id v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
      int v17 = [v16 isTranscriptSharingEnabled];

      if (v17)
      {
        id v18 = [v8 objectForKey:*MEMORY[0x1E4F6CD28]];
      }
      else
      {
        id v18 = 0;
      }

      uint64_t v37 = v15;
      uint64_t v38 = v13;
    }
    else
    {
      uint64_t v40 = 0;
      id v41 = 0;
      unsigned int v39 = 0;
      uint64_t v37 = 0;
      uint64_t v38 = 0;
      id v18 = 0;
    }
    id v19 = [v4 handleRecords];
    if ([v19 count])
    {
      if (v19) {
        CFDictionarySetValue(v5, @"__kchatHandlesForChatKey", v19);
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)int buf = 138412290;
        long long v57 = v46;
        _os_log_impl(&dword_1AFB53000, v20, OS_LOG_TYPE_INFO, "We got 0 handles back for chatRecord with guid %@", buf, 0xCu);
      }
    }
    IMSharedHelperCatalystNotificationDisabled();
    BOOL v36 = [(IMDNotificationsController *)self _chatIsMutedBasedOnChatGUID:v46 chatIdentifier:v45 groupID:v43 handles:v19 lastAddressedHandleString:v6 originalGroupID:v44 style:v48];
    id v21 = [(IMDNotificationsController *)self _lastMessageTimeForChat:v4];
    id v22 = v21;
    if (v21)
    {
      id v23 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v21, "__im_nanosecondTimeInterval"));
      if (v23) {
        CFDictionarySetValue(v5, @"__kchatLastMessageTimestamp", v23);
      }
    }
    id v24 = [NSNumber numberWithLongLong:v48];
    if (v24) {
      CFDictionarySetValue(v5, @"__kchatStyleKey", v24);
    }

    if (v7) {
      CFDictionarySetValue(v5, @"__kchatPropertiesDataKey", v7);
    }
    if (v45) {
      CFDictionarySetValue(v5, @"__kchatChatIdentifierKey", v45);
    }
    if (v46) {
      CFDictionarySetValue(v5, @"__kchatChatGUIDKey", v46);
    }
    if (value) {
      CFDictionarySetValue(v5, @"__kchatGroupNameKey", value);
    }
    if (v41) {
      CFDictionarySetValue(v5, @"__kchatGroupPhotoGuidKey", v41);
    }
    if (v19) {
      CFDictionarySetValue(v5, @"__kchatParticipantsKey", v19);
    }
    if (v43) {
      CFDictionarySetValue(v5, @"__kchatGroupIDKey", v43);
    }
    if (v44) {
      CFDictionarySetValue(v5, @"__kchatOriginalGroupIDKey", v44);
    }
    if (v6) {
      CFDictionarySetValue(v5, @"__kchatLastAddressedHandleStringKey", v6);
    }
    id v25 = [NSNumber numberWithLongLong:v47];
    if (v25) {
      CFDictionarySetValue(v5, @"__kchatIsFilteredKey", v25);
    }

    id v26 = [NSNumber numberWithBool:HIDWORD(v40)];
    if (v26) {
      CFDictionarySetValue(v5, @"__kchatWasReportedAsiMessageSpamKey", v26);
    }

    id v27 = [NSNumber numberWithBool:v40];
    if (v27) {
      CFDictionarySetValue(v5, @"__kchatWasDetectedAsiMessageSpamKey", v27);
    }

    id v28 = [NSNumber numberWithBool:v39];
    if (v28) {
      CFDictionarySetValue(v5, @"__kchatWasDetectedAsSMSSpamKey", v28);
    }

    id v29 = [NSNumber numberWithLongLong:v38];
    if (v29) {
      CFDictionarySetValue(v5, @"__kchatSMSCategoryKey", v29);
    }

    id v30 = [NSNumber numberWithLongLong:v37];
    if (v30) {
      CFDictionarySetValue(v5, @"__kchatSMSSubCategoryKey", v30);
    }

    CFNumberRef v31 = [NSNumber numberWithBool:v36];
    if (v31) {
      CFDictionarySetValue(v5, @"__kchatIsMutedKey", v31);
    }

    id v32 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v33 = [v32 isTranscriptSharingEnabled];

    if (v18) {
      int v34 = v33;
    }
    else {
      int v34 = 0;
    }
    if (v34 == 1) {
      CFDictionarySetValue(v5, @"__kchatEmergencyUserInfo", v18);
    }
  }
  return v5;
}

- (BOOL)_messageShouldBeSilentlyDeliveredForBusinessChat:(id)a3
{
  id v3 = a3;
  id v4 = objc_opt_class();
  id v5 = [v3 objectForKeyedSubscript:@"__kmessageHandleKey"];
  uint64_t v6 = [v4 _addressForHandle:v5];
  int v7 = MEMORY[0x1B3E899E0]();

  if (v7)
  {
    id v8 = [v3 objectForKey:@"__kmessageSummaryInfoDataKey"];
    uint64_t v9 = JWDecodeDictionary();
    int v10 = [v9 objectForKey:*MEMORY[0x1E4F6EB10]];
    char v11 = [v10 BOOLValue];
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)_chatIsMutedBasedOnChatGUID:(id)a3 chatIdentifier:(id)a4 groupID:(id)a5 handles:(id)a6 lastAddressedHandleString:(id)a7 originalGroupID:(id)a8 style:(int64_t)a9
{
  int v13 = (void *)MEMORY[0x1E4F6E8A8];
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = [v13 sharedList];
  id v20 = objc_msgSend(v16, "__imArrayByApplyingBlock:", &unk_1F084D2D8);

  id v21 = [v19 muteIdentifiersForChatStyle:a9 groupID:v17 participantIDs:v20 lastAddressedHandleID:v15 originalGroupID:v14 chatIdentifier:v18];

  LOBYTE(v17) = [v19 isMutedChatForMuteIdentifiers:v21];
  return (char)v17;
}

- (id)contactForHandleRecord:(id)a3
{
  v11[4] = *MEMORY[0x1E4F143B8];
  if (a3)
  {
    id v3 = a3;
    id v4 = [(id)objc_opt_class() _addressForHandle:v3];

    if (MEMORY[0x1B3E899E0](v4))
    {
      id v5 = 0;
    }
    else
    {
      uint64_t v6 = [v4 _stripFZIDPrefix];
      uint64_t v7 = *MEMORY[0x1E4F1AEE0];
      v11[0] = *MEMORY[0x1E4F1AF90];
      v11[1] = v7;
      uint64_t v8 = *MEMORY[0x1E4F1ADC0];
      v11[2] = *MEMORY[0x1E4F1ADC8];
      v11[3] = v8;
      uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:4];
      id v5 = _IMDCoreSpotlightCNContactForAddressWithAdditionalPropertyKeys(v6, v9);
    }
  }
  else
  {
    id v5 = 0;
  }
  return v5;
}

- (void)_setContactInMessageDictionary:(id)a3 messageDictionary:(id)a4
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  uint64_t v7 = (__CFDictionary *)a4;
  uint64_t v8 = [(IMDNotificationsController *)self contactForHandleRecord:v6];
  if (v8) {
    CFDictionarySetValue(v7, @"__kmessageCNContactForSenderKey", v8);
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v10 = [(__CFDictionary *)v7 objectForKey:@"__kmessageCNContactForSenderKey"];
      int v11 = 138412290;
      uint64_t v12 = v10;
      _os_log_impl(&dword_1AFB53000, v9, OS_LOG_TYPE_INFO, "CNContact for sender %@", (uint8_t *)&v11, 0xCu);
    }
  }
}

- (id)_stickerTapbackTransferGUIDFromMessageDictionary:(id)a3
{
  id v3 = [a3 objectForKeyedSubscript:@"__kmessageAttachmentsKey"];
  if ([v3 count] == 1)
  {
    id v4 = [v3 firstObject];
    id v5 = [v4 guid];

    if ([v5 length]) {
      goto LABEL_9;
    }
    id v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1AFC63C14();
    }
  }
  else
  {
    id v6 = IMLogHandleForCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
      sub_1AFC63C48();
    }
    id v5 = 0;
  }

LABEL_9:
  return v5;
}

- (id)_tapbackFromMessageDictionary:(id)a3
{
  id v4 = a3;
  id v5 = [v4 objectForKeyedSubscript:@"__kmessageAssociatedMessageTypeKey"];
  id v6 = v5;
  if (!v5)
  {
    uint64_t v8 = 0;
    goto LABEL_32;
  }
  uint64_t v7 = [v5 integerValue];
  uint64_t v8 = 0;
  if (v7 > 2999)
  {
    if ((unint64_t)(v7 - 3000) >= 6)
    {
      if (v7 != 3006)
      {
        if (v7 != 3007) {
          goto LABEL_32;
        }
        uint64_t v9 = [(IMDNotificationsController *)self _stickerTapbackTransferGUIDFromMessageDictionary:v4];
        if ([v9 length])
        {
          id v10 = objc_alloc(MEMORY[0x1E4F6EA60]);
          int v11 = v9;
          uint64_t v12 = 1;
          goto LABEL_15;
        }
        id v17 = IMLogHandleForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1AFC63C7C();
        }
LABEL_30:

        uint64_t v8 = 0;
        goto LABEL_31;
      }
      uint64_t v9 = [v4 objectForKeyedSubscript:@"__kmessageAssociatedMessageEmojiKey"];
      if (![v9 length])
      {
        id v17 = IMLogHandleForCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
          sub_1AFC63CB0();
        }
        goto LABEL_30;
      }
      id v14 = objc_alloc(MEMORY[0x1E4F6E768]);
      id v15 = v9;
      uint64_t v16 = 1;
LABEL_20:
      uint64_t v13 = [v14 initWithEmoji:v15 isRemoved:v16];
      goto LABEL_21;
    }
LABEL_10:
    uint64_t v8 = (void *)[objc_alloc(MEMORY[0x1E4F6E6A0]) initWithAssociatedMessageType:v7];
    goto LABEL_32;
  }
  if ((unint64_t)(v7 - 2000) < 6) {
    goto LABEL_10;
  }
  if (v7 == 2006)
  {
    uint64_t v9 = [v4 objectForKeyedSubscript:@"__kmessageAssociatedMessageEmojiKey"];
    if (![v9 length])
    {
      id v17 = IMLogHandleForCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
        sub_1AFC63CE4();
      }
      goto LABEL_30;
    }
    id v14 = objc_alloc(MEMORY[0x1E4F6E768]);
    id v15 = v9;
    uint64_t v16 = 0;
    goto LABEL_20;
  }
  if (v7 != 2007) {
    goto LABEL_32;
  }
  uint64_t v9 = [(IMDNotificationsController *)self _stickerTapbackTransferGUIDFromMessageDictionary:v4];
  if (![v9 length])
  {
    id v17 = IMLogHandleForCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR)) {
      sub_1AFC63C14();
    }
    goto LABEL_30;
  }
  id v10 = objc_alloc(MEMORY[0x1E4F6EA60]);
  int v11 = v9;
  uint64_t v12 = 0;
LABEL_15:
  uint64_t v13 = [v10 initWithTransferGUID:v11 isRemoved:v12];
LABEL_21:
  uint64_t v8 = (void *)v13;
LABEL_31:

LABEL_32:
  return v8;
}

+ (id)_IMDCoreSpotlightCNContactForAddress:(id)a3
{
  return _IMDCoreSpotlightCNContactForAddress(a3);
}

- (void)setNotificationCenter:(id)a3
{
}

- (UNNotificationCategory)incomingMessageNotificationCategory
{
  return self->_incomingMessageNotificationCategory;
}

- (void)setIncomingMessageNotificationCategory:(id)a3
{
}

- (UNNotificationCategory)incomingFilesNotificationCategory
{
  return self->_incomingFilesNotificationCategory;
}

- (void)setIncomingFilesNotificationCategory:(id)a3
{
}

- (IMBusinessNameManager)businessNameManager
{
  return self->_businessNameManager;
}

- (void)setBusinessNameManager:(id)a3
{
}

- (CNContact)meContact
{
  return self->_meContact;
}

- (void)setMeContact:(id)a3
{
}

- (NSSet)meTokens
{
  return self->_meTokens;
}

- (void)setMeTokens:(id)a3
{
}

- (NSSet)activeAccountAliases
{
  return self->_activeAccountAliases;
}

- (void)setActiveAccountAliases:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_activeAccountAliases, 0);
  objc_storeStrong((id *)&self->_meTokens, 0);
  objc_storeStrong((id *)&self->_meContact, 0);
  objc_storeStrong((id *)&self->_businessNameManager, 0);
  objc_storeStrong((id *)&self->_incomingFilesNotificationCategory, 0);
  objc_storeStrong((id *)&self->_incomingMessageNotificationCategory, 0);
  objc_storeStrong((id *)&self->_notificationCenter, 0);
}

- (BOOL)imagePreviewIsMultiFrameAtFileURL:(id)a3
{
  uint64_t v3 = sub_1AFC71AC8();
  uint64_t v4 = *(void *)(v3 - 8);
  MEMORY[0x1F4188790]();
  id v6 = (char *)&v9 - ((v5 + 15) & 0xFFFFFFFFFFFFFFF0);
  sub_1AFC71AA8();
  char v7 = sub_1AFC57F74((uint64_t)v6);
  (*(void (**)(char *, uint64_t))(v4 + 8))(v6, v3);
  return v7 & 1;
}

- (BOOL)copyFirstFrameOfMultiFrameImageAtFileURL:(id)a3 toFileURL:(id)a4
{
  uint64_t v5 = sub_1AFC71AC8();
  uint64_t v6 = *(void *)(v5 - 8);
  uint64_t v7 = *(void *)(v6 + 64);
  ((void (*)(void))MEMORY[0x1F4188790])();
  unint64_t v8 = (v7 + 15) & 0xFFFFFFFFFFFFFFF0;
  uint64_t v9 = sub_1AFC71AA8();
  MEMORY[0x1F4188790](v9);
  sub_1AFC71AA8();
  id v10 = self;
  LOBYTE(self) = sub_1AFC56E60((uint64_t)&v13 - v8);

  int v11 = *(void (**)(char *, uint64_t))(v6 + 8);
  v11((char *)&v13 - v8, v5);
  v11((char *)&v13 - v8, v5);
  return self & 1;
}

@end