@interface SMSServiceSession
- (BOOL)_isActiveServiceForRelay;
- (BOOL)_messageDowngradesWhenSentFromCurrentService:(id)a3;
- (BOOL)_sendMessageOverAlternatePath:(id)a3 toChat:(id)a4;
- (BOOL)_shouldFailSMSMessageForTesting:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5;
- (BOOL)allowedToSendMessage:(id)a3 toChat:(id)a4;
- (BOOL)isValidMMS:(id)a3;
- (BOOL)replicationRequiredForFeaturesUsedByMessageItem:(id)a3;
- (BOOL)replicationRequirementsSatisfiedForPhoneNumber:(id)a3 simID:(id)a4;
- (BOOL)shouldExcludeChatFromRelay:(id)a3;
- (BOOL)shouldFixIncomingDate;
- (NSMutableDictionary)outgoingMessageBlockMap;
- (NSMutableDictionary)outgoingMessageFailureMap;
- (NSMutableDictionary)outgoingMessageMap;
- (SMSServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5;
- (id)_chatForSendingMessageItem:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5;
- (id)_completionBlockForMessageGUID:(id)a3;
- (id)_convertCTMessagePartToDictionary:(id)a3;
- (id)_convertCTMessageToDictionary:(id)a3 requiresUpload:(BOOL *)a4;
- (id)_failureBlockForMessageGUID:(id)a3;
- (id)_fixIncomingDate:(id)a3;
- (id)_getStorageDictionaryUsingMsgDict:(id)a3 requiresUpload:(BOOL)a4;
- (id)_messageGUIDForMessageID:(int)a3;
- (id)lastAddressedHandleForJunkReportMessageItem:(id)a3;
- (id)lastAddressedSIMIDForJunkReportMessageItem:(id)a3;
- (id)makeSenderFor:(id)a3 forChat:(id)a4 chatStyle:(unsigned __int8)a5 recipients:(id)a6;
- (id)newTelephonyMessagesForHandles:(id)a3 shouldBroadcastMessage:(BOOL)a4;
- (id)replicationPhoneNumbers;
- (int64_t)maxSizePerAttachmentWithCount:(int)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5;
- (uint64_t)calculateReachabilityWithRequest:(void *)a3 responseHandler:(uint64_t)a4;
- (unint64_t)_sendingDecisionForMessageItem:(id)a3 callerID:(id)a4 chat:(id)a5;
- (unint64_t)maxRecipientsForPhoneNumber:(id)a3 simID:(id)a4;
- (unsigned)_generateMessageIDForMessageGUID:(id)a3;
- (void)_buildCTPhoneNumberWithParticipantInfo:(id)a3 ctMessage:(id)a4;
- (void)_clearMapForMessageGUID:(id)a3;
- (void)_clearPendingIncomingMessageQueue;
- (void)_doDeleteChat:(id)a3;
- (void)_joinOneToOneChatWithChatIdentifier:(id)a3;
- (void)_processMessageSendFailureID:(unsigned int)a3;
- (void)_processMessageSentID:(unsigned int)a3;
- (void)_processMessagesForRelayIfNeeded;
- (void)_processSMSOrSMSMessageSentWithContext:(id)a3 success:(BOOL)a4 messageID:(unsigned int)a5 err1:(int64_t)a6 err2:(int64_t)a7 isSMS:(BOOL)a8;
- (void)_processSMSorMMSMessageReceivedWithContext:(id)a3 messageID:(int64_t)a4;
- (void)_receivedSMSDictionary:(id)a3 requiresUpload:(BOOL)a4 isBeingReplayed:(BOOL)a5;
- (void)_registerForIncomingMessages:(id)a3;
- (void)_registerMessageGUID:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5;
- (void)_setContentIDAndLocationForSMILPart:(id)a3 messageGUID:(id)a4 isGroupChat:(BOOL)a5 phoneNumber:(id)a6 simID:(id)a7;
- (void)addMessagePlainTextToTelephonyMessages:(id)a3 messageItem:(id)a4 processedMessageItem:(id)a5;
- (void)buildTelephonyPhoneNumbersForTelephonyMessages:(id)a3 shouldBroadcastMessage:(BOOL)a4 handles:(id)a5;
- (void)dealloc;
- (void)didReceiveError:(unsigned int)a3 forMessageID:(id)a4 forceError:(BOOL)a5 account:(id)a6;
- (void)enqueReplayMessageCallback:(id)a3;
- (void)invitePersonInfo:(id)a3 withMessage:(id)a4 toChat:(id)a5 style:(unsigned __int8)a6;
- (void)leaveChat:(id)a3 style:(unsigned __int8)a4;
- (void)mmsMessageReceived:(id)a3 msgID:(int64_t)a4;
- (void)networkMonitorDidUpdate:(id)a3;
- (void)postMMSMessageSent:(id)a3 success:(BOOL)a4 messageID:(int64_t)a5 err1:(int64_t)a6 err2:(int64_t)a7;
- (void)postSMSMessageSent:(id)a3 success:(BOOL)a4 messageID:(int64_t)a5 err1:(int64_t)a6 err2:(int64_t)a7;
- (void)processPartsOfTelephonyMessages:(id)a3 parts:(id)a4 messageItem:(id)a5 isGroupChat:(BOOL)a6 phoneNumber:(id)a7 simID:(id)a8;
- (void)refreshServiceCapabilities;
- (void)replayMessage:(id)a3;
- (void)sendDeliveredQuietlyReceiptForMessage:(id)a3 forIncomingMessageFromIDSID:(id)a4 toChatGuid:(id)a5 identifier:(id)a6 style:(unsigned __int8)a7 withWillSendToDestinationsHandler:(id)a8;
- (void)sendDeliveryReceiptForMessageID:(id)a3 toID:(id)a4 deliveryContext:(id)a5 needsDeliveryReceipt:(id)a6 callerID:(id)a7 account:(id)a8;
- (void)sendJunkReportMessage:(id)a3;
- (void)sendNotifyRecipientCommandForMessage:(id)a3 toChatGuid:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendPlayedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 reflectOnly:(BOOL)a7;
- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6;
- (void)sendSyndicationAction:(id)a3 toChatsWithIdentifiers:(id)a4;
- (void)sendTelephonyMessageFromJunkReportMessageItem:(id)a3;
- (void)sendUpdatedCollaborationMetadata:(id)a3 toChatsWithIdentifiers:(id)a4 forMessageGUID:(id)a5;
- (void)sessionDidBecomeActive;
- (void)sessionWillBecomeInactiveWithAccount:(id)a3;
- (void)setMessageTypeForTelephonyMessage:(id)a3 shouldSendMMS:(BOOL)a4;
- (void)setOutgoingMessageBlockMap:(id)a3;
- (void)setOutgoingMessageFailureMap:(id)a3;
- (void)setOutgoingMessageMap:(id)a3;
- (void)setSubjectForTelephonyMessages:(id)a3 messageItem:(id)a4;
- (void)smsMessageReceived:(id)a3 msgID:(int64_t)a4;
@end

@implementation SMSServiceSession

- (SMSServiceSession)initWithAccount:(id)a3 service:(id)a4 replicatingForSession:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  v11 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned __int8 v12 = [v11 isSMSRefactorEnabled];

  if (v12)
  {
    v25.receiver = self;
    v25.super_class = (Class)SMSServiceSession;
    v13 = [(SMSServiceSession *)&v25 initWithAccount:v8 service:v9 replicatingForSession:v10];
    if (v13)
    {
      if (IMOSLoggingEnabled())
      {
        v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "Setting up SMS service", v24, 2u);
        }
      }
      +[IMCTSMSUtilities IMSynchronizePreferredSubscriptionMMSCapabilityToWatch];
      if (IMOSLoggingEnabled())
      {
        v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Setting up push handler", v24, 2u);
        }
      }
      uint64_t v16 = +[IMDRelayPushHandler sharedInstance];
      smsRelayPushHandler = v13->_smsRelayPushHandler;
      v13->_smsRelayPushHandler = (IMDRelayPushHandler *)v16;

      [(IMDRelayPushHandler *)v13->_smsRelayPushHandler addListener:v13];
      [(IMDRelayPushHandler *)v13->_smsRelayPushHandler setRegistered:1];
      if (IMOSLoggingEnabled())
      {
        v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "...done", v24, 2u);
        }
      }
      if (IMOSLoggingEnabled())
      {
        v19 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v24 = 0;
          _os_log_impl(&dword_0, v19, OS_LOG_TYPE_INFO, "Delegate setup", v24, 2u);
        }
      }
      v20 = (CoreTelephonyClient *)[objc_alloc((Class)IMWeakLinkClass()) initWithQueue:&_dispatch_main_q];
      coreTelephonyClient = v13->coreTelephonyClient;
      v13->coreTelephonyClient = v20;

      [(CoreTelephonyClient *)v13->coreTelephonyClient setDelegate:v13];
    }
  }
  else
  {
    v13 = [[LegacySMSServiceSession alloc] initWithAccount:v8 service:v9 replicatingForSession:v10];
  }
  v22 = v13;

  return v22;
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
  v4 = [(NSMutableDictionary *)self->_outgoingRelayMessageTimerMap allValues];
  [v4 makeObjectsPerformSelector:"invalidate"];

  [(IMDRelayPushHandler *)self->_smsRelayPushHandler removeListener:self];
  v5 = +[NSNotificationCenter defaultCenter];
  [v5 removeObserver:self name:0 object:0];

  v6.receiver = self;
  v6.super_class = (Class)SMSServiceSession;
  [(SMSServiceSession *)&v6 dealloc];
}

