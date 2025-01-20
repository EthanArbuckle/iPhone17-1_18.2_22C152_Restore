@interface IMDChorosController
+ (BOOL)needToOpenChatForService:(int64_t)a3 questionnaireDictionary:(id)a4;
+ (BOOL)supportsService:(int64_t)a3;
+ (id)chatIdentifierForEmergency;
+ (id)chatIdentifierForRoadside:(int64_t)a3;
+ (id)chatSubjectForService:(int64_t)a3;
+ (id)conversationIDDefaultsKeyForService:(int64_t)a3;
+ (id)conversationIDToUUIDsDefaultsKeyForService:(int64_t)a3;
+ (id)generateCTStewieStartMessage:(id)a3 forService:(int64_t)a4 error:(id *)a5;
+ (id)generatePresentationForEmergencyQuestionnaire:(id)a3;
+ (id)generatePresentationForRoadsideQuestionnaire:(id)a3;
+ (id)generatePresentationForStewieQuestionnaire:(id)a3 forService:(int64_t)a4;
+ (id)incomingSequenceNumberDefaultsKeyForService:(int64_t)a3;
+ (id)nameForService:(int64_t)a3;
+ (id)outgoingSequenceNumberDefaultsKeyForService:(int64_t)a3;
+ (id)reportTypeKey;
+ (id)roadsideProviderIDFromChatIdentifier:(id)a3;
+ (id)serviceTypeKey;
+ (id)sharedController;
+ (int64_t)serviceFromChatIdentifier:(id)a3;
+ (int64_t)supportedServices;
- (BOOL)_createChatIfNecessary:(id)a3 chatIdentifier:(id)a4 service:(int64_t)a5;
- (BOOL)_isMessageStewieCompatible:(id)a3;
- (BOOL)isLiteMessageActiveOverSatellite;
- (BOOL)isSatelliteConnectionActive;
- (BOOL)isStewieActive;
- (BOOL)wasLastStateSatelliteConnectionActive;
- (CTStewieDataClient)coreTelephonyStewieClient;
- (IMDChorosController)init;
- (NSMutableSet)observers;
- (id)_generateLocationUpdateSentStatusItemForChat:(id)a3;
- (id)_generateStopTranscriptSharingStatusItemForChat:(id)a3;
- (id)_simNumber;
- (id)_stringKeyForConversationID:(int64_t)a3;
- (id)conversationIDToConversationUUIDMapForService:(int64_t)a3;
- (id)conversationUUIDForConversationID:(int64_t)a3 service:(int64_t)a4;
- (id)roadsideProviderForChatIdentifier:(id)a3;
- (id)roadsideProviderForProviderId:(int64_t)a3;
- (void)_openStewieChatWithChatIdentifier:(id)a3;
- (void)_processMessageSendFailure:(id)a3 forSession:(id)a4;
- (void)_processMessageSent:(id)a3 forSession:(id)a4;
- (void)_processReceivedTextMessageForService:(int64_t)a3 chatIdentifier:(id)a4 conversationID:(int64_t)a5 sequenceNum:(int64_t)a6 text:(id)a7;
- (void)addObserver:(id)a3;
- (void)connectedServicesChanged:(int64_t)a3;
- (void)locationUpdateDelivered:(id)a3;
- (void)locationUpdateSent;
- (void)messageReceived:(id)a3 withMetadata:(id)a4 completionBlock:(id)a5;
- (void)openStewieChatWithContext:(id)a3;
- (void)processReceivedEmergencyMessageFromIMTool:(int64_t)a3 message:(id)a4;
- (void)sendEmergencyQuestionnaire:(id)a3;
- (void)sendQuestionnaire:(id)a3;
- (void)sendStewieMessage:(id)a3 forChat:(id)a4;
- (void)setConversationIDToConversationUUIDMap:(id)a3 forService:(int64_t)a4;
- (void)setConversationUUID:(id)a3 forConversationID:(int64_t)a4 service:(int64_t)a5;
- (void)setCoreTelephonyStewieClient:(id)a3;
- (void)setLiteMessageActiveOverSatellite:(BOOL)a3;
- (void)setObservers:(id)a3;
- (void)setSatelliteConnectionActive:(BOOL)a3;
- (void)setStewieActive:(BOOL)a3;
- (void)setWasLastStateSatelliteConnectionActive:(BOOL)a3;
- (void)stateChanged:(id)a3;
- (void)stopTranscriptSharingWithChat:(id)a3;
- (void)updateChatPropertiesIfRequiredForChat:(id)a3 service:(int64_t)a4;
- (void)updateChatPropertiesIfRequiredForEmergencyChat:(id)a3;
- (void)updateChatPropertiesIfRequiredForRoadsideChat:(id)a3;
@end

@implementation IMDChorosController

+ (id)serviceTypeKey
{
  return @"serviceType";
}

+ (id)reportTypeKey
{
  return @"reportType";
}

+ (int64_t)supportedServices
{
  return 9;
}

+ (id)nameForService:(int64_t)a3
{
  v3 = @"Unknown service";
  if (a3 == 8) {
    v3 = @"Roadside";
  }
  if (a3 == 1) {
    return @"Emergency";
  }
  else {
    return v3;
  }
}

+ (BOOL)supportsService:(int64_t)a3
{
  BOOL result = 0;
  if (a3 >= 1)
  {
    uint8x8_t v4 = (uint8x8_t)vcnt_s8((int8x8_t)a3);
    v4.i16[0] = vaddlv_u8(v4);
    if (v4.u32[0] <= 1uLL) {
      return (+[IMDChorosController supportedServices] & a3) != 0;
    }
  }
  return result;
}

+ (id)outgoingSequenceNumberDefaultsKeyForService:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return @"stewieSequenceNumber";
  }
  if (a3 == 8) {
    return @"roadsideSequenceNumber";
  }
  v5 = NSString;
  uint64_t v6 = IMFileLocationTrimFileName();
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"outgoingSequenceNumberDefaultsKeyForService: Unsupported service type: %lld", a3);
  v8 = [v5 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"NO", "+[IMDChorosController outgoingSequenceNumberDefaultsKeyForService:]", v6, 107, v7];

  v9 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v9)
  {
    v9(v8);
  }
  else if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }
  }
  return 0;
}

+ (id)incomingSequenceNumberDefaultsKeyForService:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return @"stewieReceivedSequenceNumber";
  }
  if (a3 == 8) {
    return @"roadsideReceivedSequenceNumber";
  }
  v5 = NSString;
  uint64_t v6 = IMFileLocationTrimFileName();
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"incomingSequenceNumberDefaultsKeyForService: Unsupported service type: %lld", a3);
  v8 = [v5 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"NO", "+[IMDChorosController incomingSequenceNumberDefaultsKeyForService:]", v6, 121, v7];

  v9 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v9)
  {
    v9(v8);
  }
  else if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }
  }
  return 0;
}

+ (id)conversationIDDefaultsKeyForService:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return @"stewieConversationID";
  }
  if (a3 == 8) {
    return @"roadsideConversationID";
  }
  v5 = NSString;
  uint64_t v6 = IMFileLocationTrimFileName();
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"conversationIDDefaultsKeyForService: Unsupported service type: %lld", a3);
  v8 = [v5 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"NO", "+[IMDChorosController conversationIDDefaultsKeyForService:]", v6, 135, v7];

  v9 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v9)
  {
    v9(v8);
  }
  else if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }
  }
  return 0;
}

+ (id)conversationIDToUUIDsDefaultsKeyForService:(int64_t)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  if (a3 == 1) {
    return @"stewieConversationUUIDs";
  }
  if (a3 == 8) {
    return @"roadsideConversationUUIDs";
  }
  v5 = NSString;
  uint64_t v6 = IMFileLocationTrimFileName();
  v7 = objc_msgSend(NSString, "stringWithFormat:", @"conversationIDToUUIDsDefaultsKeyForService: Unsupported service type: %lld", a3);
  v8 = [v5 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"NO", "+[IMDChorosController conversationIDToUUIDsDefaultsKeyForService:]", v6, 149, v7];

  v9 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v9)
  {
    v9(v8);
  }
  else if (IMOSLoggingEnabled())
  {
    v10 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      v12 = v8;
      _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }
  }
  return 0;
}

- (IMDChorosController)init
{
  v16.receiver = self;
  v16.super_class = (Class)IMDChorosController;
  v2 = [(IMDChorosController *)&v16 init];
  if (v2)
  {
    v3 = (NSMutableSet *)objc_alloc_init(MEMORY[0x1E4F1CA80]);
    observers = v2->_observers;
    v2->_observers = v3;

    id v5 = objc_alloc(MEMORY[0x1E4F23A20]);
    int64_t v6 = +[IMDChorosController supportedServices];
    uint64_t v7 = [v5 initWithServices:v6 delegate:v2 delegateQueue:MEMORY[0x1E4F14428]];
    coreTelephonyStewieClient = v2->_coreTelephonyStewieClient;
    v2->_coreTelephonyStewieClient = (CTStewieDataClient *)v7;

    v9 = v2->_coreTelephonyStewieClient;
    if (v9)
    {
      char v10 = [(CTStewieDataClient *)v9 start];
      int v11 = IMOSLoggingEnabled();
      if (v10)
      {
        if (v11)
        {
          v12 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v15 = 0;
            uint64_t v13 = "Loaded data client";
LABEL_13:
            _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, v13, v15, 2u);
            goto LABEL_14;
          }
          goto LABEL_14;
        }
      }
      else if (v11)
      {
        v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)v15 = 0;
          uint64_t v13 = "Failed to start the data client";
          goto LABEL_13;
        }
        goto LABEL_14;
      }
    }
    else if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)v15 = 0;
        uint64_t v13 = "Failed to load data client";
        goto LABEL_13;
      }
LABEL_14:
    }
  }
  return v2;
}

+ (id)sharedController
{
  if (qword_1EBE2BC28 != -1) {
    dispatch_once(&qword_1EBE2BC28, &unk_1F33918E0);
  }
  v2 = (void *)qword_1EBE2BC10;

  return v2;
}

