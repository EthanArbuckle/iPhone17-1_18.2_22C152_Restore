@interface IMDRelayServiceController
+ (IMDRelayServiceController)sharedInstance;
+ (id)_convertIMDHandleToDictionary:(id)a3;
+ (id)_convertIMDHandlesToArray:(id)a3;
+ (id)_convertIMDHandlesToArrayOfIDs:(id)a3;
+ (id)_convertIMMessageItemDictionaryToIMMessageItem:(id)a3 timestamp:(id)a4;
+ (id)_convertIMMessageItemToIncomingRelayDictionary:(id)a3 chat:(id)a4 overridingAttachmentData:(id)a5;
+ (id)_convertIMMessageItemToOutgoingRelayDictionary:(id)a3 chat:(id)a4;
+ (id)_updateServiceOfMessageInMessageDict:(id)a3 toService:(id)a4;
- (BOOL)_canRelayMMS;
- (BOOL)_canRelayMessage:(id)a3 forChat:(id)a4;
- (BOOL)_checkMMSEnablementForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)_hasPhoneNumberAliasActive;
- (BOOL)_isConnectedOverBT:(id)a3;
- (BOOL)_isDefaultPairedDeviceRelayingLocally:(id)a3;
- (BOOL)_localDeviceSupportsSMS;
- (BOOL)_localDeviceSupportsSMSAndDoesNotHaveAPhoneNumberForSIMID:(id)a3;
- (BOOL)_localDeviceSupportsSMSAndHasAPhoneNumber;
- (BOOL)_needsLowQualityTranscodeForMessage:(id)a3;
- (BOOL)_relayMessageToPeers:(id)a3 forChat:(id)a4 serviceName:(id)a5 requiredCapabilities:(id)a6 reflectOnly:(BOOL)a7 excludesWatch:(BOOL)a8 onlyWatch:(BOOL)a9 overridingAttachmentData:(id)a10;
- (BOOL)_storeSMSRelayExecutionBlock:(id)a3 forMessageGUID:(id)a4;
- (BOOL)_syncedMMSEnabledValue;
- (BOOL)accountHasAlias:(id)a3 aliastoCheck:(id)a4;
- (BOOL)hasConnectedLocalDevice;
- (BOOL)hasPeerDevices;
- (BOOL)hasPhoneNumberAliasActiveCheckingSelf:(BOOL)a3;
- (BOOL)hasRelayDevice;
- (BOOL)isAliasActiveAndRelayCapable:(id)a3;
- (BOOL)isAliasActiveAndRelayCapable:(id)a3 checkingSelf:(BOOL)a4;
- (BOOL)isAliasRelayCapable:(id)a3;
- (BOOL)isAliasRelayCapable:(id)a3 checkingSelf:(BOOL)a4;
- (BOOL)isLocalDeviceProxyRegistered;
- (BOOL)isProxyRegistered;
- (BOOL)isRegistered;
- (BOOL)isSMSRelayEnabled;
- (BOOL)relayDictionaryToPeers:(id)a3 requiresUpload:(BOOL)a4 serviceName:(id)a5;
- (BOOL)relayDictionaryToPeers:(id)a3 requiresUpload:(BOOL)a4 serviceName:(id)a5 requiredCapabilities:(id)a6;
- (BOOL)relayDictionaryToPeers:(id)a3 requiresUpload:(BOOL)a4 serviceName:(id)a5 requiredCapabilities:(id)a6 excludesWatch:(BOOL)a7 onlyWatch:(BOOL)a8;
- (BOOL)relayMessageToPeers:(id)a3 forChat:(id)a4 serviceName:(id)a5 reflectOnly:(BOOL)a6 requiredCapabilities:(id)a7;
- (BOOL)sendDataToPeers:(id)a3 forcedCallerID:(id)a4 shouldFilterRecepients:(BOOL)a5 requestProxySend:(BOOL)a6 dontSendTo:(id)a7;
- (BOOL)sendDataToPeers:(id)a3 forcedCallerID:(id)a4 shouldFilterRecepients:(BOOL)a5 requestProxySend:(BOOL)a6 dontSendTo:(id)a7 sentToDevices:(id *)a8;
- (BOOL)sendEnrollmentRelatedMessageOverIDS:(id)a3 deviceToSendTo:(id)a4;
- (BOOL)sendFileToLocalPeers:(id)a3 metadata:(id)a4;
- (BOOL)sendToLocalPeers:(id)a3;
- (BOOL)watchConnectedOverBT;
- (IDSService)relayService;
- (IDSService)smsRelayService;
- (IDSService)smsWatchService;
- (IMDRelayDeletionController)deletionController;
- (IMDRelayEnrollmentController)enrollmentController;
- (IMDRelayPushHandler)smsRelayPushHandler;
- (IMDRelayServiceController)init;
- (IMOneTimeCodeUtilities)otcUtilities;
- (NSArray)accounts;
- (NSArray)peerDevices;
- (NSMutableDictionary)smsRelayBlockMap;
- (NSString)_callerIDForRelay;
- (NSString)dominentPhoneNumberAlias;
- (id)_IDSService;
- (id)_account;
- (id)_callerIDAccountFromSettings;
- (id)_callerIDForRelayAccountID:(id)a3;
- (id)_destinationForDevice:(id)a3 forcedIdentity:(id)a4;
- (id)_deviceForCallerID:(id)a3;
- (id)_extraOptionsForReachabilityRelayWithRequestID:(id)a3;
- (id)_sendOptionsForRelayMessage:(id)a3 command:(int64_t)a4 guid:(id)a5;
- (id)accountForAlias:(id)a3 fromAccounts:(id)a4;
- (id)idsDeviceForFromID:(id)a3;
- (id)idsDeviceFromPushToken:(id)a3;
- (id)idsDeviceFromUniqueID:(id)a3;
- (id)localDevice;
- (id)pairedDevice;
- (id)phoneAliasForDominentPhoneAlias:(id)a3 registeredPhoneNumber:(id)a4 preferedCallerID:(id)a5 CTPhoneNumber:(id)a6;
- (id)retrieveAccountAndPhoneAliasForAccounts:(id)a3 shouldFilterRecepients:(BOOL)a4 requestProxySend:(BOOL)a5 preferredCallerID:(id)a6;
- (id)retrievePhoneAccountAndPhoneAliasFromIDSAccounts:(id)a3;
- (id)sendReachabilityRequest:(id)a3 requestID:(id)a4;
- (int64_t)_maxWatchTransferSize;
- (unsigned)_readMMSUserOverrideForSingleSubscription;
- (void)_broadcastMessageEventWithCommand:(int64_t)a3 eventName:(id)a4 forGUID:(id)a5;
- (void)_broadcastMessageEventWithCommand:(int64_t)a3 eventName:(id)a4 forGUID:(id)a5 messageExtras:(id)a6;
- (void)_broadcastMessageEventWithCommand:(int64_t)a3 eventName:(id)a4 forGUID:(id)a5 messageExtras:(id)a6 shouldFilterRecipients:(BOOL)a7 forcedCallerID:(id)a8;
- (void)_checkAndSetRelayService;
- (void)_clearSMSRelayMapForMessageWithGUID:(id)a3;
- (void)_executeSMSRelayBlockForMessageWithGUID:(id)a3;
- (void)_executeSMSRelayBlockForMessageWithGUID:(id)a3 category:(int64_t)a4 subCategory:(int64_t)a5;
- (void)_forwardMessageEventToLocalPeers:(id)a3 forGUID:(id)a4 metadata:(id)a5;
- (void)_forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6 hasAttachment:(BOOL)a7 watchOnly:(BOOL)a8 sentToDevices:(id *)a9 requiredCapabilities:(id)a10;
- (void)_handleCapabilitiesChanged:(id)a3;
- (void)_prepareSMSRelayBlockForMessageDictionary:(id)a3 messageGUID:(id)a4 serviceName:(id)a5;
- (void)_registerForAccountChanges;
- (void)_relayEditedMessage:(id)a3 messageGUID:(id)a4 serializedHandles:(id)a5 chatStyle:(unsigned __int8)a6 callerID:(id)a7;
- (void)_relayMessageDict:(id)a3 command:(int64_t)a4 messageID:(id)a5 forcedCallerID:(id)a6 didSendSMS:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 hasAttachments:(BOOL)a10 requiredCapabilities:(id)a11;
- (void)_relayMessageDict:(id)a3 command:(int64_t)a4 messageID:(id)a5 forcedCallerID:(id)a6 didSendSMS:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 hasAttachments:(BOOL)a10 sentToDevices:(id *)a11 extraOptions:(id)a12 requiredCapabilities:(id)a13;
- (void)_relayMessageDict:(id)a3 command:(int64_t)a4 messageID:(id)a5 forcedCallerID:(id)a6 didSendSMS:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 hasAttachments:(BOOL)a10 sentToDevices:(id *)a11 requiredCapabilities:(id)a12;
- (void)_relayMessageDict:(id)a3 messageID:(id)a4 forcedCallerID:(id)a5 didSendSMS:(BOOL)a6 relayToWatchOnly:(BOOL)a7 shouldDisableScreenTimeRestrictions:(BOOL)a8 hasAttachments:(BOOL)a9 requiredCapabilities:(id)a10;
- (void)_relayMessageToPairedDevice:(id)a3 messageID:(id)a4 hasAttachments:(BOOL)a5;
- (void)_sendMessageToAllSMSRelayDevicesWithOptions:(id)a3;
- (void)_sendMessageToPairedDeviceWithOptions:(id)a3;
- (void)_setupIDSRelayServices;
- (void)_setupMMSObservation;
- (void)_synchronizeMMSCapabilityToWatch:(BOOL)a3;
- (void)_teardownMMSObservation;
- (void)account:(id)a3 aliasesChanged:(id)a4;
- (void)dealloc;
- (void)didReceiveMessageError:(id)a3;
- (void)forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6;
- (void)forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6 hasAttachment:(BOOL)a7 watchOnly:(BOOL)a8;
- (void)forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6 watchOnly:(BOOL)a7;
- (void)messageDelivered:(id)a3;
- (void)messageFailedToSend:(id)a3;
- (void)messageGUIDReadByRemote:(id)a3 timeRead:(id)a4;
- (void)messageReadByRemote:(id)a3;
- (void)messageSent:(id)a3 onService:(id)a4 compatibilityService:(id)a5;
- (void)messageSent:(id)a3 onService:(id)a4 compatibilityService:(id)a5 wasInterworked:(BOOL)a6;
- (void)reflectGroupMutation:(id)a3 callerID:(id)a4 didOccurLocally:(BOOL)a5;
- (void)relayMessage:(id)a3 chat:(id)a4 didSendSMS:(BOOL)a5 attemptingReplication:(BOOL)a6 forceReflection:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 callerID:(id)a10 iMessageCapability:(int64_t)a11 requiredCapabilities:(id)a12;
- (void)sendDeleteCommand:(id)a3 forChatGUID:(id)a4;
- (void)sendEditedMessage:(id)a3 toChat:(id)a4 fromCallerID:(id)a5 backwardCompatabilityText:(id)a6;
- (void)sendReachabilityResponse:(id)a3 requestID:(id)a4 toToken:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7;
- (void)sendReadReceiptForMessage:(id)a3 toChat:(id)a4;
- (void)sendReadReceiptForMessage:(id)a3 toChat:(id)a4 reflectOnly:(BOOL)a5;
- (void)sendReadReceiptForMessageGUID:(id)a3 timeRead:(id)a4;
- (void)sendReadReceiptForMessageGUID:(id)a3 timeRead:(id)a4 reflectOnly:(BOOL)a5;
- (void)sendRecoverCommand:(id)a3 forChatGUID:(id)a4;
- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7;
- (void)service:(id)a3 activeAccountsChanged:(id)a4;
- (void)service:(id)a3 devicesChanged:(id)a4;
- (void)setIsRegistered:(BOOL)a3;
- (void)setOtcUtilities:(id)a3;
- (void)setRelayService:(id)a3;
- (void)setSmsRelayBlockMap:(id)a3;
- (void)setSmsRelayPushHandler:(id)a3;
- (void)setSmsRelayService:(id)a3;
- (void)setSmsWatchService:(id)a3;
- (void)updateMMSCapability;
- (void)updateRelayStatus;
@end

@implementation IMDRelayServiceController

- (void)_setupIDSRelayServices
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  if ([MEMORY[0x1E4F6E730] isMessagesInstalled])
  {
    id v3 = objc_alloc(MEMORY[0x1E4F6AB90]);
    v4 = (__CFString *)*MEMORY[0x1E4F6AA68];
    v5 = (void *)[v3 initWithService:*MEMORY[0x1E4F6AA68]];
    [(IMDRelayServiceController *)self setSmsRelayService:v5];

    if (IMOSLoggingEnabled())
    {
      v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v7 = [(IMDRelayServiceController *)self smsRelayService];
        v8 = [v7 accounts];
        int v17 = 138412546;
        v18 = v4;
        __int16 v19 = 2048;
        uint64_t v20 = [v8 count];
        _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "Finished setting Up Relay Service (Service: %@), number of accounts: %lu", (uint8_t *)&v17, 0x16u);
      }
    }
    v9 = (void *)[objc_alloc(MEMORY[0x1E4F6AB90]) initWithService:@"com.apple.private.alloy.sms.watch"];
    [(IMDRelayServiceController *)self setSmsWatchService:v9];

    if (IMOSLoggingEnabled())
    {
      v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        v11 = [(IMDRelayServiceController *)self smsWatchService];
        v12 = [v11 accounts];
        uint64_t v13 = [v12 count];
        int v17 = 138412546;
        v18 = @"com.apple.private.alloy.sms.watch";
        __int16 v19 = 2048;
        uint64_t v20 = v13;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Finished setting Up SMS Watch Relay Service (Service: %@), number of accounts: %lu", (uint8_t *)&v17, 0x16u);
      }
    }
    v14 = [(IMDRelayServiceController *)self smsRelayService];
    [v14 addDelegate:self queue:MEMORY[0x1E4F14428]];

    v15 = [(IMDRelayServiceController *)self smsWatchService];
    [v15 addDelegate:self queue:MEMORY[0x1E4F14428]];

    [(IMDRelayServiceController *)self _checkAndSetRelayService];
  }
  else if (IMOSLoggingEnabled())
  {
    v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Messages is not installed, don't setup the relay serrvices", (uint8_t *)&v17, 2u);
    }
  }
}

- (id)_callerIDForRelayAccountID:(id)a3
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v21 = v4;
  if (v4)
  {
    id v5 = v4;
    id v6 = objc_alloc(MEMORY[0x1E4F6AAC8]);
    v7 = (void *)[v6 initWithService:*MEMORY[0x1E4F6AA78]];
    v8 = [v7 accountWithUniqueID:v5];
    v9 = v8;
    if (v8)
    {
      v10 = [v8 displayName];
      if (IMOSLoggingEnabled())
      {
        v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v28 = (uint64_t)v10;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Found Caller ID %@", buf, 0xCu);
        }
      }
    }
    else
    {
      v10 = 0;
    }
  }
  else
  {
    long long v24 = 0u;
    long long v25 = 0u;
    long long v22 = 0u;
    long long v23 = 0u;
    v12 = [(IMDRelayServiceController *)self relayService];
    v7 = [v12 accounts];

    v10 = 0;
    uint64_t v13 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    if (v13)
    {
      uint64_t v14 = *(void *)v23;
      do
      {
        for (uint64_t i = 0; i != v13; ++i)
        {
          if (*(void *)v23 != v14) {
            objc_enumerationMutation(v7);
          }
          v16 = *(void **)(*((void *)&v22 + 1) + 8 * i);
          if ([v16 accountType] == 1)
          {
            uint64_t v17 = [v16 displayName];
            if (IMOSLoggingEnabled())
            {
              v18 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412290;
                uint64_t v28 = v17;
                _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Found Caller ID %@", buf, 0xCu);
              }
            }
            v10 = (void *)v17;
          }
        }
        uint64_t v13 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
      }
      while (v13);
    }
  }

  __int16 v19 = IMNormalizePhoneNumber();

  return v19;
}

- (BOOL)watchConnectedOverBT
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v3 = [(IMDRelayServiceController *)self relayService];
  id v4 = [v3 devices];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
  if (v5)
  {
    uint64_t v6 = v5;
    uint64_t v7 = *(void *)v15;
LABEL_3:
    uint64_t v8 = 0;
    while (1)
    {
      if (*(void *)v15 != v7) {
        objc_enumerationMutation(v4);
      }
      v9 = *(void **)(*((void *)&v14 + 1) + 8 * v8);
      if ([v9 deviceType] == 6)
      {
        if ([v9 isLocallyPaired])
        {
          v18 = v9;
          BOOL v10 = 1;
          v11 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v18 count:1];
          BOOL v12 = [(IMDRelayServiceController *)self _isConnectedOverBT:v11];

          if (v12) {
            break;
          }
        }
      }
      if (v6 == ++v8)
      {
        uint64_t v6 = [v4 countByEnumeratingWithState:&v14 objects:v19 count:16];
        if (v6) {
          goto LABEL_3;
        }
        goto LABEL_11;
      }
    }
  }
  else
  {
LABEL_11:
    BOOL v10 = 0;
  }

  return v10;
}

- (NSString)dominentPhoneNumberAlias
{
  uint64_t v32 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  id v4 = [(IMDRelayServiceController *)self relayService];
  uint64_t v5 = [v4 accounts];

  obuint64_t j = v5;
  uint64_t v6 = [v5 countByEnumeratingWithState:&v26 objects:v31 count:16];
  if (v6)
  {
    uint64_t v7 = v6;
    uint64_t v8 = *(void *)v27;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v8) {
          objc_enumerationMutation(obj);
        }
        BOOL v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if ([v10 accountType] == 1)
        {
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          v11 = objc_msgSend(v10, "im_registeredURIs");
          uint64_t v12 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v12)
          {
            uint64_t v13 = v12;
            uint64_t v14 = *(void *)v23;
            do
            {
              for (uint64_t j = 0; j != v13; ++j)
              {
                if (*(void *)v23 != v14) {
                  objc_enumerationMutation(v11);
                }
                long long v16 = *(void **)(*((void *)&v22 + 1) + 8 * j);
                if ([v16 _appearsToBePhoneNumber]
                  && [(IMDRelayServiceController *)self isAliasRelayCapable:v16])
                {
                  [v3 addObject:v16];
                }
              }
              uint64_t v13 = [v11 countByEnumeratingWithState:&v22 objects:v30 count:16];
            }
            while (v13);
          }
        }
      }
      uint64_t v7 = [obj countByEnumeratingWithState:&v26 objects:v31 count:16];
    }
    while (v7);
  }

  if (v3)
  {
    long long v17 = [v3 sortedArrayUsingSelector:sel_localizedCaseInsensitiveCompare_];
    v18 = [v17 firstObject];
  }
  else
  {
    v18 = 0;
  }
  __int16 v19 = IMNormalizePhoneNumber();

  return (NSString *)v19;
}

- (void)_registerForAccountChanges
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  long long v12 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  long long v15 = 0u;
  id v3 = [(IMDRelayServiceController *)self relayService];
  id v4 = [v3 accounts];

  uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
  if (v5)
  {
    uint64_t v6 = *(void *)v13;
    uint64_t v7 = MEMORY[0x1E4F14428];
    do
    {
      for (uint64_t i = 0; i != v5; ++i)
      {
        if (*(void *)v13 != v6) {
          objc_enumerationMutation(v4);
        }
        v9 = *(void **)(*((void *)&v12 + 1) + 8 * i);
        if ([v9 accountType] == 1)
        {
          if (IMOSLoggingEnabled())
          {
            BOOL v10 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)v11 = 0;
              _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Registering for Account alias changes", v11, 2u);
            }
          }
          [v9 addRegistrationDelegate:self queue:v7];
        }
      }
      uint64_t v5 = [v4 countByEnumeratingWithState:&v12 objects:v16 count:16];
    }
    while (v5);
  }
}

- (BOOL)_hasPhoneNumberAliasActive
{
  return MEMORY[0x1F4181798](self, sel_hasPhoneNumberAliasActiveCheckingSelf_);
}

- (BOOL)hasPhoneNumberAliasActiveCheckingSelf:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  long long v26 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  long long v29 = 0u;
  uint64_t v5 = [(IMDRelayServiceController *)self relayService];
  uint64_t v6 = [v5 accounts];

  uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v33 count:16];
  if (v7)
  {
    uint64_t v21 = *(void *)v27;
    *(void *)&long long v8 = 138412290;
    long long v20 = v8;
    do
    {
      for (uint64_t i = 0; i != v7; ++i)
      {
        if (*(void *)v27 != v21) {
          objc_enumerationMutation(v6);
        }
        BOOL v10 = *(void **)(*((void *)&v26 + 1) + 8 * i);
        if (objc_msgSend(v10, "accountType", v20) == 1)
        {
          if (IMOSLoggingEnabled())
          {
            v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              long long v12 = objc_msgSend(v10, "im_registeredURIs");
              *(_DWORD *)buf = v20;
              uint64_t v32 = v12;
              _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "aliases for AppleID account are %@", buf, 0xCu);
            }
          }
          long long v24 = 0u;
          long long v25 = 0u;
          long long v22 = 0u;
          long long v23 = 0u;
          long long v13 = objc_msgSend(v10, "im_registeredURIs");
          uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
          if (v14)
          {
            uint64_t v15 = *(void *)v23;
            while (2)
            {
              for (uint64_t j = 0; j != v14; ++j)
              {
                if (*(void *)v23 != v15) {
                  objc_enumerationMutation(v13);
                }
                uint64_t v17 = *(void **)(*((void *)&v22 + 1) + 8 * j);
                if ([v17 _appearsToBePhoneNumber]
                  && [(IMDRelayServiceController *)self isAliasRelayCapable:v17 checkingSelf:v3])
                {

                  BOOL v18 = 1;
                  goto LABEL_26;
                }
              }
              uint64_t v14 = [v13 countByEnumeratingWithState:&v22 objects:v30 count:16];
              if (v14) {
                continue;
              }
              break;
            }
          }
        }
      }
      uint64_t v7 = [v6 countByEnumeratingWithState:&v26 objects:v33 count:16];
      BOOL v18 = 0;
    }
    while (v7);
  }
  else
  {
    BOOL v18 = 0;
  }
LABEL_26:

  return v18;
}

- (BOOL)isAliasActiveAndRelayCapable:(id)a3
{
  return MEMORY[0x1F4181798](self, sel_isAliasActiveAndRelayCapable_checkingSelf_);
}

