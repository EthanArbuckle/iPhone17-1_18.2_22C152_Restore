@interface SMSMessageSender
- (BOOL)replicated;
- (BOOL)sendAsGroupMessage;
- (BOOL)shouldSendMMS;
- (CTXPCServiceSubscriptionContext)context;
- (IMDChat)chat;
- (IMDTelephonyServiceSession)session;
- (IMMessageItem)message;
- (IMMessageItem)outputMessage;
- (NSArray)outgoing;
- (NSArray)recipients;
- (SMSMessageSender)initWithSession:(id)a3 forMessage:(id)a4 chat:(id)a5 chatStyle:(unsigned __int8)a6 recipients:(id)a7;
- (id)chatIdentifier;
- (unsigned)chatStyle;
- (unsigned)style;
- (void)buildWith:(id)a3 parts:(id)a4 completion:(id)a5;
- (void)cleanupFailedBuildWithError:(unsigned int)a3 forParts:(id)a4;
- (void)deriveConfiguration;
- (void)prepareWithCompletion:(id)a3;
- (void)sendWithCompletion:(id)a3;
- (void)setContext:(id)a3;
- (void)setOutgoing:(id)a3;
- (void)setOutputMessage:(id)a3;
- (void)setReplicated:(BOOL)a3;
- (void)setSendAsGroupMessage:(BOOL)a3;
- (void)setShouldSendMMS:(BOOL)a3;
@end

@implementation SMSMessageSender

- (SMSMessageSender)initWithSession:(id)a3 forMessage:(id)a4 chat:(id)a5 chatStyle:(unsigned __int8)a6 recipients:(id)a7
{
  id v13 = a3;
  id v14 = a4;
  id v15 = a5;
  id v16 = a7;
  v22.receiver = self;
  v22.super_class = (Class)SMSMessageSender;
  v17 = [(SMSMessageSender *)&v22 init];
  v18 = v17;
  if (v17)
  {
    objc_storeStrong((id *)&v17->_session, a3);
    objc_storeStrong((id *)&v18->_message, a4);
    objc_storeStrong((id *)&v18->_chat, a5);
    v18->_style = a6;
    objc_storeStrong((id *)&v18->_recipients, a7);
    v19 = (NSArray *)objc_alloc_init((Class)NSArray);
    outgoing = v18->_outgoing;
    v18->_outgoing = v19;
  }
  return v18;
}