- (void)sendStewieMessage:(id)a3 forChat:(id)a4
{
  v73[1] = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  id v7 = a4;
  v8 = [v7 chatIdentifier];
  int64_t v9 = +[IMDChorosController serviceFromChatIdentifier:v8];

  if (+[IMDChorosController supportsService:v9])
  {
    if (IMOSLoggingEnabled())
    {
      char v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Sending Stewie message to CT", buf, 2u);
      }
    }
    [v7 updateIsEmergencyChat:v9 == 1];
    int v11 = [v6 body];
    v12 = [v11 string];

    if (!v6 || ![v12 length])
    {
      v14 = IMLogHandleForCategory();
      if (os_log_type_enabled(v14, OS_LOG_TYPE_ERROR)) {
        sub_1D99039A4();
      }
      goto LABEL_63;
    }
    uint64_t v13 = +[IMDAccountController sharedInstance];
    v14 = [v13 anySessionForServiceName:*MEMORY[0x1E4F6E1A0]];

    if (!v14)
    {
      v25 = IMLogHandleForCategory();
      v26 = v25;
      if (os_log_type_enabled(v25, OS_LOG_TYPE_ERROR))
      {
        sub_1D99039D8();
        v26 = v25;
      }
      goto LABEL_62;
    }
    BOOL v55 = [(IMDChorosController *)self _isMessageStewieCompatible:v6];
    if (!v55 && IMOSLoggingEnabled())
    {
      v15 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Content to send is not allowed", buf, 2u);
      }
    }
    objc_super v16 = [v6 time];
    BOOL v17 = v16 == 0;

    if (v17)
    {
      v18 = [MEMORY[0x1E4F1C9C8] date];
      [v6 setTime:v18];
    }
    uint64_t v57 = +[IMDChorosController outgoingSequenceNumberDefaultsKeyForService:v9];
    uint64_t v19 = IMGetDomainIntForKey();
    if (v19 + 1 <= 0) {
      uint64_t v20 = -(-(v19 + 1) & 0x1FFF);
    }
    else {
      uint64_t v20 = (v19 + 1) & 0x1FFF;
    }
    IMSetDomainIntForKey();
    [v6 setReplaceID:-1];
    v54 = +[IMDChorosController incomingSequenceNumberDefaultsKeyForService:v9];
    [v6 setStewieSequenceNumber:IMGetDomainIntForKey()];
    if (IMOSLoggingEnabled())
    {
      v21 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v21, OS_LOG_TYPE_INFO))
      {
        v22 = +[IMDChorosController nameForService:v9];
        *(_DWORD *)buf = 138412290;
        *(void *)&uint8_t buf[4] = v22;
        _os_log_impl(&dword_1D967A000, v21, OS_LOG_TYPE_INFO, "Generating outgoing text message for %@", buf, 0xCu);
      }
    }
    v23 = +[IMDChorosController conversationIDDefaultsKeyForService:v9];
    uint64_t v56 = IMGetDomainIntForKey();

    v53 = [(IMDChorosController *)self conversationUUIDForConversationID:v56 service:v9];
    if (v9 == 8)
    {
      v27 = [v7 chatIdentifier];
      v28 = +[IMDChorosController roadsideProviderIDFromChatIdentifier:v27];

      if (v28)
      {
        id v66 = 0;
        v52 = objc_msgSend(objc_alloc(MEMORY[0x1E4F23A58]), "initWithConversationID:providerId:sequenceNum:text:error:", v56, objc_msgSend(v28, "integerValue"), v20, v12, &v66);
        id v29 = v66;
      }
      else
      {
        v36 = (void *)MEMORY[0x1E4F28C58];
        uint64_t v72 = *MEMORY[0x1E4F28568];
        v73[0] = @"Failed to send message. ProviderId is invalid";
        v37 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v73 forKeys:&v72 count:1];
        id v29 = [v36 errorWithDomain:*MEMORY[0x1E4F28798] code:22 userInfo:v37];

        v52 = 0;
      }

      id v24 = v29;
      if (!v29) {
        goto LABEL_47;
      }
    }
    else
    {
      if (v9 != 1)
      {
        *(_OWORD *)buf = xmmword_1E6B76900;
        *(_OWORD *)&buf[16] = *(_OWORD *)off_1E6B76910;
        uint64_t v71 = 255;
        v30 = NSString;
        uint64_t v31 = IMFileLocationTrimFileName();
        uint64_t v32 = v71;
        v33 = objc_msgSend(NSString, "stringWithFormat:", @"outgoingSequenceNumberDefaultsKeyForService: Unsupported service type: %lld", v9);
        v34 = [v30 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"NO", "-[IMDChorosController sendStewieMessage:forChat:]", v31, v32, v33];

        v35 = (void (*)(void *))IMGetAssertionFailureHandler();
        if (v35)
        {
          v35(v34);
        }
        else if (IMOSLoggingEnabled())
        {
          v39 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v39, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)v68 = 138412290;
            v69 = v34;
            _os_log_impl(&dword_1D967A000, v39, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", v68, 0xCu);
          }
        }
        v52 = 0;
        goto LABEL_47;
      }
      id v67 = 0;
      v52 = (void *)[objc_alloc(MEMORY[0x1E4F23A38]) initWithConversationID:v56 sequenceNum:v20 emergencyText:v12 error:&v67];
      id v24 = v67;
      if (!v24)
      {
LABEL_47:
        v51 = 0;
LABEL_48:
        [v6 setStewieConversationID:v56];
        [v6 setStewieConversationUUID:v53];
        [v6 setIsStewie:1];
        v40 = +[IMDMessageStore sharedInstance];
        LOBYTE(v50) = 0;
        id v41 = (id)objc_msgSend(v40, "storeMessage:forceReplace:modifyError:modifyFlags:flagMask:updateMessageCache:calculateUnreadCount:", v6, 0, 0, 1, objc_msgSend(v6, "flags"), 1, v50);

        v42 = [v6 guid];
        char v43 = !v55;
        if (!v42) {
          char v43 = 1;
        }
        if (v43) {
          goto LABEL_67;
        }
        v44 = [(IMDChorosController *)self coreTelephonyStewieClient];
        v61[0] = MEMORY[0x1E4F143A8];
        v61[1] = 3221225472;
        v61[2] = sub_1D97CC510;
        v61[3] = &unk_1E6B76930;
        id v62 = v6;
        id v63 = v42;
        v64 = self;
        v65 = v14;
        int v45 = [v44 sendMessage:v52 completion:v61];

        if (!v45)
        {
LABEL_67:
          if (IMOSLoggingEnabled())
          {
            v47 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v47, OS_LOG_TYPE_INFO))
            {
              *(_DWORD *)buf = 138412290;
              *(void *)&uint8_t buf[4] = v52;
              _os_log_impl(&dword_1D967A000, v47, OS_LOG_TYPE_INFO, "**** Failed sending message (%@)", buf, 0xCu);
            }
          }
          block[0] = MEMORY[0x1E4F143A8];
          block[1] = 3221225472;
          block[2] = sub_1D97CC708;
          block[3] = &unk_1E6B73BC8;
          block[4] = self;
          id v59 = v42;
          v60 = v14;
          dispatch_async(MEMORY[0x1E4F14428], block);
        }
        else if (IMOSLoggingEnabled())
        {
          v46 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v46, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            *(void *)&uint8_t buf[4] = v52;
            _os_log_impl(&dword_1D967A000, v46, OS_LOG_TYPE_INFO, "Message transmitted to CT: %@", buf, 0xCu);
          }
        }
        v26 = (void *)v57;
LABEL_62:

LABEL_63:
        goto LABEL_64;
      }
    }
    v51 = v24;
    v38 = IMLogHandleForCategory();
    if (os_log_type_enabled(v38, OS_LOG_TYPE_ERROR))
    {
      v48 = +[IMDChorosController nameForService:v9];
      v49 = [v51 localizedDescription];
      *(_DWORD *)buf = 138412802;
      *(void *)&uint8_t buf[4] = v48;
      *(_WORD *)&buf[12] = 2112;
      *(void *)&buf[14] = v49;
      *(_WORD *)&buf[22] = 2112;
      *(void *)&buf[24] = v52;
      _os_log_error_impl(&dword_1D967A000, v38, OS_LOG_TYPE_ERROR, "Stewie %@ text message reported error: %@, message: %@", buf, 0x20u);
    }
    goto LABEL_48;
  }
  v12 = IMLogHandleForCategory();
  if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
    sub_1D9903A0C();
  }
LABEL_64:
}

- (void)_processMessageSent:(id)a3 forSession:(id)a4
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
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "ACK - Sent message for guid: %@", (uint8_t *)&v9, 0xCu);
    }
  }
  v8 = [MEMORY[0x1E4F1C9C8] date];
  [v6 didReceiveMessageDeliveryReceiptForMessageID:v5 date:v8];
}

- (void)_processMessageSendFailure:(id)a3 forSession:(id)a4
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
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "ACK - Failed to send message for guid: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  [v6 didReceiveError:4 forMessageID:v5 forceError:1];
}

- (BOOL)_isMessageStewieCompatible:(id)a3
{
  uint64_t v18 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint8x8_t v4 = objc_opt_class();
  if ([v4 isEqual:objc_opt_class()])
  {
    id v5 = [v3 fileTransferGUIDs];
    uint64_t v6 = [v5 count];

    if (v6)
    {
      if (IMOSLoggingEnabled())
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          int v8 = [v3 fileTransferGUIDs];
          id v9 = [v8 firstObject];
          int v16 = 138412290;
          id v17 = v9;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Emergency stewie is not allowed to send a file: %@", (uint8_t *)&v16, 0xCu);
        }
LABEL_10:
      }
    }
    else
    {
      uint64_t v13 = [v3 payloadData];
      uint64_t v14 = [v13 length];

      if (!v14)
      {
        BOOL v11 = 1;
        goto LABEL_12;
      }
      if (IMOSLoggingEnabled())
      {
        id v7 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
        {
          v15 = [v3 payloadData];
          int v16 = 138412290;
          id v17 = v15;
          _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Emergency stewie is not allowed to process payload data: %@", (uint8_t *)&v16, 0xCu);
        }
        goto LABEL_10;
      }
    }
  }
  else if (IMOSLoggingEnabled())
  {
    id v7 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v7, OS_LOG_TYPE_INFO))
    {
      int v16 = 138412290;
      id v17 = (id)objc_opt_class();
      id v10 = v17;
      _os_log_impl(&dword_1D967A000, v7, OS_LOG_TYPE_INFO, "Emergency stewie is not of class IMMessageItem: %@", (uint8_t *)&v16, 0xCu);
    }
    goto LABEL_10;
  }
  BOOL v11 = 0;
LABEL_12:

  return v11;
}

