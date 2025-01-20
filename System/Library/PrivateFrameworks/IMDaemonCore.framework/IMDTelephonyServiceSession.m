@interface IMDTelephonyServiceSession
+ (id)createCompatibleBodyForMessage:(id)a3 processedMessageItem:(id)a4;
+ (id)getPlainTextForMessage:(id)a3 processedMessageItem:(id)a4;
+ (void)createFallbackTextForMessage:(id)a3 processedMessageItem:(id)a4 leadingFallbackText:(id)a5 trailingFallbackText:(id)a6;
- (BOOL)_allowedToGeneratePreviewForTransfer:(id)a3 smsMessage:(id)a4;
- (BOOL)_allowedToProcessMessageFromToken:(id)a3 fromID:(id)a4 reflectOnly:(BOOL)a5 isInProxyMode:(BOOL)a6;
- (BOOL)_canLocallySendWithPhoneNumber:(id)a3;
- (BOOL)_canSendWithCallerID:(id)a3;
- (BOOL)_disableScreenTimeRestrictionsForMessageItem:(id)a3 chat:(id)a4 watchSendsOverCellular:(BOOL)a5 emergencyNumbersFoundInRecipients:(int64_t *)a6;
- (BOOL)_isActiveServiceForRelay;
- (BOOL)_newFeatureRequiredByMessageItem:(id)a3 chatIdentifier:(id)a4;
- (BOOL)_replicationDisabledByServerBag;
- (BOOL)_replicationRequiredForFeaturesUsedByMessageBody:(id)a3;
- (BOOL)_sendMessageOverAlternatePath:(id)a3 toChat:(id)a4;
- (BOOL)_shouldFailSMSMessageForTesting:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5;
- (BOOL)_shouldForceReplicationForStaleChatWithLastKnownReplicationDate:(id)a3;
- (BOOL)_shouldReplicateMessageItem:(id)a3 chatStyle:(unsigned __int8)a4 lastKnownReplicationDate:(id)a5 callerID:(id)a6;
- (BOOL)_sosReplicationDisabledByServerBag;
- (BOOL)acceptsIncomingReplicatedMessagesFromAccount:(id)a3 toIdentifier:(id)a4 isSOS:(BOOL)a5;
- (BOOL)allowedToSendMessage:(id)a3 toChat:(id)a4;
- (BOOL)didReceiveMessages:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 fromIDSID:(id)a7;
- (BOOL)incomingMessageHasTooManyRecipients:(id)a3;
- (BOOL)isGroupMessagingEnabledFor:(id)a3;
- (BOOL)isOutgoingReplicationEnabled;
- (BOOL)isRegisteredForCTPhoneNumberNotifications;
- (BOOL)pendingOriginatedMessagesTimer;
- (BOOL)replicateMessage:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 lastKnownReplicationDate:(id)a6 callerID:(id)a7;
- (BOOL)replicationRequiredForFeaturesUsedByMessageItem:(id)a3;
- (BOOL)replicationRequiredForMessageBodyAttributeName:(id)a3;
- (BOOL)replicationRequiredForMultipleMessageParts;
- (BOOL)replicationRequirementsSatisfiedForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)responsibleForMessageID:(id)a3;
- (BOOL)shouldExcludeChatFromRelay:(id)a3;
- (IMDFilteringController)filteringController;
- (IMDPlainTextTapbackInterpreter)tapbackInterpreter;
- (IMDRelayAttachmentController)attachmentController;
- (IMDRelayEnrollmentController)relayEnrollmentController;
- (IMDRelayServiceController)relayController;
- (IMDTelephonyServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5;
- (IMMultiQueue)incomingMessageMultiQueue;
- (NSMutableDictionary)outgoingRelayMessageTimerMap;
- (NSMutableSet)originatedMessages;
- (double)_periodicReplicationTimeInterval;
- (id)_callerIDForChatWithChatIdentifier:(id)a3 chatStyle:(unsigned __int8)a4 foundChat:(id)a5;
- (id)_callerIDUsingFromIdentifier:(id)a3;
- (id)_chatForGroupID:(id)a3 originalGroupID:(id)a4;
- (id)_chatForSendingMessageItem:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5;
- (id)_countryCodeForIncomingTextMessage:(id)a3;
- (id)_extractSMSSenderAddress:(id)a3;
- (id)_messageDictionaryToRelayWithIncomingMessageDictionary:(id)a3 smsMessage:(id)a4;
- (id)_replicatedMessageGUIDToReleaseFromMessageDictionary:(id)a3;
- (id)_resolveHandlesFor:(id)a3 withMessage:(id)a4;
- (id)_updatedMessageContextForJunkProcessing:(id)a3;
- (id)chatForIncomingMessageContext:(id)a3 createIfNotExists:(BOOL)a4;
- (id)chatForOutgoingMessage:(id)a3 fromIdentifier:(id)a4 isInProxyMode:(BOOL)a5 createIfNotExists:(BOOL)a6;
- (id)chatRegistry;
- (id)compatibleMessageToSendForMessageItem:(id)a3;
- (id)createHandleInfoFor:(id)a3;
- (id)createHandleInfoForParticipants:(id)a3 unformattedIDs:(id)a4 countryCodes:(id)a5 isGroupChat:(BOOL)a6;
- (id)findChatAndLinkMessage:(id)a3 context:(id)a4;
- (id)getLabelFor:(int64_t)a3 subCategory:(int64_t)a4;
- (id)makeSenderFor:(id)a3 forChat:(id)a4 chatStyle:(unsigned __int8)a5 recipients:(id)a6;
- (id)outgoingReplicationCallerIDForChat:(id)a3;
- (id)preferredAccountForReplicationOnService:(id)a3 eligibleAccounts:(id)a4;
- (id)replicationPhoneNumbers;
- (id)subscriptionContextForChat:(id)a3;
- (int64_t)_iMessageCapabilityForSIMID:(id)a3;
- (int64_t)maxSizePerAttachmentWithCount:(int)a3 lastAddressHandle:(id)a4 lastAddressedSIMID:(id)a5;
- (unint64_t)_sendingDecisionForMessageItem:(id)a3 callerID:(id)a4 chat:(id)a5;
- (unint64_t)maxRecipientsForPhoneNumber:(id)a3 simID:(id)a4;
- (void)_addOriginatedMessage:(id)a3;
- (void)_carrierReportJunkMetricsForSMSWithSubject:(id)a3 isGroupchat:(BOOL)a4 hasAttachments:(BOOL)a5;
- (void)_clearInactivityTimer;
- (void)_clearTimoutTimerForRelayMessageID:(id)a3;
- (void)_deferredReplicatedMessageReleaseWithAllowedMessage:(id)a3 outgoingProxyBlock:(id)a4;
- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4;
- (void)_finishSendingMessageItem:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 foundChat:(id)a6 didSendSMS:(BOOL)a7 attemptingReplication:(BOOL)a8 shouldForceFail:(BOOL)a9 watchSendsOverCellular:(BOOL)a10 forceReflection:(BOOL)a11 callerID:(id)a12;
- (void)_generatePreviewForTransfer:(id)a3 message:(id)a4;
- (void)_markFromStorageIfNeeded:(id)a3 messageGUID:(id)a4;
- (void)_markMessageAsSent:(id)a3;
- (void)_markMessageAsSent:(id)a3 wasInterworked:(BOOL)a4;
- (void)_messageTimedOut:(id)a3;
- (void)_processReceivedDictionary:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 withCompletionBlock:(id)a6;
- (void)_processReceivedDictionaryInBlastDoor:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 withCompletionBlock:(id)a6;
- (void)_processReceivedSMSMessage:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 completionBlock:(id)a6;
- (void)_registerChatForIncomingMessageWithContext:(id)a3;
- (void)_registerForCTNotifications;
- (void)_registerForIncomingMessages:(id)a3;
- (void)_relayMessage:(id)a3 chat:(id)a4 didSendSMS:(BOOL)a5 attemptingReplication:(BOOL)a6 forceReflection:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 callerID:(id)a10;
- (void)_releasePendingMessagesAndProcessReceivedSMSMessage:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 completionBlock:(id)a6;
- (void)_removeOriginatedMessage:(id)a3;
- (void)_resetAndBroadcastBlackholeErrorStateIfNeededForChatIdentifier:(id)a3 chatStyle:(unsigned __int8)a4;
- (void)_setClearMessageSendTimer;
- (void)_setTimeoutTimerForRelayMessageID:(id)a3 timeout:(double)a4;
- (void)_setupCoreTelephonyObservation;
- (void)_teardownCoreTelephonyObservation;
- (void)_updateCategoryForChat:(id)a3 andMessage:(id)a4 category:(int64_t)a5 subCategory:(int64_t)a6 spamExtensionName:(id)a7;
- (void)_updateLastAddressedIDsIfNeededForChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6;
- (void)_updateLastAddressedIDsIfNeededForChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6 iMessageCapability:(int64_t)a7;
- (void)_updatePhoneNumberCallerID;
- (void)_updateShouldForceToSMSForChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 shouldForceToSMS:(BOOL)a5;
- (void)didReceiveDisplayNameChange:(id)a3 guid:(id)a4 fromID:(id)a5 toIdentifier:(id)a6 forChat:(id)a7 style:(unsigned __int8)a8 account:(id)a9;
- (void)didReceiveDisplayNameChange:(id)a3 guid:(id)a4 fromID:(id)a5 toIdentifier:(id)a6 forChat:(id)a7 style:(unsigned __int8)a8 account:(id)a9 shouldRelay:(BOOL)a10;
- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 forceDate:(id)a7 itemIsComingFromStorage:(BOOL)a8;
- (void)enrollDeviceInSMSRelay:(id)a3;
- (void)enrollSelfDeviceInSMSRelay;
- (void)handler:(id)a3 incomingDownloadMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 storageContext:(id)a9;
- (void)handler:(id)a3 incomingGroupMutationMessage:(id)a4 timeStamp:(id)a5 storageContext:(id)a6 fromToken:(id)a7 fromID:(id)a8 isInProxyMode:(BOOL)a9;
- (void)handler:(id)a3 incomingPlainTextMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 storageContext:(id)a9;
- (void)handler:(id)a3 localFileRequest:(id)a4 storageContext:(id)a5;
- (void)handler:(id)a3 localFileResponse:(id)a4 storageContext:(id)a5;
- (void)handler:(id)a3 localIncomingDownloadMessage:(id)a4 storageContext:(id)a5;
- (void)handler:(id)a3 localIncommingMessage:(id)a4 storageContext:(id)a5;
- (void)handler:(id)a3 localMessageError:(id)a4 storageContext:(id)a5;
- (void)handler:(id)a3 localMessageRead:(id)a4 readByMe:(BOOL)a5 timeStamp:(id)a6 storageContext:(id)a7;
- (void)handler:(id)a3 localMessageSent:(id)a4 wasInterworked:(BOOL)a5 storageContext:(id)a6;
- (void)handler:(id)a3 localOutgoingDownloadMessage:(id)a4 isBeingReplayed:(BOOL)a5 storageContext:(id)a6;
- (void)handler:(id)a3 localOutgoingMessage:(id)a4 isBeingReplayed:(BOOL)a5 storageContext:(id)a6;
- (void)handler:(id)a3 messageIDRead:(id)a4 readByMe:(BOOL)a5 timeStamp:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 fromToken:(id)a9 reflectOnly:(BOOL)a10 storageContext:(id)a11;
- (void)handler:(id)a3 messageIDSendFailure:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timeStamp:(id)a7 storageContext:(id)a8;
- (void)handler:(id)a3 messageIDSent:(id)a4 wasInterworked:(BOOL)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 timeStamp:(id)a8 storageContext:(id)a9;
- (void)handler:(id)a3 outgoingDownloadMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 isBeingReplayed:(BOOL)a10 isInProxyMode:(BOOL)a11 storageContext:(id)a12;
- (void)handler:(id)a3 outgoingPlainTextMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 isBeingReplayed:(BOOL)a10 isInProxyMode:(BOOL)a11 storageContext:(id)a12;
- (void)handler:(id)a3 outgoingPlainTextMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 isBeingReplayed:(BOOL)a10 storageContext:(id)a11;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 joinProperties:(id)a7;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 joinProperties:(id)a9;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 joinProperties:(id)a6;
- (void)loginServiceSessionWithAccount:(id)a3;
- (void)logoutServiceSessionWithAccount:(id)a3;
- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 completionBlock:(id)a7;
- (void)processMessageSendFailure:(id)a3;
- (void)relayDisplayNameChange:(id)a3 forChat:(id)a4 fromID:(id)a5 messageID:(id)a6 didOccurLocally:(BOOL)a7;
- (void)retryGroupPhotoUpload:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8;
- (void)sendDeleteCommand:(id)a3 forChatGUID:(id)a4;
- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10;
- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6;
- (void)sendMessageFromIMMessageItem:(id)a3 forChat:(id)a4 chat:(id)a5 style:(unsigned __int8)a6;
- (void)sendRecoverCommand:(id)a3 forChatGUID:(id)a4;
- (void)sendRepositionStickerMessage:(id)a3 chatIdentifier:(id)a4 accountID:(id)a5 style:(unsigned __int8)a6;
- (void)sendUnapproveToToken:(id)a3 messageGUID:(id)a4 completion:(id)a5;
- (void)setAttachmentController:(id)a3;
- (void)setIncomingMessageMultiQueue:(id)a3;
- (void)setIsRegisteredForCTPhoneNumberNotifications:(BOOL)a3;
- (void)setOriginatedMessages:(id)a3;
- (void)setOutgoingRelayMessageTimerMap:(id)a3;
- (void)setPendingOriginatedMessagesTimer:(BOOL)a3;
- (void)setRelayController:(id)a3;
- (void)setRelayEnrollmentController:(id)a3;
- (void)setServiceCompatibleContentOn:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 from:(id)a6 completionBlock:(id)a7;
- (void)unEnrollDeviceInSMSRelay:(id)a3;
- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9;
- (void)waitForChatRelayReadiness:(id)a3 withBlock:(id)a4;
@end

@implementation IMDTelephonyServiceSession

+ (id)getPlainTextForMessage:(id)a3 processedMessageItem:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  v8 = [a1 createCompatibleBodyForMessage:v7 processedMessageItem:v6];
  id v9 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  id v10 = objc_alloc_init(MEMORY[0x1E4F28E78]);
  [a1 createFallbackTextForMessage:v7 processedMessageItem:v6 leadingFallbackText:v9 trailingFallbackText:v10];

  v11 = [NSString stringWithFormat:@"%@%@%@", v9, v8, v10];

  return v11;
}

+ (id)createCompatibleBodyForMessage:(id)a3 processedMessageItem:(id)a4
{
  v4 = [a3 body];
  v5 = +[IMDFileTransferCenter sharedInstance];
  aBlock[0] = MEMORY[0x1E4F143A8];
  aBlock[1] = 3221225472;
  aBlock[2] = sub_1D96F6E64;
  aBlock[3] = &unk_1E6B73628;
  id v14 = v5;
  id v6 = v5;
  id v7 = _Block_copy(aBlock);
  uint64_t v12 = 0;
  v8 = objc_msgSend(v4, "__im_attributedStringByReplacingAdaptiveImageGlyphFileTransfersUsingFileTransferProvider:replacementTextProvider:removedTransferGUIDsOut:", v7, &unk_1F3390C00, &v12);
  id v9 = [v8 string];
  id v10 = [v9 stringByReplacingOccurrencesOfString:*MEMORY[0x1E4F6C110] withString:&stru_1F3398578];

  return v10;
}

+ (void)createFallbackTextForMessage:(id)a3 processedMessageItem:(id)a4 leadingFallbackText:(id)a5 trailingFallbackText:(id)a6
{
  uint64_t v28 = *MEMORY[0x1E4F143B8];
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  v13 = [v10 expressiveSendStyleID];
  uint64_t v14 = [v13 length];

  if (v14)
  {
    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        v16 = [v10 guid];
        *(_DWORD *)buf = 138412290;
        v27 = v16;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Appending expressive send style id for message %@", buf, 0xCu);
      }
    }
    v17 = [v9 _localizedBackwardsCompatibleExpressiveSendText];
    if ([v17 length]) {
      [v12 appendFormat:@"\n%@", v17];
    }
  }
  v18 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v19 = [v18 isPriusCompatibilityEnabled];

  if (v19)
  {
    v20 = [v10 threadIdentifier];
    BOOL v21 = [v20 length] == 0;

    if (!v21)
    {
      if (IMOSLoggingEnabled())
      {
        v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          v23 = [v10 guid];
          *(_DWORD *)buf = 138412290;
          v27 = v23;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Formatting plain text reply message for message %@", buf, 0xCu);
        }
      }
      v24 = IMSharedUtilitiesFrameworkBundle();
      v25 = [v24 localizedStringForKey:@"REPLIED_BACKWARD_COMPATIBILITY" value:&stru_1F3398578 table:@"IMSharedUtilities"];
      [v11 appendFormat:@"%@\n", v25];
    }
  }
}

- (IMDTelephonyServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v16.receiver = self;
  v16.super_class = (Class)IMDTelephonyServiceSession;
  id v11 = [(IMDServiceSession *)&v16 initWithAccount:v8 service:v9 replicatingForSession:v10];
  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Setting up base telephony service", v15, 2u);
      }
    }
    v13 = [[IMDRelayAttachmentController alloc] initWithSession:v11];
    [(IMDTelephonyServiceSession *)v11 setAttachmentController:v13];

    [(IMDTelephonyServiceSession *)v11 _updatePhoneNumberCallerID];
    [(IMDTelephonyServiceSession *)v11 _setupCoreTelephonyObservation];
  }

  return v11;
}

- (IMDPlainTextTapbackInterpreter)tapbackInterpreter
{
  tapbackInterpreter = self->_tapbackInterpreter;
  if (!tapbackInterpreter)
  {
    v4 = objc_alloc_init(IMDPlainTextTapbackInterpreter);
    v5 = self->_tapbackInterpreter;
    self->_tapbackInterpreter = v4;

    tapbackInterpreter = self->_tapbackInterpreter;
  }

  return tapbackInterpreter;
}

- (IMDFilteringController)filteringController
{
  return +[IMDFilteringController sharedInstance];
}

- (void)_updatePhoneNumberCallerID
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v18) = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Updating", (uint8_t *)&v18, 2u);
    }
  }
  v4 = [MEMORY[0x1E4F6E668] sharedInstance];
  v5 = [v4 ctPhoneNumber];
  id v6 = (void *)[v5 copy];

  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      int v19 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Default phone number from telephony is: %@", (uint8_t *)&v18, 0xCu);
    }
  }
  if (!v6)
  {
    id v8 = [(IMDTelephonyServiceSession *)self relayController];
    id v9 = [v8 dominentPhoneNumberAlias];
    id v6 = (void *)[v9 copy];

    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        int v19 = v6;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "No phone number from telephony, adopting relay phone number %@", (uint8_t *)&v18, 0xCu);
      }
    }
    if (!v6) {
      id v6 = (void *)[&stru_1F3398578 copy];
    }
  }
  id v11 = [MEMORY[0x1E4F6C3B8] registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412290;
    int v19 = v6;
    _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_DEFAULT, "Updating SMS service with number: %@", (uint8_t *)&v18, 0xCu);
  }

  id v12 = [(IMDServiceSession *)self account];
  v13 = (void *)MEMORY[0x1E4F1C9E8];
  uint64_t v14 = IMGenerateLoginID();
  v15 = [v13 dictionaryWithObject:v14 forKey:*MEMORY[0x1E4F6C738]];
  [v12 writeAccountDefaults:v15];

  objc_super v16 = [(IMDServiceSession *)self account];
  v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObject:v6 forKey:*MEMORY[0x1E4F6C708]];
  [v16 writeAccountDefaults:v17];
}

- (id)_callerIDUsingFromIdentifier:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if ([v3 hasPrefix:@"device:"])
  {
    v4 = 0;
  }
  else
  {
    v4 = [v3 _stripFZIDPrefix];
    if (IMOSLoggingEnabled())
    {
      v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v4;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Stripping FZIDPrefix, after: %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }

  return v4;
}

- (void)loginServiceSessionWithAccount:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = self;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "SMS: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [(IMDServiceSession *)self refreshServiceCapabilities];
  [(IMDServiceSession *)self serviceSessionDidLoginWithAccount:v4];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = self;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "%@: Log in.", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)logoutServiceSessionWithAccount:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = self;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "SMS: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  if ([v4 loginStatus] != 2)
  {
    [v4 setLoginStatus:0 message:0];
    [(IMDServiceSession *)self serviceSessionDidLogoutWithAccount:v4];
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = self;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "%@: Logging out.", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (id)compatibleMessageToSendForMessageItem:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 balloonBundleID];
  v5 = IMBalloonExtensionIDWithSuffix();
  int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    int v7 = IMExtensionPayloadUnarchivingClasses();
    id v8 = objc_alloc(MEMORY[0x1E4F28DC0]);
    uint64_t v9 = [v3 payloadData];
    id v31 = 0;
    id v10 = (void *)[v8 initForReadingFromData:v9 error:&v31];
    id v11 = v31;

    id v12 = [v10 decodeObjectOfClasses:v7 forKey:*MEMORY[0x1E4F284E8]];
    if (v11 && IMOSLoggingEnabled())
    {
      v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v11;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Failed to unarchive attributionInfo. Error: %@", buf, 0xCu);
      }
    }
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      uint64_t v14 = [v12 objectForKey:*MEMORY[0x1E4F6D2D8]];
      v15 = [v14 objectForKey:@"messageText"];
      BOOL v16 = v15 == 0;

      if (!v16)
      {
        id v17 = objc_alloc(MEMORY[0x1E4F28E48]);
        int v18 = [v14 objectForKey:@"messageText"];
        int v19 = (void *)[v17 initWithString:v18];

        if (v19)
        {
          id v29 = objc_alloc(MEMORY[0x1E4F6E850]);
          v30 = [v3 sender];
          uint64_t v20 = [v3 time];
          uint64_t v21 = [v3 flags];
          v22 = [v3 guid];
          id v23 = (id)[v29 initWithSender:v30 time:v20 body:v19 attributes:0 fileTransferGUIDs:0 flags:v21 error:0 guid:v22 threadIdentifier:0];

          if (IMOSLoggingEnabled())
          {
            v24 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              v25 = [v23 guid];
              *(_DWORD *)buf = 138412290;
              id v33 = v25;
              _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Sending activity sharing fallback for message %@", buf, 0xCu);
            }
          }
          char v26 = 0;
          goto LABEL_23;
        }
      }
    }
    else
    {
      uint64_t v14 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      v27 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "Activity sharing payload doesn't have message text to send. Bailing", buf, 2u);
      }
    }
    id v23 = v3;
    int v19 = 0;
    char v26 = 1;
LABEL_23:

    if (v26) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  id v23 = v3;
LABEL_24:
  id v23 = v23;
  id v3 = v23;
LABEL_25:

  return v3;
}

- (BOOL)allowedToSendMessage:(id)a3 toChat:(id)a4
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 chatIdentifier];
  LODWORD(self) = [(IMDTelephonyServiceSession *)self _newFeatureRequiredByMessageItem:v6 chatIdentifier:v8];

  if (self)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [v6 guid];
        int v19 = 138412290;
        uint64_t v20 = v10;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, " ** New Feature, and backwards compat is not enabled for message %@", (uint8_t *)&v19, 0xCu);
      }
    }
    [v6 setErrorCode:5];
  }
  else
  {
    id v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v13 = [v12 isScheduledMessagesCoreEnabled];

    if (!v13 || (unint64_t)([v6 scheduleType] - 1) > 1)
    {
      BOOL v11 = 1;
      goto LABEL_16;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v14 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        v15 = [v6 guid];
        int v19 = 138412290;
        uint64_t v20 = v15;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Received attempt to send a scheduled message through the telephony service session, message guid: %@", (uint8_t *)&v19, 0xCu);
      }
    }
    [v6 setErrorCode:5];
    [v6 setScheduleState:4];
    BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F28C58]) initWithDomain:@"com.apple.messages.TelephonyServiceSessionSendFailure" code:5 userInfo:0];
    id v17 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v17 forceAutoBugCaptureWithSubType:@"Invalid scheduled message send" errorPayload:v16];
  }
  BOOL v11 = 0;
LABEL_16:

  return v11;
}

- (BOOL)_newFeatureRequiredByMessageItem:(id)a3 chatIdentifier:(id)a4
{
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  uint64_t v7 = [v5 associatedMessageType];
  if (v7 != 2006 && v7 != 3006)
  {
    uint64_t v8 = [v5 associatedMessageType];
    if (v8 != 3007 && v8 != 2007) {
      goto LABEL_14;
    }
  }
  id v9 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v10 = [v9 objectForKey:@"backwards-compat-enabled-etap"];
  BOOL v11 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v12 = [v11 isInternalInstall];

  if (v12)
  {
    int v13 = [MEMORY[0x1E4F1CB18] messagesAppDomain];
    uint64_t v14 = [v13 arrayForKey:@"chat-id-allow-list"];

    if ([v14 containsObject:v6])
    {
      if (IMOSLoggingEnabled())
      {
        v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v6;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Ignoring backwards compat check and allowing sending message to %@", buf, 0xCu);
        }
      }
      goto LABEL_25;
    }
  }
  int v16 = [v10 BOOLValue];

  if (v16)
  {
LABEL_14:
    id v17 = [v5 fileTransferGUIDs];
    id v10 = +[IMDFileTransferCenter sharedInstance];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = v17;
    uint64_t v18 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v18)
    {
      uint64_t v19 = *(void *)v29;
LABEL_16:
      uint64_t v20 = 0;
      while (1)
      {
        if (*(void *)v29 != v19) {
          objc_enumerationMutation(v9);
        }
        uint64_t v21 = objc_msgSend(v10, "transferForGUID:", *(void *)(*((void *)&v28 + 1) + 8 * v20), (void)v28);
        char v22 = [v21 isAdaptiveImageGlyph];

        if (v22) {
          break;
        }
        if (v18 == ++v20)
        {
          uint64_t v18 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v18) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }

      v24 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
      v25 = [v24 objectForKey:@"backwards-compat-enabled-adaptive-image-glyphs"];
      char v26 = [v25 BOOLValue];

      if (v26) {
        goto LABEL_25;
      }
      BOOL v23 = 1;
      goto LABEL_27;
    }
LABEL_22:

LABEL_25:
    BOOL v23 = 0;
LABEL_27:

    goto LABEL_28;
  }
  BOOL v23 = 1;
LABEL_28:

  return v23;
}

- (BOOL)_shouldFailSMSMessageForTesting:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5
{
  return 0;
}

- (id)_chatForSendingMessageItem:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5
{
  v7.receiver = self;
  v7.super_class = (Class)IMDTelephonyServiceSession;
  id v5 = [(IMDServiceSession *)&v7 chatForChatIdentifier:a4 style:a5];

  return v5;
}

- (void)_markMessageAsSent:(id)a3
{
}

- (void)_markMessageAsSent:(id)a3 wasInterworked:(BOOL)a4
{
  BOOL v4 = a4;
  originatedMessages = self->_originatedMessages;
  id v7 = a3;
  if (-[NSMutableSet containsObject:](originatedMessages, "containsObject:"))
  {
    [(IMDTelephonyServiceSession *)self _clearTimoutTimerForRelayMessageID:v7];
    [(IMDServiceSession *)self notifyDidSendMessageID:v7 account:0 shouldNotify:1 wasDowngraded:0 wasInterworked:v4];
    [(IMDTelephonyServiceSession *)self _removeOriginatedMessage:v7];
  }
  else
  {
    [(IMDServiceSession *)self notifyDidSendMessageID:v7 account:0 shouldNotify:0 wasDowngraded:0 wasInterworked:v4];
    [(IMDTelephonyServiceSession *)self _clearTimoutTimerForRelayMessageID:v7];
  }
}

- (void)_updateLastAddressedIDsIfNeededForChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6
{
}

- (void)_updateLastAddressedIDsIfNeededForChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6 iMessageCapability:(int64_t)a7
{
  uint64_t v10 = a4;
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v50 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v11 length] || objc_msgSend(v12, "length"))
  {
    int64_t v52 = a7;
    int v13 = +[IMDChatRegistry sharedInstance];
    uint64_t v14 = [v13 allExistingSupportedServiceChatsWithIdentifier:v50 style:v10];

    if (IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v60 = v50;
        __int16 v61 = 1024;
        *(_DWORD *)v62 = v10;
        *(_WORD *)&v62[4] = 2112;
        *(void *)&v62[6] = v11;
        *(_WORD *)&v62[14] = 2112;
        *(void *)&v62[16] = v12;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Checking if chats with chatIdentifier %@ and style %hhu need to have their last addressed handle updated to %@ or their last addressed sim id updated to %@", buf, 0x26u);
      }
    }
    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v14;
    int v16 = 0;
    int v17 = 0;
    uint64_t v18 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
    if (v18)
    {
      v53 = 0;
      uint64_t v54 = *(void *)v56;
      while (1)
      {
        for (uint64_t i = 0; i != v18; ++i)
        {
          if (*(void *)v56 != v54) {
            objc_enumerationMutation(obj);
          }
          uint64_t v20 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          uint64_t v21 = [v20 chatIdentifier];
          BOOL v22 = [v21 length] == 0;

          if (!v22)
          {
            if ([v12 length])
            {
              BOOL v23 = [v20 lastAddressedSIMID];
              int v24 = [v23 isEqualToString:v12];

              int v25 = v24 ^ 1;
            }
            else
            {
              int v25 = 0;
            }
            char v26 = [v20 lastAddressedLocalHandle];
            char v27 = MEMORY[0x1E0169E10](v26, v11);

            if ((v27 & 1) == 0)
            {
              if ([v11 length]
                || ([v20 serviceName],
                    long long v28 = objc_claimAutoreleasedReturnValue(),
                    int v29 = [v28 isEqualToString:*MEMORY[0x1E4F6E1B0]],
                    v28,
                    !v29))
              {
                int v16 = 1;
              }
              else if (IMOSLoggingEnabled())
              {
                long long v30 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Last address handle is nil, not updating iMessage to nil last addressed handle", buf, 2u);
                }
              }
            }
            v17 |= v25;
            if (v17 & v16)
            {
              if (IMOSLoggingEnabled())
              {
                long long v31 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                {
                  id v32 = [v20 guid];
                  id v33 = [v20 lastAddressedLocalHandle];
                  *(_DWORD *)buf = 138413058;
                  id v60 = v32;
                  __int16 v61 = 2112;
                  *(void *)v62 = v11;
                  *(_WORD *)&v62[8] = 2112;
                  *(void *)&v62[10] = v33;
                  *(_WORD *)&v62[18] = 2112;
                  *(void *)&v62[20] = v12;
                  _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "  ** Updating both caller ID for chat with guid %@ to be: %@ from %@ and sim ID to be: %@", buf, 0x2Au);
                }
              }
              [v20 updateLastAddressedHandle:v11 forceUpdateHandle:0 lastAddressedSIMID:v12];
            }
            else if (v17)
            {
              if (IMOSLoggingEnabled())
              {
                id v34 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
                {
                  uint64_t v35 = [v20 guid];
                  *(_DWORD *)buf = 138412546;
                  id v60 = v35;
                  __int16 v61 = 2112;
                  *(void *)v62 = v12;
                  _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "  ** Updating sim ID for chat with guid %@ to be: %@", buf, 0x16u);
                }
              }
              [v20 updateLastAddressedSIMID:v12];
            }
            else if (v16)
            {
              if (IMOSLoggingEnabled())
              {
                v36 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
                {
                  id v37 = [v20 guid];
                  v38 = [v20 lastAddressedLocalHandle];
                  *(_DWORD *)buf = 138412802;
                  id v60 = v37;
                  __int16 v61 = 2112;
                  *(void *)v62 = v11;
                  *(_WORD *)&v62[8] = 2112;
                  *(void *)&v62[10] = v38;
                  _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_INFO, "  ** Updating caller ID for chat with guid %@ to be: %@ from %@", buf, 0x20u);
                }
              }
              [v20 updateLastAddressedHandle:v11];
            }
            v39 = [v20 serviceName];
            int v40 = [v39 isEqualToString:*MEMORY[0x1E4F6E1A0]];

            if (v40)
            {
              id v41 = v20;

              v53 = v41;
            }
            if (v52 == 2)
            {
              if (IMOSLoggingEnabled())
              {
                v45 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  v46 = [v20 guid];
                  *(_DWORD *)buf = 138412290;
                  id v60 = v46;
                  _os_log_impl(&dword_1D967A000, v45, OS_LOG_TYPE_INFO, "Updating chat with guid %@ to have shouldForceToSMS = YES", buf, 0xCu);
                }
              }
              uint64_t v44 = 1;
            }
            else
            {
              if (v52 != 1) {
                continue;
              }
              if (IMOSLoggingEnabled())
              {
                v42 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                {
                  v43 = [v20 guid];
                  *(_DWORD *)buf = 138412290;
                  id v60 = v43;
                  _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "Updating chat with guid %@ to have shouldForceToSMS = NO", buf, 0xCu);
                }
              }
              uint64_t v44 = 0;
            }
            [v20 updateShouldForceToSMS:v44];
          }
        }
        uint64_t v18 = [obj countByEnumeratingWithState:&v55 objects:v63 count:16];
        if (!v18) {
          goto LABEL_61;
        }
      }
    }
    v53 = 0;