- (void)_registerForIncomingMessages:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)objc_super v6 = 0;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "Registering for incoming messages", v6, 2u);
    }
  }
  [(SMSServiceSession *)self _clearPendingIncomingMessageQueue];
}

- (void)sessionDidBecomeActive
{
  if (IMOSLoggingEnabled())
  {
    v3 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v3, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      unsigned __int8 v12 = "-[SMSServiceSession sessionDidBecomeActive]";
      _os_log_impl(&dword_0, v3, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  id v4 = [(SMSServiceSession *)self relayController];
  [v4 updateMMSCapability];

  v5 = +[IMDLocalDaemon sharedDaemon];
  LODWORD(v4) = [v5 isSetupComplete];

  int v6 = IMOSLoggingEnabled();
  if (v4)
  {
    if (v6)
    {
      v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Daemon is ready registering for incoming messages", buf, 2u);
      }
    }
    [(SMSServiceSession *)self _registerForIncomingMessages:0];
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
    id v9 = +[NSNotificationCenter defaultCenter];
    [v9 addObserver:self selector:"_registerForIncomingMessages:" name:kFZDaemonFinishedLaunchingNotification object:0];
  }
  v10.receiver = self;
  v10.super_class = (Class)SMSServiceSession;
  [(SMSServiceSession *)&v10 sessionDidBecomeActive];
}

- (void)sessionWillBecomeInactiveWithAccount:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 136315138;
      objc_super v10 = "-[SMSServiceSession sessionWillBecomeInactiveWithAccount:]";
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "%s", buf, 0xCu);
    }
  }
  int v6 = [(NSMutableDictionary *)self->_outgoingRelayMessageTimerMap allValues];
  [v6 makeObjectsPerformSelector:"invalidate"];

  v7 = +[NSNotificationCenter defaultCenter];
  [v7 removeObserver:self name:kFZDaemonFinishedLaunchingNotification object:0];

  v8.receiver = self;
  v8.super_class = (Class)SMSServiceSession;
  [(SMSServiceSession *)&v8 sessionWillBecomeInactiveWithAccount:v4];
}

- (BOOL)replicationRequirementsSatisfiedForPhoneNumber:(id)a3 simID:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  unsigned int v8 = +[IMCTSMSUtilities IMMMSGroupTextReplicationSupportedForPhoneNumber:v6 simID:v7];
  id v9 = [(SMSServiceSession *)self relayController];
  unsigned int v10 = [v9 _checkMMSEnablementForPhoneNumber:v6 simID:v7];

  unsigned int v11 = +[IMCTSMSUtilities IMMMSGroupTextOnlyMessagesSendAsMMSForPhoneNumber:v6 simID:v7];
  unsigned __int8 v12 = [(SMSServiceSession *)self relayController];
  unsigned int v13 = [v12 _localDeviceSupportsSMS];

  v14 = [(SMSServiceSession *)self relayController];
  if ([v14 hasRelayDevice])
  {
    v15 = [(SMSServiceSession *)self relayController];
    unsigned int v16 = [v15 _canRelayMMS];
  }
  else
  {
    unsigned int v16 = 0;
  }

  if ((v10 & v11) == 1) {
    int v17 = v8 & (v13 | v16);
  }
  else {
    int v17 = 0;
  }
  if (IMOSLoggingEnabled())
  {
    v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      CFStringRef v19 = @"NO";
      int v26 = 138414082;
      id v27 = v6;
      if (v17) {
        CFStringRef v20 = @"YES";
      }
      else {
        CFStringRef v20 = @"NO";
      }
      if (v10) {
        CFStringRef v21 = @"YES";
      }
      else {
        CFStringRef v21 = @"NO";
      }
      if (v11) {
        CFStringRef v22 = @"YES";
      }
      else {
        CFStringRef v22 = @"NO";
      }
      __int16 v28 = 2112;
      id v29 = v7;
      __int16 v30 = 2112;
      CFStringRef v31 = v20;
      if (v8) {
        CFStringRef v23 = @"YES";
      }
      else {
        CFStringRef v23 = @"NO";
      }
      __int16 v32 = 2112;
      if (v13) {
        CFStringRef v24 = @"YES";
      }
      else {
        CFStringRef v24 = @"NO";
      }
      CFStringRef v33 = v21;
      if (v16) {
        CFStringRef v19 = @"YES";
      }
      __int16 v34 = 2112;
      CFStringRef v35 = v22;
      __int16 v36 = 2112;
      CFStringRef v37 = v23;
      __int16 v38 = 2112;
      CFStringRef v39 = v24;
      __int16 v40 = 2112;
      CFStringRef v41 = v19;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "Phone number %@ and SIMID %@ satisfy replication requirements %@ (MMS: %@ groups: %@ isEnabledByCarrier: %@ local SMS: %@ relay: %@)", (uint8_t *)&v26, 0x52u);
    }
  }
  return v17;
}

- (id)replicationPhoneNumbers
{
  v19.receiver = self;
  v19.super_class = (Class)SMSServiceSession;
  v2 = [(SMSServiceSession *)&v19 replicationPhoneNumbers];
  id v3 = [v2 mutableCopy];

  id v4 = +[IMCTSubscriptionUtilities sharedInstance];
  v5 = [v4 registeredPhoneNumbers];

  long long v17 = 0u;
  long long v18 = 0u;
  long long v15 = 0u;
  long long v16 = 0u;
  id v6 = v5;
  id v7 = (char *)[v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
  if (v7)
  {
    unsigned int v8 = v7;
    uint64_t v9 = *(void *)v16;
    do
    {
      for (i = 0; i != v8; ++i)
      {
        if (*(void *)v16 != v9) {
          objc_enumerationMutation(v6);
        }
        unsigned int v11 = IMChatCanonicalIDSIDsForAddress();
        unsigned __int8 v12 = objc_msgSend(v11, "_stripFZIDPrefix", v15);

        [v3 addObject:v12];
      }
      unsigned int v8 = (char *)[v6 countByEnumeratingWithState:&v15 objects:v20 count:16];
    }
    while (v8);
  }

  id v13 = [v3 copy];

  return v13;
}

- (BOOL)replicationRequiredForFeaturesUsedByMessageItem:(id)a3
{
  id v4 = a3;
  v20.receiver = self;
  v20.super_class = (Class)SMSServiceSession;
  if ([(SMSServiceSession *)&v20 replicationRequiredForFeaturesUsedByMessageItem:v4])
  {
    goto LABEL_17;
  }
  v5 = [v4 threadIdentifier];
  BOOL v6 = [v5 length] == 0;

  if (!v6)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        unsigned int v8 = [v4 guid];
        *(_DWORD *)buf = 138412290;
        CFStringRef v22 = v8;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Allowing replication for %@, has thread identifier", buf, 0xCu);
      }
LABEL_16:

      goto LABEL_17;
    }
    goto LABEL_17;
  }
  uint64_t v9 = [v4 fileTransferGUIDs];
  BOOL v10 = [v9 count] == 0;

  if (!v10)
  {
    if (IMOSLoggingEnabled())
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        unsigned int v11 = [v4 guid];
        *(_DWORD *)buf = 138412290;
        CFStringRef v22 = v11;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Allowing replication for %@, has file transfer GUIDs", buf, 0xCu);
      }
      goto LABEL_16;
    }
LABEL_17:
    BOOL v16 = 1;
    goto LABEL_18;
  }
  unsigned __int8 v12 = [v4 balloonBundleID];
  BOOL v13 = [v12 length] == 0;

  int v14 = IMOSLoggingEnabled();
  if (!v13)
  {
    if (v14)
    {
      id v7 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        long long v15 = [v4 guid];
        *(_DWORD *)buf = 138412290;
        CFStringRef v22 = v15;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Allowing replication for %@, has balloon bundle ID", buf, 0xCu);
      }
      goto LABEL_16;
    }
    goto LABEL_17;
  }
  if (v14)
  {
    long long v18 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
    {
      objc_super v19 = [v4 guid];
      *(_DWORD *)buf = 138412290;
      CFStringRef v22 = v19;
      _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "No replication needed for %@", buf, 0xCu);
    }
  }
  BOOL v16 = 0;