- (BOOL)isAliasActiveAndRelayCapable:(id)a3 checkingSelf:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v7 = [(IMDRelayServiceController *)self relayService];
  obuint64_t j = [v7 accounts];

  uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v8)
  {
    uint64_t v22 = *(void *)v29;
    *(void *)&long long v9 = 138412290;
    long long v21 = v9;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v29 != v22) {
          objc_enumerationMutation(obj);
        }
        v11 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (objc_msgSend(v11, "accountType", v21) == 1)
        {
          if (IMOSLoggingEnabled())
          {
            long long v12 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
            {
              long long v13 = objc_msgSend(v11, "im_registeredURIs");
              *(_DWORD *)buf = v21;
              uint64_t v34 = v13;
              _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "aliases for AppleID account are %@", buf, 0xCu);
            }
          }
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          uint64_t v14 = objc_msgSend(v11, "im_registeredURIs");
          uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v15)
          {
            uint64_t v16 = *(void *)v25;
            while (2)
            {
              for (uint64_t j = 0; j != v15; ++j)
              {
                if (*(void *)v25 != v16) {
                  objc_enumerationMutation(v14);
                }
                BOOL v18 = *(void **)(*((void *)&v24 + 1) + 8 * j);
                if ([v18 isEqualToString:v6]
                  && [(IMDRelayServiceController *)self isAliasRelayCapable:v18 checkingSelf:v4])
                {

                  BOOL v19 = 1;
                  goto LABEL_26;
                }
              }
              uint64_t v15 = [v14 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v15) {
                continue;
              }
              break;
            }
          }
        }
      }
      uint64_t v8 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
      BOOL v19 = 0;
    }
    while (v8);
  }
  else
  {
    BOOL v19 = 0;
  }
LABEL_26:

  return v19;
}

- (BOOL)hasRelayDevice
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v3 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  BOOL v4 = [(IMDRelayServiceController *)self relayService];
  uint64_t v5 = [v4 devices];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
  int v7 = 0;
  if (v6)
  {
    uint64_t v8 = *(void *)v20;
    do
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v20 != v8) {
          objc_enumerationMutation(v5);
        }
        BOOL v10 = *(void **)(*((void *)&v19 + 1) + 8 * i);
        if (([v10 supportsSMSRelay] & 1) != 0 || objc_msgSend(v10, "supportsMMSRelay"))
        {
          v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
          int v12 = [v11 isSMSFilterSyncEnabled];

          ++v7;
          if (v12)
          {
            long long v13 = [v10 uniqueIDOverride];
            [v3 addObject:v13];
          }
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v19 objects:v25 count:16];
    }
    while (v6);
  }

  uint64_t v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v15 = [v14 isSMSFilterSyncEnabled];

  if (v15 && [MEMORY[0x1E4F6E938] supportsIncomingSMSRelayFiltering])
  {
    [MEMORY[0x1E4F6E930] verifyCurrentRelayDevicesActive:v3];
    uint64_t v16 = +[IMDFilteringController sharedInstance];
    [v16 disableFilteringIfNeeded];
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 67109120;
      int v24 = v7;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Found %d Relayable Devices", buf, 8u);
    }
  }
  return v7 > 0;
}

- (BOOL)hasPeerDevices
{
  v2 = [(IMDRelayServiceController *)self relayService];
  id v3 = [v2 devices];
  BOOL v4 = [v3 count] != 0;

  return v4;
}

- (BOOL)isAliasRelayCapable:(id)a3
{
  return [(IMDRelayServiceController *)self isAliasRelayCapable:a3 checkingSelf:1];
}

- (BOOL)isAliasRelayCapable:(id)a3 checkingSelf:(BOOL)a4
{
  BOOL v4 = a4;
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    int v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v39 = v6;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Checking if Alias %@ is active for SMS Relay ", buf, 0xCu);
    }
  }
  if ([v6 length])
  {
    if (v4
      && ([MEMORY[0x1E4F6E660] myCTPhoneNumber],
          uint64_t v8 = objc_claimAutoreleasedReturnValue(),
          char v9 = MEMORY[0x1E0169E10](v6, v8),
          v8,
          (v9 & 1) != 0))
    {
      BOOL v10 = 1;
    }
    else
    {
      long long v34 = 0u;
      long long v35 = 0u;
      long long v32 = 0u;
      long long v33 = 0u;
      v11 = [(IMDRelayServiceController *)self relayService];
      obuint64_t j = [v11 devices];

      uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
      if (v26)
      {
        uint64_t v25 = *(void *)v33;
        do
        {
          for (uint64_t i = 0; i != v26; ++i)
          {
            if (*(void *)v33 != v25) {
              objc_enumerationMutation(obj);
            }
            long long v13 = *(void **)(*((void *)&v32 + 1) + 8 * i);
            if (([v13 supportsSMSRelay] & 1) != 0 || objc_msgSend(v13, "supportsMMSRelay"))
            {
              if (IMOSLoggingEnabled())
              {
                uint64_t v14 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  id v39 = v13;
                  _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Checking Device %@", buf, 0xCu);
                }
              }
              long long v30 = 0u;
              long long v31 = 0u;
              long long v28 = 0u;
              long long v29 = 0u;
              int v15 = [v13 linkedUserURIs];
              uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
              if (v16)
              {
                uint64_t v17 = *(void *)v29;
                while (2)
                {
                  for (uint64_t j = 0; j != v16; ++j)
                  {
                    if (*(void *)v29 != v17) {
                      objc_enumerationMutation(v15);
                    }
                    long long v19 = *(void **)(*((void *)&v28 + 1) + 8 * j);
                    if (IMOSLoggingEnabled())
                    {
                      long long v20 = OSLogHandleForIMFoundationCategory();
                      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                      {
                        *(_DWORD *)buf = 138412290;
                        id v39 = v19;
                        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Checking linked URI: %@", buf, 0xCu);
                      }
                    }
                    long long v21 = [v19 _stripFZIDPrefix];
                    int v22 = MEMORY[0x1E0169E10](v21, v6);

                    if (v22)
                    {
                      if (IMOSLoggingEnabled())
                      {
                        long long v23 = OSLogHandleForIMFoundationCategory();
                        if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                        {
                          *(_DWORD *)buf = 138412290;
                          id v39 = v19;
                          _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "LinkedURI is active for SMS Relay, Returning %@", buf, 0xCu);
                        }
                      }
                      BOOL v10 = 1;
                      goto LABEL_43;
                    }
                  }
                  uint64_t v16 = [v15 countByEnumeratingWithState:&v28 objects:v36 count:16];
                  if (v16) {
                    continue;
                  }
                  break;
                }
              }
            }
          }
          uint64_t v26 = [obj countByEnumeratingWithState:&v32 objects:v37 count:16];
          BOOL v10 = 0;
        }
        while (v26);
      }
      else
      {
        BOOL v10 = 0;
      }
LABEL_43:
    }
  }
  else
  {
    BOOL v10 = 0;
  }

  return v10;
}

- (id)_deviceForCallerID:(id)a3
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v28 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  long long v31 = 0u;
  uint64_t v5 = [(IMDRelayServiceController *)self relayService];
  obuint64_t j = [v5 devices];

  uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
  if (v22)
  {
    uint64_t v21 = *(void *)v29;
    do
    {
      for (uint64_t i = 0; i != v22; ++i)
      {
        if (*(void *)v29 != v21) {
          objc_enumerationMutation(obj);
        }
        int v7 = *(void **)(*((void *)&v28 + 1) + 8 * i);
        if (([v7 supportsSMSRelay] & 1) != 0 || objc_msgSend(v7, "supportsMMSRelay"))
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v8 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              long long v34 = v7;
              _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Checking Device %@", buf, 0xCu);
            }
          }
          long long v26 = 0u;
          long long v27 = 0u;
          long long v24 = 0u;
          long long v25 = 0u;
          char v9 = [v7 linkedUserURIs];
          uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
          if (v10)
          {
            uint64_t v11 = *(void *)v25;
            while (2)
            {
              for (uint64_t j = 0; j != v10; ++j)
              {
                if (*(void *)v25 != v11) {
                  objc_enumerationMutation(v9);
                }
                long long v13 = *(void **)(*((void *)&v24 + 1) + 8 * j);
                if (IMOSLoggingEnabled())
                {
                  uint64_t v14 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
                  {
                    *(_DWORD *)buf = 138412290;
                    long long v34 = v13;
                    _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Checking linked URI: %@", buf, 0xCu);
                  }
                }
                int v15 = [v13 _stripFZIDPrefix];
                int v16 = MEMORY[0x1E0169E10](v15, v4);

                if (v16)
                {
                  if (IMOSLoggingEnabled())
                  {
                    long long v19 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      long long v34 = v7;
                      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "This device has the linkedURI we are looking for, return %@", buf, 0xCu);
                    }
                  }
                  id v17 = v7;

                  BOOL v18 = v17;
                  goto LABEL_33;
                }
              }
              uint64_t v10 = [v9 countByEnumeratingWithState:&v24 objects:v32 count:16];
              if (v10) {
                continue;
              }
              break;
            }
          }
        }
      }
      uint64_t v22 = [obj countByEnumeratingWithState:&v28 objects:v35 count:16];
    }
    while (v22);
  }
  id v17 = 0;
  BOOL v18 = obj;
LABEL_33:

  return v17;
}

- (id)_destinationForDevice:(id)a3 forcedIdentity:(id)a4
{
  id v5 = a4;
  id v6 = [a3 pushToken];
  int v7 = objc_msgSend(v6, "__imHexString");

  uint64_t v8 = NSString;
  char v9 = (void *)IDSCopyIDForPhoneNumber();

  uint64_t v10 = [v8 stringWithFormat:@"self-token:%@/%@", v7, v9];

  return v10;
}

- (id)localDevice
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Looking For Local Devices that are nearby", buf, 2u);
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(IMDRelayServiceController *)self relayService];
  id v5 = [v4 devices];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isDefaultPairedDevice] && objc_msgSend(v9, "isConnected"))
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              BOOL v18 = v9;
              _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Found Default paired Device which is nearby %@", buf, 0xCu);
            }
          }
          id v10 = v9;
          goto LABEL_20;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_20:

  return v10;
}

- (id)pairedDevice
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    id v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Looking For paired Device", buf, 2u);
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  id v4 = [(IMDRelayServiceController *)self relayService];
  id v5 = [v4 devices];

  uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
  if (v6)
  {
    uint64_t v7 = *(void *)v14;
    while (2)
    {
      for (uint64_t i = 0; i != v6; ++i)
      {
        if (*(void *)v14 != v7) {
          objc_enumerationMutation(v5);
        }
        char v9 = *(void **)(*((void *)&v13 + 1) + 8 * i);
        if ([v9 isDefaultPairedDevice])
        {
          if (IMOSLoggingEnabled())
          {
            uint64_t v11 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              BOOL v18 = v9;
              _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Found Default paired Device %@", buf, 0xCu);
            }
          }
          id v10 = v9;
          goto LABEL_19;
        }
      }
      uint64_t v6 = [v5 countByEnumeratingWithState:&v13 objects:v19 count:16];
      if (v6) {
        continue;
      }
      break;
    }
  }
  id v10 = 0;
LABEL_19:

  return v10;
}

- (BOOL)hasConnectedLocalDevice
{
  v2 = [(IMDRelayServiceController *)self localDevice];
  BOOL v3 = v2 != 0;

  return v3;
}

- (BOOL)isProxyRegistered
{
  uint64_t v34 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDRelayServiceController *)self relayService];
  id v4 = [v3 accounts];
  unint64_t v5 = [v4 count];

  if (v5 < 2)
  {
    uint64_t v8 = [(IMDRelayServiceController *)self relayService];
    char v9 = [v8 accounts];
    id v10 = [v9 anyObject];

    if (v10)
    {
      if ([v10 accountType] != 2)
      {
        BOOL v7 = 1;
        goto LABEL_15;
      }
      if (IMOSLoggingEnabled())
      {
        uint64_t v11 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Found the local account, it is our only account, This means we are NOT proxy resgiered", buf, 2u);
        }
      }
    }
    BOOL v7 = 0;
LABEL_15:

    goto LABEL_16;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "I Have more than 1 account, I am registered for Proxy Push", buf, 2u);
    }
  }
  BOOL v7 = 1;
LABEL_16:
  long long v29 = 0u;
  long long v30 = 0u;
  long long v27 = 0u;
  long long v28 = 0u;
  int v12 = [(IMDRelayServiceController *)self relayService];
  long long v13 = [v12 accounts];

  uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
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
        if ([v17 accountType] == 1)
        {
          if (IMOSLoggingEnabled())
          {
            long long v19 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Found the AppleID account", buf, 2u);
            }
          }
          id v18 = v17;

          if (v18)
          {
            if (([v18 isActive] & 1) == 0)
            {
              if (IMOSLoggingEnabled())
              {
                uint64_t v20 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "The AppleID account is NOT active", buf, 2u);
                }
              }
              BOOL v7 = 0;
            }
            uint64_t v21 = objc_msgSend(v18, "im_registeredURIs");
            BOOL v22 = [v21 count] == 0;

            if (v22)
            {
              if (IMOSLoggingEnabled())
              {
                long long v23 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, "The AppleID Account has no usable alias's", buf, 2u);
                }
              }
              BOOL v7 = 0;
            }
          }
          goto LABEL_42;
        }
      }
      uint64_t v14 = [v13 countByEnumeratingWithState:&v27 objects:v33 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }

  id v18 = 0;
LABEL_42:
  if (IMOSLoggingEnabled())
  {
    long long v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      long long v25 = @"NO";
      if (v7) {
        long long v25 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      long long v32 = v25;
      _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Result of check if myself is proxy registered is %@", buf, 0xCu);
    }
  }
  return v7;
}

- (BOOL)isLocalDeviceProxyRegistered
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  v2 = [(IMDRelayServiceController *)self localDevice];
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
      uint64_t v20 = v4;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Device %@ has identities %@", (uint8_t *)&v17, 0x16u);
    }
  }
  unint64_t v5 = [v2 identities];
  BOOL v6 = [v5 count] == 0;

  if (!v6)
  {
    BOOL v7 = [v2 identities];
    BOOL v8 = [v7 count] == 1;

    if (v8)
    {
      char v9 = [v2 identities];
      id v10 = [v9 firstObject];

      uint64_t v11 = [v10 _stringForKey:@"uri"];
      int v12 = [v11 isEqualToString:@"mailto:__localURI__@__local__URI.com"];
      if (v12 && IMOSLoggingEnabled())
      {
        long long v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          LOWORD(v17) = 0;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "The default paired device has an identity, but is is the local account, it is NOT proxy registered for SMS", (uint8_t *)&v17, 2u);
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
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      LOWORD(v17) = 0;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "The default paired device has no identities, this means it is NOT proxy registered for SMS", (uint8_t *)&v17, 2u);
    }
  }
  char v14 = 0;
LABEL_20:

  return v14;
}

- (NSArray)peerDevices
{
  [(IMDRelayServiceController *)self _checkAndSetRelayService];
  BOOL v3 = [(IMDRelayServiceController *)self relayService];
  id v4 = [v3 devices];

  return (NSArray *)v4;
}

- (BOOL)isSMSRelayEnabled
{
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  BOOL v3 = [(IMDRelayServiceController *)self smsWatchService];
  id v4 = [v3 accounts];
  uint64_t v5 = [v4 count];

  if (v5) {
    return 1;
  }
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  BOOL v7 = [(IMDRelayServiceController *)self relayService];
  BOOL v8 = [v7 accounts];

  uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v17;
    BOOL v6 = 1;
    do
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v17 != v10) {
          objc_enumerationMutation(v8);
        }
        int v12 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if ([v12 accountType] == 1 && (objc_msgSend(v12, "isActive") & 1) == 0)
        {
          if (IMOSLoggingEnabled())
          {
            long long v13 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)uint64_t v15 = 0;
              _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "The AppleID account is not active, we can not use SMS Relay", v15, 2u);
            }
          }
          BOOL v6 = 0;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v9);
  }
  else
  {
    BOOL v6 = 1;
  }

  return v6;
}

- (id)idsDeviceFromPushToken:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(IMDRelayServiceController *)self relayService];
  BOOL v6 = [v5 devices];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 pushToken];
        int v12 = [v11 isEqualToData:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)idsDeviceFromUniqueID:(id)a3
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  long long v14 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  uint64_t v5 = [(IMDRelayServiceController *)self relayService];
  BOOL v6 = [v5 devices];

  id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v15;
    while (2)
    {
      for (uint64_t i = 0; i != v7; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v15 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v14 + 1) + 8 * i);
        uint64_t v11 = [v10 uniqueID];
        int v12 = [v11 isEqualToString:v4];

        if (v12)
        {
          id v7 = v10;
          goto LABEL_11;
        }
      }
      id v7 = (id)[v6 countByEnumeratingWithState:&v14 objects:v18 count:16];
      if (v7) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  return v7;
}

- (id)idsDeviceForFromID:(id)a3
{
  id v4 = a3;
  uint64_t v5 = [(IMDRelayServiceController *)self relayService];
  BOOL v6 = [v5 deviceForFromID:v4];

  return v6;
}

- (BOOL)_isDefaultPairedDeviceRelayingLocally:(id)a3
{
  v9[1] = *MEMORY[0x1E4F143B8];
  uint64_t v4 = [(IMDRelayServiceController *)self idsDeviceForFromID:a3];
  uint64_t v5 = (void *)v4;
  if (v4)
  {
    v9[0] = v4;
    BOOL v6 = [MEMORY[0x1E4F1C978] arrayWithObjects:v9 count:1];
    BOOL v7 = [(IMDRelayServiceController *)self _isConnectedOverBT:v6];
  }
  else
  {
    BOOL v7 = 0;
  }

  return v7;
}

- (BOOL)_isConnectedOverBT:(id)a3
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  long long v19 = 0u;
  long long v20 = 0u;
  long long v21 = 0u;
  long long v22 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
  if (v4)
  {
    uint64_t v6 = *(void *)v20;
    *(void *)&long long v5 = 138412802;
    long long v18 = v5;
    while (2)
    {
      for (uint64_t i = 0; i != v4; ++i)
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
            long long v16 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              long long v24 = v8;
              _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Device is nearby: %@", buf, 0xCu);
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
            long long v24 = v8;
            _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Device is NOT nearby: %@", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            if ([(__CFString *)v8 isDefaultPairedDevice]) {
              uint64_t v11 = @"YES";
            }
            else {
              uint64_t v11 = @"NO";
            }
            int v12 = [(__CFString *)v8 isConnected];
            int v13 = [(__CFString *)v8 isNearby];
            long long v14 = @"NO";
            if (v12) {
              long long v15 = @"YES";
            }
            else {
              long long v15 = @"NO";
            }
            *(_DWORD *)buf = v18;
            long long v24 = v11;
            if (v13) {
              long long v14 = @"YES";
            }
            __int16 v25 = 2112;
            long long v26 = v15;
            __int16 v27 = 2112;
            long long v28 = v14;
            _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "isDefaultPairedDevice = %@, isConnected = %@, isNearby = %@", buf, 0x20u);
          }
        }
      }
      uint64_t v4 = [v3 countByEnumeratingWithState:&v19 objects:v29 count:16];
      if (v4) {
        continue;
      }
      break;
    }
  }
LABEL_33:

  return v4;
}

- (void)_checkAndSetRelayService
{
  uint64_t v39 = *MEMORY[0x1E4F143B8];
  id v3 = [(IMDRelayServiceController *)self smsRelayService];
  uint64_t v4 = [v3 accounts];
  if ([v4 count])
  {
    long long v5 = [(IMDRelayServiceController *)self smsRelayService];
    uint64_t v6 = [v5 devices];
    uint64_t v7 = [v6 count];

    if (v7)
    {
      uint64_t v8 = [(IMDRelayServiceController *)self smsRelayService];
      [(IMDRelayServiceController *)self setRelayService:v8];

      if (!IMOSLoggingEnabled()) {
        goto LABEL_20;
      }
      uint64_t v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        uint64_t v10 = NSNumber;
        uint64_t v11 = [(IMDRelayServiceController *)self smsRelayService];
        int v12 = [v11 accounts];
        int v13 = objc_msgSend(v10, "numberWithUnsignedInteger:", objc_msgSend(v12, "count"));
        long long v14 = NSNumber;
        long long v15 = [(IMDRelayServiceController *)self smsRelayService];
        long long v16 = [v15 devices];
        long long v17 = objc_msgSend(v14, "numberWithUnsignedInteger:", objc_msgSend(v16, "count"));
        int v35 = 138412546;
        uint64_t v36 = v13;
        __int16 v37 = 2112;
        v38 = v17;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Relay service set to sms relay, accounts count %@ devices count %@", (uint8_t *)&v35, 0x16u);
      }
      goto LABEL_6;
    }
  }
  else
  {
  }
  long long v18 = [(IMDRelayServiceController *)self smsWatchService];
  long long v19 = [v18 accounts];
  if (![v19 count])
  {

    goto LABEL_15;
  }
  long long v20 = [(IMDRelayServiceController *)self smsWatchService];
  long long v21 = [v20 devices];
  uint64_t v22 = [v21 count];

  if (!v22)
  {
LABEL_15:
    if (IMOSLoggingEnabled())
    {
      long long v32 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
      {
        LOWORD(v35) = 0;
        _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "IMDRelayServiceController: Error no IDS Service available for SMS Relay", (uint8_t *)&v35, 2u);
      }
    }
    [(IMDRelayServiceController *)self setRelayService:0];
    goto LABEL_20;
  }
  long long v23 = [(IMDRelayServiceController *)self smsWatchService];
  [(IMDRelayServiceController *)self setRelayService:v23];

  if (IMOSLoggingEnabled())
  {
    uint64_t v9 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
    {
      long long v24 = NSNumber;
      __int16 v25 = [(IMDRelayServiceController *)self smsWatchService];
      long long v26 = [v25 accounts];
      __int16 v27 = objc_msgSend(v24, "numberWithUnsignedInteger:", objc_msgSend(v26, "count"));
      long long v28 = NSNumber;
      long long v29 = [(IMDRelayServiceController *)self smsWatchService];
      uint64_t v30 = [v29 devices];
      long long v31 = objc_msgSend(v28, "numberWithUnsignedInteger:", objc_msgSend(v30, "count"));
      int v35 = 138412546;
      uint64_t v36 = v27;
      __int16 v37 = 2112;
      v38 = v31;
      _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Relay service set to sms watch service relay , accounts count %@ devices count %@", (uint8_t *)&v35, 0x16u);
    }
LABEL_6:
  }
LABEL_20:
  if (IMOSLoggingEnabled())
  {
    long long v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      uint64_t v34 = [(IMDRelayServiceController *)self relayService];
      int v35 = 138412290;
      uint64_t v36 = v34;
      _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "  => Done: %@", (uint8_t *)&v35, 0xCu);
    }
  }
}

- (void)service:(id)a3 devicesChanged:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      id v22 = v7;
      __int16 v23 = 2112;
      id v24 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "IDS Devices changed: %@ on Service:%@", buf, 0x16u);
    }
  }
  [(IMDRelayServiceController *)self updateRelayStatus];
  long long v18 = 0u;
  long long v19 = 0u;
  long long v16 = 0u;
  long long v17 = 0u;
  id v9 = v7;
  uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
  if (v10)
  {
    uint64_t v11 = *(void *)v17;
    do
    {
      for (uint64_t i = 0; i != v10; ++i)
      {
        if (*(void *)v17 != v11) {
          objc_enumerationMutation(v9);
        }
        int v13 = *(void **)(*((void *)&v16 + 1) + 8 * i);
        if (objc_msgSend(v13, "isDefaultPairedDevice", (void)v16))
        {
          long long v14 = [(IMDRelayServiceController *)self enrollmentController];
          [v14 _addDeviceToAllowedSMSRelay:v13 shouldSendApproval:0];
        }
      }
      uint64_t v10 = [v9 countByEnumeratingWithState:&v16 objects:v20 count:16];
    }
    while (v10);
  }

  long long v15 = [(IMDRelayServiceController *)self enrollmentController];
  [v15 _addDefaultPairedDeviceToAllowedSMSRelayList];
}