- (void)deriveConfiguration
{
  long long v52 = 0u;
  long long v53 = 0u;
  long long v54 = 0u;
  long long v55 = 0u;
  v2 = [(SMSMessageSender *)self recipients];
  char v3 = 0;
  id v4 = [v2 countByEnumeratingWithState:&v52 objects:v68 count:16];
  if (v4)
  {
    uint64_t v5 = *(void *)v53;
    uint64_t v6 = IMDMessageStoreHandleCanonicalIDKey;
    do
    {
      for (i = 0; i != v4; i = (char *)i + 1)
      {
        if (*(void *)v53 != v5) {
          objc_enumerationMutation(v2);
        }
        v8 = [*(id *)(*((void *)&v52 + 1) + 8 * i) objectForKey:v6];
        char IsEmail = IMStringIsEmail();

        v3 |= IsEmail;
      }
      id v4 = [v2 countByEnumeratingWithState:&v52 objects:v68 count:16];
    }
    while (v4);
  }

  v10 = [(SMSMessageSender *)self smsSession];
  v11 = [(SMSMessageSender *)self chat];
  unsigned int v50 = [v10 isGroupMessagingEnabledFor:v11];

  unsigned int v12 = [(SMSMessageSender *)self style];
  id v13 = [(SMSMessageSender *)self smsSession];
  id v14 = [v13 relayController];
  id v15 = [(SMSMessageSender *)self chat];
  id v16 = [v15 lastAddressedLocalHandle];
  v17 = [(SMSMessageSender *)self chat];
  v18 = [v17 lastAddressedSIMID];
  id v19 = [v14 _checkMMSEnablementForPhoneNumber:v16 simID:v18];

  v20 = [(SMSMessageSender *)self message];
  v21 = [v20 subject];
  id v22 = [v21 length];

  v23 = [(SMSMessageSender *)self message];
  v24 = [v23 fileTransferGUIDs];
  id v25 = [v24 count];

  v26 = [(SMSMessageSender *)self message];
  v27 = [v26 balloonBundleID];
  unsigned int v28 = [v27 isEqualToString:IMBalloonPluginIdentifierRichLinks];

  if ((v22 != 0) | v3 & 1 || !((v25 == 0) | v28))
  {
    if (v19)
    {
      uint64_t v30 = 1;
      goto LABEL_39;
    }
  }
  else
  {
    if (v12 == 45) {
      unsigned int v29 = 0;
    }
    else {
      unsigned int v29 = v50;
    }
    if ((v29 ^ 1 | v19))
    {
      uint64_t v30 = v29 & v19;
      goto LABEL_39;
    }
  }
  if (IMOSLoggingEnabled())
  {
    v31 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v31, OS_LOG_TYPE_INFO))
    {
      CFStringRef v32 = @"NO";
      if (v22) {
        CFStringRef v33 = @"YES";
      }
      else {
        CFStringRef v33 = @"NO";
      }
      if (v3) {
        CFStringRef v34 = @"YES";
      }
      else {
        CFStringRef v34 = @"NO";
      }
      *(_DWORD *)buf = 138413570;
      CFStringRef v57 = v33;
      if (v25) {
        CFStringRef v35 = @"YES";
      }
      else {
        CFStringRef v35 = @"NO";
      }
      __int16 v58 = 2112;
      CFStringRef v59 = v34;
      if (v28) {
        CFStringRef v36 = @"YES";
      }
      else {
        CFStringRef v36 = @"NO";
      }
      __int16 v60 = 2112;
      CFStringRef v61 = v35;
      if (v12 == 45) {
        CFStringRef v37 = @"NO";
      }
      else {
        CFStringRef v37 = @"YES";
      }
      __int16 v62 = 2112;
      CFStringRef v63 = v36;
      if (v50) {
        CFStringRef v32 = @"YES";
      }
      __int16 v64 = 2112;
      CFStringRef v65 = v37;
      __int16 v66 = 2112;
      CFStringRef v67 = v32;
      _os_log_impl(&dword_0, v31, OS_LOG_TYPE_INFO, "Wants to send MMS, but MMS is not enabled. Feature will be lost or recipients missed (hasSubject %@ hasEmail %@ hasTransfer %@ isRichLink %@ isGroup %@ groupsEnabled %@)", buf, 0x3Eu);
    }
  }
  uint64_t v30 = (uint64_t)v19;