LABEL_18:

  return v16;
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
  v5 = [v3 fileTransferGUIDs];
  if (![v5 count])
  {

    goto LABEL_28;
  }
  BOOL v6 = [v3 balloonBundleID];
  unsigned int v7 = [v6 isEqualToString:IMBalloonPluginIdentifierRichLinks];

  if (v7)
  {
LABEL_28:
    if (IMOSLoggingEnabled())
    {
      objc_super v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Validation: Message has no attachments or it is a rich link, fine to send", buf, 2u);
      }
    }
    LOBYTE(v10) = 1;
    goto LABEL_37;
  }
  unsigned int v8 = +[IMDFileTransferCenter sharedInstance];
  uint64_t v9 = (__CFString *)objc_alloc_init((Class)NSMutableArray);
  long long v25 = 0u;
  long long v26 = 0u;
  long long v23 = 0u;
  long long v24 = 0u;
  BOOL v10 = [v3 fileTransferGUIDs];
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
        int v14 = [v8 transferForGUID:*(void *)(*((void *)&v23 + 1) + 8 * i)];
        long long v15 = v14;
        if (v14)
        {
          BOOL v16 = [v14 type];
          if (![v16 length])
          {
            CFStringRef v21 = IMLogHandleForCategory();
            if (os_log_type_enabled(v21, OS_LOG_TYPE_ERROR)) {
              sub_5E9DC();
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
  unsigned int v8 = [v5 objectForKey:IMDMessageStoreHandleCountryCodeKey];
  uint64_t v9 = [v5 objectForKey:IMDMessageStoreHandleUnformattedIDKey];
  BOOL v10 = +[IMDMessageStore sharedInstance];
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

      unsigned int v8 = (void *)v13;
    }
    if (IMOSLoggingEnabled())
    {
      int v14 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
      {
        int v18 = 138412802;
        CFStringRef v19 = v7;
        __int16 v20 = 2112;
        CFStringRef v21 = v11;
        __int16 v22 = 2112;
        long long v23 = v8;
        _os_log_impl(&dword_0, v14, OS_LOG_TYPE_INFO, "   => Adding phone recipient: %@ (%@:%@)", (uint8_t *)&v18, 0x20u);
      }
    }
    if (v11) {
      long long v15 = v11;
    }
    else {
      long long v15 = v7;
    }
    BOOL v16 = +[CTPhoneNumber phoneNumberWithDigits:1 digits:v15 countryCode:v8];
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
        CFStringRef v21 = v11;
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

  unsigned int v8 = objc_msgSend(v5, "__im_subscriptionContextForForSimID:phoneNumber:", v6, v7);

  uint64_t v9 = [v8 phoneNumber];

  return v9;
}

- (id)lastAddressedSIMIDForJunkReportMessageItem:(id)a3
{
  id v3 = a3;
  id v4 = +[IMCTSubscriptionUtilities sharedInstance];
  id v5 = [v4 ctSubscriptionInfo];
  id v6 = [v3 destinationCallerID];
  unsigned int v7 = [v3 destinationCallerID];

  unsigned int v8 = objc_msgSend(v5, "__im_subscriptionContextForForSimID:phoneNumber:", v6, v7);

  uint64_t v9 = [v8 labelID];

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
      unsigned int v8 = OSLogHandleForIMFoundationCategory();
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
          int v14 = *(void **)(*((void *)&v16 + 1) + 8 * (void)v13);
          long long v15 = objc_msgSend(v6, "subject", (void)v16);
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
  BOOL v65 = a6;
  id v68 = a3;
  id v13 = a4;
  id v63 = a5;
  id v62 = a7;
  id v61 = a8;
  v58 = v13;
  if ([v13 count])
  {
    int v14 = sub_E2D4(v13);
    if (IMOSLoggingEnabled())
    {
      long long v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        *(void *)v88 = v14;
        _os_log_impl(&dword_0, v15, OS_LOG_TYPE_INFO, "Generated SMIL string: %@", buf, 0xCu);
      }
    }
    long long v84 = 0u;
    long long v85 = 0u;
    long long v82 = 0u;
    long long v83 = 0u;
    id v16 = v68;
    id v17 = [v16 countByEnumeratingWithState:&v82 objects:v95 count:16];
    if (v17)
    {
      uint64_t v18 = *(void *)v83;
      do
      {
        for (i = 0; i != v17; i = (char *)i + 1)
        {
          if (*(void *)v83 != v18) {
            objc_enumerationMutation(v16);
          }
          __int16 v20 = [*(id *)(*((void *)&v82 + 1) + 8 * i) addText:v14];
          CFStringRef v21 = +[IMFeatureFlags sharedFeatureFlags];
          unsigned int v22 = [v21 isReplicationEnabled];

          if (v22)
          {
            long long v23 = [v63 guid];
            [(SMSServiceSession *)self _setContentIDAndLocationForSMILPart:v20 messageGUID:v23 isGroupChat:v65 phoneNumber:v62 simID:v61];
          }
          else
          {
            [v20 setContentId:@"0.smil"];
          }
          [v20 setContentType:IMDCTPartDictionaryContentTypeSMILKey];
        }
        id v17 = [v16 countByEnumeratingWithState:&v82 objects:v95 count:16];
      }
      while (v17);
    }
  }
  id v64 = objc_alloc_init((Class)NSMutableSet);
  long long v80 = 0u;
  long long v81 = 0u;
  long long v78 = 0u;
  long long v79 = 0u;
  id obj = v68;
  id v59 = [obj countByEnumeratingWithState:&v78 objects:v94 count:16];
  if (v59)
  {
    uint64_t v57 = *(void *)v79;
    do
    {
      uint64_t v24 = 0;
      do
      {
        if (*(void *)v79 != v57)
        {
          uint64_t v25 = v24;
          objc_enumerationMutation(obj);
          uint64_t v24 = v25;
        }
        uint64_t v60 = v24;
        v69 = *(void **)(*((void *)&v78 + 1) + 8 * v24);
        long long v74 = 0u;
        long long v75 = 0u;
        long long v76 = 0u;
        long long v77 = 0u;
        id v66 = v58;
        id v26 = [v66 countByEnumeratingWithState:&v74 objects:v93 count:16];
        if (v26)
        {
          uint64_t v27 = 0;
          uint64_t v67 = *(void *)v75;
          do
          {
            for (j = 0; j != v26; j = (char *)j + 1)
            {
              if (*(void *)v75 != v67) {
                objc_enumerationMutation(v66);
              }
              __int16 v29 = *(void **)(*((void *)&v74 + 1) + 8 * (void)j);
              uint64_t v30 = [v29 objectForKey:@"Type"];
              CFStringRef v31 = sub_E15C(v30);

              __int16 v32 = [v29 objectForKey:@"Filename"];
              if (v32)
              {
                CFStringRef v33 = +[NSURL fileURLWithPath:v32];
                __int16 v34 = +[NSData dataWithContentsOfURL:v33 options:1 error:0];

                CFStringRef v35 = IMSafeTemporaryDirectory();
                uint64_t v36 = [v35 path];

                if (v36) {
                  CFStringRef v37 = (__CFString *)v36;
                }
                else {
                  CFStringRef v37 = @"/tmp";
                }
                if ([v32 hasPrefix:v37])
                {
                  [v64 addObject:v32];
                  if (IMOSLoggingEnabled())
                  {
                    __int16 v38 = OSLogHandleForIMFoundationCategory();
                    if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
                    {
                      *(_DWORD *)buf = 138412290;
                      *(void *)v88 = v32;
                      _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "  => setting file to cleanup: %@", buf, 0xCu);
                    }
                  }
                }
              }
              else
              {
                __int16 v34 = [v29 objectForKey:@"Data"];
              }
              CFStringRef v39 = [v29 objectForKey:@"Path"];
              __int16 v40 = +[IMFeatureFlags sharedFeatureFlags];
              unsigned int v41 = [v40 isReplicationEnabled];

              if (v41 && v65)
              {
                v42 = [v63 guid];
                v43 = +[NSString stringWithFormat:@"%d.%@%@", (char *)j + v27, v42, off_99418];
              }
              else
              {
                v43 = +[NSString stringWithFormat:@"%d", (char *)j + v27];
              }
              if (IMOSLoggingEnabled())
              {
                v44 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
                {
                  unsigned int v45 = [v34 length];
                  *(_DWORD *)buf = 67109890;
                  *(_DWORD *)v88 = v45;
                  *(_WORD *)&v88[4] = 2112;
                  *(void *)&v88[6] = v39;
                  __int16 v89 = 2112;
                  v90 = v43;
                  __int16 v91 = 2112;
                  v92 = v31;
                  _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "  => adding data: %d bytes (location: %@, id: %@, type: %@)", buf, 0x26u);
                }
              }
              id v46 = [objc_alloc((Class)CTMessagePart) initWithData:v34 contentType:v31];
              [v46 setContentId:v43];
              [v46 setContentLocation:v39];
              if (IMOSLoggingEnabled())
              {
                v47 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
                {
                  *(_DWORD *)buf = 138412290;
                  *(void *)v88 = v46;
                  _os_log_impl(&dword_0, v47, OS_LOG_TYPE_INFO, "  => adding part: %@", buf, 0xCu);
                }
              }
              id v48 = [v69 addPart:v46];
            }
            id v26 = [v66 countByEnumeratingWithState:&v74 objects:v93 count:16];
            uint64_t v27 = (v27 + j);
          }
          while (v26);
        }

        uint64_t v24 = v60 + 1;
      }
      while ((id)(v60 + 1) != v59);
      id v59 = [obj countByEnumeratingWithState:&v78 objects:v94 count:16];
    }
    while (v59);
  }

  long long v72 = 0u;
  long long v73 = 0u;
  long long v70 = 0u;
  long long v71 = 0u;
  id v49 = v64;
  id v50 = [v49 countByEnumeratingWithState:&v70 objects:v86 count:16];
  if (v50)
  {
    uint64_t v51 = *(void *)v71;
    do
    {
      for (k = 0; k != v50; k = (char *)k + 1)
      {
        if (*(void *)v71 != v51) {
          objc_enumerationMutation(v49);
        }
        uint64_t v53 = *(void *)(*((void *)&v70 + 1) + 8 * (void)k);
        if (IMOSLoggingEnabled())
        {
          v54 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)v88 = v53;
            _os_log_impl(&dword_0, v54, OS_LOG_TYPE_INFO, "Cleaning up: %@", buf, 0xCu);
          }
        }
        v55 = +[NSFileManager defaultManager];
        [v55 removeItemAtPath:v53 error:0];
      }
      id v50 = [v49 countByEnumeratingWithState:&v70 objects:v86 count:16];
    }
    while (v50);
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
    int v14 = +[NSString stringWithFormat:@"0.%@%@.smil", v11, off_99418];
    if (+[IMCTSMSUtilities IMMMSGroupTextReplicationSupportsSMILContentLocationForPhoneNumber:v12 simID:v13])
    {
      int v14 = v14;
      long long v15 = v14;
    }
    else
    {
      long long v15 = 0;
    }
  }
  else
  {
    long long v15 = 0;
    int v14 = @"0.smil";
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
        [(SMSServiceSession *)self _buildCTPhoneNumberWithParticipantInfo:v11 ctMessage:v12];

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
              unsigned int v22 = 0;
              do
              {
                if (*(void *)v25 != v21) {
                  objc_enumerationMutation(v18);
                }
                [(SMSServiceSession *)self _buildCTPhoneNumberWithParticipantInfo:*(void *)(*((void *)&v24 + 1) + 8 * (void)v22) ctMessage:v17];
                unsigned int v22 = (char *)v22 + 1;
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
  if (a4) {
    uint64_t v5 = 2;
  }
  else {
    uint64_t v5 = 1;
  }
  [a3 setMessageType:v5];
}

- (void)addMessagePlainTextToTelephonyMessages:(id)a3 messageItem:(id)a4 processedMessageItem:(id)a5
{
  id v7 = a3;
  id v8 = +[IMDTelephonyServiceSession getPlainTextForMessage:a4 processedMessageItem:a5];
  if ([v8 length])
  {
    long long v17 = 0u;
    long long v18 = 0u;
    long long v15 = 0u;
    long long v16 = 0u;
    id v9 = v7;
    id v10 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
    if (v10)
    {
      id v11 = v10;
      uint64_t v12 = *(void *)v16;
      do
      {
        id v13 = 0;
        do
        {
          if (*(void *)v16 != v12) {
            objc_enumerationMutation(v9);
          }
          id v14 = objc_msgSend(*(id *)(*((void *)&v15 + 1) + 8 * (void)v13), "addText:", v8, (void)v15);
          id v13 = (char *)v13 + 1;
        }
        while (v11 != v13);
        id v11 = [v9 countByEnumeratingWithState:&v15 objects:v19 count:16];
      }
      while (v11);
    }
  }
}

- (void)sendTelephonyMessageFromJunkReportMessageItem:(id)a3
{
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
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
  uint64_t v12 = +[NSArray arrayWithObjects:&v18 count:1];
  id v13 = [(SMSServiceSession *)self service];
  v15[0] = _NSConcreteStackBlock;
  v15[1] = 3221225472;
  v15[2] = sub_5F3C;
  v15[3] = &unk_8CF90;
  v15[4] = self;
  id v16 = v4;
  id v14 = v4;
  [v11 resolveUnformattedRepresentationsForHandles:v12 onService:v13 message:v14 completionBlock:v15];
}

- (int64_t)maxSizePerAttachmentWithCount:(int)a3 lastAddressedHandle:(id)a4 lastAddressedSIMID:(id)a5
{
  return (int)+[IMCTSMSUtilities IMMMSMaximumMessageByteCountForPhoneNumber:a4 simID:a5]/ a3;
}

- (BOOL)_isActiveServiceForRelay
{
  v2 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned __int8 v3 = [v2 isLazuliEnabled];

  return v3 ^ 1;
}

- (void)refreshServiceCapabilities
{
  id v4 = [(SMSServiceSession *)self broadcaster];
  unsigned __int8 v3 = [(SMSServiceSession *)self accountID];
  objc_msgSend(v4, "account:capabilitiesChanged:", v3, -[SMSServiceSession capabilities](self, "capabilities"));
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
    id v11 = OSLogHandleForIMFoundationCategory();
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
  [(SMSServiceSession *)self canonicalizeChatIdentifier:&v35 style:&v36];
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
          long long v15 = *(void **)(*((void *)&v31 + 1) + 8 * i);
          id v16 = [v15 objectForKey:v27];
          long long v17 = [v15 objectForKey:v26];
          id v18 = [v15 objectForKey:v13];
          char v19 = v36;
          id v20 = [(SMSServiceSession *)self account];
          uint64_t v21 = [v29 destinationCallerID];
          LOBYTE(v23) = v19;
          id v22 = [(SMSServiceSession *)self didChangeMemberStatus:2 forHandle:v16 fromHandle:0 unformattedNumber:v17 countryCode:v18 forChat:v30 style:v23 account:v20 destinationCallerID:v21];
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
    v10[0] = &off_90CD8;
    v10[1] = v4;
    uint64_t v5 = +[NSDictionary dictionaryWithObjects:v10 forKeys:v9 count:2];
    id v11 = v5;
    int v6 = +[NSArray arrayWithObjects:&v11 count:1];

    [(SMSServiceSession *)self didJoinChat:v4 style:45 displayName:0 groupID:0 handleInfo:v6];
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
  [(SMSServiceSession *)self didLeaveChat:v6 style:v4];
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
}

- (void)sendReadReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6 reflectOnly:(BOOL)a7
{
  BOOL v7 = a7;
  uint64_t v8 = a6;
  id v11 = a3;
  id v14 = [(SMSServiceSession *)self chatForChatIdentifier:a5 style:v8];
  id v12 = [(SMSServiceSession *)self relayController];
  [v12 sendReadReceiptForMessage:v11 toChat:v14 reflectOnly:v7];

  uint64_t v13 = [v11 guid];

  [(SMSServiceSession *)self didSendMessageReadReceiptForMessageID:v13];
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
  char v19 = [v13 guid];
  [(SMSServiceSession *)self didSendDeliveredQuietlyReceiptForMessageID:v19];
}

- (void)sendNotifyRecipientCommandForMessage:(id)a3 toChatGuid:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Not sending notify recipient command for item: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v13 = [v9 guid];
  [(SMSServiceSession *)self didSendNotifyRecipientCommandForMessageID:v13];
}