+ (id)generatePresentationForEmergencyQuestionnaire:(id)a3
{
  uint64_t v41 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (v3)
  {
    uint8x8_t v4 = v3;
    id v5 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1F3398578];
    id v29 = v4;
    uint64_t v32 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F24250]];
    if ([v32 length])
    {
      uint64_t v6 = NSString;
      id v7 = IMDaemonCoreBundle();
      int v8 = [v7 localizedStringForKey:@"STEWIE_EMERGENCY_MESSAGE_INFO_LIST" value:&stru_1F3398578 table:@"DaemonCoreLocalizable-SOS"];
      id v9 = objc_msgSend(v6, "localizedStringWithFormat:", v8, v32);

      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v9];
      [v5 appendAttributedString:v10];

      BOOL v11 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n\n"];
      [v5 appendAttributedString:v11];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v13 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "No emergency type provided", buf, 2u);
        }
      }
      uint64_t v14 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
      [v5 appendAttributedString:v14];
    }
    v15 = IMDaemonCoreBundle();
    v30 = [v15 localizedStringForKey:@"STEWIE_EMERGENCY_MESSAGE_INFO" value:&stru_1F3398578 table:@"DaemonCoreLocalizable-SOS"];

    v33 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v30];
    uint64_t v16 = [v33 length];
    objc_msgSend(v33, "addAttribute:value:range:", *MEMORY[0x1E4F6CAA0], @"boldValue", 0, v16);
    [v5 appendAttributedString:v33];
    uint64_t v31 = [v29 objectForKeyedSubscript:*MEMORY[0x1E4F24258]];
    if ([v31 count])
    {
      long long v37 = 0u;
      long long v38 = 0u;
      long long v35 = 0u;
      long long v36 = 0u;
      id obj = v31;
      uint64_t v17 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
      if (v17)
      {
        uint64_t v18 = *(void *)v36;
        do
        {
          for (uint64_t i = 0; i != v17; ++i)
          {
            if (*(void *)v36 != v18) {
              objc_enumerationMutation(obj);
            }
            uint64_t v20 = *(void *)(*((void *)&v35 + 1) + 8 * i);
            v21 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
            [v5 appendAttributedString:v21];

            v22 = NSString;
            v23 = IMDaemonCoreBundle();
            id v24 = [v23 localizedStringForKey:@"STEWIE_EMERGENCY_MESSAGE_INFO_LIST" value:&stru_1F3398578 table:@"DaemonCoreLocalizable-SOS"];
            v25 = objc_msgSend(v22, "localizedStringWithFormat:", v24, v20);

            v26 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v25];
            [v5 appendAttributedString:v26];
          }
          uint64_t v17 = [obj countByEnumeratingWithState:&v35 objects:v40 count:16];
        }
        while (v17);
      }

      v27 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v5];
      v12 = [v27 __im_attributedStringByAssigningMessagePartNumbers];
    }
    else
    {
      v27 = IMLogHandleForCategory();
      if (os_log_type_enabled(v27, OS_LOG_TYPE_ERROR)) {
        sub_1D9903A74();
      }
      v12 = 0;
    }

    id v3 = v29;
  }
  else
  {
    v12 = 0;
  }

  return v12;
}

+ (id)generatePresentationForRoadsideQuestionnaire:(id)a3
{
  uint64_t v40 = *MEMORY[0x1E4F143B8];
  id v32 = a3;
  if (v32)
  {
    id v3 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:&stru_1F3398578];
    uint8x8_t v4 = +[IMDChorosController reportTypeKey];
    v30 = [v32 objectForKeyedSubscript:v4];

    if ([v30 length])
    {
      id v5 = NSString;
      uint64_t v6 = IMDaemonCoreBundle();
      id v7 = [v6 localizedStringForKey:@"STEWIE_ROADSIDE_MESSAGE_INFO_LIST" value:&stru_1F3398578 table:@"DaemonCoreLocalizable-Avocet"];
      int v8 = objc_msgSend(v5, "localizedStringWithFormat:", v7, v30);

      id v9 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v8];
      [v3 appendAttributedString:v9];

      id v10 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n\n"];
      [v3 appendAttributedString:v10];
    }
    else
    {
      if (IMOSLoggingEnabled())
      {
        v12 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "No roadside type provided", buf, 2u);
        }
      }
      uint64_t v13 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
      [v3 appendAttributedString:v13];
    }
    uint64_t v14 = IMDaemonCoreBundle();
    v28 = [v14 localizedStringForKey:@"STEWIE_ROADSIDE_MESSAGE_INFO" value:&stru_1F3398578 table:@"DaemonCoreLocalizable-Avocet"];

    uint64_t v31 = (void *)[objc_alloc(MEMORY[0x1E4F28E48]) initWithString:v28];
    uint64_t v15 = [v31 length];
    objc_msgSend(v31, "addAttribute:value:range:", *MEMORY[0x1E4F6CAA0], @"boldValue", 0, v15);
    [v3 appendAttributedString:v31];
    id v29 = [v32 objectForKeyedSubscript:*MEMORY[0x1E4F24258]];
    if ([v29 count])
    {
      long long v36 = 0u;
      long long v37 = 0u;
      long long v34 = 0u;
      long long v35 = 0u;
      id obj = v29;
      uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
      if (v16)
      {
        uint64_t v17 = *(void *)v35;
        do
        {
          for (uint64_t i = 0; i != v16; ++i)
          {
            if (*(void *)v35 != v17) {
              objc_enumerationMutation(obj);
            }
            uint64_t v19 = *(void *)(*((void *)&v34 + 1) + 8 * i);
            uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:@"\n"];
            [v3 appendAttributedString:v20];

            v21 = NSString;
            v22 = IMDaemonCoreBundle();
            v23 = [v22 localizedStringForKey:@"STEWIE_ROADSIDE_MESSAGE_INFO_LIST" value:&stru_1F3398578 table:@"DaemonCoreLocalizable-Avocet"];
            id v24 = objc_msgSend(v21, "localizedStringWithFormat:", v23, v19);

            v25 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v24];
            [v3 appendAttributedString:v25];
          }
          uint64_t v16 = [obj countByEnumeratingWithState:&v34 objects:v39 count:16];
        }
        while (v16);
      }

      v26 = [objc_alloc(MEMORY[0x1E4F28B18]) initWithAttributedString:v3];
      BOOL v11 = [v26 __im_attributedStringByAssigningMessagePartNumbers];
    }
    else
    {
      v26 = IMLogHandleForCategory();
      if (os_log_type_enabled(v26, OS_LOG_TYPE_ERROR)) {
        sub_1D9903AA8();
      }
      BOOL v11 = 0;
    }
  }
  else
  {
    BOOL v11 = 0;
  }

  return v11;
}

+ (id)generatePresentationForStewieQuestionnaire:(id)a3 forService:(int64_t)a4
{
  uint64_t v17 = *MEMORY[0x1E4F143B8];
  id v5 = a3;
  if (a4 == 8)
  {
    uint64_t v6 = +[IMDChorosController generatePresentationForRoadsideQuestionnaire:v5];
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    uint64_t v6 = +[IMDChorosController generatePresentationForEmergencyQuestionnaire:v5];
LABEL_5:
    id v7 = (void *)v6;
    goto LABEL_13;
  }
  int v8 = NSString;
  uint64_t v9 = IMFileLocationTrimFileName();
  id v10 = objc_msgSend(NSString, "stringWithFormat:", @"generatePresentationForStewieQuestionnaire: Unsupported service type: %lld", a4);
  BOOL v11 = [v8 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"NO", "+[IMDChorosController generatePresentationForStewieQuestionnaire:forService:]", v9, 424, v10];

  v12 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v12)
  {
    v12(v11);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v16 = v11;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }
  }
  id v7 = 0;
LABEL_13:

  return v7;
}

+ (id)generateCTStewieStartMessage:(id)a3 forService:(int64_t)a4 error:(id *)a5
{
  uint64_t v19 = *MEMORY[0x1E4F143B8];
  id v7 = a3;
  if (a4 == 8)
  {
    int v8 = (objc_class *)MEMORY[0x1E4F23A50];
    goto LABEL_5;
  }
  if (a4 == 1)
  {
    int v8 = (objc_class *)MEMORY[0x1E4F23A30];
LABEL_5:
    uint64_t v9 = (void *)[[v8 alloc] initWithDictionary:v7 error:a5];
    goto LABEL_13;
  }
  id v10 = NSString;
  uint64_t v11 = IMFileLocationTrimFileName();
  v12 = objc_msgSend(NSString, "stringWithFormat:", @"generateCTStewieStartMessage: Unsupported service type: %lld", a4);
  uint64_t v13 = [v10 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"NO", "+[IMDChorosController generateCTStewieStartMessage:forService:error:]", v11, 438, v12];

  uint64_t v14 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v14)
  {
    v14(v13);
  }
  else if (IMOSLoggingEnabled())
  {
    uint64_t v15 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v18 = v13;
      _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }
  }
  uint64_t v9 = 0;
LABEL_13:

  return v9;
}

+ (BOOL)needToOpenChatForService:(int64_t)a3 questionnaireDictionary:(id)a4
{
  id v5 = a4;
  uint64_t v6 = v5;
  if (a3 == 1
    && ([v5 objectForKey:*MEMORY[0x1E4F24280]],
        id v7 = objc_claimAutoreleasedReturnValue(),
        v7,
        !v7))
  {
    if (IMOSLoggingEnabled())
    {
      id v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v11 = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "No questionnaire answers provided", v11, 2u);
      }
    }
    BOOL v8 = 0;
  }
  else
  {
    BOOL v8 = 1;
  }

  return v8;
}

+ (id)chatSubjectForService:(int64_t)a3
{
  uint64_t v16 = *MEMORY[0x1E4F143B8];
  if (a3 == 8)
  {
    uint8x8_t v4 = IMDaemonCoreBundle();
    uint64_t v5 = [v4 localizedStringForKey:@"STEWIE_ROADSIDE_MESSAGE_SUBJECT" value:&stru_1F3398578 table:@"DaemonCoreLocalizable-Avocet"];
    goto LABEL_5;
  }
  if (a3 == 1)
  {
    uint8x8_t v4 = IMDaemonCoreBundle();
    uint64_t v5 = [v4 localizedStringForKey:@"STEWIE_EMERGENCY_MESSAGE_SUBJECT" value:&stru_1F3398578 table:@"DaemonCoreLocalizable-SOS"];
LABEL_5:
    uint64_t v6 = (void *)v5;

    goto LABEL_13;
  }
  id v7 = NSString;
  uint64_t v8 = IMFileLocationTrimFileName();
  uint64_t v9 = objc_msgSend(NSString, "stringWithFormat:", @"generateCTStewieStartMessage: Unsupported service type: %lld", a3);
  id v10 = [v7 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"NO", "+[IMDChorosController chatSubjectForService:]", v8, 467, v9];

  uint64_t v11 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v11)
  {
    v11(v10);
  }
  else if (IMOSLoggingEnabled())
  {
    v12 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v15 = v10;
      _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }
  }
  uint64_t v6 = 0;
LABEL_13:

  return v6;
}