LABEL_61:

    if (!(v16 & 1 | ((IMSharedHelperDeviceHasMultipleSubscriptions() & v17 & 1) == 0)) && v53)
    {
      if (IMOSLoggingEnabled())
      {
        v47 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          v48 = [v53 guid];
          *(_DWORD *)buf = 138412546;
          id v60 = v48;
          __int16 v61 = 2112;
          *(void *)v62 = v12;
          _os_log_impl(&dword_1D967A000, v47, OS_LOG_TYPE_INFO, "Updated simID on chat %@ to %@ but phoneNumber is nil so force updating IMChat to have nil lastAddressedHandle", buf, 0x16u);
        }
      }
      [v53 updateLastAddressedHandle:0 forceUpdate:1];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    v49 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v60 = v50;
      __int16 v61 = 1024;
      *(_DWORD *)v62 = v10;
      _os_log_impl(&dword_1D967A000, v49, OS_LOG_TYPE_INFO, "Not updating chats with identifier %@ and style %hhu as both last addressed handle and last addressed sim id are nil", buf, 0x12u);
    }
  }
}

- (BOOL)didReceiveMessages:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 fromIDSID:(id)a7
{
  unsigned int v35 = a5;
  uint64_t v52 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v40 = a6;
  id v36 = a7;
  id v12 = +[IMDChatRegistry sharedInstance];
  id v37 = v11;
  v39 = [v12 existingChatWithGUID:v11];

  long long v48 = 0u;
  long long v49 = 0u;
  long long v46 = 0u;
  long long v47 = 0u;
  id obj = v10;
  uint64_t v13 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
  if (v13)
  {
    uint64_t v14 = v13;
    uint64_t v15 = *(void *)v47;
    do
    {
      for (uint64_t i = 0; i != v14; ++i)
      {
        if (*(void *)v47 != v15) {
          objc_enumerationMutation(obj);
        }
        int v17 = *(void **)(*((void *)&v46 + 1) + 8 * i);
        uint64_t v18 = [v40 service];
        uint64_t v19 = [v18 internalName];

        uint64_t v20 = [MEMORY[0x1E4F6E8F0] sharedInstance];
        uint64_t v21 = [v17 guid];
        BOOL v22 = [v17 sender];
        BOOL v23 = [v17 destinationCallerID];
        objc_msgSend(v20, "logMessageReceivedWithGUID:fromIdentifier:toIdentifier:conversationType:messageType:messageProtocol:", v21, v22, v23, objc_msgSend(v39, "powerLogConversationType"), objc_msgSend(v17, "powerLogMessageType"), v19);
      }
      uint64_t v14 = [obj countByEnumeratingWithState:&v46 objects:v51 count:16];
    }
    while (v14);
  }

  v45.receiver = self;
  v45.super_class = (Class)IMDTelephonyServiceSession;
  BOOL v24 = [(IMDServiceSession *)&v45 didReceiveMessages:obj forChat:v37 style:v35 account:v40 fromIDSID:v36];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id v25 = obj;
  uint64_t v26 = [v25 countByEnumeratingWithState:&v41 objects:v50 count:16];
  if (v26)
  {
    uint64_t v27 = v26;
    uint64_t v28 = *(void *)v42;
    do
    {
      for (uint64_t j = 0; j != v27; ++j)
      {
        if (*(void *)v42 != v28) {
          objc_enumerationMutation(v25);
        }
        long long v30 = *(void **)(*((void *)&v41 + 1) + 8 * j);
        long long v31 = +[IMDRelayPushHandler sharedInstance];
        id v32 = [v30 guid];
        [v31 _handleMessageProcessedWithGUID:v32];
      }
      uint64_t v27 = [v25 countByEnumeratingWithState:&v41 objects:v50 count:16];
    }
    while (v27);
  }

  return v24;
}

- (void)didSendMessage:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6 forceDate:(id)a7 itemIsComingFromStorage:(BOOL)a8
{
  unsigned int v28 = a5;
  id v27 = a7;
  id v26 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = +[IMDChatRegistry sharedInstance];
  BOOL v24 = [v13 existingChatWithGUID:v11];

  uint64_t v14 = [v12 service];
  uint64_t v15 = [MEMORY[0x1E4F6E8F0] sharedInstance];
  int v16 = [v12 guid];
  int v17 = [v12 sender];
  uint64_t v18 = [v12 destinationCallerID];
  uint64_t v19 = [v24 powerLogConversationType];
  uint64_t v20 = [v12 powerLogMessageType];
  uint64_t v21 = objc_msgSend(NSNumber, "numberWithUnsignedInt:", objc_msgSend(v12, "errorCode"));
  [v15 logMessageSentWithGUID:v16 fromIdentifier:v17 toIdentifier:v18 conversationType:v19 messageType:v20 sendDuration:0 errorCode:v21 messageProtocol:v14];

  v29.receiver = self;
  v29.super_class = (Class)IMDTelephonyServiceSession;
  [(IMDServiceSession *)&v29 didSendMessage:v12 forChat:v11 style:v28 account:v26 forceDate:v27 itemIsComingFromStorage:0];

  BOOL v22 = +[IMDRelayPushHandler sharedInstance];
  BOOL v23 = [v12 guid];

  [v22 _handleMessageProcessedWithGUID:v23];
}

- (id)_callerIDForChatWithChatIdentifier:(id)a3 chatStyle:(unsigned __int8)a4 foundChat:(id)a5
{
  unsigned int v47 = a4;
  uint64_t v54 = *MEMORY[0x1E4F143B8];
  long long v49 = (__CFString *)a3;
  id v7 = a5;
  long long v48 = [MEMORY[0x1E4F6E660] myCTPhoneNumber];
  uint64_t v8 = [(IMDTelephonyServiceSession *)self relayController];
  id v9 = [v8 _callerIDForRelay];

  if ([(__CFString *)v9 _appearsToBePhoneNumber])
  {
    id v10 = [(IMDTelephonyServiceSession *)self relayController];
    int v11 = [v10 isAliasRelayCapable:v9];
  }
  else
  {
    int v11 = 0;
  }
  id v12 = [v7 lastAddressedLocalHandle];
  uint64_t v13 = [v7 lastAddressedSIMID];
  if (IMOSLoggingEnabled())
  {
    uint64_t v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      v51 = v12;
      __int16 v52 = 2112;
      v53 = v13;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "The Last Addressed Handle For This Chat is %@ and lastAddressedSIMID is %@", buf, 0x16u);
    }
  }
  int HasMultipleActiveSubscriptions = IMSharedHelperDeviceHasMultipleActiveSubscriptions();
  int HasMultipleSubscriptionsWithAtLeastOneActive = IMSharedHelperDeviceHasMultipleSubscriptionsWithAtLeastOneActive();
  if (IMOSLoggingEnabled())
  {
    int v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      uint64_t v18 = @"NO";
      if (HasMultipleActiveSubscriptions) {
        uint64_t v19 = @"YES";
      }
      else {
        uint64_t v19 = @"NO";
      }
      if (HasMultipleSubscriptionsWithAtLeastOneActive) {
        uint64_t v18 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      v51 = v19;
      __int16 v52 = 2112;
      v53 = v18;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Has multiple active subscriptions %@, has at least one active %@", buf, 0x16u);
    }
  }
  if (HasMultipleSubscriptionsWithAtLeastOneActive
    && ![(__CFString *)v12 length]
    && [(__CFString *)v13 length])
  {
    unsigned int v35 = [MEMORY[0x1E4F6E668] sharedInstance];
    id v36 = [v35 ctSubscriptionInfo];
    id v37 = objc_msgSend(v36, "__im_subscriptionContextForForSimID:", v13);

    uint64_t v20 = [v37 phoneNumber];

    if (IMOSLoggingEnabled())
    {
      v38 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v20;
        _os_log_impl(&dword_1D967A000, v38, OS_LOG_TYPE_INFO, "Last addressed handle was nil but found it a phone number on the context so using that phone number %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v20 = v12;
  }
  if ([(__CFString *)v20 length])
  {
    uint64_t v21 = [(IMDTelephonyServiceSession *)self relayController];
    char v22 = [v21 isAliasActiveAndRelayCapable:v20];

    if (![(__CFString *)v20 length]) {
      goto LABEL_31;
    }
    if (v22)
    {
LABEL_26:
      if (IMOSLoggingEnabled())
      {
        BOOL v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v20;
          _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "We have a last addressed alias for this chat, and its one of our active aliases, setting callerID to %@", buf, 0xCu);
        }
      }
LABEL_30:
      uint64_t v20 = v20;

      [(IMDTelephonyServiceSession *)self _updateLastAddressedIDsIfNeededForChatWithIdentifier:v49 style:v47 lastAddressedHandle:v20 lastAddressedSIMID:v13];
LABEL_51:
      id v9 = v20;
      goto LABEL_52;
    }
  }
  else if (![(__CFString *)v20 length])
  {
    goto LABEL_31;
  }
  if (MEMORY[0x1E0169E10](v48, v20)) {
    goto LABEL_26;
  }
LABEL_31:
  if (HasMultipleActiveSubscriptions)
  {
    if ([(__CFString *)v20 length]
      && [(__CFString *)v20 _appearsToBePhoneNumber])
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v20;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "We have a last addressed alias for this chat with at least one subscription active, setting callerID to %@", buf, 0xCu);
        }
      }
      goto LABEL_30;
    }
    BOOL v26 = [(__CFString *)v13 length] == 0;
    int v27 = IMOSLoggingEnabled();
    if (!v26)
    {
      if (v27)
      {
        unsigned int v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v51 = v20;
          __int16 v52 = 2112;
          v53 = v13;
          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "We do not have a valid lastAddressedHandle %@ so using lastAddressedSIMID to send %@", buf, 0x16u);
        }
      }
      objc_super v29 = [MEMORY[0x1E4F6E668] sharedInstance];
      long long v30 = [v29 ctSubscriptionInfo];
      long long v31 = objc_msgSend(v30, "__im_subscriptionContextForForSimID:", v13);

      id v32 = [v31 phoneNumber];

      uint64_t v20 = v32;
      [(IMDTelephonyServiceSession *)self _updateLastAddressedIDsIfNeededForChatWithIdentifier:v49 style:v47 lastAddressedHandle:v20 lastAddressedSIMID:v13];

      goto LABEL_51;
    }
    if (v27)
    {
      long long v42 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "Both simID and phoneNumber are not valid to send with.", buf, 2u);
      }
    }
  }
  else if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      id v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        v51 = v49;
        __int16 v52 = 2112;
        v53 = v9;
        _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Updating last address handle for chats with identifier %@ to be %@", buf, 0x16u);
      }
    }
    [(IMDTelephonyServiceSession *)self _updateLastAddressedIDsIfNeededForChatWithIdentifier:v49 style:v47 lastAddressedHandle:v9 lastAddressedSIMID:v13];
  }
  else if (v48)
  {
    int v39 = MEMORY[0x1E0169E10](v48, v20) ^ 1;
    if (!v20) {
      LOBYTE(v39) = 0;
    }
    if ((v39 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v40 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          v51 = v49;
          __int16 v52 = 2112;
          v53 = v48;
          _os_log_impl(&dword_1D967A000, v40, OS_LOG_TYPE_INFO, "Updating last address handle for chats with identifier %@ to be my phone number %@", buf, 0x16u);
        }
      }
      [(IMDTelephonyServiceSession *)self _updateLastAddressedIDsIfNeededForChatWithIdentifier:v49 style:v47 lastAddressedHandle:v48 lastAddressedSIMID:v13];
    }
    long long v41 = v48;

    id v9 = v41;
  }
  else
  {
    long long v43 = [(IMDTelephonyServiceSession *)self relayController];
    long long v44 = [v43 dominentPhoneNumberAlias];

    if (v44)
    {
      objc_super v45 = [(IMDTelephonyServiceSession *)self relayController];
      uint64_t v46 = [v45 dominentPhoneNumberAlias];

      id v9 = (__CFString *)v46;
    }
  }
LABEL_52:
  id v33 = v9;

  return v33;
}

- (id)createHandleInfoFor:(id)a3
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  id v25 = a3;
  int v24 = [v25 style];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      BOOL v4 = [v25 participants];
      *(_DWORD *)buf = 138412290;
      id v33 = v4;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Participants: %@", buf, 0xCu);
    }
  }
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  id obj = [v25 participants];
  id v5 = 0;
  id v6 = 0;
  id v7 = 0;
  uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v28;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v28 != v9) {
          objc_enumerationMutation(obj);
        }
        int v11 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          id v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            uint64_t v13 = [v11 ID];
            *(_DWORD *)buf = 138412290;
            id v33 = v13;
            _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "  Recipient: %@", buf, 0xCu);
          }
        }
        if (v7)
        {
          if (!v5) {
            goto LABEL_19;
          }
        }
        else
        {
          id v7 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
          if (!v5)
          {
LABEL_19:
            id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
            if (v6) {
              goto LABEL_21;
            }
            goto LABEL_20;
          }
        }
        if (v6) {
          goto LABEL_21;
        }
LABEL_20:
        id v6 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
LABEL_21:
        uint64_t v14 = [v11 ID];
        [v7 addObject:v14];

        uint64_t v15 = [v11 unformattedID];
        int v16 = (void *)v15;
        if (v15) {
          int v17 = (__CFString *)v15;
        }
        else {
          int v17 = &stru_1F3398578;
        }
        [v5 addObject:v17];

        uint64_t v18 = [v11 countryCode];
        uint64_t v19 = (void *)v18;
        if (v18) {
          uint64_t v20 = (__CFString *)v18;
        }
        else {
          uint64_t v20 = @"us";
        }
        [v6 addObject:v20];
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v27 objects:v31 count:16];
    }
    while (v8);
  }

  uint64_t v21 = [(IMDTelephonyServiceSession *)self createHandleInfoForParticipants:v7 unformattedIDs:v5 countryCodes:v6 isGroupChat:v24 == 43];

  return v21;
}

- (id)createHandleInfoForParticipants:(id)a3 unformattedIDs:(id)a4 countryCodes:(id)a5 isGroupChat:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v35 = v11;
  if (a6)
  {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    if ([v9 count])
    {
      unint64_t v13 = 0;
      uint64_t v34 = *MEMORY[0x1E4F6C458];
      uint64_t v33 = *MEMORY[0x1E4F6C5C8];
      uint64_t v32 = *MEMORY[0x1E4F6C648];
      uint64_t v14 = *MEMORY[0x1E4F6C5A0];
      do
      {
        uint64_t v15 = [v9 objectAtIndex:v13];
        int v16 = [v10 objectAtIndex:v13];
        int v17 = [v11 objectAtIndex:v13];
        uint64_t v18 = (void *)MEMORY[0x1E4F1C9E8];
        [NSNumber numberWithInt:2];
        v20 = id v19 = v10;
        uint64_t v21 = objc_msgSend(v18, "dictionaryWithObjectsAndKeys:", v20, v34, v15, v33, v16, v32, v17, v14, 0);

        id v10 = v19;
        [v12 addObject:v21];

        id v11 = v35;
        ++v13;
      }
      while (v13 < [v9 count]);
    }
  }
  else
  {
    char v22 = (void *)MEMORY[0x1E4F1C9E8];
    BOOL v23 = [NSNumber numberWithInt:2];
    uint64_t v24 = *MEMORY[0x1E4F6C458];
    id v25 = [v9 firstObject];
    uint64_t v26 = *MEMORY[0x1E4F6C5C8];
    long long v27 = [v10 firstObject];
    uint64_t v28 = *MEMORY[0x1E4F6C648];
    long long v29 = [v11 firstObject];
    long long v30 = objc_msgSend(v22, "dictionaryWithObjectsAndKeys:", v23, v24, v25, v26, v27, v28, v29, *MEMORY[0x1E4F6C5A0], 0);

    id v11 = v35;
    IMSingleObjectArray();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (id)_extractSMSSenderAddress:(id)a3
{
  id v3 = a3;
  if (IMStringIsEmail()) {
    BOOL v4 = @"<> ";
  }
  else {
    BOOL v4 = @"<>";
  }
  id v5 = [MEMORY[0x1E4F28B88] characterSetWithCharactersInString:v4];
  id v6 = [v3 stringByRemovingCharactersFromSet:v5];

  return v6;
}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 account:(id)a6
{
  uint64_t v7 = a5;
  uint64_t v47 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  unsigned __int8 v44 = v7;
  id v12 = a6;
  if (![(IMDTelephonyServiceSession *)self _shouldFailSMSMessageForTesting:v10 chatIdentifier:v11 chatStyle:v7])
  {
    id v42 = v11;
    [(IMDServiceSession *)self canonicalizeChatIdentifier:&v42 style:&v44];
    id v13 = v42;

    if (!v13)
    {
      id v11 = 0;
      goto LABEL_23;
    }
    uint64_t v14 = [(IMDTelephonyServiceSession *)self _chatForSendingMessageItem:v10 chatIdentifier:v13 chatStyle:v44];
    if (![(IMDTelephonyServiceSession *)self allowedToSendMessage:v10 toChat:v14])
    {
      v41.receiver = self;
      v41.super_class = (Class)IMDTelephonyServiceSession;
      [(IMDServiceSession *)&v41 sendMessage:v10 toChat:v13 style:v44 account:v12];
      [(IMDServiceSession *)self didSendMessage:v10 forChat:v13 style:v44];
LABEL_22:

      id v11 = v13;
      goto LABEL_23;
    }
    [(IMDServiceSession *)self _configureSessionInformationOnItem:v10 toChat:v13 withStyle:v44 forAccount:v12];
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        int v16 = [v10 guid];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v16;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v13;
        *(_WORD *)&buf[22] = 2112;
        uint64_t v46 = v14;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "send message guid: %@  to identifier: %@   chat: %@", buf, 0x20u);
      }
    }
    int v17 = [MEMORY[0x1E4F6E890] sharedInstance];
    [v17 trackEvent:*MEMORY[0x1E4F6DAB0]];

    uint64_t v18 = [(IMDTelephonyServiceSession *)self _callerIDForChatWithChatIdentifier:v13 chatStyle:v44 foundChat:v14];
    [v10 setDestinationCallerID:v18];
    long long v29 = [(IMDTelephonyServiceSession *)self compatibleMessageToSendForMessageItem:v10];
    unint64_t v19 = [(IMDTelephonyServiceSession *)self _sendingDecisionForMessageItem:v29 callerID:v18 chat:v14];
    if ((v19 & 3) != 0)
    {
      uint64_t v20 = v44;
      uint64_t v21 = [v14 lastReplicationSinceLoadDate];
      BOOL v28 = [(IMDTelephonyServiceSession *)self replicateMessage:v10 chatIdentifier:v13 chatStyle:v20 lastKnownReplicationDate:v21 callerID:v18];

      if (v28)
      {
        char v22 = [MEMORY[0x1E4F1C9C8] now];
        [v14 setLastReplicationSinceLoadDate:v22];
      }
      int v23 = IMGetCachedDomainBoolForKey();
      uint64_t v24 = [MEMORY[0x1E4F6C360] sharedInstance];
      int v25 = [v24 isInternalInstall];

      if ((v25 & v23) != 0)
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "** Skipping true SMS send, DisableNonReplicationSMSSend is set", buf, 2u);
          }
        }
        goto LABEL_21;
      }
    }
    else
    {
      LOBYTE(v28) = 0;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v46) = 0;
    LOBYTE(v46) = [v29 useStandalone];
    uint64_t v27 = v44;
    v30[0] = MEMORY[0x1E4F143A8];
    v30[1] = 3221225472;
    v30[2] = sub_1D96FA6A8;
    v30[3] = &unk_1E6B744C0;
    v30[4] = self;
    id v36 = buf;
    id v31 = v29;
    id v32 = v18;
    unint64_t v37 = v19;
    id v33 = v14;
    id v34 = v13;
    unsigned __int8 v38 = v44;
    BOOL v39 = v28;
    char v40 = 0;
    id v35 = v12;
    [(IMDTelephonyServiceSession *)self processMessageForSending:v31 toChat:v34 style:v27 allowWatchdog:1 completionBlock:v30];

    _Block_object_dispose(buf, 8);
LABEL_21:

    id v10 = v29;
    goto LABEL_22;
  }
  v43.receiver = self;
  v43.super_class = (Class)IMDTelephonyServiceSession;
  [(IMDServiceSession *)&v43 sendMessage:v10 toChat:v11 style:v7 account:v12];
LABEL_23:
}

- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 completionBlock:(id)a7
{
  BOOL v8 = a6;
  uint64_t v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a7;
  v19[0] = MEMORY[0x1E4F143A8];
  v19[1] = 3221225472;
  v19[2] = sub_1D96FAB4C;
  v19[3] = &unk_1E6B744E8;
  v19[4] = self;
  id v20 = v13;
  char v23 = v9;
  id v21 = v12;
  id v22 = v14;
  v18.receiver = self;
  v18.super_class = (Class)IMDTelephonyServiceSession;
  id v15 = v14;
  id v16 = v12;
  id v17 = v13;
  [(IMDServiceSession *)&v18 processMessageForSending:v16 toChat:v17 style:v9 allowWatchdog:v8 completionBlock:v19];
}

- (void)setServiceCompatibleContentOn:(id)a3 forChat:(id)a4 style:(unsigned __int8)a5 from:(id)a6 completionBlock:(id)a7
{
  uint64_t v9 = a5;
  uint64_t v71 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v37 = a4;
  id v41 = a6;
  id v38 = a7;
  id v42 = v11;
  char v40 = [v11 balloonBundleID];
  BOOL v39 = [v11 payloadData];
  if ([v40 length] && objc_msgSend(v39, "length"))
  {
    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "We have a 3rd party message and need to transcode the payload data", buf, 2u);
      }
    }
    id v13 = [v41 fileTransferGUIDs];
    objc_msgSend(v13, "__imArrayByApplyingBlock:", &unk_1F3390C20);
    id obj = (id)objc_claimAutoreleasedReturnValue();

    id v14 = [MEMORY[0x1E4F6EBE0] sharedInstance];
    v64[0] = MEMORY[0x1E4F143A8];
    v64[1] = 3221225472;
    v64[2] = sub_1D96FB270;
    v64[3] = &unk_1E6B74530;
    id v65 = v40;
    id v66 = v11;
    id v67 = v38;
    [v14 transcodeFallbackFileTransferPayloadData:v39 balloonBundleID:v65 attachments:obj completionBlock:v64];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "We have transfers for this message and this is not a 3rd party message, so let's try and transcode them", buf, 2u);
      }
    }
    id obj = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    long long v62 = 0u;
    long long v63 = 0u;
    long long v60 = 0u;
    long long v61 = 0u;
    id v16 = [v41 fileTransferGUIDs];
    uint64_t v17 = [v16 countByEnumeratingWithState:&v60 objects:v70 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v61;
      do
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v61 != v18) {
            objc_enumerationMutation(v16);
          }
          uint64_t v20 = *(void *)(*((void *)&v60 + 1) + 8 * i);
          id v21 = +[IMDFileTransferCenter sharedInstance];
          id v22 = [v21 transferForGUID:v20];

          if ([v22 isAutoloopVideo]) {
            [obj addObject:v22];
          }
        }
        uint64_t v17 = [v16 countByEnumeratingWithState:&v60 objects:v70 count:16];
      }
      while (v17);
    }

    if ([obj count])
    {
      char v23 = [v41 fileTransferGUIDs];
      uint64_t v24 = [v23 count];

      id v36 = [(IMDServiceSession *)self chatForChatIdentifier:v37 style:v9];
      int64_t v25 = [(IMDServiceSession *)self maxSizePerAttachmentWithCount:v24 forChat:v36];
      uint64_t v26 = dispatch_group_create();
      id v43 = objc_alloc_init(MEMORY[0x1E4F28CA0]);
      uint64_t v27 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CA60]), "initWithCapacity:", objc_msgSend(obj, "count"));
      long long v58 = 0u;
      long long v59 = 0u;
      long long v56 = 0u;
      long long v57 = 0u;
      id obj = obj;
      uint64_t v28 = [obj countByEnumeratingWithState:&v56 objects:v69 count:16];
      if (v28)
      {
        uint64_t v29 = *(void *)v57;
        do
        {
          for (uint64_t j = 0; j != v28; ++j)
          {
            if (*(void *)v57 != v29) {
              objc_enumerationMutation(obj);
            }
            id v31 = *(void **)(*((void *)&v56 + 1) + 8 * j);
            dispatch_group_enter(v26);
            id v32 = [v31 localURL];
            int64_t v54 = v25;
            id v55 = 0;
            v51[0] = MEMORY[0x1E4F143A8];
            v51[1] = 3221225472;
            v51[2] = sub_1D96FB4F8;
            v51[3] = &unk_1E6B74580;
            v51[4] = v31;
            v51[5] = self;
            id v52 = v27;
            id v33 = v26;
            v53 = v33;
            [v43 coordinateReadingItemAtURL:v32 options:0 error:&v55 byAccessor:v51];
            id v34 = v55;

            if (v34) {
              dispatch_group_leave(v33);
            }
          }
          uint64_t v28 = [obj countByEnumeratingWithState:&v56 objects:v69 count:16];
        }
        while (v28);
      }

      block[0] = MEMORY[0x1E4F143A8];
      block[1] = 3221225472;
      block[2] = sub_1D96FB8BC;
      block[3] = &unk_1E6B731A0;
      id v47 = v41;
      id v48 = v27;
      id v49 = v42;
      id v50 = v38;
      id v35 = v27;
      dispatch_group_notify(v26, MEMORY[0x1E4F14428], block);
    }
    else
    {
      (*((void (**)(id, void *))v38 + 2))(v38, v42);
    }
  }
}

- (void)_processReceivedDictionary:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 withCompletionBlock:(id)a6
{
}

- (void)_updateCategoryForChat:(id)a3 andMessage:(id)a4 category:(int64_t)a5 subCategory:(int64_t)a6 spamExtensionName:(id)a7
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a7;
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [v11 guid];
      int v16 = 138412802;
      uint64_t v17 = v15;
      __int16 v18 = 2048;
      int64_t v19 = a5;
      __int16 v20 = 2048;
      int64_t v21 = a6;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Updating chat %@ category %ld subCategory @%ld", (uint8_t *)&v16, 0x20u);
    }
  }
  [v11 updateSMSCategory:a5 subCategory:a6];
  [v11 updateSMSSpamExtensionNameChatProperty:v13];
}

- (void)_resetAndBroadcastBlackholeErrorStateIfNeededForChatIdentifier:(id)a3 chatStyle:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  uint64_t v7 = +[IMDChatRegistry sharedInstance];
  BOOL v8 = [v7 allExistingChatsWithIdentifier:v6 style:v4];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 receivedBlackholeError])
        {
          [v13 updateReceivedBlackholeError:0];
          id v14 = +[IMDChatStore sharedInstance];
          v15[0] = MEMORY[0x1E4F143A8];
          v15[1] = 3221225472;
          v15[2] = sub_1D96FBE34;
          v15[3] = &unk_1E6B745A8;
          v15[4] = self;
          [v14 remapMessageError:43 toError:0 forChat:v13 completion:v15];
        }
      }
      uint64_t v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }
}

- (BOOL)_disableScreenTimeRestrictionsForMessageItem:(id)a3 chat:(id)a4 watchSendsOverCellular:(BOOL)a5 emergencyNumbersFoundInRecipients:(int64_t *)a6
{
  if (a6) {
    *a6 = 0;
  }
  return 0;
}

- (int64_t)_iMessageCapabilityForSIMID:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = objc_msgSend(MEMORY[0x1E4F6E668], "sharedInstance", 0);
  id v5 = [v4 registeredSIMIDs];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v13;
    int64_t v9 = 1;
LABEL_3:
    uint64_t v10 = 0;
    while (1)
    {
      if (*(void *)v13 != v8) {
        objc_enumerationMutation(v5);
      }
      if ([v3 isEqualToString:*(void *)(*((void *)&v12 + 1) + 8 * v10)]) {
        break;
      }
      if (v7 == ++v10)
      {
        uint64_t v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
        if (v7) {
          goto LABEL_3;
        }
        goto LABEL_9;
      }
    }
  }
  else
  {
LABEL_9:
    int64_t v9 = 2;
  }

  return v9;
}

- (void)waitForChatRelayReadiness:(id)a3 withBlock:(id)a4
{
}