- (void)sendPlayedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Marking message as played: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v13 = [v9 guid];
  [(SMSServiceSession *)self didSendMessagePlayedReceiptForMessageID:v13];
}

- (void)sendSavedReceiptForMessage:(id)a3 toChatID:(id)a4 identifier:(id)a5 style:(unsigned __int8)a6
{
  id v9 = a3;
  id v10 = a4;
  id v11 = a5;
  if (IMOSLoggingEnabled())
  {
    id v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      int v14 = 138412290;
      id v15 = v9;
      _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Marking message as saved: %@", (uint8_t *)&v14, 0xCu);
    }
  }
  id v13 = [v9 guid];
  [(SMSServiceSession *)self didSendMessageSavedReceiptForMessageID:v13];
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
    char v19 = OSLogHandleForIMFoundationCategory();
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
    BOOL v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v8 = 0;
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

- (void)sendJunkReportMessage:(id)a3
{
}

- (BOOL)_sendMessageOverAlternatePath:(id)a3 toChat:(id)a4
{
  id v5 = a3;
  id v6 = a4;
  id v7 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v8 = [v7 stewieEnabled];

  if (v8 && [v6 isStewieChat])
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)id v13 = 0;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "This is an emergency message asked to be sent over Stewie: Sending Message via Stewie", v13, 2u);
      }
    }
    id v10 = +[IMDChorosController sharedController];
    [v10 sendStewieMessage:v5 forChat:v6];

    BOOL v11 = 1;
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

- (id)_chatForSendingMessageItem:(id)a3 chatIdentifier:(id)a4 chatStyle:(unsigned __int8)a5
{
  uint64_t v5 = a5;
  id v8 = a3;
  id v9 = a4;
  v15.receiver = self;
  v15.super_class = (Class)SMSServiceSession;
  id v10 = [(SMSServiceSession *)&v15 _chatForSendingMessageItem:v8 chatIdentifier:v9 chatStyle:v5];
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
        [(SMSServiceSession *)self _joinOneToOneChatWithChatIdentifier:v9];
        id v10 = [(SMSServiceSession *)self chatForChatIdentifier:v9 style:45];
      }
    }
  }

  return v10;
}