- (void)updateChatPropertiesIfRequiredForEmergencyChat:(id)a3
{
  uint64_t v13 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  uint8x8_t v4 = IMDaemonCoreBundle();
  uint64_t v5 = [v4 localizedStringForKey:@"STEWIE_EMERGENCY_DISPLAY_NAME" value:&stru_1F3398578 table:@"DaemonCoreLocalizable-SOS"];

  uint64_t v6 = [v3 displayName];
  char v7 = [v5 isEqualToString:v6];

  if ((v7 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = 138412546;
        id v10 = v3;
        __int16 v11 = 2112;
        v12 = v5;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Updating chat: %@ display name to: %@", (uint8_t *)&v9, 0x16u);
      }
    }
    [v3 updateDisplayName:v5];
  }
}

- (void)updateChatPropertiesIfRequiredForRoadsideChat:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  uint64_t v5 = [v4 chatIdentifier];
  uint64_t v6 = [(IMDChorosController *)self roadsideProviderForChatIdentifier:v5];

  char v7 = [v6 providerName];
  if (!v7)
  {
    uint64_t v8 = IMDaemonCoreBundle();
    char v7 = [v8 localizedStringForKey:@"STEWIE_ROADSIDE_FALLBACK_DISPLAY_NAME" value:&stru_1F3398578 table:@"DaemonCoreLocalizable-Avocet"];
  }
  int v9 = [v4 displayName];
  char v10 = [v7 isEqualToString:v9];

  if ((v10 & 1) == 0)
  {
    if (IMOSLoggingEnabled())
    {
      __int16 v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        int v16 = 138412546;
        id v17 = v4;
        __int16 v18 = 2112;
        uint64_t v19 = v7;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "Updating chat: %@ display name to: %@", (uint8_t *)&v16, 0x16u);
      }
    }
    [v4 updateDisplayName:v7];
  }
  v12 = [v6 bizId];
  if (v12)
  {
    uint64_t v13 = [v4 associatedBusinessID];
    char v14 = [v12 isEqualToString:v13];

    if ((v14 & 1) == 0)
    {
      if (IMOSLoggingEnabled())
      {
        uint64_t v15 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_INFO))
        {
          int v16 = 138412546;
          id v17 = v4;
          __int16 v18 = 2112;
          uint64_t v19 = v12;
          _os_log_impl(&dword_1D967A000, v15, OS_LOG_TYPE_INFO, "Updating chat: %@ associated business ID to: %@", (uint8_t *)&v16, 0x16u);
        }
      }
      [v4 updateAssociatedBusinessID:v12];
    }
  }
}

- (void)updateChatPropertiesIfRequiredForChat:(id)a3 service:(int64_t)a4
{
  uint64_t v15 = *MEMORY[0x1E4F143B8];
  id v6 = a3;
  if (a4 == 8)
  {
    [(IMDChorosController *)self updateChatPropertiesIfRequiredForRoadsideChat:v6];
  }
  else if (a4 == 1)
  {
    [(IMDChorosController *)self updateChatPropertiesIfRequiredForEmergencyChat:v6];
  }
  else
  {
    char v7 = NSString;
    uint64_t v8 = IMFileLocationTrimFileName();
    int v9 = objc_msgSend(NSString, "stringWithFormat:", @"updateChatPropertiesIfRequiredForChat: Unsupported service type: %lld", a4);
    char v10 = [v7 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"NO", "-[IMDChorosController updateChatPropertiesIfRequiredForChat:service:]", v8, 515, v9];

    __int16 v11 = (void (*)(void *))IMGetAssertionFailureHandler();
    if (v11)
    {
      v11(v10);
    }
    else if (IMOSLoggingEnabled())
    {
      v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        char v14 = v10;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
      }
    }
  }
}

- (void)sendQuestionnaire:(id)a3
{
  uint64_t v87 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (v4)
  {
    v73 = self;
    uint64_t v5 = +[IMDChorosController serviceTypeKey];
    id v6 = [v4 objectForKeyedSubscript:v5];

    uint64_t v7 = [v6 integerValue];
    if (!+[IMDChorosController supportsService:v7])
    {
      v12 = IMLogHandleForCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_ERROR)) {
        sub_1D9903C98();
      }
      goto LABEL_82;
    }
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        int v9 = +[IMDChorosController nameForService:v7];
        *(_DWORD *)buf = 138412290;
        uint64_t v86 = (uint64_t)v9;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "sendQuestionnaire: invoked for service type: %@", buf, 0xCu);
      }
    }
    char v10 = +[IMDAccountController sharedInstance];
    __int16 v11 = (void *)MEMORY[0x1E4F6E1A0];
    v12 = [v10 anySessionForServiceName:*MEMORY[0x1E4F6E1A0]];

    if (!v12)
    {
      int v16 = IMLogHandleForCategory();
      char v14 = v16;
      if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR))
      {
        sub_1D9903B10();
        char v14 = v16;
      }
      goto LABEL_81;
    }
    uint64_t v13 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F24288]];
    uint64_t v72 = +[IMDChorosController generatePresentationForStewieQuestionnaire:v13 forService:v7];

    char v14 = (void *)v72;
    if (!v72)
    {
LABEL_81:

LABEL_82:
      goto LABEL_83;
    }
    v70 = [v4 objectForKey:*MEMORY[0x1E4F24248]];
    if (!v70)
    {
      uint64_t v15 = IMLogHandleForCategory();
      id v17 = v15;
      if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR))
      {
LABEL_80:

        char v14 = (void *)v72;
        goto LABEL_81;
      }
      sub_1D9903B44();
LABEL_36:
      id v17 = v15;
      goto LABEL_80;
    }
    if (v7 == 1)
    {
      uint64_t v69 = +[IMDChorosController chatIdentifierForEmergency];
      uint64_t v15 = 0;
    }
    else
    {
      if (v7 != 8)
      {
        uint64_t v15 = 0;
LABEL_33:
        v23 = IMLogHandleForCategory();
        if (os_log_type_enabled(v23, OS_LOG_TYPE_ERROR)) {
          sub_1D9903B78();
        }

        goto LABEL_36;
      }
      __int16 v18 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F24278]];
      uint64_t v15 = v18;
      if (!v18)
      {
        uint64_t v15 = IMLogHandleForCategory();
        id v17 = v15;
        if (!os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          goto LABEL_80;
        }
        sub_1D9903C64();
        goto LABEL_36;
      }
      uint64_t v69 = +[IMDChorosController chatIdentifierForRoadside:[v18 integerValue]];
    }
    if (v69)
    {
      v65 = v15;
      uint64_t v19 = [v70 integerValue];
      if (v19 < 0)
      {
        v22 = IMLogHandleForCategory();
        if (os_log_type_enabled(v22, OS_LOG_TYPE_ERROR)) {
          sub_1D9903C30();
        }
      }
      else
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v86 = v19;
            _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Conversation ID: %ld", buf, 0xCu);
          }
        }
        v21 = +[IMDChorosController conversationIDDefaultsKeyForService:v7];
        IMSetDomainIntForKey();

        if (v15)
        {
          [v15 integerValue];
          IMSetDomainIntForKey();
        }
        v22 = [MEMORY[0x1E4F28EB8] defaultCenter];
        [v22 __mainThreadPostNotificationName:*MEMORY[0x1E4F6E340] object:0];
      }

      id v84 = 0;
      id v67 = +[IMDChorosController generateCTStewieStartMessage:v4 forService:v7 error:&v84];
      id v61 = v84;
      if (v61 || !v67)
      {
        id v24 = IMLogHandleForCategory();
        if (os_log_type_enabled(v24, OS_LOG_TYPE_ERROR)) {
          sub_1D9903BAC();
        }
      }
      if (IMOSLoggingEnabled())
      {
        v25 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v25, OS_LOG_TYPE_INFO))
        {
          v26 = +[IMDChorosController nameForService:v7];
          *(_DWORD *)buf = 138412290;
          uint64_t v86 = (uint64_t)v26;
          _os_log_impl(&dword_1D967A000, v25, OS_LOG_TYPE_INFO, "Sending %@ start message to CT", buf, 0xCu);
        }
      }
      id v63 = [MEMORY[0x1E4F1C9C8] date];
      v64 = StringGUID();
      uint64_t v71 = (void *)[objc_alloc(MEMORY[0x1E4F6E850]) initWithSender:v69 time:v63 body:v72 attributes:0 fileTransferGUIDs:0 flags:0x200000005 error:0 guid:v64 threadIdentifier:0];
      BOOL v27 = [(IMDChorosController *)v73 _createChatIfNecessary:v12 chatIdentifier:v69 service:v7];
      v28 = +[IMDChatRegistry sharedInstance];
      id v29 = [v12 account];
      v68 = [v28 existingChatWithIdentifier:v69 account:v29];

      if (!v27) {
        [(IMDChorosController *)v73 updateChatPropertiesIfRequiredForChat:v68 service:v7];
      }
      if (v7 == 1)
      {
        v30 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F24260]];
        uint64_t v31 = [v30 integerValue];

        int v32 = IMOSLoggingEnabled();
        if (v31 == 3)
        {
          if (v32)
          {
            v33 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "Transcript sharing turned on", buf, 2u);
            }
          }
          uint64_t v34 = 1;
          goto LABEL_62;
        }
        if (v32)
        {
          long long v35 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v35, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134217984;
            uint64_t v86 = v31;
            _os_log_impl(&dword_1D967A000, v35, OS_LOG_TYPE_INFO, "Transcript sharing off: %ld", buf, 0xCu);
          }
        }
      }
      uint64_t v34 = 0;