- (void)service:(id)a3 activeAccountsChanged:(id)a4
{
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v10 = 138412546;
      id v11 = v6;
      __int16 v12 = 2112;
      id v13 = v7;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Active accounts of service %@ changed to %@", (uint8_t *)&v10, 0x16u);
    }
  }
  [(IMDRelayServiceController *)self _checkAndSetRelayService];
  id v9 = [(IMDRelayServiceController *)self enrollmentController];
  [v9 _addDefaultPairedDeviceToAllowedSMSRelayList];
}

- (void)service:(id)a3 account:(id)a4 identifier:(id)a5 didSendWithSuccess:(BOOL)a6 error:(id)a7
{
  BOOL v8 = a6;
  uint64_t v21 = *MEMORY[0x1E4F143B8];
  id v11 = a3;
  id v12 = a4;
  id v13 = a5;
  id v14 = a7;
  if (IMOSLoggingEnabled())
  {
    long long v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      long long v16 = @"NO";
      if (v8) {
        long long v16 = @"YES";
      }
      int v17 = 138412546;
      id v18 = v13;
      __int16 v19 = 2112;
      long long v20 = v16;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Message with ID %@ Sent Success %@", (uint8_t *)&v17, 0x16u);
    }
  }
}

- (void)account:(id)a3 aliasesChanged:(id)a4
{
  uint64_t v11 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    BOOL v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      int v9 = 138412290;
      id v10 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Account %@ aliases has changes", (uint8_t *)&v9, 0xCu);
    }
  }
  [(IMDRelayServiceController *)self updateRelayStatus];
}

- (void)_setupMMSObservation
{
  [MEMORY[0x1E4F6E660] IMSynchronizePreferredSubscriptionMMSCapabilityToWatch];
  id v3 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v3 addObserver:self selector:sel__handleCapabilitiesChanged_ name:*MEMORY[0x1E4F61738] object:0];

  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterAddObserver(DarwinNotifyCenter, self, (CFNotificationCallback)sub_1D978ACB4, @"com.apple.MobileSMS.MMSEnabled.changed", 0, CFNotificationSuspensionBehaviorDeliverImmediately);
  CTTelephonyCenterGetDefault();

  CTTelephonyCenterAddObserver();
}

- (void)_teardownMMSObservation
{
  DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
  CFNotificationCenterRemoveObserver(DarwinNotifyCenter, self, @"com.apple.MobileSMS.MMSEnabled.changed", 0);
  CTTelephonyCenterGetDefault();

  CTTelephonyCenterRemoveObserver();
}

- (unsigned)_readMMSUserOverrideForSingleSubscription
{
  return [MEMORY[0x1E4F6E660] IMReadMMSUserOverrideForPhoneNumber:0 simID:0];
}

- (BOOL)_checkMMSEnablementForPhoneNumber:(id)a3 simID:(id)a4
{
  uint64_t v48 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    int v8 = [MEMORY[0x1E4F6E660] IMMMSEnabledForPhoneNumber:v6 simID:v7];
    if (IMOSLoggingEnabled())
    {
      int v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = @"NO";
        if (v8) {
          id v10 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v40 = v10;
        _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "MMS enabled: %@", buf, 0xCu);
      }
    }
  }
  else
  {
    uint64_t v11 = [MEMORY[0x1E4F61740] sharedInstance];
    int v12 = [v11 supportsMMS];

    id v13 = [MEMORY[0x1E4F6E668] sharedInstance];
    id v14 = [v13 ctSubscriptionInfo];
    long long v15 = objc_msgSend(v14, "__im_subscriptionContextForForSimID:phoneNumber:", v7, v6);

    long long v16 = [MEMORY[0x1E4F239E8] sharedMessageCenter];
    int v17 = [v16 isMmsConfiguredForSub:v15];

    int v33 = [(IMDRelayServiceController *)self _readMMSUserOverrideForSingleSubscription];
    int v34 = v17;
    if (v33) {
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
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "MMS not supported on current device, checking for relay devices", buf, 2u);
        }
      }
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      __int16 v19 = [(IMDRelayServiceController *)self relayService];
      long long v20 = [v19 devices];

      uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v47 count:16];
      if (v21)
      {
        uint64_t v22 = *(void *)v36;
        while (2)
        {
          for (uint64_t i = 0; i != v21; ++i)
          {
            if (*(void *)v36 != v22) {
              objc_enumerationMutation(v20);
            }
            id v24 = *(void **)(*((void *)&v35 + 1) + 8 * i);
            if ([v24 supportsSMSRelay]
              && [v24 supportsMMSRelay])
            {
              if (IMOSLoggingEnabled())
              {
                uint64_t v25 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  long long v26 = [v24 name];
                  *(_DWORD *)buf = 138412290;
                  uint64_t v40 = v26;
                  _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "MMS relay device found: %@", buf, 0xCu);
                }
              }
              int v8 = 1;
              goto LABEL_31;
            }
          }
          uint64_t v21 = [v20 countByEnumeratingWithState:&v35 objects:v47 count:16];
          if (v21) {
            continue;
          }
          break;
        }
      }
LABEL_31:
    }
    if (IMOSLoggingEnabled())
    {
      __int16 v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        long long v28 = @"NO";
        if (v8) {
          long long v29 = @"YES";
        }
        else {
          long long v29 = @"NO";
        }
        if (v12) {
          uint64_t v30 = @"YES";
        }
        else {
          uint64_t v30 = @"NO";
        }
        *(_DWORD *)buf = 138413058;
        uint64_t v40 = v29;
        if (v34) {
          long long v31 = @"YES";
        }
        else {
          long long v31 = @"NO";
        }
        __int16 v41 = 2112;
        v42 = v30;
        __int16 v43 = 2112;
        v44 = v31;
        if (v33) {
          long long v28 = @"YES";
        }
        __int16 v45 = 2112;
        v46 = v28;
        _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "MMS enabled: %@ (GS:%@, CT:%@, User:%@)", buf, 0x2Au);
      }
    }
  }

  return v8;
}

- (void)_synchronizeMMSCapabilityToWatch:(BOOL)a3
{
  BOOL v3 = a3;
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    uint64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      long long v5 = @"NO";
      if (v3) {
        long long v5 = @"YES";
      }
      int v6 = 138412290;
      id v7 = v5;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Calling IMSynchronizeMMSCapabilityToWatch isMMSEnabled %@", (uint8_t *)&v6, 0xCu);
    }
  }
  [MEMORY[0x1E4F6E660] IMSynchronizeMMSCapabilityToWatch:v3];
}

- (BOOL)_syncedMMSEnabledValue
{
  uint64_t v12 = *MEMORY[0x1E4F143B8];
  Boolean keyExistsAndHasValidFormat = 0;
  int AppBooleanValue = CFPreferencesGetAppBooleanValue(@"MMSRelayEnabled", @"com.apple.MobileSMS", &keyExistsAndHasValidFormat);
  BOOL v3 = keyExistsAndHasValidFormat == 0;
  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      long long v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        id v7 = @"NO";
        if (AppBooleanValue) {
          id v7 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v11 = v7;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "_syncedMMSEnabledValue does not exist. Defaulting to %@", buf, 0xCu);
      }
      goto LABEL_13;
    }
  }
  else if (v4)
  {
    long long v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = @"NO";
      if (AppBooleanValue) {
        int v6 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v11 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "_syncedMMSEnabledValue %@", buf, 0xCu);
    }
LABEL_13:
  }
  return AppBooleanValue != 0;
}

- (void)updateMMSCapability
{
  uint64_t v29 = *MEMORY[0x1E4F143B8];
  if (IMSharedHelperRetrieveSimDetailsFromTelephony())
  {
    BOOL v3 = [MEMORY[0x1E4F6E668] sharedInstance];
    __int16 v19 = [v3 ctSubscriptionInfo];

    long long v22 = 0u;
    long long v23 = 0u;
    long long v20 = 0u;
    long long v21 = 0u;
    int v4 = [v19 subscriptions];
    uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
    if (v5)
    {
      uint64_t v6 = *(void *)v21;
      do
      {
        for (uint64_t i = 0; i != v5; ++i)
        {
          if (*(void *)v21 != v6) {
            objc_enumerationMutation(v4);
          }
          uint64_t v8 = *(void **)(*((void *)&v20 + 1) + 8 * i);
          int v9 = [v8 phoneNumber];
          id v10 = [v8 labelID];
          BOOL v11 = [(IMDRelayServiceController *)self _checkMMSEnablementForPhoneNumber:v9 simID:v10];

          uint64_t v12 = [v8 userDefaultVoice];

          if (v12)
          {
            if (IMOSLoggingEnabled())
            {
              id v13 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                id v14 = @"NO";
                if (v11) {
                  id v14 = @"YES";
                }
                uint64_t v25 = v14;
                __int16 v26 = 2112;
                __int16 v27 = v8;
                _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Synchronize isMMSEnabled %@ for voice preferred subscription %@", buf, 0x16u);
              }
            }
            [(IMDRelayServiceController *)self _synchronizeMMSCapabilityToWatch:v11];
          }
        }
        uint64_t v5 = [v4 countByEnumeratingWithState:&v20 objects:v28 count:16];
      }
      while (v5);
    }

    DarwinNotifyCenter = CFNotificationCenterGetDarwinNotifyCenter();
    CFNotificationCenterPostNotification(DarwinNotifyCenter, @"com.apple.MobileSMS.MMSCapable", 0, 0, 1u);
  }
  else
  {
    BOOL v16 = [(IMDRelayServiceController *)self _checkMMSEnablementForPhoneNumber:0 simID:0];
    if (qword_1EA8CA548 != -1) {
      dispatch_once(&qword_1EA8CA548, &unk_1F3391500);
    }
    if (IMOSLoggingEnabled())
    {
      int v17 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
      {
        id v18 = @"NO";
        if (v16) {
          id v18 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        uint64_t v25 = v18;
        _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Setting MMS token to: %@", buf, 0xCu);
      }
    }
    notify_set_state(dword_1EA8CA540, v16);
    [(IMDRelayServiceController *)self _synchronizeMMSCapabilityToWatch:v16];
  }
}

- (void)_handleCapabilitiesChanged:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v6 = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Device capabilities changed", v6, 2u);
    }
  }
  [(IMDRelayServiceController *)self updateMMSCapability];
}

- (BOOL)accountHasAlias:(id)a3 aliastoCheck:(id)a4
{
  uint64_t v27 = *MEMORY[0x1E4F143B8];
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
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, " Checking if Account %@ has alias %@ ", buf, 0x16u);
    }
  }
  long long v20 = 0u;
  long long v21 = 0u;
  long long v18 = 0u;
  long long v19 = 0u;
  int v17 = v5;
  uint64_t v8 = objc_msgSend(v5, "im_registeredURIs");
  uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
  if (v9)
  {
    uint64_t v10 = *(void *)v19;
    while (2)
    {
      for (uint64_t i = 0; i != v9; ++i)
      {
        if (*(void *)v19 != v10) {
          objc_enumerationMutation(v8);
        }
        uint64_t v12 = *(void **)(*((void *)&v18 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          id v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412546;
            id v24 = v6;
            __int16 v25 = 2112;
            id v26 = v12;
            _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, " comparing alias %@ and alias %@ ", buf, 0x16u);
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
              _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, " Positive match on alias %@ ", buf, 0xCu);
            }
          }
          BOOL v14 = 1;
          goto LABEL_23;
        }
      }
      uint64_t v9 = [v8 countByEnumeratingWithState:&v18 objects:v22 count:16];
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
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = v7;
  if (v6)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v9 = v7;
    uint64_t v10 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v10)
    {
      uint64_t v11 = v10;
      uint64_t v12 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v11; ++i)
        {
          if (*(void *)v18 != v12) {
            objc_enumerationMutation(v9);
          }
          BOOL v14 = *(void **)(*((void *)&v17 + 1) + 8 * i);
          if (-[IMDRelayServiceController accountHasAlias:aliastoCheck:](self, "accountHasAlias:aliastoCheck:", v14, v6, (void)v17)&& [v14 canSend])
          {
            id v15 = v14;
            goto LABEL_14;
          }
        }
        uint64_t v11 = [v9 countByEnumeratingWithState:&v17 objects:v21 count:16];
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
  uint64_t v30 = *MEMORY[0x1E4F143B8];
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
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, " We have a prefered Alias %@", (uint8_t *)&v28, 0xCu);
      }
    }
    if ([v12 _appearsToBePhoneNumber]
      && [(IMDRelayServiceController *)self isAliasRelayCapable:v12])
    {
      int v15 = IMOSLoggingEnabled();
      BOOL v16 = v12;
      if (v15)
      {
        long long v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          int v28 = 138412290;
          id v29 = v12;
          _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, " This alias appears to be a phone number, we will send to that destination %@", (uint8_t *)&v28, 0xCu);
        }

        BOOL v16 = v12;
      }
      goto LABEL_33;
    }
    BOOL v18 = [(IMDRelayServiceController *)self _localDeviceSupportsSMS];
    int v19 = IMOSLoggingEnabled();
    if (v18)
    {
      BOOL v16 = v13;
      if (!v19) {
        goto LABEL_33;
      }
      long long v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v28 = 138412290;
        id v29 = v13;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, " This prefered alias is not a phone number, but we outselves support SMS, So we sent this one out using %@ instead", (uint8_t *)&v28, 0xCu);
      }
LABEL_24:

      BOOL v16 = v13;
      goto LABEL_33;
    }
    BOOL v16 = v10;
    if (!v19) {
      goto LABEL_33;
    }
    long long v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v10;
      _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, " This prefered alias is not a phone number, using %@ instead", (uint8_t *)&v28, 0xCu);
    }
    goto LABEL_32;
  }
  if (![(IMDRelayServiceController *)self _localDeviceSupportsSMS]
    || ![v11 length]
    || [v10 length])
  {
    BOOL v21 = [(IMDRelayServiceController *)self _localDeviceSupportsSMS];
    int v22 = IMOSLoggingEnabled();
    if (v21)
    {
      BOOL v16 = v13;
      if (!v22) {
        goto LABEL_33;
      }
      long long v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        int v28 = 138412290;
        id v29 = v13;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, " This prefered alias is not a phone number, but we outselves support SMS, So we sent this one out using %@ instead", (uint8_t *)&v28, 0xCu);
      }
      goto LABEL_24;
    }
    BOOL v16 = v10;
    if (!v22) {
      goto LABEL_33;
    }
    long long v23 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v23, OS_LOG_TYPE_INFO))
    {
      LOWORD(v28) = 0;
      _os_log_impl(&dword_1D967A000, v23, OS_LOG_TYPE_INFO, " We have no prefered alias, we are going to use the dominant phone number one", (uint8_t *)&v28, 2u);
    }
LABEL_32:

    BOOL v16 = v10;
    goto LABEL_33;
  }
  int v26 = IMOSLoggingEnabled();
  BOOL v16 = v11;
  if (v26)
  {
    uint64_t v27 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
    {
      int v28 = 138412290;
      id v29 = v11;
      _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, " This prefered alias is not the IDS registered number, and we support SMS, So we sent this one out using %@ instead", (uint8_t *)&v28, 0xCu);
    }

    BOOL v16 = v11;
  }
LABEL_33:
  id v24 = v16;

  return v24;
}

- (id)retrievePhoneAccountAndPhoneAliasFromIDSAccounts:(id)a3
{
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  long long v23 = 0u;
  long long v24 = 0u;
  long long v25 = 0u;
  long long v26 = 0u;
  id v3 = a3;
  uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v32 count:16];
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
      if (v4 == ++v6)
      {
        uint64_t v4 = [v3 countByEnumeratingWithState:&v23 objects:v32 count:16];
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
    uint64_t v8 = objc_msgSend(v7, "im_registeredURIs", 0);
    uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
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
      if (v9 == ++v11)
      {
        uint64_t v9 = [v8 countByEnumeratingWithState:&v19 objects:v31 count:16];
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
      BOOL v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412546;
        id v28 = v15;
        __int16 v29 = 2112;
        id v30 = v13;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, " Found IDS account %@ with phone number %@", buf, 0x16u);
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
        _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, " Unable to find IDS phone number account", buf, 2u);
      }
    }
    id v15 = 0;
  }
  BOOL v16 = (void *)[objc_alloc(MEMORY[0x1E4F6C3A8]) initWithFirst:v15 second:v13];

  return v16;
}

- (id)retrieveAccountAndPhoneAliasForAccounts:(id)a3 shouldFilterRecepients:(BOOL)a4 requestProxySend:(BOOL)a5 preferredCallerID:(id)a6
{
  BOOL v41 = a5;
  BOOL v42 = a4;
  uint64_t v56 = *MEMORY[0x1E4F143B8];
  uint64_t v8 = (__CFString *)a3;
  uint64_t v9 = (__CFString *)a6;
  if (IMOSLoggingEnabled())
  {
    uint64_t v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      uint64_t v11 = @"NO";
      if (v42) {
        id v12 = @"YES";
      }
      else {
        id v12 = @"NO";
      }
      *(_DWORD *)buf = 138412802;
      v51 = v12;
      __int16 v52 = 2112;
      if (v41) {
        uint64_t v11 = @"YES";
      }
      v53 = v11;
      __int16 v54 = 2112;
      v55 = v8;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "finding account and phoneAlias shouldFilterRecipients: %@ requestProxySend: %@ for accounts %@", buf, 0x20u);
    }
  }
  v44 = [(IMDRelayServiceController *)self dominentPhoneNumberAlias];
  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v44;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "dominentPhoneAlias is this: %@", buf, 0xCu);
    }
  }
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    BOOL v14 = [MEMORY[0x1E4F6E668] sharedInstance];
    id v15 = [v14 registeredPhoneNumbers];

    if (IMOSLoggingEnabled())
    {
      BOOL v16 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        v51 = v15;
        _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "IDS registered phone numbers are %@", buf, 0xCu);
      }
    }
  }
  else
  {
    id v15 = 0;
  }
  __int16 v43 = [MEMORY[0x1E4F6E660] myCTPhoneNumber];
  long long v17 = [(IMDRelayServiceController *)self _callerIDForRelay];
  long long v47 = 0u;
  long long v48 = 0u;
  long long v45 = 0u;
  long long v46 = 0u;
  BOOL v18 = v15;
  long long v19 = 0;
  uint64_t v20 = [(__CFString *)v18 countByEnumeratingWithState:&v45 objects:v49 count:16];
  if (v20)
  {
    uint64_t v21 = *(void *)v46;
    do
    {
      for (uint64_t i = 0; i != v20; ++i)
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
      uint64_t v20 = [(__CFString *)v18 countByEnumeratingWithState:&v45 objects:v49 count:16];
    }
    while (v20);
  }

  long long v24 = [(IMDRelayServiceController *)self phoneAliasForDominentPhoneAlias:v44 registeredPhoneNumber:v19 preferedCallerID:v17 CTPhoneNumber:v43];
  if (IMOSLoggingEnabled())
  {
    long long v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v8;
      _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, " Found Accounts %@ for SMS Relay Service ", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    long long v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v24;
      _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, " Ensuring that the account picked matches the callerID %@", buf, 0xCu);
    }
  }
  uint64_t v27 = [(IMDRelayServiceController *)self accountForAlias:v24 fromAccounts:v8];
  if (IMOSLoggingEnabled())
  {
    id v28 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v51 = v27;
      _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, " Going to use account %@ For sending this message", buf, 0xCu);
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
        v51 = v9;
        _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, " We have a phone alias override, looking for new account that matches callerID %@", buf, 0xCu);
      }
    }
    id v30 = [(IMDRelayServiceController *)self accountForAlias:v9 fromAccounts:v8];
    if (v30)
    {
      long long v31 = v9;

      long long v32 = v30;
      if (IMOSLoggingEnabled())
      {
        uint64_t v33 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          v51 = v32;
          _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, " Updating sending account, Now Going to use account %@ For sending this message", buf, 0xCu);
        }
      }
    }
    else
    {
      long long v31 = v24;
      long long v32 = v27;
    }

    if (v32)
    {
LABEL_64:
      if (v32)
      {
        id v35 = (id)[objc_alloc(MEMORY[0x1E4F6C3A8]) initWithFirst:v32 second:v31];
        goto LABEL_76;
      }
      goto LABEL_66;
    }
  }
  else
  {
    long long v31 = v24;
    long long v32 = v27;
    if (v27) {
      goto LABEL_64;
    }
  }
  if (!v42 || v41) {
    goto LABEL_64;
  }
  if (![(IMDRelayServiceController *)self _localDeviceSupportsSMS])
  {
LABEL_66:
    if (IMOSLoggingEnabled())
    {
      long long v36 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v36, OS_LOG_TYPE_INFO))
      {
        long long v37 = @"NO";
        if (v42) {
          long long v38 = @"YES";
        }
        else {
          long long v38 = @"NO";
        }
        if (v41) {
          long long v37 = @"YES";
        }
        *(_DWORD *)buf = 138412546;
        v51 = v38;
        __int16 v52 = 2112;
        v53 = v37;
        _os_log_impl(&dword_1D967A000, v36, OS_LOG_TYPE_INFO, "Account is nil but not finding new account based on phone number IDS account based on parameters shouldFilter %@ requestProxy %@", buf, 0x16u);
      }
    }
    id v35 = (id)[objc_alloc(MEMORY[0x1E4F6C3A8]) initWithFirst:0 second:v31];
    goto LABEL_76;
  }
  if (IMOSLoggingEnabled())
  {
    int v34 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, " Account is nil, getting phone account from IDS", buf, 2u);
    }
  }
  id v35 = [(IMDRelayServiceController *)self retrievePhoneAccountAndPhoneAliasFromIDSAccounts:v8];
LABEL_76:
  uint64_t v39 = v35;

  return v39;
}

- (BOOL)sendDataToPeers:(id)a3 forcedCallerID:(id)a4 shouldFilterRecepients:(BOOL)a5 requestProxySend:(BOOL)a6 dontSendTo:(id)a7
{
  return [(IMDRelayServiceController *)self sendDataToPeers:a3 forcedCallerID:a4 shouldFilterRecepients:a5 requestProxySend:a6 dontSendTo:a7 sentToDevices:0];
}

