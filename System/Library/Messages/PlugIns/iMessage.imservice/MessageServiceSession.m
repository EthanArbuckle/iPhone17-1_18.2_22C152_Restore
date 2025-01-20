@interface MessageServiceSession
- (AttachmentRefreshDeliveryController)attachmentRefreshDeliveryController;
- (BOOL)_amIMentioned:(id)a3 inMentions:(id)a4;
- (BOOL)_convergesDisplayNames;
- (BOOL)_failSendingMessageIfNeeded:(id)a3 withContext:(id)a4;
- (BOOL)_handleDeviceRegistrationForMessage:(id)a3 withContext:(id)a4;
- (BOOL)_handleTypingIndicatorMessage:(id)a3 withContext:(id)a4;
- (BOOL)_isAllowlistedUnencryptedSender:(id)a3;
- (BOOL)_isDeviceRegisteredForAccount:(id)a3;
- (BOOL)_isFromLinkedID:(id)a3 fromID:(id)a4;
- (BOOL)_isRegisteredURI:(id)a3;
- (BOOL)_originalTimestampWithinAcceptableWindow:(id)a3 timestamp:(id)a4;
- (BOOL)_richLinkPendSendingWithGUID:(id)a3;
- (BOOL)_sendCertifiedDeliveryReceiptIfPossible:(id)a3 messageContext:(id)a4 guid:(id)a5 messageWasStored:(BOOL)a6 needsDeliveryReceipt:(BOOL)a7 failureReason:(id)a8;
- (BOOL)_shouldAdjustTimestampOfResentMessages;
- (BOOL)_shouldBlackholeChatFromSender:(id)a3 toRecipient:(id)a4 forAccount:(id)a5;
- (BOOL)_shouldBlackholeGroupChatFromSender:(id)a3 toRecipient:(id)a4 withOtherParticipants:(id)a5 forAccount:(id)a6;
- (BOOL)_shouldIgnoreMessageFromSender:(id)a3 balloonBID:(id)a4 fromMe:(BOOL)a5;
- (BOOL)_shouldInitiateTelephonyConversationForMessage:(id)a3;
- (BOOL)_shouldOptimizedDeliveryReceiptForConversation:(id)a3 withMessageTimeStamp:(id)a4;
- (BOOL)_shouldOverrideTypingIndicator;
- (BOOL)_shouldSendAppTypingIndicator;
- (BOOL)_transferIsValidForServiceSession:(id)a3;
- (BOOL)_updateReadReceiptProperties:(id)a3 withIncomingProperties:(id)a4;
- (BOOL)canMakeExpireStateChecks;
- (BOOL)didReceiveMessages:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 fromIDSID:(id)a7;
- (BOOL)networkConditionsAllowLogin;
- (BOOL)overrideNetworkAvailability;
- (BOOL)reflectMarkUnreadToPeerDevicesForMessageGUID:(id)a3;
- (BOOL)reflectRecoverChatToPeerDevicesForMessageGUID:(id)a3;
- (BOOL)sendNicknameUpdatesToPeerDevices:(id)a3 toDestinations:(id)a4;
- (BOOL)shouldDownloadGroupPhoto:(id)a3;
- (BOOL)shouldUploadGroupPhoto:(id)a3;
- (IMDCKUtilities)ckUtilities;
- (IMDCallManager)callManager;
- (IMDGroupPhotoRefreshController)groupPhotoRefreshController;
- (IMDMessageStore)messageStore;
- (IMDScheduledMessageCoordinator)scheduledMessageCoordinator;
- (MessageAttachmentController)attachmentController;
- (MessageDeliveryController)deliveryController;
- (MessageGroupController)groupController;
- (MessageServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5;
- (NSMutableDictionary)pendingGroupPhotoDownloads;
- (double)_messageRetryTimeout;
- (double)_richLinkDelayTimeInterval;
- (id)_URIsFromHandles:(id)a3;
- (id)_buildSendMessageContextWithChatIdentifier:(id)a3 withChatStyle:(unsigned __int8)a4 withServiceSession:(id)a5 withMessage:(id)a6;
- (id)_buildSendMessageContextWithChatIdentifier:(id)a3 withChatStyle:(unsigned __int8)a4 withServiceSession:(id)a5 withMessage:(id)a6 destinations:(id)a7;
- (id)_firstiMessageChat;
- (id)_generateAndStoreGroupActionItemForChat:(id)a3 sender:(id)a4;
- (id)_handleIDsForDestinations:(id)a3;
- (id)_lastAddressedURIForChatLogMetricIfNeededOnChat:(id)a3 withIDSAccount:(id *)a4 withServiceSession:(id)a5 shouldLog:(BOOL)a6;
- (id)_messageDictionaryForDeleteCommandShouldResetPreference:(BOOL)a3;
- (id)_messageDictionaryToReflectWithDeliveryReceipt:(id)a3;
- (id)_messageItemToConsumeForNewBreadcrumbMessage:(id)a3 outBreadcrumbItems:(id *)a4;
- (id)_processMessageForSending:(id)a3 withContext:(id)a4;
- (id)_processMessageForSendingToGroupIfNeeded:(id)a3 withContext:(id)a4;
- (id)_pushHandlerForIDSAccount:(id)a3;
- (id)_setCallerIDOnMessage:(id)a3 onChat:(id)a4 withIDSAccount:(id *)a5 withServiceSession:(id)a6;
- (id)bizIDSAccountFromMadridIDSAccount:(id)a3;
- (id)callerURI;
- (id)callerURIForMessageServiceType:(unsigned int)a3;
- (id)callerURIUsingCalleeURI:(id)a3;
- (id)chatStore;
- (id)fallBackBizIDSAccount;
- (id)fileTransferDictionaryForChat:(id)a3;
- (id)generateAndStoreGroupPhotoChangeStatusItemForChat:(id)a3 sender:(id)a4 fileTransferGuid:(id)a5 isHidden:(BOOL)a6;
- (id)getMessagePushHandlers;
- (id)idsAccountForFromURI:(id)a3 toURI:(id)a4;
- (id)idsServiceForIDSAccount:(id)a3;
- (id)pendingSendBlockQueue;
- (id)storageController;
- (id)storeBreadcrumbAndSetConsumedPayloadsForNewMessageItemIfNecessary:(id)a3 inChatWithIdentifier:(id)a4;
- (unint64_t)_computeFlagsForIncomingMessage:(unint64_t)a3 isFromMe:(BOOL)a4 unfinished:(BOOL)a5 isAudioMessage:(BOOL)a6 isAutoReply:(BOOL)a7 isExpirable:(BOOL)a8 messageSource:(unint64_t)a9 participants:(id)a10 hasUnseenMention:(BOOL)a11 isSOS:(BOOL)a12 isCritical:(BOOL)a13;
- (unint64_t)_failuresForID:(id)a3;
- (unint64_t)_maxFailuresAllowed;
- (unint64_t)_numberOfOffGridCapableDevicesForDestination:(id)a3;
- (unint64_t)_replicationEditDelay;
- (unsigned)messageServiceTypeForURI:(id)a3;
- (void)_FTAWDLogForMessage:(id)a3 withContext:(id)a4;
- (void)_UpdateLastAddressedSIMIDForOtherServicesIfNeededWithChatIdentifier:(id)a3 style:(unsigned __int8)a4;
- (void)_autoReportChatAsUnknown:(id)a3 chatIsNew:(BOOL)a4;
- (void)_automation_sendDictionary:(id)a3 options:(id)a4 toHandles:(id)a5;
- (void)_blastDoorProcessingWithIMMessageItem:(id)a3 chat:(id)a4 account:(id)a5 fromToken:(id)a6 fromIDSID:(id)a7 fromIdentifier:(id)a8 toIdentifier:(id)a9 participants:(id)a10 groupName:(id)a11 groupID:(id)a12 isFromMe:(BOOL)a13 isLastFromStorage:(BOOL)a14 isFromStorage:(BOOL)a15 hideLockScreenNotification:(BOOL)a16 wantsCheckpointing:(BOOL)a17 needsDeliveryReceipt:(id)a18 messageBalloonPayloadAttachmentDictionary:(id)a19 inlineAttachments:(id)a20 attributionInfoArray:(id)a21 nicknameDictionary:(id)a22 availabilityVerificationRecipientChannelIDPrefix:(id)a23 availabilityVerificationRecipientEncryptionValidationToken:(id)a24 availabilityOffGridRecipientSubscriptionValidationToken:(id)a25 availabilityOffGridRecipientEncryptionValidationToken:(id)a26 idsService:(id)a27 messageContext:(id)a28 isFromTrustedSender:(BOOL)a29 isFromSnapTrustedSender:(BOOL)a30 completionBlock:(id)a31;
- (void)_checkGlobalReadReceiptValueAndUpdateIfNeeded:(id)a3;
- (void)_configurePrimaryServiceSessionWithAccount:(id)a3 service:(id)a4;
- (void)_deactivateServiceIfNeededForContext:(id)a3;
- (void)_deliverMessage:(id)a3 withContext:(id)a4 withBlock:(id)a5;
- (void)_didSendMessage:(id)a3 withContext:(id)a4 forceDate:(id)a5 fromStorage:(BOOL)a6;
- (void)_engroupForChat:(id)a3 idsAccount:(id)a4 completion:(id)a5;
- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4 description:(id)a5;
- (void)_fixParticipantsForChat:(id)a3;
- (void)_flushQueuedMessageWrapperBlocks;
- (void)_forwardP2PGroupCommand:(id)a3 fromPerson:(id)a4 toPerson:(id)a5 toGroup:(id)a6;
- (void)_forwardP2PGroupCommand:(id)a3 fromPerson:(id)a4 toPerson:(id)a5 toGroup:(id)a6 toToken:(id)a7;
- (void)_forwardP2PGroupCommand:(id)a3 fromPerson:(id)a4 toPerson:(id)a5 toGroup:(id)a6 toToken:(id)a7 messageID:(id)a8;
- (void)_handleDeleteCommandWithMessageDictionary:(id)a3;
- (void)_handleDeliveryFailureForMessage:(id)a3 withContext:(id)a4;
- (void)_handleFakeReceiptBlock:(id)a3 withContext:(id)a4 withMsg:(id)a5;
- (void)_handleFileTransferUpdated:(id)a3;
- (void)_handleIsMeToMeForMessage:(id)a3 withContext:(id)a4;
- (void)_handleMessageSentToSelf:(id)a3 chatIdentifier:(id)a4 style:(unsigned __int8)a5 isLocal:(BOOL)a6 account:(id)a7;
- (void)_handleMessageSentToSelf:(id)a3 withContext:(id)a4 isLocal:(BOOL)a5;
- (void)_handleNicknameReceived:(id)a3 fromIdentifier:(id)a4 withMessageItem:(id)a5 isSnapTrustedUser:(BOOL)a6;
- (void)_handleScheduledMessageSendFailure:(id)a3;
- (void)_handleUpdateNotificationTimeManagerForMessage:(id)a3 withContext:(id)a4;
- (void)_iMessageBagLoaded:(id)a3;
- (void)_incrementDecryptionFailureForID:(id)a3;
- (void)_initiateTelephonyConversationForMessage:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 onSession:(id)a6;
- (void)_logCompletedMessage:(id)a3 withContext:(id)a4;
- (void)_nicknameFetchCompletedMessage:(id)a3 synchronous:(BOOL)a4 profile:(id)a5 nickNameWasInCache:(BOOL)a6 nickNameDownloadError:(id)a7;
- (void)_notifyDidSendMessage:(id)a3 withContext:(id)a4;
- (void)_notifyNameAndPhotoControllerOfMessage:(id)a3 onChat:(id)a4;
- (void)_notifyOfSendMessage:(id)a3 withContext:(id)a4;
- (void)_primeServerBags;
- (void)_processMessagesForRelayIfNeeded;
- (void)_reAttemptMessageDeliveryForGUID:(id)a3 toIdentifier:(id)a4 fromIdentifier:(id)a5 fromIDSID:(id)a6 isReflection:(BOOL)a7 shouldShowError:(BOOL)a8 cacheFlushError:(BOOL)a9 imdAccount:(id)a10;
- (void)_refreshGroupPhotoTTLIfNecessary:(id)a3 withContext:(id)a4;
- (void)_registerKeepMessagesSettingReflection;
- (void)_registerReadReceiptSettingReflection;
- (void)_relayLegacySatelliteMessage:(id)a3 toChat:(id)a4;
- (void)_requestGroupPhotoResendForChatGUID:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5;
- (void)_resetFailureRetries;
- (void)_sendHighResolutionImagesForMessage:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toChat:(id)a7;
- (void)_sendSyndicationAction:(id)a3 toChat:(id)a4;
- (void)_setExpectedOffGridDeliveriesForMessage:(id)a3 context:(id)a4;
- (void)_setWeeklyFailureResetTimer;
- (void)_setupPushHandlerWithAccount:(id)a3;
- (void)_startTimingMessageSend;
- (void)_stopTimingMessageSend;
- (void)_storeSentMessage:(id)a3 withContext:(id)a4;
- (void)_updateBlackholeStatusIfNeededWithMessage:(id)a3 withContext:(id)a4;
- (void)_updateChatProperties:(id)a3 withProperties:(id)a4;
- (void)_updateGlobalReadReceiptValue:(BOOL)a3 withVersionID:(id)a4;
- (void)_updateLastDeviceActivityForCloudKit;
- (void)_updateNetworkOverride;
- (void)_updateOffGridStatusIfNeededWithMessage:(id)a3 context:(id)a4;
- (void)_updateOrRemoveGroupPhotoForChat:(id)a3 sender:(id)a4 completedTransfer:(id)a5 isHidden:(BOOL)a6;
- (void)_updateStoredBreadcrumbIfNeeded:(id)a3 onChat:(id)a4;
- (void)_updateTransfersForAttributionInfoArray:(id)a3 message:(id)a4;
- (void)addAccount:(id)a3;
- (void)addItemToRecentsIfApplicable:(id)a3;
- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4;
- (void)cancelScheduledMessageWithGUID:(id)a3;
- (void)cancelScheduledMessageWithGUID:(id)a3 destinations:(id)a4 cancelType:(unint64_t)a5;
- (void)closeSessionForChat:(id)a3 chatGUID:(id)a4 didDeleteConversation:(BOOL)a5 style:(unsigned __int8)a6;
- (void)dealloc;
- (void)didReplaceMessage:(id)a3 newMessage:(id)a4;
- (void)doneRetrievingAttachmentsForGroupPhotoForChat:(id)a3 fileTransferError:(id)a4 success:(BOOL)a5 transferGuid:(id)a6 sender:(id)a7 isHidden:(BOOL)a8;
- (void)eagerUploadCancel:(id)a3;
- (void)eagerUploadTransfer:(id)a3 recipients:(id)a4;
- (void)enqueReplayMessageCallback:(id)a3;
- (void)forwardDeliveryReceiptForMessageID:(id)a3 withAccount:(id)a4 callerURI:(id)a5;
- (void)groupPhotoDownloadCompletedForChat:(id)a3 fileTransferError:(id)a4 success:(BOOL)a5 transferGuid:(id)a6 sender:(id)a7 isHidden:(BOOL)a8;
- (void)groupPhotoUploadCompletedForChat:(id)a3 fileTransferGuid:(id)a4 callerURI:(id)a5 fromAccount:(id)a6 message:(id)a7 displayIDs:(id)a8 additionalContext:(id)a9 success:(BOOL)a10 isPhotoRefresh:(BOOL)a11 error:(unsigned int)a12;
- (void)groupPhotoUploadFailedForChat:(id)a3 fileTransferGuid:(id)a4;
- (void)handleBreadcrumbForNewSentMessageItemIfNecessary:(id)a3 withContext:(id)a4;
- (void)handler:(id)a3 bubblePayloadData:(id)a4 forMessageID:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 fromToken:(id)a8 timeStamp:(id)a9 fromIDSID:(id)a10 needsDeliveryReceipt:(id)a11 deliveryContext:(id)a12 storageContext:(id)a13;
- (void)handler:(id)a3 deleteCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12;
- (void)handler:(id)a3 genericNotification:(id)a4 incomingMessage:(id)a5 userInfo:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14;
- (void)handler:(id)a3 groupMessageCommand:(id)a4 encryptedGroupCommand:(id)a5 messageID:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14;
- (void)handler:(id)a3 incomingMessage:(id)a4 originalEncryptionType:(id)a5 messageID:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 incomingEngroup:(id)a12 needsDeliveryReceipt:(id)a13 deliveryContext:(id)a14 storageContext:(id)a15 messageContext:(id)a16 isBeingReplayed:(BOOL)a17 mergeID:(id)a18 wantsCheckpointing:(BOOL)a19 isSnapTrustedUser:(BOOL)a20;
- (void)handler:(id)a3 locationShareInfo:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12;
- (void)handler:(id)a3 messageIDDelivered:(id)a4 toIdentifier:(id)a5 status:(id)a6 deliveryContext:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12;
- (void)handler:(id)a3 messageIDPlayed:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12;
- (void)handler:(id)a3 messageIDRead:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12;
- (void)handler:(id)a3 messageIDReflectedDelivered:(id)a4 incomingMessage:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 status:(id)a8 deliveryContext:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14;
- (void)handler:(id)a3 messageIDSaved:(id)a4 ofType:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 groupContext:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14;
- (void)handler:(id)a3 nicknameInfoReceived:(id)a4 userInfo:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 fromToken:(id)a8 timeStamp:(id)a9 fromIDSID:(id)a10 needsDeliveryReceipt:(id)a11 deliveryContext:(id)a12 storageContext:(id)a13;
- (void)handler:(id)a3 payloadDataRequest:(id)a4;
- (void)handler:(id)a3 payloadDataResponse:(id)a4;
- (void)handler:(id)a3 receivedError:(id)a4 forMessageID:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 fromToken:(id)a8 timeStamp:(id)a9 fromIDSID:(id)a10 needsDeliveryReceipt:(id)a11 deliveryContext:(id)a12 storageContext:(id)a13 additionalInfo:(id)a14 shouldShowPeerErrors:(BOOL)a15;
- (void)handler:(id)a3 recoverCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12;
- (void)handler:(id)a3 remoteFileRequest:(id)a4;
- (void)handler:(id)a3 remoteFileResponse:(id)a4;
- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChat:(id)a5 style:(unsigned __int8)a6;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 joinProperties:(id)a7;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 joinProperties:(id)a8;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 joinProperties:(id)a9;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 joinProperties:(id)a6;
- (void)leaveChat:(id)a3 style:(unsigned __int8)a4;
- (void)messageDeliveryController:(id)a3 serverUpdatedTimestampMessage:(id)a4;
- (void)messageDeliveryController:(id)a3 service:(id)a4 didFlushCacheForKTPeerURI:(id)a5;
- (void)messageDeliveryController:(id)a3 service:(id)a4 didFlushCacheForRemoteURI:(id)a5 fromURI:(id)a6 guid:(id)a7;
- (void)networkMonitorDidUpdate:(id)a3;
- (void)preWarm;
- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 account:(id)a7 didReplaceMessageBlock:(id)a8 completionBlock:(id)a9;
- (void)processNetworkDataAvailabilityChange:(BOOL)a3;
- (void)receivedGroupPhotoUpdate:(id)a3 chat:(id)a4 sender:(id)a5 isHidden:(BOOL)a6;
- (void)refreshRegistration;
- (void)refreshServiceCapabilities;
- (void)relayLegacySatelliteMessage:(id)a3 toChat:(id)a4;
- (void)removeAccount:(id)a3;
- (void)removePersonInfo:(id)a3 chatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)renewTTLForScheduledAttachmentTransfer:(id)a3;
- (void)replayMessage:(id)a3;
- (void)requestGroupPhotoIfNecessary:(id)a3 incomingParticipantVersion:(int64_t)a4 incomingGroupPhotoCreationTime:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 messageIsFromStorage:(BOOL)a8;
- (void)requestProperty:(id)a3 ofPerson:(id)a4;
- (void)retryGroupPhotoUpload:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8;
- (void)sendBalloonPayload:(id)a3 attachments:(id)a4 withMessageGUID:(id)a5 bundleID:(id)a6;
- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5;
- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5 toChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8;
- (void)sendCrossServiceAssociationMessageWithReplacementGUID:(id)a3 messageGUID:(id)a4 callerID:(id)a5 toID:(id)a6;
- (void)sendDeleteCommand:(id)a3 forChatGUID:(id)a4;
- (void)sendDeliveredQuietlyReceiptForMessage:(id)a3 forIncomingMessageFromIDSID:(id)a4 toChatGuid:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 withWillSendToDestinationsHandler:(id)a8;
- (void)sendDeliveryReceiptForMessageID:(id)a3 toID:(id)a4 deliveryContext:(id)a5 needsDeliveryReceipt:(id)a6 callerID:(id)a7 account:(id)a8;
- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10;
- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9;
- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 retractingPartIndexes:(id)a5 toChatIdentifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8;
- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8;
- (void)sendLocationSharingInfo:(id)a3 toID:(id)a4 completionBlock:(id)a5;
- (void)sendLogDumpMessageAtFilePath:(id)a3 toRecipient:(id)a4 shouldDeleteFile:(BOOL)a5 withCompletion:(id)a6;
- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6;
- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 destinationHandles:(id)a7;
- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 destinationHandles:(id)a6;
- (void)sendNicknameInfoToURIs:(id)a3 chatGUID:(id)a4;
- (void)sendNotifyRecipientCommandForMessage:(id)a3 toChatGuid:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendPlayedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 reflectOnly:(BOOL)a7;
- (void)sendRecoverCommand:(id)a3 forChatGUID:(id)a4;
- (void)sendRepositionStickerMessage:(id)a3 chatIdentifier:(id)a4 accountID:(id)a5 style:(unsigned __int8)a6;
- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendSyndicationAction:(id)a3 toChatsWithIdentifiers:(id)a4;
- (void)sendUpdatedCollaborationMetadata:(id)a3 toChatsWithIdentifiers:(id)a4 forMessageGUID:(id)a5;
- (void)sessionDidBecomeActive;
- (void)sessionWillBecomeInactiveWithAccount:(id)a3;
- (void)setCkUtilities:(id)a3;
- (void)setMessagePushHandlers:(id)a3;
- (void)setMessageStore:(id)a3;
- (void)setPendingGroupPhotoDownloads:(id)a3;
- (void)stageMessageWrapperBlock:(id)a3;
- (void)updateBalloonPayload:(id)a3 attachments:(id)a4 forMessageGUID:(id)a5;
- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9;
- (void)uploadGroupPhotoForChat:(id)a3 fileTransferGUID:(id)a4 itemGUID:(id)a5 callerURI:(id)a6 idsAccount:(id)a7 isPhotoRefresh:(BOOL)a8;
@end

@implementation MessageServiceSession

- (MessageServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  v34.receiver = self;
  v34.super_class = (Class)MessageServiceSession;
  v10 = [(MessageServiceSession *)&v34 initWithAccount:v8 service:v9 replicatingForSession:a5];
  v11 = v10;
  if (v10)
  {
    if (!a5) {
      [(MessageServiceSession *)v10 _configurePrimaryServiceSessionWithAccount:v8 service:v9];
    }
    v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
    pendingSendBlockQueue = v11->_pendingSendBlockQueue;
    v11->_pendingSendBlockQueue = v12;

    v14 = [[MessageDeliveryController alloc] initWithSession:v11];
    deliveryController = v11->_deliveryController;
    v11->_deliveryController = v14;

    [(MessageDeliveryController *)v11->_deliveryController setDelegate:v11];
    v16 = [[MessageAttachmentController alloc] initWithSession:v11];
    attachmentController = v11->_attachmentController;
    v11->_attachmentController = v16;

    v18 = [[MessageGroupController alloc] initWithSession:v11];
    groupController = v11->_groupController;
    v11->_groupController = v18;

    v20 = [[AttachmentRefreshDeliveryController alloc] initWithSession:v11];
    attachmentRefreshDeliveryController = v11->_attachmentRefreshDeliveryController;
    v11->_attachmentRefreshDeliveryController = v20;

    v22 = [[IMDGroupPhotoRefreshController alloc] initWithSession:v11];
    groupPhotoRefreshController = v11->_groupPhotoRefreshController;
    v11->_groupPhotoRefreshController = v22;

    v24 = (NSMutableDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    pendingGroupPhotoDownloads = v11->_pendingGroupPhotoDownloads;
    v11->_pendingGroupPhotoDownloads = v24;

    v26 = +[IMFeatureFlags sharedFeatureFlags];
    unsigned int v27 = [v26 isScheduledMessagesCoreEnabled];

    if (v27)
    {
      v28 = (IMDScheduledMessageCoordinator *)[objc_alloc((Class)IMDScheduledMessageCoordinator) initWithServiceSession:v11];
      scheduledMessageCoordinator = v11->_scheduledMessageCoordinator;
      v11->_scheduledMessageCoordinator = v28;
    }
    v30 = +[NSNotificationCenter defaultCenter];
    [v30 addObserver:v11 selector:"_handleFileTransferUpdated:" name:IMDFileTransferUpdatedNotification object:0];

    v31 = +[NSNotificationCenter defaultCenter];
    [v31 addObserver:v11 selector:"_handleFileTransferAccepted:" name:IMDFileTransferAcceptedNotification object:0];

    v32 = +[NSNotificationCenter defaultCenter];
    [v32 addObserver:v11 selector:"_handleFileTransferBatchAccepted:" name:IMDFileTransferBatchAcceptedNotification object:0];
  }
  return v11;
}

- (void)_configurePrimaryServiceSessionWithAccount:(id)a3 service:(id)a4
{
  id v5 = a3;
  [(MessageServiceSession *)self _primeServerBags];
  [(MessageServiceSession *)self _setupPushHandlerWithAccount:v5];

  [(MessageServiceSession *)self _registerReadReceiptSettingReflection];
  [(MessageServiceSession *)self _registerKeepMessagesSettingReflection];
  if (qword_EC548 != -1) {
    dispatch_once(&qword_EC548, &stru_DD7A8);
  }
  if (+[IMDeviceUtilities supportsFaceTime])
  {
    self->_callManager = (IMDCallManager *)[objc_alloc((Class)IMDCallManager) initWithServiceSession:self];
    _objc_release_x1();
  }
}

- (void)_primeServerBags
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Priming Message Server bag", buf, 2u);
    }
  }
  v4 = +[IDSServerBag sharedInstanceForBagType:1];
  if (v4)
  {
    id v5 = +[NSNotificationCenter defaultCenter];
    [v5 addObserver:self selector:"_iMessageBagLoaded:" name:IDSServerBagFinishedLoadingNotification object:v4];
  }
  [(MessageServiceSession *)self _updateNetworkOverride];
  if (IMOSLoggingEnabled())
  {
    v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v10 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Priming FaceTime Server bag", v10, 2u);
    }
  }
  id v7 = +[IDSServerBag sharedInstanceForBagType:0];
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "...done", v9, 2u);
    }
  }
}

- (void)_setupPushHandlerWithAccount:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)v11 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Setting up push handler", v11, 2u);
    }
  }
  v6 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
  messagePushHandlers = self->_messagePushHandlers;
  self->_messagePushHandlers = v6;

  id v8 = [MessagePushHandler alloc];
  id v9 = [v4 idsAccount];
  v10 = [(MessagePushHandler *)v8 initWithIDSAccount:v9];

  [(MessagePushHandler *)v10 addListener:self];
  [(NSMutableArray *)self->_messagePushHandlers addObject:v10];
}

- (void)_registerReadReceiptSettingReflection
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Setting up darwin notification observer for read receipts", buf, 2u);
    }
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  id v4 = &_dispatch_main_q;
  objc_copyWeak(&v5, (id *)buf);
  dword_EC500 = IMDispatchForNotify();

  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

- (void)_registerKeepMessagesSettingReflection
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Setting up darwin notification observer for Keep Messages Updated", buf, 2u);
    }
  }
  *(void *)buf = 0;
  objc_initWeak((id *)buf, self);
  id v4 = &_dispatch_main_q;
  id v8 = _NSConcreteStackBlock;
  uint64_t v9 = 3221225472;
  v10 = sub_6960;
  v11 = &unk_DD7F8;
  objc_copyWeak(&v12, (id *)buf);
  dword_EC504 = IMDispatchForNotify();

  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v7 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Setting up darwin notification observer for Keep Messages Reset", v7, 2u);
    }
  }
  objc_copyWeak(&v6, (id *)buf);
  IMDispatchForNotify();

  objc_destroyWeak(&v6);
  objc_destroyWeak(&v12);
  objc_destroyWeak((id *)buf);
}

- (void)dealloc
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Dealloc", buf, 2u);
    }
  }
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v4 = self->_messagePushHandlers;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v11;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v11 != v6) {
          objc_enumerationMutation(v4);
        }
        [*(id *)(*((void *)&v10 + 1) + 8 * i) removeListener:self];
      }
      id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v10 objects:v15 count:16];
    }
    while (v5);
  }

  if (dword_EC500 != -1)
  {
    notify_cancel(dword_EC500);
    dword_EC500 = -1;
  }
  if (dword_EC504 != -1)
  {
    notify_cancel(dword_EC504);
    dword_EC504 = -1;
  }
  [(IMTimer *)self->_resetFailureRetriesTimer invalidate];
  id v8 = +[NSNotificationCenter defaultCenter];
  [v8 removeObserver:self name:0 object:0];

  v9.receiver = self;
  v9.super_class = (Class)MessageServiceSession;
  [(MessageServiceSession *)&v9 dealloc];
}

- (id)storageController
{
  return +[IMDMessageFromStorageController iMessageStorageController];
}

- (IMDMessageStore)messageStore
{
  messageStore = self->_messageStore;
  if (!messageStore)
  {
    id v4 = +[IMDMessageStore sharedInstance];
    id v5 = self->_messageStore;
    self->_messageStore = v4;

    messageStore = self->_messageStore;
  }

  return messageStore;
}

- (id)chatStore
{
  return +[IMDChatStore sharedInstance];
}

- (IMDCKUtilities)ckUtilities
{
  ckUtilities = self->_ckUtilities;
  if (!ckUtilities)
  {
    id v4 = +[IMDCKUtilities sharedInstance];
    id v5 = self->_ckUtilities;
    self->_ckUtilities = v4;

    ckUtilities = self->_ckUtilities;
  }

  return ckUtilities;
}

- (void)addAccount:(id)a3
{
  v8.receiver = self;
  v8.super_class = (Class)MessageServiceSession;
  id v4 = a3;
  [(MessageServiceSession *)&v8 addAccount:v4];
  id v5 = [MessagePushHandler alloc];
  uint64_t v6 = objc_msgSend(v4, "idsAccount", v8.receiver, v8.super_class);

  id v7 = [(MessagePushHandler *)v5 initWithIDSAccount:v6];
  [(MessagePushHandler *)v7 addListener:self];
  [(NSMutableArray *)self->_messagePushHandlers addObject:v7];
}

- (void)removeAccount:(id)a3
{
  id v4 = a3;
  v19.receiver = self;
  v19.super_class = (Class)MessageServiceSession;
  [(MessageServiceSession *)&v19 removeAccount:v4];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = self->_messagePushHandlers;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v6)
  {
    id v7 = v6;
    objc_super v8 = 0;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v5);
        }
        long long v11 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        long long v12 = [v11 account];
        long long v13 = [v4 idsAccount];

        if (v12 == v13)
        {
          id v14 = v11;

          objc_super v8 = v14;
        }
      }
      id v7 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v7);
  }
  else
  {
    objc_super v8 = 0;
  }

  [v8 removeListener:self];
  [(NSMutableArray *)self->_messagePushHandlers removeObject:v8];
}

- (void)refreshRegistration
{
  v2 = +[IMUnlockMonitor sharedInstance];
  unsigned __int8 v3 = [v2 isUnderFirstDataProtectionLock];

  if ((v3 & 1) == 0)
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    id v4 = [(id)objc_opt_class() idsAccounts];
    id v5 = [v4 countByEnumeratingWithState:&v29 objects:v40 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v30;
      while (2)
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v30 != v6) {
            objc_enumerationMutation(v4);
          }
          if ([*(id *)(*((void *)&v29 + 1) + 8 * i) _validateIDSAccount])
          {
            objc_super v8 = +[IMDCKSyncController sharedInstance];
            [v8 idsAccountsDidChange];

            uint64_t v9 = +[IMDNicknameController sharedInstance];
            [v9 evaluateAccountStateForFeatureEligibility];

            goto LABEL_12;
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v29 objects:v40 count:16];
        if (v5) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v10 = [(MessageServiceSession *)self accounts];
  id v11 = [v10 countByEnumeratingWithState:&v25 objects:v39 count:16];
  if (v11)
  {
    uint64_t v13 = *(void *)v26;
    *(void *)&long long v12 = 138412802;
    long long v22 = v12;
    do
    {
      for (j = 0; j != v11; j = (char *)j + 1)
      {
        if (*(void *)v26 != v13) {
          objc_enumerationMutation(v10);
        }
        long long v15 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
        objc_opt_class();
        if (objc_opt_isKindOfClass())
        {
          long long v16 = [v15 idsAccount];
          if ([(MessageServiceSession *)self _isDeviceRegisteredForAccount:v16])
          {
            long long v17 = _IDSiMessageProtocolVersionNumber();
            long long v18 = +[NSDictionary dictionaryWithObject:v17 forKey:@"Version"];

            [v15 writeAccountDefaults:v18];
            if ((unint64_t)[v15 loginStatus] <= 3)
            {
              if (IMOSLoggingEnabled())
              {
                objc_super v19 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  id v20 = [v15 loginStatus];
                  v21 = [v15 idsAccount];
                  *(_DWORD *)buf = v22;
                  objc_super v34 = v15;
                  __int16 v35 = 2048;
                  id v36 = v20;
                  __int16 v37 = 2112;
                  v38 = v21;
                  _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "refreshRegistration. Logging into account %@, login status %lu,  [account idsAccount] %@", buf, 0x20u);
                }
              }
              -[MessageServiceSession loginServiceSessionWithAccount:](self, "loginServiceSessionWithAccount:", v15, v22);
            }
          }
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v25 objects:v39 count:16];
    }
    while (v11);
  }

  v24.receiver = self;
  v24.super_class = (Class)MessageServiceSession;
  [(MessageServiceSession *)&v24 refreshRegistration];
}

- (id)fallBackBizIDSAccount
{
  [(id)objc_opt_class() idsAccounts];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v2 = (id)objc_claimAutoreleasedReturnValue();
  id v3 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v3)
  {
    id v4 = 0;
    uint64_t v5 = *(void *)v13;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v13 != v5) {
        objc_enumerationMutation(v2);
      }
      id v7 = *(void **)(*((void *)&v12 + 1) + 8 * v6);
      if (objc_msgSend(v7, "serviceType", (void)v12) == 1)
      {
        BOOL v8 = [v7 accountType] == 0;
        id v9 = v7;

        id v4 = v9;
        if (v8) {
          break;
        }
      }
      if (v3 == (id)++v6)
      {
        id v3 = [v2 countByEnumeratingWithState:&v12 objects:v18 count:16];
        id v9 = v4;
        if (v3) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v9 = 0;
  }

  if (IMOSLoggingEnabled())
  {
    long long v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v9;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "MessageServiceSession: Using fallbackBizIDSAccount %@", buf, 0xCu);
    }
  }

  return v9;
}

- (id)idsAccountForFromURI:(id)a3 toURI:(id)a4
{
  id v5 = a3;
  int IsBusinessID = IMStringIsBusinessID();
  id v7 = &IDSServiceNameiMessageForBusiness;
  if (!IsBusinessID) {
    id v7 = &IDSServiceNameiMessage;
  }
  BOOL v8 = [(MessageServiceSession *)self idsAccountForURI:v5 IDSServiceName:*v7];

  return v8;
}

- (id)bizIDSAccountFromMadridIDSAccount:(id)a3
{
  id v3 = a3;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v4 = objc_msgSend((id)objc_opt_class(), "idsAccounts", 0);
  id v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v18 != v6) {
          objc_enumerationMutation(v4);
        }
        BOOL v8 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        if ([v8 isBizAccount])
        {
          id v9 = [v8 loginID];
          long long v10 = [v3 loginID];
          unsigned int v11 = [v9 isEqualToString:v10];

          if (v11)
          {
            if (IMOSLoggingEnabled())
            {
              long long v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                id v14 = [v8 uniqueID];
                long long v15 = [v3 uniqueID];
                *(_DWORD *)buf = 138412546;
                id v22 = v14;
                __int16 v23 = 2112;
                objc_super v24 = v15;
                _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Found Biz IDSAccount %@ for Madrid IDSAccount %@", buf, 0x16u);
              }
            }
            id v12 = v8;
            goto LABEL_16;
          }
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v17 objects:v25 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v12 = 0;
LABEL_16:

  return v12;
}

- (id)_firstiMessageChat
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v2 = +[IMDChatRegistry sharedInstance];
  id v3 = [v2 chats];

  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v12;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v12 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v11 + 1) + 8 * i);
        BOOL v8 = [v7 serviceName];
        unsigned int v9 = [v8 isEqualToString:IMServiceNameiMessage];

        if (v9)
        {
          id v4 = v7;
          goto LABEL_11;
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v4;
}

- (void)sessionDidBecomeActive
{
  v9.receiver = self;
  v9.super_class = (Class)MessageServiceSession;
  [(MessageServiceSession *)&v9 sessionDidBecomeActive];
  id v3 = +[IMUnlockMonitor sharedInstance];
  unsigned __int8 v4 = [v3 isUnderFirstDataProtectionLock];

  int v5 = IMOSLoggingEnabled();
  if ((v4 & 1) == 0)
  {
    if (v5)
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v8 = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Scheduling routing, expire timer before first unlock", v8, 2u);
      }
    }
    [(MessageServiceSession *)self _updateRoutingTimerWithInterval:60.0];
    [(MessageServiceSession *)self _updateExpireStateTimerWithInterval:60.0];
    uint64_t v6 = [(MessageServiceSession *)self scheduledMessageCoordinator];
    [v6 updateTimerForTimeInterval:60.0];
    goto LABEL_10;
  }
  if (v5)
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)BOOL v8 = 0;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Not scheduling routing and expire timer before first unlock", v8, 2u);
    }
LABEL_10:
  }
  [(MessageServiceSession *)self _logLocalInfo];
}

- (void)sessionWillBecomeInactiveWithAccount:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      BOOL v8 = "-[MessageServiceSession sessionWillBecomeInactiveWithAccount:]";
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  v6.receiver = self;
  v6.super_class = (Class)MessageServiceSession;
  [(MessageServiceSession *)&v6 sessionWillBecomeInactiveWithAccount:v4];
  [(MessageServiceSession *)self _logLocalInfo];
}

- (void)refreshServiceCapabilities
{
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v3 = [(MessageServiceSession *)self accounts];
  id v4 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v12;
    do
    {
      id v7 = 0;
      do
      {
        if (*(void *)v12 != v6) {
          objc_enumerationMutation(v3);
        }
        BOOL v8 = *(void **)(*((void *)&v11 + 1) + 8 * (void)v7);
        objc_super v9 = [(MessageServiceSession *)self broadcaster];
        long long v10 = [v8 accountID];
        objc_msgSend(v9, "account:capabilitiesChanged:", v10, -[MessageServiceSession capabilities](self, "capabilities"));

        id v7 = (char *)v7 + 1;
      }
      while (v5 != v7);
      id v5 = [v3 countByEnumeratingWithState:&v11 objects:v15 count:16];
    }
    while (v5);
  }
}

- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4 description:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    long long v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
    {
      long long v11 = [(MessageServiceSession *)self accountID];
      int v12 = 138412546;
      long long v13 = v11;
      __int16 v14 = 2048;
      double v15 = a4;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEBUG, " Enqueued item for key: %@    timeout: %f", (uint8_t *)&v12, 0x16u);
    }
  }
  +[IMMultiQueue im_enqueuiMessageBlock:v8 withTimeout:v9 description:a4];
}

- (BOOL)_updateReadReceiptProperties:(id)a3 withIncomingProperties:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = IMChatPropertyReadReceiptsSettingVersionKey;
  id v8 = [v5 _numberForKey:IMChatPropertyReadReceiptsSettingVersionKey];
  uint64_t v9 = IMChatPropertyEnableReadReceiptForChatKey;
  long long v10 = [v5 _numberForKey:IMChatPropertyEnableReadReceiptForChatKey];
  long long v11 = [v6 _numberForKey:@"vR"];
  int v12 = [v6 _numberForKey:@"eR"];
  if (IMOSLoggingEnabled())
  {
    long long v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v18 = 138413058;
      long long v19 = v8;
      __int16 v20 = 2112;
      v21 = v10;
      __int16 v22 = 2112;
      __int16 v23 = v11;
      __int16 v24 = 2112;
      long long v25 = v12;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "trying to update chat properties: localReadReceiptVersionID: %@ localReadReceiptValue: %@ incomingReadReceiptVersionID: %@ incomingReadReceiptValue: %@", (uint8_t *)&v18, 0x2Au);
    }
  }
  if ((v8 || (uint64_t)[v11 integerValue] <= 0)
    && (id v14 = [v11 integerValue], (uint64_t)v14 <= (uint64_t)objc_msgSend(v8, "integerValue")))
  {
    BOOL v15 = 0;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        int v18 = 138413058;
        long long v19 = v8;
        __int16 v20 = 2112;
        v21 = v11;
        __int16 v22 = 2112;
        __int16 v23 = v10;
        __int16 v24 = 2112;
        long long v25 = v12;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Updated read receipt version number from %@ to %@ and read receipt value from %@ to %@", (uint8_t *)&v18, 0x2Au);
      }
    }
    if (v11) {
      [v5 setObject:v11 forKey:v7];
    }
    if (v12) {
      [v5 setObject:v12 forKey:v9];
    }
    BOOL v15 = 1;
  }

  return v15;
}

- (void)_updateChatProperties:(id)a3 withProperties:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v6 properties];
  id v9 = [v8 mutableCopy];

  if ([(MessageServiceSession *)self _updateReadReceiptProperties:v9 withIncomingProperties:v7])
  {
    [v6 updateProperties:v9];
    long long v10 = [(MessageServiceSession *)self broadcasterForChatListeners];
    long long v11 = [v6 guid];
    [v10 chat:v11 propertiesUpdated:v9];

    if (IMOSLoggingEnabled())
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412546;
        id v14 = v6;
        __int16 v15 = 2112;
        id v16 = v9;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Updated chat properties for chat: %@ properties: %@", (uint8_t *)&v13, 0x16u);
      }
    }
  }
}

- (void)_checkGlobalReadReceiptValueAndUpdateIfNeeded:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageServiceSession *)self globalReadReceiptSettingVersion];
  id v6 = [v4 objectForKey:@"gV"];
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      int v12 = v5;
      __int16 v13 = 2112;
      id v14 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Local global read receipt id: %@ incoming global read receipt id: %@", (uint8_t *)&v11, 0x16u);
    }
  }
  id v8 = [v6 integerValue];
  if ((uint64_t)v8 > (uint64_t)[v5 integerValue])
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        LOWORD(v11) = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Incoming global id is higher than local...so updating", (uint8_t *)&v11, 2u);
      }
    }
    long long v10 = [v4 objectForKey:@"gR"];
    -[MessageServiceSession _updateGlobalReadReceiptValue:withVersionID:](self, "_updateGlobalReadReceiptValue:withVersionID:", [v10 BOOLValue], v6);
  }
}

- (void)_updateGlobalReadReceiptValue:(BOOL)a3 withVersionID:(id)a4
{
  BOOL v4 = a3;
  id v6 = a4;
  unsigned int v7 = [(MessageServiceSession *)self readReceiptsGloballyEnabled];
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      v10[0] = 67109376;
      v10[1] = v4;
      __int16 v11 = 1024;
      unsigned int v12 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Updating global read receipt value to: %d from: %d", (uint8_t *)v10, 0xEu);
    }
  }
  [(MessageServiceSession *)self setGlobalReadReceiptSettingVersion:v6];
  [(MessageServiceSession *)self setReadReceiptsGloballyEnabled:v4];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.ReadReceiptsEnabled.changed", 0, 0, 1u);
  [(MessageServiceSession *)self overwritePerChatReadReceiptSettingsWithGlobalValue:v4];
}

- (id)_URIsFromHandles:(id)a3
{
  return URIsFromHandles(a3);
}

- (void)_UpdateLastAddressedSIMIDForOtherServicesIfNeededWithChatIdentifier:(id)a3 style:(unsigned __int8)a4
{
}

- (void)_reAttemptMessageDeliveryForGUID:(id)a3 toIdentifier:(id)a4 fromIdentifier:(id)a5 fromIDSID:(id)a6 isReflection:(BOOL)a7 shouldShowError:(BOOL)a8 cacheFlushError:(BOOL)a9 imdAccount:(id)a10
{
  BOOL v62 = a8;
  id v15 = a3;
  id v63 = a4;
  id v16 = a5;
  id v17 = a6;
  id v64 = a10;
  int v18 = [(MessageServiceSession *)self messageStore];
  long long v19 = [v18 messageWithGUID:v15];

  int v20 = IMOSLoggingEnabled();
  if (!v19)
  {
    if (v20)
    {
      objc_super v34 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v72 = v15;
        _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, " Unable to find message with ID: %@", buf, 0xCu);
      }
      goto LABEL_23;
    }
LABEL_24:
    __int16 v23 = 0;
    goto LABEL_25;
  }
  if (v20)
  {
    v21 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v72 = v15;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Found Message with messageID: %@", buf, 0xCu);
    }
  }
  __int16 v22 = [(MessageServiceSession *)self messageStore];
  __int16 v23 = [v22 chatForMessage:v19];

  int v24 = IMOSLoggingEnabled();
  if (!v23)
  {
    if (v24)
    {
      objc_super v34 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, " Unable to find chat for message", buf, 2u);
      }
LABEL_23:

      goto LABEL_24;
    }
    goto LABEL_24;
  }
  if (v24)
  {
    long long v25 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v72 = v23;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Found Chat For Message Chat: %@", buf, 0xCu);
    }
  }
  long long v26 = +[NSDate date];
  long long v27 = [v19 time];
  [v26 timeIntervalSinceDate:v27];
  double v29 = v28;
  [(MessageServiceSession *)self _messageRetryTimeout];
  BOOL v31 = v29 > v30;

  if (!v31)
  {
    unint64_t v35 = [(MessageServiceSession *)self _failuresForID:v16];
    LODWORD(v35) = v35 < [(MessageServiceSession *)self _maxFailuresAllowed];
    int v36 = IMOSLoggingEnabled();
    if (v35)
    {
      if (v36)
      {
        __int16 v37 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, " Attempting to Burn a retry to send the message", buf, 2u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v38 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412802;
          id v72 = v19;
          __int16 v73 = 2112;
          id v74 = v16;
          __int16 v75 = 2112;
          v76 = v23;
          _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, " Sending Retry for message: %@, to fromIdentifier: %@ in chat: %@ ", buf, 0x20u);
        }
      }
      v39 = [v23 participants];
      v40 = [(MessageServiceSession *)self _URIsFromHandles:v39];

      if ([v40 containsObject:v16])
      {
        if ([(MessageServiceSession *)self _shouldAdjustTimestampOfResentMessages])
        {
          [v19 setIsBeingRetried:1];
          v41 = [v19 messageSummaryInfo];
          CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[v41 mutableCopy];

          if (!Mutable) {
            CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
          }
          v43 = +[NSNumber numberWithBool:1];
          [(__CFDictionary *)Mutable setObject:v43 forKey:IMMessageSummaryInfoHasBeenRetried];

          [v19 setMessageSummaryInfo:Mutable];
          [v19 setRetryToParticipant:v16];
          v44 = [v23 chatIdentifier];
          -[MessageServiceSession sendMessage:toChat:style:](self, "sendMessage:toChat:style:", v19, v44, [v23 style]);

          [(MessageServiceSession *)self _incrementDecryptionFailureForID:v16];
          goto LABEL_70;
        }
        if (IMOSLoggingEnabled())
        {
          v52 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v52, OS_LOG_TYPE_INFO, "Not resending message because client version is out of date", buf, 2u);
          }
LABEL_69:
        }
      }
      else if (IMOSLoggingEnabled())
      {
        v52 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v72 = v16;
          __int16 v73 = 2112;
          id v74 = v23;
          _os_log_impl(&dword_0, v52, OS_LOG_TYPE_INFO, " Was told to retry send a message, but the recipient is not a member of the chat for that message. fromIdentifier: %@ chat: %@", buf, 0x16u);
        }
        goto LABEL_69;
      }
LABEL_70:

      goto LABEL_25;
    }
    if (v36)
    {
      v45 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "  Unable to automatically retry after send failure, No failure retries remain", buf, 2u);
      }
    }
    v46 = [(MessageServiceSession *)self deliveryController];
    v47 = [v16 _stripFZIDPrefix];
    v48 = [v46 activeDeviceForHandle:v47];

    v61 = [v48 idsDestination];
    unsigned __int8 v49 = [v61 isEqualToString:v17];
    if (v48)
    {
      char v50 = v49 ^ 1;
      if (!v17) {
        char v50 = 0;
      }
      if (v50) {
        goto LABEL_76;
      }
      char v51 = [v48 shouldDisplayRemoteDecryptionFailure] ^ 1;
    }
    else
    {
      char v51 = 0;
    }
    if (!a7 && (v51 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        v53 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v72 = v48;
          _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, "Found active device %@", buf, 0xCu);
        }
      }
      v54 = [v23 participants];
      BOOL v55 = (unint64_t)[v54 count] > 1;

      int v56 = IMOSLoggingEnabled();
      if (v55)
      {
        if (v56)
        {
          v57 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v72 = v16;
            __int16 v73 = 2112;
            id v74 = v15;
            _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, "  Querying URI %@ to see if we should show failure badge for messageID: %@", buf, 0x16u);
          }
        }
        v60 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", v16, 0);
        uint64_t v58 = IDSServiceNameiMessage;
        v65[0] = _NSConcreteStackBlock;
        v65[1] = 3221225472;
        v65[2] = sub_918C;
        v65[3] = &unk_DD820;
        id v66 = v16;
        v67 = self;
        id v68 = v15;
        BOOL v70 = v62;
        id v69 = v64;
        +[IMIDSIDQueryController currentRemoteDevicesForDestinations:v60 service:v58 listenerID:@"MessageServiceSession" queue:&_dispatch_main_q completionBlock:v65];
      }
      else
      {
        if (v56)
        {
          v59 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v72 = v15;
            _os_log_impl(&dword_0, v59, OS_LOG_TYPE_INFO, "  Showing error for 1 to 1 chat for messageID: %@", buf, 0xCu);
          }
        }
        [(MessageServiceSession *)self didReceiveError:27 forMessageID:v15 forceError:v62 account:v64];
      }
    }
LABEL_76:

    goto LABEL_25;
  }
  if (IMOSLoggingEnabled())
  {
    long long v32 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      v33 = [v19 timeDelivered];
      *(_DWORD *)buf = 138412546;
      id v72 = v15;
      __int16 v73 = 2112;
      id v74 = v33;
      _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "Message %@ originally delivered at %@ is too old to retry.", buf, 0x16u);
    }
  }
LABEL_25:
}

- (void)handler:(id)a3 receivedError:(id)a4 forMessageID:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 fromToken:(id)a8 timeStamp:(id)a9 fromIDSID:(id)a10 needsDeliveryReceipt:(id)a11 deliveryContext:(id)a12 storageContext:(id)a13 additionalInfo:(id)a14 shouldShowPeerErrors:(BOOL)a15
{
  id v21 = a3;
  v76 = (__CFString *)a4;
  __int16 v22 = (__CFString *)a5;
  id v23 = a6;
  int v24 = (__CFString *)a7;
  id v72 = (__CFString *)a8;
  id v69 = a9;
  long long v25 = self;
  __int16 v75 = (__CFString *)a10;
  id v73 = a11;
  id v74 = a12;
  id v26 = a13;
  v71 = (__CFString *)a14;
  long long v27 = [(MessageServiceSession *)self registeredURIs];
  if (!v27 && IMOSLoggingEnabled())
  {
    double v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "receivedError - No bindings !!", buf, 2u);
    }
  }
  if ([v27 containsObject:v23])
  {
    unsigned int v29 = 0;
    if (v23 && v24) {
      unsigned int v29 = [v23 isEqualToString:v24];
    }
    unsigned __int8 v30 = [v26 unsignedIntValue];
    unsigned __int8 v70 = [v26 unsignedIntValue];
    if (IMOSLoggingEnabled())
    {
      BOOL v31 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        CFStringRef v32 = @"NO";
        *(_DWORD *)buf = 138414338;
        v78 = v76;
        if (a15) {
          CFStringRef v33 = @"YES";
        }
        else {
          CFStringRef v33 = @"NO";
        }
        if (v29) {
          CFStringRef v34 = @"YES";
        }
        else {
          CFStringRef v34 = @"NO";
        }
        if (v30) {
          CFStringRef v35 = @"YES";
        }
        else {
          CFStringRef v35 = @"NO";
        }
        if ((v70 & 2) != 0) {
          CFStringRef v32 = @"YES";
        }
        __int16 v79 = 2112;
        CFStringRef v80 = v24;
        __int16 v81 = 2112;
        id v82 = v23;
        __int16 v83 = 2112;
        v84 = v72;
        __int16 v85 = 2112;
        v86 = v22;
        __int16 v87 = 2112;
        CFStringRef v88 = v33;
        __int16 v89 = 2112;
        CFStringRef v90 = v34;
        __int16 v91 = 2112;
        CFStringRef v92 = v35;
        __int16 v93 = 2112;
        CFStringRef v94 = v32;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Received error: %@ from ID: %@ to ID: %@ from token: %@  for messageID: %@  showError: %@  reflection: %@  from storage: %@  last from storage: %@", buf, 0x5Cu);
      }
    }
    if (v29)
    {
      if (IMOSLoggingEnabled())
      {
        int v36 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "Early returning for reflected error", buf, 2u);
        }
      }
      goto LABEL_140;
    }
    if ((v70 & 2) != 0)
    {
      [(MessageServiceSession *)v25 noteLastItemFromStorage:v22];
    }
    else if (v30)
    {
      [(MessageServiceSession *)v25 noteItemFromStorage:v22];
    }
    if (IMOSLoggingEnabled())
    {
      __int16 v37 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
      {
        CFStringRef v38 = @"YES";
        *(_DWORD *)buf = 138412802;
        v78 = v75;
        __int16 v79 = 2112;
        if (!v73) {
          CFStringRef v38 = @"NO";
        }
        CFStringRef v80 = v38;
        __int16 v81 = 2112;
        id v82 = v74;
        _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "fromIDSID:%@, needsDeliveryReceipt %@, deliveryContext %@", buf, 0x20u);
      }
    }
    signed int v39 = [(__CFString *)v76 intValue];
    v40 = [v21 account];
    v67 = [(MessageServiceSession *)v25 imdAccountForIDSAccount:v40];

    v41 = [(MessageServiceSession *)v25 deliveryController];
    v42 = [(__CFString *)v24 _stripFZIDPrefix];
    id v68 = [v41 activeDeviceForHandle:v42];

    id v66 = [(__CFString *)v68 idsDestination];
    if (v39 <= 399)
    {
      if (v39 > 199)
      {
        if (v39 == 200)
        {
          if (IMOSLoggingEnabled())
          {
            v59 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138413058;
              v78 = v22;
              __int16 v79 = 2112;
              CFStringRef v80 = v68;
              __int16 v81 = 2112;
              id v82 = v66;
              __int16 v83 = 2112;
              v84 = v75;
              _os_log_impl(&dword_0, v59, OS_LOG_TYPE_INFO, " => Pair decryption failure for messageID: %@ activeDevice: %@ activeIDSdestination: %@ fromIDSID: %@", buf, 0x2Au);
            }
          }
          if (([(MessageServiceSession *)v25 isReplicating] & 1) == 0)
          {
            LOBYTE(v64) = 0;
            [(MessageServiceSession *)v25 _reAttemptMessageDeliveryForGUID:v22 toIdentifier:v23 fromIdentifier:v24 fromIDSID:v75 isReflection:0 shouldShowError:a15 cacheFlushError:v64 imdAccount:v67];
            goto LABEL_137;
          }
          if (IMOSLoggingEnabled())
          {
            uint64_t v58 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              v78 = v22;
              _os_log_impl(&dword_0, v58, OS_LOG_TYPE_INFO, "Not reattempting delivery of guid %@, this is a replicating session", buf, 0xCu);
            }
            goto LABEL_130;
          }
          goto LABEL_137;
        }
        if (v39 != 201)
        {
          if (v39 == 250)
          {
            if (IMOSLoggingEnabled())
            {
              v53 = OSLogHandleForIMEventCategory();
              if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v78 = v22;
                _os_log_impl(&dword_0, v53, OS_LOG_TYPE_INFO, " => Remote encryption credentials are invalid failure for messageID: %@", buf, 0xCu);
              }
            }
            [(MessageServiceSession *)v25 didReceiveError:40 forMessageID:v22 forceError:a15 account:v67];
            goto LABEL_137;
          }
          goto LABEL_127;
        }
        if (IMOSLoggingEnabled())
        {
          v60 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v78 = v22;
            _os_log_impl(&dword_0, v60, OS_LOG_TYPE_INFO, " => Pair encryption failure for messageID: %@", buf, 0xCu);
          }
        }
LABEL_76:
        [(MessageServiceSession *)v25 didReceiveError:26 forMessageID:v22 forceError:a15 account:v67];
        goto LABEL_137;
      }
      if (!v39)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v58 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v58, OS_LOG_TYPE_INFO, " => No error!?", buf, 2u);
          }
          goto LABEL_130;
        }
        goto LABEL_137;
      }
      if (v39 != 120) {
        goto LABEL_127;
      }
      if (IMOSLoggingEnabled())
      {
        BOOL v55 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v78 = v22;
          _os_log_impl(&dword_0, v55, OS_LOG_TYPE_INFO, " => OTR un-supported error for messageID: %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (v39 <= 502)
      {
        switch(v39)
        {
          case 400:
            if (IMOSLoggingEnabled())
            {
              int v56 = OSLogHandleForIMEventCategory();
              if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                v78 = v22;
                __int16 v79 = 2112;
                CFStringRef v80 = v71;
                _os_log_impl(&dword_0, v56, OS_LOG_TYPE_INFO, " => Remote attachment download failure for messageID: %@, additionalInfo: %@", buf, 0x16u);
              }
            }
            if (v68
              && [v66 isEqualToString:v75]
              && [(__CFString *)v68 shouldDisplayAttachmentDownloadFailure])
            {
              if (IMOSLoggingEnabled())
              {
                v57 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  v78 = v68;
                  _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, "Found active device %@", buf, 0xCu);
                }
              }
              [(MessageServiceSession *)v25 didReceiveError:37 forMessageID:v22 forceError:a15 account:v67];
            }
            goto LABEL_137;
          case 500:
            if (IMOSLoggingEnabled())
            {
              uint64_t v58 = OSLogHandleForIMEventCategory();
              if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v78 = v22;
                _os_log_impl(&dword_0, v58, OS_LOG_TYPE_INFO, " => Empty message for message ID: %@", buf, 0xCu);
              }
              goto LABEL_130;
            }
LABEL_137:
            id v63 = [v21 account];
            [(MessageServiceSession *)v25 sendDeliveryReceiptForMessageID:v22 toID:v75 deliveryContext:v74 needsDeliveryReceipt:v73 callerID:v23 account:v63];

            if ((v70 & 2) != 0) {
              [(MessageServiceSession *)v25 noteLastItemProcessed];
            }

            goto LABEL_140;
          case 502:
            if (IMOSLoggingEnabled())
            {
              v43 = OSLogHandleForIMEventCategory();
              if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                v78 = v24;
                _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, " => Receiver (%@) has blackholed our conversation; updating conversation accordingly.",
                  buf,
                  0xCu);
              }
            }
            v44 = +[IMDMessageStore sharedInstance];
            v65 = [v44 chatForMessageGUID:v22];

            if (IMOSLoggingEnabled())
            {
              v45 = OSLogHandleForIMEventCategory();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                v46 = [v65 chatIdentifier];
                *(_DWORD *)buf = 138412802;
                v78 = v46;
                __int16 v79 = 2112;
                CFStringRef v80 = v24;
                __int16 v81 = 2112;
                id v82 = v23;
                _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "Chat (%@) iMessage history (NO) for sender (%@) and receiver (%@)", buf, 0x20u);
              }
            }
            if (+[IMSpamFilterHelper isInternationalSpamFilteringEnabled])
            {
              v47 = +[IMMetricsCollector sharedInstance];
              [v47 trackSpamEvent:8];

              if (IMStringIsEmail())
              {
                v48 = +[IMDAccountController sharedAccountController];
                unsigned int v49 = [v48 hasActivePhoneAccount];

                char v50 = +[IMMetricsCollector sharedInstance];
                char v51 = v50;
                if (v49) {
                  uint64_t v52 = 5;
                }
                else {
                  uint64_t v52 = 6;
                }
                [v50 trackSpamEvent:v52];
              }
              [v65 updateReceivedBlackholeError:1];
              [(MessageServiceSession *)v25 didReceiveError:43 forMessageID:v22 forceError:1 account:v67];
            }
            else
            {
              [(MessageServiceSession *)v25 didReceiveError:1 forMessageID:v22 forceError:a15 account:v67];
              if (IMOSLoggingEnabled())
              {
                BOOL v62 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 67109120;
                  LODWORD(v78) = v39;
                  _os_log_impl(&dword_0, v62, OS_LOG_TYPE_INFO, "Received unknown/unhandled error type: %d", buf, 8u);
                }
              }
            }

            goto LABEL_137;
        }
LABEL_127:
        [(MessageServiceSession *)v25 didReceiveError:1 forMessageID:v22 forceError:a15 account:v67];
        if (IMOSLoggingEnabled())
        {
          uint64_t v58 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 67109120;
            LODWORD(v78) = v39;
            _os_log_impl(&dword_0, v58, OS_LOG_TYPE_INFO, "Received unknown/unhandled error type: %d", buf, 8u);
          }
LABEL_130:

          goto LABEL_137;
        }
        goto LABEL_137;
      }
      if (v39 == 503)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v58 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v78 = v22;
            _os_log_impl(&dword_0, v58, OS_LOG_TYPE_INFO, "Sent messageID %@ was junked", buf, 0xCu);
          }
          goto LABEL_130;
        }
        goto LABEL_137;
      }
      if (v39 != 600)
      {
        if (v39 != 601) {
          goto LABEL_127;
        }
        if (IMOSLoggingEnabled())
        {
          v54 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            v78 = v22;
            _os_log_impl(&dword_0, v54, OS_LOG_TYPE_INFO, " => Remote Identity decryption failure for messageID: %@", buf, 0xCu);
          }
        }
        goto LABEL_76;
      }
      if (IMOSLoggingEnabled())
      {
        v61 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v78 = v22;
          _os_log_impl(&dword_0, v61, OS_LOG_TYPE_INFO, " => Remote identity encryption failure for messageID: %@", buf, 0xCu);
        }
      }
    }
    [(MessageServiceSession *)v25 didReceiveError:27 forMessageID:v22 forceError:a15 account:v67];
    goto LABEL_137;
  }
LABEL_140:
}

- (void)handler:(id)a3 messageIDDelivered:(id)a4 toIdentifier:(id)a5 status:(id)a6 deliveryContext:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  id v40 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v38 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  if (IMOSLoggingEnabled())
  {
    long long v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v17;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Received delivery receipt control message for message: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v54 = v20;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "context: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      CFStringRef v28 = @"YES";
      *(_DWORD *)buf = 138412802;
      id v54 = v21;
      __int16 v55 = 2112;
      if (!v22) {
        CFStringRef v28 = @"NO";
      }
      CFStringRef v56 = v28;
      __int16 v57 = 2112;
      id v58 = v23;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "fromIDSID:%@, needsDeliveryReceipt %@, deliveryContext %@", buf, 0x20u);
    }
  }
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_A614;
  v42[3] = &unk_DD848;
  v42[4] = self;
  id v43 = v19;
  id v44 = v17;
  id v45 = v40;
  id v46 = v24;
  id v47 = v20;
  id v48 = v38;
  id v49 = v18;
  id v50 = v21;
  id v51 = v22;
  id v52 = v23;
  id v37 = v23;
  id v36 = v22;
  id v35 = v21;
  id v29 = v18;
  id v39 = v38;
  id v30 = v20;
  id v31 = v24;
  id v32 = v40;
  id v33 = v17;
  id v34 = v19;
  [(MessageServiceSession *)self _enqueueBlock:v42 withTimeout:@"delivery receipt" description:45.0];
}

- (void)handler:(id)a3 messageIDReflectedDelivered:(id)a4 incomingMessage:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 status:(id)a8 deliveryContext:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14
{
  id v43 = a3;
  id v20 = a4;
  id v21 = a5;
  id v22 = a6;
  id v38 = a7;
  id v40 = a8;
  id v41 = a9;
  id v44 = a10;
  id v45 = a11;
  id v46 = a12;
  id v23 = a13;
  id v42 = a14;
  id v24 = [(MessageServiceSession *)self registeredURIs];
  if (!v24 && IMOSLoggingEnabled())
  {
    long long v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "messageIDRead - No bindings !!", buf, 2u);
    }
  }
  id v26 = [(MessageServiceSession *)self loginID];
  unsigned int v27 = [v26 isEqualToIgnoringCase:@"e:___TESTACCOUNT___@___TESTACCOUNT___.com"];

  LODWORD(v26) = [v22 isEqualToIgnoringCase:IDSDefaultPairedDevice];
  if (([v24 containsObject:v22] | v27 | v26) == 1)
  {
    if ([v21 length])
    {
      CFStringRef v28 = [v21 _FTOptionallyDecompressData];
      id v29 = JWDecodeDictionary();

      if (IMOSLoggingEnabled())
      {
        id v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v57 = v29;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Decrypted message from reflected delivery receipt handler messageDictionary: %@", buf, 0xCu);
        }
      }
      if (![v29 count])
      {
        uint64_t v31 = JWDecodeDictionary();

        if (IMOSLoggingEnabled())
        {
          id v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "Faild to decrypt, trying a simpler decode for reflected delivery receipt", buf, 2u);
          }
        }
        id v29 = (void *)v31;
        if (!v31)
        {
          if (IMOSLoggingEnabled())
          {
            id v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "BAD DATA for reflected delivery receipt", buf, 2u);
            }
          }
          id v29 = 0;
        }
      }
      if (IMOSLoggingEnabled())
      {
        id v34 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "Checking if we need to update the global read receipt value and updating if necessary", buf, 2u);
        }
      }
      [(MessageServiceSession *)self _checkGlobalReadReceiptValueAndUpdateIfNeeded:v29];
      if (IMOSLoggingEnabled())
      {
        id v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "Updating chat properties upon reflected delivery", buf, 2u);
        }
      }
      id v36 = +[IMDMessageStore sharedInstance];
      id v37 = [v36 chatForMessageGUID:v20];

      [(MessageServiceSession *)self _updateChatProperties:v37 withProperties:v29];
    }
    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_B2AC;
    v47[3] = &unk_DD870;
    id v48 = v20;
    id v49 = v23;
    id v50 = v45;
    id v51 = v46;
    id v52 = self;
    id v53 = v44;
    id v54 = v43;
    id v55 = v22;
    [(MessageServiceSession *)self _enqueueBlock:v47 withTimeout:@"reflected delivery receipt" description:45.0];
  }
}

- (void)handler:(id)a3 messageIDRead:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  id v35 = a3;
  id v18 = a4;
  id v19 = a5;
  id v36 = a6;
  id v37 = a7;
  id v38 = a8;
  id v20 = a9;
  id v39 = a10;
  id v21 = (uint64_t (*)(uint64_t, uint64_t))a11;
  id v22 = a12;
  id v23 = [(MessageServiceSession *)self registeredURIs];
  if (!v23 && IMOSLoggingEnabled())
  {
    id v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "messageIDRead - No bindings !!", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v18;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v20;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Received read receipt for guid:%@ fromIDSID:%@", buf, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      CFStringRef v27 = @"YES";
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v20;
      *(_WORD *)&buf[12] = 2112;
      if (!v39) {
        CFStringRef v27 = @"NO";
      }
      *(void *)&buf[14] = v27;
      *(_WORD *)&buf[22] = 2112;
      id v54 = v21;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "fromIDSID:%@, needsDeliveryReceipt %@, deliveryContext %@", buf, 0x20u);
    }
  }
  CFStringRef v28 = [(MessageServiceSession *)self loginID];
  unsigned int v29 = [v28 isEqualToIgnoringCase:@"e:___TESTACCOUNT___@___TESTACCOUNT___.com"];

  LODWORD(v28) = [v19 isEqualToIgnoringCase:IDSDefaultPairedDevice];
  if (([v23 containsObject:v19] | v29 | v28) == 1)
  {
    unsigned __int8 v30 = [v22 unsignedIntValue];
    unsigned __int8 v31 = [v22 unsignedIntValue];
    int v32 = v30 & 1;
    if ((v31 & 2) != 0)
    {
      [(MessageServiceSession *)self noteLastItemFromStorage:v18];
    }
    else if (v30)
    {
      [(MessageServiceSession *)self noteItemFromStorage:v18];
    }
    if (IMOSLoggingEnabled())
    {
      id v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Message Read message", buf, 2u);
      }
    }
    unsigned int v34 = v31 & 2;
    if (v34 | v32) {
      [(MessageServiceSession *)self incrementPendingReadReceiptFromStorageCount];
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    id v54 = sub_BACC;
    id v55 = sub_BADC;
    id v56 = 0;
    id v56 = [objc_alloc((Class)IMPowerAssertion) initWithIdentifier:@"IncomingReadReceiptAssertion" timeout:10.0];
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_BAE4;
    v40[3] = &unk_DD898;
    char v51 = v32;
    char v52 = v34 >> 1;
    v40[4] = self;
    id v41 = v36;
    id v42 = v19;
    id v43 = v18;
    id v44 = v37;
    id v45 = v38;
    id v46 = v20;
    id v47 = v21;
    id v48 = v39;
    id v49 = v35;
    id v50 = buf;
    [(MessageServiceSession *)self _enqueueBlock:v40 withTimeout:@"reflected read receipt" description:45.0];

    _Block_object_dispose(buf, 8);
  }
}

- (void)handler:(id)a3 messageIDPlayed:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  id v33 = a3;
  id v18 = a4;
  id v19 = a5;
  id v35 = a6;
  id v36 = a7;
  id v37 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = (uint64_t (*)(uint64_t, uint64_t))a11;
  id v23 = a12;
  id v24 = [(MessageServiceSession *)self registeredURIs];
  if (!v24 && IMOSLoggingEnabled())
  {
    long long v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "messageIDPlayed - No bindings !!", buf, 2u);
    }
  }
  id v26 = [(MessageServiceSession *)self loginID];
  unsigned int v27 = [v26 isEqualToIgnoringCase:@"e:___TESTACCOUNT___@___TESTACCOUNT___.com"];

  LODWORD(v26) = [v19 isEqualToIgnoringCase:IDSDefaultPairedDevice];
  if (([v24 containsObject:v19] | v27 | v26) == 1)
  {
    unsigned __int8 v28 = [v23 unsignedIntValue];
    unsigned __int8 v29 = [v23 unsignedIntValue];
    if ((v29 & 2) != 0)
    {
      [(MessageServiceSession *)self noteLastItemFromStorage:v18];
    }
    else if (v28)
    {
      [(MessageServiceSession *)self noteItemFromStorage:v18];
    }
    if (IMOSLoggingEnabled())
    {
      unsigned __int8 v30 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Message Played message", buf, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      unsigned __int8 v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        CFStringRef v32 = @"YES";
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v20;
        *(_WORD *)&buf[12] = 2112;
        if (!v21) {
          CFStringRef v32 = @"NO";
        }
        *(void *)&buf[14] = v32;
        *(_WORD *)&buf[22] = 2112;
        char v52 = v22;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "fromIDSID:%@, needsDeliveryReceipt %@, deliveryContext %@", buf, 0x20u);
      }
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    char v52 = sub_BACC;
    id v53 = sub_BADC;
    id v54 = 0;
    id v54 = [objc_alloc((Class)IMPowerAssertion) initWithIdentifier:@"IncomingPlayedReceiptAssertion" timeout:10.0];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_C374;
    v38[3] = &unk_DD8C0;
    id v39 = v35;
    id v40 = v19;
    id v41 = v18;
    id v42 = v36;
    id v43 = self;
    id v44 = v37;
    id v45 = v20;
    id v46 = v22;
    id v47 = v21;
    char v50 = (v29 & 2) >> 1;
    id v48 = v34;
    id v49 = buf;
    [(MessageServiceSession *)self _enqueueBlock:v38 withTimeout:@"reflected played receipt" description:45.0];

    _Block_object_dispose(buf, 8);
  }
}

- (void)handler:(id)a3 messageIDSaved:(id)a4 ofType:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 groupContext:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14
{
  id v34 = a3;
  id v20 = a4;
  id v35 = a5;
  id v21 = a6;
  id v36 = a7;
  id v37 = a8;
  id v38 = a9;
  id v39 = a10;
  id v40 = a11;
  id v22 = a12;
  id v23 = (uint64_t (*)(uint64_t, uint64_t))a13;
  id v24 = a14;
  long long v25 = [(MessageServiceSession *)self registeredURIs];
  if (!v25 && IMOSLoggingEnabled())
  {
    id v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "messageIDSaved - No bindings !!", buf, 2u);
    }
  }
  unsigned int v27 = [(MessageServiceSession *)self loginID];
  unsigned int v28 = [v27 isEqualToIgnoringCase:@"e:___TESTACCOUNT___@___TESTACCOUNT___.com"];

  LODWORD(v27) = [v21 isEqualToIgnoringCase:IDSDefaultPairedDevice];
  if (([v25 containsObject:v21] | v28 | v27) == 1)
  {
    unsigned __int8 v29 = [v24 unsignedIntValue];
    unsigned __int8 v30 = [v24 unsignedIntValue];
    if ((v30 & 2) != 0)
    {
      [(MessageServiceSession *)self noteLastItemFromStorage:v20];
    }
    else if (v29)
    {
      [(MessageServiceSession *)self noteItemFromStorage:v20];
    }
    if (IMOSLoggingEnabled())
    {
      unsigned __int8 v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Message Saved message", buf, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      CFStringRef v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        CFStringRef v33 = @"YES";
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v40;
        *(_WORD *)&buf[12] = 2112;
        if (!v22) {
          CFStringRef v33 = @"NO";
        }
        *(void *)&buf[14] = v33;
        *(_WORD *)&buf[22] = 2112;
        __int16 v57 = v23;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "fromIDSID:%@, needsDeliveryReceipt %@, deliveryContext %@", buf, 0x20u);
      }
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x3032000000;
    __int16 v57 = sub_BACC;
    id v58 = sub_BADC;
    id v59 = 0;
    id v59 = [objc_alloc((Class)IMPowerAssertion) initWithIdentifier:@"IncomingSavedReceiptAssertion" timeout:10.0];
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_CAF4;
    v41[3] = &unk_DD8E8;
    id v42 = v36;
    id v43 = v21;
    id v44 = v20;
    id v45 = v38;
    id v46 = self;
    id v47 = v37;
    id v48 = v35;
    id v49 = v39;
    id v50 = v34;
    id v51 = v40;
    char v52 = v23;
    char v55 = (v30 & 2) >> 1;
    id v53 = v22;
    id v54 = buf;
    [(MessageServiceSession *)self _enqueueBlock:v41 withTimeout:@"reflected saved receipt" description:45.0];

    _Block_object_dispose(buf, 8);
  }
}

- (BOOL)_isAllowlistedUnencryptedSender:(id)a3
{
  id v3 = a3;
  if (IMStringIsEmail()
    && (([v3 hasSuffix:@".apple.com"] & 1) != 0
     || [v3 hasSuffix:@"@apple.com"]))
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v3;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Received message from allowlisted unencrypted sender %@", (uint8_t *)&v7, 0xCu);
      }
    }
    BOOL v5 = 1;
  }
  else
  {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)_shouldIgnoreMessageFromSender:(id)a3 balloonBID:(id)a4 fromMe:(BOOL)a5
{
  id v7 = a3;
  id v8 = a4;
  BOOL v9 = (![v7 length] || !a5)
    && (![v7 length]
     || (IMStringIsBusinessID() & 1) == 0
     && [v8 containsString:IMBalloonPluginIdentifierBusiness]);

  return v9;
}

- (BOOL)_isRegisteredURI:(id)a3
{
  id v3 = a3;
  if (v3)
  {
    long long v27 = 0u;
    long long v28 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [(id)objc_opt_class() idsAccounts];
    id v19 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
    if (v19)
    {
      uint64_t v4 = *(void *)v26;
      uint64_t v18 = *(void *)v26;
      do
      {
        for (i = 0; i != v19; i = (char *)i + 1)
        {
          if (*(void *)v26 != v4) {
            objc_enumerationMutation(obj);
          }
          id v6 = *(void **)(*((void *)&v25 + 1) + 8 * i);
          long long v21 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          id v7 = objc_msgSend(v6, "im_registeredURIs");
          id v8 = [v7 countByEnumeratingWithState:&v21 objects:v33 count:16];
          if (v8)
          {
            uint64_t v9 = *(void *)v22;
            while (2)
            {
              for (j = 0; j != v8; j = (char *)j + 1)
              {
                if (*(void *)v22 != v9) {
                  objc_enumerationMutation(v7);
                }
                __int16 v11 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
                if (IMOSLoggingEnabled())
                {
                  unsigned int v12 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v30 = v11;
                    __int16 v31 = 2112;
                    CFStringRef v32 = v6;
                    _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Registered URI %@ for account %@", buf, 0x16u);
                  }
                }
                __int16 v13 = [v3 _stripFZIDPrefix];
                unsigned __int8 v14 = [v11 isEqualToIgnoringCase:v13];

                if (v14)
                {

                  BOOL v16 = 1;
                  goto LABEL_27;
                }
              }
              id v8 = [v7 countByEnumeratingWithState:&v21 objects:v33 count:16];
              if (v8) {
                continue;
              }
              break;
            }
          }

          uint64_t v4 = v18;
        }
        id v19 = [obj countByEnumeratingWithState:&v25 objects:v34 count:16];
        uint64_t v4 = v18;
      }
      while (v19);
    }

    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v30 = v3;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "URI %@ is not in registered URI set", buf, 0xCu);
      }
    }
  }
  BOOL v16 = 0;
LABEL_27:

  return v16;
}

- (BOOL)_isFromLinkedID:(id)a3 fromID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412546;
      id v12 = v6;
      __int16 v13 = 2112;
      id v14 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Checking isFromLinkedID toID %@ and fromID %@", (uint8_t *)&v11, 0x16u);
    }
  }
  BOOL v9 = 0;
  if (v6 && v7)
  {
    if ([(MessageServiceSession *)self _isRegisteredURI:v6]) {
      BOOL v9 = [(MessageServiceSession *)self _isRegisteredURI:v7];
    }
    else {
      BOOL v9 = 0;
    }
  }

  return v9;
}

- (unint64_t)_computeFlagsForIncomingMessage:(unint64_t)a3 isFromMe:(BOOL)a4 unfinished:(BOOL)a5 isAudioMessage:(BOOL)a6 isAutoReply:(BOOL)a7 isExpirable:(BOOL)a8 messageSource:(unint64_t)a9 participants:(id)a10 hasUnseenMention:(BOOL)a11 isSOS:(BOOL)a12 isCritical:(BOOL)a13
{
  BOOL v13 = a8;
  BOOL v14 = a7;
  BOOL v15 = a6;
  BOOL v16 = a5;
  if (a4)
  {
    id v18 = [a10 count];
    uint64_t v19 = 32772;
    if ((unint64_t)v18 < 3) {
      uint64_t v19 = 36868;
    }
    a3 |= v19;
  }
  unint64_t v20 = a3 | !v16;
  if (v15) {
    v20 |= 0x200000uLL;
  }
  if (v14) {
    v20 |= 0x40uLL;
  }
  if (v13) {
    v20 |= 0x1000000uLL;
  }
  if (a9 == 1) {
    v20 |= 0x2000000uLL;
  }
  if (a11) {
    v20 |= 0x10000000uLL;
  }
  if (a12) {
    v20 |= 0x8000000000uLL;
  }
  if (a13) {
    return v20 | 0x4000000000;
  }
  else {
    return v20;
  }
}

- (BOOL)_shouldAdjustTimestampOfResentMessages
{
  return _IMSharedHelperShouldAdjustTimestampOfResentMessages(self, a2);
}

- (double)_messageRetryTimeout
{
  _IMSharedHelperRetryTimeout(self, a2);
  return result;
}

- (BOOL)_originalTimestampWithinAcceptableWindow:(id)a3 timestamp:(id)a4
{
  id v6 = a4;
  id v7 = +[NSDate __im_iMessageDateFromTimeStamp:a3];
  id v8 = +[NSDate __im_iMessageDateFromTimeStamp:v6];

  unint64_t v9 = (unint64_t)[v7 compare:v8];
  [(MessageServiceSession *)self _messageRetryTimeout];
  long long v10 = objc_msgSend(v7, "dateByAddingTimeInterval:");
  unint64_t v11 = v9 & (unint64_t)[v8 compare:v10];

  return v11 == -1;
}

- (BOOL)_amIMentioned:(id)a3 inMentions:(id)a4
{
  id v5 = a3;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v6 = a4;
  id v7 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v19 != v9) {
          objc_enumerationMutation(v6);
        }
        unint64_t v11 = objc_msgSend(*(id *)(*((void *)&v18 + 1) + 8 * i), "componentsSeparatedByString:", @"|", (void)v18);
        if ((unint64_t)[v11 count] >= 2)
        {
          id v12 = [v11 objectAtIndexedSubscript:1];
          BOOL v13 = [v12 stringByRemovingURLEscapes];

          BOOL v14 = [v5 _stripFZIDPrefix];
          unsigned __int8 v15 = [v13 isEqualToString:v14];

          if (v15)
          {

            BOOL v16 = 1;
            goto LABEL_12;
          }
        }
      }
      id v8 = [v6 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
  BOOL v16 = 0;
LABEL_12:

  return v16;
}

- (void)handler:(id)a3 incomingMessage:(id)a4 originalEncryptionType:(id)a5 messageID:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 incomingEngroup:(id)a12 needsDeliveryReceipt:(id)a13 deliveryContext:(id)a14 storageContext:(id)a15 messageContext:(id)a16 isBeingReplayed:(BOOL)a17 mergeID:(id)a18 wantsCheckpointing:(BOOL)a19 isSnapTrustedUser:(BOOL)a20
{
  id v86 = a3;
  id v25 = a4;
  id v84 = a5;
  CFStringRef v90 = (__CFString *)a6;
  id v88 = a7;
  id v89 = a8;
  id v78 = a9;
  long long v26 = v25;
  id v77 = a10;
  id v79 = a11;
  id v76 = a12;
  id v80 = a13;
  id v81 = a14;
  id v85 = a15;
  id v82 = a16;
  id v83 = a18;
  long long v27 = +[IMDefaults sharedInstance];
  if (([v27 getBoolFromDomain:@"com.apple.madrid" forKey:@"FailToDecryptMessages"] & 1) == 0)
  {

LABEL_14:
    CFStringRef v33 = +[IMMessageNotificationTimeManager sharedInstance];
    [v33 acquireAssertionToUnsuspendProcess];

    kdebug_trace();
    [(MessageServiceSession *)self _logLocalInfo];
    char v73 = sub_2FF18();
    unsigned int v74 = [v89 isEqualToString:v88];
    int v34 = ([v85 unsignedIntValue] | a17) & 1;
    unsigned __int8 v35 = [v85 unsignedIntValue];
    char v72 = v34;
    if ((v35 & 2) != 0)
    {
      [(MessageServiceSession *)self noteLastItemFromStorage:v90];
      id v36 = v84;
    }
    else
    {
      id v36 = v84;
      if (v34) {
        [(MessageServiceSession *)self noteItemFromStorage:v90];
      }
    }
    if (v36) {
      unsigned int v75 = [v36 isEqualToString:@"none"] ^ 1;
    }
    else {
      unsigned int v75 = 0;
    }
    uint64_t v115 = 0;
    v116 = &v115;
    uint64_t v117 = 0x3032000000;
    v118 = sub_BACC;
    v119 = sub_BADC;
    id v120 = 0;
    id v120 = [objc_alloc((Class)IMPowerAssertion) initWithIdentifier:@"IncomingMessageProcessing" timeout:60.0];
    if (qword_EB400 != -1) {
      dispatch_once(&qword_EB400, &stru_DD970);
    }
    id v37 = (void (*)(uint64_t, const __CFString *, NSDictionary *, void))off_EB3F8;
    if (off_EB3F8)
    {
      id v38 = +[NSNumber numberWithBool:v75 ^ 1];
      id v39 = [v89 _stripFZIDPrefix];
      id v40 = [v88 _stripFZIDPrefix];
      v37(7, @"iMessageReceived", +[NSDictionary dictionaryWithObjectsAndKeys:v38, @"IsTypingIndicator", v90, @"MessageGUID", v39, @"Source", v40, @"Target", 0], 0);
    }
    if (IMOSLoggingEnabled())
    {
      id v41 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        if (v74) {
          CFStringRef v42 = @"YES";
        }
        else {
          CFStringRef v42 = @"NO";
        }
        id v43 = +[NSDate date];
        [v43 timeIntervalSinceReferenceDate];
        if (a17) {
          CFStringRef v45 = @"YES";
        }
        else {
          CFStringRef v45 = @"NO";
        }
        *(_DWORD *)buf = 134220802;
        uint64_t v131 = (uint64_t)v25;
        __int16 v132 = 2112;
        CFStringRef v133 = v90;
        __int16 v134 = 2112;
        id v135 = v89;
        __int16 v136 = 2112;
        id v137 = v88;
        __int16 v138 = 2048;
        id v139 = v82;
        __int16 v140 = 2112;
        CFStringRef v141 = v42;
        __int16 v142 = 2048;
        uint64_t v143 = v44;
        __int16 v144 = 2112;
        id v145 = v80;
        __int16 v146 = 2112;
        id v147 = v81;
        __int16 v148 = 2112;
        id v149 = v79;
        __int16 v150 = 2112;
        CFStringRef v151 = v45;
        __int16 v152 = 2112;
        id v153 = v83;
        _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "Incoming message data: %p ID: %@  from: %@   to: %@  context: %p  (from me: %@) at time: %f, needsDeliveryReceipt: %@, deliveryContext: %@, fromIDSID %@ isBeingReplayed %@ MergeID:%@", buf, 0x7Au);
      }
    }
    id v46 = im_checkpointIDSService();
    im_sendMessageCheckpointIfNecessary();

    id v47 = +[IMLockdownManager sharedInstance];
    unsigned int v48 = [v47 isInternalInstall];

    if (!v48) {
      goto LABEL_76;
    }
    id v49 = +[IMDefaults sharedInstance];
    id v50 = [v49 getValueFromDomain:@"com.apple.madrid" forKey:@"numMessagesToDrop"];
    id v51 = (char *)[v50 integerValue];

    char v52 = v51 - 1;
    if ((uint64_t)v51 >= 1)
    {
      id v53 = +[IMDefaults sharedInstance];
      id v54 = +[NSNumber numberWithInteger:v51 - 1];
      [v53 setValue:v54 forDomain:@"com.apple.madrid" forKey:@"numMessagesToDrop"];

      if (IMOSLoggingEnabled())
      {
        char v55 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
        {
          id v56 = +[NSNumber numberWithInteger:v52];
          *(_DWORD *)buf = 138412290;
          uint64_t v131 = (uint64_t)v56;
          _os_log_impl(&dword_0, v55, OS_LOG_TYPE_INFO, "***** Dropping message due to user default. Will drop %@ more messages after this one *****", buf, 0xCu);
        }
      }
    }
    else
    {
LABEL_76:
      if (IMOSLoggingEnabled())
      {
        __int16 v57 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v57, OS_LOG_TYPE_DEBUG))
        {
          CFStringRef v58 = @"NO";
          if (v75) {
            CFStringRef v58 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          uint64_t v131 = (uint64_t)v25;
          __int16 v132 = 2112;
          CFStringRef v133 = v58;
          _os_log_impl(&dword_0, v57, OS_LOG_TYPE_DEBUG, "Decrypted data %@  isEncrypted? %@", buf, 0x16u);
        }
      }
      if (v25 || !v75)
      {
        v71 = +[NSDate date];
        if (IMOSLoggingEnabled())
        {
          v61 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v131 = (uint64_t)v77;
            _os_log_impl(&dword_0, v61, OS_LOG_TYPE_DEBUG, "Timestamp: %@ before calling receive message data", buf, 0xCu);
          }
        }
        BOOL v62 = [(MessageServiceSession *)self groupController];
        id v63 = [v86 account];
        uint64_t v64 = [(MessageServiceSession *)self imdAccountForIDSAccount:v63];
        unsigned __int8 v70 = [v86 service];
        if ((v35 & 2) != 0) {
          char v65 = 1;
        }
        else {
          char v65 = v72;
        }
        char v69 = v65;
        v91[0] = _NSConcreteStackBlock;
        v91[1] = 3221225472;
        v91[2] = sub_E5E4;
        v91[3] = &unk_DDB00;
        id v92 = v89;
        char v107 = v74;
        id v93 = v77;
        CFStringRef v94 = self;
        char v108 = (v35 & 2) >> 1;
        id v95 = v88;
        v106 = &v115;
        v96 = v90;
        id v97 = v82;
        id v98 = v86;
        char v109 = v75;
        id v99 = v78;
        BOOL v110 = a20;
        id v100 = v26;
        char v111 = v73;
        id v60 = v71;
        id v101 = v60;
        char v112 = v72;
        id v102 = v79;
        BOOL v113 = a19;
        id v103 = v83;
        BOOL v114 = a17;
        id v104 = v80;
        id v105 = v81;
        LOBYTE(v68) = v69;
        [v62 receiveMessageData:v100 account:v64 session:self toIdentifier:v95 fromIdentifier:v92 incomingEngroup:v76 service:v70 timestamp:v93 fromStorage:v68 completionBlock:v91];

        goto LABEL_64;
      }
      if (IMOSLoggingEnabled())
      {
        id v59 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v59, OS_LOG_TYPE_DEBUG))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v59, OS_LOG_TYPE_DEBUG, "We received an incoming message but it has no data, ignoring", buf, 2u);
        }
      }
      if ((v35 & 2) != 0) {
        [(MessageServiceSession *)self noteLastItemProcessed];
      }
    }
    id v60 = (id)v116[5];
    v116[5] = 0;
LABEL_64:

    _Block_object_dispose(&v115, 8);
    goto LABEL_65;
  }
  long long v28 = +[IMLockdownManager sharedInstance];
  unsigned int v29 = [v28 isInternalInstall];

  if (!v29) {
    goto LABEL_14;
  }
  int v30 = IMOSLoggingEnabled();
  if (v25)
  {
    if (v30)
    {
      __int16 v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v131 = 0x4028000000000000;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, " ** FailToDecryptMessages is enabled, sending decryption failure message with delay %f", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      CFStringRef v32 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v131 = 0x4028000000000000;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, " ** FailToDecryptMessages is enabled, sending decryption failure message with delay %f", buf, 0xCu);
      }
    }
    v121 = _NSConcreteStackBlock;
    uint64_t v122 = 3221225472;
    v123 = sub_E4A4;
    v124 = &unk_DD950;
    v125 = self;
    id v126 = v78;
    id v127 = v89;
    id v128 = v88;
    v129 = v90;
    im_dispatch_after();
  }
  else
  {
    if (v30)
    {
      id v66 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v66, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v66, OS_LOG_TYPE_INFO, " ** FailToDecryptMessages is enabled, but this is a typing indicator. Dropping message without sending 120", buf, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v67 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v67, OS_LOG_TYPE_INFO, " ** FailToDecryptMessages is enabled, but this is a typing indicator. Dropping message without sending 120", buf, 2u);
      }
    }
  }
LABEL_65:
}

- (BOOL)_shouldOptimizedDeliveryReceiptForConversation:(id)a3 withMessageTimeStamp:(id)a4
{
  return 0;
}

- (void)handler:(id)a3 nicknameInfoReceived:(id)a4 userInfo:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 fromToken:(id)a8 timeStamp:(id)a9 fromIDSID:(id)a10 needsDeliveryReceipt:(id)a11 deliveryContext:(id)a12 storageContext:(id)a13
{
  id v38 = a3;
  id v19 = a4;
  id v39 = a5;
  id v20 = a6;
  id v21 = a7;
  id v37 = a8;
  id v22 = a9;
  id v23 = a10;
  id v24 = a11;
  id v25 = a12;
  id v36 = a13;
  long long v26 = [(MessageServiceSession *)self registeredURIs];
  if (!v26 && IMOSLoggingEnabled())
  {
    long long v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "nicknameInfoReceived - No bindings !!", buf, 2u);
    }
  }
  if ([v26 containsObject:v20])
  {
    long long v28 = [v19 _FTOptionallyDecompressData];
    JWDecodeDictionary();
    id v35 = v25;
    id v29 = v24;
    id v30 = v23;
    id v31 = v22;
    v33 = id v32 = v19;

    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_150A4;
    v40[3] = &unk_DDB28;
    v40[4] = self;
    id v41 = v33;
    id v42 = v21;
    id v43 = v39;
    id v34 = v33;
    [(MessageServiceSession *)self _enqueueBlock:v40 withTimeout:@"nickname received block" description:45.0];

    id v19 = v32;
    id v22 = v31;
    id v23 = v30;
    id v24 = v29;
    id v25 = v35;
  }
}

- (void)handler:(id)a3 locationShareInfo:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  id v31 = a3;
  id v18 = a4;
  id v19 = a5;
  CFStringRef v33 = (__CFString *)a6;
  id v20 = a7;
  id v32 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = a11;
  id v24 = a12;
  id v25 = [(MessageServiceSession *)self registeredURIs];
  if (!v25 && IMOSLoggingEnabled())
  {
    long long v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "genericNotification - No bindings !!", buf, 2u);
    }
  }
  if ([v25 containsObject:v19])
  {
    [(MessageServiceSession *)self _logLocalInfo];
    if (IMOSLoggingEnabled())
    {
      long long v27 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v35 = v18;
        __int16 v36 = 2112;
        CFStringRef v37 = v33;
        __int16 v38 = 2112;
        id v39 = v20;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Received location share info: %@ from: %@   token: %@", buf, 0x20u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      long long v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        CFStringRef v29 = @"YES";
        *(_DWORD *)buf = 138412802;
        id v35 = v21;
        __int16 v36 = 2112;
        if (!v22) {
          CFStringRef v29 = @"NO";
        }
        CFStringRef v37 = v29;
        __int16 v38 = 2112;
        id v39 = v23;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "fromIDSID:%@, needsDeliveryReceipt %@, deliveryContext %@", buf, 0x20u);
      }
    }
    id v30 = +[IMDLocationSharingController sharedInstance];
    [v30 receivedIncomingLocationSharePacket:v18];
  }
}

- (void)handler:(id)a3 genericNotification:(id)a4 incomingMessage:(id)a5 userInfo:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14
{
  id v60 = a3;
  id v20 = a4;
  id v21 = a5;
  id v66 = a6;
  id v22 = a7;
  uint64_t v68 = (__CFString *)a8;
  id v67 = a9;
  id v61 = a10;
  id v23 = self;
  id v65 = a11;
  id v63 = a12;
  id v64 = a13;
  id v62 = a14;
  id v24 = [(MessageServiceSession *)self registeredURIs];
  if (!v24 && IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "genericNotification - No bindings !!", buf, 2u);
    }
  }
  if ([v24 containsObject:v22])
  {
    [(MessageServiceSession *)v23 _logLocalInfo];
    if (!v20) {
      id v20 = v66;
    }
    if (IMOSLoggingEnabled())
    {
      long long v26 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v70 = v20;
        __int16 v71 = 2112;
        CFStringRef v72 = v68;
        __int16 v73 = 2112;
        id v74 = v67;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Received generic notification: %@ from: %@ token: %@", buf, 0x20u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      long long v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        CFStringRef v28 = @"YES";
        *(_DWORD *)buf = 138412802;
        id v70 = v65;
        __int16 v71 = 2112;
        if (!v63) {
          CFStringRef v28 = @"NO";
        }
        CFStringRef v72 = v28;
        __int16 v73 = 2112;
        id v74 = v64;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "fromIDSID:%@, needsDeliveryReceipt %@, deliveryContext %@", buf, 0x20u);
      }
    }
    theDict = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    CFStringRef v29 = [(__CFString *)v68 _stripFZIDPrefix];
    if (v29) {
      CFDictionarySetValue(theDict, kFZPersonID, v29);
    }

    id v30 = [v20 objectForKey:@"c"];
    id v59 = [v20 objectForKey:@"p"];
    if ([v21 length])
    {
      id v31 = [v21 _FTOptionallyDecompressData];
      id v32 = JWDecodeDictionary();

      if (IMOSLoggingEnabled())
      {
        CFStringRef v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v70 = v32;
          _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Decrypted message from generic notification messageDictionary: %@", buf, 0xCu);
        }
      }
      if (![v32 count])
      {
        uint64_t v34 = JWDecodeDictionary();

        if (IMOSLoggingEnabled())
        {
          id v35 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "Faild to decrypt, trying a simpler decode for generic notification", buf, 2u);
          }
        }
        id v32 = (void *)v34;
        if (!v34)
        {
          if (IMOSLoggingEnabled())
          {
            __int16 v36 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "BAD DATA for generic notification", buf, 2u);
            }
          }
          id v32 = 0;
        }
      }
      if (!v30
        || (+[NSNumber numberWithInteger:180],
            CFStringRef v37 = objc_claimAutoreleasedReturnValue(),
            unsigned int v38 = [v30 isEqualToNumber:v37],
            v37,
            v38))
      {
        uint64_t v39 = [v32 objectForKey:@"gC"];

        id v30 = (void *)v39;
      }
      if (!v59)
      {
        id v59 = [v32 objectForKey:@"pID"];
      }
    }
    else
    {
      id v32 = v20;
    }
    if (IMOSLoggingEnabled())
    {
      id v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v70 = v30;
        __int16 v71 = 2112;
        CFStringRef v72 = v59;
        _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "Received generic notification with command: %@ properties: %@", buf, 0x16u);
      }
    }
    if (!v30) {
      goto LABEL_91;
    }
    unsigned int v41 = [v30 intValue];
    switch(v41)
    {
      case 0x11170u:
        if (IMOSLoggingEnabled())
        {
          unsigned int v48 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "Received generic command for nickname updates", buf, 2u);
          }
        }
        id v49 = [(MessageServiceSession *)v23 deliveryController];
        id v50 = [v49 idsDeviceFromPushToken:v67];

        if (v50)
        {
          id v51 = +[IMDNicknameController sharedInstance];
          [v51 handleNicknameUpdatesFromPeerDevice:v59 fromPeerDevice:v65];
        }
        else if (IMOSLoggingEnabled())
        {
          id v56 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v56, OS_LOG_TYPE_INFO, "Received a nickname update message from a device that was not one of our own", buf, 2u);
          }
        }
        goto LABEL_91;
      case 0xEA61u:
        if (IMOSLoggingEnabled())
        {
          char v52 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v52, OS_LOG_TYPE_INFO, "Received generic notification to update global read receipt", buf, 2u);
          }
        }
        id v53 = [(MessageServiceSession *)v23 deliveryController];
        id v54 = [v53 idsDeviceFromPushToken:v67];

        if (v54)
        {
          [(MessageServiceSession *)v23 _checkGlobalReadReceiptValueAndUpdateIfNeeded:v59];
        }
        else if (IMOSLoggingEnabled())
        {
          __int16 v57 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, "Received a read receipt change message from a device that was not one of our own", buf, 2u);
          }
        }
        break;
      case 0xEA60u:
        if (IMOSLoggingEnabled())
        {
          id v42 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "Received generic notification to update chat properties", buf, 2u);
          }
        }
        id v43 = [(MessageServiceSession *)v23 deliveryController];
        uint64_t v44 = [v43 idsDeviceFromPushToken:v67];

        CFStringRef v45 = [v32 objectForKey:@"cID"];
        id v46 = +[IMDChatRegistry sharedInstance];
        id v47 = [v46 existingChatWithGUID:v45];

        if (v44 && v47)
        {
          [(MessageServiceSession *)v23 _updateChatProperties:v47 withProperties:v59];
        }
        else if (IMOSLoggingEnabled())
        {
          char v55 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v70 = v44;
            __int16 v71 = 2112;
            CFStringRef v72 = v45;
            _os_log_impl(&dword_0, v55, OS_LOG_TYPE_INFO, "Received a chat property update message from a device that was not one of our own %@, or the chat GUID was unknown %@", buf, 0x16u);
          }
        }
        goto LABEL_91;
      default:
        if (!IMOSLoggingEnabled())
        {
LABEL_91:

          goto LABEL_92;
        }
        id v54 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v70 = v30;
          _os_log_impl(&dword_0, v54, OS_LOG_TYPE_INFO, "Trying to handle generic message that we don't have support for: %@", buf, 0xCu);
        }
        break;
    }

    goto LABEL_91;
  }
  id v32 = v20;
LABEL_92:
}

- (void)_handleDeleteCommandWithMessageDictionary:(id)a3
{
  id v4 = a3;
  [(MessageServiceSession *)self deleteChatsForCommandDictionary:v4];
  id v49 = v4;
  [v4 objectForKeyedSubscript:@"chat-clear"];
  long long v64 = 0u;
  long long v65 = 0u;
  long long v62 = 0u;
  long long v63 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v52 = [obj countByEnumeratingWithState:&v62 objects:v76 count:16];
  if (v52)
  {
    uint64_t v51 = *(void *)v63;
    do
    {
      uint64_t v5 = 0;
      do
      {
        if (*(void *)v63 != v51)
        {
          uint64_t v6 = v5;
          objc_enumerationMutation(obj);
          uint64_t v5 = v6;
        }
        uint64_t v53 = v5;
        id v7 = *(void **)(*((void *)&v62 + 1) + 8 * v5);
        id v8 = +[NSMutableArray array];
        long long v60 = 0u;
        long long v61 = 0u;
        long long v58 = 0u;
        long long v59 = 0u;
        uint64_t v9 = [v7 objectForKeyedSubscript:@"guids"];
        id v10 = [v9 countByEnumeratingWithState:&v58 objects:v75 count:16];
        if (v10)
        {
          uint64_t v11 = *(void *)v59;
          do
          {
            for (i = 0; i != v10; i = (char *)i + 1)
            {
              if (*(void *)v59 != v11) {
                objc_enumerationMutation(v9);
              }
              uint64_t v13 = *(void *)(*((void *)&v58 + 1) + 8 * i);
              BOOL v14 = [(MessageServiceSession *)self chatRegistry];
              unsigned __int8 v15 = [v14 existingChatWithGUID:v13];

              if (v15) {
                [v8 addObject:v15];
              }
            }
            id v10 = [v9 countByEnumeratingWithState:&v58 objects:v75 count:16];
          }
          while (v10);
        }

        if (![v8 count])
        {
          BOOL v16 = [(MessageServiceSession *)self chatRegistry];
          id v17 = [v7 objectForKeyedSubscript:@"groupID"];
          uint64_t v18 = [v16 existingChatsWithGroupID:v17];

          id v8 = (void *)v18;
        }
        if ([v8 count])
        {
          id v19 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
          id v20 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithCapacity:", objc_msgSend(v8, "count"));
          long long v56 = 0u;
          long long v57 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          id v21 = v8;
          id v22 = [v21 countByEnumeratingWithState:&v54 objects:v74 count:16];
          if (v22)
          {
            uint64_t v23 = *(void *)v55;
            do
            {
              for (j = 0; j != v22; j = (char *)j + 1)
              {
                if (*(void *)v55 != v23) {
                  objc_enumerationMutation(v21);
                }
                id v25 = *(void **)(*((void *)&v54 + 1) + 8 * (void)j);
                long long v26 = [v25 chatIdentifier];
                [v19 addObject:v26];

                long long v27 = [v25 serviceName];
                [v20 addObject:v27];

                id v28 = [v25 style];
              }
              uint64_t v29 = (uint64_t)v28;
              id v22 = [v21 countByEnumeratingWithState:&v54 objects:v74 count:16];
            }
            while (v22);
          }
          else
          {
            uint64_t v29 = 45;
          }

          if (IMOSLoggingEnabled())
          {
            id v30 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              id v67 = v19;
              __int16 v68 = 2112;
              id v69 = v20;
              _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "clearing messages for chat IDS:%@ on services:%@", buf, 0x16u);
            }
          }
          id v31 = +[IMDMessageStore sharedInstance];
          id v32 = [v31 deleteMessagesWithChatIdentifiers:v19 style:v29 onServices:v20];

          CFStringRef v33 = [(MessageServiceSession *)self broadcasterForChatListeners];
          [v33 historicalMessageGUIDsDeleted:v32 chatGUIDs:0 queryID:0];

          uint64_t v34 = [(MessageServiceSession *)self broadcasterForChatListenersWithBlackholeStatus:1];
          [v34 historicalMessageGUIDsDeleted:v32 chatGUIDs:0 queryID:0];
        }
        uint64_t v5 = v53 + 1;
      }
      while ((id)(v53 + 1) != v52);
      id v52 = [obj countByEnumeratingWithState:&v62 objects:v76 count:16];
    }
    while (v52);
  }

  id v35 = [v49 objectForKeyedSubscript:@"message"];
  if ([v35 count])
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        id v37 = [v35 count];
        *(_DWORD *)buf = 134217984;
        id v67 = v37;
        _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "deleteing %lu: messages", buf, 0xCu);
      }
    }
    [(MessageServiceSession *)self deleteMessagesForCommandDictionary:v49];
  }
  unsigned int v38 = [v49 objectForKeyedSubscript:@"parts"];
  if ([v38 count]) {
    [(MessageServiceSession *)self deleteMessagePartsForCommandDictionary:v49];
  }
  uint64_t v39 = [v49 objectForKeyedSubscript:@"KeepMessages"];
  id v40 = v39;
  if (v39)
  {
    unsigned int v41 = [v39 objectForKeyedSubscript:@"days"];
    id v42 = [v40 objectForKeyedSubscript:@"ID"];
    id v43 = [v40 objectForKeyedSubscript:@"resetPreference"];
    uint64_t v44 = IMGetDomainValueForKey();
    if (v41 && v42)
    {
      if (IMOSLoggingEnabled())
      {
        CFStringRef v45 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413058;
          id v67 = v41;
          __int16 v68 = 2112;
          id v69 = v42;
          __int16 v70 = 2112;
          __int16 v71 = v43;
          __int16 v72 = 2112;
          __int16 v73 = v44;
          _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "Updated Keep Message Defaults Days:%@ Version:%@ resettingPreference: %@ currentKeepMessagesValue %@", buf, 0x2Au);
        }
      }
      IMSetDomainValueForKey();
      IMSetDomainValueForKey();
      DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
      CFNotificationCenterPostNotification(DarwinNotifyCenter, IMSettingsKeepMessagesChangedNotification, 0, 0, 1u);
      if ([v43 BOOLValue] && objc_msgSend(v44, "unsignedIntegerValue"))
      {
        if (IMOSLoggingEnabled())
        {
          id v47 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v47, OS_LOG_TYPE_INFO, "Received resetting keep messages preference. Writing default to show UI", buf, 2u);
          }
        }
        IMSetDomainValueForKey();
        unsigned int v48 = CFNotificationCenterGetDarwinNotifyCenter();
        CFNotificationCenterPostNotification(v48, IMSettingsKeepMessagesWasResetNotification, 0, 0, 1u);
      }
    }
  }
}

- (void)handler:(id)a3 deleteCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  id v40 = a3;
  id v18 = a4;
  id v41 = a5;
  id v42 = a6;
  id v19 = a7;
  id v46 = a8;
  id v47 = a9;
  id v43 = a10;
  id v44 = a11;
  id v45 = a12;
  id v20 = [(MessageServiceSession *)self deliveryController];
  id v21 = [v20 idsDeviceFromPushToken:v19];

  if (v21
    || ([(MessageServiceSession *)self deliveryController],
        id v22 = objc_claimAutoreleasedReturnValue(),
        [v22 idsDeviceForFromID:v47],
        id v21 = objc_claimAutoreleasedReturnValue(),
        v22,
        v21))
  {
    uint64_t v23 = objc_msgSend(v18, "_FTOptionallyDecompressData", v40);
    JWDecodeDictionary();
    id v24 = (id)objc_claimAutoreleasedReturnValue();

    unsigned int v25 = [v21 isActive];
    long long v26 = [v24 objectForKey:@"chat"];
    long long v27 = [v26 objectAtIndex:0];
    id v28 = [v27 objectForKey:IMDChatWasReportedAsJunkKey];
    unsigned int v29 = [v28 BOOLValue];

    id v30 = [v24 objectForKey:IMDDeleteCommandIsScheduledMessageKey];
    unsigned int v31 = [v30 BOOLValue];

    id v32 = [(MessageServiceSession *)self ckUtilities];
    unsigned int v33 = [v32 cloudKitSyncingEnabled];

    int v34 = IMOSLoggingEnabled();
    if (((v25 | v33 | v29) | v31))
    {
      if (v34)
      {
        id v35 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138413314;
          id v51 = v24;
          __int16 v52 = 1024;
          *(_DWORD *)uint64_t v53 = v33;
          *(_WORD *)&v53[4] = 1024;
          *(_DWORD *)&v53[6] = v29;
          __int16 v54 = 1024;
          unsigned int v55 = v25;
          __int16 v56 = 1024;
          unsigned int v57 = v31;
          _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "Handling delete command: %@ (cloudkitSyncEnabled: %d, wasReportedAsJunk: %d, senderIsPairedWatch: %d, isScheduledMessage: %d)", buf, 0x24u);
        }
      }
      if ([(MessageServiceSession *)self shouldInferRecoverableDeleteForCommandDictionary:v24])
      {
        __int16 v36 = +[NSDate __im_iMessageDateFromTimeStamp:v46];
        uint64_t v37 = [(MessageServiceSession *)self deleteCommandDictionaryWithIncomingDictionary:v24 inferredRecoverableDeleteForLegacyCommandsWithDate:v36];

        id v24 = (id)v37;
      }
      [(MessageServiceSession *)self _logLocalInfo];
      v48[0] = _NSConcreteStackBlock;
      v48[1] = 3221225472;
      v48[2] = sub_16BD4;
      v48[3] = &unk_DDB50;
      v48[4] = self;
      id v24 = v24;
      id v49 = v24;
      [(MessageServiceSession *)self _enqueueBlock:v48 withTimeout:@"deleteCommand block" description:45.0];
    }
    else if (v34)
    {
      unsigned int v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v51 = v24;
        _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "sender is not watch and iCloudSync not enabled and not reported as junk and is not a scheduled message, dropping delete command: %@", buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v39 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v51 = v19;
      __int16 v52 = 2112;
      *(void *)uint64_t v53 = v47;
      _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Received a delete command, but it was not from one of our own devices From: %@, ID:%@", buf, 0x16u);
    }
  }
}

- (void)handler:(id)a3 recoverCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 fromIDSID:(id)a9 needsDeliveryReceipt:(id)a10 deliveryContext:(id)a11 storageContext:(id)a12
{
  id v34 = a3;
  id v18 = a4;
  id v35 = a5;
  id v36 = a6;
  id v19 = a7;
  id v37 = a8;
  id v20 = a9;
  id v38 = a10;
  id v21 = a11;
  id v22 = a12;
  uint64_t v23 = [(MessageServiceSession *)self deliveryController];
  id v24 = [v23 idsDeviceFromPushToken:v19];

  if (v24
    || ([(MessageServiceSession *)self deliveryController],
        unsigned int v25 = objc_claimAutoreleasedReturnValue(),
        [v25 idsDeviceForFromID:v20],
        id v24 = objc_claimAutoreleasedReturnValue(),
        v25,
        v24))
  {
    long long v26 = [v18 _FTOptionallyDecompressData];
    long long v27 = JWDecodeDictionary();

    id v28 = [(MessageServiceSession *)self ckUtilities];
    unsigned __int8 v29 = [v28 cloudKitSyncingEnabled];

    int v30 = IMOSLoggingEnabled();
    if (v29)
    {
      if (v30)
      {
        unsigned int v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v42 = v27;
          _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Handling recover command: %@ cloudkitSyncEnabled: YES)", buf, 0xCu);
        }
      }
      [(MessageServiceSession *)self _logLocalInfo];
      v39[0] = _NSConcreteStackBlock;
      v39[1] = 3221225472;
      v39[2] = sub_16FD8;
      v39[3] = &unk_DDB50;
      v39[4] = self;
      id v40 = v27;
      [(MessageServiceSession *)self _enqueueBlock:v39 withTimeout:@"recoverCommand block" description:45.0];
    }
    else if (v30)
    {
      id v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v42 = v27;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "iCloudSync not enabled dropping recover command: %@", buf, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    unsigned int v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v42 = v19;
      __int16 v43 = 2112;
      id v44 = v20;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Received a recover command, but it was not from one of our own devices From: %@, ID:%@", buf, 0x16u);
    }
  }
}

- (void)handler:(id)a3 groupMessageCommand:(id)a4 encryptedGroupCommand:(id)a5 messageID:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 fromToken:(id)a9 timeStamp:(id)a10 fromIDSID:(id)a11 needsDeliveryReceipt:(id)a12 deliveryContext:(id)a13 storageContext:(id)a14
{
  id v29 = a3;
  id v28 = a4;
  id v20 = a5;
  id v21 = a6;
  id v22 = a7;
  id v33 = a8;
  id v32 = a9;
  id v31 = a10;
  id v30 = a11;
  id v23 = a12;
  id v24 = a13;
  id v25 = a14;
  long long v26 = [(MessageServiceSession *)self registeredURIs];
  if (!v26 && IMOSLoggingEnabled())
  {
    long long v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "genericNotification - No bindings !!", buf, 2u);
    }
  }
  if ([v26 containsObject:v22])
  {
    [(MessageServiceSession *)self _logLocalInfo];
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_17328;
    v34[3] = &unk_DDB78;
    id v35 = v28;
    id v36 = v33;
    id v37 = v32;
    id v38 = v30;
    id v39 = v23;
    id v40 = v24;
    id v41 = v20;
    id v42 = self;
    id v43 = v29;
    id v44 = v21;
    id v45 = v22;
    id v46 = v31;
    id v47 = v25;
    [(MessageServiceSession *)self _enqueueBlock:v34 withTimeout:@"groupMessageCommand block" description:45.0];
  }
}

- (void)handler:(id)a3 bubblePayloadData:(id)a4 forMessageID:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 fromToken:(id)a8 timeStamp:(id)a9 fromIDSID:(id)a10 needsDeliveryReceipt:(id)a11 deliveryContext:(id)a12 storageContext:(id)a13
{
  id v37 = a3;
  id v19 = a4;
  id v39 = a5;
  id v20 = a6;
  id v38 = a7;
  id v21 = a8;
  id v22 = self;
  id v31 = a9;
  id v33 = a10;
  id v34 = a11;
  id v35 = a12;
  id v23 = a13;
  id v24 = [(MessageServiceSession *)v22 registeredURIs];
  if (!v24 && IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "bubblePayload - No bindings !!", buf, 2u);
    }
  }
  if (objc_msgSend(v24, "containsObject:", v20, v31))
  {
    long long v26 = JWDecodeDictionary();
    long long v27 = [v26 objectForKey:@"bid"];
    if (v27)
    {
      id v28 = [v26 objectForKey:@"p"];
      id v36 = [v26 objectForKey:@"bpdi"];
      if (v28 || [v36 count])
      {
        [(MessageServiceSession *)v22 _logLocalInfo];
        v40[0] = _NSConcreteStackBlock;
        v40[1] = 3221225472;
        v40[2] = sub_17B9C;
        v40[3] = &unk_DD870;
        id v41 = v39;
        id v42 = v27;
        id v43 = v22;
        id v44 = v37;
        id v45 = v28;
        id v46 = v36;
        id v47 = v38;
        id v48 = v21;
        [(MessageServiceSession *)v22 _enqueueBlock:v40 withTimeout:@"bubble payload block" description:45.0];
      }
      else if (IMOSLoggingEnabled())
      {
        id v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v50 = v39;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Did not get any data for message guid %@", buf, 0xCu);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "bubblePayload - No bundle id !!", buf, 2u);
      }
    }
  }
}

- (void)handler:(id)a3 remoteFileResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, " Incomming Remote File response %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v9 = [(MessageServiceSession *)self attachmentController];
  [v9 remoteFileResponse:v7];
}

- (void)handler:(id)a3 remoteFileRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, " Incomming Remote File Request %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v9 = [(MessageServiceSession *)self attachmentController];
  [v9 remotefileRequest:v7 attempts:0 shouldRetry:1];
}

- (void)networkMonitorDidUpdate:(id)a3
{
  id v4 = a3;
  v9.receiver = self;
  v9.super_class = (Class)MessageServiceSession;
  [(MessageServiceSession *)&v9 networkMonitorDidUpdate:v4];
  uint64_t v5 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v6 = [v5 isCarrierPigeonEnabled];

  if (v6)
  {
    if ([v4 immediatelyReachable])
    {
      id v7 = +[IMFeatureFlags sharedFeatureFlags];
      unsigned int v8 = [v7 isIMLLegacyRelayEnabled];

      if (v8) {
        [(MessageServiceSession *)self _processMessagesForRelayIfNeeded];
      }
    }
  }
}

- (void)_processMessagesForRelayIfNeeded
{
  if (IMGetCachedDomainBoolForKey())
  {
    if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Processing messages for relay", buf, 2u);
      }
    }
    id v4 = +[IMDServiceController sharedController];
    uint64_t v5 = [v4 serviceWithName:IMServiceNameiMessageLite];

    IMSetDomainBoolForKey();
    unsigned int v6 = +[IMDMessageStore sharedInstance];
    v7[0] = _NSConcreteStackBlock;
    v7[1] = 3221225472;
    v7[2] = sub_18624;
    v7[3] = &unk_DDBC8;
    v7[4] = self;
    [v6 enumerateMessagesToRelayOnService:v5 usingBlock:v7];
  }
}

- (void)relayLegacySatelliteMessage:(id)a3 toChat:(id)a4
{
  id v6 = a3;
  id v7 = [(MessageServiceSession *)self chatForChatIdentifier:a4 style:45];
  [(MessageServiceSession *)self _relayLegacySatelliteMessage:v6 toChat:v7];
}

- (void)_relayLegacySatelliteMessage:(id)a3 toChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = objc_alloc_init((Class)NSMutableArray);
  id v32 = 0;
  objc_super v9 = _LastAddressedURIForChatLogMetricIfNeeded(v7, 0, self, &v32, 0);
  id v26 = v32;
  if (v9) {
    [v8 addObject:v9];
  }
  int v10 = [v7 participants];
  id v29 = URIsFromHandles(v10);

  [v8 addObjectsFromArray:v29];
  v30[0] = _NSConcreteStackBlock;
  v30[1] = 3221225472;
  v30[2] = sub_18BEC;
  v30[3] = &unk_DD998;
  id v11 = v6;
  id v31 = v11;
  id v25 = objc_retainBlock(v30);
  id v12 = [(MessageServiceSession *)self deliveryController];
  uint64_t v13 = [v7 guid];
  id v28 = [v12 messageDictionaryWithMessageItem:v11 isBusiness:0 chatIdentifier:v13 toParticipants:v8 originallyToParticipants:v8 additionalContext:0 msgPayloadUploadDictionary:0 originalPayload:0];

  BOOL v14 = +[NSString stringGUID];
  long long v27 = IDSGetUUIDData();
  unsigned __int8 v15 = [(MessageServiceSession *)self deliveryController];
  BOOL v16 = [v7 guid];
  id v17 = +[NSSet setWithObject:IDSRegistrationPropertySupportsSenderKey];
  LOWORD(v24) = 0;
  id v18 = objc_msgSend(v15, "idsOptionsWithMessageItem:toID:fromID:sendGUIDData:alternateCallbackID:isBusinessMessage:chatIdentifier:requiredRegProperties:interestingRegProperties:requiresLackOfRegProperties:deliveryContext:isGroupChat:canInlineAttachments:msgPayloadUploadDictionary:messageDictionary:", v11, 0, v9, v27, v14, 0, v16, 0, 0, v17, 0, v24, 0, v28);

  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      id v20 = [v11 guid];
      *(_DWORD *)buf = 138412290;
      id v34 = v20;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Sending message for relay: %@", buf, 0xCu);
    }
  }
  id v21 = [(MessageServiceSession *)self deliveryController];
  id v22 = +[NSSet setWithArray:v8];
  LOBYTE(v23) = 1;
  [v21 sendMessageDictionary:&__NSDictionary0__struct encryptDictionary:0 fromID:v9 fromAccount:v26 toURIs:v22 toGroup:0 priority:300 options:v18 willSendBlock:0 callCompletionOnSuccess:v23 completionBlock:v25];
}

- (void)messageDeliveryController:(id)a3 service:(id)a4 didFlushCacheForRemoteURI:(id)a5 fromURI:(id)a6 guid:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  if ([(MessageServiceSession *)self isReplicating])
  {
    if (IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v20 = v16;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Not reattempting delivery of guid %@, this is a replicating session", buf, 0xCu);
      }
    }
  }
  else
  {
    LOBYTE(v18) = 1;
    [(MessageServiceSession *)self _reAttemptMessageDeliveryForGUID:v16 toIdentifier:v15 fromIdentifier:v14 fromIDSID:0 isReflection:0 shouldShowError:0 cacheFlushError:v18 imdAccount:0];
  }
}

- (void)messageDeliveryController:(id)a3 serverUpdatedTimestampMessage:(id)a4
{
  id v5 = a4;
  id v6 = [v5 guid];
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  id v7 = [(MessageServiceSession *)self chatRegistry];
  id v8 = [v7 chats];

  id v9 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v18;
    while (2)
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v18 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v17 + 1) + 8 * i);
        id v14 = [v13 lastMessage];
        id v15 = [v14 guid];
        unsigned int v16 = [v15 isEqualToIgnoringCase:v6];

        if (v16)
        {
          [v13 setLastMessage:v5];
          goto LABEL_11;
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v17 objects:v21 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }
LABEL_11:
}

- (void)messageDeliveryController:(id)a3 service:(id)a4 didFlushCacheForKTPeerURI:(id)a5
{
  id v5 = a5;
  id v7 = +[IMDBroadcastController sharedProvider];
  id v6 = [v7 broadcasterForKeyTransparencyListeners];
  [v6 refreshStatusForKTPeerURI:v5];
}

- (void)_forwardP2PGroupCommand:(id)a3 fromPerson:(id)a4 toPerson:(id)a5 toGroup:(id)a6
{
}

- (void)_forwardP2PGroupCommand:(id)a3 fromPerson:(id)a4 toPerson:(id)a5 toGroup:(id)a6 toToken:(id)a7
{
}

- (void)_forwardP2PGroupCommand:(id)a3 fromPerson:(id)a4 toPerson:(id)a5 toGroup:(id)a6 toToken:(id)a7 messageID:(id)a8
{
  id v14 = (__CFDictionary *)a3;
  id v15 = a4;
  id v16 = a5;
  id v50 = (__CFDictionary *)a6;
  id v51 = a7;
  id v17 = a8;
  if (v15 && v14 && v16)
  {
    long long v18 = [v16 _stripFZIDPrefix];

    long long v19 = [v15 _stripFZIDPrefix];

    id v49 = [v19 _bestGuessURI];
    long long v20 = [(MessageServiceSession *)self idsAccountForFromURI:v49 toURI:v18];
    id v21 = v20;
    if (v20)
    {
      id v48 = v20;
    }
    else
    {
      id v48 = [(MessageServiceSession *)self idsAccount];
    }

    if (IMOSLoggingEnabled())
    {
      id v22 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        __int16 v56 = v14;
        __int16 v57 = 2112;
        long long v58 = v19;
        __int16 v59 = 2112;
        long long v60 = v18;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Request to forward P2P group command: %@  fromID: %@ to person: %@", buf, 0x20u);
      }
    }
    [(MessageServiceSession *)self _logLocalInfo];
    if ([(MessageServiceSession *)self _isDeviceRegisteredForAccount:v48])
    {
      if ([(MessageServiceSession *)self isReplicating])
      {
        theDict = (__CFDictionary *)[(__CFDictionary *)v14 mutableCopy];
        uint64_t v23 = [(MessageServiceSession *)self service];
        uint64_t v24 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v23 replicationSourceID]);

        if (v24) {
          CFDictionarySetValue(theDict, @"rp", v24);
        }
      }
      else
      {
        theDict = v14;
      }
      id v45 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      id v26 = +[NSNumber numberWithUnsignedInt:190];
      if (v26)
      {
        CFDictionarySetValue(v45, @"c", v26);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_95BA8();
      }

      id v27 = v18;
      if (v27)
      {
        CFDictionarySetValue(v45, @"id", v27);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_95B20();
      }

      if (theDict) {
        CFDictionarySetValue(v45, @"p", theDict);
      }
      id v46 = +[NSSet set];
      if ([(MessageServiceSession *)self isReplicating])
      {
        uint64_t v54 = IDSRegistrationPropertySupportsHybridGroupsV1;
        id v28 = +[NSArray arrayWithObjects:&v54 count:1];
        uint64_t v29 = +[NSSet setWithArray:v28];

        id v46 = (void *)v29;
      }
      id v30 = JWEncodeDictionary();
      id v31 = [(MessageServiceSession *)self groupController];
      unsigned int v32 = [v31 shouldCompressGroupPayload:theDict];

      if (v32)
      {
        id v33 = [v30 _FTCopyGzippedData];

        id v30 = v33;
      }
      id v34 = objc_alloc_init((Class)NSMutableDictionary);
      v52[0] = IDSSendMessageOptionTopLevelDictionaryKey;
      v52[1] = IDSSendMessageOptionSkipPayloadCheckKey;
      v53[0] = &__kCFBooleanTrue;
      v53[1] = &__kCFBooleanTrue;
      v52[2] = IDSSendMessageOptionCommandKey;
      id v35 = +[NSNumber numberWithInteger:190];
      v53[2] = v35;
      v52[3] = IDSSendMessageOptionRequireAllRegistrationPropertiesKey;
      v52[4] = IDSSendMessageOptionDataToEncryptKey;
      v53[3] = v46;
      v53[4] = v30;
      v52[5] = IDSSendMessageOptionWantsResponseKey;
      v53[5] = &off_E36A8;
      id v36 = +[NSDictionary dictionaryWithObjects:v53 forKeys:v52 count:6];
      [v34 addEntriesFromDictionary:v36];

      if (v17)
      {
        id v37 = IDSGetUUIDData();
        [v34 setObject:v37 forKeyedSubscript:IDSSendMessageOptionUUIDKey];
      }
      id v38 = [v27 _bestGuessURI];
      id v39 = v38;
      if (v51)
      {
        id v39 = +[IDSDestination destinationWithAlias:v38 pushToken:v51];
      }
      if (IMOSLoggingEnabled())
      {
        id v40 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          __int16 v56 = v50;
          _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "Sending P2P command to engroup: %@", buf, 0xCu);
        }
      }
      id v41 = [(MessageServiceSession *)self deliveryController];
      id v42 = +[NSDictionary dictionary];
      id v43 = +[NSSet setWithObject:v39];
      id v44 = [v34 copy];
      [v41 sendMessageDictionary:v42 fromID:v49 fromAccount:v48 toURIs:v43 toGroup:v50 priority:300 options:v44 completionBlock:&stru_DDBE8];

      id v14 = theDict;
    }
    else if (IMOSLoggingEnabled())
    {
      id v25 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, " ** Not sending command, device is not registered", buf, 2u);
      }
    }
  }
  else
  {
    long long v18 = v16;
    long long v19 = v15;
  }
}

- (void)sendLocationSharingInfo:(id)a3 toID:(id)a4 completionBlock:(id)a5
{
  id v23 = a3;
  id v8 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v28 = v23;
      __int16 v29 = 2112;
      id v30 = v8;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Request to send location sharing info: %@   to person: %@", buf, 0x16u);
    }
  }
  [(MessageServiceSession *)self _logLocalInfo];
  uint64_t v11 = [(MessageServiceSession *)self callerURIUsingCalleeURI:v8];
  id v12 = [(MessageServiceSession *)self idsAccountForFromURI:v11 toURI:v8];
  if ([(MessageServiceSession *)self _isDeviceRegisteredForAccount:v12])
  {
    id v22 = +[NSString stringGUID];
    id v21 = +[NSSet setWithObject:IDSRegistrationPropertySupportsLocationSharing];
    id v13 = IDSGetUUIDData();
    id v14 = +[NSNumber numberWithInteger:195];
    id v15 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v13, IDSSendMessageOptionUUIDKey, v14, IDSSendMessageOptionCommandKey, v21, IDSSendMessageOptionRequireAllRegistrationPropertiesKey, 0);

    id v16 = [(MessageServiceSession *)self deliveryController];
    id v17 = +[NSDictionary dictionaryWithObjectsAndKeys:v23, @"p", 0];
    long long v18 = [v8 _bestGuessURI];
    long long v19 = +[NSSet setWithObject:v18];
    v24[0] = _NSConcreteStackBlock;
    v24[1] = 3221225472;
    v24[2] = sub_19DDC;
    v24[3] = &unk_DDC10;
    id v25 = v8;
    id v26 = v9;
    [v16 sendMessageDictionary:v17 fromID:v11 fromAccount:v12 toURIs:v19 toGroup:0 priority:300 options:v15 completionBlock:v24];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v20 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, " ** Not sending command, device is not registered", buf, 2u);
      }
    }
    if (v9) {
      (*((void (**)(id, void))v9 + 2))(v9, 0);
    }
  }
}

- (id)idsServiceForIDSAccount:(id)a3
{
  id v4 = a3;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  id v5 = self->_messagePushHandlers;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v31;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v31 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(void **)(*((void *)&v30 + 1) + 8 * v8);
      id v10 = [v9 account];
      unsigned __int8 v11 = [v10 isEqual:v4];

      if (v11) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v30 objects:v35 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v9;

    if (v12) {
      goto LABEL_21;
    }
  }
  else
  {
LABEL_9:
  }
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id v13 = self->_messagePushHandlers;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v27;
LABEL_13:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v27 != v15) {
        objc_enumerationMutation(v13);
      }
      id v17 = *(void **)(*((void *)&v26 + 1) + 8 * v16);
      long long v18 = [v17 account];
      long long v19 = [v18 loginID];
      long long v20 = [v4 loginID];
      unsigned __int8 v21 = [v19 isEqual:v20];

      if (v21) {
        break;
      }
      if (v14 == (id)++v16)
      {
        id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v26 objects:v34 count:16];
        if (v14) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
    id v12 = v17;

    if (!v12) {
      goto LABEL_22;
    }
LABEL_21:
    id v22 = [v12 service];
  }
  else
  {
LABEL_19:

LABEL_22:
    if (IMOSLoggingEnabled())
    {
      id v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v25 = 0;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Couldn't find push handler", v25, 2u);
      }
    }
    id v12 = 0;
    id v22 = 0;
  }

  return v22;
}

- (void)_engroupForChat:(id)a3 idsAccount:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (!v8)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Trying to look up an engroup on a nil chat", buf, 2u);
      }
    }
    goto LABEL_9;
  }
  unsigned __int8 v11 = [v8 engramID];
  id v12 = [v11 length];

  if (!v12)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Trying to look up an engroup for a chat that does not have an engram ID", buf, 2u);
      }
    }
LABEL_9:
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
    goto LABEL_21;
  }
  id v13 = [(MessageServiceSession *)self idsServiceForIDSAccount:v9];
  if (v13)
  {
    id v14 = [(MessageServiceSession *)self groupController];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1A4F4;
    v18[3] = &unk_DDC38;
    id v19 = v8;
    id v20 = v10;
    [v14 engroupForChat:v19 service:v13 completionBlock:v18];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v22 = v8;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Got a nil service back when trying to look up engroup for chat: %@", buf, 0xCu);
      }
    }
    (*((void (**)(id, void, void))v10 + 2))(v10, 0, 0);
  }

LABEL_21:
}

- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChat:(id)a5 style:(unsigned __int8)a6
{
  id v42 = a3;
  id v41 = a4;
  id v9 = a5;
  unsigned __int8 v64 = a6;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v42;
      __int16 v68 = 2112;
      id v69 = v9;
      __int16 v70 = 1024;
      int v71 = v64;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Request to invite person: %@   chat: %@  style: %c", buf, 0x1Cu);
    }
  }
  [(MessageServiceSession *)self _logLocalInfo];
  id v63 = v9;
  [(MessageServiceSession *)self canonicalizeChatIdentifier:&v63 style:&v64];
  id v48 = v63;

  unsigned __int8 v11 = v48;
  if (v48)
  {
    id v12 = [(MessageServiceSession *)self chatForChatIdentifier:v48 style:v64];
    id v62 = 0;
    id v46 = _LastAddressedURIForChatLogMetricIfNeeded(v12, 0, self, &v62, 0);
    id v47 = v62;
    id v40 = -[MessageServiceSession idsServiceForIDSAccount:](self, "idsServiceForIDSAccount:");
    [(MessageServiceSession *)self _fixParticipantsForChat:v12];
    id v13 = +[IMDFileTransferCenter sharedInstance];
    id v14 = [v12 groupPhotoGuid];
    uint64_t v15 = [v13 transferForGUID:v14];
    id v39 = [v15 _dictionaryToSend];

    *(void *)buf = 0;
    objc_initWeak((id *)buf, self);
    uint64_t v16 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v42 count]);
    long long v60 = 0u;
    long long v61 = 0u;
    long long v58 = 0u;
    long long v59 = 0u;
    id v17 = v42;
    id v18 = [v17 countByEnumeratingWithState:&v58 objects:v66 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v59;
      uint64_t v20 = kFZPersonID;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v59 != v19) {
            objc_enumerationMutation(v17);
          }
          id v22 = [*(id *)(*((void *)&v58 + 1) + 8 * i) objectForKeyedSubscript:v20];
          if (v22) {
            [v16 addObject:v22];
          }
        }
        id v18 = [v17 countByEnumeratingWithState:&v58 objects:v66 count:16];
      }
      while (v18);
    }

    id v23 = [(MessageServiceSession *)self groupController];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_1AC04;
    v54[3] = &unk_DDC60;
    id v38 = v16;
    id v55 = v38;
    objc_copyWeak(&v57, (id *)buf);
    id v56 = v12;
    id v37 = v56;
    objc_msgSend(v23, "addParticipants:toChat:fromID:fromAccount:session:service:groupPhoto:completionBlock:", v38, v39, v54);

    long long v52 = 0u;
    long long v53 = 0u;
    long long v50 = 0u;
    long long v51 = 0u;
    id obj = v17;
    id v24 = [obj countByEnumeratingWithState:&v50 objects:v65 count:16];
    if (v24)
    {
      uint64_t v25 = *(void *)v51;
      uint64_t v26 = kFZPersonID;
      uint64_t v45 = kFZPersonUnformattedName;
      uint64_t v44 = kFZPersonCountryCode;
      do
      {
        for (j = 0; j != v24; j = (char *)j + 1)
        {
          if (*(void *)v51 != v25) {
            objc_enumerationMutation(obj);
          }
          long long v28 = *(void **)(*((void *)&v50 + 1) + 8 * (void)j);
          long long v29 = [v28 objectForKeyedSubscript:v26];
          if (v29)
          {
            long long v30 = [v28 objectForKey:v45];
            long long v31 = [v28 objectForKey:v44];
            unsigned __int8 v32 = v64;
            long long v33 = [(MessageServiceSession *)self imdAccountForIDSAccount:v47];
            id v34 = [v46 _stripFZIDPrefix];
            LOBYTE(v36) = v32;
            id v35 = [(MessageServiceSession *)self didChangeMemberStatus:2 forHandle:v29 fromHandle:0 unformattedNumber:v30 countryCode:v31 forChat:v48 style:v36 account:v33 destinationCallerID:v34];
          }
        }
        id v24 = [obj countByEnumeratingWithState:&v50 objects:v65 count:16];
      }
      while (v24);
    }

    objc_destroyWeak(&v57);
    objc_destroyWeak((id *)buf);

    unsigned __int8 v11 = v48;
  }
}

- (id)generateAndStoreGroupPhotoChangeStatusItemForChat:(id)a3 sender:(id)a4 fileTransferGuid:(id)a5 isHidden:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  int v13 = IMOSLoggingEnabled();
  if (v10)
  {
    if (v13)
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        uint64_t v15 = [v10 guid];
        CFStringRef v16 = @"NO";
        *(_DWORD *)long long v50 = 138413058;
        *(void *)&v50[4] = v15;
        if (v6) {
          CFStringRef v16 = @"YES";
        }
        *(_WORD *)&v50[12] = 2112;
        *(void *)&v50[14] = v11;
        __int16 v51 = 2112;
        id v52 = v12;
        __int16 v53 = 2112;
        CFStringRef v54 = v16;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Generating IMGroupActionItem for group photo update. chatGuid %@ sender %@ fileTransferGuid %@ isHidden %@", v50, 0x2Au);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long v50 = 138412290;
        *(void *)&v50[4] = v10;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, " => chat: %@", v50, 0xCu);
      }
    }
    id v18 = objc_msgSend(v10, "lastAddressedLocalHandle", *(_OWORD *)v50);
    if ([v11 isEqualToString:v18])
    {
    }
    else
    {
      unsigned __int8 v21 = [(MessageServiceSession *)self account];
      id v22 = [v21 loginID];
      id v23 = [v22 _stripFZIDPrefix];
      unsigned int v24 = [v11 isEqualToString:v23];

      if (!v24)
      {
LABEL_25:
        uint64_t v26 = IMMessageGuidFromIMFileTransferGuid();
        long long v27 = v26;
        if (v26)
        {
          id v28 = v26;
        }
        else
        {
          id v28 = +[NSString stringGUID];
        }
        long long v29 = v28;

        long long v30 = [(MessageServiceSession *)self messageStore];
        long long v31 = [v30 itemWithGUID:v29];
        if (v31) {
          BOOL v32 = v6;
        }
        else {
          BOOL v32 = 0;
        }

        if (v32)
        {
          if (IMOSLoggingEnabled())
          {
            long long v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long v50 = 0;
              _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "We've already created a status item for this transfer, and the new one is hidden, don't show anything new.", v50, 2u);
            }
          }
          uint64_t v20 = 0;
        }
        else
        {
          id v34 = objc_alloc((Class)IMGroupActionItem);
          id v35 = +[NSDate date];
          id v36 = [v34 initWithSender:v11 time:v35 guid:v29 type:3];

          id v37 = [(MessageServiceSession *)self service];
          id v38 = [v37 internalName];
          [v36 setService:v38];

          id v39 = [(MessageServiceSession *)self account];
          id v40 = [v39 accountID];
          [v36 setAccountID:v40];

          id v41 = [(MessageServiceSession *)self account];
          id v42 = [v41 loginID];
          [v36 setAccount:v42];

          id v43 = [v10 chatIdentifier];
          [v36 setRoomName:v43];

          uint64_t v44 = 3;
          if (!v6) {
            uint64_t v44 = 1;
          }
          if (v12) {
            uint64_t v45 = v44;
          }
          else {
            uint64_t v45 = 2;
          }
          [v36 setActionType:v45];
          id v46 = [(MessageServiceSession *)self messageStore];
          uint64_t v20 = [v46 storeItem:v36 forceReplace:0];

          id v47 = [(MessageServiceSession *)self chatStore];
          id v48 = [v20 guid];
          [v47 addMessageWithGUID:v48 toChat:v10];
        }
        goto LABEL_44;
      }
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long v50 = 138412290;
        *(void *)&v50[4] = v11;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Setting sender to nil (myself) because sender %@ is the lastAddressedLocalHandle or the current account's login ID", v50, 0xCu);
      }
    }
    id v11 = 0;
    goto LABEL_25;
  }
  if (v13)
  {
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v50 = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "generateAndStoreGroupPhotoChangeStatusItemForChat passed a nil chat. early returning nil", v50, 2u);
    }
  }
  uint64_t v20 = 0;
LABEL_44:

  return v20;
}

- (void)groupPhotoUploadCompletedForChat:(id)a3 fileTransferGuid:(id)a4 callerURI:(id)a5 fromAccount:(id)a6 message:(id)a7 displayIDs:(id)a8 additionalContext:(id)a9 success:(BOOL)a10 isPhotoRefresh:(BOOL)a11 error:(unsigned int)a12
{
  id v17 = a3;
  id v18 = a4;
  id v19 = a5;
  id v20 = a6;
  id v21 = a7;
  id v22 = a8;
  id v23 = a9;
  if (IMOSLoggingEnabled())
  {
    unsigned int v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      uint64_t v25 = [v17 guid];
      uint64_t v26 = (void *)v25;
      CFStringRef v27 = @"NO";
      *(_DWORD *)buf = 138413058;
      if (a10) {
        CFStringRef v27 = @"YES";
      }
      uint64_t v38 = v25;
      __int16 v39 = 2112;
      id v40 = v18;
      __int16 v41 = 2112;
      CFStringRef v42 = v27;
      __int16 v43 = 1024;
      unsigned int v44 = a12;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "upload group photo complete. chatGuid %@ fileTransferGuid %@ success %@ error %u", buf, 0x26u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v38 = (uint64_t)v17;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
    }
  }
  if (v17 && [v17 style] != 45)
  {
    if (a10)
    {
      long long v29 = +[IMDFileTransferCenter sharedInstance];
      long long v30 = [v29 transferForGUID:v18];

      long long v31 = +[NSDate date];
      [v30 setRefreshDate:v31];

      BOOL v32 = +[IMDAttachmentStore sharedInstance];
      long long v33 = [v21 guid];
      [v32 storeAttachment:v30 associateWithMessageWithGUID:v33];

      id v34 = [(MessageServiceSession *)self groupController];
      id v35 = [v30 _dictionaryToSend];
      [v34 setGroupPhoto:v35 forChat:v17 fromID:v19 fromAccount:v20 session:self isPhotoRefresh:a11];
    }
    else
    {
      [(MessageServiceSession *)self groupPhotoUploadFailedForChat:v17 fileTransferGuid:v18];
    }
  }
}

- (void)groupPhotoUploadFailedForChat:(id)a3 fileTransferGuid:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [v5 guid];
      int v22 = 138412546;
      id v23 = v6;
      __int16 v24 = 2112;
      uint64_t v25 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "group photo %@ upload failed for chatGuid %@", (uint8_t *)&v22, 0x16u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v5;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, " => chat: %@", (uint8_t *)&v22, 0xCu);
    }
  }
  id v10 = [v5 groupPhotoGuid];
  unsigned int v11 = [v10 isEqualToString:v6];

  if (v11)
  {
    id v12 = [v5 groupPhotoUploadFailureCount];
    int v13 = (char *)[v12 integerValue];

    id v14 = v13 + 1;
    uint64_t v15 = +[NSNumber numberWithInteger:v13 + 1];
    [v5 updateGroupPhotoUploadFailureCount:v15];

    LOBYTE(v13) = (uint64_t)v13 < IMGroupPhotoMaxUploadCount;
    int v16 = IMOSLoggingEnabled();
    if (v13)
    {
      if (v16)
      {
        id v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v22 = 134217984;
          id v23 = v14;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, " => ready to retry group photo. new failure count: %zd", (uint8_t *)&v22, 0xCu);
        }
      }
      id v18 = +[IMDFileTransferCenter sharedInstance];
      [v18 setRecoverableErrorForTransfer:v6 error:27];
    }
    else
    {
      if (v16)
      {
        id v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          int v22 = 134217984;
          id v23 = v14;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, " => too many upload failures (%zd). failing transfer", (uint8_t *)&v22, 0xCu);
        }
      }
      id v21 = +[IMDFileTransferCenter sharedInstance];
      [v21 failTransfer:v6 reason:27];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, " => This chat has a different group photo guid now. not retrying", (uint8_t *)&v22, 2u);
    }
  }
}

- (BOOL)shouldUploadGroupPhoto:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDFileTransferCenter sharedInstance];
  id v5 = [v4 transferForGUID:v3];

  id v6 = [v5 totalBytes];
  if ((unint64_t)v6 > 0x200000 && IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v9 = 134217984;
      id v10 = [v5 totalBytes];
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "**Not** uploading group photo, too big. Size: %llu", (uint8_t *)&v9, 0xCu);
    }
  }
  return (unint64_t)v6 <= 0x200000;
}

- (void)uploadGroupPhotoForChat:(id)a3 fileTransferGUID:(id)a4 itemGUID:(id)a5 callerURI:(id)a6 idsAccount:(id)a7 isPhotoRefresh:(BOOL)a8
{
  id v39 = a3;
  id v14 = a4;
  id v36 = a5;
  id v37 = a6;
  id v38 = a7;
  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v16 = [v39 guid];
      *(_DWORD *)buf = 138413314;
      id v52 = v16;
      __int16 v53 = 2112;
      id v54 = v14;
      __int16 v55 = 2112;
      id v56 = v36;
      __int16 v57 = 2112;
      id v58 = v37;
      __int16 v59 = 2112;
      id v60 = v38;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "uploading group photo. chatGuid: %@ fileTransferGUID: %@ itemGUID: %@ callerURI: %@ idsAccount: %@", buf, 0x34u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v52 = v39;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
    }
  }
  id v18 = [v39 participants];
  id v19 = [v18 arrayByApplyingSelector:"ID"];

  unsigned int v20 = [(MessageServiceSession *)self shouldUploadGroupPhoto:v14];
  if (v14) {
    unsigned int v21 = v20;
  }
  else {
    unsigned int v21 = 0;
  }
  if (v21 == 1)
  {
    id v22 = objc_alloc((Class)IMMessageItem);
    id v23 = [(MessageServiceSession *)self account];
    __int16 v24 = [v23 loginID];
    uint64_t v25 = +[NSDate date];
    id v50 = v14;
    uint64_t v26 = +[NSArray arrayWithObjects:&v50 count:1];
    id v27 = [v22 initWithSender:v24 time:v25 body:0 attributes:0 fileTransferGUIDs:v26 flags:5 error:0 guid:v36 threadIdentifier:0];

    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1C0F0;
    v44[3] = &unk_DDC88;
    v44[4] = self;
    id v28 = v39;
    id v45 = v28;
    id v29 = v14;
    id v46 = v29;
    id v47 = v37;
    id v48 = v38;
    BOOL v49 = a8;
    long long v30 = objc_retainBlock(v44);
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_1C148;
    v40[3] = &unk_DDCB0;
    id v41 = v28;
    id v42 = v29;
    __int16 v43 = self;
    long long v31 = objc_retainBlock(v40);
    BOOL v32 = [(MessageServiceSession *)self attachmentController];
    long long v33 = [v27 sender];
    [v32 sendAttachmentsForMessage:v27 canSendInline:0 displayIDs:v19 additionalContext:0 mode:2 fromID:v33 recipients:v19 completionBlock:v30 uploadFailureBlock:v31];
  }
  else if (v14 || ((v20 ^ 1) & 1) != 0)
  {
    id v34 = IMLogHandleForCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR)) {
      sub_95C30();
    }
  }
  else
  {
    BYTE1(v35) = a8;
    LOBYTE(v35) = 1;
    -[MessageServiceSession groupPhotoUploadCompletedForChat:fileTransferGuid:callerURI:fromAccount:message:displayIDs:additionalContext:success:isPhotoRefresh:error:](self, "groupPhotoUploadCompletedForChat:fileTransferGuid:callerURI:fromAccount:message:displayIDs:additionalContext:success:isPhotoRefresh:error:", v39, 0, v37, v38, 0, v19, 0, v35);
  }
}

- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
}

- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8
{
  BOOL v40 = a8;
  id v13 = a3;
  id v39 = a4;
  id v14 = a5;
  unsigned __int8 v44 = a6;
  id v38 = a7;
  if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v46 = v13;
      __int16 v47 = 2112;
      id v48 = v39;
      __int16 v49 = 2112;
      id v50 = v14;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Request to send group photo update %@ to chatID %@ identifier %@", buf, 0x20u);
    }
  }
  id v43 = v14;
  [(MessageServiceSession *)self canonicalizeChatIdentifier:&v43 style:&v44];
  id v41 = v43;

  if (v41)
  {
    int v16 = [(MessageServiceSession *)self chatForChatIdentifier:v41 style:v44];
    id v42 = 0;
    id v37 = _LastAddressedURIForChatLogMetricIfNeeded(v16, 0, self, &v42, 0);
    id v36 = v42;
    id v17 = [(MessageServiceSession *)self generateAndStoreGroupPhotoChangeStatusItemForChat:v16 sender:0 fileTransferGuid:v13 isHidden:v40];
    id v18 = [v16 groupPhotoGuid];
    unsigned __int8 v19 = [v18 isEqualToString:v13];

    if ((v19 & 1) == 0)
    {
      unsigned int v35 = [(MessageServiceSession *)self broadcasterForChatListeners];
      unsigned int v20 = [(MessageServiceSession *)self account];
      unsigned int v21 = [v20 accountID];
      id v22 = [v16 chatIdentifier];
      id v23 = [v16 style];
      __int16 v24 = [v16 groupID];
      uint64_t v25 = [v16 personCentricID];
      [v35 account:v21 chat:v22 style:v23 chatProperties:0 groupID:v24 chatPersonCentricID:v25 messageReceived:v17];
    }
    uint64_t v26 = [v17 guid];
    [(MessageServiceSession *)self uploadGroupPhotoForChat:v16 fileTransferGUID:v13 itemGUID:v26 callerURI:v37 idsAccount:v36 isPhotoRefresh:v40];

    id v27 = [(MessageServiceSession *)self attachmentController];
    id v28 = [v17 guid];
    [v27 updateGroupPhoto:v13 forChat:v16 messageGuid:v28];

    id v29 = [(MessageServiceSession *)self broadcasterForChatListeners];
    long long v30 = [v16 chatIdentifier];
    id v31 = [v16 style];
    BOOL v32 = [(MessageServiceSession *)self account];
    long long v33 = [v32 accountID];
    [v29 groupPhotoUpdatedForChatIdentifier:v30 style:v31 account:v33 userInfo:0];
  }
  else if (IMOSLoggingEnabled())
  {
    id v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "sendGroupPhotoUpdate early return -- no chat identifier", buf, 2u);
    }
  }
}

- (void)_requestGroupPhotoResendForChatGUID:(id)a3 fromIdentifier:(id)a4 toIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = +[IMDChatRegistry sharedInstance];
  id v12 = [v11 existingChatWithGUID:v8];

  if (v12)
  {
    id v13 = [(MessageServiceSession *)self groupController];
    id v14 = +[NSDate date];
    [v13 requestGroupPhotoIfNecessary:v12 incomingParticipantVersion:0x7FFFFFFFFFFFFFFFLL incomingGroupPhotoCreationDate:v14 toIdentifier:v10 fromIdentifier:v9 messageIsFromStorage:0 session:self];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v17 = v8;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Failed to find a chat for chatGUID: %@", buf, 0xCu);
    }
  }
}

- (void)retryGroupPhotoUpload:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8
{
  BOOL v8 = a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  unsigned __int8 v34 = a6;
  id v17 = a7;
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      id v36 = v14;
      __int16 v37 = 2112;
      id v38 = v15;
      __int16 v39 = 2112;
      id v40 = v16;
      __int16 v41 = 1024;
      int v42 = v34;
      __int16 v43 = 2112;
      id v44 = v17;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Reuploading group photo. file transfer guid: %@ chatID: %@ chatIdentifier: %@ chat style: %c account: %@", buf, 0x30u);
    }
  }
  id v33 = v16;
  [(MessageServiceSession *)self canonicalizeChatIdentifier:&v33 style:&v34];
  id v19 = v33;

  if (v19)
  {
    unsigned int v20 = [(MessageServiceSession *)self chatForChatIdentifier:v19 style:v34];
    if (![v20 state])
    {
      if (IMOSLoggingEnabled())
      {
        id v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "*** Failed send group photo update because we've left the chat", buf, 2u);
        }
      }
      goto LABEL_29;
    }
    id v32 = 0;
    id v31 = _LastAddressedURIForChatLogMetricIfNeeded(v20, 0, self, &v32, 0);
    id v30 = v32;
    unsigned int v21 = IMMessageGuidFromIMFileTransferGuid();
    id v22 = [v20 groupPhotoGuid];
    unsigned __int8 v23 = [v14 isEqualToString:v22];

    if (v23)
    {
      __int16 v24 = +[IMDFileTransferCenter sharedInstance];
      uint64_t v25 = [v24 transferForGUID:v14];

      if ([v25 transferState] == (char *)&dword_4 + 3
        && [v25 error] == (char *)&dword_18 + 3)
      {
        [(MessageServiceSession *)self uploadGroupPhotoForChat:v20 fileTransferGUID:v14 itemGUID:v21 callerURI:v31 idsAccount:v30 isPhotoRefresh:v8];
      }
      else if (IMOSLoggingEnabled())
      {
        id v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v36 = v25;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "not retrying transfer -- it is not in recoverableErrorState or does not have group photo error %@", buf, 0xCu);
        }
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_28:

LABEL_29:
        goto LABEL_30;
      }
      uint64_t v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        id v28 = [v20 groupPhotoGuid];
        *(_DWORD *)buf = 138412546;
        id v36 = v14;
        __int16 v37 = 2112;
        id v38 = v28;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Trying to reupload group photo with wrong guid for chat. upload guid %@ chat group photo guid %@", buf, 0x16u);
      }
    }

    goto LABEL_28;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "sendGroupPhotoUpdate early return -- no chat identifier", buf, 2u);
    }
  }
LABEL_30:
}

- (void)removePersonInfo:(id)a3 chatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  int v6 = a6;
  id v37 = a3;
  id v36 = a4;
  id v9 = a5;
  unsigned __int8 v60 = v6;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v64 = v37;
      __int16 v65 = 2112;
      id v66 = v9;
      __int16 v67 = 1024;
      int v68 = v6;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Request to remove person: %@   chat: %@  style: %c", buf, 0x1Cu);
    }
  }
  [(MessageServiceSession *)self _logLocalInfo];
  id v59 = v9;
  [(MessageServiceSession *)self canonicalizeChatIdentifier:&v59 style:&v60];
  id v44 = v59;

  unsigned int v11 = v44;
  if (v44)
  {
    id v38 = [(MessageServiceSession *)self chatForChatIdentifier:v44 style:v60];
    if ([v38 state])
    {
      id v58 = 0;
      int v42 = _LastAddressedURIForChatLogMetricIfNeeded(v38, 0, self, &v58, 0);
      id v43 = v58;
      unsigned int v35 = -[MessageServiceSession idsServiceForIDSAccount:](self, "idsServiceForIDSAccount:");
      [(MessageServiceSession *)self _fixParticipantsForChat:v38];
      id v12 = +[NSMutableArray arrayWithCapacity:](NSMutableArray, "arrayWithCapacity:", [v37 count]);
      long long v56 = 0u;
      long long v57 = 0u;
      long long v54 = 0u;
      long long v55 = 0u;
      id v13 = v37;
      id v14 = [v13 countByEnumeratingWithState:&v54 objects:v62 count:16];
      if (v14)
      {
        uint64_t v15 = *(void *)v55;
        uint64_t v16 = kFZPersonID;
        do
        {
          for (i = 0; i != v14; i = (char *)i + 1)
          {
            if (*(void *)v55 != v15) {
              objc_enumerationMutation(v13);
            }
            id v18 = [*(id *)(*((void *)&v54 + 1) + 8 * i) objectForKeyedSubscript:v16];
            if (v18) {
              [v12 addObject:v18];
            }
          }
          id v14 = [v13 countByEnumeratingWithState:&v54 objects:v62 count:16];
        }
        while (v14);
      }

      id v19 = [(MessageServiceSession *)self groupController];
      v50[0] = _NSConcreteStackBlock;
      v50[1] = 3221225472;
      v50[2] = sub_1D2CC;
      v50[3] = &unk_DDCD8;
      id v51 = v12;
      id v52 = self;
      id v53 = v38;
      id v34 = v51;
      [v19 removeParticipants:v51 toChat:v53 fromID:v42 fromAccount:v43 session:self service:v35 completionBlock:v50];

      long long v48 = 0u;
      long long v49 = 0u;
      long long v46 = 0u;
      long long v47 = 0u;
      id obj = v13;
      id v20 = [obj countByEnumeratingWithState:&v46 objects:v61 count:16];
      if (v20)
      {
        uint64_t v40 = kFZPersonID;
        uint64_t v41 = *(void *)v47;
        uint64_t v21 = kFZPersonUnformattedName;
        uint64_t v22 = kFZPersonCountryCode;
        do
        {
          for (j = 0; j != v20; j = (char *)j + 1)
          {
            if (*(void *)v47 != v41) {
              objc_enumerationMutation(obj);
            }
            __int16 v24 = *(void **)(*((void *)&v46 + 1) + 8 * (void)j);
            uint64_t v25 = [v24 objectForKey:v40];
            uint64_t v26 = [v24 objectForKey:v21];
            id v27 = [v24 objectForKey:v22];
            unsigned __int8 v28 = v60;
            id v29 = [(MessageServiceSession *)self imdAccountForIDSAccount:v43];
            id v30 = [v42 _stripFZIDPrefix];
            LOBYTE(v33) = v28;
            id v31 = [(MessageServiceSession *)self didChangeMemberStatus:3 forHandle:v25 fromHandle:0 unformattedNumber:v26 countryCode:v27 forChat:v44 style:v33 account:v29 destinationCallerID:v30];
          }
          id v20 = [obj countByEnumeratingWithState:&v46 objects:v61 count:16];
        }
        while (v20);
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "*** Failed to remove person because we have already left the chat", buf, 2u);
      }
    }
    unsigned int v11 = v44;
  }
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 joinProperties:(id)a6
{
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 joinProperties:(id)a7
{
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 joinProperties:(id)a8
{
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 joinProperties:(id)a9
{
  uint64_t v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (IMOSLoggingEnabled())
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v23 = v15;
      __int16 v24 = 1024;
      int v25 = v12;
      __int16 v26 = 2112;
      id v27 = v16;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Request to join chat: %@  style: %c  handleInfo: %@", buf, 0x1Cu);
    }
  }
  [(MessageServiceSession *)self _logLocalInfo];
  [(MessageServiceSession *)self didJoinChat:v15 style:v12 displayName:0 groupID:v17 lastAddressedHandle:v18 lastAddressedSIMID:v19 handleInfo:v16];
}

- (void)leaveChat:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v16 = v6;
      __int16 v17 = 1024;
      int v18 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Request to leave chat: %@  style: %c", buf, 0x12u);
    }
  }
  [(MessageServiceSession *)self _logLocalInfo];
  BOOL v8 = [(MessageServiceSession *)self chatForChatIdentifier:v6 style:v4];
  id v14 = 0;
  id v9 = _LastAddressedURIForChatLogMetricIfNeeded(v8, 0, self, &v14, 0);
  id v10 = v14;
  unsigned int v11 = [(MessageServiceSession *)self idsServiceForIDSAccount:v10];
  uint64_t v12 = [(MessageServiceSession *)self groupController];
  [v12 leaveChat:v8 fromID:v9 fromAccount:v10 session:self service:v11 completionBlock:&stru_DDD18];

  id v13 = [(MessageServiceSession *)self imdAccountForIDSAccount:v10];
  [(MessageServiceSession *)self didLeaveChat:v6 style:v4 account:v13];
}

- (double)_richLinkDelayTimeInterval
{
  return 5.0;
}

- (id)pendingSendBlockQueue
{
  return self->_pendingSendBlockQueue;
}

- (void)stageMessageWrapperBlock:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "stageMessageWrapperBlock blockWrapper %@", buf, 0xCu);
    }
  }
  if (v4)
  {
    id v6 = [v4 block];
    BOOL v7 = v6 == 0;

    if (!v7)
    {
      pendingSendBlockQueue = self->_pendingSendBlockQueue;
      if (!pendingSendBlockQueue)
      {
        id v9 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
        id v10 = self->_pendingSendBlockQueue;
        self->_pendingSendBlockQueue = v9;

        pendingSendBlockQueue = self->_pendingSendBlockQueue;
      }
      if ([(NSMutableArray *)pendingSendBlockQueue count]
        || ([v4 isDelayedRichLinkBlock] & 1) != 0)
      {
        if (IMOSLoggingEnabled())
        {
          unsigned int v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            uint64_t v12 = +[NSNumber numberWithUnsignedInteger:[(NSMutableArray *)self->_pendingSendBlockQueue count]];
            *(_DWORD *)buf = 138412546;
            id v19 = v4;
            __int16 v20 = 2112;
            uint64_t v21 = v12;
            _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "stageMessageWrapperBlock enqueing block %@, pending block count %@", buf, 0x16u);
          }
        }
        id v13 = self->_pendingSendBlockQueue;
        if (v13) {
          CFArrayAppendValue((CFMutableArrayRef)v13, v4);
        }
        if ([v4 isDelayedRichLinkBlock])
        {
          if (IMOSLoggingEnabled())
          {
            id v14 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "stageMessageWrapperBlock dispatching _flushQueuedMessageWrapperBlocks", buf, 2u);
            }
          }
          [(MessageServiceSession *)self _richLinkDelayTimeInterval];
          im_dispatch_after();
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          id v15 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
          {
            id v16 = +[NSNumber numberWithUnsignedInteger:[(NSMutableArray *)self->_pendingSendBlockQueue count]];
            *(_DWORD *)buf = 138412546;
            id v19 = v4;
            __int16 v20 = 2112;
            uint64_t v21 = v16;
            _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "stageMessageWrapperBlock calling block immediately %@ [_pendingSendBlockQueue count]:%@ ", buf, 0x16u);
          }
        }
        __int16 v17 = [v4 block];
        v17[2]();
      }
    }
  }
}

- (BOOL)_richLinkPendSendingWithGUID:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v5 = self->_pendingSendBlockQueue;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        id v10 = objc_msgSend(v9, "GUID", (void)v15);
        if ([v10 isEqualToString:v4])
        {
          unsigned __int8 v11 = [v9 isDelayedRichLinkBlock];

          if (v11)
          {
            LODWORD(v6) = 1;
            goto LABEL_12;
          }
        }
        else
        {
        }
      }
      id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
    }
    while (v6);
  }
LABEL_12:

  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      CFStringRef v13 = @"NO";
      if (v6) {
        CFStringRef v13 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      id v20 = v4;
      __int16 v21 = 2112;
      CFStringRef v22 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "_richLinkPendSendingWithGUID GUID %@ result %@", buf, 0x16u);
    }
  }
  return (char)v6;
}

- (void)_flushQueuedMessageWrapperBlocks
{
  if (IMOSLoggingEnabled())
  {
    id v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      id v3 = +[NSNumber numberWithUnsignedInteger:[(NSMutableArray *)self->_pendingSendBlockQueue count]];
      *(_DWORD *)buf = 138412290;
      unsigned __int8 v28 = v3;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "_flushQueuedMessageWrapperBlocks _pendingSendBlockQueue %@", buf, 0xCu);
    }
  }
  if ([(NSMutableArray *)self->_pendingSendBlockQueue count])
  {
    long long v25 = 0u;
    long long v26 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v4 = *(id *)&self->IMDAppleServiceSession_opaque[v21];
    uint64_t v5 = 0;
    id v6 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v24;
      while (2)
      {
        for (i = 0; i != v6; i = (char *)i + 1)
        {
          if (*(void *)v24 != v7) {
            objc_enumerationMutation(v4);
          }
          id v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          id v10 = [v9 block];
          if (char *)i + v5 && ([v9 isDelayedRichLinkBlock])
          {
            v5 += (uint64_t)i;
            if (IMOSLoggingEnabled())
            {
              CFStringRef v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                id v14 = +[NSNumber numberWithUnsignedInteger:v5];
                *(_DWORD *)buf = 138412546;
                unsigned __int8 v28 = v9;
                __int16 v29 = 2112;
                id v30 = v14;
                _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "_flushQueuedMessageWrapperBlocks stopped dequeuing at block %@ index %@", buf, 0x16u);
              }
            }

            goto LABEL_27;
          }
          if (IMOSLoggingEnabled())
          {
            unsigned __int8 v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              uint64_t v12 = +[NSNumber numberWithUnsignedInteger:(char *)i + v5];
              *(_DWORD *)buf = 138412290;
              unsigned __int8 v28 = v12;
              _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "_flushQueuedMessageWrapperBlocks dequeing block at index %@", buf, 0xCu);
            }
          }
          if (v10) {
            v10[2](v10);
          }
        }
        id v6 = [v4 countByEnumeratingWithState:&v23 objects:v31 count:16];
        v5 += (uint64_t)i;
        if (v6) {
          continue;
        }
        break;
      }
    }
LABEL_27:

    if (IMOSLoggingEnabled())
    {
      long long v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        long long v16 = +[NSNumber numberWithUnsignedInteger:0];
        long long v17 = +[NSNumber numberWithUnsignedInteger:v5];
        *(_DWORD *)buf = 138412546;
        unsigned __int8 v28 = v16;
        __int16 v29 = 2112;
        id v30 = v17;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "MessageServiceSession removing objects in range.location%@ range.length%@", buf, 0x16u);
      }
    }
    objc_msgSend(*(id *)&self->IMDAppleServiceSession_opaque[v21], "removeObjectsInRange:", 0, v5);
    if (IMOSLoggingEnabled())
    {
      long long v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [*(id *)&self->IMDAppleServiceSession_opaque[v21] count]);
        id v20 = [*(id *)&self->IMDAppleServiceSession_opaque[v21] firstObject];
        *(_DWORD *)buf = 138412546;
        unsigned __int8 v28 = v19;
        __int16 v29 = 2112;
        id v30 = v20;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "_flushQueuedMessageWrapperBlocks state at the end of dequeuing [_pendingSendBlockQueue count] %@ first block %@", buf, 0x16u);
      }
    }
  }
}

- (void)eagerUploadTransfer:(id)a3 recipients:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(MessageServiceSession *)self attachmentController];
  [v8 eagerUploadTransfer:v7 recipients:v6];
}

- (void)eagerUploadCancel:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageServiceSession *)self attachmentController];
  [v5 eagerUploadCancel:v4];
}

- (void)_sendHighResolutionImagesForMessage:(id)a3 fromID:(id)a4 fromAccount:(id)a5 toURIs:(id)a6 toChat:(id)a7
{
  id v11 = a3;
  id v31 = a4;
  id v32 = a5;
  id v33 = a6;
  id v34 = a7;
  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  id v13 = objc_alloc_init((Class)NSMutableArray);
  unsigned int v35 = v12;
  [v12 setObject:v13 forKeyedSubscript:@"fileTransferUpdates"];
  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v14 = [v11 fileTransferGUIDs];
  id v15 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
  if (!v15)
  {
LABEL_17:

    goto LABEL_18;
  }
  char v16 = 0;
  uint64_t v17 = *(void *)v44;
  do
  {
    for (i = 0; i != v15; i = (char *)i + 1)
    {
      if (*(void *)v44 != v17) {
        objc_enumerationMutation(v14);
      }
      uint64_t v19 = *(void *)(*((void *)&v43 + 1) + 8 * i);
      id v20 = +[IMDFileTransferCenter sharedInstance];
      uint64_t v21 = [v20 transferForGUID:v19];

      CFStringRef v22 = [v21 userInfo];
      long long v23 = v22;
      if (v22 && [v22 count])
      {
        [v13 addObject:v23];
        char v16 = 1;
      }
    }
    id v15 = [v14 countByEnumeratingWithState:&v43 objects:v47 count:16];
  }
  while (v15);

  if (v16)
  {
    if (IMOSLoggingEnabled())
    {
      long long v24 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Sending a FTCommandIDUpdateAttachmentsMessage command", buf, 2u);
      }
    }
    long long v25 = +[NSNumber numberWithInteger:108];
    long long v26 = JWEncodeDictionary();
    id v27 = [v11 guid];
    unsigned __int8 v28 = IDSGetUUIDData();
    __int16 v29 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v25, IDSSendMessageOptionCommandKey, &__kCFBooleanTrue, IDSSendMessageOptionWantsDeliveryStatusKey, v26, IDSSendMessageOptionDataToEncryptKey, v28, IDSSendMessageOptionUUIDKey, 0);

    v36[0] = _NSConcreteStackBlock;
    v36[1] = 3221225472;
    v36[2] = sub_1EB04;
    v36[3] = &unk_DDD88;
    v36[4] = self;
    id v37 = v31;
    id v38 = v32;
    id v39 = v33;
    id v40 = v29;
    uint64_t v41 = &stru_DDD60;
    id v14 = v29;
    [(MessageServiceSession *)self _engroupForChat:v34 idsAccount:v38 completion:v36];

    goto LABEL_17;
  }
LABEL_18:
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 reflectOnly:(BOOL)a7
{
  id v40 = a3;
  id v39 = a4;
  unsigned __int8 v49 = a6;
  id v11 = a5;
  [(MessageServiceSession *)self _logLocalInfo];
  id v48 = v11;
  [(MessageServiceSession *)self canonicalizeChatIdentifier:&v48 style:&v49];
  id v43 = v48;

  int v42 = [(MessageServiceSession *)self chatForChatIdentifier:v43 style:v49];
  id v47 = 0;
  uint64_t v41 = _LastAddressedURIForChatLogMetricIfNeeded(v42, 0, self, &v47, 0);
  id v12 = v47;
  if ([(MessageServiceSession *)self _isDeviceRegisteredForAccount:v12])
  {
    unsigned int v13 = [(MessageServiceSession *)self shouldSendReadReceiptsForChat:v43 style:v49];
    if (v49 == 45)
    {
      unsigned int v14 = v13;
      unsigned int v15 = [v42 isOscarChat];
      int v16 = IMOSLoggingEnabled();
      if (!v15)
      {
        if (v16)
        {
          id v37 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v51 = v40;
            __int16 v52 = 2112;
            id v53 = v43;
            _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "send read receipt for message: %@   to identifier: %@", buf, 0x16u);
          }
        }
        goto LABEL_17;
      }
      if (v16)
      {
        uint64_t v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v51 = v42;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Not sending remote read receipt for junk chat: %@", buf, 0xCu);
        }
LABEL_15:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v51) = v49;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Not sending remote read receipt for non 1-1 chat style: %c", buf, 8u);
      }
      goto LABEL_15;
    }
    unsigned int v14 = 0;
LABEL_17:
    id v21 = objc_alloc_init((Class)NSMutableArray);
    CFStringRef v22 = v21;
    if (v41) {
      [v21 addObject:v41];
    }
    if (v14)
    {
      long long v23 = [v42 participants];
      long long v24 = URIsFromHandles(v23);
      [v22 addObjectsFromArray:v24];
    }
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1F238;
    v44[3] = &unk_DDDB0;
    id v25 = v40;
    id v45 = v25;
    id v46 = v22;
    id v38 = v22;
    long long v26 = objc_retainBlock(v44);
    id v27 = +[NSNumber numberWithInteger:102];
    unsigned __int8 v28 = [v25 guid];
    __int16 v29 = IDSGetUUIDData();
    id v30 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    id v31 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v27, IDSSendMessageOptionCommandKey, v29, IDSSendMessageOptionUUIDKey, v30, IDSSendMessageOptionTimeoutKey, 0);

    id v32 = [(MessageServiceSession *)self deliveryController];
    id v33 = +[NSDictionary dictionary];
    id v34 = +[NSSet setWithArray:v38];
    [v32 sendMessageDictionary:v33 fromID:v41 fromAccount:v12 toURIs:v34 toGroup:0 priority:300 options:v31 completionBlock:v26];

    unsigned int v35 = [v25 guid];
    id v36 = [(MessageServiceSession *)self imdAccountForIDSAccount:v12];
    [(MessageServiceSession *)self didSendMessageReadReceiptForMessageID:v35 account:v36];

    goto LABEL_22;
  }
  long long v18 = [v40 guid];
  uint64_t v19 = [(MessageServiceSession *)self imdAccountForIDSAccount:v12];
  [(MessageServiceSession *)self didSendMessageReadReceiptForMessageID:v18 account:v19];

  if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, " ** Device is not regisistered, failing read receipt", buf, 2u);
    }
  }
LABEL_22:
}

- (void)sendPlayedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v39 = a3;
  id v38 = a4;
  unsigned __int8 v49 = a6;
  id v10 = a5;
  [(MessageServiceSession *)self _logLocalInfo];
  id v48 = v10;
  [(MessageServiceSession *)self canonicalizeChatIdentifier:&v48 style:&v49];
  id v42 = v48;

  id v43 = [(MessageServiceSession *)self chatForChatIdentifier:v42 style:v49];
  id v47 = 0;
  id v40 = _LastAddressedURIForChatLogMetricIfNeeded(v43, 0, self, &v47, 0);
  id v41 = v47;
  if (-[MessageServiceSession _isDeviceRegisteredForAccount:](self, "_isDeviceRegisteredForAccount:"))
  {
    unsigned int v11 = [(MessageServiceSession *)self shouldSendReadReceiptsForChat:v42 style:v49];
    if (v49 == 45)
    {
      unsigned int v12 = v11;
      unsigned int v13 = [v43 isOscarChat];
      int v14 = IMOSLoggingEnabled();
      if (!v13)
      {
        if (v14)
        {
          id v37 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v51 = v39;
            __int16 v52 = 2112;
            id v53 = v42;
            _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "send played receipt for message: %@   to identifier: %@", buf, 0x16u);
          }
        }
        goto LABEL_17;
      }
      if (v14)
      {
        unsigned int v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v51 = v43;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Not sending remote played read receipt for junk chat: %@", buf, 0xCu);
        }
LABEL_15:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      unsigned int v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v51) = v49;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Not sending remote played receipt for non 1-1 chat style: %c", buf, 8u);
      }
      goto LABEL_15;
    }
    unsigned int v12 = 0;
LABEL_17:
    if ([v43 isBlackholed])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v51 = v43;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Not sending remote played receipt for blackholed chat: %@", buf, 0xCu);
        }
      }
      unsigned int v12 = 0;
    }
    id v20 = objc_alloc_init((Class)NSMutableArray);
    id v21 = v20;
    if (v40) {
      [v20 addObject:v40];
    }
    if (v12)
    {
      CFStringRef v22 = [v43 participants];
      long long v23 = URIsFromHandles(v22);
      [v21 addObjectsFromArray:v23];
    }
    v44[0] = _NSConcreteStackBlock;
    v44[1] = 3221225472;
    v44[2] = sub_1FA7C;
    v44[3] = &unk_DDDB0;
    id v24 = v39;
    id v45 = v24;
    id v46 = v21;
    id v25 = v21;
    long long v26 = objc_retainBlock(v44);
    id v27 = +[NSNumber numberWithInteger:105];
    unsigned __int8 v28 = [v24 guid];
    __int16 v29 = IDSGetUUIDData();
    id v30 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    id v31 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v27, IDSSendMessageOptionCommandKey, v29, IDSSendMessageOptionUUIDKey, v30, IDSSendMessageOptionTimeoutKey, 0);

    id v32 = [(MessageServiceSession *)self deliveryController];
    id v33 = +[NSDictionary dictionary];
    id v34 = +[NSSet setWithArray:v25];
    [v32 sendMessageDictionary:v33 fromID:v40 fromAccount:v41 toURIs:v34 toGroup:0 priority:300 options:v31 completionBlock:v26];

    unsigned int v35 = [v24 guid];
    id v36 = [(MessageServiceSession *)self imdAccountForIDSAccount:v41];
    [(MessageServiceSession *)self didSendMessagePlayedReceiptForMessageID:v35 account:v36];

    goto LABEL_28;
  }
  int v16 = [v39 guid];
  uint64_t v17 = [(MessageServiceSession *)self imdAccountForIDSAccount:v41];
  [(MessageServiceSession *)self didSendMessagePlayedReceiptForMessageID:v16 account:v17];

  if (IMOSLoggingEnabled())
  {
    long long v18 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, " ** Device is not regisistered, failing played receipt", buf, 2u);
    }
  }
LABEL_28:
}

- (void)sendDeliveredQuietlyReceiptForMessage:(id)a3 forIncomingMessageFromIDSID:(id)a4 toChatGuid:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 withWillSendToDestinationsHandler:(id)a8
{
  id v45 = a3;
  id v40 = a4;
  id v39 = a5;
  unsigned __int8 v55 = a7;
  id v41 = a8;
  id v14 = a6;
  [(MessageServiceSession *)self _logLocalInfo];
  id v54 = v14;
  [(MessageServiceSession *)self canonicalizeChatIdentifier:&v54 style:&v55];
  id v43 = v54;

  id v42 = [v45 guid];
  id v46 = [(MessageServiceSession *)self chatForChatIdentifier:v43 style:v55];
  id v53 = 0;
  long long v44 = _LastAddressedURIForChatLogMetricIfNeeded(v46, 0, self, &v53, 0);
  id v15 = v53;
  if ([(MessageServiceSession *)self _isDeviceRegisteredForAccount:v15])
  {
    BOOL v16 = v55 == 45;
    if (v55 != 45 && IMOSLoggingEnabled())
    {
      uint64_t v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v57) = v55;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Not sending delivered quietly receipt for non 1-1 chat style: %c", buf, 8u);
      }
    }
    if ([v46 isBlackholed])
    {
      if (IMOSLoggingEnabled())
      {
        long long v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          long long v57 = v46;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Not sending delivered quietly receipt for blackholed chat: %@", buf, 0xCu);
        }
      }
      BOOL v16 = 0;
    }
    id v19 = objc_alloc_init((Class)NSMutableArray);
    id v20 = v19;
    if (v44) {
      [v19 addObject:v44];
    }
    if (v16)
    {
      id v21 = [v46 participants];
      CFStringRef v22 = URIsFromHandles(v21);

      [v20 addObjectsFromArray:v22];
    }
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_2028C;
    v50[3] = &unk_DDDB0;
    id v23 = v42;
    id v51 = v23;
    id v52 = v20;
    id v37 = v20;
    id v38 = objc_retainBlock(v50);
    id v24 = +[NSNumber numberWithInteger:112];
    id v25 = IDSGetUUIDData();
    long long v26 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    id v27 = +[NSSet setWithObject:IDSRegistrationPropertySupportsDeliveredQuietlyAndNotifyRecipient];
    unsigned __int8 v28 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v24, IDSSendMessageOptionCommandKey, v25, IDSSendMessageOptionUUIDKey, v26, IDSSendMessageOptionTimeoutKey, v27, IDSSendMessageOptionRequireAllRegistrationPropertiesKey, 0);

    v47[0] = _NSConcreteStackBlock;
    v47[1] = 3221225472;
    v47[2] = sub_20420;
    v47[3] = &unk_DDDD8;
    id v48 = v40;
    id v49 = v41;
    __int16 v29 = objc_retainBlock(v47);
    id v30 = [(MessageServiceSession *)self deliveryController];
    id v31 = +[NSDictionary dictionary];
    id v32 = +[NSSet setWithArray:v37];
    [v30 sendMessageDictionary:v31 fromID:v44 fromAccount:v15 toURIs:v32 toGroup:0 priority:300 options:v28 willSendBlock:v29 completionBlock:v38];

    id v33 = [(MessageServiceSession *)self imdAccountForIDSAccount:v15];
    [(MessageServiceSession *)self didSendDeliveredQuietlyReceiptForMessageID:v23 account:v33];
  }
  else
  {
    id v34 = [v45 guid];
    unsigned int v35 = [(MessageServiceSession *)self imdAccountForIDSAccount:v15];
    [(MessageServiceSession *)self didSendMessagePlayedReceiptForMessageID:v34 account:v35];

    if (IMOSLoggingEnabled())
    {
      id v36 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, " ** Device is not regisistered, failing delivered quietly receipt", buf, 2u);
      }
    }
  }
}

- (void)sendNotifyRecipientCommandForMessage:(id)a3 toChatGuid:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v38 = a3;
  id v34 = a4;
  unsigned __int8 v45 = a6;
  id v10 = a5;
  [(MessageServiceSession *)self _logLocalInfo];
  id v44 = v10;
  [(MessageServiceSession *)self canonicalizeChatIdentifier:&v44 style:&v45];
  id v36 = v44;

  unsigned int v35 = [v38 guid];
  id v39 = [(MessageServiceSession *)self chatForChatIdentifier:v36 style:v45];
  id v43 = 0;
  id v37 = _LastAddressedURIForChatLogMetricIfNeeded(v39, 0, self, &v43, 0);
  id v11 = v43;
  if ([(MessageServiceSession *)self _isDeviceRegisteredForAccount:v11])
  {
    BOOL v12 = v45 == 45;
    if (v45 != 45 && IMOSLoggingEnabled())
    {
      unsigned int v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109120;
        LODWORD(v47) = v45;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Not sending notify recipient receipt for non 1-1 chat style: %c", buf, 8u);
      }
    }
    if ([v39 isBlackholed])
    {
      if (IMOSLoggingEnabled())
      {
        id v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v47 = v39;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Not sending notify recipient receipt for blackholed chat: %@", buf, 0xCu);
        }
      }
      BOOL v12 = 0;
    }
    id v15 = objc_alloc_init((Class)NSMutableArray);
    BOOL v16 = v15;
    if (v37) {
      [v15 addObject:v37];
    }
    if (v12)
    {
      uint64_t v17 = [v39 participants];
      long long v18 = URIsFromHandles(v17);

      [v16 addObjectsFromArray:v18];
    }
    v40[0] = _NSConcreteStackBlock;
    v40[1] = 3221225472;
    v40[2] = sub_20C6C;
    v40[3] = &unk_DDDB0;
    id v19 = v35;
    id v41 = v19;
    id v42 = v16;
    id v33 = v16;
    id v20 = objc_retainBlock(v40);
    id v21 = +[NSNumber numberWithInteger:113];
    CFStringRef v22 = IDSGetUUIDData();
    id v23 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    id v24 = +[NSSet setWithObject:IDSRegistrationPropertySupportsDeliveredQuietlyAndNotifyRecipient];
    id v25 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v21, IDSSendMessageOptionCommandKey, v22, IDSSendMessageOptionUUIDKey, v23, IDSSendMessageOptionTimeoutKey, v24, IDSSendMessageOptionRequireAllRegistrationPropertiesKey, 0);

    long long v26 = [(MessageServiceSession *)self deliveryController];
    id v27 = +[NSDictionary dictionary];
    unsigned __int8 v28 = +[NSSet setWithArray:v33];
    [v26 sendMessageDictionary:v27 fromID:v37 fromAccount:v11 toURIs:v28 toGroup:0 priority:300 options:v25 willSendBlock:0 completionBlock:v20];

    __int16 v29 = [(MessageServiceSession *)self imdAccountForIDSAccount:v11];
    [(MessageServiceSession *)self didSendNotifyRecipientCommandForMessageID:v19 account:v29];
  }
  else
  {
    id v30 = [v38 guid];
    id v31 = [(MessageServiceSession *)self imdAccountForIDSAccount:v11];
    [(MessageServiceSession *)self didSendMessagePlayedReceiptForMessageID:v30 account:v31];

    if (IMOSLoggingEnabled())
    {
      id v32 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, " ** Device is not regisistered, failing notify recipient receipt", buf, 2u);
      }
    }
  }
}

- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10
{
  id v48 = a3;
  id v47 = a4;
  unsigned __int8 v75 = a8;
  id v42 = a9;
  id v44 = a10;
  id v74 = a7;
  id v16 = a7;
  [(MessageServiceSession *)self canonicalizeChatIdentifier:&v74 style:&v75];
  id v49 = v74;

  uint64_t v17 = [(MessageServiceSession *)self chatForChatIdentifier:v49 style:v75];
  if (v17)
  {
    id v41 = [(MessageServiceSession *)self messageStore];
    id v73 = 0;
    id v46 = [v41 storeEditedMessage:v48 editedPartIndex:a5 editType:a6 previousMessage:v47 chat:v17 updatedAssociatedMessageItems:&v73];
    id v43 = v73;
    id v45 = objc_alloc_init((Class)NSMutableArray);
    if (v46) {
      [v45 addObject:v46];
    }
    if ([v43 count]) {
      [v45 addObjectsFromArray:v43];
    }
    id v18 = [v45 copy];
    id v40 = (void *)IMCreateSerializedItemsFromArray();

    id v19 = [(MessageServiceSession *)self broadcasterForChatListeners];
    id v20 = [(MessageServiceSession *)self account];
    id v21 = [v20 accountID];
    [v19 account:v21 chat:v49 style:v75 chatProperties:0 messagesUpdated:v40];

    id v72 = 0;
    CFStringRef v22 = _LastAddressedURIForChatLogMetricIfNeeded(v17, 0, self, &v72, 0);
    id v37 = v72;
    id v23 = objc_alloc_init((Class)NSMutableArray);
    id v24 = v23;
    if (v22) {
      [v23 addObject:v22];
    }
    id v25 = [v17 participants];
    id v39 = URIsFromHandles(v25);

    [v24 addObjectsFromArray:v39];
    long long v26 = [v48 guid];
    id location = 0;
    objc_initWeak(&location, self);
    v67[0] = _NSConcreteStackBlock;
    v67[1] = 3221225472;
    v67[2] = sub_2150C;
    v67[3] = &unk_DDE00;
    objc_copyWeak(v70, &location);
    id v27 = v26;
    id v68 = v27;
    v70[1] = (id)a5;
    id v69 = v47;
    id v38 = objc_retainBlock(v67);
    v64[0] = _NSConcreteStackBlock;
    v64[1] = 3221225472;
    v64[2] = sub_216C4;
    v64[3] = &unk_DDE28;
    objc_copyWeak(v66, &location);
    id v36 = v27;
    id v65 = v36;
    v66[1] = (id)a5;
    v66[2] = (id)a6;
    unsigned __int8 v28 = objc_retainBlock(v64);
    if ([(MessageServiceSession *)self isReplicating]
      && (unint64_t v29 = [(MessageServiceSession *)self _replicationEditDelay]) != 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          uint64_t v31 = [v48 guid];
          *(_DWORD *)buf = 138412546;
          uint64_t v77 = v31;
          __int16 v78 = 1024;
          LODWORD(v79) = v29;
          when = (void *)v31;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Deferring message edit of %@ for replication by %u seconds", buf, 0x12u);
        }
      }
      dispatch_time_t whena = dispatch_time(0, 1000000000 * v29);
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_217F8;
      block[3] = &unk_DDE50;
      unint64_t v61 = v29;
      id v51 = v48;
      id v52 = self;
      id v53 = v46;
      int64_t v62 = a5;
      unint64_t v63 = a6;
      id v54 = v24;
      id v55 = v49;
      id v56 = v37;
      id v57 = v22;
      id v58 = v44;
      id v59 = v38;
      unsigned __int8 v60 = v28;
      dispatch_after(whena, (dispatch_queue_t)&_dispatch_main_q, block);

      id v32 = v51;
    }
    else
    {
      id v32 = [(MessageServiceSession *)self deliveryController];
      [v32 sendEditedMessage:v46 partIndex:a5 editType:a6 destinations:v24 chatIdentifier:v49 account:v37 fromID:v22 backwardCompatabilityText:v44 unsupportedDestinationsHandler:v38 completionBlock:v28];
    }

    objc_destroyWeak(v66);
    objc_destroyWeak(v70);
    objc_destroyWeak(&location);
  }
  else if (IMOSLoggingEnabled())
  {
    id v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v77 = (uint64_t)v48;
      __int16 v78 = 2112;
      uint64_t v79 = 0;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Could not find chat for edited message. message: %@ chat: %@", buf, 0x16u);
    }
  }
}

- (void)sendRepositionStickerMessage:(id)a3 chatIdentifier:(id)a4 accountID:(id)a5 style:(unsigned __int8)a6
{
  id v37 = a3;
  id v34 = a5;
  unsigned __int8 v43 = a6;
  id v42 = a4;
  id v10 = a4;
  [(MessageServiceSession *)self canonicalizeChatIdentifier:&v42 style:&v43];
  id v11 = v42;

  BOOL v12 = [(MessageServiceSession *)self chatForChatIdentifier:v11 style:v43];
  if (v12)
  {
    unsigned int v35 = [(MessageServiceSession *)self messageStore];
    id v36 = [v35 storeRepositionedStickerLocally:v37];
    id v33 = objc_alloc_init((Class)NSMutableArray);
    if (v36)
    {
      unsigned int v13 = [v37 guid];
      id v14 = [v35 messageWithGUID:v13];

      if (!v14)
      {
        uint64_t v31 = IMLogHandleForCategory();
        unint64_t v29 = v31;
        if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
        {
          sub_95CD4();
          unint64_t v29 = v31;
        }
        goto LABEL_8;
      }
      [v33 addObject:v14];
    }
    id v15 = [v33 copy];
    uint64_t v32 = IMCreateSerializedItemsFromArray();

    id v16 = [(MessageServiceSession *)self broadcasterForChatListeners];
    uint64_t v17 = [(MessageServiceSession *)self account];
    id v18 = [v17 accountID];
    [v16 account:v18 chat:v11 style:v43 chatProperties:0 messagesUpdated:v32];

    id v41 = 0;
    id v19 = _LastAddressedURIForChatLogMetricIfNeeded(v12, 0, self, &v41, 0);
    id v20 = v41;
    id v21 = objc_alloc_init((Class)NSMutableArray);
    CFStringRef v22 = v21;
    if (v19) {
      [v21 addObject:v19];
    }
    id v23 = [v12 participants];
    id v24 = URIsFromHandles(v23);

    [v22 addObjectsFromArray:v24];
    v38[0] = _NSConcreteStackBlock;
    v38[1] = 3221225472;
    v38[2] = sub_21D20;
    v38[3] = &unk_DDDB0;
    id v25 = v37;
    id v39 = v25;
    id v40 = v22;
    id v26 = v22;
    id v27 = objc_retainBlock(v38);
    unsigned __int8 v28 = [(MessageServiceSession *)self deliveryController];
    [v28 sendRepositionedStickerMetadata:v36 forEditedMessage:v25 destinations:v26 account:v20 fromID:v19 completionBlock:v27];

    unint64_t v29 = (void *)v32;
LABEL_8:

    goto LABEL_13;
  }
  if (IMOSLoggingEnabled())
  {
    id v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v45 = v37;
      __int16 v46 = 2112;
      uint64_t v47 = 0;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Could not find chat for sticker reposition. message: %@ chat: %@", buf, 0x16u);
    }
  }
LABEL_13:
}

- (unint64_t)_replicationEditDelay
{
  id v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"replication-edit-delay"];
  objc_opt_class();
  if (objc_opt_isKindOfClass() & 1) != 0 && (objc_opt_respondsToSelector())
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        v7[0] = 67109120;
        v7[1] = [v3 unsignedIntegerValue];
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Server bag value for replication edit delay: %u", (uint8_t *)v7, 8u);
      }
    }
    id v5 = [v3 unsignedIntegerValue];
  }
  else
  {
    id v5 = &dword_1C + 2;
  }

  return (unint64_t)v5;
}

- (id)_handleIDsForDestinations:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableOrderedSet);
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = v3;
  id v6 = (char *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v14;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = (void *)IDSCopyRawAddressForDestination();
        if (objc_msgSend(v10, "length", v13)) {
          [v4 addObject:v10];
        }
      }
      id v7 = (char *)[v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  id v11 = [v4 array];

  return v11;
}

- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v10 = a3;
  id v11 = a4;
  v66[0] = a6;
  id v12 = a5;
  [(MessageServiceSession *)self _logLocalInfo];
  id v65 = v12;
  [(MessageServiceSession *)self canonicalizeChatIdentifier:&v65 style:v66];
  id v13 = v65;

  long long v14 = [(MessageServiceSession *)self chatForChatIdentifier:v13 style:v66[0]];
  id v64 = 0;
  long long v15 = _LastAddressedURIForChatLogMetricIfNeeded(v14, 0, self, &v64, 0);
  id v16 = v64;
  if ([(MessageServiceSession *)self _isDeviceRegisteredForAccount:v16])
  {
    id v53 = v16;
    id v56 = v11;
    [(MessageServiceSession *)self _fixParticipantsForChat:v14];
    id v17 = objc_alloc_init((Class)NSMutableArray);
    id v18 = v17;
    if (v15) {
      [v17 addObject:v15];
    }
    id v54 = v15;
    id v55 = v13;
    id v59 = v14;
    if (([v10 isFromMe] & 1) == 0)
    {
      id v19 = [v10 sender];
      id v20 = +[NSArray arrayWithObject:v19];
      id v21 = [v20 _URIsFromIDs];
      [v18 addObjectsFromArray:v21];
    }
    v60[0] = _NSConcreteStackBlock;
    v60[1] = 3221225472;
    v60[2] = sub_226C8;
    v60[3] = &unk_DDDB0;
    id v57 = v10;
    id v22 = v10;
    id v61 = v22;
    id v52 = v18;
    id v62 = v52;
    id v51 = objc_retainBlock(v60);
    uint64_t v23 = IDSSendMessageOptionTopLevelDictionaryKey;
    uint64_t v24 = IDSSendMessageOptionSkipPayloadCheckKey;
    id v25 = +[NSNumber numberWithInteger:106];
    uint64_t v26 = IDSSendMessageOptionCommandKey;
    id v58 = v22;
    id v27 = [v22 guid];
    unsigned __int8 v28 = IDSGetUUIDData();
    uint64_t v29 = IDSSendMessageOptionUUIDKey;
    id v30 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    id v50 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v23, &__kCFBooleanTrue, v24, v25, v26, v28, v29, v30, IDSSendMessageOptionTimeoutKey, 0);

    uint64_t v31 = [(MessageServiceSession *)self groupController];
    long long v15 = v54;
    id v32 = [v31 newGroupMessagePayloadForChat:v59 fromID:v54];

    id v33 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v34 = v33;
    if (v32) {
      CFDictionarySetValue(v33, @"p", v32);
    }
    id v49 = v32;
    unsigned int v35 = +[NSNumber numberWithInt:1];
    if ([v58 isAudioMessage])
    {
      uint64_t v36 = 0;
    }
    else
    {
      id v40 = [v58 balloonBundleID];
      id v41 = [v40 length];

      if (!v41)
      {
LABEL_17:
        if (v35) {
          CFDictionarySetValue(v34, @"aT", v35);
        }
        unsigned __int8 v43 = [(MessageServiceSession *)self deliveryController];
        id v44 = +[NSSet setWithArray:v52];
        id v45 = v34;
        __int16 v46 = v34;
        id v16 = v53;
        [v43 sendMessageDictionary:v45 fromID:v54 fromAccount:v53 toURIs:v44 toGroup:0 priority:300 options:v50 completionBlock:v51];

        uint64_t v47 = [v58 guid];
        id v48 = [(MessageServiceSession *)self imdAccountForIDSAccount:v53];
        [(MessageServiceSession *)self didSendMessageSavedReceiptForMessageID:v47 account:v48];

        id v11 = v56;
        id v10 = v57;
        id v13 = v55;
        long long v14 = v59;
        goto LABEL_20;
      }
      uint64_t v36 = 2;
    }
    uint64_t v42 = +[NSNumber numberWithInt:v36];

    unsigned int v35 = (void *)v42;
    goto LABEL_17;
  }
  id v37 = [v10 guid];
  id v38 = [(MessageServiceSession *)self imdAccountForIDSAccount:v16];
  [(MessageServiceSession *)self didSendMessageSavedReceiptForMessageID:v37 account:v38];

  if (IMOSLoggingEnabled())
  {
    id v39 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, " ** Device is not regisistered, failing saved receipt", buf, 2u);
    }
  }
LABEL_20:
}

- (void)sendSyndicationAction:(id)a3 toChatsWithIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (!v6)
  {
    id v22 = IMLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_95D3C();
    }
    goto LABEL_25;
  }
  if (![v7 count])
  {
    id v22 = IMLogHandleForCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
      sub_95D70();
    }
LABEL_25:

    goto LABEL_33;
  }
  if (([v6 syndicationActionType] & 0x20) != 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Not sending Syndication action for SMS Spoof detected content", buf, 2u);
      }
    }
  }
  else
  {
    long long v31 = 0u;
    long long v32 = 0u;
    long long v29 = 0u;
    long long v30 = 0u;
    uint64_t v24 = v8;
    id v9 = v8;
    id v10 = [v9 countByEnumeratingWithState:&v29 objects:v36 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v30;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v30 != v11) {
            objc_enumerationMutation(v9);
          }
          uint64_t v13 = *(void *)(*((void *)&v29 + 1) + 8 * i);
          long long v14 = +[IMDChatRegistry sharedInstance];
          long long v15 = [v14 allExistingChatsWithIdentifier:v13];

          if (IMOSLoggingEnabled())
          {
            id v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              id v17 = [v15 count];
              *(_DWORD *)buf = 134217984;
              id v35 = v17;
              _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Sending syndication actions to %ld chats", buf, 0xCu);
            }
          }
          long long v27 = 0u;
          long long v28 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          id v18 = v15;
          id v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
          if (v19)
          {
            uint64_t v20 = *(void *)v26;
            do
            {
              for (j = 0; j != v19; j = (char *)j + 1)
              {
                if (*(void *)v26 != v20) {
                  objc_enumerationMutation(v18);
                }
                [(MessageServiceSession *)self _sendSyndicationAction:v6 toChat:*(void *)(*((void *)&v25 + 1) + 8 * (void)j)];
              }
              id v19 = [v18 countByEnumeratingWithState:&v25 objects:v33 count:16];
            }
            while (v19);
          }
        }
        id v10 = [v9 countByEnumeratingWithState:&v29 objects:v36 count:16];
      }
      while (v10);
    }

    uint64_t v8 = v24;
  }
LABEL_33:
}

- (void)sendUpdatedCollaborationMetadata:(id)a3 toChatsWithIdentifiers:(id)a4 forMessageGUID:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id obj = v8;
  id v10 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
  if (v10)
  {
    uint64_t v12 = *(void *)v30;
    *(void *)&long long v11 = 134217984;
    long long v23 = v11;
    do
    {
      uint64_t v13 = 0;
      do
      {
        if (*(void *)v30 != v12) {
          objc_enumerationMutation(obj);
        }
        uint64_t v14 = *(void *)(*((void *)&v29 + 1) + 8 * (void)v13);
        long long v15 = +[IMDChatRegistry sharedInstance];
        id v16 = [v15 allExistingChatsWithIdentifier:v14];

        if (IMOSLoggingEnabled())
        {
          id v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            id v18 = [v16 count];
            *(_DWORD *)buf = v23;
            id v35 = v18;
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Sending syndication actions to %ld chats", buf, 0xCu);
          }
        }
        long long v27 = 0u;
        long long v28 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v19 = v16;
        id v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v26;
          do
          {
            id v22 = 0;
            do
            {
              if (*(void *)v26 != v21) {
                objc_enumerationMutation(v19);
              }
              [*(id *)(*((void *)&v25 + 1) + 8 * (void)v22) updateCollaborationMetadata:v7 forMessageGUID:v9];
              id v22 = (char *)v22 + 1;
            }
            while (v20 != v22);
            id v20 = [v19 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v20);
        }

        uint64_t v13 = (char *)v13 + 1;
      }
      while (v13 != v10);
      id v10 = [obj countByEnumeratingWithState:&v29 objects:v36 count:16];
    }
    while (v10);
  }
}

- (void)_sendSyndicationAction:(id)a3 toChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = v7;
  if (v7)
  {
    id v32 = 0;
    long long v28 = _LastAddressedURIForChatLogMetricIfNeeded(v7, 0, self, &v32, 0);
    id v9 = v32;
    if ([(MessageServiceSession *)self _isDeviceRegisteredForAccount:v9])
    {
      if (v28)
      {
        id v10 = +[NSMutableDictionary dictionary];
        [v6 addParametersToSendMessageDictionary:v10];
        [v8 addGroupContextToSendMessageDictionary:v10 callerID:v28];
        long long v26 = JWEncodeDictionary();
        id v27 = [v26 _FTCopyGzippedData];
        if (IMOSLoggingEnabled())
        {
          long long v11 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
          {
            unsigned int v12 = [v26 length];
            unsigned int v13 = [v27 length];
            *(_DWORD *)buf = 67109376;
            unsigned int v37 = v12;
            __int16 v38 = 1024;
            unsigned int v39 = v13;
            _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Compressed SyndicationAction from: %u to: %u in sendSyndicationAction", buf, 0xEu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v14 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
          {
            unsigned int v15 = [v27 length];
            *(_DWORD *)buf = 67109120;
            unsigned int v37 = v15;
            _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Adding SyndicationAction data to be encrypted of size %u", buf, 8u);
          }
        }
        v34[0] = IDSSendMessageOptionTopLevelDictionaryKey;
        v34[1] = IDSSendMessageOptionSkipPayloadCheckKey;
        v35[0] = &__kCFBooleanTrue;
        v35[1] = &__kCFBooleanTrue;
        v35[2] = &off_E36C0;
        v34[2] = IDSSendMessageOptionCommandKey;
        v34[3] = IDSSendMessageOptionUUIDKey;
        id v16 = +[NSString stringGUID];
        id v17 = IDSGetUUIDData();
        v35[3] = v17;
        void v34[4] = IDSSendMessageOptionTimeoutKey;
        id v18 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
        v35[4] = v18;
        v34[5] = IDSSendMessageOptionDataToEncryptKey;
        v35[5] = v27;
        long long v25 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:6];

        id v33 = v28;
        id v19 = +[NSArray arrayWithObjects:&v33 count:1];
        v29[0] = _NSConcreteStackBlock;
        v29[1] = 3221225472;
        v29[2] = sub_23354;
        v29[3] = &unk_DDDB0;
        id v20 = v6;
        id v30 = v20;
        id v31 = v19;
        id v21 = v19;
        id v22 = objc_retainBlock(v29);
        long long v23 = [(MessageServiceSession *)self deliveryController];
        uint64_t v24 = +[NSSet setWithArray:v21];
        [v23 sendMessageDictionary:&__NSDictionary0__struct fromID:v28 fromAccount:v9 toURIs:v24 toGroup:0 priority:300 options:v25 completionBlock:v22];

        [(MessageServiceSession *)self didSendSyndicationActionItem:v20 forChat:v8];
      }
      else
      {
        id v10 = IMLogHandleForCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
          sub_95E0C();
        }
      }
    }
    else
    {
      id v10 = IMLogHandleForCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
        sub_95E40();
      }
    }
  }
  else
  {
    id v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_95DA4();
    }
  }
}

- (void)updateBalloonPayload:(id)a3 attachments:(id)a4 forMessageGUID:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length])
  {
    long long v11 = +[IMDMessageStore sharedInstance];
    unsigned int v12 = [v11 messageWithGUID:v10];

    if (v12)
    {
      unsigned int v13 = +[IMDMessageStore sharedInstance];
      uint64_t v14 = [v13 chatForMessage:v12];

      if (v14)
      {
        [v12 setPayloadData:v8];
        if ([v9 count])
        {
          unsigned int v15 = +[IMDFileTransferCenter sharedInstance];
          id v16 = [v15 guidsForStoredAttachmentPayloadData:v9 messageGUID:v10];
          [v12 setFileTransferGUIDs:v16];
        }
        id v17 = [v14 chatIdentifier];
        id v18 = [v14 style];
        id v19 = [v14 accountID];
        [(MessageServiceSession *)self didReceiveBalloonPayload:v12 forChat:v17 style:v18 messageGUID:v10 account:v19];
      }
      else if (IMOSLoggingEnabled())
      {
        id v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          int v21 = 138412290;
          id v22 = v12;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Chat: Could not find a chat for message: %@", (uint8_t *)&v21, 0xCu);
        }
      }
    }
    else
    {
      if (!IMOSLoggingEnabled())
      {
LABEL_20:

        goto LABEL_21;
      }
      uint64_t v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412290;
        id v22 = v10;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Chat: Could not update balloon payload for missing message GUID: %@", (uint8_t *)&v21, 0xCu);
      }
    }

    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    unsigned int v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v21 = 138412290;
      id v22 = v10;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Chat: Could not update balloon payload for missing payload: %@", (uint8_t *)&v21, 0xCu);
    }
    goto LABEL_20;
  }
LABEL_21:
}

- (void)sendBalloonPayload:(id)a3 attachments:(id)a4 withMessageGUID:(id)a5 bundleID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      unsigned int v15 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v10 length]);
      id v16 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v11 count]);
      *(_DWORD *)buf = 138413058;
      id v55 = v15;
      __int16 v56 = 2112;
      id v57 = v16;
      __int16 v58 = 2112;
      id v59 = v12;
      __int16 v60 = 2112;
      id v61 = v13;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "sendBalloonPayload [payload length] %@ [attachments count] %@ GUID %@ bundleID %@", buf, 0x2Au);
    }
  }
  if (v13)
  {
    if (v10 && [v10 length])
    {
      id v17 = +[IDSServerBag sharedInstanceForBagType:1];
      id v18 = [v17 objectForKey:@"md-balloon-transport-override"];
      BOOL v19 = [v18 intValue] == 0;

      if (v19)
      {
        int v21 = +[IMDMessageStore sharedInstance];
        unsigned __int8 v43 = [v21 messageWithGUID:v12];

        if (v43)
        {
          id v22 = +[IMDMessageStore sharedInstance];
          uint64_t v42 = [v22 chatForMessage:v43];

          if (v42)
          {
            id v53 = 0;
            long long v23 = _LastAddressedURIForChatLogMetricIfNeeded(v42, 0, self, &v53, 0);
            id v41 = v53;
            if ((!v41 || !v23) && IMOSLoggingEnabled())
            {
              uint64_t v24 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v55 = v42;
                __int16 v56 = 2112;
                id v57 = v41;
                _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Could not find IDSAccount for chat: %@, idsAccount %@", buf, 0x16u);
              }
            }
            if (IMOSLoggingEnabled())
            {
              long long v25 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v55 = v12;
                __int16 v56 = 2112;
                id v57 = v42;
                _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Found chat to send bubble message (%@) on: %@", buf, 0x16u);
              }
            }
            long long v26 = +[IMDFileTransferCenter sharedInstance];
            id v27 = [v26 guidsForStoredAttachmentPayloadData:v11 messageGUID:v12];
            [v43 setFileTransferGUIDs:v27];

            [v43 setPayloadData:v10];
            long long v28 = +[NSMutableArray array];
            long long v29 = v28;
            if (v23) {
              [v28 addObject:v23];
            }
            id v30 = [v42 participants];
            id v31 = URIsFromHandles(v30);
            [v29 addObjectsFromArray:v31];

            id v32 = [(MessageServiceSession *)self imdAccountForIDSAccount:v41];
            id v40 = [v42 chatIdentifier];
            unsigned int v39 = [v42 style];
            id v33 = [v32 accountID];
            v44[0] = _NSConcreteStackBlock;
            v44[1] = 3221225472;
            v44[2] = sub_23FF4;
            v44[3] = &unk_DDEC0;
            void v44[4] = self;
            id v45 = v12;
            id v46 = v13;
            id v47 = v10;
            id v48 = v11;
            id v49 = v42;
            id v50 = v41;
            id v51 = v23;
            id v52 = v29;
            id v38 = v29;
            id v37 = v23;
            id v34 = v41;
            [(MessageServiceSession *)self didSendBalloonPayload:v43 forChat:v40 style:v39 messageGUID:v45 account:v33 completionBlock:v44];
          }
          else if (IMOSLoggingEnabled())
          {
            uint64_t v36 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v55 = v43;
              _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "Chat: Could not find a chat for message: %@", buf, 0xCu);
            }
          }
        }
        else if (IMOSLoggingEnabled())
        {
          id v35 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v55 = v12;
            _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "Chat: Could not send balloon payload for missing message GUID: %@", buf, 0xCu);
          }
        }
      }
      else if (IMOSLoggingEnabled())
      {
        id v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "The server has disabled balloon to balloon via the iMessage config bag!", buf, 2u);
        }
LABEL_45:
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v55 = v12;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Chat: Could not send balloon payload for missing payload: %@", buf, 0xCu);
      }
      goto LABEL_45;
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v55 = v12;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Chat: Could not send balloon payload for missing bundle id: %@", buf, 0xCu);
    }
    goto LABEL_45;
  }
}

- (void)sendCrossServiceAssociationMessageWithReplacementGUID:(id)a3 messageGUID:(id)a4 callerID:(id)a5 toID:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v32 = v9;
      __int16 v33 = 2112;
      id v34 = v10;
      __int16 v35 = 2112;
      id v36 = v11;
      __int16 v37 = 2112;
      id v38 = v12;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "In cross service association method for replacementGUID: %@ messageGUID: %@, toID %@ callerID: %@", buf, 0x2Au);
    }
  }
  if (!v11)
  {
    id v11 = [(MessageServiceSession *)self callerURIUsingCalleeURI:v12];
  }
  long long v26 = [(MessageServiceSession *)self idsAccountForFromURI:v11 toURI:v12];
  v28[0] = _NSConcreteStackBlock;
  v28[1] = 3221225472;
  v28[2] = sub_24C90;
  v28[3] = &unk_DDDB0;
  id v14 = v9;
  id v29 = v14;
  id v15 = v10;
  id v30 = v15;
  id v16 = objc_retainBlock(v28);
  id v17 = objc_alloc_init((Class)NSMutableArray);
  id v18 = v17;
  if (v12) {
    [v17 addObject:v12];
  }
  if (v11) {
    [v18 addObject:v11];
  }
  BOOL v19 = +[NSNumber numberWithInteger:135];
  id v20 = IDSGetUUIDData();
  int v21 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
  id v22 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionSkipPayloadCheckKey, v19, IDSSendMessageOptionCommandKey, v20, IDSSendMessageOptionUUIDKey, v21, IDSSendMessageOptionTimeoutKey, &__kCFBooleanTrue, IDSSendMessageOptionWantsCertifiedDeliveryKey, 0);

  long long v23 = [(MessageServiceSession *)self deliveryController];
  uint64_t v24 = +[NSDictionary dictionaryWithObject:v14 forKey:@"Ur"];
  long long v25 = +[NSSet setWithArray:v18];
  [v23 sendMessageDictionary:v24 fromID:v11 fromAccount:v26 toURIs:v25 toGroup:0 priority:300 options:v22 completionBlock:v16];
}

- (void)_automation_sendDictionary:(id)a3 options:(id)a4 toHandles:(id)a5
{
  id v8 = a5;
  id v9 = a4;
  id v10 = a3;
  id v16 = [(MessageServiceSession *)self callerURIForMessageServiceType:0];
  id v11 = [v8 firstObject];
  id v12 = [(MessageServiceSession *)self idsAccountForFromURI:v16 toURI:v11];

  id v13 = [(MessageServiceSession *)self deliveryController];
  id v14 = objc_msgSend(v8, "__im_canonicalIDSIDsFromAddresses");

  id v15 = +[NSSet setWithArray:v14];
  [v13 sendMessageDictionary:v10 fromID:v16 fromAccount:v12 toURIs:v15 toGroup:0 priority:300 options:v9 completionBlock:&stru_DDEE0];
}

- (void)sendDeliveryReceiptForMessageID:(id)a3 toID:(id)a4 deliveryContext:(id)a5 needsDeliveryReceipt:(id)a6 callerID:(id)a7 account:(id)a8
{
  id v30 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = a8;
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v34 = v30;
      __int16 v35 = 2112;
      id v36 = v13;
      __int16 v37 = 2112;
      id v38 = v14;
      __int16 v39 = 2112;
      id v40 = v15;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "In delivery receipt method for messageID: %@ toID %@ deliveryContext: %@, needsDeliveryReceipt :%@ ", buf, 0x2Au);
    }
  }
  if ([v15 BOOLValue])
  {
    if (v16)
    {
      if (!v17) {
        goto LABEL_10;
      }
    }
    else
    {
      id v16 = [(MessageServiceSession *)self callerURIUsingCalleeURI:v13];
      if (!v17)
      {
LABEL_10:
        id v17 = [(MessageServiceSession *)self idsAccount];
      }
    }
    v31[0] = _NSConcreteStackBlock;
    v31[1] = 3221225472;
    v31[2] = sub_25438;
    v31[3] = &unk_DD998;
    id v32 = v30;
    long long v28 = objc_retainBlock(v31);
    id v19 = objc_alloc_init((Class)NSMutableArray);
    id v20 = v19;
    if (v13) {
      [v19 addObject:v13];
    }
    int v21 = +[NSNumber numberWithInteger:101];
    id v22 = IDSGetUUIDData();
    long long v23 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    uint64_t v24 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v21, IDSSendMessageOptionCommandKey, v22, IDSSendMessageOptionUUIDKey, v23, IDSSendMessageOptionTimeoutKey, 0);

    if (v14) {
      [v24 setObject:v14 forKey:@"Dc"];
    }
    long long v25 = [(MessageServiceSession *)self deliveryController];
    long long v26 = +[NSDictionary dictionary];
    id v27 = +[NSSet setWithArray:v20];
    [v25 sendMessageDictionary:v26 fromID:v16 fromAccount:v17 toURIs:v27 toGroup:0 priority:300 options:v24 completionBlock:v28];
  }
}

- (id)_messageDictionaryToReflectWithDeliveryReceipt:(id)a3
{
  id v4 = a3;
  id v5 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v6 = [v4 properties];

  id v7 = [v6 valueForKey:IMChatPropertyEnableReadReceiptForChatKey];
  if (!v7)
  {
    id v7 = +[NSNumber numberWithInteger:0];
  }
  id v8 = [v6 valueForKey:IMChatPropertyReadReceiptsSettingVersionKey];
  if (!v8)
  {
    id v8 = +[NSNumber numberWithInteger:0];
  }
  uint64_t v9 = [(MessageServiceSession *)self globalReadReceiptSettingVersion];
  id v10 = (void *)v9;
  id v11 = &off_E36D8;
  if (v9) {
    id v11 = (_UNKNOWN **)v9;
  }
  id v12 = v11;

  id v13 = +[NSNumber numberWithBool:[(MessageServiceSession *)self readReceiptsGloballyEnabled]];
  if (v7) {
    CFDictionarySetValue(v5, @"eR", v7);
  }
  if (v8) {
    CFDictionarySetValue(v5, @"vR", v8);
  }
  if (v13) {
    CFDictionarySetValue(v5, @"gR", v13);
  }
  CFDictionarySetValue(v5, @"gV", v12);

  return v5;
}

- (void)sendNicknameInfoToURIs:(id)a3 chatGUID:(id)a4
{
  id v6 = a3;
  id v7 = (__CFString *)a4;
  id v8 = +[IDSServerBag sharedInstanceForBagType:0];
  uint64_t v9 = [v8 objectForKey:@"enable-snap-v2-back-compat"];
  unsigned int v10 = [v9 BOOLValue];

  if (v10)
  {
    if (IMSharedHelperNickNameEnabled())
    {
      if (v7)
      {
        id v11 = +[IMDChatRegistry sharedInstance];
        id v12 = [v11 existingChatWithGUID:v7];

        if (!v12)
        {
          if (IMOSLoggingEnabled())
          {
            id v29 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v39 = v7;
              _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "We did not have a chat to send nickname info to %@", buf, 0xCu);
            }
          }
          id v14 = 0;
          id v13 = 0;
          goto LABEL_35;
        }
        id v37 = 0;
        id v13 = _LastAddressedURIForChatLogMetricIfNeeded(v12, 0, self, &v37, 0);
        id v14 = v37;
      }
      else
      {
        id v13 = [(MessageServiceSession *)self callerURIForMessageServiceType:0];
        id v14 = [(MessageServiceSession *)self idsAccountForURI:v13 IDSServiceName:IDSServiceNameiMessage];
      }
      unsigned int v16 = [(MessageServiceSession *)self _isDeviceRegisteredForAccount:v14];
      if (v16 && [v13 length])
      {
        +[NSString stringGUID];
        v34[0] = _NSConcreteStackBlock;
        v34[1] = 3221225472;
        v34[2] = sub_25D74;
        v34[3] = &unk_DDDB0;
        __int16 v33 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
        __int16 v35 = v33;
        id v31 = v6;
        id v36 = v31;
        id v32 = objc_retainBlock(v34);
        id v17 = +[NSNumber numberWithInteger:131];
        id v18 = IDSGetUUIDData();
        id v19 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
        id v20 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v17, IDSSendMessageOptionCommandKey, v18, IDSSendMessageOptionUUIDKey, v19, IDSSendMessageOptionTimeoutKey, 0);

        uint64_t v21 = +[IMDNicknameController sharedInstance];
        id v22 = [(id)v21 newNicknameInfoToSend];

        LOBYTE(v21) = [v22 count] == 0;
        int v23 = IMOSLoggingEnabled();
        if (v21)
        {
          if (v23)
          {
            id v30 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "No nickname info to send to others", buf, 2u);
            }
          }
        }
        else
        {
          if (v23)
          {
            uint64_t v24 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v39 = v33;
              __int16 v40 = 2112;
              id v41 = v31;
              _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Sending nickname info %@ to participants %@", buf, 0x16u);
            }
          }
          long long v25 = [(MessageServiceSession *)self deliveryController];
          long long v26 = +[NSSet setWithArray:v31];
          [v25 sendMessageDictionary:v22 encryptDictionary:1 fromID:v13 fromAccount:v14 toURIs:v26 toGroup:0 priority:300 options:v20 willSendBlock:0 completionBlock:v32];
        }
      }
      else if (IMOSLoggingEnabled())
      {
        id v27 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          CFStringRef v28 = @"NO";
          if (v16) {
            CFStringRef v28 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          CFStringRef v39 = v28;
          __int16 v40 = 2112;
          id v41 = v13;
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "** Device is not registered %@, failing nickname info or we don't have a callerURI %@", buf, 0x16u);
        }
      }
LABEL_35:

      goto LABEL_36;
    }
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Nicknames are disabled, rejecting nickname send", buf, 2u);
      }
    }
  }
LABEL_36:
}

- (BOOL)sendNicknameUpdatesToPeerDevices:(id)a3 toDestinations:(id)a4
{
  unsigned __int8 v43 = (__CFString *)a3;
  id v44 = (__CFString *)a4;
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v52 = v43;
      __int16 v53 = 2112;
      CFStringRef v54 = v44;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Sending nickname updates to my other devices %@ and peers %@", buf, 0x16u);
    }
  }
  id v7 = [(MessageServiceSession *)self idsAccount];
  if ([(MessageServiceSession *)self _isDeviceRegisteredForAccount:v7])
  {
    id v8 = (__CFString *)objc_alloc_init((Class)NSMutableSet);
    if ([(__CFString *)v44 count])
    {
      [(__CFString *)v8 addObjectsFromArray:v44];
    }
    else
    {
      uint64_t v42 = [(MessageServiceSession *)self idsServiceForIDSAccount:v7];
      if (IMOSLoggingEnabled())
      {
        id v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = [v42 devices];
          +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 count]);
          id v15 = (__CFString *)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)buf = 138412290;
          CFStringRef v52 = v15;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Going to send nickname updates to %@ accounts", buf, 0xCu);
        }
      }
      long long v47 = 0u;
      long long v48 = 0u;
      long long v45 = 0u;
      long long v46 = 0u;
      unsigned int v16 = [v42 devices];
      id v17 = (char *)[v16 countByEnumeratingWithState:&v45 objects:v59 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v46;
        do
        {
          for (i = 0; i != v17; ++i)
          {
            if (*(void *)v46 != v18) {
              objc_enumerationMutation(v16);
            }
            id v20 = (void *)IDSCopyIDForDevice();
            [(__CFString *)v8 addObject:v20];
          }
          id v17 = (char *)[v16 countByEnumeratingWithState:&v45 objects:v59 count:16];
        }
        while (v17);
      }

      id v21 = [(__CFString *)v8 count];
      id v22 = [v7 devices];
      id v23 = [v22 count];

      if (v7) {
        BOOL v24 = v21 != 0;
      }
      else {
        BOOL v24 = 0;
      }
      if (v23 == 0
        || !v24
        || ([v7 devices],
            long long v25 = objc_claimAutoreleasedReturnValue(),
            BOOL v26 = v25 == 0,
            v25,
            v26))
      {
        if (IMOSLoggingEnabled())
        {
          id v36 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
          {
            uint64_t v37 = [v7 devices];
            id v38 = (void *)v37;
            CFStringRef v39 = @"NO";
            *(_DWORD *)buf = 138413058;
            if (v23) {
              CFStringRef v40 = @"YES";
            }
            else {
              CFStringRef v40 = @"NO";
            }
            if (v21) {
              CFStringRef v39 = @"YES";
            }
            CFStringRef v52 = v39;
            __int16 v53 = 2112;
            CFStringRef v54 = v40;
            __int16 v55 = 2112;
            __int16 v56 = v7;
            __int16 v57 = 2112;
            uint64_t v58 = v37;
            _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "We did not have ids accounts to send nickname info out -- bailing {haveIDSDevicesToSendTo %@ haveTokenURISToSendTo %@ idsAccount %@ devices %@}", buf, 0x2Au);
          }
        }
        BOOL v12 = 0;
        goto LABEL_49;
      }
    }
    uint64_t v42 = [(MessageServiceSession *)self callerURIForIDSAccount:v7];
    uint64_t v9 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    unsigned int v10 = +[NSNumber numberWithUnsignedInt:70000];
    if (v10)
    {
      CFDictionarySetValue(v9, @"c", v10);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_95BA8();
    }

    id v27 = +[NSString stringGUID];
    CFStringRef v28 = +[NSNumber numberWithInteger:180];
    id v29 = IDSGetUUIDData();
    id v30 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    id v31 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v28, IDSSendMessageOptionCommandKey, v29, IDSSendMessageOptionUUIDKey, v30, IDSSendMessageOptionTimeoutKey, &__kCFBooleanTrue, IDSSendMessageOptionWantsDeliveryStatusKey, v9, IDSSendMessageOptionDeliveryStatusContextKey, 0);

    v49[0] = @"gC";
    id v32 = +[NSNumber numberWithUnsignedInt:70000];
    v49[1] = @"pID";
    v50[0] = v32;
    v50[1] = v43;
    __int16 v33 = +[NSDictionary dictionaryWithObjects:v50 forKeys:v49 count:2];

    if (IMOSLoggingEnabled())
    {
      id v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v52 = v33;
        __int16 v53 = 2112;
        CFStringRef v54 = v8;
        _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "Sending generic command to update nickname properties with message dictionary %@ to destinations %@", buf, 0x16u);
      }
    }
    __int16 v35 = [(MessageServiceSession *)self deliveryController];
    [v35 sendMessageDictionary:v33 encryptDictionary:1 fromID:v42 fromAccount:v7 toURIs:v8 toGroup:0 priority:300 options:v31 willSendBlock:0 completionBlock:&stru_DDF00];

    BOOL v12 = 1;
LABEL_49:

    goto LABEL_50;
  }
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "**Not sending nick name update as device is not registered", buf, 2u);
    }
  }
  BOOL v12 = 0;
LABEL_50:

  return v12;
}

- (void)forwardDeliveryReceiptForMessageID:(id)a3 withAccount:(id)a4 callerURI:(id)a5
{
  id v8 = a3;
  id v24 = a4;
  id v9 = a5;
  if (IMOSLoggingEnabled())
  {
    unsigned int v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v8;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Forwarding delivery receipt to all other devices  (messageID %@)", buf, 0xCu);
    }
  }
  id v11 = objc_alloc_init((Class)NSMutableArray);
  [v11 addObject:v9];
  BOOL v12 = +[IMDMessageStore sharedInstance];
  id v13 = [v12 chatForMessageGUID:v8];

  if (v13)
  {
    id v14 = [(MessageServiceSession *)self _messageDictionaryToReflectWithDeliveryReceipt:v13];
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v14;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Reflecting delivery receipt with chat properties: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v26 = v8;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "IMDChat not found for forwarding a delivery receipt with messageID: %@", buf, 0xCu);
      }
    }
    id v14 = &__NSDictionary0__struct;
  }
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v14;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Forwarding delivery receipt with messageDictionary: %@", buf, 0xCu);
    }
  }
  uint64_t v18 = +[NSNumber numberWithInteger:107];
  id v19 = IDSGetUUIDData();
  id v20 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
  id v21 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v18, IDSSendMessageOptionCommandKey, v19, IDSSendMessageOptionUUIDKey, v20, IDSSendMessageOptionTimeoutKey, 0);

  id v22 = [(MessageServiceSession *)self deliveryController];
  id v23 = +[NSSet setWithArray:v11];
  [v22 sendMessageDictionary:v14 encryptDictionary:1 fromID:v9 fromAccount:v24 toURIs:v23 toGroup:0 priority:300 options:v21 willSendBlock:0 completionBlock:&stru_DDF20];
}

- (void)_handleFileTransferUpdated:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  if (v5)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v6 = [(MessageServiceSession *)self pendingGroupPhotoDownloads];
      id v7 = [v5 guid];
      id v8 = [v6 objectForKey:v7];

      if (v8)
      {
        if (IMOSLoggingEnabled())
        {
          id v9 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            int v35 = 138412546;
            id v36 = v5;
            __int16 v37 = 2112;
            id v38 = v8;
            _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Processing pending group photo download %@ %@", (uint8_t *)&v35, 0x16u);
          }
        }
        if ((uint64_t)[v5 transferState] < 6)
        {
          BOOL v13 = (uint64_t)[v5 transferState] > 3;
          int v14 = IMOSLoggingEnabled();
          if (v13)
          {
            if (v14)
            {
              id v15 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
              {
                LOWORD(v35) = 0;
                _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, " => transfer in finalizing/finished state. Sending through download completion and removing from map", (uint8_t *)&v35, 2u);
              }
            }
            unsigned int v16 = [v8 _stringForKey:@"chat"];
            id v17 = +[IMDChatRegistry sharedInstance];
            uint64_t v18 = [v17 existingChatWithGUID:v16];

            id v19 = [v8 _stringForKey:@"sender"];
            id v20 = [v8 _numberForKey:@"isHidden"];
            id v21 = [v20 BOOLValue];

            id v22 = [(MessageServiceSession *)self pendingGroupPhotoDownloads];
            id v23 = [v5 guid];
            [v22 removeObjectForKey:v23];

            if (v18)
            {
              id v24 = [v5 guid];
              [(MessageServiceSession *)self groupPhotoDownloadCompletedForChat:v18 fileTransferError:0 success:1 transferGuid:v24 sender:v19 isHidden:v21];
            }
          }
          else if (v14)
          {
            long long v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              LOWORD(v35) = 0;
              _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, " => transfer still in process", (uint8_t *)&v35, 2u);
            }
          }
        }
        else
        {
          if (IMOSLoggingEnabled())
          {
            unsigned int v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              LOWORD(v35) = 0;
              _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, " => transfer in error state. removing from map", (uint8_t *)&v35, 2u);
            }
          }
          id v11 = [(MessageServiceSession *)self pendingGroupPhotoDownloads];
          BOOL v12 = [v5 guid];
          [v11 removeObjectForKey:v12];
        }
      }
      unsigned int v26 = [v5 isFromMomentShare];
      if ([v5 transferState] == (char *)&dword_4 + 1) {
        unsigned int v27 = v26;
      }
      else {
        unsigned int v27 = 0;
      }
      if (v27 == 1)
      {
        CFStringRef v28 = [(MessageServiceSession *)self messageStore];
        id v29 = [v5 messageGUID];
        id v30 = [v28 messageWithGUID:v29];

        id v31 = [(MessageServiceSession *)self broadcasterForChatListeners];
        id v32 = [(MessageServiceSession *)self account];
        __int16 v33 = [v32 accountID];
        id v34 = [v30 parentChatID];
        [v31 account:v33 chat:v34 style:0 chatProperties:0 messageUpdated:v30];
      }
LABEL_35:

      goto LABEL_36;
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v35 = 138412290;
      id v36 = v4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "transfer updated called with non-transfer object %@", (uint8_t *)&v35, 0xCu);
    }
    goto LABEL_35;
  }
LABEL_36:
}

- (void)doneRetrievingAttachmentsForGroupPhotoForChat:(id)a3 fileTransferError:(id)a4 success:(BOOL)a5 transferGuid:(id)a6 sender:(id)a7 isHidden:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  if (IMOSLoggingEnabled())
  {
    uint64_t v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      id v19 = [v14 guid];
      CFStringRef v20 = @"NO";
      *(_DWORD *)id v36 = 138413058;
      *(void *)&v36[4] = v19;
      if (v11) {
        CFStringRef v21 = @"YES";
      }
      else {
        CFStringRef v21 = @"NO";
      }
      *(void *)&v36[14] = v21;
      *(_WORD *)&v36[12] = 2112;
      if (v8) {
        CFStringRef v20 = @"YES";
      }
      *(_WORD *)&v36[22] = 2112;
      id v37 = v15;
      __int16 v38 = 2112;
      CFStringRef v39 = v20;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Finished retrieving attachments for group photo update. chatGuid %@ success %@ error %@ isHidden %@", v36, 0x2Au);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)id v36 = 138412290;
      *(void *)&v36[4] = v14;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, " => chat: %@", v36, 0xCu);
    }
  }
  if (v11)
  {
    id v23 = +[IMDFileTransferCenter sharedInstance];
    id v24 = [v23 transferForGUID:v16];

    if ((uint64_t)[v24 transferState] < 6)
    {
      BOOL v26 = (uint64_t)[v24 transferState] > 3;
      int v27 = IMOSLoggingEnabled();
      if (v26)
      {
        if (v27)
        {
          CFStringRef v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id v36 = 138412290;
            *(void *)&v36[4] = v24;
            _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Transfer for group photo finalizing/finished %@", v36, 0xCu);
          }
        }
        -[MessageServiceSession groupPhotoDownloadCompletedForChat:fileTransferError:success:transferGuid:sender:isHidden:](self, "groupPhotoDownloadCompletedForChat:fileTransferError:success:transferGuid:sender:isHidden:", v14, v15, 1, v16, v17, v8, *(_OWORD *)v36, *(void *)&v36[16]);
      }
      else
      {
        if (v27)
        {
          id v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id v36 = 138412290;
            *(void *)&v36[4] = v24;
            _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Transfer for group photo not yet finalizing %@", v36, 0xCu);
          }
        }
        id v30 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v31 = [v14 guid];
        if (v31) {
          CFDictionarySetValue(v30, @"chat", v31);
        }

        if (v17) {
          CFDictionarySetValue(v30, @"sender", v17);
        }
        id v32 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", v8, *(void *)v36, *(_OWORD *)&v36[8]);
        if (v32) {
          CFDictionarySetValue(v30, @"isHidden", v32);
        }

        if (IMOSLoggingEnabled())
        {
          __int16 v33 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)id v36 = 138412546;
            *(void *)&v36[4] = v24;
            *(_WORD *)&v36[12] = 2112;
            *(void *)&v36[14] = v30;
            _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Adding pending group photo download %@ %@", v36, 0x16u);
          }
        }
        id v34 = [(MessageServiceSession *)self pendingGroupPhotoDownloads];
        [v34 setObject:v30 forKey:v16];
      }
    }
    else if (IMOSLoggingEnabled())
    {
      long long v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)id v36 = 138412290;
        *(void *)&v36[4] = v24;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Transfer for group photo in error state %@", v36, 0xCu);
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    int v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v36 = 0;
      _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, " => failed retrieving attachments for group photo change", v36, 2u);
    }
  }
}

- (void)_updateOrRemoveGroupPhotoForChat:(id)a3 sender:(id)a4 completedTransfer:(id)a5 isHidden:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v42 = a4;
  id v11 = a5;
  if (IMOSLoggingEnabled())
  {
    BOOL v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      BOOL v13 = [v11 guid];
      CFStringRef v14 = @"NO";
      if (!v13) {
        CFStringRef v14 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v44 = v14;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Generating chatItem for group photo change. Was group photo removal: %@", buf, 0xCu);
    }
  }
  id v15 = [v11 guid];
  id v16 = [(MessageServiceSession *)self generateAndStoreGroupPhotoChangeStatusItemForChat:v10 sender:v42 fileTransferGuid:v15 isHidden:v6];

  if (v16)
  {
    id v17 = +[IMDAttachmentStore sharedInstance];
    uint64_t v18 = [(__CFString *)v16 guid];
    [v17 storeAttachment:v11 associateWithMessageWithGUID:v18];

    id v19 = [(MessageServiceSession *)self attachmentController];
    CFStringRef v20 = [v11 guid];
    CFStringRef v21 = [(__CFString *)v16 guid];
    [v19 updateGroupPhoto:v20 forChat:v10 messageGuid:v21];

    id v22 = [(__CFString *)v16 sender];
    if (v22) {
      char v23 = v6;
    }
    else {
      char v23 = 1;
    }

    if (v23)
    {
      id v41 = 0;
    }
    else
    {
      CFStringRef v47 = @"sender";
      long long v25 = [(__CFString *)v16 sender];
      long long v48 = v25;
      id v41 = +[NSDictionary dictionaryWithObjects:&v48 forKeys:&v47 count:1];
    }
    if (IMOSLoggingEnabled())
    {
      BOOL v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        int v27 = [v10 chatIdentifier];
        *(_DWORD *)buf = 138412546;
        CFStringRef v44 = v27;
        __int16 v45 = 2112;
        long long v46 = v41;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Broadcasting groupPhotoUpdatedForChatIdentifier: %@ userInfo: %@", buf, 0x16u);
      }
    }
    CFStringRef v28 = [(MessageServiceSession *)self broadcasterForChatListeners];
    id v29 = [v10 chatIdentifier];
    id v30 = [v10 style];
    id v31 = [(MessageServiceSession *)self account];
    id v32 = [v31 accountID];
    [v28 groupPhotoUpdatedForChatIdentifier:v29 style:v30 account:v32 userInfo:v41];

    if (IMOSLoggingEnabled())
    {
      __int16 v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v44 = v16;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Broadcasting messageReceived %@", buf, 0xCu);
      }
    }
    id v34 = [(MessageServiceSession *)self broadcasterForChatListeners];
    int v35 = [(MessageServiceSession *)self account];
    id v36 = [v35 accountID];
    id v37 = [v10 chatIdentifier];
    id v38 = [v10 style];
    CFStringRef v39 = [v10 groupID];
    CFStringRef v40 = [v10 personCentricID];
    [v34 account:v36 chat:v37 style:v38 chatProperties:0 groupID:v39 chatPersonCentricID:v40 messageReceived:v16];
  }
  else if (IMOSLoggingEnabled())
  {
    id v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Did not generate a message item, bailing early", buf, 2u);
    }
  }
}

- (void)groupPhotoDownloadCompletedForChat:(id)a3 fileTransferError:(id)a4 success:(BOOL)a5 transferGuid:(id)a6 sender:(id)a7 isHidden:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v11 = a5;
  id v34 = a3;
  id v33 = a4;
  id v13 = a6;
  id v14 = a7;
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      id v16 = [v34 guid];
      CFStringRef v17 = @"NO";
      *(_DWORD *)buf = 138413058;
      *(void *)&uint8_t buf[4] = v16;
      if (v11) {
        CFStringRef v18 = @"YES";
      }
      else {
        CFStringRef v18 = @"NO";
      }
      *(void *)&buf[14] = v18;
      *(_WORD *)&unsigned char buf[12] = 2112;
      if (v8) {
        CFStringRef v17 = @"YES";
      }
      *(_WORD *)&buf[22] = 2112;
      *(void *)&unsigned char buf[24] = v33;
      LOWORD(v44[0]) = 2112;
      *(void *)((char *)v44 + 2) = v17;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Group photo download completed. chatGuid %@ success %@ error %@ isHidden %@", buf, 0x2Au);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v34;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
    }
  }
  if (v11)
  {
    if (v13)
    {
      CFStringRef v20 = +[IMDFileTransferCenter sharedInstance];
      CFStringRef v21 = [v20 transferForGUID:v13];

      id v22 = [v21 localURL];
      if (!v22) {
        goto LABEL_32;
      }
      char v23 = +[NSFileManager defaultManager];
      id v24 = [v21 localURL];
      long long v25 = [v24 path];
      unsigned int v26 = [v23 fileExistsAtPath:v25];

      if (v26)
      {
        v44[0] = 0;
        memset(buf, 0, sizeof(buf));
        IMPreviewConstraintsZero();
        *(_OWORD *)buf = xmmword_A5410;
        *(_OWORD *)&uint8_t buf[16] = xmmword_A5420;
        LOWORD(v44[0]) = 0;
        BYTE2(v44[0]) = 0;
        int v27 = [v21 localURL];
        CFStringRef v28 = +[IMTranscodeController sharedInstance];
        v37[0] = _NSConcreteStackBlock;
        v37[1] = 3221225472;
        v37[2] = sub_280EC;
        v37[3] = &unk_DDF48;
        v37[4] = self;
        id v38 = v34;
        id v39 = v14;
        BOOL v42 = v8;
        id v40 = v21;
        id v41 = v27;
        v35[0] = *(_OWORD *)buf;
        v35[1] = *(_OWORD *)&buf[16];
        uint64_t v36 = v44[0];
        id v29 = v27;
        [v28 replaceTransferWithSafeTransfer:v29 constraints:v35 completionBlock:v37];
      }
      else
      {
LABEL_32:
        if (IMOSLoggingEnabled())
        {
          id v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v21;
            _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, " => completed transfer had nil or missing localURL: %@", buf, 0xCu);
          }
        }
      }
    }
    else
    {
      [(MessageServiceSession *)self _updateOrRemoveGroupPhotoForChat:v34 sender:v14 completedTransfer:0 isHidden:v8];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, " => failed retrieving attachments for group photo change", buf, 2u);
    }
  }
}

- (BOOL)shouldDownloadGroupPhoto:(id)a3
{
  id v3 = a3;
  id v4 = [v3 userInfo];
  id v5 = [v4 _stringForKey:@"file-size"];

  id v6 = objc_alloc_init((Class)NSNumberFormatter);
  id v7 = [v6 numberFromString:v5];
  id v8 = [v7 unsignedIntegerValue];

  if ((unint64_t)v8 >= 0x20C801 && IMOSLoggingEnabled())
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      int v11 = 134217984;
      id v12 = v8;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "**Not** downloading group photo, too big. Size: %lu", (uint8_t *)&v11, 0xCu);
    }
  }
  return (unint64_t)v8 < 0x20C801;
}

- (void)receivedGroupPhotoUpdate:(id)a3 chat:(id)a4 sender:(id)a5 isHidden:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v52 = a5;
  uint64_t v11 = +[IMFileTransfer guidForFileTransferDictionary:v9];
  uint64_t v12 = [v10 groupPhotoGuid];
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Received group photo update.", buf, 2u);
    }
  }
  if (v12 | v11)
  {
    CFStringRef v17 = +[IMDFileTransferCenter sharedInstance];
    id v51 = [v17 transferForGUID:v11];

    if (!v51 || ![v51 existsAtLocalPath]) {
      goto LABEL_29;
    }
    if (IMOSLoggingEnabled())
    {
      CFStringRef v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = [v51 localPath];
        *(_DWORD *)buf = 138412290;
        uint64_t v61 = (uint64_t)v19;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "The existingTransfer has group photo at local path: %@", buf, 0xCu);
      }
    }
    if (IMAreObjectsLogicallySame())
    {
      if (IMOSLoggingEnabled())
      {
        CFStringRef v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          CFStringRef v21 = [v10 guid];
          *(_DWORD *)buf = 138412802;
          uint64_t v61 = v11;
          __int16 v62 = 2112;
          uint64_t v63 = v12;
          __int16 v64 = 2112;
          id v65 = v21;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Received group photo with the same guid as we have -- dropping this message. Incoming guid: %@ existing guid: %@ chatGuid: %@", buf, 0x20u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        id v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v61 = (uint64_t)v10;
          _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
        }
      }
    }
    else
    {
LABEL_29:
      BOOL v23 = [v9 count] == 0;
      int v24 = IMOSLoggingEnabled();
      if (v23)
      {
        if (v24)
        {
          id v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Received group photo update with empty file transfer dict -- deleting group photo", buf, 2u);
          }
        }
        [(MessageServiceSession *)self groupPhotoDownloadCompletedForChat:v10 fileTransferError:0 success:1 transferGuid:0 sender:v52 isHidden:0];
      }
      else
      {
        if (v24)
        {
          long long v25 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v61 = (uint64_t)v52;
            _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Received group photo update with non-empty fileTransferDict, from %@", buf, 0xCu);
          }
        }
        id v26 = objc_alloc_init((Class)IMFileTransfer);
        [v26 _updateWithDictionaryRepresentationForWhitelistedKeys:v9];
        id v49 = [v26 guid];
        if ([(MessageServiceSession *)self shouldDownloadGroupPhoto:v26])
        {
          if ([v49 length])
          {
            int v27 = +[IMDFileTransferCenter sharedInstance];
            CFStringRef v28 = [v26 guid];
            [v27 addTransfer:v26 forGUID:v28];

            id v29 = IMMessageGuidFromIMFileTransferGuid();
            id v30 = v29;
            if (v29)
            {
              id v47 = v29;
            }
            else
            {
              id v47 = +[NSString stringGUID];
            }

            id v33 = objc_alloc((Class)IMMessageItem);
            id v34 = +[NSDate date];
            id v59 = v49;
            int v35 = +[NSArray arrayWithObjects:&v59 count:1];
            id v48 = [v33 initWithSender:v52 time:v34 body:0 attributes:0 fileTransferGUIDs:v35 flags:1 error:0 guid:v47 threadIdentifier:0];

            if ([v48 isFromMe])
            {
              uint64_t v36 = [v48 service];
              +[IMSenderContext fromMeContextWithServiceName:v36];
            }
            else
            {
              id v37 = +[IMDChatRegistry sharedInstance];
              id v38 = [v48 sender];
              id v39 = [v37 hasKnownSenderChatWithChatIdentifier:v38];

              uint64_t v36 = [v48 service];
              +[IMSenderContext contextWithKnownSender:v39 serviceName:v36];
            long long v46 = };

            id v40 = [(MessageServiceSession *)self attachmentController];
            id v41 = [v52 _stripFZIDPrefix];
            id v58 = v52;
            BOOL v42 = +[NSArray arrayWithObjects:&v58 count:1];
            unsigned __int8 v43 = IMServiceNameForCanonicalIDSAddresses();
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472;
            v53[2] = sub_28E24;
            v53[3] = &unk_DDF70;
            v53[4] = self;
            id v54 = v10;
            id v55 = v49;
            id v56 = v52;
            BOOL v57 = a6;
            [v40 retrieveAttachmentsForMessage:v48 inlineAttachments:0 displayID:v41 topic:v43 comingFromStorage:0 shouldForceAutoDownload:1 senderContext:v46 completionBlock:v53];

            CFStringRef v44 = +[IMDAttachmentStore sharedInstance];
            __int16 v45 = [v48 guid];
            [v44 storeAttachment:v26 associateWithMessageWithGUID:v45];
          }
          else if (IMOSLoggingEnabled())
          {
            id v32 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, " No group photo update file transfer transferGuid for some reason, doing nothing.", buf, 2u);
            }
          }
        }
        else
        {
        }
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        id v15 = [v10 guid];
        *(_DWORD *)buf = 138412290;
        uint64_t v61 = (uint64_t)v15;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Received no GUID, and we already don't have one -- dropping this message. ChatGuid: %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v61 = (uint64_t)v10;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, " => chat: %@", buf, 0xCu);
      }
    }
  }
}

- (id)fileTransferDictionaryForChat:(id)a3
{
  id v3 = a3;
  id v4 = +[IMDFileTransferCenter sharedInstance];
  id v5 = [v3 groupPhotoGuid];

  id v6 = [v4 transferForGUID:v5];
  id v7 = [v6 _dictionaryToSend];

  return v7;
}

- (void)requestGroupPhotoIfNecessary:(id)a3 incomingParticipantVersion:(int64_t)a4 incomingGroupPhotoCreationTime:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 messageIsFromStorage:(BOOL)a8
{
  BOOL v8 = a8;
  id v19 = a5;
  id v14 = a7;
  id v15 = a6;
  id v16 = a3;
  if ([v19 unsignedLongLongValue])
  {
    CFStringRef v17 = +[NSDate __im_iMessageDateFromTimeStamp:v19];
  }
  else
  {
    CFStringRef v17 = 0;
  }
  CFStringRef v18 = [(MessageServiceSession *)self groupController];
  [v18 requestGroupPhotoIfNecessary:v16 incomingParticipantVersion:a4 incomingGroupPhotoCreationDate:v17 toIdentifier:v15 fromIdentifier:v14 messageIsFromStorage:v8 session:self];
}

- (id)_messageDictionaryForDeleteCommandShouldResetPreference:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = +[NSMutableDictionary dictionaryWithCapacity:3];
  id v5 = IMGetDomainValueForKey();
  uint64_t v6 = IMGetDomainValueForKey();
  id v7 = (void *)v6;
  if (v5) {
    BOOL v8 = v6 == 0;
  }
  else {
    BOOL v8 = 1;
  }
  if (!v8)
  {
    [v4 setObject:v6 forKey:@"days"];
    [v4 setObject:v5 forKey:@"ID"];
  }
  if (v3) {
    [v4 setObject:&__kCFBooleanTrue forKey:@"resetPreference"];
  }
  CFStringRef v11 = @"KeepMessages";
  uint64_t v12 = v4;
  id v9 = +[NSDictionary dictionaryWithObjects:&v12 forKeys:&v11 count:1];

  return v9;
}

- (void)sendDeleteCommand:(id)a3 forChatGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[IMDChatRegistry sharedInstance];
  id v9 = [v8 existingChatWithGUID:v7];

  unsigned int v10 = [v9 wasReportedAsJunk];
  CFStringRef v11 = [(MessageServiceSession *)self ckUtilities];
  unsigned int v12 = [v11 cloudKitSyncingEnabled];

  id v13 = [v6 objectForKeyedSubscript:IMDDeleteCommandIsScheduledMessageKey];

  if (v13) {
    int v14 = 1;
  }
  else {
    int v14 = v12 | v10;
  }
  if (v14)
  {
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109632;
        *(_DWORD *)uint64_t v36 = v12;
        *(_WORD *)&v36[4] = 1024;
        *(_DWORD *)&v36[6] = v10;
        *(_WORD *)id v37 = 1024;
        *(_DWORD *)&v37[2] = v13 != 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Forwarding delete command to all other devices: cloudKitSyncingEnabled: %d wasReportedJunk: %d isScheduledMessage: %d", buf, 0x14u);
      }
    }
    goto LABEL_14;
  }
  id v16 = [(MessageServiceSession *)self deliveryController];
  CFStringRef v17 = [v16 pairedDevice];

  int v18 = IMOSLoggingEnabled();
  if (v17)
  {
    if (v18)
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Send delete command only to the paired device", buf, 2u);
      }
    }
LABEL_14:
    if (v9)
    {
      id v34 = 0;
      CFStringRef v20 = _LastAddressedURIForChatLogMetricIfNeeded(v9, 0, self, &v34, 0);
      id v21 = v34;
      if (!v21) {
        goto LABEL_26;
      }
    }
    else
    {
      id v21 = [(MessageServiceSession *)self idsAccount];
      CFStringRef v20 = [(MessageServiceSession *)self callerURIUsingCalleeURI:0];
      if (!v21) {
        goto LABEL_26;
      }
    }
    if (v20 && [v20 length])
    {
      id v33 = objc_alloc_init((Class)NSMutableArray);
      if (v14) {
        [v33 addObject:v20];
      }
      else {
        [v33 addObject:IDSDefaultPairedDevice];
      }
      int v24 = JWEncodeDictionary();
      id v25 = [v24 _FTCopyGzippedData];

      if (IMOSLoggingEnabled())
      {
        id v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)uint64_t v36 = v6;
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Forwarding delete command :%@", buf, 0xCu);
        }
      }
      int v27 = +[NSNumber numberWithInteger:181];
      CFStringRef v28 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
      id v29 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v27, IDSSendMessageOptionCommandKey, v25, IDSSendMessageOptionDataToEncryptKey, v28, IDSSendMessageOptionTimeoutKey, 0);

      id v30 = [(MessageServiceSession *)self deliveryController];
      id v31 = +[NSDictionary dictionary];
      id v32 = +[NSSet setWithArray:v33];
      [v30 sendMessageDictionary:v31 encryptDictionary:1 fromID:v20 fromAccount:v21 toURIs:v32 toGroup:0 priority:300 options:v29 willSendBlock:0 completionBlock:&stru_DDF90];

      goto LABEL_36;
    }
LABEL_26:
    if (IMOSLoggingEnabled())
    {
      BOOL v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        *(void *)uint64_t v36 = v21;
        *(_WORD *)&v36[8] = 2112;
        *(void *)id v37 = v20;
        *(_WORD *)&v37[8] = 2112;
        id v38 = v6;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Not enough information to forward delete command, idsAccount:%@ callerURI:%@ command:%@", buf, 0x20u);
      }
    }
LABEL_36:

    goto LABEL_37;
  }
  if (v18)
  {
    id v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      *(void *)uint64_t v36 = v6;
      *(_WORD *)&v36[8] = 1024;
      *(_DWORD *)id v37 = 0;
      *(_WORD *)&v37[4] = 1024;
      *(_DWORD *)&v37[6] = 0;
      LOWORD(v38) = 1024;
      *(_DWORD *)((char *)&v38 + 2) = 0;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "iCloud syncing not enabled, and was not reported junk, dropping delete command to all other devices, (command %@) cloudkitSyncingEnabled: %d wasReportedJunk: %d isScheduledMessage: %d", buf, 0x1Eu);
    }
  }
LABEL_37:
}

- (void)sendRecoverCommand:(id)a3 forChatGUID:(id)a4
{
  id v29 = a3;
  id v6 = a4;
  id v7 = [(MessageServiceSession *)self ckUtilities];
  unsigned int v8 = [v7 cloudKitSyncingEnabled];

  if (v8)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_11;
    }
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Recently Deleted | Forwarding Recover command to all other devices: cloudKitSyncingEnabled: YES", buf, 2u);
    }
    goto LABEL_10;
  }
  unsigned int v10 = [(MessageServiceSession *)self deliveryController];
  CFStringRef v11 = [v10 pairedDevice];

  int v12 = IMOSLoggingEnabled();
  if (v11)
  {
    if (!v12) {
      goto LABEL_11;
    }
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Send recover command only to the paired device", buf, 2u);
    }
LABEL_10:

LABEL_11:
    id v13 = +[IMDChatRegistry sharedInstance];
    int v14 = [v13 existingChatWithGUID:v6];

    if (v14)
    {
      id v30 = 0;
      id v15 = _LastAddressedURIForChatLogMetricIfNeeded(v14, 0, self, &v30, 0);
      id v16 = v30;
      if (!v16) {
        goto LABEL_19;
      }
    }
    else
    {
      id v16 = [(MessageServiceSession *)self idsAccount];
      id v15 = [(MessageServiceSession *)self callerURIUsingCalleeURI:0];
      if (!v16) {
        goto LABEL_19;
      }
    }
    if (v15 && [v15 length])
    {
      id v17 = objc_alloc_init((Class)NSMutableArray);
      int v18 = v17;
      if (v8) {
        [v17 addObject:v15];
      }
      else {
        [v17 addObject:IDSDefaultPairedDevice];
      }
      id v21 = JWEncodeDictionary();
      id v22 = [v21 _FTCopyGzippedData];

      if (IMOSLoggingEnabled())
      {
        BOOL v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v29;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Recently Deleted | Forwarding recover command :%@", buf, 0xCu);
        }
      }
      v31[0] = IDSSendMessageOptionTopLevelDictionaryKey;
      v31[1] = IDSSendMessageOptionSkipPayloadCheckKey;
      v32[0] = &__kCFBooleanTrue;
      v32[1] = &__kCFBooleanTrue;
      v31[2] = IDSSendMessageOptionCommandKey;
      v31[3] = IDSSendMessageOptionDataToEncryptKey;
      v32[2] = &off_E3708;
      v32[3] = v22;
      void v31[4] = IDSSendMessageOptionTimeoutKey;
      int v24 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
      v32[4] = v24;
      id v25 = +[NSDictionary dictionaryWithObjects:v32 forKeys:v31 count:5];

      id v26 = [(MessageServiceSession *)self deliveryController];
      int v27 = +[NSDictionary dictionary];
      CFStringRef v28 = +[NSSet setWithArray:v18];
      [v26 sendMessageDictionary:v27 encryptDictionary:1 fromID:v15 fromAccount:v16 toURIs:v28 toGroup:0 priority:300 options:v25 willSendBlock:0 completionBlock:&stru_DDFB0];

      goto LABEL_33;
    }
LABEL_19:
    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412802;
        id v34 = v16;
        __int16 v35 = 2112;
        uint64_t v36 = v15;
        __int16 v37 = 2112;
        id v38 = v29;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Recently Deleted | Not enough information to forward Recover command, idsAccount:%@ callerURI:%@ command:%@", buf, 0x20u);
      }
    }
LABEL_33:

    goto LABEL_34;
  }
  if (v12)
  {
    CFStringRef v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v34 = v29;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Recently Deleted | iCloud syncing not enabled, dropping recover command to all other devices, (command %@) cloudkitSyncingEnabled: NO", buf, 0xCu);
    }
  }
LABEL_34:
}

- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9
{
  id v28 = a3;
  id v29 = a4;
  id v30 = a5;
  id v15 = a6;
  unsigned __int8 v39 = a8;
  id v16 = a9;
  id v38 = a7;
  id v17 = a7;
  [(MessageServiceSession *)self canonicalizeChatIdentifier:&v38 style:&v39];
  id v18 = v38;

  if (v18)
  {
    id v19 = +[IMDChatRegistry sharedInstance];
    CFStringRef v20 = [v19 existingChatWithGUID:v15];

    if (!v20)
    {
      CFStringRef v20 = [(MessageServiceSession *)self chatForChatIdentifier:v18 style:v39];
    }
    id v37 = 0;
    int v27 = _LastAddressedURIForChatLogMetricIfNeeded(v20, v30, self, &v37, 0);
    id v26 = v37;
    [(MessageServiceSession *)self _fixParticipantsForChat:v20];
    if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413570;
        id v41 = v28;
        __int16 v42 = 2112;
        unsigned __int8 v43 = v20;
        __int16 v44 = 2112;
        id v45 = v15;
        __int16 v46 = 2112;
        id v47 = v27;
        __int16 v48 = 2112;
        id v49 = v18;
        __int16 v50 = 1024;
        int v51 = v39;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Request to update name: %@   forChat: %@ lastAddressed: %@  (GUID: %@  Identifier: %@  Style: %c)", buf, 0x3Au);
      }
    }
    id v22 = [(MessageServiceSession *)self groupController];
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_2A2DC;
    v32[3] = &unk_DDFD8;
    id v23 = v28;
    id v33 = v23;
    id v24 = v15;
    id v34 = v24;
    id v25 = v18;
    id v35 = v25;
    unsigned __int8 v36 = v39;
    [v22 setName:v23 fromName:v29 forChat:v20 fromID:v27 fromAccount:v26 messageID:v16 session:self completionBlock:v32];

    v31.receiver = self;
    v31.super_class = (Class)MessageServiceSession;
    [(MessageServiceSession *)&v31 updateDisplayName:v23 fromDisplayName:v29 fromID:v30 forChatID:v24 identifier:v25 style:v39 messageID:v16];
  }
}

- (void)closeSessionForChat:(id)a3 chatGUID:(id)a4 didDeleteConversation:(BOOL)a5 style:(unsigned __int8)a6
{
  BOOL v6 = a5;
  id v9 = a3;
  id v24 = a4;
  if (IMOSLoggingEnabled())
  {
    unsigned int v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v31 = v9;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Request to close business session for chat identifier: %@", buf, 0xCu);
    }
  }
  CFStringRef v11 = [(MessageServiceSession *)self chatForChatIdentifier:v9 style:45];
  id v27 = 0;
  id v26 = _LastAddressedURIForChatLogMetricIfNeeded(v11, 0, self, &v27, 0);
  id v25 = v27;
  v28[0] = @"sV";
  v28[1] = @"cID";
  v29[0] = &off_E36A8;
  v29[1] = v9;
  v28[2] = @"dc";
  int v12 = +[NSNumber numberWithBool:v6];
  v29[2] = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:v29 forKeys:v28 count:3];

  int v14 = [(MessageServiceSession *)self deliveryController];
  [v14 sendCloseSessionMessageDictionary:v13 toBusinessURI:v9 fromURI:v26 fromAccount:v25 completionBlock:&stru_DDFF8];

  [v11 deleteBIAContext];
  if (!v6)
  {
    id v23 = [(MessageServiceSession *)self _generateAndStoreGroupActionItemForChat:v11 sender:v9];
    id v22 = [(MessageServiceSession *)self broadcasterForChatListeners];
    id v15 = [(MessageServiceSession *)self account];
    id v16 = [v15 accountID];
    id v17 = [v11 chatIdentifier];
    id v18 = [v11 style];
    id v19 = [v11 chatProperties];
    CFStringRef v20 = [v11 groupID];
    id v21 = [v11 personCentricID];
    [v22 account:v16 chat:v17 style:v18 chatProperties:v19 groupID:v20 chatPersonCentricID:v21 messageReceived:v23];
  }
}

- (id)_generateAndStoreGroupActionItemForChat:(id)a3 sender:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v9 = [v8 isBIAEnabled];

  if (v9)
  {
    if (v6)
    {
      id v10 = objc_alloc((Class)IMGroupActionItem);
      CFStringRef v11 = +[NSDate date];
      int v12 = +[NSString stringGUID];
      id v13 = [v10 initWithSender:v7 time:v11 guid:v12 type:3];

      [v13 setActionType:0];
      int v14 = [(MessageServiceSession *)self service];
      id v15 = [v14 internalName];
      [v13 setService:v15];

      id v16 = [(MessageServiceSession *)self account];
      id v17 = [v16 accountID];
      [v13 setAccountID:v17];

      id v18 = [(MessageServiceSession *)self account];
      id v19 = [v18 loginID];
      [v13 setAccount:v19];

      CFStringRef v20 = [(MessageServiceSession *)self messageStore];
      id v21 = [v20 storeItem:v13 forceReplace:0];

      id v22 = [(MessageServiceSession *)self chatStore];
      id v23 = [v21 guid];
      [v22 addMessageWithGUID:v23 toChat:v6];

      goto LABEL_9;
    }
    if (IMOSLoggingEnabled())
    {
      id v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v26 = 0;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "_generateAndStoreGroupActionItemForChat passed a nil chat. Early returning", v26, 2u);
      }
    }
  }
  id v21 = 0;
LABEL_9:

  return v21;
}

- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5
{
}

- (void)sendCommand:(id)a3 withProperties:(id)a4 toPerson:(id)a5 toChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8
{
  id v67 = a3;
  id v14 = a4;
  id v66 = a5;
  id v65 = a6;
  id v15 = a7;
  unsigned __int8 v76 = a8;
  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v87 = v67;
      __int16 v88 = 2112;
      id v89 = v14;
      __int16 v90 = 2112;
      id v91 = v66;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Request to send command: %@   with properties: %@   to person: %@", buf, 0x20u);
    }
  }
  [(MessageServiceSession *)self _logLocalInfo];
  if (v15)
  {
    id v75 = v15;
    [(MessageServiceSession *)self canonicalizeChatIdentifier:&v75 style:&v76];
    id v68 = v75;

    id v17 = [(MessageServiceSession *)self chatForChatIdentifier:v68 style:v76];
    id v74 = 0;
    id v69 = _LastAddressedURIForChatLogMetricIfNeeded(v17, 0, self, &v74, 0);
    id v18 = v74;

    if (v69 && v18)
    {
LABEL_12:
      id v64 = v18;
      if ([(MessageServiceSession *)self _isDeviceRegisteredForAccount:v18])
      {
        unsigned int v21 = [v67 unsignedIntValue];
        if (v21 == 60001)
        {
          if (IMOSLoggingEnabled())
          {
            id v26 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Sending a generic notification to update global read receipt value and updating local chats", buf, 2u);
            }
          }
          id v27 = objc_msgSend(v14, "objectForKey:");
          -[MessageServiceSession overwritePerChatReadReceiptSettingsWithGlobalValue:](self, "overwritePerChatReadReceiptSettingsWithGlobalValue:", [v27 BOOLValue]);

          id v28 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          id v29 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v67 unsignedIntValue]);
          if (v29)
          {
            CFDictionarySetValue(v28, @"c", v29);
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_95BA8();
          }

          CFMutableDictionaryRef theDicta = +[NSString stringGUID];
          __int16 v48 = +[NSNumber numberWithInteger:180];
          id v49 = IDSGetUUIDData();
          __int16 v50 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
          uint64_t v61 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v48, IDSSendMessageOptionCommandKey, v49, IDSSendMessageOptionUUIDKey, v50, IDSSendMessageOptionTimeoutKey, &__kCFBooleanTrue, IDSSendMessageOptionWantsDeliveryStatusKey, v28, IDSSendMessageOptionDeliveryStatusContextKey, 0);

          v79[0] = @"gR";
          int v51 = [v14 objectForKey:@"GlobalReadReceiptChangedValue"];
          v79[1] = @"gV";
          v80[0] = v51;
          id v52 = [v14 objectForKey:@"GlobalReadReceiptVersionIDKey"];
          v80[1] = v52;
          __int16 v53 = +[NSDictionary dictionaryWithObjects:v80 forKeys:v79 count:2];

          v77[0] = @"gC";
          id v54 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v67 unsignedIntValue]);
          v77[1] = @"pID";
          v78[0] = v54;
          v78[1] = v53;
          id v55 = +[NSDictionary dictionaryWithObjects:v78 forKeys:v77 count:2];

          if (IMOSLoggingEnabled())
          {
            id v56 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v87 = v55;
              _os_log_impl(&dword_0, v56, OS_LOG_TYPE_INFO, "Sending generic notification to update global read receipt value with messageDictionary: %@", buf, 0xCu);
            }
          }
          BOOL v57 = [(MessageServiceSession *)self deliveryController];
          id v58 = +[NSSet setWithObject:v69];
          [v57 sendMessageDictionary:v55 encryptDictionary:1 fromID:v69 fromAccount:v64 toURIs:v58 toGroup:0 priority:300 options:v61 willSendBlock:0 completionBlock:&stru_DE038];

          goto LABEL_66;
        }
        if (v21 == 60000)
        {
          if (IMOSLoggingEnabled())
          {
            id v22 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Sending a generic notification to update chat properties", buf, 2u);
            }
          }
          theDict = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
          id v23 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v67 unsignedIntValue]);
          if (v23)
          {
            CFDictionarySetValue(theDict, @"c", v23);
          }
          else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
          {
            sub_95BA8();
          }

          __int16 v60 = +[NSString stringGUID];
          id v30 = +[NSNumber numberWithInteger:180];
          id v31 = IDSGetUUIDData();
          id v32 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
          id v59 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v30, IDSSendMessageOptionCommandKey, v31, IDSSendMessageOptionUUIDKey, v32, IDSSendMessageOptionTimeoutKey, &__kCFBooleanTrue, IDSSendMessageOptionWantsDeliveryStatusKey, theDict, IDSSendMessageOptionDeliveryStatusContextKey, 0);

          v84[0] = IMChatPropertyReadReceiptsSettingVersionKey;
          v84[1] = IMChatPropertyEnableReadReceiptForChatKey;
          v85[0] = @"vR";
          v85[1] = @"eR";
          id v33 = +[NSDictionary dictionaryWithObjects:v85 forKeys:v84 count:2];
          id v34 = +[NSMutableDictionary dictionary];
          long long v72 = 0u;
          long long v73 = 0u;
          long long v70 = 0u;
          long long v71 = 0u;
          id v35 = [v33 allKeys];
          id v36 = [v35 countByEnumeratingWithState:&v70 objects:v83 count:16];
          if (v36)
          {
            uint64_t v37 = *(void *)v71;
            do
            {
              for (i = 0; i != v36; i = (char *)i + 1)
              {
                if (*(void *)v71 != v37) {
                  objc_enumerationMutation(v35);
                }
                uint64_t v39 = *(void *)(*((void *)&v70 + 1) + 8 * i);
                id v40 = [v33 objectForKey:v39];
                id v41 = [v14 objectForKey:v39];
                if (v41) {
                  BOOL v42 = v40 == 0;
                }
                else {
                  BOOL v42 = 1;
                }
                if (!v42) {
                  [v34 setObject:v41 forKey:v40];
                }
              }
              id v36 = [v35 countByEnumeratingWithState:&v70 objects:v83 count:16];
            }
            while (v36);
          }

          v81[0] = @"gC";
          unsigned __int8 v43 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v67 unsignedIntValue]);
          v82[0] = v43;
          v82[1] = v34;
          v81[1] = @"pID";
          v81[2] = @"cID";
          v82[2] = v65;
          __int16 v44 = +[NSDictionary dictionaryWithObjects:v82 forKeys:v81 count:3];

          if (IMOSLoggingEnabled())
          {
            id v45 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v87 = v44;
              _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "Sending generic notification to update chat properties with messageDictionary: %@", buf, 0xCu);
            }
          }
          __int16 v46 = [(MessageServiceSession *)self deliveryController];
          id v47 = +[NSSet setWithObject:v69];
          [v46 sendMessageDictionary:v44 encryptDictionary:1 fromID:v69 fromAccount:v64 toURIs:v47 toGroup:0 priority:300 options:v59 willSendBlock:0 completionBlock:&stru_DE018];

          goto LABEL_66;
        }
        if (IMOSLoggingEnabled())
        {
          id v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            id v87 = v67;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Not sending message type: %@   => not supported", buf, 0xCu);
          }
LABEL_24:
        }
      }
      else if (IMOSLoggingEnabled())
      {
        id v24 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, " ** Not sending command, device is not registered", buf, 2u);
        }
        goto LABEL_24;
      }
LABEL_66:
      CFStringRef v20 = v64;

      goto LABEL_67;
    }
  }
  else
  {
    id v68 = 0;
    id v69 = 0;
    id v18 = 0;
  }
  uint64_t v19 = [(MessageServiceSession *)self callerURIUsingCalleeURI:v68];

  CFStringRef v20 = [(MessageServiceSession *)self idsAccount];

  if (v19)
  {
    id v18 = v20;
    id v69 = (void *)v19;
    goto LABEL_12;
  }
  if (IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, " ** Not sending command, no caller URI", buf, 2u);
    }
  }
LABEL_67:
}

- (id)getMessagePushHandlers
{
  return self->_messagePushHandlers;
}

- (void)setMessagePushHandlers:(id)a3
{
}

- (void)_updateNetworkOverride
{
  BOOL v3 = +[IDSServerBag sharedInstanceForBagType:1];
  id v4 = [v3 objectForKey:@"md-network-override"];
  unsigned int v5 = [v4 intValue];

  if (v5)
  {
    if (self->_networkOverride) {
      return;
    }
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Enabling network override", buf, 2u);
      }
    }
    self->_networkOverride = 1;
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id v7 = [(MessageServiceSession *)self accounts];
    id v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v20;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v20 != v9) {
            objc_enumerationMutation(v7);
          }
          [(MessageServiceSession *)self logoutServiceSessionWithAccount:*(void *)(*((void *)&v19 + 1) + 8 * i)];
        }
        id v8 = [v7 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v8);
    }
  }
  else
  {
    if (!self->_networkOverride) {
      return;
    }
    if (IMOSLoggingEnabled())
    {
      CFStringRef v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Disabling network override", buf, 2u);
      }
    }
    self->_networkOverride = 0;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = [(MessageServiceSession *)self accounts];
    id v12 = [v7 countByEnumeratingWithState:&v15 objects:v24 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v16;
      do
      {
        for (j = 0; j != v12; j = (char *)j + 1)
        {
          if (*(void *)v16 != v13) {
            objc_enumerationMutation(v7);
          }
          [(MessageServiceSession *)self loginServiceSessionWithAccount:*(void *)(*((void *)&v15 + 1) + 8 * (void)j)];
        }
        id v12 = [v7 countByEnumeratingWithState:&v15 objects:v24 count:16];
      }
      while (v12);
    }
  }
}

- (void)_iMessageBagLoaded:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    unsigned int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Bag finished loading", v6, 2u);
    }
  }
  [(MessageServiceSession *)self _updateNetworkOverride];
}

- (BOOL)networkConditionsAllowLogin
{
  if (IMSMSFallbackEnabled())
  {
    if (self->_networkOverride)
    {
      int v3 = IMOSLoggingEnabled();
      if (v3)
      {
        id v4 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Network override is in place, forcing network down", buf, 2u);
        }

        LOBYTE(v3) = 0;
      }
    }
    else
    {
      v6.receiver = self;
      v6.super_class = (Class)MessageServiceSession;
      LOBYTE(v3) = [(MessageServiceSession *)&v6 networkConditionsAllowLogin];
    }
  }
  else
  {
    LOBYTE(v3) = 1;
  }
  return v3;
}

- (BOOL)overrideNetworkAvailability
{
  return IMSMSFallbackEnabled() ^ 1;
}

- (void)requestProperty:(id)a3 ofPerson:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412546;
      id v13 = v6;
      __int16 v14 = 2112;
      id v15 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Requesting property: %@   for person: %@", (uint8_t *)&v12, 0x16u);
    }
  }
  [(MessageServiceSession *)self _logLocalInfo];
  if ([v6 length])
  {
    BOOL v9 = [v7 length] == 0;
    int v10 = IMOSLoggingEnabled();
    if (v9)
    {
      if (v10)
      {
        CFStringRef v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12) = 0;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, " => Empty person ID", (uint8_t *)&v12, 2u);
        }
        goto LABEL_18;
      }
    }
    else if (v10)
    {
      CFStringRef v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412546;
        id v13 = v6;
        __int16 v14 = 2112;
        id v15 = v7;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "** Unknown property type query: %@ for person ID: %@", (uint8_t *)&v12, 0x16u);
      }
LABEL_18:
    }
  }
  else if (IMOSLoggingEnabled())
  {
    CFStringRef v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v12) = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, " => Empty property name", (uint8_t *)&v12, 2u);
    }
    goto LABEL_18;
  }
}

- (BOOL)didReceiveMessages:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 fromIDSID:(id)a7
{
  uint64_t v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  v19.receiver = self;
  v19.super_class = (Class)MessageServiceSession;
  BOOL v16 = [(MessageServiceSession *)&v19 didReceiveMessages:v12 forChat:v13 style:v9 account:v14 fromIDSID:v15];
  if (v9 == 45)
  {
    if (IMOSLoggingEnabled())
    {
      long long v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v21 = v13;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Clearing downgrade markers for chat due to incoming message: %@", buf, 0xCu);
      }
    }
    [(MessageServiceSession *)self _clearDowngradeMarkersForChat:v13];
  }

  return v16;
}

- (void)_resetFailureRetries
{
  if (IMOSLoggingEnabled())
  {
    int v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      failureMap = self->_failureMap;
      int v6 = 138412290;
      id v7 = failureMap;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Resetting failure map: %@", (uint8_t *)&v6, 0xCu);
    }
  }
  unsigned int v5 = self->_failureMap;
  self->_failureMap = 0;
}

- (unint64_t)_failuresForID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = [(NSMutableDictionary *)self->_failureMap objectForKey:v4];
        int v10 = 138412546;
        id v11 = v4;
        __int16 v12 = 2048;
        id v13 = [v6 unsignedIntegerValue];
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Failures For ID %@ are %lu", (uint8_t *)&v10, 0x16u);
      }
    }
    id v7 = [(NSMutableDictionary *)self->_failureMap objectForKey:v4];
    id v8 = [v7 unsignedIntegerValue];
  }
  else
  {
    id v8 = 0;
  }

  return (unint64_t)v8;
}

- (void)_incrementDecryptionFailureForID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    failureMap = self->_failureMap;
    if (!failureMap)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      id v7 = self->_failureMap;
      self->_failureMap = Mutable;

      failureMap = self->_failureMap;
    }
    id v8 = [(NSMutableDictionary *)failureMap objectForKey:v4];
    uint64_t v9 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", (int)([v8 intValue] + 1));

    if (IMOSLoggingEnabled())
    {
      int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412546;
        id v12 = v4;
        __int16 v13 = 1024;
        unsigned int v14 = [v9 intValue];
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Incrementing failure for ID: %@ to %d", (uint8_t *)&v11, 0x12u);
      }
    }
    [(NSMutableDictionary *)self->_failureMap setObject:v9 forKey:v4];
    [(MessageServiceSession *)self _setWeeklyFailureResetTimer];
  }
}

- (unint64_t)_maxFailuresAllowed
{
  id v2 = +[IDSServerBag sharedInstanceForBagType:1];
  int v3 = [v2 objectForKey:@"md-decryption-failure-retries-per-week"];

  if (v3)
  {
    LODWORD(v4) = [v3 intValue];
    if (IMOSLoggingEnabled())
    {
      unsigned int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v11 = 67109120;
        int v12 = v4;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Server Bag provided us with: %d retries", (uint8_t *)&v11, 8u);
      }
    }
    int v6 = IMOSLoggingEnabled();
    if ((v4 & 0x80000000) != 0)
    {
      if (v6)
      {
        uint64_t v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          int v11 = 67109120;
          int v12 = v4;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Server Bag provided negative value: %d, returning 0", (uint8_t *)&v11, 8u);
        }
      }
      unint64_t v4 = 0;
    }
    else
    {
      if (v6)
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v11 = 67109120;
          int v12 = v4;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, " => returning retries: %d", (uint8_t *)&v11, 8u);
        }
      }
      unint64_t v4 = v4;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v11 = 67109120;
        int v12 = 10;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Server Bag has no value for retries, using the default: %d retries", (uint8_t *)&v11, 8u);
      }
    }
    unint64_t v4 = 10;
  }

  return v4;
}

- (void)_setWeeklyFailureResetTimer
{
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_2C980;
  block[3] = &unk_DDD40;
  void block[4] = self;
  dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
}

- (void)addItemToRecentsIfApplicable:(id)a3
{
  id v3 = a3;
  unint64_t v4 = [v3 balloonBundleID];
  unsigned int v5 = [v4 isEqualToString:IMBalloonPluginIdentifierHandwriting];

  if (v5)
  {
    int v6 = [v3 payloadData];
    id v7 = IMSharedHelperMD5OfData();
    id v8 = +[IMRecentItemsList sharedInstance];
    uint64_t v9 = [v3 balloonBundleID];
    [v8 addRecentItemWithData:v6 GUID:v7 infoDictionary:0 forDomain:v9];
  }
  else
  {
    int v10 = [v3 fileTransferGUIDs];
    id v11 = [v10 count];

    if (v11)
    {
      long long v23 = 0u;
      long long v24 = 0u;
      long long v21 = 0u;
      long long v22 = 0u;
      int v12 = [v3 fileTransferGUIDs];
      id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
      if (v13)
      {
        uint64_t v14 = *(void *)v22;
        while (2)
        {
          id v15 = 0;
          do
          {
            if (*(void *)v22 != v14) {
              objc_enumerationMutation(v12);
            }
            uint64_t v16 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v15);
            long long v17 = +[IMDFileTransferCenter sharedInstance];
            long long v18 = [v17 transferForGUID:v16];
            LOBYTE(v16) = [v18 isSticker];

            if (v16)
            {

              if (IMOSLoggingEnabled())
              {
                objc_super v19 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)long long v20 = 0;
                  _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Posting IMRecentItemsListUpdatedNotification for sticker", v20, 2u);
                }
              }
              notify_post((const char *)[kIMRecentItemsListUpdatedNotification UTF8String]);
              goto LABEL_18;
            }
            id v15 = (char *)v15 + 1;
          }
          while (v13 != v15);
          id v13 = [v12 countByEnumeratingWithState:&v21 objects:v25 count:16];
          if (v13) {
            continue;
          }
          break;
        }
      }
    }
  }
LABEL_18:
}

- (BOOL)_transferIsValidForServiceSession:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 accountID];
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  int v6 = [(MessageServiceSession *)self accounts];
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
  if (v7)
  {
    id v8 = v7;
    uint64_t v9 = *(void *)v21;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v21 != v9) {
        objc_enumerationMutation(v6);
      }
      id v11 = *(void **)(*((void *)&v20 + 1) + 8 * v10);
      int v12 = [v4 accountID];
      id v13 = [v11 accountID];
      unsigned __int8 v14 = [v12 isEqualToString:v13];

      if (v14) {
        goto LABEL_12;
      }
      if (v8 == (id)++v10)
      {
        id v8 = [v6 countByEnumeratingWithState:&v20 objects:v24 count:16];
        if (v8) {
          goto LABEL_3;
        }
        break;
      }
    }
  }

  if (!v5)
  {
    uint64_t v16 = +[IMDAccountController sharedInstance];
    long long v17 = [(MessageServiceSession *)self service];
    int v6 = [v16 activeAccountsForService:v17];

    if ([v6 count] != (char *)&dword_0 + 1)
    {
      if ((unint64_t)[v6 count] < 2)
      {
        char v15 = 0;
      }
      else
      {
        objc_super v19 = [v6 objectAtIndex:0];
        char v15 = v19 == self;
      }
      goto LABEL_13;
    }
LABEL_12:
    char v15 = 1;
LABEL_13:

    goto LABEL_14;
  }
  char v15 = 0;
LABEL_14:

  return v15;
}

- (BOOL)canMakeExpireStateChecks
{
  return 1;
}

- (id)callerURI
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "CallerID callerURI is DEPRECATED: Use callerURIForMessageServiceType: instead.", v6, 2u);
    }
  }
  id v4 = [(MessageServiceSession *)self callerURIForMessageServiceType:0];

  return v4;
}

- (id)callerURIUsingCalleeURI:(id)a3
{
  uint64_t v4 = [(MessageServiceSession *)self messageServiceTypeForURI:a3];

  return [(MessageServiceSession *)self callerURIForMessageServiceType:v4];
}

- (id)callerURIForMessageServiceType:(unsigned int)a3
{
  id v40 = IMPreferredAccountMap();
  uint64_t v4 = [v40 objectForKey:IMServiceNameiMessage];
  BOOL v42 = [v4 objectForKey:@"guid"];

  id v41 = [(id)objc_opt_class() idsAccounts];
  if (v42)
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id v5 = v41;
    id v6 = [v5 countByEnumeratingWithState:&v52 objects:v64 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v53;
LABEL_4:
      uint64_t v8 = 0;
      while (1)
      {
        if (*(void *)v53 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v52 + 1) + 8 * v8);
        uint64_t v10 = [v9 uniqueID];
        unsigned int v11 = [v10 isEqualToString:v42];

        if (v11) {
          break;
        }
        if (v6 == (id)++v8)
        {
          id v6 = [v5 countByEnumeratingWithState:&v52 objects:v64 count:16];
          if (v6) {
            goto LABEL_4;
          }
          goto LABEL_10;
        }
      }
      if (IMOSLoggingEnabled())
      {
        int v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          BOOL v57 = v9;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, " Found preferred account for caller id: %@", buf, 0xCu);
        }
      }
      id v13 = v9;

      if (a3 == 1 && v13)
      {
        id v14 = v13;
        id v13 = [(MessageServiceSession *)self bizIDSAccountFromMadridIDSAccount:v14];
      }
      if (v13) {
        goto LABEL_52;
      }
    }
    else
    {
LABEL_10:
    }
  }
  else if (IMOSLoggingEnabled())
  {
    char v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      BOOL v57 = v40;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "No account id found in prefs: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      long long v17 = [(MessageServiceSession *)self accounts];
      *(_DWORD *)buf = 138412546;
      BOOL v57 = v42;
      __int16 v58 = 2112;
      id v59 = v17;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "No ids account found with that account id: %@, accounts: %@", buf, 0x16u);
    }
  }
  id v18 = objc_alloc_init((Class)NSMutableArray);
  long long v50 = 0u;
  long long v51 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  id v19 = v41;
  id v20 = [v19 countByEnumeratingWithState:&v48 objects:v63 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v49;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v49 != v21) {
          objc_enumerationMutation(v19);
        }
        long long v23 = *(void **)(*((void *)&v48 + 1) + 8 * i);
        if (![v23 accountType])
        {
          long long v24 = [(MessageServiceSession *)self callerURIForIDSAccount:v23];
          BOOL v25 = v24 == 0;

          if (!v25)
          {
            if (IMOSLoggingEnabled())
            {
              id v26 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Found phone number account", buf, 2u);
              }
            }
            [v18 addObject:v23];
          }
        }
      }
      id v20 = [v19 countByEnumeratingWithState:&v48 objects:v63 count:16];
    }
    while (v20);
  }

  v47[0] = _NSConcreteStackBlock;
  v47[1] = 3221225472;
  v47[2] = sub_2D928;
  v47[3] = &unk_DE060;
  void v47[4] = self;
  [v18 sortUsingComparator:v47];
  id v13 = [v18 firstObject];
  if (v13)
  {
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "No phone number account found, falling back to whatever we have", buf, 2u);
      }
    }
    if (a3) {
      [(MessageServiceSession *)self fallBackBizIDSAccount];
    }
    else {
    id v13 = [v19 anyObject];
    }

    if (!v13)
    {
      if (IMOSLoggingEnabled())
      {
        id v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "- no caller id at all", buf, 2u);
        }
      }
      id v28 = 0;
      goto LABEL_69;
    }
  }
LABEL_52:
  id v28 = [(MessageServiceSession *)self callerURIForIDSAccount:v13];
  if ([v28 isEqualToIgnoringCase:kIDSServiceDefaultsSentinelAlias])
  {
    long long v45 = 0u;
    long long v46 = 0u;
    long long v43 = 0u;
    long long v44 = 0u;
    id v29 = v41;
    id v30 = [v29 countByEnumeratingWithState:&v43 objects:v62 count:16];
    if (v30)
    {
      uint64_t v31 = *(void *)v44;
      while (2)
      {
        for (j = 0; j != v30; j = (char *)j + 1)
        {
          if (*(void *)v44 != v31) {
            objc_enumerationMutation(v29);
          }
          id v33 = *(void **)(*((void *)&v43 + 1) + 8 * (void)j);
          if (![v33 accountType])
          {
            uint64_t v34 = [(MessageServiceSession *)self callerURIForIDSAccount:v33];

            id v28 = (void *)v34;
            goto LABEL_63;
          }
        }
        id v30 = [v29 countByEnumeratingWithState:&v43 objects:v62 count:16];
        if (v30) {
          continue;
        }
        break;
      }
    }
LABEL_63:
  }
  if (IMOSLoggingEnabled())
  {
    id v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      id v36 = [v13 registeredURIs];
      *(_DWORD *)buf = 138412802;
      BOOL v57 = v28;
      __int16 v58 = 2112;
      id v59 = v13;
      __int16 v60 = 2112;
      uint64_t v61 = v36;
      _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "found caller id (%@) from ids account %@, registered URIs %@", buf, 0x20u);
    }
  }

LABEL_69:

  return v28;
}

- (unsigned)messageServiceTypeForURI:(id)a3
{
  id v3 = a3;
  if ([v3 length])
  {
    unsigned int IsBusinessID = IMStringIsBusinessID();
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "CallerID -messageServiceTypeForURI: - Did not find serviceType. Using MessageServiceTypeiMessage.", v7, 2u);
      }
    }
    unsigned int IsBusinessID = 0;
  }

  return IsBusinessID;
}

- (void)replayMessage:(id)a3
{
  id v35 = a3;
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = v35;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Replaying message %@", buf, 0xCu);
    }
  }
  if (!v35 && IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v46 = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "MessageServiceSession replay message was nil %@", buf, 0xCu);
    }
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v33 = v35;
    id v5 = [v33 loginID];
    id v6 = [v33 accountUniqueID];
    long long v42 = 0u;
    long long v43 = 0u;
    long long v40 = 0u;
    long long v41 = 0u;
    uint64_t v32 = 96;
    uint64_t v7 = self->_messagePushHandlers;
    id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v40 objects:v49 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v41;
LABEL_13:
      uint64_t v10 = 0;
      while (1)
      {
        if (*(void *)v41 != v9) {
          objc_enumerationMutation(v7);
        }
        unsigned int v11 = *(void **)(*((void *)&v40 + 1) + 8 * v10);
        int v12 = objc_msgSend(v11, "account", v32);
        id v13 = [v12 uniqueID];
        unsigned int v14 = [v13 isEqualToIgnoringCase:v6];

        if (v14) {
          break;
        }
        if (v8 == (id)++v10)
        {
          id v8 = [(NSMutableArray *)v7 countByEnumeratingWithState:&v40 objects:v49 count:16];
          if (v8) {
            goto LABEL_13;
          }
          goto LABEL_19;
        }
      }
      if (IMOSLoggingEnabled())
      {
        char v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          uint64_t v16 = [v11 account];
          long long v17 = [v16 loginID];
          *(_DWORD *)buf = 138412546;
          id v46 = v17;
          __int16 v47 = 2112;
          long long v48 = v5;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Got push handler account %@ %@", buf, 0x16u);
        }
      }
      id v18 = v11;

      if (v18) {
        goto LABEL_47;
      }
    }
    else
    {
LABEL_19:
    }
    if (IMOSLoggingEnabled())
    {
      id v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "MessageReplay: Could not find account using unique ID. Falling back to login ID", buf, 2u);
      }
    }
    long long v38 = 0u;
    long long v39 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v20 = *(id *)&self->IMDAppleServiceSession_opaque[v32];
    id v21 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
    if (v21)
    {
      uint64_t v22 = *(void *)v37;
LABEL_31:
      uint64_t v23 = 0;
      while (1)
      {
        if (*(void *)v37 != v22) {
          objc_enumerationMutation(v20);
        }
        long long v24 = *(void **)(*((void *)&v36 + 1) + 8 * v23);
        BOOL v25 = objc_msgSend(v24, "account", v32);
        id v26 = [v25 loginID];
        unsigned int v27 = [v26 isEqualToIgnoringCase:v5];

        if (v27) {
          break;
        }
        if (v21 == (id)++v23)
        {
          id v21 = [v20 countByEnumeratingWithState:&v36 objects:v44 count:16];
          if (v21) {
            goto LABEL_31;
          }
          goto LABEL_37;
        }
      }
      if (IMOSLoggingEnabled())
      {
        id v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          id v29 = [v24 account];
          id v30 = [v29 loginID];
          *(_DWORD *)buf = 138412546;
          id v46 = v30;
          __int16 v47 = 2112;
          long long v48 = v5;
          _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Got push handler account %@ %@", buf, 0x16u);
        }
      }
      id v18 = v24;

      if (v18) {
        goto LABEL_47;
      }
    }
    else
    {
LABEL_37:
    }
    objc_msgSend(*(id *)&self->IMDAppleServiceSession_opaque[v32], "firstObject", v32);
    id v18 = (id)objc_claimAutoreleasedReturnValue();
    if (IMOSLoggingEnabled())
    {
      uint64_t v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v46 = v18;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "MessageReplay: Could not fine account using loginID. Picking a random push handler %@", buf, 0xCu);
      }
    }
LABEL_47:
    [v18 replayMessage:v33];
  }
}

- (void)enqueReplayMessageCallback:(id)a3
{
  id v4 = a3;
  id v5 = v4;
  if (v4)
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_2E0F8;
    v6[3] = &unk_DE088;
    id v7 = v4;
    [(MessageServiceSession *)self _enqueueBlock:v6 withTimeout:@"Callback block for message replay batch" description:10.0];
  }
}

- (void)handler:(id)a3 payloadDataRequest:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Got payload Data request %@", (uint8_t *)&v10, 0xCu);
    }
  }
  uint64_t v9 = [(MessageServiceSession *)self attachmentController];
  [v9 handlePayloadDataRequest:v7 attempts:0];
}

- (void)handler:(id)a3 payloadDataResponse:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      uint64_t v9 = [v7 objectForKey:@"guid"];
      int v11 = 138412290;
      int v12 = v9;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Got payload Data response for message %@", (uint8_t *)&v11, 0xCu);
    }
  }
  int v10 = [(MessageServiceSession *)self attachmentController];
  [v10 handlePayloadDataResponse:v7];
}

- (void)sendLogDumpMessageAtFilePath:(id)a3 toRecipient:(id)a4 shouldDeleteFile:(BOOL)a5 withCompletion:(id)a6
{
  BOOL v7 = a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      CFStringRef v14 = @"NO";
      *(_DWORD *)buf = 138412802;
      id v28 = v10;
      __int16 v29 = 2112;
      if (v7) {
        CFStringRef v14 = @"YES";
      }
      id v30 = v11;
      __int16 v31 = 2112;
      CFStringRef v32 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "sendLogDumpMessageAtFilePath: %@ to recipient %@ shouldDeleteFile %@", buf, 0x20u);
    }
  }
  id v26 = 0;
  char v15 = _LastAddressedURIForChatLogMetricIfNeeded(0, 0, self, &v26, 0);
  id v16 = v26;
  long long v17 = [v15 _stripFZIDPrefix];

  if (v16 && v17)
  {
    id v18 = [(MessageServiceSession *)self deliveryController];
    [v18 sendLogDumpMessageAtFilePath:v10 fromAccount:v16 fromID:v17 toRecipient:v11 shouldDeleteFile:v7 withCompletion:v12];
LABEL_10:

    goto LABEL_22;
  }
  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "sendLogDumpMessageAtFilePath: Could not find an ids account or fromID, returning early", buf, 2u);
    }
  }
  if (v7)
  {
    id v20 = +[NSFileManager defaultManager];
    unsigned int v21 = [v20 fileExistsAtPath:v10];

    if (v21)
    {
      uint64_t v22 = +[NSFileManager defaultManager];
      id v25 = 0;
      unsigned __int8 v23 = [v22 removeItemAtPath:v10 error:&v25];
      id v18 = v25;

      if ((v23 & 1) == 0 && IMOSLoggingEnabled())
      {
        long long v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          id v28 = v10;
          __int16 v29 = 2112;
          id v30 = v18;
          _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Deleting file at path %@ failed with error %@", buf, 0x16u);
        }
      }
      goto LABEL_10;
    }
  }
LABEL_22:
}

- (void)preWarm
{
  id v4 = +[IMTransferServicesController sharedInstance];
  id v3 = [(MessageServiceSession *)self GUID];
  [v4 preWarmMMCSForOwnerID:v3];
}

- (void)processNetworkDataAvailabilityChange:(BOOL)a3
{
  BOOL v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      CFStringRef v5 = @"NO";
      if (v3) {
        CFStringRef v5 = @"YES";
      }
      int v7 = 138412290;
      CFStringRef v8 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "networkDataAvailable, %@", (uint8_t *)&v7, 0xCu);
    }
  }
  id v6 = +[IMDAccountController sharedAccountController];
  [v6 setNetworkDataAvailable:v3];
}

- (void)renewTTLForScheduledAttachmentTransfer:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CFStringRef v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = [v4 guid];
      *(_DWORD *)buf = 138412290;
      CFStringRef v14 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Scheduled Message | Renewing TTL for scheduled message attachment %@", buf, 0xCu);
    }
  }
  int v7 = [v4 userInfo];
  CFStringRef v8 = objc_alloc_init(FTiMessageRequestMMCSFileRefreshToken);
  AttachmentRefreshUtilConfigureStickerToken(v8, v7);
  uint64_t v9 = [(MessageServiceSession *)self attachmentRefreshDeliveryController];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_2E9EC;
  v11[3] = &unk_DE0B0;
  id v12 = v4;
  id v10 = v4;
  [v9 sendFTMessage:v8 attempts:0 withCompletionBlock:v11];
}

- (void)didReplaceMessage:(id)a3 newMessage:(id)a4
{
  id v8 = a3;
  id v6 = a4;
  if ([v8 scheduleType] == (char *)&dword_0 + 2
    || [v6 scheduleType] == (char *)&dword_0 + 2)
  {
    int v7 = [(MessageServiceSession *)self scheduledMessageCoordinator];
    [v7 handleMessageDidReplace:v8 newMessage:v6];
  }
}

- (MessageGroupController)groupController
{
  return self->_groupController;
}

- (MessageDeliveryController)deliveryController
{
  return self->_deliveryController;
}

- (MessageAttachmentController)attachmentController
{
  return self->_attachmentController;
}

- (AttachmentRefreshDeliveryController)attachmentRefreshDeliveryController
{
  return self->_attachmentRefreshDeliveryController;
}

- (IMDGroupPhotoRefreshController)groupPhotoRefreshController
{
  return self->_groupPhotoRefreshController;
}

- (IMDScheduledMessageCoordinator)scheduledMessageCoordinator
{
  return self->_scheduledMessageCoordinator;
}

- (void)setMessageStore:(id)a3
{
}

- (void)setCkUtilities:(id)a3
{
}

- (NSMutableDictionary)pendingGroupPhotoDownloads
{
  return self->_pendingGroupPhotoDownloads;
}

- (void)setPendingGroupPhotoDownloads:(id)a3
{
}

- (IMDCallManager)callManager
{
  return self->_callManager;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_callManager, 0);
  objc_storeStrong((id *)&self->_pendingGroupPhotoDownloads, 0);
  objc_storeStrong((id *)&self->_ckUtilities, 0);
  objc_storeStrong((id *)&self->_messageStore, 0);
  objc_storeStrong((id *)&self->_scheduledMessageCoordinator, 0);
  objc_storeStrong((id *)&self->_groupPhotoRefreshController, 0);
  objc_storeStrong((id *)&self->_attachmentRefreshDeliveryController, 0);
  objc_storeStrong((id *)&self->_attachmentController, 0);
  objc_storeStrong((id *)&self->_deliveryController, 0);
  objc_storeStrong((id *)&self->_groupController, 0);
  objc_storeStrong((id *)&self->_pendingSendBlockQueue, 0);
  objc_storeStrong((id *)&self->_failureMap, 0);
  objc_storeStrong((id *)&self->_resetFailureRetriesTimer, 0);

  objc_storeStrong((id *)&self->_messagePushHandlers, 0);
}

- (BOOL)_convergesDisplayNames
{
  if ([(MessageServiceSession *)self isReplicating])
  {
    BOOL v3 = [(MessageServiceSession *)self account];
    id v4 = [v3 service];
    unsigned int v5 = [v4 supportsCapability:IMServiceCapabilityGroupIdentity] ^ 1;
  }
  else
  {
    LOBYTE(v5) = 1;
  }
  return v5;
}

- (void)_blastDoorProcessingWithIMMessageItem:(id)a3 chat:(id)a4 account:(id)a5 fromToken:(id)a6 fromIDSID:(id)a7 fromIdentifier:(id)a8 toIdentifier:(id)a9 participants:(id)a10 groupName:(id)a11 groupID:(id)a12 isFromMe:(BOOL)a13 isLastFromStorage:(BOOL)a14 isFromStorage:(BOOL)a15 hideLockScreenNotification:(BOOL)a16 wantsCheckpointing:(BOOL)a17 needsDeliveryReceipt:(id)a18 messageBalloonPayloadAttachmentDictionary:(id)a19 inlineAttachments:(id)a20 attributionInfoArray:(id)a21 nicknameDictionary:(id)a22 availabilityVerificationRecipientChannelIDPrefix:(id)a23 availabilityVerificationRecipientEncryptionValidationToken:(id)a24 availabilityOffGridRecipientSubscriptionValidationToken:(id)a25 availabilityOffGridRecipientEncryptionValidationToken:(id)a26 idsService:(id)a27 messageContext:(id)a28 isFromTrustedSender:(BOOL)a29 isFromSnapTrustedSender:(BOOL)a30 completionBlock:(id)a31
{
  id v121 = a3;
  id v116 = a4;
  id v114 = a5;
  id v112 = a6;
  id v110 = a7;
  id v119 = a8;
  id v36 = a9;
  id v123 = a10;
  id v108 = a11;
  id v92 = a12;
  id v94 = a18;
  id v37 = a19;
  id v38 = a20;
  id v95 = a21;
  id v98 = a22;
  id v101 = a23;
  id v103 = a24;
  id v100 = a25;
  id v97 = a26;
  id v105 = a27;
  id v106 = a28;
  id v39 = a31;
  if (IMOSLoggingEnabled())
  {
    long long v40 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v121;
      _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "Starting processing post blastdoor for messageItem: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v41 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v116;
      _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "   Chat: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v42 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v114;
      _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "   Account: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v43 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v112;
      _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "   fromToken: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v44 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v110;
      _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "   fromIDSID: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v45 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v119;
      _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "   fromIdentifier: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v46 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v36;
      _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "   toIdentifier: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v47 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v123;
      _os_log_impl(&dword_0, v47, OS_LOG_TYPE_INFO, "   participants: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v48 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v108;
      _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "   groupName: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v49 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      unsigned int v50 = [v121 isTypingMessage];
      CFStringRef v51 = @"NO";
      if (v50) {
        CFStringRef v51 = @"YES";
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v51;
      _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "   isTypingIndicator: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v52 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      CFStringRef v53 = @"NO";
      if (a13) {
        CFStringRef v53 = @"YES";
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v53;
      _os_log_impl(&dword_0, v52, OS_LOG_TYPE_INFO, "   isFromMe: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v54 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
    {
      CFStringRef v55 = @"NO";
      if (a14) {
        CFStringRef v55 = @"YES";
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v55;
      _os_log_impl(&dword_0, v54, OS_LOG_TYPE_INFO, "   isLastFromStorage: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v56 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v56, OS_LOG_TYPE_INFO))
    {
      CFStringRef v57 = @"NO";
      if (a15) {
        CFStringRef v57 = @"YES";
      }
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v57;
      _os_log_impl(&dword_0, v56, OS_LOG_TYPE_INFO, "   isFromStorage: %@", (uint8_t *)&buf, 0xCu);
    }
  }
  __int16 v58 = +[IMMessageNotificationTimeManager sharedInstance];
  [v58 acquireAssertionToUnsuspendProcess];

  uint64_t v59 = +[NSDate date];
  char v60 = sub_2FF18();
  __int16 v90 = [v121 guid];
  v163[0] = _NSConcreteStackBlock;
  v163[1] = 3221225472;
  v163[2] = sub_2FF78;
  v163[3] = &unk_DE0F8;
  id v61 = v36;
  id v164 = v61;
  __int16 v62 = objc_msgSend(v123, "__imArrayByApplyingBlock:", v163);
  uint64_t v63 = [v119 _stripFZIDPrefix];
  __int16 v88 = v38;
  id v89 = v39;
  if ((unint64_t)[v123 count] <= 2 && a13 && objc_msgSend(v62, "count"))
  {
    id v64 = [v62 lastObject];
    uint64_t v65 = [v64 _stripFZIDPrefix];

    id v66 = v62;
    id v67 = (void *)v59;
    uint64_t v63 = (void *)v65;
  }
  else
  {
    id v66 = v62;
    id v67 = (void *)v59;
  }
  *(void *)&long long buf = 0;
  *((void *)&buf + 1) = &buf;
  uint64_t v167 = 0x3032000000;
  v168 = sub_30000;
  v169 = sub_30010;
  id v170 = 0;
  id v82 = v116;
  id v170 = v82;
  v130[0] = _NSConcreteStackBlock;
  v130[1] = 3221225472;
  v130[2] = sub_30018;
  v130[3] = &unk_DE170;
  BOOL v155 = a14;
  v130[4] = self;
  id v96 = v95;
  id v131 = v96;
  id v68 = v121;
  id v132 = v68;
  id v122 = v90;
  id v133 = v122;
  id v86 = v123;
  id v134 = v86;
  p_long long buf = &buf;
  id v85 = v61;
  id v135 = v85;
  BOOL v156 = a13;
  id v91 = v108;
  id v136 = v91;
  id v137 = v63;
  id v83 = v114;
  id v138 = v83;
  id v84 = v112;
  id v139 = v84;
  BOOL v157 = a29;
  id v124 = v119;
  id v140 = v124;
  char v158 = v60;
  id v69 = v137;
  id v118 = v67;
  id v141 = v118;
  id v120 = v66;
  id v142 = v120;
  id v93 = v92;
  id v143 = v93;
  BOOL v159 = a15;
  id v99 = v98;
  id v144 = v99;
  BOOL v160 = a30;
  BOOL v161 = a16;
  id v87 = v110;
  id v145 = v87;
  BOOL v162 = a17;
  id v113 = v97;
  id v146 = v113;
  id v111 = v100;
  id v147 = v111;
  id v102 = v101;
  id v148 = v102;
  id v109 = v103;
  id v149 = v109;
  id v104 = v94;
  id v150 = v104;
  id v115 = v105;
  id v151 = v115;
  id v117 = v106;
  id v152 = v117;
  id v107 = v37;
  id v153 = v107;
  long long v70 = objc_retainBlock(v130);
  long long v71 = im_checkpointIDSService();
  im_sendMessageCheckpointIfNecessary();

  v126[0] = _NSConcreteStackBlock;
  v126[1] = 3221225472;
  v126[2] = sub_33A70;
  v126[3] = &unk_DDAB0;
  long long v72 = v70;
  id v127 = v72;
  id v73 = v89;
  BOOL v129 = a14;
  id v128 = v73;
  v126[4] = self;
  id v74 = objc_retainBlock(v126);
  if (a14) {
    [(MessageServiceSession *)self noteLastItemProcessed];
  }
  if ([v68 isFromMe])
  {
    id v75 = [v68 service];
    +[IMSenderContext fromMeContextWithServiceName:v75];
  }
  else
  {
    unsigned __int8 v76 = +[IMDChatRegistry sharedInstance];
    id v77 = [v76 hasKnownSenderChatWithChatIdentifier:v69];

    id v75 = [v68 service];
    +[IMSenderContext contextWithKnownSender:v77 serviceName:v75];
  __int16 v78 = };

  uint64_t v79 = [(MessageServiceSession *)self attachmentController];
  id v165 = v124;
  id v80 = +[NSArray arrayWithObjects:&v165 count:1];
  id v81 = IMServiceNameForCanonicalIDSAddresses();
  [v79 retrieveAttachmentsForMessage:v68 inlineAttachments:v88 displayID:v69 topic:v81 comingFromStorage:a15 shouldForceAutoDownload:0 senderContext:v78 completionBlock:v74];

  _Block_object_dispose(&buf, 8);
}

- (void)_updateTransfersForAttributionInfoArray:(id)a3 message:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v5 count])
  {
    int v7 = [v6 fileTransferGUIDs];
    id v8 = [v7 count];
    id v9 = [v5 count];

    if (v8 == v9)
    {
      id v10 = [v6 fileTransferGUIDs];
      v15[0] = _NSConcreteStackBlock;
      v15[1] = 3221225472;
      v15[2] = sub_34068;
      v15[3] = &unk_DE198;
      id v16 = v5;
      [v10 enumerateObjectsUsingBlock:v15];
    }
    else if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = [v6 fileTransferGUIDs];
        id v13 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v12 count]);
        CFStringRef v14 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v5 count]);
        *(_DWORD *)long long buf = 138412546;
        id v18 = v13;
        __int16 v19 = 2112;
        id v20 = v14;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "MessageServiceSession: not updating attribution info: number of guids %@ does not match number of attribution infos %@", buf, 0x16u);
      }
    }
  }
}

- (void)_handleNicknameReceived:(id)a3 fromIdentifier:(id)a4 withMessageItem:(id)a5 isSnapTrustedUser:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (IMSharedHelperNickNameEnabled())
  {
    id v28 = self;
    id v13 = [v10 _stringForKey:MessageDictionaryNicknameCloudKitRecordKey];
    CFStringRef v14 = [v10 _dataForKey:MessageDictionaryNicknameCloudKitDecryptionRecordKey];
    uint64_t v15 = [v10 _stringForKey:MessageDictionaryWallpaperUpdateKey];
    id v16 = (void *)v15;
    if (v15) {
      long long v17 = (__CFString *)v15;
    }
    else {
      long long v17 = @"NO";
    }
    id v18 = v17;

    id v26 = v18;
    char v27 = NSBOOLFromString();
    __int16 v19 = [v10 _dataForKey:MessageDictionaryNicknameWallpaperTagKey];
    id v20 = [v10 _dataForKey:MessageDictionaryNicknameLowResWallpaperTagKey];
    unsigned int v21 = [v10 _dataForKey:MessageDictionaryNicknameWallpaperMetadataTagKey];
    if (IMOSLoggingEnabled())
    {
      uint64_t v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        CFStringRef v23 = @"YES";
        if (!v6) {
          CFStringRef v23 = @"NO";
        }
        *(_DWORD *)long long buf = 138412546;
        CFStringRef v32 = v13;
        __int16 v33 = 2112;
        CFStringRef v34 = v23;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "This message came from user with nickname cloudKitRecord  %@, SNaP trusted user: %@", buf, 0x16u);
      }
    }
    long long v24 = +[IMDNicknameController sharedInstance];
    v29[0] = _NSConcreteStackBlock;
    v29[1] = 3221225472;
    v29[2] = sub_34454;
    void v29[3] = &unk_DE1C0;
    void v29[4] = v28;
    id v30 = v12;
    BYTE1(v25) = !v6;
    LOBYTE(v25) = v27;
    objc_msgSend(v24, "NicknameWithRecordID:URI:decryptionKey:wallpaperDataTag:wallpaperLowResDataTag:wallpaperMetadataTag:hasWallpaperUpdate:dropNicknameForUnknownContacts:withCompletionBlock:", v13, v11, v14, v19, v20, v21, v25, v29);
  }
}

- (void)_nicknameFetchCompletedMessage:(id)a3 synchronous:(BOOL)a4 profile:(id)a5 nickNameWasInCache:(BOOL)a6 nickNameDownloadError:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a5;
  id v13 = a7;
  int v14 = IMOSLoggingEnabled();
  if (!v12 || v13)
  {
    if (v14)
    {
      CFStringRef v23 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long v24 = 134218242;
        *(void *)&void v24[4] = v12;
        *(_WORD *)&v24[12] = 2112;
        *(void *)&v24[14] = v13;
        _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Ignoring nickname update (profile: %p) (error: %@)", v24, 0x16u);
      }
    }
  }
  else
  {
    if (v14)
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        CFStringRef v16 = @"NO";
        *(_DWORD *)long long v24 = 138412802;
        *(void *)&void v24[4] = v12;
        *(_WORD *)&v24[12] = 2112;
        if (v8) {
          CFStringRef v16 = @"YES";
        }
        *(void *)&v24[14] = 0;
        __int16 v25 = 2112;
        CFStringRef v26 = v16;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Got NickName Object  %@ error %@ wasInCache %@", v24, 0x20u);
      }
    }
    if (!v8)
    {
      long long v17 = [v12 displayName];
      if ([v17 length])
      {
        int v18 = IMSharedHelperNickNameEnabled();

        if (v18)
        {
          if (IMOSLoggingEnabled())
          {
            __int16 v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              id v20 = [v12 displayName];
              *(_DWORD *)long long v24 = 138412290;
              *(void *)&void v24[4] = v20;
              _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Profile display name %@", v24, 0xCu);
            }
          }
          unsigned int v21 = [(MessageServiceSession *)self broadcaster];
          uint64_t v22 = [v12 dataRepresentation];
          [v21 updateNicknameData:v22];
        }
      }
      else
      {
      }
    }
  }
}

- (void)_autoReportChatAsUnknown:(id)a3 chatIsNew:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  int v7 = v6;
  if (v6 && v4 && [v6 isBlackholed])
  {
    id v8 = objc_alloc_init((Class)NSMutableArray);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    long long v24 = 0u;
    id v9 = objc_msgSend(v7, "participants", 0);
    id v10 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v22;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v22 != v12) {
            objc_enumerationMutation(v9);
          }
          int v14 = [*(id *)(*((void *)&v21 + 1) + 8 * (void)v13) ID];
          [v8 addObject:v14];

          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v21 objects:v26 count:16];
      }
      while (v11);
    }

    uint64_t v15 = [(MessageServiceSession *)self chatRegistry];
    id v16 = [v7 style];
    long long v17 = [v7 service];
    int v18 = [v17 internalName];
    __int16 v25 = v18;
    __int16 v19 = +[NSArray arrayWithObjects:&v25 count:1];
    id v20 = [v7 guid];
    [v15 markAsSpamForIDs:v8 style:v16 onServices:v19 chatID:v20 queryID:0 autoReport:1];
  }
}

- (BOOL)_sendCertifiedDeliveryReceiptIfPossible:(id)a3 messageContext:(id)a4 guid:(id)a5 messageWasStored:(BOOL)a6 needsDeliveryReceipt:(BOOL)a7 failureReason:(id)a8
{
  if (a6) {
    return _im_sendCertifiedDeliveryReceiptIfPossible(a3, a4, a5, a7, a8, 0);
  }
  else {
    return 0;
  }
}

- (BOOL)reflectMarkUnreadToPeerDevicesForMessageGUID:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      *(void *)__int16 v31 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Begin reflecting mark unread for message (%@)", buf, 0xCu);
    }
  }
  id v6 = [(MessageServiceSession *)self idsAccount];
  if (v6 && [(MessageServiceSession *)self _isDeviceRegisteredForAccount:v6])
  {
    __int16 v25 = [(MessageServiceSession *)self callerURIForIDSAccount:v6];
    if (IMOSLoggingEnabled())
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)__int16 v31 = v4;
        *(_WORD *)&v31[8] = 2112;
        CFStringRef v32 = v25;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "  Reflect mark as unread for guid: %@ to peer devices using callerID: %@", buf, 0x16u);
      }
    }
    CFStringRef v28 = @"uG";
    id v29 = v4;
    long long v23 = +[NSDictionary dictionaryWithObjects:&v29 forKeys:&v28 count:1];
    long long v24 = JWEncodeDictionary();
    id v8 = [v24 _FTCopyGzippedData];
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        unsigned int v10 = [v24 length];
        unsigned int v11 = [v8 length];
        *(_DWORD *)long long buf = 67109376;
        *(_DWORD *)__int16 v31 = v10;
        *(_WORD *)&void v31[4] = 1024;
        *(_DWORD *)&v31[6] = v11;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "  Compressed message data from: %u to: %u in sendMessageDictionary", buf, 0xEu);
      }
    }
    v27[0] = v8;
    v26[0] = IDSSendMessageOptionDataToEncryptKey;
    v26[1] = IDSSendMessageOptionUUIDKey;
    uint64_t v12 = IDSGetUUIDData();
    v27[1] = v12;
    v26[2] = IDSSendMessageOptionTopLevelDictionaryKey;
    v26[3] = IDSSendMessageOptionSkipPayloadCheckKey;
    v27[2] = &__kCFBooleanTrue;
    v27[3] = &__kCFBooleanTrue;
    v27[4] = &off_E3720;
    v26[4] = IDSSendMessageOptionCommandKey;
    v26[5] = IDSSendMessageOptionTimeoutKey;
    id v13 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    v27[5] = v13;
    v27[6] = &__kCFBooleanTrue;
    v26[6] = IDSSendMessageOptionWantsDeliveryStatusKey;
    v26[7] = IDSSendMessageOptionRequireAllRegistrationPropertiesKey;
    int v14 = +[NSSet setWithObject:IDSRegistrationPropertySupportsRetractAndEditMessages];
    v27[7] = v14;
    v26[8] = IDSSendMessageOptionAlwaysSkipSelfKey;
    v27[8] = &__kCFBooleanTrue;
    uint64_t v15 = +[NSDictionary dictionaryWithObjects:v27 forKeys:v26 count:9];

    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)__int16 v31 = v23;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "  Sending FTCommandIDMarkAsUnreadMessage (c=111) with messageDictionary:%@", buf, 0xCu);
      }
    }
    long long v17 = [(MessageServiceSession *)self deliveryController];
    int v18 = +[NSDictionary dictionary];
    __int16 v19 = +[NSSet setWithObject:v25];
    [v17 sendMessageDictionary:v18 encryptDictionary:1 fromID:v25 fromAccount:v6 toURIs:v19 toGroup:0 priority:300 options:v15 willSendBlock:0 completionBlock:&stru_DE1E0];

    BOOL v20 = 1;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        *(void *)__int16 v31 = v4;
        *(_WORD *)&v31[8] = 2112;
        CFStringRef v32 = v6;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "  Unable to reflect mark unread for message (%@), device is not registered for account: %@, bailing.", buf, 0x16u);
      }
    }
    BOOL v20 = 0;
  }

  return v20;
}

- (BOOL)reflectRecoverChatToPeerDevicesForMessageGUID:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)long long buf = 138412290;
      id v22 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Begin reflecting recover junk chat for message guid %@", buf, 0xCu);
    }
  }
  id v6 = [(MessageServiceSession *)self idsAccount];
  if (v6 && [(MessageServiceSession *)self _isDeviceRegisteredForAccount:v6])
  {
    int v7 = [(MessageServiceSession *)self callerURIForIDSAccount:v6];
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v22 = v4;
        __int16 v23 = 2112;
        long long v24 = v7;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "  Reflect recover junk chat for message guid: %@ to peer devices using callerID: %@", buf, 0x16u);
      }
    }
    v19[0] = IDSSendMessageOptionUUIDKey;
    id v9 = IDSGetUUIDData();
    v20[0] = v9;
    v20[1] = &__kCFBooleanTrue;
    v19[1] = IDSSendMessageOptionTopLevelDictionaryKey;
    v19[2] = IDSSendMessageOptionSkipPayloadCheckKey;
    v20[2] = &__kCFBooleanTrue;
    v20[3] = &off_E3738;
    v19[3] = IDSSendMessageOptionCommandKey;
    v19[4] = IDSSendMessageOptionTimeoutKey;
    unsigned int v10 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    v20[4] = v10;
    v19[5] = IDSSendMessageOptionWantsDeliveryStatusKey;
    v19[6] = IDSSendMessageOptionAlwaysSkipSelfKey;
    v20[5] = &__kCFBooleanTrue;
    v20[6] = &__kCFBooleanTrue;
    unsigned int v11 = +[NSDictionary dictionaryWithObjects:v20 forKeys:v19 count:7];

    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "  Sending FTCommandIDRecoverJunkMessage (c=119)", buf, 2u);
      }
    }
    id v13 = [(MessageServiceSession *)self deliveryController];
    int v14 = +[NSDictionary dictionary];
    uint64_t v15 = +[NSSet setWithObject:v7];
    objc_msgSend(v13, "sendMessageDictionary:encryptDictionary:fromID:fromAccount:toURIs:toGroup:priority:options:willSendBlock:completionBlock:", v14, 1, v7, v6, v15, 0, 300, v11, 0, &stru_DE200, v19[0]);

    BOOL v16 = 1;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      long long v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 138412546;
        id v22 = v4;
        __int16 v23 = 2112;
        long long v24 = v6;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "  Unable to reflect recover junk chat for message guid (%@), device is not registered for account: %@, bailing.", buf, 0x16u);
      }
    }
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)_shouldBlackholeChatFromSender:(id)a3 toRecipient:(id)a4 forAccount:(id)a5
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IMDChatRegistry sharedInstance];
  id v9 = [v8 existingSMSChatForID:v6];

  if (v9)
  {
    unsigned int v10 = [v9 lastSentMessageDate];
    BOOL v11 = v10 != 0;
  }
  else
  {
    BOOL v11 = 0;
  }
  uint64_t v12 = +[IMDAccountController sharedAccountController];
  id v13 = [v12 activeAccountsAreEligibleForHawking];

  int v14 = +[IMDAccountController sharedAccountController];
  id v15 = [v14 receiverIsCandidateForHawking:v7];

  unsigned __int8 v16 = +[IMSpamFilterHelper shouldBlackholeMessageFromSender:v6 toRecipient:v7 ifRecipientIsCandidate:v15 givenHistory:v11 forEligibleAccounts:v13];
  return v16;
}

- (BOOL)_shouldBlackholeGroupChatFromSender:(id)a3 toRecipient:(id)a4 withOtherParticipants:(id)a5 forAccount:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v43[0] = v9;
  v43[1] = v10;
  id v36 = v10;
  id v13 = +[NSArray arrayWithObjects:v43 count:2];
  int v14 = +[IMSpamFilterHelper sanitizeParticipants:v11 excludingHandles:v13];

  id v15 = +[IMDChatRegistry sharedInstance];
  id v37 = v9;
  unsigned __int8 v16 = [v9 _stripFZIDPrefix];
  long long v17 = [v15 existingChatForID:v16 account:v12];
  int v18 = [v17 lastSeenMessageGuid];
  BOOL v19 = v18 != 0;

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v20 = v14;
  id v21 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v39;
    do
    {
      for (i = 0; i != v22; i = (char *)i + 1)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(v20);
        }
        if (v19)
        {
          BOOL v19 = 1;
        }
        else
        {
          __int16 v25 = *(void **)(*((void *)&v38 + 1) + 8 * i);
          CFStringRef v26 = +[IMDChatRegistry sharedInstance];
          char v27 = [v25 _stripFZIDPrefix];
          CFStringRef v28 = [v26 existingChatForID:v27 account:v12];
          id v29 = [v28 lastSeenMessageGuid];
          BOOL v19 = v29 != 0;
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v38 objects:v42 count:16];
    }
    while (v22);
  }

  id v30 = +[IMDAccountController sharedAccountController];
  id v31 = [v30 activeAccountsAreEligibleForHawking];

  CFStringRef v32 = +[IMDAccountController sharedAccountController];
  id v33 = [v32 receiverIsCandidateForHawking:v36];

  unsigned __int8 v34 = +[IMSpamFilterHelper shouldBlackholeGroupMessageFromSender:v37 toRecipient:v36 ifRecipientIsCandidate:v33 withOtherParticipants:v20 givenHistory:v19 forEligibleAccounts:v31];
  return v34;
}

- (id)_pushHandlerForIDSAccount:(id)a3
{
  id v4 = a3;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  id v5 = self->_messagePushHandlers;
  id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v30;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v30 != v7) {
        objc_enumerationMutation(v5);
      }
      id v9 = *(void **)(*((void *)&v29 + 1) + 8 * v8);
      id v10 = [v9 account];
      unsigned __int8 v11 = [v10 isEqual:v4];

      if (v11) {
        break;
      }
      if (v6 == (id)++v8)
      {
        id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v29 objects:v34 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
    id v12 = v9;

    if (v12) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_9:
  }
  long long v27 = 0u;
  long long v28 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v13 = self->_messagePushHandlers;
  id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v26;
LABEL_13:
    uint64_t v16 = 0;
    while (1)
    {
      if (*(void *)v26 != v15) {
        objc_enumerationMutation(v13);
      }
      long long v17 = *(void **)(*((void *)&v25 + 1) + 8 * v16);
      int v18 = [v17 account];
      BOOL v19 = [v18 loginID];
      id v20 = [v4 loginID];
      unsigned __int8 v21 = [v19 isEqual:v20];

      if (v21) {
        break;
      }
      if (v14 == (id)++v16)
      {
        id v14 = [(NSMutableArray *)v13 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v14) {
          goto LABEL_13;
        }
        goto LABEL_19;
      }
    }
    id v12 = v17;

    if (v12) {
      goto LABEL_26;
    }
  }
  else
  {
LABEL_19:
  }
  if (IMOSLoggingEnabled())
  {
    id v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)long long v24 = 0;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Couldn't find push handler", v24, 2u);
    }
  }
  id v12 = 0;
LABEL_26:

  return v12;
}

- (void)_handleMessageSentToSelf:(id)a3 chatIdentifier:(id)a4 style:(unsigned __int8)a5 isLocal:(BOOL)a6 account:(id)a7
{
  uint64_t v8 = a5;
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  if (!v13)
  {
    id v13 = [(MessageServiceSession *)self account];
  }
  if ([v11 isFromMe])
  {
    if (([v11 isTypingMessage] & 1) == 0)
    {
      id v14 = [v11 handle];
      BOOL v15 = sub_35D7C(v14);

      if (!v15)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412802;
            id v21 = v11;
            __int16 v22 = 2112;
            id v23 = v12;
            __int16 v24 = 1024;
            int v25 = v8;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Need to handle message sent to myself: %@   chat: %@  style: %d", buf, 0x1Cu);
          }
        }
        [(MessageServiceSession *)self shouldSendReadReceiptsForChat:v12 style:v8];
        id v17 = v11;
        id v18 = v12;
        id v19 = v13;
        im_dispatch_after();
      }
    }
  }
}

- (void)handleBreadcrumbForNewSentMessageItemIfNecessary:(id)a3 withContext:(id)a4
{
  id v15 = a3;
  id v6 = a4;
  uint64_t v7 = [v6 chat];
  uint64_t v8 = [v7 chatIdentifier];
  id v9 = [(MessageServiceSession *)self storeBreadcrumbAndSetConsumedPayloadsForNewMessageItemIfNecessary:v15 inChatWithIdentifier:v8];

  if ([v15 isBreadcrumb] && _IMWillLog())
  {
    id v10 = [v15 consumedSessionPayloads];
    id v14 = [v10 count];
    id v13 = v15;
    _IMAlwaysLog();
  }
  id v11 = objc_msgSend(v6, "chat", v13, v14);
  id v12 = [v11 chatIdentifier];
  [(MessageServiceSession *)self _updateStoredBreadcrumbIfNeeded:v9 onChat:v12];
}

- (id)storeBreadcrumbAndSetConsumedPayloadsForNewMessageItemIfNecessary:(id)a3 inChatWithIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isTypingMessage] & 1) == 0 && !objc_msgSend(v6, "scheduleType"))
  {
    id v10 = [v6 breadcrumbText];
    if (![v10 length])
    {
      id v11 = [v6 balloonBundleID];
      id v12 = [v11 length];

      if (!v12)
      {
        uint64_t v8 = 0;
LABEL_52:

        goto LABEL_6;
      }
    }
    id v13 = [v6 balloonBundleID];
    unsigned int v14 = [v13 isEqualToString:IMBalloonPluginIdentifierDT];

    if ([v10 length])
    {
      id v15 = [v6 balloonBundleID];
      BOOL v16 = [v15 length] == 0;
    }
    else
    {
      BOOL v16 = 0;
    }
    id v76 = 0;
    id v17 = [(MessageServiceSession *)self _messageItemToConsumeForNewBreadcrumbMessage:v6 outBreadcrumbItems:&v76];
    id v18 = v76;
    if ([v6 associatedMessageType] == (char *)&dword_0 + 2)
    {
      id v19 = objc_alloc((Class)NSMutableArray);
      id v20 = IMGetConsumedSessionPayloadsForBreadcrumbItems();
      id v21 = [v19 initWithArray:v20];

      uint64_t v22 = [v17 payloadData];
      if (v22)
      {
        id v23 = (void *)v22;
        __int16 v24 = (char *)[v17 associatedMessageType];

        if (v24 != (unsigned char *)&dword_0 + 3)
        {
          int v25 = [v17 payloadData];
          [v21 addObject:v25];
        }
      }
      [v6 setConsumedSessionPayloads:v21];
    }
    if ((v16 | v14) == 1)
    {
      id v26 = v10;
    }
    else
    {
      id v26 = [v17 breadcrumbText];
    }
    long long v27 = v26;
    if (_IMWillLog())
    {
      CFStringRef v51 = v17;
      _IMAlwaysLog();
    }
    if (objc_msgSend(v17, "associatedMessageType", v51) == (char *)&dword_0 + 3) {
      goto LABEL_25;
    }
    if (v17)
    {
      id v28 = [objc_alloc((Class)IMAssociatedMessageItem) initWithMessageItem:v17];
      long long v29 = [v6 associatedMessageGUID];
      [v28 setAssociatedMessageGUID:v29];

      [v28 setAssociatedMessageType:3];
      [v28 setBody:v27];
      long long v30 = v17;
    }
    else
    {
      long long v43 = [v6 balloonBundleID];

      if (v43)
      {
LABEL_25:
        uint64_t v8 = 0;
LABEL_51:

        goto LABEL_52;
      }
      id v67 = objc_alloc((Class)IMAssociatedMessageItem);
      uint64_t v65 = [v6 senderInfo];
      id v64 = [v6 time];
      unsigned int v44 = [v6 isFromMe];
      uint64_t v45 = 12289;
      if (v44) {
        uint64_t v45 = 45061;
      }
      uint64_t v63 = v45;
      id v69 = [v6 account];
      id v46 = [v6 accountID];
      uint64_t v62 = IMServiceNameiMessage;
      uint64_t v47 = [v6 handle];
      id v66 = (void *)v47;
      if (v47) {
        uint64_t v48 = v47;
      }
      else {
        uint64_t v48 = (uint64_t)v7;
      }
      id v61 = (id)v48;
      char v60 = [v6 roomName];
      uint64_t v59 = [v6 unformattedID];
      __int16 v58 = [v6 countryCode];
      id v49 = [v6 expireState];
      id v56 = [v6 balloonBundleID];
      CFStringRef v57 = [v6 guid];
      unsigned int v50 = [v6 biaReferenceID];
      LODWORD(v55) = 0;
      id v28 = objc_msgSend(v67, "initWithSenderInfo:time:timeRead:timeDelivered:timePlayed:subject:body:bodyData:attributes:fileTransferGUIDs:flags:guid:messageID:account:accountID:service:handle:roomName:unformattedID:countryCode:expireState:balloonBundleID:payloadData:expressiveSendStyleID:timeExpressiveSendPlayed:errorType:associatedMessageGUID:associatedMessageType:associatedMessageRange:bizIntent:locale:biaReferenceID:messageSummaryInfo:partCount:threadIdentifier:", v65, v64, 0, 0, 0, 0, v27, 0, 0, 0, v63, 0, 0,
              v69,
              v46,
              v62,
              v61,
              v60,
              v59,
              v58,
              v49,
              v56,
              0,
              0,
              0,
              v55,
              v57,
              3,
              0,
              0x7FFFFFFFFFFFFFFFLL,
              0,
              0,
              v50,
              0,
              0,
              0);

      long long v30 = v6;
    }
    long long v31 = [v30 destinationCallerID];
    [v28 setDestinationCallerID:v31];

    long long v32 = +[IMDMessageStore sharedInstance];
    LOBYTE(v52) = 1;
    uint64_t v8 = [v32 storeMessage:v28 forceReplace:1 modifyError:0 modifyFlags:0 flagMask:0 updateMessageCache:1 calculateUnreadCount:v52];

    if (_IMWillLog())
    {
      id v33 = [v8 body];
      CFStringRef v53 = v8;
      id v54 = [v33 length];
      _IMAlwaysLog();
    }
    if (v8)
    {
      if (!v17)
      {
        id v68 = v28;
        long long v70 = v27;
        id v71 = v18;
        long long v74 = 0u;
        long long v75 = 0u;
        long long v72 = 0u;
        long long v73 = 0u;
        unsigned __int8 v34 = +[IMDChatRegistry sharedInstance];
        id v35 = [v34 allExistingChatsWithIdentifier:v7];

        id v36 = [v35 countByEnumeratingWithState:&v72 objects:v77 count:16];
        if (v36)
        {
          id v37 = v36;
          uint64_t v38 = *(void *)v73;
          do
          {
            for (i = 0; i != v37; i = (char *)i + 1)
            {
              if (*(void *)v73 != v38) {
                objc_enumerationMutation(v35);
              }
              uint64_t v40 = *(void *)(*((void *)&v72 + 1) + 8 * i);
              long long v41 = +[IMDChatRegistry sharedInstance];
              [v41 addItem:v8 toChat:v40];
            }
            id v37 = [v35 countByEnumeratingWithState:&v72 objects:v77 count:16];
          }
          while (v37);
        }

        id v17 = 0;
        long long v27 = v70;
        id v18 = v71;
        id v28 = v68;
      }
      id v42 = v8;
    }
    else
    {
      _IMWarn();
    }

    goto LABEL_51;
  }
  if (_IMWillLog())
  {
    [v6 isTypingMessage];
    [v6 scheduleType];
    _IMAlwaysLog();
  }
  uint64_t v8 = 0;
LABEL_6:

  return v8;
}

- (id)_messageItemToConsumeForNewBreadcrumbMessage:(id)a3 outBreadcrumbItems:(id *)a4
{
  id v5 = a3;
  id v6 = [v5 associatedMessageGUID];
  id v7 = +[IMDMessageStore sharedInstance];
  uint64_t v8 = [v7 messagesWithAssociatedGUID:v6 shouldLoadAttachments:0];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_4C154;
  v32[3] = &unk_DE930;
  id v9 = v5;
  id v33 = v9;
  id v10 = objc_msgSend(v8, "__imArrayByFilteringWithBlock:", v32);

  if (a4) {
    *a4 = v10;
  }
  long long v30 = 0u;
  long long v31 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v11 = v10;
  id v12 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
  if (v12)
  {
    id v13 = v12;
    id v26 = v6;
    long long v27 = 0;
    id v14 = 0;
    uint64_t v15 = *(void *)v29;
    while (2)
    {
      for (i = 0; i != v13; i = (char *)i + 1)
      {
        if (*(void *)v29 != v15) {
          objc_enumerationMutation(v11);
        }
        id v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        id v18 = objc_msgSend(v9, "guid", v26);
        id v19 = [v17 guid];
        unsigned __int8 v20 = [v18 isEqualToString:v19];

        if ((v20 & 1) == 0)
        {
          if ([v17 associatedMessageType] == (char *)&dword_0 + 2)
          {
            id v23 = v17;

            id v6 = v26;
            id v22 = v27;
            goto LABEL_22;
          }
          if ([v17 associatedMessageType] == (char *)&dword_0 + 3
            && (uint64_t)v14 < (uint64_t)[v17 messageID])
          {
            id v14 = [v17 messageID];
            id v21 = v17;

            long long v27 = v21;
          }
        }
      }
      id v13 = [v11 countByEnumeratingWithState:&v28 objects:v34 count:16];
      if (v13) {
        continue;
      }
      break;
    }

    id v6 = v26;
    if (v14)
    {
      id v22 = v27;
      id v23 = v22;
      goto LABEL_22;
    }
    id v22 = v27;
  }
  else
  {

    id v22 = 0;
  }
  if ([v9 associatedMessageType] == (char *)&dword_0 + 2)
  {
    __int16 v24 = +[IMDMessageStore sharedInstance];
    id v23 = [v24 messageWithGUID:v6];
  }
  else
  {
    id v23 = 0;
  }
LABEL_22:

  return v23;
}

- (void)_updateStoredBreadcrumbIfNeeded:(id)a3 onChat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  __int16 v24 = v5;
  if (v5)
  {
    long long v29 = 0u;
    long long v30 = 0u;
    long long v27 = 0u;
    long long v28 = 0u;
    id v7 = +[IMDChatRegistry sharedInstance];
    uint64_t v8 = [v7 allExistingChatsWithIdentifier:v6];

    id obj = v8;
    id v9 = [v8 countByEnumeratingWithState:&v27 objects:v31 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v28;
      do
      {
        id v12 = 0;
        id v25 = v10;
        do
        {
          if (*(void *)v28 != v11) {
            objc_enumerationMutation(obj);
          }
          id v13 = *(void **)(*((void *)&v27 + 1) + 8 * (void)v12);
          id v14 = [v13 chatIdentifier];
          unsigned int v15 = [v14 isEqualToString:v6];

          if (v15)
          {
            BOOL v16 = +[IMDBroadcastController sharedProvider];
            id v17 = objc_msgSend(v16, "broadcasterForChatListenersUsingBlackholeRegistry:", objc_msgSend(v13, "isBlackholed"));
            [v13 accountID];
            v19 = id v18 = v6;
            unsigned __int8 v20 = [v13 chatIdentifier];
            id v21 = [v13 style];
            id v22 = [v13 groupID];
            id v23 = [v13 personCentricID];
            [v17 account:v19 chat:v20 style:v21 chatProperties:0 groupID:v22 chatPersonCentricID:v23 messageReceived:v24];

            id v6 = v18;
            id v10 = v25;
          }
          id v12 = (char *)v12 + 1;
        }
        while (v10 != v12);
        id v10 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
      }
      while (v10);
    }
  }
}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 destinationHandles:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  id v13 = [(MessageServiceSession *)self account];
  [(MessageServiceSession *)self sendMessage:v12 toChat:v11 style:v6 account:v13 destinationHandles:v10];
}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 destinationHandles:(id)a7
{
  uint64_t v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  if ([(MessageServiceSession *)self _shouldInitiateTelephonyConversationForMessage:v12])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = [v12 guid];
        *(_DWORD *)long long buf = 138412290;
        long long v28 = v17;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Initiating TUConversation for message %@ and not actually sending the message", buf, 0xCu);
      }
    }
    [(MessageServiceSession *)self _initiateTelephonyConversationForMessage:v12 chatIdentifier:v13 chatStyle:v9 onSession:self];
  }
  else
  {
    id v18 = [(MessageServiceSession *)self _buildSendMessageContextWithChatIdentifier:v13 withChatStyle:v9 withServiceSession:self withMessage:v12 destinations:v15];
    if (v18)
    {
      [(MessageServiceSession *)self _notifyOfSendMessage:v12 withContext:v18];
      [(MessageServiceSession *)self _startTimingMessageSend];
      [(MessageServiceSession *)self handleBreadcrumbForNewSentMessageItemIfNecessary:v12 withContext:v18];
      id v19 = [(MessageServiceSession *)self _processMessageForSending:v12 withContext:v18];

      if (v19)
      {
        unsigned __int8 v20 = [(MessageServiceSession *)self _processMessageForSendingToGroupIfNeeded:v19 withContext:v18];
        if (v20)
        {
          [v18 setGroupMessageContext:v20];
          [(MessageServiceSession *)self _refreshGroupPhotoTTLIfNecessary:v19 withContext:v18];
          v23[0] = _NSConcreteStackBlock;
          v23[1] = 3221225472;
          v23[2] = sub_7F7F0;
          v23[3] = &unk_DFA20;
          id v21 = v18;
          id v24 = v21;
          id v25 = self;
          id v22 = v19;
          id v26 = v22;
          [(MessageServiceSession *)self _deliverMessage:v22 withContext:v21 withBlock:v23];
          [(MessageServiceSession *)self _storeSentMessage:v22 withContext:v21];
        }
      }
    }
    else
    {
      id v19 = v12;
    }

    id v12 = v19;
  }
}

- (void)cancelScheduledMessageWithGUID:(id)a3
{
  id v4 = a3;
  id v5 = [(MessageServiceSession *)self deliveryController];
  [v5 cancelScheduledMessageWithGUID:v4 fromID:@"0000000000"];
}

- (void)cancelScheduledMessageWithGUID:(id)a3 destinations:(id)a4 cancelType:(unint64_t)a5
{
  id v8 = a4;
  id v9 = a3;
  id v10 = +[IMDChatStore sharedInstance];
  id v11 = [v10 chatsGUIDsForMessageWithGUID:v9];
  id v16 = [v11 lastObject];

  id v12 = +[IMDChatRegistry sharedInstance];
  id v13 = [v12 existingChatWithGUID:v16];

  id v14 = _LastAddressedURIForChatLogMetricIfNeeded(v13, 0, self, 0, 0);
  id v15 = [(MessageServiceSession *)self deliveryController];
  [v15 cancelScheduledMessageWithGUID:v9 fromID:v14 destinations:v8 cancelType:a5];
}

- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9
{
  uint64_t v9 = a8;
  id v15 = a7;
  id v16 = a4;
  id v17 = a3;
  id v21 = +[IMDMessageStore sharedInstance];
  id v18 = +[IMDChatStore sharedInstance];
  id v19 = [v18 chatWithGUID:v15];
  unsigned __int8 v20 = [v21 storeEditedMessage:v17 editedPartIndex:a5 editType:a6 previousMessage:v16 chat:v19 updatedAssociatedMessageItems:0];

  [(MessageServiceSession *)self sendMessage:v20 toChat:v15 style:v9];
}

- (void)sendEditedScheduledMessage:(id)a3 previousMessage:(id)a4 retractingPartIndexes:(id)a5 toChatIdentifier:(id)a6 style:(unsigned __int8)a7 account:(id)a8
{
  uint64_t v8 = a7;
  id v13 = a6;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  id v20 = +[IMDMessageStore sharedInstance];
  id v17 = +[IMDChatStore sharedInstance];
  id v18 = [v17 chatWithGUID:v13];
  id v19 = [v20 storeEditedMessage:v16 editedPartIndexes:v14 editType:2 previousMessage:v15 chat:v18 updatedAssociatedMessageItems:0];

  [(MessageServiceSession *)self sendMessage:v19 toChat:v13 style:v8];
}

- (void)_notifyOfSendMessage:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v8 = a3;
  id v7 = [v6 chat];
  [(MessageServiceSession *)self _notifyNameAndPhotoControllerOfMessage:v8 onChat:v7];

  [(MessageServiceSession *)self _updateBlackholeStatusIfNeededWithMessage:v8 withContext:v6];
  [(MessageServiceSession *)self _updateLastDeviceActivityForCloudKit];
  [(MessageServiceSession *)self _setExpectedOffGridDeliveriesForMessage:v8 context:v6];
}

- (void)_setExpectedOffGridDeliveriesForMessage:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isTypingMessage] & 1) == 0)
  {
    id v8 = [v7 chat];
    unsigned int v9 = [v8 style];

    if (v9 == 45)
    {
      id v10 = [v7 participantURIs];
      id v11 = [v10 firstObject];
      unint64_t v12 = [(MessageServiceSession *)self _numberOfOffGridCapableDevicesForDestination:v11];

      if (IMOSLoggingEnabled())
      {
        id v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          id v14 = [v7 chat];
          id v15 = [v14 chatIdentifier];
          int v19 = 134218242;
          unint64_t v20 = v12;
          __int16 v21 = 2112;
          id v22 = v15;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Found %llu off grid capable devices for %@", (uint8_t *)&v19, 0x16u);
        }
      }
      if (v12)
      {
        [v6 setExpectedOffGridCapableDeliveries:v12];
        id v16 = +[IMDOffGridAvailabilityTracker sharedTracker];
        id v17 = [v7 chat];
        id v18 = [v17 recipient];
        [v16 startTrackingHandle:v18];
      }
    }
  }
}

- (void)_notifyNameAndPhotoControllerOfMessage:(id)a3 onChat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isTypingMessage] & 1) == 0
    && IMSharedHelperNickNameEnabled()
    && [v5 shouldSendMeCard])
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)unsigned int v9 = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Queuing up nickname info to send if needed", v9, 2u);
      }
    }
    id v8 = +[IMDNicknameController sharedInstance];
    [v8 queueChatToSendNicknamePostUploadIfNeeded:v6];
  }
}

- (void)_updateBlackholeStatusIfNeededWithMessage:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (([v5 isTypingMessage] & 1) == 0)
  {
    id v7 = [v6 chat];
    unsigned int v8 = [v7 isBlackholed];

    if (v8)
    {
      if (IMOSLoggingEnabled())
      {
        unsigned int v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          id v10 = [v6 chat];
          id v11 = [v10 guid];
          int v19 = 138412290;
          unint64_t v20 = v11;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Response is causing chat (%@) to be removed from blackhole.", (uint8_t *)&v19, 0xCu);
        }
      }
      unint64_t v12 = [v6 chat];
      [v12 updateIsBlackholed:0];

      id v13 = [v6 chat];
      id v14 = [v13 participants];
      BOOL v15 = [v14 count] == (char *)&dword_0 + 1;

      id v16 = +[IMMetricsCollector sharedInstance];
      id v17 = v16;
      if (v15) {
        uint64_t v18 = 22;
      }
      else {
        uint64_t v18 = 23;
      }
      [v16 trackSpamEvent:v18];
    }
  }
}

- (void)_updateLastDeviceActivityForCloudKit
{
  id v2 = +[IMLockdownManager sharedInstance];
  unsigned int v3 = [v2 isInternalInstall];

  if (v3)
  {
    id v4 = +[NSDate date];
    IMSetDomainValueForKey();
  }
}

- (void)_didSendMessage:(id)a3 withContext:(id)a4 forceDate:(id)a5 fromStorage:(BOOL)a6
{
  BOOL v6 = a6;
  id v10 = a5;
  id v11 = a4;
  id v12 = a3;
  id v18 = [v11 serviceSession];
  id v13 = [v11 chat];
  id v14 = [v13 chatIdentifier];
  BOOL v15 = [v11 chat];

  id v16 = [v15 style];
  id v17 = [(MessageServiceSession *)self account];
  [v18 didSendMessage:v12 forChat:v14 style:v16 account:v17 forceDate:v10 itemIsComingFromStorage:v6];
}

- (id)_setCallerIDOnMessage:(id)a3 onChat:(id)a4 withIDSAccount:(id *)a5 withServiceSession:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [v10 guid];
      int v28 = 138412290;
      long long v29 = v14;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Picking callerID for guid %@", (uint8_t *)&v28, 0xCu);
    }
  }
  BOOL v15 = -[MessageServiceSession _lastAddressedURIForChatLogMetricIfNeededOnChat:withIDSAccount:withServiceSession:shouldLog:](self, "_lastAddressedURIForChatLogMetricIfNeededOnChat:withIDSAccount:withServiceSession:shouldLog:", v11, a5, v12, [v10 isTypingMessage] ^ 1);
  id v16 = [v10 balloonBundleID];
  id v17 = IMBalloonExtensionIDWithSuffix();
  if ([v16 isEqualToString:v17])
  {
  }
  else
  {
    id v18 = [v10 balloonBundleID];
    int v19 = IMBalloonExtensionIDWithSuffix();
    unsigned int v20 = [v18 isEqualToString:v19];

    if (!v20) {
      goto LABEL_19;
    }
  }
  __int16 v21 = [v10 account];
  id v22 = v21;
  if (v21)
  {
    if (([v21 hasPrefix:@"e:"] & 1) != 0
      || [v22 hasPrefix:@"E:"])
    {
      id v23 = [v22 _stripFZIDPrefix];

      uint64_t v24 = [v23 _bestGuessURI];

      if (IMOSLoggingEnabled())
      {
        id v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          int v28 = 138412290;
          long long v29 = v23;
          _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Rewritting callerURI using %@ for PeopleMessageService balloon", (uint8_t *)&v28, 0xCu);
        }
      }
      BOOL v15 = (void *)v24;
    }
    else
    {
      id v23 = v22;
    }
  }
  else
  {
    id v23 = 0;
  }

LABEL_19:
  id v26 = [v15 _stripFZIDPrefix];
  [v10 setDestinationCallerID:v26];

  return v15;
}

- (id)_lastAddressedURIForChatLogMetricIfNeededOnChat:(id)a3 withIDSAccount:(id *)a4 withServiceSession:(id)a5 shouldLog:(BOOL)a6
{
  return _LastAddressedURIForChatLogMetricIfNeeded(a3, 0, a5, a4, a6);
}

- (BOOL)_handleDeviceRegistrationForMessage:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v7 idsAccount];
  BOOL v9 = [(MessageServiceSession *)self _isDeviceRegisteredForAccount:v8];

  if (!v9)
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v11 = [v7 idsAccount];
        int v14 = 138412290;
        BOOL v15 = v11;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, " ** Device is not regisistered for account %@, failing send message", (uint8_t *)&v14, 0xCu);
      }
    }
    [v6 setErrorCode:33];
    if ([v6 scheduleType] == (char *)&dword_0 + 2) {
      [(MessageServiceSession *)self _handleScheduledMessageSendFailure:v6];
    }
    [(MessageServiceSession *)self _didSendMessage:v6 withContext:v7 forceDate:0 fromStorage:0];
    [(MessageServiceSession *)self _FTAWDLogForMessage:v6 withContext:v7];
    id v12 = +[IMPowerLog sharedInstance];
    [v12 logMessageSendFailureWithError:@"DeviceNotRegistered"];

    [(MessageServiceSession *)self _stopTimingMessageSend];
  }

  return v9;
}

- (BOOL)_failSendingMessageIfNeeded:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = IMGetCachedDomainBoolForKey();
  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v15 = 0x4010000000000000;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, " ** FailSendingMessages is enabled, failing send message after %f seconds", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)long long buf = 134217984;
        uint64_t v15 = 0x4010000000000000;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, " ** FailSendingMessages is enabled, failing send message after %f seconds", buf, 0xCu);
      }
    }
    id v12 = v6;
    id v13 = v7;
    im_dispatch_after();
    [(MessageServiceSession *)self _storeSentMessage:v12 withContext:v13];
  }
  return v8;
}

- (BOOL)_handleTypingIndicatorMessage:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [(MessageServiceSession *)self _shouldOverrideTypingIndicator];
  if (v8 && IMOSLoggingEnabled())
  {
    BOOL v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "The server has disabled typing indicators via the iMessage config bag!", (uint8_t *)&v26, 2u);
    }
  }
  id v10 = [v7 chat];
  BOOL v11 = [v10 style] != 45;

  if ((v8 | v11) == 1)
  {
    if (([v6 isFinished] & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          id v22 = [v7 chat];
          unsigned int v23 = [v22 style];
          CFStringRef v24 = @"NO";
          if (v8) {
            CFStringRef v24 = @"YES";
          }
          int v26 = 67109378;
          LODWORD(v27[0]) = v23;
          WORD2(v27[0]) = 2112;
          *(void *)((char *)v27 + 6) = v24;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Not sending typing indicator to chat style: %c typingIndicatorOverride: %@", (uint8_t *)&v26, 0x12u);
        }
      }
      goto LABEL_34;
    }
    if ([v6 isFinished] && objc_msgSend(v6, "isEmpty"))
    {
      if (IMOSLoggingEnabled())
      {
        id v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          id v13 = [v7 chat];
          unsigned int v14 = [v13 style];
          CFStringRef v15 = @"NO";
          if (v8) {
            CFStringRef v15 = @"YES";
          }
          int v26 = 67109378;
          LODWORD(v27[0]) = v14;
          WORD2(v27[0]) = 2112;
          *(void *)((char *)v27 + 6) = v15;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Not sending a cancel typing indicator to chat style: %c typingIndicatorOverride: %@", (uint8_t *)&v26, 0x12u);
        }
      }
LABEL_34:
      [(MessageServiceSession *)self _storeSentMessage:v6 withContext:v7];
      [(MessageServiceSession *)self _didSendMessage:v6 withContext:v7 forceDate:0 fromStorage:0];
      BOOL v20 = 0;
      goto LABEL_35;
    }
  }
  if (![(MessageServiceSession *)self _shouldSendAppTypingIndicator])
  {
    if ([v6 isTypingMessage])
    {
      id v16 = [v6 balloonBundleID];
      BOOL v17 = [v16 length] == 0;

      if (!v17)
      {
        if (IMOSLoggingEnabled())
        {
          id v18 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
          {
            int v26 = 138412290;
            v27[0] = v6;
            _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Not sending app typing indicator due to server overrride for msg %@", (uint8_t *)&v26, 0xCu);
          }
        }
        goto LABEL_34;
      }
    }
  }
  if (([v6 isTypingMessage] & 1) == 0)
  {
    int v19 = +[IMMetricsCollector sharedInstance];
    [v19 trackEvent:IMMetricsCollectorEventiMessageSent];
  }
  BOOL v20 = 1;
LABEL_35:

  return v20;
}

- (BOOL)_shouldOverrideTypingIndicator
{
  id v2 = +[IDSServerBag sharedInstanceForBagType:1];
  unsigned int v3 = [v2 objectForKey:@"md-typing-indicator-override"];
  BOOL v4 = [v3 intValue] != 0;

  return v4;
}

- (BOOL)_shouldSendAppTypingIndicator
{
  id v2 = +[IDSServerBag sharedInstanceForBagType:1];
  unsigned int v3 = [v2 objectForKey:@"dont-send-app-typing-indicator"];
  char v4 = [v3 BOOLValue] ^ 1;

  return v4;
}

- (id)_processMessageForSending:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v22 = 0;
  unsigned int v23 = &v22;
  uint64_t v24 = 0x3032000000;
  id v25 = sub_81290;
  int v26 = sub_812A0;
  id v27 = 0;
  unsigned int v8 = [v6 isBeingRetried];
  BOOL v9 = [v7 serviceSession];
  id v10 = [v7 chat];
  BOOL v11 = [v10 chatIdentifier];
  id v12 = [v7 chat];
  unsigned int v17 = [v12 style];
  id v13 = [v7 imdAccount];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_812A8;
  v21[3] = &unk_DFA48;
  v21[4] = self;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_8133C;
  v18[3] = &unk_DFA70;
  void v18[4] = self;
  id v14 = v7;
  id v19 = v14;
  BOOL v20 = &v22;
  [v9 processMessageForSending:v6 toChat:v11 style:v17 allowWatchdog:v8 ^ 1 account:v13 didReplaceMessageBlock:v21 completionBlock:v18];

  id v15 = (id)v23[5];
  _Block_object_dispose(&v22, 8);

  return v15;
}

- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 account:(id)a7 didReplaceMessageBlock:(id)a8 completionBlock:(id)a9
{
  BOOL v30 = a6;
  uint64_t v11 = a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a7;
  id v28 = a8;
  id v26 = a9;
  if ([v14 scheduleType] == (char *)&dword_0 + 2)
  {
    unsigned int v17 = +[NSDate date];
    [v14 setScheduledMessageLastModifiedTime:v17];
  }
  id v18 = v14;
  long long v32 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id v27 = self;
  id v19 = [(MessageServiceSession *)self serviceSessionDelegates];
  id v20 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
  long long v29 = v18;
  if (v20)
  {
    id v21 = v20;
    uint64_t v22 = *(void *)v33;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v33 != v22) {
          objc_enumerationMutation(v19);
        }
        uint64_t v24 = *(void **)(*((void *)&v32 + 1) + 8 * i);
        if (objc_opt_respondsToSelector())
        {
          uint64_t v25 = [v24 processMessageForSending:v18 toChat:v15 style:v11 allowWatchdog:v30 account:v16];

          id v18 = (id)v25;
        }
      }
      id v21 = [v19 countByEnumeratingWithState:&v32 objects:v36 count:16];
    }
    while (v21);
  }

  v31.receiver = v27;
  v31.super_class = (Class)MessageServiceSession;
  [(MessageServiceSession *)&v31 processMessageForSending:v18 toChat:v15 style:v11 allowWatchdog:v30 account:v16 didReplaceMessageBlock:v28 completionBlock:v26];
}

- (unint64_t)_numberOfOffGridCapableDevicesForDestination:(id)a3
{
  id v20 = a3;
  id v33 = v20;
  unsigned int v3 = +[NSArray arrayWithObjects:&v33 count:1];
  char v4 = +[IMIDSIDQueryController _currentCachedRemoteDevicesForDestinations:v3 service:@"com.apple.madrid" listenerID:@"MessageServiceSession+OffGrid"];

  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id v19 = v4;
  id obj = [v4 allValues];
  id v5 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
  if (v5)
  {
    id v6 = v5;
    unint64_t v7 = 0;
    uint64_t v22 = *(void *)v28;
    uint64_t v8 = IDSRegistrationPropertySupportsStewie;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v28 != v22) {
          objc_enumerationMutation(obj);
        }
        id v10 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        long long v23 = 0u;
        long long v24 = 0u;
        long long v25 = 0u;
        long long v26 = 0u;
        id v11 = v10;
        id v12 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
        if (v12)
        {
          id v13 = v12;
          uint64_t v14 = *(void *)v24;
          do
          {
            for (j = 0; j != v13; j = (char *)j + 1)
            {
              if (*(void *)v24 != v14) {
                objc_enumerationMutation(v11);
              }
              id v16 = [*(id *)(*((void *)&v23 + 1) + 8 * (void)j) capabilities];
              id v17 = [v16 valueForCapability:v8];

              if (v17) {
                ++v7;
              }
            }
            id v13 = [v11 countByEnumeratingWithState:&v23 objects:v31 count:16];
          }
          while (v13);
        }
      }
      id v6 = [obj countByEnumeratingWithState:&v27 objects:v32 count:16];
    }
    while (v6);
  }
  else
  {
    unint64_t v7 = 0;
  }

  return v7;
}

- (id)_processMessageForSendingToGroupIfNeeded:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  long long v27 = sub_81290;
  long long v28 = sub_812A0;
  id v29 = 0;
  unint64_t v7 = [v6 serviceSession];
  uint64_t v8 = [v7 groupController];
  BOOL v9 = [v6 chat];
  id v10 = [v6 fromURI];
  id v11 = [v6 idsAccount];
  id v12 = [v6 serviceSession];
  id v13 = [v6 idsService];
  v19[0] = _NSConcreteStackBlock;
  v19[1] = 3221225472;
  v19[2] = sub_81A34;
  v19[3] = &unk_DFA98;
  id v14 = v6;
  id v20 = v14;
  id v21 = self;
  id v15 = v5;
  id v22 = v15;
  long long v23 = &v24;
  [v8 sendMessage:v15 toChat:v9 fromID:v10 fromAccount:v11 session:v12 service:v13 completionBlock:v19];

  id v16 = (id)v25[5];
  _Block_object_dispose(&v24, 8);

  return v16;
}

- (void)_refreshGroupPhotoTTLIfNecessary:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unint64_t v7 = [v6 chat];
  uint64_t v8 = [v6 groupMessageContext];
  if (v8)
  {
    BOOL v9 = [v6 groupMessageContext];
    unsigned __int8 v10 = [v9 isGroupChat];

    if (v10)
    {
      id v11 = [v7 groupPhotoGuid];
      if (IMOSLoggingEnabled())
      {
        id v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v24 = 138412546;
          long long v25 = v7;
          __int16 v26 = 2112;
          long long v27 = v11;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Chat: %@, groupPhotoGuid= %@ ", (uint8_t *)&v24, 0x16u);
        }
      }
      id v13 = +[IMDFileTransferCenter sharedInstance];
      id v14 = [v13 transferForGUID:v11];

      if (v14) {
        goto LABEL_13;
      }
      if (IMOSLoggingEnabled())
      {
        id v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          LOWORD(v24) = 0;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Transfer from IMDFileTransferCenter is nil. Try the IMDAttachmentStore", (uint8_t *)&v24, 2u);
        }
      }
      id v16 = +[IMDAttachmentStore sharedInstance];
      id v17 = [v6 chat];
      id v18 = [v17 groupPhotoGuid];
      id v14 = [v16 attachmentWithGUID:v18];

      if (v14)
      {
LABEL_13:
        id v19 = [v6 serviceSession];
        id v20 = [v19 groupPhotoRefreshController];
        id v21 = [v6 chat];
        [v20 refreshTTLForGroupPhoto:v14 chat:v21];
      }
      else if (IMOSLoggingEnabled())
      {
        long long v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          LOWORD(v24) = 0;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Transfer from IMDAttachmentStore is nil. Can't refresh the TTL for group photo.", (uint8_t *)&v24, 2u);
        }
      }
LABEL_18:

      goto LABEL_19;
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v22 = [v7 displayName];
      int v24 = 138412290;
      long long v25 = v22;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Not refreshing for chat: %@ ", (uint8_t *)&v24, 0xCu);
    }
    goto LABEL_18;
  }
LABEL_19:
}

- (void)_deliverMessage:(id)a3 withContext:(id)a4 withBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  long long v23 = _NSConcreteStackBlock;
  uint64_t v24 = 3221225472;
  long long v25 = sub_8245C;
  __int16 v26 = &unk_DFB10;
  id v11 = v9;
  id v27 = v11;
  id v12 = v8;
  id v28 = v12;
  id v29 = self;
  id v13 = v10;
  id v30 = v13;
  id v14 = objc_retainBlock(&v23);
  id v15 = objc_alloc_init(MessageServiceSessionSendBlockWrapper);
  id v16 = objc_msgSend(v14, "copy", v23, v24, v25, v26);
  id v17 = [v12 guid];
  [(MessageServiceSessionSendBlockWrapper *)v15 setGUID:v17];

  [(MessageServiceSessionSendBlockWrapper *)v15 setBlock:v16];
  id v18 = [v12 balloonBundleID];
  if ([v18 isEqualToString:IMBalloonPluginIdentifierRichLinks])
  {
    id v19 = [v12 fileTransferGUIDs];
    if ([v19 count]) {
      uint64_t v20 = 0;
    }
    else {
      uint64_t v20 = [v12 isTypingMessage] ^ 1;
    }
  }
  else
  {
    uint64_t v20 = 0;
  }

  [(MessageServiceSessionSendBlockWrapper *)v15 setIsDelayedRichLinkBlock:v20];
  id v21 = [v11 serviceSession];
  [v21 stageMessageWrapperBlock:v15];

  id v22 = [v11 serviceSession];
  [v22 addItemToRecentsIfApplicable:v12];
}

- (void)_updateOffGridStatusIfNeededWithMessage:(id)a3 context:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isTypingMessage] & 1) == 0)
  {
    id v8 = [v7 chat];
    unsigned int v9 = [v8 style];

    if (v9 == 45)
    {
      id v10 = [v7 chat];
      id v11 = [v10 serviceName];
      unsigned __int8 v12 = [v11 isEqualToString:IMServiceNameiMessageLite];

      if ((v12 & 1) == 0)
      {
        id v13 = [v7 chat];
        id v14 = [v13 chatIdentifier];

        id v15 = [v6 guid];
        id v16 = [v7 imdAccount];
        int v32 = IMGetDomainBoolForKey();
        unsigned int v17 = [v6 isPendingSatelliteSend];
        id v18 = [v7 chat];
        id v19 = [v18 recipient];
        unsigned int v20 = [v19 cachedOffGridMode];

        int v21 = IMOSLoggingEnabled();
        if (v17 == v20)
        {
          if (v21)
          {
            id v28 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
            {
              unsigned int v29 = [v6 isPendingSatelliteSend];
              CFStringRef v30 = @"NO";
              if (v20) {
                CFStringRef v31 = @"YES";
              }
              else {
                CFStringRef v31 = @"NO";
              }
              if (v29) {
                CFStringRef v30 = @"YES";
              }
              *(_DWORD *)long long buf = 138412546;
              CFStringRef v40 = v31;
              __int16 v41 = 2112;
              CFStringRef v42 = v30;
              _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Recipient is off grid (%@) message pending satellite send (%@) agree, treating as active off grid status", buf, 0x16u);
            }
          }
          [(MessageServiceSession *)self didReceiveOffGridStatus:v32 | v20 | v17 forID:v14 messageGUID:v15 account:v16];
        }
        else
        {
          if (v21)
          {
            id v22 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
            {
              unsigned int v23 = [v6 isPendingSatelliteSend];
              CFStringRef v24 = @"NO";
              if (v20) {
                CFStringRef v25 = @"YES";
              }
              else {
                CFStringRef v25 = @"NO";
              }
              if (v23) {
                CFStringRef v24 = @"YES";
              }
              *(_DWORD *)long long buf = 138412546;
              CFStringRef v40 = v25;
              __int16 v41 = 2112;
              CFStringRef v42 = v24;
              _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Recipient is off grid (%@) message pending satellite send (%@) do not match, fetching off grid mode", buf, 0x16u);
            }
          }
          __int16 v26 = [v7 chat];
          id v27 = [v26 recipient];
          v33[0] = _NSConcreteStackBlock;
          v33[1] = 3221225472;
          v33[2] = sub_82C7C;
          v33[3] = &unk_DFB60;
          id v34 = v14;
          long long v35 = self;
          char v38 = v32;
          id v36 = v15;
          id v37 = v16;
          [v27 isOffGridModeWithCompletion:v33];
        }
      }
    }
  }
}

- (void)_handleFakeReceiptBlock:(id)a3 withContext:(id)a4 withMsg:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = [v8 chat];
  unsigned int v11 = [v10 style];

  if (v11 == 45)
  {
    unsigned __int8 v12 = [v8 fromURI];
    unsigned int v25 = [v12 isEqualToString:v7];

    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        id v14 = [v9 guid];
        CFStringRef v15 = @"NO";
        *(_DWORD *)long long buf = 138412802;
        id v27 = v14;
        __int16 v28 = 2112;
        if (v25) {
          CFStringRef v15 = @"YES";
        }
        id v29 = v7;
        __int16 v30 = 2112;
        CFStringRef v31 = v15;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Received legacy saved receipt for: %@   from: %@  from me: %@", buf, 0x20u);
      }
    }
    if ([v9 isAudioMessage])
    {
      uint64_t v16 = 0;
    }
    else
    {
      unsigned int v17 = [v9 balloonBundleID];
      BOOL v18 = [v17 length] == 0;

      if (v18) {
        uint64_t v16 = 1;
      }
      else {
        uint64_t v16 = 2;
      }
    }
    id v19 = [v8 serviceSession];
    unsigned int v20 = [v9 guid];
    int v21 = [v8 chat];
    id v22 = [v21 chatIdentifier];
    unsigned int v23 = +[NSDate __im_iMessageDateFromTimeStamp:0];
    CFStringRef v24 = [v8 imdAccount];
    [v19 didReceiveMessageSavedForMessageID:v20 ofType:v16 forChat:v22 fromHandle:v7 fromMe:v25 date:v23 account:v24 completionBlock:0];
  }
}

- (void)_handleIsMeToMeForMessage:(id)a3 withContext:(id)a4
{
  id v17 = a3;
  id v5 = a4;
  id v6 = [v5 messageDeliveryContext];
  if (![v6 fromMeToMe]) {
    goto LABEL_5;
  }
  id v7 = [v5 messageDeliveryContext];
  unsigned __int8 v8 = [v7 success];

  if ((v8 & 1) == 0)
  {
    id v9 = [v5 messageDeliveryContext];
    unsigned int v10 = [v9 error];

    if (v10 - 21 <= 1)
    {
      unsigned int v11 = [MessageDeliveryContext alloc];
      id v6 = [v5 messageDeliveryContext];
      unsigned __int8 v12 = [v6 displayIDs];
      id v13 = [v5 messageDeliveryContext];
      id v14 = [v13 fromMeToMe];
      CFStringRef v15 = [v5 messageDeliveryContext];
      uint64_t v16 = -[MessageDeliveryContext initWithDisplayIDs:didSucceed:error:isFromMeToMe:shouldDeactivate:isBackwardsCompatibleMessage:](v11, "initWithDisplayIDs:didSucceed:error:isFromMeToMe:shouldDeactivate:isBackwardsCompatibleMessage:", v12, 1, 0, v14, [v15 shouldDeactivate], objc_msgSend(v17, "backwardsCompatibleVersion"));
      [v5 setMessageDeliveryContext:v16];

LABEL_5:
    }
  }
}

- (void)_handleDeliveryFailureForMessage:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 messageDeliveryContext];
  unsigned int v8 = [v7 success];
  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      unsigned int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v37 = [v5 guid];
        char v38 = [v5 body];
        unsigned int v11 = [v38 string];
        MarcoLoggingStringForMessageData();
        id v12 = (id)objc_claimAutoreleasedReturnValue();
        id v13 = [v7 displayIDs];
        unsigned int v14 = [v7 error];
        CFStringRef v15 = [v6 groupMessageContext];
        unsigned int v16 = [v15 isGroupChat];
        unsigned int v17 = [v7 fromMeToMe];
        CFStringRef v18 = @"NO";
        *(_DWORD *)long long buf = 138413570;
        id v41 = v37;
        if (v16) {
          CFStringRef v19 = @"YES";
        }
        else {
          CFStringRef v19 = @"NO";
        }
        __int16 v42 = 2112;
        id v43 = v12;
        if (v17) {
          CFStringRef v18 = @"YES";
        }
        __int16 v44 = 2112;
        id v45 = v13;
        __int16 v46 = 1024;
        unsigned int v47 = v14;
        __int16 v48 = 2112;
        CFStringRef v49 = v19;
        __int16 v50 = 2112;
        CFStringRef v51 = v18;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Finished sending message: (guid: %@) %@ to people: %@ error: %d is chat: %@ from me - to me: %@", buf, 0x3Au);
      }
LABEL_36:
    }
  }
  else
  {
    if (v9)
    {
      unsigned int v20 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v21 = [v5 body];
        id v22 = [v21 string];
        MarcoLoggingStringForMessageData();
        id v23 = (id)objc_claimAutoreleasedReturnValue();
        id v24 = [v5 guid];
        id v25 = [v7 displayIDs];
        *(_DWORD *)long long buf = 138413058;
        id v41 = v23;
        __int16 v42 = 2112;
        id v43 = v24;
        __int16 v44 = 2112;
        id v45 = v25;
        __int16 v46 = 1024;
        unsigned int v47 = [v7 error];
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Failed sending message: %@  withGUID: %@  to people: %@   error: %d", buf, 0x26u);
      }
    }
    if ([v7 error] == 40)
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, " **********************************************************************************", buf, 2u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        id v27 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, " ************ INVALID LOCAL ENCRYPTION CREDENTIALS, DEACTIVATING SERVICE **********", buf, 2u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        __int16 v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, " **********************************************************************************", buf, 2u);
        }
      }
      id v29 = [MessageDeliveryContext alloc];
      __int16 v30 = [v7 displayIDs];
      CFStringRef v31 = -[MessageDeliveryContext initWithDisplayIDs:didSucceed:error:isFromMeToMe:shouldDeactivate:isBackwardsCompatibleMessage:](v29, "initWithDisplayIDs:didSucceed:error:isFromMeToMe:shouldDeactivate:isBackwardsCompatibleMessage:", v30, [v7 success], objc_msgSend(v7, "error"), objc_msgSend(v7, "fromMeToMe"), 1, objc_msgSend(v5, "backwardsCompatibleVersion"));
      [v6 setMessageDeliveryContext:v31];
    }
    int v32 = +[IMFeatureFlags sharedFeatureFlags];
    unsigned int v33 = [v32 isCarrierPigeonEnabled];

    if (v33 && [v5 needsRelay]) {
      IMSetDomainBoolForKey();
    }
    if (([v5 isTypingMessage] & 1) == 0 && IMOSLoggingEnabled())
    {
      unsigned int v10 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        id v34 = [v5 guid];
        unsigned int v35 = [v7 error];
        *(_DWORD *)long long buf = 138412546;
        id v41 = v34;
        __int16 v42 = 1024;
        LODWORD(v43) = v35;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Error sending message:%@ error: %d", buf, 0x12u);
      }
      goto LABEL_36;
    }
  }
  objc_msgSend(v5, "setErrorCode:", objc_msgSend(v7, "error"));
  if ([v5 scheduleType] == (char *)&dword_0 + 2 && objc_msgSend(v5, "errorCode")) {
    [(MessageServiceSession *)self _handleScheduledMessageSendFailure:v5];
  }
  id v36 = [v6 fromURI];
  [v5 setDestinationCallerID:v36];
}

- (void)_handleUpdateNotificationTimeManagerForMessage:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 notificationIDSTokenURI];
  unsigned int v8 = [v6 messageDeliveryContext];
  if (![v8 success] || (objc_msgSend(v5, "isTypingMessage") & 1) != 0)
  {

    goto LABEL_4;
  }
  id v24 = [v7 length];

  if (!v24)
  {
LABEL_4:
    int v9 = [v6 messageDeliveryContext];
    if ([v9 success])
    {
      unsigned __int8 v10 = [v5 isTypingMessage];

      if ((v10 & 1) == 0)
      {
        unsigned int v11 = +[IMMessageNotificationTimeManager sharedInstance];
        id v12 = [v6 chat];
        id v13 = [v12 chatIdentifier];
        [v11 tearDownSessionForChatIdentifier:v13];

        long long v36 = 0u;
        long long v37 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        unsigned int v14 = +[IMDChatRegistry sharedInstance];
        CFStringRef v15 = [v6 chat];
        unsigned int v16 = [v15 chatIdentifier];
        unsigned int v17 = [v6 chat];
        CFStringRef v18 = objc_msgSend(v14, "allExistingSupportedServiceChatsWithIdentifier:style:", v16, objc_msgSend(v17, "style"));

        id v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
        if (v19)
        {
          uint64_t v20 = *(void *)v35;
          do
          {
            int v21 = 0;
            do
            {
              if (*(void *)v35 != v20) {
                objc_enumerationMutation(v18);
              }
              id v22 = *(void **)(*((void *)&v34 + 1) + 8 * (void)v21);
              id v23 = [v5 guid];
              [v22 updateLastSeenMessageGuidIfNeeded:v23];

              int v21 = (char *)v21 + 1;
            }
            while (v19 != v21);
            id v19 = [v18 countByEnumeratingWithState:&v34 objects:v38 count:16];
          }
          while (v19);
        }
      }
    }
    else
    {
    }
    goto LABEL_21;
  }
  if (IMOSLoggingEnabled())
  {
    id v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      id v26 = [v5 guid];
      id v27 = [v6 chat];
      __int16 v28 = [v27 chatIdentifier];
      *(_DWORD *)long long buf = 138412802;
      id v40 = v26;
      __int16 v41 = 2112;
      __int16 v42 = v7;
      __int16 v43 = 2112;
      __int16 v44 = v28;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Successfully sent message, setting message item with guid %@ notificationIDSTokenURI %@ for chatIdentifier %@", buf, 0x20u);
    }
  }
  id v29 = +[IMMessageNotificationTimeManager sharedInstance];
  [v29 setLatestNotificationIDSTokenURI:v7];

  __int16 v30 = +[IMMessageNotificationTimeManager sharedInstance];
  CFStringRef v31 = +[NSDate date];
  int v32 = [v6 chat];
  unsigned int v33 = [v32 chatIdentifier];
  [v30 setDate:v31 forChatIdentifier:v33];

LABEL_21:
}

- (void)_deactivateServiceIfNeededForContext:(id)a3
{
  id v3 = a3;
  char v4 = [v3 messageDeliveryContext];
  unsigned int v5 = [v4 shouldDeactivate];

  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "*** Told to deactivate service, deactivating", buf, 2u);
      }
    }
    id v7 = +[IMRGLog registration];
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned int v14 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_DEFAULT, "***** Request to deactivate and purge my identity", v14, 2u);
    }

    unsigned int v8 = [v3 idsAccount];
    [v8 deactivateAndPurgeIdentify];

    int v9 = +[IMRGLog registration];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_DEFAULT, " => Deactivating", v13, 2u);
    }

    unsigned __int8 v10 = +[IMDAccountController sharedInstance];
    unsigned int v11 = [v3 imdAccount];
    id v12 = [v11 accountID];
    [v10 deactivateAccount:v12];
  }
}

- (void)_notifyDidSendMessage:(id)a3 withContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isTypingMessage])
  {
    unsigned int v8 = 1;
  }
  else
  {
    int v9 = +[IMDMessageStore sharedInstance];
    unsigned __int8 v10 = [v6 guid];
    unsigned int v8 = [v9 hasStoredMessageWithGUID:v10];
  }
  unsigned int v11 = [v7 messageDeliveryContext];
  unsigned int v12 = [v11 fromMeToMe] | v8;

  if (v12 == 1)
  {
    id v13 = [v7 messageDeliveryContext];
    unsigned int v14 = [v13 success];

    if (v14)
    {
      [(MessageServiceSession *)self _didSendMessage:v6 withContext:v7 forceDate:0 fromStorage:0];
      CFStringRef v15 = [v7 messageDeliveryContext];
      if ([v15 fromMeToMe])
      {
        unsigned int v16 = [v7 groupMessageContext];
        unsigned __int8 v17 = [v16 isGroupChat];

        if ((v17 & 1) == 0) {
          [(MessageServiceSession *)self _handleMessageSentToSelf:v6 withContext:v7 isLocal:1];
        }
      }
      else
      {
      }
      if ([v6 isFinished] && (objc_msgSend(v6, "isBeingRetried") & 1) == 0)
      {
        int v21 = [v7 serviceSession];
        id v22 = [v6 guid];
        id v23 = [v7 imdAccount];
        id v24 = [v7 messageDeliveryContext];
        objc_msgSend(v21, "notifyDidSendMessageID:account:shouldNotify:", v22, v23, objc_msgSend(v24, "isBackwardsCompatibleMessage") ^ 1);

        uint64_t v36 = IMMetricsCollectorAttachmentCount;
        id v25 = [v6 fileTransferGUIDs];
        id v26 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v25 count]);
        long long v37 = v26;
        id v27 = +[NSDictionary dictionaryWithObjects:&v37 forKeys:&v36 count:1];

        __int16 v28 = +[IMMetricsCollector sharedInstance];
        [v28 trackEvent:IMMetricsCollectorStatisticSentMessage withDictionary:v27];
      }
    }
    else
    {
      id v19 = [v7 messageDeliveryContext];
      int v20 = [v19 success];

      if ((v20 & 1) == 0) {
        [(MessageServiceSession *)self _didSendMessage:v6 withContext:v7 forceDate:0 fromStorage:0];
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    CFStringRef v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v34 = 138412290;
      id v35 = v6;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Not reflecting this to the application, this message looks like it was deleted: %@", (uint8_t *)&v34, 0xCu);
    }
  }
  id v29 = +[NSDate date];
  __int16 v30 = [v7 sendDate];
  [v29 timeIntervalSinceDate:v30];
  double v32 = v31;

  unsigned int v33 = +[NSNumber numberWithDouble:v32];
  [v7 setSendDuration:v33];
  [(MessageServiceSession *)self _FTAWDLogForMessage:v6 withContext:v7];
}

- (void)_handleMessageSentToSelf:(id)a3 withContext:(id)a4 isLocal:(BOOL)a5
{
  id v6 = a3;
  id v7 = a4;
  if ([v6 isFromMe] && (objc_msgSend(v6, "isTypingMessage") & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = [v7 chat];
        id v10 = [v9 chatIdentifier];
        unsigned int v11 = [v7 chat];
        *(_DWORD *)long long buf = 138412802;
        id v15 = v6;
        __int16 v16 = 2112;
        id v17 = v10;
        __int16 v18 = 1024;
        unsigned int v19 = [v11 style];
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Need to handle message sent to myself: %@   chat: %@  style: %d", buf, 0x1Cu);
      }
    }
    id v12 = v6;
    id v13 = v7;
    im_dispatch_after();
  }
}

- (BOOL)_isDeviceRegisteredForAccount:(id)a3
{
  return _[a3 canSend];
}

- (BOOL)_shouldInitiateTelephonyConversationForMessage:(id)a3
{
  id v3 = [a3 groupActivity];
  if (v3)
  {
    char v4 = +[IMFeatureFlags sharedFeatureFlags];
    unsigned __int8 v5 = [v4 isAVLessSharePlayEnabled];
  }
  else
  {
    unsigned __int8 v5 = 0;
  }

  return v5;
}

- (void)_initiateTelephonyConversationForMessage:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 onSession:(id)a6
{
  uint64_t v7 = a5;
  id v9 = a3;
  id v10 = a4;
  id v49 = a6;
  unsigned int v11 = [v9 groupActivity];

  if (v11)
  {
    id v12 = +[IMDChatRegistry sharedInstance];
    id v13 = [v12 existingiMessageChatForID:v10 withChatStyle:v7];

    if (v13)
    {
      __int16 v48 = [v13 participants];
      unsigned int v47 = objc_msgSend(v48, "__imArrayByApplyingBlock:", &stru_DFBC8);
      if ([v47 count])
      {
        unsigned int v14 = objc_msgSend(v47, "__imArrayByApplyingBlock:", &stru_DFC08);
        __int16 v46 = objc_msgSend(v14, "__imSetFromArray");

        id v15 = [v46 count];
        __int16 v16 = [v13 participants];
        id v17 = [v16 count];

        if (v15 == v17)
        {
          id v18 = [v46 count];
          unsigned int v19 = [objc_alloc((Class)TUJoinConversationRequest) initWithRemoteMembers:v46];
          if ((unint64_t)v18 >= 2)
          {
            id v20 = objc_alloc((Class)NSUUID);
            int v21 = [v13 groupID];
            id v22 = [v20 initWithUUIDString:v21];
            [v19 setMessagesGroupUUID:v22];

            id v23 = [v13 displayName];
            [v19 setMessagesGroupName:v23];
          }
          id v24 = +[TUConversationInvitationPreference invitationPreferencesForAllHandlesWithStyles:1];
          [v19 setInvitationPreferences:v24];

          id v25 = [v9 groupActivity];
          [v19 setActivity:v25];

          [v19 setAvMode:0];
          [v19 setPresentationMode:1];
          id v26 = [v13 lastAddressedLocalHandle];
          id v27 = +[TUHandle normalizedHandleWithDestinationID:v26];
          [v19 setCallerID:v27];

          __int16 v28 = +[TUCallCenter sharedInstance];
          [v28 launchAppForJoinRequest:v19];

          if (IMOSLoggingEnabled())
          {
            id v29 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              CFStringRef v51 = v19;
              _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Joining conversation with request %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            __int16 v30 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)long long buf = 138412290;
              CFStringRef v51 = v13;
              _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Distributing invitation message for chat %@", buf, 0xCu);
            }
          }
          double v31 = [v13 guid];
          [v49 invitePersonInfo:&off_E3A38 withMessage:0 toChatID:v31 identifier:v10 style:v7];

          if (IMOSLoggingEnabled())
          {
            double v32 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              unsigned int v33 = [v9 guid];
              *(_DWORD *)long long buf = 138412290;
              CFStringRef v51 = v33;
              _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "Message %@ being marked as sent", buf, 0xCu);
            }
          }
          objc_msgSend(v9, "setFlags:", (unint64_t)objc_msgSend(v9, "flags") | 0x8000);
          int v34 = [v49 broadcasterForChatListeners];
          id v35 = [v13 account];
          uint64_t v36 = [v35 accountID];
          long long v37 = [v13 groupID];
          char v38 = [v13 personCentricID];
          [v34 account:v36 chat:v10 style:v7 chatProperties:0 groupID:v37 chatPersonCentricID:v38 messageSent:v9];
        }
        else if (IMOSLoggingEnabled())
        {
          __int16 v44 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
          {
            id v45 = [v9 guid];
            *(_DWORD *)long long buf = 138412546;
            CFStringRef v51 = v45;
            __int16 v52 = 2112;
            CFStringRef v53 = v46;
            _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "Failed to generate TURemoteMembers while attempting to initiate TUConversation for msg guid %@ remote members %@", buf, 0x16u);
          }
        }
      }
      else if (IMOSLoggingEnabled())
      {
        __int16 v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          __int16 v43 = [v9 guid];
          *(_DWORD *)long long buf = 138412290;
          CFStringRef v51 = v43;
          _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "Failed to geenrate TUHandles while attempting to initiate TUConversation for msg guid %@", buf, 0xCu);
        }
      }
    }
    else if (IMOSLoggingEnabled())
    {
      id v40 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
      {
        __int16 v41 = [v9 guid];
        *(_DWORD *)long long buf = 138412290;
        CFStringRef v51 = v41;
        _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "Failed to find chat while attempting to initiate TUConversation for msg guid %@", buf, 0xCu);
      }
    }
LABEL_38:

    goto LABEL_39;
  }
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      long long v39 = [v9 guid];
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v51 = v39;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Failed to find group activity while attempting to initiate TUConversation for msg guid %@", buf, 0xCu);
    }
    goto LABEL_38;
  }
LABEL_39:
}

- (id)_buildSendMessageContextWithChatIdentifier:(id)a3 withChatStyle:(unsigned __int8)a4 withServiceSession:(id)a5 withMessage:(id)a6
{
  return [(MessageServiceSession *)self _buildSendMessageContextWithChatIdentifier:a3 withChatStyle:a4 withServiceSession:a5 withMessage:a6 destinations:0];
}

- (id)_buildSendMessageContextWithChatIdentifier:(id)a3 withChatStyle:(unsigned __int8)a4 withServiceSession:(id)a5 withMessage:(id)a6 destinations:(id)a7
{
  unsigned __int8 v51 = a4;
  id v11 = a5;
  id v12 = a6;
  id v48 = a7;
  id v50 = a3;
  id v13 = a3;
  [v11 canonicalizeChatIdentifier:&v50 style:&v51];
  id v14 = v50;

  if (v14)
  {
    id v15 = [v11 chatForChatIdentifier:v14 style:v51];
    id v49 = 0;
    unsigned int v47 = [(MessageServiceSession *)self _setCallerIDOnMessage:v12 onChat:v15 withIDSAccount:&v49 withServiceSession:v11];
    id v16 = v49;
    id v45 = [v11 idsServiceForIDSAccount:v16];
    id v17 = [v11 accounts];
    __int16 v46 = IMDAccountForIDSAccount(v16, v17, v11);

    _UpdateLastAddressedHandle(v12, v47, v15);
    [(MessageServiceSession *)self _fixParticipantsForChat:v15];
    id v18 = [v15 participants];
    unsigned int v19 = URIsFromHandles(v18);

    id v20 = v19;
    int v21 = v20;
    if ([v12 isBeingRetried])
    {
      id v22 = [v12 retryToParticipant];
      int v23 = IMOSLoggingEnabled();
      if (v22)
      {
        if (v23)
        {
          id v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)long long buf = 138412546;
            id v53 = v22;
            __int16 v54 = 2112;
            id v55 = v20;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Sending retry message only to participant %@, instead of %@", buf, 0x16u);
          }
        }
        long long v74 = v22;
        int v21 = +[NSArray arrayWithObjects:&v74 count:1];
      }
      else
      {
        int v21 = v20;
        if (v23)
        {
          id v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Sending retry message but couldn't find retryTo participant", buf, 2u);
          }

          int v21 = v20;
        }
      }
    }
    id v27 = +[IMFeatureFlags sharedFeatureFlags];
    unsigned __int8 v28 = [v27 isScheduledMessagesCoreEnabled];

    char v29 = v28 ^ 1;
    if (!v48) {
      char v29 = 1;
    }
    if ((v29 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        __int16 v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)long long buf = 138412546;
          id v53 = v48;
          __int16 v54 = 2112;
          id v55 = v21;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Sending message to participants %@ instead of %@", buf, 0x16u);
        }
      }
      uint64_t v31 = URIsFromHandles(v48);

      int v21 = (void *)v31;
    }
    if (IMOSLoggingEnabled())
    {
      double v32 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        long long v39 = self;
        __int16 v41 = [v12 body];
        id v40 = [v41 string];
        MarcoLoggingStringForMessageData();
        id v42 = (id)objc_claimAutoreleasedReturnValue();
        id v43 = [v12 guid];
        id v44 = [v12 associatedMessageGUID];
        id v38 = [v12 associatedMessageType];
        unsigned int v33 = (objc_class *)objc_opt_class();
        NSStringFromClass(v33);
        id v34 = (id)objc_claimAutoreleasedReturnValue();
        id v35 = [v12 fileTransferGUIDs];
        *(_DWORD *)long long buf = 138414850;
        id v53 = v42;
        __int16 v54 = 2112;
        id v55 = v43;
        __int16 v56 = 2112;
        id v57 = v14;
        __int16 v58 = 2112;
        uint64_t v59 = v15;
        __int16 v60 = 2112;
        id v61 = v47;
        __int16 v62 = 2112;
        uint64_t v63 = v39;
        __int16 v64 = 2112;
        uint64_t v65 = v46;
        __int16 v66 = 2112;
        id v67 = v44;
        __int16 v68 = 2048;
        id v69 = v38;
        __int16 v70 = 2112;
        id v71 = v34;
        __int16 v72 = 2112;
        long long v73 = v35;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "send message: %@  guid: %@  to identifier: %@   chat: %@   callerURI: %@   self: %@   account: %@ associatedMessageGUID: %@  associatedMessageType: %lld  messageItemClass: %@ fileTransferGUID %@", buf, 0x70u);
      }
    }
    id v25 = [[SendMessageContext alloc] initWithChat:v15 withIMDAccount:v46 withIDSAccount:v16 withCallerURI:v47 serviceSession:v11 withIDSService:v45 withParticipantURIs:v21 withOriginalParticipantURIs:v20];
    uint64_t v36 = +[NSDate date];
    [(SendMessageContext *)v25 setSendDate:v36];
  }
  else
  {
    id v25 = 0;
  }

  return v25;
}

- (void)_fixParticipantsForChat:(id)a3
{
  id v15 = a3;
  id v3 = [v15 participants];
  id v4 = [v3 count];

  if (!v4)
  {
    unsigned __int8 v5 = +[IMDAccountController sharedInstance];
    id v6 = +[IMDServiceController sharedController];
    uint64_t v7 = [v6 serviceWithName:IMServiceNameSMS];
    unsigned int v8 = [v5 accountsForService:v7];

    if ([v8 count])
    {
      id v9 = +[IMDChatRegistry sharedInstance];
      id v10 = [v15 chatIdentifier];
      id v11 = [v8 lastObject];
      id v12 = [v9 existingChatWithIdentifier:v10 account:v11];

      LODWORD(v9) = [v15 style];
      if (v9 == [v12 style])
      {
        id v13 = [v12 participants];

        if (v13)
        {
          id v14 = [v12 participants];
          [v15 addParticipants:v14];
        }
      }
    }
  }
  [v15 recoverParticipantsIfNeeded];
}

- (void)_storeSentMessage:(id)a3 withContext:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  unsigned int v8 = [v6 chat];
  id v9 = [v8 chatIdentifier];
  id v10 = [v6 chat];
  id v11 = [v10 style];
  id v12 = [v6 chat];

  id v13 = [v12 account];
  v14.receiver = self;
  v14.super_class = (Class)MessageServiceSession;
  [(MessageServiceSession *)&v14 sendMessage:v7 toChat:v9 style:v11 account:v13];
}

- (void)_handleScheduledMessageSendFailure:(id)a3
{
  id v8 = a3;
  id v4 = [v8 editedPartIndexes];
  if ([v4 count])
  {

LABEL_4:
    [v8 setErrorCode:0];
    id v7 = [(MessageServiceSession *)self deliveryController];
    [v7 handleScheduledMessageSendFailure:v8];
    goto LABEL_5;
  }
  unsigned __int8 v5 = [v8 retractedPartIndexes];
  id v6 = [v5 count];

  if (v6) {
    goto LABEL_4;
  }
  [v8 setScheduleState:4];
  id v7 = [v8 guid];
  +[IMDScheduledMessageCoordinator notifyPeersWithScheduledMessageUpdate:v7 scheduleState:4];
LABEL_5:
}

- (void)_startTimingMessageSend
{
}

- (void)_stopTimingMessageSend
{
}

- (void)_logCompletedMessage:(id)a3 withContext:(id)a4
{
  id v19 = a3;
  id v5 = a4;
  id v18 = +[IMPowerLog sharedInstance];
  id v17 = [v19 guid];
  id v15 = [v5 fromURI];
  id v16 = [v15 _stripFZIDPrefix];
  id v6 = [v5 groupMessageContext];
  unsigned __int8 v7 = [v6 isGroupChat];
  if (v7)
  {
    id v8 = @"Group";
  }
  else
  {
    id v8 = [v19 handle];
  }
  id v9 = [v5 chat];
  id v10 = [v9 powerLogConversationType];
  id v11 = [v19 powerLogMessageType];
  id v12 = [v5 sendDuration];
  id v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", [v19 errorCode]);
  objc_super v14 = [v19 service];
  [v18 logMessageSentWithGUID:v17 fromIdentifier:v16 toIdentifier:v8 conversationType:v10 messageType:v11 sendDuration:v12 errorCode:v13 messageProtocol:v14];

  if ((v7 & 1) == 0) {
}
  }

- (void)_FTAWDLogForMessage:(id)a3 withContext:(id)a4
{
  id v5 = a3;
  id v52 = a4;
  uint64_t v65 = IMMetricsCollectorError;
  id v53 = v5;
  id v6 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", sub_86344((uint64_t)[v5 errorCode]));
  __int16 v66 = v6;
  unsigned __int8 v7 = +[NSDictionary dictionaryWithObjects:&v66 forKeys:&v65 count:1];
  id v50 = [v7 mutableCopy];

  id v8 = +[IMMetricsCollector sharedInstance];
  [v8 trackEvent:IMMetricsCollectorEventOutgoingMessage withDictionary:v50];

  id v9 = [v53 isTypingMessage];
  id v10 = [v52 chat];
  unsigned int v11 = [v10 style];

  id v12 = [v53 handle];
  uint64_t IsEmail = IMStringIsEmail();

  objc_super v14 = [v53 fileTransferGUIDs];
  id v15 = [v14 count];

  if (([v53 isTypingMessage] & 1) == 0)
  {
    id v16 = [v52 sendDuration];
    BOOL v17 = v16 == 0;

    if (!v17)
    {
      if (IMOSLoggingEnabled())
      {
        id v18 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          id v19 = [v52 sendDuration];
          id v20 = [v53 guid];
          *(_DWORD *)long long buf = 138412546;
          id v62 = v19;
          __int16 v63 = 2112;
          __int16 v64 = v20;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Send Duration: %@ GUID %@", buf, 0x16u);
        }
      }
    }
  }
  int v21 = +[FTNetworkSupport sharedInstance];
  unsigned __int8 v22 = [v21 wiFiActiveAndReachable];

  if (v22)
  {
    uint64_t v23 = 2;
  }
  else
  {
    id v24 = +[FTNetworkSupport sharedInstance];
    unsigned int v25 = [v24 dataActiveAndReachable];

    if (v25) {
      uint64_t v23 = 8;
    }
    else {
      uint64_t v23 = 1;
    }
  }
  BOOL v49 = v15 != 0;
  BOOL v26 = v11 != 45;
  v59[0] = IMMetricsCollectorFzErrorKey;
  id v27 = +[NSNumber numberWithLong:](NSNumber, "numberWithLong:", [v53 errorCode]);
  v60[0] = v27;
  v59[1] = IMMetricsCollectorMessageErrorKey;
  unsigned __int8 v28 = +[NSNumber numberWithLong:0];
  v60[1] = v28;
  v59[2] = IMMetricsCollectorIsTypingIndicatorKey;
  char v29 = +[NSNumber numberWithBool:v9];
  v60[2] = v29;
  v59[3] = IMMetricsCollectorIsGroupMessageKey;
  __int16 v30 = +[NSNumber numberWithBool:v26];
  v60[3] = v30;
  v59[4] = IMMetricsCollectorIsToPhoneNumberKey;
  uint64_t v31 = +[NSNumber numberWithBool:IsEmail ^ 1];
  void v60[4] = v31;
  v59[5] = IMMetricsCollectorIsToEmailKey;
  double v32 = +[NSNumber numberWithInt:IsEmail];
  v60[5] = v32;
  v59[6] = IMMetricsCollectorHasAttachmentsKey;
  unsigned int v33 = +[NSNumber numberWithBool:v15 != 0];
  v60[6] = v33;
  v59[7] = IMMetricsCollectorSendDurationKey;
  id v34 = [v52 sendDuration];
  v60[7] = v34;
  v59[8] = IMMetricsCollectorConnectionTypeKey;
  id v35 = +[NSNumber numberWithLong:v23];
  v60[8] = v35;
  uint64_t v36 = +[NSDictionary dictionaryWithObjects:v60 forKeys:v59 count:9];
  id v51 = [v36 mutableCopy];

  if (v49)
  {
    long long v56 = 0u;
    long long v57 = 0u;
    long long v54 = 0u;
    long long v55 = 0u;
    long long v37 = [v53 fileTransferGUIDs];
    id v38 = [v37 countByEnumeratingWithState:&v54 objects:v58 count:16];
    if (v38)
    {
      uint64_t v39 = *(void *)v55;
      while (2)
      {
        for (i = 0; i != v38; i = (char *)i + 1)
        {
          if (*(void *)v55 != v39) {
            objc_enumerationMutation(v37);
          }
          uint64_t v41 = *(void *)(*((void *)&v54 + 1) + 8 * i);
          id v42 = +[IMDFileTransferCenter sharedInstance];
          id v43 = [v42 transferForGUID:v41];

          id v44 = [v43 type];
          if ([v44 length])
          {
            id v45 = +[UTType typeWithIdentifier:v44];
            if (v45 && ([UTTypeImage conformsToType:v45] & 1) != 0)
            {
              __int16 v46 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", +[IMDAttachmentUtilities shouldEnablePreviewTranscodingQualityForTransfer:v43 isSending:1]);
              [v51 setObject:v46 forKey:IMMetricsCollectorIsAttachmentSentWithLQMEnabledKey];

              goto LABEL_26;
            }
          }
        }
        id v38 = [v37 countByEnumeratingWithState:&v54 objects:v58 count:16];
        if (v38) {
          continue;
        }
        break;
      }
    }
LABEL_26:
  }
  unsigned int v47 = +[IMMetricsCollector sharedInstance];
  id v48 = [v51 copy];
  [v47 trackEvent:IMMetricsCollectorEventIMessageSentMessageSingleComponent withDictionary:v48];
}

- (void)calculateReachabilityWithRequest:(id)a3 responseHandler:(id)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  unsigned __int8 v7 = self;
  MessageServiceSession.calculateReachability(with:responseHandler:)(v6, (uint64_t)a4);

  swift_unknownObjectRelease();
}

@end