- (BOOL)shouldExcludeChatFromRelay:(id)a3
{
  return [a3 isStewieChat];
}

- (unint64_t)maxRecipientsForPhoneNumber:(id)a3 simID:(id)a4
{
  return (int)+[IMCTSMSUtilities IMMMSMaxRecipientsForPhoneNumber:a3 simID:a4];
}

- (unint64_t)_sendingDecisionForMessageItem:(id)a3 callerID:(id)a4 chat:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  id v10 = a5;
  unsigned int v11 = +[FTDeviceSupport sharedInstance];
  unsigned int v12 = [v11 supportsCellularData];

  id v13 = [(SMSServiceSession *)self relayController];
  unsigned int v14 = [v13 _localDeviceSupportsSMS];

  objc_super v15 = +[IDSCTAdapter sharedInstance];
  id v16 = [v8 handle];
  unsigned int v17 = [v15 isPhoneNumberEmergencyNumber:v16];

  if (v14 && ([v8 useStandalone] | v17) == 1)
  {
    if (IMOSLoggingEnabled())
    {
      id v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v18, OS_LOG_TYPE_INFO, "This is an emergency message asked to be sent over CT: Sending Message via CT", buf, 2u);
      }
    }
    id v19 = &dword_0 + 1;
  }
  else
  {
    if (IMOSLoggingEnabled())
    {
      int v20 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
      {
        unsigned int v21 = [v8 useStandalone];
        CFStringRef v22 = @"NO";
        if (v14) {
          CFStringRef v23 = @"YES";
        }
        else {
          CFStringRef v23 = @"NO";
        }
        if (v12) {
          CFStringRef v24 = @"YES";
        }
        else {
          CFStringRef v24 = @"NO";
        }
        *(_DWORD *)buf = 138413058;
        CFStringRef v29 = v24;
        if (v21) {
          CFStringRef v25 = @"YES";
        }
        else {
          CFStringRef v25 = @"NO";
        }
        __int16 v30 = 2112;
        CFStringRef v31 = v23;
        __int16 v32 = 2112;
        CFStringRef v33 = v25;
        if (v17) {
          CFStringRef v22 = @"YES";
        }
        __int16 v34 = 2112;
        CFStringRef v35 = v22;
        _os_log_impl(&dword_0, v20, OS_LOG_TYPE_INFO, "Supports Cell: %@, canSendSMS: %@, non emergency (standalone: %@ isEmergency: %@), checking super for sending decision", buf, 0x2Au);
      }
    }
    v27.receiver = self;
    v27.super_class = (Class)SMSServiceSession;
    id v19 = [(SMSServiceSession *)&v27 _sendingDecisionForMessageItem:v8 callerID:v9 chat:v10];
  }

  return (unint64_t)v19;
}

- (BOOL)allowedToSendMessage:(id)a3 toChat:(id)a4
{
  id v6 = a3;
  id v7 = a4;
  if (([v6 isFinished] & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        id v10 = [v6 guid];
        *(_DWORD *)buf = 138412290;
        id v16 = v10;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, "Not sending unfinished message %@", buf, 0xCu);
      }
    }
    goto LABEL_14;
  }
  v14.receiver = self;
  v14.super_class = (Class)SMSServiceSession;
  if (![(SMSServiceSession *)&v14 allowedToSendMessage:v6 toChat:v7])
  {
LABEL_14:
    BOOL v8 = 0;
    goto LABEL_15;
  }
  if (![(SMSServiceSession *)self isValidMMS:v6])
  {
    if (IMOSLoggingEnabled())
    {
      unsigned int v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        unsigned int v12 = [v6 guid];
        *(_DWORD *)buf = 138412290;
        id v16 = v12;
        _os_log_impl(&dword_0, v11, OS_LOG_TYPE_INFO, "Message with guid: %@ is an invalid MMS message, marking as failed and not forwarding to clients", buf, 0xCu);
      }
    }
    [v6 setErrorCode:4];
    goto LABEL_14;
  }
  BOOL v8 = 1;
LABEL_15:

  return v8;
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
      id v9 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v9, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 134217984;
        uint64_t v15 = 0x4010000000000000;
        _os_log_impl(&dword_0, v9, OS_LOG_TYPE_INFO, " ** FailSendingSMSMessages is enabled, failing send message after %f seconds", buf, 0xCu);
      }
    }
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMEventCategory();
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