- (BOOL)sendDataToPeers:(id)a3 forcedCallerID:(id)a4 shouldFilterRecepients:(BOOL)a5 requestProxySend:(BOOL)a6 dontSendTo:(id)a7 sentToDevices:(id *)a8
{
  BOOL v10 = a6;
  BOOL v11 = a5;
  v134[1] = *MEMORY[0x1E4F143B8];
  BOOL v14 = (__CFDictionary *)a3;
  id v90 = a4;
  id v93 = a7;
  if ([(IMDRelayServiceController *)self hasPeerDevices])
  {
    v85 = a8;
    v99 = self;
    id v15 = [(IMDRelayServiceController *)self relayService];
    v88 = [v15 accounts];

    id v87 = [(IMDRelayServiceController *)self retrieveAccountAndPhoneAliasForAccounts:v88 shouldFilterRecepients:v11 requestProxySend:v10 preferredCallerID:v90];
    v89 = [v87 first];
    v98 = [v87 second];
    BOOL v16 = [(__CFDictionary *)v14 objectForKeyedSubscript:@"_SMSServiceRelayToWatchOnly"];
    int v17 = [v16 BOOLValue];

    if (!v89 || ![v98 length])
    {
      if (IMOSLoggingEnabled())
      {
        long long v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, " => No account available for sending With Phone number alias, failing", buf, 2u);
        }
      }
      LOBYTE(v21) = 0;
      v86 = v14;
LABEL_116:

      BOOL v14 = v86;
      goto LABEL_117;
    }
    id v91 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
    Mutable = (__CFDictionary *)[(__CFDictionary *)v14 mutableCopy];
    if (!Mutable) {
      Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
    }
    long long v19 = (void *)IDSCopyIDForPhoneNumber();
    if (v19)
    {
      CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6A9B8], v19);
    }
    else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
    {
      sub_1D99036FC();
    }

    v86 = Mutable;
    IMGreenTeaMessageTransmitLog();
    if (!v10)
    {
      if (v11)
      {
        id v28 = [(__CFDictionary *)v86 objectForKeyedSubscript:*MEMORY[0x1E4F6A978]];
        uint64_t v96 = [v28 integerValue];

        __int16 v29 = [(IMDRelayServiceController *)v99 enrollmentController];
        id v30 = [v29 _allowedIDSDevicesforSMSRelay];

        long long v116 = 0u;
        long long v117 = 0u;
        long long v114 = 0u;
        long long v115 = 0u;
        id v24 = v30;
        uint64_t v31 = [v24 countByEnumeratingWithState:&v114 objects:v133 count:16];
        if (v31)
        {
          uint64_t v32 = *(void *)v115;
          do
          {
            uint64_t v33 = 0;
            do
            {
              if (*(void *)v115 != v32) {
                objc_enumerationMutation(v24);
              }
              int v34 = *(void **)(*((void *)&v114 + 1) + 8 * v33);
              if (v93
                && ([v93 uniqueID],
                    id v35 = objc_claimAutoreleasedReturnValue(),
                    [v34 uniqueID],
                    long long v36 = objc_claimAutoreleasedReturnValue(),
                    int v37 = [v35 isEqualToString:v36],
                    v36,
                    v35,
                    v37))
              {
                if (IMOSLoggingEnabled())
                {
                  long long v38 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                  {
                    uint64_t v39 = [v93 uniqueID];
                    *(_DWORD *)buf = 138412290;
                    id v119 = v39;
                    _os_log_impl(&dword_1D967A000, v38, OS_LOG_TYPE_INFO, " Not Adding %@ to the devices to send this message to, They were the original person who sent this message to us in the first place", buf, 0xCu);
                  }
                }
              }
              else if (v17 {
                     && (v132 = v34,
              }
                         [MEMORY[0x1E4F1C978] arrayWithObjects:&v132 count:1],
                         uint64_t v40 = objc_claimAutoreleasedReturnValue(),
                         BOOL v41 = [(IMDRelayServiceController *)v99 _isConnectedOverBT:v40],
                         v40,
                         !v41))
              {
                if (IMOSLoggingEnabled())
                {
                  long long v45 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v45, OS_LOG_TYPE_INFO))
                  {
                    long long v46 = [v34 uniqueID];
                    *(_DWORD *)buf = 138412290;
                    id v119 = v46;
                    _os_log_impl(&dword_1D967A000, v45, OS_LOG_TYPE_INFO, " Not Adding %@ to the devices to send this message to, since we only need to relay it to the active watch", buf, 0xCu);
                  }
                }
              }
              else if (v96 == 139 {
                     && (objc_msgSend(MEMORY[0x1E4F6E938], "IDSDeviceSupportsIncomingSMSRelayFilteringForDeviceType:", objc_msgSend(v34, "deviceType")) & 1) == 0)
              }
              {
                if (IMOSLoggingEnabled())
                {
                  long long v47 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                  {
                    id v48 = [v34 uniqueID];
                    uint64_t v49 = [v34 deviceType];
                    *(_DWORD *)buf = 138412546;
                    id v119 = v48;
                    __int16 v120 = 2048;
                    uint64_t v121 = v49;
                    _os_log_impl(&dword_1D967A000, v47, OS_LOG_TYPE_INFO, " Not Adding %@ to the devices to send this message to, since we are sending SMSFilteringSettingMessage and this device type (%ld) is not capable of receiving it", buf, 0x16u);
                  }
                }
              }
              else
              {
                if (IMOSLoggingEnabled())
                {
                  BOOL v42 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
                  {
                    id v43 = [v34 uniqueID];
                    v44 = [v34 name];
                    *(_DWORD *)buf = 138412546;
                    id v119 = v43;
                    __int16 v120 = 2112;
                    uint64_t v121 = (uint64_t)v44;
                    _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, " Adding %@ name %@ the devices to send this message to ", buf, 0x16u);
                  }
                }
                [v91 addObject:v34];
              }
              ++v33;
            }
            while (v31 != v33);
            uint64_t v50 = [v24 countByEnumeratingWithState:&v114 objects:v133 count:16];
            uint64_t v31 = v50;
          }
          while (v50);
        }
      }
      else
      {
        long long v112 = 0u;
        long long v113 = 0u;
        long long v110 = 0u;
        long long v111 = 0u;
        v51 = [(IMDRelayServiceController *)v99 relayService];
        id v24 = [v51 devices];

        uint64_t v52 = [v24 countByEnumeratingWithState:&v110 objects:v131 count:16];
        if (v52)
        {
          uint64_t v53 = *(void *)v111;
          do
          {
            uint64_t v54 = 0;
            do
            {
              if (*(void *)v111 != v53) {
                objc_enumerationMutation(v24);
              }
              v55 = *(void **)(*((void *)&v110 + 1) + 8 * v54);
              if (v17
                && (uint64_t v130 = *(void *)(*((void *)&v110 + 1) + 8 * v54),
                    [MEMORY[0x1E4F1C978] arrayWithObjects:&v130 count:1],
                    uint64_t v56 = objc_claimAutoreleasedReturnValue(),
                    BOOL v57 = [(IMDRelayServiceController *)v99 _isConnectedOverBT:v56],
                    v56,
                    !v57))
              {
                if (IMOSLoggingEnabled())
                {
                  v61 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v61, OS_LOG_TYPE_INFO))
                  {
                    v62 = [v55 uniqueID];
                    *(_DWORD *)buf = 138412290;
                    id v119 = v62;
                    _os_log_impl(&dword_1D967A000, v61, OS_LOG_TYPE_INFO, " Not Adding %@ to the devices to send this message to, since we only need to relay it to the active watch", buf, 0xCu);
                  }
                }
              }
              else
              {
                if (IMOSLoggingEnabled())
                {
                  v58 = OSLogHandleForIMFoundationCategory();
                  if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
                  {
                    id v59 = [v55 uniqueID];
                    v60 = [v55 name];
                    *(_DWORD *)buf = 138412546;
                    id v119 = v59;
                    __int16 v120 = 2112;
                    uint64_t v121 = (uint64_t)v60;
                    _os_log_impl(&dword_1D967A000, v58, OS_LOG_TYPE_INFO, " Adding %@ name %@ the devices to send this message to ", buf, 0x16u);
                  }
                }
                [v91 addObject:v55];
              }
              ++v54;
            }
            while (v52 != v54);
            uint64_t v63 = [v24 countByEnumeratingWithState:&v110 objects:v131 count:16];
            uint64_t v52 = v63;
          }
          while (v63);
        }
      }
      goto LABEL_82;
    }
    uint64_t v23 = [(IMDRelayServiceController *)v99 _deviceForCallerID:v98];
    id v24 = (id)v23;
    if (v23) {
      int v25 = v17;
    }
    else {
      int v25 = 0;
    }
    if (v25 == 1)
    {
      v134[0] = v23;
      long long v26 = [MEMORY[0x1E4F1C978] arrayWithObjects:v134 count:1];
      BOOL v27 = [(IMDRelayServiceController *)v99 _isConnectedOverBT:v26];

      if (!v27) {
        goto LABEL_82;
      }
    }
    else if (!v23)
    {
LABEL_82:

      if ([v91 count])
      {
        v64 = objc_msgSend(MEMORY[0x1E4F1CA48], "arrayWithCapacity:", objc_msgSend(v91, "count"));
        v97 = [(__CFDictionary *)v86 objectForKey:@"requiredCapabilitiesForSMSRelay"];
        long long v108 = 0u;
        long long v109 = 0u;
        long long v106 = 0u;
        long long v107 = 0u;
        obuint64_t j = v91;
        uint64_t v95 = [obj countByEnumeratingWithState:&v106 objects:v129 count:16];
        if (v95)
        {
          uint64_t v94 = *(void *)v107;
          do
          {
            for (uint64_t i = 0; i != v95; ++i)
            {
              if (*(void *)v107 != v94) {
                objc_enumerationMutation(obj);
              }
              v66 = *(void **)(*((void *)&v106 + 1) + 8 * i);
              if ([v97 count])
              {
                long long v104 = 0u;
                long long v105 = 0u;
                long long v102 = 0u;
                long long v103 = 0u;
                id v67 = v97;
                uint64_t v68 = [v67 countByEnumeratingWithState:&v102 objects:v128 count:16];
                if (v68)
                {
                  uint64_t v69 = *(void *)v103;
                  while (2)
                  {
                    for (uint64_t j = 0; j != v68; ++j)
                    {
                      if (*(void *)v103 != v69) {
                        objc_enumerationMutation(v67);
                      }
                      v71 = *(void **)(*((void *)&v102 + 1) + 8 * j);
                      v72 = [v66 capabilities];
                      BOOL v73 = [v72 valueForCapability:v71] == 0;

                      if (v73)
                      {
                        if (IMOSLoggingEnabled())
                        {
                          v75 = OSLogHandleForIMFoundationCategory();
                          if (os_log_type_enabled(v75, OS_LOG_TYPE_INFO))
                          {
                            *(_DWORD *)buf = 138412290;
                            id v119 = v71;
                            _os_log_impl(&dword_1D967A000, v75, OS_LOG_TYPE_INFO, "Not relaying to device as it does not support required capability: %@", buf, 0xCu);
                          }
                        }
                        goto LABEL_103;
                      }
                      v74 = [(IMDRelayServiceController *)v99 _destinationForDevice:v66 forcedIdentity:v98];
                      [v64 addObject:v74];
                    }
                    uint64_t v68 = [v67 countByEnumeratingWithState:&v102 objects:v128 count:16];
                    if (v68) {
                      continue;
                    }
                    break;
                  }
                }
              }
              else
              {
                id v67 = [(IMDRelayServiceController *)v99 _destinationForDevice:v66 forcedIdentity:v98];
                [v64 addObject:v67];
              }
LABEL_103:
            }
            uint64_t v95 = [obj countByEnumeratingWithState:&v106 objects:v129 count:16];
          }
          while (v95);
        }

        [(IMDRelayServiceController *)v99 _checkAndSetRelayService];
        v76 = (void *)MEMORY[0x1E4F6E7C0];
        v77 = [(IMDRelayServiceController *)v99 relayService];
        v78 = [MEMORY[0x1E4F1C9E8] dictionary];
        v79 = [MEMORY[0x1E4F1CAD0] setWithArray:v64];
        id v100 = 0;
        id v101 = 0;
        int v21 = [v76 service:v77 sendMessage:v78 fromAccount:v89 toDestinations:v79 priority:300 options:v86 identifier:&v101 error:&v100];
        id v80 = v101;
        id v81 = v100;
      }
      else
      {
        id v80 = 0;
        id v81 = 0;
        int v21 = 0;
      }
      if (v85) {
        id *v85 = (id)[v91 copy];
      }
      if (IMOSLoggingEnabled())
      {
        v82 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v82, OS_LOG_TYPE_INFO))
        {
          v83 = @"NO";
          *(_DWORD *)buf = 138413314;
          id v119 = v98;
          if (v21) {
            v83 = @"YES";
          }
          __int16 v120 = 2112;
          uint64_t v121 = (uint64_t)v83;
          __int16 v122 = 2112;
          id v123 = v81;
          __int16 v124 = 2112;
          v125 = v89;
          __int16 v126 = 2112;
          id v127 = v80;
          _os_log_impl(&dword_1D967A000, v82, OS_LOG_TYPE_INFO, "SMS relay data sent to: %@   success: %@   error: %@   account: %@  identifier %@", buf, 0x34u);
        }
      }
      goto LABEL_116;
    }
    [v91 addObject:v24];
    goto LABEL_82;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v20 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, " => Not sending data, we have no peer devices", buf, 2u);
    }
  }
  LOBYTE(v21) = 0;
LABEL_117:

  return v21;
}

- (void)_sendMessageToPairedDeviceWithOptions:(id)a3
{
  uint64_t v37 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [MEMORY[0x1E4F1CAD0] setWithObject:*MEMORY[0x1E4F6ADA8]];
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  uint64_t v6 = [(IMDRelayServiceController *)self relayService];
  id v7 = [v6 accounts];

  id v8 = (id)[v7 countByEnumeratingWithState:&v22 objects:v36 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    while (2)
    {
      for (uint64_t i = 0; i != v8; uint64_t i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v7);
        }
        BOOL v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if ([v11 isActive])
        {
          id v8 = v11;
          goto LABEL_11;
        }
      }
      id v8 = (id)[v7 countByEnumeratingWithState:&v22 objects:v36 count:16];
      if (v8) {
        continue;
      }
      break;
    }
  }
LABEL_11:

  id v12 = (void *)MEMORY[0x1E4F6E7C0];
  id v13 = [(IMDRelayServiceController *)self relayService];
  BOOL v14 = [MEMORY[0x1E4F1C9E8] dictionary];
  id v20 = 0;
  id v21 = 0;
  int v15 = [v12 service:v13 sendMessage:v14 fromAccount:v8 toDestinations:v5 priority:300 options:v4 identifier:&v21 error:&v20];
  id v16 = v21;
  id v17 = v20;

  if (IMOSLoggingEnabled())
  {
    BOOL v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      long long v19 = @"NO";
      *(_DWORD *)buf = 138413314;
      BOOL v27 = v5;
      __int16 v28 = 2112;
      if (v15) {
        long long v19 = @"YES";
      }
      __int16 v29 = v19;
      __int16 v30 = 2112;
      id v31 = v8;
      __int16 v32 = 2112;
      id v33 = v17;
      __int16 v34 = 2112;
      id v35 = v16;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "SMS relay data sent to: %@   success: %@ account:%@  error: %@  identifier %@", buf, 0x34u);
    }
  }
}

- (void)_sendMessageToAllSMSRelayDevicesWithOptions:(id)a3
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = objc_alloc_init(MEMORY[0x1E4F1CA48]);
  long long v33 = 0u;
  long long v34 = 0u;
  long long v35 = 0u;
  long long v36 = 0u;
  uint64_t v6 = [(IMDRelayServiceController *)self relayService];
  id v7 = [v6 devices];

  uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v48 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v34;
    do
    {
      for (uint64_t i = 0; i != v8; ++i)
      {
        if (*(void *)v34 != v9) {
          objc_enumerationMutation(v7);
        }
        BOOL v11 = (void *)IDSCopyIDForDevice();
        if ([v11 length]) {
          [v5 addObject:v11];
        }
      }
      uint64_t v8 = [v7 countByEnumeratingWithState:&v33 objects:v48 count:16];
    }
    while (v8);
  }

  long long v31 = 0u;
  long long v32 = 0u;
  long long v29 = 0u;
  long long v30 = 0u;
  id v12 = [(IMDRelayServiceController *)self relayService];
  id v13 = [v12 accounts];

  id v14 = (id)[v13 countByEnumeratingWithState:&v29 objects:v47 count:16];
  if (v14)
  {
    uint64_t v15 = *(void *)v30;
    while (2)
    {
      for (uint64_t j = 0; j != v14; uint64_t j = (char *)j + 1)
      {
        if (*(void *)v30 != v15) {
          objc_enumerationMutation(v13);
        }
        id v17 = *(void **)(*((void *)&v29 + 1) + 8 * (void)j);
        if ([v17 isActive])
        {
          id v14 = v17;
          goto LABEL_20;
        }
      }
      id v14 = (id)[v13 countByEnumeratingWithState:&v29 objects:v47 count:16];
      if (v14) {
        continue;
      }
      break;
    }
  }
LABEL_20:

  BOOL v18 = (void *)MEMORY[0x1E4F6E7C0];
  long long v19 = [(IMDRelayServiceController *)self relayService];
  id v20 = [MEMORY[0x1E4F1C9E8] dictionary];
  id v21 = [MEMORY[0x1E4F1CAD0] setWithArray:v5];
  id v27 = 0;
  id v28 = 0;
  int v22 = [v18 service:v19 sendMessage:v20 fromAccount:v14 toDestinations:v21 priority:300 options:v4 identifier:&v28 error:&v27];
  id v23 = v28;
  id v24 = v27;

  if (IMOSLoggingEnabled())
  {
    long long v25 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138413314;
      long long v26 = @"NO";
      id v38 = v5;
      __int16 v39 = 2112;
      if (v22) {
        long long v26 = @"YES";
      }
      uint64_t v40 = v26;
      __int16 v41 = 2112;
      id v42 = v14;
      __int16 v43 = 2112;
      id v44 = v24;
      __int16 v45 = 2112;
      id v46 = v23;
      _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "SMS relay data sent to: %@   success: %@ account:%@  error: %@  identifier %@", buf, 0x34u);
    }
  }
}

- (BOOL)sendToLocalPeers:(id)a3
{
  return [(IMDRelayServiceController *)self sendFileToLocalPeers:0 metadata:a3];
}

- (BOOL)sendFileToLocalPeers:(id)a3 metadata:(id)a4
{
  v36[2] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v30 = v7;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Sending message to local device => dictionary: %@", buf, 0xCu);
    }
  }
  uint64_t v9 = [(IMDRelayServiceController *)self localDevice];

  if (v9)
  {
    id v10 = (id)*MEMORY[0x1E4F6ADA8];
    BOOL v11 = objc_msgSend(objc_alloc(MEMORY[0x1E4F1CAD0]), "initWithObjects:", v10, 0);
    uint64_t v12 = *MEMORY[0x1E4F6A990];
    v35[0] = *MEMORY[0x1E4F6A9C8];
    v35[1] = v12;
    v36[0] = MEMORY[0x1E4F1CC38];
    v36[1] = MEMORY[0x1E4F1CC28];
    id v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v36 forKeys:v35 count:2];
    [(IMDRelayServiceController *)self _checkAndSetRelayService];
    if (v6)
    {
      id v14 = [(IMDRelayServiceController *)self relayService];
      uint64_t v27 = 0;
      uint64_t v28 = 0;
      int v15 = [v14 sendResourceAtURL:v6 metadata:v7 toDestinations:v11 priority:300 options:v13 identifier:&v28 error:&v27];
      id v16 = (id *)&v27;
      id v17 = (id *)&v28;
    }
    else
    {
      long long v19 = (void *)MEMORY[0x1E4F6E7C0];
      id v14 = [(IMDRelayServiceController *)self relayService];
      uint64_t v25 = 0;
      uint64_t v26 = 0;
      int v15 = [v19 service:v14 sendMessage:v7 fromAccount:0 toDestinations:v11 priority:300 options:v13 identifier:&v26 error:&v25];
      id v16 = (id *)&v25;
      id v17 = (id *)&v26;
    }
    id v20 = *v17;
    id v21 = *v16;

    if (IMOSLoggingEnabled())
    {
      int v22 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
      {
        id v23 = @"NO";
        *(_DWORD *)buf = 138412802;
        id v30 = v21;
        __int16 v31 = 2112;
        if (v15) {
          id v23 = @"YES";
        }
        long long v32 = v23;
        __int16 v33 = 2112;
        id v34 = v20;
        _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Sending message to local account (error %@) success: %@ with Identifier %@", buf, 0x20u);
      }
    }
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "No Local Device Found, unable to send message", buf, 2u);
      }
    }
    LOBYTE(v15) = 0;
  }

  return v15;
}

- (void)_relayEditedMessage:(id)a3 messageGUID:(id)a4 serializedHandles:(id)a5 chatStyle:(unsigned __int8)a6 callerID:(id)a7
{
  int v8 = a6;
  uint64_t v33 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v29 = a4;
  id value = a5;
  id v28 = a7;
  id v13 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  id v14 = v12;
  if (v14)
  {
    CFDictionarySetValue(v13, IMDRelayMessageItemDictionary, v14);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1D9903784();
  }

  if (value) {
    CFDictionarySetValue(v13, IMDCTMessageDictionaryReceipientsKey, value);
  }
  uint64_t v15 = MEMORY[0x1E4F1CC38];
  CFDictionarySetValue(v13, IMDRelayMessageDictionarySendOnlyKey, MEMORY[0x1E4F1CC38]);
  id v16 = sub_1D96B2D04(v8);
  if (v16) {
    CFDictionarySetValue(v13, IMDRelayMessageDictionaryChatStyleKey, v16);
  }
  id v17 = JWEncodeDictionary();
  BOOL v18 = (void *)[v17 _FTCopyGzippedData];
  long long v19 = (void *)MEMORY[0x1E4F1CA60];
  id v20 = IDSGetUUIDData();
  id v21 = [NSNumber numberWithInteger:143];
  int v22 = objc_msgSend(v19, "dictionaryWithObjectsAndKeys:", v15, *MEMORY[0x1E4F6AA18], v15, *MEMORY[0x1E4F6AA00], MEMORY[0x1E4F1CC28], *MEMORY[0x1E4F6A990], v20, *MEMORY[0x1E4F6AA20], v21, *MEMORY[0x1E4F6A978], v18, *MEMORY[0x1E4F6A988], 0);

  id v23 = [(IMDRelayServiceController *)self localDevice];
  if (!v23 || (BOOL v24 = [(IMDRelayServiceController *)self isProxyRegistered], v23, v24))
  {
    BOOL v25 = [(IMDRelayServiceController *)self sendDataToPeers:v22 forcedCallerID:v28 shouldFilterRecepients:0 requestProxySend:1 dontSendTo:0];
    if (IMOSLoggingEnabled())
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        uint64_t v27 = @"NO";
        if (v25) {
          uint64_t v27 = @"YES";
        }
        *(_DWORD *)buf = 138412290;
        long long v32 = v27;
        _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Success sending data to peers: %@", buf, 0xCu);
      }
    }
  }
}

- (void)_relayMessageToPairedDevice:(id)a3 messageID:(id)a4 hasAttachments:(BOOL)a5
{
  v21[2] = *MEMORY[0x1E4F143B8];
  int v8 = &IMDRelayLocalMessageTypeOutgoing;
  if (a5) {
    int v8 = &IMDRelayLocalMessageTypeOutgoingDownload;
  }
  uint64_t v9 = *v8;
  v20[0] = IMDRelayLocalMessageDictionaryOutgoingDictKey;
  v20[1] = IMDRelayLocalMessageDictionaryGUIDKey;
  v21[0] = a3;
  v21[1] = a4;
  id v10 = (void *)MEMORY[0x1E4F1C9E8];
  BOOL v11 = v9;
  id v12 = a4;
  id v13 = a3;
  id v14 = [v10 dictionaryWithObjects:v21 forKeys:v20 count:2];
  uint64_t v15 = JWEncodeDictionary();
  id v16 = (void *)[v15 _FTCopyGzippedData];
  v18[0] = IMDRelayLocalMessageDictionaryDictKey;
  v18[1] = IMDRelayLocalMessageDictionaryTypeKey;
  v19[0] = v16;
  v19[1] = v11;
  id v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
  [(IMDRelayServiceController *)self sendToLocalPeers:v17];
}