LABEL_62:
      [v68 updateEmergencyTranscriptSharingStateChatProperty:v34];
      id v66 = [MEMORY[0x1E4F29128] UUID];
      [(IMDChorosController *)v73 setConversationUUID:v66 forConversationID:v19 service:v7];
      long long v36 = +[IMDChorosController outgoingSequenceNumberDefaultsKeyForService:v7];
      IMSetDomainIntForKey();

      long long v37 = +[IMDChorosController incomingSequenceNumberDefaultsKeyForService:v7];
      IMSetDomainIntForKey();

      id v62 = [(IMDChorosController *)v73 _simNumber];
      [v71 setDestinationCallerID:v62];
      long long v38 = [v12 accountID];
      [v71 setAccountID:v38];

      [v71 setIsStewie:1];
      [v71 setService:*v11];
      [v71 setHandle:v69];
      [v71 setReplaceID:-1];
      [v71 setStewieConversationID:v19];
      [v71 setStewieConversationUUID:v66];
      v39 = +[IMDChorosController chatSubjectForService:v7];
      [v71 setSubject:v39];

      uint64_t v40 = +[IMDMessageStore sharedInstance];
      LOBYTE(v60) = 0;
      id v41 = (id)[v40 storeMessage:v71 forceReplace:0 modifyError:0 modifyFlags:1 flagMask:0x200000005 updateMessageCache:1 calculateUnreadCount:v60];

      v42 = +[IMDChatRegistry sharedInstance];
      [v42 addMessage:v71 toChat:v68];

      char v43 = +[IMDChatRegistry sharedInstance];
      [v43 updateStateForChat:v68 hintMessage:v71 shouldRebuildFailedMessageDate:1 shouldCalculateUnreadCount:0];

      if (IMOSLoggingEnabled())
      {
        v44 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v44, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          uint64_t v86 = v69;
          _os_log_impl(&dword_1D967A000, v44, OS_LOG_TYPE_INFO, "Will broadcast initialEmergencyQuestionnaireReceived for chatIdentifier: %@", buf, 0xCu);
        }
      }
      int v45 = [v12 broadcasterForChatListeners];
      v46 = [v12 account];
      v47 = [v46 accountID];
      v48 = [v68 chatProperties];
      v49 = [v68 groupID];
      uint64_t v50 = [v68 personCentricID];
      [v45 account:v47 chat:v69 style:45 chatProperties:v48 groupID:v49 chatPersonCentricID:v50 initialEmergencyQuestionnaireReceived:v71];

      if ((IMIsRunningInUnitTesting() & 1) == 0
        && +[IMDChorosController needToOpenChatForService:v7 questionnaireDictionary:v4])
      {
        [(IMDChorosController *)v73 _openStewieChatWithChatIdentifier:v69];
      }
      v51 = [(IMDChorosController *)v73 coreTelephonyStewieClient];
      v77[0] = MEMORY[0x1E4F143A8];
      v77[1] = 3221225472;
      v77[2] = sub_1D97CEEA0;
      v77[3] = &unk_1E6B769F8;
      id v52 = v71;
      id v78 = v52;
      id v53 = v64;
      id v79 = v53;
      v80 = v73;
      v54 = v12;
      v81 = v54;
      uint64_t v83 = v7;
      BOOL v55 = v65;
      v82 = v55;
      int v56 = [v51 sendMessage:v67 completion:v77];

      int v57 = IMOSLoggingEnabled();
      if (v56)
      {
        if (v57)
        {
          v58 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v58, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v86 = (uint64_t)v67;
            _os_log_impl(&dword_1D967A000, v58, OS_LOG_TYPE_INFO, "Message transmitted to CT: %@", buf, 0xCu);
          }
        }
      }
      else
      {
        if (v57)
        {
          id v59 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v59, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 138412290;
            uint64_t v86 = (uint64_t)v67;
            _os_log_impl(&dword_1D967A000, v59, OS_LOG_TYPE_INFO, "**** Failed sending start Stewie message (%@)", buf, 0xCu);
          }
        }
        block[0] = MEMORY[0x1E4F143A8];
        block[1] = 3221225472;
        block[2] = sub_1D97CF1A4;
        block[3] = &unk_1E6B73BC8;
        block[4] = v73;
        id v75 = v53;
        v76 = v54;
        dispatch_async(MEMORY[0x1E4F14428], block);
      }
      id v17 = (void *)v69;
      goto LABEL_80;
    }
    goto LABEL_33;
  }
  id v6 = IMLogHandleForCategory();
  if (os_log_type_enabled(v6, OS_LOG_TYPE_ERROR)) {
    sub_1D9903ADC();
  }
LABEL_83:
}

- (void)sendEmergencyQuestionnaire:(id)a3
{
  id v5 = (id)[a3 mutableCopy];
  id v4 = +[IMDChorosController serviceTypeKey];
  [v5 setObject:&unk_1F33C5CD0 forKeyedSubscript:v4];

  [(IMDChorosController *)self sendQuestionnaire:v5];
}

- (void)stopTranscriptSharingWithChat:(id)a3
{
  uint64_t v25 = *MEMORY[0x1E4F143B8];
  id v3 = a3;
  if (IMOSLoggingEnabled())
  {
    id v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Stopping sharing transcript", buf, 2u);
    }
  }
  id v5 = +[IMDAccountController sharedInstance];
  id v6 = [v5 anySessionForServiceName:*MEMORY[0x1E4F6E1A0]];

  if (v6)
  {
    id v22 = 0;
    uint64_t v20 = (void *)[objc_alloc(MEMORY[0x1E4F23A28]) initWithNotifyOption:1 error:&v22];
    uint64_t v7 = v22;
    if (v7)
    {
      uint64_t v8 = IMLogHandleForCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_ERROR)) {
        sub_1D9903D34(v7);
      }
    }
    uint64_t v19 = [(IMDChorosController *)self _generateStopTranscriptSharingStatusItemForChat:v3];
    int v9 = [v6 broadcasterForChatListeners];
    char v10 = [v6 account];
    __int16 v11 = [v10 accountID];
    v12 = +[IMDChorosController chatIdentifierForEmergency];
    uint64_t v13 = [v3 chatProperties];
    char v14 = [v3 groupID];
    uint64_t v15 = [v3 personCentricID];
    [v9 account:v11 chat:v12 style:45 chatProperties:v13 groupID:v14 chatPersonCentricID:v15 messageReceived:v19];

    int v16 = [(IMDChorosController *)self coreTelephonyStewieClient];
    LODWORD(v13) = [v16 sendMessage:v20 completion:&unk_1F3391900];

    int v17 = IMOSLoggingEnabled();
    if (v13)
    {
      if (v17)
      {
        __int16 v18 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
        {
          *(_DWORD *)buf = 138412290;
          id v24 = v20;
          _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "Message transmitted to CT: %@", buf, 0xCu);
        }
LABEL_20:
      }
    }
    else if (v17)
    {
      __int16 v18 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v18, OS_LOG_TYPE_INFO))
      {
        *(_DWORD *)buf = 138412290;
        id v24 = v20;
        _os_log_impl(&dword_1D967A000, v18, OS_LOG_TYPE_INFO, "**** Failed sending message (%@)", buf, 0xCu);
      }
      goto LABEL_20;
    }

    goto LABEL_22;
  }
  uint64_t v7 = IMLogHandleForCategory();
  if (os_log_type_enabled(v7, OS_LOG_TYPE_ERROR)) {
    sub_1D9903D00();
  }
LABEL_22:
}

- (void)_processReceivedTextMessageForService:(int64_t)a3 chatIdentifier:(id)a4 conversationID:(int64_t)a5 sequenceNum:(int64_t)a6 text:(id)a7
{
  uint64_t v50 = *MEMORY[0x1E4F143B8];
  id v12 = a4;
  id v13 = a7;
  if (+[IMDChorosController supportsService:a3])
  {
    int64_t v42 = a5;
    int64_t v43 = a6;
    char v14 = +[IMDAccountController sharedInstance];
    uint64_t v15 = (void *)MEMORY[0x1E4F6E1A0];
    int v16 = [v14 anySessionForServiceName:*MEMORY[0x1E4F6E1A0]];

    if (!v16)
    {
      uint64_t v19 = IMLogHandleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1D9903DBC();
      }
      goto LABEL_46;
    }
    if (!v13 || ![v13 length])
    {
      uint64_t v19 = IMLogHandleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1D9903DF0();
      }
      goto LABEL_46;
    }
    if (!v12 || ![v12 length])
    {
      uint64_t v19 = IMLogHandleForCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
        sub_1D9903E24();
      }
      goto LABEL_46;
    }
    int v17 = [MEMORY[0x1E4F6E858] sharedInstance];
    [v17 acquireAssertionToUnsuspendProcess];

    __int16 v18 = (void *)[objc_alloc(MEMORY[0x1E4F28B18]) initWithString:v13];
    uint64_t v19 = objc_msgSend(v18, "__im_attributedStringByAssigningMessagePartNumbers");

    uint64_t v40 = [MEMORY[0x1E4F1C9C8] date];
    id v20 = objc_alloc(MEMORY[0x1E4F6E850]);
    v21 = StringGUID();
    id v22 = (void *)[v20 initWithSender:v12 time:v40 body:v19 attributes:0 fileTransferGUIDs:0 flags:0x200000001 error:0 guid:v21 threadIdentifier:0];

    [(IMDChorosController *)self _createChatIfNecessary:v16 chatIdentifier:v12 service:a3];
    [v22 setStewieSequenceNumber:v43];
    v39 = [(IMDChorosController *)self conversationUUIDForConversationID:v42 service:a3];
    v23 = +[IMDChorosController incomingSequenceNumberDefaultsKeyForService:a3];
    long long v38 = v22;
    uint64_t v24 = IMGetDomainIntForKey();

    if (v24 < v43)
    {
      uint64_t v25 = +[IMDChorosController incomingSequenceNumberDefaultsKeyForService:a3];
      IMSetDomainIntForKey();
    }
    v26 = +[IMDMessageStore sharedInstance];
    BOOL v27 = [v26 messageWithReplaceMessageID:v43 fromHandle:v12 onService:*v15];

    if (v27)
    {
      if (IMOSLoggingEnabled())
      {
        v28 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v28, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v28, OS_LOG_TYPE_INFO, "Found a message with the same sequence number", buf, 2u);
        }
      }
      if ([v27 stewieConversationID] == v42)
      {
        if (IMOSLoggingEnabled())
        {
          id v29 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v29, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v29, OS_LOG_TYPE_INFO, "Found a message with the same Conversation ID", buf, 2u);
          }
        }
        v30 = [v27 body];
        id v41 = [v30 string];

        LODWORD(v30) = [v41 isEqualToString:v13];
        int v31 = IMOSLoggingEnabled();
        if (v30)
        {
          if (v31)
          {
            int v32 = OSLogHandleForIMFoundationCategory();
            if (os_log_type_enabled(v32, OS_LOG_TYPE_INFO))
            {
              *(_WORD *)buf = 0;
              _os_log_impl(&dword_1D967A000, v32, OS_LOG_TYPE_INFO, "Dropping message", buf, 2u);
            }
          }
          if (!IMOSLoggingEnabled()) {
            goto LABEL_45;
          }
          v33 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
          {
            *(_DWORD *)buf = 134218240;
            int64_t v45 = v42;
            __int16 v46 = 2048;
            int64_t v47 = v43;
            _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "Message has the same text, conversation ID: %lld and sequence number: %lld", buf, 0x16u);
          }
          goto LABEL_44;
        }
        if (v31)
        {
          uint64_t v34 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v34, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v34, OS_LOG_TYPE_INFO, "Text is not the same, keeping message", buf, 2u);
          }
        }
      }
    }
    id v41 = [(IMDChorosController *)self _simNumber];
    [v38 setDestinationCallerID:v41];
    long long v35 = [v16 accountID];
    [v38 setAccountID:v35];

    [v38 setIsStewie:1];
    [v38 setReplaceID:v43];
    [v38 setStewieConversationID:v42];
    [v38 setStewieConversationUUID:v39];
    long long v36 = [MEMORY[0x1E4F6E858] sharedInstance];
    [v36 sendNotificationMessageIfNeededForIncomingMessageFromChatIdentifier:v12];

    [v16 didReceiveMessage:v38 forChat:v12 style:45 fromIDSID:0];
    if (!IMOSLoggingEnabled())
    {
LABEL_45:

LABEL_46:
      goto LABEL_47;
    }
    v33 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v33, OS_LOG_TYPE_INFO))
    {
      long long v37 = +[IMDChorosController nameForService:a3];
      *(_DWORD *)buf = 138412802;
      int64_t v45 = (int64_t)v37;
      __int16 v46 = 2048;
      int64_t v47 = v42;
      __int16 v48 = 2048;
      int64_t v49 = v43;
      _os_log_impl(&dword_1D967A000, v33, OS_LOG_TYPE_INFO, "Session received Stewie %@ text message with Conversation ID: %lld, sequence number: %lld", buf, 0x20u);
    }