- (BOOL)shouldFixIncomingDate
{
  v2 = +[IDSServerBag sharedInstanceForBagType:1];
  unsigned __int8 v3 = [v2 objectForKey:@"fix-sms-date"];
  uint64_t v4 = v3;
  if (v3)
  {
    unsigned int v5 = [v3 BOOLValue];
    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
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
  if ([(SMSServiceSession *)self shouldFixIncomingDate])
  {
    unsigned int v5 = +[NSDate date];

    if (IMOSLoggingEnabled())
    {
      id v6 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412546;
        id v10 = v4;
        __int16 v11 = 2112;
        id v12 = v5;
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
  id v101 = a3;
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
  [(__CFDictionary *)theDict setObject:@"1" forKey:IMDCTMessageDictionaryVersionKey];
  if ([v101 messageType] == 1)
  {
    id v5 = IMDCTMessageDictionaryTypeSMS;
    if (v5) {
      goto LABEL_14;
    }
    id v6 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_5EA6C();
    }
  }
  else if ([v101 messageType] == 2)
  {
    id v5 = IMDCTMessageDictionaryTypeMMS;
    if (v5) {
      goto LABEL_14;
    }
    id v7 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_5EA6C();
    }
  }
  else
  {
    id v5 = IMDCTMessageDictionaryTypeUnknown;
    if (v5)
    {
LABEL_14:
      CFDictionarySetValue(theDict, IMDCTMessageDictionaryTypeKey, v5);
      goto LABEL_24;
    }
    id v8 = &_os_log_default;
    if (os_log_type_enabled((os_log_t)&_os_log_default, OS_LOG_TYPE_ERROR)) {
      sub_5EA6C();
    }
  }

LABEL_24:
  int v9 = [v101 sender];
  id v10 = [v9 canonicalFormat];
  __int16 v11 = [(SMSServiceSession *)self _extractSMSSenderAddress:v10];

  IMGetDomainValueForKey();
  id v100 = (id)objc_claimAutoreleasedReturnValue();

  if ([v100 length])
  {
    id v12 = v100;

    __int16 v11 = v12;
  }
  id v13 = v11;
  if (v13)
  {
    id v14 = v13;
    CFDictionarySetValue(theDict, IMDCTMessageDictionarySenderKey, v13);
    id v13 = v14;
  }
  v98 = v13;

  id v15 = objc_alloc_init((Class)NSMutableArray);
  long long v111 = 0u;
  long long v112 = 0u;
  long long v109 = 0u;
  long long v110 = 0u;
  id v16 = [v101 recipients];
  id v17 = [v16 countByEnumeratingWithState:&v109 objects:v122 count:16];
  if (v17)
  {
    uint64_t v18 = *(void *)v110;
    do
    {
      for (i = 0; i != v17; i = (char *)i + 1)
      {
        if (*(void *)v110 != v18) {
          objc_enumerationMutation(v16);
        }
        int v20 = [*(id *)(*((void *)&v109 + 1) + 8 * i) canonicalFormat];
        if (v20) {
          [v15 addObject:v20];
        }
      }
      id v17 = [v16 countByEnumeratingWithState:&v109 objects:v122 count:16];
    }
    while (v17);
  }

  unsigned int v21 = [v101 date];
  CFStringRef v22 = [(SMSServiceSession *)self _fixIncomingDate:v21];

  CFStringRef v23 = +[IMCTSMSUtilities myCTPhoneNumber];
  if (IMSharedHelperDeviceHasMultipleSubscriptions())
  {
    CFStringRef v24 = [v101 context];
    CFStringRef v25 = +[IMCTSubscriptionUtilities sharedInstance];
    uint64_t v26 = [v25 ctSubscriptionInfo];

    objc_super v27 = 0;
    if (v24 && v26)
    {
      objc_msgSend(v26, "__im_subscriptionContextOrDefaultForForSlotID:", objc_msgSend(v24, "slotID"));
      uint64_t v28 = (__CFString *)objc_claimAutoreleasedReturnValue();
      if (v28)
      {
        if (IMOSLoggingEnabled())
        {
          CFStringRef v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            id v103 = [(__CFString *)v28 phoneNumber];
            id v30 = [(__CFString *)v28 labelID];
            CFStringRef v31 = +[NSNumber numberWithInteger:](NSNumber, "numberWithInteger:", [v24 slotID]);
            *(_DWORD *)buf = 138413058;
            CFStringRef v115 = v28;
            __int16 v116 = 2112;
            id v117 = v103;
            __int16 v118 = 2112;
            id v119 = v30;
            __int16 v120 = 2112;
            v121 = v31;
            _os_log_impl(&dword_0, v29, OS_LOG_TYPE_INFO, "Setting receiving context = %@, phoneNumber = %@, simID = %@ for given slotID %@", buf, 0x2Au);
          }
        }
        uint64_t v32 = [(__CFString *)v28 phoneNumber];

        objc_super v27 = [(__CFString *)v28 labelID];
        CFStringRef v23 = (void *)v32;
      }
      else
      {
        objc_super v27 = 0;
      }
    }
  }
  else
  {
    objc_super v27 = 0;
  }
  CFStringRef v33 = [(SMSServiceSession *)self relayController];
  unsigned int v34 = [v33 isSMSRelayEnabled];

  if (v34)
  {
    CFStringRef v35 = +[IMCTSMSUtilities IMCountryCodeForPhoneNumber:v23 simID:v27];
  }
  else
  {
    CFStringRef v35 = 0;
  }
  id v36 = v15;
  if (v36)
  {
    id v37 = v36;
    CFDictionarySetValue(theDict, IMDCTMessageDictionaryReceipientsKey, v36);
    id v36 = v37;
  }
  v92 = v36;

  id v38 = v22;
  if (v38)
  {
    id v39 = v38;
    CFDictionarySetValue(theDict, IMDCTMessageDictionaryDateKey, v38);
    id v38 = v39;
  }
  __int16 v91 = v38;

  __int16 v40 = [v101 serviceCenter];
  id v41 = [v40 canonicalFormat];

  if (v41) {
    CFDictionarySetValue(theDict, IMDCTMessageDictionaryServiceCenterKey, v41);
  }

  id v42 = v23;
  if (v42)
  {
    id v43 = v42;
    CFDictionarySetValue(theDict, IMDCTMessageDictionaryOriginatedDeviceNumberKey, v42);
    id v42 = v43;
  }
  v97 = v42;

  id v44 = v27;
  if (v44)
  {
    id v45 = v44;
    CFDictionarySetValue(theDict, IMDCTMessageDictionaryOriginatedDeviceSIMKey, v44);
    id v44 = v45;
  }
  v96 = v44;

  id v46 = [v101 subject];
  if (v46) {
    CFDictionarySetValue(theDict, IMDCTMessageDictionarySubjectKey, v46);
  }

  v47 = [v101 contentType];
  if (v47) {
    CFDictionarySetValue(theDict, IMDCTMessageDictionaryContentTypeKey, v47);
  }

  id v48 = +[NSNumber numberWithInt:](NSNumber, "numberWithInt:", [v101 replaceMessage]);
  if (v48) {
    CFDictionarySetValue(theDict, IMDCTMessageDictionaryReplaceMessageKey, v48);
  }

  id v49 = v35;
  if (v49)
  {
    id v50 = v49;
    CFDictionarySetValue(theDict, IMDCTMessageDictionaryCountryCodeKey, v49);
    id v49 = v50;
  }
  v90 = v49;

  uint64_t v51 = +[NSNumber numberWithBool:](NSNumber, "numberWithBool:", [v101 replyEnabled]);
  if (v51) {
    CFDictionarySetValue(theDict, IMDCTMessageDictionarySendEnabledKey, v51);
  }

  if (IMOSLoggingEnabled())
  {
    v52 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v52, OS_LOG_TYPE_INFO))
    {
      unsigned int v53 = [v101 replyEnabled];
      CFStringRef v54 = @"NO";
      if (v53) {
        CFStringRef v54 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v115 = v54;
      _os_log_impl(&dword_0, v52, OS_LOG_TYPE_INFO, "Telephony reply enabled: %@", buf, 0xCu);
    }
  }
  if (objc_opt_respondsToSelector())
  {
    id v55 = [v101 uniqueIdentifier];

    id v56 = v55;
  }
  else
  {
    id v56 = 0;
  }
  v93 = v56;
  if (objc_opt_respondsToSelector())
  {
    id v57 = [v93 UUIDString];
  }
  else
  {
    id v57 = 0;
  }
  v99 = +[IMCTSMSUtilities IMMMSEmailAddressToMatchForPhoneNumber:v97 simID:v96];
  if ([v99 length])
  {
    id v58 = v99;
    if (v58) {
      CFDictionarySetValue(theDict, IMDCTMessageDictionaryOriginatedDeviceEmailKey, v58);
    }
  }
  if (v57)
  {
    id v59 = v57;
LABEL_92:
    v95 = v59;
    CFDictionarySetValue(theDict, IMDCTMessageDictionaryGUIDKey, v59);

    goto LABEL_93;
  }
  StringGUID();
  id v59 = (id)objc_claimAutoreleasedReturnValue();
  if (v59) {
    goto LABEL_92;
  }
  v95 = 0;
LABEL_93:
  uint64_t v60 = IMChatCanonicalIDSIDsForAddress();
  id v61 = [v60 lowercaseString];
  id v62 = +[NSMutableString stringWithFormat:@"s:%@", v61];

  id v63 = objc_alloc_init((Class)NSMutableArray);
  long long v107 = 0u;
  long long v108 = 0u;
  long long v105 = 0u;
  long long v106 = 0u;
  id v64 = [v101 items];
  id v65 = [v64 countByEnumeratingWithState:&v105 objects:v113 count:16];
  if (v65)
  {
    uint64_t v66 = *(void *)v106;
    do
    {
      for (j = 0; j != v65; j = (char *)j + 1)
      {
        if (*(void *)v106 != v66) {
          objc_enumerationMutation(v64);
        }
        CFStringRef v68 = *(const __CFString **)(*((void *)&v105 + 1) + 8 * (void)j);
        v69 = [(SMSServiceSession *)self _convertCTMessagePartToDictionary:v68];
        if (v69)
        {
          long long v70 = +[IMDXMSUtilities calculateFallbackHashFragmentFor:v69];
          [v62 appendString:v70];
          [v63 addObject:v69];
        }
        else if (IMOSLoggingEnabled())
        {
          long long v71 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v71, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            CFStringRef v115 = v68;
            _os_log_impl(&dword_0, v71, OS_LOG_TYPE_INFO, "Empty message part dictionary generated from: %@", buf, 0xCu);
          }
        }
      }
      id v65 = [v64 countByEnumeratingWithState:&v105 objects:v113 count:16];
    }
    while (v65);
  }

  if (IMOSLoggingEnabled())
  {
    long long v72 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v72, OS_LOG_TYPE_INFO))
    {
      CFStringRef v73 = (const __CFString *)[v62 length];
      *(_DWORD *)buf = 134217984;
      CFStringRef v115 = v73;
      _os_log_impl(&dword_0, v72, OS_LOG_TYPE_INFO, "Generated fallback hash with length %llu for message", buf, 0xCu);
    }
  }
  id v74 = v62;
  if (v74) {
    CFDictionarySetValue(theDict, IMDCTMessageDictionaryFallbackHashKey, v74);
  }

  id v75 = v63;
  if (v75) {
    CFDictionarySetValue(theDict, IMDCTMessageDictionaryItemsKey, v75);
  }

  CFDictionarySetValue(theDict, IMDRelaySpamSubCategoryKey, &off_90CF0);
  long long v76 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v77 = [v76 isSMSFilterSyncEnabled];

  if (v77)
  {
    long long v78 = [(SMSServiceSession *)self filteringController];
    unsigned int v79 = [v78 _isSpamFilteringEnabled];

    long long v80 = [(SMSServiceSession *)self filteringController];
    id v81 = [v80 _newSMSFilteringSettingsDictForFilterState:v79];
    [(__CFDictionary *)theDict addEntriesFromDictionary:v81];
  }
  unsigned int v82 = +[IMCTSMSUtilities shouldUploadToMMCS:theDict];
  int v83 = IMOSLoggingEnabled();
  if (v82)
  {
    if (v83)
    {
      long long v84 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v84, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v84, OS_LOG_TYPE_INFO, "We were told this message has things that make it to large to send by itself over IDS, If we choose to send this message onwards, it will require upload to MMCS", buf, 2u);
      }
    }
    if (a4) {
      *a4 = 1;
    }
  }
  else if (v83)
  {
    long long v85 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v85, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v85, OS_LOG_TYPE_INFO, "This Message is JUST the right size that we can send it over IDS, so let it go on its way", buf, 2u);
    }
  }
  if ((IMGetCachedDomainBoolForKey() & 1) == 0)
  {
    v86 = +[CTMessageCenter sharedMessageCenter];
    objc_msgSend(v86, "acknowledgeIncomingMessageWithId:", objc_msgSend(v101, "messageId"));
  }
  if (IMOSLoggingEnabled())
  {
    v87 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v87, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_0, v87, OS_LOG_TYPE_INFO, "Finished Converting CTMessage To NSDictionary", buf, 2u);
    }
  }
  v88 = theDict;

  return v88;
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
  id v5 = (__CFDictionary *)objc_alloc_init((Class)NSMutableDictionary);
  id v6 = [v3 contentType];
  if (v6) {
    CFDictionarySetValue(v5, IMDCTPartDictionaryContentTypeKey, v6);
  }

  id v7 = [v3 contentId];
  if (v7) {
    CFDictionarySetValue(v5, IMDCTPartDictionaryContentIDKey, v7);
  }

  id v8 = [v3 contentLocation];
  if (v8) {
    CFDictionarySetValue(v5, IMDCTPartDictionaryContentLocationKey, v8);
  }

  int v9 = [v3 data];
  if (v9) {
    CFDictionarySetValue(v5, IMDCTPartDictionaryContentDataKey, v9);
  }

  return v5;
}