- (void)_relayMessage:(id)a3 chat:(id)a4 didSendSMS:(BOOL)a5 attemptingReplication:(BOOL)a6 forceReflection:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 callerID:(id)a10
{
  uint64_t v59 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v17 = a4;
  id v18 = a10;
  if (([v17 isChatBot] & 1) == 0)
  {
    BOOL v36 = a8;
    if (IMOSLoggingEnabled())
    {
      long long v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "We have peer devices, relaying message...", buf, 2u);
      }
    }
    __int16 v20 = [v17 lastAddressedSIMID];
    int64_t v35 = [(IMDTelephonyServiceSession *)self _iMessageCapabilityForSIMID:v20];

    uint64_t v21 = [v16 balloonBundleID];
    char v22 = [v21 isEqualToString:*MEMORY[0x1E4F6CC10]];

    char v23 = [v16 fileTransferGUIDs];
    if (![v23 count]) {
      char v22 = 1;
    }

    int v24 = IMOSLoggingEnabled();
    if (v22)
    {
      if (v24)
      {
        int64_t v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          uint64_t v26 = [v16 guid];
          *(_DWORD *)buf = 138412290;
          long long v58 = v26;
          _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "No attachments or rich links, relaying message with guid %@", buf, 0xCu);
        }
      }
      v37[0] = MEMORY[0x1E4F143A8];
      v37[1] = 3221225472;
      v37[2] = sub_1D96FC9A4;
      v37[3] = &unk_1E6B745D0;
      v37[4] = self;
      id v38 = v16;
      id v39 = v17;
      BOOL v41 = a5;
      BOOL v42 = a6;
      BOOL v43 = a7;
      BOOL v44 = v36;
      BOOL v45 = a9;
      v40[0] = v18;
      v40[1] = v35;
      [(IMDTelephonyServiceSession *)self waitForChatRelayReadiness:v39 withBlock:v37];
      uint64_t v27 = &v38;
      uint64_t v28 = &v39;
      uint64_t v29 = (id *)v40;
    }
    else
    {
      if (v24)
      {
        long long v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          id v31 = [v16 guid];
          *(_DWORD *)buf = 138412290;
          long long v58 = v31;
          _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Message with Guid %@ contains attachments, uploading to MMCS", buf, 0xCu);
        }
      }
      id v32 = [(IMDTelephonyServiceSession *)self attachmentController];
      id v33 = [v17 lastAddressedLocalHandle];
      id v34 = [v17 lastAddressedSIMID];
      v48[0] = MEMORY[0x1E4F143A8];
      v48[1] = 3221225472;
      v48[2] = sub_1D96FC5BC;
      v48[3] = &unk_1E6B745F8;
      v48[4] = self;
      id v49 = v17;
      id v50 = v16;
      BOOL v52 = a5;
      BOOL v53 = a6;
      BOOL v54 = a7;
      BOOL v55 = v36;
      BOOL v56 = a9;
      v51[0] = v18;
      v51[1] = v35;
      v46[0] = MEMORY[0x1E4F143A8];
      v46[1] = 3221225472;
      v46[2] = sub_1D96FC88C;
      v46[3] = &unk_1E6B74620;
      v46[4] = self;
      id v47 = v50;
      [v32 processAttachmentsForPeerRelayForMessage:v47 lastAddressHandle:v33 lastAddressedSIMID:v34 completionBlock:v48 uploadFailureBlock:v46];

      uint64_t v27 = &v49;
      uint64_t v28 = &v50;
      uint64_t v29 = (id *)v51;
    }
  }
}

- (void)_setTimeoutTimerForRelayMessageID:(id)a3 timeout:(double)a4
{
  id v6 = a3;
  if (a4 <= 1.0) {
    a4 = 180.0;
  }
  id v10 = v6;
  if ([v6 length])
  {
    [(IMDTelephonyServiceSession *)self _clearTimoutTimerForRelayMessageID:v10];
    if (!self->_outgoingRelayMessageTimerMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      outgoingRelayMessageTimerMap = self->_outgoingRelayMessageTimerMap;
      self->_outgoingRelayMessageTimerMap = Mutable;
    }
    int64_t v9 = [MEMORY[0x1E4F1CB00] scheduledTimerWithTimeInterval:self target:sel__messageTimedOut_ selector:v10 userInfo:0 repeats:a4];
    if (v9) {
      [(NSMutableDictionary *)self->_outgoingRelayMessageTimerMap setObject:v9 forKey:v10];
    }
  }
}

- (void)_clearTimoutTimerForRelayMessageID:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    uint64_t v4 = [(NSMutableDictionary *)self->_outgoingRelayMessageTimerMap objectForKey:v5];
    if (v4)
    {
      [(NSMutableDictionary *)self->_outgoingRelayMessageTimerMap removeObjectForKey:v5];
      [v4 invalidate];
    }
  }
}

- (void)_addOriginatedMessage:(id)a3
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412290;
        id v10 = v4;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, " Adding Message with GUID: %@ to originated Message Map", (uint8_t *)&v9, 0xCu);
      }
    }
    originatedMessages = self->_originatedMessages;
    if (!originatedMessages)
    {
      uint64_t v7 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
      uint64_t v8 = self->_originatedMessages;
      self->_originatedMessages = v7;

      originatedMessages = self->_originatedMessages;
    }
    [(NSMutableSet *)originatedMessages addObject:v4];
    [(IMDTelephonyServiceSession *)self _setClearMessageSendTimer];
  }
}

- (void)_removeOriginatedMessage:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 length])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v6 = 138412290;
        id v7 = v4;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, " Removing Message with GUID: %@ from originated Message Map", (uint8_t *)&v6, 0xCu);
      }
    }
    [(NSMutableSet *)self->_originatedMessages removeObject:v4];
    if (![(NSMutableSet *)self->_originatedMessages count]) {
      [(IMDTelephonyServiceSession *)self _clearInactivityTimer];
    }
  }
}

- (void)_clearInactivityTimer
{
  self->_pendingOriginatedMessagesTimer = 0;
  [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__clearInactivityTimer object:0];
  originatedMessages = self->_originatedMessages;
  self->_originatedMessages = 0;
}

- (void)_setClearMessageSendTimer
{
  if (!self->_pendingOriginatedMessagesTimer)
  {
    self->_pendingOriginatedMessagesTimer = 1;
    [MEMORY[0x1E4FBA8A8] cancelPreviousPerformRequestsWithTarget:self selector:sel__clearInactivityTimer object:0];
    [(IMDTelephonyServiceSession *)self performSelector:sel__clearInactivityTimer withObject:0 afterDelay:30.0];
  }
}

- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [(IMDServiceSession *)self accountID];
      int v13 = 138412546;
      long long v14 = v8;
      __int16 v15 = 2048;
      double v16 = a4;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, " Enqueued item for key: %@    timeout: %f", (uint8_t *)&v13, 0x16u);
    }
  }
  incomingMessageMultiQueue = self->_incomingMessageMultiQueue;
  if (!incomingMessageMultiQueue)
  {
    id v10 = (IMMultiQueue *)objc_alloc_init(MEMORY[0x1E4F6C388]);
    uint64_t v11 = self->_incomingMessageMultiQueue;
    self->_incomingMessageMultiQueue = v10;

    incomingMessageMultiQueue = self->_incomingMessageMultiQueue;
  }
  long long v12 = [(IMDServiceSession *)self accountID];
  [(IMMultiQueue *)incomingMessageMultiQueue addBlock:v6 withTimeout:v12 forKey:0 description:a4];
}

- (BOOL)shouldExcludeChatFromRelay:(id)a3
{
  return 0;
}

- (unint64_t)maxRecipientsForPhoneNumber:(id)a3 simID:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v9 = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Subclass failed to override participant check", v9, 2u);
    }
  }
  return 0;
}

- (id)subscriptionContextForChat:(id)a3
{
  uint64_t v44 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  id v4 = [v3 lastAddressedLocalHandle];
  id v5 = [v3 lastAddressedSIMID];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      id v7 = [v3 guid];
      *(_DWORD *)buf = 138412802;
      id v39 = v7;
      __int16 v40 = 2112;
      BOOL v41 = v4;
      __int16 v42 = 2112;
      BOOL v43 = v5;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Not first chat (%@): lastAddressedLocalHandle %@ lastAddressedSIMID %@", buf, 0x20u);
    }
  }
  uint64_t v8 = [MEMORY[0x1E4F6E668] sharedInstance];
  int v9 = [v8 ctSubscriptionInfo];

  id v10 = [v9 subscriptions];
  BOOL v11 = [v10 count] == 1;

  if (v11)
  {
    long long v12 = [v9 subscriptions];
    int v13 = [v12 firstObject];

    if (v13) {
      goto LABEL_21;
    }
  }
  else
  {
    int v13 = objc_msgSend(v9, "__im_subscriptionContextForForSimID:phoneNumber:", v5, v4);
    if (v13) {
      goto LABEL_21;
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      __int16 v15 = [v3 guid];
      *(_DWORD *)buf = 138412802;
      id v39 = v4;
      __int16 v40 = 2112;
      BOOL v41 = v5;
      __int16 v42 = 2112;
      BOOL v43 = v15;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Could not find a subscription context to send with based on lastAddressedHandle %@ lastAddressedSIMID %@ so finding context preferred subscription for chat %@", buf, 0x20u);
    }
  }
  double v16 = objc_opt_new();
  long long v35 = 0u;
  long long v36 = 0u;
  long long v33 = 0u;
  long long v34 = 0u;
  uint64_t v17 = [v3 participants];
  uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
  if (v18)
  {
    uint64_t v19 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v18; ++i)
      {
        if (*(void *)v34 != v19) {
          objc_enumerationMutation(v17);
        }
        uint64_t v21 = [*(id *)(*((void *)&v33 + 1) + 8 * i) ID];
        [v16 addObject:v21];
      }
      uint64_t v18 = [v17 countByEnumeratingWithState:&v33 objects:v37 count:16];
    }
    while (v18);
  }

  int v13 = objc_msgSend(v9, "__im_contactPreferredSubscriptionContextForChatHandleIDs:", v16);

  if (v13)
  {
LABEL_21:
    if (IMOSLoggingEnabled())
    {
      char v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v39 = v13;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Setting the context for context %@ and updating lastAddressed if needed", buf, 0xCu);
      }
    }
    char v23 = [v13 phoneNumber];
    if (MEMORY[0x1E0169E10](v4, v23))
    {
      int v24 = [v13 labelID];
      char v25 = [v5 isEqualToString:v24];

      if (v25) {
        goto LABEL_30;
      }
    }
    else
    {
    }
    uint64_t v26 = [v3 chatIdentifier];
    uint64_t v27 = [v3 style];
    uint64_t v28 = [v13 phoneNumber];
    uint64_t v29 = [v13 labelID];
    [(IMDTelephonyServiceSession *)self _updateLastAddressedIDsIfNeededForChatWithIdentifier:v26 style:v27 lastAddressedHandle:v28 lastAddressedSIMID:v29];

    goto LABEL_30;
  }
  if (IMOSLoggingEnabled())
  {
    id v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Could not find a subscription context to send with based on contact preferred subscription in context so failing message", buf, 2u);
    }
  }
  int v13 = 0;
LABEL_30:

  return v13;
}

- (void)_markFromStorageIfNeeded:(id)a3 messageGUID:(id)a4
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v7;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Storage context present for message with GUID %@", (uint8_t *)&v10, 0xCu);
      }
    }
    char v9 = [v6 unsignedIntValue];
    if (([v6 unsignedIntValue] & 2) != 0)
    {
      [(IMDServiceSession *)self noteLastItemFromStorage:v7];
    }
    else if (v9)
    {
      [(IMDServiceSession *)self noteItemFromStorage:v7];
    }
  }
}

- (void)_updateShouldForceToSMSForChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 shouldForceToSMS:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  uint64_t v27 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = +[IMDChatRegistry sharedInstance];
  char v9 = [v8 allExistingSupportedServiceChatsWithIdentifier:v7 style:v6];

  if (IMOSLoggingEnabled())
  {
    int v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      id v11 = @"NO";
      *(_DWORD *)buf = 138412802;
      id v22 = v7;
      if (v5) {
        id v11 = @"YES";
      }
      __int16 v23 = 1024;
      int v24 = v6;
      __int16 v25 = 2112;
      uint64_t v26 = v11;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Checking if chats with chatIdentifier %@ and style %hhu need to have shouldForceToSMS updated to %@.", buf, 0x1Cu);
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = v9;
  uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      uint64_t v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * v15++), "updateShouldForceToSMS:", v5, (void)v16);
      }
      while (v13 != v15);
      uint64_t v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)_finishSendingMessageItem:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 foundChat:(id)a6 didSendSMS:(BOOL)a7 attemptingReplication:(BOOL)a8 shouldForceFail:(BOOL)a9 watchSendsOverCellular:(BOOL)a10 forceReflection:(BOOL)a11 callerID:(id)a12
{
  BOOL v48 = a8;
  BOOL v12 = a7;
  unsigned int v50 = a5;
  uint64_t v61 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v51 = a4;
  id v17 = a6;
  id v49 = a12;
  long long v54 = 0u;
  long long v55 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  long long v18 = +[IMDChatRegistry sharedInstance];
  long long v19 = [v18 allExistingSupportedServiceChatsWithIdentifier:v51 style:v50];

  uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v60 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v55;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
      {
        if (*(void *)v55 != v21) {
          objc_enumerationMutation(v19);
        }
        __int16 v23 = *(void **)(*((void *)&v54 + 1) + 8 * i);
        int v24 = [v16 guid];
        [v23 updateLastSeenMessageGuidIfNeeded:v24];
      }
      uint64_t v20 = [v19 countByEnumeratingWithState:&v54 objects:v60 count:16];
    }
    while (v20);
  }

  if ([MEMORY[0x1E4F6EA38] isInternationalSpamFilteringEnabled] & v12) {
    [(IMDTelephonyServiceSession *)self _resetAndBroadcastBlackholeErrorStateIfNeededForChatIdentifier:v51 chatStyle:v50];
  }
  uint64_t v53 = 0;
  BOOL v25 = [(IMDTelephonyServiceSession *)self _disableScreenTimeRestrictionsForMessageItem:v16 chat:v17 watchSendsOverCellular:a10 emergencyNumbersFoundInRecipients:&v53];
  int IsAltAccount = IMSharedHelperDeviceIsAltAccount();
  uint64_t v27 = [(IMDTelephonyServiceSession *)self relayController];
  int v28 = [v27 watchConnectedOverBT];

  uint64_t v29 = v53;
  BOOL v30 = [(IMDTelephonyServiceSession *)self shouldExcludeChatFromRelay:v17];
  if (a9)
  {
    if ((IMSharedHelperDeviceHasMultipleSubscriptions() & a9) == 1)
    {
      if (IMOSLoggingEnabled())
      {
        id v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          id v32 = [v16 guid];
          *(_DWORD *)buf = 138412290;
          uint64_t v59 = v32;
          _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "SMS was not sent out and message was force failed so that user can pick correct subscription to send with %@", buf, 0xCu);
        }
      }
LABEL_28:
      long long v36 = [v16 guid];
      [(IMDServiceSession *)self didReceiveError:4 forMessageID:v36 forceError:1];

      goto LABEL_32;
    }
  }
  else
  {
    BOOL v33 = v30;
    long long v34 = [(IMDTelephonyServiceSession *)self relayController];
    if (([v34 hasPeerDevices] ^ 1 | IsAltAccount) == 1)
    {
    }
    else
    {
      if (!v53) {
        int v28 = 1;
      }

      if (((v28 ^ 1 | v33) & 1) == 0)
      {
        if (v12
          && ([(IMDTelephonyServiceSession *)self relayEnrollmentController],
              id v37 = objc_claimAutoreleasedReturnValue(),
              [v37 _allowedDevicesforSMSRelay],
              id v38 = objc_claimAutoreleasedReturnValue(),
              BOOL v39 = [v38 count] == 0,
              v38,
              v37,
              v39))
        {
          if (IMOSLoggingEnabled())
          {
            __int16 v40 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v40, OS_LOG_TYPE_INFO, "None of our peer devices are on the allowed list, Not relaying message", buf, 2u);
            }
          }
          BOOL v41 = +[IMDAccountController sharedInstance];
          __int16 v42 = [v16 accountID];
          BOOL v43 = [v41 accountForAccountID:v42];
          uint64_t v44 = v43;
          if (v43)
          {
            id v45 = v43;
          }
          else
          {
            id v45 = [(IMDServiceSession *)self account];
          }
          uint64_t v46 = v45;

          v52.receiver = self;
          v52.super_class = (Class)IMDTelephonyServiceSession;
          [(IMDServiceSession *)&v52 sendMessage:v16 toChat:v51 style:v50 account:v46];
        }
        else
        {
          LOBYTE(v47) = v25;
          [(IMDTelephonyServiceSession *)self _relayMessage:v16 chat:v17 didSendSMS:v12 attemptingReplication:v48 forceReflection:a11 relayToWatchOnly:v29 > 0 shouldDisableScreenTimeRestrictions:v47 callerID:v49];
        }
        goto LABEL_32;
      }
    }
    IMSharedHelperDeviceHasMultipleSubscriptions();
  }
  if (IMOSLoggingEnabled())
  {
    long long v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "We have no peer devices, or this message was intended for an emergency number, not relaying message", buf, 2u);
    }
  }
  if (!v12) {
    goto LABEL_28;
  }
LABEL_32:
}

- (void)sendDeleteCommand:(id)a3 forChatGUID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(IMDTelephonyServiceSession *)self chatRegistry];
  uint64_t v8 = [v7 existingChatWithGUID:v6];

  if (![(IMDTelephonyServiceSession *)self shouldExcludeChatFromRelay:v8])
  {
    char v9 = [(IMDTelephonyServiceSession *)self relayController];
    [v9 sendDeleteCommand:v10 forChatGUID:v6];
  }
}

- (void)sendRecoverCommand:(id)a3 forChatGUID:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [(IMDTelephonyServiceSession *)self chatRegistry];
  uint64_t v8 = [v7 existingChatWithGUID:v6];

  if (![(IMDTelephonyServiceSession *)self shouldExcludeChatFromRelay:v8])
  {
    char v9 = [(IMDTelephonyServiceSession *)self relayController];
    [v9 sendRecoverCommand:v10 forChatGUID:v6];
  }
}

- (id)_resolveHandlesFor:(id)a3 withMessage:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v13 = 0;
  uint64_t v14 = &v13;
  uint64_t v15 = 0x3032000000;
  id v16 = sub_1D96FE10C;
  id v17 = sub_1D96FE11C;
  id v18 = 0;
  uint64_t v8 = +[IMDMessageStore sharedInstance];
  char v9 = [(IMDServiceSession *)self service];
  v12[0] = MEMORY[0x1E4F143A8];
  v12[1] = 3221225472;
  v12[2] = sub_1D96FE124;
  v12[3] = &unk_1E6B73420;
  v12[4] = &v13;
  [v8 resolveUnformattedRepresentationsForHandles:v6 onService:v9 message:v7 completionBlock:v12];

  id v10 = (id)v14[5];
  _Block_object_dispose(&v13, 8);

  return v10;
}

- (BOOL)isGroupMessagingEnabledFor:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F6E660];
  id v4 = a3;
  BOOL v5 = [v4 lastAddressedLocalHandle];
  id v6 = [v4 lastAddressedSIMID];

  LOBYTE(v3) = [v3 IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:v5 simID:v6];
  return (char)v3;
}

- (id)makeSenderFor:(id)a3 forChat:(id)a4 chatStyle:(unsigned __int8)a5 recipients:(id)a6
{
  return 0;
}

- (int64_t)maxSizePerAttachmentWithCount:(int)a3 lastAddressHandle:(id)a4 lastAddressedSIMID:(id)a5
{
  *(void *)&void v15[5] = *MEMORY[0x1E4F143B8];
  id v7 = a4;
  id v8 = a5;
  uint64_t v9 = (uint64_t)((double)(int)[MEMORY[0x1E4F6E660] IMMMSMaximumMessageByteCountForPhoneNumber:v7 simID:v8]* 0.92);
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v14 = 134217984;
      *(void *)uint64_t v15 = v9;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "   Maximum byte length for attachments is: %lld", (uint8_t *)&v14, 0xCu);
    }
  }
  int64_t v11 = v9 / a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 67109376;
      v15[0] = a3;
      LOWORD(v15[1]) = 2048;
      *(void *)((char *)&v15[1] + 2) = v11;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "     Part byte length for %d attachments will be: %lld", (uint8_t *)&v14, 0x12u);
    }
  }
  return v11;
}

- (void)sendMessageFromIMMessageItem:(id)a3 forChat:(id)a4 chat:(id)a5 style:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Message sending...", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    int v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [v12 participants];
      *(_DWORD *)buf = 138412546;
      id v27 = v12;
      __int16 v28 = 2112;
      uint64_t v29 = v15;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Looking at participants for chat %@ participants %@", buf, 0x16u);
    }
  }
  id v16 = [v12 participants];
  id v17 = [(IMDTelephonyServiceSession *)self _resolveHandlesFor:v16 withMessage:v10];

  id v18 = [(IMDTelephonyServiceSession *)self makeSenderFor:v10 forChat:v12 chatStyle:v6 recipients:v17];
  long long v19 = v18;
  if (v18)
  {
    v21[0] = MEMORY[0x1E4F143A8];
    v21[1] = 3221225472;
    v21[2] = sub_1D96FE648;
    v21[3] = &unk_1E6B74690;
    id v22 = v18;
    __int16 v23 = self;
    id v24 = v11;
    char v25 = v6;
    [v22 prepareWithCompletion:v21];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Unable to create Message Sender, can't send", buf, 2u);
    }
  }
}

- (BOOL)_isActiveServiceForRelay
{
  uint64_t v6 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v4 = 136315138;
      BOOL v5 = "-[IMDTelephonyServiceSession _isActiveServiceForRelay]";
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "%s not overridden by subclass!", (uint8_t *)&v4, 0xCu);
    }
  }
  return 0;
}

- (BOOL)_canSendWithCallerID:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    int v4 = [MEMORY[0x1E4F6E668] sharedInstance];
    BOOL v5 = [v4 ctSubscriptionInfo];
    int v6 = objc_msgSend(v5, "__im_containsPhoneNumber:", v3);

    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v8 = @"NO";
        if (v6) {
          id v8 = @"YES";
        }
        int v11 = 138412290;
        id v12 = v8;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Should send if caller ID is part of the subscription context: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v9 = [MEMORY[0x1E4F6E660] myCTPhoneNumber];
    LOBYTE(v6) = MEMORY[0x1E0169E10](v9, v3);
  }
  return v6;
}

- (unint64_t)_sendingDecisionForMessageItem:(id)a3 callerID:(id)a4 chat:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = [(IMDTelephonyServiceSession *)self relayController];
  int v12 = [v11 _localDeviceSupportsSMS];

  uint64_t v13 = [MEMORY[0x1E4F6B3E8] sharedInstance];
  int v14 = [v8 handle];
  int v15 = [v13 isPhoneNumberEmergencyNumber:v14];

  if (((v12 ^ 1) & 1) == 0 && v15)
  {
    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        __int16 v45 = 0;
        id v17 = "IsEmergency and canSendSMS: Sending Message via CT";
        id v18 = (uint8_t *)&v45;
LABEL_16:
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, v17, v18, 2u);
        goto LABEL_17;
      }
      goto LABEL_17;
    }
    goto LABEL_18;
  }
  BOOL v38 = [(IMDTelephonyServiceSession *)self _canSendWithCallerID:v9];
  if ([v9 length])
  {
    long long v19 = v8;
    id v20 = v9;
    int v21 = [v9 _appearsToBePhoneNumber];
  }
  else
  {
    id v20 = v9;
    long long v19 = v8;
    int v21 = 0;
  }
  id v22 = [(IMDTelephonyServiceSession *)self relayController];
  __int16 v23 = [v10 lastAddressedSIMID];
  int v37 = [v22 _localDeviceSupportsSMSAndDoesNotHaveAPhoneNumberForSIMID:v23];

  id v24 = [v10 lastAddressedLocalHandle];
  if ([v24 length])
  {
    char v25 = [(IMDTelephonyServiceSession *)self relayController];
    uint64_t v26 = v10;
    id v27 = [v10 lastAddressedLocalHandle];
    char v28 = [v25 isAliasActiveAndRelayCapable:v27];
  }
  else
  {
    uint64_t v26 = v10;
    char v28 = 0;
  }

  id v9 = v20;
  if ((v38 & v12 & v21) == 1)
  {
    id v8 = v19;
    id v10 = v26;
    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        id v17 = "My Caller ID & Phone Number are the same, I am SMS Capable, My callerID is a phone number: Sending Message via CT";
        id v18 = buf;
        goto LABEL_16;
      }
LABEL_17:
    }
LABEL_18:
    unint64_t v29 = 1;
    goto LABEL_19;
  }
  id v8 = v19;
  id v10 = v26;
  if (IMSharedHelperDeviceHasMultipleSubscriptions() && [v19 useStandalone])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_18;
    }
    id v16 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_17;
    }
    __int16 v43 = 0;
    id v17 = "Subscription on chat cannot be found in active subscriptions but message must be sent because it is an SOS message.";
    id v18 = (uint8_t *)&v43;
    goto LABEL_16;
  }
  if (v37)
  {
    if (IMOSLoggingEnabled())
    {
      id v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v42 = 0;
        _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "I do not have a phone number, however I am sms capable: Sending Message via CT", v42, 2u);
      }
    }
    id v32 = [v26 lastAddressedSIMID];
    [v19 setDestinationCallerID:v32];

    id v10 = v26;
    unint64_t v29 = 5;
    goto LABEL_19;
  }
  if (((v21 | v12 ^ 1) & 1) == 0 && (IMSharedHelperDeviceHasMultipleActiveSubscriptions() & 1) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_18;
    }
    id v16 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v16, OS_LOG_TYPE_INFO)) {
      goto LABEL_17;
    }
    __int16 v41 = 0;
    id v17 = "My CallerID is not set to phone number However I am SMS Capable: Sending Message via CT";
    id v18 = (uint8_t *)&v41;
    goto LABEL_16;
  }
  char v33 = IMSharedHelperDeviceHasMultipleActiveSubscriptions() & v12 ^ 1 | v38 | v28;
  int v34 = IMOSLoggingEnabled();
  if (v33)
  {
    if (v34)
    {
      id v10 = v26;
      long long v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)BOOL v39 = 0;
        _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, ": Calling Did Send Message, Another device will relay this message for me", v39, 2u);
      }

      unint64_t v29 = 2;
      goto LABEL_19;
    }
    unint64_t v29 = 2;
LABEL_47:
    id v10 = v26;
    goto LABEL_19;
  }
  if (!v34)
  {
    unint64_t v29 = 8;
    goto LABEL_47;
  }
  id v10 = v26;
  long long v36 = OSLogHandleForIMFoundationCategory();
  if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)__int16 v40 = 0;
    _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_INFO, "My device is capable of sending SMS but is not on correct subscription. Failing message", v40, 2u);
  }

  unint64_t v29 = 8;
LABEL_19:

  return v29;
}

- (BOOL)_sendMessageOverAlternatePath:(id)a3 toChat:(id)a4
{
  return 0;
}

- (void)_messageTimedOut:(id)a3
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  BOOL v5 = [v4 userInfo];
  int v6 = +[IMDMessageStore sharedInstance];
  id v7 = [v6 messageWithGUID:v5];

  if (![v7 isSent]) {
    goto LABEL_4;
  }
  id v8 = [v7 service];
  id v9 = [(IMDServiceSession *)self service];
  id v10 = [v9 internalName];
  if ([v8 isEqualToString:v10])
  {
    int v11 = [v7 wasDowngraded];

    if (!v11)
    {
LABEL_4:
      if (IMOSLoggingEnabled())
      {
        int v12 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412290;
          id v16 = v5;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Failed to send relay message ID guid (timed out): %@", (uint8_t *)&v15, 0xCu);
        }
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v13 = OSLogHandleForIMEventCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          int v15 = 138412290;
          id v16 = v5;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Error sending message: %@ SMS Relay timed out", (uint8_t *)&v15, 0xCu);
        }
      }
      if (v5) {
        [(IMDServiceSession *)self didReceiveError:4 forMessageID:v5 forceError:1];
      }
      goto LABEL_18;
    }
  }
  else
  {
  }
  int v14 = IMLogHandleForCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG)) {
    sub_1D98FFD4C(v14);
  }

LABEL_18:
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 joinProperties:(id)a6
{
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 joinProperties:(id)a7
{
}

- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 joinProperties:(id)a9
{
  uint64_t v12 = a5;
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (IMOSLoggingEnabled())
  {
    int v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      id v23 = v15;
      __int16 v24 = 1024;
      int v25 = v12;
      __int16 v26 = 2112;
      id v27 = v16;
      __int16 v28 = 2112;
      id v29 = v18;
      __int16 v30 = 2112;
      id v31 = v19;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Request to join chat: %@  style: %c handleInfo: %@ lastAddressedHandle %@ lastAddressedSIMID %@", buf, 0x30u);
    }
  }
  [(IMDServiceSession *)self didJoinChat:v15 style:v12 displayName:0 groupID:v17 lastAddressedHandle:v18 lastAddressedSIMID:v19 handleInfo:v16];
}

- (IMDRelayServiceController)relayController
{
  return +[IMDRelayServiceController sharedInstance];
}

- (IMDRelayEnrollmentController)relayEnrollmentController
{
  v2 = [(IMDTelephonyServiceSession *)self relayController];
  id v3 = [v2 enrollmentController];

  return (IMDRelayEnrollmentController *)v3;
}

- (void)enrollDeviceInSMSRelay:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDTelephonyServiceSession *)self relayEnrollmentController];
  [v5 enrollDeviceInSMSRelay:v4];
}

- (void)unEnrollDeviceInSMSRelay:(id)a3
{
  id v4 = a3;
  id v5 = [(IMDTelephonyServiceSession *)self relayEnrollmentController];
  [v5 unEnrollDeviceInSMSRelay:v4];
}

- (void)enrollSelfDeviceInSMSRelay
{
  id v2 = [(IMDTelephonyServiceSession *)self relayEnrollmentController];
  [v2 enrollSelfDeviceInSMSRelay];
}

- (void)processMessageSendFailure:(id)a3
{
  id v5 = a3;
  if ([v5 length])
  {
    id v4 = [(IMDTelephonyServiceSession *)self relayController];
    [v4 messageFailedToSend:v5];
  }
}

- (void)didReceiveDisplayNameChange:(id)a3 guid:(id)a4 fromID:(id)a5 toIdentifier:(id)a6 forChat:(id)a7 style:(unsigned __int8)a8 account:(id)a9
{
  LOBYTE(v9) = 0;
  [(IMDTelephonyServiceSession *)self didReceiveDisplayNameChange:a3 guid:a4 fromID:a5 toIdentifier:a6 forChat:a7 style:a8 account:a9 shouldRelay:v9];
}