LABEL_44:

    goto LABEL_45;
  }
  int v16 = IMLogHandleForCategory();
  if (os_log_type_enabled(v16, OS_LOG_TYPE_ERROR)) {
    sub_1D9903E58();
  }
LABEL_47:
}

- (void)locationUpdateSent
{
  v6[1] = *MEMORY[0x1E4F143B8];
  id v3 = +[IMDChorosController serviceTypeKey];
  id v5 = v3;
  v6[0] = &unk_1F33C5CD0;
  id v4 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v6 forKeys:&v5 count:1];
  [(IMDChorosController *)self locationUpdateDelivered:v4];
}

- (void)locationUpdateDelivered:(id)a3
{
  id v4 = a3;
  id v5 = +[IMDChorosController serviceTypeKey];
  id v6 = [v4 objectForKeyedSubscript:v5];

  uint64_t v7 = [v6 integerValue];
  if (+[IMDChorosController supportsService:v7])
  {
    if (IMOSLoggingEnabled())
    {
      uint64_t v8 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v8, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v8, OS_LOG_TYPE_INFO, "Location update sent", buf, 2u);
      }
    }
    int v9 = +[IMDAccountController sharedInstance];
    char v10 = [v9 anySessionForServiceName:*MEMORY[0x1E4F6E1A0]];

    if (!v10)
    {
      __int16 v11 = IMLogHandleForCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
        sub_1D9903EC0();
      }
      goto LABEL_25;
    }
    if (v7 == 8)
    {
      v23 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F24278]];
      if (!v23)
      {
        __int16 v11 = IMLogHandleForCategory();
        if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
          sub_1D9903F28();
        }
        goto LABEL_25;
      }
      uint64_t v24 = v23;
      __int16 v11 = +[IMDChorosController chatIdentifierForRoadside:](IMDChorosController, "chatIdentifierForRoadside:", [v23 integerValue]);

      if (v11) {
        goto LABEL_10;
      }
    }
    else if (v7 == 1)
    {
      __int16 v11 = +[IMDChorosController chatIdentifierForEmergency];
      if (v11)
      {
LABEL_10:
        BOOL v12 = [(IMDChorosController *)self _createChatIfNecessary:v10 chatIdentifier:v11 service:v7];
        id v13 = +[IMDChatRegistry sharedInstance];
        char v14 = [v10 account];
        uint64_t v15 = [v13 existingChatWithIdentifier:v11 account:v14];

        if (!v12) {
          [(IMDChorosController *)self updateChatPropertiesIfRequiredForChat:v15 service:v7];
        }
        uint64_t v16 = [(IMDChorosController *)self _generateLocationUpdateSentStatusItemForChat:v15];
        int v17 = [v10 broadcasterForChatListeners];
        uint64_t v25 = [v10 account];
        __int16 v18 = [v25 accountID];
        uint64_t v19 = [v15 chatProperties];
        id v20 = [v15 groupID];
        BOOL v27 = v15;
        v21 = [v15 personCentricID];
        v26 = (void *)v16;
        [v17 account:v18 chat:v11 style:45 chatProperties:v19 groupID:v20 chatPersonCentricID:v21 messageReceived:v16];

        if (IMOSLoggingEnabled())
        {
          id v22 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v22, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)v28 = 0;
            _os_log_impl(&dword_1D967A000, v22, OS_LOG_TYPE_INFO, "Location update sent broadcasted to client", v28, 2u);
          }
        }
LABEL_25:

        goto LABEL_26;
      }
    }
    __int16 v11 = IMLogHandleForCategory();
    if (os_log_type_enabled(v11, OS_LOG_TYPE_ERROR)) {
      sub_1D9903EF4();
    }
    goto LABEL_25;
  }
  char v10 = IMLogHandleForCategory();
  if (os_log_type_enabled(v10, OS_LOG_TYPE_ERROR)) {
    sub_1D9903F5C();
  }
LABEL_26:
}

- (void)openStewieChatWithContext:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  id v5 = +[IMDChorosController serviceTypeKey];
  id v6 = [v4 objectForKeyedSubscript:v5];

  uint64_t v7 = [v6 integerValue];
  if (!+[IMDChorosController supportsService:v7])
  {
    int v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1D9903FF8();
    }
    goto LABEL_8;
  }
  if (v7 != 8)
  {
    if (v7 == 1)
    {
      uint64_t v8 = +[IMDChorosController chatIdentifierForEmergency];
      if (v8) {
        goto LABEL_5;
      }
    }
    goto LABEL_11;
  }
  char v10 = [v4 objectForKeyedSubscript:*MEMORY[0x1E4F24278]];
  __int16 v11 = v10;
  if (!v10)
  {
    int v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1D9903FC4();
    }
LABEL_8:

    goto LABEL_18;
  }
  uint64_t v8 = +[IMDChorosController chatIdentifierForRoadside:](IMDChorosController, "chatIdentifierForRoadside:", [v10 integerValue]);

  if (v8)
  {
LABEL_5:
    [(IMDChorosController *)self _openStewieChatWithChatIdentifier:v8];

    goto LABEL_18;
  }
LABEL_11:
  BOOL v12 = NSString;
  uint64_t v13 = IMFileLocationTrimFileName();
  char v14 = [NSString stringWithFormat:@"openStewieChatWithContext: Chat identifier cannot be nil if we got here"];
  uint64_t v15 = [v12 stringWithFormat:@"Unexpected false '%@' in %s at %s:%d. %@", @"NO", "-[IMDChorosController openStewieChatWithContext:]", v13, 937, v14];

  uint64_t v16 = (void (*)(void *))IMGetAssertionFailureHandler();
  if (v16)
  {
    v16(v15);
  }
  else if (IMOSLoggingEnabled())
  {
    int v17 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v17, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      uint64_t v19 = v15;
      _os_log_impl(&dword_1D967A000, v17, OS_LOG_TYPE_INFO, "ASSERTION FAILED: %@", buf, 0xCu);
    }
  }
LABEL_18:
}

- (void)processReceivedEmergencyMessageFromIMTool:(int64_t)a3 message:(id)a4
{
  id v6 = a4;
  uint64_t v7 = +[IMDAccountController sharedInstance];
  uint64_t v8 = [v7 anySessionForServiceName:*MEMORY[0x1E4F6E1A0]];

  int v9 = +[IMDChorosController chatIdentifierForEmergency];
  [(IMDChorosController *)self _createChatIfNecessary:v8 chatIdentifier:v9 service:1];

  char v10 = +[IMDChorosController conversationIDDefaultsKeyForService:1];
  uint64_t v11 = IMGetDomainIntForKey();

  if (v11 < 0)
  {
    uint64_t v11 = arc4random_uniform(0xFAu);
    BOOL v12 = +[IMDChorosController conversationIDDefaultsKeyForService:1];
    IMSetDomainIntForKey();
  }
  uint64_t v13 = (__CFString *)v6;
  uint64_t v24 = v13;
  if (a3 == -1)
  {
    char v14 = +[IMDChorosController outgoingSequenceNumberDefaultsKeyForService:1];
    uint64_t v15 = IMGetDomainIntForKey();
    uint64_t v16 = v15 + 0x2000;
    if (v15 >= -1) {
      uint64_t v16 = v15 + 1;
    }
    a3 = v16 >> 13;

    int v17 = +[IMDChorosController outgoingSequenceNumberDefaultsKeyForService:1];
    IMSetDomainIntForKey();

    uint64_t v13 = v24;
  }
  if (v13) {
    __int16 v18 = v13;
  }
  else {
    __int16 v18 = @"Are you still breathing?";
  }
  uint64_t v19 = (void *)[objc_alloc(MEMORY[0x1E4F23A38]) initWithConversationID:v11 sequenceNum:a3 emergencyText:v18 error:0];
  uint64_t v20 = +[IMDChorosController chatIdentifierForEmergency];
  uint64_t v21 = [v19 conversationID];
  uint64_t v22 = [v19 sequenceNum];
  v23 = [v19 text];
  [(IMDChorosController *)self _processReceivedTextMessageForService:1 chatIdentifier:v20 conversationID:v21 sequenceNum:v22 text:v23];
}

+ (id)chatIdentifierForEmergency
{
  return (id)*MEMORY[0x1E4F6E348];
}

+ (id)chatIdentifierForRoadside:(int64_t)a3
{
  return (id)[NSString stringWithFormat:@"%@:%lld", *MEMORY[0x1E4F6E350], a3];
}

+ (id)roadsideProviderIDFromChatIdentifier:(id)a3
{
  id v3 = a3;
  if (+[IMDChorosController serviceFromChatIdentifier:v3] == 8)
  {
    id v4 = [v3 componentsSeparatedByString:@":"];
    if ((unint64_t)[v4 count] >= 3)
    {
      id v6 = objc_opt_new();
      uint64_t v7 = [v4 objectAtIndexedSubscript:2];
      id v5 = [v6 numberFromString:v7];
    }
    else
    {
      id v5 = 0;
    }
  }
  else
  {
    id v5 = 0;
  }

  return v5;
}

- (id)roadsideProviderForProviderId:(int64_t)a3
{
  id v4 = objc_alloc(MEMORY[0x1E4F23A80]);
  id v5 = (void *)[v4 initWithQueue:MEMORY[0x1E4F14428]];
  id v6 = objc_opt_new();
  id v13 = 0;
  uint64_t v7 = [v5 fetchRoadsideProvidersWithContext:v6 error:&v13];
  id v8 = v13;

  if (v8)
  {
    int v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1D9904094();
    }
LABEL_4:
    char v10 = 0;
    goto LABEL_7;
  }
  if (!v7)
  {
    int v9 = IMLogHandleForCategory();
    if (os_log_type_enabled(v9, OS_LOG_TYPE_ERROR)) {
      sub_1D9904060();
    }
    goto LABEL_4;
  }
  int v9 = [v7 providers];
  uint64_t v11 = [NSNumber numberWithInteger:a3];
  char v10 = [v9 objectForKeyedSubscript:v11];