- (unsigned)_generateMessageIDForMessageGUID:(id)a3
{
  id v4 = a3;
  if ([v4 length])
  {
    id v5 = [(NSMutableDictionary *)self->_outgoingMessageMap objectForKey:v4];
    if (v5)
    {
      if (IMOSLoggingEnabled())
      {
        id v6 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
        {
          int v14 = 138412546;
          id v15 = v4;
          __int16 v16 = 2112;
          id v17 = v5;
          _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Using existing mapping mapping from %@ to %@", (uint8_t *)&v14, 0x16u);
        }
      }
      unsigned int v7 = [v5 unsignedIntValue];
    }
    else
    {
      id v8 = +[NSNumber numberWithUnsignedInt:FastRandomUInt() % 0x186A0];
      outgoingMessageMap = self->_outgoingMessageMap;
      if (!outgoingMessageMap)
      {
        Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
        int v11 = self->_outgoingMessageMap;
        self->_outgoingMessageMap = Mutable;

        outgoingMessageMap = self->_outgoingMessageMap;
      }
      [(NSMutableDictionary *)outgoingMessageMap setObject:v8 forKey:v4];
      if (IMOSLoggingEnabled())
      {
        id v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          int v14 = 138412546;
          id v15 = v4;
          __int16 v16 = 2112;
          id v17 = v8;
          _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "Generated mapping from %@ to %@", (uint8_t *)&v14, 0x16u);
        }
      }
      unsigned int v7 = [v8 unsignedIntValue];
    }
  }
  else
  {
    unsigned int v7 = 0;
  }

  return v7;
}

- (void)_registerMessageGUID:(id)a3 completionBlock:(id)a4 failureBlock:(id)a5
{
  id v20 = a3;
  id v8 = a4;
  id v9 = a5;
  if (!self->_outgoingMessageBlockMap)
  {
    Mutable = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
    outgoingMessageBlockMap = self->_outgoingMessageBlockMap;
    self->_outgoingMessageBlockMap = Mutable;
  }
  if (self->_outgoingMessageFailureMap)
  {
    if (!v8) {
      goto LABEL_6;
    }
    goto LABEL_5;
  }
  uint64_t v18 = (NSMutableDictionary *)CFDictionaryCreateMutable(0, 0, &kCFTypeDictionaryKeyCallBacks, &kCFTypeDictionaryValueCallBacks);
  outgoingMessageFailureMap = self->_outgoingMessageFailureMap;
  self->_outgoingMessageFailureMap = v18;

  if (v8)
  {
LABEL_5:
    id v12 = self->_outgoingMessageBlockMap;
    id v13 = [v8 copy];
    id v14 = objc_retainBlock(v13);
    [(NSMutableDictionary *)v12 setObject:v14 forKey:v20];
  }
LABEL_6:
  if (v9)
  {
    id v15 = self->_outgoingMessageFailureMap;
    id v16 = [v9 copy];
    id v17 = objc_retainBlock(v16);
    [(NSMutableDictionary *)v15 setObject:v17 forKey:v20];
  }
}

- (id)_messageGUIDForMessageID:(int)a3
{
  outgoingMessageMap = self->_outgoingMessageMap;
  id v4 = +[NSNumber numberWithInt:*(void *)&a3];
  id v5 = [(NSMutableDictionary *)outgoingMessageMap allKeysForObject:v4];
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
    id v5 = OSLogHandleForIMFoundationCategory();
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

- (void)didReceiveError:(unsigned int)a3 forMessageID:(id)a4 forceError:(BOOL)a5 account:(id)a6
{
  BOOL v6 = a5;
  uint64_t v8 = *(void *)&a3;
  id v10 = a6;
  id v11 = a4;
  id v12 = [(SMSServiceSession *)self _failureBlockForMessageGUID:v11];
  [(SMSServiceSession *)self _clearMapForMessageGUID:v11];
  v14.receiver = self;
  v14.super_class = (Class)SMSServiceSession;
  [(SMSServiceSession *)&v14 didReceiveError:v8 forMessageID:v11 forceError:v6 account:v10];

  if (v12)
  {
    if (v8) {
      uint64_t v13 = v8;
    }
    else {
      uint64_t v13 = 4;
    }
    v12[2](v12, v13, 0);
  }
}

- (void)_processMessageSentID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = -[SMSServiceSession _messageGUIDForMessageID:](self, "_messageGUIDForMessageID:");
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v6 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        v13[0] = 67109378;
        v13[1] = v3;
        __int16 v14 = 2112;
        id v15 = v5;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Sent message: %u  (guid: %@)", (uint8_t *)v13, 0x12u);
      }
    }
    if ([*(id *)&self->IMDTelephonyServiceSession_opaque[OBJC_IVAR___IMDTelephonyServiceSession__originatedMessages] containsObject:v5])
    {
      [(SMSServiceSession *)self notifyDidSendMessageID:v5 shouldNotify:1];
      [(SMSServiceSession *)self _removeOriginatedMessage:v5];
    }
    else
    {
      [(SMSServiceSession *)self notifyDidSendMessageID:v5 shouldNotify:0];
    }
    if ((IMGetCachedDomainBoolForKey() & 1) == 0)
    {
      unsigned int v7 = +[CTMessageCenter sharedMessageCenter];
      [v7 acknowledgeOutgoingMessageWithId:v3];
    }
    uint64_t v8 = [(SMSServiceSession *)self _completionBlockForMessageGUID:v5];
    int v9 = (void *)v8;
    if (v8) {
      (*(void (**)(uint64_t))(v8 + 16))(v8);
    }
    [(SMSServiceSession *)self _clearMapForMessageGUID:v5];
    id v10 = [(SMSServiceSession *)self relayController];
    id v11 = [(SMSServiceSession *)self service];
    id v12 = [v11 internalName];
    [v10 messageSent:v5 onService:v12 compatibilityService:0];
  }
}

- (void)_processMessageSendFailureID:(unsigned int)a3
{
  uint64_t v3 = *(void *)&a3;
  id v5 = -[SMSServiceSession _messageGUIDForMessageID:](self, "_messageGUIDForMessageID:");
  if (v5)
  {
    if (IMOSLoggingEnabled())
    {
      BOOL v6 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
      {
        int v9 = 67109378;
        *(_DWORD *)id v10 = v3;
        *(_WORD *)&v10[4] = 2112;
        *(void *)&v10[6] = v5;
        _os_log_impl(&dword_0, v6, OS_LOG_TYPE_INFO, "Failed to send message: %u   (guid: %@)", (uint8_t *)&v9, 0x12u);
      }
    }
    if (IMOSLoggingEnabled())
    {
      unsigned int v7 = OSLogHandleForIMEventCategory();
      if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412546;
        *(void *)id v10 = v5;
        *(_WORD *)&v10[8] = 1024;
        *(_DWORD *)&v10[10] = v3;
        _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "Error sending message: %@ CT Failed to send message with messageID %u", (uint8_t *)&v9, 0x12u);
      }
    }
    [(SMSServiceSession *)self didReceiveError:4 forMessageID:v5 forceError:1];
    if ((IMGetCachedDomainBoolForKey() & 1) == 0)
    {
      uint64_t v8 = +[CTMessageCenter sharedMessageCenter];
      [v8 acknowledgeOutgoingMessageWithId:v3];
    }
    [(SMSServiceSession *)self processMessageSendFailure:v5];
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
    id v5 = [v4 allIncomingMessages];

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
        uint64_t v8 = 0;
        do
        {
          if (*(void *)v17 != v7) {
            objc_enumerationMutation(obj);
          }
          uint64_t v9 = *(void *)(*((void *)&v16 + 1) + 8 * (void)v8);
          buf[0] = 0;
          id v10 = [(SMSServiceSession *)self _convertCTMessageToDictionary:v9 requiresUpload:buf];
          v13[0] = _NSConcreteStackBlock;
          v13[1] = 3221225472;
          _DWORD v13[2] = sub_A910;
          v13[3] = &unk_8CFE0;
          v13[4] = self;
          id v14 = v10;
          uint8_t v15 = buf[0];
          id v11 = v10;
          [(SMSServiceSession *)self _processReceivedDictionary:v11 storageContext:0 receivedViaRelay:0 withCompletionBlock:v13];

          uint64_t v8 = (char *)v8 + 1;
        }
        while (v6 != v8);
        id v6 = [obj countByEnumeratingWithState:&v16 objects:v21 count:16];
      }
      while (v6);
    }
  }
}