- (void)didReceiveDisplayNameChange:(id)a3 guid:(id)a4 fromID:(id)a5 toIdentifier:(id)a6 forChat:(id)a7 style:(unsigned __int8)a8 account:(id)a9 shouldRelay:(BOOL)a10
{
  uint64_t v10 = a8;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  v34.receiver = self;
  v34.super_class = (Class)IMDTelephonyServiceSession;
  [(IMDServiceSession *)&v34 didReceiveDisplayNameChange:v16 guid:v17 fromID:v18 toIdentifier:v19 forChat:v20 style:v10 account:a9];
  int v21 = [(IMDServiceSession *)self service];
  int v22 = [v21 supportsCapability:*MEMORY[0x1E4F6E038]];

  if (v22) {
    BOOL v23 = !a10;
  }
  else {
    BOOL v23 = 1;
  }
  if (!v23 && [v19 length])
  {
    char v33 = [(IMDServiceSession *)self chatForChatIdentifier:v20 style:v10];
    id v31 = [IMDRelayGroupDisplayNameMutationMessage alloc];
    uint64_t v32 = [(IMDServiceSession *)self service];
    __int16 v30 = [v32 internalName];
    __int16 v24 = [v33 groupID];
    int v25 = [v33 originalGroupID];
    __int16 v26 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v17];
    LOWORD(v29) = 0;
    id v27 = -[IMDRelayGroupDisplayNameMutationMessage initWithName:sender:service:groupID:originalGroupID:guid:destinationCallerID:failed:fromMe:](v31, "initWithName:sender:service:groupID:originalGroupID:guid:destinationCallerID:failed:fromMe:", v16, v18, v30, v24, v25, v26, v19, v29);

    __int16 v28 = [(IMDTelephonyServiceSession *)self relayController];
    [v28 reflectGroupMutation:v27 callerID:v19 didOccurLocally:1];
  }
}

- (IMDRelayAttachmentController)attachmentController
{
  return self->_attachmentController;
}

- (void)setAttachmentController:(id)a3
{
}

- (void)setRelayController:(id)a3
{
}

- (void)setRelayEnrollmentController:(id)a3
{
}

- (NSMutableDictionary)outgoingRelayMessageTimerMap
{
  return self->_outgoingRelayMessageTimerMap;
}

- (void)setOutgoingRelayMessageTimerMap:(id)a3
{
}

- (NSMutableSet)originatedMessages
{
  return self->_originatedMessages;
}

- (void)setOriginatedMessages:(id)a3
{
}

- (BOOL)pendingOriginatedMessagesTimer
{
  return self->_pendingOriginatedMessagesTimer;
}

- (void)setPendingOriginatedMessagesTimer:(BOOL)a3
{
  self->_pendingOriginatedMessagesTimer = a3;
}

- (IMMultiQueue)incomingMessageMultiQueue
{
  return self->_incomingMessageMultiQueue;
}

- (void)setIncomingMessageMultiQueue:(id)a3
{
}

- (BOOL)isRegisteredForCTPhoneNumberNotifications
{
  return self->_isRegisteredForCTPhoneNumberNotifications;
}

- (void)setIsRegisteredForCTPhoneNumberNotifications:(BOOL)a3
{
  self->_isRegisteredForCTPhoneNumberNotifications = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_incomingMessageMultiQueue, 0);
  objc_storeStrong((id *)&self->_outgoingRelayMessageTimerMap, 0);
  objc_storeStrong((id *)&self->_relayEnrollmentController, 0);
  objc_storeStrong((id *)&self->_relayController, 0);
  objc_storeStrong((id *)&self->_attachmentController, 0);
  objc_storeStrong((id *)&self->_tapbackInterpreter, 0);

  objc_storeStrong((id *)&self->_originatedMessages, 0);
}

- (void)_setupCoreTelephonyObservation
{
  id v3 = +[IMDLocalDaemon sharedDaemon];
  int v4 = [v3 isSetupComplete];

  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      int v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Daemon is ready registering for incoming messages", buf, 2u);
      }
    }
    [(IMDTelephonyServiceSession *)self _registerForIncomingMessages:0];
  }
  else
  {
    if (v5)
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Daemon is not yet ready, watching for notification to register for incoming messages", v9, 2u);
      }
    }
    id v8 = [MEMORY[0x1E4F28EB8] defaultCenter];
    [v8 addObserver:self selector:sel__registerForIncomingMessages_ name:*MEMORY[0x1E4F6C480] object:0];
  }
}

- (void)_registerForIncomingMessages:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v6 = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Registering for incoming messages", v6, 2u);
    }
  }
  [(IMDTelephonyServiceSession *)self _registerForCTNotifications];
}

- (void)_registerForCTNotifications
{
  if (![(IMDTelephonyServiceSession *)self isRegisteredForCTPhoneNumberNotifications])
  {
    [(IMDTelephonyServiceSession *)self setIsRegisteredForCTPhoneNumberNotifications:1];
    if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)int v5 = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Registering for Message Receipts.", v5, 2u);
      }
    }
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterAddObserver();
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1D96FFDC8, (CFStringRef)*MEMORY[0x1E4F6DF78], 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }
}

- (void)_teardownCoreTelephonyObservation
{
  if ([(IMDTelephonyServiceSession *)self isRegisteredForCTPhoneNumberNotifications])
  {
    [(IMDTelephonyServiceSession *)self setIsRegisteredForCTPhoneNumberNotifications:0];
    if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v4 = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Unregistering for Message Receipts.", v4, 2u);
      }
    }
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterRemoveObserver();
  }
}

- (id)chatRegistry
{
  return +[IMDChatRegistry sharedInstance];
}

- (void)handler:(id)a3 incomingPlainTextMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 storageContext:(id)a9
{
  id v11 = a4;
  id v12 = a7;
  id v13 = a9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1D973D0CC;
  v17[3] = &unk_1E6B756D0;
  id v18 = v11;
  id v19 = self;
  id v20 = v12;
  id v21 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  [(IMDTelephonyServiceSession *)self _enqueueBlock:v17 withTimeout:45.0];
}

- (void)handler:(id)a3 incomingDownloadMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 storageContext:(id)a9
{
  id v11 = a4;
  id v12 = a7;
  id v13 = a9;
  v17[0] = MEMORY[0x1E4F143A8];
  v17[1] = 3221225472;
  v17[2] = sub_1D973D824;
  v17[3] = &unk_1E6B756D0;
  void v17[4] = self;
  id v18 = v11;
  id v19 = v12;
  id v20 = v13;
  id v14 = v13;
  id v15 = v12;
  id v16 = v11;
  [(IMDTelephonyServiceSession *)self _enqueueBlock:v17 withTimeout:240.0];
}

- (void)handler:(id)a3 outgoingPlainTextMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 isBeingReplayed:(BOOL)a10 storageContext:(id)a11
{
}

- (id)chatForOutgoingMessage:(id)a3 fromIdentifier:(id)a4 isInProxyMode:(BOOL)a5 createIfNotExists:(BOOL)a6
{
  BOOL v74 = a6;
  BOOL v6 = a5;
  uint64_t v104 = *MEMORY[0x1E4F143B8];
  id v80 = a3;
  id v77 = a4;
  v79 = self;
  uint64_t v9 = [(IMDServiceSession *)self service];
  int v10 = [v9 supportsCapability:*MEMORY[0x1E4F6E038]];

  if (v10)
  {
    id v11 = [v80 objectForKeyedSubscript:IMDRelayMessageItemDictionary];
    v76 = [v11 objectForKeyedSubscript:IMDRelayMessageDictionaryChatDisplayNameKey];
  }
  else
  {
    v76 = 0;
  }
  id v12 = [(IMDServiceSession *)self service];
  int v13 = [v12 supportsCapability:*MEMORY[0x1E4F6E010]];

  if (v13)
  {
    id v14 = [v80 objectForKeyedSubscript:IMDRelayMessageItemDictionary];
    v75 = [v14 objectForKeyedSubscript:IMDRelayMessageDictionaryChatGroupIDKey];

    id v15 = [v80 objectForKeyedSubscript:IMDRelayMessageItemDictionary];
    v78 = [v15 objectForKeyedSubscript:IMDRelayMessageDictionaryChatOriginalGroupID];
  }
  else
  {
    v78 = 0;
    v75 = 0;
  }
  id v16 = [v80 objectForKey:IMDCTMessageDictionaryReceipientsKey];
  objc_msgSend(v16, "__imArrayByApplyingBlock:", &unk_1F33910C0);
  id v17 = (__CFString *)objc_claimAutoreleasedReturnValue();

  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v96 = v17;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "ChatForOutgoingMessage recipients %@", buf, 0xCu);
    }
  }
  id v19 = [(IMDTelephonyServiceSession *)self relayController];
  int v20 = [v19 _isDefaultPairedDeviceRelayingLocally:v77];

  long long v92 = 0u;
  long long v93 = 0u;
  long long v90 = 0u;
  long long v91 = 0u;
  id obj = v17;
  uint64_t v21 = [(__CFString *)obj countByEnumeratingWithState:&v90 objects:v103 count:16];
  if (v21)
  {
    int v22 = v20 | v6;
    uint64_t v23 = *(void *)v91;
    if (v20 | v6) {
      __int16 v24 = @"YES";
    }
    else {
      __int16 v24 = @"NO";
    }
    v83 = v24;
    if (v20) {
      int v25 = @"YES";
    }
    else {
      int v25 = @"NO";
    }
    if (v6) {
      __int16 v26 = @"YES";
    }
    else {
      __int16 v26 = @"NO";
    }
    while (2)
    {
      for (uint64_t i = 0; i != v21; ++i)
      {
        if (*(void *)v91 != v23) {
          objc_enumerationMutation(obj);
        }
        uint64_t v28 = *(void *)(*((void *)&v90 + 1) + 8 * i);
        uint64_t v29 = [MEMORY[0x1E4F6B3E8] sharedInstance];
        int v30 = [v29 isPhoneNumberEmergencyNumber:v28];

        int v31 = IMOSLoggingEnabled();
        if (((v30 ^ 1 | v22) & 1) == 0)
        {
          if (v31)
          {
            __int16 v42 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "One of the recipients of this outgoing message is an emergency number, Not processing message", buf, 2u);
            }
          }
          id v43 = 0;
          uint64_t v44 = obj;
          goto LABEL_71;
        }
        if (v31)
        {
          uint64_t v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138413058;
            char v33 = @"NO";
            if (v30) {
              char v33 = @"YES";
            }
            v96 = v33;
            __int16 v97 = 2112;
            v98 = v83;
            __int16 v99 = 2112;
            v100 = v25;
            __int16 v101 = 2112;
            v102 = v26;
            _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Will send SMS, recipient is Emergency %@, shouldRelayEmergencyTextFromPairedDevice: %@, isDefaultPairedDeviceRelayingLocally: %@, isInProxyMode %@ ", buf, 0x2Au);
          }
        }
      }
      uint64_t v21 = [(__CFString *)obj countByEnumeratingWithState:&v90 objects:v103 count:16];
      if (v21) {
        continue;
      }
      break;
    }
  }

  v84 = (__CFString *)objc_alloc_init(MEMORY[0x1E4F1CA48]);
  objc_super v34 = [v80 objectForKey:IMDRelayMessageDictionaryChatStyleKey];
  int v72 = _ChatStyleFromChatStyleString(v34);

  buf[0] = v72;
  if (v72 == 45)
  {
    v73 = [(__CFString *)obj __imFirstObject];
    long long v35 = (void *)MEMORY[0x1E4F1C9E8];
    long long v36 = [NSNumber numberWithInt:2];
    int v37 = objc_msgSend(v35, "dictionaryWithObjectsAndKeys:", v36, *MEMORY[0x1E4F6C458], v73, *MEMORY[0x1E4F6C5C8], 0);

    [(__CFString *)v84 addObject:v37];
    BOOL v38 = +[IMDChatRegistry sharedInstance];
    BOOL v39 = [(__CFString *)obj __imFirstObject];
    __int16 v40 = [(IMDServiceSession *)v79 account];
    uint64_t v41 = [v38 existingChatForID:v39 account:v40];
LABEL_56:
    long long v60 = (void *)v41;

    goto LABEL_57;
  }
  __int16 v45 = [(IMDTelephonyServiceSession *)v79 chatRegistry];
  uint64_t v46 = [(IMDServiceSession *)v79 account];
  v73 = [v45 generateUnusedChatIdentifierForGroupChatWithAccount:v46];

  long long v88 = 0u;
  long long v89 = 0u;
  long long v86 = 0u;
  long long v87 = 0u;
  v82 = obj;
  uint64_t v47 = [(__CFString *)v82 countByEnumeratingWithState:&v86 objects:v94 count:16];
  if (v47)
  {
    uint64_t v48 = *(void *)v87;
    uint64_t v49 = *MEMORY[0x1E4F6C458];
    uint64_t v50 = *MEMORY[0x1E4F6C5C8];
    do
    {
      for (uint64_t j = 0; j != v47; ++j)
      {
        if (*(void *)v87 != v48) {
          objc_enumerationMutation(v82);
        }
        uint64_t v52 = *(void *)(*((void *)&v86 + 1) + 8 * j);
        uint64_t v53 = (void *)MEMORY[0x1E4F1C9E8];
        long long v54 = [NSNumber numberWithInt:2];
        long long v55 = objc_msgSend(v53, "dictionaryWithObjectsAndKeys:", v54, v49, v52, v50, 0);

        [(__CFString *)v84 addObject:v55];
      }
      uint64_t v47 = [(__CFString *)v82 countByEnumeratingWithState:&v86 objects:v94 count:16];
    }
    while (v47);
  }

  long long v56 = +[IMDChatRegistry sharedInstance];
  long long v57 = [(IMDServiceSession *)v79 account];
  long long v58 = [(IMDServiceSession *)v79 service];
  if ([v58 groupsMergeDisplayNames]) {
    uint64_t v59 = v76;
  }
  else {
    uint64_t v59 = 0;
  }
  long long v60 = [v56 existingChatForIDs:v82 account:v57 displayName:v59 groupID:v75 style:43];

  if (!v60 && v78)
  {
    BOOL v38 = +[IMDChatRegistry sharedInstance];
    BOOL v39 = [(IMDServiceSession *)v79 account];
    __int16 v40 = [(IMDServiceSession *)v79 service];
    if ([v40 groupsMergeDisplayNames]) {
      uint64_t v61 = v76;
    }
    else {
      uint64_t v61 = 0;
    }
    uint64_t v41 = [v38 existingChatForIDs:v82 account:v39 displayName:v61 originalGroupID:v78 style:43];
    goto LABEL_56;
  }
LABEL_57:
  if (v60)
  {
    id v62 = [v60 chatIdentifier];

    buf[0] = [v60 style];
    id v43 = v60;
  }
  else
  {
    id v85 = v73;
    [(IMDServiceSession *)v79 canonicalizeChatIdentifier:&v85 style:buf];
    id v62 = v85;

    if (v74)
    {
      [(IMDServiceSession *)v79 didJoinChat:v62 style:buf[0] displayName:v76 groupID:v75 originalGroupID:v78 handleInfo:v84];
      long long v63 = +[IMDChatRegistry sharedInstance];
      if (v72 == 45)
      {
        uint64_t v64 = [(__CFString *)obj __imFirstObject];
        id v65 = [(IMDServiceSession *)v79 account];
        id v43 = [v63 existingChatForID:v64 account:v65];
      }
      else
      {
        uint64_t v64 = [(IMDServiceSession *)v79 account];
        id v43 = [v63 existingChatForIDs:obj account:v64 displayName:v76 groupID:v75 style:43];
      }
    }
    else
    {
      id v43 = 0;
    }
  }
  if (!v78) {
    goto LABEL_70;
  }
  id v66 = [v43 originalGroupID];
  if ([v66 isEqualToString:v78]) {
    goto LABEL_69;
  }
  BOOL v67 = [(IMDServiceSession *)v79 allowedToOverwriteOriginalGroupIDForChat:v43];

  if (v67)
  {
    [v43 setOriginalGroupID:v78];
    v68 = +[IMDChatStore sharedInstance];
    [v68 storeChat:v43];

    id v66 = -[IMDServiceSession broadcasterForChatListenersWithBlackholeStatus:](v79, "broadcasterForChatListenersWithBlackholeStatus:", [v43 isBlackholed]);
    v69 = [v43 guid];
    v70 = [v43 dictionaryRepresentation];
    [v66 chat:v69 updated:v70];

LABEL_69:
  }
LABEL_70:

  uint64_t v44 = v84;
LABEL_71:

  return v43;
}

- (BOOL)_allowedToProcessMessageFromToken:(id)a3 fromID:(id)a4 reflectOnly:(BOOL)a5 isInProxyMode:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = (char *)a4;
  id v12 = [(IMDTelephonyServiceSession *)self relayController];
  int v13 = [v12 idsDeviceFromPushToken:v10];

  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [v13 name];
      int v37 = 138412290;
      BOOL v38 = v15;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, " Outgoing message request from %@", (uint8_t *)&v37, 0xCu);
    }
  }
  if (!v13 || a5)
  {
    if (!v13)
    {
      if (IMOSLoggingEnabled())
      {
        int v31 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
        {
          int v37 = 138412290;
          BOOL v38 = v11;
          _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, " This message was likely from a local device, looking for fromID: %@", (uint8_t *)&v37, 0xCu);
        }
      }
      uint64_t v32 = [(IMDTelephonyServiceSession *)self relayController];
      int v13 = [v32 idsDeviceForFromID:v11];
    }
  }
  else
  {
    id v16 = [(IMDTelephonyServiceSession *)self relayController];
    int v17 = [v16 _localDeviceSupportsSMS];

    if (v17)
    {
      if (IMOSLoggingEnabled())
      {
        id v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LOWORD(v37) = 0;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, " This message was destined for me to send out, I am the gatekeeper", (uint8_t *)&v37, 2u);
        }
      }
      id v19 = [(IMDTelephonyServiceSession *)self relayController];
      if ([v19 isSMSRelayEnabled])
      {
      }
      else
      {
        char v20 = [v13 isDefaultPairedDevice];

        if ((v20 & 1) == 0) {
          goto LABEL_25;
        }
      }
      uint64_t v21 = [(IMDTelephonyServiceSession *)self relayEnrollmentController];
      int v22 = [v21 _allowedDevicesforSMSRelay];
      uint64_t v23 = [v13 uniqueID];
      int v24 = [v22 containsObject:v23];

      int v25 = IMOSLoggingEnabled();
      if (v24)
      {
        if (v25)
        {
          __int16 v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            id v27 = [v13 name];
            int v37 = 138412290;
            BOOL v38 = v27;
            _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, " Device %@ is on the allowed list, Telling the block to continue", (uint8_t *)&v37, 0xCu);
          }
        }
        BOOL v28 = 1;
        goto LABEL_43;
      }
      if (v25)
      {
        uint64_t v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          int v30 = [v13 name];
          int v37 = 138412290;
          BOOL v38 = v30;
          _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, " Device %@ is on the blockList, sending back a failure", (uint8_t *)&v37, 0xCu);
        }
      }
LABEL_25:
      BOOL v28 = 0;
      goto LABEL_43;
    }
  }
  if (IMOSLoggingEnabled())
  {
    char v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      objc_super v34 = "Not Nil";
      if (!v13) {
        objc_super v34 = "Nil";
      }
      long long v35 = @"YES";
      if (!v6) {
        long long v35 = @"NO";
      }
      int v37 = 136315394;
      BOOL v38 = v34;
      __int16 v39 = 2112;
      __int16 v40 = v35;
      _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, " This message was not for us to gatekeep, we should reflect it only if it came from one of our devices (senderDevice %s) isInProxyMode %@", (uint8_t *)&v37, 0x16u);
    }
  }
  if (v13) {
    BOOL v28 = 1;
  }
  else {
    BOOL v28 = v6;
  }
LABEL_43:

  return v28;
}

- (void)handler:(id)a3 outgoingPlainTextMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 isBeingReplayed:(BOOL)a10 isInProxyMode:(BOOL)a11 storageContext:(id)a12
{
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a12;
  v31[0] = MEMORY[0x1E4F143A8];
  v31[1] = 3221225472;
  v31[2] = sub_1D973F494;
  v31[3] = &unk_1E6B75798;
  v31[4] = self;
  id v32 = v19;
  BOOL v39 = a11;
  id v33 = v18;
  id v34 = v17;
  BOOL v40 = a10;
  id v35 = v20;
  id v36 = v21;
  id v37 = v22;
  id v38 = v23;
  id v24 = v23;
  id v25 = v22;
  id v26 = v21;
  id v27 = v20;
  id v28 = v17;
  id v29 = v18;
  id v30 = v19;
  [(IMDTelephonyServiceSession *)self _enqueueBlock:v31 withTimeout:45.0];
}

- (void)sendUnapproveToToken:(id)a3 messageGUID:(id)a4 completion:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = (void (**)(void))a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "This device is not on the allowed list, it should not have been trying to send a relay message, sending a message back to it to tell it to not send relay messages in the future", buf, 2u);
    }
  }
  id v12 = [(IMDTelephonyServiceSession *)self relayController];
  int v13 = [v12 idsDeviceFromPushToken:v8];

  id v14 = objc_msgSend(MEMORY[0x1E4F1C9E8], "dictionaryWithObjectsAndKeys:", v9, IMDRelayMessageDictionaryGUIDKey, MEMORY[0x1E4F1CC38], IMDRelayAuthorizationUnauthorizedDeviceKey, 0);
  id v15 = [(IMDTelephonyServiceSession *)self relayController];
  id v16 = [v15 enrollmentController];
  [v16 sendUnApproveToDevice:v13 extraKeys:v14];

  v10[2](v10);
}

- (void)handler:(id)a3 outgoingDownloadMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 isBeingReplayed:(BOOL)a10 isInProxyMode:(BOOL)a11 storageContext:(id)a12
{
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a8;
  id v22 = a9;
  id v23 = a12;
  v32[0] = MEMORY[0x1E4F143A8];
  v32[1] = 3221225472;
  v32[2] = sub_1D9740F28;
  v32[3] = &unk_1E6B75798;
  id v24 = self;
  v32[4] = self;
  id v33 = v17;
  BOOL v40 = a10;
  id v34 = v20;
  id v35 = v21;
  id v36 = v22;
  id v37 = v23;
  id v38 = v19;
  id v39 = v18;
  BOOL v41 = a11;
  id v25 = v18;
  id v26 = v19;
  id v27 = v23;
  id v28 = v22;
  id v29 = v21;
  id v30 = v20;
  id v31 = v17;
  [(IMDTelephonyServiceSession *)v24 _enqueueBlock:v32 withTimeout:240.0];
}

- (BOOL)responsibleForMessageID:(id)a3
{
  id v4 = a3;
  int v5 = +[IMDMessageStore sharedInstance];
  BOOL v6 = [v5 messageWithGUID:v4];

  id v7 = [v6 service];
  id v8 = [(IMDServiceSession *)self service];
  id v9 = [v8 internalName];
  char v10 = [v7 isEqualToString:v9];

  return v10;
}

- (void)handler:(id)a3 messageIDSent:(id)a4 wasInterworked:(BOOL)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 timeStamp:(id)a8 storageContext:(id)a9
{
  id v11 = a4;
  id v12 = a9;
  v15[0] = MEMORY[0x1E4F143A8];
  v15[1] = 3221225472;
  v15[2] = sub_1D9742698;
  v15[3] = &unk_1E6B75810;
  v15[4] = self;
  id v16 = v11;
  id v17 = v12;
  BOOL v18 = a5;
  id v13 = v12;
  id v14 = v11;
  [(IMDTelephonyServiceSession *)self _enqueueBlock:v15 withTimeout:45.0];
}

- (void)handler:(id)a3 messageIDRead:(id)a4 readByMe:(BOOL)a5 timeStamp:(id)a6 toIdentifier:(id)a7 fromIdentifier:(id)a8 fromToken:(id)a9 reflectOnly:(BOOL)a10 storageContext:(id)a11
{
  id v28 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a11;
  v38[0] = 0;
  v38[1] = v38;
  v38[2] = 0x3032000000;
  v38[3] = sub_1D9742A90;
  v38[4] = sub_1D9742AA0;
  id v39 = 0;
  id v39 = (id)[objc_alloc(MEMORY[0x1E4F6C3B0]) initWithIdentifier:@"IncomingReadReceiptAssertion" timeout:10.0];
  v29[0] = MEMORY[0x1E4F143A8];
  v29[1] = 3221225472;
  v29[2] = sub_1D9742AA8;
  v29[3] = &unk_1E6B75838;
  v29[4] = self;
  id v23 = v17;
  id v30 = v23;
  id v24 = v18;
  id v31 = v24;
  id v25 = v22;
  id v32 = v25;
  BOOL v36 = a5;
  id v26 = v21;
  id v33 = v26;
  BOOL v37 = a10;
  id v27 = v19;
  id v34 = v27;
  id v35 = v38;
  [(IMDTelephonyServiceSession *)self _enqueueBlock:v29 withTimeout:45.0];

  _Block_object_dispose(v38, 8);
}

- (void)handler:(id)a3 messageIDSendFailure:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timeStamp:(id)a7 storageContext:(id)a8
{
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a8;
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1D9742EBC;
  v20[3] = &unk_1E6B75860;
  v20[4] = self;
  id v21 = v12;
  id v22 = v14;
  id v23 = v13;
  id v24 = v15;
  id v16 = v15;
  id v17 = v13;
  id v18 = v14;
  id v19 = v12;
  [(IMDTelephonyServiceSession *)self _enqueueBlock:v20 withTimeout:45.0];
}

- (void)handler:(id)a3 localFileResponse:(id)a4 storageContext:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [(IMDServiceSession *)self service];
      id v13 = [v12 internalName];
      int v15 = 138412546;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "%@ relay received remote file response %@", (uint8_t *)&v15, 0x16u);
    }
  }
  id v14 = [(IMDTelephonyServiceSession *)self attachmentController];
  [v14 remoteFileResponse:v9];
}

- (void)handler:(id)a3 localFileRequest:(id)a4 storageContext:(id)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [(IMDServiceSession *)self service];
      id v13 = [v12 internalName];
      int v15 = 138412546;
      id v16 = v13;
      __int16 v17 = 2112;
      id v18 = v9;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "%@ relay received remote file request %@", (uint8_t *)&v15, 0x16u);
    }
  }
  id v14 = [(IMDTelephonyServiceSession *)self attachmentController];
  [v14 remotefileRequest:v9 attempts:0];
}

- (void)handler:(id)a3 localIncommingMessage:(id)a4 storageContext:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [(IMDServiceSession *)self service];
      id v13 = [v12 internalName];
      int v15 = 138412290;
      id v16 = v13;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "%@ relay received Local incomming Message", (uint8_t *)&v15, 0xCu);
    }
  }
  id v14 = [v9 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryIncomingDictKey];
  [(IMDTelephonyServiceSession *)self _processReceivedDictionary:v14 storageContext:v10 receivedViaRelay:1 withCompletionBlock:0];
}

- (void)handler:(id)a3 localIncomingDownloadMessage:(id)a4 storageContext:(id)a5
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      id v12 = [(IMDServiceSession *)self service];
      id v13 = [v12 internalName];
      int v15 = 138412290;
      id v16 = v13;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "%@ relay received Local incomming download Message", (uint8_t *)&v15, 0xCu);
    }
  }
  id v14 = [v9 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryIncomingDictKey];
  [(IMDTelephonyServiceSession *)self _processReceivedDictionary:v14 storageContext:v10 receivedViaRelay:1 withCompletionBlock:0];
}

- (void)handler:(id)a3 localOutgoingDownloadMessage:(id)a4 isBeingReplayed:(BOOL)a5 storageContext:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [(IMDServiceSession *)self service];
      int v15 = [v14 internalName];
      *(_DWORD *)buf = 138412290;
      id v20 = v15;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "%@ relay received Local outgoing Download Message", buf, 0xCu);
    }
  }
  id v16 = [v11 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryOutgoingDictKey];
  uint64_t v17 = [v11 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryGUIDKey];
  BYTE1(v18) = 1;
  LOBYTE(v18) = a5;
  -[IMDTelephonyServiceSession handler:outgoingDownloadMessage:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:isBeingReplayed:isInProxyMode:storageContext:](self, "handler:outgoingDownloadMessage:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:isBeingReplayed:isInProxyMode:storageContext:", v10, v16, 0, 0, 0, v17, 0, v18, v12);
}

- (void)handler:(id)a3 localOutgoingMessage:(id)a4 isBeingReplayed:(BOOL)a5 storageContext:(id)a6
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      id v14 = [(IMDServiceSession *)self service];
      int v15 = [v14 internalName];
      *(_DWORD *)buf = 138412290;
      id v20 = v15;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "%@ relay received Local outgoing Message", buf, 0xCu);
    }
  }
  id v16 = [v11 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryOutgoingDictKey];
  uint64_t v17 = [v11 objectForKeyedSubscript:IMDRelayLocalMessageDictionaryGUIDKey];
  BYTE1(v18) = 1;
  LOBYTE(v18) = a5;
  -[IMDTelephonyServiceSession handler:outgoingPlainTextMessage:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:isBeingReplayed:isInProxyMode:storageContext:](self, "handler:outgoingPlainTextMessage:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:isBeingReplayed:isInProxyMode:storageContext:", 0, v16, 0, 0, 0, v17, 0, v18, v12);
}

- (void)handler:(id)a3 localMessageSent:(id)a4 wasInterworked:(BOOL)a5 storageContext:(id)a6
{
}

- (void)handler:(id)a3 localMessageRead:(id)a4 readByMe:(BOOL)a5 timeStamp:(id)a6 storageContext:(id)a7
{
  LOBYTE(v7) = 0;
  [(IMDTelephonyServiceSession *)self handler:0 messageIDRead:a4 readByMe:a5 timeStamp:a6 toIdentifier:0 fromIdentifier:0 fromToken:0 reflectOnly:v7 storageContext:a7];
}

- (void)handler:(id)a3 localMessageError:(id)a4 storageContext:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  v11[0] = MEMORY[0x1E4F143A8];
  v11[1] = 3221225472;
  v11[2] = sub_1D9743A7C;
  v11[3] = &unk_1E6B75888;
  v11[4] = self;
  id v12 = v8;
  id v13 = v7;
  id v9 = v7;
  id v10 = v8;
  [(IMDTelephonyServiceSession *)self _enqueueBlock:v11 withTimeout:45.0];
}

- (BOOL)_canLocallySendWithPhoneNumber:(id)a3
{
  id v3 = a3;
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    id v4 = [MEMORY[0x1E4F6E668] sharedInstance];
    int v5 = [v4 ctSubscriptionInfo];
    char v6 = objc_msgSend(v5, "__im_containsPhoneNumber:", v3);
  }
  else
  {
    char v6 = 0;
  }

  return v6;
}

- (id)_chatForGroupID:(id)a3 originalGroupID:(id)a4
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IMDChatRegistry sharedInstance];
  id v9 = [(IMDServiceSession *)self service];
  id v10 = [v9 internalName];
  id v11 = [v8 newestExistingChatWithOriginalGroupID:v7 onService:v10];

  if (v11)
  {
    id v12 = v11;
  }
  else
  {
    id v13 = +[IMDChatRegistry sharedInstance];
    id v14 = [v13 existingChatsWithGroupID:v6];

    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v15 = v14;
    uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v16)
    {
      uint64_t v17 = v16;
      id v26 = v7;
      id v27 = v6;
      uint64_t v18 = *(void *)v29;
      while (2)
      {
        for (uint64_t i = 0; i != v17; ++i)
        {
          if (*(void *)v29 != v18) {
            objc_enumerationMutation(v15);
          }
          id v20 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          uint64_t v21 = [v20 serviceName];
          id v22 = [(IMDServiceSession *)self service];
          id v23 = [v22 internalName];
          char v24 = [v21 isEqualToString:v23];

          if (v24)
          {
            id v12 = v20;
            goto LABEL_13;
          }
        }
        uint64_t v17 = [v15 countByEnumeratingWithState:&v28 objects:v32 count:16];
        if (v17) {
          continue;
        }
        break;
      }
      id v12 = 0;
LABEL_13:
      id v7 = v26;
      id v6 = v27;
      id v11 = 0;
    }
    else
    {
      id v12 = 0;
    }
  }

  return v12;
}