- (void)_relayMessageDict:(id)a3 messageID:(id)a4 forcedCallerID:(id)a5 didSendSMS:(BOOL)a6 relayToWatchOnly:(BOOL)a7 shouldDisableScreenTimeRestrictions:(BOOL)a8 hasAttachments:(BOOL)a9 requiredCapabilities:(id)a10
{
  BOOL v10 = a7;
  BOOL v11 = a6;
  if (a9) {
    uint64_t v14 = 144;
  }
  else {
    uint64_t v14 = 143;
  }
  -[IMDRelayServiceController _relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:requiredCapabilities:](self, "_relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:requiredCapabilities:", a3, v14, a4, a5, v11, v10);
}

- (id)_sendOptionsForRelayMessage:(id)a3 command:(int64_t)a4 guid:(id)a5
{
  v17[6] = *MEMORY[0x1E4F143B8];
  id v6 = a5;
  id v7 = JWEncodeDictionary();
  int v8 = (void *)[v7 _FTCopyGzippedData];
  uint64_t v9 = *MEMORY[0x1E4F6AA00];
  v16[0] = *MEMORY[0x1E4F6AA18];
  v16[1] = v9;
  v17[0] = MEMORY[0x1E4F1CC38];
  v17[1] = MEMORY[0x1E4F1CC38];
  uint64_t v10 = *MEMORY[0x1E4F6A990];
  v17[2] = MEMORY[0x1E4F1CC28];
  uint64_t v11 = *MEMORY[0x1E4F6AA20];
  v16[2] = v10;
  v16[3] = v11;
  id v12 = IDSGetUUIDData();

  v17[3] = v12;
  v16[4] = *MEMORY[0x1E4F6A978];
  id v13 = [NSNumber numberWithInteger:a4];
  v16[5] = *MEMORY[0x1E4F6A988];
  v17[4] = v13;
  v17[5] = v8;
  uint64_t v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v17 forKeys:v16 count:6];

  return v14;
}

- (void)_relayMessageDict:(id)a3 command:(int64_t)a4 messageID:(id)a5 forcedCallerID:(id)a6 didSendSMS:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 hasAttachments:(BOOL)a10 requiredCapabilities:(id)a11
{
  LOWORD(v11) = __PAIR16__(a10, a9);
  -[IMDRelayServiceController _relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:sentToDevices:requiredCapabilities:](self, "_relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:sentToDevices:requiredCapabilities:", a3, a4, a5, a6, a7, a8, v11, 0, a11);
}

- (void)_relayMessageDict:(id)a3 command:(int64_t)a4 messageID:(id)a5 forcedCallerID:(id)a6 didSendSMS:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 hasAttachments:(BOOL)a10 sentToDevices:(id *)a11 requiredCapabilities:(id)a12
{
  LOWORD(v12) = __PAIR16__(a10, a9);
  -[IMDRelayServiceController _relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:sentToDevices:extraOptions:requiredCapabilities:](self, "_relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:sentToDevices:extraOptions:requiredCapabilities:", a3, a4, a5, a6, a7, a8, v12, a11, 0, a12);
}

- (void)_relayMessageDict:(id)a3 command:(int64_t)a4 messageID:(id)a5 forcedCallerID:(id)a6 didSendSMS:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 hasAttachments:(BOOL)a10 sentToDevices:(id *)a11 extraOptions:(id)a12 requiredCapabilities:(id)a13
{
  BOOL v13 = a8;
  BOOL v14 = a7;
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v19 = a3;
  id v20 = a5;
  id v32 = a6;
  id v21 = a12;
  id v22 = a13;
  uint64_t v33 = v19;
  id v23 = [(IMDRelayServiceController *)self _sendOptionsForRelayMessage:v19 command:a4 guid:v20];
  BOOL v24 = (void *)[v23 mutableCopy];

  if (v21) {
    [v24 addEntriesFromDictionary:v21];
  }
  if (v13) {
    [v24 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:@"_SMSServiceRelayToWatchOnly"];
  }
  if ([v22 count]) {
    [v24 setObject:v22 forKey:@"requiredCapabilitiesForSMSRelay"];
  }
  if (v14)
  {
    BOOL v25 = [NSNumber numberWithDouble:*MEMORY[0x1E4F6B050]];
    if (v25) {
      CFDictionarySetValue((CFMutableDictionaryRef)v24, (const void *)*MEMORY[0x1E4F6AA10], v25);
    }

    [(IMDRelayServiceController *)self _forwardMessageToPeers:v33 messageType:a4 guid:v20 originalSender:0 hasAttachment:a10 watchOnly:v13 sentToDevices:a11 requiredCapabilities:v22];
  }
  else
  {
    if (a10 && IMOSLoggingEnabled())
    {
      uint64_t v26 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "Relaying attachment to SMS capable device.", buf, 2u);
      }
    }
    uint64_t v27 = [(IMDRelayServiceController *)self localDevice];
    if (!v27
      || (BOOL v28 = [(IMDRelayServiceController *)self isProxyRegistered], v27, v28))
    {
      BOOL v29 = [(IMDRelayServiceController *)self sendDataToPeers:v24 forcedCallerID:v32 shouldFilterRecepients:0 requestProxySend:1 dontSendTo:0 sentToDevices:a11];
      if (IMOSLoggingEnabled())
      {
        id v30 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
        {
          __int16 v31 = @"NO";
          if (v29) {
            __int16 v31 = @"YES";
          }
          *(_DWORD *)buf = 138412290;
          long long v35 = v31;
          _os_log_impl(&dword_1D967A000, v30, OS_LOG_TYPE_INFO, "Success sending data to peers: %@", buf, 0xCu);
        }
      }
    }
  }
}

- (void)forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6
{
}

- (void)forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6 watchOnly:(BOOL)a7
{
}

- (void)forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6 hasAttachment:(BOOL)a7 watchOnly:(BOOL)a8
{
}

- (void)_forwardMessageToPeers:(id)a3 messageType:(int64_t)a4 guid:(id)a5 originalSender:(id)a6 hasAttachment:(BOOL)a7 watchOnly:(BOOL)a8 sentToDevices:(id *)a9 requiredCapabilities:(id)a10
{
  BOOL v10 = a8;
  BOOL v11 = a7;
  id v15 = a3;
  id v16 = a5;
  id v17 = a6;
  id v18 = a10;
  if (IMOSLoggingEnabled())
  {
    id v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Adding reflect only key and forwarding message to peers", buf, 2u);
    }
  }
  if ([(IMDRelayServiceController *)self isSMSRelayEnabled])
  {
    id v20 = (__CFDictionary *)[objc_alloc(MEMORY[0x1E4F1CA60]) initWithDictionary:v15];
    CFDictionarySetValue(v20, IMDRelayMessageDictionaryForcedShowOnlyKey, MEMORY[0x1E4F1CC38]);
    id v48 = JWEncodeDictionary();
    int v21 = IMOSLoggingEnabled();
    id v47 = v15;
    id v44 = v18;
    id v45 = v17;
    id v42 = v20;
    __int16 v43 = self;
    if (v11)
    {
      if (v21)
      {
        id v22 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v51 = 0;
          _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "forwardMessageToPeers: Not compressing data", v51, 2u);
        }
      }
      id v23 = v48;
    }
    else
    {
      if (v21)
      {
        BOOL v24 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v50 = 0;
          _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "forwardMessageToPeers: Compressing data", v50, 2u);
        }
      }
      id v23 = (id)[v48 _FTCopyGzippedData];
    }
    id v25 = v23;
    uint64_t v40 = (void *)MEMORY[0x1E4F1CA60];
    uint64_t v39 = *MEMORY[0x1E4F6AA18];
    uint64_t v26 = *MEMORY[0x1E4F6AA00];
    uint64_t v27 = *MEMORY[0x1E4F6A990];
    id v46 = v16;
    BOOL v28 = IDSGetUUIDData();
    uint64_t v29 = *MEMORY[0x1E4F6AA20];
    id v30 = [NSNumber numberWithInteger:a4];
    uint64_t v31 = *MEMORY[0x1E4F6A978];
    uint64_t v32 = *MEMORY[0x1E4F6A988];
    uint64_t v33 = [NSNumber numberWithBool:v10];
    __int16 v41 = v25;
    id v34 = objc_msgSend(v40, "dictionaryWithObjectsAndKeys:", v39, MEMORY[0x1E4F1CC38], v26, MEMORY[0x1E4F1CC28], v27, v28, v29, v30, v31, v25, v32, v33, @"_SMSServiceRelayToWatchOnly", 0);

    id v18 = v44;
    if ([v44 count]) {
      [v34 setObject:v44 forKey:@"requiredCapabilitiesForSMSRelay"];
    }
    long long v35 = [MEMORY[0x1E4F6E660] myCTPhoneNumber];
    id v17 = v45;
    [(IMDRelayServiceController *)v43 sendDataToPeers:v34 forcedCallerID:v35 shouldFilterRecepients:1 requestProxySend:0 dontSendTo:v45 sentToDevices:a9];

    uint64_t v36 = [(IMDRelayServiceController *)v43 localDevice];
    id v16 = v46;
    id v15 = v47;
    if (v36)
    {
      uint64_t v37 = (void *)v36;
      BOOL v38 = [(IMDRelayServiceController *)v43 isLocalDeviceProxyRegistered];

      if (!v38) {
        [(IMDRelayServiceController *)v43 _relayMessageToPairedDevice:v42 messageID:v46 hasAttachments:a4 == 144];
      }
    }
  }
}

- (BOOL)_canRelayMessage:(id)a3 forChat:(id)a4
{
  uint64_t v36 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (([v6 isTypingMessage] & 1) != 0 || objc_msgSend(v6, "isSuggestedActionResponse"))
  {
    if (IMOSLoggingEnabled())
    {
      int v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        LOWORD(v30) = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Not relaying message to peers, typing indicators unsupported at this time", (uint8_t *)&v30, 2u);
      }
    }
    BOOL v9 = 0;
  }
  else if ([v7 isChatBot])
  {
    BOOL v11 = [v6 body];
    uint64_t v12 = (void *)[v11 mutableCopy];

    BOOL v13 = @"NO";
    if ([MEMORY[0x1E4F6E730] supportsDataDetectors])
    {
      BOOL v14 = [v6 body];
      unint64_t v15 = [v14 length];

      BOOL v13 = @"NO";
      if (v15 <= 0xF9F)
      {
        id v16 = [v12 string];
        id v17 = [v6 guid];
        id v18 = [v6 sender];
        id v19 = (void *)MEMORY[0x1E4F1C9C8];
        id v20 = [v6 time];
        int v21 = objc_msgSend(v19, "dateWithTimeIntervalSinceReferenceDate:", (double)objc_msgSend(v20, "__im_nanosecondTimeInterval"));
        [v6 isFromMe];
        int v22 = IMDDScanAttributedStringWithExtendedContext();

        BOOL v13 = @"NO";
        if (v22) {
          BOOL v13 = @"YES";
        }
      }
    }
    id v23 = [(IMDRelayServiceController *)self otcUtilities];
    BOOL v24 = [v6 sender];
    id v25 = [v6 guid];
    uint64_t v26 = (void *)[v23 createOTCFromMessageBody:v12 sender:v24 guid:v25];

    BOOL v9 = v26 != 0;
    if (IMOSLoggingEnabled())
    {
      uint64_t v27 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
      {
        BOOL v28 = "Will not";
        if (v26) {
          BOOL v28 = "Will";
        }
        int v30 = 136315650;
        uint64_t v31 = v28;
        uint64_t v29 = @"YES";
        __int16 v32 = 2112;
        if (!v26) {
          uint64_t v29 = @"NO";
        }
        uint64_t v33 = v29;
        __int16 v34 = 2112;
        long long v35 = v13;
        _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "%s relay chatbot message because it's a OTC: %@, found DD results: %@", (uint8_t *)&v30, 0x20u);
      }
    }
  }
  else
  {
    BOOL v9 = 1;
  }

  return v9;
}

- (int64_t)_maxWatchTransferSize
{
  return 0x80000;
}

- (BOOL)_needsLowQualityTranscodeForMessage:(id)a3
{
  uint64_t v22 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = [(IMDRelayServiceController *)self localDevice];

  if (v5 && ([v4 isFromMe] & 1) == 0)
  {
    long long v19 = 0u;
    long long v20 = 0u;
    long long v17 = 0u;
    long long v18 = 0u;
    id v7 = objc_msgSend(v4, "fileTransferGUIDs", 0);
    uint64_t v8 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
    if (v8)
    {
      uint64_t v9 = v8;
      uint64_t v10 = *(void *)v18;
      while (2)
      {
        for (uint64_t i = 0; i != v9; ++i)
        {
          if (*(void *)v18 != v10) {
            objc_enumerationMutation(v7);
          }
          uint64_t v12 = *(void *)(*((void *)&v17 + 1) + 8 * i);
          BOOL v13 = +[IMDAttachmentStore sharedInstance];
          BOOL v14 = [v13 attachmentWithGUID:v12];

          if (([v14 isInThumbnailState] & 1) == 0)
          {
            unint64_t v15 = [v14 totalBytes];
            if (v15 > [(IMDRelayServiceController *)self _maxWatchTransferSize])
            {

              BOOL v6 = 1;
              goto LABEL_15;
            }
          }
        }
        uint64_t v9 = [v7 countByEnumeratingWithState:&v17 objects:v21 count:16];
        if (v9) {
          continue;
        }
        break;
      }
    }
    BOOL v6 = 0;
LABEL_15:
  }
  else
  {
    BOOL v6 = 0;
  }

  return v6;
}

- (BOOL)relayMessageToPeers:(id)a3 forChat:(id)a4 serviceName:(id)a5 reflectOnly:(BOOL)a6 requiredCapabilities:(id)a7
{
  uint64_t v8 = a6;
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v12 = a3;
  id v32 = a4;
  id v33 = a5;
  id v34 = a7;
  BOOL v31 = [(IMDRelayServiceController *)self _needsLowQualityTranscodeForMessage:v12];
  if (v31)
  {
    unsigned int v30 = v8;
    if (IMOSLoggingEnabled())
    {
      BOOL v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        BOOL v14 = [v12 guid];
        *(_DWORD *)buf = 138412290;
        id v44 = v14;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Message %@ needs LQ transcode to go to watch - we will relay a low-quality transcoded result to the watch", buf, 0xCu);
      }
    }
    unint64_t v15 = +[IMDAttachmentStore sharedInstance];
    id v16 = [v12 fileTransferGUIDs];
    long long v17 = [v16 firstObject];
    long long v18 = [v15 attachmentWithGUID:v17];

    uint64_t v29 = +[IMDRelayTranscodeController sharedInstance];
    long long v19 = [v18 localURL];
    long long v20 = [v18 type];
    int v21 = [v18 transcoderUserInfo];
    uint64_t v22 = [v18 isSticker];
    int64_t v23 = [(IMDRelayServiceController *)self _maxWatchTransferSize];
    int64_t v24 = [(IMDRelayServiceController *)self _maxWatchTransferSize];
    v35[0] = MEMORY[0x1E4F143A8];
    v35[1] = 3221225472;
    void v35[2] = sub_1D97C1D5C;
    v35[3] = &unk_1E6B767C8;
    id v36 = v18;
    uint64_t v37 = self;
    id v38 = v12;
    id v39 = v32;
    id v40 = v33;
    id v41 = v34;
    char v42 = v30;
    id v25 = v18;
    [v29 transcodeFileTransferContents:v19 utiType:v20 target:1 transcoderUserInfo:v21 isSticker:v22 highQualityMaxByteSize:v23 lowQualityMaxByteSize:v24 representations:0 completionBlock:v35];

    uint64_t v8 = v30;
  }
  LOBYTE(v28) = 0;
  BOOL v26 = [(IMDRelayServiceController *)self _relayMessageToPeers:v12 forChat:v32 serviceName:v33 requiredCapabilities:v34 reflectOnly:v8 excludesWatch:v31 onlyWatch:v28 overridingAttachmentData:0];

  return v26;
}

- (BOOL)_relayMessageToPeers:(id)a3 forChat:(id)a4 serviceName:(id)a5 requiredCapabilities:(id)a6 reflectOnly:(BOOL)a7 excludesWatch:(BOOL)a8 onlyWatch:(BOOL)a9 overridingAttachmentData:(id)a10
{
  BOOL v10 = a8;
  uint64_t v42 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v17 = a5;
  id v18 = a6;
  id v19 = a10;
  if ([(IMDRelayServiceController *)self _canRelayMessage:v15 forChat:v16])
  {
    state.opaque[0] = 0;
    state.opaque[1] = 0;
    id v36 = _os_activity_create(&dword_1D967A000, "com.apple.messages.SMSRelaySend", MEMORY[0x1E4F144F0], OS_ACTIVITY_FLAG_DEFAULT);
    os_activity_scope_enter(v36, &state);
    id v20 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
    if ([v15 isFromMe])
    {
      BOOL v21 = 1;
      LOBYTE(v32) = 0;
      [(IMDRelayServiceController *)self relayMessage:v15 chat:v16 didSendSMS:1 attemptingReplication:0 forceReflection:0 relayToWatchOnly:0 shouldDisableScreenTimeRestrictions:v32 callerID:0 iMessageCapability:0 requiredCapabilities:v18];
    }
    else
    {
      uint64_t v22 = [(id)objc_opt_class() _convertIMMessageItemToIncomingRelayDictionary:v15 chat:v16 overridingAttachmentData:v19];
      if (v22)
      {
        [v20 addEntriesFromDictionary:v22];
        long long v35 = v22;
        int64_t v23 = [v16 participants];
        int64_t v24 = +[IMDRelayServiceController _convertIMDHandlesToArrayOfIDs:v23];

        if ([v24 count])
        {
          if (IMOSLoggingEnabled())
          {
            id v25 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
            {
              uint64_t v26 = [v15 guid];
              *(_DWORD *)buf = 138412546;
              uint64_t v39 = v26;
              __int16 v40 = 2112;
              id v41 = v24;
              id v33 = (void *)v26;
              _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Recipients when trying to relay incoming message %@, %@", buf, 0x16u);
            }
          }
          [v20 setObject:v24 forKeyedSubscript:IMDCTMessageDictionaryReceipientsKey];
        }
        else if (IMOSLoggingEnabled())
        {
          uint64_t v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            uint64_t v30 = [v15 guid];
            *(_DWORD *)buf = 138412290;
            uint64_t v39 = v30;
            id v34 = (void *)v30;
            _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "No recipients when trying to relay incoming message %@", buf, 0xCu);
          }
        }
        BOOL v21 = -[IMDRelayServiceController relayDictionaryToPeers:requiresUpload:serviceName:requiredCapabilities:excludesWatch:onlyWatch:](self, "relayDictionaryToPeers:requiresUpload:serviceName:requiredCapabilities:excludesWatch:onlyWatch:", v20, [MEMORY[0x1E4F6E660] shouldUploadToMMCS:v20], v17, v18, v10, a9);

        uint64_t v22 = v35;
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v27 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
          {
            uint64_t v28 = [v15 guid];
            *(_DWORD *)buf = 138412290;
            uint64_t v39 = (uint64_t)v28;
            _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "No message dictionary when trying to relay %@", buf, 0xCu);
          }
        }
        BOOL v21 = 0;
      }
    }
    os_activity_scope_leave(&state);
  }
  else
  {
    BOOL v21 = 0;
  }

  return v21;
}

- (BOOL)relayDictionaryToPeers:(id)a3 requiresUpload:(BOOL)a4 serviceName:(id)a5
{
  return [(IMDRelayServiceController *)self relayDictionaryToPeers:a3 requiresUpload:a4 serviceName:a5 requiredCapabilities:0 excludesWatch:0 onlyWatch:0];
}

- (BOOL)relayDictionaryToPeers:(id)a3 requiresUpload:(BOOL)a4 serviceName:(id)a5 requiredCapabilities:(id)a6
{
  return [(IMDRelayServiceController *)self relayDictionaryToPeers:a3 requiresUpload:a4 serviceName:a5 requiredCapabilities:a6 excludesWatch:0 onlyWatch:0];
}

- (BOOL)relayDictionaryToPeers:(id)a3 requiresUpload:(BOOL)a4 serviceName:(id)a5 requiredCapabilities:(id)a6 excludesWatch:(BOOL)a7 onlyWatch:(BOOL)a8
{
  BOOL v85 = a8;
  BOOL v86 = a7;
  BOOL v87 = a4;
  uint64_t v126 = *MEMORY[0x1E4F143B8];
  id v90 = (__CFDictionary *)a3;
  id v88 = a5;
  id v89 = a6;
  if (IMOSLoggingEnabled())
  {
    BOOL v10 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      BOOL v11 = @"NO";
      if (v87) {
        BOOL v11 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v121 = v11;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Trying to relay dictionary to peers, requiresUpload: %@", buf, 0xCu);
    }
  }
  if (![(IMDRelayServiceController *)self hasPeerDevices])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, " => Not sending data for received message, we have no peer devices", buf, 2u);
      }
      goto LABEL_38;
    }
    goto LABEL_39;
  }
  id v12 = [(IMDRelayServiceController *)self enrollmentController];
  BOOL v13 = [v12 _allowedDevicesforSMSRelay];
  BOOL v14 = [v13 count] == 0;

  if (v14)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, " => Not sending data for received message, we have no devices on the allowed list", buf, 2u);
      }
      goto LABEL_38;
    }
LABEL_39:
    BOOL v30 = 0;
    goto LABEL_40;
  }
  if (![(IMDRelayServiceController *)self isSMSRelayEnabled])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, " => Not sending data for received message, smsRelay not enabled", buf, 2u);
      }
LABEL_38:

      goto LABEL_39;
    }
    goto LABEL_39;
  }
  id v15 = [MEMORY[0x1E4F6B3E8] sharedInstance];
  id v16 = [(__CFDictionary *)v90 objectForKey:IMDCTMessageDictionarySenderKey];
  int v17 = [v15 isPhoneNumberEmergencyNumber:v16];

  if (v17)
  {
    long long v112 = 0u;
    long long v113 = 0u;
    long long v110 = 0u;
    long long v111 = 0u;
    id v18 = [(IMDRelayServiceController *)self relayService];
    id v19 = [v18 devices];

    uint64_t v20 = [v19 countByEnumeratingWithState:&v110 objects:v125 count:16];
    if (v20)
    {
      uint64_t v21 = *(void *)v111;
      while (2)
      {
        for (uint64_t i = 0; i != v20; ++i)
        {
          if (*(void *)v111 != v21) {
            objc_enumerationMutation(v19);
          }
          int64_t v23 = *(void **)(*((void *)&v110 + 1) + 8 * i);
          __int16 v124 = v23;
          int64_t v24 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v124 count:1];
          BOOL v25 = [(IMDRelayServiceController *)self _isConnectedOverBT:v24];

          int v26 = IMOSLoggingEnabled();
          if (v25)
          {
            if (v26)
            {
              uint64_t v32 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
              {
                *(_DWORD *)buf = 138412546;
                uint64_t v121 = v23;
                __int16 v122 = 2112;
                id v123 = @"YES";
                _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "This message is from an emergency number, but we have a Watch connected over BT %@, relaying message %@", buf, 0x16u);
              }
            }
            goto LABEL_46;
          }
          if (v26)
          {
            uint64_t v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              uint64_t v121 = v23;
              _os_log_impl(&dword_1D967A000, v27, OS_LOG_TYPE_INFO, "This message is from an emergency number, not relaying to peer %@", buf, 0xCu);
            }
          }
        }
        uint64_t v20 = [v19 countByEnumeratingWithState:&v110 objects:v125 count:16];
        if (v20) {
          continue;
        }
        break;
      }
    }

    if (IMOSLoggingEnabled())
    {
      uint64_t v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "No watch paired connected over Bluetooth, skipping relaying emergency SMS", buf, 2u);
      }
    }
    goto LABEL_39;
  }