LABEL_39:
  [(SMSMessageSender *)self setShouldSendMMS:v30];
  if (v12 != 45)
  {
    [(SMSMessageSender *)self setSendAsGroupMessage:v50 & v19];
    if (![(SMSMessageSender *)self sendAsGroupMessage])
    {
      if (IMOSLoggingEnabled())
      {
        v38 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v38, OS_LOG_TYPE_INFO))
        {
          CFStringRef v39 = @"NO";
          if (v50) {
            CFStringRef v40 = @"YES";
          }
          else {
            CFStringRef v40 = @"NO";
          }
          if (v19) {
            CFStringRef v39 = @"YES";
          }
          *(_DWORD *)buf = 138412546;
          CFStringRef v57 = v40;
          __int16 v58 = 2112;
          CFStringRef v59 = v39;
          _os_log_impl(&dword_0, v38, OS_LOG_TYPE_INFO, "isGroupChat, but can't send group message isGroupMessagingEnabled %@ isMMSEnabled %@", buf, 0x16u);
        }
      }
    }
  }
  if (IMOSLoggingEnabled())
  {
    v41 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v41, OS_LOG_TYPE_INFO))
    {
      unsigned int v42 = [(SMSMessageSender *)self shouldSendMMS];
      CFStringRef v43 = @"NO";
      if (v42) {
        CFStringRef v43 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v57 = v43;
      _os_log_impl(&dword_0, v41, OS_LOG_TYPE_INFO, "        Should Send MMS: %@", buf, 0xCu);
    }
  }
  if (IMOSLoggingEnabled())
  {
    v44 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
    {
      unsigned int v45 = [(SMSMessageSender *)self sendAsGroupMessage];
      CFStringRef v46 = @"NO";
      if (v45) {
        CFStringRef v46 = @"YES";
      }
      *(_DWORD *)buf = 138412290;
      CFStringRef v57 = v46;
      _os_log_impl(&dword_0, v44, OS_LOG_TYPE_INFO, "  Send as Group Message: %@", buf, 0xCu);
    }
  }
  v47 = [(SMSMessageSender *)self session];
  v48 = [(SMSMessageSender *)self chat];
  v49 = [v47 subscriptionContextForChat:v48];

  [(SMSMessageSender *)self setContext:v49];
}

- (void)prepareWithCompletion:(id)a3
{
  id v4 = a3;
  id v12 = [(SMSMessageSender *)self smsSession];
  uint64_t v5 = [v12 attachmentController];
  uint64_t v6 = [(SMSMessageSender *)self message];
  BOOL v7 = [(SMSMessageSender *)self shouldSendMMS];
  v8 = [(SMSMessageSender *)self chat];
  v9 = [v8 lastAddressedLocalHandle];
  v10 = [(SMSMessageSender *)self chat];
  v11 = [v10 lastAddressedSIMID];
  [v5 processAttachmentsForMessage:v6 generateTextParts:v7 lastAddressedHandle:v9 lastAddressedSIMID:v11 completionBlock:v4];
}

- (unsigned)chatStyle
{
  v2 = [(SMSMessageSender *)self chat];
  unsigned __int8 v3 = [v2 style];

  return v3;
}

- (id)chatIdentifier
{
  v2 = [(SMSMessageSender *)self chat];
  unsigned __int8 v3 = [v2 chatIdentifier];

  return v3;
}