- (void)handler:(id)a3 incomingGroupMutationMessage:(id)a4 timeStamp:(id)a5 storageContext:(id)a6 fromToken:(id)a7 fromID:(id)a8 isInProxyMode:(BOOL)a9
{
  id v12 = a4;
  id v13 = a7;
  id v14 = a8;
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1D9743F60;
  v18[3] = &unk_1E6B75900;
  v18[4] = self;
  id v19 = v13;
  BOOL v22 = a9;
  id v20 = v14;
  id v21 = v12;
  id v15 = v12;
  id v16 = v14;
  id v17 = v13;
  [(IMDTelephonyServiceSession *)self _enqueueBlock:v18 withTimeout:45.0];
}

- (BOOL)_sosReplicationDisabledByServerBag
{
  id v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"disable-sos-replication"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 BOOLValue])
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "SOS replication disabled by server bag", v7, 2u);
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

- (double)_periodicReplicationTimeInterval
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  id v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"forced-replication-interval"];
  double v4 = 14400.0;
  if (objc_opt_respondsToSelector())
  {
    [v3 doubleValue];
    if (v5 != 0.0)
    {
      if (IMOSLoggingEnabled())
      {
        id v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          [v3 doubleValue];
          int v10 = 134217984;
          uint64_t v11 = v7;
          _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Server bag value for periodic replication interval: %f", (uint8_t *)&v10, 0xCu);
        }
      }
      [v3 doubleValue];
      double v4 = v8;
    }
  }

  return v4;
}

- (BOOL)_shouldForceReplicationForStaleChatWithLastKnownReplicationDate:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  [(IMDTelephonyServiceSession *)self _periodicReplicationTimeInterval];
  double v6 = v5;
  if (v5 <= 0.00000011920929)
  {
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Periodic forced replication interval is less than or equal to zero, disabling", (uint8_t *)&v16, 2u);
      }
    }
    BOOL v10 = 0;
  }
  else if (v4)
  {
    uint64_t v7 = [MEMORY[0x1E4F1C9C8] now];
    [v7 timeIntervalSinceDate:v4];
    double v9 = v8;

    BOOL v10 = v9 > v6;
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        uint64_t v12 = @"NO";
        int v16 = 138412802;
        if (v9 > v6) {
          uint64_t v12 = @"YES";
        }
        id v17 = v12;
        __int16 v18 = 2048;
        double v19 = v9;
        __int16 v20 = 2048;
        double v21 = v6;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Should force replication: %@ (time since last: %f, interval: %f)", (uint8_t *)&v16, 0x20u);
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
        LOWORD(v16) = 0;
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "No last known replication date, forcing replication", (uint8_t *)&v16, 2u);
      }
    }
    BOOL v10 = 1;
  }

  return v10;
}

- (BOOL)_replicationDisabledByServerBag
{
  id v2 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"disable-hybrid-groups"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 BOOLValue])
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Hybrid groups disabled by server bag", v7, 2u);
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

- (BOOL)acceptsIncomingReplicatedMessagesFromAccount:(id)a3 toIdentifier:(id)a4 isSOS:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  BOOL v10 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v11 = [v10 isSOSAlertingEnabled];

  if (v11) {
    BOOL v12 = !v5;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12
    || [(IMDTelephonyServiceSession *)self _sosReplicationDisabledByServerBag])
  {
    id v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v14 = [v13 isPriusEnabled];

    if (v14 && ![(IMDTelephonyServiceSession *)self _replicationDisabledByServerBag])
    {
      if (v9 && ([v9 _appearsToBePhoneNumber] & 1) != 0)
      {
        BOOL v15 = [(IMDTelephonyServiceSession *)self replicationRequirementsSatisfiedForPhoneNumber:v9 simID:0];
        goto LABEL_21;
      }
      if (IMOSLoggingEnabled())
      {
        id v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          __int16 v18 = [(IMDServiceSession *)self account];
          int v20 = 138412802;
          id v21 = v8;
          __int16 v22 = 2112;
          id v23 = v18;
          __int16 v24 = 2112;
          id v25 = v9;
          _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Cannot receive replication provided by %@ to %@, not a phone number %@", (uint8_t *)&v20, 0x20u);
        }
      }
    }
    BOOL v15 = 0;
    goto LABEL_21;
  }
  if (IMOSLoggingEnabled())
  {
    int v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412546;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Allowing incoming replicated SOS message from %@ to %@", (uint8_t *)&v20, 0x16u);
    }
  }
  BOOL v15 = 1;
LABEL_21:

  return v15;
}

- (BOOL)isOutgoingReplicationEnabled
{
  id v2 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  char v3 = [v2 isReplicationEnabled];

  return v3;
}

- (id)replicationPhoneNumbers
{
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA80]);
  id v4 = [(IMDTelephonyServiceSession *)self relayController];
  BOOL v5 = [v4 dominentPhoneNumberAlias];

  if (v5)
  {
    double v6 = IMChatCanonicalIDSIDsForAddress();
    uint64_t v7 = [v6 _stripFZIDPrefix];

    [v3 addObject:v7];
  }
  id v8 = (void *)[v3 copy];

  return v8;
}

- (id)outgoingReplicationCallerIDForChat:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 chatIdentifier];
  double v6 = -[IMDTelephonyServiceSession _callerIDForChatWithChatIdentifier:chatStyle:foundChat:](self, "_callerIDForChatWithChatIdentifier:chatStyle:foundChat:", v5, [v4 style], v4);

  return v6;
}

- (id)preferredAccountForReplicationOnService:(id)a3 eligibleAccounts:(id)a4
{
  uint64_t v60 = *MEMORY[0x1E4F143B8];
  id v38 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v54 = v38;
      __int16 v55 = 2112;
      id v56 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Choosing preferred replication account for %@ from %@", buf, 0x16u);
    }
  }
  id v8 = [(IMDTelephonyServiceSession *)self replicationPhoneNumbers];
  long long v49 = 0u;
  long long v50 = 0u;
  long long v47 = 0u;
  long long v48 = 0u;
  id v9 = v6;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v59 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v48;
    while (2)
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v48 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        int v14 = [v13 loginID];
        BOOL v15 = MEMORY[0x1E0169B80]();

        int v16 = IMChatCanonicalIDSIDsForAddress();
        id v17 = [v16 _stripFZIDPrefix];

        if ([v8 containsObject:v17])
        {
          if (IMOSLoggingEnabled())
          {
            long long v31 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              id v54 = v13;
              __int16 v55 = 2112;
              id v56 = v15;
              __int16 v57 = 2112;
              long long v58 = v17;
              _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Preferring account %@ for replication based on loginID %@ canonicalLoginID %@", buf, 0x20u);
            }
          }
          id v30 = v13;

          goto LABEL_43;
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v47 objects:v59 count:16];
      if (v10) {
        continue;
      }
      break;
    }
  }

  long long v45 = 0u;
  long long v46 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = v9;
  uint64_t v36 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
  if (v36)
  {
    uint64_t v18 = *(void *)v44;
    uint64_t v34 = *(void *)v44;
    do
    {
      for (uint64_t j = 0; j != v36; ++j)
      {
        if (*(void *)v44 != v18) {
          objc_enumerationMutation(obj);
        }
        int v20 = *(void **)(*((void *)&v43 + 1) + 8 * j);
        long long v39 = 0u;
        long long v40 = 0u;
        long long v41 = 0u;
        long long v42 = 0u;
        id v35 = v20;
        id v21 = [v20 aliases];
        uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v51 count:16];
        if (v22)
        {
          uint64_t v23 = *(void *)v40;
          while (2)
          {
            for (uint64_t k = 0; k != v22; ++k)
            {
              if (*(void *)v40 != v23) {
                objc_enumerationMutation(v21);
              }
              id v25 = *(void **)(*((void *)&v39 + 1) + 8 * k);
              uint64_t v26 = IMChatCanonicalIDSIDsForAddress();
              id v27 = [v26 _stripFZIDPrefix];

              if ([v8 containsObject:v27])
              {
                if (IMOSLoggingEnabled())
                {
                  id v32 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v54 = v35;
                    __int16 v55 = 2112;
                    id v56 = v25;
                    _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Preferring account %@ for replication based on alias %@", buf, 0x16u);
                  }
                }
                id v30 = v35;

                goto LABEL_43;
              }
            }
            uint64_t v22 = [v21 countByEnumeratingWithState:&v39 objects:v51 count:16];
            if (v22) {
              continue;
            }
            break;
          }
        }

        uint64_t v18 = v34;
      }
      uint64_t v36 = [obj countByEnumeratingWithState:&v43 objects:v52 count:16];
      uint64_t v18 = v34;
    }
    while (v36);
  }

  if (IMOSLoggingEnabled())
  {
    long long v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      long long v29 = [v8 allObjects];
      *(_DWORD *)buf = 138412290;
      id v54 = v29;
      _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Failed to find matching replication account with possible numbers %@", buf, 0xCu);
    }
  }
  id v30 = 0;
LABEL_43:

  return v30;
}

- (BOOL)_shouldReplicateMessageItem:(id)a3 chatStyle:(unsigned __int8)a4 lastKnownReplicationDate:(id)a5 callerID:(id)a6
{
  int v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  id v13 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v14 = [v13 isSOSAlertingEnabled];

  if (v14 && [v10 isSOS])
  {
    BOOL v15 = [(IMDTelephonyServiceSession *)self _sosReplicationDisabledByServerBag];
LABEL_10:
    BOOL v18 = !v15;
    goto LABEL_12;
  }
  int v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v17 = [v16 isPriusEnabled];

  BOOL v18 = 0;
  if (v8 == 43 && v17)
  {
    if (![(IMDTelephonyServiceSession *)self replicationRequiredForFeaturesUsedByMessageItem:v10]&& ![(IMDTelephonyServiceSession *)self _shouldForceReplicationForStaleChatWithLastKnownReplicationDate:v11]|| ![(IMDTelephonyServiceSession *)self replicationRequirementsSatisfiedForPhoneNumber:v12 simID:0])
    {
      BOOL v18 = 0;
      goto LABEL_12;
    }
    BOOL v15 = [(IMDTelephonyServiceSession *)self _replicationDisabledByServerBag];
    goto LABEL_10;
  }
LABEL_12:

  return v18;
}

- (BOOL)replicationRequirementsSatisfiedForPhoneNumber:(id)a3 simID:(id)a4
{
  return 0;
}

- (id)_replicatedMessageGUIDToReleaseFromMessageDictionary:(id)a3
{
  id v3 = a3;
  id v4 = [v3 objectForKeyedSubscript:IMDRelayMessageDictionaryAttemptedOutgoingReplicationKey];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v4 BOOLValue]
    && ([v3 objectForKeyedSubscript:IMDRelayMessageItemDictionary],
        (BOOL v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v6 = v5;
    uint64_t v7 = [v5 objectForKeyedSubscript:IMDRelayMessageItemDictionaryGUIDKey];
  }
  else
  {
    uint64_t v7 = 0;
  }

  return v7;
}

- (void)_deferredReplicatedMessageReleaseWithAllowedMessage:(id)a3 outgoingProxyBlock:(id)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  int v8 = [(IMDTelephonyServiceSession *)self _replicatedMessageGUIDToReleaseFromMessageDictionary:v6];
  if ([v8 length])
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        int v16 = v8;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Delaying release of replicated message %@", buf, 0xCu);
      }
    }
    dispatch_time_t v10 = dispatch_time(0, 1000000000);
    block[0] = MEMORY[0x1E4F143A8];
    block[1] = 3221225472;
    block[2] = sub_1D97F7524;
    block[3] = &unk_1E6B73A60;
    id v12 = v8;
    id v13 = self;
    id v14 = v7;
    dispatch_after(v10, MEMORY[0x1E4F14428], block);
  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

- (BOOL)replicateMessage:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 lastKnownReplicationDate:(id)a6 callerID:(id)a7
{
  uint64_t v9 = a5;
  v47[2] = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  int v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v17 = [v16 isReplicationEnabled];

  if (!v17)
  {
LABEL_18:
    BOOL v33 = 0;
    goto LABEL_25;
  }
  if (![(IMDTelephonyServiceSession *)self _shouldReplicateMessageItem:v12 chatStyle:v9 lastKnownReplicationDate:v14 callerID:v15])
  {
    if (IMOSLoggingEnabled())
    {
      long long v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        id v32 = [v12 guid];
        *(_DWORD *)buf = 138412290;
        long long v44 = v32;
        _os_log_impl(&dword_1D967A000, v31, OS_LOG_TYPE_INFO, "Not replicating message %@", buf, 0xCu);
      }
    }
    goto LABEL_18;
  }
  BOOL v18 = [(IMDServiceSession *)self service];
  char v19 = [v18 supportsCapability:*MEMORY[0x1E4F6E088]];

  if ((v19 & 1) == 0)
  {
    int v20 = [NSString stringGUID];
    v47[0] = v20;
    id v21 = [NSString stringGUID];
    v47[1] = v21;
    uint64_t v22 = [MEMORY[0x1E4F1C978] arrayWithObjects:v47 count:2];
    [v12 setReplicatedFallbackGUIDs:v22];
  }
  uint64_t v23 = IMGetCachedDomainIntForKey();
  __int16 v24 = [MEMORY[0x1E4F6C360] sharedInstance];
  int v25 = [v24 isInternalInstall];
  if (v23 > 0) {
    int v26 = v25;
  }
  else {
    int v26 = 0;
  }

  int v27 = IMOSLoggingEnabled();
  if (v26)
  {
    if (v27)
    {
      long long v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        long long v29 = [v12 guid];
        *(_DWORD *)buf = 138412546;
        long long v44 = v29;
        __int16 v45 = 1024;
        int v46 = v23;
        _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "** Replication delay is enabled, delaying send of %@ by %d seconds", buf, 0x12u);
      }
    }
    dispatch_time_t v30 = dispatch_time(0, 1000000000 * v23);
    v38[0] = MEMORY[0x1E4F143A8];
    v38[1] = 3221225472;
    v38[2] = sub_1D97F7C00;
    v38[3] = &unk_1E6B75AE0;
    id v39 = v12;
    long long v40 = self;
    id v41 = v13;
    char v42 = v9;
    dispatch_after(v30, MEMORY[0x1E4F14428], v38);
  }
  else
  {
    if (v27)
    {
      uint64_t v34 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
      {
        id v35 = [v12 guid];
        *(_DWORD *)buf = 138412290;
        long long v44 = v35;
        _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "Sending message %@ to replicationProxy", buf, 0xCu);
      }
    }
    uint64_t v36 = [(IMDServiceSession *)self replicationProxy];
    [v36 sendMessage:v12 toChat:v13 style:v9];
  }
  BOOL v33 = 1;
LABEL_25:

  return v33;
}

- (void)sendRepositionStickerMessage:(id)a3 chatIdentifier:(id)a4 accountID:(id)a5 style:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v13 = [v12 isPriusEnabled];

  if (v13)
  {
    id v14 = [(IMDServiceSession *)self chatForChatIdentifier:v10 style:v6];
    id v15 = [(IMDTelephonyServiceSession *)self _callerIDForChatWithChatIdentifier:v10 chatStyle:v6 foundChat:v14];
    if (v6 == 43
      && [(IMDTelephonyServiceSession *)self replicationRequirementsSatisfiedForPhoneNumber:v15 simID:0])
    {
      int v16 = [(IMDServiceSession *)self replicationProxy];
      [v16 sendRepositionStickerMessage:v17 chatIdentifier:v10 accountID:v11 style:43];
    }
  }
}

- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10
{
  uint64_t v10 = a8;
  uint64_t v35 = *MEMORY[0x1E4F143B8];
  id v16 = a3;
  id v31 = a4;
  id v17 = a7;
  id v32 = a9;
  id v18 = a10;
  char v19 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v20 = [v19 isPriusEnabled];

  if (v20)
  {
    id v21 = [(IMDServiceSession *)self chatForChatIdentifier:v17 style:v10];
    dispatch_time_t v30 = [(IMDTelephonyServiceSession *)self _callerIDForChatWithChatIdentifier:v17 chatStyle:v10 foundChat:v21];
    if (v10 == 43
      && [(IMDTelephonyServiceSession *)self replicationRequirementsSatisfiedForPhoneNumber:v30 simID:0])
    {
      uint64_t v22 = [(IMDServiceSession *)self replicationProxy];
      [v22 sendEditedMessage:v16 previousMessage:v31 partIndex:a5 editType:a6 toChatIdentifier:v17 style:43 account:v32 backwardCompatabilityText:v18];
    }
    uint64_t v23 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v24 = [v23 isPriusCompatibilityEnabled];

    if (v24)
    {
      int v25 = (void *)[v16 copyForBackwardsCompatibility];
      [v25 setBody:v18];
      int v26 = [(IMDTelephonyServiceSession *)self relayController];
      int v27 = [v26 _localDeviceSupportsSMS];

      if (v27)
      {
        if (IMOSLoggingEnabled())
        {
          long long v28 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v34 = v25;
            _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Device supports SMS, sending backwards compatibility edit to CT: %@", buf, 0xCu);
          }
        }
        [(IMDTelephonyServiceSession *)self sendMessageFromIMMessageItem:v25 forChat:v17 chat:v21 style:v10];
      }
      else if (![(IMDTelephonyServiceSession *)self shouldExcludeChatFromRelay:v21])
      {
        long long v29 = [(IMDTelephonyServiceSession *)self relayController];
        [v29 sendEditedMessage:v16 toChat:v21 fromCallerID:v30 backwardCompatabilityText:v18];
      }
    }
  }
}

- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7
{
  int v8 = a6;
  id v18 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  id v15 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v16 = [v15 isPriusEnabled];

  if (v8 == 43 && v16)
  {
    id v17 = [(IMDServiceSession *)self replicationProxy];
    [v17 sendGroupPhotoUpdate:v18 toChatID:v12 identifier:v13 style:43 account:v14];
  }
}

- (void)retryGroupPhotoUpload:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8
{
  BOOL v8 = a8;
  int v10 = a6;
  id v20 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  id v17 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v18 = [v17 isPriusEnabled];

  if (v10 == 43 && v18)
  {
    char v19 = [(IMDServiceSession *)self replicationProxy];
    [v19 retryGroupPhotoUpload:v20 toChatID:v14 identifier:v15 style:43 account:v16 isPhotoRefresh:v8];
  }
}

- (void)relayDisplayNameChange:(id)a3 forChat:(id)a4 fromID:(id)a5 messageID:(id)a6 didOccurLocally:(BOOL)a7
{
  BOOL v23 = a7;
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = a3;
  id v15 = [IMDRelayGroupDisplayNameMutationMessage alloc];
  id v16 = [(IMDServiceSession *)self service];
  id v17 = [v16 internalName];
  int v18 = [v13 groupID];
  char v19 = [v13 originalGroupID];

  id v20 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v11];
  LOWORD(v22) = 256;
  int v24 = -[IMDRelayGroupDisplayNameMutationMessage initWithName:sender:service:groupID:originalGroupID:guid:destinationCallerID:failed:fromMe:](v15, "initWithName:sender:service:groupID:originalGroupID:guid:destinationCallerID:failed:fromMe:", v14, 0, v17, v18, v19, v20, v12, v22);

  id v21 = [(IMDTelephonyServiceSession *)self relayController];
  [v21 reflectGroupMutation:v24 callerID:v12 didOccurLocally:v23];
}

- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9
{
  uint64_t v9 = a8;
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a9;
  v28.receiver = self;
  v28.super_class = (Class)IMDTelephonyServiceSession;
  int v27 = v16;
  [(IMDServiceSession *)&v28 updateDisplayName:v15 fromDisplayName:v16 fromID:v17 forChatID:v18 identifier:v19 style:v9 messageID:v20];
  id v21 = [(IMDServiceSession *)self service];
  int v22 = [v21 supportsCapability:*MEMORY[0x1E4F6E038]];

  BOOL v23 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v24 = [v23 isPriusEnabled];

  if (v9 == 43 && v24 && (v22 & 1) == 0)
  {
    int v25 = [(IMDServiceSession *)self replicationProxy];
    [v25 updateDisplayName:v15 fromDisplayName:v27 fromID:v17 forChatID:v18 identifier:v19 style:v9 messageID:v20];
  }
  if (v22)
  {
    int v26 = [(IMDServiceSession *)self chatForChatIdentifier:v19 style:v9];
    if (v26) {
      [(IMDTelephonyServiceSession *)self relayDisplayNameChange:v15 forChat:v26 fromID:v17 messageID:v20 didOccurLocally:1];
    }
  }
}

- (BOOL)replicationRequiredForFeaturesUsedByMessageItem:(id)a3
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isSOS]) {
    goto LABEL_22;
  }
  BOOL v5 = [v4 associatedMessageGUID];
  uint64_t v6 = [v5 length];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        BOOL v8 = [v4 guid];
        int v19 = 138412290;
        id v20 = v8;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Allowing replication for %@, has associated message GUID", (uint8_t *)&v19, 0xCu);
      }
LABEL_21:

      goto LABEL_22;
    }
    goto LABEL_22;
  }
  uint64_t v9 = [v4 expressiveSendStyleID];
  uint64_t v10 = [v9 length];

  if (v10)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v11 = [v4 guid];
        int v19 = 138412290;
        id v20 = v11;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Allowing replication for %@, has expressive send", (uint8_t *)&v19, 0xCu);
      }
      goto LABEL_21;
    }
LABEL_22:
    LOBYTE(v16) = 1;
    goto LABEL_23;
  }
  id v12 = [v4 balloonBundleID];
  uint64_t v13 = [v12 length];

  if (v13)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v14 = [v4 guid];
        int v19 = 138412290;
        id v20 = v14;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Allowing replication for %@, has balloon bundle ID", (uint8_t *)&v19, 0xCu);
      }
      goto LABEL_21;
    }
    goto LABEL_22;
  }
  id v15 = [v4 body];
  BOOL v16 = [(IMDTelephonyServiceSession *)self _replicationRequiredForFeaturesUsedByMessageBody:v15];

  if (v16)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v17 = [v4 guid];
        int v19 = 138412290;
        id v20 = v17;
        _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Allowing replication for %@, has non-plaintext or unknown attributes", (uint8_t *)&v19, 0xCu);
      }
      goto LABEL_21;
    }
    goto LABEL_22;
  }
LABEL_23:

  return v16;
}

- (BOOL)replicationRequiredForMessageBodyAttributeName:(id)a3
{
  return 1;
}

- (BOOL)_replicationRequiredForFeaturesUsedByMessageBody:(id)a3
{
  id v4 = a3;
  uint64_t v9 = 0;
  uint64_t v10 = &v9;
  uint64_t v11 = 0x2020000000;
  char v12 = 0;
  v8[0] = 0;
  v8[1] = v8;
  v8[2] = 0x2020000000;
  v8[3] = 0;
  uint64_t v5 = [v4 length];
  v7[0] = MEMORY[0x1E4F143A8];
  v7[1] = 3221225472;
  v7[2] = sub_1D97F89F4;
  v7[3] = &unk_1E6B77190;
  v7[5] = v8;
  v7[6] = &v9;
  v7[4] = self;
  objc_msgSend(v4, "enumerateAttributesInRange:options:usingBlock:", 0, v5, 0, v7);
  LOBYTE(self) = *((unsigned char *)v10 + 24);
  _Block_object_dispose(v8, 8);
  _Block_object_dispose(&v9, 8);

  return (char)self;
}

- (BOOL)replicationRequiredForMultipleMessageParts
{
  return 1;
}

- (void)_processReceivedDictionaryInBlastDoor:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 withCompletionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = [v10 objectForKeyedSubscript:IMDCTMessageDictionaryGUIDKey];
  v18[0] = MEMORY[0x1E4F143A8];
  v18[1] = 3221225472;
  v18[2] = sub_1D985615C;
  v18[3] = &unk_1E6B78168;
  id v19 = v13;
  id v20 = self;
  id v21 = v10;
  id v22 = v11;
  BOOL v24 = a5;
  id v23 = v12;
  id v14 = v12;
  id v15 = v11;
  id v16 = v10;
  id v17 = v13;
  +[IMBlastdoor sendSMSDictionary:v16 withCompletionBlock:v18];
}

- (void)_releasePendingMessagesAndProcessReceivedSMSMessage:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = +[IMPendingReplicatedMessageCache sharedCache];
  id v14 = [v10 GUID];
  id v15 = [(IMDServiceSession *)self service];
  id v16 = [v15 internalName];
  v20[0] = MEMORY[0x1E4F143A8];
  v20[1] = 3221225472;
  v20[2] = sub_1D98567F0;
  v20[3] = &unk_1E6B78190;
  v20[4] = self;
  id v21 = v10;
  BOOL v24 = a5;
  id v22 = v11;
  id v23 = v12;
  id v17 = v12;
  id v18 = v11;
  id v19 = v10;
  [v13 releasePendingMessageWithGUID:v14 serviceName:v16 chat:0 completion:v20];
}

- (BOOL)_allowedToGeneratePreviewForTransfer:(id)a3 smsMessage:(id)a4
{
  return 1;
}

- (void)_generatePreviewForTransfer:(id)a3 message:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v13 = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Generating preview for attachment part", v13, 2u);
    }
  }
  int v8 = [v6 isFromMe];
  uint64_t v9 = (void *)MEMORY[0x1E4F6E950];
  id v10 = [v6 service];
  if (v8) {
    [v9 fromMeContextWithServiceName:v10];
  }
  else {
  id v11 = [v9 untrustedContextWithServiceName:v10];
  }

  id v12 = +[IMDFileTransferCenter sharedInstance];
  [v12 generatePreviewForTransfer:v5 messageItem:v6 senderContext:v11];
}

- (id)_countryCodeForIncomingTextMessage:(id)a3
{
  id v3 = a3;
  id v4 = [v3 countryCode];

  if (v4)
  {
    id v5 = [v3 countryCode];
    goto LABEL_11;
  }
  id v6 = [v3 originatedDeviceSIM];
  if (v6)
  {
  }
  else
  {
    id v7 = [v3 originatedDeviceNumber];

    if (!v7)
    {
LABEL_7:
      id v12 = [MEMORY[0x1E4F6E890] sharedInstance];
      [v12 forceAutoBugCaptureWithSubType:@"Missing Destination Information" errorPayload:0 type:@"DSDS Privacy Violation" context:@"Selected a default country code instead of being aware of the number a message was received on."];

      uint64_t v13 = IMCountryCodeForIncomingTextMessage();
      id v14 = (void *)v13;
      id v15 = @"us";
      if (v13) {
        id v15 = (__CFString *)v13;
      }
      id v11 = v15;

      goto LABEL_10;
    }
  }
  int v8 = (void *)MEMORY[0x1E4F6E660];
  uint64_t v9 = [v3 originatedDeviceNumber];
  id v10 = [v3 originatedDeviceSIM];
  id v11 = [v8 IMCountryCodeForPhoneNumber:v9 simID:v10];

  if (!v11) {
    goto LABEL_7;
  }
LABEL_10:
  id v5 = v11;

LABEL_11:

  return v5;
}

- (BOOL)incomingMessageHasTooManyRecipients:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [v4 originatedDeviceSIM];
  id v6 = [v4 originatedDeviceNumber];
  unint64_t v7 = [(IMDTelephonyServiceSession *)self maxRecipientsForPhoneNumber:v6 simID:v5];
  unint64_t v8 = v7;
  if (v7 == 0x7FFFFFFF || !v7)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v18 = 134217984;
        unint64_t v19 = v8;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Carrier bundle value for maxReceipients was 0 or INT_MAX (%llu), falling back to iMessage maximum", (uint8_t *)&v18, 0xCu);
      }
    }
    id v10 = [MEMORY[0x1E4F6B598] sharedInstanceForBagType:1];
    id v11 = [v10 objectForKey:@"md-max-chat-participants-incoming"];

    if (v11) {
      unint64_t v8 = [v11 unsignedIntegerValue];
    }
    else {
      unint64_t v8 = 120;
    }
  }
  id v12 = [v4 recipients];
  unint64_t v13 = [v12 count];

  if (v13 > v8 && IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      id v15 = [v4 recipients];
      uint64_t v16 = [v15 count];
      int v18 = 134218240;
      unint64_t v19 = v16;
      __int16 v20 = 2048;
      unint64_t v21 = v8;
      _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Filtering message due to excessive recipient count: %llu maxRecipients: %llu", (uint8_t *)&v18, 0x16u);
    }
  }

  return v13 > v8;
}