- (id)makeSenderFor:(id)a3 forChat:(id)a4 chatStyle:(unsigned __int8)a5 recipients:(id)a6
{
  uint64_t v6 = a5;
  id v10 = a6;
  id v11 = a4;
  id v12 = a3;
  uint64_t v13 = [[SMSMessageSender alloc] initWithSession:self forMessage:v12 chat:v11 chatStyle:v6 recipients:v10];

  [(SMSMessageSender *)v13 deriveConfiguration];

  return v13;
}

- (void)_doDeleteChat:(id)a3
{
  id v4 = a3;
  id v5 = [(SMSServiceSession *)self broadcasterForChatListeners];
  uint64_t v6 = [v4 guid];
  [v5 leftChat:v6];

  id v7 = [(SMSServiceSession *)self chatRegistry];
  [v7 removeChat:v4];
}

- (id)_getStorageDictionaryUsingMsgDict:(id)a3 requiresUpload:(BOOL)a4
{
  BOOL v4 = a4;
  id v5 = a3;
  id v6 = objc_alloc((Class)NSDictionary);
  id v7 = off_99420;
  uint64_t v8 = +[NSNumber numberWithBool:v4];
  id v9 = objc_msgSend(v6, "initWithObjectsAndKeys:", v5, v7, v8, off_99428, 0);

  return v9;
}

- (void)_receivedSMSDictionary:(id)a3 requiresUpload:(BOOL)a4 isBeingReplayed:(BOOL)a5
{
  v5[0] = _NSConcreteStackBlock;
  v5[1] = 3221225472;
  v5[2] = sub_AC10;
  v5[3] = &unk_8D008;
  BOOL v6 = a5;
  v5[4] = self;
  [(SMSServiceSession *)self _processReceivedDictionary:a3 storageContext:0 receivedViaRelay:0 withCompletionBlock:v5];
}

- (void)replayMessage:(id)a3
{
  id v4 = a3;
  objc_opt_class();
  if ((objc_opt_isKindOfClass() & 1) != 0
    && ([v4 objectForKey:off_99420],
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
    id v7 = [v4 objectForKey:off_99420];
    uint64_t v8 = [v4 objectForKey:off_99428];
    unsigned __int8 v9 = [v8 BOOLValue];

    v12[0] = _NSConcreteStackBlock;
    v12[1] = 3221225472;
    v12[2] = sub_AFC4;
    v12[3] = &unk_8D030;
    v12[4] = self;
    id v13 = v7;
    unsigned __int8 v14 = v9;
    id v10 = v7;
    [(SMSServiceSession *)self _enqueueBlock:v12 withTimeout:240.0];
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
    [(IMDRelayPushHandler *)self->_smsRelayPushHandler replayMessage:v4];
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
    v6[2] = sub_B0D4;
    v6[3] = &unk_8D058;
    id v7 = v4;
    [(SMSServiceSession *)self _enqueueBlock:v6 withTimeout:10.0];
  }
}

- (void)networkMonitorDidUpdate:(id)a3
{
  id v4 = a3;
  v7.receiver = self;
  v7.super_class = (Class)SMSServiceSession;
  [(SMSServiceSession *)&v7 networkMonitorDidUpdate:v4];
  id v5 = +[IMFeatureFlags sharedFeatureFlags];
  unsigned int v6 = [v5 isCarrierPigeonEnabled];

  if (v6 && [v4 immediatelyReachable]) {
    [(SMSServiceSession *)self _processMessagesForRelayIfNeeded];
  }
}

- (void)_processMessagesForRelayIfNeeded
{
  if (IMGetCachedDomainBoolForKey())
  {
    if (IMOSLoggingEnabled())
    {
      v2 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v2, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_0, v2, OS_LOG_TYPE_INFO, "Processing SMS Satellite messages for relay", buf, 2u);
      }
    }
    uint64_t v3 = +[IMDServiceController sharedController];
    id v4 = [v3 serviceWithName:IMServiceNameSatelliteSMS];

    *(void *)buf = 0;
    id v13 = buf;
    uint64_t v14 = 0x2020000000;
    char v15 = 1;
    id v5 = +[IMDMessageStore sharedInstance];
    v9[0] = _NSConcreteStackBlock;
    v9[1] = 3221225472;
    void v9[2] = sub_B3BC;
    v9[3] = &unk_8D080;
    id v6 = v4;
    id v10 = v6;
    id v11 = buf;
    [v5 enumerateMessagesToRelayOnService:v6 usingBlock:v9];

    if (v13[24])
    {
      if (IMOSLoggingEnabled())
      {
        objc_super v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)uint64_t v8 = 0;
          _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "All SMS Satellite messages have been relayed, resetting user default", v8, 2u);
        }
      }
      IMSetDomainBoolForKey();
    }

    _Block_object_dispose(buf, 8);
  }
}

- (void)_processSMSOrSMSMessageSentWithContext:(id)a3 success:(BOOL)a4 messageID:(unsigned int)a5 err1:(int64_t)a6 err2:(int64_t)a7 isSMS:(BOOL)a8
{
  v17[0] = _NSConcreteStackBlock;
  v17[1] = 3221225472;
  v17[2] = sub_B830;
  v17[3] = &unk_8D0A8;
  BOOL v23 = a8;
  id v13 = a3;
  BOOL v24 = a4;
  unsigned int v22 = a5;
  int64_t v20 = a6;
  int64_t v21 = a7;
  id v18 = v13;
  long long v19 = self;
  uint64_t v14 = objc_retainBlock(v17);
  if (+[NSThread isMainThread])
  {
    ((void (*)(void *))v14[2])(v14);
  }
  else
  {
    v15[0] = _NSConcreteStackBlock;
    v15[1] = 3221225472;
    v15[2] = sub_B9E8;
    v15[3] = &unk_8D0D0;
    id v16 = v14;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v15);
  }
}

- (void)_processSMSorMMSMessageReceivedWithContext:(id)a3 messageID:(int64_t)a4
{
  v8[0] = _NSConcreteStackBlock;
  v8[1] = 3221225472;
  v8[2] = sub_BB24;
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
    v6[2] = sub_C184;
    v6[3] = &unk_8D0D0;
    objc_super v7 = v5;
    dispatch_sync((dispatch_queue_t)&_dispatch_main_q, v6);
  }
}

- (void)smsMessageReceived:(id)a3 msgID:(int64_t)a4
{
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    objc_super v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = +[NSNumber numberWithInteger:a4];
      int v9 = 138412290;
      int64_t v10 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "SMS Message received %@", (uint8_t *)&v9, 0xCu);
    }
  }
  [(SMSServiceSession *)self _processSMSorMMSMessageReceivedWithContext:v6 messageID:a4];
}

- (void)mmsMessageReceived:(id)a3 msgID:(int64_t)a4
{
  id v6 = a3;
  if (IMOSLoggingEnabled())
  {
    objc_super v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      uint64_t v8 = +[NSNumber numberWithInteger:a4];
      int v9 = 138412290;
      int64_t v10 = v8;
      _os_log_impl(&dword_0, v7, OS_LOG_TYPE_INFO, "SMS Message received %@", (uint8_t *)&v9, 0xCu);
    }
  }
  [(SMSServiceSession *)self _processSMSorMMSMessageReceivedWithContext:v6 messageID:a4];
}

- (void)postMMSMessageSent:(id)a3 success:(BOOL)a4 messageID:(int64_t)a5 err1:(int64_t)a6 err2:(int64_t)a7
{
}

- (void)postSMSMessageSent:(id)a3 success:(BOOL)a4 messageID:(int64_t)a5 err1:(int64_t)a6 err2:(int64_t)a7
{
}

- (BOOL)_messageDowngradesWhenSentFromCurrentService:(id)a3
{
  uint64_t v3 = [a3 service];
  unsigned __int8 v4 = [v3 isEqualToString:IMServiceNameRCS];

  return v4;
}

- (NSMutableDictionary)outgoingMessageMap
{
  return self->_outgoingMessageMap;
}

- (void)setOutgoingMessageMap:(id)a3
{
}

- (NSMutableDictionary)outgoingMessageBlockMap
{
  return self->_outgoingMessageBlockMap;
}

- (void)setOutgoingMessageBlockMap:(id)a3
{
}

- (NSMutableDictionary)outgoingMessageFailureMap
{
  return self->_outgoingMessageFailureMap;
}

- (void)setOutgoingMessageFailureMap:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_outgoingMessageFailureMap, 0);
  objc_storeStrong((id *)&self->_outgoingMessageBlockMap, 0);
  objc_storeStrong((id *)&self->_outgoingMessageMap, 0);
  objc_storeStrong((id *)&self->coreTelephonyClient, 0);
  objc_storeStrong((id *)&self->_outgoingRelayMessageTimerMap, 0);

  objc_storeStrong((id *)&self->_smsRelayPushHandler, 0);
}

- (uint64_t)calculateReachabilityWithRequest:(void *)a3 responseHandler:(uint64_t)a4
{
  id v6 = a3;
  swift_unknownObjectRetain();
  id v7 = a1;
  uint64_t v8 = sub_5C954();
  (*(void (**)(id, uint64_t))(*v8 + 96))(v6, a4);

  swift_unknownObjectRelease();

  return swift_release();
}

@end