- (void)buildWith:(id)a3 parts:(id)a4 completion:(id)a5
{
  id v46 = a3;
  id v44 = a4;
  unsigned int v45 = (void (**)(id, uint64_t))a5;
  v8 = [(SMSMessageSender *)self context];

  if (v8)
  {
    [(SMSMessageSender *)self setOutputMessage:v46];
    id v47 = objc_alloc_init((Class)NSDate);
    v9 = [(SMSMessageSender *)self smsSession];
    v10 = [(SMSMessageSender *)self recipients];
    id v11 = objc_msgSend(v9, "newTelephonyMessagesForHandles:shouldBroadcastMessage:", v10, -[SMSMessageSender sendAsGroupMessage](self, "sendAsGroupMessage") ^ 1);

    id v12 = [(SMSMessageSender *)self smsSession];
    id v13 = [(SMSMessageSender *)self message];
    [v12 setSubjectForTelephonyMessages:v11 messageItem:v13];

    if (![(SMSMessageSender *)self shouldSendMMS])
    {
      id v14 = [(SMSMessageSender *)self smsSession];
      id v15 = [(SMSMessageSender *)self message];
      id v16 = [(SMSMessageSender *)self outputMessage];
      [v14 addMessagePlainTextToTelephonyMessages:v11 messageItem:v15 processedMessageItem:v16];
    }
    v17 = [(SMSMessageSender *)self smsSession];
    BOOL v18 = [(SMSMessageSender *)self chatStyle] != 45;
    id v19 = [(SMSMessageSender *)self chat];
    v20 = [v19 lastAddressedLocalHandle];
    v21 = [(SMSMessageSender *)self chat];
    id v22 = [v21 lastAddressedSIMID];
    [v17 processPartsOfTelephonyMessages:v11 parts:v44 messageItem:v46 isGroupChat:v18 phoneNumber:v20 simID:v22];

    v23 = [(SMSMessageSender *)self smsSession];
    LODWORD(v22) = [(SMSMessageSender *)self sendAsGroupMessage];
    v24 = [(SMSMessageSender *)self recipients];
    [v23 buildTelephonyPhoneNumbersForTelephonyMessages:v11 shouldBroadcastMessage:v22 ^ 1 handles:v24];

    long long v57 = 0u;
    long long v58 = 0u;
    long long v55 = 0u;
    long long v56 = 0u;
    id obj = v11;
    id v50 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
    if (v50)
    {
      uint64_t v49 = *(void *)v56;
      char v25 = 1;
      do
      {
        for (i = 0; i != v50; i = (char *)i + 1)
        {
          if (*(void *)v56 != v49) {
            objc_enumerationMutation(obj);
          }
          v27 = *(void **)(*((void *)&v55 + 1) + 8 * i);
          [v27 setServiceCenter:0];
          if (v25)
          {
            unsigned int v28 = [(SMSMessageSender *)self message];
            unsigned int v29 = [v28 guid];
          }
          else
          {
            unsigned int v29 = +[NSString stringGUID];
          }
          uint64_t v30 = [(SMSMessageSender *)self smsSession];
          objc_msgSend(v27, "setMessageId:", objc_msgSend(v30, "_generateMessageIDForMessageGUID:", v29));

          v31 = [(SMSMessageSender *)self smsSession];
          if (v25)
          {
            CFStringRef v32 = v53;
            v53[0] = _NSConcreteStackBlock;
            v53[1] = 3221225472;
            v53[2] = sub_FC9C;
            v53[3] = &unk_8D228;
            v53[4] = self;
            id v54 = v47;
            CFStringRef v33 = v51;
            v51[0] = _NSConcreteStackBlock;
            v51[1] = 3221225472;
            v51[2] = sub_FF7C;
            v51[3] = &unk_8D250;
            v51[4] = self;
            id v52 = v54;
          }
          else
          {
            CFStringRef v32 = 0;
            CFStringRef v33 = 0;
          }
          [v31 _registerMessageGUID:v29 completionBlock:v32 failureBlock:v33];

          CFStringRef v34 = [(SMSMessageSender *)self smsSession];
          objc_msgSend(v34, "setMessageTypeForTelephonyMessage:shouldSendMMS:", v27, -[SMSMessageSender shouldSendMMS](self, "shouldSendMMS"));

          CFStringRef v35 = [(SMSMessageSender *)self chat];
          CFStringRef v36 = [v35 lastAddressedLocalHandle];

          CFStringRef v37 = [(SMSMessageSender *)self chat];
          v38 = [v37 lastAddressedSIMID];

          if (IMOSLoggingEnabled())
          {
            CFStringRef v39 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
            {
              CFStringRef v40 = [(SMSMessageSender *)self chat];
              v41 = [v40 guid];
              *(_DWORD *)buf = 138412802;
              __int16 v60 = v41;
              __int16 v61 = 2112;
              __int16 v62 = v36;
              __int16 v63 = 2112;
              __int16 v64 = v38;
              _os_log_impl(&dword_0, v39, OS_LOG_TYPE_INFO, "Not first chat (%@): lastAddressedLocalHandle %@ lastAddressedSIMID %@", buf, 0x20u);
            }
          }
          unsigned int v42 = [(SMSMessageSender *)self context];
          [v27 setContext:v42];

          if (v25)
          {
          }
          char v25 = 0;
        }
        id v50 = [obj countByEnumeratingWithState:&v55 objects:v65 count:16];
        char v25 = 0;
      }
      while (v50);
    }

    [(SMSMessageSender *)self setOutgoing:obj];
    if (v45) {
      v45[2](v45, 1);
    }

    CFStringRef v43 = v45;
  }
  else
  {
    CFStringRef v43 = v45;
    if (v45) {
      v45[2](v45, 0);
    }
  }
}