- (void)_processReceivedSMSMessage:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 completionBlock:(id)a6
{
  BOOL v457 = a5;
  uint64_t v564 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v456 = a4;
  id v459 = a6;
  uint64_t v9 = objc_alloc_init(IMDTelephonyIncomingMessageContext);
  if (objc_msgSend(v8, "has_sendEnabled")) {
    uint64_t v10 = [v8 sendEnabled];
  }
  else {
    uint64_t v10 = 1;
  }
  v477 = v9;
  [(IMDTelephonyIncomingMessageContext *)v9 setIsSendEnabled:v10];
  v476 = v8;
  id v11 = [v8 originatedDeviceNumber];
  [(IMDTelephonyIncomingMessageContext *)v477 setMyNumberString:v11];

  id v12 = [v8 originatedDeviceSIM];
  [(IMDTelephonyIncomingMessageContext *)v477 setMySIMIDString:v12];

  unint64_t v13 = [v8 sender];
  [(IMDTelephonyIncomingMessageContext *)v477 setSender:v13];

  id v14 = [v8 sender];
  [(IMDTelephonyIncomingMessageContext *)v477 setSenderUnformatted:v14];

  id v15 = [(IMDTelephonyServiceSession *)self _countryCodeForIncomingTextMessage:v8];
  [(IMDTelephonyIncomingMessageContext *)v477 setCountryCode:v15];

  -[IMDTelephonyIncomingMessageContext setCapability:](v477, "setCapability:", [v8 iMessageCapability]);
  uint64_t v16 = [v8 originatedDeviceNumber];
  [(IMDTelephonyIncomingMessageContext *)v477 setOriginalAlias:v16];

  [(IMDTelephonyIncomingMessageContext *)v477 setWasRelayed:v457];
  id v17 = [(IMDServiceSession *)self service];
  int v18 = [v17 supportsCapability:*MEMORY[0x1E4F6E038]];

  if (v18)
  {
    unint64_t v19 = [v8 displayName];
    [(IMDTelephonyIncomingMessageContext *)v477 setDisplayName:v19];
  }
  __int16 v20 = [(IMDServiceSession *)self service];
  int v21 = [v20 supportsCapability:*MEMORY[0x1E4F6E010]];

  if (v21)
  {
    uint64_t v22 = [v8 groupID];
    [(IMDTelephonyIncomingMessageContext *)v477 setGroupID:v22];

    id v23 = [v8 originalGroupID];
    [(IMDTelephonyIncomingMessageContext *)v477 setOriginalGroupID:v23];
  }
  uint64_t v458 = [v8 version];
  uint64_t v24 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
  uint64_t v25 = v24 | v458;

  if (v25)
  {
    int v27 = [MEMORY[0x1E4F6E858] sharedInstance];
    [v27 acquireAssertionToUnsuspendProcess];

    int v28 = [v8 trackMessage];
    long long v29 = [v8 GUID];
    uint64_t v30 = (uint64_t)v29;
    if (![v29 length])
    {
      uint64_t v30 = StringGUID();
    }
    v455 = (void *)v30;
    if (v30) {
      int v31 = v28;
    }
    else {
      int v31 = 0;
    }
    if (v31 == 1)
    {
      id v32 = +[IMMessagesToTrack sharedInstance];
      [v32 addMessagesID:v30];
    }
    int v33 = IMOSLoggingEnabled();
    uint64_t v34 = v477;
    if (v33)
    {
      uint64_t v35 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        uint64_t v36 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
        BOOL v37 = [v476 items];
        uint64_t v38 = [v37 count];
        uint64_t v39 = [v476 type];
        long long v40 = [v476 countryCode];
        id v41 = [v476 serviceCenter];
        char v42 = [(IMDTelephonyIncomingMessageContext *)v477 countryCode];
        long long v43 = [(IMDTelephonyIncomingMessageContext *)v477 displayName];
        *(_DWORD *)buf = 138413826;
        *(void *)&uint8_t buf[4] = v36;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v38;
        *(_WORD *)&buf[22] = 2048;
        v558 = (uint64_t (*)(uint64_t, uint64_t))v39;
        *(_WORD *)v559 = 2112;
        *(void *)&v559[2] = v40;
        *(_WORD *)&v559[10] = 2112;
        *(void *)&v559[12] = v41;
        __int16 v560 = 2112;
        v561 = v42;
        __int16 v562 = 2112;
        v563 = v43;
        _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "received message with sender: %@, %lu parts, type: %ld  msgCountryCode: %@ service center: %@  incoming code: %@ displayName: %@", buf, 0x48u);
      }
      uint64_t v34 = v477;
    }
    long long v44 = [(IMDTelephonyIncomingMessageContext *)v34 sender];
    BOOL v45 = [v44 length] == 0;

    if (v45)
    {
      int v46 = [MEMORY[0x1E4F28B50] bundleForClass:objc_opt_class()];
      long long v47 = [v46 localizedStringForKey:@"Unknown" value:&stru_1F3398578 table:@"SMSLocalizable"];
      [(IMDTelephonyIncomingMessageContext *)v477 setSender:v47];

      long long v48 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
      [(IMDTelephonyIncomingMessageContext *)v477 setSenderUnformatted:v48];
    }
    long long v49 = [(IMDTelephonyIncomingMessageContext *)v477 sender];

    if (v49)
    {
      long long v50 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
      int v51 = [v50 _appearsToBePhoneNumber];

      uint64_t v52 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
      uint64_t v53 = v52;
      if (v51)
      {
        id v54 = [(IMDTelephonyIncomingMessageContext *)v477 countryCode];
        __int16 v55 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();

        id v56 = IMNormalizedPhoneNumberForCFPhoneNumberRef();
        if (IMOSLoggingEnabled())
        {
          __int16 v57 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
          {
            long long v58 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v55;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v58;
            _os_log_impl(&dword_1D967A000, v57, OS_LOG_TYPE_INFO, "Created number ref: %@  for ID: %@", buf, 0x16u);
          }
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v59 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            uint64_t v60 = [(IMDTelephonyIncomingMessageContext *)v477 countryCode];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v60;
            _os_log_impl(&dword_1D967A000, v59, OS_LOG_TYPE_INFO, "    => Country code: %@", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v61 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v56;
            _os_log_impl(&dword_1D967A000, v61, OS_LOG_TYPE_INFO, "      => Normalized: %@", buf, 0xCu);
          }
        }
        if (v55) {
          CFRelease(v55);
        }
        uint64_t v62 = [v56 length];
      }
      else
      {
        int v63 = [v52 _appearsToBeEmail];

        if (!v63) {
          goto LABEL_50;
        }
        uint64_t v64 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
        id v56 = IMNormalizeFormattedString();

        uint64_t v62 = [v56 length];
      }
      if (v62) {
        [(IMDTelephonyIncomingMessageContext *)v477 setSender:v56];
      }
    }
LABEL_50:
    id v65 = [(IMDTelephonyIncomingMessageContext *)v477 displayName];
    if (!v65)
    {
      if (IMShouldHandleInternalPhishingAttempts())
      {
        id v65 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
        if (IMStringIsEmail())
        {
          id v66 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
          v556 = v66;
          BOOL v67 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v556 count:1];
          if (IMDAreAllAliasesUnknown())
          {
            char v68 = IMGetDomainBoolForKey();

            if ((v68 & 1) == 0)
            {
              if (IMOSLoggingEnabled())
              {
                v69 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v69, OS_LOG_TYPE_INFO))
                {
                  v70 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
                  *(_DWORD *)buf = 138412290;
                  *(void *)&uint8_t buf[4] = v70;
                  _os_log_impl(&dword_1D967A000, v69, OS_LOG_TYPE_INFO, "*** Blocking likely phishing SMS message from sender: %@", buf, 0xCu);
                }
              }
              uint64_t v71 = v455;
              if (!v459) {
                goto LABEL_628;
              }
              goto LABEL_89;
            }
LABEL_63:
            id v72 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
            v73 = [v72 _stripFZIDPrefix];
            BOOL v74 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();
            if (v74)
            {
              v75 = (const void *)CMFItemCreateWithPhoneNumber();
              int IsItemBlocked = CMFBlockListIsItemBlocked();
              CFRelease(v74);
              if (v75)
              {
                CFRelease(v75);
                if (IsItemBlocked)
                {
LABEL_66:
                  BOOL v77 = 1;
LABEL_70:
                  if (IMOSLoggingEnabled())
                  {
                    v79 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v79, OS_LOG_TYPE_INFO))
                    {
                      id v80 = @"NO";
                      if (v77) {
                        id v80 = @"YES";
                      }
                      *(_DWORD *)buf = 138412546;
                      *(void *)&uint8_t buf[4] = v72;
                      *(_WORD *)&buf[12] = 2112;
                      *(void *)&buf[14] = v80;
                      _os_log_impl(&dword_1D967A000, v79, OS_LOG_TYPE_INFO, "filtering message for handle: %@ = %@", buf, 0x16u);
                    }
                  }
                  if (v77)
                  {
                    if (IMOSLoggingEnabled())
                    {
                      v81 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
                      {
                        v82 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v82;
                        _os_log_impl(&dword_1D967A000, v81, OS_LOG_TYPE_INFO, "*** Blocking message from sender: %@", buf, 0xCu);
                      }
                    }
                    uint64_t v71 = v455;
                    if (!v459) {
                      goto LABEL_628;
                    }
                    goto LABEL_89;
                  }
                  if ([(IMDTelephonyServiceSession *)self incomingMessageHasTooManyRecipients:v476])
                  {
                    if (IMOSLoggingEnabled())
                    {
                      v83 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v83, OS_LOG_TYPE_INFO))
                      {
                        v84 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
                        *(_DWORD *)buf = 138412290;
                        *(void *)&uint8_t buf[4] = v84;
                        _os_log_impl(&dword_1D967A000, v83, OS_LOG_TYPE_INFO, "*** Blocking message with too many participants from sender: %@", buf, 0xCu);
                      }
                    }
                    uint64_t v71 = v455;
                    if (!v459) {
                      goto LABEL_628;
                    }
LABEL_89:
                    (*((void (**)(id, void, void *, void))v459 + 2))(v459, 0, v71, 0);
LABEL_627:
                    uint64_t v71 = v455;
LABEL_628:

                    goto LABEL_629;
                  }
                  if ([v476 type]) {
                    int v441 = 0;
                  }
                  else {
                    int v441 = [v476 replaceMessage];
                  }
                  id v85 = objc_alloc(MEMORY[0x1E4F1CA60]);
                  long long v86 = [v476 items];
                  v478 = objc_msgSend(v85, "initWithCapacity:", objc_msgSend(v86, "count"));

                  id v87 = objc_alloc(MEMORY[0x1E4F1CA60]);
                  long long v88 = [v476 items];
                  v484 = objc_msgSend(v87, "initWithCapacity:", objc_msgSend(v88, "count"));

                  id v89 = objc_alloc(MEMORY[0x1E4F1CA48]);
                  long long v90 = [v476 items];
                  id v482 = (id)objc_msgSend(v89, "initWithCapacity:", objc_msgSend(v90, "count"));

                  id v442 = objc_alloc_init(MEMORY[0x1E4F28E78]);
                  id v443 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                  long long v541 = 0u;
                  long long v542 = 0u;
                  long long v539 = 0u;
                  long long v540 = 0u;
                  id obj = [v476 items];
                  uint64_t v448 = [obj countByEnumeratingWithState:&v539 objects:v555 count:16];
                  if (!v448)
                  {
                    v444 = 0;
                    goto LABEL_293;
                  }
                  v444 = 0;
                  uint64_t v447 = *(void *)v540;
                  uint64_t v440 = *MEMORY[0x1E4F6CC10];
                  while (1)
                  {
                    uint64_t v91 = 0;
                    do
                    {
                      if (*(void *)v540 != v447)
                      {
                        uint64_t v92 = v91;
                        objc_enumerationMutation(obj);
                        uint64_t v91 = v92;
                      }
                      uint64_t v449 = v91;
                      long long v93 = *(void **)(*((void *)&v539 + 1) + 8 * v91);
                      if (IMOSLoggingEnabled())
                      {
                        v94 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v94, OS_LOG_TYPE_INFO))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_1D967A000, v94, OS_LOG_TYPE_INFO, "  Part:", buf, 2u);
                        }
                      }
                      if (IMOSLoggingEnabled())
                      {
                        v95 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v95, OS_LOG_TYPE_INFO))
                        {
                          v96 = [v93 contentType];
                          *(_DWORD *)buf = 138412290;
                          *(void *)&uint8_t buf[4] = v96;
                          _os_log_impl(&dword_1D967A000, v95, OS_LOG_TYPE_INFO, "      content type: %@", buf, 0xCu);
                        }
                      }
                      if (IMOSLoggingEnabled())
                      {
                        __int16 v97 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
                        {
                          v98 = [v93 contentId];
                          *(_DWORD *)buf = 138412290;
                          *(void *)&uint8_t buf[4] = v98;
                          _os_log_impl(&dword_1D967A000, v97, OS_LOG_TYPE_INFO, "        content ID: %@", buf, 0xCu);
                        }
                      }
                      if (IMOSLoggingEnabled())
                      {
                        __int16 v99 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
                        {
                          v100 = [v93 contentLocation];
                          *(_DWORD *)buf = 138412290;
                          *(void *)&uint8_t buf[4] = v100;
                          _os_log_impl(&dword_1D967A000, v99, OS_LOG_TYPE_INFO, "  content location: %@", buf, 0xCu);
                        }
                      }
                      __int16 v101 = [v93 contentId];
                      v453 = SMSCopySanitizedContentID(v101);

                      v102 = [v93 contentLocation];
                      id v451 = SMSCopySanitizedContentLocation(v102);

                      if (IMOSLoggingEnabled())
                      {
                        v103 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v103, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 138412546;
                          *(void *)&uint8_t buf[4] = v453;
                          *(_WORD *)&buf[12] = 2112;
                          *(void *)&buf[14] = v451;
                          _os_log_impl(&dword_1D967A000, v103, OS_LOG_TYPE_INFO, "Sanitized ID %@  sanitized loc %@", buf, 0x16u);
                        }
                      }
                      uint64_t v104 = [v93 content];
                      uint64_t v105 = [v104 type];

                      if (v105 == 2)
                      {
                        if (IMOSLoggingEnabled())
                        {
                          v127 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v127, OS_LOG_TYPE_INFO))
                          {
                            *(_WORD *)buf = 0;
                            _os_log_impl(&dword_1D967A000, v127, OS_LOG_TYPE_INFO, "  * This is an attachment part", buf, 2u);
                          }
                        }
                        v472 = +[IMDFileTransferCenter sharedInstance];
                        id v128 = v451;
                        id v129 = v128;
                        if (![v128 length])
                        {
                          id v129 = v453;
                        }
                        id v468 = [v93 contentType];
                        v130 = [v93 content];
                        v131 = [v130 attachment];
                        v479 = [v131 contentData];

                        v132 = [v129 stringByRemovingURLEscapes];

                        if (![(__CFString *)v132 length])
                        {
                          if (IMOSLoggingEnabled())
                          {
                            v133 = OSLogHandleForIMFoundationCategory();
                            if (os_log_type_enabled(v133, OS_LOG_TYPE_INFO))
                            {
                              *(_WORD *)buf = 0;
                              _os_log_impl(&dword_1D967A000, v133, OS_LOG_TYPE_INFO, "  *** Empty filename!", buf, 2u);
                            }
                          }
                          v132 = @"Attachment";
                        }
                        v134 = [(__CFString *)v132 pathExtension];
                        BOOL v135 = [v134 length] == 0;

                        if (v135)
                        {
                          if (IMOSLoggingEnabled())
                          {
                            v173 = OSLogHandleForIMFoundationCategory();
                            if (os_log_type_enabled(v173, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 138412290;
                              *(void *)&uint8_t buf[4] = v132;
                              _os_log_impl(&dword_1D967A000, v173, OS_LOG_TYPE_INFO, "  *** Filename has no extension: %@", buf, 0xCu);
                            }
                          }
                          v174 = [MEMORY[0x1E4F6C348] defaultHFSFileManager];
                          v175 = [v174 pathExtensionForMIMEType:v468];

                          if (IMOSLoggingEnabled())
                          {
                            v176 = OSLogHandleForIMFoundationCategory();
                            if (os_log_type_enabled(v176, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)buf = 138412290;
                              *(void *)&uint8_t buf[4] = v175;
                              _os_log_impl(&dword_1D967A000, v176, OS_LOG_TYPE_INFO, "  Proposed extension: %@", buf, 0xCu);
                            }
                          }
                          if ([v175 length])
                          {
                            uint64_t v177 = [(__CFString *)v132 stringByAppendingPathExtension:v175];

                            if (IMOSLoggingEnabled())
                            {
                              v178 = OSLogHandleForIMFoundationCategory();
                              if (os_log_type_enabled(v178, OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)buf = 138412290;
                                *(void *)&uint8_t buf[4] = v177;
                                _os_log_impl(&dword_1D967A000, v178, OS_LOG_TYPE_INFO, "  * Replacement filename: %@", buf, 0xCu);
                              }
                            }
                          }
                          else
                          {
                            uint64_t v177 = (uint64_t)v132;
                          }

                          v136 = (void *)v177;
                        }
                        else
                        {
                          v136 = v132;
                        }
                        cf1a = v136;
                        v180 = [v136 lastPathComponent];
                        v181 = objc_msgSend(v472, "guidForNewIncomingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", v180, 0, objc_msgSend(v479, "length"), 0, 0, 0);
                        if (IMOSLoggingEnabled())
                        {
                          v182 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v182, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412290;
                            *(void *)&uint8_t buf[4] = cf1a;
                            _os_log_impl(&dword_1D967A000, v182, OS_LOG_TYPE_INFO, "         filename: %@", buf, 0xCu);
                          }
                        }
                        if (IMOSLoggingEnabled())
                        {
                          v183 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v183, OS_LOG_TYPE_INFO))
                          {
                            int v184 = [v479 length];
                            *(_DWORD *)buf = 67109120;
                            *(_DWORD *)&uint8_t buf[4] = v184;
                            _os_log_impl(&dword_1D967A000, v183, OS_LOG_TYPE_INFO, "      data length: %d", buf, 8u);
                          }
                        }
                        if (IMOSLoggingEnabled())
                        {
                          v185 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v185, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412290;
                            *(void *)&uint8_t buf[4] = v180;
                            _os_log_impl(&dword_1D967A000, v185, OS_LOG_TYPE_INFO, "    transfer name: %@", buf, 0xCu);
                          }
                        }
                        if (IMOSLoggingEnabled())
                        {
                          v186 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v186, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412290;
                            *(void *)&uint8_t buf[4] = v181;
                            _os_log_impl(&dword_1D967A000, v186, OS_LOG_TYPE_INFO, "             guid: %@", buf, 0xCu);
                          }
                        }
                        *(void *)buf = 0;
                        *(void *)&buf[8] = buf;
                        *(void *)&uint8_t buf[16] = 0x3032000000;
                        v558 = sub_1D985BF80;
                        *(void *)v559 = sub_1D985BF90;
                        *(void *)&v559[8] = 0;
                        if (v181)
                        {
                          v187 = [MEMORY[0x1E4F28CB8] defaultManager];
                          v188 = objc_msgSend(v187, "im_randomTemporaryFileURLWithFileName:", v180);

                          v189 = v477;
                          if (IMOSLoggingEnabled())
                          {
                            v190 = OSLogHandleForIMFoundationCategory();
                            if (os_log_type_enabled(v190, OS_LOG_TYPE_INFO))
                            {
                              *(_DWORD *)v543 = 138412290;
                              *(void *)v544 = v188;
                              _os_log_impl(&dword_1D967A000, v190, OS_LOG_TYPE_INFO, "  => Writing data to path: %@", v543, 0xCu);
                            }

                            v189 = v477;
                          }
                          if (([v479 writeToURL:v188 atomically:1] & 1) == 0
                            && IMOSLoggingEnabled())
                          {
                            v191 = OSLogHandleForIMFoundationCategory();
                            if (os_log_type_enabled(v191, OS_LOG_TYPE_INFO))
                            {
                              int v192 = [v479 length];
                              *(_DWORD *)v543 = 67109378;
                              *(_DWORD *)v544 = v192;
                              *(_WORD *)&v544[4] = 2112;
                              *(void *)&v544[6] = v188;
                              _os_log_impl(&dword_1D967A000, v191, OS_LOG_TYPE_INFO, "Failed to write data of length: %d   to path: %@", v543, 0x12u);
                            }

                            v189 = v477;
                          }
                          aBlock[0] = MEMORY[0x1E4F143A8];
                          aBlock[1] = 3221225472;
                          aBlock[2] = sub_1D985BF98;
                          aBlock[3] = &unk_1E6B781B8;
                          id v521 = v472;
                          id v193 = v181;
                          id v522 = v193;
                          v523 = self;
                          v524 = v189;
                          v526 = buf;
                          id v525 = v443;
                          v194 = _Block_copy(aBlock);
                          if ([MEMORY[0x1E4F6E730] deviceIsLockedDown])
                          {
                            v195 = [MEMORY[0x1E4F6EBE0] sharedInstance];
                            v516[0] = MEMORY[0x1E4F143A8];
                            v516[1] = 3221225472;
                            v516[2] = sub_1D985C484;
                            v516[3] = &unk_1E6B781E0;
                            id v517 = v193;
                            id v196 = v188;
                            id v518 = v196;
                            id v519 = v194;
                            [v195 generateSafeRender:v196 completionBlock:v516];
                          }
                          else
                          {
                            (*((void (**)(void *, uint64_t, void *, void))v194 + 2))(v194, 1, v188, 0);
                          }
                        }
                        else if (IMOSLoggingEnabled())
                        {
                          v197 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v197, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)v543 = 138412290;
                            *(void *)v544 = v93;
                            _os_log_impl(&dword_1D967A000, v197, OS_LOG_TYPE_INFO, "Failed building file transfer guid for part: %@", v543, 0xCu);
                          }
                        }
                        if (*(void *)(*(void *)&buf[8] + 40))
                        {
                          v198 = +[IMDMessageStore sharedInstance];
                          v199 = [v198 messageWithGUID:v455];

                          if ([(IMDTelephonyServiceSession *)self _allowedToGeneratePreviewForTransfer:*(void *)(*(void *)&buf[8] + 40) smsMessage:v476])
                          {
                            [(IMDTelephonyServiceSession *)self _generatePreviewForTransfer:*(void *)(*(void *)&buf[8] + 40) message:v199];
                          }
                          v200 = (void *)MEMORY[0x1E4F28B18];
                          v201 = [*(id *)(*(void *)&buf[8] + 40) guid];
                          v551 = v201;
                          v202 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v551 count:1];
                          v203 = objc_msgSend(v200, "__im_attributedStringWithFileTransfers:", v202);
                          v204 = objc_msgSend(v203, "__im_attributedStringByAssigningMessagePartNumbers");

                          if ([v453 length]) {
                            [v478 setObject:v204 forKey:v453];
                          }
                          if ([v128 length]) {
                            [v484 setObject:v204 forKey:v128];
                          }
                          [v482 addObject:v204];
                          v205 = [v199 balloonBundleID];
                          int v206 = [v205 containsString:v440];

                          if (v206)
                          {
                            v207 = [v199 richLinkURLs];
                            v208 = [v207 lastObject];

                            if (v208) {
                              goto LABEL_274;
                            }
                            v209 = (void *)MEMORY[0x1E4F1CB10];
                            v210 = [v199 body];
                            v211 = [v210 string];
                            v208 = [v209 URLWithString:v211];

                            if (v208)
                            {
LABEL_274:
                              v212 = [MEMORY[0x1E4F6EA28] sharedManager];
                              id v515 = 0;
                              id v514 = 0;
                              [v212 appNameAndBundleIDFoURL:v208 outAppName:&v515 outBundleID:&v514];
                              id v213 = v515;
                              id v214 = v514;

                              if ([v213 length]) {
                                [v199 setSwyAppName:v213];
                              }
                              if ([v214 length]) {
                                [v199 setSwyBundleID:v214];
                              }
                            }
                            else if (IMOSLoggingEnabled())
                            {
                              v215 = OSLogHandleForIMFoundationCategory();
                              if (os_log_type_enabled(v215, OS_LOG_TYPE_INFO))
                              {
                                *(_DWORD *)v543 = 138412290;
                                *(void *)v544 = v455;
                                _os_log_impl(&dword_1D967A000, v215, OS_LOG_TYPE_INFO, "unable to extract URL for message identified as RichLink: %@", v543, 0xCu);
                              }
                            }
                          }
                        }
                        _Block_object_dispose(buf, 8);
                      }
                      else if (v105 == 1)
                      {
                        v117 = [v93 content];
                        v118 = [v117 smil];
                        v445 = [v118 contentBody];

                        if (IMOSLoggingEnabled())
                        {
                          v119 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v119, OS_LOG_TYPE_INFO))
                          {
                            *(_WORD *)buf = 0;
                            _os_log_impl(&dword_1D967A000, v119, OS_LOG_TYPE_INFO, "  * This is a SMIL part", buf, 2u);
                          }
                        }
                        if (IMOSLoggingEnabled())
                        {
                          v120 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v120, OS_LOG_TYPE_INFO))
                          {
                            MarcoLoggingStringForMessageData();
                            id v121 = (id)objc_claimAutoreleasedReturnValue();
                            *(_DWORD *)buf = 138412290;
                            *(void *)&uint8_t buf[4] = v121;
                            _os_log_impl(&dword_1D967A000, v120, OS_LOG_TYPE_INFO, "  * Out body: %@", buf, 0xCu);
                          }
                        }
                        if (![v445 length]
                          || ([v445 string],
                              v122 = objc_claimAutoreleasedReturnValue(),
                              [v122 trimmedString],
                              v123 = objc_claimAutoreleasedReturnValue(),
                              BOOL v124 = [v123 length] == 0,
                              v123,
                              v122,
                              v124))
                        {
                          if (IMOSLoggingEnabled())
                          {
                            v139 = OSLogHandleForIMFoundationCategory();
                            if (os_log_type_enabled(v139, OS_LOG_TYPE_INFO))
                            {
                              *(_WORD *)buf = 0;
                              _os_log_impl(&dword_1D967A000, v139, OS_LOG_TYPE_INFO, "  => Empty", buf, 2u);
                            }
                          }
                        }
                        else
                        {
                          if (IMOSLoggingEnabled())
                          {
                            v125 = OSLogHandleForIMFoundationCategory();
                            if (os_log_type_enabled(v125, OS_LOG_TYPE_INFO))
                            {
                              MarcoLoggingStringForMessageData();
                              id v126 = (id)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138412290;
                              *(void *)&uint8_t buf[4] = v126;
                              _os_log_impl(&dword_1D967A000, v125, OS_LOG_TYPE_INFO, "  => Appending body %@", buf, 0xCu);
                            }
                          }
                          if ([v453 length]) {
                            [v478 setObject:v445 forKey:v453];
                          }
                          if ([v451 length]) {
                            [v484 setObject:v445 forKey:v451];
                          }
                          [v482 addObject:v445];
                        }
                        id cf1 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                        long long v537 = 0u;
                        long long v538 = 0u;
                        long long v535 = 0u;
                        long long v536 = 0u;
                        v140 = [v93 content];
                        v141 = [v140 smil];
                        id v460 = [v141 orderedParts];

                        id v469 = (id)[v460 countByEnumeratingWithState:&v535 objects:v554 count:16];
                        if (v469)
                        {
                          uint64_t v462 = *(void *)v536;
                          do
                          {
                            uint64_t v142 = 0;
                            do
                            {
                              if (*(void *)v536 != v462)
                              {
                                uint64_t v143 = v142;
                                objc_enumerationMutation(v460);
                                uint64_t v142 = v143;
                              }
                              uint64_t v473 = v142;
                              v480 = *(void **)(*((void *)&v535 + 1) + 8 * v142);
                              v144 = objc_alloc_init(IMDSMSPart);
                              long long v533 = 0u;
                              long long v534 = 0u;
                              long long v531 = 0u;
                              long long v532 = 0u;
                              v145 = [v480 textParts];
                              uint64_t v146 = [v145 countByEnumeratingWithState:&v531 objects:v553 count:16];
                              if (v146)
                              {
                                uint64_t v147 = *(void *)v532;
                                do
                                {
                                  for (uint64_t i = 0; i != v146; ++i)
                                  {
                                    if (*(void *)v532 != v147) {
                                      objc_enumerationMutation(v145);
                                    }
                                    v149 = *(void **)(*((void *)&v531 + 1) + 8 * i);
                                    v150 = [IMDSMSTextPart alloc];
                                    v151 = [v149 contentLocation];
                                    v152 = [(IMDSMSTextPart *)v150 initWithContentLocation:v151];

                                    v153 = [v149 text];
                                    [(IMDSMSTextPart *)v152 appendText:v153];

                                    [(IMDSMSPart *)v144 addTextPart:v152];
                                  }
                                  uint64_t v146 = [v145 countByEnumeratingWithState:&v531 objects:v553 count:16];
                                }
                                while (v146);
                              }

                              long long v529 = 0u;
                              long long v530 = 0u;
                              long long v527 = 0u;
                              long long v528 = 0u;
                              v154 = [v480 attachmentParts];
                              uint64_t v155 = [v154 countByEnumeratingWithState:&v527 objects:v552 count:16];
                              if (v155)
                              {
                                uint64_t v156 = *(void *)v528;
                                do
                                {
                                  for (uint64_t j = 0; j != v155; ++j)
                                  {
                                    if (*(void *)v528 != v156) {
                                      objc_enumerationMutation(v154);
                                    }
                                    v158 = *(void **)(*((void *)&v527 + 1) + 8 * j);
                                    v159 = [IMDSMSAttachmentPart alloc];
                                    v160 = [v158 contentLocation];
                                    v161 = [(IMDSMSAttachmentPart *)v159 initWithContentLocation:v160];

                                    [(IMDSMSPart *)v144 addAttachmentPart:v161];
                                  }
                                  uint64_t v155 = [v154 countByEnumeratingWithState:&v527 objects:v552 count:16];
                                }
                                while (v155);
                              }

                              [cf1 addObject:v144];
                              uint64_t v142 = v473 + 1;
                            }
                            while ((id)(v473 + 1) != v469);
                            id v469 = (id)[v460 countByEnumeratingWithState:&v535 objects:v554 count:16];
                          }
                          while (v469);
                        }

                        if ([cf1 count])
                        {
                          if (v444)
                          {
                            if (IMOSLoggingEnabled())
                            {
                              v162 = OSLogHandleForIMFoundationCategory();
                              if (os_log_type_enabled(v162, OS_LOG_TYPE_INFO))
                              {
                                *(_WORD *)buf = 0;
                                _os_log_impl(&dword_1D967A000, v162, OS_LOG_TYPE_INFO, "Two SMILs found in MMS - this should not happen!", buf, 2u);
                              }
                            }
                            v163 = (void *)[v444 mutableCopy];
                            [v163 addObjectsFromArray:cf1];
                            id v164 = v163;
                          }
                          else
                          {
                            id v164 = cf1;
                          }
                          id v179 = v164;

                          v444 = v179;
                        }
                        else
                        {
                          id v179 = cf1;
                        }
                      }
                      else
                      {
                        if (v105)
                        {
                          if (!IMOSLoggingEnabled()) {
                            goto LABEL_284;
                          }
                          v109 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
                          {
                            v137 = [v93 content];
                            uint64_t v138 = [v137 type];
                            *(_DWORD *)buf = 134217984;
                            *(void *)&uint8_t buf[4] = v138;
                            _os_log_impl(&dword_1D967A000, v109, OS_LOG_TYPE_INFO, "Unhandled BlastDoorSMSCTPartContent: %ld", buf, 0xCu);
                          }
                        }
                        else
                        {
                          v106 = [v93 content];
                          v107 = [v106 plain];
                          v108 = [v107 plainTextContentBody];

                          if (v108)
                          {
                            v109 = objc_alloc_init(MEMORY[0x1E4F28E78]);
                            v110 = [v93 content];
                            v111 = [v110 plain];
                            v112 = [v111 plainTextContentBody];
                            [v109 appendString:v112];

                            v113 = [v93 content];
                            v114 = [v113 plain];
                            v115 = [v114 plainTextContentBody];
                            v116 = [v115 stringByRemovingWhitespace];
                            [v442 appendString:v116];
                          }
                          else
                          {
                            v109 = 0;
                          }
                          if (IMOSLoggingEnabled())
                          {
                            v165 = OSLogHandleForIMFoundationCategory();
                            if (os_log_type_enabled(v165, OS_LOG_TYPE_INFO))
                            {
                              MarcoLoggingStringForMessageData();
                              id v166 = (id)objc_claimAutoreleasedReturnValue();
                              *(_DWORD *)buf = 138412290;
                              *(void *)&uint8_t buf[4] = v166;
                              _os_log_impl(&dword_1D967A000, v165, OS_LOG_TYPE_INFO, "  * This is a text part (%@)", buf, 0xCu);
                            }
                          }
                          if ([v109 length])
                          {
                            v167 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
                            char v168 = objc_msgSend(v167, "characterIsMember:", -[NSObject characterAtIndex:](v109, "characterAtIndex:", -[NSObject length](v109, "length") - 1));

                            if ((v168 & 1) == 0)
                            {
                              if (IMOSLoggingEnabled())
                              {
                                v169 = OSLogHandleForIMFoundationCategory();
                                if (os_log_type_enabled(v169, OS_LOG_TYPE_INFO))
                                {
                                  *(_WORD *)buf = 0;
                                  _os_log_impl(&dword_1D967A000, v169, OS_LOG_TYPE_INFO, "  * There's no trailing newline here, we'll make sure to append one next", buf, 2u);
                                }
                              }
                              [v109 appendString:@"\n"];
                            }
                            v170 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v109];
                            v171 = v170;
                            if (v170)
                            {
                              v172 = objc_msgSend(v170, "__im_attributedStringByAssigningMessagePartNumbers");
                              if (v172)
                              {
                                if ([v453 length]) {
                                  [v478 setObject:v172 forKey:v453];
                                }
                                if ([v451 length]) {
                                  [v484 setObject:v172 forKey:v451];
                                }
                                [v482 addObject:v172];
                              }
                            }
                          }
                        }
                      }
