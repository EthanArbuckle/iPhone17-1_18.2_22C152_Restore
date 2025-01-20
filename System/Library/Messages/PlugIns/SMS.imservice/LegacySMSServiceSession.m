@interface LegacySMSServiceSession
- (BOOL)_allowedToGeneratePreviewForTransfer:(id)a3 smsMessage:(id)a4;
- (BOOL)_allowedToSendMessage:(id)a3 toChatIdentifier:(id)a4;
- (BOOL)_areAllParticipantsUnknown:(id)a3 fromSender:(id)a4;
- (BOOL)_areiMessageAndiCloudAccountTheSame:(id)a3;
- (BOOL)_canRelayMMS;
- (BOOL)_canSendWithCallerID:(id)a3;
- (BOOL)_checkMMSEnablementForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)_deviceAllowedToDisableRelay:(id)a3;
- (BOOL)_disableScreenTimeRestrictionsForMessageItem:(id)a3 chat:(id)a4 watchSendsOverCellular:(BOOL)a5 emergencyNumbersFoundInRecipients:(int64_t *)a6;
- (BOOL)_enableBackwardsCompatibility;
- (BOOL)_hasPeerDevices;
- (BOOL)_hasPhoneNumberAliasActive;
- (BOOL)_hasRelayDevice;
- (BOOL)_isAliasActiveForSMSRelay:(id)a3;
- (BOOL)_isConnectedOverBT:(id)a3;
- (BOOL)_isDefaultPairedDeviceRelayingLocally:(id)a3;
- (BOOL)_isDeviceATrustedHSA2Device:(id)a3;
- (BOOL)_isMessageCategorized:(int64_t)a3;
- (BOOL)_isOneOfMyActiveAlias:(id)a3;
- (BOOL)_isSpamFilteringEnabled;
- (BOOL)_isUsingSMSWatchService;
- (BOOL)_localDeviceSupportsRelay;
- (BOOL)_localDeviceSupportsSMS;
- (BOOL)_localDeviceSupportsSMSAndDoesNotHaveAPhoneNumberForSIMID:(id)a3;
- (BOOL)_localDeviceSupportsSMSAndHasAPhoneNumber;
- (BOOL)_newFeatureRequiredByMessageItem:(id)a3 chatIdentifier:(id)a4;
- (BOOL)_replicateMessage:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 lastKnownReplicationDate:(id)a6 callerID:(id)a7;
- (BOOL)_replicationDisabledByServerBag;
- (BOOL)_replicationRequiredForFeaturesUsedByMessageBody:(id)a3;
- (BOOL)_replicationRequiredForFeaturesUsedByMessageItem:(id)a3;
- (BOOL)_replicationRequirementsSatisfiedForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)_shouldCheckChatForSMSSpam:(id)a3 shouldRegister:(BOOL)a4 participants:(id)a5 sender:(id)a6 fallbackFilterCategory:(int64_t *)a7 fallbackFilterSubCategory:(int64_t *)a8;
- (BOOL)_shouldFailSMSMessageForTesting:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5;
- (BOOL)_shouldForceReplicationForStaleChatWithLastKnownReplicationDate:(id)a3;
- (BOOL)_shouldReplicateMessageItem:(id)a3 chatStyle:(unsigned __int8)a4 lastKnownReplicationDate:(id)a5 callerID:(id)a6;
- (BOOL)_shouldUploadToMMCS:(id)a3;
- (BOOL)_sosReplicationDisabledByServerBag;
- (BOOL)_storeSMSRelayExecutionBlock:(id)a3 forMessageGUID:(id)a4;
- (BOOL)_storeSpamCompletionBlock:(id)a3 forMessageGUID:(id)a4;
- (BOOL)_syncedMMSEnabledValue;
- (BOOL)acceptsIncomingReplicatedMessagesFromAccount:(id)a3 toIdentifier:(id)a4 isSOS:(BOOL)a5;
- (BOOL)accountHasAlias:(id)a3 aliastoCheck:(id)a4;
- (BOOL)hasConnectedLocalDevice;
- (BOOL)isIDInList:(id)a3 ArrayToCheck:(id)a4;
- (BOOL)isLocalDeviceProxyRegistered;
- (BOOL)isOutgoingReplicationEnabled;
- (BOOL)isProxyRegistered;
- (BOOL)isSMSRelayEnabled;
- (BOOL)isValidMMS:(id)a3;
- (BOOL)relayDictionaryToPeers:(id)a3 requiresUpload:(BOOL)a4;
- (BOOL)sendApprovalDisplayPinToDevice:(id)a3;
- (BOOL)sendDataToPeers:(id)a3 forcedCallerID:(id)a4 shouldFilterRecepients:(BOOL)a5 requestProxySend:(BOOL)a6 dontSendTo:(id)a7;
- (BOOL)sendEnrollmentRelatedMessageOverIDS:(id)a3 deviceToSendTo:(id)a4;
- (BOOL)sendFileToLocalPeers:(id)a3 metadata:(id)a4;
- (BOOL)sendToLocalPeers:(id)a3;
- (BOOL)shouldFixIncomingDate;
- (BOOL)watchConnectedOverBT;
- (IMDPlainTextTapbackInterpreter)tapbackInterpreter;
- (LegacySMSAttachmentController)attachmentController;
- (LegacySMSServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5;
- (double)_periodicReplicationTimeInterval;
- (id)_IDSService;
- (id)_allowedDevicesforSMSRelay;
- (id)_allowedIDSDevicesforSMSRelay;
- (id)_callerIDAccountFromSettings;
- (id)_callerIDForChatWithChatIdentifier:(id)a3 chatStyle:(unsigned __int8)a4 foundChat:(id)a5;
- (id)_callerIDForRelay;
- (id)_callerIDUsingFromIdentifier:(id)a3;
- (id)_challengedDevicesforSMSRelay;
- (id)_challengedIDSDevicesforSMSRelay;
- (id)_chatForSendingMessageItem:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5;
- (id)_compatibleMessageToSendForMessageItem:(id)a3;
- (id)_completionBlockForMessageGUID:(id)a3;
- (id)_convertCTMessagePartToDictionary:(id)a3;
- (id)_convertCTMessageToDictionary:(id)a3 requiresUpload:(BOOL *)a4;
- (id)_convertIMMessageItemDictionaryToIMMessageItem:(id)a3;
- (id)_convertIMMessageItemToDictionary:(id)a3;
- (id)_countryCodeForIncomingTextMessage:(id)a3;
- (id)_createNewChatIdentifierFromChatIdentifier:(id)a3 andCategoryLabel:(id)a4;
- (id)_destinationForDevice:(id)a3 forcedIdentity:(id)a4;
- (id)_deviceForCallerID:(id)a3;
- (id)_dominentPhoneNumberAlias;
- (id)_extractSMSSenderAddress:(id)a3;
- (id)_failureBlockForMessageGUID:(id)a3;
- (id)_fixIncomingDate:(id)a3;
- (id)_getSpamExtensionID;
- (id)_getSpamExtensionName;
- (id)_getStorageDictionaryUsingMsgDict:(id)a3 requiresUpload:(BOOL)a4;
- (id)_ignoredDevicesforSMSRelay;
- (id)_ignoredIDSDevicesforSMSRelay;
- (id)_messageDictionaryToRelayWithIncomingMessageDictionary:(id)a3 smsMessage:(id)a4;
- (id)_messageGUIDForMessageID:(int)a3;
- (id)_myCTPhoneNumber;
- (id)_newSMSFilteringSettingsDictForFilterState:(int64_t)a3;
- (id)_replicatedMessageGUIDToReleaseFromMessageDictionary:(id)a3;
- (id)accountForAlias:(id)a3 fromAccounts:(id)a4;
- (id)createHandleInfoForParticipants:(id)a3 unformattedIDs:(id)a4 countryCodes:(id)a5 isGroupChat:(BOOL)a6;
- (id)idsDeviceForFromID:(id)a3;
- (id)idsDeviceFromPushToken:(id)a3;
- (id)idsDeviceFromUniqueID:(id)a3;
- (id)lastAddressedHandleForJunkReportMessageItem:(id)a3;
- (id)lastAddressedSIMIDForJunkReportMessageItem:(id)a3;
- (id)localDevice;
- (id)newTelephonyMessagesForHandles:(id)a3 shouldBroadcastMessage:(BOOL)a4;
- (id)outgoingReplicationCallerIDForChat:(id)a3;
- (id)pairedDevice;
- (id)phoneAliasForDominentPhoneAlias:(id)a3 registeredPhoneNumber:(id)a4 preferedCallerID:(id)a5 CTPhoneNumber:(id)a6;
- (id)preferredAccountForReplicationOnService:(id)a3 eligibleAccounts:(id)a4;
- (id)retrieveAccountAndPhoneAliasForAccounts:(id)a3 shouldFilterRecepients:(BOOL)a4 requestProxySend:(BOOL)a5 preferredCallerID:(id)a6;
- (id)retrievePhoneAccountAndPhoneAliasFromIDSAccounts:(id)a3;
- (id)storageController;
- (int64_t)_iMessageCapabilityForSIMID:(id)a3;
- (int64_t)_numberOfRepliesFor:(id)a3 fallbackFilterCategory:(int64_t *)a4 fallbackFilterSubCategory:(int64_t *)a5;
- (int64_t)messageFilterSubActionResponseForBlastDoorSMSMessageFilterSubCategoryType:(int64_t)a3;
- (unint64_t)_sendingDecisionForMessageItem:(id)a3 callerID:(id)a4 chat:(id)a5;
- (unint64_t)capabilities;
- (unint64_t)randomSixDigitCode;
- (unsigned)_generateMessageIDForMessageGUID:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5;
- (unsigned)_readMMSUserOverrideForSingleSubscription;
- (void)_addDefaultPairedDeviceToAllowedSMSRelayList;
- (void)_addDeviceToAllowedSMSRelay:(id)a3 shouldSendApproval:(BOOL)a4;
- (void)_addDeviceToChallengedSMSRelay:(id)a3;
- (void)_addDeviceToIgnoredSMSRelay:(id)a3;
- (void)_addHSA2PairedDevicesToAllowedSMSRelayList;
- (void)_addOriginatedMessage:(id)a3;
- (void)_approveSelfForSMSRelay;
- (void)_buildCTPhoneNumberWithParticipantInfo:(id)a3 ctMessage:(id)a4;
- (void)_carrierReportJunkMetricsForSMSWithSubject:(id)a3 isGroupchat:(BOOL)a4 hasAttachments:(BOOL)a5;
- (void)_categorizeRelayMessageWithCategory:(int64_t)a3 subCategory:(int64_t)a4 deviceID:(id)a5 shouldRegister:(BOOL)a6 completion:(id)a7;
- (void)_checkAndSetRelayService;
- (void)_checkAndUpdateFilterParamsForFilterExtension;
- (void)_checkAndUpdateSMSFilteringSettingsForDeviceID:(id)a3 smsFilterCapabilitiesOptions:(unint64_t)a4 filterExtensionName:(id)a5;
- (void)_checkAndUpdateSMSSpamFilterExtensionForUnregisteredOrUpdatedPlugins:(id)a3 arePluginsRegistered:(BOOL)a4;
- (void)_checkIfMessageIsSpam:(id)a3 fromSender:(id)a4 withGuid:(id)a5 shouldRegister:(BOOL)a6 receiverISOCountryCode:(id)a7 receivedViaRelay:(BOOL)a8;
- (void)_clearInactivityTimer;
- (void)_clearMapForMessageGUID:(id)a3;
- (void)_clearPendingIncomingMessageQueue;
- (void)_clearSMSRelayMapForMessageWithGUID:(id)a3;
- (void)_clearSpamMapForMessageGUID:(id)a3;
- (void)_clearTimoutTimerForRelayMessageID:(id)a3;
- (void)_deferredReplicatedMessageReleaseWithAllowedMessage:(id)a3 outgoingProxyBlock:(id)a4;
- (void)_disableSpamFiltering;
- (void)_disableSpamFilteringAndRelay;
- (void)_doClearChats:(id)a3;
- (void)_doDeleteChat:(id)a3;
- (void)_enableSMSRelayForDevice:(id)a3;
- (void)_enableSpamFiltering;
- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4;
- (void)_executeSMSRelayBlockForMessageWithGUID:(id)a3;
- (void)_executeSMSRelayBlockForMessageWithGUID:(id)a3 category:(int64_t)a4 subCategory:(int64_t)a5;
- (void)_executeSpamCompletionBlockForMessageGuid:(id)a3 category:(int64_t)a4 subCategory:(int64_t)a5 shouldRegister:(BOOL)a6 receivedViaRelay:(BOOL)a7;
- (void)_finishSendingMessageItem:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 foundChat:(id)a6 didSendSMS:(BOOL)a7 attemptingReplication:(BOOL)a8 shouldForceFail:(BOOL)a9 watchSendsOverCellular:(BOOL)a10 forceReflection:(BOOL)a11 callerID:(id)a12;
- (void)_forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6;
- (void)_forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6 hasAttachment:(BOOL)a7 watchOnly:(BOOL)a8;
- (void)_forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6 watchOnly:(BOOL)a7;
- (void)_generatePreviewForTransfer:(id)a3 message:(id)a4;
- (void)_handleCapabilitiesChanged:(id)a3;
- (void)_handleDeleteCommandWithMessageDictionary:(id)a3;
- (void)_joinOneToOneChatWithChatIdentifier:(id)a3;
- (void)_markFromStorageIfNeeded:(id)a3 messageGUID:(id)a4;
- (void)_messageTimedOut:(id)a3;
- (void)_micEnabledStateDidChange:(id)a3;
- (void)_migrateSMSRelayForMICIfNeeded;
- (void)_noteDeviceHasMICForSMSRelay:(id)a3;
- (void)_prepareSMSRelayBlockForMessageDictionary:(id)a3 messageGUID:(id)a4;
- (void)_processMessageSendFailure:(unsigned int)a3;
- (void)_processMessageSent:(unsigned int)a3;
- (void)_processReceivedDictionary:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 withCompletionBlock:(id)a6;
- (void)_processReceivedDictionaryInBlastDoor:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 withCompletionBlock:(id)a6;
- (void)_processReceivedSMSFilteringSettingsDictionary:(id)a3 deviceID:(id)a4;
- (void)_processReceivedSMSFilteringSettingsDictionaryInBlastDoor:(id)a3 deviceID:(id)a4;
- (void)_processReceivedSMSFilteringSettingsMessage:(id)a3 deviceID:(id)a4;
- (void)_processReceivedSMSMessage:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 completionBlock:(id)a6;
- (void)_processSMSOrSMSMessageSentWithContext:(id)a3 success:(BOOL)a4 messageID:(unsigned int)a5 err1:(int64_t)a6 err2:(int64_t)a7 isSMS:(BOOL)a8;
- (void)_processSMSorMMSMessageReceivedWithContext:(id)a3 messageID:(int64_t)a4;
- (void)_receivedSMSDictionary:(id)a3 requiresUpload:(BOOL)a4 isBeingReplayed:(BOOL)a5;
- (void)_registerForAccountChanges;
- (void)_registerForCTNotifications;
- (void)_registerForIncomingMessages:(id)a3;
- (void)_relayCurrentSMSFilteringSettings;
- (void)_relayMessage:(id)a3 chat:(id)a4 didSendSMS:(BOOL)a5 attemptingReplication:(BOOL)a6 forceReflection:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 callerID:(id)a10;
- (void)_relaySMSFilteringSettingsForFilterState:(int64_t)a3;
- (void)_releasePendingMessagesAndProcessReceivedSMSMessage:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 completionBlock:(id)a6;
- (void)_removeDeviceFromAllowedSMSRelay:(id)a3;
- (void)_removeDeviceFromChallengedSMSRelay:(id)a3;
- (void)_removeDeviceFromIgnoredSMSRelay:(id)a3;
- (void)_removeDeviceHasMICForSMSRelay:(id)a3;
- (void)_removeOriginatedMessage:(id)a3;
- (void)_resetAndBroadcastBlackholeErrorStateIfNeededForChatIdentifier:(id)a3 chatStyle:(unsigned __int8)a4;
- (void)_sendMessageToAllSMSRelayDevicesWithOptions:(id)a3;
- (void)_sendMessageToPairedDeviceWithOptions:(id)a3;
- (void)_sendPinCodeToDeviceAndPromptForResponse:(id)a3;
- (void)_setClearMessageSendTimer;
- (void)_setContentIDAndLocationForSMILPart:(id)a3 messageGUID:(id)a4 isGroupChat:(BOOL)a5 phoneNumber:(id)a6 simID:(id)a7;
- (void)_setTimeoutTimerForRelayMessageID:(id)a3 timeout:(double)a4;
- (void)_setUpRelay;
- (void)_shouldAutoEnableDevicesforSMSRelay:(id)a3;
- (void)_smsSpamCheck:(id)a3 withMessageBody:(id)a4 withGuid:(id)a5 sender:(id)a6 shouldRegister:(BOOL)a7 receiverISOCountryCode:(id)a8 receivedViaRelay:(BOOL)a9;
- (void)_synchronizeMMSCapabilityToWatch:(BOOL)a3;
- (void)_unregisterForCTNotifications;
- (void)_updateCategoryForChat:(id)a3 andMessage:(id)a4 category:(int64_t)a5 subCategory:(int64_t)a6 shouldRegister:(BOOL)a7 spamExtensionName:(id)a8;
- (void)_updateFilterParamsForFilterExtension;
- (void)_updateLastAddressedIDsIfNeededForChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6;
- (void)_updateLastAddressedIDsIfNeededForChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6 iMessageCapability:(int64_t)a7;
- (void)_updatePhoneNumberCallerID;
- (void)_updateRelayStatus;
- (void)_updateShouldForceToSMSForChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 shouldForceToSMS:(BOOL)a5;
- (void)_updateSpamFilteringState:(int64_t)a3;
- (void)account:(id)a3 aliasesChanged:(id)a4;
- (void)addMessagePlainTextToTelephonyMessages:(id)a3 messageItem:(id)a4 processedMessageItem:(id)a5;
- (void)buildTelephonyPhoneNumbersForTelephonyMessages:(id)a3 shouldBroadcastMessage:(BOOL)a4 handles:(id)a5;
- (void)dealloc;
- (void)enqueReplayMessageCallback:(id)a3;
- (void)enrollDeviceInSMSRelay:(id)a3;
- (void)enrollSelfDeviceInSMSRelay;
- (void)handler:(id)a3 deleteCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 needsDeliveryReceipt:(id)a9 deliveryContext:(id)a10 storageContext:(id)a11;
- (void)handler:(id)a3 incomingDisplayPinCode:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 storageContext:(id)a10;
- (void)handler:(id)a3 incomingDownloadMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 storageContext:(id)a9;
- (void)handler:(id)a3 incomingEnrollMeRequest:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 storageContext:(id)a10;
- (void)handler:(id)a3 incomingPlainTextMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 storageContext:(id)a9;
- (void)handler:(id)a3 incomingResponseForApproval:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 storageContext:(id)a10;
- (void)handler:(id)a3 incomingSMSFilteringSettingsMessage:(id)a4 fromToken:(id)a5;
- (void)handler:(id)a3 localFileRequest:(id)a4 storageContext:(id)a5;
- (void)handler:(id)a3 localFileResponse:(id)a4 storageContext:(id)a5;
- (void)handler:(id)a3 localIncomingDownloadMessage:(id)a4 storageContext:(id)a5;
- (void)handler:(id)a3 localIncommingMessage:(id)a4 storageContext:(id)a5;
- (void)handler:(id)a3 localMessageError:(id)a4 storageContext:(id)a5;
- (void)handler:(id)a3 localMessageRead:(id)a4 storageContext:(id)a5;
- (void)handler:(id)a3 localMessageSent:(id)a4 storageContext:(id)a5;
- (void)handler:(id)a3 localOutgoingDownloadMessage:(id)a4 isBeingReplayed:(BOOL)a5 storageContext:(id)a6;
- (void)handler:(id)a3 localOutgoingMessage:(id)a4 isBeingReplayed:(BOOL)a5 storageContext:(id)a6;
- (void)handler:(id)a3 messageIDRead:(id)a4 timeStamp:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 storageContext:(id)a8;
- (void)handler:(id)a3 messageIDSendFailure:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timeStamp:(id)a7 storageContext:(id)a8;
- (void)handler:(id)a3 messageIDSent:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timeStamp:(id)a7 storageContext:(id)a8;
- (void)handler:(id)a3 outgoingDownloadMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 isBeingReplayed:(BOOL)a10 storageContext:(id)a11;
- (void)handler:(id)a3 outgoingPlainTextMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 isBeingReplayed:(BOOL)a10 isInProxyMode:(BOOL)a11 storageContext:(id)a12;
- (void)handler:(id)a3 outgoingPlainTextMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 isBeingReplayed:(BOOL)a10 storageContext:(id)a11;
- (void)handler:(id)a3 recoverCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 needsDeliveryReceipt:(id)a9 deliveryContext:(id)a10 storageContext:(id)a11;
- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChat:(id)a5 style:(unsigned __int8)a6;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 joinProperties:(id)a7;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 groupID:(id)a6 lastAddressedHandle:(id)a7 lastAddressedSIMID:(id)a8 joinProperties:(id)a9;
- (void)joinChat:(id)a3 handleInfo:(id)a4 style:(unsigned __int8)a5 joinProperties:(id)a6;
- (void)leaveChat:(id)a3 style:(unsigned __int8)a4;
- (void)loginServiceSessionWithAccount:(id)a3;
- (void)logoutServiceSessionWithAccount:(id)a3;
- (void)mmsMessageReceived:(id)a3 msgID:(int64_t)a4;
- (void)postMMSMessageSent:(id)a3 success:(BOOL)a4 messageID:(int64_t)a5 err1:(int64_t)a6 err2:(int64_t)a7;
- (void)postSMSMessageSent:(id)a3 success:(BOOL)a4 messageID:(int64_t)a5 err1:(int64_t)a6 err2:(int64_t)a7;
- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 completionBlock:(id)a7;
- (void)processPartsOfTelephonyMessages:(id)a3 parts:(id)a4 messageItem:(id)a5 isGroupChat:(BOOL)a6 phoneNumber:(id)a7 simID:(id)a8;
- (void)refreshServiceCapabilities;
- (void)replayMessage:(id)a3;
- (void)retryGroupPhotoUpload:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7 isPhotoRefresh:(BOOL)a8;
- (void)sendApprovalEnrollMe;
- (void)sendApprovalResponseToDevice:(id)a3 enteredCorrectly:(BOOL)a4 wasCancelled:(BOOL)a5;
- (void)sendCTMessageFromIMMessageItem:(id)a3 forChat:(id)a4 chat:(id)a5 style:(unsigned __int8)a6;
- (void)sendDeleteCommand:(id)a3 forChatGUID:(id)a4;
- (void)sendDeliveredQuietlyReceiptForMessage:(id)a3 forIncomingMessageFromIDSID:(id)a4 toChatGuid:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 withWillSendToDestinationsHandler:(id)a8;
- (void)sendDeliveryReceiptForMessageID:(id)a3 toID:(id)a4 deliveryContext:(id)a5 needsDeliveryReceipt:(id)a6 callerID:(id)a7 account:(id)a8;
- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10;
- (void)sendGroupPhotoUpdate:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 account:(id)a7;
- (void)sendJunkReportMessage:(id)a3;
- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5;
- (void)sendNotifyRecipientCommandForMessage:(id)a3 toChatGuid:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendPlayedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 reflectOnly:(BOOL)a7;
- (void)sendRecoverCommand:(id)a3 forChatGUID:(id)a4;
- (void)sendRepositionStickerMessage:(id)a3 chatIdentifier:(id)a4 accountID:(id)a5 style:(unsigned __int8)a6;
- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendSyndicationAction:(id)a3 toChatsWithIdentifiers:(id)a4;
- (void)sendTelephonyMessageFromJunkReportMessageItem:(id)a3;
- (void)sendUnApproveToDevice:(id)a3 extraKeys:(id)a4;
- (void)sendUpdatedCollaborationMetadata:(id)a3 toChatsWithIdentifiers:(id)a4 forMessageGUID:(id)a5;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)sessionDidBecomeActive;
- (void)sessionWillBecomeInactiveWithAccount:(id)a3;
- (void)setAttachmentController:(id)a3;
- (void)setMessageTypeForTelephonyMessage:(id)a3 shouldSendMMS:(BOOL)a4;
- (void)setSubjectForTelephonyMessages:(id)a3 messageItem:(id)a4;
- (void)smsMessageReceived:(id)a3 msgID:(int64_t)a4;
- (void)unEnrollDeviceInSMSRelay:(id)a3;
- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9;
- (void)updateMMSCapability;
@end

@implementation LegacySMSServiceSession

- (void)_processReceivedDictionaryInBlastDoor:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 withCompletionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  [v10 objectForKeyedSubscript:LegacySMSCTMessageDictionaryGUIDKey];
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1267C;
  v17[3] = &unk_8D348;
  id v18 = (id)objc_claimAutoreleasedReturnValue();
  v19 = self;
  id v20 = v10;
  id v21 = v11;
  BOOL v23 = a5;
  id v22 = v12;
  id v13 = v12;
  id v14 = v11;
  id v15 = v10;
  id v16 = v18;
  +[IMBlastdoor sendSMSDictionary:v15 withCompletionBlock:v17];
}

- (void)_releasePendingMessagesAndProcessReceivedSMSMessage:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 completionBlock:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = +[IMPendingReplicatedMessageCache sharedCache];
  id v14 = [v10 GUID];
  id v15 = [(LegacySMSServiceSession *)self service];
  id v16 = [v15 internalName];
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_12CD8;
  v20[3] = &unk_8D370;
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
    v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v12 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Generating preview for attachment part", v12, 2u);
    }
  }
  unsigned int v8 = [v6 isFromMe];
  v9 = [v6 service];
  if (v8) {
    +[IMSenderContext fromMeContextWithServiceName:v9];
  }
  else {
  id v10 = +[IMSenderContext untrustedContextWithServiceName:v9];
  }

  id v11 = +[IMDFileTransferCenter sharedInstance];
  [v11 generatePreviewForTransfer:v5 messageItem:v6 senderContext:v10];
}

- (id)_countryCodeForIncomingTextMessage:(id)a3
{
  id v3 = a3;
  v4 = [v3 countryCode];

  if (!v4)
  {
    id v6 = [v3 originatedDeviceSIM];
    if (v6)
    {
    }
    else
    {
      v7 = [v3 originatedDeviceNumber];

      if (!v7)
      {
LABEL_7:
        id v11 = +[IMMetricsCollector sharedInstance];
        [v11 forceAutoBugCaptureWithSubType:@"Missing Destination Information" errorPayload:0 type:@"DSDS Privacy Violation" context:@"Selected a default country code instead of being aware of the number a message was received on."];

        uint64_t v5 = IMCountryCodeForIncomingTextMessage();
        goto LABEL_8;
      }
    }
    unsigned int v8 = [v3 originatedDeviceNumber];
    v9 = [v3 originatedDeviceSIM];
    id v10 = +[IMCTSMSUtilities IMCountryCodeForPhoneNumber:v8 simID:v9];

    if (v10) {
      goto LABEL_9;
    }
    goto LABEL_7;
  }
  uint64_t v5 = [v3 countryCode];
LABEL_8:
  id v10 = (void *)v5;
LABEL_9:

  return v10;
}

- (void)_processReceivedSMSMessage:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 completionBlock:(id)a6
{
  id v8 = a3;
  id v378 = a4;
  id v383 = a6;
  v384 = v8;
  v9 = [v8 sender];
  uint64_t v380 = [v8 version];
  unint64_t v10 = v9;
  if (v10 | v380)
  {
    id v12 = (void *)v10;
    id v13 = +[IMMessageNotificationTimeManager sharedInstance];
    [v13 acquireAssertionToUnsuspendProcess];

    unsigned int v14 = [v8 trackMessage];
    id v15 = [v8 GUID];
    uint64_t v16 = (uint64_t)v15;
    if (![v15 length])
    {
      uint64_t v16 = StringGUID();
    }
    v376 = (void *)v16;
    if (v16) {
      unsigned int v17 = v14;
    }
    else {
      unsigned int v17 = 0;
    }
    if (v17 == 1)
    {
      id v18 = [(id)IMWeakLinkClass() sharedInstance];
      [v18 addMessagesID:v16];
    }
    v387 = [(LegacySMSServiceSession *)self _countryCodeForIncomingTextMessage:v384];
    if (!v387)
    {
      if (IMOSLoggingEnabled())
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "**** invalid country code on incoming SMS, please file a radar ****", buf, 2u);
        }
      }
      v387 = @"us";
    }
    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        id v21 = [v384 items];
        id v22 = [v21 count];
        id v23 = (uint64_t (*)(uint64_t, uint64_t))[v384 type];
        BOOL v24 = [v384 countryCode];
        v25 = [v384 serviceCenter];
        *(_DWORD *)buf = 138413570;
        *(void *)&buf[4] = v12;
        *(_WORD *)&buf[12] = 2048;
        *(void *)&buf[14] = v22;
        *(_WORD *)&buf[22] = 2048;
        v506 = v23;
        *(_WORD *)v507 = 2112;
        *(void *)&v507[2] = v24;
        *(_WORD *)&v507[10] = 2112;
        *(void *)&v507[12] = v25;
        __int16 v508 = 2112;
        v509 = v387;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "received message with sender: %@, %lu parts, type: %ld  msgCountryCode: %@ service center: %@  incoming code: %@", buf, 0x3Eu);
      }
    }
    if (![v12 length])
    {
      v26 = +[NSBundle bundleForClass:objc_opt_class()];
      v27 = [v26 localizedStringForKey:@"Unknown" value:&stru_8F4F0 table:@"SMSLocalizable"];

      id v28 = v27;
      id v12 = v28;
    }
    v377 = v12;
    if (v12)
    {
      if ([v12 _appearsToBePhoneNumber])
      {
        v29 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();
        IMNormalizedPhoneNumberForCFPhoneNumberRef();
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        if (IMOSLoggingEnabled())
        {
          v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            *(void *)&buf[4] = v29;
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v12;
            _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Created number ref: %@  for ID: %@", buf, 0x16u);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v387;
            _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "    => Country code: %@", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v33 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&buf[4] = v30;
            _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "      => Normalized: %@", buf, 0xCu);
          }
        }
        if (v29) {
          CFRelease(v29);
        }
        id v34 = [v30 length];
      }
      else
      {
        v379 = v12;
        if (![v12 _appearsToBeEmail]) {
          goto LABEL_50;
        }
        IMNormalizeFormattedString();
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        id v34 = [v30 length];
      }
      v379 = v12;
      if (v34)
      {
        id v30 = v30;

        v379 = v30;
      }
    }
    else
    {
      v379 = 0;
    }
LABEL_50:
    if (IMShouldHandleInternalPhishingAttempts() && IMStringIsEmail())
    {
      v504 = v379;
      v35 = +[NSArray arrayWithObjects:&v504 count:1];
      if (IMDAreAllAliasesUnknown())
      {
        char v36 = IMGetDomainBoolForKey();

        if ((v36 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            v37 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v379;
              _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "*** Blocking likely phishing SMS message from sender: %@", buf, 0xCu);
            }
          }
          if (!v383) {
            goto LABEL_669;
          }
          goto LABEL_88;
        }
      }
      else
      {
      }
    }
    if (sub_23B60(v379))
    {
      if (IMOSLoggingEnabled())
      {
        v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v379;
          _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "*** Blocking message from sender: %@", buf, 0xCu);
        }
      }
      if (!v383) {
        goto LABEL_669;
      }
      goto LABEL_88;
    }
    id v401 = v384;
    v39 = [v401 recipients];
    v40 = [v401 originatedDeviceSIM];
    v41 = [v401 originatedDeviceNumber];
    signed int v42 = +[IMCTSMSUtilities IMMMSMaxRecipientsForPhoneNumber:v41 simID:v40];
    unint64_t v43 = v42;
    if (v42 == 0x7FFFFFFF || !v42)
    {
      if (IMOSLoggingEnabled())
      {
        v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 134217984;
          *(void *)&buf[4] = v43;
          _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "Carrier bundle value for maxReceipients was 0 or INT_MAX (%llu), falling back to iMessage maximum", buf, 0xCu);
        }
      }
      v45 = +[IDSServerBag sharedInstanceForBagType:1];
      v46 = [v45 objectForKey:@"md-max-chat-participants-incoming"];

      if (v46) {
        unint64_t v43 = (unint64_t)[v46 unsignedIntegerValue];
      }
      else {
        unint64_t v43 = 50;
      }
    }
    if ((unint64_t)[v39 count] > v43)
    {
      if (IMOSLoggingEnabled())
      {
        v47 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          id v48 = [v39 count];
          *(_DWORD *)buf = 134218240;
          *(void *)&buf[4] = v48;
          *(_WORD *)&buf[12] = 2048;
          *(void *)&buf[14] = v43;
          _os_log_impl(&dword_0, v47, OS_LOG_TYPE_INFO, "Filtering message due to excessive receipient count: %llu maxReceipients: %llu", buf, 0x16u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v49 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          *(void *)&buf[4] = v379;
          _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "*** Blocking message with too many participants from sender: %@", buf, 0xCu);
        }
      }
      if (!v383) {
        goto LABEL_669;
      }
LABEL_88:
      (*((void (**)(id, void, void *, void))v383 + 2))(v383, 0, v376, 0);
LABEL_669:

      goto LABEL_670;
    }

    if ([v401 type]) {
      signed int v356 = 0;
    }
    else {
      signed int v356 = [v401 replaceMessage];
    }
    id v50 = objc_alloc((Class)NSMutableDictionary);
    v51 = [v401 items];
    id v409 = objc_msgSend(v50, "initWithCapacity:", objc_msgSend(v51, "count"));

    id v52 = objc_alloc((Class)NSMutableDictionary);
    v53 = [v401 items];
    id v416 = objc_msgSend(v52, "initWithCapacity:", objc_msgSend(v53, "count"));

    id v54 = objc_alloc((Class)NSMutableArray);
    v55 = [v401 items];
    id v414 = objc_msgSend(v54, "initWithCapacity:", objc_msgSend(v55, "count"));

    id v361 = objc_alloc_init((Class)NSMutableString);
    id v360 = objc_alloc_init((Class)NSMutableArray);
    long long v487 = 0u;
    long long v488 = 0u;
    long long v485 = 0u;
    long long v486 = 0u;
    id obj = [v401 items];
    id v370 = [obj countByEnumeratingWithState:&v485 objects:v503 count:16];
    if (v370)
    {
      v362 = 0;
      uint64_t v367 = *(void *)v486;
      uint64_t v355 = IMBalloonPluginIdentifierRichLinks;
      do
      {
        uint64_t v56 = 0;
        do
        {
          if (*(void *)v486 != v367)
          {
            uint64_t v57 = v56;
            objc_enumerationMutation(obj);
            uint64_t v56 = v57;
          }
          uint64_t v372 = v56;
          v58 = *(void **)(*((void *)&v485 + 1) + 8 * v56);
          if (IMOSLoggingEnabled())
          {
            v59 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v59, OS_LOG_TYPE_INFO, "  Part:", buf, 2u);
            }
          }
          if (IMOSLoggingEnabled())
          {
            v60 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
            {
              v61 = [v58 contentType];
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v61;
              _os_log_impl(&dword_0, v60, OS_LOG_TYPE_INFO, "      content type: %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            v62 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v62, OS_LOG_TYPE_INFO))
            {
              v63 = [v58 contentId];
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v63;
              _os_log_impl(&dword_0, v62, OS_LOG_TYPE_INFO, "        content ID: %@", buf, 0xCu);
            }
          }
          if (IMOSLoggingEnabled())
          {
            v64 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_INFO))
            {
              v65 = [v58 contentLocation];
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v65;
              _os_log_impl(&dword_0, v64, OS_LOG_TYPE_INFO, "  content location: %@", buf, 0xCu);
            }
          }
          v66 = [v58 contentId];
          cf1 = (void *)SMSCopySanitizedContentID();

          v67 = [v58 contentLocation];
          v375 = (void *)SMSCopySanitizedContentLocation();

          if (IMOSLoggingEnabled())
          {
            v68 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v68, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              *(void *)&buf[4] = cf1;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v375;
              _os_log_impl(&dword_0, v68, OS_LOG_TYPE_INFO, "Sanitized ID %@  sanitized loc %@", buf, 0x16u);
            }
          }
          v69 = [v58 content];
          v70 = (char *)[v69 type];

          if (v70 == (unsigned char *)&dword_0 + 2)
          {
            if (IMOSLoggingEnabled())
            {
              v99 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v99, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_0, v99, OS_LOG_TYPE_INFO, "  * This is an attachment part", buf, 2u);
              }
            }
            v393 = +[IMDFileTransferCenter sharedInstance];
            id v100 = v375;
            id v101 = v100;
            if (![v100 length])
            {
              id v101 = cf1;
            }
            id v388 = [v58 contentType];
            v102 = [v58 content];
            v103 = [v102 attachment];
            v410 = [v103 contentData];

            v104 = [v101 stringByRemovingURLEscapes];

            if (![(__CFString *)v104 length])
            {
              if (IMOSLoggingEnabled())
              {
                v105 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v105, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_0, v105, OS_LOG_TYPE_INFO, "  *** Empty filename!", buf, 2u);
                }
              }
              v104 = @"Attachment";
            }
            v106 = [(__CFString *)v104 pathExtension];
            BOOL v107 = [v106 length] == 0;

            if (v107)
            {
              if (IMOSLoggingEnabled())
              {
                v138 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v138, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&buf[4] = v104;
                  _os_log_impl(&dword_0, v138, OS_LOG_TYPE_INFO, "  *** Filename has no extension: %@", buf, 0xCu);
                }
              }
              v139 = +[IMFileManager defaultHFSFileManager];
              v140 = [v139 pathExtensionForMIMEType:v388];

              if (IMOSLoggingEnabled())
              {
                v141 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v141, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)&buf[4] = v140;
                  _os_log_impl(&dword_0, v141, OS_LOG_TYPE_INFO, "  Proposed extension: %@", buf, 0xCu);
                }
              }
              if ([v140 length])
              {
                uint64_t v142 = [(__CFString *)v104 stringByAppendingPathExtension:v140];

                if (IMOSLoggingEnabled())
                {
                  v143 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v143, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    *(void *)&buf[4] = v142;
                    _os_log_impl(&dword_0, v143, OS_LOG_TYPE_INFO, "  * Replacement filename: %@", buf, 0xCu);
                  }
                }
              }
              else
              {
                uint64_t v142 = (uint64_t)v104;
              }

              v108 = (void *)v142;
            }
            else
            {
              v108 = v104;
            }
            v145 = v108;
            v404 = [v108 lastPathComponent];
            v398 = objc_msgSend(v393, "guidForNewIncomingTransferWithFilename:isDirectory:totalBytes:hfsType:hfsCreator:hfsFlags:", v404, 0, objc_msgSend(v410, "length"), 0, 0, 0);
            if (IMOSLoggingEnabled())
            {
              v146 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v146, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v145;
                _os_log_impl(&dword_0, v146, OS_LOG_TYPE_INFO, "         filename: %@", buf, 0xCu);
              }
            }
            if (IMOSLoggingEnabled())
            {
              v147 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v147, OS_LOG_TYPE_INFO))
              {
                unsigned int v148 = [v410 length];
                *(_DWORD *)buf = 67109120;
                *(_DWORD *)&buf[4] = v148;
                _os_log_impl(&dword_0, v147, OS_LOG_TYPE_INFO, "      data length: %d", buf, 8u);
              }
            }
            if (IMOSLoggingEnabled())
            {
              v149 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v149, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v404;
                _os_log_impl(&dword_0, v149, OS_LOG_TYPE_INFO, "    transfer name: %@", buf, 0xCu);
              }
            }
            if (IMOSLoggingEnabled())
            {
              v150 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v150, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v398;
                _os_log_impl(&dword_0, v150, OS_LOG_TYPE_INFO, "             guid: %@", buf, 0xCu);
              }
            }
            *(void *)buf = 0;
            *(void *)&buf[8] = buf;
            *(void *)&buf[16] = 0x3032000000;
            v506 = sub_180E4;
            *(void *)v507 = sub_180F4;
            *(void *)&v507[8] = 0;
            if (v398)
            {
              v151 = +[NSFileManager defaultManager];
              v152 = objc_msgSend(v151, "im_randomTemporaryFileURLWithFileName:", v404);

              v153 = self;
              if (IMOSLoggingEnabled())
              {
                v154 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v154, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v489 = 138412290;
                  *(void *)v490 = v152;
                  _os_log_impl(&dword_0, v154, OS_LOG_TYPE_INFO, "  => Writing data to path: %@", v489, 0xCu);
                }

                v153 = self;
              }
              if (([v410 writeToURL:v152 atomically:1] & 1) == 0
                && IMOSLoggingEnabled())
              {
                v155 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v155, OS_LOG_TYPE_INFO))
                {
                  unsigned int v156 = [v410 length];
                  *(_DWORD *)v489 = 67109378;
                  *(_DWORD *)v490 = v156;
                  *(_WORD *)&v490[4] = 2112;
                  *(void *)&v490[6] = v152;
                  _os_log_impl(&dword_0, v155, OS_LOG_TYPE_INFO, "Failed to write data of length: %d   to path: %@", v489, 0x12u);
                }

                v153 = self;
              }
              v466[0] = _NSConcreteStackBlock;
              v466[1] = 3221225472;
              v466[2] = sub_180FC;
              v466[3] = &unk_8D398;
              id v467 = v393;
              id v157 = v398;
              id v468 = v157;
              v469 = v153;
              id v470 = v379;
              v472 = buf;
              id v471 = v360;
              v158 = objc_retainBlock(v466);
              if (+[IMDeviceUtilities deviceIsLockedDown])
              {
                v159 = +[IMTranscodeController sharedInstance];
                v462[0] = _NSConcreteStackBlock;
                v462[1] = 3221225472;
                v462[2] = sub_185D4;
                v462[3] = &unk_8D3C0;
                id v463 = v157;
                id v160 = v152;
                id v464 = v160;
                v465 = v158;
                [v159 generateSafeRender:v160 completionBlock:v462];
              }
              else
              {
                ((void (*)(void *, uint64_t, void *, void))v158[2])(v158, 1, v152, 0);
              }
            }
            else if (IMOSLoggingEnabled())
            {
              v161 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v161, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v489 = 138412290;
                *(void *)v490 = v58;
                _os_log_impl(&dword_0, v161, OS_LOG_TYPE_INFO, "Failed building file transfer guid for part: %@", v489, 0xCu);
              }
            }
            if (*(void *)(*(void *)&buf[8] + 40))
            {
              v162 = +[IMDMessageStore sharedInstance];
              v163 = [v162 messageWithGUID:v376];

              if ([(LegacySMSServiceSession *)self _allowedToGeneratePreviewForTransfer:*(void *)(*(void *)&buf[8] + 40) smsMessage:v401])
              {
                [(LegacySMSServiceSession *)self _generatePreviewForTransfer:*(void *)(*(void *)&buf[8] + 40) message:v163];
              }
              v164 = [*(id *)(*(void *)&buf[8] + 40) guid];
              v499 = v164;
              v165 = +[NSArray arrayWithObjects:&v499 count:1];
              v166 = +[NSAttributedString __im_attributedStringWithFileTransfers:v165];

              v167 = objc_msgSend(v166, "__im_attributedStringByAssigningMessagePartNumbers");
              if ([cf1 length]) {
                [v409 setObject:v167 forKey:cf1];
              }
              if ([v100 length]) {
                [v416 setObject:v167 forKey:v100];
              }
              [v414 addObject:v167];
              v168 = [v163 balloonBundleID];
              unsigned int v169 = [v168 containsString:v355];

              if (v169)
              {
                v170 = [v163 richLinkURLs];
                v171 = [v170 lastObject];

                if (v171) {
                  goto LABEL_272;
                }
                v172 = [v163 body];
                v173 = [v172 string];
                v171 = +[NSURL URLWithString:v173];

                if (v171)
                {
LABEL_272:
                  v174 = +[IMSharedWithYouManager sharedManager];
                  id v461 = 0;
                  id v460 = 0;
                  [v174 appNameAndBundleIDFoURL:v171 outAppName:&v461 outBundleID:&v460];
                  id v175 = v461;
                  id v176 = v460;

                  if ([v175 length]) {
                    [v163 setSwyAppName:v175];
                  }
                  if ([v176 length]) {
                    [v163 setSwyBundleID:v176];
                  }
                }
                else if (IMOSLoggingEnabled())
                {
                  v177 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v177, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)v489 = 138412290;
                    *(void *)v490 = v376;
                    _os_log_impl(&dword_0, v177, OS_LOG_TYPE_INFO, "unable to extract URL for message identified as RichLink: %@", v489, 0xCu);
                  }
                }
              }
            }
            _Block_object_dispose(buf, 8);
          }
          else if (v70 == (unsigned char *)&dword_0 + 1)
          {
            v89 = [v58 content];
            v90 = [v89 smil];
            v363 = [v90 contentBody];

            if (IMOSLoggingEnabled())
            {
              v91 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v91, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_0, v91, OS_LOG_TYPE_INFO, "  * This is a SMIL part", buf, 2u);
              }
            }
            if (IMOSLoggingEnabled())
            {
              v92 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v92, OS_LOG_TYPE_INFO))
              {
                MarcoLoggingStringForMessageData();
                id v93 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v93;
                _os_log_impl(&dword_0, v92, OS_LOG_TYPE_INFO, "  * Out body: %@", buf, 0xCu);
              }
            }
            if (![v363 length]
              || ([v363 string],
                  v94 = objc_claimAutoreleasedReturnValue(),
                  [v94 trimmedString],
                  v95 = objc_claimAutoreleasedReturnValue(),
                  BOOL v96 = [v95 length] == 0,
                  v95,
                  v94,
                  v96))
            {
              if (IMOSLoggingEnabled())
              {
                v112 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v112, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_0, v112, OS_LOG_TYPE_INFO, "  => Empty", buf, 2u);
                }
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                v97 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v97, OS_LOG_TYPE_INFO))
                {
                  MarcoLoggingStringForMessageData();
                  id v98 = (id)objc_claimAutoreleasedReturnValue();
                  *(_DWORD *)buf = 138412290;
                  *(void *)&buf[4] = v98;
                  _os_log_impl(&dword_0, v97, OS_LOG_TYPE_INFO, "  => Appending body %@", buf, 0xCu);
                }
              }
              if ([cf1 length]) {
                [v409 setObject:v363 forKey:cf1];
              }
              if ([v375 length]) {
                [v416 setObject:v363 forKey:v375];
              }
              [v414 addObject:v363];
            }
            id v394 = objc_alloc_init((Class)NSMutableArray);
            long long v483 = 0u;
            long long v484 = 0u;
            long long v481 = 0u;
            long long v482 = 0u;
            v113 = [v58 content];
            v114 = [v113 smil];
            id v385 = [v114 orderedParts];

            id v397 = [v385 countByEnumeratingWithState:&v481 objects:v502 count:16];
            if (v397)
            {
              id v389 = *(id *)v482;
              do
              {
                uint64_t v115 = 0;
                do
                {
                  if (*(id *)v482 != v389)
                  {
                    uint64_t v116 = v115;
                    objc_enumerationMutation(v385);
                    uint64_t v115 = v116;
                  }
                  uint64_t v403 = v115;
                  v411 = *(void **)(*((void *)&v481 + 1) + 8 * v115);
                  id v117 = objc_alloc_init((Class)IMDSMSPart);
                  long long v479 = 0u;
                  long long v480 = 0u;
                  long long v477 = 0u;
                  long long v478 = 0u;
                  v118 = [v411 textParts];
                  id v119 = [v118 countByEnumeratingWithState:&v477 objects:v501 count:16];
                  if (v119)
                  {
                    uint64_t v120 = *(void *)v478;
                    do
                    {
                      for (i = 0; i != v119; i = (char *)i + 1)
                      {
                        if (*(void *)v478 != v120) {
                          objc_enumerationMutation(v118);
                        }
                        v122 = *(void **)(*((void *)&v477 + 1) + 8 * i);
                        id v123 = objc_alloc((Class)IMDSMSTextPart);
                        v124 = [v122 contentLocation];
                        id v125 = [v123 initWithContentLocation:v124];

                        v126 = [v122 text];
                        [v125 appendText:v126];

                        [v117 addTextPart:v125];
                      }
                      id v119 = [v118 countByEnumeratingWithState:&v477 objects:v501 count:16];
                    }
                    while (v119);
                  }

                  long long v475 = 0u;
                  long long v476 = 0u;
                  long long v473 = 0u;
                  long long v474 = 0u;
                  v127 = [v411 attachmentParts];
                  id v128 = [v127 countByEnumeratingWithState:&v473 objects:v500 count:16];
                  if (v128)
                  {
                    uint64_t v129 = *(void *)v474;
                    do
                    {
                      for (j = 0; j != v128; j = (char *)j + 1)
                      {
                        if (*(void *)v474 != v129) {
                          objc_enumerationMutation(v127);
                        }
                        v131 = *(void **)(*((void *)&v473 + 1) + 8 * (void)j);
                        id v132 = objc_alloc((Class)IMDSMSAttachmentPart);
                        v133 = [v131 contentLocation];
                        id v134 = [v132 initWithContentLocation:v133];

                        [v117 addAttachmentPart:v134];
                      }
                      id v128 = [v127 countByEnumeratingWithState:&v473 objects:v500 count:16];
                    }
                    while (v128);
                  }

                  [v394 addObject:v117];
                  uint64_t v115 = v403 + 1;
                }
                while ((id)(v403 + 1) != v397);
                id v397 = [v385 countByEnumeratingWithState:&v481 objects:v502 count:16];
              }
              while (v397);
            }

            if ([v394 count])
            {
              if (v362)
              {
                if (IMOSLoggingEnabled())
                {
                  v135 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v135, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_0, v135, OS_LOG_TYPE_INFO, "Two SMILs found in MMS - this should not happen!", buf, 2u);
                  }
                }
                id v136 = [v362 mutableCopy];
                [v136 addObjectsFromArray:v394];
                id v137 = v136;
              }
              else
              {
                id v137 = v394;
              }
              id v144 = v137;

              v362 = v144;
            }
            else
            {
              id v144 = v394;
            }
          }
          else if (v70)
          {
            if (IMOSLoggingEnabled())
            {
              v109 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v109, OS_LOG_TYPE_INFO))
              {
                v110 = [v58 content];
                id v111 = [v110 type];
                *(_DWORD *)buf = 134217984;
                *(void *)&buf[4] = v111;
                _os_log_impl(&dword_0, v109, OS_LOG_TYPE_INFO, "Unhandled BlastDoorSMSCTPartContent: %ld", buf, 0xCu);
              }
            }
          }
          else
          {
            v71 = [v58 content];
            v72 = [v71 plain];
            id v73 = [v72 plainTextContentBody];

            if (v73)
            {
              id v73 = objc_alloc_init((Class)NSMutableString);
              v74 = [v58 content];
              v75 = [v74 plain];
              v76 = [v75 plainTextContentBody];
              [v73 appendString:v76];

              v77 = [v58 content];
              v78 = [v77 plain];
              v79 = [v78 plainTextContentBody];
              v80 = [v79 stringByRemovingWhitespace];
              [v361 appendString:v80];
            }
            if (IMOSLoggingEnabled())
            {
              v81 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
              {
                MarcoLoggingStringForMessageData();
                id v82 = (id)objc_claimAutoreleasedReturnValue();
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v82;
                _os_log_impl(&dword_0, v81, OS_LOG_TYPE_INFO, "  * This is a text part (%@)", buf, 0xCu);
              }
            }
            if ([v73 length])
            {
              v83 = +[NSCharacterSet newlineCharacterSet];
              unsigned __int8 v84 = objc_msgSend(v83, "characterIsMember:", objc_msgSend(v73, "characterAtIndex:", (char *)objc_msgSend(v73, "length") - 1));

              if ((v84 & 1) == 0)
              {
                if (IMOSLoggingEnabled())
                {
                  v85 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)buf = 0;
                    _os_log_impl(&dword_0, v85, OS_LOG_TYPE_INFO, "  * There's no trailing newline here, we'll make sure to append one next", buf, 2u);
                  }
                }
                [v73 appendString:@"\n"];
              }
              id v86 = [objc_alloc((Class)NSAttributedString) initWithString:v73];
              v87 = v86;
              if (v86)
              {
                v88 = objc_msgSend(v86, "__im_attributedStringByAssigningMessagePartNumbers");
                if (v88)
                {
                  if ([cf1 length]) {
                    [v409 setObject:v88 forKey:cf1];
                  }
                  if ([v375 length]) {
                    [v416 setObject:v88 forKey:v375];
                  }
                  [v414 addObject:v88];
                }
              }
            }
          }
          uint64_t v56 = v372 + 1;
        }
        while ((id)(v372 + 1) != v370);
        id v178 = [obj countByEnumeratingWithState:&v485 objects:v503 count:16];
        id v370 = v178;
      }
      while (v178);
    }
    else
    {
      v362 = 0;
    }

    if (IMOSLoggingEnabled())
    {
      v179 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v179, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v179, OS_LOG_TYPE_INFO, "After parsing the SMS, we have:", buf, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v180 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v180, OS_LOG_TYPE_INFO))
      {
        MarcoLoggingStringForMessageData();
        id v181 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v181;
        _os_log_impl(&dword_0, v180, OS_LOG_TYPE_INFO, "  orderedParts = %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v182 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v182, OS_LOG_TYPE_INFO))
      {
        MarcoLoggingStringForMessageData();
        id v183 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v183;
        _os_log_impl(&dword_0, v182, OS_LOG_TYPE_INFO, "  contentIDToParts = %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v184 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v184, OS_LOG_TYPE_INFO))
      {
        MarcoLoggingStringForMessageData();
        id v185 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v185;
        _os_log_impl(&dword_0, v184, OS_LOG_TYPE_INFO, "  contentLocToParts = %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v186 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v186, OS_LOG_TYPE_INFO))
      {
        MarcoLoggingStringForMessageData();
        id v187 = (id)objc_claimAutoreleasedReturnValue();
        *(_DWORD *)buf = 138412290;
        *(void *)&buf[4] = v187;
        _os_log_impl(&dword_0, v186, OS_LOG_TYPE_INFO, "  allParts = %@", buf, 0xCu);
      }
    }
    id v188 = objc_alloc_init((Class)NSMutableAttributedString);
    if ([v362 count])
    {
      long long v458 = 0u;
      long long v459 = 0u;
      long long v456 = 0u;
      long long v457 = 0u;
      id v390 = v362;
      id v399 = [v390 countByEnumeratingWithState:&v456 objects:v498 count:16];
      if (v399)
      {
        uint64_t v395 = *(void *)v457;
        do
        {
          uint64_t v189 = 0;
          do
          {
            if (*(void *)v457 != v395)
            {
              uint64_t v190 = v189;
              objc_enumerationMutation(v390);
              uint64_t v189 = v190;
            }
            uint64_t v405 = v189;
            v191 = *(void **)(*((void *)&v456 + 1) + 8 * v189);
            if (IMOSLoggingEnabled())
            {
              v192 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v192, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                *(void *)&buf[4] = v191;
                _os_log_impl(&dword_0, v192, OS_LOG_TYPE_INFO, "Examining part %@", buf, 0xCu);
              }
            }
            long long v454 = 0u;
            long long v455 = 0u;
            long long v452 = 0u;
            long long v453 = 0u;
            v193 = [v191 attachmentParts];
            id v194 = [v193 countByEnumeratingWithState:&v452 objects:v497 count:16];
            if (v194)
            {
              uint64_t v195 = *(void *)v453;
              do
              {
                v196 = 0;
                do
                {
                  if (*(void *)v453 != v195) {
                    objc_enumerationMutation(v193);
                  }
                  v197 = *(void **)(*((void *)&v452 + 1) + 8 * (void)v196);
                  if (IMOSLoggingEnabled())
                  {
                    v198 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v198, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)&buf[4] = v197;
                      _os_log_impl(&dword_0, v198, OS_LOG_TYPE_INFO, " Found attachmentPart %@", buf, 0xCu);
                    }
                  }
                  v199 = [v197 contentLocation];
                  v200 = [v416 objectForKey:v199];

                  if (v200
                    || ([v197 contentLocation],
                        v201 = objc_claimAutoreleasedReturnValue(),
                        [v409 objectForKey:v201],
                        v200 = objc_claimAutoreleasedReturnValue(),
                        v201,
                        v200))
                  {
                    [v188 appendAttributedString:v200];
                    [v414 removeObjectIdenticalTo:v200];
                  }
                  else if (IMOSLoggingEnabled())
                  {
                    v202 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v202, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_0, v202, OS_LOG_TYPE_INFO, " Did not find attachment's attributed string!", buf, 2u);
                    }
                  }
                  v196 = (char *)v196 + 1;
                }
                while (v194 != v196);
                id v203 = [v193 countByEnumeratingWithState:&v452 objects:v497 count:16];
                id v194 = v203;
              }
              while (v203);
            }

            long long v450 = 0u;
            long long v451 = 0u;
            long long v448 = 0u;
            long long v449 = 0u;
            v204 = [v191 textParts];
            id v205 = [v204 countByEnumeratingWithState:&v448 objects:v496 count:16];
            if (v205)
            {
              uint64_t v206 = *(void *)v449;
              do
              {
                v207 = 0;
                do
                {
                  if (*(void *)v449 != v206) {
                    objc_enumerationMutation(v204);
                  }
                  v208 = *(void **)(*((void *)&v448 + 1) + 8 * (void)v207);
                  if (IMOSLoggingEnabled())
                  {
                    v209 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v209, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)&buf[4] = v208;
                      _os_log_impl(&dword_0, v209, OS_LOG_TYPE_INFO, " Found textPart %@", buf, 0xCu);
                    }
                  }
                  v210 = [v208 contentLocation];
                  v211 = [v416 objectForKey:v210];

                  if (v211
                    || ([v208 contentLocation],
                        v212 = objc_claimAutoreleasedReturnValue(),
                        [v409 objectForKey:v212],
                        v211 = objc_claimAutoreleasedReturnValue(),
                        v212,
                        v211))
                  {
                    if (IMOSLoggingEnabled())
                    {
                      v213 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v213, OS_LOG_TYPE_INFO))
                      {
                        MarcoLoggingStringForMessageData();
                        id v214 = (id)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412290;
                        *(void *)&buf[4] = v214;
                        _os_log_impl(&dword_0, v213, OS_LOG_TYPE_INFO, " Appending text %@", buf, 0xCu);
                      }
                    }
                    [v188 appendAttributedString:v211];
                    [v414 removeObjectIdenticalTo:v211];
                  }
                  else
                  {
                    if (IMOSLoggingEnabled())
                    {
                      v219 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v219, OS_LOG_TYPE_INFO))
                      {
                        *(_WORD *)buf = 0;
                        _os_log_impl(&dword_0, v219, OS_LOG_TYPE_INFO, " Did not find textPart's attributed string!", buf, 2u);
                      }
                    }
                    v211 = 0;
                  }
                  v215 = [v208 text];
                  if ([v215 length])
                  {
                    if (IMOSLoggingEnabled())
                    {
                      v216 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v216, OS_LOG_TYPE_INFO))
                      {
                        MarcoLoggingStringForMessageData();
                        id v217 = (id)objc_claimAutoreleasedReturnValue();
                        *(_DWORD *)buf = 138412290;
                        *(void *)&buf[4] = v217;
                        _os_log_impl(&dword_0, v216, OS_LOG_TYPE_INFO, " Found embedded text %@", buf, 0xCu);
                      }
                    }
                    id v218 = [objc_alloc((Class)NSAttributedString) initWithString:v215];
                    [v188 appendAttributedString:v218];
                  }
                  v207 = (char *)v207 + 1;
                }
                while (v205 != v207);
                id v220 = [v204 countByEnumeratingWithState:&v448 objects:v496 count:16];
                id v205 = v220;
              }
              while (v220);
            }

            uint64_t v189 = v405 + 1;
          }
          while ((id)(v405 + 1) != v399);
          id v399 = [v390 countByEnumeratingWithState:&v456 objects:v498 count:16];
        }
        while (v399);
      }
    }
    long long v446 = 0u;
    long long v447 = 0u;
    long long v444 = 0u;
    long long v445 = 0u;
    id v415 = v414;
    id v221 = [v415 countByEnumeratingWithState:&v444 objects:v495 count:16];
    if (v221)
    {
      uint64_t v222 = *(void *)v445;
      do
      {
        for (k = 0; k != v221; k = (char *)k + 1)
        {
          if (*(void *)v445 != v222) {
            objc_enumerationMutation(v415);
          }
          uint64_t v224 = *(void *)(*((void *)&v444 + 1) + 8 * (void)k);
          if (IMOSLoggingEnabled())
          {
            v225 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v225, OS_LOG_TYPE_INFO))
            {
              MarcoLoggingStringForMessageData();
              id v226 = (id)objc_claimAutoreleasedReturnValue();
              *(_DWORD *)buf = 138412290;
              *(void *)&buf[4] = v226;
              _os_log_impl(&dword_0, v225, OS_LOG_TYPE_INFO, "Found unordered part: %@", buf, 0xCu);
            }
          }
          [v188 appendAttributedString:v224];
        }
        id v221 = [v415 countByEnumeratingWithState:&v444 objects:v495 count:16];
      }
      while (v221);
    }

    if ([v188 length])
    {
      v227 = +[NSCharacterSet newlineCharacterSet];
      v228 = [v188 string];
      unsigned int v229 = objc_msgSend(v227, "characterIsMember:", objc_msgSend(v228, "characterAtIndex:", (char *)objc_msgSend(v188, "length") - 1));

      if (v229)
      {
        if (IMOSLoggingEnabled())
        {
          v230 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v230, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v230, OS_LOG_TYPE_INFO, "  * Trimming trailing newline", buf, 2u);
          }
        }
        objc_msgSend(v188, "deleteCharactersInRange:", (char *)objc_msgSend(v188, "length") - 1, 1);
      }
    }
    id v231 = [v188 length];
    objc_msgSend(v188, "removeAttribute:range:", IMMessagePartAttributeName, 0, v231);
    v364 = objc_msgSend(v188, "__im_attributedStringByAssigningMessagePartNumbers");
    id v373 = [v364 mutableCopy];

    if (IMSharedHelperDeviceIsAltAccount())
    {
      v232 = +[IMCTSubscriptionUtilities sharedInstance];
      uint64_t v233 = [v232 ctPhoneNumber];
    }
    else
    {
      v234 = +[FTDeviceSupport sharedInstance];
      v235 = [v234 telephoneNumber];

      if (!v235)
      {
        CFTypeRef cf1a = 0;
        goto LABEL_396;
      }
      v232 = +[FTDeviceSupport sharedInstance];
      uint64_t v233 = [v232 telephoneNumber];
    }
    v236 = (void *)v233;
    CFTypeRef cf1a = (CFTypeRef)IMPhoneNumberRefCopyForPhoneNumber();

LABEL_396:
    v369 = [v401 originatedDeviceNumber];
    v371 = [v401 originatedDeviceSIM];
    if (![v373 length] && !objc_msgSend(v360, "count"))
    {
      id v237 = [objc_alloc((Class)NSMutableAttributedString) initWithString:@" " attributes:0];

      id v373 = v237;
    }
    *(void *)buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x3032000000;
    v506 = sub_180E4;
    *(void *)v507 = sub_180F4;
    *(void *)&v507[8] = 0;
    id v238 = objc_alloc((Class)IMMessageItem);
    v239 = [v401 date];
    v240 = sub_4E2B0(v239);
    v241 = [v360 arrayByApplyingSelector:"guid"];
    *(void *)&v507[8] = [v238 initWithSender:v379 time:v240 body:v373 attributes:0 fileTransferGUIDs:v241 flags:1 error:0 guid:v376 threadIdentifier:0];

    v242 = v369;
    if (!v369) {
      v242 = v371;
    }
    id v358 = v242;
    objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "setDestinationCallerID:");
    [(LegacySMSServiceSession *)self _markFromStorageIfNeeded:v378 messageGUID:v376];
    v243 = *(void **)(*(void *)&buf[8] + 40);
    v244 = [(LegacySMSServiceSession *)self accountID];
    [v243 setAccountID:v244];

    v245 = *(void **)(*(void *)&buf[8] + 40);
    v246 = [v401 subject];
    [v245 setSubject:v246];

    [*(id *)(*(void *)&buf[8] + 40) setReplaceID:v356];
    v247 = [v401 fallbackHash];
    if ([v361 length])
    {
      id v494 = v361;
      v248 = +[NSArray arrayWithObjects:&v494 count:1];
      v249 = [v248 SHA256HexString];

      v250 = [v401 fallbackHash];
      uint64_t v251 = +[NSString stringWithFormat:@"%@<%@>", v250, v249];

      v252 = (void *)v251;
    }
    else
    {
      v252 = v247;
    }
    v357 = v252;
    objc_msgSend(*(id *)(*(void *)&buf[8] + 40), "setFallbackHash:");
    if (IMOSLoggingEnabled())
    {
      v253 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v253, OS_LOG_TYPE_INFO))
      {
        v254 = [*(id *)(*(void *)&buf[8] + 40) fallbackHash];
        id v255 = [v254 length];
        *(_DWORD *)v489 = 134217984;
        *(void *)v490 = v255;
        _os_log_impl(&dword_0, v253, OS_LOG_TYPE_INFO, " => Fallback hash length: %llu", v489, 0xCu);
      }
    }
    id v256 = v379;
    v257 = [v373 string];
    HSAAuthenticationProcessIncomingMessage();
    if (v256) {
      CFRelease(v256);
    }
    if (v257) {
      CFRelease(v257);
    }
    v368 = v256;
    if (IMOSLoggingEnabled())
    {
      v258 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v258, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v489 = 138412290;
        *(void *)v490 = v360;
        _os_log_impl(&dword_0, v258, OS_LOG_TYPE_INFO, " => Transfers: %@", v489, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v259 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v259, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v489 = 138412290;
        *(void *)v490 = v362;
        _os_log_impl(&dword_0, v259, OS_LOG_TYPE_INFO, " => Ordered parts: %@", v489, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v260 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v260, OS_LOG_TYPE_INFO))
      {
        uint64_t v261 = *(void *)(*(void *)&buf[8] + 40);
        *(_DWORD *)v489 = 138412290;
        *(void *)v490 = v261;
        _os_log_impl(&dword_0, v260, OS_LOG_TYPE_INFO, " => Result message: %@", v489, 0xCu);
      }
    }
    unsigned __int8 v443 = 45;
    if (a5) {
      unsigned int obja = 1;
    }
    else {
      unsigned int obja = +[IMCTSMSUtilities IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:v369 simID:v371];
    }
    v400 = +[IMCTSMSUtilities IMMMSEmailAddressToMatchForPhoneNumber:v369 simID:v371];
    v359 = +[IMCTSMSUtilities IMCountryCodeForPhoneNumber:v369 simID:v371];
    if (IMOSLoggingEnabled())
    {
      v262 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v262, OS_LOG_TYPE_INFO))
      {
        CFStringRef v263 = @"NO";
        if (obja) {
          CFStringRef v263 = @"YES";
        }
        *(_DWORD *)v489 = 138412290;
        *(void *)v490 = v263;
        _os_log_impl(&dword_0, v262, OS_LOG_TYPE_INFO, "Group Messaging Enabled: %@", v489, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v264 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v264, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v489 = 138412290;
        *(void *)v490 = cf1a;
        _os_log_impl(&dword_0, v264, OS_LOG_TYPE_INFO, "My number: %@", v489, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v265 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v265, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v489 = 138412290;
        *(void *)v490 = v400;
        _os_log_impl(&dword_0, v265, OS_LOG_TYPE_INFO, "My email: %@", v489, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v266 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v266, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v489 = 138412290;
        *(void *)v490 = v371;
        _os_log_impl(&dword_0, v266, OS_LOG_TYPE_INFO, "My sim ID: %@", v489, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v267 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v267, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)v489 = 138412290;
        *(void *)v490 = v359;
        _os_log_impl(&dword_0, v267, OS_LOG_TYPE_INFO, "My receiver ISO country region: %@", v489, 0xCu);
      }
    }
    if (obja)
    {
      if (IMOSLoggingEnabled())
      {
        v268 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v268, OS_LOG_TYPE_INFO))
        {
          v269 = [v401 recipients];
          *(_DWORD *)v489 = 138412290;
          *(void *)v490 = v269;
          _os_log_impl(&dword_0, v268, OS_LOG_TYPE_INFO, "Recipients: %@", v489, 0xCu);
        }
      }
      long long v441 = 0u;
      long long v442 = 0u;
      long long v439 = 0u;
      long long v440 = 0u;
      v270 = [v401 recipients];
      id v271 = [v270 countByEnumeratingWithState:&v439 objects:v493 count:16];
      id v386 = v270;
      id v272 = 0;
      id v273 = 0;
      id v274 = 0;
      if (v271)
      {
        uint64_t v406 = *(void *)v440;
        CFStringRef v275 = @"us";
        if (v387) {
          CFStringRef v275 = v387;
        }
        CFStringRef v391 = v275;
        do
        {
          id v412 = v271;
          for (m = 0; m != v412; m = (char *)m + 1)
          {
            if (*(void *)v440 != v406) {
              objc_enumerationMutation(v386);
            }
            uint64_t v277 = *(void *)(*((void *)&v439 + 1) + 8 * (void)m);
            if (IMOSLoggingEnabled())
            {
              v278 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v278, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v489 = 138412290;
                *(void *)v490 = v277;
                _os_log_impl(&dword_0, v278, OS_LOG_TYPE_INFO, "  Recipient: %@", v489, 0xCu);
              }
            }
            v279 = [(LegacySMSServiceSession *)self _extractSMSSenderAddress:v277];
            if (v272)
            {
              if (!v273) {
                goto LABEL_470;
              }
            }
            else
            {
              id v272 = objc_alloc_init((Class)NSMutableArray);
              if (!v273)
              {
LABEL_470:
                id v273 = objc_alloc_init((Class)NSMutableArray);
                if (v274) {
                  goto LABEL_472;
                }
                goto LABEL_471;
              }
            }
            if (v274) {
              goto LABEL_472;
            }
LABEL_471:
            id v274 = objc_alloc_init((Class)NSMutableArray);
LABEL_472:
            if ([v279 _appearsToBePhoneNumber])
            {
              v280 = (const void *)IMPhoneNumberRefCopyForPhoneNumber();
              v281 = IMNormalizedPhoneNumberForCFPhoneNumberRef();
              if (IMOSLoggingEnabled())
              {
                v282 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v282, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v489 = 138412546;
                  *(void *)v490 = v280;
                  *(_WORD *)&v490[8] = 2112;
                  *(void *)&v490[10] = v279;
                  _os_log_impl(&dword_0, v282, OS_LOG_TYPE_INFO, "Created number ref: %@  for ID: %@", v489, 0x16u);
                }
              }
              if (IMOSLoggingEnabled())
              {
                v283 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v283, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v489 = 138412290;
                  *(void *)v490 = v387;
                  _os_log_impl(&dword_0, v283, OS_LOG_TYPE_INFO, "    => Country code: %@", v489, 0xCu);
                }
              }
              if (IMOSLoggingEnabled())
              {
                v284 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v284, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v489 = 138412290;
                  *(void *)v490 = v281;
                  _os_log_impl(&dword_0, v284, OS_LOG_TYPE_INFO, "      => Normalized: %@", v489, 0xCu);
                }
              }
              if (v280 && cf1a && CFEqual(cf1a, v280))
              {
                if (IMOSLoggingEnabled())
                {
                  v285 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v285, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)v489 = 0;
                    _os_log_impl(&dword_0, v285, OS_LOG_TYPE_INFO, "      ** This is my number, ignoring", v489, 2u);
                  }
                }
                v279 = 0;
                v281 = 0;
              }
              v286 = [v401 originatedDeviceNumber];
              if (IMOSLoggingEnabled())
              {
                v287 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v287, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v489 = 138412290;
                  *(void *)v490 = v286;
                  _os_log_impl(&dword_0, v287, OS_LOG_TYPE_INFO, "My Original Alias is %@", v489, 0xCu);
                }
              }
              if (v286 && _FTAreIDsEquivalent())
              {
                if (IMOSLoggingEnabled())
                {
                  v288 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v288, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)v489 = 0;
                    _os_log_impl(&dword_0, v288, OS_LOG_TYPE_INFO, "      ** My number is the service center, ignoring", v489, 2u);
                  }
                }
                v279 = 0;
                v281 = 0;
              }
              if (v280) {
                CFRelease(v280);
              }
              if ([v281 length])
              {
                id v289 = v281;
              }
              else
              {
                IMNormalizeFormattedString();
                id v289 = (id)objc_claimAutoreleasedReturnValue();
              }
              v292 = v289;
            }
            else
            {
              if ([v400 length] && objc_msgSend(v400, "isEqualToIgnoringCase:", v279))
              {
                if (IMOSLoggingEnabled())
                {
                  v290 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v290, OS_LOG_TYPE_INFO))
                  {
                    *(_WORD *)v489 = 0;
                    _os_log_impl(&dword_0, v290, OS_LOG_TYPE_INFO, "      ** This is my email, ignoring", v489, 2u);
                  }
                }
                v286 = 0;
              }
              else
              {
                v286 = v279;
              }
              v281 = [v401 originatedDeviceEmail];
              if (![v281 length] || !objc_msgSend(v281, "isEqualToIgnoringCase:", v286))
              {
                v292 = v286;
                goto LABEL_527;
              }
              if (IMOSLoggingEnabled())
              {
                v291 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v291, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)v489 = 0;
                  _os_log_impl(&dword_0, v291, OS_LOG_TYPE_INFO, "      ** This is my email (via proxy), ignoring", v489, 2u);
                }
              }
              v292 = 0;
            }

LABEL_527:
            if (v292)
            {
              if (IMOSLoggingEnabled())
              {
                v293 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v293, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v489 = 138412290;
                  *(void *)v490 = v292;
                  _os_log_impl(&dword_0, v293, OS_LOG_TYPE_INFO, "  => Canonical: %@", v489, 0xCu);
                }
              }
              [v272 addObject:v292];
              v294 = [(LegacySMSServiceSession *)self _extractSMSSenderAddress:v277];
              [v274 addObject:v391];
              if (v294) {
                CFStringRef v295 = v294;
              }
              else {
                CFStringRef v295 = &stru_8F4F0;
              }
              [v273 addObject:v295];
            }
          }
          id v271 = [v386 countByEnumeratingWithState:&v439 objects:v493 count:16];
        }
        while (v271);
      }

      if (!v368 || ([v272 containsObject:v368] & 1) != 0)
      {
LABEL_563:
        if ((unint64_t)[v272 count] > 1) {
          unsigned int v305 = obja;
        }
        else {
          unsigned int v305 = 0;
        }
        if (v305 == 1)
        {
          v306 = +[IMDChatRegistry sharedInstance];
          v307 = [(LegacySMSServiceSession *)self account];
          id v308 = [v306 generateUnusedChatIdentifierForGroupChatWithAccount:v307];

          unsigned __int8 v443 = 43;
          v309 = +[IMFeatureFlags sharedFeatureFlags];
          LODWORD(v306) = [v309 isReplicationEnabled];

          if (v306)
          {
            v413 = [(LegacySMSServiceSession *)self bestCandidateGroupChatWithFromIdentifier:v368 toIdentifier:v358 displayName:0 participants:v272 groupID:0];
            goto LABEL_572;
          }
          v310 = +[IMDChatRegistry sharedInstance];
          v311 = [(LegacySMSServiceSession *)self account];
          v413 = [v310 existingChatForIDs:v272 account:v311 style:43];
        }
        else
        {
          id v308 = v368;
          v310 = +[IMDChatRegistry sharedInstance];
          v311 = [(LegacySMSServiceSession *)self account];
          v413 = [v310 existingChatForID:v308 account:v311];
        }

LABEL_572:
        if (v413)
        {
          id v312 = [v413 chatIdentifier];

          unsigned __int8 v443 = [v413 style];
          if ([v413 isBlackholed])
          {
            if (IMOSLoggingEnabled())
            {
              v313 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v313, OS_LOG_TYPE_INFO))
              {
                id v314 = [v413 guid];
                *(_DWORD *)v489 = 138412290;
                *(void *)v490 = v314;
                _os_log_impl(&dword_0, v313, OS_LOG_TYPE_INFO, "SMS: Unblackholing an SMS chat %@", v489, 0xCu);
              }
            }
            [v413 updateIsBlackholed:0];
          }
          if ([v413 smsHandshakeState] == 1)
          {
            v315 = +[IMMetricsCollector sharedInstance];
            [v315 trackSpamEvent:7];

            [v413 updateSMSHandshakeState:0xFFFFFFFFLL];
          }
          if (objc_msgSend(v401, "has_sendEnabled")
            && ([v401 sendEnabled] & 1) == 0)
          {
            if ((v305 & 1) != 0 || ![v413 isFiltered])
            {
              if (IMOSLoggingEnabled())
              {
                v323 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v323, OS_LOG_TYPE_INFO))
                {
                  id v324 = [v413 isFiltered];
                  CFStringRef v325 = @"NO";
                  if (v305) {
                    CFStringRef v325 = @"YES";
                  }
                  *(_DWORD *)v489 = 138412546;
                  *(void *)v490 = v325;
                  *(_WORD *)&v490[8] = 2048;
                  *(void *)&v490[10] = v324;
                  _os_log_impl(&dword_0, v323, OS_LOG_TYPE_INFO, "Received a read only request for a group chat: %@ or known chat: %lld", v489, 0x16u);
                }
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                v316 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v316, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)v489 = 0;
                  _os_log_impl(&dword_0, v316, OS_LOG_TYPE_INFO, "Replying is disabled, setting join state to Read Only", v489, 2u);
                }
              }
              [v413 setState:4];
            }
          }
        }
        else
        {
          id v438 = v308;
          [(LegacySMSServiceSession *)self canonicalizeChatIdentifier:&v438 style:&v443];
          id v312 = v438;
        }
        if (+[IMSpamFilterHelper isInternationalSpamFilteringEnabled])
        {
          v317 = +[IMDChatRegistry sharedInstance];
          if (v413)
          {
            v318 = [v413 chatIdentifier];
            v319 = objc_msgSend(v317, "existingiMessageChatForID:withChatStyle:", v318, objc_msgSend(v413, "style"));
          }
          else
          {
            v319 = [v317 existingiMessageChatForID:v312 withChatStyle:v443];
          }

          if (v319 && [v319 isBlackholed])
          {
            if (IMOSLoggingEnabled())
            {
              v320 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v320, OS_LOG_TYPE_INFO))
              {
                id v321 = [v319 guid];
                *(_DWORD *)v489 = 138412290;
                *(void *)v490 = v321;
                _os_log_impl(&dword_0, v320, OS_LOG_TYPE_INFO, "Unblackholing sibling iMessage chat (%@) on reception of SMS message.", v489, 0xCu);
              }
            }
            v322 = +[IMMetricsCollector sharedInstance];
            if (v305) {
              [v322 trackSpamEvent:21];
            }
            else {
              [v322 trackSpamEvent:20];
            }

            [v319 updateIsBlackholed:0];
            v326 = +[IMDMessageStore sharedInstance];
            v327 = [v319 lastMessage];
            v328 = [v327 guid];
            [v326 markMessageGUIDUnread:v328];
          }
        }
        if (IMOSLoggingEnabled())
        {
          v329 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v329, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v489 = 138412290;
            *(void *)v490 = v272;
            _os_log_impl(&dword_0, v329, OS_LOG_TYPE_INFO, "   participants: %@", v489, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v330 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v330, OS_LOG_TYPE_INFO))
          {
            id v331 = [v413 guid];
            *(_DWORD *)v489 = 138412546;
            *(void *)v490 = v413;
            *(_WORD *)&v490[8] = 2112;
            *(void *)&v490[10] = v331;
            _os_log_impl(&dword_0, v330, OS_LOG_TYPE_INFO, "   found chat: %@ (%@)", v489, 0x16u);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v332 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v332, OS_LOG_TYPE_INFO))
          {
            CFStringRef v333 = @"NO";
            if (v305) {
              CFStringRef v333 = @"YES";
            }
            *(_DWORD *)v489 = 138412290;
            *(void *)v490 = v333;
            _os_log_impl(&dword_0, v332, OS_LOG_TYPE_INFO, "   isGroupChat: %@", v489, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          v334 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v334, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v489 = 138412290;
            *(void *)v490 = v312;
            _os_log_impl(&dword_0, v334, OS_LOG_TYPE_INFO, "   chatIdentifier: %@", v489, 0xCu);
          }
        }
        v419[0] = _NSConcreteStackBlock;
        v419[1] = 3221225472;
        v419[2] = sub_188FC;
        v419[3] = &unk_8D3E8;
        id v335 = v312;
        id v420 = v335;
        id v336 = v368;
        id v421 = v336;
        id v422 = v377;
        id v337 = v272;
        id v423 = v337;
        id v407 = v273;
        id v424 = v407;
        v425 = self;
        char v434 = v305;
        v432 = buf;
        id v338 = v274;
        id v426 = v338;
        v427 = v387;
        id v339 = v401;
        id v428 = v339;
        unsigned __int8 v435 = v443;
        BOOL v436 = v413 == 0;
        id v402 = v371;
        id v429 = v402;
        signed int v433 = v356;
        id v340 = v413;
        id v430 = v340;
        BOOL v437 = a5;
        id v341 = v376;
        id v431 = v341;
        v342 = objc_retainBlock(v419);
        if (IMOSLoggingEnabled())
        {
          v343 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v343, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v489 = 138412546;
            *(void *)v490 = v341;
            *(_WORD *)&v490[8] = 2112;
            *(void *)&v490[10] = v335;
            _os_log_impl(&dword_0, v343, OS_LOG_TYPE_INFO, "Looking at message with guid %@ for chatid %@, will check if it needs to be sent to spam extension app", v489, 0x16u);
          }
        }
        uint64_t v417 = 0;
        uint64_t v418 = 0;
        v344 = +[IMFeatureFlags sharedFeatureFlags];
        unsigned int v345 = [v344 isSMSFilterSyncEnabled];

        if (v345)
        {
          if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
          {
            if (IMOSLoggingEnabled())
            {
              v346 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v346, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v489 = 0;
                _os_log_impl(&dword_0, v346, OS_LOG_TYPE_INFO, "Device is iPad. Checking if we need to update filterCapbilities from relayed message", v489, 2u);
              }
            }
            id v392 = [v339 smsFilteringSettings];
            v396 = [v339 originatedDeviceUniqueID];
            if ([v396 length] && v392)
            {
              v347 = [v392 filterExtensionName];
              id v348 = [v392 smsFilterCapabilitiesOptions];
              if (IMOSLoggingEnabled())
              {
                v349 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v349, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)v489 = 138412802;
                  *(void *)v490 = v347;
                  *(_WORD *)&v490[8] = 2048;
                  *(void *)&v490[10] = v348;
                  __int16 v491 = 2112;
                  v492 = v396;
                  _os_log_impl(&dword_0, v349, OS_LOG_TYPE_INFO, "Received filterExtensionName: %@, smsFilterCapabilitiesOptions: %lu from deviceID:%@. Checking if we need to update filterCapabilities", v489, 0x20u);
                }
              }
              [(LegacySMSServiceSession *)self _checkAndUpdateSMSFilteringSettingsForDeviceID:v396 smsFilterCapabilitiesOptions:v348 filterExtensionName:v347];
            }
            else if (IMOSLoggingEnabled())
            {
              v351 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v351, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)v489 = 138412290;
                *(void *)v490 = v396;
                _os_log_impl(&dword_0, v351, OS_LOG_TYPE_INFO, "Received invalid deviceID:%@. Not checking if we need to update filterCapabilities", v489, 0xCu);
              }
            }
            if (IMOSLoggingEnabled())
            {
              v352 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v352, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)v489 = 0;
                _os_log_impl(&dword_0, v352, OS_LOG_TYPE_INFO, "Device is iPad. Checking for category and subCategory in relayed message", v489, 2u);
              }
            }
            if (objc_msgSend(v339, "has_spamCategory")) {
              id v353 = [v339 spamCategory];
            }
            else {
              id v353 = 0;
            }
            -[LegacySMSServiceSession _categorizeRelayMessageWithCategory:subCategory:deviceID:shouldRegister:completion:](self, "_categorizeRelayMessageWithCategory:subCategory:deviceID:shouldRegister:completion:", v353, -[LegacySMSServiceSession messageFilterSubActionResponseForBlastDoorSMSMessageFilterSubCategoryType:](self, "messageFilterSubActionResponseForBlastDoorSMSMessageFilterSubCategoryType:", [v339 filterSubCategory]), v396, v413 == 0, v342);

            goto LABEL_663;
          }
          if (![(LegacySMSServiceSession *)self _shouldCheckChatForSMSSpam:v335 shouldRegister:v413 == 0 participants:v337 sender:v336 fallbackFilterCategory:&v418 fallbackFilterSubCategory:&v417])
          {
LABEL_650:
            ((void (*)(void *, BOOL, uint64_t, uint64_t, void))v342[2])(v342, v413 == 0, v418, v417, 0);
LABEL_663:
            uint64_t v350 = 0;
            goto LABEL_664;
          }
        }
        else if (![(LegacySMSServiceSession *)self _shouldCheckChatForSMSSpam:v335 shouldRegister:v413 == 0 participants:v337 sender:v336 fallbackFilterCategory:&v418 fallbackFilterSubCategory:&v417])
        {
          goto LABEL_650;
        }
        LOBYTE(v354) = a5;
        [(LegacySMSServiceSession *)self _smsSpamCheck:v342 withMessageBody:v373 withGuid:v341 sender:v336 shouldRegister:v413 == 0 receiverISOCountryCode:v359 receivedViaRelay:v354];
        uint64_t v350 = 1;
LABEL_664:
        if (cf1a) {
          CFRelease(cf1a);
        }
        if (v383) {
          (*((void (**)(id, uint64_t, id, uint64_t))v383 + 2))(v383, 1, v341, v350);
        }

        _Block_object_dispose(buf, 8);
        goto LABEL_669;
      }
      [v272 addObject:v368];
      v296 = v377;
      CFStringRef v297 = v377;
      if (v387) {
        CFStringRef v298 = v387;
      }
      else {
        CFStringRef v298 = @"us";
      }
      [v274 addObject:v298];
      if (v377) {
        CFStringRef v299 = v297;
      }
      else {
        CFStringRef v299 = &stru_8F4F0;
      }
      [v273 addObject:v299];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v300 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v300, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)v489 = 138412290;
          *(void *)v490 = v256;
          _os_log_impl(&dword_0, v300, OS_LOG_TYPE_INFO, "Group messaging is disabled, ensuring the sender is in the participant set: %@", v489, 0xCu);
        }
      }
      id v301 = objc_alloc_init((Class)NSMutableArray);
      id v272 = v301;
      if (!v256 || (objc_msgSend(v301, "containsObject:") & 1) != 0)
      {
        id v273 = 0;
        id v274 = 0;
        goto LABEL_563;
      }
      [v272 addObject:v256];
      v296 = v377;
      CFStringRef v302 = v377;
      if (v387) {
        CFStringRef v303 = v387;
      }
      else {
        CFStringRef v303 = @"us";
      }
      [0 addObject:v303];
      if (v377) {
        CFStringRef v304 = v302;
      }
      else {
        CFStringRef v304 = &stru_8F4F0;
      }
      [0 addObject:v304];
      id v273 = 0;
      id v274 = 0;
    }

    goto LABEL_563;
  }
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "**** Invalid payload, ignoring.", buf, 2u);
    }
  }
  if (v383) {
    (*((void (**)(id, void, void, void))v383 + 2))(v383, 0, 0, 0);
  }
LABEL_670:
}

- (id)_messageDictionaryToRelayWithIncomingMessageDictionary:(id)a3 smsMessage:(id)a4
{
  id v5 = a4;
  id v6 = [a3 mutableCopy];
  v7 = [v5 GUID];
  id v8 = [v7 length];

  if (v8)
  {
    v9 = [v5 GUID];
    [v6 setObject:v9 forKeyedSubscript:LegacySMSCTMessageDictionaryGUIDKey];
  }

  return v6;
}

- (void)_carrierReportJunkMetricsForSMSWithSubject:(id)a3 isGroupchat:(BOOL)a4 hasAttachments:(BOOL)a5
{
  BOOL v6 = a4;
  id v7 = a3;
  id v8 = v7;
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
  unint64_t v10 = +[IMMetricsCollector sharedInstance];
  uint64_t v11 = IMMetricsCollectorEventCarrierReportJunkMessageReceivedType;
  CFStringRef v14 = @"type";
  id v12 = +[NSNumber numberWithUnsignedInteger:v9];
  id v15 = v12;
  id v13 = +[NSDictionary dictionaryWithObjects:&v15 forKeys:&v14 count:1];
  [v10 trackEvent:v11 withDictionary:v13];
}

- (int64_t)messageFilterSubActionResponseForBlastDoorSMSMessageFilterSubCategoryType:(int64_t)a3
{
  v4 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned __int8 v5 = [v4 isSMSFilterSyncEnabled];

  if ((v5 & ((unint64_t)(a3 - 1) < 0xC)) != 0) {
    return a3;
  }
  else {
    return 0;
  }
}

- (void)_processReceivedSMSFilteringSettingsDictionaryInBlastDoor:(id)a3 deviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if ([v7 length])
  {
    if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
    {
      id v8 = +[IMSenderContext untrustedContext];
      v10[0] = _NSConcreteStackBlock;
      v10[1] = 3221225472;
      v10[2] = sub_19A94;
      v10[3] = &unk_8D410;
      v10[4] = self;
      id v11 = v7;
      +[IMBlastdoor sendDictionary:v6 senderContext:v8 withCompletionBlock:v10];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v13 = v7;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Received invalid deviceID:%@. Not checking if we need to update filterCapabilities", buf, 0xCu);
    }
  }
}

- (void)_processReceivedSMSFilteringSettingsMessage:(id)a3 deviceID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v12) = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Device is iPad. Checking if we need to update filterCapbilities from relayed message", (uint8_t *)&v12, 2u);
      }
    }
    uint64_t v9 = [v6 filterExtensionName];
    id v10 = [v6 smsFilterCapabilitiesOptions];
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v12 = 138412802;
        id v13 = v9;
        __int16 v14 = 2048;
        id v15 = v10;
        __int16 v16 = 2112;
        id v17 = v7;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Received filterExtensionName: %@, smsFilterCapabilitiesOptions: %lu from deviceID:%@. Checking if we need to update filterCapabilities", (uint8_t *)&v12, 0x20u);
      }
    }
    [(LegacySMSServiceSession *)self _checkAndUpdateSMSFilteringSettingsForDeviceID:v7 smsFilterCapabilitiesOptions:v10 filterExtensionName:v9];
  }
}

- (LegacySMSServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v31.receiver = self;
  v31.super_class = (Class)LegacySMSServiceSession;
  id v11 = [(LegacySMSServiceSession *)&v31 initWithAccount:v8 service:v9 replicatingForSession:v10];
  if (v11)
  {
    if (IMOSLoggingEnabled())
    {
      int v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v30 = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Setting up SMS service", v30, 2u);
      }
    }
    if (qword_9C070 != -1) {
      dispatch_once(&qword_9C070, &stru_8DFC8);
    }
    [(LegacySMSServiceSession *)v11 _setUpRelay];
    [(LegacySMSServiceSession *)v11 _updateRelayStatus];
    [(LegacySMSServiceSession *)v11 _registerForAccountChanges];
    [(LegacySMSServiceSession *)v11 _updatePhoneNumberCallerID];
    id v13 = [[LegacySMSAttachmentController alloc] initWithSession:v11];
    attachmentController = v11->_attachmentController;
    v11->_attachmentController = v13;

    +[IMCTSMSUtilities IMSynchronizePreferredSubscriptionMMSCapabilityToWatch];
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v30 = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Setting up push handler", v30, 2u);
      }
    }
    __int16 v16 = objc_alloc_init(LegacySMSRelayPushHandler);
    smsRelayPushHandler = v11->_smsRelayPushHandler;
    v11->_smsRelayPushHandler = v16;

    [(LegacySMSRelayPushHandler *)v11->_smsRelayPushHandler addListener:v11];
    [(LegacySMSRelayPushHandler *)v11->_smsRelayPushHandler setRegistered:1];
    if (IMOSLoggingEnabled())
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v30 = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "...done", v30, 2u);
      }
    }
    id v19 = +[NSNotificationCenter defaultCenter];
    [v19 addObserver:v11 selector:"_handleCapabilitiesChanged:" name:FaceTimeDeviceCapabilityChangedNotification object:0];

    id v20 = +[NSNotificationCenter defaultCenter];
    [v20 addObserver:v11 selector:"_micEnabledStateDidChange:" name:IMDCKMiCEnabledStateReturned object:0];

    [(LegacySMSServiceSession *)v11 _migrateSMSRelayForMICIfNeeded];
    if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v30 = 0;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Delegate setup", v30, 2u);
      }
    }
    id v22 = (CoreTelephonyClient *)[objc_alloc((Class)IMWeakLinkClass()) initWithQueue:&_dispatch_main_q];
    coreTelephonyClient = v11->coreTelephonyClient;
    v11->coreTelephonyClient = v22;

    [(CoreTelephonyClient *)v11->coreTelephonyClient setDelegate:v11];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(DarwinNotifyCenter, v11, (CFNotificationCallback)sub_24170, @"com.apple.MobileSMS.MMSEnabled.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    DistributedCenter = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(DistributedCenter, v11, (CFNotificationCallback)sub_24318, @"com.apple.LaunchServices.pluginsunregistered", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v26 = CFNotificationCenterGetDistributedCenter();
    CFNotificationCenterAddObserver(v26, v11, (CFNotificationCallback)sub_24454, @"com.apple.LaunchServices.pluginsregistered", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    v27 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v27, v11, (CFNotificationCallback)sub_24590, @"_SMSFilterExtensionParamsChangeDistributedNotification", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
    id v28 = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterAddObserver(v28, v11, (CFNotificationCallback)sub_246E4, IMSIMSubscriptionsChangedNotification, 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  }

  return v11;
}

- (void)dealloc
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Dealloc", buf, 2u);
    }
  }
  v4 = [(NSMutableDictionary *)self->_outgoingRelayMessageTimerMap allValues];
  [v4 makeObjectsPerformSelector:"invalidate"];

  [(LegacySMSRelayPushHandler *)self->_smsRelayPushHandler setRegistered:0];
  [(LegacySMSRelayPushHandler *)self->_smsRelayPushHandler removeListener:self];
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.MobileSMS.MMSEnabled.changed", 0);
  id v6 = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(v6, self, @"_SMSFilterExtensionParamsChangeDistributedNotification", 0);
  DistributedCenter = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(DistributedCenter, self, @"com.apple.LaunchServices.pluginsunregistered", 0);
  id v8 = CFNotificationCenterGetDistributedCenter();
  CFNotificationCenterRemoveObserver(v8, self, @"com.apple.LaunchServices.pluginsregistered", 0);
  id v9 = +[NSNotificationCenter defaultCenter];
  [v9 removeObserver:self name:0 object:0];

  v10.receiver = self;
  v10.super_class = (Class)LegacySMSServiceSession;
  [(LegacySMSServiceSession *)&v10 dealloc];
}

- (BOOL)watchConnectedOverBT
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(IDSService *)self->_relayService devices];
  id v4 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v14;
LABEL_3:
    uint64_t v7 = 0;
    while (1)
    {
      if (*(void *)v14 != v6) {
        objc_enumerationMutation(v3);
      }
      id v8 = *(void **)(*((void *)&v13 + 1) + 8 * v7);
      if ([v8 deviceType] == (char *)&dword_4 + 2)
      {
        if ([v8 isLocallyPaired])
        {
          id v17 = v8;
          BOOL v9 = 1;
          objc_super v10 = +[NSArray arrayWithObjects:&v17 count:1];
          unsigned __int8 v11 = [(LegacySMSServiceSession *)self _isConnectedOverBT:v10];

          if (v11) {
            break;
          }
        }
      }
      if (v5 == (id)++v7)
      {
        id v5 = [v3 countByEnumeratingWithState:&v13 objects:v18 count:16];
        if (v5) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    BOOL v9 = 0;
  }

  return v9;
}

- (id)storageController
{
  return +[IMDMessageFromStorageController SMSStorageController];
}

- (IMDPlainTextTapbackInterpreter)tapbackInterpreter
{
  tapbackInterpreter = self->_tapbackInterpreter;
  if (!tapbackInterpreter)
  {
    id v4 = (IMDPlainTextTapbackInterpreter *)objc_alloc_init((Class)IMDPlainTextTapbackInterpreter);
    id v5 = self->_tapbackInterpreter;
    self->_tapbackInterpreter = v4;

    tapbackInterpreter = self->_tapbackInterpreter;
  }

  return tapbackInterpreter;
}

- (void)_registerForIncomingMessages:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Registering for incoming messages", v6, 2u);
    }
  }
  [(LegacySMSServiceSession *)self _registerForCTNotifications];
  [(LegacySMSServiceSession *)self _clearPendingIncomingMessageQueue];
}

- (void)sessionDidBecomeActive
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      int v12 = "-[LegacySMSServiceSession sessionDidBecomeActive]";
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  [(LegacySMSServiceSession *)self updateMMSCapability];
  id v4 = +[IMDLocalDaemon sharedDaemon];
  unsigned int v5 = [v4 isSetupComplete];

  int v6 = IMOSLoggingEnabled();
  if (v5)
  {
    if (v6)
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Daemon is ready registering for incoming messages", buf, 2u);
      }
    }
    [(LegacySMSServiceSession *)self _registerForIncomingMessages:0];
  }
  else
  {
    if (v6)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Daemon is not yet ready, watching for notification to register for incoming messages", buf, 2u);
      }
    }
    BOOL v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"_registerForIncomingMessages:" name:kFZDaemonFinishedLaunchingNotification object:0];
  }
  v10.receiver = self;
  v10.super_class = (Class)LegacySMSServiceSession;
  [(LegacySMSServiceSession *)&v10 sessionDidBecomeActive];
}

- (void)sessionWillBecomeInactiveWithAccount:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    unsigned int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v10 = "-[LegacySMSServiceSession sessionWillBecomeInactiveWithAccount:]";
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  [(LegacySMSServiceSession *)self _unregisterForCTNotifications];
  int v6 = [(NSMutableDictionary *)self->_outgoingRelayMessageTimerMap allValues];
  [v6 makeObjectsPerformSelector:"invalidate"];

  uint64_t v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:kFZDaemonFinishedLaunchingNotification object:0];

  v8.receiver = self;
  v8.super_class = (Class)LegacySMSServiceSession;
  [(LegacySMSServiceSession *)&v8 sessionWillBecomeInactiveWithAccount:v4];
}

- (BOOL)acceptsIncomingReplicatedMessagesFromAccount:(id)a3 toIdentifier:(id)a4 isSOS:(BOOL)a5
{
  BOOL v5 = a5;
  id v8 = a3;
  id v9 = a4;
  objc_super v10 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v11 = [v10 isSOSAlertingEnabled];

  if (v11) {
    BOOL v12 = !v5;
  }
  else {
    BOOL v12 = 1;
  }
  if (v12 || [(LegacySMSServiceSession *)self _sosReplicationDisabledByServerBag])
  {
    long long v13 = +[IMFeatureFlags sharedFeatureFlags];
    unsigned int v14 = [v13 isPriusEnabled];

    if (v14 && ![(LegacySMSServiceSession *)self _replicationDisabledByServerBag])
    {
      if (v9 && ([v9 _appearsToBePhoneNumber] & 1) != 0)
      {
        BOOL v15 = [(LegacySMSServiceSession *)self _replicationRequirementsSatisfiedForPhoneNumber:v9 simID:0];
        goto LABEL_21;
      }
      if (IMOSLoggingEnabled())
      {
        id v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          id v18 = [(LegacySMSServiceSession *)self account];
          int v20 = 138412802;
          id v21 = v8;
          __int16 v22 = 2112;
          id v23 = v18;
          __int16 v24 = 2112;
          id v25 = v9;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Cannot receive replication provided by %@ to %@, not a phone number %@", (uint8_t *)&v20, 0x20u);
        }
      }
    }
    BOOL v15 = 0;
    goto LABEL_21;
  }
  if (IMOSLoggingEnabled())
  {
    long long v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412546;
      id v21 = v8;
      __int16 v22 = 2112;
      id v23 = v9;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Allowing incoming replicated SOS message from %@ to %@", (uint8_t *)&v20, 0x16u);
    }
  }
  BOOL v15 = 1;
LABEL_21:

  return v15;
}

- (BOOL)isOutgoingReplicationEnabled
{
  v2 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned __int8 v3 = [v2 isReplicationEnabled];

  return v3;
}

- (id)outgoingReplicationCallerIDForChat:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 chatIdentifier];
  int v6 = -[LegacySMSServiceSession _callerIDForChatWithChatIdentifier:chatStyle:foundChat:](self, "_callerIDForChatWithChatIdentifier:chatStyle:foundChat:", v5, [v4 style], v4);

  return v6;
}

- (id)preferredAccountForReplicationOnService:(id)a3 eligibleAccounts:(id)a4
{
  id v50 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v71 = v50;
      __int16 v72 = 2112;
      id v73 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Choosing preferred replication account for %@ from %@", buf, 0x16u);
    }
  }
  id v8 = objc_alloc_init((Class)NSMutableSet);
  id v9 = +[IMCTSubscriptionUtilities sharedInstance];
  objc_super v10 = [v9 registeredPhoneNumbers];

  long long v66 = 0u;
  long long v67 = 0u;
  long long v64 = 0u;
  long long v65 = 0u;
  id v11 = v10;
  BOOL v12 = (char *)[v11 countByEnumeratingWithState:&v64 objects:v77 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v65;
    do
    {
      for (i = 0; i != v12; ++i)
      {
        if (*(void *)v65 != v13) {
          objc_enumerationMutation(v11);
        }
        BOOL v15 = IMChatCanonicalIDSIDsForAddress();
        long long v16 = [v15 _stripFZIDPrefix];

        [v8 addObject:v16];
      }
      BOOL v12 = (char *)[v11 countByEnumeratingWithState:&v64 objects:v77 count:16];
    }
    while (v12);
  }

  v51 = [(LegacySMSServiceSession *)self _dominentPhoneNumberAlias];
  if (v51)
  {
    id v17 = IMChatCanonicalIDSIDsForAddress();
    id v18 = [v17 _stripFZIDPrefix];

    [v8 addObject:v18];
  }
  long long v62 = 0u;
  long long v63 = 0u;
  long long v60 = 0u;
  long long v61 = 0u;
  id v19 = v6;
  id v20 = [v19 countByEnumeratingWithState:&v60 objects:v76 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v61;
    while (2)
    {
      for (j = 0; j != v20; j = (char *)j + 1)
      {
        if (*(void *)v61 != v21) {
          objc_enumerationMutation(v19);
        }
        id v23 = *(void **)(*((void *)&v60 + 1) + 8 * (void)j);
        __int16 v24 = [v23 loginID];
        id v25 = IMStripLoginID();

        v26 = IMChatCanonicalIDSIDsForAddress();
        v27 = [v26 _stripFZIDPrefix];

        if ([v8 containsObject:v27])
        {
          if (IMOSLoggingEnabled())
          {
            signed int v42 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              id v71 = v23;
              __int16 v72 = 2112;
              id v73 = v25;
              __int16 v74 = 2112;
              v75 = v27;
              _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "Preferring account %@ for replication based on loginID %@ canonicalLoginID %@", buf, 0x20u);
            }
          }
          id v41 = v23;

          goto LABEL_52;
        }
      }
      id v20 = [v19 countByEnumeratingWithState:&v60 objects:v76 count:16];
      if (v20) {
        continue;
      }
      break;
    }
  }

  long long v58 = 0u;
  long long v59 = 0u;
  long long v56 = 0u;
  long long v57 = 0u;
  id obj = v19;
  id v48 = [obj countByEnumeratingWithState:&v56 objects:v69 count:16];
  if (v48)
  {
    uint64_t v28 = *(void *)v57;
    uint64_t v45 = *(void *)v57;
    do
    {
      uint64_t v29 = 0;
      do
      {
        if (*(void *)v57 != v28)
        {
          uint64_t v30 = v29;
          objc_enumerationMutation(obj);
          uint64_t v29 = v30;
        }
        objc_super v31 = *(void **)(*((void *)&v56 + 1) + 8 * v29);
        long long v52 = 0u;
        long long v53 = 0u;
        long long v54 = 0u;
        long long v55 = 0u;
        uint64_t v46 = v29;
        v47 = v31;
        v32 = [v31 aliases];
        id v33 = [v32 countByEnumeratingWithState:&v52 objects:v68 count:16];
        if (v33)
        {
          uint64_t v34 = *(void *)v53;
          while (2)
          {
            for (k = 0; k != v33; k = (char *)k + 1)
            {
              if (*(void *)v53 != v34) {
                objc_enumerationMutation(v32);
              }
              char v36 = *(void **)(*((void *)&v52 + 1) + 8 * (void)k);
              v37 = IMChatCanonicalIDSIDsForAddress();
              v38 = [v37 _stripFZIDPrefix];

              if ([v8 containsObject:v38])
              {
                if (IMOSLoggingEnabled())
                {
                  unint64_t v43 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    id v71 = v47;
                    __int16 v72 = 2112;
                    id v73 = v36;
                    _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, "Preferring account %@ for replication based on alias %@", buf, 0x16u);
                  }
                }
                id v41 = v47;

                goto LABEL_52;
              }
            }
            id v33 = [v32 countByEnumeratingWithState:&v52 objects:v68 count:16];
            if (v33) {
              continue;
            }
            break;
          }
        }

        uint64_t v28 = v45;
        uint64_t v29 = v46 + 1;
      }
      while ((id)(v46 + 1) != v48);
      id v48 = [obj countByEnumeratingWithState:&v56 objects:v69 count:16];
      uint64_t v28 = v45;
    }
    while (v48);
  }

  if (IMOSLoggingEnabled())
  {
    v39 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
    {
      v40 = [v8 allObjects];
      *(_DWORD *)buf = 138412290;
      id v71 = v40;
      _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Failed to find matching replication account with possible numbers %@", buf, 0xCu);
    }
  }
  id v41 = 0;
LABEL_52:

  return v41;
}

- (BOOL)_replicationRequirementsSatisfiedForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[IMCTSMSUtilities IMMMSGroupTextReplicationSupportedForPhoneNumber:v6 simID:v7];
  unsigned int v9 = [(LegacySMSServiceSession *)self _checkMMSEnablementForPhoneNumber:v6 simID:v7];
  unsigned int v10 = +[IMCTSMSUtilities IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:v6 simID:v7];
  unsigned int v11 = [(LegacySMSServiceSession *)self _localDeviceSupportsSMS];
  if ([(LegacySMSServiceSession *)self _hasRelayDevice]) {
    unsigned int v12 = [(LegacySMSServiceSession *)self _canRelayMMS];
  }
  else {
    unsigned int v12 = 0;
  }
  if ((v9 & v10) == 1) {
    int v13 = v8 & (v11 | v12);
  }
  else {
    int v13 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    unsigned int v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      CFStringRef v15 = @"NO";
      int v22 = 138414082;
      id v23 = v6;
      if (v13) {
        CFStringRef v16 = @"YES";
      }
      else {
        CFStringRef v16 = @"NO";
      }
      if (v9) {
        CFStringRef v17 = @"YES";
      }
      else {
        CFStringRef v17 = @"NO";
      }
      if (v10) {
        CFStringRef v18 = @"YES";
      }
      else {
        CFStringRef v18 = @"NO";
      }
      __int16 v24 = 2112;
      id v25 = v7;
      __int16 v26 = 2112;
      CFStringRef v27 = v16;
      if (v8) {
        CFStringRef v19 = @"YES";
      }
      else {
        CFStringRef v19 = @"NO";
      }
      __int16 v28 = 2112;
      if (v11) {
        CFStringRef v20 = @"YES";
      }
      else {
        CFStringRef v20 = @"NO";
      }
      CFStringRef v29 = v17;
      if (v12) {
        CFStringRef v15 = @"YES";
      }
      __int16 v30 = 2112;
      CFStringRef v31 = v18;
      __int16 v32 = 2112;
      CFStringRef v33 = v19;
      __int16 v34 = 2112;
      CFStringRef v35 = v20;
      __int16 v36 = 2112;
      CFStringRef v37 = v15;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Phone number %@ and SIMID %@ satisfy replication requirements %@ (MMS: %@ groups: %@ isEnabledByCarrier: %@ local SMS: %@ relay: %@)", (uint8_t *)&v22, 0x52u);
    }
  }
  return v13;
}

- (BOOL)_replicationDisabledByServerBag
{
  v2 = +[IDSServerBag sharedInstanceForBagType:1];
  unsigned __int8 v3 = [v2 objectForKey:@"disable-hybrid-groups"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 BOOLValue])
  {
    if (IMOSLoggingEnabled())
    {
      id v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v7 = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Hybrid groups disabled by server bag", v7, 2u);
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
  v2 = +[IDSServerBag sharedInstanceForBagType:1];
  unsigned __int8 v3 = [v2 objectForKey:@"forced-replication-interval"];
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
          _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Server bag value for periodic replication interval: %f", (uint8_t *)&v10, 0xCu);
        }
      }
      [v3 doubleValue];
      double v4 = v8;
    }
  }

  return v4;
}

- (BOOL)_sosReplicationDisabledByServerBag
{
  v2 = +[IDSServerBag sharedInstanceForBagType:1];
  unsigned __int8 v3 = [v2 objectForKey:@"disable-sos-replication"];
  if ((objc_opt_respondsToSelector() & 1) != 0 && [v3 BOOLValue])
  {
    if (IMOSLoggingEnabled())
    {
      double v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v7 = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "SOS replication disabled by server bag", v7, 2u);
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

- (BOOL)_shouldReplicateMessageItem:(id)a3 chatStyle:(unsigned __int8)a4 lastKnownReplicationDate:(id)a5 callerID:(id)a6
{
  int v8 = a4;
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  int v13 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v14 = [v13 isSOSAlertingEnabled];

  if (v14 && [v10 isSOS])
  {
    unsigned __int8 v15 = [(LegacySMSServiceSession *)self _sosReplicationDisabledByServerBag];
LABEL_10:
    char v18 = v15 ^ 1;
    goto LABEL_12;
  }
  CFStringRef v16 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v17 = [v16 isPriusEnabled];

  char v18 = 0;
  if (v8 == 43 && v17)
  {
    if (![(LegacySMSServiceSession *)self _replicationRequiredForFeaturesUsedByMessageItem:v10]&& ![(LegacySMSServiceSession *)self _shouldForceReplicationForStaleChatWithLastKnownReplicationDate:v11]|| ![(LegacySMSServiceSession *)self _replicationRequirementsSatisfiedForPhoneNumber:v12 simID:0])
    {
      char v18 = 0;
      goto LABEL_12;
    }
    unsigned __int8 v15 = [(LegacySMSServiceSession *)self _replicationDisabledByServerBag];
    goto LABEL_10;
  }
LABEL_12:

  return v18;
}

- (BOOL)_replicationRequiredForFeaturesUsedByMessageItem:(id)a3
{
  id v4 = a3;
  if ([v4 isSOS]) {
    goto LABEL_32;
  }
  BOOL v5 = [v4 associatedMessageGUID];
  id v6 = [v5 length];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v8 = [v4 guid];
        int v29 = 138412290;
        __int16 v30 = v8;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Allowing replication for %@, has associated message GUID", (uint8_t *)&v29, 0xCu);
      }
LABEL_31:

      goto LABEL_32;
    }
    goto LABEL_32;
  }
  unsigned int v9 = [v4 expressiveSendStyleID];
  id v10 = [v9 length];

  if (v10)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        id v11 = [v4 guid];
        int v29 = 138412290;
        __int16 v30 = v11;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Allowing replication for %@, has expressive send", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_31;
    }
LABEL_32:
    BOOL v25 = 1;
    goto LABEL_33;
  }
  id v12 = [v4 threadIdentifier];
  id v13 = [v12 length];

  if (v13)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        unsigned int v14 = [v4 guid];
        int v29 = 138412290;
        __int16 v30 = v14;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Allowing replication for %@, has thread identifier", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  unsigned __int8 v15 = [v4 fileTransferGUIDs];
  id v16 = [v15 count];

  if (v16)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        unsigned int v17 = [v4 guid];
        int v29 = 138412290;
        __int16 v30 = v17;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Allowing replication for %@, has file transfer GUIDs", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  char v18 = [v4 balloonBundleID];
  id v19 = [v18 length];

  if (v19)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        CFStringRef v20 = [v4 guid];
        int v29 = 138412290;
        __int16 v30 = v20;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Allowing replication for %@, has balloon bundle ID", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  uint64_t v21 = [v4 body];
  unsigned int v22 = [(LegacySMSServiceSession *)self _replicationRequiredForFeaturesUsedByMessageBody:v21];

  int v23 = IMOSLoggingEnabled();
  if (v22)
  {
    if (v23)
    {
      uint64_t v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        __int16 v24 = [v4 guid];
        int v29 = 138412290;
        __int16 v30 = v24;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Allowing replication for %@, has non-plaintext or unknown attributes", (uint8_t *)&v29, 0xCu);
      }
      goto LABEL_31;
    }
    goto LABEL_32;
  }
  if (v23)
  {
    CFStringRef v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      __int16 v28 = [v4 guid];
      int v29 = 138412290;
      __int16 v30 = v28;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "No replication needed for %@", (uint8_t *)&v29, 0xCu);
    }
  }
  BOOL v25 = 0;
LABEL_33:

  return v25;
}

- (BOOL)_replicationRequiredForFeaturesUsedByMessageBody:(id)a3
{
  id v3 = a3;
  uint64_t v8 = 0;
  unsigned int v9 = &v8;
  uint64_t v10 = 0x2020000000;
  char v11 = 0;
  v7[0] = 0;
  v7[1] = v7;
  v7[2] = 0x2020000000;
  v7[3] = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_2659C;
  v6[3] = &unk_8D7A0;
  v6[4] = v7;
  v6[5] = &v8;
  objc_msgSend(v3, "enumerateAttributesInRange:options:usingBlock:", 0, objc_msgSend(v3, "length"), 0, v6);
  char v4 = *((unsigned char *)v9 + 24);
  _Block_object_dispose(v7, 8);
  _Block_object_dispose(&v8, 8);

  return v4;
}

- (BOOL)_shouldForceReplicationForStaleChatWithLastKnownReplicationDate:(id)a3
{
  id v4 = a3;
  [(LegacySMSServiceSession *)self _periodicReplicationTimeInterval];
  double v6 = v5;
  if (v5 <= 0.00000011920929)
  {
    if (IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Periodic forced replication interval is less than or equal to zero, disabling", (uint8_t *)&v16, 2u);
      }
    }
    char v10 = 0;
  }
  else if (v4)
  {
    uint64_t v7 = +[NSDate now];
    [v7 timeIntervalSinceDate:v4];
    double v9 = v8;

    char v10 = v9 > v6;
    if (IMOSLoggingEnabled())
    {
      char v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        CFStringRef v12 = @"NO";
        int v16 = 138412802;
        if (v9 > v6) {
          CFStringRef v12 = @"YES";
        }
        CFStringRef v17 = v12;
        __int16 v18 = 2048;
        double v19 = v9;
        __int16 v20 = 2048;
        double v21 = v6;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Should force replication: %@ (time since last: %f, interval: %f)", (uint8_t *)&v16, 0x20u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        LOWORD(v16) = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "No last known replication date, forcing replication", (uint8_t *)&v16, 2u);
      }
    }
    char v10 = 1;
  }

  return v10;
}

- (BOOL)_isUsingSMSWatchService
{
  return self->_relayService == self->_smsWatchService;
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
    [(LegacySMSServiceSession *)self _clearTimoutTimerForRelayMessageID:v10];
    if (!self->_outgoingRelayMessageTimerMap)
    {
      Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      outgoingRelayMessageTimerMap = self->_outgoingRelayMessageTimerMap;
      self->_outgoingRelayMessageTimerMap = Mutable;
    }
    double v9 = +[NSTimer scheduledTimerWithTimeInterval:self target:"_messageTimedOut:" selector:v10 userInfo:0 repeats:a4];
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
    id v4 = [(NSMutableDictionary *)self->_outgoingRelayMessageTimerMap objectForKey:v5];
    if (v4)
    {
      [(NSMutableDictionary *)self->_outgoingRelayMessageTimerMap removeObjectForKey:v5];
      [v4 invalidate];
    }
  }
}

- (void)_checkAndSetRelayService
{
  id v3 = [(IDSService *)self->_smsRelayService accounts];
  if ([v3 count])
  {
    id v4 = [(IDSService *)self->_smsRelayService devices];
    id v5 = [v4 count];

    if (v5)
    {
      objc_storeStrong((id *)&self->_relayService, self->_smsRelayService);
      if (!IMOSLoggingEnabled()) {
        goto LABEL_20;
      }
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        uint64_t v7 = [(IDSService *)self->_smsRelayService accounts];
        +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v7 count]);
        double v8 = (IDSService *)objc_claimAutoreleasedReturnValue();
        double v9 = [(IDSService *)self->_smsRelayService devices];
        id v10 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v9 count]);
        int v22 = 138412546;
        int v23 = v8;
        __int16 v24 = 2112;
        BOOL v25 = v10;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Relay service set to sms relay, accounts count %@ devices count %@", (uint8_t *)&v22, 0x16u);
      }
      goto LABEL_6;
    }
  }
  else
  {
  }
  char v11 = [(IDSService *)self->_smsWatchService accounts];
  if (![v11 count])
  {

    goto LABEL_15;
  }
  CFStringRef v12 = [(IDSService *)self->_smsWatchService devices];
  id v13 = [v12 count];

  if (!v13)
  {
LABEL_15:
    if (IMOSLoggingEnabled())
    {
      __int16 v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        LOWORD(v22) = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "LegacySMSServiceSession: Error no IDS Service available for SMS Relay", (uint8_t *)&v22, 2u);
      }
    }
    relayService = self->_relayService;
    self->_relayService = 0;

    goto LABEL_20;
  }
  objc_storeStrong((id *)&self->_relayService, self->_smsWatchService);
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      unsigned int v14 = [(IDSService *)self->_smsWatchService accounts];
      +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v14 count]);
      unsigned __int8 v15 = (IDSService *)objc_claimAutoreleasedReturnValue();
      int v16 = [(IDSService *)self->_smsWatchService devices];
      CFStringRef v17 = +[NSNumber numberWithUnsignedInteger:](NSNumber, "numberWithUnsignedInteger:", [v16 count]);
      int v22 = 138412546;
      int v23 = v15;
      __int16 v24 = 2112;
      BOOL v25 = v17;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Relay service set to sms watch service relay , accounts count %@ devices count %@", (uint8_t *)&v22, 0x16u);
    }
LABEL_6:
  }
LABEL_20:
  if (IMOSLoggingEnabled())
  {
    __int16 v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      double v21 = self->_relayService;
      int v22 = 138412290;
      int v23 = v21;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "  => Done: %@", (uint8_t *)&v22, 0xCu);
    }
  }
}

- (void)_addDefaultPairedDeviceToAllowedSMSRelayList
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Trying to add default paired device to allowed list", buf, 2u);
    }
  }
  [(LegacySMSServiceSession *)self _checkAndSetRelayService];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(IDSService *)self->_relayService devices];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    uint64_t v7 = *(void *)v13;
    *(void *)&long long v6 = 138412290;
    long long v11 = v6;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        double v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if (objc_msgSend(v9, "isDefaultPairedDevice", v11))
        {
          [(LegacySMSServiceSession *)self _addDeviceToAllowedSMSRelay:v9 shouldSendApproval:0];
          if (IMOSLoggingEnabled())
          {
            id v10 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = v11;
              CFStringRef v17 = v9;
              _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Added to paired list %@", buf, 0xCu);
            }
          }
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)_setUpRelay
{
  id v3 = objc_alloc((Class)IDSService);
  CFStringRef v4 = (const __CFString *)IDSServiceNameSMSRelay;
  id v5 = (IDSService *)[v3 initWithService:IDSServiceNameSMSRelay];
  smsRelayService = self->_smsRelayService;
  self->_smsRelayService = v5;

  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      double v8 = [(IDSService *)self->_smsRelayService accounts];
      int v14 = 138412546;
      CFStringRef v15 = v4;
      __int16 v16 = 2048;
      id v17 = [v8 count];
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Finished setting Up Relay Service (Service: %@), number of accounts: %lu", (uint8_t *)&v14, 0x16u);
    }
  }
  double v9 = (IDSService *)[objc_alloc((Class)IDSService) initWithService:@"com.apple.private.alloy.sms.watch"];
  smsWatchService = self->_smsWatchService;
  self->_smsWatchService = v9;

  if (IMOSLoggingEnabled())
  {
    long long v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      long long v12 = [(IDSService *)self->_smsWatchService accounts];
      id v13 = [v12 count];
      int v14 = 138412546;
      CFStringRef v15 = @"com.apple.private.alloy.sms.watch";
      __int16 v16 = 2048;
      id v17 = v13;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Finished setting Up SMS Watch Relay Service (Service: %@), number of accounts: %lu", (uint8_t *)&v14, 0x16u);
    }
  }
  [(IDSService *)self->_smsRelayService addDelegate:self queue:&_dispatch_main_q];
  [(IDSService *)self->_smsWatchService addDelegate:self queue:&_dispatch_main_q];

  [(LegacySMSServiceSession *)self _checkAndSetRelayService];
}

- (BOOL)isSMSRelayEnabled
{
  id v3 = [(IDSService *)self->_smsWatchService accounts];
  id v4 = [v3 count];

  if (v4) {
    return 1;
  }
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v6 = [(IDSService *)self->_relayService accounts];
  id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    BOOL v5 = 1;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if ([v10 accountType] == 1
          && ([v10 isActive] & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            long long v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)id v13 = 0;
              _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "The AppleID account is not active, we can not use SMS Relay", v13, 2u);
            }
          }
          BOOL v5 = 0;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v7);
  }
  else
  {
    BOOL v5 = 1;
  }

  return v5;
}

- (void)_updateRelayStatus
{
  if ([(LegacySMSServiceSession *)self _hasRelayDevice]) {
    unsigned int v3 = [(LegacySMSServiceSession *)self _hasPhoneNumberAliasActive];
  }
  else {
    unsigned int v3 = 0;
  }
  int v4 = IMGetDomainBoolForKey();
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"NO";
      if (v4) {
        CFStringRef v6 = @"YES";
      }
      int v13 = 138412290;
      CFStringRef v14 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Status Of Remote Approval for Relay is %@", (uint8_t *)&v13, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      CFStringRef v8 = @"NO";
      if (v3) {
        CFStringRef v8 = @"YES";
      }
      int v13 = 138412290;
      CFStringRef v14 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Does this device have SMS Relay capable devices on its account? %@", (uint8_t *)&v13, 0xCu);
    }
  }
  id v9 = objc_alloc_init((Class)NSMutableDictionary);
  id v10 = v9;
  if ((v3 & 1) == 0)
  {
    [v9 setObject:&__kCFBooleanFalse forKey:FZServiceDefaultsiSSMSRelayCapable];
    goto LABEL_20;
  }
  [v9 setObject:&__kCFBooleanTrue forKey:FZServiceDefaultsiSSMSRelayCapable];
  if ((v4 & 1) == 0)
  {
LABEL_20:
    long long v11 = &__kCFBooleanFalse;
    goto LABEL_21;
  }
  long long v11 = &__kCFBooleanTrue;
LABEL_21:
  [v10 setObject:v11 forKey:FZServiceDefaultsCanRelaySMS];
  [v10 setObject:v11 forKey:FZServiceDefaultsCanRelayMMS];
  long long v12 = [(LegacySMSServiceSession *)self account];
  [v12 writeAccountDefaults:v10];

  [(LegacySMSServiceSession *)self updateMMSCapability];
}

- (id)_callerIDForRelay
{
  long long v17 = [(LegacySMSServiceSession *)self _callerIDAccountFromSettings];
  if (v17)
  {
    id v3 = objc_alloc((Class)IDSAccountController);
    id v4 = [v3 initWithService:IDSServiceNameiMessage];
    BOOL v5 = [v4 accountWithUniqueID:v17];
    CFStringRef v6 = v5;
    if (v5)
    {
      id v7 = [v5 displayName];
      if (IMOSLoggingEnabled())
      {
        CFStringRef v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v24 = (uint64_t)v7;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Found Caller ID %@", buf, 0xCu);
        }
      }
    }
    else
    {
      id v7 = 0;
    }
  }
  else
  {
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v4 = [(IDSService *)self->_relayService accounts];
    id v7 = 0;
    id v9 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v19;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v19 != v10) {
            objc_enumerationMutation(v4);
          }
          long long v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
          if ([v12 accountType] == 1)
          {
            uint64_t v13 = [v12 displayName];
            if (IMOSLoggingEnabled())
            {
              CFStringRef v14 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v24 = v13;
                _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Found Caller ID %@", buf, 0xCu);
              }
            }
            id v7 = (void *)v13;
          }
        }
        id v9 = [v4 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v9);
    }
  }

  long long v15 = IMNormalizePhoneNumber();

  return v15;
}

- (id)_callerIDAccountFromSettings
{
  v2 = IMPreferredAccountMap();
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      id v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        long long v12 = v2;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Account Maps Currently Reads  %@", (uint8_t *)&v11, 0xCu);
      }
    }
    id v4 = [v2 objectForKey:IMServiceNameiMessage];
    if (v4)
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412290;
          long long v12 = v4;
          _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "iMessage Account Current reads  %@", (uint8_t *)&v11, 0xCu);
        }
      }
      CFStringRef v6 = [v4 objectForKey:@"guid"];
      if (IMOSLoggingEnabled())
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412290;
          long long v12 = v6;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "iMessage Caller ID Guid reads  %@", (uint8_t *)&v11, 0xCu);
        }
      }
      if (v6)
      {
        id v8 = v6;
      }
      else if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          LOWORD(v11) = 0;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Unable to locate CallerID Account in Prefered Account Map", (uint8_t *)&v11, 2u);
        }
      }
    }
    else
    {
      CFStringRef v6 = 0;
    }
  }
  else
  {
    CFStringRef v6 = 0;
  }

  return v6;
}

- (id)_dominentPhoneNumberAlias
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = [(IDSService *)self->_relayService accounts];
  id v4 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v25;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v25 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v8 accountType] == 1)
        {
          long long v22 = 0u;
          long long v23 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          id v9 = objc_msgSend(v8, "im_registeredURIs");
          id v10 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
          if (v10)
          {
            id v11 = v10;
            uint64_t v12 = *(void *)v21;
            do
            {
              for (j = 0; j != v11; j = (char *)j + 1)
              {
                if (*(void *)v21 != v12) {
                  objc_enumerationMutation(v9);
                }
                CFStringRef v14 = *(void **)(*((void *)&v20 + 1) + 8 * (void)j);
                if ([v14 _appearsToBePhoneNumber]
                  && [(LegacySMSServiceSession *)self _isAliasActiveForSMSRelay:v14])
                {
                  [v3 addObject:v14];
                }
              }
              id v11 = [v9 countByEnumeratingWithState:&v20 objects:v28 count:16];
            }
            while (v11);
          }
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v24 objects:v29 count:16];
    }
    while (v5);
  }

  if (v3)
  {
    long long v15 = [v3 sortedArrayUsingSelector:"localizedCaseInsensitiveCompare:"];
    long long v16 = [v15 firstObject];
  }
  else
  {
    long long v16 = 0;
  }
  long long v17 = IMNormalizePhoneNumber();

  return v17;
}

- (void)_registerForAccountChanges
{
  long long v10 = 0u;
  long long v11 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v3 = [(IDSService *)self->_relayService accounts];
  id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v11;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v11 != v5) {
          objc_enumerationMutation(v3);
        }
        id v7 = *(void **)(*((void *)&v10 + 1) + 8 * i);
        if ([v7 accountType] == 1)
        {
          if (IMOSLoggingEnabled())
          {
            id v8 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)id v9 = 0;
              _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Registering for Account alias changes", v9, 2u);
            }
          }
          [v7 addRegistrationDelegate:self queue:&_dispatch_main_q];
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v4);
  }
}

- (void)account:(id)a3 aliasesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    id v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Account %@ aliases has changes", (uint8_t *)&v9, 0xCu);
    }
  }
  [(LegacySMSServiceSession *)self _updateRelayStatus];
}

- (BOOL)_hasPhoneNumberAliasActive
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = [(IDSService *)self->_relayService accounts];
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v30 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v24;
    *(void *)&long long v5 = 138412290;
    long long v18 = v5;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(v3);
        }
        id v8 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if (objc_msgSend(v8, "accountType", v18) == 1)
        {
          if (IMOSLoggingEnabled())
          {
            int v9 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
            {
              id v10 = objc_msgSend(v8, "im_registeredURIs");
              *(_DWORD *)buf = v18;
              int v29 = v10;
              _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "aliases for AppleID account are %@", buf, 0xCu);
            }
          }
          long long v21 = 0u;
          long long v22 = 0u;
          long long v19 = 0u;
          long long v20 = 0u;
          long long v11 = objc_msgSend(v8, "im_registeredURIs");
          id v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v20;
            while (2)
            {
              for (j = 0; j != v12; j = (char *)j + 1)
              {
                if (*(void *)v20 != v13) {
                  objc_enumerationMutation(v11);
                }
                long long v15 = *(void **)(*((void *)&v19 + 1) + 8 * (void)j);
                if ([v15 _appearsToBePhoneNumber]
                  && [(LegacySMSServiceSession *)self _isAliasActiveForSMSRelay:v15])
                {

                  BOOL v16 = 1;
                  goto LABEL_26;
                }
              }
              id v12 = [v11 countByEnumeratingWithState:&v19 objects:v27 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v23 objects:v30 count:16];
      BOOL v16 = 0;
    }
    while (v4);
  }
  else
  {
    BOOL v16 = 0;
  }
LABEL_26:

  return v16;
}

- (BOOL)_isOneOfMyActiveAlias:(id)a3
{
  id v4 = a3;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v5 = [(IDSService *)self->_relayService accounts];
  id v6 = [v5 countByEnumeratingWithState:&v25 objects:v32 count:16];
  if (v6)
  {
    uint64_t v20 = *(void *)v26;
    *(void *)&long long v7 = 138412290;
    long long v19 = v7;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v26 != v20) {
          objc_enumerationMutation(v5);
        }
        int v9 = *(void **)(*((void *)&v25 + 1) + 8 * i);
        if (objc_msgSend(v9, "accountType", v19) == 1)
        {
          if (IMOSLoggingEnabled())
          {
            id v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              long long v11 = objc_msgSend(v9, "im_registeredURIs");
              *(_DWORD *)buf = v19;
              CFStringRef v31 = v11;
              _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "aliases for AppleID account are %@", buf, 0xCu);
            }
          }
          long long v23 = 0u;
          long long v24 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v12 = objc_msgSend(v9, "im_registeredURIs");
          id v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
          if (v13)
          {
            uint64_t v14 = *(void *)v22;
            while (2)
            {
              for (j = 0; j != v13; j = (char *)j + 1)
              {
                if (*(void *)v22 != v14) {
                  objc_enumerationMutation(v12);
                }
                BOOL v16 = *(void **)(*((void *)&v21 + 1) + 8 * (void)j);
                if ([v16 isEqualToString:v4]
                  && [(LegacySMSServiceSession *)self _isAliasActiveForSMSRelay:v16])
                {

                  BOOL v17 = 1;
                  goto LABEL_26;
                }
              }
              id v13 = [v12 countByEnumeratingWithState:&v21 objects:v29 count:16];
              if (v13) {
                continue;
              }
              break;
            }
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v25 objects:v32 count:16];
      BOOL v17 = 0;
    }
    while (v6);
  }
  else
  {
    BOOL v17 = 0;
  }
LABEL_26:

  return v17;
}

- (BOOL)_hasRelayDevice
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  long long v18 = self;
  id v4 = [(IDSService *)self->_relayService devices];
  id v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
  int v6 = 0;
  if (v5)
  {
    uint64_t v7 = *(void *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v7) {
          objc_enumerationMutation(v4);
        }
        int v9 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (([v9 supportsSMSRelay] & 1) != 0
          || [v9 supportsMMSRelay])
        {
          id v10 = +[IMFeatureFlags sharedFeatureFlags];
          unsigned int v11 = [v10 isSMSFilterSyncEnabled];

          ++v6;
          if (v11)
          {
            id v12 = [v9 uniqueIDOverride];
            [v3 addObject:v12];
          }
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v5);
  }

  id v13 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v14 = [v13 isSMSFilterSyncEnabled];

  if (v14)
  {
    if (+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
    {
      +[IMSMSFilterCapabilitiesSyncHelper verifyCurrentRelayDevicesActive:v3];
      if ([(LegacySMSServiceSession *)v18 _isSpamFilteringEnabled])
      {
        if ((+[IMSMSFilterCapabilitiesSyncHelper isSMSFilteringEnabledInSMSFilterCapabilitiesOptions] & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            long long v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "No more relay devices available. SMS Filtering state changed from enabled to disabled. Need to update filter params.", buf, 2u);
            }
          }
          [(LegacySMSServiceSession *)v18 _disableSpamFiltering];
        }
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v24 = v6;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Found %d Relayable Devices", buf, 8u);
    }
  }
  return v6 > 0;
}

- (BOOL)_hasPeerDevices
{
  v2 = [(IDSService *)self->_relayService devices];
  BOOL v3 = [v2 count] != 0;

  return v3;
}

- (BOOL)_canRelayMMS
{
  v2 = [(LegacySMSServiceSession *)self account];
  BOOL v3 = [v2 accountDefaults];
  id v4 = [v3 objectForKeyedSubscript:FZServiceDefaultsCanRelayMMS];
  unsigned __int8 v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)_localDeviceSupportsSMS
{
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v3 = IMSMSEnabled();
      CFStringRef v4 = @"NO";
      if (v3) {
        CFStringRef v4 = @"YES";
      }
      int v6 = 138412290;
      CFStringRef v7 = v4;
      _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "isSMSEnabled %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return IMSMSEnabled();
}

- (BOOL)_localDeviceSupportsSMSAndHasAPhoneNumber
{
  v2 = [(LegacySMSServiceSession *)self _myCTPhoneNumber];
  id v3 = [v2 length];

  if (IMOSLoggingEnabled())
  {
    CFStringRef v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = IMSMSEnabled();
      CFStringRef v6 = @"NO";
      if (v5) {
        CFStringRef v7 = @"YES";
      }
      else {
        CFStringRef v7 = @"NO";
      }
      if (v3) {
        CFStringRef v6 = @"YES";
      }
      int v9 = 138412546;
      CFStringRef v10 = v7;
      __int16 v11 = 2112;
      CFStringRef v12 = v6;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "isSMSEnabled %@ Has valid Phone Number %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return (v3 != 0) & IMSMSEnabled();
}

- (BOOL)_localDeviceSupportsSMSAndDoesNotHaveAPhoneNumberForSIMID:(id)a3
{
  id v4 = a3;
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    int v5 = +[IMCTSubscriptionUtilities sharedInstance];
    CFStringRef v6 = [v5 ctSubscriptionInfo];
    CFStringRef v7 = objc_msgSend(v6, "__im_subscriptionContextForForSimID:", v4);

    if (v7)
    {
      id v8 = [v7 phoneNumber];
      BOOL v9 = [v8 length] == 0;
    }
    else
    {
      BOOL v9 = 0;
    }
  }
  else
  {
    CFStringRef v7 = [(LegacySMSServiceSession *)self _myCTPhoneNumber];
    BOOL v9 = [v7 length] == 0;
  }

  int v10 = IMSMSEnabled();
  if (IMOSLoggingEnabled())
  {
    __int16 v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      CFStringRef v12 = @"NO";
      if (v10) {
        CFStringRef v13 = @"YES";
      }
      else {
        CFStringRef v13 = @"NO";
      }
      if (v9) {
        CFStringRef v12 = @"YES";
      }
      int v15 = 138412546;
      CFStringRef v16 = v13;
      __int16 v17 = 2112;
      CFStringRef v18 = v12;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "isSMSEnabled %@ Does not have phone number to send with %@", (uint8_t *)&v15, 0x16u);
    }
  }
  return v10 & v9;
}

- (BOOL)_localDeviceSupportsRelay
{
  v2 = +[FTDeviceSupport sharedInstance];
  id v3 = (char *)[v2 deviceType];

  if (v3 != (unsigned char *)&dword_0 + 2) {
    return 0;
  }

  return IMSMSEnabled();
}

- (void)_forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6
{
}

- (void)_forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6 watchOnly:(BOOL)a7
{
}

- (void)_forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6 hasAttachment:(BOOL)a7 watchOnly:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  if (IMOSLoggingEnabled())
  {
    __int16 v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Adding reflect only key and forwarding message to peers", buf, 2u);
    }
  }
  if ([(LegacySMSServiceSession *)self isSMSRelayEnabled])
  {
    BOOL v56 = v8;
    CFStringRef v18 = (__CFDictionary *)[objc_alloc((Class)NSMutableDictionary) initWithDictionary:v14];
    CFDictionarySetValue(v18, off_998C8, &__kCFBooleanTrue);
    long long v59 = v18;
    long long v19 = JWEncodeDictionary();
    int v20 = IMOSLoggingEnabled();
    id v61 = v16;
    id v62 = v14;
    long long v60 = self;
    long long v58 = v19;
    BOOL v54 = v9;
    if (v9)
    {
      if (v20)
      {
        long long v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v69 = 0;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "_forwardMessageToPeers: Not compressing data", v69, 2u);
        }
      }
      id v22 = v19;
    }
    else
    {
      if (v20)
      {
        long long v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v68 = 0;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "_forwardMessageToPeers: Compressing data", v68, 2u);
        }
      }
      id v22 = [v19 _FTCopyGzippedData];
    }
    id v24 = v22;
    uint64_t v25 = IDSSendMessageOptionTopLevelDictionaryKey;
    uint64_t v26 = IDSSendMessageOptionSkipPayloadCheckKey;
    uint64_t v27 = IDSSendMessageOptionEnforceRemoteTimeoutsKey;
    id v63 = v15;
    long long v28 = IDSGetUUIDData();
    uint64_t v29 = IDSSendMessageOptionUUIDKey;
    int64_t v55 = a4;
    __int16 v30 = +[NSNumber numberWithInteger:a4];
    uint64_t v31 = IDSSendMessageOptionCommandKey;
    uint64_t v32 = IDSSendMessageOptionDataToEncryptKey;
    CFStringRef v33 = +[NSNumber numberWithBool:v56];
    long long v57 = v24;
    __int16 v34 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:v25, &__kCFBooleanTrue, v26, &__kCFBooleanFalse, v27, v28, v29, v30, v31, v24, v32, v33, @"_SMSServiceRelayToWatchOnly", 0];

    CFStringRef v35 = [(LegacySMSServiceSession *)v60 _myCTPhoneNumber];
    id v16 = v61;
    [(LegacySMSServiceSession *)v60 sendDataToPeers:v34 forcedCallerID:v35 shouldFilterRecepients:1 requestProxySend:0 dontSendTo:v61];

    uint64_t v36 = [(LegacySMSServiceSession *)v60 localDevice];
    if (v36)
    {
      CFStringRef v37 = (void *)v36;
      unsigned __int8 v38 = [(LegacySMSServiceSession *)v60 isLocalDeviceProxyRegistered];

      if ((v38 & 1) == 0)
      {
        v39 = +[NSDictionary dictionaryWithObjectsAndKeys:v59, @"outgoing-message", v63, @"message-guid", 0];
        v40 = JWEncodeDictionary();
        int v41 = IMOSLoggingEnabled();
        if (v54)
        {
          if (v41)
          {
            signed int v42 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long v67 = 0;
              _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "local _forwardMessageToPeers: Not compressing data", v67, 2u);
            }
          }
          unint64_t v43 = v40;
          id v44 = v40;
        }
        else
        {
          if (v41)
          {
            uint64_t v45 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long v66 = 0;
              _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "local _forwardMessageToPeers: Compressing data", v66, 2u);
            }
          }
          unint64_t v43 = v40;
          id v44 = [v40 _FTCopyGzippedData];
        }
        uint64_t v46 = v44;
        v47 = +[NSNumber numberWithInteger:v55];
        id v48 = (uint64_t *)[v47 integerValue];

        int v49 = IMOSLoggingEnabled();
        if (v48 == &stru_68.size)
        {
          if (v49)
          {
            id v50 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long v65 = 0;
              _os_log_impl(&dword_0, v50, OS_LOG_TYPE_INFO, "Sending local outgoing download message", v65, 2u);
            }
          }
          CFStringRef v51 = @"local-outgoing-download-message";
        }
        else
        {
          if (v49)
          {
            long long v52 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)long long v64 = 0;
              _os_log_impl(&dword_0, v52, OS_LOG_TYPE_INFO, "Sending local outgoing plain text message", v64, 2u);
            }
          }
          CFStringRef v51 = @"local-outgoing-message";
        }
        long long v53 = +[NSDictionary dictionaryWithObjectsAndKeys:v46, @"dict", v51, @"local-type", 0];
        [(LegacySMSServiceSession *)v60 sendToLocalPeers:v53];
      }
    }

    id v14 = v62;
    id v15 = v63;
  }
}

- (BOOL)relayDictionaryToPeers:(id)a3 requiresUpload:(BOOL)a4
{
  BOOL v74 = a4;
  CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      CFStringRef v5 = @"NO";
      if (v74) {
        CFStringRef v5 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      BOOL v96 = (void *)v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Trying to relay dictionary to peers, requiresUpload: %@", buf, 0xCu);
    }
  }
  if ([(LegacySMSServiceSession *)self _hasPeerDevices])
  {
    CFStringRef v6 = [(LegacySMSServiceSession *)self _allowedDevicesforSMSRelay];
    BOOL v7 = [v6 count] == 0;

    if (v7)
    {
      if (IMOSLoggingEnabled())
      {
        long long v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, " => Not sending data for received message, we have no devices on the allowed list", buf, 2u);
        }
        goto LABEL_38;
      }
    }
    else
    {
      if ([(LegacySMSServiceSession *)self isSMSRelayEnabled])
      {
        BOOL v8 = +[IDSCTAdapter sharedInstance];
        BOOL v9 = [(__CFDictionary *)theDict objectForKey:LegacySMSCTMessageDictionarySenderKey];
        unsigned int v10 = [v8 isPhoneNumberEmergencyNumber:v9];

        if (v10)
        {
          long long v91 = 0u;
          long long v92 = 0u;
          long long v89 = 0u;
          long long v90 = 0u;
          __int16 v11 = [(IDSService *)self->_relayService devices];
          id v12 = [v11 countByEnumeratingWithState:&v89 objects:v100 count:16];
          if (v12)
          {
            uint64_t v13 = *(void *)v90;
            while (2)
            {
              for (i = 0; i != v12; i = (char *)i + 1)
              {
                if (*(void *)v90 != v13) {
                  objc_enumerationMutation(v11);
                }
                id v15 = *(void **)(*((void *)&v89 + 1) + 8 * i);
                v99 = v15;
                id v16 = +[NSArray arrayWithObjects:&v99 count:1];
                unsigned int v17 = [(LegacySMSServiceSession *)self _isConnectedOverBT:v16];

                int v18 = IMOSLoggingEnabled();
                if (v17)
                {
                  if (v18)
                  {
                    id v22 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412546;
                      BOOL v96 = v15;
                      __int16 v97 = 2112;
                      CFStringRef v98 = @"YES";
                      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "This message is from an emergency number, but we have a Watch connected over BT %@, relaying message %@", buf, 0x16u);
                    }
                  }
                  goto LABEL_44;
                }
                if (v18)
                {
                  long long v19 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    BOOL v96 = v15;
                    _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "This message is from an emergency number, not relaying to peer %@", buf, 0xCu);
                  }
                }
              }
              id v12 = [v11 countByEnumeratingWithState:&v89 objects:v100 count:16];
              if (v12) {
                continue;
              }
              break;
            }
          }

          if (IMOSLoggingEnabled())
          {
            int v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "No watch paired connected over Bluetooth, skipping relaying emergency SMS", buf, 2u);
            }
          }
          goto LABEL_102;
        }
LABEL_44:
        if (!IMSharedHelperDeviceHasMultipleSubscriptions())
        {
LABEL_67:
          if (IMOSLoggingEnabled())
          {
            CFStringRef v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              __int16 v34 = [(__CFDictionary *)theDict objectForKey:off_997F0];
              *(_DWORD *)buf = 138412290;
              BOOL v96 = v34;
              _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Recipients: %@", buf, 0xCu);
            }
          }
          long long v83 = 0u;
          long long v84 = 0u;
          long long v81 = 0u;
          long long v82 = 0u;
          CFStringRef v35 = [(__CFDictionary *)theDict objectForKey:off_997F0];
          id v36 = [v35 countByEnumeratingWithState:&v81 objects:v93 count:16];
          if (v36)
          {
            uint64_t v37 = *(void *)v82;
            while (2)
            {
              for (j = 0; j != v36; j = (char *)j + 1)
              {
                if (*(void *)v82 != v37) {
                  objc_enumerationMutation(v35);
                }
                v39 = *(void **)(*((void *)&v81 + 1) + 8 * (void)j);
                if (IMOSLoggingEnabled())
                {
                  v40 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    BOOL v96 = v39;
                    _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "  Recipient: %@", buf, 0xCu);
                  }
                }
                int v41 = +[IDSCTAdapter sharedInstance];
                unsigned int v42 = [v41 isPhoneNumberEmergencyNumber:v39];

                if (v42)
                {
                  if (IMOSLoggingEnabled())
                  {
                    int64_t v55 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
                    {
                      *(_WORD *)buf = 0;
                      _os_log_impl(&dword_0, v55, OS_LOG_TYPE_INFO, "One of the recipients was an emergency number, this message should not be relayed", buf, 2u);
                    }
                  }
                  goto LABEL_102;
                }
              }
              id v36 = [v35 countByEnumeratingWithState:&v81 objects:v93 count:16];
              if (v36) {
                continue;
              }
              break;
            }
          }

          if (IMOSLoggingEnabled())
          {
            unint64_t v43 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v43, OS_LOG_TYPE_INFO, " Going to forward our received Message onto our other peers", buf, 2u);
            }
          }
          id v44 = objc_alloc_init((Class)NSMutableDictionary);
          uint64_t v45 = v44;
          if (v74)
          {
            uint64_t v46 = +[NSFileManager defaultManager];
            v47 = objc_msgSend(v46, "im_randomTemporaryFileURLWithFileName:", off_99998);
            id v48 = [v47 path];

            [(__CFDictionary *)theDict writeToFile:v48 atomically:1];
            if (IMOSLoggingEnabled())
            {
              int v49 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                BOOL v96 = v48;
                _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "Saved File to Path %@", buf, 0xCu);
              }
            }
            if (IMOSLoggingEnabled())
            {
              id v50 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_0, v50, OS_LOG_TYPE_INFO, "Starting Upload to MMCS Now", buf, 2u);
              }
            }
            CFStringRef v51 = +[IMTransferServicesController sharedInstance];
            uint64_t v52 = IDSServiceNameSMSRelay;
            v77[0] = _NSConcreteStackBlock;
            v77[1] = 3221225472;
            v77[2] = sub_2A588;
            v77[3] = &unk_8D7C8;
            id v78 = v45;
            v79 = theDict;
            v80 = self;
            [v51 sendFilePath:v48 topic:v52 userInfo:0 transferID:v48 encryptFile:1 progressBlock:0 completionBlock:v77];

            BOOL v53 = 0;
            id v54 = v78;
          }
          else
          {
            [v44 addEntriesFromDictionary:theDict];
            id v48 = JWEncodeDictionary();
            id v54 = [v48 _FTCopyGzippedData];
            long long v57 = +[NSNumber numberWithInteger:140];
            long long v58 = [(__CFDictionary *)theDict objectForKey:LegacySMSCTMessageDictionaryGUIDKey];
            long long v59 = IDSGetUUIDData();
            long long v60 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
            id v61 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v57, IDSSendMessageOptionCommandKey, v59, IDSSendMessageOptionUUIDKey, v54, IDSSendMessageOptionDataToEncryptKey, v60, IDSSendMessageOptionTimeoutKey, 0);

            id v62 = [(LegacySMSServiceSession *)self _myCTPhoneNumber];
            BOOL v53 = [(LegacySMSServiceSession *)self sendDataToPeers:v61 forcedCallerID:v62 shouldFilterRecepients:1 requestProxySend:0 dontSendTo:0];
          }
          if (IMOSLoggingEnabled())
          {
            id v63 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v63, OS_LOG_TYPE_INFO))
            {
              CFStringRef v64 = @"NO";
              if (v74) {
                CFStringRef v64 = @"YES";
              }
              *(_DWORD *)buf = 138412290;
              BOOL v96 = (void *)v64;
              _os_log_impl(&dword_0, v63, OS_LOG_TYPE_INFO, "Relaying to local device, requiresUpload %@", buf, 0xCu);
            }
          }
          long long v65 = [(LegacySMSServiceSession *)self localDevice];
          long long v66 = v65;
          if (v74)
          {

            if (!v66)
            {
LABEL_122:

              goto LABEL_103;
            }
            if (IMOSLoggingEnabled())
            {
              long long v67 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v67, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                BOOL v96 = theDict;
                _os_log_impl(&dword_0, v67, OS_LOG_TYPE_INFO, "Relaying dict containing MMS to local device. %@ ", buf, 0xCu);
              }
            }
            v68 = +[NSDictionary dictionaryWithObjectsAndKeys:theDict, @"incomming-message", 0];
            v69 = JWEncodeDictionary();
            id v70 = [v69 _FTCopyGzippedData];
            uint64_t v71 = +[NSDictionary dictionaryWithObjectsAndKeys:v70, @"dict", @"local-incoming-download-message", @"local-type", 0];
          }
          else
          {
            if (!v65) {
              goto LABEL_122;
            }
            unsigned __int8 v72 = [(LegacySMSServiceSession *)self isLocalDeviceProxyRegistered];

            if (v72) {
              goto LABEL_122;
            }
            v68 = +[NSDictionary dictionaryWithObjectsAndKeys:theDict, @"incomming-message", 0];
            v69 = JWEncodeDictionary();
            id v70 = [v69 _FTCopyGzippedData];
            uint64_t v71 = +[NSDictionary dictionaryWithObjectsAndKeys:v70, @"dict", @"local-incomming-message", @"local-type", 0];
          }
          id v73 = (void *)v71;
          [(LegacySMSServiceSession *)self sendToLocalPeers:v71];

          goto LABEL_122;
        }
        long long v23 = [(__CFDictionary *)theDict _stringForKey:off_99820];
        id v24 = +[IMCTSubscriptionUtilities sharedInstance];
        uint64_t v25 = [v24 registeredSIMIDs];

        long long v87 = 0u;
        long long v88 = 0u;
        long long v86 = 0u;
        long long v85 = 0u;
        uint64_t v26 = v25;
        id v27 = [(__CFString *)v26 countByEnumeratingWithState:&v85 objects:v94 count:16];
        if (v27)
        {
          char v28 = 0;
          uint64_t v29 = *(void *)v86;
          do
          {
            for (k = 0; k != v27; k = (char *)k + 1)
            {
              if (*(void *)v86 != v29) {
                objc_enumerationMutation(v26);
              }
              if ([v23 isEqualToString:*(void *)(*((void *)&v85 + 1) + 8 * (void)k)])
              {
                if (IMOSLoggingEnabled())
                {
                  uint64_t v31 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412546;
                    BOOL v96 = v23;
                    __int16 v97 = 2112;
                    CFStringRef v98 = v26;
                    _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Setting iMessageCapability to LegacyiMessageCapabilityAble on relay dict because message received on simID %@ is one of the registered simIDs %@", buf, 0x16u);
                  }
                }
                CFDictionarySetValue(theDict, off_998B0, &off_90D38);
                char v28 = 1;
              }
            }
            id v27 = [(__CFString *)v26 countByEnumeratingWithState:&v85 objects:v94 count:16];
          }
          while (v27);

          if (v28) {
            goto LABEL_66;
          }
        }
        else
        {
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v32 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            BOOL v96 = v23;
            __int16 v97 = 2112;
            CFStringRef v98 = v26;
            _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "Setting iMessageCapability to LegacyiMessageCapabilityUnable on relay dict because message received on simID %@ isn't one of the registered simIDs %@", buf, 0x16u);
          }
        }
        CFDictionarySetValue(theDict, off_998B0, &off_90D50);
LABEL_66:

        goto LABEL_67;
      }
      if (IMOSLoggingEnabled())
      {
        long long v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, " => Not sending data for received message, smsRelay not enabled", buf, 2u);
        }
LABEL_38:
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    long long v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, " => Not sending data for received message, we have no peer devices", buf, 2u);
    }
    goto LABEL_38;
  }
LABEL_102:
  BOOL v53 = 0;
LABEL_103:

  return v53;
}

- (void)_micEnabledStateDidChange:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    CFStringRef v5 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)CFStringRef v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "MIC State has changed, checking next steps for SMS Relay", v6, 2u);
    }
  }
  [(LegacySMSServiceSession *)self enrollSelfDeviceInSMSRelay];
}

- (void)_migrateSMSRelayForMICIfNeeded
{
  if ((IMGetDomainBoolForKey() & 1) == 0)
  {
    IMSetDomainBoolForKey();
    IMSyncronizeAppPreferences();
    id v3 = +[IMDCKUtilities sharedInstance];
    unsigned int v4 = [v3 cloudKitSyncingEnabled];

    if (v4)
    {
      [(LegacySMSServiceSession *)self enrollSelfDeviceInSMSRelay];
    }
  }
}

- (BOOL)_areiMessageAndiCloudAccountTheSame:(id)a3
{
  id v4 = a3;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  CFStringRef v5 = [(IDSService *)self->_relayService accounts];
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v16;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v16 != v7) {
          objc_enumerationMutation(v5);
        }
        BOOL v9 = *(void **)(*((void *)&v15 + 1) + 8 * i);
        if ([v9 accountType] == 1 && objc_msgSend(v9, "isActive"))
        {
          unsigned int v10 = [v9 profileID];
          __int16 v11 = +[NSString stringWithFormat:@"D:%@", v4];
          if (IMOSLoggingEnabled())
          {
            id v12 = OSLogHandleForIMEventCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              int v20 = v11;
              __int16 v21 = 2112;
              id v22 = v10;
              _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "iCloud DSID is %@, imessage DSID is %@", buf, 0x16u);
            }
          }
          unsigned __int8 v13 = [v10 isEqualToString:v11];

          if (v13)
          {
            LOBYTE(v6) = 1;
            goto LABEL_17;
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v15 objects:v23 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_17:

  return (char)v6;
}

- (BOOL)_isDeviceATrustedHSA2Device:(id)a3
{
  return 1;
}

- (void)_enableSMSRelayForDevice:(id)a3
{
  id v4 = a3;
  CFStringRef v5 = IMGetCachedDomainValueForKey();
  id v6 = +[NSMutableArray arrayWithArray:v5];
  uint64_t v7 = [v4 uniqueID];
  if (![(LegacySMSServiceSession *)self _isDeviceATrustedHSA2Device:v4])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_16;
    }
    BOOL v8 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v4;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Device is not on HSA2 trusted list, not approving it for SMS relay %@", (uint8_t *)&v10, 0xCu);
    }
    goto LABEL_6;
  }
  if ([(LegacySMSServiceSession *)self isIDInList:v7 ArrayToCheck:v5])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v8 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "(HSA2 Trusted) Already added device to paired list once %@", (uint8_t *)&v10, 0xCu);
      }
LABEL_6:
    }
  }
  else
  {
    [(LegacySMSServiceSession *)self _addDeviceToAllowedSMSRelay:v4 shouldSendApproval:1];
    if (IMOSLoggingEnabled())
    {
      BOOL v9 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "(HSA2 Trusted) Added to paired list %@", (uint8_t *)&v10, 0xCu);
      }
    }
    [v6 addObject:v7];
    IMSetDomainValueForKey();
    IMSyncronizeAppPreferences();
  }
LABEL_16:
}

- (void)_shouldAutoEnableDevicesforSMSRelay:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    CFStringRef v5 = +[IMDCKUtilities sharedInstance];
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_2AFA4;
    v6[3] = &unk_8D818;
    v6[4] = self;
    id v7 = v4;
    [v5 fetchCloudKitAccountStatusWithCompletion:v6];
  }
}

- (void)_addHSA2PairedDevicesToAllowedSMSRelayList
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Trying to add HSA2 paired devices to allowed list", buf, 2u);
    }
  }
  v4[0] = _NSConcreteStackBlock;
  v4[1] = 3221225472;
  v4[2] = sub_2B26C;
  v4[3] = &unk_8D840;
  v4[4] = self;
  [(LegacySMSServiceSession *)self _shouldAutoEnableDevicesforSMSRelay:v4];
}

- (id)_IDSService
{
  [(LegacySMSServiceSession *)self _checkAndSetRelayService];
  relayService = self->_relayService;

  return relayService;
}

- (BOOL)accountHasAlias:(id)a3 aliastoCheck:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v5;
      __int16 v25 = 2112;
      id v26 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, " Checking if Account %@ has alias %@ ", buf, 0x16u);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v17 = v5;
  BOOL v8 = objc_msgSend(v5, "im_registeredURIs");
  id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (i = 0; i != v9; i = (char *)i + 1)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        id v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          unsigned __int8 v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v24 = v6;
            __int16 v25 = 2112;
            id v26 = v12;
            _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, " comparing alias %@ and alias %@ ", buf, 0x16u);
          }
        }
        if ([v6 isEqualToIgnoringCase:v12])
        {
          if (IMOSLoggingEnabled())
          {
            long long v15 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v24 = v12;
              _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, " Positive match on alias %@ ", buf, 0xCu);
            }
          }
          BOOL v14 = 1;
          goto LABEL_23;
        }
      }
      id v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
      if (v9) {
        continue;
      }
      break;
    }
  }
  BOOL v14 = 0;
LABEL_23:

  return v14;
}

- (id)accountForAlias:(id)a3 fromAccounts:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = v7;
  if (v6)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v11; i = (char *)i + 1)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (-[LegacySMSServiceSession accountHasAlias:aliastoCheck:](self, "accountHasAlias:aliastoCheck:", v14, v6, (void)v17)&& [v14 canSend])
          {
            id v15 = v14;
            goto LABEL_14;
          }
        }
        id v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v11) {
          continue;
        }
        break;
      }
    }
    id v15 = 0;
LABEL_14:
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)phoneAliasForDominentPhoneAlias:(id)a3 registeredPhoneNumber:(id)a4 preferedCallerID:(id)a5 CTPhoneNumber:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([v12 length])
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v28 = 138412290;
        id v29 = v12;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, " We have a prefered Alias %@", (uint8_t *)&v28, 0xCu);
      }
    }
    if ([v12 _appearsToBePhoneNumber]
      && [(LegacySMSServiceSession *)self _isAliasActiveForSMSRelay:v12])
    {
      int v15 = IMOSLoggingEnabled();
      long long v16 = v12;
      if (v15)
      {
        long long v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v28 = 138412290;
          id v29 = v12;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, " This alias appears to be a phone number, we will send to that destination %@", (uint8_t *)&v28, 0xCu);
        }

        long long v16 = v12;
      }
      goto LABEL_33;
    }
    unsigned int v18 = [(LegacySMSServiceSession *)self _localDeviceSupportsSMS];
    int v19 = IMOSLoggingEnabled();
    if (v18)
    {
      long long v16 = v13;
      if (!v19) {
        goto LABEL_33;
      }
      long long v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v28 = 138412290;
        id v29 = v13;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, " This prefered alias is not a phone number, but we outselves support SMS, So we sent this one out using %@ instead", (uint8_t *)&v28, 0xCu);
      }
LABEL_24:

      long long v16 = v13;
      goto LABEL_33;
    }
    long long v16 = v10;
    if (!v19) {
      goto LABEL_33;
    }
    long long v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v10;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, " This prefered alias is not a phone number, using %@ instead", (uint8_t *)&v28, 0xCu);
    }
    goto LABEL_32;
  }
  if (![(LegacySMSServiceSession *)self _localDeviceSupportsSMS]
    || ![v11 length]
    || [v10 length])
  {
    unsigned int v21 = [(LegacySMSServiceSession *)self _localDeviceSupportsSMS];
    int v22 = IMOSLoggingEnabled();
    if (v21)
    {
      long long v16 = v13;
      if (!v22) {
        goto LABEL_33;
      }
      long long v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v28 = 138412290;
        id v29 = v13;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, " This prefered alias is not a phone number, but we outselves support SMS, So we sent this one out using %@ instead", (uint8_t *)&v28, 0xCu);
      }
      goto LABEL_24;
    }
    long long v16 = v10;
    if (!v22) {
      goto LABEL_33;
    }
    long long v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, " We have no prefered alias, we are going to use the dominant phone number one", (uint8_t *)&v28, 2u);
    }
LABEL_32:

    long long v16 = v10;
    goto LABEL_33;
  }
  int v26 = IMOSLoggingEnabled();
  long long v16 = v11;
  if (v26)
  {
    id v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v11;
      _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, " This prefered alias is not the IDS registered number, and we support SMS, So we sent this one out using %@ instead", (uint8_t *)&v28, 0xCu);
    }

    long long v16 = v11;
  }
LABEL_33:
  id v24 = v16;

  return v24;
}

- (id)retrievePhoneAccountAndPhoneAliasFromIDSAccounts:(id)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v23 objects:v32 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v24;
LABEL_3:
    uint64_t v6 = 0;
    while (1)
    {
      if (*(void *)v24 != v5) {
        objc_enumerationMutation(v3);
      }
      id v7 = *(void **)(*((void *)&v23 + 1) + 8 * v6);
      if (![v7 accountType]) {
        break;
      }
      if (v4 == (id)++v6)
      {
        id v4 = [v3 countByEnumeratingWithState:&v23 objects:v32 count:16];
        if (v4) {
          goto LABEL_3;
        }
        goto LABEL_19;
      }
    }
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    BOOL v8 = objc_msgSend(v7, "im_registeredURIs", 0);
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
    if (!v9)
    {
LABEL_18:

      goto LABEL_19;
    }
    uint64_t v10 = *(void *)v20;
LABEL_12:
    uint64_t v11 = 0;
    while (1)
    {
      if (*(void *)v20 != v10) {
        objc_enumerationMutation(v8);
      }
      id v12 = *(void **)(*((void *)&v19 + 1) + 8 * v11);
      if ([v12 _appearsToBePhoneNumber]) {
        break;
      }
      if (v9 == (id)++v11)
      {
        id v9 = [v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
        if (v9) {
          goto LABEL_12;
        }
        goto LABEL_18;
      }
    }
    id v15 = v7;
    id v13 = v12;

    if (!v15) {
      goto LABEL_20;
    }
    if (IMOSLoggingEnabled())
    {
      unsigned int v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v28 = v15;
        __int16 v29 = 2112;
        id v30 = v13;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, " Found IDS account %@ with phone number %@", buf, 0x16u);
      }
    }
  }
  else
  {
LABEL_19:

    id v13 = 0;
LABEL_20:
    if (IMOSLoggingEnabled())
    {
      BOOL v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, " Unable to find IDS phone number account", buf, 2u);
      }
    }
    id v15 = 0;
  }
  id v16 = [objc_alloc((Class)IMPair) initWithFirst:v15 second:v13];

  return v16;
}

- (id)retrieveAccountAndPhoneAliasForAccounts:(id)a3 shouldFilterRecepients:(BOOL)a4 requestProxySend:(BOOL)a5 preferredCallerID:(id)a6
{
  BOOL v41 = a5;
  BOOL v42 = a4;
  BOOL v8 = (__CFString *)a3;
  id v9 = (__CFString *)a6;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      CFStringRef v11 = @"NO";
      if (v42) {
        CFStringRef v12 = @"YES";
      }
      else {
        CFStringRef v12 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      CFStringRef v51 = v12;
      __int16 v52 = 2112;
      if (v41) {
        CFStringRef v11 = @"YES";
      }
      CFStringRef v53 = v11;
      __int16 v54 = 2112;
      int64_t v55 = v8;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "finding account and phoneAlias shouldFilterRecipients: %@ requestProxySend: %@ for accounts %@", buf, 0x20u);
    }
  }
  id v44 = [(LegacySMSServiceSession *)self _dominentPhoneNumberAlias];
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v51 = v44;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "dominentPhoneAlias is this: %@", buf, 0xCu);
    }
  }
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    BOOL v14 = +[IMCTSubscriptionUtilities sharedInstance];
    id v15 = [v14 registeredPhoneNumbers];

    if (IMOSLoggingEnabled())
    {
      id v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v51 = v15;
        _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "IDS registered phone numbers are %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v15 = 0;
  }
  unint64_t v43 = [(LegacySMSServiceSession *)self _myCTPhoneNumber];
  long long v17 = [(LegacySMSServiceSession *)self _callerIDForRelay];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  unsigned int v18 = v15;
  long long v19 = 0;
  id v20 = [(__CFString *)v18 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v46;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v46 != v21) {
          objc_enumerationMutation(v18);
        }
        if (([*(id *)(*((void *)&v45 + 1) + 8 * i) isEqualToString:v17] & 1) == 0)
        {
          uint64_t v23 = IMNormalizePhoneNumber();

          long long v19 = (void *)v23;
        }
      }
      id v20 = [(__CFString *)v18 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v20);
  }

  long long v24 = [(LegacySMSServiceSession *)self phoneAliasForDominentPhoneAlias:v44 registeredPhoneNumber:v19 preferedCallerID:v17 CTPhoneNumber:v43];
  if (IMOSLoggingEnabled())
  {
    long long v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v51 = v8;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, " Found Accounts %@ for SMS Relay Service ", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v51 = v24;
      _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, " Ensuring that the account picked matches the callerID %@", buf, 0xCu);
    }
  }
  id v27 = [(LegacySMSServiceSession *)self accountForAlias:v24 fromAccounts:v8];
  if (IMOSLoggingEnabled())
  {
    id v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v51 = v27;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, " Going to use account %@ For sending this message", buf, 0xCu);
    }
  }
  if (v9 && [(__CFString *)v9 _appearsToBePhoneNumber])
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v51 = v9;
        _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, " We have a phone alias override, looking for new account that matches callerID %@", buf, 0xCu);
      }
    }
    id v30 = [(LegacySMSServiceSession *)self accountForAlias:v9 fromAccounts:v8];
    if (v30)
    {
      uint64_t v31 = v9;

      uint64_t v32 = v30;
      if (IMOSLoggingEnabled())
      {
        CFStringRef v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v51 = v32;
          _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, " Updating sending account, Now Going to use account %@ For sending this message", buf, 0xCu);
        }
      }
    }
    else
    {
      uint64_t v31 = v24;
      uint64_t v32 = v27;
    }

    if (v32)
    {
LABEL_64:
      if (v32)
      {
        id v35 = [objc_alloc((Class)IMPair) initWithFirst:v32 second:v31];
        goto LABEL_76;
      }
      goto LABEL_66;
    }
  }
  else
  {
    uint64_t v31 = v24;
    uint64_t v32 = v27;
    if (v27) {
      goto LABEL_64;
    }
  }
  if (!v42 || v41) {
    goto LABEL_64;
  }
  if (![(LegacySMSServiceSession *)self _localDeviceSupportsSMS])
  {
LABEL_66:
    if (IMOSLoggingEnabled())
    {
      id v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        CFStringRef v37 = @"NO";
        if (v42) {
          CFStringRef v38 = @"YES";
        }
        else {
          CFStringRef v38 = @"NO";
        }
        if (v41) {
          CFStringRef v37 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v51 = v38;
        __int16 v52 = 2112;
        CFStringRef v53 = v37;
        _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "Account is nil but not finding new account based on phone number IDS account based on parameters shouldFilter %@ requestProxy %@", buf, 0x16u);
      }
    }
    id v35 = [objc_alloc((Class)IMPair) initWithFirst:0 second:v31];
    goto LABEL_76;
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, " Account is nil, getting phone account from IDS", buf, 2u);
    }
  }
  id v35 = [(LegacySMSServiceSession *)self retrievePhoneAccountAndPhoneAliasFromIDSAccounts:v8];
LABEL_76:
  v39 = v35;

  return v39;
}

- (BOOL)sendDataToPeers:(id)a3 forcedCallerID:(id)a4 shouldFilterRecepients:(BOOL)a5 requestProxySend:(BOOL)a6 dontSendTo:(id)a7
{
  BOOL v8 = a6;
  BOOL v9 = a5;
  CFStringRef v12 = (__CFDictionary *)a3;
  id v79 = a4;
  id v83 = a7;
  if ([(LegacySMSServiceSession *)self _hasPeerDevices])
  {
    v77 = [(IDSService *)self->_relayService accounts];
    id v76 = [(LegacySMSServiceSession *)self retrieveAccountAndPhoneAliasForAccounts:v77 shouldFilterRecepients:v9 requestProxySend:v8 preferredCallerID:v79];
    id v78 = [v76 first];
    long long v81 = [v76 second];
    id v13 = [(__CFDictionary *)v12 objectForKeyedSubscript:@"_SMSServiceRelayToWatchOnly"];
    unsigned int v14 = [v13 BOOLValue];

    if (!v78 || ![v81 length])
    {
      if (IMOSLoggingEnabled())
      {
        long long v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, " => No account available for sending With Phone number alias, failing", buf, 2u);
        }
      }
      BOOL v18 = 0;
      v75 = v12;
      goto LABEL_90;
    }
    Mutable = (__CFDictionary *)[(__CFDictionary *)v12 mutableCopy];
    if (!Mutable) {
      Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    id v16 = (void *)IDSCopyIDForPhoneNumber();
    if (v16)
    {
      CFDictionarySetValue(Mutable, IDSSendMessageOptionFromIDKey, v16);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_5EE38();
    }

    v75 = Mutable;
    IMGreenTeaMessageTransmitLog();
    if (v8)
    {
      uint64_t v20 = [(LegacySMSServiceSession *)self _deviceForCallerID:v81];
      id obj = (id)v20;
      uint64_t v21 = (void *)v20;
      if (v20) {
        unsigned int v22 = v14;
      }
      else {
        unsigned int v22 = 0;
      }
      if (v22 == 1)
      {
        uint64_t v112 = v20;
        uint64_t v23 = +[NSArray arrayWithObjects:&v112 count:1];
        unsigned __int8 v24 = [(LegacySMSServiceSession *)self _isConnectedOverBT:v23];

        uint64_t v21 = obj;
        if ((v24 & 1) == 0)
        {
LABEL_26:
          id v25 = 0;
          id v26 = 0;
          unsigned int v27 = 0;
LABEL_83:

          if (IMOSLoggingEnabled())
          {
            unsigned __int8 v72 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
            {
              CFStringRef v73 = @"YES";
              *(_DWORD *)buf = 138413314;
              id v99 = v81;
              if (!v27) {
                CFStringRef v73 = @"NO";
              }
              __int16 v100 = 2112;
              CFStringRef v101 = v73;
              __int16 v102 = 2112;
              id v103 = v26;
              __int16 v104 = 2112;
              v105 = v78;
              __int16 v106 = 2112;
              id v107 = v25;
              _os_log_impl(&dword_0, v72, OS_LOG_TYPE_INFO, "SMS relay data sent to: %@   success: %@   error: %@   account: %@  identifier %@", buf, 0x34u);
            }
          }
          BOOL v18 = v27 != 0;
LABEL_90:

          CFStringRef v12 = v75;
          goto LABEL_91;
        }
      }
      else if (!v20)
      {
        goto LABEL_26;
      }
      id v30 = [(LegacySMSServiceSession *)self _destinationForDevice:v21 forcedIdentity:v81];
      [(LegacySMSServiceSession *)self _checkAndSetRelayService];
      relayService = self->_relayService;
      __int16 v52 = +[NSDictionary dictionary];
      id v70 = IMSingleObjectArray();
      uint64_t v71 = objc_msgSend(v70, "__imSetFromArray");
      id v96 = 0;
      id v97 = 0;
      unsigned int v27 = +[IMIDSService service:relayService sendMessage:v52 fromAccount:v78 toDestinations:v71 priority:300 options:v75 identifier:&v97 error:&v96];
      id v25 = v97;
      id v26 = v96;

LABEL_82:
      uint64_t v21 = obj;
      goto LABEL_83;
    }
    if (!v9)
    {
      id obj = objc_alloc_init((Class)NSMutableArray);
      long long v88 = 0u;
      long long v89 = 0u;
      long long v86 = 0u;
      long long v87 = 0u;
      __int16 v54 = [(IDSService *)self->_relayService devices];
      id v55 = [v54 countByEnumeratingWithState:&v86 objects:v109 count:16];
      if (v55)
      {
        uint64_t v56 = *(void *)v87;
        do
        {
          long long v57 = 0;
          do
          {
            if (*(void *)v87 != v56) {
              objc_enumerationMutation(v54);
            }
            long long v58 = *(void **)(*((void *)&v86 + 1) + 8 * (void)v57);
            if (v14
              && (uint64_t v108 = *(void *)(*((void *)&v86 + 1) + 8 * (void)v57),
                  +[NSArray arrayWithObjects:&v108 count:1],
                  long long v59 = objc_claimAutoreleasedReturnValue(),
                  unsigned __int8 v60 = [(LegacySMSServiceSession *)self _isConnectedOverBT:v59],
                  v59,
                  (v60 & 1) == 0))
            {
              if (IMOSLoggingEnabled())
              {
                long long v65 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v65, OS_LOG_TYPE_INFO))
                {
                  long long v66 = [v58 uniqueID];
                  *(_DWORD *)buf = 138412290;
                  id v99 = v66;
                  _os_log_impl(&dword_0, v65, OS_LOG_TYPE_INFO, " Not Adding %@ to the devices to send this message to, since we only need to relay it to the active watch", buf, 0xCu);
                }
              }
            }
            else
            {
              if (IMOSLoggingEnabled())
              {
                id v61 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                {
                  id v62 = [v58 uniqueID];
                  id v63 = [v58 name];
                  *(_DWORD *)buf = 138412546;
                  id v99 = v62;
                  __int16 v100 = 2112;
                  CFStringRef v101 = v63;
                  _os_log_impl(&dword_0, v61, OS_LOG_TYPE_INFO, " Adding %@ name %@ the devices to send this message to ", buf, 0x16u);
                }
              }
              CFStringRef v64 = [(LegacySMSServiceSession *)self _destinationForDevice:v58 forcedIdentity:v81];
              [obj addObject:v64];
            }
            long long v57 = (char *)v57 + 1;
          }
          while (v55 != v57);
          id v67 = [v54 countByEnumeratingWithState:&v86 objects:v109 count:16];
          id v55 = v67;
        }
        while (v67);
      }

      [(LegacySMSServiceSession *)self _checkAndSetRelayService];
      v68 = self->_relayService;
      id v30 = +[NSDictionary dictionary];
      __int16 v52 = +[NSSet setWithArray:obj];
      id v84 = 0;
      id v85 = 0;
      unsigned int v27 = +[IMIDSService service:v68 sendMessage:v30 fromAccount:v78 toDestinations:v52 priority:300 options:v75 identifier:&v85 error:&v84];
      id v25 = v85;
      id v26 = v84;
      goto LABEL_82;
    }
    id v28 = [(__CFDictionary *)v75 objectForKeyedSubscript:IDSSendMessageOptionCommandKey];
    v80 = (char *)[v28 integerValue];

    __int16 v29 = [(LegacySMSServiceSession *)self _allowedIDSDevicesforSMSRelay];
    id v30 = objc_alloc_init((Class)NSMutableArray);
    long long v94 = 0u;
    long long v95 = 0u;
    long long v92 = 0u;
    long long v93 = 0u;
    id obj = v29;
    id v31 = [obj countByEnumeratingWithState:&v92 objects:v111 count:16];
    if (!v31) {
      goto LABEL_59;
    }
    uint64_t v32 = *(void *)v93;
LABEL_30:
    uint64_t v33 = 0;
    while (1)
    {
      if (*(void *)v93 != v32) {
        objc_enumerationMutation(obj);
      }
      __int16 v34 = *(void **)(*((void *)&v92 + 1) + 8 * v33);
      if (v83)
      {
        id v35 = [v83 uniqueID];
        id v36 = [v34 uniqueID];
        unsigned int v37 = [v35 isEqualToString:v36];

        if (v37)
        {
          if (IMOSLoggingEnabled())
          {
            CFStringRef v38 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
            {
              v39 = [v83 uniqueID];
              *(_DWORD *)buf = 138412290;
              id v99 = v39;
              _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, " Not Adding %@ to the devices to send this message to, They were the original person who sent this message to us in the first place", buf, 0xCu);
            }
          }
          goto LABEL_48;
        }
      }
      if (v14
        && (v110 = v34,
            +[NSArray arrayWithObjects:&v110 count:1],
            v40 = objc_claimAutoreleasedReturnValue(),
            unsigned __int8 v41 = [(LegacySMSServiceSession *)self _isConnectedOverBT:v40],
            v40,
            (v41 & 1) == 0))
      {
        if (IMOSLoggingEnabled())
        {
          long long v46 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            long long v47 = [v34 uniqueID];
            *(_DWORD *)buf = 138412290;
            id v99 = v47;
            _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, " Not Adding %@ to the devices to send this message to, since we only need to relay it to the active watch", buf, 0xCu);
          }
          goto LABEL_53;
        }
      }
      else
      {
        if (v80 != (unsigned char *)&stru_68.addr + 3
          || (+[IMSMSFilterHelper IDSDeviceSupportsIncomingSMSRelayFilteringForDeviceType:](IMSMSFilterHelper, "IDSDeviceSupportsIncomingSMSRelayFilteringForDeviceType:", [v34 deviceType]) & 1) != 0)
        {
          if (IMOSLoggingEnabled())
          {
            BOOL v42 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
            {
              id v43 = [v34 uniqueID];
              id v44 = [v34 name];
              *(_DWORD *)buf = 138412546;
              id v99 = v43;
              __int16 v100 = 2112;
              CFStringRef v101 = v44;
              _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, " Adding %@ name %@ the devices to send this message to ", buf, 0x16u);
            }
          }
          long long v45 = [(LegacySMSServiceSession *)self _destinationForDevice:v34 forcedIdentity:v81];
          [v30 addObject:v45];

          goto LABEL_48;
        }
        if (IMOSLoggingEnabled())
        {
          long long v46 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            id v48 = [v34 uniqueID];
            CFStringRef v49 = (const __CFString *)[v34 deviceType];
            *(_DWORD *)buf = 138412546;
            id v99 = v48;
            __int16 v100 = 2048;
            CFStringRef v101 = v49;
            _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, " Not Adding %@ to the devices to send this message to, since we are sending SMSFilteringSettingMessage and this device type (%ld) is not capable of receiving it", buf, 0x16u);
          }
LABEL_53:
        }
      }
LABEL_48:
      if (v31 == (id)++v33)
      {
        id v50 = [obj countByEnumeratingWithState:&v92 objects:v111 count:16];
        id v31 = v50;
        if (!v50)
        {
LABEL_59:

          [(LegacySMSServiceSession *)self _checkAndSetRelayService];
          CFStringRef v51 = self->_relayService;
          __int16 v52 = +[NSDictionary dictionary];
          CFStringRef v53 = +[NSSet setWithArray:v30];
          id v90 = 0;
          id v91 = 0;
          unsigned int v27 = +[IMIDSService service:v51 sendMessage:v52 fromAccount:v78 toDestinations:v53 priority:300 options:v75 identifier:&v91 error:&v90];
          id v25 = v91;
          id v26 = v90;

          goto LABEL_82;
        }
        goto LABEL_30;
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, " => Not sending data, we have no peer devices", buf, 2u);
    }
  }
  BOOL v18 = 0;
LABEL_91:

  return v18;
}

- (void)_sendMessageToPairedDeviceWithOptions:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[NSSet setWithObject:IDSDefaultPairedDevice];
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  uint64_t v6 = [(IDSService *)self->_relayService accounts];
  id v7 = [v6 countByEnumeratingWithState:&v20 objects:v34 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    while (2)
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        if ([v10 isActive])
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = [v6 countByEnumeratingWithState:&v20 objects:v34 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  relayService = self->_relayService;
  CFStringRef v12 = +[NSDictionary dictionary];
  id v18 = 0;
  id v19 = 0;
  unsigned int v13 = +[IMIDSService service:relayService sendMessage:v12 fromAccount:v7 toDestinations:v5 priority:300 options:v4 identifier:&v19 error:&v18];
  id v14 = v19;
  id v15 = v18;

  if (IMOSLoggingEnabled())
  {
    id v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      CFStringRef v17 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v25 = v5;
      __int16 v26 = 2112;
      if (v13) {
        CFStringRef v17 = @"YES";
      }
      CFStringRef v27 = v17;
      __int16 v28 = 2112;
      id v29 = v7;
      __int16 v30 = 2112;
      id v31 = v15;
      __int16 v32 = 2112;
      id v33 = v14;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "SMS relay data sent to: %@   success: %@ account:%@  error: %@  identifier %@", buf, 0x34u);
    }
  }
}

- (void)_sendMessageToAllSMSRelayDevicesWithOptions:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  long long v30 = 0u;
  long long v31 = 0u;
  long long v32 = 0u;
  long long v33 = 0u;
  uint64_t v6 = [(IDSService *)self->_relayService devices];
  id v7 = (char *)[v6 countByEnumeratingWithState:&v30 objects:v45 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v31;
    do
    {
      for (i = 0; i != v7; ++i)
      {
        if (*(void *)v31 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = (void *)IDSCopyIDForDevice();
        if ([v10 length]) {
          [v5 addObject:v10];
        }
      }
      id v7 = (char *)[v6 countByEnumeratingWithState:&v30 objects:v45 count:16];
    }
    while (v7);
  }

  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  CFStringRef v11 = [(IDSService *)self->_relayService accounts];
  id v12 = [v11 countByEnumeratingWithState:&v26 objects:v44 count:16];
  if (v12)
  {
    uint64_t v13 = *(void *)v27;
    while (2)
    {
      for (j = 0; j != v12; j = (char *)j + 1)
      {
        if (*(void *)v27 != v13) {
          objc_enumerationMutation(v11);
        }
        id v15 = *(void **)(*((void *)&v26 + 1) + 8 * (void)j);
        if ([v15 isActive])
        {
          id v12 = v15;
          goto LABEL_20;
        }
      }
      id v12 = [v11 countByEnumeratingWithState:&v26 objects:v44 count:16];
      if (v12) {
        continue;
      }
      break;
    }
  }
LABEL_20:

  relayService = self->_relayService;
  CFStringRef v17 = +[NSDictionary dictionary];
  id v18 = +[NSSet setWithArray:v5];
  id v24 = 0;
  id v25 = 0;
  unsigned int v19 = +[IMIDSService service:relayService sendMessage:v17 fromAccount:v12 toDestinations:v18 priority:300 options:v4 identifier:&v25 error:&v24];
  id v20 = v25;
  id v21 = v24;

  if (IMOSLoggingEnabled())
  {
    long long v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      CFStringRef v23 = @"NO";
      id v35 = v5;
      __int16 v36 = 2112;
      if (v19) {
        CFStringRef v23 = @"YES";
      }
      CFStringRef v37 = v23;
      __int16 v38 = 2112;
      id v39 = v12;
      __int16 v40 = 2112;
      id v41 = v21;
      __int16 v42 = 2112;
      id v43 = v20;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "SMS relay data sent to: %@   success: %@ account:%@  error: %@  identifier %@", buf, 0x34u);
    }
  }
}

- (id)_destinationForDevice:(id)a3 forcedIdentity:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [a3 pushToken];
  id v7 = objc_msgSend(v6, "__imHexString");

  uint64_t v8 = (void *)IDSCopyIDForPhoneNumber();
  BOOL v9 = +[NSString stringWithFormat:@"self-token:%@/%@", v7, v8];

  return v9;
}

- (BOOL)sendToLocalPeers:(id)a3
{
  return [(LegacySMSServiceSession *)self sendFileToLocalPeers:0 metadata:a3];
}

- (BOOL)sendFileToLocalPeers:(id)a3 metadata:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v29 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Sending message to local device => dictionary: %@", buf, 0xCu);
    }
  }
  BOOL v9 = [(LegacySMSServiceSession *)self localDevice];

  if (v9)
  {
    id v10 = IDSDefaultPairedDevice;
    id v11 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", v10, 0);
    v34[0] = IDSSendMessageOptionLocalDeliveryKey;
    v34[1] = IDSSendMessageOptionEnforceRemoteTimeoutsKey;
    v35[0] = &__kCFBooleanTrue;
    v35[1] = &__kCFBooleanFalse;
    id v12 = +[NSDictionary dictionaryWithObjects:v35 forKeys:v34 count:2];
    [(LegacySMSServiceSession *)self _checkAndSetRelayService];
    if (v6)
    {
      relayService = self->_relayService;
      uint64_t v26 = 0;
      uint64_t v27 = 0;
      unsigned int v14 = [(IDSService *)relayService sendResourceAtURL:v6 metadata:v7 toDestinations:v11 priority:300 options:v12 identifier:&v27 error:&v26];
      id v15 = (id *)&v26;
      id v16 = (id *)&v27;
    }
    else
    {
      id v18 = self->_relayService;
      uint64_t v24 = 0;
      uint64_t v25 = 0;
      unsigned int v14 = +[IMIDSService service:v18 sendMessage:v7 fromAccount:0 toDestinations:v11 priority:300 options:v12 identifier:&v25 error:&v24];
      id v15 = (id *)&v24;
      id v16 = (id *)&v25;
    }
    id v19 = *v16;
    id v20 = *v15;
    if (IMOSLoggingEnabled())
    {
      id v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        CFStringRef v22 = @"NO";
        *(_DWORD *)buf = 138412802;
        id v29 = v20;
        __int16 v30 = 2112;
        if (v14) {
          CFStringRef v22 = @"YES";
        }
        CFStringRef v31 = v22;
        __int16 v32 = 2112;
        id v33 = v19;
        _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Sending message to local account (error %@) success: %@ with Identifier %@", buf, 0x20u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      CFStringRef v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "No Local Device Found, unable to send message", buf, 2u);
      }
    }
    LOBYTE(v14) = 0;
  }

  return v14;
}

- (id)localDevice
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Looking For Local Devices that are nearby", buf, 2u);
    }
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(IDSService *)self->_relayService devices];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 isDefaultPairedDevice] && objc_msgSend(v8, "isConnected"))
        {
          if (IMOSLoggingEnabled())
          {
            id v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v17 = v8;
              _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Found Default paired Device which is nearby %@", buf, 0xCu);
            }
          }
          id v9 = v8;
          goto LABEL_20;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_20:

  return v9;
}

- (id)pairedDevice
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Looking For paired Device", buf, 2u);
    }
  }
  long long v14 = 0u;
  long long v15 = 0u;
  long long v12 = 0u;
  long long v13 = 0u;
  id v4 = [(IDSService *)self->_relayService devices];
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    while (2)
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v8 isDefaultPairedDevice])
        {
          if (IMOSLoggingEnabled())
          {
            id v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v17 = v8;
              _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Found Default paired Device %@", buf, 0xCu);
            }
          }
          id v9 = v8;
          goto LABEL_19;
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
      if (v5) {
        continue;
      }
      break;
    }
  }
  id v9 = 0;
LABEL_19:

  return v9;
}

- (BOOL)hasConnectedLocalDevice
{
  v2 = [(LegacySMSServiceSession *)self localDevice];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isProxyRegistered
{
  BOOL v3 = [(IDSService *)self->_relayService accounts];
  id v4 = [v3 count];

  if ((unint64_t)v4 < 2)
  {
    id v7 = [(IDSService *)self->_relayService accounts];
    uint64_t v8 = [v7 anyObject];

    if (v8)
    {
      if ([v8 accountType] != 2)
      {
        BOOL v6 = 1;
        goto LABEL_15;
      }
      if (IMOSLoggingEnabled())
      {
        id v9 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Found the local account, it is our only account, This means we are NOT proxy resgiered", buf, 2u);
        }
      }
    }
    BOOL v6 = 0;
LABEL_15:

    goto LABEL_16;
  }
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "I Have more than 1 account, I am registered for Proxy Push", buf, 2u);
    }
  }
  BOOL v6 = 1;
LABEL_16:
  long long v26 = 0u;
  long long v27 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  id v10 = [(IDSService *)self->_relayService accounts];
  id v11 = [v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v25;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v25 != v12) {
          objc_enumerationMutation(v10);
        }
        long long v14 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        if ([v14 accountType] == 1)
        {
          if (IMOSLoggingEnabled())
          {
            id v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Found the AppleID account", buf, 2u);
            }
          }
          id v15 = v14;

          if (v15)
          {
            if (([v15 isActive] & 1) == 0)
            {
              if (IMOSLoggingEnabled())
              {
                CFStringRef v17 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "The AppleID account is NOT active", buf, 2u);
                }
              }
              BOOL v6 = 0;
            }
            id v18 = objc_msgSend(v15, "im_registeredURIs");
            BOOL v19 = [v18 count] == 0;

            if (v19)
            {
              if (IMOSLoggingEnabled())
              {
                id v20 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "The AppleID Account has no usable alias's", buf, 2u);
                }
              }
              BOOL v6 = 0;
            }
          }
          goto LABEL_42;
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v24 objects:v30 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  id v15 = 0;
LABEL_42:
  if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      CFStringRef v22 = @"NO";
      if (v6) {
        CFStringRef v22 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v29 = v22;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Result of check if myself is proxy registered is %@", buf, 0xCu);
    }
  }
  return v6;
}

- (BOOL)isLocalDeviceProxyRegistered
{
  v2 = [(LegacySMSServiceSession *)self localDevice];
  if (!v2) {
    goto LABEL_14;
  }
  if (IMOSLoggingEnabled())
  {
    BOOL v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      id v4 = [v2 identities];
      int v17 = 138412546;
      id v18 = v2;
      __int16 v19 = 2112;
      id v20 = v4;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Device %@ has identities %@", (uint8_t *)&v17, 0x16u);
    }
  }
  id v5 = [v2 identities];
  BOOL v6 = [v5 count] == 0;

  if (!v6)
  {
    id v7 = [v2 identities];
    BOOL v8 = [v7 count] == (char *)&dword_0 + 1;

    if (v8)
    {
      id v9 = [v2 identities];
      id v10 = [v9 firstObject];

      id v11 = [v10 _stringForKey:@"uri"];
      unsigned int v12 = [v11 isEqualToString:@"mailto:__localURI__@__local__URI.com"];
      if (v12 && IMOSLoggingEnabled())
      {
        long long v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "The default paired device has an identity, but is is the local account, it is NOT proxy registered for SMS", (uint8_t *)&v17, 2u);
        }
      }
      char v14 = v12 ^ 1;
      goto LABEL_20;
    }
LABEL_14:
    char v14 = 1;
    goto LABEL_20;
  }
  if (IMOSLoggingEnabled())
  {
    id v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "The default paired device has no identities, this means it is NOT proxy registered for SMS", (uint8_t *)&v17, 2u);
    }
  }
  char v14 = 0;
LABEL_20:

  return v14;
}

- (void)_addOriginatedMessage:(id)a3
{
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
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, " Adding Message with GUID: %@ to originated Message Map", (uint8_t *)&v9, 0xCu);
      }
    }
    originatedMessages = self->_originatedMessages;
    if (!originatedMessages)
    {
      id v7 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      BOOL v8 = self->_originatedMessages;
      self->_originatedMessages = v7;

      originatedMessages = self->_originatedMessages;
    }
    [(NSMutableSet *)originatedMessages addObject:v4];
    [(LegacySMSServiceSession *)self _setClearMessageSendTimer];
  }
}

- (void)_removeOriginatedMessage:(id)a3
{
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
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, " Removing Message with GUID: %@ from originated Message Map", (uint8_t *)&v6, 0xCu);
      }
    }
    [(NSMutableSet *)self->_originatedMessages removeObject:v4];
    if (![(NSMutableSet *)self->_originatedMessages count]) {
      [(LegacySMSServiceSession *)self _clearInactivityTimer];
    }
  }
}

- (void)_clearInactivityTimer
{
  self->_pendingOriginatedMessagesTimer = 0;
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_clearInactivityTimer" object:0];
  originatedMessages = self->_originatedMessages;
  self->_originatedMessages = 0;
}

- (void)_setClearMessageSendTimer
{
  if (!self->_pendingOriginatedMessagesTimer)
  {
    self->_pendingOriginatedMessagesTimer = 1;
    +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_clearInactivityTimer" object:0];
    [(LegacySMSServiceSession *)self performSelector:"_clearInactivityTimer" withObject:0 afterDelay:30.0];
  }
}

- (void)_markFromStorageIfNeeded:(id)a3 messageGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v7;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Storage context present for message with GUID %@", (uint8_t *)&v10, 0xCu);
      }
    }
    unsigned __int8 v9 = [v6 unsignedIntValue];
    if (([v6 unsignedIntValue] & 2) != 0)
    {
      [(LegacySMSServiceSession *)self noteLastItemFromStorage:v7];
    }
    else if (v9)
    {
      [(LegacySMSServiceSession *)self noteItemFromStorage:v7];
    }
  }
}

- (void)_approveSelfForSMSRelay
{
  if ((IMGetDomainBoolForKey() & 1) == 0)
  {
    IMSetDomainBoolForKey();
    IMSyncronizeAppPreferences();
    [(LegacySMSServiceSession *)self _updateRelayStatus];
  }
}

- (void)_deferredReplicatedMessageReleaseWithAllowedMessage:(id)a3 outgoingProxyBlock:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = [(LegacySMSServiceSession *)self _replicatedMessageGUIDToReleaseFromMessageDictionary:v6];
  if ([v8 length])
  {
    if (IMOSLoggingEnabled())
    {
      unsigned __int8 v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v8;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Delaying release of replicated message %@", buf, 0xCu);
      }
    }
    dispatch_time_t v10 = dispatch_time(0, 1000000000);
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_2F030;
    block[3] = &unk_8D890;
    id v12 = v8;
    long long v13 = self;
    id v14 = v7;
    dispatch_after(v10, (dispatch_queue_t)&_dispatch_main_q, block);
  }
  else
  {
    (*((void (**)(id, uint64_t))v7 + 2))(v7, 1);
  }
}

- (void)handler:(id)a3 incomingPlainTextMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 storageContext:(id)a9
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_2F3B0;
  v13[3] = &unk_8D8E0;
  id v14 = self;
  id v15 = a4;
  id v16 = a7;
  id v17 = a9;
  id v10 = v17;
  id v11 = v16;
  id v12 = v15;
  [(LegacySMSServiceSession *)v14 _enqueueBlock:v13 withTimeout:45.0];
}

- (void)handler:(id)a3 incomingDownloadMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 storageContext:(id)a9
{
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_2FB14;
  v13[3] = &unk_8D8E0;
  id v14 = self;
  id v15 = a4;
  id v16 = a7;
  id v17 = a9;
  id v10 = v17;
  id v11 = v16;
  id v12 = v15;
  [(LegacySMSServiceSession *)v14 _enqueueBlock:v13 withTimeout:240.0];
}

- (void)handler:(id)a3 outgoingPlainTextMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 isBeingReplayed:(BOOL)a10 storageContext:(id)a11
{
}

- (void)handler:(id)a3 outgoingPlainTextMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 isBeingReplayed:(BOOL)a10 isInProxyMode:(BOOL)a11 storageContext:(id)a12
{
  id v16 = a4;
  id v17 = a5;
  v26[0] = _NSConcreteStackBlock;
  v26[1] = 3221225472;
  v26[2] = sub_306C4;
  v26[3] = &unk_8D9E8;
  id v27 = a6;
  id v28 = v17;
  BOOL v35 = a11;
  CFStringRef v29 = self;
  id v30 = v16;
  BOOL v36 = a10;
  id v31 = a7;
  id v32 = a8;
  id v33 = a9;
  id v34 = a12;
  id v18 = v34;
  id v19 = v33;
  id v20 = v32;
  id v21 = v31;
  id v22 = v16;
  id v23 = v17;
  id v24 = v27;
  [(LegacySMSServiceSession *)self _enqueueBlock:v26 withTimeout:45.0];
}

- (void)handler:(id)a3 outgoingDownloadMessage:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 isBeingReplayed:(BOOL)a10 storageContext:(id)a11
{
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  v29[0] = _NSConcreteStackBlock;
  v29[1] = 3221225472;
  v29[2] = sub_32E08;
  v29[3] = &unk_8DA80;
  id v21 = self;
  v29[4] = self;
  id v30 = v16;
  BOOL v37 = a10;
  id v31 = v19;
  id v32 = v20;
  id v33 = a9;
  id v34 = a11;
  id v35 = v18;
  id v36 = v17;
  id v22 = v17;
  id v23 = v18;
  id v24 = v34;
  id v25 = v33;
  id v26 = v20;
  id v27 = v19;
  id v28 = v16;
  [(LegacySMSServiceSession *)v21 _enqueueBlock:v29 withTimeout:240.0];
}

- (void)handler:(id)a3 messageIDSent:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timeStamp:(id)a7 storageContext:(id)a8
{
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_34C4C;
  v12[3] = &unk_8DAA8;
  id v13 = a4;
  id v14 = self;
  id v15 = a8;
  id v10 = v15;
  id v11 = v13;
  [(LegacySMSServiceSession *)self _enqueueBlock:v12 withTimeout:45.0];
}

- (void)handler:(id)a3 messageIDRead:(id)a4 timeStamp:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7 storageContext:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  v28[0] = 0;
  v28[1] = v28;
  v28[2] = 0x3032000000;
  v28[3] = sub_34FF0;
  v28[4] = sub_35000;
  id v29 = 0;
  id v29 = [objc_alloc((Class)IMPowerAssertion) initWithIdentifier:@"IncomingReadReceiptAssertion" timeout:10.0];
  v23[0] = _NSConcreteStackBlock;
  v23[1] = 3221225472;
  v23[2] = sub_35008;
  v23[3] = &unk_8DAD0;
  v23[4] = self;
  id v20 = v15;
  id v24 = v20;
  id v21 = v16;
  id v25 = v21;
  id v22 = v19;
  id v26 = v22;
  id v27 = v28;
  [(LegacySMSServiceSession *)self _enqueueBlock:v23 withTimeout:45.0];

  _Block_object_dispose(v28, 8);
}

- (void)handler:(id)a3 messageIDSendFailure:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 timeStamp:(id)a7 storageContext:(id)a8
{
  id v12 = a4;
  id v13 = a5;
  v18[0] = _NSConcreteStackBlock;
  v18[1] = 3221225472;
  v18[2] = sub_35278;
  v18[3] = &unk_8DAF8;
  v18[4] = self;
  id v19 = v12;
  id v20 = a6;
  id v21 = v13;
  id v22 = a8;
  id v14 = v22;
  id v15 = v13;
  id v16 = v20;
  id v17 = v12;
  [(LegacySMSServiceSession *)self _enqueueBlock:v18 withTimeout:45.0];
}

- (void)handler:(id)a3 deleteCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 needsDeliveryReceipt:(id)a9 deliveryContext:(id)a10 storageContext:(id)a11
{
  id v34 = a3;
  id v17 = a4;
  id v35 = a5;
  id v36 = a6;
  id v18 = a7;
  id v39 = a8;
  id v37 = a9;
  id v38 = a10;
  id v19 = a11;
  id v20 = [(LegacySMSServiceSession *)self idsDeviceFromPushToken:v18];
  id v21 = v20;
  if (!v20)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_18;
    }
    id v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v18;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Received a delete command, but it was not from one of our own devices From: %@", buf, 0xCu);
    }
LABEL_17:

    goto LABEL_18;
  }
  unsigned int v22 = objc_msgSend(v20, "isActive", v34, v35, v36, v37, v38);
  id v23 = [v17 objectForKey:@"chat"];
  id v24 = [v23 objectAtIndex:0];
  id v25 = [v24 objectForKey:IMDChatWasReportedAsJunkKey];
  unsigned int v26 = [v25 BOOLValue];

  id v27 = +[IMDCKUtilities sharedInstance];
  unsigned int v28 = [v27 cloudKitSyncingEnabled];

  int v29 = IMOSLoggingEnabled();
  if ((((v22 | v28) | v26) & 1) == 0)
  {
    if (!v29) {
      goto LABEL_18;
    }
    id v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v43 = v17;
      _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "iCloudSync not enabled and not reported as junk, dropping delete command: %@", buf, 0xCu);
    }
    goto LABEL_17;
  }
  if (v29)
  {
    id v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413058;
      id v43 = v17;
      __int16 v44 = 1024;
      unsigned int v45 = v28;
      __int16 v46 = 1024;
      unsigned int v47 = v26;
      __int16 v48 = 1024;
      unsigned int v49 = v22;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Handling delete command: %@ (cloudKitSyncEnabled: %d, wasReportedJunk: %d, senderIsPairedWatch: %d)", buf, 0x1Eu);
    }
  }
  if ([(LegacySMSServiceSession *)self shouldInferRecoverableDeleteForCommandDictionary:v17])
  {
    id v31 = +[NSDate __im_iMessageDateFromTimeStamp:v39];
    uint64_t v32 = [(LegacySMSServiceSession *)self deleteCommandDictionaryWithIncomingDictionary:v17 inferredRecoverableDeleteForLegacyCommandsWithDate:v31];

    id v17 = (id)v32;
  }
  v40[0] = _NSConcreteStackBlock;
  v40[1] = 3221225472;
  v40[2] = sub_357A0;
  v40[3] = &unk_8DB20;
  v40[4] = self;
  id v17 = v17;
  id v41 = v17;
  [(LegacySMSServiceSession *)self _enqueueBlock:v40 withTimeout:45.0];

LABEL_18:
}

- (void)handler:(id)a3 recoverCommand:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 timeStamp:(id)a8 needsDeliveryReceipt:(id)a9 deliveryContext:(id)a10 storageContext:(id)a11
{
  id v30 = a3;
  id v17 = a4;
  id v31 = a5;
  id v18 = a6;
  id v19 = a7;
  id v32 = a8;
  id v20 = a9;
  id v21 = a10;
  id v22 = a11;
  id v23 = [(LegacySMSServiceSession *)self idsDeviceFromPushToken:v19];
  if (!v23)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_16;
    }
    int v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v19;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Received a recover command, but it was not from one of our own devices From: %@", buf, 0xCu);
    }
LABEL_15:

    goto LABEL_16;
  }
  id v24 = +[IMDCKUtilities sharedInstance];
  id v25 = v18;
  unsigned __int8 v26 = [v24 cloudKitSyncingEnabled];

  int v27 = IMOSLoggingEnabled();
  if ((v26 & 1) == 0)
  {
    id v18 = v25;
    if (!v27) {
      goto LABEL_16;
    }
    int v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v17;
      _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "iCloudSync not enabled, dropping delete command: %@", buf, 0xCu);
    }
    goto LABEL_15;
  }
  id v18 = v25;
  if (v27)
  {
    unsigned int v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v17;
      _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Handling delete command: %@ (cloudKitSyncEnabled: YES)", buf, 0xCu);
    }
  }
  v33[0] = _NSConcreteStackBlock;
  v33[1] = 3221225472;
  v33[2] = sub_35B30;
  v33[3] = &unk_8DB20;
  v33[4] = self;
  id v34 = v17;
  [(LegacySMSServiceSession *)self _enqueueBlock:v33 withTimeout:45.0];

LABEL_16:
}

- (void)handler:(id)a3 localFileResponse:(id)a4 storageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v9;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Received remote file response %@", (uint8_t *)&v12, 0xCu);
    }
  }
  [(LegacySMSAttachmentController *)self->_attachmentController remoteFileResponse:v9];
}

- (void)handler:(id)a3 localFileRequest:(id)a4 storageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v9;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Received remote file request %@", (uint8_t *)&v12, 0xCu);
    }
  }
  [(LegacySMSAttachmentController *)self->_attachmentController remotefileRequest:v9 attempts:0];
}

- (void)handler:(id)a3 localIncommingMessage:(id)a4 storageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "SMS Service Session Received Local incomming SMS Message", v13, 2u);
    }
  }
  int v12 = [v9 objectForKey:@"incomming-message"];
  [(LegacySMSServiceSession *)self _processReceivedDictionary:v12 storageContext:v10 receivedViaRelay:1 withCompletionBlock:0];
}

- (void)handler:(id)a3 localOutgoingDownloadMessage:(id)a4 isBeingReplayed:(BOOL)a5 storageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v18 = v11;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "SMS Service Session received Local outgoing Download SMS Message message %@", buf, 0xCu);
    }
  }
  id v14 = [v11 objectForKey:@"outgoing-message"];
  id v15 = [v11 objectForKey:@"message-guid"];
  LOBYTE(v16) = a5;
  [(LegacySMSServiceSession *)self handler:v10 outgoingDownloadMessage:v14 toIdentifier:0 fromIdentifier:0 fromToken:0 messageGUID:v15 timeStamp:0 isBeingReplayed:v16 storageContext:v12];
}

- (void)handler:(id)a3 localOutgoingMessage:(id)a4 isBeingReplayed:(BOOL)a5 storageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "SMS Service Session received Local outgoing SMS Message", buf, 2u);
    }
  }
  id v14 = [v11 objectForKey:@"outgoing-message"];
  id v15 = [v11 objectForKey:@"message-guid"];
  BYTE1(v16) = 1;
  LOBYTE(v16) = a5;
  -[LegacySMSServiceSession handler:outgoingPlainTextMessage:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:isBeingReplayed:isInProxyMode:storageContext:](self, "handler:outgoingPlainTextMessage:toIdentifier:fromIdentifier:fromToken:messageGUID:timeStamp:isBeingReplayed:isInProxyMode:storageContext:", 0, v14, 0, 0, 0, v15, 0, v16, v12);
}

- (void)handler:(id)a3 localIncomingDownloadMessage:(id)a4 storageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v13 = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "SMS Service Session Received Local incomming download MMS Message", v13, 2u);
    }
  }
  id v12 = [v9 objectForKey:@"incomming-message"];
  [(LegacySMSServiceSession *)self _processReceivedDictionary:v12 storageContext:v10 receivedViaRelay:1 withCompletionBlock:0];
}

- (void)handler:(id)a3 localMessageSent:(id)a4 storageContext:(id)a5
{
}

- (void)handler:(id)a3 localMessageRead:(id)a4 storageContext:(id)a5
{
}

- (void)handler:(id)a3 localMessageError:(id)a4 storageContext:(id)a5
{
  id v7 = a4;
  v10[0] = _NSConcreteStackBlock;
  v10[1] = 3221225472;
  v10[2] = sub_36390;
  v10[3] = &unk_8DAA8;
  v10[4] = self;
  id v11 = a5;
  id v12 = v7;
  id v8 = v7;
  id v9 = v11;
  [(LegacySMSServiceSession *)self _enqueueBlock:v10 withTimeout:45.0];
}

- (void)handler:(id)a3 incomingDisplayPinCode:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 storageContext:(id)a10
{
  id v34 = a3;
  id v16 = a4;
  id v39 = a5;
  id v40 = a6;
  id v41 = a7;
  id v36 = a8;
  id v37 = a9;
  id v38 = a10;
  if (IMOSLoggingEnabled())
  {
    id v17 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v43 = v40;
      __int16 v44 = 2112;
      id v45 = v39;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "SMS Service Session Received an incomming approval request from:%@ to:%@", buf, 0x16u);
    }
  }
  id v35 = v16;
  id v18 = [v16 _numberForKey:off_997A0];
  id v19 = [(LegacySMSServiceSession *)self idsDeviceFromPushToken:v41];
  if ([v19 supportsSMSRelay])
  {
    id v20 = [v19 linkedUserURIs];
    id v21 = [v20 firstObject];
    id v22 = [v21 _stripFZIDPrefix];

    id v23 = IMFormattedDisplayStringForID();
    id v24 = [v23 stringWithLTREmbedding];

    id v25 = +[NSBundle bundleForClass:objc_opt_class()];
    unsigned __int8 v26 = [v25 localizedStringForKey:@"Cancel" value:&stru_8F4F0 table:@"SMSLocalizable"];
    int v27 = [v25 localizedStringForKey:@"TO_SEND_AND_RECEIVE_YOUR_IPHONE_TEXT_MESSAGES" value:&stru_8F4F0 table:@"SMSLocalizable"];
    unsigned int v28 = [v19 uniqueID];
    int v29 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v27, v24, v18, v34);
    id v30 = +[IMUserNotification userNotificationWithIdentifier:v28 title:v29 message:0 defaultButton:v26 alternateButton:0 otherButton:0];

    if (v30)
    {
      [v30 setUsesNotificationCenter:0];
      [v30 setRepresentedApplicationBundle:kFZAppBundleIdentifier];
      id v31 = +[IMUserNotificationCenter sharedInstance];
      [v31 addUserNotification:v30 listener:0 completionHandler:&stru_8DB60];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "********** We received an imcomming pin code alert from a non SMS Device", buf, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v43 = v19;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "The device that sent this request was %@", buf, 0xCu);
      }
    }
  }
}

- (void)handler:(id)a3 incomingEnrollMeRequest:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 storageContext:(id)a10
{
  id v41 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v43 = a8;
  id v44 = a9;
  id v45 = a10;
  if (IMOSLoggingEnabled())
  {
    id v20 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v47 = v18;
      __int16 v48 = 2112;
      id v49 = v17;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "SMS Service Session Received a request to enroll a device into SMS Relay from:%@ to:%@", buf, 0x16u);
    }
  }
  id v21 = objc_msgSend(v16, "_numberForKey:", off_99948, v41);
  if (IMOSLoggingEnabled())
  {
    id v22 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      CFStringRef v23 = @"YES";
      *(_DWORD *)buf = 138412802;
      id v47 = v18;
      __int16 v48 = 2112;
      if (!v21) {
        CFStringRef v23 = @"NO";
      }
      id v49 = v17;
      __int16 v50 = 2112;
      CFStringRef v51 = v23;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "SMS Service Session Received a request to enroll a device into SMS Relay from:%@ to:%@, micIsOn:%@", buf, 0x20u);
    }
  }
  id v24 = [(LegacySMSServiceSession *)self idsDeviceFromPushToken:v19];
  id v25 = v24;
  if (v24)
  {
    unsigned __int8 v26 = [v24 uniqueID];
    int v27 = [(LegacySMSServiceSession *)self _allowedDevicesforSMSRelay];
    unsigned int v28 = [(LegacySMSServiceSession *)self isIDInList:v26 ArrayToCheck:v27];

    if (v28)
    {
      if (IMOSLoggingEnabled())
      {
        int v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Received request to enroll a device into SMS Relay, However we already have this device in our allowed list ", buf, 2u);
        }
      }
      if (!v21)
      {
        [(LegacySMSServiceSession *)self _removeDeviceHasMICForSMSRelay:v25];
        goto LABEL_49;
      }
      if (IMOSLoggingEnabled())
      {
        id v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Received request to enroll a device into SMS Relay, However this is just an update for its MIC State to YES, Saving that down", buf, 2u);
        }
      }
      goto LABEL_42;
    }
    id v33 = [v25 uniqueID];
    id v34 = [(LegacySMSServiceSession *)self _challengedDevicesforSMSRelay];
    unsigned int v35 = [(LegacySMSServiceSession *)self isIDInList:v33 ArrayToCheck:v34];

    if (v35)
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_49;
      }
      id v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "Received request to enroll a device into SMS Relay, However this device has requested to be enrolled before, Not allowing it to try again", buf, 2u);
      }
      goto LABEL_30;
    }
    unsigned int v36 = [v25 isHSATrusted];
    int v37 = IMOSLoggingEnabled();
    if (v36)
    {
      if (v37)
      {
        id v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v47 = v25;
          _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "Automatically enrolling for SMS relay with requesting device: %@", buf, 0xCu);
        }
      }
      [(LegacySMSServiceSession *)self _addDeviceToAllowedSMSRelay:v25 shouldSendApproval:1];
      if (v21) {
LABEL_42:
      }
        [(LegacySMSServiceSession *)self _noteDeviceHasMICForSMSRelay:v25];
    }
    else
    {
      if (v37)
      {
        id v39 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Received request to enroll a device into SMS Relay, This is your first time trying, You only get 1 chance", buf, 2u);
        }
      }
      [(LegacySMSServiceSession *)self _addDeviceToChallengedSMSRelay:v25];
      id v40 = [v25 uniqueID];
      [(LegacySMSServiceSession *)self _sendPinCodeToDeviceAndPromptForResponse:v40];
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v31 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "********** We received an Enroll me Request from a device that we do not recognize", buf, 2u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v47 = 0;
        _os_log_impl(&dword_0, v32, OS_LOG_TYPE_INFO, "The device that sent this request was %@", buf, 0xCu);
      }
LABEL_30:
    }
  }
LABEL_49:
}

- (void)handler:(id)a3 incomingResponseForApproval:(id)a4 toIdentifier:(id)a5 fromIdentifier:(id)a6 fromToken:(id)a7 messageGUID:(id)a8 timeStamp:(id)a9 storageContext:(id)a10
{
  id v48 = a3;
  id v16 = a4;
  id v17 = (__CFString *)a5;
  id v18 = (__CFString *)a6;
  id v19 = a7;
  id v49 = a8;
  id v50 = a9;
  id v20 = a10;
  if (IMOSLoggingEnabled())
  {
    id v21 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v52 = v18;
      __int16 v53 = 2112;
      CFStringRef v54 = v17;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "SMS Service Session Received an incomming approval response from:%@ to:%@", buf, 0x16u);
    }
  }
  id v22 = [(LegacySMSServiceSession *)self idsDeviceFromPushToken:v19];
  CFStringRef v23 = [v16 objectForKey:off_997B8];
  unsigned int v24 = [v23 BOOLValue];

  id v25 = [v16 objectForKey:off_997C0];
  unsigned int v26 = [v25 BOOLValue];

  if (v24)
  {
    unsigned __int8 v27 = [(LegacySMSServiceSession *)self _deviceAllowedToDisableRelay:v22];
    int v28 = IMOSLoggingEnabled();
    if (v27)
    {
      if (v28)
      {
        int v29 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
        {
          id v30 = [v22 name];
          *(_DWORD *)buf = 138412290;
          CFStringRef v52 = v30;
          _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Device %@ Told us that they have turned off SMS Relay for us, revoking them now ", buf, 0xCu);
        }
      }
      IMSetDomainBoolForKey();
      IMSyncronizeAppPreferences();
      if (v26)
      {
        if (IMOSLoggingEnabled())
        {
          id v31 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "This response indicated to us that we tried to send when we shouldnt have tried to send, Pulling out the guid and marking that message as a failure ", buf, 2u);
          }
        }
        id v32 = [v16 _stringForKey:off_998B8];
        if (v32)
        {
          if (IMOSLoggingEnabled())
          {
            id v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v52 = v32;
              _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Telling message GUID %@ that it's a failure", buf, 0xCu);
            }
          }
          [(LegacySMSServiceSession *)self didReceiveError:4 forMessageID:v32 forceError:1];
        }
      }
      id v34 = +[IMFeatureFlags sharedFeatureFlags];
      unsigned int v35 = [v34 isSMSFilterSyncEnabled];

      if (v35)
      {
        unsigned int v36 = [v22 uniqueIDOverride];
        [(LegacySMSServiceSession *)self _checkAndUpdateSMSFilteringSettingsForDeviceID:v36 smsFilterCapabilitiesOptions:0 filterExtensionName:0];
      }
      [(LegacySMSServiceSession *)self _updateRelayStatus];
    }
    else if (v28)
    {
      __int16 v46 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
      {
        id v47 = [v22 name];
        *(_DWORD *)buf = 138412290;
        CFStringRef v52 = v47;
        _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "Device %@ Told us that they have turned off SMS Relay for us, but we determined they are not allowed to. Ignoring!", buf, 0xCu);
      }
    }
  }
  else
  {
    int v37 = [v16 objectForKey:off_997A8];
    unsigned int v38 = [v37 BOOLValue];

    id v39 = [v16 objectForKey:off_997B0];
    unsigned int v40 = [v39 BOOLValue];

    if (IMOSLoggingEnabled())
    {
      id v41 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
      {
        CFStringRef v42 = @"NO";
        if (v38) {
          CFStringRef v43 = @"YES";
        }
        else {
          CFStringRef v43 = @"NO";
        }
        if (v40) {
          CFStringRef v42 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        CFStringRef v52 = v43;
        __int16 v53 = 2112;
        CFStringRef v54 = v42;
        _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "The response was %@ Was it a cancelation/revokation? %@ ", buf, 0x16u);
      }
    }
    IMSetDomainBoolForKey();
    IMSyncronizeAppPreferences();
    [(LegacySMSServiceSession *)self _updateRelayStatus];
    id v44 = +[IMUserNotificationCenter sharedInstance];
    id v45 = [v22 uniqueID];
    [v44 removeNotificationsForServiceIdentifier:v45];
  }
}

- (void)handler:(id)a3 incomingSMSFilteringSettingsMessage:(id)a4 fromToken:(id)a5
{
  id v7 = a4;
  id v8 = a5;
  id v9 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v10 = [v9 isSMSFilterSyncEnabled];

  if (v10
    && +[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
  {
    v11[0] = _NSConcreteStackBlock;
    v11[1] = 3221225472;
    v11[2] = sub_37670;
    v11[3] = &unk_8DAA8;
    v11[4] = self;
    id v12 = v8;
    id v13 = v7;
    [(LegacySMSServiceSession *)self _enqueueBlock:v11 withTimeout:45.0];
  }
}

- (BOOL)_deviceAllowedToDisableRelay:(id)a3
{
  id v4 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v5 = [(IDSService *)self->_relayService devices];
  id v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v17;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v17 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = [*(id *)(*((void *)&v16 + 1) + 8 * i) uniqueID];
        unsigned int v10 = [v4 uniqueID];
        unsigned int v11 = [v9 isEqualToString:v10];

        if (v11)
        {
          if ([v4 supportsSMSRelay]) {
            unsigned __int8 v14 = 1;
          }
          else {
            unsigned __int8 v14 = [v4 supportsMMSRelay];
          }

          goto LABEL_18;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v16 objects:v22 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      id v13 = [v4 name];
      *(_DWORD *)buf = 138412290;
      id v21 = v13;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Device %@ was not found in our relay service!", buf, 0xCu);
    }
  }
  unsigned __int8 v14 = 0;
LABEL_18:

  return v14;
}

- (BOOL)isValidMMS:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Validation: Attempting To Validate Message", buf, 2u);
    }
  }
  id v5 = [v3 fileTransferGUIDs];
  if (![v5 count])
  {

    goto LABEL_28;
  }
  id v6 = [v3 balloonBundleID];
  unsigned int v7 = [v6 isEqualToString:IMBalloonPluginIdentifierRichLinks];

  if (v7)
  {
LABEL_28:
    if (IMOSLoggingEnabled())
    {
      id v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Validation: Message has no attachments or it is a rich link, fine to send", buf, 2u);
      }
    }
    LOBYTE(v10) = 1;
    goto LABEL_37;
  }
  id v8 = +[IMDFileTransferCenter sharedInstance];
  id v9 = (__CFString *)objc_alloc_init((Class)NSMutableArray);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  unsigned int v10 = [v3 fileTransferGUIDs];
  id v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
  if (v11)
  {
    uint64_t v12 = *(void *)v24;
    while (2)
    {
      for (i = 0; i != v11; i = (char *)i + 1)
      {
        if (*(void *)v24 != v12) {
          objc_enumerationMutation(v10);
        }
        unsigned __int8 v14 = [v8 transferForGUID:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        id v15 = v14;
        if (v14)
        {
          long long v16 = [v14 type];
          if (![v16 length])
          {
            id v21 = IMLogHandleForCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_5EEC0((uint64_t)v15, v21);
            }

            LOBYTE(v10) = 0;
            goto LABEL_36;
          }
          [(__CFString *)v9 addObject:v16];
        }
      }
      id v11 = [v10 countByEnumeratingWithState:&v23 objects:v31 count:16];
      if (v11) {
        continue;
      }
      break;
    }
  }

  LODWORD(v10) = IMMMSPartCombinationCanBeSent();
  if (IMOSLoggingEnabled())
  {
    long long v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v28 = v9;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Validation: Attempting to validate a message with UTIs %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      CFStringRef v19 = @"NO";
      if (v10) {
        CFStringRef v19 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v28 = v19;
      __int16 v29 = 2048;
      uint64_t v30 = 0;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Validation: Is MMS Valid %@ With error %zd", buf, 0x16u);
    }
  }
LABEL_36:

LABEL_37:
  return (char)v10;
}

- (void)_buildCTPhoneNumberWithParticipantInfo:(id)a3 ctMessage:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  unsigned int v7 = [v5 objectForKey:IMDMessageStoreHandleCanonicalIDKey];
  id v8 = [v5 objectForKey:IMDMessageStoreHandleCountryCodeKey];
  id v9 = [v5 objectForKey:IMDMessageStoreHandleUnformattedIDKey];
  unsigned int v10 = +[IMDMessageStore sharedInstance];
  id v11 = [v10 cleanUnformattedPhoneNumber:v9 countryCode:v8];

  if (IMStringIsEmail())
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412290;
        CFStringRef v19 = v7;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "   => Adding email recipient: %@", (uint8_t *)&v18, 0xCu);
      }
    }
    [v6 addEmailRecipient:v7];
  }
  else
  {
    if (![v8 length])
    {
      uint64_t v13 = IMCountryCodeForIncomingTextMessage();

      id v8 = (void *)v13;
    }
    if (IMOSLoggingEnabled())
    {
      unsigned __int8 v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412802;
        CFStringRef v19 = v7;
        __int16 v20 = 2112;
        id v21 = v11;
        __int16 v22 = 2112;
        long long v23 = v8;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "   => Adding phone recipient: %@ (%@:%@)", (uint8_t *)&v18, 0x20u);
      }
    }
    if (v11) {
      id v15 = v11;
    }
    else {
      id v15 = v7;
    }
    long long v16 = +[CTPhoneNumber phoneNumberWithDigits:1 digits:v15 countryCode:v8];
    if (v16)
    {
      [v6 addPhoneRecipient:v16];
    }
    else if (IMOSLoggingEnabled())
    {
      long long v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412802;
        CFStringRef v19 = v7;
        __int16 v20 = 2112;
        id v21 = v11;
        __int16 v22 = 2112;
        long long v23 = v8;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Failed to build phone CTPhoneNumber from string: %@ (%@:%@)", (uint8_t *)&v18, 0x20u);
      }
    }
  }
}

- (id)lastAddressedHandleForJunkReportMessageItem:(id)a3
{
  id v3 = a3;
  id v4 = +[IMCTSubscriptionUtilities sharedInstance];
  id v5 = [v4 ctSubscriptionInfo];
  id v6 = [v3 destinationCallerID];
  unsigned int v7 = [v3 destinationCallerID];

  id v8 = objc_msgSend(v5, "__im_subscriptionContextForForSimID:phoneNumber:", v6, v7);

  id v9 = [v8 phoneNumber];

  return v9;
}

- (id)lastAddressedSIMIDForJunkReportMessageItem:(id)a3
{
  id v3 = a3;
  id v4 = +[IMCTSubscriptionUtilities sharedInstance];
  id v5 = [v4 ctSubscriptionInfo];
  id v6 = [v3 destinationCallerID];
  unsigned int v7 = [v3 destinationCallerID];

  id v8 = objc_msgSend(v5, "__im_subscriptionContextForForSimID:phoneNumber:", v6, v7);

  id v9 = [v8 labelID];

  return v9;
}

- (id)newTelephonyMessagesForHandles:(id)a3 shouldBroadcastMessage:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc_init((Class)NSMutableArray);
  int v7 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v7)
    {
      id v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        v14[0] = 67109120;
        v14[1] = [v5 count];
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, " => This is a broadcast, generating %d CTMessage objects", (uint8_t *)v14, 8u);
      }
    }
    if ([v5 count])
    {
      unint64_t v9 = 0;
      do
      {
        id v10 = objc_alloc_init((Class)CTMessage);
        [v6 addObject:v10];

        ++v9;
      }
      while (v9 < (unint64_t)[v5 count]);
    }
  }
  else
  {
    if (v7)
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        LOWORD(v14[0]) = 0;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, " => Generating a single CTMessage", (uint8_t *)v14, 2u);
      }
    }
    id v12 = objc_alloc_init((Class)CTMessage);
    [v6 addObject:v12];
  }
  return v6;
}

- (void)setSubjectForTelephonyMessages:(id)a3 messageItem:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  int v7 = [v6 subject];
  id v8 = [v7 length];

  if (v8)
  {
    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v9 = v5;
    id v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v17;
      do
      {
        uint64_t v13 = 0;
        do
        {
          if (*(void *)v17 != v12) {
            objc_enumerationMutation(v9);
          }
          unsigned __int8 v14 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v13);
          id v15 = objc_msgSend(v6, "subject", (void)v16);
          [v14 setSubject:v15];

          uint64_t v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
      }
      while (v11);
    }
  }
}

- (void)processPartsOfTelephonyMessages:(id)a3 parts:(id)a4 messageItem:(id)a5 isGroupChat:(BOOL)a6 phoneNumber:(id)a7 simID:(id)a8
{
  BOOL v66 = a6;
  id v68 = a3;
  id v13 = a4;
  id v64 = a5;
  id v62 = a7;
  id v61 = a8;
  id v63 = v13;
  if ([v13 count])
  {
    long long v85 = 0u;
    long long v86 = 0u;
    long long v83 = 0u;
    long long v84 = 0u;
    id v14 = v68;
    id v15 = [v14 countByEnumeratingWithState:&v83 objects:v96 count:16];
    if (v15)
    {
      uint64_t v16 = *(void *)v84;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v84 != v16) {
            objc_enumerationMutation(v14);
          }
          long long v18 = *(void **)(*((void *)&v83 + 1) + 8 * i);
          long long v19 = sub_E2D4(v13);
          if (IMOSLoggingEnabled())
          {
            __int16 v20 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)long long v89 = v19;
              _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Generated SMIL string: %@", buf, 0xCu);
            }
          }
          id v21 = [v18 addText:v19];
          __int16 v22 = +[IMFeatureFlags sharedFeatureFlags];
          unsigned int v23 = [v22 isReplicationEnabled];

          if (v23)
          {
            long long v24 = [v64 guid];
            [(LegacySMSServiceSession *)self _setContentIDAndLocationForSMILPart:v21 messageGUID:v24 isGroupChat:v66 phoneNumber:v62 simID:v61];
          }
          else
          {
            [v21 setContentId:@"0.smil"];
          }
          [v21 setContentType:off_998A8];
        }
        id v15 = [v14 countByEnumeratingWithState:&v83 objects:v96 count:16];
      }
      while (v15);
    }
  }
  id v65 = objc_alloc_init((Class)NSMutableSet);
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id obj = v68;
  id v59 = [obj countByEnumeratingWithState:&v79 objects:v95 count:16];
  if (v59)
  {
    uint64_t v58 = *(void *)v80;
    do
    {
      uint64_t v25 = 0;
      do
      {
        if (*(void *)v80 != v58)
        {
          uint64_t v26 = v25;
          objc_enumerationMutation(obj);
          uint64_t v25 = v26;
        }
        uint64_t v60 = v25;
        id v70 = *(void **)(*((void *)&v79 + 1) + 8 * v25);
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id v67 = v63;
        id v27 = [v67 countByEnumeratingWithState:&v75 objects:v94 count:16];
        if (v27)
        {
          uint64_t v28 = 0;
          uint64_t v69 = *(void *)v76;
          do
          {
            for (j = 0; j != v27; j = (char *)j + 1)
            {
              if (*(void *)v76 != v69) {
                objc_enumerationMutation(v67);
              }
              uint64_t v30 = *(void **)(*((void *)&v75 + 1) + 8 * (void)j);
              id v31 = [v30 objectForKey:@"Type"];
              id v32 = sub_E15C(v31);

              id v33 = [v30 objectForKey:@"Filename"];
              if (v33)
              {
                id v34 = +[NSURL fileURLWithPath:v33];
                unsigned int v35 = +[NSData dataWithContentsOfURL:v34 options:1 error:0];

                unsigned int v36 = IMSafeTemporaryDirectory();
                uint64_t v37 = [v36 path];

                if (v37) {
                  unsigned int v38 = (__CFString *)v37;
                }
                else {
                  unsigned int v38 = @"/tmp";
                }
                if ([v33 hasPrefix:v38])
                {
                  [v65 addObject:v33];
                  if (IMOSLoggingEnabled())
                  {
                    id v39 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)long long v89 = v33;
                      _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "  => setting file to cleanup: %@", buf, 0xCu);
                    }
                  }
                }
              }
              else
              {
                unsigned int v35 = [v30 objectForKey:@"Data"];
              }
              unsigned int v40 = [v30 objectForKey:@"Path"];
              id v41 = +[IMFeatureFlags sharedFeatureFlags];
              unsigned int v42 = [v41 isReplicationEnabled];

              if (v42 && v66)
              {
                CFStringRef v43 = [v64 guid];
                id v44 = +[NSString stringWithFormat:@"%d.%@%@", (char *)j + v28, v43, off_999A0];
              }
              else
              {
                id v44 = +[NSString stringWithFormat:@"%d", (char *)j + v28];
              }
              if (IMOSLoggingEnabled())
              {
                id v45 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                {
                  unsigned int v46 = [v35 length];
                  *(_DWORD *)buf = 67109890;
                  *(_DWORD *)long long v89 = v46;
                  *(_WORD *)&v89[4] = 2112;
                  *(void *)&v89[6] = v40;
                  __int16 v90 = 2112;
                  id v91 = v44;
                  __int16 v92 = 2112;
                  long long v93 = v32;
                  _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "  => adding data: %d bytes (location: %@, id: %@, type: %@)", buf, 0x26u);
                }
              }
              id v47 = [objc_alloc((Class)CTMessagePart) initWithData:v35 contentType:v32];
              [v47 setContentId:v44];
              [v47 setContentLocation:v40];
              if (IMOSLoggingEnabled())
              {
                id v48 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v48, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)long long v89 = v47;
                  _os_log_impl(&dword_0, v48, OS_LOG_TYPE_INFO, "  => adding part: %@", buf, 0xCu);
                }
              }
              id v49 = [v70 addPart:v47];
            }
            id v27 = [v67 countByEnumeratingWithState:&v75 objects:v94 count:16];
            uint64_t v28 = (v28 + j);
          }
          while (v27);
        }

        uint64_t v25 = v60 + 1;
      }
      while ((id)(v60 + 1) != v59);
      id v59 = [obj countByEnumeratingWithState:&v79 objects:v95 count:16];
    }
    while (v59);
  }

  long long v73 = 0u;
  long long v74 = 0u;
  long long v71 = 0u;
  long long v72 = 0u;
  id v50 = v65;
  id v51 = [v50 countByEnumeratingWithState:&v71 objects:v87 count:16];
  if (v51)
  {
    uint64_t v52 = *(void *)v72;
    do
    {
      for (k = 0; k != v51; k = (char *)k + 1)
      {
        if (*(void *)v72 != v52) {
          objc_enumerationMutation(v50);
        }
        uint64_t v54 = *(void *)(*((void *)&v71 + 1) + 8 * (void)k);
        if (IMOSLoggingEnabled())
        {
          id v55 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)long long v89 = v54;
            _os_log_impl(&dword_0, v55, OS_LOG_TYPE_INFO, "Cleaning up: %@", buf, 0xCu);
          }
        }
        uint64_t v56 = +[NSFileManager defaultManager];
        [v56 removeItemAtPath:v54 error:0];
      }
      id v51 = [v50 countByEnumeratingWithState:&v71 objects:v87 count:16];
    }
    while (v51);
  }
}

- (void)_setContentIDAndLocationForSMILPart:(id)a3 messageGUID:(id)a4 isGroupChat:(BOOL)a5 phoneNumber:(id)a6 simID:(id)a7
{
  BOOL v9 = a5;
  id v16 = a3;
  id v11 = a4;
  id v12 = a6;
  id v13 = a7;
  if (v9)
  {
    id v14 = +[NSString stringWithFormat:@"0.%@%@.smil", v11, off_999A0];
    if (+[IMCTSMSUtilities IMMMSGroupTextReplicationSupportsSMILContentLocationForPhoneNumber:v12 simID:v13])
    {
      id v14 = v14;
      id v15 = v14;
    }
    else
    {
      id v15 = 0;
    }
  }
  else
  {
    id v15 = 0;
    id v14 = @"0.smil";
  }
  if ([(__CFString *)v14 length]) {
    [v16 setContentId:v14];
  }
  if ([(__CFString *)v15 length]) {
    [v16 setContentLocation:v14];
  }
}

- (void)buildTelephonyPhoneNumbersForTelephonyMessages:(id)a3 shouldBroadcastMessage:(BOOL)a4 handles:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (v6)
  {
    if ([v8 count])
    {
      unint64_t v10 = 0;
      do
      {
        id v11 = [v9 objectAtIndex:v10];
        id v12 = [v8 objectAtIndex:v10];
        [(LegacySMSServiceSession *)self _buildCTPhoneNumberWithParticipantInfo:v11 ctMessage:v12];

        ++v10;
      }
      while (v10 < (unint64_t)[v8 count]);
    }
  }
  else
  {
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v13 = [v8 countByEnumeratingWithState:&v28 objects:v33 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v15 = *(void *)v29;
      id obj = v8;
      do
      {
        id v16 = 0;
        do
        {
          if (*(void *)v29 != v15) {
            objc_enumerationMutation(obj);
          }
          uint64_t v17 = *(void *)(*((void *)&v28 + 1) + 8 * (void)v16);
          long long v24 = 0u;
          long long v25 = 0u;
          long long v26 = 0u;
          long long v27 = 0u;
          id v18 = v9;
          id v19 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v25;
            do
            {
              __int16 v22 = 0;
              do
              {
                if (*(void *)v25 != v21) {
                  objc_enumerationMutation(v18);
                }
                [(LegacySMSServiceSession *)self _buildCTPhoneNumberWithParticipantInfo:*(void *)(*((void *)&v24 + 1) + 8 * (void)v22) ctMessage:v17];
                __int16 v22 = (char *)v22 + 1;
              }
              while (v20 != v22);
              id v20 = [v18 countByEnumeratingWithState:&v24 objects:v32 count:16];
            }
            while (v20);
          }

          id v16 = (char *)v16 + 1;
        }
        while (v16 != v14);
        id v8 = obj;
        id v14 = [obj countByEnumeratingWithState:&v28 objects:v33 count:16];
      }
      while (v14);
    }
  }
}

- (void)setMessageTypeForTelephonyMessage:(id)a3 shouldSendMMS:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  BOOL v6 = v5;
  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      int v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "   => Setting Junk Report Message type to MMS", v9, 2u);
      }
    }
    id v5 = v6;
    uint64_t v8 = 2;
  }
  else
  {
    uint64_t v8 = 1;
  }
  [v5 setMessageType:v8];
}

- (void)addMessagePlainTextToTelephonyMessages:(id)a3 messageItem:(id)a4 processedMessageItem:(id)a5
{
  id v35 = a3;
  id v7 = a4;
  id v8 = a5;
  unsigned int v36 = [v7 body];
  +[IMDFileTransferCenter sharedInstance];
  v42[0] = _NSConcreteStackBlock;
  v42[1] = 3221225472;
  v42[2] = sub_39734;
  v42[3] = &unk_8DB88;
  id v33 = (id)objc_claimAutoreleasedReturnValue();
  id v43 = v33;
  id v9 = objc_retainBlock(v42);
  id v41 = 0;
  unint64_t v10 = objc_msgSend(v36, "__im_attributedStringByReplacingAdaptiveImageGlyphFileTransfersUsingFileTransferProvider:replacementTextProvider:removedTransferGUIDsOut:", v9, &stru_8DBC8, &v41);
  id v34 = v41;
  id v11 = [v10 string];
  id v12 = [v11 stringByReplacingOccurrencesOfString:IMAttachmentCharacterString withString:&stru_8F4F0];
  id v13 = [v8 expressiveSendStyleID];
  BOOL v14 = [v13 length] == 0;

  if (!v14)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        id v16 = [v8 guid];
        *(_DWORD *)buf = 138412290;
        unsigned int v46 = v16;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Appending expressive send style id for message %@", buf, 0xCu);
      }
    }
    uint64_t v17 = [v7 _localizedBackwardsCompatibleExpressiveSendText];
    if ([v17 length])
    {
      uint64_t v18 = +[NSString stringWithFormat:@"%@\n%@", v12, v17, v33];

      id v12 = (void *)v18;
    }
  }
  id v19 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v20 = [v19 isPriusCompatibilityEnabled];

  if (v20)
  {
    uint64_t v21 = [v8 threadIdentifier];
    BOOL v22 = [v21 length] == 0;

    if (!v22)
    {
      if (IMOSLoggingEnabled())
      {
        unsigned int v23 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
        {
          long long v24 = [v8 guid];
          *(_DWORD *)buf = 138412290;
          unsigned int v46 = v24;
          _os_log_impl(&dword_0, v23, OS_LOG_TYPE_INFO, "Formatting plain text reply message for message %@", buf, 0xCu);
        }
      }
      long long v25 = IMSharedUtilitiesFrameworkBundle();
      long long v26 = [v25 localizedStringForKey:@"REPLIED_BACKWARD_COMPATIBILITY" value:&stru_8F4F0 table:@"IMSharedUtilities"];
      uint64_t v27 = +[NSString stringWithFormat:@"%@\n%@", v26, v12];

      id v12 = (void *)v27;
    }
  }
  if ([v12 length])
  {
    long long v39 = 0u;
    long long v40 = 0u;
    long long v37 = 0u;
    long long v38 = 0u;
    id v28 = v35;
    id v29 = [v28 countByEnumeratingWithState:&v37 objects:v44 count:16];
    if (v29)
    {
      uint64_t v30 = *(void *)v38;
      do
      {
        long long v31 = 0;
        do
        {
          if (*(void *)v38 != v30) {
            objc_enumerationMutation(v28);
          }
          id v32 = [*(id *)(*((void *)&v37 + 1) + 8 * (void)v31) addText:v12];
          long long v31 = (char *)v31 + 1;
        }
        while (v29 != v31);
        id v29 = [v28 countByEnumeratingWithState:&v37 objects:v44 count:16];
      }
      while (v29);
    }
  }
}

- (void)sendTelephonyMessageFromJunkReportMessageItem:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Sending junk report...", buf, 2u);
    }
  }
  id v6 = objc_alloc((Class)IMDHandle);
  id v7 = [v4 handle];
  id v8 = [v4 unformattedID];
  id v9 = [v4 countryCode];
  id v10 = [v6 initWithID:v7 unformattedID:v8 countryCode:v9];

  id v11 = +[IMDMessageStore sharedInstance];
  id v18 = v10;
  id v12 = +[NSArray arrayWithObjects:&v18 count:1];
  id v13 = [(LegacySMSServiceSession *)self service];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_3995C;
  v15[3] = &unk_8CF90;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [v11 resolveUnformattedRepresentationsForHandles:v12 onService:v13 message:v14 completionBlock:v15];
}

- (void)sendCTMessageFromIMMessageItem:(id)a3 forChat:(id)a4 chat:(id)a5 style:(unsigned __int8)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Message sending...", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      uint64_t v15 = [v12 participants];
      *(_DWORD *)buf = 138412546;
      id v29 = v12;
      __int16 v30 = 2112;
      long long v31 = v15;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Looking at participants for chat %@ participants %@", buf, 0x16u);
    }
  }
  id v16 = +[IMDMessageStore sharedInstance];
  uint64_t v17 = [v12 participants];
  id v18 = [(LegacySMSServiceSession *)self service];
  v22[0] = _NSConcreteStackBlock;
  v22[1] = 3221225472;
  v22[2] = sub_3A9E0;
  v22[3] = &unk_8DC68;
  unsigned __int8 v27 = a6;
  id v23 = v12;
  id v24 = v10;
  long long v25 = self;
  id v26 = v11;
  id v19 = v11;
  id v20 = v10;
  id v21 = v12;
  [v16 resolveUnformattedRepresentationsForHandles:v17 onService:v18 message:v20 completionBlock:v22];
}

- (id)_myCTPhoneNumber
{
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    v2 = +[IMCTSubscriptionUtilities sharedInstance];
    id v3 = [v2 ctPhoneNumber];

    if (!IMOSLoggingEnabled()) {
      goto LABEL_13;
    }
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "My CT Phone Number from subscription context is: %@", (uint8_t *)&v10, 0xCu);
    }
  }
  else
  {
    id v5 = +[FTDeviceSupport sharedInstance];
    id v6 = [v5 telephoneNumber];

    if (v6)
    {
      id v7 = +[FTDeviceSupport sharedInstance];
      id v3 = [v7 telephoneNumber];
    }
    else
    {
      id v3 = 0;
    }
    if (!IMOSLoggingEnabled()) {
      goto LABEL_13;
    }
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412290;
      id v11 = v3;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "My CT Phone Number from FTDevice is: %@", (uint8_t *)&v10, 0xCu);
    }
  }

LABEL_13:
  id v8 = IMNormalizePhoneNumber();

  return v8;
}

- (void)_updatePhoneNumberCallerID
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      LOWORD(v16) = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Updating", (uint8_t *)&v16, 2u);
    }
  }
  id v4 = +[IMCTSubscriptionUtilities sharedInstance];
  id v5 = [v4 ctPhoneNumber];
  id v6 = [v5 copy];

  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v6;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Default phone number from telephony is: %@", (uint8_t *)&v16, 0xCu);
    }
  }
  if (!v6)
  {
    id v8 = [(LegacySMSServiceSession *)self _dominentPhoneNumberAlias];
    id v6 = [v8 copy];

    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412290;
        id v17 = v6;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "No phone number from telephony, adopting relay phone number %@", (uint8_t *)&v16, 0xCu);
      }
    }
    if (!v6) {
      id v6 = [&stru_8F4F0 copy];
    }
  }
  int v10 = +[IMRGLog registration];
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    int v16 = 138412290;
    id v17 = v6;
    _os_log_impl(&dword_0, v10, OS_LOG_TYPE_DEFAULT, "Updating SMS service with number: %@", (uint8_t *)&v16, 0xCu);
  }

  id v11 = [(LegacySMSServiceSession *)self account];
  id v12 = IMGenerateLoginID();
  id v13 = +[NSDictionary dictionaryWithObject:v12 forKey:kFZServiceDefaultsLoginAsKey];
  [v11 writeAccountDefaults:v13];

  id v14 = [(LegacySMSServiceSession *)self account];
  uint64_t v15 = +[NSDictionary dictionaryWithObject:v6 forKey:kFZServiceDefaultsDisplayNameKey];
  [v14 writeAccountDefaults:v15];
}

- (BOOL)_isAliasActiveForSMSRelay:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v36 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Checking if Alias %@ is active for SMS Relay ", buf, 0xCu);
    }
  }
  if ([v4 length])
  {
    id v6 = [(LegacySMSServiceSession *)self _myCTPhoneNumber];
    char v7 = _FTAreIDsEquivalent();

    if (v7)
    {
      BOOL v8 = 1;
    }
    else
    {
      long long v31 = 0u;
      long long v32 = 0u;
      long long v29 = 0u;
      long long v30 = 0u;
      id obj = [(IDSService *)self->_relayService devices];
      id v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
      if (v23)
      {
        uint64_t v22 = *(void *)v30;
        do
        {
          for (i = 0; i != v23; i = (char *)i + 1)
          {
            if (*(void *)v30 != v22) {
              objc_enumerationMutation(obj);
            }
            int v10 = *(void **)(*((void *)&v29 + 1) + 8 * i);
            if (([v10 supportsSMSRelay] & 1) != 0
              || [v10 supportsMMSRelay])
            {
              if (IMOSLoggingEnabled())
              {
                id v11 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v36 = v10;
                  _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Checking Device %@", buf, 0xCu);
                }
              }
              long long v27 = 0u;
              long long v28 = 0u;
              long long v25 = 0u;
              long long v26 = 0u;
              id v12 = [v10 linkedUserURIs];
              id v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
              if (v13)
              {
                uint64_t v14 = *(void *)v26;
                while (2)
                {
                  for (j = 0; j != v13; j = (char *)j + 1)
                  {
                    if (*(void *)v26 != v14) {
                      objc_enumerationMutation(v12);
                    }
                    int v16 = *(void **)(*((void *)&v25 + 1) + 8 * (void)j);
                    if (IMOSLoggingEnabled())
                    {
                      id v17 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v36 = v16;
                        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Checking linked URI: %@", buf, 0xCu);
                      }
                    }
                    id v18 = [v16 _stripFZIDPrefix];
                    int v19 = _FTAreIDsEquivalent();

                    if (v19)
                    {
                      if (IMOSLoggingEnabled())
                      {
                        id v20 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 138412290;
                          id v36 = v16;
                          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "LinkedURI is active for SMS Relay, Returning %@", buf, 0xCu);
                        }
                      }
                      BOOL v8 = 1;
                      goto LABEL_42;
                    }
                  }
                  id v13 = [v12 countByEnumeratingWithState:&v25 objects:v33 count:16];
                  if (v13) {
                    continue;
                  }
                  break;
                }
              }
            }
          }
          id v23 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
          BOOL v8 = 0;
        }
        while (v23);
      }
      else
      {
        BOOL v8 = 0;
      }
LABEL_42:
    }
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)_deviceForCallerID:(id)a3
{
  id v4 = a3;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = [(IDSService *)self->_relayService devices];
  id v21 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
  if (v21)
  {
    uint64_t v20 = *(void *)v28;
    do
    {
      for (i = 0; i != v21; i = (char *)i + 1)
      {
        if (*(void *)v28 != v20) {
          objc_enumerationMutation(obj);
        }
        id v6 = *(void **)(*((void *)&v27 + 1) + 8 * i);
        if (([v6 supportsSMSRelay] & 1) != 0
          || [v6 supportsMMSRelay])
        {
          if (IMOSLoggingEnabled())
          {
            char v7 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              id v33 = v6;
              _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Checking Device %@", buf, 0xCu);
            }
          }
          long long v25 = 0u;
          long long v26 = 0u;
          long long v23 = 0u;
          long long v24 = 0u;
          BOOL v8 = [v6 linkedUserURIs];
          id v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
          if (v9)
          {
            uint64_t v10 = *(void *)v24;
            while (2)
            {
              for (j = 0; j != v9; j = (char *)j + 1)
              {
                if (*(void *)v24 != v10) {
                  objc_enumerationMutation(v8);
                }
                id v12 = *(void **)(*((void *)&v23 + 1) + 8 * (void)j);
                if (IMOSLoggingEnabled())
                {
                  id v13 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v33 = v12;
                    _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Checking linked URI: %@", buf, 0xCu);
                  }
                }
                uint64_t v14 = [v12 _stripFZIDPrefix];
                int v15 = _FTAreIDsEquivalent();

                if (v15)
                {
                  if (IMOSLoggingEnabled())
                  {
                    id v18 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      id v33 = v6;
                      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "This device has the linkedURI we are looking for, return %@", buf, 0xCu);
                    }
                  }
                  id v16 = v6;

                  id v17 = v16;
                  goto LABEL_33;
                }
              }
              id v9 = [v8 countByEnumeratingWithState:&v23 objects:v31 count:16];
              if (v9) {
                continue;
              }
              break;
            }
          }
        }
      }
      id v21 = [obj countByEnumeratingWithState:&v27 objects:v34 count:16];
    }
    while (v21);
  }
  id v16 = 0;
  id v17 = obj;
LABEL_33:

  return v16;
}

- (void)enrollDeviceInSMSRelay:(id)a3
{
  id v4 = a3;
  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "SMS Service Session Received Request To Enroll %@ Into SMS Relay ", (uint8_t *)&v10, 0xCu);
      }
    }
    char v7 = [(LegacySMSServiceSession *)self idsDeviceFromUniqueID:v4];
    if ([v7 isHSATrusted])
    {
      if (IMOSLoggingEnabled())
      {
        BOOL v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          int v10 = 138412290;
          id v11 = v7;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Automatically enrolling HSA trusted device %@ ", (uint8_t *)&v10, 0xCu);
        }
      }
      [(LegacySMSServiceSession *)self _addDeviceToAllowedSMSRelay:v7 shouldSendApproval:1];
    }
    else
    {
      [(LegacySMSServiceSession *)self _sendPinCodeToDeviceAndPromptForResponse:v4];
    }
  }
  else if (v5)
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "empty deviceID passed in", (uint8_t *)&v10, 2u);
    }
  }
}

- (void)unEnrollDeviceInSMSRelay:(id)a3
{
  id v4 = a3;
  int v5 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v5)
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v10 = 138412290;
        id v11 = v4;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "SMS Service Session Received Request To Un Enroll %@ Into SMS Relay ", (uint8_t *)&v10, 0xCu);
      }
    }
    char v7 = [(LegacySMSServiceSession *)self idsDeviceFromUniqueID:v4];
    [(LegacySMSServiceSession *)self _removeDeviceFromAllowedSMSRelay:v7];
    [(LegacySMSServiceSession *)self sendUnApproveToDevice:v7 extraKeys:0];
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.sms.smsRelayDevices.changed", 0, 0, 0);
  }
  else if (v5)
  {
    id v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      LOWORD(v10) = 0;
      _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "empty deviceID passed in", (uint8_t *)&v10, 2u);
    }
  }
}

- (void)enrollSelfDeviceInSMSRelay
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v4 = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "SMS Service Session Received Request To Enroll ourselves for SMS Relay", v4, 2u);
    }
  }
  [(LegacySMSServiceSession *)self sendApprovalEnrollMe];
}

- (BOOL)isIDInList:(id)a3 ArrayToCheck:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  char v7 = v6;
  if (v6)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v8 = v6;
    id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v14;
      while (2)
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v14 != v10) {
            objc_enumerationMutation(v8);
          }
          if (objc_msgSend(*(id *)(*((void *)&v13 + 1) + 8 * i), "isEqualToString:", v5, (void)v13))
          {
            LOBYTE(v9) = 1;
            goto LABEL_12;
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
LABEL_12:
  }
  else
  {
    LOBYTE(v9) = 0;
  }

  return (char)v9;
}

- (id)_allowedDevicesforSMSRelay
{
  v2 = IMGetCachedDomainValueForKey();
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (id)_allowedIDSDevicesforSMSRelay
{
  id v18 = IMGetCachedDomainValueForKey();
  if (v18)
  {
    id v17 = objc_alloc_init((Class)NSMutableArray);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [(IDSService *)self->_relayService devices];
    id v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v24;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v24 != v5) {
            objc_enumerationMutation(obj);
          }
          char v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v8 = v18;
          id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v20;
            while (2)
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v20 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * (void)j);
                long long v14 = [v7 uniqueID];
                LODWORD(v13) = [v14 isEqualToString:v13];

                if (v13)
                {
                  [v17 addObject:v7];
                  goto LABEL_17;
                }
              }
              id v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
        id v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v4);
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)_ignoredDevicesforSMSRelay
{
  v2 = IMGetCachedDomainValueForKey();
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (id)_ignoredIDSDevicesforSMSRelay
{
  id v18 = IMGetCachedDomainValueForKey();
  if (v18)
  {
    id v17 = objc_alloc_init((Class)NSMutableArray);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [(IDSService *)self->_relayService devices];
    id v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v24;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v24 != v5) {
            objc_enumerationMutation(obj);
          }
          char v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v8 = v18;
          id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v20;
            while (2)
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v20 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * (void)j);
                long long v14 = [v7 uniqueID];
                LODWORD(v13) = [v14 isEqualToString:v13];

                if (v13)
                {
                  [v17 addObject:v7];
                  goto LABEL_17;
                }
              }
              id v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
        id v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v4);
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (id)_challengedDevicesforSMSRelay
{
  v2 = IMGetCachedDomainValueForKey();
  id v3 = v2;
  if (v2) {
    id v4 = v2;
  }

  return v3;
}

- (id)_challengedIDSDevicesforSMSRelay
{
  id v18 = IMGetCachedDomainValueForKey();
  if (v18)
  {
    id v17 = objc_alloc_init((Class)NSMutableArray);
    long long v23 = 0u;
    long long v24 = 0u;
    long long v25 = 0u;
    long long v26 = 0u;
    id obj = [(IDSService *)self->_relayService devices];
    id v3 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
    if (v3)
    {
      id v4 = v3;
      uint64_t v5 = *(void *)v24;
      do
      {
        for (i = 0; i != v4; i = (char *)i + 1)
        {
          if (*(void *)v24 != v5) {
            objc_enumerationMutation(obj);
          }
          char v7 = *(void **)(*((void *)&v23 + 1) + 8 * i);
          long long v19 = 0u;
          long long v20 = 0u;
          long long v21 = 0u;
          long long v22 = 0u;
          id v8 = v18;
          id v9 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
          if (v9)
          {
            id v10 = v9;
            uint64_t v11 = *(void *)v20;
            while (2)
            {
              for (j = 0; j != v10; j = (char *)j + 1)
              {
                if (*(void *)v20 != v11) {
                  objc_enumerationMutation(v8);
                }
                uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * (void)j);
                long long v14 = [v7 uniqueID];
                LODWORD(v13) = [v14 isEqualToString:v13];

                if (v13)
                {
                  [v17 addObject:v7];
                  goto LABEL_17;
                }
              }
              id v10 = [v8 countByEnumeratingWithState:&v19 objects:v27 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }
LABEL_17:
        }
        id v4 = [obj countByEnumeratingWithState:&v23 objects:v28 count:16];
      }
      while (v4);
    }
  }
  else
  {
    id v17 = 0;
  }

  return v17;
}

- (void)_noteDeviceHasMICForSMSRelay:(id)a3
{
  id v4 = a3;
  uint64_t v5 = IMGetCachedDomainValueForKey();
  id v6 = +[NSMutableArray arrayWithArray:v5];
  if (v6)
  {
    char v7 = [v4 uniqueID];
    if ([(LegacySMSServiceSession *)self isIDInList:v7 ArrayToCheck:v6])
    {
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12[0]) = 0;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Told to add an item but we already have its ID, ignoring and moving on.", (uint8_t *)v12, 2u);
        }
      }
    }
    else
    {
      [v6 addObject:v7];
      id v9 = [v6 count];
      if (v9 < [v5 count] && IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v12[0] = 67109376;
          v12[1] = [v6 count];
          __int16 v13 = 1024;
          unsigned int v14 = [v5 count];
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", (uint8_t *)v12, 0xEu);
        }
      }
      if (![v6 count] && IMOSLoggingEnabled())
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12[0]) = 0;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", (uint8_t *)v12, 2u);
        }
      }
      IMSetDomainValueForKey();
      IMSyncronizeAppPreferences();
    }
  }
}

- (void)_removeDeviceHasMICForSMSRelay:(id)a3
{
  id v3 = a3;
  id v4 = IMGetCachedDomainValueForKey();
  uint64_t v5 = +[NSMutableArray arrayWithArray:v4];
  if (v5)
  {
    id v6 = [v3 uniqueID];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          uint64_t v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqualToString:", v6, (void)v17))
          {
            [v7 removeObject:v11];
            id v12 = [v7 count];
            if (v12 < [v4 count] && IMOSLoggingEnabled())
            {
              __int16 v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                unsigned int v14 = [v7 count];
                unsigned int v15 = [v4 count];
                *(_DWORD *)buf = 67109376;
                unsigned int v22 = v14;
                __int16 v23 = 1024;
                unsigned int v24 = v15;
                _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "_removeDeviceFromMICSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", buf, 0xEu);
              }
            }
            if (![v7 count] && IMOSLoggingEnabled())
            {
              long long v16 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "_removeDeviceFromMICSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", buf, 2u);
              }
            }
            IMSetDomainValueForKey();
            IMSyncronizeAppPreferences();
            goto LABEL_22;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
}

- (void)_addDeviceToAllowedSMSRelay:(id)a3 shouldSendApproval:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  id v7 = IMGetCachedDomainValueForKey();
  id v8 = +[NSMutableArray arrayWithArray:v7];
  if (v8)
  {
    uint64_t v9 = [v6 uniqueID];
    if ([(LegacySMSServiceSession *)self isIDInList:v9 ArrayToCheck:v8])
    {
      if (IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17[0]) = 0;
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Told to add an item but we allready have its ID, moving on", (uint8_t *)v17, 2u);
        }
      }
    }
    else
    {
      [v8 addObject:v9];
      id v11 = [v8 count];
      if (v11 < [v7 count] && IMOSLoggingEnabled())
      {
        id v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          v17[0] = 67109376;
          v17[1] = [v8 count];
          __int16 v18 = 1024;
          unsigned int v19 = [v7 count];
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", (uint8_t *)v17, 0xEu);
        }
      }
      if (![v8 count] && IMOSLoggingEnabled())
      {
        __int16 v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17[0]) = 0;
          _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", (uint8_t *)v17, 2u);
        }
      }
      IMSetDomainValueForKey();
      IMSyncronizeAppPreferences();
      unsigned int v14 = +[IMFeatureFlags sharedFeatureFlags];
      unsigned int v15 = [v14 isSMSFilterSyncEnabled];

      if (v15
        && +[IMSMSFilterHelper IDSDeviceSupportsIncomingSMSRelayFilteringForDeviceType:](IMSMSFilterHelper, "IDSDeviceSupportsIncomingSMSRelayFilteringForDeviceType:", [v6 deviceType]))
      {
        if (IMOSLoggingEnabled())
        {
          long long v16 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
          {
            LOWORD(v17[0]) = 0;
            _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Added device for relay. Relaying current SMS Filtering settings.", (uint8_t *)v17, 2u);
          }
        }
        [(LegacySMSServiceSession *)self _relayCurrentSMSFilteringSettings];
      }
    }
  }
  if (v4) {
    [(LegacySMSServiceSession *)self sendApprovalResponseToDevice:v6 enteredCorrectly:1 wasCancelled:0];
  }
}

- (void)_removeDeviceFromAllowedSMSRelay:(id)a3
{
  id v3 = a3;
  BOOL v4 = IMGetCachedDomainValueForKey();
  uint64_t v5 = +[NSMutableArray arrayWithArray:v4];
  if (v5)
  {
    id v6 = [v3 uniqueID];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqualToString:", v6, (void)v17))
          {
            [v7 removeObject:v11];
            id v12 = [v7 count];
            if (v12 < [v4 count] && IMOSLoggingEnabled())
            {
              __int16 v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                unsigned int v14 = [v7 count];
                unsigned int v15 = [v4 count];
                *(_DWORD *)buf = 67109376;
                unsigned int v22 = v14;
                __int16 v23 = 1024;
                unsigned int v24 = v15;
                _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "_removeDeviceFromAllowedSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", buf, 0xEu);
              }
            }
            if (![v7 count] && IMOSLoggingEnabled())
            {
              long long v16 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "_removeDeviceFromAllowedSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", buf, 2u);
              }
            }
            IMSetDomainValueForKey();
            IMSyncronizeAppPreferences();
            goto LABEL_22;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
}

- (void)_addDeviceToIgnoredSMSRelay:(id)a3
{
  id v4 = a3;
  uint64_t v5 = IMGetCachedDomainValueForKey();
  id v6 = +[NSMutableArray arrayWithArray:v5];
  if (v6)
  {
    id v7 = [v4 uniqueID];
    if ([(LegacySMSServiceSession *)self isIDInList:v7 ArrayToCheck:v6])
    {
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12[0]) = 0;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Told to add an iteam but we allready have its ID, moving on", (uint8_t *)v12, 2u);
        }
      }
    }
    else
    {
      [v6 addObject:v7];
      id v9 = [v6 count];
      if (v9 < [v5 count] && IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v12[0] = 67109376;
          v12[1] = [v6 count];
          __int16 v13 = 1024;
          unsigned int v14 = [v5 count];
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: newIgnoredDeviceUUIDs count: %d ignoredDeviceUUIDs count: %d", (uint8_t *)v12, 0xEu);
        }
      }
      if (![v6 count] && IMOSLoggingEnabled())
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12[0]) = 0;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "_addDeviceToIgnoredSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", (uint8_t *)v12, 2u);
        }
      }
      IMSetDomainValueForKey();
      IMSyncronizeAppPreferences();
    }
  }
}

- (void)_removeDeviceFromIgnoredSMSRelay:(id)a3
{
  id v3 = a3;
  id v4 = IMGetCachedDomainValueForKey();
  uint64_t v5 = +[NSMutableArray arrayWithArray:v4];
  if (v5)
  {
    id v6 = [v3 uniqueID];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqualToString:", v6, (void)v17))
          {
            [v7 removeObject:v11];
            id v12 = [v7 count];
            if (v12 < [v4 count] && IMOSLoggingEnabled())
            {
              __int16 v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                unsigned int v14 = [v7 count];
                unsigned int v15 = [v4 count];
                *(_DWORD *)buf = 67109376;
                unsigned int v22 = v14;
                __int16 v23 = 1024;
                unsigned int v24 = v15;
                _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "_removeDeviceFromIgnoredSMSRelay: newIgnoredDeviceUUIDs count: %d ignoredDeviceUUIDs count: %d", buf, 0xEu);
              }
            }
            if (![v7 count] && IMOSLoggingEnabled())
            {
              long long v16 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "_removeDeviceFromIgnoredSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", buf, 2u);
              }
            }
            IMSetDomainValueForKey();
            IMSyncronizeAppPreferences();
            goto LABEL_22;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
}

- (void)_addDeviceToChallengedSMSRelay:(id)a3
{
  id v4 = a3;
  uint64_t v5 = IMGetCachedDomainValueForKey();
  id v6 = +[NSMutableArray arrayWithArray:v5];
  if (v6)
  {
    id v7 = [v4 uniqueID];
    if ([(LegacySMSServiceSession *)self isIDInList:v7 ArrayToCheck:v6])
    {
      if (IMOSLoggingEnabled())
      {
        id v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12[0]) = 0;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Told to add an iteam but we allready have its ID, moving on", (uint8_t *)v12, 2u);
        }
      }
    }
    else
    {
      [v6 addObject:v7];
      id v9 = [v6 count];
      if (v9 < [v5 count] && IMOSLoggingEnabled())
      {
        id v10 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
        {
          v12[0] = 67109376;
          v12[1] = [v6 count];
          __int16 v13 = 1024;
          unsigned int v14 = [v5 count];
          _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", (uint8_t *)v12, 0xEu);
        }
      }
      if (![v6 count] && IMOSLoggingEnabled())
      {
        id v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          LOWORD(v12[0]) = 0;
          _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "_addDeviceToIgnoredSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", (uint8_t *)v12, 2u);
        }
      }
      IMSetDomainValueForKey();
      IMSyncronizeAppPreferences();
    }
  }
}

- (void)_removeDeviceFromChallengedSMSRelay:(id)a3
{
  id v3 = a3;
  id v4 = IMGetCachedDomainValueForKey();
  uint64_t v5 = +[NSMutableArray arrayWithArray:v4];
  if (v5)
  {
    id v6 = [v3 uniqueID];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = v5;
    id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
    if (v8)
    {
      uint64_t v9 = *(void *)v18;
      while (2)
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v18 != v9) {
            objc_enumerationMutation(v7);
          }
          id v11 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (objc_msgSend(v11, "isEqualToString:", v6, (void)v17))
          {
            [v7 removeObject:v11];
            id v12 = [v7 count];
            if (v12 < [v4 count] && IMOSLoggingEnabled())
            {
              __int16 v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                unsigned int v14 = [v7 count];
                unsigned int v15 = [v4 count];
                *(_DWORD *)buf = 67109376;
                unsigned int v22 = v14;
                __int16 v23 = 1024;
                unsigned int v24 = v15;
                _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "_addDeviceToAllowedSMSRelay: newAllowedDeviceUUIDs count: %d allowedDeviceUUIDs count: %d", buf, 0xEu);
              }
            }
            if (![v7 count] && IMOSLoggingEnabled())
            {
              long long v16 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
              {
                *(_WORD *)buf = 0;
                _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "_addDeviceToIgnoredSMSRelay: going to write an empty dictionary to the kSMSDefaultsAllowedKey", buf, 2u);
              }
            }
            IMSetDomainValueForKey();
            IMSyncronizeAppPreferences();
            goto LABEL_22;
          }
        }
        id v8 = [v7 countByEnumeratingWithState:&v17 objects:v25 count:16];
        if (v8) {
          continue;
        }
        break;
      }
    }
LABEL_22:
  }
}

- (void)_sendPinCodeToDeviceAndPromptForResponse:(id)a3
{
  id v22 = a3;
  id v4 = -[LegacySMSServiceSession idsDeviceFromUniqueID:](self, "idsDeviceFromUniqueID:");
  if (!v4 && IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v26 = v22;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Tried to enroll a device that doesnt excist in our set of devices or was nil %@", buf, 0xCu);
    }
  }
  if ([(LegacySMSServiceSession *)self sendApprovalDisplayPinToDevice:v4])
  {
    id v6 = +[NSBundle bundleForClass:objc_opt_class()];
    id v7 = [v4 modelIdentifier];
    long long v21 = +[IMDeviceSupport marketingNameForModel:v7];

    long long v20 = [v4 name];
    long long v19 = [v6 localizedStringForKey:@"ENTER_THE_CODE_SHOWN_ON_YOUR_DEVICE_FOR_SMS_RELAY" value:&stru_8F4F0 table:@"SMSLocalizable"];
    long long v18 = [v6 localizedStringForKey:@"Text Message Forwarding" value:&stru_8F4F0 table:@"SMSLocalizable"];
    id v8 = [v6 localizedStringForKey:@"Allow" value:&stru_8F4F0 table:@"SMSLocalizable"];
    uint64_t v9 = [v6 localizedStringForKey:@"Cancel" value:&stru_8F4F0 table:@"SMSLocalizable"];
    id v10 = +[NSString stringWithFormat:](NSString, "stringWithFormat:", v19, v21, v20);
    id v11 = +[NSArray arrayWithObject:&stru_8F4F0];
    id v12 = +[NSArray arrayWithObject:&stru_8F4F0];
    __int16 v13 = +[NSNumber numberWithInt:5];
    unsigned int v14 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v18, IMUserNotificationTitleKey, v10, IMUserNotificationMessageKey, v11, IMUserNotificationTextFieldValuesKey, v12, IMUserNotificationTextFieldTitlesKey, v8, IMUserNotificationDefaultButtonTitleKey, v9, IMUserNotificationAlternateButtonTitleKey, v13, kCFUserNotificationKeyboardTypesKey, 0);

    unsigned int v15 = +[IMUserNotification userNotificationWithIdentifier:@"SMSRelayCodeInput" timeout:3 alertLevel:0 displayFlags:v14 displayInformation:0.0];
    long long v16 = +[IMUserNotificationCenter sharedInstance];
    v23[0] = _NSConcreteStackBlock;
    v23[1] = 3221225472;
    v23[2] = sub_4023C;
    v23[3] = &unk_8DC90;
    v23[4] = self;
    id v24 = v4;
    [v16 addUserNotification:v15 listener:0 completionHandler:v23];
  }
  else if (IMOSLoggingEnabled())
  {
    long long v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "We were unable to send the PIN to the other device to be displayed, Sorry", buf, 2u);
    }
  }
}

- (BOOL)sendApprovalDisplayPinToDevice:(id)a3
{
  id v4 = a3;
  unint64_t v5 = [(LegacySMSServiceSession *)self randomSixDigitCode];
  if (!self->_pendingCodesToDevicesForApproval)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    pendingCodesToDevicesForApproval = self->_pendingCodesToDevicesForApproval;
    self->_pendingCodesToDevicesForApproval = Mutable;
  }
  id v8 = +[NSNumber numberWithUnsignedInteger:v5];
  if (v8)
  {
    uint64_t v9 = self->_pendingCodesToDevicesForApproval;
    id v10 = [v4 uniqueID];
    CFDictionarySetValue((CFMutableDictionaryRef)v9, v10, v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_5EF38(v4);
  }

  id v11 = +[NSNumber numberWithUnsignedInteger:v5];
  id v12 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v11, off_997A0, 0);

  __int16 v13 = JWEncodeDictionary();
  id v14 = [v13 _FTCopyGzippedData];
  unsigned int v15 = +[NSNumber numberWithInteger:142];
  long long v16 = StringGUID();
  long long v17 = IDSGetUUIDData();
  long long v18 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
  long long v19 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey, v15, IDSSendMessageOptionCommandKey, v17, IDSSendMessageOptionUUIDKey, v14, IDSSendMessageOptionDataToEncryptKey, v18, IDSSendMessageOptionTimeoutKey, 0);

  if (IMOSLoggingEnabled())
  {
    long long v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      long long v21 = [v4 name];
      *(_DWORD *)buf = 138412290;
      long long v25 = v21;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Sending a Pin Code To Device %@  to display to enroll them into SMS Relay", buf, 0xCu);
    }
  }
  BOOL v22 = [(LegacySMSServiceSession *)self sendEnrollmentRelatedMessageOverIDS:v19 deviceToSendTo:v4];

  return v22;
}

- (void)sendApprovalEnrollMe
{
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "SMS Service session received request to enroll ourselves into SMS Relay", buf, 2u);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "SMS Service session received request to enroll ourselves into SMS Relay", buf, 2u);
    }
  }
  unint64_t v5 = [(LegacySMSServiceSession *)self _dominentPhoneNumberAlias];
  id v6 = [(LegacySMSServiceSession *)self _callerIDForRelay];
  if ([v6 _appearsToBePhoneNumber]
    && [(LegacySMSServiceSession *)self _isAliasActiveForSMSRelay:v6])
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "This device has a callerID set to a phone number, That phone number is SMS Relay enabled, we should use that ", buf, 2u);
      }
    }
    id v8 = v6;
    if (!v8)
    {
LABEL_46:
      if (IMOSLoggingEnabled())
      {
        id v26 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "We are unable to send any request for enabling SMS Relay for ourselves, we know of no phone with an alias we can use!!!!!", buf, 2u);
        }
      }
      id v8 = 0;
      goto LABEL_51;
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "This device does not have a callerID set, so we are going to use the Dominent phone number one if possible ", buf, 2u);
      }
    }
    if (!v5) {
      goto LABEL_46;
    }
    id v8 = v5;
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "It is possible to use the Dominent phone number alias, thats awesome, lets go for it", buf, 2u);
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "We have an alias, we know where to send this request, lets go for it", buf, 2u);
    }
  }
  id v12 = +[IMDCKUtilities sharedInstance];
  unsigned int v13 = [v12 cloudKitSyncingEnabled];

  if (v13)
  {
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "MOC is ON including in this enrollment payload", buf, 2u);
      }
    }
    long long v29 = off_99948;
    long long v30 = &off_90D98;
    unsigned int v15 = +[NSDictionary dictionaryWithObjects:&v30 forKeys:&v29 count:1];
    long long v16 = JWEncodeDictionary();
    id v17 = [v16 _FTCopyGzippedData];
  }
  else
  {
    id v17 = 0;
  }
  long long v18 = +[NSNumber numberWithInteger:148];
  long long v19 = StringGUID();
  long long v20 = IDSGetUUIDData();
  long long v21 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
  +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey, v18, IDSSendMessageOptionCommandKey, v20, IDSSendMessageOptionUUIDKey, v21, IDSSendMessageOptionTimeoutKey, 0);
  BOOL v22 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();

  if (v17) {
    CFDictionarySetValue(v22, IDSSendMessageOptionDataToEncryptKey, v17);
  }
  __int16 v23 = [(LegacySMSServiceSession *)self _deviceForCallerID:v8];
  if (v23)
  {
    if (IMOSLoggingEnabled())
    {
      id v24 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
      {
        long long v25 = [v23 name];
        *(_DWORD *)buf = 138412290;
        long long v28 = v25;
        _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Asking for device %@  to enroll me into SMS Relay", buf, 0xCu);
      }
    }
    [(LegacySMSServiceSession *)self sendEnrollmentRelatedMessageOverIDS:v22 deviceToSendTo:v23];
  }

LABEL_51:
}

- (void)sendApprovalResponseToDevice:(id)a3 enteredCorrectly:(BOOL)a4 wasCancelled:(BOOL)a5
{
  BOOL v5 = a5;
  BOOL v6 = a4;
  id v8 = a3;
  uint64_t v9 = +[NSNumber numberWithBool:v6];
  id v10 = off_997A8;
  id v11 = +[NSNumber numberWithBool:v5];
  id v12 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v9, v10, v11, off_997B0, 0);

  unsigned int v13 = JWEncodeDictionary();
  id v14 = [v13 _FTCopyGzippedData];
  unsigned int v15 = StringGUID();
  long long v16 = +[NSNumber numberWithInteger:145];
  id v17 = IDSGetUUIDData();
  long long v18 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
  long long v19 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey, v16, IDSSendMessageOptionCommandKey, v17, IDSSendMessageOptionUUIDKey, v14, IDSSendMessageOptionDataToEncryptKey, v18, IDSSendMessageOptionTimeoutKey, 0);

  if (IMOSLoggingEnabled())
  {
    long long v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      long long v21 = [v8 name];
      *(_DWORD *)buf = 138412802;
      __int16 v23 = v21;
      __int16 v24 = 2112;
      long long v25 = v15;
      __int16 v26 = 2112;
      long long v27 = v12;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Sending an Approval response message to device %@ message guid %@ with information %@ ", buf, 0x20u);
    }
  }
  [(LegacySMSServiceSession *)self sendEnrollmentRelatedMessageOverIDS:v19 deviceToSendTo:v8];
}

- (void)sendUnApproveToDevice:(id)a3 extraKeys:(id)a4
{
  id v19 = a3;
  id v5 = a4;
  +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", &__kCFBooleanTrue, off_997B8, 0);
  BOOL v6 = (__CFDictionary *)objc_claimAutoreleasedReturnValue();
  CFMutableDictionaryRef v7 = v6;
  if (v5)
  {
    CFMutableDictionaryRef Mutable = (CFMutableDictionaryRef)[(__CFDictionary *)v6 mutableCopy];
    if (!Mutable) {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    [(__CFDictionary *)Mutable addEntriesFromDictionary:v5];

    CFMutableDictionaryRef v7 = Mutable;
  }
  uint64_t v9 = JWEncodeDictionary();
  id v10 = [v9 _FTCopyGzippedData];
  id v11 = StringGUID();
  id v12 = +[NSNumber numberWithInteger:145];
  unsigned int v13 = IDSGetUUIDData();
  id v14 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
  unsigned int v15 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", &__kCFBooleanTrue, IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey, v12, IDSSendMessageOptionCommandKey, v13, IDSSendMessageOptionUUIDKey, v10, IDSSendMessageOptionDataToEncryptKey, v14, IDSSendMessageOptionTimeoutKey, 0);

  if (IMOSLoggingEnabled())
  {
    long long v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      id v17 = [v19 name];
      *(_DWORD *)buf = 138412546;
      long long v21 = v17;
      __int16 v22 = 2112;
      __int16 v23 = v11;
      _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Sending an Un-Approve message to device %@ message guid %@", buf, 0x16u);
    }
  }
  [(LegacySMSServiceSession *)self sendEnrollmentRelatedMessageOverIDS:v15 deviceToSendTo:v19];
}

- (unint64_t)randomSixDigitCode
{
  return (int)(arc4random_uniform(0xDBB9Fu) + 100000);
}

- (BOOL)sendEnrollmentRelatedMessageOverIDS:(id)a3 deviceToSendTo:(id)a4
{
  id v6 = a3;
  id v29 = a4;
  long long v27 = [(IDSService *)self->_relayService accounts];
  id v7 = [(LegacySMSServiceSession *)self retrieveAccountAndPhoneAliasForAccounts:v27 shouldFilterRecepients:0 requestProxySend:0 preferredCallerID:0];
  id v8 = [v7 first];
  uint64_t v9 = [v7 second];
  if (v9)
  {
    long long v28 = v8;
  }
  else
  {
    id v10 = [v29 linkedUserURIs];
    uint64_t v9 = [v10 firstObject];

    id v11 = [(IDSService *)self->_relayService accounts];
    long long v28 = [(LegacySMSServiceSession *)self accountForAlias:v9 fromAccounts:v11];

    if (IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "This is a non telphony device trying to enroll itself into SMS Relay", buf, 2u);
      }
    }
  }
  unsigned int v13 = [(LegacySMSServiceSession *)self _destinationForDevice:v29 forcedIdentity:v9];
  CFMutableDictionaryRef Mutable = (__CFDictionary *)[v6 mutableCopy];
  if (!Mutable) {
    CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  }
  unsigned int v15 = (void *)IDSCopyIDForPhoneNumber();
  if (v15)
  {
    CFDictionarySetValue(Mutable, IDSSendMessageOptionFromIDKey, v15);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_5EE38();
  }

  long long v16 = Mutable;
  [(LegacySMSServiceSession *)self _checkAndSetRelayService];
  relayService = self->_relayService;
  long long v18 = +[NSDictionary dictionary];
  id v19 = IMSingleObjectArray();
  long long v20 = objc_msgSend(v19, "__imSetFromArray");
  id v30 = 0;
  id v31 = 0;
  unsigned int v21 = +[IMIDSService service:relayService sendMessage:v18 fromAccount:v28 toDestinations:v20 priority:300 options:v16 identifier:&v31 error:&v30];
  id v22 = v31;
  id v23 = v30;

  if (IMOSLoggingEnabled())
  {
    __int16 v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      CFStringRef v25 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v33 = v9;
      if (v21) {
        CFStringRef v25 = @"YES";
      }
      __int16 v34 = 2112;
      CFStringRef v35 = v25;
      __int16 v36 = 2112;
      id v37 = v23;
      __int16 v38 = 2112;
      long long v39 = v28;
      __int16 v40 = 2112;
      id v41 = v22;
      _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "SMS relay Enrollment data sent to: %@   success: %@   error: %@   account: %@  identifier %@", buf, 0x34u);
    }
  }
  return v21;
}

- (id)idsDeviceFromPushToken:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(IDSService *)self->_relayService devices];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 pushToken];
        unsigned int v11 = [v10 isEqualToData:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)idsDeviceFromUniqueID:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(IDSService *)self->_relayService devices];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        uint64_t v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        id v10 = [v9 uniqueID];
        unsigned int v11 = [v10 isEqualToString:v4];

        if (v11)
        {
          id v6 = v9;
          goto LABEL_11;
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v6;
}

- (id)idsDeviceForFromID:(id)a3
{
  return [(IDSService *)self->_relayService deviceForFromID:a3];
}

- (id)_callerIDUsingFromIdentifier:(id)a3
{
  id v3 = a3;
  if ([v3 hasPrefix:@"device:"])
  {
    id v4 = 0;
  }
  else
  {
    id v4 = [v3 _stripFZIDPrefix];
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        id v8 = v4;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Stripping FZIDPrefix, after: %@", (uint8_t *)&v7, 0xCu);
      }
    }
  }

  return v4;
}

- (unint64_t)capabilities
{
  return 1592;
}

- (void)refreshServiceCapabilities
{
  id v4 = [(LegacySMSServiceSession *)self broadcaster];
  id v3 = [(LegacySMSServiceSession *)self accountID];
  objc_msgSend(v4, "account:capabilitiesChanged:", v3, -[LegacySMSServiceSession capabilities](self, "capabilities"));
}

- (BOOL)_storeSpamCompletionBlock:(id)a3 forMessageGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 length];
  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = !v9;
  if (!v9)
  {
    unsigned int v11 = [(NSMutableDictionary *)self->_spamBlockMap objectForKey:v7];
    if (v11 && IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412546;
        id v22 = v7;
        __int16 v23 = 2112;
        __int16 v24 = v11;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Using existing mapping mapping from %@ to %@", (uint8_t *)&v21, 0x16u);
      }
    }
    spamBlockMap = self->_spamBlockMap;
    if (!spamBlockMap)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      p_spamBlockMap = &self->_spamBlockMap;
      long long v16 = *p_spamBlockMap;
      *p_spamBlockMap = (NSMutableDictionary *)Mutable;

      spamBlockMap = *p_spamBlockMap;
    }
    id v17 = [v6 copy];
    [(NSMutableDictionary *)spamBlockMap setObject:v17 forKey:v7];

    if (IMOSLoggingEnabled())
    {
      long long v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = objc_retainBlock(v6);
        int v21 = 138412546;
        id v22 = v7;
        __int16 v23 = 2112;
        __int16 v24 = v19;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Generated mapping from %@ to %@", (uint8_t *)&v21, 0x16u);
      }
    }
LABEL_23:

    goto LABEL_24;
  }
  if (IMOSLoggingEnabled())
  {
    unsigned int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Cannot store completion block for guid as either guid or completion block is invalid", (uint8_t *)&v21, 2u);
    }
    goto LABEL_23;
  }
LABEL_24:

  return v10;
}

- (void)_executeSpamCompletionBlockForMessageGuid:(id)a3 category:(int64_t)a4 subCategory:(int64_t)a5 shouldRegister:(BOOL)a6 receivedViaRelay:(BOOL)a7
{
  BOOL v8 = a6;
  id v12 = a3;
  long long v13 = [(NSMutableDictionary *)self->_spamBlockMap objectForKey:v12];
  if (v13)
  {
    if ([(LegacySMSServiceSession *)self _isMessageCategorized:a4])
    {
      long long v14 = [(LegacySMSServiceSession *)self _getSpamExtensionName];
    }
    else
    {
      long long v14 = 0;
    }
    ((void (**)(void, BOOL, int64_t, int64_t, void *))v13)[2](v13, v8, a4, a5, v14);
    [(LegacySMSServiceSession *)self _clearSpamMapForMessageGUID:v12];
  }
  else if (IMOSLoggingEnabled())
  {
    long long v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      int v18 = 138412290;
      id v19 = v12;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "executeSpamCompletionBlockForMessageGuid: %@ Aready ran completion block, not doing anything", (uint8_t *)&v18, 0xCu);
    }
  }
  long long v16 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned __int8 v17 = [v16 isSMSFilterSyncEnabled];

  if ((v17 & 1) == 0)
  {
    if (a7) {
      [(LegacySMSServiceSession *)self _clearSMSRelayMapForMessageWithGUID:v12];
    }
    else {
      [(LegacySMSServiceSession *)self _executeSMSRelayBlockForMessageWithGUID:v12 category:a4 subCategory:a5];
    }
  }
}

- (void)_clearSpamMapForMessageGUID:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Clearing spam block mapping for %@", (uint8_t *)&v7, 0xCu);
    }
  }
  if (v4)
  {
    [(NSMutableDictionary *)self->_spamBlockMap removeObjectForKey:v4];
    if (![(NSMutableDictionary *)self->_spamBlockMap count])
    {
      spamBlockMap = self->_spamBlockMap;
      self->_spamBlockMap = 0;
    }
  }
}

- (void)_prepareSMSRelayBlockForMessageDictionary:(id)a3 messageGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id location = 0;
  objc_initWeak(&location, self);
  BOOL v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  id v12 = sub_4259C;
  long long v13 = &unk_8DCB8;
  id v8 = v6;
  id v14 = v8;
  long long v15 = self;
  objc_copyWeak(&v16, &location);
  BOOL v9 = objc_retainBlock(&v10);
  -[LegacySMSServiceSession _storeSMSRelayExecutionBlock:forMessageGUID:](self, "_storeSMSRelayExecutionBlock:forMessageGUID:", v9, v7, v10, v11, v12, v13);

  objc_destroyWeak(&v16);
  objc_destroyWeak(&location);
}

- (BOOL)_storeSMSRelayExecutionBlock:(id)a3 forMessageGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 length];
  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = !v9;
  if (!v9)
  {
    uint64_t v11 = [(NSMutableDictionary *)self->_smsRelayBlockMap objectForKey:v7];
    if (v11 && IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412546;
        id v22 = v7;
        __int16 v23 = 2112;
        __int16 v24 = v11;
        _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Using existing spam relay mapping from %@ to %@", (uint8_t *)&v21, 0x16u);
      }
    }
    smsRelayBlockMap = self->_smsRelayBlockMap;
    if (!smsRelayBlockMap)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      p_smsRelayBlockMap = &self->_smsRelayBlockMap;
      id v16 = *p_smsRelayBlockMap;
      *p_smsRelayBlockMap = (NSMutableDictionary *)Mutable;

      smsRelayBlockMap = *p_smsRelayBlockMap;
    }
    id v17 = [v6 copy];
    [(NSMutableDictionary *)smsRelayBlockMap setObject:v17 forKey:v7];

    if (IMOSLoggingEnabled())
    {
      int v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = objc_retainBlock(v6);
        int v21 = 138412546;
        id v22 = v7;
        __int16 v23 = 2112;
        __int16 v24 = v19;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Generated mapping spam relay from %@ to %@", (uint8_t *)&v21, 0x16u);
      }
    }
LABEL_23:

    goto LABEL_24;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Cannot store spam relay completion block for guid as either guid or completion block is invalid", (uint8_t *)&v21, 2u);
    }
    goto LABEL_23;
  }
LABEL_24:

  return v10;
}

- (void)_executeSMSRelayBlockForMessageWithGUID:(id)a3
{
}

- (void)_executeSMSRelayBlockForMessageWithGUID:(id)a3 category:(int64_t)a4 subCategory:(int64_t)a5
{
  id v8 = a3;
  uint64_t v9 = [(NSMutableDictionary *)self->_smsRelayBlockMap objectForKey:v8];
  BOOL v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, int64_t, int64_t))(v9 + 16))(v9, a4, a5);
    [(LegacySMSServiceSession *)self _clearSMSRelayMapForMessageWithGUID:v8];
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "_executeSpamRelayCompletionBlockForMessageGuid: %@ Aready ran completion block?, not doing anything", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_clearSMSRelayMapForMessageWithGUID:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Clearing SMS relay block mapping for %@", (uint8_t *)&v7, 0xCu);
    }
  }
  if (v4)
  {
    [(NSMutableDictionary *)self->_smsRelayBlockMap removeObjectForKey:v4];
    if (![(NSMutableDictionary *)self->_smsRelayBlockMap count])
    {
      smsRelayBlockMap = self->_smsRelayBlockMap;
      self->_smsRelayBlockMap = 0;
    }
  }
}

- (BOOL)_areAllParticipantsUnknown:(id)a3 fromSender:(id)a4
{
  id v5 = a4;
  id v6 = v5;
  if (a3)
  {
    LOBYTE(v7) = IMDAreAllAliasesUnknown();
  }
  else
  {
    id v10 = v5;
    id v8 = +[NSArray arrayWithObjects:&v10 count:1];
    uint64_t v7 = IMDAreAllAliasesUnknown();
  }
  return v7;
}

- (BOOL)_isMessageCategorized:(int64_t)a3
{
  return a3 == 4 || (a3 & 0xFFFFFFFFFFFFFFFELL) == 2;
}

- (BOOL)_isSpamFilteringEnabled
{
  return IMGetDomainBoolForKey();
}

- (id)_getSpamExtensionID
{
  return (id)IMGetDomainValueForKey();
}

- (id)_getSpamExtensionName
{
  return (id)IMGetDomainValueForKey();
}

- (id)_createNewChatIdentifierFromChatIdentifier:(id)a3 andCategoryLabel:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if ([v6 length])
  {
    id v7 = [v5 stringByAppendingFormat:@"(%@)", v6];
  }
  else
  {
    id v7 = v5;
  }
  id v8 = v7;

  return v8;
}

- (void)_categorizeRelayMessageWithCategory:(int64_t)a3 subCategory:(int64_t)a4 deviceID:(id)a5 shouldRegister:(BOOL)a6 completion:(id)a7
{
  BOOL v8 = a6;
  id v12 = a5;
  id v13 = (void (**)(id, BOOL, int64_t, int64_t, void *))a7;
  id v14 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v15 = [v14 isSMSFilterSyncEnabled];

  if (v15)
  {
    if ([v12 length]
      && [(LegacySMSServiceSession *)self _isMessageCategorized:a3])
    {
      if (IMOSLoggingEnabled())
      {
        id v16 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
        {
          int v21 = 134218240;
          int64_t v22 = a3;
          __int16 v23 = 2048;
          int64_t v24 = a4;
          _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Relayed message was categorized on iPhone. Received category: %ld and subCategory: %ld.", (uint8_t *)&v21, 0x16u);
        }
      }
      if (a4
        && (+[IMSMSFilterCapabilitiesSyncHelper isValidSubActionForDeviceID:v12 action:a3 subAction:a4] & 1) == 0)
      {
        if (IMOSLoggingEnabled())
        {
          id v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            int v21 = 134218240;
            int64_t v22 = a4;
            __int16 v23 = 2048;
            int64_t v24 = a3;
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "%ld is not a valid subAction for category: %ld. Resetting subCategory to None", (uint8_t *)&v21, 0x16u);
          }
        }
        a4 = 0;
      }
      int v18 = +[IMSMSFilterCapabilitiesSyncHelper fetchFilterExtensionNameForDeviceID:v12];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Relayed message was not categorized on iPhone or device ID is invalid.", (uint8_t *)&v21, 2u);
        }
      }
      int v18 = 0;
      a4 = 0;
      a3 = 0;
    }
    if (![v18 length])
    {
      if (IMOSLoggingEnabled())
      {
        long long v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          LOWORD(v21) = 0;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Received Device ID has no extension Name. Resetting category and subCategory to None", (uint8_t *)&v21, 2u);
        }
      }
      a4 = 0;
      a3 = 0;
    }
    v13[2](v13, v8, a3, a4, v18);
  }
}

- (void)_smsSpamCheck:(id)a3 withMessageBody:(id)a4 withGuid:(id)a5 sender:(id)a6 shouldRegister:(BOOL)a7 receiverISOCountryCode:(id)a8 receivedViaRelay:(BOOL)a9
{
  BOOL v9 = a7;
  id v15 = a8;
  id v16 = a6;
  id v17 = a5;
  id v18 = a4;
  [(LegacySMSServiceSession *)self _storeSpamCompletionBlock:a3 forMessageGUID:v17];
  [(LegacySMSServiceSession *)self _checkIfMessageIsSpam:v18 fromSender:v16 withGuid:v17 shouldRegister:v9 receiverISOCountryCode:v15 receivedViaRelay:a9];
}

- (BOOL)_shouldCheckChatForSMSSpam:(id)a3 shouldRegister:(BOOL)a4 participants:(id)a5 sender:(id)a6 fallbackFilterCategory:(int64_t *)a7 fallbackFilterSubCategory:(int64_t *)a8
{
  id v13 = a3;
  id v14 = a5;
  id v15 = a6;
  if (!+[IMSpamFilterHelper isFilterUnknownSendersEnabled]|| ![(LegacySMSServiceSession *)self _isSpamFilteringEnabled])
  {
    if (!IMOSLoggingEnabled())
    {
LABEL_14:
      BOOL v19 = 0;
      goto LABEL_15;
    }
    long long v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      LOWORD(v22) = 0;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: not checking for sms spam, filter is off", (uint8_t *)&v22, 2u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (![(LegacySMSServiceSession *)self _areAllParticipantsUnknown:v14 fromSender:v15])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_14;
    }
    long long v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v13;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: not checking sms spam, chatid %@ has known participants", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_13;
  }
  uint64_t v16 = [(LegacySMSServiceSession *)self _numberOfRepliesFor:v13 fallbackFilterCategory:a7 fallbackFilterSubCategory:a8];
  int v17 = IMOSLoggingEnabled();
  if (v16 >= 3)
  {
    if (!v17) {
      goto LABEL_14;
    }
    long long v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v13;
      _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: not checking sms spam, chatid %@ has 3 replies or more", (uint8_t *)&v22, 0xCu);
    }
    goto LABEL_13;
  }
  if (v17)
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v22 = 138412290;
      id v23 = v13;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "_shouldCheckForSMSSpam: checking SMS spam for chatid %@", (uint8_t *)&v22, 0xCu);
    }
  }
  BOOL v19 = 1;
LABEL_15:

  return v19;
}

- (int64_t)_numberOfRepliesFor:(id)a3 fallbackFilterCategory:(int64_t *)a4 fallbackFilterSubCategory:(int64_t *)a5
{
  long long v27 = a4;
  long long v28 = a5;
  id v36 = a3;
  v47[0] = &stru_8F4F0;
  v47[1] = @"smsft";
  v47[2] = @"smsfp";
  v47[3] = @"filtered";
  +[NSArray arrayWithObjects:v47 count:4];
  long long v41 = 0u;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  id obj = (id)objc_claimAutoreleasedReturnValue();
  id v34 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
  id v6 = 0;
  id v7 = 0;
  int64_t v8 = 0;
  id v9 = 0;
  if (v34)
  {
    uint64_t v32 = *(void *)v42;
    do
    {
      for (i = 0; i != v34; i = (char *)i + 1)
      {
        id v11 = v9;
        id v12 = v7;
        id v13 = v6;
        if (*(void *)v42 != v32) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v41 + 1) + 8 * i);
        id v7 = -[LegacySMSServiceSession _createNewChatIdentifierFromChatIdentifier:andCategoryLabel:](self, "_createNewChatIdentifierFromChatIdentifier:andCategoryLabel:", v36, v14, v27, v28);

        id v15 = +[IMDChatRegistry sharedInstance];
        uint64_t v16 = [(LegacySMSServiceSession *)self account];
        id v6 = [v15 existingChatForID:v7 account:v16];

        id v9 = v11;
        if (v6) {
          BOOL v17 = v11 == 0;
        }
        else {
          BOOL v17 = 0;
        }
        if (v17)
        {
          if ([v14 isEqualToString:&stru_8F4F0])
          {
            id v9 = &dword_0 + 1;
          }
          else if ([v14 isEqualToString:@"smsft"])
          {
            id v9 = &dword_4;
          }
          else if ([v14 isEqualToString:@"smsfp"])
          {
            id v9 = &dword_0 + 3;
          }
          else
          {
            id v9 = &dword_0 + 2;
          }
        }
        v8 += (int)[v6 getNumberOfTimesRespondedToThread];
      }
      id v34 = [obj countByEnumeratingWithState:&v41 objects:v46 count:16];
    }
    while (v34);
  }

  long long v39 = 0u;
  long long v40 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  id v30 = +[IMSMSFilterHelper fetchSMSFilterExtensionParams];
  id v35 = [v30 countByEnumeratingWithState:&v37 objects:v45 count:16];
  if (v35)
  {
    id v29 = 0;
    uint64_t v33 = *(void *)v38;
    do
    {
      for (j = 0; j != v35; j = (char *)j + 1)
      {
        if (*(void *)v38 != v33) {
          objc_enumerationMutation(v30);
        }
        BOOL v19 = *(void **)(*((void *)&v37 + 1) + 8 * (void)j);
        if (objc_msgSend(v19, "subAction", v27, v28))
        {
          long long v20 = [v19 label];
          uint64_t v21 = [(LegacySMSServiceSession *)self _createNewChatIdentifierFromChatIdentifier:v36 andCategoryLabel:v20];

          int v22 = +[IMDChatRegistry sharedInstance];
          id v23 = [(LegacySMSServiceSession *)self account];
          int64_t v24 = [v22 existingChatForID:v21 account:v23];

          if (v24) {
            BOOL v25 = v9 == 0;
          }
          else {
            BOOL v25 = 0;
          }
          if (v25)
          {
            id v9 = [v19 action];
            id v29 = [v19 subAction];
          }
          v8 += (int)[v24 getNumberOfTimesRespondedToThread];
          id v6 = v24;
          id v7 = (void *)v21;
        }
      }
      id v35 = [v30 countByEnumeratingWithState:&v37 objects:v45 count:16];
    }
    while (v35);
  }
  else
  {
    id v29 = 0;
  }

  if (v8 >= 3)
  {
    int64_t *v27 = (int64_t)v9;
    *long long v28 = (int64_t)v29;
  }

  return v8;
}

- (void)_checkAndUpdateFilterParamsForFilterExtension
{
  id v3 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v4 = [v3 isSMSFilterSyncEnabled];

  if (v4 && (IMSharedHelperDeviceIsiPad() & 1) == 0)
  {
    unsigned int v5 = [(LegacySMSServiceSession *)self _isSpamFilteringEnabled];
    int v6 = IMOSLoggingEnabled();
    if (v5)
    {
      if (v6)
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "SMS Filtering was enabled. Updating Filter Params", buf, 2u);
        }
      }
      [(LegacySMSServiceSession *)self _updateFilterParamsForFilterExtension];
    }
    else
    {
      if (v6)
      {
        int64_t v8 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)id v9 = 0;
          _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "SMS Filtering was disabled. Clearing Filter Params", v9, 2u);
        }
      }
      [(LegacySMSServiceSession *)self _disableSpamFilteringAndRelay];
    }
  }
}

- (void)_updateFilterParamsForFilterExtension
{
  id v3 = [(LegacySMSServiceSession *)self _getSpamExtensionID];
  if (v3)
  {
    if (qword_9C0D0)
    {
      unsigned int v4 = [objc_alloc((Class)qword_9C0D0) initWithExtensionIdentifier:v3];
      *(void *)buf = 0;
      id v11 = buf;
      uint64_t v12 = 0x3032000000;
      id v13 = sub_34FF0;
      id v14 = sub_35000;
      id v15 = 0;
      id v15 = objc_alloc_init((Class)qword_9C058);
      unsigned int v5 = (void *)*((void *)v11 + 5);
      v6[0] = _NSConcreteStackBlock;
      v6[1] = 3221225472;
      v6[2] = sub_43A7C;
      v6[3] = &unk_8DD08;
      id v7 = v3;
      int64_t v8 = self;
      id v9 = buf;
      [v5 performCapabilitiesQueryRequest:v4 completion:v6];

      _Block_object_dispose(buf, 8);
    }
    else
    {
      if (!IMOSLoggingEnabled()) {
        goto LABEL_5;
      }
      unsigned int v4 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "IdentityLookup framework not found", buf, 2u);
      }
    }
  }
LABEL_5:
}

- (void)_checkIfMessageIsSpam:(id)a3 fromSender:(id)a4 withGuid:(id)a5 shouldRegister:(BOOL)a6 receiverISOCountryCode:(id)a7 receivedViaRelay:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v10 = a6;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a7;
  if (v14 && v15)
  {
    long long v39 = _NSConcreteStackBlock;
    uint64_t v40 = 3221225472;
    long long v41 = sub_44294;
    long long v42 = &unk_8DD30;
    long long v43 = self;
    id v18 = v16;
    id v44 = v18;
    BOOL v45 = v10;
    BOOL v46 = v8;
    im_dispatch_after();
    BOOL v19 = [(LegacySMSServiceSession *)self _getSpamExtensionID];
    if (qword_9C050)
    {
      id v20 = [objc_alloc((Class)qword_9C050) initWithExtensionIdentifier:v19];
      [v14 string];
      BOOL v25 = v8;
      v22 = uint64_t v21 = v19;
      [v20 setMessageBody:v22];

      [v20 setSender:v15];
      [v20 setReceiverISOCountryCode:v17];
      *(void *)buf = 0;
      id v34 = buf;
      uint64_t v35 = 0x3032000000;
      id v36 = sub_34FF0;
      long long v37 = sub_35000;
      id v38 = 0;
      id v38 = objc_alloc_init((Class)qword_9C058);
      id v23 = (void *)*((void *)v34 + 5);
      v26[0] = _NSConcreteStackBlock;
      v26[1] = 3221225472;
      v26[2] = sub_442B0;
      v26[3] = &unk_8DD80;
      id v27 = v21;
      long long v28 = self;
      BOOL v31 = v10;
      BOOL v32 = v25;
      id v29 = v18;
      id v30 = buf;
      [v23 performQueryRequest:v20 completion:v26];

      _Block_object_dispose(buf, 8);
      BOOL v19 = v21;
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        int64_t v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "IdentityLookup framework not found", buf, 2u);
        }
      }
      [(LegacySMSServiceSession *)self _executeSpamCompletionBlockForMessageGuid:v18 category:0 subCategory:0 shouldRegister:v10 receivedViaRelay:v8];
    }
  }
}

- (void)_checkAndUpdateSMSSpamFilterExtensionForUnregisteredOrUpdatedPlugins:(id)a3 arePluginsRegistered:(BOOL)a4
{
  BOOL v4 = a4;
  id v6 = a3;
  if (v6)
  {
    BOOL v19 = v4;
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Plugins have been deleted. Checking if current spam filter extension was deleted", buf, 2u);
      }
    }
    BOOL v8 = [(LegacySMSServiceSession *)self _getSpamExtensionID];
    if (v8)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v9 = v6;
      id v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v23;
        while (2)
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v9);
            }
            id v13 = [v9 objectForKey:*(void *)(*((void *)&v22 + 1) + 8 * i)];
            id v14 = [v13 objectForKey:@"NSExtensionIdentifier"];

            if (v14 && [v8 isEqualToString:v14])
            {
              int v16 = IMOSLoggingEnabled();
              if (v19)
              {
                if (v16)
                {
                  id v17 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v27 = v8;
                    _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Spam extension installed matches current spam extension %@. Checking for new spam filter capabilities", buf, 0xCu);
                  }
                }
                self->_hasSpamExtensionUpdated = 1;
                [(LegacySMSServiceSession *)self _updateFilterParamsForFilterExtension];
              }
              else
              {
                if (v16)
                {
                  id v18 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    id v27 = v8;
                    _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Spam extension deleted matches current spam extension %@.", buf, 0xCu);
                  }
                }
                id v20 = v8;
                id v21 = v14;
                im_dispatch_after();
              }
              goto LABEL_33;
            }
          }
          id v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
          if (v10) {
            continue;
          }
          break;
        }
      }
LABEL_33:
    }
    else if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "No spam extension currently selected. Not doing anything", buf, 2u);
      }
    }
  }
}

- (void)_relayCurrentSMSFilteringSettings
{
  id v3 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v4 = [v3 isSMSFilterSyncEnabled];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Received request to relay current SMS filtering settings", v6, 2u);
      }
    }
    [(LegacySMSServiceSession *)self _relaySMSFilteringSettingsForFilterState:[(LegacySMSServiceSession *)self _isSpamFilteringEnabled]];
  }
}

- (void)_relaySMSFilteringSettingsForFilterState:(int64_t)a3
{
  unsigned int v5 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v6 = [v5 isSMSFilterSyncEnabled];

  if (v6 && (IMSharedHelperDeviceIsiPad() & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        int64_t v20 = a3;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Received request to relay SMS filtering settings for filterState: %ld", buf, 0xCu);
      }
    }
    id v8 = [(LegacySMSServiceSession *)self _newSMSFilteringSettingsDictForFilterState:a3];
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        int64_t v20 = (int64_t)v8;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Created SMSFilteringSettings dictionary: %@", buf, 0xCu);
      }
    }
    id v10 = JWEncodeDictionary();
    id v11 = [v10 _FTCopyGzippedData];
    uint64_t v12 = +[NSNumber numberWithInteger:139];
    id v13 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    id v14 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v12, IDSSendMessageOptionCommandKey, v11, IDSSendMessageOptionDataToEncryptKey, v13, IDSSendMessageOptionTimeoutKey, 0);

    id v15 = [(LegacySMSServiceSession *)self _myCTPhoneNumber];
    unsigned int v16 = [(LegacySMSServiceSession *)self sendDataToPeers:v14 forcedCallerID:v15 shouldFilterRecepients:1 requestProxySend:0 dontSendTo:0];

    if (IMOSLoggingEnabled())
    {
      id v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        CFStringRef v18 = @"NO";
        if (v16) {
          CFStringRef v18 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        int64_t v20 = (int64_t)v18;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Relayed SMSFilteringSettings dictionary: %@", buf, 0xCu);
      }
    }
  }
}

- (id)_newSMSFilteringSettingsDictForFilterState:(int64_t)a3
{
  id v4 = objc_alloc_init((Class)NSMutableDictionary);
  unsigned int v5 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v6 = [v5 isSMSFilterSyncEnabled];

  if (v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v12 = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Creating SMSFilteringSettings dictionary", v12, 2u);
      }
    }
    if (a3 == 1)
    {
      id v8 = IMGetDomainValueForKey();
      id v9 = +[IMSMSFilterCapabilitiesSyncHelper fetchSMSFilterCapabilitiesOptions];
    }
    else
    {
      id v8 = 0;
      id v9 = &dword_0 + 1;
    }
    [v4 setObject:@"1" forKey:off_997E0];
    if (v8) {
      CFDictionarySetValue((CFMutableDictionaryRef)v4, off_99938, v8);
    }
    id v10 = +[NSNumber numberWithUnsignedInteger:v9];
    if (v10)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v4, off_99940, v10);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_5EFDC();
    }
  }
  return v4;
}

- (void)_processReceivedSMSFilteringSettingsDictionary:(id)a3 deviceID:(id)a4
{
  id v9 = a3;
  id v6 = a4;
  id v7 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v8 = [v7 isSMSFilterSyncEnabled];

  if (v8) {
    [(LegacySMSServiceSession *)self _processReceivedSMSFilteringSettingsDictionaryInBlastDoor:v9 deviceID:v6];
  }
}

- (void)_checkAndUpdateSMSFilteringSettingsForDeviceID:(id)a3 smsFilterCapabilitiesOptions:(unint64_t)a4 filterExtensionName:(id)a5
{
  id v8 = a3;
  id v9 = a5;
  id v10 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v11 = [v10 isSMSFilterSyncEnabled];

  if (!v11
    || ![v8 length]
    || !+[IMSMSFilterHelper supportsIncomingSMSRelayFiltering])
  {
    goto LABEL_24;
  }
  unsigned int v12 = [(LegacySMSServiceSession *)self _isSpamFilteringEnabled];
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v19 = 138413058;
      id v20 = v8;
      __int16 v21 = 2048;
      unint64_t v22 = (a4 >> 1) & 1;
      __int16 v23 = 2048;
      unint64_t v24 = a4;
      __int16 v25 = 2112;
      id v26 = v9;
      _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Received SMSFilteringSettings from iPhone:%@ with filterState: %ld, smsFilterCapabilitiesOptions:%lu, filterExtensionName:%@. Checking if we need to update filter params.", (uint8_t *)&v19, 0x2Au);
    }
  }
  if (+[IMSMSFilterCapabilitiesSyncHelper isValidSMSFilterCapabilitiesOptions:a4])
  {
    if ((a4 & 2) != 0)
    {
      if (v12)
      {
        unsigned int v16 = +[IMSMSFilterCapabilitiesSyncHelper shouldUpdateSMSFilterSyncDeviceParamsForDeviceID:v8 smsFilterCapabilitiesOptions:a4 filterExtensionName:v9];
      }
      else
      {
        [(LegacySMSServiceSession *)self _enableSpamFiltering];
        if (IMOSLoggingEnabled())
        {
          id v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            LOWORD(v19) = 0;
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "SMS Filtering state changed from disabled to enabled. Need to update filter params.", (uint8_t *)&v19, 2u);
          }
        }
        unsigned int v16 = 1;
      }
      if (IMOSLoggingEnabled())
      {
        CFStringRef v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Received values not present in SMSFilterSyncDeviceParams array. Need to update filter params.", (uint8_t *)&v19, 2u);
        }

        if ((v16 & 1) == 0) {
          goto LABEL_17;
        }
      }
      else if (!v16)
      {
        goto LABEL_17;
      }
    }
    else
    {
      if (!v12) {
        goto LABEL_24;
      }
      if (IMOSLoggingEnabled())
      {
        id v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          LOWORD(v19) = 0;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "SMS Filtering state changed from enabled to disabled. Need to update filter params.", (uint8_t *)&v19, 2u);
        }
      }
    }
  }
  else
  {
    a4 = 0;
  }
  +[IMSMSFilterCapabilitiesSyncHelper updateSMSFilterCapabilitiesOptionsForDeviceID:v8 smsFilterCapabilitiesOptions:a4 filterExtensionName:v9];
LABEL_17:
  if (v12
    && (+[IMSMSFilterCapabilitiesSyncHelper isSMSFilteringEnabledInSMSFilterCapabilitiesOptions] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        LOWORD(v19) = 0;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "SMS Filtering state changed from enabled to disabled. Need to update filter params.", (uint8_t *)&v19, 2u);
      }
    }
    [(LegacySMSServiceSession *)self _disableSpamFiltering];
  }
LABEL_24:
}

- (void)_enableSpamFiltering
{
  id v3 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v4 = [v3 isSMSFilterSyncEnabled];

  if (v4)
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v6 = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Enabling Spam Filtering", v6, 2u);
      }
    }
    [(LegacySMSServiceSession *)self _updateSpamFilteringState:1];
  }
}

- (void)_disableSpamFilteringAndRelay
{
  id v3 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v4 = [v3 isSMSFilterSyncEnabled];

  if (v4)
  {
    [(LegacySMSServiceSession *)self _disableSpamFiltering];
    if (IMOSLoggingEnabled())
    {
      unsigned int v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "SMS Filtering was disabled. Relaying to peers.", buf, 2u);
      }
    }
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_4560C;
    block[3] = &unk_8DCE0;
    void block[4] = self;
    dispatch_async((dispatch_queue_t)&_dispatch_main_q, block);
  }
}

- (void)_disableSpamFiltering
{
  CFPreferencesSetAppValue(@"spamFilterExtensionParams", 0, @"com.apple.MobileSMS");
  CFPreferencesSetAppValue(@"spamFiltrationExtensionID", 0, @"com.apple.MobileSMS");
  CFPreferencesSetAppValue(@"spamFiltrationExtensionName", 0, @"com.apple.MobileSMS");

  [(LegacySMSServiceSession *)self _updateSpamFilteringState:0];
}

- (void)_updateSpamFilteringState:(int64_t)a3
{
  CFPreferencesSetAppValue(@"IncomingMessageAlertSpamFiltration", +[NSNumber numberWithInteger:a3], @"com.apple.MobileSMS");
  CFPreferencesSynchronize(@"com.apple.MobileSMS", kCFPreferencesCurrentUser, kCFPreferencesAnyHost);
  id v3 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v4 = [v3 isSMSFilterSyncEnabled];

  if (!v4
    || +[IMSpamFilterHelper isFilterUnknownSendersEnabled])
  {
    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.IncomingMessageAlertSpamFiltration.changed", 0, 0, 1u);
  }
}

- (unsigned)_generateMessageIDForMessageGUID:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([v8 length])
  {
    unsigned int v11 = [(NSMutableDictionary *)self->_outgoingMessageMap objectForKey:v8];
    if (v11)
    {
      if (IMOSLoggingEnabled())
      {
        unsigned int v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v27 = 138412546;
          id v28 = v8;
          __int16 v29 = 2112;
          id v30 = v11;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Using existing mapping mapping from %@ to %@", (uint8_t *)&v27, 0x16u);
        }
      }
      unsigned int v13 = [v11 unsignedIntValue];
    }
    else
    {
      id v14 = +[NSNumber numberWithUnsignedInt:FastRandomUInt() % 0x186A0];
      if (!self->_outgoingMessageMap)
      {
        CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        outgoingMessageMap = self->_outgoingMessageMap;
        self->_outgoingMessageMap = Mutable;
      }
      if (!self->_outgoingMessageBlockMap)
      {
        id v17 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        outgoingMessageBlockMap = self->_outgoingMessageBlockMap;
        self->_outgoingMessageBlockMap = v17;
      }
      if (!self->_outgoingMessageFailureMap)
      {
        int v19 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        outgoingMessageFailureMap = self->_outgoingMessageFailureMap;
        self->_outgoingMessageFailureMap = v19;
      }
      [(NSMutableDictionary *)self->_outgoingMessageMap setObject:v14 forKey:v8];
      if (v9)
      {
        __int16 v21 = self->_outgoingMessageBlockMap;
        id v22 = [v9 copy];
        [(NSMutableDictionary *)v21 setObject:v22 forKey:v8];
      }
      if (v10)
      {
        __int16 v23 = self->_outgoingMessageFailureMap;
        id v24 = [v10 copy];
        [(NSMutableDictionary *)v23 setObject:v24 forKey:v8];
      }
      if (IMOSLoggingEnabled())
      {
        __int16 v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          int v27 = 138412546;
          id v28 = v8;
          __int16 v29 = 2112;
          id v30 = v14;
          _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Generated mapping from %@ to %@", (uint8_t *)&v27, 0x16u);
        }
      }
      unsigned int v13 = [v14 unsignedIntValue];
    }
  }
  else
  {
    unsigned int v13 = 0;
  }

  return v13;
}

- (id)_messageGUIDForMessageID:(int)a3
{
  outgoingMessageMap = self->_outgoingMessageMap;
  unsigned int v4 = +[NSNumber numberWithInt:*(void *)&a3];
  unsigned int v5 = [(NSMutableDictionary *)outgoingMessageMap allKeysForObject:v4];
  id v6 = objc_msgSend(v5, "__imFirstObject");

  return v6;
}

- (id)_completionBlockForMessageGUID:(id)a3
{
  return [(NSMutableDictionary *)self->_outgoingMessageBlockMap objectForKey:a3];
}

- (id)_failureBlockForMessageGUID:(id)a3
{
  return [(NSMutableDictionary *)self->_outgoingMessageFailureMap objectForKey:a3];
}

- (void)_clearMapForMessageGUID:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    unsigned int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v4;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Clearing mapping for %@", (uint8_t *)&v9, 0xCu);
    }
  }
  if (v4)
  {
    [(NSMutableDictionary *)self->_outgoingMessageMap removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_outgoingMessageFailureMap removeObjectForKey:v4];
    [(NSMutableDictionary *)self->_outgoingMessageBlockMap removeObjectForKey:v4];
    if (![(NSMutableDictionary *)self->_outgoingMessageMap count])
    {
      outgoingMessageMap = self->_outgoingMessageMap;
      self->_outgoingMessageMap = 0;
    }
    if (![(NSMutableDictionary *)self->_outgoingMessageBlockMap count])
    {
      outgoingMessageBlockMap = self->_outgoingMessageBlockMap;
      self->_outgoingMessageBlockMap = 0;
    }
    if (![(NSMutableDictionary *)self->_outgoingMessageFailureMap count])
    {
      outgoingMessageFailureMap = self->_outgoingMessageFailureMap;
      self->_outgoingMessageFailureMap = 0;
    }
  }
}

- (void)_enqueueBlock:(id)a3 withTimeout:(double)a4
{
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = [(LegacySMSServiceSession *)self accountID];
      int v13 = 138412546;
      id v14 = v8;
      __int16 v15 = 2048;
      double v16 = a4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, " Enqueued item for key: %@    timeout: %f", (uint8_t *)&v13, 0x16u);
    }
  }
  incomingMessageMultiQueue = self->_incomingMessageMultiQueue;
  if (!incomingMessageMultiQueue)
  {
    id v10 = (IMMultiQueue *)objc_alloc_init((Class)IMMultiQueue);
    unsigned int v11 = self->_incomingMessageMultiQueue;
    self->_incomingMessageMultiQueue = v10;

    incomingMessageMultiQueue = self->_incomingMessageMultiQueue;
  }
  unsigned int v12 = [(LegacySMSServiceSession *)self accountID];
  [(IMMultiQueue *)incomingMessageMultiQueue addBlock:v6 withTimeout:v12 forKey:0 description:a4];
}

- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChat:(id)a5 style:(unsigned __int8)a6
{
  int v6 = a6;
  id v24 = a3;
  id v29 = a4;
  id v10 = a5;
  char v36 = v6;
  if (IMOSLoggingEnabled())
  {
    unsigned int v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412802;
      id v39 = v24;
      __int16 v40 = 2112;
      id v41 = v10;
      __int16 v42 = 1024;
      int v43 = v6;
      _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Request to invite person: %@   chat: %@  style: %c", buf, 0x1Cu);
    }
  }
  id v35 = v10;
  [(LegacySMSServiceSession *)self canonicalizeChatIdentifier:&v35 style:&v36];
  id v30 = v35;

  if (v30)
  {
    long long v33 = 0u;
    long long v34 = 0u;
    long long v31 = 0u;
    long long v32 = 0u;
    id obj = v24;
    id v12 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
    if (v12)
    {
      uint64_t v28 = *(void *)v32;
      uint64_t v27 = kFZPersonID;
      uint64_t v26 = kFZPersonUnformattedName;
      uint64_t v13 = kFZPersonCountryCode;
      do
      {
        for (i = 0; i != v12; i = (char *)i + 1)
        {
          if (*(void *)v32 != v28) {
            objc_enumerationMutation(obj);
          }
          __int16 v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          double v16 = [v15 objectForKey:v27];
          id v17 = [v15 objectForKey:v26];
          CFStringRef v18 = [v15 objectForKey:v13];
          char v19 = v36;
          id v20 = [(LegacySMSServiceSession *)self account];
          __int16 v21 = [v29 destinationCallerID];
          LOBYTE(v23) = v19;
          id v22 = [(LegacySMSServiceSession *)self didChangeMemberStatus:2 forHandle:v16 fromHandle:0 unformattedNumber:v17 countryCode:v18 forChat:v30 style:v23 account:v20 destinationCallerID:v21];
        }
        id v12 = [obj countByEnumeratingWithState:&v31 objects:v37 count:16];
      }
      while (v12);
    }
  }
}

- (void)_joinOneToOneChatWithChatIdentifier:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    v9[0] = kFZChatParticipantStatusKey;
    v9[1] = kFZPersonID;
    v10[0] = &off_90DB0;
    v10[1] = v4;
    unsigned int v5 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    unsigned int v11 = v5;
    int v6 = +[NSArray arrayWithObjects:&v11 count:1];

    [(LegacySMSServiceSession *)self didJoinChat:v4 style:45 displayName:0 groupID:0 handleInfo:v6];
  }
  else if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v8 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Cannot attempt to join chat with empty chat identifier", v8, 2u);
    }
  }
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
  id v15 = a3;
  id v16 = a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  if (IMOSLoggingEnabled())
  {
    __int16 v21 = OSLogHandleForIMFoundationCategory();
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
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "Request to join chat: %@  style: %c handleInfo: %@ lastAddressedHandle %@ lastAddressedSIMID %@", buf, 0x30u);
    }
  }
  [(LegacySMSServiceSession *)self didJoinChat:v15 style:v12 displayName:0 groupID:v17 lastAddressedHandle:v18 lastAddressedSIMID:v19 handleInfo:v16];
}

- (void)leaveChat:(id)a3 style:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412546;
      id v9 = v6;
      __int16 v10 = 1024;
      int v11 = v4;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Request to leave chat: %@  style: %c", (uint8_t *)&v8, 0x12u);
    }
  }
  [(LegacySMSServiceSession *)self didLeaveChat:v6 style:v4];
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 reflectOnly:(BOOL)a7
{
  uint64_t v7 = a6;
  id v11 = a3;
  id v35 = a4;
  id v36 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v38 = v11;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Marking message as read: %@", buf, 0xCu);
    }
  }
  if ([(LegacySMSServiceSession *)self _hasPeerDevices])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v11;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Have Peer devices, passing on local read recipet for: %@", buf, 0xCu);
      }
    }
    long long v34 = [(LegacySMSServiceSession *)self chatForChatIdentifier:v36 style:v7];
    id v31 = [v34 lastAddressedLocalHandle];
    if (IMOSLoggingEnabled())
    {
      id v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v38 = v31;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "The Last Addressed Handle For This Chat Was %@", buf, 0xCu);
      }
    }
    long long v33 = +[NSDictionary dictionary];
    long long v32 = JWEncodeDictionary();
    id v15 = [v32 _FTCopyGzippedData];
    id v16 = +[NSNumber numberWithInteger:147];
    id v17 = [v11 guid];
    id v18 = IDSGetUUIDData();
    id v19 = [v11 timeRead];
    id v20 = off_998C0;
    __int16 v21 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    id v22 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey, v16, IDSSendMessageOptionCommandKey, v18, IDSSendMessageOptionUUIDKey, v19, v20, v15, IDSSendMessageOptionDataToEncryptKey, v21, IDSSendMessageOptionTimeoutKey, 0);

    [(LegacySMSServiceSession *)self sendDataToPeers:v22 forcedCallerID:0 shouldFilterRecepients:0 requestProxySend:0 dontSendTo:0];
    id v23 = [(LegacySMSServiceSession *)self localDevice];
    if (v23)
    {
      unsigned __int8 v24 = [(LegacySMSServiceSession *)self isLocalDeviceProxyRegistered];

      if ((v24 & 1) == 0)
      {
        int v25 = [v11 guid];
        __int16 v26 = +[NSDictionary dictionaryWithObjectsAndKeys:v25, @"message-guid", 0];

        id v27 = JWEncodeDictionary();
        id v28 = [v27 _FTCopyGzippedData];
        id v29 = +[NSDictionary dictionaryWithObjectsAndKeys:v28, @"dict", @"local-message-read", @"local-type", 0];
        [(LegacySMSServiceSession *)self sendToLocalPeers:v29];
      }
    }
  }
  __int16 v30 = [v11 guid];
  [(LegacySMSServiceSession *)self didSendMessageReadReceiptForMessageID:v30];
}

- (void)sendDeliveredQuietlyReceiptForMessage:(id)a3 forIncomingMessageFromIDSID:(id)a4 toChatGuid:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 withWillSendToDestinationsHandler:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a8;
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      int v20 = 138412290;
      id v21 = v13;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Not sending delivered quietly receipt for item: %@", (uint8_t *)&v20, 0xCu);
    }
  }
  id v19 = [v13 guid];
  [(LegacySMSServiceSession *)self didSendDeliveredQuietlyReceiptForMessageID:v19];
}

- (void)sendNotifyRecipientCommandForMessage:(id)a3 toChatGuid:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Not sending notify recipient command for item: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v13 = [v9 guid];
  [(LegacySMSServiceSession *)self didSendNotifyRecipientCommandForMessageID:v13];
}

- (void)sendPlayedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Marking message as played: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v13 = [v9 guid];
  [(LegacySMSServiceSession *)self didSendMessagePlayedReceiptForMessageID:v13];
}

- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (IMOSLoggingEnabled())
  {
    uint64_t v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Marking message as saved: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v13 = [v9 guid];
  [(LegacySMSServiceSession *)self didSendMessageSavedReceiptForMessageID:v13];
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
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v20 = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Not sending delivery receipt", v20, 2u);
    }
  }
}

- (void)sendSyndicationAction:(id)a3 toChatsWithIdentifiers:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)int v8 = 0;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Not sending syndication action", v8, 2u);
    }
  }
}

- (void)sendUpdatedCollaborationMetadata:(id)a3 toChatsWithIdentifiers:(id)a4 forMessageGUID:(id)a5
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
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Not sending updated collaboration metadata", v11, 2u);
    }
  }
}

- (void)processMessageForSending:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5 allowWatchdog:(BOOL)a6 completionBlock:(id)a7
{
  BOOL v8 = a6;
  uint64_t v9 = a5;
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  _DWORD v17[2] = sub_47278;
  v17[3] = &unk_8DE88;
  id v18 = a3;
  id v19 = self;
  id v20 = a4;
  id v21 = a7;
  char v22 = v9;
  id v12 = v20;
  id v13 = v21;
  id v14 = v18;
  id v15 = objc_retainBlock(v17);
  v16.receiver = self;
  v16.super_class = (Class)LegacySMSServiceSession;
  [(LegacySMSServiceSession *)&v16 processMessageForSending:v14 toChat:v12 style:v9 allowWatchdog:v8 completionBlock:v15];
}

- (BOOL)_enableBackwardsCompatibility
{
  v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"disable-expressive-bc"];
  uint64_t v4 = v3;
  if (v3 && [v3 BOOLValue])
  {
    if (IMOSLoggingEnabled())
    {
      id v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Disabling backwards compatibility from server bag", buf, 2u);
      }
    }
    BOOL v6 = 0;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v9 = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Enabling backwards compatibility", v9, 2u);
      }
    }
    BOOL v6 = 1;
  }

  return v6;
}

- (void)sendJunkReportMessage:(id)a3
{
}

- (void)sendMessage:(id)a3 toChat:(id)a4 style:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  unsigned __int8 v40 = v5;
  if ([(LegacySMSServiceSession *)self _shouldFailSMSMessageForTesting:v8 chatIdentifier:v9 chatStyle:v5])
  {
    v39.receiver = self;
    v39.super_class = (Class)LegacySMSServiceSession;
    [(LegacySMSServiceSession *)&v39 sendMessage:v8 toChat:v9 style:v5];
LABEL_21:

    goto LABEL_22;
  }
  if (![(LegacySMSServiceSession *)self _allowedToSendMessage:v8 toChatIdentifier:v9])
  {
    v38.receiver = self;
    v38.super_class = (Class)LegacySMSServiceSession;
    [(LegacySMSServiceSession *)&v38 sendMessage:v8 toChat:v9 style:v5];
    [(LegacySMSServiceSession *)self didSendMessage:v8 forChat:v9 style:v5];
    goto LABEL_21;
  }
  id v37 = v9;
  [(LegacySMSServiceSession *)self canonicalizeChatIdentifier:&v37 style:&v40];
  id v10 = v37;

  if (v10)
  {
    __int16 v26 = [(LegacySMSServiceSession *)self _chatForSendingMessageItem:v8 chatIdentifier:v10 chatStyle:v40];
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        id v12 = [v8 guid];
        *(_DWORD *)buf = 138412802;
        *(void *)&uint8_t buf[4] = v12;
        *(_WORD *)&buf[12] = 2112;
        *(void *)&buf[14] = v10;
        *(_WORD *)&buf[22] = 2112;
        __int16 v42 = v26;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "send message guid: %@  to identifier: %@   chat: %@", buf, 0x20u);
      }
    }
    id v13 = +[IMMetricsCollector sharedInstance];
    [v13 trackEvent:IMMetricsCollectorEventSMSSent];

    id v14 = [(LegacySMSServiceSession *)self _callerIDForChatWithChatIdentifier:v10 chatStyle:v40 foundChat:v26];
    [v8 setDestinationCallerID:v14];
    id v15 = [(LegacySMSServiceSession *)self _compatibleMessageToSendForMessageItem:v8];
    unint64_t v16 = [(LegacySMSServiceSession *)self _sendingDecisionForMessageItem:v15 callerID:v14 chat:v26];
    if ((v16 & 3) != 0)
    {
      uint64_t v17 = v40;
      id v18 = [v26 lastReplicationSinceLoadDate];
      unsigned int v19 = [(LegacySMSServiceSession *)self _replicateMessage:v8 chatIdentifier:v10 chatStyle:v17 lastKnownReplicationDate:v18 callerID:v14];

      if (v19)
      {
        id v20 = +[NSDate now];
        [v26 setLastReplicationSinceLoadDate:v20];
      }
      int v21 = IMGetCachedDomainBoolForKey();
      char v22 = +[IMLockdownManager sharedInstance];
      unsigned int v23 = [v22 isInternalInstall];

      if ((v23 & v21) != 0)
      {
        if (IMOSLoggingEnabled())
        {
          unsigned __int8 v24 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "** Skipping true SMS send, DisableNonReplicationSMSSend is set", buf, 2u);
          }
        }
        goto LABEL_20;
      }
    }
    else
    {
      LOBYTE(v19) = 0;
    }
    *(void *)buf = 0;
    *(void *)&uint8_t buf[8] = buf;
    *(void *)&uint8_t buf[16] = 0x2020000000;
    LOBYTE(v42) = 0;
    LOBYTE(v42) = [v15 useStandalone];
    uint64_t v25 = v40;
    v27[0] = _NSConcreteStackBlock;
    v27[1] = 3221225472;
    v27[2] = sub_48858;
    v27[3] = &unk_8DEB0;
    v27[4] = self;
    long long v32 = buf;
    id v28 = v15;
    id v29 = v14;
    unint64_t v33 = v16;
    id v30 = v26;
    id v31 = v10;
    unsigned __int8 v34 = v40;
    char v35 = v19;
    char v36 = 0;
    [(LegacySMSServiceSession *)self processMessageForSending:v28 toChat:v31 style:v25 allowWatchdog:1 completionBlock:v27];

    _Block_object_dispose(buf, 8);
LABEL_20:

    id v9 = v10;
    id v8 = v15;
    goto LABEL_21;
  }
LABEL_22:
}

- (id)_chatForSendingMessageItem:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  id v10 = [(LegacySMSServiceSession *)self chatForChatIdentifier:v9 style:v5];
  if (!v10)
  {
    unsigned int v11 = [v8 isSOS];
    if (v5 == 45)
    {
      if (v11)
      {
        if (IMOSLoggingEnabled())
        {
          id v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)id v14 = 0;
            _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Chat was nil but message is SOS, forcing join", v14, 2u);
          }
        }
        [(LegacySMSServiceSession *)self _joinOneToOneChatWithChatIdentifier:v9];
        id v10 = [(LegacySMSServiceSession *)self chatForChatIdentifier:v9 style:45];
      }
    }
  }

  return v10;
}

- (void)_finishSendingMessageItem:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 foundChat:(id)a6 didSendSMS:(BOOL)a7 attemptingReplication:(BOOL)a8 shouldForceFail:(BOOL)a9 watchSendsOverCellular:(BOOL)a10 forceReflection:(BOOL)a11 callerID:(id)a12
{
  BOOL v41 = a8;
  BOOL v12 = a7;
  uint64_t v14 = a5;
  id v17 = a3;
  id v43 = a4;
  id v44 = a6;
  id v42 = a12;
  long long v47 = 0u;
  long long v48 = 0u;
  long long v49 = 0u;
  long long v50 = 0u;
  id v18 = +[IMDChatRegistry sharedInstance];
  unsigned int v19 = [v18 allExistingSupportedServiceChatsWithIdentifier:v43 style:v14];

  id v20 = [v19 countByEnumeratingWithState:&v47 objects:v53 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v48;
    do
    {
      for (i = 0; i != v20; i = (char *)i + 1)
      {
        if (*(void *)v48 != v21) {
          objc_enumerationMutation(v19);
        }
        unsigned int v23 = *(void **)(*((void *)&v47 + 1) + 8 * i);
        unsigned __int8 v24 = [v17 guid];
        [v23 updateLastSeenMessageGuidIfNeeded:v24];
      }
      id v20 = [v19 countByEnumeratingWithState:&v47 objects:v53 count:16];
    }
    while (v20);
  }

  if (+[IMSpamFilterHelper isInternationalSpamFilteringEnabled] & v12)[(LegacySMSServiceSession *)self _resetAndBroadcastBlackholeErrorStateIfNeededForChatIdentifier:v43 chatStyle:v14]; {
  uint64_t v46 = 0;
  }
  unsigned __int8 v25 = [(LegacySMSServiceSession *)self _disableScreenTimeRestrictionsForMessageItem:v17 chat:v44 watchSendsOverCellular:a10 emergencyNumbersFoundInRecipients:&v46];
  int IsAltAccount = IMSharedHelperDeviceIsAltAccount();
  unsigned int v27 = [(LegacySMSServiceSession *)self watchConnectedOverBT];
  uint64_t v28 = v46;
  unsigned int v29 = [v44 isStewieChat];
  if (a9)
  {
    if ((IMSharedHelperDeviceHasMultipleSubscriptions() & a9) == 1)
    {
      if (IMOSLoggingEnabled())
      {
        id v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          id v31 = [v17 guid];
          *(_DWORD *)buf = 138412290;
          uint64_t v52 = v31;
          _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "SMS was not sent out and message was force failed so that user can pick correct subscription to send with %@", buf, 0xCu);
        }
      }
LABEL_27:
      char v35 = [v17 guid];
      [(LegacySMSServiceSession *)self didReceiveError:4 forMessageID:v35 forceError:1];

      char v36 = [v17 guid];
      [(LegacySMSServiceSession *)self _clearMapForMessageGUID:v36];

      goto LABEL_31;
    }
  }
  else
  {
    unsigned int v32 = v29;
    if (((![(LegacySMSServiceSession *)self _hasPeerDevices] | IsAltAccount) & 1) == 0)
    {
      int v33 = v27 ^ 1;
      if (!v46) {
        int v33 = 0;
      }
      if (((v33 | v32) & 1) == 0)
      {
        if (v12
          && ([(LegacySMSServiceSession *)self _allowedDevicesforSMSRelay],
              id v37 = objc_claimAutoreleasedReturnValue(),
              BOOL v38 = [v37 count] == 0,
              v37,
              v38))
        {
          if (IMOSLoggingEnabled())
          {
            objc_super v39 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "None of our peer devices are on the allowed list, Not relaying message", buf, 2u);
            }
          }
          v45.receiver = self;
          v45.super_class = (Class)LegacySMSServiceSession;
          [(LegacySMSServiceSession *)&v45 sendMessage:v17 toChat:v43 style:v14];
        }
        else
        {
          LOBYTE(v40) = v25;
          [(LegacySMSServiceSession *)self _relayMessage:v17 chat:v44 didSendSMS:v12 attemptingReplication:v41 forceReflection:a11 relayToWatchOnly:v28 > 0 shouldDisableScreenTimeRestrictions:v40 callerID:v42];
        }
        goto LABEL_31;
      }
    }
    IMSharedHelperDeviceHasMultipleSubscriptions();
  }
  if (IMOSLoggingEnabled())
  {
    unsigned __int8 v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "We have no peer devices, or this message was intended for an emergency number, not relaying message", buf, 2u);
    }
  }
  if (!v12) {
    goto LABEL_27;
  }
LABEL_31:
}

- (BOOL)_replicateMessage:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5 lastKnownReplicationDate:(id)a6 callerID:(id)a7
{
  uint64_t v9 = a5;
  id v12 = a3;
  id v13 = a4;
  id v14 = a6;
  id v15 = a7;
  unint64_t v16 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v17 = [v16 isReplicationEnabled];

  if (!v17)
  {
LABEL_14:
    BOOL v27 = 0;
    goto LABEL_21;
  }
  if (![(LegacySMSServiceSession *)self _shouldReplicateMessageItem:v12 chatStyle:v9 lastKnownReplicationDate:v14 callerID:v15])
  {
    if (IMOSLoggingEnabled())
    {
      unsigned __int8 v25 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
      {
        __int16 v26 = [v12 guid];
        *(_DWORD *)buf = 138412290;
        BOOL v38 = v26;
        _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Not replicating message %@", buf, 0xCu);
      }
    }
    goto LABEL_14;
  }
  uint64_t v18 = IMGetCachedDomainIntForKey();
  unsigned int v19 = +[IMLockdownManager sharedInstance];
  unsigned int v20 = [v19 isInternalInstall];

  int v21 = IMOSLoggingEnabled();
  if (v20 && v18 >= 1)
  {
    if (v21)
    {
      char v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        unsigned int v23 = [v12 guid];
        *(_DWORD *)buf = 138412546;
        BOOL v38 = v23;
        __int16 v39 = 1024;
        int v40 = v18;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "** Replication delay is enabled, delaying send of %@ by %d seconds", buf, 0x12u);
      }
    }
    dispatch_time_t v24 = dispatch_time(0, 1000000000 * v18);
    v32[0] = _NSConcreteStackBlock;
    v32[1] = 3221225472;
    v32[2] = sub_49620;
    v32[3] = &unk_8CFB8;
    id v33 = v12;
    unsigned __int8 v34 = self;
    id v35 = v13;
    char v36 = v9;
    dispatch_after(v24, (dispatch_queue_t)&_dispatch_main_q, v32);
  }
  else
  {
    if (v21)
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        unsigned int v29 = [v12 guid];
        *(_DWORD *)buf = 138412290;
        BOOL v38 = v29;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "Sending message %@ to replicationProxy", buf, 0xCu);
      }
    }
    id v30 = [(LegacySMSServiceSession *)self replicationProxy];
    [v30 sendMessage:v12 toChat:v13 style:v9];
  }
  BOOL v27 = 1;
LABEL_21:

  return v27;
}

- (int64_t)_iMessageCapabilityForSIMID:(id)a3
{
  id v3 = a3;
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  uint64_t v4 = +[IMCTSubscriptionUtilities sharedInstance];
  uint64_t v5 = [v4 registeredSIMIDs];

  id v6 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v6)
  {
    id v7 = v6;
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
      if (v7 == (id)++v10)
      {
        id v7 = [v5 countByEnumeratingWithState:&v12 objects:v16 count:16];
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

- (void)_relayMessage:(id)a3 chat:(id)a4 didSendSMS:(BOOL)a5 attemptingReplication:(BOOL)a6 forceReflection:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 callerID:(id)a10
{
  BOOL v50 = a5;
  BOOL v51 = a8;
  BOOL v10 = a7;
  BOOL v11 = a6;
  long long v14 = (__CFString *)a3;
  id v53 = a4;
  id v52 = a10;
  if (IMOSLoggingEnabled())
  {
    long long v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "We have peer devices, relaying message...", buf, 2u);
    }
  }
  unint64_t v16 = [v53 lastAddressedSIMID];
  int64_t v17 = [(LegacySMSServiceSession *)self _iMessageCapabilityForSIMID:v16];

  uint64_t v18 = [(__CFString *)v14 balloonBundleID];
  unsigned __int8 v19 = [v18 isEqualToString:IMBalloonPluginIdentifierRichLinks];

  unsigned int v20 = [(__CFString *)v14 fileTransferGUIDs];
  if (![v20 count]) {
    unsigned __int8 v19 = 1;
  }

  int v21 = IMOSLoggingEnabled();
  if (v19)
  {
    if (v21)
    {
      char v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        unsigned int v23 = [(__CFString *)v14 guid];
        *(_DWORD *)buf = 138412290;
        CFStringRef v67 = v23;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "No attachments or rich links, relaying message with guid %@", buf, 0xCu);
      }
    }
    dispatch_time_t v24 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    if (v14)
    {
      unsigned __int8 v25 = [v53 participants];
      value = objc_msgSend(v25, "__imArrayByApplyingBlock:", &stru_8DF40);

      __int16 v26 = [(LegacySMSServiceSession *)self _convertIMMessageItemToDictionary:v14];
      BOOL v27 = v26;
      if (v26)
      {
        CFDictionarySetValue(v24, off_99950, v26);
        if (value) {
          CFDictionarySetValue(v24, off_997F0, value);
        }
        uint64_t v28 = +[NSNumber numberWithInteger:v17];
        if (v28) {
          CFDictionarySetValue(v24, off_998B0, v28);
        }

        if (v11) {
          CFDictionarySetValue(v24, off_998D8, &__kCFBooleanTrue);
        }
        if (v10) {
          CFDictionarySetValue(v24, off_998C8, &__kCFBooleanTrue);
        }
        unsigned int v29 = sub_4A76C((int)[v53 style]);
        if (v29) {
          CFDictionarySetValue(v24, off_998E0, v29);
        }
        long long v48 = JWEncodeDictionary();
        id v47 = [v48 _FTCopyGzippedData];
        id v30 = [(__CFString *)v14 guid];
        id v31 = IDSGetUUIDData();
        unsigned int v32 = +[NSNumber numberWithBool:v51];
        id v33 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey, v31, IDSSendMessageOptionUUIDKey, &off_90DE0, IDSSendMessageOptionCommandKey, v47, IDSSendMessageOptionDataToEncryptKey, v32, @"_SMSServiceRelayToWatchOnly", 0];

        if (v50)
        {
          unsigned __int8 v34 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
          if (v34) {
            CFDictionarySetValue(v33, IDSSendMessageOptionTimeoutKey, v34);
          }

          id v35 = [(__CFString *)v14 guid];
          [(LegacySMSServiceSession *)self _forwardMessageToPeers:v24 messageType:143 guid:v35 originalSender:0 watchOnly:v51];
        }
        else
        {
          id v42 = [(LegacySMSServiceSession *)self localDevice];
          if (!v42
            || (unsigned int v43 = [(LegacySMSServiceSession *)self isProxyRegistered], v42, v43))
          {
            unsigned int v44 = [(LegacySMSServiceSession *)self sendDataToPeers:v33 forcedCallerID:v52 shouldFilterRecepients:0 requestProxySend:1 dontSendTo:0];
            if (IMOSLoggingEnabled())
            {
              objc_super v45 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
              {
                CFStringRef v46 = @"NO";
                if (v44) {
                  CFStringRef v46 = @"YES";
                }
                *(_DWORD *)buf = 138412290;
                CFStringRef v67 = v46;
                _os_log_impl(&dword_0, v45, OS_LOG_TYPE_INFO, "Success sending data to peers: %@", buf, 0xCu);
              }
            }
          }
        }
      }
      else if (IMOSLoggingEnabled())
      {
        BOOL v41 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v67 = v14;
          _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "Failed to create an Message Dictionary from the IM Message, Original Message: %@", buf, 0xCu);
        }
      }
    }
  }
  else
  {
    if (v21)
    {
      char v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        id v37 = [(__CFString *)v14 guid];
        *(_DWORD *)buf = 138412290;
        CFStringRef v67 = v37;
        _os_log_impl(&dword_0, v36, OS_LOG_TYPE_INFO, "Message with Guid %@ contains attachments, uploading to MMCS", buf, 0xCu);
      }
    }
    attachmentController = self->_attachmentController;
    __int16 v39 = [v53 lastAddressedLocalHandle];
    int v40 = [v53 lastAddressedSIMID];
    v56[0] = _NSConcreteStackBlock;
    v56[1] = 3221225472;
    v56[2] = sub_4A06C;
    v56[3] = &unk_8DEF8;
    long long v57 = v14;
    id v58 = v53;
    id v59 = self;
    int64_t v61 = v17;
    BOOL v62 = v11;
    BOOL v63 = v10;
    BOOL v64 = v51;
    BOOL v65 = v50;
    id v60 = v52;
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_4A7E4;
    v54[3] = &unk_8DF20;
    v54[4] = self;
    id v55 = v57;
    [(LegacySMSAttachmentController *)attachmentController processAttachmentsForPeerRelayForMessage:v55 lastAddressHandle:v39 lastAddressedSIMID:v40 completionBlock:v56 uploadFailureBlock:v54];

    dispatch_time_t v24 = (__CFDictionary *)v57;
  }
}

- (unint64_t)_sendingDecisionForMessageItem:(id)a3 callerID:(id)a4 chat:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v35 = a5;
  unsigned int v10 = [(LegacySMSServiceSession *)self _localDeviceSupportsSMS];
  unsigned int v11 = [(LegacySMSServiceSession *)self _canSendWithCallerID:v9];
  long long v12 = +[FTDeviceSupport sharedInstance];
  unsigned int v13 = [v12 supportsCellularData];

  if (v13) {
    unsigned int v13 = [v8 useStandalone];
  }
  long long v14 = v9;
  if ([v9 length]) {
    unsigned int v15 = [v9 _appearsToBePhoneNumber];
  }
  else {
    unsigned int v15 = 0;
  }
  unint64_t v16 = [v35 lastAddressedSIMID];
  unsigned int v17 = [(LegacySMSServiceSession *)self _localDeviceSupportsSMSAndDoesNotHaveAPhoneNumberForSIMID:v16];

  uint64_t v18 = [v35 lastAddressedLocalHandle];
  if ([v18 length])
  {
    [v35 lastAddressedLocalHandle];
    unsigned int v20 = v19 = v8;
    unsigned __int8 v21 = [(LegacySMSServiceSession *)self _isOneOfMyActiveAlias:v20];

    id v8 = v19;
  }
  else
  {
    unsigned __int8 v21 = 0;
  }

  if (v13)
  {
    if (IMOSLoggingEnabled())
    {
      char v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        __int16 v42 = 0;
        unsigned int v23 = "This is an emergency message asked to be sent over CT: Sending Message via CT";
        dispatch_time_t v24 = (uint8_t *)&v42;
LABEL_17:
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, v23, v24, 2u);
        goto LABEL_18;
      }
      goto LABEL_18;
    }
    goto LABEL_19;
  }
  if ((v11 & v10 & v15) == 1)
  {
    if (IMOSLoggingEnabled())
    {
      char v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        unsigned int v23 = "My Caller ID & Phone Number are the same, I am SMS Capable, My callerID is a phone number: Sending Message via CT";
        dispatch_time_t v24 = buf;
        goto LABEL_17;
      }
LABEL_18:
    }
LABEL_19:
    unint64_t v25 = 1;
    goto LABEL_20;
  }
  if (IMSharedHelperDeviceHasMultipleSubscriptions() && [v8 useStandalone])
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_19;
    }
    char v22 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    __int16 v40 = 0;
    unsigned int v23 = "Subscription on chat cannot be found in active subscriptions but message must be sent because it is an SOS message.";
    dispatch_time_t v24 = (uint8_t *)&v40;
    goto LABEL_17;
  }
  if (v17)
  {
    BOOL v27 = v8;
    if (IMOSLoggingEnabled())
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)__int16 v39 = 0;
        _os_log_impl(&dword_0, v28, OS_LOG_TYPE_INFO, "I do not have a phone number, however I am sms capable: Sending Message via CT", v39, 2u);
      }
    }
    unsigned int v29 = [v35 lastAddressedSIMID];
    [v27 setDestinationCallerID:v29];

    id v8 = v27;
    unint64_t v25 = 5;
    goto LABEL_20;
  }
  if (((v15 | v10 ^ 1) & 1) == 0 && (IMSharedHelperDeviceHasMultipleActiveSubscriptions() & 1) == 0)
  {
    if (!IMOSLoggingEnabled()) {
      goto LABEL_19;
    }
    char v22 = OSLogHandleForIMFoundationCategory();
    if (!os_log_type_enabled(v22, OS_LOG_TYPE_INFO)) {
      goto LABEL_18;
    }
    __int16 v38 = 0;
    unsigned int v23 = "My CallerID is not set to phone number However I am SMS Capable: Sending Message via CT";
    dispatch_time_t v24 = (uint8_t *)&v38;
    goto LABEL_17;
  }
  id v30 = v8;
  char v31 = IMSharedHelperDeviceHasMultipleActiveSubscriptions() & v10 ^ 1 | v11 | v21;
  int v32 = IMOSLoggingEnabled();
  if (v31)
  {
    if (v32)
    {
      id v8 = v30;
      id v33 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)char v36 = 0;
        _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, ": Calling Did Send Message, Another device will relay this message for me", v36, 2u);
      }

      unint64_t v25 = 2;
      goto LABEL_20;
    }
    unint64_t v25 = 2;
LABEL_48:
    id v8 = v30;
    goto LABEL_20;
  }
  if (!v32)
  {
    unint64_t v25 = 8;
    goto LABEL_48;
  }
  id v8 = v30;
  unsigned __int8 v34 = OSLogHandleForIMFoundationCategory();
  if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
  {
    *(_WORD *)id v37 = 0;
    _os_log_impl(&dword_0, v34, OS_LOG_TYPE_INFO, "My device is capable of sending SMS but is not on correct subscription. Failing message", v37, 2u);
  }

  unint64_t v25 = 8;
LABEL_20:

  return v25;
}

- (id)_callerIDForChatWithChatIdentifier:(id)a3 chatStyle:(unsigned __int8)a4 foundChat:(id)a5
{
  unsigned int v41 = a4;
  unsigned int v43 = (__CFString *)a3;
  id v7 = a5;
  __int16 v42 = [(LegacySMSServiceSession *)self _myCTPhoneNumber];
  id v8 = [(LegacySMSServiceSession *)self _callerIDForRelay];
  if ([(__CFString *)v8 _appearsToBePhoneNumber]) {
    unsigned int v9 = [(LegacySMSServiceSession *)self _isAliasActiveForSMSRelay:v8];
  }
  else {
    unsigned int v9 = 0;
  }
  unsigned int v10 = [v7 lastAddressedLocalHandle];
  unsigned int v11 = [v7 lastAddressedSIMID];
  if (IMOSLoggingEnabled())
  {
    long long v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v45 = v10;
      __int16 v46 = 2112;
      CFStringRef v47 = v11;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "The Last Addressed Handle For This Chat is %@ and lastAddressedSIMID is %@", buf, 0x16u);
    }
  }
  int HasMultipleActiveSubscriptions = IMSharedHelperDeviceHasMultipleActiveSubscriptions();
  int HasMultipleSubscriptionsWithAtLeastOneActive = IMSharedHelperDeviceHasMultipleSubscriptionsWithAtLeastOneActive();
  if (IMOSLoggingEnabled())
  {
    unsigned int v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      CFStringRef v16 = @"NO";
      if (HasMultipleActiveSubscriptions) {
        CFStringRef v17 = @"YES";
      }
      else {
        CFStringRef v17 = @"NO";
      }
      if (HasMultipleSubscriptionsWithAtLeastOneActive) {
        CFStringRef v16 = @"YES";
      }
      *(_DWORD *)buf = 138412546;
      CFStringRef v45 = v17;
      __int16 v46 = 2112;
      CFStringRef v47 = v16;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Has multiple active subscriptions %@, has at least one active %@", buf, 0x16u);
    }
  }
  if (HasMultipleSubscriptionsWithAtLeastOneActive
    && ![(__CFString *)v10 length]
    && [(__CFString *)v11 length])
  {
    int v32 = +[IMCTSubscriptionUtilities sharedInstance];
    id v33 = [v32 ctSubscriptionInfo];
    unsigned __int8 v34 = objc_msgSend(v33, "__im_subscriptionContextForForSimID:", v11);

    uint64_t v18 = [v34 phoneNumber];

    if (IMOSLoggingEnabled())
    {
      id v35 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        CFStringRef v45 = v18;
        _os_log_impl(&dword_0, v35, OS_LOG_TYPE_INFO, "Last addressed handle was nil but found it a phone number on the context so using that phone number %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v18 = v10;
  }
  if ([(__CFString *)v18 length])
  {
    unsigned __int8 v19 = [(LegacySMSServiceSession *)self _isOneOfMyActiveAlias:v18];
    if (![(__CFString *)v18 length]) {
      goto LABEL_31;
    }
    if (v19)
    {
LABEL_26:
      if (IMOSLoggingEnabled())
      {
        unsigned int v20 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v45 = v18;
          _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "We have a last addressed alias for this chat, and its one of our active aliases, setting callerID to %@", buf, 0xCu);
        }
      }
LABEL_30:
      uint64_t v18 = v18;

      [(LegacySMSServiceSession *)self _updateLastAddressedIDsIfNeededForChatWithIdentifier:v43 style:v41 lastAddressedHandle:v18 lastAddressedSIMID:v11];
LABEL_51:
      id v8 = v18;
      goto LABEL_52;
    }
  }
  else if (![(__CFString *)v18 length])
  {
    goto LABEL_31;
  }
  if (_FTAreIDsEquivalent()) {
    goto LABEL_26;
  }
LABEL_31:
  if (HasMultipleActiveSubscriptions)
  {
    if ([(__CFString *)v18 length]
      && [(__CFString *)v18 _appearsToBePhoneNumber])
    {
      if (IMOSLoggingEnabled())
      {
        unsigned __int8 v21 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          CFStringRef v45 = v18;
          _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "We have a last addressed alias for this chat with at least one subscription active, setting callerID to %@", buf, 0xCu);
        }
      }
      goto LABEL_30;
    }
    BOOL v23 = [(__CFString *)v11 length] == 0;
    int v24 = IMOSLoggingEnabled();
    if (!v23)
    {
      if (v24)
      {
        unint64_t v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412546;
          CFStringRef v45 = v18;
          __int16 v46 = 2112;
          CFStringRef v47 = v11;
          _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "We do not have a valid lastAddressedHandle %@ so using lastAddressedSIMID to send %@", buf, 0x16u);
        }
      }
      __int16 v26 = +[IMCTSubscriptionUtilities sharedInstance];
      BOOL v27 = [v26 ctSubscriptionInfo];
      uint64_t v28 = objc_msgSend(v27, "__im_subscriptionContextForForSimID:", v11);

      unsigned int v29 = [v28 phoneNumber];

      uint64_t v18 = v29;
      [(LegacySMSServiceSession *)self _updateLastAddressedIDsIfNeededForChatWithIdentifier:v43 style:v41 lastAddressedHandle:v18 lastAddressedSIMID:v11];

      goto LABEL_51;
    }
    if (v24)
    {
      __int16 v39 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Both simID and phoneNumber are not valid to send with.", buf, 2u);
      }
    }
  }
  else
  {
    if (!v9)
    {
      if (v42)
      {
        int v36 = _FTAreIDsEquivalent() ^ 1;
        if (!v18) {
          LOBYTE(v36) = 0;
        }
        if ((v36 & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            id v37 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v45 = v43;
              __int16 v46 = 2112;
              CFStringRef v47 = v42;
              _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "Updating last address handle for chats with identifier %@ to be my phone number %@", buf, 0x16u);
            }
          }
          [(LegacySMSServiceSession *)self _updateLastAddressedIDsIfNeededForChatWithIdentifier:v43 style:v41 lastAddressedHandle:v42 lastAddressedSIMID:v11];
        }
        __int16 v38 = v42;
      }
      else
      {
        __int16 v40 = [(LegacySMSServiceSession *)self _dominentPhoneNumberAlias];

        if (!v40) {
          goto LABEL_52;
        }
        __int16 v38 = [(LegacySMSServiceSession *)self _dominentPhoneNumberAlias];
      }
      id v8 = v38;
      goto LABEL_52;
    }
    if (IMOSLoggingEnabled())
    {
      char v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v45 = v43;
        __int16 v46 = 2112;
        CFStringRef v47 = v8;
        _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Updating last address handle for chats with identifier %@ to be %@", buf, 0x16u);
      }
    }
    [(LegacySMSServiceSession *)self _updateLastAddressedIDsIfNeededForChatWithIdentifier:v43 style:v41 lastAddressedHandle:v8 lastAddressedSIMID:v11];
  }
LABEL_52:
  id v30 = v8;

  return v30;
}

- (BOOL)_allowedToSendMessage:(id)a3 toChatIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isFinished] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        unsigned int v11 = [v6 guid];
        int v16 = 138412290;
        CFStringRef v17 = v11;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Not sending unfinished message %@", (uint8_t *)&v16, 0xCu);
      }
    }
    goto LABEL_19;
  }
  if ([(LegacySMSServiceSession *)self _newFeatureRequiredByMessageItem:v6 chatIdentifier:v7])
  {
    if (IMOSLoggingEnabled())
    {
      id v8 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        unsigned int v9 = [v6 guid];
        int v16 = 138412290;
        CFStringRef v17 = v9;
        _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, " ** New Feature, and backwards compat is not enabled for message %@", (uint8_t *)&v16, 0xCu);
      }
    }
    [v6 setErrorCode:5];
LABEL_19:
    BOOL v12 = 0;
    goto LABEL_20;
  }
  if (![(LegacySMSServiceSession *)self isValidMMS:v6])
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        long long v14 = [v6 guid];
        int v16 = 138412290;
        CFStringRef v17 = v14;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Message with guid: %@ is an invalid MMS message, marking as failed and not forwarding to clients", (uint8_t *)&v16, 0xCu);
      }
    }
    [v6 setErrorCode:4];
    goto LABEL_19;
  }
  BOOL v12 = 1;
LABEL_20:

  return v12;
}

- (BOOL)_shouldFailSMSMessageForTesting:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5
{
  id v6 = a3;
  id v7 = a4;
  int v8 = IMGetCachedDomainBoolForKey();
  if (v8)
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = 0x4010000000000000;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, " ** FailSendingSMSMessages is enabled, failing send message after %f seconds", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      unsigned int v10 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = 0x4010000000000000;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, " ** FailSendingSMSMessages is enabled, failing send message after %f seconds", buf, 0xCu);
      }
    }
    id v12 = v6;
    id v13 = v7;
    im_dispatch_after();
  }
  return v8;
}

- (BOOL)_newFeatureRequiredByMessageItem:(id)a3 chatIdentifier:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = (char *)[v5 associatedMessageType];
  if (v7 != (unsigned char *)&stru_790.reserved1 + 2 && v7 != &stru_BA0.segname[14])
  {
    int v8 = (char *)[v5 associatedMessageType];
    if (v8 != &stru_BA0.segname[15] && v8 != (unsigned char *)&stru_790.reserved1 + 3) {
      goto LABEL_14;
    }
  }
  id v9 = +[IDSServerBag sharedInstanceForBagType:1];
  unsigned int v10 = [v9 objectForKey:@"backwards-compat-enabled-etap"];
  unsigned int v11 = +[IMLockdownManager sharedInstance];
  unsigned int v12 = [v11 isInternalInstall];

  if (v12)
  {
    id v13 = +[NSUserDefaults messagesAppDomain];
    long long v14 = [v13 arrayForKey:@"chat-id-allow-list"];

    if ([v14 containsObject:v6])
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v34 = v6;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Ignoring backwards compat check and allowing sending message to %@", buf, 0xCu);
        }
      }
      goto LABEL_25;
    }
  }
  unsigned int v16 = [v10 BOOLValue];

  if (v16)
  {
LABEL_14:
    CFStringRef v17 = [v5 fileTransferGUIDs];
    unsigned int v10 = +[IMDFileTransferCenter sharedInstance];
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id v9 = v17;
    id v18 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
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
        unsigned __int8 v21 = objc_msgSend(v10, "transferForGUID:", *(void *)(*((void *)&v28 + 1) + 8 * v20), (void)v28);
        unsigned __int8 v22 = [v21 isAdaptiveImageGlyph];

        if (v22) {
          break;
        }
        if (v18 == (id)++v20)
        {
          id v18 = [v9 countByEnumeratingWithState:&v28 objects:v32 count:16];
          if (v18) {
            goto LABEL_16;
          }
          goto LABEL_22;
        }
      }

      int v24 = +[IDSServerBag sharedInstanceForBagType:1];
      unint64_t v25 = [v24 objectForKey:@"backwards-compat-enabled-adaptive-image-glyphs"];
      unsigned __int8 v26 = [v25 BOOLValue];

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

- (id)_compatibleMessageToSendForMessageItem:(id)a3
{
  id v3 = a3;
  uint64_t v4 = [v3 balloonBundleID];
  id v5 = IMBalloonExtensionIDWithSuffix();
  unsigned int v6 = [v4 isEqualToString:v5];

  if (v6)
  {
    id v7 = IMExtensionPayloadUnarchivingClasses();
    id v8 = objc_alloc((Class)NSKeyedUnarchiver);
    id v9 = [v3 payloadData];
    id v31 = 0;
    id v10 = [v8 initForReadingFromData:v9 error:&v31];
    id v11 = v31;

    unsigned int v12 = [v10 decodeObjectOfClasses:v7 forKey:NSKeyedArchiveRootObjectKey];
    if (v11 && IMOSLoggingEnabled())
    {
      id v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v33 = v11;
        _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Failed to unarchive attributionInfo. Error: %@", buf, 0xCu);
      }
    }
    if (v12 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
    {
      long long v14 = [v12 objectForKey:IMExtensionPayloadAlternateTextKey];
      uint64_t v15 = [v14 objectForKey:@"messageText"];
      BOOL v16 = v15 == 0;

      if (!v16)
      {
        id v17 = objc_alloc((Class)NSMutableAttributedString);
        id v18 = [v14 objectForKey:@"messageText"];
        id v19 = [v17 initWithString:v18];

        if (v19)
        {
          id v29 = objc_alloc((Class)IMMessageItem);
          long long v30 = [v3 sender];
          uint64_t v20 = [v3 time];
          id v21 = [v3 flags];
          unsigned __int8 v22 = +[NSString stringGUID];
          id v23 = [v29 initWithSender:v30 time:v20 body:v19 attributes:0 fileTransferGUIDs:0 flags:v21 error:0 guid:v22 threadIdentifier:0];

          if (IMOSLoggingEnabled())
          {
            int v24 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
            {
              unint64_t v25 = [v23 guid];
              *(_DWORD *)buf = 138412290;
              id v33 = v25;
              _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "Sending activity sharing fallback for message %@", buf, 0xCu);
            }
          }
          char v26 = 0;
          goto LABEL_23;
        }
      }
    }
    else
    {
      long long v14 = 0;
    }
    if (IMOSLoggingEnabled())
    {
      BOOL v27 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Activity sharing payload doesn't have message text to send. Bailing", buf, 2u);
      }
    }
    id v23 = v3;
    id v19 = 0;
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

- (BOOL)_canSendWithCallerID:(id)a3
{
  id v4 = a3;
  if (IMSharedHelperDeviceHasMultipleActiveSubscriptions())
  {
    id v5 = +[IMCTSubscriptionUtilities sharedInstance];
    unsigned int v6 = [v5 ctSubscriptionInfo];
    LODWORD(self) = objc_msgSend(v6, "__im_containsPhoneNumber:", v4);

    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        CFStringRef v8 = @"NO";
        if (self) {
          CFStringRef v8 = @"YES";
        }
        int v11 = 138412290;
        CFStringRef v12 = v8;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Should send if caller ID is part of the subscription context: %@", (uint8_t *)&v11, 0xCu);
      }
    }
  }
  else
  {
    id v9 = [(LegacySMSServiceSession *)self _myCTPhoneNumber];
    LOBYTE(self) = _FTAreIDsEquivalent();
  }
  return (char)self;
}

- (void)_resetAndBroadcastBlackholeErrorStateIfNeededForChatIdentifier:(id)a3 chatStyle:(unsigned __int8)a4
{
  uint64_t v4 = a4;
  id v6 = a3;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  id v7 = +[IMDChatRegistry sharedInstance];
  CFStringRef v8 = [v7 allExistingChatsWithIdentifier:v6 style:v4];

  id v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    id v10 = v9;
    uint64_t v11 = *(void *)v17;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v8);
        }
        id v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v13 receivedBlackholeError])
        {
          [v13 updateReceivedBlackholeError:0];
          long long v14 = +[IMDChatStore sharedInstance];
          v15[0] = _NSConcreteStackBlock;
          v15[1] = 3221225472;
          v15[2] = sub_4C6A8;
          v15[3] = &unk_8DF68;
          v15[4] = self;
          [v14 remapMessageError:43 toError:0 forChat:v13 completion:v15];
        }
      }
      id v10 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
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

- (void)loginServiceSessionWithAccount:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      CFStringRef v8 = self;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "SMS: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  [(LegacySMSServiceSession *)self refreshServiceCapabilities];
  [(LegacySMSServiceSession *)self serviceSessionDidLoginWithAccount:v4];
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      CFStringRef v8 = self;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%@: Log in.", (uint8_t *)&v7, 0xCu);
    }
  }
}

- (void)logoutServiceSessionWithAccount:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    id v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      CFStringRef v8 = self;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "SMS: %@", (uint8_t *)&v7, 0xCu);
    }
  }
  if ([v4 loginStatus] != (char *)&dword_0 + 2)
  {
    [v4 setLoginStatus:0 message:0];
    [(LegacySMSServiceSession *)self serviceSessionDidLogoutWithAccount:v4];
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v7 = 138412290;
        CFStringRef v8 = self;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "%@: Logging out.", (uint8_t *)&v7, 0xCu);
      }
    }
  }
}

- (void)sendRepositionStickerMessage:(id)a3 chatIdentifier:(id)a4 accountID:(id)a5 style:(unsigned __int8)a6
{
  uint64_t v6 = a6;
  id v17 = a3;
  id v10 = a4;
  id v11 = a5;
  CFStringRef v12 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v13 = [v12 isPriusEnabled];

  if (v13)
  {
    long long v14 = [(LegacySMSServiceSession *)self chatForChatIdentifier:v10 style:v6];
    uint64_t v15 = [(LegacySMSServiceSession *)self _callerIDForChatWithChatIdentifier:v10 chatStyle:v6 foundChat:v14];
    if (v6 == 43
      && [(LegacySMSServiceSession *)self _replicationRequirementsSatisfiedForPhoneNumber:v15 simID:0])
    {
      long long v16 = [(LegacySMSServiceSession *)self replicationProxy];
      [v16 sendRepositionStickerMessage:v17 chatIdentifier:v10 accountID:v11 style:43];
    }
  }
}

- (void)sendEditedMessage:(id)a3 previousMessage:(id)a4 partIndex:(int64_t)a5 editType:(unint64_t)a6 toChatIdentifier:(id)a7 style:(unsigned __int8)a8 account:(id)a9 backwardCompatabilityText:(id)a10
{
  uint64_t v10 = a8;
  id v16 = a3;
  id v47 = a4;
  id v17 = a7;
  id v48 = a9;
  id v18 = a10;
  long long v19 = +[IMFeatureFlags sharedFeatureFlags];
  LODWORD(a4) = [v19 isPriusEnabled];

  if (a4)
  {
    __int16 v46 = [(LegacySMSServiceSession *)self chatForChatIdentifier:v17 style:v10];
    CFStringRef v45 = [(LegacySMSServiceSession *)self _callerIDForChatWithChatIdentifier:v17 chatStyle:v10 foundChat:v46];
    if (v10 == 43
      && [(LegacySMSServiceSession *)self _replicationRequirementsSatisfiedForPhoneNumber:v45 simID:0])
    {
      uint64_t v20 = [(LegacySMSServiceSession *)self replicationProxy];
      [v20 sendEditedMessage:v16 previousMessage:v47 partIndex:a5 editType:a6 toChatIdentifier:v17 style:43 account:v48 backwardCompatabilityText:v18];
    }
    id v21 = +[IMFeatureFlags sharedFeatureFlags];
    unsigned int v22 = [v21 isPriusCompatibilityEnabled];

    if (v22)
    {
      id v23 = (__CFString *)[v16 copyForBackwardsCompatibility];
      [(__CFString *)v23 setBody:v18];
      unsigned int v24 = [(LegacySMSServiceSession *)self _localDeviceSupportsSMS];
      int v25 = IMOSLoggingEnabled();
      if (v24)
      {
        if (v25)
        {
          char v26 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v50 = v23;
            _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "Device supports SMS, sending backwards compatibility edit to CT: %@", buf, 0xCu);
          }
        }
        [(LegacySMSServiceSession *)self sendCTMessageFromIMMessageItem:v23 forChat:v17 chat:v46 style:v10];
      }
      else
      {
        if (v25)
        {
          BOOL v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v50 = v23;
            _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Device doesn't support SMS, sending backwards compatibility edit to relay devices: %@", buf, 0xCu);
          }
        }
        CFMutableDictionaryRef theDict = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        long long v28 = [v46 participants];
        unsigned int v43 = objc_msgSend(v28, "__imArrayByApplyingBlock:", &stru_8DF88);

        value = [(LegacySMSServiceSession *)self _convertIMMessageItemToDictionary:v23];
        id v29 = value;
        if (value)
        {
          CFDictionarySetValue(theDict, off_99950, value);
          if (v43) {
            CFDictionarySetValue(theDict, off_997F0, v43);
          }
          CFDictionarySetValue(theDict, off_998D0, &__kCFBooleanTrue);
          __int16 v39 = sub_4A76C(v10);
          if (v39) {
            CFDictionarySetValue(theDict, off_998E0, v39);
          }
          unsigned int v41 = JWEncodeDictionary();
          id v40 = [v41 _FTCopyGzippedData];
          long long v30 = [(__CFString *)v23 guid];
          id v31 = IDSGetUUIDData();
          int v32 = +[NSNumber numberWithInteger:143];
          id v33 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", &__kCFBooleanTrue, IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey, v31, IDSSendMessageOptionUUIDKey, v32, IDSSendMessageOptionCommandKey, v40, IDSSendMessageOptionDataToEncryptKey, 0);

          id v34 = [(LegacySMSServiceSession *)self localDevice];
          if (!v34
            || (unsigned int v35 = [(LegacySMSServiceSession *)self isProxyRegistered], v34, v35))
          {
            unsigned int v36 = [(LegacySMSServiceSession *)self sendDataToPeers:v33 forcedCallerID:v45 shouldFilterRecepients:0 requestProxySend:1 dontSendTo:0];
            if (IMOSLoggingEnabled())
            {
              id v37 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
              {
                CFStringRef v38 = @"NO";
                if (v36) {
                  CFStringRef v38 = @"YES";
                }
                *(_DWORD *)buf = 138412290;
                CFStringRef v50 = v38;
                _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "Success sending data to peers: %@", buf, 0xCu);
              }
            }
          }

          id v29 = value;
        }
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
  uint64_t v15 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v16 = [v15 isPriusEnabled];

  if (v8 == 43 && v16)
  {
    id v17 = [(LegacySMSServiceSession *)self replicationProxy];
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
  id v17 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v18 = [v17 isPriusEnabled];

  if (v10 == 43 && v18)
  {
    long long v19 = [(LegacySMSServiceSession *)self replicationProxy];
    [v19 retryGroupPhotoUpload:v20 toChatID:v14 identifier:v15 style:43 account:v16 isPhotoRefresh:v8];
  }
}

- (void)updateDisplayName:(id)a3 fromDisplayName:(id)a4 fromID:(id)a5 forChatID:(id)a6 identifier:(id)a7 style:(unsigned __int8)a8 messageID:(id)a9
{
  int v9 = a8;
  id v23 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  id v20 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v21 = [v20 isPriusEnabled];

  if (v9 == 43 && v21)
  {
    unsigned int v22 = [(LegacySMSServiceSession *)self replicationProxy];
    [v22 updateDisplayName:v23 fromDisplayName:v15 fromID:v16 forChatID:v17 identifier:v18 style:43 messageID:v19];
  }
}

- (void)_registerForCTNotifications
{
  if (!self->_isRegistered)
  {
    self->_isRegistered = 1;
    if (IMOSLoggingEnabled())
    {
      v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v3 = 0;
        _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Registering for Message Receipts.", v3, 2u);
      }
    }
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterAddObserver();
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterAddObserver();
  }
}

- (void)_unregisterForCTNotifications
{
  if (self->_isRegistered)
  {
    self->_isRegistered = 0;
    if (IMOSLoggingEnabled())
    {
      v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v3 = 0;
        _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Unregistering for Message Receipts.", v3, 2u);
      }
    }
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterRemoveObserver();
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterRemoveObserver();
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterRemoveObserver();
    CTTelephonyCenterGetDefault();
    CTTelephonyCenterRemoveObserver();
  }
}

- (unsigned)_readMMSUserOverrideForSingleSubscription
{
  return +[IMCTSMSUtilities IMReadMMSUserOverrideForPhoneNumber:0 simID:0];
}

- (BOOL)_checkMMSEnablementForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    int v8 = +[IMCTSMSUtilities IMMMSEnabledForPhoneNumber:v6 simID:v7];
    if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        CFStringRef v10 = @"NO";
        if (v8) {
          CFStringRef v10 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v39 = v10;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "MMS enabled: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v11 = +[FTDeviceSupport sharedInstance];
    unsigned int v12 = [v11 supportsMMS];

    id v13 = +[IMCTSubscriptionUtilities sharedInstance];
    id v14 = [v13 ctSubscriptionInfo];
    id v15 = objc_msgSend(v14, "__im_subscriptionContextForForSimID:phoneNumber:", v7, v6);

    id v16 = +[CTMessageCenter sharedMessageCenter];
    unsigned int v17 = [v16 isMmsConfiguredForSub:v15];

    unsigned int v32 = [(LegacySMSServiceSession *)self _readMMSUserOverrideForSingleSubscription];
    unsigned int v33 = v17;
    if (v32) {
      int v8 = v12 & v17;
    }
    else {
      int v8 = 0;
    }
    if ((v12 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        id v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "MMS not supported on current device, checking for relay devices", buf, 2u);
        }
      }
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id v19 = [(IDSService *)self->_relayService devices];
      id v20 = [v19 countByEnumeratingWithState:&v34 objects:v46 count:16];
      if (v20)
      {
        uint64_t v21 = *(void *)v35;
        while (2)
        {
          for (i = 0; i != v20; i = (char *)i + 1)
          {
            if (*(void *)v35 != v21) {
              objc_enumerationMutation(v19);
            }
            id v23 = *(void **)(*((void *)&v34 + 1) + 8 * i);
            if ([v23 supportsSMSRelay]
              && [v23 supportsMMSRelay])
            {
              if (IMOSLoggingEnabled())
              {
                unsigned int v24 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                {
                  int v25 = [v23 name];
                  *(_DWORD *)buf = 138412290;
                  CFStringRef v39 = v25;
                  _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "MMS relay device found: %@", buf, 0xCu);
                }
              }
              int v8 = 1;
              goto LABEL_31;
            }
          }
          id v20 = [v19 countByEnumeratingWithState:&v34 objects:v46 count:16];
          if (v20) {
            continue;
          }
          break;
        }
      }
LABEL_31:
    }
    if (IMOSLoggingEnabled())
    {
      char v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        CFStringRef v27 = @"NO";
        if (v8) {
          CFStringRef v28 = @"YES";
        }
        else {
          CFStringRef v28 = @"NO";
        }
        if (v12) {
          CFStringRef v29 = @"YES";
        }
        else {
          CFStringRef v29 = @"NO";
        }
        *(_DWORD *)buf = 138413058;
        CFStringRef v39 = v28;
        if (v33) {
          CFStringRef v30 = @"YES";
        }
        else {
          CFStringRef v30 = @"NO";
        }
        __int16 v40 = 2112;
        CFStringRef v41 = v29;
        __int16 v42 = 2112;
        CFStringRef v43 = v30;
        if (v32) {
          CFStringRef v27 = @"YES";
        }
        __int16 v44 = 2112;
        CFStringRef v45 = v27;
        _os_log_impl(&dword_0, v26, OS_LOG_TYPE_INFO, "MMS enabled: %@ (GS:%@, CT:%@, User:%@)", buf, 0x2Au);
      }
    }
  }

  return v8;
}

- (void)_synchronizeMMSCapabilityToWatch:(BOOL)a3
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
      int v6 = 138412290;
      CFStringRef v7 = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Calling IMSynchronizeMMSCapabilityToWatch isMMSEnabled %@", (uint8_t *)&v6, 0xCu);
    }
  }
  +[IMCTSMSUtilities IMSynchronizeMMSCapabilityToWatch:v3];
}

- (BOOL)_syncedMMSEnabledValue
{
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MMSRelayEnabled", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
  BOOL v3 = keyExistsAndHasValidFormat == 0;
  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      CFStringRef v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        CFStringRef v7 = @"NO";
        if (AppBooleanValue) {
          CFStringRef v7 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v11 = v7;
        _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "_syncedMMSEnabledValue does not exist. Defaulting to %@", buf, 0xCu);
      }
      goto LABEL_13;
    }
  }
  else if (v4)
  {
    CFStringRef v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      CFStringRef v6 = @"NO";
      if (AppBooleanValue) {
        CFStringRef v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v11 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "_syncedMMSEnabledValue %@", buf, 0xCu);
    }
LABEL_13:
  }
  return AppBooleanValue != 0;
}

- (void)updateMMSCapability
{
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    BOOL v3 = +[IMCTSubscriptionUtilities sharedInstance];
    id v19 = [v3 ctSubscriptionInfo];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    int v4 = [v19 subscriptions];
    id v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v21;
      do
      {
        for (i = 0; i != v5; i = (char *)i + 1)
        {
          if (*(void *)v21 != v6) {
            objc_enumerationMutation(v4);
          }
          int v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          int v9 = [v8 phoneNumber];
          CFStringRef v10 = [v8 labelID];
          BOOL v11 = [(LegacySMSServiceSession *)self _checkMMSEnablementForPhoneNumber:v9 simID:v10];

          unsigned int v12 = [v8 userDefaultVoice];

          if (v12)
          {
            if (IMOSLoggingEnabled())
            {
              id v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                CFStringRef v14 = @"NO";
                if (v11) {
                  CFStringRef v14 = @"YES";
                }
                CFStringRef v25 = v14;
                __int16 v26 = 2112;
                CFStringRef v27 = v8;
                _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Synchronize isMMSEnabled %@ for voice preferred subscription %@", buf, 0x16u);
              }
            }
            [(LegacySMSServiceSession *)self _synchronizeMMSCapabilityToWatch:v11];
          }
        }
        id v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v5);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.MMSCapable", 0, 0, 1u);
  }
  else
  {
    BOOL v16 = [(LegacySMSServiceSession *)self _checkMMSEnablementForPhoneNumber:0 simID:0];
    if (qword_9C068 != -1) {
      dispatch_once(&qword_9C068, &stru_8DFA8);
    }
    if (IMOSLoggingEnabled())
    {
      unsigned int v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        CFStringRef v18 = @"NO";
        if (v16) {
          CFStringRef v18 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        CFStringRef v25 = v18;
        _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Setting MMS token to: %@", buf, 0xCu);
      }
    }
    notify_set_state(dword_9C060, v16);
    [(LegacySMSServiceSession *)self _synchronizeMMSCapabilityToWatch:v16];
  }
}

- (id)_convertIMMessageItemToDictionary:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Converting IM Message to NSDictionary", (uint8_t *)&v37, 2u);
    }
  }
  id v5 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFDictionarySetValue(v5, off_997E0, @"1");
  uint64_t v6 = [v3 handle];
  if (v6)
  {
    CFDictionarySetValue(v5, off_99970, v6);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_5F168();
  }

  CFStringRef v7 = [v3 service];
  if (v7)
  {
    CFDictionarySetValue(v5, off_99978, v7);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_5F0E4();
  }

  int v8 = [v3 guid];
  if (v8)
  {
    CFDictionarySetValue(v5, off_99980, v8);
  }
  else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
  {
    sub_5F060();
  }

  int v9 = [(__CFDictionary *)v5 objectForKey:off_99970];
  if (v9
    || ([(__CFDictionary *)v5 objectForKey:off_99978],
        (int v9 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    long long v35 = [(__CFDictionary *)v5 objectForKey:off_99980];
    BOOL v36 = v35 == 0;

    if (v36)
    {
      unsigned int v33 = 0;
      goto LABEL_63;
    }
  }
  CFStringRef v10 = [v3 body];
  BOOL v11 = [v10 string];

  if (v11) {
    CFDictionarySetValue(v5, off_99958, v11);
  }

  unsigned int v12 = [v3 subject];
  if (v12) {
    CFDictionarySetValue(v5, off_99968, v12);
  }

  id v13 = [v3 replyToGUID];
  if (v13) {
    CFDictionarySetValue(v5, off_99988, v13);
  }

  if (IMOSLoggingEnabled())
  {
    CFStringRef v14 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Starting parse", (uint8_t *)&v37, 2u);
    }
  }
  id v15 = [LegacySuperToSMSRelayMessageParser alloc];
  BOOL v16 = [v3 body];
  unsigned int v17 = [(LegacySuperToSMSRelayMessageParser *)v15 initWithAttributedString:v16];

  CFStringRef v18 = +[IMAttributedStringParser sharedInstance];
  [v18 parseContext:v17];

  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      LOWORD(v37) = 0;
      _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Done parse", (uint8_t *)&v37, 2u);
    }
  }
  long long v20 = [v3 body];
  long long v21 = [v20 string];

  if (IMOSLoggingEnabled())
  {
    long long v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      MarcoLoggingStringForMessageData();
      long long v23 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v37 = 138412290;
      CFStringRef v38 = v23;
      _os_log_impl(&dword_0, v22, OS_LOG_TYPE_INFO, "Plain: %@", (uint8_t *)&v37, 0xCu);
    }
  }
  unsigned int v24 = [(LegacySuperToSMSRelayMessageParser *)v17 outHTML];
  if (IMOSLoggingEnabled())
  {
    CFStringRef v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      MarcoLoggingStringForMessageData();
      __int16 v26 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v37 = 138412290;
      CFStringRef v38 = v26;
      _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "messageString: %@", (uint8_t *)&v37, 0xCu);
    }
  }
  if ([(LegacySuperToSMSRelayMessageParser *)v17 isSimpleString])
  {
    int v27 = 0;
  }
  else
  {
    CFStringRef v28 = [v3 body];
    if ([v28 length]) {
      BOOL v29 = v21 == 0;
    }
    else {
      BOOL v29 = 1;
    }
    int v27 = !v29;
  }
  if (IMOSLoggingEnabled())
  {
    CFStringRef v30 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
    {
      CFStringRef v31 = @"NO";
      if (v27) {
        CFStringRef v31 = @"YES";
      }
      int v37 = 138412290;
      CFStringRef v38 = v31;
      _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "sendXMLVersion: %@", (uint8_t *)&v37, 0xCu);
    }
  }
  if (v24) {
    int v32 = v27;
  }
  else {
    int v32 = 0;
  }
  if (v32 == 1) {
    CFDictionarySetValue(v5, off_99960, v24);
  }
  unsigned int v33 = v5;

LABEL_63:

  return v33;
}

- (id)_convertIMMessageItemDictionaryToIMMessageItem:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      LOWORD(v26) = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Converting Dictionary to IM Message", (uint8_t *)&v26, 2u);
    }
  }
  id v5 = objc_alloc_init((Class)IMMessageItem);
  uint64_t v6 = [v3 objectForKey:off_99970];
  [v5 setHandle:v6];

  CFStringRef v7 = [v3 objectForKey:off_99978];
  [v5 setService:v7];

  int v8 = [v3 objectForKey:off_99980];
  [v5 setGuid:v8];

  [v5 setFlags:5];
  int v9 = [v3 objectForKey:off_99958];

  if (v9)
  {
    CFStringRef v10 = [v3 objectForKey:off_99958];
    [v5 setPlainBody:v10];
  }
  BOOL v11 = [v3 objectForKey:off_99968];

  if (v11)
  {
    unsigned int v12 = [v3 objectForKey:off_99968];
    [v5 setSubject:v12];
  }
  id v13 = [v3 objectForKey:off_99960];

  if (v13)
  {
    CFStringRef v14 = [LegacySMSRelayMessageToSuperParser alloc];
    id v15 = [v3 objectForKey:off_99960];
    BOOL v16 = [(LegacySMSRelayMessageToSuperParser *)v14 initWithContent:v15];

    unsigned int v17 = +[IMXMLParser sharedInstance];
    [v17 parseContext:v16];

    CFStringRef v18 = [(LegacySMSRelayMessageToSuperParser *)v16 body];
    [v5 setBody:v18];
    id v19 = [(LegacySMSRelayMessageToSuperParser *)v16 fileTransferGUIDs];
    [v5 setFileTransferGUIDs:v19];

    if (IMOSLoggingEnabled())
    {
      long long v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        long long v21 = [v18 string];
        MarcoLoggingStringForMessageData();
        id v22 = (id)objc_claimAutoreleasedReturnValue();
        long long v23 = [v5 fileTransferGUIDs];
        int v26 = 138412546;
        id v27 = v22;
        __int16 v28 = 2112;
        BOOL v29 = v23;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "      xhtml parsed body: %@  file tranfer GUIDs: %@", (uint8_t *)&v26, 0x16u);
      }
    }
  }
  unsigned int v24 = [v3 objectForKey:off_99988];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v24 length]) {
    [v5 setReplyToGUID:v24];
  }

  return v5;
}

- (id)_replicatedMessageGUIDToReleaseFromMessageDictionary:(id)a3
{
  id v3 = a3;
  int v4 = [v3 objectForKeyedSubscript:off_998D8];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && [v4 BOOLValue]
    && ([v3 objectForKeyedSubscript:off_99950],
        (id v5 = objc_claimAutoreleasedReturnValue()) != 0))
  {
    uint64_t v6 = v5;
    CFStringRef v7 = [v5 objectForKeyedSubscript:off_99980];
  }
  else
  {
    CFStringRef v7 = 0;
  }

  return v7;
}

- (BOOL)shouldFixIncomingDate
{
  v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"fix-sms-date"];
  int v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 BOOLValue];
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        CFStringRef v7 = @"NO";
        if (v5) {
          CFStringRef v7 = @"YES";
        }
        int v9 = 138412290;
        CFStringRef v10 = v7;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Server tells us to fix the date: %@", (uint8_t *)&v9, 0xCu);
      }
    }
  }
  else
  {
    LOBYTE(v5) = 1;
  }

  return v5;
}

- (id)_fixIncomingDate:(id)a3
{
  id v4 = a3;
  if ([(LegacySMSServiceSession *)self shouldFixIncomingDate])
  {
    unsigned int v5 = +[NSDate date];

    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412546;
        id v10 = v4;
        __int16 v11 = 2112;
        unsigned int v12 = v5;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Fixing the CT Message date (%@) with the current server time (%@)", (uint8_t *)&v9, 0x16u);
      }
    }
  }
  else
  {
    unsigned int v5 = v4;
    if (IMOSLoggingEnabled())
    {
      CFStringRef v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        LOWORD(v9) = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "We are taking the CT Message date", (uint8_t *)&v9, 2u);
      }

      unsigned int v5 = v4;
    }
  }

  return v5;
}

- (id)_convertCTMessageToDictionary:(id)a3 requiresUpload:(BOOL *)a4
{
  id v104 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Converting CT Message to NSDictionary", buf, 2u);
    }
  }
  if (a4) {
    *a4 = 0;
  }
  CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)objc_alloc_init((Class)NSMutableDictionary);
  [(__CFDictionary *)theDict setObject:@"1" forKey:off_997E0];
  if ([v104 messageType] == 1)
  {
    unsigned int v5 = off_99868;
    if (v5) {
      goto LABEL_14;
    }
    id v6 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_5F270();
    }
  }
  else if ([v104 messageType] == 2)
  {
    unsigned int v5 = off_99870;
    if (v5) {
      goto LABEL_14;
    }
    id v7 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_5F270();
    }
  }
  else
  {
    unsigned int v5 = off_99878;
    if (v5)
    {
LABEL_14:
      CFDictionarySetValue(theDict, LegacySMSCTMessageDictionaryTypeKey, v5);
      goto LABEL_24;
    }
    id v8 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_5F270();
    }
  }

LABEL_24:
  int v9 = [v104 sender];
  id v10 = [v9 canonicalFormat];
  __int16 v11 = [(LegacySMSServiceSession *)self _extractSMSSenderAddress:v10];

  IMGetDomainValueForKey();
  id v102 = (id)objc_claimAutoreleasedReturnValue();

  if ([v102 length])
  {
    id v12 = v102;

    __int16 v11 = v12;
  }
  id v13 = v11;
  if (v13)
  {
    id v14 = v13;
    CFDictionarySetValue(theDict, LegacySMSCTMessageDictionarySenderKey, v13);
    id v13 = v14;
  }
  __int16 v100 = v13;

  id v15 = objc_alloc_init((Class)NSMutableArray);
  long long v112 = 0u;
  long long v113 = 0u;
  long long v110 = 0u;
  long long v111 = 0u;
  BOOL v16 = [v104 recipients];
  id v17 = [v16 countByEnumeratingWithState:&v110 objects:v123 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v111;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v111 != v18) {
          objc_enumerationMutation(v16);
        }
        long long v20 = [*(id *)(*((void *)&v110 + 1) + 8 * i) canonicalFormat];
        if (v20) {
          [v15 addObject:v20];
        }
      }
      id v17 = [v16 countByEnumeratingWithState:&v110 objects:v123 count:16];
    }
    while (v17);
  }

  long long v21 = [v104 date];
  id v22 = [(LegacySMSServiceSession *)self _fixIncomingDate:v21];

  long long v23 = [(LegacySMSServiceSession *)self _myCTPhoneNumber];
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    unsigned int v24 = [v104 context];
    CFStringRef v25 = +[IMCTSubscriptionUtilities sharedInstance];
    int v26 = [v25 ctSubscriptionInfo];

    id v27 = 0;
    if (v24 && v26)
    {
      objc_msgSend(v26, "__im_subscriptionContextOrDefaultForForSlotID:", objc_msgSend(v24, "slotID"));
      __int16 v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        if (IMOSLoggingEnabled())
        {
          BOOL v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            id v30 = [(__CFString *)v28 phoneNumber];
            id v31 = [(__CFString *)v28 labelID];
            int v32 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v24 slotID]);
            *(_DWORD *)buf = 138413058;
            CFStringRef v116 = v28;
            __int16 v117 = 2112;
            id v118 = v30;
            __int16 v119 = 2112;
            id v120 = v31;
            __int16 v121 = 2112;
            v122 = v32;
            _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Setting receiving context = %@, phoneNumber = %@, simID = %@ for given slotID %@", buf, 0x2Au);
          }
        }
        uint64_t v33 = [(__CFString *)v28 phoneNumber];

        id v27 = [(__CFString *)v28 labelID];
        long long v23 = (void *)v33;
      }
      else
      {
        id v27 = 0;
      }
    }
  }
  else
  {
    id v27 = 0;
  }
  id v34 = v15;
  if (v34)
  {
    id v35 = v34;
    CFDictionarySetValue(theDict, off_997F0, v34);
    id v34 = v35;
  }
  long long v94 = v34;

  id v36 = v22;
  if (v36)
  {
    id v37 = v36;
    CFDictionarySetValue(theDict, off_997F8, v36);
    id v36 = v37;
  }
  long long v93 = v36;

  CFStringRef v38 = [v104 serviceCenter];
  CFStringRef v39 = [v38 canonicalFormat];

  if (v39) {
    CFDictionarySetValue(theDict, off_99808, v39);
  }

  id v40 = v23;
  if (v40)
  {
    id v41 = v40;
    CFDictionarySetValue(theDict, off_99810, v40);
    id v40 = v41;
  }
  id v99 = v40;

  id v42 = v27;
  if (v42)
  {
    id v43 = v42;
    CFDictionarySetValue(theDict, off_99820, v42);
    id v42 = v43;
  }
  CFStringRef v98 = v42;

  __int16 v44 = [v104 subject];
  if (v44) {
    CFDictionarySetValue(theDict, off_99830, v44);
  }

  CFStringRef v45 = [v104 contentType];
  if (v45) {
    CFDictionarySetValue(theDict, off_99838, v45);
  }

  __int16 v46 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v104 replaceMessage]);
  if (v46) {
    CFDictionarySetValue(theDict, off_99840, v46);
  }

  id v47 = [v104 countryCode];
  if (v47) {
    CFDictionarySetValue(theDict, off_99848, v47);
  }

  id v48 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v104 replyEnabled]);
  if (v48) {
    CFDictionarySetValue(theDict, off_99828, v48);
  }

  if (IMOSLoggingEnabled())
  {
    long long v49 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v49, OS_LOG_TYPE_INFO))
    {
      unsigned int v50 = [v104 replyEnabled];
      CFStringRef v51 = @"NO";
      if (v50) {
        CFStringRef v51 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v116 = v51;
      _os_log_impl(&dword_0, v49, OS_LOG_TYPE_INFO, "Telephony reply enabled: %@", buf, 0xCu);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    id v52 = [v104 uniqueIdentifier];

    id v53 = v52;
  }
  else
  {
    id v53 = 0;
  }
  long long v95 = v53;
  if (objc_opt_respondsToSelector())
  {
    id v54 = [v95 UUIDString];
  }
  else
  {
    id v54 = 0;
  }
  CFStringRef v101 = +[IMCTSMSUtilities IMMMSEmailAddressToMatchForPhoneNumber:v99 simID:v98];
  if ([v101 length])
  {
    id v55 = v101;
    if (v55) {
      CFDictionarySetValue(theDict, off_99818, v55);
    }
  }
  if (v54)
  {
    id v56 = v54;
LABEL_89:
    id v97 = v56;
    CFDictionarySetValue(theDict, LegacySMSCTMessageDictionaryGUIDKey, v56);

    goto LABEL_90;
  }
  StringGUID();
  id v56 = (id)objc_claimAutoreleasedReturnValue();
  if (v56) {
    goto LABEL_89;
  }
  id v97 = 0;
LABEL_90:
  long long v57 = IMChatCanonicalIDSIDsForAddress();
  id v58 = [v57 lowercaseString];
  id v59 = +[NSMutableString stringWithFormat:@"s:%@", v58];

  id v60 = objc_alloc_init((Class)NSMutableArray);
  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  int64_t v61 = [v104 items];
  id v62 = [v61 countByEnumeratingWithState:&v106 objects:v114 count:16];
  if (v62)
  {
    uint64_t v63 = *(void *)v107;
    do
    {
      for (j = 0; j != v62; j = (char *)j + 1)
      {
        if (*(void *)v107 != v63) {
          objc_enumerationMutation(v61);
        }
        BOOL v65 = *(__CFString **)(*((void *)&v106 + 1) + 8 * (void)j);
        BOOL v66 = [(LegacySMSServiceSession *)self _convertCTMessagePartToDictionary:v65];
        CFStringRef v67 = v66;
        if (v66)
        {
          id v68 = [v66 objectForKeyedSubscript:off_99890];
          uint64_t v69 = (void *)SMSCopySanitizedContentLocation();

          id v70 = [v69 lowercaseString];
          long long v71 = [(__CFString *)v65 data];
          [v59 appendFormat:@"|%@(%llu)", v70, (unint64_t)objc_msgSend(v71, "length") / 0x64, v93, v94];

          [v60 addObject:v67];
        }
        else if (IMOSLoggingEnabled())
        {
          long long v72 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v116 = v65;
            _os_log_impl(&dword_0, v72, OS_LOG_TYPE_INFO, "Empty message part dictionary generated from: %@", buf, 0xCu);
          }
        }
      }
      id v62 = [v61 countByEnumeratingWithState:&v106 objects:v114 count:16];
    }
    while (v62);
  }

  if (IMOSLoggingEnabled())
  {
    long long v73 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v73, OS_LOG_TYPE_INFO))
    {
      CFStringRef v74 = (const __CFString *)[v59 length];
      *(_DWORD *)buf = 134217984;
      CFStringRef v116 = v74;
      _os_log_impl(&dword_0, v73, OS_LOG_TYPE_INFO, "Generated fallback hash with length %llu for message", buf, 0xCu);
    }
  }
  id v75 = v59;
  if (v75) {
    CFDictionarySetValue(theDict, off_99858, v75);
  }

  id v76 = v60;
  if (v76) {
    CFDictionarySetValue(theDict, off_99860, v76);
  }

  CFDictionarySetValue(theDict, off_997D0, &off_90DF8);
  long long v77 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v78 = [v77 isSMSFilterSyncEnabled];

  if (v78)
  {
    if ([(LegacySMSServiceSession *)self _isSpamFilteringEnabled])
    {
      IMGetDomainValueForKey();
      long long v79 = (__CFString *)objc_claimAutoreleasedReturnValue();
      id v80 = +[IMSMSFilterCapabilitiesSyncHelper fetchSMSFilterCapabilitiesOptions];
    }
    else
    {
      long long v79 = 0;
      id v80 = &dword_0 + 1;
    }
    if (IMOSLoggingEnabled())
    {
      long long v81 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v81, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v116 = v79;
        __int16 v117 = 2048;
        id v118 = v80;
        _os_log_impl(&dword_0, v81, OS_LOG_TYPE_INFO, "Setting SMSFilteringSettings: filterExtensionName = %@, smsFilterCapabilitiesOptions = %lu", buf, 0x16u);
      }
    }
    long long v82 = v79;
    if (v82) {
      CFDictionarySetValue(theDict, off_99938, v82);
    }

    long long v83 = +[NSNumber numberWithUnsignedInteger:v80];
    if (v83)
    {
      CFDictionarySetValue(theDict, off_99940, v83);
    }
    else
    {
      id v84 = &_os_log_default;
      if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
        sub_5F1EC();
      }
    }
  }
  unsigned int v85 = [(LegacySMSServiceSession *)self _shouldUploadToMMCS:theDict];
  int v86 = IMOSLoggingEnabled();
  if (v85)
  {
    if (v86)
    {
      long long v87 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v87, OS_LOG_TYPE_INFO, "We were told this message has things that make it to large to send by itself over IDS, If we choose to send this message onwards, it will require upload to MMCS", buf, 2u);
      }
    }
    if (a4) {
      *a4 = 1;
    }
  }
  else if (v86)
  {
    long long v88 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v88, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v88, OS_LOG_TYPE_INFO, "This Message is JUST the right size that we can send it over IDS, so let it go on its way", buf, 2u);
    }
  }
  if ((IMGetCachedDomainBoolForKey() & 1) == 0)
  {
    long long v89 = +[CTMessageCenter sharedMessageCenter];
    objc_msgSend(v89, "acknowledgeIncomingMessageWithId:", objc_msgSend(v104, "messageId"));
  }
  if (IMOSLoggingEnabled())
  {
    __int16 v90 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v90, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v90, OS_LOG_TYPE_INFO, "Finished Converting CTMessage To NSDictionary", buf, 2u);
    }
  }
  id v91 = theDict;

  return v91;
}

- (id)_convertCTMessagePartToDictionary:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v11 = 138412290;
      id v12 = v3;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Parsing message part: %@", (uint8_t *)&v11, 0xCu);
    }
  }
  unsigned int v5 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v6 = [v3 contentType];
  if (v6) {
    CFDictionarySetValue(v5, off_99880, v6);
  }

  id v7 = [v3 contentId];
  if (v7) {
    CFDictionarySetValue(v5, off_99888, v7);
  }

  id v8 = [v3 contentLocation];
  if (v8) {
    CFDictionarySetValue(v5, off_99890, v8);
  }

  int v9 = [v3 data];
  if (v9) {
    CFDictionarySetValue(v5, off_99898, v9);
  }

  return v5;
}

- (BOOL)_shouldUploadToMMCS:(id)a3
{
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "Checking to See if we should upload to MMCS", buf, 2u);
    }
  }
  long long v22 = 0u;
  long long v23 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  id v19 = v3;
  unsigned int v5 = [v3 objectForKey:off_99860];
  int v6 = 0;
  id v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v21;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v21 != v8) {
          objc_enumerationMutation(v5);
        }
        id v10 = *(void **)(*((void *)&v20 + 1) + 8 * i);
        int v11 = [v10 objectForKey:off_99880];
        unsigned int v12 = [v11 isEqualToString:off_998A0];

        if (v12)
        {
          if (!IMOSLoggingEnabled()) {
            continue;
          }
          id v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Found A Text Part thats OK", buf, 2u);
          }
          goto LABEL_14;
        }
        id v14 = [v10 objectForKey:off_99880];
        unsigned int v15 = [v14 isEqualToString:off_998A8];

        int v16 = IMOSLoggingEnabled();
        if (v15)
        {
          if (v16)
          {
            id v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "Found SMIL data.. thats OK ", buf, 2u);
            }
LABEL_14:

            continue;
          }
        }
        else
        {
          if (v16)
          {
            id v17 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Found Something else that wasnt there, looks like we need to upload this one to MMCS", buf, 2u);
            }
          }
          ++v6;
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v20 objects:v25 count:16];
    }
    while (v7);
  }

  return v6 > 0;
}

- (id)createHandleInfoForParticipants:(id)a3 unformattedIDs:(id)a4 countryCodes:(id)a5 isGroupChat:(BOOL)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v33 = v11;
  if (a6)
  {
    id v12 = objc_alloc_init((Class)NSMutableArray);
    if ([v9 count])
    {
      unint64_t v13 = 0;
      uint64_t v32 = kFZChatParticipantStatusKey;
      uint64_t v31 = kFZPersonID;
      uint64_t v30 = kFZPersonUnformattedName;
      uint64_t v14 = kFZPersonCountryCode;
      do
      {
        unsigned int v15 = [v9 objectAtIndex:v13];
        int v16 = [v10 objectAtIndex:v13];
        id v17 = [v11 objectAtIndex:v13];
        +[NSNumber numberWithInt:2];
        v19 = id v18 = v10;
        long long v20 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v19, v32, v15, v31, v16, v30, v17, v14, 0);

        id v10 = v18;
        [v12 addObject:v20];

        id v11 = v33;
        ++v13;
      }
      while (v13 < (unint64_t)[v9 count]);
    }
  }
  else
  {
    long long v21 = +[NSNumber numberWithInt:2];
    uint64_t v22 = kFZChatParticipantStatusKey;
    long long v23 = [v9 firstObject];
    uint64_t v24 = kFZPersonID;
    CFStringRef v25 = [v10 firstObject];
    uint64_t v26 = kFZPersonUnformattedName;
    id v27 = [v11 firstObject];
    __int16 v28 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v21, v22, v23, v24, v25, v26, v27, kFZPersonCountryCode, 0);

    id v11 = v33;
    IMSingleObjectArray();
    id v12 = (id)objc_claimAutoreleasedReturnValue();
  }

  return v12;
}

- (void)_processReceivedDictionary:(id)a3 storageContext:(id)a4 receivedViaRelay:(BOOL)a5 withCompletionBlock:(id)a6
{
}

- (void)_updateCategoryForChat:(id)a3 andMessage:(id)a4 category:(int64_t)a5 subCategory:(int64_t)a6 shouldRegister:(BOOL)a7 spamExtensionName:(id)a8
{
  id v11 = a8;
  id v12 = a3;
  NSLog(@"%ld, @%ld", a5, a6);
  [v12 updateSMSCategory:a5 subCategory:a6];
  [v12 updateSMSSpamExtensionNameChatProperty:v11];
}

- (void)_updateShouldForceToSMSForChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 shouldForceToSMS:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v6 = a4;
  id v7 = a3;
  uint64_t v8 = +[IMDChatRegistry sharedInstance];
  id v9 = [v8 allExistingSupportedServiceChatsWithIdentifier:v7 style:v6];

  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      CFStringRef v11 = @"NO";
      *(_DWORD *)buf = 138412802;
      id v22 = v7;
      if (v5) {
        CFStringRef v11 = @"YES";
      }
      __int16 v23 = 1024;
      int v24 = v6;
      __int16 v25 = 2112;
      CFStringRef v26 = v11;
      _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Checking if chats with chatIdentifier %@ and style %hhu need to have shouldForceToSMS updated to %@.", buf, 0x1Cu);
    }
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v12 = v9;
  id v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v13)
  {
    uint64_t v14 = *(void *)v17;
    do
    {
      unsigned int v15 = 0;
      do
      {
        if (*(void *)v17 != v14) {
          objc_enumerationMutation(v12);
        }
        objc_msgSend(*(id *)(*((void *)&v16 + 1) + 8 * (void)v15), "updateShouldForceToSMS:", v5, (void)v16);
        unsigned int v15 = (char *)v15 + 1;
      }
      while (v13 != v15);
      id v13 = [v12 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v13);
  }
}

- (void)_updateLastAddressedIDsIfNeededForChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6
{
}

- (void)_updateLastAddressedIDsIfNeededForChatWithIdentifier:(id)a3 style:(unsigned __int8)a4 lastAddressedHandle:(id)a5 lastAddressedSIMID:(id)a6 iMessageCapability:(int64_t)a7
{
  uint64_t v10 = a4;
  id v45 = a3;
  id v11 = a5;
  id v12 = a6;
  if ([v11 length] || objc_msgSend(v12, "length"))
  {
    id v13 = +[IMDChatRegistry sharedInstance];
    uint64_t v14 = [v13 allExistingSupportedServiceChatsWithIdentifier:v45 style:v10];

    if (IMOSLoggingEnabled())
    {
      unsigned int v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138413058;
        id v55 = v45;
        __int16 v56 = 1024;
        *(_DWORD *)long long v57 = v10;
        *(_WORD *)&v57[4] = 2112;
        *(void *)&v57[6] = v11;
        *(_WORD *)&v57[14] = 2112;
        *(void *)&v57[16] = v12;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Checking if chats with chatIdentifier %@ and style %hhu need to have their last addressed handle updated to %@ or their last addressed sim id updated to %@", buf, 0x26u);
      }
    }
    long long v51 = 0u;
    long long v52 = 0u;
    long long v49 = 0u;
    long long v50 = 0u;
    id obj = v14;
    id v16 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
    if (v16)
    {
      uint64_t v46 = 0;
      id v48 = 0;
      uint64_t v17 = *(void *)v50;
      while (1)
      {
        for (i = 0; i != v16; i = (char *)i + 1)
        {
          if (*(void *)v50 != v17) {
            objc_enumerationMutation(obj);
          }
          long long v19 = *(void **)(*((void *)&v49 + 1) + 8 * i);
          long long v20 = [v19 chatIdentifier];
          BOOL v21 = [v20 length] == 0;

          if (!v21)
          {
            if ([v12 length])
            {
              id v22 = [v19 lastAddressedSIMID];
              unsigned __int8 v23 = [v22 isEqualToString:v12];

              if ((v23 & 1) == 0)
              {
                if (IMOSLoggingEnabled())
                {
                  int v24 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
                  {
                    __int16 v25 = [v19 guid];
                    *(_DWORD *)buf = 138412546;
                    id v55 = v25;
                    __int16 v56 = 2112;
                    *(void *)long long v57 = v12;
                    _os_log_impl(&dword_0, v24, OS_LOG_TYPE_INFO, "  ** Updating sim ID for chat with guid %@ to be: %@", buf, 0x16u);
                  }
                }
                [v19 updateLastAddressedSIMID:v12];
                LODWORD(v46) = 1;
              }
            }
            CFStringRef v26 = [v19 lastAddressedLocalHandle];
            char v27 = _FTAreIDsEquivalent();

            if ((v27 & 1) == 0)
            {
              if ([v11 length]
                || ([v19 serviceName],
                    __int16 v28 = objc_claimAutoreleasedReturnValue(),
                    unsigned int v29 = [v28 isEqualToString:IMServiceNameiMessage],
                    v28,
                    !v29))
              {
                if (IMOSLoggingEnabled())
                {
                  uint64_t v31 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
                  {
                    id v32 = [v19 guid];
                    id v33 = [v19 lastAddressedLocalHandle];
                    *(_DWORD *)buf = 138412802;
                    id v55 = v32;
                    __int16 v56 = 2112;
                    *(void *)long long v57 = v11;
                    *(_WORD *)&v57[8] = 2112;
                    *(void *)&v57[10] = v33;
                    _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "  ** Updating caller ID for chat with guid %@ to be: %@ from %@", buf, 0x20u);
                  }
                }
                [v19 updateLastAddressedHandle:v11];
                BYTE4(v46) = 1;
              }
              else if (IMOSLoggingEnabled())
              {
                uint64_t v30 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "Last address handle is nil, not updating iMessage to nil last addressed handle", buf, 2u);
                }
              }
            }
            id v34 = [v19 serviceName];
            unsigned int v35 = [v34 isEqualToString:IMServiceNameSMS];

            if (v35)
            {
              id v36 = v19;

              id v48 = v36;
            }
            if (a7 == 2)
            {
              if (IMOSLoggingEnabled())
              {
                id v40 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
                {
                  id v41 = [v19 guid];
                  *(_DWORD *)buf = 138412290;
                  id v55 = v41;
                  _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "Updating chat with guid %@ to have shouldForceToSMS = YES", buf, 0xCu);
                }
              }
              uint64_t v39 = 1;
            }
            else
            {
              if (a7 != 1) {
                continue;
              }
              if (IMOSLoggingEnabled())
              {
                id v37 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
                {
                  CFStringRef v38 = [v19 guid];
                  *(_DWORD *)buf = 138412290;
                  id v55 = v38;
                  _os_log_impl(&dword_0, v37, OS_LOG_TYPE_INFO, "Updating chat with guid %@ to have shouldForceToSMS = NO", buf, 0xCu);
                }
              }
              uint64_t v39 = 0;
            }
            [v19 updateShouldForceToSMS:v39];
          }
        }
        id v16 = [obj countByEnumeratingWithState:&v49 objects:v53 count:16];
        if (!v16) {
          goto LABEL_51;
        }
      }
    }
    uint64_t v46 = 0;
    id v48 = 0;
LABEL_51:

    if (!(BYTE4(v46) & 1 | ((IMSharedHelperDeviceHasMultipleSubscriptions() & v46 & 1) == 0))
      && v48)
    {
      if (IMOSLoggingEnabled())
      {
        id v42 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
        {
          id v43 = [v48 guid];
          *(_DWORD *)buf = 138412546;
          id v55 = v43;
          __int16 v56 = 2112;
          *(void *)long long v57 = v12;
          _os_log_impl(&dword_0, v42, OS_LOG_TYPE_INFO, "Updated simID on chat %@ to %@ but phoneNumber is nil so force updating IMChat to have nil lastAddressedHandle", buf, 0x16u);
        }
      }
      [v48 updateLastAddressedHandle:0 forceUpdate:1];
    }
  }
  else if (IMOSLoggingEnabled())
  {
    __int16 v44 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v55 = v45;
      __int16 v56 = 1024;
      *(_DWORD *)long long v57 = v10;
      _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "Not updating chats with identifier %@ and style %hhu as both last addressed handle and last addressed sim id are nil", buf, 0x12u);
    }
  }
}

- (void)_processMessageSent:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = -[LegacySMSServiceSession _messageGUIDForMessageID:](self, "_messageGUIDForMessageID:");
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        LODWORD(v26[0]) = v3;
        WORD2(v26[0]) = 2112;
        *(void *)((char *)v26 + 6) = v5;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Sent message: %u  (guid: %@)", buf, 0x12u);
      }
    }
    if ([(NSMutableSet *)self->_originatedMessages containsObject:v5])
    {
      [(LegacySMSServiceSession *)self notifyDidSendMessageID:v5 shouldNotify:1];
      [(LegacySMSServiceSession *)self _removeOriginatedMessage:v5];
    }
    else
    {
      [(LegacySMSServiceSession *)self notifyDidSendMessageID:v5 shouldNotify:0];
    }
    if ((IMGetCachedDomainBoolForKey() & 1) == 0)
    {
      id v7 = +[CTMessageCenter sharedMessageCenter];
      [v7 acknowledgeOutgoingMessageWithId:v3];
    }
    uint64_t v8 = [(LegacySMSServiceSession *)self _completionBlockForMessageGUID:v5];
    id v9 = (void *)v8;
    if (v8) {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
    }
    [(LegacySMSServiceSession *)self _clearMapForMessageGUID:v5];
    if (IMOSLoggingEnabled())
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v26[0] = v5;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "RELAY: Going to Tell all my clients that message with GUID %@ has been sent", buf, 0xCu);
      }
    }
    int v24 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, off_998B8, 0);
    id v11 = JWEncodeDictionary();
    id v12 = [v11 _FTCopyGzippedData];
    id v13 = +[NSNumber numberWithInteger:146];
    uint64_t v14 = IDSGetUUIDData();
    unsigned int v15 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    id v16 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey, v13, IDSSendMessageOptionCommandKey, v14, IDSSendMessageOptionUUIDKey, v12, IDSSendMessageOptionDataToEncryptKey, v15, IDSSendMessageOptionTimeoutKey, 0);

    uint64_t v17 = [(LegacySMSServiceSession *)self _myCTPhoneNumber];
    [(LegacySMSServiceSession *)self sendDataToPeers:v16 forcedCallerID:v17 shouldFilterRecepients:1 requestProxySend:0 dontSendTo:0];

    long long v18 = [(LegacySMSServiceSession *)self localDevice];
    if (v18)
    {
      unsigned __int8 v19 = [(LegacySMSServiceSession *)self isLocalDeviceProxyRegistered];

      if ((v19 & 1) == 0)
      {
        long long v20 = +[NSDictionary dictionaryWithObjectsAndKeys:v5, @"message-guid", 0];
        BOOL v21 = JWEncodeDictionary();
        id v22 = [v21 _FTCopyGzippedData];
        unsigned __int8 v23 = +[NSDictionary dictionaryWithObjectsAndKeys:v22, @"dict", @"local-message-sent", @"local-type", 0];
        [(LegacySMSServiceSession *)self sendToLocalPeers:v23];
      }
    }
  }
}

- (void)_processMessageSendFailure:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  BOOL v5 = -[LegacySMSServiceSession _messageGUIDForMessageID:](self, "_messageGUIDForMessageID:");
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v6 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 67109378;
        *(_DWORD *)char v27 = v3;
        *(_WORD *)&v27[4] = 2112;
        *(void *)&v27[6] = v5;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Failed to send message: %u   (guid: %@)", buf, 0x12u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        *(void *)char v27 = v5;
        *(_WORD *)&v27[8] = 1024;
        *(_DWORD *)&v27[10] = v3;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Error sending message: %@ CT Failed to send message with messageID %u", buf, 0x12u);
      }
    }
    [(LegacySMSServiceSession *)self didReceiveError:4 forMessageID:v5 forceError:1];
    if ((IMGetCachedDomainBoolForKey() & 1) == 0)
    {
      uint64_t v8 = +[CTMessageCenter sharedMessageCenter];
      [v8 acknowledgeOutgoingMessageWithId:v3];
    }
    uint64_t v9 = [(LegacySMSServiceSession *)self _failureBlockForMessageGUID:v5];
    uint64_t v10 = (void *)v9;
    if (v9) {
      (*(void (**)(uint64_t, uint64_t, void))(v9 + 16))(v9, 4, 0);
    }
    [(LegacySMSServiceSession *)self _clearMapForMessageGUID:v5];
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)char v27 = v5;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "RELAY: Going to Tell all my clients that message with GUID %@ has failed to send", buf, 0xCu);
      }
    }
    __int16 v25 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v5, off_998B8, 0);
    id v12 = JWEncodeDictionary();
    id v13 = [v12 _FTCopyGzippedData];
    uint64_t v14 = +[NSNumber numberWithInteger:149];
    unsigned int v15 = IDSGetUUIDData();
    id v16 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
    uint64_t v17 = +[NSMutableDictionary dictionaryWithObjectsAndKeys:](NSMutableDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, &__kCFBooleanFalse, IDSSendMessageOptionEnforceRemoteTimeoutsKey, v14, IDSSendMessageOptionCommandKey, v15, IDSSendMessageOptionUUIDKey, v13, IDSSendMessageOptionDataToEncryptKey, v16, IDSSendMessageOptionTimeoutKey, 0);

    long long v18 = [(LegacySMSServiceSession *)self _myCTPhoneNumber];
    [(LegacySMSServiceSession *)self sendDataToPeers:v17 forcedCallerID:v18 shouldFilterRecepients:1 requestProxySend:0 dontSendTo:0];

    unsigned __int8 v19 = [(LegacySMSServiceSession *)self localDevice];
    if (v19)
    {
      unsigned __int8 v20 = [(LegacySMSServiceSession *)self isLocalDeviceProxyRegistered];

      if ((v20 & 1) == 0)
      {
        BOOL v21 = +[NSDictionary dictionaryWithObjectsAndKeys:v5, @"message-guid", 0];
        id v22 = JWEncodeDictionary();
        id v23 = [v22 _FTCopyGzippedData];
        int v24 = +[NSDictionary dictionaryWithObjectsAndKeys:v23, @"dict", @"local-message-error", @"local-type", 0];
        [(LegacySMSServiceSession *)self sendToLocalPeers:v24];
      }
    }
  }
}

- (void)_messageTimedOut:(id)a3
{
  id v4 = a3;
  BOOL v5 = [v4 userInfo];
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      uint64_t v9 = v5;
      _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Failed to send relay message ID guid (timed out): %@", (uint8_t *)&v8, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      uint64_t v9 = v5;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Error sending message: %@ SMS Relay timed out", (uint8_t *)&v8, 0xCu);
    }
  }
  if (v5)
  {
    [(LegacySMSServiceSession *)self didReceiveError:4 forMessageID:v5 forceError:1];
    [(LegacySMSServiceSession *)self _clearMapForMessageGUID:v5];
  }
}

- (void)_clearPendingIncomingMessageQueue
{
  if (!self->_hasClearedMessageQueue)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "Clearing incoming message queaue from CT", buf, 2u);
      }
    }
    self->_hasClearedMessageQueue = 1;
    id v4 = +[CTMessageCenter sharedMessageCenter];
    BOOL v5 = [v4 allIncomingMessages];

    long long v18 = 0u;
    long long v19 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id obj = v5;
    id v6 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v17;
      do
      {
        int v8 = 0;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v8);
          buf[0] = 0;
          uint64_t v10 = [(LegacySMSServiceSession *)self _convertCTMessageToDictionary:v9 requiresUpload:buf];
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          v13[2] = sub_52100;
          v13[3] = &unk_8CFE0;
          void v13[4] = self;
          id v14 = v10;
          uint8_t v15 = buf[0];
          id v11 = v10;
          [(LegacySMSServiceSession *)self _processReceivedDictionary:v11 storageContext:0 receivedViaRelay:0 withCompletionBlock:v13];

          int v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v6);
    }
  }
}

- (void)_handleCapabilitiesChanged:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)id v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Device capabilities changed", v6, 2u);
    }
  }
  [(LegacySMSServiceSession *)self updateMMSCapability];
}

- (id)_extractSMSSenderAddress:(id)a3
{
  id v3 = a3;
  if (IMStringIsEmail()) {
    CFStringRef v4 = @"<> ";
  }
  else {
    CFStringRef v4 = @"<>";
  }
  BOOL v5 = +[NSCharacterSet characterSetWithCharactersInString:v4];
  id v6 = [v3 stringByRemovingCharactersFromSet:v5];

  return v6;
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v20 = v7;
      __int16 v21 = 2112;
      id v22 = v6;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "IDS Devices changed: %@ on Service:%@", buf, 0x16u);
    }
  }
  [(LegacySMSServiceSession *)self _updateRelayStatus];
  long long v16 = 0u;
  long long v17 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v9 = v7;
  id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v15;
    do
    {
      for (i = 0; i != v10; i = (char *)i + 1)
      {
        if (*(void *)v15 != v11) {
          objc_enumerationMutation(v9);
        }
        id v13 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        if (objc_msgSend(v13, "isDefaultPairedDevice", (void)v14)) {
          [(LegacySMSServiceSession *)self _addDeviceToAllowedSMSRelay:v13 shouldSendApproval:0];
        }
      }
      id v10 = [v9 countByEnumeratingWithState:&v14 objects:v18 count:16];
    }
    while (v10);
  }

  [(LegacySMSServiceSession *)self _addDefaultPairedDeviceToAllowedSMSRelayList];
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    int v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412546;
      id v10 = v6;
      __int16 v11 = 2112;
      id v12 = v7;
      _os_log_impl(&dword_0, v8, OS_LOG_TYPE_INFO, "Active accounts of service %@ changed to %@", (uint8_t *)&v9, 0x16u);
    }
  }
  [(LegacySMSServiceSession *)self _checkAndSetRelayService];
  [(LegacySMSServiceSession *)self _addDefaultPairedDeviceToAllowedSMSRelayList];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (IMOSLoggingEnabled())
  {
    long long v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      CFStringRef v16 = @"NO";
      if (v8) {
        CFStringRef v16 = @"YES";
      }
      int v17 = 138412546;
      id v18 = v13;
      __int16 v19 = 2112;
      CFStringRef v20 = v16;
      _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Message with ID %@ Sent Success %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)sendDeleteCommand:(id)a3 forChatGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[IMDCKUtilities sharedInstance];
  unsigned __int8 v9 = [v8 cloudKitSyncingEnabled];

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Forwarding delete command to all other devices", buf, 2u);
      }
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  id v11 = [(LegacySMSServiceSession *)self pairedDevice];

  int v12 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v12)
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Send delete command only to the paired device", buf, 2u);
      }
      goto LABEL_10;
    }
LABEL_11:
    id v13 = +[IMDChatRegistry sharedInstance];
    id v14 = [v13 existingChatWithGUID:v7];

    if (v14)
    {
      long long v15 = JWEncodeDictionary();
      id v16 = [v15 _FTCopyGzippedData];

      if (IMOSLoggingEnabled())
      {
        int v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v23 = v6;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Forwarding delete command :%@", buf, 0xCu);
        }
      }
      id v18 = +[NSNumber numberWithInteger:181];
      __int16 v19 = +[NSNumber numberWithDouble:IDSMaxMessageTimeout];
      CFStringRef v20 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", IDSSendMessageOptionTopLevelDictionaryKey, &__kCFBooleanTrue, IDSSendMessageOptionSkipPayloadCheckKey, v18, IDSSendMessageOptionCommandKey, v16, IDSSendMessageOptionDataToEncryptKey, v19, IDSSendMessageOptionTimeoutKey, 0);

      if (v9) {
        [(LegacySMSServiceSession *)self _sendMessageToAllSMSRelayDevicesWithOptions:v20];
      }
      else {
        [(LegacySMSServiceSession *)self _sendMessageToPairedDeviceWithOptions:v20];
      }
    }
    goto LABEL_21;
  }
  if (v12)
  {
    __int16 v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v23 = v6;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "iCloud syncing not enbabled droping delete command to all other devices, (command %@)", buf, 0xCu);
    }
  }
LABEL_21:
}

- (void)sendRecoverCommand:(id)a3 forChatGUID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  BOOL v8 = +[IMDCKUtilities sharedInstance];
  unsigned __int8 v9 = [v8 cloudKitSyncingEnabled];

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Forwarding recover command to all other devices", buf, 2u);
      }
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  id v11 = [(LegacySMSServiceSession *)self pairedDevice];

  int v12 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v12)
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "Send recover command only to the paired device", buf, 2u);
      }
      goto LABEL_10;
    }
LABEL_11:
    id v13 = +[IMDChatRegistry sharedInstance];
    id v14 = [v13 existingChatWithGUID:v7];

    if (v14)
    {
      long long v15 = JWEncodeDictionary();
      id v16 = [v15 _FTCopyGzippedData];

      if (IMOSLoggingEnabled())
      {
        int v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v6;
          _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Forwarding recover command :%@", buf, 0xCu);
        }
      }
      id v18 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:", IDSMaxMessageTimeout, IDSSendMessageOptionTopLevelDictionaryKey, IDSSendMessageOptionSkipPayloadCheckKey, IDSSendMessageOptionCommandKey, IDSSendMessageOptionDataToEncryptKey, IDSSendMessageOptionTimeoutKey, &__kCFBooleanTrue, &__kCFBooleanTrue, &off_90E10, v16);
      v23[4] = v18;
      __int16 v19 = +[NSDictionary dictionaryWithObjects:v23 forKeys:&v22 count:5];

      if (v9) {
        [(LegacySMSServiceSession *)self _sendMessageToAllSMSRelayDevicesWithOptions:v19];
      }
      else {
        [(LegacySMSServiceSession *)self _sendMessageToPairedDeviceWithOptions:v19];
      }
    }
    else if (IMOSLoggingEnabled())
    {
      CFStringRef v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v7;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Recently Deleted | Early returning: SMSService recoverCommand - chat not found for GUID: %@", buf, 0xCu);
      }
    }
    goto LABEL_25;
  }
  if (v12)
  {
    __int16 v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v6;
      _os_log_impl(&dword_0, v21, OS_LOG_TYPE_INFO, "iCloud syncing not enbabled droping recover command to all other devices, (command %@)", buf, 0xCu);
    }
  }
LABEL_25:
}

- (void)_doDeleteChat:(id)a3
{
  id v4 = a3;
  BOOL v5 = [(LegacySMSServiceSession *)self broadcasterForChatListeners];
  id v6 = [v4 guid];
  [v5 leftChat:v6];

  id v7 = [(LegacySMSServiceSession *)self chatRegistry];
  [v7 removeChat:v4];
}

- (void)_doClearChats:(id)a3
{
  id v4 = a3;
  id v5 = objc_alloc_init((Class)NSMutableArray);
  id v6 = objc_alloc_init((Class)NSMutableArray);
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = v4;
  id v7 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
  if (v7)
  {
    uint64_t v9 = *(void *)v25;
    unsigned __int8 v10 = 45;
    *(void *)&long long v8 = 138412290;
    long long v22 = v8;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v25 != v9) {
          objc_enumerationMutation(obj);
        }
        int v12 = *(void **)(*((void *)&v24 + 1) + 8 * i);
        id v13 = [(LegacySMSServiceSession *)self chatRegistry];
        id v14 = [v13 existingChatWithGUID:v12];

        if (v14)
        {
          long long v15 = [v14 chatIdentifier];
          [v5 addObject:v15];

          id v16 = [v14 serviceName];
          [v6 addObject:v16];

          unsigned __int8 v10 = [v14 style];
        }
        else if (IMOSLoggingEnabled())
        {
          int v17 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = v22;
            id v29 = v12;
            _os_log_impl(&dword_0, v17, OS_LOG_TYPE_INFO, "Handling chat-clear, could not find chat by GUID: %@", buf, 0xCu);
          }
        }
      }
      id v7 = [obj countByEnumeratingWithState:&v24 objects:v32 count:16];
    }
    while (v7);
  }
  else
  {
    unsigned __int8 v10 = 45;
  }

  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v29 = v5;
      __int16 v30 = 2112;
      id v31 = v6;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "clearing messages for chat IDS:%@ on services:%@", buf, 0x16u);
    }
  }
  __int16 v19 = +[IMDMessageStore sharedInstance];
  CFStringRef v20 = [v19 deleteMessagesWithChatIdentifiers:v5 style:v10 onServices:v6];

  __int16 v21 = [(LegacySMSServiceSession *)self broadcasterForChatListeners];
  [v21 historicalMessageGUIDsDeleted:v20 chatGUIDs:0 queryID:0];
}

- (void)_handleDeleteCommandWithMessageDictionary:(id)a3
{
  id v4 = a3;
  [(LegacySMSServiceSession *)self deleteChatsForCommandDictionary:v4];
  id v5 = [v4 objectForKeyedSubscript:@"chat-clear"];
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  long long v18 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v16;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v16 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned __int8 v10 = [(LegacySMSServiceSession *)self _chatsForDeleteAndRecoveryChatMetadataDictionary:*(void *)(*((void *)&v15 + 1) + 8 * i)];
        if ([v10 count])
        {
          id v11 = [v10 arrayByApplyingSelector:"guid"];
          int v12 = +[NSSet setWithArray:v11];

          [(LegacySMSServiceSession *)self _doClearChats:v12];
        }
      }
      id v7 = [v5 countByEnumeratingWithState:&v15 objects:v19 count:16];
    }
    while (v7);
  }
  id v13 = [v4 objectForKeyedSubscript:IMDDeleteCommandMessageGUIDArrayKey];
  if (v13) {
    [(LegacySMSServiceSession *)self deleteMessagesForCommandDictionary:v4];
  }
  id v14 = [v4 objectForKeyedSubscript:IMDDeleteCommandMessagePartMetadataArrayKey];
  if ([v14 count]) {
    [(LegacySMSServiceSession *)self deleteMessagePartsForCommandDictionary:v4];
  }
}

- (id)_getStorageDictionaryUsingMsgDict:(id)a3 requiresUpload:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc((Class)NSDictionary);
  id v7 = off_999A8;
  uint64_t v8 = +[NSNumber numberWithBool:v4];
  id v9 = objc_msgSend(v6, "initWithObjectsAndKeys:", v5, v7, v8, off_999B0, 0);

  return v9;
}

- (void)_receivedSMSDictionary:(id)a3 requiresUpload:(BOOL)a4 isBeingReplayed:(BOOL)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_534CC;
  v5[3] = &unk_8D008;
  BOOL v6 = a5;
  v5[4] = self;
  [(LegacySMSServiceSession *)self _processReceivedDictionary:a3 storageContext:0 receivedViaRelay:0 withCompletionBlock:v5];
}

- (void)replayMessage:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 objectForKey:off_999A8],
        id v5 = objc_claimAutoreleasedReturnValue(),
        v5,
        v5))
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v6 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v4;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Replaying stored CT SMS message %@", buf, 0xCu);
      }
    }
    id v7 = [v4 objectForKey:off_999A8];
    uint64_t v8 = [v4 objectForKey:off_999B0];
    unsigned __int8 v9 = [v8 BOOLValue];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    _DWORD v12[2] = sub_5386C;
    v12[3] = &unk_8D030;
    void v12[4] = self;
    id v13 = v7;
    unsigned __int8 v14 = v9;
    id v10 = v7;
    [(LegacySMSServiceSession *)self _enqueueBlock:v12 withTimeout:240.0];
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v16 = v4;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Replaying stored SMS replay message %@", buf, 0xCu);
      }
    }
    [(LegacySMSRelayPushHandler *)self->_smsRelayPushHandler replayMessage:v4];
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
    v6[2] = sub_5397C;
    v6[3] = &unk_8D058;
    id v7 = v4;
    [(LegacySMSServiceSession *)self _enqueueBlock:v6 withTimeout:10.0];
  }
}

- (void)_processSMSOrSMSMessageSentWithContext:(id)a3 success:(BOOL)a4 messageID:(unsigned int)a5 err1:(int64_t)a6 err2:(int64_t)a7 isSMS:(BOOL)a8
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  _DWORD v17[2] = sub_53AE4;
  v17[3] = &unk_8D0A8;
  BOOL v23 = a8;
  id v13 = a3;
  BOOL v24 = a4;
  unsigned int v22 = a5;
  int64_t v20 = a6;
  int64_t v21 = a7;
  id v18 = v13;
  __int16 v19 = self;
  unsigned __int8 v14 = objc_retainBlock(v17);
  if (+[NSThread isMainThread])
  {
    ((void (*)(void *))v14[2])(v14);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_53C9C;
    v15[3] = &unk_8D0D0;
    id v16 = v14;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v15);
  }
}

- (void)_processSMSorMMSMessageReceivedWithContext:(id)a3 messageID:(int64_t)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_53DD8;
  v8[3] = &unk_8D120;
  v8[4] = self;
  int64_t v10 = a4;
  id v4 = a3;
  id v9 = v4;
  id v5 = objc_retainBlock(v8);
  if (+[NSThread isMainThread])
  {
    ((void (*)(void *))v5[2])(v5);
  }
  else
  {
    v6[0] = _NSConcreteStackBlock;
    v6[1] = 3221225472;
    v6[2] = sub_54430;
    v6[3] = &unk_8D0D0;
    id v7 = v5;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)smsMessageReceived:(id)a3 msgID:(int64_t)a4
{
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = +[NSNumber numberWithInteger:a4];
      int v9 = 138412290;
      int64_t v10 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "SMS Message received %@", (uint8_t *)&v9, 0xCu);
    }
  }
  [(LegacySMSServiceSession *)self _processSMSorMMSMessageReceivedWithContext:v6 messageID:a4];
}

- (void)mmsMessageReceived:(id)a3 msgID:(int64_t)a4
{
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = +[NSNumber numberWithInteger:a4];
      int v9 = 138412290;
      int64_t v10 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "SMS Message received %@", (uint8_t *)&v9, 0xCu);
    }
  }
  [(LegacySMSServiceSession *)self _processSMSorMMSMessageReceivedWithContext:v6 messageID:a4];
}

- (void)postMMSMessageSent:(id)a3 success:(BOOL)a4 messageID:(int64_t)a5 err1:(int64_t)a6 err2:(int64_t)a7
{
}

- (void)postSMSMessageSent:(id)a3 success:(BOOL)a4 messageID:(int64_t)a5 err1:(int64_t)a6 err2:(int64_t)a7
{
}

- (BOOL)_isDefaultPairedDeviceRelayingLocally:(id)a3
{
  uint64_t v4 = [(LegacySMSServiceSession *)self idsDeviceForFromID:a3];
  id v5 = (void *)v4;
  if (v4)
  {
    uint64_t v9 = v4;
    id v6 = +[NSArray arrayWithObjects:&v9 count:1];
    BOOL v7 = [(LegacySMSServiceSession *)self _isConnectedOverBT:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_isConnectedOverBT:(id)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = a3;
  id v4 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v20;
    *(void *)&long long v5 = 138412802;
    long long v18 = v5;
    while (2)
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(v3);
        }
        uint64_t v8 = *(__CFString **)(*((void *)&v19 + 1) + 8 * i);
        if ([(__CFString *)v8 isDefaultPairedDevice]
          && [(__CFString *)v8 isConnected]
          && [(__CFString *)v8 isNearby])
        {
          if (IMOSLoggingEnabled())
          {
            id v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              CFStringRef v24 = v8;
              _os_log_impl(&dword_0, v16, OS_LOG_TYPE_INFO, "Device is nearby: %@", buf, 0xCu);
            }
          }
          LOBYTE(v4) = 1;
          goto LABEL_33;
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v9 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v24 = v8;
            _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Device is NOT nearby: %@", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          int64_t v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            if ([(__CFString *)v8 isDefaultPairedDevice]) {
              CFStringRef v11 = @"YES";
            }
            else {
              CFStringRef v11 = @"NO";
            }
            unsigned int v12 = [(__CFString *)v8 isConnected];
            unsigned int v13 = [(__CFString *)v8 isNearby];
            CFStringRef v14 = @"NO";
            if (v12) {
              CFStringRef v15 = @"YES";
            }
            else {
              CFStringRef v15 = @"NO";
            }
            *(_DWORD *)buf = v18;
            CFStringRef v24 = v11;
            if (v13) {
              CFStringRef v14 = @"YES";
            }
            __int16 v25 = 2112;
            CFStringRef v26 = v15;
            __int16 v27 = 2112;
            CFStringRef v28 = v14;
            _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "isDefaultPairedDevice = %@, isConnected = %@, isNearby = %@", buf, 0x20u);
          }
        }
      }
      id v4 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_33:

  return (char)v4;
}

- (LegacySMSAttachmentController)attachmentController
{
  return self->_attachmentController;
}

- (void)setAttachmentController:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_attachmentController, 0);
  objc_storeStrong((id *)&self->_tapbackInterpreter, 0);
  objc_storeStrong((id *)&self->coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_pendingCodesToDevicesForApproval, 0);
  objc_storeStrong((id *)&self->_pendingRelayApprovalRequests, 0);
  objc_storeStrong((id *)&self->_originatedMessages, 0);
  objc_storeStrong((id *)&self->_smsRelayPushHandler, 0);
  objc_storeStrong((id *)&self->_currentRelayAccounts, 0);
  objc_storeStrong((id *)&self->_currentRelayDevices, 0);
  objc_storeStrong((id *)&self->_smsWatchService, 0);
  objc_storeStrong((id *)&self->_smsRelayService, 0);
  objc_storeStrong((id *)&self->_relayService, 0);
  objc_storeStrong((id *)&self->_smsRelayBlockMap, 0);
  objc_storeStrong((id *)&self->_spamBlockMap, 0);
  objc_storeStrong((id *)&self->_incomingMessageMultiQueue, 0);
  objc_storeStrong((id *)&self->_outgoingMessageFailureMap, 0);
  objc_storeStrong((id *)&self->_outgoingMessageBlockMap, 0);
  objc_storeStrong((id *)&self->_outgoingMessageMap, 0);

  objc_storeStrong((id *)&self->_outgoingRelayMessageTimerMap, 0);
}

@end