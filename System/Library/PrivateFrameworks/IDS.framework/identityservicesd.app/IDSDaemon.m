@interface IDSDaemon
+ (BOOL)_canBulkMessageWithPriority:(int64_t)a3 adHocServiceType:(unsigned int)a4;
+ (BOOL)_commandIsSessionCommand:(int64_t)a3;
+ (BOOL)_commandIsSessionGroupSessionCommand:(int64_t)a3;
+ (BOOL)_shouldReplaceLocalDestination:(id)a3;
+ (BOOL)_topicAllowsNoEncryption:(id)a3 fromURI:(id)a4;
+ (BOOL)entitlementDictionary:(id)a3 isEntitledToAccessService:(id)a4 forEntitlement:(id)a5 forAccount:(id)a6 shouldWarn:(BOOL)a7;
+ (id)accountController;
+ (id)daemon;
+ (id)messageStoreForDataProtectionClass:(unsigned int)a3;
+ (id)pairingManager;
+ (id)progressBlockForSendParameters:(id)a3 messageContext:(id)a4 topic:(id)a5 forObject:(id)a6;
+ (id)serviceController;
+ (id)sharedInstance;
+ (id)uTunDeliveryController;
+ (void)_forwardSendMessageToAccountWithSendParameters:(id)a3 service:(id)a4 threadContext:(id)a5 guid:(id)a6 dataProtectionClass:(unsigned int)a7 willSendBlock:(id)a8 progressBlock:(id)a9 completionBlock:(id)a10;
+ (void)_performDuetCheckAndSendForServiceIdentifier:(id)a3 serviceDuetIdentifiers:(id)a4 sendParameters:(id)a5 logString:(id)a6 fromQueue:(id)a7 completionBlock:(id)a8;
+ (void)_sendLocalDeliveryMessagesForAccountUUID:(id)a3 threadContext:(id)a4 priority:(int64_t)a5 dataProtectionClass:(unsigned int)a6;
+ (void)_sendLocalDeliveryMessagesForAccountUUID:(id)a3 threadContext:(id)a4 priority:(int64_t)a5 messageTypes:(id)a6 dataProtectionClass:(unsigned int)a7;
+ (void)_sendMessageWithSendParameters:(id)a3 threadContext:(id)a4 onObject:(id)a5 willSendBlock:(id)a6 progressBlock:(id)a7 completionBlock:(id)a8;
+ (void)logAccessWarningForAccount:(id)a3 withService:(id)a4 entitlement:(id)a5 clientEntitlements:(id)a6 logMessage:(id)a7;
+ (void)sendMessageWithIDSSendParameters:(id)a3 messageContext:(id)a4 threadContext:(id)a5 progressBlock:(id)a6 onObject:(id)a7;
- (BOOL)_canBulkMessageWithParameters:(id)a3;
- (BOOL)_canSendMessageWithAccount:(id)a3 toDestination:(id)a4;
- (BOOL)_canSendNonUrgentInternetMessageForTopic:(id)a3;
- (BOOL)_checkContinuityEntitlementForMessageContext:(id)a3;
- (BOOL)_checkEntitlement:(id)a3 forAccountWithID:(id)a4 messageContext:(id)a5;
- (BOOL)_checkIfDupeAndNoteGuid:(id)a3 local:(BOOL)a4 topic:(id)a5;
- (BOOL)_checkIfDupeAndNoteGuid:(id)a3 local:(BOOL)a4 topic:(id)a5 forceNoteGuid:(BOOL)a6;
- (BOOL)_doesNiceMessageContainValidCombination:(id)a3;
- (BOOL)_hasNonUrgentInternetSendingBudget;
- (BOOL)_isBulkingStorageMessagesForService:(id)a3;
- (BOOL)_isDeviceInAccountRegistration:(id)a3 forService:(id)a4;
- (BOOL)_isSpamReportingV1ServerDisabled;
- (BOOL)_isUnderFirstDataProtectionLock;
- (BOOL)_primaryAccountExistsForService:(id)a3 withURI:(id)a4;
- (BOOL)_processNonMessagingPayloadWithCommand:(id)a3 dictionaryPayload:(id)a4 senderPushToken:(id)a5 topic:(id)a6 toURI:(id)a7 fromURI:(id)a8 peerResponseIdentifier:(id)a9 guid:(id)a10 service:(id)a11 idsMessageContext:(id)a12 messageContext:(id)a13;
- (BOOL)_processQueuedBroadcastsForServices:(id)a3 priority:(int64_t)a4 forceRetry:(BOOL)a5;
- (BOOL)_rollDieForNonUrgentInternetSend;
- (BOOL)_setupListenerConnection:(id)a3 listenerID:(id)a4 pid:(int)a5 setupInfo:(id)a6 entitlements:(id)a7 setupCompletionBlock:(id)a8;
- (BOOL)_shouldDropMessageForIncomingDecryptionErrorType:(int64_t)a3;
- (BOOL)_shouldDropMessageForIncomingErrorMessageWithDecryptionErrorType:(int64_t)a3;
- (BOOL)_shouldForgetCachedPeerTokensForDecryptionErrorType:(int64_t)a3 withOriginalDecryptionError:(id)a4;
- (BOOL)_shouldForgetCachedPeerTokensForIncomingRemoteDecryptionErrorType:(int64_t)a3;
- (BOOL)_shouldIncludeDefaultDeviceAsDestinationForMessageWithParams:(id)a3 service:(id)a4;
- (BOOL)_shouldLaunchClientForCapabilities:(unsigned int)a3;
- (BOOL)_shouldMessageBeProxied:(id)a3 service:(id)a4;
- (BOOL)_shouldRejectMessageOnCrossAccountService:(id)a3 fromSenderURI:(id)a4;
- (BOOL)_shouldRejectMessageOnFamilyService:(id)a3 fromSenderURI:(id)a4;
- (BOOL)_shouldReplyWithCertifiedDeliveryReceiptForDecryptionErrorType:(int64_t)a3;
- (BOOL)_shouldReplyWithRemoteDecryptionErrorMessageForDecryptionErrorType:(int64_t)a3;
- (BOOL)_shouldRetryForDecryptionErrorType:(int64_t)a3;
- (BOOL)_shouldStoreBeforeFirstUnlockIncomingLocalMessage:(id)a3 from:(id)a4 forTopic:(id)a5;
- (BOOL)client:(id)a3 isEntitledToAccessService:(id)a4 forAnyOfEntitlements:(id)a5 shouldWarn:(BOOL)a6;
- (BOOL)client:(id)a3 isEntitledToAccessService:(id)a4 forEntitlement:(id)a5 shouldWarn:(BOOL)a6;
- (BOOL)daemonInterface:(id)a3 shouldGrantAccessForPID:(int)a4 auditToken:(id *)a5 portName:(id)a6 listenerConnection:(id)a7 setupInfo:(id)a8 setupResponse:(id *)a9;
- (BOOL)dropMessageIfDropPointIsDetectedWithSendParameters:(id)a3;
- (BOOL)firewallDatabaseAllowsFromURI:(id)a3 mergeID:(id)a4 service:(id)a5;
- (BOOL)isFirewallEnabledForService:(id)a3;
- (BOOL)isFirewallOn;
- (BOOL)isFirewallOnForService:(id)a3;
- (BOOL)isMessageFromSelfForFromURI:(id)a3 service:(id)a4;
- (BOOL)shouldDropMessageIfOutOfFamilyPhoneNumber:(id)a3 forService:(id)a4 withAppleIDAccount:(id)a5;
- (BOOL)shouldFirewallDropMessageForFromURI:(id)a3 mergeID:(id)a4 service:(id)a5;
- (BOOL)shouldProxyMessageForService:(id)a3 toIdentifier:(id)a4;
- (BOOL)validateListenerForLocalObject:(id)a3;
- (BOOL)validateListenerForLocalObject:(id)a3 andCheckEntitlement:(id)a4;
- (BOOL)validateListenerForLocalObject:(id)a3 andCheckEntitlement:(id)a4 forAccessToServiceWithIdentifier:(id)a5;
- (BOOL)validateLocalObjectForPseudonym:(id)a3 andCheckEntitlement:(id)a4 forAccessToAnyOneOfServices:(id)a5;
- (BOOL)validateLocalObjectForPseudonym:(id)a3 andCheckEntitlement:(id)a4 forAccessToServices:(id)a5;
- (Class)_messageStoreClass;
- (IDSCertifiedDeliveryReplayCommitter)replayStateCommitter;
- (IDSDaemon)init;
- (IDSRegistrationConductor)registrationConductor;
- (IDSRegistrationHashProcessor)queryUpdateNotifier;
- (IDSTransparentEndpointViewer)transparentEndpointViewer;
- (double)_decryptionRetryIntervalForError:(id)a3;
- (double)_maximumNextStoredLoadTime;
- (double)_minimumNextStoredLoadTime;
- (double)_nonUrgentInternetSendProbabilityForCurrentWindow;
- (id)_IMTransferServiceController;
- (id)_commands;
- (id)_copyDirectMessagingMetadataForRemoteObject:(id)a3;
- (id)_decryptAOverCMessage:(id)a3 topic:(id)a4 fromDeviceID:(id)a5 error:(id *)a6;
- (id)_errorForMissingEntitlement:(id)a3;
- (id)_failureReasonMessageFromSecondaryError:(id)a3 ECError:(id)a4 andLegacyError:(id)a5;
- (id)_incomingMessageStorageDictionaryForPayload:(id)a3 topic:(id)a4 deviceID:(id)a5 btUUID:(id)a6 command:(id)a7 messageUUID:(id)a8 sequenceNumber:(id)a9 wantsAppAck:(BOOL)a10 expectsPeerResponse:(BOOL)a11 peerResponseIdentifier:(id)a12;
- (id)_localPushTopics;
- (id)_lockedRemoteObjectsWithNotificationService:(id)a3 entitlement:(id)a4 command:(id)a5 capabilities:(unsigned int)a6;
- (id)_lockedRemoteObjectsWithService:(id)a3 entitlement:(id)a4 command:(id)a5 capabilities:(unsigned int)a6;
- (id)_lockedRemoteObjectsWithService:(id)a3 entitlement:(id)a4 command:(id)a5 capabilities:(unsigned int)a6 ignoreService:(BOOL)a7;
- (id)_lockedRemoteObjectsWithService:(id)a3 entitlement:(id)a4 command:(id)a5 capabilities:(unsigned int)a6 ignoreService:(BOOL)a7 useNotificationServices:(BOOL)a8;
- (id)_lockedRemoteObjectsWithService:(id)a3 entitlements:(id)a4 command:(id)a5 capabilities:(unsigned int)a6 ignoreService:(BOOL)a7 useNotificationServices:(BOOL)a8;
- (id)_messageStoreForDataProtectionClass:(unsigned int)a3;
- (id)_newSetupInfoWithContext:(id)a3;
- (id)_payloadFromDecryptedData:(id)a3;
- (id)_populateDictionaryWithSenderKeyCheck:(id)a3 remoteURI:(id)a4 localURI:(id)a5 originalGUID:(id)a6;
- (id)_processNameToServiceName:(id)a3;
- (id)_pushTopics;
- (id)_replayKeyForNiceMessage:(id)a3 encryptedData:(id)a4;
- (id)_sessionWithInstanceID:(id)a3 messageContext:(id)a4 requiredEntitlement:(id)a5;
- (id)_sessionWithUniqueID:(id)a3 messageContext:(id)a4 requiredEntitlement:(id)a5;
- (id)_ultraConstrainedPushTopicsForTopics:(id)a3;
- (id)_updateDirectMessagingMetadataForRemoteObject:(id)a3 shouldBroadcastForRemoteObject:(BOOL)a4;
- (id)_validAccountForIncomingMessageSentToURI:(id)a3 service:(id)a4 outPseudonym:(id *)a5;
- (id)accountController;
- (id)accountWithIdentifier:(id)a3 localObject:(id)a4 requiredEntitlement:(id)a5;
- (id)activityStateMonitor;
- (id)broadcastAttemptQueueFromPriority:(int64_t)a3;
- (id)broadcasterForEntitlement:(id)a3 messageContext:(id)a4;
- (id)broadcasterForLocalObject:(id)a3 messageContext:(id)a4;
- (id)broadcasterForTopic:(id)a3 entitlement:(id)a4 command:(id)a5 messageContext:(id)a6;
- (id)broadcasterForTopic:(id)a3 entitlement:(id)a4 messageContext:(id)a5;
- (id)broadcasterForTopic:(id)a3 ignoreServiceListener:(BOOL)a4 messageContext:(id)a5;
- (id)broadcasterForTopic:(id)a3 messageContext:(id)a4;
- (id)broadcasterWithMessageContext:(id)a3;
- (id)centralRegListener;
- (id)cloudRelayRegisteredAccountWithError:(id *)a3;
- (id)copyDirectMessagingInfo;
- (id)currentDevice;
- (id)daemonCapabilities;
- (id)daemonMIGInterface;
- (id)daemonMIGQueryInterface;
- (id)daemonXPCInterface;
- (id)deliveryControllerQueuedIncomingMessageDictionary:(id)a3;
- (id)dequeueBroadcastWithID:(int64_t)a3 forMessageUUID:(id)a4 service:(id)a5 priority:(int64_t)a6;
- (id)deviceHeartbeatCenter;
- (id)encryptionController;
- (id)familyManager;
- (id)firewallNotificationCenter;
- (id)idStatusQueryController;
- (id)listenerForLocalObject:(id)a3;
- (id)listenerRemoteObjectForLocalObject:(id)a3;
- (id)messageStoreForDataProtectionClass:(unsigned int)a3;
- (id)messageStoreMigrator;
- (id)opportunisticDeliveryController;
- (id)pairingManager;
- (id)persistenceManager;
- (id)pushHandlerForAPSDelegatePort;
- (id)rapportDeliveryController;
- (id)registrationBroadcasterForTopic:(id)a3 messageContext:(id)a4;
- (id)registrationController;
- (id)registrationPushManager;
- (id)restrictions;
- (id)senderKeyDistributionManager;
- (id)serverBagForBagType:(int64_t)a3;
- (id)serverStorageStateMachine;
- (id)serviceController;
- (id)sessionController;
- (id)signInResponder;
- (id)systemMonitor;
- (id)uTunController;
- (id)uTunDeliveryController;
- (id)wpLinkManager;
- (int64_t)_cleanupFrequencyForRestrictedMessages;
- (int64_t)_currentSecondsIntoDay;
- (int64_t)_expirationTimeForRestrictedMessages;
- (int64_t)_messageTypeForConnection:(int64_t)a3;
- (int64_t)_signatureTypeForSigningAlgorithm:(int64_t)a3;
- (int64_t)_subscriptionSourceNumberForContext:(id)a3;
- (unint64_t)_maxMessagesForRunawayClientConsideration;
- (unint64_t)_maxOutgoingDatabasesSizeInMB;
- (unsigned)_dedupBehaviorForNiceMessage:(id)a3;
- (void)_IDSPowerLogDictionary:(id)a3 info:(id)a4;
- (void)_ackMessageWithSequenceNumber:(unsigned int)a3 forDeviceID:(id)a4 priority:(int64_t)a5 dataProtectionClass:(unsigned int)a6 connectionType:(int64_t)a7 guid:(id)a8;
- (void)_addIncomingGUIDsWithGuid:(id)a3 isLocal:(BOOL)a4 hasLock:(BOOL)a5;
- (void)_broadcastPendingMessageUpdateForNiceMessage:(id)a3 fromURI:(id)a4 toURI:(id)a5 forTopic:(id)a6 messageContext:(id)a7;
- (void)_callReplayCommitBlockForIncomingMessages:(id)a3;
- (void)_cleanUpOutgoingMessageDatabaseAndClearStatementCache;
- (void)_cleanupExpiredIncomingMessages;
- (void)_cleanupIncomingFilesDirectories;
- (void)_cleanupIncomingFilesDirectory:(id)a3;
- (void)_cleanupIncomingMessageDatabase;
- (void)_cleanupListenerWithPid:(int)a3;
- (void)_cleanupOutgoingExpiredMessages;
- (void)_cleanupOutgoingMessageDatabase;
- (void)_cleanupOutgoingMessages;
- (void)_cleanupOutgoingQWSMessages;
- (void)_cleanupRunawayClientOutgoingMessages;
- (void)_clearIDSState;
- (void)_dropQueuedBroadcastsForServices:(id)a3 priority:(int64_t)a4;
- (void)_enqueueBlock:(id)a3 identifier:(id)a4 withTimeout:(double)a5 forKey:(id)a6;
- (void)_failSavedMessageCleanly:(id)a3 withResponseCode:(int64_t)a4;
- (void)_failSavedMessagesCleanly:(id)a3 withResponseCode:(int64_t)a4;
- (void)_fetchAccountEntitlements:(id *)a3 listenerID:(id *)a4 inContext:(id)a5;
- (void)_flushBroadcastQueuesForServices:(id)a3 existingServices:(id)a4;
- (void)_handleDeliveryReceiptForSenderKeyCheck:(id)a3 remoteURI:(id)a4 remotePushToken:(id)a5 localURI:(id)a6 originalGUID:(id)a7;
- (void)_handleIncomingNiceAttachmentMessage:(id)a3 forTopic:(id)a4 fromURI:(id)a5 certifiedDeliveryContext:(id)a6 completionBlock:(id)a7;
- (void)_handleIncomingPushNiceMessage:(id)a3 forTopic:(id)a4 fromURI:(id)a5 messageContext:(id)a6;
- (void)_handleSpaceBecomingAvailableForUrgentLocalMessagesWithDataProtectionClasses:(id)a3 withMessageTypes:(id)a4;
- (void)_iterateOverConnectedListeners:(id)a3;
- (void)_launchServiceOnDemand:(id)a3;
- (void)_locked_printBroadcastAttemptMapForPriority:(int64_t)a3 service:(id)a4;
- (void)_nonUrgentInternetSendTimerFired;
- (void)_noteItemFromStorage:(id)a3;
- (void)_noteLastItemFromStorage:(id)a3;
- (void)_notifyTinkerServicesOfPairedDevice:(id)a3 withBlock:(id)a4;
- (void)_optionallyDecryptNiceMessage:(id)a3 encryptedData:(id)a4 forGroupID:(id)a5 forTopic:(id)a6 fromURI:(id)a7 certifiedDeliveryContext:(id)a8 completionBlock:(id)a9;
- (void)_optionallyDecryptNiceMessage:(id)a3 encryptedData:(id)a4 forGroupID:(id)a5 forTopic:(id)a6 fromURI:(id)a7 certifiedDeliveryContext:(id)a8 isLiveRetry:(BOOL)a9 completionBlock:(id)a10;
- (void)_performDuetCheckAndSendForAccount:(id)a3 sendParameters:(id)a4 logString:(id)a5 fromQueue:(id)a6 completionBlock:(id)a7;
- (void)_performSetup;
- (void)_pidSuspended:(int)a3;
- (void)_postAliveNotification;
- (void)_processCertifiedDeliveryReceiptForSenderKeyDistribution:(id)a3 service:(id)a4;
- (void)_processDeletingMessagesWithPriority:(int64_t)a3 reason:(id)a4 responseCode:(int64_t)a5 allowedTrafficClasses:(id)a6;
- (void)_processDisallowedMessages;
- (void)_processIncomingLocalMessage:(id)a3 topic:(id)a4 command:(id)a5 deviceID:(id)a6 btUUID:(id)a7 context:(id)a8 storedGUID:(id)a9 priority:(id)a10 connectionType:(int64_t)a11 didWakeHint:(BOOL)a12;
- (void)_processIncomingRemoteNiceMessage:(id)a3 forTopic:(id)a4 fromURI:(id)a5 storedGuid:(id)a6 messageContext:(id)a7;
- (void)_processIncomingRemoteResourceTransferMessage:(id)a3 forceDownload:(BOOL)a4 guid:(id)a5 context:(id)a6 specificOriginatorURI:(id)a7 broadcastTopic:(id)a8 toURI:(id)a9 topic:(id)a10 messageContext:(id)a11;
- (void)_processKTPeerUpdateMessageForService:(id)a3 localURI:(id)a4 remoteURI:(id)a5;
- (void)_processLocalMessagesWithAccountUUIDs:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5;
- (void)_processLocalMessagesWithAccountUUIDs:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 messageTypes:(id)a6;
- (void)_processMessageError:(BOOL)a3 topLevelMessage:(id)a4 error:(id)a5 messageID:(id)a6 failureReasonMessage:(id)a7 service:(id)a8 serviceType:(id)a9 pushToken:(id)a10 fromURI:(id)a11 toURI:(id)a12 groupID:(id)a13 completionBlock:(id)a14;
- (void)_processMessagesUponUnpairing;
- (void)_processOutgoingNonUrgentInternetMessages;
- (void)_processStoredIncomingLocalMessage:(id)a3;
- (void)_processStoredIncomingLocalMessages;
- (void)_processStoredIncomingMessages;
- (void)_processStoredIncomingMessagesForCategory:(unsigned int)a3;
- (void)_processStoredIncomingRemoteMessagesWithGUIDs:(id)a3 ignoringGUIDs:(id)a4 controlCategory:(unsigned int)a5 lastTimeInterval:(double)a6 repeatedAttempt:(BOOL)a7;
- (void)_processStoredIncomingRemoteMessagesWithGUIDs:(id)a3 ignoringGUIDs:(id)a4 lastTimeInterval:(double)a5;
- (void)_processStoredMessagesIncludingClassD:(BOOL)a3;
- (void)_processStoredOutgoingUrgentMessagesProcessLocalAccounts:(BOOL)a3;
- (void)_registerForCheckpointAndVacuumDB;
- (void)_registerForDailyMetricReporting;
- (void)_registerForNetworkAvailableNotification;
- (void)_registerSysdiagnoseBlock;
- (void)_removeAccount:(id)a3 messageContext:(id)a4;
- (void)_removeAndDeregisterAccount:(id)a3 messageContext:(id)a4;
- (void)_removeListener:(id)a3;
- (void)_removeListenerWithRemoteXPCObject:(id)a3;
- (void)_removeLocalListenerObject:(id)a3;
- (void)_reregisterAndReidentify:(id)a3 account:(id)a4 messageContext:(id)a5;
- (void)_resetBroadcastQueuesForServices:(id)a3;
- (void)_resetPreferences;
- (void)_resetQueuedBroadcastsForServices:(id)a3 priority:(int64_t)a4;
- (void)_resourceAvailabilityChangedForIdentifiers:(id)a3 priorities:(id)a4 dataProtectionClasses:(id)a5;
- (void)_resourceAvailabilityChangedForIdentifiers:(id)a3 priorities:(id)a4 dataProtectionClasses:(id)a5 messageTypes:(id)a6;
- (void)_resourceAvailabilityChangedForIdentifiers:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5;
- (void)_resourceAvailabilityChangedForIdentifiers:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 messageTypes:(id)a6;
- (void)_respondToAppleCareRequestID:(id)a3 withMessageContext:(id)a4 error:(id)a5;
- (void)_respondToRegistrationControlWithRequestID:(id)a3 status:(int64_t)a4 messageContext:(id)a5 error:(id)a6;
- (void)_respondToVMDataRequestWithData:(id)a3 requestID:(id)a4 error:(id)a5 messageContext:(id)a6;
- (void)_restrictedMessageCleanupTimerFired;
- (void)_sendCertifiedDeliveryReceiptForSenderKeyDistributionMessage:(id)a3 service:(id)a4 keyIDs:(id)a5;
- (void)_sendCertifiedDeliveryReceiptIfNeededForNiceMessage:(id)a3 service:(id)a4 failureReason:(id)a5 failureReasonMessage:(id)a6 generateDeliveryReceipt:(BOOL)a7;
- (void)_sendErrorMessage:(id)a3 originalCommand:(id)a4 fromURI:(id)a5 toDestinations:(id)a6 usingAccountWithUniqueID:(id)a7 useDictAsTopLevel:(BOOL)a8 dataToEncrypt:(id)a9 wantsResponse:(BOOL)a10 timeout:(double)a11 command:(id)a12 priority:(int64_t)a13 completionBlock:(id)a14;
- (void)_sendNiceMessageCheckpointIfNecessary:(id)a3 checkpoint:(int64_t)a4 service:(id)a5 additionalInformation:(id)a6;
- (void)_setupRestrictedMessageCleanupTimer;
- (void)_startPushHandlingLocked;
- (void)_stopPushHandling;
- (void)_storageTimerFired;
- (void)_submitLastResortCacheMetricForGUID:(id)a3 service:(id)a4;
- (void)_submitRegistrationAccountStatusMetric;
- (void)_terminate;
- (void)_updateNonUrgentInternetSendTimer;
- (void)_updatePushCommandsLocked;
- (void)_updateStorageTimerWithInterval:(double)a3;
- (void)acceptInvitation:(id)a3 messageContext:(id)a4;
- (void)acceptInvitation:(id)a3 withData:(id)a4 messageContext:(id)a5;
- (void)acknowledgeMessageWithGUID:(id)a3 forAccountWithUniqueID:(id)a4 broadcastTime:(id)a5 messageSize:(id)a6 priority:(id)a7 messageContext:(id)a8;
- (void)acknowledgeMessageWithStorageGUID:(id)a3 realGUID:(id)a4 forAccountWithUniqueID:(id)a5 broadcastTime:(id)a6 messageSize:(id)a7 priority:(id)a8 broadcastID:(int64_t)a9 connectionType:(int64_t)a10 messageContext:(id)a11;
- (void)acknowledgeOutgoingMessageWithGUID:(id)a3 alternateCallbackID:(id)a4 forAccountWithUniqueID:(id)a5 messageContext:(id)a6;
- (void)acknowledgeSessionID:(id)a3 clientID:(id)a4 messageContext:(id)a5;
- (void)addAccountWithLoginID:(id)a3 serviceName:(id)a4 uniqueID:(id)a5 accountType:(int)a6 accountInfo:(id)a7 messageContext:(id)a8;
- (void)addAliases:(id)a3 toAccount:(id)a4 messageContext:(id)a5;
- (void)appleCareSignInUserName:(id)a3 DSID:(id)a4 authToken:(id)a5 requestID:(id)a6 messageContext:(id)a7;
- (void)appleCareSignOutUserWithRequestID:(id)a3 messageContext:(id)a4;
- (void)authTokenChanged:(id)a3 forAccount:(id)a4 messageContext:(id)a5;
- (void)authenticateAccount:(id)a3 messageContext:(id)a4;
- (void)authenticatePhoneWithRequestUUID:(id)a3 messageContext:(id)a4;
- (void)cancelInvitation:(id)a3 messageContext:(id)a4;
- (void)cancelInvitation:(id)a3 withData:(id)a4 messageContext:(id)a5;
- (void)cancelInvitation:(id)a3 withRemoteEndedReasonOverride:(unsigned int)a4 messageContext:(id)a5;
- (void)cancelItemWithIdentifier:(id)a3 service:(id)a4 messageContext:(id)a5;
- (void)cancelMessageWithQueueOneIdentifier:(id)a3 fromID:(id)a4 service:(id)a5 accountUniqueID:(id)a6 messageIdentifier:(id)a7 messageContext:(id)a8;
- (void)cancelOpportunisticDataOnService:(id)a3 withIdentifier:(id)a4 messageContext:(id)a5;
- (void)cleanupSession:(id)a3 messageContext:(id)a4;
- (void)cleanupSessionWithInstanceID:(id)a3 messageContext:(id)a4;
- (void)clearIDSStateWithMessageContext:(id)a3;
- (void)closeSocketWithOptions:(id)a3 messageContext:(id)a4;
- (void)continuityClientInstanceCreatedWithMessageContext:(id)a3;
- (void)continuityStartAdvertisingOfType:(int64_t)a3 withData:(id)a4 withOptions:(id)a5 messageContext:(id)a6;
- (void)continuityStartScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 boostedScan:(BOOL)a6 duplicates:(BOOL)a7 messageContext:(id)a8;
- (void)continuityStartScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 messageContext:(id)a6;
- (void)continuityStartScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 boostedScan:(BOOL)a7 duplicates:(BOOL)a8 messageContext:(id)a9;
- (void)continuityStartScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 messageContext:(id)a7;
- (void)continuityStartTrackingPeer:(id)a3 forType:(int64_t)a4 messageContext:(id)a5;
- (void)continuityStopAdvertisingOfType:(int64_t)a3 messageContext:(id)a4;
- (void)continuityStopScanningForType:(int64_t)a3 messageContext:(id)a4;
- (void)continuityStopTrackingPeer:(id)a3 forType:(int64_t)a4 messageContext:(id)a5;
- (void)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5 messageContext:(id)a6;
- (void)deactivateAndPurgeIdentifyForAccount:(id)a3 messageContext:(id)a4;
- (void)dealloc;
- (void)declineInvitation:(id)a3 messageContext:(id)a4;
- (void)declineInvitation:(id)a3 withData:(id)a4 messageContext:(id)a5;
- (void)deletePendingResourceWithMessageGUID:(id)a3 messageContext:(id)a4;
- (void)deliveryController:(id)a3 dataReceived:(id)a4 topic:(id)a5 command:(id)a6 deviceID:(id)a7 btUUID:(id)a8 messageID:(id)a9 wantsAppAck:(BOOL)a10 expectsPeerResponse:(BOOL)a11 peerResponseIdentifier:(id)a12 messageUUID:(id)a13 priority:(int64_t)a14 isCompressed:(BOOL)a15 connectionType:(int64_t)a16 didWakeHint:(BOOL)a17;
- (void)deliveryController:(id)a3 device:(id)a4 supportsDirectMessaging:(BOOL)a5 isObliterating:(BOOL)a6;
- (void)deliveryController:(id)a3 didReceiveMessage:(id)a4 topic:(id)a5 command:(id)a6 deviceID:(id)a7 messageID:(id)a8;
- (void)deliveryController:(id)a3 messageReceived:(id)a4 topic:(id)a5 command:(id)a6 deviceID:(id)a7 btUUID:(id)a8 messageID:(id)a9 wantsAppAck:(BOOL)a10 expectsPeerResponse:(BOOL)a11 peerResponseIdentifier:(id)a12 messageUUID:(id)a13 priority:(int64_t)a14 isCompressed:(BOOL)a15 connectionType:(int64_t)a16 didWakeHint:(BOOL)a17;
- (void)deliveryController:(id)a3 protobufReceived:(id)a4 topic:(id)a5 command:(id)a6 deviceID:(id)a7 btUUID:(id)a8 messageID:(id)a9 wantsAppAck:(BOOL)a10 expectsPeerResponse:(BOOL)a11 peerResponseIdentifier:(id)a12 messageUUID:(id)a13 priority:(int64_t)a14 isCompressed:(BOOL)a15 connectionType:(int64_t)a16 didWakeHint:(BOOL)a17;
- (void)deliveryController:(id)a3 receivedAppLevelAckWithTopic:(id)a4 deviceID:(id)a5 btUUID:(id)a6 messageID:(id)a7 peerResponseIdentifier:(id)a8 priority:(int64_t)a9 connectionType:(int64_t)a10;
- (void)deliveryControllerHasSpaceforNonUrgentMessages:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5;
- (void)deliveryControllerHasSpaceforNonUrgentMessages:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 ofTypes:(id)a6;
- (void)deliveryControllerHasSpaceforUrgentMessages:(id)a3 dataProtectionClass:(unsigned int)a4 ofTypes:(id)a5;
- (void)didAddPairedDevice:(id)a3;
- (void)didRemovePairedDevice:(id)a3;
- (void)didUpdatePairedDevice:(id)a3;
- (void)didUpdateProtocolForPairedDevice:(id)a3;
- (void)disableAccount:(id)a3 messageContext:(id)a4;
- (void)downloadPendingResourceWithMessageGUID:(id)a3 messageContext:(id)a4;
- (void)dropQueuedBroadcastsForServices:(id)a3;
- (void)duetInterface:(id)a3 resourceAvailabilityChangedForIdentifiers:(id)a4;
- (void)enableAccount:(id)a3 messageContext:(id)a4;
- (void)enableP2PlinksForSession:(id)a3 messageContext:(id)a4;
- (void)endSession:(id)a3 messageContext:(id)a4;
- (void)endSession:(id)a3 withData:(id)a4 messageContext:(id)a5;
- (void)enqueueBroadcast:(id)a3 forTopic:(id)a4 entitlement:(id)a5 command:(id)a6 capabilities:(unsigned int)a7 messageContext:(id)a8;
- (void)enqueueIncomingMessageBroadcast:(id)a3 broadcastData:(id)a4 forTopic:(id)a5 entitlement:(id)a6 command:(id)a7 capabilities:(unsigned int)a8 messageContext:(id)a9;
- (void)failedDecryptingMessage:(id)a3 reason:(int64_t)a4 forGroupID:(id)a5 onService:(id)a6 messageContext:(id)a7;
- (void)fetchPhoneUserSubscriptionSourceWithRequestUUID:(id)a3 messageContext:(id)a4;
- (void)forceDisableAccount:(id)a3 messageContext:(id)a4;
- (void)forceRemoveAccount:(id)a3 messageContext:(id)a4;
- (void)gameCenterModifyForUserName:(id)a3 messageContext:(id)a4;
- (void)gameCenterSignInWithUserName:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8 messageContext:(id)a9;
- (void)gameCenterSignOutWithMessageContext:(id)a3;
- (void)generatePhoneAuthenticationSignatureOverData:(id)a3 withRequestUUID:(id)a4 messageContext:(id)a5;
- (void)getDeliveryStatsWithMessageContext:(id)a3;
- (void)getLocalIncomingPowerAssertion:(id)a3 queue:(id)a4;
- (void)getParticipantIDForAlias:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5 messageContext:(id)a6;
- (void)getProgressUpdateForIdentifier:(id)a3 service:(id)a4 messageContext:(id)a5;
- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7;
- (void)handler:(id)a3 didReceiveMessage:(id)a4 forUnknownTopic:(id)a5 messageContext:(id)a6;
- (void)handler:(id)a3 isConnectedChanged:(BOOL)a4;
- (void)handler:(id)a3 receivedNoStorageResponseForTopic:(id)a4 identifier:(id)a5 messageContext:(id)a6;
- (void)handler:(id)a3 receivedOfflineMessagePendingForTopic:(id)a4 messageContext:(id)a5;
- (void)hardDeregisterWithMessageContext:(id)a3;
- (void)homeKitGetAdminAccessTokensWithServiceUserID:(id)a3 accessoryID:(id)a4 pairingToken:(id)a5 messageContext:(id)a6;
- (void)homeKitGetConsentTokensWithServiceUserID:(id)a3 accessoryIDs:(id)a4 adminID:(id)a5 messageContext:(id)a6;
- (void)homeKitGetServiceUserIDsWithMessageContext:(id)a3;
- (void)homeKitGetUserAccessTokensWithServiceUserID:(id)a3 userID:(id)a4 userHandle:(id)a5 accessoryRequests:(id)a6 messageContext:(id)a7;
- (void)iCloudModifyForUserName:(id)a3 messageContext:(id)a4;
- (void)iCloudSignInHackWithUserName:(id)a3 password:(id)a4 messageContext:(id)a5;
- (void)iCloudSignInWithUserName:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8 messageContext:(id)a9;
- (void)iCloudSignOutHackWithMessageContext:(id)a3;
- (void)iCloudSignOutWithMessageContext:(id)a3;
- (void)iCloudUpdateForUserName:(id)a3 accountInfo:(id)a4 messageContext:(id)a5;
- (void)iTunesSignInWithUserName:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8 messageContext:(id)a9;
- (void)iTunesSignOutWithMessageContext:(id)a3;
- (void)incomingAccountSyncMessage:(id)a3 messageContext:(id)a4;
- (void)initialLocalSyncCompletedForServices:(id)a3 messageContext:(id)a4;
- (void)initialLocalSyncStartedForServices:(id)a3 messageContext:(id)a4;
- (void)joinGroupSession:(id)a3 withOptions:(id)a4 messageContext:(id)a5;
- (void)kickGetDependentForAccount:(id)a3 messageContext:(id)a4;
- (void)launchOnDemandServicesForNeedsLaunchOnNearbyDevicesChanged;
- (void)launchOnDemandServicesForQueuedBroadcastAttempts;
- (void)leaveGroupSession:(id)a3 participantInfo:(id)a4 options:(id)a5 messageContext:(id)a6;
- (void)localObjectDiedNotification:(id)a3;
- (void)logState;
- (void)manageDesignatedMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 withType:(unsigned __int16)a6 messageContext:(id)a7;
- (void)networkStateChangedForLogTransportHint:(id)a3;
- (void)noteBlockedMessageFromURI:(id)a3 service:(id)a4;
- (void)notifyClients:(unint64_t)a3;
- (void)openSocketWithOptions:(id)a3 messageContext:(id)a4;
- (void)passwordChanged:(id)a3 forAccount:(id)a4 messageContext:(id)a5;
- (void)passwordUpdatedForAccount:(id)a3 messageContext:(id)a4;
- (void)persistPendingInvitation:(id)a3 forService:(id)a4 withUniqueID:(id)a5 messageContext:(id)a6;
- (void)persistReceivedInvitation:(id)a3 forService:(id)a4 withUniqueID:(id)a5 messageContext:(id)a6;
- (void)processDirectMessagingCapability:(BOOL)a3;
- (void)processDirectMessagingInfo:(id)a3;
- (void)provisionPseudonymForURI:(id)a3 onAccount:(id)a4 withProperties:(id)a5 requestProperties:(id)a6 requestUUID:(id)a7 messageContext:(id)a8;
- (void)queryHashForceUpdate:(id)a3 fromURI:(id)a4 messageUUID:(id)a5 updateHash:(id)a6 toURI:(id)a7 service:(id)a8;
- (void)reRegisterWithUserID:(id)a3 action:(id)a4 service:(id)a5 messageContext:(id)a6;
- (void)receivedDirectMsgSocketRequestForService:(id)a3 stream:(id)a4 flags:(unint64_t)a5;
- (void)reconnectSessionWithUniqueID:(id)a3 messageContext:(id)a4;
- (void)refreshBundleIDs;
- (void)regenerateRegisteredIdentityWithMessageContext:(id)a3;
- (void)registerAccount:(id)a3 messageContext:(id)a4;
- (void)registerForNotificationsOnServices:(id)a3 messageContext:(id)a4;
- (void)registerForQueryDBCleanup;
- (void)registerForRegistrationAccountStatusMetric;
- (void)registerForRegistrationEventTrackCleanup;
- (void)registerForSenderKeyCleanup;
- (void)registerPluginForGroup:(id)a3 options:(id)a4 messageContext:(id)a5;
- (void)registrationControlGetRegistrationStateForRegistrationType:(int64_t)a3 requestID:(id)a4 messageContext:(id)a5;
- (void)registrationControlSetRegistrationStateForRegistrationType:(int64_t)a3 toState:(int64_t)a4 requestID:(id)a5 messageContext:(id)a6;
- (void)registrationHashProcessor:(id)a3 didFlushCacheForService:(id)a4 remoteURI:(id)a5 localURI:(id)a6 guid:(id)a7;
- (void)releaseBroadcastAttemptQueue:(int64_t)a3;
- (void)remoteObjectDiedNotification:(id)a3;
- (void)removeAliases:(id)a3 fromAccount:(id)a4 messageContext:(id)a5;
- (void)removeListenerWithRemoteXPCObject:(id)a3;
- (void)removeLocalListenerObject:(id)a3;
- (void)removeParticipantIDs:(id)a3 forGroup:(id)a4 sessionID:(id)a5 messageContext:(id)a6;
- (void)removePendingInvitation:(id)a3 forService:(id)a4 messageContext:(id)a5;
- (void)removeReceivedInvitation:(id)a3 forService:(id)a4 messageContext:(id)a5;
- (void)removeWakingPushPriorityForServices:(id)a3;
- (void)renewPseudonym:(id)a3 onAccount:(id)a4 forUpdatedExpiryEpoch:(double)a5 requestProperties:(id)a6 requestUUID:(id)a7 messageContext:(id)a8;
- (void)repairAccountsWithMessageContext:(id)a3;
- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 onAccount:(id)a6 requestUUID:(id)a7 messageContext:(id)a8;
- (void)reportDailyMetrics;
- (void)reportSpamMessage:(id)a3 serviceIdentifier:(id)a4 messageContext:(id)a5;
- (void)reportiMessageSpam:(id)a3 toURI:(id)a4 messageContext:(id)a5;
- (void)reportiMessageSpamCheckUnknown:(id)a3 count:(id)a4 requestID:(id)a5 messageContext:(id)a6;
- (void)reportiMessageUnknownSender:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isJunked:(BOOL)a6 messageServerTimestamp:(id)a7 toURI:(id)a8 messageContext:(id)a9;
- (void)requestActiveParticipantsForGroupSession:(id)a3 messageContext:(id)a4;
- (void)requestCarrierTokenForSubscriptionSource:(id)a3 IMEI:(id)a4 carrierNonce:(id)a5 requestUUID:(id)a6 messageContext:(id)a7;
- (void)requestEncryptionKeyForGroup:(id)a3 participants:(id)a4 messageContext:(id)a5;
- (void)requestPublicKeysForRealTimeEncryption:(id)a3 forAccountWithID:(id)a4 messageContext:(id)a5;
- (void)requestRealTimeEncryptionMasterKeyMaterial:(id)a3 forGroup:(id)a4 messageContext:(id)a5;
- (void)requestURIsForParticipantIDs:(id)a3 withRequestID:(id)a4 forGroupSession:(id)a5 messageContext:(id)a6;
- (void)requestVMData:(id)a3 requestID:(id)a4 messageContext:(id)a5;
- (void)resetRealTimeEncryptionKeys:(id)a3 forGroup:(id)a4 messageContext:(id)a5;
- (void)respondToRegistrationControlActionWithRequestID:(id)a3 messageContext:(id)a4 error:(id)a5;
- (void)revokePseudonym:(id)a3 onAccount:(id)a4 requestProperties:(id)a5 requestUUID:(id)a6 messageContext:(id)a7;
- (void)sendAllocationRequest:(id)a3 options:(id)a4 messageContext:(id)a5;
- (void)sendAppAckWithGUID:(id)a3 toDestination:(id)a4 forAccountWithUniqueID:(id)a5 connectionType:(int64_t)a6 messageContext:(id)a7;
- (void)sendCertifiedDeliveryReceipt:(id)a3 serviceName:(id)a4 messageContext:(id)a5;
- (void)sendInvitation:(id)a3 withData:(id)a4 declineOnError:(BOOL)a5 messageContext:(id)a6;
- (void)sendInvitation:(id)a3 withOptions:(id)a4 messageContext:(id)a5;
- (void)sendMessageWithSendParameters:(id)a3 messageContext:(id)a4;
- (void)sendOpportunisticData:(id)a3 onService:(id)a4 usingAccountWithUniqueID:(id)a5 withIdentifier:(id)a6 options:(id)a7 messageContext:(id)a8;
- (void)sendRealTimeEncryptionMKMRecoveryRequest:(id)a3 toGroup:(id)a4;
- (void)sendRealTimeEncryptionMasterKeyMaterial:(id)a3 toGroup:(id)a4 messageContext:(id)a5;
- (void)sendRealTimeMediaPrekey:(id)a3 toGroup:(id)a4 messageContext:(id)a5;
- (void)sendServerMessage:(id)a3 command:(id)a4 usingAccountWithUniqueID:(id)a5 messageContext:(id)a6;
- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4 forSessionWithUniqueID:(id)a5 messageContext:(id)a6;
- (void)setAudioEnabled:(BOOL)a3 forSessionWithUniqueID:(id)a4 messageContext:(id)a5;
- (void)setForceTCPFallbackOnCellUsingReinitiate:(BOOL)a3 forSessionWithUniqueID:(id)a4 messageContext:(id)a5;
- (void)setForceTCPFallbackOnWiFiUsingReinitiate:(BOOL)a3 forSessionWithUniqueID:(id)a4 messageContext:(id)a5;
- (void)setInviteTimetout:(int64_t)a3 forSessionWithUniqueID:(id)a4 messageContext:(id)a5;
- (void)setLinkPreferences:(id)a3 service:(id)a4 messageContext:(id)a5;
- (void)setListenerServices:(id)a3 commands:(id)a4 capabilities:(unsigned int)a5 messageContext:(id)a6;
- (void)setMuted:(BOOL)a3 forSessionWithUniqueID:(id)a4 messageContext:(id)a5;
- (void)setNSUUID:(id)a3 onDeviceWithUniqueID:(id)a4 forService:(id)a5 messageContext:(id)a6;
- (void)setPairedDeviceInfo:(id)a3 messageContext:(id)a4;
- (void)setPassword:(id)a3 forUsername:(id)a4 onService:(id)a5 messageContext:(id)a6;
- (void)setPhoneUserSubscriptionSource:(id)a3 withRequestUUID:(id)a4 messageContext:(id)a5;
- (void)setPreferInfraWiFi:(BOOL)a3 service:(id)a4 messageContext:(id)a5;
- (void)setPreferences:(id)a3 forSessionWithUniqueID:(id)a4 messageContext:(id)a5;
- (void)setQuickRelayUserTypeForSession:(id)a3 withUserType:(unsigned __int16)a4 messageContext:(id)a5;
- (void)setRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4 forSessionWithUniqueID:(id)a5 messageContext:(id)a6;
- (void)setWakingPushPriority:(int64_t)a3 forTopic:(id)a4 messageContext:(id)a5;
- (void)setupAccountWithLoginID:(id)a3 serviceName:(id)a4 accountType:(int)a5 accountConfig:(id)a6 authToken:(id)a7 password:(id)a8 transactionID:(id)a9 messageContext:(id)a10;
- (void)setupNewSessionWithConfiguration:(id)a3 messageContext:(id)a4;
- (void)setupRealtimeEncryptionController:(id)a3 forAccountWithID:(id)a4 messageContext:(id)a5;
- (void)shutdown;
- (void)signData:(id)a3 withAlgorithm:(int64_t)a4 onService:(id)a5 options:(id)a6 requestUUID:(id)a7 messageContext:(id)a8;
- (void)startOTRTest:(id)a3 priority:(int64_t)a4 messageContext:(id)a5;
- (void)systemDidLeaveDataProtectionLock;
- (void)systemDidLeaveFirstDataProtectionLock;
- (void)systemDidLock;
- (void)systemDidUnlock;
- (void)systemDidWake;
- (void)systemWillSleep;
- (void)testCloudQRConnection:(id)a3 messageContext:(id)a4;
- (void)triggerFinalDeregisterWithMessageContext:(id)a3;
- (void)tryForceFamilyFetchWithMessageContext:(id)a3;
- (void)unregisterAccount:(id)a3 messageContext:(id)a4;
- (void)unregisterPluginForGroup:(id)a3 options:(id)a4 messageContext:(id)a5;
- (void)unvalidateAliases:(id)a3 forAccount:(id)a4 messageContext:(id)a5;
- (void)updateAccount:(id)a3 withAccountInfo:(id)a4 messageContext:(id)a5;
- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4 forAccount:(id)a5 messageContext:(id)a6;
- (void)updateMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 withContext:(id)a6 messagingCapabilities:(id)a7 triggeredLocally:(BOOL)a8 lightweightStatusDict:(id)a9 messageContext:(id)a10;
- (void)updateParticipantData:(id)a3 forGroup:(id)a4 sessionID:(id)a5 withContext:(id)a6 messageContext:(id)a7;
- (void)updateParticipantInfo:(id)a3 forGroup:(id)a4 sessionID:(id)a5 messageContext:(id)a6;
- (void)updateParticipantType:(unsigned __int16)a3 forGroup:(id)a4 sessionID:(id)a5 members:(id)a6 triggeredLocally:(BOOL)a7 withContext:(id)a8 lightweightStatusDict:(id)a9 messageContext:(id)a10;
- (void)updateSubServices:(id)a3 forService:(id)a4 deviceUniqueID:(id)a5 messageContext:(id)a6;
- (void)updateTopics;
- (void)updateUserWithOldUserName:(id)a3 newUserName:(id)a4 messageContext:(id)a5;
- (void)validateAliases:(id)a3 forAccount:(id)a4 messageContext:(id)a5;
- (void)validateListenerForLocalObject:(id)a3 andPerformBlock:(id)a4;
- (void)validateProfileForAccount:(id)a3 messageContext:(id)a4;
- (void)verifySignedData:(id)a3 matchesData:(id)a4 forAlgorithm:(int64_t)a5 onService:(id)a6 tokenUri:(id)a7 options:(id)a8 requestUUID:(id)a9 messageContext:(id)a10;
- (void)wakeClientForService:(id)a3 stream:(id)a4 flags:(unint64_t)a5;
- (void)writeIDSDirectMessageInfo:(_dmsg_info *)a3;
- (void)xpcObject:(id)a3 objectContext:(id)a4 messageContext:(id)a5;
@end

@implementation IDSDaemon

- (id)_copyDirectMessagingMetadataForRemoteObject:(id)a3
{
  id v4 = a3;
  if (_IDSSupportsDirectMessaging())
  {
    v5 = [(IDSDaemon *)self _updateDirectMessagingMetadataForRemoteObject:v4 shouldBroadcastForRemoteObject:0];
  }
  else
  {
    v5 = 0;
  }

  return v5;
}

- (id)_updateDirectMessagingMetadataForRemoteObject:(id)a3 shouldBroadcastForRemoteObject:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  if (!_IDSSupportsDirectMessaging())
  {
    id v17 = 0;
    goto LABEL_54;
  }
  BOOL v43 = v4;
  v44 = v5;
  im_assert_primary_base_queue();
  v6 = +[IDSDServiceController sharedInstance];
  v45 = [v6 allServicesStrings];

  if (v45 && [v45 count])
  {
    v7 = +[IDSPairingManager sharedInstance];
    v42 = [v7 pairedDeviceUniqueID];

    if (v42)
    {
      id v41 = [objc_alloc((Class)NSUUID) initWithUUIDString:v42];
      v8 = [v5 entitlements];
      uint64_t v9 = kIDSMessagingEntitlement;
      if (([v8 hasEntitlement:kIDSMessagingEntitlement] & 1) != 0
        || ([v8 hasEntitlement:kIDSUrgentPriorityMessagingEntitlement] & 1) != 0
        || ([v8 hasEntitlement:kIDSHighPriorityMessagingEntitlement] & 1) != 0)
      {
        id v46 = objc_alloc_init((Class)NSMutableArray);
        long long v47 = 0u;
        long long v48 = 0u;
        long long v49 = 0u;
        long long v50 = 0u;
        id v10 = v45;
        id v11 = [v10 countByEnumeratingWithState:&v47 objects:v57 count:16];
        if (v11)
        {
          uint64_t v12 = *(void *)v48;
          do
          {
            for (i = 0; i != v11; i = (char *)i + 1)
            {
              if (*(void *)v48 != v12) {
                objc_enumerationMutation(v10);
              }
              uint64_t v14 = *(void *)(*((void *)&v47 + 1) + 8 * i);
              if ([v8 hasService:v14 forEntitlement:v9])
              {
                v15 = +[IDSDServiceController sharedInstance];
                v16 = [v15 serviceWithName:v14];

                if ([v16 allowWakingMessages]
                  && [v16 dataProtectionClass] != 1
                  && ([v16 shouldProtectTrafficUsingClassA] & 1) == 0)
                {
                  [v46 addObject:v14];
                }
              }
            }
            id v11 = [v10 countByEnumeratingWithState:&v47 objects:v57 count:16];
          }
          while (v11);
        }

        if ([v46 count])
        {
          id v17 = objc_alloc_init((Class)NSMutableDictionary);
          v18 = [v41 UUIDString];
          [v17 setObject:v18 forKeyedSubscript:@"peerIDForDirectMsg"];

          [v17 setObject:v46 forKeyedSubscript:@"directMsgAllowedForServices"];
          v19 = +[NSNumber numberWithInt:getpid()];
          [v17 setObject:v19 forKeyedSubscript:@"pidForIDSD"];

          v20 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
          {
            v21 = [v44 localObject];
            v22 = [v21 processName];
            *(_DWORD *)buf = 138412802;
            v52 = v22;
            __int16 v53 = 2112;
            id v54 = v17;
            __int16 v55 = 1024;
            BOOL v56 = v43;
            _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "completing setup info for %@ : %@, broadcast %d", buf, 0x1Cu);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            v23 = [v44 localObject];
            v38 = [v23 processName];
            _IDSLogV();
          }
          if (!v43) {
            goto LABEL_51;
          }
          v24 = +[IDSDaemon sharedInstance];
          v25 = [v44 localObject];
          v26 = [v24 broadcasterForLocalObject:v25 messageContext:0];

          [v26 receivedMetadataForDirectMessaging:v17];
          goto LABEL_50;
        }
        v31 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v31, OS_LOG_TYPE_DEFAULT))
        {
          v32 = [v44 localObject];
          v33 = [v32 processName];
          *(_DWORD *)buf = 138412290;
          v52 = v33;
          _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_DEFAULT, "No allowed services when processing %@", buf, 0xCu);
        }
        if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
        {
          id v17 = 0;
LABEL_51:

LABEL_52:
          goto LABEL_53;
        }
        v26 = [v44 localObject];
        v40 = [v26 processName];
        _IDSLogV();
      }
      else
      {
        v34 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
        {
          v35 = [v5 localObject];
          v36 = [v35 processName];
          *(_DWORD *)buf = 138412290;
          v52 = v36;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "No entitlements when processing %@", buf, 0xCu);
        }
        if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog())
        {
          id v17 = 0;
          goto LABEL_52;
        }
        id v46 = [v5 localObject];
        v26 = [v46 processName];
        _IDSLogV();
      }
      id v17 = 0;
LABEL_50:

      goto LABEL_51;
    }
  }
  else
  {
    v27 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      v28 = [v5 localObject];
      v29 = [v28 processName];
      *(_DWORD *)buf = 138412290;
      v52 = v29;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "No services when processing %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      v30 = [v5 localObject];
      v39 = [v30 processName];
      _IDSLogV();
    }
  }
  id v17 = 0;
LABEL_53:
  id v5 = v44;
LABEL_54:

  return v17;
}

- (void)_resetQueuedBroadcastsForServices:(id)a3 priority:(int64_t)a4
{
  id v6 = a3;
  p_listenerLock = &self->_listenerLock;
  pthread_mutex_lock(&self->_listenerLock);
  v8 = [(IDSDaemon *)self broadcastAttemptQueueFromPriority:a4];
  if ([v8 count] && objc_msgSend(v6, "count"))
  {
    uint64_t v9 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v24 = v6;
      __int16 v25 = 2048;
      int64_t v26 = a4;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_INFO, "Broadcast: Resetting queued broadcasts for services %@ priority %ld \n", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      id v16 = v6;
      int64_t v17 = a4;
      _IDSLogTransport();
    }
    long long v20 = 0u;
    long long v21 = 0u;
    long long v18 = 0u;
    long long v19 = 0u;
    id v11 = v6;
    id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
    if (v12)
    {
      uint64_t v13 = *(void *)v19;
      do
      {
        uint64_t v14 = 0;
        do
        {
          if (*(void *)v19 != v13) {
            objc_enumerationMutation(v11);
          }
          v15 = objc_msgSend(v8, "objectForKey:", *(void *)(*((void *)&v18 + 1) + 8 * (void)v14), v16, v17, (void)v18);
          [v15 enumerateObjectsUsingBlock:&stru_100983388];

          uint64_t v14 = (char *)v14 + 1;
        }
        while (v12 != v14);
        id v12 = [v11 countByEnumeratingWithState:&v18 objects:v22 count:16];
      }
      while (v12);
    }

    pthread_mutex_unlock(p_listenerLock);
  }
  else
  {
    pthread_mutex_unlock(p_listenerLock);
  }
}

- (id)broadcastAttemptQueueFromPriority:(int64_t)a3
{
  switch(a3)
  {
    case 100:
      p_syncQueuedBroadcastAttempts = &self->_syncQueuedBroadcastAttempts;
      syncQueuedBroadcastAttempts = self->_syncQueuedBroadcastAttempts;
      if (!syncQueuedBroadcastAttempts) {
        goto LABEL_5;
      }
      break;
    case 200:
      p_syncQueuedBroadcastAttempts = &self->_defaultQueuedBroadcastAttempts;
      syncQueuedBroadcastAttempts = self->_defaultQueuedBroadcastAttempts;
      if (!syncQueuedBroadcastAttempts) {
        goto LABEL_5;
      }
      break;
    case 300:
      p_syncQueuedBroadcastAttempts = &self->_urgentQueuedBroadcastAttempts;
      syncQueuedBroadcastAttempts = self->_urgentQueuedBroadcastAttempts;
      if (syncQueuedBroadcastAttempts) {
        break;
      }
      goto LABEL_5;
    default:
      p_syncQueuedBroadcastAttempts = &self->_queuedBroadcastAttempts;
      syncQueuedBroadcastAttempts = self->_queuedBroadcastAttempts;
      if (!syncQueuedBroadcastAttempts)
      {
LABEL_5:
        CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        id v6 = *p_syncQueuedBroadcastAttempts;
        *p_syncQueuedBroadcastAttempts = (NSMutableDictionary *)Mutable;

        syncQueuedBroadcastAttempts = *p_syncQueuedBroadcastAttempts;
      }
      break;
  }

  return syncQueuedBroadcastAttempts;
}

- (void)validateListenerForLocalObject:(id)a3 andPerformBlock:(id)a4
{
  id v6 = a3;
  v7 = (void (**)(id, id))a4;
  if (self->_isHardReset)
  {
    v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Daemon was hard reset, ignoring incoming request", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  else if (v6)
  {
    p_listenerLock = &self->_listenerLock;
    pthread_mutex_lock(&self->_listenerLock);
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id v10 = self->_listeners;
    id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
    if (v11)
    {
      uint64_t v12 = *(void *)v21;
LABEL_10:
      uint64_t v13 = 0;
      while (1)
      {
        if (*(void *)v21 != v12) {
          objc_enumerationMutation(v10);
        }
        uint64_t v14 = *(void **)(*((void *)&v20 + 1) + 8 * v13);
        id v15 = [v14 localObject];
        BOOL v16 = v15 == v6;

        if (v16) {
          break;
        }
        if (v11 == (id)++v13)
        {
          id v11 = [(NSMutableArray *)v10 countByEnumeratingWithState:&v20 objects:v26 count:16];
          if (v11) {
            goto LABEL_10;
          }
          goto LABEL_16;
        }
      }
      id v17 = v14;

      if (!v17) {
        goto LABEL_19;
      }
      v7[2](v7, v17);
    }
    else
    {
LABEL_16:

LABEL_19:
      long long v18 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v6;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "No listener found for local object: %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
      id v17 = 0;
    }
    pthread_mutex_unlock(p_listenerLock);
  }
  else
  {
    long long v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "** Empty local object passed in for listener check", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)refreshBundleIDs
{
  id v3 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  long long v20 = 0u;
  BOOL v4 = self->_listeners;
  id v5 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v18;
    do
    {
      v8 = 0;
      do
      {
        if (*(void *)v18 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v17 + 1) + 8 * (void)v8) bundleID];
        [v3 addObject:v9];

        v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [(NSMutableArray *)v4 countByEnumeratingWithState:&v17 objects:v21 count:16];
    }
    while (v6);
  }

  id v10 = +[NSPredicate predicateWithBlock:&stru_100983440];
  id v11 = [v3 filteredArrayUsingPredicate:v10];

  if (v11)
  {
    id location = (id)0xAAAAAAAAAAAAAAAALL;
    objc_initWeak(&location, self);
    internalQueue = self->_internalQueue;
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_100004AB0;
    block[3] = &unk_100981968;
    objc_copyWeak(&v15, &location);
    id v14 = v11;
    dispatch_async(internalQueue, block);

    objc_destroyWeak(&v15);
    objc_destroyWeak(&location);
  }
}

- (id)_newSetupInfoWithContext:(id)a3
{
  id v97 = a3;
  im_assert_primary_base_queue();
  id v3 = +[IMRGLog timing];
  BOOL v4 = os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT);

  if (v4)
  {
    id v5 = [v97 objectForKey:@"agentRequested"];
    if (v5)
    {
      id v6 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v7 = +[NSDate date];
        [v7 timeIntervalSinceDate:v5];
        *(_DWORD *)buf = 134217984;
        v158 = v8;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IDSAgent took %f seconds to launch", buf, 0xCu);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v9 = +[NSDate date];
        [v9 timeIntervalSinceDate:v5];
        uint64_t v95 = v10;
        _IDSLogV();
      }
    }
  }
  id v99 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:6];
  id v11 = [(IDSDaemon *)self serviceController];
  v120 = [v11 allServices];

  id v123 = [v120 count];
  id v108 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v123];
  id v107 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v123];
  id v136 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v123];
  id v105 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v123];
  id v109 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v123];
  id v118 = objc_alloc_init((Class)NSMutableArray);
  id v122 = objc_alloc_init((Class)NSMutableArray);
  long long v151 = 0u;
  long long v152 = 0u;
  long long v149 = 0u;
  long long v150 = 0u;
  uint64_t v12 = +[IDSPairingManager sharedInstance];
  id obj = [v12 allPairedDevicesWithType:1];

  id v132 = [obj countByEnumeratingWithState:&v149 objects:v156 count:16];
  if (v132)
  {
    uint64_t v130 = *(void *)v150;
    uint64_t v134 = IDSDevicePropertyIdentities;
    uint64_t v128 = IDSDeviceDefaultPairedDeviceUniqueID;
    do
    {
      for (i = 0; i != v132; i = (char *)i + 1)
      {
        if (*(void *)v150 != v130) {
          objc_enumerationMutation(obj);
        }
        id v14 = *(void **)(*((void *)&v149 + 1) + 8 * i);
        BOOL v16 = [v14 localIdentities];
        long long v17 = [v14 iCloudIdentities];
        long long v18 = [v14 dictionaryRepresentation];
        id v19 = [v18 mutableCopy];

        [v19 setObject:v16 forKey:v134];
        long long v20 = [v14 dictionaryRepresentation];
        id v21 = [v20 mutableCopy];

        [v21 setObject:v17 forKey:v134];
        long long v22 = [v14 uniqueID];
        if (v22)
        {
          long long v23 = [v14 uniqueID];
          unsigned __int8 v24 = [v23 isEqualToString:v128];

          if ((v24 & 1) == 0) {
            [v118 addObject:v19];
          }
        }
        id v25 = objc_msgSend(v14, "pushToken", v95);
        if (v25)
        {
          BOOL v26 = [v17 count] == 0;

          if (!v26) {
            [v122 addObject:v21];
          }
        }
      }
      id v132 = [obj countByEnumeratingWithState:&v149 objects:v156 count:16];
    }
    while (v132);
  }

  id v106 = objc_alloc_init((Class)NSMutableDictionary);
  id v104 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v123];
  id v103 = [objc_alloc((Class)NSMutableDictionary) initWithCapacity:v123];
  id v133 = objc_alloc_init((Class)NSMutableSet);
  v27 = [(IDSDaemon *)self familyManager];
  v28 = [v27 familyHandles];
  id v98 = [v28 copy];

  id v102 = objc_alloc_init((Class)NSMutableSet);
  id v101 = objc_alloc_init((Class)NSMutableDictionary);
  id v100 = objc_alloc_init((Class)NSMutableDictionary);
  long long v147 = 0u;
  long long v148 = 0u;
  long long v145 = 0u;
  long long v146 = 0u;
  v29 = [(IDSDaemon *)self familyManager];
  v30 = [v29 familyMembers];

  id v31 = [v30 countByEnumeratingWithState:&v145 objects:v155 count:16];
  if (v31)
  {
    uint64_t v32 = *(void *)v146;
    do
    {
      for (j = 0; j != v31; j = (char *)j + 1)
      {
        if (*(void *)v146 != v32) {
          objc_enumerationMutation(v30);
        }
        v34 = *(void **)(*((void *)&v145 + 1) + 8 * (void)j);
        v36 = [v34 dictionaryRepresentation];
        [v133 addObject:v36];
      }
      id v31 = [v30 countByEnumeratingWithState:&v145 objects:v155 count:16];
    }
    while (v31);
  }

  [v106 setObject:v98 forKey:IDSFamilyHandlesKey];
  [v106 setObject:v133 forKey:IDSFamilyMembersKey];
  long long v143 = 0u;
  long long v144 = 0u;
  long long v141 = 0u;
  long long v142 = 0u;
  id v110 = v120;
  id v116 = [v110 countByEnumeratingWithState:&v141 objects:v154 count:16];
  if (v116)
  {
    id v111 = 0;
    uint64_t v115 = *(void *)v142;
    uint64_t v114 = kIDSRegistrationEntitlement;
    uint64_t v113 = kIDSMessagingEntitlement;
    uint64_t v112 = kIDSSessionEntitlement;
    do
    {
      for (k = 0; k != v116; k = (char *)k + 1)
      {
        if (*(void *)v142 != v115) {
          objc_enumerationMutation(v110);
        }
        v131 = *(void **)(*((void *)&v141 + 1) + 8 * (void)k);
        id obja = [(NSMutableArray *)self->_listeners lastObject];
        v129 = [v131 identifier];
        unsigned int v119 = [(IDSDaemon *)self client:obja isEntitledToAccessService:v129 forEntitlement:v114 shouldWarn:0];
        unsigned int v121 = [(IDSDaemon *)self client:obja isEntitledToAccessService:v129 forEntitlement:v113 shouldWarn:0];
        if ((v119 | v121 | [(IDSDaemon *)self client:obja isEntitledToAccessService:v129 forEntitlement:v112 shouldWarn:0]) == 1)
        {
          v37 = +[IDSDAccountController sharedInstance];
          v38 = [v37 accountsOnService:v131];

          id v39 = [v38 count];
          id v40 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v39];
          id v135 = [objc_alloc((Class)NSMutableArray) initWithCapacity:v39];
          long long v139 = 0u;
          long long v140 = 0u;
          long long v137 = 0u;
          long long v138 = 0u;
          id v41 = v38;
          id v42 = [v41 countByEnumeratingWithState:&v137 objects:v153 count:16];
          if (v42)
          {
            uint64_t v43 = *(void *)v138;
            do
            {
              for (m = 0; m != v42; m = (char *)m + 1)
              {
                if (*(void *)v138 != v43) {
                  objc_enumerationMutation(v41);
                }
                v45 = *(void **)(*((void *)&v137 + 1) + 8 * (void)m);
                long long v47 = [v45 accountSetupInfo];
                [v40 addObject:v47];

                long long v48 = +[IDSDAccountController sharedInstance];
                long long v49 = [v45 uniqueID];
                unsigned int v50 = [v48 isEnabledAccount:v49];

                if (v50)
                {
                  v51 = [v45 uniqueID];
                  [v135 addObject:v51];
                }
                v52 = objc_msgSend(v45, "dependentRegistrations", v95);
                id v53 = [v52 mutableCopy];

                if ([v53 count])
                {
                  id v54 = [v45 uniqueID];
                  [v136 setObject:v53 forKey:v54];
                }
              }
              id v42 = [v41 countByEnumeratingWithState:&v137 objects:v153 count:16];
            }
            while (v42);
          }

          if ([v131 wantsTinkerDevices])
          {
            if ([v131 adHocServiceType] == 2) {
              __int16 v55 = v118;
            }
            else {
              __int16 v55 = v122;
            }
            id v56 = objc_msgSend(v55, "copy", v95);
            [v105 setObject:v56 forKey:v129];
          }
          if (objc_msgSend(v131, "isFamilyService", v95))
          {
            id v57 = [v106 copy];
            [v104 setObject:v57 forKey:v129];

            id v58 = [v102 copy];
            [v103 setObject:v58 forKey:v129];
          }
          if (v121)
          {
            v59 = +[IDSDeliveryController sharedInstance];
            id v60 = objc_msgSend(v59, "effectiveMaxPayloadSizeIfCanUseLargePayload:", objc_msgSend(v131, "canUseLargePayload"));

            v61 = +[NSNumber numberWithInteger:v60];
            [v109 setObject:v61 forKey:v129];
          }
          else
          {
            [v109 setObject:&off_1009D1110 forKey:v129];
          }
          if (v119)
          {
            v62 = +[IDSRestrictions sharedInstance];
            id v63 = [v62 restrictionReasonForService:v131];

            if (!v111) {
              id v111 = objc_alloc_init((Class)NSMutableDictionary);
            }
            v64 = +[NSNumber numberWithUnsignedInteger:v63];
            [v111 setObject:v64 forKey:v129];
          }
          v65 = [v131 identifier];
          [v108 setObject:v40 forKey:v65];

          v66 = [v131 identifier];
          [v107 setObject:v135 forKey:v66];

          if ([v131 isInvitationService])
          {
            invitationStore = self->_invitationStore;
            v68 = [v131 identifier];
            v69 = [(IDSInvitationStore *)invitationStore persistedPendingInvitationsForService:v68];

            if (v69)
            {
              v70 = [v131 identifier];
              [v101 setObject:v69 forKey:v70];
            }
            v71 = self->_invitationStore;
            v72 = [v131 identifier];
            v73 = [(IDSInvitationStore *)v71 persistedReceivedInvitationsForService:v72];

            if (v73)
            {
              v74 = [v131 identifier];
              [v100 setObject:v73 forKey:v74];
            }
          }
        }
      }
      id v116 = [v110 countByEnumeratingWithState:&v141 objects:v154 count:16];
    }
    while (v116);
  }
  else
  {
    id v111 = 0;
  }

  v76 = +[IMRGLog registration];
  if (os_log_type_enabled(v76, OS_LOG_TYPE_DEBUG)) {
    sub_100712470();
  }

  [v99 setObject:v108 forKey:@"serviceInfo"];
  v77 = +[IMRGLog registration];
  if (os_log_type_enabled(v77, OS_LOG_TYPE_DEBUG)) {
    sub_100712408();
  }

  [v99 setObject:v107 forKey:@"enabledAccountsInfo"];
  v78 = +[IMRGLog registration];
  if (os_log_type_enabled(v78, OS_LOG_TYPE_DEBUG)) {
    sub_1007123A0();
  }

  [v99 setObject:v136 forKey:@"dependentDevices"];
  v79 = +[IMRGLog registration];
  if (os_log_type_enabled(v79, OS_LOG_TYPE_DEBUG)) {
    sub_100712338();
  }

  [v99 setObject:v105 forKey:@"linkedDevices"];
  v80 = +[IMRGLog registration];
  if (os_log_type_enabled(v80, OS_LOG_TYPE_DEBUG)) {
    sub_1007122D0();
  }

  [v99 setObject:v104 forKey:@"familyInfo"];
  v81 = +[IMRGLog registration];
  if (os_log_type_enabled(v81, OS_LOG_TYPE_DEBUG)) {
    sub_100712268();
  }

  [v99 setObject:v103 forKey:@"familyDevices"];
  v82 = +[IMRGLog registration];
  if (os_log_type_enabled(v82, OS_LOG_TYPE_DEBUG)) {
    sub_100712200();
  }

  [v99 setObject:v109 forKey:@"maxMessageSizes"];
  v83 = +[IMRGLog registration];
  if (os_log_type_enabled(v83, OS_LOG_TYPE_DEBUG)) {
    sub_100712198();
  }

  if (v111) {
    [v99 setObject:v111 forKey:@"restrictionReasons"];
  }
  v84 = +[IMRGLog registration];
  if (os_log_type_enabled(v84, OS_LOG_TYPE_DEBUG)) {
    sub_100712130();
  }

  [v99 setObject:v101 forKey:@"pendingInvitationMap"];
  v85 = +[IMRGLog registration];
  if (os_log_type_enabled(v85, OS_LOG_TYPE_DEBUG)) {
    sub_1007120C8();
  }

  [v99 setObject:v100 forKey:@"receivedInvitationMap"];
  v86 = IDSLoggableDescriptionSalt();
  [v99 setObject:v86 forKey:@"privateLoggingHash"];

  v87 = +[NSNumber numberWithInteger:sub_10000C7A0()];
  [v99 setObject:v87 forKey:@"maxIMLSize"];

  v88 = +[IDSCurrentDevice sharedInstance];
  v89 = [v88 deviceIdentifier];

  if (v89) {
    [v99 setObject:v89 forKey:@"deviceIdentifier"];
  }

  v90 = +[IDSPairingManager sharedInstance];
  v91 = [v90 pairedDeviceUniqueID];

  v92 = +[IMRGLog registration];
  if (os_log_type_enabled(v92, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    v158 = v91;
    _os_log_impl((void *)&_mh_execute_header, v92, OS_LOG_TYPE_DEFAULT, "Active device uniqueID: %@", buf, 0xCu);
  }

  if (v91) {
    [v99 setObject:v91 forKey:@"activeDeviceUniqueID"];
  }

  id v93 = v99;

  return v93;
}

- (BOOL)client:(id)a3 isEntitledToAccessService:(id)a4 forEntitlement:(id)a5 shouldWarn:(BOOL)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v12 = [v8 entitlements];
  if ([v12 hasAnyEntitlements]) {
    unsigned __int8 v13 = [v12 hasService:v9 forEntitlement:v10];
  }
  else {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (id)familyManager
{
  return +[IDSFamilyManager sharedInstance];
}

- (BOOL)_setupListenerConnection:(id)a3 listenerID:(id)a4 pid:(int)a5 setupInfo:(id)a6 entitlements:(id)a7 setupCompletionBlock:(id)a8
{
  uint64_t v11 = *(void *)&a5;
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v78 = a7;
  v77 = (void (**)(id, id, id))a8;
  im_assert_primary_base_queue();
  v79 = v14;
  if (!v14)
  {
    id v21 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v81 = v15;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Tried to set up listener (ID: %@) with empty listener port", buf, 0xCu);
    }

    if (!os_log_shim_legacy_logging_enabled()) {
      goto LABEL_14;
    }
LABEL_13:
    _IDSWarnV();
    _IDSLogV();
    _IDSLogTransport();
LABEL_14:
    BOOL v75 = 0;
    goto LABEL_62;
  }
  if (![v15 length])
  {
    long long v22 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      id v81 = v15;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "Tried to set up listener (port: %@) with empty ID", buf, 0xCu);
    }

    if (!os_log_shim_legacy_logging_enabled()) {
      goto LABEL_14;
    }
    goto LABEL_13;
  }
  [(IDSDaemon *)self _cleanupListenerWithPid:v11];
  id v17 = [objc_alloc((Class)IMLocalObject) initWithTarget:self connection:v14 protocol:&OBJC_PROTOCOL___IDSDaemonProtocol forceSecureCoding:1 offMainThread:_os_feature_enabled_impl()];
  BOOL v75 = v17 != 0;
  if (v17)
  {
    id v72 = [objc_alloc((Class)IMRemoteObject) initWithConnection:v14 protocol:&OBJC_PROTOCOL___IDSDaemonListenerProtocol alreadyConfigured:1 forceSecureCoding:1];
    [v72 setPid:v11];
    pthread_mutex_lock(&self->_listenerLock);
    id v68 = [(NSMutableSet *)self->_listenerCachedServices count];
    long long v18 = [v16 objectForKey:@"capabilities"];
    if (v18)
    {
      id v19 = [v16 objectForKey:@"capabilities"];
      id v20 = [v19 unsignedIntValue];
    }
    else
    {
      id v20 = 0;
    }

    long long v23 = [v16 objectForKey:@"services"];
    unsigned __int8 v24 = +[NSSet setWithArray:v23];
    id v25 = v24;
    if (v24)
    {
      id v71 = v24;
    }
    else
    {
      id v71 = +[NSSet set];
    }

    BOOL v26 = [v16 objectForKey:@"commands"];
    v27 = +[NSSet setWithArray:v26];
    v28 = v27;
    if (v27)
    {
      id v70 = v27;
    }
    else
    {
      id v70 = +[NSSet set];
    }

    id v29 = objc_alloc((Class)NSMutableSet);
    v30 = [v16 objectForKey:@"notificationServices"];
    id v31 = [v29 initWithArray:v30];
    uint64_t v32 = v31;
    if (v31)
    {
      id v73 = v31;
    }
    else
    {
      id v73 = +[NSMutableSet set];
    }

    uint64_t v33 = [v16 objectForKey:@"bundleID"];
    v34 = (void *)v33;
    v35 = &stru_10099BE78;
    if (v33) {
      v35 = (__CFString *)v33;
    }
    v36 = v35;

    BOOL v69 = [(__CFString *)v36 length] != 0;
    v74 = [[IDSIPCListener alloc] initWithRemoteObject:v72 localObject:v17 ID:v15 capabilities:v20 entitlements:v78 services:v71 notificationServices:v73 commands:v70 bundleID:v36];
    -[NSMutableArray addObject:](self->_listeners, "addObject:");
    if (!self->_listenerCachedServices)
    {
      v37 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      listenerCachedServices = self->_listenerCachedServices;
      self->_listenerCachedServices = v37;
    }
    if (v71 && ([v71 isSubsetOfSet:self->_listenerCachedServices] & 1) == 0) {
      [(NSMutableSet *)self->_listenerCachedServices unionSet:v71];
    }
    if (!self->_listenerCachedCommands)
    {
      id v39 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      listenerCachedCommands = self->_listenerCachedCommands;
      self->_listenerCachedCommands = v39;
    }
    if (v70 && ([v70 isSubsetOfSet:self->_listenerCachedCommands] & 1) == 0) {
      [(NSMutableSet *)self->_listenerCachedCommands unionSet:v70];
    }
    id v41 = [v16 objectForKey:@"processName"];
    [v17 setProcessName:v41];
    [v72 setProcessName:v41];
    id v42 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
    {
      id v43 = [v17 processName];
      v44 = [v17 connection];
      *(_DWORD *)buf = 138414082;
      id v81 = v15;
      __int16 v82 = 2112;
      v83 = v36;
      __int16 v84 = 2112;
      id v85 = v16;
      __int16 v86 = 2112;
      id v87 = v78;
      __int16 v88 = 1024;
      int v89 = v11;
      __int16 v90 = 2112;
      id v91 = v43;
      __int16 v92 = 2048;
      id v93 = v44;
      __int16 v94 = 2112;
      id v95 = v73;
      _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Setting up connection to listener ID: %@  bundle ID: %@  setupInfo %@ entitlements %@  pid: %d  name: %@  connection: %p notificationServices %@", buf, 0x4Eu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        v45 = [v17 processName];
        v66 = [v17 connection];
        id v67 = v73;
        uint64_t v64 = v11;
        v65 = v45;
        id v62 = v16;
        id v63 = v78;
        id v60 = v15;
        v61 = v36;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          id v46 = objc_msgSend(v17, "processName", v15, v36, v16, v78, v11, v45, v66, v73);
          v66 = [v17 connection];
          id v67 = v73;
          uint64_t v64 = v11;
          v65 = v46;
          id v62 = v16;
          id v63 = v78;
          id v60 = v15;
          v61 = v36;
          _IDSLogV();
        }
      }
    }
    if (objc_msgSend(v15, "isEqualToIgnoringCase:", @"com.apple.healthd", v60, v61, v62, v63, v64, v65, v66, v67))
    {
      long long v47 = +[IMRGLog healthDebug];
      if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
      {
        id v48 = [v17 processName];
        long long v49 = [v17 connection];
        *(_DWORD *)buf = 138414082;
        id v81 = v15;
        __int16 v82 = 2112;
        v83 = v36;
        __int16 v84 = 2112;
        id v85 = v16;
        __int16 v86 = 2112;
        id v87 = v78;
        __int16 v88 = 1024;
        int v89 = v11;
        __int16 v90 = 2112;
        id v91 = v48;
        __int16 v92 = 2048;
        id v93 = v49;
        __int16 v94 = 2112;
        id v95 = v73;
        _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Setting up connection to listener ID: %@  bundle ID: %@  setupInfo %@ entitlements %@  pid: %d  name: %@  connection: %p notificationServices %@", buf, 0x4Eu);
      }
    }
    BOOL v50 = [(NSMutableArray *)self->_listeners indexOfObjectIdenticalTo:v74] != (id)0x7FFFFFFFFFFFFFFFLL;

    id v51 = [(NSMutableSet *)self->_listenerCachedServices count];
    if (v51 && v68 != v51)
    {
      [(IDSDaemon *)self updateTopics];
      [(IDSDaemon *)self _updatePushCommandsLocked];
    }
    id v52 = [v73 copy];
    if (v50)
    {
      id v53 = [v16 objectForKey:@"context"];
      id v54 = [(IDSDaemon *)self _newSetupInfoWithContext:v53];

      if (_IDSSupportsDirectMessaging())
      {
        id v55 = [(IDSDaemon *)self _copyDirectMessagingMetadataForRemoteObject:v74];
        if (v55)
        {
          id v56 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v54];
          [v56 addEntriesFromDictionary:v55];
        }
        else
        {
          id v56 = v54;
        }
      }
      else
      {
        id v56 = v54;
      }
      v77[2](v77, v56, v17);
    }
    if (v69) {
      [(IDSDaemon *)self refreshBundleIDs];
    }
    id v57 = +[NSNotificationCenter defaultCenter];
    [v57 addObserver:self selector:"localObjectDiedNotification:" name:IMLocalObjectDidDisconnectNotification object:v17];

    id v58 = +[NSNotificationCenter defaultCenter];
    [v58 addObserver:self selector:"remoteObjectDiedNotification:" name:IMRemoteObjectDidDisconnectNotification object:v72];

    pthread_mutex_unlock(&self->_listenerLock);
    [(IDSDaemon *)self _resetBroadcastQueuesForServices:v52];
    [(IDSDaemon *)self _flushBroadcastQueuesForServices:v52 existingServices:v52];
  }
LABEL_62:

  return v75;
}

- (void)_cleanupListenerWithPid:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  p_listenerLock = &self->_listenerLock;
  pthread_mutex_lock(&self->_listenerLock);
  id v6 = (char *)[(NSMutableArray *)self->_listeners count];
  if ((uint64_t)(v6 - 1) >= 0)
  {
    do
    {
      uint64_t v7 = [(NSMutableArray *)self->_listeners objectAtIndex:--v6];
      if (![v7 type])
      {
        id v8 = [v7 remoteObject];
        if ([v8 pid] == v3)
        {
          id v9 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)buf = 138412546;
            unsigned __int8 v13 = v8;
            __int16 v14 = 1024;
            int v15 = v3;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Found existing listener %@ for pid %d, cleaning up", buf, 0x12u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v10 = v8;
            uint64_t v11 = v3;
            _IDSLogV();
          }
          -[IDSDaemon removeListenerWithRemoteXPCObject:](self, "removeListenerWithRemoteXPCObject:", v8, v10, v11);
          [v8 invalidate];
        }
      }
    }
    while ((uint64_t)v6 > 0);
  }
  pthread_mutex_unlock(p_listenerLock);
}

- (void)_flushBroadcastQueuesForServices:(id)a3 existingServices:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  im_assert_primary_base_queue();
  id v8 = [v7 mutableCopy];

  [v8 intersectSet:v6];
  if ([v8 count])
  {
    [(IDSDaemon *)self _processQueuedBroadcastsForServices:v8 priority:0 forceRetry:1];
    id v9 = +[IDSDaemonPriorityQueueController sharedInstance];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_100127CC0;
    v18[3] = &unk_10097E440;
    v18[4] = self;
    id v10 = v8;
    id v19 = v10;
    [v9 performBlockUrgentPriority:v18];

    uint64_t v11 = +[IDSDaemonPriorityQueueController sharedInstance];
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_100127CD4;
    v16[3] = &unk_10097E440;
    v16[4] = self;
    id v12 = v10;
    id v17 = v12;
    [v11 performBlockDefaultPriority:v16];

    unsigned __int8 v13 = +[IDSDaemonPriorityQueueController sharedInstance];
    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100127CE8;
    v14[3] = &unk_10097E440;
    v14[4] = self;
    id v15 = v12;
    [v13 performBlockSyncPriority:v14];
  }
}

- (BOOL)daemonInterface:(id)a3 shouldGrantAccessForPID:(int)a4 auditToken:(id *)a5 portName:(id)a6 listenerConnection:(id)a7 setupInfo:(id)a8 setupResponse:(id *)a9
{
  id v30 = a3;
  id v35 = a6;
  id v34 = a7;
  id v33 = a8;
  id v31 = objc_alloc((Class)NSArray);
  uint64_t v12 = kIDSTestToolEntitlement;
  uint64_t v13 = kIDSRegistrationEntitlement;
  id v14 = objc_msgSend(v31, "initWithObjects:", kIDSRegistrationEntitlement, kIDSMessagingEntitlement, kIDSSessionEntitlement, kIDSRegistrationResetEntitlement, kIDSiCloudSignInHackEntitlement, kIDSEncryptionKeysEntitlement, kIDSHighPriorityMessagingEntitlement, kIDSUrgentPriorityMessagingEntitlement, kIDSContinuityEntitlement, kIDSSelfSessionEntitlement, kIDSDeviceUUIDEntitlement, kIDSSessionPrivateEntitlement, kIDSBypassSizeCheckEntitlement, kIDSPreferInfraWiFiEntitlement, kIDSLinkPreferencesEntitlement, kIDSLocalPairingEntitlement, kIDSLocalPairingAPIEntitlement,
          kIDSAccountSyncEntitlement,
          kIDSAllowedTrafficClasses,
          kIDSKeyRollingEntitlement,
          kIDSReportiMessageSpamEntitlement,
          kIDSForceEncryptionOffEntitlement,
          kIDSSubServicesEntitlement,
          kIDSAppleCareServicesEntitlement,
          kIDSRegistrationControlEntitlement,
          kIDSPhoneNumberAuthenticationEntitlement,
          kIDSPhoneNumberAuthenticationPrivateEntitlement,
          kIDSTestToolEntitlement,
          kIDSStateResetEntitlement,
          kIDSReportSpamEntitlement,
          kIDSStatusKitPublishingForStatusTypeEntitlement,
          kIDSStatusKitSubscriptionForStatusTypeEntitlement,
          kIDSStatusKitPublishingForAllStatusTypeEntitlement,
          kIDSStatusKitSubscriptionForAllStatusTypeEntitlement,
          kIDSForceQuerySendParameterEntitlement,
          0);
  id v15 = (id)IMDAuditTokenTaskCopyValuesForEntitlements();
  if (!v15) {
    id v15 = objc_alloc_init((Class)NSDictionary);
  }
  id v16 = [v15 objectForKey:v12];
  unsigned __int8 v17 = [v16 BOOLValue];

  if (v17) {
    goto LABEL_4;
  }
  if (([v35 isEqualToIgnoringCase:@"com.apple.purplebuddy"] & 1) != 0
    || [v35 isEqualToIgnoringCase:@"com.apple.SetupAssistant"])
  {
    id v18 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v15];
    [v18 removeObjectForKey:v13];
    id v24 = objc_msgSend(objc_alloc((Class)NSMutableArray), "initWithObjects:", @"com.apple.ess", @"com.apple.madrid", 0);
    [v18 setObject:v24 forKey:v13];

    goto LABEL_13;
  }
  if ([v35 isEqualToIgnoringCase:@"com.apple.Preferences"]
    && IDSDebuggingRegistrationDebuggingEnabled())
  {
LABEL_4:
    id v18 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v15];
    [v18 removeObjectForKey:v13];
    id v19 = [(IDSDaemon *)self serviceController];
    id v20 = [v19 allServicesStrings];
    [v18 setObject:v20 forKey:v13];

    id v21 = +[IMRGLog registration];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
    {
      long long v22 = [(IDSDaemon *)self serviceController];
      long long v23 = [v22 allServicesStrings];
      *(_DWORD *)buf = 138412546;
      *(void *)&uint8_t buf[4] = v35;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v23;
      _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Entitling portName %@ for all services %@", buf, 0x16u);
    }
  }
  else
  {
    id v18 = v15;
  }
LABEL_13:
  id v25 = [[IDSEntitlements alloc] initWithEntitlements:v18];
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  long long v49 = sub_10012BB60;
  BOOL v50 = sub_10012BB70;
  id v51 = 0;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_10000C790;
  v37[3] = &unk_100983400;
  v37[4] = buf;
  BOOL v26 = [(IDSDaemon *)self _setupListenerConnection:v34 listenerID:v35 pid:a4 setupInfo:v33 entitlements:v25 setupCompletionBlock:v37];
  *a9 = (id)IMCreateXPCObjectFromDictionary();
  v27 = +[IMIDSLog daemon_oversized];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    v28 = [(IDSEntitlements *)v25 dictionaryRepresentation];
    *(_DWORD *)v38 = 67110146;
    BOOL v39 = v26;
    __int16 v40 = 2112;
    id v41 = v35;
    __int16 v42 = 1024;
    int v43 = a4;
    __int16 v44 = 2112;
    id v45 = v18;
    __int16 v46 = 2112;
    long long v47 = v28;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Granting access %d to listener: %@ pid: %d usingSync: YES givenEntitlements: %@ parsedEntitlements: %@", v38, 0x2Cu);
  }
  _Block_object_dispose(buf, 8);

  return v26;
}

- (id)serviceController
{
  return +[IDSDServiceController sharedInstance];
}

- (void)setListenerServices:(id)a3 commands:(id)a4 capabilities:(unsigned int)a5 messageContext:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  uint64_t v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412802;
    *(void *)&uint8_t buf[4] = v10;
    *(_WORD *)&buf[12] = 2112;
    *(void *)&buf[14] = v11;
    *(_WORD *)&buf[22] = 1024;
    LODWORD(v41) = v7;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEBUG, "Incoming listener services %@ commands %@ caps %d", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v18 = v11;
    uint64_t v19 = v7;
    id v17 = v10;
    _IDSLogV();
  }
  *(void *)buf = 0;
  *(void *)&buf[8] = buf;
  *(void *)&buf[16] = 0x3032000000;
  id v41 = sub_10012BB60;
  __int16 v42 = sub_10012BB70;
  id v43 = 0;
  uint64_t v34 = 0;
  id v35 = &v34;
  uint64_t v36 = 0x3032000000;
  v37 = sub_10012BB60;
  v38 = sub_10012BB70;
  id v39 = 0;
  uint64_t v28 = 0;
  id v29 = &v28;
  uint64_t v30 = 0x3032000000;
  id v31 = sub_10012BB60;
  uint64_t v32 = sub_10012BB70;
  id v33 = 0;
  id v14 = objc_msgSend(v12, "localObject", v17, v18, v19);
  v20[0] = _NSConcreteStackBlock;
  v20[1] = 3221225472;
  v20[2] = sub_1000076FC;
  v20[3] = &unk_100983468;
  id v15 = v10;
  id v21 = v15;
  id v24 = buf;
  id v25 = &v34;
  BOOL v26 = &v28;
  id v16 = v11;
  int v27 = v7;
  id v22 = v16;
  long long v23 = self;
  [(IDSDaemon *)self validateListenerForLocalObject:v14 andPerformBlock:v20];

  [(IDSDaemon *)self _flushBroadcastQueuesForServices:v35[5] existingServices:v29[5]];
  _Block_object_dispose(&v28, 8);

  _Block_object_dispose(&v34, 8);
  _Block_object_dispose(buf, 8);
}

- (void)_resetBroadcastQueuesForServices:(id)a3
{
  id v4 = a3;
  [(IDSDaemon *)self _resetQueuedBroadcastsForServices:v4 priority:0];
  id v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_10000C780;
  v15[3] = &unk_10097E440;
  v15[4] = self;
  id v6 = v4;
  id v16 = v6;
  [v5 performBlockUrgentPriority:v15];

  uint64_t v7 = +[IDSDaemonPriorityQueueController sharedInstance];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10000C770;
  v13[3] = &unk_10097E440;
  v13[4] = self;
  id v8 = v6;
  id v14 = v8;
  [v7 performBlockDefaultPriority:v13];

  id v9 = +[IDSDaemonPriorityQueueController sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_10000C760;
  v11[3] = &unk_10097E440;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 performBlockSyncPriority:v11];
}

- (void)setupRealtimeEncryptionController:(id)a3 forAccountWithID:(id)a4 messageContext:(id)a5
{
  uint64_t v7 = (__CFString *)a3;
  id v8 = a4;
  id v28 = a5;
  id v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    CFStringRef v30 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "setting up the realtime encryption controller for the unique ID: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v25 = v7;
    _IDSLogV();
  }
  id v10 = +[IDSGroupEncryptionController sharedInstance];
  if (!v10)
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      CFStringRef v30 = @"IDSDaemon";
      __int16 v31 = 2112;
      uint64_t v32 = v7;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ - Could not initialize the realtime encryption controller for the unique ID: %@, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      CFStringRef v26 = @"IDSDaemon";
      int v27 = v7;
      _IDSLogTransport();
    }
  }
  id v12 = +[IDSDAccountController sharedInstance];
  uint64_t v13 = [v12 accountWithUniqueID:v8];

  id v14 = [v13 primaryRegistration];
  id v15 = [v14 pushToken];
  id v16 = [v13 service];
  id v17 = [v16 identifier];
  id v18 = +[IDSPushToken pushTokenWithData:v15 withServiceLoggingHint:v17];

  uint64_t v19 = [v13 prefixedURIStringsFromRegistration];
  id v20 = [v19 firstObject];
  id v21 = [v13 service];
  id v22 = [v21 identifier];
  long long v23 = +[IDSURI URIWithPrefixedURI:v20 withServiceLoggingHint:v22];
  [v10 setAccount:v8 fromURI:v23 forGroup:v7];

  id v24 = [v10 createRealTimeEncryptionFullIdentityForDevice:v18 completionBlock:0];
}

- (void)sendRealTimeMediaPrekey:(id)a3 toGroup:(id)a4 messageContext:(id)a5
{
  uint64_t v7 = (__CFString *)a3;
  id v8 = (__CFString *)a4;
  id v9 = a5;
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v24 = v7;
    __int16 v25 = 2112;
    CFStringRef v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sending the device prekey for the unique ID: %@ to group: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v21 = v7;
    id v22 = v8;
    _IDSLogV();
  }
  id v11 = +[IDSGroupEncryptionController sharedInstance];
  if (v11)
  {
    id v12 = +[IDSDSessionController sharedInstance];
    uint64_t v13 = [v12 sessionWithUniqueID:v8];

    if (v13)
    {
      id v14 = [v13 destinations];
      id v15 = [v14 allObjects];
      id v16 = [v13 uniqueID];
      id v17 = [v13 destinationsLightweightStatus];
      [v11 setMembers:v15 forGroup:v8 sessionID:v16 lightweightStatusDict:v17];

      id v18 = [v13 uniqueID];
      [v11 sendPublicKeyToGroup:v8 sessionID:v18];
    }
    else
    {
      id v20 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v24 = @"IDSDaemon";
        __int16 v25 = 2112;
        CFStringRef v26 = v8;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@ - Could not find the session for the group: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
  }
  else
  {
    uint64_t v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v24 = @"IDSDaemon";
      __int16 v25 = 2112;
      CFStringRef v26 = v7;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@ - Could not get the realtime encryption controller for the unique ID: %@, failing to send the prekey to group %@...", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)requestPublicKeysForRealTimeEncryption:(id)a3 forAccountWithID:(id)a4 messageContext:(id)a5
{
  id v24 = a3;
  id v7 = a4;
  id v8 = a5;
  id v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "getting public keys for the real-time encryption...", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v10 = +[IDSGroupEncryptionController sharedInstance];
  if (v10)
  {
    id v11 = +[IDSDAccountController sharedInstance];
    id v12 = [v11 accountWithUniqueID:v7];

    id v13 = objc_alloc_init((Class)IMMessageContext);
    [v13 setShouldBoost:1];
    id v14 = +[IDSDaemon sharedInstance];
    id v15 = [v12 service];
    id v16 = [v15 pushTopic];
    id v17 = [v14 broadcasterForTopic:v16 entitlement:kIDSTestToolEntitlement command:0 messageContext:v13];

    id v18 = [v10 publicKeys];
    xpc_object_t v19 = xpc_dictionary_create(0, 0, 0);
    if (v19)
    {
      xpc_object_t v20 = xpc_int64_create(0);
      xpc_dictionary_set_value(v19, "object", v20);

      IMInsertBoolsToXPCDictionary();
      id v21 = +[NSMutableDictionary dictionary];
      CFDictionarySetValue(v21, @"object-type", @"public-keys");
      if (v18) {
        CFDictionarySetValue(v21, @"public-keys", v18);
      }
      id v23 = [(__CFDictionary *)v21 copy];
      IMInsertKeyedCodableObjectsToXPCDictionary();

      objc_msgSend(v17, "sendXPCObject:", v19, v23, 0);
    }
  }
  else
  {
    id v22 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412290;
      CFStringRef v26 = @"IDSDaemon";
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_ERROR, "%@ - Could not get the realtime encryption controller", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)sendRealTimeEncryptionMasterKeyMaterial:(id)a3 toGroup:(id)a4 messageContext:(id)a5
{
  id v7 = (__CFString *)a3;
  id v8 = (__CFString *)a4;
  id v9 = a5;
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v24 = v7;
    __int16 v25 = 2112;
    CFStringRef v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "sending the master key material for the unique ID: %@ to group: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v17 = v7;
    id v18 = v8;
    _IDSLogV();
  }
  id v11 = +[IDSGroupEncryptionController sharedInstance];
  if (v11)
  {
    id v12 = +[IDSDSessionController sharedInstance];
    id v13 = [v12 sessionWithUniqueID:v8];

    if (v13)
    {
      id v14 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000F950;
      block[3] = &unk_10097E418;
      id v20 = v11;
      id v21 = v8;
      id v22 = v13;
      dispatch_async(v14, block);
    }
    else
    {
      id v16 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v24 = @"IDSDaemon";
        __int16 v25 = 2112;
        CFStringRef v26 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@ - Could not find the session for the group: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
  }
  else
  {
    id v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v24 = @"IDSDaemon";
      __int16 v25 = 2112;
      CFStringRef v26 = v7;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@ - Could not get the realtime encryption controller for the unique ID: %@, failing to send the master key material to group: %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)sendRealTimeEncryptionMKMRecoveryRequest:(id)a3 toGroup:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = (__CFString *)a4;
  id v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v20 = v5;
    __int16 v21 = 2112;
    id v22 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "sending the master key material recovery request for the unique ID: %@ to group: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v14 = v5;
    id v15 = v6;
    _IDSLogV();
  }
  id v8 = +[IDSGroupEncryptionController sharedInstance];
  if (v8)
  {
    id v9 = +[IDSDSessionController sharedInstance];
    id v10 = [v9 sessionWithUniqueID:v6];

    if (v10)
    {
      id v11 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_10000FDB8;
      block[3] = &unk_10097E440;
      id v17 = v8;
      id v18 = v6;
      dispatch_async(v11, block);
    }
    else
    {
      id v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v20 = @"IDSDaemon";
        __int16 v21 = 2112;
        id v22 = v6;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ - Could not find the session for the group: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
  }
  else
  {
    id v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v20 = @"IDSDaemon";
      __int16 v21 = 2112;
      id v22 = v5;
      __int16 v23 = 2112;
      CFStringRef v24 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_ERROR, "%@ - Could not get the realtime encryption controller for the unique ID: %@, failing to send the master key material to group: %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)requestRealTimeEncryptionMasterKeyMaterial:(id)a3 forGroup:(id)a4 messageContext:(id)a5
{
  id v7 = (__CFString *)a3;
  id v8 = (__CFString *)a4;
  id v9 = a5;
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v24 = v7;
    __int16 v25 = 2112;
    CFStringRef v26 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Request the master key material(MKM) for unique ID: %@ group: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v17 = v7;
    id v18 = v8;
    _IDSLogV();
  }
  id v11 = +[IDSGroupEncryptionController sharedInstance];
  if (v11)
  {
    id v12 = +[IDSDSessionController sharedInstance];
    id v13 = [v12 sessionWithUniqueID:v8];

    if (v13)
    {
      id v14 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1000101F8;
      block[3] = &unk_10097E418;
      id v20 = v11;
      __int16 v21 = v8;
      id v22 = v13;
      dispatch_async(v14, block);
    }
    else
    {
      id v16 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v24 = @"IDSDaemon";
        __int16 v25 = 2112;
        CFStringRef v26 = v8;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@ - Could not find the session for the group: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
  }
  else
  {
    id v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v24 = @"IDSDaemon";
      __int16 v25 = 2112;
      CFStringRef v26 = v7;
      __int16 v27 = 2112;
      id v28 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@ - Could not get the realtime encryption controller for the unique ID: %@, failing to send the master key material to group: %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)resetRealTimeEncryptionKeys:(id)a3 forGroup:(id)a4 messageContext:(id)a5
{
  id v7 = (__CFString *)a3;
  id v8 = (__CFString *)a4;
  id v9 = a5;
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412546;
    CFStringRef v19 = v7;
    __int16 v20 = 2112;
    __int16 v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "resetting all keys for the unique ID: %@ group: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v16 = v7;
    id v17 = v8;
    _IDSLogV();
  }
  id v11 = +[IDSGroupEncryptionController sharedInstance];
  if (v11)
  {
    id v12 = +[IDSDSessionController sharedInstance];
    id v13 = [v12 sessionWithUniqueID:v8];

    if (v13)
    {
      [v11 resetKeysForGroup:v8 shouldRemoveCurrentParticipants:1];
    }
    else
    {
      id v15 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)buf = 138412546;
        CFStringRef v19 = @"IDSDaemon";
        __int16 v20 = 2112;
        __int16 v21 = v8;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@ - Could not find the session for the group: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
  }
  else
  {
    id v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412802;
      CFStringRef v19 = @"IDSDaemon";
      __int16 v20 = 2112;
      __int16 v21 = v7;
      __int16 v22 = 2112;
      __int16 v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ - Could not get the realtime encryption controller for the unique ID: %@, failing to send the master key material to group: %@", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (id)cloudRelayRegisteredAccountWithError:(id *)a3
{
  id v4 = +[IDSDAccountController sharedInstance];
  id v5 = +[IDSDServiceController sharedInstance];
  id v6 = [v5 serviceWithIdentifier:@"com.apple.private.alloy.multiplex1"];
  id v7 = [v4 appleIDAccountOnService:v6];

  if (v7 && ([v7 isRegistered] & 1) != 0)
  {
    id v8 = v7;
  }
  else if (a3)
  {
    id v9 = objc_alloc((Class)NSError);
    id v8 = 0;
    *a3 = [v9 initWithDomain:IDSSendErrorDomain code:2 userInfo:0];
  }
  else
  {
    id v8 = 0;
  }

  return v8;
}

- (void)homeKitGetServiceUserIDsWithMessageContext:(id)a3
{
  id v4 = a3;
  id v17 = 0;
  id v5 = [(IDSDaemon *)self cloudRelayRegisteredAccountWithError:&v17];
  id v6 = v17;
  if (v6)
  {
    id v7 = [v4 localObject];
    id v8 = [(IDSDaemon *)self broadcasterForLocalObject:v7 messageContext:v4];

    if (v8) {
      [v8 serviceUserIDs:0 error:v6];
    }
  }
  else
  {
    id v8 = [v5 registration];
    id v9 = objc_alloc_init(IDSHomeKitCloudRelayServiceUserIDsMessage);
    id v10 = +[IDSRegistrationKeyManager sharedInstance];
    -[IDSHomeKitCloudRelayServiceUserIDsMessage setIdentityPrivateKey:](v9, "setIdentityPrivateKey:", [v10 identityPrivateKey]);

    id v11 = [v8 registrationCert];
    [(IDSHomeKitCloudRelayServiceUserIDsMessage *)v9 setIDCertificate:v11];

    [(IDSHomeKitCloudRelayServiceUserIDsMessage *)v9 setSubService:@"com.apple.private.alloy.willow"];
    id v12 = [v8 dsHandle];
    [(IDSHomeKitCloudRelayServiceUserIDsMessage *)v9 setUserID:v12];

    id v13 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
    id v14 = [v13 pushToken];
    [(IDSHomeKitCloudRelayServiceUserIDsMessage *)v9 setPushToken:v14];

    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_10002B028;
    v15[3] = &unk_10097E9F8;
    v15[4] = self;
    id v16 = v4;
    [(IDSHomeKitCloudRelayServiceUserIDsMessage *)v9 setCompletionBlock:v15];
    [(FTMessageDelivery *)self->_homeKitMessageDelivery sendMessage:v9];
  }
}

- (void)homeKitGetAdminAccessTokensWithServiceUserID:(id)a3 accessoryID:(id)a4 pairingToken:(id)a5 messageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v30 = 0;
  id v14 = [(IDSDaemon *)self cloudRelayRegisteredAccountWithError:&v30];
  id v15 = v30;
  if (v15)
  {
    id v16 = [v13 localObject];
    id v17 = [(IDSDaemon *)self broadcasterForLocalObject:v16 messageContext:v13];

    if (v17) {
      [v17 adminAccessTokens:0 error:v15];
    }
  }
  else
  {
    id v17 = [v14 registration];
    id v18 = objc_alloc_init(IDSHomeKitCloudRelayAdminAccessTokenMessage);
    CFStringRef v19 = +[IDSRegistrationKeyManager sharedInstance];
    -[IDSHomeKitCloudRelayAdminAccessTokenMessage setIdentityPrivateKey:](v18, "setIdentityPrivateKey:", [v19 identityPrivateKey]);

    __int16 v20 = [v17 registrationCert];
    [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)v18 setIDCertificate:v20];

    [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)v18 setSubService:@"com.apple.private.alloy.willow"];
    [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)v18 setServiceUserID:v10];
    [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)v18 setAccessoryID:v11];
    [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)v18 setPairingToken:v12];
    __int16 v21 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
    [v21 pushToken];
    id v22 = v13;
    __int16 v23 = v14;
    id v24 = v12;
    id v25 = v11;
    v27 = id v26 = v10;
    [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)v18 setPushToken:v27];

    id v10 = v26;
    id v11 = v25;
    id v12 = v24;
    id v14 = v23;
    id v13 = v22;
    id v15 = 0;

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10002B45C;
    v28[3] = &unk_10097E9F8;
    v28[4] = self;
    id v29 = v13;
    [(IDSHomeKitCloudRelayAdminAccessTokenMessage *)v18 setCompletionBlock:v28];
    [(FTMessageDelivery *)self->_homeKitMessageDelivery sendMessage:v18];
  }
}

- (void)homeKitGetConsentTokensWithServiceUserID:(id)a3 accessoryIDs:(id)a4 adminID:(id)a5 messageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v30 = 0;
  id v14 = [(IDSDaemon *)self cloudRelayRegisteredAccountWithError:&v30];
  id v15 = v30;
  if (v15)
  {
    id v16 = [v13 localObject];
    id v17 = [(IDSDaemon *)self broadcasterForLocalObject:v16 messageContext:v13];

    if (v17) {
      [v17 consentTokens:0 error:v15];
    }
  }
  else
  {
    id v17 = [v14 registration];
    id v18 = objc_alloc_init(IDSHomeKitCloudRelayConsentTokensMessage);
    CFStringRef v19 = +[IDSRegistrationKeyManager sharedInstance];
    -[IDSHomeKitCloudRelayConsentTokensMessage setIdentityPrivateKey:](v18, "setIdentityPrivateKey:", [v19 identityPrivateKey]);

    __int16 v20 = [v17 registrationCert];
    [(IDSHomeKitCloudRelayConsentTokensMessage *)v18 setIDCertificate:v20];

    [(IDSHomeKitCloudRelayConsentTokensMessage *)v18 setSubService:@"com.apple.private.alloy.willow"];
    [(IDSHomeKitCloudRelayConsentTokensMessage *)v18 setServiceUserID:v10];
    [(IDSHomeKitCloudRelayConsentTokensMessage *)v18 setAdminID:v12];
    [(IDSHomeKitCloudRelayConsentTokensMessage *)v18 setAccessoryIDs:v11];
    __int16 v21 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
    [v21 pushToken];
    id v22 = v13;
    __int16 v23 = v14;
    id v24 = v12;
    id v25 = v11;
    v27 = id v26 = v10;
    [(IDSHomeKitCloudRelayConsentTokensMessage *)v18 setPushToken:v27];

    id v10 = v26;
    id v11 = v25;
    id v12 = v24;
    id v14 = v23;
    id v13 = v22;
    id v15 = 0;

    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10002B9B0;
    v28[3] = &unk_10097E9F8;
    v28[4] = self;
    id v29 = v13;
    [(IDSHomeKitCloudRelayConsentTokensMessage *)v18 setCompletionBlock:v28];
    [(FTMessageDelivery *)self->_homeKitMessageDelivery sendMessage:v18];
  }
}

- (void)homeKitGetUserAccessTokensWithServiceUserID:(id)a3 userID:(id)a4 userHandle:(id)a5 accessoryRequests:(id)a6 messageContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v32 = 0;
  id v17 = [(IDSDaemon *)self cloudRelayRegisteredAccountWithError:&v32];
  id v18 = v32;
  if (v18)
  {
    CFStringRef v19 = [v16 localObject];
    __int16 v20 = [(IDSDaemon *)self broadcasterForLocalObject:v19 messageContext:v16];

    if (v20) {
      [v20 userAccessTokens:0 error:v18];
    }
  }
  else
  {
    __int16 v20 = [v17 registration];
    __int16 v21 = objc_alloc_init(IDSHomeKitCloudRelayUserAccessTokensMessage);
    +[IDSRegistrationKeyManager sharedInstance];
    id v28 = v12;
    id v22 = v29 = v14;
    -[IDSHomeKitCloudRelayUserAccessTokensMessage setIdentityPrivateKey:](v21, "setIdentityPrivateKey:", [v22 identityPrivateKey]);

    __int16 v23 = [v20 registrationCert];
    [(IDSHomeKitCloudRelayUserAccessTokensMessage *)v21 setIDCertificate:v23];

    [(IDSHomeKitCloudRelayUserAccessTokensMessage *)v21 setSubService:@"com.apple.private.alloy.willow"];
    [(IDSHomeKitCloudRelayUserAccessTokensMessage *)v21 setServiceUserID:v28];
    [(IDSHomeKitCloudRelayUserAccessTokensMessage *)v21 setUserID:v13];
    [(IDSHomeKitCloudRelayUserAccessTokensMessage *)v21 setUserHandle:v14];
    id v24 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
    [v24 pushToken];
    id v25 = v15;
    v27 = id v26 = v13;
    [(IDSHomeKitCloudRelayUserAccessTokensMessage *)v21 setPushToken:v27];

    id v13 = v26;
    id v15 = v25;

    id v12 = v28;
    id v14 = v29;
    [(IDSHomeKitCloudRelayUserAccessTokensMessage *)v21 setAccessoryRequests:v15];
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_10002BDE4;
    v30[3] = &unk_10097E9F8;
    v30[4] = self;
    id v31 = v16;
    [(IDSHomeKitCloudRelayUserAccessTokensMessage *)v21 setCompletionBlock:v30];
    [(FTMessageDelivery *)self->_homeKitMessageDelivery sendMessage:v21];
  }
}

- (void)requestVMData:(id)a3 requestID:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 localObject];
  unsigned __int8 v12 = [(IDSDaemon *)self validateListenerForLocalObject:v11 andCheckEntitlement:kIDSVMEntitlement];

  if (v12)
  {
    id v13 = [[IDSVMRequest alloc] initWithDataRepresentation:v8];
    id v14 = v13;
    if (v13)
    {
      if ((id)[(IDSVMRequest *)v13 purpose] == (id)1)
      {
        id v15 = objc_alloc_init(IDSVMRegistrationResponse);
        id v16 = [(IDSVMRegistrationResponse *)v15 dataRepresentation];

        [(IDSDaemon *)self _respondToVMDataRequestWithData:v16 requestID:v9 error:0 messageContext:v10];
        goto LABEL_13;
      }
      id v18 = +[NSError errorWithDomain:IDSVMErrorDomain code:2 userInfo:0];
      CFStringRef v19 = +[IMRGLog vm];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT)) {
        goto LABEL_11;
      }
    }
    else
    {
      id v18 = +[NSError errorWithDomain:IDSVMErrorDomain code:2 userInfo:0];
      CFStringRef v19 = +[IMRGLog vm];
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
LABEL_11:
        int v20 = 138412546;
        id v21 = v9;
        __int16 v22 = 2112;
        __int16 v23 = v18;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "RequestID %@ client gave an unsupported request to the daemon. Returning error %@", (uint8_t *)&v20, 0x16u);
      }
    }

    [(IDSDaemon *)self _respondToVMDataRequestWithData:0 requestID:v9 error:v18 messageContext:v10];
    goto LABEL_13;
  }
  id v14 = +[NSError errorWithDomain:IDSVMErrorDomain code:1 userInfo:0];
  id v17 = +[IMRGLog vm];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    int v20 = 138412546;
    id v21 = v9;
    __int16 v22 = 2112;
    __int16 v23 = v14;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "RequestID %@ client is unentitled. Returning error %@", (uint8_t *)&v20, 0x16u);
  }

  [(IDSDaemon *)self _respondToVMDataRequestWithData:0 requestID:v9 error:v14 messageContext:v10];
LABEL_13:
}

- (void)_respondToVMDataRequestWithData:(id)a3 requestID:(id)a4 error:(id)a5 messageContext:(id)a6
{
  id v9 = a6;
  id v10 = a4;
  id v11 = a3;
  [v9 setReply:1];
  unsigned __int8 v12 = [v9 localObject];
  id v13 = [(IDSDaemon *)self broadcasterForLocalObject:v12 messageContext:v9];

  [v13 vmDataResponse:v11 forRequestID:v10 withError:0];
}

- (void)appleCareSignInUserName:(id)a3 DSID:(id)a4 authToken:(id)a5 requestID:(id)a6 messageContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = [v16 localObject];
  unsigned int v18 = [(IDSDaemon *)self validateListenerForLocalObject:v17 andCheckEntitlement:kIDSAppleCareServicesEntitlement];

  if (v18)
  {
    uint64_t v19 = [v13 _stripFZIDPrefix];

    int v20 = +[NSString stringWithFormat:@"D:%@", v19];
    id v21 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", v20, kIDSServiceDefaultsAuthorizationIDKey, v12, kIDSServiceDefaultsSelfHandleKey, 0);

    __int16 v22 = +[IDSDRegistrationListener sharedInstance];
    v26[0] = _NSConcreteStackBlock;
    v26[1] = 3221225472;
    v26[2] = sub_1000FB34C;
    v26[3] = &unk_1009823B0;
    v26[4] = self;
    id v27 = v15;
    id v28 = v16;
    id v23 = [v22 addBlockForRegistrationCompletion:v26];

    id v24 = [(IDSDaemon *)self registrationConductor];
    [v24 setShouldSupressRepairLogic:1];

    id v25 = [(IDSDaemon *)self signInResponder];
    [v25 iCloudSignInWithUsername:v12 authToken:v14 password:0 accountInfo:v21 accountStatus:0 handles:0];

    id v13 = (id)v19;
  }
}

- (void)appleCareSignOutUserWithRequestID:(id)a3 messageContext:(id)a4
{
  id v10 = a3;
  id v6 = a4;
  id v7 = [v6 localObject];
  unsigned int v8 = [(IDSDaemon *)self validateListenerForLocalObject:v7 andCheckEntitlement:kIDSAppleCareServicesEntitlement];

  if (v8)
  {
    id v9 = [(IDSDaemon *)self signInResponder];
    [v9 iCloudSignOut];

    [(IDSDaemon *)self _respondToAppleCareRequestID:v10 withMessageContext:v6 error:0];
  }
}

- (void)_respondToAppleCareRequestID:(id)a3 withMessageContext:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 localObject];
  id v11 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v10];

  [v11 applecareResponseForRequestID:v9 withError:v8];
}

- (void)reportSpamMessage:(id)a3 serviceIdentifier:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 localObject];
    *(_DWORD *)buf = 138412546;
    id v33 = v12;
    __int16 v34 = 2112;
    id v35 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Told to report spam with localObject %@ for service: %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v29 = [v10 localObject];
    id v30 = v9;
    _IDSLogV();
  }
  id v13 = objc_msgSend(v10, "localObject", v29, v30);
  unsigned __int8 v14 = [(IDSDaemon *)self validateListenerForLocalObject:v13 andCheckEntitlement:kIDSReportSpamEntitlement];

  if (v14)
  {
    if ([(IDSDaemon *)self _isSpamReportingV1ServerDisabled])
    {
      id v15 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "IDS Server reports that general spam reporting v1 is disabled.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
LABEL_12:
      }
        _IDSLogV();
    }
    else
    {
      id v17 = [v8 objectForKey:kIDSGeneralSpamReportRecipientURIKey];
      id v31 = [v17 _stripFZIDPrefix];
      unsigned int v18 = [v31 _bestGuessURI];

      id v19 = v9;
      int v20 = +[IDSDServiceController sharedInstance];
      id v21 = [v20 serviceWithIdentifier:v19];

      __int16 v22 = v19;
      if ([v21 adHocServiceType])
      {
        id v23 = +[IDSDServiceController sharedInstance];
        id v24 = objc_msgSend(v23, "primaryServiceForAdhocServiceType:", objc_msgSend(v21, "adHocServiceType"));

        __int16 v22 = [v24 identifier];
      }
      id v25 = [objc_alloc((Class)NSMutableDictionary) initWithDictionary:v8];
      [v25 setObject:v19 forKey:kIDSGeneralSpamReportSubServiceKey];
      [v25 setObject:v22 forKey:kIDSGeneralSpamReportTopLevelServiceKey];
      id v26 = +[IDSDAccountController sharedInstance];
      id v27 = [v26 accountWithServiceName:v19 aliasURI:v18];

      if (v27)
      {
        [v27 reportMessage:v25 toURI:v18];
      }
      else
      {
        id v28 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)buf = 138412546;
          id v33 = v19;
          __int16 v34 = 2112;
          id v35 = v18;
          _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Couldn't find account with alias for service {serviceIdentifier: %@, alias: %@}", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
  else
  {
    id v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Process not entitled to report spam", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      goto LABEL_12;
    }
  }
}

- (BOOL)_isSpamReportingV1ServerDisabled
{
  v2 = +[IDSServerBag sharedInstance];
  uint64_t v3 = [v2 objectForKey:@"ids-general-spam-report-v1-is-disabled"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v4 = [v3 BOOLValue];
    id v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v6 = @"NO";
      if (v4) {
        CFStringRef v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v9 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with v1 spam reporting value isDisabled: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  else
  {
    LOBYTE(v4) = 0;
  }

  return v4;
}

+ (id)sharedInstance
{
  if (qword_100A4A798 != -1) {
    dispatch_once(&qword_100A4A798, &stru_1009830F8);
  }
  v2 = (void *)qword_100A4A7A0;

  return v2;
}

- (IDSDaemon)init
{
  v10.receiver = self;
  v10.super_class = (Class)IDSDaemon;
  v2 = [(IDSDaemon *)&v10 init];
  uint64_t v3 = v2;
  if (v2)
  {
    unsigned int v4 = [(IDSDaemon *)v2 systemMonitor];
    unsigned int v5 = [v4 systemIsShuttingDown];

    if (!v5)
    {
      [(IDSDaemon *)v3 _performSetup];
      id v7 = v3;
      goto LABEL_9;
    }
    CFStringRef v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)CFStringRef v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_ERROR, "System is shutting down, not creating daemon", v9, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
  id v7 = 0;
LABEL_9:

  return v7;
}

- (void)_performSetup
{
  uint64_t v3 = [(IDSDaemon *)self pushHandlerForAPSDelegatePort];
  [v3 setShouldWaitToSetTopics:1];

  unsigned int v4 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v5 = +[FTDeviceSupport sharedInstance];
    id v6 = [v5 deviceInformationString];
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v6;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = geteuid();
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "identityservicesd launched (%@) user: %d", buf, 0x12u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v7 = +[FTDeviceSupport sharedInstance];
      v96 = [v7 deviceInformationString];
      uint64_t v98 = geteuid();
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        id v8 = +[FTDeviceSupport sharedInstance];
        v96 = [v8 deviceInformationString];
        uint64_t v98 = geteuid();
        _IDSLogV();
      }
    }
  }
  CFStringRef v9 = +[IMRGLog registration];
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    objc_super v10 = +[FTDeviceSupport sharedInstance];
    id v11 = [v10 deviceInformationString];
    uid_t v12 = geteuid();
    *(_DWORD *)buf = 138412546;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&buf[12] = 1024;
    *(_DWORD *)&buf[14] = v12;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "identityservicesd launched: (%@) user: %d", buf, 0x12u);
  }
  id v13 = +[IMLockdownManager sharedInstance];
  unsigned int v14 = [v13 isInternalInstall];

  if (v14)
  {
    id v15 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "Nov 10 2024";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "03:47:02";
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "    (build time %s %s)", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v97 = "Nov 10 2024";
        id v99 = "03:47:02";
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v97 = "Nov 10 2024";
          id v99 = "03:47:02";
          _IDSLogV();
        }
      }
    }
    id v16 = +[IMRGLog registration];
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 136315394;
      *(void *)&uint8_t buf[4] = "Nov 10 2024";
      *(_WORD *)&buf[12] = 2080;
      *(void *)&buf[14] = "03:47:02";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "    (build time %s %s)", buf, 0x16u);
    }
  }
  if (_os_feature_enabled_impl())
  {
    id v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "Opening up the grant MIG port", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    unsigned int v18 = [(IDSDaemon *)self daemonMIGInterface];
    [v18 setDelegate:self];
    [v18 acceptIncomingGrantRequests];
    if (IMGetDomainBoolForKeyWithDefaultValue()) {
      [v18 launchSim2HostServer];
    }
    id v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEBUG, "Opening up the NSXPC Interface", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v20 = [(IDSDaemon *)self daemonXPCInterface];
    id v21 = [(IDSDaemon *)self daemonMIGQueryInterface];
    [v21 setDelegate:self];
    [v21 acceptIncomingGrantRequests];
    __int16 v22 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Now accepting query grants, setup complete", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  id v23 = +[IMRGLog registration];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Loading services", buf, 2u);
  }

  id v24 = [(IDSDaemon *)self serviceController];
  id v25 = +[IMRGLog registration];
  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Done loading services", buf, 2u);
  }

  id v26 = +[IMRGLog registration];
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Bringing up capabilities", buf, 2u);
  }

  id v27 = [(IDSDaemon *)self daemonCapabilities];
  id v28 = +[IMRGLog registration];
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Bringing up restrictions", buf, 2u);
  }

  id v29 = [(IDSDaemon *)self restrictions];
  self->_deviceIsAsleep = 3;
  +[IMLocalObject _setExceptionHandlingDisabled:1];
  id v30 = (NSDate *)objc_alloc_init((Class)NSDate);
  birthDate = self->_birthDate;
  self->_birthDate = v30;

  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  id v32 = objc_alloc_init((Class)BKSApplicationStateMonitor);
  id stateMonitor = self->_stateMonitor;
  self->_id stateMonitor = v32;

  id v34 = self->_stateMonitor;
  v102[0] = _NSConcreteStackBlock;
  v102[1] = 3221225472;
  v102[2] = sub_100004E4C;
  v102[3] = &unk_100983120;
  objc_copyWeak(&v103, &location);
  [v34 setHandler:v102];
  id v35 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  uint64_t v36 = im_primary_base_queue();
  v37 = (OS_dispatch_queue *)dispatch_queue_create_with_target_V2("IDSDaemon internal queue", v35, v36);
  internalQueue = self->_internalQueue;
  self->_internalQueue = v37;

  id v39 = objc_alloc_init(IDSIPCBroadcaster);
  notifier = self->_notifier;
  self->_notifier = v39;

  memset(buf, 170, 16);
  pthread_mutexattr_init((pthread_mutexattr_t *)buf);
  pthread_mutexattr_settype((pthread_mutexattr_t *)buf, 2);
  pthread_mutex_init(&self->_listenerLock, (const pthread_mutexattr_t *)buf);
  pthread_mutexattr_destroy((pthread_mutexattr_t *)buf);
  id v41 = (NSMutableArray *)[objc_alloc((Class)NSMutableArray) initWithCapacity:2];
  listeners = self->_listeners;
  self->_listeners = v41;

  id v43 = objc_alloc((Class)IDSRateLimiter);
  __int16 v44 = +[IDSServerBag sharedInstanceForBagType:0];
  id v45 = [v44 objectForKey:@"reg-update-limit"];

  if (v45) {
    uint64_t v46 = (uint64_t)[v45 integerValue];
  }
  else {
    uint64_t v46 = 4;
  }

  long long v47 = +[IDSServerBag sharedInstanceForBagType:0];
  id v48 = [v47 objectForKey:@"reg-update-time-limit"];

  if (v48)
  {
    [v48 doubleValue];
    double v50 = v49;
  }
  else
  {
    double v50 = 3600.0;
  }

  id v51 = [v43 initWithLimit:v46 timeLimit:v50];
  id v52 = [IDSRegistrationHashProcessor alloc];
  id v53 = [(IDSDaemon *)self accountController];
  id v54 = +[IDSPeerIDManager sharedInstance];
  id v55 = +[IDSRegistrationKeyManager sharedInstance];
  id v56 = [(IDSRegistrationHashProcessor *)v52 initWithAccountController:v53 peerIDManager:v54 negativeRegistrationUpdateCache:v51 registrationKeyManager:v55];
  queryUpdateNotifier = self->_queryUpdateNotifier;
  self->_queryUpdateNotifier = v56;

  id v58 = NSHomeDirectory();
  v105[0] = v58;
  v105[1] = @"/Library/IdentityServices/";
  v59 = +[NSArray arrayWithObjects:v105 count:2];
  id v60 = +[NSURL fileURLWithPathComponents:v59];
  v61 = [v60 path];

  id v62 = [[IDSQuerySDPersistenceManager alloc] initWithFilePath:v61];
  persistenceManager = self->_persistenceManager;
  self->_persistenceManager = v62;

  if (_os_feature_enabled_impl())
  {
    uint64_t v64 = +[IDSPeerIDManager sharedInstance];
    [v64 setPersistenceManager:self->_persistenceManager];
  }
  if (_os_feature_enabled_impl())
  {
    v65 = [IDSSenderKeyDistributionManager alloc];
    v66 = [(IDSSenderKeyDistributionManager *)v65 initWithPersistenceManager:self->_persistenceManager service:IDSServiceNameiMessage];
    senderKeyDistributionManager = self->_senderKeyDistributionManager;
    self->_senderKeyDistributionManager = v66;

    id v68 = +[IDSDeliveryController sharedInstance];
    [v68 setSenderKeyDistributionManager:self->_senderKeyDistributionManager];
  }
  [(IDSRegistrationHashProcessor *)self->_queryUpdateNotifier setDelegate:self];
  BOOL v69 = objc_alloc_init(IDSCertifiedDeliveryReplayCommitter);
  replayStateCommitter = self->_replayStateCommitter;
  self->_replayStateCommitter = v69;

  id v71 = (FTMessageDelivery *)objc_alloc_init((Class)+[FTMessageDelivery HTTPMessageDeliveryClass]);
  homeKitMessageDelivery = self->_homeKitMessageDelivery;
  self->_homeKitMessageDelivery = v71;

  [(FTMessageDelivery *)self->_homeKitMessageDelivery setUserAgent:@"com.apple.homeKit-cloud-relay"];
  id v73 = self->_homeKitMessageDelivery;
  v74 = +[IDSRegistrationRequestTracker sharedInstance];
  [(FTMessageDelivery *)v73 addRequestObserver:v74];

  BOOL v75 = objc_alloc_init(IDSOpportunisticDeliveryController);
  opportunisticDeliveryController = self->_opportunisticDeliveryController;
  self->_opportunisticDeliveryController = v75;

  v77 = [(IDSDaemon *)self systemMonitor];
  [v77 setActive:1];

  id v78 = [(IDSDaemon *)self systemMonitor];
  [v78 setReceivesMemoryWarnings:1];

  v79 = [(IDSDaemon *)self systemMonitor];
  [v79 setUsesPowerNotifications:1];

  v80 = [(IDSDaemon *)self systemMonitor];
  [v80 setWatchesSystemLockState:1];

  id v81 = [(IDSDaemon *)self systemMonitor];
  [v81 addListener:self];

  __int16 v82 = [(IDSDaemon *)self systemMonitor];
  [v82 setWatchesDataProtectionLockState:1];

  id v83 = [(IDSDaemon *)self uTunController];
  pthread_mutex_init(&self->_localIncomingGUIDsLock, 0);
  pthread_mutex_init(&self->_incomingLocalPowerAssertionLock, 0);
  __int16 v84 = objc_alloc_init(IDSRegistrationConductor);
  registrationConductor = self->_registrationConductor;
  self->_registrationConductor = v84;

  [(IDSRegistrationConductor *)self->_registrationConductor setup];
  __int16 v86 = objc_alloc_init(IDSTransparentEndpointViewer);
  transparentEndpointViewer = self->_transparentEndpointViewer;
  self->_transparentEndpointViewer = v86;

  __int16 v88 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100125508;
  block[3] = &unk_10097E4D0;
  void block[4] = self;
  dispatch_async(v88, block);

  int v89 = +[IDSDaemonPriorityQueueController sharedInstance];
  __int16 v90 = [v89 queueForPriority:100];
  dispatch_source_t v91 = dispatch_source_create((dispatch_source_type_t)&_dispatch_source_type_timer, 0, 0, v90);
  __int16 v92 = (void *)qword_100A4A7A8;
  qword_100A4A7A8 = (uint64_t)v91;

  id v93 = qword_100A4A7A8;
  if (qword_100A4A7A8)
  {
    dispatch_time_t v94 = dispatch_time(0, 60000000000);
    dispatch_source_set_timer(v93, v94, 0x8BB2C97000uLL, 0x3B9ACA00uLL);
    handler[0] = _NSConcreteStackBlock;
    handler[1] = 3221225472;
    handler[2] = sub_10012641C;
    handler[3] = &unk_10097E4D0;
    handler[4] = self;
    dispatch_source_set_event_handler((dispatch_source_t)qword_100A4A7A8, handler);
    dispatch_resume((dispatch_object_t)qword_100A4A7A8);
  }
  id v95 = im_primary_queue();
  sub_1003319E8(&stru_1009831D8, @"IDS-Pref-List", (uint64_t)v95);

  objc_destroyWeak(&v103);
  objc_destroyWeak(&location);
}

- (void)_resetPreferences
{
  v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)unsigned int v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Resetting preferences to 0 for all services", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  uint64_t v3 = +[IDSLinkPreferencesManager sharedInstance];
  [v3 resetPreferencesForAllServices];

  unsigned int v4 = im_primary_queue();
  dispatch_async(v4, &stru_1009831F8);
}

- (void)_cleanupIncomingFilesDirectories
{
  uint64_t v3 = +[IDSSocketPairResourceTransferReceiver incomingFilePath];
  [(IDSDaemon *)self _cleanupIncomingFilesDirectory:v3];

  id v4 = +[IDSSocketPairResourceTransferReceiver modernIncomingFilePath];
  [(IDSDaemon *)self _cleanupIncomingFilesDirectory:v4];
}

- (void)_cleanupIncomingFilesDirectory:(id)a3
{
  double v3 = COERCE_DOUBLE(a3);
  ids_monotonic_time();
  double v5 = v4;
  id v6 = NSHomeDirectory();
  uint64_t v7 = +[NSArray arrayWithObjects:v6, @"/Library/IdentityServices/delete/", 0];
  double v8 = +[NSString pathWithComponents:v7];

  CFStringRef v9 = +[NSFileManager defaultManager];
  id v40 = 0;
  LOBYTE(v7) = [v9 createDirectoryAtPath:*(void *)&v8 withIntermediateDirectories:1 attributes:0 error:&v40];
  id v10 = v40;

  if ((v7 & 1) == 0)
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      double v42 = v8;
      __int16 v43 = 2112;
      id v44 = v10;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "Failed to create to-be-deleted directory %@ error %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
  uid_t v12 = StringGUID();
  id v13 = NSHomeDirectory();
  unsigned int v14 = +[NSArray arrayWithObjects:v13, @"/Library/IdentityServices/delete/", v12, 0];
  id v15 = +[NSString pathWithComponents:v14];

  id v16 = +[NSFileManager defaultManager];
  id v39 = 0;
  unsigned __int8 v17 = [v16 moveItemAtPath:*(void *)&v3 toPath:v15 error:&v39];
  id v18 = v39;

  if ((v17 & 1) == 0)
  {
    id v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      double v42 = v8;
      __int16 v43 = 2112;
      id v44 = v18;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "Failed to move incoming files to to-be-deleted directory %@ error %@ -- delete anyway", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    ids_monotonic_time();
    double v21 = v20;
    __int16 v22 = +[NSFileManager defaultManager];
    [v22 removeItemAtPath:*(void *)&v3 error:0];

    ids_monotonic_time();
    double v24 = v23;
    id v25 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 134217984;
      double v42 = v24 - v21;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Last resort file removal took %0.6lf seconds", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
  dispatch_time_t v26 = dispatch_time(0, 60000000000);
  id v27 = dispatch_get_global_queue(9, 0);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_100127228;
  block[3] = &unk_10097E4D0;
  id v28 = *(id *)&v8;
  id v38 = v28;
  dispatch_after(v26, v27, block);

  id v29 = +[NSFileManager defaultManager];
  id v36 = 0;
  unsigned __int8 v30 = [v29 createDirectoryAtPath:*(void *)&v3 withIntermediateDirectories:1 attributes:0 error:&v36];
  id v31 = v36;

  if ((v30 & 1) == 0)
  {
    id v32 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)buf = 138412546;
      double v42 = v3;
      __int16 v43 = 2112;
      id v44 = v31;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_ERROR, "Failed to create incoming files directory %@ error %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
  ids_monotonic_time();
  double v34 = v33;
  id v35 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 134217984;
    double v42 = v34 - v5;
    _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "IDS incoming files directory cleanup-on-init took %0.6lf seconds", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
}

- (void)releaseBroadcastAttemptQueue:(int64_t)a3
{
  switch(a3)
  {
    case 100:
      p_syncQueuedBroadcastAttempts = &self->_syncQueuedBroadcastAttempts;
      syncQueuedBroadcastAttempts = self->_syncQueuedBroadcastAttempts;
      break;
    case 200:
      p_syncQueuedBroadcastAttempts = &self->_defaultQueuedBroadcastAttempts;
      syncQueuedBroadcastAttempts = self->_defaultQueuedBroadcastAttempts;
      break;
    case 300:
      p_syncQueuedBroadcastAttempts = &self->_urgentQueuedBroadcastAttempts;
      syncQueuedBroadcastAttempts = self->_urgentQueuedBroadcastAttempts;
      break;
    default:
      p_syncQueuedBroadcastAttempts = &self->_queuedBroadcastAttempts;
      syncQueuedBroadcastAttempts = self->_queuedBroadcastAttempts;
      break;
  }
  if (![(NSMutableDictionary *)syncQueuedBroadcastAttempts count])
  {
    double v5 = *p_syncQueuedBroadcastAttempts;
    *p_syncQueuedBroadcastAttempts = 0;
  }
}

- (void)_postAliveNotification
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFStringRef v3 = (const __CFString *)kIDSDaemonLaunchedDistNotification;

  CFNotificationCenterPostNotificationWithOptions(DarwinNotifyCenter, v3, 0, 0, 0);
}

- (void)dealloc
{
  +[NSObject cancelPreviousPerformRequestsWithTarget:self selector:"_terminate" object:0];
  CFStringRef v3 = [(IDSDaemon *)self idStatusQueryController];
  [v3 removeCompletionBlockForUniqueIdentifier:@"IDSDaemon"];

  double v4 = [(IDSDaemon *)self pairingManager];
  [v4 removeDelegate:self];

  [(IMDispatchTimer *)self->_nonUrgentInternetSendTimer invalidate];
  nonUrgentInternetSendTimer = self->_nonUrgentInternetSendTimer;
  self->_nonUrgentInternetSendTimer = 0;

  [(IMDispatchTimer *)self->_storageTimer invalidate];
  storageTimer = self->_storageTimer;
  self->_storageTimer = 0;

  restrictedMessageCleanupTimer = self->_restrictedMessageCleanupTimer;
  if (restrictedMessageCleanupTimer)
  {
    [(IMDispatchTimer *)restrictedMessageCleanupTimer invalidate];
    double v8 = self->_restrictedMessageCleanupTimer;
    self->_restrictedMessageCleanupTimer = 0;
  }
  pthread_mutex_destroy(&self->_listenerLock);
  pthread_mutex_destroy(&self->_localIncomingGUIDsLock);
  pthread_mutex_destroy(&self->_incomingLocalPowerAssertionLock);
  [(FTMessageDelivery *)self->_homeKitMessageDelivery invalidate];
  v9.receiver = self;
  v9.super_class = (Class)IDSDaemon;
  [(IDSDaemon *)&v9 dealloc];
}

- (void)systemDidLock
{
  CFStringRef v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "System did lock", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  [(IDSDaemon *)self _processOutgoingNonUrgentInternetMessages];
}

- (void)systemDidUnlock
{
  v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)CFStringRef v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "System did unlock", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)duetInterface:(id)a3 resourceAvailabilityChangedForIdentifiers:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Alerted that duet resource availability has changed.", v10, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  objc_super v9 = +[IDSUTunDeliveryController sharedInstance];
  [v9 admissionPolicyChangedForTopic:0 allowed:1];

  [(IDSDaemon *)self _resourceAvailabilityChangedForIdentifiers:v7 priorities:0 dataProtectionClasses:0];
}

- (void)_terminate
{
  v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "No more listeners terminating", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLog()) {
      _IDSLogV();
    }
  }
  CFStringRef v3 = +[IDSDaemonMIGInterface sharedInstance];
  [v3 denyIncomingGrantRequests];

  double v4 = +[IDSDaemonMIGQueryInterface sharedInstance];
  [v4 denyIncomingGrantRequests];

  IMSyncronizeAppPreferences();
  exit(0);
}

- (void)shutdown
{
  CFStringRef v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)double v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Shutting down", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  [(IDSDaemon *)self _terminate];
}

- (void)logState
{
  p_listenerLock = &self->_listenerLock;
  pthread_mutex_lock(&self->_listenerLock);
  _IMLog();
  _IMLog();
  long long v28 = 0u;
  long long v29 = 0u;
  long long v26 = 0u;
  long long v27 = 0u;
  id obj = self->_listeners;
  id v3 = [(NSMutableArray *)obj countByEnumeratingWithState:&v26 objects:v30 count:16];
  if (v3)
  {
    id v4 = v3;
    uint64_t v5 = *(void *)v27;
    id v6 = IMRGLog_ptr;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v27 != v5) {
          objc_enumerationMutation(obj);
        }
        double v8 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (!objc_msgSend(v8, "type", v15))
        {
          objc_super v9 = [v8 remoteObject];
          id v10 = [v8 ID];
          id v11 = v6;
          id v12 = v4;
          uint64_t v13 = v5;
          id v14 = [v9 pid];
          [v9 processName];
          v23 = id v22 = v14;
          uint64_t v5 = v13;
          id v4 = v12;
          id v6 = v11;
          id v16 = v10;
          _IMLog();
        }
        unsigned __int8 v17 = objc_msgSend(v8, "remoteObject", v16, v22, v23);
        _IMLog();

        id v18 = objc_msgSend(v8, "localObject", v17);
        _IMLog();

        id v19 = objc_msgSend(v8, "entitlements", v18);
        _IMLog();

        double v20 = objc_msgSend(v8, "commands", v19);
        _IMLog();

        double v21 = objc_msgSend(v6[62], "numberWithUnsignedInt:", objc_msgSend(v8, "capabilities", v20));
        _IMLog();

        id v15 = objc_msgSend(v8, "bundleID", v21);
        _IMLog();

        _IMLog();
        _IMLog();
      }
      id v4 = -[NSMutableArray countByEnumeratingWithState:objects:count:](obj, "countByEnumeratingWithState:objects:count:", &v26, v30, 16, v15);
    }
    while (v4);
  }

  _IMLog();
  pthread_mutex_unlock(p_listenerLock);
}

- (void)dropQueuedBroadcastsForServices:(id)a3
{
  id v4 = a3;
  [(IDSDaemon *)self _dropQueuedBroadcastsForServices:v4 priority:0];
  uint64_t v5 = +[IDSDaemonPriorityQueueController sharedInstance];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_100127EAC;
  v15[3] = &unk_10097E440;
  v15[4] = self;
  id v6 = v4;
  id v16 = v6;
  [v5 performBlockUrgentPriority:v15];

  id v7 = +[IDSDaemonPriorityQueueController sharedInstance];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_100127EBC;
  v13[3] = &unk_10097E440;
  v13[4] = self;
  id v8 = v6;
  id v14 = v8;
  [v7 performBlockDefaultPriority:v13];

  objc_super v9 = +[IDSDaemonPriorityQueueController sharedInstance];
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  v11[2] = sub_100127ECC;
  v11[3] = &unk_10097E440;
  v11[4] = self;
  id v12 = v8;
  id v10 = v8;
  [v9 performBlockSyncPriority:v11];
}

- (BOOL)validateListenerForLocalObject:(id)a3
{
  id v4 = a3;
  uint64_t v7 = 0;
  id v8 = &v7;
  uint64_t v9 = 0x2020000000;
  char v10 = 0;
  v6[0] = _NSConcreteStackBlock;
  v6[1] = 3221225472;
  v6[2] = sub_100127FB0;
  v6[3] = &unk_100983220;
  v6[4] = &v7;
  [(IDSDaemon *)self validateListenerForLocalObject:v4 andPerformBlock:v6];
  LOBYTE(self) = *((unsigned char *)v8 + 24);
  _Block_object_dispose(&v7, 8);

  return (char)self;
}

- (BOOL)validateListenerForLocalObject:(id)a3 andCheckEntitlement:(id)a4
{
  return [(IDSDaemon *)self validateListenerForLocalObject:a3 andCheckEntitlement:a4 forAccessToServiceWithIdentifier:0];
}

- (BOOL)validateListenerForLocalObject:(id)a3 andCheckEntitlement:(id)a4 forAccessToServiceWithIdentifier:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v17 = 0;
  id v18 = &v17;
  uint64_t v19 = 0x2020000000;
  char v20 = 0;
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_1001280F0;
  v13[3] = &unk_100983248;
  id v16 = &v17;
  v13[4] = self;
  id v10 = a5;
  id v14 = v10;
  id v11 = v9;
  id v15 = v11;
  [(IDSDaemon *)self validateListenerForLocalObject:v8 andPerformBlock:v13];
  LOBYTE(self) = *((unsigned char *)v18 + 24);

  _Block_object_dispose(&v17, 8);
  return (char)self;
}

- (void)_iterateOverConnectedListeners:(id)a3
{
  id v4 = a3;
  p_listenerLock = &self->_listenerLock;
  pthread_mutex_lock(&self->_listenerLock);
  listeners = self->_listeners;
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_1001281E8;
  v8[3] = &unk_100983270;
  id v9 = v4;
  id v7 = v4;
  [(NSMutableArray *)listeners enumerateObjectsUsingBlock:v8];
  pthread_mutex_unlock(p_listenerLock);
}

- (void)_removeListener:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    uint64_t v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      id v6 = [v4 ID];
      *(_DWORD *)buf = 138412290;
      id v82 = v6;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Removing listener ID: %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      id v52 = [v4 ID];
      _IDSLogEventV();
    }
    v65 = objc_msgSend(v4, "localObject", v52);
    v66 = [v4 entitlements];
    if ([v66 hasEntitlement:kIDSContinuityEntitlement])
    {
      id v7 = +[IDSWPLinkManager sharedInstance];
      [v7 clientInstancesRemoved];
    }
    if ([v66 hasEntitlement:kIDSLocalPairingEntitlement])
    {
      id v8 = +[IDSDuetInterface sharedInstance];
      id v9 = [v65 processName];
      [v8 setInitialSyncInProgress:0 forClientID:v9];

      id v10 = +[IDSDuetInterface sharedInstance];
      id v11 = [v65 processName];
      [v10 setReunionSyncInProgress:0 forClientID:v11];
    }
    if ([v66 hasEntitlement:kIDSAppleCareServicesEntitlement])
    {
      id v12 = +[IMRGLog appleCare];
      if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Removed Apple Care listener", buf, 2u);
      }

      uint64_t v13 = [(IDSDaemon *)self signInResponder];
      [v13 iCloudSignOut];

      id v14 = [(IDSDaemon *)self registrationConductor];
      [v14 setShouldSupressRepairLogic:0];

      id v15 = [(IDSDaemon *)self registrationConductor];
      [v15 kickiCloudRepair];
    }
    id v16 = [v4 ID];
    uint64_t v17 = [v4 remoteObject];
    uint64_t v64 = sub_100128E38(v16, v17);

    id v18 = +[IDSDSessionController sharedInstance];
    [v18 cleanupSessionsForClient:v64];

    uint64_t v19 = +[IDSUTunController sharedInstance];
    [v19 cleanupSocketsForClient:v64];

    char v20 = [v4 services];
    double v21 = +[IDSUTunDeliveryController sharedInstance];
    id v22 = [v20 allObjects];
    [v21 defaultPeerSetPreferInfraWiFi:0 services:v22];

    [(IDSDaemon *)self _resetBroadcastQueuesForServices:v20];
    if (![v4 type])
    {
      double v23 = +[NSNotificationCenter defaultCenter];
      double v24 = [v4 remoteObject];
      [v23 removeObserver:self name:IMRemoteObjectDidDisconnectNotification object:v24];

      id v25 = +[NSNotificationCenter defaultCenter];
      [v25 removeObserver:self name:IMLocalObjectDidDisconnectNotification object:v65];
    }
    [v65 invalidate];
    long long v26 = [v4 bundleID];
    id v63 = [v26 length];

    [(NSMutableArray *)self->_listeners removeObjectIdenticalTo:v4];
    long long v27 = [v4 services];
    id v28 = [v27 count];

    if (v28)
    {
      id v61 = [(NSMutableSet *)self->_listenerCachedServices count];
      long long v29 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      listenerCachedServices = self->_listenerCachedServices;
      self->_listenerCachedServices = v29;

      long long v78 = 0u;
      long long v79 = 0u;
      long long v76 = 0u;
      long long v77 = 0u;
      id v31 = self->_listeners;
      id v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v76 objects:v89 count:16];
      if (v32)
      {
        uint64_t v33 = *(void *)v77;
        do
        {
          for (i = 0; i != v32; i = (char *)i + 1)
          {
            if (*(void *)v77 != v33) {
              objc_enumerationMutation(v31);
            }
            id v35 = self->_listenerCachedServices;
            id v36 = [*(id *)(*((void *)&v76 + 1) + 8 * i) services];
            [(NSMutableSet *)v35 unionSet:v36];
          }
          id v32 = [(NSMutableArray *)v31 countByEnumeratingWithState:&v76 objects:v89 count:16];
        }
        while (v32);
      }

      id v71 = _NSConcreteStackBlock;
      uint64_t v72 = 3221225472;
      id v73 = sub_1001290AC;
      v74 = &unk_10097E4D0;
      BOOL v75 = self;
      [(IDSDaemon *)self updateTopics];
      v37 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
      {
        id v38 = [(NSMutableSet *)self->_listenerCachedServices count];
        *(_DWORD *)buf = 134218754;
        id v82 = v61;
        __int16 v83 = 2112;
        CFStringRef v84 = @"services";
        __int16 v85 = 2048;
        id v86 = v38;
        __int16 v87 = 2048;
        id v88 = v28;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "We had %lu %@ before removing listener, now we have %lu. This listener had %lu.", buf, 0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v57 = [(NSMutableSet *)self->_listenerCachedServices count];
        id v59 = v28;
        id v53 = v61;
        CFStringRef v55 = @"services";
        _IDSLogV();
      }
    }
    id v39 = objc_msgSend(v4, "commands", v53, v55, v57, v59);
    id v40 = [v39 count];

    if (v40)
    {
      id v62 = [(NSMutableSet *)self->_listenerCachedCommands count];
      id v41 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
      listenerCachedCommands = self->_listenerCachedCommands;
      self->_listenerCachedCommands = v41;

      long long v69 = 0u;
      long long v70 = 0u;
      long long v67 = 0u;
      long long v68 = 0u;
      __int16 v43 = self->_listeners;
      id v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v67 objects:v80 count:16];
      if (v44)
      {
        uint64_t v45 = *(void *)v68;
        do
        {
          for (j = 0; j != v44; j = (char *)j + 1)
          {
            if (*(void *)v68 != v45) {
              objc_enumerationMutation(v43);
            }
            long long v47 = self->_listenerCachedCommands;
            id v48 = [*(id *)(*((void *)&v67 + 1) + 8 * (void)j) commands];
            [(NSMutableSet *)v47 unionSet:v48];
          }
          id v44 = [(NSMutableArray *)v43 countByEnumeratingWithState:&v67 objects:v80 count:16];
        }
        while (v44);
      }

      [(IDSDaemon *)self _updatePushCommandsLocked];
      double v49 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v49, OS_LOG_TYPE_DEBUG))
      {
        id v50 = [(NSMutableSet *)self->_listenerCachedCommands count];
        *(_DWORD *)buf = 134218754;
        id v82 = v62;
        __int16 v83 = 2112;
        CFStringRef v84 = @"commands";
        __int16 v85 = 2048;
        id v86 = v50;
        __int16 v87 = 2048;
        id v88 = v40;
        _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEBUG, "We had %lu %@ before removing listener, now we have %lu. This listener had %lu.", buf, 0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v58 = [(NSMutableSet *)self->_listenerCachedCommands count];
        id v60 = v40;
        id v54 = v62;
        CFStringRef v56 = @"commands";
        _IDSLogV();
      }
    }
    -[IDSDaemon removeWakingPushPriorityForServices:](self, "removeWakingPushPriorityForServices:", v20, v54, v56, v58, v60);
    IMSyncronizeAppPreferencesLater();
    if (v63) {
      [(IDSDaemon *)self refreshBundleIDs];
    }
  }
  else
  {
    id v51 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v51, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_ERROR, "Tried to remove nil listener object", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)_removeListenerWithRemoteXPCObject:(id)a3
{
  id v4 = a3;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v5 = [(NSMutableArray *)self->_listeners copy];
  id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if (![v9 type])
        {
          id v10 = [v9 remoteObject];
          BOOL v11 = v10 == v4;

          if (v11)
          {
            [(IDSDaemon *)self _removeListener:v9];
            id v12 = +[IMRemoteObjectBroadcaster defaultBroadcaster];
            [v12 flushProxy:v4];
          }
        }
      }
      id v6 = [v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v6);
  }
}

- (id)listenerForLocalObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    p_listenerLock = &self->_listenerLock;
    pthread_mutex_lock(&self->_listenerLock);
    long long v14 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    long long v17 = 0u;
    id v6 = self->_listeners;
    id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v15;
      while (2)
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v15 != v8) {
            objc_enumerationMutation(v6);
          }
          id v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
          id v11 = [v10 localObject];
          BOOL v12 = v11 == v4;

          if (v12)
          {
            id v7 = v10;
            goto LABEL_12;
          }
        }
        id v7 = [(NSMutableArray *)v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
        if (v7) {
          continue;
        }
        break;
      }
    }
LABEL_12:

    pthread_mutex_unlock(p_listenerLock);
  }
  else
  {
    id v7 = 0;
  }

  return v7;
}

- (id)listenerRemoteObjectForLocalObject:(id)a3
{
  id v3 = [(IDSDaemon *)self listenerForLocalObject:a3];
  id v4 = [v3 remoteObject];

  return v4;
}

- (void)_removeLocalListenerObject:(id)a3
{
  id v4 = a3;
  if (v4)
  {
    long long v15 = 0u;
    long long v16 = 0u;
    long long v13 = 0u;
    long long v14 = 0u;
    id v5 = self->_listeners;
    id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
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
          id v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
          id v10 = [v9 localObject];
          BOOL v11 = v10 == v4;

          if (v11)
          {
            id v12 = v9;
            [(IDSDaemon *)self _removeListener:v12];

            if (v12) {
              [(IDSDaemon *)self _removeListener:v12];
            }
            goto LABEL_13;
          }
        }
        id v6 = [(NSMutableArray *)v5 countByEnumeratingWithState:&v13 objects:v17 count:16];
        if (v6) {
          continue;
        }
        break;
      }
    }

    id v12 = 0;
LABEL_13:
  }
}

- (void)removeListenerWithRemoteXPCObject:(id)a3
{
}

- (void)removeLocalListenerObject:(id)a3
{
}

- (void)remoteObjectDiedNotification:(id)a3
{
  id v4 = a3;
  id v5 = [v4 object];
  id v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    uint64_t v8 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "remoteObjectDiedNotification: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  pthread_mutex_lock(&self->_listenerLock);
  [(IDSDaemon *)self removeListenerWithRemoteXPCObject:v5];
  pthread_mutex_unlock(&self->_listenerLock);
}

- (void)localObjectDiedNotification:(id)a3
{
  id v14 = a3;
  id v18 = [v14 object];
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)buf = 138412290;
    long long v27 = v18;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "localObjectDiedNotification: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v12 = v18;
    _IDSLogV();
  }
  long long v15 = objc_msgSend(v18, "processName", v12);
  long long v16 = [(IDSDaemon *)self _processNameToServiceName:v15];
  if (v16)
  {
    id v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)buf = 138412290;
      long long v27 = v15;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Resetting link preferences for process %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      long long v13 = v15;
      _IDSLogV();
    }
    id v5 = objc_alloc_init((Class)NSMutableDictionary);
    [v5 setObject:&off_1009D1128 forKey:@"PacketsPerSecond"];
    [v5 setObject:&off_1009D1128 forKey:@"InputBytesPerSecond"];
    [v5 setObject:&off_1009D1128 forKey:@"OutputBytesPerSecond"];
    long long v23 = 0u;
    long long v24 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    id obj = v16;
    id v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
    if (v6)
    {
      uint64_t v7 = *(void *)v22;
      do
      {
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v22 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v21 + 1) + 8 * (void)v8);
          id v10 = +[IDSLinkPreferencesManager sharedInstance];
          [v10 updateService:v9 withPreferences:v5];

          BOOL v11 = im_primary_queue();
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_100129E20;
          block[3] = &unk_10097E4D0;
          void block[4] = v9;
          dispatch_async(v11, block);

          uint64_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [obj countByEnumeratingWithState:&v21 objects:v25 count:16];
      }
      while (v6);
    }
  }
  pthread_mutex_lock(&self->_listenerLock);
  [(IDSDaemon *)self removeLocalListenerObject:v18];
  pthread_mutex_unlock(&self->_listenerLock);
}

- (void)_registerForNetworkAvailableNotification
{
  SEL v3 = NSSelectorFromString(@"networkStateChangedForLogTransportHint:");
  if (objc_opt_respondsToSelector())
  {
    id v4 = +[NSNotificationCenter defaultCenter];
    [v4 addObserver:self selector:v3 name:IMNetworkChangedNotification object:0];
  }
}

- (id)_processNameToServiceName:(id)a3
{
  id v3 = a3;
  id v4 = objc_alloc_init((Class)NSMutableArray);
  if ([v3 isEqualToString:@"callservicesd"])
  {
    CFStringRef v5 = @"com.apple.private.alloy.phonecontinuity";
LABEL_9:
    [v4 addObject:v5];
    id v6 = [v4 copy];
    goto LABEL_10;
  }
  if ([v3 isEqualToString:@"assistantd"])
  {
    CFStringRef v5 = @"com.apple.private.alloy.siri.proxy";
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"companion_proxy"])
  {
    CFStringRef v5 = @"com.apple.private.alloy.companionproxy";
    goto LABEL_9;
  }
  if ([v3 isEqualToString:@"mediaplaybackd"])
  {
    CFStringRef v5 = @"com.apple.private.alloy.fignero";
    goto LABEL_9;
  }
  id v6 = 0;
LABEL_10:

  return v6;
}

- (id)_localPushTopics
{
  id v2 = objc_alloc_init((Class)NSMutableSet);
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = +[IDSDAccountController sharedInstance];
  id v4 = [v3 accountsWithType:2];

  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    id v6 = v5;
    uint64_t v7 = *(void *)v13;
    do
    {
      for (i = 0; i != v6; i = (char *)i + 1)
      {
        if (*(void *)v13 != v7) {
          objc_enumerationMutation(v4);
        }
        uint64_t v9 = [*(id *)(*((void *)&v12 + 1) + 8 * i) service];
        id v10 = [v9 pushTopic];
        [v2 addObject:v10];
      }
      id v6 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v6);
  }

  return v2;
}

- (id)_ultraConstrainedPushTopicsForTopics:(id)a3
{
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id obj = a3;
  id v3 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
  if (v3)
  {
    id v4 = v3;
    id v5 = 0;
    uint64_t v6 = *(void *)v24;
    uint64_t v7 = IDSStewieT911Topic;
    uint64_t v20 = IDSStewieT911RSATopic;
    uint64_t v19 = IDSStewieT911ParakeetTopic;
    uint64_t v18 = IDSStewieT911ParakeetIPTopic;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v24 != v6) {
          objc_enumerationMutation(obj);
        }
        uint64_t v9 = *(void **)(*((void *)&v23 + 1) + 8 * i);
        if ([v9 isEqualToString:v7]) {
          unsigned int v10 = 1;
        }
        else {
          unsigned int v10 = [v9 isEqualToString:v20];
        }
        int v11 = _os_feature_enabled_impl();
        int v12 = v11 | v10;
        if (v11 && (v10 & 1) == 0)
        {
          if ([v9 isEqualToString:v19]) {
            int v12 = 1;
          }
          else {
            int v12 = [v9 isEqualToString:v18];
          }
        }
        long long v13 = [(IDSDaemon *)self serviceController];
        long long v14 = [v13 serviceWithPushTopic:v9];
        unsigned __int8 v15 = [v14 isUltraConstrainedPushAllowed];

        if ((v15 & 1) != 0 || v12)
        {
          if (!v5) {
            id v5 = objc_alloc_init((Class)NSMutableSet);
          }
          [v5 addObject:v9];
        }
      }
      id v4 = [obj countByEnumeratingWithState:&v23 objects:v27 count:16];
    }
    while (v4);
  }
  else
  {
    id v5 = 0;
  }
  id v16 = [v5 copy];

  return v16;
}

- (id)_pushTopics
{
  id v37 = objc_alloc_init((Class)NSMutableSet);
  id v3 = objc_alloc_init((Class)NSMutableSet);
  id v36 = self;
  long long v42 = 0u;
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  id v4 = [(IDSDaemon *)self serviceController];
  id v5 = [v4 allServices];

  id v6 = [v5 countByEnumeratingWithState:&v42 objects:v49 count:16];
  if (v6)
  {
    id v7 = v6;
    uint64_t v8 = *(void *)v43;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v43 != v8) {
          objc_enumerationMutation(v5);
        }
        unsigned int v10 = *(void **)(*((void *)&v42 + 1) + 8 * i);
        if ([v10 adHocServiceType] != 5)
        {
          int v12 = [v10 launchDarwinNotification];
          if ([v12 length])
          {

LABEL_11:
            [v3 addObject:v10];
            goto LABEL_12;
          }
          long long v13 = [v10 launchMachServiceNotification];
          id v14 = [v13 length];

          if (v14) {
            goto LABEL_11;
          }
          listenerCachedServices = v36->_listenerCachedServices;
          id v16 = [v10 identifier];
          LODWORD(listenerCachedServices) = [(NSMutableSet *)listenerCachedServices containsObject:v16];

          if (listenerCachedServices) {
            goto LABEL_11;
          }
        }
LABEL_12:
      }
      id v7 = [v5 countByEnumeratingWithState:&v42 objects:v49 count:16];
    }
    while (v7);
  }

  uint64_t v18 = +[IDSDAccountController sharedInstance];
  uint64_t v19 = [v18 accounts];

  long long v40 = 0u;
  long long v41 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v20 = v19;
  id v21 = [v20 countByEnumeratingWithState:&v38 objects:v48 count:16];
  if (v21)
  {
    id v22 = v21;
    uint64_t v23 = *(void *)v39;
    do
    {
      for (j = 0; j != v22; j = (char *)j + 1)
      {
        if (*(void *)v39 != v23) {
          objc_enumerationMutation(v20);
        }
        long long v25 = *(void **)(*((void *)&v38 + 1) + 8 * (void)j);
        if ([v25 isRegistered])
        {
          long long v27 = [v25 service];
          unsigned int v28 = [v3 containsObject:v27];

          if (v28)
          {
            long long v29 = [v25 service];
            unsigned __int8 v30 = [v29 pushTopic];
            [v37 addObject:v30];
          }
        }
      }
      id v22 = [v20 countByEnumeratingWithState:&v38 objects:v48 count:16];
    }
    while (v22);
  }

  id v31 = [(IDSRegistrationConductor *)v36->_registrationConductor stewieCoordinator];
  if ([v31 isStewieEnabled])
  {
    v47[0] = IDSStewieT911Topic;
    v47[1] = IDSStewieT911RSATopic;
    id v32 = +[NSArray arrayWithObjects:v47 count:2];
    [v37 addObjectsFromArray:v32];

    if (_os_feature_enabled_impl())
    {
      v46[0] = IDSStewieT911ParakeetTopic;
      v46[1] = IDSStewieT911ParakeetIPTopic;
      uint64_t v33 = +[NSArray arrayWithObjects:v46 count:2];
      [v37 addObjectsFromArray:v33];
    }
  }

  return v37;
}

- (void)_startPushHandlingLocked
{
  id v37 = [(IDSDaemon *)self _pushTopics];
  id v2 = +[NSMutableSet setWithSet:v37];
  id v3 = objc_alloc_init((Class)NSMutableSet);
  id v4 = objc_alloc_init((Class)NSMutableSet);
  id v5 = [(IDSPersistentMap *)self->_wakingPushPriorityStore copyDictionaryRepresentation];
  long long v43 = 0u;
  long long v44 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  id v6 = v5;
  id v7 = [v6 countByEnumeratingWithState:&v43 objects:v56 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v44;
    do
    {
      for (i = 0; i != v7; i = (char *)i + 1)
      {
        if (*(void *)v44 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void *)(*((void *)&v43 + 1) + 8 * i);
        int v11 = [v6 objectForKey:v10];
        id v12 = [v11 integerValue];
        long long v13 = v3;
        if (v12 != (id)2)
        {
          if (v12) {
            goto LABEL_10;
          }
          long long v13 = v4;
        }
        [v13 addObject:v10];
        [v2 removeObject:v10];
LABEL_10:
      }
      id v7 = [v6 countByEnumeratingWithState:&v43 objects:v56 count:16];
    }
    while (v7);
  }

  id v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEBUG))
  {
    listenerCachedServices = self->_listenerCachedServices;
    *(_DWORD *)buf = 138413058;
    double v49 = listenerCachedServices;
    __int16 v50 = 2112;
    id v51 = v3;
    __int16 v52 = 2112;
    id v53 = v2;
    __int16 v54 = 2112;
    id v55 = v4;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEBUG, "Starting push handling with services %@ waking topics: %@ opportunistic topics: %@ nonwaking topics %@", buf, 0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    double v34 = v2;
    id v35 = v4;
    id v32 = self->_listenerCachedServices;
    id v33 = v3;
    _IDSLogV();
  }
  id v16 = dispatch_queue_attr_make_with_autorelease_frequency(0, DISPATCH_AUTORELEASE_FREQUENCY_WORK_ITEM);
  long long v17 = dispatch_queue_attr_make_with_qos_class(v16, QOS_CLASS_USER_INITIATED, 0);
  uint64_t v18 = im_primary_base_queue();
  dispatch_queue_t v36 = dispatch_queue_create_with_target_V2("com.apple.idsdaemon.apsqueue", v17, v18);

  uint64_t v19 = [(IDSDaemon *)self pushHandlerForAPSDelegatePort];
  id v20 = [(IDSDaemon *)self _commands];
  [v19 addListener:self wakingTopics:v3 opportunisticTopics:v2 nonWakingTopics:v4 commands:v20 queue:v36];

  id v21 = [(IDSDaemon *)self pushHandlerForAPSDelegatePort];
  id v22 = [(IDSDaemon *)self _ultraConstrainedPushTopicsForTopics:v37];
  [v21 setUltraConstrainedTopics:v22 forListener:self];

  id v23 = objc_alloc_init((Class)NSMutableArray);
  long long v41 = 0u;
  long long v42 = 0u;
  long long v39 = 0u;
  long long v40 = 0u;
  long long v24 = [(IDSDaemon *)self serviceController];
  long long v25 = [v24 allServices];

  id v26 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
  if (v26)
  {
    uint64_t v27 = *(void *)v40;
    do
    {
      for (j = 0; j != v26; j = (char *)j + 1)
      {
        if (*(void *)v40 != v27) {
          objc_enumerationMutation(v25);
        }
        long long v29 = *(void **)(*((void *)&v39 + 1) + 8 * (void)j);
        if ((objc_msgSend(v29, "pushToWakeDisabled", v32, v33, v34, v35) & 1) == 0)
        {
          unsigned __int8 v30 = [v29 pushTopic];
          [v23 addObject:v30];
        }
      }
      id v26 = [v25 countByEnumeratingWithState:&v39 objects:v47 count:16];
    }
    while (v26);
  }

  id v31 = [(IDSDaemon *)self pushHandlerForAPSDelegatePort];
  [v31 configureAsMacNotificationCenterObserver:kFZTextAppBundleIdentifier withPushToWakeTopics:v23];
}

- (void)_stopPushHandling
{
  id v3 = [(IDSDaemon *)self pushHandlerForAPSDelegatePort];
  [v3 removeListener:self];
}

- (void)updateTopics
{
  id v33 = [(IDSDaemon *)self _pushTopics];
  id v3 = +[NSMutableSet setWithSet:v33];
  id v4 = objc_alloc_init((Class)NSMutableSet);
  id v5 = objc_alloc_init((Class)NSMutableSet);
  id v6 = [(IDSPersistentMap *)self->_wakingPushPriorityStore copyDictionaryRepresentation];
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  long long v37 = 0u;
  id v7 = v6;
  id v8 = [v7 countByEnumeratingWithState:&v34 objects:v46 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v35;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v35 != v9) {
          objc_enumerationMutation(v7);
        }
        uint64_t v11 = *(void *)(*((void *)&v34 + 1) + 8 * i);
        id v12 = [v7 objectForKey:v11];
        id v13 = [v12 integerValue];
        id v14 = v4;
        if (v13 != (id)2)
        {
          if (v13) {
            goto LABEL_10;
          }
          id v14 = v5;
        }
        [v14 addObject:v11];
        [v3 removeObject:v11];
LABEL_10:
      }
      id v8 = [v7 countByEnumeratingWithState:&v34 objects:v46 count:16];
    }
    while (v8);
  }

  unsigned __int8 v15 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    listenerCachedServices = self->_listenerCachedServices;
    *(_DWORD *)buf = 138413058;
    long long v39 = listenerCachedServices;
    __int16 v40 = 2112;
    id v41 = v4;
    __int16 v42 = 2112;
    long long v43 = v3;
    __int16 v44 = 2112;
    id v45 = v5;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Updating push handling with services %@ waking topics: %@ opportunistic topics: %@ nonwaking topics: %@", buf, 0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v31 = v3;
    id v32 = v5;
    unsigned int v28 = self->_listenerCachedServices;
    id v30 = v4;
    _IDSLogV();
  }
  long long v17 = [(IDSDaemon *)self pushHandlerForAPSDelegatePort];
  [v17 setWakingTopics:v4 opportunisticTopics:v3 nonWakingTopics:v5 forListener:self];

  uint64_t v18 = [(IDSDaemon *)self pushHandlerForAPSDelegatePort];
  uint64_t v19 = [(IDSDaemon *)self _ultraConstrainedPushTopicsForTopics:v33];
  [v18 setUltraConstrainedTopics:v19 forListener:self];

  id v20 = [(IDSDaemon *)self _localPushTopics];
  id v21 = (NSMutableSet *)[v20 mutableCopy];

  [(NSMutableSet *)v21 unionSet:v3];
  [(NSMutableSet *)v21 unionSet:v4];
  [(NSMutableSet *)v21 unionSet:v5];
  id v22 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)buf = 138412290;
    long long v39 = v21;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEBUG, "Updating local push handling with topics: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    long long v29 = v21;
    _IDSLogV();
  }
  id v23 = +[IDSUTunDeliveryController sharedInstance];
  [v23 setTopics:v21];

  long long v24 = (char *)[v3 count];
  id v25 = [v4 count];
  BOOL v26 = &v24[(void)v25 + (unint64_t)[v5 count]] != 0;
  uint64_t v27 = +[IDSQuickRelayAllocator sharedInstance];
  [v27 enablePushHandler:v26];
}

- (id)_commands
{
  id v3 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithObjects:", &off_1009D1140, &off_1009D1158, &off_1009D1170, &off_1009D1188, &off_1009D11A0, &off_1009D11B8, &off_1009D11D0, &off_1009D11E8, &off_1009D1200, &off_1009D1218, &off_1009D1230, &off_1009D1248, &off_1009D1260, &off_1009D1278, &off_1009D1290, &off_1009D12A8, &off_1009D12C0,
         &off_1009D12D8,
         &off_1009D12F0,
         &off_1009D1308,
         &off_1009D1320,
         &off_1009D1338,
         &off_1009D1350,
         &off_1009D1368,
         &off_1009D1380,
         &off_1009D1398,
         &off_1009D13B0,
         &off_1009D13C8,
         &off_1009D13E0,
         &off_1009D13F8,
         &off_1009D1410,
         &off_1009D1428,
         &off_1009D1440,
         &off_1009D1458,
         &off_1009D1470,
         &off_1009D1488,
         &off_1009D14A0,
         &off_1009D14B8,
         &off_1009D14D0,
         &off_1009D14E8,
         &off_1009D1500,
         &off_1009D1518,
         &off_1009D1530,
         &off_1009D1548,
         &off_1009D1560,
         &off_1009D1578,
         &off_1009D1590,
         &off_1009D15A8,
         &off_1009D15C0,
         &off_1009D15D8,
         &off_1009D15F0,
         &off_1009D1608,
         &off_1009D1620,
         &off_1009D1638,
         &off_1009D1650,
         &off_1009D1668,
         &off_1009D1680,
         0);
  if (_os_feature_enabled_impl()) {
    [v3 addObject:&off_1009D1698];
  }
  if (self->_listenerCachedCommands) {
    objc_msgSend(v3, "unionSet:");
  }

  return v3;
}

- (void)_updatePushCommandsLocked
{
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEBUG))
  {
    listenerCachedCommands = self->_listenerCachedCommands;
    *(_DWORD *)buf = 138412290;
    uint64_t v9 = listenerCachedCommands;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEBUG, "Updating push handling with commands %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v7 = self->_listenerCachedCommands;
    _IDSLogV();
  }
  id v5 = [(IDSDaemon *)self pushHandlerForAPSDelegatePort];
  id v6 = [(IDSDaemon *)self _commands];
  [v5 setCommands:v6 forListener:self];
}

- (id)broadcasterWithMessageContext:(id)a3
{
  id v4 = a3;
  if (self->_isHardReset)
  {
    id v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Daemon was hard reset, ignoring broadcast", v9, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v6 = 0;
  }
  else
  {
    p_listenerLock = &self->_listenerLock;
    pthread_mutex_lock(&self->_listenerLock);
    id v6 = [(IDSIPCBroadcaster *)self->_notifier broadcastProxyForTargets:self->_listeners messageContext:v4 protocol:&OBJC_PROTOCOL___IDSDaemonListenerProtocol];
    pthread_mutex_unlock(p_listenerLock);
  }

  return v6;
}

- (id)broadcasterForLocalObject:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isHardReset)
  {
    id v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)id v14 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Daemon was hard reset, ignoring broadcast", v14, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v10 = [(IDSDaemon *)self listenerForLocalObject:v6];
    if (v10)
    {
      notifier = self->_notifier;
      id v12 = +[NSArray arrayWithObject:v10];
      uint64_t v9 = [(IDSIPCBroadcaster *)notifier broadcastProxyForTargets:v12 messageContext:v7 protocol:&OBJC_PROTOCOL___IDSDaemonListenerProtocol];
    }
    else
    {
      uint64_t v9 = 0;
    }
  }

  return v9;
}

- (id)broadcasterForEntitlement:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (self->_isHardReset)
  {
    id v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEBUG))
    {
      *(_WORD *)uint64_t v11 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEBUG, "Daemon was hard reset, ignoring broadcast", v11, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    uint64_t v9 = 0;
  }
  else
  {
    uint64_t v9 = [(IDSDaemon *)self broadcasterForTopic:0 entitlement:v6 command:0 messageContext:v7];
  }

  return v9;
}

- (id)_lockedRemoteObjectsWithNotificationService:(id)a3 entitlement:(id)a4 command:(id)a5 capabilities:(unsigned int)a6
{
  return [(IDSDaemon *)self _lockedRemoteObjectsWithService:a3 entitlement:a4 command:a5 capabilities:*(void *)&a6 ignoreService:0 useNotificationServices:1];
}

- (id)_lockedRemoteObjectsWithService:(id)a3 entitlement:(id)a4 command:(id)a5 capabilities:(unsigned int)a6 ignoreService:(BOOL)a7 useNotificationServices:(BOOL)a8
{
  BOOL v8 = a8;
  BOOL v9 = a7;
  uint64_t v10 = *(void *)&a6;
  id v20 = a4;
  id v14 = a5;
  id v15 = a4;
  id v16 = a3;
  long long v17 = +[NSArray arrayWithObjects:&v20 count:1];

  uint64_t v18 = -[IDSDaemon _lockedRemoteObjectsWithService:entitlements:command:capabilities:ignoreService:useNotificationServices:](self, "_lockedRemoteObjectsWithService:entitlements:command:capabilities:ignoreService:useNotificationServices:", v16, v17, v14, v10, v9, v8, v20);

  return v18;
}

- (id)_lockedRemoteObjectsWithService:(id)a3 entitlements:(id)a4 command:(id)a5 capabilities:(unsigned int)a6 ignoreService:(BOOL)a7 useNotificationServices:(BOOL)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  uint64_t v34 = 0;
  long long v35 = &v34;
  uint64_t v36 = 0x3032000000;
  long long v37 = sub_10012BB60;
  long long v38 = sub_10012BB70;
  id v39 = (id)0xAAAAAAAAAAAAAAAALL;
  id v39 = objc_alloc_init((Class)NSMutableArray);
  long long v17 = [v14 identifier];
  listeners = self->_listeners;
  v25[0] = _NSConcreteStackBlock;
  v25[1] = 3221225472;
  v25[2] = sub_10012BB78;
  v25[3] = &unk_100983298;
  id v19 = v16;
  id v26 = v19;
  unsigned int v31 = a6;
  BOOL v32 = a7;
  BOOL v33 = a8;
  id v20 = v14;
  id v27 = v20;
  id v21 = v17;
  id v28 = v21;
  id v22 = v15;
  id v29 = v22;
  id v30 = &v34;
  [(NSMutableArray *)listeners enumerateObjectsUsingBlock:v25];
  id v23 = (id)v35[5];

  _Block_object_dispose(&v34, 8);

  return v23;
}

- (id)_lockedRemoteObjectsWithService:(id)a3 entitlement:(id)a4 command:(id)a5 capabilities:(unsigned int)a6
{
  return [(IDSDaemon *)self _lockedRemoteObjectsWithService:a3 entitlement:a4 command:a5 capabilities:*(void *)&a6 ignoreService:0 useNotificationServices:0];
}

- (id)_lockedRemoteObjectsWithService:(id)a3 entitlement:(id)a4 command:(id)a5 capabilities:(unsigned int)a6 ignoreService:(BOOL)a7
{
  return [(IDSDaemon *)self _lockedRemoteObjectsWithService:a3 entitlement:a4 command:a5 capabilities:*(void *)&a6 ignoreService:a7 useNotificationServices:0];
}

- (id)broadcasterForTopic:(id)a3 entitlement:(id)a4 command:(id)a5 messageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  if (self->_isHardReset)
  {
    id v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Daemon was hard reset, ignoring broadcast", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v15 = 0;
  }
  else if (v10 || v11 || v12)
  {
    id v16 = [(IDSDaemon *)self serviceController];
    long long v17 = [v16 serviceWithPushTopic:v10];

    uint64_t v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v17;
      __int16 v23 = 2112;
      id v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "Service found to find broadcaster %@   topic: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    pthread_mutex_lock(&self->_listenerLock);
    id v19 = [(IDSDaemon *)self _lockedRemoteObjectsWithService:v17 entitlement:v11 command:v12 capabilities:0];
    pthread_mutex_unlock(&self->_listenerLock);
    id v15 = [(IDSIPCBroadcaster *)self->_notifier broadcastProxyForTargets:v19 messageContext:v13 protocol:&OBJC_PROTOCOL___IDSDaemonListenerProtocol];
  }
  else
  {
    id v15 = [(IDSDaemon *)self broadcasterWithMessageContext:v13];
  }

  return v15;
}

- (id)broadcasterForTopic:(id)a3 entitlement:(id)a4 messageContext:(id)a5
{
  return [(IDSDaemon *)self broadcasterForTopic:a3 entitlement:a4 command:0 messageContext:a5];
}

- (id)registrationBroadcasterForTopic:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isEqualToIgnoringCase:@"com.apple.madrid"] & 1) != 0
    || ([v6 isEqualToIgnoringCase:@"com.apple.ess"] & 1) != 0
    || ([v6 isEqualToIgnoringCase:@"com.apple.private.ac"] & 1) != 0
    || [v6 isEqualToIgnoringCase:@"com.apple.private.alloy.facetime.multi"])
  {
    BOOL v8 = [(IDSDaemon *)self broadcasterForTopic:v6 entitlement:kIDSRegistrationEntitlement messageContext:v7];
  }
  else
  {
    BOOL v8 = 0;
  }

  return v8;
}

- (id)broadcasterForTopic:(id)a3 messageContext:(id)a4
{
  return [(IDSDaemon *)self broadcasterForTopic:a3 ignoreServiceListener:0 messageContext:a4];
}

- (id)broadcasterForTopic:(id)a3 ignoreServiceListener:(BOOL)a4 messageContext:(id)a5
{
  BOOL v6 = a4;
  id v8 = a3;
  id v9 = a5;
  if (self->_isHardReset)
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Daemon was hard reset, ignoring broadcast", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v12 = 0;
  }
  else if (v8)
  {
    id v13 = [(IDSDaemon *)self serviceController];
    id v22 = [v13 serviceWithPushTopic:v8];

    pthread_mutex_lock(&self->_listenerLock);
    v25[0] = kIDSMessagingEntitlement;
    v25[1] = kIDSRegistrationEntitlement;
    v25[2] = kIDSSessionEntitlement;
    v25[3] = kIDSSessionPrivateEntitlement;
    void v25[4] = kIDSSelfSessionEntitlement;
    v25[5] = kIDSHighPriorityMessagingEntitlement;
    v25[6] = kIDSUrgentPriorityMessagingEntitlement;
    id v14 = +[NSArray arrayWithObjects:v25 count:7];
    id v15 = [(IDSDaemon *)self _lockedRemoteObjectsWithService:v22 entitlements:v14 command:0 capabilities:0 ignoreService:v6 useNotificationServices:0];
    id v16 = +[NSSet setWithArray:v15];
    if ([v8 isEqualToIgnoringCase:@"com.apple.private.alloy.accountssync"])
    {
      long long v17 = +[IMRGLog accountsDebugging];
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "All targets for broadcast %@", buf, 0xCu);
      }
    }
    if (([v8 isEqualToIgnoringCase:@"com.apple.private.alloy.health.sync.classc"] & 1) != 0
      || ([v8 isEqualToIgnoringCase:@"com.apple.private.alloy.fitnessfriends.icloud"] & 1) != 0|| objc_msgSend(v8, "isEqualToIgnoringCase:", @"com.apple.private.alloy.fitnessfriends.imessage"))
    {
      uint64_t v18 = +[IMRGLog healthDebugging];
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v16;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "All targets for broadcast %@", buf, 0xCu);
      }
    }
    pthread_mutex_unlock(&self->_listenerLock);
    notifier = self->_notifier;
    id v20 = [v16 allObjects];
    id v12 = [(IDSIPCBroadcaster *)notifier broadcastProxyForTargets:v20 messageContext:0 protocol:&OBJC_PROTOCOL___IDSDaemonListenerProtocol];
  }
  else
  {
    id v12 = [(IDSDaemon *)self broadcasterWithMessageContext:v9];
  }

  return v12;
}

- (void)_locked_printBroadcastAttemptMapForPriority:(int64_t)a3 service:(id)a4
{
  id v6 = a4;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
  {
    v11[0] = 67109378;
    v11[1] = a3;
    __int16 v12 = 2112;
    id v13 = v6;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_INFO, "Broadcast Priority: %d Service: %@ \n", (uint8_t *)v11, 0x12u);
  }

  id v8 = [(IDSDaemon *)self broadcastAttemptQueueFromPriority:a3];
  id v9 = v8;
  if (v8)
  {
    id v10 = [v8 objectForKey:v6];
    [v10 enumerateObjectsUsingBlock:&stru_1009832D8];
  }
}

- (void)enqueueBroadcast:(id)a3 forTopic:(id)a4 entitlement:(id)a5 command:(id)a6 capabilities:(unsigned int)a7 messageContext:(id)a8
{
  uint64_t v9 = *(void *)&a7;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a8;
  id v19 = objc_alloc_init(IDSIncomingMessageBroadcast);
  id v20 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)buf = 134217984;
    int64_t v22 = [(IDSIncomingMessageBroadcast *)v19 broadcastID];
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Broadcast: outgoing generic notification %lld\n", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    [(IDSIncomingMessageBroadcast *)v19 broadcastID];
    _IDSLogTransport();
  }
  [(IDSDaemon *)self enqueueIncomingMessageBroadcast:v14 broadcastData:v19 forTopic:v15 entitlement:v16 command:v17 capabilities:v9 messageContext:v18];
}

- (void)enqueueIncomingMessageBroadcast:(id)a3 broadcastData:(id)a4 forTopic:(id)a5 entitlement:(id)a6 command:(id)a7 capabilities:(unsigned int)a8 messageContext:(id)a9
{
  uint64_t v69 = *(void *)&a8;
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a9;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v81 = _os_activity_create((void *)&_mh_execute_header, "Working on outgoing broadcast", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v81, &state);
  id v20 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
  {
    id v21 = [v15 broadcastID];
    *(_DWORD *)buf = 134217984;
    *(void *)&uint8_t buf[4] = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_INFO, "Broadcast: starting to work on outgoing notification id %lld\n", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v49 = [v15 broadcastID];
    _IDSLogTransport();
  }
  if (!self->_isHardReset)
  {
    if (!v14) {
      goto LABEL_71;
    }
    long long v67 = (void (**)(id, void *))objc_retainBlock(v14);
    id v60 = [v15 messagePriority];
    if (!v16)
    {
      BOOL v33 = [(IDSDaemon *)self broadcasterWithMessageContext:v19];
      v67[2](v67, v33);

LABEL_70:
      goto LABEL_71;
    }
    __int16 v23 = [(IDSDaemon *)self serviceController];
    long long v68 = [v23 serviceWithPushTopic:v16];

    v65 = [v68 identifier];

    if (!v65)
    {
      uint64_t v34 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v16;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Broadcast: Couldn't find a valid service for the given topic %@\n", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport()) {
        _IDSLogTransport();
      }
      v67[2](v67, 0);
      goto LABEL_64;
    }
    unsigned int v62 = [(IDSDaemon *)self _shouldLaunchClientForCapabilities:v69];
    p_listenerLock = &self->_listenerLock;
    pthread_mutex_lock(&self->_listenerLock);
    id v59 = [(IDSDaemon *)self _lockedRemoteObjectsWithNotificationService:v68 entitlement:v17 command:v18 capabilities:v69];
    pthread_mutex_unlock(&self->_listenerLock);
    id v66 = [v59 count];
    unsigned int v64 = [v15 broadcastNeedsClientAck];
    id v24 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
    {
      id v25 = [v15 broadcastID];
      *(_DWORD *)buf = 134219010;
      *(void *)&uint8_t buf[4] = v25;
      __int16 v83 = 2112;
      id v84 = v16;
      __int16 v85 = 1024;
      *(_DWORD *)id v86 = v64;
      *(_WORD *)&v86[4] = 1024;
      *(_DWORD *)&v86[6] = v66 != 0;
      LOWORD(v87) = 1024;
      *(_DWORD *)((char *)&v87 + 2) = v62;
      _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Broadcast: scheduling broadcast %lld on topic %@ to clients needsTargetAck %d targetsAlive %d shouldLaunch %d\n", buf, 0x28u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      BOOL v52 = v66 != 0;
      id v53 = (id)v62;
      id v49 = [v15 broadcastID];
      id v50 = v16;
      id v51 = (void *)v64;
      _IDSLogTransport();
    }
    if (!v66)
    {
      id v26 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        id v27 = [v15 broadcastID];
        *(_DWORD *)buf = 134219266;
        *(void *)&uint8_t buf[4] = v27;
        __int16 v83 = 2112;
        id v84 = v16;
        __int16 v85 = 2112;
        *(void *)id v86 = v68;
        *(_WORD *)&v86[8] = 2112;
        id v87 = v17;
        __int16 v88 = 2112;
        id v89 = v18;
        __int16 v90 = 1024;
        int v91 = v69;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Broadcast: broadcast %lld of topic %@ doesn't find target with service %@ entitlement %@ command %@ capabilities %u", buf, 0x3Au);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        id v53 = v18;
        uint64_t v54 = v69;
        id v51 = v68;
        BOOL v52 = (BOOL)v17;
        id v49 = [v15 broadcastID];
        id v50 = v16;
        _IDSLogTransport();
      }
    }
    if (v66) {
      int v28 = 1;
    }
    else {
      int v28 = v64;
    }
    int v56 = v28;
    if ((v28 | v62) != 1 || v66)
    {
      id v29 = objc_msgSend(v68, "identifier", v49, v50, v51, v52, v53, v54);
      id v30 = +[NSSet setWithObject:v29];
      unsigned int v31 = [(IDSDaemon *)self _processQueuedBroadcastsForServices:v30 priority:v60 forceRetry:0];

      if (v31)
      {
        BOOL v32 = [(IDSIPCBroadcaster *)self->_notifier broadcastProxyForTargets:v59 messageContext:v19 protocol:&OBJC_PROTOCOL___IDSDaemonListenerProtocol];
        v67[2](v67, v32);
        [v15 setBroadcastPerformed:1];
      }
      else if (([v15 transient] & 1) == 0)
      {
        long long v35 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
        {
          id v36 = [v15 broadcastID];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v36;
          _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Broadcast: failed to deliver broadcast %lld to targets, enqueueing for later dispatch!\n", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          id v49 = [v15 broadcastID];
          _IDSLogTransport();
        }
        char v55 = v62 ^ 1;
        goto LABEL_49;
      }
    }
    char v55 = v62 ^ 1;
    if ((v62 & ~v56 | v64) != 1)
    {
LABEL_60:
      if (!v66 && (v55 & 1) == 0) {
        [(IDSDaemon *)self _launchServiceOnDemand:v68];
      }

LABEL_64:
      if (v65)
      {
        long long v47 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
        {
          id v48 = [v15 broadcastID];
          *(_DWORD *)buf = 134217984;
          *(void *)&uint8_t buf[4] = v48;
          _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_INFO, "Broadcast: done working on outgoing notification id %lld\n", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          [v15 broadcastID];
          _IDSLogTransport();
        }
      }
      goto LABEL_70;
    }
LABEL_49:
    long long v37 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v37, OS_LOG_TYPE_INFO))
    {
      id v38 = [v15 broadcastID];
      *(_DWORD *)buf = 134218242;
      *(void *)&uint8_t buf[4] = v38;
      __int16 v83 = 2112;
      id v84 = v16;
      _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_INFO, "Broadcast: Enqueueing broadcast %lld on topic %@ \n", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      id v49 = [v15 broadcastID];
      id v50 = v16;
      _IDSLogTransport();
    }
    pthread_mutex_lock(p_listenerLock);
    id v63 = [(IDSDaemon *)self broadcastAttemptQueueFromPriority:v60];
    id v39 = [v68 identifier];
    __int16 v40 = [v63 objectForKey:v39];

    if (!v40)
    {
      __int16 v40 = +[NSMutableArray array];
      id v41 = [v68 identifier];
      [v63 setObject:v40 forKey:v41];
    }
    id v61 = v40;
    objc_msgSend(v40, "addObject:", v15, v49, v50);
    if (v64)
    {
      __int16 v42 = 0;
    }
    else
    {
      __int16 v42 = +[NSDate date];
    }
    id v43 = [v15 broadcastID];
    *(void *)buf = 0xAAAAAAAAAAAAAAAALL;
    objc_initWeak((id *)buf, v15);
    v70[0] = _NSConcreteStackBlock;
    v70[1] = 3221225472;
    v70[2] = sub_10012D970;
    v70[3] = &unk_100983300;
    long long v77 = v67;
    objc_copyWeak(v78, (id *)buf);
    v70[4] = self;
    id v71 = v68;
    id v72 = v17;
    id v44 = v18;
    int v79 = v69;
    id v73 = v44;
    v78[1] = v43;
    id v74 = v16;
    id v75 = v19;
    id v45 = v42;
    id v76 = v45;
    long long v46 = objc_retainBlock(v70);
    [v15 setBroadcastBlock:v46];
    pthread_mutex_unlock(p_listenerLock);

    objc_destroyWeak(v78);
    objc_destroyWeak((id *)buf);

    goto LABEL_60;
  }
  int64_t v22 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Daemon was hard reset, not enqueuing broadcast", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport()) {
    _IDSLogTransport();
  }
LABEL_71:
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_launchServiceOnDemand:(id)a3
{
  id v3 = a3;
  id v4 = [v3 identifier];
  id v5 = [v3 launchMachServiceNotification];

  if (v5)
  {
    id v6 = [v3 launchMachServiceNotification];
    [v6 UTF8String];
    id v7 = (_xpc_connection_s *)IMXPCCreateConnectionForService();

    if (v7)
    {
      id v8 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        uint64_t v9 = [v3 launchMachServiceNotification];
        *(_DWORD *)buf = 138412546;
        id v19 = v9;
        __int16 v20 = 2112;
        id v21 = v4;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Broadcast: Broadcasting xpc wake notification %@ to awaken clients of %@.\n", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        id v15 = [v3 launchMachServiceNotification];
        _IDSLogTransport();
      }
      xpc_object_t v10 = xpc_dictionary_create(0, 0, 0);
      id v16 = [v3 launchMachServiceNotification];
      IMInsertNSStringsToXPCDictionary();

      xpc_connection_send_message(v7, v10);
      if (objc_msgSend(v4, "hasPrefix:", @"com.apple.private.alloy.continuity", v16, 0)) {
        kdebug_trace();
      }
    }
LABEL_18:

    goto LABEL_19;
  }
  id v11 = [v3 launchDarwinNotification];

  if (v11)
  {
    __int16 v12 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      id v13 = [v3 launchDarwinNotification];
      *(_DWORD *)buf = 138412546;
      id v19 = v13;
      __int16 v20 = 2112;
      id v21 = v4;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Broadcast: Broadcasting darwin notification %@ to awaken clients of %@.\n", buf, 0x16u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      id v14 = [v3 launchDarwinNotification];
      id v17 = v4;
      _IDSLogTransport();
    }
    objc_msgSend(v3, "launchDarwinNotification", v14, v17);
    id v7 = (_xpc_connection_s *) objc_claimAutoreleasedReturnValue();
    notify_post((const char *)[(_xpc_connection_s *)v7 UTF8String]);
    goto LABEL_18;
  }
LABEL_19:
}

- (void)launchOnDemandServicesForQueuedBroadcastAttempts
{
  id v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Launching on-demand services for queued broadcast attempts\n", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport()) {
    _IDSLogTransport();
  }
  uint64_t v4 = 0;
  p_listenerLock = &self->_listenerLock;
  do
  {
    uint64_t v17 = v4;
    int v5 = dword_1007941E8[v4];
    pthread_mutex_lock(p_listenerLock);
    id v6 = [(IDSDaemon *)self broadcastAttemptQueueFromPriority:v5];
    id v7 = [v6 allKeys];

    pthread_mutex_unlock(p_listenerLock);
    long long v21 = 0u;
    long long v22 = 0u;
    long long v19 = 0u;
    long long v20 = 0u;
    id v8 = v7;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
    if (v9)
    {
      uint64_t v10 = *(void *)v20;
      do
      {
        for (i = 0; i != v9; i = (char *)i + 1)
        {
          if (*(void *)v20 != v10) {
            objc_enumerationMutation(v8);
          }
          uint64_t v12 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          id v13 = [(IDSDaemon *)self serviceController];
          id v14 = [v13 serviceWithName:v12];

          if (v14)
          {
            [(IDSDaemon *)self _launchServiceOnDemand:v14];
          }
          else
          {
            id v15 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v24 = v12;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Couldn't find a valid service for the given identifier %@\n", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                uint64_t v16 = v12;
                _IDSLogTransport();
              }
            }
          }
        }
        id v9 = [v8 countByEnumeratingWithState:&v19 objects:v25 count:16];
      }
      while (v9);
    }

    uint64_t v4 = v17 + 1;
  }
  while (v17 != 3);
}

- (void)launchOnDemandServicesForNeedsLaunchOnNearbyDevicesChanged
{
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v3 = [(IDSDaemon *)self serviceController];
  uint64_t v4 = [v3 allServices];

  id v5 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v14;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v14 != v6) {
          objc_enumerationMutation(v4);
        }
        id v8 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v8 needsLaunchOnNearbyDevicesChanged])
        {
          id v9 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
          {
            uint64_t v10 = [v8 identifier];
            *(_DWORD *)buf = 136315394;
            id v18 = "-[IDSDaemon launchOnDemandServicesForNeedsLaunchOnNearbyDevicesChanged]";
            __int16 v19 = 2112;
            long long v20 = v10;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "%s: Launching on-demand service %@\n", buf, 0x16u);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
          {
            [v8 identifier];
            v12 = id v11 = "-[IDSDaemon launchOnDemandServicesForNeedsLaunchOnNearbyDevicesChanged]";
            _IDSLogTransport();
          }
          -[IDSDaemon _launchServiceOnDemand:](self, "_launchServiceOnDemand:", v8, v11, v12);
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v13 objects:v21 count:16];
    }
    while (v5);
  }
}

- (id)dequeueBroadcastWithID:(int64_t)a3 forMessageUUID:(id)a4 service:(id)a5 priority:(int64_t)a6
{
  id v10 = a4;
  id v11 = a5;
  pthread_mutex_lock(&self->_listenerLock);
  uint64_t v12 = [(IDSDaemon *)self broadcastAttemptQueueFromPriority:a6];
  if ([v12 count] && objc_msgSend(v11, "length"))
  {
    long long v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      LODWORD(buf) = 134217984;
      *(void *)((char *)&buf + 4) = a3;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_INFO, "Broadcast: Received request to drop enqueued broadcast %lld\n", (uint8_t *)&buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      id v20 = (id)a3;
      _IDSLogTransport();
    }
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v31 = 0x3032000000;
    BOOL v32 = sub_10012BB60;
    BOOL v33 = sub_10012BB70;
    id v34 = 0;
    long long v15 = [v12 objectForKey:v11];
    long long v21 = _NSConcreteStackBlock;
    uint64_t v22 = 3221225472;
    __int16 v23 = sub_10012EC88;
    uint64_t v24 = &unk_100983368;
    int64_t v27 = a3;
    id v25 = v10;
    p_long long buf = &buf;
    [v15 enumerateObjectsUsingBlock:&v21];
    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      long long v16 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        id v17 = [*(id *)(*((void *)&buf + 1) + 40) broadcastID];
        *(_DWORD *)int v28 = 134217984;
        id v29 = v17;
        _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_INFO, "Broadcast: Dropping enqueued broadcast %lld\n", v28, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        id v20 = [*(id *)(*((void *)&buf + 1) + 40) broadcastID];
        _IDSLogTransport();
      }
      objc_msgSend(v15, "removeObject:", *(void *)(*((void *)&buf + 1) + 40), v20, v21, v22, v23, v24);
      if (![v15 count])
      {
        [v12 removeObjectForKey:v11];

        long long v15 = 0;
      }
    }

    [(IDSDaemon *)self releaseBroadcastAttemptQueue:a6];
    pthread_mutex_unlock(&self->_listenerLock);
    id v18 = *(id *)(*((void *)&buf + 1) + 40);
    _Block_object_dispose(&buf, 8);
  }
  else
  {
    pthread_mutex_unlock(&self->_listenerLock);
    id v18 = 0;
  }

  return v18;
}

- (BOOL)_processQueuedBroadcastsForServices:(id)a3 priority:(int64_t)a4 forceRetry:(BOOL)a5
{
  BOOL v30 = a5;
  id v26 = a3;
  p_listenerLock = &self->_listenerLock;
  pthread_mutex_lock(&self->_listenerLock);
  int64_t v27 = self;
  int64_t v28 = a4;
  id v7 = [(IDSDaemon *)self broadcastAttemptQueueFromPriority:a4];
  if ([v7 count] && objc_msgSend(v26, "count"))
  {
    id v8 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412802;
      *(void *)&uint8_t buf[4] = v26;
      *(_WORD *)&unsigned char buf[12] = 2048;
      *(void *)&buf[14] = v28;
      *(_WORD *)&unsigned char buf[22] = 1024;
      BOOL v45 = v30;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Broadcast: Processing queued broadcasts for services %@ priority %ld forceRetry %d \n", buf, 0x1Cu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
    {
      int64_t v22 = v28;
      BOOL v23 = v30;
      id v21 = v26;
      _IDSLogTransport();
    }
    *(void *)long long buf = 0;
    *(void *)&buf[8] = buf;
    *(void *)&buf[16] = 0x2020000000;
    LOBYTE(v45) = 1;
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = [v26 copy];
    uint64_t v9 = 0;
    id v10 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
    if (v10)
    {
      uint64_t v11 = *(void *)v36;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v36 != v11) {
            objc_enumerationMutation(obj);
          }
          uint64_t v13 = *(void *)(*((void *)&v35 + 1) + 8 * i);
          long long v14 = objc_msgSend(v7, "objectForKey:", v13, v21, v22, v23);
          id v15 = objc_alloc_init((Class)NSMutableIndexSet);
          v31[0] = _NSConcreteStackBlock;
          v31[1] = 3221225472;
          v31[2] = sub_10012F1F8;
          v31[3] = &unk_1009833B0;
          BOOL v34 = v30;
          v31[4] = v13;
          BOOL v33 = buf;
          id v16 = v15;
          id v32 = v16;
          [v14 enumerateObjectsUsingBlock:v31];
          [v14 removeObjectsAtIndexes:v16];
          id v17 = [v14 count];
          if (![v14 count])
          {

            [v7 removeObjectForKey:v13];
            long long v14 = 0;
          }
          if (!*(unsigned char *)(*(void *)&buf[8] + 24)) {
            [(IDSDaemon *)v27 _locked_printBroadcastAttemptMapForPriority:v28 service:v13];
          }

          v9 += (uint64_t)v17;
        }
        id v10 = [obj countByEnumeratingWithState:&v35 objects:v43 count:16];
      }
      while (v10);
    }

    [(IDSDaemon *)v27 releaseBroadcastAttemptQueue:v28];
    pthread_mutex_unlock(p_listenerLock);
    if (v9)
    {
      id v18 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)id v39 = 134218242;
        uint64_t v40 = v9;
        __int16 v41 = 2112;
        id v42 = v26;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Processed queued broadcast attempts - %lu remaining for %@", v39, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
    BOOL v19 = *(unsigned char *)(*(void *)&buf[8] + 24) != 0;
    _Block_object_dispose(buf, 8);
  }
  else
  {
    pthread_mutex_unlock(p_listenerLock);
    BOOL v19 = 1;
  }

  return v19;
}

- (void)_dropQueuedBroadcastsForServices:(id)a3 priority:(int64_t)a4
{
  id v18 = a3;
  p_listenerLock = &self->_listenerLock;
  pthread_mutex_lock(&self->_listenerLock);
  int64_t v17 = a4;
  id v20 = [(IDSDaemon *)self broadcastAttemptQueueFromPriority:a4];
  if ([v20 count] && objc_msgSend(v18, "count"))
  {
    uint64_t v6 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      int64_t v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Dropping queued broadcasts for all services priority %ld", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        int64_t v14 = v17;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          int64_t v14 = v17;
          _IDSLogV();
        }
      }
    }
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    id obj = v18;
    id v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v7)
    {
      uint64_t v8 = *(void *)v23;
      do
      {
        for (i = 0; i != v7; i = (char *)i + 1)
        {
          if (*(void *)v23 != v8) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          uint64_t v11 = objc_msgSend(v10, "identifier", v14);
          uint64_t v12 = [v20 objectForKey:v11];

          v21[0] = _NSConcreteStackBlock;
          v21[1] = 3221225472;
          v21[2] = sub_10012F7F0;
          v21[3] = &unk_1009833D8;
          v21[4] = v10;
          [v12 enumerateObjectsUsingBlock:v21];
          [v12 removeAllObjects];
        }
        id v7 = [obj countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v7);
    }

    uint64_t v13 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      int64_t v28 = v17;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Dropped queued broadcasts for all services priority %ld", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        int64_t v14 = v17;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          int64_t v14 = v17;
          _IDSLogV();
        }
      }
    }
    -[IDSDaemon releaseBroadcastAttemptQueue:](self, "releaseBroadcastAttemptQueue:", v17, v14);
    pthread_mutex_unlock(p_listenerLock);
  }
  else
  {
    pthread_mutex_unlock(p_listenerLock);
  }
}

- (BOOL)_shouldLaunchClientForCapabilities:(unsigned int)a3
{
  return ((kIDSListenerCapConsumesLaunchOnDemandOutgoingMessageUpdates | kIDSListenerCapConsumesLaunchOnDemandIncomingMessages | kIDSListenerCapConsumesLaunchOnDemandSessionMessages | kIDSListenerCapConsumesLaunchOnDemandIncomingData | kIDSListenerCapConsumesLaunchOnDemandIncomingProtobuf | kIDSListenerCapConsumesLaunchOnDemandIncomingResource | kIDSListenerCapConsumesLaunchOnDemandEngram | kIDSListenerCapConsumesLaunchOnDemandNetworkAvailableHint | kIDSListenerCapConsumesLaunchOnDemandAccessoryReportMessages | kIDSListenerCapConsumesLaunchOnDemandGroupSessionParticipantUpdates | kIDSListenerCapConsumesLaunchOnDemandPendingMessageUpdates | kIDSListenerCapConsumesLaunchOnDemandInvitationUpdates | kIDSListenerCapConsumesLaunchOnDemandPendingResource) & a3) != 0;
}

+ (void)logAccessWarningForAccount:(id)a3 withService:(id)a4 entitlement:(id)a5 clientEntitlements:(id)a6 logMessage:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  if (([v15 isEqualToString:@"Allowing wildcard access"] & 1) == 0)
  {
    id v16 = [objc_alloc((Class)NSString) initWithFormat:@"IDS access warning: %@ for service: %@ entitlement: %@ account: %@ entitlements: %@", v15, v12, v13, v11, v14];
    int64_t v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    id v18 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v20 = v16;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "%@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
  }
}

+ (BOOL)entitlementDictionary:(id)a3 isEntitledToAccessService:(id)a4 forEntitlement:(id)a5 forAccount:(id)a6 shouldWarn:(BOOL)a7
{
  BOOL v7 = a7;
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  if (![v12 count])
  {
    LOBYTE(v17) = 0;
    CFStringRef v18 = @"############### No entitlements found";
    if (!@"############### No entitlements found") {
      goto LABEL_18;
    }
    goto LABEL_16;
  }
  id v16 = [v12 objectForKey:v14];
  if (v13 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    unsigned int v17 = [v16 containsObject:v13];
    if (v17) {
      CFStringRef v18 = 0;
    }
    else {
      CFStringRef v18 = @"############### Service not found";
    }
  }
  else
  {
    objc_opt_class();
    if ((objc_opt_isKindOfClass() & 1) != 0
      && ([v14 isEqualToIgnoringCase:kIDSRegistrationEntitlement] & 1) == 0)
    {
      LOBYTE(v17) = [v16 BOOLValue];
      if (v13) {
        CFStringRef v18 = @"Allowing wildcard access";
      }
      else {
        CFStringRef v18 = 0;
      }
    }
    else
    {
      LOBYTE(v17) = 0;
      CFStringRef v18 = @"############### Unknown entitlement type";
    }
  }

  if (v18)
  {
LABEL_16:
    if (v7) {
      [a1 logAccessWarningForAccount:v15 withService:v13 entitlement:v14 clientEntitlements:v12 logMessage:v18];
    }
  }
LABEL_18:

  return v17;
}

- (BOOL)client:(id)a3 isEntitledToAccessService:(id)a4 forAnyOfEntitlements:(id)a5 shouldWarn:(BOOL)a6
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v12 = [v8 entitlements];
  if ([v12 hasAnyEntitlements]) {
    unsigned __int8 v13 = [v12 hasService:v9 forAnyOfEntitlements:v10];
  }
  else {
    unsigned __int8 v13 = 0;
  }

  return v13;
}

- (void)_pidSuspended:(int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67109120;
    LODWORD(v12) = v3;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "PID: %d was suspended", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v10 = v3;
    _IDSLogV();
  }
  pthread_mutex_lock(&self->_listenerLock);
  uint64_t v6 = (char *)[(NSMutableArray *)self->_listeners count];
  if ((uint64_t)(v6 - 1) >= 0)
  {
    do
    {
      BOOL v7 = -[NSMutableArray objectAtIndexedSubscript:](self->_listeners, "objectAtIndexedSubscript:", --v6, v10);
      if (![v7 type])
      {
        id v8 = [v7 remoteObject];
        if ([v8 pid] == v3)
        {
          id v9 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 67109120;
            LODWORD(v12) = v3;
            _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "PID: %d was suspended", buf, 8u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            uint64_t v10 = v3;
            _IDSLogV();
          }
          -[IDSDaemon removeListenerWithRemoteXPCObject:](self, "removeListenerWithRemoteXPCObject:", v8, v10);
          [v8 invalidate];
        }
      }
    }
    while ((uint64_t)v6 > 0);
  }
  pthread_mutex_unlock(&self->_listenerLock);
}

- (void)registerForNotificationsOnServices:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  uint64_t v30 = 0;
  uint64_t v31 = &v30;
  uint64_t v32 = 0x2020000000;
  char v33 = 0;
  uint64_t v24 = 0;
  long long v25 = &v24;
  uint64_t v26 = 0x3032000000;
  int64_t v27 = sub_10012BB60;
  int64_t v28 = sub_10012BB70;
  id v29 = (id)0xAAAAAAAAAAAAAAAALL;
  id v29 = [v6 mutableCopy];
  uint64_t v18 = 0;
  BOOL v19 = &v18;
  uint64_t v20 = 0x3032000000;
  id v21 = sub_10012BB60;
  long long v22 = sub_10012BB70;
  id v23 = 0;
  id v8 = [v7 localObject];
  uint64_t v10 = _NSConcreteStackBlock;
  uint64_t v11 = 3221225472;
  uint64_t v12 = sub_10013056C;
  unsigned __int8 v13 = &unk_100983490;
  id v15 = &v30;
  id v16 = &v18;
  unsigned int v17 = &v24;
  id v9 = v6;
  id v14 = v9;
  [(IDSDaemon *)self validateListenerForLocalObject:v8 andPerformBlock:&v10];

  if (*((unsigned char *)v31 + 24))
  {
    -[IDSDaemon _resetBroadcastQueuesForServices:](self, "_resetBroadcastQueuesForServices:", v25[5], v10, v11, v12, v13);
    [(IDSDaemon *)self _flushBroadcastQueuesForServices:v19[5] existingServices:v19[5]];
  }

  _Block_object_dispose(&v18, 8);
  _Block_object_dispose(&v24, 8);

  _Block_object_dispose(&v30, 8);
}

- (void)setWakingPushPriority:(int64_t)a3 forTopic:(id)a4 messageContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  uint64_t v10 = [(IDSPersistentMap *)self->_wakingPushPriorityStore objectForKey:v8];
  uint64_t v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 134218498;
    int64_t v18 = a3;
    __int16 v19 = 2112;
    id v20 = v8;
    __int16 v21 = 2112;
    long long v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Setting wakingPushPriority %ld for topic %@, was %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v15 = v8;
    id v16 = v10;
    int64_t v14 = a3;
    _IDSLogV();
  }
  if (!v10 || (int)[v10 intValue] != a3)
  {
    wakingPushPriorityStore = self->_wakingPushPriorityStore;
    unsigned __int8 v13 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a3, v14, v15, v16);
    [(IDSPersistentMap *)wakingPushPriorityStore setObject:v13 forKey:v8];

    [(IDSDaemon *)self updateTopics];
  }
}

- (void)removeWakingPushPriorityForServices:(id)a3
{
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v4 = a3;
  id v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        uint64_t v8 = *(void *)(*((void *)&v12 + 1) + 8 * i);
        id v9 = [(IDSPersistentMap *)self->_wakingPushPriorityStore objectForKey:v8];

        if (v9)
        {
          uint64_t v10 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_DEBUG))
          {
            *(_DWORD *)long long buf = 138412290;
            uint64_t v17 = v8;
            _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEBUG, "Removing waking push priority for service %@ in store", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            uint64_t v11 = v8;
            _IDSLogV();
          }
          -[IDSPersistentMap removeObjectForKey:](self->_wakingPushPriorityStore, "removeObjectForKey:", v8, v11);
        }
      }
      id v5 = [v4 countByEnumeratingWithState:&v12 objects:v18 count:16];
    }
    while (v5);
  }
}

- (void)xpcObject:(id)a3 objectContext:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v9 objectForKey:@"object-type"];
  if ([v11 isEqualToIgnoringCase:@"socket"])
  {
    long long v12 = [v9 objectForKey:@"socket-type"];
    if (![v12 isEqualToIgnoringCase:@"session-socket"])
    {
LABEL_19:

      goto LABEL_20;
    }
    long long v13 = [v9 objectForKey:@"sessionID"];
    long long v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      uint64_t v26 = v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "received socket %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    if (xpc_get_type(v8) != (xpc_type_t)&_xpc_type_fd)
    {
      _IMWarn();
LABEL_18:

      goto LABEL_19;
    }
    unsigned int v24 = xpc_fd_dup(v8);
    long long v15 = +[IDSDSessionController sharedInstance];
    id v16 = [v15 sessionWithUniqueID:v13];

    if (v16)
    {
      uint64_t v17 = [v16 accountID];
      int64_t v18 = [v10 localObject];
      __int16 v19 = [(IDSDaemon *)self accountWithIdentifier:v17 localObject:v18 requiredEntitlement:kIDSSessionEntitlement];
      BOOL v20 = v19 == 0;

      if (!v20)
      {
        __int16 v21 = [v9 objectForKey:@"raw-socket"];
        id v22 = [v21 BOOLValue];

        [v16 startListeningOnClientSocket:v24 isRawSocket:v22];
        goto LABEL_18;
      }
    }
    else
    {
      id v23 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        uint64_t v26 = v13;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "IDSDaemon - Could not find session with uniqueID %@ to setup client socket, ignoring...", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }

    goto LABEL_18;
  }
LABEL_20:
}

- (void)openSocketWithOptions:(id)a3 messageContext:(id)a4
{
  id v5 = (__CFString *)a3;
  id v6 = a4;
  id v7 = [(__CFString *)v5 objectForKey:@"service"];
  id v53 = [(__CFString *)v5 objectForKey:IDSOpenSocketOptionConnectionUUIDKey];
  id v50 = [(__CFString *)v5 objectForKey:IDSOpenSocketOptionAWDMetricsClientInitKey];
  id v51 = [(__CFString *)v5 objectForKey:IDSOpenSocketOptionPriorityKey];
  if (_IDSSupportsDirectMessaging())
  {
    id v8 = [(__CFString *)v5 objectForKey:IDSOpenSocketOptionIsDirectMsgSocket];
    unsigned int v9 = [v8 BOOLValue];
  }
  else
  {
    unsigned int v9 = 0;
  }
  id v10 = [v6 localObject];
  unsigned __int8 v11 = [(IDSDaemon *)self validateListenerForLocalObject:v10 andCheckEntitlement:kIDSSelfSessionEntitlement forAccessToServiceWithIdentifier:v7];

  if (v11) {
    goto LABEL_5;
  }
  if (v9)
  {
    BOOL v16 = [v51 integerValue] == (id)300;
    uint64_t v17 = [v6 localObject];
    if (v16)
    {
      if ([(IDSDaemon *)self validateListenerForLocalObject:v17 andCheckEntitlement:kIDSUrgentPriorityMessagingEntitlement forAccessToServiceWithIdentifier:v7])
      {
      }
      else
      {
        long long v37 = [v6 localObject];
        unsigned __int8 v38 = [(IDSDaemon *)self validateListenerForLocalObject:v37 andCheckEntitlement:kIDSHighPriorityMessagingEntitlement forAccessToServiceWithIdentifier:v7];

        if ((v38 & 1) == 0) {
          goto LABEL_63;
        }
      }
    }
    else
    {
      unsigned int v19 = [(IDSDaemon *)self validateListenerForLocalObject:v17 andCheckEntitlement:kIDSMessagingEntitlement forAccessToServiceWithIdentifier:v7];

      if (!v19) {
        goto LABEL_63;
      }
    }
LABEL_5:
    kdebug_trace();
    id v49 = [(__CFString *)v5 objectForKey:@"completionHandlerID"];
    long long v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412802;
      id v63 = v5;
      __int16 v64 = 2112;
      id v65 = v6;
      __int16 v66 = 2112;
      long long v67 = v49;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "opensocket [%@] context=[%@] (handlerID:%@) ***\n", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v44 = v6;
      long long v46 = v49;
      id v42 = v5;
      _IDSLogV();
    }
    long long v13 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v5, v42, v44, v46);
    long long v14 = [v13 objectForKey:IDSDevicePropertyDefaultPairedDevice];
    unsigned int v15 = [v14 BOOLValue];

    if (v15)
    {
      [v13 setObject:kIDSDefaultPairedDeviceID forKey:IDSOpenSocketOptionCBUUIDKey];
    }
    else
    {
      int64_t v18 = [v13 objectForKey:IDSDevicePropertyNSUUID];
      if (v18)
      {
        [v13 setObject:v18 forKey:IDSOpenSocketOptionCBUUIDKey];
      }
      else
      {
        BOOL v20 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "opensocket was called for a non-default device without nsuuid!!!!!!!!", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        [v13 setObject:kIDSDefaultPairedDeviceID forKey:IDSOpenSocketOptionCBUUIDKey];
      }
    }
    uint64_t v21 = IDSOpenSocketOptionClientIDKey;
    id v22 = [(__CFString *)v5 objectForKey:IDSOpenSocketOptionClientIDKey];
    if (v22)
    {
      id v23 = [v6 localObject];
      unsigned int v24 = sub_100128E38(v22, v23);
      [v13 setObject:v24 forKey:v21];
    }
    if ((v9 ^ 1 | v15) != 1) {
      goto LABEL_62;
    }
    uint64_t v25 = [(__CFString *)v5 objectForKey:IDSOpenSocketOptionClientNameKey];
    CFStringRef v26 = @"client";
    if (v25) {
      CFStringRef v26 = (const __CFString *)v25;
    }
    id v48 = (__CFString *)v26;
    int64_t v27 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v63 = v48;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "%@ directly calling UTUN's openSocketWithOptions", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v43 = v48;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v43 = v48;
          _IDSLogV();
        }
      }
    }
    long long v47 = 0;
    if (v53 && v50)
    {
      int64_t v28 = +[IDSDeviceConnectionAWDMetrics sharedInstance];
      long long v47 = [v28 awdMetricsForConnectionUUID:v53];
      ids_monotonic_time();
      double v30 = v29;
      uint64_t v31 = [(__CFString *)v5 objectForKey:@"service"];
      [v28 setServiceName:v31 forConnectionUUID:v53];

      [v50 doubleValue];
      objc_msgSend(v28, "setClientInitTime:forConnectionUUID:", v53);
      [v28 setDaemonOpenSocketTime:v53 forConnectionUUID:v30];
    }
    if (!v51)
    {
      long long v35 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v63 = v7;
        __int16 v64 = 2112;
        id v65 = v53;
        _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "%@ didn't specify any priority for %@. This will use the default priority queue.", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          id v43 = v7;
          BOOL v45 = v53;
          _IDSLogTransport();
          if (_IDSShouldLog())
          {
            id v43 = v7;
            BOOL v45 = v53;
            _IDSLogV();
          }
        }
      }
      long long v36 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", 200, v43, v45);
      uint64_t v33 = (uint64_t)[v36 integerValue];

      goto LABEL_61;
    }
    uint64_t v32 = (uint64_t)[v51 integerValue];
    uint64_t v33 = v32;
    if (v32 > 599)
    {
      if (v32 != 600 && v32 != 700)
      {
        BOOL v34 = v32 == 800;
LABEL_56:
        uint64_t v33 = 300;
        if (!v34) {
          uint64_t v33 = 200;
        }
        goto LABEL_61;
      }
      uint64_t v33 = 300;
    }
    else if (v32 != 100 && v32 != 200)
    {
      BOOL v34 = v32 == 300;
      goto LABEL_56;
    }
LABEL_61:
    objc_msgSend(v13, "setObject:forKey:", &__kCFBooleanTrue, IDSOpenSocketOptionSetAllowlistUUIDForStreamingSocket, v43);
    id v39 = +[IDSUTunController sharedInstance];
    uint64_t v40 = +[IDSDaemonPriorityQueueController sharedInstance];
    __int16 v41 = [v40 queueForPriority:v33];
    v54[0] = _NSConcreteStackBlock;
    v54[1] = 3221225472;
    v54[2] = sub_1001317EC;
    v54[3] = &unk_1009834B8;
    char v55 = v7;
    char v61 = v15;
    int v56 = v5;
    id v57 = v49;
    id v58 = self;
    id v59 = v6;
    id v60 = v53;
    [v39 openSocketWithOptions:v13 queue:v41 completionHandler:v54];

LABEL_62:
  }
LABEL_63:
}

- (void)closeSocketWithOptions:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v33 = a4;
  id v7 = [v6 objectForKey:@"service"];
  uint64_t v32 = [v6 objectForKey:IDSOpenSocketOptionPriorityKey];
  if (_IDSSupportsDirectMessaging())
  {
    id v8 = [v6 objectForKey:IDSOpenSocketOptionIsDirectMsgSocket];
    unsigned int v9 = [v8 BOOLValue];
  }
  else
  {
    unsigned int v9 = 0;
  }
  id v10 = [v33 localObject];
  unsigned __int8 v11 = [(IDSDaemon *)self validateListenerForLocalObject:v10 andCheckEntitlement:kIDSSelfSessionEntitlement forAccessToServiceWithIdentifier:v7];

  if (v11) {
    goto LABEL_5;
  }
  if (v9)
  {
    BOOL v16 = [v32 integerValue] == (id)300;
    uint64_t v17 = [v33 localObject];
    if (v16)
    {
      if ([(IDSDaemon *)self validateListenerForLocalObject:v17 andCheckEntitlement:kIDSUrgentPriorityMessagingEntitlement forAccessToServiceWithIdentifier:v7])
      {
      }
      else
      {
        double v29 = [v33 localObject];
        unsigned __int8 v30 = [(IDSDaemon *)self validateListenerForLocalObject:v29 andCheckEntitlement:kIDSHighPriorityMessagingEntitlement forAccessToServiceWithIdentifier:v7];

        if ((v30 & 1) == 0) {
          goto LABEL_35;
        }
      }
    }
    else
    {
      unsigned int v19 = [(IDSDaemon *)self validateListenerForLocalObject:v17 andCheckEntitlement:kIDSMessagingEntitlement forAccessToServiceWithIdentifier:v7];

      if (!v19) {
        goto LABEL_35;
      }
    }
LABEL_5:
    long long v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v38 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "closesocket [%@]\n", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v31 = v6;
      _IDSLogV();
    }
    long long v13 = +[NSMutableDictionary dictionaryWithDictionary:](NSMutableDictionary, "dictionaryWithDictionary:", v6, v31);
    long long v14 = [v13 objectForKey:IDSDevicePropertyDefaultPairedDevice];
    unsigned int v15 = [v14 BOOLValue];

    if (v15)
    {
      [v13 setObject:kIDSDefaultPairedDeviceID forKey:IDSOpenSocketOptionCBUUIDKey];
    }
    else
    {
      int64_t v18 = [v13 objectForKey:IDSDevicePropertyNSUUID];
      if (v18)
      {
        [v13 setObject:v18 forKey:IDSOpenSocketOptionCBUUIDKey];
      }
      else
      {
        BOOL v20 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "opensocket was called for a non-default device without nsuuid!!!!!!!!", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        [v13 setObject:kIDSDefaultPairedDeviceID forKey:IDSOpenSocketOptionCBUUIDKey];
      }

      if (v9) {
        goto LABEL_34;
      }
    }
    uint64_t v21 = [v6 objectForKey:IDSOpenSocketOptionAWDMetricsSuccessKey];
    if (objc_opt_respondsToSelector()) {
      unint64_t v22 = (unint64_t)[v21 BOOLValue];
    }
    else {
      unint64_t v22 = v21 != 0;
    }
    id v23 = [v6 objectForKey:IDSOpenSocketOptionAWDMetricsClientOpenSocketCompletionKey];
    uint64_t v24 = [v6 objectForKey:IDSOpenSocketOptionConnectionUUIDKey];
    uint64_t v25 = (void *)v24;
    if (v23 && v24)
    {
      CFStringRef v26 = +[IDSDeviceConnectionAWDMetrics sharedInstance];
      [v23 doubleValue];
      objc_msgSend(v26, "setClientOpenSocketCompletionTime:forConnectionUUID:", v25);
      [v26 setSuccess:v22 forConnectionUUID:v25];
      [v26 reportAndRemoveForConnectionUUID:v25];
    }
    int64_t v27 = +[IDSUTunController sharedInstance];
    int64_t v28 = im_primary_queue();
    v34[0] = _NSConcreteStackBlock;
    v34[1] = 3221225472;
    v34[2] = sub_100132260;
    v34[3] = &unk_1009834E0;
    id v35 = v7;
    char v36 = v15;
    [v27 closeSocketWithOptions:v13 queue:v28 completionHandler:v34];

LABEL_34:
  }
LABEL_35:
}

- (void)getDeliveryStatsWithMessageContext:(id)a3
{
  id v3 = a3;
  id v4 = +[IDSUTunDeliveryController sharedInstance];
  id v5 = [v4 syncPriorityMessageStatistics];
  int64_t v18 = [v4 defaultPriorityMessageStatistics];
  id v6 = [v4 urgentPriorityMessageStatistics];
  id v7 = [v4 urgentCloudPriorityMessageStatistics];
  id v8 = [v4 sendingMessageStatistics];
  unsigned int v9 = [v4 queuedIncomingMessageDictionary];
  id v10 = +[IDSUTunController sharedInstance];
  id v11 = [v10 copyLinkStatsDict];

  id v12 = objc_alloc_init((Class)NSMutableDictionary);
  long long v13 = v12;
  if (v5) {
    [v12 setObject:v5 forKey:@"syncMessagesStats"];
  }
  if (v18) {
    [v13 setObject:v18 forKey:@"defaultMessagesStats"];
  }
  if (v6) {
    [v13 setObject:v6 forKey:@"urgentMessagesStats"];
  }
  if (v7) {
    [v13 setObject:v7 forKey:@"urgentCloudMessagesStats"];
  }
  if (v8) {
    [v13 setObject:v8 forKey:@"sendingMessageStats"];
  }
  if (v9) {
    [v13 setObject:v9 forKey:@"queuedIncomingMessages"];
  }
  if (v11) {
    [v13 setObject:v11 forKey:@"linkStats"];
  }

  long long v14 = [v3 localObject];
  unsigned int v15 = [(IDSDaemon *)self broadcasterForLocalObject:v14 messageContext:v3];

  if (v15)
  {
    BOOL v16 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Broadcasting delivery stats to client", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    objc_msgSend(v15, "deliveryStats:", v13, self);
  }
}

- (void)persistPendingInvitation:(id)a3 forService:(id)a4 withUniqueID:(id)a5 messageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [v13 localObject];
  unsigned int v15 = [(IDSDaemon *)self validateListenerForLocalObject:v14 andCheckEntitlement:kIDSMessagingEntitlement forAccessToServiceWithIdentifier:v11];

  BOOL v16 = [(IDSDaemon *)self serviceController];
  uint64_t v17 = [v16 serviceWithIdentifier:v11];

  if (v17 && ([v17 isInvitationService] & v15) == 1)
  {
    int64_t v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v26 = v12;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "persistPendingInvitation: persisting invitation {%@} for service {%@}", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v23 = v12;
      id v24 = v11;
      _IDSLogV();
    }
    -[IDSInvitationStore persistPendingInvitation:forService:withUniqueID:](self->_invitationStore, "persistPendingInvitation:forService:withUniqueID:", v10, v11, v12, v23, v24);
  }
  else
  {
    unsigned int v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = [v17 isInvitationService];
      CFStringRef v21 = @"NO";
      *(_DWORD *)long long buf = 138413058;
      id v26 = v12;
      if (v20) {
        CFStringRef v22 = @"YES";
      }
      else {
        CFStringRef v22 = @"NO";
      }
      if (v15) {
        CFStringRef v21 = @"YES";
      }
      __int16 v27 = 2112;
      id v28 = v11;
      __int16 v29 = 2112;
      CFStringRef v30 = v22;
      __int16 v31 = 2112;
      CFStringRef v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "persistPendingInvitation: Cannot persist invitation {%@} for service {%@} isInvitationService {%@}, isMessagingEntitled {%@} ", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      [v17 isInvitationService];
      _IDSLogV();
    }
  }
}

- (void)persistReceivedInvitation:(id)a3 forService:(id)a4 withUniqueID:(id)a5 messageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  long long v14 = [v13 localObject];
  unsigned int v15 = [(IDSDaemon *)self validateListenerForLocalObject:v14 andCheckEntitlement:kIDSMessagingEntitlement forAccessToServiceWithIdentifier:v11];

  BOOL v16 = [(IDSDaemon *)self serviceController];
  uint64_t v17 = [v16 serviceWithIdentifier:v11];

  if (v17 && ([v17 isInvitationService] & v15) == 1)
  {
    int64_t v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v26 = v12;
      __int16 v27 = 2112;
      id v28 = v11;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "persistReceivedInvitation: persisting invitation {%@} for service {%@}", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v23 = v12;
      id v24 = v11;
      _IDSLogV();
    }
    -[IDSInvitationStore persistReceivedInvitation:forService:withUniqueID:](self->_invitationStore, "persistReceivedInvitation:forService:withUniqueID:", v10, v11, v12, v23, v24);
  }
  else
  {
    unsigned int v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v20 = [v17 isInvitationService];
      CFStringRef v21 = @"NO";
      *(_DWORD *)long long buf = 138413058;
      id v26 = v12;
      if (v20) {
        CFStringRef v22 = @"YES";
      }
      else {
        CFStringRef v22 = @"NO";
      }
      if (v15) {
        CFStringRef v21 = @"YES";
      }
      __int16 v27 = 2112;
      id v28 = v11;
      __int16 v29 = 2112;
      CFStringRef v30 = v22;
      __int16 v31 = 2112;
      CFStringRef v32 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "persistReceivedInvitation: Cannot persist invitation {%@} for service {%@} isInvitationService {%@}, isMessagingEntitled {%@} ", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      [v17 isInvitationService];
      _IDSLogV();
    }
  }
}

- (void)removePendingInvitation:(id)a3 forService:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 localObject];
  unsigned int v12 = [(IDSDaemon *)self validateListenerForLocalObject:v11 andCheckEntitlement:kIDSMessagingEntitlement forAccessToServiceWithIdentifier:v9];

  id v13 = [(IDSDaemon *)self serviceController];
  long long v14 = [v13 serviceWithIdentifier:v9];

  if (v14 && ([v14 isInvitationService] & v12) == 1)
  {
    unsigned int v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "removePendingInvitation: removing invitations with identifiers {%@} for service {%@}", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v20 = v8;
      id v21 = v9;
      _IDSLogV();
    }
    -[IDSInvitationStore removePendingInvitation:forService:](self->_invitationStore, "removePendingInvitation:forService:", v8, v9, v20, v21);
  }
  else
  {
    BOOL v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v17 = [v14 isInvitationService];
      CFStringRef v18 = @"NO";
      *(_DWORD *)long long buf = 138413058;
      id v23 = v8;
      if (v17) {
        CFStringRef v19 = @"YES";
      }
      else {
        CFStringRef v19 = @"NO";
      }
      if (v12) {
        CFStringRef v18 = @"YES";
      }
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      CFStringRef v27 = v19;
      __int16 v28 = 2112;
      CFStringRef v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "removePendingInvitation: Cannot remove invitations {%@} for service {%@} isInvitationService {%@}, isMessagingEntitled {%@} ", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      [v14 isInvitationService];
      _IDSLogV();
    }
  }
}

- (void)removeReceivedInvitation:(id)a3 forService:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 localObject];
  unsigned int v12 = [(IDSDaemon *)self validateListenerForLocalObject:v11 andCheckEntitlement:kIDSMessagingEntitlement forAccessToServiceWithIdentifier:v9];

  id v13 = [(IDSDaemon *)self serviceController];
  long long v14 = [v13 serviceWithIdentifier:v9];

  if (v14 && ([v14 isInvitationService] & v12) == 1)
  {
    unsigned int v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v23 = v8;
      __int16 v24 = 2112;
      id v25 = v9;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "removeReceivedInvitation: removing invitations with identifiers {%@} for service {%@}", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v20 = v8;
      id v21 = v9;
      _IDSLogV();
    }
    -[IDSInvitationStore removeReceivedInvitation:forService:](self->_invitationStore, "removeReceivedInvitation:forService:", v8, v9, v20, v21);
  }
  else
  {
    BOOL v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v17 = [v14 isInvitationService];
      CFStringRef v18 = @"NO";
      *(_DWORD *)long long buf = 138413058;
      id v23 = v8;
      if (v17) {
        CFStringRef v19 = @"YES";
      }
      else {
        CFStringRef v19 = @"NO";
      }
      if (v12) {
        CFStringRef v18 = @"YES";
      }
      __int16 v24 = 2112;
      id v25 = v9;
      __int16 v26 = 2112;
      CFStringRef v27 = v19;
      __int16 v28 = 2112;
      CFStringRef v29 = v18;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "removeReceivedInvitation: Cannot remove invitations {%@} for service {%@} isInvitationService {%@}, isMessagingEntitled {%@} ", buf, 0x2Au);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      [v14 isInvitationService];
      _IDSLogV();
    }
  }
}

- (void)tryForceFamilyFetchWithMessageContext:(id)a3
{
  id v4 = [(IDSDaemon *)self familyManager];
  unsigned int v5 = [v4 canForceFamilyFetch];

  if (v5)
  {
    id v6 = [(IDSDaemon *)self familyManager];
    [v6 forceFamilyFetch];
  }
}

- (id)deliveryControllerQueuedIncomingMessageDictionary:(id)a3
{
  p_listenerLock = &self->_listenerLock;
  pthread_mutex_lock(&self->_listenerLock);
  unsigned int v5 = [(NSMutableDictionary *)self->_queuedBroadcastAttempts allKeys];
  id v6 = [v5 count];
  if (v6)
  {
    id v7 = +[NSMutableDictionary dictionaryWithCapacity:v6];
    long long v19 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    long long v22 = 0u;
    CFStringRef v18 = v5;
    id v8 = v5;
    id v9 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
    if (v9)
    {
      id v10 = v9;
      uint64_t v11 = *(void *)v20;
      do
      {
        for (i = 0; i != v10; i = (char *)i + 1)
        {
          if (*(void *)v20 != v11) {
            objc_enumerationMutation(v8);
          }
          uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
          long long v14 = -[NSMutableDictionary objectForKey:](self->_queuedBroadcastAttempts, "objectForKey:", v13, v18);
          id v15 = [v14 count];

          BOOL v16 = +[NSNumber numberWithUnsignedInteger:v15];
          [v7 setObject:v16 forKey:v13];
        }
        id v10 = [v8 countByEnumeratingWithState:&v19 objects:v23 count:16];
      }
      while (v10);
    }

    unsigned int v5 = v18;
  }
  else
  {
    id v7 = 0;
  }
  pthread_mutex_unlock(p_listenerLock);

  return v7;
}

- (void)_notifyTinkerServicesOfPairedDevice:(id)a3 withBlock:(id)a4
{
  id v6 = a3;
  id v7 = (void (**)(id, void *, void *, void *, BOOL))a4;
  if (v7)
  {
    id v8 = [v6 objectForKey:IDSDevicePropertyPushToken];
    id v25 = v6;
    if (v8)
    {
      id v9 = [v6 objectForKey:IDSDevicePropertyIdentities];
      BOOL v10 = (unint64_t)[v9 count] > 1;
    }
    else
    {
      BOOL v10 = 0;
    }

    uint64_t v11 = [(IDSDaemon *)self serviceController];
    unsigned int v12 = [v11 allTinkerServices];

    if (!v10)
    {
      uint64_t v13 = objc_msgSend(v12, "__imArrayByFilteringWithBlock:", &stru_100983520);

      unsigned int v12 = (void *)v13;
    }
    long long v30 = 0u;
    long long v31 = 0u;
    long long v28 = 0u;
    long long v29 = 0u;
    id obj = v12;
    id v14 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
    if (v14)
    {
      id v15 = v14;
      uint64_t v27 = *(void *)v29;
      do
      {
        for (i = 0; i != v15; i = (char *)i + 1)
        {
          if (*(void *)v29 != v27) {
            objc_enumerationMutation(obj);
          }
          unsigned int v17 = *(void **)(*((void *)&v28 + 1) + 8 * i);
          id v18 = objc_alloc_init((Class)IMMessageContext);
          long long v19 = +[IDSDaemon sharedInstance];
          long long v20 = [v17 pushTopic];
          long long v21 = [v19 broadcasterForTopic:v20 ignoreServiceListener:1 messageContext:v18];

          id v23 = [v17 identifier];
          __int16 v24 = [v17 pushTopic];
          v7[2](v7, v21, v23, v24, [v17 adHocServiceType] == 2);
        }
        id v15 = [obj countByEnumeratingWithState:&v28 objects:v32 count:16];
      }
      while (v15);
    }

    id v6 = v25;
  }
}

- (void)didAddPairedDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 objectForKey:IDSDevicePropertyPairingType];
  id v6 = [v5 integerValue];

  if (v6 == (id)1)
  {
    uint64_t v7 = IDSDevicePropertyIdentities;
    id v8 = [v4 objectForKey:IDSDevicePropertyIdentities];
    id v9 = +[IDSPairedDevice iCloudIdentitiesFromIdentities:v8];

    BOOL v10 = [v4 objectForKey:v7];
    uint64_t v11 = +[IDSPairedDevice localIdentitiesFromIdentities:v10];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_1001339D0;
    v14[3] = &unk_100983548;
    id v15 = v4;
    id v16 = v11;
    id v17 = v9;
    id v12 = v9;
    id v13 = v11;
    [(IDSDaemon *)self _notifyTinkerServicesOfPairedDevice:v15 withBlock:v14];
  }
}

- (void)didRemovePairedDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 objectForKey:IDSDevicePropertyPairingType];
  id v6 = [v5 integerValue];

  if (v6 == (id)1)
  {
    uint64_t v7 = IDSDevicePropertyIdentities;
    id v8 = [v4 objectForKey:IDSDevicePropertyIdentities];
    id v9 = +[IDSPairedDevice iCloudIdentitiesFromIdentities:v8];

    BOOL v10 = [v4 objectForKey:v7];
    uint64_t v11 = +[IDSPairedDevice localIdentitiesFromIdentities:v10];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100133CB8;
    v14[3] = &unk_100983548;
    id v15 = v4;
    id v16 = v11;
    id v17 = v9;
    id v12 = v9;
    id v13 = v11;
    [(IDSDaemon *)self _notifyTinkerServicesOfPairedDevice:v15 withBlock:v14];
  }
}

- (void)didUpdatePairedDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 objectForKey:IDSDevicePropertyPairingType];
  id v6 = [v5 integerValue];

  if (v6 == (id)1)
  {
    uint64_t v7 = IDSDevicePropertyIdentities;
    id v8 = [v4 objectForKey:IDSDevicePropertyIdentities];
    id v9 = +[IDSPairedDevice iCloudIdentitiesFromIdentities:v8];

    BOOL v10 = [v4 objectForKey:v7];
    uint64_t v11 = +[IDSPairedDevice localIdentitiesFromIdentities:v10];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100133FA0;
    v14[3] = &unk_100983548;
    id v15 = v4;
    id v16 = v11;
    id v17 = v9;
    id v12 = v9;
    id v13 = v11;
    [(IDSDaemon *)self _notifyTinkerServicesOfPairedDevice:v15 withBlock:v14];
  }
}

- (void)didUpdateProtocolForPairedDevice:(id)a3
{
  id v4 = a3;
  unsigned int v5 = [v4 objectForKey:IDSDevicePropertyPairingType];
  id v6 = [v5 integerValue];

  if (v6 == (id)1)
  {
    uint64_t v7 = IDSDevicePropertyIdentities;
    id v8 = [v4 objectForKey:IDSDevicePropertyIdentities];
    id v9 = +[IDSPairedDevice iCloudIdentitiesFromIdentities:v8];

    BOOL v10 = [v4 objectForKey:v7];
    uint64_t v11 = +[IDSPairedDevice localIdentitiesFromIdentities:v10];

    v14[0] = _NSConcreteStackBlock;
    v14[1] = 3221225472;
    v14[2] = sub_100134288;
    v14[3] = &unk_100983548;
    id v15 = v4;
    id v16 = v11;
    id v17 = v9;
    id v12 = v9;
    id v13 = v11;
    [(IDSDaemon *)self _notifyTinkerServicesOfPairedDevice:v15 withBlock:v14];
  }
}

- (void)registrationHashProcessor:(id)a3 didFlushCacheForService:(id)a4 remoteURI:(id)a5 localURI:(id)a6 guid:(id)a7
{
  id v23 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  id v16 = [(IDSDaemon *)self serviceController];
  id v17 = [v16 serviceWithIdentifier:v12];

  if (v17)
  {
    id v18 = objc_alloc_init((Class)IMMessageContext);
    long long v19 = [v17 pushTopic];
    long long v20 = [(IDSDaemon *)self broadcasterForTopic:v19 ignoreServiceListener:1 messageContext:v18];

    long long v22 = [v17 pushTopic];
    [v20 didFlushCacheForService:v22 remoteURI:v13 fromURI:v14 guid:v15];
  }
}

- (IDSRegistrationHashProcessor)queryUpdateNotifier
{
  return self->_queryUpdateNotifier;
}

- (IDSCertifiedDeliveryReplayCommitter)replayStateCommitter
{
  return self->_replayStateCommitter;
}

- (IDSRegistrationConductor)registrationConductor
{
  return self->_registrationConductor;
}

- (IDSTransparentEndpointViewer)transparentEndpointViewer
{
  return self->_transparentEndpointViewer;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_transparentEndpointViewer, 0);
  objc_storeStrong((id *)&self->_registrationConductor, 0);
  objc_storeStrong((id *)&self->_senderKeyDistributionManager, 0);
  objc_storeStrong((id *)&self->_persistenceManager, 0);
  objc_storeStrong((id *)&self->_processingStoredIncomingRemoteMessagesControlCategories, 0);
  objc_storeStrong((id *)&self->_replayKeyToMessageUUIDMap, 0);
  objc_storeStrong((id *)&self->_blastDoorConnectionHelper, 0);
  objc_storeStrong((id *)&self->_firewallNotificationCenter, 0);
  objc_storeStrong((id *)&self->_wakingPushPriorityStore, 0);
  objc_storeStrong((id *)&self->_invitationStore, 0);
  objc_storeStrong((id *)&self->_opportunisticDeliveryController, 0);
  objc_storeStrong((id *)&self->_replayStateCommitter, 0);
  objc_storeStrong((id *)&self->_queryUpdateNotifier, 0);
  objc_storeStrong((id *)&self->_signInResponder, 0);
  objc_storeStrong((id *)&self->_homeKitMessageDelivery, 0);
  objc_storeStrong((id *)&self->_internalQueue, 0);
  objc_storeStrong(&self->_stateMonitor, 0);
  objc_storeStrong((id *)&self->_incomingLocalPowerAssertion, 0);
  objc_storeStrong((id *)&self->_remoteIncomingGUIDs, 0);
  objc_storeStrong((id *)&self->_localIncomingGUIDs, 0);
  objc_storeStrong((id *)&self->_pendingIncomingResources, 0);
  objc_storeStrong((id *)&self->_pendingIncomingAttachments, 0);
  objc_storeStrong((id *)&self->_pendingOutgoingAttachments, 0);
  objc_storeStrong((id *)&self->_incomingMessageMultiQueue, 0);
  objc_storeStrong((id *)&self->_nonUrgentInternetSendTimer, 0);
  objc_storeStrong((id *)&self->_forcedGDRTokens, 0);
  objc_storeStrong((id *)&self->_messagesReceivedDuringStorage, 0);
  objc_storeStrong((id *)&self->_restrictedMessageCleanupTimer, 0);
  objc_storeStrong((id *)&self->_storageTimer, 0);
  objc_storeStrong((id *)&self->_birthDate, 0);
  objc_storeStrong((id *)&self->_notifier, 0);
  objc_storeStrong((id *)&self->_listenerCachedCommands, 0);
  objc_storeStrong((id *)&self->_listenerCachedServices, 0);
  objc_storeStrong((id *)&self->_syncQueuedBroadcastAttempts, 0);
  objc_storeStrong((id *)&self->_defaultQueuedBroadcastAttempts, 0);
  objc_storeStrong((id *)&self->_urgentQueuedBroadcastAttempts, 0);
  objc_storeStrong((id *)&self->_queuedBroadcastAttempts, 0);

  objc_storeStrong((id *)&self->_listeners, 0);
}

- (void)authenticatePhoneWithRequestUUID:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 localObject];
  uint64_t v9 = kIDSPhoneNumberAuthenticationPrivateEntitlement;
  unsigned __int8 v10 = [(IDSDaemon *)self validateListenerForLocalObject:v8 andCheckEntitlement:kIDSPhoneNumberAuthenticationPrivateEntitlement];

  uint64_t v11 = +[IMRGLog sms];
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      id v13 = [v7 localObject];
      id v14 = [v13 processName];
      *(_DWORD *)long long buf = 138412546;
      id v25 = v6;
      __int16 v26 = 2112;
      uint64_t v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Authenticating phone {uuid: %@, client: %@}", buf, 0x16u);
    }
    id v15 = sub_10017A588();
    id v16 = [v15 authenticatePhoneUser];

    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_10017A5DC;
    v21[3] = &unk_1009841D8;
    v21[4] = self;
    id v22 = v7;
    id v23 = v6;
    [v16 registerResultBlock:v21];
  }
  else
  {
    if (v12)
    {
      id v17 = [v7 localObject];
      id v18 = [v17 processName];
      *(_DWORD *)long long buf = 138412290;
      id v25 = v18;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Missing phone number authentication entitlement -- failing authenticate phone request {client: %@}", buf, 0xCu);
    }
    long long v19 = [v7 localObject];
    id v16 = [(IDSDaemon *)self broadcasterForLocalObject:v19 messageContext:v7];

    if (v16)
    {
      long long v20 = [(IDSDaemon *)self _errorForMissingEntitlement:v9];
      [v16 didAuthenticatePhoneWithAuthenticationCertificateData:0 requestUUID:v6 error:v20];
    }
  }
}

- (void)generatePhoneAuthenticationSignatureOverData:(id)a3 withRequestUUID:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [v10 localObject];
  uint64_t v12 = kIDSPhoneNumberAuthenticationEntitlement;
  unsigned __int8 v13 = [(IDSDaemon *)self validateListenerForLocalObject:v11 andCheckEntitlement:kIDSPhoneNumberAuthenticationEntitlement];

  id v14 = +[IMRGLog sms];
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      id v16 = [v10 localObject];
      id v17 = [v16 processName];
      if (v8) {
        CFStringRef v18 = @"YES";
      }
      else {
        CFStringRef v18 = @"NO";
      }
      *(_DWORD *)long long buf = 138413058;
      id v30 = v9;
      __int16 v31 = 2112;
      CFStringRef v32 = v17;
      __int16 v33 = 2112;
      CFStringRef v34 = v18;
      __int16 v35 = 2048;
      id v36 = [v8 length];
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Generating phone authentication signature over data {uuid: %@, client: %@, data: %@, length: %lu}", buf, 0x2Au);
    }
    long long v19 = sub_10017A588();
    long long v20 = [v19 localPhoneAuthenticationCertificates];

    v25[0] = _NSConcreteStackBlock;
    v25[1] = 3221225472;
    v25[2] = sub_10017A9D0;
    v25[3] = &unk_100984200;
    void v25[4] = self;
    id v26 = v10;
    id v27 = v8;
    id v28 = v9;
    [v20 registerResultBlock:v25];
  }
  else
  {
    if (v15)
    {
      long long v21 = [v10 localObject];
      id v22 = [v21 processName];
      *(_DWORD *)long long buf = 138412290;
      id v30 = v22;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Missing phone number authentication entitlement -- failing phone authentication signature request {client: %@}", buf, 0xCu);
    }
    id v23 = [v10 localObject];
    long long v20 = [(IDSDaemon *)self broadcasterForLocalObject:v23 messageContext:v10];

    if (v20)
    {
      __int16 v24 = [(IDSDaemon *)self _errorForMissingEntitlement:v12];
      [v20 didGeneratePhoneAuthenticationSignature:0 nonce:0 certificates:0 labelIDs:0 inputData:0 requestUUID:v9 error:v24];
    }
  }
}

- (void)requestCarrierTokenForSubscriptionSource:(id)a3 IMEI:(id)a4 carrierNonce:(id)a5 requestUUID:(id)a6 messageContext:(id)a7
{
  id v12 = a3;
  id v106 = a4;
  id v105 = a5;
  id v13 = a6;
  id v14 = a7;
  BOOL v15 = +[IMRGLog sms];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    id v16 = [v14 localObject];
    id v17 = [v16 processName];
    *(_DWORD *)long long buf = 138413314;
    id v122 = v13;
    __int16 v123 = 2112;
    v124 = v17;
    __int16 v125 = 2112;
    id v126 = v12;
    __int16 v127 = 2112;
    id v128 = v106;
    __int16 v129 = 2112;
    id v130 = v105;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Requesting carrier token {uuid: %@, client: %@, subscriptionSource: %@, IMEI: %@, carrierNonce: %@}", buf, 0x34u);
  }
  CFStringRef v18 = [v14 localObject];
  uint64_t v19 = kIDSPhoneNumberAuthenticationEntitlement;
  unsigned __int8 v20 = [(IDSDaemon *)self validateListenerForLocalObject:v18 andCheckEntitlement:kIDSPhoneNumberAuthenticationEntitlement];

  if ((v20 & 1) == 0)
  {
    __int16 v66 = +[IMRGLog sms];
    if (os_log_type_enabled(v66, OS_LOG_TYPE_DEFAULT))
    {
      long long v67 = [v14 localObject];
      long long v68 = [v67 processName];
      *(_DWORD *)long long buf = 138412290;
      id v122 = v68;
      _os_log_impl((void *)&_mh_execute_header, v66, OS_LOG_TYPE_DEFAULT, "Missing phone number authentication entitlement -- failing phone carrier token request {client: %@}", buf, 0xCu);
    }
    uint64_t v69 = [v14 localObject];
    long long v21 = [(IDSDaemon *)self broadcasterForLocalObject:v69 messageContext:v14];

    id v23 = [(IDSDaemon *)self _errorForMissingEntitlement:v19];
    long long v70 = v21;
    id v71 = v13;
    id v72 = v23;
    goto LABEL_29;
  }
  if (!v106 || !v105)
  {
    uint64_t v73 = IDSRegistrationControlErrorDomain;
    NSErrorUserInfoKey v119 = NSDebugDescriptionErrorKey;
    CFStringRef v120 = @"Request was missing IMEI or carrier nonce";
    id v74 = +[NSDictionary dictionaryWithObjects:&v120 forKeys:&v119 count:1];
    long long v21 = +[NSError errorWithDomain:v73 code:1 userInfo:v74];

    id v75 = [v14 localObject];
    id v23 = [(IDSDaemon *)self broadcasterForLocalObject:v75 messageContext:v14];

    long long v70 = v23;
    id v71 = v13;
    id v72 = v21;
LABEL_29:
    [(IDSGetSIMAuthTokenMessage *)v70 didRequestCarrierTokenString:0 requestUUID:v71 error:v72];
    goto LABEL_38;
  }
  id v104 = v12;
  long long v21 = objc_alloc_init(IDSGetSIMAuthTokenMessage);
  id v22 = +[FTDeviceSupport sharedInstance];
  id v23 = [v22 model];

  __int16 v24 = +[FTDeviceSupport sharedInstance];
  uint64_t v25 = [v24 productOSVersion];

  id v26 = +[FTDeviceSupport sharedInstance];
  uint64_t v27 = [v26 productBuildVersion];

  [(IDSGetSIMAuthTokenMessage *)v21 setHardwareVersion:v23];
  id v102 = (void *)v25;
  [(IDSGetSIMAuthTokenMessage *)v21 setOsVersion:v25];
  id v103 = (void *)v27;
  [(IDSGetSIMAuthTokenMessage *)v21 setSoftwareVersion:v27];
  [(IDSGetSIMAuthTokenMessage *)v21 setCarrierNonce:v105];
  [(IDSGetSIMAuthTokenMessage *)v21 setIMEI:v106];
  id v28 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
  uint64_t v29 = [v28 pushToken];

  [(IDSGetSIMAuthTokenMessage *)v21 setPushToken:v29];
  char v30 = IDSAssignPushIdentityToMessage();
  if (v29 && (v30 & 1) != 0)
  {
    __int16 v31 = +[IDSCTAdapter sharedInstance];
    id v112 = 0;
    CFStringRef v32 = [v31 currentSIMsWithError:&v112];
    id v100 = v112;

    id v99 = (void *)v29;
    id v101 = v32;
    if (v32)
    {
      v110[0] = _NSConcreteStackBlock;
      v110[1] = 3221225472;
      v110[2] = sub_10017BA84;
      v110[3] = &unk_100984228;
      id v111 = v104;
      __int16 v33 = objc_msgSend(v32, "__imArrayByFilteringWithBlock:", v110);
      CFStringRef v34 = [v33 firstObject];

      __int16 v35 = +[IDSDaemon sharedInstance];
      id v36 = [v35 registrationConductor];
      long long v37 = [v36 userStore];

      uint64_t v98 = v34;
      id v38 = [v34 SIMIdentifier];
      id v39 = [v37 userWithUniqueIdentifier:v38];

      id v95 = v37;
      uint64_t v40 = [v37 authenticationCertificateForUser:v39];
      __int16 v41 = +[IMRGLog sms];
      if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138413058;
        id v122 = v98;
        __int16 v123 = 2112;
        v124 = v101;
        __int16 v125 = 2112;
        id v126 = v39;
        __int16 v127 = 2112;
        id v128 = v40;
        _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Determined phone number identifier to use for carrier token request {matchingSIM: %@, availableSIMs:%@, phoneUser: %@, phoneAuthenticationCertificate: %@}", buf, 0x2Au);
      }

      v96 = v40;
      id v97 = v39;
      if (v39 && v40)
      {
        id v42 = +[IMRGLog sms];
        if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          id v122 = v39;
          __int16 v123 = 2112;
          v124 = v40;
          _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Adding phone number account to the carrier token request {phoneUser: %@, phoneAuthenticationCertificate: %@}", buf, 0x16u);
        }

        id v43 = [v39 realmPrefixedIdentifier];
        id v44 = [v40 dataRepresentation];
        BOOL v45 = +[IDSRegistrationKeyManager sharedInstance];
        id v46 = [v45 identityPrivateKey];
        long long v47 = +[IDSRegistrationKeyManager sharedInstance];
        -[IDSGetSIMAuthTokenMessage addAuthUserID:certificate:privateKey:publicKey:](v21, "addAuthUserID:certificate:privateKey:publicKey:", v43, v44, v46, [v47 identityPublicKey]);

        id v48 = +[IDSDServiceController sharedInstance];
        id v49 = [v48 serviceWithIdentifier:@"com.apple.private.alloy.multiplex1"];

        id v50 = +[IDSDAccountController sharedInstance];
        id v51 = [v50 appleIDAccountOnService:v49];

        dispatch_time_t v94 = v51;
        BOOL v52 = [v51 registration];
        id v53 = [v52 authenticationCert];

        if (v53)
        {
          id v93 = v49;
          uint64_t v54 = [v94 registration];
          char v55 = +[IMRGLog sms];
          if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            id v122 = v54;
            _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "Adding Apple ID account to the carrier token request {registration: %@}", buf, 0xCu);
          }

          int v56 = [v54 idsUserID];
          id v57 = [v54 authenticationCert];
          id v58 = +[IDSRegistrationKeyManager sharedInstance];
          __int16 v92 = v54;
          id v59 = [v58 identityPrivateKey];
          id v60 = +[IDSRegistrationKeyManager sharedInstance];
          -[IDSGetSIMAuthTokenMessage addAuthUserID:certificate:privateKey:publicKey:](v21, "addAuthUserID:certificate:privateKey:publicKey:", v56, v57, v59, [v60 identityPublicKey]);

          id v49 = v93;
        }
        sub_1001DE1A4();
        v107[0] = _NSConcreteStackBlock;
        v107[1] = 3221225472;
        v107[2] = sub_10017BAF0;
        v107[3] = &unk_100984250;
        v107[4] = self;
        id v108 = v14;
        id v109 = v13;
        [(IDSGetSIMAuthTokenMessage *)v21 setCompletionBlock:v107];
        ct_green_tea_logger_create_static();
        char v61 = getCTGreenTeaOsLogHandle();
        unsigned int v62 = v61;
        if (v61 && os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_INFO, "Transmitting phone number", buf, 2u);
        }

        id v12 = v104;
        id v63 = v99;
        if (qword_100A4A898 != -1) {
          dispatch_once(&qword_100A4A898, &stru_100984290);
        }
        __int16 v64 = v102;
        [(id)qword_100A4A890 sendMessage:v21];

        id v65 = v94;
      }
      else
      {
        uint64_t v89 = IDSRegistrationControlErrorDomain;
        NSErrorUserInfoKey v113 = NSDebugDescriptionErrorKey;
        CFStringRef v114 = @"The selected phone number account is not currently authenticated";
        __int16 v90 = +[NSDictionary dictionaryWithObjects:&v114 forKeys:&v113 count:1];
        id v49 = +[NSError errorWithDomain:v89 code:1 userInfo:v90];

        int v91 = [v14 localObject];
        id v65 = [(IDSDaemon *)self broadcasterForLocalObject:v91 messageContext:v14];

        [v65 didRequestCarrierTokenString:0 requestUUID:v13 error:v49];
        id v12 = v104;
        __int16 v64 = v102;
        id v63 = v99;
      }

      id v86 = v111;
    }
    else
    {
      __int16 v83 = +[IMRGLog sms];
      if (os_log_type_enabled(v83, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v122 = v100;
        _os_log_impl((void *)&_mh_execute_header, v83, OS_LOG_TYPE_DEFAULT, "Failed to fetch SIMs {SIMFetchError: %@}", buf, 0xCu);
      }

      uint64_t v84 = IDSRegistrationControlErrorDomain;
      NSErrorUserInfoKey v115 = NSDebugDescriptionErrorKey;
      CFStringRef v116 = @"Unable to locate SIMs prior to fetching auth cert";
      __int16 v85 = +[NSDictionary dictionaryWithObjects:&v116 forKeys:&v115 count:1];
      id v86 = +[NSError errorWithDomain:v84 code:1 userInfo:v85];

      id v87 = [v14 localObject];
      __int16 v88 = [(IDSDaemon *)self broadcasterForLocalObject:v87 messageContext:v14];

      [v88 didRequestCarrierTokenString:0 requestUUID:v13 error:v86];
      id v12 = v104;
      __int16 v64 = v102;
      id v63 = v99;
    }

    v80 = v100;
    id v82 = v101;
  }
  else
  {
    id v76 = (void *)v29;
    uint64_t v77 = IDSRegistrationControlErrorDomain;
    NSErrorUserInfoKey v117 = NSDebugDescriptionErrorKey;
    CFStringRef v118 = @"Unable to set push token or push identity on carrier token request message";
    long long v78 = +[NSDictionary dictionaryWithObjects:&v118 forKeys:&v117 count:1];
    uint64_t v79 = v77;
    id v63 = v76;
    v80 = +[NSError errorWithDomain:v79 code:1 userInfo:v78];

    id v81 = [v14 localObject];
    id v82 = [(IDSDaemon *)self broadcasterForLocalObject:v81 messageContext:v14];

    [v82 didRequestCarrierTokenString:0 requestUUID:v13 error:v80];
    id v12 = v104;
    __int16 v64 = v102;
  }

LABEL_38:
}

- (id)_errorForMissingEntitlement:(id)a3
{
  id v3 = a3;
  id v4 = [objc_alloc((Class)NSString) initWithFormat:@"IDS phone number authentication SPI requires entitlement: %@", v3];

  id v5 = objc_alloc((Class)NSError);
  uint64_t v6 = IDSRegistrationControlErrorDomain;
  NSErrorUserInfoKey v10 = NSDebugDescriptionErrorKey;
  id v11 = v4;
  id v7 = +[NSDictionary dictionaryWithObjects:&v11 forKeys:&v10 count:1];
  id v8 = [v5 initWithDomain:v6 code:3 userInfo:v7];

  return v8;
}

- (void)setPhoneUserSubscriptionSource:(id)a3 withRequestUUID:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 localObject];
  uint64_t v12 = kIDSPhoneNumberAuthenticationEntitlement;
  unsigned __int8 v13 = [(IDSDaemon *)self validateListenerForLocalObject:v11 andCheckEntitlement:kIDSPhoneNumberAuthenticationEntitlement];

  id v14 = +[IMRGLog sms];
  BOOL v15 = os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT);
  if (v13)
  {
    if (v15)
    {
      id v16 = [v10 localObject];
      id v17 = [v16 processName];
      int v29 = 138412802;
      id v30 = v9;
      __int16 v31 = 2112;
      CFStringRef v32 = v17;
      __int16 v33 = 2112;
      id v34 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Setting phone user subscription source {uuid: %@, client: %@, subscriptionSource: %@}", (uint8_t *)&v29, 0x20u);
    }
    CFStringRef v18 = +[FTSelectedPNRSubscription sharedInstance];
    uint64_t v19 = [v18 setSelectedPhoneNumberRegistrationSubscriptionNumber:v8];

    unsigned __int8 v20 = [v10 localObject];
    long long v21 = [(IDSDaemon *)self broadcasterForLocalObject:v20 messageContext:v10];

    if (!v21) {
      goto LABEL_11;
    }
    id v22 = v21;
    id v23 = v8;
    id v24 = v9;
    uint64_t v25 = v19;
LABEL_10:
    [v22 didSetPhoneUserSubscriptionSource:v23 requestUUID:v24 error:v25];
LABEL_11:

    goto LABEL_12;
  }
  if (v15)
  {
    id v26 = [v10 localObject];
    uint64_t v27 = [v26 processName];
    int v29 = 138412290;
    id v30 = v27;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Missing phone number authentication entitlement -- failing phone user subscription source request {client: %@}", (uint8_t *)&v29, 0xCu);
  }
  id v28 = [v10 localObject];
  uint64_t v19 = [(IDSDaemon *)self broadcasterForLocalObject:v28 messageContext:v10];

  if (v19)
  {
    long long v21 = [(IDSDaemon *)self _errorForMissingEntitlement:v12];
    id v22 = v19;
    id v23 = 0;
    id v24 = v9;
    uint64_t v25 = v21;
    goto LABEL_10;
  }
LABEL_12:
}

- (void)fetchPhoneUserSubscriptionSourceWithRequestUUID:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = [v7 localObject];
  uint64_t v9 = kIDSPhoneNumberAuthenticationEntitlement;
  unsigned __int8 v10 = [(IDSDaemon *)self validateListenerForLocalObject:v8 andCheckEntitlement:kIDSPhoneNumberAuthenticationEntitlement];

  id v11 = +[IMRGLog sms];
  BOOL v12 = os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT);
  if (v10)
  {
    if (v12)
    {
      unsigned __int8 v13 = [v7 localObject];
      id v14 = [v13 processName];
      *(_DWORD *)long long buf = 138412546;
      id v27 = v6;
      __int16 v28 = 2112;
      int v29 = v14;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Fetching phone user subscription source {uuid: %@, client: %@}", buf, 0x16u);
    }
    BOOL v15 = +[FTSelectedPNRSubscription sharedInstance];
    id v25 = 0;
    id v16 = [v15 selectedPhoneNumberRegistrationSubscriptionWithError:&v25];
    id v17 = v25;

    if (v16)
    {
      CFStringRef v18 = +[NSNumber numberWithInteger:[(IDSDaemon *)self _subscriptionSourceNumberForContext:v16]];
    }
    else
    {
      id v22 = +[IMRGLog sms];
      if (os_log_type_enabled(v22, OS_LOG_TYPE_FAULT)) {
        sub_100713BF4((uint64_t)v17, v22);
      }

      CFStringRef v18 = 0;
    }
    id v23 = [v7 localObject];
    id v24 = [(IDSDaemon *)self broadcasterForLocalObject:v23 messageContext:v7];

    if (v24) {
      [v24 didFetchPhoneUserSubscriptionSource:v18 requestUUID:v6 error:v17];
    }

    goto LABEL_16;
  }
  if (v12)
  {
    uint64_t v19 = [v7 localObject];
    unsigned __int8 v20 = [v19 processName];
    *(_DWORD *)long long buf = 138412290;
    id v27 = v20;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Missing phone number authentication entitlement -- failing phone user subscription source request {client: %@}", buf, 0xCu);
  }
  long long v21 = [v7 localObject];
  CFStringRef v18 = [(IDSDaemon *)self broadcasterForLocalObject:v21 messageContext:v7];

  if (v18)
  {
    id v17 = [(IDSDaemon *)self _errorForMissingEntitlement:v9];
    [v18 didSetPhoneUserSubscriptionSource:0 requestUUID:v6 error:v17];
LABEL_16:
  }
}

- (int64_t)_subscriptionSourceNumberForContext:(id)a3
{
  int64_t result = (int64_t)[a3 slotID];
  if (result != 2) {
    return result == 1;
  }
  return result;
}

- (id)_IMTransferServiceController
{
  if (qword_100A4A9F8 != -1) {
    dispatch_once(&qword_100A4A9F8, &stru_100984EB8);
  }
  v0 = (void *)qword_100A4A9F0;

  return [v0 sharedInstance];
}

- (id)accountWithIdentifier:(id)a3 localObject:(id)a4 requiredEntitlement:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [(IDSDaemon *)self accountController];
  BOOL v12 = [v11 accountWithUniqueID:v8];

  if (v12)
  {
    unsigned __int8 v13 = [v12 service];
    id v14 = [v13 identifier];

    if ([(IDSDaemon *)self validateListenerForLocalObject:v9 andCheckEntitlement:v10 forAccessToServiceWithIdentifier:v14])
    {
      id v15 = v12;
    }
    else
    {
      id v17 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412802;
        id v20 = v9;
        __int16 v21 = 2112;
        id v22 = v10;
        __int16 v23 = 2112;
        id v24 = v14;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "accountWithIdentifier failed entitlement check {localObject: %@, entitlement: %@, serviceIdentifier: %@}", buf, 0x20u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      id v15 = 0;
    }
  }
  else
  {
    id v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v20 = v8;
      __int16 v21 = 2112;
      id v22 = v9;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "accountWithIdentifier could not find IDSDAccount {identifier: %@, localObject: %@}", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    IMLogBacktrace();
    id v15 = 0;
  }

  return v15;
}

- (void)setupAccountWithLoginID:(id)a3 serviceName:(id)a4 accountType:(int)a5 accountConfig:(id)a6 authToken:(id)a7 password:(id)a8 transactionID:(id)a9 messageContext:(id)a10
{
  id v15 = (IDSDAccount *)a3;
  id v16 = (IDSDAccount *)a4;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  uint64_t v22 = [v21 localObject];
  __int16 v23 = +[IMRGLog registration];
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138413570;
    CFStringRef v116 = v15;
    __int16 v117 = 2112;
    CFStringRef v118 = v16;
    __int16 v119 = 1024;
    int v120 = a5;
    __int16 v121 = 2112;
    id v122 = v17;
    __int16 v123 = 2112;
    id v124 = v20;
    __int16 v125 = 2112;
    uint64_t v126 = v22;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "IDSDaemon: SetupAccountWithLoginID %@ serviceName %@ accountType %d accountConfig %@ transactionID %@ localObject %@", buf, 0x3Au);
  }

  if (![(IDSDaemon *)self validateListenerForLocalObject:v22 andCheckEntitlement:kIDSRegistrationEntitlement forAccessToServiceWithIdentifier:v16])
  {
    id v30 = (void *)v22;
    __int16 v31 = +[IMRGLog warning];
    if (os_log_type_enabled(v31, OS_LOG_TYPE_FAULT)) {
      sub_1007161E0();
    }

    id v32 = objc_alloc((Class)NSError);
    uint64_t v33 = IDSAccountRegistrationErrorDomain;
    uint64_t v34 = 103;
    goto LABEL_17;
  }
  if (![(IDSDAccount *)v15 length])
  {
    id v30 = (void *)v22;
    __int16 v35 = +[IMRGLog warning];
    if (os_log_type_enabled(v35, OS_LOG_TYPE_FAULT)) {
      sub_100715FC8();
    }

    id v32 = objc_alloc((Class)NSError);
    uint64_t v33 = IDSAccountRegistrationErrorDomain;
    uint64_t v34 = 102;
LABEL_17:
    id v36 = [v32 initWithDomain:v33 code:v34 userInfo:0];
    long long v37 = self;
    id v38 = v30;
    id v39 = v30;
    goto LABEL_18;
  }
  v96 = (void *)v22;
  if ([(IDSDAccount *)v16 length])
  {
    id v24 = [(IDSDaemon *)self serviceController];
    id v25 = [v24 serviceWithIdentifier:v16];

    id v95 = v18;
    if (v25)
    {
      if (![v25 adHocServiceType])
      {
        dispatch_time_t v94 = v25;
        if ([v25 disabledOnTinkerWatch]
          && (+[IDSPairingManager sharedInstance],
              id v44 = objc_claimAutoreleasedReturnValue(),
              unsigned int v45 = [v44 isCurrentDeviceTinkerConfiguredWatch],
              v44,
              v45))
        {
          id v46 = +[IMRGLog warning];
          if (os_log_type_enabled(v46, OS_LOG_TYPE_FAULT)) {
            sub_100716100();
          }

          id v47 = objc_alloc((Class)NSError);
          uint64_t v48 = IDSAccountRegistrationErrorDomain;
          uint64_t v49 = 107;
        }
        else
        {
          if (IDSIsValidAccountType())
          {
            id v50 = [v17 objectForKey:kIDSServiceDefaultsAuthorizationIDKey];
            __int16 v92 = [v17 objectForKey:kIDSServiceDefaultsSelfHandleKey];
            if ([v18 length])
            {
              id v51 = +[IMRGLog registration];
              if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                CFStringRef v116 = v15;
                _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "  ** Setting auth token for loginID: %@", buf, 0xCu);
              }

              sub_1001C1878(v18, v15, v50, v92, v16);
            }
            if ([v19 length])
            {
              BOOL v52 = +[IMRGLog registration];
              if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412290;
                CFStringRef v116 = v15;
                _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "  ** Setting password for loginID: %@", buf, 0xCu);
              }

              sub_1001C16A0(v19, v15, v50, v16);
            }
            __int16 v88 = v50;
            id v53 = +[IDSDAccountController sharedInstance];
            uint64_t v54 = [v53 accountWithServiceName:v16 loginID:v15];

            id v89 = v19;
            id v93 = v21;
            if (v54)
            {
              [(IDSDAccount *)v54 _updateAccountWithAccountInfo:v17];
              char v55 = v54;
            }
            else
            {
              id v57 = +[IMRGLog registration];
              if (os_log_type_enabled(v57, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138412546;
                CFStringRef v116 = v16;
                __int16 v117 = 2112;
                CFStringRef v118 = v15;
                _os_log_impl((void *)&_mh_execute_header, v57, OS_LOG_TYPE_DEFAULT, "Creating new account with service name %@ login ID %@", buf, 0x16u);
              }

              id v58 = [IDSDAccount alloc];
              id v59 = +[NSString stringGUID];
              id v60 = [(IDSDAccount *)v58 initWithLoginID:v15 service:v94 uniqueID:v59 accountType:a5 accountConfig:v17];

              char v61 = +[IDSDAccountController sharedInstance];
              [v61 addAccount:v60];

              unsigned int v62 = [(IDSDAccount *)v60 linkedAccounts];
              if (![v62 count])
              {
                __int16 v85 = v62;
                id v86 = v20;
                id v63 = v17;
                id v87 = v16;
                __int16 v64 = v15;
                id v65 = +[IDSDServiceController sharedInstance];
                __int16 v90 = v60;
                __int16 v66 = [(IDSDAccount *)v60 service];
                long long v67 = [v65 linkedServicesForService:v66];

                long long v112 = 0u;
                long long v113 = 0u;
                long long v110 = 0u;
                long long v111 = 0u;
                id v68 = v67;
                id v69 = [v68 countByEnumeratingWithState:&v110 objects:v114 count:16];
                if (v69)
                {
                  id v70 = v69;
                  uint64_t v71 = *(void *)v111;
                  do
                  {
                    for (i = 0; i != v70; i = (char *)i + 1)
                    {
                      if (*(void *)v111 != v71) {
                        objc_enumerationMutation(v68);
                      }
                      uint64_t v73 = *(void **)(*((void *)&v110 + 1) + 8 * i);
                      if ([v73 disabledOnTinkerWatch])
                      {
                        id v74 = +[IDSPairingManager sharedInstance];
                        unsigned __int8 v75 = [v74 isCurrentDeviceTinkerConfiguredWatch];

                        if (v75) {
                          continue;
                        }
                      }
                      id v76 = [IDSDAccount alloc];
                      uint64_t v77 = +[NSString stringGUID];
                      long long v78 = [(IDSDAccount *)v76 initWithLoginID:v64 service:v73 uniqueID:v77 accountType:a5 accountConfig:v63];

                      uint64_t v79 = +[IMRGLog registration];
                      if (os_log_type_enabled(v79, OS_LOG_TYPE_DEFAULT))
                      {
                        *(_DWORD *)long long buf = 138412290;
                        CFStringRef v116 = v78;
                        _os_log_impl((void *)&_mh_execute_header, v79, OS_LOG_TYPE_DEFAULT, "  Creating a linked account: %@", buf, 0xCu);
                      }

                      v80 = +[IDSDAccountController sharedInstance];
                      [v80 addAccount:v78];
                    }
                    id v70 = [v68 countByEnumeratingWithState:&v110 objects:v114 count:16];
                  }
                  while (v70);
                }

                id v15 = v64;
                id v20 = v86;
                id v16 = v87;
                id v17 = v63;
                id v60 = v90;
                unsigned int v62 = v85;
              }

              char v55 = v60;
            }
            int v91 = v55;
            v104[0] = _NSConcreteStackBlock;
            v104[1] = 3221225472;
            v104[2] = sub_1001C2838;
            v104[3] = &unk_1009852B0;
            id v81 = v20;
            id v105 = v81;
            id v82 = v93;
            id v106 = v82;
            id v38 = v96;
            id v83 = v96;
            id v107 = v83;
            id v108 = 0;
            id v109 = self;
            [(IDSDAccount *)v55 setupAccountWithCompletionBlock:v104];
            uint64_t v84 = [(IDSDAccount *)v55 linkedAccounts];
            v98[0] = _NSConcreteStackBlock;
            v98[1] = 3221225472;
            v98[2] = sub_1001C2B88;
            v98[3] = &unk_1009852D8;
            id v99 = v81;
            id v100 = v82;
            id v101 = v83;
            id v102 = 0;
            id v103 = self;
            objc_msgSend(v84, "__imForEach:", v98);

            id v36 = 0;
            id v43 = v88;
            id v19 = v89;
            id v21 = v93;
            id v25 = v94;
            goto LABEL_27;
          }
          int v56 = +[IMRGLog warning];
          if (os_log_type_enabled(v56, OS_LOG_TYPE_FAULT)) {
            sub_100716134(a5, v56);
          }

          id v47 = objc_alloc((Class)NSError);
          uint64_t v48 = IDSAccountRegistrationErrorDomain;
          uint64_t v49 = 105;
        }
        id v36 = [v47 initWithDomain:v48 code:v49 userInfo:0];
        id v38 = v96;
        id v43 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v96];
        [v43 setupCompleteForAccount:0 transactionID:0 setupError:v36];
        id v25 = v94;
LABEL_27:

        id v18 = v95;
        goto LABEL_19;
      }
      id v26 = +[IMRGLog warning];
      if (os_log_type_enabled(v26, OS_LOG_TYPE_FAULT)) {
        sub_1007161AC();
      }

      id v27 = objc_alloc((Class)NSError);
      uint64_t v28 = IDSAccountRegistrationErrorDomain;
      uint64_t v29 = 106;
    }
    else
    {
      id v42 = +[IMRGLog warning];
      if (os_log_type_enabled(v42, OS_LOG_TYPE_FAULT)) {
        sub_100716098();
      }

      id v27 = objc_alloc((Class)NSError);
      uint64_t v28 = IDSAccountRegistrationErrorDomain;
      uint64_t v29 = 104;
    }
    id v36 = [v27 initWithDomain:v28 code:v29 userInfo:0];
    id v38 = v96;
    id v43 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v96];
    [v43 setupCompleteForAccount:0 transactionID:0 setupError:v36];
    goto LABEL_27;
  }
  uint64_t v40 = +[IMRGLog warning];
  if (os_log_type_enabled(v40, OS_LOG_TYPE_FAULT)) {
    sub_100716030();
  }

  id v41 = objc_alloc((Class)NSError);
  id v36 = [v41 initWithDomain:IDSAccountRegistrationErrorDomain code:101 userInfo:0];
  long long v37 = self;
  id v38 = v96;
  id v39 = v96;
LABEL_18:
  id v25 = [(IDSDaemon *)v37 listenerRemoteObjectForLocalObject:v39];
  [v25 setupCompleteForAccount:0 transactionID:0 setupError:v36];
LABEL_19:
}

- (void)addAccountWithLoginID:(id)a3 serviceName:(id)a4 uniqueID:(id)a5 accountType:(int)a6 accountInfo:(id)a7 messageContext:(id)a8
{
  id v14 = (IDSDAccount *)a3;
  id v15 = a4;
  id v16 = a5;
  id v58 = a7;
  id v17 = [a8 localObject];
  id v18 = +[IMRGLog registration];
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v58 allKeys];
    *(_DWORD *)long long buf = 138413570;
    id v65 = v14;
    __int16 v66 = 2112;
    id v67 = v15;
    __int16 v68 = 2112;
    uint64_t v69 = (uint64_t)v16;
    __int16 v70 = 1024;
    int v71 = a6;
    __int16 v72 = 2112;
    uint64_t v73 = v19;
    __int16 v74 = 2112;
    unsigned __int8 v75 = v17;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "IDSDaemon: AddAccountWithLoginID %@ serviceName %@ uniqueID %@ accountType %d accountInfo %@ localObject %@", buf, 0x3Au);
  }
  if (![v15 length])
  {
    id v21 = +[IMRGLog warning];
    if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
      sub_1007162E4();
    }
    goto LABEL_48;
  }
  if ([(IDSDaemon *)self validateListenerForLocalObject:v17 andCheckEntitlement:kIDSRegistrationEntitlement forAccessToServiceWithIdentifier:v15])
  {
    if ((IDSIsValidAccountType() & 1) == 0)
    {
      id v21 = +[IMRGLog warning];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_FAULT)) {
        sub_100716134(a6, v21);
      }
      goto LABEL_48;
    }
    if (!a6)
    {
      id v21 = +[IMRGLog warning];
      if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Not allowing clients to add phone number accounts.", buf, 2u);
      }
      goto LABEL_48;
    }
    id v20 = [(IDSDaemon *)self serviceController];
    id v21 = [v20 serviceWithIdentifier:v15];

    if (!v21)
    {
      id v24 = +[IMRGLog warning];
      if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_FAULT)) {
        sub_10071634C();
      }
      goto LABEL_25;
    }
    if ([v21 disabledOnTinkerWatch])
    {
      uint64_t v22 = +[IDSPairingManager sharedInstance];
      unsigned int v23 = [v22 isCurrentDeviceTinkerConfiguredWatch];

      if (v23)
      {
        id v24 = +[IMRGLog warning];
        if (os_log_type_enabled(&v24->super, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v65 = (IDSDAccount *)v21;
          _os_log_impl((void *)&_mh_execute_header, &v24->super, OS_LOG_TYPE_DEFAULT, "Tried to add tinker disabled service, ignoring {service: %@}", buf, 0xCu);
        }
LABEL_25:
        uint64_t v25 = (uint64_t)v14;
LABEL_47:

        id v14 = (IDSDAccount *)v25;
LABEL_48:

        goto LABEL_49;
      }
    }
    unsigned int v57 = a6;
    uint64_t v25 = IMStripLoginID();

    if (v16)
    {
      id v26 = +[IDSDAccountController sharedInstance];
      id v27 = [v26 accountWithUniqueID:v16];

      if (v27)
      {
        uint64_t v28 = v27;
        uint64_t v29 = [(IDSDAccount *)v27 service];
        id v30 = [v29 identifier];
        unsigned __int8 v31 = [v30 isEqualToIgnoringCase:v15];

        if (v31)
        {
          id v32 = +[IMRGLog registration];
          if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            id v24 = v28;
            id v65 = v28;
            _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Not creating new account, we have existing: %@", buf, 0xCu);
          }
          else
          {
            id v24 = v28;
          }
LABEL_46:

          goto LABEL_47;
        }
        uint64_t v33 = +[IMRGLog warning];
        if (os_log_type_enabled(v33, OS_LOG_TYPE_FAULT)) {
          sub_1007163B4();
        }
      }
    }
    uint64_t v34 = +[IMRGLog registration];
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138413058;
      id v65 = (IDSDAccount *)v21;
      __int16 v66 = 2112;
      id v67 = v16;
      __int16 v68 = 2112;
      uint64_t v69 = v25;
      __int16 v70 = 1024;
      int v71 = v57;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Creating new account with service %@ uniqueID %@ login ID %@ accountType %d", buf, 0x26u);
    }

    id v24 = [[IDSDAccount alloc] initWithLoginID:v25 service:v21 uniqueID:v16 accountType:v57 accountConfig:v58];
    __int16 v35 = +[IDSDAccountController sharedInstance];
    [v35 addAccount:v24];

    id v32 = [(IDSDAccount *)v24 linkedAccounts];
    if (![v32 count])
    {
      BOOL v52 = v32;
      uint64_t v54 = v21;
      char v55 = v17;
      id v56 = v15;
      id v36 = +[IDSDServiceController sharedInstance];
      id v53 = v24;
      long long v37 = [(IDSDAccount *)v24 service];
      id v38 = [v36 linkedServicesForService:v37];

      long long v61 = 0u;
      long long v62 = 0u;
      long long v59 = 0u;
      long long v60 = 0u;
      id v39 = v38;
      id v40 = [v39 countByEnumeratingWithState:&v59 objects:v63 count:16];
      if (v40)
      {
        id v41 = v40;
        uint64_t v42 = *(void *)v60;
        do
        {
          for (i = 0; i != v41; i = (char *)i + 1)
          {
            if (*(void *)v60 != v42) {
              objc_enumerationMutation(v39);
            }
            id v44 = *(void **)(*((void *)&v59 + 1) + 8 * i);
            if ([v44 disabledOnTinkerWatch])
            {
              unsigned int v45 = +[IDSPairingManager sharedInstance];
              unsigned __int8 v46 = [v45 isCurrentDeviceTinkerConfiguredWatch];

              if (v46) {
                continue;
              }
            }
            id v47 = [IDSDAccount alloc];
            uint64_t v48 = +[NSString stringGUID];
            uint64_t v49 = [(IDSDAccount *)v47 initWithLoginID:v25 service:v44 uniqueID:v48 accountType:v57 accountConfig:v58];

            id v50 = +[IMRGLog registration];
            if (os_log_type_enabled(v50, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              id v65 = v49;
              _os_log_impl((void *)&_mh_execute_header, v50, OS_LOG_TYPE_DEFAULT, "  Creating a linked account: %@", buf, 0xCu);
            }

            id v51 = +[IDSDAccountController sharedInstance];
            [v51 addAccount:v49];
          }
          id v41 = [v39 countByEnumeratingWithState:&v59 objects:v63 count:16];
        }
        while (v41);
      }

      id v15 = v56;
      id v21 = v54;
      id v17 = v55;
      id v32 = v52;
      id v24 = v53;
    }
    goto LABEL_46;
  }
LABEL_49:
}

- (void)_removeAccount:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = [a4 localObject];
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "IDSDaemon _removeAccount %@ localObject %@", (uint8_t *)&v12, 0x16u);
  }

  if ([v6 length])
  {
    id v9 = [(IDSDaemon *)self accountWithIdentifier:v6 localObject:v7 requiredEntitlement:kIDSRegistrationEntitlement];
    if (v9)
    {
      id v10 = +[IDSDAccountController sharedInstance];
      [v10 removeAccount:v9];

      id v11 = [v9 linkedAccounts];
      objc_msgSend(v11, "__imForEach:", &stru_1009852F8);
    }
  }
  else
  {
    id v9 = +[IMRGLog warning];
    if (os_log_type_enabled(v9, OS_LOG_TYPE_FAULT)) {
      sub_10071641C();
    }
  }
}

- (void)_removeAndDeregisterAccount:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = [a4 localObject];
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "_removeAndDeregisterAccount %@ localObject %@", (uint8_t *)&v14, 0x16u);
  }

  if ([v6 length])
  {
    id v9 = [(IDSDaemon *)self accountWithIdentifier:v6 localObject:v7 requiredEntitlement:kIDSRegistrationEntitlement];
    id v10 = v9;
    if (v9)
    {
      [v9 unregisterAccount];
      id v11 = +[IDSDAccountController sharedInstance];
      [v11 disableAccountWithUniqueID:v6];

      int v12 = +[IDSDAccountController sharedInstance];
      [v12 removeAccount:v10];

      id v13 = [v10 linkedAccounts];
      objc_msgSend(v13, "__imForEach:", &stru_100985318);
    }
  }
  else
  {
    id v10 = +[IMRGLog warning];
    if (os_log_type_enabled(v10, OS_LOG_TYPE_FAULT)) {
      sub_10071641C();
    }
  }
}

- (void)updateAccount:(id)a3 withAccountInfo:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v33 = a5;
  id v10 = [v33 localObject];
  id v11 = (id *)IMRGLog_ptr;
  int v12 = +[IMRGLog registration];
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v41 = v8;
    __int16 v42 = 2112;
    id v43 = v10;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "updateAccount %@ localObject %@", buf, 0x16u);
  }

  uint64_t v13 = [(IDSDaemon *)self accountWithIdentifier:v8 localObject:v10 requiredEntitlement:kIDSRegistrationEntitlement];
  int v14 = (void *)v13;
  if (v13)
  {
    unsigned __int8 v31 = (void *)v13;
    id v32 = v10;
    id v15 = v9;
    v39[0] = kIDSServiceDefaultsRegisteredURIs;
    v39[1] = kIDSServiceDefaultsPseudonymsKey;
    v39[2] = kIDSServiceDefaultsVettedAliasesKey;
    +[NSArray arrayWithObjects:v39 count:3];
    long long v34 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    long long v37 = 0u;
    id v16 = (id)objc_claimAutoreleasedReturnValue();
    id v17 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
    if (v17)
    {
      id v18 = v17;
      id v29 = v9;
      id v30 = v8;
      id v19 = 0;
      uint64_t v20 = *(void *)v35;
      do
      {
        for (i = 0; i != v18; i = (char *)i + 1)
        {
          if (*(void *)v35 != v20) {
            objc_enumerationMutation(v16);
          }
          uint64_t v22 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          unsigned int v23 = objc_msgSend(v15, "objectForKey:", v22, v29, v30);

          if (v23)
          {
            if (!v19) {
              id v19 = [v15 mutableCopy];
            }
            [v19 removeObjectForKey:v22];
            id v24 = [*v11 registration];
            if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
            {
              uint64_t v25 = [v33 localObject];
              id v26 = [v25 processName];
              *(_DWORD *)long long buf = 138412546;
              id v41 = v26;
              __int16 v42 = 2112;
              id v43 = v22;
              _os_log_error_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "Found blocklisted key in updateAccount call! {process: %@, key: %@}", buf, 0x16u);

              id v11 = (id *)IMRGLog_ptr;
            }
          }
        }
        id v18 = [v16 countByEnumeratingWithState:&v34 objects:v38 count:16];
      }
      while (v18);

      if (!v19)
      {
        id v9 = v29;
        id v8 = v30;
        int v14 = v31;
        goto LABEL_22;
      }
      id v27 = [v19 copy];
      uint64_t v28 = v15;
      id v15 = v27;
      id v9 = v29;
      id v8 = v30;
    }
    else
    {
      id v19 = 0;
      uint64_t v28 = v16;
    }
    int v14 = v31;

LABEL_22:
    [v14 _updateAccountWithAccountInfo:v15];

    id v10 = v32;
  }
}

- (void)enableAccount:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = [a4 localObject];
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "enableAccount %@ localObject %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [(IDSDaemon *)self accountWithIdentifier:v6 localObject:v7 requiredEntitlement:kIDSRegistrationEntitlement];
  if (v9)
  {
    id v10 = +[IDSDAccountController sharedInstance];
    [v10 enableAccountWithUniqueID:v6];

    [v9 registerAccount];
    id v11 = [v9 linkedAccounts];
    objc_msgSend(v11, "__imForEach:", &stru_100985338);

    [(IDSDaemon *)self updateTopics];
  }
}

- (void)disableAccount:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = [a4 localObject];
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "disableAccount %@ localObject %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [(IDSDaemon *)self accountWithIdentifier:v6 localObject:v7 requiredEntitlement:kIDSRegistrationEntitlement];
  if (v9)
  {
    id v10 = +[IDSDAccountController sharedInstance];
    [v10 disableAccountWithUniqueID:v6];

    id v11 = [v9 linkedAccounts];
    objc_msgSend(v11, "__imForEach:", &stru_100985358);

    [(IDSDaemon *)self updateTopics];
  }
}

- (void)forceDisableAccount:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = [a4 localObject];
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "forceDisableAccount %@ localObject %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [(IDSDaemon *)self accountWithIdentifier:v6 localObject:v7 requiredEntitlement:kIDSRegistrationEntitlement];
  if (v9)
  {
    id v10 = +[IDSDAccountController sharedInstance];
    [v10 forceDisableAccountWithUniqueID:v6];

    id v11 = [v9 linkedAccounts];
    objc_msgSend(v11, "__imForEach:", &stru_100985378);

    [(IDSDaemon *)self updateTopics];
  }
}

- (void)authTokenChanged:(id)a3 forAccount:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 localObject];
  int v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412546;
    id v22 = v9;
    __int16 v23 = 2112;
    id v24 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "auth token changed for account uniqueID %@ localObject %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v19 = v9;
    uint64_t v20 = v11;
    _IDSLogV();
  }
  id v13 = -[IDSDaemon accountWithIdentifier:localObject:requiredEntitlement:](self, "accountWithIdentifier:localObject:requiredEntitlement:", v9, v11, kIDSRegistrationEntitlement, v19, v20);
  __int16 v14 = v13;
  if (v13)
  {
    id v15 = [v13 loginID];
    id v16 = [v14 service];
    id v17 = [v16 serviceName];
    sub_1001C1878(v8, v15, 0, 0, v17);

    [v14 authenticationChanged];
    id v18 = [v14 linkedAccounts];
    objc_msgSend(v18, "__imForEach:", &stru_100985398);
  }
}

- (void)passwordChanged:(id)a3 forAccount:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 localObject];
  int v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412546;
    id v23 = v9;
    __int16 v24 = 2112;
    uint64_t v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "password changed for account uniqueID %@ localObject %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v20 = v9;
    id v21 = v11;
    _IDSLogV();
  }
  id v13 = -[IDSDaemon accountWithIdentifier:localObject:requiredEntitlement:](self, "accountWithIdentifier:localObject:requiredEntitlement:", v9, v11, kIDSRegistrationEntitlement, v20, v21);
  __int16 v14 = v13;
  if (v13)
  {
    id v15 = [v13 loginID];
    id v16 = [v14 dsID];
    id v17 = [v14 service];
    id v18 = [v17 serviceName];
    sub_1001C16A0(v8, v15, v16, v18);

    [v14 authenticationChanged];
    id v19 = [v14 linkedAccounts];
    objc_msgSend(v19, "__imForEach:", &stru_1009853B8);
  }
}

- (void)authenticateAccount:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = [a4 localObject];
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "authenticateAccount uniqueID %@ localObject %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [(IDSDaemon *)self accountWithIdentifier:v6 localObject:v7 requiredEntitlement:kIDSRegistrationEntitlement];
  id v10 = v9;
  if (v9)
  {
    [v9 authenticateAccount];
    id v11 = [v10 linkedAccounts];
    objc_msgSend(v11, "__imForEach:", &stru_1009853D8);
  }
}

- (void)passwordUpdatedForAccount:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = [a4 localObject];
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "passwordUpdatedForAccount %@ localObject %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [(IDSDaemon *)self accountWithIdentifier:v6 localObject:v7 requiredEntitlement:kIDSRegistrationEntitlement];
  id v10 = v9;
  if (v9)
  {
    [v9 passwordUpdated];
    id v11 = [v10 linkedAccounts];
    objc_msgSend(v11, "__imForEach:", &stru_1009853F8);
  }
}

- (void)updateAuthorizationCredentials:(id)a3 token:(id)a4 forAccount:(id)a5 messageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = [a6 localObject];
  __int16 v14 = +[IMRGLog registration];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138413058;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    __int16 v27 = 2112;
    uint64_t v28 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "updateAuthorizationCredentials %@ token %@ account %@ localObject %@", buf, 0x2Au);
  }

  id v15 = [(IDSDaemon *)self accountWithIdentifier:v12 localObject:v13 requiredEntitlement:kIDSRegistrationEntitlement];
  id v16 = v15;
  if (v15)
  {
    [v15 updateAuthorizationCredentials:v10 token:v11];
    id v17 = [v16 linkedAccounts];
    v18[0] = _NSConcreteStackBlock;
    v18[1] = 3221225472;
    v18[2] = sub_1001C5324;
    v18[3] = &unk_1009844E8;
    id v19 = v10;
    id v20 = v11;
    objc_msgSend(v17, "__imForEach:", v18);
  }
}

- (void)validateProfileForAccount:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = [a4 localObject];
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "validateProfileForAccount %@ localObject %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [(IDSDaemon *)self accountWithIdentifier:v6 localObject:v7 requiredEntitlement:kIDSRegistrationEntitlement];
  id v10 = v9;
  if (v9)
  {
    [v9 validateProfile];
    id v11 = [v10 linkedAccounts];
    objc_msgSend(v11, "__imForEach:", &stru_100985418);
  }
}

- (void)addAliases:(id)a3 toAccount:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a5 localObject];
  id v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "addAliases %@ toAccount %@ localObject %@", buf, 0x20u);
  }

  int v12 = [(IDSDaemon *)self accountWithIdentifier:v9 localObject:v10 requiredEntitlement:kIDSRegistrationEntitlement];
  id v13 = v12;
  if (v12)
  {
    [v12 addAliases:v8];
    __int16 v14 = [v13 linkedAccounts];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001C57C4;
    v15[3] = &unk_1009822F8;
    id v16 = v8;
    objc_msgSend(v14, "__imForEach:", v15);
  }
}

- (void)removeAliases:(id)a3 fromAccount:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a5 localObject];
  id v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "removeAliases %@ toAccount %@ localObject %@", buf, 0x20u);
  }

  int v12 = [(IDSDaemon *)self accountWithIdentifier:v9 localObject:v10 requiredEntitlement:kIDSRegistrationEntitlement];
  id v13 = v12;
  if (v12)
  {
    [v12 removeAliases:v8];
    __int16 v14 = [v13 linkedAccounts];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001C5A54;
    v15[3] = &unk_1009822F8;
    id v16 = v8;
    objc_msgSend(v14, "__imForEach:", v15);
  }
}

- (void)validateAliases:(id)a3 forAccount:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a5 localObject];
  id v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "validateAliases %@ forAccount %@ localObject %@", buf, 0x20u);
  }

  int v12 = [(IDSDaemon *)self accountWithIdentifier:v9 localObject:v10 requiredEntitlement:kIDSRegistrationEntitlement];
  id v13 = v12;
  if (v12)
  {
    [v12 validateAliases:v8];
    __int16 v14 = [v13 linkedAccounts];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001C5CE4;
    v15[3] = &unk_1009822F8;
    id v16 = v8;
    objc_msgSend(v14, "__imForEach:", v15);
  }
}

- (void)unvalidateAliases:(id)a3 forAccount:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a5 localObject];
  id v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "unvalidateAliases %@ forAccount %@ localObject %@", buf, 0x20u);
  }

  int v12 = [(IDSDaemon *)self accountWithIdentifier:v9 localObject:v10 requiredEntitlement:kIDSRegistrationEntitlement];
  id v13 = v12;
  if (v12)
  {
    [v12 unvalidateAliases:v8];
    __int16 v14 = [v13 linkedAccounts];
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_1001C5F74;
    v15[3] = &unk_1009822F8;
    id v16 = v8;
    objc_msgSend(v14, "__imForEach:", v15);
  }
}

- (BOOL)validateLocalObjectForPseudonym:(id)a3 andCheckEntitlement:(id)a4 forAccessToServices:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = 1;
  if (_os_feature_enabled_impl())
  {
    uint64_t v18 = 0;
    __int16 v19 = &v18;
    uint64_t v20 = 0x2020000000;
    char v21 = 1;
    v13[0] = _NSConcreteStackBlock;
    v13[1] = 3221225472;
    v13[2] = sub_1001C619C;
    v13[3] = &unk_100985440;
    id v17 = &v18;
    id v14 = v10;
    id v15 = self;
    id v16 = v9;
    [(IDSDaemon *)self validateListenerForLocalObject:v8 andPerformBlock:v13];
    BOOL v11 = *((unsigned char *)v19 + 24) != 0;

    _Block_object_dispose(&v18, 8);
  }

  return v11;
}

- (BOOL)validateLocalObjectForPseudonym:(id)a3 andCheckEntitlement:(id)a4 forAccessToAnyOneOfServices:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if (_os_feature_enabled_impl())
  {
    uint64_t v23 = 0;
    id v24 = &v23;
    uint64_t v25 = 0x2020000000;
    char v26 = 0;
    id v15 = _NSConcreteStackBlock;
    uint64_t v16 = 3221225472;
    id v17 = sub_1001C6604;
    uint64_t v18 = &unk_100985440;
    id v11 = v10;
    id v22 = &v23;
    id v19 = v11;
    uint64_t v20 = self;
    id v21 = v9;
    [(IDSDaemon *)self validateListenerForLocalObject:v8 andPerformBlock:&v15];
    if (*((unsigned char *)v24 + 24))
    {
      BOOL v12 = 1;
    }
    else
    {
      id v13 = +[IMRGLog registration];
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v28 = v11;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Pseudonym request failed entitlement check for access to any one of services %@", buf, 0xCu);
      }

      BOOL v12 = *((unsigned char *)v24 + 24) != 0;
    }

    _Block_object_dispose(&v23, 8);
  }
  else
  {
    BOOL v12 = 1;
  }

  return v12;
}

- (void)provisionPseudonymForURI:(id)a3 onAccount:(id)a4 withProperties:(id)a5 requestProperties:(id)a6 requestUUID:(id)a7 messageContext:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = [a8 localObject];
  uint64_t v20 = +[IMRGLog registration];
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138413058;
    id v46 = v14;
    __int16 v47 = 2112;
    id v48 = v15;
    __int16 v49 = 2112;
    id v50 = v16;
    __int16 v51 = 2112;
    BOOL v52 = v19;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "provisionPseudonymForURI %@ onAccount %@ withProperties %@ localObject %@", buf, 0x2Au);
  }

  uint64_t v21 = kIDSRegistrationEntitlement;
  id v22 = [(IDSDaemon *)self accountWithIdentifier:v15 localObject:v19 requiredEntitlement:kIDSRegistrationEntitlement];
  if (!v22)
  {
    unsigned __int8 v31 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v19];
    uint64_t v32 = IDSPseudonymErrorDomain;
    uint64_t v33 = 500;
LABEL_17:
    long long v36 = +[NSError errorWithDomain:v32 code:v33 userInfo:0];
    [v31 finishedProvisioningPseudonym:0 success:0 error:v36 forRequestUUID:v18];

    goto LABEL_18;
  }
  id v41 = v17;
  uint64_t v23 = [v16 allowedServices];
  unsigned __int8 v24 = [(IDSDaemon *)self validateLocalObjectForPseudonym:v19 andCheckEntitlement:v21 forAccessToServices:v23];

  if ((v24 & 1) == 0)
  {
    id v28 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v19];
    uint64_t v29 = IDSPseudonymErrorDomain;
    uint64_t v30 = 500;
    goto LABEL_12;
  }
  if ((sub_1001C6C90() & 1) == 0)
  {
    long long v35 = +[IMRGLog registration];
    id v17 = v41;
    if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "provisionPseudonymForURI -- pseudonyms are disabled by the server!", buf, 2u);
    }

    unsigned __int8 v31 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v19];
    uint64_t v32 = IDSPseudonymErrorDomain;
    uint64_t v33 = 100;
    goto LABEL_17;
  }
  uint64_t v25 = +[IMSystemMonitor sharedInstance];
  unsigned int v26 = [v25 isUnderFirstDataProtectionLock];

  if (!v26)
  {
    v42[0] = _NSConcreteStackBlock;
    v42[1] = 3221225472;
    v42[2] = sub_1001C6D20;
    v42[3] = &unk_100985468;
    v42[4] = self;
    id v37 = v19;
    id v43 = v37;
    id v38 = v18;
    id v44 = v38;
    if (([v22 provisionPseudonymForURI:v14 properties:v16 requestProperties:v41 completionBlock:v42] & 1) == 0)
    {
      id v39 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v37];
      id v40 = +[NSError errorWithDomain:IDSPseudonymErrorDomain code:600 userInfo:0];
      [v39 finishedProvisioningPseudonym:0 success:0 error:v40 forRequestUUID:v38];
    }
    goto LABEL_13;
  }
  __int16 v27 = +[IMRGLog registration];
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "provisionPseudonymForURI -- under first unlock -- failing", buf, 2u);
  }

  id v28 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v19];
  uint64_t v29 = IDSPseudonymErrorDomain;
  uint64_t v30 = 1000;
LABEL_12:
  long long v34 = +[NSError errorWithDomain:v29 code:v30 userInfo:0];
  [v28 finishedProvisioningPseudonym:0 success:0 error:v34 forRequestUUID:v18];

LABEL_13:
  id v17 = v41;
LABEL_18:
}

- (void)renewPseudonym:(id)a3 onAccount:(id)a4 forUpdatedExpiryEpoch:(double)a5 requestProperties:(id)a6 requestUUID:(id)a7 messageContext:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a6;
  id v17 = a7;
  id v18 = [a8 localObject];
  id v19 = +[IMRGLog registration];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138413058;
    id v45 = v14;
    __int16 v46 = 2112;
    id v47 = v15;
    __int16 v48 = 2048;
    double v49 = a5;
    __int16 v50 = 2112;
    __int16 v51 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "renewPseudonym %@ onAccount %@ forUpdatedExpiryEpoch %f localObject %@", buf, 0x2Au);
  }

  uint64_t v20 = kIDSRegistrationEntitlement;
  uint64_t v21 = [(IDSDaemon *)self accountWithIdentifier:v15 localObject:v18 requiredEntitlement:kIDSRegistrationEntitlement];
  if (!v21)
  {
    uint64_t v29 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v18];
    uint64_t v30 = IDSPseudonymErrorDomain;
    uint64_t v31 = 500;
LABEL_15:
    long long v35 = +[NSError errorWithDomain:v30 code:v31 userInfo:0];
    [v29 finishedRenewingPseudonym:0 success:0 error:v35 requestUUID:v17];

    goto LABEL_16;
  }
  id v40 = v17;
  id v22 = v16;
  uint64_t v23 = [v14 properties];
  unsigned __int8 v24 = [v23 allowedServices];
  unsigned __int8 v25 = [(IDSDaemon *)self validateLocalObjectForPseudonym:v18 andCheckEntitlement:v20 forAccessToAnyOneOfServices:v24];

  if (v25)
  {
    id v16 = v22;
    if ((sub_1001C6C90() & 1) == 0)
    {
      long long v34 = +[IMRGLog registration];
      id v17 = v40;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "renewPseudonym -- pseudonyms are disabled by the server!", buf, 2u);
      }

      uint64_t v29 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v18];
      uint64_t v30 = IDSPseudonymErrorDomain;
      uint64_t v31 = 100;
      goto LABEL_15;
    }
    unsigned int v26 = +[IMSystemMonitor sharedInstance];
    unsigned int v27 = [v26 isUnderFirstDataProtectionLock];

    if (v27)
    {
      id v28 = +[IMRGLog registration];
      id v17 = v40;
      if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "renewPseudonym -- under first unlock -- failing", buf, 2u);
      }

      uint64_t v29 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v18];
      uint64_t v30 = IDSPseudonymErrorDomain;
      uint64_t v31 = 1000;
      goto LABEL_15;
    }
    v41[0] = _NSConcreteStackBlock;
    v41[1] = 3221225472;
    v41[2] = sub_1001C725C;
    v41[3] = &unk_100985468;
    v41[4] = self;
    id v36 = v18;
    id v42 = v36;
    id v37 = v40;
    id v43 = v37;
    if (([v21 renewPseudonym:v14 forUpdatedExpiryEpoch:v22 requestProperties:v41 completionBlock:a5] & 1) == 0)
    {
      id v38 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v36];
      id v39 = +[NSError errorWithDomain:IDSPseudonymErrorDomain code:600 userInfo:0];
      [v38 finishedRenewingPseudonym:0 success:0 error:v39 requestUUID:v37];
    }
    id v17 = v40;
  }
  else
  {
    uint64_t v32 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v18];
    uint64_t v33 = +[NSError errorWithDomain:IDSPseudonymErrorDomain code:500 userInfo:0];
    id v17 = v40;
    [v32 finishedProvisioningPseudonym:0 success:0 error:v33 forRequestUUID:v40];

    id v16 = v22;
  }
LABEL_16:
}

- (void)revokePseudonym:(id)a3 onAccount:(id)a4 requestProperties:(id)a5 requestUUID:(id)a6 messageContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = [a7 localObject];
  id v17 = +[IMRGLog registration];
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v43 = v12;
    __int16 v44 = 2112;
    id v45 = v13;
    __int16 v46 = 2112;
    id v47 = v16;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "revokePseudonym %@ onAccount %@ localObject %@", buf, 0x20u);
  }

  uint64_t v18 = kIDSRegistrationEntitlement;
  id v19 = [(IDSDaemon *)self accountWithIdentifier:v13 localObject:v16 requiredEntitlement:kIDSRegistrationEntitlement];
  if (!v19)
  {
    unsigned int v27 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v16];
    uint64_t v28 = IDSPseudonymErrorDomain;
    uint64_t v29 = 500;
LABEL_15:
    uint64_t v33 = +[NSError errorWithDomain:v28 code:v29 userInfo:0];
    [v27 finishedRevokingPseudonymWithSuccess:0 error:v33 requestUUID:v15];

    goto LABEL_16;
  }
  id v38 = v15;
  id v20 = v14;
  uint64_t v21 = [v12 properties];
  id v22 = [v21 allowedServices];
  unsigned __int8 v23 = [(IDSDaemon *)self validateLocalObjectForPseudonym:v16 andCheckEntitlement:v18 forAccessToAnyOneOfServices:v22];

  if (v23)
  {
    id v14 = v20;
    if ((sub_1001C6C90() & 1) == 0)
    {
      uint64_t v32 = +[IMRGLog registration];
      id v15 = v38;
      if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "revokePseudonym -- pseudonyms are disabled by the server!", buf, 2u);
      }

      unsigned int v27 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v16];
      uint64_t v28 = IDSPseudonymErrorDomain;
      uint64_t v29 = 100;
      goto LABEL_15;
    }
    unsigned __int8 v24 = +[IMSystemMonitor sharedInstance];
    unsigned int v25 = [v24 isUnderFirstDataProtectionLock];

    if (v25)
    {
      unsigned int v26 = +[IMRGLog registration];
      id v15 = v38;
      if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "revokePseudonym -- under first unlock -- failing", buf, 2u);
      }

      unsigned int v27 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v16];
      uint64_t v28 = IDSPseudonymErrorDomain;
      uint64_t v29 = 1000;
      goto LABEL_15;
    }
    v39[0] = _NSConcreteStackBlock;
    v39[1] = 3221225472;
    v39[2] = sub_1001C7774;
    void v39[3] = &unk_10097E540;
    uint8_t v39[4] = self;
    id v34 = v16;
    id v40 = v34;
    id v35 = v38;
    id v41 = v35;
    if (([v19 revokePseudonym:v12 requestProperties:v20 completionBlock:v39] & 1) == 0)
    {
      id v36 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v34];
      id v37 = +[NSError errorWithDomain:IDSPseudonymErrorDomain code:600 userInfo:0];
      [v36 finishedRevokingPseudonymWithSuccess:0 error:v37 requestUUID:v35];
    }
    id v15 = v38;
  }
  else
  {
    uint64_t v30 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v16];
    uint64_t v31 = +[NSError errorWithDomain:IDSPseudonymErrorDomain code:500 userInfo:0];
    id v15 = v38;
    [v30 finishedProvisioningPseudonym:0 success:0 error:v31 forRequestUUID:v38];

    id v14 = v20;
  }
LABEL_16:
}

- (void)reportAction:(int64_t)a3 ofTempURI:(id)a4 fromURI:(id)a5 onAccount:(id)a6 requestUUID:(id)a7 messageContext:(id)a8
{
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  uint64_t v18 = [a8 localObject];
  id v19 = +[IMRGLog registration];
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 67110402;
    int v34 = a3;
    __int16 v35 = 2112;
    id v36 = v14;
    __int16 v37 = 2112;
    id v38 = v15;
    __int16 v39 = 2112;
    id v40 = v16;
    __int16 v41 = 2112;
    id v42 = v17;
    __int16 v43 = 2112;
    __int16 v44 = v18;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "reportAction %d ofTempURI %@ fromURI %@ onAccount %@ requestUUID %@ localObject %@", buf, 0x3Au);
  }

  id v20 = [(IDSDaemon *)self accountWithIdentifier:v16 localObject:v18 requiredEntitlement:kIDSRegistrationEntitlement];
  if (!v20)
  {
    unsigned int v27 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v18];
    uint64_t v28 = +[NSError errorWithDomain:IDSServiceReportingErrorDomain code:500 userInfo:0];
    [v27 finishedReportingRequestUUID:v17 withError:v28];

    goto LABEL_13;
  }
  id v29 = v14;
  uint64_t v21 = +[IDSServerBag sharedInstanceForBagType:0];
  id v22 = [v21 objectForKey:@"enable-report-web-approval-status"];
  if (!v22 || (objc_opt_class(), (objc_opt_isKindOfClass() & 1) == 0))
  {

    goto LABEL_11;
  }
  unsigned __int8 v23 = [v22 BOOLValue];

  if (v23)
  {
LABEL_11:
    v30[0] = _NSConcreteStackBlock;
    v30[1] = 3221225472;
    v30[2] = sub_1001C7B68;
    v30[3] = &unk_1009847A8;
    v30[4] = self;
    id v31 = v18;
    id v32 = v17;
    id v14 = v29;
    [v20 reportAction:a3 ofTempURI:v29 fromURI:v15 withCompletion:v30];

    goto LABEL_13;
  }
  unsigned __int8 v24 = +[IMRGLog registration];
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "reportAction -- disabled by the server!", buf, 2u);
  }

  unsigned int v25 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v18];
  unsigned int v26 = +[NSError errorWithDomain:IDSServiceReportingErrorDomain code:100 userInfo:0];
  [v25 finishedReportingRequestUUID:v17 withError:v26];

  id v14 = v29;
LABEL_13:
}

- (void)registerAccount:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = [a4 localObject];
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "registerAccount %@ localObject %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [(IDSDaemon *)self accountWithIdentifier:v6 localObject:v7 requiredEntitlement:kIDSRegistrationEntitlement];
  id v10 = v9;
  if (v9)
  {
    [v9 registerAccount];
    id v11 = [v10 linkedAccounts];
    objc_msgSend(v11, "__imForEach:", &stru_100985488);
  }
}

- (void)unregisterAccount:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = [a4 localObject];
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "unregisterAccount %@ localObject %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [(IDSDaemon *)self accountWithIdentifier:v6 localObject:v7 requiredEntitlement:kIDSRegistrationEntitlement];
  id v10 = v9;
  if (v9)
  {
    [v9 unregisterAccount];
    id v11 = [v10 linkedAccounts];
    objc_msgSend(v11, "__imForEach:", &stru_1009854A8);
  }
}

- (void)forceRemoveAccount:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = [a4 localObject];
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412546;
    id v19 = v6;
    __int16 v20 = 2112;
    uint64_t v21 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "forceRemoveAccount %@ localObject %@", (uint8_t *)&v18, 0x16u);
  }

  id v9 = [(IDSDaemon *)self accountWithIdentifier:v6 localObject:v7 requiredEntitlement:kIDSRegistrationEntitlement];
  id v10 = v9;
  if (v9)
  {
    if ([v9 isTemporary])
    {
      if (![v10 accountType])
      {
        id v11 = [v10 userUniqueIdentifier];

        if (v11)
        {
          int v12 = [(IDSDaemon *)self registrationConductor];
          id v13 = [v12 userStore];
          __int16 v14 = [v10 userUniqueIdentifier];
          id v15 = [v13 userWithUniqueIdentifier:v14];

          id v16 = [(IDSDaemon *)self registrationConductor];
          id v17 = [v16 userStore];
          [v17 forceRemoveUser:v15 silently:1];
        }
      }
    }
  }
}

- (void)_reregisterAndReidentify:(id)a3 account:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = [a5 localObject];
  id v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v22 = v8;
    __int16 v23 = 2112;
    id v24 = v9;
    __int16 v25 = 2112;
    unsigned int v26 = v10;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "_reregisterAndReidentify %@ account %@ localObject %@", buf, 0x20u);
  }

  int v12 = [(IDSDaemon *)self accountWithIdentifier:v9 localObject:v10 requiredEntitlement:kIDSRegistrationEntitlement];
  id v13 = v12;
  if (v12)
  {
    __int16 v14 = [v12 registration];
    unsigned int v15 = [v14 registrationType];

    if (!v15)
    {
      id v16 = +[IDSRegistrationReasonTracker sharedInstance];
      id v17 = [v13 userUniqueIdentifier];
      [v16 setPNRReason:10 forUserUniqueIdentifier:v17];
    }
    objc_msgSend(v13, "_reregisterAndReidentify:", objc_msgSend(v8, "BOOLValue"));
    int v18 = [v13 linkedAccounts];
    v19[0] = _NSConcreteStackBlock;
    v19[1] = 3221225472;
    v19[2] = sub_1001C8470;
    v19[3] = &unk_1009822F8;
    id v20 = v8;
    objc_msgSend(v18, "__imForEach:", v19);
  }
}

- (void)deactivateAndPurgeIdentifyForAccount:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = [a4 localObject];
  id v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v12 = 138412546;
    id v13 = v6;
    __int16 v14 = 2112;
    unsigned int v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "deactivateAndPurgeIdentifyForAccount %@ localObject %@", (uint8_t *)&v12, 0x16u);
  }

  id v9 = [(IDSDaemon *)self accountWithIdentifier:v6 localObject:v7 requiredEntitlement:kIDSRegistrationEntitlement];
  id v10 = v9;
  if (v9)
  {
    [v9 deactivateAndPurgeIdentify];
    id v11 = [v10 linkedAccounts];
    objc_msgSend(v11, "__imForEach:", &stru_1009854C8);
  }
}

- (void)hardDeregisterWithMessageContext:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 localObject];
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "hard deregister localObject %@", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [v4 localObject];
  unsigned int v8 = [(IDSDaemon *)self validateListenerForLocalObject:v7 andCheckEntitlement:kIDSRegistrationResetEntitlement];

  if (v8)
  {
    self->_isHardReset = 1;
    id v9 = +[IDSDAccountController sharedInstance];
    [v9 hardDeregister];
  }
}

- (void)triggerFinalDeregisterWithMessageContext:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 localObject];
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Trigger final deregister localObject %@", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [v4 localObject];
  unsigned int v8 = [(IDSDaemon *)self validateListenerForLocalObject:v7 andCheckEntitlement:kIDSRegistrationResetEntitlement];

  if (v8)
  {
    id v9 = +[IDSDAccountController sharedInstance];
    [v9 triggerFinalDeregister];
  }
}

- (void)kickGetDependentForAccount:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 localObject];
    int v14 = 138412546;
    id v15 = v6;
    __int16 v16 = 2112;
    id v17 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Kicking get dependent for account %@ localObject %@", (uint8_t *)&v14, 0x16u);
  }
  int v10 = [v7 localObject];
  id v11 = [(IDSDaemon *)self accountWithIdentifier:v6 localObject:v10 requiredEntitlement:kIDSiCloudSignInHackEntitlement];

  int v12 = +[IDSDAccountController sharedInstance];
  id v13 = v12;
  if (v11) {
    [v12 issueGetDependentRequestForAccount:v11];
  }
  else {
    [v12 issueGetDependentRequest];
  }
}

- (void)reRegisterWithUserID:(id)a3 action:(id)a4 service:(id)a5 messageContext:(id)a6
{
  id v14 = a3;
  id v10 = a4;
  id v11 = a5;
  int v12 = [a6 localObject];
  LODWORD(self) = [(IDSDaemon *)self validateListenerForLocalObject:v12 andCheckEntitlement:kIDSiCloudSignInHackEntitlement];

  if (self)
  {
    id v13 = +[IDSDRegistrationPushManager sharedInstance];
    [v13 fakeIncomingPushForUserID:v14 style:v10 service:v11];
  }
}

- (void)repairAccountsWithMessageContext:(id)a3
{
  id v4 = a3;
  id v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 localObject];
    int v10 = 138412290;
    id v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Trigger accounts repair { localObject: %@ }", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [v4 localObject];
  unsigned int v8 = [(IDSDaemon *)self validateListenerForLocalObject:v7 andCheckEntitlement:kIDSiCloudSignInHackEntitlement];

  if (v8)
  {
    id v9 = [(IDSDaemon *)self registrationConductor];
    [v9 kickRepair];
  }
}

- (void)registerForRegistrationAccountStatusMetric
{
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for Registration Account Status Metric", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  *(void *)long long buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001C8E90;
  handler[3] = &unk_100982630;
  objc_copyWeak(&v5, (id *)buf);
  xpc_activity_register("com.apple.ids.registrationaccountstatusmetric", XPC_ACTIVITY_CHECK_IN, handler);
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

- (void)registerForRegistrationEventTrackCleanup
{
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for Registration Event Tracker Cleanup", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  *(void *)long long buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001C92E0;
  handler[3] = &unk_100982630;
  objc_copyWeak(&v5, (id *)buf);
  xpc_activity_register("com.apple.ids.registration.tracker", XPC_ACTIVITY_CHECK_IN, handler);
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

- (void)registerForSenderKeyCleanup
{
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for Sender Key Cleanup", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  *(void *)long long buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_1001C975C;
  handler[3] = &unk_100982630;
  objc_copyWeak(&v5, (id *)buf);
  xpc_activity_register("com.apple.ids.senderkey.cleanup", XPC_ACTIVITY_CHECK_IN, handler);
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

- (void)registerForQueryDBCleanup
{
  id v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Registering for Query DB cleanup", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  xpc_activity_register("com.apple.ids.query.db.cleanup", XPC_ACTIVITY_CHECK_IN, &stru_100985508);
}

- (void)_submitRegistrationAccountStatusMetric
{
  long long v36 = 0u;
  long long v37 = 0u;
  long long v38 = 0u;
  long long v39 = 0u;
  id v27 = [&off_1009D2CE0 countByEnumeratingWithState:&v36 objects:v41 count:16];
  if (v27)
  {
    uint64_t v26 = *(void *)v37;
    do
    {
      for (i = 0; i != v27; i = (char *)i + 1)
      {
        if (*(void *)v37 != v26) {
          objc_enumerationMutation(&off_1009D2CE0);
        }
        uint64_t v3 = *(void *)(*((void *)&v36 + 1) + 8 * i);
        id v4 = +[IDSDServiceController sharedInstance];
        uint64_t v5 = [v4 serviceWithIdentifier:v3];

        id v6 = +[IDSDAccountController sharedInstance];
        id v31 = (void *)v5;
        id v7 = [v6 accountsOnService:v5];

        unsigned int v30 = +[IDSRegistrationController systemSupportsPhoneNumberRegistration];
        long long v32 = 0u;
        long long v33 = 0u;
        long long v34 = 0u;
        long long v35 = 0u;
        id v8 = v7;
        id v9 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
        if (!v9)
        {

          char v12 = 0;
LABEL_21:
          id v20 = +[IDSDAccountMetrics registrationAccountStatusMetricForNonexistentAccountWithType:1 serviceIdentifier:v3];
          uint64_t v21 = +[IDSRTCLogger loggerWithCategory:4000];
          [v21 logMetric:v20];

          id v22 = +[IDSCoreAnalyticsLogger defaultLogger];
          [v22 logMetric:v20];

          goto LABEL_22;
        }
        id v10 = v9;
        uint64_t v28 = v3;
        id v29 = i;
        char v11 = 0;
        char v12 = 0;
        uint64_t v13 = *(void *)v33;
        do
        {
          for (j = 0; j != v10; j = (char *)j + 1)
          {
            if (*(void *)v33 != v13) {
              objc_enumerationMutation(v8);
            }
            id v15 = *(void **)(*((void *)&v32 + 1) + 8 * (void)j);
            if ([v15 accountType] == 1)
            {
              __int16 v16 = +[IDSDAccountMetrics registrationAccountStatusMetricForAccount:v15];
              id v17 = +[IDSRTCLogger loggerWithCategory:4000];
              [v17 logMetric:v16];

              int v18 = +[IDSCoreAnalyticsLogger defaultLogger];
              [v18 logMetric:v16];
              char v11 = 1;
            }
            else
            {
              if ([v15 accountType]) {
                continue;
              }
              __int16 v16 = +[IDSDAccountMetrics registrationAccountStatusMetricForAccount:v15];
              id v19 = +[IDSRTCLogger loggerWithCategory:4000];
              [v19 logMetric:v16];

              int v18 = +[IDSCoreAnalyticsLogger defaultLogger];
              [v18 logMetric:v16];
              char v12 = 1;
            }
          }
          id v10 = [v8 countByEnumeratingWithState:&v32 objects:v40 count:16];
        }
        while (v10);

        uint64_t v3 = v28;
        i = v29;
        if ((v11 & 1) == 0) {
          goto LABEL_21;
        }
LABEL_22:
        if (v30)
        {
          if ((v12 & 1) == 0)
          {
            __int16 v23 = +[IDSDAccountMetrics registrationAccountStatusMetricForNonexistentAccountWithType:0 serviceIdentifier:v3];
            id v24 = +[IDSRTCLogger loggerWithCategory:4000];
            [v24 logMetric:v23];

            __int16 v25 = +[IDSCoreAnalyticsLogger defaultLogger];
            [v25 logMetric:v23];
          }
        }
      }
      id v27 = [&off_1009D2CE0 countByEnumeratingWithState:&v36 objects:v41 count:16];
    }
    while (v27);
  }
}

- (void)clearIDSStateWithMessageContext:(id)a3
{
  id v4 = a3;
  uint64_t v13 = 0;
  id v14 = &v13;
  uint64_t v15 = 0x2020000000;
  char v16 = 0;
  uint64_t v5 = [v4 localObject];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_1001CA4C8;
  v12[3] = &unk_100985530;
  v12[4] = self;
  v12[5] = &v13;
  [(IDSDaemon *)self validateListenerForLocalObject:v5 andPerformBlock:v12];

  if (*((unsigned char *)v14 + 24))
  {
    id v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      id v7 = [v4 localObject];
      *(_DWORD *)long long buf = 138412290;
      int v18 = v7;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Told to clear IDS state %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      char v11 = [v4 localObject];
      _IDSLogV();
    }
    [(IDSDaemon *)self _clearIDSState];
  }
  else
  {
    id v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      id v9 = [v4 localObject];
      *(_DWORD *)long long buf = 138412290;
      int v18 = v9;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Not entitled to clear IDS state %@", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      char v11 = [v4 localObject];
      _IDSLogV();
    }
    id v10 = +[IMUserDefaults sharedDefaults];
    [v10 setClearStateOnLaunch:0];
  }
  _Block_object_dispose(&v13, 8);
}

- (void)_clearIDSState
{
  id v2 = +[IMUserDefaults sharedDefaults];
  [v2 setClearStateOnLaunch:0];

  uint64_t v3 = +[IDSPeerIDManager sharedInstance];
  [v3 clearCacheAndPersistImmediately:1];

  id v4 = +[IDSPublicKeyStorage sharedInstance];
  [v4 clearCache];

  uint64_t v5 = +[IDSIDStatusQueryController sharedInstance];
  [v5 clearCache];

  id v6 = +[IDSDMessageStore sharedInstanceForDataProtectionClass:1];
  [v6 deleteDatabase];

  id v7 = +[IDSDMessageStore sharedInstanceForDataProtectionClass:0];
  [v7 deleteDatabase];

  id v8 = +[IDSDMessageStore sharedInstanceForDataProtectionClass:2];
  [v8 deleteDatabase];
}

- (void)initialLocalSyncStartedForServices:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[IDSDaemon(Account) initialLocalSyncStartedForServices:messageContext:]";
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Initial: %s services: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v15 = "-[IDSDaemon(Account) initialLocalSyncStartedForServices:messageContext:]";
      id v16 = v6;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        uint64_t v15 = "-[IDSDaemon(Account) initialLocalSyncStartedForServices:messageContext:]";
        id v16 = v6;
        _IDSLogV();
      }
    }
  }
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v21 = 0;
  id v9 = objc_msgSend(v7, "localObject", v15, v16);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001CA8E4;
  v17[3] = &unk_100985558;
  v17[4] = self;
  id v10 = v6;
  id v18 = v10;
  id v19 = buf;
  [(IDSDaemon *)self validateListenerForLocalObject:v9 andPerformBlock:v17];

  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    if ([v10 count])
    {
      char v11 = +[IDSUTunDeliveryController sharedInstance];
      [v11 defaultPeerSetPreferInfraWiFi:1 services:v10];
    }
    char v12 = +[IDSDuetInterface sharedInstance];
    uint64_t v13 = [v7 localObject];
    id v14 = [v13 processName];
    [v12 setInitialSyncInProgress:1 forClientID:v14];
  }
  _Block_object_dispose(buf, 8);
}

- (void)initialLocalSyncCompletedForServices:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315394;
    *(void *)&uint8_t buf[4] = "-[IDSDaemon(Account) initialLocalSyncCompletedForServices:messageContext:]";
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Initial: %s services: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v15 = "-[IDSDaemon(Account) initialLocalSyncCompletedForServices:messageContext:]";
      id v16 = v6;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        uint64_t v15 = "-[IDSDaemon(Account) initialLocalSyncCompletedForServices:messageContext:]";
        id v16 = v6;
        _IDSLogV();
      }
    }
  }
  *(void *)long long buf = 0;
  *(void *)&uint8_t buf[8] = buf;
  *(void *)&uint8_t buf[16] = 0x2020000000;
  char v21 = 0;
  id v9 = objc_msgSend(v7, "localObject", v15, v16);
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_1001CAC50;
  v17[3] = &unk_100985558;
  v17[4] = self;
  id v10 = v6;
  id v18 = v10;
  id v19 = buf;
  [(IDSDaemon *)self validateListenerForLocalObject:v9 andPerformBlock:v17];

  if (*(unsigned char *)(*(void *)&buf[8] + 24))
  {
    if ([v10 count])
    {
      char v11 = +[IDSUTunDeliveryController sharedInstance];
      [v11 defaultPeerSetPreferInfraWiFi:0 services:v10];
    }
    char v12 = +[IDSDuetInterface sharedInstance];
    uint64_t v13 = [v7 localObject];
    id v14 = [v13 processName];
    [v12 setInitialSyncInProgress:0 forClientID:v14];
  }
  _Block_object_dispose(buf, 8);
}

- (void)iCloudSignInWithUserName:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8 messageContext:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = +[IMRGLog iCloud];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v23 = [v21 localObject];
    int v27 = 138412546;
    id v28 = v15;
    __int16 v29 = 2112;
    unsigned int v30 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "iCloudSignInWithUserName %@ localObject %@", (uint8_t *)&v27, 0x16u);
  }
  id v24 = [v21 localObject];
  unsigned int v25 = [(IDSDaemon *)self validateListenerForLocalObject:v24];

  if (v25)
  {
    uint64_t v26 = [(IDSDaemon *)self signInResponder];
    [v26 iCloudSignInWithUsername:v15 authToken:v16 password:v17 accountInfo:v18 accountStatus:v19 handles:v20];
  }
}

- (void)iCloudUpdateForUserName:(id)a3 accountInfo:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  char v11 = +[IMRGLog iCloud];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    char v12 = [v10 localObject];
    int v16 = 138412546;
    id v17 = v8;
    __int16 v18 = 2112;
    id v19 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "iCloudUpdateForUserName %@ localObject %@", (uint8_t *)&v16, 0x16u);
  }
  uint64_t v13 = [v10 localObject];
  unsigned int v14 = [(IDSDaemon *)self validateListenerForLocalObject:v13];

  if (v14)
  {
    id v15 = [(IDSDaemon *)self signInResponder];
    [v15 iCloudUpdateForUsername:v8 accountInfo:v9];
  }
}

- (void)iCloudModifyForUserName:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = +[IMRGLog iCloud];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 localObject];
    int v13 = 138412546;
    id v14 = v6;
    __int16 v15 = 2112;
    int v16 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "iCloudModifyForUserName %@ localObject %@", (uint8_t *)&v13, 0x16u);
  }
  id v10 = [v7 localObject];
  unsigned int v11 = [(IDSDaemon *)self validateListenerForLocalObject:v10];

  if (v11)
  {
    char v12 = [(IDSDaemon *)self signInResponder];
    [v12 iCloudModifyForUsername:v6];
  }
}

- (void)iCloudSignOutWithMessageContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IMRGLog iCloud];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 localObject];
    int v10 = 138412290;
    unsigned int v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "iCloudSignOut %@", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [v4 localObject];
  unsigned int v8 = [(IDSDaemon *)self validateListenerForLocalObject:v7];

  if (v8)
  {
    id v9 = [(IDSDaemon *)self signInResponder];
    [v9 iCloudSignOut];
  }
}

- (void)iTunesSignInWithUserName:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8 messageContext:(id)a9
{
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = +[IMRGLog iCloud];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v23 = [v21 localObject];
    int v27 = 138412546;
    id v28 = v15;
    __int16 v29 = 2112;
    unsigned int v30 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "iTunesSignInWithUserName %@ localObject %@", (uint8_t *)&v27, 0x16u);
  }
  id v24 = [v21 localObject];
  unsigned int v25 = [(IDSDaemon *)self validateListenerForLocalObject:v24];

  if (v25)
  {
    uint64_t v26 = [(IDSDaemon *)self signInResponder];
    [v26 iTunesSignInWithUsername:v15 authToken:v16 password:v17 accountInfo:v18 accountStatus:v19 handles:v20];
  }
}

- (void)iTunesSignOutWithMessageContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IMRGLog iCloud];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 localObject];
    int v10 = 138412290;
    unsigned int v11 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "iTunesSignOut %@", (uint8_t *)&v10, 0xCu);
  }
  id v7 = [v4 localObject];
  unsigned int v8 = [(IDSDaemon *)self validateListenerForLocalObject:v7];

  if (v8)
  {
    id v9 = [(IDSDaemon *)self signInResponder];
    [v9 iTunesSignOut];
  }
}

- (void)gameCenterSignInWithUserName:(id)a3 authToken:(id)a4 password:(id)a5 accountInfo:(id)a6 accountStatus:(id)a7 handles:(id)a8 messageContext:(id)a9
{
  id v15 = a3;
  id v16 = a9;
  id v17 = a8;
  id v18 = a7;
  id v19 = a6;
  id v20 = a5;
  id v21 = a4;
  id v22 = +[IMRGLog iCloud];
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    __int16 v23 = [v16 localObject];
    int v25 = 138412546;
    id v26 = v15;
    __int16 v27 = 2112;
    id v28 = v23;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "gameCenterSignInWithUserName %@ localObject %@", (uint8_t *)&v25, 0x16u);
  }
  id v24 = [(IDSDaemon *)self signInResponder];
  [v24 gameCenterSignInWithUsername:v15 authToken:v21 password:v20 accountInfo:v19 accountStatus:v18 handles:v17];
}

- (void)gameCenterSignOutWithMessageContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IMRGLog iCloud];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 localObject];
    int v8 = 138412290;
    id v9 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "gameCenterSignOut %@", (uint8_t *)&v8, 0xCu);
  }
  id v7 = [(IDSDaemon *)self signInResponder];
  [v7 gameCenterSignOut];
}

- (void)gameCenterModifyForUserName:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int v8 = +[IMRGLog iCloud];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 localObject];
    int v11 = 138412546;
    id v12 = v6;
    __int16 v13 = 2112;
    id v14 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "gameCenterModifyForUserName %@ localObject %@", (uint8_t *)&v11, 0x16u);
  }
  int v10 = [(IDSDaemon *)self signInResponder];
  [v10 gameCenterModifyForUserName:v6];
}

- (void)updateUserWithOldUserName:(id)a3 newUserName:(id)a4 messageContext:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = [a5 localObject];
  unsigned int v10 = [(IDSDaemon *)self validateListenerForLocalObject:v9];

  if (v10)
  {
    int v11 = [(IDSDaemon *)self signInResponder];
    [v11 updateUserWithOldUsername:v12 newUsername:v8];
  }
}

- (void)iCloudSignInHackWithUserName:(id)a3 password:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  int v11 = +[IMRGLog registration];
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    if (v9) {
      CFStringRef v12 = @"YES";
    }
    else {
      CFStringRef v12 = @"NO";
    }
    __int16 v13 = [v10 localObject];
    int v18 = 138412802;
    id v19 = v8;
    __int16 v20 = 2112;
    CFStringRef v21 = v12;
    __int16 v22 = 2112;
    __int16 v23 = v13;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "iCloud sign in hack with userName %@ and password %@ localObject %@", (uint8_t *)&v18, 0x20u);
  }
  id v14 = [v10 localObject];
  unsigned int v15 = [(IDSDaemon *)self validateListenerForLocalObject:v14 andCheckEntitlement:kIDSiCloudSignInHackEntitlement];

  if (v15)
  {
    id v16 = [(IDSDaemon *)self registrationConductor];
    [v16 setShouldSupressRepairLogic:1];

    id v17 = [(IDSDaemon *)self signInResponder];
    [v17 iCloudSignInWithUsername:v8 authToken:0 password:v9 accountInfo:0 accountStatus:0 handles:0];
  }
}

- (void)iCloudSignOutHackWithMessageContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IMRGLog registration];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 localObject];
    int v11 = 138412290;
    CFStringRef v12 = v6;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "iCloud sign out hack with localObject %@", (uint8_t *)&v11, 0xCu);
  }
  id v7 = [v4 localObject];
  unsigned int v8 = [(IDSDaemon *)self validateListenerForLocalObject:v7 andCheckEntitlement:kIDSiCloudSignInHackEntitlement];

  if (v8)
  {
    id v9 = [(IDSDaemon *)self registrationConductor];
    [v9 setShouldSupressRepairLogic:1];

    id v10 = [(IDSDaemon *)self signInResponder];
    [v10 iCloudSignOut];
  }
}

- (void)setPassword:(id)a3 forUsername:(id)a4 onService:(id)a5 messageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  CFStringRef v12 = (__CFString *)a5;
  id v13 = a6;
  id v14 = [v13 localObject];
  unsigned int v15 = +[IMRGLog registration];
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
  {
    int v23 = 138412802;
    id v24 = v14;
    __int16 v25 = 2112;
    id v26 = v11;
    __int16 v27 = 2048;
    id v28 = v10;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "setPasswordForProfileID localObject %@ {username: %@, password: %p", (uint8_t *)&v23, 0x20u);
  }

  if ([(__CFString *)v12 isEqualToString:@"FaceTime"])
  {
    id v16 = @"com.apple.ess";
  }
  else
  {
    unsigned int v17 = [(__CFString *)v12 isEqualToString:@"iMessage"];
    id v16 = @"com.apple.madrid";
    if (!v17) {
      id v16 = v12;
    }
  }
  int v18 = v16;
  id v19 = [v13 localObject];
  if ([(IDSDaemon *)self validateListenerForLocalObject:v19 andCheckEntitlement:kIDSRegistrationEntitlement forAccessToServiceWithIdentifier:v18])
  {

LABEL_10:
    __int16 v22 = +[FTPasswordManager sharedInstance];
    [v22 setPasswordForProfileID:0 username:v11 service:v12 password:v10 outRequestID:0 completionBlock:&stru_100985578];

    goto LABEL_11;
  }
  __int16 v20 = [v13 localObject];
  unsigned int v21 = [(IDSDaemon *)self validateListenerForLocalObject:v20 andCheckEntitlement:kIDSTestToolEntitlement];

  if (v21) {
    goto LABEL_10;
  }
LABEL_11:
}

- (void)updateSubServices:(id)a3 forService:(id)a4 deviceUniqueID:(id)a5 messageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = +[IMRGLog registration];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    int v18 = 138412802;
    id v19 = v10;
    __int16 v20 = 2112;
    id v21 = v11;
    __int16 v22 = 2112;
    id v23 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Updating sub services %@ for service %@ deviceUniqueID %@", (uint8_t *)&v18, 0x20u);
  }

  unsigned int v15 = [v13 localObject];

  unsigned int v16 = [(IDSDaemon *)self validateListenerForLocalObject:v15 andCheckEntitlement:kIDSSubServicesEntitlement forAccessToServiceWithIdentifier:v11];
  if (v16)
  {
    unsigned int v17 = +[IDSDServiceController sharedInstance];
    [v17 updateSubServices:v10 forService:v11 deviceUniqueID:v12];
  }
}

- (void)setPairedDeviceInfo:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[IMRGLog registration];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    int v13 = 138412290;
    id v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Save paired device info: %@", (uint8_t *)&v13, 0xCu);
  }

  id v9 = [v7 localObject];

  unsigned int v10 = [(IDSDaemon *)self validateListenerForLocalObject:v9 andCheckEntitlement:kIDSEncryptionKeysEntitlement];
  if (v10)
  {
    id v11 = +[IDSPairingManager sharedInstance];
    [v11 setPairedDeviceInfo:v6];

    id v12 = +[IDSAccountSync sharedInstance];
    [v12 resetAndResynchronizeEverything];
  }
}

- (void)setNSUUID:(id)a3 onDeviceWithUniqueID:(id)a4 forService:(id)a5 messageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v43 = 0;
  __int16 v44 = &v43;
  uint64_t v45 = 0x2020000000;
  char v46 = 0;
  id v14 = [v13 localObject];
  long long v36 = _NSConcreteStackBlock;
  uint64_t v37 = 3221225472;
  long long v38 = sub_1001CC808;
  long long v39 = &unk_100985558;
  id v40 = self;
  id v15 = v12;
  id v41 = v15;
  id v42 = &v43;
  [(IDSDaemon *)self validateListenerForLocalObject:v14 andPerformBlock:&v36];

  if (*((unsigned char *)v44 + 24))
  {
    unsigned int v16 = +[IDSDAccountController sharedInstance];
    unsigned int v17 = [v16 cloudPairedIDForDeviceID:v11];

    int v18 = +[IMRGLog registration];
    if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
    {
      id v19 = [v13 localObject];
      *(_DWORD *)long long buf = 138413314;
      id v48 = v10;
      __int16 v49 = 2112;
      id v50 = v11;
      __int16 v51 = 2112;
      BOOL v52 = v17;
      __int16 v53 = 2112;
      id v54 = v15;
      __int16 v55 = 2112;
      id v56 = v19;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Setting NSUUID %@ on device with uniqueID %@  current pariedID: %@  service %@ localObject %@", buf, 0x34u);
    }
    __int16 v20 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412802;
      id v48 = v10;
      __int16 v49 = 2112;
      id v50 = v11;
      __int16 v51 = 2112;
      BOOL v52 = v17;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, " *** Cloud pairing detected setting BTUUID %@   on device ID: %@ **** (From: %@)", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        id v34 = v11;
        long long v35 = v17;
        id v33 = v10;
        _IDSLogTransport();
        if (_IDSShouldLog())
        {
          id v34 = v11;
          long long v35 = v17;
          id v33 = v10;
          _IDSLogV();
        }
      }
    }
    id v21 = +[IMSystemMonitor sharedInstance];
    unsigned int v22 = [v21 isUnderFirstDataProtectionLock];

    if (v22)
    {
      self->_cloudPairingBeforeFirstUnlock = 1;
      id v23 = +[IMRGLog registration];
      if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, " => Noting it was before first unlock", buf, 2u);
      }
    }
    if (v10 && v17 && [v17 isEqualToIgnoringCase:v10])
    {
      id v24 = +[IMRGLog registration];
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, " => Ignoring, no change", buf, 2u);
      }

      __int16 v25 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, " => Ignoring, no change", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          _IDSLogTransport();
          if (_IDSShouldLog()) {
            _IDSLogV();
          }
        }
      }
    }
    else
    {
      id v26 = +[IMLockdownManager sharedInstance];
      unsigned int v27 = [v26 isInternalInstall];

      if (v27)
      {
        id v28 = +[IDSDAccountController sharedInstance];
        __int16 v29 = [v28 propertiesForDeviceWithUniqueID:v11];

        unsigned int v30 = +[IMRGLog registration];
        if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v48 = v29;
          _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "   => Device properties: %@", buf, 0xCu);
        }

        if ([v10 length])
        {
          id v31 = +[NSString stringWithFormat:@"If this was unexpected, please file a radar (PEP Transport) and attach output of 'idstool dump'. See 17180900 for reference"];
          sub_1001484DC(0, @"iCloud Pairing Added", v31, 1120);
        }
        else
        {
          id v31 = +[NSString stringWithFormat:@"If this was unexpected, please file a radar (PEP Transport) and attach output of 'idstool dump'. See 17180900 for reference"];
          sub_1001484DC(0, @"iCloud Pairing Removed", v31, 1073);
        }
      }
      long long v32 = +[IDSDAccountController sharedInstance];
      [v32 setNSUUID:v10 onDeviceWithUniqueID:v11];

      im_dispatch_after_primary_queue();
    }
  }
  _Block_object_dispose(&v43, 8);
}

- (void)incomingAccountSyncMessage:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[IMRGLog accountSync];
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Daemon received incoming account sync message", v12, 2u);
  }

  id v9 = [v7 localObject];

  unsigned int v10 = [(IDSDaemon *)self validateListenerForLocalObject:v9 andCheckEntitlement:kIDSAccountSyncEntitlement];
  if (v10)
  {
    id v11 = +[IDSAccountSync sharedInstance];
    [v11 incomingSyncMessage:v6];
  }
}

- (void)regenerateRegisteredIdentityWithMessageContext:(id)a3
{
  id v4 = a3;
  uint64_t v5 = +[IMRGLog keyRoll];
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Received request to regenerate registered identity", buf, 2u);
  }

  id v6 = [v4 localObject];

  unsigned __int8 v7 = [(IDSDaemon *)self validateListenerForLocalObject:v6 andCheckEntitlement:kIDSKeyRollingEntitlement];
  if (v7)
  {
    unsigned int v8 = +[IDSRegistrationKeyManager sharedInstance];
    [v8 regenerateRegisteredIdentity];
  }
  else
  {
    unsigned int v8 = +[IMRGLog keyRoll];
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)id v9 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Missing key rolling entitlement -- returning early", v9, 2u);
    }
  }
}

- (void)systemDidLeaveFirstDataProtectionLock
{
  uint64_t v3 = +[IMRGLog registration];
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "System did leave first unlock, checking pending if we cloud paired before unlock", buf, 2u);
  }

  if (self->_cloudPairingBeforeFirstUnlock)
  {
    self->_cloudPairingBeforeFirstUnlock = 0;
    id v4 = +[IMRGLog registration];
    if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)unsigned __int8 v7 = 0;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "   we did! let's update accounts in a few seconds", v7, 2u);
    }

    im_dispatch_after_primary_queue();
  }
  uint64_t v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "System has left first unlock: processing stored incoming messages.", v6, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  [(IDSDaemon *)self _processStoredMessagesIncludingClassD:0];
}

- (void)registrationControlSetRegistrationStateForRegistrationType:(int64_t)a3 toState:(int64_t)a4 requestID:(id)a5 messageContext:(id)a6
{
  id v10 = a5;
  id v11 = a6;
  id v12 = [v11 localObject];
  unsigned __int8 v13 = [(IDSDaemon *)self validateListenerForLocalObject:v12 andCheckEntitlement:kIDSRegistrationControlEntitlement];

  if ((v13 & 1) == 0)
  {
    id v26 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_ERROR, "Attempt to use the Registration Control API's without the correct entitlement, Failing request", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    id v27 = objc_alloc((Class)NSError);
    id v24 = [v27 initWithDomain:IDSRegistrationControlErrorDomain code:3 userInfo:0];
    [(IDSDaemon *)self _respondToRegistrationControlWithRequestID:v10 status:0 messageContext:v11 error:v24];
    goto LABEL_11;
  }
  id v14 = +[IMRGLog iCloud];
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = +[NSNumber numberWithInteger:a3];
    unsigned int v16 = +[NSNumber numberWithInteger:a4];
    unsigned int v17 = [v11 localObject];
    *(_DWORD *)long long buf = 138412802;
    unsigned int v30 = v15;
    __int16 v31 = 2112;
    long long v32 = v16;
    __int16 v33 = 2112;
    id v34 = v17;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "registrationControlSetRegistrationStateForRegistrationType %@ registrationType %@ localObject %@", buf, 0x20u);
  }
  int v18 = +[IDSDRegistrationControl sharedInstance];
  id v28 = 0;
  [v18 updateRegistrationType:a3 toState:a4 error:&v28];
  id v19 = v28;

  [(IDSDaemon *)self respondToRegistrationControlActionWithRequestID:v10 messageContext:v11 error:v19];
  __int16 v20 = [v11 localObject];
  id v21 = [v20 processName];
  LODWORD(v18) = [v21 isEqualToString:@"Setup"];

  if (v18)
  {
    unsigned int v22 = +[FTDeviceSupport sharedInstance];
    id v23 = [v22 isGreenTea];

    id v24 = [objc_alloc((Class)IDSRegistrationControlChosenMetric) initWithControlRegistrationType:a3 registrationControlStatus:a4 isInterestingRegion:v23];
    __int16 v25 = +[IDSAWDLogger logger];
    [v25 logMetric:v24];

LABEL_11:
  }
}

- (void)registrationControlGetRegistrationStateForRegistrationType:(int64_t)a3 requestID:(id)a4 messageContext:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = [v9 localObject];
  unsigned __int8 v11 = [(IDSDaemon *)self validateListenerForLocalObject:v10 andCheckEntitlement:kIDSRegistrationControlEntitlement];

  if (v11)
  {
    id v12 = +[IDSDRegistrationControl sharedInstance];
    id v20 = 0;
    id v13 = [v12 registrationStateForRegistrationType:a3 error:&v20];
    id v14 = v20;

    id v15 = self;
    id v16 = v8;
    id v17 = v13;
  }
  else
  {
    int v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Attempt to use the Registration Control API's without the correct entitlement, Failing request", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    id v19 = objc_alloc((Class)NSError);
    id v14 = [v19 initWithDomain:IDSRegistrationControlErrorDomain code:3 userInfo:0];
    id v15 = self;
    id v16 = v8;
    id v17 = 0;
  }
  [(IDSDaemon *)v15 _respondToRegistrationControlWithRequestID:v16 status:v17 messageContext:v9 error:v14];
}

- (void)respondToRegistrationControlActionWithRequestID:(id)a3 messageContext:(id)a4 error:(id)a5
{
  id v8 = a5;
  id v9 = a3;
  id v10 = [a4 localObject];
  id v11 = [(IDSDaemon *)self listenerRemoteObjectForLocalObject:v10];

  [v11 registrationControlResponseForRequestID:v9 withError:v8];
}

- (void)_respondToRegistrationControlWithRequestID:(id)a3 status:(int64_t)a4 messageContext:(id)a5 error:(id)a6
{
  id v10 = a6;
  id v11 = a5;
  id v12 = a3;
  [v11 setReply:1];
  id v13 = [v11 localObject];
  id v14 = [(IDSDaemon *)self broadcasterForLocalObject:v13 messageContext:v11];

  [v14 registrationControlStatusResponseForRequestID:a4 requestID:v12 withError:v10];
}

- (void)systemDidLeaveDataProtectionLock
{
  if (!self->_hasProcessedMessagesAfterFirstUnlock)
  {
    uint64_t v3 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "System has left data protection lock: Checking Migration Status", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v4 = +[IDSDMessageStoreMigrator sharedInstance];
    [v4 migrateClassA];

    uint64_t v5 = +[IDSDMessageStoreMigrator sharedInstance];
    [v5 migrateClassC];

    if (+[IMUserDefaults isFakingEveryUnlockAsFirstUnlock])
    {
      self->_hasProcessedMessagesAfterFirstUnlock = 0;
      id v6 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)unsigned __int8 v7 = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Faking data protection lock as first unlock: Processing stored messages.", v7, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      [(IDSDaemon *)self _processStoredMessagesIncludingClassD:0];
    }
    else
    {
      self->_hasProcessedMessagesAfterFirstUnlock = 1;
    }
  }
  [(IDSDaemon *)self _processStoredIncomingLocalMessages];
}

- (void)systemWillSleep
{
  uint64_t v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v4 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "System going to sleep", v4, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  self->_deviceIsAsleep = 1;
}

- (void)systemDidWake
{
  uint64_t v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "System waking up", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (self->_deviceIsAsleep != 1)
  {
    id v4 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_ERROR))
    {
      int deviceIsAsleep = self->_deviceIsAsleep;
      *(_DWORD *)long long buf = 67109120;
      int v10 = deviceIsAsleep;
      _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_ERROR, "IDSDaemon got a wake when it was not asleep! Current sleep state: %d", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
  self->_int deviceIsAsleep = 2;
  dispatch_time_t v6 = dispatch_time(0, 5000000000);
  unsigned __int8 v7 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1001CDC00;
  block[3] = &unk_10097E4D0;
  void block[4] = self;
  dispatch_after(v6, v7, block);
}

+ (id)daemon
{
  return +[IDSDaemon sharedInstance];
}

+ (id)uTunDeliveryController
{
  return +[IDSUTunDeliveryController sharedInstance];
}

+ (id)messageStoreForDataProtectionClass:(unsigned int)a3
{
  return +[IDSDMessageStore sharedInstanceForDataProtectionClass:*(void *)&a3];
}

+ (id)serviceController
{
  return +[IDSDServiceController sharedInstance];
}

+ (id)accountController
{
  return +[IDSDAccountController sharedInstance];
}

+ (id)pairingManager
{
  return +[IDSPairingManager sharedInstance];
}

- (id)daemonCapabilities
{
  return +[IDSDaemonCapabilities sharedInstance];
}

- (id)restrictions
{
  return +[IDSRestrictions sharedInstance];
}

- (id)opportunisticDeliveryController
{
  return self->_opportunisticDeliveryController;
}

- (id)uTunController
{
  return +[IDSUTunController sharedInstance];
}

- (id)uTunDeliveryController
{
  return +[IDSUTunDeliveryController sharedInstance];
}

- (id)rapportDeliveryController
{
  return +[IDSRapportDeliveryController sharedInstance];
}

- (id)registrationController
{
  return +[IDSRegistrationController sharedInstance];
}

- (id)accountController
{
  return +[IDSDAccountController sharedInstance];
}

- (id)signInResponder
{
  return self->_signInResponder;
}

- (id)deviceHeartbeatCenter
{
  return +[IDSDeviceHeartbeatCenter sharedInstance];
}

- (id)pairingManager
{
  return +[IDSPairingManager sharedInstance];
}

- (id)encryptionController
{
  return +[IDSEncryptionController sharedInstance];
}

- (id)sessionController
{
  return +[IDSDSessionController sharedInstance];
}

- (id)currentDevice
{
  return +[IDSCurrentDevice sharedInstance];
}

- (id)daemonMIGInterface
{
  return +[IDSDaemonMIGInterface sharedInstance];
}

- (id)daemonMIGQueryInterface
{
  return +[IDSDaemonMIGQueryInterface sharedInstance];
}

- (id)idStatusQueryController
{
  return +[IDSIDStatusQueryController sharedInstance];
}

- (id)messageStoreForDataProtectionClass:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v4 = objc_opt_class();

  return [v4 messageStoreForDataProtectionClass:v3];
}

- (id)messageStoreMigrator
{
  return +[IDSDMessageStoreMigrator sharedInstance];
}

- (id)systemMonitor
{
  return +[IMSystemMonitor sharedInstance];
}

- (id)registrationPushManager
{
  return +[IDSDRegistrationPushManager sharedInstance];
}

- (id)centralRegListener
{
  return +[IDSDRegistrationListener sharedInstance];
}

- (id)serverStorageStateMachine
{
  return +[IDSServerStorageStateMachine sharedInstance];
}

- (id)daemonXPCInterface
{
  return +[IDSDaemonXPCInterface sharedInstance];
}

- (id)pushHandlerForAPSDelegatePort
{
  return +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
}

- (id)serverBagForBagType:(int64_t)a3
{
  return +[IDSServerBag sharedInstanceForBagType:a3];
}

- (id)activityStateMonitor
{
  return +[IDSActivityMonitorStateManager sharedInstance];
}

- (id)firewallNotificationCenter
{
  return self->_firewallNotificationCenter;
}

- (id)persistenceManager
{
  return self->_persistenceManager;
}

- (id)senderKeyDistributionManager
{
  return self->_senderKeyDistributionManager;
}

- (void)_registerForDailyMetricReporting
{
  uint64_t v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Registering for daily metric reporting.", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  *(void *)long long buf = 0xAAAAAAAAAAAAAAAALL;
  objc_initWeak((id *)buf, self);
  handler[0] = _NSConcreteStackBlock;
  handler[1] = 3221225472;
  handler[2] = sub_10028BA58;
  handler[3] = &unk_100982630;
  objc_copyWeak(&v5, (id *)buf);
  xpc_activity_register("com.apple.ids.dailymetricreport", XPC_ACTIVITY_CHECK_IN, handler);
  objc_destroyWeak(&v5);
  objc_destroyWeak((id *)buf);
}

- (void)reportDailyMetrics
{
  id v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)dispatch_time_t v6 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Reporting daily PNR status and daily account added notifications.", v6, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  uint64_t v3 = +[IDSSMSRegistrationCenter sharedInstance];
  [v3 reportDailyMetric];

  id v4 = +[NSNotificationCenter defaultCenter];
  [v4 postNotificationName:@"com.apple.ids.daemonDailyMetricNotification" object:0];

  id v5 = +[IDSAppleIDNotificationCenter sharedInstance];
  [v5 reportDailyNotificationMetrics];
}

- (void)deliveryController:(id)a3 device:(id)a4 supportsDirectMessaging:(BOOL)a5 isObliterating:(BOOL)a6
{
  if (a6) {
    -[IDSDaemon notifyClients:](self, "notifyClients:", 2, a4, a5);
  }
}

- (void)writeIDSDirectMessageInfo:(_dmsg_info *)a3
{
  a3->var0 = 1;
  *(void *)&a3->var3 = 0x600000000000000;
}

- (id)copyDirectMessagingInfo
{
  if (!_IDSSupportsDirectMessaging()) {
    return 0;
  }
  id v3 = objc_alloc_init((Class)NSMutableData);
  v5[0] = 0;
  v5[1] = 0;
  [(IDSDaemon *)self writeIDSDirectMessageInfo:v5];
  [v3 appendBytes:v5 length:16];
  return v3;
}

- (void)processDirectMessagingCapability:(BOOL)a3
{
  if (_IDSSupportsDirectMessaging() && !a3)
  {
    id v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)dispatch_time_t v6 = 0;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "direct messaging capability not supported by peer", v6, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    [(IDSDaemon *)self notifyClients:0];
  }
}

- (void)processDirectMessagingInfo:(id)a3
{
  id v4 = a3;
  if (_IDSSupportsDirectMessaging())
  {
    if ((unint64_t)[v4 length] > 0xF)
    {
      dispatch_time_t v6 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "processing direct messaging info", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      uint64_t v18 = 0;
      uint64_t v19 = 0;
      [v4 getBytes:&v18 length:16];
      uint64_t v16 = 0;
      uint64_t v17 = 0;
      [(IDSDaemon *)self writeIDSDirectMessageInfo:&v16];
      if (v18 >= v16) {
        uint64_t v7 = v16;
      }
      else {
        uint64_t v7 = v18;
      }
      uint64_t v8 = v7 != 0;
      id v9 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 67109632;
        *(_DWORD *)id v21 = v7;
        *(_WORD *)&v21[4] = 1024;
        *(_DWORD *)&v21[6] = v16;
        LOWORD(v22) = 1024;
        *(_DWORD *)((char *)&v22 + 2) = v18;
        _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "direct messaging info: resolved version %u (l:%u r:%u)", buf, 0x14u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v14 = v16;
        uint64_t v15 = v18;
        uint64_t v13 = v7;
        _IDSLogV();
      }
      char v10 = bswap64(v17 & v19);
      if ((v10 & 2) != 0)
      {
        id v11 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "direct messaging info: peer supports device connection", buf, 2u);
        }

        v8 |= 4uLL;
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
      }
      if ((v10 & 4) != 0)
      {
        id v12 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "direct messaging info: peer supports concise ACKs", buf, 2u);
        }

        v8 |= 8uLL;
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
      }
      -[IDSDaemon notifyClients:](self, "notifyClients:", v8, v13, v14, v15);
    }
    else
    {
      id v5 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 134218240;
        *(void *)id v21 = [v4 length];
        *(_WORD *)&v21[8] = 2048;
        uint64_t v22 = 16;
        _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEBUG, "Invalid message size (%lu < %zu)", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        [v4 length];
        _IDSLogV();
      }
    }
  }
}

- (void)notifyClients:(unint64_t)a3
{
  if (_IDSSupportsDirectMessaging() && qword_100A4C4B0 != a3)
  {
    if (a3)
    {
      pthread_mutex_lock(&self->_listenerLock);

      pthread_mutex_unlock(&self->_listenerLock);
    }
    if (dword_100A43430 == -1) {
      notify_register_check("com.apple.ids.direct-messaging", &dword_100A43430);
    }
    id v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      unint64_t v7 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "notifying clients with state: %llu", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    notify_set_state(dword_100A43430, a3);
    notify_post("com.apple.ids.direct-messaging");
    qword_100A4C4B0 = a3;
  }
}

- (void)receivedDirectMsgSocketRequestForService:(id)a3 stream:(id)a4 flags:(unint64_t)a5
{
  id v8 = a3;
  id v9 = a4;
  char v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v12 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Received direct messaging connection for service: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (_IDSSupportsDirectMessaging()) {
    [(IDSDaemon *)self wakeClientForService:v8 stream:v9 flags:a5];
  }
}

- (void)wakeClientForService:(id)a3 stream:(id)a4 flags:(unint64_t)a5
{
  id v7 = a3;
  id v8 = a4;
  if ((a5 & 0x40) != 0)
  {
    char v10 = (int *)&kIDSListenerCapConsumesLaunchOnDemandIncomingMessages;
LABEL_8:
    int v9 = *v10;
    goto LABEL_9;
  }
  if ((a5 & 0x20) != 0)
  {
    char v10 = (int *)&kIDSListenerCapConsumesLaunchOnDemandIncomingData;
    goto LABEL_8;
  }
  if ((a5 & 0x80) != 0) {
    int v9 = kIDSListenerCapConsumesLaunchOnDemandIncomingProtobuf;
  }
  else {
    int v9 = 0;
  }
LABEL_9:
  uint64_t v11 = 100;
  if ((a5 & 0x10) == 0) {
    uint64_t v11 = 200;
  }
  if ((a5 & 8) != 0) {
    uint64_t v12 = 300;
  }
  else {
    uint64_t v12 = v11;
  }
  uint64_t v30 = v12;
  uint64_t v13 = [[IDSIncomingMessageBroadcast alloc] initWithBroadcastBlock:0 needsClientAck:0 messageUUID:@"65AC1229-66CB-4C74-BE47-F5342D60E37E" priority:v12 senderID:@"65AC1229-66CB-4C74-BE47-F5342D60E37E" sequenceNumber:1];
  xpc_object_t v14 = xpc_dictionary_create(0, 0, 0);
  id v28 = v8;
  xpc_object_t v15 = xpc_string_create((const char *)[v28 UTF8String]);
  IMInsertBoolsToXPCDictionary();
  __int16 v29 = v15;
  xpc_dictionary_set_value(v14, "object", v15);
  uint64_t v16 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  CFDictionarySetValue(v16, @"object-type", @"direct-messaging-socket-received");
  uint64_t v17 = +[NSNumber numberWithUnsignedLongLong:](NSNumber, "numberWithUnsignedLongLong:", a5, 1, 0);
  if (v17) {
    CFDictionarySetValue(v16, @"object-flags", v17);
  }

  if (v7) {
    CFDictionarySetValue(v16, @"object-recipient", v7);
  }
  id v27 = [(__CFDictionary *)v16 copy];
  IMInsertKeyedCodableObjectsToXPCDictionary();

  uint64_t v18 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v41 = v7;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "issuing connected socket to client %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v27 = v7;
    _IDSLogV();
  }
  v38[0] = _NSConcreteStackBlock;
  v38[1] = 3221225472;
  v38[2] = sub_100299134;
  v38[3] = &unk_1009879C0;
  id v39 = v14;
  id v19 = v14;
  id v20 = objc_retainBlock(v38);
  id v21 = objc_alloc_init((Class)IMMessageContext);
  objc_msgSend(v21, "setShouldBoost:", 1, v27, 0);
  uint64_t v22 = +[IDSDaemonPriorityQueueController sharedInstance];
  v32[0] = _NSConcreteStackBlock;
  v32[1] = 3221225472;
  v32[2] = sub_100299140;
  v32[3] = &unk_1009879E8;
  id v35 = v21;
  id v36 = v20;
  v32[4] = self;
  __int16 v33 = v13;
  int v37 = v9;
  id v34 = v7;
  id v23 = v21;
  id v24 = v7;
  __int16 v25 = v13;
  id v26 = v20;
  [v22 performBlockWithPriority:v32 priority:v30];
}

+ (BOOL)_canBulkMessageWithPriority:(int64_t)a3 adHocServiceType:(unsigned int)a4
{
  return a4 != 2 && a4 != 5 && a3 != 300;
}

+ (void)sendMessageWithIDSSendParameters:(id)a3 messageContext:(id)a4 threadContext:(id)a5 progressBlock:(id)a6 onObject:(id)a7
{
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a6;
  id v15 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  long long v59 = _os_activity_create((void *)&_mh_execute_header, "Daemon sendMessage with parameters", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v59, &state);
  uint64_t v16 = [v13 serviceIdentifier];
  uint64_t v17 = [v13 servicePushTopic];
  id v40 = [v13 listenerID];
  __int16 v44 = [v13 entitlements];
  id v18 = [v13 serviceAdHocType];
  uint64_t v43 = [v13 accountDescription];
  id v19 = [v13 subService];
  if ([v19 length]) {
    [v13 subService];
  }
  else {
  id v42 = [v13 serviceIdentifier];
  }

  unsigned __int8 v20 = [v13 silentlyFailMessagesOnSwitch];
  if ([a1 entitlementDictionary:v44 isEntitledToAccessService:v16 forEntitlement:kIDSMessagingEntitlement forAccount:v43 shouldWarn:0])
  {
    if ([a1 entitlementDictionary:v44 isEntitledToAccessService:v16 forEntitlement:kIDSBypassSizeCheckEntitlement forAccount:v43 shouldWarn:0])objc_msgSend(v11, "setBypassSizeCheck:", 1); {
    id v38 = [v11 priority];
    }
    id v21 = +[IDSTrafficMonitor sharedInstance];
    unsigned __int8 v22 = [v21 noteOutgoingMessageForService:v42 serviceType:v18 requestor:v40];
    unsigned __int8 v37 = v20;

    if (v22)
    {
      unsigned int v23 = [v11 homeKitPayload];
      [v11 setEncryptPayload:1];
      if (v23)
      {
        [v11 setCompressPayload:0];
        [v11 setEncryptPayload:0];
      }
      if ([v16 isEqualToString:@"com.apple.private.alloy.bulletinboard"]) {
        [v11 setEncryptPayload:0];
      }
      if ([v11 forceEncryptionOff]
        && [v16 isEqualToString:@"com.apple.private.alloy.keychainsync"]
        && [a1 entitlementDictionary:v44 isEntitledToAccessService:v16 forEntitlement:kIDSForceEncryptionOffEntitlement forAccount:v43 shouldWarn:0])
      {
        id v24 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          long long v61 = v16;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "Forcing encryption off for message on %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v34 = v16;
          _IDSLogV();
        }
        objc_msgSend(v11, "setEncryptPayload:", 0, v34);
      }
      [v12 setShouldBoost:v38 == (id)300];
      __int16 v25 = [v11 requireAllRegistrationProperties];
      id v36 = v16;
      if (v25
        || ([v11 interestingRegistrationProperties],
            (__int16 v25 = objc_claimAutoreleasedReturnValue()) != 0))
      {
      }
      else
      {
        long long v32 = [v11 requireLackOfRegistrationProperties];
        BOOL v33 = v32 == 0;

        if (v33)
        {
          id v27 = v17;
          id v28 = v15;
          id v29 = v14;
          uint64_t v30 = v12;
          id v39 = 0;
          goto LABEL_25;
        }
      }
      v55[0] = _NSConcreteStackBlock;
      v55[1] = 3221225472;
      v55[2] = sub_10037FD6C;
      v55[3] = &unk_10098A5E0;
      id v56 = v11;
      id v57 = v12;
      id v26 = objc_retainBlock(v55);

      id v39 = v26;
      id v27 = v17;
      id v28 = v15;
      id v29 = v14;
      uint64_t v30 = v12;
LABEL_25:
      v45[0] = _NSConcreteStackBlock;
      v45[1] = 3221225472;
      v45[2] = sub_10038010C;
      v45[3] = &unk_10098A608;
      id v35 = _os_activity_create((void *)&_mh_execute_header, "Send message with send parameters", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_IF_NONE_PRESENT);
      char v46 = v35;
      id v47 = v11;
      id v48 = v30;
      unsigned __int8 v54 = v37;
      id v49 = v42;
      id v50 = v13;
      id v53 = a1;
      id v51 = v28;
      id v52 = v27;
      [a1 _sendMessageWithSendParameters:v47 threadContext:v50 onObject:v51 willSendBlock:v39 progressBlock:v29 completionBlock:v45];

      id v12 = v30;
      id v14 = v29;
      id v15 = v28;
      uint64_t v17 = v27;
      uint64_t v16 = v36;

      goto LABEL_30;
    }
    __int16 v31 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v61 = v42;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "*** Over budget, failing sendMessage on service: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
LABEL_30:

  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

+ (void)_forwardSendMessageToAccountWithSendParameters:(id)a3 service:(id)a4 threadContext:(id)a5 guid:(id)a6 dataProtectionClass:(unsigned int)a7 willSendBlock:(id)a8 progressBlock:(id)a9 completionBlock:(id)a10
{
  id v14 = a3;
  id v15 = a4;
  id v37 = a5;
  id v16 = a6;
  id v38 = a8;
  id v17 = a9;
  id v18 = a10;
  id v19 = [v14 data];

  if (v19)
  {
    unsigned __int8 v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEBUG))
    {
      id v35 = v15;
      id v21 = [v14 accountUUID];
      unsigned __int8 v22 = [v14 data];
      unsigned int v23 = [v22 length];
      id v24 = [v14 destinations];
      __int16 v25 = [v14 identifier];
      *(_DWORD *)long long buf = 138413314;
      id v45 = v21;
      __int16 v46 = 1024;
      *(_DWORD *)id v47 = v23;
      *(_WORD *)&v47[4] = 2112;
      *(void *)&v47[6] = v24;
      *(_WORD *)&v47[14] = 2112;
      *(void *)&v47[16] = v25;
      *(_WORD *)&v47[24] = 2112;
      *(void *)&v47[26] = v16;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEBUG, "account %@ sendMessage with data size: %d to: %@ identifier: %@ guid: %@", buf, 0x30u);

      id v15 = v35;
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v26 = [v14 accountUUID];
      id v27 = [v14 data];
      [v27 length];
      id v28 = [v14 destinations];
      id v29 = [v14 identifier];
      _IDSLogV();
LABEL_12:
    }
  }
  else
  {
    uint64_t v30 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
    {
      id v31 = [v14 accountUUID];
      id v32 = [v14 message];
      id v33 = [v14 destinations];
      id v34 = [v14 identifier];
      *(_DWORD *)long long buf = 138413314;
      id v45 = v31;
      __int16 v46 = 2112;
      *(void *)id v47 = v32;
      *(_WORD *)&v47[8] = 2112;
      *(void *)&v47[10] = v33;
      *(_WORD *)&v47[18] = 2112;
      *(void *)&v47[20] = v34;
      *(_WORD *)&v47[28] = 2112;
      *(void *)&v47[30] = v16;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "account %@ sendMessage: %@ to: %@ identifier: %@ guid: %@", buf, 0x34u);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v26 = [v14 accountUUID];
      id v27 = [v14 message];
      id v28 = [v14 destinations];
      id v29 = [v14 identifier];
      _IDSLogV();
      goto LABEL_12;
    }
  }
  v39[0] = _NSConcreteStackBlock;
  v39[1] = 3221225472;
  v39[2] = sub_1003815AC;
  void v39[3] = &unk_10098A630;
  id v42 = v18;
  id v40 = v16;
  id v41 = v14;
  unsigned int v43 = a7;
  +[IDSDAccount sendMessageWithSendParameters:v41 service:v15 threadContext:v37 willSendBlock:v38 progressBlock:v17 completionBlock:v39];
}

+ (void)_sendMessageWithSendParameters:(id)a3 threadContext:(id)a4 onObject:(id)a5 willSendBlock:(id)a6 progressBlock:(id)a7 completionBlock:(id)a8
{
  id v13 = a3;
  id v14 = a4;
  id v229 = a5;
  id v230 = a6;
  id v231 = a7;
  v238 = (void (**)(id, id))a8;
  id v15 = [v14 subService];
  if ([v15 length]) {
    [v14 subService];
  }
  else {
  v237 = [v14 serviceIdentifier];
  }

  v235 = [v13 subService];
  v232 = [v14 serviceDuetIdentifiers];
  [v14 serviceIsDSBased];
  v233 = [v14 primaryRegistrationDSHandle];
  id v16 = [v14 serviceAdHocType];
  v234 = [v14 aliasStrings];
  unsigned int v226 = [v14 dataProtectionClass];
  unsigned __int8 v17 = [v14 isRegistrationActive];
  char v18 = [v14 shouldProtectTrafficUsingClassA];
  int v19 = [v14 dataProtectionClass];
  unsigned __int8 v20 = [v14 serviceIdentifier];
  int v21 = sub_100384524(v18, v19, v20);

  if (v17)
  {
    int v219 = v21;
    if (!v21
      || (+[IDSPairingManager sharedInstance],
          unsigned __int8 v22 = objc_claimAutoreleasedReturnValue(),
          [v22 pairedDeviceUniqueID],
          unsigned int v23 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v24 = +[IDSEncryptionHelpers areDataProtectionKeysAvailableForService:v237 withDataProtectionClass:1 fromDevice:v23], v23, v22, (v24 & 1) != 0))
    {
      v225 = [v13 fromID];
      if (([v13 disableAliasValidation] & 1) == 0)
      {
        v228 = v225;
        v223 = [(__CFString *)v228 _stripFZIDPrefix];

        long long v257 = 0u;
        long long v258 = 0u;
        long long v255 = 0u;
        long long v256 = 0u;
        __int16 v25 = [v13 destinations];
        id v26 = [v25 destinationURIs];

        id v27 = [v26 countByEnumeratingWithState:&v255 objects:v279 count:16];
        if (v27)
        {
          uint64_t v28 = *(void *)v256;
          while (2)
          {
            for (i = 0; i != v27; i = (char *)i + 1)
            {
              if (*(void *)v256 != v28) {
                objc_enumerationMutation(v26);
              }
              uint64_t v30 = *(__CFString **)(*((void *)&v255 + 1) + 8 * i);
              if ([(__CFString *)v30 hasSuffix:@"inbox.appleid.apple.com"])
              {
                id v37 = +[IMIDSLog daemon];
                if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                {
                  id v38 = [v13 messageUUID];
                  id v39 = [v13 destinations];
                  *(_DWORD *)long long buf = 138412802;
                  CFStringRef v262 = v30;
                  __int16 v263 = 2114;
                  CFStringRef v264 = v38;
                  __int16 v265 = 2112;
                  CFStringRef v266 = v39;
                  _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "At least one destination is mako {destinationURI: %@, guid: %{public}@, destinations: %@}", buf, 0x20u);
                }
                goto LABEL_27;
              }
            }
            id v27 = [v26 countByEnumeratingWithState:&v255 objects:v279 count:16];
            if (v27) {
              continue;
            }
            break;
          }
        }
LABEL_27:

        v227 = [v233 _stripFZIDPrefix];
        _IDSPrefersPhoneNumbersForServiceIdentifier();
        id v40 = [v14 pseudonyms];
        v225 = (void *)_IDSCopyCallerIDWithSelfMessagingHint();

        [v13 setFromID:v225];
        v224 = [v225 _bestGuessURI];
        if (v228 && v224 && ([(__CFString *)v224 isEqualToString:v228] & 1) == 0)
        {
          id v63 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v63, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412546;
            CFStringRef v262 = v228;
            __int16 v263 = 2112;
            CFStringRef v264 = v224;
            _os_log_impl((void *)&_mh_execute_header, v63, OS_LOG_TYPE_ERROR, "sendMessage - fromID (%@) does not match the account (%@). We are forced to fail this message send.", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            _IDSWarnV();
            _IDSLogV();
            _IDSLogTransport();
          }
          if (!v238) {
            goto LABEL_316;
          }
          id v64 = objc_alloc((Class)NSError);
          v221 = (__CFString *)[v64 initWithDomain:IDSSendErrorDomain code:7 userInfo:0];
          id v222 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:7 error:v221 lastCall:1];
          v238[2](v238, v222);
LABEL_315:

LABEL_316:
          goto LABEL_317;
        }
      }
      if ([v235 length])
      {
        v228 = v235;
      }
      else
      {
        v228 = [v14 servicePushTopic];
      }
      id v41 = [a1 serviceController];
      v227 = [v41 serviceWithPushTopic:v228];

      id v42 = objc_alloc((Class)IDSURI);
      unsigned int v43 = [v13 fromID];
      __int16 v44 = [v43 _bestGuessURI];
      v224 = (__CFString *)[v42 initWithPrefixedURI:v44];

      if ([v227 supportsOfflineDelivery])
      {
        id v45 = +[IDSPeerIDManager sharedInstance];
        __int16 v46 = [v45 shortHandleForURI:v224 fromURI:v224];
        [v13 setFromShortHandle:v46];
      }
      id v47 = [v13 destinations];
      id v48 = [v47 destinationURIs];
      uint64_t v49 = kIDSServiceDefaultsSentinelSelfAlias;
      unsigned int v50 = [v48 containsObject:kIDSServiceDefaultsSentinelSelfAlias];

      if (v50)
      {
        id v51 = [v13 destinations];
        id v52 = [v51 destinationURIs];
        id v47 = [v52 mutableCopy];

        [v47 removeObject:v49];
        if (v233) {
          [v47 addObject:v233];
        }
        id v53 = +[IDSDestination destinationWithStrings:v47];
        [v13 setDestinations:v53];
      }
      unsigned __int8 v54 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v54, OS_LOG_TYPE_DEFAULT))
      {
        if ([v13 priority] == (id)300)
        {
          CFStringRef v55 = @"URGENT";
        }
        else if ([v13 priority] == (id)200)
        {
          CFStringRef v55 = @"Default";
        }
        else
        {
          CFStringRef v55 = @"Sync";
        }
        id v56 = [v13 identifier];
        id v57 = [v13 messageType];
        id v47 = [v13 destinations];
        IMLoggingStringForArray();
        id v58 = (id)objc_claimAutoreleasedReturnValue();
        qos_class_t v59 = qos_class_self();
        *(_DWORD *)long long buf = 138545410;
        CFStringRef v60 = @"not local type";
        BOOL v61 = v16 == 5 || v16 == 2;
        CFStringRef v262 = v55;
        __int16 v263 = 2114;
        if (v61) {
          CFStringRef v60 = @"adhoc type 2";
        }
        CFStringRef v264 = v56;
        __int16 v265 = 2112;
        CFStringRef v266 = v57;
        __int16 v267 = 2112;
        CFStringRef v268 = v237;
        __int16 v269 = 2112;
        id v270 = v47;
        __int16 v271 = 2112;
        v272 = v225;
        __int16 v273 = 2112;
        id v274 = v58;
        __int16 v275 = 2114;
        CFStringRef v276 = v60;
        __int16 v277 = 1024;
        qos_class_t v278 = v59;
        _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_DEFAULT, "Daemon sending message with priority %{public}@ guid: %{public}@ messageType: %@, serviceIdentifier: %@ to: %@   from: %@   aliases: %@  service type: %{public}@   QoS=0x%x", buf, 0x58u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
      {
        if ([v13 priority] == (id)300) {
          long long v62 = @"URGENT";
        }
        else {
          long long v62 = [v13 priority] == (id)200 ? @"Default" : @"Sync";
        }
        id v65 = [v13 identifier];
        id v47 = [v13 messageType];
        __int16 v66 = [v13 destinations];
        id v67 = IMLoggingStringForArray();
        BOOL v68 = v16 == 5 || v16 == 2;
        uint64_t v69 = v68 ? @"adhoc type 2" : @"not local type";
        v210 = v69;
        uint64_t v211 = qos_class_self();
        v185 = v62;
        v198 = v65;
        v208 = v225;
        v209 = v67;
        v205 = v237;
        v207 = v66;
        id v202 = v47;
        _IDSLogTransport();

        if (_IDSShouldLog())
        {
          if (objc_msgSend(v13, "priority", v62, v65, v47, v237, v66, v225, v67, v69, v211) == (id)300)
          {
            CFStringRef v70 = @"URGENT";
          }
          else if ([v13 priority] == (id)200)
          {
            CFStringRef v70 = @"Default";
          }
          else
          {
            CFStringRef v70 = @"Sync";
          }
          int v71 = [v13 identifier];
          id v47 = [v13 messageType];
          __int16 v72 = [v13 destinations];
          uint64_t v73 = IMLoggingStringForArray();
          v210 = v69;
          uint64_t v211 = qos_class_self();
          v208 = v225;
          v209 = v73;
          v205 = v237;
          v207 = v72;
          v198 = v71;
          id v202 = v47;
          v185 = (__CFString *)v70;
          _IDSLogV();
        }
      }
      if (objc_msgSend(v13, "homeKitPayload", v185, v198, v202, v205, v207, v208, v209, v210, v211)) {
        [v13 setCommand:&off_1009D1E48];
      }
      __int16 v74 = [v13 command];
      BOOL v75 = v74 == 0;

      if (v75)
      {
        id v76 = [v13 protobuf];

        if (v76)
        {
          uint64_t v77 = &off_1009D1E60;
        }
        else
        {
          long long v78 = [v13 data];

          if (v78) {
            uint64_t v77 = &off_1009D1E78;
          }
          else {
            uint64_t v77 = &off_1009D1E90;
          }
        }
        [v13 setCommand:v77];
      }
      BOOL v79 = v16 == 2;
      if (v16 == 5) {
        BOOL v79 = 1;
      }
      BOOL v217 = v79;
      if (v16 == 5 || v16 == 2)
      {
        if ((uint64_t)[v13 priority] < 101 || objc_msgSend(v13, "nonWaking")) {
          [v13 setLocalDelivery:1];
        }
        id v47 = [a1 uTunDeliveryController];
        unsigned int v80 = [v47 localSetupInProgress];
      }
      else
      {
        unsigned int v80 = 0;
      }
      if (v16 == 5 || v16 == 2) {

      }
      if (v80) {
        [v13 setBypassDuet:1];
      }
      if ([a1 _shouldReplaceLocalDestination:v14])
      {
        id v81 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v81, OS_LOG_TYPE_DEFAULT))
        {
          *(_WORD *)long long buf = 0;
          _os_log_impl((void *)&_mh_execute_header, v81, OS_LOG_TYPE_DEFAULT, "Proxy outgoing message, setting current paired device as local destination", buf, 2u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        id v82 = [a1 pairingManager];
        id v83 = [v82 pairedDeviceUniqueID];
        [v13 setLocalDestinationDeviceUUID:v83];
      }
      uint64_t v84 = [v13 localDestinationDeviceUUID];
      id v85 = [v84 length];

      if ((v16 == 5 || v16 == 2) && !v85)
      {
        id v86 = [v13 destinations];
        id v87 = [v86 destinationURIs];
        __int16 v88 = [v87 allObjects];
        id v89 = [v88 firstObject];
        id v254 = 0;
        id v222 = [v89 _stripPotentialTokenURIWithToken:&v254];
        v221 = (__CFString *)v254;

        __int16 v90 = [v13 destinations];
        int v91 = [v90 destinationURIs];
        __int16 v92 = [v91 allObjects];
        id v93 = [v92 firstObject];
        unsigned int v94 = [v93 isEqualToIgnoringCase:IDSDefaultPairedDevice];

        id v95 = +[IDSPairingManager sharedInstance];
        LODWORD(v90) = [v95 activePairedDeviceHasPairingType:1];

        if (((v94 & v90 ^ 1 | [v14 serviceWantsTinkerDevices]) & 1) == 0)
        {
          uint64_t v98 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v98, OS_LOG_TYPE_ERROR))
          {
            id v99 = [v13 messageUUID];
            *(_DWORD *)long long buf = 138412546;
            CFStringRef v262 = v99;
            __int16 v263 = 2112;
            CFStringRef v264 = v237;
            _os_log_impl((void *)&_mh_execute_header, v98, OS_LOG_TYPE_ERROR, "sendMessage - sending to tinker IDSDefaultPairedDevice. Failing message... { guid: %@, service: %@ }", buf, 0x16u);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            v190 = [v13 messageUUID];
            _IDSWarnV();

            v191 = objc_msgSend(v13, "messageUUID", v190, v237);
            _IDSLogV();

            v192 = objc_msgSend(v13, "messageUUID", v191, v237);
            _IDSLogTransport();
          }
          if (!v238) {
            goto LABEL_315;
          }
          id v100 = objc_alloc((Class)NSError);
          NSErrorUserInfoKey v259 = NSDebugDescriptionErrorKey;
          CFStringRef v260 = @"Default paired watch is Tinker, but sending service is not Tinker aware. If you need to send locally to a Tinker watch, please contact IDS Engineering to have your service reconfigured";
          id v101 = +[NSDictionary dictionaryWithObjects:&v260 forKeys:&v259 count:1];
          id v220 = [v100 initWithDomain:IDSSendErrorDomain code:32 userInfo:v101];

          id v102 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:32 error:v220 lastCall:1];
          v238[2](v238, v102);
          goto LABEL_314;
        }
        if ((v94 & 1) != 0 || [v222 isEqualToIgnoringCase:IDSLocalDeviceIdentity])
        {
          v96 = +[IDSPairingManager sharedInstance];
          uint64_t v97 = [v96 pairedDeviceUniqueID];
        }
        else
        {
          id v103 = [v13 destinations];
          id v104 = [v103 destinationURIs];
          id v105 = [v104 allObjects];
          v96 = [v105 firstObject];

          uint64_t v97 = [v96 _stripFZIDPrefix];
        }
        id v106 = (void *)v97;
        [v13 setLocalDestinationDeviceUUID:v97];
      }
      if ([v13 liveMessageDelivery]
        && ([v14 serviceAllowLiveMessageDelivery] & 1) != 0)
      {
        uint64_t v107 = 7;
      }
      else if (v16 == 5 || v16 == 2)
      {
        if ((([v13 allowCloudDelivery] & 1) != 0
           || [v13 nonCloudWaking])
          && ([v14 shouldAllowCloudDelivery] & 1) != 0)
        {
          uint64_t v107 = 6;
        }
        else if ([v14 serviceAllowProxyDelivery])
        {
          uint64_t v107 = 2;
        }
        else
        {
          uint64_t v107 = 4;
        }
      }
      else if ([v14 serviceAllowLocalDelivery] {
             && [v14 serviceAdHocType] == 1)
      }
      {
        uint64_t v107 = 5;
      }
      else
      {
        uint64_t v107 = 1;
      }
      id v108 = +[NSNumber numberWithLongLong:v107];
      [v13 setMessageType:v108];

      if ([v13 priority] == (id)300)
      {
        id v108 = [v13 messageType];
        BOOL v109 = [v108 integerValue] == (id)1;

        if (v109) {
          goto LABEL_142;
        }
        id v108 = [a1 accountController];
        long long v110 = [v13 accountUUID];
        long long v111 = [v108 accountWithUniqueID:v110];
        BOOL v112 = [v111 accountType] == 2;

        if (!v112) {
LABEL_142:
        }
          [v13 setBypassStorage:1];
      }
      if (objc_msgSend(a1, "_canBulkMessageWithPriority:adHocServiceType:", objc_msgSend(v13, "priority"), v16))
      {
        v221 = 0;
      }
      else
      {
        v221 = [v13 identifier];
      }
      id v222 = [a1 messageStoreForDataProtectionClass:v226];
      if (!v222)
      {
        long long v113 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v113, OS_LOG_TYPE_DEFAULT))
        {
          IDSDataProtectionClassStringFromDataProtectionClass();
          CFStringRef v114 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)long long buf = 138412546;
          CFStringRef v262 = v114;
          __int16 v263 = 2112;
          CFStringRef v264 = v237;
          _os_log_impl((void *)&_mh_execute_header, v113, OS_LOG_TYPE_DEFAULT, "Didn't find message store for data protection class %@ for %@", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v193 = IDSDataProtectionClassStringFromDataProtectionClass();
          _IDSLogV();
        }
        if (!v238) {
          goto LABEL_315;
        }
        id v115 = objc_alloc((Class)NSError);
        id v220 = [v115 initWithDomain:IDSSendErrorDomain code:18 userInfo:0];
        id v102 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:18 error:v220 lastCall:1];
        v238[2](v238, v102);
        CFStringRef v116 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v116, OS_LOG_TYPE_DEFAULT))
        {
          IDSDataProtectionClassStringFromDataProtectionClass();
          __int16 v117 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)long long buf = 138412546;
          CFStringRef v262 = v117;
          __int16 v263 = 2112;
          CFStringRef v264 = v237;
          _os_log_impl((void *)&_mh_execute_header, v116, OS_LOG_TYPE_DEFAULT, "Data protection class %@ is unavailable for %@, failing outgoing message", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v194 = IDSDataProtectionClassStringFromDataProtectionClass();
            _IDSLogTransport();

            if (_IDSShouldLog())
            {
              v195 = IDSDataProtectionClassStringFromDataProtectionClass();
              _IDSLogV();
            }
          }
        }
        goto LABEL_314;
      }
      if ([v13 priority] == (id)300)
      {
        if (v16 == 5 || v16 == 2)
        {
          id v108 = +[IDSUTunDeliveryController sharedInstance];
          unsigned int v216 = [v108 hasSpaceForMessagesWithPriority:300 dataProtectionClass:v226];
        }
        else
        {
          unsigned int v216 = 1;
        }
      }
      else
      {
        unsigned int v216 = 0;
      }
      id v220 = [v227 allowedTrafficClasses];
      if (([v220 containsObject:@"com.apple.ids.trafficclass.nanoregistry.check"] & 1) != 0
        || ([v220 containsObject:@"com.apple.ids.trafficclass.nanoregistry.configure"] & 1) != 0)
      {
        unsigned int v214 = 1;
      }
      else
      {
        unsigned int v214 = [v220 containsObject:@"com.apple.ids.trafficclass.nanoregistry.update"];
      }
      if (([v13 bypassStorage] & 1) != 0
        || ([v13 bypassDuet] & 1) != 0
        || ([v13 requireBluetooth] & 1) != 0)
      {
        unsigned int v118 = 1;
      }
      else
      {
        unsigned int v118 = [v13 requireLocalWiFi] | v214;
      }
      unsigned int v218 = v118;
      if (v16 == 5 || v16 == 2)
      {
        id v108 = [a1 uTunDeliveryController];
        unsigned int v119 = v218 & ~objc_msgSend(v108, "hasSpaceForMessagesWithPriority:dataProtectionClass:", objc_msgSend(v13, "priority"), v226);
      }
      else
      {
        unsigned int v119 = 0;
      }
      if (v16 == 5 || v16 == 2) {

      }
      if (v119)
      {
        int v120 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v120, OS_LOG_TYPE_DEFAULT))
        {
          if ([v13 priority] == (id)300)
          {
            CFStringRef v121 = @"URGENT";
          }
          else if ([v13 priority] == (id)200)
          {
            CFStringRef v121 = @"Default";
          }
          else
          {
            CFStringRef v121 = @"Sync";
          }
          IDSDataProtectionClassStringFromDataProtectionClass();
          id v122 = (__CFString *)(id)objc_claimAutoreleasedReturnValue();
          *(_DWORD *)long long buf = 138412546;
          CFStringRef v262 = v121;
          __int16 v263 = 2112;
          CFStringRef v264 = v122;
          _os_log_impl((void *)&_mh_execute_header, v120, OS_LOG_TYPE_DEFAULT, "Telling clients (via IDSResponsePersisted) not to replay this message if the daemon crashes because the %@ priority queue (dataProtectionClass: %@) is full", buf, 0x16u);
        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
        {
          if ([v13 priority] == (id)300) {
            __int16 v123 = @"URGENT";
          }
          else {
            __int16 v123 = [v13 priority] == (id)200 ? @"Default" : @"Sync";
          }
          IDSDataProtectionClassStringFromDataProtectionClass();
          v199 = v189 = v123;
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            if (objc_msgSend(v13, "priority", v123, v199) == (id)300)
            {
              CFStringRef v124 = @"URGENT";
            }
            else if ([v13 priority] == (id)200)
            {
              CFStringRef v124 = @"Default";
            }
            else
            {
              CFStringRef v124 = @"Sync";
            }
            IDSDataProtectionClassStringFromDataProtectionClass();
            v199 = v189 = (__CFString *)v124;
            _IDSLogV();
          }
        }
        id v125 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:11 error:0 lastCall:0];
        v238[2](v238, v125);
      }
      uint64_t v126 = objc_msgSend(v13, "message", v189, v199);

      if (!v126)
      {
LABEL_258:
        v155 = objc_msgSend(a1, "pairingManager", v196, v200, v203);
        id v102 = [v155 pairedDeviceUniqueID];

        v156 = [v13 localDestinationDeviceUUID];
        unsigned __int8 v157 = [v102 isEqualToIgnoringCase:v156];
        if ([v156 length]) {
          char v158 = v157;
        }
        else {
          char v158 = 1;
        }
        int v159 = v219;
        if ((v158 & 1) == 0)
        {
          v160 = OSLogHandleForTransportCategory();
          if (os_log_type_enabled(v160, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v160, OS_LOG_TYPE_DEFAULT, "This local Message is not for the current device, sending to the database to be taken care of later", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            if (_IDSShouldLogTransport())
            {
              _IDSLogTransport();
              if (_IDSShouldLog()) {
                _IDSLogV();
              }
            }
          }
          unsigned int v216 = 0;
          unsigned int v218 = 0;
          int v159 = v219;
        }
        if (!v159) {
          goto LABEL_289;
        }
        CFStringRef v252 = 0;
        v161 = [v13 protobuf];

        if (v161)
        {
          id v162 = objc_alloc((Class)IDSProtobuf);
          v163 = [v13 protobuf];
          id v164 = [v162 initWithDictionary:v163];

          v165 = [v164 data];
          v166 = +[IDSEncryptionHelpers encryptLocalDeliveryPayload:v165 toDevice:v156 forService:v237 withDataProtectionClass:1 encryptionType:1 priority:300 error:&v252];

          if (v166)
          {
            [v164 setData:v166];
            v167 = [v164 dictionaryRepresentation];
            [v13 setProtobuf:v167];

LABEL_288:
LABEL_289:
            v176 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v176, OS_LOG_TYPE_DEFAULT))
            {
              CFStringRef v177 = @"NO";
              if (v216) {
                CFStringRef v178 = @"YES";
              }
              else {
                CFStringRef v178 = @"NO";
              }
              *(_DWORD *)long long buf = 138413058;
              CFStringRef v262 = v221;
              if (v218) {
                CFStringRef v179 = @"YES";
              }
              else {
                CFStringRef v179 = @"NO";
              }
              CFStringRef v264 = v178;
              __int16 v263 = 2112;
              __int16 v265 = 2112;
              if (v214) {
                CFStringRef v177 = @"YES";
              }
              CFStringRef v266 = v179;
              __int16 v267 = 2112;
              CFStringRef v268 = v177;
              _os_log_impl((void *)&_mh_execute_header, v176, OS_LOG_TYPE_DEFAULT, "Store outgoing message {guid: %@, canSendUrgent: %@, forceImmediateSend: %@, hasSpecialTrafficClass: %@}", buf, 0x2Au);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
            {
              if (v216) {
                CFStringRef v180 = @"YES";
              }
              else {
                CFStringRef v180 = @"NO";
              }
              if (v218) {
                CFStringRef v181 = @"YES";
              }
              else {
                CFStringRef v181 = @"NO";
              }
              if (v214) {
                CFStringRef v182 = @"YES";
              }
              else {
                CFStringRef v182 = @"NO";
              }
              CFStringRef v204 = v181;
              CFStringRef v206 = v182;
              v197 = v221;
              CFStringRef v201 = v180;
              _IDSLogTransport();
              if (_IDSShouldLog())
              {
                CFStringRef v204 = v181;
                CFStringRef v206 = v182;
                v197 = v221;
                CFStringRef v201 = v180;
                _IDSLogV();
              }
            }
            v183 = +[IDSDaemonPriorityQueueController sharedInstance];
            v184 = objc_msgSend(v183, "queueForPriority:", (int)objc_msgSend(v13, "priority"));
            v239[0] = _NSConcreteStackBlock;
            v239[1] = 3221225472;
            v239[2] = sub_100384B9C;
            v239[3] = &unk_10098A748;
            v246 = v238;
            id v240 = v13;
            id v249 = a1;
            id v241 = v227;
            id v242 = v14;
            unsigned int v250 = v226;
            id v247 = v230;
            id v248 = v231;
            BOOL v251 = v217;
            id v243 = v229;
            v244 = v237;
            id v245 = v232;
            [v222 storeOutgoingMessageWithSendParameters:v240 guid:v221 canSend:v216 | v218 canBypassSimilarMessages:v218 fromQueue:v184 completionBlock:v239];

LABEL_313:
            goto LABEL_314;
          }
          v166 = v164;
        }
        else
        {
          v168 = [v13 data];

          if (v168)
          {
            v169 = [v13 data];
            v166 = +[IDSEncryptionHelpers encryptLocalDeliveryPayload:v169 toDevice:v156 forService:v237 withDataProtectionClass:1 encryptionType:1 priority:300 error:&v252];

            if (v166)
            {
              [v13 setData:v166];
              goto LABEL_288;
            }
LABEL_279:
            v170 = OSLogHandleForTransportCategory();
            if (os_log_type_enabled(v170, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 134217984;
              CFStringRef v262 = v252;
              _os_log_impl((void *)&_mh_execute_header, v170, OS_LOG_TYPE_DEFAULT, "A over C encryption has failed to encrypt with error %ld", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              if (_IDSShouldLogTransport())
              {
                _IDSLogTransport();
                if (_IDSShouldLog()) {
                  _IDSLogV();
                }
              }
            }
            id v171 = objc_alloc((Class)NSError);
            id v172 = [v171 initWithDomain:IDSSendErrorDomain code:26 userInfo:0];
            id v173 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:26 error:v172 lastCall:1];
            v238[2](v238, v173);

            goto LABEL_313;
          }
          v166 = [v13 message];
          v174 = JWEncodeDictionary();
          v175 = +[IDSEncryptionHelpers encryptLocalDeliveryPayload:v174 toDevice:v156 forService:v237 withDataProtectionClass:1 encryptionType:1 priority:300 error:&v252];
          if (v175)
          {
            [v13 setData:v175];
            [v13 setMessage:0];

            goto LABEL_288;
          }
        }
        goto LABEL_279;
      }
      id v102 = [v13 message];
      uint64_t v127 = objc_opt_class();
      uint64_t v128 = IDSMessageResourceTransferURLKey;
      sub_1002B4B18(v127, v102, IDSMessageResourceTransferURLKey);
      v215 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (!v215)
      {
LABEL_257:

        goto LABEL_258;
      }
      [v13 setEnforceRemoteTimeouts:1];
      uint64_t v129 = CSDBGetMobileUserDirectory();
      if (v129)
      {
        id v130 = +[NSString stringWithUTF8String:v129];
      }
      else
      {
        id v130 = @"~";
      }
      BOOL v131 = v129 == 0;
      id v132 = [v13 identifier];
      id v133 = +[NSArray arrayWithObjects:v130, @"/Library/IdentityServices/files/", v132, 0];
      v213 = +[NSString pathWithComponents:v133];

      if (!v131) {
      uint64_t v134 = +[NSFileManager defaultManager];
      }
      id v253 = 0;
      unsigned __int8 v135 = [v134 createDirectoryAtPath:v213 withIntermediateDirectories:1 attributes:0 error:&v253];
      v212 = (__CFString *)v253;

      if ((v135 & 1) == 0)
      {
        long long v139 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v139, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          CFStringRef v262 = v213;
          __int16 v263 = 2112;
          CFStringRef v264 = v212;
          _os_log_impl((void *)&_mh_execute_header, v139, OS_LOG_TYPE_DEFAULT, "file persistence - failed to create unique file directory %@ error %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            _IDSLogTransport();
            if (_IDSShouldLog()) {
              _IDSLogV();
            }
          }
        }
        if (v238)
        {
          id v140 = objc_alloc((Class)NSError);
          id v141 = [v140 initWithDomain:IDSSendErrorDomain code:22 userInfo:0];
          id v142 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:22 error:v141 lastCall:1];
          v238[2](v238, v142);
        }
        goto LABEL_273;
      }
      uint64_t v136 = objc_opt_class();
      long long v137 = sub_1002B4B18(v136, v102, IDSMessageResourceTransferSandboxExtensionKey);
      long long v138 = v137;
      if (v137)
      {
        [v137 UTF8String];
        sandbox_extension_consume();
      }
      else
      {
        long long v143 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v143, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          CFStringRef v262 = v215;
          _os_log_impl((void *)&_mh_execute_header, v143, OS_LOG_TYPE_DEFAULT, "No sandbox extension for received resource [%@]", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v196 = v215;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              v196 = v215;
              _IDSLogV();
            }
          }
        }
      }
      uint64_t v144 = objc_opt_class();
      long long v145 = sub_1002B4B18(v144, v102, IDSMessageResourceTransferOriginalFileSandboxExtensionKey);
      long long v146 = v145;
      if (v145)
      {
        [v145 UTF8String];
        sandbox_extension_consume();
      }
      else
      {
        long long v147 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v147, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          CFStringRef v262 = v215;
          _os_log_impl((void *)&_mh_execute_header, v147, OS_LOG_TYPE_DEFAULT, "No sandbox extension for received resource [%@]", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            v196 = v215;
            _IDSLogTransport();
            if (_IDSShouldLog())
            {
              v196 = v215;
              _IDSLogV();
            }
          }
        }
      }
      sub_100384624(v215, v213);
      long long v148 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v138) {
        sandbox_extension_release();
      }
      if (v146) {
        sandbox_extension_release();
      }
      if (v148)
      {
        id v149 = +[NSMutableDictionary dictionaryWithDictionary:v102];
        [v149 setObject:v148 forKey:v128];
        [v13 setMessage:v149];
        long long v150 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v150, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          CFStringRef v262 = v215;
          __int16 v263 = 2112;
          CFStringRef v264 = v148;
          _os_log_impl((void *)&_mh_execute_header, v150, OS_LOG_TYPE_DEFAULT, "file persistence - moved file %@ => %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          v196 = v215;
          v200 = v148;
          _IDSLogV();
        }
      }
      else
      {
        long long v151 = OSLogHandleForTransportCategory();
        if (os_log_type_enabled(v151, OS_LOG_TYPE_DEFAULT))
        {
          long long v152 = [v13 dictionaryRepresentation];
          *(_DWORD *)long long buf = 138412802;
          CFStringRef v262 = v215;
          __int16 v263 = 2112;
          CFStringRef v264 = 0;
          __int16 v265 = 2112;
          CFStringRef v266 = v152;
          _os_log_impl((void *)&_mh_execute_header, v151, OS_LOG_TYPE_DEFAULT, "file persistence - failed to move file %@ => %@ params %@", buf, 0x20u);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          if (_IDSShouldLogTransport())
          {
            [v13 dictionaryRepresentation];
            v203 = v200 = 0;
            v196 = v215;
            _IDSLogTransport();

            if (_IDSShouldLog())
            {
              objc_msgSend(v13, "dictionaryRepresentation", v215, 0, v203);
              v203 = v200 = 0;
              v196 = v215;
              _IDSLogV();
            }
          }
        }
        if (!v238)
        {
LABEL_256:

          if (v148) {
            goto LABEL_257;
          }
LABEL_273:

LABEL_314:
          goto LABEL_315;
        }
        id v153 = objc_alloc((Class)NSError);
        id v149 = [v153 initWithDomain:IDSSendErrorDomain code:22 userInfo:0];
        id v154 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:22 error:v149 lastCall:1];
        v238[2](v238, v154);
      }
      goto LABEL_256;
    }
    id v34 = objc_alloc((Class)NSError);
    id v35 = [v34 initWithDomain:IDSSendErrorDomain code:27 userInfo:0];
    id v36 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:27 error:v35 lastCall:1];
    v238[2](v238, v36);
  }
  else
  {
    id v31 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR))
    {
      id v32 = [v13 accountUUID];
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v262 = v32;
      _os_log_impl((void *)&_mh_execute_header, v31, OS_LOG_TYPE_ERROR, "Registration is not active on account %@, ignoring...", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled())
    {
      v186 = [v13 accountUUID];
      _IDSWarnV();

      v187 = objc_msgSend(v13, "accountUUID", v186);
      _IDSLogV();

      v188 = objc_msgSend(v13, "accountUUID", v187);
      _IDSLogTransport();
    }
    if (v238)
    {
      id v33 = [objc_alloc((Class)IDSDeliveryContext) initWithResponseCode:9 error:0 lastCall:1];
      v238[2](v238, v33);
    }
  }
LABEL_317:
}

+ (BOOL)_shouldReplaceLocalDestination:(id)a3
{
  id v3 = a3;
  unsigned int v4 = [v3 serviceAdHocType];
  unsigned __int8 v5 = [v3 serviceAllowProxyDelivery];

  if (v4 == 2 || v4 == 5) {
    return v5;
  }
  else {
    return 0;
  }
}

+ (void)_sendLocalDeliveryMessagesForAccountUUID:(id)a3 threadContext:(id)a4 priority:(int64_t)a5 dataProtectionClass:(unsigned int)a6
{
  uint64_t v6 = *(void *)&a6;
  int v9 = (__CFString *)a3;
  id v68 = a4;
  id v64 = v9;
  if (v9)
  {
    char v10 = +[IDSUTunDeliveryController sharedInstance];
    unsigned __int8 v11 = [v10 hasSpaceForMessagesWithPriority:a5 dataProtectionClass:v6];

    if (v11)
    {
      id v12 = +[IDSPairingManager sharedInstance];
      long long v62 = [v12 pairedDeviceUniqueID];

      id v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v14 = @"Sync";
        if (a5 == 200) {
          CFStringRef v14 = @"Default";
        }
        if (a5 == 300) {
          CFStringRef v14 = @"URGENT";
        }
        CFStringRef v15 = @"Class D";
        if (v6 == 1) {
          CFStringRef v15 = @"Class A";
        }
        *(_DWORD *)long long buf = 138413058;
        CFStringRef v82 = v64;
        *(void *)uint64_t v84 = v14;
        __int16 v83 = 2112;
        *(_WORD *)&v84[8] = 2112;
        if (!v6) {
          CFStringRef v15 = @"Class C";
        }
        *(void *)&v84[10] = v15;
        *(_WORD *)&v84[18] = 2112;
        *(void *)&v84[20] = v62;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Performing query for account UUID %@ priority %@ class %@ Local Device ID %@ ", buf, 0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        CFStringRef v16 = @"Sync";
        if (a5 == 200) {
          CFStringRef v16 = @"Default";
        }
        if (a5 == 300) {
          CFStringRef v16 = @"URGENT";
        }
        CFStringRef v17 = @"Class D";
        if (v6 == 1) {
          CFStringRef v17 = @"Class A";
        }
        if (!v6) {
          CFStringRef v17 = @"Class C";
        }
        CFStringRef v59 = v17;
        CFStringRef v60 = v62;
        id v56 = v64;
        CFStringRef v58 = v16;
        _IDSLogV();
      }
      CFStringRef v70 = +[IDSDMessageStore sharedInstanceForDataProtectionClass:](IDSDMessageStore, "sharedInstanceForDataProtectionClass:", v6, v56, v58, v59, v60);
      id v63 = [v70 unsentNonUrgentMessagesForAccountUUID:v64 priority:a5 byteLimit:0x200000 upToLimit:10 localDestinationDeviceID:v62];
      char v18 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v19 = (const __CFString *)[v63 count];
        *(_DWORD *)long long buf = 134217984;
        CFStringRef v82 = v19;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Got %lu query messages", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v57 = [v63 count];
        _IDSLogV();
      }
      if (objc_msgSend(v63, "count", v57))
      {
        long long v79 = 0u;
        long long v80 = 0u;
        long long v77 = 0u;
        long long v78 = 0u;
        id obj = v63;
        id v67 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
        if (!v67) {
          goto LABEL_49;
        }
        uint64_t v66 = *(void *)v78;
        while (1)
        {
          for (i = 0; i != v67; i = (char *)i + 1)
          {
            if (*(void *)v78 != v66) {
              objc_enumerationMutation(obj);
            }
            int v21 = *(void **)(*((void *)&v77 + 1) + 8 * i);
            unsigned __int8 v22 = [v21 guid];
            [v70 markOutgoingMessageWithGUID:v22 asSent:1];

            id v23 = [v21 copySendParameters];
            unsigned __int8 v24 = [v23 data];

            if (v24)
            {
              __int16 v25 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v25, OS_LOG_TYPE_DEBUG))
              {
                id v26 = [v68 accountDescription];
                id v27 = [v23 data];
                unsigned int v28 = [v27 length];
                id v29 = [v23 destinations];
                id v30 = [v23 identifier];
                id v31 = [v21 guid];
                *(_DWORD *)long long buf = 138413314;
                CFStringRef v82 = v26;
                __int16 v83 = 1024;
                *(_DWORD *)uint64_t v84 = v28;
                *(_WORD *)&v84[4] = 2112;
                *(void *)&v84[6] = v29;
                *(_WORD *)&v84[14] = 2112;
                *(void *)&v84[16] = v30;
                *(_WORD *)&v84[24] = 2112;
                *(void *)&v84[26] = v31;
                _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEBUG, "account %@ _sendLocalDeliveryMessagesForAccountUUID with data size: %d to: %@ identifier: %@ guid: %@", buf, 0x30u);
              }
              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                id v32 = [v68 accountDescription];
                id v33 = [v23 data];
                [v33 length];
                id v34 = [v23 destinations];
                id v35 = [v23 identifier];
                id v36 = [v21 guid];
                _IDSLogV();
LABEL_46:
              }
            }
            else
            {
              id v37 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v37, OS_LOG_TYPE_DEBUG))
              {
                id v38 = [v68 accountDescription];
                id v39 = [v23 message];
                id v40 = [v23 destinations];
                id v41 = [v23 identifier];
                id v42 = [v21 guid];
                *(_DWORD *)long long buf = 138413314;
                CFStringRef v82 = v38;
                __int16 v83 = 2112;
                *(void *)uint64_t v84 = v39;
                *(_WORD *)&v84[8] = 2112;
                *(void *)&v84[10] = v40;
                *(_WORD *)&v84[18] = 2112;
                *(void *)&v84[20] = v41;
                *(_WORD *)&v84[28] = 2112;
                *(void *)&v84[30] = v42;
                _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEBUG, "account %@ _sendLocalDeliveryMessagesForAccountUUID: %@ to: %@ identifier: %@ guid: %@", buf, 0x34u);
              }
              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                id v32 = [v68 accountDescription];
                id v33 = [v23 message];
                id v34 = [v23 destinations];
                id v35 = [v23 identifier];
                id v36 = [v21 guid];
                _IDSLogV();
                goto LABEL_46;
              }
            }
            v72[0] = _NSConcreteStackBlock;
            v72[1] = 3221225472;
            v72[2] = sub_100386E00;
            v72[3] = &unk_10098A770;
            id v43 = v68;
            id v73 = v43;
            id v44 = v23;
            id v74 = v44;
            BOOL v75 = v21;
            id v76 = v70;
            id v45 = objc_retainBlock(v72);
            __int16 v46 = [v43 servicePushTopic];
            id v47 = +[IDSDaemon sharedInstance];
            id v48 = [a1 progressBlockForSendParameters:v44 messageContext:0 topic:v46 forObject:v47];

            uint64_t v49 = [a1 serviceController];
            unsigned int v50 = [v43 servicePushTopic];
            id v51 = [v49 serviceWithPushTopic:v50];

            +[IDSDAccount sendMessageWithSendParameters:v44 service:v51 threadContext:v43 willSendBlock:0 progressBlock:v48 completionBlock:v45];
          }
          id v67 = [obj countByEnumeratingWithState:&v77 objects:v85 count:16];
          if (!v67)
          {
LABEL_49:

            break;
          }
        }
      }
    }
    else
    {
      id v53 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v54 = @"Sync";
        if (a5 == 200) {
          CFStringRef v54 = @"Default";
        }
        if (a5 == 300) {
          CFStringRef v54 = @"URGENT";
        }
        CFStringRef v55 = @"Class D";
        if (v6 == 1) {
          CFStringRef v55 = @"Class A";
        }
        if (!v6) {
          CFStringRef v55 = @"Class C";
        }
        *(_DWORD *)long long buf = 138412546;
        CFStringRef v82 = v54;
        __int16 v83 = 2112;
        *(void *)uint64_t v84 = v55;
        _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "No space in local delivery queues for messages with priority %@ dataProtectionClass %@, bailing.", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  else
  {
    id v52 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_ERROR, "_sendLocalDeliveryMessagesForAccountUUID called with no accountUUID.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

+ (void)_sendLocalDeliveryMessagesForAccountUUID:(id)a3 threadContext:(id)a4 priority:(int64_t)a5 messageTypes:(id)a6 dataProtectionClass:(unsigned int)a7
{
  uint64_t v7 = *(void *)&a7;
  CFStringRef v11 = (const __CFString *)a3;
  id v71 = a4;
  id v66 = a6;
  id v67 = (__CFString *)v11;
  if (v11)
  {
    id v12 = +[IDSUTunDeliveryController sharedInstance];
    unsigned __int8 v13 = [v12 hasSpaceForMessagesWithPriority:a5 dataProtectionClass:v7];

    if (v13)
    {
      CFStringRef v14 = +[IDSPairingManager sharedInstance];
      id v64 = [v14 pairedDeviceUniqueID];

      CFStringRef v15 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v16 = @"Sync";
        if (a5 == 200) {
          CFStringRef v16 = @"Default";
        }
        if (a5 == 300) {
          CFStringRef v16 = @"URGENT";
        }
        CFStringRef v17 = @"Class D";
        if (v7 == 1) {
          CFStringRef v17 = @"Class A";
        }
        *(_DWORD *)long long buf = 138413058;
        CFStringRef v85 = v11;
        *(void *)id v87 = v16;
        __int16 v86 = 2112;
        *(_WORD *)&v87[8] = 2112;
        if (!v7) {
          CFStringRef v17 = @"Class C";
        }
        *(void *)&v87[10] = v17;
        *(_WORD *)&v87[18] = 2112;
        *(void *)&v87[20] = v64;
        _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Performing query for account UUID %@ priority %@ class %@ Local Device ID %@ ", buf, 0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        CFStringRef v18 = @"Sync";
        if (a5 == 200) {
          CFStringRef v18 = @"Default";
        }
        if (a5 == 300) {
          CFStringRef v18 = @"URGENT";
        }
        CFStringRef v19 = @"Class D";
        if (v7 == 1) {
          CFStringRef v19 = @"Class A";
        }
        if (!v7) {
          CFStringRef v19 = @"Class C";
        }
        CFStringRef v61 = v19;
        long long v62 = v64;
        CFStringRef v58 = v11;
        CFStringRef v60 = v18;
        _IDSLogV();
      }
      id v73 = +[IDSDMessageStore sharedInstanceForDataProtectionClass:](IDSDMessageStore, "sharedInstanceForDataProtectionClass:", v7, v58, v60, v61, v62);
      id v65 = [v73 unsentNonUrgentMessagesForAccountUUID:v11 priority:a5 byteLimit:0x200000 upToLimit:10 localDestinationDeviceID:v64 messageTypes:v66];
      unsigned __int8 v20 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v21 = (const __CFString *)[v65 count];
        *(_DWORD *)long long buf = 134217984;
        CFStringRef v85 = v21;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Got %lu query messages", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v59 = [v65 count];
        _IDSLogV();
      }
      if (objc_msgSend(v65, "count", v59))
      {
        long long v82 = 0u;
        long long v83 = 0u;
        long long v80 = 0u;
        long long v81 = 0u;
        id obj = v65;
        id v70 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
        if (!v70) {
          goto LABEL_49;
        }
        uint64_t v69 = *(void *)v81;
        while (1)
        {
          for (i = 0; i != v70; i = (char *)i + 1)
          {
            if (*(void *)v81 != v69) {
              objc_enumerationMutation(obj);
            }
            id v23 = *(void **)(*((void *)&v80 + 1) + 8 * i);
            unsigned __int8 v24 = [v23 guid];
            [v73 markOutgoingMessageWithGUID:v24 asSent:1];

            id v25 = [v23 copySendParameters];
            id v26 = [v25 data];

            if (v26)
            {
              id v27 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
              {
                unsigned int v28 = [v71 accountDescription];
                id v29 = [v25 data];
                unsigned int v30 = [v29 length];
                id v31 = [v25 destinations];
                id v32 = [v25 identifier];
                id v33 = [v23 guid];
                *(_DWORD *)long long buf = 138413314;
                CFStringRef v85 = v28;
                __int16 v86 = 1024;
                *(_DWORD *)id v87 = v30;
                *(_WORD *)&v87[4] = 2112;
                *(void *)&v87[6] = v31;
                *(_WORD *)&v87[14] = 2112;
                *(void *)&v87[16] = v32;
                *(_WORD *)&v87[24] = 2112;
                *(void *)&v87[26] = v33;
                _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "account %@ _sendLocalDeliveryMessagesForAccountUUID with data size: %d to: %@ identifier: %@ guid: %@", buf, 0x30u);
              }
              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                id v34 = [v71 accountDescription];
                id v35 = [v25 data];
                [v35 length];
                id v36 = [v25 destinations];
                id v37 = [v25 identifier];
                id v38 = [v23 guid];
                _IDSLogV();
LABEL_46:
              }
            }
            else
            {
              id v39 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v39, OS_LOG_TYPE_DEBUG))
              {
                id v40 = [v71 accountDescription];
                id v41 = [v25 message];
                id v42 = [v25 destinations];
                id v43 = [v25 identifier];
                id v44 = [v23 guid];
                *(_DWORD *)long long buf = 138413314;
                CFStringRef v85 = v40;
                __int16 v86 = 2112;
                *(void *)id v87 = v41;
                *(_WORD *)&v87[8] = 2112;
                *(void *)&v87[10] = v42;
                *(_WORD *)&v87[18] = 2112;
                *(void *)&v87[20] = v43;
                *(_WORD *)&v87[28] = 2112;
                *(void *)&v87[30] = v44;
                _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEBUG, "account %@ _sendLocalDeliveryMessagesForAccountUUID: %@ to: %@ identifier: %@ guid: %@", buf, 0x34u);
              }
              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                id v34 = [v71 accountDescription];
                id v35 = [v25 message];
                id v36 = [v25 destinations];
                id v37 = [v25 identifier];
                id v38 = [v23 guid];
                _IDSLogV();
                goto LABEL_46;
              }
            }
            v75[0] = _NSConcreteStackBlock;
            v75[1] = 3221225472;
            v75[2] = sub_100388224;
            v75[3] = &unk_10098A770;
            id v45 = v71;
            id v76 = v45;
            id v46 = v25;
            id v77 = v46;
            long long v78 = v23;
            id v79 = v73;
            id v47 = objc_retainBlock(v75);
            id v48 = [v45 servicePushTopic];
            uint64_t v49 = +[IDSDaemon sharedInstance];
            unsigned int v50 = [a1 progressBlockForSendParameters:v46 messageContext:0 topic:v48 forObject:v49];

            id v51 = [a1 serviceController];
            id v52 = [v45 servicePushTopic];
            id v53 = [v51 serviceWithPushTopic:v52];

            +[IDSDAccount sendMessageWithSendParameters:v46 service:v53 threadContext:v45 willSendBlock:0 progressBlock:v50 completionBlock:v47];
          }
          id v70 = [obj countByEnumeratingWithState:&v80 objects:v88 count:16];
          if (!v70)
          {
LABEL_49:

            break;
          }
        }
      }
    }
    else
    {
      CFStringRef v55 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v55, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v56 = @"Sync";
        if (a5 == 200) {
          CFStringRef v56 = @"Default";
        }
        if (a5 == 300) {
          CFStringRef v56 = @"URGENT";
        }
        CFStringRef v57 = @"Class D";
        if (v7 == 1) {
          CFStringRef v57 = @"Class A";
        }
        if (!v7) {
          CFStringRef v57 = @"Class C";
        }
        *(_DWORD *)long long buf = 138412546;
        CFStringRef v85 = v56;
        __int16 v86 = 2112;
        *(void *)id v87 = v57;
        _os_log_impl((void *)&_mh_execute_header, v55, OS_LOG_TYPE_DEFAULT, "No space in local delivery queues for messages with priority %@ dataProtectionClass %@, bailing.", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  else
  {
    CFStringRef v54 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v54, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v54, OS_LOG_TYPE_ERROR, "_sendLocalDeliveryMessagesForAccountUUID called with no accountUUID.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)_failSavedMessagesCleanly:(id)a3 withResponseCode:(int64_t)a4
{
  id v6 = a3;
  uint64_t v7 = +[IDSDaemonPriorityQueueController sharedInstance];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_100388944;
  v9[3] = &unk_1009875C8;
  id v10 = v6;
  CFStringRef v11 = self;
  int64_t v12 = a4;
  id v8 = v6;
  [v7 performBlockMainQueue:v9];
}

- (void)_failSavedMessageCleanly:(id)a3 withResponseCode:(int64_t)a4
{
  id v6 = a3;
  im_assert_primary_base_queue();
  uint64_t v7 = +[IDSDAccountController sharedInstance];
  id v8 = [v6 accountGUID];
  int v9 = [v7 accountWithUniqueID:v8];

  id v10 = +[IDSDAccountController sharedInstance];
  CFStringRef v11 = [v6 mainAccountGuid];
  int64_t v12 = [v10 accountWithUniqueID:v11];

  unsigned __int8 v13 = [v9 service];
  CFStringRef v14 = [v13 pushTopic];

  CFStringRef v15 = [v12 service];
  CFStringRef v16 = [v15 pushTopic];

  CFStringRef v17 = +[IDSDaemonPriorityQueueController sharedInstance];
  v21[0] = _NSConcreteStackBlock;
  v21[1] = 3221225472;
  v21[2] = sub_100388BFC;
  v21[3] = &unk_1009855E0;
  id v22 = v14;
  id v23 = self;
  id v25 = v16;
  int64_t v26 = a4;
  id v24 = v6;
  id v18 = v16;
  id v19 = v6;
  id v20 = v14;
  [v17 performBlockSyncPriority:v21];
}

- (void)_cleanUpOutgoingMessageDatabaseAndClearStatementCache
{
  [(IDSDaemon *)self _cleanupOutgoingMessageDatabase];

  +[IDSDMessageStore clearStatementCache];
}

- (void)_cleanupOutgoingMessageDatabase
{
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:100];

  [(IDSDaemon *)self _cleanupOutgoingMessages];
  [(IDSDaemon *)self _cleanupOutgoingQWSMessages];
  [(IDSDaemon *)self _cleanupOutgoingExpiredMessages];
  [(IDSDaemon *)self _cleanupRunawayClientOutgoingMessages];
}

- (void)_cleanupOutgoingMessages
{
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:100];

  unsigned int v4 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning cleanup of outgoing message database", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport()) {
    _IDSLogTransport();
  }
  unsigned __int8 v5 = +[IDSDMessageStore allExpiredOutgoingMessages:2500];
  [(IDSDaemon *)self _failSavedMessagesCleanly:v5 withResponseCode:12];
  id v6 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    id v7 = [v5 count];
    *(_DWORD *)long long buf = 134217984;
    id v15 = v7;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Cleaned up %lu expired messages", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v11 = [v5 count];
    _IDSLogTransport();
  }
  id v8 = +[IDSDMessageStore uniqueAccountGUIDsForUnsentOutgoingMessages:](IDSDMessageStore, "uniqueAccountGUIDsForUnsentOutgoingMessages:", 5000, v11);
  int v9 = +[IDSDaemonPriorityQueueController sharedInstance];
  v12[0] = _NSConcreteStackBlock;
  v12[1] = 3221225472;
  v12[2] = sub_100389564;
  v12[3] = &unk_10097E440;
  v12[4] = self;
  id v13 = v8;
  id v10 = v8;
  [v9 performBlockMainQueue:v12];
}

- (void)_cleanupRunawayClientOutgoingMessages
{
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:100];

  unsigned int v4 = +[IDSDaemonPriorityQueueController sharedInstance];
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  void v5[2] = sub_100389B34;
  v5[3] = &unk_10097E4D0;
  v5[4] = self;
  [v4 performBlockMainQueue:v5];
}

- (unint64_t)_maxOutgoingDatabasesSizeInMB
{
  im_assert_primary_base_queue();
  id v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"max-ids-database-size"];

  if (v3)
  {
    int v4 = [v3 intValue];
    if (v4 <= 30) {
      unint64_t v5 = 30;
    }
    else {
      unint64_t v5 = v4;
    }
  }
  else
  {
    unint64_t v5 = 50;
  }

  return v5;
}

- (unint64_t)_maxMessagesForRunawayClientConsideration
{
  im_assert_primary_base_queue();
  id v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v3 = [v2 objectForKey:@"max-ids-database-client-enqueued"];

  if (v3) {
    unint64_t v4 = (int)[v3 intValue];
  }
  else {
    unint64_t v4 = 2000;
  }

  return v4;
}

- (void)_cleanupOutgoingQWSMessages
{
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:100];

  unint64_t v4 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning cleanup of outgoing message database for quickswitched messages", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport()) {
    _IDSLogTransport();
  }
  unint64_t v5 = +[IDSDMessageStore allOutgoingMessagesPendingDeleteWithLimit:2500];
  [(IDSDaemon *)self _failSavedMessagesCleanly:v5 withResponseCode:24];
  id v6 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v7 = 0;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Ending cleanup of outgoing message database for quickswitched messages", v7, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport()) {
    _IDSLogTransport();
  }
}

- (void)_cleanupOutgoingExpiredMessages
{
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:100];

  unint64_t v4 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Beginning cleanup of outgoing message database for messages older than 2 days past enqueue date", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport()) {
    _IDSLogTransport();
  }
  unint64_t v5 = +[NSDate date];
  id v6 = [v5 dateByAddingTimeInterval:-172800.0];
  uint64_t v7 = IMGetCachedDomainIntForKey();
  if (v7 >= 1)
  {
    uint64_t v8 = [v5 dateByAddingTimeInterval:-(double)v7];

    id v6 = (void *)v8;
  }
  int v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    [v6 timeIntervalSinceReferenceDate];
    *(_DWORD *)long long buf = 134217984;
    id v21 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Using Time Interval %f", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    [v6 timeIntervalSinceReferenceDate];
    uint64_t v19 = v11;
    _IDSLogTransport();
  }
  objc_msgSend(v6, "timeIntervalSinceReferenceDate", v19);
  double v13 = v12;
  CFStringRef v14 = +[IDSPairingManager sharedInstance];
  id v15 = [v14 pairedDeviceUniqueID];
  CFStringRef v16 = +[IDSDMessageStore outgoingMessagesWithEnqueueDateOlderThan:(uint64_t)v13 notToDestinationDeviceID:v15 andLimit:2500];

  [(IDSDaemon *)self _failSavedMessagesCleanly:v16 withResponseCode:25];
  CFStringRef v17 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    id v18 = [v16 count];
    *(_DWORD *)long long buf = 134217984;
    id v21 = v18;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Ending cleanup of %lu outgoing message database for older than 2 days past enqueue date", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    [v16 count];
    _IDSLogTransport();
  }
}

- (void)_cleanupIncomingMessageDatabase
{
  id v3 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v3 assertRunningWithPriority:100];

  [(IDSDaemon *)self _cleanupExpiredIncomingMessages];
}

- (void)_cleanupExpiredIncomingMessages
{
  id v2 = +[IDSDaemonPriorityQueueController sharedInstance];
  [v2 assertRunningWithPriority:100];

  id v3 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v10 = 0;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Beginning cleanup of outgoing message database", v10, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport()) {
    _IDSLogTransport();
  }
  +[NSDate timeIntervalSinceReferenceDate];
  double v5 = v4;
  id v6 = +[IDSServerBag sharedInstance];
  uint64_t v7 = [v6 objectForKey:@"incoming-message-cleanup-threshold"];

  if (v7)
  {
    [v7 doubleValue];
    double v9 = v8;
  }
  else
  {
    double v9 = 2592000.0;
  }

  +[IDSDMessageStore deleteExpiredIncomingMessagesOlderThan:500 withLimit:v5 - v9];
}

- (void)_registerForCheckpointAndVacuumDB
{
  id v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v3 = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "Registering for Checkpointing and Vacuum", v3, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  xpc_activity_register("com.apple.ids.dbvacuum", XPC_ACTIVITY_CHECK_IN, &stru_10098A808);
}

- (void)sendServerMessage:(id)a3 command:(id)a4 usingAccountWithUniqueID:(id)a5 messageContext:(id)a6
{
  id v25 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  double v13 = +[IDSDAccountController sharedInstance];
  CFStringRef v14 = [v13 accountWithUniqueID:v11];

  if (v14)
  {
    *(void *)&long long buf = 0;
    *((void *)&buf + 1) = &buf;
    uint64_t v34 = 0x3032000000;
    id v35 = sub_1003896D0;
    id v36 = sub_1003896E0;
    id v37 = 0;
    id v15 = [v12 localObject];
    v28[0] = _NSConcreteStackBlock;
    v28[1] = 3221225472;
    v28[2] = sub_10038ACBC;
    v28[3] = &unk_100985558;
    uint8_t v28[4] = self;
    id v16 = v14;
    id v29 = v16;
    p_long long buf = &buf;
    [(IDSDaemon *)self validateListenerForLocalObject:v15 andPerformBlock:v28];

    if (*(void *)(*((void *)&buf + 1) + 40))
    {
      CFStringRef v17 = +[IDSTrafficMonitor sharedInstance];
      id v18 = [v16 service];
      uint64_t v19 = [v18 identifier];
      id v20 = [v16 service];
      id v21 = [v20 adHocServiceType];
      unsigned __int8 v22 = [v17 noteOutgoingServerMessageForService:v19 serviceType:v21 requestor:*(void *)(*((void *)&buf + 1) + 40)];

      if (v22)
      {
        v26[0] = _NSConcreteStackBlock;
        v26[1] = 3221225472;
        v26[2] = sub_10038AD74;
        v26[3] = &unk_100980FD8;
        id v27 = v12;
        [v16 sendServerMessage:v25 command:v10 completionBlock:v26];
      }
      else
      {
        id v24 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)id v31 = 138412290;
          id v32 = v16;
          _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_ERROR, "*** Over budget, failing sendMessage on account: %@", v31, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          _IDSLogTransport();
        }
      }
    }

    _Block_object_dispose(&buf, 8);
  }
  else
  {
    id v23 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      LODWORD(buf) = 138412290;
      *(void *)((char *)&buf + 4) = v11;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "No account found for ID: %@", (uint8_t *)&buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (BOOL)_canSendMessageWithAccount:(id)a3 toDestination:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  double v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v41 = v6;
    __int16 v42 = 2112;
    id v43 = v7;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Daemon Attempting To Send message from account %@ to destinations %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v37 = v6;
    id v39 = v7;
    _IDSLogV();
  }
  if (objc_msgSend(v6, "accountType", v37, v39) != 2) {
    goto LABEL_25;
  }
  double v9 = [v7 destinationURIs];
  BOOL v10 = (unint64_t)[v9 count] > 1;

  if (v10)
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Attempting to send to more than 1 destination, if this is not possible, this will fail further down the daemon", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  id v12 = [v6 service];
  unsigned int v13 = [v12 shouldAllowProxyDelivery];

  if (v13)
  {
    CFStringRef v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "This service supports proxy delivery, which means a local account is allowed to send to a remote destination, allowing this message to send", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  id v15 = [v6 service];
  unsigned int v16 = [v15 allowSendingMessagesToInactiveDevice];

  if (v16)
  {
    CFStringRef v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "This service supports sending messages to an inactive device, it is allowed to proceed", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      goto LABEL_25;
    }
LABEL_24:
    _IDSLogV();
LABEL_25:
    char v18 = 1;
    goto LABEL_26;
  }
  id v20 = [(IDSDaemon *)self pairingManager];
  id v21 = [v20 pairedDevicePushToken];
  unsigned __int8 v22 = objc_msgSend(v21, "__imHexString");

  id v23 = [(IDSDaemon *)self pairingManager];
  id v24 = [v23 pairedDeviceUniqueID];

  id v25 = [v7 destinationURIs];
  int64_t v26 = [v25 allObjects];
  id v27 = objc_msgSend(v26, "__imFirstObject");

  unsigned int v28 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v41 = v7;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "Looking at local destination %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v38 = v7;
    _IDSLogV();
  }
  id v29 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v41 = v22;
    _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "The paired device push token is %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v38 = v22;
    _IDSLogV();
  }
  unsigned int v30 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v30, OS_LOG_TYPE_DEBUG))
  {
    *(_DWORD *)long long buf = 138412290;
    id v41 = v24;
    _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEBUG, "The paired device UUID is %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v38 = v24;
    _IDSLogV();
  }
  unsigned int v31 = objc_msgSend(v27, "isEqualToIgnoringCase:", IDSDefaultPairedDevice, v38);
  id v32 = [v27 _stripFZIDPrefix];
  unsigned int v33 = [v32 isEqualToIgnoringCase:v24];

  id v34 = [v27 length];
  if (v34)
  {
    id v34 = [v22 length];
    if (v34) {
      LODWORD(v34) = [v27 containsString:v22];
    }
  }
  if (((v31 | v33) & 1) != 0 || v34)
  {
    id v35 = +[IDSQuickSwitchHelper sharedInstance];
    unsigned __int8 v36 = [v35 isQuickSwitchingToAnotherDevice];

    char v18 = v36 ^ 1;
  }
  else
  {
    char v18 = 0;
  }

LABEL_26:
  return v18;
}

- (void)_fetchAccountEntitlements:(id *)a3 listenerID:(id *)a4 inContext:(id)a5
{
  double v8 = [a5 localObject];
  v9[0] = _NSConcreteStackBlock;
  v9[1] = 3221225472;
  v9[2] = sub_10038B6B0;
  v9[3] = &unk_10098A828;
  void v9[4] = a3;
  v9[5] = a4;
  [(IDSDaemon *)self validateListenerForLocalObject:v8 andPerformBlock:v9];
}

- (void)sendOpportunisticData:(id)a3 onService:(id)a4 usingAccountWithUniqueID:(id)a5 withIdentifier:(id)a6 options:(id)a7 messageContext:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = [v19 localObject];
  if ([(IDSDaemon *)self validateListenerForLocalObject:v20 andCheckEntitlement:kIDSMessagingEntitlement])
  {

LABEL_4:
    id v23 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v31 = v17;
      __int16 v32 = 2112;
      id v33 = v15;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Received data %@ to be cached and sent opportunistically on service %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v28 = v17;
      id v29 = v15;
      _IDSLogV();
    }
    id v24 = [(IDSDaemon *)self opportunisticDeliveryController];
    id v25 = [objc_alloc((Class)IDSOpportunisticOptions) initWithDictionary:v18];
    [v24 addOpportunisticData:v14 serviceName:v15 accountUniqueID:v16 identifier:v17 options:v25 completion:0];

    goto LABEL_10;
  }
  id v21 = [v19 localObject];
  unsigned __int8 v22 = [(IDSDaemon *)self validateListenerForLocalObject:v21 andCheckEntitlement:kIDSTestToolEntitlement];

  if (v22) {
    goto LABEL_4;
  }
  int64_t v26 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    id v27 = [v19 localObject];
    *(_DWORD *)long long buf = 138412546;
    id v31 = v27;
    __int16 v32 = 2112;
    id v33 = v16;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Tried to send opportunistic data without entitlement {localObject: %@, uniqueID: %@}", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v24 = [v19 localObject];
    _IDSLogV();
LABEL_10:
  }
}

- (void)cancelOpportunisticDataOnService:(id)a3 withIdentifier:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = [v10 localObject];
  if ([(IDSDaemon *)self validateListenerForLocalObject:v11 andCheckEntitlement:kIDSMessagingEntitlement])
  {

LABEL_4:
    id v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412546;
      id v21 = v9;
      __int16 v22 = 2112;
      id v23 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Cancel opportunistic send {identifier: %@, serviceName: %@}", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v18 = v9;
      id v19 = v8;
      _IDSLogV();
    }
    id v15 = [(IDSDaemon *)self opportunisticDeliveryController];
    [v15 removeOpportunisticDataForIdentifier:v9 serviceName:v8 completion:0];
    goto LABEL_10;
  }
  id v12 = [v10 localObject];
  unsigned __int8 v13 = [(IDSDaemon *)self validateListenerForLocalObject:v12 andCheckEntitlement:kIDSTestToolEntitlement];

  if (v13) {
    goto LABEL_4;
  }
  id v16 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v10 localObject];
    *(_DWORD *)long long buf = 138412546;
    id v21 = v17;
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Tried to cancel opportunistic data without entitlement {localObject: %@, identifier: %@}", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v15 = [v10 localObject];
    _IDSLogV();
LABEL_10:
  }
}

- (BOOL)dropMessageIfDropPointIsDetectedWithSendParameters:(id)a3
{
  id v3 = a3;
  double v4 = [v3 dropMessageIndicatorCommand];

  if (v4)
  {
    double v5 = [v3 dropMessageIndicatorCommand];
    id v6 = [v5 integerValue];

    id v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      id v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "%li Drop point detected.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    if (v6 == (id)100)
    {
      id v8 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "Sender's IDSDaemon will drop message.", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      LOBYTE(v4) = 1;
    }
    else
    {
      LOBYTE(v4) = 0;
    }
  }

  return (char)v4;
}

- (BOOL)shouldDropMessageIfOutOfFamilyPhoneNumber:(id)a3 forService:(id)a4 withAppleIDAccount:(id)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = a5;
  if ([v8 iCloudBasedService] && objc_msgSend(v8, "isFamilyService"))
  {
    id v10 = [v9 prefixedURIStringsFromRegistration];
    unsigned int v11 = [v10 containsObject:v7] ^ 1;
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (int64_t)_signatureTypeForSigningAlgorithm:(int64_t)a3
{
  int64_t v3 = -1000;
  if (a3 == 2) {
    int64_t v3 = 1;
  }
  if (a3 == 3) {
    return 2;
  }
  else {
    return v3;
  }
}

- (void)signData:(id)a3 withAlgorithm:(int64_t)a4 onService:(id)a5 options:(id)a6 requestUUID:(id)a7 messageContext:(id)a8
{
  id v14 = a3;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  id v19 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10038C148;
  block[3] = &unk_100988230;
  id v26 = v18;
  id v27 = v16;
  id v28 = v17;
  id v29 = v14;
  id v31 = self;
  int64_t v32 = a4;
  id v30 = v15;
  id v20 = v15;
  id v21 = v14;
  id v22 = v17;
  id v23 = v16;
  id v24 = v18;
  dispatch_async(v19, block);
}

- (void)verifySignedData:(id)a3 matchesData:(id)a4 forAlgorithm:(int64_t)a5 onService:(id)a6 tokenUri:(id)a7 options:(id)a8 requestUUID:(id)a9 messageContext:(id)a10
{
  id v16 = a3;
  id v17 = a4;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a10;
  id v23 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10038CA80;
  block[3] = &unk_10098A850;
  id v32 = v22;
  id v33 = v20;
  id v34 = v21;
  id v35 = v16;
  id v39 = self;
  int64_t v40 = a5;
  id v36 = v17;
  id v37 = v18;
  id v38 = v19;
  id v24 = v19;
  id v25 = v18;
  id v26 = v17;
  id v27 = v16;
  id v28 = v21;
  id v29 = v20;
  id v30 = v22;
  dispatch_async(v23, block);
}

- (void)sendMessageWithSendParameters:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_10038DAB4;
  block[3] = &unk_10097E418;
  void block[4] = self;
  id v13 = v7;
  id v14 = v6;
  id v9 = v6;
  id v10 = v7;
  dispatch_block_t v11 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS|DISPATCH_BLOCK_ASSIGN_CURRENT, block);
  dispatch_async(v8, v11);
}

- (void)sendCertifiedDeliveryReceipt:(id)a3 serviceName:(id)a4 messageContext:(id)a5
{
  id v7 = a3;
  id v80 = a4;
  id v78 = a5;
  id v79 = v7;
  if (v7 && v80)
  {
    id v8 = [objc_alloc((Class)IDSCertifiedDeliveryContext) initWithDictionaryRepresentation:v7];
    if ([v8 generateDeliveryReceipt])
    {
      id v9 = +[IDSDaemon sharedInstance];
      id v10 = [v9 queryUpdateNotifier];
      id v11 = objc_alloc((Class)IDSURI);
      id v12 = [v8 localURI];
      id v13 = [v11 initWithPrefixedURI:v12];
      id v14 = +[IDSDServiceController sharedInstance];
      id v15 = [v8 service];
      id v16 = [v14 serviceWithPushTopic:v15];
      id v17 = [v10 devicesHashForURI:v13 andService:v16];

      if (v17)
      {
        id v18 = [objc_alloc((Class)IDSCertifiedDeliveryContext) initWithCertifiedDeliveryContext:v8 queryHash:v17];

        id v19 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
        {
          id v20 = [v17 debugDescription];
          id v21 = [v18 localURI];
          id v22 = [v18 service];
          *(_DWORD *)long long buf = 134218754;
          id v86 = v18;
          __int16 v87 = 2112;
          id v88 = v20;
          __int16 v89 = 2112;
          __int16 v90 = v21;
          __int16 v91 = 2112;
          __int16 v92 = v22;
          _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Added query update hash to certified delivery receipt {certifiedDeliveryReceipt: %p, hash: %@, fromURI: %@, service: %@}", buf, 0x2Au);
        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v23 = [v17 debugDescription];
          id v24 = [v18 localURI];
          [v18 service];
          id v67 = v66 = v24;
          id v62 = v18;
          id v64 = v23;
          _IDSLogV();
        }
      }
      else
      {
        id v18 = v8;
      }
    }
    else
    {
      id v18 = v8;
    }
    id v25 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v86 = v18;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "sendCertifiedDeliveryReceipt - { certifiedDeliveryContext: %@ }", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v62 = v18;
      _IDSLogV();
    }
    id v26 = +[IDSEncryptionController sharedInstance];
    v83[0] = _NSConcreteStackBlock;
    v83[1] = 3221225472;
    v83[2] = sub_1003906FC;
    v83[3] = &unk_10097E440;
    v83[4] = self;
    id v27 = v18;
    id v84 = v27;
    [v26 performSyncBlock:v83 priority:300];

    id v28 = [v27 replayKey];

    if (v28)
    {
      replayKeyToMessageUUIDMap = self->_replayKeyToMessageUUIDMap;
      id v30 = [v27 replayKey];
      [(NSMutableDictionary *)replayKeyToMessageUUIDMap removeObjectForKey:v30];
    }
    id v31 = [objc_alloc((Class)IDSCertifiedDeliveryReceiptMessage) initWithCertifiedDeliveryContext:v27];
    if (_os_feature_enabled_impl()
      && [v27 originalEncryptionType] == (id)5
      && [v31 certifiedDeliveryVersion] == (id)2)
    {
      id v32 = [v27 remoteURI];
      id v33 = [v27 service];
      id v74 = +[IDSURI URIWithPrefixedURI:v32 withServiceLoggingHint:v33];

      id v34 = [v27 localURI];
      id v35 = [v27 service];
      id v73 = +[IDSURI URIWithPrefixedURI:v34 withServiceLoggingHint:v35];

      BOOL v75 = +[NSMutableDictionary dictionary];
      if (_os_feature_enabled_impl())
      {
        id v36 = [v27 originalGUID];
        uint64_t v37 = [(IDSDaemon *)self _populateDictionaryWithSenderKeyCheck:v75 remoteURI:v74 localURI:v73 originalGUID:v36];

        BOOL v75 = (void *)v37;
      }
      id v38 = [v31 queryHash];
      id v39 = [v38 copy];

      if (!v39) {
        id v39 = [objc_alloc((Class)NSMutableData) initWithLength:32];
      }
      id v68 = v39;
      [v75 setObject:v39 forKey:IDSQueryHashKey];
      id v40 = [v75 copy];
      __int16 v72 = JWEncodeDictionary();

      id v41 = +[IDSPeerIDManager sharedInstance];
      __int16 v42 = [v27 senderToken];
      id v43 = [v27 service];
      id v44 = +[IDSPushToken pushTokenWithData:v42 withServiceLoggingHint:v43];
      id v45 = [v27 service];
      id v71 = [v41 endpointForPushToken:v44 URI:v74 service:v45 fromURI:v73];

      uint64_t v82 = 2;
      uint64_t v69 = [IDSCryptionContext alloc];
      id v77 = [v27 originalGUID];
      id v46 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
      id v47 = [v46 pushToken];
      id v48 = +[IDSPushToken pushTokenWithData:v47];
      uint64_t v49 = [v27 senderToken];
      unsigned int v50 = [v27 service];
      id v51 = +[IDSPushToken pushTokenWithData:v49 withServiceLoggingHint:v50];
      id v52 = [v27 service];
      id v70 = [(IDSCryptionContext *)v69 initWithGuid:v77 sendingURI:v73 sendingPushToken:v48 receivingURI:v74 receivingPushToken:v51 service:v52];

      id v53 = +[IDSEncryptionController sharedInstance];
      id v81 = 0;
      CFStringRef v54 = [v53 publicKeyEncryptData:v72 encryptionContext:v70 forceSizeOptimizations:0 resetState:0 withEncryptedAttributes:0 toEndpoint:v71 usedEncryptionType:&v82 priority:300 metadata:0 error:&v81];
      id v55 = v81;
      [v31 setEncryptedData:v54];

      if (v55)
      {
        CFStringRef v56 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v56, OS_LOG_TYPE_DEBUG))
        {
          CFStringRef v57 = [v55 localizedDescription];
          *(_DWORD *)long long buf = 138412290;
          id v86 = v57;
          _os_log_impl((void *)&_mh_execute_header, v56, OS_LOG_TYPE_DEBUG, "Failed to encrypt certified delivery receipt { encryptionError: %@ } ", buf, 0xCu);
        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v63 = [v55 localizedDescription];
          _IDSLogV();
        }
      }
      if (v82 == 5)
      {
        CFStringRef v58 = IDSEncryptionTypeStringFromEncryptionType();
        [v31 setEncryptionType:v58];

        [v31 setQueryHash:0];
      }
      else
      {
        [v31 setEncryptedData:0];
      }
      id v59 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v60 = [v75 allKeys];
        *(_DWORD *)long long buf = 138412546;
        id v86 = v55;
        __int16 v87 = 2112;
        id v88 = v60;
        _os_log_impl((void *)&_mh_execute_header, v59, OS_LOG_TYPE_DEFAULT, "Will send encrypted receipt { encryptionError: %@, dictToSerialize.keys: %@ }", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        [v75 allKeys];
        v65 = id v63 = v55;
        _IDSLogV();
      }
    }
    CFStringRef v61 = +[IDSDeliveryController sharedInstance];
    [v61 sendIDSMessage:v31 service:0 topic:v80 completionBlock:0];
  }
}

- (void)cancelMessageWithQueueOneIdentifier:(id)a3 fromID:(id)a4 service:(id)a5 accountUniqueID:(id)a6 messageIdentifier:(id)a7 messageContext:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    id v21 = [v19 localObject];
    *(_DWORD *)long long buf = 138413570;
    id v40 = v14;
    __int16 v41 = 2112;
    id v42 = v15;
    __int16 v43 = 2112;
    id v44 = v16;
    __int16 v45 = 2112;
    id v46 = v18;
    __int16 v47 = 2112;
    id v48 = v17;
    __int16 v49 = 2048;
    unsigned int v50 = v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "cancelMessageWithQueueOneIdentifier: %@  fromID: %@  service: %@ messageIdentifier: %@ accountUniqueID: %@ localObject %p", buf, 0x3Eu);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    [v19 localObject];
    id v31 = v30 = v17;
    id v28 = v16;
    id v29 = v18;
    id v26 = v14;
    id v27 = v15;
    _IDSLogV();
  }
  if (objc_msgSend(v14, "length", v26, v27, v28, v29, v30, v31))
  {
    id v22 = [v19 localObject];
    unsigned int v23 = [(IDSDaemon *)self validateListenerForLocalObject:v22 andCheckEntitlement:kIDSMessagingEntitlement forAccessToServiceWithIdentifier:v16];

    if (v23)
    {
      id v24 = [objc_alloc((Class)IDSCancelMessage) initWithQueueOneIdentifier:v14 fromID:v15];
      id v25 = +[IDSDeliveryController sharedInstance];
      v32[0] = _NSConcreteStackBlock;
      v32[1] = 3221225472;
      v32[2] = sub_100390AA0;
      v32[3] = &unk_10098A8A0;
      id v33 = v14;
      id v34 = v15;
      id v35 = v16;
      id v36 = v18;
      id v37 = v19;
      id v38 = v17;
      [v25 sendIDSMessage:v24 service:0 topic:v35 completionBlock:v32];
    }
  }
}

- (void)_sendErrorMessage:(id)a3 originalCommand:(id)a4 fromURI:(id)a5 toDestinations:(id)a6 usingAccountWithUniqueID:(id)a7 useDictAsTopLevel:(BOOL)a8 dataToEncrypt:(id)a9 wantsResponse:(BOOL)a10 timeout:(double)a11 command:(id)a12 priority:(int64_t)a13 completionBlock:(id)a14
{
  BOOL v61 = a8;
  id v20 = a3;
  id v21 = a4;
  id v65 = a5;
  id v22 = a6;
  id v23 = a7;
  id v62 = a9;
  id v63 = a12;
  id v64 = a14;
  id v24 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEBUG))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEBUG, "sendErrorMessage - finding Account", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v25 = [(IDSDaemon *)self accountController];
  id v26 = [v25 accountWithUniqueID:v23];

  if (v26)
  {
    if ([v21 integerValue] == (id)101)
    {
      id v27 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_DEBUG))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEBUG, "Got a 101 - not sending 120", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
    else
    {
      id v29 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEBUG))
      {
        *(_DWORD *)long long buf = 138412290;
        id v70 = v26;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEBUG, "sendErrorMessage - got account %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        __int16 v49 = v26;
        _IDSLogV();
      }
      id v30 = objc_msgSend(v26, "primaryRegistration", v49);
      id v31 = [v30 dsHandle];
      id v59 = [v31 _stripFZIDPrefix];

      id v32 = [v26 service];
      [v32 shouldRegisterUsingDSHandle];

      id v33 = [v26 service];
      id v34 = [v33 identifier];
      _IDSPrefersPhoneNumbersForServiceIdentifier();

      id v35 = [v65 unprefixedURI];
      id v36 = [v26 unprefixedURIStringsFromRegistration];
      id v37 = [v26 pseudonyms];
      CFStringRef v60 = (void *)_IDSCopyCallerIDWithPseudonyms();

      id v38 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v38, OS_LOG_TYPE_DEBUG))
      {
        id v39 = [v26 unprefixedURIStringsFromRegistration];
        *(_DWORD *)long long buf = 138412546;
        id v70 = v60;
        __int16 v71 = 2112;
        id v72 = v39;
        _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEBUG, "sendErrorMessage - using fromID %@ given aliases %@", buf, 0x16u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        [v26 unprefixedURIStringsFromRegistration];
        v52 = unsigned int v50 = v60;
        _IDSLogV();
      }
      id v40 = objc_msgSend(v22, "destinationURIs", v50, v52);
      __int16 v41 = [v40 allObjects];
      id v42 = sub_100133334(v41, v26);

      __int16 v43 = +[NSSet setWithArray:v42];
      uint64_t v44 = +[IDSDestination destinationWithStrings:v43];

      __int16 v45 = +[NSString stringGUID];
      id v46 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138413058;
        id v70 = v26;
        __int16 v71 = 2112;
        id v72 = v20;
        __int16 v73 = 2112;
        uint64_t v74 = v44;
        __int16 v75 = 2112;
        id v76 = v45;
        _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "account %@ sendErrorMessage: %@ to: %@ - guid %@", buf, 0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        uint64_t v55 = v44;
        CFStringRef v56 = v45;
        id v51 = v26;
        id v53 = v20;
        _IDSLogV();
      }
      __int16 v47 = +[NSDate dateWithTimeIntervalSinceNow:](NSDate, "dateWithTimeIntervalSinceNow:", a11, v51, v53, v55, v56);
      v66[0] = _NSConcreteStackBlock;
      v66[1] = 3221225472;
      v66[2] = sub_100391658;
      v66[3] = &unk_10098A8C8;
      id v68 = v64;
      id v48 = v45;
      id v67 = v48;
      LOWORD(v58) = 0;
      LOWORD(v57) = 0;
      BYTE1(v54) = a10;
      LOBYTE(v54) = 0;
      objc_msgSend(v26, "sendMessage:params:bulkedPayload:fromID:toDestinations:useDictAsTopLevel:dataToEncrypt:encryptPayload:wantsResponse:expirationDate:command:wantsDeliveryStatus:wantsCertifiedDelivery:deliveryStatusContext:messageUUID:priority:localDelivery:disallowRefresh:willSendBlock:completionBlock:", v20, 0, 0, v60, v44, v61, v62, v54, v47, v63, v57, 0, 0, a13, v58,
        0,
        v66);

      id v22 = (id)v44;
    }
  }
  else
  {
    id v28 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)long long buf = 138412290;
      id v70 = v23;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEBUG, "(Messaging) No account found for ID: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    IMLogBacktrace();
  }
}

- (void)_sendCertifiedDeliveryReceiptIfNeededForNiceMessage:(id)a3 service:(id)a4 failureReason:(id)a5 failureReasonMessage:(id)a6 generateDeliveryReceipt:(BOOL)a7
{
  BOOL v7 = a7;
  id v11 = a3;
  id v37 = a4;
  id v33 = a5;
  id v34 = a6;
  id v12 = [v11 certifiedDeliveryVersion];
  uint64_t v13 = (uint64_t)[v12 integerValue];

  if (v13 >= 1)
  {
    id v36 = [v11 certifiedDeliveryRTS];
    id v35 = [v11 pushUUID];
    if (!v36)
    {
      id v14 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        id v39 = v35;
        __int16 v40 = 2048;
        uint64_t v41 = v13;
        _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "No certified delivery RTS found in payload with cdv { guid: %@, cdv: %ld }", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
    id v15 = objc_alloc((Class)IDSCertifiedDeliveryContext);
    id v16 = [v11 encryptionTypeStr];
    uint64_t v17 = IDSEncryptionTypeFromEncryptionTypeString();
    id v18 = [v11 senderPushToken];
    id v19 = [v18 rawToken];
    id v20 = [v15 initWithGUID:v35 service:v37 encryptionType:v17 certifiedDeliveryVersion:v13 certifiedDeliveryRTS:v36 senderToken:v19 failureReason:v33 failureReasonMessage:v34];

    if (v7)
    {
      id v31 = objc_alloc((Class)IDSCertifiedDeliveryContext);
      id v32 = [v11 encryptionTypeStr];
      uint64_t v21 = IDSEncryptionTypeFromEncryptionTypeString();
      id v22 = [v11 senderPushToken];
      id v23 = [v22 rawToken];
      id v24 = [v11 toURI];
      id v25 = [v24 prefixedURI];
      id v26 = [v11 fromURI];
      id v27 = [v26 prefixedURI];
      id v28 = [v31 initWithGUID:v35 service:v37 encryptionType:v21 certifiedDeliveryVersion:v13 certifiedDeliveryRTS:v36 senderToken:v23 localURI:v25 remoteURI:v27];

      [v28 setGenerateDeliveryReceipt:1];
    }
    else
    {
      id v28 = v20;
    }
    id v29 = [objc_alloc((Class)IDSCertifiedDeliveryReceiptMessage) initWithCertifiedDeliveryContext:v28];
    id v30 = +[IDSDeliveryController sharedInstance];
    [v30 sendIDSMessage:v29 service:0 topic:v37 completionBlock:0];
  }
}

- (void)_sendCertifiedDeliveryReceiptForSenderKeyDistributionMessage:(id)a3 service:(id)a4 keyIDs:(id)a5
{
  id v7 = a3;
  id v28 = a4;
  id v29 = a5;
  id v8 = [v7 certifiedDeliveryVersion];
  id v9 = [v8 integerValue];

  if (v9)
  {
    id v26 = objc_alloc((Class)IDSCertifiedDeliveryContext);
    id v27 = [v7 pushUUID];
    id v10 = [v7 encryptionTypeStr];
    uint64_t v25 = IDSEncryptionTypeFromEncryptionTypeString();
    id v11 = [v7 certifiedDeliveryRTS];
    id v12 = [v7 senderPushToken];
    uint64_t v13 = [v12 rawToken];
    id v14 = [v7 toURI];
    id v15 = [v14 prefixedURI];
    id v16 = [v7 fromURI];
    uint64_t v17 = [v16 prefixedURI];
    id v18 = [v26 initWithGUID:v27 service:v28 encryptionType:v25 certifiedDeliveryVersion:v9 certifiedDeliveryRTS:v11 senderToken:v13 localURI:v15 remoteURI:v17];

    if ([v29 count])
    {
      uint64_t v34 = IDSSenderKeyIDCheckKey;
      id v35 = v29;
      id v19 = +[NSDictionary dictionaryWithObjects:&v35 forKeys:&v34 count:1];
      [v18 setDeliveryStatusContext:v19];

      [v18 setGenerateDeliveryReceipt:1];
    }
    id v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      unsigned int v21 = [v18 generateDeliveryReceipt];
      CFStringRef v22 = @"NO";
      if (v21) {
        CFStringRef v22 = @"YES";
      }
      *(_DWORD *)long long buf = 138412546;
      id v31 = v29;
      __int16 v32 = 2112;
      CFStringRef v33 = v22;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Sending certified delivery receipt for keyIDs: %@ generateDeliveryReceipt: %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      [v18 generateDeliveryReceipt];
      _IDSLogV();
    }
    id v23 = [objc_alloc((Class)IDSCertifiedDeliveryReceiptMessage) initWithCertifiedDeliveryContext:v18];
    id v24 = +[IDSDeliveryController sharedInstance];
    [v24 sendIDSMessage:v23 service:0 topic:v28 completionBlock:0];
  }
}

- (void)_processCertifiedDeliveryReceiptForSenderKeyDistribution:(id)a3 service:(id)a4
{
  id v11 = a3;
  uint64_t v5 = objc_opt_class();
  id v6 = [v11 rawMessage];
  id v7 = sub_1002B4B18(v5, v6, IDSDeliveryStatusContextKey);

  if (v7)
  {
    id v8 = [v7 objectForKey:IDSSenderKeyIDCheckKey];
    id v9 = [v11 senderPushToken];
    id v10 = [(IDSDaemon *)self senderKeyDistributionManager];
    [v10 updateDeliveredStateWithKeyIDStrings:v8 pushToken:v9];
  }
}

- (void)setPreferInfraWiFi:(BOOL)a3 service:(id)a4 messageContext:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = [a5 localObject];
  LODWORD(self) = [(IDSDaemon *)self validateListenerForLocalObject:v9 andCheckEntitlement:kIDSPreferInfraWiFiEntitlement forAccessToServiceWithIdentifier:v8];

  if (self)
  {
    id v10 = +[IDSUTunDeliveryController sharedInstance];
    id v12 = v8;
    id v11 = +[NSArray arrayWithObjects:&v12 count:1];
    [v10 defaultPeerSetPreferInfraWiFi:v6 services:v11];
  }
}

- (void)setLinkPreferences:(id)a3 service:(id)a4 messageContext:(id)a5
{
  id v12 = a3;
  id v8 = a4;
  id v9 = [a5 localObject];
  LODWORD(self) = [(IDSDaemon *)self validateListenerForLocalObject:v9 andCheckEntitlement:kIDSLinkPreferencesEntitlement forAccessToServiceWithIdentifier:v8];

  if (self)
  {
    id v10 = +[IDSLinkPreferencesManager sharedInstance];
    [v10 updateService:v8 withPreferences:v12];

    id v11 = +[IDSUTunDeliveryController sharedInstance];
    [v11 defaultPeerSetLinkPreferences:v8];
  }
}

- (void)startOTRTest:(id)a3 priority:(int64_t)a4 messageContext:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v16 = v7;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "start OTR test for %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v12 = v7;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v12 = v7;
        _IDSLogV();
      }
    }
  }
  id v10 = +[IDSUTunDeliveryController sharedInstance];
  v13[0] = _NSConcreteStackBlock;
  v13[1] = 3221225472;
  v13[2] = sub_10039238C;
  v13[3] = &unk_10098A8F0;
  id v14 = v8;
  id v11 = v8;
  [v10 findDefaultPeerToForceOTRNegotiation:v7 priority:a4 completionBlock:v13];
}

- (void)testCloudQRConnection:(id)a3 messageContext:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "clean up existing QuickRelay connection for cloud messaging", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  id v8 = +[IDSUTunController sharedInstance];
  uint64_t v9 = kIDSDefaultPairedDeviceID;
  [v8 disconnectGlobalLinkForDevice:kIDSDefaultPairedDeviceID isReinitiating:0 completionHandler:0];

  id v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)id v12 = 0;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "start a new QuickRelay connection for cloud messaging", v12, 2u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  id v11 = +[IDSUTunController sharedInstance];
  [v11 startGlobalLinkForDevice:v9];
}

- (void)failedDecryptingMessage:(id)a3 reason:(int64_t)a4 forGroupID:(id)a5 onService:(id)a6 messageContext:(id)a7
{
  id v12 = a3;
  id v37 = a5;
  id v46 = a6;
  id v38 = a7;
  id v13 = objc_alloc((Class)IDSIncomingNiceMessage);
  uint64_t v14 = objc_opt_class();
  __int16 v40 = v12;
  id v15 = sub_1002B4B18(v14, v12, IDSIncomingMessagePushPayloadKey);
  id v16 = [v13 initWithMessageDictionary:v15 topic:v46];

  uint64_t v41 = [v16 fromURI];
  __int16 v45 = [v16 toURI];
  id v42 = [v16 senderPushToken];
  value = [v16 pushUUID];
  id v39 = [v16 command];
  uint64_t v17 = [(IDSDaemon *)self serviceController];
  uint64_t v44 = [v17 serviceWithPushTopic:v46];

  id v18 = +[IDSDAccountController sharedInstance];
  id v19 = [v45 prefixedURI];
  id v20 = [v18 accountOnService:v44 withAliasURI:v19];

  if (v20)
  {
    if (([v20 shouldRegisterUsingDSHandle] & 1) != 0
      || ([v45 prefixedURI],
          unsigned int v21 = objc_claimAutoreleasedReturnValue(),
          unsigned __int8 v22 = [v20 hasAliasURI:v21],
          v21,
          (v22 & 1) != 0))
    {
      id v36 = [objc_alloc((Class)IDSIncomingNiceMessage) initWithMessageDictionary:v40 topic:v46];
      id v23 = +[NSNumber numberWithInteger:a4];
      [(IDSDaemon *)self _sendCertifiedDeliveryReceiptIfNeededForNiceMessage:v36 service:v46 failureReason:v23 failureReasonMessage:0 generateDeliveryReceipt:0];

      id v24 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      uint64_t v25 = IDSGetUUIDData();
      if (v25) {
        CFDictionarySetValue(v24, IDSFailedUUIDKey, v25);
      }

      if (value) {
        CFDictionarySetValue(v24, IDSFailedMessageIDKey, value);
      }
      id v26 = +[NSNumber numberWithInteger:a4];
      if (v26) {
        CFDictionarySetValue(v24, IDSFailureReasonKey, v26);
      }

      id v27 = [v42 rawToken];
      id v28 = [v41 prefixedURI];
      id v29 = (void *)_IDSCopyIDForTokenWithURI();

      id v30 = +[NSSet setWithObject:v29];
      id v31 = +[IDSDestination destinationWithStrings:v30];
      __int16 v32 = [v20 uniqueID];
      CFStringRef v33 = +[NSNumber numberWithInteger:120];
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      void v47[2] = sub_100392D08;
      v47[3] = &unk_100980FD8;
      id v48 = v42;
      LOBYTE(v35) = 1;
      [(IDSDaemon *)self _sendErrorMessage:v24 originalCommand:v39 fromURI:v45 toDestinations:v31 usingAccountWithUniqueID:v32 useDictAsTopLevel:1 dataToEncrypt:-1.0 wantsResponse:0 timeout:v35 command:v33 priority:300 completionBlock:v47];
    }
    else
    {
      uint64_t v34 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412546;
        unsigned int v50 = v20;
        __int16 v51 = 2112;
        id v52 = v45;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Account: %@ does not have alias URI: %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
  }
}

- (id)_populateDictionaryWithSenderKeyCheck:(id)a3 remoteURI:(id)a4 localURI:(id)a5 originalGUID:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v49 = a6;
  id v13 = +[IDSPeerIDManager sharedInstance];
  id v65 = v11;
  uint64_t v14 = +[NSArray arrayWithObjects:&v65 count:1];
  uint64_t v63 = IDSRegistrationPropertySupportsSenderKey;
  id v64 = &__kCFBooleanTrue;
  id v15 = +[NSDictionary dictionaryWithObjects:&v64 forKeys:&v63 count:1];
  id v16 = [v13 endpointsForURIs:v14 service:IDSServiceNameiMessage fromURI:v12 withCapabilities:v15];

  uint64_t v17 = [v16 objectForKey:v11];
  if ([v17 count])
  {
    uint64_t v18 = [(IDSSenderKeyDistributionManager *)self->_senderKeyDistributionManager encryptingKeyIDsFor:v11 localURI:v12];
    id v19 = (void *)v18;
    if (v18) {
      id v20 = (void *)v18;
    }
    else {
      id v20 = &__NSArray0__struct;
    }
    id v21 = v20;

    uint64_t v22 = [(IDSSenderKeyDistributionManager *)self->_senderKeyDistributionManager decryptingKeyIDsFor:v11 localURI:v12];
    id v23 = (void *)v22;
    if (v22) {
      id v24 = (void *)v22;
    }
    else {
      id v24 = &__NSArray0__struct;
    }
    id v25 = v24;

    id v26 = [(IDSDaemon *)self persistenceManager];
    unsigned int v27 = [v26 senderKeyMessageSupportedFor:v17];

    id v28 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v29 = @"NO";
      *(_DWORD *)long long buf = 138413570;
      id v52 = v49;
      if (v27) {
        CFStringRef v29 = @"YES";
      }
      __int16 v53 = 2112;
      CFStringRef v54 = v29;
      __int16 v55 = 2112;
      id v56 = v21;
      __int16 v57 = 2112;
      id v58 = v25;
      __int16 v59 = 2112;
      id v60 = v11;
      __int16 v61 = 2112;
      id v62 = v12;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Piggybacking on c=101 (originalGUID: %@) to send sender keyIDs useNewEncoding: %@ encryptingKeyIDs: %@ decryptingKeyIDs: %@ {remoteURI: %@, localURI:%@}", buf, 0x3Eu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      if (v27) {
        CFStringRef v30 = @"YES";
      }
      else {
        CFStringRef v30 = @"NO";
      }
      id v47 = v11;
      id v48 = v12;
      id v45 = v21;
      id v46 = v25;
      id v42 = v49;
      CFStringRef v44 = v30;
      _IDSLogV();
    }
    if (v27)
    {
      if ([v21 count])
      {
        id v31 = JWEncodeArray();
        [v10 setObject:v31 forKeyedSubscript:IDSDeliveryEncryptingSenderKeyIDs];
      }
      if (!objc_msgSend(v25, "count", v42, v44, v45, v46, v47, v48))
      {
        __int16 v32 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v52 = v11;
          _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "We have no decryptingKeyIDs from remoteURI: %@ - sending empty", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v43 = v11;
          _IDSLogV();
        }
      }
      id v50 = 0;
      CFStringRef v33 = +[NSPropertyListSerialization dataWithPropertyList:format:options:error:](NSPropertyListSerialization, "dataWithPropertyList:format:options:error:", v25, 200, 0, &v50, v43);
      id v34 = v50;
      uint64_t v35 = v34;
      if (v33 || !v34)
      {
        [v10 setObject:v33 forKeyedSubscript:IDSDeliveryDecryptingSenderKeyIDs];
      }
      else
      {
        id v36 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412290;
          id v52 = v25;
          _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "Error serializing decryptingKeyIDs: %@", buf, 0xCu);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    else
    {
      id v37 = [v21 firstObject];

      if (v37)
      {
        id v38 = objc_alloc((Class)NSData);
        id v39 = [v21 firstObject];
        id v40 = [v38 initWithBase64EncodedString:v39 options:0];

        [v10 setObject:v40 forKeyedSubscript:@"sK-E"];
      }
      uint64_t v35 = objc_msgSend(v25, "__imArrayByApplyingBlock:", &stru_10098A910, v42, v44, v45, v46, v47, v48);
      CFStringRef v33 = JWEncodeArray();
      [v10 setObject:v33 forKeyedSubscript:@"sK-D"];
    }
  }

  return v10;
}

- (void)_handleDeliveryReceiptForSenderKeyCheck:(id)a3 remoteURI:(id)a4 remotePushToken:(id)a5 localURI:(id)a6 originalGUID:(id)a7
{
  CFDictionaryRef v12 = (const __CFDictionary *)a3;
  id v13 = (__CFString *)a4;
  id v64 = (__CFString *)a5;
  uint64_t v14 = (__CFString *)a6;
  uint64_t v63 = (__CFString *)a7;
  Value = 0;
  if (v12 && IDSDeliveryEncryptingSenderKeyIDs) {
    Value = (void *)CFDictionaryGetValue(v12, IDSDeliveryEncryptingSenderKeyIDs);
  }
  id v61 = Value;
  JWDecodeArray();
  id v16 = (__CFString *)objc_claimAutoreleasedReturnValue();
  if (IDSDeliveryDecryptingSenderKeyIDs) {
    BOOL v17 = v12 != 0;
  }
  else {
    BOOL v17 = 0;
  }
  if (v17) {
    uint64_t v18 = (void *)CFDictionaryGetValue(v12, IDSDeliveryDecryptingSenderKeyIDs);
  }
  else {
    uint64_t v18 = 0;
  }
  id v62 = v18;
  JWDecodeArray();
  id v19 = (__CFString *)objc_claimAutoreleasedReturnValue();
  id v20 = +[NSMutableArray array];
  id v65 = +[NSMutableArray array];
  id v21 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138413570;
    CFStringRef v68 = v63;
    __int16 v69 = 2112;
    id v70 = v14;
    __int16 v71 = 2112;
    id v72 = v13;
    __int16 v73 = 2112;
    uint64_t v74 = v64;
    __int16 v75 = 2112;
    id v76 = v16;
    __int16 v77 = 2112;
    id v78 = v19;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Handling c=101 (originalGUID: %@) for sender key check { localURI: %@ remoteURI: %@ remotePushToken: %@ encryptingKeyIDs: %@ decryptingKeyIDs: %@ }", buf, 0x3Eu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v54 = v16;
    __int16 v55 = v19;
    id v50 = v13;
    id v52 = v64;
    CFStringRef v44 = v63;
    id v47 = v14;
    _IDSLogV();
  }
  if ([(__CFString *)v16 count])
  {
    uint64_t v22 = [(IDSSenderKeyDistributionManager *)self->_senderKeyDistributionManager missingRemoteEncryptingKeyIDs:v16];
    [v20 addObjectsFromArray:v22];
    id v23 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
    {
      id v24 = [v22 count];
      CFStringRef v25 = @"NO";
      if (!v24) {
        CFStringRef v25 = @"YES";
      }
      *(_DWORD *)long long buf = 138412546;
      CFStringRef v68 = v25;
      __int16 v69 = 2112;
      id v70 = v16;
      _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Do we have the keyID needed to decrypt from them? %@ %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v26 = [v22 count];
      CFStringRef v27 = @"NO";
      if (!v26) {
        CFStringRef v27 = @"YES";
      }
      CFStringRef v45 = v27;
      id v48 = v16;
      _IDSLogV();
    }
  }
  if (v19)
  {
    if ([(__CFString *)v19 count])
    {
      id v28 = [(IDSSenderKeyDistributionManager *)self->_senderKeyDistributionManager remoteMissingDecryptingKeyIDs:v19 remoteURI:v13 localURI:v14];
      [v65 addObjectsFromArray:v28];
      CFStringRef v29 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        id v30 = [v28 count];
        CFStringRef v31 = @"NO";
        if (!v30) {
          CFStringRef v31 = @"YES";
        }
        *(_DWORD *)long long buf = 138412546;
        CFStringRef v68 = v31;
        __int16 v69 = 2112;
        id v70 = v19;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Do they have the keyID needed to decrypt from us? %@ %@", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v32 = [v28 count];
        CFStringRef v33 = @"NO";
        if (!v32) {
          CFStringRef v33 = @"YES";
        }
        CFStringRef v45 = v33;
        id v48 = v19;
        _IDSLogV();
      }
      -[IDSSenderKeyDistributionManager updateDeliveredStateWithKeyIDStrings:pushToken:](self->_senderKeyDistributionManager, "updateDeliveredStateWithKeyIDStrings:pushToken:", v19, v64, v45, v48);
    }
    else
    {
      id v34 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        CFStringRef v68 = v13;
        __int16 v69 = 2112;
        id v70 = v64;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Received empty decryptingKeyIDs from remoteURI: %@ remotePushToken: %@ - we should reset", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        CFStringRef v45 = v13;
        id v48 = v64;
        _IDSLogV();
      }
      -[IDSSenderKeyDistributionManager resetKeyStateWithKeyIDs:senderURI:receiverURI:](self->_senderKeyDistributionManager, "resetKeyStateWithKeyIDs:senderURI:receiverURI:", 0, v14, v13, v45, v48);
    }
  }
  if (objc_msgSend(v20, "count", v45, v48) || objc_msgSend(v65, "count"))
  {
    [(IDSSenderKeyDistributionManager *)self->_senderKeyDistributionManager triggerKeyRecoveryToURI:v13 fromURI:v14 keysToSend:v65 keysToRequest:v20];
  }
  else
  {
    if (v12)
    {
      id v60 = (id)CFDictionaryGetValue(v12, @"sK-E");
      uint64_t v35 = (void *)CFDictionaryGetValue(v12, @"sK-D");
    }
    else
    {
      id v60 = 0;
      uint64_t v35 = 0;
    }
    id v57 = v35;
    __int16 v59 = JWDecodeArray();
    if (v60)
    {
      id v58 = [v60 base64EncodedStringWithOptions:0];
      senderKeyDistributionManager = self->_senderKeyDistributionManager;
      id v66 = v58;
      id v37 = +[NSArray arrayWithObjects:&v66 count:1];
      id v56 = [(IDSSenderKeyDistributionManager *)senderKeyDistributionManager missingRemoteEncryptingKeyIDs:v37];

      if ([v56 count]) {
        CFStringRef v38 = @"NO";
      }
      else {
        CFStringRef v38 = @"YES";
      }
      id v39 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138413058;
        CFStringRef v68 = v38;
        __int16 v69 = 2112;
        id v70 = v58;
        __int16 v71 = 2112;
        id v72 = v14;
        __int16 v73 = 2112;
        uint64_t v74 = v13;
        _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "(Legacy) Do we have the keyID needed to decrypt from them? %@ %@ {localURI: %@, remoteURI:%@}", buf, 0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        __int16 v51 = v14;
        __int16 v53 = v13;
        CFStringRef v46 = v38;
        id v49 = v58;
        _IDSLogV();
      }
    }
    if (objc_msgSend(v59, "count", v46, v49, v51, v53))
    {
      objc_msgSend(v59, "__imArrayByApplyingBlock:", &stru_10098A930);
      id v40 = (__CFString *)objc_claimAutoreleasedReturnValue();
      uint64_t v41 = [(IDSSenderKeyDistributionManager *)self->_senderKeyDistributionManager remoteMissingDecryptingKeyIDs:v40 remoteURI:v13 localURI:v14];
      if ([v41 count]) {
        CFStringRef v42 = @"NO";
      }
      else {
        CFStringRef v42 = @"YES";
      }
      id v43 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138413058;
        CFStringRef v68 = v42;
        __int16 v69 = 2112;
        id v70 = v40;
        __int16 v71 = 2112;
        id v72 = v14;
        __int16 v73 = 2112;
        uint64_t v74 = v13;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "(Legacy) Do they have the keyID needed to decrypt from us? %@ %@ {localURI: %@, remoteURI:%@}", buf, 0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
}

- (void)deliveryControllerHasSpaceforUrgentMessages:(id)a3 dataProtectionClass:(unsigned int)a4 ofTypes:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"Class D";
    if (v6 == 1) {
      CFStringRef v11 = @"Class A";
    }
    if (!v6) {
      CFStringRef v11 = @"Class C";
    }
    *(_DWORD *)long long buf = 138412546;
    CFStringRef v18 = @"URGENT";
    __int16 v19 = 2112;
    CFStringRef v20 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Alerted that local delivery controller now has space for %@ messages at class %@.", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v12 = @"Class D";
    if (v6 == 1) {
      CFStringRef v12 = @"Class A";
    }
    if (!v6) {
      CFStringRef v12 = @"Class C";
    }
    CFStringRef v15 = @"URGENT";
    CFStringRef v16 = v12;
    _IDSLogV();
  }
  id v13 = +[NSNumber numberWithUnsignedInt:](NSNumber, "numberWithUnsignedInt:", v6, v15, v16);
  uint64_t v14 = +[NSArray arrayWithObject:v13];
  [(IDSDaemon *)self _handleSpaceBecomingAvailableForUrgentLocalMessagesWithDataProtectionClasses:v14 withMessageTypes:v9];
}

- (void)deliveryControllerHasSpaceforNonUrgentMessages:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 ofTypes:(id)a6
{
  uint64_t v7 = *(void *)&a5;
  id v10 = a3;
  id v11 = a6;
  CFStringRef v12 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v13 = @"Sync";
    if (a4 == 200) {
      CFStringRef v13 = @"Default";
    }
    if (a4 == 300) {
      CFStringRef v13 = @"URGENT";
    }
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v21 = v13;
    _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEBUG, "Alerted that local delivery controller now has space for %@ messages.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v14 = @"Sync";
    if (a4 == 200) {
      CFStringRef v14 = @"Default";
    }
    if (a4 == 300) {
      CFStringRef v14 = @"URGENT";
    }
    CFStringRef v19 = v14;
    _IDSLogV();
  }
  CFStringRef v15 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4, v19);
  CFStringRef v16 = +[NSArray arrayWithObject:v15];
  BOOL v17 = +[NSNumber numberWithUnsignedInt:v7];
  CFStringRef v18 = +[NSArray arrayWithObject:v17];
  [(IDSDaemon *)self _resourceAvailabilityChangedForIdentifiers:0 priorities:v16 dataProtectionClasses:v18 messageTypes:v11];
}

- (void)deliveryControllerHasSpaceforNonUrgentMessages:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5
{
  uint64_t v5 = *(void *)&a5;
  id v8 = a3;
  id v9 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v9, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v10 = @"Sync";
    if (a4 == 200) {
      CFStringRef v10 = @"Default";
    }
    if (a4 == 300) {
      CFStringRef v10 = @"URGENT";
    }
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v18 = v10;
    _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEBUG, "Alerted that local delivery controller now has space for %@ messages.", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v11 = @"Sync";
    if (a4 == 200) {
      CFStringRef v11 = @"Default";
    }
    if (a4 == 300) {
      CFStringRef v11 = @"URGENT";
    }
    CFStringRef v16 = v11;
    _IDSLogV();
  }
  CFStringRef v12 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", a4, v16);
  CFStringRef v13 = +[NSArray arrayWithObject:v12];
  CFStringRef v14 = +[NSNumber numberWithUnsignedInt:v5];
  CFStringRef v15 = +[NSArray arrayWithObject:v14];
  [(IDSDaemon *)self _resourceAvailabilityChangedForIdentifiers:0 priorities:v13 dataProtectionClasses:v15];
}

- (void)_resourceAvailabilityChangedForIdentifiers:(id)a3 priorities:(id)a4 dataProtectionClasses:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v23 = a5;
  CFStringRef v10 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v36 = v8;
    __int16 v37 = 2112;
    id v38 = v9;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "Resource availability changed, identifiers: %@ priorities %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v19 = v8;
      id v20 = v9;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v19 = v8;
        id v20 = v9;
        _IDSLogV();
      }
    }
  }
  if (!objc_msgSend(v9, "count", v19, v20))
  {
    uint64_t v11 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_1009D1EC0, &off_1009D1EA8, 0);

    id v9 = (id)v11;
  }
  if (![v23 count])
  {
    uint64_t v12 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_1009D1ED8, &off_1009D1EF0, &off_1009D1F08, 0);

    id v23 = (id)v12;
  }
  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id obj = v9;
  id v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
  if (v24)
  {
    uint64_t v22 = *(void *)v30;
    do
    {
      CFStringRef v13 = 0;
      do
      {
        if (*(void *)v30 != v22) {
          objc_enumerationMutation(obj);
        }
        CFStringRef v14 = *(void **)(*((void *)&v29 + 1) + 8 * (void)v13);
        long long v25 = 0u;
        long long v26 = 0u;
        long long v27 = 0u;
        long long v28 = 0u;
        id v15 = v23;
        id v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
        if (v16)
        {
          uint64_t v17 = *(void *)v26;
          do
          {
            CFStringRef v18 = 0;
            do
            {
              if (*(void *)v26 != v17) {
                objc_enumerationMutation(v15);
              }
              -[IDSDaemon _resourceAvailabilityChangedForIdentifiers:priority:dataProtectionClass:](self, "_resourceAvailabilityChangedForIdentifiers:priority:dataProtectionClass:", v8, [v14 integerValue], objc_msgSend(*(id *)(*((void *)&v25 + 1) + 8 * (void)v18), "intValue"));
              CFStringRef v18 = (char *)v18 + 1;
            }
            while (v16 != v18);
            id v16 = [v15 countByEnumeratingWithState:&v25 objects:v33 count:16];
          }
          while (v16);
        }

        CFStringRef v13 = (char *)v13 + 1;
      }
      while (v13 != v24);
      id v24 = [obj countByEnumeratingWithState:&v29 objects:v34 count:16];
    }
    while (v24);
  }
}

- (void)_resourceAvailabilityChangedForIdentifiers:(id)a3 priorities:(id)a4 dataProtectionClasses:(id)a5 messageTypes:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v27 = a5;
  id v12 = a6;
  CFStringRef v13 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412546;
    id v41 = v10;
    __int16 v42 = 2112;
    id v43 = v11;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Resource availability changed, identifiers: %@ priorities %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v23 = v10;
      id v24 = v11;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v23 = v10;
        id v24 = v11;
        _IDSLogV();
      }
    }
  }
  if (!objc_msgSend(v11, "count", v23, v24))
  {
    uint64_t v14 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_1009D1EC0, &off_1009D1EA8, 0);

    id v11 = (id)v14;
  }
  if (![v27 count])
  {
    uint64_t v15 = +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_1009D1ED8, &off_1009D1EF0, &off_1009D1F08, 0);

    id v27 = (id)v15;
  }
  long long v36 = 0u;
  long long v37 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  id obj = v11;
  id v28 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
  if (v28)
  {
    uint64_t v26 = *(void *)v35;
    do
    {
      uint64_t v16 = 0;
      do
      {
        if (*(void *)v35 != v26)
        {
          uint64_t v17 = v16;
          objc_enumerationMutation(obj);
          uint64_t v16 = v17;
        }
        uint64_t v29 = v16;
        CFStringRef v18 = *(void **)(*((void *)&v34 + 1) + 8 * v16);
        long long v30 = 0u;
        long long v31 = 0u;
        long long v32 = 0u;
        long long v33 = 0u;
        id v19 = v27;
        id v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
        if (v20)
        {
          uint64_t v21 = *(void *)v31;
          do
          {
            uint64_t v22 = 0;
            do
            {
              if (*(void *)v31 != v21) {
                objc_enumerationMutation(v19);
              }
              -[IDSDaemon _resourceAvailabilityChangedForIdentifiers:priority:dataProtectionClass:messageTypes:](self, "_resourceAvailabilityChangedForIdentifiers:priority:dataProtectionClass:messageTypes:", v10, [v18 integerValue], objc_msgSend(*(id *)(*((void *)&v30 + 1) + 8 * (void)v22), "intValue"), v12);
              uint64_t v22 = (char *)v22 + 1;
            }
            while (v20 != v22);
            id v20 = [v19 countByEnumeratingWithState:&v30 objects:v38 count:16];
          }
          while (v20);
        }

        uint64_t v16 = v29 + 1;
      }
      while ((id)(v29 + 1) != v28);
      id v28 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    }
    while (v28);
  }
}

- (void)_resourceAvailabilityChangedForIdentifiers:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5
{
  id v8 = a3;
  im_assert_primary_base_queue();
  id v9 = objc_alloc_init((Class)NSMutableSet);
  id v10 = [v8 count];
  __int16 v42 = v8;
  if ([v8 count])
  {
    id v36 = v10;
    unsigned int v37 = a5;
    int64_t v39 = a4;
    id v38 = self;
    id v11 = [(IDSDaemon *)self serviceController];
    id v12 = [v11 allServices];

    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = v12;
    id v13 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
    if (v13)
    {
      id v14 = v13;
      uint64_t v41 = *(void *)v58;
      do
      {
        for (i = 0; i != v14; i = (char *)i + 1)
        {
          if (*(void *)v58 != v41) {
            objc_enumerationMutation(obj);
          }
          uint64_t v16 = *(void **)(*((void *)&v57 + 1) + 8 * i);
          long long v53 = 0u;
          long long v54 = 0u;
          long long v55 = 0u;
          long long v56 = 0u;
          id v17 = v42;
          id v18 = [v17 countByEnumeratingWithState:&v53 objects:v62 count:16];
          if (v18)
          {
            id v19 = v18;
            uint64_t v20 = *(void *)v54;
            while (2)
            {
              for (j = 0; j != v19; j = (char *)j + 1)
              {
                if (*(void *)v54 != v20) {
                  objc_enumerationMutation(v17);
                }
                uint64_t v22 = *(void *)(*((void *)&v53 + 1) + 8 * (void)j);
                id v23 = [v16 duetIdentifiers];
                LODWORD(v22) = [v23 containsObject:v22];

                if (v22)
                {
                  id v24 = +[IDSDAccountController sharedInstance];
                  long long v25 = [v24 accountsOnService:v16];

                  long long v51 = 0u;
                  long long v52 = 0u;
                  long long v49 = 0u;
                  long long v50 = 0u;
                  id v26 = v25;
                  id v27 = [v26 countByEnumeratingWithState:&v49 objects:v61 count:16];
                  if (v27)
                  {
                    id v28 = v27;
                    uint64_t v29 = *(void *)v50;
                    do
                    {
                      for (k = 0; k != v28; k = (char *)k + 1)
                      {
                        if (*(void *)v50 != v29) {
                          objc_enumerationMutation(v26);
                        }
                        long long v31 = [*(id *)(*((void *)&v49 + 1) + 8 * (void)k) uniqueID];
                        [v9 addObject:v31];
                      }
                      id v28 = [v26 countByEnumeratingWithState:&v49 objects:v61 count:16];
                    }
                    while (v28);
                  }

                  goto LABEL_24;
                }
              }
              id v19 = [v17 countByEnumeratingWithState:&v53 objects:v62 count:16];
              if (v19) {
                continue;
              }
              break;
            }
          }
LABEL_24:
        }
        id v14 = [obj countByEnumeratingWithState:&v57 objects:v63 count:16];
      }
      while (v14);
    }

    self = v38;
    a4 = v39;
    a5 = v37;
    id v10 = v36;
  }
  BOOL v32 = v10 != 0;
  long long v33 = +[IDSDaemonPriorityQueueController sharedInstance];
  v43[0] = _NSConcreteStackBlock;
  v43[1] = 3221225472;
  v43[2] = sub_100394F88;
  v43[3] = &unk_100984110;
  CFStringRef v45 = self;
  int64_t v46 = a4;
  unsigned int v47 = a5;
  BOOL v48 = v32;
  id v44 = v9;
  id v34 = v9;
  [v33 performBlockWithPriority:v43 priority:a4];
}

- (void)_resourceAvailabilityChangedForIdentifiers:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 messageTypes:(id)a6
{
  id v10 = a3;
  id v11 = a6;
  im_assert_primary_base_queue();
  id v12 = objc_alloc_init((Class)NSMutableSet);
  id v13 = [v10 count];
  id v44 = v10;
  if ([v10 count])
  {
    id v38 = v13;
    id v39 = v11;
    unsigned int v40 = a5;
    uint64_t v41 = self;
    id v14 = [(IDSDaemon *)self serviceController];
    uint64_t v15 = [v14 allServices];

    long long v63 = 0u;
    long long v64 = 0u;
    long long v61 = 0u;
    long long v62 = 0u;
    id obj = v15;
    id v45 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
    if (v45)
    {
      uint64_t v43 = *(void *)v62;
      do
      {
        for (i = 0; i != v45; i = (char *)i + 1)
        {
          if (*(void *)v62 != v43) {
            objc_enumerationMutation(obj);
          }
          id v17 = *(void **)(*((void *)&v61 + 1) + 8 * i);
          long long v57 = 0u;
          long long v58 = 0u;
          long long v59 = 0u;
          long long v60 = 0u;
          id v18 = v44;
          id v19 = [v18 countByEnumeratingWithState:&v57 objects:v66 count:16];
          if (v19)
          {
            id v20 = v19;
            uint64_t v21 = *(void *)v58;
            while (2)
            {
              for (j = 0; j != v20; j = (char *)j + 1)
              {
                if (*(void *)v58 != v21) {
                  objc_enumerationMutation(v18);
                }
                uint64_t v23 = *(void *)(*((void *)&v57 + 1) + 8 * (void)j);
                id v24 = [v17 duetIdentifiers];
                LODWORD(v23) = [v24 containsObject:v23];

                if (v23)
                {
                  long long v25 = +[IDSDAccountController sharedInstance];
                  id v26 = [v25 accountsOnService:v17];

                  long long v55 = 0u;
                  long long v56 = 0u;
                  long long v53 = 0u;
                  long long v54 = 0u;
                  id v27 = v26;
                  id v28 = [v27 countByEnumeratingWithState:&v53 objects:v65 count:16];
                  if (v28)
                  {
                    id v29 = v28;
                    uint64_t v30 = *(void *)v54;
                    do
                    {
                      for (k = 0; k != v29; k = (char *)k + 1)
                      {
                        if (*(void *)v54 != v30) {
                          objc_enumerationMutation(v27);
                        }
                        BOOL v32 = [*(id *)(*((void *)&v53 + 1) + 8 * (void)k) uniqueID];
                        [v12 addObject:v32];
                      }
                      id v29 = [v27 countByEnumeratingWithState:&v53 objects:v65 count:16];
                    }
                    while (v29);
                  }

                  goto LABEL_24;
                }
              }
              id v20 = [v18 countByEnumeratingWithState:&v57 objects:v66 count:16];
              if (v20) {
                continue;
              }
              break;
            }
          }
LABEL_24:
        }
        id v45 = [obj countByEnumeratingWithState:&v61 objects:v67 count:16];
      }
      while (v45);
    }

    self = v41;
    a5 = v40;
    id v13 = v38;
    id v11 = v39;
  }
  BOOL v33 = v13 != 0;
  id v34 = +[IDSDaemonPriorityQueueController sharedInstance];
  v46[0] = _NSConcreteStackBlock;
  v46[1] = 3221225472;
  void v46[2] = sub_1003956D0;
  v46[3] = &unk_10098A980;
  unsigned int v51 = a5;
  BOOL v52 = v33;
  id v47 = v11;
  id v48 = v12;
  long long v49 = self;
  int64_t v50 = a4;
  id v35 = v12;
  id v36 = v11;
  [v34 performBlockWithPriority:v46 priority:a4];
}

- (void)_processLocalMessagesWithAccountUUIDs:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5
{
  id v48 = a3;
  im_assert_primary_base_queue();
  uint64_t v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v8 = [v48 count];
    CFStringRef v9 = @"Sync";
    if (a4 == 200) {
      CFStringRef v9 = @"Default";
    }
    if (a4 == 300) {
      CFStringRef v9 = @"URGENT";
    }
    CFStringRef v10 = @"Class A";
    if (a5 != 1) {
      CFStringRef v10 = @"Class D";
    }
    *(_DWORD *)long long buf = 67109634;
    *(_DWORD *)long long v64 = v8;
    *(_WORD *)&v64[4] = 2112;
    *(void *)&v64[6] = v9;
    if (a5) {
      CFStringRef v11 = v10;
    }
    else {
      CFStringRef v11 = @"Class C";
    }
    *(_WORD *)&v64[14] = 2112;
    *(void *)&v64[16] = v11;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "_processLocalMessagesWithAccountUUIDs with number of accountUUIDs %d priority %@ class %@", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v12 = [v48 count];
    CFStringRef v13 = @"Sync";
    if (a4 == 200) {
      CFStringRef v13 = @"Default";
    }
    if (a4 == 300) {
      CFStringRef v13 = @"URGENT";
    }
    CFStringRef v14 = @"Class D";
    if (a5 == 1) {
      CFStringRef v14 = @"Class A";
    }
    if (!a5) {
      CFStringRef v14 = @"Class C";
    }
    CFStringRef v43 = v13;
    CFStringRef v44 = v14;
    id v42 = v12;
    _IDSLogV();
  }
  uint64_t v15 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v15, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v16 = @"Sync";
    if (a4 == 200) {
      CFStringRef v16 = @"Default";
    }
    if (a4 == 300) {
      CFStringRef v16 = @"URGENT";
    }
    CFStringRef v17 = @"Class A";
    if (a5 != 1) {
      CFStringRef v17 = @"Class D";
    }
    *(_DWORD *)long long buf = 138412802;
    *(void *)long long v64 = v48;
    *(void *)&v64[10] = v16;
    *(_WORD *)&v64[8] = 2112;
    if (!a5) {
      CFStringRef v17 = @"Class C";
    }
    *(_WORD *)&v64[18] = 2112;
    *(void *)&v64[20] = v17;
    _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEBUG, "_processLocalMessagesWithAccountUUIDs accountUUIDs %@ priority %@ class %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v18 = @"Sync";
    if (a4 == 200) {
      CFStringRef v18 = @"Default";
    }
    if (a4 == 300) {
      CFStringRef v18 = @"URGENT";
    }
    CFStringRef v19 = @"Class D";
    if (a5 == 1) {
      CFStringRef v19 = @"Class A";
    }
    if (!a5) {
      CFStringRef v19 = @"Class C";
    }
    CFStringRef v43 = v18;
    CFStringRef v44 = v19;
    id v42 = v48;
    _IDSLogV();
  }
  if (objc_msgSend(v48, "count", v42, v43, v44))
  {
    id v47 = [v48 objectAtIndex:0];
    [v48 removeObjectAtIndex:0];
    id v20 = +[IDSDAccountController sharedInstance];
    uint64_t v21 = [v20 accountWithUniqueID:v47];

    v59[0] = _NSConcreteStackBlock;
    v59[1] = 3221225472;
    v59[2] = sub_10039627C;
    v59[3] = &unk_10098A958;
    v59[4] = self;
    id v60 = v48;
    int64_t v61 = a4;
    unsigned int v62 = a5;
    block = objc_retainBlock(v59);
    if (!v21)
    {
      uint64_t v22 = im_primary_queue();
      dispatch_async(v22, block);
    }
    uint64_t v23 = [v21 service];
    if ([v23 adHocServiceType] == 2)
    {
    }
    else
    {
      long long v25 = [v21 service];
      BOOL v26 = [v25 adHocServiceType] == 5;

      if (!v26)
      {
        uint64_t v41 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)long long v64 = v47;
          *(_WORD *)&v64[8] = 2112;
          *(void *)&v64[10] = v21;
          _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "Skipping invalid accountUUID %@ for account %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        id v29 = im_primary_queue();
        dispatch_async(v29, block);
        goto LABEL_68;
      }
    }
    id v27 = objc_alloc_init((Class)IDSSendParameters);
    [v27 setPriority:a4];
    id v28 = [v21 superAccount];
    id v29 = v28;
    if (!v28) {
      goto LABEL_57;
    }
    id v30 = [v28 newSendMessageContext];
    long long v31 = [v21 service];
    BOOL v32 = [v31 pushTopic];
    [v30 setSubService:v32];

    if (!v30) {
LABEL_57:
    }
      id v30 = [v21 newSendMessageContext];
    BOOL v33 = [v30 subService];
    if ([v33 length]) {
      [v30 subService];
    }
    else {
    id v34 = [v30 serviceIdentifier];
    }

    id v35 = [v30 serviceDuetIdentifiers];
    id v36 = +[IDSDaemonPriorityQueueController sharedInstance];
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_100396290;
    v49[3] = &unk_10098A9F8;
    v49[4] = self;
    id v50 = v34;
    id v51 = v35;
    id v52 = v27;
    int64_t v57 = a4;
    id v53 = v21;
    id v54 = v30;
    unsigned int v58 = a5;
    long long v56 = block;
    id v55 = v47;
    id v37 = v30;
    id v38 = v27;
    id v39 = v35;
    id v40 = v34;
    [v36 performBlockWithPriority:v49 priority:a4];

LABEL_68:
    goto LABEL_69;
  }
  id v24 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No pending non-urgent local messages to send, returning", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
LABEL_69:
}

- (void)_processLocalMessagesWithAccountUUIDs:(id)a3 priority:(int64_t)a4 dataProtectionClass:(unsigned int)a5 messageTypes:(id)a6
{
  id v51 = a3;
  id v50 = a6;
  im_assert_primary_base_queue();
  CFStringRef v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    unsigned int v11 = [v51 count];
    CFStringRef v12 = @"Sync";
    if (a4 == 200) {
      CFStringRef v12 = @"Default";
    }
    if (a4 == 300) {
      CFStringRef v12 = @"URGENT";
    }
    CFStringRef v13 = @"Class A";
    if (a5 != 1) {
      CFStringRef v13 = @"Class D";
    }
    *(_DWORD *)long long buf = 67109634;
    *(_DWORD *)__int16 v69 = v11;
    *(_WORD *)&v69[4] = 2112;
    *(void *)&v69[6] = v12;
    if (a5) {
      CFStringRef v14 = v13;
    }
    else {
      CFStringRef v14 = @"Class C";
    }
    *(_WORD *)&v69[14] = 2112;
    *(void *)&v69[16] = v14;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "_processLocalMessagesWithAccountUUIDs with number of accountUUIDs %d priority %@ class %@", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v15 = [v51 count];
    CFStringRef v16 = @"Sync";
    if (a4 == 200) {
      CFStringRef v16 = @"Default";
    }
    if (a4 == 300) {
      CFStringRef v16 = @"URGENT";
    }
    CFStringRef v17 = @"Class D";
    if (a5 == 1) {
      CFStringRef v17 = @"Class A";
    }
    if (!a5) {
      CFStringRef v17 = @"Class C";
    }
    CFStringRef v45 = v16;
    CFStringRef v46 = v17;
    id v44 = v15;
    _IDSLogV();
  }
  CFStringRef v18 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEBUG))
  {
    CFStringRef v19 = @"Sync";
    if (a4 == 200) {
      CFStringRef v19 = @"Default";
    }
    if (a4 == 300) {
      CFStringRef v19 = @"URGENT";
    }
    CFStringRef v20 = @"Class A";
    if (a5 != 1) {
      CFStringRef v20 = @"Class D";
    }
    *(_DWORD *)long long buf = 138412802;
    *(void *)__int16 v69 = v51;
    *(void *)&v69[10] = v19;
    *(_WORD *)&v69[8] = 2112;
    if (!a5) {
      CFStringRef v20 = @"Class C";
    }
    *(_WORD *)&v69[18] = 2112;
    *(void *)&v69[20] = v20;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEBUG, "_processLocalMessagesWithAccountUUIDs accountUUIDs %@ priority %@ class %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v21 = @"Sync";
    if (a4 == 200) {
      CFStringRef v21 = @"Default";
    }
    if (a4 == 300) {
      CFStringRef v21 = @"URGENT";
    }
    CFStringRef v22 = @"Class D";
    if (a5 == 1) {
      CFStringRef v22 = @"Class A";
    }
    if (!a5) {
      CFStringRef v22 = @"Class C";
    }
    CFStringRef v45 = v21;
    CFStringRef v46 = v22;
    id v44 = v51;
    _IDSLogV();
  }
  if (objc_msgSend(v51, "count", v44, v45, v46))
  {
    long long v49 = [v51 objectAtIndex:0];
    [v51 removeObjectAtIndex:0];
    uint64_t v23 = +[IDSDAccountController sharedInstance];
    id v24 = [v23 accountWithUniqueID:v49];

    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_100396F44;
    v63[3] = &unk_10098A178;
    v63[4] = self;
    id v64 = v51;
    int64_t v66 = a4;
    unsigned int v67 = a5;
    id v25 = v50;
    id v65 = v25;
    block = objc_retainBlock(v63);
    if (!v24)
    {
      BOOL v26 = im_primary_queue();
      dispatch_async(v26, block);
    }
    id v27 = [v24 service];
    if ([v27 adHocServiceType] == 2)
    {
    }
    else
    {
      id v29 = [v24 service];
      BOOL v30 = [v29 adHocServiceType] == 5;

      if (!v30)
      {
        CFStringRef v43 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)__int16 v69 = v49;
          *(_WORD *)&v69[8] = 2112;
          *(void *)&v69[10] = v24;
          _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "Skipping invalid accountUUID %@ for account %@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
          _IDSLogV();
        }
        id v48 = im_primary_queue();
        dispatch_async(v48, block);
        goto LABEL_68;
      }
    }
    id v31 = objc_alloc_init((Class)IDSSendParameters);
    [v31 setPriority:a4];
    id v48 = [v24 superAccount];
    if (!v48) {
      goto LABEL_57;
    }
    id v32 = [v48 newSendMessageContext];
    BOOL v33 = [v24 service];
    id v34 = [v33 pushTopic];
    [v32 setSubService:v34];

    if (!v32) {
LABEL_57:
    }
      id v32 = [v24 newSendMessageContext];
    id v35 = [v32 subService];
    if ([v35 length]) {
      [v32 subService];
    }
    else {
    id v36 = [v32 serviceIdentifier];
    }

    id v37 = [v32 serviceDuetIdentifiers];
    id v38 = +[IDSDaemonPriorityQueueController sharedInstance];
    v52[0] = _NSConcreteStackBlock;
    v52[1] = 3221225472;
    v52[2] = sub_100396F58;
    v52[3] = &unk_10098AA70;
    v52[4] = self;
    id v53 = v36;
    id v54 = v37;
    id v55 = v31;
    int64_t v61 = a4;
    id v56 = v24;
    id v57 = v32;
    id v58 = v25;
    unsigned int v62 = a5;
    id v60 = block;
    id v59 = v49;
    id v39 = v32;
    id v40 = v31;
    id v41 = v37;
    id v42 = v36;
    [v38 performBlockWithPriority:v52 priority:a4];

LABEL_68:
    goto LABEL_69;
  }
  id v28 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "No pending non-urgent local messages to send, returning", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
LABEL_69:
}

+ (void)_performDuetCheckAndSendForServiceIdentifier:(id)a3 serviceDuetIdentifiers:(id)a4 sendParameters:(id)a5 logString:(id)a6 fromQueue:(id)a7 completionBlock:(id)a8
{
  id v13 = a3;
  id v37 = a4;
  id v14 = a5;
  id v15 = a6;
  CFStringRef v16 = a7;
  CFStringRef v17 = (void (**)(id, uint64_t))a8;
  dispatch_assert_queue_V2(v16);
  CFStringRef v18 = [v14 duetIdentifiersOverride];
  if (![v18 count])
  {
    id v19 = v37;

    CFStringRef v18 = v19;
  }
  id v20 = [v14 priority];
  CFStringRef v21 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    if (v20 == (id)300) {
      CFStringRef v22 = @"URGENT";
    }
    else {
      CFStringRef v22 = @"non-urgent";
    }
    id v23 = [v14 accountUUID];
    unsigned int v24 = [v14 bypassDuet];
    CFStringRef v25 = @"NO";
    *(_DWORD *)long long buf = 138413570;
    CFStringRef v39 = v22;
    __int16 v40 = 2112;
    if (v24) {
      CFStringRef v25 = @"YES";
    }
    id v41 = v23;
    __int16 v42 = 2112;
    id v43 = v13;
    __int16 v44 = 2112;
    CFStringRef v45 = v18;
    __int16 v46 = 2112;
    CFStringRef v47 = v25;
    __int16 v48 = 2112;
    id v49 = v15;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Performing duet check for priority %@ for account %@ serviceIdentifier %@ duetIdentifiers %@ bypassDuet %@  logString: %@", buf, 0x3Eu);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    if (v20 == (id)300) {
      CFStringRef v26 = @"URGENT";
    }
    else {
      CFStringRef v26 = @"non-urgent";
    }
    id v27 = [v14 accountUUID];
    unsigned int v28 = [v14 bypassDuet];
    CFStringRef v29 = @"NO";
    if (v28) {
      CFStringRef v29 = @"YES";
    }
    CFStringRef v35 = v29;
    id v36 = v15;
    id v33 = v13;
    id v34 = v18;
    CFStringRef v31 = v26;
    id v32 = v27;
    _IDSLogV();
  }
  if (!objc_msgSend(v14, "bypassDuet", v31, v32, v33, v34, v35, v36))
  {
    if (v20 == (id)300)
    {
      if (v17) {
        v17[2](v17, 1);
      }

      CFStringRef v17 = 0;
    }
    BOOL v30 = +[IDSDuetInterface sharedInstance];
    objc_msgSend(v30, "checkAvailabilityForValues:priority:logString:fromQueue:withCompletionBlock:", v18, objc_msgSend(v14, "priority"), v15, v16, v17);

    goto LABEL_26;
  }
  if (v17)
  {
    v17[2](v17, 1);
LABEL_26:
  }
}

- (void)_performDuetCheckAndSendForAccount:(id)a3 sendParameters:(id)a4 logString:(id)a5 fromQueue:(id)a6 completionBlock:(id)a7
{
  id v11 = a7;
  id v12 = a6;
  id v13 = a5;
  id v14 = a4;
  id v15 = a3;
  CFStringRef v16 = objc_opt_class();
  id v20 = [v15 service];
  CFStringRef v17 = [v20 identifier];
  CFStringRef v18 = [v15 service];

  id v19 = [v18 duetIdentifiers];
  [v16 _performDuetCheckAndSendForServiceIdentifier:v17 serviceDuetIdentifiers:v19 sendParameters:v14 logString:v13 fromQueue:v12 completionBlock:v11];
}

- (BOOL)_canBulkMessageWithParameters:(id)a3
{
  id v3 = a3;
  double v4 = +[IDSDAccountController sharedInstance];
  uint64_t v5 = [v3 accountUUID];
  uint64_t v6 = [v4 accountWithUniqueID:v5];

  uint64_t v7 = [v6 service];
  if ([v7 adHocServiceType] == 2)
  {
  }
  else
  {
    unsigned int v8 = [v6 service];
    unsigned int v9 = [v8 adHocServiceType];

    if (v9 != 5)
    {
      BOOL v10 = [v3 priority] != (id)300;
      goto LABEL_6;
    }
  }
  BOOL v10 = 0;
LABEL_6:

  return v10;
}

- (void)_nonUrgentInternetSendTimerFired
{
  [(IMDispatchTimer *)self->_nonUrgentInternetSendTimer invalidate];
  nonUrgentInternetSendTimer = self->_nonUrgentInternetSendTimer;
  self->_nonUrgentInternetSendTimer = 0;

  double v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)uint64_t v5 = 0;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Non-urgent internet send timer fired.", v5, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  [(IDSDaemon *)self _processOutgoingNonUrgentInternetMessages];
}

- (void)_updateNonUrgentInternetSendTimer
{
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    double v4 = [(IMDispatchTimer *)self->_nonUrgentInternetSendTimer fireDate];
    *(_DWORD *)long long buf = 138412290;
    double v22 = *(double *)&v4;
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Scheduling a non-urgent internet send timer if needed. Existing timer fire date? %@", buf, 0xCu);
  }
  if ((os_log_shim_legacy_logging_enabled() & 1) != 0 && _IDSShouldLog())
  {
    id v19 = [(IMDispatchTimer *)self->_nonUrgentInternetSendTimer fireDate];
    _IDSLogV();
  }
  if (!self->_nonUrgentInternetSendTimer)
  {
    uint64_t v5 = [(IDSDaemon *)self serverBagForBagType:1];
    uint64_t v6 = [v5 objectForKey:@"nonurgent_internet_send_interval"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v6 doubleValue];
      double v8 = v7;
    }
    else
    {
      double v8 = 1800.0;
    }
    unsigned int v9 = -[IDSDaemon serverBagForBagType:](self, "serverBagForBagType:", 1, v19);
    BOOL v10 = [v9 objectForKey:@"nonurgent_internet_send_interval_max_fuzz"];

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      [v10 doubleValue];
      uint32_t v12 = (int)v11;
    }
    else
    {
      uint32_t v12 = 300;
    }
    double v13 = (double)arc4random_uniform(v12);
    id v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134218496;
      double v22 = v8;
      __int16 v23 = 2048;
      double v24 = v13;
      __int16 v25 = 2048;
      double v26 = v8 + v13;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "timeInterval for _nonUrgentInternetSendTimer as %f + %f = %f", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
    id v15 = objc_alloc((Class)IMDispatchTimer);
    CFStringRef v16 = im_primary_queue();
    v20[0] = _NSConcreteStackBlock;
    v20[1] = 3221225472;
    v20[2] = sub_100397D88;
    v20[3] = &unk_100980598;
    void v20[4] = self;
    CFStringRef v17 = (IMDispatchTimer *)[v15 initWithQueue:v16 interval:(unint64_t)(v8 + v13) repeats:0 handlerBlock:v20];
    nonUrgentInternetSendTimer = self->_nonUrgentInternetSendTimer;
    self->_nonUrgentInternetSendTimer = v17;
  }
}

- (BOOL)_hasNonUrgentInternetSendingBudget
{
  id v2 = [(IMDispatchTimer *)self->_nonUrgentInternetSendTimer fireDate];
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    [v2 timeIntervalSinceNow];
    *(_DWORD *)long long buf = 138412546;
    BOOL v10 = v2;
    __int16 v11 = 2048;
    double v12 = fabs(v4);
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "Checking _hasNonUrgentInternetSendingBudget, fireDate is %@, %f", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    [v2 timeIntervalSinceNow];
    _IDSLogV();
  }
  if (v2 && ([v2 timeIntervalSinceNow], fabs(v5) > 60.0))
  {
    uint64_t v6 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      BOOL v10 = v2;
      _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Last non-urgent internet send was too recent...waiting until next lock or non-urgent internet send to try again. Next fire date is %@.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (int64_t)_currentSecondsIntoDay
{
  id v2 = [objc_alloc((Class)NSCalendar) initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
  id v3 = +[NSTimeZone timeZoneForSecondsFromGMT:0];
  [v2 setTimeZone:v3];

  double v4 = +[NSDate date];
  double v5 = [v2 components:224 fromDate:v4];

  uint64_t v6 = 3600 * (void)[v5 hour];
  uint64_t v7 = v6 + 60 * (void)[v5 minute];
  double v8 = (char *)[v5 second] + v7;

  return (int64_t)v8;
}

- (double)_nonUrgentInternetSendProbabilityForCurrentWindow
{
  id v2 = +[IDSServerBag sharedInstanceForBagType:1];
  id v34 = [v2 objectForKey:@"md-low-priority-send-window-constraints"];

  if (!v34)
  {
    CFStringRef v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Non-urgent internet send probability windows are not specified in the server bag - returning 1.0", buf, 2u);
    }

    double v4 = 1.0;
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    goto LABEL_61;
  }
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v35 = [(IDSDaemon *)self _currentSecondsIntoDay];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v39 = 0u;
    long long v40 = 0u;
    id obj = v34;
    id v3 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
    double v4 = 1.0;
    if (v3)
    {
      uint64_t v5 = *(void *)v38;
      while (2)
      {
        for (i = 0; i != v3; i = (char *)i + 1)
        {
          if (*(void *)v38 != v5) {
            objc_enumerationMutation(obj);
          }
          uint64_t v7 = *(void **)(*((void *)&v37 + 1) + 8 * i);
          objc_opt_class();
          if (objc_opt_isKindOfClass())
          {
            double v8 = [v7 objectForKey:@"start-time"];
            unsigned int v9 = [v7 objectForKey:@"end-time"];
            uint64_t v10 = [v7 objectForKey:@"probability"];
            __int16 v11 = (void *)v10;
            if (v8) {
              BOOL v12 = v9 == 0;
            }
            else {
              BOOL v12 = 1;
            }
            if (v12 || v10 == 0)
            {
              id v14 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
              {
                *(_DWORD *)long long buf = 138412802;
                double v42 = *(double *)&v8;
                __int16 v43 = 2112;
                __int16 v44 = v9;
                __int16 v45 = 2112;
                __int16 v46 = v11;
                _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "Non-urgent internet send probability window is not fully defined: (%@, %@, %@)", buf, 0x20u);
              }

              if (os_log_shim_legacy_logging_enabled())
              {
                _IDSWarnV();
                _IDSLogV();
                BOOL v30 = v9;
                CFStringRef v31 = v11;
                CFStringRef v29 = v8;
                _IDSLogTransport();
              }
            }
            else if (v35 >= (uint64_t)[v8 integerValue] {
                   && v35 <= (uint64_t)[v9 integerValue])
            }
            {
              id v20 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)long long buf = 138413058;
                double v42 = *(double *)&v8;
                __int16 v43 = 2112;
                __int16 v44 = v9;
                __int16 v45 = 2112;
                __int16 v46 = v11;
                __int16 v47 = 2048;
                uint64_t v48 = v35;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "We are currently in send window (%@, %@, %@). The time is currently %ld", buf, 0x2Au);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                CFStringRef v31 = v11;
                uint64_t v32 = v35;
                CFStringRef v29 = v8;
                BOOL v30 = v9;
                _IDSLogV();
              }
              objc_msgSend(v11, "doubleValue", v29, v30, v31, v32);
              if (v21 >= 0.0) {
                double v22 = v21;
              }
              else {
                double v22 = 0.0;
              }
              int64_t nonUrgentInternetLastAttempt = self->_nonUrgentInternetLastAttempt;
              double v4 = fmin(v22, 1.0);
              if (nonUrgentInternetLastAttempt >= (uint64_t)[v8 integerValue])
              {
                int64_t v24 = self->_nonUrgentInternetLastAttempt;
                if (v24 <= (uint64_t)[v9 integerValue])
                {
                  __int16 v25 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v25, OS_LOG_TYPE_DEFAULT))
                  {
                    int64_t v26 = self->_nonUrgentInternetLastAttempt;
                    *(_DWORD *)long long buf = 134217984;
                    double v42 = *(double *)&v26;
                    _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_DEFAULT, "Last non-urgent internet message attempt %ld is in this window - forcing probability to 0.0", buf, 0xCu);
                  }

                  double v4 = 0.0;
                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                    _IDSLogV();
                  }
                }
              }

              goto LABEL_56;
            }
          }
          else
          {
            id v15 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412290;
              double v42 = *(double *)&v7;
              _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "Non-urgent internet send probability window is not of the correct type! %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              _IDSWarnV();
              _IDSLogV();
              CFStringRef v29 = v7;
              _IDSLogTransport();
            }
          }
        }
        id v3 = [obj countByEnumeratingWithState:&v37 objects:v49 count:16];
        if (v3) {
          continue;
        }
        break;
      }
    }
LABEL_56:

    id v27 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      double v42 = v4;
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Using non-urgent internet send probability %f for the current window.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    goto LABEL_61;
  }
  CFStringRef v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 138412290;
    double v42 = *(double *)&v34;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "Non-urgent internet send probability windows is not of the correct type! Returning probability = 1.0. %@", buf, 0xCu);
  }

  double v4 = 1.0;
  int v18 = os_log_shim_legacy_logging_enabled();
  id v19 = v34;
  if (v18)
  {
    _IDSWarnV();
    _IDSLogV();
    _IDSLogTransport();
LABEL_61:
    id v19 = v34;
  }

  return v4;
}

- (BOOL)_rollDieForNonUrgentInternetSend
{
  int64_t v3 = [(IDSDaemon *)self _currentSecondsIntoDay];
  [(IDSDaemon *)self _nonUrgentInternetSendProbabilityForCurrentWindow];
  double v5 = v4;
  uint64_t v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    int64_t nonUrgentInternetLastAttempt = self->_nonUrgentInternetLastAttempt;
    if (nonUrgentInternetLastAttempt <= 0) {
      uint64_t v8 = -1;
    }
    else {
      uint64_t v8 = v3 - nonUrgentInternetLastAttempt;
    }
    *(_DWORD *)long long buf = 134218240;
    uint64_t v18 = v8;
    __int16 v19 = 2048;
    double v20 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Rolling die to attempt non-urgent internet send. Last check was %ld seconds ago. Probability = %f.", buf, 0x16u);
  }

  if ((os_log_shim_legacy_logging_enabled() & 1) != 0 && _IDSShouldLog()) {
    _IDSLogV();
  }
  self->_int64_t nonUrgentInternetLastAttempt = v3;
  if (v5 <= 2.22044605e-16)
  {
    id v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Probability is 0, cannot send.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    return 0;
  }
  else if (v5 >= 1.0)
  {
    id v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Probability is >= 1, can send.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    return 1;
  }
  else
  {
    double v9 = (double)(arc4random() & 0x7FFFFFFF);
    double v10 = v5 * 2147483650.0;
    BOOL v11 = v10 >= v9;
    BOOL v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v13 = @"NO";
      if (v10 >= v9) {
        CFStringRef v13 = @"YES";
      }
      *(_DWORD *)long long buf = 138412290;
      uint64_t v18 = (uint64_t)v13;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Rolled the die - can send? %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  return v11;
}

- (BOOL)_canSendNonUrgentInternetMessageForTopic:(id)a3
{
  id v4 = a3;
  double v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "_canSendNonUrgentInternetMessageForTopic ", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  uint64_t v6 = [(IDSDaemon *)self pushHandlerForAPSDelegatePort];
  unsigned __int8 v7 = [v6 isConnected];

  if ((v7 & 1) == 0)
  {
    BOOL v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Push is not connected - skipping send attempt.", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      goto LABEL_21;
    }
LABEL_20:
    _IDSLogV();
LABEL_21:
    BOOL v10 = 0;
    goto LABEL_29;
  }
  if (![(IDSDaemon *)self _rollDieForNonUrgentInternetSend])
  {
    BOOL v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "We can't send further non-urgent internet messages in this window, skipping.", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      goto LABEL_21;
    }
    goto LABEL_20;
  }
  uint64_t v8 = [(IDSDaemon *)self serverBagForBagType:1];
  double v9 = [v8 objectForKey:@"sync_topics_allowed_to_send_immediately"];

  if (v9 && ([v9 containsObject:v4] & 1) != 0)
  {
    BOOL v10 = 1;
  }
  else
  {
    CFStringRef v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      id v16 = v4;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Server Bag policy for sending message immediately for topic - %@ does not exist. This message will proceed with default behavior", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    BOOL v10 = 0;
  }

LABEL_29:
  return v10;
}

- (void)_processOutgoingNonUrgentInternetMessages
{
  id v2 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v2, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v2, OS_LOG_TYPE_DEFAULT, "_processOutgoingNonUrgentInternetMessages", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  int64_t v3 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
  unsigned __int8 v4 = [v3 isConnected];

  if ((v4 & 1) == 0)
  {
    uint64_t v32 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Push is not connected - skipping send attempt.", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      return;
    }
LABEL_67:
    _IDSLogV();
    return;
  }
  if (![(IDSDaemon *)self _hasNonUrgentInternetSendingBudget])
  {
    id v33 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEFAULT, "Lack budget to perform non-urgent internet send, skipping.", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      return;
    }
    goto LABEL_67;
  }
  if (![(IDSDaemon *)self _rollDieForNonUrgentInternetSend])
  {
    id v34 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "We can't send further non-urgent internet messages in this window, skipping.", buf, 2u);
    }

    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      return;
    }
    goto LABEL_67;
  }
  [(IMDispatchTimer *)self->_nonUrgentInternetSendTimer invalidate];
  nonUrgentInternetSendTimer = self->_nonUrgentInternetSendTimer;
  self->_nonUrgentInternetSendTimer = 0;

  id v91 = objc_alloc_init((Class)NSMutableArray);
  unsigned __int8 v7 = +[IDSDMessageStore unsentOutgoingMessagesUpToLimit:10000 priority:200 localDestinationDeviceID:0];
  if (v7) {
    [v91 addObjectsFromArray:v7];
  }
  uint64_t v8 = +[IDSDMessageStore unsentOutgoingMessagesUpToLimit:10000 priority:100 localDestinationDeviceID:0];
  if (v8) {
    [v91 addObjectsFromArray:v8];
  }

  id v103 = [v91 count];
  if (v103)
  {
    double v9 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      id v135 = v103;
      _os_log_impl((void *)&_mh_execute_header, v9, OS_LOG_TYPE_DEFAULT, "Processing stored %lu non-urgent internet outgoing messages", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v81 = v103;
      _IDSLogV();
    }
    id v98 = objc_alloc_init((Class)NSMutableArray);
    long long v132 = 0u;
    long long v133 = 0u;
    long long v130 = 0u;
    long long v131 = 0u;
    id obj = v91;
    id v10 = [obj countByEnumeratingWithState:&v130 objects:v147 count:16];
    if (!v10)
    {
      long long v110 = 0;
      goto LABEL_69;
    }
    long long v110 = 0;
    uint64_t v112 = *(void *)v131;
    while (1)
    {
      BOOL v11 = 0;
      do
      {
        if (*(void *)v131 != v112) {
          objc_enumerationMutation(obj);
        }
        BOOL v12 = *(void **)(*((void *)&v130 + 1) + 8 * (void)v11);
        CFStringRef v13 = +[IDSDAccountController sharedInstance];
        id v14 = [v12 accountGUID];
        id v15 = [v13 accountWithUniqueID:v14];

        id v16 = [v15 service];
        id v17 = [v16 dataProtectionClass];

        if (v15)
        {
          uint64_t v18 = [v15 service];
          if ([v18 adHocServiceType] == 2)
          {

LABEL_28:
            ++v110;
            goto LABEL_39;
          }
          __int16 v19 = [v15 service];
          BOOL v20 = [v19 adHocServiceType] == 5;

          if (v20) {
            goto LABEL_28;
          }
        }
        double v21 = [v12 dataToEncrypt];
        if (v21)
        {
        }
        else if (([v12 encryptPayload] & 1) == 0)
        {
          long long v128 = 0u;
          long long v129 = 0u;
          long long v126 = 0u;
          long long v127 = 0u;
          id v26 = v98;
          id v27 = [v26 countByEnumeratingWithState:&v126 objects:v146 count:16];
          if (v27)
          {
            uint64_t v28 = *(void *)v127;
            while (2)
            {
              for (i = 0; i != v27; i = (char *)i + 1)
              {
                if (*(void *)v127 != v28) {
                  objc_enumerationMutation(v26);
                }
                BOOL v30 = *(void **)(*((void *)&v126 + 1) + 8 * i);
                if ([v30 canCombineWithMessage:v12])
                {
                  [v30 combineWithMessage:v12];

                  goto LABEL_38;
                }
              }
              id v27 = [v26 countByEnumeratingWithState:&v126 objects:v146 count:16];
              if (v27) {
                continue;
              }
              break;
            }
          }

          [v26 addObject:v12];
          goto LABEL_38;
        }
        double v22 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
        {
          id v23 = [v12 guid];
          *(_DWORD *)long long buf = 138412290;
          id v135 = v23;
          _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Not combining encrypted message - %@", buf, 0xCu);
        }
        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v81 = [v12 guid];
          _IDSLogV();
        }
        objc_msgSend(v98, "addObject:", v12, v81);
LABEL_38:
        int64_t v24 = [(IDSDaemon *)self _messageStoreForDataProtectionClass:v17];
        __int16 v25 = [v12 guid];
        [v24 markOutgoingMessageWithGUID:v25 asSent:1];

LABEL_39:
        BOOL v11 = (char *)v11 + 1;
      }
      while (v11 != v10);
      id v31 = [obj countByEnumeratingWithState:&v130 objects:v147 count:16];
      id v10 = v31;
      if (!v31)
      {
LABEL_69:

        if ([v98 count])
        {
          [(IDSDaemon *)self _updateNonUrgentInternetSendTimer];
          uint64_t v35 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_DEFAULT))
          {
            id v36 = [v98 count];
            *(_DWORD *)long long buf = 134218496;
            id v135 = v103;
            __int16 v136 = 2048;
            id v137 = v36;
            __int16 v138 = 2048;
            id v139 = v110;
            _os_log_impl((void *)&_mh_execute_header, v35, OS_LOG_TYPE_DEFAULT, "Reduced outgoing non-urgent internet messages from %lu to %lu (omitted %lu).", buf, 0x20u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v83 = [v98 count];
            __int16 v87 = v110;
            id v81 = v103;
            _IDSLogV();
          }
          long long v124 = 0u;
          long long v125 = 0u;
          long long v122 = 0u;
          long long v123 = 0u;
          id v92 = v98;
          uint64_t v97 = (char *)[v92 countByEnumeratingWithState:&v122 objects:v145 count:16];
          if (v97)
          {
            uint64_t v96 = *(void *)v123;
            do
            {
              long long v37 = 0;
              do
              {
                if (*(void *)v123 != v96)
                {
                  long long v38 = v37;
                  objc_enumerationMutation(v92);
                  long long v37 = v38;
                }
                id obja = v37;
                long long v39 = *(void **)(*((void *)&v122 + 1) + 8 * (void)v37);
                long long v40 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
                {
                  *(_WORD *)long long buf = 0;
                  _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "sendNonUrgentInternetMessage - finding Account", buf, 2u);
                }

                if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                  _IDSLogV();
                }
                v121[0] = _NSConcreteStackBlock;
                v121[1] = 3221225472;
                v121[2] = sub_10039A578;
                v121[3] = &unk_10097E4D0;
                v121[4] = v39;
                long long v111 = objc_retainBlock(v121);
                id v41 = +[IDSDAccountController sharedInstance];
                double v42 = [v39 accountGUID];
                long long v113 = [v41 accountWithUniqueID:v42];

                if (v113)
                {
                  __int16 v43 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)long long buf = 138412290;
                    id v135 = v113;
                    _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, "sendNonUrgentInternetMessage - got account %@", buf, 0xCu);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    id v81 = v113;
                    _IDSLogV();
                  }
                  v119[0] = _NSConcreteStackBlock;
                  v119[1] = 3221225472;
                  v119[2] = sub_10039A9AC;
                  v119[3] = &unk_10098AA98;
                  id v104 = v113;
                  id v120 = v104;
                  id v105 = objc_retainBlock(v119);
                  __int16 v44 = [v39 combinedMessages];
                  BOOL v45 = [v44 count] == 0;

                  if (v45)
                  {
                    ((void (*)(void *, void *))v105[2])(v105, v39);
                  }
                  else
                  {
                    CFMutableDictionaryRef Mutable = CFArrayCreateMutable(0, 0, &kCFTypeArrayCallBacks);
                    if (Mutable)
                    {
                      __int16 v47 = [v39 message];
                      BOOL v48 = v47 == 0;

                      if (!v48)
                      {
                        id v49 = [v39 message];
                        CFArrayAppendValue(Mutable, v49);
                      }
                    }
                    long long v117 = 0u;
                    long long v118 = 0u;
                    long long v115 = 0u;
                    long long v116 = 0u;
                    id v50 = objc_msgSend(v39, "combinedMessages", v81, v83, v87);
                    id v51 = [v50 countByEnumeratingWithState:&v115 objects:v144 count:16];
                    if (v51)
                    {
                      uint64_t v52 = *(void *)v116;
                      do
                      {
                        for (j = 0; j != v51; j = (char *)j + 1)
                        {
                          if (*(void *)v116 != v52) {
                            objc_enumerationMutation(v50);
                          }
                          if (Mutable)
                          {
                            id v54 = *(void **)(*((void *)&v115 + 1) + 8 * (void)j);
                            id v55 = [v54 message];
                            BOOL v56 = v55 == 0;

                            if (!v56)
                            {
                              id v57 = [v54 message];
                              CFArrayAppendValue(Mutable, v57);
                            }
                          }
                        }
                        id v51 = [v50 countByEnumeratingWithState:&v115 objects:v144 count:16];
                      }
                      while (v51);
                    }

                    id v58 = OSLogHandleForIDSCategory();
                    if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
                    {
                      id v59 = [v39 combinedMessages];
                      id v60 = (char *)[v59 count];
                      id v61 = [v39 destinations];
                      id v62 = [v39 fromID];
                      [v39 guid];
                      long long v63 = v60 + 1;
                      id v64 = (id)objc_claimAutoreleasedReturnValue();
                      *(_DWORD *)long long buf = 138413314;
                      id v135 = v104;
                      __int16 v136 = 2048;
                      id v137 = v63;
                      __int16 v138 = 2112;
                      id v139 = v61;
                      __int16 v140 = 2112;
                      id v141 = v62;
                      __int16 v142 = 2112;
                      id v143 = v64;
                      _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "account %@ sendNonUrgentInternetMessage: bulked: %lu to: %@ identifier: %@ guid: %@", buf, 0x34u);
                    }
                    if (os_log_shim_legacy_logging_enabled())
                    {
                      if (_IDSShouldLog())
                      {
                        id v65 = [v39 combinedMessages];
                        int64_t v66 = (char *)[v65 count];
                        unsigned int v67 = [v39 destinations];
                        CFStringRef v68 = [v39 fromID];
                        [v39 guid];
                        v90 = __int16 v89 = v68;
                        id v84 = v66 + 1;
                        id v88 = v67;
                        id v82 = v104;
                        _IDSLogV();
                      }
                    }
                    id v101 = objc_msgSend(v39, "copySendParameters", v82, v84, v88, v89, v90);
                    id v102 = [v39 fromID];
                    id v100 = [v39 destinations];
                    unsigned int v95 = [v39 useDictAsTopLevel];
                    id v99 = [v39 dataToEncrypt];
                    unsigned __int8 v94 = [v39 encryptPayload];
                    unsigned __int8 v93 = [v39 wantsResponse];
                    __int16 v69 = [v39 expirationDate];
                    id v70 = [v39 command];
                    unsigned __int8 v71 = [v39 wantsDeliveryStatus];
                    unsigned __int8 v72 = [v39 wantsCertifiedDelivery];
                    __int16 v73 = [v39 deliveryStatusContext];
                    uint64_t v74 = [v39 messageUUID];
                    [v39 priority];
                    CFStringRef v114 = v111;
                    BYTE1(v90) = v72;
                    LOBYTE(v90) = v71;
                    __int16 v87 = v69;
                    __int16 v89 = v70;
                    BYTE1(v83) = v93;
                    LOBYTE(v83) = v94;
                    id v81 = v99;
                    objc_msgSend(v104, "sendMessage:params:bulkedPayload:fromID:toDestinations:useDictAsTopLevel:dataToEncrypt:encryptPayload:wantsResponse:expirationDate:command:wantsDeliveryStatus:wantsCertifiedDelivery:deliveryStatusContext:messageUUID:priority:localDelivery:disallowRefresh:willSendBlock:completionBlock:", 0, v101, Mutable, v102, v100, v95);
                  }
                }
                else
                {
                  __int16 v75 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v75, OS_LOG_TYPE_ERROR))
                  {
                    id v76 = [v39 accountGUID];
                    __int16 v77 = [v39 guid];
                    *(_DWORD *)long long buf = 138412546;
                    id v135 = v76;
                    __int16 v136 = 2112;
                    id v137 = v77;
                    _os_log_impl((void *)&_mh_execute_header, v75, OS_LOG_TYPE_ERROR, "No account found for ID: %@ - can't send %@", buf, 0x16u);
                  }
                  if (os_log_shim_legacy_logging_enabled())
                  {
                    id v78 = [v39 accountGUID];
                    CFStringRef v85 = [v39 guid];
                    _IDSWarnV();

                    id v79 = objc_msgSend(v39, "accountGUID", v78, v85);
                    id v86 = [v39 guid];
                    _IDSLogV();

                    id v80 = objc_msgSend(v39, "accountGUID", v79, v86);
                    [v39 guid];
                    id v81 = v80;
                    id v83 = (id)objc_claimAutoreleasedReturnValue();
                    _IDSLogTransport();
                  }
                  ((void (*)(void))v111[2])();
                }

                long long v37 = obja + 1;
              }
              while (obja + 1 != v97);
              uint64_t v97 = (char *)[v92 countByEnumeratingWithState:&v122 objects:v145 count:16];
            }
            while (v97);
          }
        }
        break;
      }
    }
  }
}

- (void)_enqueueBlock:(id)a3 identifier:(id)a4 withTimeout:(double)a5 forKey:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a6;
  incomingMessageMultiQueue = self->_incomingMessageMultiQueue;
  if (!incomingMessageMultiQueue)
  {
    id v14 = objc_alloc((Class)IMMultiQueue);
    id v15 = im_primary_queue();
    id v16 = (IMMultiQueue *)[v14 initWithQueue:v15];
    id v17 = self->_incomingMessageMultiQueue;
    self->_incomingMessageMultiQueue = v16;

    incomingMessageMultiQueue = self->_incomingMessageMultiQueue;
  }
  unsigned int v18 = [(IMMultiQueue *)incomingMessageMultiQueue addBlock:v10 withTimeout:v12 forKey:v11 description:a5];
  __int16 v19 = +[IMIDSLog daemon];
  BOOL v20 = os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT);
  if (v18)
  {
    if (v20)
    {
      double v21 = [(IMMultiQueue *)self->_incomingMessageMultiQueue loggableOverviewForKey:v12];
      int v22 = 138412802;
      id v23 = v12;
      __int16 v24 = 2112;
      id v25 = v11;
      __int16 v26 = 2112;
      id v27 = v21;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Enqueueing block in multiqueue {key: %@, identifier: %@, queueState: %@}", (uint8_t *)&v22, 0x20u);
    }
  }
  else if (v20)
  {
    int v22 = 138412546;
    id v23 = v12;
    __int16 v24 = 2112;
    id v25 = v11;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Enqueueing block in multiqueue {key: %@, identifier: %@}", (uint8_t *)&v22, 0x16u);
  }
}

- (BOOL)_shouldDropMessageForIncomingErrorMessageWithDecryptionErrorType:(int64_t)a3
{
  return a3 == 202;
}

- (BOOL)_shouldDropMessageForIncomingDecryptionErrorType:(int64_t)a3
{
  return a3 == 601 || (a3 & 0xFFFFFFFFFFFFFFFDLL) == 200;
}

- (BOOL)_shouldForgetCachedPeerTokensForIncomingRemoteDecryptionErrorType:(int64_t)a3
{
  BOOL result = 1;
  if (a3 > 801)
  {
    if ((unint64_t)(a3 - 900) >= 4 && a3 != 804 && a3 != 802) {
      return result;
    }
    return 0;
  }
  if (a3 > 499)
  {
    if ((unint64_t)(a3 - 500) >= 2) {
      return result;
    }
    return 0;
  }
  if (!a3 || a3 == 202 || a3 == 400) {
    return 0;
  }
  return result;
}

- (BOOL)_shouldForgetCachedPeerTokensForDecryptionErrorType:(int64_t)a3 withOriginalDecryptionError:(id)a4
{
  id v5 = a4;
  uint64_t v6 = [v5 userInfo];
  unsigned __int8 v7 = [v6 objectForKeyedSubscript:NSUnderlyingErrorKey];

  uint64_t v8 = [v5 domain];
  if (![v8 isEqualToString:IDSDecryptionErrorDomain]
    || [v5 code] != (id)15)
  {
    goto LABEL_7;
  }
  double v9 = [v7 domain];
  if (([v9 isEqualToString:@"com.apple.messageprotection"] & 1) == 0)
  {

LABEL_7:
    goto LABEL_8;
  }
  id v10 = [v7 code];

  if (v10 == (id)802)
  {
LABEL_14:
    BOOL v11 = 0;
    goto LABEL_15;
  }
LABEL_8:
  BOOL v11 = 1;
  if (a3 > 600)
  {
    if ((unint64_t)(a3 - 900) < 4 || a3 == 601) {
      goto LABEL_14;
    }
  }
  else if (!a3 || a3 == 202 || a3 == 501)
  {
    goto LABEL_14;
  }
LABEL_15:

  return v11;
}

- (BOOL)_shouldReplyWithRemoteDecryptionErrorMessageForDecryptionErrorType:(int64_t)a3
{
  BOOL result = 1;
  if (a3 <= 600)
  {
    if (a3 && a3 != 202 && a3 != 501) {
      return result;
    }
    return 0;
  }
  if ((unint64_t)(a3 - 900) < 4 || a3 == 601) {
    return 0;
  }
  return result;
}

- (BOOL)_shouldReplyWithCertifiedDeliveryReceiptForDecryptionErrorType:(int64_t)a3
{
  return (unint64_t)(a3 - 900) >= 4 && a3 != 601 && a3;
}

- (BOOL)_shouldRetryForDecryptionErrorType:(int64_t)a3
{
  BOOL result = 1;
  if (a3 > 899)
  {
    if ((unint64_t)(a3 - 900) > 3) {
      return result;
    }
    return 0;
  }
  if (!a3 || a3 == 202 || a3 == 501) {
    return 0;
  }
  return result;
}

- (id)_failureReasonMessageFromSecondaryError:(id)a3 ECError:(id)a4 andLegacyError:(id)a5
{
  id v7 = a5;
  id v8 = a4;
  double v9 = +[IDSMessageMetricReporter errorToReportForNGMError:a3];
  id v10 = +[IDSMessageMetricReporter errorToReportForNGMError:v8];

  BOOL v11 = +[IDSMessageMetricReporter errorToReportForLegacyError:v7];

  if (v9) {
    BOOL v12 = v10 == 0;
  }
  else {
    BOOL v12 = 1;
  }
  int v13 = !v12;
  if (v13 == 1 && v11 != 0)
  {
    id v16 = [v9 domain];
    id v17 = [v9 code];
    unsigned int v18 = [v10 domain];
    id v19 = [v10 code];
    BOOL v20 = [v11 domain];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"secondary-%@-%ld ec-%@-%ld legacy-%@-%ld", v16, v17, v18, v19, v20, [v11 code]);
    double v21 = (__CFString *)objc_claimAutoreleasedReturnValue();

LABEL_21:
LABEL_22:

    goto LABEL_23;
  }
  if (v13)
  {
    id v16 = [v9 domain];
    id v15 = [v9 code];
    unsigned int v18 = [v10 domain];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"secondary-%@-%ld ec-%@-%ld", v16, v15, v18, [v10 code]);
LABEL_20:
    double v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_21;
  }
  if (v10 && v11)
  {
    id v16 = [v10 domain];
    id v22 = [v10 code];
    unsigned int v18 = [v11 domain];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"ec-%@-%ld legacy-%@-%ld", v16, v22, v18, [v11 code]);
    goto LABEL_20;
  }
  if (v9 && v11)
  {
    id v16 = [v9 domain];
    id v23 = [v9 code];
    unsigned int v18 = [v11 domain];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"secondary-%@-%ld legacy-%@-%ld", v16, v23, v18, [v11 code]);
    goto LABEL_20;
  }
  if (v9)
  {
    id v16 = [v9 domain];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"secondary-%@-%ld", v16, [v9 code]);
LABEL_32:
    double v21 = (__CFString *)objc_claimAutoreleasedReturnValue();
    goto LABEL_22;
  }
  if (v10)
  {
    id v16 = [v10 domain];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"ec-%@-%ld", v16, [v10 code]);
    goto LABEL_32;
  }
  if (v11)
  {
    id v16 = [v11 domain];
    +[NSString stringWithFormat:](NSString, "stringWithFormat:", @"legacy-%@-%ld", v16, [v11 code]);
    goto LABEL_32;
  }
  double v21 = &stru_10099BE78;
LABEL_23:

  return v21;
}

- (void)_optionallyDecryptNiceMessage:(id)a3 encryptedData:(id)a4 forGroupID:(id)a5 forTopic:(id)a6 fromURI:(id)a7 certifiedDeliveryContext:(id)a8 completionBlock:(id)a9
{
  LOBYTE(v9) = 0;
  [(IDSDaemon *)self _optionallyDecryptNiceMessage:a3 encryptedData:a4 forGroupID:a5 forTopic:a6 fromURI:a7 certifiedDeliveryContext:a8 isLiveRetry:v9 completionBlock:a9];
}

- (double)_decryptionRetryIntervalForError:(id)a3
{
  id v3 = a3;
  unsigned __int8 v4 = [v3 domain];
  if ([v4 isEqualToString:IDSDecryptionErrorDomain])
  {
    id v5 = [v3 code];

    double v6 = 2.0;
    if (v5 == (id)2) {
      goto LABEL_6;
    }
  }
  else
  {
  }
  double v6 = 0.0;
LABEL_6:

  return v6;
}

+ (BOOL)_topicAllowsNoEncryption:(id)a3 fromURI:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = objc_msgSend(objc_alloc((Class)NSSet), "initWithObjects:", @"mailto:support@apple.com", @"mailto:info@apple.com", @"mailto:alert@apple.com", 0);
  id v8 = [v6 prefixedURI];
  if (IMStringIsEmail())
  {
    uint64_t v9 = [v6 prefixedURI];
    if ([v9 hasSuffix:@".apple.com"])
    {
      unsigned __int8 v10 = 1;
    }
    else
    {
      BOOL v11 = [v6 prefixedURI];
      unsigned __int8 v10 = [v7 containsObject:v11];
    }
  }
  else
  {
    unsigned __int8 v10 = 0;
  }

  if ([v5 isEqualToString:@"com.apple.madrid"] && (v10 & 1) != 0
    || ([v5 isEqualToString:@"com.apple.private.alloy.bulletinboard"] & 1) != 0
    || ([v5 isEqualToString:@"com.apple.private.alloy.keychainsync"] & 1) != 0)
  {
    unsigned __int8 v12 = 1;
  }
  else
  {
    unsigned __int8 v12 = [v5 isEqualToString:@"com.apple.private.alloy.willow"];
  }

  return v12;
}

- (void)_submitLastResortCacheMetricForGUID:(id)a3 service:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v7 = [objc_alloc((Class)IDSMissingMessageMetric) initWithReason:706 guid:v6 service:v5 additionalInformation:0];

  +[IDSMissingMessageMetricReporter sendMetric:v7];
}

- (void)_sendNiceMessageCheckpointIfNecessary:(id)a3 checkpoint:(int64_t)a4 service:(id)a5 additionalInformation:(id)a6
{
  id v10 = a3;
  id v11 = a5;
  id v12 = a6;
  int v13 = [v10 pushUUID];
  id v14 = [v10 wantsCheckpointing];
  unsigned int v15 = [v14 BOOLValue];

  id v16 = [(IDSDaemon *)self serverBagForBagType:1];
  id v17 = [v16 objectForKey:@"disable-message-checkpointing"];
  unsigned int v18 = [v17 BOOLValue];

  id v19 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v20 = @"NO";
    *(_DWORD *)long long buf = 134218754;
    int64_t v24 = a4;
    if (v15) {
      CFStringRef v21 = @"YES";
    }
    else {
      CFStringRef v21 = @"NO";
    }
    if (v18) {
      CFStringRef v20 = @"YES";
    }
    __int16 v25 = 2112;
    __int16 v26 = v13;
    __int16 v27 = 2112;
    CFStringRef v28 = v21;
    __int16 v29 = 2112;
    CFStringRef v30 = v20;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "At checkpoint %ld for guid %@. Wants checkpointing %@ disabled by bag key %@", buf, 0x2Au);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (((v15 ^ 1 | v18) & 1) == 0)
  {
    id v22 = [objc_alloc((Class)IDSMissingMessageMetric) initWithReason:a4 guid:v13 service:v11 additionalInformation:v12];
    +[IDSMissingMessageMetricReporter sendMetric:v22];
  }
}

- (void)_callReplayCommitBlockForIncomingMessages:(id)a3
{
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id obj = a3;
  id v4 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (v4)
  {
    id v5 = v4;
    uint64_t v6 = *(void *)v20;
    do
    {
      for (i = 0; i != v5; i = (char *)i + 1)
      {
        if (*(void *)v20 != v6) {
          objc_enumerationMutation(obj);
        }
        id v8 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        uint64_t v9 = [v8 message];
        id v10 = objc_alloc((Class)IDSIncomingNiceMessage);
        id v11 = [v8 topic];
        id v12 = [v10 initWithMessageDictionary:v9 topic:v11];

        int v13 = [(IDSDaemon *)self _replayKeyForNiceMessage:v12 encryptedData:0];
        id v14 = +[IDSEncryptionController sharedInstance];
        v17[0] = _NSConcreteStackBlock;
        v17[1] = 3221225472;
        v17[2] = sub_10039BFE8;
        v17[3] = &unk_10097E440;
        v17[4] = self;
        id v15 = v13;
        id v18 = v15;
        [v14 performAsyncBlock:v17 priority:300];

        if (v15) {
          [(NSMutableDictionary *)self->_replayKeyToMessageUUIDMap removeObjectForKey:v15];
        }
      }
      id v5 = [obj countByEnumeratingWithState:&v19 objects:v23 count:16];
    }
    while (v5);
  }
}

- (id)_replayKeyForNiceMessage:(id)a3 encryptedData:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v5 pushUUID];
  if (v6 || ([v5 encryptedPayload], (id v6 = (id)objc_claimAutoreleasedReturnValue()) != 0))
  {
    id v8 = [v5 groupIDData];
    if (v8)
    {
      id v9 = [objc_alloc((Class)ENGroupID) initWithDataRepresentation:v8];

      BOOL v10 = v9 != 0;
    }
    else
    {
      BOOL v10 = 0;
    }
    id v11 = [v5 encryptionTypeStr];
    int v12 = IDSEncryptionTypeFromEncryptionTypeString() != 4 || v10;
    if (v12 == 1)
    {
      int v13 = +[IDSRegistrationKeyManager sharedInstance];
      id v14 = [v13 fullDeviceIdentityContainer];
      id v15 = [v14 legacyFullIdentity];
    }
    else
    {
      id v15 = 0;
    }
    id v16 = objc_alloc((Class)IDSCertifiedDeliveryReplayKey);
    id v17 = [v6 _FTOptionallyDecompressData];
    id v18 = [v16 initWithPayload:v17 legacyIdentity:v15];
  }
  else
  {
    long long v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412290;
      long long v22 = v7;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "No payload data present in message %@ unable create a replay key.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v18 = 0;
  }

  return v18;
}

- (void)_optionallyDecryptNiceMessage:(id)a3 encryptedData:(id)a4 forGroupID:(id)a5 forTopic:(id)a6 fromURI:(id)a7 certifiedDeliveryContext:(id)a8 isLiveRetry:(BOOL)a9 completionBlock:(id)a10
{
  id v16 = (__CFString *)a3;
  id v17 = a4;
  id v18 = a5;
  long long v19 = (__CFString *)a6;
  id v78 = a7;
  id v20 = a8;
  id v21 = a10;
  long long v22 = (void (**)(void, void, void, void))v21;
  if (v16 && v21)
  {
    id v23 = [v17 _FTOptionallyDecompressData];
    if (!v23)
    {
      int64_t v24 = [(__CFString *)v16 encryptedPayload];
      id v23 = [v24 _FTOptionallyDecompressData];
    }
    if (CUTIsInternalInstall())
    {
      uint64_t v74 = [(__CFString *)v16 payloadMetadataData];
    }
    else
    {
      uint64_t v74 = 0;
    }
    value = [(__CFString *)v16 encryptionTypeStr];
    uint64_t v25 = IDSEncryptionTypeFromEncryptionTypeString();
    uint64_t v26 = 3;
    if (!v18) {
      uint64_t v26 = v25;
    }
    uint64_t v73 = v26;
    id v76 = [(__CFString *)v16 toURI];
    __int16 v75 = [(__CFString *)v16 senderPushToken];
    __int16 v77 = [(__CFString *)v16 command];
    if ([(__CFString *)v19 isEqualToString:IDSServiceNameiMessageLite])
    {
      BOOL v27 = [v77 integerValue] == (id)100;
      if (!v23) {
        goto LABEL_19;
      }
    }
    else
    {
      BOOL v27 = 0;
      if (!v23) {
        goto LABEL_19;
      }
    }
    if (v73 == 2)
    {
      if ((([(id)objc_opt_class() _topicAllowsNoEncryption:v19 fromURI:v78] | v27) & 1) == 0)
      {
        id v28 = +[NSError errorWithDomain:IDSGenericErrorDomain code:202 userInfo:0];
        __int16 v29 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        CFStringRef v30 = [(__CFString *)v16 rawMessage];
        if (v30)
        {
          CFDictionarySetValue(v29, IDSIncomingMessagePushPayloadKey, v30);
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10071FD6C();
        }

        if (value) {
          CFDictionarySetValue(v29, IDSIncomingMessageOriginalEncryptionTypeKey, value);
        }
        ((void (**)(void, __CFDictionary *, id, id))v22)[2](v22, v29, v28, v20);

        goto LABEL_28;
      }
    }
    else if (!v27)
    {
      if (v76 && v75)
      {
        uint64_t v32 = [(IDSDaemon *)self serviceController];
        id v28 = [v32 serviceWithPushTopic:v19];

        if (v28)
        {
          unsigned __int8 v72 = [(IDSDaemon *)self _validAccountForIncomingMessageSentToURI:v76 service:v28 outPseudonym:0];
          if (v72)
          {
            id v33 = [v78 prefixedURI];
            if ([v33 _appearsToBePseudonymID]) {
              [v78 prefixedURI];
            }
            else {
            int64_t v66 = [v75 rawToken];
            }

            id v70 = +[IDSEncryptionController sharedInstance];
            long long v39 = [v70 failedTokenCache];
            unsigned int v67 = [v39 underLimitForItem:v66];

            unsigned __int8 v71 = [v28 queryService];
            long long v40 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              CFStringRef v41 = @"NO";
              *(_DWORD *)long long buf = 138413058;
              if (v67) {
                CFStringRef v41 = @"YES";
              }
              CFStringRef v102 = v41;
              __int16 v103 = 2112;
              id v104 = v75;
              __int16 v105 = 2112;
              id v106 = v71;
              __int16 v107 = 2112;
              id v108 = v78;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Noting peer token {shouldNoteToken: %@, token: %@, service: %@, fromIdentifier: %@}", buf, 0x2Au);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              CFStringRef v42 = @"NO";
              if (v67) {
                CFStringRef v42 = @"YES";
              }
              BOOL v56 = v71;
              id v57 = v78;
              CFStringRef v51 = v42;
              id v53 = v75;
              _IDSLogV();
            }
            if (v67)
            {
              __int16 v43 = +[IDSPeerIDManager sharedInstance];
              [v43 notePeerToken:v75 forURI:v78 fromURI:v76 service:v71];

              __int16 v44 = +[IDSIDStatusQueryController sharedInstance];
              [v44 noteIncomingID:v78 fromService:v71];
            }
            CFStringRef v68 = [(__CFString *)v16 pushUUID];
            BOOL v45 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412546;
              CFStringRef v102 = v68;
              __int16 v103 = 2112;
              id v104 = value;
              _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Decrypting message %@ of encryption type \"%@\"", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              uint64_t v52 = v68;
              id v54 = value;
              _IDSLogV();
            }
            if (_os_feature_enabled_impl() && IDSCommandIsGroupSessionCommand())
            {
              [v77 integerValue];
              kdebug_trace();
            }
            -[IDSDaemon _sendNiceMessageCheckpointIfNecessary:checkpoint:service:additionalInformation:](self, "_sendNiceMessageCheckpointIfNecessary:checkpoint:service:additionalInformation:", v16, 9200, v19, 0, v52, v54);
            __int16 v46 = +[IMLockdownManager sharedInstance];
            unsigned int v64 = [v46 isInternalInstall];

            if (v64)
            {
              if (IMGetAppBoolForKey()) {
                +[IDSNGMSwizzler installMethods];
              }
              else {
                +[IDSNGMSwizzler uninstallMethods];
              }
            }
            uint64_t v47 = [(IDSDaemon *)self _replayKeyForNiceMessage:v16 encryptedData:v23];
            BOOL v48 = (void *)v47;
            if (v47)
            {
              [(NSMutableDictionary *)self->_replayKeyToMessageUUIDMap setObject:v68 forKey:v47];
              BOOL v48 = (void *)v47;
            }
            long long v63 = v48;
            v80[0] = _NSConcreteStackBlock;
            v80[1] = 3221225472;
            v80[2] = sub_10039D18C;
            v80[3] = &unk_10098AB38;
            id v81 = v77;
            id v82 = v74;
            id v62 = v78;
            id v83 = v62;
            id v61 = v75;
            id v84 = v61;
            CFStringRef v85 = self;
            id v65 = v68;
            id v86 = v65;
            __int16 v87 = v19;
            id v60 = v76;
            id v88 = v60;
            id v89 = v28;
            BOOL v100 = a9;
            __int16 v90 = v16;
            id v91 = v17;
            id v59 = v18;
            id v92 = v59;
            id v93 = v20;
            id v98 = v22;
            uint64_t v99 = v73;
            id v94 = value;
            id v58 = v23;
            id v95 = v58;
            id v49 = v72;
            id v96 = v49;
            id v69 = v63;
            id v97 = v69;
            id v50 = objc_retainBlock(v80);
            LOBYTE(v55) = a9;
            [v49 decryptMessageData:v58 guid:v65 localURI:v60 remoteURI:v62 pushToken:v61 groupID:v59 encryptionType:v73 isLiveRetry:v55 replayKey:v69 completionBlock:v50];
          }
          else
          {
            long long v38 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138412546;
              CFStringRef v102 = v19;
              __int16 v103 = 2112;
              id v104 = v76;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "No account found for topic: %@   toURI: %@", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              _IDSWarnV();
              _IDSLogV();
              _IDSLogTransport();
            }
            ((void (**)(void, void, void, id))v22)[2](v22, 0, 0, v20);
          }
        }
        else
        {
          long long v37 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v37, OS_LOG_TYPE_ERROR))
          {
            *(_DWORD *)long long buf = 138412290;
            CFStringRef v102 = v19;
            _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_ERROR, "Incoming message for topic: %@  but no service found", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled())
          {
            _IDSWarnV();
            _IDSLogV();
            _IDSLogTransport();
          }
        }
      }
      else
      {
        id v34 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v34, OS_LOG_TYPE_ERROR))
        {
          *(_DWORD *)long long buf = 138412802;
          CFStringRef v102 = v16;
          __int16 v103 = 2112;
          id v104 = v76;
          __int16 v105 = 2112;
          id v106 = v75;
          _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_ERROR, "Incoming message %@ missing routing information -- failing {toURI: %@, senderPushToken: %@}", buf, 0x20u);
        }

        if (os_log_shim_legacy_logging_enabled())
        {
          _IDSWarnV();
          _IDSLogV();
          id v53 = v76;
          BOOL v56 = v75;
          CFStringRef v51 = v16;
          _IDSLogTransport();
        }
        +[NSError errorWithDomain:code:userInfo:](NSError, "errorWithDomain:code:userInfo:", IDSGenericErrorDomain, 202, 0, v51, v53, v56);
        id v28 = (id)objc_claimAutoreleasedReturnValue();
        uint64_t v35 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
        id v36 = [(__CFString *)v16 rawMessage];
        if (v36)
        {
          CFDictionarySetValue(v35, IDSIncomingMessagePushPayloadKey, v36);
        }
        else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
        {
          sub_10071FD6C();
        }

        if (value) {
          CFDictionarySetValue(v35, IDSIncomingMessageOriginalEncryptionTypeKey, value);
        }
        ((void (**)(void, __CFDictionary *, id, id))v22)[2](v22, v35, v28, v20);
      }
      goto LABEL_28;
    }
LABEL_19:
    id v28 = objc_alloc_init((Class)NSMutableDictionary);
    id v31 = [(__CFString *)v16 rawMessage];
    if (v31)
    {
      CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSIncomingMessagePushPayloadKey, v31);
    }
    else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
    {
      sub_10071FD6C();
    }

    if (value) {
      CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSIncomingMessageOriginalEncryptionTypeKey, value);
    }
    if (v23) {
      CFDictionarySetValue((CFMutableDictionaryRef)v28, IDSIncomingMessageDecryptedDataKey, v23);
    }
    ((void (**)(void, id, void, id))v22)[2](v22, v28, 0, v20);
LABEL_28:
  }
}

- (void)_handleIncomingNiceAttachmentMessage:(id)a3 forTopic:(id)a4 fromURI:(id)a5 certifiedDeliveryContext:(id)a6 completionBlock:(id)a7
{
  id v11 = a3;
  id v51 = a4;
  id v12 = a5;
  id v50 = a6;
  id v13 = a7;
  uint64_t v52 = v11;
  if (v11 && v13)
  {
    id v47 = v13;
    id v14 = [v11 toURI];
    id v15 = [v11 senderPushToken];
    __int16 v46 = [v11 pushUUID];
    id v16 = [(IDSDaemon *)self serviceController];
    BOOL v48 = [v16 serviceWithPushTopic:v51];

    id v17 = v48;
    if (!v48)
    {
      _IMWarn();
LABEL_44:

      id v13 = v47;
      goto LABEL_45;
    }
    __int16 v44 = [(IDSDaemon *)self _validAccountForIncomingMessageSentToURI:v14 service:v48 outPseudonym:0];
    if (!v44)
    {
      _IMWarn();
      (*((void (**)(id, void, void, id))v47 + 2))(v47, 0, 0, v50);
LABEL_43:

      id v17 = v48;
      goto LABEL_44;
    }
    id v18 = [v52 encryptedPayload];
    BOOL v45 = [v18 _FTOptionallyDecompressData];

    value = [v52 encryptionTypeStr];
    uint64_t v40 = IDSEncryptionTypeFromEncryptionTypeString();
    CFStringRef v42 = [(IDSDaemon *)self _replayKeyForNiceMessage:v52 encryptedData:v45];
    if (v42)
    {
      replayKeyToMessageUUIDMap = self->_replayKeyToMessageUUIDMap;
      id v20 = [v52 pushUUID];
      [(NSMutableDictionary *)replayKeyToMessageUUIDMap setObject:v20 forKey:v42];
    }
    CFStringRef v41 = [v52 payloadMetadataData];
    if (!v45) {
      goto LABEL_10;
    }
    if (v40 != 2)
    {
      [v48 allInterestedQueryServices];
      long long v71 = 0u;
      long long v72 = 0u;
      long long v69 = 0u;
      long long v70 = 0u;
      CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)(id)objc_claimAutoreleasedReturnValue();
      id v22 = [(__CFDictionary *)theDict countByEnumeratingWithState:&v69 objects:v81 count:16];
      if (v22)
      {
        uint64_t v23 = *(void *)v70;
        do
        {
          for (i = 0; i != v22; i = (char *)i + 1)
          {
            if (*(void *)v70 != v23) {
              objc_enumerationMutation(theDict);
            }
            uint64_t v25 = *(void *)(*((void *)&v69 + 1) + 8 * i);
            uint64_t v26 = +[IDSPeerIDManager sharedInstance];
            [v26 notePeerToken:v15 forURI:v12 fromURI:v14 service:v25];

            BOOL v27 = +[IDSIDStatusQueryController sharedInstance];
            [v27 noteIncomingID:v12 fromService:v25];
          }
          id v22 = [(__CFDictionary *)theDict countByEnumeratingWithState:&v69 objects:v81 count:16];
        }
        while (v22);
      }

      unsigned int v28 = [v12 isEqualToURI:v14];
      __int16 v29 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v30 = @"NO";
        *(_DWORD *)long long buf = 134218754;
        uint64_t v74 = v45;
        if (v28) {
          CFStringRef v30 = @"YES";
        }
        __int16 v75 = 2112;
        id v76 = v46;
        __int16 v77 = 2112;
        id v78 = v12;
        __int16 v79 = 2112;
        CFStringRef v80 = v30;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Incoming message attachment data: %p ID: %@  from: %@ fromMe: %@", buf, 0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        long long v39 = v46;
        _IDSLogEventV();
      }
      v54[0] = _NSConcreteStackBlock;
      v54[1] = 3221225472;
      v54[2] = sub_10039EF18;
      v54[3] = &unk_10098ABD0;
      id v55 = v52;
      id v56 = v41;
      id v31 = v12;
      id v57 = v31;
      id v32 = v15;
      id v58 = v32;
      id v59 = self;
      id v33 = v14;
      id v60 = v33;
      id v61 = v48;
      id v34 = v46;
      id v62 = v34;
      id v67 = v47;
      id v63 = value;
      id v64 = v50;
      uint64_t v68 = v40;
      id v65 = v51;
      id v35 = v44;
      id v66 = v35;
      id v36 = objc_retainBlock(v54);
      LOBYTE(v39) = 0;
      [v35 decryptMessageData:v45 guid:v34 localURI:v33 remoteURI:v31 pushToken:v32 groupID:0 encryptionType:v40 isLiveRetry:v39 replayKey:v42 completionBlock:v36];

      goto LABEL_42;
    }
    if (![(id)objc_opt_class() _topicAllowsNoEncryption:v51 fromURI:v12])
    {
      CFMutableDictionaryRef theDict = +[NSError errorWithDomain:IDSGenericErrorDomain code:202 userInfo:0];
      long long v37 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
      long long v38 = [v52 rawMessage];
      if (v38)
      {
        CFDictionarySetValue(v37, IDSIncomingMessagePushPayloadKey, v38);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10071FD6C();
      }

      if (value) {
        CFDictionarySetValue(v37, IDSIncomingMessageOriginalEncryptionTypeKey, value);
      }
      (*((void (**)(id, __CFDictionary *, CFMutableDictionaryRef, id))v47 + 2))(v47, v37, theDict, v50);
    }
    else
    {
LABEL_10:
      CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)objc_alloc_init((Class)NSMutableDictionary);
      id v21 = [v52 rawMessage];
      if (v21)
      {
        CFDictionarySetValue(theDict, IDSIncomingMessagePushPayloadKey, v21);
      }
      else if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR))
      {
        sub_10071FD6C();
      }

      if (value) {
        CFDictionarySetValue(theDict, IDSIncomingMessageOriginalEncryptionTypeKey, value);
      }
      if (v45) {
        CFDictionarySetValue(theDict, IDSIncomingMessageDecryptedDataKey, v45);
      }
      (*((void (**)(id, CFMutableDictionaryRef, void, id))v47 + 2))(v47, theDict, 0, v50);
    }
LABEL_42:

    goto LABEL_43;
  }
LABEL_45:
}

- (void)getLocalIncomingPowerAssertion:(id)a3 queue:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  pthread_mutex_lock(&self->_incomingLocalPowerAssertionLock);
  if (!self->_incomingLocalPowerAssertion)
  {
    id v8 = objc_alloc((Class)IMPowerAssertion);
    id v9 = [v6 identifier];
    BOOL v10 = +[NSString stringWithFormat:@"IDS-receive-%@", v9];
    id v11 = (IMPowerAssertion *)[v8 initWithIdentifier:v10 timeout:120.0];
    incomingLocalPowerAssertion = self->_incomingLocalPowerAssertion;
    self->_incomingLocalPowerAssertion = v11;
  }
  ++self->_incomingLocalPowerAssertionClients;
  pthread_mutex_unlock(&self->_incomingLocalPowerAssertionLock);
  if (_os_feature_enabled_impl()) {
    int64_t v13 = 500000000;
  }
  else {
    int64_t v13 = 2000000000;
  }
  dispatch_time_t v14 = dispatch_time(0, v13);
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003A0DB0;
  block[3] = &unk_10097E4D0;
  void block[4] = self;
  dispatch_after(v14, v7, block);
}

- (void)_IDSPowerLogDictionary:(id)a3 info:(id)a4
{
}

- (void)_processIncomingLocalMessage:(id)a3 topic:(id)a4 command:(id)a5 deviceID:(id)a6 btUUID:(id)a7 context:(id)a8 storedGUID:(id)a9 priority:(id)a10 connectionType:(int64_t)a11 didWakeHint:(BOOL)a12
{
  id v179 = a3;
  v184 = (char *)a4;
  id v181 = a5;
  id v178 = a6;
  id v173 = a7;
  id v17 = (__CFDictionary *)a8;
  CFStringRef v180 = (char *)a9;
  id v177 = a10;
  im_assert_primary_base_queue();
  key = (void *)IDSMessageContextOutgoingResponseIdentifierKey;
  -[__CFDictionary objectForKey:](v17, "objectForKey:");
  CFStringRef v182 = (char *)objc_claimAutoreleasedReturnValue();
  v174 = [(__CFDictionary *)v17 objectForKey:IDSMessageContextSequenceNumberKey];
  id v18 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412802;
    id v274 = v182;
    __int16 v275 = 2112;
    CFStringRef v276 = v184;
    __int16 v277 = 1024;
    LODWORD(v278) = a12;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "INCOMING-LOCAL_DELIVERY:%@ SERVICE:%@ didWakeHint:%d", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v141 = v184;
    BOOL v146 = a12;
    __int16 v138 = v182;
    _IDSLogV();
  }
  long long v19 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
  {
    *(_DWORD *)long long buf = 138413314;
    id v274 = v180;
    __int16 v275 = 2112;
    CFStringRef v276 = v182;
    __int16 v277 = 2112;
    qos_class_t v278 = v184;
    __int16 v279 = 2112;
    id v280 = v181;
    __int16 v281 = 1024;
    BOOL v282 = a12;
    _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_INFO, "Broadcast: Processing incoming local message storage guid %@ real message guid %@ topic %@ command %@ didWakeHint %d", buf, 0x30u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    id v149 = v181;
    BOOL v151 = a12;
    id v141 = v182;
    BOOL v146 = (BOOL)v184;
    __int16 v138 = v180;
    _IDSLogTransport();
  }
  id v20 = [(IDSDaemon *)self serviceController];
  v183 = [v20 serviceWithPushTopic:v184];

  if (v183)
  {
    id v21 = [v183 serviceName];
    unsigned int v22 = [v21 isEqualToString:@"com.apple.private.alloy.connectivity.monitor"];

    if (v22)
    {
      -[IDSDaemon _ackMessageWithSequenceNumber:forDeviceID:priority:dataProtectionClass:connectionType:guid:](self, "_ackMessageWithSequenceNumber:forDeviceID:priority:dataProtectionClass:connectionType:guid:", [v174 unsignedIntValue], v178, objc_msgSend(v177, "integerValue"), objc_msgSend(v183, "dataProtectionClass"), a11, v182);
      goto LABEL_94;
    }
    int64_t v24 = +[IDSTrafficMonitor sharedInstance];
    uint64_t v25 = [v183 identifier];
    [v24 noteIncomingLocalMessageForService:v25];

    if (a12)
    {
      v271[0] = @"IDSDeviceDidWakeHintTopic";
      v271[1] = @"IDSDeviceDidWakeHintGUID";
      CFStringRef v26 = (const __CFString *)v182;
      if (!v182) {
        CFStringRef v26 = &stru_10099BE78;
      }
      v272[0] = v184;
      v272[1] = v26;
      BOOL v27 = +[NSDictionary dictionaryWithObjects:v272 forKeys:v271 count:2];
      [(IDSDaemon *)self _IDSPowerLogDictionary:@"IDS Local Message Received" info:v27];
    }
    unsigned int v28 = +[IDSDAccountController sharedInstance];
    id v171 = [v28 appleIDAccountOnService:v183];

    if ([v171 isRegistered])
    {
      __int16 v29 = [v171 prefixedURIStringsFromRegistration];
      CFStringRef v30 = [v29 firstObject];
    }
    else
    {
      CFStringRef v30 = 0;
    }
    id v31 = [v183 queryService];
    id v162 = +[IDSURI URIWithPrefixedURI:v30 withServiceLoggingHint:v31];

    id v172 = [v171 fromIDForCBUUID:v173 deviceID:v178];
    if (!v172)
    {
      id v32 = +[IDSPairingManager sharedInstance];
      id v33 = [v32 pairedDeviceUniqueID];
      id v172 = (void *)_IDSCopyIDForDeviceUniqueID();
    }
    id v34 = [v183 queryService];
    v170 = +[IDSURI URIWithPrefixedURI:v172 withServiceLoggingHint:v34];

    v169 = -[IDSIncomingMessageBroadcast initWithBroadcastBlock:needsClientAck:messageUUID:priority:senderID:sequenceNumber:]([IDSIncomingMessageBroadcast alloc], "initWithBroadcastBlock:needsClientAck:messageUUID:priority:senderID:sequenceNumber:", 0, 0, v182, (int)[v177 intValue], v178, objc_msgSend(v174, "unsignedIntValue"));
    if ([v170 isTokenURI])
    {
      id v35 = +[IDSPeerIDManager sharedInstance];
      id v36 = [v170 tokenFreeURI];
      long long v37 = [v170 pushToken];
      long long v38 = [v183 queryService];
      long long v39 = [v35 senderCorrelationIdentifierForURI:v36 pushToken:v37 fromURI:v162 service:v38];

      uint64_t v40 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
      {
        CFStringRef v41 = [v170 tokenFreeURI];
        CFStringRef v42 = [v170 pushToken];
        *(_DWORD *)long long buf = 138413058;
        id v274 = v182;
        __int16 v275 = 2112;
        CFStringRef v276 = v39;
        __int16 v277 = 2112;
        qos_class_t v278 = v41;
        __int16 v279 = 2112;
        id v280 = v42;
        _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Found sender correlation identifier { guid: %@, senderCorrelationIdentifier: %@, fromID: %@, token: %@ }", buf, 0x2Au);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        __int16 v43 = [v170 tokenFreeURI];
        [v170 pushToken];
        v150 = long long v147 = v43;
        id v139 = v182;
        __int16 v142 = v39;
        _IDSLogV();
      }
    }
    else
    {
      long long v39 = 0;
    }
    CFMutableDictionaryRef Mutable = (__CFDictionary *)[(__CFDictionary *)v17 mutableCopy];
    if (!Mutable) {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    BOOL v45 = v180;
    if (v45) {
      CFDictionarySetValue(Mutable, IDSMessageContextStorageGuidKey, v45);
    }

    id v46 = v181;
    id v181 = v46;
    if (v46)
    {
      CFDictionarySetValue(Mutable, IDSMessageContextOriginalCommandKey, v46);
      id v46 = v181;
    }

    +[NSDate timeIntervalSinceReferenceDate];
    id v47 = +[NSNumber numberWithDouble:](NSNumber, "numberWithDouble:");
    if (v47) {
      CFDictionarySetValue(Mutable, IDSMessageContextBroadcastTimeKey, v47);
    }

    id v48 = v177;
    if (v48)
    {
      id v49 = v48;
      CFDictionarySetValue(Mutable, IDSMessageContextPriorityKey, v48);
      id v48 = v49;
    }
    int v159 = v48;

    id v50 = +[NSNumber numberWithLongLong:[(IDSIncomingMessageBroadcast *)v169 broadcastID]];
    if (v50) {
      CFDictionarySetValue(Mutable, IDSMessageContextBroadcastIDKey, v50);
    }

    id v51 = v184;
    if (v51)
    {
      uint64_t v52 = v51;
      CFDictionarySetValue(Mutable, IDSMessageContextServiceIdentifierKey, v51);
      id v51 = v52;
    }
    v184 = v51;

    id v53 = v30;
    if (v53)
    {
      id v54 = v53;
      CFDictionarySetValue(Mutable, IDSMessageContextToIDKey, v53);
      id v53 = v54;
    }
    v163 = v53;

    id v55 = +[NSNumber numberWithLongLong:a11];
    if (v55) {
      CFDictionarySetValue(Mutable, IDSMessageContextConnectionTypeKey, v55);
    }

    id v56 = v39;
    if (v56)
    {
      id v57 = v56;
      CFDictionarySetValue(Mutable, IDSMessageContextSenderCorrelationIdentifierKey, v56);
      id v56 = v57;
    }
    v161 = v56;

    id v58 = v182;
    if (v58) {
      CFDictionarySetValue(Mutable, IDSMessageContextOriginalGUIDKey, v58);
    }

    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v59 = (const void *)IDSMessageResourceTransferSandboxExtensionKey;
      id v60 = [v179 objectForKey:IDSMessageResourceTransferSandboxExtensionKey];
      if (v60) {
        CFDictionarySetValue(Mutable, v59, v60);
      }

      id v61 = (const void *)IDSMessageResourceTransferURLKey;
      id v62 = [v179 objectForKey:IDSMessageResourceTransferURLKey];
      if (v62) {
        CFDictionarySetValue(Mutable, v61, v62);
      }

      id v63 = (const void *)IDSMessageResourceTransferMetadataKey;
      id v64 = [v179 objectForKey:IDSMessageResourceTransferMetadataKey];
      if (v64) {
        CFDictionarySetValue(Mutable, v63, v64);
      }
    }
    v168 = Mutable;

    id v164 = [v183 superService];
    if ([v164 length])
    {
      id v65 = v164;

      v184 = v65;
    }
    uint64_t v66 = (uint64_t)[v181 unsignedIntegerValue];
    if (v66 <= 148)
    {
      char v67 = v66 - 100;
      long long v69 = v183;
      uint64_t v68 = v184;
      if ((unint64_t)(v66 - 100) <= 0x2F)
      {
        if (((1 << v67) & 0x4001100F7) == 0)
        {
          if (((1 << v67) & 0xDB8000000000) != 0)
          {
LABEL_71:
            long long v70 = v243;
            v243[0] = _NSConcreteStackBlock;
            v243[1] = 3221225472;
            v243[2] = sub_1003A33F0;
            v243[3] = &unk_10098AC20;
            v243[4] = v179;
            v244 = v45;
            id v245 = v68;
            id v246 = v163;
            id v247 = v172;
            id v248 = v168;
            keya = objc_retainBlock(v243);

LABEL_72:
            long long v71 = (id *)(v70 + 4);
            long long v72 = (int *)&kIDSListenerCapConsumesLaunchOnDemandIncomingData;
LABEL_78:
            int v74 = *v72;
            id v75 = *v71;
LABEL_79:

            id v17 = v168;
LABEL_80:
            if (!keya)
            {

LABEL_93:
              goto LABEL_94;
            }
            id v76 = objc_alloc_init((Class)IMMessageContext);
            [v76 setShouldBoost:1];
            if ([(IDSIncomingMessageBroadcast *)v169 broadcastNeedsClientAck])
            {
              __int16 v77 = OSLogHandleForTransportCategory();
              if (os_log_type_enabled(v77, OS_LOG_TYPE_INFO))
              {
                int64_t v78 = [(IDSIncomingMessageBroadcast *)v169 broadcastID];
                *(_DWORD *)long long buf = 138412546;
                id v274 = v58;
                __int16 v275 = 2048;
                CFStringRef v276 = (char *)v78;
                _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_INFO, "Broadcast: incoming local message %@ requires client ack, broadcast ID %lld\n", buf, 0x16u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
              {
                __int16 v140 = v58;
                id v143 = [(IDSIncomingMessageBroadcast *)v169 broadcastID];
                _IDSLogTransport();
              }
            }
            __int16 v79 = +[IDSDaemonPriorityQueueController sharedInstance];
            if (v159)
            {
              v193[0] = _NSConcreteStackBlock;
              v193[1] = 3221225472;
              v193[2] = sub_1003A439C;
              v193[3] = &unk_10098ACB0;
              v193[4] = self;
              id v194 = v183;
              id v195 = v159;
              v200 = keya;
              v196 = v169;
              v197 = v184;
              id v198 = v181;
              int v201 = v74;
              id v199 = v76;
              objc_msgSend(v79, "performBlockWithPriority:priority:", v193, (int)objc_msgSend(v195, "intValue"));

              CFStringRef v80 = &v194;
              id v81 = &v195;
              id v82 = (id *)&v200;
              id v83 = (id *)&v196;
              id v84 = (id *)&v197;
              CFStringRef v85 = &v198;
              __int16 v79 = v199;
            }
            else
            {
              v185[0] = _NSConcreteStackBlock;
              v185[1] = 3221225472;
              v185[2] = sub_1003A4448;
              v185[3] = &unk_10098ACD8;
              v185[4] = self;
              id v186 = v183;
              v191 = keya;
              v187 = v169;
              v188 = v184;
              id v189 = v181;
              int v192 = v74;
              id v190 = v76;
              [v79 performBlockMainQueue:v185];
              CFStringRef v80 = &v186;
              id v81 = (id *)&v191;
              id v82 = (id *)&v187;
              id v83 = (id *)&v188;
              id v84 = &v189;
              CFStringRef v85 = &v190;
            }

LABEL_92:
            goto LABEL_93;
          }
          goto LABEL_117;
        }
        goto LABEL_76;
      }
      goto LABEL_117;
    }
    long long v69 = v183;
    uint64_t v68 = v184;
    if (v66 <= 226)
    {
      if ((unint64_t)(v66 - 149) <= 0x2F)
      {
        if (((1 << (v66 + 107)) & 0xC20380000000) != 0)
        {
LABEL_76:
          uint64_t v73 = v234;
          v234[0] = _NSConcreteStackBlock;
          v234[1] = 3221225472;
          v234[2] = sub_1003A34AC;
          v234[3] = &unk_10098AC48;
          v234[4] = v171;
          id v235 = v69;
          id v236 = v179;
          id v181 = v181;
          id v237 = v181;
          v238 = v45;
          v239 = v68;
          id v240 = v163;
          id v241 = v172;
          id v242 = v168;
          keya = objc_retainBlock(v234);

LABEL_77:
          long long v71 = (id *)(v73 + 4);
          long long v72 = (int *)&kIDSListenerCapConsumesLaunchOnDemandIncomingMessages;
          goto LABEL_78;
        }
        if (v66 == 149) {
          goto LABEL_71;
        }
      }
      goto LABEL_117;
    }
    if (v66 > 241)
    {
      switch(v66)
      {
        case 242:
          long long v70 = v249;
          v249[0] = _NSConcreteStackBlock;
          v249[1] = 3221225472;
          v249[2] = sub_1003A3334;
          v249[3] = &unk_10098AC20;
          v249[4] = v179;
          unsigned int v250 = v45;
          BOOL v251 = v184;
          id v252 = v163;
          id v253 = v172;
          id v254 = v168;
          keya = objc_retainBlock(v249);
          [(IDSIncomingMessageBroadcast *)v169 setBroadcastNeedsClientAck:1];

          goto LABEL_72;
        case 243:
          v255[0] = _NSConcreteStackBlock;
          v255[1] = 3221225472;
          v255[2] = sub_1003A3208;
          v255[3] = &unk_10098AC20;
          id v256 = v179;
          long long v257 = v45;
          long long v258 = v184;
          id v259 = v163;
          id v260 = v172;
          v261 = v168;
          keya = objc_retainBlock(v255);
          [(IDSIncomingMessageBroadcast *)v169 setBroadcastNeedsClientAck:1];

          long long v71 = &v256;
          long long v72 = (int *)&kIDSListenerCapConsumesLaunchOnDemandIncomingProtobuf;
          goto LABEL_78;
        case 244:
          [(__CFDictionary *)v168 objectForKey:IDSMessageContextIncomingResponseIdentifierKey];
          v229[0] = _NSConcreteStackBlock;
          v229[1] = 3221225472;
          v229[2] = sub_1003A3CD4;
          v229[3] = &unk_100981B50;
          id v75 = (id)objc_claimAutoreleasedReturnValue();
          id v230 = v75;
          id v231 = v184;
          id v232 = v163;
          v233 = v168;
          keya = objc_retainBlock(v229);
          [(IDSIncomingMessageBroadcast *)v169 setBroadcastNeedsClientAck:1];

          id v181 = 0;
          int v74 = kIDSListenerCapConsumesLaunchOnDemandOutgoingMessageUpdates;
          goto LABEL_79;
      }
      goto LABEL_117;
    }
    if (v66 == 227)
    {
      uint64_t v73 = v262;
      v262[0] = _NSConcreteStackBlock;
      v262[1] = 3221225472;
      v262[2] = sub_1003A30F4;
      v262[3] = &unk_10098ABF8;
      id v181 = v181;
      v262[4] = v181;
      id v263 = v179;
      CFStringRef v264 = v45;
      __int16 v265 = v184;
      id v266 = v163;
      id v267 = v172;
      CFStringRef v268 = v168;
      keya = objc_retainBlock(v262);
      [(IDSIncomingMessageBroadcast *)v169 setBroadcastNeedsClientAck:1];

      goto LABEL_77;
    }
    if (v66 == 228)
    {
      keyb = [v179 _FTOptionallyDecompressData];
      v160 = JWDecodeDictionary();
      id v91 = [objc_alloc((Class)IDSSendParameters) initWithDictionary:v160];
      id v92 = [v91 groupData];

      if (v92)
      {
        uint64_t v93 = objc_opt_class();
        id v94 = [v91 groupData];
        id v95 = +[NSKeyedUnarchiver ids_secureUnarchiveObjectOfClass:v93 withData:v94];

        [v91 setDestinations:v95];
      }
      else
      {
        id v95 = [v91 destinations];
        CFStringRef v102 = +[NSSet setWithArray:v95];
        __int16 v103 = +[IDSDestination destinationWithStrings:v102];

        [v91 setDestinations:v103];
      }

      id v104 = [(IDSDaemon *)self serviceController];
      char v158 = [v104 serviceWithPushTopic:v184];

      __int16 v105 = +[IDSDAccountController sharedInstance];
      id v106 = [v105 accountsOnService:v158 withType:0];

      v176 = [v106 firstObject];
      long long v227 = 0u;
      long long v228 = 0u;
      long long v225 = 0u;
      long long v226 = 0u;
      id v107 = v106;
      id v108 = [v107 countByEnumeratingWithState:&v225 objects:v270 count:16];
      if (v108)
      {
        uint64_t v109 = *(void *)v226;
        while (2)
        {
          for (i = 0; i != v108; i = (char *)i + 1)
          {
            if (*(void *)v226 != v109) {
              objc_enumerationMutation(v107);
            }
            long long v111 = *(void **)(*((void *)&v225 + 1) + 8 * i);
            uint64_t v112 = [v111 unprefixedURIStringsFromRegistration];
            long long v113 = [v91 originalfromID];
            CFStringRef v114 = [v113 _stripFZIDPrefix];
            unsigned int v115 = [v112 containsObject:v114];

            if (v115)
            {
              id v116 = v111;

              v176 = v116;
              goto LABEL_149;
            }
          }
          id v108 = [v107 countByEnumeratingWithState:&v225 objects:v270 count:16];
          if (v108) {
            continue;
          }
          break;
        }
      }
LABEL_149:

      long long v117 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v117, OS_LOG_TYPE_DEFAULT))
      {
        long long v118 = [v91 messageUUID];
        unsigned int v119 = [v91 destinations];
        *(_DWORD *)long long buf = 138412802;
        id v274 = v118;
        __int16 v275 = 2112;
        CFStringRef v276 = v119;
        __int16 v277 = 2112;
        qos_class_t v278 = (char *)v176;
        _os_log_impl((void *)&_mh_execute_header, v117, OS_LOG_TYPE_DEFAULT, "Proxy message original parameters {messageUUID: %@, destinations: %@, targettingAccount: %@}", buf, 0x20u);
      }
      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v120 = [v91 messageUUID];
        id v143 = [v91 destinations];
        long long v148 = v176;
        __int16 v140 = v120;
        _IDSLogV();
      }
      id v121 = objc_alloc_init((Class)NSMutableSet);
      long long v223 = 0u;
      long long v224 = 0u;
      long long v221 = 0u;
      long long v222 = 0u;
      long long v122 = [v91 destinations];
      long long v123 = [v122 destinationURIs];

      id v124 = [v123 countByEnumeratingWithState:&v221 objects:v269 count:16];
      if (v124)
      {
        uint64_t v125 = *(void *)v222;
        uint64_t v126 = IDSDefaultPairedDevice;
        do
        {
          for (j = 0; j != v124; j = (char *)j + 1)
          {
            if (*(void *)v222 != v125) {
              objc_enumerationMutation(v123);
            }
            long long v128 = *(void **)(*((void *)&v221 + 1) + 8 * (void)j);
            if ((objc_msgSend(v128, "isEqualToString:", v126, v140, v143, v148) & 1) == 0) {
              [v121 addObject:v128];
            }
          }
          id v124 = [v123 countByEnumeratingWithState:&v221 objects:v269 count:16];
        }
        while (v124);
      }

      long long v129 = +[IDSDestination destinationWithStrings:v121];
      [v91 setDestinations:v129];

      long long v130 = [v176 uniqueID];
      [v91 setAccountUUID:v130];

      [v176 sendMessageWithSendParameters:v91 willSendBlock:&stru_10098AC68 completionBlock:&stru_10098AC88];
      goto LABEL_164;
    }
    if (v66 != 229)
    {
LABEL_117:
      id v89 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v89, OS_LOG_TYPE_ERROR))
      {
        __int16 v90 = (char *)[v181 unsignedIntegerValue];
        *(_DWORD *)long long buf = 136315394;
        id v274 = "-[IDSDaemon(Messaging) _processIncomingLocalMessage:topic:command:deviceID:btUUID:context:storedGUID:prio"
               "rity:connectionType:didWakeHint:]";
        __int16 v275 = 2048;
        CFStringRef v276 = v90;
        _os_log_impl((void *)&_mh_execute_header, v89, OS_LOG_TYPE_ERROR, "%s: Unknown incoming local message type received, %lu", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        id v144 = [v181 unsignedIntegerValue];
        _IDSWarnV();
        id v145 = objc_msgSend(v181, "unsignedIntegerValue", "-[IDSDaemon(Messaging) _processIncomingLocalMessage:topic:command:deviceID:btUUID:context:storedGUID:priority:connectionType:didWakeHint:]", v144);
        _IDSLogV();
        objc_msgSend(v181, "unsignedIntegerValue", "-[IDSDaemon(Messaging) _processIncomingLocalMessage:topic:command:deviceID:btUUID:context:storedGUID:priority:connectionType:didWakeHint:]", v145);
        _IDSLogTransport();
      }
LABEL_164:
      id v17 = v168;

      goto LABEL_93;
    }
    id v86 = OSLogHandleForTransportCategory();
    if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)long long buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "Incoming proxy nice message for broadcast", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      if (_IDSShouldLogTransport())
      {
        _IDSLogTransport();
        if (_IDSShouldLog()) {
          _IDSLogV();
        }
      }
    }
    __int16 v87 = [v179 _numberForKey:IDSCommandKey];
    id v153 = [v179 _dictionaryForKey:IDSProxyTopLevelPayloadKey];
    long long v152 = [v179 _dataForKey:IDSProxyPayloadKey];
    unsigned __int8 v157 = [v179 _stringForKey:IDSProxyGuidKey];
    v155 = [v179 _stringForKey:IDSProxyToIDKey];
    id v154 = [v179 _stringForKey:IDSProxyFromIDKey];
    unsigned int v156 = [(IDSDaemon *)self _checkIfDupeAndNoteGuid:v157 local:0 topic:v184];
    if (v156)
    {
      id v88 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v88, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v274 = v157;
        _os_log_impl((void *)&_mh_execute_header, v88, OS_LOG_TYPE_DEFAULT, "Received local proxy message %@ is a duplicate. Ignoring.", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        __int16 v140 = v157;
        _IDSLogV();
      }
      +[IDSDMessageStore deleteIncomingMessageWithGUID:](IDSDMessageStore, "deleteIncomingMessageWithGUID:", v157, v140);
      keya = 0;
      int v74 = 0;
      id v17 = v168;
LABEL_174:

      if (v156) {
        goto LABEL_92;
      }
      goto LABEL_80;
    }
    id v96 = (__CFDictionary *)[(__CFDictionary *)v168 mutableCopy];
    if (!v96) {
      id v96 = CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    }
    id v97 = v157;
    if (v97) {
      CFDictionarySetValue(v96, key, v97);
    }

    id v98 = v155;
    if (v98) {
      CFDictionarySetValue(v96, IDSMessageContextToIDKey, v98);
    }

    id v17 = v96;
    id v99 = v87;

    uint64_t v100 = (uint64_t)[v99 integerValue];
    int v74 = 0;
    keya = 0;
    if (v100 <= 179)
    {
      if ((unint64_t)(v100 - 100) > 0x10 || ((1 << (v100 - 100)) & 0x100F7) == 0) {
        goto LABEL_173;
      }
    }
    else if (v100 <= 194)
    {
      if ((unint64_t)(v100 - 180) >= 3 && v100 != 190) {
        goto LABEL_173;
      }
    }
    else
    {
      if (v100 > 241)
      {
        if (v100 == 242)
        {
          v209[0] = _NSConcreteStackBlock;
          v209[1] = 3221225472;
          v209[2] = sub_1003A411C;
          v209[3] = &unk_10098AC20;
          id v210 = v152;
          uint64_t v211 = v97;
          v212 = v184;
          id v213 = v98;
          id v214 = v154;
          v215 = v17;
          keya = objc_retainBlock(v209);
          long long v131 = &v210;
          long long v132 = (id *)&v211;
          long long v133 = (id *)&v212;
          uint64_t v134 = &v213;
          id v135 = &v214;
          __int16 v136 = (id *)&v215;
          id v137 = (int *)&kIDSListenerCapConsumesLaunchOnDemandIncomingData;
        }
        else
        {
          if (v100 != 243) {
            goto LABEL_173;
          }
          v202[0] = _NSConcreteStackBlock;
          v202[1] = 3221225472;
          v202[2] = sub_1003A42D8;
          v202[3] = &unk_10098AC20;
          id v203 = v152;
          CFStringRef v204 = v97;
          v205 = v184;
          id v206 = v98;
          id v207 = v154;
          v208 = v17;
          keya = objc_retainBlock(v202);
          long long v131 = &v203;
          long long v132 = (id *)&v204;
          long long v133 = (id *)&v205;
          uint64_t v134 = &v206;
          id v135 = &v207;
          __int16 v136 = (id *)&v208;
          id v137 = (int *)&kIDSListenerCapConsumesLaunchOnDemandIncomingProtobuf;
        }
        goto LABEL_172;
      }
      if ((unint64_t)(v100 - 195) >= 2)
      {
        if (v100 != 227)
        {
LABEL_173:

          id v181 = v99;
          goto LABEL_174;
        }
        id v101 = (id *)v216;
        v216[0] = _NSConcreteStackBlock;
        v216[1] = 3221225472;
        v216[2] = sub_1003A4004;
        v216[3] = &unk_100985FF8;
        v216[4] = v99;
        v216[5] = v179;
        v216[6] = v153;
        v216[7] = v97;
        v216[8] = v184;
        v216[9] = v98;
        id v217 = v154;
        unsigned int v218 = v17;
        keya = objc_retainBlock(v216);

        goto LABEL_171;
      }
    }
    id v101 = (id *)v219;
    v219[0] = _NSConcreteStackBlock;
    v219[1] = 3221225472;
    v219[2] = sub_1003A3F34;
    v219[3] = &unk_10098ABF8;
    v219[4] = v153;
    v219[5] = v97;
    v219[6] = v179;
    v219[7] = v184;
    v219[8] = v98;
    v219[9] = v154;
    id v220 = v17;
    keya = objc_retainBlock(v219);

LABEL_171:
    long long v131 = v101 + 4;
    long long v132 = v101 + 5;
    long long v133 = v101 + 6;
    uint64_t v134 = v101 + 7;
    id v135 = v101 + 8;
    __int16 v136 = v101 + 9;
    id v137 = (int *)&kIDSListenerCapConsumesLaunchOnDemandIncomingMessages;
LABEL_172:
    int v74 = *v137;

    goto LABEL_173;
  }
  uint64_t v23 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR))
  {
    *(_DWORD *)long long buf = 136315394;
    id v274 = "-[IDSDaemon(Messaging) _processIncomingLocalMessage:topic:command:deviceID:btUUID:context:storedGUID:priority"
           ":connectionType:didWakeHint:]";
    __int16 v275 = 2112;
    CFStringRef v276 = v184;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_ERROR, "%s: could not find IDSServiceProperties for topic %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    _IDSWarnV();
    _IDSLogV();
    id v139 = "-[IDSDaemon(Messaging) _processIncomingLocalMessage:topic:command:deviceID:btUUID:context:storedGUID:priority"
           ":connectionType:didWakeHint:]";
    __int16 v142 = v184;
    _IDSLogTransport();
  }
  +[IDSDMessageStore deleteIncomingMessageWithGUID:](IDSDMessageStore, "deleteIncomingMessageWithGUID:", v180, v139, v142);
LABEL_94:
}

- (void)_processStoredIncomingLocalMessage:(id)a3
{
  id v4 = a3;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    id v6 = [v4 guid];
    id v7 = [v4 topic];
    *(_DWORD *)long long buf = 138412546;
    id v61 = v6;
    __int16 v62 = 2112;
    id v63 = v7;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Processing stored incoming local message %@ topic %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v8 = [v4 guid];
    [v4 topic];
    id v48 = v45 = v8;
    _IDSLogV();
  }
  id v9 = objc_msgSend(v4, "message", v45, v48);
  BOOL v10 = [v9 objectForKey:@"IDSIncomingLocalMessageService"];
  id v58 = [v9 objectForKey:@"IDSIncomingLocalMessageDeviceID"];
  id v57 = [v9 objectForKey:@"IDSIncomingLocalMessageBTUUID"];
  id v59 = [v9 objectForKey:@"IDSIncomingLocalMessageCommand"];
  id v55 = [v9 objectForKey:@"IDSIncomingLocalMessagePayload"];
  id v11 = objc_alloc((Class)NSMutableDictionary);
  id v12 = [v9 objectForKey:@"IDSIncomingLocalMessageContext"];
  id v13 = [v11 initWithDictionary:v12];

  dispatch_time_t v14 = [v4 guid];
  [v13 setObject:v14 forKey:IDSMessageContextStorageGuidKey];

  id v15 = [(IDSDaemon *)self serviceController];
  id v16 = [v15 serviceWithPushTopic:v10];

  if (!sub_100384524((char)[v16 shouldProtectTrafficUsingClassA], (int)objc_msgSend(v16, "dataProtectionClass"), v10))
  {
    id v56 = [v4 guid];
    LOBYTE(v51) = 0;
    [(IDSDaemon *)self _processIncomingLocalMessage:v55 topic:v10 command:v59 deviceID:v58 btUUID:v57 context:v13 storedGUID:v56 priority:0 connectionType:0 didWakeHint:v51];
    goto LABEL_48;
  }
  id v17 = +[IDSDAccountController sharedInstance];
  id v18 = [(IDSDaemon *)self serviceController];
  long long v19 = [v18 serviceWithPushTopic:v10];
  id v56 = [v17 localAccountOnService:v19];

  id v20 = [v56 fromIDForCBUUID:v57 deviceID:v58];
  if (!v20)
  {
    id v21 = +[IDSPairingManager sharedInstance];
    unsigned int v22 = [v21 pairedDeviceUniqueID];
    id v20 = (void *)_IDSCopyIDForDeviceUniqueID();
  }
  uint64_t v23 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    id v61 = v20;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "Using fromID for this message as %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v46 = v20;
    _IDSLogV();
  }
  int64_t v24 = objc_msgSend(v20, "_stripFZIDPrefix", v46);
  unsigned int v25 = +[IDSEncryptionHelpers areDataProtectionKeysAvailableForService:v10 withDataProtectionClass:1 fromDevice:v24];

  if (!v25)
  {
    __int16 v29 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
    {
      id v30 = [v4 guid];
      id v31 = [v4 topic];
      *(_DWORD *)long long buf = 138412546;
      id v61 = v30;
      __int16 v62 = 2112;
      id v63 = v31;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Class A key not avaialble for message %@ on topic %@", buf, 0x16u);
    }
    if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
      goto LABEL_36;
    }
    id v28 = [v4 guid];
    id v54 = [v4 topic];
    _IDSLogV();
LABEL_35:

LABEL_36:
    goto LABEL_48;
  }
  id v26 = [v59 unsignedIntegerValue];
  if (v26 == (id)243)
  {
    id v32 = [objc_alloc((Class)IDSProtobuf) initWithDictionary:v55];
    id v33 = [v32 data];
    id v34 = [v20 _stripFZIDPrefix];
    id v54 = [(IDSDaemon *)self _decryptAOverCMessage:v33 topic:v10 fromDeviceID:v34 error:0];

    if (v54)
    {
      objc_msgSend(v32, "setData:");
      id v28 = [v32 dictionaryRepresentation];
    }
    else
    {
      id v28 = 0;
    }

LABEL_33:
    if (v28) {
      goto LABEL_34;
    }
    goto LABEL_37;
  }
  if (v26 == (id)242)
  {
    id v35 = [v20 _stripFZIDPrefix];
    id v36 = [(IDSDaemon *)self _decryptAOverCMessage:v55 topic:v10 fromDeviceID:v35 error:0];

    if (v36)
    {
      id v28 = v36;
      id v54 = v28;
LABEL_34:
      long long v37 = [v4 guid];
      LOBYTE(v51) = 0;
      [(IDSDaemon *)self _processIncomingLocalMessage:v28 topic:v10 command:v59 deviceID:v58 btUUID:v57 context:v13 storedGUID:v37 priority:0 connectionType:0 didWakeHint:v51];

      goto LABEL_35;
    }
  }
  else if (v26 == (id)227)
  {
    BOOL v27 = [v20 _stripFZIDPrefix];
    id v54 = [(IDSDaemon *)self _decryptAOverCMessage:v55 topic:v10 fromDeviceID:v27 error:0];

    if (v54)
    {
      JWDecodeDictionary();
      id v28 = (id)objc_claimAutoreleasedReturnValue();
      goto LABEL_33;
    }
  }
  id v54 = 0;
LABEL_37:
  long long v38 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
  {
    long long v39 = [v13 objectForKey:IDSMessageContextOutgoingResponseIdentifierKey];
    *(_DWORD *)long long buf = 138413058;
    id v61 = v59;
    __int16 v62 = 2112;
    id v63 = v20;
    __int16 v64 = 2112;
    id v65 = v10;
    __int16 v66 = 2112;
    char v67 = v39;
    _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_ERROR, "We failed to decrypt class A data on a class C service even when we had keys, Please collect logs and file a bug: Original Command: %@ From Device: %@ Service: %@ GUID: %@", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    uint64_t v40 = IDSMessageContextOutgoingResponseIdentifierKey;
    uint64_t v52 = [v13 objectForKey:IDSMessageContextOutgoingResponseIdentifierKey];
    _IDSWarnV();

    id v53 = objc_msgSend(v13, "objectForKey:", v40, v59, v20, v10, v52);
    _IDSLogV();

    objc_msgSend(v13, "objectForKey:", v40, v59, v20, v10, v53);
    v51 = id v50 = v10;
    id v47 = v59;
    id v49 = v20;
    _IDSLogTransport();
  }
  CFStringRef v41 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v42 = [v13 objectForKey:IDSMessageContextOutgoingResponseIdentifierKey];
    *(_DWORD *)long long buf = 138413058;
    id v61 = v59;
    __int16 v62 = 2112;
    id v63 = v20;
    __int16 v64 = 2112;
    id v65 = v10;
    __int16 v66 = 2112;
    char v67 = v42;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "We failed to decrypt class A data on a class C service even when we had keys, Please collect logs and file a bug: Original Command: %@ From Device: %@ Service: %@ GUID: %@", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      uint64_t v43 = IDSMessageContextOutgoingResponseIdentifierKey;
      [v13 objectForKey:IDSMessageContextOutgoingResponseIdentifierKey];
      v51 = id v50 = v10;
      id v47 = v59;
      id v49 = v20;
      _IDSLogTransport();

      if (_IDSShouldLog())
      {
        objc_msgSend(v13, "objectForKey:", v43, v59, v20, v10, v51);
        v51 = id v50 = v10;
        id v47 = v59;
        id v49 = v20;
        _IDSLogV();
      }
    }
  }
  __int16 v44 = objc_msgSend(v4, "guid", v47, v49, v50, v51);
  +[IDSDMessageStore deleteIncomingMessageWithGUID:v44];

LABEL_48:
}

- (void)_processStoredIncomingLocalMessages
{
  id v3 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v3, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 136315138;
    id v16 = "-[IDSDaemon(Messaging) _processStoredIncomingLocalMessages]";
    _os_log_impl((void *)&_mh_execute_header, v3, OS_LOG_TYPE_DEFAULT, "%s", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v9 = "-[IDSDaemon(Messaging) _processStoredIncomingLocalMessages]";
    _IDSLogV();
  }
  id v5 = +[IDSDMessageStore incomingMessagesUpToLimit:5000 messageTransportType:1 success:0];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v10 = 0u;
  long long v11 = 0u;
  id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v11;
    do
    {
      id v8 = 0;
      do
      {
        if (*(void *)v11 != v7) {
          objc_enumerationMutation(v5);
        }
        -[IDSDaemon _processStoredIncomingLocalMessage:](self, "_processStoredIncomingLocalMessage:", *(void *)(*((void *)&v10 + 1) + 8 * (void)v8), v9);
        id v8 = (char *)v8 + 1;
      }
      while (v6 != v8);
      id v6 = [v5 countByEnumeratingWithState:&v10 objects:v14 count:16];
    }
    while (v6);
  }
}

- (void)_processStoredIncomingRemoteMessagesWithGUIDs:(id)a3 ignoringGUIDs:(id)a4 controlCategory:(unsigned int)a5 lastTimeInterval:(double)a6 repeatedAttempt:(BOOL)a7
{
  BOOL v8 = a7;
  id v91 = a3;
  id v89 = a4;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v104 = _os_activity_create((void *)&_mh_execute_header, "Processing stored incoming remote messages", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v104, &state);
  __int16 v87 = self;
  if (self->_processingStoredIncomingRemoteMessages && !v8)
  {
    if (!self->_processingStoredIncomingRemoteMessagesControlCategories)
    {
      long long v12 = (NSMutableArray *)objc_alloc_init((Class)NSMutableArray);
      processingStoredIncomingRemoteMessagesControlCategories = self->_processingStoredIncomingRemoteMessagesControlCategories;
      self->_processingStoredIncomingRemoteMessagesControlCategories = v12;
    }
    __int16 v90 = +[NSNumber numberWithUnsignedInt:a5];
    if (([(NSMutableArray *)self->_processingStoredIncomingRemoteMessagesControlCategories containsObject:v90] & 1) == 0)[(NSMutableArray *)self->_processingStoredIncomingRemoteMessagesControlCategories addObject:v90]; {
    dispatch_time_t v14 = OSLogHandleForIDSCategory();
    }
    if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
    {
      id v15 = self->_processingStoredIncomingRemoteMessagesControlCategories;
      *(_DWORD *)long long buf = 136315394;
      id v107 = "-[IDSDaemon(Messaging) _processStoredIncomingRemoteMessagesWithGUIDs:ignoringGUIDs:controlCategory:lastTime"
             "Interval:repeatedAttempt:]";
      __int16 v108 = 2112;
      double v109 = *(double *)&v15;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "%s: ignoring, already processing queued control categories %@", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    goto LABEL_105;
  }
  self->_processingStoredIncomingRemoteMessages = 1;
  id v16 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v91 count];
    CFStringRef v18 = @"NO";
    id v107 = "-[IDSDaemon(Messaging) _processStoredIncomingRemoteMessagesWithGUIDs:ignoringGUIDs:controlCategory:lastTimeIn"
           "terval:repeatedAttempt:]";
    *(_DWORD *)long long buf = 136315650;
    if (v8) {
      CFStringRef v18 = @"YES";
    }
    __int16 v108 = 2048;
    double v109 = *(double *)&v17;
    __int16 v110 = 2112;
    uint64_t v111 = (uint64_t)v18;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "%s: GUIDs count %lu {repeatedAttempt: %@}", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v19 = [v91 count];
    CFStringRef v20 = @"NO";
    if (v8) {
      CFStringRef v20 = @"YES";
    }
    id v79 = v19;
    CFStringRef v81 = v20;
    __int16 v77 = "-[IDSDaemon(Messaging) _processStoredIncomingRemoteMessagesWithGUIDs:ignoringGUIDs:controlCategory:lastTimeInt"
          "erval:repeatedAttempt:]";
    _IDSLogV();
  }
  [(IDSDaemon *)self _minimumNextStoredLoadTime];
  double v22 = v21;
  if (v89)
  {
    __int16 v90 = +[NSMutableSet setWithSet:](NSMutableSet, "setWithSet:");
  }
  else
  {
    __int16 v90 = 0;
  }
  int64_t v24 = +[IDSDMessageStore incomingMessagesUpToLimit:500 controlCategory:a5 messageTransportType:2 success:0];
  unsigned int v25 = [v24 sortedArrayUsingComparator:&stru_10098AD18];

  id v85 = [v25 count];
  id v26 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v26, OS_LOG_TYPE_DEFAULT))
  {
    BOOL v27 = (const char *)[v25 count];
    CFStringRef v28 = @"YES";
    if ((unint64_t)v85 < 0x1F4) {
      CFStringRef v28 = @"NO";
    }
    *(_DWORD *)long long buf = 134218242;
    id v107 = v27;
    __int16 v108 = 2112;
    double v109 = *(double *)&v28;
    _os_log_impl((void *)&_mh_execute_header, v26, OS_LOG_TYPE_DEFAULT, "Processing %lu stored incoming remote messages {shouldRepeat %@}", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v29 = (const __CFString *)[v25 count];
    CFStringRef v30 = @"YES";
    if ((unint64_t)v85 < 0x1F4) {
      CFStringRef v30 = @"NO";
    }
    CFStringRef v78 = v29;
    double v80 = *(double *)&v30;
    _IDSLogV();
  }
  long long v101 = 0u;
  long long v102 = 0u;
  long long v100 = 0u;
  long long v99 = 0u;
  id obj = v25;
  id v31 = [obj countByEnumeratingWithState:&v99 objects:v105 count:16];
  if (!v31)
  {

    uint64_t v88 = 0;
    goto LABEL_80;
  }
  uint64_t v88 = 0;
  uint64_t v32 = *(void *)v100;
  do
  {
    for (i = 0; i != v31; i = (char *)i + 1)
    {
      if (*(void *)v100 != v32) {
        objc_enumerationMutation(obj);
      }
      id v34 = *(void **)(*((void *)&v99 + 1) + 8 * i);
      id v36 = +[IMSystemMonitor sharedInstance];
      unsigned int v37 = [v36 isUnderFirstDataProtectionLock];

      if (!v37) {
        goto LABEL_41;
      }
      long long v38 = [(IDSDaemon *)v87 serviceController];
      long long v39 = [v34 topic];
      uint64_t v40 = [v38 serviceWithPushTopic:v39];

      if ([v40 dataProtectionClass])
      {

LABEL_41:
        if (v91)
        {
          uint64_t v7 = [v34 guid];
          if (([v91 containsObject:v7] & 1) == 0)
          {

LABEL_57:
            ++v88;
            goto LABEL_71;
          }
          if (!v89)
          {

            goto LABEL_58;
          }
        }
        else if (!v89)
        {
LABEL_58:
          if (!v90 && (unint64_t)v85 >= 0x1F4)
          {
            __int16 v90 = +[NSMutableSet set];
          }
          __int16 v44 = objc_msgSend(v34, "guid", v78, *(void *)&v80);
          [v90 addObject:v44];

          if ([v34 controlCategory]
            && [v34 expirationDate]
            && (id v45 = [v34 expirationDate],
                +[NSDate date],
                id v46 = objc_claimAutoreleasedReturnValue(),
                [v46 timeIntervalSince1970],
                LODWORD(v45) = v47 > (double)(uint64_t)v45,
                v46,
                v45))
          {
            id v48 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEFAULT))
            {
              id v49 = [v34 topic];
              id v50 = [v34 guid];
              *(_DWORD *)long long buf = 138412802;
              id v107 = v49;
              __int16 v108 = 2112;
              double v109 = *(double *)&v50;
              __int16 v110 = 2112;
              uint64_t v111 = (uint64_t)v34;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEFAULT, "Found expired message for topic %@ storedGuid %@: %@", buf, 0x20u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v51 = [v34 topic];
              double v80 = [v34 guid];
              id v82 = v34;
              CFStringRef v78 = v51;
              _IDSLogV();
            }
            uint64_t v52 = objc_msgSend(v34, "guid", v78, *(void *)&v80, v82);
            +[IDSDMessageStore deleteIncomingMessageWithGUID:v52];
          }
          else
          {
            id v53 = objc_alloc((Class)IDSIncomingNiceMessage);
            id v54 = [v34 message];
            id v55 = [v34 topic];
            id v56 = [v53 initWithMessageDictionary:v54 topic:v55];

            id v57 = [v34 fromID];
            id v58 = [v34 topic];
            id v59 = +[IDSURI URIWithPrefixedURI:v57 withServiceLoggingHint:v58];

            id v60 = [v34 topic];
            id v61 = [v34 guid];
            [(IDSDaemon *)v87 _processIncomingRemoteNiceMessage:v56 forTopic:v60 fromURI:v59 storedGuid:v61 messageContext:0];
          }
          goto LABEL_71;
        }
        CFStringRef v41 = objc_msgSend(v34, "guid", v78, *(void *)&v80);
        unsigned int v42 = [v89 containsObject:v41];

        if (v91)
        {

          if (v42) {
            goto LABEL_57;
          }
        }
        else if (v42)
        {
          goto LABEL_57;
        }
        goto LABEL_58;
      }
      uint64_t v43 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v43, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v43, OS_LOG_TYPE_DEFAULT, " => Deferring message, service wants messages after first unlock only", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }

LABEL_71:
    }
    id v31 = [obj countByEnumeratingWithState:&v99 objects:v105 count:16];
  }
  while (v31);

  if (v88 >= 1)
  {
    if ((unint64_t)v88 > 0x1F3) {
      goto LABEL_78;
    }
    [(IDSDaemon *)v87 _minimumNextStoredLoadTime];
    double v22 = a6 / (double)(500 - v88) * 500.0;
    if (v22 < v62)
    {
      [(IDSDaemon *)v87 _minimumNextStoredLoadTime];
      goto LABEL_79;
    }
    [(IDSDaemon *)v87 _maximumNextStoredLoadTime];
    if (v22 > v76)
    {
LABEL_78:
      [(IDSDaemon *)v87 _maximumNextStoredLoadTime];
LABEL_79:
      double v22 = v63;
    }
  }
LABEL_80:
  __int16 v64 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v65 = @"YES";
    *(_DWORD *)long long buf = 138412802;
    if ((unint64_t)v85 < 0x1F4) {
      CFStringRef v65 = @"NO";
    }
    id v107 = (const char *)v65;
    __int16 v108 = 2048;
    double v109 = v22;
    __int16 v110 = 2048;
    uint64_t v111 = v88;
    _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Finished processing stored incoming messages {shouldRepeat %@, timeInterval %f, numberFiltered %lld}", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v66 = @"YES";
    if ((unint64_t)v85 < 0x1F4) {
      CFStringRef v66 = @"NO";
    }
    id v82 = (void *)v88;
    double v80 = v22;
    CFStringRef v78 = v66;
    _IDSLogV();
  }
  if ((unint64_t)v85 >= 0x1F4)
  {
    dispatch_time_t v72 = dispatch_time(0, (uint64_t)(v22 * 1000000000.0));
    uint64_t v73 = im_primary_queue();
    v94[0] = _NSConcreteStackBlock;
    v94[1] = 3221225472;
    v94[2] = sub_1003A61C0;
    v94[3] = &unk_10098A178;
    v94[4] = v87;
    id v95 = v91;
    id v96 = v90;
    unsigned int v98 = a5;
    double v97 = v22;
    dispatch_after(v72, v73, v94);
  }
  else
  {
    v87->_processingStoredIncomingRemoteMessages = 0;
    if ([(NSMutableArray *)v87->_processingStoredIncomingRemoteMessagesControlCategories count])
    {
      char v67 = [(NSMutableArray *)v87->_processingStoredIncomingRemoteMessagesControlCategories firstObject];
      uint64_t v68 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
      {
        long long v69 = v87->_processingStoredIncomingRemoteMessagesControlCategories;
        *(_DWORD *)long long buf = 138412546;
        id v107 = v67;
        __int16 v108 = 2112;
        double v109 = *(double *)&v69;
        _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "Finished processing queued messages, moving onto queued categories {controlCategory %@, queued %@}", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        CFStringRef v78 = (const __CFString *)v67;
        double v80 = *(double *)&v87->_processingStoredIncomingRemoteMessagesControlCategories;
        _IDSLogV();
      }
      [(NSMutableArray *)v87->_processingStoredIncomingRemoteMessagesControlCategories removeFirstObject];
      long long v70 = im_primary_queue();
      block[0] = _NSConcreteStackBlock;
      block[1] = 3221225472;
      block[2] = sub_1003A61DC;
      block[3] = &unk_10097E440;
      void block[4] = v87;
      uint64_t v93 = v67;
      long long v71 = v67;
      dispatch_async(v70, block);
    }
    else
    {
      int v74 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v74, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)long long buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_DEFAULT, "Finished processing all queued messages", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      id v75 = v87->_processingStoredIncomingRemoteMessagesControlCategories;
      v87->_processingStoredIncomingRemoteMessagesControlCategories = 0;
    }
  }

LABEL_105:
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (void)_processStoredIncomingRemoteMessagesWithGUIDs:(id)a3 ignoringGUIDs:(id)a4 lastTimeInterval:(double)a5
{
}

- (double)_minimumNextStoredLoadTime
{
  return 2.0;
}

- (double)_maximumNextStoredLoadTime
{
  return 60.0;
}

- (void)_processStoredIncomingMessages
{
  [(IDSDaemon *)self _processStoredIncomingLocalMessages];

  [(IDSDaemon *)self _processStoredIncomingRemoteMessagesWithGUIDs:0 ignoringGUIDs:0 lastTimeInterval:0.0];
}

- (void)_processStoredIncomingMessagesForCategory:(unsigned int)a3
{
}

- (void)_processDeletingMessagesWithPriority:(int64_t)a3 reason:(id)a4 responseCode:(int64_t)a5 allowedTrafficClasses:(id)a6
{
  id v10 = a4;
  id v11 = a6;
  im_assert_primary_base_queue();
  long long v12 = +[IDSDaemonPriorityQueueController sharedInstance];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_1003A639C;
  v15[3] = &unk_10098AD90;
  id v16 = v11;
  id v17 = self;
  int64_t v19 = a3;
  int64_t v20 = a5;
  id v18 = v10;
  id v13 = v10;
  id v14 = v11;
  [v12 performBlockWithPriority:v15 priority:a3];
}

- (void)_processDisallowedMessages
{
  id v3 = +[IDSUTunDeliveryController sharedInstance];
  id v4 = [v3 allowedTrafficClasses];

  [(IDSDaemon *)self _processDeletingMessagesWithPriority:300 reason:@"Revision lock forced failure" responseCode:20 allowedTrafficClasses:v4];
  [(IDSDaemon *)self _processDeletingMessagesWithPriority:200 reason:@"Revision lock forced failure" responseCode:20 allowedTrafficClasses:v4];
  [(IDSDaemon *)self _processDeletingMessagesWithPriority:100 reason:@"Revision lock forced failure" responseCode:20 allowedTrafficClasses:v4];
}

- (void)_processMessagesUponUnpairing
{
  [(IDSDaemon *)self _processDeletingMessagesWithPriority:300 reason:@"Destination device has unpaired" responseCode:14 allowedTrafficClasses:0];
  [(IDSDaemon *)self _processDeletingMessagesWithPriority:200 reason:@"Destination device has unpaired" responseCode:14 allowedTrafficClasses:0];

  [(IDSDaemon *)self _processDeletingMessagesWithPriority:100 reason:@"Destination device has unpaired" responseCode:14 allowedTrafficClasses:0];
}

- (void)_processStoredOutgoingUrgentMessagesProcessLocalAccounts:(BOOL)a3
{
  BOOL v3 = a3;
  id v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v5 = @"NO";
    if (v3) {
      CFStringRef v5 = @"YES";
    }
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v88 = v5;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Processing stored outgoing urgent messages LocalOnly: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v6 = @"NO";
    if (v3) {
      CFStringRef v6 = @"YES";
    }
    CFStringRef v54 = v6;
    _IDSLogV();
  }
  uint64_t v7 = +[IDSDAccountController sharedInstance];
  BOOL v8 = v7;
  if (v3)
  {
    id v9 = [v7 accountsWithType:2];
    id v10 = +[NSMutableArray arrayWithArray:v9];

    id v11 = +[IDSPairingManager sharedInstance];
    CFStringRef v66 = [v11 pairedDeviceUniqueID];
  }
  else
  {
    long long v12 = [v7 accountsWithType:1];
    id v10 = +[NSMutableArray arrayWithArray:v12];

    id v11 = +[IDSDAccountController sharedInstance];
    id v13 = [v11 accountsWithType:0];
    [v10 addObjectsFromArray:v13];

    CFStringRef v66 = 0;
  }

  id v70 = objc_alloc_init((Class)NSMutableArray);
  long long v85 = 0u;
  long long v86 = 0u;
  long long v83 = 0u;
  long long v84 = 0u;
  id obj = v10;
  id v14 = [obj countByEnumeratingWithState:&v83 objects:v92 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v84;
    do
    {
      for (i = 0; i != v14; i = (char *)i + 1)
      {
        if (*(void *)v84 != v15) {
          objc_enumerationMutation(obj);
        }
        id v17 = *(void **)(*((void *)&v83 + 1) + 8 * i);
        id v18 = [v17 uniqueID];

        if (v18)
        {
          int64_t v19 = [v17 uniqueID];
          [v70 addObject:v19];
        }
      }
      id v14 = [obj countByEnumeratingWithState:&v83 objects:v92 count:16];
    }
    while (v14);
  }

  int64_t v20 = +[IDSDMessageStore allUnsentOutgoingMessagesForAccounts:v70 localDestinationDeviceID:v66 priority:300 hardLimit:10000];
  id v65 = objc_alloc_init((Class)IMMessageContext);
  [v65 setShouldBoost:1];
  double v21 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v22 = (const __CFString *)[v20 count];
    *(_DWORD *)long long buf = 134217984;
    CFStringRef v88 = v22;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Processing stored %lu outgoing urgent priority messages", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v55 = [v20 count];
    _IDSLogV();
  }
  long long v81 = 0u;
  long long v82 = 0u;
  long long v79 = 0u;
  long long v80 = 0u;
  id v67 = v20;
  id v72 = [v67 countByEnumeratingWithState:&v79 objects:v91 count:16];
  if (v72)
  {
    uint64_t v71 = *(void *)v80;
    do
    {
      for (j = 0; j != v72; j = (char *)j + 1)
      {
        if (*(void *)v80 != v71) {
          objc_enumerationMutation(v67);
        }
        int64_t v24 = *(void **)(*((void *)&v79 + 1) + 8 * (void)j);
        unsigned int v25 = +[IDSDAccountController sharedInstance];
        id v26 = [v24 accountGUID];
        BOOL v27 = [v25 accountWithUniqueID:v26];

        if (!v27)
        {
          CFStringRef v28 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v28, OS_LOG_TYPE_ERROR))
          {
            CFStringRef v29 = [v24 accountGUID];
            *(_DWORD *)long long buf = 138412290;
            CFStringRef v88 = v29;
            _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_ERROR, "Found stored outgoing message from account with guid %@ which no longer exists.", buf, 0xCu);
          }
          if (os_log_shim_legacy_logging_enabled())
          {
            id v57 = [v24 accountGUID];
            _IDSWarnV();

            id v58 = objc_msgSend(v24, "accountGUID", v57);
            _IDSLogV();

            id v56 = objc_msgSend(v24, "accountGUID", v58);
            _IDSLogTransport();
          }
        }
        CFStringRef v30 = [(__CFString *)v27 service];
        uint64_t v73 = [v30 pushTopic];

        if (v73)
        {
          id v31 = [v24 copySendParameters];
          uint64_t v32 = [v31 data];

          if (v32)
          {
            id v33 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_DEBUG))
            {
              id v34 = [v31 data];
              unsigned int v35 = [v34 length];
              id v36 = [v31 destinations];
              id v37 = [v31 identifier];
              long long v38 = [v24 guid];
              *(_DWORD *)long long buf = 138413314;
              CFStringRef v88 = v27;
              __int16 v89 = 1024;
              *(_DWORD *)__int16 v90 = v35;
              *(_WORD *)&v90[4] = 2112;
              *(void *)&v90[6] = v36;
              *(_WORD *)&v90[14] = 2112;
              *(void *)&v90[16] = v37;
              *(_WORD *)&v90[24] = 2112;
              *(void *)&v90[26] = v38;
              _os_log_impl((void *)&_mh_execute_header, v33, OS_LOG_TYPE_DEBUG, "account %@ _processStoredOutgoingUrgentMessagesProcessLocalAccounts for with data size: %d to: %@ identifier: %@ guid: %@", buf, 0x30u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              long long v39 = [v31 data];
              id v40 = [v39 length];
              CFStringRef v41 = [v31 destinations];
              unsigned int v42 = [v31 identifier];
              uint64_t v43 = [v24 guid];
              double v63 = v42;
              __int16 v64 = v43;
              id v61 = v40;
              double v62 = v41;
              id v55 = v27;
              _IDSLogV();
              goto LABEL_54;
            }
          }
          else
          {
            id v48 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v48, OS_LOG_TYPE_DEBUG))
            {
              id v49 = [v31 message];
              id v50 = [v31 destinations];
              id v51 = [v31 identifier];
              uint64_t v52 = [v24 guid];
              *(_DWORD *)long long buf = 138413314;
              CFStringRef v88 = v27;
              __int16 v89 = 2112;
              *(void *)__int16 v90 = v49;
              *(_WORD *)&v90[8] = 2112;
              *(void *)&v90[10] = v50;
              *(_WORD *)&v90[18] = 2112;
              *(void *)&v90[20] = v51;
              *(_WORD *)&v90[28] = 2112;
              *(void *)&v90[30] = v52;
              _os_log_impl((void *)&_mh_execute_header, v48, OS_LOG_TYPE_DEBUG, "account %@ _processStoredOutgoingUrgentMessagesProcessLocalAccounts for message: %@ to: %@ identifier: %@ guid: %@", buf, 0x34u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              long long v39 = [v31 message];
              CFStringRef v41 = [v31 destinations];
              unsigned int v42 = [v31 identifier];
              uint64_t v43 = [v24 guid];
              double v63 = v42;
              __int16 v64 = v43;
              id v61 = v39;
              double v62 = v41;
              id v55 = v27;
              _IDSLogV();
LABEL_54:
            }
          }
          v74[0] = _NSConcreteStackBlock;
          v74[1] = 3221225472;
          v74[2] = sub_1003A809C;
          v74[3] = &unk_10098A770;
          id v75 = v73;
          double v76 = self;
          __int16 v77 = v24;
          id v46 = v31;
          id v78 = v46;
          double v47 = objc_retainBlock(v74);
          [(__CFString *)v27 sendMessageWithSendParameters:v46 willSendBlock:0 completionBlock:v47];

          goto LABEL_56;
        }
        __int16 v44 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_ERROR))
        {
          id v45 = [v24 guid];
          *(_DWORD *)long long buf = 138412290;
          CFStringRef v88 = v45;
          _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_ERROR, "Old outgoing message %@ has no relevant account, cleaning up.", buf, 0xCu);
        }
        if (os_log_shim_legacy_logging_enabled())
        {
          id v59 = [v24 guid];
          _IDSWarnV();

          id v60 = objc_msgSend(v24, "guid", v59);
          _IDSLogV();

          objc_msgSend(v24, "guid", v60);
          id v55 = (id)objc_claimAutoreleasedReturnValue();
          _IDSLogTransport();
        }
        objc_msgSend(v24, "guid", v55);
        id v46 = (id)objc_claimAutoreleasedReturnValue();
        double v47 = [v24 alternateGUID];
        +[IDSDMessageStore deleteOutgoingMessageWithGUID:v46 alternateGUID:v47];
LABEL_56:
      }
      id v72 = [v67 countByEnumeratingWithState:&v79 objects:v91 count:16];
    }
    while (v72);
  }

  id v53 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v53, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v53, OS_LOG_TYPE_DEFAULT, "Finished processing stored outgoing messages", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
}

- (void)_handleSpaceBecomingAvailableForUrgentLocalMessagesWithDataProtectionClasses:(id)a3 withMessageTypes:(id)a4
{
  id v5 = a3;
  CFStringRef v6 = (_UNKNOWN **)a4;
  im_assert_primary_base_queue();
  uint64_t v7 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Handling Space Becoming available for urgent local messages", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (!v5)
  {
    +[NSArray arrayWithObjects:](NSArray, "arrayWithObjects:", &off_1009D1ED8, &off_1009D1EF0, &off_1009D1F08, 0);
    id v5 = (id)objc_claimAutoreleasedReturnValue();
  }
  BOOL v8 = &off_1009D2D58;
  long long v35 = 0u;
  long long v36 = 0u;
  if (v6) {
    BOOL v8 = v6;
  }
  unsigned int v25 = v8;
  long long v33 = 0uLL;
  long long v34 = 0uLL;
  id obj = v5;
  id v26 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
  if (v26)
  {
    uint64_t v24 = *(void *)v34;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v34 != v24)
        {
          uint64_t v10 = v9;
          objc_enumerationMutation(obj);
          uint64_t v9 = v10;
        }
        uint64_t v27 = v9;
        CFStringRef v28 = *(void **)(*((void *)&v33 + 1) + 8 * v9);
        id v11 = objc_alloc_init((Class)NSMutableArray);
        long long v12 = +[IDSDMessageStore unsentUrgentAccountUUIDsWithDataProtectionClass:withMessageTypes:](IDSDMessageStore, "unsentUrgentAccountUUIDsWithDataProtectionClass:withMessageTypes:", [v28 intValue], v25);
        long long v31 = 0u;
        long long v32 = 0u;
        long long v29 = 0u;
        long long v30 = 0u;
        id v13 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
        if (v13)
        {
          uint64_t v14 = *(void *)v30;
          do
          {
            for (i = 0; i != v13; i = (char *)i + 1)
            {
              if (*(void *)v30 != v14) {
                objc_enumerationMutation(v12);
              }
              uint64_t v16 = *(void *)(*((void *)&v29 + 1) + 8 * i);
              id v17 = +[IDSDAccountController sharedInstance];
              id v18 = [v17 accountWithUniqueID:v16];

              if (v18)
              {
                int64_t v19 = [v18 service];
                if ([v19 adHocServiceType] == 2)
                {
                }
                else
                {
                  int64_t v20 = [v18 service];
                  BOOL v21 = [v20 adHocServiceType] == 5;

                  if (!v21) {
                    goto LABEL_25;
                  }
                }
                [v11 addObject:v16];
              }
LABEL_25:
            }
            id v13 = [v12 countByEnumeratingWithState:&v29 objects:v38 count:16];
          }
          while (v13);
        }
        -[IDSDaemon _processLocalMessagesWithAccountUUIDs:priority:dataProtectionClass:](self, "_processLocalMessagesWithAccountUUIDs:priority:dataProtectionClass:", v11, 300, [v28 intValue]);

        uint64_t v9 = v27 + 1;
      }
      while ((id)(v27 + 1) != v26);
      id v26 = [obj countByEnumeratingWithState:&v33 objects:v39 count:16];
    }
    while (v26);
  }
}

- (void)_processStoredMessagesIncludingClassD:(BOOL)a3
{
  BOOL v3 = a3;
  +[IDSDMessageStore deletePostponedMessages];
  [(IDSDaemon *)self _processStoredIncomingMessages];
  +[IDSDMessageStore markOutgoingMessagesAsUnsentIncludingClassD:v3];
  [(IDSDaemon *)self _handleSpaceBecomingAvailableForUrgentLocalMessagesWithDataProtectionClasses:0 withMessageTypes:0];
  [(IDSDaemon *)self _updateNonUrgentInternetSendTimer];

  [(IDSDaemon *)self _resourceAvailabilityChangedForIdentifiers:0 priorities:0 dataProtectionClasses:0];
}

- (void)_processMessageError:(BOOL)a3 topLevelMessage:(id)a4 error:(id)a5 messageID:(id)a6 failureReasonMessage:(id)a7 service:(id)a8 serviceType:(id)a9 pushToken:(id)a10 fromURI:(id)a11 toURI:(id)a12 groupID:(id)a13 completionBlock:(id)a14
{
  BOOL v45 = a3;
  id v46 = a4;
  id v53 = a5;
  id v49 = a6;
  id v54 = a7;
  id v50 = a8;
  id v51 = a9;
  id v52 = a10;
  id v18 = a11;
  id v19 = a12;
  id v48 = a13;
  id v20 = a14;
  BOOL v21 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Processing Error", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  unsigned int v22 = [v18 isEqualToURI:v19];
  signed int v23 = [v53 intValue];
  if (+[IDSNGMPublicDeviceIdentity shouldMarkForStateReset:v54])
  {
    uint64_t v24 = +[IDSPushHandler sharedInstanceWithPortName:@"com.apple.identityservicesd.aps"];
    unsigned int v25 = [v24 pushToken];
    id v26 = +[IDSPushToken pushTokenWithData:v25];

    uint64_t v27 = +[IDSEncryptionController sharedInstance];
    CFStringRef v28 = [v50 identifier];
    unsigned int v29 = [v27 markForStateResetWithOurURI:v19 ourPushToken:v26 theirURI:v18 theirPushToken:v52 service:v28];

    long long v30 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
    {
      CFStringRef v31 = @"NO";
      if (v29) {
        CFStringRef v31 = @"YES";
      }
      *(_DWORD *)long long buf = 138412290;
      CFStringRef v60 = v31;
      _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "_processMessageError: IDSEncryptionController did markForStateReset: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      CFStringRef v32 = @"NO";
      if (v29) {
        CFStringRef v32 = @"YES";
      }
      CFStringRef v43 = v32;
      _IDSLogV();
    }
  }
  if (-[IDSDaemon _shouldForgetCachedPeerTokensForIncomingRemoteDecryptionErrorType:](self, "_shouldForgetCachedPeerTokensForIncomingRemoteDecryptionErrorType:", v23, v43))
  {
    long long v33 = +[IDSPeerIDManager sharedInstance];
    [v33 forgetPeerTokensForURI:v18 fromURI:v19 service:v51];
  }
  BOOL v34 = [(IDSDaemon *)self _shouldDropMessageForIncomingErrorMessageWithDecryptionErrorType:v23];
  if (v23 > 499)
  {
    if (v23 > 799)
    {
      switch(v23)
      {
        case 800:
          long long v35 = +[IDSDGroupContextController sharedInstance];
          v55[0] = _NSConcreteStackBlock;
          v55[1] = 3221225472;
          v55[2] = sub_1003A9978;
          v55[3] = &unk_10098AE08;
          id v56 = v48;
          id v57 = v20;
          BOOL v58 = v34;
          [v35 groupContextForProtectionSpace:0 withCompletion:v55];

          break;
        case 801:
        case 804:
          goto LABEL_90;
        case 802:
          long long v38 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Got an incoming error of type IDSEncryptionErrorTypeEngramStaleGroupDecryptionFailure -- this is unexpected", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
          break;
        case 803:
          if (_IMWillLog()) {
            _IMAlwaysLog();
          }
          goto LABEL_90;
        default:
          goto LABEL_91;
      }
      goto LABEL_92;
    }
    switch(v23)
    {
      case 500:
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
        goto LABEL_90;
      case 600:
        if (_IMWillLog())
        {
          id v44 = v49;
          _IMAlwaysLog();
        }
        if (!v22 || v45)
        {
          long long v39 = +[IDSEncryptionController sharedInstance];
          [v39 logRemoteDecryptionErrorForToken:v52 deviceID:0 forURI:v18 fromURI:v19 forService:v51 messageData:0 type:1];
        }
        goto LABEL_90;
      case 601:
        if (_IMWillLog())
        {
          id v44 = v49;
          _IMAlwaysLog();
        }
        if (!v22 || v45)
        {
          long long v36 = +[IDSEncryptionController sharedInstance];
          [v36 logRemoteDecryptionErrorForToken:v52 deviceID:0 forURI:v18 fromURI:v19 forService:v51 messageData:0 type:1];
        }
LABEL_90:
        (*((void (**)(id, void, void, BOOL))v20 + 2))(v20, 0, 0, v34);
        goto LABEL_92;
    }
    goto LABEL_91;
  }
  if (v23 <= 200)
  {
    switch(v23)
    {
      case 0:
        if (_IMWillLog()) {
          _IMAlwaysLog();
        }
        goto LABEL_90;
      case 120:
        if (_IMWillLog())
        {
          id v44 = v49;
          _IMAlwaysLog();
        }
        if (!v22 || v45)
        {
          CFStringRef v41 = +[IDSEncryptionController sharedInstance];
          [v41 logRemoteDecryptionErrorForToken:v52 deviceID:0 forURI:v18 fromURI:v19 forService:v51 messageData:0 type:0];
        }
        goto LABEL_90;
      case 200:
        if (_IMWillLog())
        {
          id v44 = v49;
          _IMAlwaysLog();
        }
        if (!v22 || v45)
        {
          id v37 = +[IDSEncryptionController sharedInstance];
          [v37 logRemoteDecryptionErrorForToken:v52 deviceID:0 forURI:v18 fromURI:v19 forService:v51 messageData:0 type:1];
        }
        goto LABEL_90;
    }
    goto LABEL_91;
  }
  if (v23 > 249)
  {
    if (v23 == 250)
    {
      if (_IMWillLog())
      {
        id v44 = v49;
        _IMAlwaysLog();
      }
      if (!v22 || v45)
      {
        unsigned int v42 = +[IDSEncryptionController sharedInstance];
        [v42 logRemoteDecryptionErrorForToken:v52 deviceID:0 forURI:v18 fromURI:v19 forService:v51 messageData:0 type:1];
      }
      goto LABEL_90;
    }
    if (v23 == 400)
    {
      if (_IMWillLog()) {
        _IMAlwaysLog();
      }
      goto LABEL_90;
    }
    goto LABEL_91;
  }
  if (v23 == 201)
  {
    if (_IMWillLog())
    {
      id v44 = v49;
      _IMAlwaysLog();
    }
    if (!v22 || v45)
    {
      id v40 = +[IDSEncryptionController sharedInstance];
      [v40 logRemoteDecryptionErrorForToken:v52 deviceID:0 forURI:v18 fromURI:v19 forService:v51 messageData:0 type:1];
    }
    goto LABEL_90;
  }
  if (v23 != 202)
  {
LABEL_91:
    _IMWarn();
    (*((void (**)(id, void, void, BOOL))v20 + 2))(v20, 0, 0, v34);
    goto LABEL_92;
  }
  if (_IMWillLog())
  {
    id v44 = v49;
    _IMAlwaysLog();
  }
  +[IDSDMessageStore deleteIncomingMessageWithGUID:](IDSDMessageStore, "deleteIncomingMessageWithGUID:", v49, v44);
  (*((void (**)(id, void, void, BOOL))v20 + 2))(v20, 0, 0, v34);
LABEL_92:
}

- (id)_payloadFromDecryptedData:(id)a3
{
  id v3 = a3;
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v4 = v3;
  }
  else
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = [v3 _FTOptionallyDecompressData];
      JWDecodeDictionary();
      id v4 = (id)objc_claimAutoreleasedReturnValue();
      if (![v4 count])
      {
        uint64_t v6 = JWDecodeDictionary();

        id v4 = (id)v6;
      }
    }
    else
    {
      id v4 = 0;
    }
  }
  v24[0] = IDSMessageResourceTransferSandboxExtensionKey;
  v24[1] = IDSMessageResourceTransferURLKey;
  v24[2] = IDSMessageResourceTransferMetadataKey;
  +[NSArray arrayWithObjects:v24 count:3];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v7 = (id)objc_claimAutoreleasedReturnValue();
  id v8 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  if (!v8)
  {
    id v10 = 0;
    uint64_t v16 = v7;
    goto LABEL_22;
  }
  id v9 = v8;
  id v10 = 0;
  uint64_t v11 = *(void *)v20;
  do
  {
    for (i = 0; i != v9; i = (char *)i + 1)
    {
      if (*(void *)v20 != v11) {
        objc_enumerationMutation(v7);
      }
      uint64_t v13 = *(void *)(*((void *)&v19 + 1) + 8 * i);
      uint64_t v14 = objc_msgSend(v4, "objectForKey:", v13, (void)v19);

      if (v14)
      {
        if (!v10) {
          id v10 = [v4 mutableCopy];
        }
        [v10 removeObjectForKey:v13];
      }
    }
    id v9 = [v7 countByEnumeratingWithState:&v19 objects:v23 count:16];
  }
  while (v9);

  if (v10)
  {
    id v15 = [v10 copy];
    uint64_t v16 = v4;
    id v4 = v15;
LABEL_22:
  }
  id v17 = v4;

  return v17;
}

+ (BOOL)_commandIsSessionCommand:(int64_t)a3
{
  if (qword_100A4C8C0 != -1) {
    dispatch_once(&qword_100A4C8C0, &stru_10098AE28);
  }
  id v4 = (void *)qword_100A4C8B8;
  id v5 = +[NSNumber numberWithInteger:a3];
  LOBYTE(v4) = [v4 containsObject:v5];

  return (char)v4;
}

+ (BOOL)_commandIsSessionGroupSessionCommand:(int64_t)a3
{
  if (qword_100A4C8D0 != -1) {
    dispatch_once(&qword_100A4C8D0, &stru_10098AE48);
  }
  id v4 = (void *)qword_100A4C8C8;
  id v5 = +[NSNumber numberWithInteger:a3];
  LOBYTE(v4) = [v4 containsObject:v5];

  return (char)v4;
}

- (BOOL)_processNonMessagingPayloadWithCommand:(id)a3 dictionaryPayload:(id)a4 senderPushToken:(id)a5 topic:(id)a6 toURI:(id)a7 fromURI:(id)a8 peerResponseIdentifier:(id)a9 guid:(id)a10 service:(id)a11 idsMessageContext:(id)a12 messageContext:(id)a13
{
  id v18 = a3;
  id v19 = a4;
  id v20 = a5;
  id v71 = a6;
  id v69 = a7;
  id v72 = a8;
  id v68 = a9;
  id v64 = a10;
  id v65 = a11;
  id v70 = a12;
  id v21 = a13;
  id v22 = v21;
  if (v18)
  {
    if (!v21)
    {
      id v22 = objc_alloc_init((Class)IMMessageContext);
      [v22 setShouldBoost:1];
    }
    signed int v23 = (char *)[v18 integerValue];
    unsigned int v24 = +[IDSDaemon _commandIsSessionCommand:v23];
    unsigned int v25 = v23 - 232;
    id v26 = v20;
    if (v23 == (char *)232 || !v24) {
      goto LABEL_9;
    }
    uint64_t v27 = objc_opt_class();
    CFStringRef v28 = sub_1002B4B18(v27, v19, IDSDSessionMessageSessionID);
    if ([v28 length])
    {
      unsigned int v29 = +[IDSDSessionController sharedInstance];
      long long v30 = [v29 sessionWithUniqueID:v28];

      if (v30)
      {

LABEL_9:
        BOOL v31 = 0;
        switch((unint64_t)v23)
        {
          case 0xE8uLL:
            CFStringRef v32 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_DEFAULT))
            {
              long long v33 = IDSLoggableDescriptionForObjectOnService();
              *(_DWORD *)long long buf = 138412546;
              id v80 = v72;
              __int16 v81 = 2112;
              id v82 = v33;
              _os_log_impl((void *)&_mh_execute_header, v32, OS_LOG_TYPE_DEFAULT, "Received session invitation fromID %@, processing message %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              IDSLoggableDescriptionForObjectOnService();
              v61 = id v60 = v72;
              _IDSLogV();
            }
            CFStringRef v28 = +[IDSDSessionController sharedInstance];
            [v28 processIncomingInvitationWithPayload:v19 topic:v71 fromToken:v20 fromURI:v72 toURI:v69 idsMessageContext:v70 messageContext:v22];
            goto LABEL_80;
          case 0xE9uLL:
            long long v38 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
            {
              long long v39 = IDSLoggableDescriptionForObjectOnService();
              *(_DWORD *)long long buf = 138412546;
              id v80 = v72;
              __int16 v81 = 2112;
              id v82 = v39;
              _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "Received accept response fromID %@, processing message %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              IDSLoggableDescriptionForObjectOnService();
              v61 = id v60 = v72;
              _IDSLogV();
            }
            CFStringRef v28 = +[IDSDSessionController sharedInstance];
            [v28 processIncomingSessionAcceptMessage:v19 fromToken:v20 fromURI:v72 idsMessageContext:v70];
            goto LABEL_80;
          case 0xEAuLL:
            id v40 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_DEFAULT))
            {
              CFStringRef v41 = IDSLoggableDescriptionForObjectOnService();
              *(_DWORD *)long long buf = 138412546;
              id v80 = v72;
              __int16 v81 = 2112;
              id v82 = v41;
              _os_log_impl((void *)&_mh_execute_header, v40, OS_LOG_TYPE_DEFAULT, "Received decline response fromID %@, processing message %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              IDSLoggableDescriptionForObjectOnService();
              v61 = id v60 = v72;
              _IDSLogV();
            }
            CFStringRef v28 = +[IDSDSessionController sharedInstance];
            [v28 processIncomingSessionDeclineMessage:v19 fromToken:v20 fromURI:v72 idsMessageContext:v70];
            goto LABEL_80;
          case 0xEBuLL:
            unsigned int v42 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v42, OS_LOG_TYPE_DEFAULT))
            {
              CFStringRef v43 = IDSLoggableDescriptionForObjectOnService();
              *(_DWORD *)long long buf = 138412546;
              id v80 = v72;
              __int16 v81 = 2112;
              id v82 = v43;
              _os_log_impl((void *)&_mh_execute_header, v42, OS_LOG_TYPE_DEFAULT, "Received cancel response fromID %@, processing message %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              IDSLoggableDescriptionForObjectOnService();
              v61 = id v60 = v72;
              _IDSLogV();
            }
            CFStringRef v28 = +[IDSDSessionController sharedInstance];
            [v28 processIncomingSessionCancelMessage:v19 fromToken:v20 fromURI:v72 idsMessageContext:v70];
            goto LABEL_80;
          case 0xECuLL:
            id v44 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
            {
              BOOL v45 = IDSLoggableDescriptionForObjectOnService();
              *(_DWORD *)long long buf = 138412546;
              id v80 = v72;
              __int16 v81 = 2112;
              id v82 = v45;
              _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Received session message fromID %@, processing message %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              IDSLoggableDescriptionForObjectOnService();
              v61 = id v60 = v72;
              _IDSLogV();
            }
            CFStringRef v28 = +[IDSDSessionController sharedInstance];
            [v28 processIncomingSessionMessage:v19 fromToken:v20 fromURI:v72 idsMessageContext:v70];
            goto LABEL_80;
          case 0xEDuLL:
            id v46 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v46, OS_LOG_TYPE_DEFAULT))
            {
              double v47 = IDSLoggableDescriptionForObjectOnService();
              *(_DWORD *)long long buf = 138412546;
              id v80 = v72;
              __int16 v81 = 2112;
              id v82 = v47;
              _os_log_impl((void *)&_mh_execute_header, v46, OS_LOG_TYPE_DEFAULT, "Received session end message fromID %@, processing message %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              IDSLoggableDescriptionForObjectOnService();
              v61 = id v60 = v72;
              _IDSLogV();
            }
            CFStringRef v28 = +[IDSDSessionController sharedInstance];
            [v28 processIncomingSessionEndMessage:v19 fromToken:v20 fromURI:v72 idsMessageContext:v70];
            goto LABEL_80;
          case 0xEEuLL:
            id v51 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              id v52 = IDSLoggableDescriptionForObjectOnService();
              *(_DWORD *)long long buf = 138412546;
              id v80 = v72;
              __int16 v81 = 2112;
              id v82 = v52;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Received session reinitiate message fromID %@, processing message %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              IDSLoggableDescriptionForObjectOnService();
              v61 = id v60 = v72;
              _IDSLogV();
            }
            CFStringRef v28 = +[IDSDSessionController sharedInstance];
            [v28 processIncomingSessionReinitiateMessage:v19 fromToken:v20 fromURI:v72 idsMessageContext:v70];
            goto LABEL_80;
          case 0xEFuLL:
            goto LABEL_18;
          case 0xF0uLL:
          case 0xF1uLL:
          case 0xF2uLL:
          case 0xF3uLL:
            goto LABEL_81;
          case 0xF4uLL:
            CFMutableDictionaryRef theDict = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
            CFStringRef v66 = [v20 rawToken];
            id v48 = [v66 length];
            if (v48
              && ([v72 prefixedURI],
                  unsigned int v25 = (char *)objc_claimAutoreleasedReturnValue(),
                  [v25 length]))
            {
              id v49 = [v20 rawToken];
              id v50 = [v72 prefixedURI];
              CFStringRef v28 = (void *)_IDSCopyIDForTokenWithURI();
            }
            else
            {
              CFStringRef v28 = [v72 prefixedURI];
              if (!v48) {
                goto LABEL_75;
              }
            }

LABEL_75:
            id v53 = +[IDSURI URIWithPrefixedURI:v28 withServiceLoggingHint:v71];
            if (v28) {
              CFDictionarySetValue(theDict, IDSMessageContextFromIDKey, v28);
            }
            id v54 = (const void *)IDSMessageContextFromServerStorageKey;
            id v55 = [v70 objectForKey:IDSMessageContextFromServerStorageKey];
            if (v55) {
              CFDictionarySetValue(theDict, v54, v55);
            }

            v73[0] = _NSConcreteStackBlock;
            v73[1] = 3221225472;
            v73[2] = sub_1003AAFDC;
            v73[3] = &unk_100981B28;
            id v74 = v68;
            id v75 = v71;
            id v76 = v69;
            id v77 = v53;
            id v78 = theDict;
            uint64_t v56 = kIDSMessagingEntitlement;
            uint64_t v57 = kIDSListenerCapConsumesLaunchOnDemandOutgoingMessageUpdates;
            id v67 = theDict;
            id v58 = v53;
            [(IDSDaemon *)self enqueueBroadcast:v73 forTopic:v75 entitlement:v56 command:0 capabilities:v57 messageContext:v22];

            break;
          default:
            if ((unint64_t)(v23 - 206) >= 6) {
              goto LABEL_81;
            }
LABEL_18:
            BOOL v34 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              long long v35 = IDSLoggableDescriptionForObjectOnService();
              *(_DWORD *)long long buf = 138412546;
              id v80 = v72;
              __int16 v81 = 2112;
              id v82 = v35;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Received group session message fromID %@, processing message %@", buf, 0x16u);
            }
            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              IDSLoggableDescriptionForObjectOnService();
              v61 = id v60 = v72;
              _IDSLogV();
            }
            CFStringRef v28 = +[IDSDSessionController sharedInstance];
            [v28 processIncomingGroupSessionMessage:v19 fromToken:v20 fromURI:v72 toURI:v69 topic:v71 idsMessageContext:v70];
            goto LABEL_80;
        }
        goto LABEL_80;
      }
      id v37 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v80 = v28;
        __int16 v81 = 2112;
        id v82 = v18;
        _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Couldn't find session with ID %@ for command code %@, discarding message...", buf, 0x16u);
      }

      if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
        goto LABEL_80;
      }
    }
    else
    {
      long long v36 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v80 = v18;
        _os_log_impl((void *)&_mh_execute_header, v36, OS_LOG_TYPE_DEFAULT, "No session ID provided in the message for command code %@, discarding message...", buf, 0xCu);
      }

      if (!os_log_shim_legacy_logging_enabled() || !_IDSShouldLog()) {
        goto LABEL_80;
      }
    }
    _IDSLogV();
LABEL_80:

    BOOL v31 = 1;
    goto LABEL_81;
  }
  BOOL v31 = 0;
  id v26 = v20;
LABEL_81:

  return v31;
}

- (BOOL)_doesNiceMessageContainValidCombination:(id)a3
{
  id v3 = a3;
  id v4 = [v3 originalCommand];
  id v5 = [v3 command];
  uint64_t v6 = v5;
  if (v4 && ([v5 isEqualToNumber:&off_1009D2100] & 1) == 0)
  {
    id v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR))
    {
      *(_WORD *)id v10 = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_ERROR, "We received an IDS Message that had an original command key, however its command was not FTCommandIDAttachmentMessage", v10, 2u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    BOOL v7 = 0;
  }
  else
  {
    BOOL v7 = 1;
  }

  return v7;
}

- (id)_validAccountForIncomingMessageSentToURI:(id)a3 service:(id)a4 outPseudonym:(id *)a5
{
  id v7 = a3;
  id v8 = a4;
  id v9 = [(IDSDaemon *)self accountController];
  long long v36 = v8;
  id v10 = [v9 accountsOnService:v8];

  long long v42 = 0u;
  long long v43 = 0u;
  long long v40 = 0u;
  long long v41 = 0u;
  id obj = v10;
  id v11 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
  if (v11)
  {
    id v12 = v11;
    uint64_t v13 = 0;
    uint64_t v39 = *(void *)v41;
LABEL_3:
    uint64_t v14 = 0;
    while (1)
    {
      if (*(void *)v41 != v39) {
        objc_enumerationMutation(obj);
      }
      id v15 = *(void **)(*((void *)&v40 + 1) + 8 * v14);
      uint64_t v16 = +[IMIDSLog daemon];
      if (os_log_type_enabled(v16, OS_LOG_TYPE_DEBUG))
      {
        CFStringRef v32 = [v15 uniqueID];
        long long v33 = [v15 unprefixedURIStringsFromRegistration];
        BOOL v34 = [v15 aliases];
        *(_DWORD *)long long buf = 138413058;
        id v45 = v7;
        __int16 v46 = 2112;
        double v47 = v32;
        __int16 v48 = 2112;
        id v49 = v33;
        __int16 v50 = 2112;
        id v51 = v34;
        _os_log_debug_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEBUG, "Checking if this message corresponds to a selected alias {toURI: %@, accountUniqueID: %@, aliasStrings: %@, aliases: %@}", buf, 0x2Au);
      }
      id v17 = [v15 unprefixedURIStringsFromRegistration];
      id v18 = [v7 unprefixedURI];
      unsigned int v19 = [v17 containsObject:v18];

      id v20 = [v15 aliases];
      id v21 = [v7 unprefixedURI];
      unsigned int v22 = [v20 containsObject:v21] ? objc_msgSend(v15, "isEnabled") : 0;

      signed int v23 = [v15 dsHandle];
      unsigned int v24 = [v7 prefixedURI];
      unsigned int v25 = [v23 isEqualToString:v24];

      id v26 = [v7 prefixedURI];
      LODWORD(v23) = [v26 _appearsToBePseudonymID];

      if (v23)
      {
        uint64_t v27 = [v7 prefixedURI];
        CFStringRef v28 = [v15 pseudonymForPseudonymURIString:v27];

        BOOL v29 = v28 != 0;
        if (a5 && v28) {
          *a5 = v28;
        }
      }
      else
      {
        BOOL v29 = 0;
      }
      if (((v19 | v22 | v25) & 1) != 0 || v29)
      {
        id v30 = v15;

        BOOL v31 = [v30 accountType] != 2 || v29;
        uint64_t v13 = v30;
        if (v31) {
          break;
        }
      }
      if (v12 == (id)++v14)
      {
        id v12 = [obj countByEnumeratingWithState:&v40 objects:v52 count:16];
        id v30 = v13;
        if (v12) {
          goto LABEL_3;
        }
        break;
      }
    }
  }
  else
  {
    id v30 = 0;
  }

  return v30;
}

- (BOOL)_shouldRejectMessageOnCrossAccountService:(id)a3 fromSenderURI:(id)a4
{
  id v6 = a4;
  if ([a3 tinkerMessagingOnly])
  {
    id v7 = [(IDSDaemon *)self pairingManager];
    id v8 = [v7 pairedDeviceHandlesWithPairingType:1];

    id v9 = [v6 prefixedURI];
    unsigned __int8 v10 = [v8 containsObject:v9];

    char v11 = v10 ^ 1;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)_shouldRejectMessageOnFamilyService:(id)a3 fromSenderURI:(id)a4
{
  id v6 = a4;
  if ([a3 isFamilyService])
  {
    id v7 = [(IDSDaemon *)self familyManager];
    id v8 = [v7 familyHandles];
    id v9 = [v6 unprefixedURI];
    unsigned __int8 v10 = [v8 containsObject:v9];

    char v11 = v10 ^ 1;
  }
  else
  {
    char v11 = 0;
  }

  return v11;
}

- (BOOL)_primaryAccountExistsForService:(id)a3 withURI:(id)a4
{
  id v6 = a4;
  id v7 = a3;
  id v8 = [(IDSDaemon *)self accountController];
  id v9 = [v8 accountsOnService:v7];

  if (v9 && [v9 count])
  {
    unsigned __int8 v10 = [v9 firstObject];
    char v11 = [v10 primaryAccount];

    id v12 = [v11 service];
    uint64_t v13 = [(IDSDaemon *)self accountController];
    uint64_t v14 = [v6 prefixedURI];
    id v15 = [v13 accountOnService:v12 withAliasURI:v14];

    BOOL v16 = v15 != 0;
  }
  else
  {
    BOOL v16 = 0;
  }

  return v16;
}

- (BOOL)firewallDatabaseAllowsFromURI:(id)a3 mergeID:(id)a4 service:(id)a5
{
  id v7 = a3;
  id v8 = a5;
  id v9 = a4;
  id v10 = [objc_alloc((Class)IDSFirewallEntry) initWithURI:v7 andLastSeenDate:0];
  [v10 setMergeID:v9];

  char v11 = +[IDSFirewallStore sharedInstance];
  id v12 = [v8 controlCategory];

  LOBYTE(v12) = [v11 isAllowed:v10 category:v12];
  if (v12)
  {
    BOOL v13 = 1;
  }
  else
  {
    uint64_t v14 = [v7 prefixedURI];
    BOOL v13 = +[IMUserDefaults handleInFirewallAllowList:v14];
  }
  return v13;
}

- (BOOL)isFirewallOn
{
  return +[IMUserDefaults isFirewallEnabled];
}

- (BOOL)isFirewallEnabledForService:(id)a3
{
  id v3 = a3;
  if (+[IMUserDefaults shouldFirewallDropForAllCategories])
  {
    unsigned __int8 v4 = [v3 allowCrossAccountMessages];
  }
  else
  {
    unsigned __int8 v4 = [v3 isFirewallEnabled];
  }
  BOOL v5 = v4;

  return v5;
}

- (BOOL)isFirewallOnForService:(id)a3
{
  id v4 = a3;
  if ([(IDSDaemon *)self isFirewallOn]) {
    BOOL v5 = [(IDSDaemon *)self isFirewallEnabledForService:v4];
  }
  else {
    BOOL v5 = 0;
  }

  return v5;
}

- (BOOL)shouldFirewallDropMessageForFromURI:(id)a3 mergeID:(id)a4 service:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  if ([(IDSDaemon *)self isFirewallOnForService:v10]
    && ![(IDSDaemon *)self isMessageFromSelfForFromURI:v8 service:v10])
  {
    unsigned int v11 = ![(IDSDaemon *)self firewallDatabaseAllowsFromURI:v8 mergeID:v9 service:v10];
  }
  else
  {
    LOBYTE(v11) = 0;
  }

  return v11;
}

- (void)noteBlockedMessageFromURI:(id)a3 service:(id)a4
{
  id v5 = a4;
  id v6 = a3;
  id v9 = [objc_alloc((Class)IDSFirewallEntry) initWithURI:v6 andLastSeenDate:0];

  id v7 = +[IDSFirewallStore sharedInstance];
  id v8 = [v5 controlCategory];

  [v7 addToBlockedList:v9 forCategory:v8];
}

- (int64_t)_cleanupFrequencyForRestrictedMessages
{
  id v2 = +[IDSServerBag sharedInstance];
  id v3 = [v2 objectForKey:@"cleanup_frequency_for_expired_restricted_messages"];

  if (v3 && (objc_opt_class(), (objc_opt_isKindOfClass() & 1) != 0))
  {
    id v4 = v3;
    [v4 doubleValue];
    double v6 = v5;
    id v7 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 134217984;
      double v11 = v6;
      _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with %f sec cleanupFrequencyForRestrictedMessages", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }

    int64_t v8 = (uint64_t)v6;
  }
  else
  {
    int64_t v8 = 600;
  }

  return v8;
}

- (int64_t)_expirationTimeForRestrictedMessages
{
  id v2 = +[IDSServerBag sharedInstance];
  id v3 = [v2 objectForKey:@"expiration_time_for_blocked_restricted_messages"];

  double v4 = 300.0;
  if (v3)
  {
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      id v5 = v3;
      [v5 doubleValue];
      double v4 = v6;
      id v7 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 134217984;
        double v15 = v4;
        _os_log_impl((void *)&_mh_execute_header, v7, OS_LOG_TYPE_DEFAULT, "Server Bag provided us with %f sec expirationTimeForRestrictedMessages", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        double v13 = v4;
        _IDSLogV();
      }
    }
  }
  int64_t v8 = +[NSDate now];
  id v9 = [v8 dateByAddingTimeInterval:v4];
  [v9 timeIntervalSince1970];
  double v11 = v10;

  return (uint64_t)v11;
}

- (BOOL)isMessageFromSelfForFromURI:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  int64_t v8 = [(IDSDaemon *)self accountController];
  id v9 = [v6 prefixedURI];
  double v10 = [v8 accountOnService:v7 withAliasURI:v9];

  if (v10) {
    goto LABEL_2;
  }
  id v12 = [(IDSDaemon *)self accountController];
  double v13 = [v6 unprefixedURI];
  double v10 = [v12 accountOnService:v7 withVettedAliasURI:v13];

  if ([v10 shouldAutoRegisterAllHandles])
  {

LABEL_6:
    BOOL v11 = [(IDSDaemon *)self _primaryAccountExistsForService:v7 withURI:v6];
    double v10 = 0;
    goto LABEL_7;
  }
  if (!v10) {
    goto LABEL_6;
  }
LABEL_2:
  BOOL v11 = 1;
LABEL_7:

  return v11;
}

- (void)queryHashForceUpdate:(id)a3 fromURI:(id)a4 messageUUID:(id)a5 updateHash:(id)a6 toURI:(id)a7 service:(id)a8
{
  id v20 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a6;
  id v17 = a7;
  id v18 = a8;
  BOOL v19 = [v20 unsignedIntegerValue] == (id)101
     && +[IMUserDefaults forceFlushOnDeliveryReceipt];
  if (+[IDSRegistrationCacheStateTransportPolicy shouldHandleMessageWithUpdateHash:v16 command:v20]|| v19)
  {
    [(IDSRegistrationHashProcessor *)self->_queryUpdateNotifier handleRegistrationUpdateForHash:v16 localURI:v17 remoteURI:v14 service:v18 guid:v15 forceUpdate:v19];
  }
}

- (void)_processKTPeerUpdateMessageForService:(id)a3 localURI:(id)a4 remoteURI:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  BOOL v11 = v10;
  if (v8 && v9 && v10)
  {
    id v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)long long buf = 138412802;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v9;
      __int16 v34 = 2112;
      long long v35 = v11;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Processing KTPeerUpdateMessage { service: %@ localURI: %@ remoteURI: %@ }", buf, 0x20u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v27 = v9;
      BOOL v29 = v11;
      id v25 = v8;
      _IDSLogV();
    }
    double v13 = +[IDSIDStatusQueryController sharedInstance];
    [v13 removeCachedIDStatusForURI:v11 service:v8];

    id v14 = +[IDSPeerIDManager sharedInstance];
    [v14 forgetPeerTokensForURI:v11 service:v8];

    id v15 = +[IDSKeyTransparencyVerifier sharedInstance];
    [v15 clearTransparencyCacheForService:v8 peerURI:v11];

    id v16 = [(IDSDaemon *)self serviceController];
    id v17 = [v16 serviceWithIdentifier:v8];

    if (v17)
    {
      id v18 = +[IDSDaemon sharedInstance];
      BOOL v19 = [v17 pushTopic];
      id v20 = objc_alloc_init((Class)IMMessageContext);
      id v21 = [v18 broadcasterForTopic:v19 ignoreServiceListener:1 messageContext:v20];

      unsigned int v22 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412546;
        id v31 = v8;
        __int16 v32 = 2112;
        id v33 = v11;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Broadcasting didFlushCacheFromKTPeerUpdateForService { service: %@ peerURI: %@ }", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
      {
        id v26 = v8;
        CFStringRef v28 = v11;
        _IDSLogV();
      }
      signed int v23 = objc_msgSend(v11, "prefixedURI", v26, v28);
      [v21 didFlushCacheFromKTPeerUpdateForService:v8 peerURI:v23];
    }
    else
    {
      unsigned int v24 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v24, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138412290;
        id v31 = v8;
        _os_log_impl((void *)&_mh_execute_header, v24, OS_LOG_TYPE_DEFAULT, "No idsService registered for %@ -- not broadcasting didFlushCacheFromKTPeerUpdateForService", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
}

- (void)_processIncomingRemoteNiceMessage:(id)a3 forTopic:(id)a4 fromURI:(id)a5 storedGuid:(id)a6 messageContext:(id)a7
{
  id v11 = a3;
  id v12 = (uint64_t (*)(uint64_t, uint64_t))a4;
  double v13 = (uint64_t (*)(uint64_t, uint64_t))a5;
  id v14 = a6;
  id v15 = a7;
  state.opaque[1] = 0xAAAAAAAAAAAAAAAALL;
  id v190 = _os_activity_create((void *)&_mh_execute_header, "Incoming remote message", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
  state.opaque[0] = 0xAAAAAAAAAAAAAAAALL;
  os_activity_scope_enter(v190, &state);
  id v16 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138413314;
    *(void *)&uint8_t buf[4] = v11;
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v13;
    *(_WORD *)&unsigned char buf[22] = 2112;
    int v192 = v12;
    *(_WORD *)v193 = 2112;
    *(void *)&v193[2] = v14;
    *(_WORD *)&v193[10] = 2112;
    *(void *)&v193[12] = @"YES";
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "_processIncomingRemoteMessage: %@ fromID: %@ forTopic: %@ storedGUID %@ IDSXAccountBlastdoor %@", buf, 0x34u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v109 = v14;
    CFStringRef v112 = @"YES";
    long long v101 = v13;
    id v106 = v12;
    id v93 = v11;
    _IDSLogV();
  }
  id v17 = +[IMLockdownManager sharedInstance];
  if ([v17 isInternalInstall])
  {
    unsigned int v18 = [v12 isEqualToString:@"com.apple.madrid"];

    if (v18 && +[IMUserDefaults isDroppingMadridMessages])
    {
      +[IDSDMessageStore deleteIncomingMessageWithGUID:v14];
      BOOL v19 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)long long buf = 138413058;
        *(void *)&uint8_t buf[4] = v11;
        *(_WORD *)&unsigned char buf[12] = 2112;
        *(void *)&buf[14] = v13;
        *(_WORD *)&unsigned char buf[22] = 2112;
        int v192 = v12;
        *(_WORD *)v193 = 2112;
        *(void *)&v193[2] = v14;
        _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "DROPPING MADRID MESSAGE: %@ fromID: %@ forTopic: %@ storedGUID %@", buf, 0x2Au);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      goto LABEL_64;
    }
  }
  else
  {
  }
  if (!v12)
  {
    +[IDSDMessageStore deleteIncomingMessageWithGUID:v14];
    goto LABEL_64;
  }
  if (([v12 isEqualToString:IDSStewieT911Topic] & 1) == 0
    && ([v12 isEqualToString:IDSStewieT911RSATopic] & 1) == 0)
  {
    id v20 = [(IDSDaemon *)self serviceController];
    BOOL v151 = [v20 serviceWithPushTopic:v12];

    if (!v151)
    {
      id v21 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)long long buf = 138412290;
        *(void *)&uint8_t buf[4] = v12;
        _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_ERROR, "Found no service for topic! %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        id v94 = v12;
        _IDSLogTransport();
      }
    }
    objc_msgSend(v11, "pushUUID", v94);
    long long v150 = (uint64_t (*)(uint64_t, uint64_t))objc_claimAutoreleasedReturnValue();
    if (![v12 isEqualToString:IDSServiceNameiMessageLite]
      || ([v11 command],
          unsigned int v22 = objc_claimAutoreleasedReturnValue(),
          BOOL v23 = [v22 integerValue] == (id)100,
          v22,
          !v23))
    {
      char v29 = 0;
      goto LABEL_55;
    }
    id v24 = objc_alloc((Class)NSMutableDictionary);
    id v25 = [v11 rawMessage];
    CFMutableDictionaryRef theDict = (CFMutableDictionaryRef)[v24 initWithDictionary:v25];

    long long v148 = [v11 receiverShortHandle];
    id v26 = [v11 toURI];
    if (v26)
    {
      id v27 = [v11 toURI];
      CFStringRef v28 = [v27 prefixedURI];
      if ([v28 length])
      {

LABEL_35:
        goto LABEL_36;
      }

      if (!v148) {
        goto LABEL_36;
      }
    }
    else if (!v148)
    {
LABEL_36:
      BOOL v146 = [v11 senderShortHandle];
      if (v13)
      {
        id v31 = [v13 prefixedURI];
        if ([v31 length])
        {
          __int16 v32 = v13;
LABEL_44:

          goto LABEL_45;
        }

        if (!v146)
        {
          __int16 v32 = v13;
          goto LABEL_45;
        }
      }
      else if (!v146)
      {
        __int16 v32 = 0;
LABEL_45:
        id v34 = [objc_alloc((Class)IDSIncomingNiceMessage) initWithMessageDictionary:theDict topic:v12];

        long long v35 = [v34 senderPushToken];
        long long v36 = [v34 toURI];
        id v37 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138413058;
          *(void *)&uint8_t buf[4] = v36;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v148;
          *(_WORD *)&unsigned char buf[22] = 2112;
          int v192 = v32;
          *(_WORD *)v193 = 2112;
          *(void *)&v193[2] = v146;
          _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Incoming iML, gathering full handles toURI: %@, receiverShortHandle: %@, fromURI: %@, senderShortHandle: %@", buf, 0x2Au);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          id v107 = v32;
          __int16 v110 = v146;
          id v95 = v36;
          long long v102 = v148;
          _IDSLogV();
        }
        if (v35 && v36 && v32)
        {
          long long v38 = im_primary_queue();
          block[0] = _NSConcreteStackBlock;
          block[1] = 3221225472;
          block[2] = sub_1003AE7E4;
          block[3] = &unk_10097E5A8;
          void block[4] = self;
          id v186 = v35;
          id v187 = v36;
          v188 = v32;
          dispatch_async(v38, block);
        }
        char v29 = 1;
        double v13 = v32;
        id v11 = v34;
LABEL_55:
        if (-[IDSDaemon _shouldRejectMessageOnCrossAccountService:fromSenderURI:](self, "_shouldRejectMessageOnCrossAccountService:fromSenderURI:", v151, v13, v95, v102, v107, v110))
        {
          uint64_t v39 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v150;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v13;
            _os_log_impl((void *)&_mh_execute_header, v39, OS_LOG_TYPE_DEFAULT, "Message %@ is coming from an account that is not permited to send to this device. Sender Was: %@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v96 = v150;
            __int16 v103 = v13;
            _IDSLogV();
          }
          [(objc_class *)[(IDSDaemon *)self _messageStoreClass] deleteIncomingMessageWithGUID:v14];
          id v40 = [objc_alloc((Class)IDSMissingMessageMetric) initWithReason:702 guid:v150 service:v12 additionalInformation:0];
          +[IDSMissingMessageMetricReporter sendMetric:v40];
          [(IDSDaemon *)self _sendCertifiedDeliveryReceiptIfNeededForNiceMessage:v11 service:v12 failureReason:&off_1009D2118 failureReasonMessage:0 generateDeliveryReceipt:0];
          goto LABEL_62;
        }
        if (sub_1004039F4(v13))
        {
          long long v41 = [(IDSDaemon *)self accountController];
          long long v42 = [v13 prefixedURI];
          long long v43 = [v41 accountOnService:v151 withAliasURI:v42];

          if (!v43)
          {
            id v51 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v51, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412546;
              *(void *)&uint8_t buf[4] = v150;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v13;
              _os_log_impl((void *)&_mh_execute_header, v51, OS_LOG_TYPE_DEFAULT, "Told to filter message %@ from %@", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v96 = v150;
              __int16 v103 = v13;
              _IDSLogV();
            }
            +[IDSDMessageStore deleteIncomingMessageWithGUID:](IDSDMessageStore, "deleteIncomingMessageWithGUID:", v14, v96, v103);
            id v40 = [objc_alloc((Class)IDSMissingMessageMetric) initWithReason:702 guid:v150 service:v12 additionalInformation:0];
            +[IDSMissingMessageMetricReporter sendMetric:v40];
            [(IDSDaemon *)self _sendCertifiedDeliveryReceiptIfNeededForNiceMessage:v11 service:v12 failureReason:&off_1009D2118 failureReasonMessage:0 generateDeliveryReceipt:0];
            goto LABEL_62;
          }
          id v44 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v44, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v13;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v43;
            _os_log_impl((void *)&_mh_execute_header, v44, OS_LOG_TYPE_DEFAULT, "Ignoring filtered list for own aliases. {Alias: %@; Account: %@;}",
              buf,
              0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v96 = v13;
            __int16 v103 = v43;
            _IDSLogV();
          }
        }
        if ((objc_msgSend(v151, "allowCrossAccountMessages", v96, v103) & 1) == 0
          && ![(IDSDaemon *)self isMessageFromSelfForFromURI:v13 service:v151])
        {
          id v49 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v49, OS_LOG_TYPE_DEFAULT))
          {
            __int16 v50 = [v151 identifier];
            *(_DWORD *)long long buf = 138412802;
            *(void *)&uint8_t buf[4] = v150;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v50;
            *(_WORD *)&unsigned char buf[22] = 2112;
            int v192 = v13;
            _os_log_impl((void *)&_mh_execute_header, v49, OS_LOG_TYPE_DEFAULT, "Dropping message %@ from %@ because it is not on the cross-account allowlist and is coming from %@", buf, 0x20u);
          }
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            id v104 = [v151 identifier];
            __int16 v108 = v13;
            double v97 = v150;
            _IDSLogV();
          }
          +[IDSDMessageStore deleteIncomingMessageWithGUID:](IDSDMessageStore, "deleteIncomingMessageWithGUID:", v14, v97, v104, v108);
          id v40 = [objc_alloc((Class)IDSMissingMessageMetric) initWithReason:710 guid:v150 service:v12 additionalInformation:0];
          +[IDSMissingMessageMetricReporter sendMetric:v40];
          [(IDSDaemon *)self _sendCertifiedDeliveryReceiptIfNeededForNiceMessage:v11 service:v12 failureReason:&off_1009D2130 failureReasonMessage:0 generateDeliveryReceipt:0];
          goto LABEL_62;
        }
        if (![(IDSDaemon *)self _doesNiceMessageContainValidCombination:v11])
        {
          +[IDSDMessageStore deleteIncomingMessageWithGUID:v14];
          goto LABEL_63;
        }
        id v40 = [v11 expirationDate];
        if ([v40 unsignedLongLongValue])
        {
          id v149 = objc_msgSend(objc_alloc((Class)NSDate), "initWithTimeIntervalSince1970:", (double)(unint64_t)objc_msgSend(v40, "unsignedLongLongValue"));
          id v45 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v45, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412546;
            *(void *)&uint8_t buf[4] = v40;
            *(_WORD *)&unsigned char buf[12] = 2112;
            *(void *)&buf[14] = v149;
            _os_log_impl((void *)&_mh_execute_header, v45, OS_LOG_TYPE_DEFAULT, "Message specifies an expiration date %@ %@", buf, 0x16u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            double v97 = (uint64_t (*)(uint64_t, uint64_t))v40;
            id v104 = v149;
            _IDSLogV();
          }
          objc_msgSend(v149, "timeIntervalSinceNow", v97, v104);
          if (v46 + 5.0 < 0.0)
          {
            double v47 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412546;
              *(void *)&uint8_t buf[4] = v150;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v12;
              _os_log_impl((void *)&_mh_execute_header, v47, OS_LOG_TYPE_DEFAULT, "Message %@ for topic %@ has expired! Dropping.", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              double v97 = v150;
              id v104 = v12;
              _IDSLogV();
            }
            +[IDSDMessageStore deleteIncomingMessageWithGUID:](IDSDMessageStore, "deleteIncomingMessageWithGUID:", v14, v97, v104);
            id v48 = [objc_alloc((Class)IDSMissingMessageMetric) initWithReason:712 guid:v150 service:v12 additionalInformation:0];
            +[IDSMissingMessageMetricReporter sendMetric:v48];
            goto LABEL_206;
          }
        }
        if ([(IDSDaemon *)self _checkIfDupeAndNoteGuid:v150 local:0 topic:v12])
        {
          id v52 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v52, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v150;
            _os_log_impl((void *)&_mh_execute_header, v52, OS_LOG_TYPE_DEFAULT, "Received remote message %@ is a duplicate. Ignoring.", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            double v97 = v150;
            _IDSLogV();
          }
          +[IDSDMessageStore deleteIncomingMessageWithGUID:](IDSDMessageStore, "deleteIncomingMessageWithGUID:", v14, v97);
          goto LABEL_62;
        }
        [v15 setShouldBoost:1];
        id v149 = [v11 command];
        __int16 v140 = [v11 commandContext];
        long long v147 = [v11 toURI];
        id v139 = [v11 reportID];
        CFMutableDictionaryRef theDicta = [v11 groupIDData];
        if (theDicta) {
          id v135 = [objc_alloc((Class)ENGroupID) initWithDataRepresentation:theDicta];
        }
        else {
          id v135 = 0;
        }
        __int16 v138 = [v11 peerResponseIdentifier];
        id v137 = [v11 wantsAppAck];
        __int16 v136 = [v11 expectsPeerResponse];
        BOOL v125 = [v149 integerValue] == (id)104;
        BOOL v122 = [v149 integerValue] == (id)120;
        id v131 = [v149 integerValue];
        id v129 = [v149 integerValue];
        if ([v12 isEqualToString:@"com.apple.private.alloy.willow"])
        {
          BOOL v119 = [v149 integerValue] == (id)250;
          BOOL v117 = [v149 integerValue] == (id)251;
        }
        else
        {
          BOOL v119 = 0;
          BOOL v117 = 0;
        }
        uint64_t v53 = objc_opt_class();
        id v54 = [v11 rawMessage];
        id v143 = sub_1002B4B18(v53, v54, IDSDeliveryStatusContextKey);

        if ([v149 integerValue] == (id)101)
        {
          id v55 = [v143 objectForKey:IDSSenderKeyIDCheckKey];
          BOOL v133 = v55 != 0;
        }
        else
        {
          BOOL v133 = 0;
        }
        id v141 = [v11 senderPushToken];
        uint64_t v56 = +[IDSTrafficMonitor sharedInstance];
        uint64_t v57 = [v151 identifier];
        [v56 noteIncomingMessageForService:v57];

        id v58 = OSLogHandleForIDSCategory();
        if (os_log_type_enabled(v58, OS_LOG_TYPE_DEFAULT))
        {
          *(_DWORD *)long long buf = 138412546;
          *(void *)&uint8_t buf[4] = v150;
          *(_WORD *)&unsigned char buf[12] = 2112;
          *(void *)&buf[14] = v12;
          _os_log_impl((void *)&_mh_execute_header, v58, OS_LOG_TYPE_DEFAULT, "INCOMING-APS_DELIVERY:%@ SERVICE:%@", buf, 0x16u);
        }

        if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
        {
          double v97 = v150;
          id v104 = v12;
          _IDSLogV();
        }
        id v59 = objc_msgSend(v11, "certifiedDeliveryVersion", v97, v104);
        uint64_t v127 = (uint64_t)[v59 integerValue];

        __int16 v142 = [v11 updateHash];
        uint64_t v60 = [v11 encryptedPayload];
        id v61 = (void *)v60;
        if (v133)
        {
          double v62 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v62, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 138412290;
            *(void *)&uint8_t buf[4] = v150;
            _os_log_impl((void *)&_mh_execute_header, v62, OS_LOG_TYPE_DEFAULT, "Received delivery receipt for sender key distribution message %@", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            uint64_t v98 = (uint64_t)v150;
            _IDSLogV();
          }
          -[IDSDaemon _processCertifiedDeliveryReceiptForSenderKeyDistribution:service:](self, "_processCertifiedDeliveryReceiptForSenderKeyDistribution:service:", v11, v12, v98);
          +[IDSDMessageStore deleteIncomingMessageWithGUID:v14];
          goto LABEL_205;
        }
        id v121 = (void *)v60;
        if (v60 && [v149 unsignedIntValue] == 101)
        {
          char v63 = 1;
        }
        else
        {
          [(IDSDaemon *)self queryHashForceUpdate:v149 fromURI:v13 messageUUID:v150 updateHash:v142 toURI:v147 service:v151];
          char v63 = 0;
        }
        if (v131 == (id)130)
        {
          id v61 = v121;
          if ([v151 tunnelService])
          {
            id v64 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v64, OS_LOG_TYPE_DEFAULT))
            {
              *(_WORD *)long long buf = 0;
              _os_log_impl((void *)&_mh_execute_header, v64, OS_LOG_TYPE_DEFAULT, "Received registration update message on tunnel service, ignoring...", buf, 2u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
          }
LABEL_150:
          +[IDSDMessageStore deleteIncomingMessageWithGUID:v14];
LABEL_205:

          id v48 = v140;
LABEL_206:

LABEL_62:
LABEL_63:

          goto LABEL_64;
        }
        if (v129 == (id)132)
        {
          id v65 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v65, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v65, OS_LOG_TYPE_DEFAULT, "Received KTPeerUpdateMessage message", buf, 2u);
          }

          id v61 = v121;
          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
          [(IDSDaemon *)self _processKTPeerUpdateMessageForService:v12 localURI:v147 remoteURI:v13];
          goto LABEL_150;
        }
        CFStringRef v66 = 0;
        if (v147 && !v119 && !v117)
        {
          id v184 = 0;
          id v67 = [(IDSDaemon *)self _validAccountForIncomingMessageSentToURI:v147 service:v151 outPseudonym:&v184];
          id v134 = v184;
          if (!v67)
          {
            id v74 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v74, OS_LOG_TYPE_ERROR))
            {
              *(_DWORD *)long long buf = 138413058;
              *(void *)&uint8_t buf[4] = v150;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v14;
              *(_WORD *)&unsigned char buf[22] = 2112;
              int v192 = (uint64_t (*)(uint64_t, uint64_t))v147;
              *(_WORD *)v193 = 2112;
              *(void *)&v193[2] = v11;
              _os_log_impl((void *)&_mh_execute_header, v74, OS_LOG_TYPE_ERROR, "Processing received message for which we couldn't find a relevant account, cleaning it up. { messageUUID: %@, storedGuid: %@, toURI: %@, message: %@ }", buf, 0x2Au);
            }

            if (os_log_shim_legacy_logging_enabled())
            {
              _IDSWarnV();
              _IDSLogV();
              __int16 v108 = (uint64_t (*)(uint64_t, uint64_t))v147;
              id v111 = v11;
              uint64_t v98 = (uint64_t)v150;
              id v105 = v14;
              _IDSLogTransport();
            }
            [(objc_class *)[(IDSDaemon *)self _messageStoreClass] deleteIncomingMessageWithGUID:v14];
            id v75 = [objc_alloc((Class)IDSMissingMessageMetric) initWithReason:702 guid:v150 service:v12 additionalInformation:0];
            +[IDSMissingMessageMetricReporter sendMetric:v75];
            uint64_t v76 = v127;
            if (v127 >= 1)
            {
              id v153 = [v11 certifiedDeliveryRTS];
              if (!v153)
              {
                id v77 = OSLogHandleForIDSCategory();
                if (os_log_type_enabled(v77, OS_LOG_TYPE_ERROR))
                {
                  *(_DWORD *)long long buf = 138412546;
                  *(void *)&uint8_t buf[4] = v150;
                  *(_WORD *)&unsigned char buf[12] = 2048;
                  *(void *)&buf[14] = v127;
                  _os_log_impl((void *)&_mh_execute_header, v77, OS_LOG_TYPE_ERROR, "No certified delivery RTS found in payload with cdv { guid: %@, cdv: %ld }", buf, 0x16u);
                }

                uint64_t v76 = v127;
                if (os_log_shim_legacy_logging_enabled())
                {
                  _IDSWarnV();
                  _IDSLogV();
                  _IDSLogTransport();
                }
              }
              id v78 = objc_alloc((Class)IDSCertifiedDeliveryContext);
              long long v79 = [v141 rawToken];
              id v80 = [v78 initWithGUID:v150 service:v12 certifiedDeliveryVersion:v76 certifiedDeliveryRTS:v153 senderToken:v79];

              id v81 = [objc_alloc((Class)IDSCertifiedDeliveryReceiptMessage) initWithCertifiedDeliveryContext:v80];
              id v82 = +[IDSDeliveryController sharedInstance];
              v182[0] = _NSConcreteStackBlock;
              v182[1] = 3221225472;
              v182[2] = sub_1003AE83C;
              v182[3] = &unk_100980FD8;
              id v83 = v80;
              id v183 = v83;
              [v82 sendIDSMessage:v81 service:0 topic:v12 completionBlock:v182];
            }
            goto LABEL_204;
          }

          CFStringRef v66 = v134;
        }
        v157[0] = _NSConcreteStackBlock;
        v157[1] = 3221225472;
        v157[2] = sub_1003AE97C;
        v157[3] = &unk_10098B068;
        id v120 = v11;
        id v158 = v120;
        long long v130 = v12;
        int v159 = v130;
        id v116 = v151;
        id v160 = v116;
        long long v118 = v150;
        v161 = v118;
        id v162 = self;
        unsigned int v115 = v13;
        v163 = v115;
        id v114 = v147;
        id v164 = v114;
        id v165 = v141;
        id v166 = v149;
        id v167 = v138;
        id v168 = v137;
        id v169 = v136;
        char v178 = v63;
        id v170 = v121;
        char v179 = v29;
        id v171 = v140;
        id v134 = v66;
        id v172 = v134;
        id v173 = theDicta;
        id v113 = v15;
        id v174 = v113;
        id v175 = v135;
        BOOL v180 = v122;
        id v176 = v139;
        uint64_t v177 = v127;
        BOOL v181 = v125;
        long long v132 = objc_retainBlock(v157);
        if ([v130 isEqualToIgnoringCase:@"com.apple.private.alloy.icloudpairing"])
        {
          id v68 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v68, OS_LOG_TYPE_DEFAULT))
          {
            *(_DWORD *)long long buf = 134217984;
            *(void *)&uint8_t buf[4] = 0x403E000000000000;
            _os_log_impl((void *)&_mh_execute_header, v68, OS_LOG_TYPE_DEFAULT, "  => Adding a delay of %f seconds to iCloud Pairing Messages", buf, 0xCu);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
          {
            uint64_t v98 = 0x403E000000000000;
            _IDSLogV();
          }
          *(void *)long long buf = 0;
          *(void *)&uint8_t buf[8] = buf;
          *(void *)&uint8_t buf[16] = 0x3032000000;
          int v192 = sub_1003896D0;
          *(void *)v193 = sub_1003896E0;
          *(void *)&v193[8] = 0xAAAAAAAAAAAAAAAALL;
          *(void *)&v193[8] = [objc_alloc((Class)IMPowerAssertion) initWithIdentifier:@"CloudPairingDelay" timeout:35.0];
          v154[0] = _NSConcreteStackBlock;
          v154[1] = 3221225472;
          v154[2] = sub_1003B692C;
          v154[3] = &unk_10098B0B8;
          v155 = v132;
          unsigned int v156 = buf;
          id v69 = objc_retainBlock(v154);

          _Block_object_dispose(buf, 8);
        }
        else
        {
          id v70 = OSLogHandleForIDSCategory();
          if (os_log_type_enabled(v70, OS_LOG_TYPE_DEFAULT))
          {
            *(_WORD *)long long buf = 0;
            _os_log_impl((void *)&_mh_execute_header, v70, OS_LOG_TYPE_DEFAULT, "  => Processing immediately", buf, 2u);
          }

          if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
            _IDSLogV();
          }
          id v69 = objc_retainBlock(v132);
        }
        unsigned int v71 = [(IDSDaemon *)self _isUnderFirstDataProtectionLock];
        if (v14 || ([v116 shouldHaveRestrictedStorage] & 1) != 0)
        {
          if (v71)
          {
            id v72 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v72, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412546;
              *(void *)&uint8_t buf[4] = v118;
              *(_WORD *)&unsigned char buf[12] = 2112;
              *(void *)&buf[14] = v14;
              _os_log_impl((void *)&_mh_execute_header, v72, OS_LOG_TYPE_DEFAULT, "Under first data protection lock and message already stored -- ignoring {GUID: %@, storedGuid: %@}", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
          }
          else
          {
            uint64_t v73 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v73, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)&uint8_t buf[4] = v14;
              _os_log_impl((void *)&_mh_execute_header, v73, OS_LOG_TYPE_DEFAULT, "Processing message for stored guid %@", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
              _IDSLogV();
            }
            ((void (*)(void *, id, uint64_t, uint64_t))v69[2])(v69, v14, 1, 1);
          }
        }
        else
        {
          long long v84 = [(IDSDaemon *)self serviceController];
          long long v128 = [v84 serviceWithPushTopic:v130];

          id v85 = [v128 dataProtectionClass];
          uint64_t v126 = [v120 encryptedPayload];
          if (v71)
          {
            long long v86 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v86, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)long long buf = 138412290;
              *(void *)&uint8_t buf[4] = v118;
              _os_log_impl((void *)&_mh_execute_header, v86, OS_LOG_TYPE_DEFAULT, "Under first data protection lock. Sending message to storage. { guid: %@ }", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              long long v99 = v118;
              _IDSLogV();
            }
            __int16 v87 = -[IDSDaemon _messageStoreForDataProtectionClass:](self, "_messageStoreForDataProtectionClass:", v85, v99);
            long long v123 = [v120 rawMessage];
            CFStringRef v88 = [v115 prefixedURI];
            unsigned int v89 = [v128 controlCategory];
            BYTE4(v100) = [(IDSDaemon *)self _dedupBehaviorForNiceMessage:v120];
            LODWORD(v100) = v89;
            objc_msgSend(v87, "storeIncomingMessage:forTopic:fromID:messageUUID:messagePayload:isLocal:controlCategory:dedupBehavior:completionBlock:", v123, v130, v88, v118, v126, 0, v100, 0);

            [(IDSDaemon *)self _sendCertifiedDeliveryReceiptIfNeededForNiceMessage:v120 service:v130 failureReason:&off_1009D2178 failureReasonMessage:0 generateDeliveryReceipt:0];
            if ([v116 wantsPendingMessageUpdates]) {
              [(IDSDaemon *)self _broadcastPendingMessageUpdateForNiceMessage:v120 fromURI:v115 toURI:v114 forTopic:v130 messageContext:v113];
            }
          }
          else
          {
            __int16 v90 = [(IDSDaemon *)self _messageStoreForDataProtectionClass:v85];
            id v124 = [v120 rawMessage];
            id v91 = [v115 prefixedURI];
            unsigned int v92 = [v128 controlCategory];
            BYTE4(v99) = [(IDSDaemon *)self _dedupBehaviorForNiceMessage:v120];
            LODWORD(v99) = v92;
            objc_msgSend(v90, "storeIncomingMessage:forTopic:fromID:messageUUID:messagePayload:isLocal:controlCategory:dedupBehavior:completionBlock:", v124, v130, v91, v118, v126, 0, v99, v69);
          }
        }

        id v75 = v158;
LABEL_204:

        id v61 = v121;
        goto LABEL_205;
      }
      id v33 = +[IDSPeerIDManager sharedInstance];
      __int16 v32 = [v33 uriForShortHandle:v146];

      id v31 = [v32 prefixedURI];
      if (v31) {
        CFDictionarySetValue(theDict, IDSSenderIDKey, v31);
      }
      goto LABEL_44;
    }
    id v30 = +[IDSPeerIDManager sharedInstance];
    id v26 = [v30 uriForShortHandle:v148];

    id v27 = [v26 prefixedURI];
    if (v27) {
      CFDictionarySetValue(theDict, IDSReceiverIDKey, v27);
    }
    goto LABEL_35;
  }
LABEL_64:
  os_activity_scope_leave(&state);
  cut_arc_os_release();
}

- (id)_messageStoreForDataProtectionClass:(unsigned int)a3
{
  return +[IDSDMessageStore sharedInstanceForDataProtectionClass:*(void *)&a3];
}

- (BOOL)_isUnderFirstDataProtectionLock
{
  if (CUTIsInternalInstall()
    && +[IMUserDefaults isFakingEveryUnlockAsFirstUnlock])
  {
    id v2 = +[IMSystemMonitor sharedInstance];
    unsigned __int8 v3 = [v2 isUnderDataProtectionLock];
  }
  else
  {
    id v2 = +[IMSystemMonitor sharedInstance];
    unsigned __int8 v3 = [v2 isUnderFirstDataProtectionLock];
  }
  BOOL v4 = v3;

  return v4;
}

- (void)_broadcastPendingMessageUpdateForNiceMessage:(id)a3 fromURI:(id)a4 toURI:(id)a5 forTopic:(id)a6 messageContext:(id)a7
{
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = a7;
  id v15 = a3;
  id v16 = [v15 command];
  uint64_t v17 = [v15 encryptedPayload];
  unsigned int v18 = [v15 pushUUID];

  BOOL v19 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v20 = v19;
  if (v16) {
    CFDictionarySetValue(v19, IDSMessageContextOriginalCommandKey, v16);
  }
  long long v36 = (void *)v16;
  id v21 = [v12 prefixedURI];
  if (v21) {
    CFDictionarySetValue(v20, IDSMessageContextToIDKey, v21);
  }
  unsigned int v33 = kIDSListenerCapConsumesLaunchOnDemandPendingMessageUpdates;

  unsigned int v22 = [v11 prefixedURI];
  if (v22) {
    CFDictionarySetValue(v20, IDSMessageContextFromIDKey, v22);
  }
  long long v35 = (void *)v17;

  BOOL v23 = +[NSNumber numberWithBool:v17 != 0];
  if (v23) {
    CFDictionarySetValue(v20, IDSMessageContextMessageHadEncryptedData, v23);
  }

  [v14 setShouldBoost:1];
  v41[0] = _NSConcreteStackBlock;
  v41[1] = 3221225472;
  v41[2] = sub_1003B6DF0;
  v41[3] = &unk_100981B28;
  id v24 = v18;
  id v42 = v24;
  id v25 = v13;
  id v43 = v25;
  id v44 = v12;
  id v45 = v11;
  double v46 = v20;
  id v26 = v20;
  id v27 = v11;
  id v28 = v12;
  v37[0] = _NSConcreteStackBlock;
  v37[1] = 3221225472;
  v37[2] = sub_1003B6E04;
  v37[3] = &unk_10098B0E0;
  id v39 = v25;
  id v40 = objc_retainBlock(v41);
  id v38 = v24;
  uint64_t v29 = kIDSMessagingEntitlement;
  id v30 = v25;
  id v31 = v24;
  __int16 v32 = v40;
  [(IDSDaemon *)self enqueueBroadcast:v37 forTopic:v30 entitlement:v29 command:0 capabilities:v33 messageContext:v14];
}

- (Class)_messageStoreClass
{
  return (Class)objc_opt_class();
}

- (void)_processIncomingRemoteResourceTransferMessage:(id)a3 forceDownload:(BOOL)a4 guid:(id)a5 context:(id)a6 specificOriginatorURI:(id)a7 broadcastTopic:(id)a8 toURI:(id)a9 topic:(id)a10 messageContext:(id)a11
{
  BOOL v15 = a4;
  id v61 = a3;
  id key = a5;
  id v58 = a6;
  id v54 = a7;
  id v55 = a8;
  id v57 = a9;
  id v62 = a10;
  id v56 = a11;
  uint64_t v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_WORD *)long long buf = 0;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Received an IDS Payload for a Resource Tranfer over the Internet, looking at it", buf, 2u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  unsigned int v18 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    uint64_t v19 = [v61 objectForKey:IDSIncomingMessageDecryptedDataKey];
    id v20 = (void *)v19;
    CFStringRef v21 = @"NO";
    if (v15) {
      CFStringRef v21 = @"YES";
    }
    *(_DWORD *)long long buf = 138412546;
    CFStringRef v86 = v21;
    __int16 v87 = 2112;
    uint64_t v88 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Force download? %@, Payload is %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled())
  {
    int v22 = _IDSShouldLog();
    uint64_t v23 = IDSIncomingMessageDecryptedDataKey;
    if (v22)
    {
      if (v15) {
        CFStringRef v24 = @"YES";
      }
      else {
        CFStringRef v24 = @"NO";
      }
      [v61 objectForKey:IDSIncomingMessageDecryptedDataKey];
      v48 = CFStringRef v47 = v24;
      _IDSLogV();
    }
  }
  else
  {
    uint64_t v23 = IDSIncomingMessageDecryptedDataKey;
  }
  id v25 = objc_msgSend(v61, "objectForKey:", v23, v47, v48);
  JWDecodeDictionary();
  id v26 = (__CFString *)objc_claimAutoreleasedReturnValue();

  uint64_t v53 = [(__CFString *)v26 objectForKey:@"attach-meta"];
  id v27 = [(__CFString *)v26 objectForKey:@"attach-mmcs-dict"];
  id v59 = [objc_alloc((Class)IDSServiceProperties) initWithServiceIdentifier:v62];
  if ([v59 wantsPendingResourceUpdates] && !v15)
  {
    id v28 = [v27 _numberForKey:@"file-size"];
    id v29 = [v28 integerValue];

    id v30 = [v58 mutableCopy];
    id v31 = +[NSNumber numberWithInteger:v29];
    [v30 setObject:v31 forKeyedSubscript:IDSMessageContextFileSize];

    if (!self->_pendingIncomingResources)
    {
      CFMutableDictionaryRef Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
      pendingIncomingResources = self->_pendingIncomingResources;
      self->_pendingIncomingResources = Mutable;
    }
    id v34 = objc_alloc_init(IDSPendingIncomingResourceTransfer);
    [(IDSPendingIncomingResourceTransfer *)v34 setTopLevelPayload:v61];
    [(IDSPendingIncomingResourceTransfer *)v34 setGuid:key];
    [(IDSPendingIncomingResourceTransfer *)v34 setContext:v58];
    [(IDSPendingIncomingResourceTransfer *)v34 setSpecificOriginatorURI:v54];
    [(IDSPendingIncomingResourceTransfer *)v34 setBroadcastTopic:v55];
    [(IDSPendingIncomingResourceTransfer *)v34 setToURI:v57];
    [(IDSPendingIncomingResourceTransfer *)v34 setTopic:v62];
    [(IDSPendingIncomingResourceTransfer *)v34 setMessageContext:v56];
    if (v34) {
      CFDictionarySetValue((CFMutableDictionaryRef)self->_pendingIncomingResources, key, v34);
    }
    v78[0] = _NSConcreteStackBlock;
    v78[1] = 3221225472;
    id v78[2] = sub_1003B7938;
    v78[3] = &unk_10098AC20;
    id v79 = v53;
    id v35 = key;
    id v80 = v35;
    id v36 = v55;
    id v81 = v36;
    id v82 = v57;
    id v83 = v54;
    id v84 = v30;
    id v52 = v30;
    id v37 = objc_retainBlock(v78);
    v73[0] = _NSConcreteStackBlock;
    v73[1] = 3221225472;
    v73[2] = sub_1003B794C;
    v73[3] = &unk_10098AF28;
    id v74 = v35;
    id v75 = v36;
    id v76 = v62;
    id v77 = v37;
    id v38 = v37;
    id v39 = +[NSNumber numberWithInteger:245];
    [(IDSDaemon *)self enqueueBroadcast:v73 forTopic:v75 entitlement:kIDSMessagingEntitlement command:v39 capabilities:kIDSListenerCapConsumesLaunchOnDemandPendingResource messageContext:v56];

    id v40 = v79;
    goto LABEL_31;
  }
  long long v41 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v41, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)long long buf = 138412290;
    CFStringRef v86 = v26;
    _os_log_impl((void *)&_mh_execute_header, v41, OS_LOG_TYPE_DEFAULT, "DictIS %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  if (v27)
  {
    id v34 = [v27 _dataForKey:@"decryption-key"];
    id v42 = [v27 _numberForKey:@"file-size"];
    id v49 = [v42 integerValue];

    id v52 = [v27 _stringForKey:@"mmcs-signature-hex"];
    id v38 = [v27 _stringForKey:@"mmcs-url"];
    id v40 = [v27 _stringForKey:@"mmcs-owner"];
    id v43 = +[NSFileManager defaultManager];
    id v44 = [v43 _randomTemporaryPathWithSuffix:0];

    id v45 = [v59 dataUsageBundleID];
    id v51 = [(IDSDaemon *)self _IMTransferServiceController];
    __int16 v50 = +[NSString stringGUID];
    double v46 = [v52 _FTDataFromHexString];
    v63[0] = _NSConcreteStackBlock;
    v63[1] = 3221225472;
    v63[2] = sub_1003B7BB8;
    v63[3] = &unk_10098B108;
    id v64 = key;
    id v65 = v26;
    id v66 = v58;
    id v67 = v55;
    id v68 = v57;
    id v69 = v54;
    id v70 = self;
    id v71 = v62;
    id v72 = v56;
    [v51 receiveFileTransfer:v50 topic:v67 path:v44 requestURLString:v38 ownerID:v40 sourceAppID:v45 signature:v46 decryptionKey:v34 fileSize:v49 progressBlock:0 completionBlock:v63];

LABEL_31:
  }
}

- (void)_handleIncomingPushNiceMessage:(id)a3 forTopic:(id)a4 fromURI:(id)a5 messageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v46 = a5;
  id v12 = a6;
  [(IDSDaemon *)self _sendNiceMessageCheckpointIfNecessary:v10 checkpoint:9100 service:v11 additionalInformation:0];
  id v13 = [v10 storageFlags];
  id v14 = [v10 command];
  unsigned __int8 v15 = [v13 unsignedIntValue];
  unsigned __int8 v16 = [v13 unsignedIntValue];
  if (v16)
  {
    uint64_t v17 = [(IDSDaemon *)self serverStorageStateMachine];
    [v17 recievedMessageFromStorageForTopic:v11];
  }
  unsigned int v18 = v15 & 2;
  if ((v15 & 2) != 0)
  {
    uint64_t v19 = [(IDSDaemon *)self serverStorageStateMachine];
    [v19 recievedLastMessageFromStorageForTopic:v11];

    if ([v14 integerValue] == (id)255)
    {
      [(IDSDaemon *)self _noteLastItemFromStorage:0];
      goto LABEL_34;
    }
LABEL_9:
    id v20 = [(IDSDaemon *)self serviceController];
    id v45 = [v20 serviceWithPushTopic:v11];

    unsigned int v42 = [v45 dataProtectionClass];
    CFStringRef v21 = [(IDSDaemon *)self systemMonitor];
    int v22 = v12;
    unsigned int v23 = [v21 isUnderFirstDataProtectionLock];

    CFStringRef v24 = v45;
    if (!v23
      || [v45 dataProtectionClass]
      || ([v45 shouldHaveRestrictedStorage] & 1) != 0)
    {
      if (([v45 passThroughMessagesFromStorage] & 1) != 0
        || [v45 shouldHaveRestrictedStorage])
      {
        id v25 = self;
        id v26 = v10;
        id v27 = v11;
        id v28 = v46;
        id v12 = v22;
LABEL_15:
        [(IDSDaemon *)v25 _processIncomingRemoteNiceMessage:v26 forTopic:v27 fromURI:v28 storedGuid:0 messageContext:v22];
LABEL_33:

        goto LABEL_34;
      }
      unsigned __int8 v29 = [(IDSDaemon *)self _isBulkingStorageMessagesForService:v11];
      if ((v16 & 1) == 0 && (v29 & 1) == 0 && !v18)
      {
        id v12 = v22;
        id v25 = self;
        id v26 = v10;
        id v27 = v11;
        id v28 = v46;
        goto LABEL_15;
      }
      id v30 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        LODWORD(buf.opaque[0]) = 138412290;
        *(uint64_t *)((char *)buf.opaque + 4) = (uint64_t)v10;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Message is from server storage %@", (uint8_t *)&buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      v47[0] = _NSConcreteStackBlock;
      v47[1] = 3221225472;
      void v47[2] = sub_1003B8AB8;
      v47[3] = &unk_10098B130;
      id v31 = v10;
      char v51 = v18 >> 1;
      id v12 = v22;
      id v48 = v31;
      id v49 = self;
      id v50 = v22;
      __int16 v32 = objc_retainBlock(v47);
      id v40 = [(IDSDaemon *)self _messageStoreForDataProtectionClass:v42];
      id v43 = [v31 rawMessage];
      long long v41 = [v46 prefixedURI];
      id v39 = [v31 pushUUID];
      unsigned int v33 = [v31 encryptedPayload];
      objc_msgSend(v40, "storeIncomingMessage:forTopic:fromID:messageUUID:messagePayload:dedupBehavior:completionBlock:", v43, v11, v41, v39, v33, -[IDSDaemon _dedupBehaviorForNiceMessage:](self, "_dedupBehaviorForNiceMessage:", v31), v32);
    }
    else
    {
      uint64_t v53 = _os_activity_create((void *)&_mh_execute_header, "Storing under first lock", (os_activity_t)&_os_activity_current, OS_ACTIVITY_FLAG_DEFAULT);
      memset(&buf, 170, sizeof(buf));
      os_activity_scope_enter(v53, &buf);
      id v34 = OSLogHandleForIDSCategory();
      id v12 = v22;
      if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)id v52 = 0;
        _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, " => Deferring message, service wants messages after first unlock only", v52, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      id v35 = [(IDSDaemon *)self messageStoreForDataProtectionClass:2];
      id v36 = [v10 rawMessage];
      id v44 = [v46 prefixedURI];
      id v37 = [v10 pushUUID];
      id v38 = [v10 encryptedPayload];
      objc_msgSend(v35, "storeIncomingMessage:forTopic:fromID:messageUUID:messagePayload:dedupBehavior:completionBlock:", v36, v11, v44, v37, v38, -[IDSDaemon _dedupBehaviorForNiceMessage:](self, "_dedupBehaviorForNiceMessage:", v10), 0);

      os_activity_scope_leave(&buf);
      cut_arc_os_release();
    }
    CFStringRef v24 = v45;
    goto LABEL_33;
  }
  if ([v14 integerValue] != (id)255) {
    goto LABEL_9;
  }
  if (v16) {
    [(IDSDaemon *)self _noteItemFromStorage:0];
  }
LABEL_34:
}

- (void)_storageTimerFired
{
  [(IMDispatchTimer *)self->_storageTimer invalidate];
  storageTimer = self->_storageTimer;
  self->_storageTimer = 0;

  BOOL v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    messagesReceivedDuringStorage = self->_messagesReceivedDuringStorage;
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    id v10 = messagesReceivedDuringStorage;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Storage timer fired, guids we need to process: %@", buf, 0xCu);
  }

  if ((os_log_shim_legacy_logging_enabled() & 1) != 0 && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v6 = self->_messagesReceivedDuringStorage;
  id v7 = self->_messagesReceivedDuringStorage;
  self->_messagesReceivedDuringStorage = 0;

  if ([(IDSDaemon *)self _isUnderFirstDataProtectionLock])
  {
    id v8 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_activity_scope_state_s buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "We're under first data protection lock. Holding messages and not sending to clients.", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
  else
  {
    [(IDSDaemon *)self _processStoredIncomingRemoteMessagesWithGUIDs:v6 ignoringGUIDs:0 lastTimeInterval:0.0];
  }
}

- (void)_updateStorageTimerWithInterval:(double)a3
{
  if (a3 > 0.0)
  {
    id v5 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 134217984;
      double v14 = a3;
      _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Scheduling a storage invalidation timer in: %f", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    storageTimer = self->_storageTimer;
    if (storageTimer)
    {
      [(IMDispatchTimer *)storageTimer invalidate];
      id v7 = self->_storageTimer;
      self->_storageTimer = 0;
    }
    id v8 = objc_alloc((Class)IMDispatchTimer);
    id v9 = im_primary_queue();
    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_1003B9108;
    v12[3] = &unk_100980598;
    v12[4] = self;
    id v10 = (IMDispatchTimer *)[v8 initWithQueue:v9 interval:(unint64_t)a3 repeats:0 handlerBlock:v12];
    id v11 = self->_storageTimer;
    self->_storageTimer = v10;
  }
}

- (void)_noteItemFromStorage:(id)a3
{
  id v4 = a3;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Noting item from storage (%@)", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v8 = v4;
    _IDSLogV();
  }
  if (!self->_messagesReceivedDuringStorage)
  {
    id v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    messagesReceivedDuringStorage = self->_messagesReceivedDuringStorage;
    self->_messagesReceivedDuringStorage = v6;
  }
  if (v4) {
    [(NSMutableSet *)self->_messagesReceivedDuringStorage addObject:v4];
  }
  -[IDSDaemon _updateStorageTimerWithInterval:](self, "_updateStorageTimerWithInterval:", 15.0, v8);
}

- (void)_noteLastItemFromStorage:(id)a3
{
  id v4 = a3;
  id v5 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v5, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    id v10 = v4;
    _os_log_impl((void *)&_mh_execute_header, v5, OS_LOG_TYPE_DEFAULT, "Noting last item from storage (%@)", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v8 = v4;
    _IDSLogV();
  }
  if (!self->_messagesReceivedDuringStorage)
  {
    id v6 = (NSMutableSet *)objc_alloc_init((Class)NSMutableSet);
    messagesReceivedDuringStorage = self->_messagesReceivedDuringStorage;
    self->_messagesReceivedDuringStorage = v6;
  }
  if (v4) {
    [(NSMutableSet *)self->_messagesReceivedDuringStorage addObject:v4];
  }
  -[IDSDaemon _updateStorageTimerWithInterval:](self, "_updateStorageTimerWithInterval:", 2.0, v8);
}

- (void)_restrictedMessageCleanupTimerFired
{
  unsigned __int8 v3 = +[NSDate now];
  [v3 timeIntervalSince1970];
  uint64_t v5 = v4;

  id v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 134217984;
    uint64_t v10 = v5;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "Restricted message cleanup timer fired at %f", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  id v7 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003B9560;
  block[3] = &unk_10097EDD8;
  void block[5] = v5;
  void block[4] = self;
  dispatch_async(v7, block);
}

- (void)_setupRestrictedMessageCleanupTimer
{
  double v3 = (double)[(IDSDaemon *)self _cleanupFrequencyForRestrictedMessages];
  uint64_t v4 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v4, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 134217984;
    double v13 = v3;
    _os_log_impl((void *)&_mh_execute_header, v4, OS_LOG_TYPE_DEFAULT, "Scheduling a restricted message cleanup timer every %f sec", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
  restrictedMessageCleanupTimer = self->_restrictedMessageCleanupTimer;
  if (restrictedMessageCleanupTimer)
  {
    [(IMDispatchTimer *)restrictedMessageCleanupTimer invalidate];
    id v6 = self->_restrictedMessageCleanupTimer;
    self->_restrictedMessageCleanupTimer = 0;
  }
  id v7 = objc_alloc((Class)IMDispatchTimer);
  id v8 = im_primary_queue();
  v11[0] = _NSConcreteStackBlock;
  v11[1] = 3221225472;
  _DWORD v11[2] = sub_1003B9950;
  v11[3] = &unk_100980598;
  v11[4] = self;
  id v9 = (IMDispatchTimer *)[v7 initWithQueue:v8 interval:(unint64_t)v3 repeats:1 handlerBlock:v11];
  storageTimer = self->_storageTimer;
  self->_storageTimer = v9;
}

- (BOOL)_isBulkingStorageMessagesForService:(id)a3
{
  if (!self->_storageTimer) {
    return 0;
  }
  id v4 = a3;
  uint64_t v5 = [(IDSDaemon *)self serverStorageStateMachine];
  unsigned __int8 v6 = [v5 inflightServerStorageStateMachineForTopic:v4];

  return v6;
}

- (void)networkStateChangedForLogTransportHint:(id)a3
{
  id v20 = a3;
  id v4 = [v20 name];
  unsigned int v5 = [v4 isEqualToString:IMNetworkChangedNotification];

  if (v5)
  {
    uint64_t v19 = [v20 userInfo];
    unsigned __int8 v6 = [v19 objectForKeyedSubscript:IMNetworkChangedNotificationNetworkAvailableKey];
    unsigned int v7 = [v6 BOOLValue];

    if (v7)
    {
      long long v24 = 0u;
      long long v25 = 0u;
      long long v22 = 0u;
      long long v23 = 0u;
      id v8 = [(IDSDaemon *)self serviceController];
      id v9 = [v8 allServices];

      id v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
      if (v10)
      {
        uint64_t v11 = *(void *)v23;
        uint64_t v12 = kIDSMessagingEntitlement;
        uint64_t v13 = kIDSListenerCapConsumesLaunchOnDemandNetworkAvailableHint;
        do
        {
          for (i = 0; i != v10; i = (char *)i + 1)
          {
            if (*(void *)v23 != v11) {
              objc_enumerationMutation(v9);
            }
            unsigned __int8 v15 = *(void **)(*((void *)&v22 + 1) + 8 * i);
            if ([v15 wantsNetworkAvailableHint])
            {
              unsigned __int8 v16 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)os_activity_scope_state_s buf = 138412290;
                id v27 = v15;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Hinting service to check transport log {service: %@, reason: connected}", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                unsigned int v18 = v15;
                _IDSLogV();
              }
              v21[0] = _NSConcreteStackBlock;
              v21[1] = 3221225472;
              v21[2] = sub_1003B9CC4;
              v21[3] = &unk_10098B158;
              void v21[4] = v15;
              uint64_t v17 = objc_msgSend(v15, "pushTopic", v18);
              [(IDSDaemon *)self enqueueBroadcast:v21 forTopic:v17 entitlement:v12 command:0 capabilities:v13 messageContext:0];
            }
          }
          id v10 = [v9 countByEnumeratingWithState:&v22 objects:v28 count:16];
        }
        while (v10);
      }
    }
  }
}

- (void)handler:(id)a3 isConnectedChanged:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  unsigned __int8 v6 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 67109120;
    BOOL v8 = v4;
    _os_log_impl((void *)&_mh_execute_header, v6, OS_LOG_TYPE_DEFAULT, "IDSPushHandler signaled isConnected %d", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
    _IDSLogV();
  }
}

- (void)handler:(id)a3 didReceiveMessage:(id)a4 forTopic:(id)a5 fromID:(id)a6 messageContext:(id)a7
{
  id v44 = a3;
  id v45 = a4;
  id v11 = a5;
  id v12 = a6;
  id v51 = a7;
  unsigned int v42 = v12;
  id v56 = v11;
  id v46 = +[IDSURI URIWithPrefixedURI:v12 withServiceLoggingHint:v11];
  id v47 = [objc_alloc((Class)IDSIncomingNiceMessage) initWithMessageDictionary:v45 topic:v11];
  uint64_t v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138413314;
    id v63 = v44;
    __int16 v64 = 2112;
    id v65 = v47;
    __int16 v66 = 2112;
    id v67 = v46;
    __int16 v68 = 2112;
    id v69 = v11;
    __int16 v70 = 2048;
    id v71 = v51;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "handler %@ didReceiveMessage: %@ fromURI: %@ forTopic: %@ context: %p", buf, 0x34u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v40 = v11;
    id v41 = v51;
    id v37 = v47;
    id v39 = v46;
    id v35 = v44;
    _IDSLogV();
  }
  double v14 = objc_msgSend(v47, "messageList", v35, v37, v39, v40, v41);

  if (v14)
  {
    unsigned __int8 v15 = [v47 messageList];
    unsigned __int8 v16 = objc_msgSend(v15, "__imArrayByFilteringWithBlock:", &stru_10098B178);

    id v43 = [v47 storageFlags];
    unsigned __int8 v17 = [v43 unsignedIntValue];
    unsigned int v18 = [v43 unsignedIntValue];
    id v19 = [v16 count];
    id v55 = [(IDSDaemon *)self _commands];
    id v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
    {
      id v21 = [v16 count];
      *(_DWORD *)os_activity_scope_state_s buf = 134217984;
      id v63 = v21;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Given message list from server. Dissecting into %ld individual messages", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      id v36 = [v16 count];
      _IDSLogV();
    }
    long long v59 = 0u;
    long long v60 = 0u;
    long long v57 = 0u;
    long long v58 = 0u;
    id obj = v16;
    id v22 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
    if (v22)
    {
      long long v23 = 0;
      uint64_t v54 = *(void *)v58;
      unsigned int v24 = v17 & 1;
      id key = (void *)IDSStorageFlagsKey;
      uint64_t v48 = 1 - (void)v19;
      int v25 = (v18 >> 1) & 1;
      do
      {
        id v26 = 0;
        id v49 = v23;
        id v27 = &v23[v48];
        do
        {
          if (*(void *)v58 != v54) {
            objc_enumerationMutation(obj);
          }
          id v28 = (__CFDictionary *)objc_msgSend(*(id *)(*((void *)&v57 + 1) + 8 * (void)v26), "mutableCopy", v36, v38);
          if ((((char *)v26 + (void)v27 == 0) & v25) != 0) {
            uint64_t v29 = v24 | 2;
          }
          else {
            uint64_t v29 = v24;
          }
          id v30 = +[NSNumber numberWithUnsignedInt:v29];
          if (v30) {
            CFDictionarySetValue(v28, key, v30);
          }
          id v31 = [objc_alloc((Class)IDSIncomingNiceMessage) initWithMessageDictionary:v28 topic:v56];
          __int16 v32 = [v31 command];
          if ([v55 containsObject:v32])
          {
            unsigned int v33 = [v31 fromURI];
            [(IDSDaemon *)self _handleIncomingPushNiceMessage:v31 forTopic:v56 fromURI:v33 messageContext:v51];
          }
          else
          {
            id v34 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v34, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)os_activity_scope_state_s buf = 138412546;
              id v63 = v32;
              __int16 v64 = 2112;
              id v65 = v31;
              _os_log_impl((void *)&_mh_execute_header, v34, OS_LOG_TYPE_DEFAULT, "Submessage command is not recognized -- dropping. {subMessageCommand: %@, subMessage: %@}", buf, 0x16u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              id v36 = v32;
              id v38 = v31;
              _IDSLogV();
            }
          }

          id v26 = (char *)v26 + 1;
        }
        while (v22 != v26);
        id v22 = [obj countByEnumeratingWithState:&v57 objects:v61 count:16];
        long long v23 = (char *)v26 + (void)v49;
      }
      while (v22);
    }
  }
  else
  {
    [(IDSDaemon *)self _handleIncomingPushNiceMessage:v47 forTopic:v11 fromURI:v46 messageContext:v51];
  }
}

- (void)handler:(id)a3 receivedOfflineMessagePendingForTopic:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    id v15 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "receivedOfflineMessagePendingForTopic: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v13 = v9;
    _IDSLogV();
  }
  -[IDSDaemon _updateStorageTimerWithInterval:](self, "_updateStorageTimerWithInterval:", 15.0, v13);
  id v12 = [(IDSDaemon *)self serverStorageStateMachine];
  [v12 incomingStorageRequestForTopic:v9 primary:1 messageContext:v10];
}

- (void)handler:(id)a3 receivedNoStorageResponseForTopic:(id)a4 identifier:(id)a5 messageContext:(id)a6
{
  id v8 = a6;
  id v9 = a4;
  id v10 = [(IDSDaemon *)self serverStorageStateMachine];
  [v10 recievedNoStorageResponseForTopic:v9 messageContext:v8];
}

- (void)handler:(id)a3 didReceiveMessage:(id)a4 forUnknownTopic:(id)a5 messageContext:(id)a6
{
  id v15 = a4;
  uint64_t v7 = IDSUUIDKey;
  id v8 = a5;
  id v9 = [v15 objectForKey:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    id v10 = [v15 objectForKey:v7];
    uint64_t v11 = +[NSData _IDSDataFromBase64String:v10];
LABEL_5:
    id v12 = (void *)v11;
    id v13 = JWUUIDPushObjectToString();

    goto LABEL_7;
  }
  id v10 = [v15 objectForKey:v7];
  objc_opt_class();
  if (objc_opt_isKindOfClass())
  {
    uint64_t v11 = [v15 objectForKey:v7];
    goto LABEL_5;
  }
  id v13 = JWUUIDPushObjectToString();
LABEL_7:

  id v14 = [objc_alloc((Class)IDSMissingMessageMetric) initWithReason:707 guid:v13 service:v8 additionalInformation:0];
  +[IDSMissingMessageMetricReporter sendMetric:v14];
}

- (id)_decryptAOverCMessage:(id)a3 topic:(id)a4 fromDeviceID:(id)a5 error:(id *)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = +[IDSCurrentDevice sharedInstance];
  id v13 = [v12 encryptionClassAKey];

  if (v13)
  {
    id v19 = 0;
    id v14 = +[IDSEncryptionHelpers decryptLocalDeliveryPayload:v9 forService:v10 withDataProtectionClass:1 fromDevice:v11 encryptionType:1 priority:300 error:&v19];
    id v15 = v19;
    if (v14)
    {
      id v16 = v14;
    }
    else
    {
      unsigned __int8 v17 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)os_activity_scope_state_s buf = 138412290;
        id v21 = v15;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Encryption failed with error %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      if (a6) {
        *a6 = v15;
      }
    }
  }
  else
  {
    id v14 = 0;
  }

  return v14;
}

- (void)deliveryController:(id)a3 didReceiveMessage:(id)a4 topic:(id)a5 command:(id)a6 deviceID:(id)a7 messageID:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v17 = a6;
  id v18 = a7;
  id v19 = a8;
  id v20 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 134218498;
    id v32 = v15;
    __int16 v33 = 2112;
    id v34 = v16;
    __int16 v35 = 2112;
    id v36 = v17;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Incoming message %p on service %@ command %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  id v21 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003BAD34;
  block[3] = &unk_1009812A0;
  void block[4] = self;
  id v27 = v16;
  id v28 = v17;
  id v29 = v15;
  id v30 = v18;
  id v22 = v18;
  id v23 = v15;
  id v24 = v17;
  id v25 = v16;
  dispatch_async(v21, block);
}

- (id)_incomingMessageStorageDictionaryForPayload:(id)a3 topic:(id)a4 deviceID:(id)a5 btUUID:(id)a6 command:(id)a7 messageUUID:(id)a8 sequenceNumber:(id)a9 wantsAppAck:(BOOL)a10 expectsPeerResponse:(BOOL)a11 peerResponseIdentifier:(id)a12
{
  id v29 = a3;
  id v17 = a4;
  id v30 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = a9;
  id v22 = a12;
  if ([v17 length])
  {
    id v23 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v24 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
    id v25 = v24;
    if (v20) {
      CFDictionarySetValue(v24, IDSMessageContextOutgoingResponseIdentifierKey, v20);
    }
    if (v22) {
      CFDictionarySetValue(v25, IDSMessageContextIncomingResponseIdentifierKey, v22);
    }
    id v26 = +[NSNumber numberWithBool:a11];
    if (v26) {
      CFDictionarySetValue(v25, IDSMessageContextExpectsPeerResponseKey, v26);
    }

    if (a10) {
      CFDictionarySetValue(v25, IDSMessageContextWantsAppAckKey, &__kCFBooleanTrue);
    }
    if (v21) {
      CFDictionarySetValue(v25, IDSMessageContextSequenceNumberKey, v21);
    }
    if (v25) {
      CFDictionarySetValue(v23, @"IDSIncomingLocalMessageContext", v25);
    }
    if (v29) {
      CFDictionarySetValue(v23, @"IDSIncomingLocalMessagePayload", v29);
    }
    if (v17) {
      CFDictionarySetValue(v23, @"IDSIncomingLocalMessageService", v17);
    }
    if (v30) {
      CFDictionarySetValue(v23, @"IDSIncomingLocalMessageDeviceID", v30);
    }
    if (v18) {
      CFDictionarySetValue(v23, @"IDSIncomingLocalMessageBTUUID", v18);
    }
    if (v19) {
      CFDictionarySetValue(v23, @"IDSIncomingLocalMessageCommand", v19);
    }
  }
  else
  {
    id v27 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 136315138;
      id v32 = "-[IDSDaemon(Messaging) _incomingMessageStorageDictionaryForPayload:topic:deviceID:btUUID:command:messageUUID"
            ":sequenceNumber:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:]";
      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_ERROR, "%s: invalid topic for saving incoming message, ignoring!", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    id v23 = 0;
  }

  return v23;
}

- (BOOL)_shouldStoreBeforeFirstUnlockIncomingLocalMessage:(id)a3 from:(id)a4 forTopic:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = v10;
  if (v8 && [v10 length])
  {
    id v12 = [(IDSDaemon *)self serviceController];
    id v13 = [v12 serviceWithPushTopic:v11];

    if (!sub_100384524((char)[v13 shouldProtectTrafficUsingClassA], (int)objc_msgSend(v13, "dataProtectionClass"), v11))goto LABEL_11; {
    id v14 = +[IDSPairingManager sharedInstance];
    }
    id v15 = [v14 pairedDeviceUniqueID];
    unsigned __int8 v16 = +[IDSEncryptionHelpers areDataProtectionKeysAvailableForService:v11 withDataProtectionClass:1 fromDevice:v15];

    if (v16) {
      goto LABEL_11;
    }
    id v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_activity_scope_state_s buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "Incoming A over C message but keys are not available, sending to storage", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    if ([v13 dataProtectionClass])
    {
LABEL_11:
      BOOL v18 = 0;
    }
    else
    {
      id v21 = [(IDSDaemon *)self _messageStoreForDataProtectionClass:2];
      v23[0] = _NSConcreteStackBlock;
      v23[1] = 3221225472;
      v23[2] = sub_1003BB6C0;
      v23[3] = &unk_10098B1A0;
      id v24 = v11;
      LOBYTE(v22) = 0;
      [v21 storeIncomingMessage:v8 forTopic:v24 fromID:v9 messageUUID:0 messagePayload:0 isLocal:1 dedupBehavior:v22 completionBlock:v23];

      BOOL v18 = 1;
    }
  }
  else
  {
    id v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 136315138;
      id v26 = "-[IDSDaemon(Messaging) _shouldStoreBeforeFirstUnlockIncomingLocalMessage:from:forTopic:]";
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%s: invalid parameters for saving incoming message, ignoring!", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
    BOOL v18 = 0;
  }

  return v18;
}

- (void)deliveryController:(id)a3 protobufReceived:(id)a4 topic:(id)a5 command:(id)a6 deviceID:(id)a7 btUUID:(id)a8 messageID:(id)a9 wantsAppAck:(BOOL)a10 expectsPeerResponse:(BOOL)a11 peerResponseIdentifier:(id)a12 messageUUID:(id)a13 priority:(int64_t)a14 isCompressed:(BOOL)a15 connectionType:(int64_t)a16 didWakeHint:(BOOL)a17
{
  id v45 = a3;
  id v48 = a4;
  id v23 = a5;
  id v49 = a6;
  id v24 = a7;
  id v47 = a8;
  id v25 = a9;
  id v46 = a12;
  id v26 = a13;
  id v27 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 134218498;
    id v70 = v48;
    __int16 v71 = 2112;
    id v72 = v23;
    __int16 v73 = 2112;
    id v74 = v49;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Incoming protobuf %p on service %@ command %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v42 = v23;
      id v44 = v49;
      id v41 = v48;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v42 = v23;
        id v44 = v49;
        id v41 = v48;
        _IDSLogV();
      }
    }
  }
  if (-[IDSDaemon _checkIfDupeAndNoteGuid:local:topic:](self, "_checkIfDupeAndNoteGuid:local:topic:", v26, 1, v23, v41, v42, v44))
  {
    id v28 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412290;
      id v70 = v26;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Received local protobuf %@ is a duplicate. Ignoring.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v29 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003BBD88;
    block[3] = &unk_10098AD68;
    void block[4] = self;
    id v63 = v23;
    id v64 = v25;
    id v65 = v24;
    int64_t v67 = a14;
    int64_t v68 = a16;
    id v66 = v26;
    id v30 = v26;
    id v31 = v24;
    id v32 = v25;
    id v33 = v23;
    dispatch_block_t v34 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
    dispatch_async(v29, v34);
  }
  else
  {
    __int16 v35 = [v48 dictionaryRepresentation];
    LOWORD(v43) = __PAIR16__(a11, a10);
    id v36 = -[IDSDaemon _incomingMessageStorageDictionaryForPayload:topic:deviceID:btUUID:command:messageUUID:sequenceNumber:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:](self, "_incomingMessageStorageDictionaryForPayload:topic:deviceID:btUUID:command:messageUUID:sequenceNumber:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:", v35, v23, v24, v47, v49, v26, v25, v43, v46);

    id v37 = im_primary_queue();
    v50[0] = _NSConcreteStackBlock;
    v50[1] = 3221225472;
    v50[2] = sub_1003BBE38;
    v50[3] = &unk_10098B1C8;
    v50[4] = self;
    id v51 = v23;
    id v52 = v36;
    id v53 = v47;
    id v54 = v25;
    int64_t v59 = a14;
    int64_t v60 = a16;
    id v55 = v24;
    id v56 = v26;
    id v57 = v48;
    id v58 = v49;
    BOOL v61 = a17;
    id v38 = v26;
    id v30 = v24;
    id v31 = v25;
    id v32 = v36;
    id v39 = v23;
    dispatch_block_t v40 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v50);
    dispatch_async(v37, v40);
  }
}

- (void)deliveryController:(id)a3 dataReceived:(id)a4 topic:(id)a5 command:(id)a6 deviceID:(id)a7 btUUID:(id)a8 messageID:(id)a9 wantsAppAck:(BOOL)a10 expectsPeerResponse:(BOOL)a11 peerResponseIdentifier:(id)a12 messageUUID:(id)a13 priority:(int64_t)a14 isCompressed:(BOOL)a15 connectionType:(int64_t)a16 didWakeHint:(BOOL)a17
{
  id v44 = a3;
  id v47 = a4;
  id v23 = a5;
  id v48 = a6;
  id v24 = a7;
  id v46 = a8;
  id v25 = a9;
  id v45 = a12;
  id v26 = a13;
  id v27 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 134218498;
    id v69 = v47;
    __int16 v70 = 2112;
    id v71 = v23;
    __int16 v72 = 2112;
    id v73 = v48;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Incoming data %p on service %@ command %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v41 = v23;
      id v43 = v48;
      id v40 = v47;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v41 = v23;
        id v43 = v48;
        id v40 = v47;
        _IDSLogV();
      }
    }
  }
  if (-[IDSDaemon _checkIfDupeAndNoteGuid:local:topic:](self, "_checkIfDupeAndNoteGuid:local:topic:", v26, 1, v23, v40, v41, v43))
  {
    id v28 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412290;
      id v69 = v26;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Received local data %@ is a duplicate. Ignoring.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v29 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003BC7D8;
    block[3] = &unk_10098AD68;
    void block[4] = self;
    id v62 = v23;
    id v63 = v25;
    id v64 = v24;
    int64_t v66 = a14;
    int64_t v67 = a16;
    id v65 = v26;
    id v30 = v26;
    id v31 = v24;
    id v32 = v25;
    id v33 = v23;
    dispatch_block_t v34 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
    dispatch_async(v29, v34);
  }
  else
  {
    LOWORD(v42) = __PAIR16__(a11, a10);
    __int16 v35 = -[IDSDaemon _incomingMessageStorageDictionaryForPayload:topic:deviceID:btUUID:command:messageUUID:sequenceNumber:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:](self, "_incomingMessageStorageDictionaryForPayload:topic:deviceID:btUUID:command:messageUUID:sequenceNumber:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:", v47, v23, v24, v46, v48, v26, v25, v42, v45);
    id v36 = im_primary_queue();
    v49[0] = _NSConcreteStackBlock;
    v49[1] = 3221225472;
    v49[2] = sub_1003BC888;
    v49[3] = &unk_10098B1C8;
    v49[4] = self;
    id v50 = v23;
    id v51 = v35;
    id v52 = v46;
    id v53 = v25;
    int64_t v58 = a14;
    int64_t v59 = a16;
    id v54 = v24;
    id v55 = v26;
    id v56 = v47;
    id v57 = v48;
    BOOL v60 = a17;
    id v37 = v26;
    id v30 = v24;
    id v31 = v25;
    id v32 = v35;
    id v38 = v23;
    dispatch_block_t v39 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v49);
    dispatch_async(v36, v39);
  }
}

- (void)deliveryController:(id)a3 messageReceived:(id)a4 topic:(id)a5 command:(id)a6 deviceID:(id)a7 btUUID:(id)a8 messageID:(id)a9 wantsAppAck:(BOOL)a10 expectsPeerResponse:(BOOL)a11 peerResponseIdentifier:(id)a12 messageUUID:(id)a13 priority:(int64_t)a14 isCompressed:(BOOL)a15 connectionType:(int64_t)a16 didWakeHint:(BOOL)a17
{
  id v48 = a3;
  id v51 = a4;
  id v23 = a5;
  id v24 = a6;
  id v50 = a7;
  id v49 = a8;
  id v25 = a9;
  id v26 = a12;
  id v52 = a13;
  id v27 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 134218498;
    id v73 = v51;
    __int16 v74 = 2112;
    id v75 = v23;
    __int16 v76 = 2112;
    id v77 = v24;
    _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Incoming message %p on service %@ command %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      id v46 = v23;
      id v47 = v24;
      id v45 = v51;
      _IDSLogTransport();
      if (_IDSShouldLog())
      {
        id v46 = v23;
        id v47 = v24;
        id v45 = v51;
        _IDSLogV();
      }
    }
  }
  if (-[IDSDaemon _checkIfDupeAndNoteGuid:local:topic:forceNoteGuid:](self, "_checkIfDupeAndNoteGuid:local:topic:forceNoteGuid:", v52, 1, v23, +[IDSDaemon _commandIsSessionCommand:](IDSDaemon, "_commandIsSessionCommand:", objc_msgSend(v24, "integerValue", v45, v46, v47))))
  {
    id v28 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412290;
      id v73 = v52;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Received local message %@ is a duplicate. Ignoring.", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    id v29 = im_primary_queue();
    block[0] = _NSConcreteStackBlock;
    block[1] = 3221225472;
    block[2] = sub_1003BD248;
    block[3] = &unk_10098AD68;
    void block[4] = self;
    id v68 = v23;
    id v69 = v25;
    id v70 = v50;
    v71[1] = a14;
    v71[2] = a16;
    v71[0] = v52;
    id v30 = v25;
    id v31 = v52;
    id v32 = v50;
    id v33 = v23;
    dispatch_block_t v34 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, block);
    dispatch_async(v29, v34);

    __int16 v35 = &v68;
    id v36 = &v69;
    id v37 = &v70;
    id v38 = (id *)v71;
  }
  else
  {
    dispatch_block_t v39 = im_primary_queue();
    v53[0] = _NSConcreteStackBlock;
    v53[1] = 3221225472;
    v53[2] = sub_1003BD2F8;
    v53[3] = &unk_10098B1F0;
    v53[4] = self;
    id v54 = v23;
    id v55 = v49;
    id v56 = v50;
    id v57 = v51;
    int64_t v58 = v24;
    id v59 = v52;
    id v60 = v25;
    BOOL v64 = a10;
    BOOL v65 = a11;
    id v61 = v26;
    int64_t v62 = a14;
    int64_t v63 = a16;
    BOOL v66 = a17;
    id v40 = v25;
    id v41 = v52;
    id v42 = v50;
    id v43 = v23;
    dispatch_block_t v44 = dispatch_block_create(DISPATCH_BLOCK_ENFORCE_QOS_CLASS, v53);
    dispatch_async(v39, v44);

    __int16 v35 = &v54;
    id v36 = &v55;
    id v37 = &v56;
    id v38 = &v57;
    id v29 = v58;
  }
}

- (void)deliveryController:(id)a3 receivedAppLevelAckWithTopic:(id)a4 deviceID:(id)a5 btUUID:(id)a6 messageID:(id)a7 peerResponseIdentifier:(id)a8 priority:(int64_t)a9 connectionType:(int64_t)a10
{
  id v29 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a7;
  id v20 = a8;
  id v21 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    id v39 = v16;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_DEFAULT, "Incoming app level ack on service %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled())
  {
    if (_IDSShouldLogTransport())
    {
      _IDSLogTransport();
      if (_IDSShouldLog()) {
        _IDSLogV();
      }
    }
  }
  LOWORD(v28) = 0;
  uint64_t v22 = -[IDSDaemon _incomingMessageStorageDictionaryForPayload:topic:deviceID:btUUID:command:messageUUID:sequenceNumber:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:](self, "_incomingMessageStorageDictionaryForPayload:topic:deviceID:btUUID:command:messageUUID:sequenceNumber:wantsAppAck:expectsPeerResponse:peerResponseIdentifier:", 0, v16, v17, v18, &off_1009D2190, v20, v19, v28, v20);
  id v23 = im_primary_queue();
  block[0] = _NSConcreteStackBlock;
  block[1] = 3221225472;
  block[2] = sub_1003BDC18;
  block[3] = &unk_10098B218;
  void block[4] = self;
  id v31 = v22;
  id v32 = v18;
  id v33 = v16;
  dispatch_block_t v34 = &off_1009D2190;
  id v35 = v17;
  int64_t v36 = a9;
  int64_t v37 = a10;
  id v24 = v17;
  id v25 = v16;
  id v26 = v18;
  id v27 = v22;
  dispatch_async(v23, block);
}

- (void)cancelItemWithIdentifier:(id)a3 service:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 localObject];
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    id v19 = v8;
    __int16 v20 = 2048;
    id v21 = v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Received cancel request for message %@ from localObject %p", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    [v10 localObject];
    id v17 = v16 = v8;
    _IDSLogV();
  }
  id v13 = objc_msgSend(v10, "localObject", v16, v17);
  unsigned int v14 = [(IDSDaemon *)self validateListenerForLocalObject:v13 andCheckEntitlement:kIDSMessagingEntitlement forAccessToServiceWithIdentifier:v9];

  if (v14 && [v8 length])
  {
    +[IDSDMessageStore deleteOutgoingMessageWithGUID:v8 alternateGUID:0];
    id v15 = +[IDSUTunDeliveryController sharedInstance];
    [v15 cancelMessageID:v8];
  }
}

- (void)downloadPendingResourceWithMessageGUID:(id)a3 messageContext:(id)a4
{
  -[NSMutableDictionary objectForKey:](self->_pendingIncomingResources, "objectForKey:", a3, a4);
  id v13 = (id)objc_claimAutoreleasedReturnValue();
  id v5 = [v13 topLevelPayload];
  unsigned __int8 v6 = [v13 guid];
  uint64_t v7 = [v13 context];
  id v8 = [v13 specificOriginatorURI];
  id v9 = [v13 broadcastTopic];
  id v10 = [v13 toURI];
  id v11 = [v13 topic];
  id v12 = [v13 messageContext];
  [(IDSDaemon *)self _processIncomingRemoteResourceTransferMessage:v5 forceDownload:1 guid:v6 context:v7 specificOriginatorURI:v8 broadcastTopic:v9 toURI:v10 topic:v11 messageContext:v12];
}

- (void)deletePendingResourceWithMessageGUID:(id)a3 messageContext:(id)a4
{
  id v5 = a3;
  id v7 = v5;
  if (v5)
  {
    pendingIncomingResources = self->_pendingIncomingResources;
    if (pendingIncomingResources)
    {
      CFDictionaryRemoveValue((CFMutableDictionaryRef)pendingIncomingResources, v5);
      id v5 = v7;
    }
  }
  +[IDSDMessageStore deleteIncomingMessageWithGUID:v5];
}

- (void)getProgressUpdateForIdentifier:(id)a3 service:(id)a4 messageContext:(id)a5
{
  id v31 = a3;
  id v29 = a4;
  id v34 = a5;
  id v7 = [v34 localObject];
  LODWORD(a4) = [(IDSDaemon *)self validateListenerForLocalObject:v7 andCheckEntitlement:kIDSMessagingEntitlement forAccessToServiceWithIdentifier:v29];

  if (a4 && [v31 length])
  {
    +[IDSDMessageStore allOutgoingMessagesByGUID:v31];
    long long v37 = 0u;
    long long v38 = 0u;
    long long v35 = 0u;
    long long v36 = 0u;
    id obj = (id)objc_claimAutoreleasedReturnValue();
    id v8 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
    if (v8)
    {
      uint64_t v33 = *(void *)v36;
      do
      {
        for (i = 0; i != v8; i = (char *)i + 1)
        {
          if (*(void *)v36 != v33) {
            objc_enumerationMutation(obj);
          }
          id v10 = *(void **)(*((void *)&v35 + 1) + 8 * i);
          id v11 = [v10 copySendParameters];
          [v11 setWantsProgress:1];
          if ([v10 sent])
          {
            id v12 = +[IDSUTunDeliveryController sharedInstance];
            [v12 kickProgressBlockForMessageID:v31];
          }
          else
          {
            id v13 = [v34 localObject];
            id v12 = [(IDSDaemon *)self broadcasterForLocalObject:v13 messageContext:v34];

            if (v12)
            {
              id v14 = objc_alloc_init((Class)IDSDeliveryContext);
              [v14 setIdsResponseCode:0];
              [v14 setLastCall:0];
              id v15 = objc_alloc_init((Class)NSMutableDictionary);
              id v16 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
              {
                id v17 = [v11 identifier];
                id v18 = [v14 idsResponseCode];
                id v19 = [v14 responseError];
                *(_DWORD *)os_activity_scope_state_s buf = 138412802;
                id v40 = v17;
                __int16 v41 = 2048;
                id v42 = v18;
                __int16 v43 = 2112;
                dispatch_block_t v44 = v19;
                _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Sending not started update to listener on %@ with responseCode %ld error %@ - 0/0 bytes", buf, 0x20u);
              }
              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                __int16 v20 = [v11 identifier];
                id v21 = [v14 idsResponseCode];
                [v14 responseError];
                v28 = id v27 = v21;
                id v26 = v20;
                _IDSLogV();
              }
              uint64_t v22 = objc_msgSend(v11, "identifier", v26, v27, v28);
              id v23 = [v11 alternateCallbackID];
              id v24 = [v11 mainAccountUUID];
              id v25 = [v14 responseError];
              id v26 = v15;
              [v12 messageIdentifier:v22 alternateCallbackID:v23 forAccount:v24 updatedWithResponseCode:0 error:v25 lastCall:objc_msgSend(v14 context:"lastCall")];
            }
          }
        }
        id v8 = [obj countByEnumeratingWithState:&v35 objects:v45 count:16];
      }
      while (v8);
    }
  }
}

+ (id)progressBlockForSendParameters:(id)a3 messageContext:(id)a4 topic:(id)a5 forObject:(id)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  if ([v9 wantsProgress])
  {
    v30[0] = 0;
    v30[1] = v30;
    v30[2] = 0x2020000000;
    v30[3] = -1;
    v29[0] = 0;
    v29[1] = v29;
    v29[2] = 0x2020000000;
    v29[3] = -1;
    v27[0] = 0;
    v27[1] = v27;
    v27[2] = 0x3032000000;
    v27[3] = sub_1003896D0;
    v27[4] = sub_1003896E0;
    id v28 = (id)0xAAAAAAAAAAAAAAAALL;
    id v28 = +[NSDate date];
    v25[0] = 0;
    v25[1] = v25;
    v25[2] = 0x3032000000;
    v25[3] = sub_1003896D0;
    void v25[4] = sub_1003896E0;
    id v26 = 0;
    v16[0] = _NSConcreteStackBlock;
    v16[1] = 3221225472;
    v16[2] = sub_1003BE728;
    v16[3] = &unk_10098B240;
    id v21 = v25;
    uint64_t v22 = v30;
    id v23 = v29;
    id v24 = v27;
    id v17 = v9;
    id v18 = v10;
    id v19 = v12;
    id v20 = v11;
    id v13 = objc_retainBlock(v16);

    _Block_object_dispose(v25, 8);
    _Block_object_dispose(v27, 8);

    _Block_object_dispose(v29, 8);
    _Block_object_dispose(v30, 8);
  }
  else
  {
    id v13 = 0;
  }
  id v14 = objc_retainBlock(v13);

  return v14;
}

- (void)_ackMessageWithSequenceNumber:(unsigned int)a3 forDeviceID:(id)a4 priority:(int64_t)a5 dataProtectionClass:(unsigned int)a6 connectionType:(int64_t)a7 guid:(id)a8
{
  uint64_t v10 = *(void *)&a6;
  uint64_t v12 = *(void *)&a3;
  id v14 = a4;
  id v15 = a8;
  if (a5 == 100 || a5 == 200 || a5 == 300)
  {
    id v16 = [(IDSDaemon *)self uTunDeliveryController];
    id v17 = [v16 copyPeerWithID:v14];

    if ([v17 sendAckForMessageWithSequenceNumber:v12 priority:a5 dataProtectionClass:v10 connectionType:a7])
    {
      [(IDSDaemon *)self _addIncomingGUIDsWithGuid:v15 isLocal:1 hasLock:0];
    }
    else
    {
      id v18 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)os_activity_scope_state_s buf = 67109634;
        int v21 = v12;
        __int16 v22 = 2112;
        id v23 = v17;
        __int16 v24 = 2048;
        int64_t v25 = a5;
        _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "Please file a radar! Could not ack message with sequence number %u for peer %@ priority %ld\n", buf, 0x1Cu);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
  }
  else
  {
    id v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 67109120;
      int v21 = a5;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Cannot ack message locally without proper priority value (%d)", buf, 8u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)_addIncomingGUIDsWithGuid:(id)a3 isLocal:(BOOL)a4 hasLock:(BOOL)a5
{
  BOOL v6 = a4;
  id v15 = a3;
  if (!a5) {
    pthread_mutex_lock(&self->_localIncomingGUIDsLock);
  }
  id v8 = &OBJC_IVAR___IDSDaemon__remoteIncomingGUIDs;
  if (v6) {
    id v8 = &OBJC_IVAR___IDSDaemon__localIncomingGUIDs;
  }
  uint64_t v9 = *v8;
  uint64_t v10 = [*(id *)((char *)&self->super.isa + v9) first];
  id v11 = [*(id *)((char *)&self->super.isa + v9) second];
  if (([v10 containsObject:v15] & 1) != 0
    || ([v11 containsObject:v15] & 1) != 0)
  {
LABEL_10:
    if (a5) {
      goto LABEL_12;
    }
    goto LABEL_11;
  }
  if (!v10 || (unint64_t)[v10 count] >= 0x1F4)
  {
    id v12 = objc_msgSend(objc_alloc((Class)NSMutableSet), "initWithObjects:", v15, 0);
    id v13 = (objc_class *)[objc_alloc((Class)IMPair) initWithFirst:v12 second:v10];
    id v14 = *(Class *)((char *)&self->super.isa + v9);
    *(Class *)((char *)&self->super.isa + v9) = v13;

    goto LABEL_10;
  }
  [v10 addObject:v15];
  if (!a5) {
LABEL_11:
  }
    pthread_mutex_unlock(&self->_localIncomingGUIDsLock);
LABEL_12:
}

- (void)acknowledgeOutgoingMessageWithGUID:(id)a3 alternateCallbackID:(id)a4 forAccountWithUniqueID:(id)a5 messageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v13 localObject];
    *(_DWORD *)os_activity_scope_state_s buf = 138412802;
    id v22 = v10;
    __int16 v23 = 2112;
    id v24 = v11;
    __int16 v25 = 2048;
    id v26 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Received acknowledgement for outgoing message %@ alternateCallbackID %@ from localObject %p", buf, 0x20u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    [v13 localObject];
    v20 = id v19 = v11;
    id v18 = v10;
    _IDSLogV();
  }
  id v16 = objc_msgSend(v13, "localObject", v18, v19, v20);
  id v17 = [(IDSDaemon *)self accountWithIdentifier:v12 localObject:v16 requiredEntitlement:kIDSMessagingEntitlement];
}

- (void)acknowledgeMessageWithStorageGUID:(id)a3 realGUID:(id)a4 forAccountWithUniqueID:(id)a5 broadcastTime:(id)a6 messageSize:(id)a7 priority:(id)a8 broadcastID:(int64_t)a9 connectionType:(int64_t)a10 messageContext:(id)a11
{
  id v17 = a3;
  id v55 = a4;
  id v54 = a5;
  id v18 = a6;
  id v53 = a7;
  id v19 = a8;
  id v20 = a11;
  int v21 = OSLogHandleForTransportCategory();
  if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
  {
    id v22 = [v20 localObject];
    __int16 v23 = [v20 localObject];
    id v24 = [v23 processName];
    *(_DWORD *)os_activity_scope_state_s buf = 138544130;
    id v64 = v17;
    __int16 v65 = 2114;
    id v66 = v55;
    __int16 v67 = 2048;
    id v68 = v22;
    __int16 v69 = 2114;
    id v70 = v24;
    _os_log_impl((void *)&_mh_execute_header, v21, OS_LOG_TYPE_INFO, "Broadcast: Received acknowledgement for message stored as %{public}@ real guid %{public}@ from localObject %p processName %{public}@", buf, 0x2Au);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLogTransport())
  {
    __int16 v25 = [v20 localObject];
    id v26 = [v20 localObject];
    [v26 processName];
    v52 = id v51 = v25;
    id v47 = v17;
    id v50 = v55;
    _IDSLogTransport();
  }
  id v27 = objc_msgSend(v20, "localObject", v47, v50, v51, v52);
  id v28 = [(IDSDaemon *)self accountWithIdentifier:v54 localObject:v27 requiredEntitlement:kIDSMessagingEntitlement];

  if (v28)
  {
    if (a9 >= 1)
    {
      id v29 = +[IDSDaemonPriorityQueueController sharedInstance];
      v56[0] = _NSConcreteStackBlock;
      v56[1] = 3221225472;
      v56[2] = sub_1003BFCD4;
      v56[3] = &unk_10098B268;
      id v57 = v28;
      int64_t v58 = self;
      int64_t v61 = a9;
      id v59 = v55;
      id v60 = v19;
      int64_t v62 = a10;
      objc_msgSend(v29, "performBlock:withImplicitPriority:", v56, (int)objc_msgSend(v60, "intValue"));
    }
    if (v17) {
      +[IDSDMessageStore deleteIncomingMessageWithGUID:v17];
    }
    if (v18)
    {
      id v30 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
      {
        id v31 = [v28 service];
        id v32 = [v31 identifier];
        *(_DWORD *)os_activity_scope_state_s buf = 138412802;
        id v64 = v32;
        __int16 v65 = 2112;
        id v66 = v17;
        __int16 v67 = 2112;
        id v68 = v18;
        _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Message on %@ with storage guid %@ experienced broadcast time %@", buf, 0x20u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          uint64_t v33 = [v28 service];
          id v48 = [v33 identifier];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            id v34 = objc_msgSend(v28, "service", v48, v17, v18);
            id v49 = [v34 identifier];
            _IDSLogV();
          }
        }
      }
      id v35 = objc_alloc((Class)IDSClientProcessReceivedMessageMetric);
      long long v36 = [v28 service];
      long long v37 = [v36 identifier];
      id v38 = [v53 unsignedIntegerValue];
      [v18 doubleValue];
      id v40 = objc_msgSend(v35, "initWithServiceIdentifier:messageSize:deltaTime:priority:", v37, v38, (unint64_t)(v39 * 1000.0), objc_msgSend(v19, "integerValue"));

      __int16 v41 = +[IDSCoreAnalyticsLogger defaultLogger];
      [v41 logMetric:v40];

      id v42 = +[IDSAWDLogging sharedInstance];
      __int16 v43 = [v28 service];
      dispatch_block_t v44 = [v43 identifier];
      id v45 = [v53 unsignedIntegerValue];
      [v18 doubleValue];
      objc_msgSend(v42, "clientProcessReceivedMessage:messageSize:deltaTime:priority:", v44, v45, (unint64_t)(v46 * 1000.0), objc_msgSend(v19, "integerValue"));
    }
  }
}

- (void)acknowledgeMessageWithGUID:(id)a3 forAccountWithUniqueID:(id)a4 broadcastTime:(id)a5 messageSize:(id)a6 priority:(id)a7 messageContext:(id)a8
{
  id v14 = a3;
  id v15 = a4;
  id v16 = a5;
  id v44 = a6;
  id v43 = a7;
  id v17 = a8;
  id v18 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v18, OS_LOG_TYPE_DEFAULT))
  {
    id v19 = [v17 localObject];
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    id v46 = v14;
    __int16 v47 = 2048;
    id v48 = v19;
    _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_DEFAULT, "Received acknowledgement for message %@ from localObject %p", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    [v17 localObject];
    v42 = id v39 = v14;
    _IDSLogV();
  }
  id v20 = objc_msgSend(v17, "localObject", v39, v42);
  int v21 = [(IDSDaemon *)self accountWithIdentifier:v15 localObject:v20 requiredEntitlement:kIDSMessagingEntitlement];

  if (v21)
  {
    if (v14) {
      +[IDSDMessageStore deleteIncomingMessageWithGUID:v14];
    }
    if (v16)
    {
      id v22 = OSLogHandleForTransportCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
      {
        __int16 v23 = [v21 service];
        id v24 = [v23 identifier];
        *(_DWORD *)os_activity_scope_state_s buf = 138412802;
        id v46 = v24;
        __int16 v47 = 2112;
        id v48 = v14;
        __int16 v49 = 2112;
        id v50 = v16;
        _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "Message on %@ with storage guid %@ experienced broadcast time %@", buf, 0x20u);
      }
      if (os_log_shim_legacy_logging_enabled())
      {
        if (_IDSShouldLogTransport())
        {
          __int16 v25 = [v21 service];
          id v40 = [v25 identifier];
          _IDSLogTransport();

          if (_IDSShouldLog())
          {
            id v26 = objc_msgSend(v21, "service", v40, v14, v16);
            __int16 v41 = [v26 identifier];
            _IDSLogV();
          }
        }
      }
      id v27 = objc_alloc((Class)IDSClientProcessReceivedMessageMetric);
      id v28 = [v21 service];
      id v29 = [v28 identifier];
      id v30 = [v44 unsignedIntegerValue];
      [v16 doubleValue];
      id v32 = objc_msgSend(v27, "initWithServiceIdentifier:messageSize:deltaTime:priority:", v29, v30, (unint64_t)(v31 * 1000.0), objc_msgSend(v43, "integerValue"));

      uint64_t v33 = +[IDSCoreAnalyticsLogger defaultLogger];
      [v33 logMetric:v32];

      id v34 = +[IDSAWDLogging sharedInstance];
      id v35 = [v21 service];
      long long v36 = [v35 identifier];
      id v37 = [v44 unsignedIntegerValue];
      [v16 doubleValue];
      objc_msgSend(v34, "clientProcessReceivedMessage:messageSize:deltaTime:priority:", v36, v37, (unint64_t)(v38 * 1000.0), objc_msgSend(v43, "integerValue"));
    }
  }
}

- (void)sendAppAckWithGUID:(id)a3 toDestination:(id)a4 forAccountWithUniqueID:(id)a5 connectionType:(int64_t)a6 messageContext:(id)a7
{
  id v12 = a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  int64_t v29 = a6;
  id v16 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    id v17 = [v15 localObject];
    *(_DWORD *)os_activity_scope_state_s buf = 138412802;
    id v33 = v12;
    __int16 v34 = 2112;
    id v35 = v13;
    __int16 v36 = 2048;
    id v37 = v17;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "Request to send app-level ack for message %@ to %@ from localObject %p", buf, 0x20u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v27 = [v15 localObject];
    _IDSLogV();
  }
  if (v12 && v13)
  {
    id v18 = [v15 localObject];
    id v19 = [(IDSDaemon *)self accountWithIdentifier:v14 localObject:v18 requiredEntitlement:kIDSMessagingEntitlement];

    if (v19)
    {
      id v20 = +[NSArray arrayWithObject:v13];
      id v28 = sub_100133334(v20, v19);

      int v21 = +[NSSet setWithArray:v28];
      id v22 = +[IDSDestination destinationWithStrings:v21];

      id v23 = objc_alloc_init((Class)IDSSendParameters);
      id v24 = +[NSDictionary dictionary];
      [v23 setMessage:v24];

      [v23 setDestinations:v22];
      [v23 setUseDictAsTopLevel:1];
      [v23 setPeerResponseIdentifier:v12];
      __int16 v25 = +[NSNumber numberWithInteger:244];
      [v23 setCommand:v25];

      [v23 setPriority:300];
      id v26 = +[NSNumber numberWithLongLong:[(IDSDaemon *)self _messageTypeForConnection:v29]];
      [v23 setMessageType:v26];

      v30[0] = _NSConcreteStackBlock;
      v30[1] = 3221225472;
      v30[2] = sub_1003C0704;
      v30[3] = &unk_100980FD8;
      id v31 = v12;
      [v19 sendMessageWithSendParameters:v23 willSendBlock:0 completionBlock:v30];
    }
  }
}

- (int64_t)_messageTypeForConnection:(int64_t)a3
{
  int64_t v3 = 4;
  if (a3 != 1) {
    int64_t v3 = 1;
  }
  if (a3 == 2) {
    return 6;
  }
  else {
    return v3;
  }
}

- (BOOL)_checkIfDupeAndNoteGuid:(id)a3 local:(BOOL)a4 topic:(id)a5 forceNoteGuid:(BOOL)a6
{
  BOOL v6 = a6;
  BOOL v8 = a4;
  id v10 = a3;
  id v11 = a5;
  if ([v10 length])
  {
    id v12 = [(IDSDaemon *)self serviceController];
    id v13 = [v12 serviceWithIdentifier:v11];

    if ([v13 allowsDuplicates])
    {
      BOOL v14 = 0;
LABEL_27:

      goto LABEL_28;
    }
    pthread_mutex_lock(&self->_localIncomingGUIDsLock);
    id v15 = [(IMPair *)self->_localIncomingGUIDs first];
    if ([v15 containsObject:v10])
    {

      BOOL v14 = 1;
      if (!v8) {
        goto LABEL_25;
      }
    }
    else
    {
      id v16 = [(IMPair *)self->_localIncomingGUIDs second];
      unsigned __int8 v17 = [v16 containsObject:v10];

      if (!v8)
      {
        if (v17)
        {
          BOOL v14 = 1;
        }
        else
        {
          if ([v11 containsString:@"continuity"])
          {
            id v19 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)os_activity_scope_state_s buf = 138412802;
              id v28 = v10;
              __int16 v29 = 2112;
              CFStringRef v30 = @"Cloud Fallback";
              __int16 v31 = 2112;
              id v32 = v11;
              _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "The delivery path for message with guid %@ is %@, service: %@", buf, 0x20u);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              CFStringRef v25 = @"Cloud Fallback";
              id v26 = v11;
              id v24 = v10;
              _IDSLogV();
            }
          }
          BOOL v14 = 0;
        }
        goto LABEL_25;
      }
      if ((v17 & 1) == 0)
      {
        id v18 = [(IMPair *)self->_remoteIncomingGUIDs first];
        if ([v18 containsObject:v10])
        {
        }
        else
        {
          id v20 = [(IMPair *)self->_remoteIncomingGUIDs second];
          unsigned __int8 v21 = [v20 containsObject:v10];

          if ((v21 & 1) == 0)
          {
            if ([v11 containsString:@"continuity"])
            {
              id v23 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)os_activity_scope_state_s buf = 138412802;
                id v28 = v10;
                __int16 v29 = 2112;
                CFStringRef v30 = @"Local";
                __int16 v31 = 2112;
                id v32 = v11;
                _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "The delivery path for message with guid %@ is %@, service: %@", buf, 0x20u);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                CFStringRef v25 = @"Local";
                id v26 = v11;
                id v24 = v10;
                _IDSLogV();
              }
            }
            BOOL v14 = 0;
            if (!v8) {
              goto LABEL_25;
            }
LABEL_24:
            if (!v6)
            {
LABEL_26:
              pthread_mutex_unlock(&self->_localIncomingGUIDsLock);
              goto LABEL_27;
            }
LABEL_25:
            -[IDSDaemon _addIncomingGUIDsWithGuid:isLocal:hasLock:](self, "_addIncomingGUIDsWithGuid:isLocal:hasLock:", v10, v8, 1, v24, v25, v26);
            goto LABEL_26;
          }
        }
      }
      BOOL v14 = 1;
    }
    if (!v8) {
      goto LABEL_25;
    }
    goto LABEL_24;
  }
  BOOL v14 = 0;
LABEL_28:

  return v14;
}

- (BOOL)_checkIfDupeAndNoteGuid:(id)a3 local:(BOOL)a4 topic:(id)a5
{
  return [(IDSDaemon *)self _checkIfDupeAndNoteGuid:a3 local:a4 topic:a5 forceNoteGuid:0];
}

- (BOOL)shouldProxyMessageForService:(id)a3 toIdentifier:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  im_assert_primary_base_queue();
  BOOL v8 = [(IDSDaemon *)self pairingManager];
  unsigned int v9 = [v8 isPaired];

  if (v9
    && ([(IDSDaemon *)self pairingManager],
        id v10 = objc_claimAutoreleasedReturnValue(),
        unsigned __int8 v11 = [v10 activePairedDeviceHasPairingType:1],
        v10,
        (v11 & 1) == 0)
    && [v6 shouldAllowProxyDelivery])
  {
    id v12 = +[IDSDAccountController sharedInstance];
    __int16 v36 = [v12 accountsOnService:v6];

    if ([v36 count] == (id)1)
    {
      id v13 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
      {
        *(_WORD *)os_activity_scope_state_s buf = 0;
        _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "Only 1 account exists on this service, We will need to proxy this message to our local device for broadcast", buf, 2u);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
      BOOL v14 = 1;
    }
    else
    {
      long long v43 = 0u;
      long long v44 = 0u;
      long long v41 = 0u;
      long long v42 = 0u;
      id obj = v36;
      id v35 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
      if (v35)
      {
        uint64_t v32 = *(void *)v42;
        uint64_t v31 = IDSDevicePropertyIdentities;
        uint64_t v16 = IDSDevicePropertyIdentitiesURI;
        do
        {
          uint64_t v17 = 0;
          do
          {
            if (*(void *)v42 != v32)
            {
              uint64_t v18 = v17;
              objc_enumerationMutation(obj);
              uint64_t v17 = v18;
            }
            uint64_t v33 = v17;
            id v19 = objc_msgSend(*(id *)(*((void *)&v41 + 1) + 8 * v17), "defaultPairedDependentRegistration", v29, v30);
            if (v19)
            {
              id v20 = OSLogHandleForIDSCategory();
              if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
              {
                *(_DWORD *)os_activity_scope_state_s buf = 138412290;
                id v46 = v19;
                _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Found Default paired device %@ ", buf, 0xCu);
              }

              if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
              {
                __int16 v29 = v19;
                _IDSLogV();
              }
              unsigned __int8 v21 = objc_msgSend(v19, "objectForKey:", v31, v29);
              long long v39 = 0u;
              long long v40 = 0u;
              long long v37 = 0u;
              long long v38 = 0u;
              id v22 = v21;
              id v23 = [v22 countByEnumeratingWithState:&v37 objects:v49 count:16];
              if (v23)
              {
                uint64_t v24 = *(void *)v38;
                while (2)
                {
                  for (i = 0; i != v23; i = (char *)i + 1)
                  {
                    if (*(void *)v38 != v24) {
                      objc_enumerationMutation(v22);
                    }
                    id v26 = objc_msgSend(*(id *)(*((void *)&v37 + 1) + 8 * i), "_stringForKey:", v16, v29);
                    id v27 = OSLogHandleForIDSCategory();
                    if (os_log_type_enabled(v27, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
                      id v46 = v26;
                      __int16 v47 = 2112;
                      id v48 = v7;
                      _os_log_impl((void *)&_mh_execute_header, v27, OS_LOG_TYPE_DEFAULT, "Comparing %@  To %@ ", buf, 0x16u);
                    }

                    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                    {
                      __int16 v29 = v26;
                      id v30 = v7;
                      _IDSLogV();
                    }
                    char v28 = _FTAreIDsEquivalent();

                    if (v28)
                    {

                      BOOL v14 = 0;
                      goto LABEL_43;
                    }
                  }
                  id v23 = [v22 countByEnumeratingWithState:&v37 objects:v49 count:16];
                  if (v23) {
                    continue;
                  }
                  break;
                }
              }
            }
            uint64_t v17 = v33 + 1;
          }
          while ((id)(v33 + 1) != v35);
          id v35 = [obj countByEnumeratingWithState:&v41 objects:v50 count:16];
          BOOL v14 = 1;
        }
        while (v35);
      }
      else
      {
        BOOL v14 = 1;
      }
LABEL_43:
    }
  }
  else
  {
    BOOL v14 = 0;
  }

  return v14;
}

- (BOOL)_shouldMessageBeProxied:(id)a3 service:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = [v6 pushTopic];
  unsigned int v8 = [v7 isEqualToString:@"com.apple.madrid"];

  if (!v8) {
    goto LABEL_4;
  }
  unsigned int v9 = [v5 command];
  unsigned int v10 = [v9 isEqualToNumber:&off_1009D21A8];

  if (!v10) {
    goto LABEL_4;
  }
  unsigned __int8 v11 = [v5 dataToEncrypt];
  id v12 = [v11 length];

  if (!v12)
  {
    id v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_DEFAULT))
    {
      uint64_t v16 = [v5 messageUUID];
      *(_DWORD *)os_activity_scope_state_s buf = 138412290;
      id v19 = v16;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_DEFAULT, "Not Proxying this message %@ payload is currently a typing indicator", buf, 0xCu);
    }
    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
    {
      uint64_t v17 = [v5 messageUUID];
      _IDSLogV();
    }
    BOOL v13 = 0;
  }
  else
  {
LABEL_4:
    BOOL v13 = 1;
  }

  return v13;
}

- (BOOL)_shouldIncludeDefaultDeviceAsDestinationForMessageWithParams:(id)a3 service:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = [v6 fromID];
  im_assert_primary_base_queue();
  unsigned int v9 = [(IDSDaemon *)self pairingManager];
  unsigned int v10 = [v9 isPaired];

  if (!v10) {
    goto LABEL_5;
  }
  if (![v7 shouldAllowProxyDelivery]) {
    goto LABEL_5;
  }
  unsigned __int8 v11 = [(IDSDaemon *)self pairingManager];
  unsigned __int8 v12 = [v11 isCurrentDeviceTinkerConfiguredWatch];

  if (v12) {
    goto LABEL_5;
  }
  BOOL v13 = [(IDSDaemon *)self pairingManager];
  unsigned __int8 v14 = [v13 activePairedDeviceHasPairingType:1];

  if (v14) {
    goto LABEL_5;
  }
  uint64_t v17 = [v7 pushTopic];
  uint64_t v18 = IDSServiceNameiMessage;
  if (![v17 isEqualToString:IDSServiceNameiMessage]) {
    goto LABEL_14;
  }
  id v19 = [v6 command];
  if (![v19 isEqualToNumber:&off_1009D1EA8]
    || ([v6 deliveryMinimumTime], (id v20 = objc_claimAutoreleasedReturnValue()) == 0))
  {

LABEL_14:
    goto LABEL_15;
  }
  unsigned __int8 v21 = [v6 queueOneIdentifier];

  if (v21)
  {
    id v22 = [(IDSDaemon *)self pairingManager];
    unsigned __int8 v23 = [v22 pairedDeviceSupportsSendLaterMessages];

    if ((v23 & 1) == 0) {
      goto LABEL_5;
    }
  }
LABEL_15:
  uint64_t v24 = [v7 pushTopic];
  if ([v24 isEqualToString:v18])
  {
    CFStringRef v25 = [v6 command];
    unsigned __int8 v26 = [v25 isEqualToNumber:&off_1009D21C0];

    if ((v26 & 1) == 0) {
      goto LABEL_19;
    }
LABEL_5:
    BOOL v15 = 0;
    goto LABEL_6;
  }

LABEL_19:
  id v27 = +[IDSDAccountController sharedInstance];
  id v46 = [v27 accountsOnService:v7];

  if ([v46 count] == (id)1)
  {
    char v28 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_activity_scope_state_s buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Only 1 account exists on this service, We will need to proxy this and include the default device as a destination for the message as well", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    BOOL v15 = 1;
  }
  else
  {
    long long v54 = 0u;
    long long v55 = 0u;
    long long v52 = 0u;
    long long v53 = 0u;
    id obj = v46;
    id v44 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
    if (v44)
    {
      uint64_t v42 = *(void *)v53;
      uint64_t v41 = IDSDevicePropertyIdentities;
      uint64_t v29 = IDSDevicePropertyIdentitiesURI;
      do
      {
        for (i = 0; i != v44; i = (char *)i + 1)
        {
          if (*(void *)v53 != v42) {
            objc_enumerationMutation(obj);
          }
          __int16 v47 = objc_msgSend(*(id *)(*((void *)&v52 + 1) + 8 * i), "defaultPairedDependentRegistration", v39, v40);
          if (v47)
          {
            id v30 = OSLogHandleForIDSCategory();
            if (os_log_type_enabled(v30, OS_LOG_TYPE_DEFAULT))
            {
              *(_DWORD *)os_activity_scope_state_s buf = 138412290;
              id v57 = v47;
              _os_log_impl((void *)&_mh_execute_header, v30, OS_LOG_TYPE_DEFAULT, "Found Default paired device %@ ", buf, 0xCu);
            }

            if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
            {
              long long v39 = v47;
              _IDSLogV();
            }
            uint64_t v31 = objc_msgSend(v47, "objectForKey:", v41, v39);
            long long v50 = 0u;
            long long v51 = 0u;
            long long v48 = 0u;
            long long v49 = 0u;
            id v32 = v31;
            id v33 = [v32 countByEnumeratingWithState:&v48 objects:v60 count:16];
            if (v33)
            {
              uint64_t v34 = *(void *)v49;
              while (2)
              {
                for (j = 0; j != v33; j = (char *)j + 1)
                {
                  if (*(void *)v49 != v34) {
                    objc_enumerationMutation(v32);
                  }
                  __int16 v36 = objc_msgSend(*(id *)(*((void *)&v48 + 1) + 8 * (void)j), "_stringForKey:", v29, v39);
                  long long v37 = OSLogHandleForIDSCategory();
                  if (os_log_type_enabled(v37, OS_LOG_TYPE_DEFAULT))
                  {
                    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
                    id v57 = v36;
                    __int16 v58 = 2112;
                    id v59 = v8;
                    _os_log_impl((void *)&_mh_execute_header, v37, OS_LOG_TYPE_DEFAULT, "Comparing %@  To %@ ", buf, 0x16u);
                  }

                  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
                  {
                    long long v39 = v36;
                    long long v40 = v8;
                    _IDSLogV();
                  }
                  if (_FTAreIDsEquivalent())
                  {
                    long long v38 = OSLogHandleForIDSCategory();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_DEFAULT))
                    {
                      *(_WORD *)os_activity_scope_state_s buf = 0;
                      _os_log_impl((void *)&_mh_execute_header, v38, OS_LOG_TYPE_DEFAULT, "These ID's are the same, We will not be proxying this message", buf, 2u);
                    }

                    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
                      _IDSLogV();
                    }

                    BOOL v15 = 0;
                    goto LABEL_61;
                  }
                }
                id v33 = [v32 countByEnumeratingWithState:&v48 objects:v60 count:16];
                if (v33) {
                  continue;
                }
                break;
              }
            }
          }
        }
        id v44 = [obj countByEnumeratingWithState:&v52 objects:v61 count:16];
        BOOL v15 = 1;
      }
      while (v44);
    }
    else
    {
      BOOL v15 = 1;
    }
LABEL_61:
  }
LABEL_6:

  return v15;
}

- (BOOL)_isDeviceInAccountRegistration:(id)a3 forService:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = v6;
  if (v5 && [v6 length])
  {
    unsigned int v8 = +[IDSDAccountController sharedInstance];
    unsigned int v9 = +[IDSDServiceController sharedInstance];
    CFStringRef v25 = v7;
    unsigned int v10 = [v9 serviceWithPushTopic:v7];
    unsigned __int8 v11 = [v8 accountsOnService:v10];

    long long v36 = 0u;
    long long v37 = 0u;
    long long v34 = 0u;
    long long v35 = 0u;
    id obj = v11;
    id v29 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
    if (v29)
    {
      char v27 = 0;
      uint64_t v28 = *(void *)v35;
      uint64_t v12 = IDSDevicePropertyPushToken;
      do
      {
        for (i = 0; i != v29; i = (char *)i + 1)
        {
          if (*(void *)v35 != v28) {
            objc_enumerationMutation(obj);
          }
          unsigned __int8 v14 = *(void **)(*((void *)&v34 + 1) + 8 * i);
          long long v30 = 0u;
          long long v31 = 0u;
          long long v32 = 0u;
          long long v33 = 0u;
          BOOL v15 = [v14 dependentRegistrations];
          id v16 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
          if (v16)
          {
            id v17 = v16;
            uint64_t v18 = *(void *)v31;
            while (2)
            {
              for (j = 0; j != v17; j = (char *)j + 1)
              {
                if (*(void *)v31 != v18) {
                  objc_enumerationMutation(v15);
                }
                id v20 = [*(id *)(*((void *)&v30 + 1) + 8 * (void)j) _dataForKey:v12];
                unsigned __int8 v21 = [v5 rawToken];
                unsigned __int8 v22 = [v20 isEqualToData:v21];

                if (v22)
                {
                  char v27 = 1;
                  goto LABEL_18;
                }
              }
              id v17 = [v15 countByEnumeratingWithState:&v30 objects:v38 count:16];
              if (v17) {
                continue;
              }
              break;
            }
          }
LABEL_18:
        }
        id v29 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      }
      while (v29);
    }
    else
    {
      char v27 = 0;
    }

    id v7 = v25;
    char v23 = v27;
  }
  else
  {
    char v23 = 0;
  }

  return v23 & 1;
}

- (unsigned)_dedupBehaviorForNiceMessage:(id)a3
{
  id v3 = a3;
  BOOL v4 = [v3 certifiedDeliveryVersion];
  id v5 = [v3 storageFlags];
  if ((uint64_t)[v4 integerValue] < 1 || (uint64_t)objc_msgSend(v5, "integerValue") < 1)
  {
    unsigned __int8 v7 = 0;
  }
  else
  {
    id v6 = [v3 retryCount];
    if ((uint64_t)[v6 integerValue] <= 0) {
      unsigned __int8 v7 = 1;
    }
    else {
      unsigned __int8 v7 = 2;
    }
  }
  return v7;
}

- (void)_registerSysdiagnoseBlock
{
  id location = (id)0xAAAAAAAAAAAAAAAALL;
  objc_initWeak(&location, self);
  v3[0] = _NSConcreteStackBlock;
  v3[1] = 3221225472;
  v3[2] = sub_1003C1E6C;
  v3[3] = &unk_100981DF0;
  objc_copyWeak(&v4, &location);
  id v2 = im_primary_queue();
  sub_1003319E8(v3, @"IDS-DAEMON-MESSAGING", (uint64_t)v2);

  objc_destroyWeak(&v4);
  objc_destroyWeak(&location);
}

- (id)wpLinkManager
{
  return +[IDSWPLinkManager sharedInstance];
}

- (BOOL)_checkContinuityEntitlementForMessageContext:(id)a3
{
  id v4 = [a3 localObject];
  LOBYTE(self) = [(IDSDaemon *)self validateListenerForLocalObject:v4 andCheckEntitlement:kIDSContinuityEntitlement];

  return (char)self;
}

- (void)continuityClientInstanceCreatedWithMessageContext:(id)a3
{
  id v5 = a3;
  if (-[IDSDaemon _checkContinuityEntitlementForMessageContext:](self, "_checkContinuityEntitlementForMessageContext:"))
  {
    id v4 = [(IDSDaemon *)self wpLinkManager];
    [v4 clientInstanceCreatedWithMessageContext:v5];
  }
}

- (void)continuityStartAdvertisingOfType:(int64_t)a3 withData:(id)a4 withOptions:(id)a5 messageContext:(id)a6
{
  id v12 = a4;
  id v10 = a5;
  if ([(IDSDaemon *)self _checkContinuityEntitlementForMessageContext:a6])
  {
    unsigned __int8 v11 = [(IDSDaemon *)self wpLinkManager];
    [v11 startAdvertisingOfType:a3 withData:v12 withOptions:v10];
  }
}

- (void)continuityStopAdvertisingOfType:(int64_t)a3 messageContext:(id)a4
{
  if ([(IDSDaemon *)self _checkContinuityEntitlementForMessageContext:a4])
  {
    id v6 = [(IDSDaemon *)self wpLinkManager];
    [v6 stopAdvertisingOfType:a3];
  }
}

- (void)continuityStartScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 messageContext:(id)a7
{
  id v15 = a4;
  id v12 = a5;
  id v13 = a6;
  if ([(IDSDaemon *)self _checkContinuityEntitlementForMessageContext:a7])
  {
    unsigned __int8 v14 = [(IDSDaemon *)self wpLinkManager];
    [v14 startScanningForType:a3 withData:v15 mask:v12 peers:v13];
  }
}

- (void)continuityStartScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 messageContext:(id)a6
{
  id v12 = a4;
  id v10 = a5;
  if ([(IDSDaemon *)self _checkContinuityEntitlementForMessageContext:a6])
  {
    unsigned __int8 v11 = [(IDSDaemon *)self wpLinkManager];
    [v11 startScanningForType:a3 withData:v12 mask:v10];
  }
}

- (void)continuityStartScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 peers:(id)a6 boostedScan:(BOOL)a7 duplicates:(BOOL)a8 messageContext:(id)a9
{
  BOOL v9 = a8;
  BOOL v10 = a7;
  id v18 = a4;
  id v15 = a5;
  id v16 = a6;
  if ([(IDSDaemon *)self _checkContinuityEntitlementForMessageContext:a9])
  {
    id v17 = [(IDSDaemon *)self wpLinkManager];
    [v17 startScanningForType:a3 withData:v18 mask:v15 peers:v16 boostedScan:v10 duplicates:v9];
  }
}

- (void)continuityStartScanningForType:(int64_t)a3 withData:(id)a4 mask:(id)a5 boostedScan:(BOOL)a6 duplicates:(BOOL)a7 messageContext:(id)a8
{
  BOOL v9 = a7;
  BOOL v10 = a6;
  id v16 = a4;
  id v14 = a5;
  if ([(IDSDaemon *)self _checkContinuityEntitlementForMessageContext:a8])
  {
    id v15 = [(IDSDaemon *)self wpLinkManager];
    [v15 startScanningForType:a3 withData:v16 mask:v14 boostedScan:v10 duplicates:v9];
  }
}

- (void)continuityStopScanningForType:(int64_t)a3 messageContext:(id)a4
{
  if ([(IDSDaemon *)self _checkContinuityEntitlementForMessageContext:a4])
  {
    id v6 = [(IDSDaemon *)self wpLinkManager];
    [v6 stopScanningForType:a3];
  }
}

- (void)continuityStartTrackingPeer:(id)a3 forType:(int64_t)a4 messageContext:(id)a5
{
  id v9 = a3;
  if ([(IDSDaemon *)self _checkContinuityEntitlementForMessageContext:a5])
  {
    unsigned int v8 = [(IDSDaemon *)self wpLinkManager];
    [v8 continuityStartTrackingPeer:v9 forType:a4];
  }
}

- (void)continuityStopTrackingPeer:(id)a3 forType:(int64_t)a4 messageContext:(id)a5
{
  id v9 = a3;
  if ([(IDSDaemon *)self _checkContinuityEntitlementForMessageContext:a5])
  {
    unsigned int v8 = [(IDSDaemon *)self wpLinkManager];
    [v8 continuityStopTrackingPeer:v9 forType:a4];
  }
}

- (void)reportiMessageSpam:(id)a3 toURI:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned __int8 v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    id v12 = [v10 localObject];
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    uint64_t v23 = (uint64_t)v12;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "Told to report iMessage spam with localObject %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    unsigned __int8 v21 = [v10 localObject];
    _IDSLogV();
  }
  id v13 = objc_msgSend(v10, "localObject", v21);
  unsigned __int8 v14 = [(IDSDaemon *)self validateListenerForLocalObject:v13 andCheckEntitlement:kIDSReportiMessageSpamEntitlement];

  if (v14)
  {
    id v15 = [v9 _stripFZIDPrefix];
    uint64_t v16 = [v15 _bestGuessURI];

    id v17 = +[IDSDAccountController sharedInstance];
    id v18 = [v17 accountWithServiceName:@"com.apple.madrid" aliasURI:v16];

    if (v18)
    {
      [v18 reportSpamWithMessages:v8 toURI:v16];
    }
    else
    {
      id v20 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)os_activity_scope_state_s buf = 138412290;
        uint64_t v23 = v16;
        _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Couldn't find iMessage account with alias %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }

    id v9 = (id)v16;
  }
  else
  {
    id v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_activity_scope_state_s buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Process not entitled to report iMessage spam", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)reportiMessageUnknownSender:(id)a3 messageID:(id)a4 isBlackholed:(BOOL)a5 isJunked:(BOOL)a6 messageServerTimestamp:(id)a7 toURI:(id)a8 messageContext:(id)a9
{
  BOOL v11 = a6;
  BOOL v12 = a5;
  id v15 = a3;
  id v16 = a4;
  id v17 = a7;
  id v18 = a8;
  id v19 = a9;
  id v20 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v20, OS_LOG_TYPE_DEFAULT))
  {
    unsigned __int8 v21 = [v19 localObject];
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    uint64_t v32 = (uint64_t)v21;
    _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_DEFAULT, "Told to report iMessage unknown sender with localObject %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    long long v30 = [v19 localObject];
    _IDSLogV();
  }
  unsigned __int8 v22 = objc_msgSend(v19, "localObject", v30);
  unsigned __int8 v23 = [(IDSDaemon *)self validateListenerForLocalObject:v22 andCheckEntitlement:kIDSReportiMessageSpamEntitlement];

  if (v23)
  {
    uint64_t v24 = [v18 _stripFZIDPrefix];
    uint64_t v25 = [v24 _bestGuessURI];

    unsigned __int8 v26 = +[IDSDAccountController sharedInstance];
    char v27 = [v26 accountWithServiceName:@"com.apple.madrid" aliasURI:v25];

    if (v27)
    {
      [v27 reportiMessageUnknownSender:v15 messageID:v16 isBlackholed:v12 isJunked:v11 messageServerTimestamp:v17 toURI:v25];
    }
    else
    {
      id v29 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_DEFAULT))
      {
        *(_DWORD *)os_activity_scope_state_s buf = 138412290;
        uint64_t v32 = v25;
        _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_DEFAULT, "Couldn't find iMessage account with alias %@", buf, 0xCu);
      }

      if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
        _IDSLogV();
      }
    }

    id v18 = (id)v25;
  }
  else
  {
    uint64_t v28 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_activity_scope_state_s buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v28, OS_LOG_TYPE_DEFAULT, "Process not entitled to report iMessage unknown sender", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)reportiMessageSpamCheckUnknown:(id)a3 count:(id)a4 requestID:(id)a5 messageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  unsigned __int8 v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    id v15 = [v13 localObject];
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    uint64_t v25 = v15;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "Told to check unknown sender with localObject %@", buf, 0xCu);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v20 = [v13 localObject];
    _IDSLogV();
  }
  id v16 = objc_msgSend(v13, "localObject", v20);
  unsigned __int8 v17 = [(IDSDaemon *)self validateListenerForLocalObject:v16 andCheckEntitlement:kIDSReportiMessageSpamEntitlement];

  if (v17)
  {
    id v18 = +[IDSRegistrationCenter sharedInstance];
    v21[0] = _NSConcreteStackBlock;
    v21[1] = 3221225472;
    v21[2] = sub_100407000;
    v21[3] = &unk_10098CC10;
    void v21[4] = self;
    id v22 = v13;
    id v23 = v12;
    [v18 reportiMessageSpamCheckUnknown:v10 count:v11 completionBlock:v21];
  }
  else
  {
    id v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_DEFAULT))
    {
      *(_WORD *)os_activity_scope_state_s buf = 0;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_DEFAULT, "Process not entitled to check unknown sender", buf, 2u);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (BOOL)_checkEntitlement:(id)a3 forAccountWithID:(id)a4 messageContext:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = +[IDSDAccountController sharedInstance];
  id v12 = [v11 accountWithUniqueID:v9];

  if (v12)
  {
    id v13 = [v10 localObject];
    unsigned __int8 v14 = [v12 service];
    id v15 = [v14 identifier];
    BOOL v16 = [(IDSDaemon *)self validateListenerForLocalObject:v13 andCheckEntitlement:v8 forAccessToServiceWithIdentifier:v15];
  }
  else
  {
    unsigned __int8 v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_DEBUG))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412290;
      id v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEBUG, "No account found for ID: %@", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
    IMLogBacktrace();
    BOOL v16 = 0;
  }

  return v16;
}

- (id)_sessionWithUniqueID:(id)a3 messageContext:(id)a4 requiredEntitlement:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = +[IDSDSessionController sharedInstance];
  id v12 = [v11 sessionWithUniqueID:v10];

  if (v12
    && ([v12 accountID],
        id v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = [(IDSDaemon *)self _checkEntitlement:v9 forAccountWithID:v13 messageContext:v8], v13, v14))
  {
    id v15 = v12;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (id)_sessionWithInstanceID:(id)a3 messageContext:(id)a4 requiredEntitlement:(id)a5
{
  id v8 = a4;
  id v9 = a5;
  id v10 = a3;
  id v11 = +[IDSDSessionController sharedInstance];
  id v12 = [v11 sessionWithInstanceID:v10];

  if (v12
    && ([v12 accountID],
        id v13 = objc_claimAutoreleasedReturnValue(),
        unsigned int v14 = [(IDSDaemon *)self _checkEntitlement:v9 forAccountWithID:v13 messageContext:v8], v13, v14))
  {
    id v15 = v12;
  }
  else
  {
    id v15 = 0;
  }

  return v15;
}

- (void)setupNewSessionWithConfiguration:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    id v17 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "setupNewSession configuration: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v15 = v6;
    _IDSLogV();
  }
  id v9 = objc_msgSend(v6, "objectForKey:", IDSSessionAccountIDKey, v15);
  if ([(IDSDaemon *)self _checkEntitlement:kIDSSessionEntitlement forAccountWithID:v9 messageContext:v7])
  {
    id v10 = [v6 objectForKey:IDSSessionClientID];
    id v11 = +[IDSDSessionController sharedInstance];
    id v12 = [v11 setupNewOutgoingSessionWithOptions:v6];

    id v13 = [v7 localObject];
    unsigned int v14 = sub_100128E38(v10, v13);
    [v12 setClientID:v14];
  }
}

- (void)cleanupSession:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 localObject];
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "cleanup session %@ local object %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    [v7 localObject];
    unsigned int v14 = v13 = v6;
    _IDSLogV();
  }
  id v10 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v6, v7, kIDSSessionEntitlement, v13, v14);
  if (v10)
  {
    id v11 = +[IDSDSessionController sharedInstance];
    [v11 cleanupSession:v6 shouldCleanSessionStatus:1];
  }
  else
  {
    id v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Could not find session with uniqueID %@ to clean up, ignoring...", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)cleanupSessionWithInstanceID:(id)a3 messageContext:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    id v9 = [v7 localObject];
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    id v16 = v6;
    __int16 v17 = 2112;
    id v18 = v9;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "cleanup session instance %@ local object %@", buf, 0x16u);
  }
  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    [v7 localObject];
    unsigned int v14 = v13 = v6;
    _IDSLogV();
  }
  id v10 = -[IDSDaemon _sessionWithInstanceID:messageContext:requiredEntitlement:](self, "_sessionWithInstanceID:messageContext:requiredEntitlement:", v6, v7, kIDSSessionEntitlement, v13, v14);
  if (v10)
  {
    id v11 = +[IDSDSessionController sharedInstance];
    [v11 cleanupSessionWithInstanceID:v6];
  }
  else
  {
    id v12 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_DEFAULT))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412290;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v12, OS_LOG_TYPE_DEFAULT, "Could not find session with instanceID %@ to clean up, ignoring...", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog()) {
      _IDSLogV();
    }
  }
}

- (void)sendInvitation:(id)a3 withOptions:(id)a4 messageContext:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    CFStringRef v17 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "sendInvitation %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v15 = v8;
    _IDSLogV();
  }
  id v12 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v10, kIDSSessionEntitlement, v15);
  id v13 = v12;
  if (v12)
  {
    [v12 sendInvitationWithOptions:v9 declineOnError:0];
  }
  else
  {
    unsigned int v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v17 = @"IDSDaemon";
      __int16 v18 = 2112;
      id v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to send invitation, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)sendInvitation:(id)a3 withData:(id)a4 declineOnError:(BOOL)a5 messageContext:(id)a6
{
  BOOL v7 = a5;
  id v10 = (__CFString *)a3;
  id v11 = (__CFString *)a4;
  id v12 = a6;
  id v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v14 = @"NO";
    *(_DWORD *)os_activity_scope_state_s buf = 138412802;
    CFStringRef v23 = v10;
    __int16 v24 = 2112;
    if (v7) {
      CFStringRef v14 = @"YES";
    }
    uint64_t v25 = v11;
    __int16 v26 = 2112;
    CFStringRef v27 = v14;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "sendInvitation %@ with data %@ declineOnError %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v15 = @"NO";
    if (v7) {
      CFStringRef v15 = @"YES";
    }
    id v20 = v11;
    CFStringRef v21 = v15;
    id v19 = v10;
    _IDSLogV();
  }
  id v16 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v10, v12, kIDSSessionPrivateEntitlement, v19, v20, v21);
  CFStringRef v17 = v16;
  if (v16)
  {
    [v16 sendInvitationWithData:v11 declineOnError:v7];
  }
  else
  {
    __int16 v18 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v23 = @"IDSDaemon";
      __int16 v24 = 2112;
      uint64_t v25 = v10;
      _os_log_impl((void *)&_mh_execute_header, v18, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to send invitation with data to, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)acceptInvitation:(id)a3 messageContext:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    CFStringRef v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "acceptInvitation %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v12 = v6;
    _IDSLogV();
  }
  id v9 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v6, v7, kIDSSessionEntitlement, v12);
  id v10 = v9;
  if (v9)
  {
    [v9 acceptInvitation];
  }
  else
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v14 = @"IDSDaemon";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to accept invitation, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)acceptInvitation:(id)a3 withData:(id)a4 messageContext:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "acceptInvitation %@ with data %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    __int16 v15 = v8;
    id v16 = v9;
    _IDSLogV();
  }
  id v12 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v10, kIDSSessionPrivateEntitlement, v15, v16);
  id v13 = v12;
  if (v12)
  {
    [v12 acceptInvitationWithData:v9];
  }
  else
  {
    CFStringRef v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v18 = @"IDSDaemon";
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to accept invitation with data with, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)cancelInvitation:(id)a3 messageContext:(id)a4
{
  id v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    CFStringRef v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "cancelInvitation %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v12 = v6;
    _IDSLogV();
  }
  id v9 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v6, v7, kIDSSessionEntitlement, v12);
  id v10 = v9;
  if (v9)
  {
    [v9 cancelInvitation];
  }
  else
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v14 = @"IDSDaemon";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to cancel invitation, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)cancelInvitation:(id)a3 withData:(id)a4 messageContext:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "cancelInvitation %@ with data %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    __int16 v15 = v8;
    id v16 = v9;
    _IDSLogV();
  }
  id v12 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v10, kIDSSessionPrivateEntitlement, v15, v16);
  id v13 = v12;
  if (v12)
  {
    [v12 cancelInvitationWithData:v9];
  }
  else
  {
    CFStringRef v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v18 = @"IDSDaemon";
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to cancel invitation with data with, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)cancelInvitation:(id)a3 withRemoteEndedReasonOverride:(unsigned int)a4 messageContext:(id)a5
{
  uint64_t v6 = *(void *)&a4;
  id v8 = (__CFString *)a3;
  id v9 = a5;
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v17 = v8;
    __int16 v18 = 1024;
    LODWORD(v19) = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "cancelInvitation %@ with remote ended reason override %u", buf, 0x12u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v14 = v8;
    uint64_t v15 = v6;
    _IDSLogV();
  }
  id v11 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v9, kIDSSessionPrivateEntitlement, v14, v15);
  id v12 = v11;
  if (v11)
  {
    [v11 cancelInvitationWithRemoteEndedReasonOverride:v6];
  }
  else
  {
    id v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v17 = @"IDSDaemon";
      __int16 v18 = 2112;
      __int16 v19 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to cancel invitation with remote ended reason override with, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)declineInvitation:(id)a3 messageContext:(id)a4
{
  uint64_t v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    CFStringRef v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "declineInvitation %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v12 = v6;
    _IDSLogV();
  }
  id v9 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v6, v7, kIDSSessionEntitlement, v12);
  id v10 = v9;
  if (v9)
  {
    [v9 declineInvitation];
  }
  else
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v14 = @"IDSDaemon";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to decline invitation, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)declineInvitation:(id)a3 withData:(id)a4 messageContext:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "declineInvitation %@ with data %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    __int16 v15 = v8;
    id v16 = v9;
    _IDSLogV();
  }
  id v12 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v10, kIDSSessionPrivateEntitlement, v15, v16);
  id v13 = v12;
  if (v12)
  {
    [v12 declineInvitationWithData:v9];
  }
  else
  {
    CFStringRef v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v18 = @"IDSDaemon";
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to decline invitation with data with, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)reconnectSessionWithUniqueID:(id)a3 messageContext:(id)a4
{
  uint64_t v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    CFStringRef v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "reconnectSessionWithUniqueID %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v12 = v6;
    _IDSLogV();
  }
  id v9 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v6, v7, kIDSSessionEntitlement, v12);
  id v10 = v9;
  if (v9)
  {
    [v9 reconnectSession];
  }
  else
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v14 = @"IDSDaemon";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to reconnect session, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)endSession:(id)a3 messageContext:(id)a4
{
  uint64_t v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    CFStringRef v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "endSession %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v12 = v6;
    _IDSLogV();
  }
  id v9 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v6, v7, kIDSSessionEntitlement, v12);
  id v10 = v9;
  if (v9)
  {
    [v9 endSession];
  }
  else
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v14 = @"IDSDaemon";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to end session, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)endSession:(id)a3 withData:(id)a4 messageContext:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v18 = v8;
    __int16 v19 = 2048;
    id v20 = (__CFString *)[v9 length];
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "endSessionWithData %@ (data length %lu)", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    __int16 v15 = v8;
    id v16 = [v9 length];
    _IDSLogV();
  }
  id v12 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v10, kIDSSessionPrivateEntitlement, v15, v16);
  id v13 = v12;
  if (v12)
  {
    [v12 endSessionWithData:v9];
  }
  else
  {
    CFStringRef v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v18 = @"IDSDaemon";
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to end session with data, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)sendSessionMessage:(id)a3 toDestinations:(id)a4 forSessionWithUniqueID:(id)a5 messageContext:(id)a6
{
  id v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  CFStringRef v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412802;
    CFStringRef v22 = v10;
    __int16 v23 = 2112;
    id v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "sendSessionMessage %@ to session %@ with context %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v19 = v12;
    id v20 = v13;
    CFStringRef v18 = v10;
    _IDSLogV();
  }
  __int16 v15 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v12, v13, kIDSSessionPrivateEntitlement, v18, v19, v20);
  id v16 = v15;
  if (v15)
  {
    [v15 sendSessionMessage:v10 toDestinations:v11];
  }
  else
  {
    CFStringRef v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v22 = @"IDSDaemon";
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to send message to, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)setAudioEnabled:(BOOL)a3 forSessionWithUniqueID:(id)a4 messageContext:(id)a5
{
  BOOL v6 = a3;
  id v8 = (__CFString *)a4;
  id v9 = a5;
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v6) {
      CFStringRef v11 = @"YES";
    }
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v19 = v8;
    __int16 v20 = 2112;
    CFStringRef v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setAudioEnabled:forSessionWithUniqueID %@ %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v12 = @"NO";
    if (v6) {
      CFStringRef v12 = @"YES";
    }
    id v16 = v8;
    CFStringRef v17 = v12;
    _IDSLogV();
  }
  id v13 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v9, kIDSSessionEntitlement, v16, v17);
  CFStringRef v14 = v13;
  if (v13)
  {
    [v13 setAudioEnabled:v6];
  }
  else
  {
    __int16 v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v19 = @"IDSDaemon";
      __int16 v20 = 2112;
      CFStringRef v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to set audio enabled, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)setMuted:(BOOL)a3 forSessionWithUniqueID:(id)a4 messageContext:(id)a5
{
  BOOL v6 = a3;
  id v8 = (__CFString *)a4;
  id v9 = a5;
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v6) {
      CFStringRef v11 = @"YES";
    }
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v19 = v8;
    __int16 v20 = 2112;
    CFStringRef v21 = v11;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setMuted:forSessionWithUniqueID %@ %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v12 = @"NO";
    if (v6) {
      CFStringRef v12 = @"YES";
    }
    id v16 = v8;
    CFStringRef v17 = v12;
    _IDSLogV();
  }
  id v13 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v9, kIDSSessionEntitlement, v16, v17);
  CFStringRef v14 = v13;
  if (v13)
  {
    [v13 setMuted:v6];
  }
  else
  {
    __int16 v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v19 = @"IDSDaemon";
      __int16 v20 = 2112;
      CFStringRef v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to set muted, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)setPreferences:(id)a3 forSessionWithUniqueID:(id)a4 messageContext:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  CFStringRef v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v18 = v9;
    __int16 v19 = 2112;
    __int16 v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "setPreferences:forSessionWithUniqueID %@ %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    __int16 v15 = v9;
    id v16 = v8;
    _IDSLogV();
  }
  CFStringRef v12 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v9, v10, kIDSSessionEntitlement, v15, v16);
  id v13 = v12;
  if (v12)
  {
    [v12 setPreferences:v8];
  }
  else
  {
    CFStringRef v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v18 = @"IDSDaemon";
      __int16 v19 = 2112;
      __int16 v20 = v9;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to set preferences, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)setRequiredCapabilities:(id)a3 requiredLackOfCapabilities:(id)a4 forSessionWithUniqueID:(id)a5 messageContext:(id)a6
{
  id v10 = (__CFString *)a3;
  id v11 = a4;
  CFStringRef v12 = (__CFString *)a5;
  id v13 = a6;
  CFStringRef v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412802;
    CFStringRef v22 = v12;
    __int16 v23 = 2112;
    id v24 = v10;
    __int16 v25 = 2112;
    id v26 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "setRequiredCapabilities:requiredCapabilities:forSessionWithUniqueID %@ %@ %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    __int16 v19 = v10;
    id v20 = v11;
    CFStringRef v18 = v12;
    _IDSLogV();
  }
  __int16 v15 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v12, v13, kIDSSessionEntitlement, v18, v19, v20);
  id v16 = v15;
  if (v15)
  {
    [v15 setRequiredCapabilities:v10 requiredLackOfCapabilities:v11];
  }
  else
  {
    CFStringRef v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v22 = @"IDSDaemon";
      __int16 v23 = 2112;
      id v24 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to set preferences, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)setInviteTimetout:(int64_t)a3 forSessionWithUniqueID:(id)a4 messageContext:(id)a5
{
  id v8 = (__CFString *)a4;
  id v9 = a5;
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v17 = v8;
    __int16 v18 = 2048;
    int64_t v19 = a3;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setInviteTimeout:forSessionWithUniqueID %@ %ld", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v14 = v8;
    int64_t v15 = a3;
    _IDSLogV();
  }
  id v11 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v9, kIDSSessionEntitlement, v14, v15);
  CFStringRef v12 = v11;
  if (v11)
  {
    [v11 setInviteTimeout:a3];
  }
  else
  {
    id v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v17 = @"IDSDaemon";
      __int16 v18 = 2112;
      int64_t v19 = (int64_t)v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to set invite timeout, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)acknowledgeSessionID:(id)a3 clientID:(id)a4 messageContext:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v19 = v8;
    __int16 v20 = 2112;
    CFStringRef v21 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "acknowledge sessionID: %@ clientID: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v16 = v8;
    CFStringRef v17 = v9;
    _IDSLogV();
  }
  CFStringRef v12 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v10, kIDSSessionEntitlement, v16, v17);
  if (v12)
  {
    id v13 = [v10 localObject];
    CFStringRef v14 = sub_100128E38(v9, v13);
    [v12 setClientID:v14];
  }
  else
  {
    int64_t v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v19 = @"IDSDaemon";
      __int16 v20 = 2112;
      CFStringRef v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to acknowledge session ID, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)sendAllocationRequest:(id)a3 options:(id)a4 messageContext:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    CFStringRef v20 = v8;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "sendAllocationRequest %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    __int16 v18 = v8;
    _IDSLogV();
  }
  CFStringRef v12 = +[IMLockdownManager sharedInstance];
  unsigned __int8 v13 = [v12 isInternalInstall];

  if (v13)
  {
    CFStringRef v14 = [(IDSDaemon *)self _sessionWithUniqueID:v8 messageContext:v10 requiredEntitlement:kIDSSessionEntitlement];
    int64_t v15 = v14;
    if (v14)
    {
      [v14 sendAllocationRequest:v9];
    }
    else
    {
      CFStringRef v17 = OSLogHandleForIDSCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
      {
        *(_DWORD *)os_activity_scope_state_s buf = 138412546;
        CFStringRef v20 = @"IDSDaemon";
        __int16 v21 = 2112;
        CFStringRef v22 = v8;
        _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to send allocation request, ignoring...", buf, 0x16u);
      }

      if (os_log_shim_legacy_logging_enabled())
      {
        _IDSWarnV();
        _IDSLogV();
        _IDSLogTransport();
      }
    }
  }
  else
  {
    id v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412290;
      CFStringRef v20 = @"IDSDaemon";
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@ - Operation supported on internal install only", buf, 0xCu);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)updateMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 withContext:(id)a6 messagingCapabilities:(id)a7 triggeredLocally:(BOOL)a8 lightweightStatusDict:(id)a9 messageContext:(id)a10
{
  BOOL v10 = a8;
  id v16 = a3;
  id v17 = a4;
  id v18 = a5;
  id v19 = a6;
  id v20 = a7;
  id v21 = a9;
  id v22 = a10;
  __int16 v23 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v23, OS_LOG_TYPE_DEFAULT))
  {
    id v24 = [v21 count];
    CFStringRef v25 = @"NO";
    *(_DWORD *)os_activity_scope_state_s buf = 138413570;
    *(void *)&uint8_t buf[4] = v16;
    if (v10) {
      CFStringRef v25 = @"YES";
    }
    *(_WORD *)&unsigned char buf[12] = 2112;
    *(void *)&buf[14] = v17;
    __int16 v37 = 2112;
    id v38 = v19;
    __int16 v39 = 2112;
    id v40 = v20;
    __int16 v41 = 2112;
    CFStringRef v42 = v25;
    __int16 v43 = 2048;
    id v44 = v24;
    _os_log_impl((void *)&_mh_execute_header, v23, OS_LOG_TYPE_DEFAULT, "updateMembers %@, for Group %@, context %@, capabilities %@, triggered locally %@, lightweightStatusDict count:%lu", buf, 0x3Eu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    if (v10) {
      CFStringRef v26 = @"YES";
    }
    else {
      CFStringRef v26 = @"NO";
    }
    CFStringRef v34 = v26;
    id v35 = [v21 count];
    id v32 = v19;
    id v33 = v20;
    id v30 = v16;
    id v31 = v17;
    _IDSLogV();
  }
  CFStringRef v27 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v18, v22, kIDSSessionEntitlement, v30, v31, v32, v33, v34, v35, *(_OWORD *)buf);
  uint64_t v28 = v27;
  if (v27)
  {
    [v27 updateMembers:v16 withContext:v19 messagingCapabilities:v20 triggeredLocally:v10 lightweightStatusDict:v21];
  }
  else
  {
    id v29 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      *(void *)&uint8_t buf[4] = @"IDSDaemon";
      *(_WORD *)&unsigned char buf[12] = 2112;
      *(void *)&buf[14] = v18;
      _os_log_impl((void *)&_mh_execute_header, v29, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to update members, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)manageDesignatedMembers:(id)a3 forGroup:(id)a4 sessionID:(id)a5 withType:(unsigned __int16)a6 messageContext:(id)a7
{
  uint64_t v8 = a6;
  CFStringRef v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a7;
  id v16 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412802;
    CFStringRef v24 = v12;
    __int16 v25 = 2112;
    id v26 = v13;
    __int16 v27 = 1024;
    int v28 = v8;
    _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_DEFAULT, "manageDesignatedMembers %@, for Group %@, type: %u", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v21 = v13;
    uint64_t v22 = v8;
    id v20 = v12;
    _IDSLogV();
  }
  id v17 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v14, v15, kIDSSessionEntitlement, v20, v21, v22);
  id v18 = v17;
  if (v17)
  {
    [v17 manageDesignatedMembers:v12 withType:v8];
  }
  else
  {
    id v19 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v24 = @"IDSDaemon";
      __int16 v25 = 2112;
      id v26 = v14;
      _os_log_impl((void *)&_mh_execute_header, v19, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to update members, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)removeParticipantIDs:(id)a3 forGroup:(id)a4 sessionID:(id)a5 messageContext:(id)a6
{
  BOOL v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "removeParticipantIDs %@, for Group %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v18 = v10;
    id v19 = v11;
    _IDSLogV();
  }
  id v15 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v12, v13, kIDSSessionEntitlement, v18, v19);
  id v16 = v15;
  if (v15)
  {
    [v15 removeParticipantIDs:v10];
  }
  else
  {
    id v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v21 = @"IDSDaemon";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to removeParticipantIDs, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)updateParticipantData:(id)a3 forGroup:(id)a4 sessionID:(id)a5 withContext:(id)a6 messageContext:(id)a7
{
  id v12 = (__CFString *)a3;
  id v13 = a4;
  id v14 = a5;
  id v15 = a6;
  id v16 = a7;
  id v17 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v17, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412802;
    CFStringRef v25 = v12;
    __int16 v26 = 2112;
    id v27 = v13;
    __int16 v28 = 2112;
    id v29 = v15;
    _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_DEFAULT, "updateParticipantData %@, for Group %@, context %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v22 = v13;
    id v23 = v15;
    CFStringRef v21 = v12;
    _IDSLogV();
  }
  id v18 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v14, v16, kIDSSessionEntitlement, v21, v22, v23);
  id v19 = v18;
  if (v18)
  {
    [v18 updateParticipantData:v12 withContext:v15];
  }
  else
  {
    id v20 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v25 = @"IDSDaemon";
      __int16 v26 = 2112;
      id v27 = v14;
      _os_log_impl((void *)&_mh_execute_header, v20, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to update members, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)updateParticipantInfo:(id)a3 forGroup:(id)a4 sessionID:(id)a5 messageContext:(id)a6
{
  BOOL v10 = (__CFString *)a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  id v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v21 = v10;
    __int16 v22 = 2112;
    id v23 = v11;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "updateParticipantData %@, for Group %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v18 = v10;
    id v19 = v11;
    _IDSLogV();
  }
  id v15 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v12, v13, kIDSSessionEntitlement, v18, v19);
  id v16 = v15;
  if (v15)
  {
    [v15 updateParticipantInfo:v10];
  }
  else
  {
    id v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v21 = @"IDSDaemon";
      __int16 v22 = 2112;
      id v23 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to update members, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)updateParticipantType:(unsigned __int16)a3 forGroup:(id)a4 sessionID:(id)a5 members:(id)a6 triggeredLocally:(BOOL)a7 withContext:(id)a8 lightweightStatusDict:(id)a9 messageContext:(id)a10
{
  BOOL v11 = a7;
  uint64_t v14 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a8;
  id v20 = a9;
  id v21 = a10;
  __int16 v22 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v22, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 67109634;
    *(_DWORD *)id v30 = v14;
    *(_WORD *)&void v30[4] = 2112;
    *(void *)&v30[6] = v16;
    *(_WORD *)&v30[14] = 2112;
    *(void *)&v30[16] = v19;
    _os_log_impl((void *)&_mh_execute_header, v22, OS_LOG_TYPE_DEFAULT, "updateParticipantType %u, for Group %@, context %@", buf, 0x1Cu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v27 = v16;
    id v28 = v19;
    uint64_t v26 = v14;
    _IDSLogV();
  }
  id v23 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v17, v21, kIDSSessionEntitlement, v26, v27, v28);
  CFStringRef v24 = v23;
  if (v23)
  {
    [v23 updateParticipantType:v14 members:v18 triggeredLocally:v11 withContext:v19 lightweightStatusDict:v20];
  }
  else
  {
    CFStringRef v25 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      *(void *)id v30 = @"IDSDaemon";
      *(_WORD *)&v30[8] = 2112;
      *(void *)&v30[10] = v17;
      _os_log_impl((void *)&_mh_execute_header, v25, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to update participantType, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)joinGroupSession:(id)a3 withOptions:(id)a4 messageContext:(id)a5
{
  uint64_t v8 = (__CFString *)a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  BOOL v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v18 = v8;
    __int16 v19 = 2112;
    id v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "joinGroupSession %@, options: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v15 = v8;
    id v16 = v9;
    _IDSLogV();
  }
  id v12 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v10, kIDSSessionEntitlement, v15, v16);
  id v13 = v12;
  if (v12)
  {
    [v12 joinWithOptions:v9 messageContext:v10];
  }
  else
  {
    uint64_t v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v18 = @"IDSDaemon";
      __int16 v19 = 2112;
      id v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to join group session, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)setQuickRelayUserTypeForSession:(id)a3 withUserType:(unsigned __int16)a4 messageContext:(id)a5
{
  uint64_t v6 = a4;
  id v8 = a3;
  id v9 = a5;
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 67109120;
    LODWORD(v16) = v6;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setQuickRelayUserTypeForSession %u", buf, 8u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    uint64_t v14 = v6;
    _IDSLogV();
  }
  BOOL v11 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v9, kIDSSessionEntitlement, v14);
  id v12 = v11;
  if (v11)
  {
    [v11 setQuickRelayUserTypeForSession:v6];
  }
  else
  {
    id v13 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v16 = @"IDSDaemon";
      __int16 v17 = 2112;
      id v18 = v8;
      _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to update members, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)leaveGroupSession:(id)a3 participantInfo:(id)a4 options:(id)a5 messageContext:(id)a6
{
  id v10 = (__CFString *)a3;
  BOOL v11 = (__CFString *)a4;
  id v12 = a5;
  id v13 = a6;
  uint64_t v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412802;
    CFStringRef v22 = v10;
    __int16 v23 = 2112;
    CFStringRef v24 = v11;
    __int16 v25 = 2112;
    id v26 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "leaveGroupSession %@, participantInfo: %@ options: %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    __int16 v19 = v11;
    id v20 = v12;
    id v18 = v10;
    _IDSLogV();
  }
  id v15 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v10, v13, kIDSSessionEntitlement, v18, v19, v20);
  CFStringRef v16 = v15;
  if (v15)
  {
    [v15 leaveGroupSession:v11 options:v12];
  }
  else
  {
    __int16 v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v22 = @"IDSDaemon";
      __int16 v23 = 2112;
      CFStringRef v24 = v10;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to leave group session, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)requestActiveParticipantsForGroupSession:(id)a3 messageContext:(id)a4
{
  uint64_t v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    CFStringRef v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "requestActiveParticipants for group session: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v12 = v6;
    _IDSLogV();
  }
  id v9 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v6, v7, kIDSSessionEntitlement, v12);
  if (v9)
  {
    id v10 = +[NSDictionary dictionaryWithObjectsAndKeys:](NSDictionary, "dictionaryWithObjectsAndKeys:", &off_1009D2460, IDSGlobalLinkOptionSessionInfoRequestTypeKey, 0);
    [v9 requestSessionInfoWithOptions:v10];
  }
  else
  {
    BOOL v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v14 = @"IDSDaemon";
      __int16 v15 = 2112;
      CFStringRef v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ for requestActiveParticipants, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)requestURIsForParticipantIDs:(id)a3 withRequestID:(id)a4 forGroupSession:(id)a5 messageContext:(id)a6
{
  id v10 = a3;
  id v11 = a4;
  id v12 = (__CFString *)a5;
  id v13 = a6;
  CFStringRef v14 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v14, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    CFStringRef v20 = v12;
    _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_DEFAULT, "requestURIsForParticipantIDs for group session: %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v18 = v12;
    _IDSLogV();
  }
  __int16 v15 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v12, v13, kIDSSessionEntitlement, v18);
  CFStringRef v16 = v15;
  if (v15)
  {
    [v15 requestURIsForParticipantIDs:v10 withRequestID:v11];
  }
  else
  {
    __int16 v17 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v20 = @"IDSDaemon";
      __int16 v21 = 2112;
      CFStringRef v22 = v12;
      _os_log_impl((void *)&_mh_execute_header, v17, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ for requestActiveParticipants, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)registerPluginForGroup:(id)a3 options:(id)a4 messageContext:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v18 = v8;
    __int16 v19 = 2112;
    CFStringRef v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "registerPluginForGroup %@, options: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    __int16 v15 = v8;
    CFStringRef v16 = v9;
    _IDSLogV();
  }
  id v12 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v10, kIDSSessionEntitlement, v15, v16);
  id v13 = v12;
  if (v12)
  {
    [v12 registerPluginWithOptions:v9 messageContext:v10];
  }
  else
  {
    CFStringRef v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v18 = @"IDSDaemon";
      __int16 v19 = 2112;
      CFStringRef v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to register plugin, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)unregisterPluginForGroup:(id)a3 options:(id)a4 messageContext:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = (__CFString *)a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v18 = v8;
    __int16 v19 = 2112;
    CFStringRef v20 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "unregisterPluginForGroup %@, options: %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    __int16 v15 = v8;
    CFStringRef v16 = v9;
    _IDSLogV();
  }
  id v12 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v10, kIDSSessionEntitlement, v15, v16);
  id v13 = v12;
  if (v12)
  {
    [v12 unregisterPluginWithOptions:v9 messageContext:v10];
  }
  else
  {
    CFStringRef v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v18 = @"IDSDaemon";
      __int16 v19 = 2112;
      CFStringRef v20 = v8;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to unregister plugin, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)requestEncryptionKeyForGroup:(id)a3 participants:(id)a4 messageContext:(id)a5
{
  id v8 = (__CFString *)a3;
  id v9 = a4;
  id v10 = a5;
  id v11 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v11, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412802;
    CFStringRef v19 = v8;
    __int16 v20 = 2048;
    id v21 = [v9 count];
    __int16 v22 = 2112;
    id v23 = v9;
    _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_DEFAULT, "requestEncryptionKeyForGroup %@, for %lu participants %@", buf, 0x20u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v16 = [v9 count];
    id v17 = v9;
    __int16 v15 = v8;
    _IDSLogV();
  }
  id v12 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v10, kIDSSessionEntitlement, v15, v16, v17);
  id v13 = v12;
  if (v12)
  {
    [v12 requestEncryptionKeyForParticipantIDs:v9];
  }
  else
  {
    CFStringRef v14 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v19 = @"IDSDaemon";
      __int16 v20 = 2112;
      id v21 = 0;
      _os_log_impl((void *)&_mh_execute_header, v14, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to request encryption keys, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)createAliasForParticipantID:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5 messageContext:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 134218242;
    CFStringRef v20 = (const __CFString *)a3;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "createAliasForParticipantID %llu salt %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    unint64_t v17 = a3;
    id v18 = v10;
    _IDSLogV();
  }
  CFStringRef v14 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v11, v12, kIDSSessionEntitlement, v17, v18);
  __int16 v15 = v14;
  if (v14)
  {
    [v14 createAliasForParticipantID:a3 salt:v10];
  }
  else
  {
    id v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v20 = @"IDSDaemon";
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to update members, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)getParticipantIDForAlias:(unint64_t)a3 salt:(id)a4 sessionID:(id)a5 messageContext:(id)a6
{
  id v10 = a4;
  id v11 = a5;
  id v12 = a6;
  id v13 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v13, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 134218242;
    CFStringRef v20 = (const __CFString *)a3;
    __int16 v21 = 2112;
    id v22 = v10;
    _os_log_impl((void *)&_mh_execute_header, v13, OS_LOG_TYPE_DEFAULT, "getParticipantIDForAlias %llu salt %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    unint64_t v17 = a3;
    id v18 = v10;
    _IDSLogV();
  }
  CFStringRef v14 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v11, v12, kIDSSessionEntitlement, v17, v18);
  __int16 v15 = v14;
  if (v14)
  {
    [v14 getParticipantIDForAlias:a3 salt:v10];
  }
  else
  {
    id v16 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v20 = @"IDSDaemon";
      __int16 v21 = 2112;
      id v22 = v11;
      _os_log_impl((void *)&_mh_execute_header, v16, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to update members, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)enableP2PlinksForSession:(id)a3 messageContext:(id)a4
{
  uint64_t v6 = (__CFString *)a3;
  id v7 = a4;
  id v8 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v8, OS_LOG_TYPE_DEFAULT))
  {
    *(_DWORD *)os_activity_scope_state_s buf = 138412290;
    CFStringRef v14 = v6;
    _os_log_impl((void *)&_mh_execute_header, v8, OS_LOG_TYPE_DEFAULT, "enableP2PlinksForSession %@", buf, 0xCu);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    id v12 = v6;
    _IDSLogV();
  }
  id v9 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v6, v7, kIDSSessionEntitlement, v12);
  id v10 = v9;
  if (v9)
  {
    [v9 enableP2Plinks];
  }
  else
  {
    id v11 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v14 = @"IDSDaemon";
      __int16 v15 = 2112;
      id v16 = v6;
      _os_log_impl((void *)&_mh_execute_header, v11, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to update members, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)setForceTCPFallbackOnWiFiUsingReinitiate:(BOOL)a3 forSessionWithUniqueID:(id)a4 messageContext:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v6) {
      CFStringRef v11 = @"YES";
    }
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v19 = v11;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setForceTCPFallbackOnWiFiUsingReinitiate: %@ %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v12 = @"NO";
    if (v6) {
      CFStringRef v12 = @"YES";
    }
    CFStringRef v16 = v12;
    id v17 = v8;
    _IDSLogV();
  }
  id v13 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v9, kIDSSessionEntitlement, v16, v17);
  CFStringRef v14 = v13;
  if (v13)
  {
    [v13 setForceTCPFallbackOnWiFiUsingReinitiate:v6];
  }
  else
  {
    __int16 v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v19 = @"IDSDaemon";
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to setForceTCPFallbackOnWiFiUsingReinitiate, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

- (void)setForceTCPFallbackOnCellUsingReinitiate:(BOOL)a3 forSessionWithUniqueID:(id)a4 messageContext:(id)a5
{
  BOOL v6 = a3;
  id v8 = a4;
  id v9 = a5;
  id v10 = OSLogHandleForIDSCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_DEFAULT))
  {
    CFStringRef v11 = @"NO";
    if (v6) {
      CFStringRef v11 = @"YES";
    }
    *(_DWORD *)os_activity_scope_state_s buf = 138412546;
    CFStringRef v19 = v11;
    __int16 v20 = 2112;
    id v21 = v8;
    _os_log_impl((void *)&_mh_execute_header, v10, OS_LOG_TYPE_DEFAULT, "setForceTCPFallbackOnCellUsingReinitiate: %@ %@", buf, 0x16u);
  }

  if (os_log_shim_legacy_logging_enabled() && _IDSShouldLog())
  {
    CFStringRef v12 = @"NO";
    if (v6) {
      CFStringRef v12 = @"YES";
    }
    CFStringRef v16 = v12;
    id v17 = v8;
    _IDSLogV();
  }
  id v13 = -[IDSDaemon _sessionWithUniqueID:messageContext:requiredEntitlement:](self, "_sessionWithUniqueID:messageContext:requiredEntitlement:", v8, v9, kIDSSessionEntitlement, v16, v17);
  CFStringRef v14 = v13;
  if (v13)
  {
    [v13 setForceTCPFallbackOnCellUsingReinitiate:v6];
  }
  else
  {
    __int16 v15 = OSLogHandleForIDSCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
    {
      *(_DWORD *)os_activity_scope_state_s buf = 138412546;
      CFStringRef v19 = @"IDSDaemon";
      __int16 v20 = 2112;
      id v21 = v8;
      _os_log_impl((void *)&_mh_execute_header, v15, OS_LOG_TYPE_ERROR, "%@ - Could not find session with uniqueID %@ to setForceTCPFallbackOnCellUsingReinitiate, ignoring...", buf, 0x16u);
    }

    if (os_log_shim_legacy_logging_enabled())
    {
      _IDSWarnV();
      _IDSLogV();
      _IDSLogTransport();
    }
  }
}

@end