LABEL_46:
  if (!IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    theDict = v90;
    goto LABEL_70;
  }
  theDict = (__CFDictionary *)[(__CFDictionary *)v90 mutableCopy];
  id v33 = [(__CFDictionary *)v90 _stringForKey:IMDCTMessageDictionaryOriginatedDeviceSIMKey];
  id v34 = [MEMORY[0x1E4F6E668] sharedInstance];
  long long v35 = [v34 registeredSIMIDs];

  long long v108 = 0u;
  long long v109 = 0u;
  long long v106 = 0u;
  long long v107 = 0u;
  id v36 = v35;
  uint64_t v37 = [(__CFString *)v36 countByEnumeratingWithState:&v106 objects:v119 count:16];
  if (v37)
  {
    char v38 = 0;
    uint64_t v39 = *(void *)v107;
    do
    {
      for (uint64_t j = 0; j != v37; ++j)
      {
        if (*(void *)v107 != v39) {
          objc_enumerationMutation(v36);
        }
        if ([v33 isEqualToString:*(void *)(*((void *)&v106 + 1) + 8 * j)])
        {
          if (IMOSLoggingEnabled())
          {
            id v41 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              uint64_t v121 = v33;
              __int16 v122 = 2112;
              id v123 = v36;
              _os_log_impl(&dword_1D967A000, v41, OS_LOG_TYPE_INFO, "Setting iMessageCapability to iMessageCapabilityAble on relay dict because message received on simID %@ is one of the registered simIDs %@", buf, 0x16u);
            }
          }
          CFDictionarySetValue(theDict, IMDRelayMessageDictionaryiMessageCapability, &unk_1F33C5C28);
          char v38 = 1;
        }
      }
      uint64_t v37 = [(__CFString *)v36 countByEnumeratingWithState:&v106 objects:v119 count:16];
    }
    while (v37);

    if (v38) {
      goto LABEL_69;
    }
  }
  else
  {
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v42 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v42, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412546;
      uint64_t v121 = v33;
      __int16 v122 = 2112;
      id v123 = v36;
      _os_log_impl(&dword_1D967A000, v42, OS_LOG_TYPE_INFO, "Setting iMessageCapability to iMessageCapabilityUnable on relay dict because message received on simID %@ isn't one of the registered simIDs %@", buf, 0x16u);
    }
  }
  CFDictionarySetValue(theDict, IMDRelayMessageDictionaryiMessageCapability, &unk_1F33C5C40);
LABEL_69:

LABEL_70:
  if (IMOSLoggingEnabled())
  {
    __int16 v43 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v43, OS_LOG_TYPE_INFO))
    {
      id v44 = [(__CFDictionary *)theDict objectForKey:IMDCTMessageDictionaryReceipientsKey];
      *(_DWORD *)buf = 138412290;
      uint64_t v121 = v44;
      _os_log_impl(&dword_1D967A000, v43, OS_LOG_TYPE_INFO, "Recipients: %@", buf, 0xCu);
    }
  }
  long long v105 = 0u;
  long long v103 = 0u;
  long long v104 = 0u;
  long long v102 = 0u;
  uint64_t v45 = [(__CFDictionary *)theDict objectForKey:IMDCTMessageDictionaryReceipientsKey];
  uint64_t v46 = [v45 countByEnumeratingWithState:&v102 objects:v118 count:16];
  if (v46)
  {
    uint64_t v47 = *(void *)v103;
    while (2)
    {
      for (uint64_t k = 0; k != v46; ++k)
      {
        if (*(void *)v103 != v47) {
          objc_enumerationMutation(v45);
        }
        uint64_t v49 = *(void **)(*((void *)&v102 + 1) + 8 * k);
        if (IMOSLoggingEnabled())
        {
          uint64_t v50 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v50, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v121 = v49;
            _os_log_impl(&dword_1D967A000, v50, OS_LOG_TYPE_INFO, "  Recipient: %@", buf, 0xCu);
          }
        }
        v51 = [MEMORY[0x1E4F6B3E8] sharedInstance];
        int v52 = [v51 isPhoneNumberEmergencyNumber:v49];

        if (v52)
        {
          if (IMOSLoggingEnabled())
          {
            v55 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v55, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v55, OS_LOG_TYPE_INFO, "One of the recipients was an emergency number, this message should not be relayed", buf, 2u);
            }
          }
          BOOL v30 = 0;
          goto LABEL_130;
        }
      }
      uint64_t v46 = [v45 countByEnumeratingWithState:&v102 objects:v118 count:16];
      if (v46) {
        continue;
      }
      break;
    }
  }

  if (IMOSLoggingEnabled())
  {
    uint64_t v53 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v53, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v53, OS_LOG_TYPE_INFO, " Going to forward our received Message onto our other peers", buf, 2u);
    }
  }
  id v54 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  if (v86)
  {
    v92 = [(IMDRelayServiceController *)self pairedDevice];
  }
  else
  {
    v92 = 0;
  }
  if (v87)
  {
    uint64_t v56 = [MEMORY[0x1E4F28CB8] defaultManager];
    BOOL v57 = objc_msgSend(v56, "im_randomTemporaryFileURLWithFileName:", IMDRelayDownloadUploadTemporaryPathKey);
    v58 = [v57 path];

    [(__CFDictionary *)theDict writeToFile:v58 atomically:1];
    if (IMOSLoggingEnabled())
    {
      id v59 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        uint64_t v121 = v58;
        _os_log_impl(&dword_1D967A000, v59, OS_LOG_TYPE_INFO, "Saved File to Path %@", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      v60 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v60, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v60, OS_LOG_TYPE_INFO, "Starting Upload to MMCS Now", buf, 2u);
      }
    }
    v61 = [MEMORY[0x1E4F6EBF8] sharedInstance];
    uint64_t v62 = *MEMORY[0x1E4F6AA68];
    v94[0] = MEMORY[0x1E4F143A8];
    v94[1] = 3221225472;
    v94[2] = sub_1D97C3500;
    v94[3] = &unk_1E6B767F0;
    id v95 = v54;
    id v96 = v88;
    v97 = theDict;
    BOOL v101 = v85;
    id v98 = v89;
    v99 = self;
    id v100 = v92;
    [v61 sendFilePath:v58 topic:v62 userInfo:0 transferID:v58 encryptFile:1 progressBlock:0 completionBlock:v94];

    BOOL v30 = 0;
    uint64_t v63 = v95;
  }
  else
  {
    [v54 addEntriesFromDictionary:theDict];
    v58 = JWEncodeDictionary();
    uint64_t v63 = (void *)[v58 _FTCopyGzippedData];
    v64 = (void *)MEMORY[0x1E4F1CA60];
    v65 = [NSNumber numberWithInteger:140];
    v66 = [(__CFDictionary *)theDict objectForKey:IMDCTMessageDictionaryGUIDKey];
    id v67 = IDSGetUUIDData();
    uint64_t v68 = [NSNumber numberWithDouble:*MEMORY[0x1E4F6B050]];
    uint64_t v69 = [NSNumber numberWithBool:v85];
    v70 = objc_msgSend(v64, "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F6AA18], MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F6AA00], v65, *MEMORY[0x1E4F6A978], v67, *MEMORY[0x1E4F6AA20], v63, *MEMORY[0x1E4F6A988], v68, *MEMORY[0x1E4F6AA10], @"_SMSServiceRelayToWatchOnly", v69, 0);

    if ([v89 count]) {
      [v70 setObject:v89 forKey:@"requiredCapabilitiesForSMSRelay"];
    }
    v71 = [MEMORY[0x1E4F6E660] myCTPhoneNumber];
    BOOL v30 = [(IMDRelayServiceController *)self sendDataToPeers:v70 forcedCallerID:v71 shouldFilterRecepients:1 requestProxySend:0 dontSendTo:v92];
  }
  if (IMOSLoggingEnabled())
  {
    v72 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      BOOL v73 = @"NO";
      if (v87) {
        BOOL v73 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      uint64_t v121 = v73;
      _os_log_impl(&dword_1D967A000, v72, OS_LOG_TYPE_INFO, "Relaying to local device, requiresUpload %@", buf, 0xCu);
    }
  }
  if (v86) {
    goto LABEL_129;
  }
  if (v87)
  {
    v74 = [(IMDRelayServiceController *)self localDevice];
    BOOL v75 = v74 == 0;

    if (!v75)
    {
      if (IMOSLoggingEnabled())
      {
        v76 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v76, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138739971;
          uint64_t v121 = theDict;
          _os_log_impl(&dword_1D967A000, v76, OS_LOG_TYPE_INFO, "Relaying dict containing MMS to local device. %{sensitive}@ ", buf, 0xCu);
        }
      }
      v77 = &IMDRelayLocalMessageTypeIncomingDownloadMessage;
      goto LABEL_128;
    }
  }
  v78 = [(IMDRelayServiceController *)self localDevice];
  if (v78)
  {
    BOOL v79 = [(IMDRelayServiceController *)self isLocalDeviceProxyRegistered];

    if (!v79)
    {
      v77 = &IMDRelayLocalMessageTypeIncomingTextMessage;
LABEL_128:
      id v80 = *v77;
      long long v116 = IMDRelayLocalMessageDictionaryIncomingDictKey;
      long long v117 = theDict;
      id v81 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v117 forKeys:&v116 count:1];
      v82 = JWEncodeDictionary();
      v83 = (void *)[v82 _FTCopyGzippedData];
      v114[0] = IMDRelayLocalMessageDictionaryDictKey;
      v114[1] = IMDRelayLocalMessageDictionaryTypeKey;
      v115[0] = v83;
      v115[1] = v80;
      v84 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v115 forKeys:v114 count:2];
      [(IMDRelayServiceController *)self sendToLocalPeers:v84];
    }
  }
LABEL_129:

LABEL_130:
  id v90 = theDict;
LABEL_40:

  return v30;
}

- (void)sendDeleteCommand:(id)a3 forChatGUID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IMDCKUtilities sharedInstance];
  char v9 = [v8 cloudKitSyncingEnabled];

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Forwarding delete command to all other devices", buf, 2u);
      }
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  BOOL v11 = [(IMDRelayServiceController *)self pairedDevice];

  int v12 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v12)
    {
      BOOL v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Send delete command only to the paired device", buf, 2u);
      }
      goto LABEL_10;
    }
LABEL_11:
    BOOL v13 = +[IMDChatRegistry sharedInstance];
    BOOL v14 = [v13 existingChatWithGUID:v7];

    if (v14)
    {
      id v15 = JWEncodeDictionary();
      id v16 = (void *)[v15 _FTCopyGzippedData];

      if (IMOSLoggingEnabled())
      {
        int v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v6;
          _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Forwarding delete command :%@", buf, 0xCu);
        }
      }
      id v18 = (void *)MEMORY[0x1E4F1C9E8];
      id v19 = [NSNumber numberWithInteger:181];
      uint64_t v20 = [NSNumber numberWithDouble:*MEMORY[0x1E4F6B050]];
      uint64_t v21 = objc_msgSend(v18, "dictionaryWithObjectsAndKeys:", *MEMORY[0x1E4F6AA18], MEMORY[0x1E4F1CC38], *MEMORY[0x1E4F6AA00], v19, *MEMORY[0x1E4F6A978], v16, *MEMORY[0x1E4F6A988], v20, *MEMORY[0x1E4F6AA10], 0);

      if (v9) {
        [(IMDRelayServiceController *)self _sendMessageToAllSMSRelayDevicesWithOptions:v21];
      }
      else {
        [(IMDRelayServiceController *)self _sendMessageToPairedDeviceWithOptions:v21];
      }
    }
    goto LABEL_21;
  }
  if (v12)
  {
    uint64_t v22 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v24 = v6;
      _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "iCloud syncing not enbabled droping delete command to all other devices, (command %@)", buf, 0xCu);
    }
  }
LABEL_21:
}

- (void)sendRecoverCommand:(id)a3 forChatGUID:(id)a4
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = +[IMDCKUtilities sharedInstance];
  char v9 = [v8 cloudKitSyncingEnabled];

  if (v9)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Forwarding recover command to all other devices", buf, 2u);
      }
LABEL_10:

      goto LABEL_11;
    }
    goto LABEL_11;
  }
  BOOL v11 = [(IMDRelayServiceController *)self pairedDevice];

  int v12 = IMOSLoggingEnabled();
  if (v11)
  {
    if (v12)
    {
      BOOL v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Send recover command only to the paired device", buf, 2u);
      }
      goto LABEL_10;
    }
LABEL_11:
    BOOL v13 = +[IMDChatRegistry sharedInstance];
    BOOL v14 = [v13 existingChatWithGUID:v7];

    if (v14)
    {
      id v15 = JWEncodeDictionary();
      id v16 = (void *)[v15 _FTCopyGzippedData];

      if (IMOSLoggingEnabled())
      {
        int v17 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v25 = v6;
          _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "Forwarding recover command :%@", buf, 0xCu);
        }
      }
      id v18 = objc_msgSend(NSNumber, "numberWithDouble:", *MEMORY[0x1E4F6B050], *MEMORY[0x1E4F6AA18], *MEMORY[0x1E4F6AA00], *MEMORY[0x1E4F6A978], *MEMORY[0x1E4F6A988], *MEMORY[0x1E4F6AA10], MEMORY[0x1E4F1CC38], MEMORY[0x1E4F1CC38], &unk_1F33C5C58, v16);
      v23[4] = v18;
      id v19 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v23 forKeys:&v22 count:5];

      if (v9) {
        [(IMDRelayServiceController *)self _sendMessageToAllSMSRelayDevicesWithOptions:v19];
      }
      else {
        [(IMDRelayServiceController *)self _sendMessageToPairedDeviceWithOptions:v19];
      }
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v25 = v7;
        _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Recently Deleted | Early returning: SMSService recoverCommand - chat not found for GUID: %@", buf, 0xCu);
      }
    }
    goto LABEL_25;
  }
  if (v12)
  {
    uint64_t v21 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v25 = v6;
      _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "iCloud syncing not enbabled droping recover command to all other devices, (command %@)", buf, 0xCu);
    }
  }
LABEL_25:
}

- (void)sendEditedMessage:(id)a3 toChat:(id)a4 fromCallerID:(id)a5 backwardCompatabilityText:(id)a6
{
  uint64_t v26 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  id v13 = a6;
  BOOL v14 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v15 = [v14 isPriusEnabled];

  if (v15)
  {
    id v16 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v17 = [v16 isPriusCompatibilityEnabled];

    if (v17)
    {
      id v18 = (void *)[v10 copyForBackwardsCompatibility];
      [v18 setBody:v13];
      if (IMOSLoggingEnabled())
      {
        id v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          int v24 = 138412290;
          id v25 = v18;
          _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "Device doesn't support SMS, sending backwards compatibility edit to relay devices: %@", (uint8_t *)&v24, 0xCu);
        }
      }
      uint64_t v20 = +[IMDRelayServiceController _convertIMMessageItemToOutgoingRelayDictionary:v18 chat:v11];
      uint64_t v21 = [v10 guid];
      uint64_t v22 = [v11 participants];
      int64_t v23 = +[IMDRelayServiceController _convertIMDHandlesToArray:v22];
      -[IMDRelayServiceController _relayEditedMessage:messageGUID:serializedHandles:chatStyle:callerID:](self, "_relayEditedMessage:messageGUID:serializedHandles:chatStyle:callerID:", v20, v21, v23, [v11 style], v12);
    }
  }
}

- (void)relayMessage:(id)a3 chat:(id)a4 didSendSMS:(BOOL)a5 attemptingReplication:(BOOL)a6 forceReflection:(BOOL)a7 relayToWatchOnly:(BOOL)a8 shouldDisableScreenTimeRestrictions:(BOOL)a9 callerID:(id)a10 iMessageCapability:(int64_t)a11 requiredCapabilities:(id)a12
{
  BOOL v33 = a8;
  BOOL v34 = a7;
  BOOL v12 = a6;
  BOOL v32 = a5;
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v15 = a3;
  id v16 = a4;
  id v35 = a10;
  id v17 = a12;
  if (IMOSLoggingEnabled())
  {
    id v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "We have peer devices, relaying message...", buf, 2u);
    }
  }
  id v19 = [v15 balloonBundleID];
  char v20 = [v19 isEqualToString:*MEMORY[0x1E4F6CC10]];

  uint64_t v21 = [v15 fileTransferGUIDs];
  if ([v21 count]) {
    char v22 = v20 ^ 1;
  }
  else {
    char v22 = 0;
  }

  if (v15 && [(IMDRelayServiceController *)self _canRelayMessage:v15 forChat:v16])
  {
    int64_t v23 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
    int v24 = [v16 participants];
    id value = +[IMDRelayServiceController _convertIMDHandlesToArray:v24];

    id v25 = +[IMDRelayServiceController _convertIMMessageItemToOutgoingRelayDictionary:v15 chat:v16];
    if (v25)
    {
      CFDictionarySetValue(v23, IMDRelayMessageItemDictionary, v25);
      if (value) {
        CFDictionarySetValue(v23, IMDCTMessageDictionaryReceipientsKey, value);
      }
      uint64_t v26 = [NSNumber numberWithInteger:a11];
      if (v26) {
        CFDictionarySetValue(v23, IMDRelayMessageDictionaryiMessageCapability, v26);
      }

      if (v12) {
        CFDictionarySetValue(v23, IMDRelayMessageDictionaryAttemptedOutgoingReplicationKey, MEMORY[0x1E4F1CC38]);
      }
      if (v34) {
        CFDictionarySetValue(v23, IMDRelayMessageDictionaryForcedShowOnlyKey, MEMORY[0x1E4F1CC38]);
      }
      uint64_t v27 = sub_1D96B2D04([v16 style]);
      if (v27) {
        CFDictionarySetValue(v23, IMDRelayMessageDictionaryChatStyleKey, v27);
      }
      uint64_t v28 = [v15 guid];
      LOBYTE(v30) = v22;
      [(IMDRelayServiceController *)self _relayMessageDict:v23 messageID:v28 forcedCallerID:v35 didSendSMS:v32 relayToWatchOnly:v33 shouldDisableScreenTimeRestrictions:a9 hasAttachments:v30 requiredCapabilities:v17];
    }
    else if (IMOSLoggingEnabled())
    {
      uint64_t v29 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v37 = v15;
        _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Failed to create an Message Dictionary from the IM Message, Original Message: %@", buf, 0xCu);
      }
    }
  }
}

- (void)sendReadReceiptForMessage:(id)a3 toChat:(id)a4
{
}

- (void)sendReadReceiptForMessage:(id)a3 toChat:(id)a4 reflectOnly:(BOOL)a5
{
  BOOL v5 = a5;
  id v7 = a3;
  id v9 = [v7 guid];
  uint64_t v8 = [v7 timeRead];

  [(IMDRelayServiceController *)self sendReadReceiptForMessageGUID:v9 timeRead:v8 reflectOnly:v5];
}

- (void)sendReadReceiptForMessageGUID:(id)a3 timeRead:(id)a4
{
}

- (void)sendReadReceiptForMessageGUID:(id)a3 timeRead:(id)a4 reflectOnly:(BOOL)a5
{
  BOOL v5 = a5;
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  if (IMOSLoggingEnabled())
  {
    id v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      int v13 = 138412290;
      id v14 = v8;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Marking message as read: %@", (uint8_t *)&v13, 0xCu);
    }
  }
  if (!v9)
  {
    if (IMOSLoggingEnabled())
    {
      id v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v13 = 138412290;
        id v14 = v8;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Trying to mark with a nil timeRead, setting to [NSDate now]: %@", (uint8_t *)&v13, 0xCu);
      }
    }
    id v9 = [MEMORY[0x1E4F1C9C8] now];
  }
  id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v12 setObject:v9 forKeyedSubscript:IMDRelayMessageDictionaryTimeReadKey];
  if (v5) {
    [v12 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:IMDRelayMessageDictionaryForcedShowOnlyKey];
  }
  [(IMDRelayServiceController *)self _broadcastMessageEventWithCommand:147 eventName:IMDRelayLocalMessageTypeRead forGUID:v8 messageExtras:v12 shouldFilterRecipients:0 forcedCallerID:0];
}

- (void)messageSent:(id)a3 onService:(id)a4 compatibilityService:(id)a5
{
}

- (void)messageSent:(id)a3 onService:(id)a4 compatibilityService:(id)a5 wasInterworked:(BOOL)a6
{
  BOOL v6 = a6;
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v10 = a3;
  id v11 = a4;
  id v12 = a5;
  if (IMOSLoggingEnabled())
  {
    int v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = v10;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "RELAY: Going to Tell all my clients that message with GUID %@ has been sent", (uint8_t *)&v16, 0xCu);
    }
  }
  id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  uint64_t v15 = v14;
  if (v11) {
    [v14 setObject:v11 forKeyedSubscript:IMDRelayMessageItemDictionaryServiceKey];
  }
  if (v12) {
    [v15 setObject:v12 forKeyedSubscript:IMDRelayMessageItemDictionaryCompatibilityServiceKey];
  }
  if (v6) {
    [v15 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:IMDRelayMessageDictionaryInterworkedKey];
  }
  [(IMDRelayServiceController *)self _broadcastMessageEventWithCommand:146 eventName:IMDRelayLocalMessageTypeSent forGUID:v10 messageExtras:v15];
}

- (void)messageDelivered:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "RELAY: Going to Tell all my clients that message with GUID %@ has been delivered", (uint8_t *)&v6, 0xCu);
    }
  }
  [(IMDRelayServiceController *)self _broadcastMessageEventWithCommand:101 eventName:IMDRelayLocalMessageTypeDelivered forGUID:v4];
}

- (void)messageReadByRemote:(id)a3
{
  id v4 = a3;
  id v6 = [v4 guid];
  BOOL v5 = [v4 timeRead];

  [(IMDRelayServiceController *)self messageGUIDReadByRemote:v6 timeRead:v5];
}

- (void)messageGUIDReadByRemote:(id)a3 timeRead:(id)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v8 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v14 = v6;
      _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "RELAY: Going to Tell all my clients that message with GUID %@ has been read", buf, 0xCu);
    }
  }
  id v9 = IMDRelayLocalMessageTypeRemoteRead;
  id v11 = IMDRelayMessageDictionaryTimeReadKey;
  id v12 = v7;
  id v10 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:&v12 forKeys:&v11 count:1];
  [(IMDRelayServiceController *)self _broadcastMessageEventWithCommand:102 eventName:v9 forGUID:v6 messageExtras:v10];
}