LABEL_7:

  return v10;
}

- (id)roadsideProviderForChatIdentifier:(id)a3
{
  if (a3)
  {
    id v4 = +[IMDChorosController roadsideProviderIDFromChatIdentifier:](IMDChorosController, "roadsideProviderIDFromChatIdentifier:");
    id v5 = v4;
    if (v4)
    {
      id v6 = -[IMDChorosController roadsideProviderForProviderId:](self, "roadsideProviderForProviderId:", [v4 integerValue]);
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

+ (int64_t)serviceFromChatIdentifier:(id)a3
{
  id v3 = a3;
  if (IMIsStringStewieEmergency())
  {
    int64_t v4 = 1;
  }
  else if (IMIsStringStewieRoadside())
  {
    int64_t v4 = 8;
  }
  else
  {
    int64_t v4 = 0;
  }

  return v4;
}

- (BOOL)_createChatIfNecessary:(id)a3 chatIdentifier:(id)a4 service:(int64_t)a5
{
  uint64_t v30 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  id v9 = a4;
  char v10 = +[IMDChatRegistry sharedInstance];
  uint64_t v11 = [v8 account];
  BOOL v12 = [v10 existingChatForID:v9 account:v11];

  if (IMOSLoggingEnabled())
  {
    id v13 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
    {
      char v14 = @"YES";
      if (!v12) {
        char v14 = @"NO";
      }
      *(_DWORD *)buf = 138412546;
      id v27 = v9;
      __int16 v28 = 2112;
      id v29 = v14;
      _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Found existing Stewie %@ chat: %@", buf, 0x16u);
    }
  }
  if (!v12)
  {
    uint64_t v15 = *MEMORY[0x1E4F6C5C8];
    v24[0] = *MEMORY[0x1E4F6C458];
    v24[1] = v15;
    v25[0] = &unk_1F33C5CE8;
    v25[1] = v9;
    uint64_t v16 = *MEMORY[0x1E4F6C5A0];
    v24[2] = *MEMORY[0x1E4F6C648];
    v24[3] = v16;
    v25[2] = v9;
    v25[3] = @"us";
    int v17 = [MEMORY[0x1E4F1C9E8] dictionaryWithObjects:v25 forKeys:v24 count:4];
    v23 = v17;
    __int16 v18 = [MEMORY[0x1E4F1C978] arrayWithObjects:&v23 count:1];
    [v8 didJoinChat:v9 style:45 displayName:0 groupID:0 originalGroupID:0 handleInfo:v18 category:0 spamExtensionName:0];
    uint64_t v19 = +[IMDChatRegistry sharedInstance];
    uint64_t v20 = [v8 account];
    uint64_t v21 = [v19 existingChatWithIdentifier:v9 account:v20];

    [v21 updateIsEmergencyChat:a5 == 1];
    [v21 updateIsFiltered:0];
    [(IMDChorosController *)self updateChatPropertiesIfRequiredForChat:v21 service:a5];
  }
  return v12 == 0;
}

- (id)_simNumber
{
  uint64_t v10 = *MEMORY[0x1E4F143B8];
  v2 = [MEMORY[0x1E4F6E668] sharedInstance];
  id v3 = [v2 ctPhoneNumber];

  if (IMOSLoggingEnabled())
  {
    int64_t v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "My CT Phone Number from subscription context is: %@", (uint8_t *)&v8, 0xCu);
    }
  }
  id v5 = IMNormalizePhoneNumber();
  if (IMOSLoggingEnabled())
  {
    id v6 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v6, OS_LOG_TYPE_INFO))
    {
      int v8 = 138412290;
      id v9 = v5;
      _os_log_impl(&dword_1D967A000, v6, OS_LOG_TYPE_INFO, "My CT SIM Phone Number is: %@", (uint8_t *)&v8, 0xCu);
    }
  }

  return v5;
}

- (void)_openStewieChatWithChatIdentifier:(id)a3
{
  id v3 = a3;
  if (qword_1EA8CA5A0 != -1) {
    dispatch_once(&qword_1EA8CA5A0, &unk_1F3391920);
  }
  int64_t v4 = +[IMDAccountController sharedInstance];
  id v5 = [v4 anySessionForServiceName:*MEMORY[0x1E4F6E1A0]];

  id v6 = +[IMDChatRegistry sharedInstance];
  uint64_t v7 = [v5 account];
  int v8 = [v6 existingChatWithIdentifier:v3 account:v7];

  int v9 = IMOSLoggingEnabled();
  if (v8)
  {
    if (v9)
    {
      uint64_t v10 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v10, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v10, OS_LOG_TYPE_INFO, "Found an emergency chat, launching messages", buf, 2u);
      }
    }
    [NSString stringWithFormat:@"sms://open?groupid=%@", v3];
    uint64_t v11 = (__CFString *)objc_claimAutoreleasedReturnValue();
  }
  else
  {
    if (v9)
    {
      BOOL v12 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v12, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v15 = 0;
        _os_log_impl(&dword_1D967A000, v12, OS_LOG_TYPE_INFO, "No emergency chat found, launching Messages to conversation list", v15, 2u);
      }
    }
    uint64_t v11 = @"sms://compose=false";
  }
  id v13 = [(id)qword_1EA8CA598 defaultWorkspace];
  char v14 = [MEMORY[0x1E4F1CB10] URLWithString:v11];
  [v13 openURL:v14 configuration:0 completionHandler:0];
}

- (BOOL)isStewieActive
{
  id v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 stewieEnabled];

  if (!v4) {
    return 0;
  }
  id v5 = [(CTStewieDataClient *)self->_coreTelephonyStewieClient getState];
  char v6 = 1;
  if (([v5 isActiveService:1] & 1) == 0) {
    char v6 = [v5 isActiveService:8];
  }

  return v6;
}

- (BOOL)isSatelliteConnectionActive
{
  id v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isCarrierPigeonEnabled];

  if (!v4) {
    return 0;
  }
  if (IMGetCachedDomainBoolForKeyWithDefaultValue()) {
    return 1;
  }
  char v6 = [(CTStewieDataClient *)self->_coreTelephonyStewieClient getState];
  char v7 = [v6 activeServices];
  uint64_t v8 = [v6 transportType];
  BOOL v5 = (v7 & 0x39) != 0 && v8 == 1;

  return v5;
}

- (BOOL)isLiteMessageActiveOverSatellite
{
  id v3 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v4 = [v3 isCarrierPigeonEnabled];

  if (!v4) {
    return 0;
  }
  if (IMGetCachedDomainBoolForKeyWithDefaultValue()) {
    return 1;
  }
  char v6 = [(CTStewieDataClient *)self->_coreTelephonyStewieClient getState];
  if ([v6 isActiveService:16]) {
    char v5 = [v6 isStewieActiveOverBB];
  }
  else {
    char v5 = 0;
  }

  return v5;
}

- (id)_generateStopTranscriptSharingStatusItemForChat:(id)a3
{
  id v3 = a3;
  int v4 = v3;
  if (!v3)
  {
    if (!IMOSLoggingEnabled())
    {
LABEL_14:
      uint64_t v16 = 0;
      goto LABEL_15;
    }
    uint64_t v19 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)buf = 0;
      _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "generateStopTranscriptSharingStatusItemForChat passed a nil chat, early returning nil", buf, 2u);
    }
LABEL_13:

    goto LABEL_14;
  }
  if (([v3 isStewieEmergencyChat] & 1) == 0)
  {
    uint64_t v19 = IMLogHandleForCategory();
    if (os_log_type_enabled(v19, OS_LOG_TYPE_ERROR)) {
      sub_1D99040FC(v4);
    }
    goto LABEL_13;
  }
  if (IMOSLoggingEnabled())
  {
    char v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_WORD *)uint64_t v21 = 0;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Generating a Stewie stop sharing item", v21, 2u);
    }
  }
  id v6 = objc_alloc(MEMORY[0x1E4F6EAA0]);
  char v7 = +[IMDChorosController chatIdentifierForEmergency];
  uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
  int v9 = [NSString stringGUID];
  uint64_t v10 = (void *)[v6 initWithSender:v7 time:v8 guid:v9 type:7];

  [v10 setService:*MEMORY[0x1E4F6E1A0]];
  uint64_t v11 = [v4 account];
  BOOL v12 = [v11 accountID];
  [v10 setAccountID:v12];

  id v13 = [v4 account];
  char v14 = [v13 loginID];
  [v10 setAccount:v14];

  uint64_t v15 = +[IMDMessageStore sharedInstance];
  uint64_t v16 = [v15 storeItem:v10 forceReplace:0];

  int v17 = +[IMDChatStore sharedInstance];
  __int16 v18 = [v16 guid];
  [v17 addMessageWithGUID:v18 toChat:v4];

LABEL_15:

  return v16;
}

- (id)_generateLocationUpdateSentStatusItemForChat:(id)a3
{
  id v3 = a3;
  int v4 = IMOSLoggingEnabled();
  if (v3)
  {
    if (v4)
    {
      char v5 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)uint64_t v21 = 0;
        _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Generating a Stewie location update item", v21, 2u);
      }
    }
    id v6 = objc_alloc(MEMORY[0x1E4F6E808]);
    char v7 = [v3 chatIdentifier];
    uint64_t v8 = [MEMORY[0x1E4F1C9C8] date];
    int v9 = [NSString stringGUID];
    uint64_t v10 = (void *)[v6 initWithSender:v7 time:v8 guid:v9 type:8];

    [v10 setService:*MEMORY[0x1E4F6E1A0]];
    uint64_t v11 = [v3 account];
    BOOL v12 = [v11 accountID];
    [v10 setAccountID:v12];

    id v13 = [v3 account];
    char v14 = [v13 loginID];
    [v10 setAccount:v14];

    uint64_t v15 = +[IMDMessageStore sharedInstance];
    uint64_t v16 = [v15 storeItem:v10 forceReplace:0];

    int v17 = +[IMDChatStore sharedInstance];
    __int16 v18 = [v16 guid];
    [v17 addMessageWithGUID:v18 toChat:v3];
  }
  else
  {
    if (v4)
    {
      uint64_t v19 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v19, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v19, OS_LOG_TYPE_INFO, "generateLocationUpdateSentStatusItemForChat passed a nil chat, early returning nil", buf, 2u);
      }
    }
    uint64_t v16 = 0;
  }

  return v16;
}

- (id)conversationIDToConversationUUIDMapForService:(int64_t)a3
{
  id v3 = +[IMDChorosController conversationIDToUUIDsDefaultsKeyForService:a3];
  int v4 = IMGetCachedDomainValueForKey();

  return v4;
}