- (void)sendWithCompletion:(id)a3
{
  v73 = (void (**)(id, uint64_t))a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      uint64_t v5 = [(SMSMessageSender *)self outgoing];
      *(_DWORD *)buf = 138412290;
      *(void *)&uint8_t buf[4] = v5;
      _os_log_impl(&dword_0, v4, OS_LOG_TYPE_INFO, "   No parts failed, sending message(s): %@", buf, 0xCu);
    }
  }
  long long v84 = 0u;
  long long v85 = 0u;
  long long v82 = 0u;
  long long v83 = 0u;
  id obj = [(SMSMessageSender *)self outgoing];
  id v76 = [obj countByEnumeratingWithState:&v82 objects:v91 count:16];
  if (v76)
  {
    uint64_t v75 = *(void *)v83;
    do
    {
      for (i = 0; i != v76; i = (char *)i + 1)
      {
        if (*(void *)v83 != v75) {
          objc_enumerationMutation(obj);
        }
        BOOL v7 = *(void **)(*((void *)&v82 + 1) + 8 * i);
        v8 = [(SMSMessageSender *)self outputMessage];
        id v9 = [v8 useStandalone];

        if (v9)
        {
          if (!IMOSLoggingEnabled()) {
            goto LABEL_21;
          }
          v10 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
          {
            id v11 = [(SMSMessageSender *)self outputMessage];
            id v12 = [v11 guid];
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v12;
            _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "   => Message should use standalone. SettingCTMessage's BypassSupportedMessageModesCheck for message: %@", buf, 0xCu);
          }
          goto LABEL_20;
        }
        if (IMSharedHelperDeviceHasMultipleSubscriptions())
        {
          id v13 = [v7 context];
          BOOL v14 = v13 == 0;

          if (v14)
          {
            if (IMOSLoggingEnabled())
            {
              v10 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
              {
                id v15 = [(SMSMessageSender *)self outputMessage];
                id v16 = [v15 guid];
                *(_DWORD *)buf = 138412290;
                *(void *)&uint8_t buf[4] = v16;
                _os_log_impl(&dword_0, v10, OS_LOG_TYPE_INFO, "This message [%@] is not an SOS message but has nil context ******* FILE RADAR ******", buf, 0xCu);
              }
LABEL_20:
            }
          }
        }
LABEL_21:
        [v7 setBypassSupportedMessageModesCheck:v9];
        v17 = +[IDSCTAdapter sharedInstance];
        BOOL v18 = [(SMSMessageSender *)self message];
        id v19 = [v18 handle];
        unsigned int v20 = [v17 isPhoneNumberEmergencyNumber:v19];

        if (v20)
        {
          v21 = +[IMFeatureFlags sharedFeatureFlags];
          unsigned int v22 = [v21 stewieEnabled];

          if (v22)
          {
            v23 = [(SMSMessageSender *)self chat];
            unsigned __int8 v24 = [v23 isEmergencyChat];

            if ((v24 & 1) == 0)
            {
              if (IMOSLoggingEnabled())
              {
                char v25 = OSLogHandleForIMFoundationCategory();
                if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
                {
                  *(_WORD *)buf = 0;
                  _os_log_impl(&dword_0, v25, OS_LOG_TYPE_INFO, "Sending: Chat has been marked as an emergency chat", buf, 2u);
                }
              }
              v26 = [(SMSMessageSender *)self chat];
              [v26 updateIsEmergencyChat:1];
            }
          }
          if (IMOSLoggingEnabled())
          {
            v27 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v27, OS_LOG_TYPE_INFO))
            {
              unsigned int v28 = [(SMSMessageSender *)self message];
              unsigned int v29 = [v28 handle];
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v29;
              _os_log_impl(&dword_0, v27, OS_LOG_TYPE_INFO, "Sending SMS to emergency number: %@, need to disable ScreenTime restrictions", buf, 0xCu);
            }
          }
        }
        if (IMOSLoggingEnabled())
        {
          uint64_t v30 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v30, OS_LOG_TYPE_INFO))
          {
            if (v9) {
              CFStringRef v31 = @"YES";
            }
            else {
              CFStringRef v31 = @"NO";
            }
            *(_DWORD *)buf = 138412546;
            *(void *)&uint8_t buf[4] = v31;
            if (v20) {
              CFStringRef v32 = @"YES";
            }
            else {
              CFStringRef v32 = @"NO";
            }
            *(_WORD *)&buf[12] = 2112;
            *(void *)&buf[14] = v32;
            _os_log_impl(&dword_0, v30, OS_LOG_TYPE_INFO, "should use standalone %@ or to an Emergency number %@", buf, 0x16u);
          }
        }
        if ((v9 | v20) == 1)
        {
          if (IMOSLoggingEnabled())
          {
            CFStringRef v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_0, v33, OS_LOG_TYPE_INFO, "Disabling ScreenTime restrictions as sending message to an Emergency number", buf, 2u);
            }
          }
          uint64_t v86 = 0;
          v87 = &v86;
          uint64_t v88 = 0x2050000000;
          CFStringRef v34 = (void *)qword_99C30;
          uint64_t v89 = qword_99C30;
          if (!qword_99C30)
          {
            *(void *)buf = _NSConcreteStackBlock;
            *(void *)&buf[8] = 3221225472;
            *(void *)&buf[16] = sub_113A4;
            v93 = &unk_8D278;
            v94 = &v86;
            sub_113A4((uint64_t)buf);
            CFStringRef v34 = (void *)v87[3];
          }
          id v35 = v34;
          _Block_object_dispose(&v86, 8);
          CFStringRef v36 = [v35 sharedMonitor];
          id v81 = 0;
          unsigned int v37 = [v36 enableEmergencyModeWithError:&v81];
          id v38 = v81;
          if (v38) {
            char v39 = 0;
          }
          else {
            char v39 = v37;
          }
          if ((v39 & 1) == 0 && IMOSLoggingEnabled())
          {
            CFStringRef v40 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v40, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412546;
              CFStringRef v41 = @"NO";
              if (v37) {
                CFStringRef v41 = @"YES";
              }
              *(void *)&uint8_t buf[4] = v41;
              *(_WORD *)&buf[12] = 2112;
              *(void *)&buf[14] = v38;
              _os_log_impl(&dword_0, v40, OS_LOG_TYPE_INFO, "Enabling Emergency Mode reported %@ when sending message to an Emergency number with error: %@", buf, 0x16u);
            }
          }
          unsigned int v42 = [(SMSMessageSender *)self smsSession];
          [v42 _scheduleSchoolModeTimer];
        }
        CFStringRef v43 = +[CTMessageCenter sharedMessageCenter];
        id v44 = [v43 send:v7];

        BOOL v45 = v44 == 0;
        if (v44)
        {
          id v47 = [(SMSMessageSender *)self smsSession];
          v48 = [(SMSMessageSender *)self message];
          uint64_t v49 = [v48 guid];
          id v50 = [v47 _failureBlockForMessageGUID:v49];

          if (v50) {
            ((void (**)(void, void, id))v50)[2](v50, 0, v44);
          }
          v51 = [(SMSMessageSender *)self smsSession];
          id v52 = [(SMSMessageSender *)self message];
          long long v53 = [v52 guid];
          [v51 _clearMapForMessageGUID:v53];

          if (IMOSLoggingEnabled())
          {
            id v54 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v54, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412802;
              *(void *)&uint8_t buf[4] = v7;
              *(_WORD *)&buf[12] = 1024;
              *(_DWORD *)&buf[14] = v44;
              *(_WORD *)&buf[18] = 1024;
              *(_DWORD *)&buf[20] = HIDWORD(v44);
              _os_log_impl(&dword_0, v54, OS_LOG_TYPE_INFO, "**** Failed sending message (%@) error: %d,%d\n", buf, 0x18u);
            }
          }
        }
        else if (IMOSLoggingEnabled())
        {
          id v46 = OSLogHandleForIMEventCategory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v7;
            _os_log_impl(&dword_0, v46, OS_LOG_TYPE_INFO, "   => sent CT Message: %@", buf, 0xCu);
          }
        }
        long long v55 = [(SMSMessageSender *)self message];
        long long v56 = [v55 notificationIDSTokenURI];

        if (v45)
        {
          if ([v56 length])
          {
            if (IMOSLoggingEnabled())
            {
              long long v57 = OSLogHandleForIMFoundationCategory();
              if (os_log_type_enabled(v57, OS_LOG_TYPE_INFO))
              {
                long long v58 = [(SMSMessageSender *)self chatIdentifier];
                *(_DWORD *)buf = 138412546;
                *(void *)&uint8_t buf[4] = v56;
                *(_WORD *)&buf[12] = 2112;
                *(void *)&buf[14] = v58;
                _os_log_impl(&dword_0, v57, OS_LOG_TYPE_INFO, "Successfully sent message, setting message item notificationIDSTokenURI %@ for chatIdentifier %@", buf, 0x16u);
              }
            }
            CFStringRef v59 = +[IMMessageNotificationTimeManager sharedInstance];
            [v59 setLatestNotificationIDSTokenURI:v56];

            __int16 v60 = +[IMMessageNotificationTimeManager sharedInstance];
            __int16 v61 = +[NSDate date];
            __int16 v62 = [(SMSMessageSender *)self chatIdentifier];
            [v60 setDate:v61 forChatIdentifier:v62];
          }
          else
          {
            __int16 v63 = +[IMMessageNotificationTimeManager sharedInstance];
            __int16 v64 = [(SMSMessageSender *)self chatIdentifier];
            [v63 tearDownSessionForChatIdentifier:v64];

            long long v79 = 0u;
            long long v80 = 0u;
            long long v77 = 0u;
            long long v78 = 0u;
            CFStringRef v65 = +[IMDChatRegistry sharedInstance];
            __int16 v66 = [(SMSMessageSender *)self chatIdentifier];
            __int16 v60 = objc_msgSend(v65, "allExistingSupportedServiceChatsWithIdentifier:style:", v66, -[SMSMessageSender chatStyle](self, "chatStyle"));

            id v67 = [v60 countByEnumeratingWithState:&v77 objects:v90 count:16];
            if (v67)
            {
              uint64_t v68 = *(void *)v78;
              do
              {
                for (j = 0; j != v67; j = (char *)j + 1)
                {
                  if (*(void *)v78 != v68) {
                    objc_enumerationMutation(v60);
                  }
                  v70 = *(void **)(*((void *)&v77 + 1) + 8 * (void)j);
                  v71 = [(SMSMessageSender *)self outputMessage];
                  v72 = [v71 guid];
                  [v70 updateLastSeenMessageGuidIfNeeded:v72];
                }
                id v67 = [v60 countByEnumeratingWithState:&v77 objects:v90 count:16];
              }
              while (v67);
            }
          }
        }
      }
      id v76 = [obj countByEnumeratingWithState:&v82 objects:v91 count:16];
    }
    while (v76);
  }

  v73[2](v73, 1);
}