LABEL_284:

                      uint64_t v91 = v449 + 1;
                    }
                    while (v449 + 1 != v448);
                    uint64_t v216 = [obj countByEnumeratingWithState:&v539 objects:v555 count:16];
                    uint64_t v448 = v216;
                    if (!v216)
                    {
LABEL_293:

                      if (IMOSLoggingEnabled())
                      {
                        v217 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v217, OS_LOG_TYPE_INFO))
                        {
                          *(_WORD *)buf = 0;
                          _os_log_impl(&dword_1D967A000, v217, OS_LOG_TYPE_INFO, "After parsing the SMS, we have:", buf, 2u);
                        }
                      }
                      if (IMOSLoggingEnabled())
                      {
                        v218 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v218, OS_LOG_TYPE_INFO))
                        {
                          MarcoLoggingStringForMessageData();
                          id v219 = (id)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412290;
                          *(void *)&uint8_t buf[4] = v219;
                          _os_log_impl(&dword_1D967A000, v218, OS_LOG_TYPE_INFO, "  orderedParts = %@", buf, 0xCu);
                        }
                      }
                      if (IMOSLoggingEnabled())
                      {
                        v220 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v220, OS_LOG_TYPE_INFO))
                        {
                          MarcoLoggingStringForMessageData();
                          id v221 = (id)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412290;
                          *(void *)&uint8_t buf[4] = v221;
                          _os_log_impl(&dword_1D967A000, v220, OS_LOG_TYPE_INFO, "  contentIDToParts = %@", buf, 0xCu);
                        }
                      }
                      if (IMOSLoggingEnabled())
                      {
                        v222 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v222, OS_LOG_TYPE_INFO))
                        {
                          MarcoLoggingStringForMessageData();
                          id v223 = (id)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412290;
                          *(void *)&uint8_t buf[4] = v223;
                          _os_log_impl(&dword_1D967A000, v222, OS_LOG_TYPE_INFO, "  contentLocToParts = %@", buf, 0xCu);
                        }
                      }
                      if (IMOSLoggingEnabled())
                      {
                        v224 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v224, OS_LOG_TYPE_INFO))
                        {
                          MarcoLoggingStringForMessageData();
                          id v225 = (id)objc_claimAutoreleasedReturnValue();
                          *(_DWORD *)buf = 138412290;
                          *(void *)&uint8_t buf[4] = v225;
                          _os_log_impl(&dword_1D967A000, v224, OS_LOG_TYPE_INFO, "  allParts = %@", buf, 0xCu);
                        }
                      }
                      id v226 = objc_alloc_init(MEMORY[0x1E4F28E48]);
                      if ([v444 count])
                      {
                        long long v512 = 0u;
                        long long v513 = 0u;
                        long long v510 = 0u;
                        long long v511 = 0u;
                        id v463 = v444;
                        id v470 = (id)[v463 countByEnumeratingWithState:&v510 objects:v550 count:16];
                        if (v470)
                        {
                          CFTypeRef cf1b = *(CFTypeRef *)v511;
                          do
                          {
                            uint64_t v227 = 0;
                            do
                            {
                              if (*(CFTypeRef *)v511 != cf1b)
                              {
                                uint64_t v228 = v227;
                                objc_enumerationMutation(v463);
                                uint64_t v227 = v228;
                              }
                              uint64_t v474 = v227;
                              v229 = *(void **)(*((void *)&v510 + 1) + 8 * v227);
                              if (IMOSLoggingEnabled())
                              {
                                v230 = OSLogHandleForIMFoundationCategory();
                                if (os_log_type_enabled(v230, OS_LOG_TYPE_INFO))
                                {
                                  *(_DWORD *)buf = 138412290;
                                  *(void *)&uint8_t buf[4] = v229;
                                  _os_log_impl(&dword_1D967A000, v230, OS_LOG_TYPE_INFO, "Examining part %@", buf, 0xCu);
                                }
                              }
                              long long v508 = 0u;
                              long long v509 = 0u;
                              long long v506 = 0u;
                              long long v507 = 0u;
                              v231 = [v229 attachmentParts];
                              uint64_t v232 = [v231 countByEnumeratingWithState:&v506 objects:v549 count:16];
                              if (v232)
                              {
                                uint64_t v233 = *(void *)v507;
                                do
                                {
                                  uint64_t v234 = 0;
                                  do
                                  {
                                    if (*(void *)v507 != v233) {
                                      objc_enumerationMutation(v231);
                                    }
                                    v235 = *(void **)(*((void *)&v506 + 1) + 8 * v234);
                                    if (IMOSLoggingEnabled())
                                    {
                                      v236 = OSLogHandleForIMFoundationCategory();
                                      if (os_log_type_enabled(v236, OS_LOG_TYPE_INFO))
                                      {
                                        *(_DWORD *)buf = 138412290;
                                        *(void *)&uint8_t buf[4] = v235;
                                        _os_log_impl(&dword_1D967A000, v236, OS_LOG_TYPE_INFO, " Found attachmentPart %@", buf, 0xCu);
                                      }
                                    }
                                    v237 = [v235 contentLocation];
                                    v238 = [v484 objectForKey:v237];

                                    if (v238
                                      || ([v235 contentLocation],
                                          v239 = objc_claimAutoreleasedReturnValue(),
                                          [v478 objectForKey:v239],
                                          v238 = objc_claimAutoreleasedReturnValue(),
                                          v239,
                                          v238))
                                    {
                                      [v226 appendAttributedString:v238];
                                      [v482 removeObjectIdenticalTo:v238];
                                    }
                                    else if (IMOSLoggingEnabled())
                                    {
                                      v240 = OSLogHandleForIMFoundationCategory();
                                      if (os_log_type_enabled(v240, OS_LOG_TYPE_INFO))
                                      {
                                        *(_WORD *)buf = 0;
                                        _os_log_impl(&dword_1D967A000, v240, OS_LOG_TYPE_INFO, " Did not find attachment's attributed string!", buf, 2u);
                                      }
                                    }
                                    ++v234;
                                  }
                                  while (v232 != v234);
                                  uint64_t v241 = [v231 countByEnumeratingWithState:&v506 objects:v549 count:16];
                                  uint64_t v232 = v241;
                                }
                                while (v241);
                              }

                              long long v504 = 0u;
                              long long v505 = 0u;
                              long long v502 = 0u;
                              long long v503 = 0u;
                              v242 = [v229 textParts];
                              uint64_t v243 = [v242 countByEnumeratingWithState:&v502 objects:v548 count:16];
                              if (v243)
                              {
                                uint64_t v244 = *(void *)v503;
                                do
                                {
                                  uint64_t v245 = 0;
                                  do
                                  {
                                    if (*(void *)v503 != v244) {
                                      objc_enumerationMutation(v242);
                                    }
                                    v246 = *(void **)(*((void *)&v502 + 1) + 8 * v245);
                                    if (IMOSLoggingEnabled())
                                    {
                                      v247 = OSLogHandleForIMFoundationCategory();
                                      if (os_log_type_enabled(v247, OS_LOG_TYPE_INFO))
                                      {
                                        *(_DWORD *)buf = 138412290;
                                        *(void *)&uint8_t buf[4] = v246;
                                        _os_log_impl(&dword_1D967A000, v247, OS_LOG_TYPE_INFO, " Found textPart %@", buf, 0xCu);
                                      }
                                    }
                                    v248 = [v246 contentLocation];
                                    v249 = [v484 objectForKey:v248];

                                    if (v249
                                      || ([v246 contentLocation],
                                          v250 = objc_claimAutoreleasedReturnValue(),
                                          [v478 objectForKey:v250],
                                          v249 = objc_claimAutoreleasedReturnValue(),
                                          v250,
                                          v249))
                                    {
                                      if (IMOSLoggingEnabled())
                                      {
                                        v251 = OSLogHandleForIMFoundationCategory();
                                        if (os_log_type_enabled(v251, OS_LOG_TYPE_INFO))
                                        {
                                          MarcoLoggingStringForMessageData();
                                          id v252 = (id)objc_claimAutoreleasedReturnValue();
                                          *(_DWORD *)buf = 138412290;
                                          *(void *)&uint8_t buf[4] = v252;
                                          _os_log_impl(&dword_1D967A000, v251, OS_LOG_TYPE_INFO, " Appending text %@", buf, 0xCu);
                                        }
                                      }
                                      [v226 appendAttributedString:v249];
                                      [v482 removeObjectIdenticalTo:v249];
                                    }
                                    else
                                    {
                                      if (IMOSLoggingEnabled())
                                      {
                                        v257 = OSLogHandleForIMFoundationCategory();
                                        if (os_log_type_enabled(v257, OS_LOG_TYPE_INFO))
                                        {
                                          *(_WORD *)buf = 0;
                                          _os_log_impl(&dword_1D967A000, v257, OS_LOG_TYPE_INFO, " Did not find textPart's attributed string!", buf, 2u);
                                        }
                                      }
                                      v249 = 0;
                                    }
                                    v253 = [v246 text];
                                    if ([v253 length])
                                    {
                                      if (IMOSLoggingEnabled())
                                      {
                                        v254 = OSLogHandleForIMFoundationCategory();
                                        if (os_log_type_enabled(v254, OS_LOG_TYPE_INFO))
                                        {
                                          MarcoLoggingStringForMessageData();
                                          id v255 = (id)objc_claimAutoreleasedReturnValue();
                                          *(_DWORD *)buf = 138412290;
                                          *(void *)&uint8_t buf[4] = v255;
                                          _os_log_impl(&dword_1D967A000, v254, OS_LOG_TYPE_INFO, " Found embedded text %@", buf, 0xCu);
                                        }
                                      }
                                      v256 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v253];
                                      [v226 appendAttributedString:v256];
                                    }
                                    ++v245;
                                  }
                                  while (v243 != v245);
                                  uint64_t v258 = [v242 countByEnumeratingWithState:&v502 objects:v548 count:16];
                                  uint64_t v243 = v258;
                                }
                                while (v258);
                              }

                              uint64_t v227 = v474 + 1;
                            }
                            while ((id)(v474 + 1) != v470);
                            id v470 = (id)[v463 countByEnumeratingWithState:&v510 objects:v550 count:16];
                          }
                          while (v470);
                        }
                      }
                      long long v500 = 0u;
                      long long v501 = 0u;
                      long long v498 = 0u;
                      long long v499 = 0u;
                      id v483 = v482;
                      uint64_t v259 = [v483 countByEnumeratingWithState:&v498 objects:v547 count:16];
                      if (v259)
                      {
                        uint64_t v260 = *(void *)v499;
                        do
                        {
                          for (uint64_t k = 0; k != v259; ++k)
                          {
                            if (*(void *)v499 != v260) {
                              objc_enumerationMutation(v483);
                            }
                            uint64_t v262 = *(void *)(*((void *)&v498 + 1) + 8 * k);
                            if (IMOSLoggingEnabled())
                            {
                              v263 = OSLogHandleForIMFoundationCategory();
                              if (os_log_type_enabled(v263, OS_LOG_TYPE_INFO))
                              {
                                MarcoLoggingStringForMessageData();
                                id v264 = (id)objc_claimAutoreleasedReturnValue();
                                *(_DWORD *)buf = 138412290;
                                *(void *)&uint8_t buf[4] = v264;
                                _os_log_impl(&dword_1D967A000, v263, OS_LOG_TYPE_INFO, "Found unordered part: %@", buf, 0xCu);
                              }
                            }
                            [v226 appendAttributedString:v262];
                          }
                          uint64_t v259 = [v483 countByEnumeratingWithState:&v498 objects:v547 count:16];
                        }
                        while (v259);
                      }

                      if ([v226 length])
                      {
                        v265 = [MEMORY[0x1E4F28B88] newlineCharacterSet];
                        v266 = [v226 string];
                        int v267 = objc_msgSend(v265, "characterIsMember:", objc_msgSend(v266, "characterAtIndex:", objc_msgSend(v226, "length") - 1));

                        if (v267)
                        {
                          if (IMOSLoggingEnabled())
                          {
                            v268 = OSLogHandleForIMFoundationCategory();
                            if (os_log_type_enabled(v268, OS_LOG_TYPE_INFO))
                            {
                              *(_WORD *)buf = 0;
                              _os_log_impl(&dword_1D967A000, v268, OS_LOG_TYPE_INFO, "  * Trimming trailing newline", buf, 2u);
                            }
                          }
                          objc_msgSend(v226, "deleteCharactersInRange:", objc_msgSend(v226, "length") - 1, 1);
                        }
                      }
                      uint64_t v269 = [v226 length];
                      objc_msgSend(v226, "removeAttribute:range:", *MEMORY[0x1E4F6C1F8], 0, v269);
                      v452 = objc_msgSend(v226, "__im_attributedStringByAssigningMessagePartNumbers");
                      id v461 = (id)[v452 mutableCopy];

                      if (IMSharedHelperDeviceIsAltAccount())
                      {
                        v270 = [MEMORY[0x1E4F6E668] sharedInstance];
                        v271 = [v270 ctPhoneNumber];
                        v272 = [(IMDTelephonyIncomingMessageContext *)v477 countryCode];
                        CFTypeRef cf1c = (CFTypeRef)IMPhoneNumberRefCopyForPhoneNumber();
                        goto LABEL_397;
                      }
                      v273 = [MEMORY[0x1E4F61740] sharedInstance];
                      v274 = [v273 telephoneNumber];

                      if (v274)
                      {
                        v270 = [MEMORY[0x1E4F61740] sharedInstance];
                        v271 = [v270 telephoneNumber];
                        v272 = [(IMDTelephonyIncomingMessageContext *)v477 countryCode];
                        CFTypeRef cf1c = (CFTypeRef)IMPhoneNumberRefCopyForPhoneNumber();
LABEL_397:
                      }
                      else
                      {
                        CFTypeRef cf1c = 0;
                      }
                      if (![v461 length] && !objc_msgSend(v443, "count"))
                      {
                        uint64_t v275 = [objc_alloc(MEMORY[0x1E4F28E48]) initWithString:@" " attributes:0];

                        id v461 = (id)v275;
                      }
                      *(void *)buf = 0;
                      *(void *)&buf[8] = buf;
                      *(void *)&uint8_t buf[16] = 0x3032000000;
                      v558 = sub_1D985BF80;
                      *(void *)v559 = sub_1D985BF90;
                      *(void *)&v559[8] = 0;
                      id v276 = objc_alloc(MEMORY[0x1E4F6E850]);
                      v277 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
                      v278 = [v476 date];
                      v279 = _ClampDate(v278);
                      v280 = [v443 arrayByApplyingSelector:sel_guid];
                      *(void *)&v559[8] = [v276 initWithSender:v277 time:v279 body:v461 attributes:0 fileTransferGUIDs:v280 flags:1 error:0 guid:v455 threadIdentifier:0];

                      v281 = *(void **)(*(void *)&buf[8] + 40);
                      v282 = [(IMDTelephonyIncomingMessageContext *)v477 destinationCallerID];
                      [v281 setDestinationCallerID:v282];

                      [(IMDTelephonyServiceSession *)self _markFromStorageIfNeeded:v456 messageGUID:v455];
                      v283 = *(void **)(*(void *)&buf[8] + 40);
                      v284 = [(IMDServiceSession *)self accountID];
                      [v283 setAccountID:v284];

                      v285 = *(void **)(*(void *)&buf[8] + 40);
                      v286 = [v476 subject];
                      [v285 setSubject:v286];

                      [*(id *)(*(void *)&buf[8] + 40) setReplaceID:v441];
                      uint64_t v287 = [v476 fallbackHash];
                      if ([v442 length])
                      {
                        v288 = [(IMDServiceSession *)self service];
                        int v289 = [v288 fallbackHashIsContentBased];
                        v290 = (void *)v287;

                        if (v289)
                        {
                          id v546 = v442;
                          v291 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v546 count:1];
                          v292 = [v291 SHA256HexString];

                          v293 = NSString;
                          v294 = [v476 fallbackHash];
                          uint64_t v287 = [v293 stringWithFormat:@"%@<%@>", v294, v292];
                        }
                      }
                      [*(id *)(*(void *)&buf[8] + 40) setFallbackHash:v287];
                      v450 = (void *)v287;
                      v295 = v477;
                      if (IMOSLoggingEnabled())
                      {
                        v296 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v296, OS_LOG_TYPE_INFO))
                        {
                          v297 = [*(id *)(*(void *)&buf[8] + 40) fallbackHash];
                          uint64_t v298 = [v297 length];
                          *(_DWORD *)v543 = 134217984;
                          *(void *)v544 = v298;
                          _os_log_impl(&dword_1D967A000, v296, OS_LOG_TYPE_INFO, " => Fallback hash length: %llu", v543, 0xCu);
                        }
                        v295 = v477;
                      }
                      v299 = [(IMDTelephonyIncomingMessageContext *)v295 sender];
                      v300 = [v461 string];
                      HSAAuthenticationProcessIncomingMessage();
                      if (v299) {
                        CFRelease(v299);
                      }
                      if (v300) {
                        CFRelease(v300);
                      }
                      if (IMOSLoggingEnabled())
                      {
                        v301 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v301, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)v543 = 138412290;
                          *(void *)v544 = v443;
                          _os_log_impl(&dword_1D967A000, v301, OS_LOG_TYPE_INFO, " => Transfers: %@", v543, 0xCu);
                        }

                        v295 = v477;
                      }
                      if (IMOSLoggingEnabled())
                      {
                        v302 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v302, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)v543 = 138412290;
                          *(void *)v544 = v444;
                          _os_log_impl(&dword_1D967A000, v302, OS_LOG_TYPE_INFO, " => Ordered parts: %@", v543, 0xCu);
                        }

                        v295 = v477;
                      }
                      if (IMOSLoggingEnabled())
                      {
                        v303 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v303, OS_LOG_TYPE_INFO))
                        {
                          uint64_t v304 = *(void *)(*(void *)&buf[8] + 40);
                          *(_DWORD *)v543 = 138412290;
                          *(void *)v544 = v304;
                          _os_log_impl(&dword_1D967A000, v303, OS_LOG_TYPE_INFO, " => Result message: %@", v543, 0xCu);
                        }

                        v295 = v477;
                      }
                      [(IMDTelephonyIncomingMessageContext *)v295 setStyle:45];
                      v305 = (void *)MEMORY[0x1E4F6E660];
                      v306 = [(IMDTelephonyIncomingMessageContext *)v295 myNumberString];
                      v307 = [(IMDTelephonyIncomingMessageContext *)v295 mySIMIDString];
                      v481 = [v305 IMMMSEmailAddressToMatchForPhoneNumber:v306 simID:v307];

                      v308 = (void *)MEMORY[0x1E4F6E660];
                      v309 = [(IMDTelephonyIncomingMessageContext *)v477 myNumberString];
                      v310 = [(IMDTelephonyIncomingMessageContext *)v477 mySIMIDString];
                      v454 = [v308 IMCountryCodeForPhoneNumber:v309 simID:v310];

                      v311 = v477;
                      if (IMOSLoggingEnabled())
                      {
                        v312 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v312, OS_LOG_TYPE_INFO))
                        {
                          BOOL v313 = [(IMDTelephonyIncomingMessageContext *)v477 isGroupMessagingEnabled];
                          v314 = @"NO";
                          if (v313) {
                            v314 = @"YES";
                          }
                          *(_DWORD *)v543 = 138412290;
                          *(void *)v544 = v314;
                          _os_log_impl(&dword_1D967A000, v312, OS_LOG_TYPE_INFO, "Group Messaging Enabled: %@", v543, 0xCu);
                        }

                        v311 = v477;
                      }
                      if (IMOSLoggingEnabled())
                      {
                        v315 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v315, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)v543 = 138412290;
                          *(void *)v544 = cf1c;
                          _os_log_impl(&dword_1D967A000, v315, OS_LOG_TYPE_INFO, "My number: %@", v543, 0xCu);
                        }

                        v311 = v477;
                      }
                      if (IMOSLoggingEnabled())
                      {
                        v316 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v316, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)v543 = 138412290;
                          *(void *)v544 = v481;
                          _os_log_impl(&dword_1D967A000, v316, OS_LOG_TYPE_INFO, "My email: %@", v543, 0xCu);
                        }

                        v311 = v477;
                      }
                      if (IMOSLoggingEnabled())
                      {
                        v317 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v317, OS_LOG_TYPE_INFO))
                        {
                          v318 = [(IMDTelephonyIncomingMessageContext *)v477 mySIMIDString];
                          *(_DWORD *)v543 = 138412290;
                          *(void *)v544 = v318;
                          _os_log_impl(&dword_1D967A000, v317, OS_LOG_TYPE_INFO, "My sim ID: %@", v543, 0xCu);
                        }
                        v311 = v477;
                      }
                      if (IMOSLoggingEnabled())
                      {
                        v319 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v319, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)v543 = 138412290;
                          *(void *)v544 = v454;
                          _os_log_impl(&dword_1D967A000, v319, OS_LOG_TYPE_INFO, "My receiver ISO country region: %@", v543, 0xCu);
                        }

                        v311 = v477;
                      }
                      if ([(IMDTelephonyIncomingMessageContext *)v311 isGroupMessagingEnabled])
                      {
                        if (IMOSLoggingEnabled())
                        {
                          v320 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v320, OS_LOG_TYPE_INFO))
                          {
                            v321 = [v476 recipients];
                            *(_DWORD *)v543 = 138412290;
                            *(void *)v544 = v321;
                            _os_log_impl(&dword_1D967A000, v320, OS_LOG_TYPE_INFO, "Recipients: %@", v543, 0xCu);
                          }
                        }
                        long long v497 = 0u;
                        long long v495 = 0u;
                        long long v496 = 0u;
                        long long v494 = 0u;
                        v322 = [v476 recipients];
                        uint64_t v323 = [v322 countByEnumeratingWithState:&v494 objects:v545 count:16];
                        if (v323)
                        {
                          uint64_t v324 = *(void *)v495;
                          id v471 = v322;
                          do
                          {
                            for (uint64_t m = 0; m != v323; ++m)
                            {
                              if (*(void *)v495 != v324) {
                                objc_enumerationMutation(v471);
                              }
                              uint64_t v326 = *(void *)(*((void *)&v494 + 1) + 8 * m);
                              if (IMOSLoggingEnabled())
                              {
                                v327 = OSLogHandleForIMFoundationCategory();
                                if (os_log_type_enabled(v327, OS_LOG_TYPE_INFO))
                                {
                                  *(_DWORD *)v543 = 138412290;
                                  *(void *)v544 = v326;
                                  _os_log_impl(&dword_1D967A000, v327, OS_LOG_TYPE_INFO, "  Recipient: %@", v543, 0xCu);
                                }
                              }
                              v328 = [(IMDTelephonyServiceSession *)self _extractSMSSenderAddress:v326];
                              v329 = [(IMDTelephonyIncomingMessageContext *)v477 participants];
                              BOOL v330 = v329 == 0;

                              if (v330)
                              {
                                id v331 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                                [(IMDTelephonyIncomingMessageContext *)v477 setParticipants:v331];
                              }
                              v332 = [(IMDTelephonyIncomingMessageContext *)v477 unformattedIDs];
                              BOOL v333 = v332 == 0;

                              if (v333)
                              {
                                id v334 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                                [(IMDTelephonyIncomingMessageContext *)v477 setUnformattedIDs:v334];
                              }
                              v335 = [(IMDTelephonyIncomingMessageContext *)v477 countryCodes];
                              BOOL v336 = v335 == 0;

                              if (v336)
                              {
                                id v337 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                                [(IMDTelephonyIncomingMessageContext *)v477 setCountryCodes:v337];
                              }
                              if ([v328 _appearsToBePhoneNumber])
                              {
                                v338 = [(IMDTelephonyIncomingMessageContext *)v477 countryCode];
                                v339 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();

                                v340 = IMNormalizedPhoneNumberForCFPhoneNumberRef();
                                if (IMOSLoggingEnabled())
                                {
                                  v341 = OSLogHandleForIMFoundationCategory();
                                  if (os_log_type_enabled(v341, OS_LOG_TYPE_INFO))
                                  {
                                    *(_DWORD *)v543 = 138412546;
                                    *(void *)v544 = v339;
                                    *(_WORD *)&v544[8] = 2112;
                                    *(void *)&v544[10] = v328;
                                    _os_log_impl(&dword_1D967A000, v341, OS_LOG_TYPE_INFO, "Created number ref: %@  for ID: %@", v543, 0x16u);
                                  }
                                }
                                if (IMOSLoggingEnabled())
                                {
                                  v342 = OSLogHandleForIMFoundationCategory();
                                  if (os_log_type_enabled(v342, OS_LOG_TYPE_INFO))
                                  {
                                    v343 = [(IMDTelephonyIncomingMessageContext *)v477 countryCode];
                                    *(_DWORD *)v543 = 138412290;
                                    *(void *)v544 = v343;
                                    _os_log_impl(&dword_1D967A000, v342, OS_LOG_TYPE_INFO, "    => Country code: %@", v543, 0xCu);
                                  }
                                }
                                if (IMOSLoggingEnabled())
                                {
                                  v344 = OSLogHandleForIMFoundationCategory();
                                  if (os_log_type_enabled(v344, OS_LOG_TYPE_INFO))
                                  {
                                    *(_DWORD *)v543 = 138412290;
                                    *(void *)v544 = v340;
                                    _os_log_impl(&dword_1D967A000, v344, OS_LOG_TYPE_INFO, "      => Normalized: %@", v543, 0xCu);
                                  }
                                }
                                if (v339 && cf1c && CFEqual(cf1c, v339))
                                {
                                  if (IMOSLoggingEnabled())
                                  {
                                    v345 = OSLogHandleForIMFoundationCategory();
                                    if (os_log_type_enabled(v345, OS_LOG_TYPE_INFO))
                                    {
                                      *(_WORD *)v543 = 0;
                                      _os_log_impl(&dword_1D967A000, v345, OS_LOG_TYPE_INFO, "      ** This is my number, ignoring", v543, 2u);
                                    }
                                  }
                                  v328 = 0;
                                  v340 = 0;
                                }
                                v346 = [v476 originatedDeviceNumber];
                                if (IMOSLoggingEnabled())
                                {
                                  v347 = OSLogHandleForIMFoundationCategory();
                                  if (os_log_type_enabled(v347, OS_LOG_TYPE_INFO))
                                  {
                                    *(_DWORD *)v543 = 138412290;
                                    *(void *)v544 = v346;
                                    _os_log_impl(&dword_1D967A000, v347, OS_LOG_TYPE_INFO, "My Original Alias is %@", v543, 0xCu);
                                  }
                                }
                                if (v346 && MEMORY[0x1E0169E10](v346, v340))
                                {
                                  if (IMOSLoggingEnabled())
                                  {
                                    v348 = OSLogHandleForIMFoundationCategory();
                                    if (os_log_type_enabled(v348, OS_LOG_TYPE_INFO))
                                    {
                                      *(_WORD *)v543 = 0;
                                      _os_log_impl(&dword_1D967A000, v348, OS_LOG_TYPE_INFO, "      ** My number is the service center, ignoring", v543, 2u);
                                    }
                                  }
                                  v328 = 0;
                                  v340 = 0;
                                }
                                if (v339) {
                                  CFRelease(v339);
                                }
                                if ([v340 length])
                                {
                                  id v349 = v340;
                                }
                                else
                                {
                                  IMNormalizeFormattedString();
                                  id v349 = (id)objc_claimAutoreleasedReturnValue();
                                }
                                v352 = v349;
                              }
                              else
                              {
                                if ([v481 length]
                                  && [v481 isEqualToIgnoringCase:v328])
                                {
                                  if (IMOSLoggingEnabled())
                                  {
                                    v350 = OSLogHandleForIMFoundationCategory();
                                    if (os_log_type_enabled(v350, OS_LOG_TYPE_INFO))
                                    {
                                      *(_WORD *)v543 = 0;
                                      _os_log_impl(&dword_1D967A000, v350, OS_LOG_TYPE_INFO, "      ** This is my email, ignoring", v543, 2u);
                                    }
                                  }
                                  v346 = 0;
                                }
                                else
                                {
                                  v346 = v328;
                                }
                                v340 = [v476 originatedDeviceEmail];
                                if (![v340 length]
                                  || ![v340 isEqualToIgnoringCase:v346])
                                {
                                  v352 = v346;
                                  goto LABEL_521;
                                }
                                if (IMOSLoggingEnabled())
                                {
                                  v351 = OSLogHandleForIMFoundationCategory();
                                  if (os_log_type_enabled(v351, OS_LOG_TYPE_INFO))
                                  {
                                    *(_WORD *)v543 = 0;
                                    _os_log_impl(&dword_1D967A000, v351, OS_LOG_TYPE_INFO, "      ** This is my email (via proxy), ignoring", v543, 2u);
                                  }
                                }
                                v352 = 0;
                              }

LABEL_521:
                              if (v352)
                              {
                                if (IMOSLoggingEnabled())
                                {
                                  v353 = OSLogHandleForIMFoundationCategory();
                                  if (os_log_type_enabled(v353, OS_LOG_TYPE_INFO))
                                  {
                                    *(_DWORD *)v543 = 138412290;
                                    *(void *)v544 = v352;
                                    _os_log_impl(&dword_1D967A000, v353, OS_LOG_TYPE_INFO, "  => Canonical: %@", v543, 0xCu);
                                  }
                                }
                                v354 = [(IMDTelephonyIncomingMessageContext *)v477 participants];
                                [v354 addObject:v352];

                                v355 = [(IMDTelephonyServiceSession *)self _extractSMSSenderAddress:v326];
                                v356 = [(IMDTelephonyIncomingMessageContext *)v477 countryCodes];
                                uint64_t v357 = [(IMDTelephonyIncomingMessageContext *)v477 countryCode];
                                v358 = (void *)v357;
                                if (v357) {
                                  v359 = (__CFString *)v357;
                                }
                                else {
                                  v359 = @"us";
                                }
                                [v356 addObject:v359];

                                v360 = [(IMDTelephonyIncomingMessageContext *)v477 unformattedIDs];
                                v361 = v360;
                                if (v355) {
                                  v362 = v355;
                                }
                                else {
                                  v362 = &stru_1F3398578;
                                }
                                [v360 addObject:v362];
                              }
                            }
                            v322 = v471;
                            uint64_t v323 = [v471 countByEnumeratingWithState:&v494 objects:v545 count:16];
                          }
                          while (v323);
                        }

                        v363 = v477;
                        v364 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
                        if (v364)
                        {
                          v365 = [(IMDTelephonyIncomingMessageContext *)v477 participants];
                          v366 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
                          char v367 = [v365 containsObject:v366];

                          v363 = v477;
                          if ((v367 & 1) == 0)
                          {
                            v368 = [(IMDTelephonyIncomingMessageContext *)v477 participants];
                            v369 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
                            [v368 addObject:v369];

                            v370 = [(IMDTelephonyIncomingMessageContext *)v477 senderUnformatted];
                            v371 = [(IMDTelephonyIncomingMessageContext *)v477 countryCodes];
                            uint64_t v372 = [(IMDTelephonyIncomingMessageContext *)v477 countryCode];
                            v373 = (void *)v372;
                            if (v372) {
                              v374 = (__CFString *)v372;
                            }
                            else {
                              v374 = @"us";
                            }
                            [v371 addObject:v374];

                            v375 = [(IMDTelephonyIncomingMessageContext *)v477 unformattedIDs];
                            v376 = v375;
                            if (v370) {
                              v377 = v370;
                            }
                            else {
                              v377 = &stru_1F3398578;
                            }
                            goto LABEL_557;
                          }
                        }
                      }
                      else
                      {
                        if (IMOSLoggingEnabled())
                        {
                          v378 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v378, OS_LOG_TYPE_INFO))
                          {
                            v379 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
                            *(_DWORD *)v543 = 138412290;
                            *(void *)v544 = v379;
                            _os_log_impl(&dword_1D967A000, v378, OS_LOG_TYPE_INFO, "Group messaging is disabled, ensuring the sender is in the participant set: %@", v543, 0xCu);
                          }
                          v311 = v477;
                        }
                        v380 = [(IMDTelephonyIncomingMessageContext *)v311 participants];
                        BOOL v381 = v380 == 0;

                        if (v381)
                        {
                          id v382 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
                          [(IMDTelephonyIncomingMessageContext *)v477 setParticipants:v382];
                        }
                        v363 = v477;
                        v383 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
                        if (v383)
                        {
                          v384 = [(IMDTelephonyIncomingMessageContext *)v477 participants];
                          v385 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
                          char v386 = [v384 containsObject:v385];

                          v363 = v477;
                          if ((v386 & 1) == 0)
                          {
                            v387 = [(IMDTelephonyIncomingMessageContext *)v477 participants];
                            v388 = [(IMDTelephonyIncomingMessageContext *)v477 sender];
                            [v387 addObject:v388];

                            v370 = [(IMDTelephonyIncomingMessageContext *)v477 senderUnformatted];
                            v389 = [(IMDTelephonyIncomingMessageContext *)v477 countryCodes];
                            uint64_t v390 = [(IMDTelephonyIncomingMessageContext *)v477 countryCode];
                            v391 = (void *)v390;
                            if (v390) {
                              v392 = (__CFString *)v390;
                            }
                            else {
                              v392 = @"us";
                            }
                            [v389 addObject:v392];

                            v375 = [(IMDTelephonyIncomingMessageContext *)v477 unformattedIDs];
                            v376 = v375;
                            if (v370) {
                              v377 = v370;
                            }
                            else {
                              v377 = &stru_1F3398578;
                            }
LABEL_557:
                            [v375 addObject:v377];

                            v363 = v477;
                          }
                        }
                      }
                      if ([(IMDTelephonyIncomingMessageContext *)v363 isGroupChat])
                      {
                        [(IMDTelephonyIncomingMessageContext *)v363 setStyle:43];
                        v393 = +[IMDChatRegistry sharedInstance];
                        v394 = [(IMDServiceSession *)self account];
                        v395 = [v393 generateUnusedChatIdentifierForGroupChatWithAccount:v394];
                        [(IMDTelephonyIncomingMessageContext *)v363 setChatIdentifier:v395];
                      }
                      else
                      {
                        v393 = [(IMDTelephonyIncomingMessageContext *)v363 sender];
                        [(IMDTelephonyIncomingMessageContext *)v363 setChatIdentifier:v393];
                      }

                      v396 = [(IMDTelephonyServiceSession *)self chatForIncomingMessageContext:v477 createIfNotExists:0];
                      v397 = v396;
                      if (v396)
                      {
                        v398 = [v396 chatIdentifier];
                        [(IMDTelephonyIncomingMessageContext *)v477 setChatIdentifier:v398];

                        v399 = v477;
                        -[IMDTelephonyIncomingMessageContext setStyle:](v477, "setStyle:", [v397 style]);
                        if ([v397 isBlackholed])
                        {
                          if (IMOSLoggingEnabled())
                          {
                            v400 = OSLogHandleForIMFoundationCategory();
                            if (os_log_type_enabled(v400, OS_LOG_TYPE_INFO))
                            {
                              id v401 = [v397 guid];
                              *(_DWORD *)v543 = 138412290;
                              *(void *)v544 = v401;
                              _os_log_impl(&dword_1D967A000, v400, OS_LOG_TYPE_INFO, "SMS: Unblackholing an SMS chat %@", v543, 0xCu);
                            }
                            v399 = v477;
                          }
                          [v397 updateIsBlackholed:0];
                        }
                        if ([v397 smsHandshakeState] == 1)
                        {
                          v402 = [MEMORY[0x1E4F6E890] sharedInstance];
                          [v402 trackSpamEvent:7];

                          [v397 updateSMSHandshakeState:0xFFFFFFFFLL];
                          v399 = v477;
                        }
                        if (![(IMDTelephonyIncomingMessageContext *)v399 isSendEnabled])
                        {
                          if ([(IMDTelephonyIncomingMessageContext *)v399 isGroupChat]
                            || ![v397 isFiltered])
                          {
                            if (IMOSLoggingEnabled())
                            {
                              v406 = OSLogHandleForIMFoundationCategory();
                              if (os_log_type_enabled(v406, OS_LOG_TYPE_INFO))
                              {
                                BOOL v407 = [(IMDTelephonyIncomingMessageContext *)v399 isGroupChat];
                                uint64_t v408 = [v397 isFiltered];
                                v409 = @"NO";
                                if (v407) {
                                  v409 = @"YES";
                                }
                                *(_DWORD *)v543 = 138412546;
                                *(void *)v544 = v409;
                                *(_WORD *)&v544[8] = 2048;
                                *(void *)&v544[10] = v408;
                                _os_log_impl(&dword_1D967A000, v406, OS_LOG_TYPE_INFO, "Received a read only request for a group chat: %@ or known chat: %lld", v543, 0x16u);
                              }

                              v399 = v477;
                            }
                          }
                          else
                          {
                            if (IMOSLoggingEnabled())
                            {
                              v403 = OSLogHandleForIMFoundationCategory();
                              if (os_log_type_enabled(v403, OS_LOG_TYPE_INFO))
                              {
                                *(_WORD *)v543 = 0;
                                _os_log_impl(&dword_1D967A000, v403, OS_LOG_TYPE_INFO, "Replying is disabled, setting join state to Read Only", v543, 2u);
                              }

                              v399 = v477;
                            }
                            [v397 setState:4];
                          }
                        }
                        v410 = [(IMDTelephonyIncomingMessageContext *)v399 displayName];

                        if (v410)
                        {
                          id v405 = [(IMDTelephonyIncomingMessageContext *)v477 displayName];
                          [v397 updateDisplayName:v405];
LABEL_587:
                        }
                        v411 = v477;
                        if ([MEMORY[0x1E4F6EA38] isInternationalSpamFilteringEnabled])
                        {
                          v412 = +[IMDChatRegistry sharedInstance];
                          if (v397)
                          {
                            v413 = [v397 chatIdentifier];
                            objc_msgSend(v412, "existingiMessageChatForID:withChatStyle:", v413, objc_msgSend(v397, "style"));
                          }
                          else
                          {
                            v413 = [(IMDTelephonyIncomingMessageContext *)v477 chatIdentifier];
                            objc_msgSend(v412, "existingiMessageChatForID:withChatStyle:", v413, -[IMDTelephonyIncomingMessageContext style](v477, "style"));
                          v414 = };

                          if (v414 && [v414 isBlackholed])
                          {
                            int v415 = IMOSLoggingEnabled();
                            v416 = v477;
                            if (v415)
                            {
                              v417 = OSLogHandleForIMFoundationCategory();
                              if (os_log_type_enabled(v417, OS_LOG_TYPE_INFO))
                              {
                                id v418 = [v414 guid];
                                *(_DWORD *)v543 = 138412290;
                                *(void *)v544 = v418;
                                _os_log_impl(&dword_1D967A000, v417, OS_LOG_TYPE_INFO, "Unblackholing sibling iMessage chat (%@) on reception of SMS message.", v543, 0xCu);
                              }
                              v416 = v477;
                            }
                            if ([(IMDTelephonyIncomingMessageContext *)v416 isGroupChat])
                            {
                              v419 = [MEMORY[0x1E4F6E890] sharedInstance];
                              [v419 trackSpamEvent:21];
                            }
                            else
                            {
                              v419 = [MEMORY[0x1E4F6E890] sharedInstance];
                              [v419 trackSpamEvent:20];
                            }

                            [v414 updateIsBlackholed:0];
                            v420 = +[IMDMessageStore sharedInstance];
                            v421 = [v414 lastMessage];
                            v422 = [v421 guid];
                            [v420 markMessageGUIDUnread:v422];
                          }
                          v411 = v477;
                        }
                        if (IMOSLoggingEnabled())
                        {
                          v423 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v423, OS_LOG_TYPE_INFO))
                          {
                            v424 = [(IMDTelephonyIncomingMessageContext *)v477 participants];
                            *(_DWORD *)v543 = 138412290;
                            *(void *)v544 = v424;
                            _os_log_impl(&dword_1D967A000, v423, OS_LOG_TYPE_INFO, "   participants: %@", v543, 0xCu);
                          }
                          v411 = v477;
                        }
                        if (IMOSLoggingEnabled())
                        {
                          v425 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v425, OS_LOG_TYPE_INFO))
                          {
                            id v426 = [v397 guid];
                            *(_DWORD *)v543 = 138412546;
                            *(void *)v544 = v397;
                            *(_WORD *)&v544[8] = 2112;
                            *(void *)&v544[10] = v426;
                            _os_log_impl(&dword_1D967A000, v425, OS_LOG_TYPE_INFO, "   found chat: %@ (%@)", v543, 0x16u);
                          }
                          v411 = v477;
                        }
                        if (IMOSLoggingEnabled())
                        {
                          v427 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v427, OS_LOG_TYPE_INFO))
                          {
                            BOOL v428 = [(IMDTelephonyIncomingMessageContext *)v411 isGroupChat];
                            v429 = @"NO";
                            if (v428) {
                              v429 = @"YES";
                            }
                            *(_DWORD *)v543 = 138412290;
                            *(void *)v544 = v429;
                            _os_log_impl(&dword_1D967A000, v427, OS_LOG_TYPE_INFO, "   isGroupChat: %@", v543, 0xCu);
                          }

                          v411 = v477;
                        }
                        if (IMOSLoggingEnabled())
                        {
                          v430 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v430, OS_LOG_TYPE_INFO))
                          {
                            v431 = [(IMDTelephonyIncomingMessageContext *)v477 chatIdentifier];
                            *(_DWORD *)v543 = 138412290;
                            *(void *)v544 = v431;
                            _os_log_impl(&dword_1D967A000, v430, OS_LOG_TYPE_INFO, "   chatIdentifier: %@", v543, 0xCu);
                          }
                          v411 = v477;
                        }
                        v485[0] = MEMORY[0x1E4F143A8];
                        v485[1] = 3221225472;
                        v485[2] = sub_1D985C7AC;
                        v485[3] = &unk_1E6B78208;
                        v432 = v411;
                        v486 = v432;
                        v487 = self;
                        v490 = buf;
                        id v433 = v397;
                        id v488 = v433;
                        int v491 = v441;
                        BOOL v492 = v457;
                        id v434 = v455;
                        id v489 = v434;
                        v435 = _Block_copy(v485);
                        v543[0] = 0;
                        v436 = [(IMDTelephonyServiceSession *)self filteringController];
                        v437 = [(IMDTelephonyIncomingMessageContext *)v432 sender];
                        v438 = [(IMDTelephonyIncomingMessageContext *)v432 chatIdentifier];
                        v439 = [(IMDTelephonyIncomingMessageContext *)v432 participants];
                        [v436 categorizeIncomingMessage:v476 messageGUID:v434 sender:v437 wasRelayed:v457 chatIdentifier:v438 participants:v439 checkingForSpam:v543 myReceiverISOCountryCode:v454 messageBody:v461 completion:v435];

                        if (cf1c) {
                          CFRelease(cf1c);
                        }
                        if (v459) {
                          (*((void (**)(id, uint64_t, id, void))v459 + 2))(v459, 1, v434, v543[0]);
                        }

                        _Block_object_dispose(buf, 8);
                        goto LABEL_627;
                      }
                      v404 = [(IMDTelephonyIncomingMessageContext *)v477 chatIdentifier];
                      v543[0] = 0;
                      v543[0] = [(IMDTelephonyIncomingMessageContext *)v477 style];
                      id v493 = v404;
                      [(IMDServiceSession *)self canonicalizeChatIdentifier:&v493 style:v543];
                      id v405 = v493;

                      [(IMDTelephonyIncomingMessageContext *)v477 setChatIdentifier:v405];
                      [(IMDTelephonyIncomingMessageContext *)v477 setStyle:v543[0]];
                      goto LABEL_587;
                    }
                  }
                }
              }
              else if (IsItemBlocked)
              {
                goto LABEL_66;
              }
            }
            v78 = (const void *)CMFItemCreateWithEmailAddress();
            BOOL v77 = CMFBlockListIsItemBlocked() != 0;
            if (v78) {
              CFRelease(v78);
            }
            goto LABEL_70;
          }
        }
      }
    }

    goto LABEL_63;
  }
  if (IMOSLoggingEnabled())
  {
    int v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "**** Invalid payload, ignoring.", buf, 2u);
    }
  }
  if (v459) {
    (*((void (**)(id, void, void, void))v459 + 2))(v459, 0, 0, 0);
  }