- (void)messageFailedToSend:(id)a3
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    BOOL v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "RELAY: Going to Tell all my clients that message with GUID %@ has failed to send", (uint8_t *)&v6, 0xCu);
    }
  }
  [(IMDRelayServiceController *)self _broadcastMessageEventWithCommand:149 eventName:IMDRelayLocalMessageTypeError forGUID:v4];
}

- (void)_broadcastMessageEventWithCommand:(int64_t)a3 eventName:(id)a4 forGUID:(id)a5
{
}

- (void)_broadcastMessageEventWithCommand:(int64_t)a3 eventName:(id)a4 forGUID:(id)a5 messageExtras:(id)a6
{
  id v10 = (void *)MEMORY[0x1E4F6E660];
  id v11 = a6;
  id v12 = a5;
  id v13 = a4;
  id v14 = [v10 myCTPhoneNumber];
  [(IMDRelayServiceController *)self _broadcastMessageEventWithCommand:a3 eventName:v13 forGUID:v12 messageExtras:v11 shouldFilterRecipients:1 forcedCallerID:v14];
}

- (void)_broadcastMessageEventWithCommand:(int64_t)a3 eventName:(id)a4 forGUID:(id)a5 messageExtras:(id)a6 shouldFilterRecipients:(BOOL)a7 forcedCallerID:(id)a8
{
  BOOL v31 = a7;
  id v33 = a5;
  id v12 = a6;
  id v13 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v29 = a8;
  id v30 = a4;
  id v14 = objc_alloc_init(v13);
  [v14 setObject:v33 forKeyedSubscript:IMDRelayMessageDictionaryGUIDKey];
  if (v12) {
    [v14 addEntriesFromDictionary:v12];
  }
  uint64_t v28 = JWEncodeDictionary();
  uint64_t v15 = (void *)[v28 _FTCopyGzippedData];
  uint64_t v26 = (void *)MEMORY[0x1E4F1CA60];
  uint64_t v25 = *MEMORY[0x1E4F6AA18];
  uint64_t v16 = *MEMORY[0x1E4F6AA00];
  uint64_t v17 = *MEMORY[0x1E4F6A990];
  uint64_t v18 = [NSNumber numberWithInteger:a3];
  uint64_t v19 = *MEMORY[0x1E4F6A978];
  char v20 = IDSGetUUIDData();
  uint64_t v27 = v12;
  uint64_t v21 = *MEMORY[0x1E4F6AA20];
  uint64_t v22 = *MEMORY[0x1E4F6A988];
  int64_t v23 = [NSNumber numberWithDouble:*MEMORY[0x1E4F6B050]];
  int v24 = objc_msgSend(v26, "dictionaryWithObjectsAndKeys:", v25, MEMORY[0x1E4F1CC38], v16, MEMORY[0x1E4F1CC28], v17, v18, v19, v20, v21, v15, v22, v23, *MEMORY[0x1E4F6AA10], 0);

  [(IMDRelayServiceController *)self sendDataToPeers:v24 forcedCallerID:v29 shouldFilterRecepients:v31 requestProxySend:0 dontSendTo:0];
  [(IMDRelayServiceController *)self _forwardMessageEventToLocalPeers:v30 forGUID:v33 metadata:v27];
}

- (void)_forwardMessageEventToLocalPeers:(id)a3 forGUID:(id)a4 metadata:(id)a5
{
  void v19[2] = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  uint64_t v11 = [(IMDRelayServiceController *)self localDevice];
  if (v11)
  {
    id v12 = (void *)v11;
    BOOL v13 = [(IMDRelayServiceController *)self isLocalDeviceProxyRegistered];

    if (!v13)
    {
      id v14 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
      [v14 setObject:v9 forKeyedSubscript:IMDRelayLocalMessageDictionaryGUIDKey];
      if (v10) {
        [v14 addEntriesFromDictionary:v10];
      }
      uint64_t v15 = JWEncodeDictionary();
      uint64_t v16 = (void *)[v15 _FTCopyGzippedData];
      v18[0] = IMDRelayLocalMessageDictionaryDictKey;
      v18[1] = IMDRelayLocalMessageDictionaryTypeKey;
      v19[0] = v16;
      v19[1] = v8;
      uint64_t v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v19 forKeys:v18 count:2];
      [(IMDRelayServiceController *)self sendToLocalPeers:v17];
    }
  }
}

- (BOOL)sendEnrollmentRelatedMessageOverIDS:(id)a3 deviceToSendTo:(id)a4
{
  uint64_t v45 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v32 = a4;
  id v7 = [(IMDRelayServiceController *)self relayService];
  id v30 = [v7 accounts];

  id v29 = [(IMDRelayServiceController *)self retrieveAccountAndPhoneAliasForAccounts:v30 shouldFilterRecepients:0 requestProxySend:0 preferredCallerID:0];
  id v8 = [v29 first];
  id v9 = [v29 second];
  if (v9)
  {
    BOOL v31 = v8;
  }
  else
  {
    id v10 = [v32 linkedUserURIs];
    id v9 = [v10 firstObject];

    uint64_t v11 = [(IMDRelayServiceController *)self relayService];
    id v12 = [v11 accounts];
    BOOL v31 = [(IMDRelayServiceController *)self accountForAlias:v9 fromAccounts:v12];

    if (IMOSLoggingEnabled())
    {
      BOOL v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "This is a non telphony device trying to enroll itself into SMS Relay", buf, 2u);
      }
    }
  }
  id v14 = [(IMDRelayServiceController *)self _destinationForDevice:v32 forcedIdentity:v9];
  Mutable = (__CFDictionary *)[v6 mutableCopy];
  if (!Mutable) {
    Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
  }
  uint64_t v16 = (void *)IDSCopyIDForPhoneNumber();
  if (v16)
  {
    CFDictionarySetValue(Mutable, (const void *)*MEMORY[0x1E4F6A9B8], v16);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1D99036FC();
  }

  uint64_t v17 = Mutable;
  [(IMDRelayServiceController *)self _checkAndSetRelayService];
  uint64_t v18 = (void *)MEMORY[0x1E4F6E7C0];
  uint64_t v19 = [(IMDRelayServiceController *)self relayService];
  char v20 = [MEMORY[0x1E4F1C9E8] dictionary];
  uint64_t v21 = IMSingleObjectArray();
  uint64_t v22 = objc_msgSend(v21, "__imSetFromArray");
  id v33 = 0;
  id v34 = 0;
  int v23 = [v18 service:v19 sendMessage:v20 fromAccount:v31 toDestinations:v22 priority:300 options:v17 identifier:&v34 error:&v33];
  id v24 = v34;
  id v25 = v33;

  if (IMOSLoggingEnabled())
  {
    uint64_t v26 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v26, OS_LOG_TYPE_INFO))
    {
      uint64_t v27 = @"NO";
      *(_DWORD *)buf = 138413314;
      id v36 = v9;
      if (v23) {
        uint64_t v27 = @"YES";
      }
      __int16 v37 = 2112;
      uint64_t v38 = v27;
      __int16 v39 = 2112;
      id v40 = v25;
      __int16 v41 = 2112;
      uint64_t v42 = v31;
      __int16 v43 = 2112;
      id v44 = v24;
      _os_log_impl(&dword_1D967A000, v26, OS_LOG_TYPE_INFO, "SMS relay Enrollment data sent to: %@   success: %@   error: %@   account: %@  identifier %@", buf, 0x34u);
    }
  }
  return v23;
}

- (void)reflectGroupMutation:(id)a3 callerID:(id)a4 didOccurLocally:(BOOL)a5
{
  BOOL v5 = a5;
  void v18[2] = *MEMORY[0x1E4F143B8];
  id v8 = a4;
  id v9 = a3;
  id v10 = [v9 createDictionary];
  uint64_t v11 = JWEncodeDictionary();
  id v12 = (void *)[v11 _FTCopyOptionallyGzippedData];
  v17[0] = @"D";
  v17[1] = @"C";
  v18[0] = v12;
  v18[1] = &unk_1F33C5C70;
  BOOL v13 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v18 forKeys:v17 count:2];
  id v14 = [v9 guid];

  uint64_t v15 = [v14 UUIDString];
  LOWORD(v16) = 0;
  -[IMDRelayServiceController _relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:requiredCapabilities:](self, "_relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:requiredCapabilities:", v13, 190, v15, v8, v5, 0, v16, 0);
}

- (id)_extraOptionsForReachabilityRelayWithRequestID:(id)a3
{
  v9[3] = *MEMORY[0x1E4F143B8];
  uint64_t v3 = *MEMORY[0x1E4F6AA10];
  v8[0] = *MEMORY[0x1E4F6A9A0];
  v8[1] = v3;
  v9[0] = MEMORY[0x1E4F1CC38];
  v9[1] = &unk_1F33C5C88;
  v8[2] = *MEMORY[0x1E4F6A9E8];
  void v9[2] = a3;
  id v4 = (void *)MEMORY[0x1E4F1C9E8];
  id v5 = a3;
  id v6 = [v4 dictionaryWithObjects:v9 forKeys:v8 count:3];

  return v6;
}

- (id)sendReachabilityRequest:(id)a3 requestID:(id)a4
{
  void v20[2] = *MEMORY[0x1E4F143B8];
  id v6 = a4;
  id v7 = a3;
  id v8 = [v7 createDictionary];
  id v9 = JWEncodeDictionary();
  id v10 = (void *)[v9 _FTCopyOptionallyGzippedData];
  v19[0] = @"D";
  v19[1] = @"C";
  v20[0] = v10;
  v20[1] = &unk_1F33C5C28;
  uint64_t v11 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v20 forKeys:v19 count:2];
  id v12 = [v7 context];

  BOOL v13 = [v12 senderLastAddressedHandle];
  id v18 = (id)MEMORY[0x1E4F1CBF0];
  id v14 = [(IMDRelayServiceController *)self _extraOptionsForReachabilityRelayWithRequestID:v6];
  LOWORD(v17) = 0;
  -[IMDRelayServiceController _relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:sentToDevices:extraOptions:requiredCapabilities:](self, "_relayMessageDict:command:messageID:forcedCallerID:didSendSMS:relayToWatchOnly:shouldDisableScreenTimeRestrictions:hasAttachments:sentToDevices:extraOptions:requiredCapabilities:", v11, 190, v6, v13, 0, 0, v17, &v18, v14, 0);

  id v15 = v18;

  return v15;
}

- (void)sendReachabilityResponse:(id)a3 requestID:(id)a4 toToken:(id)a5 toIdentifier:(id)a6 fromIdentifier:(id)a7
{
  v39[2] = *MEMORY[0x1E4F143B8];
  id v11 = a7;
  id v12 = a5;
  id v13 = a4;
  id v35 = [a3 createDictionary];
  id v34 = JWEncodeDictionary();
  v38[0] = @"D";
  v38[1] = @"C";
  id v33 = (void *)[v34 _FTCopyOptionallyGzippedData];
  v39[0] = v33;
  v39[1] = &unk_1F33C5C40;
  id v14 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v39 forKeys:v38 count:2];
  id v15 = [(IMDRelayServiceController *)self _sendOptionsForRelayMessage:v14 command:190 guid:v13];
  uint64_t v16 = (void *)[v15 mutableCopy];

  [v16 setObject:v11 forKeyedSubscript:*MEMORY[0x1E4F6A9B8]];
  uint64_t v17 = [(IMDRelayServiceController *)self _extraOptionsForReachabilityRelayWithRequestID:v13];

  [v16 addEntriesFromDictionary:v17];
  uint64_t v18 = [(IMDRelayServiceController *)self idsDeviceFromPushToken:v12];

  id v32 = (void *)v18;
  uint64_t v19 = [(IMDRelayServiceController *)self _destinationForDevice:v18 forcedIdentity:v11];
  char v20 = [(IMDRelayServiceController *)self relayService];
  uint64_t v21 = [v20 accounts];
  uint64_t v22 = [(IMDRelayServiceController *)self accountForAlias:v11 fromAccounts:v21];

  int v23 = (void *)MEMORY[0x1E4F6E7C0];
  id v24 = [(IMDRelayServiceController *)self relayService];
  id v25 = [MEMORY[0x1E4F1C9E8] dictionary];
  uint64_t v26 = IMSingleObjectArray();
  uint64_t v27 = objc_msgSend(v26, "__imSetFromArray");
  id v36 = 0;
  id v37 = 0;
  char v28 = [v23 service:v24 sendMessage:v25 fromAccount:v22 toDestinations:v27 priority:300 options:v16 identifier:&v37 error:&v36];
  id v29 = v37;
  id v30 = v36;

  if (v30 || (v28 & 1) == 0)
  {
    BOOL v31 = IMLogHandleForCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_ERROR)) {
      sub_1D990380C((uint64_t)v19, v31);
    }
  }
}

+ (IMDRelayServiceController)sharedInstance
{
  if (qword_1EBE2BAC0 != -1) {
    dispatch_once(&qword_1EBE2BAC0, &unk_1F33924E0);
  }
  v2 = (void *)qword_1EBE2BD00;

  return (IMDRelayServiceController *)v2;
}

- (IMDRelayServiceController)init
{
  v10.receiver = self;
  v10.super_class = (Class)IMDRelayServiceController;
  v2 = [(IMDRelayServiceController *)&v10 init];
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v9 = 0;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Setting up Relay service", v9, 2u);
      }
    }
    [(IMDRelayServiceController *)v2 _setupIDSRelayServices];
    [(IMDRelayServiceController *)v2 updateRelayStatus];
    [(IMDRelayServiceController *)v2 _registerForAccountChanges];
    [(IMDRelayServiceController *)v2 _setupMMSObservation];
    id v4 = [[IMDRelayEnrollmentController alloc] initWithServiceDelegate:v2 dispatchDelegate:v2];
    enrollmentController = v2->_enrollmentController;
    v2->_enrollmentController = v4;

    id v6 = objc_alloc_init(IMDRelayDeletionController);
    deletionController = v2->_deletionController;
    v2->_deletionController = v6;
  }
  return v2;
}

- (void)dealloc
{
  if (IMOSLoggingEnabled())
  {
    uint64_t v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Dealloc", buf, 2u);
    }
  }
  [(IMDRelayServiceController *)self _teardownMMSObservation];
  id v4 = [MEMORY[0x1E4F28EB8] defaultCenter];
  [v4 removeObserver:self name:0 object:0];

  v5.receiver = self;
  v5.super_class = (Class)IMDRelayServiceController;
  [(IMDRelayServiceController *)&v5 dealloc];
}

- (NSArray)accounts
{
  [(IMDRelayServiceController *)self _checkAndSetRelayService];
  uint64_t v3 = [(IMDRelayServiceController *)self relayService];
  id v4 = [v3 accounts];

  return (NSArray *)v4;
}

- (IMOneTimeCodeUtilities)otcUtilities
{
  otcUtilities = self->_otcUtilities;
  if (!otcUtilities)
  {
    id v4 = (IMOneTimeCodeUtilities *)objc_alloc_init(MEMORY[0x1E4F6E8D8]);
    objc_super v5 = self->_otcUtilities;
    self->_otcUtilities = v4;

    otcUtilities = self->_otcUtilities;
  }

  return otcUtilities;
}

- (void)updateRelayStatus
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if ([(IMDRelayServiceController *)self hasRelayDevice]) {
    BOOL v3 = [(IMDRelayServiceController *)self _hasPhoneNumberAliasActive];
  }
  else {
    BOOL v3 = 0;
  }
  int v4 = IMGetDomainBoolForKey();
  if (IMOSLoggingEnabled())
  {
    objc_super v5 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      id v6 = @"NO";
      if (v4) {
        id v6 = @"YES";
      }
      int v14 = 138412290;
      id v15 = v6;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Status Of Remote Approval for Relay is %@", (uint8_t *)&v14, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMEventCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      id v8 = @"NO";
      if (v3) {
        id v8 = @"YES";
      }
      int v14 = 138412290;
      id v15 = v8;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Does this device have SMS Relay capable devices on its account? %@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v9 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  objc_super v10 = v9;
  uint64_t v11 = *MEMORY[0x1E4F6BFB8];
  if (!v3)
  {
    [v9 setObject:MEMORY[0x1E4F1CC28] forKey:v11];
    goto LABEL_20;
  }
  [v9 setObject:MEMORY[0x1E4F1CC38] forKey:v11];
  if ((v4 & 1) == 0)
  {
LABEL_20:
    uint64_t v12 = MEMORY[0x1E4F1CC28];
    goto LABEL_21;
  }
  uint64_t v12 = MEMORY[0x1E4F1CC38];
LABEL_21:
  [v10 setObject:v12 forKey:*MEMORY[0x1E4F6BFB0]];
  [v10 setObject:v12 forKey:*MEMORY[0x1E4F6BFA8]];
  id v13 = [(IMDRelayServiceController *)self _account];
  [v13 writeAccountDefaults:v10];

  [(IMDRelayServiceController *)self updateMMSCapability];
}

- (id)_account
{
  v2 = +[IMDAccountController sharedAccountController];
  BOOL v3 = [v2 anySessionForServiceName:*MEMORY[0x1E4F6E1A0]];
  int v4 = [v3 account];

  return v4;
}

- (NSString)_callerIDForRelay
{
  BOOL v3 = [(IMDRelayServiceController *)self _callerIDAccountFromSettings];
  int v4 = [(IMDRelayServiceController *)self _callerIDForRelayAccountID:v3];

  return (NSString *)v4;
}

- (id)_callerIDAccountFromSettings
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = IMPreferredAccountMap();
  if (v2)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v3 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
      {
        int v11 = 138412290;
        uint64_t v12 = v2;
        _os_log_impl(&dword_1D967A000, v3, OS_LOG_TYPE_INFO, "Account Maps Currently Reads  %@", (uint8_t *)&v11, 0xCu);
      }
    }
    int v4 = [v2 objectForKey:*MEMORY[0x1E4F6E1B0]];
    if (v4)
    {
      if (IMOSLoggingEnabled())
      {
        objc_super v5 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412290;
          uint64_t v12 = v4;
          _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "iMessage Account Current reads  %@", (uint8_t *)&v11, 0xCu);
        }
      }
      id v6 = [v4 objectForKey:@"guid"];
      if (IMOSLoggingEnabled())
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v11 = 138412290;
          uint64_t v12 = v6;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "iMessage Caller ID Guid reads  %@", (uint8_t *)&v11, 0xCu);
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
          _os_log_impl(&dword_1D967A000, v9, OS_LOG_TYPE_INFO, "Unable to locate CallerID Account in Prefered Account Map", (uint8_t *)&v11, 2u);
        }
      }
    }
    else
    {
      id v6 = 0;
    }
  }
  else
  {
    id v6 = 0;
  }

  return v6;
}

- (BOOL)_canRelayMMS
{
  v2 = [(IMDRelayServiceController *)self _account];
  BOOL v3 = [v2 accountDefaults];
  int v4 = [v3 objectForKeyedSubscript:*MEMORY[0x1E4F6BFA8]];
  char v5 = [v4 BOOLValue];

  return v5;
}

- (BOOL)_localDeviceSupportsSMS
{
  uint64_t v8 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    v2 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
    {
      int v3 = IMSMSEnabled();
      int v4 = @"NO";
      if (v3) {
        int v4 = @"YES";
      }
      int v6 = 138412290;
      id v7 = v4;
      _os_log_impl(&dword_1D967A000, v2, OS_LOG_TYPE_INFO, "isSMSEnabled %@", (uint8_t *)&v6, 0xCu);
    }
  }
  return IMSMSEnabled();
}

- (BOOL)_localDeviceSupportsSMSAndHasAPhoneNumber
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6E660] myCTPhoneNumber];
  uint64_t v3 = [v2 length];

  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = IMSMSEnabled();
      int v6 = @"NO";
      if (v5) {
        id v7 = @"YES";
      }
      else {
        id v7 = @"NO";
      }
      if (v3) {
        int v6 = @"YES";
      }
      int v9 = 138412546;
      objc_super v10 = v7;
      __int16 v11 = 2112;
      uint64_t v12 = v6;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "isSMSEnabled %@ Has valid Phone Number %@", (uint8_t *)&v9, 0x16u);
    }
  }
  return (v3 != 0) & IMSMSEnabled();
}

- (BOOL)_localDeviceSupportsSMSAndDoesNotHaveAPhoneNumberForSIMID:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    int v4 = [MEMORY[0x1E4F6E668] sharedInstance];
    int v5 = [v4 ctSubscriptionInfo];
    int v6 = objc_msgSend(v5, "__im_subscriptionContextForForSimID:", v3);

    if (v6)
    {
      id v7 = [v6 phoneNumber];
      BOOL v8 = [v7 length] == 0;
    }
    else
    {
      BOOL v8 = 0;
    }
  }
  else
  {
    int v6 = [MEMORY[0x1E4F6E660] myCTPhoneNumber];
    BOOL v8 = [v6 length] == 0;
  }

  int v9 = IMSMSEnabled();
  if (IMOSLoggingEnabled())
  {
    objc_super v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      __int16 v11 = @"NO";
      if (v9) {
        uint64_t v12 = @"YES";
      }
      else {
        uint64_t v12 = @"NO";
      }
      if (v8) {
        __int16 v11 = @"YES";
      }
      int v14 = 138412546;
      id v15 = v12;
      __int16 v16 = 2112;
      uint64_t v17 = v11;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "isSMSEnabled %@ Does not have phone number to send with %@", (uint8_t *)&v14, 0x16u);
    }
  }
  return v9 & v8;
}

- (id)_IDSService
{
  [(IMDRelayServiceController *)self _checkAndSetRelayService];

  return [(IMDRelayServiceController *)self relayService];
}

- (void)_prepareSMSRelayBlockForMessageDictionary:(id)a3 messageGUID:(id)a4 serviceName:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  id location = 0;
  objc_initWeak(&location, self);
  uint64_t v14 = MEMORY[0x1E4F143A8];
  uint64_t v15 = 3221225472;
  __int16 v16 = sub_1D987937C;
  uint64_t v17 = &unk_1E6B78568;
  id v11 = v8;
  id v18 = v11;
  objc_copyWeak(&v20, &location);
  id v12 = v10;
  id v19 = v12;
  uint64_t v13 = _Block_copy(&v14);
  -[IMDRelayServiceController _storeSMSRelayExecutionBlock:forMessageGUID:](self, "_storeSMSRelayExecutionBlock:forMessageGUID:", v13, v9, v14, v15, v16, v17);

  objc_destroyWeak(&v20);
  objc_destroyWeak(&location);
}

