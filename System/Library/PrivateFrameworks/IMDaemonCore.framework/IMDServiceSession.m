@interface IMDServiceSession
+ (id)__allServiceSessionsWeakReferenceArray;
+ (id)_firewallUserNotificationForService:(id)a3;
+ (id)allServiceSessions;
+ (id)existingServiceSessionForService:(id)a3;
+ (void)__registerNewServiceSession:(id)a3;
+ (void)initialize;
- (BOOL)_alwaysAllowMarkingSent;
- (BOOL)_canHandleTransferAccept:(id)a3;
- (BOOL)_canInsertDisplayNameUpdateItemForChat:(id)a3;
- (BOOL)_canMarkMessageAsSent:(id)a3;
- (BOOL)_canUpgradeExistingMessageItem:(id)a3 replacementReplicatedMessageItem:(id)a4;
- (BOOL)_didReceiveMessageDeliveryReceiptForMessageID:(id)a3 attempts:(int64_t)a4 date:(id)a5 account:(id)a6;
- (BOOL)_isActivated;
- (BOOL)_isMessageSWYSpamMessage:(id)a3 inChat:(id)a4;
- (BOOL)_isTransferAvailableForDownload:(id)a3;
- (BOOL)_messageDowngradesWhenSentFromCurrentService:(id)a3;
- (BOOL)_messageUpgradesWhenSentFromCurrentService:(id)a3;
- (BOOL)_processesNetworkEvents;
- (BOOL)_shouldBlackholeGroupChatFromSender:(id)a3 toRecipient:(id)a4 withOtherParticipants:(id)a5 forAccount:(id)a6;
- (BOOL)_shouldBroadcastSendFailures;
- (BOOL)_shouldConvergeChatParticipants:(id)a3 withHandleInfo:(id)a4;
- (BOOL)_shouldDropSendingMessage;
- (BOOL)_shouldShowSWYQuickActionForMessage:(id)a3 outAppName:(id *)a4 outBundleID:(id *)a5;
- (BOOL)_storeMessage:(id)a3 chatIdentifier:(id)a4 localChat:(id)a5 style:(unsigned __int8)a6 account:(id)a7 messagesToPostArray:(id)a8;
- (BOOL)acceptsIncomingReplicatedMessagesFromAccount:(id)a3 toIdentifier:(id)a4 isSOS:(BOOL)a5;
- (BOOL)accountNeedsLogin;
- (BOOL)accountNeedsPassword;
- (BOOL)accountShouldBeAlwaysLoggedIn;
- (BOOL)allowedAsChild;
- (BOOL)allowedToOverwriteOriginalGroupIDForChat:(id)a3;
- (BOOL)blockIdleStatus;
- (BOOL)canMakeExpireStateChecks;
- (BOOL)chatCanMergeWithSuperChat:(id)a3;
- (BOOL)didReceiveMessageDeliveryReceiptForMessageID:(id)a3 date:(id)a4;
- (BOOL)didReceiveMessageDeliveryReceiptForMessageID:(id)a3 date:(id)a4 account:(id)a5;
- (BOOL)didReceiveMessages:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 fromIDSID:(id)a7;
- (BOOL)equalID:(id)a3 andID:(id)a4;
- (BOOL)hasCapability:(unint64_t)a3;
- (BOOL)hasValidDowngradeRequestForHandleID:(id)a3;
- (BOOL)isActive;
- (BOOL)isAwaitingStorageTimer;
- (BOOL)isOutgoingReplicationEnabled;
- (BOOL)isReplicating;
- (BOOL)messageServiceNamed:(id)a3 canProcessMessagesFromServiceNamed:(id)a4;
- (BOOL)networkConditionsAllowLogin;
- (BOOL)overrideNetworkAvailability;
- (BOOL)readReceiptsGloballyEnabled;
- (BOOL)reflectMarkUnreadToPeerDevicesForMessageGUID:(id)a3;
- (BOOL)reflectRecoverChatToPeerDevicesForMessageGUID:(id)a3;
- (BOOL)sendNicknameUpdatesToPeerDevices:(id)a3 toDestinations:(id)a4;
- (BOOL)shouldImitateGroupChatUsingChatRooms;
- (BOOL)shouldInferRecoverableDeleteForCommandDictionary:(id)a3;
- (BOOL)shouldSendReadReceiptsForChat:(id)a3 style:(unsigned __int8)a4;
- (BOOL)testOverrideTextValidationDidFail;
- (BOOL)useSSL;
- (BOOL)warnIfPortBlocked:(int)a3 forAction:(id)a4;
- (Class)spotlightItemRecorderClass;
- (IMDAccount)account;
- (IMDAccount)replicationAccount;
- (IMDChatRegistry)chatRegistry;
- (IMDService)replicationService;
- (IMDService)service;
- (IMDServiceAttachmentController)baseAttachmentController;
- (IMDServiceSession)initWithAccount:(id)a3 service:(id)a4;
- (IMDServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5;
- (IMDServiceSession)mainSession;
- (IMDServiceSession)replicationProxy;
- (NSArray)accounts;
- (NSArray)allBuddies;
- (NSArray)replicationSessions;
- (NSDictionary)accountDefaults;
- (NSDictionary)buddyPictures;
- (NSDictionary)buddyProperties;
- (NSDictionary)registrationAlertInfo;
- (NSMutableArray)serviceSessionDelegates;
- (NSNumber)globalReadReceiptSettingVersion;
- (NSString)accountID;
- (NSString)displayName;
- (NSString)password;
- (NSString)proxyAccount;
- (NSString)proxyHost;
- (NSString)proxyPassword;
- (NSString)serverHost;
- (_FZChatRoomValidity)validityOfChatRoomName:(id)a3;
- (id)_IDSService;
- (id)_autoReplier;
- (id)_chatForMemberStatusChange:(id)a3;
- (id)_chatsForDeleteAndRecoveryChatMetadataDictionary:(id)a3;
- (id)_collaborationMessageProcessingQueue;
- (id)_determineResultMessageForInput:(id)a3 output:(id)a4 original:(id)a5;
- (id)_downgradableServiceNames;
- (id)_fetchMessagesFromChat:(id)a3 onService:(id)a4 numberOfMessages:(unint64_t)a5;
- (id)_guidForChat:(id)a3 style:(unsigned __int8)a4;
- (id)_predominantServiceForChat:(id)a3 usingMessageThreshold:(unint64_t)a4;
- (id)_revokeSiblingMessagesForReplication:(id)a3;
- (id)_sharedAccountController;
- (id)_sharedMessageStore;
- (id)_transcodeController;
- (id)allowList;
- (id)bestCandidateGroupChatWithFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7;
- (id)bestCandidateGroupChatWithFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7 originalGroupID:(id)a8;
- (id)blockList;
- (id)broadcaster;
- (id)broadcasterForACConferenceListeners;
- (id)broadcasterForAVConferenceListeners;
- (id)broadcasterForChatListeners;
- (id)broadcasterForChatListenersWithBlackholeStatus:(BOOL)a3;
- (id)broadcasterForChatObserverListeners;
- (id)broadcasterForCollaborationListeners;
- (id)broadcasterForNotificationsListeners;
- (id)broadcasterForVCConferenceListeners;
- (id)canonicalFormOfChatRoom:(id)a3;
- (id)canonicalFormOfID:(id)a3;
- (id)canonicalFormOfID:(id)a3 withIDSensitivity:(int)a4;
- (id)chatForChatIdentifier:(id)a3 style:(unsigned __int8)a4;
- (id)chatForChatIdentifier:(id)a3 style:(unsigned __int8)a4 account:(id)a5;
- (id)chatForItemWithGUID:(id)a3;
- (id)chatRoomForGroupChatIdentifier:(id)a3;
- (id)defaultChatSuffix;
- (id)deleteCommandDictionaryWithIncomingDictionary:(id)a3 inferredRecoverableDeleteForLegacyCommandsWithDate:(id)a4;
- (id)didChangeMemberStatus:(id)a3;
- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 forChat:(id)a5 style:(unsigned __int8)a6;
- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9;
- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9 account:(id)a10;
- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9 account:(id)a10 destinationCallerID:(id)a11;
- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9 account:(id)a10 destinationCallerID:(id)a11 messageTime:(id)a12;
- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9 account:(id)a10 destinationCallerID:(id)a11 messageTime:(id)a12 messageID:(id)a13 silently:(BOOL)a14;
- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9 account:(id)a10 destinationCallerID:(id)a11 messageTime:(id)a12 silently:(BOOL)a13;
- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 unformattedNumber:(id)a5 countryCode:(id)a6 forChat:(id)a7 style:(unsigned __int8)a8;
- (id)existingChatForID:(id)a3;
- (id)existingChatsForGroupID:(id)a3;
- (id)existingChatsForIDs:(id)a3 style:(unsigned __int8)a4;
- (id)groupChatIdentifierForChatRoom:(id)a3;
- (id)groupIDForChat:(id)a3;
- (id)groups;
- (id)itemWithGUID:(id)a3;
- (id)localPropertiesOfBuddy:(id)a3;
- (id)localProperty:(id)a3 ofBuddy:(id)a4;
- (id)loginID;
- (id)networkMonitor;
- (id)otcUtilities;
- (id)outgoingReplicationCallerIDForChat:(id)a3;
- (id)pictureKeyForBuddy:(id)a3;
- (id)pictureOfBuddy:(id)a3;
- (id)preferredAccountForReplicationOnService:(id)a3 eligibleAccounts:(id)a4;
- (id)property:(id)a3 ofBuddy:(id)a4;
- (id)server;
- (id)sessionSpecificTransferIDForTransferID:(id)a3;
- (id)storageController;
- (int)registrationError;
- (int64_t)maxSizePerAttachmentWithCount:(int)a3 forChat:(id)a4;
- (int64_t)maxSizePerAttachmentWithCount:(int)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5;
- (int64_t)proxyType;
- (int64_t)registrationStatus;
- (int64_t)transcodeTarget;
- (unint64_t)capabilities;
- (unint64_t)pendingReadReceiptFromStorageCount;
- (unsigned)blockingMode;
- (unsigned)proxyPort;
- (unsigned)serverPort;
- (void)__forceSetLoginStatus:(unint64_t)a3 oldStatus:(unint64_t)a4 message:(id)a5 reason:(int)a6 properties:(id)a7 account:(id)a8;
- (void)_abandonPWFetcher;
- (void)_abandonSystemProxySettingsFetcher;
- (void)_autoReconnectTimer:(id)a3;
- (void)_blastDoorProcessingWithIMMessageItem:(id)a3 chat:(id)a4 account:(id)a5 fromToken:(id)a6 fromIDSID:(id)a7 fromIdentifier:(id)a8 toIdentifier:(id)a9 participants:(id)a10 groupName:(id)a11 groupID:(id)a12 isFromMe:(BOOL)a13 isLastFromStorage:(BOOL)a14 isFromStorage:(BOOL)a15 hideLockScreenNotification:(BOOL)a16 wantsCheckpointing:(BOOL)a17 needsDeliveryReceipt:(id)a18 messageBalloonPayloadAttachmentDictionary:(id)a19 inlineAttachments:(id)a20 attributionInfoArray:(id)a21 nicknameDictionary:(id)a22 availabilityVerificationRecipientChannelIDPrefix:(id)a23 availabilityVerificationRecipientEncryptionValidationToken:(id)a24 availabilityOffGridRecipientSubscriptionValidationToken:(id)a25 availabilityOffGridRecipientEncryptionValidationToken:(id)a26 idsService:(id)a27 messageContext:(id)a28 isFromTrustedSender:(BOOL)a29 isFromSnapTrustedSender:(BOOL)a30 completionBlock:(id)a31;
- (void)_calculateHandleInfoOverrideIfPermittedForChatIdentifier:(id)a3 style:(unsigned __int8)a4 completion:(id)a5;
- (void)_callMonitorStateChanged:(id)a3;
- (void)_checkMessageForENURL:(id)a3;
- (void)_checkMessageForOneTimeCodes:(id)a3;
- (void)_clearAutoReconnectTimer;
- (void)_clearDowngradeMarkersForChat:(id)a3;
- (void)_clearNetworkMonitor;
- (void)_clearOffGridFlagForMessagesInChatWithChatIdentifier:(id)a3 account:(id)a4;
- (void)_configureAccountInformationOnItem:(id)a3 withAccount:(id)a4;
- (void)_configureIdentifierForOutgoingItem:(id)a3 withIdentifier:(id)a4 withStyle:(unsigned __int8)a5;
- (void)_configureSessionInformationOnItem:(id)a3 toChat:(id)a4 withStyle:(unsigned __int8)a5 forAccount:(id)a6;
- (void)_configureSyndicationRangesForMessage:(id)a3 forChat:(id)a4 withSyndicationStatus:(int64_t)a5;
- (void)_configureTimeOnOutgoingItem:(id)a3;
- (void)_data_connection_readyWithAccount:(id)a3;
- (void)_didReceiveMessagePlayedForMessageID:(id)a3 date:(id)a4 attempts:(int64_t)a5 completionBlock:(id)a6;
- (void)_didReceiveMessagePlayedReceiptForMessageID:(id)a3 date:(id)a4 attempts:(int64_t)a5 completionBlock:(id)a6;
- (void)_didReceiveMessageReadForMessageID:(id)a3 date:(id)a4 attempts:(int64_t)a5 completionBlock:(id)a6;
- (void)_didReceiveMessageReadReceiptForMessageID:(id)a3 date:(id)a4 attempts:(int64_t)a5 completionBlock:(id)a6;
- (void)_didReceiveMessageSavedForMessageID:(id)a3 ofType:(int64_t)a4 forChat:(id)a5 fromHandle:(id)a6 fromMe:(BOOL)a7 date:(id)a8 attempts:(int64_t)a9 account:(id)a10 completionBlock:(id)a11;
- (void)_didReceivePotentialCollaborationMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6;
- (void)_doLoginIgnoringProxy:(BOOL)a3;
- (void)_doLoginIgnoringProxy:(BOOL)a3 withAccount:(id)a4;
- (void)_expireStateTimerFired;
- (void)_handleExpireStateDictionary:(id)a3;
- (void)_handleFileTransferAccepted:(id)a3;
- (void)_handleFileTransferBatchAccepted:(id)a3;
- (void)_handleRoutingWithDictionary:(id)a3;
- (void)_handleScheduledMessageFailure:(id)a3;
- (void)_handleWatchdogWithDictionary:(id)a3;
- (void)_login_checkUsernameAndPasswordWithAccount:(id)a3;
- (void)_login_serverSettingsReadyWithAccount:(id)a3;
- (void)_login_usernameAndPasswordReadyWithAccount:(id)a3;
- (void)_managedPrefsNotification:(id)a3;
- (void)_mapRoomChatToGroupChat:(id *)a3 style:(unsigned __int8 *)a4;
- (void)_markChatAsDowngraded:(id)a3;
- (void)_messageStoreCompletion:(BOOL)a3 inputMessage:(id)a4 outputMessage:(id)a5 originalMessage:(id)a6 completionBlock:(id)a7;
- (void)_networkChanged:(id)a3;
- (void)_processNetworkMonitorUpdate;
- (void)_processPotentialNetworkChange;
- (void)_reconnectIfNecessary;
- (void)_reconnectIfNecessaryWithAccount:(id)a3;
- (void)_removeChatGuidFromCoreDuet:(id)a3;
- (void)_replicationSessionsChanged;
- (void)_requestGroupPhotoResendForChatGUID:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5;
- (void)_resetTransferToTapDownloadState:(id)a3;
- (void)_routingTimerFired;
- (void)_setAutoReconnectTimer;
- (void)_setOutgoingFlagsOnMessage:(id)a3;
- (void)_setPendingNetworkMonitorUpdate;
- (void)_setReplyGUIDOnMessage:(id)a3 forChat:(id)a4;
- (void)_setSortIDForMessage:(id)a3 forChat:(id)a4;
- (void)_storeTranscriptItem:(id)a3 inChat:(id)a4 account:(id)a5;
- (void)_updateExpireStateForMessageGUID:(id)a3;
- (void)_updateExpireStateTimerWithInterval:(double)a3;
- (void)_updateInputMessage:(id)a3 forExistingMessage:(id)a4;
- (void)_updateLastMessageTimeStampForChat:(id)a3 broadcaster:(id)a4;
- (void)_updateNetworkMonitorFromAccountDefaultsIgnoringProxy:(BOOL)a3;
- (void)_updateNetworkMonitorWithRemoteHost:(id)a3;
- (void)_updateRoutingForMessageGUID:(id)a3 chatGUID:(id)a4 error:(unsigned int)a5 account:(id)a6;
- (void)_updateRoutingTimerWithInterval:(double)a3;
- (void)_updateUndeliveredMessagesPendingSatelliteSendForChatWithIdentifier:(id)a3 account:(id)a4;
- (void)_updateWatchdogForMessageGUID:(id)a3;
- (void)_updateWatchdogTimerWithInterval:(double)a3;
- (void)_watchdogTimerFired;
- (void)_wentOfflineWithAccount:(id)a3;
- (void)accountDefaultsChanged:(id)a3;
- (void)addAccount:(id)a3;
- (void)addDelegate:(id)a3;
- (void)autoLogin;
- (void)autoReconnect;
- (void)autoReconnectWithAccount:(id)a3;
- (void)autoReplier:(id)a3 generatedAutoReplyText:(id)a4 forChat:(id)a5;
- (void)autoReplier:(id)a3 receivedUrgentRequestForMessages:(id)a4;
- (void)autoReplier:(id)a3 sendDeliveredQuietlyReceiptForMessages:(id)a4 forIncomingMessageFromIDSID:(id)a5 inChat:(id)a6 withWillSendToDestinationsHandler:(id)a7;
- (void)autoReplier:(id)a3 sendNotifyRecipientCommandForMessages:(id)a4 inChat:(id)a5;
- (void)beginBuddyChanges;
- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4;
- (void)cancelScheduledMessageWithGUID:(id)a3;
- (void)cancelScheduledMessageWithGUID:(id)a3 destinations:(id)a4 cancelType:(unint64_t)a5;
- (void)canonicalizeChatIdentifier:(id *)a3 style:(unsigned __int8 *)a4;
- (void)changeLocalProperty:(id)a3 ofBuddy:(id)a4 to:(id)a5;
- (void)changeProperty:(id)a3 ofBuddy:(id)a4 to:(id)a5;
- (void)clearDowngradeRequestForHandleID:(id)a3;
- (void)clearLocalProperties;
- (void)clearPropertiesOfBuddy:(id)a3;
- (void)closeSessionChatID:(id)a3 identifier:(id)a4 didDeleteConversation:(BOOL)a5 style:(unsigned __int8)a6;
- (void)closeSessionForChat:(id)a3 chatGUID:(id)a4 didDeleteConversation:(BOOL)a5 style:(unsigned __int8)a6;
- (void)dealloc;
- (void)declineInvitationToChatID:(id)a3 identifier:(id)a4 style:(unsigned __int8)a5;
- (void)decrementPendingReadReceiptFromStorageCount;
- (void)deleteAllDataWithCompletionHandler:(id)a3;
- (void)deleteChatsForCommandDictionary:(id)a3;
- (void)deleteExistingMessageAwaitingReplacementWithFallbackHash:(id)a3 chatIdentifier:(id)a4;
- (void)deleteMessagePartsForCommandDictionary:(id)a3;
- (void)deleteMessagesForCommandDictionary:(id)a3;
- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4;
- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 handleInfo:(id)a7;
- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 handleInfo:(id)a7 account:(id)a8 isBlackholed:(BOOL)a9;
- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 handleInfo:(id)a8;
- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 handleInfo:(id)a9;
- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 handleInfo:(id)a8;
- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 handleInfo:(id)a8 category:(int64_t)a9 spamExtensionName:(id)a10;
- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10;
- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 handleInfo:(id)a5;
- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 handleInfo:(id)a5 account:(id)a6;
- (void)didJoinReadOnlyChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 handleInfo:(id)a7 category:(int64_t)a8 spamExtensionName:(id)a9;
- (void)didLeaveChat:(id)a3 style:(unsigned __int8)a4;
- (void)didLeaveChat:(id)a3 style:(unsigned __int8)a4 account:(id)a5;
- (void)didLeaveChat:(id)a3 style:(unsigned __int8)a4 account:(id)a5 messageID:(id)a6;
- (void)didReceiveBalloonPayload:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 messageGUID:(id)a6 account:(id)a7;
- (void)didReceiveDisplayNameChange:(id)a3 fromID:(id)a4 toIdentifier:(id)a5 forChat:(id)a6 style:(unsigned __int8)a7 account:(id)a8;
- (void)didReceiveDisplayNameChange:(id)a3 guid:(id)a4 fromID:(id)a5 toIdentifier:(id)a6 forChat:(id)a7 style:(unsigned __int8)a8 account:(id)a9;
- (void)didReceiveError:(unsigned int)a3 forMessageID:(id)a4 forceError:(BOOL)a5;
- (void)didReceiveError:(unsigned int)a3 forMessageID:(id)a4 forceError:(BOOL)a5 account:(id)a6;
- (void)didReceiveErrorMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5;
- (void)didReceiveInvitation:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5;
- (void)didReceiveMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 fromIDSID:(id)a7;
- (void)didReceiveMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 fromIDSID:(id)a6;
- (void)didReceiveMessageEditingSendFailure:(unsigned int)a3 forMessageGUID:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6;
- (void)didReceiveMessageEditingUnsupportedHandleIDs:(id)a3 forMessageGUID:(id)a4 partIndex:(int64_t)a5 previousMessage:(id)a6 backwardCompatibilityMessageGUID:(id)a7;
- (void)didReceiveMessagePlayedForMessageID:(id)a3 date:(id)a4 completionBlock:(id)a5;
- (void)didReceiveMessagePlayedReceiptForMessageID:(id)a3 date:(id)a4 completionBlock:(id)a5;
- (void)didReceiveMessageReadForMessageID:(id)a3 date:(id)a4 completionBlock:(id)a5;
- (void)didReceiveMessageReadReceiptForMessageID:(id)a3 date:(id)a4 completionBlock:(id)a5;
- (void)didReceiveMessageSavedForMessageID:(id)a3 ofType:(int64_t)a4 forChat:(id)a5 fromHandle:(id)a6 fromMe:(BOOL)a7 date:(id)a8 account:(id)a9 completionBlock:(id)a10;
- (void)didReceiveOffGridStatus:(BOOL)a3 forID:(id)a4 messageGUID:(id)a5 account:(id)a6;
- (void)didReceiveReplaceMessageID:(int)a3 forChat:(id)a4 style:(unsigned __int8)a5;
- (void)didSendBalloonPayload:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 messageGUID:(id)a6 account:(id)a7 completionBlock:(id)a8;
- (void)didSendDeliveredQuietlyReceiptForMessageID:(id)a3;
- (void)didSendDeliveredQuietlyReceiptForMessageID:(id)a3 account:(id)a4;
- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5;
- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 forceDate:(id)a7;
- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 forceDate:(id)a7 itemIsComingFromStorage:(BOOL)a8;
- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 forceDate:(id)a6;
- (void)didSendMessageEditForMessageGUID:(id)a3;
- (void)didSendMessagePlayedReceiptForMessageID:(id)a3;
- (void)didSendMessagePlayedReceiptForMessageID:(id)a3 account:(id)a4;
- (void)didSendMessageReadReceiptForMessageID:(id)a3;
- (void)didSendMessageReadReceiptForMessageID:(id)a3 account:(id)a4;
- (void)didSendMessageSavedReceiptForMessageID:(id)a3;
- (void)didSendMessageSavedReceiptForMessageID:(id)a3 account:(id)a4;
- (void)didSendNotifyRecipientCommandForMessageID:(id)a3;
- (void)didSendNotifyRecipientCommandForMessageID:(id)a3 account:(id)a4;
- (void)didSendSyndicationActionItem:(id)a3 forChat:(id)a4;
- (void)didStartSendingMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5;
- (void)didStartSendingMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6;
- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5;
- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 account:(id)a6;
- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 context:(id)a6;
- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 handleInfo:(id)a8;
- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 handleInfo:(id)a8 account:(id)a9 isBlackholed:(BOOL)a10;
- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 handleInfo:(id)a9;
- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10;
- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10 account:(id)a11 category:(int64_t)a12 spamExtensionName:(id)a13 isBlackholed:(BOOL)a14;
- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10 account:(id)a11 isBlackholed:(BOOL)a12;
- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 handleInfo:(id)a9 account:(id)a10 category:(int64_t)a11 spamExtensionName:(id)a12;
- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 lastAddressedHandle:(id)a9 lastAddressedSIMID:(id)a10 handleInfo:(id)a11;
- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 lastAddressedHandle:(id)a9 lastAddressedSIMID:(id)a10 handleInfo:(id)a11 account:(id)a12 category:(int64_t)a13 spamExtensionName:(id)a14 isBlackholed:(BOOL)a15;
- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 lastAddressedHandle:(id)a9 lastAddressedSIMID:(id)a10 handleInfo:(id)a11 account:(id)a12 isBlackholed:(BOOL)a13;
- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 handleInfo:(id)a6;
- (void)disallowReconnection;
- (void)downgradeRequestedForHandleID:(id)a3 expirationDate:(id)a4 preferredService:(id)a5;
- (void)endBuddyChanges;
- (void)fallbackToDownloadIfPossible:(id)a3 transfer:(id)a4;
- (void)fetchIncomingPendingMessagesFromHandlesIDs:(id)a3;
- (void)incrementPendingReadReceiptFromStorageCount;
- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChat:(id)a5 style:(unsigned __int8)a6;
- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 joinProperties:(id)a7;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 joinProperties:(id)a9;
- (void)joinChatID:(id)a3 handleInfo:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 joinProperties:(id)a10;
- (void)login;
- (void)loginWithAccount:(id)a3;
- (void)logout;
- (void)logoutServiceSessionWithAccount:(id)a3;
- (void)logoutWithAccount:(id)a3;
- (void)markBuddiesAsChanged:(id)a3;
- (void)markItemFailedWithGUID:(id)a3 errorCode:(unsigned int)a4;
- (void)markItemForOnGridRelay:(id)a3;
- (void)networkMonitorDidUpdate:(id)a3;
- (void)noteBadPassword;
- (void)noteItemFromStorage:(id)a3;
- (void)noteLastItemFromStorage:(id)a3;
- (void)noteLastItemProcessed;
- (void)noteSuppressedMessageUpdate:(id)a3;
- (void)notifyDidSendMessageID:(id)a3;
- (void)notifyDidSendMessageID:(id)a3 account:(id)a4 shouldNotify:(BOOL)a5;
- (void)notifyDidSendMessageID:(id)a3 account:(id)a4 shouldNotify:(BOOL)a5 wasDowngraded:(BOOL)a6;
- (void)notifyDidSendMessageID:(id)a3 account:(id)a4 shouldNotify:(BOOL)a5 wasDowngraded:(BOOL)a6 wasInterworked:(BOOL)a7;
- (void)notifyDidSendMessageID:(id)a3 shouldNotify:(BOOL)a4;
- (void)overwritePerChatReadReceiptSettingsWithGlobalValue:(BOOL)a3;
- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 account:(id)a7 completionBlock:(id)a8;
- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 account:(id)a7 didReplaceMessageBlock:(id)a8 completionBlock:(id)a9;
- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 completionBlock:(id)a7;
- (void)recoverChatsForCommandDictionary:(id)a3;
- (void)refreshServiceCapabilities;
- (void)registerChat:(id)a3 style:(unsigned __int8)a4;
- (void)registerChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10 account:(id)a11 isBlackholed:(BOOL)a12;
- (void)relayLegacySatelliteMessage:(id)a3 toChat:(id)a4;
- (void)removeAccount:(id)a3;
- (void)removeChatID:(id)a3 identifier:(id)a4 style:(unsigned __int8)a5;
- (void)removeDelegate:(id)a3;
- (void)renewTTLForScheduledAttachmentTransfer:(id)a3;
- (void)requestGroupPhotoIfNecessary:(id)a3 incomingParticipantVersion:(int64_t)a4 incomingGroupPhotoCreationTime:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 messageIsFromStorage:(BOOL)a8;
- (void)retryGroupPhotoUpload:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8;
- (void)revokeSentMessage:(id)a3 inChat:(id)a4;
- (void)sendDeleteCommand:(id)a3 forChatGUID:(id)a4;
- (void)sendDeliveredQuietlyReceiptForMessage:(id)a3 forIncomingMessageFromIDSID:(id)a4 toChatGuid:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 withWillSendToDestinationsHandler:(id)a8;
- (void)sendDeliveryReceiptForMessageID:(id)a3 toID:(id)a4 deliveryContext:(id)a5 needsDeliveryReceipt:(id)a6 callerID:(id)a7 account:(id)a8;
- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10;
- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9;
- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 retractingPartIndexes:(id)a5 toChatIdentifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8;
- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendJunkReportMessage:(id)a3;
- (void)sendLazuliSpamReport:(id)a3 isBot:(BOOL)a4 spamType:(unint64_t)a5;
- (void)sendLocationSharingInfo:(id)a3 toID:(id)a4 completionBlock:(id)a5;
- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5;
- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6;
- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 destinationHandles:(id)a6;
- (void)sendMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendNicknameInfoToChatID:(id)a3;
- (void)sendNotifyRecipientCommandForMessage:(id)a3 toChatGuid:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendPlayedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 reflectOnly:(BOOL)a7;
- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendSyndicationAction:(id)a3 toChatsWithIdentifiers:(id)a4;
- (void)sentDowngradeRequestToHandleID:(id)a3 fromID:(id)a4;
- (void)serviceSessionDidLoginWithAccount:(id)a3;
- (void)serviceSessionDidLogoutWithAccount:(id)a3;
- (void)serviceSessionDidLogoutWithMessage:(id)a3 reason:(int)a4 properties:(id)a5 account:(id)a6;
- (void)sessionDidBecomeActive;
- (void)sessionWillBecomeInactiveWithAccount:(id)a3;
- (void)setGlobalReadReceiptSettingVersion:(id)a3;
- (void)setPendingReadReceiptFromStorageCount:(unint64_t)a3;
- (void)setProperties:(id)a3 ofParticipant:(id)a4 inChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7;
- (void)setReadReceiptsGloballyEnabled:(BOOL)a3;
- (void)setRegistrationStatus:(int64_t)a3 error:(int)a4 alertInfo:(id)a5;
- (void)storeItem:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5;
- (void)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 calculateUnreadCount:(BOOL)a7 flagMask:(unint64_t)a8 didReplaceBlock:(id)a9 shouldStoreBlock:(id)a10 didStoreBlock:(id)a11 block:(id)a12;
- (void)systemProxySettingsFetcher:(id)a3 retrievedAccount:(id)a4 password:(id)a5;
- (void)systemProxySettingsFetcher:(id)a3 retrievedHost:(id)a4 port:(unsigned __int16)a5 protocol:(int64_t)a6;
- (void)updateChatGUID:(id)a3 withLastReadTimeStamp:(int64_t)a4 withLastSeenMessageGUID:(id)a5 fromMe:(BOOL)a6;
- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9;
- (void)useChatRoom:(id)a3 forGroupChatIdentifier:(id)a4;
- (void)userNotificationDidFinish:(id)a3;
- (void)willMoveChatToRecentlyDeleted:(id)a3;
- (void)willRemoveChat:(id)a3;
@end

@implementation IMDServiceSession

- (id)groups
{
  return 0;
}

- (NSDictionary)buddyProperties
{
  [(NSRecursiveLock *)self->_lock lock];
  v3 = (void *)[(NSMutableDictionary *)self->_buddies copy];
  [(NSRecursiveLock *)self->_lock unlock];

  return (NSDictionary *)v3;
}

- (unint64_t)capabilities
{
  v3 = [(IMDServiceSession *)self service];
  int v4 = [v3 supportsCapability:*MEMORY[0x1E4F6E000]];

  if (v4) {
    uint64_t v5 = 8;
  }
  else {
    uint64_t v5 = 0;
  }
  v6 = [(IMDServiceSession *)self service];
  int v7 = [v6 supportsCapability:*MEMORY[0x1E4F6E080]];

  if (v7) {
    v5 |= 0x400uLL;
  }
  v8 = [(IMDServiceSession *)self service];
  int v9 = [v8 supportsCapability:*MEMORY[0x1E4F6E0A8]];

  if (v9) {
    v5 |= 0x100uLL;
  }
  v10 = [(IMDServiceSession *)self service];
  int v11 = [v10 supportsCapability:*MEMORY[0x1E4F6DFC8]];

  if (v11) {
    v5 |= 0x30uLL;
  }
  v12 = [(IMDServiceSession *)self service];
  int v13 = [v12 supportsCapability:*MEMORY[0x1E4F6E008]];

  if (v13) {
    v5 |= 0x400000000000uLL;
  }
  v14 = [(IMDServiceSession *)self service];
  int v15 = [v14 supportsCapability:*MEMORY[0x1E4F6E0C8]];

  if (v15) {
    unint64_t v16 = v5 | 0x800000000000;
  }
  else {
    unint64_t v16 = v5;
  }
  v17 = [(IMDServiceSession *)self service];
  int v18 = [v17 supportsCapability:*MEMORY[0x1E4F6E088]];

  if (v18) {
    return v16 | 4;
  }
  else {
    return v16;
  }
}

- (IMDService)service
{
  return self->_service;
}

- (BOOL)chatCanMergeWithSuperChat:(id)a3
{
  return 1;
}

+ (id)__allServiceSessionsWeakReferenceArray
{
  if (qword_1EBE2BB08 != -1) {
    dispatch_once(&qword_1EBE2BB08, &unk_1F33907A0);
  }
  v2 = [MEMORY[0x1E4F1CA48] array];
  v3 = (void *)qword_1EBE2BB10;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D96B84A8;
  v7[3] = &unk_1E6B73568;
  id v4 = v2;
  id v8 = v4;
  [v3 enumerateObjectsUsingBlock:v7];
  if ([v4 count]) {
    [(id)qword_1EBE2BB10 removeObjectsInArray:v4];
  }
  id v5 = (id)qword_1EBE2BB10;

  return v5;
}

+ (void)__registerNewServiceSession:(id)a3
{
  id v4 = a3;
  objc_msgSend(a1, "__allServiceSessionsWeakReferenceArray");
  id v6 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [MEMORY[0x1E4F59E30] weakRefWithObject:v4];

  [v6 addObject:v5];
}

+ (id)allServiceSessions
{
  return (id)objc_msgSend((id)qword_1EBE2BB10, "__imArrayByApplyingBlock:", &unk_1F33907C0);
}

+ (id)existingServiceSessionForService:(id)a3
{
  id v4 = a3;
  uint64_t v12 = 0;
  int v13 = &v12;
  uint64_t v14 = 0x3032000000;
  int v15 = sub_1D96B86E8;
  unint64_t v16 = sub_1D96B86F8;
  id v17 = 0;
  id v5 = [a1 allServiceSessions];
  v9[0] = MEMORY[0x1E4F143A8];
  v9[1] = 3221225472;
  v9[2] = sub_1D96B8700;
  v9[3] = &unk_1E6B735B0;
  id v6 = v4;
  id v10 = v6;
  int v11 = &v12;
  [v5 enumerateObjectsUsingBlock:v9];

  id v7 = (id)v13[5];
  _Block_object_dispose(&v12, 8);

  return v7;
}

- (IMDServiceSession)initWithAccount:(id)a3 service:(id)a4
{
  return [(IMDServiceSession *)self initWithAccount:a3 service:a4 replicatingForSession:0];
}

- (IMDServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5
{
  uint64_t v53 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  int v11 = (IMDServiceSession *)a5;
  v46.receiver = self;
  v46.super_class = (Class)IMDServiceSession;
  uint64_t v12 = [(IMDServiceSession *)&v46 init];
  if (v12)
  {
    [MEMORY[0x1E4F6C430] enableNotifications];
    if (v11) {
      int v13 = v11;
    }
    else {
      int v13 = v12;
    }
    objc_storeWeak((id *)&v12->_mainSession, v13);
    pwRequestID = v12->_pwRequestID;
    v12->_pwRequestID = 0;

    v12->_buddyChangeLevel = 0;
    v12->_saveKeychainPassword = 0;
    v12->_badPass = 0;
    int v15 = (NSRecursiveLock *)objc_alloc_init(MEMORY[0x1E4F28FD0]);
    lock = v12->_lock;
    v12->_lock = v15;

    [(NSRecursiveLock *)v12->_lock lock];
    reconnectTimer = v12->_reconnectTimer;
    v12->_reconnectTimer = 0;

    if (v11)
    {
      uint64_t v18 = [(IMDServiceSession *)v11 account];
      p_account = (id *)&v12->_account;
      account = v12->_account;
      v12->_account = (IMDAccount *)v18;

      v21 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      accounts = v12->_accounts;
      v12->_accounts = v21;

      [(NSMutableArray *)v12->_accounts addObject:v9];
      uint64_t v23 = [(IMDServiceSession *)v11 service];
      service = v12->_service;
      v12->_service = (IMDService *)v23;

      uint64_t v25 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:14];
      buddies = v12->_buddies;
      v12->_buddies = (NSMutableDictionary *)v25;

      objc_storeWeak((id *)&v12->_replicationAccount, v9);
      objc_storeWeak((id *)&v12->_replicationService, v10);
    }
    else
    {
      p_account = (id *)&v12->_account;
      objc_storeStrong((id *)&v12->_account, a3);
      v27 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
      v28 = v12->_accounts;
      v12->_accounts = v27;

      [(NSMutableArray *)v12->_accounts addObject:v9];
      objc_storeStrong((id *)&v12->_service, a4);
      uint64_t v29 = [objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:14];
      v30 = v12->_buddies;
      v12->_buddies = (NSMutableDictionary *)v29;
    }
    v31 = [(IMDServiceSession *)v12 service];
    v12->_shouldReconnect = [v31 wantsNullHostReachability];

    if (v12->_shouldReconnect) {
      [(IMDServiceSession *)v12 _setAutoReconnectTimer];
    }
    [(NSRecursiveLock *)v12->_lock unlock];
    v32 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v32 addObserver:v12 selector:sel__managedPrefsNotification_ name:@"__kIMDManagedPreferencesChangedNotification" object:0];

    v33 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v33 addObserver:v12 selector:sel__networkChanged_ name:*MEMORY[0x1E4F6C210] object:0];

    v34 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v34 addObserver:v12 selector:sel__callMonitorStateChanged_ name:*MEMORY[0x1E4F6C150] object:0];

    v35 = [MEMORY[0x1E4F6C3E0] sharedInstance];
    [v35 setWatchesSystemLockState:1];

    v36 = [MEMORY[0x1E4F6C3E0] sharedInstance];
    [v36 addListener:v12];

    if (((v11 == 0) & [v10 supportsOneSessionForAllAccounts]) == 1) {
      objc_msgSend((id)objc_opt_class(), "__registerNewServiceSession:", v12);
    }
    v37 = [[IMDServiceAttachmentController alloc] initWithSession:v12];
    baseAttachmentController = v12->_baseAttachmentController;
    v12->_baseAttachmentController = v37;

    v39 = (NSMutableArray *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
    serviceSessionDelegates = v12->_serviceSessionDelegates;
    v12->_serviceSessionDelegates = v39;

    if (IMOSLoggingEnabled())
    {
      v41 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        id v42 = [*p_account accountID];
        id v43 = [v10 internalName];
        v44 = [v9 accountDefaults];
        *(_DWORD *)buf = 138412802;
        id v48 = v42;
        __int16 v49 = 2112;
        id v50 = v43;
        __int16 v51 = 2112;
        v52 = v44;
        _os_log_impl(&dword_1D967A000, v41, OS_LOG_TYPE_INFO, "initWithAccount: %@       service:%@  defaults: %@", buf, 0x20u);
      }
    }
  }

  return v12;
}

- (void)addDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDServiceSession *)self serviceSessionDelegates];
  [v5 addObject:v4];
}

- (void)removeDelegate:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDServiceSession *)self serviceSessionDelegates];
  [v5 removeObject:v4];
}

- (void)dealloc
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v9 = self;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "DEALLOC: %@", buf, 0xCu);
    }
  }
  id v4 = [MEMORY[0x1E4F6C418] sharedInstance];
  [v4 removeListener:self];

  id v5 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v5 removeObserver:self name:0 object:0];

  id v6 = [MEMORY[0x1E4F6C3E0] sharedInstance];
  [v6 removeListener:self];

  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__processNetworkMonitorUpdate object:0];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_login object:0];
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  [(IMDServiceSession *)self _abandonSystemProxySettingsFetcher];
  [(IMDServiceSession *)self _abandonPWFetcher];
  [(IMDServiceSession *)self _clearAutoReconnectTimer];
  [(IMDServiceSession *)self _clearNetworkMonitor];
  [(NSRecursiveLock *)self->_lock lock];
  [(IMTimer *)self->_messageRoutingTimer invalidate];
  [(IMTimer *)self->_messageExpireStateTimer invalidate];
  [(IMTimer *)self->_messageWatchdogTimer invalidate];
  [(IMDAutoReplying *)self->_messageAutoReplier setReplyDelegate:0];
  [(NSRecursiveLock *)self->_lock unlock];
  v7.receiver = self;
  v7.super_class = (Class)IMDServiceSession;
  [(IMDServiceSession *)&v7 dealloc];
}

- (BOOL)accountNeedsLogin
{
  v2 = [(IMDServiceSession *)self service];
  char v3 = [v2 needsLogin];

  return v3;
}

- (BOOL)accountNeedsPassword
{
  v2 = [(IMDServiceSession *)self service];
  char v3 = [v2 needsPassword];

  return v3;
}

- (BOOL)accountShouldBeAlwaysLoggedIn
{
  v2 = [(IMDServiceSession *)self service];
  char v3 = [v2 shouldBeAlwaysLoggedIn];

  return v3;
}

- (void)addAccount:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412546;
      objc_super v7 = self;
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "[%@ addAccount:%@]", (uint8_t *)&v6, 0x16u);
    }
  }
  [(NSMutableArray *)self->_accounts addObject:v4];
}

- (void)removeAccount:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412546;
      objc_super v7 = self;
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "[%@ removeAccount:%@]", (uint8_t *)&v6, 0x16u);
    }
  }
  [(NSMutableArray *)self->_accounts removeObject:v4];
}

- (BOOL)isActive
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  long long v7 = 0u;
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  v2 = self->_accounts;
  uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
  if (v3)
  {
    uint64_t v4 = *(void *)v8;
    while (2)
    {
      for (uint64_t i = 0; i != v3; ++i)
      {
        if (*(void *)v8 != v4) {
          objc_enumerationMutation(v2);
        }
        if (objc_msgSend(*(id *)(*((void *)&v7 + 1) + 8 * i), "isActive", (void)v7))
        {
          LOBYTE(v3) = 1;
          goto LABEL_11;
        }
      }
      uint64_t v3 = [(NSMutableArray *)v2 countByEnumeratingWithState:&v7 objects:v11 count:16];
      if (v3) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v3;
}

- (NSString)accountID
{
  return [(IMDAccount *)self->_account accountID];
}

- (NSString)displayName
{
  v2 = [(IMDServiceSession *)self service];
  uint64_t v3 = [v2 serviceProperties];
  uint64_t v4 = [v3 objectForKey:*MEMORY[0x1E4F6C088]];

  return (NSString *)v4;
}

- (NSDictionary)accountDefaults
{
  return [(IMDAccount *)self->_account accountDefaults];
}

- (void)markItemForOnGridRelay:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  [v3 setNeedsRelay:1];
  uint64_t v4 = +[IMDMessageStore sharedInstance];
  id v5 = (id)[v4 storeMessage:v3 forceReplace:0 modifyError:1 modifyFlags:1 flagMask:0x40000000000];

  int v6 = [v3 service];
  int v7 = [v6 isEqualToString:*MEMORY[0x1E4F6E1B8]];
  int v8 = IMOSLoggingEnabled();
  if (v7)
  {
    if (v8)
    {
      long long v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        long long v10 = [v3 guid];
        int v13 = 138412290;
        uint64_t v14 = v10;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Marking iMessage Lite message as needing relay, guid: %@", (uint8_t *)&v13, 0xCu);
      }
    }
  }
  else if (v8)
  {
    int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      uint64_t v12 = [v3 guid];
      int v13 = 138412290;
      uint64_t v14 = v12;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Marking SMS Satellite message as needing relay, guid: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  IMSetDomainBoolForKey();
}

- (BOOL)isReplicating
{
  v2 = self;
  id v3 = [(IMDServiceSession *)self mainSession];
  LOBYTE(v2) = v3 != v2;

  return (char)v2;
}

- (NSArray)replicationSessions
{
  if ([(IMDServiceSession *)self isReplicating])
  {
    id v3 = (void *)MEMORY[0x1E4F1CBF0];
  }
  else
  {
    uint64_t v4 = [(IMDServiceSession *)self account];
    id v3 = [v4 replicationSessions];
  }

  return (NSArray *)v3;
}

- (IMDServiceSession)replicationProxy
{
  if ([(IMDServiceSession *)self isOutgoingReplicationEnabled])
  {
    replicationProxy = self->_replicationProxy;
    if (!replicationProxy)
    {
      uint64_t v4 = [(IMDServiceSession *)self replicationSessions];
      if ([v4 count])
      {
        id v5 = (IMDServiceSession *)[objc_alloc(MEMORY[0x1E4F6E750]) initWithTargets:v4];
        int v6 = self->_replicationProxy;
        self->_replicationProxy = v5;
      }
      replicationProxy = self->_replicationProxy;
    }
    int v7 = replicationProxy;
  }
  else
  {
    int v7 = 0;
  }

  return v7;
}

- (void)_replicationSessionsChanged
{
  self->_replicationProxy = 0;
  MEMORY[0x1F41817F8]();
}

- (BOOL)messageServiceNamed:(id)a3 canProcessMessagesFromServiceNamed:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 isEqualToString:v5])
  {
    char v7 = 1;
  }
  else
  {
    int v8 = +[IMDServiceController sharedController];
    long long v9 = [v8 serviceWithName:v6];

    long long v10 = [v9 relayMessageDelegates];
    char v7 = [v10 containsObject:v5];
  }
  return v7;
}

- (BOOL)acceptsIncomingReplicatedMessagesFromAccount:(id)a3 toIdentifier:(id)a4 isSOS:(BOOL)a5
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Rejecting incoming replicated messages from account: %@, service session not configured for replicated messages", (uint8_t *)&v10, 0xCu);
    }
  }
  return 0;
}

- (id)outgoingReplicationCallerIDForChat:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Returning nil outgoing replication caller ID for chat %@, service session not configured for replicated messages", (uint8_t *)&v6, 0xCu);
    }
  }
  return 0;
}

- (BOOL)isOutgoingReplicationEnabled
{
  return 0;
}

- (id)preferredAccountForReplicationOnService:(id)a3 eligibleAccounts:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v5;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Returning nil preferred account for replication for %@, service session not configured for replicated messages", (uint8_t *)&v9, 0xCu);
    }
  }
  return 0;
}

- (id)sessionSpecificTransferIDForTransferID:(id)a3
{
  id v4 = a3;
  if ([(IMDServiceSession *)self isReplicating])
  {
    id v5 = NSString;
    id v6 = [(IMDServiceSession *)self service];
    id v7 = [v6 internalName];
    uint64_t v8 = [(IMDServiceSession *)self accountID];
    id v9 = [v5 stringWithFormat:@"Replication/%@/%@/%@", v7, v8, v4];
  }
  else
  {
    id v9 = v4;
  }

  return v9;
}

- (void)sessionDidBecomeActive
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = self;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "[%@ sessionDidBecomeActive]", (uint8_t *)&v9, 0xCu);
    }
  }
  self->_activated = 1;
  [(IMDServiceSession *)self _updateNetworkMonitorFromAccountDefaultsIgnoringProxy:0];
  id v4 = [MEMORY[0x1E4F6EAB8] sharedInstance];
  char v5 = [v4 isUnderFirstDataProtectionLock];

  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Not scheduling routing, expire, watchdog timer before first unlock", (uint8_t *)&v9, 2u);
      }
    }
  }
  else
  {
    if (v6)
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Scheduling watchdog after first unlock", (uint8_t *)&v9, 2u);
      }
    }
    [(IMDServiceSession *)self _updateWatchdogTimerWithInterval:60.0];
  }
}

- (void)sessionWillBecomeInactiveWithAccount:(id)a3
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    char v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412546;
      id v7 = self;
      __int16 v8 = 2112;
      id v9 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "[%@ sessionWillBecomeInactiveWithAccount:%@]", (uint8_t *)&v6, 0x16u);
    }
  }
  if (![(IMDServiceSession *)self isActive])
  {
    self->_activated = 0;
    [(IMDServiceSession *)self _clearAutoReconnectTimer];
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__processNetworkMonitorUpdate object:0];
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_login object:0];
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self];
  }
}

- (id)networkMonitor
{
  return self->_networkMonitor;
}

- (void)_clearNetworkMonitor
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
    {
      networkMonitor = self->_networkMonitor;
      int v8 = 138412546;
      id v9 = networkMonitor;
      __int16 v10 = 2112;
      uint64_t v11 = self;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_DEBUG, "-[IMDServiceSession _networkMonitor] monitor: %@:%@", (uint8_t *)&v8, 0x16u);
    }
  }
  int v6 = self->_networkMonitor;
  p_networkMonitor = &self->_networkMonitor;
  [(IMNetworkMonitor *)v6 clear];
  id v7 = *p_networkMonitor;
  *p_networkMonitor = 0;
}

- (void)_updateNetworkMonitorWithRemoteHost:(id)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v4 = (IMNetworkMonitor *)a3;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled())
    {
      char v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        int v6 = [(IMDAccount *)self->_account accountID];
        *(_DWORD *)buf = 138412546;
        v24 = v4;
        __int16 v25 = 2112;
        v26 = v6;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEBUG, "_updateNetworkMonitorWithRemoteHost: %@:%@", buf, 0x16u);
      }
    }
    id v7 = [(IMDServiceSession *)self service];
    uint64_t v8 = [v7 supportsCapability:*MEMORY[0x1E4F6E128]];

    id v9 = [(IMDServiceSession *)self service];
    int v10 = [v9 wantsNullHostReachability];

    networkMonitor = self->_networkMonitor;
    if (v10)
    {
      if (networkMonitor)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
          {
            int v13 = self->_networkMonitor;
            *(_DWORD *)buf = 138412290;
            v24 = v13;
            _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_DEBUG, "Already have connection monitor to global reachability: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        id v17 = (IMNetworkMonitor *)[objc_alloc(MEMORY[0x1E4F6E8B0]) initWithRemoteHost:0 delegate:self supportsConstrainedNetwork:v8];
        uint64_t v18 = self->_networkMonitor;
        self->_networkMonitor = v17;

        if (IMOSLoggingEnabled())
        {
          v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
          {
            v20 = self->_networkMonitor;
            *(_DWORD *)buf = 138412290;
            v24 = v20;
            _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_DEBUG, "Creating connection monitor to global reachability: %@", buf, 0xCu);
          }
        }
        dispatch_time_t v21 = dispatch_time(0, 10000000000);
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1D96BA1EC;
        block[3] = &unk_1E6B73268;
        block[4] = self;
        dispatch_after(v21, MEMORY[0x1E4F14428], block);
      }
    }
    else
    {
      uint64_t v14 = [(IMNetworkMonitor *)networkMonitor remoteHost];
      if ((v4 != 0) != (v14 != 0) || ([(IMNetworkMonitor *)v4 isEqual:v14] & 1) == 0)
      {
        [(IMDServiceSession *)self _clearNetworkMonitor];
        uint64_t v15 = (IMNetworkMonitor *)[objc_alloc(MEMORY[0x1E4F6E8B0]) initWithRemoteHost:v4 delegate:self supportsConstrainedNetwork:v8];
        unint64_t v16 = self->_networkMonitor;
        self->_networkMonitor = v15;
      }
    }
  }
}

- (void)_updateNetworkMonitorFromAccountDefaultsIgnoringProxy:(BOOL)a3
{
  if (self->_activated)
  {
    id v24 = [(IMDServiceSession *)self accountDefaults];
    char v5 = [v24 objectForKey:*MEMORY[0x1E4F6C810]];
    int v6 = [v5 BOOLValue];

    id v7 = [v24 objectForKey:*MEMORY[0x1E4F6C800]];
    int v8 = [v7 BOOLValue];

    id v9 = [v24 objectForKey:*MEMORY[0x1E4F6C808]];
    int v10 = [v9 BOOLValue];

    uint64_t v11 = (void *)MEMORY[0x1E4F6C7D0];
    if (v6)
    {
      uint64_t v12 = (void *)MEMORY[0x1E4F6C7D8];
    }
    else
    {
      uint64_t v11 = (void *)MEMORY[0x1E4F6C7C0];
      uint64_t v12 = (void *)MEMORY[0x1E4F6C7C8];
    }
    int v13 = [v24 objectForKey:*v11];
    uint64_t v14 = [v24 objectForKey:*v12];
    unsigned __int16 v15 = [v14 intValue];

    if (!a3 && v8)
    {
      if (v10)
      {
        [(IMDServiceSession *)self _abandonSystemProxySettingsFetcher];
        id v16 = objc_alloc(MEMORY[0x1E4F6C3E8]);
        id v17 = [(IMDServiceSession *)self server];
        uint64_t v18 = (IMSystemProxySettingsFetcher *)[v16 initWithHost:v17 port:v15 delegate:self];
        systemProxySettingsFetcher = self->_systemProxySettingsFetcher;
        self->_systemProxySettingsFetcher = v18;

        [(IMSystemProxySettingsFetcher *)self->_systemProxySettingsFetcher retrieveProxySettings];
        uint64_t v20 = 0;
      }
      else
      {
        uint64_t v20 = [v24 objectForKey:*MEMORY[0x1E4F6C770]];
      }

      int v13 = (void *)v20;
    }
    dispatch_time_t v21 = [v13 stringByRemovingWhitespace];
    uint64_t v22 = [v21 length];

    if (!v22)
    {
      uint64_t v23 = [(IMDServiceSession *)self server];

      int v13 = (void *)v23;
    }
    [(IMDServiceSession *)self _updateNetworkMonitorWithRemoteHost:v13];
  }
}

- (void)_reconnectIfNecessary
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  long long v8 = 0u;
  long long v9 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v3 = [(IMDServiceSession *)self accounts];
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
        [(IMDServiceSession *)self _reconnectIfNecessaryWithAccount:*(void *)(*((void *)&v8 + 1) + 8 * v7++)];
      }
      while (v5 != v7);
      uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    }
    while (v5);
  }
}

- (void)_reconnectIfNecessaryWithAccount:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (!self->_activated) {
    goto LABEL_36;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v6 = [(IMDServiceSession *)self loginID];
      uint64_t v7 = [(IMDAccount *)self->_account accountID];
      int v20 = 138412546;
      dispatch_time_t v21 = v6;
      __int16 v22 = 2112;
      uint64_t v23 = v7;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEBUG, "_reconnectIfNecessary: %@:%@", (uint8_t *)&v20, 0x16u);
    }
  }
  BOOL v8 = [(IMDServiceSession *)self accountShouldBeAlwaysLoggedIn];
  if ([v4 loginStatus] == 1)
  {
    int v9 = [v4 serviceDisconnectReason];
    if ((v9 + 1) <= 8) {
      unsigned int v10 = (0xCAu >> (v9 + 1)) & 1;
    }
    else {
      unsigned int v10 = 1;
    }
    if (!v8) {
      goto LABEL_11;
    }
  }
  else
  {
    unsigned int v10 = 0;
    if (!v8)
    {
LABEL_11:
      if (self->_shouldReconnect) {
        int v11 = 1;
      }
      else {
        int v11 = v10;
      }
      goto LABEL_16;
    }
  }
  int v11 = 1;
LABEL_16:
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      if (v8) {
        uint64_t v13 = @"YES";
      }
      else {
        uint64_t v13 = @"NO";
      }
      if (self->_shouldReconnect) {
        uint64_t v14 = @"YES";
      }
      else {
        uint64_t v14 = @"NO";
      }
      if (v10) {
        unsigned __int16 v15 = @"YES";
      }
      else {
        unsigned __int16 v15 = @"NO";
      }
      uint64_t v16 = [v4 loginStatus];
      int v17 = [v4 serviceDisconnectReason];
      int v20 = 138413314;
      dispatch_time_t v21 = v13;
      __int16 v22 = 2112;
      uint64_t v23 = v14;
      __int16 v24 = 2112;
      __int16 v25 = v15;
      __int16 v26 = 2048;
      uint64_t v27 = v16;
      __int16 v28 = 1024;
      int v29 = v17;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_DEBUG, "  shouldAlwaysBeLoggedIn: %@    shouldReconnect: %@   wasLikelyNetworkError: %@  loginStatus: %lu  disconnectReason: %d", (uint8_t *)&v20, 0x30u);
    }
  }
  if (v11 && [v4 loginStatus] != 4)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
      {
        v19 = [(IMDServiceSession *)self loginID];
        int v20 = 138412290;
        dispatch_time_t v21 = v19;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_DEBUG, "%@: we're disconnected properly - and we're supposed to try to reconnect now, ", (uint8_t *)&v20, 0xCu);
      }
    }
    [(IMDServiceSession *)self _doLoginIgnoringProxy:0 withAccount:v4];
  }
LABEL_36:
}

- (void)_processNetworkMonitorUpdate
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  if (!self->_activated || ![(IMDServiceSession *)self _processesNetworkEvents]) {
    return;
  }
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__processNetworkMonitorUpdate object:0];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v3 = [(IMDServiceSession *)self accounts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v37 count:16];
  if (v4)
  {
    char v5 = 0;
    uint64_t v6 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v28 != v6) {
          objc_enumerationMutation(v3);
        }
        v5 |= (unint64_t)[*(id *)(*((void *)&v27 + 1) + 8 * i) loginStatus] > 2;
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v27 objects:v37 count:16];
    }
    while (v4);

    if ((v5 & 1) == 0
      || ([(IMNetworkMonitor *)self->_networkMonitor immediatelyReachable] & 1) != 0
      || [(IMDServiceSession *)self overrideNetworkAvailability])
    {
      goto LABEL_29;
    }
    if (IMOSLoggingEnabled())
    {
      BOOL v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v34 = self;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "%@       forcing disconnect", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        unsigned int v10 = [(IMDServiceSession *)self server];
        *(_DWORD *)buf = 138412546;
        v34 = self;
        __int16 v35 = 2112;
        v36 = v10;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "%@: Network connection to %@ is down -- disconnecting", buf, 0x16u);
      }
    }
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v3 = [(IMDServiceSession *)self accounts];
    uint64_t v11 = [v3 countByEnumeratingWithState:&v23 objects:v32 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v24;
      do
      {
        for (uint64_t j = 0; j != v11; ++j)
        {
          if (*(void *)v24 != v12) {
            objc_enumerationMutation(v3);
          }
          [(IMDServiceSession *)self logoutServiceSessionWithAccount:*(void *)(*((void *)&v23 + 1) + 8 * j)];
        }
        uint64_t v11 = [v3 countByEnumeratingWithState:&v23 objects:v32 count:16];
      }
      while (v11);
    }
  }

LABEL_29:
  if (([(IMNetworkMonitor *)self->_networkMonitor immediatelyReachable] & 1) != 0
    || [(IMDServiceSession *)self overrideNetworkAvailability])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)buf = 138412290;
        v34 = self;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_DEBUG, "%@       I can be reached", buf, 0xCu);
      }
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    unsigned __int16 v15 = [(IMDServiceSession *)self accounts];
    uint64_t v16 = [v15 countByEnumeratingWithState:&v19 objects:v31 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v20;
      do
      {
        for (uint64_t k = 0; k != v16; ++k)
        {
          if (*(void *)v20 != v17) {
            objc_enumerationMutation(v15);
          }
          [(IMDServiceSession *)self _reconnectIfNecessaryWithAccount:*(void *)(*((void *)&v19 + 1) + 8 * k)];
        }
        uint64_t v16 = [v15 countByEnumeratingWithState:&v19 objects:v31 count:16];
      }
      while (v16);
    }
  }
}

- (void)_setPendingNetworkMonitorUpdate
{
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__processNetworkMonitorUpdate object:0];
  if (self->_activated)
  {
    [(IMDServiceSession *)self performSelector:sel__processNetworkMonitorUpdate withObject:0 afterDelay:2.0];
  }
}

- (BOOL)_processesNetworkEvents
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  if ([(IMDServiceSession *)self isReplicating] && (IMGetCachedDomainBoolForKey() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      char v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        networkMonitor = self->_networkMonitor;
        int v8 = 138412546;
        int v9 = self;
        __int16 v10 = 2112;
        uint64_t v11 = networkMonitor;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "%@ refuses to process network changes - networkMonitor: %@", (uint8_t *)&v8, 0x16u);
      }
    }
    LOBYTE(v4) = 0;
  }
  else
  {
    id v3 = [(IMDServiceSession *)self service];
    int v4 = [v3 ignoresNetworkConnectivity] ^ 1;
  }
  return v4;
}

- (void)_processPotentialNetworkChange
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  if (![(IMDServiceSession *)self _processesNetworkEvents] || !self->_activated) {
    return;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v3 = [(IMDServiceSession *)self accounts];
  uint64_t v4 = [v3 countByEnumeratingWithState:&v34 objects:v50 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v35;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
      {
        if (*(void *)v35 != v5) {
          objc_enumerationMutation(v3);
        }
        if ((unint64_t)[*(id *)(*((void *)&v34 + 1) + 8 * i) loginStatus] > 2)
        {
          int v7 = 1;
          goto LABEL_13;
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v34 objects:v50 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
  int v7 = 0;
LABEL_13:

  BOOL v8 = ([(IMNetworkMonitor *)self->_networkMonitor immediatelyReachable] & 1) != 0
    || [(IMDServiceSession *)self overrideNetworkAvailability];
  int v9 = [MEMORY[0x1E4F6C310] sharedInstance];
  int v10 = [v9 isOnTelephonyCall];

  uint64_t v11 = [MEMORY[0x1E4F61740] sharedInstance];
  int v12 = [v11 supportsSimultaneousVoiceAndDataRightNow];

  if ((v8 & (v10 ^ 1 | v12)) == 1)
  {
    [(IMDServiceSession *)self processNetworkDataAvailabilityChange:1];
    int v13 = 1;
    if (v7) {
      goto LABEL_18;
    }
  }
  else
  {
    int v13 = [(IMDServiceSession *)self overrideNetworkAvailability];
    [(IMDServiceSession *)self processNetworkDataAvailabilityChange:0];
    if (v7 == v13)
    {
LABEL_18:
      if (IMOSLoggingEnabled())
      {
        uint64_t v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          unsigned __int16 v15 = @"NO";
          *(_DWORD *)buf = 138413570;
          v39 = self;
          if (v7) {
            uint64_t v16 = @"YES";
          }
          else {
            uint64_t v16 = @"NO";
          }
          __int16 v40 = 2112;
          v41 = v16;
          if (v13) {
            uint64_t v17 = @"YES";
          }
          else {
            uint64_t v17 = @"NO";
          }
          __int16 v42 = 2112;
          if (v10) {
            uint64_t v18 = @"YES";
          }
          else {
            uint64_t v18 = @"NO";
          }
          id v43 = v17;
          if (v12) {
            unsigned __int16 v15 = @"YES";
          }
          __int16 v44 = 2112;
          v45 = v18;
          __int16 v46 = 2112;
          v47 = v15;
          __int16 v48 = 2112;
          __int16 v49 = v17;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "%@ networkMonitorDidUpdate: Currently connected: %@   (Reachable: %@  On Call: %@  Data+Voice: %@   Result: %@)", buf, 0x3Eu);
        }
LABEL_48:

        goto LABEL_49;
      }
      goto LABEL_49;
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      long long v19 = @"NO";
      *(_DWORD *)buf = 138413570;
      v39 = self;
      if (v7) {
        long long v20 = @"YES";
      }
      else {
        long long v20 = @"NO";
      }
      __int16 v40 = 2112;
      v41 = v20;
      if (v13) {
        long long v21 = @"YES";
      }
      else {
        long long v21 = @"NO";
      }
      __int16 v42 = 2112;
      if (v10) {
        long long v22 = @"YES";
      }
      else {
        long long v22 = @"NO";
      }
      id v43 = v21;
      if (v12) {
        long long v19 = @"YES";
      }
      __int16 v44 = 2112;
      v45 = v22;
      __int16 v46 = 2112;
      v47 = v19;
      __int16 v48 = 2112;
      __int16 v49 = v21;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "%@ networkMonitorDidUpdate: Currently connected: %@   (Reachable: %@  On Call: %@  Data+Voice: %@   Result: %@)", buf, 0x3Eu);
    }
    goto LABEL_48;
  }
LABEL_49:
  if (IMOSLoggingEnabled())
  {
    long long v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEBUG))
    {
      long long v24 = [(IMNetworkMonitor *)self->_networkMonitor remoteHost];
      *(_DWORD *)buf = 138412290;
      v39 = v24;
      _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_DEBUG, "                                        remoteHost: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
    {
      long long v26 = @"NO";
      if (v8) {
        long long v26 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v39 = (IMDServiceSession *)v26;
      _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_DEBUG, "                                       isReachable: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
    {
      long long v28 = @"NO";
      if (v10) {
        long long v28 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v39 = (IMDServiceSession *)v28;
      _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_DEBUG, "                                          isOnCall: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
    {
      long long v30 = @"NO";
      if (v12) {
        long long v30 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v39 = (IMDServiceSession *)v30;
      _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_DEBUG, "                  supportsSimultaneousDataAndVoice: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_DEBUG))
    {
      int v32 = [(IMNetworkMonitor *)self->_networkMonitor immediatelyReachable];
      v33 = @"NO";
      if (v32) {
        v33 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      v39 = (IMDServiceSession *)v33;
      _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_DEBUG, "                            isImmediatelyReachable: %@", buf, 0xCu);
    }
  }
  if (v7) {
    [(IMDServiceSession *)self _setPendingNetworkMonitorUpdate];
  }
  else {
    [(IMDServiceSession *)self _processNetworkMonitorUpdate];
  }
}

- (void)networkMonitorDidUpdate:(id)a3
{
  if (self->_activated) {
    im_dispatch_after();
  }
}

- (void)_callMonitorStateChanged:(id)a3
{
  if (self->_activated) {
    im_dispatch_after();
  }
}

- (void)_networkChanged:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_activated)
  {
    uint64_t v5 = [MEMORY[0x1E4F6C430] sharedInstance];
    if ([v5 isNetworkUp])
    {
    }
    else
    {
      BOOL v6 = [(IMDServiceSession *)self overrideNetworkAvailability];

      if (!v6) {
        goto LABEL_13;
      }
    }
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    int v7 = [(IMDServiceSession *)self accounts];
    uint64_t v8 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v14;
      do
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v13 + 1) + 8 * i);
          [(IMDServiceSession *)self _reconnectIfNecessaryWithAccount:v12];
          [(IMDServiceSession *)self autoReconnectWithAccount:v12];
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v13 objects:v17 count:16];
      }
      while (v9);
    }
  }
LABEL_13:
}

- (id)_IDSService
{
  return 0;
}

- (BOOL)overrideNetworkAvailability
{
  return 0;
}

- (BOOL)networkConditionsAllowLogin
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  if ([(IMDServiceSession *)self overrideNetworkAvailability]) {
    return 1;
  }
  if (!self->_activated) {
    return 0;
  }
  id v4 = [(IMDServiceSession *)self service];
  int v5 = [v4 ignoresNetworkConnectivity];

  if (v5)
  {
    if (!IMOSLoggingEnabled()) {
      return 1;
    }
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t v12 = 138412546;
      *(void *)&v12[4] = @"YES";
      __int16 v13 = 2112;
      long long v14 = self;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEBUG, "-[IMDServiceSession networkConditionsAllowLogin]: %@ (%@)   (Ignoring network)", v12, 0x16u);
    }
LABEL_8:

    return 1;
  }
  networkMonitor = self->_networkMonitor;
  if (!networkMonitor)
  {
    if (!IMOSLoggingEnabled()) {
      return 1;
    }
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)uint64_t v12 = 138412546;
      *(void *)&v12[4] = @"YES";
      __int16 v13 = 2112;
      long long v14 = self;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_DEBUG, "-[IMDServiceSession networkConditionsAllowLogin]: %@ (%@)   (Fallback)", v12, 0x16u);
    }
    goto LABEL_8;
  }
  int v8 = [(IMNetworkMonitor *)networkMonitor immediatelyReachable];
  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
    {
      uint64_t v10 = @"NO";
      uint64_t v11 = self->_networkMonitor;
      *(_DWORD *)uint64_t v12 = 138412802;
      if (v8) {
        uint64_t v10 = @"YES";
      }
      *(void *)&v12[4] = v10;
      __int16 v13 = 2112;
      long long v14 = self;
      __int16 v15 = 2112;
      long long v16 = v11;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_DEBUG, "-[IMDServiceSession networkConditionsAllowLogin]: %@ (%@)   ([[%@]_networkMonitor immediatelyReachable])", v12, 0x20u);
    }
  }
  return [(IMNetworkMonitor *)self->_networkMonitor immediatelyReachable];
}

- (BOOL)allowedAsChild
{
  id v3 = +[IMDLocalDaemon sharedDaemon];
  id v4 = [v3 parentalControls];
  LOBYTE(self) = [v4 disableServiceSession:self] ^ 1;

  return (char)self;
}

- (int64_t)transcodeTarget
{
  return 0;
}

- (void)_managedPrefsNotification:(id)a3
{
  id v7 = a3;
  if (self->_activated)
  {
    id v4 = +[IMDLocalDaemon sharedDaemon];
    int v5 = [v4 parentalControls];
    int v6 = [v5 active];

    if (v6)
    {
      if (![(IMDServiceSession *)self allowedAsChild]) {
        [(IMDServiceSession *)self logout];
      }
    }
  }
}

- (id)canonicalFormOfID:(id)a3
{
  id v4 = a3;
  int v5 = [(IMDServiceSession *)self service];
  int v6 = -[IMDServiceSession canonicalFormOfID:withIDSensitivity:](self, "canonicalFormOfID:withIDSensitivity:", v4, [v5 idSensitivity]);

  return v6;
}

- (id)canonicalFormOfID:(id)a3 withIDSensitivity:(int)a4
{
  id v5 = a3;
  int v6 = [(IMDServiceSession *)self service];
  [v6 caseInsensitivityByHandleType];
  id v7 = IMCanonicalFormOfIDWithSensitivity();

  return v7;
}

- (id)canonicalFormOfChatRoom:(id)a3
{
  return (id)[a3 lowercaseString];
}

- (BOOL)equalID:(id)a3 andID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = v7;
  if (v6 == v7)
  {
    char v9 = 1;
  }
  else
  {
    char v9 = 0;
    if (v6 && v7)
    {
      uint64_t v10 = [(IMDServiceSession *)self canonicalFormOfID:v6];
      uint64_t v11 = [(IMDServiceSession *)self canonicalFormOfID:v8];
      char v9 = [v10 isEqualToString:v11];
    }
  }

  return v9;
}

- (void)refreshServiceCapabilities
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(IMDServiceSession *)self capabilities];
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      id v5 = _IMStringFromFZCapabilities();
      int v8 = 138412290;
      char v9 = v5;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Refreshing capabilities: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  id v6 = [(IMDServiceSession *)self broadcaster];
  id v7 = [(IMDServiceSession *)self accountID];
  [v6 account:v7 capabilitiesChanged:v3];
}

- (id)broadcaster
{
  unint64_t v3 = +[IMDBroadcastController sharedProvider];
  id v4 = [(IMDServiceSession *)self service];
  id v5 = [v3 broadcasterForListenersSupportingService:v4];

  return v5;
}

- (id)broadcasterForChatListeners
{
  unint64_t v3 = +[IMDBroadcastController sharedProvider];
  id v4 = [(IMDServiceSession *)self service];
  id v5 = [v3 broadcasterForChatListenersSupportingService:v4];

  return v5;
}

- (id)broadcasterForChatListenersWithBlackholeStatus:(BOOL)a3
{
  if (a3)
  {
    id v4 = +[IMDBroadcastController sharedProvider];
    id v5 = [(IMDServiceSession *)self service];
    id v6 = [v4 broadcasterForBlackholeChatListenersSupportingService:v5];
  }
  else
  {
    id v6 = [(IMDServiceSession *)self broadcasterForChatListeners];
  }

  return v6;
}

- (id)broadcasterForChatObserverListeners
{
  v11[2] = *MEMORY[0x1E4F143B8];
  unint64_t v3 = [(IMDServiceSession *)self broadcasterForChatListeners];
  id v4 = +[IMDBroadcastController sharedProvider];
  id v5 = [(IMDServiceSession *)self service];
  id v6 = [v4 broadcasterForSentMessageListenersSupportingService:v5];

  id v7 = [IMDInvocationForwarder alloc];
  v11[0] = v3;
  v11[1] = v6;
  int v8 = [MEMORY[0x1E4F1C978] arrayWithObjects:v11 count:2];
  char v9 = [(IMDInvocationForwarder *)v7 initWithTargets:v8];

  return v9;
}

- (id)broadcasterForAVConferenceListeners
{
  unint64_t v3 = +[IMDBroadcastController sharedProvider];
  id v4 = [(IMDServiceSession *)self service];
  id v5 = [v3 broadcasterForAVConferenceListenersSupportingService:v4];

  return v5;
}

- (id)broadcasterForACConferenceListeners
{
  unint64_t v3 = +[IMDBroadcastController sharedProvider];
  id v4 = [(IMDServiceSession *)self service];
  id v5 = [v3 broadcasterForACConferenceListenersSupportingService:v4];

  return v5;
}

- (id)broadcasterForVCConferenceListeners
{
  unint64_t v3 = +[IMDBroadcastController sharedProvider];
  id v4 = [(IMDServiceSession *)self service];
  id v5 = [v3 broadcasterForVCConferenceListenersSupportingService:v4];

  return v5;
}

- (id)broadcasterForNotificationsListeners
{
  unint64_t v3 = +[IMDBroadcastController sharedProvider];
  id v4 = [(IMDServiceSession *)self service];
  id v5 = [v3 broadcasterForNotificationListenersSupportingService:v4];

  return v5;
}

- (id)broadcasterForCollaborationListeners
{
  unint64_t v3 = +[IMDBroadcastController sharedProvider];
  id v4 = [(IMDServiceSession *)self service];
  id v5 = [v3 broadcasterForCollaborationListenersSupportingService:v4];

  return v5;
}

- (void)_clearDowngradeMarkersForChat:(id)a3
{
  id v4 = a3;
  if (self->_activated)
  {
    id v17 = v4;
    id v5 = objc_alloc(MEMORY[0x1E4F1C9E8]);
    id v6 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v7 = *MEMORY[0x1E4F6C460];
    int v8 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v9 = *MEMORY[0x1E4F6C468];
    uint64_t v10 = [MEMORY[0x1E4F1CA98] null];
    uint64_t v11 = objc_msgSend(v5, "initWithObjectsAndKeys:", v6, v7, v8, v9, v10, *MEMORY[0x1E4F6C470], 0);

    uint64_t v12 = +[IMDChatRegistry sharedInstance];
    LODWORD(v8) = [v12 updateProperties:v11 chat:v17 style:45];

    if (v8)
    {
      __int16 v13 = [(IMDServiceSession *)self chatForChatIdentifier:v17 style:45];
      if (v13)
      {
        long long v14 = [(IMDServiceSession *)self broadcasterForChatListeners];
        __int16 v15 = [v13 guid];
        long long v16 = [v13 properties];
        [v14 chat:v15 propertiesUpdated:v16];
      }
    }

    id v4 = v17;
  }
}

- (BOOL)shouldInferRecoverableDeleteForCommandDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:@"isPermanentDelete"];
  char v5 = [v4 BOOLValue];

  if (v5)
  {
    BOOL v6 = 0;
  }
  else
  {
    uint64_t v7 = [v3 objectForKeyedSubscript:@"recoverableDeleteDate"];
    BOOL v6 = v7 == 0;
  }
  return v6;
}

- (id)deleteCommandDictionaryWithIncomingDictionary:(id)a3 inferredRecoverableDeleteForLegacyCommandsWithDate:(id)a4
{
  id v5 = a4;
  BOOL v6 = (void *)[a3 mutableCopy];
  uint64_t v7 = [v6 objectForKeyedSubscript:@"permanentDeleteChatMetadataArray"];
  [v6 removeObjectForKey:@"permanentDeleteChatMetadataArray"];
  [v6 setObject:v7 forKeyedSubscript:@"chat"];
  [v6 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:@"isPermanentDelete"];
  [v6 setObject:v5 forKeyedSubscript:@"recoverableDeleteDate"];

  int v8 = (void *)[v6 copy];

  return v8;
}

- (void)deleteChatsForCommandDictionary:(id)a3
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  id v4 = [v28 objectForKeyedSubscript:@"isPermanentDelete"];
  int v5 = [v4 BOOLValue];

  int v38 = v5;
  if (v5)
  {
    BOOL v6 = [v28 objectForKeyedSubscript:@"permanentDeleteChatMetadataArray"];
    long long v35 = 0;
  }
  else
  {
    BOOL v6 = [v28 objectForKeyedSubscript:@"chat"];
    long long v35 = [v28 objectForKeyedSubscript:@"recoverableDeleteDate"];
  }
  long long v37 = [(IMDServiceSession *)self broadcasterForChatListenersWithBlackholeStatus:0];
  long long v36 = [(IMDServiceSession *)self broadcasterForChatListenersWithBlackholeStatus:1];
  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  obuint64_t j = v6;
  uint64_t v31 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
  if (v31)
  {
    uint64_t v7 = @"NO";
    uint64_t v30 = *(void *)v47;
    if (v5) {
      uint64_t v7 = @"YES";
    }
    v33 = v7;
    do
    {
      uint64_t v8 = 0;
      do
      {
        if (*(void *)v47 != v30)
        {
          uint64_t v9 = v8;
          objc_enumerationMutation(obj);
          uint64_t v8 = v9;
        }
        uint64_t v32 = v8;
        uint64_t v10 = *(void **)(*((void *)&v46 + 1) + 8 * v8);
        [(IMDServiceSession *)self _blocklistIfNeededForChatDict:v10];
        uint64_t v11 = [(IMDServiceSession *)self _chatsForDeleteAndRecoveryChatMetadataDictionary:v10];
        uint64_t v12 = [v10 objectForKeyedSubscript:@"deleteIncomingMessages"];
        uint64_t v13 = [v12 BOOLValue];

        if (![v11 count] && IMOSLoggingEnabled())
        {
          long long v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v54 = v10;
            _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "IMDServiceSession | Deletion: did not find any chats for chat metadata %@", buf, 0xCu);
          }
        }
        long long v44 = 0u;
        long long v45 = 0u;
        long long v42 = 0u;
        long long v43 = 0u;
        id v34 = v11;
        uint64_t v15 = [v34 countByEnumeratingWithState:&v42 objects:v57 count:16];
        if (v15)
        {
          uint64_t v16 = *(void *)v43;
          do
          {
            for (uint64_t i = 0; i != v15; ++i)
            {
              if (*(void *)v43 != v16) {
                objc_enumerationMutation(v34);
              }
              uint64_t v18 = *(void **)(*((void *)&v42 + 1) + 8 * i);
              if (IMOSLoggingEnabled())
              {
                long long v19 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412546;
                  v54 = v18;
                  __int16 v55 = 2112;
                  v56 = v33;
                  _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "removing chat: %@, permanently: %@", buf, 0x16u);
                }
              }
              long long v20 = [v18 guid];
              int v21 = [v18 isBlackholed];
              long long v22 = v37;
              if (v21) {
                long long v22 = v36;
              }
              id v23 = v22;
              long long v24 = [(IMDServiceSession *)self chatRegistry];
              if (v38)
              {
                v52 = v20;
                long long v25 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v52 count:1];
                v39[0] = MEMORY[0x1E4F143A8];
                v39[1] = 3221225472;
                v39[2] = sub_1D96BCCF4;
                v39[3] = &unk_1E6B73308;
                id v40 = v23;
                id v41 = v20;
                [v24 permanentlyDeleteRecoverableMessagesInChatsWithGUIDs:v25 completionHandler:v39];

                long long v26 = v40;
              }
              else
              {
                uint64_t v51 = v20;
                long long v27 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v51 count:1];
                [v24 moveMessagesInChatsWithGUIDsToRecentlyDeleted:v27 deleteDate:v35];

                [(IMDServiceSession *)self _updateLastMessageTimeStampForChat:v18 broadcaster:v23];
                id v50 = v20;
                long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v50 count:1];
                [v23 movedMessagesToRecentlyDeletedForChatsWithGUIDs:v26 queryID:0 deletionDate:v35];
              }

              [v18 setDeletingIncomingMessages:v13];
            }
            uint64_t v15 = [v34 countByEnumeratingWithState:&v42 objects:v57 count:16];
          }
          while (v15);
        }

        uint64_t v8 = v32 + 1;
      }
      while (v32 + 1 != v31);
      uint64_t v31 = [obj countByEnumeratingWithState:&v46 objects:v58 count:16];
    }
    while (v31);
  }
}

- (void)deleteMessagesForCommandDictionary:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  int v5 = [v4 objectForKeyedSubscript:@"message"];
  if (IMOSLoggingEnabled())
  {
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      uint64_t v7 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "count"));
      int v22 = 138412290;
      id v23 = v7;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Deleting %@: messages", (uint8_t *)&v22, 0xCu);
    }
  }
  uint64_t v8 = [v4 objectForKeyedSubscript:@"isPermanentDelete"];
  char v9 = [v8 BOOLValue];

  uint64_t v10 = [(IMDServiceSession *)self broadcasterForChatListenersWithBlackholeStatus:0];
  uint64_t v11 = [(IMDServiceSession *)self broadcasterForChatListenersWithBlackholeStatus:1];
  uint64_t v12 = +[IMDMessageStore sharedInstance];
  uint64_t v13 = [v5 firstObject];
  long long v14 = [v12 chatForMessageGUID:v13];

  int v15 = IMOSLoggingEnabled();
  if (v9)
  {
    if (v15)
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412290;
        id v23 = v5;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Permanently deleting messages with GUID %@: ", (uint8_t *)&v22, 0xCu);
      }
    }
    id v17 = +[IMDMessageStore sharedInstance];
    id v18 = (id)[v17 deleteMessageGUIDs:v5];
  }
  else
  {
    if (v15)
    {
      long long v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412290;
        id v23 = v5;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Recoverably deleting messages with GUID %@: ", (uint8_t *)&v22, 0xCu);
      }
    }
    id v17 = [v4 objectForKeyedSubscript:@"recoverableDeleteDate"];
    if (IMOSLoggingEnabled())
    {
      long long v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v22 = 138412290;
        id v23 = v17;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Recently Deleted | messages delete date: %@", (uint8_t *)&v22, 0xCu);
      }
    }
    int v21 = [(IMDServiceSession *)self chatRegistry];
    [v21 moveMessagesWithGUIDsToRecentlyDeleted:v5 deleteDate:v17];
  }
  [(IMDServiceSession *)self _updateLastMessageTimeStampForChat:v14 broadcaster:v10];
  [v10 historicalMessageGUIDsDeleted:v5 chatGUIDs:0 queryID:0];
  [v11 historicalMessageGUIDsDeleted:v5 chatGUIDs:0 queryID:0];
}

- (void)recoverChatsForCommandDictionary:(id)a3
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  [v16 objectForKeyedSubscript:@"recoverChatMetadataArray"];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
  uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v31 count:16];
  if (v19)
  {
    uint64_t v18 = *(void *)v25;
    do
    {
      for (uint64_t i = 0; i != v19; ++i)
      {
        if (*(void *)v25 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v5 = *(void *)(*((void *)&v24 + 1) + 8 * i);
        BOOL v6 = [(IMDServiceSession *)self _chatsForDeleteAndRecoveryChatMetadataDictionary:v5];
        if ([v6 count])
        {
          uint64_t v7 = [v6 arrayByApplyingSelector:sel_guid];
          uint64_t v8 = [(IMDServiceSession *)self broadcasterForChatListenersWithBlackholeStatus:0];
          char v9 = [(IMDServiceSession *)self chatRegistry];
          [v9 recoverMessagesWithChatGUIDs:v7];

          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v10 = v6;
          uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v11)
          {
            uint64_t v12 = *(void *)v21;
            do
            {
              for (uint64_t j = 0; j != v11; ++j)
              {
                if (*(void *)v21 != v12) {
                  objc_enumerationMutation(v10);
                }
                long long v14 = *(void **)(*((void *)&v20 + 1) + 8 * j);
                [(IMDServiceSession *)self _updateLastMessageTimeStampForChat:v14 broadcaster:v8];
                [v14 setDeletingIncomingMessages:0];
              }
              uint64_t v11 = [v10 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v11);
          }

          [v8 recoveredMessagesFromRecentlyDeletedForChatsWithGUIDs:v7];
        }
        else if (IMOSLoggingEnabled())
        {
          int v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v30 = v5;
            _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "IMDServiceSession | Recovery: did not find any chats for chat metadata %@", buf, 0xCu);
          }
        }
      }
      uint64_t v19 = [obj countByEnumeratingWithState:&v24 objects:v31 count:16];
    }
    while (v19);
  }
}

- (void)deleteMessagePartsForCommandDictionary:(id)a3
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v28 = a3;
  long long v29 = [v28 objectForKeyedSubscript:@"parts"];
  id v3 = v29;
  if ([v29 count])
  {
    id v4 = [v28 objectForKeyedSubscript:@"isPermanentDelete"];
    int v5 = [v4 BOOLValue];

    if (!v5)
    {
      uint64_t v30 = [v28 objectForKeyedSubscript:@"recoverableDeleteDate"];
      v33 = [(IMDServiceSession *)self broadcasterForChatListeners];
      if (IMOSLoggingEnabled())
      {
        uint64_t v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          uint64_t v8 = [v29 count];
          char v9 = [v29 objectAtIndexedSubscript:0];
          *(_DWORD *)buf = 134218242;
          uint64_t v47 = v8;
          __int16 v48 = 2112;
          long long v49 = v9;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Recently Deleted | Deleting message parts from %lu messages: %@", buf, 0x16u);
        }
      }
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      obuint64_t j = v29;
      uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
      if (v10)
      {
        uint64_t v34 = *(void *)v42;
        do
        {
          for (uint64_t i = 0; i != v10; ++i)
          {
            if (*(void *)v42 != v34) {
              objc_enumerationMutation(obj);
            }
            uint64_t v12 = *(void **)(*((void *)&v41 + 1) + 8 * i);
            uint64_t v13 = [v12 objectForKeyedSubscript:@"messageGuid"];
            long long v14 = [v12 objectForKeyedSubscript:@"deleteSubject"];
            uint64_t v15 = [v14 BOOLValue];

            id v16 = +[IMDMessageStore sharedInstance];
            id v17 = [v16 messageWithGUID:v13];

            if (v17)
            {
              id v39 = 0;
              id v40 = 0;
              +[IMDDeletePartsHelper _convertDeletedPartsDict:v12 toIndexSet:&v40 toMap:&v39];
              id v18 = v40;
              id v19 = v39;
              if ([v18 count])
              {
                long long v20 = [MEMORY[0x1E4F6E850] _messageItemWithIndexesDeleted:v18 subRangesToDeleteMapping:v19 deleteSubject:v15 deleteTransferCallback:0 createItemCallback:0 fromMessageItem:v17];
                if (IMOSLoggingEnabled())
                {
                  long long v21 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    uint64_t v47 = (uint64_t)v17;
                    __int16 v48 = 2112;
                    long long v49 = v20;
                    _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Recently Deleted | Removed parts from old item %@, got new item: %@", buf, 0x16u);
                  }
                }
                long long v22 = [v17 body];
                v35[0] = MEMORY[0x1E4F143A8];
                v35[1] = 3221225472;
                v35[2] = sub_1D96BDB34;
                v35[3] = &unk_1E6B73330;
                id v36 = v18;
                id v37 = v17;
                id v38 = v30;
                objc_msgSend(v22, "__im_visitMessageParts:", v35);

                long long v23 = +[IMDMessageStore sharedInstance];
                long long v24 = [v23 chatForMessageGUID:v13];

                [(IMDServiceSession *)self _updateLastMessageTimeStampForChat:v24 broadcaster:v33];
                long long v25 = [v20 accountID];
                [v33 account:v25 chat:0 style:0 chatProperties:0 messageUpdated:v20];
              }
              else if (IMOSLoggingEnabled())
              {
                long long v27 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  uint64_t v47 = (uint64_t)v13;
                  _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "IMDServiceSession: Recently Deleted | did not find indexes to delete at for GUID: %@", buf, 0xCu);
                }
              }
            }
            else if (IMOSLoggingEnabled())
            {
              long long v26 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v47 = (uint64_t)v13;
                _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "IMDServiceSession: Recently Deleted | could not find messageItem for GUID: %@", buf, 0xCu);
              }
            }
          }
          uint64_t v10 = [obj countByEnumeratingWithState:&v41 objects:v45 count:16];
        }
        while (v10);
      }

      goto LABEL_39;
    }
    id v3 = v29;
    if (IMOSLoggingEnabled())
    {
      BOOL v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "IMDServiceSession: Recently Deleted | Received permanent delete command. This is unsupported", buf, 2u);
      }
LABEL_6:

LABEL_39:
      id v3 = v29;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "IMDServiceSession: Recently Deleted | Received empty parts-mardid command", buf, 2u);
    }
    goto LABEL_6;
  }
}

- (id)_chatsForDeleteAndRecoveryChatMetadataDictionary:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v34 = [v4 objectForKeyedSubscript:@"guid"];
  v33 = [v4 objectForKeyedSubscript:@"groupID"];
  id v36 = [v4 objectForKeyedSubscript:@"ptcpts"];
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  if (IMOSLoggingEnabled())
  {
    BOOL v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      uint64_t v44 = (uint64_t)v34;
      __int16 v45 = 2112;
      long long v46 = v33;
      __int16 v47 = 2112;
      __int16 v48 = v36;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Finding chats for delete or recovery using guid %@ groupID %@ participants %@", buf, 0x20u);
    }
  }
  uint64_t v7 = [(IMDServiceSession *)self chatRegistry];
  long long v35 = [v7 existingChatWithGUID:v34];

  if (v35)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        char v9 = [v35 guid];
        *(_DWORD *)buf = 138412290;
        uint64_t v44 = (uint64_t)v9;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Found chat with specific guid %@ for chat metadata", buf, 0xCu);
      }
    }
    uint64_t v10 = [v35 guid];
    [v5 addObject:v10];
  }
  uint64_t v11 = [(IMDServiceSession *)self chatRegistry];
  uint64_t v12 = [v11 existingChatsWithGroupID:v33];

  if ([v12 count])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        uint64_t v14 = [v12 count];
        *(_DWORD *)buf = 134218498;
        uint64_t v44 = v14;
        __int16 v45 = 2112;
        long long v46 = v33;
        __int16 v47 = 2112;
        __int16 v48 = v12;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Found %llu chats with specific group ID %@ for chat metadata: %@", buf, 0x20u);
      }
    }
    uint64_t v15 = [v12 arrayByApplyingSelector:sel_guid];
    [v5 addObjectsFromArray:v15];
  }
  if ((unint64_t)[v36 count] >= 2)
  {
    id v16 = [(IMDServiceSession *)self chatRegistry];
    id v17 = [(IMDServiceSession *)self service];
    id v18 = [v16 existingChatsForIDs:v36 onService:v17 style:43];

    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = sub_1D96BE2CC;
    v41[3] = &unk_1E6B73380;
    v41[4] = self;
    id v19 = objc_msgSend(v18, "__imArrayByFilteringWithBlock:", v41);

    if ([v19 count])
    {
      if (IMOSLoggingEnabled())
      {
        long long v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          uint64_t v21 = [v19 count];
          *(_DWORD *)buf = 134218498;
          uint64_t v44 = v21;
          __int16 v45 = 2112;
          long long v46 = v36;
          __int16 v47 = 2112;
          __int16 v48 = v19;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Found %llu chats with handles: %@ chats: %@", buf, 0x20u);
        }
      }
      long long v22 = [v19 arrayByApplyingSelector:sel_guid];
      [v5 addObjectsFromArray:v22];
    }
  }
  id v23 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v24 = v5;
  uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v42 count:16];
  if (v25)
  {
    uint64_t v26 = *(void *)v38;
    do
    {
      for (uint64_t i = 0; i != v25; ++i)
      {
        if (*(void *)v38 != v26) {
          objc_enumerationMutation(v24);
        }
        uint64_t v28 = *(void *)(*((void *)&v37 + 1) + 8 * i);
        long long v29 = [(IMDServiceSession *)self chatRegistry];
        uint64_t v30 = [v29 existingChatWithGUID:v28];

        if (v30) {
          [v23 addObject:v30];
        }
      }
      uint64_t v25 = [v24 countByEnumeratingWithState:&v37 objects:v42 count:16];
    }
    while (v25);
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 134218242;
      uint64_t v44 = (uint64_t)v23;
      __int16 v45 = 2112;
      long long v46 = v34;
      _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Found %llu chats for delete command with guid %@", buf, 0x16u);
    }
  }

  return v23;
}

- (BOOL)allowedToOverwriteOriginalGroupIDForChat:(id)a3
{
  return 0;
}

- (IMDChatRegistry)chatRegistry
{
  return +[IMDChatRegistry sharedInstance];
}

- (void)_updateLastMessageTimeStampForChat:(id)a3 broadcaster:(id)a4
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (v5)
  {
    uint64_t v7 = +[IMDMessageStore sharedInstance];
    uint64_t v8 = objc_msgSend(v7, "lastMessageForChatWithRowID:", objc_msgSend(v5, "rowID"));
    [v5 setLastMessage:v8];

    char v9 = [v5 lastMessage];

    if (v9)
    {
      uint64_t v10 = [v5 lastMessage];
      uint64_t v11 = [v10 time];
      [v11 timeIntervalSinceReferenceDate];
      [v5 setLastMessageTimeStampOnLoad:(uint64_t)v12];
    }
    else
    {
      [v5 setLastMessageTimeStampOnLoad:0];
    }
    uint64_t v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v15 = [v14 isAVLessSharePlayEnabled];

    if (v15)
    {
      id v16 = +[IMDMessageStore sharedInstance];
      id v17 = [v16 lastTUConversationItemForChat:v5];

      if (v17)
      {
        id v18 = [v17 time];

        if (v18)
        {
          id v19 = [v17 time];
          [v5 setLastTUConversationCreatedDate:v19];
        }
        else
        {
          long long v20 = IMLogHandleForCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR)) {
            sub_1D98FE180((uint64_t)v17, v20);
          }
        }
      }
      else
      {
        [v5 setLastTUConversationCreatedDate:0];
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        long long v22 = [v5 guid];
        id v23 = NSNumber;
        id v24 = [v5 lastMessage];
        uint64_t v25 = [v24 time];
        [v25 timeIntervalSinceReferenceDate];
        uint64_t v26 = objc_msgSend(v23, "numberWithDouble:");
        int v28 = 138412546;
        long long v29 = v22;
        __int16 v30 = 2112;
        uint64_t v31 = v26;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Recently Deleted | IMDChat: %@, updating last message timestamp on load: %@", (uint8_t *)&v28, 0x16u);
      }
    }
    long long v27 = [v5 guid];
    objc_msgSend(v6, "chat:lastMessageTimeStampOnLoadUpdated:", v27, (double)objc_msgSend(v5, "lastMessageTimeStampOnLoad"));
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Recently Deleted | _updateLastMessageTimeStampForChat received nil chat", (uint8_t *)&v28, 2u);
    }
  }
}

- (void)cancelScheduledMessageWithGUID:(id)a3
{
  id v3 = IMLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1D98FE3B8();
  }
}

- (void)cancelScheduledMessageWithGUID:(id)a3 destinations:(id)a4 cancelType:(unint64_t)a5
{
  id v5 = IMLogHandleForCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_ERROR)) {
    sub_1D98FE3B8();
  }
}

- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9
{
  char v9 = IMLogHandleForCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
    sub_1D98FE3EC();
  }
}

- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 retractingPartIndexes:(id)a5 toChatIdentifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8
{
  uint64_t v8 = IMLogHandleForCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
    sub_1D98FE420();
  }
}

- (void)renewTTLForScheduledAttachmentTransfer:(id)a3
{
  id v3 = IMLogHandleForCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_ERROR)) {
    sub_1D98FE454();
  }
}

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v30 = a4;
  uint64_t v7 = [MEMORY[0x1E4F1CB18] messagesDomain];
  uint64_t v8 = NSString;
  uint64_t v34 = self;
  char v9 = [(IMDServiceSession *)self service];
  uint64_t v10 = [v9 internalName];
  uint64_t v11 = [v8 stringWithFormat:@"%@-ReachableHandles", v10];
  double v12 = [v7 arrayForKey:v11];

  uint64_t v13 = [MEMORY[0x1E4F6C360] sharedInstance];
  if ([v13 isInternalInstall]) {
    BOOL v14 = [v12 count] != 0;
  }
  else {
    BOOL v14 = 0;
  }

  id v15 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  obuint64_t j = [v6 handleIDs];
  uint64_t v16 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
  uint64_t v31 = v6;
  uint64_t v32 = v12;
  if (v16)
  {
    uint64_t v17 = v16;
    uint64_t v18 = *(void *)v36;
    LODWORD(v19) = v14;
    do
    {
      for (uint64_t i = 0; i != v17; ++i)
      {
        if (*(void *)v36 != v18) {
          objc_enumerationMutation(obj);
        }
        uint64_t v21 = *(void *)(*((void *)&v35 + 1) + 8 * i);
        id v22 = objc_alloc(MEMORY[0x1E4F6E978]);
        id v23 = [(IMDServiceSession *)v34 service];
        id v24 = [v23 internalName];
        uint64_t v25 = (void *)[v22 initWithHandleID:v21 service:v24 isReachable:1];

        if (v14) {
          objc_msgSend(v25, "setReachable:", objc_msgSend(v32, "containsObject:", v21));
        }
        uint64_t v19 = v19 & [v25 isReachable];
        [v15 setObject:v25 forKeyedSubscript:v21];
      }
      uint64_t v17 = [obj countByEnumeratingWithState:&v35 objects:v39 count:16];
    }
    while (v17);
  }
  else
  {
    uint64_t v19 = v14;
  }

  id v26 = objc_alloc(MEMORY[0x1E4F6E990]);
  long long v27 = [(IMDServiceSession *)v34 service];
  int v28 = [v27 internalName];
  long long v29 = (void *)[v26 initWithService:v28 error:0 handleResults:v15 isFinal:1 allAreReachable:v19 didCheckServer:0];

  [v30 reachabilityRequest:v31 updatedWithResult:v29];
}

- (void)markItemFailedWithGUID:(id)a3 errorCode:(unsigned int)a4
{
  uint64_t v4 = *(void *)&a4;
  id v6 = a3;
  uint64_t v7 = [(IMDServiceSession *)self itemWithGUID:v6];
  if (v7)
  {
    uint64_t v8 = [(IMDServiceSession *)self chatForItemWithGUID:v6];
    if (v8)
    {
      if ([v7 conformsToProtocol:&unk_1F342B0B8])
      {
        [v7 setErrorCode:v4];
        char v9 = +[IMDMessageStore sharedInstance];
        id v10 = (id)[v9 storeItem:v7 forceReplace:1];

        uint64_t v19 = -[IMDServiceSession broadcasterForChatListenersWithBlackholeStatus:](self, "broadcasterForChatListenersWithBlackholeStatus:", [v8 isBlackholed]);
        uint64_t v11 = [v7 accountID];
        double v12 = v11;
        if (!v11)
        {
          double v12 = [(IMDServiceSession *)self accountID];
        }
        uint64_t v13 = [v8 chatIdentifier];
        uint64_t v14 = [v8 style];
        id v15 = [v8 chatProperties];
        uint64_t v16 = [v8 groupID];
        uint64_t v17 = [v8 personCentricID];
        [v19 account:v12 chat:v13 style:v14 chatProperties:v15 groupID:v16 chatPersonCentricID:v17 messageReceived:v7];

        if (!v11) {
      }
        }
      else
      {
        uint64_t v18 = IMLogHandleForCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR)) {
          sub_1D98FE488();
        }
      }
    }
  }
}

- (BOOL)_messageDowngradesWhenSentFromCurrentService:(id)a3
{
  return 0;
}

- (BOOL)_messageUpgradesWhenSentFromCurrentService:(id)a3
{
  return 0;
}

- (NSString)serverHost
{
  return self->_serverHost;
}

- (unsigned)serverPort
{
  return self->_serverPort;
}

- (int64_t)proxyType
{
  return self->_proxyType;
}

- (NSString)proxyHost
{
  return self->_proxyHost;
}

- (unsigned)proxyPort
{
  return self->_proxyPort;
}

- (NSString)proxyAccount
{
  return self->_proxyAccount;
}

- (NSString)proxyPassword
{
  return self->_proxyPassword;
}

- (BOOL)useSSL
{
  return self->_useSSL;
}

- (NSString)password
{
  return self->_password;
}

- (IMDAccount)account
{
  return self->_account;
}

- (IMDServiceAttachmentController)baseAttachmentController
{
  return self->_baseAttachmentController;
}

- (NSMutableArray)serviceSessionDelegates
{
  return self->_serviceSessionDelegates;
}

- (IMDServiceSession)mainSession
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_mainSession);

  return (IMDServiceSession *)WeakRetained;
}

- (IMDAccount)replicationAccount
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_replicationAccount);

  return (IMDAccount *)WeakRetained;
}

- (IMDService)replicationService
{
  id WeakRetained = objc_loadWeakRetained((id *)&self->_replicationService);

  return (IMDService *)WeakRetained;
}

- (NSArray)accounts
{
  return &self->_accounts->super;
}

- (void).cxx_destruct
{
  objc_destroyWeak((id *)&self->_replicationService);
  objc_destroyWeak((id *)&self->_replicationAccount);
  objc_destroyWeak((id *)&self->_mainSession);
  objc_storeStrong((id *)&self->_serviceSessionDelegates, 0);
  objc_storeStrong((id *)&self->_replicationProxy, 0);
  objc_storeStrong((id *)&self->_baseAttachmentController, 0);
  objc_storeStrong((id *)&self->_serverHost, 0);
  objc_storeStrong((id *)&self->_password, 0);
  objc_storeStrong((id *)&self->_proxyPassword, 0);
  objc_storeStrong((id *)&self->_proxyAccount, 0);
  objc_storeStrong((id *)&self->_proxyHost, 0);
  objc_storeStrong((id *)&self->_buddies, 0);
  objc_storeStrong((id *)&self->_service, 0);
  objc_storeStrong((id *)&self->_otcUtilities, 0);
  objc_storeStrong((id *)&self->_systemProxySettingsFetcher, 0);
  objc_storeStrong((id *)&self->_pwRequestID, 0);
  objc_storeStrong((id *)&self->_loginID, 0);
  objc_storeStrong((id *)&self->_reconnectTimer, 0);
  objc_storeStrong((id *)&self->_networkMonitor, 0);
  objc_storeStrong((id *)&self->_messageAutoReplier, 0);
  objc_storeStrong((id *)&self->_messageWatchdogTimer, 0);
  objc_storeStrong((id *)&self->_messageExpireStateTimer, 0);
  objc_storeStrong((id *)&self->_messageRoutingTimer, 0);
  objc_storeStrong((id *)&self->_chatRoomToGroupChatIdentifierMap, 0);
  objc_storeStrong((id *)&self->_groupChatIdentifierToChatRoomMap, 0);
  objc_storeStrong((id *)&self->_changedBuddies, 0);
  objc_storeStrong((id *)&self->_localProperties, 0);
  objc_storeStrong((id *)&self->_accounts, 0);
  objc_storeStrong((id *)&self->_account, 0);

  objc_storeStrong((id *)&self->_lock, 0);
}

- (NSNumber)globalReadReceiptSettingVersion
{
  return (NSNumber *)IMGetCachedDomainValueForKey();
}

- (void)setGlobalReadReceiptSettingVersion:(id)a3
{
}

- (BOOL)readReceiptsGloballyEnabled
{
  if (IMGetDomainBoolForKey()) {
    return 1;
  }

  return IMGetDomainBoolForKey();
}

- (void)setReadReceiptsGloballyEnabled:(BOOL)a3
{
}

- (BOOL)shouldSendReadReceiptsForChat:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  unsigned int v7 = [(IMDServiceSession *)self readReceiptsGloballyEnabled];
  uint64_t v8 = [(IMDServiceSession *)self chatForChatIdentifier:v6 style:v4];
  char v9 = [v8 properties];

  id v10 = [v9 objectForKey:*MEMORY[0x1E4F6CD30]];
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      if (v10) {
        uint64_t v12 = [v10 longValue];
      }
      else {
        uint64_t v12 = -1;
      }
      int v14 = 134218240;
      uint64_t v15 = v7;
      __int16 v16 = 2048;
      uint64_t v17 = v12;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "read receipt global setting: [%ld], chat setting: [%ld]", (uint8_t *)&v14, 0x16u);
    }
  }
  if (v10) {
    LOBYTE(v7) = [v10 BOOLValue];
  }

  return v7;
}

- (void)overwritePerChatReadReceiptSettingsWithGlobalValue:(BOOL)a3
{
  unsigned int v25 = a3;
  uint64_t v43 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Updating read receipt setting for local chats", buf, 2u);
    }
  }
  long long v32 = 0u;
  long long v33 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v4 = +[IMDChatRegistry sharedInstance];
  obuint64_t j = [v4 chats];

  uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
  if (v5)
  {
    uint64_t v28 = *(void *)v31;
    uint64_t v7 = *MEMORY[0x1E4F6CE10];
    uint64_t v29 = *MEMORY[0x1E4F6CD30];
    uint64_t v24 = v25;
    *(void *)&long long v6 = 134218754;
    long long v23 = v6;
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v31 != v28) {
          objc_enumerationMutation(obj);
        }
        char v9 = *(void **)(*((void *)&v30 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "properties", v23, v24);
        uint64_t v11 = (void *)[v10 mutableCopy];

        uint64_t v12 = [v11 valueForKey:v7];
        if ([v12 integerValue])
        {
          int v13 = [v9 isOscarChat];
          char v14 = v13;
          if (v13 && IMOSLoggingEnabled())
          {
            uint64_t v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Read receipt is not going to be sent, chat filtered as junk", buf, 2u);
            }
          }
          __int16 v16 = [v11 valueForKey:v29];
          if (IMOSLoggingEnabled())
          {
            uint64_t v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              if (v16) {
                uint64_t v18 = [v16 longValue];
              }
              else {
                uint64_t v18 = -1;
              }
              uint64_t v19 = [v12 longValue];
              *(_DWORD *)buf = v23;
              uint64_t v35 = v24;
              __int16 v36 = 2048;
              uint64_t v37 = v18;
              __int16 v38 = 2048;
              uint64_t v39 = v19;
              __int16 v40 = 2112;
              long long v41 = v9;
              _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Global read receipt value set to [%ld], local chat read receipt value is [%ld] with versionID [%ld] for chat: %@", buf, 0x2Au);
            }
          }
          if ((v14 & 1) != 0 || [v16 BOOLValue] != v25)
          {
            [v11 removeObjectForKey:v29];
            [v11 removeObjectForKey:v7];
            [v9 updateProperties:v11];
            long long v20 = [(IMDServiceSession *)self broadcasterForChatListeners];
            uint64_t v21 = [v9 guid];
            id v22 = [v9 properties];
            [v20 chat:v21 propertiesUpdated:v22];
          }
        }
      }
      uint64_t v5 = [obj countByEnumeratingWithState:&v30 objects:v42 count:16];
    }
    while (v5);
  }
}

- (BOOL)_canHandleTransferAccept:(id)a3
{
  uint64_t v4 = [a3 serviceFromUserInfo];
  uint64_t v5 = [v4 length];
  long long v6 = [(IMDServiceSession *)self service];
  uint64_t v7 = [v6 internalName];
  uint64_t v8 = v7;
  if (v5)
  {
    uint64_t v7 = v4;
    char v9 = v8;
  }
  else
  {
    char v9 = (void *)*MEMORY[0x1E4F6E1B0];
  }
  char v10 = [v7 isEqualToString:v9];

  return v10;
}

- (void)_handleFileTransferAccepted:(id)a3
{
  uint64_t v4 = [a3 object];
  uint64_t v5 = [v4 serviceFromUserInfo];
  if ([(IMDServiceSession *)self _canHandleTransferAccept:v4])
  {
    long long v6 = [v4 guid];
    if (_IMWillLog())
    {
      uint64_t v7 = [(IMDServiceSession *)self service];
      uint64_t v15 = [v7 internalName];
      __int16 v16 = v4;
      _IMAlwaysLog();
    }
    if (v6)
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1D975EA2C;
      aBlock[3] = &unk_1E6B72C10;
      id v8 = v6;
      id v23 = v8;
      char v9 = (void (**)(void *, void))_Block_copy(aBlock);
      uint64_t v10 = [v4 transferState];
      int v11 = _IMWillLog();
      if (v10 > 1)
      {
        if (v11) {
          _IMAlwaysLog();
        }
        if (IMIsRunningInAutomation()) {
          v9[2](v9, 0);
        }
      }
      else
      {
        if (v11)
        {
          uint64_t v15 = v4;
          _IMAlwaysLog();
        }
        objc_msgSend(v4, "_setNeedsWrapper:", 0, v15, v16);
        if (IMFileTransferGUIDIsTemporary())
        {
          [(IMDServiceSession *)self fallbackToDownloadIfPossible:v8 transfer:v4];
        }
        else
        {
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
          int v13 = +[IMDFileTransferCenter sharedInstance];
          [v13 startTransfer:v8];

          char v14 = +[IMDCKAttachmentSyncController sharedInstance];
          v18[0] = MEMORY[0x1E4F143A8];
          v18[1] = 3221225472;
          v18[2] = sub_1D975EA8C;
          v18[3] = &unk_1E6B75BC0;
          v18[4] = self;
          id v19 = v8;
          id v20 = v4;
          uint64_t v21 = v9;
          [v14 acceptFileTransfer:v20 completion:v18];
        }
      }
    }
    else if (_IMWillLog())
    {
      _IMAlwaysLog();
    }
    goto LABEL_22;
  }
  if (_IMWillLog())
  {
    long long v6 = [(IMDServiceSession *)self service];
    uint64_t v12 = [v6 internalName];
    uint64_t v17 = [v4 guid];
    _IMAlwaysLog();

LABEL_22:
  }
}

- (void)_handleFileTransferBatchAccepted:(id)a3
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = [a3 object];
  if (_IMWillLog())
  {
    uint64_t v24 = v3;
    _IMAlwaysLog();
  }
  id v4 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  id v5 = v3;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v34 != v8) {
          objc_enumerationMutation(v5);
        }
        uint64_t v10 = *(void **)(*((void *)&v33 + 1) + 8 * i);
        int v11 = objc_msgSend(v10, "guid", v24);
        if (!v11)
        {
          if (!_IMWillLog()) {
            goto LABEL_18;
          }
          uint64_t v24 = v10;
LABEL_17:
          _IMAlwaysLog();
          goto LABEL_18;
        }
        uint64_t v12 = [v10 transferState];
        int v13 = _IMWillLog();
        if (v12 > 1)
        {
          if (!v13) {
            goto LABEL_18;
          }
          uint64_t v24 = v10;
          goto LABEL_17;
        }
        if (v13)
        {
          uint64_t v24 = v10;
          _IMAlwaysLog();
        }
        objc_msgSend(v10, "_setNeedsWrapper:", 0, v24);
        [v4 addObject:v10];
LABEL_18:
      }
      uint64_t v7 = [v5 countByEnumeratingWithState:&v33 objects:v38 count:16];
    }
    while (v7);
  }

  if (_IMWillLog()) {
    _IMAlwaysLog();
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v14 = v4;
  uint64_t v15 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
  if (v15)
  {
    uint64_t v16 = v15;
    uint64_t v17 = *(void *)v30;
    do
    {
      for (uint64_t j = 0; j != v16; ++j)
      {
        if (*(void *)v30 != v17) {
          objc_enumerationMutation(v14);
        }
        id v19 = *(void **)(*((void *)&v29 + 1) + 8 * j);
        id v20 = +[IMDFileTransferCenter sharedInstance];
        uint64_t v21 = [v19 guid];
        [v20 startTransfer:v21];
      }
      uint64_t v16 = [v14 countByEnumeratingWithState:&v29 objects:v37 count:16];
    }
    while (v16);
  }

  id v22 = +[IMDCKAttachmentSyncController sharedInstance];
  v26[0] = MEMORY[0x1E4F143A8];
  v26[1] = 3221225472;
  v26[2] = sub_1D975EE6C;
  v26[3] = &unk_1E6B73308;
  id v27 = v14;
  uint64_t v28 = self;
  id v23 = v14;
  [v22 acceptFileTransfers:v23 completion:v26];
}

- (void)fallbackToDownloadIfPossible:(id)a3 transfer:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  BOOL v7 = [(IMDServiceSession *)self _isTransferAvailableForDownload:v6];
  int v8 = _IMWillLog();
  if (v7)
  {
    if (v8) {
      _IMAlwaysLog();
    }
    [v6 _setTransferState:0];
    char v9 = [(IMDServiceSession *)self baseAttachmentController];
    [v9 acceptFileTransfer:v6];
  }
  else
  {
    if (v8) {
      _IMAlwaysLog();
    }
    [(IMDServiceSession *)self _resetTransferToTapDownloadState:v10];
  }
}

- (BOOL)_isTransferAvailableForDownload:(id)a3
{
  return [a3 isDownloadExpired] ^ 1;
}

- (void)_resetTransferToTapDownloadState:(id)a3
{
  id v9 = a3;
  if (_IMWillLog())
  {
    id v8 = v9;
    _IMAlwaysLog();
  }
  id v3 = +[IMDFileTransferCenter sharedInstance];
  id v4 = [v3 transferForGUID:v9];

  id v5 = +[IMDFileTransferCenter sharedInstance];
  id v6 = [MEMORY[0x1E4F28C58] errorWithDomain:@"MessageServiceSession" code:1 userInfo:0];
  [v5 resetTransfer:v9 andPostError:v6];

  [v4 _setTransferState:0];
  [v4 _setError:-1];
  BOOL v7 = +[IMDMessageStore sharedInstance];
  [v7 updateFileTransfer:v4];
}

- (void)storeMessage:(id)a3 forceReplace:(BOOL)a4 modifyError:(BOOL)a5 modifyFlags:(BOOL)a6 calculateUnreadCount:(BOOL)a7 flagMask:(unint64_t)a8 didReplaceBlock:(id)a9 shouldStoreBlock:(id)a10 didStoreBlock:(id)a11 block:(id)a12
{
  BOOL v14 = a6;
  BOOL v15 = a5;
  BOOL v16 = a4;
  uint64_t v74 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  id v66 = a9;
  v67 = (void (**)(id, id))a10;
  v68 = (void (**)(id, id))a11;
  uint64_t v18 = (void (**)(id, void, id, id))a12;
  if (!v18) {
    goto LABEL_72;
  }
  uint64_t v19 = [v17 scheduleType];
  BOOL v65 = v19 != 1;
  if (v19 == 1)
  {
    uint64_t v21 = v67;
    if (IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v17;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Not storing scheduled message %@", buf, 0xCu);
      }

      uint64_t v21 = v67;
    }
    id v20 = v17;
    if (!v21) {
      goto LABEL_17;
    }
    goto LABEL_10;
  }
  id v20 = 0;
  uint64_t v21 = v67;
  if (v67)
  {
LABEL_10:
    id v23 = v21;
    BOOL v24 = v19 != 1;
    uint64_t v25 = v23[2](v23, v17);
    id v26 = (void *)v25;
    if (v17) {
      BOOL v27 = v25 == 0;
    }
    else {
      BOOL v27 = 0;
    }
    BOOL v28 = !v27 && v24;
    BOOL v65 = v28;

    id v17 = v26;
  }
LABEL_17:
  if (([v17 isTypingMessage] & 1) == 0
    && [v17 scheduleType] != 1
    && IMOSLoggingEnabled())
  {
    long long v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v17;
      _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Storing message: %@", buf, 0xCu);
    }
  }
  if (v65)
  {
    long long v30 = +[IMDMessageStore sharedInstance];
    BYTE3(v64) = 0;
    *(_WORD *)((char *)&v64 + 1) = 0;
    LOBYTE(v64) = a7;
    uint64_t v31 = objc_msgSend(v30, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:isIncomingMessage:didReplaceBlock:", v17, v16, v15, v14, a8, 1, v64, v66);

    id v20 = (id)v31;
  }
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) == 0)
  {
    *(_OWORD *)buf = xmmword_1E6B774A0;
    long long v72 = *(_OWORD *)off_1E6B774B0;
    uint64_t v73 = 184;
    long long v32 = NSString;
    uint64_t v33 = IMFileLocationTrimFileName();
    uint64_t v34 = v73;
    long long v35 = NSString;
    uint64_t v36 = objc_opt_class();
    uint64_t v37 = [v35 stringWithFormat:@"input and output message types are not the same. input message has type %@. output message has type %@", v36, objc_opt_class()];
    __int16 v38 = [v32 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"[resultMessage isKindOfClass:[message class]]", "-[IMDServiceSession(IMDServiceSession_Chat_Private) storeMessage:forceReplace:modifyError:modifyFlags:calculateUnreadCount:flagMask:didReplaceBlock:shouldStoreBlock:didStoreBlock:block:]", v33, v34, v37];

    uint64_t v39 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v39)
    {
      v39(v38);
    }
    else if (IMOSLoggingEnabled())
    {
      __int16 v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v69 = 138412290;
        v70 = v38;
        _os_log_impl(&dword_1D967A000, v40, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", v69, 0xCu);
      }
    }
  }
  if ([v17 isTapToRetry])
  {
    if (IMOSLoggingEnabled())
    {
      long long v41 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        long long v42 = [v20 guid];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v42;
        _os_log_impl(&dword_1D967A000, v41, OS_LOG_TYPE_INFO, "Set tap to retry for message %@", buf, 0xCu);
      }
    }
    [v20 setIsTapToRetry:1];
  }
  if (([v17 isTypingMessage] & 1) == 0 && IMOSLoggingEnabled())
  {
    uint64_t v43 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v20;
      _os_log_impl(&dword_1D967A000, v43, OS_LOG_TYPE_INFO, "  => Result message: %@", buf, 0xCu);
    }
  }
  uint64_t v44 = [v17 contactsAvatarRecipeData];
  if (v44)
  {
    __int16 v45 = [v20 contactsAvatarRecipeData];
    BOOL v46 = v45 == 0;

    if (v46)
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v47 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          __int16 v48 = [v20 guid];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v48;
          _os_log_impl(&dword_1D967A000, v47, OS_LOG_TYPE_INFO, "Set avatar likeness data for message %@", buf, 0xCu);
        }
      }
      uint64_t v49 = [v17 contactsAvatarRecipeData];
      [v20 setContactsAvatarRecipeData:v49];
    }
  }
  uint64_t v50 = [v17 bizIntent];
  if (v50)
  {
    uint64_t v51 = [v20 bizIntent];
    BOOL v52 = v51 == 0;

    if (v52)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v53 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          v54 = [v20 guid];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v54;
          _os_log_impl(&dword_1D967A000, v53, OS_LOG_TYPE_INFO, "Set biz intent data for message %@", buf, 0xCu);
        }
      }
      __int16 v55 = [v17 bizIntent];
      [v20 setBizIntent:v55];
    }
  }
  v56 = [v17 locale];
  if (v56)
  {
    v57 = [v20 locale];
    BOOL v58 = v57 == 0;

    if (v58)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v59 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
        {
          v60 = [v20 guid];
          *(_DWORD *)buf = 138412290;
          *(void *)&uint8_t buf[4] = v60;
          _os_log_impl(&dword_1D967A000, v59, OS_LOG_TYPE_INFO, "Set locale data for message %@", buf, 0xCu);
        }
      }
      v61 = [v17 locale];
      [v20 setLocale:v61];
    }
  }
  if (IMOSLoggingEnabled())
  {
    v62 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
    {
      v63 = [v20 guid];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v63;
      _os_log_impl(&dword_1D967A000, v62, OS_LOG_TYPE_INFO, "Set meCard sharing preferences data for message %@", buf, 0xCu);
    }
  }
  objc_msgSend(v20, "setShouldSendMeCard:", objc_msgSend(v17, "shouldSendMeCard"));
  if (v68) {
    v68[2](v68, v20);
  }
  ((void (**)(id, BOOL, id, id))v18)[2](v18, v65, v17, v20);

LABEL_72:
}

- (id)_sharedAccountController
{
  return +[IMDAccountController sharedInstance];
}

- (id)_sharedMessageStore
{
  return +[IMDMessageStore sharedInstance];
}

- (void)useChatRoom:(id)a3 forGroupChatIdentifier:(id)a4
{
  id v6 = a4;
  id v11 = [(IMDServiceSession *)self canonicalFormOfChatRoom:a3];
  if (!self->_groupChatIdentifierToChatRoomMap)
  {
    BOOL v7 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    groupChatIdentifierToChatRoomMap = self->_groupChatIdentifierToChatRoomMap;
    self->_groupChatIdentifierToChatRoomMap = v7;
  }
  if (!self->_chatRoomToGroupChatIdentifierMap)
  {
    id v9 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    chatRoomToGroupChatIdentifierMap = self->_chatRoomToGroupChatIdentifierMap;
    self->_chatRoomToGroupChatIdentifierMap = v9;
  }
  [(NSMutableDictionary *)self->_groupChatIdentifierToChatRoomMap setObject:v11 forKey:v6];
  [(NSMutableDictionary *)self->_chatRoomToGroupChatIdentifierMap setObject:v6 forKey:v11];
}

- (id)groupChatIdentifierForChatRoom:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_chatRoomToGroupChatIdentifierMap objectForKey:a3];
}

- (id)chatRoomForGroupChatIdentifier:(id)a3
{
  return (id)[(NSMutableDictionary *)self->_groupChatIdentifierToChatRoomMap objectForKey:a3];
}

- (id)_guidForChat:(id)a3 style:(unsigned __int8)a4
{
  id v5 = a3;
  id v6 = [(IMDServiceSession *)self service];
  BOOL v7 = [v6 internalName];
  id v8 = (void *)IMCopyGUIDForChat();

  return v8;
}

- (void)registerChat:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v8 = [(IMDServiceSession *)self account];
  LOBYTE(v7) = 0;
  [(IMDServiceSession *)self registerChat:v6 style:v4 displayName:0 groupID:0 originalGroupID:0 lastAddressedHandle:0 lastAddressedSIMID:0 handleInfo:0 account:v8 isBlackholed:v7];
}

- (void)registerChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10 account:(id)a11 isBlackholed:(BOOL)a12
{
  uint64_t v149 = *MEMORY[0x1E4F143B8];
  id v17 = a3;
  unsigned __int8 v133 = a4;
  id v98 = a5;
  id v99 = a6;
  id v100 = a7;
  id v102 = a8;
  id v103 = a9;
  id v104 = a10;
  id v18 = a11;
  if (v17)
  {
    uint64_t v19 = v18;
    if (!v18)
    {
      uint64_t v19 = [(IMDServiceSession *)self account];
    }
    [(NSRecursiveLock *)self->_lock lock];
    id v132 = v17;
    [(IMDServiceSession *)self canonicalizeChatIdentifier:&v132 style:&v133];
    id v20 = v132;

    v97 = [(IMDServiceSession *)self _guidForChat:v20 style:v133];
    if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413570;
        id v138 = v20;
        __int16 v139 = 1024;
        int v140 = v133;
        __int16 v141 = 2112;
        v142 = v97;
        __int16 v143 = 2112;
        id v144 = v104;
        __int16 v145 = 2112;
        id v146 = v102;
        __int16 v147 = 2112;
        id v148 = v103;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Registering chat identifier: %@   style: %d  guid: %@ handleInfo: %@ lastAddressedHandle %@ lastAddressedSIMID %@", buf, 0x3Au);
      }
    }
    uint64_t v22 = v133;
    v122[0] = MEMORY[0x1E4F143A8];
    v122[1] = 3221225472;
    v122[2] = sub_1D980E3B8;
    v122[3] = &unk_1E6B774D0;
    v122[4] = self;
    id v123 = v20;
    unsigned __int8 v130 = v133;
    id v93 = v98;
    id v124 = v93;
    id v95 = v99;
    id v125 = v95;
    id v94 = v100;
    id v126 = v94;
    id v91 = v102;
    id v127 = v91;
    id v90 = v103;
    id v128 = v90;
    id v96 = v19;
    id v129 = v96;
    BOOL v131 = a12;
    id v108 = v123;
    [(IMDServiceSession *)self _calculateHandleInfoOverrideIfPermittedForChatIdentifier:v123 style:v22 completion:v122];
    id v23 = +[IMDChatRegistry sharedInstance];
    v101 = [v23 existingChatWithGUID:v97];

    if (v101)
    {
      BOOL v24 = [v101 participants];
      if ([v24 count])
      {
      }
      else
      {
        BOOL v49 = [v104 count] == 0;

        if (!v49)
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v50 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v138 = v104;
              _os_log_impl(&dword_1D967A000, v50, OS_LOG_TYPE_INFO, " => Found chat, but it had no particpants. Updating with handleInfo: %@", buf, 0xCu);
            }
          }
          goto LABEL_44;
        }
      }
      BOOL v25 = [(IMDServiceSession *)self _shouldConvergeChatParticipants:v101 withHandleInfo:v104];
      int v26 = IMOSLoggingEnabled();
      if (!v25)
      {
        if (v26)
        {
          __int16 v48 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v138 = v101;
            _os_log_impl(&dword_1D967A000, v48, OS_LOG_TYPE_INFO, " => We already have one, nothing to do here. Chat: [%@]", buf, 0xCu);
          }
        }
        goto LABEL_92;
      }
      if (v26)
      {
        BOOL v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v138 = v104;
          _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, " => Found chat, but it had a different set of participants. Updating with handleInfo: %@", buf, 0xCu);
        }
      }
      id v28 = objc_alloc(MEMORY[0x1E4F1CA80]);
      long long v29 = [v101 participantHandles];
      long long v30 = (void *)[v28 initWithArray:v29];

      long long v120 = 0u;
      long long v121 = 0u;
      long long v118 = 0u;
      long long v119 = 0u;
      id v31 = v104;
      uint64_t v32 = [v31 countByEnumeratingWithState:&v118 objects:v136 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v119;
        uint64_t v34 = *MEMORY[0x1E4F6C5C8];
        uint64_t v35 = *MEMORY[0x1E4F6C458];
        do
        {
          for (uint64_t i = 0; i != v32; ++i)
          {
            if (*(void *)v119 != v33) {
              objc_enumerationMutation(v31);
            }
            uint64_t v37 = *(void **)(*((void *)&v118 + 1) + 8 * i);
            __int16 v38 = [v37 objectForKeyedSubscript:v34];
            [v30 removeObject:v38];
            uint64_t v39 = [v37 objectForKeyedSubscript:v35];
            unsigned int v40 = [v39 intValue];
            if (v40) {
              uint64_t v41 = v40;
            }
            else {
              uint64_t v41 = 2;
            }
            id v42 = [(IMDServiceSession *)self didChangeMemberStatus:v41 forHandle:v38 forChat:v108 style:v133];
          }
          uint64_t v32 = [v31 countByEnumeratingWithState:&v118 objects:v136 count:16];
        }
        while (v32);
      }

      long long v116 = 0u;
      long long v117 = 0u;
      long long v114 = 0u;
      long long v115 = 0u;
      id v43 = v30;
      uint64_t v44 = [v43 countByEnumeratingWithState:&v114 objects:v135 count:16];
      if (v44)
      {
        uint64_t v45 = *(void *)v115;
        do
        {
          for (uint64_t j = 0; j != v44; ++j)
          {
            if (*(void *)v115 != v45) {
              objc_enumerationMutation(v43);
            }
            id v47 = [(IMDServiceSession *)self didChangeMemberStatus:3 forHandle:*(void *)(*((void *)&v114 + 1) + 8 * j) forChat:v108 style:v133];
          }
          uint64_t v44 = [v43 countByEnumeratingWithState:&v114 objects:v135 count:16];
        }
        while (v44);
      }
    }
LABEL_44:
    int v51 = v133;
    BOOL v52 = v108;
    if (v133 == 45) {
      BOOL v52 = 0;
    }
    id v92 = v52;
    if (v51 == 43)
    {
      id v106 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v112 = 0u;
      long long v113 = 0u;
      long long v110 = 0u;
      long long v111 = 0u;
      obuint64_t j = v104;
      uint64_t v61 = [obj countByEnumeratingWithState:&v110 objects:v134 count:16];
      if (v61)
      {
        uint64_t v107 = *(void *)v111;
        uint64_t v62 = *MEMORY[0x1E4F6C5C8];
        uint64_t v63 = *MEMORY[0x1E4F6C648];
        uint64_t v64 = *MEMORY[0x1E4F6C5A0];
        do
        {
          for (uint64_t k = 0; k != v61; ++k)
          {
            if (*(void *)v111 != v107) {
              objc_enumerationMutation(obj);
            }
            id v66 = *(void **)(*((void *)&v110 + 1) + 8 * k);
            v67 = [v66 objectForKey:v62];
            v68 = [v66 objectForKey:v63];
            v69 = [v66 objectForKey:v64];
            if (v67)
            {
              if (MEMORY[0x1E0169B60](v67))
              {
                v70 = IMChatCanonicalIDSIDsForAddress();
                v71 = [v70 _stripFZIDPrefix];
              }
              else
              {
                v71 = [v67 _stripFZIDPrefix];
                v70 = v67;
              }

              long long v72 = [[IMDHandle alloc] initWithID:v71 unformattedID:v68 countryCode:v69];
              [v106 addObject:v72];
            }
          }
          uint64_t v61 = [obj countByEnumeratingWithState:&v110 objects:v134 count:16];
        }
        while (v61);
      }

      uint64_t v73 = +[IMDChatRegistry sharedInstance];
      LOBYTE(v89) = a12;
      uint64_t v74 = [v73 chatForHandles:v106 account:v96 chatIdentifier:v108 style:43 groupID:v95 originalGroupID:v94 displayName:v93 guid:v97 lastAddressedHandle:v91 lastAddressedSIMID:v90 isBlackholed:v89];
    }
    else if (v51 == 45)
    {
      objc_msgSend(v104, "__imFirstObject");
      id v106 = (id)objc_claimAutoreleasedReturnValue();
      id v53 = [v106 objectForKey:*MEMORY[0x1E4F6C5C8]];
      v54 = [v106 objectForKey:*MEMORY[0x1E4F6C648]];
      __int16 v55 = [v106 objectForKey:*MEMORY[0x1E4F6C5A0]];
      v56 = [v106 objectForKey:*MEMORY[0x1E4F6D1E0]];
      v57 = [v106 objectForKey:*MEMORY[0x1E4F6CCD0]];
      if (!v53) {
        id v53 = v108;
      }
      int v58 = [v56 BOOLValue];
      uint64_t v59 = [IMDHandle alloc];
      if (v58) {
        uint64_t v60 = [(IMDHandle *)v59 initWithID:v53 unformattedID:v54 countryCode:v55 personCentricID:v57];
      }
      else {
        uint64_t v60 = [(IMDHandle *)v59 initWithID:v53 unformattedID:v54 countryCode:v55];
      }
      v75 = (void *)v60;
      v76 = +[IMDChatRegistry sharedInstance];
      LOBYTE(v88) = a12;
      uint64_t v74 = [v76 chatForHandle:v75 account:v96 chatIdentifier:v108 guid:v97 lastAddressedHandle:v91 lastAddressedSIMID:v90 isBlackholed:v88];
    }
    else
    {
      id v106 = +[IMDChatRegistry sharedInstance];
      uint64_t v74 = [v106 chatForRoom:v92 account:v96 chatIdentifier:v108 guid:v97];
    }

    [v74 setGroupID:v95];
    if (v94) {
      objc_msgSend(v74, "setOriginalGroupID:");
    }
    [v74 setDisplayName:v93];
    if ([MEMORY[0x1E4F6C408] isEngramEnabled]) {
      [v74 setCreateEngramGroupOnMessageSend:1];
    }
    v77 = +[IMDChatStore sharedInstance];
    [v77 storeChat:v74];

    if ([MEMORY[0x1E4F6EA38] isInternationalSpamFilteringEnabled]
      && [v74 isBlackholed])
    {
      v78 = [v74 participants];
      BOOL v79 = [v78 count] == 1;

      v80 = [MEMORY[0x1E4F6E890] sharedInstance];
      v81 = v80;
      if (v79)
      {
        [v80 trackSpamEvent:15];

        v82 = [MEMORY[0x1E4F6E890] sharedInstance];
        [v82 trackSpamEvent:13];
      }
      else
      {
        [v80 trackSpamEvent:16];

        v82 = [MEMORY[0x1E4F6E890] sharedInstance];
        [v82 trackSpamEvent:14];
      }
    }
    if (v133 != 45) {
      goto LABEL_87;
    }
    v83 = [MEMORY[0x1E4F6C360] sharedInstance];
    if ([v83 isInternalInstall])
    {
      int v84 = [v108 hasPrefix:@"chat"];

      if (!v84)
      {
LABEL_87:
        if (IMOSLoggingEnabled())
        {
          v87 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v138 = v74;
            _os_log_impl(&dword_1D967A000, v87, OS_LOG_TYPE_INFO, "Created chat: %@", buf, 0xCu);
          }
        }
LABEL_92:
        [(NSRecursiveLock *)self->_lock unlock];

        id v18 = v96;
        goto LABEL_93;
      }
      if (IMOSLoggingEnabled())
      {
        v85 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v138 = v74;
          _os_log_impl(&dword_1D967A000, v85, OS_LOG_TYPE_INFO, "********** Created bad chat: %@ *************", buf, 0xCu);
        }
      }
      IMLogBacktrace();
      v83 = [MEMORY[0x1E4F28F80] processInfo];
      v86 = [v83 processName];
      IMLogSimulateCrashForProcess();
    }
    goto LABEL_87;
  }
  id v108 = 0;
LABEL_93:
}

- (void)canonicalizeChatIdentifier:(id *)a3 style:(unsigned __int8 *)a4
{
  id v7 = *a3;
  int v8 = *a4;
  if (v8 == 35)
  {
    id v9 = [(IMDServiceSession *)self canonicalFormOfChatRoom:v7];
LABEL_6:
    *a3 = v9;
    goto LABEL_9;
  }
  if (v8 != 43)
  {
    if (v8 != 45) {
      goto LABEL_9;
    }
    id v9 = [(IMDServiceSession *)self canonicalFormOfID:v7];
    goto LABEL_6;
  }
  id v11 = v7;
  if ([(IMDServiceSession *)self shouldImitateGroupChatUsingChatRooms])
  {
    id v10 = [(IMDServiceSession *)self chatRoomForGroupChatIdentifier:v11];
    *a3 = [(IMDServiceSession *)self canonicalFormOfChatRoom:v10];
    *a4 = 35;
  }
LABEL_9:

  MEMORY[0x1F41817F8]();
}

- (void)_mapRoomChatToGroupChat:(id *)a3 style:(unsigned __int8 *)a4
{
  if ([(IMDServiceSession *)self shouldImitateGroupChatUsingChatRooms]
    && *a4 == 35)
  {
    id v7 = [(IMDServiceSession *)self groupChatIdentifierForChatRoom:*a3];
    if (v7)
    {
      id v8 = v7;
      *a3 = v7;
      id v7 = v8;
      *a4 = 43;
    }
  }
}

- (id)existingChatsForGroupID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[IMDChatRegistry sharedInstance];
  id v5 = [v3 UUIDString];

  id v6 = [v4 existingChatsWithGroupID:v5];

  return v6;
}

- (id)existingChatForID:(id)a3
{
  id v4 = a3;
  id v5 = +[IMDChatRegistry sharedInstance];
  id v6 = [(IMDServiceSession *)self account];
  id v7 = [v5 existingChatForID:v4 account:v6];

  return v7;
}

- (id)existingChatsForIDs:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = +[IMDChatRegistry sharedInstance];
  id v8 = [(IMDServiceSession *)self service];
  id v9 = [v7 existingChatsForIDs:v6 onService:v8 style:v4];

  return v9;
}

- (id)chatForChatIdentifier:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  id v7 = [(IMDServiceSession *)self account];
  id v8 = [(IMDServiceSession *)self chatForChatIdentifier:v6 style:v4 account:v7];

  return v8;
}

- (id)chatForChatIdentifier:(id)a3 style:(unsigned __int8)a4 account:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  unsigned __int8 v24 = a4;
  id v7 = a5;
  id v23 = a3;
  id v8 = a3;
  [(IMDServiceSession *)self canonicalizeChatIdentifier:&v23 style:&v24];
  id v9 = v23;

  if (v9)
  {
    id v10 = [(IMDServiceSession *)self _guidForChat:v9 style:v24];
    id v11 = +[IMDChatRegistry sharedInstance];
    uint64_t v12 = [v11 existingChatWithGUID:v10];

    if (v12)
    {
      id v13 = [v12 account];
      BOOL v14 = v13 == v7;

      if (!v14)
      {
        if (IMOSLoggingEnabled())
        {
          BOOL v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            id v16 = [v12 accountID];
            id v17 = [v7 accountID];
            *(_DWORD *)buf = 138412546;
            id v26 = v16;
            __int16 v27 = 2112;
            id v28 = v17;
            _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Updating account ID from: %@ => %@", buf, 0x16u);
          }
        }
        id v18 = objc_msgSend(v7, "accountID", v23);
        [v12 setAccountID:v18];

        uint64_t v19 = +[IMDChatStore sharedInstance];
        [v19 storeChat:v12];
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v26 = v10;
        __int16 v27 = 2112;
        id v28 = v9;
        __int16 v29 = 1024;
        int v30 = v24;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Failed to find chat for guid %@ with chatIdentifier: %@, style: %c", buf, 0x1Cu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Failed to canonicalize chat identifier", buf, 2u);
      }
    }
    uint64_t v12 = 0;
  }

  return v12;
}

- (id)bestCandidateGroupChatWithFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7
{
  id v12 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v17 = +[IMDChatRegistry sharedInstance];
  id v18 = [(IMDServiceSession *)self service];
  uint64_t v19 = [v18 internalName];
  id v20 = [v17 bestCandidateGroupChatWithFromIdentifier:v16 toIdentifier:v15 displayName:v14 participants:v13 groupID:v12 serviceName:v19];

  return v20;
}

- (id)bestCandidateGroupChatWithFromIdentifier:(id)a3 toIdentifier:(id)a4 displayName:(id)a5 participants:(id)a6 groupID:(id)a7 originalGroupID:(id)a8
{
  id v14 = a8;
  id v15 = a7;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = +[IMDChatRegistry sharedInstance];
  uint64_t v21 = [(IMDServiceSession *)self service];
  uint64_t v22 = [v21 internalName];
  id v23 = [v20 bestCandidateGroupChatWithFromIdentifier:v19 toIdentifier:v18 displayName:v17 participants:v16 groupID:v15 originalGroupID:v14 serviceName:v22];

  return v23;
}

- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 completionBlock:(id)a7
{
  BOOL v7 = a6;
  uint64_t v8 = a5;
  id v12 = a7;
  id v13 = a4;
  id v14 = a3;
  id v15 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self processMessageForSending:v14 toChat:v13 style:v8 allowWatchdog:v7 account:v15 completionBlock:v12];
}

- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 account:(id)a7 completionBlock:(id)a8
{
}

- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 account:(id)a7 didReplaceMessageBlock:(id)a8 completionBlock:(id)a9
{
  BOOL v11 = a6;
  uint64_t v57 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  unsigned __int8 v48 = a5;
  id v17 = a7;
  id v40 = a8;
  id v18 = a9;
  id v19 = v18;
  if (v15)
  {
    if (!v17)
    {
      id v17 = [(IMDServiceSession *)self account];
    }
    id v47 = v16;
    [(IMDServiceSession *)self _mapRoomChatToGroupChat:&v47 style:&v48];
    id v20 = v47;

    if (v11
      && ([v15 isTypingMessage] & 1) == 0
      && ([v15 isSuggestedActionResponse] & 1) == 0)
    {
      uint64_t v21 = [v15 guid];
      [(IMDServiceSession *)self _updateWatchdogForMessageGUID:v21];
    }
    [(IMDServiceSession *)self _configureSessionInformationOnItem:v15 toChat:v20 withStyle:v48 forAccount:v17];
    [(IMDServiceSession *)self _setOutgoingFlagsOnMessage:v15];
    [v15 setErrorCode:0];
    int v38 = [v15 isBeingRetried];
    char v46 = 0;
    uint64_t v22 = (void *)MEMORY[0x1E4F6E898];
    id v23 = [v15 balloonBundleID];
    unsigned __int8 v24 = [v15 body];
    BOOL v25 = [v15 payloadData];
    uint64_t v39 = [v22 photoShareURLFromPluginBundleID:v23 contentString:v24 payload:v25 shouldAccept:&v46];

    uint64_t v26 = [(IMDServiceSession *)self existingChatForID:v20];
    __int16 v27 = (void *)v26;
    if (v39 && v46)
    {
      if (v26)
      {
        id v28 = +[IMDMomentShareManager sharedInstance];
        [v28 registerAndAcceptMomentShareForMessage:v15 inChat:v27 resetAssetTransfers:1];
      }
      else if (IMOSLoggingEnabled())
      {
        __int16 v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          int v30 = [v15 guid];
          *(_DWORD *)buf = 138412290;
          id v50 = v30;
          _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Failed to accept moment share for message guid: %@", buf, 0xCu);
        }
      }
    }
    if ([v15 containsRichLink])
    {
      BOOL v31 = [(IMDServiceSession *)self _isMessageSWYSpamMessage:v15 inChat:v27];
      id v44 = 0;
      id v45 = 0;
      BOOL v32 = [(IMDServiceSession *)self _shouldShowSWYQuickActionForMessage:v15 outAppName:&v45 outBundleID:&v44];
      id v33 = v45;
      id v34 = v44;
      if (v31 || v32)
      {
        [(IMDServiceSession *)self _configureSyndicationRangesForMessage:v15 forChat:v27 withSyndicationStatus:2];
        [v15 setWasDetectedAsSWYSpam:v31];
        [v15 setSwyAppName:v33];
        [v15 setSwyBundleID:v34];
        if (IMOSLoggingEnabled())
        {
          log = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(log, OS_LOG_TYPE_INFO))
          {
            uint64_t v35 = @"NO";
            *(_DWORD *)buf = 138413058;
            id v50 = v15;
            if (v31) {
              uint64_t v36 = @"YES";
            }
            else {
              uint64_t v36 = @"NO";
            }
            __int16 v51 = 2112;
            BOOL v52 = v36;
            if (v32) {
              uint64_t v35 = @"YES";
            }
            __int16 v53 = 2112;
            v54 = v35;
            __int16 v55 = 2112;
            id v56 = v33;
            _os_log_impl(&dword_1D967A000, log, OS_LOG_TYPE_INFO, "Configuring Syndication Ranges for Message: %@. isSWYSpam %@, showQuickAction: %@ swyAppName: %@", buf, 0x2Au);
          }
        }
      }
    }
    if ([v27 isChatBot]) {
      [v15 setBalloonBundleID:*MEMORY[0x1E4F6CAF0]];
    }
    v41[0] = MEMORY[0x1E4F143A8];
    v41[1] = 3221225472;
    v41[2] = sub_1D980F308;
    v41[3] = &unk_1E6B774F8;
    v41[4] = self;
    id v42 = v15;
    id v43 = v19;
    [(IMDServiceSession *)self storeMessage:v42 forceReplace:v38 ^ 1u modifyError:v38 ^ 1u modifyFlags:v38 ^ 1u calculateUnreadCount:0 flagMask:557068 didReplaceBlock:v40 shouldStoreBlock:0 didStoreBlock:0 block:v41];

    id v16 = v20;
  }
  else
  {
    (*((void (**)(id, void))v18 + 2))(v18, 0);
  }
}

- (void)_configureAccountInformationOnItem:(id)a3 withAccount:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  BOOL v7 = [v5 service];
  uint64_t v8 = [v7 internalName];
  [v6 setService:v8];

  id v9 = [v5 accountID];
  [v6 setAccountID:v9];

  id v10 = [v5 loginID];

  [v6 setAccount:v10];
}

- (void)_configureTimeOnOutgoingItem:(id)a3
{
  id v5 = a3;
  id v3 = [v5 time];

  if (!v3)
  {
    uint64_t v4 = [MEMORY[0x1E4F1C9C8] date];
    [v5 setTime:v4];
  }
}

- (void)_configureIdentifierForOutgoingItem:(id)a3 withIdentifier:(id)a4 withStyle:(unsigned __int8)a5
{
  if (a5 == 45) {
    [a3 setHandle:a4];
  }
  else {
    [a3 setRoomName:a4];
  }
}

- (void)_configureSessionInformationOnItem:(id)a3 toChat:(id)a4 withStyle:(unsigned __int8)a5 forAccount:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  [(IMDServiceSession *)self _configureTimeOnOutgoingItem:v12];
  [(IMDServiceSession *)self _configureAccountInformationOnItem:v12 withAccount:v10];

  [(IMDServiceSession *)self _configureIdentifierForOutgoingItem:v12 withIdentifier:v11 withStyle:v6];
}

- (void)_setOutgoingFlagsOnMessage:(id)a3
{
  id v3 = a3;
  objc_msgSend(v3, "setFlags:", objc_msgSend(v3, "flags") & 0xFFFFFFFFFFFF7FFBLL | 4);
}

- (void)_messageStoreCompletion:(BOOL)a3 inputMessage:(id)a4 outputMessage:(id)a5 originalMessage:(id)a6 completionBlock:(id)a7
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = (void (**)(id, void *))a7;
  if (a3 || [v12 scheduleType] == 1)
  {
    if (([v12 isTypingMessage] & 1) == 0
      && [v12 scheduleType] != 1
      && IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v19 = 138412546;
        id v20 = v12;
        __int16 v21 = 2112;
        id v22 = v13;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "  => Message was stored. Input: %@   Output: %@", (uint8_t *)&v19, 0x16u);
      }
    }
    id v17 = [(IMDServiceSession *)self _determineResultMessageForInput:v12 output:v13 original:v14];
    id v18 = [v14 consumedSessionPayloads];
    if (![(IMDServiceSession *)self _shouldDropSendingMessage])
    {
      if (v18) {
        [v17 setConsumedSessionPayloads:v18];
      }
      objc_msgSend(v17, "setShouldNotifyOnSend:", objc_msgSend(v14, "shouldNotifyOnSend"));
      objc_msgSend(v17, "setSentViaRemoteIntent:", objc_msgSend(v14, "sentViaRemoteIntent"));
      if (v15) {
        v15[2](v15, v17);
      }
    }
  }
}

- (id)_determineResultMessageForInput:(id)a3 output:(id)a4 original:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v8;
  if (v8)
  {
LABEL_2:
    id v11 = v10;
    goto LABEL_4;
  }
  id v11 = v7;
  if (!v11)
  {
    int v15 = IMOSLoggingEnabled();
    id v10 = v9;
    if (v15)
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v9;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "  => No result? Using the requested message: %@", (uint8_t *)&v17, 0xCu);
      }

      id v10 = v9;
    }
    goto LABEL_2;
  }
LABEL_4:
  if ([v9 isBeingRetried]) {
    [v11 setIsBeingRetried:1];
  }
  id v12 = [v9 retryToParticipant];

  if (v12)
  {
    id v13 = [v9 retryToParticipant];
    [v11 setRetryToParticipant:v13];
  }

  return v11;
}

- (BOOL)_shouldDropSendingMessage
{
  int v2 = IMGetCachedDomainBoolForKey();
  if (v2 && IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, " ** DropSendingMessage is enabled, failing send message", v5, 2u);
    }
  }
  return v2;
}

- (id)itemWithGUID:(id)a3
{
  id v3 = a3;
  uint64_t v4 = +[IMDMessageStore sharedInstance];
  id v5 = [v4 itemWithGUID:v3];

  return v5;
}

- (id)chatForItemWithGUID:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDServiceSession *)self _sharedMessageStore];
  uint64_t v6 = [v5 chatForMessageGUID:v4];

  if (!v6 && IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Chat: Could not find a chat for itemGUID: %@", (uint8_t *)&v9, 0xCu);
    }
  }

  return v6;
}

- (void)storeItem:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  v34[1] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (v8)
  {
    id v10 = [(IMDServiceSession *)self chatForChatIdentifier:v9 style:v5];
    if ([v8 type] == 6)
    {
      uint64_t v11 = [v10 properties];
      if (!v11
        || ([v10 properties],
            id v12 = objc_claimAutoreleasedReturnValue(),
            [v12 objectForKey:@"lastTUConversationCreatedDate"],
            id v13 = objc_claimAutoreleasedReturnValue(),
            v13,
            v12,
            v11,
            !v13))
      {
        id v14 = [v10 properties];
        if (v14)
        {
          int v15 = [v10 properties];
          id v16 = (id)[v15 mutableCopy];
        }
        else
        {
          id v16 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
        }

        int v17 = [MEMORY[0x1E4F1C9C8] date];
        [v16 setValue:v17 forKey:@"lastTUConversationCreatedDate"];

        id v18 = (void *)[v16 copy];
        [v10 updateProperties:v18];
      }
    }
    uint64_t v19 = +[IMDMessageStore sharedInstance];
    id v20 = [v19 storeItem:v8 forceReplace:0];

    __int16 v21 = +[IMDChatStore sharedInstance];
    id v22 = [v8 guid];
    [v21 addMessageWithGUID:v22 toChat:v10 deferSpotlightIndexing:1];

    if (v20)
    {
      v34[0] = v20;
      uint64_t v23 = [MEMORY[0x1E4F1C978] arrayWithObjects:v34 count:1];
      unsigned __int8 v24 = (void *)IMCreateSerializedItemsFromArray();

      BOOL v25 = -[IMDServiceSession broadcasterForChatListenersWithBlackholeStatus:](self, "broadcasterForChatListenersWithBlackholeStatus:", [v10 isBlackholed]);
      uint64_t v26 = [v10 accountID];
      __int16 v27 = [v10 chatIdentifier];
      id v28 = [v10 properties];
      [v25 account:v26 chat:v27 style:v5 chatProperties:v28 messagesUpdated:v24];

      __int16 v29 = [v10 guid];
      int v30 = [v10 properties];
      [v25 chat:v29 propertiesUpdated:v30];
    }
    else if (IMOSLoggingEnabled())
    {
      BOOL v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        int v32 = 138412290;
        id v33 = v8;
        _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Failed to store item %@", (uint8_t *)&v32, 0xCu);
      }
    }
  }
}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self sendMessage:v9 toChat:v8 style:v5 account:v10];
}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 destinationHandles:(id)a6
{
  uint64_t v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1D9904A50(v6);
  }
}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  unsigned __int8 v28 = a5;
  id v12 = a6;
  if (v10)
  {
    if ([v10 isBeingRetried])
    {
      if (IMOSLoggingEnabled())
      {
        id v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = [v10 guid];
          *(_DWORD *)buf = 138412290;
          int v30 = v14;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Not sending message up to client because this message is being retried. Guid %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (!v12)
      {
        id v12 = [(IMDServiceSession *)self account];
      }
      id v27 = v11;
      [(IMDServiceSession *)self _mapRoomChatToGroupChat:&v27 style:&v28];
      id v15 = v27;

      [(IMDServiceSession *)self _configureSessionInformationOnItem:v10 toChat:v15 withStyle:v28 forAccount:v12];
      [(IMDServiceSession *)self _setOutgoingFlagsOnMessage:v10];
      id v16 = [(IMDServiceSession *)self chatForChatIdentifier:v15 style:v28];
      if ([v10 scheduleType] == 1)
      {
        if (IMOSLoggingEnabled())
        {
          int v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v18 = [v10 guid];
            *(_DWORD *)buf = 138412290;
            int v30 = v18;
            _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Not storing scheduled message or notifying client about message with GUID: %@ ", buf, 0xCu);
          }
        }
      }
      else
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = sub_1D98102E8;
        v25[3] = &unk_1E6B77520;
        id v26 = v16;
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = sub_1D9810534;
        v19[3] = &unk_1E6B77548;
        id v20 = v26;
        __int16 v21 = self;
        id v22 = v12;
        id v23 = v15;
        unsigned __int8 v24 = v28;
        [(IMDServiceSession *)self storeMessage:v10 forceReplace:1 modifyError:1 modifyFlags:1 calculateUnreadCount:0 flagMask:0x2000000800CLL didReplaceBlock:0 shouldStoreBlock:0 didStoreBlock:v25 block:v19];
      }
      id v11 = v15;
    }
  }
}

- (void)revokeSentMessage:(id)a3 inChat:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      id v9 = [(IMDServiceSession *)self displayName];
      id v10 = [v6 guid];
      id v11 = [v7 guid];
      int v12 = 138412802;
      id v13 = v9;
      __int16 v14 = 2112;
      id v15 = v10;
      __int16 v16 = 2112;
      int v17 = v11;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "%@ Service session does not support message revocation for %@ in chat %@", (uint8_t *)&v12, 0x20u);
    }
  }
}

- (void)relayLegacySatelliteMessage:(id)a3 toChat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Service session does not support legacy satellite relay", v8, 2u);
    }
  }
}

- (void)downgradeRequestedForHandleID:(id)a3 expirationDate:(id)a4 preferredService:(id)a5
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = (objc_class *)objc_opt_class();
      id v13 = NSStringFromClass(v12);
      *(_DWORD *)buf = 138413058;
      id v24 = v13;
      __int16 v25 = 2112;
      id v26 = v8;
      __int16 v27 = 2112;
      id v28 = v9;
      __int16 v29 = 2112;
      id v30 = v10;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "%@ setting downgrade flag for %@ (expiration: %@) to %@", buf, 0x2Au);
    }
  }
  __int16 v14 = [(IMDServiceSession *)self chatForChatIdentifier:v8 style:45];
  if (!v14)
  {
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v8;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, " => No chat for %@, joining chat", buf, 0xCu);
      }
    }
    uint64_t v16 = *MEMORY[0x1E4F6C458];
    v21[0] = *MEMORY[0x1E4F6C5C8];
    v21[1] = v16;
    v22[0] = v8;
    v22[1] = &unk_1F33C5E38;
    int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v22 forKeys:v21 count:2];
    id v20 = v17;
    uint64_t v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v20 count:1];
    [(IMDServiceSession *)self didJoinChat:v8 style:45 displayName:0 groupID:0 lastAddressedHandle:0 lastAddressedSIMID:0 handleInfo:v18];

    __int16 v14 = [(IMDServiceSession *)self chatForChatIdentifier:v8 style:45];
  }
  [v14 setRequestedDowngradeService:v10];
  if (v9)
  {
    [v14 setRequestedDowngradeExpirationDate:v9];
  }
  else
  {
    uint64_t v19 = [MEMORY[0x1E4F1C9C8] now];
    [v14 setRequestedDowngradeExpirationDate:v19];
  }
}

- (void)clearDowngradeRequestForHandleID:(id)a3
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = (objc_class *)objc_opt_class();
      id v7 = NSStringFromClass(v6);
      int v11 = 138412546;
      int v12 = v7;
      __int16 v13 = 2112;
      id v14 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "%@ clearing downgrade flag for %@", (uint8_t *)&v11, 0x16u);
    }
  }
  id v8 = [(IMDServiceSession *)self chatForChatIdentifier:v4 style:45];
  id v9 = v8;
  if (v8)
  {
    [v8 setRequestedDowngradeService:0];
    [v9 setRequestedDowngradeExpirationDate:0];
  }
  else if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      LOWORD(v11) = 0;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, " => No existing chat, no change to downgrade flag", (uint8_t *)&v11, 2u);
    }
  }
}

- (BOOL)hasValidDowngradeRequestForHandleID:(id)a3
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDServiceSession *)self chatForChatIdentifier:v4 style:45];
  id v6 = v5;
  if (v5)
  {
    id v7 = [v5 requestedDowngradeService];
    id v8 = [v6 requestedDowngradeExpirationDate];
    char v9 = 0;
    if ([v7 length] && v8)
    {
      id v10 = [MEMORY[0x1E4F1C9C8] now];
      int v11 = [v8 laterDate:v10];

      if (v11 == v10)
      {
        if (IMOSLoggingEnabled())
        {
          id v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            int v24 = 138412546;
            __int16 v25 = v7;
            __int16 v26 = 2112;
            __int16 v27 = v8;
            _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Previous downgrade request to %@ expired on %@, clearing", (uint8_t *)&v24, 0x16u);
          }
        }
        [v6 setRequestedDowngradeService:0];
        [v6 setRequestedDowngradeExpirationDate:0];
        char v9 = 0;
      }
      else
      {
        int v12 = +[IMDMessageStore sharedInstance];
        __int16 v13 = [(IMDServiceSession *)self service];
        id v14 = [v13 internalName];
        uint64_t v15 = [v12 lastIncomingMessageForChatWithIdentifier:v4 chatStyle:45 onService:v14];

        uint64_t v16 = +[IMDMessageStore sharedInstance];
        int v17 = [v16 lastIncomingMessageForChatWithIdentifier:v4 chatStyle:45 onService:v7];

        uint64_t v18 = [v15 time];
        uint64_t v19 = [v17 time];
        if (v17)
        {
          if (v15)
          {
            id v20 = [v18 laterDate:v19];
            BOOL v21 = v20 == v18;

            char v9 = !v21;
          }
          else
          {
            char v9 = 1;
          }
        }
        else
        {
          char v9 = 0;
        }
      }
    }
  }
  else
  {
    char v9 = 0;
  }

  return v9 & 1;
}

- (void)sentDowngradeRequestToHandleID:(id)a3 fromID:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Downgrade request was sent to %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 reflectOnly:(BOOL)a7
{
  id v9 = [a3 guid];
  int v8 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didSendMessageReadReceiptForMessageID:v9 account:v8];
}

- (void)sendDeliveredQuietlyReceiptForMessage:(id)a3 forIncomingMessageFromIDSID:(id)a4 toChatGuid:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 withWillSendToDestinationsHandler:(id)a8
{
  id v10 = [a3 guid];
  id v9 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didSendDeliveredQuietlyReceiptForMessageID:v10 account:v9];
}

- (void)sendNotifyRecipientCommandForMessage:(id)a3 toChatGuid:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v8 = [a3 guid];
  id v7 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didSendNotifyRecipientCommandForMessageID:v8 account:v7];
}

- (void)sendPlayedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v8 = [a3 guid];
  id v7 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didSendMessagePlayedReceiptForMessageID:v8 account:v7];
}

- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  id v9 = a7;
  id v10 = [a3 guid];
  [(IMDServiceSession *)self didSendMessageSavedReceiptForMessageID:v10 account:v9];
}

- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v8 = [a3 guid];
  id v7 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didSendMessageSavedReceiptForMessageID:v8 account:v7];
}

- (void)sendSyndicationAction:(id)a3 toChatsWithIdentifiers:(id)a4
{
  id v4 = IMLogHandleForCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR)) {
    sub_1D9904A94(v4);
  }
}

- (void)sendDeliveryReceiptForMessageID:(id)a3 toID:(id)a4 deliveryContext:(id)a5 needsDeliveryReceipt:(id)a6 callerID:(id)a7 account:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v20 = 0;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Not sending delivery receipt", v20, 2u);
    }
  }
}

- (void)_blastDoorProcessingWithIMMessageItem:(id)a3 chat:(id)a4 account:(id)a5 fromToken:(id)a6 fromIDSID:(id)a7 fromIdentifier:(id)a8 toIdentifier:(id)a9 participants:(id)a10 groupName:(id)a11 groupID:(id)a12 isFromMe:(BOOL)a13 isLastFromStorage:(BOOL)a14 isFromStorage:(BOOL)a15 hideLockScreenNotification:(BOOL)a16 wantsCheckpointing:(BOOL)a17 needsDeliveryReceipt:(id)a18 messageBalloonPayloadAttachmentDictionary:(id)a19 inlineAttachments:(id)a20 attributionInfoArray:(id)a21 nicknameDictionary:(id)a22 availabilityVerificationRecipientChannelIDPrefix:(id)a23 availabilityVerificationRecipientEncryptionValidationToken:(id)a24 availabilityOffGridRecipientSubscriptionValidationToken:(id)a25 availabilityOffGridRecipientEncryptionValidationToken:(id)a26 idsService:(id)a27 messageContext:(id)a28 isFromTrustedSender:(BOOL)a29 isFromSnapTrustedSender:(BOOL)a30 completionBlock:(id)a31
{
  uint64_t v65 = *MEMORY[0x1E4F143B8];
  id v48 = a3;
  id v36 = a4;
  id v49 = a5;
  id v50 = a6;
  id v51 = a7;
  id v52 = a8;
  id v53 = a9;
  id v54 = a10;
  id v55 = a11;
  id v56 = a12;
  id v37 = a18;
  id v57 = a19;
  id v58 = a20;
  id v59 = a21;
  id v60 = a22;
  id v61 = a23;
  id v62 = a24;
  id v38 = a25;
  id v39 = a26;
  id v40 = a27;
  id v41 = a28;
  id v42 = a31;
  if (IMOSLoggingEnabled())
  {
    id v43 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      id v44 = v36;
      id v45 = [(IMDServiceSession *)self service];
      char v46 = [v45 internalName];
      *(_DWORD *)buf = 138543362;
      uint64_t v64 = v46;
      _os_log_impl(&dword_1D967A000, v43, OS_LOG_TYPE_INFO, "Not handling, blastdoor not supported in %{public}@ yet", buf, 0xCu);

      id v36 = v44;
    }
  }
}

- (void)requestGroupPhotoIfNecessary:(id)a3 incomingParticipantVersion:(int64_t)a4 incomingGroupPhotoCreationTime:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 messageIsFromStorage:(BOOL)a8
{
  id v11 = a3;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Not requesting group photo, subclass for iMessage should handle", v16, 2u);
    }
  }
}

- (void)sendLocationSharingInfo:(id)a3 toID:(id)a4 completionBlock:(id)a5
{
  if (a5) {
    (*((void (**)(id, void))a5 + 2))(a5, 0);
  }
}

- (void)fetchIncomingPendingMessagesFromHandlesIDs:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = self;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Service session %@ does not support message fetching", (uint8_t *)&v6, 0xCu);
    }
  }
}

- (BOOL)_shouldBroadcastSendFailures
{
  return ![(IMDServiceSession *)self isReplicating];
}

- (void)didLeaveChat:(id)a3 style:(unsigned __int8)a4
{
}

- (void)didLeaveChat:(id)a3 style:(unsigned __int8)a4 account:(id)a5
{
}

- (void)didLeaveChat:(id)a3 style:(unsigned __int8)a4 account:(id)a5 messageID:(id)a6
{
  uint64_t v8 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v26 = a3;
  id v23 = a5;
  id v24 = a6;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v33 = v26;
      __int16 v34 = 1024;
      int v35 = v8;
      __int16 v36 = 1024;
      int v37 = 3;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Did leave chat: %@  style: %c setting state: %d", buf, 0x18u);
    }
  }
  __int16 v25 = objc_alloc_init(IMDChatStatusChangeContext);
  [(IMDChatStatusChangeContext *)v25 setMessageID:v24];
  [(IMDChatStatusChangeContext *)v25 setAccount:v23];
  [(IMDServiceSession *)self didUpdateChatStatus:3 chat:v26 style:v8 context:v25];
  id v11 = [(IMDServiceSession *)self _guidForChat:v26 style:v8];
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v12 = +[IMDChatRegistry sharedInstance];
  id v13 = [v12 allExistingChatsWithIdentifier:v26 style:v8];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (!v14) {
    goto LABEL_20;
  }
  char v15 = 0;
  uint64_t v16 = *(void *)v28;
  do
  {
    for (uint64_t i = 0; i != v14; ++i)
    {
      if (*(void *)v28 != v16) {
        objc_enumerationMutation(v13);
      }
      id v18 = *(void **)(*((void *)&v27 + 1) + 8 * i);
      uint64_t v19 = objc_msgSend(v18, "guid", v23);
      char v20 = [v19 isEqualToString:v11];

      if ((v20 & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          BOOL v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v33 = v18;
            _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Leaving sibling chat %@", buf, 0xCu);
          }
        }
        [v18 setState:0];
        id v22 = +[IMDChatStore sharedInstance];
        [v22 storeChat:v18];

        char v15 = 1;
      }
    }
    uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v31 count:16];
  }
  while (v14);

  if (v15)
  {
    id v13 = +[IMDMessageStore sharedInstance];
    [v13 updateStamp];
LABEL_20:
  }
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4
{
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 handleInfo:(id)a5
{
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 handleInfo:(id)a5 account:(id)a6
{
  LOBYTE(v6) = 0;
  [(IMDServiceSession *)self didJoinChat:a3 style:a4 displayName:0 groupID:0 handleInfo:a5 account:a6 isBlackholed:v6];
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 handleInfo:(id)a7
{
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 handleInfo:(id)a8
{
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 handleInfo:(id)a8
{
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 handleInfo:(id)a9
{
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10
{
  uint64_t v14 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  if (IMOSLoggingEnabled())
  {
    id v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138414082;
      id v25 = v16;
      __int16 v26 = 1024;
      int v27 = v14;
      __int16 v28 = 1024;
      int v29 = 2;
      __int16 v30 = 2112;
      id v31 = v17;
      __int16 v32 = 2112;
      id v33 = v18;
      __int16 v34 = 2112;
      id v35 = v19;
      __int16 v36 = 2112;
      id v37 = v20;
      __int16 v38 = 2112;
      id v39 = v21;
      _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Did join chat: %@  style: %c setting state: %d   name: %@   groupID: %@ originalGroupID: %@ lastAddressedHandle %@ lastAddressedSIMID %@", buf, 0x4Au);
    }
  }
  [(IMDServiceSession *)self didUpdateChatStatus:2 chat:v16 style:v14 displayName:v17 groupID:v18 originalGroupID:v19 lastAddressedHandle:v20 lastAddressedSIMID:v21 handleInfo:v22];
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 originalGroupID:(id)a7 handleInfo:(id)a8 category:(int64_t)a9 spamExtensionName:(id)a10
{
  uint64_t v14 = a4;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a10;
  if (IMOSLoggingEnabled())
  {
    id v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413826;
      id v25 = v16;
      __int16 v26 = 1024;
      int v27 = v14;
      __int16 v28 = 1024;
      int v29 = 2;
      __int16 v30 = 2112;
      id v31 = v17;
      __int16 v32 = 2112;
      id v33 = v18;
      __int16 v34 = 2048;
      int64_t v35 = a9;
      __int16 v36 = 2112;
      id v37 = v21;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Did join chat: %@  style: %c setting state: %d   name: %@   groupID: %@  category %ld extensionName %@", buf, 0x40u);
    }
  }
  id v23 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didUpdateChatStatus:2 chat:v16 style:v14 displayName:v17 groupID:v18 originalGroupID:v19 handleInfo:v20 account:v23 category:a9 spamExtensionName:v21];
}

- (void)didJoinChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 handleInfo:(id)a7 account:(id)a8 isBlackholed:(BOOL)a9
{
  uint64_t v13 = a4;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      id v23 = v15;
      __int16 v24 = 1024;
      int v25 = v13;
      __int16 v26 = 1024;
      int v27 = 2;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 2112;
      id v31 = v17;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Did join chat: %@  style: %c setting state: %d   name: %@   groupID: %@", buf, 0x2Cu);
    }
  }
  LOBYTE(v21) = a9;
  [(IMDServiceSession *)self didUpdateChatStatus:2 chat:v15 style:v13 displayName:v16 groupID:v17 handleInfo:v18 account:v19 isBlackholed:v21];
}

- (void)didJoinReadOnlyChat:(id)a3 style:(unsigned __int8)a4 displayName:(id)a5 groupID:(id)a6 handleInfo:(id)a7 category:(int64_t)a8 spamExtensionName:(id)a9
{
  uint64_t v13 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413826;
      id v23 = v15;
      __int16 v24 = 1024;
      int v25 = v13;
      __int16 v26 = 1024;
      int v27 = 7;
      __int16 v28 = 2112;
      id v29 = v16;
      __int16 v30 = 2112;
      id v31 = v17;
      __int16 v32 = 2048;
      int64_t v33 = a8;
      __int16 v34 = 2112;
      id v35 = v19;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Did join chat: %@  style: %c setting state: %d   name: %@   groupID: %@  category %ld extensionName %@", buf, 0x40u);
    }
  }
  uint64_t v21 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didUpdateChatStatus:7 chat:v15 style:v13 displayName:v16 groupID:v17 originalGroupID:0 handleInfo:v18 account:v21 category:a8 spamExtensionName:v19];
}

- (void)didReceiveReplaceMessageID:(int)a3 forChat:(id)a4 style:(unsigned __int8)a5
{
  int v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  if (v5 == 45)
  {
    id v13 = v8;
    id v9 = +[IMDMessageStore sharedInstance];
    id v10 = [(IMDServiceSession *)self service];
    id v11 = [v10 internalName];
    id v12 = (id)[v9 deleteMessagesWithReplaceMessageID:v6 fromHandle:v13 onService:v11];

    id v8 = v13;
  }
}

- (void)didReceiveErrorMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5
{
  unsigned __int8 v17 = a5;
  id v16 = a4;
  id v7 = a4;
  id v8 = a3;
  [(IMDServiceSession *)self _mapRoomChatToGroupChat:&v16 style:&v17];
  id v9 = v16;

  id v10 = objc_alloc(MEMORY[0x1E4F1C9E8]);
  id v11 = objc_msgSend(v10, "initWithObjectsAndKeys:", v8, *MEMORY[0x1E4F28568], 0);

  id v12 = objc_alloc(MEMORY[0x1E4F28C58]);
  id v13 = (void *)[v12 initWithDomain:*MEMORY[0x1E4F6C158] code:0 userInfo:v11];
  if (![(IMDServiceSession *)self isAwaitingStorageTimer])
  {
    uint64_t v14 = [(IMDServiceSession *)self broadcasterForChatListeners];
    id v15 = [(IMDServiceSession *)self accountID];
    [v14 account:v15 chat:v9 style:v17 chatProperties:0 error:v13];
  }
}

- (void)didReceiveError:(unsigned int)a3 forMessageID:(id)a4 forceError:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = *(void *)&a3;
  id v8 = a4;
  id v9 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didReceiveError:v6 forMessageID:v8 forceError:v5 account:v9];
}

- (void)didReceiveError:(unsigned int)a3 forMessageID:(id)a4 forceError:(BOOL)a5 account:(id)a6
{
  BOOL v7 = a5;
  uint64_t v8 = *(void *)&a3;
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a6;
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
    {
      id v13 = @"NO";
      *(_DWORD *)__int16 v34 = 67109634;
      *(_DWORD *)&v34[4] = v8;
      *(_WORD *)&v34[8] = 2112;
      if (v7) {
        id v13 = @"YES";
      }
      *(void *)&v34[10] = v10;
      __int16 v35 = 2112;
      uint64_t v36 = v13;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_DEBUG, "error: %d  message: %@  force error: %@", v34, 0x1Cu);
    }
  }
  if (v10)
  {
    uint64_t v14 = [(IMDServiceSession *)self service];
    int v15 = [v14 supportsDatabase];

    if (v15)
    {
      if (!v11)
      {
        id v11 = [(IMDServiceSession *)self account];
      }
      id v16 = +[IMDMessageStore sharedInstance];
      unsigned __int8 v17 = [v16 messageWithGUID:v10];

      if (v17)
      {
        id v18 = [(IMDServiceSession *)self _sharedMessageStore];
        id v19 = [v18 chatForMessage:v17];

        if (!v19 && IMOSLoggingEnabled())
        {
          id v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int16 v34 = 138412290;
            *(void *)&v34[4] = v17;
            _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Chat: Could not find a chat for message: %@", v34, 0xCu);
          }
        }
        if (v7 || ![v17 isDelivered])
        {
          if (IMOSLoggingEnabled())
          {
            id v23 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)__int16 v34 = 138412546;
              *(void *)&v34[4] = v17;
              *(_WORD *)&v34[12] = 1024;
              *(_DWORD *)&v34[14] = v8;
              _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Found old message: %@  for error: %d", v34, 0x12u);
            }
          }
          [v17 setErrorCode:v8];
          uint64_t v24 = [v17 scheduleType];
          if (v8 && v24 == 2) {
            [(IMDServiceSession *)self _handleScheduledMessageFailure:v17];
          }
          int v25 = +[IMDMessageStore sharedInstance];
          __int16 v26 = [v25 storeMessage:v17 forceReplace:0 modifyError:1 modifyFlags:0 flagMask:0];

          if (IMOSLoggingEnabled())
          {
            int v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)__int16 v34 = 138412290;
              *(void *)&v34[4] = v26;
              _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Updated message: %@", v34, 0xCu);
            }
          }
          if ([(IMDServiceSession *)self isAwaitingStorageTimer])
          {
            __int16 v28 = [v26 guid];
            [(IMDServiceSession *)self noteSuppressedMessageUpdate:v28];
          }
          else
          {
            __int16 v28 = [(IMDServiceSession *)self broadcasterForChatListeners];
            id v29 = [v11 accountID];
            __int16 v30 = [v19 chatIdentifier];
            uint64_t v31 = [v19 style];
            __int16 v32 = [v19 chatProperties];
            [v28 account:v29 chat:v30 style:v31 chatProperties:v32 messageUpdated:v26];
          }
          int64_t v33 = [v26 guid];
          sub_1D9812D2C(v33);

          unsigned __int8 v17 = v26;
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)__int16 v34 = 138412290;
            *(void *)&v34[4] = v17;
            _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Message is already delivered, and we're not forcing an error here (%@)", v34, 0xCu);
          }
        }
      }
      else if (IMOSLoggingEnabled())
      {
        id v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)__int16 v34 = 67109378;
          *(_DWORD *)&v34[4] = v8;
          *(_WORD *)&v34[8] = 2112;
          *(void *)&v34[10] = v10;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Unable to mark error: %d, no messages found for guid: %@", v34, 0x12u);
        }
      }
    }
  }
}

- (void)didReceiveOffGridStatus:(BOOL)a3 forID:(id)a4 messageGUID:(id)a5 account:(id)a6
{
  BOOL v8 = a3;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      uint64_t v14 = @"NO";
      *(_DWORD *)uint64_t v24 = 138412802;
      if (v8) {
        uint64_t v14 = @"YES";
      }
      *(void *)&v24[4] = v14;
      __int16 v25 = 2112;
      id v26 = v10;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Received off grid status %@ for %@ sending %@", v24, 0x20u);
    }
  }
  if (!v12)
  {
    id v12 = [(IMDServiceSession *)self account];
  }
  int v15 = +[IMDMessageStore sharedInstance];
  id v16 = [v15 messageWithGUID:v11];

  if (v16)
  {
    unsigned __int8 v17 = [v16 service];
    if ([v17 isEqualToString:*MEMORY[0x1E4F6E1B0]])
    {
      int v18 = [v16 isPendingSatelliteSend];

      if (v18 == v8)
      {
        id v20 = v16;
        if (v8) {
          goto LABEL_17;
        }
        goto LABEL_22;
      }
      [v16 setIsPendingSatelliteSend:v8];
      id v19 = +[IMDMessageStore sharedInstance];
      id v20 = [v19 storeMessage:v16 forceReplace:0 modifyError:0 modifyFlags:1 flagMask:0x20000000000];

      unsigned __int8 v17 = [(IMDServiceSession *)self broadcasterForChatListeners];
      uint64_t v21 = [v12 accountID];
      [v17 account:v21 chat:0 style:0 chatProperties:0 messageUpdated:v20];
    }
    else
    {
      id v20 = v16;
    }

    if (v8) {
      goto LABEL_17;
    }
LABEL_22:
    [(IMDServiceSession *)self _clearOffGridFlagForMessagesInChatWithChatIdentifier:v10 account:v12];
    goto LABEL_23;
  }
  id v20 = 0;
  if (!v8) {
    goto LABEL_22;
  }
LABEL_17:
  id v22 = [v20 time];
  if (v22)
  {
    IMSetDomainValueForKey();
  }
  else
  {
    id v23 = [MEMORY[0x1E4F1C9C8] now];
    IMSetDomainValueForKey();
  }
  [(IMDServiceSession *)self _updateUndeliveredMessagesPendingSatelliteSendForChatWithIdentifier:v10 account:v12];
LABEL_23:
}

- (void)_updateUndeliveredMessagesPendingSatelliteSendForChatWithIdentifier:(id)a3 account:(id)a4
{
  v46[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v38 = a4;
  uint64_t v36 = v6;
  uint64_t v37 = [(IMDServiceSession *)self chatForChatIdentifier:v6 style:45];
  if (v37)
  {
    BOOL v7 = +[IMDMessageStore sharedInstance];
    BOOL v8 = [(IMDServiceSession *)self service];
    id v9 = [v8 internalName];
    __int16 v35 = [v7 lastIncomingMessageForChatWithIdentifier:v6 chatStyle:45 onService:v9];

    id v10 = [v35 time];
    id v11 = v10;
    if (v10)
    {
      id v12 = v10;
    }
    else
    {
      id v12 = [MEMORY[0x1E4F1C9C8] distantPast];
    }
    id v13 = v12;

    __int16 v32 = v13;
    __int16 v34 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K > %@", *MEMORY[0x1E4F6D590], v13];
    int64_t v33 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", *MEMORY[0x1E4F6D5B0], MEMORY[0x1E4F1CC38]];
    id v14 = objc_alloc(MEMORY[0x1E4F6BF58]);
    int v15 = [v37 guid];
    id v16 = (void *)[v14 initWithAssociatedChatGUID:v15];

    unsigned __int8 v17 = (void *)MEMORY[0x1E4F28BA0];
    v46[0] = v34;
    v46[1] = v33;
    int v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:v46 count:2];
    id v19 = [v17 andPredicateWithSubpredicates:v18];
    [v16 setPredicate:v19];

    long long v41 = 0u;
    long long v42 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id v20 = v16;
    uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v45 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v40;
      do
      {
        for (uint64_t i = 0; i != v21; ++i)
        {
          if (*(void *)v40 != v22) {
            objc_enumerationMutation(v20);
          }
          uint64_t v24 = (void *)IMDCreateIMMessageItemFromIMDMessageRecordRef(*(void *)(*((void *)&v39 + 1) + 8 * i), 0);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v25 = v24;
            if ([v25 expectedOffGridCapableDeliveries])
            {
              if (IMOSLoggingEnabled())
              {
                id v26 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
                {
                  __int16 v27 = [v25 guid];
                  *(_DWORD *)buf = 138412290;
                  id v44 = v27;
                  _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Updating pending flag for %@", buf, 0xCu);
                }
              }
              [v25 setIsPendingSatelliteSend:1];
              id v28 = +[IMDMessageStore sharedInstance];
              uint64_t v29 = [v28 storeMessage:v25 forceReplace:0 modifyError:0 modifyFlags:1 flagMask:0x20000000000];

              __int16 v30 = [(IMDServiceSession *)self broadcasterForChatListeners];
              uint64_t v31 = [v38 accountID];
              [v30 account:v31 chat:0 style:0 chatProperties:0 messageUpdated:v29];
            }
            else
            {
              uint64_t v29 = v25;
            }
          }
        }
        uint64_t v21 = [v20 countByEnumeratingWithState:&v39 objects:v45 count:16];
      }
      while (v21);
    }
  }
}

- (void)_clearOffGridFlagForMessagesInChatWithChatIdentifier:(id)a3 account:(id)a4
{
  v38[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v30 = a4;
  id v28 = v6;
  uint64_t v29 = [(IMDServiceSession *)self chatForChatIdentifier:v6 style:45];
  if (v29)
  {
    uint64_t v7 = MEMORY[0x1E4F1CC38];
    __int16 v27 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K = %@", *MEMORY[0x1E4F6D5C8], MEMORY[0x1E4F1CC38]];
    id v26 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K == %@", *MEMORY[0x1E4F6D5B0], v7];
    id v8 = objc_alloc(MEMORY[0x1E4F6BF58]);
    id v9 = [v29 guid];
    id v10 = (void *)[v8 initWithAssociatedChatGUID:v9];

    id v11 = (void *)MEMORY[0x1E4F28BA0];
    v38[0] = v27;
    v38[1] = v26;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:v38 count:2];
    id v13 = [v11 andPredicateWithSubpredicates:v12];
    [v10 setPredicate:v13];

    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id v14 = v10;
    uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v32;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v32 != v16) {
            objc_enumerationMutation(v14);
          }
          int v18 = (void *)IMDCreateIMMessageItemFromIMDMessageRecordRef(*(void *)(*((void *)&v31 + 1) + 8 * i), 0);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            id v19 = v18;
            if (IMOSLoggingEnabled())
            {
              id v20 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
              {
                uint64_t v21 = [v19 guid];
                *(_DWORD *)buf = 138412290;
                uint64_t v36 = v21;
                _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Clearing pending flag for %@", buf, 0xCu);
              }
            }
            [v19 setIsPendingSatelliteSend:0];
            [v19 setExpectedOffGridCapableDeliveries:0];
            uint64_t v22 = +[IMDMessageStore sharedInstance];
            id v23 = [v22 storeMessage:v19 forceReplace:0 modifyError:0 modifyFlags:1 flagMask:0x20000000000];

            uint64_t v24 = [(IMDServiceSession *)self broadcasterForChatListeners];
            id v25 = [v30 accountID];
            [v24 account:v25 chat:0 style:0 chatProperties:0 messageUpdated:v23];
          }
        }
        uint64_t v15 = [v14 countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v15);
    }
  }
}

- (void)didReceiveMessageEditingUnsupportedHandleIDs:(id)a3 forMessageGUID:(id)a4 partIndex:(int64_t)a5 previousMessage:(id)a6 backwardCompatibilityMessageGUID:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v50 = a7;
  if ([v11 count])
  {
    id v13 = +[IMDMessageStore sharedInstance];
    id v14 = [v13 messageWithGUID:v12];
    if (v14)
    {
      uint64_t v15 = v14;
      int64_t v49 = a5;
      uint64_t v16 = [v14 messageSummaryInfo];
      unsigned __int8 v17 = (void *)v16;
      int v18 = (void *)MEMORY[0x1E4F1CC08];
      if (v16) {
        int v18 = (void *)v16;
      }
      id v19 = v18;

      id v20 = (void *)[v19 mutableCopy];
      uint64_t v21 = *MEMORY[0x1E4F6D658];
      uint64_t v22 = [v19 objectForKeyedSubscript:*MEMORY[0x1E4F6D658]];

      id v23 = (void *)MEMORY[0x1E4F1CBF0];
      if (v22) {
        id v23 = v22;
      }
      id v24 = v23;

      id v25 = (void *)[objc_alloc(MEMORY[0x1E4F1CA70]) initWithArray:v24];
      [v25 addObjectsFromArray:v11];
      id v26 = [v25 array];
      [v20 setObject:v26 forKeyedSubscript:v21];
      id v48 = v20;
      __int16 v27 = (void *)[v20 copy];
      [v15 setMessageSummaryInfo:v27];

      if ([v50 length])
      {
        id v47 = v26;
        id v28 = [v15 historyForMessagePart:v49];
        if ([v28 count])
        {
          uint64_t v29 = (void *)[v28 mutableCopy];
          id v30 = [v29 lastObject];
          id v45 = v25;
          id v31 = objc_alloc(MEMORY[0x1E4F6E870]);
          [v30 messagePartText];
          v32 = char v46 = v13;
          [v30 dateSent];
          long long v34 = v33 = self;
          __int16 v35 = (void *)[v31 initWithMessagePartText:v32 dateSent:v34 backwardCompatibleMessageGUID:v50];

          self = v33;
          [v29 removeLastObject];
          [v29 addObject:v35];
          uint64_t v36 = (void *)[v29 copy];
          [v15 setHistory:v36 forMessagePart:v49];

          id v13 = v46;
          id v25 = v45;
        }
        id v26 = v47;
      }
      uint64_t v37 = [v13 storeMessage:v15 forceReplace:1 modifyError:0 modifyFlags:0 flagMask:0];

      if ([(IMDServiceSession *)self isAwaitingStorageTimer])
      {
        [(IMDServiceSession *)self noteSuppressedMessageUpdate:v12];
      }
      else
      {
        [(IMDServiceSession *)self account];
        id v38 = v25;
        long long v40 = v39 = v13;
        uint64_t v41 = [v40 accountID];
        long long v42 = self;
        id v43 = (void *)v41;
        id v44 = [(IMDServiceSession *)v42 broadcasterForChatListeners];
        [v44 account:v43 chat:0 style:0 chatProperties:0 messageUpdated:v37];

        id v13 = v39;
        id v25 = v38;
      }
      sub_1D9812D2C(v12);
    }
    else
    {
      uint64_t v37 = IMLogHandleForCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR)) {
        sub_1D9904AD8();
      }
    }
  }
}

- (void)didReceiveMessageEditingSendFailure:(unsigned int)a3 forMessageGUID:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6
{
  id v9 = a4;
  id v10 = +[IMDMessageStore sharedInstance];
  id v11 = [v10 messageWithGUID:v9];
  if (v11)
  {
    id v12 = v11;
    if (a6 == 2)
    {
      [v11 addFailedRetractPartIndex:a5];
    }
    else if (a6 == 1)
    {
      [v11 addFailedEditPartIndex:a5];
    }
    id v13 = [v10 storeMessage:v12 forceReplace:1 modifyError:1 modifyFlags:0 flagMask:0];

    if ([(IMDServiceSession *)self isAwaitingStorageTimer])
    {
      [(IMDServiceSession *)self noteSuppressedMessageUpdate:v9];
    }
    else
    {
      id v14 = [(IMDServiceSession *)self account];
      uint64_t v15 = [v14 accountID];
      uint64_t v16 = [(IMDServiceSession *)self broadcasterForChatListeners];
      [v16 account:v15 chat:0 style:0 chatProperties:0 messageUpdated:v13];
    }
    sub_1D9812D2C(v9);
  }
  else
  {
    id v13 = IMLogHandleForCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
      sub_1D9904B40();
    }
  }
}

- (void)didSendMessageEditForMessageGUID:(id)a3
{
  id v4 = a3;
  BOOL v5 = +[IMDMessageStore sharedInstance];
  id v6 = [v5 messageWithGUID:v4];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = [v6 messageSummaryInfo];
    id v9 = (void *)v8;
    id v10 = (void *)MEMORY[0x1E4F1CC08];
    if (v8) {
      id v10 = (void *)v8;
    }
    id v11 = v10;

    uint64_t v12 = *MEMORY[0x1E4F6D650];
    id v13 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F6D650]];
    uint64_t v14 = *MEMORY[0x1E4F6D680];
    uint64_t v15 = [v11 objectForKeyedSubscript:*MEMORY[0x1E4F6D680]];
    if ([v13 count] || objc_msgSend(v15, "count"))
    {
      uint64_t v16 = IMLogHandleForCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
        sub_1D9904C10();
      }

      unsigned __int8 v17 = (void *)[v11 mutableCopy];
      [v17 removeObjectForKey:v12];
      [v17 removeObjectForKey:v14];
      int v18 = (void *)[v17 copy];
      [v7 setMessageSummaryInfo:v18];

      id v19 = [v5 storeMessage:v7 forceReplace:1 modifyError:1 modifyFlags:0 flagMask:0];

      if ([(IMDServiceSession *)self isAwaitingStorageTimer])
      {
        [(IMDServiceSession *)self noteSuppressedMessageUpdate:v4];
      }
      else
      {
        id v20 = [(IMDServiceSession *)self account];
        uint64_t v21 = [v20 accountID];
        uint64_t v22 = [(IMDServiceSession *)self broadcasterForChatListeners];
        [v22 account:v21 chat:0 style:0 chatProperties:0 messageUpdated:v19];
      }
      sub_1D9812D2C(v4);
    }
    else
    {
      id v19 = v7;
    }
  }
  else
  {
    id v19 = IMLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1D9904BA8();
    }
  }
}

- (void)didSendMessageReadReceiptForMessageID:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didSendMessageReadReceiptForMessageID:v4 account:v5];
}

- (void)didSendMessageReadReceiptForMessageID:(id)a3 account:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v27 = 138412290;
      id v28 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_DEBUG, "message: %@", (uint8_t *)&v27, 0xCu);
    }
  }
  if (v6)
  {
    id v9 = [(IMDServiceSession *)self service];
    int v10 = [v9 supportsDatabase];

    if (v10)
    {
      if (!v7)
      {
        id v7 = [(IMDServiceSession *)self account];
      }
      id v11 = +[IMDMessageStore sharedInstance];
      uint64_t v12 = [v11 messageWithGUID:v6];

      id v13 = [v12 service];
      uint64_t v14 = [(IMDServiceSession *)self service];
      uint64_t v15 = [v14 internalName];

      if (!v12 || !v13 || !v15) {
        goto LABEL_26;
      }
      if ([(IMDServiceSession *)self messageServiceNamed:v15 canProcessMessagesFromServiceNamed:v13])
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            int v27 = 138412290;
            id v28 = v12;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Found old message for read receipt: %@", (uint8_t *)&v27, 0xCu);
          }
        }
        unsigned __int8 v17 = [v12 timeRead];
        BOOL v18 = v17 == 0;

        if (v18)
        {
          objc_msgSend(v12, "setFlags:", objc_msgSend(v12, "flags") | 0x2000);
          id v19 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithCurrentServerTime");
          [v12 setTimeRead:v19];

          id v20 = +[IMDMessageStore sharedInstance];
          uint64_t v21 = [v20 storeMessage:v12 forceReplace:0 modifyError:0 modifyFlags:1 flagMask:0x2000];

          uint64_t v12 = (void *)v21;
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            int v27 = 138412290;
            id v28 = v12;
            _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Updated message: %@", (uint8_t *)&v27, 0xCu);
          }
        }
        if ([(IMDServiceSession *)self isAwaitingStorageTimer])
        {
          id v23 = [v12 guid];
          [(IMDServiceSession *)self noteSuppressedMessageUpdate:v23];
        }
        else
        {
          id v23 = [(IMDServiceSession *)self broadcasterForChatListeners];
          id v25 = [v7 accountID];
          [v23 account:v25 chat:0 style:0 chatProperties:0 messageUpdated:v12];
        }
        id v26 = [v12 guid];
        sub_1D9812D2C(v26);

        goto LABEL_36;
      }
      if (![(IMDServiceSession *)self messageServiceNamed:v15 canProcessMessagesFromServiceNamed:v13])
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_36;
        }
        id v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          int v27 = 138412546;
          id v28 = v13;
          __int16 v29 = 2112;
          id v30 = v15;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Unable to mark send of read receipt, message is on a different service: %@ vs %@", (uint8_t *)&v27, 0x16u);
        }
      }
      else
      {
LABEL_26:
        if (!IMOSLoggingEnabled())
        {
LABEL_36:

          goto LABEL_37;
        }
        id v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          int v27 = 138412290;
          id v28 = v6;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Unable to mark send of read receipt, no messages found for guid: %@", (uint8_t *)&v27, 0xCu);
        }
      }

      goto LABEL_36;
    }
  }
LABEL_37:
}

- (void)didSendDeliveredQuietlyReceiptForMessageID:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didSendDeliveredQuietlyReceiptForMessageID:v4 account:v5];
}

- (void)didSendDeliveredQuietlyReceiptForMessageID:(id)a3 account:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v26 = 138412290;
      id v27 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_DEBUG, "message: %@", (uint8_t *)&v26, 0xCu);
    }
  }
  if (v6)
  {
    id v9 = [(IMDServiceSession *)self service];
    int v10 = [v9 supportsDatabase];

    if (v10)
    {
      if (!v7)
      {
        id v7 = [(IMDServiceSession *)self account];
      }
      id v11 = +[IMDMessageStore sharedInstance];
      uint64_t v12 = [v11 messageWithGUID:v6];

      id v13 = [v12 service];
      uint64_t v14 = [(IMDServiceSession *)self service];
      uint64_t v15 = [v14 internalName];

      if (!v12 || !v13 || !v15) {
        goto LABEL_31;
      }
      if ([(IMDServiceSession *)self messageServiceNamed:v15 canProcessMessagesFromServiceNamed:v13])
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            int v26 = 138412290;
            id v27 = v12;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Found old message for delivered quietly receipt: %@", (uint8_t *)&v26, 0xCu);
          }
        }
        if (([v12 isFromMe] & 1) == 0 && (objc_msgSend(v12, "wasDeliveredQuietly") & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            unsigned __int8 v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              BOOL v18 = [v12 guid];
              int v26 = 138412290;
              id v27 = v18;
              _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Setting was delivered quietly flag on local device for message: %@", (uint8_t *)&v26, 0xCu);
            }
          }
          objc_msgSend(v12, "setFlags:", objc_msgSend(v12, "flags") | 0x400000000);
          id v19 = +[IMDMessageStore sharedInstance];
          uint64_t v20 = [v19 storeMessage:v12 forceReplace:0 modifyError:0 modifyFlags:1 flagMask:0x400000000];

          uint64_t v12 = (void *)v20;
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            int v26 = 138412290;
            id v27 = v12;
            _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Updated message: %@", (uint8_t *)&v26, 0xCu);
          }
        }
        if ([(IMDServiceSession *)self isAwaitingStorageTimer])
        {
          uint64_t v22 = [v12 guid];
          [(IMDServiceSession *)self noteSuppressedMessageUpdate:v22];
        }
        else
        {
          uint64_t v22 = [(IMDServiceSession *)self broadcasterForChatListeners];
          id v24 = [v7 accountID];
          [v22 account:v24 chat:0 style:0 chatProperties:0 messageUpdated:v12];
        }
        id v25 = [v12 guid];
        sub_1D9812D2C(v25);

        goto LABEL_41;
      }
      if (![(IMDServiceSession *)self messageServiceNamed:v15 canProcessMessagesFromServiceNamed:v13])
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_41;
        }
        id v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v26 = 138412546;
          id v27 = v13;
          __int16 v28 = 2112;
          __int16 v29 = v15;
          _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Unable to mark message delivered quietly, message is on a different service: %@ vs %@", (uint8_t *)&v26, 0x16u);
        }
      }
      else
      {
LABEL_31:
        if (!IMOSLoggingEnabled())
        {
LABEL_41:

          goto LABEL_42;
        }
        id v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v26 = 138412290;
          id v27 = v6;
          _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Unable to mark message delivered quietly, no messages found for guid: %@", (uint8_t *)&v26, 0xCu);
        }
      }

      goto LABEL_41;
    }
  }
LABEL_42:
}

- (void)didSendNotifyRecipientCommandForMessageID:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didSendNotifyRecipientCommandForMessageID:v4 account:v5];
}

- (void)didSendNotifyRecipientCommandForMessageID:(id)a3 account:(id)a4
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v26 = 138412290;
      id v27 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_DEBUG, "message: %@", (uint8_t *)&v26, 0xCu);
    }
  }
  if (v6)
  {
    id v9 = [(IMDServiceSession *)self service];
    int v10 = [v9 supportsDatabase];

    if (v10)
    {
      if (!v7)
      {
        id v7 = [(IMDServiceSession *)self account];
      }
      id v11 = +[IMDMessageStore sharedInstance];
      uint64_t v12 = [v11 messageWithGUID:v6];

      id v13 = [v12 service];
      uint64_t v14 = [(IMDServiceSession *)self service];
      uint64_t v15 = [v14 internalName];

      if (!v12 || !v13 || !v15) {
        goto LABEL_31;
      }
      if ([(IMDServiceSession *)self messageServiceNamed:v15 canProcessMessagesFromServiceNamed:v13])
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            int v26 = 138412290;
            id v27 = v12;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Found old message for notify recipient command: %@", (uint8_t *)&v26, 0xCu);
          }
        }
        if (([v12 isFromMe] & 1) == 0 && (objc_msgSend(v12, "didNotifyRecipient") & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            unsigned __int8 v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              BOOL v18 = [v12 guid];
              int v26 = 138412290;
              id v27 = v18;
              _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Setting did notify recipient flag on local device for message: %@", (uint8_t *)&v26, 0xCu);
            }
          }
          objc_msgSend(v12, "setFlags:", objc_msgSend(v12, "flags") | 0x800000000);
          id v19 = +[IMDMessageStore sharedInstance];
          uint64_t v20 = [v19 storeMessage:v12 forceReplace:0 modifyError:0 modifyFlags:1 flagMask:0x800000000];

          uint64_t v12 = (void *)v20;
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            int v26 = 138412290;
            id v27 = v12;
            _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Updated message: %@", (uint8_t *)&v26, 0xCu);
          }
        }
        if ([(IMDServiceSession *)self isAwaitingStorageTimer])
        {
          uint64_t v22 = [v12 guid];
          [(IMDServiceSession *)self noteSuppressedMessageUpdate:v22];
        }
        else
        {
          uint64_t v22 = [(IMDServiceSession *)self broadcasterForChatListeners];
          id v24 = [v7 accountID];
          [v22 account:v24 chat:0 style:0 chatProperties:0 messageUpdated:v12];
        }
        id v25 = [v12 guid];
        sub_1D9812D2C(v25);

        goto LABEL_41;
      }
      if (![(IMDServiceSession *)self messageServiceNamed:v15 canProcessMessagesFromServiceNamed:v13])
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_41;
        }
        id v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v26 = 138412546;
          id v27 = v13;
          __int16 v28 = 2112;
          __int16 v29 = v15;
          _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Unable to mark message notified command, message is on a different service: %@ vs %@", (uint8_t *)&v26, 0x16u);
        }
      }
      else
      {
LABEL_31:
        if (!IMOSLoggingEnabled())
        {
LABEL_41:

          goto LABEL_42;
        }
        id v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          int v26 = 138412290;
          id v27 = v6;
          _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Unable to mark message notified command, no messages found for guid: %@", (uint8_t *)&v26, 0xCu);
        }
      }

      goto LABEL_41;
    }
  }
LABEL_42:
}

- (void)didSendMessagePlayedReceiptForMessageID:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didSendMessagePlayedReceiptForMessageID:v4 account:v5];
}

- (void)didSendMessagePlayedReceiptForMessageID:(id)a3 account:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v31 = 138412290;
      id v32 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_DEBUG, "message: %@", (uint8_t *)&v31, 0xCu);
    }
  }
  if (v6)
  {
    id v9 = [(IMDServiceSession *)self service];
    int v10 = [v9 supportsDatabase];

    if (v10)
    {
      if (!v7)
      {
        id v7 = [(IMDServiceSession *)self account];
      }
      id v11 = +[IMDMessageStore sharedInstance];
      uint64_t v12 = [v11 messageWithGUID:v6];

      id v13 = [v12 service];
      uint64_t v14 = [(IMDServiceSession *)self service];
      uint64_t v15 = [v14 internalName];

      if (!v12 || !v13 || !v15) {
        goto LABEL_25;
      }
      if ([(IMDServiceSession *)self messageServiceNamed:v15 canProcessMessagesFromServiceNamed:v13])
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            int v31 = 138412290;
            id v32 = v12;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Found old message for played receipt: %@", (uint8_t *)&v31, 0xCu);
          }
        }
        if ([v12 isExpirable]
          && ([v12 isFromMe] & 1) == 0
          && [v12 expireState] <= 0)
        {
          if (IMOSLoggingEnabled())
          {
            __int16 v29 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              uint64_t v30 = [v12 guid];
              int v31 = 138412290;
              id v32 = v30;
              _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Expire received message played on local device: %@", (uint8_t *)&v31, 0xCu);
            }
          }
          [v12 setExpireState:1];
          int v17 = 1;
        }
        else
        {
          int v17 = 0;
        }
        BOOL v18 = [v12 timePlayed];
        BOOL v19 = v18 == 0;

        if (v19)
        {
          objc_msgSend(v12, "setFlags:", objc_msgSend(v12, "flags") | 0x400000);
          uint64_t v21 = [MEMORY[0x1E4F1C9C8] date];
          [v12 setTimePlayed:v21];
        }
        else if (!v17)
        {
          goto LABEL_35;
        }
        uint64_t v22 = +[IMDMessageStore sharedInstance];
        uint64_t v23 = [v22 storeMessage:v12 forceReplace:0 modifyError:0 modifyFlags:1 flagMask:0x400000];

        uint64_t v12 = (void *)v23;
LABEL_35:
        if (IMOSLoggingEnabled())
        {
          id v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            int v31 = 138412290;
            id v32 = v12;
            _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Updated message: %@", (uint8_t *)&v31, 0xCu);
          }
        }
        if ([(IMDServiceSession *)self isAwaitingStorageTimer])
        {
          id v25 = [v12 guid];
          [(IMDServiceSession *)self noteSuppressedMessageUpdate:v25];
        }
        else
        {
          id v25 = [(IMDServiceSession *)self broadcasterForChatListeners];
          int v26 = [v7 accountID];
          [v25 account:v26 chat:0 style:0 chatProperties:0 messageUpdated:v12];
        }
        if (v17)
        {
          id v27 = [v12 guid];
          [(IMDServiceSession *)self _updateExpireStateForMessageGUID:v27];
        }
        __int16 v28 = [v12 guid];
        sub_1D9812D2C(v28);

        goto LABEL_45;
      }
      if (![(IMDServiceSession *)self messageServiceNamed:v15 canProcessMessagesFromServiceNamed:v13])
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_45;
        }
        uint64_t v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          int v31 = 138412546;
          id v32 = v13;
          __int16 v33 = 2112;
          long long v34 = v15;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Unable to mark send of played receipt, message is on a different service: %@ vs %@", (uint8_t *)&v31, 0x16u);
        }
      }
      else
      {
LABEL_25:
        if (!IMOSLoggingEnabled())
        {
LABEL_45:

          goto LABEL_46;
        }
        uint64_t v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          int v31 = 138412290;
          id v32 = v6;
          _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Unable to mark send of played receipt, no messages found for guid: %@", (uint8_t *)&v31, 0xCu);
        }
      }

      goto LABEL_45;
    }
  }
LABEL_46:
}

- (void)didSendMessageSavedReceiptForMessageID:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didSendMessageSavedReceiptForMessageID:v4 account:v5];
}

- (void)didSendMessageSavedReceiptForMessageID:(id)a3 account:(id)a4
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      int v24 = 138412290;
      id v25 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_DEBUG, "message: %@", (uint8_t *)&v24, 0xCu);
    }
  }
  if (v6)
  {
    id v9 = [(IMDServiceSession *)self service];
    int v10 = [v9 supportsDatabase];

    if (v10)
    {
      if (!v7)
      {
        id v7 = [(IMDServiceSession *)self account];
      }
      id v11 = +[IMDMessageStore sharedInstance];
      uint64_t v12 = [v11 messageWithGUID:v6];

      id v13 = [v12 service];
      uint64_t v14 = [(IMDServiceSession *)self service];
      uint64_t v15 = [v14 internalName];

      if (!v12 || !v13 || !v15) {
        goto LABEL_26;
      }
      if ([(IMDServiceSession *)self messageServiceNamed:v15 canProcessMessagesFromServiceNamed:v13])
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            int v24 = 138412290;
            id v25 = v12;
            _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Found old message for saved receipt: %@", (uint8_t *)&v24, 0xCu);
          }
        }
        if ([v12 expireState] != 3)
        {
          [v12 setExpireState:3];
          int v17 = +[IMDMessageStore sharedInstance];
          uint64_t v18 = [v17 storeMessage:v12 forceReplace:0 modifyError:0 modifyFlags:0 flagMask:0];

          uint64_t v12 = (void *)v18;
        }
        if (IMOSLoggingEnabled())
        {
          BOOL v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            int v24 = 138412290;
            id v25 = v12;
            _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Updated message: %@", (uint8_t *)&v24, 0xCu);
          }
        }
        if ([(IMDServiceSession *)self isAwaitingStorageTimer])
        {
          uint64_t v20 = [v12 guid];
          [(IMDServiceSession *)self noteSuppressedMessageUpdate:v20];
        }
        else
        {
          uint64_t v20 = [(IMDServiceSession *)self broadcasterForChatListeners];
          uint64_t v22 = [v7 accountID];
          [v20 account:v22 chat:0 style:0 chatProperties:0 messageUpdated:v12];
        }
        uint64_t v23 = [v12 guid];
        sub_1D9812D2C(v23);

        goto LABEL_36;
      }
      if (![(IMDServiceSession *)self messageServiceNamed:v15 canProcessMessagesFromServiceNamed:v13])
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_36;
        }
        uint64_t v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v24 = 138412546;
          id v25 = v13;
          __int16 v26 = 2112;
          id v27 = v15;
          _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Unable to mark send of saved receipt, message is on a different service: %@ vs %@", (uint8_t *)&v24, 0x16u);
        }
      }
      else
      {
LABEL_26:
        if (!IMOSLoggingEnabled())
        {
LABEL_36:

          goto LABEL_37;
        }
        uint64_t v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          int v24 = 138412290;
          id v25 = v6;
          _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Unable to mark send of saved receipt, no messages found for guid: %@", (uint8_t *)&v24, 0xCu);
        }
      }

      goto LABEL_36;
    }
  }
LABEL_37:
}

- (void)didSendSyndicationActionItem:(id)a3 forChat:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    uint64_t v8 = [(IMDServiceSession *)self service];
    int v9 = [v8 supportsDatabase];

    if (v9)
    {
      if (!v7)
      {
        id v13 = IMLogHandleForCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR)) {
          sub_1D9904C78();
        }
        goto LABEL_32;
      }
      if (IMOSLoggingEnabled())
      {
        int v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = [v7 guid];
          int v32 = 138412546;
          id v33 = v6;
          __int16 v34 = 2112;
          uint64_t v35 = v11;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Received didSendSyndicationAction: %@ for Chat: %@", (uint8_t *)&v32, 0x16u);
        }
      }
      int v12 = [v6 syndicatedItemType];
      if (v12 == 2)
      {
        id v13 = v6;
        int v24 = [v7 updateDonationStateWithSyndicationAction:v13];
        if (IMOSLoggingEnabled())
        {
          id v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            int v26 = [v13 isAutoDonatingMessages];
            uint64_t v27 = [v13 chatGUID];
            uint64_t v28 = (void *)v27;
            __int16 v29 = @"NO";
            if (v24) {
              uint64_t v30 = @"YES";
            }
            else {
              uint64_t v30 = @"NO";
            }
            int v32 = 138412802;
            if (v26) {
              __int16 v29 = @"YES";
            }
            id v33 = v29;
            __int16 v34 = 2112;
            uint64_t v35 = v30;
            __int16 v36 = 2112;
            uint64_t v37 = v27;
            _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Updated syndication state to: %@ was successful: %@ for chat with GUID: %@", (uint8_t *)&v32, 0x20u);
          }
        }
        goto LABEL_32;
      }
      if (v12 == 1)
      {
        id v13 = v6;
        uint64_t v14 = +[IMDMessageStore sharedInstance];
        uint64_t v15 = [v14 updateSyndicatedMessageWithSyndicationMessageAction:v13];

        int v16 = IMOSLoggingEnabled();
        if (v15)
        {
          if (v16)
          {
            int v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              uint64_t v18 = [v13 messagePartGUID];
              int v32 = 138412546;
              id v33 = v18;
              __int16 v34 = 2112;
              uint64_t v35 = v13;
              _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Updated message: %@ with action item: %@", (uint8_t *)&v32, 0x16u);
            }
          }
          BOOL v19 = [(IMDServiceSession *)self broadcasterForChatListeners];
          uint64_t v20 = [v7 accountID];
          uint64_t v21 = [v7 chatIdentifier];
          uint64_t v22 = [v7 style];
          uint64_t v23 = [v7 properties];
          [v19 account:v20 chat:v21 style:v22 chatProperties:v23 messageUpdated:v15];
        }
        else if (v16)
        {
          int v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            int v32 = 138412290;
            id v33 = v13;
            _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Message not update updated for SyndicationAction - doing nothing with syndication action: %@", (uint8_t *)&v32, 0xCu);
          }
        }
LABEL_32:
      }
    }
  }
}

- (BOOL)didReceiveMessageDeliveryReceiptForMessageID:(id)a3 date:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  uint64_t v8 = [(IMDServiceSession *)self account];
  LOBYTE(self) = [(IMDServiceSession *)self _didReceiveMessageDeliveryReceiptForMessageID:v7 attempts:0 date:v6 account:v8];

  return (char)self;
}

- (BOOL)didReceiveMessageDeliveryReceiptForMessageID:(id)a3 date:(id)a4 account:(id)a5
{
  return [(IMDServiceSession *)self _didReceiveMessageDeliveryReceiptForMessageID:a3 attempts:0 date:a4 account:a5];
}

- (BOOL)_didReceiveMessageDeliveryReceiptForMessageID:(id)a3 attempts:(int64_t)a4 date:(id)a5 account:(id)a6
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v10;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_DEBUG, "message: %@", buf, 0xCu);
    }
  }
  if (v10
    && ([(IMDServiceSession *)self service],
        uint64_t v14 = objc_claimAutoreleasedReturnValue(),
        int v15 = [v14 supportsDatabase],
        v14,
        v15))
  {
    aBlock[0] = MEMORY[0x1E4F143A8];
    aBlock[1] = 3221225472;
    aBlock[2] = sub_1D9816600;
    aBlock[3] = &unk_1E6B77570;
    id v16 = v10;
    id v33 = v16;
    __int16 v34 = self;
    id v27 = v11;
    id v35 = v27;
    id v17 = v12;
    id v36 = v17;
    uint64_t v28 = (uint64_t (**)(void))_Block_copy(aBlock);
    uint64_t v18 = +[IMDMessageStore sharedInstance];
    int v19 = [v18 hasStoredMessageWithGUID:v16];

    if (v19)
    {
      char v20 = v28[2]();
    }
    else
    {
      int v21 = IMOSLoggingEnabled();
      if (a4 >= 6)
      {
        if (v21)
        {
          int v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v16;
            _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "No message ever found for guid: %@ to mark as read, bailing", buf, 0xCu);
          }
        }
      }
      else
      {
        if (v21)
        {
          uint64_t v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v38 = v16;
            _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "No message found for guid: %@ to mark as delivered, trying again in a bit", buf, 0xCu);
          }
        }
        if (a4 == 5)
        {
          if (IMOSLoggingEnabled())
          {
            id v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Last try, waiting a lot longer", buf, 2u);
            }
          }
        }
        else if (a4 == 4 && IMOSLoggingEnabled())
        {
          uint64_t v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Second to last try, waiting longer", buf, 2u);
          }
        }
        id v29 = v16;
        id v30 = v27;
        id v31 = v17;
        im_dispatch_after();
      }
      char v20 = 0;
    }
  }
  else
  {
    char v20 = 0;
  }

  return v20;
}

- (void)_handleScheduledMessageFailure:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDMessageStore sharedInstance];
  id v5 = [v3 guid];
  id v6 = [v4 messageWithGUID:v5];

  if ([v6 scheduleType] == 2)
  {
    uint64_t v7 = [v6 scheduleState];
    switch(v7)
    {
      case 3:
        objc_msgSend(v3, "setScheduleType:", objc_msgSend(v6, "scheduleType"));
        objc_msgSend(v3, "setScheduleState:", objc_msgSend(v6, "scheduleState"));
        id v10 = [v6 messageSummaryInfo];
        [v3 setMessageSummaryInfo:v10];

        id v11 = [v6 body];
        [v3 setBody:v11];

        objc_msgSend(v3, "setErrorCode:", objc_msgSend(v6, "errorCode"));
        break;
      case 2:
        [v3 setErrorCode:0];
        id v12 = [v3 editedPartIndexes];
        [v3 setFailedEditPartIndexes:v12];

        id v13 = [v3 retractedPartIndexes];
        [v3 setFailedRetractPartIndexes:v13];

        uint64_t v14 = [v3 retractedPartIndexes];
        v19[0] = MEMORY[0x1E4F143A8];
        v19[1] = 3221225472;
        v19[2] = sub_1D981720C;
        v19[3] = &unk_1E6B775C0;
        id v15 = v3;
        id v20 = v15;
        [v14 enumerateIndexesUsingBlock:v19];

        id v16 = [v15 retractedPartIndexes];
        uint64_t v17 = [v16 count];

        if (v17)
        {
          uint64_t v18 = [v15 scheduledMessageOriginalTransferGUIDs];
          [v15 setFileTransferGUIDs:v18];
        }
        break;
      case 1:
        [v3 setScheduleState:4];
        uint64_t v8 = [v3 guid];
        +[IMDScheduledMessageCoordinator notifyPeersWithScheduledMessageUpdate:v8 scheduleState:4];

        break;
    }
  }
  else
  {
    objc_msgSend(v3, "setScheduleType:", objc_msgSend(v6, "scheduleType"));
    objc_msgSend(v3, "setScheduleState:", objc_msgSend(v6, "scheduleState"));
    objc_msgSend(v3, "setErrorCode:", objc_msgSend(v6, "errorCode"));
    int v9 = [v6 messageSummaryInfo];
    [v3 setMessageSummaryInfo:v9];
  }
}

- (void)updateChatGUID:(id)a3 withLastReadTimeStamp:(int64_t)a4 withLastSeenMessageGUID:(id)a5 fromMe:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v21 = a3;
  id v9 = a5;
  id v10 = +[IMDMessageStore sharedInstance];
  id v11 = [v10 chatsForMessageGUID:v21];

  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v28 = v11;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Found chats to mark as read: %@", buf, 0xCu);
    }
  }
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  id v13 = v11;
  uint64_t v14 = [(__CFString *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v24;
    id v16 = @"NO";
    if (v6) {
      id v16 = @"YES";
    }
    uint64_t v22 = v16;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v24 != v15) {
          objc_enumerationMutation(v13);
        }
        uint64_t v18 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          int v19 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            uint64_t v28 = v22;
            __int16 v29 = 2112;
            id v30 = v18;
            _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Updating local chat (fromMe: %@): %@", buf, 0x16u);
          }
        }
        if (v6)
        {
          [v18 updateLastReadMessageTimeStampIfNeeded:a4];
          [v18 updateLastSeenMessageGuidIfNeeded:v9];
        }
        id v20 = +[IMDChatRegistry sharedInstance];
        [v20 updateStateForChat:v18 hintMessage:0 shouldRebuildFailedMessageDate:0 shouldCalculateUnreadCount:v6];
      }
      uint64_t v14 = [(__CFString *)v13 countByEnumeratingWithState:&v23 objects:v31 count:16];
    }
    while (v14);
  }
}

- (void)_didReceiveMessageReadForMessageID:(id)a3 date:(id)a4 attempts:(int64_t)a5 completionBlock:(id)a6
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(void))a6;
  id v13 = v12;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v10;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
      }
    }
    if (v10
      && ([(IMDServiceSession *)self service],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v15 supportsDatabase],
          v15,
          (v16 & 1) != 0))
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1D9817BF8;
      aBlock[3] = &unk_1E6B731A0;
      id v17 = v10;
      id v41 = v17;
      long long v42 = self;
      id v35 = v11;
      id v43 = v35;
      uint64_t v18 = v13;
      id v44 = v18;
      uint64_t v37 = (void (**)(void))_Block_copy(aBlock);
      int v19 = +[IMDMessageStore sharedInstance];
      int v20 = [v19 hasStoredMessageWithGUID:v17];

      if (v20)
      {
        v37[2](v37);
      }
      else
      {
        int v22 = IMOSLoggingEnabled();
        if (a5 >= 6)
        {
          if (v22)
          {
            long long v26 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v46 = v17;
              _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "No message ever found for guid: %@ to mark as read, bailing", buf, 0xCu);
            }
          }
          id v27 = [(IMDServiceSession *)self _IDSService];
          [v27 _IMDTrackMetric:10401 ForMessageGUID:v17];
        }
        else
        {
          if (v22)
          {
            long long v23 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v46 = v17;
              _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "No message found for guid: %@ to mark as read, trying again in a bit", buf, 0xCu);
            }
          }
          long long v24 = [(IMDServiceSession *)self _IDSService];
          [v24 _IMDTrackMetric:10401 ForMessageGUID:v17];

          if (a5 == 5)
          {
            if (IMOSLoggingEnabled())
            {
              uint64_t v28 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Last try, waiting a lot longer", buf, 2u);
              }
            }
          }
          else if (a5 == 4 && IMOSLoggingEnabled())
          {
            long long v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Second to last try, waiting longer", buf, 2u);
            }
          }
          id v38 = v17;
          id v39 = v36;
          im_dispatch_after();
        }
        if (v18) {
          v18[2](v18);
        }
      }
    }
    else
    {
      if (v13) {
        v13[2](v13);
      }
      if (IMOSLoggingEnabled())
      {
        __int16 v29 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          id v30 = [(IMDServiceSession *)self service];
          int v31 = [v30 supportsDatabase];
          uint64_t v32 = [(IMDServiceSession *)self service];
          id v33 = (void *)v32;
          __int16 v34 = @"NO";
          *(_DWORD *)buf = 138412802;
          id v46 = v10;
          __int16 v47 = 2112;
          if (v31) {
            __int16 v34 = @"YES";
          }
          id v48 = v34;
          __int16 v49 = 2112;
          uint64_t v50 = v32;
          _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Returning early in _didReceiveMessageReadForMessageID because messageID: %@, [[self service] supportsDatabase]: %@, service: %@", buf, 0x20u);
        }
      }
    }
  }
  else
  {
    if (v12) {
      v12[2](v12);
    }
    if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Returning early in _didReceiveMessageReadForMessageID because !_activated", buf, 2u);
      }
    }
  }
}

- (void)didReceiveMessageReadForMessageID:(id)a3 date:(id)a4 completionBlock:(id)a5
{
}

- (void)_didReceiveMessageReadReceiptForMessageID:(id)a3 date:(id)a4 attempts:(int64_t)a5 completionBlock:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(void))a6;
  id v13 = v12;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v10;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
      }
    }
    if (v10
      && ([(IMDServiceSession *)self service],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v15 supportsDatabase],
          v15,
          (v16 & 1) != 0))
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1D9818B88;
      aBlock[3] = &unk_1E6B731A0;
      id v17 = v10;
      id v31 = v17;
      uint64_t v32 = self;
      id v26 = v11;
      id v33 = v26;
      uint64_t v18 = v13;
      id v34 = v18;
      id v27 = (void (**)(void))_Block_copy(aBlock);
      int v19 = +[IMDMessageStore sharedInstance];
      int v20 = [v19 hasStoredMessageWithGUID:v17];

      if (v20)
      {
        v27[2](v27);
      }
      else
      {
        int v21 = IMOSLoggingEnabled();
        if (a5 >= 6)
        {
          if (v21)
          {
            long long v24 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v17;
              _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "No message ever found for guid: %@ to mark as read, bailing", buf, 0xCu);
            }
          }
        }
        else
        {
          if (v21)
          {
            int v22 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v17;
              _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "No message found for guid: %@ to mark as read, trying again in a bit", buf, 0xCu);
            }
          }
          if (a5 == 5)
          {
            if (IMOSLoggingEnabled())
            {
              long long v25 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Last try, waiting a lot longer", buf, 2u);
              }
            }
          }
          else if (a5 == 4 && IMOSLoggingEnabled())
          {
            long long v23 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Second to last try, waiting longer", buf, 2u);
            }
          }
          id v28 = v17;
          id v29 = v26;
          im_dispatch_after();
        }
        if (v18) {
          v18[2](v18);
        }
      }
    }
    else if (v13)
    {
      v13[2](v13);
    }
  }
  else if (v12)
  {
    v12[2](v12);
  }
}

- (void)didReceiveMessageReadReceiptForMessageID:(id)a3 date:(id)a4 completionBlock:(id)a5
{
  id v11 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = v9;
  if (self->_activated)
  {
    [(IMDServiceSession *)self _didReceiveMessageReadReceiptForMessageID:v11 date:v8 attempts:0 completionBlock:v9];
  }
  else if (v9)
  {
    (*((void (**)(id))v9 + 2))(v9);
  }
}

- (void)_didReceiveMessagePlayedForMessageID:(id)a3 date:(id)a4 attempts:(int64_t)a5 completionBlock:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(void))a6;
  id v13 = v12;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v10;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
      }
    }
    if (v10
      && ([(IMDServiceSession *)self service],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v15 supportsDatabase],
          v15,
          (v16 & 1) != 0))
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1D9819598;
      aBlock[3] = &unk_1E6B731A0;
      id v17 = v10;
      id v31 = v17;
      uint64_t v32 = self;
      id v26 = v11;
      id v33 = v26;
      uint64_t v18 = v13;
      id v34 = v18;
      id v27 = (void (**)(void))_Block_copy(aBlock);
      int v19 = +[IMDMessageStore sharedInstance];
      int v20 = [v19 hasStoredMessageWithGUID:v17];

      if (v20)
      {
        v27[2](v27);
      }
      else
      {
        int v21 = IMOSLoggingEnabled();
        if (a5 >= 6)
        {
          if (v21)
          {
            long long v24 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v17;
              _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "No message ever found for guid: %@ to mark as played, bailing", buf, 0xCu);
            }
          }
        }
        else
        {
          if (v21)
          {
            int v22 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v17;
              _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "No message found for guid: %@ to mark as played, trying again in a bit", buf, 0xCu);
            }
          }
          if (a5 == 5)
          {
            if (IMOSLoggingEnabled())
            {
              long long v25 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Last try, waiting a lot longer", buf, 2u);
              }
            }
          }
          else if (a5 == 4 && IMOSLoggingEnabled())
          {
            long long v23 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Second to last try, waiting longer", buf, 2u);
            }
          }
          id v28 = v17;
          id v29 = v26;
          im_dispatch_after();
        }
        if (v18) {
          v18[2](v18);
        }
      }
    }
    else if (v13)
    {
      v13[2](v13);
    }
  }
  else if (v12)
  {
    v12[2](v12);
  }
}

- (void)didReceiveMessagePlayedForMessageID:(id)a3 date:(id)a4 completionBlock:(id)a5
{
}

- (void)_didReceiveMessagePlayedReceiptForMessageID:(id)a3 date:(id)a4 attempts:(int64_t)a5 completionBlock:(id)a6
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = (void (**)(void))a6;
  id v13 = v12;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v36 = v10;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
      }
    }
    if (v10
      && ([(IMDServiceSession *)self service],
          uint64_t v15 = objc_claimAutoreleasedReturnValue(),
          char v16 = [v15 supportsDatabase],
          v15,
          (v16 & 1) != 0))
    {
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1D981A598;
      aBlock[3] = &unk_1E6B731A0;
      id v17 = v10;
      id v31 = v17;
      uint64_t v32 = self;
      id v26 = v11;
      id v33 = v26;
      uint64_t v18 = v13;
      id v34 = v18;
      id v27 = (void (**)(void))_Block_copy(aBlock);
      int v19 = +[IMDMessageStore sharedInstance];
      int v20 = [v19 hasStoredMessageWithGUID:v17];

      if (v20)
      {
        v27[2](v27);
      }
      else
      {
        int v21 = IMOSLoggingEnabled();
        if (a5 >= 6)
        {
          if (v21)
          {
            long long v24 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v17;
              _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "No message ever found for guid: %@ to mark as played, bailing", buf, 0xCu);
            }
          }
        }
        else
        {
          if (v21)
          {
            int v22 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v36 = v17;
              _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "No message found for guid: %@ to mark as played, trying again in a bit", buf, 0xCu);
            }
          }
          if (a5 == 5)
          {
            if (IMOSLoggingEnabled())
            {
              long long v25 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Last try, waiting a lot longer", buf, 2u);
              }
            }
          }
          else if (a5 == 4 && IMOSLoggingEnabled())
          {
            long long v23 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Second to last try, waiting longer", buf, 2u);
            }
          }
          id v28 = v17;
          id v29 = v26;
          im_dispatch_after();
        }
        if (v18) {
          v18[2](v18);
        }
      }
    }
    else if (v13)
    {
      v13[2](v13);
    }
  }
  else if (v12)
  {
    v12[2](v12);
  }
}

- (void)didReceiveMessagePlayedReceiptForMessageID:(id)a3 date:(id)a4 completionBlock:(id)a5
{
  if (self->_activated) {
    MEMORY[0x1F4181798](self, sel__didReceiveMessagePlayedReceiptForMessageID_date_attempts_completionBlock_);
  }
}

- (void)_didReceiveMessageSavedForMessageID:(id)a3 ofType:(int64_t)a4 forChat:(id)a5 fromHandle:(id)a6 fromMe:(BOOL)a7 date:(id)a8 attempts:(int64_t)a9 account:(id)a10 completionBlock:(id)a11
{
  BOOL v46 = a7;
  uint64_t v73 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v47 = a5;
  id v49 = a6;
  id v48 = a8;
  id v50 = a10;
  char v16 = (void (**)(void))a11;
  id v17 = v16;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v72 = v15;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
      }
    }
    if (v15
      && ([(IMDServiceSession *)self service],
          int v19 = objc_claimAutoreleasedReturnValue(),
          char v20 = [v19 supportsDatabase],
          v19,
          (v20 & 1) != 0))
    {
      if (!v50)
      {
        id v50 = [(IMDServiceSession *)self account];
      }
      int v21 = [v49 _stripFZIDPrefix];
      BOOL v22 = v46;
      if (!v46)
      {
        long long v23 = +[IMDMessageStore sharedInstance];
        long long v24 = [v23 messageActionItemsForOriginalMessageGUID:v15];

        long long v68 = 0u;
        long long v69 = 0u;
        long long v66 = 0u;
        long long v67 = 0u;
        id v25 = v24;
        uint64_t v26 = [v25 countByEnumeratingWithState:&v66 objects:v70 count:16];
        if (v26)
        {
          uint64_t v27 = *(void *)v67;
          while (2)
          {
            for (uint64_t i = 0; i != v26; ++i)
            {
              if (*(void *)v67 != v27) {
                objc_enumerationMutation(v25);
              }
              id v29 = [*(id *)(*((void *)&v66 + 1) + 8 * i) sender];
              char v30 = [v29 isEqualToString:v21];

              if (v30)
              {

                if (IMOSLoggingEnabled())
                {
                  id v39 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_1D967A000, v39, OS_LOG_TYPE_INFO, "   Message was already marked as saved, ignoring", buf, 2u);
                  }
                }
                if (v17) {
                  v17[2](v17);
                }
                goto LABEL_54;
              }
            }
            uint64_t v26 = [v25 countByEnumeratingWithState:&v66 objects:v70 count:16];
            if (v26) {
              continue;
            }
            break;
          }
        }

        BOOL v22 = v46;
      }
      aBlock[0] = MEMORY[0x1E4F143A8];
      aBlock[1] = 3221225472;
      aBlock[2] = sub_1D981B170;
      aBlock[3] = &unk_1E6B77610;
      id v31 = v15;
      BOOL v65 = v22;
      id v57 = v31;
      id v58 = self;
      id v42 = v47;
      id v59 = v42;
      id v60 = v21;
      id v44 = v48;
      id v61 = v44;
      int64_t v64 = a4;
      id v43 = v50;
      id v62 = v43;
      uint64_t v32 = v17;
      id v63 = v32;
      id v33 = (void (**)(void))_Block_copy(aBlock);
      id v34 = +[IMDMessageStore sharedInstance];
      int v35 = [v34 hasStoredMessageWithGUID:v31];

      if (v35 | !v46)
      {
        v33[2](v33);
      }
      else
      {
        int v36 = IMOSLoggingEnabled();
        if (a9 >= 6)
        {
          if (v36)
          {
            long long v40 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v72 = v31;
              _os_log_impl(&dword_1D967A000, v40, OS_LOG_TYPE_INFO, "No message ever found for guid: %@ to mark as saved, bailing", buf, 0xCu);
            }
          }
        }
        else
        {
          if (v36)
          {
            uint64_t v37 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v72 = v31;
              _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_INFO, "No message found for guid: %@ to mark as saved, trying again in a bit", buf, 0xCu);
            }
          }
          if (a9 == 5)
          {
            if (IMOSLoggingEnabled())
            {
              id v41 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v41, OS_LOG_TYPE_INFO, "Last try, waiting a lot longer", buf, 2u);
              }
            }
          }
          else if (a9 == 4 && IMOSLoggingEnabled())
          {
            id v38 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v38, OS_LOG_TYPE_INFO, "Second to last try, waiting longer", buf, 2u);
            }
          }
          id v51 = v31;
          id v52 = v42;
          id v53 = v49;
          id v54 = v44;
          id v55 = v43;
          im_dispatch_after();
        }
        if (v32) {
          v32[2](v32);
        }
      }

LABEL_54:
    }
    else if (v17)
    {
      v17[2](v17);
    }
  }
  else if (v16)
  {
    v16[2](v16);
  }
}

- (void)didReceiveMessageSavedForMessageID:(id)a3 ofType:(int64_t)a4 forChat:(id)a5 fromHandle:(id)a6 fromMe:(BOOL)a7 date:(id)a8 account:(id)a9 completionBlock:(id)a10
{
}

- (void)didStartSendingMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v8 = a4;
  id v9 = a3;
  id v10 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didStartSendingMessage:v9 forChat:v8 style:v5 account:v10];
}

- (void)didStartSendingMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  unsigned __int8 v49 = a5;
  id v12 = a6;
  id v13 = v12;
  if (!self->_activated) {
    goto LABEL_65;
  }
  if (!v12)
  {
    id v13 = [(IMDServiceSession *)self account];
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v51 = v10;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
    }
  }
  if (!v10)
  {
LABEL_65:
    id v15 = v11;
    goto LABEL_66;
  }
  id v48 = v11;
  [(IMDServiceSession *)self _mapRoomChatToGroupChat:&v48 style:&v49];
  id v15 = v48;

  char v16 = [(IMDServiceSession *)self service];
  int v47 = [v16 supportsDatabase];

  int v46 = [v10 isTypingMessage];
  int v45 = [v10 isSuggestedActionResponse];
  int v17 = [v10 errorCode];
  if (v47)
  {
    uint64_t v18 = +[IMDMessageStore sharedInstance];
    int v19 = [v10 guid];
    char v20 = [v18 messageWithGUID:v19];
  }
  else
  {
    char v20 = 0;
  }
  if (v20) {
    int v21 = v20;
  }
  else {
    int v21 = v10;
  }
  id v22 = v21;
  if (![(IMDServiceSession *)self isReplicating]
    || ![(IMDServiceSession *)self _canUpgradeExistingMessageItem:v20 replacementReplicatedMessageItem:v10])
  {
    goto LABEL_22;
  }
  long long v23 = +[IMDMessageStore sharedInstance];
  long long v24 = [v20 guid];
  char v25 = [v23 wasMessageDeduplicatedWithGUID:v24];

  int v26 = IMOSLoggingEnabled();
  if (v25)
  {
    if (v26)
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        id v28 = [v10 guid];
        *(_DWORD *)buf = 138412290;
        id v51 = v28;
        _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Replicated message %@ is permitted to upgrade but existing message was already marked as deduplicated", buf, 0xCu);
      }
    }
LABEL_22:
    id v29 = v22;
    goto LABEL_23;
  }
  if (v26)
  {
    uint64_t v37 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      id v38 = [v10 guid];
      *(_DWORD *)buf = 138412290;
      id v51 = v38;
      _os_log_impl(&dword_1D967A000, v37, OS_LOG_TYPE_INFO, "Replicated message %@ is permitted to upgrade", buf, 0xCu);
    }
  }
  id v29 = v10;

  id v39 = +[IMDMessageStore sharedInstance];
  [v39 markMessageAsDeduplicated:v29];

LABEL_23:
  if (!v17 && v20 && [v20 isFinished] && (objc_msgSend(v10, "isFinished") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      char v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        int v36 = [v10 guid];
        *(_DWORD *)buf = 138412290;
        id v51 = v36;
        _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Not notifying for message: %@   this is a typing indicator, and we've already stored a completed message", buf, 0xCu);
      }
      goto LABEL_48;
    }
  }
  else if ([v10 isSuggestedActionResponse])
  {
    if (IMOSLoggingEnabled())
    {
      char v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "[didStartSendingMessage] Not notifying for suggested action response.", buf, 2u);
      }
LABEL_48:
    }
  }
  else
  {
    if (!v17 || ![v10 isTypingMessage])
    {
      objc_msgSend(v29, "setErrorCode:", objc_msgSend(v10, "errorCode"));
      if ((v20 != 0) | (v46 ^ 1) & 1 || v45 != 1) && (v47)
      {
        uint64_t v32 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
        int v33 = [v32 isScheduledMessagesCoreEnabled];

        BOOL v34 = v33 && [v20 scheduleType] == 2 && objc_msgSend(v20, "scheduleState") != 0;
        long long v40 = +[IMDMessageStore sharedInstance];
        objc_msgSend(v40, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:", v29, v34, -[IMDServiceSession _shouldBroadcastSendFailures](self, "_shouldBroadcastSendFailures"), 1, 12);
        id v35 = (id)objc_claimAutoreleasedReturnValue();
      }
      else
      {
        id v35 = v29;
      }
      if ([v10 isBeingRetried]) {
        [v35 setIsBeingRetried:1];
      }
      id v41 = [v10 retryToParticipant];

      if (v41)
      {
        id v42 = [v10 retryToParticipant];
        [v35 setRetryToParticipant:v42];
      }
      id v43 = [(IMDServiceSession *)self chatForChatIdentifier:v15 style:v49 account:v13];
      if ((v46 & ~(v20 != 0) & v45 & 1) == 0 && ((v47 ^ 1) & 1) == 0)
      {
        id v44 = +[IMDChatRegistry sharedInstance];
        objc_msgSend(v44, "addMessage:toChat:deferSpotlightIndexing:", v10, v43, -[IMDServiceSession isAwaitingStorageTimer](self, "isAwaitingStorageTimer"));
      }
      goto LABEL_64;
    }
    if (IMOSLoggingEnabled())
    {
      char v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        id v31 = [v10 guid];
        *(_DWORD *)buf = 138412290;
        id v51 = v31;
        _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Not notifying for message: %@   this is a typing indicator, and it failed", buf, 0xCu);
      }
      goto LABEL_48;
    }
  }
LABEL_64:

LABEL_66:
}

- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5
{
}

- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 forceDate:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didSendMessage:v12 forChat:v11 style:v6 account:v13 forceDate:v10];
}

- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 forceDate:(id)a7
{
}

- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 forceDate:(id)a7 itemIsComingFromStorage:(BOOL)a8
{
  BOOL v139 = a8;
  uint64_t v165 = *MEMORY[0x1E4F143B8];
  __int16 v143 = (__CFString *)a3;
  id v13 = a4;
  unsigned __int8 v157 = a5;
  id v14 = a6;
  int v140 = (__CFString *)a7;
  if (self->_activated)
  {
    if (!v14)
    {
      id v14 = [(IMDServiceSession *)self account];
    }
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v162 = v143;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
      }
    }
    v142 = v14;
    if (v143)
    {
      id v156 = v13;
      [(IMDServiceSession *)self _mapRoomChatToGroupChat:&v156 style:&v157];
      id v141 = v156;

      char v16 = [(IMDServiceSession *)self service];
      int v135 = [v16 supportsDatabase];

      int v17 = [(__CFString *)v143 isTypingMessage];
      int v130 = [(__CFString *)v143 isSuggestedActionResponse];
      int v18 = [(__CFString *)v143 errorCode];
      uint64_t v132 = [(__CFString *)v143 flags];
      if (v135)
      {
        int v19 = +[IMDMessageStore sharedInstance];
        char v20 = [(__CFString *)v143 guid];
        int v21 = [v19 messageWithGUID:v20];
      }
      else
      {
        int v21 = 0;
      }
      id v22 = v143;
      id v138 = v21;
      if (v21) {
        id v22 = v21;
      }
      long long v23 = v22;
      if ([(IMDServiceSession *)self isReplicating]
        && [(IMDServiceSession *)self _canUpgradeExistingMessageItem:v21 replacementReplicatedMessageItem:v143])
      {
        long long v24 = +[IMDMessageStore sharedInstance];
        char v25 = [(__CFString *)v21 guid];
        char v26 = [v24 wasMessageDeduplicatedWithGUID:v25];

        int v27 = IMOSLoggingEnabled();
        if ((v26 & 1) == 0)
        {
          if (v27)
          {
            unsigned __int8 v49 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
            {
              id v50 = [(__CFString *)v143 guid];
              *(_DWORD *)buf = 138412290;
              v162 = v50;
              _os_log_impl(&dword_1D967A000, v49, OS_LOG_TYPE_INFO, "Replicated message %@ is permitted to upgrade", buf, 0xCu);
            }
          }
          char v30 = v143;

          id v51 = +[IMDMessageStore sharedInstance];
          [v51 markMessageAsDeduplicated:v30];

LABEL_24:
          id v31 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
          int v32 = [v31 isScheduledMessagesCoreEnabled];

          if (v32
            && [(__CFString *)v21 scheduleType] == 2
            && [(__CFString *)v21 scheduleState])
          {
            v137 = v143;

            int v33 = [(__CFString *)v21 cloudKitRecordID];
            if (v33)
            {
              BOOL v34 = [(__CFString *)v137 scheduleType] == 2;

              if (!v34)
              {
                [(__CFString *)v137 setCloudKitSyncState:0];
                id v35 = [MEMORY[0x1E4F6BF48] synchronousDatabase];
                int v36 = [(__CFString *)v138 guid];
                uint64_t v37 = [(__CFString *)v138 cloudKitRecordID];
                [v35 addScheduledMessageGUIDandCKRecordToDeleteFromCloudKit:v36 recordID:v37];
              }
            }
          }
          else
          {
            v137 = v30;
          }
          if (!v18
            && v138
            && [(__CFString *)v138 isFinished]
            && ([(__CFString *)v143 isFinished] & 1) == 0)
          {
            if (!IMOSLoggingEnabled()) {
              goto LABEL_188;
            }
            id v39 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              uint64_t v52 = [(__CFString *)v143 guid];
              *(_DWORD *)buf = 138412290;
              v162 = v52;
              _os_log_impl(&dword_1D967A000, v39, OS_LOG_TYPE_INFO, "Not notifying for message: %@   this is a typing indicator, and we've already stored a completed message", buf, 0xCu);
            }
            goto LABEL_45;
          }
          if ([(__CFString *)v143 isSuggestedActionResponse])
          {
            if (IMOSLoggingEnabled())
            {
              id v38 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_1D967A000, v38, OS_LOG_TYPE_INFO, "[didSendMessage] Not notifying for suggested action response.", buf, 2u);
              }
            }
            goto LABEL_188;
          }
          if (v18 && [(__CFString *)v143 isTypingMessage])
          {
            if (!IMOSLoggingEnabled())
            {
LABEL_188:

              goto LABEL_189;
            }
            id v39 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              long long v40 = [(__CFString *)v143 guid];
              *(_DWORD *)buf = 138412290;
              v162 = v40;
              _os_log_impl(&dword_1D967A000, v39, OS_LOG_TYPE_INFO, "Not notifying for message: %@   this is a typing indicator, and it failed", buf, 0xCu);
            }
LABEL_45:

            goto LABEL_188;
          }
          id v129 = [(__CFString *)v137 time];
          id v127 = [MEMORY[0x1E4F1C9C8] date];
          if (v129)
          {
            [v127 timeIntervalSinceDate:v129];
            double v42 = v41;
            if (v41 > 0.0)
            {
              id v43 = [MEMORY[0x1E4F6E890] sharedInstance];
              id v44 = [NSNumber numberWithDouble:v42];
              [v43 trackEvent:*MEMORY[0x1E4F6DD88] withStatistic:v44];
            }
          }
          if (([(__CFString *)v137 flags] & 0x8000) == 0)
          {
            int v45 = [(IMDServiceSession *)self service];
            int v46 = [v45 internalName];
            int v47 = [v46 isEqualToString:*MEMORY[0x1E4F6E1A0]];

            if (v47) {
              [(__CFString *)v137 setTime:v127];
            }
          }
          [(IMDServiceSession *)self _configureSessionInformationOnItem:v137 toChat:v141 withStyle:v157 forAccount:v142];
          if (v18)
          {
            uint64_t v48 = 4;
          }
          else if ([(IMDServiceSession *)self isReplicating])
          {
            uint64_t v48 = 4;
          }
          else
          {
            uint64_t v48 = 32772;
          }
          [(__CFString *)v137 setFlags:[(__CFString *)v137 flags] | v48];
          if ((v132 & 0x80000000000) != 0) {
            [(__CFString *)v137 setFlags:[(__CFString *)v137 flags] | v132 & 0x80000000000];
          }
          if (!v18
            && [(__CFString *)v137 isExpirable]
            && [(__CFString *)v137 isFromMe]
            && [(__CFString *)v137 expireState] <= 0)
          {
            int ShouldAutomaticallySave = IMMessageItemShouldAutomaticallySave();
            int v73 = IMOSLoggingEnabled();
            if (ShouldAutomaticallySave)
            {
              if (v73)
              {
                uint64_t v74 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v74, OS_LOG_TYPE_INFO))
                {
                  v75 = [(__CFString *)v137 guid];
                  *(_DWORD *)buf = 138412290;
                  v162 = v75;
                  _os_log_impl(&dword_1D967A000, v74, OS_LOG_TYPE_INFO, "Automatically saving message sent from local device: %@", buf, 0xCu);
                }
              }
              uint64_t v76 = 3;
            }
            else
            {
              if (v73)
              {
                id v123 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v123, OS_LOG_TYPE_INFO))
                {
                  id v124 = [(__CFString *)v137 guid];
                  *(_DWORD *)buf = 138412290;
                  v162 = v124;
                  _os_log_impl(&dword_1D967A000, v123, OS_LOG_TYPE_INFO, "Expire message sent from local device: %@", buf, 0xCu);
                }
              }
              uint64_t v76 = 1;
            }
            [(__CFString *)v137 setExpireState:v76];
            int v126 = ShouldAutomaticallySave ^ 1;
          }
          else
          {
            int ShouldAutomaticallySave = 0;
            int v126 = 0;
          }
          [(__CFString *)v137 setErrorCode:[(__CFString *)v143 errorCode]];
          id v128 = [(__CFString *)v143 consumedSessionPayloads];
          if (v140)
          {
            if (IMOSLoggingEnabled())
            {
              id v54 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
              {
                id v55 = [(__CFString *)v137 guid];
                *(_DWORD *)buf = 138412546;
                v162 = v55;
                __int16 v163 = 2112;
                v164 = v140;
                _os_log_impl(&dword_1D967A000, v54, OS_LOG_TYPE_INFO, "Updating date on message guid %@ to be: %@", buf, 0x16u);
              }
            }
            [(__CFString *)v137 setTime:v140];
          }
          if (v138 || ((v17 | v130) & 1) == 0) && (v135)
          {
            if ([(IMDServiceSession *)self isReplicating])
            {
              if (IMOSLoggingEnabled())
              {
                id v56 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
                {
                  int v57 = [(__CFString *)v138 isSent];
                  int v58 = [(__CFString *)v137 isSent];
                  id v59 = @"NO";
                  if (v57) {
                    id v60 = @"YES";
                  }
                  else {
                    id v60 = @"NO";
                  }
                  if (v58) {
                    id v59 = @"YES";
                  }
                  *(_DWORD *)buf = 138412546;
                  v162 = v60;
                  __int16 v163 = 2112;
                  v164 = v59;
                  _os_log_impl(&dword_1D967A000, v56, OS_LOG_TYPE_INFO, "This is the replicating session. It should not modify sent state. Existing message sent: %@, messageToUpdate sent: %@", buf, 0x16u);
                }
              }
              uint64_t v61 = 12;
            }
            else
            {
              uint64_t v61 = 32780;
            }
            uint64_t v134 = v61;
            id v62 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
            int v63 = [v62 isScheduledMessagesCoreEnabled];

            BOOL v64 = v63
               && [(__CFString *)v138 scheduleType] == 2
               && [(__CFString *)v138 scheduleState] != 0;
            BOOL v65 = +[IMDMessageStore sharedInstance];
            BOOL v66 = [(IMDServiceSession *)self _shouldBroadcastSendFailures];
            v155[0] = MEMORY[0x1E4F143A8];
            v155[1] = 3221225472;
            v155[2] = sub_1D981DBA0;
            v155[3] = &unk_1E6B77660;
            v155[4] = self;
            LODWORD(v125) = 0;
            objc_msgSend(v65, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:reindexMessage:isCloudImport:isIncomingMessage:didReplaceBlock:", v137, v64, v66, 1, v134, 1, v125, v155);
            unsigned __int8 v133 = (__CFString *)objc_claimAutoreleasedReturnValue();
          }
          else
          {
            unsigned __int8 v133 = v137;
          }
          if ([(__CFString *)v143 isBeingRetried]) {
            [(__CFString *)v133 setIsBeingRetried:1];
          }
          long long v67 = [(__CFString *)v143 retryToParticipant];

          if (v67)
          {
            long long v68 = [(__CFString *)v143 retryToParticipant];
            [(__CFString *)v133 setRetryToParticipant:v68];
          }
          BOOL v131 = [(IMDServiceSession *)self chatForChatIdentifier:v141 style:v157 account:v142];
          if (v17)
          {
            int v69 = v135;
            if (!v138) {
              int v69 = 0;
            }
            if (v69 != 1)
            {
LABEL_112:
              if (!v131
                || ![(__CFString *)v143 isFromMe]
                || ([(__CFString *)v143 isTypingMessage] & 1) != 0
                || ([(__CFString *)v143 isSuggestedActionResponse] & 1) != 0)
              {
                goto LABEL_134;
              }
              [v131 updateNumberOfTimesRespondedToThread];
              if ([v131 isFiltered] > 1 || (objc_msgSend(v131, "isSMSSpam") & 1) != 0)
              {
                if (![v131 isOscarChat])
                {
LABEL_134:
                  if (IMOSLoggingEnabled())
                  {
                    v78 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v78, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      v162 = v133;
                      _os_log_impl(&dword_1D967A000, v78, OS_LOG_TYPE_INFO, "Posting sent message: %@", buf, 0xCu);
                    }
                  }
                  if (v128) {
                    [(__CFString *)v133 setConsumedSessionPayloads:v128];
                  }
                  if (!v139 || ![(IMDServiceSession *)self isAwaitingStorageTimer])
                  {
                    BOOL v79 = +[IMDMessageStore sharedInstance];
                    v80 = [(__CFString *)v133 guid];
                    uint64_t v81 = [v79 messageWithGUID:v80];
                    v82 = (void *)v81;
                    v83 = v133;
                    if (v81) {
                      v83 = (void *)v81;
                    }
                    id v136 = v83;

                    int v84 = [(IMDServiceSession *)self broadcasterForChatListeners];
                    v85 = [v142 accountID];
                    uint64_t v86 = v157;
                    v87 = [v131 groupID];
                    uint64_t v88 = [v131 personCentricID];
                    [v84 account:v85 chat:v141 style:v86 chatProperties:0 groupID:v87 chatPersonCentricID:v88 messageSent:v136];
                  }
                  if ([(__CFString *)v143 isFinished])
                  {
                    uint64_t v89 = [(__CFString *)v143 service];
                    int v90 = [v89 isEqual:*MEMORY[0x1E4F6E1B0]];

                    if (v90)
                    {
                      id v91 = [(__CFString *)v143 guid];
                      id v92 = [(__CFString *)v143 fileTransferGUIDs];
                      [v92 count];
                      _signpostSendMessage();
                    }
                  }
                  if ([(__CFString *)v143 shouldNotifyOnSend])
                  {
                    if (IMOSLoggingEnabled())
                    {
                      id v93 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v93, OS_LOG_TYPE_INFO))
                      {
                        int v94 = ShouldAutomaticallySave;
                        id v95 = [(__CFString *)v143 guid];
                        if (v18) {
                          id v96 = @"NO";
                        }
                        else {
                          id v96 = @"YES";
                        }
                        v97 = v95;
                        *(_DWORD *)buf = 138412546;
                        v162 = v96;
                        __int16 v163 = 2112;
                        v164 = v97;
                        _os_log_impl(&dword_1D967A000, v93, OS_LOG_TYPE_INFO, "Posting distributed notification of send result %@ for message %@", buf, 0x16u);

                        int ShouldAutomaticallySave = v94;
                      }
                    }
                    v159[0] = *MEMORY[0x1E4F6D608];
                    id v98 = [(__CFString *)v143 guid];
                    v160[0] = v98;
                    v159[1] = *MEMORY[0x1E4F6D610];
                    id v99 = [NSNumber numberWithInt:v18 == 0];
                    v160[1] = v99;
                    CFDictionaryRef v100 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v160 forKeys:v159 count:2];

                    DistributedCenter = CFNotificationCenterGetDistributedCenter();
                    CFNotificationCenterPostNotification(DistributedCenter, (CFNotificationName)*MEMORY[0x1E4F6D600], 0, v100, 1u);
                  }
                  if ([(__CFString *)v143 sentViaRemoteIntent])
                  {
                    id v102 = [(__CFString *)v143 guid];
                    IMMessageSoundStartSuppressingSendSoundForMessageGUID();
                  }
                  if (v126)
                  {
                    id v103 = [(__CFString *)v143 guid];
                    [(IMDServiceSession *)self _updateExpireStateForMessageGUID:v103];
                  }
                  if (ShouldAutomaticallySave) {
                    [(IMDServiceSession *)self sendSavedReceiptForMessage:v143 toChatID:0 identifier:v141 style:v157 account:v142];
                  }
                  if (([(__CFString *)v143 isTypingMessage] & 1) == 0
                    && ([(__CFString *)v143 isDelivered] & 1) == 0
                    && [(__CFString *)v143 scheduleType] != 2
                    && (([v142 canMakeDowngradeRoutingChecks] & 1) != 0
                     || [(__CFString *)v143 errorCode] == 22))
                  {
                    id v104 = [(__CFString *)v143 guid];
                    v105 = [v131 guid];
                    [(IMDServiceSession *)self _updateRoutingForMessageGUID:v104 chatGUID:v105 error:[(__CFString *)v143 errorCode] account:v142];
                  }
                  if (!v17 || v138)
                  {
                    id v106 = [(__CFString *)v143 guid];
                    sub_1D9812D2C(v106);
                  }
                  if ([(__CFString *)v143 isAssociatedMessageItem])
                  {
                    unint64_t v107 = [(__CFString *)v143 associatedMessageType] & 0xFFFFFFFFFFFFFFF8;
                    if (v107 == 3000 || v107 == 2000)
                    {
                      id v108 = IMLogHandleForCategory();
                      if (os_log_type_enabled(v108, OS_LOG_TYPE_INFO))
                      {
                        v109 = [(__CFString *)v143 guid];
                        long long v110 = [(__CFString *)v143 associatedMessageGUID];
                        *(_DWORD *)buf = 138412546;
                        v162 = v109;
                        __int16 v163 = 2112;
                        v164 = v110;
                        _os_log_impl(&dword_1D967A000, v108, OS_LOG_TYPE_INFO, "Replacing previous message acknowledgements with new acknowledgment for sent message; sender: '%@':'%@'",
                          buf,
                          0x16u);
                      }
                      long long v111 = +[IMDMessageStore sharedInstance];
                      long long v112 = [(__CFString *)v143 guid];
                      long long v113 = [(__CFString *)v143 associatedMessageGUID];
                      id v114 = (id)[v111 replaceMessageAcknowledgmentsWithNewMessageAcknowledgment:v112 associatedMessageGUID:v113 sender:0];
                    }
                  }
                  long long v153 = 0u;
                  long long v154 = 0u;
                  long long v151 = 0u;
                  long long v152 = 0u;
                  long long v115 = [(IMDServiceSession *)self serviceSessionDelegates];
                  uint64_t v116 = [v115 countByEnumeratingWithState:&v151 objects:v158 count:16];
                  if (v116)
                  {
                    uint64_t v117 = *(void *)v152;
                    long long v118 = MEMORY[0x1E4F14428];
                    do
                    {
                      for (uint64_t i = 0; i != v116; ++i)
                      {
                        if (*(void *)v152 != v117) {
                          objc_enumerationMutation(v115);
                        }
                        uint64_t v120 = *(void *)(*((void *)&v151 + 1) + 8 * i);
                        if (objc_opt_respondsToSelector())
                        {
                          long long v121 = v118;
                          block[0] = MEMORY[0x1E4F143A8];
                          block[1] = 3221225472;
                          block[2] = sub_1D981DBB0;
                          block[3] = &unk_1E6B77688;
                          block[4] = v120;
                          __int16 v145 = v143;
                          id v146 = v141;
                          unsigned __int8 v149 = v157;
                          id v147 = v142;
                          id v148 = v140;
                          BOOL v150 = v139;
                          dispatch_async(v118, block);
                        }
                      }
                      uint64_t v116 = [v115 countByEnumeratingWithState:&v151 objects:v158 count:16];
                    }
                    while (v116);
                  }

                  v122 = +[IMDChatRegistry sharedInstance];
                  [v122 updateLastMessageForChat:v131 hintMessage:v133];

                  goto LABEL_188;
                }
                if (IMOSLoggingEnabled())
                {
                  v71 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
                  {
                    id v72 = [v131 chatIdentifier];
                    *(_DWORD *)buf = 138412290;
                    v162 = v72;
                    _os_log_impl(&dword_1D967A000, v71, OS_LOG_TYPE_INFO, "iMessage junk chat, updating isFiltered to NO, replying to chatId: %@", buf, 0xCu);
                  }
LABEL_132:
                }
              }
              else if (IMOSLoggingEnabled())
              {
                v71 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
                {
                  v77 = [v131 chatIdentifier];
                  *(_DWORD *)buf = 138412290;
                  v162 = v77;
                  _os_log_impl(&dword_1D967A000, v71, OS_LOG_TYPE_INFO, "Updating isFiltered to NO, replying to chatId: %@", buf, 0xCu);
                }
                goto LABEL_132;
              }
              [v131 updateIsFiltered:0];
              goto LABEL_134;
            }
          }
          else if (v130 & (v138 == 0)) != 0 || ((v135 ^ 1))
          {
            goto LABEL_112;
          }
          v70 = +[IMDChatRegistry sharedInstance];
          objc_msgSend(v70, "addMessage:toChat:deferSpotlightIndexing:", v143, v131, -[IMDServiceSession isAwaitingStorageTimer](self, "isAwaitingStorageTimer"));

          goto LABEL_112;
        }
        if (v27)
        {
          id v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            id v29 = [(__CFString *)v143 guid];
            *(_DWORD *)buf = 138412290;
            v162 = v29;
            _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Replicated message %@ is permitted to upgrade but existing message was already marked as deduplicated", buf, 0xCu);
          }
        }
      }
      char v30 = v23;
      goto LABEL_24;
    }
  }
  else
  {
    v142 = v14;
  }
  id v141 = v13;
LABEL_189:
}

- (void)notifyDidSendMessageID:(id)a3
{
}

- (void)notifyDidSendMessageID:(id)a3 shouldNotify:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self notifyDidSendMessageID:v6 account:v7 shouldNotify:v4];
}

- (void)notifyDidSendMessageID:(id)a3 account:(id)a4 shouldNotify:(BOOL)a5
{
}

- (BOOL)_alwaysAllowMarkingSent
{
  int v2 = [MEMORY[0x1E4F6C360] sharedInstance];
  if ([v2 isInternalInstall]) {
    char v3 = IMGetDomainBoolForKey();
  }
  else {
    char v3 = 0;
  }

  return v3;
}

- (BOOL)_canMarkMessageAsSent:(id)a3
{
  if (([a3 isSent] & 1) == 0 && !-[IMDServiceSession isReplicating](self, "isReplicating")) {
    return 1;
  }

  return [(IMDServiceSession *)self _alwaysAllowMarkingSent];
}

- (void)notifyDidSendMessageID:(id)a3 account:(id)a4 shouldNotify:(BOOL)a5 wasDowngraded:(BOOL)a6
{
}

- (void)notifyDidSendMessageID:(id)a3 account:(id)a4 shouldNotify:(BOOL)a5 wasDowngraded:(BOOL)a6 wasInterworked:(BOOL)a7
{
  BOOL v7 = a7;
  BOOL v9 = a5;
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  if (self->_activated)
  {
    if (!self->_account)
    {
      uint64_t v14 = [(IMDServiceSession *)self account];

      id v13 = (id)v14;
    }
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v57 = v12;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "message: %@", buf, 0xCu);
      }
    }
    if (v12)
    {
      char v16 = [(IMDServiceSession *)self service];
      int v17 = [v16 supportsDatabase];

      if (v17)
      {
        int v18 = +[IMDMessageStore sharedInstance];
        int v19 = [v18 messageWithGUID:v12];

        char v20 = [v19 service];
        int v21 = [(IMDServiceSession *)self service];
        id v22 = [v21 internalName];

        if (!v19 || !v20 || !v22) {
          goto LABEL_20;
        }
        if ([(IMDServiceSession *)self messageServiceNamed:v22 canProcessMessagesFromServiceNamed:v20]|| [(IMDServiceSession *)self _alwaysAllowMarkingSent])
        {
          HIDWORD(v54) = [(IMDServiceSession *)self _canMarkMessageAsSent:v19] || v7;
          if (HIDWORD(v54) != 1)
          {
            int v24 = 0;
LABEL_29:
            int v36 = NSNumber;
            uint64_t v37 = [v19 time];
            [v37 timeIntervalSinceNow];
            id v55 = [v36 numberWithDouble:fabs(v38)];

            if (IMOSLoggingEnabled())
            {
              id v39 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v57 = v19;
                __int16 v58 = 2112;
                id v59 = v55;
                _os_log_impl(&dword_1D967A000, v39, OS_LOG_TYPE_INFO, "Updated sent message: %@   duration: %@", buf, 0x16u);
              }
            }
            if (HIDWORD(v54))
            {
              long long v40 = [(IMDServiceSession *)self broadcasterForChatListeners];
              double v41 = [v13 accountID];
              [v40 account:v41 chat:0 style:0 chatProperties:0 messageUpdated:v19];
            }
            if (v24)
            {
              double v42 = +[IMDMessageStore sharedInstance];
              id v43 = [v42 chatForMessage:v19];

              id v44 = [v43 chatIdentifier];
              if ([v44 length])
              {
                if (IMOSLoggingEnabled())
                {
                  int v45 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v57 = v44;
                    _os_log_impl(&dword_1D967A000, v45, OS_LOG_TYPE_INFO, "Notifying chat listeners of service switch request for chat %@", buf, 0xCu);
                  }
                }
                int v46 = [(IMDServiceSession *)self broadcasterForChatListeners];
                [v46 serviceSwitchRequestReceivedForChatWithIdentifier:v44];
              }
            }
            if (([v19 flags] & 0x8000) != 0)
            {
              if ([v19 isFromMe])
              {
                if (([v19 isTypingMessage] & 1) == 0
                  && ![v19 errorCode]
                  && v9)
                {
                  uint64_t v52 = [(IMDServiceSession *)self broadcasterForChatObserverListeners];
                  id v53 = [v13 accountID];
                  LOBYTE(v54) = [(IMDServiceSession *)self isReplicating];
                  [v52 account:v53 chat:0 style:0 chatProperties:0 notifySentMessage:v19 sendTime:v55 isReplicating:v54];

                  if (![(IMDServiceSession *)self isReplicating]) {
                    +[IMDSoundUtilities playMessageSentSoundIfNeeded:v19];
                  }
                }
              }
            }

            goto LABEL_47;
          }
          if (v7) {
            goto LABEL_17;
          }
          if (![(IMDServiceSession *)self _messageUpgradesWhenSentFromCurrentService:v19])
          {
            if (a6
              || [(IMDServiceSession *)self _messageDowngradesWhenSentFromCurrentService:v19])
            {
              uint64_t v32 = 557056;
              if (([v19 wasDowngraded] & 1) == 0)
              {
                int v47 = [v19 originalServiceName];
                if (!v47
                  || (BOOL v48 = [(IMDServiceSession *)self _messageDowngradesWhenSentFromCurrentService:v19], v47, v48))
                {
                  unsigned __int8 v49 = [v19 service];
                  [v19 setOriginalServiceName:v49];
                }
                id v50 = [(IMDServiceSession *)self service];
                id v51 = [v50 internalName];
                [v19 setService:v51];
              }
              int v24 = 1;
              goto LABEL_28;
            }
            int v24 = 0;
LABEL_27:
            uint64_t v32 = 0x8000;
LABEL_28:
            objc_msgSend(v19, "setFlags:", objc_msgSend(v19, "flags") | v32);
            [v19 setErrorCode:0];
            int v33 = +[IMDMessageStore sharedInstance];
            BOOL v34 = [v33 storeMessage:v19 forceReplace:0 modifyError:1 modifyFlags:1 flagMask:v32];

            id v35 = [v34 guid];
            sub_1D9812D2C(v35);

            int v19 = v34;
            goto LABEL_29;
          }
          char v26 = [v19 originalServiceName];
          BOOL v27 = v26 == 0;

          if (v27)
          {
LABEL_17:
            long long v23 = [v19 service];
            [v19 setOriginalServiceName:v23];
          }
          id v28 = [(IMDServiceSession *)self service];
          id v29 = [v28 internalName];
          [v19 setService:v29];

          char v30 = [(IMDServiceSession *)self account];
          id v31 = [v30 accountID];
          [v19 setAccountID:v31];

          [v19 setWasInterworked:v7];
          int v24 = 1;
          goto LABEL_27;
        }
        if (![(IMDServiceSession *)self messageServiceNamed:v22 canProcessMessagesFromServiceNamed:v20])
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_47;
          }
          char v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v57 = v20;
            __int16 v58 = 2112;
            id v59 = v22;
            _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Unable notify about message, message is on an incompatible service: %@ vs %@", buf, 0x16u);
          }
        }
        else
        {
LABEL_20:
          if (!IMOSLoggingEnabled())
          {
LABEL_47:

            goto LABEL_48;
          }
          char v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v57 = v12;
            _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Unable notify about message, no messages found for guid: %@", buf, 0xCu);
          }
        }

        goto LABEL_47;
      }
    }
  }
LABEL_48:
}

- (void)sendDeleteCommand:(id)a3 forChatGUID:(id)a4
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    BOOL v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Can't delete on this service %@", (uint8_t *)&v8, 0xCu);
    }
  }
}

- (void)didReceiveDisplayNameChange:(id)a3 fromID:(id)a4 toIdentifier:(id)a5 forChat:(id)a6 style:(unsigned __int8)a7 account:(id)a8
{
  uint64_t v8 = a7;
  uint64_t v14 = NSString;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  id v19 = a3;
  id v20 = [v14 stringGUID];
  [(IMDServiceSession *)self didReceiveDisplayNameChange:v19 guid:v20 fromID:v18 toIdentifier:v17 forChat:v16 style:v8 account:v15];
}

- (void)didReceiveDisplayNameChange:(id)a3 guid:(id)a4 fromID:(id)a5 toIdentifier:(id)a6 forChat:(id)a7 style:(unsigned __int8)a8 account:(id)a9
{
  int v9 = a8;
  uint64_t v55 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v34 = a4;
  id v16 = a5;
  id v36 = a6;
  id v37 = a7;
  id v35 = a9;
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138413314;
      id v46 = v15;
      __int16 v47 = 2112;
      id v48 = v16;
      __int16 v49 = 2112;
      id v50 = v36;
      __int16 v51 = 2112;
      id v52 = v37;
      __int16 v53 = 1024;
      int v54 = v9;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_DEBUG, "name: %@   fromID: %@  toIdentifier:%@  identifier: %@ style: %d", buf, 0x30u);
    }
  }
  if (v9 == 45 || !self->_activated)
  {
    id v20 = v15;
  }
  else
  {
    unsigned __int8 v43 = v9;
    id v42 = v37;
    id v18 = v37;
    [(IMDServiceSession *)self _mapRoomChatToGroupChat:&v42 style:&v43];
    id v33 = v42;

    id v19 = [(IMDServiceSession *)self chatForChatIdentifier:v33 style:v43];
    if (v19)
    {
      id v20 = IMSharedHelperTruncatedGroupDisplayName();

      int v21 = [v19 displayName];
      int v22 = IMSharedHelperAreObjectsLogicallySame();

      if (v22)
      {
        if (IMOSLoggingEnabled())
        {
          long long v23 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Ignoring name update, already the current name", buf, 2u);
          }
        }
      }
      else
      {
        int v24 = +[IMDChatRegistry sharedInstance];
        char v25 = [v24 allExistingChatsWithIdentifier:v33 style:v43];

        long long v40 = 0u;
        long long v41 = 0u;
        long long v38 = 0u;
        long long v39 = 0u;
        id v26 = v25;
        uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v44 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v39;
          do
          {
            for (uint64_t i = 0; i != v27; ++i)
            {
              if (*(void *)v39 != v28) {
                objc_enumerationMutation(v26);
              }
              char v30 = *(void **)(*((void *)&v38 + 1) + 8 * i);
              int v31 = [v30 style];
              if (v31 == [v19 style]) {
                [v30 updateDisplayName:v20 sender:v16];
              }
            }
            uint64_t v27 = [v26 countByEnumeratingWithState:&v38 objects:v44 count:16];
          }
          while (v27);
        }

        uint64_t v32 = (void *)[objc_alloc(MEMORY[0x1E4F6E7A8]) initWithSender:v16 time:0 guid:v34 type:2];
        [(IMDServiceSession *)self _configureSessionInformationOnItem:v32 toChat:v33 withStyle:v43 forAccount:v35];
        [v32 setSender:v16];
        [v32 setDestinationCallerID:v36];
        [v32 setTitle:v20];
        [(IMDServiceSession *)self _storeTranscriptItem:v32 inChat:v19 account:v35];
      }
    }
    else
    {
      id v20 = v15;
    }
  }
}

- (void)_updateInputMessage:(id)a3 forExistingMessage:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if ([v6 isRead])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v13) = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "The existing message was read, let's mark the new one is read", (uint8_t *)&v13, 2u);
      }
    }
    objc_msgSend(v5, "setFlags:", objc_msgSend(v5, "flags") | 0x2000);
  }
  uint64_t v8 = [v6 time];
  BOOL v9 = v8 == 0;

  if (!v9)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [v6 time];
        int v13 = 138412290;
        uint64_t v14 = v11;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "The existing message has a time: %@, so lets set the new message to have the same time", (uint8_t *)&v13, 0xCu);
      }
    }
    id v12 = [v6 time];
    [v5 setTime:v12];
  }
}

- (void)didReceiveMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 fromIDSID:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self didReceiveMessage:v12 forChat:v11 style:v6 account:v13 fromIDSID:v10];
}

- (void)didReceiveMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 fromIDSID:(id)a7
{
  uint64_t v8 = a5;
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v18 = a3;
  id v12 = (void *)MEMORY[0x1E4F1C978];
  id v13 = a7;
  id v14 = a6;
  id v15 = a4;
  id v16 = a3;
  id v17 = [v12 arrayWithObjects:&v18 count:1];

  -[IMDServiceSession didReceiveMessages:forChat:style:account:fromIDSID:](self, "didReceiveMessages:forChat:style:account:fromIDSID:", v17, v15, v8, v14, v13, v18, v19);
}

- (id)_transcodeController
{
  return (id)[MEMORY[0x1E4F6EBE0] sharedInstance];
}

- (void)_setReplyGUIDOnMessage:(id)a3 forChat:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  BOOL v7 = [v5 replyToGUID];
  if (!v7
    || ([v5 replyToGUID],
        uint64_t v8 = objc_claimAutoreleasedReturnValue(),
        v8,
        v7,
        !v8))
  {
    BOOL v9 = [v6 lastMessage];
    id v10 = [v9 guid];

    if ([v10 length])
    {
      if (IMOSLoggingEnabled())
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          id v12 = [v5 guid];
          int v13 = 138412546;
          id v14 = v12;
          __int16 v15 = 2112;
          id v16 = v10;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "We are setting the reply to guid for message %@ to be %@ as a reply to guid has not been set", (uint8_t *)&v13, 0x16u);
        }
      }
      [v5 setReplyToGUID:v10];
    }
  }
}

- (void)_setSortIDForMessage:(id)a3 forChat:(id)a4
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMSharedHelperSortUsingReplyToGUIDAlgorithm())
  {
    BOOL v7 = objc_alloc_init(IMDMessageSortOrderAssigner);
    [(IMDMessageSortOrderAssigner *)v7 assignSortIDToIncomingMessage:v5 onChat:v6];
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        BOOL v9 = objc_msgSend(NSNumber, "numberWithUnsignedInteger:", objc_msgSend(v5, "sortID"));
        id v10 = [v5 guid];
        id v11 = [v6 guid];
        int v12 = 138412802;
        int v13 = v9;
        __int16 v14 = 2112;
        id v15 = v10;
        __int16 v16 = 2112;
        uint64_t v17 = v11;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Assigning sort id %@ to message %@ for chat %@", (uint8_t *)&v12, 0x20u);
      }
    }
  }
}

- (BOOL)_isActivated
{
  return self->_activated;
}

- (id)_collaborationMessageProcessingQueue
{
  if (qword_1EA8CA608 != -1) {
    dispatch_once(&qword_1EA8CA608, &unk_1F3391C20);
  }
  int v2 = (void *)qword_1EA8CA600;

  return v2;
}

- (void)_didReceivePotentialCollaborationMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = objc_alloc_init(MEMORY[0x1E4F6E718]);
  __int16 v14 = [v10 payloadData];
  [v13 setData:v14];

  id v15 = [v10 guid];
  [v13 setMessageGUID:v15];

  objc_msgSend(v13, "setIsFromMe:", objc_msgSend(v10, "isFromMe"));
  __int16 v16 = (void *)MEMORY[0x1E4F1CB10];
  uint64_t v17 = [v10 body];
  uint64_t v18 = [v17 string];
  uint64_t v19 = [v16 URLWithString:v18];
  [v13 setUrl:v19];

  id v20 = [v10 fileTransferGUIDs];
  int v21 = objc_msgSend(v20, "__imArrayByApplyingBlock:", &unk_1F3391C40);
  [v13 setAttachments:v21];

  int v22 = [(IMDServiceSession *)self _collaborationMessageProcessingQueue];
  v27[0] = MEMORY[0x1E4F143A8];
  v27[1] = 3221225472;
  v27[2] = sub_1D981F4A0;
  v27[3] = &unk_1E6B776F8;
  id v28 = v13;
  id v29 = v10;
  char v30 = self;
  id v31 = v11;
  unsigned __int8 v33 = a5;
  id v32 = v12;
  id v23 = v12;
  id v24 = v11;
  id v25 = v10;
  id v26 = v13;
  dispatch_async(v22, v27);
}

- (id)_revokeSiblingMessagesForReplication:(id)a3
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  BOOL v4 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v3, "count"));
  id v5 = objc_alloc_init(MEMORY[0x1E4F6BF58]);
  id v6 = [MEMORY[0x1E4F28F60] predicateWithFormat:@"%K IN %@", *MEMORY[0x1E4F6D598], v3];
  [v5 setPredicate:v6];

  long long v19 = 0u;
  long long v20 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v7 = v5;
  uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v18;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v18 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = [*(id *)(*((void *)&v17 + 1) + 8 * i) guid];
        [v4 addObject:v11];
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v23 count:16];
    }
    while (v8);
  }

  id v12 = +[IMDMessageStore sharedInstance];
  id v13 = [v12 deleteMessageGUIDs:v4];

  if (IMOSLoggingEnabled())
  {
    __int16 v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      int v22 = v13;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "   deleted messages: %@", buf, 0xCu);
    }
  }
  id v15 = (void *)[v4 copy];

  return v15;
}

- (BOOL)didReceiveMessages:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 fromIDSID:(id)a7
{
  uint64_t v58 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  id v24 = a4;
  id v29 = a6;
  id v23 = a7;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v25;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_DEBUG, "messages: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if ([v25 count] && -[IMDServiceSession _isActivated](self, "_isActivated"))
  {
    if (!v29)
    {
      id v29 = [(IMDServiceSession *)self account];
    }
    unsigned __int8 v53 = a5;
    id v52 = v24;
    id v11 = v24;
    [(IMDServiceSession *)self _mapRoomChatToGroupChat:&v52 style:&v53];
    id v27 = v52;

    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v56 = 0x2020000000;
    char v57 = 1;
    if ([(IMDServiceSession *)self isReplicating]) {
      id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    }
    else {
      id v12 = 0;
    }
    __int16 v14 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA48]), "initWithCapacity:", objc_msgSend(v25, "count"));
    long long v50 = 0u;
    long long v51 = 0u;
    long long v48 = 0u;
    long long v49 = 0u;
    obuint64_t j = v25;
    uint64_t v15 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v49;
      do
      {
        for (uint64_t i = 0; i != v15; ++i)
        {
          if (*(void *)v49 != v16) {
            objc_enumerationMutation(obj);
          }
          uint64_t v18 = *(void *)(*((void *)&v48 + 1) + 8 * i);
          aBlock[0] = MEMORY[0x1E4F143A8];
          aBlock[1] = 3221225472;
          aBlock[2] = sub_1D981FE78;
          aBlock[3] = &unk_1E6B77720;
          void aBlock[4] = self;
          id v19 = v27;
          unsigned __int8 v47 = v53;
          id v41 = v19;
          uint64_t v42 = v18;
          id v43 = v29;
          id v44 = v14;
          p_long long buf = &buf;
          id v45 = v12;
          long long v20 = (void (**)(void *, void))_Block_copy(aBlock);
          v20[2](v20, 0);
        }
        uint64_t v15 = [obj countByEnumeratingWithState:&v48 objects:v54 count:16];
      }
      while (v15);
    }

    if ((IMIsRunningInUnitTesting() & 1) == 0)
    {
      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D98205AC;
      block[3] = &unk_1E6B77748;
      id v31 = v12;
      id v32 = self;
      id v33 = v27;
      unsigned __int8 v38 = v53;
      id v34 = v14;
      id v35 = v29;
      id v36 = obj;
      id v37 = v23;
      unsigned __int8 v39 = a5;
      dispatch_async(MEMORY[0x1E4F14428], block);
    }
    BOOL v13 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    BOOL v13 = 0;
  }

  return v13;
}

- (BOOL)testOverrideTextValidationDidFail
{
  return 0;
}

- (BOOL)_storeMessage:(id)a3 chatIdentifier:(id)a4 localChat:(id)a5 style:(unsigned __int8)a6 account:(id)a7 messagesToPostArray:(id)a8
{
  uint64_t v10 = a6;
  uint64_t v67 = *MEMORY[0x1E4F143B8];
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  id v18 = a8;
  v62[0] = 0;
  v62[1] = v62;
  v62[2] = 0x3032000000;
  v62[3] = sub_1D9820EFC;
  v62[4] = sub_1D9820F0C;
  id v63 = 0;
  v60[0] = 0;
  v60[1] = v60;
  v60[2] = 0x3032000000;
  v60[3] = sub_1D9820EFC;
  v60[4] = sub_1D9820F0C;
  id v61 = 0;
  v58[0] = 0;
  v58[1] = v58;
  v58[2] = 0x3032000000;
  v58[3] = sub_1D9820EFC;
  v58[4] = sub_1D9820F0C;
  id v59 = 0;
  [(IMDServiceSession *)self _configureSessionInformationOnItem:v14 toChat:v15 withStyle:v10 forAccount:v17];
  id v33 = [v14 consumedSessionPayloads];
  if (([v14 isFromMe] & 1) == 0) {
    objc_msgSend(v14, "setFlags:", objc_msgSend(v14, "flags") | 0x1000);
  }
  if ([v14 isExpirable]
    && [v14 isFromMe]
    && [v14 expireState] <= 0)
  {
    if (IMMessageItemShouldAutomaticallySave())
    {
      if (IMOSLoggingEnabled())
      {
        id v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_DEBUG))
        {
          id v27 = [v14 guid];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v27;
          _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_DEBUG, "Automatically saving message sent from linked device: %@", (uint8_t *)&buf, 0xCu);
        }
      }
      [v14 setExpireState:3];
      char v31 = 0;
      char v32 = 1;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
        {
          id v29 = [v14 guid];
          LODWORD(buf) = 138412290;
          *(void *)((char *)&buf + 4) = v29;
          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_DEBUG, "Expire message sent from linked device: %@", (uint8_t *)&buf, 0xCu);
        }
      }
      [v14 setExpireState:1];
      char v32 = 0;
      char v31 = 1;
    }
  }
  else
  {
    char v31 = 0;
    char v32 = 0;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v65 = 0x2020000000;
  char v66 = 0;
  v48[0] = MEMORY[0x1E4F143A8];
  v48[1] = 3221225472;
  v48[2] = sub_1D9820F14;
  v48[3] = &unk_1E6B77770;
  p_long long buf = &buf;
  uint64_t v55 = v60;
  unsigned __int8 v53 = v62;
  v48[4] = self;
  id v30 = v16;
  id v49 = v30;
  uint64_t v56 = v58;
  id v50 = v15;
  char v57 = v10;
  id v51 = v17;
  id v52 = v14;
  v44[0] = MEMORY[0x1E4F143A8];
  v44[1] = 3221225472;
  v44[2] = sub_1D9822434;
  v44[3] = &unk_1E6B77798;
  id v46 = &buf;
  v44[4] = self;
  id v45 = v50;
  char v47 = v10;
  v34[0] = MEMORY[0x1E4F143A8];
  v34[1] = 3221225472;
  void v34[2] = sub_1D98225C8;
  v34[3] = &unk_1E6B777C0;
  id v19 = v52;
  id v35 = v19;
  id v36 = self;
  id v20 = v45;
  id v37 = v20;
  char v41 = v10;
  id v21 = v33;
  id v38 = v21;
  id v22 = v18;
  id v39 = v22;
  char v42 = v31;
  id v23 = v51;
  id v40 = v23;
  char v43 = v32;
  [(IMDServiceSession *)self storeMessage:v19 forceReplace:0 modifyError:1 modifyFlags:1 calculateUnreadCount:0 flagMask:0x81000003009 didReplaceBlock:0 shouldStoreBlock:v48 didStoreBlock:v44 block:v34];
  BOOL v24 = *(unsigned char *)(*((void *)&buf + 1) + 24) != 0;

  _Block_object_dispose(&buf, 8);
  _Block_object_dispose(v58, 8);

  _Block_object_dispose(v60, 8);
  _Block_object_dispose(v62, 8);

  return v24;
}

- (BOOL)_canUpgradeExistingMessageItem:(id)a3 replacementReplicatedMessageItem:(id)a4
{
  uint64_t v31 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (![(IMDServiceSession *)self isReplicating])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v15 = [v6 guid];
        int v25 = 138412290;
        id v26 = v15;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Disallowing upgrade of message %@, session is not replicating", (uint8_t *)&v25, 0xCu);
      }
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  BOOL v8 = 0;
  if (v6 && v7)
  {
    uint64_t v9 = [v6 guid];
    uint64_t v10 = [v7 guid];
    char v11 = [v9 isEqualToString:v10];

    if (v11)
    {
      int v12 = [v6 isFromMe];
      if (v12 == [v7 isFromMe])
      {
        if (([v6 isFromMe] & 1) != 0
          || ([v6 sender],
              id v19 = objc_claimAutoreleasedReturnValue(),
              [v7 sender],
              id v20 = objc_claimAutoreleasedReturnValue(),
              char v21 = [v19 isEqualToString:v20],
              v20,
              v19,
              (v21 & 1) != 0))
        {
          BOOL v8 = 1;
          goto LABEL_19;
        }
        if (!IMOSLoggingEnabled()) {
          goto LABEL_18;
        }
        BOOL v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v22 = [v6 guid];
          id v23 = [v6 sender];
          BOOL v24 = [v7 sender];
          int v25 = 138412802;
          id v26 = v22;
          __int16 v27 = 2112;
          id v28 = v23;
          __int16 v29 = 2112;
          id v30 = v24;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Disallowing upgrade of %@, different senders (%@ and %@)", (uint8_t *)&v25, 0x20u);
        }
        goto LABEL_17;
      }
      if (IMOSLoggingEnabled())
      {
        BOOL v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = [v6 guid];
          int v25 = 138412290;
          id v26 = v14;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Disallowing upgrade of %@", (uint8_t *)&v25, 0xCu);
        }
LABEL_17:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      BOOL v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v16 = [v6 guid];
        id v17 = [v7 guid];
        int v25 = 138412546;
        id v26 = v16;
        __int16 v27 = 2112;
        id v28 = v17;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Disallowing upgrade of message %@, replacement has guid %@", (uint8_t *)&v25, 0x16u);
      }
      goto LABEL_17;
    }
LABEL_18:
    BOOL v8 = 0;
  }
LABEL_19:

  return v8;
}

- (void)didReceiveInvitation:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v37 = v8;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_DEBUG, "message: %@", buf, 0xCu);
    }
  }
  if (v8 && [(IMDServiceSession *)self _isActivated])
  {
    char v11 = [(IMDServiceSession *)self accountID];
    int v12 = ![(IMDServiceSession *)self shouldImitateGroupChatUsingChatRooms];
    if (v5 != 35) {
      LOBYTE(v12) = 1;
    }
    if (v12)
    {
      id v16 = 0;
    }
    else if ([v9 roomNameIsProbablyAutomaticallyGenerated])
    {
      id v13 = v9;
      [(IMDServiceSession *)self useChatRoom:v13 forGroupChatIdentifier:v13];
      id v14 = (void *)MEMORY[0x1E4F1C9E8];
      id v15 = [v13 dataUsingEncoding:4];
      id v16 = objc_msgSend(v14, "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x1E4F6C4E8], 0);

      uint64_t v5 = 43;
    }
    else
    {
      id v16 = 0;
      uint64_t v5 = 35;
    }
    id v17 = [(IMDServiceSession *)self account];
    [(IMDServiceSession *)self _configureSessionInformationOnItem:v8 toChat:v9 withStyle:v5 forAccount:v17];

    id v18 = [(IMDServiceSession *)self chatForChatIdentifier:v9 style:v5];
    if ([v8 isTypingMessage] & 1) != 0 || (objc_msgSend(v8, "isFromMe")) {
      goto LABEL_25;
    }
    id v19 = [(IMDServiceSession *)self service];
    if ([v19 supportsDatabase])
    {
      id v20 = +[IMDDaemonPropertyManager sharedManager];
      char v21 = [v20 valueOfPersistentProperty:*MEMORY[0x1E4F6C490]];
      BOOL v27 = [v21 intValue] == 0;

      if (!v27)
      {
LABEL_25:
        v34[0] = MEMORY[0x1E4F143A8];
        v34[1] = 3221225472;
        void v34[2] = sub_1D9823730;
        v34[3] = &unk_1E6B77520;
        id v35 = v18;
        v28[0] = MEMORY[0x1E4F143A8];
        v28[1] = 3221225472;
        v28[2] = sub_1D98237C8;
        v28[3] = &unk_1E6B777E8;
        v28[4] = self;
        char v33 = v5;
        id v29 = v9;
        id v30 = v35;
        id v31 = v11;
        id v32 = v16;
        id v24 = v16;
        id v25 = v11;
        id v26 = v35;
        [(IMDServiceSession *)self storeMessage:v8 forceReplace:0 modifyError:0 modifyFlags:1 calculateUnreadCount:0 flagMask:9 didReplaceBlock:0 shouldStoreBlock:0 didStoreBlock:v34 block:v28];

        goto LABEL_26;
      }
    }
    else
    {
    }
    if (IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "  Ensuring the app is alive here", buf, 2u);
      }
    }
    id v23 = +[IMDLocalDaemon sharedDaemon];
    [v23 launchListenerForCapability:*MEMORY[0x1E4F6C508]];

    goto LABEL_25;
  }
LABEL_26:
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5
{
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  LOBYTE(v6) = 0;
  [(IMDServiceSession *)self didUpdateChatStatus:*(void *)&a3 chat:a4 style:a5 displayName:0 groupID:0 handleInfo:0 account:a6 isBlackholed:v6];
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 handleInfo:(id)a6
{
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 handleInfo:(id)a8
{
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 handleInfo:(id)a9
{
  uint64_t v12 = a5;
  uint64_t v14 = *(void *)&a3;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a4;
  id v22 = [(IMDServiceSession *)self account];
  LOBYTE(v21) = 0;
  [(IMDServiceSession *)self didUpdateChatStatus:v14 chat:v20 style:v12 displayName:v19 groupID:v18 lastAddressedHandle:v17 lastAddressedSIMID:0 handleInfo:v16 account:v22 isBlackholed:v21];
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10
{
  uint64_t v13 = a5;
  uint64_t v15 = *(void *)&a3;
  id v17 = a10;
  id v18 = a9;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a4;
  id v24 = [(IMDServiceSession *)self account];
  LOBYTE(v23) = 0;
  [(IMDServiceSession *)self didUpdateChatStatus:v15 chat:v22 style:v13 displayName:v21 groupID:v20 lastAddressedHandle:v19 lastAddressedSIMID:v18 handleInfo:v17 account:v24 isBlackholed:v23];
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 lastAddressedHandle:(id)a9 lastAddressedSIMID:(id)a10 handleInfo:(id)a11
{
  uint64_t v14 = a5;
  uint64_t v16 = *(void *)&a3;
  id v18 = a11;
  id v19 = a10;
  id v20 = a9;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a4;
  id v26 = [(IMDServiceSession *)self account];
  LOBYTE(v25) = 0;
  [(IMDServiceSession *)self didUpdateChatStatus:v16 chat:v24 style:v14 displayName:v23 groupID:v22 originalGroupID:v21 lastAddressedHandle:v20 lastAddressedSIMID:v19 handleInfo:v18 account:v26 isBlackholed:v25];
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 handleInfo:(id)a8 account:(id)a9 isBlackholed:(BOOL)a10
{
  LOBYTE(v10) = a10;
  [(IMDServiceSession *)self didUpdateChatStatus:*(void *)&a3 chat:a4 style:a5 displayName:a6 groupID:a7 lastAddressedHandle:0 lastAddressedSIMID:0 handleInfo:a8 account:a9 category:0 spamExtensionName:0 isBlackholed:v10];
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10 account:(id)a11 isBlackholed:(BOOL)a12
{
  LOBYTE(v12) = a12;
  [(IMDServiceSession *)self didUpdateChatStatus:*(void *)&a3 chat:a4 style:a5 displayName:a6 groupID:a7 originalGroupID:0 lastAddressedHandle:a8 lastAddressedSIMID:a9 handleInfo:a10 account:a11 isBlackholed:v12];
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 lastAddressedHandle:(id)a9 lastAddressedSIMID:(id)a10 handleInfo:(id)a11 account:(id)a12 isBlackholed:(BOOL)a13
{
  LOBYTE(v13) = a13;
  [(IMDServiceSession *)self didUpdateChatStatus:*(void *)&a3 chat:a4 style:a5 displayName:a6 groupID:a7 originalGroupID:a8 lastAddressedHandle:a9 lastAddressedSIMID:a10 handleInfo:a11 account:a12 category:0 spamExtensionName:0 isBlackholed:v13];
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 handleInfo:(id)a9 account:(id)a10 category:(int64_t)a11 spamExtensionName:(id)a12
{
  LOBYTE(v12) = 0;
  [(IMDServiceSession *)self didUpdateChatStatus:*(void *)&a3 chat:a4 style:a5 displayName:a6 groupID:a7 originalGroupID:a8 lastAddressedHandle:0 lastAddressedSIMID:0 handleInfo:a9 account:a10 category:a11 spamExtensionName:a12 isBlackholed:v12];
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 handleInfo:(id)a10 account:(id)a11 category:(int64_t)a12 spamExtensionName:(id)a13 isBlackholed:(BOOL)a14
{
  LOBYTE(v14) = a14;
  [(IMDServiceSession *)self didUpdateChatStatus:*(void *)&a3 chat:a4 style:a5 displayName:a6 groupID:a7 originalGroupID:0 lastAddressedHandle:a8 lastAddressedSIMID:a9 handleInfo:a10 account:a11 category:a12 spamExtensionName:a13 isBlackholed:v14];
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 displayName:(id)a6 groupID:(id)a7 originalGroupID:(id)a8 lastAddressedHandle:(id)a9 lastAddressedSIMID:(id)a10 handleInfo:(id)a11 account:(id)a12 category:(int64_t)a13 spamExtensionName:(id)a14 isBlackholed:(BOOL)a15
{
  unsigned int v30 = a5;
  id v19 = a14;
  id v20 = a12;
  id v21 = a11;
  id v22 = a10;
  id v23 = a9;
  id v24 = a8;
  id v25 = a7;
  id v26 = a6;
  id v27 = a4;
  id v31 = objc_alloc_init(IMDChatStatusChangeContext);
  [(IMDChatStatusChangeContext *)v31 setDisplayName:v26];

  [(IMDChatStatusChangeContext *)v31 setGroupID:v25];
  [(IMDChatStatusChangeContext *)v31 setOriginalGroupID:v24];

  [(IMDChatStatusChangeContext *)v31 setLastAddressedHandle:v23];
  [(IMDChatStatusChangeContext *)v31 setLastAddressedSIMID:v22];

  [(IMDChatStatusChangeContext *)v31 setHandleInfo:v21];
  [(IMDChatStatusChangeContext *)v31 setAccount:v20];

  [(IMDChatStatusChangeContext *)v31 setCategory:a13];
  [(IMDChatStatusChangeContext *)v31 setExtensionName:v19];

  [(IMDChatStatusChangeContext *)v31 setIsBlackholed:a15];
  [(IMDServiceSession *)self didUpdateChatStatus:a3 chat:v27 style:v30 context:v31];
}

- (void)didUpdateChatStatus:(int)a3 chat:(id)a4 style:(unsigned __int8)a5 context:(id)a6
{
  uint64_t v113 = *MEMORY[0x1E4F143B8];
  id v9 = a4;
  unsigned __int8 v100 = a5;
  id v10 = a6;
  if ([v9 length])
  {
    if (!self->_activated) {
      goto LABEL_63;
    }
    v78 = self;
    v85 = v10;
    char v11 = [v10 account];
    if (v11)
    {
      [v10 setAccount:v11];
    }
    else
    {
      uint64_t v13 = [(IMDServiceSession *)self account];
      [v85 setAccount:v13];
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = [v85 lastAddressedHandle];
        uint64_t v16 = [v85 lastAddressedSIMID];
        *(_DWORD *)long long buf = 138413314;
        id v104 = v9;
        __int16 v105 = 1024;
        int v106 = a3;
        __int16 v107 = 1024;
        int v108 = v100;
        __int16 v109 = 2112;
        long long v110 = v15;
        __int16 v111 = 2112;
        long long v112 = v16;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Chat: %@  status update: %d  style: %c lastAddressedHandle %@ lastAddressedSIMID %@", buf, 0x2Cu);
      }
    }
    id v99 = v9;
    [(IMDServiceSession *)v78 _mapRoomChatToGroupChat:&v99 style:&v100];
    id v84 = v99;

    BOOL v76 = 0;
    char v17 = a3 + 1;
    if ((a3 + 1) > 8) {
      goto LABEL_37;
    }
    if (((1 << v17) & 0x73) != 0)
    {
      id v18 = [(IMDServiceSession *)v78 chatForChatIdentifier:v84 style:v100];
      uint64_t v19 = [v18 state];
      BOOL v76 = (v19 & 0xFFFFFFFFFFFFFFFELL) == 2;
      if ((v19 & 0xFFFFFFFFFFFFFFFELL) == 2)
      {
        id v20 = [MEMORY[0x1E4F6E940] sharedCoordinator];
        id v21 = [v18 groupID];
        [v20 informOfKickFromGroup:v21];
      }
      [v18 setState:0];
      id v22 = [v18 guid];
      [(IMDServiceSession *)v78 _removeChatGuidFromCoreDuet:v22];
    }
    else
    {
      if (((1 << v17) & 0x108) != 0)
      {
        uint64_t v23 = v100;
        id v24 = [v85 displayName];
        id v25 = [v85 groupID];
        id v26 = [v85 originalGroupID];
        id v27 = [v85 lastAddressedHandle];
        id v28 = [v85 lastAddressedSIMID];
        id v29 = [v85 handleInfo];
        unsigned int v30 = [v85 account];
        LOBYTE(v75) = [v85 isBlackholed];
        [(IMDServiceSession *)v78 registerChat:v84 style:v23 displayName:v24 groupID:v25 originalGroupID:v26 lastAddressedHandle:v27 lastAddressedSIMID:v28 handleInfo:v29 account:v30 isBlackholed:v75];

        uint64_t v31 = v100;
        id v32 = [v85 account];
        id v18 = [(IMDServiceSession *)v78 chatForChatIdentifier:v84 style:v31 account:v32];

        if (a3 == 2) {
          uint64_t v33 = 3;
        }
        else {
          uint64_t v33 = 4;
        }
        [v18 setState:v33];
        if ([v85 category] == 2
          || [v85 category] == 3
          || [v85 category] == 4)
        {
          id v34 = [v85 extensionName];
          [v18 updateSMSSpamExtensionNameChatProperty:v34];
        }
        if (MEMORY[0x1E0169B30](v84))
        {
          if (IMOSLoggingEnabled())
          {
            id v35 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
            {
              id v36 = [v18 chatIdentifier];
              *(_DWORD *)long long buf = 138412290;
              id v104 = v36;
              _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "Updating isFiltered to NO, chat ID is a business chat: %@", buf, 0xCu);
            }
          }
          [v18 updateIsFiltered:0];
        }
      }
      else
      {
        if (a3 != 1)
        {
LABEL_37:
          v77 = [(IMDServiceSession *)v78 chatForChatIdentifier:v84 style:v100];
          id v81 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if (v100 == 45)
          {
            id v37 = (void *)MEMORY[0x1E4F1C9E8];
            obuint64_t j = [NSNumber numberWithInt:2];
            uint64_t v38 = objc_msgSend(v37, "dictionaryWithObjectsAndKeys:", v84, *MEMORY[0x1E4F6C5C8], obj, *MEMORY[0x1E4F6C458], 0);
            [v81 addObject:v38];
          }
          else
          {
            long long v97 = 0u;
            long long v98 = 0u;
            long long v95 = 0u;
            long long v96 = 0u;
            obuint64_t j = [v85 handleInfo];
            uint64_t v39 = [obj countByEnumeratingWithState:&v95 objects:v102 count:16];
            if (v39)
            {
              uint64_t v82 = *(void *)v96;
              uint64_t v40 = *MEMORY[0x1E4F6C5C8];
              uint64_t v41 = *MEMORY[0x1E4F6C648];
              uint64_t v42 = *MEMORY[0x1E4F6C5A0];
              uint64_t v80 = *MEMORY[0x1E4F6C458];
              do
              {
                for (uint64_t i = 0; i != v39; ++i)
                {
                  if (*(void *)v96 != v82) {
                    objc_enumerationMutation(obj);
                  }
                  id v44 = *(void **)(*((void *)&v95 + 1) + 8 * i);
                  id v45 = [v44 objectForKey:v40];
                  id v46 = [v44 objectForKey:v41];
                  char v47 = [v44 objectForKey:v42];
                  if (v45)
                  {
                    long long v48 = (void *)MEMORY[0x1E4F1C9E8];
                    id v49 = [NSNumber numberWithInt:2];
                    id v50 = objc_msgSend(v48, "dictionaryWithObjectsAndKeys:", v45, v40, v49, v80, v46, v41, v47, v42, 0);
                    [v81 addObject:v50];
                  }
                }
                uint64_t v39 = [obj countByEnumeratingWithState:&v95 objects:v102 count:16];
              }
              while (v39);
            }
          }

          id v51 = -[IMDServiceSession broadcasterForChatListenersWithBlackholeStatus:](v78, "broadcasterForChatListenersWithBlackholeStatus:", [v77 isBlackholed]);
          id v52 = [v85 account];
          unsigned __int8 v53 = [v52 accountID];
          uint64_t v54 = v100;
          uint64_t v55 = [v77 chatProperties];
          uint64_t v56 = [v77 groupID];
          char v57 = [v77 personCentricID];
          LODWORD(v74) = a3;
          [v51 account:v53 chat:v84 style:v54 chatProperties:v55 groupID:v56 chatPersonCentricID:v57 statusChanged:v74 handleInfo:v81];

          if (v100 != 45 && v76)
          {
            id v59 = objc_alloc(MEMORY[0x1E4F6E798]);
            uint64_t v60 = [v85 messageID];
            id v61 = (void *)[v59 initWithSender:0 time:0 guid:v60 type:3];

            uint64_t v62 = v100;
            id v63 = [v85 account];
            [(IMDServiceSession *)v78 _configureSessionInformationOnItem:v61 toChat:v84 withStyle:v62 forAccount:v63];

            [v61 setSender:0];
            [v61 setActionType:0];
            BOOL v64 = [v77 account];
            uint64_t v65 = [v64 loginID];
            char v66 = [v65 _stripFZIDPrefix];

            [v61 setDestinationCallerID:v66];
            uint64_t v67 = [v85 account];
            [(IMDServiceSession *)v78 _storeTranscriptItem:v61 inChat:v77 account:v67];
          }
          long long v93 = 0u;
          long long v94 = 0u;
          long long v91 = 0u;
          long long v92 = 0u;
          long long v68 = [(IMDServiceSession *)v78 serviceSessionDelegates];
          uint64_t v69 = [v68 countByEnumeratingWithState:&v91 objects:v101 count:16];
          if (v69)
          {
            uint64_t v70 = *(void *)v92;
            v71 = MEMORY[0x1E4F14428];
            do
            {
              for (uint64_t j = 0; j != v69; ++j)
              {
                if (*(void *)v92 != v70) {
                  objc_enumerationMutation(v68);
                }
                uint64_t v73 = *(void *)(*((void *)&v91 + 1) + 8 * j);
                if (objc_opt_respondsToSelector())
                {
                  block[0] = MEMORY[0x1E4F143A8];
                  block[1] = 3221225472;
                  block[2] = sub_1D9824AF0;
                  block[3] = &unk_1E6B77810;
                  void block[4] = v73;
                  int v89 = a3;
                  id v87 = v84;
                  unsigned __int8 v90 = v100;
                  id v88 = v85;
                  dispatch_async(v71, block);
                }
              }
              uint64_t v69 = [v68 countByEnumeratingWithState:&v91 objects:v101 count:16];
            }
            while (v69);
          }

          id v9 = v84;
          id v10 = v85;
          goto LABEL_63;
        }
        id v18 = [(IMDServiceSession *)v78 chatForChatIdentifier:v84 style:v100];
        [v18 setState:2];
      }
      BOOL v76 = 0;
    }

    goto LABEL_37;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Invalid chat identifier, ignoring", buf, 2u);
    }
  }
LABEL_63:
}

- (void)willRemoveChat:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Chat: %@ being removed.", buf, 0xCu);
    }
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(IMDServiceSession *)self serviceSessionDelegates];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 serviceSession:self willRemoveChat:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)willMoveChatToRecentlyDeleted:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v17 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Chat: %@ being moved to recently deleted.", buf, 0xCu);
    }
  }
  long long v13 = 0u;
  long long v14 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  uint64_t v6 = [(IMDServiceSession *)self serviceSessionDelegates];
  uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v12;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v12 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v11 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          [v10 serviceSession:self willMoveChatToRecentlyDeleted:v4];
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [v6 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v7);
  }
}

- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9
{
  id v27 = a3;
  id v12 = a5;
  id v13 = a9;
  id v14 = a6;
  uint64_t v15 = +[IMDChatRegistry sharedInstance];
  uint64_t v16 = [v15 existingChatWithGUID:v14];

  if ([(IMDServiceSession *)self _canInsertDisplayNameUpdateItemForChat:v16])
  {
    id v17 = +[IMDMessageStore sharedInstance];
    char v18 = [v17 hasStoredMessageWithGUID:v13];

    if ((v18 & 1) == 0)
    {
      uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F6E7A8]) initWithSender:0 time:0 guid:v13 type:2];
      [v19 setTitle:v27];
      id v20 = [(IMDServiceSession *)self account];
      id v21 = [v20 service];
      id v22 = [v21 internalName];
      [v19 setService:v22];

      [v19 setDestinationCallerID:v12];
      int v23 = IMGetCachedDomainBoolForKey();
      char v24 = v23;
      if (v23) {
        [v19 setErrorCode:4];
      }
      id v25 = [v16 account];
      if (v25)
      {
        [(IMDServiceSession *)self _storeTranscriptItem:v19 inChat:v16 account:v25];
      }
      else
      {
        id v26 = [(IMDServiceSession *)self account];
        [(IMDServiceSession *)self _storeTranscriptItem:v19 inChat:v16 account:v26];
      }
      if ((v24 & 1) == 0) {
        [v16 updateDisplayName:v27];
      }
    }
  }
}

- (BOOL)_canInsertDisplayNameUpdateItemForChat:(id)a3
{
  id v3 = a3;
  if [v3 style] == 45 || (objc_msgSend(v3, "isBusinessChat")) {
    LOBYTE(v4) = 0;
  }
  else {
    int v4 = [v3 isStewieChat] ^ 1;
  }

  return v4;
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 forChat:(id)a5 style:(unsigned __int8)a6
{
  return (id)MEMORY[0x1F4181798](self, sel_didChangeMemberStatus_forHandle_unformattedNumber_countryCode_forChat_style_);
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 unformattedNumber:(id)a5 countryCode:(id)a6 forChat:(id)a7 style:(unsigned __int8)a8
{
  uint64_t v8 = a8;
  uint64_t v12 = *(void *)&a3;
  id v14 = a7;
  id v15 = a6;
  id v16 = a5;
  id v17 = a4;
  char v18 = objc_alloc_init(IMDChatMemberStatusChangeContext);
  [(IMDChatMemberStatusChangeContext *)v18 setStatus:v12];
  [(IMDChatMemberStatusChangeContext *)v18 setHandleID:v17];

  [(IMDChatMemberStatusChangeContext *)v18 setUnformattedNumber:v16];
  [(IMDChatMemberStatusChangeContext *)v18 setCountryCode:v15];

  [(IMDChatMemberStatusChangeContext *)v18 setChatIdentifier:v14];
  [(IMDChatMemberStatusChangeContext *)v18 setStyle:v8];
  uint64_t v19 = [(IMDServiceSession *)self didChangeMemberStatus:v18];

  return v19;
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9
{
  uint64_t v13 = *(void *)&a3;
  id v15 = a8;
  id v16 = a7;
  id v17 = a6;
  id v18 = a5;
  id v19 = a4;
  id v20 = objc_alloc_init(IMDChatMemberStatusChangeContext);
  [(IMDChatMemberStatusChangeContext *)v20 setStatus:v13];
  [(IMDChatMemberStatusChangeContext *)v20 setHandleID:v19];

  [(IMDChatMemberStatusChangeContext *)v20 setFromHandleID:v18];
  [(IMDChatMemberStatusChangeContext *)v20 setUnformattedNumber:v17];

  [(IMDChatMemberStatusChangeContext *)v20 setCountryCode:v16];
  [(IMDChatMemberStatusChangeContext *)v20 setChatIdentifier:v15];

  [(IMDChatMemberStatusChangeContext *)v20 setStyle:a9];
  id v21 = [(IMDServiceSession *)self didChangeMemberStatus:v20];

  return v21;
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9 account:(id)a10
{
  uint64_t v15 = *(void *)&a3;
  id v16 = a10;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = objc_alloc_init(IMDChatMemberStatusChangeContext);
  [(IMDChatMemberStatusChangeContext *)v22 setStatus:v15];
  [(IMDChatMemberStatusChangeContext *)v22 setHandleID:v21];

  [(IMDChatMemberStatusChangeContext *)v22 setFromHandleID:v20];
  [(IMDChatMemberStatusChangeContext *)v22 setUnformattedNumber:v19];

  [(IMDChatMemberStatusChangeContext *)v22 setCountryCode:v18];
  [(IMDChatMemberStatusChangeContext *)v22 setChatIdentifier:v17];

  [(IMDChatMemberStatusChangeContext *)v22 setStyle:a9];
  [(IMDChatMemberStatusChangeContext *)v22 setAccount:v16];

  int v23 = [(IMDServiceSession *)self didChangeMemberStatus:v22];

  return v23;
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9 account:(id)a10 destinationCallerID:(id)a11
{
  uint64_t v16 = *(void *)&a3;
  id v17 = a11;
  id v18 = a10;
  id v19 = a8;
  id v20 = a7;
  id v21 = a6;
  id v22 = a5;
  id v23 = a4;
  char v24 = objc_alloc_init(IMDChatMemberStatusChangeContext);
  [(IMDChatMemberStatusChangeContext *)v24 setStatus:v16];
  [(IMDChatMemberStatusChangeContext *)v24 setHandleID:v23];

  [(IMDChatMemberStatusChangeContext *)v24 setFromHandleID:v22];
  [(IMDChatMemberStatusChangeContext *)v24 setUnformattedNumber:v21];

  [(IMDChatMemberStatusChangeContext *)v24 setCountryCode:v20];
  [(IMDChatMemberStatusChangeContext *)v24 setChatIdentifier:v19];

  [(IMDChatMemberStatusChangeContext *)v24 setStyle:a9];
  [(IMDChatMemberStatusChangeContext *)v24 setAccount:v18];

  [(IMDChatMemberStatusChangeContext *)v24 setDestinationCallerID:v17];
  id v25 = [(IMDServiceSession *)self didChangeMemberStatus:v24];

  return v25;
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9 account:(id)a10 destinationCallerID:(id)a11 messageTime:(id)a12
{
  uint64_t v17 = *(void *)&a3;
  id v28 = a12;
  id v18 = a11;
  id v19 = a10;
  id v20 = a8;
  id v21 = a7;
  id v22 = a6;
  id v23 = a5;
  id v24 = a4;
  id v25 = objc_alloc_init(IMDChatMemberStatusChangeContext);
  [(IMDChatMemberStatusChangeContext *)v25 setStatus:v17];
  [(IMDChatMemberStatusChangeContext *)v25 setHandleID:v24];

  [(IMDChatMemberStatusChangeContext *)v25 setFromHandleID:v23];
  [(IMDChatMemberStatusChangeContext *)v25 setUnformattedNumber:v22];

  [(IMDChatMemberStatusChangeContext *)v25 setCountryCode:v21];
  [(IMDChatMemberStatusChangeContext *)v25 setChatIdentifier:v20];

  [(IMDChatMemberStatusChangeContext *)v25 setStyle:a9];
  [(IMDChatMemberStatusChangeContext *)v25 setAccount:v19];

  [(IMDChatMemberStatusChangeContext *)v25 setDestinationCallerID:v18];
  [(IMDChatMemberStatusChangeContext *)v25 setMessageTime:v28];

  id v26 = [(IMDServiceSession *)self didChangeMemberStatus:v25];

  return v26;
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9 account:(id)a10 destinationCallerID:(id)a11 messageTime:(id)a12 silently:(BOOL)a13
{
  uint64_t v18 = *(void *)&a3;
  id v29 = a12;
  id v19 = a11;
  id v20 = a10;
  id v21 = a8;
  id v22 = a7;
  id v23 = a6;
  id v24 = a5;
  id v25 = a4;
  id v26 = objc_alloc_init(IMDChatMemberStatusChangeContext);
  [(IMDChatMemberStatusChangeContext *)v26 setStatus:v18];
  [(IMDChatMemberStatusChangeContext *)v26 setHandleID:v25];

  [(IMDChatMemberStatusChangeContext *)v26 setFromHandleID:v24];
  [(IMDChatMemberStatusChangeContext *)v26 setUnformattedNumber:v23];

  [(IMDChatMemberStatusChangeContext *)v26 setCountryCode:v22];
  [(IMDChatMemberStatusChangeContext *)v26 setChatIdentifier:v21];

  [(IMDChatMemberStatusChangeContext *)v26 setStyle:a9];
  [(IMDChatMemberStatusChangeContext *)v26 setAccount:v20];

  [(IMDChatMemberStatusChangeContext *)v26 setDestinationCallerID:v19];
  [(IMDChatMemberStatusChangeContext *)v26 setMessageTime:v29];

  [(IMDChatMemberStatusChangeContext *)v26 setSilently:a13];
  id v27 = [(IMDServiceSession *)self didChangeMemberStatus:v26];

  return v27;
}

- (id)didChangeMemberStatus:(int)a3 forHandle:(id)a4 fromHandle:(id)a5 unformattedNumber:(id)a6 countryCode:(id)a7 forChat:(id)a8 style:(unsigned __int8)a9 account:(id)a10 destinationCallerID:(id)a11 messageTime:(id)a12 messageID:(id)a13 silently:(BOOL)a14
{
  uint64_t v19 = *(void *)&a3;
  id v31 = a13;
  id v30 = a12;
  id v20 = a11;
  id v21 = a10;
  id v22 = a8;
  id v23 = a7;
  id v24 = a6;
  id v25 = a5;
  id v26 = a4;
  id v27 = objc_alloc_init(IMDChatMemberStatusChangeContext);
  [(IMDChatMemberStatusChangeContext *)v27 setStatus:v19];
  [(IMDChatMemberStatusChangeContext *)v27 setHandleID:v26];

  [(IMDChatMemberStatusChangeContext *)v27 setFromHandleID:v25];
  [(IMDChatMemberStatusChangeContext *)v27 setUnformattedNumber:v24];

  [(IMDChatMemberStatusChangeContext *)v27 setCountryCode:v23];
  [(IMDChatMemberStatusChangeContext *)v27 setChatIdentifier:v22];

  [(IMDChatMemberStatusChangeContext *)v27 setStyle:a9];
  [(IMDChatMemberStatusChangeContext *)v27 setAccount:v21];

  [(IMDChatMemberStatusChangeContext *)v27 setDestinationCallerID:v20];
  [(IMDChatMemberStatusChangeContext *)v27 setMessageTime:v30];

  [(IMDChatMemberStatusChangeContext *)v27 setMessageID:v31];
  [(IMDChatMemberStatusChangeContext *)v27 setSilently:a14];
  id v28 = [(IMDServiceSession *)self didChangeMemberStatus:v27];

  return v28;
}

- (id)_chatForMemberStatusChange:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [v4 chatIdentifier];
  char v14 = [v4 style];
  id v13 = v5;
  [(IMDServiceSession *)self _mapRoomChatToGroupChat:&v13 style:&v14];
  id v6 = v13;

  uint64_t v7 = [v4 chatIdentifier];
  uint64_t v8 = [v4 style];

  uint64_t v9 = [(IMDServiceSession *)self _guidForChat:v7 style:v8];

  id v10 = +[IMDChatRegistry sharedInstance];
  long long v11 = [v10 existingChatWithGUID:v9];

  return v11;
}

- (id)didChangeMemberStatus:(id)a3
{
  uint64_t v122 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = v4;
  long long v97 = self;
  if (!self->_activated)
  {
    uint64_t v8 = 0;
    goto LABEL_44;
  }
  id v6 = [v4 account];
  uint64_t v7 = v6;
  if (v6)
  {
    id v96 = v6;
  }
  else
  {
    id v96 = [(IMDServiceSession *)v97 account];
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      id v10 = [v5 chatIdentifier];
      long long v11 = [v5 handleID];
      uint64_t v12 = [v5 fromHandleID];
      id v13 = [v5 unformattedNumber];
      char v14 = [v5 countryCode];
      *(_DWORD *)long long buf = 138413826;
      __int16 v109 = v10;
      __int16 v110 = 2112;
      id v111 = v11;
      __int16 v112 = 2112;
      uint64_t v113 = v12;
      __int16 v114 = 2112;
      long long v115 = v13;
      __int16 v116 = 2112;
      uint64_t v117 = v14;
      __int16 v118 = 1024;
      int v119 = [v5 status];
      __int16 v120 = 1024;
      int v121 = [v5 style];
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Chat: %@  member: %@ from member: %@ unformated: %@ country: %@ status update: %d  style: %c", buf, 0x40u);
    }
  }
  uint64_t v15 = [(IMDServiceSession *)v97 _chatForMemberStatusChange:v5];
  uint64_t v16 = [IMDHandle alloc];
  uint64_t v17 = [v5 handleID];
  uint64_t v18 = [v5 unformattedNumber];
  uint64_t v19 = [v5 countryCode];
  id v20 = [(IMDHandle *)v16 initWithID:v17 unformattedID:v18 countryCode:v19];

  id v21 = [v15 participants];
  id v22 = objc_msgSend(v21, "__imArrayByApplyingBlock:", &unk_1F3391C60);
  id v23 = [v5 handleID];
  int v95 = [v22 containsObject:v23];

  unsigned int v24 = [v5 status] + 1;
  if (v24 > 6)
  {
    LOBYTE(v95) = 0;
LABEL_38:
    int v94 = 1;
LABEL_39:
    id v44 = [(IMDServiceSession *)v97 broadcasterForChatListeners];
    id v45 = [v96 accountID];
    id v46 = [v15 chatIdentifier];
    uint64_t v47 = [v15 style];
    long long v48 = [v15 chatProperties];
    id v49 = [v15 personCentricID];
    id v50 = [(IMDHandle *)v20 handleInfo];
    LODWORD(v93) = [v5 status];
    [v44 account:v45 chat:v46 style:v47 chatProperties:v48 chatPersonCentricID:v49 member:v50 statusChanged:v93];

    if ((v95 & 1) == 0) {
      goto LABEL_42;
    }
    goto LABEL_40;
  }
  if (v24 == 3)
  {
    id v35 = +[IMDChatRegistry sharedInstance];
    id v36 = [v15 chatIdentifier];
    id v37 = objc_msgSend(v35, "allExistingChatsWithIdentifier:style:", v36, objc_msgSend(v15, "style"));

    long long v104 = 0u;
    long long v105 = 0u;
    long long v102 = 0u;
    long long v103 = 0u;
    id v38 = v37;
    uint64_t v39 = [v38 countByEnumeratingWithState:&v102 objects:v107 count:16];
    if (v39)
    {
      uint64_t v40 = *(void *)v103;
      do
      {
        for (uint64_t i = 0; i != v39; ++i)
        {
          if (*(void *)v103 != v40) {
            objc_enumerationMutation(v38);
          }
          uint64_t v42 = *(void **)(*((void *)&v102 + 1) + 8 * i);
          int v43 = [v42 style];
          if (v43 == [v15 style]) {
            [v42 addParticipant:v20];
          }
        }
        uint64_t v39 = [v38 countByEnumeratingWithState:&v102 objects:v107 count:16];
      }
      while (v39);
    }

    LOBYTE(v95) = v95 ^ 1;
    goto LABEL_38;
  }
  id v25 = +[IMDChatRegistry sharedInstance];
  id v26 = [v15 chatIdentifier];
  id v27 = objc_msgSend(v25, "allExistingChatsWithIdentifier:style:", v26, objc_msgSend(v15, "style"));

  long long v100 = 0u;
  long long v101 = 0u;
  long long v98 = 0u;
  long long v99 = 0u;
  id v28 = v27;
  uint64_t v29 = [v28 countByEnumeratingWithState:&v98 objects:v106 count:16];
  if (v29)
  {
    int v30 = 0;
    uint64_t v31 = *(void *)v99;
    do
    {
      for (uint64_t j = 0; j != v29; ++j)
      {
        if (*(void *)v99 != v31) {
          objc_enumerationMutation(v28);
        }
        uint64_t v33 = *(void **)(*((void *)&v98 + 1) + 8 * j);
        int v34 = [v33 style];
        if (v34 == [v15 style]) {
          v30 |= [v33 removeParticipant:v20];
        }
      }
      uint64_t v29 = [v28 countByEnumeratingWithState:&v98 objects:v106 count:16];
    }
    while (v29);

    if (v30)
    {
      int v94 = 0;
      goto LABEL_39;
    }
    if (!v95) {
      goto LABEL_42;
    }
  }
  else
  {

    if ((v95 & 1) == 0) {
      goto LABEL_42;
    }
  }
  int v94 = 0;
LABEL_40:
  if ([v15 style] != 45 && (objc_msgSend(v5, "silently") & 1) == 0)
  {
    if (v94)
    {
      int v52 = 0;
    }
    else
    {
      unsigned __int8 v53 = [v5 fromHandleID];
      uint64_t v54 = [v5 handleID];
      int v52 = [v53 isEqualToIgnoringCase:v54];
    }
    uint64_t v55 = [v5 messageID];
    uint64_t v56 = v55;
    if (v55)
    {
      id v57 = v55;
    }
    else
    {
      id v57 = [NSString stringGUID];
    }
    uint64_t v58 = v57;

    if (v52)
    {
      id v59 = objc_alloc(MEMORY[0x1E4F6E798]);
      uint64_t v60 = [v5 fromHandleID];
      id v61 = (id)[v59 initWithSender:v60 time:0 guid:v58 type:3];

      uint64_t v62 = [v15 chatIdentifier];
      -[IMDServiceSession _configureSessionInformationOnItem:toChat:withStyle:forAccount:](v97, "_configureSessionInformationOnItem:toChat:withStyle:forAccount:", v61, v62, [v15 style], v96);

      id v63 = [v5 unformattedNumber];
      [v61 setOtherUnformattedID:v63];

      BOOL v64 = [v5 countryCode];
      [v61 setOtherCountryCode:v64];

      [v61 setActionType:0];
      if (IMOSLoggingEnabled())
      {
        uint64_t v65 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
        {
          char v66 = [v61 otherHandle];
          *(_DWORD *)long long buf = 138412290;
          __int16 v109 = v66;
          _os_log_impl(&dword_1D967A000, v65, OS_LOG_TYPE_INFO, "Storing participant leave: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v67 = objc_alloc(MEMORY[0x1E4F6E8E0]);
      long long v68 = [v5 fromHandleID];
      uint64_t v69 = [v5 messageTime];
      uint64_t v70 = (void *)[v67 initWithSender:v68 time:v69 guid:v58 type:1];

      v71 = [v15 chatIdentifier];
      -[IMDServiceSession _configureSessionInformationOnItem:toChat:withStyle:forAccount:](v97, "_configureSessionInformationOnItem:toChat:withStyle:forAccount:", v70, v71, [v15 style], v96);

      id v72 = [v5 handleID];
      [v70 setOtherHandle:v72];

      uint64_t v73 = [v5 unformattedNumber];
      [v70 setOtherUnformattedID:v73];

      uint64_t v74 = [v5 countryCode];
      [v70 setOtherCountryCode:v74];

      objc_msgSend(v70, "setUnattributed:", objc_msgSend(v5, "unattributed"));
      [v70 setChangeType:v94 ^ 1u];
      if (IMOSLoggingEnabled())
      {
        uint64_t v75 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
        {
          if (v94) {
            BOOL v76 = @"invite";
          }
          else {
            BOOL v76 = @"remove";
          }
          id v77 = [v70 sender];
          v78 = [v70 otherHandle];
          *(_DWORD *)long long buf = 138412802;
          __int16 v109 = v76;
          __int16 v110 = 2112;
          id v111 = v77;
          __int16 v112 = 2112;
          uint64_t v113 = v78;
          _os_log_impl(&dword_1D967A000, v75, OS_LOG_TYPE_INFO, "Storing %@ participant change item  %@ => %@", buf, 0x20u);
        }
      }
      id v61 = v70;
      if ([MEMORY[0x1E4F6EA38] isInternationalSpamFilteringEnabled]
        && [v15 isBlackholed]
        && [v5 status] == 2)
      {
        BOOL v79 = (void *)MEMORY[0x1E4F6EA38];
        uint64_t v80 = [v5 handleID];
        LODWORD(v79) = [v79 isKnownContact:v80];

        int v81 = IMOSLoggingEnabled();
        if (v79)
        {
          if (v81)
          {
            uint64_t v82 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
            {
              v83 = [v5 handleID];
              id v84 = [v15 guid];
              *(_DWORD *)long long buf = 138412546;
              __int16 v109 = v83;
              __int16 v110 = 2112;
              id v111 = v84;
              _os_log_impl(&dword_1D967A000, v82, OS_LOG_TYPE_INFO, "Hawking: New participant (%@) added to chat (%@) is a known contact.", buf, 0x16u);
            }
          }
          [v15 updateIsBlackholed:0];
          v85 = [v15 participants];
          BOOL v86 = [v85 count] == 1;

          id v87 = [MEMORY[0x1E4F6E890] sharedInstance];
          id v88 = v87;
          if (v86) {
            [v87 trackSpamEvent:24];
          }
          else {
            [v87 trackSpamEvent:25];
          }
        }
        else if (v81)
        {
          int v89 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v89, OS_LOG_TYPE_INFO))
          {
            unsigned __int8 v90 = [v15 guid];
            long long v91 = [v5 handleID];
            *(_DWORD *)long long buf = 138412546;
            __int16 v109 = v90;
            __int16 v110 = 2112;
            id v111 = v91;
            _os_log_impl(&dword_1D967A000, v89, OS_LOG_TYPE_INFO, "Hawking: New participant (%@) added to chat (%@) is not a known contact.", buf, 0x16u);
          }
        }
      }
    }
    long long v92 = [v5 destinationCallerID];
    [v61 setDestinationCallerID:v92];

    [(IMDServiceSession *)v97 _storeTranscriptItem:v61 inChat:v15 account:v96];
    uint64_t v8 = [v61 guid];

    goto LABEL_43;
  }
LABEL_42:
  uint64_t v8 = 0;
LABEL_43:

LABEL_44:

  return v8;
}

- (void)_storeTranscriptItem:(id)a3 inChat:(id)a4 account:(id)a5
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v11 = [(IMDServiceSession *)self service];
  v30[0] = MEMORY[0x1E4F143A8];
  v30[1] = 3221225472;
  uint64_t v31 = sub_1D9826C1C;
  id v32 = &unk_1E6B77838;
  id v33 = v9;
  v23[0] = MEMORY[0x1E4F143A8];
  v23[1] = 3221225472;
  unsigned int v24 = sub_1D9826CB0;
  id v25 = &unk_1E6B77860;
  id v26 = v8;
  id v27 = self;
  id v12 = v33;
  id v28 = v12;
  id v13 = v10;
  id v29 = v13;
  id v14 = v11;
  id v15 = v26;
  uint64_t v16 = v30;
  uint64_t v17 = v23;
  id v18 = v15;
  if (IMOSLoggingEnabled())
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v35 = v18;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Storing item: %@", buf, 0xCu);
    }
  }
  id v20 = +[IMDMessageStore sharedInstance];
  id v21 = [v20 storeItem:v18 forceReplace:0];

  if (IMOSLoggingEnabled())
  {
    id v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v35 = v21;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "  => Result item: %@", buf, 0xCu);
    }
  }
  v31((uint64_t)v16, v21);
  v24(v17, 1, v18, v21);
}

- (BOOL)_shouldBlackholeGroupChatFromSender:(id)a3 toRecipient:(id)a4 withOtherParticipants:(id)a5 forAccount:(id)a6
{
  return 0;
}

- (Class)spotlightItemRecorderClass
{
  if (qword_1EA8CA618 != -1) {
    dispatch_once(&qword_1EA8CA618, &unk_1F3391C80);
  }
  int v2 = (void *)qword_1EA8CA610;

  return (Class)v2;
}

- (void)_removeChatGuidFromCoreDuet:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v12 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Going to remove chat guid from core duet %@", buf, 0xCu);
    }
  }
  if ([v4 length])
  {
    id v6 = [(objc_class *)[(IMDServiceSession *)self spotlightItemRecorderClass] spotlightItemRecorder];
    id v10 = v4;
    uint64_t v7 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v10 count:1];
    v8[0] = MEMORY[0x1E4F143A8];
    v8[1] = 3221225472;
    v8[2] = sub_1D98271DC;
    v8[3] = &unk_1E6B73F78;
    id v9 = v4;
    [v6 deleteSearchableItemsWithDomainIdentifiers:v7 bundleID:@"com.apple.MobileSMS" withCompletion:v8];
  }
}

- (void)_markChatAsDowngraded:(id)a3
{
  id v4 = a3;
  uint64_t v5 = v4;
  if (v4)
  {
    id v6 = [v4 properties];
    uint64_t v7 = (void *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithCapacity:2];
    id v8 = [MEMORY[0x1E4F1C9C8] date];
    id v9 = NSNumber;
    [v8 timeIntervalSince1970];
    id v10 = objc_msgSend(v9, "numberWithDouble:");
    [v7 setObject:v10 forKey:*MEMORY[0x1E4F6C468]];
    uint64_t v11 = *MEMORY[0x1E4F6C460];
    id v12 = [v6 objectForKey:*MEMORY[0x1E4F6C460]];
    uint64_t v13 = v12;
    if (v12 && ([v12 isNull] & 1) == 0) {
      uint64_t v14 = [v13 unsignedIntegerValue] + 1;
    }
    else {
      uint64_t v14 = 1;
    }
    id v15 = (void *)[objc_alloc(NSNumber) initWithUnsignedInteger:v14];
    [v7 setObject:v15 forKey:v11];

    uint64_t v16 = +[IMDChatRegistry sharedInstance];
    uint64_t v17 = [v5 chatIdentifier];
    int v18 = objc_msgSend(v16, "updateProperties:chat:style:", v7, v17, objc_msgSend(v5, "style"));

    if (v18)
    {
      uint64_t v19 = [(IMDServiceSession *)self broadcasterForChatListeners];
      id v20 = [v5 guid];
      id v21 = [v5 properties];
      [v19 chat:v20 propertiesUpdated:v21];
    }
LABEL_12:

    goto LABEL_13;
  }
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v22 = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "No chat to update downgrade properties for.", v22, 2u);
    }
    goto LABEL_12;
  }
LABEL_13:
}

- (void)_handleRoutingWithDictionary:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Handling routing dictionary: %@", buf, 0xCu);
    }
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D9827674;
  v6[3] = &unk_1E6B767A0;
  v6[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

- (id)_downgradableServiceNames
{
  int v2 = +[IMDServiceController sharedController];
  id v3 = [v2 serviceNamesSupportingCapability:*MEMORY[0x1E4F6E0F0]];
  id v4 = [v3 allObjects];

  return v4;
}

- (void)_updateRoutingForMessageGUID:(id)a3 chatGUID:(id)a4 error:(unsigned int)a5 account:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = v12;
  if (self->_activated)
  {
    int v14 = [v12 canMakeDowngradeRoutingChecks];
    if (a5 == 22 || v14)
    {
      id v15 = v10;
      id v16 = v11;
      im_dispatch_after();
    }
  }
}

- (void)_updateRoutingTimerWithInterval:(double)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 > 0.0 && self->_activated)
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v11 = 134217984;
        double v12 = a3;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Scheduling a routing check with interval: %f", (uint8_t *)&v11, 0xCu);
      }
    }
    messageRoutingTimer = self->_messageRoutingTimer;
    if (messageRoutingTimer)
    {
      [(IMTimer *)messageRoutingTimer invalidate];
      id v8 = self->_messageRoutingTimer;
      self->_messageRoutingTimer = 0;
    }
    uint64_t v9 = (IMTimer *)[objc_alloc(MEMORY[0x1E4F6C3F0]) initWithTimeInterval:@"message-routing-timer" name:1 shouldWake:self target:sel__routingTimerFired selector:0 userInfo:a3];
    id v10 = self->_messageRoutingTimer;
    self->_messageRoutingTimer = v9;
  }
}

- (void)_routingTimerFired
{
  [(IMTimer *)self->_messageRoutingTimer invalidate];
  messageRoutingTimer = self->_messageRoutingTimer;
  self->_messageRoutingTimer = 0;

  if (self->_activated)
  {
    id v4 = [MEMORY[0x1E4F6BED0] sharedInstance];
    uint64_t v5 = [(IMDServiceSession *)self _downgradableServiceNames];
    v6[0] = MEMORY[0x1E4F143A8];
    v6[1] = 3221225472;
    v6[2] = sub_1D9828A94;
    v6[3] = &unk_1E6B778B0;
    v6[4] = self;
    [v4 requestRoutingWithDowngradableServices:v5 completion:v6];
  }
}

- (BOOL)canMakeExpireStateChecks
{
  return 0;
}

- (void)_handleExpireStateDictionary:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Handling expire state dictionary: %@", buf, 0xCu);
    }
  }
  id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  uint64_t v13 = MEMORY[0x1E4F143A8];
  uint64_t v14 = 3221225472;
  id v15 = sub_1D9828DB0;
  id v16 = &unk_1E6B77928;
  uint64_t v17 = self;
  id v7 = v6;
  id v18 = v7;
  [v4 enumerateKeysAndObjectsUsingBlock:&v13];
  if (objc_msgSend(v7, "count", v13, v14, v15, v16, v17))
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v20 = v7;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "   delete expired messages: %@", buf, 0xCu);
      }
    }
    uint64_t v9 = [(IMDServiceSession *)self _sharedMessageStore];
    id v10 = [v9 deleteMessageGUIDs:v7];

    if (IMOSLoggingEnabled())
    {
      int v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v20 = v10;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "   deleted expired messages: %@", buf, 0xCu);
      }
    }
    if ([v10 count])
    {
      double v12 = [(IMDServiceSession *)self broadcasterForChatListeners];
      [v12 historicalMessageGUIDsDeleted:v10 chatGUIDs:0 queryID:0];
    }
  }
}

- (void)_updateExpireStateForMessageGUID:(id)a3
{
  id v4 = a3;
  if (self->_activated && [(IMDServiceSession *)self canMakeExpireStateChecks])
  {
    id v5 = v4;
    im_dispatch_after();
  }
}

- (void)_updateExpireStateTimerWithInterval:(double)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3 > 0.0 && self->_activated)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    messageExpireStateTimer = self->_messageExpireStateTimer;
    if (messageExpireStateTimer
      && (double v8 = v6,
          [(IMTimer *)messageExpireStateTimer fireDate],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          double v10 = v8 + a3,
          [v9 timeIntervalSinceReferenceDate],
          double v12 = v11,
          v9,
          v10 > v12))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = [(IMTimer *)self->_messageExpireStateTimer fireDate];
          [v14 timeIntervalSinceReferenceDate];
          double v16 = v15;
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          int v23 = 134218240;
          double v24 = a3;
          __int16 v25 = 2048;
          double v26 = v16 - v17;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Don't schedule expire state check with interval: %f, one is already scheduled with interval: %f", (uint8_t *)&v23, 0x16u);
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
          int v23 = 134217984;
          double v24 = a3;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Scheduling an expire state check with interval: %f", (uint8_t *)&v23, 0xCu);
        }
      }
      uint64_t v19 = self->_messageExpireStateTimer;
      if (v19)
      {
        [(IMTimer *)v19 invalidate];
        id v20 = self->_messageExpireStateTimer;
        self->_messageExpireStateTimer = 0;
      }
      uint64_t v21 = (IMTimer *)[objc_alloc(MEMORY[0x1E4F6C3F0]) initWithTimeInterval:@"message-expire-state-timer" name:1 shouldWake:self target:sel__expireStateTimerFired selector:0 userInfo:a3];
      id v22 = self->_messageExpireStateTimer;
      self->_messageExpireStateTimer = v21;
    }
  }
}

- (void)_expireStateTimerFired
{
  [(IMTimer *)self->_messageExpireStateTimer invalidate];
  messageExpireStateTimer = self->_messageExpireStateTimer;
  self->_messageExpireStateTimer = 0;

  if (self->_activated)
  {
    id v4 = [MEMORY[0x1E4F6BED0] sharedInstance];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = sub_1D98298A4;
    v5[3] = &unk_1E6B778B0;
    v5[4] = self;
    [v4 requestExpireStateWithCompletion:v5];
  }
}

- (void)_handleWatchdogWithDictionary:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Handling watchdog dictionary: %@", buf, 0xCu);
    }
  }
  v6[0] = MEMORY[0x1E4F143A8];
  v6[1] = 3221225472;
  v6[2] = sub_1D9829A48;
  v6[3] = &unk_1E6B77950;
  v6[4] = self;
  [v4 enumerateKeysAndObjectsUsingBlock:v6];
}

- (void)_updateWatchdogForMessageGUID:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (self->_activated)
  {
    id v6 = v4;
    im_dispatch_after();
  }
}

- (void)_updateWatchdogTimerWithInterval:(double)a3
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  if (a3 > 0.0 && self->_activated)
  {
    [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
    messageWatchdogTimer = self->_messageWatchdogTimer;
    if (messageWatchdogTimer
      && (double v8 = v6,
          [(IMTimer *)messageWatchdogTimer fireDate],
          uint64_t v9 = objc_claimAutoreleasedReturnValue(),
          double v10 = v8 + a3,
          [v9 timeIntervalSinceReferenceDate],
          double v12 = v11,
          v9,
          v10 > v12))
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          uint64_t v14 = [(IMTimer *)self->_messageWatchdogTimer fireDate];
          [v14 timeIntervalSinceReferenceDate];
          double v16 = v15;
          [MEMORY[0x1E4F1C9C8] timeIntervalSinceReferenceDate];
          int v23 = 134218240;
          double v24 = a3;
          __int16 v25 = 2048;
          double v26 = v16 - v17;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Don't schedule watchdog check with interval: %f, one is already scheduled with interval: %f", (uint8_t *)&v23, 0x16u);
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
          int v23 = 134217984;
          double v24 = a3;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Scheduling a watchdog check with interval: %f", (uint8_t *)&v23, 0xCu);
        }
      }
      uint64_t v19 = self->_messageWatchdogTimer;
      if (v19)
      {
        [(IMTimer *)v19 invalidate];
        id v20 = self->_messageWatchdogTimer;
        self->_messageWatchdogTimer = 0;
      }
      uint64_t v21 = (IMTimer *)[objc_alloc(MEMORY[0x1E4F6C3F0]) initWithTimeInterval:@"message-watchdog-timer" name:1 shouldWake:self target:sel__watchdogTimerFired selector:0 userInfo:a3];
      id v22 = self->_messageWatchdogTimer;
      self->_messageWatchdogTimer = v21;
    }
  }
}

- (void)_watchdogTimerFired
{
  [(IMTimer *)self->_messageWatchdogTimer invalidate];
  messageWatchdogTimer = self->_messageWatchdogTimer;
  self->_messageWatchdogTimer = 0;

  if (self->_activated)
  {
    id v4 = [MEMORY[0x1E4F6BED0] sharedInstance];
    v5[0] = MEMORY[0x1E4F143A8];
    v5[1] = 3221225472;
    v5[2] = sub_1D9829FE8;
    v5[3] = &unk_1E6B778B0;
    v5[4] = self;
    [v4 requestWatchdogWithCompletion:v5];
  }
}

- (id)_autoReplier
{
  messageAutoReplier = self->_messageAutoReplier;
  if (!messageAutoReplier)
  {
    id v4 = objc_alloc_init(IMDAvailabilityAutoReplier);
    id v5 = self->_messageAutoReplier;
    self->_messageAutoReplier = (IMDAutoReplying *)v4;

    [(IMDAutoReplying *)self->_messageAutoReplier setReplyDelegate:self];
    messageAutoReplier = self->_messageAutoReplier;
  }

  return messageAutoReplier;
}

- (void)autoReplier:(id)a3 generatedAutoReplyText:(id)a4 forChat:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D982A180;
  block[3] = &unk_1E6B73BC8;
  id v12 = v7;
  uint64_t v13 = self;
  id v14 = v8;
  id v9 = v8;
  id v10 = v7;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)autoReplier:(id)a3 receivedUrgentRequestForMessages:(id)a4
{
  id v5 = a4;
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D982A2F0;
  v7[3] = &unk_1E6B73218;
  id v8 = v5;
  id v9 = self;
  id v6 = v5;
  dispatch_async(MEMORY[0x1E4F14428], v7);
}

- (void)autoReplier:(id)a3 sendDeliveredQuietlyReceiptForMessages:(id)a4 forIncomingMessageFromIDSID:(id)a5 inChat:(id)a6 withWillSendToDestinationsHandler:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D982A540;
  block[3] = &unk_1E6B731F0;
  id v20 = v13;
  id v21 = v11;
  id v22 = self;
  id v23 = v12;
  id v24 = v14;
  id v15 = v14;
  id v16 = v12;
  id v17 = v11;
  id v18 = v13;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (void)autoReplier:(id)a3 sendNotifyRecipientCommandForMessages:(id)a4 inChat:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  block[0] = MEMORY[0x1E4F143A8];
  block[1] = 3221225472;
  block[2] = sub_1D982A804;
  block[3] = &unk_1E6B73BC8;
  id v12 = v8;
  id v13 = v7;
  id v14 = self;
  id v9 = v7;
  id v10 = v8;
  dispatch_async(MEMORY[0x1E4F14428], block);
}

- (id)otcUtilities
{
  otcUtilities = self->_otcUtilities;
  if (!otcUtilities)
  {
    id v4 = (IMOneTimeCodeUtilities *)objc_alloc_init(MEMORY[0x1E4F6E8D8]);
    id v5 = self->_otcUtilities;
    self->_otcUtilities = v4;

    otcUtilities = self->_otcUtilities;
  }

  return otcUtilities;
}

- (void)_checkMessageForOneTimeCodes:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDServiceSession *)self otcUtilities];
  id v6 = [v4 body];
  id v7 = [v4 sender];
  id v8 = [v4 guid];

  id v11 = (id)[v5 createOTCFromMessageBody:v6 sender:v7 guid:v8];
  if (v11)
  {
    id v9 = +[IMDOneTimeCodeManager sharedInstance];
    [v9 startTrackingCode:v11];

    id v10 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v10 trackEvent:*MEMORY[0x1E4F6DBB8]];
  }
}

- (void)_checkMessageForENURL:(id)a3
{
  id v4 = a3;
  id v5 = +[IMDExposureNotificationManager sharedInstance];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D982AC28;
  v7[3] = &unk_1E6B75FE8;
  id v8 = v4;
  id v9 = self;
  id v6 = v4;
  [v5 processMessageItemForENURL:v6 withCompletionHandler:v7];
}

- (void)didSendBalloonPayload:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 messageGUID:(id)a6 account:(id)a7 completionBlock:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  unsigned __int8 v33 = a5;
  id v16 = a7;
  id v17 = a8;
  if (v14)
  {
    if (a6)
    {
      id v18 = a6;
      uint64_t v19 = [(IMDServiceSession *)self _sharedMessageStore];
      id v20 = [v19 messageWithGUID:v18];

      if (v20)
      {
        id v32 = v15;
        [(IMDServiceSession *)self _mapRoomChatToGroupChat:&v32 style:&v33];
        id v21 = v32;

        id v22 = [(IMDServiceSession *)self chatForChatIdentifier:v21 style:v33];
        v24[0] = MEMORY[0x1E4F143A8];
        v24[1] = 3221225472;
        v24[2] = sub_1D982B150;
        v24[3] = &unk_1E6B77978;
        id v25 = v22;
        id v26 = v14;
        uint64_t v27 = self;
        id v28 = v16;
        id v15 = v21;
        id v29 = v15;
        unsigned __int8 v31 = v33;
        id v30 = v17;
        id v23 = v22;
        [(IMDServiceSession *)self storeMessage:v26 forceReplace:1 modifyError:1 modifyFlags:1 calculateUnreadCount:1 flagMask:32780 didReplaceBlock:0 shouldStoreBlock:0 didStoreBlock:0 block:v24];
      }
    }
  }
}

- (void)didReceiveBalloonPayload:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 messageGUID:(id)a6 account:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  unsigned __int8 v29 = a5;
  id v14 = a7;
  if (v12)
  {
    if (a6)
    {
      id v15 = a6;
      id v16 = [(IMDServiceSession *)self _sharedMessageStore];
      id v17 = [v16 messageWithGUID:v15];

      if (v17)
      {
        id v28 = v13;
        [(IMDServiceSession *)self _mapRoomChatToGroupChat:&v28 style:&v29];
        id v18 = v28;

        uint64_t v19 = [(IMDServiceSession *)self chatForChatIdentifier:v18 style:v29];
        v21[0] = MEMORY[0x1E4F143A8];
        v21[1] = 3221225472;
        void v21[2] = sub_1D982B448;
        v21[3] = &unk_1E6B777E8;
        id v22 = v19;
        id v23 = v12;
        id v24 = self;
        id v25 = v14;
        id v13 = v18;
        id v26 = v13;
        unsigned __int8 v27 = v29;
        id v20 = v19;
        [(IMDServiceSession *)self storeMessage:v23 forceReplace:1 modifyError:1 modifyFlags:1 calculateUnreadCount:1 flagMask:32780 didReplaceBlock:0 shouldStoreBlock:0 didStoreBlock:0 block:v21];
      }
    }
  }
}

- (id)storageController
{
  return 0;
}

- (void)noteItemFromStorage:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDServiceSession *)self storageController];
  [v5 noteItemFromStorage:v4];
}

- (void)noteSuppressedMessageUpdate:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDServiceSession *)self storageController];
  [v5 noteSuppressedMessageUpdate:v4];
}

- (void)noteLastItemFromStorage:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDServiceSession *)self storageController];
  [v5 noteLastItemFromStorage:v4];
}

- (void)noteLastItemProcessed
{
  id v2 = [(IMDServiceSession *)self storageController];
  [v2 noteLastItemProcessed];
}

- (BOOL)isAwaitingStorageTimer
{
  id v2 = [(IMDServiceSession *)self storageController];
  char v3 = [v2 isAwaitingStorageTimer];

  return v3;
}

- (void)incrementPendingReadReceiptFromStorageCount
{
  id v2 = [(IMDServiceSession *)self storageController];
  [v2 incrementPendingReadReceiptFromStorageCount];
}

- (void)decrementPendingReadReceiptFromStorageCount
{
  id v2 = [(IMDServiceSession *)self storageController];
  [v2 decrementPendingReadReceiptFromStorageCount];
}

- (unint64_t)pendingReadReceiptFromStorageCount
{
  id v2 = [(IMDServiceSession *)self storageController];
  unint64_t v3 = [v2 pendingReadReceiptFromStorageCount];

  return v3;
}

- (void)setPendingReadReceiptFromStorageCount:(unint64_t)a3
{
  id v4 = [(IMDServiceSession *)self storageController];
  [v4 setPendingReadReceiptFromStorageCount:a3];
}

- (BOOL)_isMessageSWYSpamMessage:(id)a3 inChat:(id)a4
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 service];
  int v9 = [v8 isEqualToString:*MEMORY[0x1E4F6E1A0]];

  if (v9
    && [v6 containsRichLink]
    && ([v6 body],
        id v10 = objc_claimAutoreleasedReturnValue(),
        [v10 string],
        id v11 = objc_claimAutoreleasedReturnValue(),
        char v12 = objc_msgSend(v11, "im_matchesSOSMapURL"),
        v11,
        v10,
        (v12 & 1) == 0))
  {
    id v15 = [(IMDServiceSession *)self _predominantServiceForChat:v7 usingMessageThreshold:50];
    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412802;
        id v18 = v6;
        __int16 v19 = 2112;
        id v20 = v7;
        __int16 v21 = 2112;
        id v22 = v15;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Predominant service check for incoming message:%@ in chat:%@ was determined to be %@", (uint8_t *)&v17, 0x20u);
      }
    }
    char v13 = [v15 isEqualToString:*MEMORY[0x1E4F6E1B0]];
  }
  else
  {
    char v13 = 0;
  }

  return v13;
}

- (BOOL)_shouldShowSWYQuickActionForMessage:(id)a3 outAppName:(id *)a4 outBundleID:(id *)a5
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v30 = v7;
  if ([v7 containsRichLink])
  {
    id v28 = a5;
    unsigned __int8 v29 = a4;
    [v7 richLinkURLs];
    long long v35 = 0u;
    long long v36 = 0u;
    long long v33 = 0u;
    long long v34 = 0u;
    obuint64_t j = (id)objc_claimAutoreleasedReturnValue();
    id v8 = 0;
    int v9 = 0;
    char v10 = 0;
    uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v34;
      do
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v34 != v12) {
            objc_enumerationMutation(obj);
          }
          uint64_t v14 = *(void *)(*((void *)&v33 + 1) + 8 * i);
          id v15 = [MEMORY[0x1E4F6EA28] sharedManager];
          id v16 = [v15 lsAppRecordForURL:v14 checkInstalledAppsOnly:1];

          if (!v16
            || ([v16 localizedName],
                int v17 = objc_claimAutoreleasedReturnValue(),
                BOOL v18 = [v17 length] == 0,
                v17,
                v18))
          {
            uint64_t v23 = [v16 localizedName];
            BOOL v24 = [v23 length] == 0;

            if (v24 && IMOSLoggingEnabled())
            {
              id v25 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)long long buf = 0;
                _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Not showing quick action since we did not get an AppName", buf, 2u);
              }
            }
          }
          else
          {
            __int16 v19 = [MEMORY[0x1E4F6EA28] sharedManager];
            id v20 = [v16 bundleIdentifier];
            char v10 = [v19 showPinningStatusTextForBundleID:v20];

            uint64_t v21 = [v16 localizedName];

            uint64_t v22 = [v16 bundleIdentifier];

            id v8 = (id)v22;
            int v9 = (void *)v21;
          }
        }
        uint64_t v11 = [obj countByEnumeratingWithState:&v33 objects:v37 count:16];
      }
      while (v11);
    }

    if (v29 && v9) {
      *unsigned __int8 v29 = v9;
    }
    BOOL v26 = v10 & 1;
    if (v28 && v8)
    {
      id v8 = v8;
      id *v28 = v8;
    }
  }
  else
  {
    id v8 = 0;
    int v9 = 0;
    BOOL v26 = 0;
  }

  return v26;
}

- (id)_predominantServiceForChat:(id)a3 usingMessageThreshold:(unint64_t)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  int v7 = IMOSLoggingEnabled();
  if (v6 && a4)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = [v6 guid];
        int v19 = 138412290;
        id v20 = v9;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Identifying the predominant service for chat: %@", (uint8_t *)&v19, 0xCu);
      }
    }
    char v10 = (id *)MEMORY[0x1E4F6E1A0];
    uint64_t v11 = [(IMDServiceSession *)self _fetchMessagesFromChat:v6 onService:*MEMORY[0x1E4F6E1A0] numberOfMessages:50];
    uint64_t v12 = (id *)MEMORY[0x1E4F6E1B0];
    char v13 = [(IMDServiceSession *)self _fetchMessagesFromChat:v6 onService:*MEMORY[0x1E4F6E1B0] numberOfMessages:50];
    unint64_t v14 = [v11 count];
    if (v14 <= [v13 count]) {
      id v15 = v12;
    }
    else {
      id v15 = v10;
    }
    id v16 = *v15;
  }
  else
  {
    if (v7)
    {
      int v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Invalid chat or incorrect number of messages", (uint8_t *)&v19, 2u);
      }
    }
    id v16 = 0;
  }

  return v16;
}

- (id)_fetchMessagesFromChat:(id)a3 onService:(id)a4 numberOfMessages:(unint64_t)a5
{
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v8 = a4;
  int v9 = v8;
  long long v34 = v7;
  if (v7 && a5 && [v8 length])
  {
    long long v33 = v9;
    if ([v7 style] == 45)
    {
      char v10 = [v7 participants];
      if ([v10 count] == 1)
      {
        uint64_t v11 = [v7 participants];
        uint64_t v12 = [v11 firstObject];

        if (v12)
        {
          char v13 = +[IMDChatStore sharedInstance];
          unint64_t v14 = [v12 ID];
          uint64_t v15 = [v13 chatsWithHandle:v14 onService:v9];
LABEL_16:
          int v19 = (void *)v15;

LABEL_18:
          long long v38 = 0u;
          long long v39 = 0u;
          long long v36 = 0u;
          long long v37 = 0u;
          obuint64_t j = v19;
          int v17 = 0;
          uint64_t v20 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
          if (v20)
          {
            uint64_t v21 = *(void *)v37;
            do
            {
              for (uint64_t i = 0; i != v20; ++i)
              {
                if (*(void *)v37 != v21) {
                  objc_enumerationMutation(obj);
                }
                uint64_t v23 = *(void **)(*((void *)&v36 + 1) + 8 * i);
                id v24 = objc_alloc(MEMORY[0x1E4F6BF58]);
                id v25 = [v23 guid];
                BOOL v26 = (void *)[v24 initWithAssociatedChatGUID:v25];

                [v26 setBatchSize:a5];
                unsigned __int8 v27 = [v26 nextBatch];
                if (!v27 && IMOSLoggingEnabled())
                {
                  id v28 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
                  {
                    unsigned __int8 v29 = [v23 guid];
                    *(_DWORD *)long long buf = 134218242;
                    unint64_t v42 = a5;
                    __int16 v43 = 2112;
                    id v44 = v29;
                    _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Failed to fetch %lu number of messages from chat %@", buf, 0x16u);
                  }
                }
                if (!v17)
                {
                  int v17 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v27, "count"));
                }
                objc_msgSend(v17, "addObjectsFromArray:", v27, v33);
              }
              uint64_t v20 = [obj countByEnumeratingWithState:&v36 objects:v40 count:16];
            }
            while (v20);
          }

          goto LABEL_44;
        }
      }
      else
      {
      }
      if (IMOSLoggingEnabled())
      {
        id v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          unint64_t v42 = (unint64_t)v34;
          _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Incorrect chat %@, has more than the number of participants we expected!", buf, 0xCu);
        }
      }
    }
    else
    {
      if ([v7 style] != 43)
      {
        int v19 = 0;
        goto LABEL_18;
      }
      BOOL v18 = [v7 participants];
      uint64_t v12 = objc_msgSend(v18, "__imArrayByApplyingBlock:", &unk_1F3391CA0);

      if ((unint64_t)[v12 count] > 1)
      {
        char v13 = +[IMDChatStore sharedInstance];
        unint64_t v14 = [v7 groupID];
        uint64_t v15 = [v13 chatsWithHandles:v12 onService:v9 displayName:0 groupID:v14 style:43];
        goto LABEL_16;
      }
      if (IMOSLoggingEnabled())
      {
        unsigned __int8 v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          unint64_t v42 = (unint64_t)v7;
          _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Chat %@, has the wrong number of participants than what was expected!", buf, 0xCu);
        }
      }
    }
    int v17 = 0;
LABEL_44:
    int v9 = v33;
    goto LABEL_45;
  }
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412802;
      unint64_t v42 = (unint64_t)v7;
      __int16 v43 = 2112;
      id v44 = v9;
      __int16 v45 = 2048;
      unint64_t v46 = a5;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Invalid parameter. chatGUID: %@ service: %@ number of messages:%lu", buf, 0x20u);
    }
  }
  int v17 = 0;
LABEL_45:

  return v17;
}

- (void)_configureSyndicationRangesForMessage:(id)a3 forChat:(id)a4 withSyndicationStatus:(int64_t)a5
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v29 = a3;
  id v28 = a4;
  uint64_t v6 = [v28 autoDonationBehavior];
  int v7 = IMOSLoggingEnabled();
  if (v6 == 2)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Chat opted out of Auto donation. Not configuring syndication ranges", buf, 2u);
      }
    }
  }
  else
  {
    if (v7)
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [v29 guid];
        uint64_t v11 = [v28 guid];
        *(_DWORD *)long long buf = 138412546;
        id v38 = v10;
        __int16 v39 = 2112;
        uint64_t v40 = v11;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Configuring syndication ranges for incoming message:%@ in chat:%@", buf, 0x16u);
      }
    }
    id v12 = objc_alloc(MEMORY[0x1E4F6E830]);
    char v13 = [v29 body];
    unint64_t v14 = [v29 guid];
    unsigned __int8 v27 = (void *)[v12 initWithMessageBody:v13 messageGUID:v14];

    long long v34 = 0u;
    long long v35 = 0u;
    long long v32 = 0u;
    long long v33 = 0u;
    obuint64_t j = [v27 messageParts];
    id v15 = 0;
    uint64_t v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
    if (v16)
    {
      uint64_t v17 = *(void *)v33;
      do
      {
        uint64_t v18 = 0;
        do
        {
          if (*(void *)v33 != v17) {
            objc_enumerationMutation(obj);
          }
          int v19 = *(void **)(*((void *)&v32 + 1) + 8 * v18);
          id v20 = objc_alloc(MEMORY[0x1E4F6E880]);
          uint64_t v21 = [v19 messagePartRange];
          uint64_t v23 = v22;
          id v24 = objc_msgSend(MEMORY[0x1E4F1C9C8], "__im_dateWithCurrentServerTime");
          id v25 = objc_msgSend(v20, "initWithSyndicationType:messagePartRange:syndicationStartDate:syndicationStatus:assetDescriptor:", 0, v21, v23, v24, a5, 0);

          if (!v15) {
            id v15 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          }
          [v15 addObject:v25];

          ++v18;
        }
        while (v16 != v18);
        uint64_t v16 = [obj countByEnumeratingWithState:&v32 objects:v36 count:16];
      }
      while (v16);
    }

    BOOL v26 = (void *)[v15 copy];
    [v29 setSyndicationRanges:v26];
  }
}

- (void)deleteExistingMessageAwaitingReplacementWithFallbackHash:(id)a3 chatIdentifier:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = +[IMDChatRegistry sharedInstance];
  id v8 = [v7 existingiMessageChatForID:v6];

  int v9 = +[IMDMessageStore sharedInstance];
  id v10 = [v9 sortedMessageItemsWithFallbackHash:v5 inChat:v8 limit:1];
  uint64_t v11 = [v10 firstObject];

  if (v11)
  {
    id v12 = [v11 guid];
    char v13 = [v11 expectedServiceForCrossServiceReplacement];
    char v14 = [v13 isEqualToString:*MEMORY[0x1E4F6E1B8]];

    if (v14)
    {
      id v15 = +[IMDMessageStore sharedInstance];
      id v24 = v12;
      uint64_t v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v24 count:1];
      uint64_t v17 = [v15 deleteMessageGUIDs:v16 inChat:v8];

      if ([v17 count])
      {
        uint64_t v18 = +[IMDBroadcastController sharedProvider];
        int v19 = [v18 broadcasterForChatListeners];
        [v19 historicalMessageGUIDsDeleted:v17 chatGUIDs:0 queryID:0];

        id v20 = +[IMDChatRegistry sharedInstance];
        [v20 updateNotificationUnreadCountForChat:v8];
      }
      else if (IMOSLoggingEnabled())
      {
        uint64_t v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412290;
          id v26 = v12;
          _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "Failed to delete message with GUID %@", buf, 0xCu);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        id v26 = v12;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Message with GUID %@ not awaiting cross service replacement for iMessageLite", buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v26 = v5;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Failed to find message with fallback hash %@ to delete", buf, 0xCu);
    }
  }
}

- (BOOL)_shouldConvergeChatParticipants:(id)a3 withHandleInfo:(id)a4
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  int v7 = [MEMORY[0x1E4F6C360] sharedInstance];
  if ([v7 isInternalInstall])
  {
    char v8 = IMGetDomainBoolForKeyWithDefaultValue();

    LOBYTE(v9) = 0;
    if (v8) {
      goto LABEL_21;
    }
  }
  else
  {
  }
  if ([v6 count])
  {
    id v10 = objc_msgSend(v6, "__imArrayByApplyingBlock:", &unk_1F3391CC0);
    uint64_t v11 = [v5 participantHandles];
    uint64_t v12 = [v10 count];
    if (v12 == [v11 count])
    {
      long long v19 = 0u;
      long long v20 = 0u;
      long long v17 = 0u;
      long long v18 = 0u;
      id v13 = v11;
      uint64_t v9 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v9)
      {
        uint64_t v14 = *(void *)v18;
        while (2)
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v14) {
              objc_enumerationMutation(v13);
            }
            if (!objc_msgSend(v10, "containsObject:", *(void *)(*((void *)&v17 + 1) + 8 * i), (void)v17))
            {
              LOBYTE(v9) = 1;
              goto LABEL_19;
            }
          }
          uint64_t v9 = [v13 countByEnumeratingWithState:&v17 objects:v21 count:16];
          if (v9) {
            continue;
          }
          break;
        }
      }
LABEL_19:
    }
    else
    {
      LOBYTE(v9) = 1;
    }
  }
  else
  {
    LOBYTE(v9) = 0;
  }
LABEL_21:

  return v9;
}

- (void)_calculateHandleInfoOverrideIfPermittedForChatIdentifier:(id)a3 style:(unsigned __int8)a4 completion:(id)a5
{
  int v6 = a4;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v36 = a3;
  long long v35 = (void (**)(id, id))a5;
  int v7 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v8 = [v7 isInternalInstall];

  if (v6 == 43 && v8)
  {
    long long v34 = IMGetCachedDomainValueForKey();
    IMSetDomainValueForKey();
    objc_opt_class();
    uint64_t v9 = v34;
    if (objc_opt_isKindOfClass())
    {
      id v10 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v43 = 0u;
      long long v44 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      obuint64_t j = v34;
      uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
      if (v11)
      {
        uint64_t v12 = *(void *)v44;
        uint64_t v13 = *MEMORY[0x1E4F6C5C8];
        uint64_t v14 = *MEMORY[0x1E4F6C648];
        uint64_t v15 = *MEMORY[0x1E4F6C458];
        do
        {
          for (uint64_t i = 0; i != v11; ++i)
          {
            if (*(void *)v44 != v12) {
              objc_enumerationMutation(obj);
            }
            uint64_t v17 = *(void *)(*((void *)&v43 + 1) + 8 * i);
            v49[0] = v13;
            v49[1] = v14;
            v50[0] = v17;
            v50[1] = v17;
            v49[2] = v15;
            v50[2] = &unk_1F33C5E38;
            long long v18 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v50 forKeys:v49 count:3];
            [v10 addObject:v18];
          }
          uint64_t v11 = [obj countByEnumeratingWithState:&v43 objects:v51 count:16];
        }
        while (v11);
      }

      long long v19 = [MEMORY[0x1E4F6C418] sharedInstance];
      long long v20 = (void *)MEMORY[0x1E4F6C410];
      uint64_t v21 = [MEMORY[0x1E4F29128] UUID];
      uint64_t v22 = [v21 UUIDString];
      uint64_t v23 = NSString;
      id v24 = [obj componentsJoinedByString:@","];
      id v25 = [v23 stringWithFormat:@"I am overriding chat participants for %@ to %@. This was triggered by a regression test.", v36, v24];
      id v26 = [v20 userNotificationWithIdentifier:v22 title:@"I am doing something sneaky." message:v25 defaultButton:@"I did it!" alternateButton:@"I did not do that." otherButton:0];

      *(void *)__int16 v39 = 0;
      uint64_t v40 = v39;
      uint64_t v41 = 0x2020000000;
      char v42 = 0;
      v38[0] = MEMORY[0x1E4F143A8];
      v38[1] = 3221225472;
      v38[2] = sub_1D982D2A4;
      v38[3] = &unk_1E6B779C0;
      void v38[4] = v39;
      [v19 addUserNotification:v26 listener:0 completionHandler:v38];
      while (!v40[24])
      {
        uint64_t v27 = [MEMORY[0x1E4F1CAC0] mainRunLoop];
        id v28 = [MEMORY[0x1E4F1C9C8] now];
        id v29 = [v28 dateByAddingTimeInterval:0.5];
        [v27 runUntilDate:v29];
      }
      if ([v26 response])
      {
        if (IMOSLoggingEnabled())
        {
          id v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, " => rejected participant override", buf, 2u);
          }
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          long long v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            long long v33 = [obj componentsJoinedByString:@","];
            *(_DWORD *)long long buf = 138412290;
            long long v48 = v33;
            _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, " => !!! Overriding participants to %@ !!!", buf, 0xCu);
          }
        }
        v35[2](v35, v10);
      }
      _Block_object_dispose(v39, 8);
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_29:

        goto LABEL_30;
      }
      unsigned __int8 v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v39 = 0;
        _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, " => invalid chat override defaults set, ignoring", v39, 2u);
      }
    }
    uint64_t v9 = v34;
    goto LABEL_29;
  }
LABEL_30:
}

- (NSDictionary)buddyPictures
{
  return 0;
}

- (id)pictureOfBuddy:(id)a3
{
  return 0;
}

- (id)pictureKeyForBuddy:(id)a3
{
  return 0;
}

- (NSArray)allBuddies
{
  [(NSRecursiveLock *)self->_lock lock];
  unint64_t v3 = [(NSMutableDictionary *)self->_buddies allKeys];
  id v4 = (void *)[v3 copy];

  [(NSRecursiveLock *)self->_lock unlock];

  return (NSArray *)v4;
}

- (void)markBuddiesAsChanged:(id)a3
{
  locuint64_t k = self->_lock;
  id v5 = a3;
  [(NSRecursiveLock *)lock lock];
  [(IMDServiceSession *)self beginBuddyChanges];
  [(NSMutableSet *)self->_changedBuddies addObjectsFromArray:v5];

  [(IMDServiceSession *)self endBuddyChanges];
  int v6 = self->_lock;

  [(NSRecursiveLock *)v6 unlock];
}

- (void)beginBuddyChanges
{
  [(NSRecursiveLock *)self->_lock lock];
  int buddyChangeLevel = self->_buddyChangeLevel;
  self->_int buddyChangeLevel = buddyChangeLevel + 1;
  if (!buddyChangeLevel)
  {
    id v4 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    changedBuddies = self->_changedBuddies;
    self->_changedBuddies = v4;
  }
  locuint64_t k = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (void)changeProperty:(id)a3 ofBuddy:(id)a4 to:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(IMDServiceSession *)self canonicalFormOfID:v9];
  if ([v9 length])
  {
    if ([v8 length])
    {
      uint64_t v12 = *MEMORY[0x1E4F6C5C8];
      if ([v8 isEqualToString:*MEMORY[0x1E4F6C5C8]])
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            int v17 = 138412290;
            id v18 = v9;
            _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Tried to change IDProperty for buddy ID: %@   bailing", (uint8_t *)&v17, 0xCu);
          }
LABEL_15:
        }
      }
      else
      {
        [(NSRecursiveLock *)self->_lock lock];
        uint64_t v14 = [(NSMutableDictionary *)self->_buddies objectForKey:v11];
        uint64_t v15 = v14;
        if (v14)
        {
          id v16 = [v14 objectForKey:v8];
        }
        else
        {
          if (!v10)
          {
            [(NSRecursiveLock *)self->_lock unlock];
            goto LABEL_28;
          }
          uint64_t v15 = [MEMORY[0x1E4F1CA60] dictionary];
          [v15 setObject:v9 forKey:v12];
          [(NSMutableDictionary *)self->_buddies setObject:v15 forKey:v11];
          id v16 = 0;
        }
        if (v16 != v10 && ([v10 isEqual:v16] & 1) == 0)
        {
          if (v10) {
            [v15 setObject:v10 forKey:v8];
          }
          else {
            [v15 removeObjectForKey:v8];
          }
          [(IMDServiceSession *)self beginBuddyChanges];
          [(NSMutableSet *)self->_changedBuddies addObject:v11];
          [(IMDServiceSession *)self endBuddyChanges];
        }
        [(NSRecursiveLock *)self->_lock unlock];
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        int v17 = 138412290;
        id v18 = v9;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Tried to change empty property for buddy ID: %@", (uint8_t *)&v17, 0xCu);
      }
      goto LABEL_15;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v17 = 138412290;
      id v18 = v8;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Tried to change property %@ with nil buddy ID", (uint8_t *)&v17, 0xCu);
    }
    goto LABEL_15;
  }
LABEL_28:
}

- (void)clearPropertiesOfBuddy:(id)a3
{
  uint64_t v23 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(NSRecursiveLock *)self->_lock lock];
  id v5 = [(IMDServiceSession *)self canonicalFormOfID:v4];
  int v6 = [(NSMutableDictionary *)self->_buddies objectForKey:v5];
  int v7 = v6;
  if (v6)
  {
    id v8 = [v6 allKeys];
    long long v18 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = v9;
      uint64_t v16 = 8;
      id v17 = v4;
      id v11 = 0;
      uint64_t v12 = *(void *)v19;
      id v13 = (id)*MEMORY[0x1E4F6C5C8];
      do
      {
        uint64_t v14 = 0;
        uint64_t v15 = v11;
        do
        {
          if (*(void *)v19 != v12) {
            objc_enumerationMutation(v8);
          }
          id v11 = *(id *)(*((void *)&v18 + 1) + 8 * v14);

          if (v11 != v13) {
            [v7 removeObjectForKey:v11];
          }
          ++v14;
          uint64_t v15 = v11;
        }
        while (v10 != v14);
        uint64_t v10 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v10);

      id v4 = v17;
    }
    [(IMDServiceSession *)self beginBuddyChanges];
    [(NSMutableSet *)self->_changedBuddies addObject:v5];
    [(IMDServiceSession *)self endBuddyChanges];
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (void)endBuddyChanges
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  [(NSRecursiveLock *)self->_lock lock];
  int buddyChangeLevel = self->_buddyChangeLevel;
  if (buddyChangeLevel <= 0)
  {
    uint64_t v16 = [MEMORY[0x1E4F28B00] currentHandler];
    [v16 handleFailureInMethod:a2 object:self file:@"IMDServiceSession_BuddyList.m" lineNumber:169 description:@"Too many calls to [IMDService endBuddyChanges]!"];

    int buddyChangeLevel = self->_buddyChangeLevel;
  }
  int v5 = buddyChangeLevel - 1;
  self->_int buddyChangeLevel = v5;
  if (!v5)
  {
    if ([(NSMutableSet *)self->_changedBuddies count])
    {
      id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
      long long v17 = 0u;
      long long v18 = 0u;
      long long v19 = 0u;
      long long v20 = 0u;
      int v7 = [(NSMutableSet *)self->_changedBuddies allObjects];
      uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v8)
      {
        uint64_t v9 = v8;
        uint64_t v10 = *(void *)v18;
        do
        {
          for (uint64_t i = 0; i != v9; ++i)
          {
            if (*(void *)v18 != v10) {
              objc_enumerationMutation(v7);
            }
            uint64_t v12 = [(NSMutableDictionary *)self->_buddies objectForKey:*(void *)(*((void *)&v17 + 1) + 8 * i)];
            if (v12) {
              [v6 addObject:v12];
            }
          }
          uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        }
        while (v9);
      }

      id v13 = [(IMDServiceSession *)self broadcaster];
      uint64_t v14 = [(IMDServiceSession *)self accountID];
      [v13 account:v14 buddyPropertiesChanged:v6];
    }
    changedBuddies = self->_changedBuddies;
    self->_changedBuddies = 0;
  }
  [(NSRecursiveLock *)self->_lock unlock];
}

- (id)property:(id)a3 ofBuddy:(id)a4
{
  locuint64_t k = self->_lock;
  id v7 = a4;
  id v8 = a3;
  [(NSRecursiveLock *)lock lock];
  buddies = self->_buddies;
  uint64_t v10 = [(IMDServiceSession *)self canonicalFormOfID:v7];

  id v11 = [(NSMutableDictionary *)buddies objectForKey:v10];
  uint64_t v12 = [v11 objectForKey:v8];

  [(NSRecursiveLock *)self->_lock unlock];

  return v12;
}

- (id)localProperty:(id)a3 ofBuddy:(id)a4
{
  locuint64_t k = self->_lock;
  id v7 = a4;
  id v8 = a3;
  [(NSRecursiveLock *)lock lock];
  localProperties = self->_localProperties;
  uint64_t v10 = [(IMDServiceSession *)self canonicalFormOfID:v7];

  id v11 = [(NSMutableDictionary *)localProperties objectForKey:v10];
  uint64_t v12 = [v11 objectForKey:v8];

  [(NSRecursiveLock *)self->_lock unlock];

  return v12;
}

- (void)clearLocalProperties
{
  [(NSRecursiveLock *)self->_lock lock];
  localProperties = self->_localProperties;
  self->_localProperties = 0;

  locuint64_t k = self->_lock;

  [(NSRecursiveLock *)lock unlock];
}

- (id)localPropertiesOfBuddy:(id)a3
{
  locuint64_t k = self->_lock;
  id v5 = a3;
  [(NSRecursiveLock *)lock lock];
  id v6 = [(IMDServiceSession *)self canonicalFormOfID:v5];

  localProperties = self->_localProperties;
  if (!localProperties)
  {
    id v8 = (NSMutableDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    uint64_t v9 = self->_localProperties;
    self->_localProperties = v8;

    localProperties = self->_localProperties;
  }
  id v10 = [(NSMutableDictionary *)localProperties objectForKey:v6];
  if (!v10)
  {
    id v10 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    [(NSMutableDictionary *)self->_localProperties setObject:v10 forKey:v6];
  }
  [(NSRecursiveLock *)self->_lock unlock];

  return v10;
}

- (void)changeLocalProperty:(id)a3 ofBuddy:(id)a4 to:(id)a5
{
  id v12 = a5;
  locuint64_t k = self->_lock;
  id v9 = a4;
  id v10 = a3;
  [(NSRecursiveLock *)lock lock];
  id v11 = [(IMDServiceSession *)self localPropertiesOfBuddy:v9];

  if (v12) {
    [v11 setObject:v12 forKey:v10];
  }
  else {
    [v11 removeObjectForKey:v10];
  }

  [(NSRecursiveLock *)self->_lock unlock];
}

- (BOOL)hasCapability:(unint64_t)a3
{
  return (a3 & ~[(IMDServiceSession *)self capabilities]) == 0;
}

- (int64_t)maxSizePerAttachmentWithCount:(int)a3 forChat:(id)a4
{
  uint64_t v4 = *(void *)&a3;
  id v6 = a4;
  id v7 = [v6 lastAddressedLocalHandle];
  id v8 = [v6 lastAddressedSIMID];

  int64_t v9 = [(IMDServiceSession *)self maxSizePerAttachmentWithCount:v4 lastAddressedHandle:v7 lastAddressedSIMID:v8];
  return v9;
}

- (int64_t)maxSizePerAttachmentWithCount:(int)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5
{
  return 0x7FFFFFFFFFFFFFFFLL;
}

- (id)server
{
  return (id)[(NSString *)self->_serverHost stringByRemovingWhitespace];
}

- (void)setRegistrationStatus:(int64_t)a3 error:(int)a4 alertInfo:(id)a5
{
  uint64_t v5 = *(void *)&a4;
  id value = a5;
  id v8 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  int64_t v9 = [NSNumber numberWithInteger:a3];
  if (v9) {
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F6C7A8], v9);
  }

  id v10 = [NSNumber numberWithInt:v5];
  if (v10) {
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F6C798], v10);
  }

  if (value) {
    CFDictionarySetValue(v8, (const void *)*MEMORY[0x1E4F6C790], value);
  }
  id v11 = [(IMDServiceSession *)self account];
  id v12 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v8 forKey:*MEMORY[0x1E4F6C7A0]];
  [v11 writeAccountDefaults:v12];
}

- (int64_t)registrationStatus
{
  id v2 = [(IMDServiceSession *)self account];
  int64_t v3 = [v2 registrationStatus];

  return v3;
}

- (int)registrationError
{
  id v2 = [(IMDServiceSession *)self account];
  int v3 = [v2 registrationError];

  return v3;
}

- (NSDictionary)registrationAlertInfo
{
  id v2 = [(IMDServiceSession *)self account];
  int v3 = [v2 registrationAlertInfo];

  return (NSDictionary *)v3;
}

- (id)loginID
{
  int v3 = [(IMDServiceSession *)self account];
  uint64_t v4 = [v3 accountDefaults];
  uint64_t v5 = [v4 objectForKey:*MEMORY[0x1E4F6C738]];
  id v6 = [(IMDServiceSession *)self canonicalFormOfID:v5];

  return v6;
}

- (void)noteBadPassword
{
  self->_badPass = 1;
  password = self->_password;
  self->_password = 0;

  [(IMDServiceSession *)self disallowReconnection];
}

- (void)_abandonPWFetcher
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  pwRequestID = self->_pwRequestID;
  int v4 = IMOSLoggingEnabled();
  if (pwRequestID)
  {
    if (v4)
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = self->_pwRequestID;
        int v13 = 138412546;
        uint64_t v14 = (IMDServiceSession *)v6;
        __int16 v15 = 2112;
        uint64_t v16 = self;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Abandoning password fetcher with request ID: %@  session: %@", (uint8_t *)&v13, 0x16u);
      }
    }
    id v7 = [MEMORY[0x1E4F61760] sharedInstance];
    p_pwRequestID = &self->_pwRequestID;
    int64_t v9 = self->_pwRequestID;
    id v10 = [(IMDServiceSession *)self displayName];
    [v7 cancelRequestID:v9 serviceIdentifier:v10];

    id v11 = *p_pwRequestID;
    *p_pwRequestID = 0;
  }
  else if (v4)
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      uint64_t v14 = self;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "No pending password fetch requests for session: %@", (uint8_t *)&v13, 0xCu);
    }
  }
}

- (void)_abandonSystemProxySettingsFetcher
{
  [(IMSystemProxySettingsFetcher *)self->_systemProxySettingsFetcher setDelegate:0];
  systemProxySettingsFetcher = self->_systemProxySettingsFetcher;
  self->_systemProxySettingsFetcher = 0;
}

- (void)accountDefaultsChanged:(id)a3
{
}

- (unsigned)blockingMode
{
  return 0;
}

- (id)allowList
{
  return 0;
}

- (id)blockList
{
  return 0;
}

- (BOOL)blockIdleStatus
{
  return 0;
}

- (id)defaultChatSuffix
{
  return 0;
}

- (BOOL)shouldImitateGroupChatUsingChatRooms
{
  return 0;
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 joinProperties:(id)a7
{
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 joinProperties:(id)a9
{
}

- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChat:(id)a5 style:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = (objc_class *)objc_opt_class();
  uint64_t v14 = (objc_class *)objc_opt_class();
  InstanceMethod = class_getInstanceMethod(v14, sel_invitePersonInfo_withMessage_toChat_style_);
  if (class_getInstanceMethod(v13, sel_invitePersonInfo_withMessage_toChat_style_) == InstanceMethod)
  {
    long long v26 = 0u;
    long long v27 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    id v23 = v10;
    id v16 = v10;
    uint64_t v17 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
    if (v17)
    {
      uint64_t v18 = v17;
      uint64_t v19 = *(void *)v25;
      uint64_t v20 = *MEMORY[0x1E4F6C5C8];
      do
      {
        uint64_t v21 = 0;
        do
        {
          if (*(void *)v25 != v19) {
            objc_enumerationMutation(v16);
          }
          uint64_t v22 = [*(id *)(*((void *)&v24 + 1) + 8 * v21) objectForKey:v20];
          [(IMDServiceSession *)self invitePerson:v22 withMessage:v11 toChat:v12 style:v6];

          ++v21;
        }
        while (v18 != v21);
        uint64_t v18 = [v16 countByEnumeratingWithState:&v24 objects:v28 count:16];
      }
      while (v18);
    }

    id v10 = v23;
  }
}

- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a7;
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)__int16 v15 = 0;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "/*-------calling into sendGroupPhotoUpdate from legacy service session, please file a radar-------*/", v15, 2u);
    }
  }
}

- (void)_requestGroupPhotoResendForChatGUID:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v11 = 0;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "/*-------calling into _requestGroupPhotoResendForChatGUID from legacy service session, please file a radar-------*/", v11, 2u);
    }
  }
}

- (void)retryGroupPhotoUpload:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (IMOSLoggingEnabled())
  {
    __int16 v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v16 = 0;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "/*-------calling into retryGroupPhotoUpload from legacy service session, please file a radar-------*/", v16, 2u);
    }
  }
}

- (void)sendLazuliSpamReport:(id)a3 isBot:(BOOL)a4 spamType:(unint64_t)a5
{
  id v5 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "/*-------calling into sendLazuliSpamReport from legacy service session, please file a radar-------*/", v7, 2u);
    }
  }
}

- (_FZChatRoomValidity)validityOfChatRoomName:(id)a3
{
  return (_FZChatRoomValidity)0x20FFFFFFFFLL;
}

- (void)closeSessionForChat:(id)a3 chatGUID:(id)a4 didDeleteConversation:(BOOL)a5 style:(unsigned __int8)a6
{
  id v7 = a3;
  id v8 = a4;
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "/*-------calling into closeSessionForChat from legacy service session, please file a radar-------*/", v10, 2u);
    }
  }
}

- (void)joinChatID:(id)a3 handleInfo:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 groupID:(id)a7 lastAddressedHandle:(id)a8 lastAddressedSIMID:(id)a9 joinProperties:(id)a10
{
}

- (void)removeChatID:(id)a3 identifier:(id)a4 style:(unsigned __int8)a5
{
}

- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7
{
}

- (void)declineInvitationToChatID:(id)a3 identifier:(id)a4 style:(unsigned __int8)a5
{
}

- (void)sendMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
}

- (void)sendJunkReportMessage:(id)a3
{
}

- (void)setProperties:(id)a3 ofParticipant:(id)a4 inChatID:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7
{
}

- (void)closeSessionChatID:(id)a3 identifier:(id)a4 didDeleteConversation:(BOOL)a5 style:(unsigned __int8)a6
{
}

- (BOOL)sendNicknameUpdatesToPeerDevices:(id)a3 toDestinations:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "/*-------calling into sendNicknameUpdatesToPeerDevices: from service that doesn't support it. File a radar-------*/", v9, 2u);
    }
  }
  return 0;
}

- (void)sendNicknameInfoToChatID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v5 = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "/*-------calling into sendNicknameInfoToChatID: from service that doesn't support it. File a radar-------*/", v5, 2u);
    }
  }
}

- (BOOL)reflectMarkUnreadToPeerDevicesForMessageGUID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "/*-------calling into reflectMarkUnreadToPeerDevicesForMessageGUID: from service that doesn't support it. File a radar-------*/", v6, 2u);
    }
  }
  return 0;
}

- (BOOL)reflectRecoverChatToPeerDevicesForMessageGUID:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "/*-------calling into reflectRecoverChatToPeerDevicesForMessageGUID: from service that doesn't support it. File a radar-------*/", v6, 2u);
    }
  }
  return 0;
}

- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  id v15 = a9;
  id v16 = a10;
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v18 = 0;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "/*-------calling into sendEditedMessage: from service that doesn't support it. File a radar-------*/", v18, 2u);
    }
  }
}

- (id)groupIDForChat:(id)a3
{
  id v4 = a3;
  if ([(IMDServiceSession *)self isReplicating])
  {
    id v5 = [(IMDServiceSession *)self mainSession];
    id v6 = [v5 groupIDForChat:v4];

    id v7 = [v4 groupID];
    char v8 = [v6 isEqualToString:v7];

    if ((v8 & 1) == 0)
    {
      id v9 = +[IMDChatRegistry sharedInstance];
      [v9 _setGroupID:v6 forChatAndAllSiblings:v4];
    }
  }
  else
  {
    id v6 = [v4 groupID];
  }

  return v6;
}

+ (id)_firewallUserNotificationForService:(id)a3
{
  return 0;
}

- (BOOL)warnIfPortBlocked:(int)a3 forAction:(id)a4
{
  return 0;
}

- (void)userNotificationDidFinish:(id)a3
{
  id v5 = a3;
  id v4 = [v5 identifier];
  if ([v4 isEqual:@"__ksFirewallUserNotificationIdentifier"]) {
    [(IMDServiceSession *)self _handleFirewallUserNotificationDidFinish:v5];
  }
}

+ (void)initialize
{
  if ((id)objc_opt_class() == a1)
  {
    id v2 = (void *)qword_1EBE2BC48;
    qword_1EBE2BC48 = @"Not Connected";

    id v3 = (void *)qword_1EBE2BC50;
    qword_1EBE2BC50 = @"Unexpectedly disconnected";

    id v4 = (void *)qword_1EBE2BC58;
    qword_1EBE2BC58 = @"Disconnecting...";

    id v5 = (void *)qword_1EBE2BC60;
    qword_1EBE2BC60 = @"Connecting...";

    id v6 = (void *)qword_1EBE2BC68;
    qword_1EBE2BC68 = @"Connecfted";
  }
}

- (void)disallowReconnection
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [(IMDAccount *)self->_account accountID];
      int v5 = 138412290;
      id v6 = v4;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "-[IMDServiceSession disallowReconnection] %@", (uint8_t *)&v5, 0xCu);
    }
  }
  self->_shouldReconnect = 0;
  [(IMDServiceSession *)self _clearAutoReconnectTimer];
}

- (void)autoReconnect
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (self->_activated)
  {
    long long v10 = 0u;
    long long v11 = 0u;
    long long v8 = 0u;
    long long v9 = 0u;
    id v3 = [(IMDServiceSession *)self accounts];
    uint64_t v4 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
    if (v4)
    {
      uint64_t v5 = v4;
      uint64_t v6 = *(void *)v9;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v9 != v6) {
            objc_enumerationMutation(v3);
          }
          [(IMDServiceSession *)self autoReconnectWithAccount:*(void *)(*((void *)&v8 + 1) + 8 * i)];
        }
        uint64_t v5 = [v3 countByEnumeratingWithState:&v8 objects:v12 count:16];
      }
      while (v5);
    }
  }
}

- (void)autoReconnectWithAccount:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = [v4 loginID];
        uint64_t v7 = [v4 accountID];
        int v14 = 138412546;
        id v15 = v6;
        __int16 v16 = 2112;
        uint64_t v17 = v7;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEBUG, "Auto-Reconnect Request: %@:%@", (uint8_t *)&v14, 0x16u);
      }
    }
    if ([(IMDServiceSession *)self accountShouldBeAlwaysLoggedIn])
    {
      if ([(IMDServiceSession *)self networkConditionsAllowLogin])
      {
        if ((unint64_t)[v4 loginStatus] <= 2)
        {
          if (IMOSLoggingEnabled())
          {
            long long v8 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
            {
              id v9 = [v4 loginID];
              long long v10 = [v4 accountID];
              int v14 = 138412546;
              id v15 = v9;
              __int16 v16 = 2112;
              uint64_t v17 = v10;
              _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_DEBUG, "Reconnecting account: %@:%@", (uint8_t *)&v14, 0x16u);
            }
          }
          [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_loginWithAccount_ object:0];
          [(IMDServiceSession *)self performSelector:sel_loginWithAccount_ withObject:v4 afterDelay:1.0];
        }
      }
      else if (IMOSLoggingEnabled())
      {
        long long v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          id v12 = [v4 loginID];
          uint64_t v13 = [v4 accountID];
          int v14 = 138412546;
          id v15 = v12;
          __int16 v16 = 2112;
          uint64_t v17 = v13;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_DEBUG, "Auto-Reconnect failed (Network conditions don't allow it): %@:%@", (uint8_t *)&v14, 0x16u);
        }
      }
    }
  }
}

- (void)_doLoginIgnoringProxy:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  uint64_t v5 = [(IMDServiceSession *)self accounts];
  uint64_t v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v11;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v11 != v8) {
          objc_enumerationMutation(v5);
        }
        [(IMDServiceSession *)self _doLoginIgnoringProxy:v3 withAccount:*(void *)(*((void *)&v10 + 1) + 8 * v9++)];
      }
      while (v7 != v9);
      uint64_t v7 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v7);
  }
}

- (void)_doLoginIgnoringProxy:(BOOL)a3 withAccount:(id)a4
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  if (self->_activated)
  {
    BOOL v67 = a3;
    [(NSRecursiveLock *)self->_lock lock];
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEBUG))
      {
        id v8 = [v6 loginID];
        id v9 = [v6 accountID];
        *(_DWORD *)long long buf = 138412802;
        id v70 = v8;
        __int16 v71 = 2112;
        id v72 = v9;
        __int16 v73 = 2048;
        uint64_t v74 = [v6 loginStatus];
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_DEBUG, "Do Login: %@:%@  (serviceLoginStatus: %lu)", buf, 0x20u);
      }
    }
    if ((unint64_t)[v6 loginStatus] > 1)
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_61:
        [(NSRecursiveLock *)self->_lock unlock];
        goto LABEL_62;
      }
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
      {
        id v23 = [(IMDServiceSession *)self loginID];
        id v24 = [(IMDAccount *)self->_account accountID];
        unint64_t v25 = [(IMDAccount *)self->_account loginStatus];
        *(_DWORD *)long long buf = 138412802;
        id v70 = v23;
        __int16 v71 = 2112;
        id v72 = v24;
        __int16 v73 = 2048;
        uint64_t v74 = v25;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_DEBUG, "Ignoring Login: %@:%@  (serviceLoginStatus: %lu)", buf, 0x20u);
      }
LABEL_60:

      goto LABEL_61;
    }
    [(IMDServiceSession *)self refreshServiceCapabilities];
    loginID = self->_loginID;
    self->_loginID = 0;

    serverHost = self->_serverHost;
    self->_serverHost = 0;

    proxyHost = self->_proxyHost;
    self->_proxyHost = 0;

    proxyAccount = self->_proxyAccount;
    self->_proxyAccount = 0;

    proxyPassword = self->_proxyPassword;
    self->_proxyPassword = 0;

    uint64_t v15 = [(IMDServiceSession *)self accountDefaults];
    __int16 v16 = [(IMDServiceSession *)self loginID];
    uint64_t v17 = self->_loginID;
    self->_loginID = v16;

    uint64_t v18 = [v15 objectForKey:*MEMORY[0x1E4F6C810]];
    self->_useSSL = [v18 BOOLValue];

    if (self->_useSSL)
    {
      uint64_t v65 = *MEMORY[0x1E4F6C7D0];
      uint64_t v19 = -[NSObject objectForKey:](v15, "objectForKey:");
      uint64_t v20 = [v19 stringByRemovingWhitespace];

      uint64_t v64 = *MEMORY[0x1E4F6C7D8];
      uint64_t v21 = -[NSObject objectForKey:](v15, "objectForKey:");
      long long v68 = [(IMDServiceSession *)self service];
      if ([v20 length])
      {
        BOOL v22 = 0;
      }
      else
      {
        unsigned __int8 v31 = [v68 defaultAccountSettings];
        long long v32 = [v31 objectForKey:v65];
        long long v33 = [v32 stringByRemovingWhitespace];

        BOOL v22 = [v33 length] != 0;
        uint64_t v20 = v33;
      }
      if ([v20 length])
      {
        long long v34 = v20;
      }
      else
      {
        long long v35 = [v15 objectForKey:*MEMORY[0x1E4F6C7C0]];
        long long v34 = [v35 stringByRemovingWhitespace];

        if ([v34 length]) {
          BOOL v22 = 1;
        }
      }
      if ([v34 length])
      {
        long long v27 = v34;
      }
      else
      {
        id v36 = [v68 defaultAccountSettings];
        long long v37 = [v36 objectForKey:*MEMORY[0x1E4F6C7C0]];
        long long v27 = [v37 stringByRemovingWhitespace];

        if ([v27 length]) {
          BOOL v22 = 1;
        }
      }
      if ([v21 intValue])
      {
        id v38 = v21;
      }
      else
      {
        __int16 v39 = [v68 defaultAccountSettings];
        id v38 = [v39 objectForKey:v64];

        if ([v38 intValue]) {
          BOOL v22 = 1;
        }
      }
      if ([v38 intValue])
      {
        uint64_t v40 = v38;
      }
      else
      {
        uint64_t v40 = [v15 objectForKey:*MEMORY[0x1E4F6C7C8]];

        if ([v40 intValue]) {
          BOOL v22 = 1;
        }
      }
      if ([v40 intValue])
      {
        uint64_t v41 = v40;
      }
      else
      {
        char v42 = [v68 defaultAccountSettings];
        uint64_t v41 = [v42 objectForKey:*MEMORY[0x1E4F6C7C8]];

        if ([v41 intValue]) {
          BOOL v22 = 1;
        }
      }
      objc_storeStrong((id *)&self->_serverHost, v27);
      self->_serverPort = [v41 intValue];
      if (v27) {
        BOOL v43 = v22;
      }
      else {
        BOOL v43 = 0;
      }
      if (!v43 || !v41) {
        goto LABEL_55;
      }
      long long v44 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v27, v65, v41, v64, 0);
      long long v45 = [(IMDServiceSession *)self account];
      [v45 writeAccountDefaults:v44];
    }
    else
    {
      uint64_t v66 = *MEMORY[0x1E4F6C7C0];
      long long v26 = -[NSObject objectForKey:](v15, "objectForKey:");
      long long v27 = [v26 stringByRemovingWhitespace];

      uint64_t v28 = *MEMORY[0x1E4F6C7C8];
      uint64_t v29 = [v15 objectForKey:*MEMORY[0x1E4F6C7C8]];
      long long v68 = [(IMDServiceSession *)self service];
      if ([v27 length])
      {
        BOOL v30 = 0;
      }
      else
      {
        long long v46 = [v68 defaultAccountSettings];
        uint64_t v47 = [v46 objectForKey:v66];
        long long v48 = [v47 stringByRemovingWhitespace];

        BOOL v30 = [v48 length] != 0;
        long long v27 = v48;
      }
      if ([v29 intValue])
      {
        uint64_t v41 = v29;
      }
      else
      {
        id v49 = [v68 defaultAccountSettings];
        uint64_t v41 = [v49 objectForKey:v28];

        if ([v41 intValue]) {
          BOOL v30 = 1;
        }
      }
      objc_storeStrong((id *)&self->_serverHost, v27);
      self->_serverPort = [v41 intValue];
      if (v27) {
        BOOL v50 = v30;
      }
      else {
        BOOL v50 = 0;
      }
      if (!v50 || !v41) {
        goto LABEL_55;
      }
      long long v44 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v27, v66, v41, v28, 0);
      long long v45 = [(IMDServiceSession *)self account];
      [v45 writeAccountDefaults:v44];
    }

LABEL_55:
    if (v67
      || ([v15 objectForKey:*MEMORY[0x1E4F6C800]],
          id v51 = objc_claimAutoreleasedReturnValue(),
          int v52 = [v51 BOOLValue],
          v51,
          !v52))
    {
      self->_proxyType = 4;
      [(IMDServiceSession *)self _login_serverSettingsReadyWithAccount:v6];
    }
    else
    {
      unsigned __int8 v53 = [v15 objectForKey:*MEMORY[0x1E4F6C808]];
      int v54 = [v53 BOOLValue];

      if (v54)
      {
        [(IMDServiceSession *)self _abandonSystemProxySettingsFetcher];
        id v55 = objc_alloc(MEMORY[0x1E4F6C3E8]);
        uint64_t v56 = [(IMDServiceSession *)self server];
        id v57 = (IMSystemProxySettingsFetcher *)[v55 initWithHost:v56 port:self->_serverPort delegate:self];
        systemProxySettingsFetcher = self->_systemProxySettingsFetcher;
        self->_systemProxySettingsFetcher = v57;

        [(IMSystemProxySettingsFetcher *)self->_systemProxySettingsFetcher retrieveProxySettings];
      }
      else
      {
        id v59 = [v15 objectForKey:*MEMORY[0x1E4F6C780]];
        self->_proxyType = (int)[v59 intValue];

        uint64_t v60 = [v15 objectForKey:*MEMORY[0x1E4F6C770]];
        id v61 = [v60 stringByRemovingWhitespace];
        uint64_t v62 = self->_proxyHost;
        self->_proxyHost = v61;

        id v63 = [v15 objectForKey:*MEMORY[0x1E4F6C778]];
        self->_proxyPort = [v63 intValue];

        [(IMDServiceSession *)self _login_serverSettingsReadyWithAccount:v6];
      }
    }
    goto LABEL_60;
  }
LABEL_62:
}

- (void)_login_serverSettingsReadyWithAccount:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = [(IMDServiceSession *)self loginID];
        uint64_t v7 = [(IMDAccount *)self->_account accountID];
        int v21 = 138412546;
        BOOL v22 = v6;
        __int16 v23 = 2112;
        id v24 = v7;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEBUG, "_login_serverSettingsReadyWithAccount: %@:%@", (uint8_t *)&v21, 0x16u);
      }
    }
    id v8 = [(IMDServiceSession *)self server];
    id v9 = [(IMDServiceSession *)self service];
    int v10 = [v9 requiresHost];

    if ([v8 length]) {
      int v11 = 0;
    }
    else {
      int v11 = v10;
    }
    if (v11 == 1)
    {
      long long v12 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v13 = [v12 localizedStringForKey:@"The account name or server is not valid." value:&stru_1F3398578 table:@"DaemonCoreLocalizable"];

      if (IMOSLoggingEnabled())
      {
        int v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_DEBUG, "  setting service status to disconnected, account or server is invalid", (uint8_t *)&v21, 2u);
        }
      }
      [v4 _forceSetLoginStatus:1 message:v13 reason:0 properties:0];
      [(IMDServiceSession *)self disallowReconnection];

      goto LABEL_25;
    }
    networkMonitor = self->_networkMonitor;
    if (!networkMonitor) {
      goto LABEL_19;
    }
    if (([(IMNetworkMonitor *)networkMonitor immediatelyReachable] & 1) == 0
      && ![(IMDServiceSession *)self overrideNetworkAvailability])
    {
      uint64_t v19 = IMDaemonCoreBundle();
      uint64_t v20 = [v19 localizedStringForKey:@"A network error occurred.\n" value:&stru_1F3398578 table:@"DaemonCoreLocalizable"];

      [v4 _forceSetLoginStatus:0 message:v20 reason:0 properties:0];
      goto LABEL_25;
    }
    if (!self->_networkMonitor)
    {
LABEL_19:
      __int16 v16 = [(IMDServiceSession *)self service];
      char v17 = [v16 ignoresNetworkConnectivity];

      if ((v17 & 1) == 0 && IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          int v21 = 138412290;
          BOOL v22 = self;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "****** No IMNetworkMonitor for login of account: %@", (uint8_t *)&v21, 0xCu);
        }
      }
    }
    [(IMDServiceSession *)self _data_connection_readyWithAccount:v4];
LABEL_25:
  }
}

- (void)_data_connection_readyWithAccount:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = [(IMDServiceSession *)self loginID];
        uint64_t v7 = [(IMDAccount *)self->_account accountID];
        *(_DWORD *)long long buf = 138412546;
        id v16 = v6;
        __int16 v17 = 2112;
        uint64_t v18 = v7;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEBUG, "_data_connection_ready: %@:%@", buf, 0x16u);
      }
    }
    if (!self->_shouldReconnect)
    {
      password = self->_password;
      self->_password = 0;
    }
    if ([(IMDServiceSession *)self accountNeedsPassword] && !self->_password)
    {
      [(IMDServiceSession *)self _abandonPWFetcher];
      id v9 = [MEMORY[0x1E4F61760] sharedInstance];
      loginID = self->_loginID;
      int v11 = [(IMDServiceSession *)self service];
      long long v12 = [v11 internalName];
      v13[0] = MEMORY[0x1E4F143A8];
      v13[1] = 3221225472;
      v13[2] = sub_1D98690A0;
      v13[3] = &unk_1E6B78310;
      v13[4] = self;
      id v14 = v4;
      [v9 fetchPasswordForProfileID:0 username:loginID service:v12 outRequestID:0 completionBlock:v13];
    }
    else
    {
      [(IMDServiceSession *)self _login_usernameAndPasswordReadyWithAccount:v4];
    }
  }
}

- (void)_login_usernameAndPasswordReadyWithAccount:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        id v6 = [v4 loginID];
        uint64_t v7 = [v4 accountID];
        int v12 = 138412546;
        id v13 = v6;
        __int16 v14 = 2112;
        uint64_t v15 = v7;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_DEBUG, "_login_usernameAndPasswordReady: %@:%@", (uint8_t *)&v12, 0x16u);
      }
    }
    if (self->_proxyType == 4)
    {
      [(IMDServiceSession *)self _login_checkUsernameAndPasswordWithAccount:v4];
    }
    else
    {
      systemProxySettingsFetcher = self->_systemProxySettingsFetcher;
      if (!systemProxySettingsFetcher)
      {
        uint64_t v9 = [objc_alloc(MEMORY[0x1E4F6C3E8]) initWithProxyProtocol:self->_proxyType proxyHost:self->_proxyHost proxyPort:self->_proxyPort delegate:self];
        p_systemProxySettingsFetcher = &self->_systemProxySettingsFetcher;
        int v11 = *p_systemProxySettingsFetcher;
        *p_systemProxySettingsFetcher = (IMSystemProxySettingsFetcher *)v9;

        systemProxySettingsFetcher = *p_systemProxySettingsFetcher;
      }
      [(IMSystemProxySettingsFetcher *)systemProxySettingsFetcher retrieveProxyAccountSettings];
    }
  }
}

- (void)_login_checkUsernameAndPasswordWithAccount:(id)a3
{
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v30 = a3;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_DEBUG))
      {
        uint64_t v5 = [(IMDServiceSession *)self loginID];
        id v6 = [(IMDAccount *)self->_account accountID];
        NSUInteger v7 = [(NSString *)self->_password length];
        id v8 = @"YES";
        BOOL badPass = self->_badPass;
        *(_DWORD *)long long buf = 138413058;
        if (v7) {
          int v10 = @"YES";
        }
        else {
          int v10 = @"NO";
        }
        long long v35 = v5;
        if (!badPass) {
          id v8 = @"NO";
        }
        __int16 v36 = 2112;
        long long v37 = v6;
        __int16 v38 = 2112;
        __int16 v39 = v10;
        __int16 v40 = 2112;
        uint64_t v41 = v8;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_DEBUG, "_login_checkUsernameAndPassword: %@:%@  has pass: %@   bad pass: %@", buf, 0x2Au);
      }
    }
    if (([(NSString *)self->_password length]
       || ![(IMDServiceSession *)self accountNeedsPassword])
      && ([(NSString *)self->_loginID length]
       || ![(IMDServiceSession *)self accountNeedsLogin])
      && !self->_badPass)
    {
      if ([(IMDServiceSession *)self networkConditionsAllowLogin])
      {
        if ((unint64_t)[v30 loginStatus] > 3)
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_30;
          }
          uint64_t v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_DEBUG, "Strange, we're here, but already logged in", buf, 2u);
          }
        }
        else
        {
          if (self->_activated)
          {
            [v30 setLoginStatus:3 message:0];
            [(IMDServiceSession *)self loginServiceSessionWithAccount:v30];
            goto LABEL_30;
          }
          if (!IMOSLoggingEnabled()) {
            goto LABEL_30;
          }
          uint64_t v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_DEBUG, "Skipping login, we're not activated", buf, 2u);
          }
        }
      }
      else
      {
        if (!IMOSLoggingEnabled()) {
          goto LABEL_30;
        }
        uint64_t v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_DEBUG, "_login_checkUsernameAndPassword: networkMonitor says we're not reachable", buf, 2u);
        }
      }

      goto LABEL_30;
    }
    if ([(IMDServiceSession *)self accountNeedsPassword])
    {
      if (IMOSLoggingEnabled())
      {
        int v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEBUG))
        {
          NSUInteger v12 = [(NSString *)self->_password length];
          NSUInteger v13 = [(NSString *)self->_loginID length];
          __int16 v14 = @"YES";
          BOOL v15 = self->_badPass;
          if (v12) {
            uint64_t v16 = @"YES";
          }
          else {
            uint64_t v16 = @"NO";
          }
          *(_DWORD *)long long buf = 138413058;
          long long v35 = self;
          if (v13) {
            __int16 v17 = @"YES";
          }
          else {
            __int16 v17 = @"NO";
          }
          __int16 v36 = 2112;
          if (!v15) {
            __int16 v14 = @"NO";
          }
          long long v37 = v16;
          __int16 v38 = 2112;
          __int16 v39 = v17;
          __int16 v40 = 2112;
          uint64_t v41 = v14;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_DEBUG, "Building password notification dialog for: %@   (has pass: %@   has login: %@  bad pass: %@)", buf, 0x2Au);
        }
      }
      unint64_t v18 = [(IMDServiceSession *)self capabilities];
      uint64_t v19 = [(IMDServiceSession *)self displayName];
      p_pwRequestID = &self->_pwRequestID;
      int v21 = self->_pwRequestID;
      [(IMDServiceSession *)self _abandonPWFetcher];
      BOOL v22 = [MEMORY[0x1E4F61760] sharedInstance];
      loginID = self->_loginID;
      p_BOOL badPass = &self->_badPass;
      BOOL v25 = self->_badPass;
      long long v33 = v21;
      v31[0] = MEMORY[0x1E4F143A8];
      v31[1] = 3221225472;
      v31[2] = sub_1D9869914;
      v31[3] = &unk_1E6B78338;
      v31[4] = self;
      id v32 = v30;
      [v22 requestPasswordForUsername:loginID service:v19 badPassword:v25 showForgotPassword:(v18 >> 31) & 1 shouldRememberPassword:1 outRequestID:&v33 completionBlock:v31];
      long long v26 = v33;

      long long v27 = *p_pwRequestID;
      *p_pwRequestID = v26;
      uint64_t v28 = v26;

      *p_BOOL badPass = 0;
    }
  }
LABEL_30:
}

- (void)systemProxySettingsFetcher:(id)a3 retrievedHost:(id)a4 port:(unsigned __int16)a5 protocol:(int64_t)a6
{
  id v10 = a3;
  id v11 = a4;
  if (self->_activated)
  {
    if (a6 == 4)
    {
      systemProxySettingsFetcher = self->_systemProxySettingsFetcher;
      self->_systemProxySettingsFetcher = 0;

      [(IMDServiceSession *)self _updateNetworkMonitorFromAccountDefaultsIgnoringProxy:1];
    }
    else
    {
      [(IMDServiceSession *)self _updateNetworkMonitorWithRemoteHost:v11];
    }
    self->_proxyType = a6;
    objc_storeStrong((id *)&self->_proxyHost, a4);
    self->_proxyPort = a5;
    im_dispatch_after();
  }
}

- (void)systemProxySettingsFetcher:(id)a3 retrievedAccount:(id)a4 password:(id)a5
{
  id v12 = a4;
  id v8 = a5;
  if (self->_activated)
  {
    objc_storeStrong((id *)&self->_proxyAccount, a4);
    objc_storeStrong((id *)&self->_proxyPassword, a5);
    systemProxySettingsFetcher = self->_systemProxySettingsFetcher;
    self->_systemProxySettingsFetcher = 0;

    id v10 = +[IMDAccountController sharedAccountController];
    id v11 = [v10 accountForAccountID:v12];

    if (!v11)
    {
      id v11 = [(IMDServiceSession *)self account];
    }
    [(IMDServiceSession *)self _login_checkUsernameAndPasswordWithAccount:v11];
  }
}

- (void)autoLogin
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  if (self->_activated)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
      {
        id v4 = [(IMDServiceSession *)self loginID];
        uint64_t v5 = [(IMDAccount *)self->_account accountID];
        int v10 = 138412546;
        id v11 = v4;
        __int16 v12 = 2112;
        NSUInteger v13 = v5;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_DEBUG, "autoLogin: %@:%@", (uint8_t *)&v10, 0x16u);
      }
    }
    id v6 = [(IMDServiceSession *)self accountID];
    if (![v6 length])
    {

      return;
    }
    NSUInteger v7 = [(IMDServiceSession *)self accountDefaults];
    id v8 = [v7 objectForKey:*MEMORY[0x1E4F6C6D8]];
    if ([v8 BOOLValue])
    {
    }
    else
    {
      BOOL v9 = [(IMDServiceSession *)self accountShouldBeAlwaysLoggedIn];

      if (!v9) {
        return;
      }
    }
    [(IMDServiceSession *)self login];
  }
}

- (void)login
{
  id v3 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self loginWithAccount:v3];
}

- (void)loginWithAccount:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_activated)
  {
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_loginWithAccount_ object:0];
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v6 = [(IMDServiceSession *)self loginID];
        NSUInteger v7 = [(IMDAccount *)self->_account accountID];
        int v8 = 138412546;
        id v9 = v6;
        __int16 v10 = 2112;
        id v11 = v7;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Login request: %@:%@ (Setting should reconnect flag = YES)", (uint8_t *)&v8, 0x16u);
      }
    }
    self->_shouldReconnect = 1;
    [(IMDServiceSession *)self _setAutoReconnectTimer];
    [(IMDServiceSession *)self _doLoginIgnoringProxy:0 withAccount:v4];
  }
}

- (void)logoutServiceSessionWithAccount:(id)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412546;
        NSUInteger v13 = self;
        __int16 v14 = 2112;
        id v15 = v4;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "-[IMDServiceSession logoutServiceSession]: %@, account:%@", (uint8_t *)&v12, 0x16u);
      }
    }
    if (self->_systemProxySettingsFetcher)
    {
      [(IMDServiceSession *)self _abandonSystemProxySettingsFetcher];
      [v4 _forceSetLoginStatus:0 message:0 reason:0 properties:0];
    }
    [(IMDServiceSession *)self _abandonPWFetcher];
    if ([v4 loginStatus]) {
      [v4 _forceSetLoginStatus:0 message:0 reason:0 properties:0];
    }
    if (!self->_shouldReconnect)
    {
      password = self->_password;
      self->_password = 0;

      serverHost = self->_serverHost;
      self->_serverHost = 0;
    }
    loginID = self->_loginID;
    self->_loginID = 0;

    proxyHost = self->_proxyHost;
    self->_proxyHost = 0;

    proxyAccount = self->_proxyAccount;
    self->_proxyAccount = 0;

    proxyPassword = self->_proxyPassword;
    self->_proxyPassword = 0;

    self->_saveKeychainPassword = 0;
    if ([(IMDServiceSession *)self accountShouldBeAlwaysLoggedIn])
    {
      [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel_login object:0];
      [(IMDServiceSession *)self performSelector:sel_login withObject:0 afterDelay:1.0];
    }
    if (self->_shouldReconnect) {
      [(IMDServiceSession *)self _setAutoReconnectTimer];
    }
    else {
      [(IMDServiceSession *)self _clearAutoReconnectTimer];
    }
  }
}

- (void)logout
{
  id v3 = [(IMDServiceSession *)self account];
  [(IMDServiceSession *)self logoutWithAccount:v3];
}

- (void)logoutWithAccount:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      BOOL activated = self->_activated;
      *(_DWORD *)uint64_t v16 = 138412802;
      if (activated) {
        NSUInteger v7 = @"YES";
      }
      else {
        NSUInteger v7 = @"NO";
      }
      *(void *)&v16[4] = self;
      __int16 v17 = 2112;
      id v18 = v4;
      __int16 v19 = 2112;
      uint64_t v20 = v7;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "-[%@ logoutWithAccount:%@] (BOOL activated = %@)", v16, 0x20u);
    }
  }
  if (self->_activated)
  {
    BOOL v8 = [(IMDServiceSession *)self accountShouldBeAlwaysLoggedIn];
    int v9 = IMOSLoggingEnabled();
    if (v8)
    {
      if (v9)
      {
        __int16 v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          id v11 = [(IMDServiceSession *)self loginID];
          *(_DWORD *)uint64_t v16 = 138412290;
          *(void *)&v16[4] = v11;
          _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Tried to logout: %@  but we're not supposed to, reflecting this!", v16, 0xCu);
        }
      }
      if (objc_msgSend(v4, "loginStatus", *(void *)v16))
      {
        int v12 = [(IMDServiceSession *)self broadcaster];
        NSUInteger v13 = [v4 accountID];
        [v12 account:v13 loginStatusChanged:4 message:@"<<Connected>>" reason:0xFFFFFFFFLL properties:0];
      }
    }
    else
    {
      if (v9)
      {
        __int16 v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          id v15 = [(IMDServiceSession *)self loginID];
          *(_DWORD *)uint64_t v16 = 138412290;
          *(void *)&v16[4] = v15;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "** %@: clearing _shouldReconnectFlag at logout", v16, 0xCu);
        }
      }
      [(IMDServiceSession *)self disallowReconnection];
      [(IMDServiceSession *)self logoutServiceSessionWithAccount:v4];
    }
  }
}

- (void)serviceSessionDidLoginWithAccount:(id)a3
{
  if (self->_activated)
  {
    [a3 _forceSetLoginStatus:4 message:0 reason:0xFFFFFFFFLL properties:0];
    [(IMDServiceSession *)self _clearAutoReconnectTimer];
    [(IMDServiceSession *)self _abandonPWFetcher];
  }
}

- (void)serviceSessionDidLogoutWithAccount:(id)a3
{
  if (self->_activated)
  {
    [a3 _forceSetLoginStatus:0 message:0 reason:0xFFFFFFFFLL properties:0];
    [(IMDServiceSession *)self _clearAutoReconnectTimer];
  }
}

- (void)serviceSessionDidLogoutWithMessage:(id)a3 reason:(int)a4 properties:(id)a5 account:(id)a6
{
  if (self->_activated)
  {
    [a6 _forceSetLoginStatus:0 message:a3 reason:*(void *)&a4 properties:a5];
    [(IMDServiceSession *)self _clearAutoReconnectTimer];
  }
}

- (void)_wentOfflineWithAccount:(id)a3
{
  if (self->_activated)
  {
    locuint64_t k = self->_lock;
    id v5 = a3;
    [(NSRecursiveLock *)lock lock];
    [(NSMutableDictionary *)self->_buddies removeAllObjects];
    [(NSMutableDictionary *)self->_localProperties removeAllObjects];
    [(NSRecursiveLock *)self->_lock unlock];
    [(IMDServiceSession *)self autoReconnectWithAccount:v5];
  }
}

- (void)__forceSetLoginStatus:(unint64_t)a3 oldStatus:(unint64_t)a4 message:(id)a5 reason:(int)a6 properties:(id)a7 account:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  __int16 v14 = (__CFString *)a5;
  id v15 = a7;
  id v16 = a8;
  if (a3 > 3 || a4 < 4)
  {
    if (a3 == 4)
    {
      [(IMDServiceSession *)self _abandonPWFetcher];
      [(IMDServiceSession *)self _clearAutoReconnectTimer];
      if (self->_saveKeychainPassword)
      {
        if ([(NSString *)self->_password length])
        {
          __int16 v17 = [(IMDServiceSession *)self service];
          id v18 = [v17 internalName];
          IMSetKeychainPassword();

          self->_saveKeychainPassword = 0;
        }
      }
    }
  }
  else
  {
    [(IMDServiceSession *)self _wentOfflineWithAccount:v16];
    [(IMDServiceSession *)self autoReconnectWithAccount:v16];
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      uint64_t v20 = (objc_class *)objc_opt_class();
      uint64_t v21 = NSStringFromClass(v20);
      uint64_t v22 = qword_1EBE2BC48[a3];
      __int16 v23 = &stru_1F3398578;
      *(_DWORD *)long long v27 = 138412802;
      *(void *)&void v27[4] = v21;
      if (v14) {
        __int16 v23 = v14;
      }
      *(_WORD *)&v27[12] = 2112;
      *(void *)&v27[14] = v22;
      __int16 v28 = 2112;
      uint64_t v29 = v23;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "%@: Login status changed to %@ (%@)", v27, 0x20u);
    }
  }
  id v24 = [(IMDServiceSession *)self broadcaster];
  BOOL v25 = [v16 accountID];
  [v24 account:v25 loginStatusChanged:a3 message:v14 reason:v10 properties:v15];

  if ([v16 isActive])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"__kIMDBadgeUtilitiesLoginStatusChangedNotification", 0, 0, 1u);
  }
  if (a3 == 1) {
    [(IMDServiceSession *)self _setAutoReconnectTimer];
  }
}

- (void)_setAutoReconnectTimer
{
  if (!self->_activated) {
    [(IMDServiceSession *)self _clearAutoReconnectTimer];
  }
}

- (void)_autoReconnectTimer:(id)a3
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (self->_activated)
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = self;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "-[IMDServiceSession _autoReconnectTimer]: %@", (uint8_t *)&v10, 0xCu);
      }
    }
    BOOL v6 = [(IMDServiceSession *)self networkConditionsAllowLogin];
    int v7 = IMOSLoggingEnabled();
    if (v6)
    {
      if (v7)
      {
        BOOL v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v10) = 0;
          _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, " => Network appears to be up, we'll try to auto reconnect", (uint8_t *)&v10, 2u);
        }
      }
      [(IMDServiceSession *)self autoReconnect];
      [(IMDServiceSession *)self _reconnectIfNecessary];
    }
    else if (v7)
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v10) = 0;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, " ** Network does not appear to be up, we'll skip this attempt", (uint8_t *)&v10, 2u);
      }
    }
  }
}

- (void)_clearAutoReconnectTimer
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      int v7 = self;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "-[IMDServiceSession _clearAutoReconnectTimer]: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  p_reconnectTimer = &self->_reconnectTimer;
  [(NSTimer *)*p_reconnectTimer invalidate];
  id v5 = *p_reconnectTimer;
  *p_reconnectTimer = 0;
}

- (void)deleteAllDataWithCompletionHandler:(id)a3
{
  uint64_t v5 = sub_1D96867CC((uint64_t *)&unk_1EBE2B000);
  MEMORY[0x1F4188790](v5 - 8);
  int v7 = (char *)&v14 - ((v6 + 15) & 0xFFFFFFFFFFFFFFF0);
  uint64_t v8 = _Block_copy(a3);
  uint64_t v9 = swift_allocObject();
  *(void *)(v9 + 16) = v8;
  *(void *)(v9 + 24) = self;
  uint64_t v10 = sub_1D9907030();
  (*(void (**)(char *, uint64_t, uint64_t, uint64_t))(*(void *)(v10 - 8) + 56))(v7, 1, 1, v10);
  id v11 = (void *)swift_allocObject();
  v11[2] = 0;
  void v11[3] = 0;
  v11[4] = &unk_1EA8C8180;
  v11[5] = v9;
  uint64_t v12 = (void *)swift_allocObject();
  v12[2] = 0;
  v12[3] = 0;
  v12[4] = &unk_1EA8C8188;
  v12[5] = v11;
  NSUInteger v13 = self;
  sub_1D98A7218((uint64_t)v7, (uint64_t)&unk_1EA8C8190, (uint64_t)v12);
  swift_release();
}

@end