LABEL_629:
}

- (id)getLabelFor:(int64_t)a3 subCategory:(int64_t)a4
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  if (a3 == 3)
  {
    id v6 = @"smsfp";
  }
  else
  {
    if (a3 != 4)
    {
      id v6 = @"filtered";
      goto LABEL_18;
    }
    id v6 = @"smsft";
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  unint64_t v7 = objc_msgSend(MEMORY[0x1E4F6E938], "fetchSMSFilterExtensionParams", 0);
  uint64_t v8 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v8)
  {
    uint64_t v9 = v8;
    uint64_t v10 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v15 != v10) {
          objc_enumerationMutation(v7);
        }
        id v12 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v12 action] == a3 && objc_msgSend(v12, "subAction") == a4)
        {
          id v6 = [v12 label];
          goto LABEL_16;
        }
      }
      uint64_t v9 = [v7 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
LABEL_16:

LABEL_18:

  return v6;
}

- (void)_registerChatForIncomingMessageWithContext:(id)a3
{
  v33[1] = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if ([v4 isGroupChat])
  {
    id v5 = [v4 participants];
    id v6 = [v4 unformattedIDs];
    unint64_t v7 = [v4 countryCodes];
    long long v29 = [(IMDTelephonyServiceSession *)self createHandleInfoForParticipants:v5 unformattedIDs:v6 countryCodes:v7 isGroupChat:1];
  }
  else
  {
    uint64_t v8 = [v4 sender];
    v33[0] = v8;
    uint64_t v9 = [MEMORY[0x1E4F1C978] arrayWithObjects:v33 count:1];
    uint64_t v10 = [v4 senderUnformatted];
    id v11 = v10;
    if (!v10)
    {
      id v11 = [v4 sender];
    }
    id v32 = v11;
    id v12 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v32 count:1];
    uint64_t v13 = [v4 countryCode];
    long long v14 = (void *)v13;
    long long v15 = @"us";
    if (v13) {
      long long v15 = (__CFString *)v13;
    }
    int v31 = v15;
    long long v16 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v31 count:1];
    long long v29 = [(IMDTelephonyServiceSession *)self createHandleInfoForParticipants:v9 unformattedIDs:v12 countryCodes:v16 isGroupChat:0];

    if (!v10) {
  }
    }
  if (([v4 isSendEnabled] & 1) != 0 || objc_msgSend(v4, "isGroupChat"))
  {
    long long v17 = [v4 chatIdentifier];
    uint64_t v18 = [v4 style];
    uint64_t v19 = [v4 displayName];
    __int16 v20 = [v4 groupID];
    int v21 = [v4 originalGroupID];
    uint64_t v22 = [(IMDServiceSession *)self account];
    uint64_t v23 = [v4 category];
    uint64_t v24 = [v4 spamExtensionName];
    LOBYTE(v28) = 0;
    [(IMDServiceSession *)self didUpdateChatStatus:2 chat:v17 style:v18 displayName:v19 groupID:v20 originalGroupID:v21 lastAddressedHandle:0 lastAddressedSIMID:0 handleInfo:v29 account:v22 category:v23 spamExtensionName:v24 isBlackholed:v28];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Replying is disabled, joining chat with Read Only state", buf, 2u);
      }
    }
    long long v17 = [v4 chatIdentifier];
    uint64_t v26 = [v4 style];
    uint64_t v19 = [v4 displayName];
    uint64_t v27 = [v4 category];
    __int16 v20 = [v4 spamExtensionName];
    [(IMDServiceSession *)self didJoinReadOnlyChat:v17 style:v26 displayName:v19 groupID:0 handleInfo:v29 category:v27 spamExtensionName:v20];
  }
}

- (id)_updatedMessageContextForJunkProcessing:(id)a3
{
  uint64_t v64 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDTelephonyServiceSession *)self filteringController];
  int v6 = objc_msgSend(v5, "_isMessageCategorized:", objc_msgSend(v4, "category"));

  if (v6)
  {
    unint64_t v7 = (void *)[v4 copy];

    id v47 = v7;
    uint64_t v8 = -[IMDTelephonyServiceSession getLabelFor:subCategory:](self, "getLabelFor:subCategory:", [v7 category], objc_msgSend(v7, "subCategory"));
    uint64_t v9 = [(IMDTelephonyServiceSession *)self filteringController];
    uint64_t v10 = [v7 chatIdentifier];
    id v11 = [v9 _createNewChatIdentifierFromChatIdentifier:v10 andCategoryLabel:v8];
    [v7 setChatIdentifier:v11];

    if ([v7 isGroupChat])
    {
      id v12 = [(IMDTelephonyServiceSession *)self filteringController];
      uint64_t v13 = [v7 sender];
      long long v14 = [v12 _createNewChatIdentifierFromChatIdentifier:v13 andCategoryLabel:v8];
      [v7 setSender:v14];

      long long v15 = [(IMDTelephonyServiceSession *)self filteringController];
      long long v16 = [v7 senderUnformatted];
      long long v17 = [v15 _createNewChatIdentifierFromChatIdentifier:v16 andCategoryLabel:v8];
      [v7 setSenderUnformatted:v17];

      if (IMOSLoggingEnabled())
      {
        uint64_t v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          uint64_t v19 = [v7 chatIdentifier];
          __int16 v20 = [v7 sender];
          int v21 = [v7 senderUnformatted];
          *(_DWORD *)buf = 138412802;
          uint64_t v59 = v19;
          __int16 v60 = 2112;
          uint64_t v61 = v20;
          __int16 v62 = 2112;
          int v63 = v21;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Generated new chatIdentifier for group: %@ filteredSender: %@ filteredSenderUnformatted: %@", buf, 0x20u);
        }
      }
      id v22 = objc_alloc(MEMORY[0x1E4F1CA48]);
      uint64_t v23 = [v7 participants];
      uint64_t v24 = objc_msgSend(v22, "initWithCapacity:", objc_msgSend(v23, "count"));

      long long v54 = 0u;
      long long v55 = 0u;
      long long v52 = 0u;
      long long v53 = 0u;
      uint64_t v25 = [v7 participants];
      uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v57 count:16];
      if (v26)
      {
        uint64_t v27 = *(void *)v53;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v53 != v27) {
              objc_enumerationMutation(v25);
            }
            uint64_t v29 = *(void *)(*((void *)&v52 + 1) + 8 * i);
            uint64_t v30 = [(IMDTelephonyServiceSession *)self filteringController];
            int v31 = [v30 _createNewChatIdentifierFromChatIdentifier:v29 andCategoryLabel:v8];
            [v24 addObject:v31];
          }
          uint64_t v26 = [v25 countByEnumeratingWithState:&v52 objects:v57 count:16];
        }
        while (v26);
      }

      [v7 setParticipants:v24];
      id v32 = objc_alloc(MEMORY[0x1E4F1CA48]);
      int v33 = [v7 participants];
      uint64_t v34 = objc_msgSend(v32, "initWithCapacity:", objc_msgSend(v33, "count"));

      long long v50 = 0u;
      long long v51 = 0u;
      long long v48 = 0u;
      long long v49 = 0u;
      uint64_t v35 = [v7 unformattedIDs];
      uint64_t v36 = [v35 countByEnumeratingWithState:&v48 objects:v56 count:16];
      if (v36)
      {
        uint64_t v37 = *(void *)v49;
        do
        {
          for (uint64_t j = 0; j != v36; ++j)
          {
            if (*(void *)v49 != v37) {
              objc_enumerationMutation(v35);
            }
            uint64_t v39 = *(void *)(*((void *)&v48 + 1) + 8 * j);
            long long v40 = [(IMDTelephonyServiceSession *)self filteringController];
            id v41 = [v40 _createNewChatIdentifierFromChatIdentifier:v39 andCategoryLabel:v8];
            [v34 addObject:v41];
          }
          uint64_t v36 = [v35 countByEnumeratingWithState:&v48 objects:v56 count:16];
        }
        while (v36);
      }

      [v47 setUnformattedIDs:v34];
    }
    else
    {
      long long v43 = [v7 chatIdentifier];
      [v7 setSender:v43];

      if (IMOSLoggingEnabled())
      {
        long long v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          BOOL v45 = [v7 chatIdentifier];
          *(_DWORD *)buf = 138412290;
          uint64_t v59 = v45;
          _os_log_impl(&dword_1D967A000, v44, OS_LOG_TYPE_INFO, "Generated new filtered chat identifier: %@", buf, 0xCu);
        }
      }
    }

    char v42 = v47;
  }
  else
  {
    char v42 = v4;
  }

  return v42;
}

- (id)chatForIncomingMessageContext:(id)a3 createIfNotExists:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if ([v6 isGroupChat])
  {
    unint64_t v7 = [v6 sender];
    uint64_t v8 = [v6 destinationCallerID];
    uint64_t v37 = self;
    uint64_t v9 = [(IMDServiceSession *)self service];
    int v10 = [v9 groupsMergeDisplayNames];
    BOOL v36 = v4;
    if (v10)
    {
      id v11 = [v6 displayName];
    }
    else
    {
      id v11 = 0;
    }
    uint64_t v13 = [v6 participants];
    long long v14 = [v6 groupID];
    long long v15 = [v6 originalGroupID];
    id v12 = [(IMDServiceSession *)v37 bestCandidateGroupChatWithFromIdentifier:v7 toIdentifier:v8 displayName:v11 participants:v13 groupID:v14 originalGroupID:v15];

    if (v10) {
    self = v37;
    }
    BOOL v4 = v36;
  }
  else
  {
    unint64_t v7 = +[IMDChatRegistry sharedInstance];
    uint64_t v8 = [v6 chatIdentifier];
    uint64_t v9 = [(IMDServiceSession *)self account];
    id v12 = [v7 existingChatForID:v8 account:v9];
  }

  if (!v12)
  {
    if (!v4)
    {
      id v12 = 0;
      goto LABEL_25;
    }
    [(IMDTelephonyServiceSession *)self _registerChatForIncomingMessageWithContext:v6];
    uint64_t v24 = +[IMDChatRegistry sharedInstance];
    uint64_t v25 = [v6 chatIdentifier];
    uint64_t v26 = [(IMDServiceSession *)self account];
    id v12 = [v24 existingChatWithIdentifier:v25 account:v26];
    goto LABEL_24;
  }
  long long v16 = [(IMDServiceSession *)self service];
  int v17 = [v16 supportsCapability:*MEMORY[0x1E4F6E010]];

  if (!v17) {
    goto LABEL_25;
  }
  uint64_t v18 = [v6 groupID];
  if (!v18) {
    goto LABEL_13;
  }
  uint64_t v19 = (void *)v18;
  __int16 v20 = [v12 groupID];
  int v21 = [v6 groupID];
  char v22 = [v20 isEqualToString:v21];

  if ((v22 & 1) == 0)
  {
    uint64_t v27 = [v6 groupID];
    [v12 setGroupID:v27];

    int v23 = 1;
  }
  else
  {
LABEL_13:
    int v23 = 0;
  }
  uint64_t v28 = [v6 originalGroupID];
  if (v28)
  {
    uint64_t v29 = (void *)v28;
    uint64_t v30 = [v12 originalGroupID];
    int v31 = [v6 originalGroupID];
    char v32 = [v30 isEqualToString:v31];

    if ((v32 & 1) == 0)
    {
      int v33 = [v6 originalGroupID];
      [v12 setOriginalGroupID:v33];

      goto LABEL_23;
    }
  }
  if (v23)
  {
LABEL_23:
    uint64_t v34 = +[IMDChatStore sharedInstance];
    [v34 storeChat:v12];

    uint64_t v24 = -[IMDServiceSession broadcasterForChatListenersWithBlackholeStatus:](self, "broadcasterForChatListenersWithBlackholeStatus:", [v12 isBlackholed]);
    uint64_t v25 = [v12 guid];
    uint64_t v26 = [v12 dictionaryRepresentation];
    [v24 chat:v25 updated:v26];
LABEL_24:
  }
LABEL_25:

  return v12;
}

- (id)findChatAndLinkMessage:(id)a3 context:(id)a4
{
  uint64_t v51 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = (void *)[a4 copy];
  if (IMOSLoggingEnabled())
  {
    unint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = [v6 chatIdentifier];
      uint64_t v9 = [v6 category];
      uint64_t v10 = [v6 subCategory];
      id v11 = [v6 spamExtensionName];
      *(_DWORD *)buf = 138413058;
      long long v44 = v8;
      __int16 v45 = 2048;
      uint64_t v46 = v9;
      __int16 v47 = 2048;
      uint64_t v48 = v10;
      __int16 v49 = 2112;
      long long v50 = v11;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "findChatAndLinkMessage called for chatid %@ category %ld, subCategory %ld, extensionName %@", buf, 0x2Au);
    }
  }
  id v12 = [(IMDTelephonyServiceSession *)self _updatedMessageContextForJunkProcessing:v6];

  uint64_t v13 = [v12 sender];
  [v5 setSender:v13];

  id v39 = [(IMDTelephonyServiceSession *)self chatForIncomingMessageContext:v12 createIfNotExists:1];
  uint64_t v14 = [v12 category];
  uint64_t v15 = [v12 subCategory];
  long long v16 = [v12 spamExtensionName];
  [(IMDTelephonyServiceSession *)self _updateCategoryForChat:v39 andMessage:v5 category:v14 subCategory:v15 spamExtensionName:v16];

  int v17 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  LODWORD(v14) = [v17 stewieEnabled];

  if (v14)
  {
    if (([v39 isEmergencyChat] & 1) == 0)
    {
      uint64_t v18 = [MEMORY[0x1E4F6B3E8] sharedInstance];
      uint64_t v19 = [v5 sender];
      int v20 = [v18 isPhoneNumberEmergencyNumber:v19];

      if (v20)
      {
        if (IMOSLoggingEnabled())
        {
          int v21 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Receiving: Chat has been marked as an emergency chat", buf, 2u);
          }
        }
        [v39 updateIsEmergencyChat:1];
      }
    }
  }
  char v22 = [v12 chatIdentifier];
  uint64_t v23 = [v12 style];
  uint64_t v24 = [v12 originalAlias];
  uint64_t v25 = [v12 mySIMIDString];
  -[IMDTelephonyServiceSession _updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:iMessageCapability:](self, "_updateLastAddressedIDsIfNeededForChatWithIdentifier:style:lastAddressedHandle:lastAddressedSIMID:iMessageCapability:", v22, v23, v24, v25, [v12 capability]);

  uint64_t v26 = [v5 sender];
  uint64_t IsEmail = IMStringIsEmail();

  uint64_t v28 = [v5 fileTransferGUIDs];
  BOOL v29 = [v28 count] != 0;

  v41[0] = *MEMORY[0x1E4F6DCB0];
  uint64_t v30 = [NSNumber numberWithLong:0];
  v42[0] = v30;
  v41[1] = *MEMORY[0x1E4F6DCF8];
  int v31 = objc_msgSend(NSNumber, "numberWithBool:", objc_msgSend(v12, "isGroupChat"));
  v42[1] = v31;
  v41[2] = *MEMORY[0x1E4F6DCF0];
  char v32 = [NSNumber numberWithBool:IsEmail ^ 1];
  v42[2] = v32;
  v41[3] = *MEMORY[0x1E4F6DCE8];
  int v33 = [NSNumber numberWithInt:IsEmail];
  v42[3] = v33;
  v41[4] = *MEMORY[0x1E4F6DCD0];
  uint64_t v34 = [NSNumber numberWithBool:v29];
  v42[4] = v34;
  uint64_t v35 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v42 forKeys:v41 count:5];

  BOOL v36 = [MEMORY[0x1E4F6E890] sharedInstance];
  [v36 trackEvent:*MEMORY[0x1E4F6DAA8] withDictionary:v35];

  uint64_t v37 = [v5 subject];
  -[IMDTelephonyServiceSession _carrierReportJunkMetricsForSMSWithSubject:isGroupchat:hasAttachments:](self, "_carrierReportJunkMetricsForSMSWithSubject:isGroupchat:hasAttachments:", v37, [v12 isGroupChat], v29);

  return v39;
}

- (id)_messageDictionaryToRelayWithIncomingMessageDictionary:(id)a3 smsMessage:(id)a4
{
  id v5 = a4;
  id v6 = (void *)[a3 mutableCopy];
  unint64_t v7 = [v5 GUID];
  uint64_t v8 = [v7 length];

  if (v8)
  {
    uint64_t v9 = [v5 GUID];
    [v6 setObject:v9 forKeyedSubscript:IMDCTMessageDictionaryGUIDKey];
  }

  return v6;
}

- (void)_carrierReportJunkMetricsForSMSWithSubject:(id)a3 isGroupchat:(BOOL)a4 hasAttachments:(BOOL)a5
{
  BOOL v6 = a4;
  v15[1] = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  uint64_t v8 = v7;
  if (v6 || a5 || [v7 length])
  {
    if (v6) {
      uint64_t v9 = 3;
    }
    else {
      uint64_t v9 = 2;
    }
  }
  else
  {
    uint64_t v9 = 1;
  }
  uint64_t v10 = [MEMORY[0x1E4F6E890] sharedInstance];
  uint64_t v11 = *MEMORY[0x1E4F6D7E0];
  uint64_t v14 = @"type";
  id v12 = [NSNumber numberWithUnsignedInteger:v9];
  v15[0] = v12;
  uint64_t v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v15 forKeys:&v14 count:1];
  [v10 trackEvent:v11 withDictionary:v13];
}

@end