- (BOOL)_storeSMSRelayExecutionBlock:(id)a3 forMessageGUID:(id)a4
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  uint64_t v8 = [v7 length];
  if (v6) {
    BOOL v9 = v8 == 0;
  }
  else {
    BOOL v9 = 1;
  }
  BOOL v10 = !v9;
  if (!v9)
  {
    id v11 = [(NSMutableDictionary *)self->_smsRelayBlockMap objectForKey:v7];
    if (v11 && IMOSLoggingEnabled())
    {
      id v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        int v21 = 138412546;
        id v22 = v7;
        __int16 v23 = 2112;
        id v24 = v11;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "Using existing spam relay mapping from %@ to %@", (uint8_t *)&v21, 0x16u);
      }
    }
    smsRelayBlockMap = self->_smsRelayBlockMap;
    if (!smsRelayBlockMap)
    {
      CFMutableDictionaryRef Mutable = CFDictionaryCreateMutable(0, 0, MEMORY[0x1E4F1D530], MEMORY[0x1E4F1D540]);
      __int16 v16 = self->_smsRelayBlockMap;
      p_smsRelayBlockMap = &self->_smsRelayBlockMap;
      *p_smsRelayBlockMap = (NSMutableDictionary *)Mutable;

      smsRelayBlockMap = *p_smsRelayBlockMap;
    }
    uint64_t v17 = (void *)[v6 copy];
    [(NSMutableDictionary *)smsRelayBlockMap setObject:v17 forKey:v7];

    if (IMOSLoggingEnabled())
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        id v19 = _Block_copy(v6);
        int v21 = 138412546;
        id v22 = v7;
        __int16 v23 = 2112;
        id v24 = v19;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Generated mapping spam relay from %@ to %@", (uint8_t *)&v21, 0x16u);
      }
    }
LABEL_23:

    goto LABEL_24;
  }
  if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      LOWORD(v21) = 0;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Cannot store spam relay completion block for guid as either guid or completion block is invalid", (uint8_t *)&v21, 2u);
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
  uint64_t v14 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  uint64_t v9 = [(NSMutableDictionary *)self->_smsRelayBlockMap objectForKey:v8];
  BOOL v10 = (void *)v9;
  if (v9)
  {
    (*(void (**)(uint64_t, int64_t, int64_t))(v9 + 16))(v9, a4, a5);
    [(IMDRelayServiceController *)self _clearSMSRelayMapForMessageWithGUID:v8];
  }
  else if (IMOSLoggingEnabled())
  {
    id v11 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
    {
      int v12 = 138412290;
      id v13 = v8;
      _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "_executeSpamRelayCompletionBlockForMessageGuid: %@ Already ran completion block?, not doing anything", (uint8_t *)&v12, 0xCu);
    }
  }
}

- (void)_clearSMSRelayMapForMessageWithGUID:(id)a3
{
  uint64_t v9 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      int v7 = 138412290;
      id v8 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Clearing SMS relay block mapping for %@", (uint8_t *)&v7, 0xCu);
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

- (void)didReceiveMessageError:(id)a3
{
  id v11 = a3;
  id v3 = +[IMDMessageStore sharedInstance];
  id v4 = [v3 itemWithGUID:v11];

  int v5 = [v4 service];
  id v6 = [v4 accountID];
  int v7 = +[IMDAccountController sharedInstance];
  id v8 = [v7 accountForAccountID:v6];

  uint64_t v9 = [v8 session];
  if (!v9)
  {
    BOOL v10 = +[IMDAccountController sharedInstance];
    uint64_t v9 = [v10 anySessionForServiceName:v5];
  }
  [v9 didReceiveError:4 forMessageID:v11 forceError:0];
}

+ (id)_convertIMMessageItemToIncomingRelayDictionary:(id)a3 chat:(id)a4 overridingAttachmentData:(id)a5
{
  uint64_t v75 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  id v61 = a4;
  id v56 = a5;
  id v8 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  [v8 setObject:@"1" forKeyedSubscript:IMDCTMessageDictionaryVersionKey];
  uint64_t v9 = [v7 guid];
  [v8 setObject:v9 forKeyedSubscript:IMDCTMessageDictionaryGUIDKey];

  BOOL v10 = [v7 subject];
  [v8 setObject:v10 forKeyedSubscript:IMDCTMessageDictionarySubjectKey];

  id v11 = [v7 sender];
  [v8 setObject:v11 forKeyedSubscript:IMDCTMessageDictionarySenderKey];

  int v12 = [v7 time];
  [v8 setObject:v12 forKeyedSubscript:IMDCTMessageDictionaryDateKey];

  id v13 = [v61 serviceName];
  [v8 setObject:v13 forKeyedSubscript:IMDRelayMessageItemDictionaryServiceKey];

  [v8 setObject:IMDCTMessageDictionaryTypeSMS forKeyedSubscript:IMDCTMessageDictionaryTypeKey];
  uint64_t v14 = [v61 participants];
  uint64_t v15 = +[IMDRelayServiceController _convertIMDHandlesToArrayOfIDs:v14];
  [v8 setObject:v15 forKeyedSubscript:IMDCTMessageDictionaryReceipientsKey];

  __int16 v16 = [MEMORY[0x1E4F6E660] myCTPhoneNumber];
  id v59 = [v7 context];
  uint64_t v17 = [MEMORY[0x1E4F6E668] sharedInstance];
  v58 = [v17 ctSubscriptionInfo];

  if (v59 && v58)
  {
    v60 = objc_msgSend(v58, "__im_subscriptionContextOrDefaultForForSlotID:", objc_msgSend(v59, "slotID"));
  }
  else
  {
    if (!v58
      || ([v58 subscriptions],
          id v18 = objc_claimAutoreleasedReturnValue(),
          uint64_t v19 = [v18 count],
          v18,
          !v19))
    {
      v60 = 0;
      BOOL v57 = 0;
      uint64_t v26 = v16;
      goto LABEL_15;
    }
    id v20 = [v58 subscriptions];
    v60 = [v20 objectAtIndexedSubscript:0];
  }
  if (v60)
  {
    if (IMOSLoggingEnabled())
    {
      int v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        id v22 = [v60 phoneNumber];
        id v23 = [v60 labelID];
        id v24 = objc_msgSend(NSNumber, "numberWithInteger:", objc_msgSend(v59, "slotID"));
        *(_DWORD *)buf = 138413058;
        uint64_t v68 = v60;
        __int16 v69 = 2112;
        id v70 = v22;
        __int16 v71 = 2112;
        id v72 = v23;
        __int16 v73 = 2112;
        v74 = v24;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Setting receiving context = %@, phoneNumber = %@, simID = %@ for given slotID %@", buf, 0x2Au);
      }
    }
    uint64_t v25 = [v60 phoneNumber];

    BOOL v57 = [v60 labelID];
    uint64_t v26 = (void *)v25;
  }
  else
  {
    uint64_t v26 = v16;
    v60 = 0;
    BOOL v57 = 0;
  }
LABEL_15:
  id v54 = v26;
  objc_msgSend(v8, "setObject:forKeyedSubscript:");
  [v8 setObject:v57 forKeyedSubscript:IMDCTMessageDictionaryOriginatedDeviceSIMKey];
  uint64_t v27 = objc_msgSend(NSNumber, "numberWithLongLong:", objc_msgSend(v7, "replaceID"));
  [v8 setObject:v27 forKeyedSubscript:IMDCTMessageDictionaryReplaceMessageKey];

  [v8 setObject:MEMORY[0x1E4F1CC38] forKeyedSubscript:IMDCTMessageDictionarySendEnabledKey];
  char v28 = [v61 groupID];

  if (v28)
  {
    id v29 = [v61 groupID];
    [v8 setObject:v29 forKeyedSubscript:IMDRelayMessageDictionaryChatGroupIDKey];
  }
  id v30 = [v61 originalGroupID];

  if (v30)
  {
    BOOL v31 = [v61 originalGroupID];
    [v8 setObject:v31 forKeyedSubscript:IMDRelayMessageDictionaryChatOriginalGroupID];
  }
  id v32 = [v61 displayName];

  if (v32)
  {
    id v33 = [v61 displayName];
    [v8 setObject:v33 forKeyedSubscript:IMDRelayMessageDictionaryChatDisplayNameKey];
  }
  else
  {
    if (![v61 isChatBot]) {
      goto LABEL_24;
    }
    id v33 = [v61 businessName];
    [v8 setObject:v33 forKeyedSubscript:IMDRelayMessageDictionaryChatDisplayNameKey];
    [v8 setObject:MEMORY[0x1E4F1CC28] forKeyedSubscript:IMDCTMessageDictionarySendEnabledKey];
  }

LABEL_24:
  id v34 = +[IMDServiceController sharedController];
  id v35 = [v7 service];
  v55 = [v34 serviceWithName:v35];

  id v36 = +[IMDRelayUtilities relayPartsFor:v7 overridingAttachmentData:v56];
  if (v36)
  {
    [v8 setObject:v36 forKeyedSubscript:IMDCTMessageDictionaryItemsKey];
    if ([v55 fallbackHashIsContentBased])
    {
      id v37 = [MEMORY[0x1E4F28E78] stringWithFormat:@"s:tel:%@", v54];
      long long v64 = 0u;
      long long v65 = 0u;
      long long v62 = 0u;
      long long v63 = 0u;
      id v38 = v36;
      uint64_t v39 = [v38 countByEnumeratingWithState:&v62 objects:v66 count:16];
      if (v39)
      {
        uint64_t v40 = *(void *)v63;
        do
        {
          for (uint64_t i = 0; i != v39; ++i)
          {
            if (*(void *)v63 != v40) {
              objc_enumerationMutation(v38);
            }
            uint64_t v42 = +[IMDXMSUtilities calculateFallbackHashFragmentFor:*(void *)(*((void *)&v62 + 1) + 8 * i)];
            [v37 appendString:v42];
          }
          uint64_t v39 = [v38 countByEnumeratingWithState:&v62 objects:v66 count:16];
        }
        while (v39);
      }

      __int16 v43 = (void *)[v37 copy];
      [v8 setObject:v43 forKeyedSubscript:IMDCTMessageDictionaryFallbackHashKey];
    }
    else
    {
      id v37 = [v7 fallbackHash];
      [v8 setObject:v37 forKeyedSubscript:IMDCTMessageDictionaryFallbackHashKey];
    }

    [v8 setObject:&unk_1F33C5F28 forKeyedSubscript:IMDRelaySpamSubCategoryKey];
    uint64_t v46 = [v7 criticalMessagingAppName];
    if (v46) {
      [v8 setObject:v46 forKeyedSubscript:IMDRelayMessageDictionaryCriticalMessagingAppNameKey];
    }
    uint64_t v47 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
    int v48 = [v47 isSMSFilterSyncEnabled];

    if (v48)
    {
      uint64_t v49 = +[IMDFilteringController sharedInstance];
      unsigned int v50 = [v49 _isSpamFilteringEnabled];

      v51 = +[IMDFilteringController sharedInstance];
      int v52 = (void *)[v51 _newSMSFilteringSettingsDictForFilterState:v50];
      [v8 addEntriesFromDictionary:v52];
    }
    id v45 = v8;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      id v44 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v44, OS_LOG_TYPE_INFO, "No compatible item(s) found to relay!", buf, 2u);
      }
    }
    id v45 = 0;
  }

  return v45;
}

+ (id)_convertIMMessageItemToOutgoingRelayDictionary:(id)a3 chat:(id)a4
{
  uint64_t v49 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v47) = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Converting IM Message to NSDictionary", (uint8_t *)&v47, 2u);
    }
  }
  id v8 = (__CFDictionary *)objc_alloc_init(MEMORY[0x1E4F1CA60]);
  CFDictionarySetValue(v8, IMDCTMessageDictionaryVersionKey, @"1");
  uint64_t v9 = [v5 handle];
  if (v9)
  {
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryHandleKey, v9);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1D9905F48();
  }

  BOOL v10 = [v5 service];
  if (v10)
  {
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryServiceKey, v10);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1D9905EC0();
  }

  id v11 = [v5 guid];
  if (v11)
  {
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryGUIDKey, v11);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1D9905E38();
  }

  int v12 = [(__CFDictionary *)v8 objectForKey:IMDRelayMessageItemDictionaryHandleKey];
  if (v12
    || ([(__CFDictionary *)v8 objectForKey:IMDRelayMessageItemDictionaryServiceKey],
        (int v12 = objc_claimAutoreleasedReturnValue()) != 0))
  {
  }
  else
  {
    id v45 = [(__CFDictionary *)v8 objectForKey:IMDRelayMessageItemDictionaryGUIDKey];
    BOOL v46 = v45 == 0;

    if (v46)
    {
      __int16 v43 = 0;
      goto LABEL_73;
    }
  }
  id v13 = [v5 body];
  uint64_t v14 = [v13 string];

  if (v14) {
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryPlainBodyKey, v14);
  }

  uint64_t v15 = [v5 subject];
  if (v15) {
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionarySubjectKey, v15);
  }

  __int16 v16 = [v5 replyToGUID];
  if (v16) {
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryReplyToGUIDKey, v16);
  }

  uint64_t v17 = [v5 time];
  if (v17) {
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryDateKey, v17);
  }

  if ([v5 isAudioMessage]) {
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryIsAudioMessageKey, MEMORY[0x1E4F1CC38]);
  }
  id v18 = [v6 groupID];

  if (v18)
  {
    uint64_t v19 = [v6 groupID];
    [(__CFDictionary *)v8 setObject:v19 forKeyedSubscript:IMDRelayMessageDictionaryChatGroupIDKey];
  }
  id v20 = [v6 originalGroupID];

  if (v20)
  {
    int v21 = [v6 originalGroupID];
    [(__CFDictionary *)v8 setObject:v21 forKeyedSubscript:IMDRelayMessageDictionaryChatOriginalGroupID];
  }
  id v22 = [v6 displayName];

  if (v22)
  {
    id v23 = [v6 displayName];
    [(__CFDictionary *)v8 setObject:v23 forKeyedSubscript:IMDRelayMessageDictionaryChatDisplayNameKey];
  }
  if (IMOSLoggingEnabled())
  {
    id v24 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v24, OS_LOG_TYPE_INFO))
    {
      LOWORD(v47) = 0;
      _os_log_impl(&dword_1D967A000, v24, OS_LOG_TYPE_INFO, "Starting parse", (uint8_t *)&v47, 2u);
    }
  }
  uint64_t v25 = [IMDSuperToRelayMessageParser alloc];
  uint64_t v26 = [v5 body];
  uint64_t v27 = [(IMDSuperToRelayMessageParser *)v25 initWithAttributedString:v26];

  char v28 = [MEMORY[0x1E4F6E5F8] sharedInstance];
  [v28 parseContext:v27];

  if (IMOSLoggingEnabled())
  {
    id v29 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
    {
      LOWORD(v47) = 0;
      _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Done parse", (uint8_t *)&v47, 2u);
    }
  }
  id v30 = [v5 body];
  BOOL v31 = [v30 string];

  if (IMOSLoggingEnabled())
  {
    id v32 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
    {
      MarcoLoggingStringForMessageData();
      id v33 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v47 = 138412290;
      int v48 = v33;
      _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Plain: %@", (uint8_t *)&v47, 0xCu);
    }
  }
  id v34 = [(IMDSuperToRelayMessageParser *)v27 outHTML];
  if (IMOSLoggingEnabled())
  {
    id v35 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
    {
      MarcoLoggingStringForMessageData();
      id v36 = (__CFString *)objc_claimAutoreleasedReturnValue();
      int v47 = 138412290;
      int v48 = v36;
      _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "messageString: %@", (uint8_t *)&v47, 0xCu);
    }
  }
  if ([(IMDSuperToRelayMessageParser *)v27 isSimpleString])
  {
    int v37 = 0;
  }
  else
  {
    id v38 = [v5 body];
    if ([v38 length]) {
      BOOL v39 = v31 == 0;
    }
    else {
      BOOL v39 = 1;
    }
    int v37 = !v39;
  }
  if (IMOSLoggingEnabled())
  {
    uint64_t v40 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
    {
      __int16 v41 = @"NO";
      if (v37) {
        __int16 v41 = @"YES";
      }
      int v47 = 138412290;
      int v48 = v41;
      _os_log_impl(&dword_1D967A000, v40, OS_LOG_TYPE_INFO, "sendXMLVersion: %@", (uint8_t *)&v47, 0xCu);
    }
  }
  if (v34) {
    int v42 = v37;
  }
  else {
    int v42 = 0;
  }
  if (v42 == 1) {
    CFDictionarySetValue(v8, IMDRelayMessageItemDictionaryXHTMLKey, v34);
  }
  __int16 v43 = v8;

LABEL_73:

  return v43;
}

+ (id)_convertIMMessageItemDictionaryToIMMessageItem:(id)a3 timestamp:(id)a4
{
  uint64_t v38 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  id v6 = a4;
  if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      LOWORD(v34) = 0;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Converting Dictionary to IM Message", (uint8_t *)&v34, 2u);
    }
  }
  id v8 = objc_alloc_init(MEMORY[0x1E4F6E850]);
  uint64_t v9 = [v5 objectForKey:IMDRelayMessageItemDictionaryHandleKey];
  [v8 setHandle:v9];

  BOOL v10 = [v5 objectForKey:IMDRelayMessageItemDictionaryServiceKey];
  [v8 setService:v10];

  id v11 = [v5 objectForKey:IMDRelayMessageItemDictionaryGUIDKey];
  [v8 setGuid:v11];

  int v12 = [v5 objectForKey:IMDRelayMessageItemDictionaryGUIDKey];
  [v8 setGuid:v12];

  id v13 = [v5 objectForKey:IMDRelayMessageItemDictionaryDateKey];
  if (v13)
  {
    [v8 setTime:v13];
  }
  else
  {
    uint64_t v14 = _MessageDateFromTimeStamp(v6);
    [v8 setTime:v14];
  }
  uint64_t v15 = [v5 objectForKey:IMDRelayMessageItemDictionaryIsAudioMessageKey];

  if (v15) {
    uint64_t v16 = 2097157;
  }
  else {
    uint64_t v16 = 5;
  }
  [v8 setFlags:v16];
  uint64_t v17 = [v5 objectForKey:IMDRelayMessageItemDictionaryPlainBodyKey];

  if (v17)
  {
    id v18 = [v5 objectForKey:IMDRelayMessageItemDictionaryPlainBodyKey];
    [v8 setPlainBody:v18];
  }
  uint64_t v19 = [v5 objectForKey:IMDRelayMessageItemDictionarySubjectKey];

  if (v19)
  {
    id v20 = [v5 objectForKey:IMDRelayMessageItemDictionarySubjectKey];
    [v8 setSubject:v20];
  }
  int v21 = [v5 objectForKey:IMDRelayMessageItemDictionaryXHTMLKey];

  if (v21)
  {
    id v22 = [IMDRelayMessageToSuperParser alloc];
    id v23 = [v5 objectForKey:IMDRelayMessageItemDictionaryXHTMLKey];
    id v24 = [(IMXMLParserContext *)v22 initWithContent:v23];

    uint64_t v25 = [MEMORY[0x1E4F6EAE0] sharedInstance];
    [v25 parseContext:v24];

    uint64_t v26 = [(IMToSuperParserContext *)v24 body];
    [v8 setBody:v26];
    uint64_t v27 = [(IMToSuperParserContext *)v24 fileTransferGUIDs];
    [v8 setFileTransferGUIDs:v27];

    if (IMOSLoggingEnabled())
    {
      char v28 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
      {
        id v29 = [v26 string];
        MarcoLoggingStringForMessageData();
        id v30 = (id)objc_claimAutoreleasedReturnValue();
        BOOL v31 = [v8 fileTransferGUIDs];
        int v34 = 138412546;
        id v35 = v30;
        __int16 v36 = 2112;
        int v37 = v31;
        _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "      xhtml parsed body: %@  file tranfer GUIDs: %@", (uint8_t *)&v34, 0x16u);
      }
    }
  }
  id v32 = [v5 objectForKey:IMDRelayMessageItemDictionaryReplyToGUIDKey];
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0 && [v32 length]) {
    [v8 setReplyToGUID:v32];
  }

  return v8;
}

+ (id)_updateServiceOfMessageInMessageDict:(id)a3 toService:(id)a4
{
  id v5 = a4;
  id v6 = (objc_class *)MEMORY[0x1E4F1CA60];
  id v7 = a3;
  id v8 = (void *)[[v6 alloc] initWithDictionary:v7];

  id v9 = objc_alloc(MEMORY[0x1E4F1CA60]);
  BOOL v10 = [v8 objectForKey:IMDRelayMessageItemDictionary];
  id v11 = (__CFDictionary *)[v9 initWithDictionary:v10];

  id v12 = v5;
  if (v12)
  {
    CFDictionarySetValue(v11, IMDRelayMessageItemDictionaryServiceKey, v12);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1D9905FD0();
  }

  id v13 = v11;
  if (v13)
  {
    CFDictionarySetValue((CFMutableDictionaryRef)v8, IMDRelayMessageItemDictionary, v13);
  }
  else if (os_log_type_enabled(MEMORY[0x1E4F14500], OS_LOG_TYPE_ERROR))
  {
    sub_1D9903784();
  }

  return v8;
}

+ (id)_convertIMDHandleToDictionary:(id)a3
{
  id v3 = (void *)MEMORY[0x1E4F1C9E8];
  id v4 = a3;
  id v5 = [v4 ID];
  id v6 = IMDRelayMessageDictionaryRecipientIDKey;
  id v7 = [v4 unformattedID];
  id v8 = IMDRelayMessageDictionaryRecipientUnformatedIDKey;
  id v9 = [v4 countryCode];

  BOOL v10 = objc_msgSend(v3, "dictionaryWithObjectsAndKeys:", v5, v6, v7, v8, v9, IMDCTMessageDictionaryCountryCodeKey, 0);

  return v10;
}

+ (id)_convertIMDHandlesToArray:(id)a3
{
  v5[0] = MEMORY[0x1E4F143A8];
  v5[1] = 3221225472;
  v5[2] = sub_1D987B260;
  v5[3] = &unk_1E6B78588;
  v5[4] = a1;
  id v3 = objc_msgSend(a3, "__imArrayByApplyingBlock:", v5);

  return v3;
}

+ (id)_convertIMDHandlesToArrayOfIDs:(id)a3
{
  return (id)[a3 arrayByApplyingSelector:sel_ID];
}

- (IMDRelayEnrollmentController)enrollmentController
{
  return self->_enrollmentController;
}

- (NSMutableDictionary)smsRelayBlockMap
{
  return self->_smsRelayBlockMap;
}

- (void)setSmsRelayBlockMap:(id)a3
{
}

- (IMDRelayDeletionController)deletionController
{
  return self->_deletionController;
}

- (IDSService)relayService
{
  return self->_relayService;
}

- (void)setRelayService:(id)a3
{
}

- (IDSService)smsRelayService
{
  return self->_smsRelayService;
}

- (void)setSmsRelayService:(id)a3
{
}

- (IDSService)smsWatchService
{
  return self->_smsWatchService;
}

- (void)setSmsWatchService:(id)a3
{
}

- (BOOL)isRegistered
{
  return self->_isRegistered;
}

- (void)setIsRegistered:(BOOL)a3
{
  self->_isRegistered = a3;
}

- (IMDRelayPushHandler)smsRelayPushHandler
{
  return self->_smsRelayPushHandler;
}

- (void)setSmsRelayPushHandler:(id)a3
{
}

- (void)setOtcUtilities:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_otcUtilities, 0);
  objc_storeStrong((id *)&self->_smsRelayPushHandler, 0);
  objc_storeStrong((id *)&self->_smsWatchService, 0);
  objc_storeStrong((id *)&self->_smsRelayService, 0);
  objc_storeStrong((id *)&self->_relayService, 0);
  objc_storeStrong((id *)&self->_deletionController, 0);
  objc_storeStrong((id *)&self->_smsRelayBlockMap, 0);

  objc_storeStrong((id *)&self->_enrollmentController, 0);
}

@end