- (void)cleanupFailedBuildWithError:(unsigned int)a3 forParts:(id)a4
{
  id v21 = a4;
  if (IMOSLoggingEnabled())
  {
    uint64_t v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      uint64_t v6 = [(SMSMessageSender *)self outgoing];
      *(_DWORD *)buf = 138412290;
      unsigned int v28 = v6;
      _os_log_impl(&dword_0, v5, OS_LOG_TYPE_INFO, "   *** Parts failed, failing message(s): %@", buf, 0xCu);
    }
  }
  long long v24 = 0u;
  long long v25 = 0u;
  long long v22 = 0u;
  long long v23 = 0u;
  BOOL v7 = [(SMSMessageSender *)self outgoing];
  id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
  if (v8)
  {
    uint64_t v9 = *(void *)v23;
    do
    {
      for (i = 0; i != v8; i = (char *)i + 1)
      {
        if (*(void *)v23 != v9) {
          objc_enumerationMutation(v7);
        }
        id v11 = *(void **)(*((void *)&v22 + 1) + 8 * i);
        if (IMOSLoggingEnabled())
        {
          id v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            unsigned int v28 = v11;
            _os_log_impl(&dword_0, v12, OS_LOG_TYPE_INFO, "part error sending message %@", buf, 0xCu);
          }
        }
        if (IMOSLoggingEnabled())
        {
          id v13 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            unsigned int v28 = v11;
            _os_log_impl(&dword_0, v13, OS_LOG_TYPE_INFO, "   => failed CT Message: %@  (some parts failed)", buf, 0xCu);
          }
        }
        BOOL v14 = [(SMSMessageSender *)self smsSession];
        id v15 = [(SMSMessageSender *)self message];
        id v16 = [v15 guid];
        v17 = [v14 _failureBlockForMessageGUID:v16];

        if (v17) {
          v17[2](v17, 25, 0);
        }
        BOOL v18 = [(SMSMessageSender *)self smsSession];
        id v19 = [(SMSMessageSender *)self message];
        unsigned int v20 = [v19 guid];
        [v18 _clearMapForMessageGUID:v20];
      }
      id v8 = [v7 countByEnumeratingWithState:&v22 objects:v26 count:16];
    }
    while (v8);
  }
}