- (void)setConversationIDToConversationUUIDMap:(id)a3 forService:(int64_t)a4
{
  id v5 = a3;
  id v6 = +[IMDChorosController conversationIDToUUIDsDefaultsKeyForService:a4];
  IMSetDomainValueForKey();
}

- (id)_stringKeyForConversationID:(int64_t)a3
{
  return (id)objc_msgSend(NSString, "stringWithFormat:", @"%lld", a3);
}

- (id)conversationUUIDForConversationID:(int64_t)a3 service:(int64_t)a4
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  char v7 = -[IMDChorosController _stringKeyForConversationID:](self, "_stringKeyForConversationID:");
  uint64_t v8 = [(IMDChorosController *)self conversationIDToConversationUUIDMapForService:a4];
  int v9 = [v8 objectForKeyedSubscript:v7];

  if (!v9 || (uint64_t v10 = (void *)[objc_alloc(MEMORY[0x1E4F29128]) initWithUUIDString:v9]) == 0)
  {
    uint64_t v10 = [MEMORY[0x1E4F29128] UUID];
    [(IMDChorosController *)self setConversationUUID:v10 forConversationID:a3 service:a4];
    if (IMOSLoggingEnabled())
    {
      uint64_t v11 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v11, OS_LOG_TYPE_INFO))
      {
        BOOL v12 = [NSNumber numberWithInteger:a3];
        int v14 = 138412802;
        uint64_t v15 = v12;
        __int16 v16 = 2112;
        int v17 = v7;
        __int16 v18 = 2112;
        uint64_t v19 = v10;
        _os_log_impl(&dword_1D967A000, v11, OS_LOG_TYPE_INFO, "No existing conversationUUID for conversationID %@ (key %@), assigning %@", (uint8_t *)&v14, 0x20u);
      }
    }
  }

  return v10;
}

- (void)setConversationUUID:(id)a3 forConversationID:(int64_t)a4 service:(int64_t)a5
{
  uint64_t v24 = *MEMORY[0x1E4F143B8];
  id v8 = a3;
  int v9 = [(IMDChorosController *)self conversationIDToConversationUUIDMapForService:a5];
  uint64_t v10 = (void *)[v9 mutableCopy];
  uint64_t v11 = v10;
  if (v10) {
    id v12 = v10;
  }
  else {
    id v12 = objc_alloc_init(MEMORY[0x1E4F1CA60]);
  }
  id v13 = v12;

  int v14 = [(IMDChorosController *)self _stringKeyForConversationID:a4];
  uint64_t v15 = [v8 UUIDString];
  [v13 setObject:v15 forKeyedSubscript:v14];

  [(IMDChorosController *)self setConversationIDToConversationUUIDMap:v13 forService:a5];
  if (IMOSLoggingEnabled())
  {
    __int16 v16 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v16, OS_LOG_TYPE_INFO))
    {
      int v17 = [NSNumber numberWithInteger:a4];
      int v18 = 138412802;
      id v19 = v8;
      __int16 v20 = 2112;
      uint64_t v21 = v17;
      __int16 v22 = 2112;
      v23 = v14;
      _os_log_impl(&dword_1D967A000, v16, OS_LOG_TYPE_INFO, "Assigning conversationUUID %@ to conversationID %@ (key %@)", (uint8_t *)&v18, 0x20u);
    }
  }
}

- (void)connectedServicesChanged:(int64_t)a3
{
  uint64_t v7 = *MEMORY[0x1E4F143B8];
  if (IMOSLoggingEnabled())
  {
    int v4 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v4, OS_LOG_TYPE_INFO))
    {
      int v5 = 134217984;
      int64_t v6 = a3;
      _os_log_impl(&dword_1D967A000, v4, OS_LOG_TYPE_INFO, "Connected services: %ld", (uint8_t *)&v5, 0xCu);
    }
  }
}

- (void)stateChanged:(id)a3
{
  uint64_t v20 = *MEMORY[0x1E4F143B8];
  id v4 = a3;
  if (IMOSLoggingEnabled())
  {
    int v5 = OSLogHandleForIMFoundationCategory();
    if (os_log_type_enabled(v5, OS_LOG_TYPE_INFO))
    {
      *(_DWORD *)buf = 138412290;
      id v19 = v4;
      _os_log_impl(&dword_1D967A000, v5, OS_LOG_TYPE_INFO, "Stewie state changed to: %@", buf, 0xCu);
    }
  }
  long long v15 = 0u;
  long long v16 = 0u;
  long long v13 = 0u;
  long long v14 = 0u;
  int64_t v6 = self->_observers;
  uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
  if (v7)
  {
    uint64_t v8 = *(void *)v14;
    do
    {
      uint64_t v9 = 0;
      do
      {
        if (*(void *)v14 != v8) {
          objc_enumerationMutation(v6);
        }
        uint64_t v10 = *(void **)(*((void *)&v13 + 1) + 8 * v9);
        if (objc_opt_respondsToSelector()) {
          objc_msgSend(v10, "satelliteStateDidChange:", -[IMDChorosController isSatelliteConnectionActive](self, "isSatelliteConnectionActive", (void)v13));
        }
        ++v9;
      }
      while (v7 != v9);
      uint64_t v7 = [(NSMutableSet *)v6 countByEnumeratingWithState:&v13 objects:v17 count:16];
    }
    while (v7);
  }

  if ([(IMDChorosController *)self isSatelliteConnectionActive]
    && ![(IMDChorosController *)self wasLastStateSatelliteConnectionActive])
  {
    [(IMDChorosController *)self setWasLastStateSatelliteConnectionActive:1];
    uint64_t v11 = [MEMORY[0x1E4F1CB18] messagesAppDomain];
    [v11 setInteger:0 forKey:*MEMORY[0x1E4F6E428]];

    id v12 = [MEMORY[0x1E4F1CB18] messagesAppDomain];
    [v12 setInteger:0 forKey:*MEMORY[0x1E4F6DEB8]];
  }
  else
  {
    -[IMDChorosController setWasLastStateSatelliteConnectionActive:](self, "setWasLastStateSatelliteConnectionActive:", 0, (void)v13);
  }
}

- (void)messageReceived:(id)a3 withMetadata:(id)a4 completionBlock:(id)a5
{
  id v8 = a3;
  id v9 = a4;
  uint64_t v10 = (void (**)(void))a5;
  uint64_t v11 = [MEMORY[0x1E4F6E778] sharedFeatureFlags];
  int v12 = [v11 stewieEnabled];

  if (v12)
  {
    if (IMOSLoggingEnabled())
    {
      long long v13 = OSLogHandleForIMFoundationCategory();
      if (os_log_type_enabled(v13, OS_LOG_TYPE_INFO))
      {
        *(_WORD *)buf = 0;
        _os_log_impl(&dword_1D967A000, v13, OS_LOG_TYPE_INFO, "Received message from Stewie", buf, 2u);
      }
    }
    objc_opt_class();
    if (objc_opt_isKindOfClass())
    {
      if (IMOSLoggingEnabled())
      {
        long long v14 = OSLogHandleForIMFoundationCategory();
        if (os_log_type_enabled(v14, OS_LOG_TYPE_INFO))
        {
          *(_WORD *)buf = 0;
          _os_log_impl(&dword_1D967A000, v14, OS_LOG_TYPE_INFO, "Processing received Stewie emergency message", buf, 2u);
        }
      }
      long long v15 = v8;
      if ([MEMORY[0x1E4F29060] isMainThread])
      {
        long long v16 = +[IMDChorosController chatIdentifierForEmergency];
        uint64_t v17 = [v15 conversationID];
        uint64_t v18 = [v15 sequenceNum];
        id v19 = [v15 text];
        [(IMDChorosController *)self _processReceivedTextMessageForService:1 chatIdentifier:v16 conversationID:v17 sequenceNum:v18 text:v19];
      }
      else
      {
        v25[0] = MEMORY[0x1E4F143A8];
        v25[1] = 3221225472;
        v25[2] = sub_1D97D24D8;
        v25[3] = &unk_1E6B73218;
        void v25[4] = self;
        long long v15 = v15;
        v26 = v15;
        dispatch_sync(MEMORY[0x1E4F14428], v25);
      }
    }
    else
    {
      objc_opt_class();
      if (objc_opt_isKindOfClass())
      {
        if (IMOSLoggingEnabled())
        {
          uint64_t v20 = OSLogHandleForIMFoundationCategory();
          if (os_log_type_enabled(v20, OS_LOG_TYPE_INFO))
          {
            *(_WORD *)buf = 0;
            _os_log_impl(&dword_1D967A000, v20, OS_LOG_TYPE_INFO, "Processing received Stewie Roadside Text Message", buf, 2u);
          }
        }
        id v21 = v8;
        dispatch_assert_queue_V2(MEMORY[0x1E4F14428]);
        long long v15 = +[IMDChorosController chatIdentifierForRoadside:](IMDChorosController, "chatIdentifierForRoadside:", [v21 providerId]);
        uint64_t v22 = [v21 conversationID];
        uint64_t v23 = [v21 sequenceNum];
        uint64_t v24 = [v21 text];

        [(IMDChorosController *)self _processReceivedTextMessageForService:8 chatIdentifier:v15 conversationID:v22 sequenceNum:v23 text:v24];
      }
      else
      {
        long long v15 = IMLogHandleForCategory();
        if (os_log_type_enabled(v15, OS_LOG_TYPE_ERROR)) {
          sub_1D9904184();
        }
      }
    }

    v10[2](v10);
  }
}

- (void)addObserver:(id)a3
{
  if (a3) {
    -[NSMutableSet addObject:](self->_observers, "addObject:");
  }
}

- (void)setStewieActive:(BOOL)a3
{
  self->_stewieActive = a3;
}

- (void)setSatelliteConnectionActive:(BOOL)a3
{
  self->_satelliteConnectionActive = a3;
}

- (void)setLiteMessageActiveOverSatellite:(BOOL)a3
{
  self->_liteMessageActiveOverSatellite = a3;
}

- (CTStewieDataClient)coreTelephonyStewieClient
{
  return self->_coreTelephonyStewieClient;
}

- (void)setCoreTelephonyStewieClient:(id)a3
{
}

- (NSMutableSet)observers
{
  return self->_observers;
}

- (void)setObservers:(id)a3
{
}

- (BOOL)wasLastStateSatelliteConnectionActive
{
  return self->_wasLastStateSatelliteConnectionActive;
}

- (void)setWasLastStateSatelliteConnectionActive:(BOOL)a3
{
  self->_wasLastStateSatelliteConnectionActive = a3;
}

- (void).cxx_destruct
{
  objc_storeStrong((id *)&self->_observers, 0);

  objc_storeStrong((id *)&self->_coreTelephonyStewieClient, 0);
}

@end