- (IMDTelephonyServiceSession)session
{
  return self->_session;
}

- (IMMessageItem)message
{
  return self->_message;
}

- (IMDChat)chat
{
  return self->_chat;
}

- (unsigned)style
{
  return self->_style;
}

- (NSArray)recipients
{
  return self->_recipients;
}

- (BOOL)sendAsGroupMessage
{
  return self->_sendAsGroupMessage;
}

- (void)setSendAsGroupMessage:(BOOL)a3
{
  self->_sendAsGroupMessage = a3;
}

- (BOOL)replicated
{
  return self->_replicated;
}

- (void)setReplicated:(BOOL)a3
{
  self->_replicated = a3;
}

- (BOOL)shouldSendMMS
{
  return self->_shouldSendMMS;
}

- (void)setShouldSendMMS:(BOOL)a3
{
  self->_shouldSendMMS = a3;
}

- (IMMessageItem)outputMessage
{
  return self->_outputMessage;
}

- (void)setOutputMessage:(id)a3
{
}

- (NSArray)outgoing
{
  return self->_outgoing;
}

- (void)setOutgoing:(id)a3
{
}

- (CTXPCServiceSubscriptionContext)context
{
  return self->_context;
}

- (void)setContext:(id)a3
{
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_context, 0);
  objc_storeStrong((id *)&self->_outgoing, 0);
  objc_storeStrong((id *)&self->_outputMessage, 0);
  objc_storeStrong((id *)&self->_recipients, 0);
  objc_storeStrong((id *)&self->_chat, 0);
  objc_storeStrong((id *)&self->_message, 0);

  objc_storeStrong((id *)&self->_session, 0);
}

@end